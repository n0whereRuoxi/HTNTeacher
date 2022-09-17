( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) )
    :subtasks
    (  )
  )

  ( :method GET-2IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) )
    :subtasks
    (  )
  )

  ( :method GET-3IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12857 - DIRECTION
      ?auto_12858 - MODE
    )
    :vars
    (
      ?auto_12859 - INSTRUMENT
      ?auto_12860 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_12859 ) ( ON_BOARD ?auto_12859 ?auto_12860 ) ( SUPPORTS ?auto_12859 ?auto_12858 ) ( POWER_ON ?auto_12859 ) ( POINTING ?auto_12860 ?auto_12857 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_12860 ?auto_12857 ?auto_12859 ?auto_12858 )
      ( GET-1IMAGE-VERIFY ?auto_12857 ?auto_12858 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12875 - DIRECTION
      ?auto_12876 - MODE
    )
    :vars
    (
      ?auto_12877 - INSTRUMENT
      ?auto_12878 - SATELLITE
      ?auto_12879 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_12877 ) ( ON_BOARD ?auto_12877 ?auto_12878 ) ( SUPPORTS ?auto_12877 ?auto_12876 ) ( POWER_ON ?auto_12877 ) ( POINTING ?auto_12878 ?auto_12879 ) ( not ( = ?auto_12875 ?auto_12879 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_12878 ?auto_12875 ?auto_12879 )
      ( GET-1IMAGE ?auto_12875 ?auto_12876 )
      ( GET-1IMAGE-VERIFY ?auto_12875 ?auto_12876 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12896 - DIRECTION
      ?auto_12897 - MODE
    )
    :vars
    (
      ?auto_12900 - INSTRUMENT
      ?auto_12899 - SATELLITE
      ?auto_12898 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_12900 ?auto_12899 ) ( SUPPORTS ?auto_12900 ?auto_12897 ) ( POWER_ON ?auto_12900 ) ( POINTING ?auto_12899 ?auto_12898 ) ( not ( = ?auto_12896 ?auto_12898 ) ) ( CALIBRATION_TARGET ?auto_12900 ?auto_12898 ) ( NOT_CALIBRATED ?auto_12900 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_12899 ?auto_12900 ?auto_12898 )
      ( GET-1IMAGE ?auto_12896 ?auto_12897 )
      ( GET-1IMAGE-VERIFY ?auto_12896 ?auto_12897 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12917 - DIRECTION
      ?auto_12918 - MODE
    )
    :vars
    (
      ?auto_12920 - INSTRUMENT
      ?auto_12921 - SATELLITE
      ?auto_12919 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_12920 ?auto_12921 ) ( SUPPORTS ?auto_12920 ?auto_12918 ) ( POINTING ?auto_12921 ?auto_12919 ) ( not ( = ?auto_12917 ?auto_12919 ) ) ( CALIBRATION_TARGET ?auto_12920 ?auto_12919 ) ( POWER_AVAIL ?auto_12921 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_12920 ?auto_12921 )
      ( GET-1IMAGE ?auto_12917 ?auto_12918 )
      ( GET-1IMAGE-VERIFY ?auto_12917 ?auto_12918 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12938 - DIRECTION
      ?auto_12939 - MODE
    )
    :vars
    (
      ?auto_12942 - INSTRUMENT
      ?auto_12940 - SATELLITE
      ?auto_12941 - DIRECTION
      ?auto_12943 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_12942 ?auto_12940 ) ( SUPPORTS ?auto_12942 ?auto_12939 ) ( not ( = ?auto_12938 ?auto_12941 ) ) ( CALIBRATION_TARGET ?auto_12942 ?auto_12941 ) ( POWER_AVAIL ?auto_12940 ) ( POINTING ?auto_12940 ?auto_12943 ) ( not ( = ?auto_12941 ?auto_12943 ) ) ( not ( = ?auto_12938 ?auto_12943 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_12940 ?auto_12941 ?auto_12943 )
      ( GET-1IMAGE ?auto_12938 ?auto_12939 )
      ( GET-1IMAGE-VERIFY ?auto_12938 ?auto_12939 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13023 - DIRECTION
      ?auto_13024 - MODE
      ?auto_13025 - DIRECTION
      ?auto_13022 - MODE
    )
    :vars
    (
      ?auto_13026 - INSTRUMENT
      ?auto_13027 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_13026 ) ( ON_BOARD ?auto_13026 ?auto_13027 ) ( SUPPORTS ?auto_13026 ?auto_13022 ) ( POWER_ON ?auto_13026 ) ( POINTING ?auto_13027 ?auto_13025 ) ( HAVE_IMAGE ?auto_13023 ?auto_13024 ) ( not ( = ?auto_13023 ?auto_13025 ) ) ( not ( = ?auto_13024 ?auto_13022 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13025 ?auto_13022 )
      ( GET-2IMAGE-VERIFY ?auto_13023 ?auto_13024 ?auto_13025 ?auto_13022 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13029 - DIRECTION
      ?auto_13030 - MODE
      ?auto_13031 - DIRECTION
      ?auto_13028 - MODE
    )
    :vars
    (
      ?auto_13032 - INSTRUMENT
      ?auto_13033 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_13032 ) ( ON_BOARD ?auto_13032 ?auto_13033 ) ( SUPPORTS ?auto_13032 ?auto_13030 ) ( POWER_ON ?auto_13032 ) ( POINTING ?auto_13033 ?auto_13029 ) ( HAVE_IMAGE ?auto_13031 ?auto_13028 ) ( not ( = ?auto_13029 ?auto_13031 ) ) ( not ( = ?auto_13030 ?auto_13028 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13029 ?auto_13030 )
      ( GET-2IMAGE-VERIFY ?auto_13029 ?auto_13030 ?auto_13031 ?auto_13028 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13041 - DIRECTION
      ?auto_13042 - MODE
      ?auto_13043 - DIRECTION
      ?auto_13040 - MODE
      ?auto_13044 - DIRECTION
      ?auto_13045 - MODE
    )
    :vars
    (
      ?auto_13046 - INSTRUMENT
      ?auto_13047 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_13046 ) ( ON_BOARD ?auto_13046 ?auto_13047 ) ( SUPPORTS ?auto_13046 ?auto_13045 ) ( POWER_ON ?auto_13046 ) ( POINTING ?auto_13047 ?auto_13044 ) ( HAVE_IMAGE ?auto_13041 ?auto_13042 ) ( HAVE_IMAGE ?auto_13043 ?auto_13040 ) ( not ( = ?auto_13041 ?auto_13043 ) ) ( not ( = ?auto_13041 ?auto_13044 ) ) ( not ( = ?auto_13042 ?auto_13040 ) ) ( not ( = ?auto_13042 ?auto_13045 ) ) ( not ( = ?auto_13043 ?auto_13044 ) ) ( not ( = ?auto_13040 ?auto_13045 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13044 ?auto_13045 )
      ( GET-3IMAGE-VERIFY ?auto_13041 ?auto_13042 ?auto_13043 ?auto_13040 ?auto_13044 ?auto_13045 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13049 - DIRECTION
      ?auto_13050 - MODE
      ?auto_13051 - DIRECTION
      ?auto_13048 - MODE
      ?auto_13052 - DIRECTION
      ?auto_13053 - MODE
    )
    :vars
    (
      ?auto_13054 - INSTRUMENT
      ?auto_13055 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_13054 ) ( ON_BOARD ?auto_13054 ?auto_13055 ) ( SUPPORTS ?auto_13054 ?auto_13048 ) ( POWER_ON ?auto_13054 ) ( POINTING ?auto_13055 ?auto_13051 ) ( HAVE_IMAGE ?auto_13049 ?auto_13050 ) ( HAVE_IMAGE ?auto_13052 ?auto_13053 ) ( not ( = ?auto_13049 ?auto_13051 ) ) ( not ( = ?auto_13049 ?auto_13052 ) ) ( not ( = ?auto_13050 ?auto_13048 ) ) ( not ( = ?auto_13050 ?auto_13053 ) ) ( not ( = ?auto_13051 ?auto_13052 ) ) ( not ( = ?auto_13048 ?auto_13053 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13051 ?auto_13048 )
      ( GET-3IMAGE-VERIFY ?auto_13049 ?auto_13050 ?auto_13051 ?auto_13048 ?auto_13052 ?auto_13053 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13065 - DIRECTION
      ?auto_13066 - MODE
      ?auto_13067 - DIRECTION
      ?auto_13064 - MODE
      ?auto_13068 - DIRECTION
      ?auto_13069 - MODE
    )
    :vars
    (
      ?auto_13070 - INSTRUMENT
      ?auto_13071 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_13070 ) ( ON_BOARD ?auto_13070 ?auto_13071 ) ( SUPPORTS ?auto_13070 ?auto_13066 ) ( POWER_ON ?auto_13070 ) ( POINTING ?auto_13071 ?auto_13065 ) ( HAVE_IMAGE ?auto_13067 ?auto_13064 ) ( HAVE_IMAGE ?auto_13068 ?auto_13069 ) ( not ( = ?auto_13065 ?auto_13067 ) ) ( not ( = ?auto_13065 ?auto_13068 ) ) ( not ( = ?auto_13066 ?auto_13064 ) ) ( not ( = ?auto_13066 ?auto_13069 ) ) ( not ( = ?auto_13067 ?auto_13068 ) ) ( not ( = ?auto_13064 ?auto_13069 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13065 ?auto_13066 )
      ( GET-3IMAGE-VERIFY ?auto_13065 ?auto_13066 ?auto_13067 ?auto_13064 ?auto_13068 ?auto_13069 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13102 - DIRECTION
      ?auto_13103 - MODE
      ?auto_13104 - DIRECTION
      ?auto_13101 - MODE
    )
    :vars
    (
      ?auto_13107 - INSTRUMENT
      ?auto_13106 - SATELLITE
      ?auto_13105 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_13107 ) ( ON_BOARD ?auto_13107 ?auto_13106 ) ( SUPPORTS ?auto_13107 ?auto_13101 ) ( POWER_ON ?auto_13107 ) ( POINTING ?auto_13106 ?auto_13105 ) ( not ( = ?auto_13104 ?auto_13105 ) ) ( HAVE_IMAGE ?auto_13102 ?auto_13103 ) ( not ( = ?auto_13102 ?auto_13104 ) ) ( not ( = ?auto_13102 ?auto_13105 ) ) ( not ( = ?auto_13103 ?auto_13101 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13104 ?auto_13101 )
      ( GET-2IMAGE-VERIFY ?auto_13102 ?auto_13103 ?auto_13104 ?auto_13101 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13109 - DIRECTION
      ?auto_13110 - MODE
      ?auto_13111 - DIRECTION
      ?auto_13108 - MODE
    )
    :vars
    (
      ?auto_13112 - INSTRUMENT
      ?auto_13113 - SATELLITE
      ?auto_13114 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_13112 ) ( ON_BOARD ?auto_13112 ?auto_13113 ) ( SUPPORTS ?auto_13112 ?auto_13110 ) ( POWER_ON ?auto_13112 ) ( POINTING ?auto_13113 ?auto_13114 ) ( not ( = ?auto_13109 ?auto_13114 ) ) ( HAVE_IMAGE ?auto_13111 ?auto_13108 ) ( not ( = ?auto_13111 ?auto_13109 ) ) ( not ( = ?auto_13111 ?auto_13114 ) ) ( not ( = ?auto_13108 ?auto_13110 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13111 ?auto_13108 ?auto_13109 ?auto_13110 )
      ( GET-2IMAGE-VERIFY ?auto_13109 ?auto_13110 ?auto_13111 ?auto_13108 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13125 - DIRECTION
      ?auto_13126 - MODE
      ?auto_13127 - DIRECTION
      ?auto_13124 - MODE
      ?auto_13128 - DIRECTION
      ?auto_13129 - MODE
    )
    :vars
    (
      ?auto_13130 - INSTRUMENT
      ?auto_13131 - SATELLITE
      ?auto_13132 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_13130 ) ( ON_BOARD ?auto_13130 ?auto_13131 ) ( SUPPORTS ?auto_13130 ?auto_13129 ) ( POWER_ON ?auto_13130 ) ( POINTING ?auto_13131 ?auto_13132 ) ( not ( = ?auto_13128 ?auto_13132 ) ) ( HAVE_IMAGE ?auto_13125 ?auto_13124 ) ( not ( = ?auto_13125 ?auto_13128 ) ) ( not ( = ?auto_13125 ?auto_13132 ) ) ( not ( = ?auto_13124 ?auto_13129 ) ) ( HAVE_IMAGE ?auto_13125 ?auto_13126 ) ( HAVE_IMAGE ?auto_13127 ?auto_13124 ) ( not ( = ?auto_13125 ?auto_13127 ) ) ( not ( = ?auto_13126 ?auto_13124 ) ) ( not ( = ?auto_13126 ?auto_13129 ) ) ( not ( = ?auto_13127 ?auto_13128 ) ) ( not ( = ?auto_13127 ?auto_13132 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13125 ?auto_13124 ?auto_13128 ?auto_13129 )
      ( GET-3IMAGE-VERIFY ?auto_13125 ?auto_13126 ?auto_13127 ?auto_13124 ?auto_13128 ?auto_13129 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13134 - DIRECTION
      ?auto_13135 - MODE
      ?auto_13136 - DIRECTION
      ?auto_13133 - MODE
      ?auto_13137 - DIRECTION
      ?auto_13138 - MODE
    )
    :vars
    (
      ?auto_13139 - INSTRUMENT
      ?auto_13140 - SATELLITE
      ?auto_13141 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_13139 ) ( ON_BOARD ?auto_13139 ?auto_13140 ) ( SUPPORTS ?auto_13139 ?auto_13133 ) ( POWER_ON ?auto_13139 ) ( POINTING ?auto_13140 ?auto_13141 ) ( not ( = ?auto_13136 ?auto_13141 ) ) ( HAVE_IMAGE ?auto_13137 ?auto_13138 ) ( not ( = ?auto_13137 ?auto_13136 ) ) ( not ( = ?auto_13137 ?auto_13141 ) ) ( not ( = ?auto_13138 ?auto_13133 ) ) ( HAVE_IMAGE ?auto_13134 ?auto_13135 ) ( not ( = ?auto_13134 ?auto_13136 ) ) ( not ( = ?auto_13134 ?auto_13137 ) ) ( not ( = ?auto_13134 ?auto_13141 ) ) ( not ( = ?auto_13135 ?auto_13133 ) ) ( not ( = ?auto_13135 ?auto_13138 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13137 ?auto_13138 ?auto_13136 ?auto_13133 )
      ( GET-3IMAGE-VERIFY ?auto_13134 ?auto_13135 ?auto_13136 ?auto_13133 ?auto_13137 ?auto_13138 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13152 - DIRECTION
      ?auto_13153 - MODE
      ?auto_13154 - DIRECTION
      ?auto_13151 - MODE
      ?auto_13155 - DIRECTION
      ?auto_13156 - MODE
    )
    :vars
    (
      ?auto_13157 - INSTRUMENT
      ?auto_13158 - SATELLITE
      ?auto_13159 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_13157 ) ( ON_BOARD ?auto_13157 ?auto_13158 ) ( SUPPORTS ?auto_13157 ?auto_13153 ) ( POWER_ON ?auto_13157 ) ( POINTING ?auto_13158 ?auto_13159 ) ( not ( = ?auto_13152 ?auto_13159 ) ) ( HAVE_IMAGE ?auto_13154 ?auto_13151 ) ( not ( = ?auto_13154 ?auto_13152 ) ) ( not ( = ?auto_13154 ?auto_13159 ) ) ( not ( = ?auto_13151 ?auto_13153 ) ) ( HAVE_IMAGE ?auto_13155 ?auto_13156 ) ( not ( = ?auto_13152 ?auto_13155 ) ) ( not ( = ?auto_13153 ?auto_13156 ) ) ( not ( = ?auto_13154 ?auto_13155 ) ) ( not ( = ?auto_13151 ?auto_13156 ) ) ( not ( = ?auto_13155 ?auto_13159 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13154 ?auto_13151 ?auto_13152 ?auto_13153 )
      ( GET-3IMAGE-VERIFY ?auto_13152 ?auto_13153 ?auto_13154 ?auto_13151 ?auto_13155 ?auto_13156 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13189 - DIRECTION
      ?auto_13190 - MODE
    )
    :vars
    (
      ?auto_13193 - INSTRUMENT
      ?auto_13194 - SATELLITE
      ?auto_13195 - DIRECTION
      ?auto_13192 - DIRECTION
      ?auto_13191 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_13193 ?auto_13194 ) ( SUPPORTS ?auto_13193 ?auto_13190 ) ( POWER_ON ?auto_13193 ) ( POINTING ?auto_13194 ?auto_13195 ) ( not ( = ?auto_13189 ?auto_13195 ) ) ( HAVE_IMAGE ?auto_13192 ?auto_13191 ) ( not ( = ?auto_13192 ?auto_13189 ) ) ( not ( = ?auto_13192 ?auto_13195 ) ) ( not ( = ?auto_13191 ?auto_13190 ) ) ( CALIBRATION_TARGET ?auto_13193 ?auto_13195 ) ( NOT_CALIBRATED ?auto_13193 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_13194 ?auto_13193 ?auto_13195 )
      ( GET-2IMAGE ?auto_13192 ?auto_13191 ?auto_13189 ?auto_13190 )
      ( GET-1IMAGE-VERIFY ?auto_13189 ?auto_13190 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13197 - DIRECTION
      ?auto_13198 - MODE
      ?auto_13199 - DIRECTION
      ?auto_13196 - MODE
    )
    :vars
    (
      ?auto_13201 - INSTRUMENT
      ?auto_13200 - SATELLITE
      ?auto_13202 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13201 ?auto_13200 ) ( SUPPORTS ?auto_13201 ?auto_13196 ) ( POWER_ON ?auto_13201 ) ( POINTING ?auto_13200 ?auto_13202 ) ( not ( = ?auto_13199 ?auto_13202 ) ) ( HAVE_IMAGE ?auto_13197 ?auto_13198 ) ( not ( = ?auto_13197 ?auto_13199 ) ) ( not ( = ?auto_13197 ?auto_13202 ) ) ( not ( = ?auto_13198 ?auto_13196 ) ) ( CALIBRATION_TARGET ?auto_13201 ?auto_13202 ) ( NOT_CALIBRATED ?auto_13201 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13199 ?auto_13196 )
      ( GET-2IMAGE-VERIFY ?auto_13197 ?auto_13198 ?auto_13199 ?auto_13196 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13204 - DIRECTION
      ?auto_13205 - MODE
      ?auto_13206 - DIRECTION
      ?auto_13203 - MODE
    )
    :vars
    (
      ?auto_13209 - INSTRUMENT
      ?auto_13207 - SATELLITE
      ?auto_13208 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13209 ?auto_13207 ) ( SUPPORTS ?auto_13209 ?auto_13205 ) ( POWER_ON ?auto_13209 ) ( POINTING ?auto_13207 ?auto_13208 ) ( not ( = ?auto_13204 ?auto_13208 ) ) ( HAVE_IMAGE ?auto_13206 ?auto_13203 ) ( not ( = ?auto_13206 ?auto_13204 ) ) ( not ( = ?auto_13206 ?auto_13208 ) ) ( not ( = ?auto_13203 ?auto_13205 ) ) ( CALIBRATION_TARGET ?auto_13209 ?auto_13208 ) ( NOT_CALIBRATED ?auto_13209 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13206 ?auto_13203 ?auto_13204 ?auto_13205 )
      ( GET-2IMAGE-VERIFY ?auto_13204 ?auto_13205 ?auto_13206 ?auto_13203 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13220 - DIRECTION
      ?auto_13221 - MODE
      ?auto_13222 - DIRECTION
      ?auto_13219 - MODE
      ?auto_13223 - DIRECTION
      ?auto_13224 - MODE
    )
    :vars
    (
      ?auto_13227 - INSTRUMENT
      ?auto_13225 - SATELLITE
      ?auto_13226 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13227 ?auto_13225 ) ( SUPPORTS ?auto_13227 ?auto_13224 ) ( POWER_ON ?auto_13227 ) ( POINTING ?auto_13225 ?auto_13226 ) ( not ( = ?auto_13223 ?auto_13226 ) ) ( HAVE_IMAGE ?auto_13220 ?auto_13219 ) ( not ( = ?auto_13220 ?auto_13223 ) ) ( not ( = ?auto_13220 ?auto_13226 ) ) ( not ( = ?auto_13219 ?auto_13224 ) ) ( CALIBRATION_TARGET ?auto_13227 ?auto_13226 ) ( NOT_CALIBRATED ?auto_13227 ) ( HAVE_IMAGE ?auto_13220 ?auto_13221 ) ( HAVE_IMAGE ?auto_13222 ?auto_13219 ) ( not ( = ?auto_13220 ?auto_13222 ) ) ( not ( = ?auto_13221 ?auto_13219 ) ) ( not ( = ?auto_13221 ?auto_13224 ) ) ( not ( = ?auto_13222 ?auto_13223 ) ) ( not ( = ?auto_13222 ?auto_13226 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13220 ?auto_13219 ?auto_13223 ?auto_13224 )
      ( GET-3IMAGE-VERIFY ?auto_13220 ?auto_13221 ?auto_13222 ?auto_13219 ?auto_13223 ?auto_13224 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13229 - DIRECTION
      ?auto_13230 - MODE
      ?auto_13231 - DIRECTION
      ?auto_13228 - MODE
      ?auto_13232 - DIRECTION
      ?auto_13233 - MODE
    )
    :vars
    (
      ?auto_13236 - INSTRUMENT
      ?auto_13234 - SATELLITE
      ?auto_13235 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13236 ?auto_13234 ) ( SUPPORTS ?auto_13236 ?auto_13228 ) ( POWER_ON ?auto_13236 ) ( POINTING ?auto_13234 ?auto_13235 ) ( not ( = ?auto_13231 ?auto_13235 ) ) ( HAVE_IMAGE ?auto_13232 ?auto_13233 ) ( not ( = ?auto_13232 ?auto_13231 ) ) ( not ( = ?auto_13232 ?auto_13235 ) ) ( not ( = ?auto_13233 ?auto_13228 ) ) ( CALIBRATION_TARGET ?auto_13236 ?auto_13235 ) ( NOT_CALIBRATED ?auto_13236 ) ( HAVE_IMAGE ?auto_13229 ?auto_13230 ) ( not ( = ?auto_13229 ?auto_13231 ) ) ( not ( = ?auto_13229 ?auto_13232 ) ) ( not ( = ?auto_13229 ?auto_13235 ) ) ( not ( = ?auto_13230 ?auto_13228 ) ) ( not ( = ?auto_13230 ?auto_13233 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13232 ?auto_13233 ?auto_13231 ?auto_13228 )
      ( GET-3IMAGE-VERIFY ?auto_13229 ?auto_13230 ?auto_13231 ?auto_13228 ?auto_13232 ?auto_13233 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13247 - DIRECTION
      ?auto_13248 - MODE
      ?auto_13249 - DIRECTION
      ?auto_13246 - MODE
      ?auto_13250 - DIRECTION
      ?auto_13251 - MODE
    )
    :vars
    (
      ?auto_13254 - INSTRUMENT
      ?auto_13252 - SATELLITE
      ?auto_13253 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13254 ?auto_13252 ) ( SUPPORTS ?auto_13254 ?auto_13248 ) ( POWER_ON ?auto_13254 ) ( POINTING ?auto_13252 ?auto_13253 ) ( not ( = ?auto_13247 ?auto_13253 ) ) ( HAVE_IMAGE ?auto_13249 ?auto_13251 ) ( not ( = ?auto_13249 ?auto_13247 ) ) ( not ( = ?auto_13249 ?auto_13253 ) ) ( not ( = ?auto_13251 ?auto_13248 ) ) ( CALIBRATION_TARGET ?auto_13254 ?auto_13253 ) ( NOT_CALIBRATED ?auto_13254 ) ( HAVE_IMAGE ?auto_13249 ?auto_13246 ) ( HAVE_IMAGE ?auto_13250 ?auto_13251 ) ( not ( = ?auto_13247 ?auto_13250 ) ) ( not ( = ?auto_13248 ?auto_13246 ) ) ( not ( = ?auto_13249 ?auto_13250 ) ) ( not ( = ?auto_13246 ?auto_13251 ) ) ( not ( = ?auto_13250 ?auto_13253 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13249 ?auto_13251 ?auto_13247 ?auto_13248 )
      ( GET-3IMAGE-VERIFY ?auto_13247 ?auto_13248 ?auto_13249 ?auto_13246 ?auto_13250 ?auto_13251 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13284 - DIRECTION
      ?auto_13285 - MODE
    )
    :vars
    (
      ?auto_13290 - INSTRUMENT
      ?auto_13286 - SATELLITE
      ?auto_13288 - DIRECTION
      ?auto_13289 - DIRECTION
      ?auto_13287 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_13290 ?auto_13286 ) ( SUPPORTS ?auto_13290 ?auto_13285 ) ( POINTING ?auto_13286 ?auto_13288 ) ( not ( = ?auto_13284 ?auto_13288 ) ) ( HAVE_IMAGE ?auto_13289 ?auto_13287 ) ( not ( = ?auto_13289 ?auto_13284 ) ) ( not ( = ?auto_13289 ?auto_13288 ) ) ( not ( = ?auto_13287 ?auto_13285 ) ) ( CALIBRATION_TARGET ?auto_13290 ?auto_13288 ) ( POWER_AVAIL ?auto_13286 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_13290 ?auto_13286 )
      ( GET-2IMAGE ?auto_13289 ?auto_13287 ?auto_13284 ?auto_13285 )
      ( GET-1IMAGE-VERIFY ?auto_13284 ?auto_13285 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13292 - DIRECTION
      ?auto_13293 - MODE
      ?auto_13294 - DIRECTION
      ?auto_13291 - MODE
    )
    :vars
    (
      ?auto_13295 - INSTRUMENT
      ?auto_13297 - SATELLITE
      ?auto_13296 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13295 ?auto_13297 ) ( SUPPORTS ?auto_13295 ?auto_13291 ) ( POINTING ?auto_13297 ?auto_13296 ) ( not ( = ?auto_13294 ?auto_13296 ) ) ( HAVE_IMAGE ?auto_13292 ?auto_13293 ) ( not ( = ?auto_13292 ?auto_13294 ) ) ( not ( = ?auto_13292 ?auto_13296 ) ) ( not ( = ?auto_13293 ?auto_13291 ) ) ( CALIBRATION_TARGET ?auto_13295 ?auto_13296 ) ( POWER_AVAIL ?auto_13297 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13294 ?auto_13291 )
      ( GET-2IMAGE-VERIFY ?auto_13292 ?auto_13293 ?auto_13294 ?auto_13291 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13299 - DIRECTION
      ?auto_13300 - MODE
      ?auto_13301 - DIRECTION
      ?auto_13298 - MODE
    )
    :vars
    (
      ?auto_13303 - INSTRUMENT
      ?auto_13304 - SATELLITE
      ?auto_13302 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13303 ?auto_13304 ) ( SUPPORTS ?auto_13303 ?auto_13300 ) ( POINTING ?auto_13304 ?auto_13302 ) ( not ( = ?auto_13299 ?auto_13302 ) ) ( HAVE_IMAGE ?auto_13301 ?auto_13298 ) ( not ( = ?auto_13301 ?auto_13299 ) ) ( not ( = ?auto_13301 ?auto_13302 ) ) ( not ( = ?auto_13298 ?auto_13300 ) ) ( CALIBRATION_TARGET ?auto_13303 ?auto_13302 ) ( POWER_AVAIL ?auto_13304 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13301 ?auto_13298 ?auto_13299 ?auto_13300 )
      ( GET-2IMAGE-VERIFY ?auto_13299 ?auto_13300 ?auto_13301 ?auto_13298 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13315 - DIRECTION
      ?auto_13316 - MODE
      ?auto_13317 - DIRECTION
      ?auto_13314 - MODE
      ?auto_13318 - DIRECTION
      ?auto_13319 - MODE
    )
    :vars
    (
      ?auto_13321 - INSTRUMENT
      ?auto_13322 - SATELLITE
      ?auto_13320 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13321 ?auto_13322 ) ( SUPPORTS ?auto_13321 ?auto_13319 ) ( POINTING ?auto_13322 ?auto_13320 ) ( not ( = ?auto_13318 ?auto_13320 ) ) ( HAVE_IMAGE ?auto_13317 ?auto_13316 ) ( not ( = ?auto_13317 ?auto_13318 ) ) ( not ( = ?auto_13317 ?auto_13320 ) ) ( not ( = ?auto_13316 ?auto_13319 ) ) ( CALIBRATION_TARGET ?auto_13321 ?auto_13320 ) ( POWER_AVAIL ?auto_13322 ) ( HAVE_IMAGE ?auto_13315 ?auto_13316 ) ( HAVE_IMAGE ?auto_13317 ?auto_13314 ) ( not ( = ?auto_13315 ?auto_13317 ) ) ( not ( = ?auto_13315 ?auto_13318 ) ) ( not ( = ?auto_13315 ?auto_13320 ) ) ( not ( = ?auto_13316 ?auto_13314 ) ) ( not ( = ?auto_13314 ?auto_13319 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13317 ?auto_13316 ?auto_13318 ?auto_13319 )
      ( GET-3IMAGE-VERIFY ?auto_13315 ?auto_13316 ?auto_13317 ?auto_13314 ?auto_13318 ?auto_13319 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13324 - DIRECTION
      ?auto_13325 - MODE
      ?auto_13326 - DIRECTION
      ?auto_13323 - MODE
      ?auto_13327 - DIRECTION
      ?auto_13328 - MODE
    )
    :vars
    (
      ?auto_13330 - INSTRUMENT
      ?auto_13331 - SATELLITE
      ?auto_13329 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13330 ?auto_13331 ) ( SUPPORTS ?auto_13330 ?auto_13323 ) ( POINTING ?auto_13331 ?auto_13329 ) ( not ( = ?auto_13326 ?auto_13329 ) ) ( HAVE_IMAGE ?auto_13327 ?auto_13328 ) ( not ( = ?auto_13327 ?auto_13326 ) ) ( not ( = ?auto_13327 ?auto_13329 ) ) ( not ( = ?auto_13328 ?auto_13323 ) ) ( CALIBRATION_TARGET ?auto_13330 ?auto_13329 ) ( POWER_AVAIL ?auto_13331 ) ( HAVE_IMAGE ?auto_13324 ?auto_13325 ) ( not ( = ?auto_13324 ?auto_13326 ) ) ( not ( = ?auto_13324 ?auto_13327 ) ) ( not ( = ?auto_13324 ?auto_13329 ) ) ( not ( = ?auto_13325 ?auto_13323 ) ) ( not ( = ?auto_13325 ?auto_13328 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13327 ?auto_13328 ?auto_13326 ?auto_13323 )
      ( GET-3IMAGE-VERIFY ?auto_13324 ?auto_13325 ?auto_13326 ?auto_13323 ?auto_13327 ?auto_13328 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13342 - DIRECTION
      ?auto_13343 - MODE
      ?auto_13344 - DIRECTION
      ?auto_13341 - MODE
      ?auto_13345 - DIRECTION
      ?auto_13346 - MODE
    )
    :vars
    (
      ?auto_13348 - INSTRUMENT
      ?auto_13349 - SATELLITE
      ?auto_13347 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13348 ?auto_13349 ) ( SUPPORTS ?auto_13348 ?auto_13343 ) ( POINTING ?auto_13349 ?auto_13347 ) ( not ( = ?auto_13342 ?auto_13347 ) ) ( HAVE_IMAGE ?auto_13345 ?auto_13346 ) ( not ( = ?auto_13345 ?auto_13342 ) ) ( not ( = ?auto_13345 ?auto_13347 ) ) ( not ( = ?auto_13346 ?auto_13343 ) ) ( CALIBRATION_TARGET ?auto_13348 ?auto_13347 ) ( POWER_AVAIL ?auto_13349 ) ( HAVE_IMAGE ?auto_13344 ?auto_13341 ) ( not ( = ?auto_13342 ?auto_13344 ) ) ( not ( = ?auto_13343 ?auto_13341 ) ) ( not ( = ?auto_13344 ?auto_13345 ) ) ( not ( = ?auto_13344 ?auto_13347 ) ) ( not ( = ?auto_13341 ?auto_13346 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13345 ?auto_13346 ?auto_13342 ?auto_13343 )
      ( GET-3IMAGE-VERIFY ?auto_13342 ?auto_13343 ?auto_13344 ?auto_13341 ?auto_13345 ?auto_13346 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13379 - DIRECTION
      ?auto_13380 - MODE
    )
    :vars
    (
      ?auto_13382 - INSTRUMENT
      ?auto_13383 - SATELLITE
      ?auto_13381 - DIRECTION
      ?auto_13384 - DIRECTION
      ?auto_13385 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_13382 ?auto_13383 ) ( SUPPORTS ?auto_13382 ?auto_13380 ) ( not ( = ?auto_13379 ?auto_13381 ) ) ( HAVE_IMAGE ?auto_13384 ?auto_13385 ) ( not ( = ?auto_13384 ?auto_13379 ) ) ( not ( = ?auto_13384 ?auto_13381 ) ) ( not ( = ?auto_13385 ?auto_13380 ) ) ( CALIBRATION_TARGET ?auto_13382 ?auto_13381 ) ( POWER_AVAIL ?auto_13383 ) ( POINTING ?auto_13383 ?auto_13384 ) )
    :subtasks
    ( ( !TURN_TO ?auto_13383 ?auto_13381 ?auto_13384 )
      ( GET-2IMAGE ?auto_13384 ?auto_13385 ?auto_13379 ?auto_13380 )
      ( GET-1IMAGE-VERIFY ?auto_13379 ?auto_13380 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13387 - DIRECTION
      ?auto_13388 - MODE
      ?auto_13389 - DIRECTION
      ?auto_13386 - MODE
    )
    :vars
    (
      ?auto_13391 - INSTRUMENT
      ?auto_13390 - SATELLITE
      ?auto_13392 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13391 ?auto_13390 ) ( SUPPORTS ?auto_13391 ?auto_13386 ) ( not ( = ?auto_13389 ?auto_13392 ) ) ( HAVE_IMAGE ?auto_13387 ?auto_13388 ) ( not ( = ?auto_13387 ?auto_13389 ) ) ( not ( = ?auto_13387 ?auto_13392 ) ) ( not ( = ?auto_13388 ?auto_13386 ) ) ( CALIBRATION_TARGET ?auto_13391 ?auto_13392 ) ( POWER_AVAIL ?auto_13390 ) ( POINTING ?auto_13390 ?auto_13387 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13389 ?auto_13386 )
      ( GET-2IMAGE-VERIFY ?auto_13387 ?auto_13388 ?auto_13389 ?auto_13386 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13394 - DIRECTION
      ?auto_13395 - MODE
      ?auto_13396 - DIRECTION
      ?auto_13393 - MODE
    )
    :vars
    (
      ?auto_13398 - INSTRUMENT
      ?auto_13397 - SATELLITE
      ?auto_13399 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13398 ?auto_13397 ) ( SUPPORTS ?auto_13398 ?auto_13395 ) ( not ( = ?auto_13394 ?auto_13399 ) ) ( HAVE_IMAGE ?auto_13396 ?auto_13393 ) ( not ( = ?auto_13396 ?auto_13394 ) ) ( not ( = ?auto_13396 ?auto_13399 ) ) ( not ( = ?auto_13393 ?auto_13395 ) ) ( CALIBRATION_TARGET ?auto_13398 ?auto_13399 ) ( POWER_AVAIL ?auto_13397 ) ( POINTING ?auto_13397 ?auto_13396 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13396 ?auto_13393 ?auto_13394 ?auto_13395 )
      ( GET-2IMAGE-VERIFY ?auto_13394 ?auto_13395 ?auto_13396 ?auto_13393 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13410 - DIRECTION
      ?auto_13411 - MODE
      ?auto_13412 - DIRECTION
      ?auto_13409 - MODE
      ?auto_13413 - DIRECTION
      ?auto_13414 - MODE
    )
    :vars
    (
      ?auto_13416 - INSTRUMENT
      ?auto_13415 - SATELLITE
      ?auto_13417 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13416 ?auto_13415 ) ( SUPPORTS ?auto_13416 ?auto_13414 ) ( not ( = ?auto_13413 ?auto_13417 ) ) ( HAVE_IMAGE ?auto_13412 ?auto_13409 ) ( not ( = ?auto_13412 ?auto_13413 ) ) ( not ( = ?auto_13412 ?auto_13417 ) ) ( not ( = ?auto_13409 ?auto_13414 ) ) ( CALIBRATION_TARGET ?auto_13416 ?auto_13417 ) ( POWER_AVAIL ?auto_13415 ) ( POINTING ?auto_13415 ?auto_13412 ) ( HAVE_IMAGE ?auto_13410 ?auto_13411 ) ( not ( = ?auto_13410 ?auto_13412 ) ) ( not ( = ?auto_13410 ?auto_13413 ) ) ( not ( = ?auto_13410 ?auto_13417 ) ) ( not ( = ?auto_13411 ?auto_13409 ) ) ( not ( = ?auto_13411 ?auto_13414 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13412 ?auto_13409 ?auto_13413 ?auto_13414 )
      ( GET-3IMAGE-VERIFY ?auto_13410 ?auto_13411 ?auto_13412 ?auto_13409 ?auto_13413 ?auto_13414 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13419 - DIRECTION
      ?auto_13420 - MODE
      ?auto_13421 - DIRECTION
      ?auto_13418 - MODE
      ?auto_13422 - DIRECTION
      ?auto_13423 - MODE
    )
    :vars
    (
      ?auto_13425 - INSTRUMENT
      ?auto_13424 - SATELLITE
      ?auto_13426 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13425 ?auto_13424 ) ( SUPPORTS ?auto_13425 ?auto_13418 ) ( not ( = ?auto_13421 ?auto_13426 ) ) ( HAVE_IMAGE ?auto_13422 ?auto_13420 ) ( not ( = ?auto_13422 ?auto_13421 ) ) ( not ( = ?auto_13422 ?auto_13426 ) ) ( not ( = ?auto_13420 ?auto_13418 ) ) ( CALIBRATION_TARGET ?auto_13425 ?auto_13426 ) ( POWER_AVAIL ?auto_13424 ) ( POINTING ?auto_13424 ?auto_13422 ) ( HAVE_IMAGE ?auto_13419 ?auto_13420 ) ( HAVE_IMAGE ?auto_13422 ?auto_13423 ) ( not ( = ?auto_13419 ?auto_13421 ) ) ( not ( = ?auto_13419 ?auto_13422 ) ) ( not ( = ?auto_13419 ?auto_13426 ) ) ( not ( = ?auto_13420 ?auto_13423 ) ) ( not ( = ?auto_13418 ?auto_13423 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13422 ?auto_13420 ?auto_13421 ?auto_13418 )
      ( GET-3IMAGE-VERIFY ?auto_13419 ?auto_13420 ?auto_13421 ?auto_13418 ?auto_13422 ?auto_13423 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13437 - DIRECTION
      ?auto_13438 - MODE
      ?auto_13439 - DIRECTION
      ?auto_13436 - MODE
      ?auto_13440 - DIRECTION
      ?auto_13441 - MODE
    )
    :vars
    (
      ?auto_13443 - INSTRUMENT
      ?auto_13442 - SATELLITE
      ?auto_13444 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13443 ?auto_13442 ) ( SUPPORTS ?auto_13443 ?auto_13438 ) ( not ( = ?auto_13437 ?auto_13444 ) ) ( HAVE_IMAGE ?auto_13439 ?auto_13436 ) ( not ( = ?auto_13439 ?auto_13437 ) ) ( not ( = ?auto_13439 ?auto_13444 ) ) ( not ( = ?auto_13436 ?auto_13438 ) ) ( CALIBRATION_TARGET ?auto_13443 ?auto_13444 ) ( POWER_AVAIL ?auto_13442 ) ( POINTING ?auto_13442 ?auto_13439 ) ( HAVE_IMAGE ?auto_13440 ?auto_13441 ) ( not ( = ?auto_13437 ?auto_13440 ) ) ( not ( = ?auto_13438 ?auto_13441 ) ) ( not ( = ?auto_13439 ?auto_13440 ) ) ( not ( = ?auto_13436 ?auto_13441 ) ) ( not ( = ?auto_13440 ?auto_13444 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13439 ?auto_13436 ?auto_13437 ?auto_13438 )
      ( GET-3IMAGE-VERIFY ?auto_13437 ?auto_13438 ?auto_13439 ?auto_13436 ?auto_13440 ?auto_13441 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13474 - DIRECTION
      ?auto_13475 - MODE
    )
    :vars
    (
      ?auto_13477 - INSTRUMENT
      ?auto_13476 - SATELLITE
      ?auto_13478 - DIRECTION
      ?auto_13479 - DIRECTION
      ?auto_13480 - MODE
      ?auto_13481 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13477 ?auto_13476 ) ( SUPPORTS ?auto_13477 ?auto_13475 ) ( not ( = ?auto_13474 ?auto_13478 ) ) ( HAVE_IMAGE ?auto_13479 ?auto_13480 ) ( not ( = ?auto_13479 ?auto_13474 ) ) ( not ( = ?auto_13479 ?auto_13478 ) ) ( not ( = ?auto_13480 ?auto_13475 ) ) ( CALIBRATION_TARGET ?auto_13477 ?auto_13478 ) ( POINTING ?auto_13476 ?auto_13479 ) ( ON_BOARD ?auto_13481 ?auto_13476 ) ( POWER_ON ?auto_13481 ) ( not ( = ?auto_13477 ?auto_13481 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_13481 ?auto_13476 )
      ( GET-2IMAGE ?auto_13479 ?auto_13480 ?auto_13474 ?auto_13475 )
      ( GET-1IMAGE-VERIFY ?auto_13474 ?auto_13475 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13483 - DIRECTION
      ?auto_13484 - MODE
      ?auto_13485 - DIRECTION
      ?auto_13482 - MODE
    )
    :vars
    (
      ?auto_13488 - INSTRUMENT
      ?auto_13486 - SATELLITE
      ?auto_13487 - DIRECTION
      ?auto_13489 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13488 ?auto_13486 ) ( SUPPORTS ?auto_13488 ?auto_13482 ) ( not ( = ?auto_13485 ?auto_13487 ) ) ( HAVE_IMAGE ?auto_13483 ?auto_13484 ) ( not ( = ?auto_13483 ?auto_13485 ) ) ( not ( = ?auto_13483 ?auto_13487 ) ) ( not ( = ?auto_13484 ?auto_13482 ) ) ( CALIBRATION_TARGET ?auto_13488 ?auto_13487 ) ( POINTING ?auto_13486 ?auto_13483 ) ( ON_BOARD ?auto_13489 ?auto_13486 ) ( POWER_ON ?auto_13489 ) ( not ( = ?auto_13488 ?auto_13489 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13485 ?auto_13482 )
      ( GET-2IMAGE-VERIFY ?auto_13483 ?auto_13484 ?auto_13485 ?auto_13482 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13491 - DIRECTION
      ?auto_13492 - MODE
      ?auto_13493 - DIRECTION
      ?auto_13490 - MODE
    )
    :vars
    (
      ?auto_13495 - INSTRUMENT
      ?auto_13497 - SATELLITE
      ?auto_13494 - DIRECTION
      ?auto_13496 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13495 ?auto_13497 ) ( SUPPORTS ?auto_13495 ?auto_13492 ) ( not ( = ?auto_13491 ?auto_13494 ) ) ( HAVE_IMAGE ?auto_13493 ?auto_13490 ) ( not ( = ?auto_13493 ?auto_13491 ) ) ( not ( = ?auto_13493 ?auto_13494 ) ) ( not ( = ?auto_13490 ?auto_13492 ) ) ( CALIBRATION_TARGET ?auto_13495 ?auto_13494 ) ( POINTING ?auto_13497 ?auto_13493 ) ( ON_BOARD ?auto_13496 ?auto_13497 ) ( POWER_ON ?auto_13496 ) ( not ( = ?auto_13495 ?auto_13496 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13493 ?auto_13490 ?auto_13491 ?auto_13492 )
      ( GET-2IMAGE-VERIFY ?auto_13491 ?auto_13492 ?auto_13493 ?auto_13490 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13509 - DIRECTION
      ?auto_13510 - MODE
      ?auto_13511 - DIRECTION
      ?auto_13508 - MODE
      ?auto_13512 - DIRECTION
      ?auto_13513 - MODE
    )
    :vars
    (
      ?auto_13515 - INSTRUMENT
      ?auto_13517 - SATELLITE
      ?auto_13514 - DIRECTION
      ?auto_13516 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13515 ?auto_13517 ) ( SUPPORTS ?auto_13515 ?auto_13513 ) ( not ( = ?auto_13512 ?auto_13514 ) ) ( HAVE_IMAGE ?auto_13509 ?auto_13510 ) ( not ( = ?auto_13509 ?auto_13512 ) ) ( not ( = ?auto_13509 ?auto_13514 ) ) ( not ( = ?auto_13510 ?auto_13513 ) ) ( CALIBRATION_TARGET ?auto_13515 ?auto_13514 ) ( POINTING ?auto_13517 ?auto_13509 ) ( ON_BOARD ?auto_13516 ?auto_13517 ) ( POWER_ON ?auto_13516 ) ( not ( = ?auto_13515 ?auto_13516 ) ) ( HAVE_IMAGE ?auto_13511 ?auto_13508 ) ( not ( = ?auto_13509 ?auto_13511 ) ) ( not ( = ?auto_13510 ?auto_13508 ) ) ( not ( = ?auto_13511 ?auto_13512 ) ) ( not ( = ?auto_13511 ?auto_13514 ) ) ( not ( = ?auto_13508 ?auto_13513 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13509 ?auto_13510 ?auto_13512 ?auto_13513 )
      ( GET-3IMAGE-VERIFY ?auto_13509 ?auto_13510 ?auto_13511 ?auto_13508 ?auto_13512 ?auto_13513 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13519 - DIRECTION
      ?auto_13520 - MODE
      ?auto_13521 - DIRECTION
      ?auto_13518 - MODE
      ?auto_13522 - DIRECTION
      ?auto_13523 - MODE
    )
    :vars
    (
      ?auto_13525 - INSTRUMENT
      ?auto_13527 - SATELLITE
      ?auto_13524 - DIRECTION
      ?auto_13526 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13525 ?auto_13527 ) ( SUPPORTS ?auto_13525 ?auto_13518 ) ( not ( = ?auto_13521 ?auto_13524 ) ) ( HAVE_IMAGE ?auto_13522 ?auto_13523 ) ( not ( = ?auto_13522 ?auto_13521 ) ) ( not ( = ?auto_13522 ?auto_13524 ) ) ( not ( = ?auto_13523 ?auto_13518 ) ) ( CALIBRATION_TARGET ?auto_13525 ?auto_13524 ) ( POINTING ?auto_13527 ?auto_13522 ) ( ON_BOARD ?auto_13526 ?auto_13527 ) ( POWER_ON ?auto_13526 ) ( not ( = ?auto_13525 ?auto_13526 ) ) ( HAVE_IMAGE ?auto_13519 ?auto_13520 ) ( not ( = ?auto_13519 ?auto_13521 ) ) ( not ( = ?auto_13519 ?auto_13522 ) ) ( not ( = ?auto_13519 ?auto_13524 ) ) ( not ( = ?auto_13520 ?auto_13518 ) ) ( not ( = ?auto_13520 ?auto_13523 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13522 ?auto_13523 ?auto_13521 ?auto_13518 )
      ( GET-3IMAGE-VERIFY ?auto_13519 ?auto_13520 ?auto_13521 ?auto_13518 ?auto_13522 ?auto_13523 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13539 - DIRECTION
      ?auto_13540 - MODE
      ?auto_13541 - DIRECTION
      ?auto_13538 - MODE
      ?auto_13542 - DIRECTION
      ?auto_13543 - MODE
    )
    :vars
    (
      ?auto_13545 - INSTRUMENT
      ?auto_13547 - SATELLITE
      ?auto_13544 - DIRECTION
      ?auto_13546 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13545 ?auto_13547 ) ( SUPPORTS ?auto_13545 ?auto_13540 ) ( not ( = ?auto_13539 ?auto_13544 ) ) ( HAVE_IMAGE ?auto_13542 ?auto_13538 ) ( not ( = ?auto_13542 ?auto_13539 ) ) ( not ( = ?auto_13542 ?auto_13544 ) ) ( not ( = ?auto_13538 ?auto_13540 ) ) ( CALIBRATION_TARGET ?auto_13545 ?auto_13544 ) ( POINTING ?auto_13547 ?auto_13542 ) ( ON_BOARD ?auto_13546 ?auto_13547 ) ( POWER_ON ?auto_13546 ) ( not ( = ?auto_13545 ?auto_13546 ) ) ( HAVE_IMAGE ?auto_13541 ?auto_13538 ) ( HAVE_IMAGE ?auto_13542 ?auto_13543 ) ( not ( = ?auto_13539 ?auto_13541 ) ) ( not ( = ?auto_13540 ?auto_13543 ) ) ( not ( = ?auto_13541 ?auto_13542 ) ) ( not ( = ?auto_13541 ?auto_13544 ) ) ( not ( = ?auto_13538 ?auto_13543 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13542 ?auto_13538 ?auto_13539 ?auto_13540 )
      ( GET-3IMAGE-VERIFY ?auto_13539 ?auto_13540 ?auto_13541 ?auto_13538 ?auto_13542 ?auto_13543 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13580 - DIRECTION
      ?auto_13581 - MODE
    )
    :vars
    (
      ?auto_13585 - INSTRUMENT
      ?auto_13587 - SATELLITE
      ?auto_13584 - DIRECTION
      ?auto_13582 - DIRECTION
      ?auto_13583 - MODE
      ?auto_13586 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13585 ?auto_13587 ) ( SUPPORTS ?auto_13585 ?auto_13581 ) ( not ( = ?auto_13580 ?auto_13584 ) ) ( not ( = ?auto_13582 ?auto_13580 ) ) ( not ( = ?auto_13582 ?auto_13584 ) ) ( not ( = ?auto_13583 ?auto_13581 ) ) ( CALIBRATION_TARGET ?auto_13585 ?auto_13584 ) ( POINTING ?auto_13587 ?auto_13582 ) ( ON_BOARD ?auto_13586 ?auto_13587 ) ( POWER_ON ?auto_13586 ) ( not ( = ?auto_13585 ?auto_13586 ) ) ( CALIBRATED ?auto_13586 ) ( SUPPORTS ?auto_13586 ?auto_13583 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13582 ?auto_13583 )
      ( GET-2IMAGE ?auto_13582 ?auto_13583 ?auto_13580 ?auto_13581 )
      ( GET-1IMAGE-VERIFY ?auto_13580 ?auto_13581 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13589 - DIRECTION
      ?auto_13590 - MODE
      ?auto_13591 - DIRECTION
      ?auto_13588 - MODE
    )
    :vars
    (
      ?auto_13595 - INSTRUMENT
      ?auto_13593 - SATELLITE
      ?auto_13592 - DIRECTION
      ?auto_13594 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13595 ?auto_13593 ) ( SUPPORTS ?auto_13595 ?auto_13588 ) ( not ( = ?auto_13591 ?auto_13592 ) ) ( not ( = ?auto_13589 ?auto_13591 ) ) ( not ( = ?auto_13589 ?auto_13592 ) ) ( not ( = ?auto_13590 ?auto_13588 ) ) ( CALIBRATION_TARGET ?auto_13595 ?auto_13592 ) ( POINTING ?auto_13593 ?auto_13589 ) ( ON_BOARD ?auto_13594 ?auto_13593 ) ( POWER_ON ?auto_13594 ) ( not ( = ?auto_13595 ?auto_13594 ) ) ( CALIBRATED ?auto_13594 ) ( SUPPORTS ?auto_13594 ?auto_13590 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13591 ?auto_13588 )
      ( GET-2IMAGE-VERIFY ?auto_13589 ?auto_13590 ?auto_13591 ?auto_13588 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13597 - DIRECTION
      ?auto_13598 - MODE
      ?auto_13599 - DIRECTION
      ?auto_13596 - MODE
    )
    :vars
    (
      ?auto_13601 - INSTRUMENT
      ?auto_13603 - SATELLITE
      ?auto_13602 - DIRECTION
      ?auto_13600 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13601 ?auto_13603 ) ( SUPPORTS ?auto_13601 ?auto_13598 ) ( not ( = ?auto_13597 ?auto_13602 ) ) ( not ( = ?auto_13599 ?auto_13597 ) ) ( not ( = ?auto_13599 ?auto_13602 ) ) ( not ( = ?auto_13596 ?auto_13598 ) ) ( CALIBRATION_TARGET ?auto_13601 ?auto_13602 ) ( POINTING ?auto_13603 ?auto_13599 ) ( ON_BOARD ?auto_13600 ?auto_13603 ) ( POWER_ON ?auto_13600 ) ( not ( = ?auto_13601 ?auto_13600 ) ) ( CALIBRATED ?auto_13600 ) ( SUPPORTS ?auto_13600 ?auto_13596 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13599 ?auto_13596 ?auto_13597 ?auto_13598 )
      ( GET-2IMAGE-VERIFY ?auto_13597 ?auto_13598 ?auto_13599 ?auto_13596 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13686 - DIRECTION
      ?auto_13687 - MODE
    )
    :vars
    (
      ?auto_13691 - INSTRUMENT
      ?auto_13693 - SATELLITE
      ?auto_13692 - DIRECTION
      ?auto_13688 - DIRECTION
      ?auto_13689 - MODE
      ?auto_13690 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13691 ?auto_13693 ) ( SUPPORTS ?auto_13691 ?auto_13687 ) ( not ( = ?auto_13686 ?auto_13692 ) ) ( not ( = ?auto_13688 ?auto_13686 ) ) ( not ( = ?auto_13688 ?auto_13692 ) ) ( not ( = ?auto_13689 ?auto_13687 ) ) ( CALIBRATION_TARGET ?auto_13691 ?auto_13692 ) ( ON_BOARD ?auto_13690 ?auto_13693 ) ( POWER_ON ?auto_13690 ) ( not ( = ?auto_13691 ?auto_13690 ) ) ( CALIBRATED ?auto_13690 ) ( SUPPORTS ?auto_13690 ?auto_13689 ) ( POINTING ?auto_13693 ?auto_13692 ) )
    :subtasks
    ( ( !TURN_TO ?auto_13693 ?auto_13688 ?auto_13692 )
      ( GET-2IMAGE ?auto_13688 ?auto_13689 ?auto_13686 ?auto_13687 )
      ( GET-1IMAGE-VERIFY ?auto_13686 ?auto_13687 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13695 - DIRECTION
      ?auto_13696 - MODE
      ?auto_13697 - DIRECTION
      ?auto_13694 - MODE
    )
    :vars
    (
      ?auto_13699 - INSTRUMENT
      ?auto_13698 - SATELLITE
      ?auto_13700 - DIRECTION
      ?auto_13701 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13699 ?auto_13698 ) ( SUPPORTS ?auto_13699 ?auto_13694 ) ( not ( = ?auto_13697 ?auto_13700 ) ) ( not ( = ?auto_13695 ?auto_13697 ) ) ( not ( = ?auto_13695 ?auto_13700 ) ) ( not ( = ?auto_13696 ?auto_13694 ) ) ( CALIBRATION_TARGET ?auto_13699 ?auto_13700 ) ( ON_BOARD ?auto_13701 ?auto_13698 ) ( POWER_ON ?auto_13701 ) ( not ( = ?auto_13699 ?auto_13701 ) ) ( CALIBRATED ?auto_13701 ) ( SUPPORTS ?auto_13701 ?auto_13696 ) ( POINTING ?auto_13698 ?auto_13700 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13697 ?auto_13694 )
      ( GET-2IMAGE-VERIFY ?auto_13695 ?auto_13696 ?auto_13697 ?auto_13694 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13703 - DIRECTION
      ?auto_13704 - MODE
      ?auto_13705 - DIRECTION
      ?auto_13702 - MODE
    )
    :vars
    (
      ?auto_13707 - INSTRUMENT
      ?auto_13709 - SATELLITE
      ?auto_13708 - DIRECTION
      ?auto_13706 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13707 ?auto_13709 ) ( SUPPORTS ?auto_13707 ?auto_13704 ) ( not ( = ?auto_13703 ?auto_13708 ) ) ( not ( = ?auto_13705 ?auto_13703 ) ) ( not ( = ?auto_13705 ?auto_13708 ) ) ( not ( = ?auto_13702 ?auto_13704 ) ) ( CALIBRATION_TARGET ?auto_13707 ?auto_13708 ) ( ON_BOARD ?auto_13706 ?auto_13709 ) ( POWER_ON ?auto_13706 ) ( not ( = ?auto_13707 ?auto_13706 ) ) ( CALIBRATED ?auto_13706 ) ( SUPPORTS ?auto_13706 ?auto_13702 ) ( POINTING ?auto_13709 ?auto_13708 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13705 ?auto_13702 ?auto_13703 ?auto_13704 )
      ( GET-2IMAGE-VERIFY ?auto_13703 ?auto_13704 ?auto_13705 ?auto_13702 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13792 - DIRECTION
      ?auto_13793 - MODE
    )
    :vars
    (
      ?auto_13796 - INSTRUMENT
      ?auto_13799 - SATELLITE
      ?auto_13797 - DIRECTION
      ?auto_13798 - DIRECTION
      ?auto_13794 - MODE
      ?auto_13795 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13796 ?auto_13799 ) ( SUPPORTS ?auto_13796 ?auto_13793 ) ( not ( = ?auto_13792 ?auto_13797 ) ) ( not ( = ?auto_13798 ?auto_13792 ) ) ( not ( = ?auto_13798 ?auto_13797 ) ) ( not ( = ?auto_13794 ?auto_13793 ) ) ( CALIBRATION_TARGET ?auto_13796 ?auto_13797 ) ( ON_BOARD ?auto_13795 ?auto_13799 ) ( POWER_ON ?auto_13795 ) ( not ( = ?auto_13796 ?auto_13795 ) ) ( SUPPORTS ?auto_13795 ?auto_13794 ) ( POINTING ?auto_13799 ?auto_13797 ) ( CALIBRATION_TARGET ?auto_13795 ?auto_13797 ) ( NOT_CALIBRATED ?auto_13795 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_13799 ?auto_13795 ?auto_13797 )
      ( GET-2IMAGE ?auto_13798 ?auto_13794 ?auto_13792 ?auto_13793 )
      ( GET-1IMAGE-VERIFY ?auto_13792 ?auto_13793 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13801 - DIRECTION
      ?auto_13802 - MODE
      ?auto_13803 - DIRECTION
      ?auto_13800 - MODE
    )
    :vars
    (
      ?auto_13804 - INSTRUMENT
      ?auto_13806 - SATELLITE
      ?auto_13807 - DIRECTION
      ?auto_13805 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13804 ?auto_13806 ) ( SUPPORTS ?auto_13804 ?auto_13800 ) ( not ( = ?auto_13803 ?auto_13807 ) ) ( not ( = ?auto_13801 ?auto_13803 ) ) ( not ( = ?auto_13801 ?auto_13807 ) ) ( not ( = ?auto_13802 ?auto_13800 ) ) ( CALIBRATION_TARGET ?auto_13804 ?auto_13807 ) ( ON_BOARD ?auto_13805 ?auto_13806 ) ( POWER_ON ?auto_13805 ) ( not ( = ?auto_13804 ?auto_13805 ) ) ( SUPPORTS ?auto_13805 ?auto_13802 ) ( POINTING ?auto_13806 ?auto_13807 ) ( CALIBRATION_TARGET ?auto_13805 ?auto_13807 ) ( NOT_CALIBRATED ?auto_13805 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13803 ?auto_13800 )
      ( GET-2IMAGE-VERIFY ?auto_13801 ?auto_13802 ?auto_13803 ?auto_13800 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13809 - DIRECTION
      ?auto_13810 - MODE
      ?auto_13811 - DIRECTION
      ?auto_13808 - MODE
    )
    :vars
    (
      ?auto_13812 - INSTRUMENT
      ?auto_13815 - SATELLITE
      ?auto_13813 - DIRECTION
      ?auto_13814 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13812 ?auto_13815 ) ( SUPPORTS ?auto_13812 ?auto_13810 ) ( not ( = ?auto_13809 ?auto_13813 ) ) ( not ( = ?auto_13811 ?auto_13809 ) ) ( not ( = ?auto_13811 ?auto_13813 ) ) ( not ( = ?auto_13808 ?auto_13810 ) ) ( CALIBRATION_TARGET ?auto_13812 ?auto_13813 ) ( ON_BOARD ?auto_13814 ?auto_13815 ) ( POWER_ON ?auto_13814 ) ( not ( = ?auto_13812 ?auto_13814 ) ) ( SUPPORTS ?auto_13814 ?auto_13808 ) ( POINTING ?auto_13815 ?auto_13813 ) ( CALIBRATION_TARGET ?auto_13814 ?auto_13813 ) ( NOT_CALIBRATED ?auto_13814 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13811 ?auto_13808 ?auto_13809 ?auto_13810 )
      ( GET-2IMAGE-VERIFY ?auto_13809 ?auto_13810 ?auto_13811 ?auto_13808 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14423 - DIRECTION
      ?auto_14424 - MODE
      ?auto_14425 - DIRECTION
      ?auto_14422 - MODE
      ?auto_14426 - DIRECTION
      ?auto_14427 - MODE
    )
    :vars
    (
      ?auto_14429 - INSTRUMENT
      ?auto_14430 - SATELLITE
      ?auto_14428 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14429 ) ( ON_BOARD ?auto_14429 ?auto_14430 ) ( SUPPORTS ?auto_14429 ?auto_14427 ) ( POWER_ON ?auto_14429 ) ( POINTING ?auto_14430 ?auto_14428 ) ( not ( = ?auto_14426 ?auto_14428 ) ) ( HAVE_IMAGE ?auto_14423 ?auto_14424 ) ( not ( = ?auto_14423 ?auto_14426 ) ) ( not ( = ?auto_14423 ?auto_14428 ) ) ( not ( = ?auto_14424 ?auto_14427 ) ) ( HAVE_IMAGE ?auto_14425 ?auto_14422 ) ( not ( = ?auto_14423 ?auto_14425 ) ) ( not ( = ?auto_14424 ?auto_14422 ) ) ( not ( = ?auto_14425 ?auto_14426 ) ) ( not ( = ?auto_14425 ?auto_14428 ) ) ( not ( = ?auto_14422 ?auto_14427 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14423 ?auto_14424 ?auto_14426 ?auto_14427 )
      ( GET-3IMAGE-VERIFY ?auto_14423 ?auto_14424 ?auto_14425 ?auto_14422 ?auto_14426 ?auto_14427 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14438 - DIRECTION
      ?auto_14439 - MODE
      ?auto_14440 - DIRECTION
      ?auto_14437 - MODE
      ?auto_14441 - DIRECTION
      ?auto_14442 - MODE
    )
    :vars
    (
      ?auto_14444 - INSTRUMENT
      ?auto_14445 - SATELLITE
      ?auto_14443 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14444 ) ( ON_BOARD ?auto_14444 ?auto_14445 ) ( SUPPORTS ?auto_14444 ?auto_14437 ) ( POWER_ON ?auto_14444 ) ( POINTING ?auto_14445 ?auto_14443 ) ( not ( = ?auto_14440 ?auto_14443 ) ) ( HAVE_IMAGE ?auto_14438 ?auto_14439 ) ( not ( = ?auto_14438 ?auto_14440 ) ) ( not ( = ?auto_14438 ?auto_14443 ) ) ( not ( = ?auto_14439 ?auto_14437 ) ) ( HAVE_IMAGE ?auto_14441 ?auto_14442 ) ( not ( = ?auto_14438 ?auto_14441 ) ) ( not ( = ?auto_14439 ?auto_14442 ) ) ( not ( = ?auto_14440 ?auto_14441 ) ) ( not ( = ?auto_14437 ?auto_14442 ) ) ( not ( = ?auto_14441 ?auto_14443 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14438 ?auto_14439 ?auto_14440 ?auto_14437 )
      ( GET-3IMAGE-VERIFY ?auto_14438 ?auto_14439 ?auto_14440 ?auto_14437 ?auto_14441 ?auto_14442 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14468 - DIRECTION
      ?auto_14469 - MODE
      ?auto_14470 - DIRECTION
      ?auto_14467 - MODE
      ?auto_14471 - DIRECTION
      ?auto_14472 - MODE
    )
    :vars
    (
      ?auto_14476 - INSTRUMENT
      ?auto_14477 - SATELLITE
      ?auto_14475 - DIRECTION
      ?auto_14474 - DIRECTION
      ?auto_14473 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14476 ) ( ON_BOARD ?auto_14476 ?auto_14477 ) ( SUPPORTS ?auto_14476 ?auto_14472 ) ( POWER_ON ?auto_14476 ) ( POINTING ?auto_14477 ?auto_14475 ) ( not ( = ?auto_14471 ?auto_14475 ) ) ( HAVE_IMAGE ?auto_14474 ?auto_14473 ) ( not ( = ?auto_14474 ?auto_14471 ) ) ( not ( = ?auto_14474 ?auto_14475 ) ) ( not ( = ?auto_14473 ?auto_14472 ) ) ( HAVE_IMAGE ?auto_14468 ?auto_14469 ) ( HAVE_IMAGE ?auto_14470 ?auto_14467 ) ( not ( = ?auto_14468 ?auto_14470 ) ) ( not ( = ?auto_14468 ?auto_14471 ) ) ( not ( = ?auto_14468 ?auto_14475 ) ) ( not ( = ?auto_14468 ?auto_14474 ) ) ( not ( = ?auto_14469 ?auto_14467 ) ) ( not ( = ?auto_14469 ?auto_14472 ) ) ( not ( = ?auto_14469 ?auto_14473 ) ) ( not ( = ?auto_14470 ?auto_14471 ) ) ( not ( = ?auto_14470 ?auto_14475 ) ) ( not ( = ?auto_14470 ?auto_14474 ) ) ( not ( = ?auto_14467 ?auto_14472 ) ) ( not ( = ?auto_14467 ?auto_14473 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14474 ?auto_14473 ?auto_14471 ?auto_14472 )
      ( GET-3IMAGE-VERIFY ?auto_14468 ?auto_14469 ?auto_14470 ?auto_14467 ?auto_14471 ?auto_14472 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14485 - DIRECTION
      ?auto_14486 - MODE
      ?auto_14487 - DIRECTION
      ?auto_14484 - MODE
      ?auto_14488 - DIRECTION
      ?auto_14489 - MODE
    )
    :vars
    (
      ?auto_14493 - INSTRUMENT
      ?auto_14494 - SATELLITE
      ?auto_14492 - DIRECTION
      ?auto_14491 - DIRECTION
      ?auto_14490 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14493 ) ( ON_BOARD ?auto_14493 ?auto_14494 ) ( SUPPORTS ?auto_14493 ?auto_14484 ) ( POWER_ON ?auto_14493 ) ( POINTING ?auto_14494 ?auto_14492 ) ( not ( = ?auto_14487 ?auto_14492 ) ) ( HAVE_IMAGE ?auto_14491 ?auto_14490 ) ( not ( = ?auto_14491 ?auto_14487 ) ) ( not ( = ?auto_14491 ?auto_14492 ) ) ( not ( = ?auto_14490 ?auto_14484 ) ) ( HAVE_IMAGE ?auto_14485 ?auto_14486 ) ( HAVE_IMAGE ?auto_14488 ?auto_14489 ) ( not ( = ?auto_14485 ?auto_14487 ) ) ( not ( = ?auto_14485 ?auto_14488 ) ) ( not ( = ?auto_14485 ?auto_14492 ) ) ( not ( = ?auto_14485 ?auto_14491 ) ) ( not ( = ?auto_14486 ?auto_14484 ) ) ( not ( = ?auto_14486 ?auto_14489 ) ) ( not ( = ?auto_14486 ?auto_14490 ) ) ( not ( = ?auto_14487 ?auto_14488 ) ) ( not ( = ?auto_14484 ?auto_14489 ) ) ( not ( = ?auto_14488 ?auto_14492 ) ) ( not ( = ?auto_14488 ?auto_14491 ) ) ( not ( = ?auto_14489 ?auto_14490 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14491 ?auto_14490 ?auto_14487 ?auto_14484 )
      ( GET-3IMAGE-VERIFY ?auto_14485 ?auto_14486 ?auto_14487 ?auto_14484 ?auto_14488 ?auto_14489 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14537 - DIRECTION
      ?auto_14538 - MODE
      ?auto_14539 - DIRECTION
      ?auto_14536 - MODE
      ?auto_14540 - DIRECTION
      ?auto_14541 - MODE
    )
    :vars
    (
      ?auto_14545 - INSTRUMENT
      ?auto_14546 - SATELLITE
      ?auto_14544 - DIRECTION
      ?auto_14543 - DIRECTION
      ?auto_14542 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14545 ) ( ON_BOARD ?auto_14545 ?auto_14546 ) ( SUPPORTS ?auto_14545 ?auto_14538 ) ( POWER_ON ?auto_14545 ) ( POINTING ?auto_14546 ?auto_14544 ) ( not ( = ?auto_14537 ?auto_14544 ) ) ( HAVE_IMAGE ?auto_14543 ?auto_14542 ) ( not ( = ?auto_14543 ?auto_14537 ) ) ( not ( = ?auto_14543 ?auto_14544 ) ) ( not ( = ?auto_14542 ?auto_14538 ) ) ( HAVE_IMAGE ?auto_14539 ?auto_14536 ) ( HAVE_IMAGE ?auto_14540 ?auto_14541 ) ( not ( = ?auto_14537 ?auto_14539 ) ) ( not ( = ?auto_14537 ?auto_14540 ) ) ( not ( = ?auto_14538 ?auto_14536 ) ) ( not ( = ?auto_14538 ?auto_14541 ) ) ( not ( = ?auto_14539 ?auto_14540 ) ) ( not ( = ?auto_14539 ?auto_14544 ) ) ( not ( = ?auto_14539 ?auto_14543 ) ) ( not ( = ?auto_14536 ?auto_14541 ) ) ( not ( = ?auto_14536 ?auto_14542 ) ) ( not ( = ?auto_14540 ?auto_14544 ) ) ( not ( = ?auto_14540 ?auto_14543 ) ) ( not ( = ?auto_14541 ?auto_14542 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14543 ?auto_14542 ?auto_14537 ?auto_14538 )
      ( GET-3IMAGE-VERIFY ?auto_14537 ?auto_14538 ?auto_14539 ?auto_14536 ?auto_14540 ?auto_14541 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14628 - DIRECTION
      ?auto_14629 - MODE
      ?auto_14630 - DIRECTION
      ?auto_14627 - MODE
      ?auto_14631 - DIRECTION
      ?auto_14632 - MODE
    )
    :vars
    (
      ?auto_14633 - INSTRUMENT
      ?auto_14635 - SATELLITE
      ?auto_14634 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14633 ?auto_14635 ) ( SUPPORTS ?auto_14633 ?auto_14632 ) ( POWER_ON ?auto_14633 ) ( POINTING ?auto_14635 ?auto_14634 ) ( not ( = ?auto_14631 ?auto_14634 ) ) ( HAVE_IMAGE ?auto_14630 ?auto_14629 ) ( not ( = ?auto_14630 ?auto_14631 ) ) ( not ( = ?auto_14630 ?auto_14634 ) ) ( not ( = ?auto_14629 ?auto_14632 ) ) ( CALIBRATION_TARGET ?auto_14633 ?auto_14634 ) ( NOT_CALIBRATED ?auto_14633 ) ( HAVE_IMAGE ?auto_14628 ?auto_14629 ) ( HAVE_IMAGE ?auto_14630 ?auto_14627 ) ( not ( = ?auto_14628 ?auto_14630 ) ) ( not ( = ?auto_14628 ?auto_14631 ) ) ( not ( = ?auto_14628 ?auto_14634 ) ) ( not ( = ?auto_14629 ?auto_14627 ) ) ( not ( = ?auto_14627 ?auto_14632 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14630 ?auto_14629 ?auto_14631 ?auto_14632 )
      ( GET-3IMAGE-VERIFY ?auto_14628 ?auto_14629 ?auto_14630 ?auto_14627 ?auto_14631 ?auto_14632 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14637 - DIRECTION
      ?auto_14638 - MODE
      ?auto_14639 - DIRECTION
      ?auto_14636 - MODE
      ?auto_14640 - DIRECTION
      ?auto_14641 - MODE
    )
    :vars
    (
      ?auto_14642 - INSTRUMENT
      ?auto_14644 - SATELLITE
      ?auto_14643 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14642 ?auto_14644 ) ( SUPPORTS ?auto_14642 ?auto_14641 ) ( POWER_ON ?auto_14642 ) ( POINTING ?auto_14644 ?auto_14643 ) ( not ( = ?auto_14640 ?auto_14643 ) ) ( HAVE_IMAGE ?auto_14637 ?auto_14638 ) ( not ( = ?auto_14637 ?auto_14640 ) ) ( not ( = ?auto_14637 ?auto_14643 ) ) ( not ( = ?auto_14638 ?auto_14641 ) ) ( CALIBRATION_TARGET ?auto_14642 ?auto_14643 ) ( NOT_CALIBRATED ?auto_14642 ) ( HAVE_IMAGE ?auto_14639 ?auto_14636 ) ( not ( = ?auto_14637 ?auto_14639 ) ) ( not ( = ?auto_14638 ?auto_14636 ) ) ( not ( = ?auto_14639 ?auto_14640 ) ) ( not ( = ?auto_14639 ?auto_14643 ) ) ( not ( = ?auto_14636 ?auto_14641 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14637 ?auto_14638 ?auto_14640 ?auto_14641 )
      ( GET-3IMAGE-VERIFY ?auto_14637 ?auto_14638 ?auto_14639 ?auto_14636 ?auto_14640 ?auto_14641 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14676 - DIRECTION
      ?auto_14677 - MODE
      ?auto_14678 - DIRECTION
      ?auto_14675 - MODE
      ?auto_14679 - DIRECTION
      ?auto_14680 - MODE
    )
    :vars
    (
      ?auto_14681 - INSTRUMENT
      ?auto_14683 - SATELLITE
      ?auto_14682 - DIRECTION
      ?auto_14684 - DIRECTION
      ?auto_14685 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_14681 ?auto_14683 ) ( SUPPORTS ?auto_14681 ?auto_14680 ) ( POWER_ON ?auto_14681 ) ( POINTING ?auto_14683 ?auto_14682 ) ( not ( = ?auto_14679 ?auto_14682 ) ) ( HAVE_IMAGE ?auto_14684 ?auto_14685 ) ( not ( = ?auto_14684 ?auto_14679 ) ) ( not ( = ?auto_14684 ?auto_14682 ) ) ( not ( = ?auto_14685 ?auto_14680 ) ) ( CALIBRATION_TARGET ?auto_14681 ?auto_14682 ) ( NOT_CALIBRATED ?auto_14681 ) ( HAVE_IMAGE ?auto_14676 ?auto_14677 ) ( HAVE_IMAGE ?auto_14678 ?auto_14675 ) ( not ( = ?auto_14676 ?auto_14678 ) ) ( not ( = ?auto_14676 ?auto_14679 ) ) ( not ( = ?auto_14676 ?auto_14682 ) ) ( not ( = ?auto_14676 ?auto_14684 ) ) ( not ( = ?auto_14677 ?auto_14675 ) ) ( not ( = ?auto_14677 ?auto_14680 ) ) ( not ( = ?auto_14677 ?auto_14685 ) ) ( not ( = ?auto_14678 ?auto_14679 ) ) ( not ( = ?auto_14678 ?auto_14682 ) ) ( not ( = ?auto_14678 ?auto_14684 ) ) ( not ( = ?auto_14675 ?auto_14680 ) ) ( not ( = ?auto_14675 ?auto_14685 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14684 ?auto_14685 ?auto_14679 ?auto_14680 )
      ( GET-3IMAGE-VERIFY ?auto_14676 ?auto_14677 ?auto_14678 ?auto_14675 ?auto_14679 ?auto_14680 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14693 - DIRECTION
      ?auto_14694 - MODE
      ?auto_14695 - DIRECTION
      ?auto_14692 - MODE
      ?auto_14696 - DIRECTION
      ?auto_14697 - MODE
    )
    :vars
    (
      ?auto_14698 - INSTRUMENT
      ?auto_14700 - SATELLITE
      ?auto_14699 - DIRECTION
      ?auto_14701 - DIRECTION
      ?auto_14702 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_14698 ?auto_14700 ) ( SUPPORTS ?auto_14698 ?auto_14692 ) ( POWER_ON ?auto_14698 ) ( POINTING ?auto_14700 ?auto_14699 ) ( not ( = ?auto_14695 ?auto_14699 ) ) ( HAVE_IMAGE ?auto_14701 ?auto_14702 ) ( not ( = ?auto_14701 ?auto_14695 ) ) ( not ( = ?auto_14701 ?auto_14699 ) ) ( not ( = ?auto_14702 ?auto_14692 ) ) ( CALIBRATION_TARGET ?auto_14698 ?auto_14699 ) ( NOT_CALIBRATED ?auto_14698 ) ( HAVE_IMAGE ?auto_14693 ?auto_14694 ) ( HAVE_IMAGE ?auto_14696 ?auto_14697 ) ( not ( = ?auto_14693 ?auto_14695 ) ) ( not ( = ?auto_14693 ?auto_14696 ) ) ( not ( = ?auto_14693 ?auto_14699 ) ) ( not ( = ?auto_14693 ?auto_14701 ) ) ( not ( = ?auto_14694 ?auto_14692 ) ) ( not ( = ?auto_14694 ?auto_14697 ) ) ( not ( = ?auto_14694 ?auto_14702 ) ) ( not ( = ?auto_14695 ?auto_14696 ) ) ( not ( = ?auto_14692 ?auto_14697 ) ) ( not ( = ?auto_14696 ?auto_14699 ) ) ( not ( = ?auto_14696 ?auto_14701 ) ) ( not ( = ?auto_14697 ?auto_14702 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14701 ?auto_14702 ?auto_14695 ?auto_14692 )
      ( GET-3IMAGE-VERIFY ?auto_14693 ?auto_14694 ?auto_14695 ?auto_14692 ?auto_14696 ?auto_14697 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14715 - DIRECTION
      ?auto_14716 - MODE
      ?auto_14717 - DIRECTION
      ?auto_14714 - MODE
      ?auto_14718 - DIRECTION
      ?auto_14719 - MODE
    )
    :vars
    (
      ?auto_14720 - INSTRUMENT
      ?auto_14722 - SATELLITE
      ?auto_14721 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14720 ?auto_14722 ) ( SUPPORTS ?auto_14720 ?auto_14716 ) ( POWER_ON ?auto_14720 ) ( POINTING ?auto_14722 ?auto_14721 ) ( not ( = ?auto_14715 ?auto_14721 ) ) ( HAVE_IMAGE ?auto_14718 ?auto_14719 ) ( not ( = ?auto_14718 ?auto_14715 ) ) ( not ( = ?auto_14718 ?auto_14721 ) ) ( not ( = ?auto_14719 ?auto_14716 ) ) ( CALIBRATION_TARGET ?auto_14720 ?auto_14721 ) ( NOT_CALIBRATED ?auto_14720 ) ( HAVE_IMAGE ?auto_14717 ?auto_14714 ) ( not ( = ?auto_14715 ?auto_14717 ) ) ( not ( = ?auto_14716 ?auto_14714 ) ) ( not ( = ?auto_14717 ?auto_14718 ) ) ( not ( = ?auto_14717 ?auto_14721 ) ) ( not ( = ?auto_14714 ?auto_14719 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14718 ?auto_14719 ?auto_14715 ?auto_14716 )
      ( GET-3IMAGE-VERIFY ?auto_14715 ?auto_14716 ?auto_14717 ?auto_14714 ?auto_14718 ?auto_14719 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14745 - DIRECTION
      ?auto_14746 - MODE
      ?auto_14747 - DIRECTION
      ?auto_14744 - MODE
      ?auto_14748 - DIRECTION
      ?auto_14749 - MODE
    )
    :vars
    (
      ?auto_14750 - INSTRUMENT
      ?auto_14752 - SATELLITE
      ?auto_14751 - DIRECTION
      ?auto_14753 - DIRECTION
      ?auto_14754 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_14750 ?auto_14752 ) ( SUPPORTS ?auto_14750 ?auto_14746 ) ( POWER_ON ?auto_14750 ) ( POINTING ?auto_14752 ?auto_14751 ) ( not ( = ?auto_14745 ?auto_14751 ) ) ( HAVE_IMAGE ?auto_14753 ?auto_14754 ) ( not ( = ?auto_14753 ?auto_14745 ) ) ( not ( = ?auto_14753 ?auto_14751 ) ) ( not ( = ?auto_14754 ?auto_14746 ) ) ( CALIBRATION_TARGET ?auto_14750 ?auto_14751 ) ( NOT_CALIBRATED ?auto_14750 ) ( HAVE_IMAGE ?auto_14747 ?auto_14744 ) ( HAVE_IMAGE ?auto_14748 ?auto_14749 ) ( not ( = ?auto_14745 ?auto_14747 ) ) ( not ( = ?auto_14745 ?auto_14748 ) ) ( not ( = ?auto_14746 ?auto_14744 ) ) ( not ( = ?auto_14746 ?auto_14749 ) ) ( not ( = ?auto_14747 ?auto_14748 ) ) ( not ( = ?auto_14747 ?auto_14751 ) ) ( not ( = ?auto_14747 ?auto_14753 ) ) ( not ( = ?auto_14744 ?auto_14749 ) ) ( not ( = ?auto_14744 ?auto_14754 ) ) ( not ( = ?auto_14748 ?auto_14751 ) ) ( not ( = ?auto_14748 ?auto_14753 ) ) ( not ( = ?auto_14749 ?auto_14754 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14753 ?auto_14754 ?auto_14745 ?auto_14746 )
      ( GET-3IMAGE-VERIFY ?auto_14745 ?auto_14746 ?auto_14747 ?auto_14744 ?auto_14748 ?auto_14749 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14836 - DIRECTION
      ?auto_14837 - MODE
      ?auto_14838 - DIRECTION
      ?auto_14835 - MODE
      ?auto_14839 - DIRECTION
      ?auto_14840 - MODE
    )
    :vars
    (
      ?auto_14843 - INSTRUMENT
      ?auto_14842 - SATELLITE
      ?auto_14841 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14843 ?auto_14842 ) ( SUPPORTS ?auto_14843 ?auto_14840 ) ( POINTING ?auto_14842 ?auto_14841 ) ( not ( = ?auto_14839 ?auto_14841 ) ) ( HAVE_IMAGE ?auto_14836 ?auto_14837 ) ( not ( = ?auto_14836 ?auto_14839 ) ) ( not ( = ?auto_14836 ?auto_14841 ) ) ( not ( = ?auto_14837 ?auto_14840 ) ) ( CALIBRATION_TARGET ?auto_14843 ?auto_14841 ) ( POWER_AVAIL ?auto_14842 ) ( HAVE_IMAGE ?auto_14838 ?auto_14835 ) ( not ( = ?auto_14836 ?auto_14838 ) ) ( not ( = ?auto_14837 ?auto_14835 ) ) ( not ( = ?auto_14838 ?auto_14839 ) ) ( not ( = ?auto_14838 ?auto_14841 ) ) ( not ( = ?auto_14835 ?auto_14840 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14836 ?auto_14837 ?auto_14839 ?auto_14840 )
      ( GET-3IMAGE-VERIFY ?auto_14836 ?auto_14837 ?auto_14838 ?auto_14835 ?auto_14839 ?auto_14840 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14851 - DIRECTION
      ?auto_14852 - MODE
      ?auto_14853 - DIRECTION
      ?auto_14850 - MODE
      ?auto_14854 - DIRECTION
      ?auto_14855 - MODE
    )
    :vars
    (
      ?auto_14858 - INSTRUMENT
      ?auto_14857 - SATELLITE
      ?auto_14856 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14858 ?auto_14857 ) ( SUPPORTS ?auto_14858 ?auto_14850 ) ( POINTING ?auto_14857 ?auto_14856 ) ( not ( = ?auto_14853 ?auto_14856 ) ) ( HAVE_IMAGE ?auto_14854 ?auto_14852 ) ( not ( = ?auto_14854 ?auto_14853 ) ) ( not ( = ?auto_14854 ?auto_14856 ) ) ( not ( = ?auto_14852 ?auto_14850 ) ) ( CALIBRATION_TARGET ?auto_14858 ?auto_14856 ) ( POWER_AVAIL ?auto_14857 ) ( HAVE_IMAGE ?auto_14851 ?auto_14852 ) ( HAVE_IMAGE ?auto_14854 ?auto_14855 ) ( not ( = ?auto_14851 ?auto_14853 ) ) ( not ( = ?auto_14851 ?auto_14854 ) ) ( not ( = ?auto_14851 ?auto_14856 ) ) ( not ( = ?auto_14852 ?auto_14855 ) ) ( not ( = ?auto_14850 ?auto_14855 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14854 ?auto_14852 ?auto_14853 ?auto_14850 )
      ( GET-3IMAGE-VERIFY ?auto_14851 ?auto_14852 ?auto_14853 ?auto_14850 ?auto_14854 ?auto_14855 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14860 - DIRECTION
      ?auto_14861 - MODE
      ?auto_14862 - DIRECTION
      ?auto_14859 - MODE
      ?auto_14863 - DIRECTION
      ?auto_14864 - MODE
    )
    :vars
    (
      ?auto_14867 - INSTRUMENT
      ?auto_14866 - SATELLITE
      ?auto_14865 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14867 ?auto_14866 ) ( SUPPORTS ?auto_14867 ?auto_14859 ) ( POINTING ?auto_14866 ?auto_14865 ) ( not ( = ?auto_14862 ?auto_14865 ) ) ( HAVE_IMAGE ?auto_14860 ?auto_14861 ) ( not ( = ?auto_14860 ?auto_14862 ) ) ( not ( = ?auto_14860 ?auto_14865 ) ) ( not ( = ?auto_14861 ?auto_14859 ) ) ( CALIBRATION_TARGET ?auto_14867 ?auto_14865 ) ( POWER_AVAIL ?auto_14866 ) ( HAVE_IMAGE ?auto_14863 ?auto_14864 ) ( not ( = ?auto_14860 ?auto_14863 ) ) ( not ( = ?auto_14861 ?auto_14864 ) ) ( not ( = ?auto_14862 ?auto_14863 ) ) ( not ( = ?auto_14859 ?auto_14864 ) ) ( not ( = ?auto_14863 ?auto_14865 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14860 ?auto_14861 ?auto_14862 ?auto_14859 )
      ( GET-3IMAGE-VERIFY ?auto_14860 ?auto_14861 ?auto_14862 ?auto_14859 ?auto_14863 ?auto_14864 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14884 - DIRECTION
      ?auto_14885 - MODE
      ?auto_14886 - DIRECTION
      ?auto_14883 - MODE
      ?auto_14887 - DIRECTION
      ?auto_14888 - MODE
    )
    :vars
    (
      ?auto_14892 - INSTRUMENT
      ?auto_14891 - SATELLITE
      ?auto_14890 - DIRECTION
      ?auto_14893 - DIRECTION
      ?auto_14889 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_14892 ?auto_14891 ) ( SUPPORTS ?auto_14892 ?auto_14888 ) ( POINTING ?auto_14891 ?auto_14890 ) ( not ( = ?auto_14887 ?auto_14890 ) ) ( HAVE_IMAGE ?auto_14893 ?auto_14889 ) ( not ( = ?auto_14893 ?auto_14887 ) ) ( not ( = ?auto_14893 ?auto_14890 ) ) ( not ( = ?auto_14889 ?auto_14888 ) ) ( CALIBRATION_TARGET ?auto_14892 ?auto_14890 ) ( POWER_AVAIL ?auto_14891 ) ( HAVE_IMAGE ?auto_14884 ?auto_14885 ) ( HAVE_IMAGE ?auto_14886 ?auto_14883 ) ( not ( = ?auto_14884 ?auto_14886 ) ) ( not ( = ?auto_14884 ?auto_14887 ) ) ( not ( = ?auto_14884 ?auto_14890 ) ) ( not ( = ?auto_14884 ?auto_14893 ) ) ( not ( = ?auto_14885 ?auto_14883 ) ) ( not ( = ?auto_14885 ?auto_14888 ) ) ( not ( = ?auto_14885 ?auto_14889 ) ) ( not ( = ?auto_14886 ?auto_14887 ) ) ( not ( = ?auto_14886 ?auto_14890 ) ) ( not ( = ?auto_14886 ?auto_14893 ) ) ( not ( = ?auto_14883 ?auto_14888 ) ) ( not ( = ?auto_14883 ?auto_14889 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14893 ?auto_14889 ?auto_14887 ?auto_14888 )
      ( GET-3IMAGE-VERIFY ?auto_14884 ?auto_14885 ?auto_14886 ?auto_14883 ?auto_14887 ?auto_14888 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14901 - DIRECTION
      ?auto_14902 - MODE
      ?auto_14903 - DIRECTION
      ?auto_14900 - MODE
      ?auto_14904 - DIRECTION
      ?auto_14905 - MODE
    )
    :vars
    (
      ?auto_14909 - INSTRUMENT
      ?auto_14908 - SATELLITE
      ?auto_14907 - DIRECTION
      ?auto_14910 - DIRECTION
      ?auto_14906 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_14909 ?auto_14908 ) ( SUPPORTS ?auto_14909 ?auto_14900 ) ( POINTING ?auto_14908 ?auto_14907 ) ( not ( = ?auto_14903 ?auto_14907 ) ) ( HAVE_IMAGE ?auto_14910 ?auto_14906 ) ( not ( = ?auto_14910 ?auto_14903 ) ) ( not ( = ?auto_14910 ?auto_14907 ) ) ( not ( = ?auto_14906 ?auto_14900 ) ) ( CALIBRATION_TARGET ?auto_14909 ?auto_14907 ) ( POWER_AVAIL ?auto_14908 ) ( HAVE_IMAGE ?auto_14901 ?auto_14902 ) ( HAVE_IMAGE ?auto_14904 ?auto_14905 ) ( not ( = ?auto_14901 ?auto_14903 ) ) ( not ( = ?auto_14901 ?auto_14904 ) ) ( not ( = ?auto_14901 ?auto_14907 ) ) ( not ( = ?auto_14901 ?auto_14910 ) ) ( not ( = ?auto_14902 ?auto_14900 ) ) ( not ( = ?auto_14902 ?auto_14905 ) ) ( not ( = ?auto_14902 ?auto_14906 ) ) ( not ( = ?auto_14903 ?auto_14904 ) ) ( not ( = ?auto_14900 ?auto_14905 ) ) ( not ( = ?auto_14904 ?auto_14907 ) ) ( not ( = ?auto_14904 ?auto_14910 ) ) ( not ( = ?auto_14905 ?auto_14906 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14910 ?auto_14906 ?auto_14903 ?auto_14900 )
      ( GET-3IMAGE-VERIFY ?auto_14901 ?auto_14902 ?auto_14903 ?auto_14900 ?auto_14904 ?auto_14905 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14923 - DIRECTION
      ?auto_14924 - MODE
      ?auto_14925 - DIRECTION
      ?auto_14922 - MODE
      ?auto_14926 - DIRECTION
      ?auto_14927 - MODE
    )
    :vars
    (
      ?auto_14930 - INSTRUMENT
      ?auto_14929 - SATELLITE
      ?auto_14928 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14930 ?auto_14929 ) ( SUPPORTS ?auto_14930 ?auto_14924 ) ( POINTING ?auto_14929 ?auto_14928 ) ( not ( = ?auto_14923 ?auto_14928 ) ) ( HAVE_IMAGE ?auto_14925 ?auto_14922 ) ( not ( = ?auto_14925 ?auto_14923 ) ) ( not ( = ?auto_14925 ?auto_14928 ) ) ( not ( = ?auto_14922 ?auto_14924 ) ) ( CALIBRATION_TARGET ?auto_14930 ?auto_14928 ) ( POWER_AVAIL ?auto_14929 ) ( HAVE_IMAGE ?auto_14926 ?auto_14927 ) ( not ( = ?auto_14923 ?auto_14926 ) ) ( not ( = ?auto_14924 ?auto_14927 ) ) ( not ( = ?auto_14925 ?auto_14926 ) ) ( not ( = ?auto_14922 ?auto_14927 ) ) ( not ( = ?auto_14926 ?auto_14928 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14925 ?auto_14922 ?auto_14923 ?auto_14924 )
      ( GET-3IMAGE-VERIFY ?auto_14923 ?auto_14924 ?auto_14925 ?auto_14922 ?auto_14926 ?auto_14927 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14953 - DIRECTION
      ?auto_14954 - MODE
      ?auto_14955 - DIRECTION
      ?auto_14952 - MODE
      ?auto_14956 - DIRECTION
      ?auto_14957 - MODE
    )
    :vars
    (
      ?auto_14961 - INSTRUMENT
      ?auto_14960 - SATELLITE
      ?auto_14959 - DIRECTION
      ?auto_14962 - DIRECTION
      ?auto_14958 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_14961 ?auto_14960 ) ( SUPPORTS ?auto_14961 ?auto_14954 ) ( POINTING ?auto_14960 ?auto_14959 ) ( not ( = ?auto_14953 ?auto_14959 ) ) ( HAVE_IMAGE ?auto_14962 ?auto_14958 ) ( not ( = ?auto_14962 ?auto_14953 ) ) ( not ( = ?auto_14962 ?auto_14959 ) ) ( not ( = ?auto_14958 ?auto_14954 ) ) ( CALIBRATION_TARGET ?auto_14961 ?auto_14959 ) ( POWER_AVAIL ?auto_14960 ) ( HAVE_IMAGE ?auto_14955 ?auto_14952 ) ( HAVE_IMAGE ?auto_14956 ?auto_14957 ) ( not ( = ?auto_14953 ?auto_14955 ) ) ( not ( = ?auto_14953 ?auto_14956 ) ) ( not ( = ?auto_14954 ?auto_14952 ) ) ( not ( = ?auto_14954 ?auto_14957 ) ) ( not ( = ?auto_14955 ?auto_14956 ) ) ( not ( = ?auto_14955 ?auto_14959 ) ) ( not ( = ?auto_14955 ?auto_14962 ) ) ( not ( = ?auto_14952 ?auto_14957 ) ) ( not ( = ?auto_14952 ?auto_14958 ) ) ( not ( = ?auto_14956 ?auto_14959 ) ) ( not ( = ?auto_14956 ?auto_14962 ) ) ( not ( = ?auto_14957 ?auto_14958 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14962 ?auto_14958 ?auto_14953 ?auto_14954 )
      ( GET-3IMAGE-VERIFY ?auto_14953 ?auto_14954 ?auto_14955 ?auto_14952 ?auto_14956 ?auto_14957 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15005 - DIRECTION
      ?auto_15006 - MODE
    )
    :vars
    (
      ?auto_15010 - INSTRUMENT
      ?auto_15009 - SATELLITE
      ?auto_15008 - DIRECTION
      ?auto_15011 - DIRECTION
      ?auto_15007 - MODE
      ?auto_15012 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15010 ?auto_15009 ) ( SUPPORTS ?auto_15010 ?auto_15006 ) ( not ( = ?auto_15005 ?auto_15008 ) ) ( HAVE_IMAGE ?auto_15011 ?auto_15007 ) ( not ( = ?auto_15011 ?auto_15005 ) ) ( not ( = ?auto_15011 ?auto_15008 ) ) ( not ( = ?auto_15007 ?auto_15006 ) ) ( CALIBRATION_TARGET ?auto_15010 ?auto_15008 ) ( POWER_AVAIL ?auto_15009 ) ( POINTING ?auto_15009 ?auto_15012 ) ( not ( = ?auto_15008 ?auto_15012 ) ) ( not ( = ?auto_15005 ?auto_15012 ) ) ( not ( = ?auto_15011 ?auto_15012 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_15009 ?auto_15008 ?auto_15012 )
      ( GET-2IMAGE ?auto_15011 ?auto_15007 ?auto_15005 ?auto_15006 )
      ( GET-1IMAGE-VERIFY ?auto_15005 ?auto_15006 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15014 - DIRECTION
      ?auto_15015 - MODE
      ?auto_15016 - DIRECTION
      ?auto_15013 - MODE
    )
    :vars
    (
      ?auto_15017 - INSTRUMENT
      ?auto_15018 - SATELLITE
      ?auto_15019 - DIRECTION
      ?auto_15020 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15017 ?auto_15018 ) ( SUPPORTS ?auto_15017 ?auto_15013 ) ( not ( = ?auto_15016 ?auto_15019 ) ) ( HAVE_IMAGE ?auto_15014 ?auto_15015 ) ( not ( = ?auto_15014 ?auto_15016 ) ) ( not ( = ?auto_15014 ?auto_15019 ) ) ( not ( = ?auto_15015 ?auto_15013 ) ) ( CALIBRATION_TARGET ?auto_15017 ?auto_15019 ) ( POWER_AVAIL ?auto_15018 ) ( POINTING ?auto_15018 ?auto_15020 ) ( not ( = ?auto_15019 ?auto_15020 ) ) ( not ( = ?auto_15016 ?auto_15020 ) ) ( not ( = ?auto_15014 ?auto_15020 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15016 ?auto_15013 )
      ( GET-2IMAGE-VERIFY ?auto_15014 ?auto_15015 ?auto_15016 ?auto_15013 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15022 - DIRECTION
      ?auto_15023 - MODE
      ?auto_15024 - DIRECTION
      ?auto_15021 - MODE
    )
    :vars
    (
      ?auto_15025 - INSTRUMENT
      ?auto_15026 - SATELLITE
      ?auto_15027 - DIRECTION
      ?auto_15029 - DIRECTION
      ?auto_15028 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_15025 ?auto_15026 ) ( SUPPORTS ?auto_15025 ?auto_15021 ) ( not ( = ?auto_15024 ?auto_15027 ) ) ( HAVE_IMAGE ?auto_15029 ?auto_15028 ) ( not ( = ?auto_15029 ?auto_15024 ) ) ( not ( = ?auto_15029 ?auto_15027 ) ) ( not ( = ?auto_15028 ?auto_15021 ) ) ( CALIBRATION_TARGET ?auto_15025 ?auto_15027 ) ( POWER_AVAIL ?auto_15026 ) ( POINTING ?auto_15026 ?auto_15022 ) ( not ( = ?auto_15027 ?auto_15022 ) ) ( not ( = ?auto_15024 ?auto_15022 ) ) ( not ( = ?auto_15029 ?auto_15022 ) ) ( HAVE_IMAGE ?auto_15022 ?auto_15023 ) ( not ( = ?auto_15023 ?auto_15021 ) ) ( not ( = ?auto_15023 ?auto_15028 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15029 ?auto_15028 ?auto_15024 ?auto_15021 )
      ( GET-2IMAGE-VERIFY ?auto_15022 ?auto_15023 ?auto_15024 ?auto_15021 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15031 - DIRECTION
      ?auto_15032 - MODE
      ?auto_15033 - DIRECTION
      ?auto_15030 - MODE
    )
    :vars
    (
      ?auto_15034 - INSTRUMENT
      ?auto_15035 - SATELLITE
      ?auto_15037 - DIRECTION
      ?auto_15036 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15034 ?auto_15035 ) ( SUPPORTS ?auto_15034 ?auto_15032 ) ( not ( = ?auto_15031 ?auto_15037 ) ) ( HAVE_IMAGE ?auto_15033 ?auto_15030 ) ( not ( = ?auto_15033 ?auto_15031 ) ) ( not ( = ?auto_15033 ?auto_15037 ) ) ( not ( = ?auto_15030 ?auto_15032 ) ) ( CALIBRATION_TARGET ?auto_15034 ?auto_15037 ) ( POWER_AVAIL ?auto_15035 ) ( POINTING ?auto_15035 ?auto_15036 ) ( not ( = ?auto_15037 ?auto_15036 ) ) ( not ( = ?auto_15031 ?auto_15036 ) ) ( not ( = ?auto_15033 ?auto_15036 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15033 ?auto_15030 ?auto_15031 ?auto_15032 )
      ( GET-2IMAGE-VERIFY ?auto_15031 ?auto_15032 ?auto_15033 ?auto_15030 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15039 - DIRECTION
      ?auto_15040 - MODE
      ?auto_15041 - DIRECTION
      ?auto_15038 - MODE
    )
    :vars
    (
      ?auto_15042 - INSTRUMENT
      ?auto_15043 - SATELLITE
      ?auto_15044 - DIRECTION
      ?auto_15046 - DIRECTION
      ?auto_15045 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_15042 ?auto_15043 ) ( SUPPORTS ?auto_15042 ?auto_15040 ) ( not ( = ?auto_15039 ?auto_15044 ) ) ( HAVE_IMAGE ?auto_15046 ?auto_15045 ) ( not ( = ?auto_15046 ?auto_15039 ) ) ( not ( = ?auto_15046 ?auto_15044 ) ) ( not ( = ?auto_15045 ?auto_15040 ) ) ( CALIBRATION_TARGET ?auto_15042 ?auto_15044 ) ( POWER_AVAIL ?auto_15043 ) ( POINTING ?auto_15043 ?auto_15041 ) ( not ( = ?auto_15044 ?auto_15041 ) ) ( not ( = ?auto_15039 ?auto_15041 ) ) ( not ( = ?auto_15046 ?auto_15041 ) ) ( HAVE_IMAGE ?auto_15041 ?auto_15038 ) ( not ( = ?auto_15040 ?auto_15038 ) ) ( not ( = ?auto_15038 ?auto_15045 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15046 ?auto_15045 ?auto_15039 ?auto_15040 )
      ( GET-2IMAGE-VERIFY ?auto_15039 ?auto_15040 ?auto_15041 ?auto_15038 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15058 - DIRECTION
      ?auto_15059 - MODE
      ?auto_15060 - DIRECTION
      ?auto_15057 - MODE
      ?auto_15061 - DIRECTION
      ?auto_15062 - MODE
    )
    :vars
    (
      ?auto_15063 - INSTRUMENT
      ?auto_15064 - SATELLITE
      ?auto_15066 - DIRECTION
      ?auto_15065 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15063 ?auto_15064 ) ( SUPPORTS ?auto_15063 ?auto_15062 ) ( not ( = ?auto_15061 ?auto_15066 ) ) ( HAVE_IMAGE ?auto_15060 ?auto_15059 ) ( not ( = ?auto_15060 ?auto_15061 ) ) ( not ( = ?auto_15060 ?auto_15066 ) ) ( not ( = ?auto_15059 ?auto_15062 ) ) ( CALIBRATION_TARGET ?auto_15063 ?auto_15066 ) ( POWER_AVAIL ?auto_15064 ) ( POINTING ?auto_15064 ?auto_15065 ) ( not ( = ?auto_15066 ?auto_15065 ) ) ( not ( = ?auto_15061 ?auto_15065 ) ) ( not ( = ?auto_15060 ?auto_15065 ) ) ( HAVE_IMAGE ?auto_15058 ?auto_15059 ) ( HAVE_IMAGE ?auto_15060 ?auto_15057 ) ( not ( = ?auto_15058 ?auto_15060 ) ) ( not ( = ?auto_15058 ?auto_15061 ) ) ( not ( = ?auto_15058 ?auto_15066 ) ) ( not ( = ?auto_15058 ?auto_15065 ) ) ( not ( = ?auto_15059 ?auto_15057 ) ) ( not ( = ?auto_15057 ?auto_15062 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15060 ?auto_15059 ?auto_15061 ?auto_15062 )
      ( GET-3IMAGE-VERIFY ?auto_15058 ?auto_15059 ?auto_15060 ?auto_15057 ?auto_15061 ?auto_15062 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15068 - DIRECTION
      ?auto_15069 - MODE
      ?auto_15070 - DIRECTION
      ?auto_15067 - MODE
      ?auto_15071 - DIRECTION
      ?auto_15072 - MODE
    )
    :vars
    (
      ?auto_15073 - INSTRUMENT
      ?auto_15074 - SATELLITE
      ?auto_15075 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15073 ?auto_15074 ) ( SUPPORTS ?auto_15073 ?auto_15072 ) ( not ( = ?auto_15071 ?auto_15075 ) ) ( HAVE_IMAGE ?auto_15068 ?auto_15069 ) ( not ( = ?auto_15068 ?auto_15071 ) ) ( not ( = ?auto_15068 ?auto_15075 ) ) ( not ( = ?auto_15069 ?auto_15072 ) ) ( CALIBRATION_TARGET ?auto_15073 ?auto_15075 ) ( POWER_AVAIL ?auto_15074 ) ( POINTING ?auto_15074 ?auto_15070 ) ( not ( = ?auto_15075 ?auto_15070 ) ) ( not ( = ?auto_15071 ?auto_15070 ) ) ( not ( = ?auto_15068 ?auto_15070 ) ) ( HAVE_IMAGE ?auto_15070 ?auto_15067 ) ( not ( = ?auto_15069 ?auto_15067 ) ) ( not ( = ?auto_15067 ?auto_15072 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15068 ?auto_15069 ?auto_15071 ?auto_15072 )
      ( GET-3IMAGE-VERIFY ?auto_15068 ?auto_15069 ?auto_15070 ?auto_15067 ?auto_15071 ?auto_15072 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15077 - DIRECTION
      ?auto_15078 - MODE
      ?auto_15079 - DIRECTION
      ?auto_15076 - MODE
      ?auto_15080 - DIRECTION
      ?auto_15081 - MODE
    )
    :vars
    (
      ?auto_15082 - INSTRUMENT
      ?auto_15083 - SATELLITE
      ?auto_15085 - DIRECTION
      ?auto_15084 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15082 ?auto_15083 ) ( SUPPORTS ?auto_15082 ?auto_15076 ) ( not ( = ?auto_15079 ?auto_15085 ) ) ( HAVE_IMAGE ?auto_15080 ?auto_15081 ) ( not ( = ?auto_15080 ?auto_15079 ) ) ( not ( = ?auto_15080 ?auto_15085 ) ) ( not ( = ?auto_15081 ?auto_15076 ) ) ( CALIBRATION_TARGET ?auto_15082 ?auto_15085 ) ( POWER_AVAIL ?auto_15083 ) ( POINTING ?auto_15083 ?auto_15084 ) ( not ( = ?auto_15085 ?auto_15084 ) ) ( not ( = ?auto_15079 ?auto_15084 ) ) ( not ( = ?auto_15080 ?auto_15084 ) ) ( HAVE_IMAGE ?auto_15077 ?auto_15078 ) ( not ( = ?auto_15077 ?auto_15079 ) ) ( not ( = ?auto_15077 ?auto_15080 ) ) ( not ( = ?auto_15077 ?auto_15085 ) ) ( not ( = ?auto_15077 ?auto_15084 ) ) ( not ( = ?auto_15078 ?auto_15076 ) ) ( not ( = ?auto_15078 ?auto_15081 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15080 ?auto_15081 ?auto_15079 ?auto_15076 )
      ( GET-3IMAGE-VERIFY ?auto_15077 ?auto_15078 ?auto_15079 ?auto_15076 ?auto_15080 ?auto_15081 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15087 - DIRECTION
      ?auto_15088 - MODE
      ?auto_15089 - DIRECTION
      ?auto_15086 - MODE
      ?auto_15090 - DIRECTION
      ?auto_15091 - MODE
    )
    :vars
    (
      ?auto_15092 - INSTRUMENT
      ?auto_15093 - SATELLITE
      ?auto_15094 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15092 ?auto_15093 ) ( SUPPORTS ?auto_15092 ?auto_15086 ) ( not ( = ?auto_15089 ?auto_15094 ) ) ( HAVE_IMAGE ?auto_15087 ?auto_15088 ) ( not ( = ?auto_15087 ?auto_15089 ) ) ( not ( = ?auto_15087 ?auto_15094 ) ) ( not ( = ?auto_15088 ?auto_15086 ) ) ( CALIBRATION_TARGET ?auto_15092 ?auto_15094 ) ( POWER_AVAIL ?auto_15093 ) ( POINTING ?auto_15093 ?auto_15090 ) ( not ( = ?auto_15094 ?auto_15090 ) ) ( not ( = ?auto_15089 ?auto_15090 ) ) ( not ( = ?auto_15087 ?auto_15090 ) ) ( HAVE_IMAGE ?auto_15090 ?auto_15091 ) ( not ( = ?auto_15088 ?auto_15091 ) ) ( not ( = ?auto_15086 ?auto_15091 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15087 ?auto_15088 ?auto_15089 ?auto_15086 )
      ( GET-3IMAGE-VERIFY ?auto_15087 ?auto_15088 ?auto_15089 ?auto_15086 ?auto_15090 ?auto_15091 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15106 - DIRECTION
      ?auto_15107 - MODE
      ?auto_15108 - DIRECTION
      ?auto_15105 - MODE
      ?auto_15109 - DIRECTION
      ?auto_15110 - MODE
    )
    :vars
    (
      ?auto_15111 - INSTRUMENT
      ?auto_15112 - SATELLITE
      ?auto_15113 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15111 ?auto_15112 ) ( SUPPORTS ?auto_15111 ?auto_15110 ) ( not ( = ?auto_15109 ?auto_15113 ) ) ( HAVE_IMAGE ?auto_15108 ?auto_15105 ) ( not ( = ?auto_15108 ?auto_15109 ) ) ( not ( = ?auto_15108 ?auto_15113 ) ) ( not ( = ?auto_15105 ?auto_15110 ) ) ( CALIBRATION_TARGET ?auto_15111 ?auto_15113 ) ( POWER_AVAIL ?auto_15112 ) ( POINTING ?auto_15112 ?auto_15106 ) ( not ( = ?auto_15113 ?auto_15106 ) ) ( not ( = ?auto_15109 ?auto_15106 ) ) ( not ( = ?auto_15108 ?auto_15106 ) ) ( HAVE_IMAGE ?auto_15106 ?auto_15107 ) ( not ( = ?auto_15107 ?auto_15105 ) ) ( not ( = ?auto_15107 ?auto_15110 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15108 ?auto_15105 ?auto_15109 ?auto_15110 )
      ( GET-3IMAGE-VERIFY ?auto_15106 ?auto_15107 ?auto_15108 ?auto_15105 ?auto_15109 ?auto_15110 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15115 - DIRECTION
      ?auto_15116 - MODE
      ?auto_15117 - DIRECTION
      ?auto_15114 - MODE
      ?auto_15118 - DIRECTION
      ?auto_15119 - MODE
    )
    :vars
    (
      ?auto_15120 - INSTRUMENT
      ?auto_15121 - SATELLITE
      ?auto_15122 - DIRECTION
      ?auto_15124 - DIRECTION
      ?auto_15123 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_15120 ?auto_15121 ) ( SUPPORTS ?auto_15120 ?auto_15119 ) ( not ( = ?auto_15118 ?auto_15122 ) ) ( HAVE_IMAGE ?auto_15124 ?auto_15123 ) ( not ( = ?auto_15124 ?auto_15118 ) ) ( not ( = ?auto_15124 ?auto_15122 ) ) ( not ( = ?auto_15123 ?auto_15119 ) ) ( CALIBRATION_TARGET ?auto_15120 ?auto_15122 ) ( POWER_AVAIL ?auto_15121 ) ( POINTING ?auto_15121 ?auto_15117 ) ( not ( = ?auto_15122 ?auto_15117 ) ) ( not ( = ?auto_15118 ?auto_15117 ) ) ( not ( = ?auto_15124 ?auto_15117 ) ) ( HAVE_IMAGE ?auto_15115 ?auto_15116 ) ( HAVE_IMAGE ?auto_15117 ?auto_15114 ) ( not ( = ?auto_15115 ?auto_15117 ) ) ( not ( = ?auto_15115 ?auto_15118 ) ) ( not ( = ?auto_15115 ?auto_15122 ) ) ( not ( = ?auto_15115 ?auto_15124 ) ) ( not ( = ?auto_15116 ?auto_15114 ) ) ( not ( = ?auto_15116 ?auto_15119 ) ) ( not ( = ?auto_15116 ?auto_15123 ) ) ( not ( = ?auto_15114 ?auto_15119 ) ) ( not ( = ?auto_15114 ?auto_15123 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15124 ?auto_15123 ?auto_15118 ?auto_15119 )
      ( GET-3IMAGE-VERIFY ?auto_15115 ?auto_15116 ?auto_15117 ?auto_15114 ?auto_15118 ?auto_15119 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15126 - DIRECTION
      ?auto_15127 - MODE
      ?auto_15128 - DIRECTION
      ?auto_15125 - MODE
      ?auto_15129 - DIRECTION
      ?auto_15130 - MODE
    )
    :vars
    (
      ?auto_15131 - INSTRUMENT
      ?auto_15132 - SATELLITE
      ?auto_15133 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15131 ?auto_15132 ) ( SUPPORTS ?auto_15131 ?auto_15125 ) ( not ( = ?auto_15128 ?auto_15133 ) ) ( HAVE_IMAGE ?auto_15129 ?auto_15130 ) ( not ( = ?auto_15129 ?auto_15128 ) ) ( not ( = ?auto_15129 ?auto_15133 ) ) ( not ( = ?auto_15130 ?auto_15125 ) ) ( CALIBRATION_TARGET ?auto_15131 ?auto_15133 ) ( POWER_AVAIL ?auto_15132 ) ( POINTING ?auto_15132 ?auto_15126 ) ( not ( = ?auto_15133 ?auto_15126 ) ) ( not ( = ?auto_15128 ?auto_15126 ) ) ( not ( = ?auto_15129 ?auto_15126 ) ) ( HAVE_IMAGE ?auto_15126 ?auto_15127 ) ( not ( = ?auto_15127 ?auto_15125 ) ) ( not ( = ?auto_15127 ?auto_15130 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15129 ?auto_15130 ?auto_15128 ?auto_15125 )
      ( GET-3IMAGE-VERIFY ?auto_15126 ?auto_15127 ?auto_15128 ?auto_15125 ?auto_15129 ?auto_15130 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15135 - DIRECTION
      ?auto_15136 - MODE
      ?auto_15137 - DIRECTION
      ?auto_15134 - MODE
      ?auto_15138 - DIRECTION
      ?auto_15139 - MODE
    )
    :vars
    (
      ?auto_15140 - INSTRUMENT
      ?auto_15141 - SATELLITE
      ?auto_15142 - DIRECTION
      ?auto_15144 - DIRECTION
      ?auto_15143 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_15140 ?auto_15141 ) ( SUPPORTS ?auto_15140 ?auto_15134 ) ( not ( = ?auto_15137 ?auto_15142 ) ) ( HAVE_IMAGE ?auto_15144 ?auto_15143 ) ( not ( = ?auto_15144 ?auto_15137 ) ) ( not ( = ?auto_15144 ?auto_15142 ) ) ( not ( = ?auto_15143 ?auto_15134 ) ) ( CALIBRATION_TARGET ?auto_15140 ?auto_15142 ) ( POWER_AVAIL ?auto_15141 ) ( POINTING ?auto_15141 ?auto_15135 ) ( not ( = ?auto_15142 ?auto_15135 ) ) ( not ( = ?auto_15137 ?auto_15135 ) ) ( not ( = ?auto_15144 ?auto_15135 ) ) ( HAVE_IMAGE ?auto_15135 ?auto_15136 ) ( HAVE_IMAGE ?auto_15138 ?auto_15139 ) ( not ( = ?auto_15135 ?auto_15138 ) ) ( not ( = ?auto_15136 ?auto_15134 ) ) ( not ( = ?auto_15136 ?auto_15139 ) ) ( not ( = ?auto_15136 ?auto_15143 ) ) ( not ( = ?auto_15137 ?auto_15138 ) ) ( not ( = ?auto_15134 ?auto_15139 ) ) ( not ( = ?auto_15138 ?auto_15142 ) ) ( not ( = ?auto_15138 ?auto_15144 ) ) ( not ( = ?auto_15139 ?auto_15143 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15144 ?auto_15143 ?auto_15137 ?auto_15134 )
      ( GET-3IMAGE-VERIFY ?auto_15135 ?auto_15136 ?auto_15137 ?auto_15134 ?auto_15138 ?auto_15139 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15157 - DIRECTION
      ?auto_15158 - MODE
      ?auto_15159 - DIRECTION
      ?auto_15156 - MODE
      ?auto_15160 - DIRECTION
      ?auto_15161 - MODE
    )
    :vars
    (
      ?auto_15162 - INSTRUMENT
      ?auto_15163 - SATELLITE
      ?auto_15165 - DIRECTION
      ?auto_15164 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15162 ?auto_15163 ) ( SUPPORTS ?auto_15162 ?auto_15158 ) ( not ( = ?auto_15157 ?auto_15165 ) ) ( HAVE_IMAGE ?auto_15159 ?auto_15161 ) ( not ( = ?auto_15159 ?auto_15157 ) ) ( not ( = ?auto_15159 ?auto_15165 ) ) ( not ( = ?auto_15161 ?auto_15158 ) ) ( CALIBRATION_TARGET ?auto_15162 ?auto_15165 ) ( POWER_AVAIL ?auto_15163 ) ( POINTING ?auto_15163 ?auto_15164 ) ( not ( = ?auto_15165 ?auto_15164 ) ) ( not ( = ?auto_15157 ?auto_15164 ) ) ( not ( = ?auto_15159 ?auto_15164 ) ) ( HAVE_IMAGE ?auto_15159 ?auto_15156 ) ( HAVE_IMAGE ?auto_15160 ?auto_15161 ) ( not ( = ?auto_15157 ?auto_15160 ) ) ( not ( = ?auto_15158 ?auto_15156 ) ) ( not ( = ?auto_15159 ?auto_15160 ) ) ( not ( = ?auto_15156 ?auto_15161 ) ) ( not ( = ?auto_15160 ?auto_15165 ) ) ( not ( = ?auto_15160 ?auto_15164 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15159 ?auto_15161 ?auto_15157 ?auto_15158 )
      ( GET-3IMAGE-VERIFY ?auto_15157 ?auto_15158 ?auto_15159 ?auto_15156 ?auto_15160 ?auto_15161 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15167 - DIRECTION
      ?auto_15168 - MODE
      ?auto_15169 - DIRECTION
      ?auto_15166 - MODE
      ?auto_15170 - DIRECTION
      ?auto_15171 - MODE
    )
    :vars
    (
      ?auto_15172 - INSTRUMENT
      ?auto_15173 - SATELLITE
      ?auto_15174 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15172 ?auto_15173 ) ( SUPPORTS ?auto_15172 ?auto_15168 ) ( not ( = ?auto_15167 ?auto_15174 ) ) ( HAVE_IMAGE ?auto_15169 ?auto_15166 ) ( not ( = ?auto_15169 ?auto_15167 ) ) ( not ( = ?auto_15169 ?auto_15174 ) ) ( not ( = ?auto_15166 ?auto_15168 ) ) ( CALIBRATION_TARGET ?auto_15172 ?auto_15174 ) ( POWER_AVAIL ?auto_15173 ) ( POINTING ?auto_15173 ?auto_15170 ) ( not ( = ?auto_15174 ?auto_15170 ) ) ( not ( = ?auto_15167 ?auto_15170 ) ) ( not ( = ?auto_15169 ?auto_15170 ) ) ( HAVE_IMAGE ?auto_15170 ?auto_15171 ) ( not ( = ?auto_15168 ?auto_15171 ) ) ( not ( = ?auto_15166 ?auto_15171 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15169 ?auto_15166 ?auto_15167 ?auto_15168 )
      ( GET-3IMAGE-VERIFY ?auto_15167 ?auto_15168 ?auto_15169 ?auto_15166 ?auto_15170 ?auto_15171 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15186 - DIRECTION
      ?auto_15187 - MODE
      ?auto_15188 - DIRECTION
      ?auto_15185 - MODE
      ?auto_15189 - DIRECTION
      ?auto_15190 - MODE
    )
    :vars
    (
      ?auto_15191 - INSTRUMENT
      ?auto_15192 - SATELLITE
      ?auto_15193 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15191 ?auto_15192 ) ( SUPPORTS ?auto_15191 ?auto_15187 ) ( not ( = ?auto_15186 ?auto_15193 ) ) ( HAVE_IMAGE ?auto_15189 ?auto_15190 ) ( not ( = ?auto_15189 ?auto_15186 ) ) ( not ( = ?auto_15189 ?auto_15193 ) ) ( not ( = ?auto_15190 ?auto_15187 ) ) ( CALIBRATION_TARGET ?auto_15191 ?auto_15193 ) ( POWER_AVAIL ?auto_15192 ) ( POINTING ?auto_15192 ?auto_15188 ) ( not ( = ?auto_15193 ?auto_15188 ) ) ( not ( = ?auto_15186 ?auto_15188 ) ) ( not ( = ?auto_15189 ?auto_15188 ) ) ( HAVE_IMAGE ?auto_15188 ?auto_15185 ) ( not ( = ?auto_15187 ?auto_15185 ) ) ( not ( = ?auto_15185 ?auto_15190 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15189 ?auto_15190 ?auto_15186 ?auto_15187 )
      ( GET-3IMAGE-VERIFY ?auto_15186 ?auto_15187 ?auto_15188 ?auto_15185 ?auto_15189 ?auto_15190 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15195 - DIRECTION
      ?auto_15196 - MODE
      ?auto_15197 - DIRECTION
      ?auto_15194 - MODE
      ?auto_15198 - DIRECTION
      ?auto_15199 - MODE
    )
    :vars
    (
      ?auto_15200 - INSTRUMENT
      ?auto_15201 - SATELLITE
      ?auto_15202 - DIRECTION
      ?auto_15204 - DIRECTION
      ?auto_15203 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_15200 ?auto_15201 ) ( SUPPORTS ?auto_15200 ?auto_15196 ) ( not ( = ?auto_15195 ?auto_15202 ) ) ( HAVE_IMAGE ?auto_15204 ?auto_15203 ) ( not ( = ?auto_15204 ?auto_15195 ) ) ( not ( = ?auto_15204 ?auto_15202 ) ) ( not ( = ?auto_15203 ?auto_15196 ) ) ( CALIBRATION_TARGET ?auto_15200 ?auto_15202 ) ( POWER_AVAIL ?auto_15201 ) ( POINTING ?auto_15201 ?auto_15198 ) ( not ( = ?auto_15202 ?auto_15198 ) ) ( not ( = ?auto_15195 ?auto_15198 ) ) ( not ( = ?auto_15204 ?auto_15198 ) ) ( HAVE_IMAGE ?auto_15197 ?auto_15194 ) ( HAVE_IMAGE ?auto_15198 ?auto_15199 ) ( not ( = ?auto_15195 ?auto_15197 ) ) ( not ( = ?auto_15196 ?auto_15194 ) ) ( not ( = ?auto_15196 ?auto_15199 ) ) ( not ( = ?auto_15197 ?auto_15198 ) ) ( not ( = ?auto_15197 ?auto_15202 ) ) ( not ( = ?auto_15197 ?auto_15204 ) ) ( not ( = ?auto_15194 ?auto_15199 ) ) ( not ( = ?auto_15194 ?auto_15203 ) ) ( not ( = ?auto_15199 ?auto_15203 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15204 ?auto_15203 ?auto_15195 ?auto_15196 )
      ( GET-3IMAGE-VERIFY ?auto_15195 ?auto_15196 ?auto_15197 ?auto_15194 ?auto_15198 ?auto_15199 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15249 - DIRECTION
      ?auto_15250 - MODE
    )
    :vars
    (
      ?auto_15251 - INSTRUMENT
      ?auto_15252 - SATELLITE
      ?auto_15254 - DIRECTION
      ?auto_15256 - DIRECTION
      ?auto_15255 - MODE
      ?auto_15253 - DIRECTION
      ?auto_15257 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15251 ?auto_15252 ) ( SUPPORTS ?auto_15251 ?auto_15250 ) ( not ( = ?auto_15249 ?auto_15254 ) ) ( HAVE_IMAGE ?auto_15256 ?auto_15255 ) ( not ( = ?auto_15256 ?auto_15249 ) ) ( not ( = ?auto_15256 ?auto_15254 ) ) ( not ( = ?auto_15255 ?auto_15250 ) ) ( CALIBRATION_TARGET ?auto_15251 ?auto_15254 ) ( POINTING ?auto_15252 ?auto_15253 ) ( not ( = ?auto_15254 ?auto_15253 ) ) ( not ( = ?auto_15249 ?auto_15253 ) ) ( not ( = ?auto_15256 ?auto_15253 ) ) ( ON_BOARD ?auto_15257 ?auto_15252 ) ( POWER_ON ?auto_15257 ) ( not ( = ?auto_15251 ?auto_15257 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_15257 ?auto_15252 )
      ( GET-2IMAGE ?auto_15256 ?auto_15255 ?auto_15249 ?auto_15250 )
      ( GET-1IMAGE-VERIFY ?auto_15249 ?auto_15250 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15259 - DIRECTION
      ?auto_15260 - MODE
      ?auto_15261 - DIRECTION
      ?auto_15258 - MODE
    )
    :vars
    (
      ?auto_15264 - INSTRUMENT
      ?auto_15266 - SATELLITE
      ?auto_15262 - DIRECTION
      ?auto_15263 - DIRECTION
      ?auto_15265 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15264 ?auto_15266 ) ( SUPPORTS ?auto_15264 ?auto_15258 ) ( not ( = ?auto_15261 ?auto_15262 ) ) ( HAVE_IMAGE ?auto_15259 ?auto_15260 ) ( not ( = ?auto_15259 ?auto_15261 ) ) ( not ( = ?auto_15259 ?auto_15262 ) ) ( not ( = ?auto_15260 ?auto_15258 ) ) ( CALIBRATION_TARGET ?auto_15264 ?auto_15262 ) ( POINTING ?auto_15266 ?auto_15263 ) ( not ( = ?auto_15262 ?auto_15263 ) ) ( not ( = ?auto_15261 ?auto_15263 ) ) ( not ( = ?auto_15259 ?auto_15263 ) ) ( ON_BOARD ?auto_15265 ?auto_15266 ) ( POWER_ON ?auto_15265 ) ( not ( = ?auto_15264 ?auto_15265 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15261 ?auto_15258 )
      ( GET-2IMAGE-VERIFY ?auto_15259 ?auto_15260 ?auto_15261 ?auto_15258 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15268 - DIRECTION
      ?auto_15269 - MODE
      ?auto_15270 - DIRECTION
      ?auto_15267 - MODE
    )
    :vars
    (
      ?auto_15273 - INSTRUMENT
      ?auto_15272 - SATELLITE
      ?auto_15271 - DIRECTION
      ?auto_15276 - DIRECTION
      ?auto_15275 - MODE
      ?auto_15274 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15273 ?auto_15272 ) ( SUPPORTS ?auto_15273 ?auto_15267 ) ( not ( = ?auto_15270 ?auto_15271 ) ) ( HAVE_IMAGE ?auto_15276 ?auto_15275 ) ( not ( = ?auto_15276 ?auto_15270 ) ) ( not ( = ?auto_15276 ?auto_15271 ) ) ( not ( = ?auto_15275 ?auto_15267 ) ) ( CALIBRATION_TARGET ?auto_15273 ?auto_15271 ) ( POINTING ?auto_15272 ?auto_15268 ) ( not ( = ?auto_15271 ?auto_15268 ) ) ( not ( = ?auto_15270 ?auto_15268 ) ) ( not ( = ?auto_15276 ?auto_15268 ) ) ( ON_BOARD ?auto_15274 ?auto_15272 ) ( POWER_ON ?auto_15274 ) ( not ( = ?auto_15273 ?auto_15274 ) ) ( HAVE_IMAGE ?auto_15268 ?auto_15269 ) ( not ( = ?auto_15269 ?auto_15267 ) ) ( not ( = ?auto_15269 ?auto_15275 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15276 ?auto_15275 ?auto_15270 ?auto_15267 )
      ( GET-2IMAGE-VERIFY ?auto_15268 ?auto_15269 ?auto_15270 ?auto_15267 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15278 - DIRECTION
      ?auto_15279 - MODE
      ?auto_15280 - DIRECTION
      ?auto_15277 - MODE
    )
    :vars
    (
      ?auto_15283 - INSTRUMENT
      ?auto_15282 - SATELLITE
      ?auto_15281 - DIRECTION
      ?auto_15284 - DIRECTION
      ?auto_15285 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15283 ?auto_15282 ) ( SUPPORTS ?auto_15283 ?auto_15279 ) ( not ( = ?auto_15278 ?auto_15281 ) ) ( HAVE_IMAGE ?auto_15280 ?auto_15277 ) ( not ( = ?auto_15280 ?auto_15278 ) ) ( not ( = ?auto_15280 ?auto_15281 ) ) ( not ( = ?auto_15277 ?auto_15279 ) ) ( CALIBRATION_TARGET ?auto_15283 ?auto_15281 ) ( POINTING ?auto_15282 ?auto_15284 ) ( not ( = ?auto_15281 ?auto_15284 ) ) ( not ( = ?auto_15278 ?auto_15284 ) ) ( not ( = ?auto_15280 ?auto_15284 ) ) ( ON_BOARD ?auto_15285 ?auto_15282 ) ( POWER_ON ?auto_15285 ) ( not ( = ?auto_15283 ?auto_15285 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15280 ?auto_15277 ?auto_15278 ?auto_15279 )
      ( GET-2IMAGE-VERIFY ?auto_15278 ?auto_15279 ?auto_15280 ?auto_15277 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15287 - DIRECTION
      ?auto_15288 - MODE
      ?auto_15289 - DIRECTION
      ?auto_15286 - MODE
    )
    :vars
    (
      ?auto_15292 - INSTRUMENT
      ?auto_15291 - SATELLITE
      ?auto_15290 - DIRECTION
      ?auto_15295 - DIRECTION
      ?auto_15294 - MODE
      ?auto_15293 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15292 ?auto_15291 ) ( SUPPORTS ?auto_15292 ?auto_15288 ) ( not ( = ?auto_15287 ?auto_15290 ) ) ( HAVE_IMAGE ?auto_15295 ?auto_15294 ) ( not ( = ?auto_15295 ?auto_15287 ) ) ( not ( = ?auto_15295 ?auto_15290 ) ) ( not ( = ?auto_15294 ?auto_15288 ) ) ( CALIBRATION_TARGET ?auto_15292 ?auto_15290 ) ( POINTING ?auto_15291 ?auto_15289 ) ( not ( = ?auto_15290 ?auto_15289 ) ) ( not ( = ?auto_15287 ?auto_15289 ) ) ( not ( = ?auto_15295 ?auto_15289 ) ) ( ON_BOARD ?auto_15293 ?auto_15291 ) ( POWER_ON ?auto_15293 ) ( not ( = ?auto_15292 ?auto_15293 ) ) ( HAVE_IMAGE ?auto_15289 ?auto_15286 ) ( not ( = ?auto_15288 ?auto_15286 ) ) ( not ( = ?auto_15286 ?auto_15294 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15295 ?auto_15294 ?auto_15287 ?auto_15288 )
      ( GET-2IMAGE-VERIFY ?auto_15287 ?auto_15288 ?auto_15289 ?auto_15286 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15308 - DIRECTION
      ?auto_15309 - MODE
      ?auto_15310 - DIRECTION
      ?auto_15307 - MODE
      ?auto_15311 - DIRECTION
      ?auto_15312 - MODE
    )
    :vars
    (
      ?auto_15315 - INSTRUMENT
      ?auto_15314 - SATELLITE
      ?auto_15313 - DIRECTION
      ?auto_15316 - DIRECTION
      ?auto_15317 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15315 ?auto_15314 ) ( SUPPORTS ?auto_15315 ?auto_15312 ) ( not ( = ?auto_15311 ?auto_15313 ) ) ( HAVE_IMAGE ?auto_15310 ?auto_15307 ) ( not ( = ?auto_15310 ?auto_15311 ) ) ( not ( = ?auto_15310 ?auto_15313 ) ) ( not ( = ?auto_15307 ?auto_15312 ) ) ( CALIBRATION_TARGET ?auto_15315 ?auto_15313 ) ( POINTING ?auto_15314 ?auto_15316 ) ( not ( = ?auto_15313 ?auto_15316 ) ) ( not ( = ?auto_15311 ?auto_15316 ) ) ( not ( = ?auto_15310 ?auto_15316 ) ) ( ON_BOARD ?auto_15317 ?auto_15314 ) ( POWER_ON ?auto_15317 ) ( not ( = ?auto_15315 ?auto_15317 ) ) ( HAVE_IMAGE ?auto_15308 ?auto_15309 ) ( not ( = ?auto_15308 ?auto_15310 ) ) ( not ( = ?auto_15308 ?auto_15311 ) ) ( not ( = ?auto_15308 ?auto_15313 ) ) ( not ( = ?auto_15308 ?auto_15316 ) ) ( not ( = ?auto_15309 ?auto_15307 ) ) ( not ( = ?auto_15309 ?auto_15312 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15310 ?auto_15307 ?auto_15311 ?auto_15312 )
      ( GET-3IMAGE-VERIFY ?auto_15308 ?auto_15309 ?auto_15310 ?auto_15307 ?auto_15311 ?auto_15312 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15319 - DIRECTION
      ?auto_15320 - MODE
      ?auto_15321 - DIRECTION
      ?auto_15318 - MODE
      ?auto_15322 - DIRECTION
      ?auto_15323 - MODE
    )
    :vars
    (
      ?auto_15326 - INSTRUMENT
      ?auto_15325 - SATELLITE
      ?auto_15324 - DIRECTION
      ?auto_15327 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15326 ?auto_15325 ) ( SUPPORTS ?auto_15326 ?auto_15323 ) ( not ( = ?auto_15322 ?auto_15324 ) ) ( HAVE_IMAGE ?auto_15319 ?auto_15320 ) ( not ( = ?auto_15319 ?auto_15322 ) ) ( not ( = ?auto_15319 ?auto_15324 ) ) ( not ( = ?auto_15320 ?auto_15323 ) ) ( CALIBRATION_TARGET ?auto_15326 ?auto_15324 ) ( POINTING ?auto_15325 ?auto_15321 ) ( not ( = ?auto_15324 ?auto_15321 ) ) ( not ( = ?auto_15322 ?auto_15321 ) ) ( not ( = ?auto_15319 ?auto_15321 ) ) ( ON_BOARD ?auto_15327 ?auto_15325 ) ( POWER_ON ?auto_15327 ) ( not ( = ?auto_15326 ?auto_15327 ) ) ( HAVE_IMAGE ?auto_15321 ?auto_15318 ) ( not ( = ?auto_15320 ?auto_15318 ) ) ( not ( = ?auto_15318 ?auto_15323 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15319 ?auto_15320 ?auto_15322 ?auto_15323 )
      ( GET-3IMAGE-VERIFY ?auto_15319 ?auto_15320 ?auto_15321 ?auto_15318 ?auto_15322 ?auto_15323 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15329 - DIRECTION
      ?auto_15330 - MODE
      ?auto_15331 - DIRECTION
      ?auto_15328 - MODE
      ?auto_15332 - DIRECTION
      ?auto_15333 - MODE
    )
    :vars
    (
      ?auto_15336 - INSTRUMENT
      ?auto_15335 - SATELLITE
      ?auto_15334 - DIRECTION
      ?auto_15337 - DIRECTION
      ?auto_15338 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15336 ?auto_15335 ) ( SUPPORTS ?auto_15336 ?auto_15328 ) ( not ( = ?auto_15331 ?auto_15334 ) ) ( HAVE_IMAGE ?auto_15332 ?auto_15333 ) ( not ( = ?auto_15332 ?auto_15331 ) ) ( not ( = ?auto_15332 ?auto_15334 ) ) ( not ( = ?auto_15333 ?auto_15328 ) ) ( CALIBRATION_TARGET ?auto_15336 ?auto_15334 ) ( POINTING ?auto_15335 ?auto_15337 ) ( not ( = ?auto_15334 ?auto_15337 ) ) ( not ( = ?auto_15331 ?auto_15337 ) ) ( not ( = ?auto_15332 ?auto_15337 ) ) ( ON_BOARD ?auto_15338 ?auto_15335 ) ( POWER_ON ?auto_15338 ) ( not ( = ?auto_15336 ?auto_15338 ) ) ( HAVE_IMAGE ?auto_15329 ?auto_15330 ) ( not ( = ?auto_15329 ?auto_15331 ) ) ( not ( = ?auto_15329 ?auto_15332 ) ) ( not ( = ?auto_15329 ?auto_15334 ) ) ( not ( = ?auto_15329 ?auto_15337 ) ) ( not ( = ?auto_15330 ?auto_15328 ) ) ( not ( = ?auto_15330 ?auto_15333 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15332 ?auto_15333 ?auto_15331 ?auto_15328 )
      ( GET-3IMAGE-VERIFY ?auto_15329 ?auto_15330 ?auto_15331 ?auto_15328 ?auto_15332 ?auto_15333 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15340 - DIRECTION
      ?auto_15341 - MODE
      ?auto_15342 - DIRECTION
      ?auto_15339 - MODE
      ?auto_15343 - DIRECTION
      ?auto_15344 - MODE
    )
    :vars
    (
      ?auto_15347 - INSTRUMENT
      ?auto_15346 - SATELLITE
      ?auto_15345 - DIRECTION
      ?auto_15348 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15347 ?auto_15346 ) ( SUPPORTS ?auto_15347 ?auto_15339 ) ( not ( = ?auto_15342 ?auto_15345 ) ) ( HAVE_IMAGE ?auto_15340 ?auto_15341 ) ( not ( = ?auto_15340 ?auto_15342 ) ) ( not ( = ?auto_15340 ?auto_15345 ) ) ( not ( = ?auto_15341 ?auto_15339 ) ) ( CALIBRATION_TARGET ?auto_15347 ?auto_15345 ) ( POINTING ?auto_15346 ?auto_15343 ) ( not ( = ?auto_15345 ?auto_15343 ) ) ( not ( = ?auto_15342 ?auto_15343 ) ) ( not ( = ?auto_15340 ?auto_15343 ) ) ( ON_BOARD ?auto_15348 ?auto_15346 ) ( POWER_ON ?auto_15348 ) ( not ( = ?auto_15347 ?auto_15348 ) ) ( HAVE_IMAGE ?auto_15343 ?auto_15344 ) ( not ( = ?auto_15341 ?auto_15344 ) ) ( not ( = ?auto_15339 ?auto_15344 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15340 ?auto_15341 ?auto_15342 ?auto_15339 )
      ( GET-3IMAGE-VERIFY ?auto_15340 ?auto_15341 ?auto_15342 ?auto_15339 ?auto_15343 ?auto_15344 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15361 - DIRECTION
      ?auto_15362 - MODE
      ?auto_15363 - DIRECTION
      ?auto_15360 - MODE
      ?auto_15364 - DIRECTION
      ?auto_15365 - MODE
    )
    :vars
    (
      ?auto_15368 - INSTRUMENT
      ?auto_15367 - SATELLITE
      ?auto_15366 - DIRECTION
      ?auto_15369 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15368 ?auto_15367 ) ( SUPPORTS ?auto_15368 ?auto_15365 ) ( not ( = ?auto_15364 ?auto_15366 ) ) ( HAVE_IMAGE ?auto_15363 ?auto_15360 ) ( not ( = ?auto_15363 ?auto_15364 ) ) ( not ( = ?auto_15363 ?auto_15366 ) ) ( not ( = ?auto_15360 ?auto_15365 ) ) ( CALIBRATION_TARGET ?auto_15368 ?auto_15366 ) ( POINTING ?auto_15367 ?auto_15361 ) ( not ( = ?auto_15366 ?auto_15361 ) ) ( not ( = ?auto_15364 ?auto_15361 ) ) ( not ( = ?auto_15363 ?auto_15361 ) ) ( ON_BOARD ?auto_15369 ?auto_15367 ) ( POWER_ON ?auto_15369 ) ( not ( = ?auto_15368 ?auto_15369 ) ) ( HAVE_IMAGE ?auto_15361 ?auto_15362 ) ( not ( = ?auto_15362 ?auto_15360 ) ) ( not ( = ?auto_15362 ?auto_15365 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15363 ?auto_15360 ?auto_15364 ?auto_15365 )
      ( GET-3IMAGE-VERIFY ?auto_15361 ?auto_15362 ?auto_15363 ?auto_15360 ?auto_15364 ?auto_15365 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15371 - DIRECTION
      ?auto_15372 - MODE
      ?auto_15373 - DIRECTION
      ?auto_15370 - MODE
      ?auto_15374 - DIRECTION
      ?auto_15375 - MODE
    )
    :vars
    (
      ?auto_15378 - INSTRUMENT
      ?auto_15377 - SATELLITE
      ?auto_15376 - DIRECTION
      ?auto_15381 - DIRECTION
      ?auto_15380 - MODE
      ?auto_15379 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15378 ?auto_15377 ) ( SUPPORTS ?auto_15378 ?auto_15375 ) ( not ( = ?auto_15374 ?auto_15376 ) ) ( HAVE_IMAGE ?auto_15381 ?auto_15380 ) ( not ( = ?auto_15381 ?auto_15374 ) ) ( not ( = ?auto_15381 ?auto_15376 ) ) ( not ( = ?auto_15380 ?auto_15375 ) ) ( CALIBRATION_TARGET ?auto_15378 ?auto_15376 ) ( POINTING ?auto_15377 ?auto_15373 ) ( not ( = ?auto_15376 ?auto_15373 ) ) ( not ( = ?auto_15374 ?auto_15373 ) ) ( not ( = ?auto_15381 ?auto_15373 ) ) ( ON_BOARD ?auto_15379 ?auto_15377 ) ( POWER_ON ?auto_15379 ) ( not ( = ?auto_15378 ?auto_15379 ) ) ( HAVE_IMAGE ?auto_15371 ?auto_15372 ) ( HAVE_IMAGE ?auto_15373 ?auto_15370 ) ( not ( = ?auto_15371 ?auto_15373 ) ) ( not ( = ?auto_15371 ?auto_15374 ) ) ( not ( = ?auto_15371 ?auto_15376 ) ) ( not ( = ?auto_15371 ?auto_15381 ) ) ( not ( = ?auto_15372 ?auto_15370 ) ) ( not ( = ?auto_15372 ?auto_15375 ) ) ( not ( = ?auto_15372 ?auto_15380 ) ) ( not ( = ?auto_15370 ?auto_15375 ) ) ( not ( = ?auto_15370 ?auto_15380 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15381 ?auto_15380 ?auto_15374 ?auto_15375 )
      ( GET-3IMAGE-VERIFY ?auto_15371 ?auto_15372 ?auto_15373 ?auto_15370 ?auto_15374 ?auto_15375 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15383 - DIRECTION
      ?auto_15384 - MODE
      ?auto_15385 - DIRECTION
      ?auto_15382 - MODE
      ?auto_15386 - DIRECTION
      ?auto_15387 - MODE
    )
    :vars
    (
      ?auto_15390 - INSTRUMENT
      ?auto_15389 - SATELLITE
      ?auto_15388 - DIRECTION
      ?auto_15391 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15390 ?auto_15389 ) ( SUPPORTS ?auto_15390 ?auto_15382 ) ( not ( = ?auto_15385 ?auto_15388 ) ) ( HAVE_IMAGE ?auto_15386 ?auto_15387 ) ( not ( = ?auto_15386 ?auto_15385 ) ) ( not ( = ?auto_15386 ?auto_15388 ) ) ( not ( = ?auto_15387 ?auto_15382 ) ) ( CALIBRATION_TARGET ?auto_15390 ?auto_15388 ) ( POINTING ?auto_15389 ?auto_15383 ) ( not ( = ?auto_15388 ?auto_15383 ) ) ( not ( = ?auto_15385 ?auto_15383 ) ) ( not ( = ?auto_15386 ?auto_15383 ) ) ( ON_BOARD ?auto_15391 ?auto_15389 ) ( POWER_ON ?auto_15391 ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( HAVE_IMAGE ?auto_15383 ?auto_15384 ) ( not ( = ?auto_15384 ?auto_15382 ) ) ( not ( = ?auto_15384 ?auto_15387 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15386 ?auto_15387 ?auto_15385 ?auto_15382 )
      ( GET-3IMAGE-VERIFY ?auto_15383 ?auto_15384 ?auto_15385 ?auto_15382 ?auto_15386 ?auto_15387 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15393 - DIRECTION
      ?auto_15394 - MODE
      ?auto_15395 - DIRECTION
      ?auto_15392 - MODE
      ?auto_15396 - DIRECTION
      ?auto_15397 - MODE
    )
    :vars
    (
      ?auto_15400 - INSTRUMENT
      ?auto_15399 - SATELLITE
      ?auto_15398 - DIRECTION
      ?auto_15403 - DIRECTION
      ?auto_15402 - MODE
      ?auto_15401 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15400 ?auto_15399 ) ( SUPPORTS ?auto_15400 ?auto_15392 ) ( not ( = ?auto_15395 ?auto_15398 ) ) ( HAVE_IMAGE ?auto_15403 ?auto_15402 ) ( not ( = ?auto_15403 ?auto_15395 ) ) ( not ( = ?auto_15403 ?auto_15398 ) ) ( not ( = ?auto_15402 ?auto_15392 ) ) ( CALIBRATION_TARGET ?auto_15400 ?auto_15398 ) ( POINTING ?auto_15399 ?auto_15393 ) ( not ( = ?auto_15398 ?auto_15393 ) ) ( not ( = ?auto_15395 ?auto_15393 ) ) ( not ( = ?auto_15403 ?auto_15393 ) ) ( ON_BOARD ?auto_15401 ?auto_15399 ) ( POWER_ON ?auto_15401 ) ( not ( = ?auto_15400 ?auto_15401 ) ) ( HAVE_IMAGE ?auto_15393 ?auto_15394 ) ( HAVE_IMAGE ?auto_15396 ?auto_15397 ) ( not ( = ?auto_15393 ?auto_15396 ) ) ( not ( = ?auto_15394 ?auto_15392 ) ) ( not ( = ?auto_15394 ?auto_15397 ) ) ( not ( = ?auto_15394 ?auto_15402 ) ) ( not ( = ?auto_15395 ?auto_15396 ) ) ( not ( = ?auto_15392 ?auto_15397 ) ) ( not ( = ?auto_15396 ?auto_15398 ) ) ( not ( = ?auto_15396 ?auto_15403 ) ) ( not ( = ?auto_15397 ?auto_15402 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15403 ?auto_15402 ?auto_15395 ?auto_15392 )
      ( GET-3IMAGE-VERIFY ?auto_15393 ?auto_15394 ?auto_15395 ?auto_15392 ?auto_15396 ?auto_15397 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15417 - DIRECTION
      ?auto_15418 - MODE
      ?auto_15419 - DIRECTION
      ?auto_15416 - MODE
      ?auto_15420 - DIRECTION
      ?auto_15421 - MODE
    )
    :vars
    (
      ?auto_15424 - INSTRUMENT
      ?auto_15423 - SATELLITE
      ?auto_15422 - DIRECTION
      ?auto_15425 - DIRECTION
      ?auto_15426 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15424 ?auto_15423 ) ( SUPPORTS ?auto_15424 ?auto_15418 ) ( not ( = ?auto_15417 ?auto_15422 ) ) ( HAVE_IMAGE ?auto_15420 ?auto_15416 ) ( not ( = ?auto_15420 ?auto_15417 ) ) ( not ( = ?auto_15420 ?auto_15422 ) ) ( not ( = ?auto_15416 ?auto_15418 ) ) ( CALIBRATION_TARGET ?auto_15424 ?auto_15422 ) ( POINTING ?auto_15423 ?auto_15425 ) ( not ( = ?auto_15422 ?auto_15425 ) ) ( not ( = ?auto_15417 ?auto_15425 ) ) ( not ( = ?auto_15420 ?auto_15425 ) ) ( ON_BOARD ?auto_15426 ?auto_15423 ) ( POWER_ON ?auto_15426 ) ( not ( = ?auto_15424 ?auto_15426 ) ) ( HAVE_IMAGE ?auto_15419 ?auto_15416 ) ( HAVE_IMAGE ?auto_15420 ?auto_15421 ) ( not ( = ?auto_15417 ?auto_15419 ) ) ( not ( = ?auto_15418 ?auto_15421 ) ) ( not ( = ?auto_15419 ?auto_15420 ) ) ( not ( = ?auto_15419 ?auto_15422 ) ) ( not ( = ?auto_15419 ?auto_15425 ) ) ( not ( = ?auto_15416 ?auto_15421 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15420 ?auto_15416 ?auto_15417 ?auto_15418 )
      ( GET-3IMAGE-VERIFY ?auto_15417 ?auto_15418 ?auto_15419 ?auto_15416 ?auto_15420 ?auto_15421 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15428 - DIRECTION
      ?auto_15429 - MODE
      ?auto_15430 - DIRECTION
      ?auto_15427 - MODE
      ?auto_15431 - DIRECTION
      ?auto_15432 - MODE
    )
    :vars
    (
      ?auto_15435 - INSTRUMENT
      ?auto_15434 - SATELLITE
      ?auto_15433 - DIRECTION
      ?auto_15436 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15435 ?auto_15434 ) ( SUPPORTS ?auto_15435 ?auto_15429 ) ( not ( = ?auto_15428 ?auto_15433 ) ) ( HAVE_IMAGE ?auto_15430 ?auto_15427 ) ( not ( = ?auto_15430 ?auto_15428 ) ) ( not ( = ?auto_15430 ?auto_15433 ) ) ( not ( = ?auto_15427 ?auto_15429 ) ) ( CALIBRATION_TARGET ?auto_15435 ?auto_15433 ) ( POINTING ?auto_15434 ?auto_15431 ) ( not ( = ?auto_15433 ?auto_15431 ) ) ( not ( = ?auto_15428 ?auto_15431 ) ) ( not ( = ?auto_15430 ?auto_15431 ) ) ( ON_BOARD ?auto_15436 ?auto_15434 ) ( POWER_ON ?auto_15436 ) ( not ( = ?auto_15435 ?auto_15436 ) ) ( HAVE_IMAGE ?auto_15431 ?auto_15432 ) ( not ( = ?auto_15429 ?auto_15432 ) ) ( not ( = ?auto_15427 ?auto_15432 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15430 ?auto_15427 ?auto_15428 ?auto_15429 )
      ( GET-3IMAGE-VERIFY ?auto_15428 ?auto_15429 ?auto_15430 ?auto_15427 ?auto_15431 ?auto_15432 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15449 - DIRECTION
      ?auto_15450 - MODE
      ?auto_15451 - DIRECTION
      ?auto_15448 - MODE
      ?auto_15452 - DIRECTION
      ?auto_15453 - MODE
    )
    :vars
    (
      ?auto_15456 - INSTRUMENT
      ?auto_15455 - SATELLITE
      ?auto_15454 - DIRECTION
      ?auto_15457 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15456 ?auto_15455 ) ( SUPPORTS ?auto_15456 ?auto_15450 ) ( not ( = ?auto_15449 ?auto_15454 ) ) ( HAVE_IMAGE ?auto_15452 ?auto_15453 ) ( not ( = ?auto_15452 ?auto_15449 ) ) ( not ( = ?auto_15452 ?auto_15454 ) ) ( not ( = ?auto_15453 ?auto_15450 ) ) ( CALIBRATION_TARGET ?auto_15456 ?auto_15454 ) ( POINTING ?auto_15455 ?auto_15451 ) ( not ( = ?auto_15454 ?auto_15451 ) ) ( not ( = ?auto_15449 ?auto_15451 ) ) ( not ( = ?auto_15452 ?auto_15451 ) ) ( ON_BOARD ?auto_15457 ?auto_15455 ) ( POWER_ON ?auto_15457 ) ( not ( = ?auto_15456 ?auto_15457 ) ) ( HAVE_IMAGE ?auto_15451 ?auto_15448 ) ( not ( = ?auto_15450 ?auto_15448 ) ) ( not ( = ?auto_15448 ?auto_15453 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15452 ?auto_15453 ?auto_15449 ?auto_15450 )
      ( GET-3IMAGE-VERIFY ?auto_15449 ?auto_15450 ?auto_15451 ?auto_15448 ?auto_15452 ?auto_15453 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15459 - DIRECTION
      ?auto_15460 - MODE
      ?auto_15461 - DIRECTION
      ?auto_15458 - MODE
      ?auto_15462 - DIRECTION
      ?auto_15463 - MODE
    )
    :vars
    (
      ?auto_15466 - INSTRUMENT
      ?auto_15465 - SATELLITE
      ?auto_15464 - DIRECTION
      ?auto_15469 - DIRECTION
      ?auto_15468 - MODE
      ?auto_15467 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15466 ?auto_15465 ) ( SUPPORTS ?auto_15466 ?auto_15460 ) ( not ( = ?auto_15459 ?auto_15464 ) ) ( HAVE_IMAGE ?auto_15469 ?auto_15468 ) ( not ( = ?auto_15469 ?auto_15459 ) ) ( not ( = ?auto_15469 ?auto_15464 ) ) ( not ( = ?auto_15468 ?auto_15460 ) ) ( CALIBRATION_TARGET ?auto_15466 ?auto_15464 ) ( POINTING ?auto_15465 ?auto_15462 ) ( not ( = ?auto_15464 ?auto_15462 ) ) ( not ( = ?auto_15459 ?auto_15462 ) ) ( not ( = ?auto_15469 ?auto_15462 ) ) ( ON_BOARD ?auto_15467 ?auto_15465 ) ( POWER_ON ?auto_15467 ) ( not ( = ?auto_15466 ?auto_15467 ) ) ( HAVE_IMAGE ?auto_15461 ?auto_15458 ) ( HAVE_IMAGE ?auto_15462 ?auto_15463 ) ( not ( = ?auto_15459 ?auto_15461 ) ) ( not ( = ?auto_15460 ?auto_15458 ) ) ( not ( = ?auto_15460 ?auto_15463 ) ) ( not ( = ?auto_15461 ?auto_15462 ) ) ( not ( = ?auto_15461 ?auto_15464 ) ) ( not ( = ?auto_15461 ?auto_15469 ) ) ( not ( = ?auto_15458 ?auto_15463 ) ) ( not ( = ?auto_15458 ?auto_15468 ) ) ( not ( = ?auto_15463 ?auto_15468 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15469 ?auto_15468 ?auto_15459 ?auto_15460 )
      ( GET-3IMAGE-VERIFY ?auto_15459 ?auto_15460 ?auto_15461 ?auto_15458 ?auto_15462 ?auto_15463 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15560 - DIRECTION
      ?auto_15561 - MODE
      ?auto_15562 - DIRECTION
      ?auto_15559 - MODE
      ?auto_15563 - DIRECTION
      ?auto_15564 - MODE
    )
    :vars
    (
      ?auto_15566 - INSTRUMENT
      ?auto_15567 - SATELLITE
      ?auto_15568 - DIRECTION
      ?auto_15565 - DIRECTION
      ?auto_15569 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15566 ?auto_15567 ) ( SUPPORTS ?auto_15566 ?auto_15564 ) ( not ( = ?auto_15563 ?auto_15568 ) ) ( HAVE_IMAGE ?auto_15560 ?auto_15559 ) ( not ( = ?auto_15560 ?auto_15563 ) ) ( not ( = ?auto_15560 ?auto_15568 ) ) ( not ( = ?auto_15559 ?auto_15564 ) ) ( CALIBRATION_TARGET ?auto_15566 ?auto_15568 ) ( POINTING ?auto_15567 ?auto_15565 ) ( not ( = ?auto_15568 ?auto_15565 ) ) ( not ( = ?auto_15563 ?auto_15565 ) ) ( not ( = ?auto_15560 ?auto_15565 ) ) ( ON_BOARD ?auto_15569 ?auto_15567 ) ( POWER_ON ?auto_15569 ) ( not ( = ?auto_15566 ?auto_15569 ) ) ( HAVE_IMAGE ?auto_15560 ?auto_15561 ) ( HAVE_IMAGE ?auto_15562 ?auto_15559 ) ( not ( = ?auto_15560 ?auto_15562 ) ) ( not ( = ?auto_15561 ?auto_15559 ) ) ( not ( = ?auto_15561 ?auto_15564 ) ) ( not ( = ?auto_15562 ?auto_15563 ) ) ( not ( = ?auto_15562 ?auto_15568 ) ) ( not ( = ?auto_15562 ?auto_15565 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15560 ?auto_15559 ?auto_15563 ?auto_15564 )
      ( GET-3IMAGE-VERIFY ?auto_15560 ?auto_15561 ?auto_15562 ?auto_15559 ?auto_15563 ?auto_15564 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15581 - DIRECTION
      ?auto_15582 - MODE
      ?auto_15583 - DIRECTION
      ?auto_15580 - MODE
      ?auto_15584 - DIRECTION
      ?auto_15585 - MODE
    )
    :vars
    (
      ?auto_15587 - INSTRUMENT
      ?auto_15588 - SATELLITE
      ?auto_15589 - DIRECTION
      ?auto_15586 - DIRECTION
      ?auto_15590 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15587 ?auto_15588 ) ( SUPPORTS ?auto_15587 ?auto_15580 ) ( not ( = ?auto_15583 ?auto_15589 ) ) ( HAVE_IMAGE ?auto_15581 ?auto_15582 ) ( not ( = ?auto_15581 ?auto_15583 ) ) ( not ( = ?auto_15581 ?auto_15589 ) ) ( not ( = ?auto_15582 ?auto_15580 ) ) ( CALIBRATION_TARGET ?auto_15587 ?auto_15589 ) ( POINTING ?auto_15588 ?auto_15586 ) ( not ( = ?auto_15589 ?auto_15586 ) ) ( not ( = ?auto_15583 ?auto_15586 ) ) ( not ( = ?auto_15581 ?auto_15586 ) ) ( ON_BOARD ?auto_15590 ?auto_15588 ) ( POWER_ON ?auto_15590 ) ( not ( = ?auto_15587 ?auto_15590 ) ) ( HAVE_IMAGE ?auto_15584 ?auto_15585 ) ( not ( = ?auto_15581 ?auto_15584 ) ) ( not ( = ?auto_15582 ?auto_15585 ) ) ( not ( = ?auto_15583 ?auto_15584 ) ) ( not ( = ?auto_15580 ?auto_15585 ) ) ( not ( = ?auto_15584 ?auto_15589 ) ) ( not ( = ?auto_15584 ?auto_15586 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15581 ?auto_15582 ?auto_15583 ?auto_15580 )
      ( GET-3IMAGE-VERIFY ?auto_15581 ?auto_15582 ?auto_15583 ?auto_15580 ?auto_15584 ?auto_15585 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15669 - DIRECTION
      ?auto_15670 - MODE
      ?auto_15671 - DIRECTION
      ?auto_15668 - MODE
      ?auto_15672 - DIRECTION
      ?auto_15673 - MODE
    )
    :vars
    (
      ?auto_15675 - INSTRUMENT
      ?auto_15676 - SATELLITE
      ?auto_15677 - DIRECTION
      ?auto_15674 - DIRECTION
      ?auto_15678 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15675 ?auto_15676 ) ( SUPPORTS ?auto_15675 ?auto_15670 ) ( not ( = ?auto_15669 ?auto_15677 ) ) ( HAVE_IMAGE ?auto_15671 ?auto_15668 ) ( not ( = ?auto_15671 ?auto_15669 ) ) ( not ( = ?auto_15671 ?auto_15677 ) ) ( not ( = ?auto_15668 ?auto_15670 ) ) ( CALIBRATION_TARGET ?auto_15675 ?auto_15677 ) ( POINTING ?auto_15676 ?auto_15674 ) ( not ( = ?auto_15677 ?auto_15674 ) ) ( not ( = ?auto_15669 ?auto_15674 ) ) ( not ( = ?auto_15671 ?auto_15674 ) ) ( ON_BOARD ?auto_15678 ?auto_15676 ) ( POWER_ON ?auto_15678 ) ( not ( = ?auto_15675 ?auto_15678 ) ) ( HAVE_IMAGE ?auto_15672 ?auto_15673 ) ( not ( = ?auto_15669 ?auto_15672 ) ) ( not ( = ?auto_15670 ?auto_15673 ) ) ( not ( = ?auto_15671 ?auto_15672 ) ) ( not ( = ?auto_15668 ?auto_15673 ) ) ( not ( = ?auto_15672 ?auto_15677 ) ) ( not ( = ?auto_15672 ?auto_15674 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15671 ?auto_15668 ?auto_15669 ?auto_15670 )
      ( GET-3IMAGE-VERIFY ?auto_15669 ?auto_15670 ?auto_15671 ?auto_15668 ?auto_15672 ?auto_15673 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15770 - DIRECTION
      ?auto_15771 - MODE
    )
    :vars
    (
      ?auto_15774 - INSTRUMENT
      ?auto_15775 - SATELLITE
      ?auto_15776 - DIRECTION
      ?auto_15772 - DIRECTION
      ?auto_15777 - MODE
      ?auto_15773 - DIRECTION
      ?auto_15778 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15774 ?auto_15775 ) ( SUPPORTS ?auto_15774 ?auto_15771 ) ( not ( = ?auto_15770 ?auto_15776 ) ) ( HAVE_IMAGE ?auto_15772 ?auto_15777 ) ( not ( = ?auto_15772 ?auto_15770 ) ) ( not ( = ?auto_15772 ?auto_15776 ) ) ( not ( = ?auto_15777 ?auto_15771 ) ) ( CALIBRATION_TARGET ?auto_15774 ?auto_15776 ) ( not ( = ?auto_15776 ?auto_15773 ) ) ( not ( = ?auto_15770 ?auto_15773 ) ) ( not ( = ?auto_15772 ?auto_15773 ) ) ( ON_BOARD ?auto_15778 ?auto_15775 ) ( POWER_ON ?auto_15778 ) ( not ( = ?auto_15774 ?auto_15778 ) ) ( POINTING ?auto_15775 ?auto_15776 ) )
    :subtasks
    ( ( !TURN_TO ?auto_15775 ?auto_15773 ?auto_15776 )
      ( GET-2IMAGE ?auto_15772 ?auto_15777 ?auto_15770 ?auto_15771 )
      ( GET-1IMAGE-VERIFY ?auto_15770 ?auto_15771 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15780 - DIRECTION
      ?auto_15781 - MODE
      ?auto_15782 - DIRECTION
      ?auto_15779 - MODE
    )
    :vars
    (
      ?auto_15785 - INSTRUMENT
      ?auto_15786 - SATELLITE
      ?auto_15783 - DIRECTION
      ?auto_15784 - DIRECTION
      ?auto_15787 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15785 ?auto_15786 ) ( SUPPORTS ?auto_15785 ?auto_15779 ) ( not ( = ?auto_15782 ?auto_15783 ) ) ( HAVE_IMAGE ?auto_15780 ?auto_15781 ) ( not ( = ?auto_15780 ?auto_15782 ) ) ( not ( = ?auto_15780 ?auto_15783 ) ) ( not ( = ?auto_15781 ?auto_15779 ) ) ( CALIBRATION_TARGET ?auto_15785 ?auto_15783 ) ( not ( = ?auto_15783 ?auto_15784 ) ) ( not ( = ?auto_15782 ?auto_15784 ) ) ( not ( = ?auto_15780 ?auto_15784 ) ) ( ON_BOARD ?auto_15787 ?auto_15786 ) ( POWER_ON ?auto_15787 ) ( not ( = ?auto_15785 ?auto_15787 ) ) ( POINTING ?auto_15786 ?auto_15783 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15782 ?auto_15779 )
      ( GET-2IMAGE-VERIFY ?auto_15780 ?auto_15781 ?auto_15782 ?auto_15779 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15799 - DIRECTION
      ?auto_15800 - MODE
      ?auto_15801 - DIRECTION
      ?auto_15798 - MODE
    )
    :vars
    (
      ?auto_15804 - INSTRUMENT
      ?auto_15805 - SATELLITE
      ?auto_15803 - DIRECTION
      ?auto_15802 - DIRECTION
      ?auto_15806 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15804 ?auto_15805 ) ( SUPPORTS ?auto_15804 ?auto_15800 ) ( not ( = ?auto_15799 ?auto_15803 ) ) ( HAVE_IMAGE ?auto_15801 ?auto_15798 ) ( not ( = ?auto_15801 ?auto_15799 ) ) ( not ( = ?auto_15801 ?auto_15803 ) ) ( not ( = ?auto_15798 ?auto_15800 ) ) ( CALIBRATION_TARGET ?auto_15804 ?auto_15803 ) ( not ( = ?auto_15803 ?auto_15802 ) ) ( not ( = ?auto_15799 ?auto_15802 ) ) ( not ( = ?auto_15801 ?auto_15802 ) ) ( ON_BOARD ?auto_15806 ?auto_15805 ) ( POWER_ON ?auto_15806 ) ( not ( = ?auto_15804 ?auto_15806 ) ) ( POINTING ?auto_15805 ?auto_15803 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15801 ?auto_15798 ?auto_15799 ?auto_15800 )
      ( GET-2IMAGE-VERIFY ?auto_15799 ?auto_15800 ?auto_15801 ?auto_15798 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15829 - DIRECTION
      ?auto_15830 - MODE
      ?auto_15831 - DIRECTION
      ?auto_15828 - MODE
      ?auto_15832 - DIRECTION
      ?auto_15833 - MODE
    )
    :vars
    (
      ?auto_15836 - INSTRUMENT
      ?auto_15837 - SATELLITE
      ?auto_15835 - DIRECTION
      ?auto_15834 - DIRECTION
      ?auto_15838 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15836 ?auto_15837 ) ( SUPPORTS ?auto_15836 ?auto_15833 ) ( not ( = ?auto_15832 ?auto_15835 ) ) ( HAVE_IMAGE ?auto_15831 ?auto_15828 ) ( not ( = ?auto_15831 ?auto_15832 ) ) ( not ( = ?auto_15831 ?auto_15835 ) ) ( not ( = ?auto_15828 ?auto_15833 ) ) ( CALIBRATION_TARGET ?auto_15836 ?auto_15835 ) ( not ( = ?auto_15835 ?auto_15834 ) ) ( not ( = ?auto_15832 ?auto_15834 ) ) ( not ( = ?auto_15831 ?auto_15834 ) ) ( ON_BOARD ?auto_15838 ?auto_15837 ) ( POWER_ON ?auto_15838 ) ( not ( = ?auto_15836 ?auto_15838 ) ) ( POINTING ?auto_15837 ?auto_15835 ) ( HAVE_IMAGE ?auto_15829 ?auto_15830 ) ( not ( = ?auto_15829 ?auto_15831 ) ) ( not ( = ?auto_15829 ?auto_15832 ) ) ( not ( = ?auto_15829 ?auto_15835 ) ) ( not ( = ?auto_15829 ?auto_15834 ) ) ( not ( = ?auto_15830 ?auto_15828 ) ) ( not ( = ?auto_15830 ?auto_15833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15831 ?auto_15828 ?auto_15832 ?auto_15833 )
      ( GET-3IMAGE-VERIFY ?auto_15829 ?auto_15830 ?auto_15831 ?auto_15828 ?auto_15832 ?auto_15833 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15850 - DIRECTION
      ?auto_15851 - MODE
      ?auto_15852 - DIRECTION
      ?auto_15849 - MODE
      ?auto_15853 - DIRECTION
      ?auto_15854 - MODE
    )
    :vars
    (
      ?auto_15857 - INSTRUMENT
      ?auto_15858 - SATELLITE
      ?auto_15856 - DIRECTION
      ?auto_15855 - DIRECTION
      ?auto_15859 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15857 ?auto_15858 ) ( SUPPORTS ?auto_15857 ?auto_15849 ) ( not ( = ?auto_15852 ?auto_15856 ) ) ( HAVE_IMAGE ?auto_15850 ?auto_15851 ) ( not ( = ?auto_15850 ?auto_15852 ) ) ( not ( = ?auto_15850 ?auto_15856 ) ) ( not ( = ?auto_15851 ?auto_15849 ) ) ( CALIBRATION_TARGET ?auto_15857 ?auto_15856 ) ( not ( = ?auto_15856 ?auto_15855 ) ) ( not ( = ?auto_15852 ?auto_15855 ) ) ( not ( = ?auto_15850 ?auto_15855 ) ) ( ON_BOARD ?auto_15859 ?auto_15858 ) ( POWER_ON ?auto_15859 ) ( not ( = ?auto_15857 ?auto_15859 ) ) ( POINTING ?auto_15858 ?auto_15856 ) ( HAVE_IMAGE ?auto_15853 ?auto_15854 ) ( not ( = ?auto_15850 ?auto_15853 ) ) ( not ( = ?auto_15851 ?auto_15854 ) ) ( not ( = ?auto_15852 ?auto_15853 ) ) ( not ( = ?auto_15849 ?auto_15854 ) ) ( not ( = ?auto_15853 ?auto_15856 ) ) ( not ( = ?auto_15853 ?auto_15855 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15850 ?auto_15851 ?auto_15852 ?auto_15849 )
      ( GET-3IMAGE-VERIFY ?auto_15850 ?auto_15851 ?auto_15852 ?auto_15849 ?auto_15853 ?auto_15854 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15938 - DIRECTION
      ?auto_15939 - MODE
      ?auto_15940 - DIRECTION
      ?auto_15937 - MODE
      ?auto_15941 - DIRECTION
      ?auto_15942 - MODE
    )
    :vars
    (
      ?auto_15945 - INSTRUMENT
      ?auto_15946 - SATELLITE
      ?auto_15944 - DIRECTION
      ?auto_15943 - DIRECTION
      ?auto_15947 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15945 ?auto_15946 ) ( SUPPORTS ?auto_15945 ?auto_15939 ) ( not ( = ?auto_15938 ?auto_15944 ) ) ( HAVE_IMAGE ?auto_15941 ?auto_15942 ) ( not ( = ?auto_15941 ?auto_15938 ) ) ( not ( = ?auto_15941 ?auto_15944 ) ) ( not ( = ?auto_15942 ?auto_15939 ) ) ( CALIBRATION_TARGET ?auto_15945 ?auto_15944 ) ( not ( = ?auto_15944 ?auto_15943 ) ) ( not ( = ?auto_15938 ?auto_15943 ) ) ( not ( = ?auto_15941 ?auto_15943 ) ) ( ON_BOARD ?auto_15947 ?auto_15946 ) ( POWER_ON ?auto_15947 ) ( not ( = ?auto_15945 ?auto_15947 ) ) ( POINTING ?auto_15946 ?auto_15944 ) ( HAVE_IMAGE ?auto_15940 ?auto_15937 ) ( not ( = ?auto_15938 ?auto_15940 ) ) ( not ( = ?auto_15939 ?auto_15937 ) ) ( not ( = ?auto_15940 ?auto_15941 ) ) ( not ( = ?auto_15940 ?auto_15944 ) ) ( not ( = ?auto_15940 ?auto_15943 ) ) ( not ( = ?auto_15937 ?auto_15942 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15941 ?auto_15942 ?auto_15938 ?auto_15939 )
      ( GET-3IMAGE-VERIFY ?auto_15938 ?auto_15939 ?auto_15940 ?auto_15937 ?auto_15941 ?auto_15942 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16346 - DIRECTION
      ?auto_16347 - MODE
      ?auto_16348 - DIRECTION
      ?auto_16345 - MODE
      ?auto_16349 - DIRECTION
      ?auto_16350 - MODE
    )
    :vars
    (
      ?auto_16352 - INSTRUMENT
      ?auto_16351 - SATELLITE
      ?auto_16353 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16352 ?auto_16351 ) ( SUPPORTS ?auto_16352 ?auto_16350 ) ( POINTING ?auto_16351 ?auto_16353 ) ( not ( = ?auto_16349 ?auto_16353 ) ) ( HAVE_IMAGE ?auto_16346 ?auto_16345 ) ( not ( = ?auto_16346 ?auto_16349 ) ) ( not ( = ?auto_16346 ?auto_16353 ) ) ( not ( = ?auto_16345 ?auto_16350 ) ) ( CALIBRATION_TARGET ?auto_16352 ?auto_16353 ) ( POWER_AVAIL ?auto_16351 ) ( HAVE_IMAGE ?auto_16346 ?auto_16347 ) ( HAVE_IMAGE ?auto_16348 ?auto_16345 ) ( not ( = ?auto_16346 ?auto_16348 ) ) ( not ( = ?auto_16347 ?auto_16345 ) ) ( not ( = ?auto_16347 ?auto_16350 ) ) ( not ( = ?auto_16348 ?auto_16349 ) ) ( not ( = ?auto_16348 ?auto_16353 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16346 ?auto_16345 ?auto_16349 ?auto_16350 )
      ( GET-3IMAGE-VERIFY ?auto_16346 ?auto_16347 ?auto_16348 ?auto_16345 ?auto_16349 ?auto_16350 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16442 - DIRECTION
      ?auto_16443 - MODE
      ?auto_16444 - DIRECTION
      ?auto_16441 - MODE
      ?auto_16445 - DIRECTION
      ?auto_16446 - MODE
    )
    :vars
    (
      ?auto_16448 - INSTRUMENT
      ?auto_16447 - SATELLITE
      ?auto_16449 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16448 ?auto_16447 ) ( SUPPORTS ?auto_16448 ?auto_16443 ) ( POINTING ?auto_16447 ?auto_16449 ) ( not ( = ?auto_16442 ?auto_16449 ) ) ( HAVE_IMAGE ?auto_16444 ?auto_16446 ) ( not ( = ?auto_16444 ?auto_16442 ) ) ( not ( = ?auto_16444 ?auto_16449 ) ) ( not ( = ?auto_16446 ?auto_16443 ) ) ( CALIBRATION_TARGET ?auto_16448 ?auto_16449 ) ( POWER_AVAIL ?auto_16447 ) ( HAVE_IMAGE ?auto_16444 ?auto_16441 ) ( HAVE_IMAGE ?auto_16445 ?auto_16446 ) ( not ( = ?auto_16442 ?auto_16445 ) ) ( not ( = ?auto_16443 ?auto_16441 ) ) ( not ( = ?auto_16444 ?auto_16445 ) ) ( not ( = ?auto_16441 ?auto_16446 ) ) ( not ( = ?auto_16445 ?auto_16449 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16444 ?auto_16446 ?auto_16442 ?auto_16443 )
      ( GET-3IMAGE-VERIFY ?auto_16442 ?auto_16443 ?auto_16444 ?auto_16441 ?auto_16445 ?auto_16446 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16568 - DIRECTION
      ?auto_16569 - MODE
      ?auto_16570 - DIRECTION
      ?auto_16567 - MODE
      ?auto_16571 - DIRECTION
      ?auto_16572 - MODE
    )
    :vars
    (
      ?auto_16574 - INSTRUMENT
      ?auto_16573 - SATELLITE
      ?auto_16575 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16574 ?auto_16573 ) ( SUPPORTS ?auto_16574 ?auto_16572 ) ( not ( = ?auto_16571 ?auto_16575 ) ) ( HAVE_IMAGE ?auto_16568 ?auto_16567 ) ( not ( = ?auto_16568 ?auto_16571 ) ) ( not ( = ?auto_16568 ?auto_16575 ) ) ( not ( = ?auto_16567 ?auto_16572 ) ) ( CALIBRATION_TARGET ?auto_16574 ?auto_16575 ) ( POWER_AVAIL ?auto_16573 ) ( POINTING ?auto_16573 ?auto_16568 ) ( HAVE_IMAGE ?auto_16568 ?auto_16569 ) ( HAVE_IMAGE ?auto_16570 ?auto_16567 ) ( not ( = ?auto_16568 ?auto_16570 ) ) ( not ( = ?auto_16569 ?auto_16567 ) ) ( not ( = ?auto_16569 ?auto_16572 ) ) ( not ( = ?auto_16570 ?auto_16571 ) ) ( not ( = ?auto_16570 ?auto_16575 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16568 ?auto_16567 ?auto_16571 ?auto_16572 )
      ( GET-3IMAGE-VERIFY ?auto_16568 ?auto_16569 ?auto_16570 ?auto_16567 ?auto_16571 ?auto_16572 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16664 - DIRECTION
      ?auto_16665 - MODE
      ?auto_16666 - DIRECTION
      ?auto_16663 - MODE
      ?auto_16667 - DIRECTION
      ?auto_16668 - MODE
    )
    :vars
    (
      ?auto_16670 - INSTRUMENT
      ?auto_16669 - SATELLITE
      ?auto_16671 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16670 ?auto_16669 ) ( SUPPORTS ?auto_16670 ?auto_16665 ) ( not ( = ?auto_16664 ?auto_16671 ) ) ( HAVE_IMAGE ?auto_16666 ?auto_16668 ) ( not ( = ?auto_16666 ?auto_16664 ) ) ( not ( = ?auto_16666 ?auto_16671 ) ) ( not ( = ?auto_16668 ?auto_16665 ) ) ( CALIBRATION_TARGET ?auto_16670 ?auto_16671 ) ( POWER_AVAIL ?auto_16669 ) ( POINTING ?auto_16669 ?auto_16666 ) ( HAVE_IMAGE ?auto_16666 ?auto_16663 ) ( HAVE_IMAGE ?auto_16667 ?auto_16668 ) ( not ( = ?auto_16664 ?auto_16667 ) ) ( not ( = ?auto_16665 ?auto_16663 ) ) ( not ( = ?auto_16666 ?auto_16667 ) ) ( not ( = ?auto_16663 ?auto_16668 ) ) ( not ( = ?auto_16667 ?auto_16671 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16666 ?auto_16668 ?auto_16664 ?auto_16665 )
      ( GET-3IMAGE-VERIFY ?auto_16664 ?auto_16665 ?auto_16666 ?auto_16663 ?auto_16667 ?auto_16668 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16793 - DIRECTION
      ?auto_16794 - MODE
      ?auto_16795 - DIRECTION
      ?auto_16792 - MODE
      ?auto_16796 - DIRECTION
      ?auto_16797 - MODE
    )
    :vars
    (
      ?auto_16800 - INSTRUMENT
      ?auto_16801 - SATELLITE
      ?auto_16798 - DIRECTION
      ?auto_16799 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_16800 ?auto_16801 ) ( SUPPORTS ?auto_16800 ?auto_16797 ) ( not ( = ?auto_16796 ?auto_16798 ) ) ( HAVE_IMAGE ?auto_16793 ?auto_16792 ) ( not ( = ?auto_16793 ?auto_16796 ) ) ( not ( = ?auto_16793 ?auto_16798 ) ) ( not ( = ?auto_16792 ?auto_16797 ) ) ( CALIBRATION_TARGET ?auto_16800 ?auto_16798 ) ( POINTING ?auto_16801 ?auto_16793 ) ( ON_BOARD ?auto_16799 ?auto_16801 ) ( POWER_ON ?auto_16799 ) ( not ( = ?auto_16800 ?auto_16799 ) ) ( HAVE_IMAGE ?auto_16793 ?auto_16794 ) ( HAVE_IMAGE ?auto_16795 ?auto_16792 ) ( not ( = ?auto_16793 ?auto_16795 ) ) ( not ( = ?auto_16794 ?auto_16792 ) ) ( not ( = ?auto_16794 ?auto_16797 ) ) ( not ( = ?auto_16795 ?auto_16796 ) ) ( not ( = ?auto_16795 ?auto_16798 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16793 ?auto_16792 ?auto_16796 ?auto_16797 )
      ( GET-3IMAGE-VERIFY ?auto_16793 ?auto_16794 ?auto_16795 ?auto_16792 ?auto_16796 ?auto_16797 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16813 - DIRECTION
      ?auto_16814 - MODE
      ?auto_16815 - DIRECTION
      ?auto_16812 - MODE
      ?auto_16816 - DIRECTION
      ?auto_16817 - MODE
    )
    :vars
    (
      ?auto_16820 - INSTRUMENT
      ?auto_16821 - SATELLITE
      ?auto_16818 - DIRECTION
      ?auto_16819 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_16820 ?auto_16821 ) ( SUPPORTS ?auto_16820 ?auto_16812 ) ( not ( = ?auto_16815 ?auto_16818 ) ) ( HAVE_IMAGE ?auto_16813 ?auto_16817 ) ( not ( = ?auto_16813 ?auto_16815 ) ) ( not ( = ?auto_16813 ?auto_16818 ) ) ( not ( = ?auto_16817 ?auto_16812 ) ) ( CALIBRATION_TARGET ?auto_16820 ?auto_16818 ) ( POINTING ?auto_16821 ?auto_16813 ) ( ON_BOARD ?auto_16819 ?auto_16821 ) ( POWER_ON ?auto_16819 ) ( not ( = ?auto_16820 ?auto_16819 ) ) ( HAVE_IMAGE ?auto_16813 ?auto_16814 ) ( HAVE_IMAGE ?auto_16816 ?auto_16817 ) ( not ( = ?auto_16813 ?auto_16816 ) ) ( not ( = ?auto_16814 ?auto_16812 ) ) ( not ( = ?auto_16814 ?auto_16817 ) ) ( not ( = ?auto_16815 ?auto_16816 ) ) ( not ( = ?auto_16816 ?auto_16818 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16813 ?auto_16817 ?auto_16815 ?auto_16812 )
      ( GET-3IMAGE-VERIFY ?auto_16813 ?auto_16814 ?auto_16815 ?auto_16812 ?auto_16816 ?auto_16817 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16899 - DIRECTION
      ?auto_16900 - MODE
      ?auto_16901 - DIRECTION
      ?auto_16898 - MODE
      ?auto_16902 - DIRECTION
      ?auto_16903 - MODE
    )
    :vars
    (
      ?auto_16906 - INSTRUMENT
      ?auto_16907 - SATELLITE
      ?auto_16904 - DIRECTION
      ?auto_16905 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_16906 ?auto_16907 ) ( SUPPORTS ?auto_16906 ?auto_16900 ) ( not ( = ?auto_16899 ?auto_16904 ) ) ( HAVE_IMAGE ?auto_16901 ?auto_16898 ) ( not ( = ?auto_16901 ?auto_16899 ) ) ( not ( = ?auto_16901 ?auto_16904 ) ) ( not ( = ?auto_16898 ?auto_16900 ) ) ( CALIBRATION_TARGET ?auto_16906 ?auto_16904 ) ( POINTING ?auto_16907 ?auto_16901 ) ( ON_BOARD ?auto_16905 ?auto_16907 ) ( POWER_ON ?auto_16905 ) ( not ( = ?auto_16906 ?auto_16905 ) ) ( HAVE_IMAGE ?auto_16902 ?auto_16903 ) ( not ( = ?auto_16899 ?auto_16902 ) ) ( not ( = ?auto_16900 ?auto_16903 ) ) ( not ( = ?auto_16901 ?auto_16902 ) ) ( not ( = ?auto_16898 ?auto_16903 ) ) ( not ( = ?auto_16902 ?auto_16904 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16901 ?auto_16898 ?auto_16899 ?auto_16900 )
      ( GET-3IMAGE-VERIFY ?auto_16899 ?auto_16900 ?auto_16901 ?auto_16898 ?auto_16902 ?auto_16903 ) )
  )

)

