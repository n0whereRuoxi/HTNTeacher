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

  ( :method GET-4IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
      ?goal_dir4 - DIRECTION
      ?goal_mode4 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_110767 - DIRECTION
      ?auto_110768 - MODE
    )
    :vars
    (
      ?auto_110769 - INSTRUMENT
      ?auto_110770 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_110769 ) ( ON_BOARD ?auto_110769 ?auto_110770 ) ( SUPPORTS ?auto_110769 ?auto_110768 ) ( POWER_ON ?auto_110769 ) ( POINTING ?auto_110770 ?auto_110767 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_110770 ?auto_110767 ?auto_110769 ?auto_110768 )
      ( GET-1IMAGE-VERIFY ?auto_110767 ?auto_110768 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_110795 - DIRECTION
      ?auto_110796 - MODE
    )
    :vars
    (
      ?auto_110798 - INSTRUMENT
      ?auto_110797 - SATELLITE
      ?auto_110799 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_110798 ) ( ON_BOARD ?auto_110798 ?auto_110797 ) ( SUPPORTS ?auto_110798 ?auto_110796 ) ( POWER_ON ?auto_110798 ) ( POINTING ?auto_110797 ?auto_110799 ) ( not ( = ?auto_110795 ?auto_110799 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_110797 ?auto_110795 ?auto_110799 )
      ( GET-1IMAGE ?auto_110795 ?auto_110796 )
      ( GET-1IMAGE-VERIFY ?auto_110795 ?auto_110796 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_110827 - DIRECTION
      ?auto_110828 - MODE
    )
    :vars
    (
      ?auto_110831 - INSTRUMENT
      ?auto_110829 - SATELLITE
      ?auto_110830 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_110831 ?auto_110829 ) ( SUPPORTS ?auto_110831 ?auto_110828 ) ( POWER_ON ?auto_110831 ) ( POINTING ?auto_110829 ?auto_110830 ) ( not ( = ?auto_110827 ?auto_110830 ) ) ( CALIBRATION_TARGET ?auto_110831 ?auto_110830 ) ( NOT_CALIBRATED ?auto_110831 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_110829 ?auto_110831 ?auto_110830 )
      ( GET-1IMAGE ?auto_110827 ?auto_110828 )
      ( GET-1IMAGE-VERIFY ?auto_110827 ?auto_110828 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_110859 - DIRECTION
      ?auto_110860 - MODE
    )
    :vars
    (
      ?auto_110862 - INSTRUMENT
      ?auto_110861 - SATELLITE
      ?auto_110863 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_110862 ?auto_110861 ) ( SUPPORTS ?auto_110862 ?auto_110860 ) ( POINTING ?auto_110861 ?auto_110863 ) ( not ( = ?auto_110859 ?auto_110863 ) ) ( CALIBRATION_TARGET ?auto_110862 ?auto_110863 ) ( POWER_AVAIL ?auto_110861 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_110862 ?auto_110861 )
      ( GET-1IMAGE ?auto_110859 ?auto_110860 )
      ( GET-1IMAGE-VERIFY ?auto_110859 ?auto_110860 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_110891 - DIRECTION
      ?auto_110892 - MODE
    )
    :vars
    (
      ?auto_110893 - INSTRUMENT
      ?auto_110895 - SATELLITE
      ?auto_110894 - DIRECTION
      ?auto_110896 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_110893 ?auto_110895 ) ( SUPPORTS ?auto_110893 ?auto_110892 ) ( not ( = ?auto_110891 ?auto_110894 ) ) ( CALIBRATION_TARGET ?auto_110893 ?auto_110894 ) ( POWER_AVAIL ?auto_110895 ) ( POINTING ?auto_110895 ?auto_110896 ) ( not ( = ?auto_110894 ?auto_110896 ) ) ( not ( = ?auto_110891 ?auto_110896 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_110895 ?auto_110894 ?auto_110896 )
      ( GET-1IMAGE ?auto_110891 ?auto_110892 )
      ( GET-1IMAGE-VERIFY ?auto_110891 ?auto_110892 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111108 - DIRECTION
      ?auto_111109 - MODE
      ?auto_111110 - DIRECTION
      ?auto_111107 - MODE
    )
    :vars
    (
      ?auto_111111 - INSTRUMENT
      ?auto_111112 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111111 ) ( ON_BOARD ?auto_111111 ?auto_111112 ) ( SUPPORTS ?auto_111111 ?auto_111107 ) ( POWER_ON ?auto_111111 ) ( POINTING ?auto_111112 ?auto_111110 ) ( HAVE_IMAGE ?auto_111108 ?auto_111109 ) ( not ( = ?auto_111108 ?auto_111110 ) ) ( not ( = ?auto_111109 ?auto_111107 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111110 ?auto_111107 )
      ( GET-2IMAGE-VERIFY ?auto_111108 ?auto_111109 ?auto_111110 ?auto_111107 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111114 - DIRECTION
      ?auto_111115 - MODE
      ?auto_111116 - DIRECTION
      ?auto_111113 - MODE
    )
    :vars
    (
      ?auto_111117 - INSTRUMENT
      ?auto_111118 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111117 ) ( ON_BOARD ?auto_111117 ?auto_111118 ) ( SUPPORTS ?auto_111117 ?auto_111115 ) ( POWER_ON ?auto_111117 ) ( POINTING ?auto_111118 ?auto_111114 ) ( HAVE_IMAGE ?auto_111116 ?auto_111113 ) ( not ( = ?auto_111114 ?auto_111116 ) ) ( not ( = ?auto_111115 ?auto_111113 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111114 ?auto_111115 )
      ( GET-2IMAGE-VERIFY ?auto_111114 ?auto_111115 ?auto_111116 ?auto_111113 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111126 - DIRECTION
      ?auto_111127 - MODE
      ?auto_111128 - DIRECTION
      ?auto_111125 - MODE
      ?auto_111129 - DIRECTION
      ?auto_111130 - MODE
    )
    :vars
    (
      ?auto_111131 - INSTRUMENT
      ?auto_111132 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111131 ) ( ON_BOARD ?auto_111131 ?auto_111132 ) ( SUPPORTS ?auto_111131 ?auto_111130 ) ( POWER_ON ?auto_111131 ) ( POINTING ?auto_111132 ?auto_111129 ) ( HAVE_IMAGE ?auto_111126 ?auto_111127 ) ( HAVE_IMAGE ?auto_111128 ?auto_111125 ) ( not ( = ?auto_111126 ?auto_111128 ) ) ( not ( = ?auto_111126 ?auto_111129 ) ) ( not ( = ?auto_111127 ?auto_111125 ) ) ( not ( = ?auto_111127 ?auto_111130 ) ) ( not ( = ?auto_111128 ?auto_111129 ) ) ( not ( = ?auto_111125 ?auto_111130 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111129 ?auto_111130 )
      ( GET-3IMAGE-VERIFY ?auto_111126 ?auto_111127 ?auto_111128 ?auto_111125 ?auto_111129 ?auto_111130 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111134 - DIRECTION
      ?auto_111135 - MODE
      ?auto_111136 - DIRECTION
      ?auto_111133 - MODE
      ?auto_111137 - DIRECTION
      ?auto_111138 - MODE
    )
    :vars
    (
      ?auto_111139 - INSTRUMENT
      ?auto_111140 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111139 ) ( ON_BOARD ?auto_111139 ?auto_111140 ) ( SUPPORTS ?auto_111139 ?auto_111133 ) ( POWER_ON ?auto_111139 ) ( POINTING ?auto_111140 ?auto_111136 ) ( HAVE_IMAGE ?auto_111134 ?auto_111135 ) ( HAVE_IMAGE ?auto_111137 ?auto_111138 ) ( not ( = ?auto_111134 ?auto_111136 ) ) ( not ( = ?auto_111134 ?auto_111137 ) ) ( not ( = ?auto_111135 ?auto_111133 ) ) ( not ( = ?auto_111135 ?auto_111138 ) ) ( not ( = ?auto_111136 ?auto_111137 ) ) ( not ( = ?auto_111133 ?auto_111138 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111136 ?auto_111133 )
      ( GET-3IMAGE-VERIFY ?auto_111134 ?auto_111135 ?auto_111136 ?auto_111133 ?auto_111137 ?auto_111138 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111150 - DIRECTION
      ?auto_111151 - MODE
      ?auto_111152 - DIRECTION
      ?auto_111149 - MODE
      ?auto_111153 - DIRECTION
      ?auto_111154 - MODE
    )
    :vars
    (
      ?auto_111155 - INSTRUMENT
      ?auto_111156 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111155 ) ( ON_BOARD ?auto_111155 ?auto_111156 ) ( SUPPORTS ?auto_111155 ?auto_111151 ) ( POWER_ON ?auto_111155 ) ( POINTING ?auto_111156 ?auto_111150 ) ( HAVE_IMAGE ?auto_111152 ?auto_111149 ) ( HAVE_IMAGE ?auto_111153 ?auto_111154 ) ( not ( = ?auto_111150 ?auto_111152 ) ) ( not ( = ?auto_111150 ?auto_111153 ) ) ( not ( = ?auto_111151 ?auto_111149 ) ) ( not ( = ?auto_111151 ?auto_111154 ) ) ( not ( = ?auto_111152 ?auto_111153 ) ) ( not ( = ?auto_111149 ?auto_111154 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111150 ?auto_111151 )
      ( GET-3IMAGE-VERIFY ?auto_111150 ?auto_111151 ?auto_111152 ?auto_111149 ?auto_111153 ?auto_111154 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111182 - DIRECTION
      ?auto_111183 - MODE
      ?auto_111184 - DIRECTION
      ?auto_111181 - MODE
      ?auto_111185 - DIRECTION
      ?auto_111186 - MODE
      ?auto_111187 - DIRECTION
      ?auto_111188 - MODE
    )
    :vars
    (
      ?auto_111189 - INSTRUMENT
      ?auto_111190 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111189 ) ( ON_BOARD ?auto_111189 ?auto_111190 ) ( SUPPORTS ?auto_111189 ?auto_111188 ) ( POWER_ON ?auto_111189 ) ( POINTING ?auto_111190 ?auto_111187 ) ( HAVE_IMAGE ?auto_111182 ?auto_111183 ) ( HAVE_IMAGE ?auto_111184 ?auto_111181 ) ( HAVE_IMAGE ?auto_111185 ?auto_111186 ) ( not ( = ?auto_111182 ?auto_111184 ) ) ( not ( = ?auto_111182 ?auto_111185 ) ) ( not ( = ?auto_111182 ?auto_111187 ) ) ( not ( = ?auto_111183 ?auto_111181 ) ) ( not ( = ?auto_111183 ?auto_111186 ) ) ( not ( = ?auto_111183 ?auto_111188 ) ) ( not ( = ?auto_111184 ?auto_111185 ) ) ( not ( = ?auto_111184 ?auto_111187 ) ) ( not ( = ?auto_111181 ?auto_111186 ) ) ( not ( = ?auto_111181 ?auto_111188 ) ) ( not ( = ?auto_111185 ?auto_111187 ) ) ( not ( = ?auto_111186 ?auto_111188 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111187 ?auto_111188 )
      ( GET-4IMAGE-VERIFY ?auto_111182 ?auto_111183 ?auto_111184 ?auto_111181 ?auto_111185 ?auto_111186 ?auto_111187 ?auto_111188 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111192 - DIRECTION
      ?auto_111193 - MODE
      ?auto_111194 - DIRECTION
      ?auto_111191 - MODE
      ?auto_111195 - DIRECTION
      ?auto_111196 - MODE
      ?auto_111197 - DIRECTION
      ?auto_111198 - MODE
    )
    :vars
    (
      ?auto_111199 - INSTRUMENT
      ?auto_111200 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111199 ) ( ON_BOARD ?auto_111199 ?auto_111200 ) ( SUPPORTS ?auto_111199 ?auto_111196 ) ( POWER_ON ?auto_111199 ) ( POINTING ?auto_111200 ?auto_111195 ) ( HAVE_IMAGE ?auto_111192 ?auto_111193 ) ( HAVE_IMAGE ?auto_111194 ?auto_111191 ) ( HAVE_IMAGE ?auto_111197 ?auto_111198 ) ( not ( = ?auto_111192 ?auto_111194 ) ) ( not ( = ?auto_111192 ?auto_111195 ) ) ( not ( = ?auto_111192 ?auto_111197 ) ) ( not ( = ?auto_111193 ?auto_111191 ) ) ( not ( = ?auto_111193 ?auto_111196 ) ) ( not ( = ?auto_111193 ?auto_111198 ) ) ( not ( = ?auto_111194 ?auto_111195 ) ) ( not ( = ?auto_111194 ?auto_111197 ) ) ( not ( = ?auto_111191 ?auto_111196 ) ) ( not ( = ?auto_111191 ?auto_111198 ) ) ( not ( = ?auto_111195 ?auto_111197 ) ) ( not ( = ?auto_111196 ?auto_111198 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111195 ?auto_111196 )
      ( GET-4IMAGE-VERIFY ?auto_111192 ?auto_111193 ?auto_111194 ?auto_111191 ?auto_111195 ?auto_111196 ?auto_111197 ?auto_111198 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111212 - DIRECTION
      ?auto_111213 - MODE
      ?auto_111214 - DIRECTION
      ?auto_111211 - MODE
      ?auto_111215 - DIRECTION
      ?auto_111216 - MODE
      ?auto_111217 - DIRECTION
      ?auto_111218 - MODE
    )
    :vars
    (
      ?auto_111219 - INSTRUMENT
      ?auto_111220 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111219 ) ( ON_BOARD ?auto_111219 ?auto_111220 ) ( SUPPORTS ?auto_111219 ?auto_111211 ) ( POWER_ON ?auto_111219 ) ( POINTING ?auto_111220 ?auto_111214 ) ( HAVE_IMAGE ?auto_111212 ?auto_111213 ) ( HAVE_IMAGE ?auto_111215 ?auto_111216 ) ( HAVE_IMAGE ?auto_111217 ?auto_111218 ) ( not ( = ?auto_111212 ?auto_111214 ) ) ( not ( = ?auto_111212 ?auto_111215 ) ) ( not ( = ?auto_111212 ?auto_111217 ) ) ( not ( = ?auto_111213 ?auto_111211 ) ) ( not ( = ?auto_111213 ?auto_111216 ) ) ( not ( = ?auto_111213 ?auto_111218 ) ) ( not ( = ?auto_111214 ?auto_111215 ) ) ( not ( = ?auto_111214 ?auto_111217 ) ) ( not ( = ?auto_111211 ?auto_111216 ) ) ( not ( = ?auto_111211 ?auto_111218 ) ) ( not ( = ?auto_111215 ?auto_111217 ) ) ( not ( = ?auto_111216 ?auto_111218 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111214 ?auto_111211 )
      ( GET-4IMAGE-VERIFY ?auto_111212 ?auto_111213 ?auto_111214 ?auto_111211 ?auto_111215 ?auto_111216 ?auto_111217 ?auto_111218 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111252 - DIRECTION
      ?auto_111253 - MODE
      ?auto_111254 - DIRECTION
      ?auto_111251 - MODE
      ?auto_111255 - DIRECTION
      ?auto_111256 - MODE
      ?auto_111257 - DIRECTION
      ?auto_111258 - MODE
    )
    :vars
    (
      ?auto_111259 - INSTRUMENT
      ?auto_111260 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_111259 ) ( ON_BOARD ?auto_111259 ?auto_111260 ) ( SUPPORTS ?auto_111259 ?auto_111253 ) ( POWER_ON ?auto_111259 ) ( POINTING ?auto_111260 ?auto_111252 ) ( HAVE_IMAGE ?auto_111254 ?auto_111251 ) ( HAVE_IMAGE ?auto_111255 ?auto_111256 ) ( HAVE_IMAGE ?auto_111257 ?auto_111258 ) ( not ( = ?auto_111252 ?auto_111254 ) ) ( not ( = ?auto_111252 ?auto_111255 ) ) ( not ( = ?auto_111252 ?auto_111257 ) ) ( not ( = ?auto_111253 ?auto_111251 ) ) ( not ( = ?auto_111253 ?auto_111256 ) ) ( not ( = ?auto_111253 ?auto_111258 ) ) ( not ( = ?auto_111254 ?auto_111255 ) ) ( not ( = ?auto_111254 ?auto_111257 ) ) ( not ( = ?auto_111251 ?auto_111256 ) ) ( not ( = ?auto_111251 ?auto_111258 ) ) ( not ( = ?auto_111255 ?auto_111257 ) ) ( not ( = ?auto_111256 ?auto_111258 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111252 ?auto_111253 )
      ( GET-4IMAGE-VERIFY ?auto_111252 ?auto_111253 ?auto_111254 ?auto_111251 ?auto_111255 ?auto_111256 ?auto_111257 ?auto_111258 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111337 - DIRECTION
      ?auto_111338 - MODE
      ?auto_111339 - DIRECTION
      ?auto_111336 - MODE
    )
    :vars
    (
      ?auto_111342 - INSTRUMENT
      ?auto_111341 - SATELLITE
      ?auto_111340 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111342 ) ( ON_BOARD ?auto_111342 ?auto_111341 ) ( SUPPORTS ?auto_111342 ?auto_111336 ) ( POWER_ON ?auto_111342 ) ( POINTING ?auto_111341 ?auto_111340 ) ( not ( = ?auto_111339 ?auto_111340 ) ) ( HAVE_IMAGE ?auto_111337 ?auto_111338 ) ( not ( = ?auto_111337 ?auto_111339 ) ) ( not ( = ?auto_111337 ?auto_111340 ) ) ( not ( = ?auto_111338 ?auto_111336 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111339 ?auto_111336 )
      ( GET-2IMAGE-VERIFY ?auto_111337 ?auto_111338 ?auto_111339 ?auto_111336 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111344 - DIRECTION
      ?auto_111345 - MODE
      ?auto_111346 - DIRECTION
      ?auto_111343 - MODE
    )
    :vars
    (
      ?auto_111348 - INSTRUMENT
      ?auto_111347 - SATELLITE
      ?auto_111349 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111348 ) ( ON_BOARD ?auto_111348 ?auto_111347 ) ( SUPPORTS ?auto_111348 ?auto_111345 ) ( POWER_ON ?auto_111348 ) ( POINTING ?auto_111347 ?auto_111349 ) ( not ( = ?auto_111344 ?auto_111349 ) ) ( HAVE_IMAGE ?auto_111346 ?auto_111343 ) ( not ( = ?auto_111346 ?auto_111344 ) ) ( not ( = ?auto_111346 ?auto_111349 ) ) ( not ( = ?auto_111343 ?auto_111345 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111346 ?auto_111343 ?auto_111344 ?auto_111345 )
      ( GET-2IMAGE-VERIFY ?auto_111344 ?auto_111345 ?auto_111346 ?auto_111343 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111360 - DIRECTION
      ?auto_111361 - MODE
      ?auto_111362 - DIRECTION
      ?auto_111359 - MODE
      ?auto_111363 - DIRECTION
      ?auto_111364 - MODE
    )
    :vars
    (
      ?auto_111366 - INSTRUMENT
      ?auto_111365 - SATELLITE
      ?auto_111367 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111366 ) ( ON_BOARD ?auto_111366 ?auto_111365 ) ( SUPPORTS ?auto_111366 ?auto_111364 ) ( POWER_ON ?auto_111366 ) ( POINTING ?auto_111365 ?auto_111367 ) ( not ( = ?auto_111363 ?auto_111367 ) ) ( HAVE_IMAGE ?auto_111362 ?auto_111361 ) ( not ( = ?auto_111362 ?auto_111363 ) ) ( not ( = ?auto_111362 ?auto_111367 ) ) ( not ( = ?auto_111361 ?auto_111364 ) ) ( HAVE_IMAGE ?auto_111360 ?auto_111361 ) ( HAVE_IMAGE ?auto_111362 ?auto_111359 ) ( not ( = ?auto_111360 ?auto_111362 ) ) ( not ( = ?auto_111360 ?auto_111363 ) ) ( not ( = ?auto_111360 ?auto_111367 ) ) ( not ( = ?auto_111361 ?auto_111359 ) ) ( not ( = ?auto_111359 ?auto_111364 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111362 ?auto_111361 ?auto_111363 ?auto_111364 )
      ( GET-3IMAGE-VERIFY ?auto_111360 ?auto_111361 ?auto_111362 ?auto_111359 ?auto_111363 ?auto_111364 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111369 - DIRECTION
      ?auto_111370 - MODE
      ?auto_111371 - DIRECTION
      ?auto_111368 - MODE
      ?auto_111372 - DIRECTION
      ?auto_111373 - MODE
    )
    :vars
    (
      ?auto_111375 - INSTRUMENT
      ?auto_111374 - SATELLITE
      ?auto_111376 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111375 ) ( ON_BOARD ?auto_111375 ?auto_111374 ) ( SUPPORTS ?auto_111375 ?auto_111368 ) ( POWER_ON ?auto_111375 ) ( POINTING ?auto_111374 ?auto_111376 ) ( not ( = ?auto_111371 ?auto_111376 ) ) ( HAVE_IMAGE ?auto_111369 ?auto_111373 ) ( not ( = ?auto_111369 ?auto_111371 ) ) ( not ( = ?auto_111369 ?auto_111376 ) ) ( not ( = ?auto_111373 ?auto_111368 ) ) ( HAVE_IMAGE ?auto_111369 ?auto_111370 ) ( HAVE_IMAGE ?auto_111372 ?auto_111373 ) ( not ( = ?auto_111369 ?auto_111372 ) ) ( not ( = ?auto_111370 ?auto_111368 ) ) ( not ( = ?auto_111370 ?auto_111373 ) ) ( not ( = ?auto_111371 ?auto_111372 ) ) ( not ( = ?auto_111372 ?auto_111376 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111369 ?auto_111373 ?auto_111371 ?auto_111368 )
      ( GET-3IMAGE-VERIFY ?auto_111369 ?auto_111370 ?auto_111371 ?auto_111368 ?auto_111372 ?auto_111373 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111387 - DIRECTION
      ?auto_111388 - MODE
      ?auto_111389 - DIRECTION
      ?auto_111386 - MODE
      ?auto_111390 - DIRECTION
      ?auto_111391 - MODE
    )
    :vars
    (
      ?auto_111393 - INSTRUMENT
      ?auto_111392 - SATELLITE
      ?auto_111394 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111393 ) ( ON_BOARD ?auto_111393 ?auto_111392 ) ( SUPPORTS ?auto_111393 ?auto_111388 ) ( POWER_ON ?auto_111393 ) ( POINTING ?auto_111392 ?auto_111394 ) ( not ( = ?auto_111387 ?auto_111394 ) ) ( HAVE_IMAGE ?auto_111390 ?auto_111391 ) ( not ( = ?auto_111390 ?auto_111387 ) ) ( not ( = ?auto_111390 ?auto_111394 ) ) ( not ( = ?auto_111391 ?auto_111388 ) ) ( HAVE_IMAGE ?auto_111389 ?auto_111386 ) ( not ( = ?auto_111387 ?auto_111389 ) ) ( not ( = ?auto_111388 ?auto_111386 ) ) ( not ( = ?auto_111389 ?auto_111390 ) ) ( not ( = ?auto_111389 ?auto_111394 ) ) ( not ( = ?auto_111386 ?auto_111391 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111390 ?auto_111391 ?auto_111387 ?auto_111388 )
      ( GET-3IMAGE-VERIFY ?auto_111387 ?auto_111388 ?auto_111389 ?auto_111386 ?auto_111390 ?auto_111391 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111425 - DIRECTION
      ?auto_111426 - MODE
      ?auto_111427 - DIRECTION
      ?auto_111424 - MODE
      ?auto_111428 - DIRECTION
      ?auto_111429 - MODE
      ?auto_111430 - DIRECTION
      ?auto_111431 - MODE
    )
    :vars
    (
      ?auto_111433 - INSTRUMENT
      ?auto_111432 - SATELLITE
      ?auto_111434 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111433 ) ( ON_BOARD ?auto_111433 ?auto_111432 ) ( SUPPORTS ?auto_111433 ?auto_111431 ) ( POWER_ON ?auto_111433 ) ( POINTING ?auto_111432 ?auto_111434 ) ( not ( = ?auto_111430 ?auto_111434 ) ) ( HAVE_IMAGE ?auto_111428 ?auto_111429 ) ( not ( = ?auto_111428 ?auto_111430 ) ) ( not ( = ?auto_111428 ?auto_111434 ) ) ( not ( = ?auto_111429 ?auto_111431 ) ) ( HAVE_IMAGE ?auto_111425 ?auto_111426 ) ( HAVE_IMAGE ?auto_111427 ?auto_111424 ) ( not ( = ?auto_111425 ?auto_111427 ) ) ( not ( = ?auto_111425 ?auto_111428 ) ) ( not ( = ?auto_111425 ?auto_111430 ) ) ( not ( = ?auto_111425 ?auto_111434 ) ) ( not ( = ?auto_111426 ?auto_111424 ) ) ( not ( = ?auto_111426 ?auto_111429 ) ) ( not ( = ?auto_111426 ?auto_111431 ) ) ( not ( = ?auto_111427 ?auto_111428 ) ) ( not ( = ?auto_111427 ?auto_111430 ) ) ( not ( = ?auto_111427 ?auto_111434 ) ) ( not ( = ?auto_111424 ?auto_111429 ) ) ( not ( = ?auto_111424 ?auto_111431 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111428 ?auto_111429 ?auto_111430 ?auto_111431 )
      ( GET-4IMAGE-VERIFY ?auto_111425 ?auto_111426 ?auto_111427 ?auto_111424 ?auto_111428 ?auto_111429 ?auto_111430 ?auto_111431 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111436 - DIRECTION
      ?auto_111437 - MODE
      ?auto_111438 - DIRECTION
      ?auto_111435 - MODE
      ?auto_111439 - DIRECTION
      ?auto_111440 - MODE
      ?auto_111441 - DIRECTION
      ?auto_111442 - MODE
    )
    :vars
    (
      ?auto_111444 - INSTRUMENT
      ?auto_111443 - SATELLITE
      ?auto_111445 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111444 ) ( ON_BOARD ?auto_111444 ?auto_111443 ) ( SUPPORTS ?auto_111444 ?auto_111440 ) ( POWER_ON ?auto_111444 ) ( POINTING ?auto_111443 ?auto_111445 ) ( not ( = ?auto_111439 ?auto_111445 ) ) ( HAVE_IMAGE ?auto_111438 ?auto_111437 ) ( not ( = ?auto_111438 ?auto_111439 ) ) ( not ( = ?auto_111438 ?auto_111445 ) ) ( not ( = ?auto_111437 ?auto_111440 ) ) ( HAVE_IMAGE ?auto_111436 ?auto_111437 ) ( HAVE_IMAGE ?auto_111438 ?auto_111435 ) ( HAVE_IMAGE ?auto_111441 ?auto_111442 ) ( not ( = ?auto_111436 ?auto_111438 ) ) ( not ( = ?auto_111436 ?auto_111439 ) ) ( not ( = ?auto_111436 ?auto_111441 ) ) ( not ( = ?auto_111436 ?auto_111445 ) ) ( not ( = ?auto_111437 ?auto_111435 ) ) ( not ( = ?auto_111437 ?auto_111442 ) ) ( not ( = ?auto_111438 ?auto_111441 ) ) ( not ( = ?auto_111435 ?auto_111440 ) ) ( not ( = ?auto_111435 ?auto_111442 ) ) ( not ( = ?auto_111439 ?auto_111441 ) ) ( not ( = ?auto_111440 ?auto_111442 ) ) ( not ( = ?auto_111441 ?auto_111445 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111438 ?auto_111437 ?auto_111439 ?auto_111440 )
      ( GET-4IMAGE-VERIFY ?auto_111436 ?auto_111437 ?auto_111438 ?auto_111435 ?auto_111439 ?auto_111440 ?auto_111441 ?auto_111442 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111458 - DIRECTION
      ?auto_111459 - MODE
      ?auto_111460 - DIRECTION
      ?auto_111457 - MODE
      ?auto_111461 - DIRECTION
      ?auto_111462 - MODE
      ?auto_111463 - DIRECTION
      ?auto_111464 - MODE
    )
    :vars
    (
      ?auto_111466 - INSTRUMENT
      ?auto_111465 - SATELLITE
      ?auto_111467 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111466 ) ( ON_BOARD ?auto_111466 ?auto_111465 ) ( SUPPORTS ?auto_111466 ?auto_111457 ) ( POWER_ON ?auto_111466 ) ( POINTING ?auto_111465 ?auto_111467 ) ( not ( = ?auto_111460 ?auto_111467 ) ) ( HAVE_IMAGE ?auto_111458 ?auto_111462 ) ( not ( = ?auto_111458 ?auto_111460 ) ) ( not ( = ?auto_111458 ?auto_111467 ) ) ( not ( = ?auto_111462 ?auto_111457 ) ) ( HAVE_IMAGE ?auto_111458 ?auto_111459 ) ( HAVE_IMAGE ?auto_111461 ?auto_111462 ) ( HAVE_IMAGE ?auto_111463 ?auto_111464 ) ( not ( = ?auto_111458 ?auto_111461 ) ) ( not ( = ?auto_111458 ?auto_111463 ) ) ( not ( = ?auto_111459 ?auto_111457 ) ) ( not ( = ?auto_111459 ?auto_111462 ) ) ( not ( = ?auto_111459 ?auto_111464 ) ) ( not ( = ?auto_111460 ?auto_111461 ) ) ( not ( = ?auto_111460 ?auto_111463 ) ) ( not ( = ?auto_111457 ?auto_111464 ) ) ( not ( = ?auto_111461 ?auto_111463 ) ) ( not ( = ?auto_111461 ?auto_111467 ) ) ( not ( = ?auto_111462 ?auto_111464 ) ) ( not ( = ?auto_111463 ?auto_111467 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111458 ?auto_111462 ?auto_111460 ?auto_111457 )
      ( GET-4IMAGE-VERIFY ?auto_111458 ?auto_111459 ?auto_111460 ?auto_111457 ?auto_111461 ?auto_111462 ?auto_111463 ?auto_111464 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111502 - DIRECTION
      ?auto_111503 - MODE
      ?auto_111504 - DIRECTION
      ?auto_111501 - MODE
      ?auto_111505 - DIRECTION
      ?auto_111506 - MODE
      ?auto_111507 - DIRECTION
      ?auto_111508 - MODE
    )
    :vars
    (
      ?auto_111510 - INSTRUMENT
      ?auto_111509 - SATELLITE
      ?auto_111511 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_111510 ) ( ON_BOARD ?auto_111510 ?auto_111509 ) ( SUPPORTS ?auto_111510 ?auto_111503 ) ( POWER_ON ?auto_111510 ) ( POINTING ?auto_111509 ?auto_111511 ) ( not ( = ?auto_111502 ?auto_111511 ) ) ( HAVE_IMAGE ?auto_111504 ?auto_111501 ) ( not ( = ?auto_111504 ?auto_111502 ) ) ( not ( = ?auto_111504 ?auto_111511 ) ) ( not ( = ?auto_111501 ?auto_111503 ) ) ( HAVE_IMAGE ?auto_111505 ?auto_111506 ) ( HAVE_IMAGE ?auto_111507 ?auto_111508 ) ( not ( = ?auto_111502 ?auto_111505 ) ) ( not ( = ?auto_111502 ?auto_111507 ) ) ( not ( = ?auto_111503 ?auto_111506 ) ) ( not ( = ?auto_111503 ?auto_111508 ) ) ( not ( = ?auto_111504 ?auto_111505 ) ) ( not ( = ?auto_111504 ?auto_111507 ) ) ( not ( = ?auto_111501 ?auto_111506 ) ) ( not ( = ?auto_111501 ?auto_111508 ) ) ( not ( = ?auto_111505 ?auto_111507 ) ) ( not ( = ?auto_111505 ?auto_111511 ) ) ( not ( = ?auto_111506 ?auto_111508 ) ) ( not ( = ?auto_111507 ?auto_111511 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111504 ?auto_111501 ?auto_111502 ?auto_111503 )
      ( GET-4IMAGE-VERIFY ?auto_111502 ?auto_111503 ?auto_111504 ?auto_111501 ?auto_111505 ?auto_111506 ?auto_111507 ?auto_111508 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_111591 - DIRECTION
      ?auto_111592 - MODE
    )
    :vars
    (
      ?auto_111596 - INSTRUMENT
      ?auto_111595 - SATELLITE
      ?auto_111597 - DIRECTION
      ?auto_111594 - DIRECTION
      ?auto_111593 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_111596 ?auto_111595 ) ( SUPPORTS ?auto_111596 ?auto_111592 ) ( POWER_ON ?auto_111596 ) ( POINTING ?auto_111595 ?auto_111597 ) ( not ( = ?auto_111591 ?auto_111597 ) ) ( HAVE_IMAGE ?auto_111594 ?auto_111593 ) ( not ( = ?auto_111594 ?auto_111591 ) ) ( not ( = ?auto_111594 ?auto_111597 ) ) ( not ( = ?auto_111593 ?auto_111592 ) ) ( CALIBRATION_TARGET ?auto_111596 ?auto_111597 ) ( NOT_CALIBRATED ?auto_111596 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_111595 ?auto_111596 ?auto_111597 )
      ( GET-2IMAGE ?auto_111594 ?auto_111593 ?auto_111591 ?auto_111592 )
      ( GET-1IMAGE-VERIFY ?auto_111591 ?auto_111592 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111599 - DIRECTION
      ?auto_111600 - MODE
      ?auto_111601 - DIRECTION
      ?auto_111598 - MODE
    )
    :vars
    (
      ?auto_111604 - INSTRUMENT
      ?auto_111603 - SATELLITE
      ?auto_111602 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111604 ?auto_111603 ) ( SUPPORTS ?auto_111604 ?auto_111598 ) ( POWER_ON ?auto_111604 ) ( POINTING ?auto_111603 ?auto_111602 ) ( not ( = ?auto_111601 ?auto_111602 ) ) ( HAVE_IMAGE ?auto_111599 ?auto_111600 ) ( not ( = ?auto_111599 ?auto_111601 ) ) ( not ( = ?auto_111599 ?auto_111602 ) ) ( not ( = ?auto_111600 ?auto_111598 ) ) ( CALIBRATION_TARGET ?auto_111604 ?auto_111602 ) ( NOT_CALIBRATED ?auto_111604 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111601 ?auto_111598 )
      ( GET-2IMAGE-VERIFY ?auto_111599 ?auto_111600 ?auto_111601 ?auto_111598 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111606 - DIRECTION
      ?auto_111607 - MODE
      ?auto_111608 - DIRECTION
      ?auto_111605 - MODE
    )
    :vars
    (
      ?auto_111609 - INSTRUMENT
      ?auto_111611 - SATELLITE
      ?auto_111610 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111609 ?auto_111611 ) ( SUPPORTS ?auto_111609 ?auto_111607 ) ( POWER_ON ?auto_111609 ) ( POINTING ?auto_111611 ?auto_111610 ) ( not ( = ?auto_111606 ?auto_111610 ) ) ( HAVE_IMAGE ?auto_111608 ?auto_111605 ) ( not ( = ?auto_111608 ?auto_111606 ) ) ( not ( = ?auto_111608 ?auto_111610 ) ) ( not ( = ?auto_111605 ?auto_111607 ) ) ( CALIBRATION_TARGET ?auto_111609 ?auto_111610 ) ( NOT_CALIBRATED ?auto_111609 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111608 ?auto_111605 ?auto_111606 ?auto_111607 )
      ( GET-2IMAGE-VERIFY ?auto_111606 ?auto_111607 ?auto_111608 ?auto_111605 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111622 - DIRECTION
      ?auto_111623 - MODE
      ?auto_111624 - DIRECTION
      ?auto_111621 - MODE
      ?auto_111625 - DIRECTION
      ?auto_111626 - MODE
    )
    :vars
    (
      ?auto_111627 - INSTRUMENT
      ?auto_111629 - SATELLITE
      ?auto_111628 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111627 ?auto_111629 ) ( SUPPORTS ?auto_111627 ?auto_111626 ) ( POWER_ON ?auto_111627 ) ( POINTING ?auto_111629 ?auto_111628 ) ( not ( = ?auto_111625 ?auto_111628 ) ) ( HAVE_IMAGE ?auto_111624 ?auto_111621 ) ( not ( = ?auto_111624 ?auto_111625 ) ) ( not ( = ?auto_111624 ?auto_111628 ) ) ( not ( = ?auto_111621 ?auto_111626 ) ) ( CALIBRATION_TARGET ?auto_111627 ?auto_111628 ) ( NOT_CALIBRATED ?auto_111627 ) ( HAVE_IMAGE ?auto_111622 ?auto_111623 ) ( not ( = ?auto_111622 ?auto_111624 ) ) ( not ( = ?auto_111622 ?auto_111625 ) ) ( not ( = ?auto_111622 ?auto_111628 ) ) ( not ( = ?auto_111623 ?auto_111621 ) ) ( not ( = ?auto_111623 ?auto_111626 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111624 ?auto_111621 ?auto_111625 ?auto_111626 )
      ( GET-3IMAGE-VERIFY ?auto_111622 ?auto_111623 ?auto_111624 ?auto_111621 ?auto_111625 ?auto_111626 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111631 - DIRECTION
      ?auto_111632 - MODE
      ?auto_111633 - DIRECTION
      ?auto_111630 - MODE
      ?auto_111634 - DIRECTION
      ?auto_111635 - MODE
    )
    :vars
    (
      ?auto_111636 - INSTRUMENT
      ?auto_111638 - SATELLITE
      ?auto_111637 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111636 ?auto_111638 ) ( SUPPORTS ?auto_111636 ?auto_111630 ) ( POWER_ON ?auto_111636 ) ( POINTING ?auto_111638 ?auto_111637 ) ( not ( = ?auto_111633 ?auto_111637 ) ) ( HAVE_IMAGE ?auto_111631 ?auto_111635 ) ( not ( = ?auto_111631 ?auto_111633 ) ) ( not ( = ?auto_111631 ?auto_111637 ) ) ( not ( = ?auto_111635 ?auto_111630 ) ) ( CALIBRATION_TARGET ?auto_111636 ?auto_111637 ) ( NOT_CALIBRATED ?auto_111636 ) ( HAVE_IMAGE ?auto_111631 ?auto_111632 ) ( HAVE_IMAGE ?auto_111634 ?auto_111635 ) ( not ( = ?auto_111631 ?auto_111634 ) ) ( not ( = ?auto_111632 ?auto_111630 ) ) ( not ( = ?auto_111632 ?auto_111635 ) ) ( not ( = ?auto_111633 ?auto_111634 ) ) ( not ( = ?auto_111634 ?auto_111637 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111631 ?auto_111635 ?auto_111633 ?auto_111630 )
      ( GET-3IMAGE-VERIFY ?auto_111631 ?auto_111632 ?auto_111633 ?auto_111630 ?auto_111634 ?auto_111635 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111649 - DIRECTION
      ?auto_111650 - MODE
      ?auto_111651 - DIRECTION
      ?auto_111648 - MODE
      ?auto_111652 - DIRECTION
      ?auto_111653 - MODE
    )
    :vars
    (
      ?auto_111654 - INSTRUMENT
      ?auto_111656 - SATELLITE
      ?auto_111655 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111654 ?auto_111656 ) ( SUPPORTS ?auto_111654 ?auto_111650 ) ( POWER_ON ?auto_111654 ) ( POINTING ?auto_111656 ?auto_111655 ) ( not ( = ?auto_111649 ?auto_111655 ) ) ( HAVE_IMAGE ?auto_111651 ?auto_111648 ) ( not ( = ?auto_111651 ?auto_111649 ) ) ( not ( = ?auto_111651 ?auto_111655 ) ) ( not ( = ?auto_111648 ?auto_111650 ) ) ( CALIBRATION_TARGET ?auto_111654 ?auto_111655 ) ( NOT_CALIBRATED ?auto_111654 ) ( HAVE_IMAGE ?auto_111652 ?auto_111653 ) ( not ( = ?auto_111649 ?auto_111652 ) ) ( not ( = ?auto_111650 ?auto_111653 ) ) ( not ( = ?auto_111651 ?auto_111652 ) ) ( not ( = ?auto_111648 ?auto_111653 ) ) ( not ( = ?auto_111652 ?auto_111655 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111651 ?auto_111648 ?auto_111649 ?auto_111650 )
      ( GET-3IMAGE-VERIFY ?auto_111649 ?auto_111650 ?auto_111651 ?auto_111648 ?auto_111652 ?auto_111653 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111687 - DIRECTION
      ?auto_111688 - MODE
      ?auto_111689 - DIRECTION
      ?auto_111686 - MODE
      ?auto_111690 - DIRECTION
      ?auto_111691 - MODE
      ?auto_111692 - DIRECTION
      ?auto_111693 - MODE
    )
    :vars
    (
      ?auto_111694 - INSTRUMENT
      ?auto_111696 - SATELLITE
      ?auto_111695 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111694 ?auto_111696 ) ( SUPPORTS ?auto_111694 ?auto_111693 ) ( POWER_ON ?auto_111694 ) ( POINTING ?auto_111696 ?auto_111695 ) ( not ( = ?auto_111692 ?auto_111695 ) ) ( HAVE_IMAGE ?auto_111687 ?auto_111686 ) ( not ( = ?auto_111687 ?auto_111692 ) ) ( not ( = ?auto_111687 ?auto_111695 ) ) ( not ( = ?auto_111686 ?auto_111693 ) ) ( CALIBRATION_TARGET ?auto_111694 ?auto_111695 ) ( NOT_CALIBRATED ?auto_111694 ) ( HAVE_IMAGE ?auto_111687 ?auto_111688 ) ( HAVE_IMAGE ?auto_111689 ?auto_111686 ) ( HAVE_IMAGE ?auto_111690 ?auto_111691 ) ( not ( = ?auto_111687 ?auto_111689 ) ) ( not ( = ?auto_111687 ?auto_111690 ) ) ( not ( = ?auto_111688 ?auto_111686 ) ) ( not ( = ?auto_111688 ?auto_111691 ) ) ( not ( = ?auto_111688 ?auto_111693 ) ) ( not ( = ?auto_111689 ?auto_111690 ) ) ( not ( = ?auto_111689 ?auto_111692 ) ) ( not ( = ?auto_111689 ?auto_111695 ) ) ( not ( = ?auto_111686 ?auto_111691 ) ) ( not ( = ?auto_111690 ?auto_111692 ) ) ( not ( = ?auto_111690 ?auto_111695 ) ) ( not ( = ?auto_111691 ?auto_111693 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111687 ?auto_111686 ?auto_111692 ?auto_111693 )
      ( GET-4IMAGE-VERIFY ?auto_111687 ?auto_111688 ?auto_111689 ?auto_111686 ?auto_111690 ?auto_111691 ?auto_111692 ?auto_111693 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111698 - DIRECTION
      ?auto_111699 - MODE
      ?auto_111700 - DIRECTION
      ?auto_111697 - MODE
      ?auto_111701 - DIRECTION
      ?auto_111702 - MODE
      ?auto_111703 - DIRECTION
      ?auto_111704 - MODE
    )
    :vars
    (
      ?auto_111705 - INSTRUMENT
      ?auto_111707 - SATELLITE
      ?auto_111706 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111705 ?auto_111707 ) ( SUPPORTS ?auto_111705 ?auto_111702 ) ( POWER_ON ?auto_111705 ) ( POINTING ?auto_111707 ?auto_111706 ) ( not ( = ?auto_111701 ?auto_111706 ) ) ( HAVE_IMAGE ?auto_111703 ?auto_111699 ) ( not ( = ?auto_111703 ?auto_111701 ) ) ( not ( = ?auto_111703 ?auto_111706 ) ) ( not ( = ?auto_111699 ?auto_111702 ) ) ( CALIBRATION_TARGET ?auto_111705 ?auto_111706 ) ( NOT_CALIBRATED ?auto_111705 ) ( HAVE_IMAGE ?auto_111698 ?auto_111699 ) ( HAVE_IMAGE ?auto_111700 ?auto_111697 ) ( HAVE_IMAGE ?auto_111703 ?auto_111704 ) ( not ( = ?auto_111698 ?auto_111700 ) ) ( not ( = ?auto_111698 ?auto_111701 ) ) ( not ( = ?auto_111698 ?auto_111703 ) ) ( not ( = ?auto_111698 ?auto_111706 ) ) ( not ( = ?auto_111699 ?auto_111697 ) ) ( not ( = ?auto_111699 ?auto_111704 ) ) ( not ( = ?auto_111700 ?auto_111701 ) ) ( not ( = ?auto_111700 ?auto_111703 ) ) ( not ( = ?auto_111700 ?auto_111706 ) ) ( not ( = ?auto_111697 ?auto_111702 ) ) ( not ( = ?auto_111697 ?auto_111704 ) ) ( not ( = ?auto_111702 ?auto_111704 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111703 ?auto_111699 ?auto_111701 ?auto_111702 )
      ( GET-4IMAGE-VERIFY ?auto_111698 ?auto_111699 ?auto_111700 ?auto_111697 ?auto_111701 ?auto_111702 ?auto_111703 ?auto_111704 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111720 - DIRECTION
      ?auto_111721 - MODE
      ?auto_111722 - DIRECTION
      ?auto_111719 - MODE
      ?auto_111723 - DIRECTION
      ?auto_111724 - MODE
      ?auto_111725 - DIRECTION
      ?auto_111726 - MODE
    )
    :vars
    (
      ?auto_111727 - INSTRUMENT
      ?auto_111729 - SATELLITE
      ?auto_111728 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111727 ?auto_111729 ) ( SUPPORTS ?auto_111727 ?auto_111719 ) ( POWER_ON ?auto_111727 ) ( POINTING ?auto_111729 ?auto_111728 ) ( not ( = ?auto_111722 ?auto_111728 ) ) ( HAVE_IMAGE ?auto_111720 ?auto_111721 ) ( not ( = ?auto_111720 ?auto_111722 ) ) ( not ( = ?auto_111720 ?auto_111728 ) ) ( not ( = ?auto_111721 ?auto_111719 ) ) ( CALIBRATION_TARGET ?auto_111727 ?auto_111728 ) ( NOT_CALIBRATED ?auto_111727 ) ( HAVE_IMAGE ?auto_111723 ?auto_111724 ) ( HAVE_IMAGE ?auto_111725 ?auto_111726 ) ( not ( = ?auto_111720 ?auto_111723 ) ) ( not ( = ?auto_111720 ?auto_111725 ) ) ( not ( = ?auto_111721 ?auto_111724 ) ) ( not ( = ?auto_111721 ?auto_111726 ) ) ( not ( = ?auto_111722 ?auto_111723 ) ) ( not ( = ?auto_111722 ?auto_111725 ) ) ( not ( = ?auto_111719 ?auto_111724 ) ) ( not ( = ?auto_111719 ?auto_111726 ) ) ( not ( = ?auto_111723 ?auto_111725 ) ) ( not ( = ?auto_111723 ?auto_111728 ) ) ( not ( = ?auto_111724 ?auto_111726 ) ) ( not ( = ?auto_111725 ?auto_111728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111720 ?auto_111721 ?auto_111722 ?auto_111719 )
      ( GET-4IMAGE-VERIFY ?auto_111720 ?auto_111721 ?auto_111722 ?auto_111719 ?auto_111723 ?auto_111724 ?auto_111725 ?auto_111726 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111764 - DIRECTION
      ?auto_111765 - MODE
      ?auto_111766 - DIRECTION
      ?auto_111763 - MODE
      ?auto_111767 - DIRECTION
      ?auto_111768 - MODE
      ?auto_111769 - DIRECTION
      ?auto_111770 - MODE
    )
    :vars
    (
      ?auto_111771 - INSTRUMENT
      ?auto_111773 - SATELLITE
      ?auto_111772 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111771 ?auto_111773 ) ( SUPPORTS ?auto_111771 ?auto_111765 ) ( POWER_ON ?auto_111771 ) ( POINTING ?auto_111773 ?auto_111772 ) ( not ( = ?auto_111764 ?auto_111772 ) ) ( HAVE_IMAGE ?auto_111767 ?auto_111768 ) ( not ( = ?auto_111767 ?auto_111764 ) ) ( not ( = ?auto_111767 ?auto_111772 ) ) ( not ( = ?auto_111768 ?auto_111765 ) ) ( CALIBRATION_TARGET ?auto_111771 ?auto_111772 ) ( NOT_CALIBRATED ?auto_111771 ) ( HAVE_IMAGE ?auto_111766 ?auto_111763 ) ( HAVE_IMAGE ?auto_111769 ?auto_111770 ) ( not ( = ?auto_111764 ?auto_111766 ) ) ( not ( = ?auto_111764 ?auto_111769 ) ) ( not ( = ?auto_111765 ?auto_111763 ) ) ( not ( = ?auto_111765 ?auto_111770 ) ) ( not ( = ?auto_111766 ?auto_111767 ) ) ( not ( = ?auto_111766 ?auto_111769 ) ) ( not ( = ?auto_111766 ?auto_111772 ) ) ( not ( = ?auto_111763 ?auto_111768 ) ) ( not ( = ?auto_111763 ?auto_111770 ) ) ( not ( = ?auto_111767 ?auto_111769 ) ) ( not ( = ?auto_111768 ?auto_111770 ) ) ( not ( = ?auto_111769 ?auto_111772 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111767 ?auto_111768 ?auto_111764 ?auto_111765 )
      ( GET-4IMAGE-VERIFY ?auto_111764 ?auto_111765 ?auto_111766 ?auto_111763 ?auto_111767 ?auto_111768 ?auto_111769 ?auto_111770 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_111853 - DIRECTION
      ?auto_111854 - MODE
    )
    :vars
    (
      ?auto_111855 - INSTRUMENT
      ?auto_111859 - SATELLITE
      ?auto_111856 - DIRECTION
      ?auto_111857 - DIRECTION
      ?auto_111858 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_111855 ?auto_111859 ) ( SUPPORTS ?auto_111855 ?auto_111854 ) ( POINTING ?auto_111859 ?auto_111856 ) ( not ( = ?auto_111853 ?auto_111856 ) ) ( HAVE_IMAGE ?auto_111857 ?auto_111858 ) ( not ( = ?auto_111857 ?auto_111853 ) ) ( not ( = ?auto_111857 ?auto_111856 ) ) ( not ( = ?auto_111858 ?auto_111854 ) ) ( CALIBRATION_TARGET ?auto_111855 ?auto_111856 ) ( POWER_AVAIL ?auto_111859 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_111855 ?auto_111859 )
      ( GET-2IMAGE ?auto_111857 ?auto_111858 ?auto_111853 ?auto_111854 )
      ( GET-1IMAGE-VERIFY ?auto_111853 ?auto_111854 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111861 - DIRECTION
      ?auto_111862 - MODE
      ?auto_111863 - DIRECTION
      ?auto_111860 - MODE
    )
    :vars
    (
      ?auto_111864 - INSTRUMENT
      ?auto_111866 - SATELLITE
      ?auto_111865 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111864 ?auto_111866 ) ( SUPPORTS ?auto_111864 ?auto_111860 ) ( POINTING ?auto_111866 ?auto_111865 ) ( not ( = ?auto_111863 ?auto_111865 ) ) ( HAVE_IMAGE ?auto_111861 ?auto_111862 ) ( not ( = ?auto_111861 ?auto_111863 ) ) ( not ( = ?auto_111861 ?auto_111865 ) ) ( not ( = ?auto_111862 ?auto_111860 ) ) ( CALIBRATION_TARGET ?auto_111864 ?auto_111865 ) ( POWER_AVAIL ?auto_111866 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_111863 ?auto_111860 )
      ( GET-2IMAGE-VERIFY ?auto_111861 ?auto_111862 ?auto_111863 ?auto_111860 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_111868 - DIRECTION
      ?auto_111869 - MODE
      ?auto_111870 - DIRECTION
      ?auto_111867 - MODE
    )
    :vars
    (
      ?auto_111873 - INSTRUMENT
      ?auto_111871 - SATELLITE
      ?auto_111872 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111873 ?auto_111871 ) ( SUPPORTS ?auto_111873 ?auto_111869 ) ( POINTING ?auto_111871 ?auto_111872 ) ( not ( = ?auto_111868 ?auto_111872 ) ) ( HAVE_IMAGE ?auto_111870 ?auto_111867 ) ( not ( = ?auto_111870 ?auto_111868 ) ) ( not ( = ?auto_111870 ?auto_111872 ) ) ( not ( = ?auto_111867 ?auto_111869 ) ) ( CALIBRATION_TARGET ?auto_111873 ?auto_111872 ) ( POWER_AVAIL ?auto_111871 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111870 ?auto_111867 ?auto_111868 ?auto_111869 )
      ( GET-2IMAGE-VERIFY ?auto_111868 ?auto_111869 ?auto_111870 ?auto_111867 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111884 - DIRECTION
      ?auto_111885 - MODE
      ?auto_111886 - DIRECTION
      ?auto_111883 - MODE
      ?auto_111887 - DIRECTION
      ?auto_111888 - MODE
    )
    :vars
    (
      ?auto_111891 - INSTRUMENT
      ?auto_111889 - SATELLITE
      ?auto_111890 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111891 ?auto_111889 ) ( SUPPORTS ?auto_111891 ?auto_111888 ) ( POINTING ?auto_111889 ?auto_111890 ) ( not ( = ?auto_111887 ?auto_111890 ) ) ( HAVE_IMAGE ?auto_111884 ?auto_111885 ) ( not ( = ?auto_111884 ?auto_111887 ) ) ( not ( = ?auto_111884 ?auto_111890 ) ) ( not ( = ?auto_111885 ?auto_111888 ) ) ( CALIBRATION_TARGET ?auto_111891 ?auto_111890 ) ( POWER_AVAIL ?auto_111889 ) ( HAVE_IMAGE ?auto_111886 ?auto_111883 ) ( not ( = ?auto_111884 ?auto_111886 ) ) ( not ( = ?auto_111885 ?auto_111883 ) ) ( not ( = ?auto_111886 ?auto_111887 ) ) ( not ( = ?auto_111886 ?auto_111890 ) ) ( not ( = ?auto_111883 ?auto_111888 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111884 ?auto_111885 ?auto_111887 ?auto_111888 )
      ( GET-3IMAGE-VERIFY ?auto_111884 ?auto_111885 ?auto_111886 ?auto_111883 ?auto_111887 ?auto_111888 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111893 - DIRECTION
      ?auto_111894 - MODE
      ?auto_111895 - DIRECTION
      ?auto_111892 - MODE
      ?auto_111896 - DIRECTION
      ?auto_111897 - MODE
    )
    :vars
    (
      ?auto_111900 - INSTRUMENT
      ?auto_111898 - SATELLITE
      ?auto_111899 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111900 ?auto_111898 ) ( SUPPORTS ?auto_111900 ?auto_111892 ) ( POINTING ?auto_111898 ?auto_111899 ) ( not ( = ?auto_111895 ?auto_111899 ) ) ( HAVE_IMAGE ?auto_111896 ?auto_111894 ) ( not ( = ?auto_111896 ?auto_111895 ) ) ( not ( = ?auto_111896 ?auto_111899 ) ) ( not ( = ?auto_111894 ?auto_111892 ) ) ( CALIBRATION_TARGET ?auto_111900 ?auto_111899 ) ( POWER_AVAIL ?auto_111898 ) ( HAVE_IMAGE ?auto_111893 ?auto_111894 ) ( HAVE_IMAGE ?auto_111896 ?auto_111897 ) ( not ( = ?auto_111893 ?auto_111895 ) ) ( not ( = ?auto_111893 ?auto_111896 ) ) ( not ( = ?auto_111893 ?auto_111899 ) ) ( not ( = ?auto_111894 ?auto_111897 ) ) ( not ( = ?auto_111892 ?auto_111897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111896 ?auto_111894 ?auto_111895 ?auto_111892 )
      ( GET-3IMAGE-VERIFY ?auto_111893 ?auto_111894 ?auto_111895 ?auto_111892 ?auto_111896 ?auto_111897 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_111911 - DIRECTION
      ?auto_111912 - MODE
      ?auto_111913 - DIRECTION
      ?auto_111910 - MODE
      ?auto_111914 - DIRECTION
      ?auto_111915 - MODE
    )
    :vars
    (
      ?auto_111918 - INSTRUMENT
      ?auto_111916 - SATELLITE
      ?auto_111917 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111918 ?auto_111916 ) ( SUPPORTS ?auto_111918 ?auto_111912 ) ( POINTING ?auto_111916 ?auto_111917 ) ( not ( = ?auto_111911 ?auto_111917 ) ) ( HAVE_IMAGE ?auto_111914 ?auto_111910 ) ( not ( = ?auto_111914 ?auto_111911 ) ) ( not ( = ?auto_111914 ?auto_111917 ) ) ( not ( = ?auto_111910 ?auto_111912 ) ) ( CALIBRATION_TARGET ?auto_111918 ?auto_111917 ) ( POWER_AVAIL ?auto_111916 ) ( HAVE_IMAGE ?auto_111913 ?auto_111910 ) ( HAVE_IMAGE ?auto_111914 ?auto_111915 ) ( not ( = ?auto_111911 ?auto_111913 ) ) ( not ( = ?auto_111912 ?auto_111915 ) ) ( not ( = ?auto_111913 ?auto_111914 ) ) ( not ( = ?auto_111913 ?auto_111917 ) ) ( not ( = ?auto_111910 ?auto_111915 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111914 ?auto_111910 ?auto_111911 ?auto_111912 )
      ( GET-3IMAGE-VERIFY ?auto_111911 ?auto_111912 ?auto_111913 ?auto_111910 ?auto_111914 ?auto_111915 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111949 - DIRECTION
      ?auto_111950 - MODE
      ?auto_111951 - DIRECTION
      ?auto_111948 - MODE
      ?auto_111952 - DIRECTION
      ?auto_111953 - MODE
      ?auto_111954 - DIRECTION
      ?auto_111955 - MODE
    )
    :vars
    (
      ?auto_111958 - INSTRUMENT
      ?auto_111956 - SATELLITE
      ?auto_111957 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111958 ?auto_111956 ) ( SUPPORTS ?auto_111958 ?auto_111955 ) ( POINTING ?auto_111956 ?auto_111957 ) ( not ( = ?auto_111954 ?auto_111957 ) ) ( HAVE_IMAGE ?auto_111951 ?auto_111948 ) ( not ( = ?auto_111951 ?auto_111954 ) ) ( not ( = ?auto_111951 ?auto_111957 ) ) ( not ( = ?auto_111948 ?auto_111955 ) ) ( CALIBRATION_TARGET ?auto_111958 ?auto_111957 ) ( POWER_AVAIL ?auto_111956 ) ( HAVE_IMAGE ?auto_111949 ?auto_111950 ) ( HAVE_IMAGE ?auto_111952 ?auto_111953 ) ( not ( = ?auto_111949 ?auto_111951 ) ) ( not ( = ?auto_111949 ?auto_111952 ) ) ( not ( = ?auto_111949 ?auto_111954 ) ) ( not ( = ?auto_111949 ?auto_111957 ) ) ( not ( = ?auto_111950 ?auto_111948 ) ) ( not ( = ?auto_111950 ?auto_111953 ) ) ( not ( = ?auto_111950 ?auto_111955 ) ) ( not ( = ?auto_111951 ?auto_111952 ) ) ( not ( = ?auto_111948 ?auto_111953 ) ) ( not ( = ?auto_111952 ?auto_111954 ) ) ( not ( = ?auto_111952 ?auto_111957 ) ) ( not ( = ?auto_111953 ?auto_111955 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111951 ?auto_111948 ?auto_111954 ?auto_111955 )
      ( GET-4IMAGE-VERIFY ?auto_111949 ?auto_111950 ?auto_111951 ?auto_111948 ?auto_111952 ?auto_111953 ?auto_111954 ?auto_111955 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111960 - DIRECTION
      ?auto_111961 - MODE
      ?auto_111962 - DIRECTION
      ?auto_111959 - MODE
      ?auto_111963 - DIRECTION
      ?auto_111964 - MODE
      ?auto_111965 - DIRECTION
      ?auto_111966 - MODE
    )
    :vars
    (
      ?auto_111969 - INSTRUMENT
      ?auto_111967 - SATELLITE
      ?auto_111968 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111969 ?auto_111967 ) ( SUPPORTS ?auto_111969 ?auto_111964 ) ( POINTING ?auto_111967 ?auto_111968 ) ( not ( = ?auto_111963 ?auto_111968 ) ) ( HAVE_IMAGE ?auto_111965 ?auto_111959 ) ( not ( = ?auto_111965 ?auto_111963 ) ) ( not ( = ?auto_111965 ?auto_111968 ) ) ( not ( = ?auto_111959 ?auto_111964 ) ) ( CALIBRATION_TARGET ?auto_111969 ?auto_111968 ) ( POWER_AVAIL ?auto_111967 ) ( HAVE_IMAGE ?auto_111960 ?auto_111961 ) ( HAVE_IMAGE ?auto_111962 ?auto_111959 ) ( HAVE_IMAGE ?auto_111965 ?auto_111966 ) ( not ( = ?auto_111960 ?auto_111962 ) ) ( not ( = ?auto_111960 ?auto_111963 ) ) ( not ( = ?auto_111960 ?auto_111965 ) ) ( not ( = ?auto_111960 ?auto_111968 ) ) ( not ( = ?auto_111961 ?auto_111959 ) ) ( not ( = ?auto_111961 ?auto_111964 ) ) ( not ( = ?auto_111961 ?auto_111966 ) ) ( not ( = ?auto_111962 ?auto_111963 ) ) ( not ( = ?auto_111962 ?auto_111965 ) ) ( not ( = ?auto_111962 ?auto_111968 ) ) ( not ( = ?auto_111959 ?auto_111966 ) ) ( not ( = ?auto_111964 ?auto_111966 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111965 ?auto_111959 ?auto_111963 ?auto_111964 )
      ( GET-4IMAGE-VERIFY ?auto_111960 ?auto_111961 ?auto_111962 ?auto_111959 ?auto_111963 ?auto_111964 ?auto_111965 ?auto_111966 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_111982 - DIRECTION
      ?auto_111983 - MODE
      ?auto_111984 - DIRECTION
      ?auto_111981 - MODE
      ?auto_111985 - DIRECTION
      ?auto_111986 - MODE
      ?auto_111987 - DIRECTION
      ?auto_111988 - MODE
    )
    :vars
    (
      ?auto_111991 - INSTRUMENT
      ?auto_111989 - SATELLITE
      ?auto_111990 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_111991 ?auto_111989 ) ( SUPPORTS ?auto_111991 ?auto_111981 ) ( POINTING ?auto_111989 ?auto_111990 ) ( not ( = ?auto_111984 ?auto_111990 ) ) ( HAVE_IMAGE ?auto_111987 ?auto_111983 ) ( not ( = ?auto_111987 ?auto_111984 ) ) ( not ( = ?auto_111987 ?auto_111990 ) ) ( not ( = ?auto_111983 ?auto_111981 ) ) ( CALIBRATION_TARGET ?auto_111991 ?auto_111990 ) ( POWER_AVAIL ?auto_111989 ) ( HAVE_IMAGE ?auto_111982 ?auto_111983 ) ( HAVE_IMAGE ?auto_111985 ?auto_111986 ) ( HAVE_IMAGE ?auto_111987 ?auto_111988 ) ( not ( = ?auto_111982 ?auto_111984 ) ) ( not ( = ?auto_111982 ?auto_111985 ) ) ( not ( = ?auto_111982 ?auto_111987 ) ) ( not ( = ?auto_111982 ?auto_111990 ) ) ( not ( = ?auto_111983 ?auto_111986 ) ) ( not ( = ?auto_111983 ?auto_111988 ) ) ( not ( = ?auto_111984 ?auto_111985 ) ) ( not ( = ?auto_111981 ?auto_111986 ) ) ( not ( = ?auto_111981 ?auto_111988 ) ) ( not ( = ?auto_111985 ?auto_111987 ) ) ( not ( = ?auto_111985 ?auto_111990 ) ) ( not ( = ?auto_111986 ?auto_111988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_111987 ?auto_111983 ?auto_111984 ?auto_111981 )
      ( GET-4IMAGE-VERIFY ?auto_111982 ?auto_111983 ?auto_111984 ?auto_111981 ?auto_111985 ?auto_111986 ?auto_111987 ?auto_111988 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_112026 - DIRECTION
      ?auto_112027 - MODE
      ?auto_112028 - DIRECTION
      ?auto_112025 - MODE
      ?auto_112029 - DIRECTION
      ?auto_112030 - MODE
      ?auto_112031 - DIRECTION
      ?auto_112032 - MODE
    )
    :vars
    (
      ?auto_112035 - INSTRUMENT
      ?auto_112033 - SATELLITE
      ?auto_112034 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112035 ?auto_112033 ) ( SUPPORTS ?auto_112035 ?auto_112027 ) ( POINTING ?auto_112033 ?auto_112034 ) ( not ( = ?auto_112026 ?auto_112034 ) ) ( HAVE_IMAGE ?auto_112029 ?auto_112032 ) ( not ( = ?auto_112029 ?auto_112026 ) ) ( not ( = ?auto_112029 ?auto_112034 ) ) ( not ( = ?auto_112032 ?auto_112027 ) ) ( CALIBRATION_TARGET ?auto_112035 ?auto_112034 ) ( POWER_AVAIL ?auto_112033 ) ( HAVE_IMAGE ?auto_112028 ?auto_112025 ) ( HAVE_IMAGE ?auto_112029 ?auto_112030 ) ( HAVE_IMAGE ?auto_112031 ?auto_112032 ) ( not ( = ?auto_112026 ?auto_112028 ) ) ( not ( = ?auto_112026 ?auto_112031 ) ) ( not ( = ?auto_112027 ?auto_112025 ) ) ( not ( = ?auto_112027 ?auto_112030 ) ) ( not ( = ?auto_112028 ?auto_112029 ) ) ( not ( = ?auto_112028 ?auto_112031 ) ) ( not ( = ?auto_112028 ?auto_112034 ) ) ( not ( = ?auto_112025 ?auto_112030 ) ) ( not ( = ?auto_112025 ?auto_112032 ) ) ( not ( = ?auto_112029 ?auto_112031 ) ) ( not ( = ?auto_112030 ?auto_112032 ) ) ( not ( = ?auto_112031 ?auto_112034 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112029 ?auto_112032 ?auto_112026 ?auto_112027 )
      ( GET-4IMAGE-VERIFY ?auto_112026 ?auto_112027 ?auto_112028 ?auto_112025 ?auto_112029 ?auto_112030 ?auto_112031 ?auto_112032 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_112115 - DIRECTION
      ?auto_112116 - MODE
    )
    :vars
    (
      ?auto_112120 - INSTRUMENT
      ?auto_112117 - SATELLITE
      ?auto_112119 - DIRECTION
      ?auto_112118 - DIRECTION
      ?auto_112121 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_112120 ?auto_112117 ) ( SUPPORTS ?auto_112120 ?auto_112116 ) ( not ( = ?auto_112115 ?auto_112119 ) ) ( HAVE_IMAGE ?auto_112118 ?auto_112121 ) ( not ( = ?auto_112118 ?auto_112115 ) ) ( not ( = ?auto_112118 ?auto_112119 ) ) ( not ( = ?auto_112121 ?auto_112116 ) ) ( CALIBRATION_TARGET ?auto_112120 ?auto_112119 ) ( POWER_AVAIL ?auto_112117 ) ( POINTING ?auto_112117 ?auto_112118 ) )
    :subtasks
    ( ( !TURN_TO ?auto_112117 ?auto_112119 ?auto_112118 )
      ( GET-2IMAGE ?auto_112118 ?auto_112121 ?auto_112115 ?auto_112116 )
      ( GET-1IMAGE-VERIFY ?auto_112115 ?auto_112116 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112123 - DIRECTION
      ?auto_112124 - MODE
      ?auto_112125 - DIRECTION
      ?auto_112122 - MODE
    )
    :vars
    (
      ?auto_112126 - INSTRUMENT
      ?auto_112127 - SATELLITE
      ?auto_112128 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112126 ?auto_112127 ) ( SUPPORTS ?auto_112126 ?auto_112122 ) ( not ( = ?auto_112125 ?auto_112128 ) ) ( HAVE_IMAGE ?auto_112123 ?auto_112124 ) ( not ( = ?auto_112123 ?auto_112125 ) ) ( not ( = ?auto_112123 ?auto_112128 ) ) ( not ( = ?auto_112124 ?auto_112122 ) ) ( CALIBRATION_TARGET ?auto_112126 ?auto_112128 ) ( POWER_AVAIL ?auto_112127 ) ( POINTING ?auto_112127 ?auto_112123 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112125 ?auto_112122 )
      ( GET-2IMAGE-VERIFY ?auto_112123 ?auto_112124 ?auto_112125 ?auto_112122 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112130 - DIRECTION
      ?auto_112131 - MODE
      ?auto_112132 - DIRECTION
      ?auto_112129 - MODE
    )
    :vars
    (
      ?auto_112134 - INSTRUMENT
      ?auto_112135 - SATELLITE
      ?auto_112133 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112134 ?auto_112135 ) ( SUPPORTS ?auto_112134 ?auto_112131 ) ( not ( = ?auto_112130 ?auto_112133 ) ) ( HAVE_IMAGE ?auto_112132 ?auto_112129 ) ( not ( = ?auto_112132 ?auto_112130 ) ) ( not ( = ?auto_112132 ?auto_112133 ) ) ( not ( = ?auto_112129 ?auto_112131 ) ) ( CALIBRATION_TARGET ?auto_112134 ?auto_112133 ) ( POWER_AVAIL ?auto_112135 ) ( POINTING ?auto_112135 ?auto_112132 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112132 ?auto_112129 ?auto_112130 ?auto_112131 )
      ( GET-2IMAGE-VERIFY ?auto_112130 ?auto_112131 ?auto_112132 ?auto_112129 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_112146 - DIRECTION
      ?auto_112147 - MODE
      ?auto_112148 - DIRECTION
      ?auto_112145 - MODE
      ?auto_112149 - DIRECTION
      ?auto_112150 - MODE
    )
    :vars
    (
      ?auto_112152 - INSTRUMENT
      ?auto_112153 - SATELLITE
      ?auto_112151 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112152 ?auto_112153 ) ( SUPPORTS ?auto_112152 ?auto_112150 ) ( not ( = ?auto_112149 ?auto_112151 ) ) ( HAVE_IMAGE ?auto_112146 ?auto_112147 ) ( not ( = ?auto_112146 ?auto_112149 ) ) ( not ( = ?auto_112146 ?auto_112151 ) ) ( not ( = ?auto_112147 ?auto_112150 ) ) ( CALIBRATION_TARGET ?auto_112152 ?auto_112151 ) ( POWER_AVAIL ?auto_112153 ) ( POINTING ?auto_112153 ?auto_112146 ) ( HAVE_IMAGE ?auto_112148 ?auto_112145 ) ( not ( = ?auto_112146 ?auto_112148 ) ) ( not ( = ?auto_112147 ?auto_112145 ) ) ( not ( = ?auto_112148 ?auto_112149 ) ) ( not ( = ?auto_112148 ?auto_112151 ) ) ( not ( = ?auto_112145 ?auto_112150 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112146 ?auto_112147 ?auto_112149 ?auto_112150 )
      ( GET-3IMAGE-VERIFY ?auto_112146 ?auto_112147 ?auto_112148 ?auto_112145 ?auto_112149 ?auto_112150 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_112155 - DIRECTION
      ?auto_112156 - MODE
      ?auto_112157 - DIRECTION
      ?auto_112154 - MODE
      ?auto_112158 - DIRECTION
      ?auto_112159 - MODE
    )
    :vars
    (
      ?auto_112161 - INSTRUMENT
      ?auto_112162 - SATELLITE
      ?auto_112160 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112161 ?auto_112162 ) ( SUPPORTS ?auto_112161 ?auto_112154 ) ( not ( = ?auto_112157 ?auto_112160 ) ) ( HAVE_IMAGE ?auto_112155 ?auto_112159 ) ( not ( = ?auto_112155 ?auto_112157 ) ) ( not ( = ?auto_112155 ?auto_112160 ) ) ( not ( = ?auto_112159 ?auto_112154 ) ) ( CALIBRATION_TARGET ?auto_112161 ?auto_112160 ) ( POWER_AVAIL ?auto_112162 ) ( POINTING ?auto_112162 ?auto_112155 ) ( HAVE_IMAGE ?auto_112155 ?auto_112156 ) ( HAVE_IMAGE ?auto_112158 ?auto_112159 ) ( not ( = ?auto_112155 ?auto_112158 ) ) ( not ( = ?auto_112156 ?auto_112154 ) ) ( not ( = ?auto_112156 ?auto_112159 ) ) ( not ( = ?auto_112157 ?auto_112158 ) ) ( not ( = ?auto_112158 ?auto_112160 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112155 ?auto_112159 ?auto_112157 ?auto_112154 )
      ( GET-3IMAGE-VERIFY ?auto_112155 ?auto_112156 ?auto_112157 ?auto_112154 ?auto_112158 ?auto_112159 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_112173 - DIRECTION
      ?auto_112174 - MODE
      ?auto_112175 - DIRECTION
      ?auto_112172 - MODE
      ?auto_112176 - DIRECTION
      ?auto_112177 - MODE
    )
    :vars
    (
      ?auto_112179 - INSTRUMENT
      ?auto_112180 - SATELLITE
      ?auto_112178 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112179 ?auto_112180 ) ( SUPPORTS ?auto_112179 ?auto_112174 ) ( not ( = ?auto_112173 ?auto_112178 ) ) ( HAVE_IMAGE ?auto_112176 ?auto_112177 ) ( not ( = ?auto_112176 ?auto_112173 ) ) ( not ( = ?auto_112176 ?auto_112178 ) ) ( not ( = ?auto_112177 ?auto_112174 ) ) ( CALIBRATION_TARGET ?auto_112179 ?auto_112178 ) ( POWER_AVAIL ?auto_112180 ) ( POINTING ?auto_112180 ?auto_112176 ) ( HAVE_IMAGE ?auto_112175 ?auto_112172 ) ( not ( = ?auto_112173 ?auto_112175 ) ) ( not ( = ?auto_112174 ?auto_112172 ) ) ( not ( = ?auto_112175 ?auto_112176 ) ) ( not ( = ?auto_112175 ?auto_112178 ) ) ( not ( = ?auto_112172 ?auto_112177 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112176 ?auto_112177 ?auto_112173 ?auto_112174 )
      ( GET-3IMAGE-VERIFY ?auto_112173 ?auto_112174 ?auto_112175 ?auto_112172 ?auto_112176 ?auto_112177 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_112211 - DIRECTION
      ?auto_112212 - MODE
      ?auto_112213 - DIRECTION
      ?auto_112210 - MODE
      ?auto_112214 - DIRECTION
      ?auto_112215 - MODE
      ?auto_112216 - DIRECTION
      ?auto_112217 - MODE
    )
    :vars
    (
      ?auto_112219 - INSTRUMENT
      ?auto_112220 - SATELLITE
      ?auto_112218 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112219 ?auto_112220 ) ( SUPPORTS ?auto_112219 ?auto_112217 ) ( not ( = ?auto_112216 ?auto_112218 ) ) ( HAVE_IMAGE ?auto_112211 ?auto_112212 ) ( not ( = ?auto_112211 ?auto_112216 ) ) ( not ( = ?auto_112211 ?auto_112218 ) ) ( not ( = ?auto_112212 ?auto_112217 ) ) ( CALIBRATION_TARGET ?auto_112219 ?auto_112218 ) ( POWER_AVAIL ?auto_112220 ) ( POINTING ?auto_112220 ?auto_112211 ) ( HAVE_IMAGE ?auto_112213 ?auto_112210 ) ( HAVE_IMAGE ?auto_112214 ?auto_112215 ) ( not ( = ?auto_112211 ?auto_112213 ) ) ( not ( = ?auto_112211 ?auto_112214 ) ) ( not ( = ?auto_112212 ?auto_112210 ) ) ( not ( = ?auto_112212 ?auto_112215 ) ) ( not ( = ?auto_112213 ?auto_112214 ) ) ( not ( = ?auto_112213 ?auto_112216 ) ) ( not ( = ?auto_112213 ?auto_112218 ) ) ( not ( = ?auto_112210 ?auto_112215 ) ) ( not ( = ?auto_112210 ?auto_112217 ) ) ( not ( = ?auto_112214 ?auto_112216 ) ) ( not ( = ?auto_112214 ?auto_112218 ) ) ( not ( = ?auto_112215 ?auto_112217 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112211 ?auto_112212 ?auto_112216 ?auto_112217 )
      ( GET-4IMAGE-VERIFY ?auto_112211 ?auto_112212 ?auto_112213 ?auto_112210 ?auto_112214 ?auto_112215 ?auto_112216 ?auto_112217 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_112222 - DIRECTION
      ?auto_112223 - MODE
      ?auto_112224 - DIRECTION
      ?auto_112221 - MODE
      ?auto_112225 - DIRECTION
      ?auto_112226 - MODE
      ?auto_112227 - DIRECTION
      ?auto_112228 - MODE
    )
    :vars
    (
      ?auto_112230 - INSTRUMENT
      ?auto_112231 - SATELLITE
      ?auto_112229 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112230 ?auto_112231 ) ( SUPPORTS ?auto_112230 ?auto_112226 ) ( not ( = ?auto_112225 ?auto_112229 ) ) ( HAVE_IMAGE ?auto_112227 ?auto_112228 ) ( not ( = ?auto_112227 ?auto_112225 ) ) ( not ( = ?auto_112227 ?auto_112229 ) ) ( not ( = ?auto_112228 ?auto_112226 ) ) ( CALIBRATION_TARGET ?auto_112230 ?auto_112229 ) ( POWER_AVAIL ?auto_112231 ) ( POINTING ?auto_112231 ?auto_112227 ) ( HAVE_IMAGE ?auto_112222 ?auto_112223 ) ( HAVE_IMAGE ?auto_112224 ?auto_112221 ) ( not ( = ?auto_112222 ?auto_112224 ) ) ( not ( = ?auto_112222 ?auto_112225 ) ) ( not ( = ?auto_112222 ?auto_112227 ) ) ( not ( = ?auto_112222 ?auto_112229 ) ) ( not ( = ?auto_112223 ?auto_112221 ) ) ( not ( = ?auto_112223 ?auto_112226 ) ) ( not ( = ?auto_112223 ?auto_112228 ) ) ( not ( = ?auto_112224 ?auto_112225 ) ) ( not ( = ?auto_112224 ?auto_112227 ) ) ( not ( = ?auto_112224 ?auto_112229 ) ) ( not ( = ?auto_112221 ?auto_112226 ) ) ( not ( = ?auto_112221 ?auto_112228 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112227 ?auto_112228 ?auto_112225 ?auto_112226 )
      ( GET-4IMAGE-VERIFY ?auto_112222 ?auto_112223 ?auto_112224 ?auto_112221 ?auto_112225 ?auto_112226 ?auto_112227 ?auto_112228 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_112244 - DIRECTION
      ?auto_112245 - MODE
      ?auto_112246 - DIRECTION
      ?auto_112243 - MODE
      ?auto_112247 - DIRECTION
      ?auto_112248 - MODE
      ?auto_112249 - DIRECTION
      ?auto_112250 - MODE
    )
    :vars
    (
      ?auto_112252 - INSTRUMENT
      ?auto_112253 - SATELLITE
      ?auto_112251 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112252 ?auto_112253 ) ( SUPPORTS ?auto_112252 ?auto_112243 ) ( not ( = ?auto_112246 ?auto_112251 ) ) ( HAVE_IMAGE ?auto_112244 ?auto_112250 ) ( not ( = ?auto_112244 ?auto_112246 ) ) ( not ( = ?auto_112244 ?auto_112251 ) ) ( not ( = ?auto_112250 ?auto_112243 ) ) ( CALIBRATION_TARGET ?auto_112252 ?auto_112251 ) ( POWER_AVAIL ?auto_112253 ) ( POINTING ?auto_112253 ?auto_112244 ) ( HAVE_IMAGE ?auto_112244 ?auto_112245 ) ( HAVE_IMAGE ?auto_112247 ?auto_112248 ) ( HAVE_IMAGE ?auto_112249 ?auto_112250 ) ( not ( = ?auto_112244 ?auto_112247 ) ) ( not ( = ?auto_112244 ?auto_112249 ) ) ( not ( = ?auto_112245 ?auto_112243 ) ) ( not ( = ?auto_112245 ?auto_112248 ) ) ( not ( = ?auto_112245 ?auto_112250 ) ) ( not ( = ?auto_112246 ?auto_112247 ) ) ( not ( = ?auto_112246 ?auto_112249 ) ) ( not ( = ?auto_112243 ?auto_112248 ) ) ( not ( = ?auto_112247 ?auto_112249 ) ) ( not ( = ?auto_112247 ?auto_112251 ) ) ( not ( = ?auto_112248 ?auto_112250 ) ) ( not ( = ?auto_112249 ?auto_112251 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112244 ?auto_112250 ?auto_112246 ?auto_112243 )
      ( GET-4IMAGE-VERIFY ?auto_112244 ?auto_112245 ?auto_112246 ?auto_112243 ?auto_112247 ?auto_112248 ?auto_112249 ?auto_112250 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_112288 - DIRECTION
      ?auto_112289 - MODE
      ?auto_112290 - DIRECTION
      ?auto_112287 - MODE
      ?auto_112291 - DIRECTION
      ?auto_112292 - MODE
      ?auto_112293 - DIRECTION
      ?auto_112294 - MODE
    )
    :vars
    (
      ?auto_112296 - INSTRUMENT
      ?auto_112297 - SATELLITE
      ?auto_112295 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_112296 ?auto_112297 ) ( SUPPORTS ?auto_112296 ?auto_112289 ) ( not ( = ?auto_112288 ?auto_112295 ) ) ( HAVE_IMAGE ?auto_112291 ?auto_112294 ) ( not ( = ?auto_112291 ?auto_112288 ) ) ( not ( = ?auto_112291 ?auto_112295 ) ) ( not ( = ?auto_112294 ?auto_112289 ) ) ( CALIBRATION_TARGET ?auto_112296 ?auto_112295 ) ( POWER_AVAIL ?auto_112297 ) ( POINTING ?auto_112297 ?auto_112291 ) ( HAVE_IMAGE ?auto_112290 ?auto_112287 ) ( HAVE_IMAGE ?auto_112291 ?auto_112292 ) ( HAVE_IMAGE ?auto_112293 ?auto_112294 ) ( not ( = ?auto_112288 ?auto_112290 ) ) ( not ( = ?auto_112288 ?auto_112293 ) ) ( not ( = ?auto_112289 ?auto_112287 ) ) ( not ( = ?auto_112289 ?auto_112292 ) ) ( not ( = ?auto_112290 ?auto_112291 ) ) ( not ( = ?auto_112290 ?auto_112293 ) ) ( not ( = ?auto_112290 ?auto_112295 ) ) ( not ( = ?auto_112287 ?auto_112292 ) ) ( not ( = ?auto_112287 ?auto_112294 ) ) ( not ( = ?auto_112291 ?auto_112293 ) ) ( not ( = ?auto_112292 ?auto_112294 ) ) ( not ( = ?auto_112293 ?auto_112295 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112291 ?auto_112294 ?auto_112288 ?auto_112289 )
      ( GET-4IMAGE-VERIFY ?auto_112288 ?auto_112289 ?auto_112290 ?auto_112287 ?auto_112291 ?auto_112292 ?auto_112293 ?auto_112294 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_112377 - DIRECTION
      ?auto_112378 - MODE
    )
    :vars
    (
      ?auto_112380 - INSTRUMENT
      ?auto_112383 - SATELLITE
      ?auto_112379 - DIRECTION
      ?auto_112382 - DIRECTION
      ?auto_112381 - MODE
      ?auto_112384 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112380 ?auto_112383 ) ( SUPPORTS ?auto_112380 ?auto_112378 ) ( not ( = ?auto_112377 ?auto_112379 ) ) ( HAVE_IMAGE ?auto_112382 ?auto_112381 ) ( not ( = ?auto_112382 ?auto_112377 ) ) ( not ( = ?auto_112382 ?auto_112379 ) ) ( not ( = ?auto_112381 ?auto_112378 ) ) ( CALIBRATION_TARGET ?auto_112380 ?auto_112379 ) ( POINTING ?auto_112383 ?auto_112382 ) ( ON_BOARD ?auto_112384 ?auto_112383 ) ( POWER_ON ?auto_112384 ) ( not ( = ?auto_112380 ?auto_112384 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_112384 ?auto_112383 )
      ( GET-2IMAGE ?auto_112382 ?auto_112381 ?auto_112377 ?auto_112378 )
      ( GET-1IMAGE-VERIFY ?auto_112377 ?auto_112378 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112386 - DIRECTION
      ?auto_112387 - MODE
      ?auto_112388 - DIRECTION
      ?auto_112385 - MODE
    )
    :vars
    (
      ?auto_112391 - INSTRUMENT
      ?auto_112390 - SATELLITE
      ?auto_112392 - DIRECTION
      ?auto_112389 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112391 ?auto_112390 ) ( SUPPORTS ?auto_112391 ?auto_112385 ) ( not ( = ?auto_112388 ?auto_112392 ) ) ( HAVE_IMAGE ?auto_112386 ?auto_112387 ) ( not ( = ?auto_112386 ?auto_112388 ) ) ( not ( = ?auto_112386 ?auto_112392 ) ) ( not ( = ?auto_112387 ?auto_112385 ) ) ( CALIBRATION_TARGET ?auto_112391 ?auto_112392 ) ( POINTING ?auto_112390 ?auto_112386 ) ( ON_BOARD ?auto_112389 ?auto_112390 ) ( POWER_ON ?auto_112389 ) ( not ( = ?auto_112391 ?auto_112389 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112388 ?auto_112385 )
      ( GET-2IMAGE-VERIFY ?auto_112386 ?auto_112387 ?auto_112388 ?auto_112385 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112394 - DIRECTION
      ?auto_112395 - MODE
      ?auto_112396 - DIRECTION
      ?auto_112393 - MODE
    )
    :vars
    (
      ?auto_112398 - INSTRUMENT
      ?auto_112400 - SATELLITE
      ?auto_112399 - DIRECTION
      ?auto_112397 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112398 ?auto_112400 ) ( SUPPORTS ?auto_112398 ?auto_112395 ) ( not ( = ?auto_112394 ?auto_112399 ) ) ( HAVE_IMAGE ?auto_112396 ?auto_112393 ) ( not ( = ?auto_112396 ?auto_112394 ) ) ( not ( = ?auto_112396 ?auto_112399 ) ) ( not ( = ?auto_112393 ?auto_112395 ) ) ( CALIBRATION_TARGET ?auto_112398 ?auto_112399 ) ( POINTING ?auto_112400 ?auto_112396 ) ( ON_BOARD ?auto_112397 ?auto_112400 ) ( POWER_ON ?auto_112397 ) ( not ( = ?auto_112398 ?auto_112397 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112396 ?auto_112393 ?auto_112394 ?auto_112395 )
      ( GET-2IMAGE-VERIFY ?auto_112394 ?auto_112395 ?auto_112396 ?auto_112393 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_112412 - DIRECTION
      ?auto_112413 - MODE
      ?auto_112414 - DIRECTION
      ?auto_112411 - MODE
      ?auto_112415 - DIRECTION
      ?auto_112416 - MODE
    )
    :vars
    (
      ?auto_112418 - INSTRUMENT
      ?auto_112420 - SATELLITE
      ?auto_112419 - DIRECTION
      ?auto_112417 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112418 ?auto_112420 ) ( SUPPORTS ?auto_112418 ?auto_112416 ) ( not ( = ?auto_112415 ?auto_112419 ) ) ( HAVE_IMAGE ?auto_112412 ?auto_112413 ) ( not ( = ?auto_112412 ?auto_112415 ) ) ( not ( = ?auto_112412 ?auto_112419 ) ) ( not ( = ?auto_112413 ?auto_112416 ) ) ( CALIBRATION_TARGET ?auto_112418 ?auto_112419 ) ( POINTING ?auto_112420 ?auto_112412 ) ( ON_BOARD ?auto_112417 ?auto_112420 ) ( POWER_ON ?auto_112417 ) ( not ( = ?auto_112418 ?auto_112417 ) ) ( HAVE_IMAGE ?auto_112414 ?auto_112411 ) ( not ( = ?auto_112412 ?auto_112414 ) ) ( not ( = ?auto_112413 ?auto_112411 ) ) ( not ( = ?auto_112414 ?auto_112415 ) ) ( not ( = ?auto_112414 ?auto_112419 ) ) ( not ( = ?auto_112411 ?auto_112416 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112412 ?auto_112413 ?auto_112415 ?auto_112416 )
      ( GET-3IMAGE-VERIFY ?auto_112412 ?auto_112413 ?auto_112414 ?auto_112411 ?auto_112415 ?auto_112416 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_112422 - DIRECTION
      ?auto_112423 - MODE
      ?auto_112424 - DIRECTION
      ?auto_112421 - MODE
      ?auto_112425 - DIRECTION
      ?auto_112426 - MODE
    )
    :vars
    (
      ?auto_112428 - INSTRUMENT
      ?auto_112430 - SATELLITE
      ?auto_112429 - DIRECTION
      ?auto_112427 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112428 ?auto_112430 ) ( SUPPORTS ?auto_112428 ?auto_112421 ) ( not ( = ?auto_112424 ?auto_112429 ) ) ( HAVE_IMAGE ?auto_112425 ?auto_112423 ) ( not ( = ?auto_112425 ?auto_112424 ) ) ( not ( = ?auto_112425 ?auto_112429 ) ) ( not ( = ?auto_112423 ?auto_112421 ) ) ( CALIBRATION_TARGET ?auto_112428 ?auto_112429 ) ( POINTING ?auto_112430 ?auto_112425 ) ( ON_BOARD ?auto_112427 ?auto_112430 ) ( POWER_ON ?auto_112427 ) ( not ( = ?auto_112428 ?auto_112427 ) ) ( HAVE_IMAGE ?auto_112422 ?auto_112423 ) ( HAVE_IMAGE ?auto_112425 ?auto_112426 ) ( not ( = ?auto_112422 ?auto_112424 ) ) ( not ( = ?auto_112422 ?auto_112425 ) ) ( not ( = ?auto_112422 ?auto_112429 ) ) ( not ( = ?auto_112423 ?auto_112426 ) ) ( not ( = ?auto_112421 ?auto_112426 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112425 ?auto_112423 ?auto_112424 ?auto_112421 )
      ( GET-3IMAGE-VERIFY ?auto_112422 ?auto_112423 ?auto_112424 ?auto_112421 ?auto_112425 ?auto_112426 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_112442 - DIRECTION
      ?auto_112443 - MODE
      ?auto_112444 - DIRECTION
      ?auto_112441 - MODE
      ?auto_112445 - DIRECTION
      ?auto_112446 - MODE
    )
    :vars
    (
      ?auto_112448 - INSTRUMENT
      ?auto_112450 - SATELLITE
      ?auto_112449 - DIRECTION
      ?auto_112447 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112448 ?auto_112450 ) ( SUPPORTS ?auto_112448 ?auto_112443 ) ( not ( = ?auto_112442 ?auto_112449 ) ) ( HAVE_IMAGE ?auto_112445 ?auto_112441 ) ( not ( = ?auto_112445 ?auto_112442 ) ) ( not ( = ?auto_112445 ?auto_112449 ) ) ( not ( = ?auto_112441 ?auto_112443 ) ) ( CALIBRATION_TARGET ?auto_112448 ?auto_112449 ) ( POINTING ?auto_112450 ?auto_112445 ) ( ON_BOARD ?auto_112447 ?auto_112450 ) ( POWER_ON ?auto_112447 ) ( not ( = ?auto_112448 ?auto_112447 ) ) ( HAVE_IMAGE ?auto_112444 ?auto_112441 ) ( HAVE_IMAGE ?auto_112445 ?auto_112446 ) ( not ( = ?auto_112442 ?auto_112444 ) ) ( not ( = ?auto_112443 ?auto_112446 ) ) ( not ( = ?auto_112444 ?auto_112445 ) ) ( not ( = ?auto_112444 ?auto_112449 ) ) ( not ( = ?auto_112441 ?auto_112446 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112445 ?auto_112441 ?auto_112442 ?auto_112443 )
      ( GET-3IMAGE-VERIFY ?auto_112442 ?auto_112443 ?auto_112444 ?auto_112441 ?auto_112445 ?auto_112446 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_112484 - DIRECTION
      ?auto_112485 - MODE
      ?auto_112486 - DIRECTION
      ?auto_112483 - MODE
      ?auto_112487 - DIRECTION
      ?auto_112488 - MODE
      ?auto_112489 - DIRECTION
      ?auto_112490 - MODE
    )
    :vars
    (
      ?auto_112492 - INSTRUMENT
      ?auto_112494 - SATELLITE
      ?auto_112493 - DIRECTION
      ?auto_112491 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112492 ?auto_112494 ) ( SUPPORTS ?auto_112492 ?auto_112490 ) ( not ( = ?auto_112489 ?auto_112493 ) ) ( HAVE_IMAGE ?auto_112486 ?auto_112485 ) ( not ( = ?auto_112486 ?auto_112489 ) ) ( not ( = ?auto_112486 ?auto_112493 ) ) ( not ( = ?auto_112485 ?auto_112490 ) ) ( CALIBRATION_TARGET ?auto_112492 ?auto_112493 ) ( POINTING ?auto_112494 ?auto_112486 ) ( ON_BOARD ?auto_112491 ?auto_112494 ) ( POWER_ON ?auto_112491 ) ( not ( = ?auto_112492 ?auto_112491 ) ) ( HAVE_IMAGE ?auto_112484 ?auto_112485 ) ( HAVE_IMAGE ?auto_112486 ?auto_112483 ) ( HAVE_IMAGE ?auto_112487 ?auto_112488 ) ( not ( = ?auto_112484 ?auto_112486 ) ) ( not ( = ?auto_112484 ?auto_112487 ) ) ( not ( = ?auto_112484 ?auto_112489 ) ) ( not ( = ?auto_112484 ?auto_112493 ) ) ( not ( = ?auto_112485 ?auto_112483 ) ) ( not ( = ?auto_112485 ?auto_112488 ) ) ( not ( = ?auto_112486 ?auto_112487 ) ) ( not ( = ?auto_112483 ?auto_112488 ) ) ( not ( = ?auto_112483 ?auto_112490 ) ) ( not ( = ?auto_112487 ?auto_112489 ) ) ( not ( = ?auto_112487 ?auto_112493 ) ) ( not ( = ?auto_112488 ?auto_112490 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112486 ?auto_112485 ?auto_112489 ?auto_112490 )
      ( GET-4IMAGE-VERIFY ?auto_112484 ?auto_112485 ?auto_112486 ?auto_112483 ?auto_112487 ?auto_112488 ?auto_112489 ?auto_112490 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_112496 - DIRECTION
      ?auto_112497 - MODE
      ?auto_112498 - DIRECTION
      ?auto_112495 - MODE
      ?auto_112499 - DIRECTION
      ?auto_112500 - MODE
      ?auto_112501 - DIRECTION
      ?auto_112502 - MODE
    )
    :vars
    (
      ?auto_112504 - INSTRUMENT
      ?auto_112506 - SATELLITE
      ?auto_112505 - DIRECTION
      ?auto_112503 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112504 ?auto_112506 ) ( SUPPORTS ?auto_112504 ?auto_112500 ) ( not ( = ?auto_112499 ?auto_112505 ) ) ( HAVE_IMAGE ?auto_112501 ?auto_112497 ) ( not ( = ?auto_112501 ?auto_112499 ) ) ( not ( = ?auto_112501 ?auto_112505 ) ) ( not ( = ?auto_112497 ?auto_112500 ) ) ( CALIBRATION_TARGET ?auto_112504 ?auto_112505 ) ( POINTING ?auto_112506 ?auto_112501 ) ( ON_BOARD ?auto_112503 ?auto_112506 ) ( POWER_ON ?auto_112503 ) ( not ( = ?auto_112504 ?auto_112503 ) ) ( HAVE_IMAGE ?auto_112496 ?auto_112497 ) ( HAVE_IMAGE ?auto_112498 ?auto_112495 ) ( HAVE_IMAGE ?auto_112501 ?auto_112502 ) ( not ( = ?auto_112496 ?auto_112498 ) ) ( not ( = ?auto_112496 ?auto_112499 ) ) ( not ( = ?auto_112496 ?auto_112501 ) ) ( not ( = ?auto_112496 ?auto_112505 ) ) ( not ( = ?auto_112497 ?auto_112495 ) ) ( not ( = ?auto_112497 ?auto_112502 ) ) ( not ( = ?auto_112498 ?auto_112499 ) ) ( not ( = ?auto_112498 ?auto_112501 ) ) ( not ( = ?auto_112498 ?auto_112505 ) ) ( not ( = ?auto_112495 ?auto_112500 ) ) ( not ( = ?auto_112495 ?auto_112502 ) ) ( not ( = ?auto_112500 ?auto_112502 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112501 ?auto_112497 ?auto_112499 ?auto_112500 )
      ( GET-4IMAGE-VERIFY ?auto_112496 ?auto_112497 ?auto_112498 ?auto_112495 ?auto_112499 ?auto_112500 ?auto_112501 ?auto_112502 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_112520 - DIRECTION
      ?auto_112521 - MODE
      ?auto_112522 - DIRECTION
      ?auto_112519 - MODE
      ?auto_112523 - DIRECTION
      ?auto_112524 - MODE
      ?auto_112525 - DIRECTION
      ?auto_112526 - MODE
    )
    :vars
    (
      ?auto_112528 - INSTRUMENT
      ?auto_112530 - SATELLITE
      ?auto_112529 - DIRECTION
      ?auto_112527 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112528 ?auto_112530 ) ( SUPPORTS ?auto_112528 ?auto_112519 ) ( not ( = ?auto_112522 ?auto_112529 ) ) ( HAVE_IMAGE ?auto_112525 ?auto_112521 ) ( not ( = ?auto_112525 ?auto_112522 ) ) ( not ( = ?auto_112525 ?auto_112529 ) ) ( not ( = ?auto_112521 ?auto_112519 ) ) ( CALIBRATION_TARGET ?auto_112528 ?auto_112529 ) ( POINTING ?auto_112530 ?auto_112525 ) ( ON_BOARD ?auto_112527 ?auto_112530 ) ( POWER_ON ?auto_112527 ) ( not ( = ?auto_112528 ?auto_112527 ) ) ( HAVE_IMAGE ?auto_112520 ?auto_112521 ) ( HAVE_IMAGE ?auto_112523 ?auto_112524 ) ( HAVE_IMAGE ?auto_112525 ?auto_112526 ) ( not ( = ?auto_112520 ?auto_112522 ) ) ( not ( = ?auto_112520 ?auto_112523 ) ) ( not ( = ?auto_112520 ?auto_112525 ) ) ( not ( = ?auto_112520 ?auto_112529 ) ) ( not ( = ?auto_112521 ?auto_112524 ) ) ( not ( = ?auto_112521 ?auto_112526 ) ) ( not ( = ?auto_112522 ?auto_112523 ) ) ( not ( = ?auto_112519 ?auto_112524 ) ) ( not ( = ?auto_112519 ?auto_112526 ) ) ( not ( = ?auto_112523 ?auto_112525 ) ) ( not ( = ?auto_112523 ?auto_112529 ) ) ( not ( = ?auto_112524 ?auto_112526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112525 ?auto_112521 ?auto_112522 ?auto_112519 )
      ( GET-4IMAGE-VERIFY ?auto_112520 ?auto_112521 ?auto_112522 ?auto_112519 ?auto_112523 ?auto_112524 ?auto_112525 ?auto_112526 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_112568 - DIRECTION
      ?auto_112569 - MODE
      ?auto_112570 - DIRECTION
      ?auto_112567 - MODE
      ?auto_112571 - DIRECTION
      ?auto_112572 - MODE
      ?auto_112573 - DIRECTION
      ?auto_112574 - MODE
    )
    :vars
    (
      ?auto_112576 - INSTRUMENT
      ?auto_112578 - SATELLITE
      ?auto_112577 - DIRECTION
      ?auto_112575 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112576 ?auto_112578 ) ( SUPPORTS ?auto_112576 ?auto_112569 ) ( not ( = ?auto_112568 ?auto_112577 ) ) ( HAVE_IMAGE ?auto_112571 ?auto_112572 ) ( not ( = ?auto_112571 ?auto_112568 ) ) ( not ( = ?auto_112571 ?auto_112577 ) ) ( not ( = ?auto_112572 ?auto_112569 ) ) ( CALIBRATION_TARGET ?auto_112576 ?auto_112577 ) ( POINTING ?auto_112578 ?auto_112571 ) ( ON_BOARD ?auto_112575 ?auto_112578 ) ( POWER_ON ?auto_112575 ) ( not ( = ?auto_112576 ?auto_112575 ) ) ( HAVE_IMAGE ?auto_112570 ?auto_112567 ) ( HAVE_IMAGE ?auto_112573 ?auto_112574 ) ( not ( = ?auto_112568 ?auto_112570 ) ) ( not ( = ?auto_112568 ?auto_112573 ) ) ( not ( = ?auto_112569 ?auto_112567 ) ) ( not ( = ?auto_112569 ?auto_112574 ) ) ( not ( = ?auto_112570 ?auto_112571 ) ) ( not ( = ?auto_112570 ?auto_112573 ) ) ( not ( = ?auto_112570 ?auto_112577 ) ) ( not ( = ?auto_112567 ?auto_112572 ) ) ( not ( = ?auto_112567 ?auto_112574 ) ) ( not ( = ?auto_112571 ?auto_112573 ) ) ( not ( = ?auto_112572 ?auto_112574 ) ) ( not ( = ?auto_112573 ?auto_112577 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112571 ?auto_112572 ?auto_112568 ?auto_112569 )
      ( GET-4IMAGE-VERIFY ?auto_112568 ?auto_112569 ?auto_112570 ?auto_112567 ?auto_112571 ?auto_112572 ?auto_112573 ?auto_112574 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_112665 - DIRECTION
      ?auto_112666 - MODE
    )
    :vars
    (
      ?auto_112670 - INSTRUMENT
      ?auto_112672 - SATELLITE
      ?auto_112671 - DIRECTION
      ?auto_112667 - DIRECTION
      ?auto_112668 - MODE
      ?auto_112669 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112670 ?auto_112672 ) ( SUPPORTS ?auto_112670 ?auto_112666 ) ( not ( = ?auto_112665 ?auto_112671 ) ) ( not ( = ?auto_112667 ?auto_112665 ) ) ( not ( = ?auto_112667 ?auto_112671 ) ) ( not ( = ?auto_112668 ?auto_112666 ) ) ( CALIBRATION_TARGET ?auto_112670 ?auto_112671 ) ( POINTING ?auto_112672 ?auto_112667 ) ( ON_BOARD ?auto_112669 ?auto_112672 ) ( POWER_ON ?auto_112669 ) ( not ( = ?auto_112670 ?auto_112669 ) ) ( CALIBRATED ?auto_112669 ) ( SUPPORTS ?auto_112669 ?auto_112668 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112667 ?auto_112668 )
      ( GET-2IMAGE ?auto_112667 ?auto_112668 ?auto_112665 ?auto_112666 )
      ( GET-1IMAGE-VERIFY ?auto_112665 ?auto_112666 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112674 - DIRECTION
      ?auto_112675 - MODE
      ?auto_112676 - DIRECTION
      ?auto_112673 - MODE
    )
    :vars
    (
      ?auto_112677 - INSTRUMENT
      ?auto_112680 - SATELLITE
      ?auto_112678 - DIRECTION
      ?auto_112679 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112677 ?auto_112680 ) ( SUPPORTS ?auto_112677 ?auto_112673 ) ( not ( = ?auto_112676 ?auto_112678 ) ) ( not ( = ?auto_112674 ?auto_112676 ) ) ( not ( = ?auto_112674 ?auto_112678 ) ) ( not ( = ?auto_112675 ?auto_112673 ) ) ( CALIBRATION_TARGET ?auto_112677 ?auto_112678 ) ( POINTING ?auto_112680 ?auto_112674 ) ( ON_BOARD ?auto_112679 ?auto_112680 ) ( POWER_ON ?auto_112679 ) ( not ( = ?auto_112677 ?auto_112679 ) ) ( CALIBRATED ?auto_112679 ) ( SUPPORTS ?auto_112679 ?auto_112675 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112676 ?auto_112673 )
      ( GET-2IMAGE-VERIFY ?auto_112674 ?auto_112675 ?auto_112676 ?auto_112673 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112682 - DIRECTION
      ?auto_112683 - MODE
      ?auto_112684 - DIRECTION
      ?auto_112681 - MODE
    )
    :vars
    (
      ?auto_112687 - INSTRUMENT
      ?auto_112685 - SATELLITE
      ?auto_112688 - DIRECTION
      ?auto_112686 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112687 ?auto_112685 ) ( SUPPORTS ?auto_112687 ?auto_112683 ) ( not ( = ?auto_112682 ?auto_112688 ) ) ( not ( = ?auto_112684 ?auto_112682 ) ) ( not ( = ?auto_112684 ?auto_112688 ) ) ( not ( = ?auto_112681 ?auto_112683 ) ) ( CALIBRATION_TARGET ?auto_112687 ?auto_112688 ) ( POINTING ?auto_112685 ?auto_112684 ) ( ON_BOARD ?auto_112686 ?auto_112685 ) ( POWER_ON ?auto_112686 ) ( not ( = ?auto_112687 ?auto_112686 ) ) ( CALIBRATED ?auto_112686 ) ( SUPPORTS ?auto_112686 ?auto_112681 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112684 ?auto_112681 ?auto_112682 ?auto_112683 )
      ( GET-2IMAGE-VERIFY ?auto_112682 ?auto_112683 ?auto_112684 ?auto_112681 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_112953 - DIRECTION
      ?auto_112954 - MODE
    )
    :vars
    (
      ?auto_112957 - INSTRUMENT
      ?auto_112955 - SATELLITE
      ?auto_112960 - DIRECTION
      ?auto_112959 - DIRECTION
      ?auto_112958 - MODE
      ?auto_112956 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112957 ?auto_112955 ) ( SUPPORTS ?auto_112957 ?auto_112954 ) ( not ( = ?auto_112953 ?auto_112960 ) ) ( not ( = ?auto_112959 ?auto_112953 ) ) ( not ( = ?auto_112959 ?auto_112960 ) ) ( not ( = ?auto_112958 ?auto_112954 ) ) ( CALIBRATION_TARGET ?auto_112957 ?auto_112960 ) ( ON_BOARD ?auto_112956 ?auto_112955 ) ( POWER_ON ?auto_112956 ) ( not ( = ?auto_112957 ?auto_112956 ) ) ( CALIBRATED ?auto_112956 ) ( SUPPORTS ?auto_112956 ?auto_112958 ) ( POINTING ?auto_112955 ?auto_112960 ) )
    :subtasks
    ( ( !TURN_TO ?auto_112955 ?auto_112959 ?auto_112960 )
      ( GET-2IMAGE ?auto_112959 ?auto_112958 ?auto_112953 ?auto_112954 )
      ( GET-1IMAGE-VERIFY ?auto_112953 ?auto_112954 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112962 - DIRECTION
      ?auto_112963 - MODE
      ?auto_112964 - DIRECTION
      ?auto_112961 - MODE
    )
    :vars
    (
      ?auto_112968 - INSTRUMENT
      ?auto_112966 - SATELLITE
      ?auto_112965 - DIRECTION
      ?auto_112967 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112968 ?auto_112966 ) ( SUPPORTS ?auto_112968 ?auto_112961 ) ( not ( = ?auto_112964 ?auto_112965 ) ) ( not ( = ?auto_112962 ?auto_112964 ) ) ( not ( = ?auto_112962 ?auto_112965 ) ) ( not ( = ?auto_112963 ?auto_112961 ) ) ( CALIBRATION_TARGET ?auto_112968 ?auto_112965 ) ( ON_BOARD ?auto_112967 ?auto_112966 ) ( POWER_ON ?auto_112967 ) ( not ( = ?auto_112968 ?auto_112967 ) ) ( CALIBRATED ?auto_112967 ) ( SUPPORTS ?auto_112967 ?auto_112963 ) ( POINTING ?auto_112966 ?auto_112965 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_112964 ?auto_112961 )
      ( GET-2IMAGE-VERIFY ?auto_112962 ?auto_112963 ?auto_112964 ?auto_112961 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_112970 - DIRECTION
      ?auto_112971 - MODE
      ?auto_112972 - DIRECTION
      ?auto_112969 - MODE
    )
    :vars
    (
      ?auto_112974 - INSTRUMENT
      ?auto_112976 - SATELLITE
      ?auto_112973 - DIRECTION
      ?auto_112975 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_112974 ?auto_112976 ) ( SUPPORTS ?auto_112974 ?auto_112971 ) ( not ( = ?auto_112970 ?auto_112973 ) ) ( not ( = ?auto_112972 ?auto_112970 ) ) ( not ( = ?auto_112972 ?auto_112973 ) ) ( not ( = ?auto_112969 ?auto_112971 ) ) ( CALIBRATION_TARGET ?auto_112974 ?auto_112973 ) ( ON_BOARD ?auto_112975 ?auto_112976 ) ( POWER_ON ?auto_112975 ) ( not ( = ?auto_112974 ?auto_112975 ) ) ( CALIBRATED ?auto_112975 ) ( SUPPORTS ?auto_112975 ?auto_112969 ) ( POINTING ?auto_112976 ?auto_112973 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_112972 ?auto_112969 ?auto_112970 ?auto_112971 )
      ( GET-2IMAGE-VERIFY ?auto_112970 ?auto_112971 ?auto_112972 ?auto_112969 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_113241 - DIRECTION
      ?auto_113242 - MODE
    )
    :vars
    (
      ?auto_113245 - INSTRUMENT
      ?auto_113247 - SATELLITE
      ?auto_113244 - DIRECTION
      ?auto_113243 - DIRECTION
      ?auto_113248 - MODE
      ?auto_113246 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_113245 ?auto_113247 ) ( SUPPORTS ?auto_113245 ?auto_113242 ) ( not ( = ?auto_113241 ?auto_113244 ) ) ( not ( = ?auto_113243 ?auto_113241 ) ) ( not ( = ?auto_113243 ?auto_113244 ) ) ( not ( = ?auto_113248 ?auto_113242 ) ) ( CALIBRATION_TARGET ?auto_113245 ?auto_113244 ) ( ON_BOARD ?auto_113246 ?auto_113247 ) ( POWER_ON ?auto_113246 ) ( not ( = ?auto_113245 ?auto_113246 ) ) ( SUPPORTS ?auto_113246 ?auto_113248 ) ( POINTING ?auto_113247 ?auto_113244 ) ( CALIBRATION_TARGET ?auto_113246 ?auto_113244 ) ( NOT_CALIBRATED ?auto_113246 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_113247 ?auto_113246 ?auto_113244 )
      ( GET-2IMAGE ?auto_113243 ?auto_113248 ?auto_113241 ?auto_113242 )
      ( GET-1IMAGE-VERIFY ?auto_113241 ?auto_113242 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_113250 - DIRECTION
      ?auto_113251 - MODE
      ?auto_113252 - DIRECTION
      ?auto_113249 - MODE
    )
    :vars
    (
      ?auto_113254 - INSTRUMENT
      ?auto_113253 - SATELLITE
      ?auto_113256 - DIRECTION
      ?auto_113255 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_113254 ?auto_113253 ) ( SUPPORTS ?auto_113254 ?auto_113249 ) ( not ( = ?auto_113252 ?auto_113256 ) ) ( not ( = ?auto_113250 ?auto_113252 ) ) ( not ( = ?auto_113250 ?auto_113256 ) ) ( not ( = ?auto_113251 ?auto_113249 ) ) ( CALIBRATION_TARGET ?auto_113254 ?auto_113256 ) ( ON_BOARD ?auto_113255 ?auto_113253 ) ( POWER_ON ?auto_113255 ) ( not ( = ?auto_113254 ?auto_113255 ) ) ( SUPPORTS ?auto_113255 ?auto_113251 ) ( POINTING ?auto_113253 ?auto_113256 ) ( CALIBRATION_TARGET ?auto_113255 ?auto_113256 ) ( NOT_CALIBRATED ?auto_113255 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_113252 ?auto_113249 )
      ( GET-2IMAGE-VERIFY ?auto_113250 ?auto_113251 ?auto_113252 ?auto_113249 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_113258 - DIRECTION
      ?auto_113259 - MODE
      ?auto_113260 - DIRECTION
      ?auto_113257 - MODE
    )
    :vars
    (
      ?auto_113264 - INSTRUMENT
      ?auto_113263 - SATELLITE
      ?auto_113262 - DIRECTION
      ?auto_113261 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_113264 ?auto_113263 ) ( SUPPORTS ?auto_113264 ?auto_113259 ) ( not ( = ?auto_113258 ?auto_113262 ) ) ( not ( = ?auto_113260 ?auto_113258 ) ) ( not ( = ?auto_113260 ?auto_113262 ) ) ( not ( = ?auto_113257 ?auto_113259 ) ) ( CALIBRATION_TARGET ?auto_113264 ?auto_113262 ) ( ON_BOARD ?auto_113261 ?auto_113263 ) ( POWER_ON ?auto_113261 ) ( not ( = ?auto_113264 ?auto_113261 ) ) ( SUPPORTS ?auto_113261 ?auto_113257 ) ( POINTING ?auto_113263 ?auto_113262 ) ( CALIBRATION_TARGET ?auto_113261 ?auto_113262 ) ( NOT_CALIBRATED ?auto_113261 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_113260 ?auto_113257 ?auto_113258 ?auto_113259 )
      ( GET-2IMAGE-VERIFY ?auto_113258 ?auto_113259 ?auto_113260 ?auto_113257 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115569 - DIRECTION
      ?auto_115570 - MODE
      ?auto_115571 - DIRECTION
      ?auto_115568 - MODE
      ?auto_115572 - DIRECTION
      ?auto_115573 - MODE
    )
    :vars
    (
      ?auto_115575 - INSTRUMENT
      ?auto_115574 - SATELLITE
      ?auto_115576 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115575 ) ( ON_BOARD ?auto_115575 ?auto_115574 ) ( SUPPORTS ?auto_115575 ?auto_115573 ) ( POWER_ON ?auto_115575 ) ( POINTING ?auto_115574 ?auto_115576 ) ( not ( = ?auto_115572 ?auto_115576 ) ) ( HAVE_IMAGE ?auto_115569 ?auto_115570 ) ( not ( = ?auto_115569 ?auto_115572 ) ) ( not ( = ?auto_115569 ?auto_115576 ) ) ( not ( = ?auto_115570 ?auto_115573 ) ) ( HAVE_IMAGE ?auto_115571 ?auto_115568 ) ( not ( = ?auto_115569 ?auto_115571 ) ) ( not ( = ?auto_115570 ?auto_115568 ) ) ( not ( = ?auto_115571 ?auto_115572 ) ) ( not ( = ?auto_115571 ?auto_115576 ) ) ( not ( = ?auto_115568 ?auto_115573 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115569 ?auto_115570 ?auto_115572 ?auto_115573 )
      ( GET-3IMAGE-VERIFY ?auto_115569 ?auto_115570 ?auto_115571 ?auto_115568 ?auto_115572 ?auto_115573 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115593 - DIRECTION
      ?auto_115594 - MODE
      ?auto_115595 - DIRECTION
      ?auto_115592 - MODE
      ?auto_115596 - DIRECTION
      ?auto_115597 - MODE
    )
    :vars
    (
      ?auto_115599 - INSTRUMENT
      ?auto_115598 - SATELLITE
      ?auto_115600 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115599 ) ( ON_BOARD ?auto_115599 ?auto_115598 ) ( SUPPORTS ?auto_115599 ?auto_115592 ) ( POWER_ON ?auto_115599 ) ( POINTING ?auto_115598 ?auto_115600 ) ( not ( = ?auto_115595 ?auto_115600 ) ) ( HAVE_IMAGE ?auto_115593 ?auto_115594 ) ( not ( = ?auto_115593 ?auto_115595 ) ) ( not ( = ?auto_115593 ?auto_115600 ) ) ( not ( = ?auto_115594 ?auto_115592 ) ) ( HAVE_IMAGE ?auto_115596 ?auto_115597 ) ( not ( = ?auto_115593 ?auto_115596 ) ) ( not ( = ?auto_115594 ?auto_115597 ) ) ( not ( = ?auto_115595 ?auto_115596 ) ) ( not ( = ?auto_115592 ?auto_115597 ) ) ( not ( = ?auto_115596 ?auto_115600 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115593 ?auto_115594 ?auto_115595 ?auto_115592 )
      ( GET-3IMAGE-VERIFY ?auto_115593 ?auto_115594 ?auto_115595 ?auto_115592 ?auto_115596 ?auto_115597 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115617 - DIRECTION
      ?auto_115618 - MODE
      ?auto_115619 - DIRECTION
      ?auto_115616 - MODE
      ?auto_115620 - DIRECTION
      ?auto_115621 - MODE
    )
    :vars
    (
      ?auto_115623 - INSTRUMENT
      ?auto_115622 - SATELLITE
      ?auto_115624 - DIRECTION
      ?auto_115625 - DIRECTION
      ?auto_115626 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_115623 ) ( ON_BOARD ?auto_115623 ?auto_115622 ) ( SUPPORTS ?auto_115623 ?auto_115621 ) ( POWER_ON ?auto_115623 ) ( POINTING ?auto_115622 ?auto_115624 ) ( not ( = ?auto_115620 ?auto_115624 ) ) ( HAVE_IMAGE ?auto_115625 ?auto_115626 ) ( not ( = ?auto_115625 ?auto_115620 ) ) ( not ( = ?auto_115625 ?auto_115624 ) ) ( not ( = ?auto_115626 ?auto_115621 ) ) ( HAVE_IMAGE ?auto_115617 ?auto_115618 ) ( HAVE_IMAGE ?auto_115619 ?auto_115616 ) ( not ( = ?auto_115617 ?auto_115619 ) ) ( not ( = ?auto_115617 ?auto_115620 ) ) ( not ( = ?auto_115617 ?auto_115624 ) ) ( not ( = ?auto_115617 ?auto_115625 ) ) ( not ( = ?auto_115618 ?auto_115616 ) ) ( not ( = ?auto_115618 ?auto_115621 ) ) ( not ( = ?auto_115618 ?auto_115626 ) ) ( not ( = ?auto_115619 ?auto_115620 ) ) ( not ( = ?auto_115619 ?auto_115624 ) ) ( not ( = ?auto_115619 ?auto_115625 ) ) ( not ( = ?auto_115616 ?auto_115621 ) ) ( not ( = ?auto_115616 ?auto_115626 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115625 ?auto_115626 ?auto_115620 ?auto_115621 )
      ( GET-3IMAGE-VERIFY ?auto_115617 ?auto_115618 ?auto_115619 ?auto_115616 ?auto_115620 ?auto_115621 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115634 - DIRECTION
      ?auto_115635 - MODE
      ?auto_115636 - DIRECTION
      ?auto_115633 - MODE
      ?auto_115637 - DIRECTION
      ?auto_115638 - MODE
    )
    :vars
    (
      ?auto_115640 - INSTRUMENT
      ?auto_115639 - SATELLITE
      ?auto_115641 - DIRECTION
      ?auto_115642 - DIRECTION
      ?auto_115643 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_115640 ) ( ON_BOARD ?auto_115640 ?auto_115639 ) ( SUPPORTS ?auto_115640 ?auto_115633 ) ( POWER_ON ?auto_115640 ) ( POINTING ?auto_115639 ?auto_115641 ) ( not ( = ?auto_115636 ?auto_115641 ) ) ( HAVE_IMAGE ?auto_115642 ?auto_115643 ) ( not ( = ?auto_115642 ?auto_115636 ) ) ( not ( = ?auto_115642 ?auto_115641 ) ) ( not ( = ?auto_115643 ?auto_115633 ) ) ( HAVE_IMAGE ?auto_115634 ?auto_115635 ) ( HAVE_IMAGE ?auto_115637 ?auto_115638 ) ( not ( = ?auto_115634 ?auto_115636 ) ) ( not ( = ?auto_115634 ?auto_115637 ) ) ( not ( = ?auto_115634 ?auto_115641 ) ) ( not ( = ?auto_115634 ?auto_115642 ) ) ( not ( = ?auto_115635 ?auto_115633 ) ) ( not ( = ?auto_115635 ?auto_115638 ) ) ( not ( = ?auto_115635 ?auto_115643 ) ) ( not ( = ?auto_115636 ?auto_115637 ) ) ( not ( = ?auto_115633 ?auto_115638 ) ) ( not ( = ?auto_115637 ?auto_115641 ) ) ( not ( = ?auto_115637 ?auto_115642 ) ) ( not ( = ?auto_115638 ?auto_115643 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115642 ?auto_115643 ?auto_115636 ?auto_115633 )
      ( GET-3IMAGE-VERIFY ?auto_115634 ?auto_115635 ?auto_115636 ?auto_115633 ?auto_115637 ?auto_115638 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115656 - DIRECTION
      ?auto_115657 - MODE
      ?auto_115658 - DIRECTION
      ?auto_115655 - MODE
      ?auto_115659 - DIRECTION
      ?auto_115660 - MODE
    )
    :vars
    (
      ?auto_115662 - INSTRUMENT
      ?auto_115661 - SATELLITE
      ?auto_115663 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115662 ) ( ON_BOARD ?auto_115662 ?auto_115661 ) ( SUPPORTS ?auto_115662 ?auto_115657 ) ( POWER_ON ?auto_115662 ) ( POINTING ?auto_115661 ?auto_115663 ) ( not ( = ?auto_115656 ?auto_115663 ) ) ( HAVE_IMAGE ?auto_115658 ?auto_115655 ) ( not ( = ?auto_115658 ?auto_115656 ) ) ( not ( = ?auto_115658 ?auto_115663 ) ) ( not ( = ?auto_115655 ?auto_115657 ) ) ( HAVE_IMAGE ?auto_115659 ?auto_115660 ) ( not ( = ?auto_115656 ?auto_115659 ) ) ( not ( = ?auto_115657 ?auto_115660 ) ) ( not ( = ?auto_115658 ?auto_115659 ) ) ( not ( = ?auto_115655 ?auto_115660 ) ) ( not ( = ?auto_115659 ?auto_115663 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115658 ?auto_115655 ?auto_115656 ?auto_115657 )
      ( GET-3IMAGE-VERIFY ?auto_115656 ?auto_115657 ?auto_115658 ?auto_115655 ?auto_115659 ?auto_115660 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_115686 - DIRECTION
      ?auto_115687 - MODE
      ?auto_115688 - DIRECTION
      ?auto_115685 - MODE
      ?auto_115689 - DIRECTION
      ?auto_115690 - MODE
    )
    :vars
    (
      ?auto_115692 - INSTRUMENT
      ?auto_115691 - SATELLITE
      ?auto_115693 - DIRECTION
      ?auto_115694 - DIRECTION
      ?auto_115695 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_115692 ) ( ON_BOARD ?auto_115692 ?auto_115691 ) ( SUPPORTS ?auto_115692 ?auto_115687 ) ( POWER_ON ?auto_115692 ) ( POINTING ?auto_115691 ?auto_115693 ) ( not ( = ?auto_115686 ?auto_115693 ) ) ( HAVE_IMAGE ?auto_115694 ?auto_115695 ) ( not ( = ?auto_115694 ?auto_115686 ) ) ( not ( = ?auto_115694 ?auto_115693 ) ) ( not ( = ?auto_115695 ?auto_115687 ) ) ( HAVE_IMAGE ?auto_115688 ?auto_115685 ) ( HAVE_IMAGE ?auto_115689 ?auto_115690 ) ( not ( = ?auto_115686 ?auto_115688 ) ) ( not ( = ?auto_115686 ?auto_115689 ) ) ( not ( = ?auto_115687 ?auto_115685 ) ) ( not ( = ?auto_115687 ?auto_115690 ) ) ( not ( = ?auto_115688 ?auto_115689 ) ) ( not ( = ?auto_115688 ?auto_115693 ) ) ( not ( = ?auto_115688 ?auto_115694 ) ) ( not ( = ?auto_115685 ?auto_115690 ) ) ( not ( = ?auto_115685 ?auto_115695 ) ) ( not ( = ?auto_115689 ?auto_115693 ) ) ( not ( = ?auto_115689 ?auto_115694 ) ) ( not ( = ?auto_115690 ?auto_115695 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115694 ?auto_115695 ?auto_115686 ?auto_115687 )
      ( GET-3IMAGE-VERIFY ?auto_115686 ?auto_115687 ?auto_115688 ?auto_115685 ?auto_115689 ?auto_115690 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115750 - DIRECTION
      ?auto_115751 - MODE
      ?auto_115752 - DIRECTION
      ?auto_115749 - MODE
      ?auto_115753 - DIRECTION
      ?auto_115754 - MODE
      ?auto_115755 - DIRECTION
      ?auto_115756 - MODE
    )
    :vars
    (
      ?auto_115758 - INSTRUMENT
      ?auto_115757 - SATELLITE
      ?auto_115759 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115758 ) ( ON_BOARD ?auto_115758 ?auto_115757 ) ( SUPPORTS ?auto_115758 ?auto_115756 ) ( POWER_ON ?auto_115758 ) ( POINTING ?auto_115757 ?auto_115759 ) ( not ( = ?auto_115755 ?auto_115759 ) ) ( HAVE_IMAGE ?auto_115752 ?auto_115751 ) ( not ( = ?auto_115752 ?auto_115755 ) ) ( not ( = ?auto_115752 ?auto_115759 ) ) ( not ( = ?auto_115751 ?auto_115756 ) ) ( HAVE_IMAGE ?auto_115750 ?auto_115751 ) ( HAVE_IMAGE ?auto_115752 ?auto_115749 ) ( HAVE_IMAGE ?auto_115753 ?auto_115754 ) ( not ( = ?auto_115750 ?auto_115752 ) ) ( not ( = ?auto_115750 ?auto_115753 ) ) ( not ( = ?auto_115750 ?auto_115755 ) ) ( not ( = ?auto_115750 ?auto_115759 ) ) ( not ( = ?auto_115751 ?auto_115749 ) ) ( not ( = ?auto_115751 ?auto_115754 ) ) ( not ( = ?auto_115752 ?auto_115753 ) ) ( not ( = ?auto_115749 ?auto_115754 ) ) ( not ( = ?auto_115749 ?auto_115756 ) ) ( not ( = ?auto_115753 ?auto_115755 ) ) ( not ( = ?auto_115753 ?auto_115759 ) ) ( not ( = ?auto_115754 ?auto_115756 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115752 ?auto_115751 ?auto_115755 ?auto_115756 )
      ( GET-4IMAGE-VERIFY ?auto_115750 ?auto_115751 ?auto_115752 ?auto_115749 ?auto_115753 ?auto_115754 ?auto_115755 ?auto_115756 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115761 - DIRECTION
      ?auto_115762 - MODE
      ?auto_115763 - DIRECTION
      ?auto_115760 - MODE
      ?auto_115764 - DIRECTION
      ?auto_115765 - MODE
      ?auto_115766 - DIRECTION
      ?auto_115767 - MODE
    )
    :vars
    (
      ?auto_115769 - INSTRUMENT
      ?auto_115768 - SATELLITE
      ?auto_115770 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115769 ) ( ON_BOARD ?auto_115769 ?auto_115768 ) ( SUPPORTS ?auto_115769 ?auto_115765 ) ( POWER_ON ?auto_115769 ) ( POINTING ?auto_115768 ?auto_115770 ) ( not ( = ?auto_115764 ?auto_115770 ) ) ( HAVE_IMAGE ?auto_115761 ?auto_115767 ) ( not ( = ?auto_115761 ?auto_115764 ) ) ( not ( = ?auto_115761 ?auto_115770 ) ) ( not ( = ?auto_115767 ?auto_115765 ) ) ( HAVE_IMAGE ?auto_115761 ?auto_115762 ) ( HAVE_IMAGE ?auto_115763 ?auto_115760 ) ( HAVE_IMAGE ?auto_115766 ?auto_115767 ) ( not ( = ?auto_115761 ?auto_115763 ) ) ( not ( = ?auto_115761 ?auto_115766 ) ) ( not ( = ?auto_115762 ?auto_115760 ) ) ( not ( = ?auto_115762 ?auto_115765 ) ) ( not ( = ?auto_115762 ?auto_115767 ) ) ( not ( = ?auto_115763 ?auto_115764 ) ) ( not ( = ?auto_115763 ?auto_115766 ) ) ( not ( = ?auto_115763 ?auto_115770 ) ) ( not ( = ?auto_115760 ?auto_115765 ) ) ( not ( = ?auto_115760 ?auto_115767 ) ) ( not ( = ?auto_115764 ?auto_115766 ) ) ( not ( = ?auto_115766 ?auto_115770 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115761 ?auto_115767 ?auto_115764 ?auto_115765 )
      ( GET-4IMAGE-VERIFY ?auto_115761 ?auto_115762 ?auto_115763 ?auto_115760 ?auto_115764 ?auto_115765 ?auto_115766 ?auto_115767 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115794 - DIRECTION
      ?auto_115795 - MODE
      ?auto_115796 - DIRECTION
      ?auto_115793 - MODE
      ?auto_115797 - DIRECTION
      ?auto_115798 - MODE
      ?auto_115799 - DIRECTION
      ?auto_115800 - MODE
    )
    :vars
    (
      ?auto_115802 - INSTRUMENT
      ?auto_115801 - SATELLITE
      ?auto_115803 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115802 ) ( ON_BOARD ?auto_115802 ?auto_115801 ) ( SUPPORTS ?auto_115802 ?auto_115800 ) ( POWER_ON ?auto_115802 ) ( POINTING ?auto_115801 ?auto_115803 ) ( not ( = ?auto_115799 ?auto_115803 ) ) ( HAVE_IMAGE ?auto_115794 ?auto_115798 ) ( not ( = ?auto_115794 ?auto_115799 ) ) ( not ( = ?auto_115794 ?auto_115803 ) ) ( not ( = ?auto_115798 ?auto_115800 ) ) ( HAVE_IMAGE ?auto_115794 ?auto_115795 ) ( HAVE_IMAGE ?auto_115796 ?auto_115793 ) ( HAVE_IMAGE ?auto_115797 ?auto_115798 ) ( not ( = ?auto_115794 ?auto_115796 ) ) ( not ( = ?auto_115794 ?auto_115797 ) ) ( not ( = ?auto_115795 ?auto_115793 ) ) ( not ( = ?auto_115795 ?auto_115798 ) ) ( not ( = ?auto_115795 ?auto_115800 ) ) ( not ( = ?auto_115796 ?auto_115797 ) ) ( not ( = ?auto_115796 ?auto_115799 ) ) ( not ( = ?auto_115796 ?auto_115803 ) ) ( not ( = ?auto_115793 ?auto_115798 ) ) ( not ( = ?auto_115793 ?auto_115800 ) ) ( not ( = ?auto_115797 ?auto_115799 ) ) ( not ( = ?auto_115797 ?auto_115803 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115794 ?auto_115798 ?auto_115799 ?auto_115800 )
      ( GET-4IMAGE-VERIFY ?auto_115794 ?auto_115795 ?auto_115796 ?auto_115793 ?auto_115797 ?auto_115798 ?auto_115799 ?auto_115800 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115805 - DIRECTION
      ?auto_115806 - MODE
      ?auto_115807 - DIRECTION
      ?auto_115804 - MODE
      ?auto_115808 - DIRECTION
      ?auto_115809 - MODE
      ?auto_115810 - DIRECTION
      ?auto_115811 - MODE
    )
    :vars
    (
      ?auto_115813 - INSTRUMENT
      ?auto_115812 - SATELLITE
      ?auto_115814 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115813 ) ( ON_BOARD ?auto_115813 ?auto_115812 ) ( SUPPORTS ?auto_115813 ?auto_115811 ) ( POWER_ON ?auto_115813 ) ( POINTING ?auto_115812 ?auto_115814 ) ( not ( = ?auto_115810 ?auto_115814 ) ) ( HAVE_IMAGE ?auto_115805 ?auto_115806 ) ( not ( = ?auto_115805 ?auto_115810 ) ) ( not ( = ?auto_115805 ?auto_115814 ) ) ( not ( = ?auto_115806 ?auto_115811 ) ) ( HAVE_IMAGE ?auto_115807 ?auto_115804 ) ( HAVE_IMAGE ?auto_115808 ?auto_115809 ) ( not ( = ?auto_115805 ?auto_115807 ) ) ( not ( = ?auto_115805 ?auto_115808 ) ) ( not ( = ?auto_115806 ?auto_115804 ) ) ( not ( = ?auto_115806 ?auto_115809 ) ) ( not ( = ?auto_115807 ?auto_115808 ) ) ( not ( = ?auto_115807 ?auto_115810 ) ) ( not ( = ?auto_115807 ?auto_115814 ) ) ( not ( = ?auto_115804 ?auto_115809 ) ) ( not ( = ?auto_115804 ?auto_115811 ) ) ( not ( = ?auto_115808 ?auto_115810 ) ) ( not ( = ?auto_115808 ?auto_115814 ) ) ( not ( = ?auto_115809 ?auto_115811 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115805 ?auto_115806 ?auto_115810 ?auto_115811 )
      ( GET-4IMAGE-VERIFY ?auto_115805 ?auto_115806 ?auto_115807 ?auto_115804 ?auto_115808 ?auto_115809 ?auto_115810 ?auto_115811 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115827 - DIRECTION
      ?auto_115828 - MODE
      ?auto_115829 - DIRECTION
      ?auto_115826 - MODE
      ?auto_115830 - DIRECTION
      ?auto_115831 - MODE
      ?auto_115832 - DIRECTION
      ?auto_115833 - MODE
    )
    :vars
    (
      ?auto_115835 - INSTRUMENT
      ?auto_115834 - SATELLITE
      ?auto_115836 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115835 ) ( ON_BOARD ?auto_115835 ?auto_115834 ) ( SUPPORTS ?auto_115835 ?auto_115831 ) ( POWER_ON ?auto_115835 ) ( POINTING ?auto_115834 ?auto_115836 ) ( not ( = ?auto_115830 ?auto_115836 ) ) ( HAVE_IMAGE ?auto_115827 ?auto_115828 ) ( not ( = ?auto_115827 ?auto_115830 ) ) ( not ( = ?auto_115827 ?auto_115836 ) ) ( not ( = ?auto_115828 ?auto_115831 ) ) ( HAVE_IMAGE ?auto_115829 ?auto_115826 ) ( HAVE_IMAGE ?auto_115832 ?auto_115833 ) ( not ( = ?auto_115827 ?auto_115829 ) ) ( not ( = ?auto_115827 ?auto_115832 ) ) ( not ( = ?auto_115828 ?auto_115826 ) ) ( not ( = ?auto_115828 ?auto_115833 ) ) ( not ( = ?auto_115829 ?auto_115830 ) ) ( not ( = ?auto_115829 ?auto_115832 ) ) ( not ( = ?auto_115829 ?auto_115836 ) ) ( not ( = ?auto_115826 ?auto_115831 ) ) ( not ( = ?auto_115826 ?auto_115833 ) ) ( not ( = ?auto_115830 ?auto_115832 ) ) ( not ( = ?auto_115831 ?auto_115833 ) ) ( not ( = ?auto_115832 ?auto_115836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115827 ?auto_115828 ?auto_115830 ?auto_115831 )
      ( GET-4IMAGE-VERIFY ?auto_115827 ?auto_115828 ?auto_115829 ?auto_115826 ?auto_115830 ?auto_115831 ?auto_115832 ?auto_115833 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115849 - DIRECTION
      ?auto_115850 - MODE
      ?auto_115851 - DIRECTION
      ?auto_115848 - MODE
      ?auto_115852 - DIRECTION
      ?auto_115853 - MODE
      ?auto_115854 - DIRECTION
      ?auto_115855 - MODE
    )
    :vars
    (
      ?auto_115857 - INSTRUMENT
      ?auto_115856 - SATELLITE
      ?auto_115858 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115857 ) ( ON_BOARD ?auto_115857 ?auto_115856 ) ( SUPPORTS ?auto_115857 ?auto_115848 ) ( POWER_ON ?auto_115857 ) ( POINTING ?auto_115856 ?auto_115858 ) ( not ( = ?auto_115851 ?auto_115858 ) ) ( HAVE_IMAGE ?auto_115849 ?auto_115855 ) ( not ( = ?auto_115849 ?auto_115851 ) ) ( not ( = ?auto_115849 ?auto_115858 ) ) ( not ( = ?auto_115855 ?auto_115848 ) ) ( HAVE_IMAGE ?auto_115849 ?auto_115850 ) ( HAVE_IMAGE ?auto_115852 ?auto_115853 ) ( HAVE_IMAGE ?auto_115854 ?auto_115855 ) ( not ( = ?auto_115849 ?auto_115852 ) ) ( not ( = ?auto_115849 ?auto_115854 ) ) ( not ( = ?auto_115850 ?auto_115848 ) ) ( not ( = ?auto_115850 ?auto_115853 ) ) ( not ( = ?auto_115850 ?auto_115855 ) ) ( not ( = ?auto_115851 ?auto_115852 ) ) ( not ( = ?auto_115851 ?auto_115854 ) ) ( not ( = ?auto_115848 ?auto_115853 ) ) ( not ( = ?auto_115852 ?auto_115854 ) ) ( not ( = ?auto_115852 ?auto_115858 ) ) ( not ( = ?auto_115853 ?auto_115855 ) ) ( not ( = ?auto_115854 ?auto_115858 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115849 ?auto_115855 ?auto_115851 ?auto_115848 )
      ( GET-4IMAGE-VERIFY ?auto_115849 ?auto_115850 ?auto_115851 ?auto_115848 ?auto_115852 ?auto_115853 ?auto_115854 ?auto_115855 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115860 - DIRECTION
      ?auto_115861 - MODE
      ?auto_115862 - DIRECTION
      ?auto_115859 - MODE
      ?auto_115863 - DIRECTION
      ?auto_115864 - MODE
      ?auto_115865 - DIRECTION
      ?auto_115866 - MODE
    )
    :vars
    (
      ?auto_115868 - INSTRUMENT
      ?auto_115867 - SATELLITE
      ?auto_115869 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115868 ) ( ON_BOARD ?auto_115868 ?auto_115867 ) ( SUPPORTS ?auto_115868 ?auto_115859 ) ( POWER_ON ?auto_115868 ) ( POINTING ?auto_115867 ?auto_115869 ) ( not ( = ?auto_115862 ?auto_115869 ) ) ( HAVE_IMAGE ?auto_115863 ?auto_115864 ) ( not ( = ?auto_115863 ?auto_115862 ) ) ( not ( = ?auto_115863 ?auto_115869 ) ) ( not ( = ?auto_115864 ?auto_115859 ) ) ( HAVE_IMAGE ?auto_115860 ?auto_115861 ) ( HAVE_IMAGE ?auto_115865 ?auto_115866 ) ( not ( = ?auto_115860 ?auto_115862 ) ) ( not ( = ?auto_115860 ?auto_115863 ) ) ( not ( = ?auto_115860 ?auto_115865 ) ) ( not ( = ?auto_115860 ?auto_115869 ) ) ( not ( = ?auto_115861 ?auto_115859 ) ) ( not ( = ?auto_115861 ?auto_115864 ) ) ( not ( = ?auto_115861 ?auto_115866 ) ) ( not ( = ?auto_115862 ?auto_115865 ) ) ( not ( = ?auto_115859 ?auto_115866 ) ) ( not ( = ?auto_115863 ?auto_115865 ) ) ( not ( = ?auto_115864 ?auto_115866 ) ) ( not ( = ?auto_115865 ?auto_115869 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115863 ?auto_115864 ?auto_115862 ?auto_115859 )
      ( GET-4IMAGE-VERIFY ?auto_115860 ?auto_115861 ?auto_115862 ?auto_115859 ?auto_115863 ?auto_115864 ?auto_115865 ?auto_115866 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115882 - DIRECTION
      ?auto_115883 - MODE
      ?auto_115884 - DIRECTION
      ?auto_115881 - MODE
      ?auto_115885 - DIRECTION
      ?auto_115886 - MODE
      ?auto_115887 - DIRECTION
      ?auto_115888 - MODE
    )
    :vars
    (
      ?auto_115890 - INSTRUMENT
      ?auto_115889 - SATELLITE
      ?auto_115891 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115890 ) ( ON_BOARD ?auto_115890 ?auto_115889 ) ( SUPPORTS ?auto_115890 ?auto_115881 ) ( POWER_ON ?auto_115890 ) ( POINTING ?auto_115889 ?auto_115891 ) ( not ( = ?auto_115884 ?auto_115891 ) ) ( HAVE_IMAGE ?auto_115882 ?auto_115883 ) ( not ( = ?auto_115882 ?auto_115884 ) ) ( not ( = ?auto_115882 ?auto_115891 ) ) ( not ( = ?auto_115883 ?auto_115881 ) ) ( HAVE_IMAGE ?auto_115885 ?auto_115886 ) ( HAVE_IMAGE ?auto_115887 ?auto_115888 ) ( not ( = ?auto_115882 ?auto_115885 ) ) ( not ( = ?auto_115882 ?auto_115887 ) ) ( not ( = ?auto_115883 ?auto_115886 ) ) ( not ( = ?auto_115883 ?auto_115888 ) ) ( not ( = ?auto_115884 ?auto_115885 ) ) ( not ( = ?auto_115884 ?auto_115887 ) ) ( not ( = ?auto_115881 ?auto_115886 ) ) ( not ( = ?auto_115881 ?auto_115888 ) ) ( not ( = ?auto_115885 ?auto_115887 ) ) ( not ( = ?auto_115885 ?auto_115891 ) ) ( not ( = ?auto_115886 ?auto_115888 ) ) ( not ( = ?auto_115887 ?auto_115891 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115882 ?auto_115883 ?auto_115884 ?auto_115881 )
      ( GET-4IMAGE-VERIFY ?auto_115882 ?auto_115883 ?auto_115884 ?auto_115881 ?auto_115885 ?auto_115886 ?auto_115887 ?auto_115888 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115948 - DIRECTION
      ?auto_115949 - MODE
      ?auto_115950 - DIRECTION
      ?auto_115947 - MODE
      ?auto_115951 - DIRECTION
      ?auto_115952 - MODE
      ?auto_115953 - DIRECTION
      ?auto_115954 - MODE
    )
    :vars
    (
      ?auto_115956 - INSTRUMENT
      ?auto_115955 - SATELLITE
      ?auto_115957 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115956 ) ( ON_BOARD ?auto_115956 ?auto_115955 ) ( SUPPORTS ?auto_115956 ?auto_115954 ) ( POWER_ON ?auto_115956 ) ( POINTING ?auto_115955 ?auto_115957 ) ( not ( = ?auto_115953 ?auto_115957 ) ) ( HAVE_IMAGE ?auto_115951 ?auto_115947 ) ( not ( = ?auto_115951 ?auto_115953 ) ) ( not ( = ?auto_115951 ?auto_115957 ) ) ( not ( = ?auto_115947 ?auto_115954 ) ) ( HAVE_IMAGE ?auto_115948 ?auto_115949 ) ( HAVE_IMAGE ?auto_115950 ?auto_115947 ) ( HAVE_IMAGE ?auto_115951 ?auto_115952 ) ( not ( = ?auto_115948 ?auto_115950 ) ) ( not ( = ?auto_115948 ?auto_115951 ) ) ( not ( = ?auto_115948 ?auto_115953 ) ) ( not ( = ?auto_115948 ?auto_115957 ) ) ( not ( = ?auto_115949 ?auto_115947 ) ) ( not ( = ?auto_115949 ?auto_115952 ) ) ( not ( = ?auto_115949 ?auto_115954 ) ) ( not ( = ?auto_115950 ?auto_115951 ) ) ( not ( = ?auto_115950 ?auto_115953 ) ) ( not ( = ?auto_115950 ?auto_115957 ) ) ( not ( = ?auto_115947 ?auto_115952 ) ) ( not ( = ?auto_115952 ?auto_115954 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115951 ?auto_115947 ?auto_115953 ?auto_115954 )
      ( GET-4IMAGE-VERIFY ?auto_115948 ?auto_115949 ?auto_115950 ?auto_115947 ?auto_115951 ?auto_115952 ?auto_115953 ?auto_115954 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115959 - DIRECTION
      ?auto_115960 - MODE
      ?auto_115961 - DIRECTION
      ?auto_115958 - MODE
      ?auto_115962 - DIRECTION
      ?auto_115963 - MODE
      ?auto_115964 - DIRECTION
      ?auto_115965 - MODE
    )
    :vars
    (
      ?auto_115967 - INSTRUMENT
      ?auto_115966 - SATELLITE
      ?auto_115968 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115967 ) ( ON_BOARD ?auto_115967 ?auto_115966 ) ( SUPPORTS ?auto_115967 ?auto_115965 ) ( POWER_ON ?auto_115967 ) ( POINTING ?auto_115966 ?auto_115968 ) ( not ( = ?auto_115964 ?auto_115968 ) ) ( HAVE_IMAGE ?auto_115961 ?auto_115958 ) ( not ( = ?auto_115961 ?auto_115964 ) ) ( not ( = ?auto_115961 ?auto_115968 ) ) ( not ( = ?auto_115958 ?auto_115965 ) ) ( HAVE_IMAGE ?auto_115959 ?auto_115960 ) ( HAVE_IMAGE ?auto_115962 ?auto_115963 ) ( not ( = ?auto_115959 ?auto_115961 ) ) ( not ( = ?auto_115959 ?auto_115962 ) ) ( not ( = ?auto_115959 ?auto_115964 ) ) ( not ( = ?auto_115959 ?auto_115968 ) ) ( not ( = ?auto_115960 ?auto_115958 ) ) ( not ( = ?auto_115960 ?auto_115963 ) ) ( not ( = ?auto_115960 ?auto_115965 ) ) ( not ( = ?auto_115961 ?auto_115962 ) ) ( not ( = ?auto_115958 ?auto_115963 ) ) ( not ( = ?auto_115962 ?auto_115964 ) ) ( not ( = ?auto_115962 ?auto_115968 ) ) ( not ( = ?auto_115963 ?auto_115965 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115961 ?auto_115958 ?auto_115964 ?auto_115965 )
      ( GET-4IMAGE-VERIFY ?auto_115959 ?auto_115960 ?auto_115961 ?auto_115958 ?auto_115962 ?auto_115963 ?auto_115964 ?auto_115965 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115970 - DIRECTION
      ?auto_115971 - MODE
      ?auto_115972 - DIRECTION
      ?auto_115969 - MODE
      ?auto_115973 - DIRECTION
      ?auto_115974 - MODE
      ?auto_115975 - DIRECTION
      ?auto_115976 - MODE
    )
    :vars
    (
      ?auto_115978 - INSTRUMENT
      ?auto_115977 - SATELLITE
      ?auto_115979 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115978 ) ( ON_BOARD ?auto_115978 ?auto_115977 ) ( SUPPORTS ?auto_115978 ?auto_115974 ) ( POWER_ON ?auto_115978 ) ( POINTING ?auto_115977 ?auto_115979 ) ( not ( = ?auto_115973 ?auto_115979 ) ) ( HAVE_IMAGE ?auto_115975 ?auto_115976 ) ( not ( = ?auto_115975 ?auto_115973 ) ) ( not ( = ?auto_115975 ?auto_115979 ) ) ( not ( = ?auto_115976 ?auto_115974 ) ) ( HAVE_IMAGE ?auto_115970 ?auto_115971 ) ( HAVE_IMAGE ?auto_115972 ?auto_115969 ) ( not ( = ?auto_115970 ?auto_115972 ) ) ( not ( = ?auto_115970 ?auto_115973 ) ) ( not ( = ?auto_115970 ?auto_115975 ) ) ( not ( = ?auto_115970 ?auto_115979 ) ) ( not ( = ?auto_115971 ?auto_115969 ) ) ( not ( = ?auto_115971 ?auto_115974 ) ) ( not ( = ?auto_115971 ?auto_115976 ) ) ( not ( = ?auto_115972 ?auto_115973 ) ) ( not ( = ?auto_115972 ?auto_115975 ) ) ( not ( = ?auto_115972 ?auto_115979 ) ) ( not ( = ?auto_115969 ?auto_115974 ) ) ( not ( = ?auto_115969 ?auto_115976 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115975 ?auto_115976 ?auto_115973 ?auto_115974 )
      ( GET-4IMAGE-VERIFY ?auto_115970 ?auto_115971 ?auto_115972 ?auto_115969 ?auto_115973 ?auto_115974 ?auto_115975 ?auto_115976 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_115981 - DIRECTION
      ?auto_115982 - MODE
      ?auto_115983 - DIRECTION
      ?auto_115980 - MODE
      ?auto_115984 - DIRECTION
      ?auto_115985 - MODE
      ?auto_115986 - DIRECTION
      ?auto_115987 - MODE
    )
    :vars
    (
      ?auto_115989 - INSTRUMENT
      ?auto_115988 - SATELLITE
      ?auto_115990 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_115989 ) ( ON_BOARD ?auto_115989 ?auto_115988 ) ( SUPPORTS ?auto_115989 ?auto_115985 ) ( POWER_ON ?auto_115989 ) ( POINTING ?auto_115988 ?auto_115990 ) ( not ( = ?auto_115984 ?auto_115990 ) ) ( HAVE_IMAGE ?auto_115983 ?auto_115980 ) ( not ( = ?auto_115983 ?auto_115984 ) ) ( not ( = ?auto_115983 ?auto_115990 ) ) ( not ( = ?auto_115980 ?auto_115985 ) ) ( HAVE_IMAGE ?auto_115981 ?auto_115982 ) ( HAVE_IMAGE ?auto_115986 ?auto_115987 ) ( not ( = ?auto_115981 ?auto_115983 ) ) ( not ( = ?auto_115981 ?auto_115984 ) ) ( not ( = ?auto_115981 ?auto_115986 ) ) ( not ( = ?auto_115981 ?auto_115990 ) ) ( not ( = ?auto_115982 ?auto_115980 ) ) ( not ( = ?auto_115982 ?auto_115985 ) ) ( not ( = ?auto_115982 ?auto_115987 ) ) ( not ( = ?auto_115983 ?auto_115986 ) ) ( not ( = ?auto_115980 ?auto_115987 ) ) ( not ( = ?auto_115984 ?auto_115986 ) ) ( not ( = ?auto_115985 ?auto_115987 ) ) ( not ( = ?auto_115986 ?auto_115990 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_115983 ?auto_115980 ?auto_115984 ?auto_115985 )
      ( GET-4IMAGE-VERIFY ?auto_115981 ?auto_115982 ?auto_115983 ?auto_115980 ?auto_115984 ?auto_115985 ?auto_115986 ?auto_115987 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116014 - DIRECTION
      ?auto_116015 - MODE
      ?auto_116016 - DIRECTION
      ?auto_116013 - MODE
      ?auto_116017 - DIRECTION
      ?auto_116018 - MODE
      ?auto_116019 - DIRECTION
      ?auto_116020 - MODE
    )
    :vars
    (
      ?auto_116022 - INSTRUMENT
      ?auto_116021 - SATELLITE
      ?auto_116023 - DIRECTION
      ?auto_116024 - DIRECTION
      ?auto_116025 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_116022 ) ( ON_BOARD ?auto_116022 ?auto_116021 ) ( SUPPORTS ?auto_116022 ?auto_116020 ) ( POWER_ON ?auto_116022 ) ( POINTING ?auto_116021 ?auto_116023 ) ( not ( = ?auto_116019 ?auto_116023 ) ) ( HAVE_IMAGE ?auto_116024 ?auto_116025 ) ( not ( = ?auto_116024 ?auto_116019 ) ) ( not ( = ?auto_116024 ?auto_116023 ) ) ( not ( = ?auto_116025 ?auto_116020 ) ) ( HAVE_IMAGE ?auto_116014 ?auto_116015 ) ( HAVE_IMAGE ?auto_116016 ?auto_116013 ) ( HAVE_IMAGE ?auto_116017 ?auto_116018 ) ( not ( = ?auto_116014 ?auto_116016 ) ) ( not ( = ?auto_116014 ?auto_116017 ) ) ( not ( = ?auto_116014 ?auto_116019 ) ) ( not ( = ?auto_116014 ?auto_116023 ) ) ( not ( = ?auto_116014 ?auto_116024 ) ) ( not ( = ?auto_116015 ?auto_116013 ) ) ( not ( = ?auto_116015 ?auto_116018 ) ) ( not ( = ?auto_116015 ?auto_116020 ) ) ( not ( = ?auto_116015 ?auto_116025 ) ) ( not ( = ?auto_116016 ?auto_116017 ) ) ( not ( = ?auto_116016 ?auto_116019 ) ) ( not ( = ?auto_116016 ?auto_116023 ) ) ( not ( = ?auto_116016 ?auto_116024 ) ) ( not ( = ?auto_116013 ?auto_116018 ) ) ( not ( = ?auto_116013 ?auto_116020 ) ) ( not ( = ?auto_116013 ?auto_116025 ) ) ( not ( = ?auto_116017 ?auto_116019 ) ) ( not ( = ?auto_116017 ?auto_116023 ) ) ( not ( = ?auto_116017 ?auto_116024 ) ) ( not ( = ?auto_116018 ?auto_116020 ) ) ( not ( = ?auto_116018 ?auto_116025 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116024 ?auto_116025 ?auto_116019 ?auto_116020 )
      ( GET-4IMAGE-VERIFY ?auto_116014 ?auto_116015 ?auto_116016 ?auto_116013 ?auto_116017 ?auto_116018 ?auto_116019 ?auto_116020 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116038 - DIRECTION
      ?auto_116039 - MODE
      ?auto_116040 - DIRECTION
      ?auto_116037 - MODE
      ?auto_116041 - DIRECTION
      ?auto_116042 - MODE
      ?auto_116043 - DIRECTION
      ?auto_116044 - MODE
    )
    :vars
    (
      ?auto_116046 - INSTRUMENT
      ?auto_116045 - SATELLITE
      ?auto_116047 - DIRECTION
      ?auto_116048 - DIRECTION
      ?auto_116049 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_116046 ) ( ON_BOARD ?auto_116046 ?auto_116045 ) ( SUPPORTS ?auto_116046 ?auto_116042 ) ( POWER_ON ?auto_116046 ) ( POINTING ?auto_116045 ?auto_116047 ) ( not ( = ?auto_116041 ?auto_116047 ) ) ( HAVE_IMAGE ?auto_116048 ?auto_116049 ) ( not ( = ?auto_116048 ?auto_116041 ) ) ( not ( = ?auto_116048 ?auto_116047 ) ) ( not ( = ?auto_116049 ?auto_116042 ) ) ( HAVE_IMAGE ?auto_116038 ?auto_116039 ) ( HAVE_IMAGE ?auto_116040 ?auto_116037 ) ( HAVE_IMAGE ?auto_116043 ?auto_116044 ) ( not ( = ?auto_116038 ?auto_116040 ) ) ( not ( = ?auto_116038 ?auto_116041 ) ) ( not ( = ?auto_116038 ?auto_116043 ) ) ( not ( = ?auto_116038 ?auto_116047 ) ) ( not ( = ?auto_116038 ?auto_116048 ) ) ( not ( = ?auto_116039 ?auto_116037 ) ) ( not ( = ?auto_116039 ?auto_116042 ) ) ( not ( = ?auto_116039 ?auto_116044 ) ) ( not ( = ?auto_116039 ?auto_116049 ) ) ( not ( = ?auto_116040 ?auto_116041 ) ) ( not ( = ?auto_116040 ?auto_116043 ) ) ( not ( = ?auto_116040 ?auto_116047 ) ) ( not ( = ?auto_116040 ?auto_116048 ) ) ( not ( = ?auto_116037 ?auto_116042 ) ) ( not ( = ?auto_116037 ?auto_116044 ) ) ( not ( = ?auto_116037 ?auto_116049 ) ) ( not ( = ?auto_116041 ?auto_116043 ) ) ( not ( = ?auto_116042 ?auto_116044 ) ) ( not ( = ?auto_116043 ?auto_116047 ) ) ( not ( = ?auto_116043 ?auto_116048 ) ) ( not ( = ?auto_116044 ?auto_116049 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116048 ?auto_116049 ?auto_116041 ?auto_116042 )
      ( GET-4IMAGE-VERIFY ?auto_116038 ?auto_116039 ?auto_116040 ?auto_116037 ?auto_116041 ?auto_116042 ?auto_116043 ?auto_116044 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116064 - DIRECTION
      ?auto_116065 - MODE
      ?auto_116066 - DIRECTION
      ?auto_116063 - MODE
      ?auto_116067 - DIRECTION
      ?auto_116068 - MODE
      ?auto_116069 - DIRECTION
      ?auto_116070 - MODE
    )
    :vars
    (
      ?auto_116072 - INSTRUMENT
      ?auto_116071 - SATELLITE
      ?auto_116073 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_116072 ) ( ON_BOARD ?auto_116072 ?auto_116071 ) ( SUPPORTS ?auto_116072 ?auto_116063 ) ( POWER_ON ?auto_116072 ) ( POINTING ?auto_116071 ?auto_116073 ) ( not ( = ?auto_116066 ?auto_116073 ) ) ( HAVE_IMAGE ?auto_116069 ?auto_116068 ) ( not ( = ?auto_116069 ?auto_116066 ) ) ( not ( = ?auto_116069 ?auto_116073 ) ) ( not ( = ?auto_116068 ?auto_116063 ) ) ( HAVE_IMAGE ?auto_116064 ?auto_116065 ) ( HAVE_IMAGE ?auto_116067 ?auto_116068 ) ( HAVE_IMAGE ?auto_116069 ?auto_116070 ) ( not ( = ?auto_116064 ?auto_116066 ) ) ( not ( = ?auto_116064 ?auto_116067 ) ) ( not ( = ?auto_116064 ?auto_116069 ) ) ( not ( = ?auto_116064 ?auto_116073 ) ) ( not ( = ?auto_116065 ?auto_116063 ) ) ( not ( = ?auto_116065 ?auto_116068 ) ) ( not ( = ?auto_116065 ?auto_116070 ) ) ( not ( = ?auto_116066 ?auto_116067 ) ) ( not ( = ?auto_116063 ?auto_116070 ) ) ( not ( = ?auto_116067 ?auto_116069 ) ) ( not ( = ?auto_116067 ?auto_116073 ) ) ( not ( = ?auto_116068 ?auto_116070 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116069 ?auto_116068 ?auto_116066 ?auto_116063 )
      ( GET-4IMAGE-VERIFY ?auto_116064 ?auto_116065 ?auto_116066 ?auto_116063 ?auto_116067 ?auto_116068 ?auto_116069 ?auto_116070 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116097 - DIRECTION
      ?auto_116098 - MODE
      ?auto_116099 - DIRECTION
      ?auto_116096 - MODE
      ?auto_116100 - DIRECTION
      ?auto_116101 - MODE
      ?auto_116102 - DIRECTION
      ?auto_116103 - MODE
    )
    :vars
    (
      ?auto_116105 - INSTRUMENT
      ?auto_116104 - SATELLITE
      ?auto_116106 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_116105 ) ( ON_BOARD ?auto_116105 ?auto_116104 ) ( SUPPORTS ?auto_116105 ?auto_116096 ) ( POWER_ON ?auto_116105 ) ( POINTING ?auto_116104 ?auto_116106 ) ( not ( = ?auto_116099 ?auto_116106 ) ) ( HAVE_IMAGE ?auto_116102 ?auto_116103 ) ( not ( = ?auto_116102 ?auto_116099 ) ) ( not ( = ?auto_116102 ?auto_116106 ) ) ( not ( = ?auto_116103 ?auto_116096 ) ) ( HAVE_IMAGE ?auto_116097 ?auto_116098 ) ( HAVE_IMAGE ?auto_116100 ?auto_116101 ) ( not ( = ?auto_116097 ?auto_116099 ) ) ( not ( = ?auto_116097 ?auto_116100 ) ) ( not ( = ?auto_116097 ?auto_116102 ) ) ( not ( = ?auto_116097 ?auto_116106 ) ) ( not ( = ?auto_116098 ?auto_116096 ) ) ( not ( = ?auto_116098 ?auto_116101 ) ) ( not ( = ?auto_116098 ?auto_116103 ) ) ( not ( = ?auto_116099 ?auto_116100 ) ) ( not ( = ?auto_116096 ?auto_116101 ) ) ( not ( = ?auto_116100 ?auto_116102 ) ) ( not ( = ?auto_116100 ?auto_116106 ) ) ( not ( = ?auto_116101 ?auto_116103 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116102 ?auto_116103 ?auto_116099 ?auto_116096 )
      ( GET-4IMAGE-VERIFY ?auto_116097 ?auto_116098 ?auto_116099 ?auto_116096 ?auto_116100 ?auto_116101 ?auto_116102 ?auto_116103 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116108 - DIRECTION
      ?auto_116109 - MODE
      ?auto_116110 - DIRECTION
      ?auto_116107 - MODE
      ?auto_116111 - DIRECTION
      ?auto_116112 - MODE
      ?auto_116113 - DIRECTION
      ?auto_116114 - MODE
    )
    :vars
    (
      ?auto_116116 - INSTRUMENT
      ?auto_116115 - SATELLITE
      ?auto_116117 - DIRECTION
      ?auto_116118 - DIRECTION
      ?auto_116119 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_116116 ) ( ON_BOARD ?auto_116116 ?auto_116115 ) ( SUPPORTS ?auto_116116 ?auto_116107 ) ( POWER_ON ?auto_116116 ) ( POINTING ?auto_116115 ?auto_116117 ) ( not ( = ?auto_116110 ?auto_116117 ) ) ( HAVE_IMAGE ?auto_116118 ?auto_116119 ) ( not ( = ?auto_116118 ?auto_116110 ) ) ( not ( = ?auto_116118 ?auto_116117 ) ) ( not ( = ?auto_116119 ?auto_116107 ) ) ( HAVE_IMAGE ?auto_116108 ?auto_116109 ) ( HAVE_IMAGE ?auto_116111 ?auto_116112 ) ( HAVE_IMAGE ?auto_116113 ?auto_116114 ) ( not ( = ?auto_116108 ?auto_116110 ) ) ( not ( = ?auto_116108 ?auto_116111 ) ) ( not ( = ?auto_116108 ?auto_116113 ) ) ( not ( = ?auto_116108 ?auto_116117 ) ) ( not ( = ?auto_116108 ?auto_116118 ) ) ( not ( = ?auto_116109 ?auto_116107 ) ) ( not ( = ?auto_116109 ?auto_116112 ) ) ( not ( = ?auto_116109 ?auto_116114 ) ) ( not ( = ?auto_116109 ?auto_116119 ) ) ( not ( = ?auto_116110 ?auto_116111 ) ) ( not ( = ?auto_116110 ?auto_116113 ) ) ( not ( = ?auto_116107 ?auto_116112 ) ) ( not ( = ?auto_116107 ?auto_116114 ) ) ( not ( = ?auto_116111 ?auto_116113 ) ) ( not ( = ?auto_116111 ?auto_116117 ) ) ( not ( = ?auto_116111 ?auto_116118 ) ) ( not ( = ?auto_116112 ?auto_116114 ) ) ( not ( = ?auto_116112 ?auto_116119 ) ) ( not ( = ?auto_116113 ?auto_116117 ) ) ( not ( = ?auto_116113 ?auto_116118 ) ) ( not ( = ?auto_116114 ?auto_116119 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116118 ?auto_116119 ?auto_116110 ?auto_116107 )
      ( GET-4IMAGE-VERIFY ?auto_116108 ?auto_116109 ?auto_116110 ?auto_116107 ?auto_116111 ?auto_116112 ?auto_116113 ?auto_116114 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116171 - DIRECTION
      ?auto_116172 - MODE
      ?auto_116173 - DIRECTION
      ?auto_116170 - MODE
      ?auto_116174 - DIRECTION
      ?auto_116175 - MODE
      ?auto_116176 - DIRECTION
      ?auto_116177 - MODE
    )
    :vars
    (
      ?auto_116179 - INSTRUMENT
      ?auto_116178 - SATELLITE
      ?auto_116180 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_116179 ) ( ON_BOARD ?auto_116179 ?auto_116178 ) ( SUPPORTS ?auto_116179 ?auto_116172 ) ( POWER_ON ?auto_116179 ) ( POINTING ?auto_116178 ?auto_116180 ) ( not ( = ?auto_116171 ?auto_116180 ) ) ( HAVE_IMAGE ?auto_116174 ?auto_116170 ) ( not ( = ?auto_116174 ?auto_116171 ) ) ( not ( = ?auto_116174 ?auto_116180 ) ) ( not ( = ?auto_116170 ?auto_116172 ) ) ( HAVE_IMAGE ?auto_116173 ?auto_116170 ) ( HAVE_IMAGE ?auto_116174 ?auto_116175 ) ( HAVE_IMAGE ?auto_116176 ?auto_116177 ) ( not ( = ?auto_116171 ?auto_116173 ) ) ( not ( = ?auto_116171 ?auto_116176 ) ) ( not ( = ?auto_116172 ?auto_116175 ) ) ( not ( = ?auto_116172 ?auto_116177 ) ) ( not ( = ?auto_116173 ?auto_116174 ) ) ( not ( = ?auto_116173 ?auto_116176 ) ) ( not ( = ?auto_116173 ?auto_116180 ) ) ( not ( = ?auto_116170 ?auto_116175 ) ) ( not ( = ?auto_116170 ?auto_116177 ) ) ( not ( = ?auto_116174 ?auto_116176 ) ) ( not ( = ?auto_116175 ?auto_116177 ) ) ( not ( = ?auto_116176 ?auto_116180 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116174 ?auto_116170 ?auto_116171 ?auto_116172 )
      ( GET-4IMAGE-VERIFY ?auto_116171 ?auto_116172 ?auto_116173 ?auto_116170 ?auto_116174 ?auto_116175 ?auto_116176 ?auto_116177 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116182 - DIRECTION
      ?auto_116183 - MODE
      ?auto_116184 - DIRECTION
      ?auto_116181 - MODE
      ?auto_116185 - DIRECTION
      ?auto_116186 - MODE
      ?auto_116187 - DIRECTION
      ?auto_116188 - MODE
    )
    :vars
    (
      ?auto_116190 - INSTRUMENT
      ?auto_116189 - SATELLITE
      ?auto_116191 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_116190 ) ( ON_BOARD ?auto_116190 ?auto_116189 ) ( SUPPORTS ?auto_116190 ?auto_116183 ) ( POWER_ON ?auto_116190 ) ( POINTING ?auto_116189 ?auto_116191 ) ( not ( = ?auto_116182 ?auto_116191 ) ) ( HAVE_IMAGE ?auto_116185 ?auto_116186 ) ( not ( = ?auto_116185 ?auto_116182 ) ) ( not ( = ?auto_116185 ?auto_116191 ) ) ( not ( = ?auto_116186 ?auto_116183 ) ) ( HAVE_IMAGE ?auto_116184 ?auto_116181 ) ( HAVE_IMAGE ?auto_116187 ?auto_116188 ) ( not ( = ?auto_116182 ?auto_116184 ) ) ( not ( = ?auto_116182 ?auto_116187 ) ) ( not ( = ?auto_116183 ?auto_116181 ) ) ( not ( = ?auto_116183 ?auto_116188 ) ) ( not ( = ?auto_116184 ?auto_116185 ) ) ( not ( = ?auto_116184 ?auto_116187 ) ) ( not ( = ?auto_116184 ?auto_116191 ) ) ( not ( = ?auto_116181 ?auto_116186 ) ) ( not ( = ?auto_116181 ?auto_116188 ) ) ( not ( = ?auto_116185 ?auto_116187 ) ) ( not ( = ?auto_116186 ?auto_116188 ) ) ( not ( = ?auto_116187 ?auto_116191 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116185 ?auto_116186 ?auto_116182 ?auto_116183 )
      ( GET-4IMAGE-VERIFY ?auto_116182 ?auto_116183 ?auto_116184 ?auto_116181 ?auto_116185 ?auto_116186 ?auto_116187 ?auto_116188 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116303 - DIRECTION
      ?auto_116304 - MODE
      ?auto_116305 - DIRECTION
      ?auto_116302 - MODE
      ?auto_116306 - DIRECTION
      ?auto_116307 - MODE
      ?auto_116308 - DIRECTION
      ?auto_116309 - MODE
    )
    :vars
    (
      ?auto_116311 - INSTRUMENT
      ?auto_116310 - SATELLITE
      ?auto_116312 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_116311 ) ( ON_BOARD ?auto_116311 ?auto_116310 ) ( SUPPORTS ?auto_116311 ?auto_116304 ) ( POWER_ON ?auto_116311 ) ( POINTING ?auto_116310 ?auto_116312 ) ( not ( = ?auto_116303 ?auto_116312 ) ) ( HAVE_IMAGE ?auto_116308 ?auto_116309 ) ( not ( = ?auto_116308 ?auto_116303 ) ) ( not ( = ?auto_116308 ?auto_116312 ) ) ( not ( = ?auto_116309 ?auto_116304 ) ) ( HAVE_IMAGE ?auto_116305 ?auto_116302 ) ( HAVE_IMAGE ?auto_116306 ?auto_116307 ) ( not ( = ?auto_116303 ?auto_116305 ) ) ( not ( = ?auto_116303 ?auto_116306 ) ) ( not ( = ?auto_116304 ?auto_116302 ) ) ( not ( = ?auto_116304 ?auto_116307 ) ) ( not ( = ?auto_116305 ?auto_116306 ) ) ( not ( = ?auto_116305 ?auto_116308 ) ) ( not ( = ?auto_116305 ?auto_116312 ) ) ( not ( = ?auto_116302 ?auto_116307 ) ) ( not ( = ?auto_116302 ?auto_116309 ) ) ( not ( = ?auto_116306 ?auto_116308 ) ) ( not ( = ?auto_116306 ?auto_116312 ) ) ( not ( = ?auto_116307 ?auto_116309 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116308 ?auto_116309 ?auto_116303 ?auto_116304 )
      ( GET-4IMAGE-VERIFY ?auto_116303 ?auto_116304 ?auto_116305 ?auto_116302 ?auto_116306 ?auto_116307 ?auto_116308 ?auto_116309 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116314 - DIRECTION
      ?auto_116315 - MODE
      ?auto_116316 - DIRECTION
      ?auto_116313 - MODE
      ?auto_116317 - DIRECTION
      ?auto_116318 - MODE
      ?auto_116319 - DIRECTION
      ?auto_116320 - MODE
    )
    :vars
    (
      ?auto_116322 - INSTRUMENT
      ?auto_116321 - SATELLITE
      ?auto_116323 - DIRECTION
      ?auto_116324 - DIRECTION
      ?auto_116325 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_116322 ) ( ON_BOARD ?auto_116322 ?auto_116321 ) ( SUPPORTS ?auto_116322 ?auto_116315 ) ( POWER_ON ?auto_116322 ) ( POINTING ?auto_116321 ?auto_116323 ) ( not ( = ?auto_116314 ?auto_116323 ) ) ( HAVE_IMAGE ?auto_116324 ?auto_116325 ) ( not ( = ?auto_116324 ?auto_116314 ) ) ( not ( = ?auto_116324 ?auto_116323 ) ) ( not ( = ?auto_116325 ?auto_116315 ) ) ( HAVE_IMAGE ?auto_116316 ?auto_116313 ) ( HAVE_IMAGE ?auto_116317 ?auto_116318 ) ( HAVE_IMAGE ?auto_116319 ?auto_116320 ) ( not ( = ?auto_116314 ?auto_116316 ) ) ( not ( = ?auto_116314 ?auto_116317 ) ) ( not ( = ?auto_116314 ?auto_116319 ) ) ( not ( = ?auto_116315 ?auto_116313 ) ) ( not ( = ?auto_116315 ?auto_116318 ) ) ( not ( = ?auto_116315 ?auto_116320 ) ) ( not ( = ?auto_116316 ?auto_116317 ) ) ( not ( = ?auto_116316 ?auto_116319 ) ) ( not ( = ?auto_116316 ?auto_116323 ) ) ( not ( = ?auto_116316 ?auto_116324 ) ) ( not ( = ?auto_116313 ?auto_116318 ) ) ( not ( = ?auto_116313 ?auto_116320 ) ) ( not ( = ?auto_116313 ?auto_116325 ) ) ( not ( = ?auto_116317 ?auto_116319 ) ) ( not ( = ?auto_116317 ?auto_116323 ) ) ( not ( = ?auto_116317 ?auto_116324 ) ) ( not ( = ?auto_116318 ?auto_116320 ) ) ( not ( = ?auto_116318 ?auto_116325 ) ) ( not ( = ?auto_116319 ?auto_116323 ) ) ( not ( = ?auto_116319 ?auto_116324 ) ) ( not ( = ?auto_116320 ?auto_116325 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116324 ?auto_116325 ?auto_116314 ?auto_116315 )
      ( GET-4IMAGE-VERIFY ?auto_116314 ?auto_116315 ?auto_116316 ?auto_116313 ?auto_116317 ?auto_116318 ?auto_116319 ?auto_116320 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116522 - DIRECTION
      ?auto_116523 - MODE
      ?auto_116524 - DIRECTION
      ?auto_116521 - MODE
      ?auto_116525 - DIRECTION
      ?auto_116526 - MODE
    )
    :vars
    (
      ?auto_116529 - INSTRUMENT
      ?auto_116528 - SATELLITE
      ?auto_116527 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116529 ?auto_116528 ) ( SUPPORTS ?auto_116529 ?auto_116526 ) ( POWER_ON ?auto_116529 ) ( POINTING ?auto_116528 ?auto_116527 ) ( not ( = ?auto_116525 ?auto_116527 ) ) ( HAVE_IMAGE ?auto_116524 ?auto_116523 ) ( not ( = ?auto_116524 ?auto_116525 ) ) ( not ( = ?auto_116524 ?auto_116527 ) ) ( not ( = ?auto_116523 ?auto_116526 ) ) ( CALIBRATION_TARGET ?auto_116529 ?auto_116527 ) ( NOT_CALIBRATED ?auto_116529 ) ( HAVE_IMAGE ?auto_116522 ?auto_116523 ) ( HAVE_IMAGE ?auto_116524 ?auto_116521 ) ( not ( = ?auto_116522 ?auto_116524 ) ) ( not ( = ?auto_116522 ?auto_116525 ) ) ( not ( = ?auto_116522 ?auto_116527 ) ) ( not ( = ?auto_116523 ?auto_116521 ) ) ( not ( = ?auto_116521 ?auto_116526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116524 ?auto_116523 ?auto_116525 ?auto_116526 )
      ( GET-3IMAGE-VERIFY ?auto_116522 ?auto_116523 ?auto_116524 ?auto_116521 ?auto_116525 ?auto_116526 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116531 - DIRECTION
      ?auto_116532 - MODE
      ?auto_116533 - DIRECTION
      ?auto_116530 - MODE
      ?auto_116534 - DIRECTION
      ?auto_116535 - MODE
    )
    :vars
    (
      ?auto_116538 - INSTRUMENT
      ?auto_116537 - SATELLITE
      ?auto_116536 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116538 ?auto_116537 ) ( SUPPORTS ?auto_116538 ?auto_116535 ) ( POWER_ON ?auto_116538 ) ( POINTING ?auto_116537 ?auto_116536 ) ( not ( = ?auto_116534 ?auto_116536 ) ) ( HAVE_IMAGE ?auto_116531 ?auto_116532 ) ( not ( = ?auto_116531 ?auto_116534 ) ) ( not ( = ?auto_116531 ?auto_116536 ) ) ( not ( = ?auto_116532 ?auto_116535 ) ) ( CALIBRATION_TARGET ?auto_116538 ?auto_116536 ) ( NOT_CALIBRATED ?auto_116538 ) ( HAVE_IMAGE ?auto_116533 ?auto_116530 ) ( not ( = ?auto_116531 ?auto_116533 ) ) ( not ( = ?auto_116532 ?auto_116530 ) ) ( not ( = ?auto_116533 ?auto_116534 ) ) ( not ( = ?auto_116533 ?auto_116536 ) ) ( not ( = ?auto_116530 ?auto_116535 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116531 ?auto_116532 ?auto_116534 ?auto_116535 )
      ( GET-3IMAGE-VERIFY ?auto_116531 ?auto_116532 ?auto_116533 ?auto_116530 ?auto_116534 ?auto_116535 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116540 - DIRECTION
      ?auto_116541 - MODE
      ?auto_116542 - DIRECTION
      ?auto_116539 - MODE
      ?auto_116543 - DIRECTION
      ?auto_116544 - MODE
    )
    :vars
    (
      ?auto_116547 - INSTRUMENT
      ?auto_116546 - SATELLITE
      ?auto_116545 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116547 ?auto_116546 ) ( SUPPORTS ?auto_116547 ?auto_116539 ) ( POWER_ON ?auto_116547 ) ( POINTING ?auto_116546 ?auto_116545 ) ( not ( = ?auto_116542 ?auto_116545 ) ) ( HAVE_IMAGE ?auto_116543 ?auto_116544 ) ( not ( = ?auto_116543 ?auto_116542 ) ) ( not ( = ?auto_116543 ?auto_116545 ) ) ( not ( = ?auto_116544 ?auto_116539 ) ) ( CALIBRATION_TARGET ?auto_116547 ?auto_116545 ) ( NOT_CALIBRATED ?auto_116547 ) ( HAVE_IMAGE ?auto_116540 ?auto_116541 ) ( not ( = ?auto_116540 ?auto_116542 ) ) ( not ( = ?auto_116540 ?auto_116543 ) ) ( not ( = ?auto_116540 ?auto_116545 ) ) ( not ( = ?auto_116541 ?auto_116539 ) ) ( not ( = ?auto_116541 ?auto_116544 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116543 ?auto_116544 ?auto_116542 ?auto_116539 )
      ( GET-3IMAGE-VERIFY ?auto_116540 ?auto_116541 ?auto_116542 ?auto_116539 ?auto_116543 ?auto_116544 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116570 - DIRECTION
      ?auto_116571 - MODE
      ?auto_116572 - DIRECTION
      ?auto_116569 - MODE
      ?auto_116573 - DIRECTION
      ?auto_116574 - MODE
    )
    :vars
    (
      ?auto_116579 - INSTRUMENT
      ?auto_116578 - SATELLITE
      ?auto_116576 - DIRECTION
      ?auto_116577 - DIRECTION
      ?auto_116575 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_116579 ?auto_116578 ) ( SUPPORTS ?auto_116579 ?auto_116574 ) ( POWER_ON ?auto_116579 ) ( POINTING ?auto_116578 ?auto_116576 ) ( not ( = ?auto_116573 ?auto_116576 ) ) ( HAVE_IMAGE ?auto_116577 ?auto_116575 ) ( not ( = ?auto_116577 ?auto_116573 ) ) ( not ( = ?auto_116577 ?auto_116576 ) ) ( not ( = ?auto_116575 ?auto_116574 ) ) ( CALIBRATION_TARGET ?auto_116579 ?auto_116576 ) ( NOT_CALIBRATED ?auto_116579 ) ( HAVE_IMAGE ?auto_116570 ?auto_116571 ) ( HAVE_IMAGE ?auto_116572 ?auto_116569 ) ( not ( = ?auto_116570 ?auto_116572 ) ) ( not ( = ?auto_116570 ?auto_116573 ) ) ( not ( = ?auto_116570 ?auto_116576 ) ) ( not ( = ?auto_116570 ?auto_116577 ) ) ( not ( = ?auto_116571 ?auto_116569 ) ) ( not ( = ?auto_116571 ?auto_116574 ) ) ( not ( = ?auto_116571 ?auto_116575 ) ) ( not ( = ?auto_116572 ?auto_116573 ) ) ( not ( = ?auto_116572 ?auto_116576 ) ) ( not ( = ?auto_116572 ?auto_116577 ) ) ( not ( = ?auto_116569 ?auto_116574 ) ) ( not ( = ?auto_116569 ?auto_116575 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116577 ?auto_116575 ?auto_116573 ?auto_116574 )
      ( GET-3IMAGE-VERIFY ?auto_116570 ?auto_116571 ?auto_116572 ?auto_116569 ?auto_116573 ?auto_116574 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116587 - DIRECTION
      ?auto_116588 - MODE
      ?auto_116589 - DIRECTION
      ?auto_116586 - MODE
      ?auto_116590 - DIRECTION
      ?auto_116591 - MODE
    )
    :vars
    (
      ?auto_116596 - INSTRUMENT
      ?auto_116595 - SATELLITE
      ?auto_116593 - DIRECTION
      ?auto_116594 - DIRECTION
      ?auto_116592 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_116596 ?auto_116595 ) ( SUPPORTS ?auto_116596 ?auto_116586 ) ( POWER_ON ?auto_116596 ) ( POINTING ?auto_116595 ?auto_116593 ) ( not ( = ?auto_116589 ?auto_116593 ) ) ( HAVE_IMAGE ?auto_116594 ?auto_116592 ) ( not ( = ?auto_116594 ?auto_116589 ) ) ( not ( = ?auto_116594 ?auto_116593 ) ) ( not ( = ?auto_116592 ?auto_116586 ) ) ( CALIBRATION_TARGET ?auto_116596 ?auto_116593 ) ( NOT_CALIBRATED ?auto_116596 ) ( HAVE_IMAGE ?auto_116587 ?auto_116588 ) ( HAVE_IMAGE ?auto_116590 ?auto_116591 ) ( not ( = ?auto_116587 ?auto_116589 ) ) ( not ( = ?auto_116587 ?auto_116590 ) ) ( not ( = ?auto_116587 ?auto_116593 ) ) ( not ( = ?auto_116587 ?auto_116594 ) ) ( not ( = ?auto_116588 ?auto_116586 ) ) ( not ( = ?auto_116588 ?auto_116591 ) ) ( not ( = ?auto_116588 ?auto_116592 ) ) ( not ( = ?auto_116589 ?auto_116590 ) ) ( not ( = ?auto_116586 ?auto_116591 ) ) ( not ( = ?auto_116590 ?auto_116593 ) ) ( not ( = ?auto_116590 ?auto_116594 ) ) ( not ( = ?auto_116591 ?auto_116592 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116594 ?auto_116592 ?auto_116589 ?auto_116586 )
      ( GET-3IMAGE-VERIFY ?auto_116587 ?auto_116588 ?auto_116589 ?auto_116586 ?auto_116590 ?auto_116591 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116609 - DIRECTION
      ?auto_116610 - MODE
      ?auto_116611 - DIRECTION
      ?auto_116608 - MODE
      ?auto_116612 - DIRECTION
      ?auto_116613 - MODE
    )
    :vars
    (
      ?auto_116616 - INSTRUMENT
      ?auto_116615 - SATELLITE
      ?auto_116614 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116616 ?auto_116615 ) ( SUPPORTS ?auto_116616 ?auto_116610 ) ( POWER_ON ?auto_116616 ) ( POINTING ?auto_116615 ?auto_116614 ) ( not ( = ?auto_116609 ?auto_116614 ) ) ( HAVE_IMAGE ?auto_116611 ?auto_116613 ) ( not ( = ?auto_116611 ?auto_116609 ) ) ( not ( = ?auto_116611 ?auto_116614 ) ) ( not ( = ?auto_116613 ?auto_116610 ) ) ( CALIBRATION_TARGET ?auto_116616 ?auto_116614 ) ( NOT_CALIBRATED ?auto_116616 ) ( HAVE_IMAGE ?auto_116611 ?auto_116608 ) ( HAVE_IMAGE ?auto_116612 ?auto_116613 ) ( not ( = ?auto_116609 ?auto_116612 ) ) ( not ( = ?auto_116610 ?auto_116608 ) ) ( not ( = ?auto_116611 ?auto_116612 ) ) ( not ( = ?auto_116608 ?auto_116613 ) ) ( not ( = ?auto_116612 ?auto_116614 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116611 ?auto_116613 ?auto_116609 ?auto_116610 )
      ( GET-3IMAGE-VERIFY ?auto_116609 ?auto_116610 ?auto_116611 ?auto_116608 ?auto_116612 ?auto_116613 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_116642 - DIRECTION
      ?auto_116643 - MODE
      ?auto_116644 - DIRECTION
      ?auto_116641 - MODE
      ?auto_116645 - DIRECTION
      ?auto_116646 - MODE
    )
    :vars
    (
      ?auto_116651 - INSTRUMENT
      ?auto_116650 - SATELLITE
      ?auto_116648 - DIRECTION
      ?auto_116649 - DIRECTION
      ?auto_116647 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_116651 ?auto_116650 ) ( SUPPORTS ?auto_116651 ?auto_116643 ) ( POWER_ON ?auto_116651 ) ( POINTING ?auto_116650 ?auto_116648 ) ( not ( = ?auto_116642 ?auto_116648 ) ) ( HAVE_IMAGE ?auto_116649 ?auto_116647 ) ( not ( = ?auto_116649 ?auto_116642 ) ) ( not ( = ?auto_116649 ?auto_116648 ) ) ( not ( = ?auto_116647 ?auto_116643 ) ) ( CALIBRATION_TARGET ?auto_116651 ?auto_116648 ) ( NOT_CALIBRATED ?auto_116651 ) ( HAVE_IMAGE ?auto_116644 ?auto_116641 ) ( HAVE_IMAGE ?auto_116645 ?auto_116646 ) ( not ( = ?auto_116642 ?auto_116644 ) ) ( not ( = ?auto_116642 ?auto_116645 ) ) ( not ( = ?auto_116643 ?auto_116641 ) ) ( not ( = ?auto_116643 ?auto_116646 ) ) ( not ( = ?auto_116644 ?auto_116645 ) ) ( not ( = ?auto_116644 ?auto_116648 ) ) ( not ( = ?auto_116644 ?auto_116649 ) ) ( not ( = ?auto_116641 ?auto_116646 ) ) ( not ( = ?auto_116641 ?auto_116647 ) ) ( not ( = ?auto_116645 ?auto_116648 ) ) ( not ( = ?auto_116645 ?auto_116649 ) ) ( not ( = ?auto_116646 ?auto_116647 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116649 ?auto_116647 ?auto_116642 ?auto_116643 )
      ( GET-3IMAGE-VERIFY ?auto_116642 ?auto_116643 ?auto_116644 ?auto_116641 ?auto_116645 ?auto_116646 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116695 - DIRECTION
      ?auto_116696 - MODE
      ?auto_116697 - DIRECTION
      ?auto_116694 - MODE
      ?auto_116698 - DIRECTION
      ?auto_116699 - MODE
      ?auto_116700 - DIRECTION
      ?auto_116701 - MODE
    )
    :vars
    (
      ?auto_116704 - INSTRUMENT
      ?auto_116703 - SATELLITE
      ?auto_116702 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116704 ?auto_116703 ) ( SUPPORTS ?auto_116704 ?auto_116701 ) ( POWER_ON ?auto_116704 ) ( POINTING ?auto_116703 ?auto_116702 ) ( not ( = ?auto_116700 ?auto_116702 ) ) ( HAVE_IMAGE ?auto_116695 ?auto_116699 ) ( not ( = ?auto_116695 ?auto_116700 ) ) ( not ( = ?auto_116695 ?auto_116702 ) ) ( not ( = ?auto_116699 ?auto_116701 ) ) ( CALIBRATION_TARGET ?auto_116704 ?auto_116702 ) ( NOT_CALIBRATED ?auto_116704 ) ( HAVE_IMAGE ?auto_116695 ?auto_116696 ) ( HAVE_IMAGE ?auto_116697 ?auto_116694 ) ( HAVE_IMAGE ?auto_116698 ?auto_116699 ) ( not ( = ?auto_116695 ?auto_116697 ) ) ( not ( = ?auto_116695 ?auto_116698 ) ) ( not ( = ?auto_116696 ?auto_116694 ) ) ( not ( = ?auto_116696 ?auto_116699 ) ) ( not ( = ?auto_116696 ?auto_116701 ) ) ( not ( = ?auto_116697 ?auto_116698 ) ) ( not ( = ?auto_116697 ?auto_116700 ) ) ( not ( = ?auto_116697 ?auto_116702 ) ) ( not ( = ?auto_116694 ?auto_116699 ) ) ( not ( = ?auto_116694 ?auto_116701 ) ) ( not ( = ?auto_116698 ?auto_116700 ) ) ( not ( = ?auto_116698 ?auto_116702 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116695 ?auto_116699 ?auto_116700 ?auto_116701 )
      ( GET-4IMAGE-VERIFY ?auto_116695 ?auto_116696 ?auto_116697 ?auto_116694 ?auto_116698 ?auto_116699 ?auto_116700 ?auto_116701 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116706 - DIRECTION
      ?auto_116707 - MODE
      ?auto_116708 - DIRECTION
      ?auto_116705 - MODE
      ?auto_116709 - DIRECTION
      ?auto_116710 - MODE
      ?auto_116711 - DIRECTION
      ?auto_116712 - MODE
    )
    :vars
    (
      ?auto_116715 - INSTRUMENT
      ?auto_116714 - SATELLITE
      ?auto_116713 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116715 ?auto_116714 ) ( SUPPORTS ?auto_116715 ?auto_116712 ) ( POWER_ON ?auto_116715 ) ( POINTING ?auto_116714 ?auto_116713 ) ( not ( = ?auto_116711 ?auto_116713 ) ) ( HAVE_IMAGE ?auto_116708 ?auto_116707 ) ( not ( = ?auto_116708 ?auto_116711 ) ) ( not ( = ?auto_116708 ?auto_116713 ) ) ( not ( = ?auto_116707 ?auto_116712 ) ) ( CALIBRATION_TARGET ?auto_116715 ?auto_116713 ) ( NOT_CALIBRATED ?auto_116715 ) ( HAVE_IMAGE ?auto_116706 ?auto_116707 ) ( HAVE_IMAGE ?auto_116708 ?auto_116705 ) ( HAVE_IMAGE ?auto_116709 ?auto_116710 ) ( not ( = ?auto_116706 ?auto_116708 ) ) ( not ( = ?auto_116706 ?auto_116709 ) ) ( not ( = ?auto_116706 ?auto_116711 ) ) ( not ( = ?auto_116706 ?auto_116713 ) ) ( not ( = ?auto_116707 ?auto_116705 ) ) ( not ( = ?auto_116707 ?auto_116710 ) ) ( not ( = ?auto_116708 ?auto_116709 ) ) ( not ( = ?auto_116705 ?auto_116710 ) ) ( not ( = ?auto_116705 ?auto_116712 ) ) ( not ( = ?auto_116709 ?auto_116711 ) ) ( not ( = ?auto_116709 ?auto_116713 ) ) ( not ( = ?auto_116710 ?auto_116712 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116708 ?auto_116707 ?auto_116711 ?auto_116712 )
      ( GET-4IMAGE-VERIFY ?auto_116706 ?auto_116707 ?auto_116708 ?auto_116705 ?auto_116709 ?auto_116710 ?auto_116711 ?auto_116712 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116728 - DIRECTION
      ?auto_116729 - MODE
      ?auto_116730 - DIRECTION
      ?auto_116727 - MODE
      ?auto_116731 - DIRECTION
      ?auto_116732 - MODE
      ?auto_116733 - DIRECTION
      ?auto_116734 - MODE
    )
    :vars
    (
      ?auto_116737 - INSTRUMENT
      ?auto_116736 - SATELLITE
      ?auto_116735 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116737 ?auto_116736 ) ( SUPPORTS ?auto_116737 ?auto_116732 ) ( POWER_ON ?auto_116737 ) ( POINTING ?auto_116736 ?auto_116735 ) ( not ( = ?auto_116731 ?auto_116735 ) ) ( HAVE_IMAGE ?auto_116728 ?auto_116729 ) ( not ( = ?auto_116728 ?auto_116731 ) ) ( not ( = ?auto_116728 ?auto_116735 ) ) ( not ( = ?auto_116729 ?auto_116732 ) ) ( CALIBRATION_TARGET ?auto_116737 ?auto_116735 ) ( NOT_CALIBRATED ?auto_116737 ) ( HAVE_IMAGE ?auto_116730 ?auto_116727 ) ( HAVE_IMAGE ?auto_116733 ?auto_116734 ) ( not ( = ?auto_116728 ?auto_116730 ) ) ( not ( = ?auto_116728 ?auto_116733 ) ) ( not ( = ?auto_116729 ?auto_116727 ) ) ( not ( = ?auto_116729 ?auto_116734 ) ) ( not ( = ?auto_116730 ?auto_116731 ) ) ( not ( = ?auto_116730 ?auto_116733 ) ) ( not ( = ?auto_116730 ?auto_116735 ) ) ( not ( = ?auto_116727 ?auto_116732 ) ) ( not ( = ?auto_116727 ?auto_116734 ) ) ( not ( = ?auto_116731 ?auto_116733 ) ) ( not ( = ?auto_116732 ?auto_116734 ) ) ( not ( = ?auto_116733 ?auto_116735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116728 ?auto_116729 ?auto_116731 ?auto_116732 )
      ( GET-4IMAGE-VERIFY ?auto_116728 ?auto_116729 ?auto_116730 ?auto_116727 ?auto_116731 ?auto_116732 ?auto_116733 ?auto_116734 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116761 - DIRECTION
      ?auto_116762 - MODE
      ?auto_116763 - DIRECTION
      ?auto_116760 - MODE
      ?auto_116764 - DIRECTION
      ?auto_116765 - MODE
      ?auto_116766 - DIRECTION
      ?auto_116767 - MODE
    )
    :vars
    (
      ?auto_116770 - INSTRUMENT
      ?auto_116769 - SATELLITE
      ?auto_116768 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116770 ?auto_116769 ) ( SUPPORTS ?auto_116770 ?auto_116767 ) ( POWER_ON ?auto_116770 ) ( POINTING ?auto_116769 ?auto_116768 ) ( not ( = ?auto_116766 ?auto_116768 ) ) ( HAVE_IMAGE ?auto_116761 ?auto_116762 ) ( not ( = ?auto_116761 ?auto_116766 ) ) ( not ( = ?auto_116761 ?auto_116768 ) ) ( not ( = ?auto_116762 ?auto_116767 ) ) ( CALIBRATION_TARGET ?auto_116770 ?auto_116768 ) ( NOT_CALIBRATED ?auto_116770 ) ( HAVE_IMAGE ?auto_116763 ?auto_116760 ) ( HAVE_IMAGE ?auto_116764 ?auto_116765 ) ( not ( = ?auto_116761 ?auto_116763 ) ) ( not ( = ?auto_116761 ?auto_116764 ) ) ( not ( = ?auto_116762 ?auto_116760 ) ) ( not ( = ?auto_116762 ?auto_116765 ) ) ( not ( = ?auto_116763 ?auto_116764 ) ) ( not ( = ?auto_116763 ?auto_116766 ) ) ( not ( = ?auto_116763 ?auto_116768 ) ) ( not ( = ?auto_116760 ?auto_116765 ) ) ( not ( = ?auto_116760 ?auto_116767 ) ) ( not ( = ?auto_116764 ?auto_116766 ) ) ( not ( = ?auto_116764 ?auto_116768 ) ) ( not ( = ?auto_116765 ?auto_116767 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116761 ?auto_116762 ?auto_116766 ?auto_116767 )
      ( GET-4IMAGE-VERIFY ?auto_116761 ?auto_116762 ?auto_116763 ?auto_116760 ?auto_116764 ?auto_116765 ?auto_116766 ?auto_116767 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116805 - DIRECTION
      ?auto_116806 - MODE
      ?auto_116807 - DIRECTION
      ?auto_116804 - MODE
      ?auto_116808 - DIRECTION
      ?auto_116809 - MODE
      ?auto_116810 - DIRECTION
      ?auto_116811 - MODE
    )
    :vars
    (
      ?auto_116814 - INSTRUMENT
      ?auto_116813 - SATELLITE
      ?auto_116812 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116814 ?auto_116813 ) ( SUPPORTS ?auto_116814 ?auto_116804 ) ( POWER_ON ?auto_116814 ) ( POINTING ?auto_116813 ?auto_116812 ) ( not ( = ?auto_116807 ?auto_116812 ) ) ( HAVE_IMAGE ?auto_116808 ?auto_116806 ) ( not ( = ?auto_116808 ?auto_116807 ) ) ( not ( = ?auto_116808 ?auto_116812 ) ) ( not ( = ?auto_116806 ?auto_116804 ) ) ( CALIBRATION_TARGET ?auto_116814 ?auto_116812 ) ( NOT_CALIBRATED ?auto_116814 ) ( HAVE_IMAGE ?auto_116805 ?auto_116806 ) ( HAVE_IMAGE ?auto_116808 ?auto_116809 ) ( HAVE_IMAGE ?auto_116810 ?auto_116811 ) ( not ( = ?auto_116805 ?auto_116807 ) ) ( not ( = ?auto_116805 ?auto_116808 ) ) ( not ( = ?auto_116805 ?auto_116810 ) ) ( not ( = ?auto_116805 ?auto_116812 ) ) ( not ( = ?auto_116806 ?auto_116809 ) ) ( not ( = ?auto_116806 ?auto_116811 ) ) ( not ( = ?auto_116807 ?auto_116810 ) ) ( not ( = ?auto_116804 ?auto_116809 ) ) ( not ( = ?auto_116804 ?auto_116811 ) ) ( not ( = ?auto_116808 ?auto_116810 ) ) ( not ( = ?auto_116809 ?auto_116811 ) ) ( not ( = ?auto_116810 ?auto_116812 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116808 ?auto_116806 ?auto_116807 ?auto_116804 )
      ( GET-4IMAGE-VERIFY ?auto_116805 ?auto_116806 ?auto_116807 ?auto_116804 ?auto_116808 ?auto_116809 ?auto_116810 ?auto_116811 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116904 - DIRECTION
      ?auto_116905 - MODE
      ?auto_116906 - DIRECTION
      ?auto_116903 - MODE
      ?auto_116907 - DIRECTION
      ?auto_116908 - MODE
      ?auto_116909 - DIRECTION
      ?auto_116910 - MODE
    )
    :vars
    (
      ?auto_116913 - INSTRUMENT
      ?auto_116912 - SATELLITE
      ?auto_116911 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116913 ?auto_116912 ) ( SUPPORTS ?auto_116913 ?auto_116910 ) ( POWER_ON ?auto_116913 ) ( POINTING ?auto_116912 ?auto_116911 ) ( not ( = ?auto_116909 ?auto_116911 ) ) ( HAVE_IMAGE ?auto_116906 ?auto_116903 ) ( not ( = ?auto_116906 ?auto_116909 ) ) ( not ( = ?auto_116906 ?auto_116911 ) ) ( not ( = ?auto_116903 ?auto_116910 ) ) ( CALIBRATION_TARGET ?auto_116913 ?auto_116911 ) ( NOT_CALIBRATED ?auto_116913 ) ( HAVE_IMAGE ?auto_116904 ?auto_116905 ) ( HAVE_IMAGE ?auto_116907 ?auto_116908 ) ( not ( = ?auto_116904 ?auto_116906 ) ) ( not ( = ?auto_116904 ?auto_116907 ) ) ( not ( = ?auto_116904 ?auto_116909 ) ) ( not ( = ?auto_116904 ?auto_116911 ) ) ( not ( = ?auto_116905 ?auto_116903 ) ) ( not ( = ?auto_116905 ?auto_116908 ) ) ( not ( = ?auto_116905 ?auto_116910 ) ) ( not ( = ?auto_116906 ?auto_116907 ) ) ( not ( = ?auto_116903 ?auto_116908 ) ) ( not ( = ?auto_116907 ?auto_116909 ) ) ( not ( = ?auto_116907 ?auto_116911 ) ) ( not ( = ?auto_116908 ?auto_116910 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116906 ?auto_116903 ?auto_116909 ?auto_116910 )
      ( GET-4IMAGE-VERIFY ?auto_116904 ?auto_116905 ?auto_116906 ?auto_116903 ?auto_116907 ?auto_116908 ?auto_116909 ?auto_116910 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116926 - DIRECTION
      ?auto_116927 - MODE
      ?auto_116928 - DIRECTION
      ?auto_116925 - MODE
      ?auto_116929 - DIRECTION
      ?auto_116930 - MODE
      ?auto_116931 - DIRECTION
      ?auto_116932 - MODE
    )
    :vars
    (
      ?auto_116935 - INSTRUMENT
      ?auto_116934 - SATELLITE
      ?auto_116933 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116935 ?auto_116934 ) ( SUPPORTS ?auto_116935 ?auto_116930 ) ( POWER_ON ?auto_116935 ) ( POINTING ?auto_116934 ?auto_116933 ) ( not ( = ?auto_116929 ?auto_116933 ) ) ( HAVE_IMAGE ?auto_116928 ?auto_116925 ) ( not ( = ?auto_116928 ?auto_116929 ) ) ( not ( = ?auto_116928 ?auto_116933 ) ) ( not ( = ?auto_116925 ?auto_116930 ) ) ( CALIBRATION_TARGET ?auto_116935 ?auto_116933 ) ( NOT_CALIBRATED ?auto_116935 ) ( HAVE_IMAGE ?auto_116926 ?auto_116927 ) ( HAVE_IMAGE ?auto_116931 ?auto_116932 ) ( not ( = ?auto_116926 ?auto_116928 ) ) ( not ( = ?auto_116926 ?auto_116929 ) ) ( not ( = ?auto_116926 ?auto_116931 ) ) ( not ( = ?auto_116926 ?auto_116933 ) ) ( not ( = ?auto_116927 ?auto_116925 ) ) ( not ( = ?auto_116927 ?auto_116930 ) ) ( not ( = ?auto_116927 ?auto_116932 ) ) ( not ( = ?auto_116928 ?auto_116931 ) ) ( not ( = ?auto_116925 ?auto_116932 ) ) ( not ( = ?auto_116929 ?auto_116931 ) ) ( not ( = ?auto_116930 ?auto_116932 ) ) ( not ( = ?auto_116931 ?auto_116933 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116928 ?auto_116925 ?auto_116929 ?auto_116930 )
      ( GET-4IMAGE-VERIFY ?auto_116926 ?auto_116927 ?auto_116928 ?auto_116925 ?auto_116929 ?auto_116930 ?auto_116931 ?auto_116932 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116959 - DIRECTION
      ?auto_116960 - MODE
      ?auto_116961 - DIRECTION
      ?auto_116958 - MODE
      ?auto_116962 - DIRECTION
      ?auto_116963 - MODE
      ?auto_116964 - DIRECTION
      ?auto_116965 - MODE
    )
    :vars
    (
      ?auto_116968 - INSTRUMENT
      ?auto_116967 - SATELLITE
      ?auto_116966 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116968 ?auto_116967 ) ( SUPPORTS ?auto_116968 ?auto_116965 ) ( POWER_ON ?auto_116968 ) ( POINTING ?auto_116967 ?auto_116966 ) ( not ( = ?auto_116964 ?auto_116966 ) ) ( HAVE_IMAGE ?auto_116962 ?auto_116963 ) ( not ( = ?auto_116962 ?auto_116964 ) ) ( not ( = ?auto_116962 ?auto_116966 ) ) ( not ( = ?auto_116963 ?auto_116965 ) ) ( CALIBRATION_TARGET ?auto_116968 ?auto_116966 ) ( NOT_CALIBRATED ?auto_116968 ) ( HAVE_IMAGE ?auto_116959 ?auto_116960 ) ( HAVE_IMAGE ?auto_116961 ?auto_116958 ) ( not ( = ?auto_116959 ?auto_116961 ) ) ( not ( = ?auto_116959 ?auto_116962 ) ) ( not ( = ?auto_116959 ?auto_116964 ) ) ( not ( = ?auto_116959 ?auto_116966 ) ) ( not ( = ?auto_116960 ?auto_116958 ) ) ( not ( = ?auto_116960 ?auto_116963 ) ) ( not ( = ?auto_116960 ?auto_116965 ) ) ( not ( = ?auto_116961 ?auto_116962 ) ) ( not ( = ?auto_116961 ?auto_116964 ) ) ( not ( = ?auto_116961 ?auto_116966 ) ) ( not ( = ?auto_116958 ?auto_116963 ) ) ( not ( = ?auto_116958 ?auto_116965 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116962 ?auto_116963 ?auto_116964 ?auto_116965 )
      ( GET-4IMAGE-VERIFY ?auto_116959 ?auto_116960 ?auto_116961 ?auto_116958 ?auto_116962 ?auto_116963 ?auto_116964 ?auto_116965 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116970 - DIRECTION
      ?auto_116971 - MODE
      ?auto_116972 - DIRECTION
      ?auto_116969 - MODE
      ?auto_116973 - DIRECTION
      ?auto_116974 - MODE
      ?auto_116975 - DIRECTION
      ?auto_116976 - MODE
    )
    :vars
    (
      ?auto_116981 - INSTRUMENT
      ?auto_116980 - SATELLITE
      ?auto_116978 - DIRECTION
      ?auto_116979 - DIRECTION
      ?auto_116977 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_116981 ?auto_116980 ) ( SUPPORTS ?auto_116981 ?auto_116976 ) ( POWER_ON ?auto_116981 ) ( POINTING ?auto_116980 ?auto_116978 ) ( not ( = ?auto_116975 ?auto_116978 ) ) ( HAVE_IMAGE ?auto_116979 ?auto_116977 ) ( not ( = ?auto_116979 ?auto_116975 ) ) ( not ( = ?auto_116979 ?auto_116978 ) ) ( not ( = ?auto_116977 ?auto_116976 ) ) ( CALIBRATION_TARGET ?auto_116981 ?auto_116978 ) ( NOT_CALIBRATED ?auto_116981 ) ( HAVE_IMAGE ?auto_116970 ?auto_116971 ) ( HAVE_IMAGE ?auto_116972 ?auto_116969 ) ( HAVE_IMAGE ?auto_116973 ?auto_116974 ) ( not ( = ?auto_116970 ?auto_116972 ) ) ( not ( = ?auto_116970 ?auto_116973 ) ) ( not ( = ?auto_116970 ?auto_116975 ) ) ( not ( = ?auto_116970 ?auto_116978 ) ) ( not ( = ?auto_116970 ?auto_116979 ) ) ( not ( = ?auto_116971 ?auto_116969 ) ) ( not ( = ?auto_116971 ?auto_116974 ) ) ( not ( = ?auto_116971 ?auto_116976 ) ) ( not ( = ?auto_116971 ?auto_116977 ) ) ( not ( = ?auto_116972 ?auto_116973 ) ) ( not ( = ?auto_116972 ?auto_116975 ) ) ( not ( = ?auto_116972 ?auto_116978 ) ) ( not ( = ?auto_116972 ?auto_116979 ) ) ( not ( = ?auto_116969 ?auto_116974 ) ) ( not ( = ?auto_116969 ?auto_116976 ) ) ( not ( = ?auto_116969 ?auto_116977 ) ) ( not ( = ?auto_116973 ?auto_116975 ) ) ( not ( = ?auto_116973 ?auto_116978 ) ) ( not ( = ?auto_116973 ?auto_116979 ) ) ( not ( = ?auto_116974 ?auto_116976 ) ) ( not ( = ?auto_116974 ?auto_116977 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116979 ?auto_116977 ?auto_116975 ?auto_116976 )
      ( GET-4IMAGE-VERIFY ?auto_116970 ?auto_116971 ?auto_116972 ?auto_116969 ?auto_116973 ?auto_116974 ?auto_116975 ?auto_116976 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116983 - DIRECTION
      ?auto_116984 - MODE
      ?auto_116985 - DIRECTION
      ?auto_116982 - MODE
      ?auto_116986 - DIRECTION
      ?auto_116987 - MODE
      ?auto_116988 - DIRECTION
      ?auto_116989 - MODE
    )
    :vars
    (
      ?auto_116992 - INSTRUMENT
      ?auto_116991 - SATELLITE
      ?auto_116990 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_116992 ?auto_116991 ) ( SUPPORTS ?auto_116992 ?auto_116987 ) ( POWER_ON ?auto_116992 ) ( POINTING ?auto_116991 ?auto_116990 ) ( not ( = ?auto_116986 ?auto_116990 ) ) ( HAVE_IMAGE ?auto_116988 ?auto_116989 ) ( not ( = ?auto_116988 ?auto_116986 ) ) ( not ( = ?auto_116988 ?auto_116990 ) ) ( not ( = ?auto_116989 ?auto_116987 ) ) ( CALIBRATION_TARGET ?auto_116992 ?auto_116990 ) ( NOT_CALIBRATED ?auto_116992 ) ( HAVE_IMAGE ?auto_116983 ?auto_116984 ) ( HAVE_IMAGE ?auto_116985 ?auto_116982 ) ( not ( = ?auto_116983 ?auto_116985 ) ) ( not ( = ?auto_116983 ?auto_116986 ) ) ( not ( = ?auto_116983 ?auto_116988 ) ) ( not ( = ?auto_116983 ?auto_116990 ) ) ( not ( = ?auto_116984 ?auto_116982 ) ) ( not ( = ?auto_116984 ?auto_116987 ) ) ( not ( = ?auto_116984 ?auto_116989 ) ) ( not ( = ?auto_116985 ?auto_116986 ) ) ( not ( = ?auto_116985 ?auto_116988 ) ) ( not ( = ?auto_116985 ?auto_116990 ) ) ( not ( = ?auto_116982 ?auto_116987 ) ) ( not ( = ?auto_116982 ?auto_116989 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_116988 ?auto_116989 ?auto_116986 ?auto_116987 )
      ( GET-4IMAGE-VERIFY ?auto_116983 ?auto_116984 ?auto_116985 ?auto_116982 ?auto_116986 ?auto_116987 ?auto_116988 ?auto_116989 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_116994 - DIRECTION
      ?auto_116995 - MODE
      ?auto_116996 - DIRECTION
      ?auto_116993 - MODE
      ?auto_116997 - DIRECTION
      ?auto_116998 - MODE
      ?auto_116999 - DIRECTION
      ?auto_117000 - MODE
    )
    :vars
    (
      ?auto_117005 - INSTRUMENT
      ?auto_117004 - SATELLITE
      ?auto_117002 - DIRECTION
      ?auto_117003 - DIRECTION
      ?auto_117001 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_117005 ?auto_117004 ) ( SUPPORTS ?auto_117005 ?auto_116998 ) ( POWER_ON ?auto_117005 ) ( POINTING ?auto_117004 ?auto_117002 ) ( not ( = ?auto_116997 ?auto_117002 ) ) ( HAVE_IMAGE ?auto_117003 ?auto_117001 ) ( not ( = ?auto_117003 ?auto_116997 ) ) ( not ( = ?auto_117003 ?auto_117002 ) ) ( not ( = ?auto_117001 ?auto_116998 ) ) ( CALIBRATION_TARGET ?auto_117005 ?auto_117002 ) ( NOT_CALIBRATED ?auto_117005 ) ( HAVE_IMAGE ?auto_116994 ?auto_116995 ) ( HAVE_IMAGE ?auto_116996 ?auto_116993 ) ( HAVE_IMAGE ?auto_116999 ?auto_117000 ) ( not ( = ?auto_116994 ?auto_116996 ) ) ( not ( = ?auto_116994 ?auto_116997 ) ) ( not ( = ?auto_116994 ?auto_116999 ) ) ( not ( = ?auto_116994 ?auto_117002 ) ) ( not ( = ?auto_116994 ?auto_117003 ) ) ( not ( = ?auto_116995 ?auto_116993 ) ) ( not ( = ?auto_116995 ?auto_116998 ) ) ( not ( = ?auto_116995 ?auto_117000 ) ) ( not ( = ?auto_116995 ?auto_117001 ) ) ( not ( = ?auto_116996 ?auto_116997 ) ) ( not ( = ?auto_116996 ?auto_116999 ) ) ( not ( = ?auto_116996 ?auto_117002 ) ) ( not ( = ?auto_116996 ?auto_117003 ) ) ( not ( = ?auto_116993 ?auto_116998 ) ) ( not ( = ?auto_116993 ?auto_117000 ) ) ( not ( = ?auto_116993 ?auto_117001 ) ) ( not ( = ?auto_116997 ?auto_116999 ) ) ( not ( = ?auto_116998 ?auto_117000 ) ) ( not ( = ?auto_116999 ?auto_117002 ) ) ( not ( = ?auto_116999 ?auto_117003 ) ) ( not ( = ?auto_117000 ?auto_117001 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117003 ?auto_117001 ?auto_116997 ?auto_116998 )
      ( GET-4IMAGE-VERIFY ?auto_116994 ?auto_116995 ?auto_116996 ?auto_116993 ?auto_116997 ?auto_116998 ?auto_116999 ?auto_117000 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117020 - DIRECTION
      ?auto_117021 - MODE
      ?auto_117022 - DIRECTION
      ?auto_117019 - MODE
      ?auto_117023 - DIRECTION
      ?auto_117024 - MODE
      ?auto_117025 - DIRECTION
      ?auto_117026 - MODE
    )
    :vars
    (
      ?auto_117029 - INSTRUMENT
      ?auto_117028 - SATELLITE
      ?auto_117027 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117029 ?auto_117028 ) ( SUPPORTS ?auto_117029 ?auto_117019 ) ( POWER_ON ?auto_117029 ) ( POINTING ?auto_117028 ?auto_117027 ) ( not ( = ?auto_117022 ?auto_117027 ) ) ( HAVE_IMAGE ?auto_117023 ?auto_117026 ) ( not ( = ?auto_117023 ?auto_117022 ) ) ( not ( = ?auto_117023 ?auto_117027 ) ) ( not ( = ?auto_117026 ?auto_117019 ) ) ( CALIBRATION_TARGET ?auto_117029 ?auto_117027 ) ( NOT_CALIBRATED ?auto_117029 ) ( HAVE_IMAGE ?auto_117020 ?auto_117021 ) ( HAVE_IMAGE ?auto_117023 ?auto_117024 ) ( HAVE_IMAGE ?auto_117025 ?auto_117026 ) ( not ( = ?auto_117020 ?auto_117022 ) ) ( not ( = ?auto_117020 ?auto_117023 ) ) ( not ( = ?auto_117020 ?auto_117025 ) ) ( not ( = ?auto_117020 ?auto_117027 ) ) ( not ( = ?auto_117021 ?auto_117019 ) ) ( not ( = ?auto_117021 ?auto_117024 ) ) ( not ( = ?auto_117021 ?auto_117026 ) ) ( not ( = ?auto_117022 ?auto_117025 ) ) ( not ( = ?auto_117019 ?auto_117024 ) ) ( not ( = ?auto_117023 ?auto_117025 ) ) ( not ( = ?auto_117024 ?auto_117026 ) ) ( not ( = ?auto_117025 ?auto_117027 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117023 ?auto_117026 ?auto_117022 ?auto_117019 )
      ( GET-4IMAGE-VERIFY ?auto_117020 ?auto_117021 ?auto_117022 ?auto_117019 ?auto_117023 ?auto_117024 ?auto_117025 ?auto_117026 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117031 - DIRECTION
      ?auto_117032 - MODE
      ?auto_117033 - DIRECTION
      ?auto_117030 - MODE
      ?auto_117034 - DIRECTION
      ?auto_117035 - MODE
      ?auto_117036 - DIRECTION
      ?auto_117037 - MODE
    )
    :vars
    (
      ?auto_117040 - INSTRUMENT
      ?auto_117039 - SATELLITE
      ?auto_117038 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117040 ?auto_117039 ) ( SUPPORTS ?auto_117040 ?auto_117030 ) ( POWER_ON ?auto_117040 ) ( POINTING ?auto_117039 ?auto_117038 ) ( not ( = ?auto_117033 ?auto_117038 ) ) ( HAVE_IMAGE ?auto_117034 ?auto_117035 ) ( not ( = ?auto_117034 ?auto_117033 ) ) ( not ( = ?auto_117034 ?auto_117038 ) ) ( not ( = ?auto_117035 ?auto_117030 ) ) ( CALIBRATION_TARGET ?auto_117040 ?auto_117038 ) ( NOT_CALIBRATED ?auto_117040 ) ( HAVE_IMAGE ?auto_117031 ?auto_117032 ) ( HAVE_IMAGE ?auto_117036 ?auto_117037 ) ( not ( = ?auto_117031 ?auto_117033 ) ) ( not ( = ?auto_117031 ?auto_117034 ) ) ( not ( = ?auto_117031 ?auto_117036 ) ) ( not ( = ?auto_117031 ?auto_117038 ) ) ( not ( = ?auto_117032 ?auto_117030 ) ) ( not ( = ?auto_117032 ?auto_117035 ) ) ( not ( = ?auto_117032 ?auto_117037 ) ) ( not ( = ?auto_117033 ?auto_117036 ) ) ( not ( = ?auto_117030 ?auto_117037 ) ) ( not ( = ?auto_117034 ?auto_117036 ) ) ( not ( = ?auto_117035 ?auto_117037 ) ) ( not ( = ?auto_117036 ?auto_117038 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117034 ?auto_117035 ?auto_117033 ?auto_117030 )
      ( GET-4IMAGE-VERIFY ?auto_117031 ?auto_117032 ?auto_117033 ?auto_117030 ?auto_117034 ?auto_117035 ?auto_117036 ?auto_117037 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117053 - DIRECTION
      ?auto_117054 - MODE
      ?auto_117055 - DIRECTION
      ?auto_117052 - MODE
      ?auto_117056 - DIRECTION
      ?auto_117057 - MODE
      ?auto_117058 - DIRECTION
      ?auto_117059 - MODE
    )
    :vars
    (
      ?auto_117062 - INSTRUMENT
      ?auto_117061 - SATELLITE
      ?auto_117060 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117062 ?auto_117061 ) ( SUPPORTS ?auto_117062 ?auto_117052 ) ( POWER_ON ?auto_117062 ) ( POINTING ?auto_117061 ?auto_117060 ) ( not ( = ?auto_117055 ?auto_117060 ) ) ( HAVE_IMAGE ?auto_117058 ?auto_117059 ) ( not ( = ?auto_117058 ?auto_117055 ) ) ( not ( = ?auto_117058 ?auto_117060 ) ) ( not ( = ?auto_117059 ?auto_117052 ) ) ( CALIBRATION_TARGET ?auto_117062 ?auto_117060 ) ( NOT_CALIBRATED ?auto_117062 ) ( HAVE_IMAGE ?auto_117053 ?auto_117054 ) ( HAVE_IMAGE ?auto_117056 ?auto_117057 ) ( not ( = ?auto_117053 ?auto_117055 ) ) ( not ( = ?auto_117053 ?auto_117056 ) ) ( not ( = ?auto_117053 ?auto_117058 ) ) ( not ( = ?auto_117053 ?auto_117060 ) ) ( not ( = ?auto_117054 ?auto_117052 ) ) ( not ( = ?auto_117054 ?auto_117057 ) ) ( not ( = ?auto_117054 ?auto_117059 ) ) ( not ( = ?auto_117055 ?auto_117056 ) ) ( not ( = ?auto_117052 ?auto_117057 ) ) ( not ( = ?auto_117056 ?auto_117058 ) ) ( not ( = ?auto_117056 ?auto_117060 ) ) ( not ( = ?auto_117057 ?auto_117059 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117058 ?auto_117059 ?auto_117055 ?auto_117052 )
      ( GET-4IMAGE-VERIFY ?auto_117053 ?auto_117054 ?auto_117055 ?auto_117052 ?auto_117056 ?auto_117057 ?auto_117058 ?auto_117059 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117064 - DIRECTION
      ?auto_117065 - MODE
      ?auto_117066 - DIRECTION
      ?auto_117063 - MODE
      ?auto_117067 - DIRECTION
      ?auto_117068 - MODE
      ?auto_117069 - DIRECTION
      ?auto_117070 - MODE
    )
    :vars
    (
      ?auto_117075 - INSTRUMENT
      ?auto_117074 - SATELLITE
      ?auto_117072 - DIRECTION
      ?auto_117073 - DIRECTION
      ?auto_117071 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_117075 ?auto_117074 ) ( SUPPORTS ?auto_117075 ?auto_117063 ) ( POWER_ON ?auto_117075 ) ( POINTING ?auto_117074 ?auto_117072 ) ( not ( = ?auto_117066 ?auto_117072 ) ) ( HAVE_IMAGE ?auto_117073 ?auto_117071 ) ( not ( = ?auto_117073 ?auto_117066 ) ) ( not ( = ?auto_117073 ?auto_117072 ) ) ( not ( = ?auto_117071 ?auto_117063 ) ) ( CALIBRATION_TARGET ?auto_117075 ?auto_117072 ) ( NOT_CALIBRATED ?auto_117075 ) ( HAVE_IMAGE ?auto_117064 ?auto_117065 ) ( HAVE_IMAGE ?auto_117067 ?auto_117068 ) ( HAVE_IMAGE ?auto_117069 ?auto_117070 ) ( not ( = ?auto_117064 ?auto_117066 ) ) ( not ( = ?auto_117064 ?auto_117067 ) ) ( not ( = ?auto_117064 ?auto_117069 ) ) ( not ( = ?auto_117064 ?auto_117072 ) ) ( not ( = ?auto_117064 ?auto_117073 ) ) ( not ( = ?auto_117065 ?auto_117063 ) ) ( not ( = ?auto_117065 ?auto_117068 ) ) ( not ( = ?auto_117065 ?auto_117070 ) ) ( not ( = ?auto_117065 ?auto_117071 ) ) ( not ( = ?auto_117066 ?auto_117067 ) ) ( not ( = ?auto_117066 ?auto_117069 ) ) ( not ( = ?auto_117063 ?auto_117068 ) ) ( not ( = ?auto_117063 ?auto_117070 ) ) ( not ( = ?auto_117067 ?auto_117069 ) ) ( not ( = ?auto_117067 ?auto_117072 ) ) ( not ( = ?auto_117067 ?auto_117073 ) ) ( not ( = ?auto_117068 ?auto_117070 ) ) ( not ( = ?auto_117068 ?auto_117071 ) ) ( not ( = ?auto_117069 ?auto_117072 ) ) ( not ( = ?auto_117069 ?auto_117073 ) ) ( not ( = ?auto_117070 ?auto_117071 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117073 ?auto_117071 ?auto_117066 ?auto_117063 )
      ( GET-4IMAGE-VERIFY ?auto_117064 ?auto_117065 ?auto_117066 ?auto_117063 ?auto_117067 ?auto_117068 ?auto_117069 ?auto_117070 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117127 - DIRECTION
      ?auto_117128 - MODE
      ?auto_117129 - DIRECTION
      ?auto_117126 - MODE
      ?auto_117130 - DIRECTION
      ?auto_117131 - MODE
      ?auto_117132 - DIRECTION
      ?auto_117133 - MODE
    )
    :vars
    (
      ?auto_117136 - INSTRUMENT
      ?auto_117135 - SATELLITE
      ?auto_117134 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117136 ?auto_117135 ) ( SUPPORTS ?auto_117136 ?auto_117128 ) ( POWER_ON ?auto_117136 ) ( POINTING ?auto_117135 ?auto_117134 ) ( not ( = ?auto_117127 ?auto_117134 ) ) ( HAVE_IMAGE ?auto_117130 ?auto_117126 ) ( not ( = ?auto_117130 ?auto_117127 ) ) ( not ( = ?auto_117130 ?auto_117134 ) ) ( not ( = ?auto_117126 ?auto_117128 ) ) ( CALIBRATION_TARGET ?auto_117136 ?auto_117134 ) ( NOT_CALIBRATED ?auto_117136 ) ( HAVE_IMAGE ?auto_117129 ?auto_117126 ) ( HAVE_IMAGE ?auto_117130 ?auto_117131 ) ( HAVE_IMAGE ?auto_117132 ?auto_117133 ) ( not ( = ?auto_117127 ?auto_117129 ) ) ( not ( = ?auto_117127 ?auto_117132 ) ) ( not ( = ?auto_117128 ?auto_117131 ) ) ( not ( = ?auto_117128 ?auto_117133 ) ) ( not ( = ?auto_117129 ?auto_117130 ) ) ( not ( = ?auto_117129 ?auto_117132 ) ) ( not ( = ?auto_117129 ?auto_117134 ) ) ( not ( = ?auto_117126 ?auto_117131 ) ) ( not ( = ?auto_117126 ?auto_117133 ) ) ( not ( = ?auto_117130 ?auto_117132 ) ) ( not ( = ?auto_117131 ?auto_117133 ) ) ( not ( = ?auto_117132 ?auto_117134 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117130 ?auto_117126 ?auto_117127 ?auto_117128 )
      ( GET-4IMAGE-VERIFY ?auto_117127 ?auto_117128 ?auto_117129 ?auto_117126 ?auto_117130 ?auto_117131 ?auto_117132 ?auto_117133 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117160 - DIRECTION
      ?auto_117161 - MODE
      ?auto_117162 - DIRECTION
      ?auto_117159 - MODE
      ?auto_117163 - DIRECTION
      ?auto_117164 - MODE
      ?auto_117165 - DIRECTION
      ?auto_117166 - MODE
    )
    :vars
    (
      ?auto_117169 - INSTRUMENT
      ?auto_117168 - SATELLITE
      ?auto_117167 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117169 ?auto_117168 ) ( SUPPORTS ?auto_117169 ?auto_117161 ) ( POWER_ON ?auto_117169 ) ( POINTING ?auto_117168 ?auto_117167 ) ( not ( = ?auto_117160 ?auto_117167 ) ) ( HAVE_IMAGE ?auto_117165 ?auto_117166 ) ( not ( = ?auto_117165 ?auto_117160 ) ) ( not ( = ?auto_117165 ?auto_117167 ) ) ( not ( = ?auto_117166 ?auto_117161 ) ) ( CALIBRATION_TARGET ?auto_117169 ?auto_117167 ) ( NOT_CALIBRATED ?auto_117169 ) ( HAVE_IMAGE ?auto_117162 ?auto_117159 ) ( HAVE_IMAGE ?auto_117163 ?auto_117164 ) ( not ( = ?auto_117160 ?auto_117162 ) ) ( not ( = ?auto_117160 ?auto_117163 ) ) ( not ( = ?auto_117161 ?auto_117159 ) ) ( not ( = ?auto_117161 ?auto_117164 ) ) ( not ( = ?auto_117162 ?auto_117163 ) ) ( not ( = ?auto_117162 ?auto_117165 ) ) ( not ( = ?auto_117162 ?auto_117167 ) ) ( not ( = ?auto_117159 ?auto_117164 ) ) ( not ( = ?auto_117159 ?auto_117166 ) ) ( not ( = ?auto_117163 ?auto_117165 ) ) ( not ( = ?auto_117163 ?auto_117167 ) ) ( not ( = ?auto_117164 ?auto_117166 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117165 ?auto_117166 ?auto_117160 ?auto_117161 )
      ( GET-4IMAGE-VERIFY ?auto_117160 ?auto_117161 ?auto_117162 ?auto_117159 ?auto_117163 ?auto_117164 ?auto_117165 ?auto_117166 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117171 - DIRECTION
      ?auto_117172 - MODE
      ?auto_117173 - DIRECTION
      ?auto_117170 - MODE
      ?auto_117174 - DIRECTION
      ?auto_117175 - MODE
      ?auto_117176 - DIRECTION
      ?auto_117177 - MODE
    )
    :vars
    (
      ?auto_117180 - INSTRUMENT
      ?auto_117179 - SATELLITE
      ?auto_117178 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117180 ?auto_117179 ) ( SUPPORTS ?auto_117180 ?auto_117172 ) ( POWER_ON ?auto_117180 ) ( POINTING ?auto_117179 ?auto_117178 ) ( not ( = ?auto_117171 ?auto_117178 ) ) ( HAVE_IMAGE ?auto_117173 ?auto_117170 ) ( not ( = ?auto_117173 ?auto_117171 ) ) ( not ( = ?auto_117173 ?auto_117178 ) ) ( not ( = ?auto_117170 ?auto_117172 ) ) ( CALIBRATION_TARGET ?auto_117180 ?auto_117178 ) ( NOT_CALIBRATED ?auto_117180 ) ( HAVE_IMAGE ?auto_117174 ?auto_117175 ) ( HAVE_IMAGE ?auto_117176 ?auto_117177 ) ( not ( = ?auto_117171 ?auto_117174 ) ) ( not ( = ?auto_117171 ?auto_117176 ) ) ( not ( = ?auto_117172 ?auto_117175 ) ) ( not ( = ?auto_117172 ?auto_117177 ) ) ( not ( = ?auto_117173 ?auto_117174 ) ) ( not ( = ?auto_117173 ?auto_117176 ) ) ( not ( = ?auto_117170 ?auto_117175 ) ) ( not ( = ?auto_117170 ?auto_117177 ) ) ( not ( = ?auto_117174 ?auto_117176 ) ) ( not ( = ?auto_117174 ?auto_117178 ) ) ( not ( = ?auto_117175 ?auto_117177 ) ) ( not ( = ?auto_117176 ?auto_117178 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117173 ?auto_117170 ?auto_117171 ?auto_117172 )
      ( GET-4IMAGE-VERIFY ?auto_117171 ?auto_117172 ?auto_117173 ?auto_117170 ?auto_117174 ?auto_117175 ?auto_117176 ?auto_117177 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117270 - DIRECTION
      ?auto_117271 - MODE
      ?auto_117272 - DIRECTION
      ?auto_117269 - MODE
      ?auto_117273 - DIRECTION
      ?auto_117274 - MODE
      ?auto_117275 - DIRECTION
      ?auto_117276 - MODE
    )
    :vars
    (
      ?auto_117281 - INSTRUMENT
      ?auto_117280 - SATELLITE
      ?auto_117278 - DIRECTION
      ?auto_117279 - DIRECTION
      ?auto_117277 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_117281 ?auto_117280 ) ( SUPPORTS ?auto_117281 ?auto_117271 ) ( POWER_ON ?auto_117281 ) ( POINTING ?auto_117280 ?auto_117278 ) ( not ( = ?auto_117270 ?auto_117278 ) ) ( HAVE_IMAGE ?auto_117279 ?auto_117277 ) ( not ( = ?auto_117279 ?auto_117270 ) ) ( not ( = ?auto_117279 ?auto_117278 ) ) ( not ( = ?auto_117277 ?auto_117271 ) ) ( CALIBRATION_TARGET ?auto_117281 ?auto_117278 ) ( NOT_CALIBRATED ?auto_117281 ) ( HAVE_IMAGE ?auto_117272 ?auto_117269 ) ( HAVE_IMAGE ?auto_117273 ?auto_117274 ) ( HAVE_IMAGE ?auto_117275 ?auto_117276 ) ( not ( = ?auto_117270 ?auto_117272 ) ) ( not ( = ?auto_117270 ?auto_117273 ) ) ( not ( = ?auto_117270 ?auto_117275 ) ) ( not ( = ?auto_117271 ?auto_117269 ) ) ( not ( = ?auto_117271 ?auto_117274 ) ) ( not ( = ?auto_117271 ?auto_117276 ) ) ( not ( = ?auto_117272 ?auto_117273 ) ) ( not ( = ?auto_117272 ?auto_117275 ) ) ( not ( = ?auto_117272 ?auto_117278 ) ) ( not ( = ?auto_117272 ?auto_117279 ) ) ( not ( = ?auto_117269 ?auto_117274 ) ) ( not ( = ?auto_117269 ?auto_117276 ) ) ( not ( = ?auto_117269 ?auto_117277 ) ) ( not ( = ?auto_117273 ?auto_117275 ) ) ( not ( = ?auto_117273 ?auto_117278 ) ) ( not ( = ?auto_117273 ?auto_117279 ) ) ( not ( = ?auto_117274 ?auto_117276 ) ) ( not ( = ?auto_117274 ?auto_117277 ) ) ( not ( = ?auto_117275 ?auto_117278 ) ) ( not ( = ?auto_117275 ?auto_117279 ) ) ( not ( = ?auto_117276 ?auto_117277 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117279 ?auto_117277 ?auto_117270 ?auto_117271 )
      ( GET-4IMAGE-VERIFY ?auto_117270 ?auto_117271 ?auto_117272 ?auto_117269 ?auto_117273 ?auto_117274 ?auto_117275 ?auto_117276 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_117493 - DIRECTION
      ?auto_117494 - MODE
      ?auto_117495 - DIRECTION
      ?auto_117492 - MODE
      ?auto_117496 - DIRECTION
      ?auto_117497 - MODE
    )
    :vars
    (
      ?auto_117498 - INSTRUMENT
      ?auto_117500 - SATELLITE
      ?auto_117499 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117498 ?auto_117500 ) ( SUPPORTS ?auto_117498 ?auto_117492 ) ( POINTING ?auto_117500 ?auto_117499 ) ( not ( = ?auto_117495 ?auto_117499 ) ) ( HAVE_IMAGE ?auto_117493 ?auto_117497 ) ( not ( = ?auto_117493 ?auto_117495 ) ) ( not ( = ?auto_117493 ?auto_117499 ) ) ( not ( = ?auto_117497 ?auto_117492 ) ) ( CALIBRATION_TARGET ?auto_117498 ?auto_117499 ) ( POWER_AVAIL ?auto_117500 ) ( HAVE_IMAGE ?auto_117493 ?auto_117494 ) ( HAVE_IMAGE ?auto_117496 ?auto_117497 ) ( not ( = ?auto_117493 ?auto_117496 ) ) ( not ( = ?auto_117494 ?auto_117492 ) ) ( not ( = ?auto_117494 ?auto_117497 ) ) ( not ( = ?auto_117495 ?auto_117496 ) ) ( not ( = ?auto_117496 ?auto_117499 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117493 ?auto_117497 ?auto_117495 ?auto_117492 )
      ( GET-3IMAGE-VERIFY ?auto_117493 ?auto_117494 ?auto_117495 ?auto_117492 ?auto_117496 ?auto_117497 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_117502 - DIRECTION
      ?auto_117503 - MODE
      ?auto_117504 - DIRECTION
      ?auto_117501 - MODE
      ?auto_117505 - DIRECTION
      ?auto_117506 - MODE
    )
    :vars
    (
      ?auto_117507 - INSTRUMENT
      ?auto_117509 - SATELLITE
      ?auto_117508 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117507 ?auto_117509 ) ( SUPPORTS ?auto_117507 ?auto_117501 ) ( POINTING ?auto_117509 ?auto_117508 ) ( not ( = ?auto_117504 ?auto_117508 ) ) ( HAVE_IMAGE ?auto_117502 ?auto_117503 ) ( not ( = ?auto_117502 ?auto_117504 ) ) ( not ( = ?auto_117502 ?auto_117508 ) ) ( not ( = ?auto_117503 ?auto_117501 ) ) ( CALIBRATION_TARGET ?auto_117507 ?auto_117508 ) ( POWER_AVAIL ?auto_117509 ) ( HAVE_IMAGE ?auto_117505 ?auto_117506 ) ( not ( = ?auto_117502 ?auto_117505 ) ) ( not ( = ?auto_117503 ?auto_117506 ) ) ( not ( = ?auto_117504 ?auto_117505 ) ) ( not ( = ?auto_117501 ?auto_117506 ) ) ( not ( = ?auto_117505 ?auto_117508 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117502 ?auto_117503 ?auto_117504 ?auto_117501 )
      ( GET-3IMAGE-VERIFY ?auto_117502 ?auto_117503 ?auto_117504 ?auto_117501 ?auto_117505 ?auto_117506 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_117526 - DIRECTION
      ?auto_117527 - MODE
      ?auto_117528 - DIRECTION
      ?auto_117525 - MODE
      ?auto_117529 - DIRECTION
      ?auto_117530 - MODE
    )
    :vars
    (
      ?auto_117531 - INSTRUMENT
      ?auto_117534 - SATELLITE
      ?auto_117533 - DIRECTION
      ?auto_117535 - DIRECTION
      ?auto_117532 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_117531 ?auto_117534 ) ( SUPPORTS ?auto_117531 ?auto_117530 ) ( POINTING ?auto_117534 ?auto_117533 ) ( not ( = ?auto_117529 ?auto_117533 ) ) ( HAVE_IMAGE ?auto_117535 ?auto_117532 ) ( not ( = ?auto_117535 ?auto_117529 ) ) ( not ( = ?auto_117535 ?auto_117533 ) ) ( not ( = ?auto_117532 ?auto_117530 ) ) ( CALIBRATION_TARGET ?auto_117531 ?auto_117533 ) ( POWER_AVAIL ?auto_117534 ) ( HAVE_IMAGE ?auto_117526 ?auto_117527 ) ( HAVE_IMAGE ?auto_117528 ?auto_117525 ) ( not ( = ?auto_117526 ?auto_117528 ) ) ( not ( = ?auto_117526 ?auto_117529 ) ) ( not ( = ?auto_117526 ?auto_117533 ) ) ( not ( = ?auto_117526 ?auto_117535 ) ) ( not ( = ?auto_117527 ?auto_117525 ) ) ( not ( = ?auto_117527 ?auto_117530 ) ) ( not ( = ?auto_117527 ?auto_117532 ) ) ( not ( = ?auto_117528 ?auto_117529 ) ) ( not ( = ?auto_117528 ?auto_117533 ) ) ( not ( = ?auto_117528 ?auto_117535 ) ) ( not ( = ?auto_117525 ?auto_117530 ) ) ( not ( = ?auto_117525 ?auto_117532 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117535 ?auto_117532 ?auto_117529 ?auto_117530 )
      ( GET-3IMAGE-VERIFY ?auto_117526 ?auto_117527 ?auto_117528 ?auto_117525 ?auto_117529 ?auto_117530 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_117543 - DIRECTION
      ?auto_117544 - MODE
      ?auto_117545 - DIRECTION
      ?auto_117542 - MODE
      ?auto_117546 - DIRECTION
      ?auto_117547 - MODE
    )
    :vars
    (
      ?auto_117548 - INSTRUMENT
      ?auto_117551 - SATELLITE
      ?auto_117550 - DIRECTION
      ?auto_117552 - DIRECTION
      ?auto_117549 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_117548 ?auto_117551 ) ( SUPPORTS ?auto_117548 ?auto_117542 ) ( POINTING ?auto_117551 ?auto_117550 ) ( not ( = ?auto_117545 ?auto_117550 ) ) ( HAVE_IMAGE ?auto_117552 ?auto_117549 ) ( not ( = ?auto_117552 ?auto_117545 ) ) ( not ( = ?auto_117552 ?auto_117550 ) ) ( not ( = ?auto_117549 ?auto_117542 ) ) ( CALIBRATION_TARGET ?auto_117548 ?auto_117550 ) ( POWER_AVAIL ?auto_117551 ) ( HAVE_IMAGE ?auto_117543 ?auto_117544 ) ( HAVE_IMAGE ?auto_117546 ?auto_117547 ) ( not ( = ?auto_117543 ?auto_117545 ) ) ( not ( = ?auto_117543 ?auto_117546 ) ) ( not ( = ?auto_117543 ?auto_117550 ) ) ( not ( = ?auto_117543 ?auto_117552 ) ) ( not ( = ?auto_117544 ?auto_117542 ) ) ( not ( = ?auto_117544 ?auto_117547 ) ) ( not ( = ?auto_117544 ?auto_117549 ) ) ( not ( = ?auto_117545 ?auto_117546 ) ) ( not ( = ?auto_117542 ?auto_117547 ) ) ( not ( = ?auto_117546 ?auto_117550 ) ) ( not ( = ?auto_117546 ?auto_117552 ) ) ( not ( = ?auto_117547 ?auto_117549 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117552 ?auto_117549 ?auto_117545 ?auto_117542 )
      ( GET-3IMAGE-VERIFY ?auto_117543 ?auto_117544 ?auto_117545 ?auto_117542 ?auto_117546 ?auto_117547 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_117565 - DIRECTION
      ?auto_117566 - MODE
      ?auto_117567 - DIRECTION
      ?auto_117564 - MODE
      ?auto_117568 - DIRECTION
      ?auto_117569 - MODE
    )
    :vars
    (
      ?auto_117570 - INSTRUMENT
      ?auto_117572 - SATELLITE
      ?auto_117571 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117570 ?auto_117572 ) ( SUPPORTS ?auto_117570 ?auto_117566 ) ( POINTING ?auto_117572 ?auto_117571 ) ( not ( = ?auto_117565 ?auto_117571 ) ) ( HAVE_IMAGE ?auto_117567 ?auto_117564 ) ( not ( = ?auto_117567 ?auto_117565 ) ) ( not ( = ?auto_117567 ?auto_117571 ) ) ( not ( = ?auto_117564 ?auto_117566 ) ) ( CALIBRATION_TARGET ?auto_117570 ?auto_117571 ) ( POWER_AVAIL ?auto_117572 ) ( HAVE_IMAGE ?auto_117568 ?auto_117569 ) ( not ( = ?auto_117565 ?auto_117568 ) ) ( not ( = ?auto_117566 ?auto_117569 ) ) ( not ( = ?auto_117567 ?auto_117568 ) ) ( not ( = ?auto_117564 ?auto_117569 ) ) ( not ( = ?auto_117568 ?auto_117571 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117567 ?auto_117564 ?auto_117565 ?auto_117566 )
      ( GET-3IMAGE-VERIFY ?auto_117565 ?auto_117566 ?auto_117567 ?auto_117564 ?auto_117568 ?auto_117569 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_117595 - DIRECTION
      ?auto_117596 - MODE
      ?auto_117597 - DIRECTION
      ?auto_117594 - MODE
      ?auto_117598 - DIRECTION
      ?auto_117599 - MODE
    )
    :vars
    (
      ?auto_117600 - INSTRUMENT
      ?auto_117603 - SATELLITE
      ?auto_117602 - DIRECTION
      ?auto_117604 - DIRECTION
      ?auto_117601 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_117600 ?auto_117603 ) ( SUPPORTS ?auto_117600 ?auto_117596 ) ( POINTING ?auto_117603 ?auto_117602 ) ( not ( = ?auto_117595 ?auto_117602 ) ) ( HAVE_IMAGE ?auto_117604 ?auto_117601 ) ( not ( = ?auto_117604 ?auto_117595 ) ) ( not ( = ?auto_117604 ?auto_117602 ) ) ( not ( = ?auto_117601 ?auto_117596 ) ) ( CALIBRATION_TARGET ?auto_117600 ?auto_117602 ) ( POWER_AVAIL ?auto_117603 ) ( HAVE_IMAGE ?auto_117597 ?auto_117594 ) ( HAVE_IMAGE ?auto_117598 ?auto_117599 ) ( not ( = ?auto_117595 ?auto_117597 ) ) ( not ( = ?auto_117595 ?auto_117598 ) ) ( not ( = ?auto_117596 ?auto_117594 ) ) ( not ( = ?auto_117596 ?auto_117599 ) ) ( not ( = ?auto_117597 ?auto_117598 ) ) ( not ( = ?auto_117597 ?auto_117602 ) ) ( not ( = ?auto_117597 ?auto_117604 ) ) ( not ( = ?auto_117594 ?auto_117599 ) ) ( not ( = ?auto_117594 ?auto_117601 ) ) ( not ( = ?auto_117598 ?auto_117602 ) ) ( not ( = ?auto_117598 ?auto_117604 ) ) ( not ( = ?auto_117599 ?auto_117601 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117604 ?auto_117601 ?auto_117595 ?auto_117596 )
      ( GET-3IMAGE-VERIFY ?auto_117595 ?auto_117596 ?auto_117597 ?auto_117594 ?auto_117598 ?auto_117599 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117648 - DIRECTION
      ?auto_117649 - MODE
      ?auto_117650 - DIRECTION
      ?auto_117647 - MODE
      ?auto_117651 - DIRECTION
      ?auto_117652 - MODE
      ?auto_117653 - DIRECTION
      ?auto_117654 - MODE
    )
    :vars
    (
      ?auto_117655 - INSTRUMENT
      ?auto_117657 - SATELLITE
      ?auto_117656 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117655 ?auto_117657 ) ( SUPPORTS ?auto_117655 ?auto_117654 ) ( POINTING ?auto_117657 ?auto_117656 ) ( not ( = ?auto_117653 ?auto_117656 ) ) ( HAVE_IMAGE ?auto_117648 ?auto_117652 ) ( not ( = ?auto_117648 ?auto_117653 ) ) ( not ( = ?auto_117648 ?auto_117656 ) ) ( not ( = ?auto_117652 ?auto_117654 ) ) ( CALIBRATION_TARGET ?auto_117655 ?auto_117656 ) ( POWER_AVAIL ?auto_117657 ) ( HAVE_IMAGE ?auto_117648 ?auto_117649 ) ( HAVE_IMAGE ?auto_117650 ?auto_117647 ) ( HAVE_IMAGE ?auto_117651 ?auto_117652 ) ( not ( = ?auto_117648 ?auto_117650 ) ) ( not ( = ?auto_117648 ?auto_117651 ) ) ( not ( = ?auto_117649 ?auto_117647 ) ) ( not ( = ?auto_117649 ?auto_117652 ) ) ( not ( = ?auto_117649 ?auto_117654 ) ) ( not ( = ?auto_117650 ?auto_117651 ) ) ( not ( = ?auto_117650 ?auto_117653 ) ) ( not ( = ?auto_117650 ?auto_117656 ) ) ( not ( = ?auto_117647 ?auto_117652 ) ) ( not ( = ?auto_117647 ?auto_117654 ) ) ( not ( = ?auto_117651 ?auto_117653 ) ) ( not ( = ?auto_117651 ?auto_117656 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117648 ?auto_117652 ?auto_117653 ?auto_117654 )
      ( GET-4IMAGE-VERIFY ?auto_117648 ?auto_117649 ?auto_117650 ?auto_117647 ?auto_117651 ?auto_117652 ?auto_117653 ?auto_117654 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117659 - DIRECTION
      ?auto_117660 - MODE
      ?auto_117661 - DIRECTION
      ?auto_117658 - MODE
      ?auto_117662 - DIRECTION
      ?auto_117663 - MODE
      ?auto_117664 - DIRECTION
      ?auto_117665 - MODE
    )
    :vars
    (
      ?auto_117666 - INSTRUMENT
      ?auto_117668 - SATELLITE
      ?auto_117667 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117666 ?auto_117668 ) ( SUPPORTS ?auto_117666 ?auto_117665 ) ( POINTING ?auto_117668 ?auto_117667 ) ( not ( = ?auto_117664 ?auto_117667 ) ) ( HAVE_IMAGE ?auto_117661 ?auto_117660 ) ( not ( = ?auto_117661 ?auto_117664 ) ) ( not ( = ?auto_117661 ?auto_117667 ) ) ( not ( = ?auto_117660 ?auto_117665 ) ) ( CALIBRATION_TARGET ?auto_117666 ?auto_117667 ) ( POWER_AVAIL ?auto_117668 ) ( HAVE_IMAGE ?auto_117659 ?auto_117660 ) ( HAVE_IMAGE ?auto_117661 ?auto_117658 ) ( HAVE_IMAGE ?auto_117662 ?auto_117663 ) ( not ( = ?auto_117659 ?auto_117661 ) ) ( not ( = ?auto_117659 ?auto_117662 ) ) ( not ( = ?auto_117659 ?auto_117664 ) ) ( not ( = ?auto_117659 ?auto_117667 ) ) ( not ( = ?auto_117660 ?auto_117658 ) ) ( not ( = ?auto_117660 ?auto_117663 ) ) ( not ( = ?auto_117661 ?auto_117662 ) ) ( not ( = ?auto_117658 ?auto_117663 ) ) ( not ( = ?auto_117658 ?auto_117665 ) ) ( not ( = ?auto_117662 ?auto_117664 ) ) ( not ( = ?auto_117662 ?auto_117667 ) ) ( not ( = ?auto_117663 ?auto_117665 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117661 ?auto_117660 ?auto_117664 ?auto_117665 )
      ( GET-4IMAGE-VERIFY ?auto_117659 ?auto_117660 ?auto_117661 ?auto_117658 ?auto_117662 ?auto_117663 ?auto_117664 ?auto_117665 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117670 - DIRECTION
      ?auto_117671 - MODE
      ?auto_117672 - DIRECTION
      ?auto_117669 - MODE
      ?auto_117673 - DIRECTION
      ?auto_117674 - MODE
      ?auto_117675 - DIRECTION
      ?auto_117676 - MODE
    )
    :vars
    (
      ?auto_117677 - INSTRUMENT
      ?auto_117679 - SATELLITE
      ?auto_117678 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117677 ?auto_117679 ) ( SUPPORTS ?auto_117677 ?auto_117674 ) ( POINTING ?auto_117679 ?auto_117678 ) ( not ( = ?auto_117673 ?auto_117678 ) ) ( HAVE_IMAGE ?auto_117672 ?auto_117671 ) ( not ( = ?auto_117672 ?auto_117673 ) ) ( not ( = ?auto_117672 ?auto_117678 ) ) ( not ( = ?auto_117671 ?auto_117674 ) ) ( CALIBRATION_TARGET ?auto_117677 ?auto_117678 ) ( POWER_AVAIL ?auto_117679 ) ( HAVE_IMAGE ?auto_117670 ?auto_117671 ) ( HAVE_IMAGE ?auto_117672 ?auto_117669 ) ( HAVE_IMAGE ?auto_117675 ?auto_117676 ) ( not ( = ?auto_117670 ?auto_117672 ) ) ( not ( = ?auto_117670 ?auto_117673 ) ) ( not ( = ?auto_117670 ?auto_117675 ) ) ( not ( = ?auto_117670 ?auto_117678 ) ) ( not ( = ?auto_117671 ?auto_117669 ) ) ( not ( = ?auto_117671 ?auto_117676 ) ) ( not ( = ?auto_117672 ?auto_117675 ) ) ( not ( = ?auto_117669 ?auto_117674 ) ) ( not ( = ?auto_117669 ?auto_117676 ) ) ( not ( = ?auto_117673 ?auto_117675 ) ) ( not ( = ?auto_117674 ?auto_117676 ) ) ( not ( = ?auto_117675 ?auto_117678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117672 ?auto_117671 ?auto_117673 ?auto_117674 )
      ( GET-4IMAGE-VERIFY ?auto_117670 ?auto_117671 ?auto_117672 ?auto_117669 ?auto_117673 ?auto_117674 ?auto_117675 ?auto_117676 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117714 - DIRECTION
      ?auto_117715 - MODE
      ?auto_117716 - DIRECTION
      ?auto_117713 - MODE
      ?auto_117717 - DIRECTION
      ?auto_117718 - MODE
      ?auto_117719 - DIRECTION
      ?auto_117720 - MODE
    )
    :vars
    (
      ?auto_117721 - INSTRUMENT
      ?auto_117723 - SATELLITE
      ?auto_117722 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117721 ?auto_117723 ) ( SUPPORTS ?auto_117721 ?auto_117720 ) ( POINTING ?auto_117723 ?auto_117722 ) ( not ( = ?auto_117719 ?auto_117722 ) ) ( HAVE_IMAGE ?auto_117714 ?auto_117715 ) ( not ( = ?auto_117714 ?auto_117719 ) ) ( not ( = ?auto_117714 ?auto_117722 ) ) ( not ( = ?auto_117715 ?auto_117720 ) ) ( CALIBRATION_TARGET ?auto_117721 ?auto_117722 ) ( POWER_AVAIL ?auto_117723 ) ( HAVE_IMAGE ?auto_117716 ?auto_117713 ) ( HAVE_IMAGE ?auto_117717 ?auto_117718 ) ( not ( = ?auto_117714 ?auto_117716 ) ) ( not ( = ?auto_117714 ?auto_117717 ) ) ( not ( = ?auto_117715 ?auto_117713 ) ) ( not ( = ?auto_117715 ?auto_117718 ) ) ( not ( = ?auto_117716 ?auto_117717 ) ) ( not ( = ?auto_117716 ?auto_117719 ) ) ( not ( = ?auto_117716 ?auto_117722 ) ) ( not ( = ?auto_117713 ?auto_117718 ) ) ( not ( = ?auto_117713 ?auto_117720 ) ) ( not ( = ?auto_117717 ?auto_117719 ) ) ( not ( = ?auto_117717 ?auto_117722 ) ) ( not ( = ?auto_117718 ?auto_117720 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117714 ?auto_117715 ?auto_117719 ?auto_117720 )
      ( GET-4IMAGE-VERIFY ?auto_117714 ?auto_117715 ?auto_117716 ?auto_117713 ?auto_117717 ?auto_117718 ?auto_117719 ?auto_117720 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117725 - DIRECTION
      ?auto_117726 - MODE
      ?auto_117727 - DIRECTION
      ?auto_117724 - MODE
      ?auto_117728 - DIRECTION
      ?auto_117729 - MODE
      ?auto_117730 - DIRECTION
      ?auto_117731 - MODE
    )
    :vars
    (
      ?auto_117732 - INSTRUMENT
      ?auto_117734 - SATELLITE
      ?auto_117733 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117732 ?auto_117734 ) ( SUPPORTS ?auto_117732 ?auto_117729 ) ( POINTING ?auto_117734 ?auto_117733 ) ( not ( = ?auto_117728 ?auto_117733 ) ) ( HAVE_IMAGE ?auto_117725 ?auto_117731 ) ( not ( = ?auto_117725 ?auto_117728 ) ) ( not ( = ?auto_117725 ?auto_117733 ) ) ( not ( = ?auto_117731 ?auto_117729 ) ) ( CALIBRATION_TARGET ?auto_117732 ?auto_117733 ) ( POWER_AVAIL ?auto_117734 ) ( HAVE_IMAGE ?auto_117725 ?auto_117726 ) ( HAVE_IMAGE ?auto_117727 ?auto_117724 ) ( HAVE_IMAGE ?auto_117730 ?auto_117731 ) ( not ( = ?auto_117725 ?auto_117727 ) ) ( not ( = ?auto_117725 ?auto_117730 ) ) ( not ( = ?auto_117726 ?auto_117724 ) ) ( not ( = ?auto_117726 ?auto_117729 ) ) ( not ( = ?auto_117726 ?auto_117731 ) ) ( not ( = ?auto_117727 ?auto_117728 ) ) ( not ( = ?auto_117727 ?auto_117730 ) ) ( not ( = ?auto_117727 ?auto_117733 ) ) ( not ( = ?auto_117724 ?auto_117729 ) ) ( not ( = ?auto_117724 ?auto_117731 ) ) ( not ( = ?auto_117728 ?auto_117730 ) ) ( not ( = ?auto_117730 ?auto_117733 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117725 ?auto_117731 ?auto_117728 ?auto_117729 )
      ( GET-4IMAGE-VERIFY ?auto_117725 ?auto_117726 ?auto_117727 ?auto_117724 ?auto_117728 ?auto_117729 ?auto_117730 ?auto_117731 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117736 - DIRECTION
      ?auto_117737 - MODE
      ?auto_117738 - DIRECTION
      ?auto_117735 - MODE
      ?auto_117739 - DIRECTION
      ?auto_117740 - MODE
      ?auto_117741 - DIRECTION
      ?auto_117742 - MODE
    )
    :vars
    (
      ?auto_117743 - INSTRUMENT
      ?auto_117745 - SATELLITE
      ?auto_117744 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117743 ?auto_117745 ) ( SUPPORTS ?auto_117743 ?auto_117740 ) ( POINTING ?auto_117745 ?auto_117744 ) ( not ( = ?auto_117739 ?auto_117744 ) ) ( HAVE_IMAGE ?auto_117736 ?auto_117737 ) ( not ( = ?auto_117736 ?auto_117739 ) ) ( not ( = ?auto_117736 ?auto_117744 ) ) ( not ( = ?auto_117737 ?auto_117740 ) ) ( CALIBRATION_TARGET ?auto_117743 ?auto_117744 ) ( POWER_AVAIL ?auto_117745 ) ( HAVE_IMAGE ?auto_117738 ?auto_117735 ) ( HAVE_IMAGE ?auto_117741 ?auto_117742 ) ( not ( = ?auto_117736 ?auto_117738 ) ) ( not ( = ?auto_117736 ?auto_117741 ) ) ( not ( = ?auto_117737 ?auto_117735 ) ) ( not ( = ?auto_117737 ?auto_117742 ) ) ( not ( = ?auto_117738 ?auto_117739 ) ) ( not ( = ?auto_117738 ?auto_117741 ) ) ( not ( = ?auto_117738 ?auto_117744 ) ) ( not ( = ?auto_117735 ?auto_117740 ) ) ( not ( = ?auto_117735 ?auto_117742 ) ) ( not ( = ?auto_117739 ?auto_117741 ) ) ( not ( = ?auto_117740 ?auto_117742 ) ) ( not ( = ?auto_117741 ?auto_117744 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117736 ?auto_117737 ?auto_117739 ?auto_117740 )
      ( GET-4IMAGE-VERIFY ?auto_117736 ?auto_117737 ?auto_117738 ?auto_117735 ?auto_117739 ?auto_117740 ?auto_117741 ?auto_117742 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117758 - DIRECTION
      ?auto_117759 - MODE
      ?auto_117760 - DIRECTION
      ?auto_117757 - MODE
      ?auto_117761 - DIRECTION
      ?auto_117762 - MODE
      ?auto_117763 - DIRECTION
      ?auto_117764 - MODE
    )
    :vars
    (
      ?auto_117765 - INSTRUMENT
      ?auto_117767 - SATELLITE
      ?auto_117766 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117765 ?auto_117767 ) ( SUPPORTS ?auto_117765 ?auto_117757 ) ( POINTING ?auto_117767 ?auto_117766 ) ( not ( = ?auto_117760 ?auto_117766 ) ) ( HAVE_IMAGE ?auto_117761 ?auto_117762 ) ( not ( = ?auto_117761 ?auto_117760 ) ) ( not ( = ?auto_117761 ?auto_117766 ) ) ( not ( = ?auto_117762 ?auto_117757 ) ) ( CALIBRATION_TARGET ?auto_117765 ?auto_117766 ) ( POWER_AVAIL ?auto_117767 ) ( HAVE_IMAGE ?auto_117758 ?auto_117759 ) ( HAVE_IMAGE ?auto_117763 ?auto_117764 ) ( not ( = ?auto_117758 ?auto_117760 ) ) ( not ( = ?auto_117758 ?auto_117761 ) ) ( not ( = ?auto_117758 ?auto_117763 ) ) ( not ( = ?auto_117758 ?auto_117766 ) ) ( not ( = ?auto_117759 ?auto_117757 ) ) ( not ( = ?auto_117759 ?auto_117762 ) ) ( not ( = ?auto_117759 ?auto_117764 ) ) ( not ( = ?auto_117760 ?auto_117763 ) ) ( not ( = ?auto_117757 ?auto_117764 ) ) ( not ( = ?auto_117761 ?auto_117763 ) ) ( not ( = ?auto_117762 ?auto_117764 ) ) ( not ( = ?auto_117763 ?auto_117766 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117761 ?auto_117762 ?auto_117760 ?auto_117757 )
      ( GET-4IMAGE-VERIFY ?auto_117758 ?auto_117759 ?auto_117760 ?auto_117757 ?auto_117761 ?auto_117762 ?auto_117763 ?auto_117764 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117802 - DIRECTION
      ?auto_117803 - MODE
      ?auto_117804 - DIRECTION
      ?auto_117801 - MODE
      ?auto_117805 - DIRECTION
      ?auto_117806 - MODE
      ?auto_117807 - DIRECTION
      ?auto_117808 - MODE
    )
    :vars
    (
      ?auto_117809 - INSTRUMENT
      ?auto_117811 - SATELLITE
      ?auto_117810 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117809 ?auto_117811 ) ( SUPPORTS ?auto_117809 ?auto_117801 ) ( POINTING ?auto_117811 ?auto_117810 ) ( not ( = ?auto_117804 ?auto_117810 ) ) ( HAVE_IMAGE ?auto_117802 ?auto_117803 ) ( not ( = ?auto_117802 ?auto_117804 ) ) ( not ( = ?auto_117802 ?auto_117810 ) ) ( not ( = ?auto_117803 ?auto_117801 ) ) ( CALIBRATION_TARGET ?auto_117809 ?auto_117810 ) ( POWER_AVAIL ?auto_117811 ) ( HAVE_IMAGE ?auto_117805 ?auto_117806 ) ( HAVE_IMAGE ?auto_117807 ?auto_117808 ) ( not ( = ?auto_117802 ?auto_117805 ) ) ( not ( = ?auto_117802 ?auto_117807 ) ) ( not ( = ?auto_117803 ?auto_117806 ) ) ( not ( = ?auto_117803 ?auto_117808 ) ) ( not ( = ?auto_117804 ?auto_117805 ) ) ( not ( = ?auto_117804 ?auto_117807 ) ) ( not ( = ?auto_117801 ?auto_117806 ) ) ( not ( = ?auto_117801 ?auto_117808 ) ) ( not ( = ?auto_117805 ?auto_117807 ) ) ( not ( = ?auto_117805 ?auto_117810 ) ) ( not ( = ?auto_117806 ?auto_117808 ) ) ( not ( = ?auto_117807 ?auto_117810 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117802 ?auto_117803 ?auto_117804 ?auto_117801 )
      ( GET-4IMAGE-VERIFY ?auto_117802 ?auto_117803 ?auto_117804 ?auto_117801 ?auto_117805 ?auto_117806 ?auto_117807 ?auto_117808 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117857 - DIRECTION
      ?auto_117858 - MODE
      ?auto_117859 - DIRECTION
      ?auto_117856 - MODE
      ?auto_117860 - DIRECTION
      ?auto_117861 - MODE
      ?auto_117862 - DIRECTION
      ?auto_117863 - MODE
    )
    :vars
    (
      ?auto_117864 - INSTRUMENT
      ?auto_117866 - SATELLITE
      ?auto_117865 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117864 ?auto_117866 ) ( SUPPORTS ?auto_117864 ?auto_117863 ) ( POINTING ?auto_117866 ?auto_117865 ) ( not ( = ?auto_117862 ?auto_117865 ) ) ( HAVE_IMAGE ?auto_117860 ?auto_117861 ) ( not ( = ?auto_117860 ?auto_117862 ) ) ( not ( = ?auto_117860 ?auto_117865 ) ) ( not ( = ?auto_117861 ?auto_117863 ) ) ( CALIBRATION_TARGET ?auto_117864 ?auto_117865 ) ( POWER_AVAIL ?auto_117866 ) ( HAVE_IMAGE ?auto_117857 ?auto_117858 ) ( HAVE_IMAGE ?auto_117859 ?auto_117856 ) ( not ( = ?auto_117857 ?auto_117859 ) ) ( not ( = ?auto_117857 ?auto_117860 ) ) ( not ( = ?auto_117857 ?auto_117862 ) ) ( not ( = ?auto_117857 ?auto_117865 ) ) ( not ( = ?auto_117858 ?auto_117856 ) ) ( not ( = ?auto_117858 ?auto_117861 ) ) ( not ( = ?auto_117858 ?auto_117863 ) ) ( not ( = ?auto_117859 ?auto_117860 ) ) ( not ( = ?auto_117859 ?auto_117862 ) ) ( not ( = ?auto_117859 ?auto_117865 ) ) ( not ( = ?auto_117856 ?auto_117861 ) ) ( not ( = ?auto_117856 ?auto_117863 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117860 ?auto_117861 ?auto_117862 ?auto_117863 )
      ( GET-4IMAGE-VERIFY ?auto_117857 ?auto_117858 ?auto_117859 ?auto_117856 ?auto_117860 ?auto_117861 ?auto_117862 ?auto_117863 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117879 - DIRECTION
      ?auto_117880 - MODE
      ?auto_117881 - DIRECTION
      ?auto_117878 - MODE
      ?auto_117882 - DIRECTION
      ?auto_117883 - MODE
      ?auto_117884 - DIRECTION
      ?auto_117885 - MODE
    )
    :vars
    (
      ?auto_117886 - INSTRUMENT
      ?auto_117888 - SATELLITE
      ?auto_117887 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117886 ?auto_117888 ) ( SUPPORTS ?auto_117886 ?auto_117883 ) ( POINTING ?auto_117888 ?auto_117887 ) ( not ( = ?auto_117882 ?auto_117887 ) ) ( HAVE_IMAGE ?auto_117881 ?auto_117885 ) ( not ( = ?auto_117881 ?auto_117882 ) ) ( not ( = ?auto_117881 ?auto_117887 ) ) ( not ( = ?auto_117885 ?auto_117883 ) ) ( CALIBRATION_TARGET ?auto_117886 ?auto_117887 ) ( POWER_AVAIL ?auto_117888 ) ( HAVE_IMAGE ?auto_117879 ?auto_117880 ) ( HAVE_IMAGE ?auto_117881 ?auto_117878 ) ( HAVE_IMAGE ?auto_117884 ?auto_117885 ) ( not ( = ?auto_117879 ?auto_117881 ) ) ( not ( = ?auto_117879 ?auto_117882 ) ) ( not ( = ?auto_117879 ?auto_117884 ) ) ( not ( = ?auto_117879 ?auto_117887 ) ) ( not ( = ?auto_117880 ?auto_117878 ) ) ( not ( = ?auto_117880 ?auto_117883 ) ) ( not ( = ?auto_117880 ?auto_117885 ) ) ( not ( = ?auto_117881 ?auto_117884 ) ) ( not ( = ?auto_117878 ?auto_117883 ) ) ( not ( = ?auto_117878 ?auto_117885 ) ) ( not ( = ?auto_117882 ?auto_117884 ) ) ( not ( = ?auto_117884 ?auto_117887 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117881 ?auto_117885 ?auto_117882 ?auto_117883 )
      ( GET-4IMAGE-VERIFY ?auto_117879 ?auto_117880 ?auto_117881 ?auto_117878 ?auto_117882 ?auto_117883 ?auto_117884 ?auto_117885 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117890 - DIRECTION
      ?auto_117891 - MODE
      ?auto_117892 - DIRECTION
      ?auto_117889 - MODE
      ?auto_117893 - DIRECTION
      ?auto_117894 - MODE
      ?auto_117895 - DIRECTION
      ?auto_117896 - MODE
    )
    :vars
    (
      ?auto_117897 - INSTRUMENT
      ?auto_117899 - SATELLITE
      ?auto_117898 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117897 ?auto_117899 ) ( SUPPORTS ?auto_117897 ?auto_117894 ) ( POINTING ?auto_117899 ?auto_117898 ) ( not ( = ?auto_117893 ?auto_117898 ) ) ( HAVE_IMAGE ?auto_117892 ?auto_117889 ) ( not ( = ?auto_117892 ?auto_117893 ) ) ( not ( = ?auto_117892 ?auto_117898 ) ) ( not ( = ?auto_117889 ?auto_117894 ) ) ( CALIBRATION_TARGET ?auto_117897 ?auto_117898 ) ( POWER_AVAIL ?auto_117899 ) ( HAVE_IMAGE ?auto_117890 ?auto_117891 ) ( HAVE_IMAGE ?auto_117895 ?auto_117896 ) ( not ( = ?auto_117890 ?auto_117892 ) ) ( not ( = ?auto_117890 ?auto_117893 ) ) ( not ( = ?auto_117890 ?auto_117895 ) ) ( not ( = ?auto_117890 ?auto_117898 ) ) ( not ( = ?auto_117891 ?auto_117889 ) ) ( not ( = ?auto_117891 ?auto_117894 ) ) ( not ( = ?auto_117891 ?auto_117896 ) ) ( not ( = ?auto_117892 ?auto_117895 ) ) ( not ( = ?auto_117889 ?auto_117896 ) ) ( not ( = ?auto_117893 ?auto_117895 ) ) ( not ( = ?auto_117894 ?auto_117896 ) ) ( not ( = ?auto_117895 ?auto_117898 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117892 ?auto_117889 ?auto_117893 ?auto_117894 )
      ( GET-4IMAGE-VERIFY ?auto_117890 ?auto_117891 ?auto_117892 ?auto_117889 ?auto_117893 ?auto_117894 ?auto_117895 ?auto_117896 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117923 - DIRECTION
      ?auto_117924 - MODE
      ?auto_117925 - DIRECTION
      ?auto_117922 - MODE
      ?auto_117926 - DIRECTION
      ?auto_117927 - MODE
      ?auto_117928 - DIRECTION
      ?auto_117929 - MODE
    )
    :vars
    (
      ?auto_117930 - INSTRUMENT
      ?auto_117933 - SATELLITE
      ?auto_117932 - DIRECTION
      ?auto_117934 - DIRECTION
      ?auto_117931 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_117930 ?auto_117933 ) ( SUPPORTS ?auto_117930 ?auto_117929 ) ( POINTING ?auto_117933 ?auto_117932 ) ( not ( = ?auto_117928 ?auto_117932 ) ) ( HAVE_IMAGE ?auto_117934 ?auto_117931 ) ( not ( = ?auto_117934 ?auto_117928 ) ) ( not ( = ?auto_117934 ?auto_117932 ) ) ( not ( = ?auto_117931 ?auto_117929 ) ) ( CALIBRATION_TARGET ?auto_117930 ?auto_117932 ) ( POWER_AVAIL ?auto_117933 ) ( HAVE_IMAGE ?auto_117923 ?auto_117924 ) ( HAVE_IMAGE ?auto_117925 ?auto_117922 ) ( HAVE_IMAGE ?auto_117926 ?auto_117927 ) ( not ( = ?auto_117923 ?auto_117925 ) ) ( not ( = ?auto_117923 ?auto_117926 ) ) ( not ( = ?auto_117923 ?auto_117928 ) ) ( not ( = ?auto_117923 ?auto_117932 ) ) ( not ( = ?auto_117923 ?auto_117934 ) ) ( not ( = ?auto_117924 ?auto_117922 ) ) ( not ( = ?auto_117924 ?auto_117927 ) ) ( not ( = ?auto_117924 ?auto_117929 ) ) ( not ( = ?auto_117924 ?auto_117931 ) ) ( not ( = ?auto_117925 ?auto_117926 ) ) ( not ( = ?auto_117925 ?auto_117928 ) ) ( not ( = ?auto_117925 ?auto_117932 ) ) ( not ( = ?auto_117925 ?auto_117934 ) ) ( not ( = ?auto_117922 ?auto_117927 ) ) ( not ( = ?auto_117922 ?auto_117929 ) ) ( not ( = ?auto_117922 ?auto_117931 ) ) ( not ( = ?auto_117926 ?auto_117928 ) ) ( not ( = ?auto_117926 ?auto_117932 ) ) ( not ( = ?auto_117926 ?auto_117934 ) ) ( not ( = ?auto_117927 ?auto_117929 ) ) ( not ( = ?auto_117927 ?auto_117931 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117934 ?auto_117931 ?auto_117928 ?auto_117929 )
      ( GET-4IMAGE-VERIFY ?auto_117923 ?auto_117924 ?auto_117925 ?auto_117922 ?auto_117926 ?auto_117927 ?auto_117928 ?auto_117929 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117936 - DIRECTION
      ?auto_117937 - MODE
      ?auto_117938 - DIRECTION
      ?auto_117935 - MODE
      ?auto_117939 - DIRECTION
      ?auto_117940 - MODE
      ?auto_117941 - DIRECTION
      ?auto_117942 - MODE
    )
    :vars
    (
      ?auto_117943 - INSTRUMENT
      ?auto_117945 - SATELLITE
      ?auto_117944 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117943 ?auto_117945 ) ( SUPPORTS ?auto_117943 ?auto_117940 ) ( POINTING ?auto_117945 ?auto_117944 ) ( not ( = ?auto_117939 ?auto_117944 ) ) ( HAVE_IMAGE ?auto_117941 ?auto_117942 ) ( not ( = ?auto_117941 ?auto_117939 ) ) ( not ( = ?auto_117941 ?auto_117944 ) ) ( not ( = ?auto_117942 ?auto_117940 ) ) ( CALIBRATION_TARGET ?auto_117943 ?auto_117944 ) ( POWER_AVAIL ?auto_117945 ) ( HAVE_IMAGE ?auto_117936 ?auto_117937 ) ( HAVE_IMAGE ?auto_117938 ?auto_117935 ) ( not ( = ?auto_117936 ?auto_117938 ) ) ( not ( = ?auto_117936 ?auto_117939 ) ) ( not ( = ?auto_117936 ?auto_117941 ) ) ( not ( = ?auto_117936 ?auto_117944 ) ) ( not ( = ?auto_117937 ?auto_117935 ) ) ( not ( = ?auto_117937 ?auto_117940 ) ) ( not ( = ?auto_117937 ?auto_117942 ) ) ( not ( = ?auto_117938 ?auto_117939 ) ) ( not ( = ?auto_117938 ?auto_117941 ) ) ( not ( = ?auto_117938 ?auto_117944 ) ) ( not ( = ?auto_117935 ?auto_117940 ) ) ( not ( = ?auto_117935 ?auto_117942 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117941 ?auto_117942 ?auto_117939 ?auto_117940 )
      ( GET-4IMAGE-VERIFY ?auto_117936 ?auto_117937 ?auto_117938 ?auto_117935 ?auto_117939 ?auto_117940 ?auto_117941 ?auto_117942 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117947 - DIRECTION
      ?auto_117948 - MODE
      ?auto_117949 - DIRECTION
      ?auto_117946 - MODE
      ?auto_117950 - DIRECTION
      ?auto_117951 - MODE
      ?auto_117952 - DIRECTION
      ?auto_117953 - MODE
    )
    :vars
    (
      ?auto_117954 - INSTRUMENT
      ?auto_117957 - SATELLITE
      ?auto_117956 - DIRECTION
      ?auto_117958 - DIRECTION
      ?auto_117955 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_117954 ?auto_117957 ) ( SUPPORTS ?auto_117954 ?auto_117951 ) ( POINTING ?auto_117957 ?auto_117956 ) ( not ( = ?auto_117950 ?auto_117956 ) ) ( HAVE_IMAGE ?auto_117958 ?auto_117955 ) ( not ( = ?auto_117958 ?auto_117950 ) ) ( not ( = ?auto_117958 ?auto_117956 ) ) ( not ( = ?auto_117955 ?auto_117951 ) ) ( CALIBRATION_TARGET ?auto_117954 ?auto_117956 ) ( POWER_AVAIL ?auto_117957 ) ( HAVE_IMAGE ?auto_117947 ?auto_117948 ) ( HAVE_IMAGE ?auto_117949 ?auto_117946 ) ( HAVE_IMAGE ?auto_117952 ?auto_117953 ) ( not ( = ?auto_117947 ?auto_117949 ) ) ( not ( = ?auto_117947 ?auto_117950 ) ) ( not ( = ?auto_117947 ?auto_117952 ) ) ( not ( = ?auto_117947 ?auto_117956 ) ) ( not ( = ?auto_117947 ?auto_117958 ) ) ( not ( = ?auto_117948 ?auto_117946 ) ) ( not ( = ?auto_117948 ?auto_117951 ) ) ( not ( = ?auto_117948 ?auto_117953 ) ) ( not ( = ?auto_117948 ?auto_117955 ) ) ( not ( = ?auto_117949 ?auto_117950 ) ) ( not ( = ?auto_117949 ?auto_117952 ) ) ( not ( = ?auto_117949 ?auto_117956 ) ) ( not ( = ?auto_117949 ?auto_117958 ) ) ( not ( = ?auto_117946 ?auto_117951 ) ) ( not ( = ?auto_117946 ?auto_117953 ) ) ( not ( = ?auto_117946 ?auto_117955 ) ) ( not ( = ?auto_117950 ?auto_117952 ) ) ( not ( = ?auto_117951 ?auto_117953 ) ) ( not ( = ?auto_117952 ?auto_117956 ) ) ( not ( = ?auto_117952 ?auto_117958 ) ) ( not ( = ?auto_117953 ?auto_117955 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117958 ?auto_117955 ?auto_117950 ?auto_117951 )
      ( GET-4IMAGE-VERIFY ?auto_117947 ?auto_117948 ?auto_117949 ?auto_117946 ?auto_117950 ?auto_117951 ?auto_117952 ?auto_117953 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_117973 - DIRECTION
      ?auto_117974 - MODE
      ?auto_117975 - DIRECTION
      ?auto_117972 - MODE
      ?auto_117976 - DIRECTION
      ?auto_117977 - MODE
      ?auto_117978 - DIRECTION
      ?auto_117979 - MODE
    )
    :vars
    (
      ?auto_117980 - INSTRUMENT
      ?auto_117982 - SATELLITE
      ?auto_117981 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_117980 ?auto_117982 ) ( SUPPORTS ?auto_117980 ?auto_117972 ) ( POINTING ?auto_117982 ?auto_117981 ) ( not ( = ?auto_117975 ?auto_117981 ) ) ( HAVE_IMAGE ?auto_117978 ?auto_117977 ) ( not ( = ?auto_117978 ?auto_117975 ) ) ( not ( = ?auto_117978 ?auto_117981 ) ) ( not ( = ?auto_117977 ?auto_117972 ) ) ( CALIBRATION_TARGET ?auto_117980 ?auto_117981 ) ( POWER_AVAIL ?auto_117982 ) ( HAVE_IMAGE ?auto_117973 ?auto_117974 ) ( HAVE_IMAGE ?auto_117976 ?auto_117977 ) ( HAVE_IMAGE ?auto_117978 ?auto_117979 ) ( not ( = ?auto_117973 ?auto_117975 ) ) ( not ( = ?auto_117973 ?auto_117976 ) ) ( not ( = ?auto_117973 ?auto_117978 ) ) ( not ( = ?auto_117973 ?auto_117981 ) ) ( not ( = ?auto_117974 ?auto_117972 ) ) ( not ( = ?auto_117974 ?auto_117977 ) ) ( not ( = ?auto_117974 ?auto_117979 ) ) ( not ( = ?auto_117975 ?auto_117976 ) ) ( not ( = ?auto_117972 ?auto_117979 ) ) ( not ( = ?auto_117976 ?auto_117978 ) ) ( not ( = ?auto_117976 ?auto_117981 ) ) ( not ( = ?auto_117977 ?auto_117979 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_117978 ?auto_117977 ?auto_117975 ?auto_117972 )
      ( GET-4IMAGE-VERIFY ?auto_117973 ?auto_117974 ?auto_117975 ?auto_117972 ?auto_117976 ?auto_117977 ?auto_117978 ?auto_117979 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118006 - DIRECTION
      ?auto_118007 - MODE
      ?auto_118008 - DIRECTION
      ?auto_118005 - MODE
      ?auto_118009 - DIRECTION
      ?auto_118010 - MODE
      ?auto_118011 - DIRECTION
      ?auto_118012 - MODE
    )
    :vars
    (
      ?auto_118013 - INSTRUMENT
      ?auto_118015 - SATELLITE
      ?auto_118014 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118013 ?auto_118015 ) ( SUPPORTS ?auto_118013 ?auto_118005 ) ( POINTING ?auto_118015 ?auto_118014 ) ( not ( = ?auto_118008 ?auto_118014 ) ) ( HAVE_IMAGE ?auto_118011 ?auto_118012 ) ( not ( = ?auto_118011 ?auto_118008 ) ) ( not ( = ?auto_118011 ?auto_118014 ) ) ( not ( = ?auto_118012 ?auto_118005 ) ) ( CALIBRATION_TARGET ?auto_118013 ?auto_118014 ) ( POWER_AVAIL ?auto_118015 ) ( HAVE_IMAGE ?auto_118006 ?auto_118007 ) ( HAVE_IMAGE ?auto_118009 ?auto_118010 ) ( not ( = ?auto_118006 ?auto_118008 ) ) ( not ( = ?auto_118006 ?auto_118009 ) ) ( not ( = ?auto_118006 ?auto_118011 ) ) ( not ( = ?auto_118006 ?auto_118014 ) ) ( not ( = ?auto_118007 ?auto_118005 ) ) ( not ( = ?auto_118007 ?auto_118010 ) ) ( not ( = ?auto_118007 ?auto_118012 ) ) ( not ( = ?auto_118008 ?auto_118009 ) ) ( not ( = ?auto_118005 ?auto_118010 ) ) ( not ( = ?auto_118009 ?auto_118011 ) ) ( not ( = ?auto_118009 ?auto_118014 ) ) ( not ( = ?auto_118010 ?auto_118012 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118011 ?auto_118012 ?auto_118008 ?auto_118005 )
      ( GET-4IMAGE-VERIFY ?auto_118006 ?auto_118007 ?auto_118008 ?auto_118005 ?auto_118009 ?auto_118010 ?auto_118011 ?auto_118012 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118017 - DIRECTION
      ?auto_118018 - MODE
      ?auto_118019 - DIRECTION
      ?auto_118016 - MODE
      ?auto_118020 - DIRECTION
      ?auto_118021 - MODE
      ?auto_118022 - DIRECTION
      ?auto_118023 - MODE
    )
    :vars
    (
      ?auto_118024 - INSTRUMENT
      ?auto_118027 - SATELLITE
      ?auto_118026 - DIRECTION
      ?auto_118028 - DIRECTION
      ?auto_118025 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_118024 ?auto_118027 ) ( SUPPORTS ?auto_118024 ?auto_118016 ) ( POINTING ?auto_118027 ?auto_118026 ) ( not ( = ?auto_118019 ?auto_118026 ) ) ( HAVE_IMAGE ?auto_118028 ?auto_118025 ) ( not ( = ?auto_118028 ?auto_118019 ) ) ( not ( = ?auto_118028 ?auto_118026 ) ) ( not ( = ?auto_118025 ?auto_118016 ) ) ( CALIBRATION_TARGET ?auto_118024 ?auto_118026 ) ( POWER_AVAIL ?auto_118027 ) ( HAVE_IMAGE ?auto_118017 ?auto_118018 ) ( HAVE_IMAGE ?auto_118020 ?auto_118021 ) ( HAVE_IMAGE ?auto_118022 ?auto_118023 ) ( not ( = ?auto_118017 ?auto_118019 ) ) ( not ( = ?auto_118017 ?auto_118020 ) ) ( not ( = ?auto_118017 ?auto_118022 ) ) ( not ( = ?auto_118017 ?auto_118026 ) ) ( not ( = ?auto_118017 ?auto_118028 ) ) ( not ( = ?auto_118018 ?auto_118016 ) ) ( not ( = ?auto_118018 ?auto_118021 ) ) ( not ( = ?auto_118018 ?auto_118023 ) ) ( not ( = ?auto_118018 ?auto_118025 ) ) ( not ( = ?auto_118019 ?auto_118020 ) ) ( not ( = ?auto_118019 ?auto_118022 ) ) ( not ( = ?auto_118016 ?auto_118021 ) ) ( not ( = ?auto_118016 ?auto_118023 ) ) ( not ( = ?auto_118020 ?auto_118022 ) ) ( not ( = ?auto_118020 ?auto_118026 ) ) ( not ( = ?auto_118020 ?auto_118028 ) ) ( not ( = ?auto_118021 ?auto_118023 ) ) ( not ( = ?auto_118021 ?auto_118025 ) ) ( not ( = ?auto_118022 ?auto_118026 ) ) ( not ( = ?auto_118022 ?auto_118028 ) ) ( not ( = ?auto_118023 ?auto_118025 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118028 ?auto_118025 ?auto_118019 ?auto_118016 )
      ( GET-4IMAGE-VERIFY ?auto_118017 ?auto_118018 ?auto_118019 ?auto_118016 ?auto_118020 ?auto_118021 ?auto_118022 ?auto_118023 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118080 - DIRECTION
      ?auto_118081 - MODE
      ?auto_118082 - DIRECTION
      ?auto_118079 - MODE
      ?auto_118083 - DIRECTION
      ?auto_118084 - MODE
      ?auto_118085 - DIRECTION
      ?auto_118086 - MODE
    )
    :vars
    (
      ?auto_118087 - INSTRUMENT
      ?auto_118089 - SATELLITE
      ?auto_118088 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118087 ?auto_118089 ) ( SUPPORTS ?auto_118087 ?auto_118081 ) ( POINTING ?auto_118089 ?auto_118088 ) ( not ( = ?auto_118080 ?auto_118088 ) ) ( HAVE_IMAGE ?auto_118082 ?auto_118084 ) ( not ( = ?auto_118082 ?auto_118080 ) ) ( not ( = ?auto_118082 ?auto_118088 ) ) ( not ( = ?auto_118084 ?auto_118081 ) ) ( CALIBRATION_TARGET ?auto_118087 ?auto_118088 ) ( POWER_AVAIL ?auto_118089 ) ( HAVE_IMAGE ?auto_118082 ?auto_118079 ) ( HAVE_IMAGE ?auto_118083 ?auto_118084 ) ( HAVE_IMAGE ?auto_118085 ?auto_118086 ) ( not ( = ?auto_118080 ?auto_118083 ) ) ( not ( = ?auto_118080 ?auto_118085 ) ) ( not ( = ?auto_118081 ?auto_118079 ) ) ( not ( = ?auto_118081 ?auto_118086 ) ) ( not ( = ?auto_118082 ?auto_118083 ) ) ( not ( = ?auto_118082 ?auto_118085 ) ) ( not ( = ?auto_118079 ?auto_118084 ) ) ( not ( = ?auto_118079 ?auto_118086 ) ) ( not ( = ?auto_118083 ?auto_118085 ) ) ( not ( = ?auto_118083 ?auto_118088 ) ) ( not ( = ?auto_118084 ?auto_118086 ) ) ( not ( = ?auto_118085 ?auto_118088 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118082 ?auto_118084 ?auto_118080 ?auto_118081 )
      ( GET-4IMAGE-VERIFY ?auto_118080 ?auto_118081 ?auto_118082 ?auto_118079 ?auto_118083 ?auto_118084 ?auto_118085 ?auto_118086 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118091 - DIRECTION
      ?auto_118092 - MODE
      ?auto_118093 - DIRECTION
      ?auto_118090 - MODE
      ?auto_118094 - DIRECTION
      ?auto_118095 - MODE
      ?auto_118096 - DIRECTION
      ?auto_118097 - MODE
    )
    :vars
    (
      ?auto_118098 - INSTRUMENT
      ?auto_118100 - SATELLITE
      ?auto_118099 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118098 ?auto_118100 ) ( SUPPORTS ?auto_118098 ?auto_118092 ) ( POINTING ?auto_118100 ?auto_118099 ) ( not ( = ?auto_118091 ?auto_118099 ) ) ( HAVE_IMAGE ?auto_118094 ?auto_118095 ) ( not ( = ?auto_118094 ?auto_118091 ) ) ( not ( = ?auto_118094 ?auto_118099 ) ) ( not ( = ?auto_118095 ?auto_118092 ) ) ( CALIBRATION_TARGET ?auto_118098 ?auto_118099 ) ( POWER_AVAIL ?auto_118100 ) ( HAVE_IMAGE ?auto_118093 ?auto_118090 ) ( HAVE_IMAGE ?auto_118096 ?auto_118097 ) ( not ( = ?auto_118091 ?auto_118093 ) ) ( not ( = ?auto_118091 ?auto_118096 ) ) ( not ( = ?auto_118092 ?auto_118090 ) ) ( not ( = ?auto_118092 ?auto_118097 ) ) ( not ( = ?auto_118093 ?auto_118094 ) ) ( not ( = ?auto_118093 ?auto_118096 ) ) ( not ( = ?auto_118093 ?auto_118099 ) ) ( not ( = ?auto_118090 ?auto_118095 ) ) ( not ( = ?auto_118090 ?auto_118097 ) ) ( not ( = ?auto_118094 ?auto_118096 ) ) ( not ( = ?auto_118095 ?auto_118097 ) ) ( not ( = ?auto_118096 ?auto_118099 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118094 ?auto_118095 ?auto_118091 ?auto_118092 )
      ( GET-4IMAGE-VERIFY ?auto_118091 ?auto_118092 ?auto_118093 ?auto_118090 ?auto_118094 ?auto_118095 ?auto_118096 ?auto_118097 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118113 - DIRECTION
      ?auto_118114 - MODE
      ?auto_118115 - DIRECTION
      ?auto_118112 - MODE
      ?auto_118116 - DIRECTION
      ?auto_118117 - MODE
      ?auto_118118 - DIRECTION
      ?auto_118119 - MODE
    )
    :vars
    (
      ?auto_118120 - INSTRUMENT
      ?auto_118122 - SATELLITE
      ?auto_118121 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118120 ?auto_118122 ) ( SUPPORTS ?auto_118120 ?auto_118114 ) ( POINTING ?auto_118122 ?auto_118121 ) ( not ( = ?auto_118113 ?auto_118121 ) ) ( HAVE_IMAGE ?auto_118118 ?auto_118119 ) ( not ( = ?auto_118118 ?auto_118113 ) ) ( not ( = ?auto_118118 ?auto_118121 ) ) ( not ( = ?auto_118119 ?auto_118114 ) ) ( CALIBRATION_TARGET ?auto_118120 ?auto_118121 ) ( POWER_AVAIL ?auto_118122 ) ( HAVE_IMAGE ?auto_118115 ?auto_118112 ) ( HAVE_IMAGE ?auto_118116 ?auto_118117 ) ( not ( = ?auto_118113 ?auto_118115 ) ) ( not ( = ?auto_118113 ?auto_118116 ) ) ( not ( = ?auto_118114 ?auto_118112 ) ) ( not ( = ?auto_118114 ?auto_118117 ) ) ( not ( = ?auto_118115 ?auto_118116 ) ) ( not ( = ?auto_118115 ?auto_118118 ) ) ( not ( = ?auto_118115 ?auto_118121 ) ) ( not ( = ?auto_118112 ?auto_118117 ) ) ( not ( = ?auto_118112 ?auto_118119 ) ) ( not ( = ?auto_118116 ?auto_118118 ) ) ( not ( = ?auto_118116 ?auto_118121 ) ) ( not ( = ?auto_118117 ?auto_118119 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118118 ?auto_118119 ?auto_118113 ?auto_118114 )
      ( GET-4IMAGE-VERIFY ?auto_118113 ?auto_118114 ?auto_118115 ?auto_118112 ?auto_118116 ?auto_118117 ?auto_118118 ?auto_118119 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118124 - DIRECTION
      ?auto_118125 - MODE
      ?auto_118126 - DIRECTION
      ?auto_118123 - MODE
      ?auto_118127 - DIRECTION
      ?auto_118128 - MODE
      ?auto_118129 - DIRECTION
      ?auto_118130 - MODE
    )
    :vars
    (
      ?auto_118131 - INSTRUMENT
      ?auto_118133 - SATELLITE
      ?auto_118132 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118131 ?auto_118133 ) ( SUPPORTS ?auto_118131 ?auto_118125 ) ( POINTING ?auto_118133 ?auto_118132 ) ( not ( = ?auto_118124 ?auto_118132 ) ) ( HAVE_IMAGE ?auto_118126 ?auto_118123 ) ( not ( = ?auto_118126 ?auto_118124 ) ) ( not ( = ?auto_118126 ?auto_118132 ) ) ( not ( = ?auto_118123 ?auto_118125 ) ) ( CALIBRATION_TARGET ?auto_118131 ?auto_118132 ) ( POWER_AVAIL ?auto_118133 ) ( HAVE_IMAGE ?auto_118127 ?auto_118128 ) ( HAVE_IMAGE ?auto_118129 ?auto_118130 ) ( not ( = ?auto_118124 ?auto_118127 ) ) ( not ( = ?auto_118124 ?auto_118129 ) ) ( not ( = ?auto_118125 ?auto_118128 ) ) ( not ( = ?auto_118125 ?auto_118130 ) ) ( not ( = ?auto_118126 ?auto_118127 ) ) ( not ( = ?auto_118126 ?auto_118129 ) ) ( not ( = ?auto_118123 ?auto_118128 ) ) ( not ( = ?auto_118123 ?auto_118130 ) ) ( not ( = ?auto_118127 ?auto_118129 ) ) ( not ( = ?auto_118127 ?auto_118132 ) ) ( not ( = ?auto_118128 ?auto_118130 ) ) ( not ( = ?auto_118129 ?auto_118132 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118126 ?auto_118123 ?auto_118124 ?auto_118125 )
      ( GET-4IMAGE-VERIFY ?auto_118124 ?auto_118125 ?auto_118126 ?auto_118123 ?auto_118127 ?auto_118128 ?auto_118129 ?auto_118130 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118223 - DIRECTION
      ?auto_118224 - MODE
      ?auto_118225 - DIRECTION
      ?auto_118222 - MODE
      ?auto_118226 - DIRECTION
      ?auto_118227 - MODE
      ?auto_118228 - DIRECTION
      ?auto_118229 - MODE
    )
    :vars
    (
      ?auto_118230 - INSTRUMENT
      ?auto_118233 - SATELLITE
      ?auto_118232 - DIRECTION
      ?auto_118234 - DIRECTION
      ?auto_118231 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_118230 ?auto_118233 ) ( SUPPORTS ?auto_118230 ?auto_118224 ) ( POINTING ?auto_118233 ?auto_118232 ) ( not ( = ?auto_118223 ?auto_118232 ) ) ( HAVE_IMAGE ?auto_118234 ?auto_118231 ) ( not ( = ?auto_118234 ?auto_118223 ) ) ( not ( = ?auto_118234 ?auto_118232 ) ) ( not ( = ?auto_118231 ?auto_118224 ) ) ( CALIBRATION_TARGET ?auto_118230 ?auto_118232 ) ( POWER_AVAIL ?auto_118233 ) ( HAVE_IMAGE ?auto_118225 ?auto_118222 ) ( HAVE_IMAGE ?auto_118226 ?auto_118227 ) ( HAVE_IMAGE ?auto_118228 ?auto_118229 ) ( not ( = ?auto_118223 ?auto_118225 ) ) ( not ( = ?auto_118223 ?auto_118226 ) ) ( not ( = ?auto_118223 ?auto_118228 ) ) ( not ( = ?auto_118224 ?auto_118222 ) ) ( not ( = ?auto_118224 ?auto_118227 ) ) ( not ( = ?auto_118224 ?auto_118229 ) ) ( not ( = ?auto_118225 ?auto_118226 ) ) ( not ( = ?auto_118225 ?auto_118228 ) ) ( not ( = ?auto_118225 ?auto_118232 ) ) ( not ( = ?auto_118225 ?auto_118234 ) ) ( not ( = ?auto_118222 ?auto_118227 ) ) ( not ( = ?auto_118222 ?auto_118229 ) ) ( not ( = ?auto_118222 ?auto_118231 ) ) ( not ( = ?auto_118226 ?auto_118228 ) ) ( not ( = ?auto_118226 ?auto_118232 ) ) ( not ( = ?auto_118226 ?auto_118234 ) ) ( not ( = ?auto_118227 ?auto_118229 ) ) ( not ( = ?auto_118227 ?auto_118231 ) ) ( not ( = ?auto_118228 ?auto_118232 ) ) ( not ( = ?auto_118228 ?auto_118234 ) ) ( not ( = ?auto_118229 ?auto_118231 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118234 ?auto_118231 ?auto_118223 ?auto_118224 )
      ( GET-4IMAGE-VERIFY ?auto_118223 ?auto_118224 ?auto_118225 ?auto_118222 ?auto_118226 ?auto_118227 ?auto_118228 ?auto_118229 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_118392 - DIRECTION
      ?auto_118393 - MODE
    )
    :vars
    (
      ?auto_118394 - INSTRUMENT
      ?auto_118397 - SATELLITE
      ?auto_118396 - DIRECTION
      ?auto_118398 - DIRECTION
      ?auto_118395 - MODE
      ?auto_118399 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118394 ?auto_118397 ) ( SUPPORTS ?auto_118394 ?auto_118393 ) ( not ( = ?auto_118392 ?auto_118396 ) ) ( HAVE_IMAGE ?auto_118398 ?auto_118395 ) ( not ( = ?auto_118398 ?auto_118392 ) ) ( not ( = ?auto_118398 ?auto_118396 ) ) ( not ( = ?auto_118395 ?auto_118393 ) ) ( CALIBRATION_TARGET ?auto_118394 ?auto_118396 ) ( POWER_AVAIL ?auto_118397 ) ( POINTING ?auto_118397 ?auto_118399 ) ( not ( = ?auto_118396 ?auto_118399 ) ) ( not ( = ?auto_118392 ?auto_118399 ) ) ( not ( = ?auto_118398 ?auto_118399 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_118397 ?auto_118396 ?auto_118399 )
      ( GET-2IMAGE ?auto_118398 ?auto_118395 ?auto_118392 ?auto_118393 )
      ( GET-1IMAGE-VERIFY ?auto_118392 ?auto_118393 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_118401 - DIRECTION
      ?auto_118402 - MODE
      ?auto_118403 - DIRECTION
      ?auto_118400 - MODE
    )
    :vars
    (
      ?auto_118406 - INSTRUMENT
      ?auto_118405 - SATELLITE
      ?auto_118404 - DIRECTION
      ?auto_118407 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118406 ?auto_118405 ) ( SUPPORTS ?auto_118406 ?auto_118400 ) ( not ( = ?auto_118403 ?auto_118404 ) ) ( HAVE_IMAGE ?auto_118401 ?auto_118402 ) ( not ( = ?auto_118401 ?auto_118403 ) ) ( not ( = ?auto_118401 ?auto_118404 ) ) ( not ( = ?auto_118402 ?auto_118400 ) ) ( CALIBRATION_TARGET ?auto_118406 ?auto_118404 ) ( POWER_AVAIL ?auto_118405 ) ( POINTING ?auto_118405 ?auto_118407 ) ( not ( = ?auto_118404 ?auto_118407 ) ) ( not ( = ?auto_118403 ?auto_118407 ) ) ( not ( = ?auto_118401 ?auto_118407 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_118403 ?auto_118400 )
      ( GET-2IMAGE-VERIFY ?auto_118401 ?auto_118402 ?auto_118403 ?auto_118400 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_118409 - DIRECTION
      ?auto_118410 - MODE
      ?auto_118411 - DIRECTION
      ?auto_118408 - MODE
    )
    :vars
    (
      ?auto_118416 - INSTRUMENT
      ?auto_118412 - SATELLITE
      ?auto_118413 - DIRECTION
      ?auto_118414 - DIRECTION
      ?auto_118415 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_118416 ?auto_118412 ) ( SUPPORTS ?auto_118416 ?auto_118408 ) ( not ( = ?auto_118411 ?auto_118413 ) ) ( HAVE_IMAGE ?auto_118414 ?auto_118415 ) ( not ( = ?auto_118414 ?auto_118411 ) ) ( not ( = ?auto_118414 ?auto_118413 ) ) ( not ( = ?auto_118415 ?auto_118408 ) ) ( CALIBRATION_TARGET ?auto_118416 ?auto_118413 ) ( POWER_AVAIL ?auto_118412 ) ( POINTING ?auto_118412 ?auto_118409 ) ( not ( = ?auto_118413 ?auto_118409 ) ) ( not ( = ?auto_118411 ?auto_118409 ) ) ( not ( = ?auto_118414 ?auto_118409 ) ) ( HAVE_IMAGE ?auto_118409 ?auto_118410 ) ( not ( = ?auto_118410 ?auto_118408 ) ) ( not ( = ?auto_118410 ?auto_118415 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118414 ?auto_118415 ?auto_118411 ?auto_118408 )
      ( GET-2IMAGE-VERIFY ?auto_118409 ?auto_118410 ?auto_118411 ?auto_118408 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_118418 - DIRECTION
      ?auto_118419 - MODE
      ?auto_118420 - DIRECTION
      ?auto_118417 - MODE
    )
    :vars
    (
      ?auto_118424 - INSTRUMENT
      ?auto_118422 - SATELLITE
      ?auto_118423 - DIRECTION
      ?auto_118421 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118424 ?auto_118422 ) ( SUPPORTS ?auto_118424 ?auto_118419 ) ( not ( = ?auto_118418 ?auto_118423 ) ) ( HAVE_IMAGE ?auto_118420 ?auto_118417 ) ( not ( = ?auto_118420 ?auto_118418 ) ) ( not ( = ?auto_118420 ?auto_118423 ) ) ( not ( = ?auto_118417 ?auto_118419 ) ) ( CALIBRATION_TARGET ?auto_118424 ?auto_118423 ) ( POWER_AVAIL ?auto_118422 ) ( POINTING ?auto_118422 ?auto_118421 ) ( not ( = ?auto_118423 ?auto_118421 ) ) ( not ( = ?auto_118418 ?auto_118421 ) ) ( not ( = ?auto_118420 ?auto_118421 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118420 ?auto_118417 ?auto_118418 ?auto_118419 )
      ( GET-2IMAGE-VERIFY ?auto_118418 ?auto_118419 ?auto_118420 ?auto_118417 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_118426 - DIRECTION
      ?auto_118427 - MODE
      ?auto_118428 - DIRECTION
      ?auto_118425 - MODE
    )
    :vars
    (
      ?auto_118433 - INSTRUMENT
      ?auto_118429 - SATELLITE
      ?auto_118430 - DIRECTION
      ?auto_118431 - DIRECTION
      ?auto_118432 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_118433 ?auto_118429 ) ( SUPPORTS ?auto_118433 ?auto_118427 ) ( not ( = ?auto_118426 ?auto_118430 ) ) ( HAVE_IMAGE ?auto_118431 ?auto_118432 ) ( not ( = ?auto_118431 ?auto_118426 ) ) ( not ( = ?auto_118431 ?auto_118430 ) ) ( not ( = ?auto_118432 ?auto_118427 ) ) ( CALIBRATION_TARGET ?auto_118433 ?auto_118430 ) ( POWER_AVAIL ?auto_118429 ) ( POINTING ?auto_118429 ?auto_118428 ) ( not ( = ?auto_118430 ?auto_118428 ) ) ( not ( = ?auto_118426 ?auto_118428 ) ) ( not ( = ?auto_118431 ?auto_118428 ) ) ( HAVE_IMAGE ?auto_118428 ?auto_118425 ) ( not ( = ?auto_118427 ?auto_118425 ) ) ( not ( = ?auto_118425 ?auto_118432 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118431 ?auto_118432 ?auto_118426 ?auto_118427 )
      ( GET-2IMAGE-VERIFY ?auto_118426 ?auto_118427 ?auto_118428 ?auto_118425 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118445 - DIRECTION
      ?auto_118446 - MODE
      ?auto_118447 - DIRECTION
      ?auto_118444 - MODE
      ?auto_118448 - DIRECTION
      ?auto_118449 - MODE
    )
    :vars
    (
      ?auto_118453 - INSTRUMENT
      ?auto_118451 - SATELLITE
      ?auto_118452 - DIRECTION
      ?auto_118450 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118453 ?auto_118451 ) ( SUPPORTS ?auto_118453 ?auto_118449 ) ( not ( = ?auto_118448 ?auto_118452 ) ) ( HAVE_IMAGE ?auto_118447 ?auto_118444 ) ( not ( = ?auto_118447 ?auto_118448 ) ) ( not ( = ?auto_118447 ?auto_118452 ) ) ( not ( = ?auto_118444 ?auto_118449 ) ) ( CALIBRATION_TARGET ?auto_118453 ?auto_118452 ) ( POWER_AVAIL ?auto_118451 ) ( POINTING ?auto_118451 ?auto_118450 ) ( not ( = ?auto_118452 ?auto_118450 ) ) ( not ( = ?auto_118448 ?auto_118450 ) ) ( not ( = ?auto_118447 ?auto_118450 ) ) ( HAVE_IMAGE ?auto_118445 ?auto_118446 ) ( not ( = ?auto_118445 ?auto_118447 ) ) ( not ( = ?auto_118445 ?auto_118448 ) ) ( not ( = ?auto_118445 ?auto_118452 ) ) ( not ( = ?auto_118445 ?auto_118450 ) ) ( not ( = ?auto_118446 ?auto_118444 ) ) ( not ( = ?auto_118446 ?auto_118449 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118447 ?auto_118444 ?auto_118448 ?auto_118449 )
      ( GET-3IMAGE-VERIFY ?auto_118445 ?auto_118446 ?auto_118447 ?auto_118444 ?auto_118448 ?auto_118449 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118455 - DIRECTION
      ?auto_118456 - MODE
      ?auto_118457 - DIRECTION
      ?auto_118454 - MODE
      ?auto_118458 - DIRECTION
      ?auto_118459 - MODE
    )
    :vars
    (
      ?auto_118462 - INSTRUMENT
      ?auto_118460 - SATELLITE
      ?auto_118461 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118462 ?auto_118460 ) ( SUPPORTS ?auto_118462 ?auto_118459 ) ( not ( = ?auto_118458 ?auto_118461 ) ) ( HAVE_IMAGE ?auto_118455 ?auto_118456 ) ( not ( = ?auto_118455 ?auto_118458 ) ) ( not ( = ?auto_118455 ?auto_118461 ) ) ( not ( = ?auto_118456 ?auto_118459 ) ) ( CALIBRATION_TARGET ?auto_118462 ?auto_118461 ) ( POWER_AVAIL ?auto_118460 ) ( POINTING ?auto_118460 ?auto_118457 ) ( not ( = ?auto_118461 ?auto_118457 ) ) ( not ( = ?auto_118458 ?auto_118457 ) ) ( not ( = ?auto_118455 ?auto_118457 ) ) ( HAVE_IMAGE ?auto_118457 ?auto_118454 ) ( not ( = ?auto_118456 ?auto_118454 ) ) ( not ( = ?auto_118454 ?auto_118459 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118455 ?auto_118456 ?auto_118458 ?auto_118459 )
      ( GET-3IMAGE-VERIFY ?auto_118455 ?auto_118456 ?auto_118457 ?auto_118454 ?auto_118458 ?auto_118459 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118464 - DIRECTION
      ?auto_118465 - MODE
      ?auto_118466 - DIRECTION
      ?auto_118463 - MODE
      ?auto_118467 - DIRECTION
      ?auto_118468 - MODE
    )
    :vars
    (
      ?auto_118472 - INSTRUMENT
      ?auto_118470 - SATELLITE
      ?auto_118471 - DIRECTION
      ?auto_118469 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118472 ?auto_118470 ) ( SUPPORTS ?auto_118472 ?auto_118463 ) ( not ( = ?auto_118466 ?auto_118471 ) ) ( HAVE_IMAGE ?auto_118467 ?auto_118468 ) ( not ( = ?auto_118467 ?auto_118466 ) ) ( not ( = ?auto_118467 ?auto_118471 ) ) ( not ( = ?auto_118468 ?auto_118463 ) ) ( CALIBRATION_TARGET ?auto_118472 ?auto_118471 ) ( POWER_AVAIL ?auto_118470 ) ( POINTING ?auto_118470 ?auto_118469 ) ( not ( = ?auto_118471 ?auto_118469 ) ) ( not ( = ?auto_118466 ?auto_118469 ) ) ( not ( = ?auto_118467 ?auto_118469 ) ) ( HAVE_IMAGE ?auto_118464 ?auto_118465 ) ( not ( = ?auto_118464 ?auto_118466 ) ) ( not ( = ?auto_118464 ?auto_118467 ) ) ( not ( = ?auto_118464 ?auto_118471 ) ) ( not ( = ?auto_118464 ?auto_118469 ) ) ( not ( = ?auto_118465 ?auto_118463 ) ) ( not ( = ?auto_118465 ?auto_118468 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118467 ?auto_118468 ?auto_118466 ?auto_118463 )
      ( GET-3IMAGE-VERIFY ?auto_118464 ?auto_118465 ?auto_118466 ?auto_118463 ?auto_118467 ?auto_118468 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118474 - DIRECTION
      ?auto_118475 - MODE
      ?auto_118476 - DIRECTION
      ?auto_118473 - MODE
      ?auto_118477 - DIRECTION
      ?auto_118478 - MODE
    )
    :vars
    (
      ?auto_118481 - INSTRUMENT
      ?auto_118479 - SATELLITE
      ?auto_118480 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118481 ?auto_118479 ) ( SUPPORTS ?auto_118481 ?auto_118473 ) ( not ( = ?auto_118476 ?auto_118480 ) ) ( HAVE_IMAGE ?auto_118474 ?auto_118475 ) ( not ( = ?auto_118474 ?auto_118476 ) ) ( not ( = ?auto_118474 ?auto_118480 ) ) ( not ( = ?auto_118475 ?auto_118473 ) ) ( CALIBRATION_TARGET ?auto_118481 ?auto_118480 ) ( POWER_AVAIL ?auto_118479 ) ( POINTING ?auto_118479 ?auto_118477 ) ( not ( = ?auto_118480 ?auto_118477 ) ) ( not ( = ?auto_118476 ?auto_118477 ) ) ( not ( = ?auto_118474 ?auto_118477 ) ) ( HAVE_IMAGE ?auto_118477 ?auto_118478 ) ( not ( = ?auto_118475 ?auto_118478 ) ) ( not ( = ?auto_118473 ?auto_118478 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118474 ?auto_118475 ?auto_118476 ?auto_118473 )
      ( GET-3IMAGE-VERIFY ?auto_118474 ?auto_118475 ?auto_118476 ?auto_118473 ?auto_118477 ?auto_118478 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118493 - DIRECTION
      ?auto_118494 - MODE
      ?auto_118495 - DIRECTION
      ?auto_118492 - MODE
      ?auto_118496 - DIRECTION
      ?auto_118497 - MODE
    )
    :vars
    (
      ?auto_118500 - INSTRUMENT
      ?auto_118498 - SATELLITE
      ?auto_118499 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118500 ?auto_118498 ) ( SUPPORTS ?auto_118500 ?auto_118497 ) ( not ( = ?auto_118496 ?auto_118499 ) ) ( HAVE_IMAGE ?auto_118495 ?auto_118492 ) ( not ( = ?auto_118495 ?auto_118496 ) ) ( not ( = ?auto_118495 ?auto_118499 ) ) ( not ( = ?auto_118492 ?auto_118497 ) ) ( CALIBRATION_TARGET ?auto_118500 ?auto_118499 ) ( POWER_AVAIL ?auto_118498 ) ( POINTING ?auto_118498 ?auto_118493 ) ( not ( = ?auto_118499 ?auto_118493 ) ) ( not ( = ?auto_118496 ?auto_118493 ) ) ( not ( = ?auto_118495 ?auto_118493 ) ) ( HAVE_IMAGE ?auto_118493 ?auto_118494 ) ( not ( = ?auto_118494 ?auto_118492 ) ) ( not ( = ?auto_118494 ?auto_118497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118495 ?auto_118492 ?auto_118496 ?auto_118497 )
      ( GET-3IMAGE-VERIFY ?auto_118493 ?auto_118494 ?auto_118495 ?auto_118492 ?auto_118496 ?auto_118497 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118502 - DIRECTION
      ?auto_118503 - MODE
      ?auto_118504 - DIRECTION
      ?auto_118501 - MODE
      ?auto_118505 - DIRECTION
      ?auto_118506 - MODE
    )
    :vars
    (
      ?auto_118511 - INSTRUMENT
      ?auto_118507 - SATELLITE
      ?auto_118508 - DIRECTION
      ?auto_118509 - DIRECTION
      ?auto_118510 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_118511 ?auto_118507 ) ( SUPPORTS ?auto_118511 ?auto_118506 ) ( not ( = ?auto_118505 ?auto_118508 ) ) ( HAVE_IMAGE ?auto_118509 ?auto_118510 ) ( not ( = ?auto_118509 ?auto_118505 ) ) ( not ( = ?auto_118509 ?auto_118508 ) ) ( not ( = ?auto_118510 ?auto_118506 ) ) ( CALIBRATION_TARGET ?auto_118511 ?auto_118508 ) ( POWER_AVAIL ?auto_118507 ) ( POINTING ?auto_118507 ?auto_118502 ) ( not ( = ?auto_118508 ?auto_118502 ) ) ( not ( = ?auto_118505 ?auto_118502 ) ) ( not ( = ?auto_118509 ?auto_118502 ) ) ( HAVE_IMAGE ?auto_118502 ?auto_118503 ) ( HAVE_IMAGE ?auto_118504 ?auto_118501 ) ( not ( = ?auto_118502 ?auto_118504 ) ) ( not ( = ?auto_118503 ?auto_118501 ) ) ( not ( = ?auto_118503 ?auto_118506 ) ) ( not ( = ?auto_118503 ?auto_118510 ) ) ( not ( = ?auto_118504 ?auto_118505 ) ) ( not ( = ?auto_118504 ?auto_118508 ) ) ( not ( = ?auto_118504 ?auto_118509 ) ) ( not ( = ?auto_118501 ?auto_118506 ) ) ( not ( = ?auto_118501 ?auto_118510 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118509 ?auto_118510 ?auto_118505 ?auto_118506 )
      ( GET-3IMAGE-VERIFY ?auto_118502 ?auto_118503 ?auto_118504 ?auto_118501 ?auto_118505 ?auto_118506 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118513 - DIRECTION
      ?auto_118514 - MODE
      ?auto_118515 - DIRECTION
      ?auto_118512 - MODE
      ?auto_118516 - DIRECTION
      ?auto_118517 - MODE
    )
    :vars
    (
      ?auto_118520 - INSTRUMENT
      ?auto_118518 - SATELLITE
      ?auto_118519 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118520 ?auto_118518 ) ( SUPPORTS ?auto_118520 ?auto_118512 ) ( not ( = ?auto_118515 ?auto_118519 ) ) ( HAVE_IMAGE ?auto_118516 ?auto_118517 ) ( not ( = ?auto_118516 ?auto_118515 ) ) ( not ( = ?auto_118516 ?auto_118519 ) ) ( not ( = ?auto_118517 ?auto_118512 ) ) ( CALIBRATION_TARGET ?auto_118520 ?auto_118519 ) ( POWER_AVAIL ?auto_118518 ) ( POINTING ?auto_118518 ?auto_118513 ) ( not ( = ?auto_118519 ?auto_118513 ) ) ( not ( = ?auto_118515 ?auto_118513 ) ) ( not ( = ?auto_118516 ?auto_118513 ) ) ( HAVE_IMAGE ?auto_118513 ?auto_118514 ) ( not ( = ?auto_118514 ?auto_118512 ) ) ( not ( = ?auto_118514 ?auto_118517 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118516 ?auto_118517 ?auto_118515 ?auto_118512 )
      ( GET-3IMAGE-VERIFY ?auto_118513 ?auto_118514 ?auto_118515 ?auto_118512 ?auto_118516 ?auto_118517 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118522 - DIRECTION
      ?auto_118523 - MODE
      ?auto_118524 - DIRECTION
      ?auto_118521 - MODE
      ?auto_118525 - DIRECTION
      ?auto_118526 - MODE
    )
    :vars
    (
      ?auto_118531 - INSTRUMENT
      ?auto_118527 - SATELLITE
      ?auto_118528 - DIRECTION
      ?auto_118529 - DIRECTION
      ?auto_118530 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_118531 ?auto_118527 ) ( SUPPORTS ?auto_118531 ?auto_118521 ) ( not ( = ?auto_118524 ?auto_118528 ) ) ( HAVE_IMAGE ?auto_118529 ?auto_118530 ) ( not ( = ?auto_118529 ?auto_118524 ) ) ( not ( = ?auto_118529 ?auto_118528 ) ) ( not ( = ?auto_118530 ?auto_118521 ) ) ( CALIBRATION_TARGET ?auto_118531 ?auto_118528 ) ( POWER_AVAIL ?auto_118527 ) ( POINTING ?auto_118527 ?auto_118522 ) ( not ( = ?auto_118528 ?auto_118522 ) ) ( not ( = ?auto_118524 ?auto_118522 ) ) ( not ( = ?auto_118529 ?auto_118522 ) ) ( HAVE_IMAGE ?auto_118522 ?auto_118523 ) ( HAVE_IMAGE ?auto_118525 ?auto_118526 ) ( not ( = ?auto_118522 ?auto_118525 ) ) ( not ( = ?auto_118523 ?auto_118521 ) ) ( not ( = ?auto_118523 ?auto_118526 ) ) ( not ( = ?auto_118523 ?auto_118530 ) ) ( not ( = ?auto_118524 ?auto_118525 ) ) ( not ( = ?auto_118521 ?auto_118526 ) ) ( not ( = ?auto_118525 ?auto_118528 ) ) ( not ( = ?auto_118525 ?auto_118529 ) ) ( not ( = ?auto_118526 ?auto_118530 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118529 ?auto_118530 ?auto_118524 ?auto_118521 )
      ( GET-3IMAGE-VERIFY ?auto_118522 ?auto_118523 ?auto_118524 ?auto_118521 ?auto_118525 ?auto_118526 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118544 - DIRECTION
      ?auto_118545 - MODE
      ?auto_118546 - DIRECTION
      ?auto_118543 - MODE
      ?auto_118547 - DIRECTION
      ?auto_118548 - MODE
    )
    :vars
    (
      ?auto_118552 - INSTRUMENT
      ?auto_118550 - SATELLITE
      ?auto_118551 - DIRECTION
      ?auto_118549 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118552 ?auto_118550 ) ( SUPPORTS ?auto_118552 ?auto_118545 ) ( not ( = ?auto_118544 ?auto_118551 ) ) ( HAVE_IMAGE ?auto_118546 ?auto_118548 ) ( not ( = ?auto_118546 ?auto_118544 ) ) ( not ( = ?auto_118546 ?auto_118551 ) ) ( not ( = ?auto_118548 ?auto_118545 ) ) ( CALIBRATION_TARGET ?auto_118552 ?auto_118551 ) ( POWER_AVAIL ?auto_118550 ) ( POINTING ?auto_118550 ?auto_118549 ) ( not ( = ?auto_118551 ?auto_118549 ) ) ( not ( = ?auto_118544 ?auto_118549 ) ) ( not ( = ?auto_118546 ?auto_118549 ) ) ( HAVE_IMAGE ?auto_118546 ?auto_118543 ) ( HAVE_IMAGE ?auto_118547 ?auto_118548 ) ( not ( = ?auto_118544 ?auto_118547 ) ) ( not ( = ?auto_118545 ?auto_118543 ) ) ( not ( = ?auto_118546 ?auto_118547 ) ) ( not ( = ?auto_118543 ?auto_118548 ) ) ( not ( = ?auto_118547 ?auto_118551 ) ) ( not ( = ?auto_118547 ?auto_118549 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118546 ?auto_118548 ?auto_118544 ?auto_118545 )
      ( GET-3IMAGE-VERIFY ?auto_118544 ?auto_118545 ?auto_118546 ?auto_118543 ?auto_118547 ?auto_118548 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118554 - DIRECTION
      ?auto_118555 - MODE
      ?auto_118556 - DIRECTION
      ?auto_118553 - MODE
      ?auto_118557 - DIRECTION
      ?auto_118558 - MODE
    )
    :vars
    (
      ?auto_118561 - INSTRUMENT
      ?auto_118559 - SATELLITE
      ?auto_118560 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118561 ?auto_118559 ) ( SUPPORTS ?auto_118561 ?auto_118555 ) ( not ( = ?auto_118554 ?auto_118560 ) ) ( HAVE_IMAGE ?auto_118556 ?auto_118553 ) ( not ( = ?auto_118556 ?auto_118554 ) ) ( not ( = ?auto_118556 ?auto_118560 ) ) ( not ( = ?auto_118553 ?auto_118555 ) ) ( CALIBRATION_TARGET ?auto_118561 ?auto_118560 ) ( POWER_AVAIL ?auto_118559 ) ( POINTING ?auto_118559 ?auto_118557 ) ( not ( = ?auto_118560 ?auto_118557 ) ) ( not ( = ?auto_118554 ?auto_118557 ) ) ( not ( = ?auto_118556 ?auto_118557 ) ) ( HAVE_IMAGE ?auto_118557 ?auto_118558 ) ( not ( = ?auto_118555 ?auto_118558 ) ) ( not ( = ?auto_118553 ?auto_118558 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118556 ?auto_118553 ?auto_118554 ?auto_118555 )
      ( GET-3IMAGE-VERIFY ?auto_118554 ?auto_118555 ?auto_118556 ?auto_118553 ?auto_118557 ?auto_118558 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118573 - DIRECTION
      ?auto_118574 - MODE
      ?auto_118575 - DIRECTION
      ?auto_118572 - MODE
      ?auto_118576 - DIRECTION
      ?auto_118577 - MODE
    )
    :vars
    (
      ?auto_118580 - INSTRUMENT
      ?auto_118578 - SATELLITE
      ?auto_118579 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118580 ?auto_118578 ) ( SUPPORTS ?auto_118580 ?auto_118574 ) ( not ( = ?auto_118573 ?auto_118579 ) ) ( HAVE_IMAGE ?auto_118576 ?auto_118577 ) ( not ( = ?auto_118576 ?auto_118573 ) ) ( not ( = ?auto_118576 ?auto_118579 ) ) ( not ( = ?auto_118577 ?auto_118574 ) ) ( CALIBRATION_TARGET ?auto_118580 ?auto_118579 ) ( POWER_AVAIL ?auto_118578 ) ( POINTING ?auto_118578 ?auto_118575 ) ( not ( = ?auto_118579 ?auto_118575 ) ) ( not ( = ?auto_118573 ?auto_118575 ) ) ( not ( = ?auto_118576 ?auto_118575 ) ) ( HAVE_IMAGE ?auto_118575 ?auto_118572 ) ( not ( = ?auto_118574 ?auto_118572 ) ) ( not ( = ?auto_118572 ?auto_118577 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118576 ?auto_118577 ?auto_118573 ?auto_118574 )
      ( GET-3IMAGE-VERIFY ?auto_118573 ?auto_118574 ?auto_118575 ?auto_118572 ?auto_118576 ?auto_118577 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_118582 - DIRECTION
      ?auto_118583 - MODE
      ?auto_118584 - DIRECTION
      ?auto_118581 - MODE
      ?auto_118585 - DIRECTION
      ?auto_118586 - MODE
    )
    :vars
    (
      ?auto_118591 - INSTRUMENT
      ?auto_118587 - SATELLITE
      ?auto_118588 - DIRECTION
      ?auto_118589 - DIRECTION
      ?auto_118590 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_118591 ?auto_118587 ) ( SUPPORTS ?auto_118591 ?auto_118583 ) ( not ( = ?auto_118582 ?auto_118588 ) ) ( HAVE_IMAGE ?auto_118589 ?auto_118590 ) ( not ( = ?auto_118589 ?auto_118582 ) ) ( not ( = ?auto_118589 ?auto_118588 ) ) ( not ( = ?auto_118590 ?auto_118583 ) ) ( CALIBRATION_TARGET ?auto_118591 ?auto_118588 ) ( POWER_AVAIL ?auto_118587 ) ( POINTING ?auto_118587 ?auto_118585 ) ( not ( = ?auto_118588 ?auto_118585 ) ) ( not ( = ?auto_118582 ?auto_118585 ) ) ( not ( = ?auto_118589 ?auto_118585 ) ) ( HAVE_IMAGE ?auto_118584 ?auto_118581 ) ( HAVE_IMAGE ?auto_118585 ?auto_118586 ) ( not ( = ?auto_118582 ?auto_118584 ) ) ( not ( = ?auto_118583 ?auto_118581 ) ) ( not ( = ?auto_118583 ?auto_118586 ) ) ( not ( = ?auto_118584 ?auto_118585 ) ) ( not ( = ?auto_118584 ?auto_118588 ) ) ( not ( = ?auto_118584 ?auto_118589 ) ) ( not ( = ?auto_118581 ?auto_118586 ) ) ( not ( = ?auto_118581 ?auto_118590 ) ) ( not ( = ?auto_118586 ?auto_118590 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118589 ?auto_118590 ?auto_118582 ?auto_118583 )
      ( GET-3IMAGE-VERIFY ?auto_118582 ?auto_118583 ?auto_118584 ?auto_118581 ?auto_118585 ?auto_118586 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118637 - DIRECTION
      ?auto_118638 - MODE
      ?auto_118639 - DIRECTION
      ?auto_118636 - MODE
      ?auto_118640 - DIRECTION
      ?auto_118641 - MODE
      ?auto_118642 - DIRECTION
      ?auto_118643 - MODE
    )
    :vars
    (
      ?auto_118647 - INSTRUMENT
      ?auto_118645 - SATELLITE
      ?auto_118646 - DIRECTION
      ?auto_118644 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118647 ?auto_118645 ) ( SUPPORTS ?auto_118647 ?auto_118643 ) ( not ( = ?auto_118642 ?auto_118646 ) ) ( HAVE_IMAGE ?auto_118639 ?auto_118638 ) ( not ( = ?auto_118639 ?auto_118642 ) ) ( not ( = ?auto_118639 ?auto_118646 ) ) ( not ( = ?auto_118638 ?auto_118643 ) ) ( CALIBRATION_TARGET ?auto_118647 ?auto_118646 ) ( POWER_AVAIL ?auto_118645 ) ( POINTING ?auto_118645 ?auto_118644 ) ( not ( = ?auto_118646 ?auto_118644 ) ) ( not ( = ?auto_118642 ?auto_118644 ) ) ( not ( = ?auto_118639 ?auto_118644 ) ) ( HAVE_IMAGE ?auto_118637 ?auto_118638 ) ( HAVE_IMAGE ?auto_118639 ?auto_118636 ) ( HAVE_IMAGE ?auto_118640 ?auto_118641 ) ( not ( = ?auto_118637 ?auto_118639 ) ) ( not ( = ?auto_118637 ?auto_118640 ) ) ( not ( = ?auto_118637 ?auto_118642 ) ) ( not ( = ?auto_118637 ?auto_118646 ) ) ( not ( = ?auto_118637 ?auto_118644 ) ) ( not ( = ?auto_118638 ?auto_118636 ) ) ( not ( = ?auto_118638 ?auto_118641 ) ) ( not ( = ?auto_118639 ?auto_118640 ) ) ( not ( = ?auto_118636 ?auto_118641 ) ) ( not ( = ?auto_118636 ?auto_118643 ) ) ( not ( = ?auto_118640 ?auto_118642 ) ) ( not ( = ?auto_118640 ?auto_118646 ) ) ( not ( = ?auto_118640 ?auto_118644 ) ) ( not ( = ?auto_118641 ?auto_118643 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118639 ?auto_118638 ?auto_118642 ?auto_118643 )
      ( GET-4IMAGE-VERIFY ?auto_118637 ?auto_118638 ?auto_118639 ?auto_118636 ?auto_118640 ?auto_118641 ?auto_118642 ?auto_118643 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118649 - DIRECTION
      ?auto_118650 - MODE
      ?auto_118651 - DIRECTION
      ?auto_118648 - MODE
      ?auto_118652 - DIRECTION
      ?auto_118653 - MODE
      ?auto_118654 - DIRECTION
      ?auto_118655 - MODE
    )
    :vars
    (
      ?auto_118658 - INSTRUMENT
      ?auto_118656 - SATELLITE
      ?auto_118657 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118658 ?auto_118656 ) ( SUPPORTS ?auto_118658 ?auto_118655 ) ( not ( = ?auto_118654 ?auto_118657 ) ) ( HAVE_IMAGE ?auto_118649 ?auto_118650 ) ( not ( = ?auto_118649 ?auto_118654 ) ) ( not ( = ?auto_118649 ?auto_118657 ) ) ( not ( = ?auto_118650 ?auto_118655 ) ) ( CALIBRATION_TARGET ?auto_118658 ?auto_118657 ) ( POWER_AVAIL ?auto_118656 ) ( POINTING ?auto_118656 ?auto_118652 ) ( not ( = ?auto_118657 ?auto_118652 ) ) ( not ( = ?auto_118654 ?auto_118652 ) ) ( not ( = ?auto_118649 ?auto_118652 ) ) ( HAVE_IMAGE ?auto_118651 ?auto_118648 ) ( HAVE_IMAGE ?auto_118652 ?auto_118653 ) ( not ( = ?auto_118649 ?auto_118651 ) ) ( not ( = ?auto_118650 ?auto_118648 ) ) ( not ( = ?auto_118650 ?auto_118653 ) ) ( not ( = ?auto_118651 ?auto_118652 ) ) ( not ( = ?auto_118651 ?auto_118654 ) ) ( not ( = ?auto_118651 ?auto_118657 ) ) ( not ( = ?auto_118648 ?auto_118653 ) ) ( not ( = ?auto_118648 ?auto_118655 ) ) ( not ( = ?auto_118653 ?auto_118655 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118649 ?auto_118650 ?auto_118654 ?auto_118655 )
      ( GET-4IMAGE-VERIFY ?auto_118649 ?auto_118650 ?auto_118651 ?auto_118648 ?auto_118652 ?auto_118653 ?auto_118654 ?auto_118655 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118660 - DIRECTION
      ?auto_118661 - MODE
      ?auto_118662 - DIRECTION
      ?auto_118659 - MODE
      ?auto_118663 - DIRECTION
      ?auto_118664 - MODE
      ?auto_118665 - DIRECTION
      ?auto_118666 - MODE
    )
    :vars
    (
      ?auto_118670 - INSTRUMENT
      ?auto_118668 - SATELLITE
      ?auto_118669 - DIRECTION
      ?auto_118667 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118670 ?auto_118668 ) ( SUPPORTS ?auto_118670 ?auto_118664 ) ( not ( = ?auto_118663 ?auto_118669 ) ) ( HAVE_IMAGE ?auto_118662 ?auto_118666 ) ( not ( = ?auto_118662 ?auto_118663 ) ) ( not ( = ?auto_118662 ?auto_118669 ) ) ( not ( = ?auto_118666 ?auto_118664 ) ) ( CALIBRATION_TARGET ?auto_118670 ?auto_118669 ) ( POWER_AVAIL ?auto_118668 ) ( POINTING ?auto_118668 ?auto_118667 ) ( not ( = ?auto_118669 ?auto_118667 ) ) ( not ( = ?auto_118663 ?auto_118667 ) ) ( not ( = ?auto_118662 ?auto_118667 ) ) ( HAVE_IMAGE ?auto_118660 ?auto_118661 ) ( HAVE_IMAGE ?auto_118662 ?auto_118659 ) ( HAVE_IMAGE ?auto_118665 ?auto_118666 ) ( not ( = ?auto_118660 ?auto_118662 ) ) ( not ( = ?auto_118660 ?auto_118663 ) ) ( not ( = ?auto_118660 ?auto_118665 ) ) ( not ( = ?auto_118660 ?auto_118669 ) ) ( not ( = ?auto_118660 ?auto_118667 ) ) ( not ( = ?auto_118661 ?auto_118659 ) ) ( not ( = ?auto_118661 ?auto_118664 ) ) ( not ( = ?auto_118661 ?auto_118666 ) ) ( not ( = ?auto_118662 ?auto_118665 ) ) ( not ( = ?auto_118659 ?auto_118664 ) ) ( not ( = ?auto_118659 ?auto_118666 ) ) ( not ( = ?auto_118663 ?auto_118665 ) ) ( not ( = ?auto_118665 ?auto_118669 ) ) ( not ( = ?auto_118665 ?auto_118667 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118662 ?auto_118666 ?auto_118663 ?auto_118664 )
      ( GET-4IMAGE-VERIFY ?auto_118660 ?auto_118661 ?auto_118662 ?auto_118659 ?auto_118663 ?auto_118664 ?auto_118665 ?auto_118666 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118672 - DIRECTION
      ?auto_118673 - MODE
      ?auto_118674 - DIRECTION
      ?auto_118671 - MODE
      ?auto_118675 - DIRECTION
      ?auto_118676 - MODE
      ?auto_118677 - DIRECTION
      ?auto_118678 - MODE
    )
    :vars
    (
      ?auto_118681 - INSTRUMENT
      ?auto_118679 - SATELLITE
      ?auto_118680 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118681 ?auto_118679 ) ( SUPPORTS ?auto_118681 ?auto_118676 ) ( not ( = ?auto_118675 ?auto_118680 ) ) ( HAVE_IMAGE ?auto_118674 ?auto_118673 ) ( not ( = ?auto_118674 ?auto_118675 ) ) ( not ( = ?auto_118674 ?auto_118680 ) ) ( not ( = ?auto_118673 ?auto_118676 ) ) ( CALIBRATION_TARGET ?auto_118681 ?auto_118680 ) ( POWER_AVAIL ?auto_118679 ) ( POINTING ?auto_118679 ?auto_118677 ) ( not ( = ?auto_118680 ?auto_118677 ) ) ( not ( = ?auto_118675 ?auto_118677 ) ) ( not ( = ?auto_118674 ?auto_118677 ) ) ( HAVE_IMAGE ?auto_118672 ?auto_118673 ) ( HAVE_IMAGE ?auto_118674 ?auto_118671 ) ( HAVE_IMAGE ?auto_118677 ?auto_118678 ) ( not ( = ?auto_118672 ?auto_118674 ) ) ( not ( = ?auto_118672 ?auto_118675 ) ) ( not ( = ?auto_118672 ?auto_118677 ) ) ( not ( = ?auto_118672 ?auto_118680 ) ) ( not ( = ?auto_118673 ?auto_118671 ) ) ( not ( = ?auto_118673 ?auto_118678 ) ) ( not ( = ?auto_118671 ?auto_118676 ) ) ( not ( = ?auto_118671 ?auto_118678 ) ) ( not ( = ?auto_118676 ?auto_118678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118674 ?auto_118673 ?auto_118675 ?auto_118676 )
      ( GET-4IMAGE-VERIFY ?auto_118672 ?auto_118673 ?auto_118674 ?auto_118671 ?auto_118675 ?auto_118676 ?auto_118677 ?auto_118678 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118695 - DIRECTION
      ?auto_118696 - MODE
      ?auto_118697 - DIRECTION
      ?auto_118694 - MODE
      ?auto_118698 - DIRECTION
      ?auto_118699 - MODE
      ?auto_118700 - DIRECTION
      ?auto_118701 - MODE
    )
    :vars
    (
      ?auto_118704 - INSTRUMENT
      ?auto_118702 - SATELLITE
      ?auto_118703 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118704 ?auto_118702 ) ( SUPPORTS ?auto_118704 ?auto_118701 ) ( not ( = ?auto_118700 ?auto_118703 ) ) ( HAVE_IMAGE ?auto_118698 ?auto_118699 ) ( not ( = ?auto_118698 ?auto_118700 ) ) ( not ( = ?auto_118698 ?auto_118703 ) ) ( not ( = ?auto_118699 ?auto_118701 ) ) ( CALIBRATION_TARGET ?auto_118704 ?auto_118703 ) ( POWER_AVAIL ?auto_118702 ) ( POINTING ?auto_118702 ?auto_118697 ) ( not ( = ?auto_118703 ?auto_118697 ) ) ( not ( = ?auto_118700 ?auto_118697 ) ) ( not ( = ?auto_118698 ?auto_118697 ) ) ( HAVE_IMAGE ?auto_118695 ?auto_118696 ) ( HAVE_IMAGE ?auto_118697 ?auto_118694 ) ( not ( = ?auto_118695 ?auto_118697 ) ) ( not ( = ?auto_118695 ?auto_118698 ) ) ( not ( = ?auto_118695 ?auto_118700 ) ) ( not ( = ?auto_118695 ?auto_118703 ) ) ( not ( = ?auto_118696 ?auto_118694 ) ) ( not ( = ?auto_118696 ?auto_118699 ) ) ( not ( = ?auto_118696 ?auto_118701 ) ) ( not ( = ?auto_118694 ?auto_118699 ) ) ( not ( = ?auto_118694 ?auto_118701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118698 ?auto_118699 ?auto_118700 ?auto_118701 )
      ( GET-4IMAGE-VERIFY ?auto_118695 ?auto_118696 ?auto_118697 ?auto_118694 ?auto_118698 ?auto_118699 ?auto_118700 ?auto_118701 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118717 - DIRECTION
      ?auto_118718 - MODE
      ?auto_118719 - DIRECTION
      ?auto_118716 - MODE
      ?auto_118720 - DIRECTION
      ?auto_118721 - MODE
      ?auto_118722 - DIRECTION
      ?auto_118723 - MODE
    )
    :vars
    (
      ?auto_118726 - INSTRUMENT
      ?auto_118724 - SATELLITE
      ?auto_118725 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118726 ?auto_118724 ) ( SUPPORTS ?auto_118726 ?auto_118721 ) ( not ( = ?auto_118720 ?auto_118725 ) ) ( HAVE_IMAGE ?auto_118717 ?auto_118723 ) ( not ( = ?auto_118717 ?auto_118720 ) ) ( not ( = ?auto_118717 ?auto_118725 ) ) ( not ( = ?auto_118723 ?auto_118721 ) ) ( CALIBRATION_TARGET ?auto_118726 ?auto_118725 ) ( POWER_AVAIL ?auto_118724 ) ( POINTING ?auto_118724 ?auto_118719 ) ( not ( = ?auto_118725 ?auto_118719 ) ) ( not ( = ?auto_118720 ?auto_118719 ) ) ( not ( = ?auto_118717 ?auto_118719 ) ) ( HAVE_IMAGE ?auto_118717 ?auto_118718 ) ( HAVE_IMAGE ?auto_118719 ?auto_118716 ) ( HAVE_IMAGE ?auto_118722 ?auto_118723 ) ( not ( = ?auto_118717 ?auto_118722 ) ) ( not ( = ?auto_118718 ?auto_118716 ) ) ( not ( = ?auto_118718 ?auto_118721 ) ) ( not ( = ?auto_118718 ?auto_118723 ) ) ( not ( = ?auto_118719 ?auto_118722 ) ) ( not ( = ?auto_118716 ?auto_118721 ) ) ( not ( = ?auto_118716 ?auto_118723 ) ) ( not ( = ?auto_118720 ?auto_118722 ) ) ( not ( = ?auto_118722 ?auto_118725 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118717 ?auto_118723 ?auto_118720 ?auto_118721 )
      ( GET-4IMAGE-VERIFY ?auto_118717 ?auto_118718 ?auto_118719 ?auto_118716 ?auto_118720 ?auto_118721 ?auto_118722 ?auto_118723 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118728 - DIRECTION
      ?auto_118729 - MODE
      ?auto_118730 - DIRECTION
      ?auto_118727 - MODE
      ?auto_118731 - DIRECTION
      ?auto_118732 - MODE
      ?auto_118733 - DIRECTION
      ?auto_118734 - MODE
    )
    :vars
    (
      ?auto_118737 - INSTRUMENT
      ?auto_118735 - SATELLITE
      ?auto_118736 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118737 ?auto_118735 ) ( SUPPORTS ?auto_118737 ?auto_118732 ) ( not ( = ?auto_118731 ?auto_118736 ) ) ( HAVE_IMAGE ?auto_118728 ?auto_118729 ) ( not ( = ?auto_118728 ?auto_118731 ) ) ( not ( = ?auto_118728 ?auto_118736 ) ) ( not ( = ?auto_118729 ?auto_118732 ) ) ( CALIBRATION_TARGET ?auto_118737 ?auto_118736 ) ( POWER_AVAIL ?auto_118735 ) ( POINTING ?auto_118735 ?auto_118730 ) ( not ( = ?auto_118736 ?auto_118730 ) ) ( not ( = ?auto_118731 ?auto_118730 ) ) ( not ( = ?auto_118728 ?auto_118730 ) ) ( HAVE_IMAGE ?auto_118730 ?auto_118727 ) ( HAVE_IMAGE ?auto_118733 ?auto_118734 ) ( not ( = ?auto_118728 ?auto_118733 ) ) ( not ( = ?auto_118729 ?auto_118727 ) ) ( not ( = ?auto_118729 ?auto_118734 ) ) ( not ( = ?auto_118730 ?auto_118733 ) ) ( not ( = ?auto_118727 ?auto_118732 ) ) ( not ( = ?auto_118727 ?auto_118734 ) ) ( not ( = ?auto_118731 ?auto_118733 ) ) ( not ( = ?auto_118732 ?auto_118734 ) ) ( not ( = ?auto_118733 ?auto_118736 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118728 ?auto_118729 ?auto_118731 ?auto_118732 )
      ( GET-4IMAGE-VERIFY ?auto_118728 ?auto_118729 ?auto_118730 ?auto_118727 ?auto_118731 ?auto_118732 ?auto_118733 ?auto_118734 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118750 - DIRECTION
      ?auto_118751 - MODE
      ?auto_118752 - DIRECTION
      ?auto_118749 - MODE
      ?auto_118753 - DIRECTION
      ?auto_118754 - MODE
      ?auto_118755 - DIRECTION
      ?auto_118756 - MODE
    )
    :vars
    (
      ?auto_118760 - INSTRUMENT
      ?auto_118758 - SATELLITE
      ?auto_118759 - DIRECTION
      ?auto_118757 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118760 ?auto_118758 ) ( SUPPORTS ?auto_118760 ?auto_118749 ) ( not ( = ?auto_118752 ?auto_118759 ) ) ( HAVE_IMAGE ?auto_118750 ?auto_118756 ) ( not ( = ?auto_118750 ?auto_118752 ) ) ( not ( = ?auto_118750 ?auto_118759 ) ) ( not ( = ?auto_118756 ?auto_118749 ) ) ( CALIBRATION_TARGET ?auto_118760 ?auto_118759 ) ( POWER_AVAIL ?auto_118758 ) ( POINTING ?auto_118758 ?auto_118757 ) ( not ( = ?auto_118759 ?auto_118757 ) ) ( not ( = ?auto_118752 ?auto_118757 ) ) ( not ( = ?auto_118750 ?auto_118757 ) ) ( HAVE_IMAGE ?auto_118750 ?auto_118751 ) ( HAVE_IMAGE ?auto_118753 ?auto_118754 ) ( HAVE_IMAGE ?auto_118755 ?auto_118756 ) ( not ( = ?auto_118750 ?auto_118753 ) ) ( not ( = ?auto_118750 ?auto_118755 ) ) ( not ( = ?auto_118751 ?auto_118749 ) ) ( not ( = ?auto_118751 ?auto_118754 ) ) ( not ( = ?auto_118751 ?auto_118756 ) ) ( not ( = ?auto_118752 ?auto_118753 ) ) ( not ( = ?auto_118752 ?auto_118755 ) ) ( not ( = ?auto_118749 ?auto_118754 ) ) ( not ( = ?auto_118753 ?auto_118755 ) ) ( not ( = ?auto_118753 ?auto_118759 ) ) ( not ( = ?auto_118753 ?auto_118757 ) ) ( not ( = ?auto_118754 ?auto_118756 ) ) ( not ( = ?auto_118755 ?auto_118759 ) ) ( not ( = ?auto_118755 ?auto_118757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118750 ?auto_118756 ?auto_118752 ?auto_118749 )
      ( GET-4IMAGE-VERIFY ?auto_118750 ?auto_118751 ?auto_118752 ?auto_118749 ?auto_118753 ?auto_118754 ?auto_118755 ?auto_118756 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118762 - DIRECTION
      ?auto_118763 - MODE
      ?auto_118764 - DIRECTION
      ?auto_118761 - MODE
      ?auto_118765 - DIRECTION
      ?auto_118766 - MODE
      ?auto_118767 - DIRECTION
      ?auto_118768 - MODE
    )
    :vars
    (
      ?auto_118771 - INSTRUMENT
      ?auto_118769 - SATELLITE
      ?auto_118770 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118771 ?auto_118769 ) ( SUPPORTS ?auto_118771 ?auto_118761 ) ( not ( = ?auto_118764 ?auto_118770 ) ) ( HAVE_IMAGE ?auto_118765 ?auto_118766 ) ( not ( = ?auto_118765 ?auto_118764 ) ) ( not ( = ?auto_118765 ?auto_118770 ) ) ( not ( = ?auto_118766 ?auto_118761 ) ) ( CALIBRATION_TARGET ?auto_118771 ?auto_118770 ) ( POWER_AVAIL ?auto_118769 ) ( POINTING ?auto_118769 ?auto_118767 ) ( not ( = ?auto_118770 ?auto_118767 ) ) ( not ( = ?auto_118764 ?auto_118767 ) ) ( not ( = ?auto_118765 ?auto_118767 ) ) ( HAVE_IMAGE ?auto_118762 ?auto_118763 ) ( HAVE_IMAGE ?auto_118767 ?auto_118768 ) ( not ( = ?auto_118762 ?auto_118764 ) ) ( not ( = ?auto_118762 ?auto_118765 ) ) ( not ( = ?auto_118762 ?auto_118767 ) ) ( not ( = ?auto_118762 ?auto_118770 ) ) ( not ( = ?auto_118763 ?auto_118761 ) ) ( not ( = ?auto_118763 ?auto_118766 ) ) ( not ( = ?auto_118763 ?auto_118768 ) ) ( not ( = ?auto_118761 ?auto_118768 ) ) ( not ( = ?auto_118766 ?auto_118768 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118765 ?auto_118766 ?auto_118764 ?auto_118761 )
      ( GET-4IMAGE-VERIFY ?auto_118762 ?auto_118763 ?auto_118764 ?auto_118761 ?auto_118765 ?auto_118766 ?auto_118767 ?auto_118768 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118785 - DIRECTION
      ?auto_118786 - MODE
      ?auto_118787 - DIRECTION
      ?auto_118784 - MODE
      ?auto_118788 - DIRECTION
      ?auto_118789 - MODE
      ?auto_118790 - DIRECTION
      ?auto_118791 - MODE
    )
    :vars
    (
      ?auto_118794 - INSTRUMENT
      ?auto_118792 - SATELLITE
      ?auto_118793 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118794 ?auto_118792 ) ( SUPPORTS ?auto_118794 ?auto_118784 ) ( not ( = ?auto_118787 ?auto_118793 ) ) ( HAVE_IMAGE ?auto_118790 ?auto_118791 ) ( not ( = ?auto_118790 ?auto_118787 ) ) ( not ( = ?auto_118790 ?auto_118793 ) ) ( not ( = ?auto_118791 ?auto_118784 ) ) ( CALIBRATION_TARGET ?auto_118794 ?auto_118793 ) ( POWER_AVAIL ?auto_118792 ) ( POINTING ?auto_118792 ?auto_118788 ) ( not ( = ?auto_118793 ?auto_118788 ) ) ( not ( = ?auto_118787 ?auto_118788 ) ) ( not ( = ?auto_118790 ?auto_118788 ) ) ( HAVE_IMAGE ?auto_118785 ?auto_118786 ) ( HAVE_IMAGE ?auto_118788 ?auto_118789 ) ( not ( = ?auto_118785 ?auto_118787 ) ) ( not ( = ?auto_118785 ?auto_118788 ) ) ( not ( = ?auto_118785 ?auto_118790 ) ) ( not ( = ?auto_118785 ?auto_118793 ) ) ( not ( = ?auto_118786 ?auto_118784 ) ) ( not ( = ?auto_118786 ?auto_118789 ) ) ( not ( = ?auto_118786 ?auto_118791 ) ) ( not ( = ?auto_118784 ?auto_118789 ) ) ( not ( = ?auto_118789 ?auto_118791 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118790 ?auto_118791 ?auto_118787 ?auto_118784 )
      ( GET-4IMAGE-VERIFY ?auto_118785 ?auto_118786 ?auto_118787 ?auto_118784 ?auto_118788 ?auto_118789 ?auto_118790 ?auto_118791 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118796 - DIRECTION
      ?auto_118797 - MODE
      ?auto_118798 - DIRECTION
      ?auto_118795 - MODE
      ?auto_118799 - DIRECTION
      ?auto_118800 - MODE
      ?auto_118801 - DIRECTION
      ?auto_118802 - MODE
    )
    :vars
    (
      ?auto_118805 - INSTRUMENT
      ?auto_118803 - SATELLITE
      ?auto_118804 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118805 ?auto_118803 ) ( SUPPORTS ?auto_118805 ?auto_118795 ) ( not ( = ?auto_118798 ?auto_118804 ) ) ( HAVE_IMAGE ?auto_118796 ?auto_118797 ) ( not ( = ?auto_118796 ?auto_118798 ) ) ( not ( = ?auto_118796 ?auto_118804 ) ) ( not ( = ?auto_118797 ?auto_118795 ) ) ( CALIBRATION_TARGET ?auto_118805 ?auto_118804 ) ( POWER_AVAIL ?auto_118803 ) ( POINTING ?auto_118803 ?auto_118799 ) ( not ( = ?auto_118804 ?auto_118799 ) ) ( not ( = ?auto_118798 ?auto_118799 ) ) ( not ( = ?auto_118796 ?auto_118799 ) ) ( HAVE_IMAGE ?auto_118799 ?auto_118800 ) ( HAVE_IMAGE ?auto_118801 ?auto_118802 ) ( not ( = ?auto_118796 ?auto_118801 ) ) ( not ( = ?auto_118797 ?auto_118800 ) ) ( not ( = ?auto_118797 ?auto_118802 ) ) ( not ( = ?auto_118798 ?auto_118801 ) ) ( not ( = ?auto_118795 ?auto_118800 ) ) ( not ( = ?auto_118795 ?auto_118802 ) ) ( not ( = ?auto_118799 ?auto_118801 ) ) ( not ( = ?auto_118800 ?auto_118802 ) ) ( not ( = ?auto_118801 ?auto_118804 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118796 ?auto_118797 ?auto_118798 ?auto_118795 )
      ( GET-4IMAGE-VERIFY ?auto_118796 ?auto_118797 ?auto_118798 ?auto_118795 ?auto_118799 ?auto_118800 ?auto_118801 ?auto_118802 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118853 - DIRECTION
      ?auto_118854 - MODE
      ?auto_118855 - DIRECTION
      ?auto_118852 - MODE
      ?auto_118856 - DIRECTION
      ?auto_118857 - MODE
      ?auto_118858 - DIRECTION
      ?auto_118859 - MODE
    )
    :vars
    (
      ?auto_118862 - INSTRUMENT
      ?auto_118860 - SATELLITE
      ?auto_118861 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118862 ?auto_118860 ) ( SUPPORTS ?auto_118862 ?auto_118859 ) ( not ( = ?auto_118858 ?auto_118861 ) ) ( HAVE_IMAGE ?auto_118856 ?auto_118852 ) ( not ( = ?auto_118856 ?auto_118858 ) ) ( not ( = ?auto_118856 ?auto_118861 ) ) ( not ( = ?auto_118852 ?auto_118859 ) ) ( CALIBRATION_TARGET ?auto_118862 ?auto_118861 ) ( POWER_AVAIL ?auto_118860 ) ( POINTING ?auto_118860 ?auto_118853 ) ( not ( = ?auto_118861 ?auto_118853 ) ) ( not ( = ?auto_118858 ?auto_118853 ) ) ( not ( = ?auto_118856 ?auto_118853 ) ) ( HAVE_IMAGE ?auto_118853 ?auto_118854 ) ( HAVE_IMAGE ?auto_118855 ?auto_118852 ) ( HAVE_IMAGE ?auto_118856 ?auto_118857 ) ( not ( = ?auto_118853 ?auto_118855 ) ) ( not ( = ?auto_118854 ?auto_118852 ) ) ( not ( = ?auto_118854 ?auto_118857 ) ) ( not ( = ?auto_118854 ?auto_118859 ) ) ( not ( = ?auto_118855 ?auto_118856 ) ) ( not ( = ?auto_118855 ?auto_118858 ) ) ( not ( = ?auto_118855 ?auto_118861 ) ) ( not ( = ?auto_118852 ?auto_118857 ) ) ( not ( = ?auto_118857 ?auto_118859 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118856 ?auto_118852 ?auto_118858 ?auto_118859 )
      ( GET-4IMAGE-VERIFY ?auto_118853 ?auto_118854 ?auto_118855 ?auto_118852 ?auto_118856 ?auto_118857 ?auto_118858 ?auto_118859 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118864 - DIRECTION
      ?auto_118865 - MODE
      ?auto_118866 - DIRECTION
      ?auto_118863 - MODE
      ?auto_118867 - DIRECTION
      ?auto_118868 - MODE
      ?auto_118869 - DIRECTION
      ?auto_118870 - MODE
    )
    :vars
    (
      ?auto_118873 - INSTRUMENT
      ?auto_118871 - SATELLITE
      ?auto_118872 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118873 ?auto_118871 ) ( SUPPORTS ?auto_118873 ?auto_118870 ) ( not ( = ?auto_118869 ?auto_118872 ) ) ( HAVE_IMAGE ?auto_118866 ?auto_118863 ) ( not ( = ?auto_118866 ?auto_118869 ) ) ( not ( = ?auto_118866 ?auto_118872 ) ) ( not ( = ?auto_118863 ?auto_118870 ) ) ( CALIBRATION_TARGET ?auto_118873 ?auto_118872 ) ( POWER_AVAIL ?auto_118871 ) ( POINTING ?auto_118871 ?auto_118867 ) ( not ( = ?auto_118872 ?auto_118867 ) ) ( not ( = ?auto_118869 ?auto_118867 ) ) ( not ( = ?auto_118866 ?auto_118867 ) ) ( HAVE_IMAGE ?auto_118864 ?auto_118865 ) ( HAVE_IMAGE ?auto_118867 ?auto_118868 ) ( not ( = ?auto_118864 ?auto_118866 ) ) ( not ( = ?auto_118864 ?auto_118867 ) ) ( not ( = ?auto_118864 ?auto_118869 ) ) ( not ( = ?auto_118864 ?auto_118872 ) ) ( not ( = ?auto_118865 ?auto_118863 ) ) ( not ( = ?auto_118865 ?auto_118868 ) ) ( not ( = ?auto_118865 ?auto_118870 ) ) ( not ( = ?auto_118863 ?auto_118868 ) ) ( not ( = ?auto_118868 ?auto_118870 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118866 ?auto_118863 ?auto_118869 ?auto_118870 )
      ( GET-4IMAGE-VERIFY ?auto_118864 ?auto_118865 ?auto_118866 ?auto_118863 ?auto_118867 ?auto_118868 ?auto_118869 ?auto_118870 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118875 - DIRECTION
      ?auto_118876 - MODE
      ?auto_118877 - DIRECTION
      ?auto_118874 - MODE
      ?auto_118878 - DIRECTION
      ?auto_118879 - MODE
      ?auto_118880 - DIRECTION
      ?auto_118881 - MODE
    )
    :vars
    (
      ?auto_118884 - INSTRUMENT
      ?auto_118882 - SATELLITE
      ?auto_118883 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118884 ?auto_118882 ) ( SUPPORTS ?auto_118884 ?auto_118879 ) ( not ( = ?auto_118878 ?auto_118883 ) ) ( HAVE_IMAGE ?auto_118877 ?auto_118881 ) ( not ( = ?auto_118877 ?auto_118878 ) ) ( not ( = ?auto_118877 ?auto_118883 ) ) ( not ( = ?auto_118881 ?auto_118879 ) ) ( CALIBRATION_TARGET ?auto_118884 ?auto_118883 ) ( POWER_AVAIL ?auto_118882 ) ( POINTING ?auto_118882 ?auto_118875 ) ( not ( = ?auto_118883 ?auto_118875 ) ) ( not ( = ?auto_118878 ?auto_118875 ) ) ( not ( = ?auto_118877 ?auto_118875 ) ) ( HAVE_IMAGE ?auto_118875 ?auto_118876 ) ( HAVE_IMAGE ?auto_118877 ?auto_118874 ) ( HAVE_IMAGE ?auto_118880 ?auto_118881 ) ( not ( = ?auto_118875 ?auto_118880 ) ) ( not ( = ?auto_118876 ?auto_118874 ) ) ( not ( = ?auto_118876 ?auto_118879 ) ) ( not ( = ?auto_118876 ?auto_118881 ) ) ( not ( = ?auto_118877 ?auto_118880 ) ) ( not ( = ?auto_118874 ?auto_118879 ) ) ( not ( = ?auto_118874 ?auto_118881 ) ) ( not ( = ?auto_118878 ?auto_118880 ) ) ( not ( = ?auto_118880 ?auto_118883 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118877 ?auto_118881 ?auto_118878 ?auto_118879 )
      ( GET-4IMAGE-VERIFY ?auto_118875 ?auto_118876 ?auto_118877 ?auto_118874 ?auto_118878 ?auto_118879 ?auto_118880 ?auto_118881 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118886 - DIRECTION
      ?auto_118887 - MODE
      ?auto_118888 - DIRECTION
      ?auto_118885 - MODE
      ?auto_118889 - DIRECTION
      ?auto_118890 - MODE
      ?auto_118891 - DIRECTION
      ?auto_118892 - MODE
    )
    :vars
    (
      ?auto_118895 - INSTRUMENT
      ?auto_118893 - SATELLITE
      ?auto_118894 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118895 ?auto_118893 ) ( SUPPORTS ?auto_118895 ?auto_118890 ) ( not ( = ?auto_118889 ?auto_118894 ) ) ( HAVE_IMAGE ?auto_118888 ?auto_118885 ) ( not ( = ?auto_118888 ?auto_118889 ) ) ( not ( = ?auto_118888 ?auto_118894 ) ) ( not ( = ?auto_118885 ?auto_118890 ) ) ( CALIBRATION_TARGET ?auto_118895 ?auto_118894 ) ( POWER_AVAIL ?auto_118893 ) ( POINTING ?auto_118893 ?auto_118886 ) ( not ( = ?auto_118894 ?auto_118886 ) ) ( not ( = ?auto_118889 ?auto_118886 ) ) ( not ( = ?auto_118888 ?auto_118886 ) ) ( HAVE_IMAGE ?auto_118886 ?auto_118887 ) ( HAVE_IMAGE ?auto_118891 ?auto_118892 ) ( not ( = ?auto_118886 ?auto_118891 ) ) ( not ( = ?auto_118887 ?auto_118885 ) ) ( not ( = ?auto_118887 ?auto_118890 ) ) ( not ( = ?auto_118887 ?auto_118892 ) ) ( not ( = ?auto_118888 ?auto_118891 ) ) ( not ( = ?auto_118885 ?auto_118892 ) ) ( not ( = ?auto_118889 ?auto_118891 ) ) ( not ( = ?auto_118890 ?auto_118892 ) ) ( not ( = ?auto_118891 ?auto_118894 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118888 ?auto_118885 ?auto_118889 ?auto_118890 )
      ( GET-4IMAGE-VERIFY ?auto_118886 ?auto_118887 ?auto_118888 ?auto_118885 ?auto_118889 ?auto_118890 ?auto_118891 ?auto_118892 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118908 - DIRECTION
      ?auto_118909 - MODE
      ?auto_118910 - DIRECTION
      ?auto_118907 - MODE
      ?auto_118911 - DIRECTION
      ?auto_118912 - MODE
      ?auto_118913 - DIRECTION
      ?auto_118914 - MODE
    )
    :vars
    (
      ?auto_118917 - INSTRUMENT
      ?auto_118915 - SATELLITE
      ?auto_118916 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118917 ?auto_118915 ) ( SUPPORTS ?auto_118917 ?auto_118914 ) ( not ( = ?auto_118913 ?auto_118916 ) ) ( HAVE_IMAGE ?auto_118911 ?auto_118912 ) ( not ( = ?auto_118911 ?auto_118913 ) ) ( not ( = ?auto_118911 ?auto_118916 ) ) ( not ( = ?auto_118912 ?auto_118914 ) ) ( CALIBRATION_TARGET ?auto_118917 ?auto_118916 ) ( POWER_AVAIL ?auto_118915 ) ( POINTING ?auto_118915 ?auto_118908 ) ( not ( = ?auto_118916 ?auto_118908 ) ) ( not ( = ?auto_118913 ?auto_118908 ) ) ( not ( = ?auto_118911 ?auto_118908 ) ) ( HAVE_IMAGE ?auto_118908 ?auto_118909 ) ( HAVE_IMAGE ?auto_118910 ?auto_118907 ) ( not ( = ?auto_118908 ?auto_118910 ) ) ( not ( = ?auto_118909 ?auto_118907 ) ) ( not ( = ?auto_118909 ?auto_118912 ) ) ( not ( = ?auto_118909 ?auto_118914 ) ) ( not ( = ?auto_118910 ?auto_118911 ) ) ( not ( = ?auto_118910 ?auto_118913 ) ) ( not ( = ?auto_118910 ?auto_118916 ) ) ( not ( = ?auto_118907 ?auto_118912 ) ) ( not ( = ?auto_118907 ?auto_118914 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118911 ?auto_118912 ?auto_118913 ?auto_118914 )
      ( GET-4IMAGE-VERIFY ?auto_118908 ?auto_118909 ?auto_118910 ?auto_118907 ?auto_118911 ?auto_118912 ?auto_118913 ?auto_118914 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118919 - DIRECTION
      ?auto_118920 - MODE
      ?auto_118921 - DIRECTION
      ?auto_118918 - MODE
      ?auto_118922 - DIRECTION
      ?auto_118923 - MODE
      ?auto_118924 - DIRECTION
      ?auto_118925 - MODE
    )
    :vars
    (
      ?auto_118930 - INSTRUMENT
      ?auto_118926 - SATELLITE
      ?auto_118927 - DIRECTION
      ?auto_118928 - DIRECTION
      ?auto_118929 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_118930 ?auto_118926 ) ( SUPPORTS ?auto_118930 ?auto_118925 ) ( not ( = ?auto_118924 ?auto_118927 ) ) ( HAVE_IMAGE ?auto_118928 ?auto_118929 ) ( not ( = ?auto_118928 ?auto_118924 ) ) ( not ( = ?auto_118928 ?auto_118927 ) ) ( not ( = ?auto_118929 ?auto_118925 ) ) ( CALIBRATION_TARGET ?auto_118930 ?auto_118927 ) ( POWER_AVAIL ?auto_118926 ) ( POINTING ?auto_118926 ?auto_118922 ) ( not ( = ?auto_118927 ?auto_118922 ) ) ( not ( = ?auto_118924 ?auto_118922 ) ) ( not ( = ?auto_118928 ?auto_118922 ) ) ( HAVE_IMAGE ?auto_118919 ?auto_118920 ) ( HAVE_IMAGE ?auto_118921 ?auto_118918 ) ( HAVE_IMAGE ?auto_118922 ?auto_118923 ) ( not ( = ?auto_118919 ?auto_118921 ) ) ( not ( = ?auto_118919 ?auto_118922 ) ) ( not ( = ?auto_118919 ?auto_118924 ) ) ( not ( = ?auto_118919 ?auto_118927 ) ) ( not ( = ?auto_118919 ?auto_118928 ) ) ( not ( = ?auto_118920 ?auto_118918 ) ) ( not ( = ?auto_118920 ?auto_118923 ) ) ( not ( = ?auto_118920 ?auto_118925 ) ) ( not ( = ?auto_118920 ?auto_118929 ) ) ( not ( = ?auto_118921 ?auto_118922 ) ) ( not ( = ?auto_118921 ?auto_118924 ) ) ( not ( = ?auto_118921 ?auto_118927 ) ) ( not ( = ?auto_118921 ?auto_118928 ) ) ( not ( = ?auto_118918 ?auto_118923 ) ) ( not ( = ?auto_118918 ?auto_118925 ) ) ( not ( = ?auto_118918 ?auto_118929 ) ) ( not ( = ?auto_118923 ?auto_118925 ) ) ( not ( = ?auto_118923 ?auto_118929 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118928 ?auto_118929 ?auto_118924 ?auto_118925 )
      ( GET-4IMAGE-VERIFY ?auto_118919 ?auto_118920 ?auto_118921 ?auto_118918 ?auto_118922 ?auto_118923 ?auto_118924 ?auto_118925 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118932 - DIRECTION
      ?auto_118933 - MODE
      ?auto_118934 - DIRECTION
      ?auto_118931 - MODE
      ?auto_118935 - DIRECTION
      ?auto_118936 - MODE
      ?auto_118937 - DIRECTION
      ?auto_118938 - MODE
    )
    :vars
    (
      ?auto_118941 - INSTRUMENT
      ?auto_118939 - SATELLITE
      ?auto_118940 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118941 ?auto_118939 ) ( SUPPORTS ?auto_118941 ?auto_118936 ) ( not ( = ?auto_118935 ?auto_118940 ) ) ( HAVE_IMAGE ?auto_118937 ?auto_118938 ) ( not ( = ?auto_118937 ?auto_118935 ) ) ( not ( = ?auto_118937 ?auto_118940 ) ) ( not ( = ?auto_118938 ?auto_118936 ) ) ( CALIBRATION_TARGET ?auto_118941 ?auto_118940 ) ( POWER_AVAIL ?auto_118939 ) ( POINTING ?auto_118939 ?auto_118932 ) ( not ( = ?auto_118940 ?auto_118932 ) ) ( not ( = ?auto_118935 ?auto_118932 ) ) ( not ( = ?auto_118937 ?auto_118932 ) ) ( HAVE_IMAGE ?auto_118932 ?auto_118933 ) ( HAVE_IMAGE ?auto_118934 ?auto_118931 ) ( not ( = ?auto_118932 ?auto_118934 ) ) ( not ( = ?auto_118933 ?auto_118931 ) ) ( not ( = ?auto_118933 ?auto_118936 ) ) ( not ( = ?auto_118933 ?auto_118938 ) ) ( not ( = ?auto_118934 ?auto_118935 ) ) ( not ( = ?auto_118934 ?auto_118937 ) ) ( not ( = ?auto_118934 ?auto_118940 ) ) ( not ( = ?auto_118931 ?auto_118936 ) ) ( not ( = ?auto_118931 ?auto_118938 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118937 ?auto_118938 ?auto_118935 ?auto_118936 )
      ( GET-4IMAGE-VERIFY ?auto_118932 ?auto_118933 ?auto_118934 ?auto_118931 ?auto_118935 ?auto_118936 ?auto_118937 ?auto_118938 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118943 - DIRECTION
      ?auto_118944 - MODE
      ?auto_118945 - DIRECTION
      ?auto_118942 - MODE
      ?auto_118946 - DIRECTION
      ?auto_118947 - MODE
      ?auto_118948 - DIRECTION
      ?auto_118949 - MODE
    )
    :vars
    (
      ?auto_118954 - INSTRUMENT
      ?auto_118950 - SATELLITE
      ?auto_118951 - DIRECTION
      ?auto_118952 - DIRECTION
      ?auto_118953 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_118954 ?auto_118950 ) ( SUPPORTS ?auto_118954 ?auto_118947 ) ( not ( = ?auto_118946 ?auto_118951 ) ) ( HAVE_IMAGE ?auto_118952 ?auto_118953 ) ( not ( = ?auto_118952 ?auto_118946 ) ) ( not ( = ?auto_118952 ?auto_118951 ) ) ( not ( = ?auto_118953 ?auto_118947 ) ) ( CALIBRATION_TARGET ?auto_118954 ?auto_118951 ) ( POWER_AVAIL ?auto_118950 ) ( POINTING ?auto_118950 ?auto_118943 ) ( not ( = ?auto_118951 ?auto_118943 ) ) ( not ( = ?auto_118946 ?auto_118943 ) ) ( not ( = ?auto_118952 ?auto_118943 ) ) ( HAVE_IMAGE ?auto_118943 ?auto_118944 ) ( HAVE_IMAGE ?auto_118945 ?auto_118942 ) ( HAVE_IMAGE ?auto_118948 ?auto_118949 ) ( not ( = ?auto_118943 ?auto_118945 ) ) ( not ( = ?auto_118943 ?auto_118948 ) ) ( not ( = ?auto_118944 ?auto_118942 ) ) ( not ( = ?auto_118944 ?auto_118947 ) ) ( not ( = ?auto_118944 ?auto_118949 ) ) ( not ( = ?auto_118944 ?auto_118953 ) ) ( not ( = ?auto_118945 ?auto_118946 ) ) ( not ( = ?auto_118945 ?auto_118948 ) ) ( not ( = ?auto_118945 ?auto_118951 ) ) ( not ( = ?auto_118945 ?auto_118952 ) ) ( not ( = ?auto_118942 ?auto_118947 ) ) ( not ( = ?auto_118942 ?auto_118949 ) ) ( not ( = ?auto_118942 ?auto_118953 ) ) ( not ( = ?auto_118946 ?auto_118948 ) ) ( not ( = ?auto_118947 ?auto_118949 ) ) ( not ( = ?auto_118948 ?auto_118951 ) ) ( not ( = ?auto_118948 ?auto_118952 ) ) ( not ( = ?auto_118949 ?auto_118953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118952 ?auto_118953 ?auto_118946 ?auto_118947 )
      ( GET-4IMAGE-VERIFY ?auto_118943 ?auto_118944 ?auto_118945 ?auto_118942 ?auto_118946 ?auto_118947 ?auto_118948 ?auto_118949 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118969 - DIRECTION
      ?auto_118970 - MODE
      ?auto_118971 - DIRECTION
      ?auto_118968 - MODE
      ?auto_118972 - DIRECTION
      ?auto_118973 - MODE
      ?auto_118974 - DIRECTION
      ?auto_118975 - MODE
    )
    :vars
    (
      ?auto_118978 - INSTRUMENT
      ?auto_118976 - SATELLITE
      ?auto_118977 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118978 ?auto_118976 ) ( SUPPORTS ?auto_118978 ?auto_118968 ) ( not ( = ?auto_118971 ?auto_118977 ) ) ( HAVE_IMAGE ?auto_118972 ?auto_118975 ) ( not ( = ?auto_118972 ?auto_118971 ) ) ( not ( = ?auto_118972 ?auto_118977 ) ) ( not ( = ?auto_118975 ?auto_118968 ) ) ( CALIBRATION_TARGET ?auto_118978 ?auto_118977 ) ( POWER_AVAIL ?auto_118976 ) ( POINTING ?auto_118976 ?auto_118969 ) ( not ( = ?auto_118977 ?auto_118969 ) ) ( not ( = ?auto_118971 ?auto_118969 ) ) ( not ( = ?auto_118972 ?auto_118969 ) ) ( HAVE_IMAGE ?auto_118969 ?auto_118970 ) ( HAVE_IMAGE ?auto_118972 ?auto_118973 ) ( HAVE_IMAGE ?auto_118974 ?auto_118975 ) ( not ( = ?auto_118969 ?auto_118974 ) ) ( not ( = ?auto_118970 ?auto_118968 ) ) ( not ( = ?auto_118970 ?auto_118973 ) ) ( not ( = ?auto_118970 ?auto_118975 ) ) ( not ( = ?auto_118971 ?auto_118974 ) ) ( not ( = ?auto_118968 ?auto_118973 ) ) ( not ( = ?auto_118972 ?auto_118974 ) ) ( not ( = ?auto_118973 ?auto_118975 ) ) ( not ( = ?auto_118974 ?auto_118977 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118972 ?auto_118975 ?auto_118971 ?auto_118968 )
      ( GET-4IMAGE-VERIFY ?auto_118969 ?auto_118970 ?auto_118971 ?auto_118968 ?auto_118972 ?auto_118973 ?auto_118974 ?auto_118975 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_118980 - DIRECTION
      ?auto_118981 - MODE
      ?auto_118982 - DIRECTION
      ?auto_118979 - MODE
      ?auto_118983 - DIRECTION
      ?auto_118984 - MODE
      ?auto_118985 - DIRECTION
      ?auto_118986 - MODE
    )
    :vars
    (
      ?auto_118989 - INSTRUMENT
      ?auto_118987 - SATELLITE
      ?auto_118988 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_118989 ?auto_118987 ) ( SUPPORTS ?auto_118989 ?auto_118979 ) ( not ( = ?auto_118982 ?auto_118988 ) ) ( HAVE_IMAGE ?auto_118983 ?auto_118984 ) ( not ( = ?auto_118983 ?auto_118982 ) ) ( not ( = ?auto_118983 ?auto_118988 ) ) ( not ( = ?auto_118984 ?auto_118979 ) ) ( CALIBRATION_TARGET ?auto_118989 ?auto_118988 ) ( POWER_AVAIL ?auto_118987 ) ( POINTING ?auto_118987 ?auto_118980 ) ( not ( = ?auto_118988 ?auto_118980 ) ) ( not ( = ?auto_118982 ?auto_118980 ) ) ( not ( = ?auto_118983 ?auto_118980 ) ) ( HAVE_IMAGE ?auto_118980 ?auto_118981 ) ( HAVE_IMAGE ?auto_118985 ?auto_118986 ) ( not ( = ?auto_118980 ?auto_118985 ) ) ( not ( = ?auto_118981 ?auto_118979 ) ) ( not ( = ?auto_118981 ?auto_118984 ) ) ( not ( = ?auto_118981 ?auto_118986 ) ) ( not ( = ?auto_118982 ?auto_118985 ) ) ( not ( = ?auto_118979 ?auto_118986 ) ) ( not ( = ?auto_118983 ?auto_118985 ) ) ( not ( = ?auto_118984 ?auto_118986 ) ) ( not ( = ?auto_118985 ?auto_118988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_118983 ?auto_118984 ?auto_118982 ?auto_118979 )
      ( GET-4IMAGE-VERIFY ?auto_118980 ?auto_118981 ?auto_118982 ?auto_118979 ?auto_118983 ?auto_118984 ?auto_118985 ?auto_118986 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119002 - DIRECTION
      ?auto_119003 - MODE
      ?auto_119004 - DIRECTION
      ?auto_119001 - MODE
      ?auto_119005 - DIRECTION
      ?auto_119006 - MODE
      ?auto_119007 - DIRECTION
      ?auto_119008 - MODE
    )
    :vars
    (
      ?auto_119011 - INSTRUMENT
      ?auto_119009 - SATELLITE
      ?auto_119010 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_119011 ?auto_119009 ) ( SUPPORTS ?auto_119011 ?auto_119001 ) ( not ( = ?auto_119004 ?auto_119010 ) ) ( HAVE_IMAGE ?auto_119007 ?auto_119008 ) ( not ( = ?auto_119007 ?auto_119004 ) ) ( not ( = ?auto_119007 ?auto_119010 ) ) ( not ( = ?auto_119008 ?auto_119001 ) ) ( CALIBRATION_TARGET ?auto_119011 ?auto_119010 ) ( POWER_AVAIL ?auto_119009 ) ( POINTING ?auto_119009 ?auto_119002 ) ( not ( = ?auto_119010 ?auto_119002 ) ) ( not ( = ?auto_119004 ?auto_119002 ) ) ( not ( = ?auto_119007 ?auto_119002 ) ) ( HAVE_IMAGE ?auto_119002 ?auto_119003 ) ( HAVE_IMAGE ?auto_119005 ?auto_119006 ) ( not ( = ?auto_119002 ?auto_119005 ) ) ( not ( = ?auto_119003 ?auto_119001 ) ) ( not ( = ?auto_119003 ?auto_119006 ) ) ( not ( = ?auto_119003 ?auto_119008 ) ) ( not ( = ?auto_119004 ?auto_119005 ) ) ( not ( = ?auto_119001 ?auto_119006 ) ) ( not ( = ?auto_119005 ?auto_119007 ) ) ( not ( = ?auto_119005 ?auto_119010 ) ) ( not ( = ?auto_119006 ?auto_119008 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119007 ?auto_119008 ?auto_119004 ?auto_119001 )
      ( GET-4IMAGE-VERIFY ?auto_119002 ?auto_119003 ?auto_119004 ?auto_119001 ?auto_119005 ?auto_119006 ?auto_119007 ?auto_119008 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119013 - DIRECTION
      ?auto_119014 - MODE
      ?auto_119015 - DIRECTION
      ?auto_119012 - MODE
      ?auto_119016 - DIRECTION
      ?auto_119017 - MODE
      ?auto_119018 - DIRECTION
      ?auto_119019 - MODE
    )
    :vars
    (
      ?auto_119024 - INSTRUMENT
      ?auto_119020 - SATELLITE
      ?auto_119021 - DIRECTION
      ?auto_119022 - DIRECTION
      ?auto_119023 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_119024 ?auto_119020 ) ( SUPPORTS ?auto_119024 ?auto_119012 ) ( not ( = ?auto_119015 ?auto_119021 ) ) ( HAVE_IMAGE ?auto_119022 ?auto_119023 ) ( not ( = ?auto_119022 ?auto_119015 ) ) ( not ( = ?auto_119022 ?auto_119021 ) ) ( not ( = ?auto_119023 ?auto_119012 ) ) ( CALIBRATION_TARGET ?auto_119024 ?auto_119021 ) ( POWER_AVAIL ?auto_119020 ) ( POINTING ?auto_119020 ?auto_119016 ) ( not ( = ?auto_119021 ?auto_119016 ) ) ( not ( = ?auto_119015 ?auto_119016 ) ) ( not ( = ?auto_119022 ?auto_119016 ) ) ( HAVE_IMAGE ?auto_119013 ?auto_119014 ) ( HAVE_IMAGE ?auto_119016 ?auto_119017 ) ( HAVE_IMAGE ?auto_119018 ?auto_119019 ) ( not ( = ?auto_119013 ?auto_119015 ) ) ( not ( = ?auto_119013 ?auto_119016 ) ) ( not ( = ?auto_119013 ?auto_119018 ) ) ( not ( = ?auto_119013 ?auto_119021 ) ) ( not ( = ?auto_119013 ?auto_119022 ) ) ( not ( = ?auto_119014 ?auto_119012 ) ) ( not ( = ?auto_119014 ?auto_119017 ) ) ( not ( = ?auto_119014 ?auto_119019 ) ) ( not ( = ?auto_119014 ?auto_119023 ) ) ( not ( = ?auto_119015 ?auto_119018 ) ) ( not ( = ?auto_119012 ?auto_119017 ) ) ( not ( = ?auto_119012 ?auto_119019 ) ) ( not ( = ?auto_119016 ?auto_119018 ) ) ( not ( = ?auto_119017 ?auto_119019 ) ) ( not ( = ?auto_119017 ?auto_119023 ) ) ( not ( = ?auto_119018 ?auto_119021 ) ) ( not ( = ?auto_119018 ?auto_119022 ) ) ( not ( = ?auto_119019 ?auto_119023 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119022 ?auto_119023 ?auto_119015 ?auto_119012 )
      ( GET-4IMAGE-VERIFY ?auto_119013 ?auto_119014 ?auto_119015 ?auto_119012 ?auto_119016 ?auto_119017 ?auto_119018 ?auto_119019 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119076 - DIRECTION
      ?auto_119077 - MODE
      ?auto_119078 - DIRECTION
      ?auto_119075 - MODE
      ?auto_119079 - DIRECTION
      ?auto_119080 - MODE
      ?auto_119081 - DIRECTION
      ?auto_119082 - MODE
    )
    :vars
    (
      ?auto_119086 - INSTRUMENT
      ?auto_119084 - SATELLITE
      ?auto_119085 - DIRECTION
      ?auto_119083 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_119086 ?auto_119084 ) ( SUPPORTS ?auto_119086 ?auto_119077 ) ( not ( = ?auto_119076 ?auto_119085 ) ) ( HAVE_IMAGE ?auto_119078 ?auto_119082 ) ( not ( = ?auto_119078 ?auto_119076 ) ) ( not ( = ?auto_119078 ?auto_119085 ) ) ( not ( = ?auto_119082 ?auto_119077 ) ) ( CALIBRATION_TARGET ?auto_119086 ?auto_119085 ) ( POWER_AVAIL ?auto_119084 ) ( POINTING ?auto_119084 ?auto_119083 ) ( not ( = ?auto_119085 ?auto_119083 ) ) ( not ( = ?auto_119076 ?auto_119083 ) ) ( not ( = ?auto_119078 ?auto_119083 ) ) ( HAVE_IMAGE ?auto_119078 ?auto_119075 ) ( HAVE_IMAGE ?auto_119079 ?auto_119080 ) ( HAVE_IMAGE ?auto_119081 ?auto_119082 ) ( not ( = ?auto_119076 ?auto_119079 ) ) ( not ( = ?auto_119076 ?auto_119081 ) ) ( not ( = ?auto_119077 ?auto_119075 ) ) ( not ( = ?auto_119077 ?auto_119080 ) ) ( not ( = ?auto_119078 ?auto_119079 ) ) ( not ( = ?auto_119078 ?auto_119081 ) ) ( not ( = ?auto_119075 ?auto_119080 ) ) ( not ( = ?auto_119075 ?auto_119082 ) ) ( not ( = ?auto_119079 ?auto_119081 ) ) ( not ( = ?auto_119079 ?auto_119085 ) ) ( not ( = ?auto_119079 ?auto_119083 ) ) ( not ( = ?auto_119080 ?auto_119082 ) ) ( not ( = ?auto_119081 ?auto_119085 ) ) ( not ( = ?auto_119081 ?auto_119083 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119078 ?auto_119082 ?auto_119076 ?auto_119077 )
      ( GET-4IMAGE-VERIFY ?auto_119076 ?auto_119077 ?auto_119078 ?auto_119075 ?auto_119079 ?auto_119080 ?auto_119081 ?auto_119082 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119088 - DIRECTION
      ?auto_119089 - MODE
      ?auto_119090 - DIRECTION
      ?auto_119087 - MODE
      ?auto_119091 - DIRECTION
      ?auto_119092 - MODE
      ?auto_119093 - DIRECTION
      ?auto_119094 - MODE
    )
    :vars
    (
      ?auto_119097 - INSTRUMENT
      ?auto_119095 - SATELLITE
      ?auto_119096 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_119097 ?auto_119095 ) ( SUPPORTS ?auto_119097 ?auto_119089 ) ( not ( = ?auto_119088 ?auto_119096 ) ) ( HAVE_IMAGE ?auto_119090 ?auto_119087 ) ( not ( = ?auto_119090 ?auto_119088 ) ) ( not ( = ?auto_119090 ?auto_119096 ) ) ( not ( = ?auto_119087 ?auto_119089 ) ) ( CALIBRATION_TARGET ?auto_119097 ?auto_119096 ) ( POWER_AVAIL ?auto_119095 ) ( POINTING ?auto_119095 ?auto_119093 ) ( not ( = ?auto_119096 ?auto_119093 ) ) ( not ( = ?auto_119088 ?auto_119093 ) ) ( not ( = ?auto_119090 ?auto_119093 ) ) ( HAVE_IMAGE ?auto_119091 ?auto_119092 ) ( HAVE_IMAGE ?auto_119093 ?auto_119094 ) ( not ( = ?auto_119088 ?auto_119091 ) ) ( not ( = ?auto_119089 ?auto_119092 ) ) ( not ( = ?auto_119089 ?auto_119094 ) ) ( not ( = ?auto_119090 ?auto_119091 ) ) ( not ( = ?auto_119087 ?auto_119092 ) ) ( not ( = ?auto_119087 ?auto_119094 ) ) ( not ( = ?auto_119091 ?auto_119093 ) ) ( not ( = ?auto_119091 ?auto_119096 ) ) ( not ( = ?auto_119092 ?auto_119094 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119090 ?auto_119087 ?auto_119088 ?auto_119089 )
      ( GET-4IMAGE-VERIFY ?auto_119088 ?auto_119089 ?auto_119090 ?auto_119087 ?auto_119091 ?auto_119092 ?auto_119093 ?auto_119094 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119111 - DIRECTION
      ?auto_119112 - MODE
      ?auto_119113 - DIRECTION
      ?auto_119110 - MODE
      ?auto_119114 - DIRECTION
      ?auto_119115 - MODE
      ?auto_119116 - DIRECTION
      ?auto_119117 - MODE
    )
    :vars
    (
      ?auto_119120 - INSTRUMENT
      ?auto_119118 - SATELLITE
      ?auto_119119 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_119120 ?auto_119118 ) ( SUPPORTS ?auto_119120 ?auto_119112 ) ( not ( = ?auto_119111 ?auto_119119 ) ) ( HAVE_IMAGE ?auto_119116 ?auto_119117 ) ( not ( = ?auto_119116 ?auto_119111 ) ) ( not ( = ?auto_119116 ?auto_119119 ) ) ( not ( = ?auto_119117 ?auto_119112 ) ) ( CALIBRATION_TARGET ?auto_119120 ?auto_119119 ) ( POWER_AVAIL ?auto_119118 ) ( POINTING ?auto_119118 ?auto_119114 ) ( not ( = ?auto_119119 ?auto_119114 ) ) ( not ( = ?auto_119111 ?auto_119114 ) ) ( not ( = ?auto_119116 ?auto_119114 ) ) ( HAVE_IMAGE ?auto_119113 ?auto_119110 ) ( HAVE_IMAGE ?auto_119114 ?auto_119115 ) ( not ( = ?auto_119111 ?auto_119113 ) ) ( not ( = ?auto_119112 ?auto_119110 ) ) ( not ( = ?auto_119112 ?auto_119115 ) ) ( not ( = ?auto_119113 ?auto_119114 ) ) ( not ( = ?auto_119113 ?auto_119116 ) ) ( not ( = ?auto_119113 ?auto_119119 ) ) ( not ( = ?auto_119110 ?auto_119115 ) ) ( not ( = ?auto_119110 ?auto_119117 ) ) ( not ( = ?auto_119115 ?auto_119117 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119116 ?auto_119117 ?auto_119111 ?auto_119112 )
      ( GET-4IMAGE-VERIFY ?auto_119111 ?auto_119112 ?auto_119113 ?auto_119110 ?auto_119114 ?auto_119115 ?auto_119116 ?auto_119117 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119122 - DIRECTION
      ?auto_119123 - MODE
      ?auto_119124 - DIRECTION
      ?auto_119121 - MODE
      ?auto_119125 - DIRECTION
      ?auto_119126 - MODE
      ?auto_119127 - DIRECTION
      ?auto_119128 - MODE
    )
    :vars
    (
      ?auto_119131 - INSTRUMENT
      ?auto_119129 - SATELLITE
      ?auto_119130 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_119131 ?auto_119129 ) ( SUPPORTS ?auto_119131 ?auto_119123 ) ( not ( = ?auto_119122 ?auto_119130 ) ) ( HAVE_IMAGE ?auto_119124 ?auto_119121 ) ( not ( = ?auto_119124 ?auto_119122 ) ) ( not ( = ?auto_119124 ?auto_119130 ) ) ( not ( = ?auto_119121 ?auto_119123 ) ) ( CALIBRATION_TARGET ?auto_119131 ?auto_119130 ) ( POWER_AVAIL ?auto_119129 ) ( POINTING ?auto_119129 ?auto_119125 ) ( not ( = ?auto_119130 ?auto_119125 ) ) ( not ( = ?auto_119122 ?auto_119125 ) ) ( not ( = ?auto_119124 ?auto_119125 ) ) ( HAVE_IMAGE ?auto_119125 ?auto_119126 ) ( HAVE_IMAGE ?auto_119127 ?auto_119128 ) ( not ( = ?auto_119122 ?auto_119127 ) ) ( not ( = ?auto_119123 ?auto_119126 ) ) ( not ( = ?auto_119123 ?auto_119128 ) ) ( not ( = ?auto_119124 ?auto_119127 ) ) ( not ( = ?auto_119121 ?auto_119126 ) ) ( not ( = ?auto_119121 ?auto_119128 ) ) ( not ( = ?auto_119125 ?auto_119127 ) ) ( not ( = ?auto_119126 ?auto_119128 ) ) ( not ( = ?auto_119127 ?auto_119130 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119124 ?auto_119121 ?auto_119122 ?auto_119123 )
      ( GET-4IMAGE-VERIFY ?auto_119122 ?auto_119123 ?auto_119124 ?auto_119121 ?auto_119125 ?auto_119126 ?auto_119127 ?auto_119128 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119179 - DIRECTION
      ?auto_119180 - MODE
      ?auto_119181 - DIRECTION
      ?auto_119178 - MODE
      ?auto_119182 - DIRECTION
      ?auto_119183 - MODE
      ?auto_119184 - DIRECTION
      ?auto_119185 - MODE
    )
    :vars
    (
      ?auto_119188 - INSTRUMENT
      ?auto_119186 - SATELLITE
      ?auto_119187 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_119188 ?auto_119186 ) ( SUPPORTS ?auto_119188 ?auto_119180 ) ( not ( = ?auto_119179 ?auto_119187 ) ) ( HAVE_IMAGE ?auto_119182 ?auto_119185 ) ( not ( = ?auto_119182 ?auto_119179 ) ) ( not ( = ?auto_119182 ?auto_119187 ) ) ( not ( = ?auto_119185 ?auto_119180 ) ) ( CALIBRATION_TARGET ?auto_119188 ?auto_119187 ) ( POWER_AVAIL ?auto_119186 ) ( POINTING ?auto_119186 ?auto_119181 ) ( not ( = ?auto_119187 ?auto_119181 ) ) ( not ( = ?auto_119179 ?auto_119181 ) ) ( not ( = ?auto_119182 ?auto_119181 ) ) ( HAVE_IMAGE ?auto_119181 ?auto_119178 ) ( HAVE_IMAGE ?auto_119182 ?auto_119183 ) ( HAVE_IMAGE ?auto_119184 ?auto_119185 ) ( not ( = ?auto_119179 ?auto_119184 ) ) ( not ( = ?auto_119180 ?auto_119178 ) ) ( not ( = ?auto_119180 ?auto_119183 ) ) ( not ( = ?auto_119181 ?auto_119184 ) ) ( not ( = ?auto_119178 ?auto_119183 ) ) ( not ( = ?auto_119178 ?auto_119185 ) ) ( not ( = ?auto_119182 ?auto_119184 ) ) ( not ( = ?auto_119183 ?auto_119185 ) ) ( not ( = ?auto_119184 ?auto_119187 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119182 ?auto_119185 ?auto_119179 ?auto_119180 )
      ( GET-4IMAGE-VERIFY ?auto_119179 ?auto_119180 ?auto_119181 ?auto_119178 ?auto_119182 ?auto_119183 ?auto_119184 ?auto_119185 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119190 - DIRECTION
      ?auto_119191 - MODE
      ?auto_119192 - DIRECTION
      ?auto_119189 - MODE
      ?auto_119193 - DIRECTION
      ?auto_119194 - MODE
      ?auto_119195 - DIRECTION
      ?auto_119196 - MODE
    )
    :vars
    (
      ?auto_119199 - INSTRUMENT
      ?auto_119197 - SATELLITE
      ?auto_119198 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_119199 ?auto_119197 ) ( SUPPORTS ?auto_119199 ?auto_119191 ) ( not ( = ?auto_119190 ?auto_119198 ) ) ( HAVE_IMAGE ?auto_119193 ?auto_119194 ) ( not ( = ?auto_119193 ?auto_119190 ) ) ( not ( = ?auto_119193 ?auto_119198 ) ) ( not ( = ?auto_119194 ?auto_119191 ) ) ( CALIBRATION_TARGET ?auto_119199 ?auto_119198 ) ( POWER_AVAIL ?auto_119197 ) ( POINTING ?auto_119197 ?auto_119192 ) ( not ( = ?auto_119198 ?auto_119192 ) ) ( not ( = ?auto_119190 ?auto_119192 ) ) ( not ( = ?auto_119193 ?auto_119192 ) ) ( HAVE_IMAGE ?auto_119192 ?auto_119189 ) ( HAVE_IMAGE ?auto_119195 ?auto_119196 ) ( not ( = ?auto_119190 ?auto_119195 ) ) ( not ( = ?auto_119191 ?auto_119189 ) ) ( not ( = ?auto_119191 ?auto_119196 ) ) ( not ( = ?auto_119192 ?auto_119195 ) ) ( not ( = ?auto_119189 ?auto_119194 ) ) ( not ( = ?auto_119189 ?auto_119196 ) ) ( not ( = ?auto_119193 ?auto_119195 ) ) ( not ( = ?auto_119194 ?auto_119196 ) ) ( not ( = ?auto_119195 ?auto_119198 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119193 ?auto_119194 ?auto_119190 ?auto_119191 )
      ( GET-4IMAGE-VERIFY ?auto_119190 ?auto_119191 ?auto_119192 ?auto_119189 ?auto_119193 ?auto_119194 ?auto_119195 ?auto_119196 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119223 - DIRECTION
      ?auto_119224 - MODE
      ?auto_119225 - DIRECTION
      ?auto_119222 - MODE
      ?auto_119226 - DIRECTION
      ?auto_119227 - MODE
      ?auto_119228 - DIRECTION
      ?auto_119229 - MODE
    )
    :vars
    (
      ?auto_119234 - INSTRUMENT
      ?auto_119230 - SATELLITE
      ?auto_119231 - DIRECTION
      ?auto_119232 - DIRECTION
      ?auto_119233 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_119234 ?auto_119230 ) ( SUPPORTS ?auto_119234 ?auto_119224 ) ( not ( = ?auto_119223 ?auto_119231 ) ) ( HAVE_IMAGE ?auto_119232 ?auto_119233 ) ( not ( = ?auto_119232 ?auto_119223 ) ) ( not ( = ?auto_119232 ?auto_119231 ) ) ( not ( = ?auto_119233 ?auto_119224 ) ) ( CALIBRATION_TARGET ?auto_119234 ?auto_119231 ) ( POWER_AVAIL ?auto_119230 ) ( POINTING ?auto_119230 ?auto_119225 ) ( not ( = ?auto_119231 ?auto_119225 ) ) ( not ( = ?auto_119223 ?auto_119225 ) ) ( not ( = ?auto_119232 ?auto_119225 ) ) ( HAVE_IMAGE ?auto_119225 ?auto_119222 ) ( HAVE_IMAGE ?auto_119226 ?auto_119227 ) ( HAVE_IMAGE ?auto_119228 ?auto_119229 ) ( not ( = ?auto_119223 ?auto_119226 ) ) ( not ( = ?auto_119223 ?auto_119228 ) ) ( not ( = ?auto_119224 ?auto_119222 ) ) ( not ( = ?auto_119224 ?auto_119227 ) ) ( not ( = ?auto_119224 ?auto_119229 ) ) ( not ( = ?auto_119225 ?auto_119226 ) ) ( not ( = ?auto_119225 ?auto_119228 ) ) ( not ( = ?auto_119222 ?auto_119227 ) ) ( not ( = ?auto_119222 ?auto_119229 ) ) ( not ( = ?auto_119222 ?auto_119233 ) ) ( not ( = ?auto_119226 ?auto_119228 ) ) ( not ( = ?auto_119226 ?auto_119231 ) ) ( not ( = ?auto_119226 ?auto_119232 ) ) ( not ( = ?auto_119227 ?auto_119229 ) ) ( not ( = ?auto_119227 ?auto_119233 ) ) ( not ( = ?auto_119228 ?auto_119231 ) ) ( not ( = ?auto_119228 ?auto_119232 ) ) ( not ( = ?auto_119229 ?auto_119233 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119232 ?auto_119233 ?auto_119223 ?auto_119224 )
      ( GET-4IMAGE-VERIFY ?auto_119223 ?auto_119224 ?auto_119225 ?auto_119222 ?auto_119226 ?auto_119227 ?auto_119228 ?auto_119229 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_119396 - DIRECTION
      ?auto_119397 - MODE
    )
    :vars
    (
      ?auto_119403 - INSTRUMENT
      ?auto_119399 - SATELLITE
      ?auto_119400 - DIRECTION
      ?auto_119401 - DIRECTION
      ?auto_119402 - MODE
      ?auto_119398 - DIRECTION
      ?auto_119404 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119403 ?auto_119399 ) ( SUPPORTS ?auto_119403 ?auto_119397 ) ( not ( = ?auto_119396 ?auto_119400 ) ) ( HAVE_IMAGE ?auto_119401 ?auto_119402 ) ( not ( = ?auto_119401 ?auto_119396 ) ) ( not ( = ?auto_119401 ?auto_119400 ) ) ( not ( = ?auto_119402 ?auto_119397 ) ) ( CALIBRATION_TARGET ?auto_119403 ?auto_119400 ) ( POINTING ?auto_119399 ?auto_119398 ) ( not ( = ?auto_119400 ?auto_119398 ) ) ( not ( = ?auto_119396 ?auto_119398 ) ) ( not ( = ?auto_119401 ?auto_119398 ) ) ( ON_BOARD ?auto_119404 ?auto_119399 ) ( POWER_ON ?auto_119404 ) ( not ( = ?auto_119403 ?auto_119404 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_119404 ?auto_119399 )
      ( GET-2IMAGE ?auto_119401 ?auto_119402 ?auto_119396 ?auto_119397 )
      ( GET-1IMAGE-VERIFY ?auto_119396 ?auto_119397 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_119406 - DIRECTION
      ?auto_119407 - MODE
      ?auto_119408 - DIRECTION
      ?auto_119405 - MODE
    )
    :vars
    (
      ?auto_119413 - INSTRUMENT
      ?auto_119409 - SATELLITE
      ?auto_119412 - DIRECTION
      ?auto_119411 - DIRECTION
      ?auto_119410 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119413 ?auto_119409 ) ( SUPPORTS ?auto_119413 ?auto_119405 ) ( not ( = ?auto_119408 ?auto_119412 ) ) ( HAVE_IMAGE ?auto_119406 ?auto_119407 ) ( not ( = ?auto_119406 ?auto_119408 ) ) ( not ( = ?auto_119406 ?auto_119412 ) ) ( not ( = ?auto_119407 ?auto_119405 ) ) ( CALIBRATION_TARGET ?auto_119413 ?auto_119412 ) ( POINTING ?auto_119409 ?auto_119411 ) ( not ( = ?auto_119412 ?auto_119411 ) ) ( not ( = ?auto_119408 ?auto_119411 ) ) ( not ( = ?auto_119406 ?auto_119411 ) ) ( ON_BOARD ?auto_119410 ?auto_119409 ) ( POWER_ON ?auto_119410 ) ( not ( = ?auto_119413 ?auto_119410 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_119408 ?auto_119405 )
      ( GET-2IMAGE-VERIFY ?auto_119406 ?auto_119407 ?auto_119408 ?auto_119405 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_119415 - DIRECTION
      ?auto_119416 - MODE
      ?auto_119417 - DIRECTION
      ?auto_119414 - MODE
    )
    :vars
    (
      ?auto_119421 - INSTRUMENT
      ?auto_119418 - SATELLITE
      ?auto_119420 - DIRECTION
      ?auto_119423 - DIRECTION
      ?auto_119422 - MODE
      ?auto_119419 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119421 ?auto_119418 ) ( SUPPORTS ?auto_119421 ?auto_119414 ) ( not ( = ?auto_119417 ?auto_119420 ) ) ( HAVE_IMAGE ?auto_119423 ?auto_119422 ) ( not ( = ?auto_119423 ?auto_119417 ) ) ( not ( = ?auto_119423 ?auto_119420 ) ) ( not ( = ?auto_119422 ?auto_119414 ) ) ( CALIBRATION_TARGET ?auto_119421 ?auto_119420 ) ( POINTING ?auto_119418 ?auto_119415 ) ( not ( = ?auto_119420 ?auto_119415 ) ) ( not ( = ?auto_119417 ?auto_119415 ) ) ( not ( = ?auto_119423 ?auto_119415 ) ) ( ON_BOARD ?auto_119419 ?auto_119418 ) ( POWER_ON ?auto_119419 ) ( not ( = ?auto_119421 ?auto_119419 ) ) ( HAVE_IMAGE ?auto_119415 ?auto_119416 ) ( not ( = ?auto_119416 ?auto_119414 ) ) ( not ( = ?auto_119416 ?auto_119422 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119423 ?auto_119422 ?auto_119417 ?auto_119414 )
      ( GET-2IMAGE-VERIFY ?auto_119415 ?auto_119416 ?auto_119417 ?auto_119414 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_119425 - DIRECTION
      ?auto_119426 - MODE
      ?auto_119427 - DIRECTION
      ?auto_119424 - MODE
    )
    :vars
    (
      ?auto_119432 - INSTRUMENT
      ?auto_119429 - SATELLITE
      ?auto_119431 - DIRECTION
      ?auto_119428 - DIRECTION
      ?auto_119430 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119432 ?auto_119429 ) ( SUPPORTS ?auto_119432 ?auto_119426 ) ( not ( = ?auto_119425 ?auto_119431 ) ) ( HAVE_IMAGE ?auto_119427 ?auto_119424 ) ( not ( = ?auto_119427 ?auto_119425 ) ) ( not ( = ?auto_119427 ?auto_119431 ) ) ( not ( = ?auto_119424 ?auto_119426 ) ) ( CALIBRATION_TARGET ?auto_119432 ?auto_119431 ) ( POINTING ?auto_119429 ?auto_119428 ) ( not ( = ?auto_119431 ?auto_119428 ) ) ( not ( = ?auto_119425 ?auto_119428 ) ) ( not ( = ?auto_119427 ?auto_119428 ) ) ( ON_BOARD ?auto_119430 ?auto_119429 ) ( POWER_ON ?auto_119430 ) ( not ( = ?auto_119432 ?auto_119430 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119427 ?auto_119424 ?auto_119425 ?auto_119426 )
      ( GET-2IMAGE-VERIFY ?auto_119425 ?auto_119426 ?auto_119427 ?auto_119424 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_119434 - DIRECTION
      ?auto_119435 - MODE
      ?auto_119436 - DIRECTION
      ?auto_119433 - MODE
    )
    :vars
    (
      ?auto_119440 - INSTRUMENT
      ?auto_119437 - SATELLITE
      ?auto_119439 - DIRECTION
      ?auto_119442 - DIRECTION
      ?auto_119441 - MODE
      ?auto_119438 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119440 ?auto_119437 ) ( SUPPORTS ?auto_119440 ?auto_119435 ) ( not ( = ?auto_119434 ?auto_119439 ) ) ( HAVE_IMAGE ?auto_119442 ?auto_119441 ) ( not ( = ?auto_119442 ?auto_119434 ) ) ( not ( = ?auto_119442 ?auto_119439 ) ) ( not ( = ?auto_119441 ?auto_119435 ) ) ( CALIBRATION_TARGET ?auto_119440 ?auto_119439 ) ( POINTING ?auto_119437 ?auto_119436 ) ( not ( = ?auto_119439 ?auto_119436 ) ) ( not ( = ?auto_119434 ?auto_119436 ) ) ( not ( = ?auto_119442 ?auto_119436 ) ) ( ON_BOARD ?auto_119438 ?auto_119437 ) ( POWER_ON ?auto_119438 ) ( not ( = ?auto_119440 ?auto_119438 ) ) ( HAVE_IMAGE ?auto_119436 ?auto_119433 ) ( not ( = ?auto_119435 ?auto_119433 ) ) ( not ( = ?auto_119433 ?auto_119441 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119442 ?auto_119441 ?auto_119434 ?auto_119435 )
      ( GET-2IMAGE-VERIFY ?auto_119434 ?auto_119435 ?auto_119436 ?auto_119433 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119455 - DIRECTION
      ?auto_119456 - MODE
      ?auto_119457 - DIRECTION
      ?auto_119454 - MODE
      ?auto_119458 - DIRECTION
      ?auto_119459 - MODE
    )
    :vars
    (
      ?auto_119464 - INSTRUMENT
      ?auto_119461 - SATELLITE
      ?auto_119463 - DIRECTION
      ?auto_119460 - DIRECTION
      ?auto_119462 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119464 ?auto_119461 ) ( SUPPORTS ?auto_119464 ?auto_119459 ) ( not ( = ?auto_119458 ?auto_119463 ) ) ( HAVE_IMAGE ?auto_119455 ?auto_119454 ) ( not ( = ?auto_119455 ?auto_119458 ) ) ( not ( = ?auto_119455 ?auto_119463 ) ) ( not ( = ?auto_119454 ?auto_119459 ) ) ( CALIBRATION_TARGET ?auto_119464 ?auto_119463 ) ( POINTING ?auto_119461 ?auto_119460 ) ( not ( = ?auto_119463 ?auto_119460 ) ) ( not ( = ?auto_119458 ?auto_119460 ) ) ( not ( = ?auto_119455 ?auto_119460 ) ) ( ON_BOARD ?auto_119462 ?auto_119461 ) ( POWER_ON ?auto_119462 ) ( not ( = ?auto_119464 ?auto_119462 ) ) ( HAVE_IMAGE ?auto_119455 ?auto_119456 ) ( HAVE_IMAGE ?auto_119457 ?auto_119454 ) ( not ( = ?auto_119455 ?auto_119457 ) ) ( not ( = ?auto_119456 ?auto_119454 ) ) ( not ( = ?auto_119456 ?auto_119459 ) ) ( not ( = ?auto_119457 ?auto_119458 ) ) ( not ( = ?auto_119457 ?auto_119463 ) ) ( not ( = ?auto_119457 ?auto_119460 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119455 ?auto_119454 ?auto_119458 ?auto_119459 )
      ( GET-3IMAGE-VERIFY ?auto_119455 ?auto_119456 ?auto_119457 ?auto_119454 ?auto_119458 ?auto_119459 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119466 - DIRECTION
      ?auto_119467 - MODE
      ?auto_119468 - DIRECTION
      ?auto_119465 - MODE
      ?auto_119469 - DIRECTION
      ?auto_119470 - MODE
    )
    :vars
    (
      ?auto_119474 - INSTRUMENT
      ?auto_119471 - SATELLITE
      ?auto_119473 - DIRECTION
      ?auto_119472 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119474 ?auto_119471 ) ( SUPPORTS ?auto_119474 ?auto_119470 ) ( not ( = ?auto_119469 ?auto_119473 ) ) ( HAVE_IMAGE ?auto_119466 ?auto_119467 ) ( not ( = ?auto_119466 ?auto_119469 ) ) ( not ( = ?auto_119466 ?auto_119473 ) ) ( not ( = ?auto_119467 ?auto_119470 ) ) ( CALIBRATION_TARGET ?auto_119474 ?auto_119473 ) ( POINTING ?auto_119471 ?auto_119468 ) ( not ( = ?auto_119473 ?auto_119468 ) ) ( not ( = ?auto_119469 ?auto_119468 ) ) ( not ( = ?auto_119466 ?auto_119468 ) ) ( ON_BOARD ?auto_119472 ?auto_119471 ) ( POWER_ON ?auto_119472 ) ( not ( = ?auto_119474 ?auto_119472 ) ) ( HAVE_IMAGE ?auto_119468 ?auto_119465 ) ( not ( = ?auto_119467 ?auto_119465 ) ) ( not ( = ?auto_119465 ?auto_119470 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119466 ?auto_119467 ?auto_119469 ?auto_119470 )
      ( GET-3IMAGE-VERIFY ?auto_119466 ?auto_119467 ?auto_119468 ?auto_119465 ?auto_119469 ?auto_119470 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119476 - DIRECTION
      ?auto_119477 - MODE
      ?auto_119478 - DIRECTION
      ?auto_119475 - MODE
      ?auto_119479 - DIRECTION
      ?auto_119480 - MODE
    )
    :vars
    (
      ?auto_119485 - INSTRUMENT
      ?auto_119482 - SATELLITE
      ?auto_119484 - DIRECTION
      ?auto_119481 - DIRECTION
      ?auto_119483 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119485 ?auto_119482 ) ( SUPPORTS ?auto_119485 ?auto_119475 ) ( not ( = ?auto_119478 ?auto_119484 ) ) ( HAVE_IMAGE ?auto_119479 ?auto_119480 ) ( not ( = ?auto_119479 ?auto_119478 ) ) ( not ( = ?auto_119479 ?auto_119484 ) ) ( not ( = ?auto_119480 ?auto_119475 ) ) ( CALIBRATION_TARGET ?auto_119485 ?auto_119484 ) ( POINTING ?auto_119482 ?auto_119481 ) ( not ( = ?auto_119484 ?auto_119481 ) ) ( not ( = ?auto_119478 ?auto_119481 ) ) ( not ( = ?auto_119479 ?auto_119481 ) ) ( ON_BOARD ?auto_119483 ?auto_119482 ) ( POWER_ON ?auto_119483 ) ( not ( = ?auto_119485 ?auto_119483 ) ) ( HAVE_IMAGE ?auto_119476 ?auto_119477 ) ( not ( = ?auto_119476 ?auto_119478 ) ) ( not ( = ?auto_119476 ?auto_119479 ) ) ( not ( = ?auto_119476 ?auto_119484 ) ) ( not ( = ?auto_119476 ?auto_119481 ) ) ( not ( = ?auto_119477 ?auto_119475 ) ) ( not ( = ?auto_119477 ?auto_119480 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119479 ?auto_119480 ?auto_119478 ?auto_119475 )
      ( GET-3IMAGE-VERIFY ?auto_119476 ?auto_119477 ?auto_119478 ?auto_119475 ?auto_119479 ?auto_119480 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119487 - DIRECTION
      ?auto_119488 - MODE
      ?auto_119489 - DIRECTION
      ?auto_119486 - MODE
      ?auto_119490 - DIRECTION
      ?auto_119491 - MODE
    )
    :vars
    (
      ?auto_119495 - INSTRUMENT
      ?auto_119492 - SATELLITE
      ?auto_119494 - DIRECTION
      ?auto_119493 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119495 ?auto_119492 ) ( SUPPORTS ?auto_119495 ?auto_119486 ) ( not ( = ?auto_119489 ?auto_119494 ) ) ( HAVE_IMAGE ?auto_119487 ?auto_119488 ) ( not ( = ?auto_119487 ?auto_119489 ) ) ( not ( = ?auto_119487 ?auto_119494 ) ) ( not ( = ?auto_119488 ?auto_119486 ) ) ( CALIBRATION_TARGET ?auto_119495 ?auto_119494 ) ( POINTING ?auto_119492 ?auto_119490 ) ( not ( = ?auto_119494 ?auto_119490 ) ) ( not ( = ?auto_119489 ?auto_119490 ) ) ( not ( = ?auto_119487 ?auto_119490 ) ) ( ON_BOARD ?auto_119493 ?auto_119492 ) ( POWER_ON ?auto_119493 ) ( not ( = ?auto_119495 ?auto_119493 ) ) ( HAVE_IMAGE ?auto_119490 ?auto_119491 ) ( not ( = ?auto_119488 ?auto_119491 ) ) ( not ( = ?auto_119486 ?auto_119491 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119487 ?auto_119488 ?auto_119489 ?auto_119486 )
      ( GET-3IMAGE-VERIFY ?auto_119487 ?auto_119488 ?auto_119489 ?auto_119486 ?auto_119490 ?auto_119491 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119508 - DIRECTION
      ?auto_119509 - MODE
      ?auto_119510 - DIRECTION
      ?auto_119507 - MODE
      ?auto_119511 - DIRECTION
      ?auto_119512 - MODE
    )
    :vars
    (
      ?auto_119516 - INSTRUMENT
      ?auto_119513 - SATELLITE
      ?auto_119515 - DIRECTION
      ?auto_119514 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119516 ?auto_119513 ) ( SUPPORTS ?auto_119516 ?auto_119512 ) ( not ( = ?auto_119511 ?auto_119515 ) ) ( HAVE_IMAGE ?auto_119510 ?auto_119507 ) ( not ( = ?auto_119510 ?auto_119511 ) ) ( not ( = ?auto_119510 ?auto_119515 ) ) ( not ( = ?auto_119507 ?auto_119512 ) ) ( CALIBRATION_TARGET ?auto_119516 ?auto_119515 ) ( POINTING ?auto_119513 ?auto_119508 ) ( not ( = ?auto_119515 ?auto_119508 ) ) ( not ( = ?auto_119511 ?auto_119508 ) ) ( not ( = ?auto_119510 ?auto_119508 ) ) ( ON_BOARD ?auto_119514 ?auto_119513 ) ( POWER_ON ?auto_119514 ) ( not ( = ?auto_119516 ?auto_119514 ) ) ( HAVE_IMAGE ?auto_119508 ?auto_119509 ) ( not ( = ?auto_119509 ?auto_119507 ) ) ( not ( = ?auto_119509 ?auto_119512 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119510 ?auto_119507 ?auto_119511 ?auto_119512 )
      ( GET-3IMAGE-VERIFY ?auto_119508 ?auto_119509 ?auto_119510 ?auto_119507 ?auto_119511 ?auto_119512 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119518 - DIRECTION
      ?auto_119519 - MODE
      ?auto_119520 - DIRECTION
      ?auto_119517 - MODE
      ?auto_119521 - DIRECTION
      ?auto_119522 - MODE
    )
    :vars
    (
      ?auto_119526 - INSTRUMENT
      ?auto_119523 - SATELLITE
      ?auto_119525 - DIRECTION
      ?auto_119528 - DIRECTION
      ?auto_119527 - MODE
      ?auto_119524 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119526 ?auto_119523 ) ( SUPPORTS ?auto_119526 ?auto_119522 ) ( not ( = ?auto_119521 ?auto_119525 ) ) ( HAVE_IMAGE ?auto_119528 ?auto_119527 ) ( not ( = ?auto_119528 ?auto_119521 ) ) ( not ( = ?auto_119528 ?auto_119525 ) ) ( not ( = ?auto_119527 ?auto_119522 ) ) ( CALIBRATION_TARGET ?auto_119526 ?auto_119525 ) ( POINTING ?auto_119523 ?auto_119520 ) ( not ( = ?auto_119525 ?auto_119520 ) ) ( not ( = ?auto_119521 ?auto_119520 ) ) ( not ( = ?auto_119528 ?auto_119520 ) ) ( ON_BOARD ?auto_119524 ?auto_119523 ) ( POWER_ON ?auto_119524 ) ( not ( = ?auto_119526 ?auto_119524 ) ) ( HAVE_IMAGE ?auto_119518 ?auto_119519 ) ( HAVE_IMAGE ?auto_119520 ?auto_119517 ) ( not ( = ?auto_119518 ?auto_119520 ) ) ( not ( = ?auto_119518 ?auto_119521 ) ) ( not ( = ?auto_119518 ?auto_119525 ) ) ( not ( = ?auto_119518 ?auto_119528 ) ) ( not ( = ?auto_119519 ?auto_119517 ) ) ( not ( = ?auto_119519 ?auto_119522 ) ) ( not ( = ?auto_119519 ?auto_119527 ) ) ( not ( = ?auto_119517 ?auto_119522 ) ) ( not ( = ?auto_119517 ?auto_119527 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119528 ?auto_119527 ?auto_119521 ?auto_119522 )
      ( GET-3IMAGE-VERIFY ?auto_119518 ?auto_119519 ?auto_119520 ?auto_119517 ?auto_119521 ?auto_119522 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119530 - DIRECTION
      ?auto_119531 - MODE
      ?auto_119532 - DIRECTION
      ?auto_119529 - MODE
      ?auto_119533 - DIRECTION
      ?auto_119534 - MODE
    )
    :vars
    (
      ?auto_119538 - INSTRUMENT
      ?auto_119535 - SATELLITE
      ?auto_119537 - DIRECTION
      ?auto_119536 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119538 ?auto_119535 ) ( SUPPORTS ?auto_119538 ?auto_119529 ) ( not ( = ?auto_119532 ?auto_119537 ) ) ( HAVE_IMAGE ?auto_119533 ?auto_119534 ) ( not ( = ?auto_119533 ?auto_119532 ) ) ( not ( = ?auto_119533 ?auto_119537 ) ) ( not ( = ?auto_119534 ?auto_119529 ) ) ( CALIBRATION_TARGET ?auto_119538 ?auto_119537 ) ( POINTING ?auto_119535 ?auto_119530 ) ( not ( = ?auto_119537 ?auto_119530 ) ) ( not ( = ?auto_119532 ?auto_119530 ) ) ( not ( = ?auto_119533 ?auto_119530 ) ) ( ON_BOARD ?auto_119536 ?auto_119535 ) ( POWER_ON ?auto_119536 ) ( not ( = ?auto_119538 ?auto_119536 ) ) ( HAVE_IMAGE ?auto_119530 ?auto_119531 ) ( not ( = ?auto_119531 ?auto_119529 ) ) ( not ( = ?auto_119531 ?auto_119534 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119533 ?auto_119534 ?auto_119532 ?auto_119529 )
      ( GET-3IMAGE-VERIFY ?auto_119530 ?auto_119531 ?auto_119532 ?auto_119529 ?auto_119533 ?auto_119534 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119540 - DIRECTION
      ?auto_119541 - MODE
      ?auto_119542 - DIRECTION
      ?auto_119539 - MODE
      ?auto_119543 - DIRECTION
      ?auto_119544 - MODE
    )
    :vars
    (
      ?auto_119548 - INSTRUMENT
      ?auto_119545 - SATELLITE
      ?auto_119547 - DIRECTION
      ?auto_119550 - DIRECTION
      ?auto_119549 - MODE
      ?auto_119546 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119548 ?auto_119545 ) ( SUPPORTS ?auto_119548 ?auto_119539 ) ( not ( = ?auto_119542 ?auto_119547 ) ) ( HAVE_IMAGE ?auto_119550 ?auto_119549 ) ( not ( = ?auto_119550 ?auto_119542 ) ) ( not ( = ?auto_119550 ?auto_119547 ) ) ( not ( = ?auto_119549 ?auto_119539 ) ) ( CALIBRATION_TARGET ?auto_119548 ?auto_119547 ) ( POINTING ?auto_119545 ?auto_119540 ) ( not ( = ?auto_119547 ?auto_119540 ) ) ( not ( = ?auto_119542 ?auto_119540 ) ) ( not ( = ?auto_119550 ?auto_119540 ) ) ( ON_BOARD ?auto_119546 ?auto_119545 ) ( POWER_ON ?auto_119546 ) ( not ( = ?auto_119548 ?auto_119546 ) ) ( HAVE_IMAGE ?auto_119540 ?auto_119541 ) ( HAVE_IMAGE ?auto_119543 ?auto_119544 ) ( not ( = ?auto_119540 ?auto_119543 ) ) ( not ( = ?auto_119541 ?auto_119539 ) ) ( not ( = ?auto_119541 ?auto_119544 ) ) ( not ( = ?auto_119541 ?auto_119549 ) ) ( not ( = ?auto_119542 ?auto_119543 ) ) ( not ( = ?auto_119539 ?auto_119544 ) ) ( not ( = ?auto_119543 ?auto_119547 ) ) ( not ( = ?auto_119543 ?auto_119550 ) ) ( not ( = ?auto_119544 ?auto_119549 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119550 ?auto_119549 ?auto_119542 ?auto_119539 )
      ( GET-3IMAGE-VERIFY ?auto_119540 ?auto_119541 ?auto_119542 ?auto_119539 ?auto_119543 ?auto_119544 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119564 - DIRECTION
      ?auto_119565 - MODE
      ?auto_119566 - DIRECTION
      ?auto_119563 - MODE
      ?auto_119567 - DIRECTION
      ?auto_119568 - MODE
    )
    :vars
    (
      ?auto_119573 - INSTRUMENT
      ?auto_119570 - SATELLITE
      ?auto_119572 - DIRECTION
      ?auto_119569 - DIRECTION
      ?auto_119571 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119573 ?auto_119570 ) ( SUPPORTS ?auto_119573 ?auto_119565 ) ( not ( = ?auto_119564 ?auto_119572 ) ) ( HAVE_IMAGE ?auto_119566 ?auto_119568 ) ( not ( = ?auto_119566 ?auto_119564 ) ) ( not ( = ?auto_119566 ?auto_119572 ) ) ( not ( = ?auto_119568 ?auto_119565 ) ) ( CALIBRATION_TARGET ?auto_119573 ?auto_119572 ) ( POINTING ?auto_119570 ?auto_119569 ) ( not ( = ?auto_119572 ?auto_119569 ) ) ( not ( = ?auto_119564 ?auto_119569 ) ) ( not ( = ?auto_119566 ?auto_119569 ) ) ( ON_BOARD ?auto_119571 ?auto_119570 ) ( POWER_ON ?auto_119571 ) ( not ( = ?auto_119573 ?auto_119571 ) ) ( HAVE_IMAGE ?auto_119566 ?auto_119563 ) ( HAVE_IMAGE ?auto_119567 ?auto_119568 ) ( not ( = ?auto_119564 ?auto_119567 ) ) ( not ( = ?auto_119565 ?auto_119563 ) ) ( not ( = ?auto_119566 ?auto_119567 ) ) ( not ( = ?auto_119563 ?auto_119568 ) ) ( not ( = ?auto_119567 ?auto_119572 ) ) ( not ( = ?auto_119567 ?auto_119569 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119566 ?auto_119568 ?auto_119564 ?auto_119565 )
      ( GET-3IMAGE-VERIFY ?auto_119564 ?auto_119565 ?auto_119566 ?auto_119563 ?auto_119567 ?auto_119568 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119575 - DIRECTION
      ?auto_119576 - MODE
      ?auto_119577 - DIRECTION
      ?auto_119574 - MODE
      ?auto_119578 - DIRECTION
      ?auto_119579 - MODE
    )
    :vars
    (
      ?auto_119583 - INSTRUMENT
      ?auto_119580 - SATELLITE
      ?auto_119582 - DIRECTION
      ?auto_119581 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119583 ?auto_119580 ) ( SUPPORTS ?auto_119583 ?auto_119576 ) ( not ( = ?auto_119575 ?auto_119582 ) ) ( HAVE_IMAGE ?auto_119577 ?auto_119574 ) ( not ( = ?auto_119577 ?auto_119575 ) ) ( not ( = ?auto_119577 ?auto_119582 ) ) ( not ( = ?auto_119574 ?auto_119576 ) ) ( CALIBRATION_TARGET ?auto_119583 ?auto_119582 ) ( POINTING ?auto_119580 ?auto_119578 ) ( not ( = ?auto_119582 ?auto_119578 ) ) ( not ( = ?auto_119575 ?auto_119578 ) ) ( not ( = ?auto_119577 ?auto_119578 ) ) ( ON_BOARD ?auto_119581 ?auto_119580 ) ( POWER_ON ?auto_119581 ) ( not ( = ?auto_119583 ?auto_119581 ) ) ( HAVE_IMAGE ?auto_119578 ?auto_119579 ) ( not ( = ?auto_119576 ?auto_119579 ) ) ( not ( = ?auto_119574 ?auto_119579 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119577 ?auto_119574 ?auto_119575 ?auto_119576 )
      ( GET-3IMAGE-VERIFY ?auto_119575 ?auto_119576 ?auto_119577 ?auto_119574 ?auto_119578 ?auto_119579 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119596 - DIRECTION
      ?auto_119597 - MODE
      ?auto_119598 - DIRECTION
      ?auto_119595 - MODE
      ?auto_119599 - DIRECTION
      ?auto_119600 - MODE
    )
    :vars
    (
      ?auto_119604 - INSTRUMENT
      ?auto_119601 - SATELLITE
      ?auto_119603 - DIRECTION
      ?auto_119602 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119604 ?auto_119601 ) ( SUPPORTS ?auto_119604 ?auto_119597 ) ( not ( = ?auto_119596 ?auto_119603 ) ) ( HAVE_IMAGE ?auto_119599 ?auto_119600 ) ( not ( = ?auto_119599 ?auto_119596 ) ) ( not ( = ?auto_119599 ?auto_119603 ) ) ( not ( = ?auto_119600 ?auto_119597 ) ) ( CALIBRATION_TARGET ?auto_119604 ?auto_119603 ) ( POINTING ?auto_119601 ?auto_119598 ) ( not ( = ?auto_119603 ?auto_119598 ) ) ( not ( = ?auto_119596 ?auto_119598 ) ) ( not ( = ?auto_119599 ?auto_119598 ) ) ( ON_BOARD ?auto_119602 ?auto_119601 ) ( POWER_ON ?auto_119602 ) ( not ( = ?auto_119604 ?auto_119602 ) ) ( HAVE_IMAGE ?auto_119598 ?auto_119595 ) ( not ( = ?auto_119597 ?auto_119595 ) ) ( not ( = ?auto_119595 ?auto_119600 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119599 ?auto_119600 ?auto_119596 ?auto_119597 )
      ( GET-3IMAGE-VERIFY ?auto_119596 ?auto_119597 ?auto_119598 ?auto_119595 ?auto_119599 ?auto_119600 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_119606 - DIRECTION
      ?auto_119607 - MODE
      ?auto_119608 - DIRECTION
      ?auto_119605 - MODE
      ?auto_119609 - DIRECTION
      ?auto_119610 - MODE
    )
    :vars
    (
      ?auto_119614 - INSTRUMENT
      ?auto_119611 - SATELLITE
      ?auto_119613 - DIRECTION
      ?auto_119616 - DIRECTION
      ?auto_119615 - MODE
      ?auto_119612 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119614 ?auto_119611 ) ( SUPPORTS ?auto_119614 ?auto_119607 ) ( not ( = ?auto_119606 ?auto_119613 ) ) ( HAVE_IMAGE ?auto_119616 ?auto_119615 ) ( not ( = ?auto_119616 ?auto_119606 ) ) ( not ( = ?auto_119616 ?auto_119613 ) ) ( not ( = ?auto_119615 ?auto_119607 ) ) ( CALIBRATION_TARGET ?auto_119614 ?auto_119613 ) ( POINTING ?auto_119611 ?auto_119609 ) ( not ( = ?auto_119613 ?auto_119609 ) ) ( not ( = ?auto_119606 ?auto_119609 ) ) ( not ( = ?auto_119616 ?auto_119609 ) ) ( ON_BOARD ?auto_119612 ?auto_119611 ) ( POWER_ON ?auto_119612 ) ( not ( = ?auto_119614 ?auto_119612 ) ) ( HAVE_IMAGE ?auto_119608 ?auto_119605 ) ( HAVE_IMAGE ?auto_119609 ?auto_119610 ) ( not ( = ?auto_119606 ?auto_119608 ) ) ( not ( = ?auto_119607 ?auto_119605 ) ) ( not ( = ?auto_119607 ?auto_119610 ) ) ( not ( = ?auto_119608 ?auto_119609 ) ) ( not ( = ?auto_119608 ?auto_119613 ) ) ( not ( = ?auto_119608 ?auto_119616 ) ) ( not ( = ?auto_119605 ?auto_119610 ) ) ( not ( = ?auto_119605 ?auto_119615 ) ) ( not ( = ?auto_119610 ?auto_119615 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119616 ?auto_119615 ?auto_119606 ?auto_119607 )
      ( GET-3IMAGE-VERIFY ?auto_119606 ?auto_119607 ?auto_119608 ?auto_119605 ?auto_119609 ?auto_119610 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119666 - DIRECTION
      ?auto_119667 - MODE
      ?auto_119668 - DIRECTION
      ?auto_119665 - MODE
      ?auto_119669 - DIRECTION
      ?auto_119670 - MODE
      ?auto_119671 - DIRECTION
      ?auto_119672 - MODE
    )
    :vars
    (
      ?auto_119677 - INSTRUMENT
      ?auto_119674 - SATELLITE
      ?auto_119676 - DIRECTION
      ?auto_119673 - DIRECTION
      ?auto_119675 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119677 ?auto_119674 ) ( SUPPORTS ?auto_119677 ?auto_119672 ) ( not ( = ?auto_119671 ?auto_119676 ) ) ( HAVE_IMAGE ?auto_119666 ?auto_119667 ) ( not ( = ?auto_119666 ?auto_119671 ) ) ( not ( = ?auto_119666 ?auto_119676 ) ) ( not ( = ?auto_119667 ?auto_119672 ) ) ( CALIBRATION_TARGET ?auto_119677 ?auto_119676 ) ( POINTING ?auto_119674 ?auto_119673 ) ( not ( = ?auto_119676 ?auto_119673 ) ) ( not ( = ?auto_119671 ?auto_119673 ) ) ( not ( = ?auto_119666 ?auto_119673 ) ) ( ON_BOARD ?auto_119675 ?auto_119674 ) ( POWER_ON ?auto_119675 ) ( not ( = ?auto_119677 ?auto_119675 ) ) ( HAVE_IMAGE ?auto_119668 ?auto_119665 ) ( HAVE_IMAGE ?auto_119669 ?auto_119670 ) ( not ( = ?auto_119666 ?auto_119668 ) ) ( not ( = ?auto_119666 ?auto_119669 ) ) ( not ( = ?auto_119667 ?auto_119665 ) ) ( not ( = ?auto_119667 ?auto_119670 ) ) ( not ( = ?auto_119668 ?auto_119669 ) ) ( not ( = ?auto_119668 ?auto_119671 ) ) ( not ( = ?auto_119668 ?auto_119676 ) ) ( not ( = ?auto_119668 ?auto_119673 ) ) ( not ( = ?auto_119665 ?auto_119670 ) ) ( not ( = ?auto_119665 ?auto_119672 ) ) ( not ( = ?auto_119669 ?auto_119671 ) ) ( not ( = ?auto_119669 ?auto_119676 ) ) ( not ( = ?auto_119669 ?auto_119673 ) ) ( not ( = ?auto_119670 ?auto_119672 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119666 ?auto_119667 ?auto_119671 ?auto_119672 )
      ( GET-4IMAGE-VERIFY ?auto_119666 ?auto_119667 ?auto_119668 ?auto_119665 ?auto_119669 ?auto_119670 ?auto_119671 ?auto_119672 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119679 - DIRECTION
      ?auto_119680 - MODE
      ?auto_119681 - DIRECTION
      ?auto_119678 - MODE
      ?auto_119682 - DIRECTION
      ?auto_119683 - MODE
      ?auto_119684 - DIRECTION
      ?auto_119685 - MODE
    )
    :vars
    (
      ?auto_119689 - INSTRUMENT
      ?auto_119686 - SATELLITE
      ?auto_119688 - DIRECTION
      ?auto_119687 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119689 ?auto_119686 ) ( SUPPORTS ?auto_119689 ?auto_119685 ) ( not ( = ?auto_119684 ?auto_119688 ) ) ( HAVE_IMAGE ?auto_119681 ?auto_119680 ) ( not ( = ?auto_119681 ?auto_119684 ) ) ( not ( = ?auto_119681 ?auto_119688 ) ) ( not ( = ?auto_119680 ?auto_119685 ) ) ( CALIBRATION_TARGET ?auto_119689 ?auto_119688 ) ( POINTING ?auto_119686 ?auto_119682 ) ( not ( = ?auto_119688 ?auto_119682 ) ) ( not ( = ?auto_119684 ?auto_119682 ) ) ( not ( = ?auto_119681 ?auto_119682 ) ) ( ON_BOARD ?auto_119687 ?auto_119686 ) ( POWER_ON ?auto_119687 ) ( not ( = ?auto_119689 ?auto_119687 ) ) ( HAVE_IMAGE ?auto_119679 ?auto_119680 ) ( HAVE_IMAGE ?auto_119681 ?auto_119678 ) ( HAVE_IMAGE ?auto_119682 ?auto_119683 ) ( not ( = ?auto_119679 ?auto_119681 ) ) ( not ( = ?auto_119679 ?auto_119682 ) ) ( not ( = ?auto_119679 ?auto_119684 ) ) ( not ( = ?auto_119679 ?auto_119688 ) ) ( not ( = ?auto_119680 ?auto_119678 ) ) ( not ( = ?auto_119680 ?auto_119683 ) ) ( not ( = ?auto_119678 ?auto_119683 ) ) ( not ( = ?auto_119678 ?auto_119685 ) ) ( not ( = ?auto_119683 ?auto_119685 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119681 ?auto_119680 ?auto_119684 ?auto_119685 )
      ( GET-4IMAGE-VERIFY ?auto_119679 ?auto_119680 ?auto_119681 ?auto_119678 ?auto_119682 ?auto_119683 ?auto_119684 ?auto_119685 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119691 - DIRECTION
      ?auto_119692 - MODE
      ?auto_119693 - DIRECTION
      ?auto_119690 - MODE
      ?auto_119694 - DIRECTION
      ?auto_119695 - MODE
      ?auto_119696 - DIRECTION
      ?auto_119697 - MODE
    )
    :vars
    (
      ?auto_119702 - INSTRUMENT
      ?auto_119699 - SATELLITE
      ?auto_119701 - DIRECTION
      ?auto_119698 - DIRECTION
      ?auto_119700 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119702 ?auto_119699 ) ( SUPPORTS ?auto_119702 ?auto_119695 ) ( not ( = ?auto_119694 ?auto_119701 ) ) ( HAVE_IMAGE ?auto_119693 ?auto_119697 ) ( not ( = ?auto_119693 ?auto_119694 ) ) ( not ( = ?auto_119693 ?auto_119701 ) ) ( not ( = ?auto_119697 ?auto_119695 ) ) ( CALIBRATION_TARGET ?auto_119702 ?auto_119701 ) ( POINTING ?auto_119699 ?auto_119698 ) ( not ( = ?auto_119701 ?auto_119698 ) ) ( not ( = ?auto_119694 ?auto_119698 ) ) ( not ( = ?auto_119693 ?auto_119698 ) ) ( ON_BOARD ?auto_119700 ?auto_119699 ) ( POWER_ON ?auto_119700 ) ( not ( = ?auto_119702 ?auto_119700 ) ) ( HAVE_IMAGE ?auto_119691 ?auto_119692 ) ( HAVE_IMAGE ?auto_119693 ?auto_119690 ) ( HAVE_IMAGE ?auto_119696 ?auto_119697 ) ( not ( = ?auto_119691 ?auto_119693 ) ) ( not ( = ?auto_119691 ?auto_119694 ) ) ( not ( = ?auto_119691 ?auto_119696 ) ) ( not ( = ?auto_119691 ?auto_119701 ) ) ( not ( = ?auto_119691 ?auto_119698 ) ) ( not ( = ?auto_119692 ?auto_119690 ) ) ( not ( = ?auto_119692 ?auto_119695 ) ) ( not ( = ?auto_119692 ?auto_119697 ) ) ( not ( = ?auto_119693 ?auto_119696 ) ) ( not ( = ?auto_119690 ?auto_119695 ) ) ( not ( = ?auto_119690 ?auto_119697 ) ) ( not ( = ?auto_119694 ?auto_119696 ) ) ( not ( = ?auto_119696 ?auto_119701 ) ) ( not ( = ?auto_119696 ?auto_119698 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119693 ?auto_119697 ?auto_119694 ?auto_119695 )
      ( GET-4IMAGE-VERIFY ?auto_119691 ?auto_119692 ?auto_119693 ?auto_119690 ?auto_119694 ?auto_119695 ?auto_119696 ?auto_119697 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119704 - DIRECTION
      ?auto_119705 - MODE
      ?auto_119706 - DIRECTION
      ?auto_119703 - MODE
      ?auto_119707 - DIRECTION
      ?auto_119708 - MODE
      ?auto_119709 - DIRECTION
      ?auto_119710 - MODE
    )
    :vars
    (
      ?auto_119714 - INSTRUMENT
      ?auto_119711 - SATELLITE
      ?auto_119713 - DIRECTION
      ?auto_119712 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119714 ?auto_119711 ) ( SUPPORTS ?auto_119714 ?auto_119708 ) ( not ( = ?auto_119707 ?auto_119713 ) ) ( HAVE_IMAGE ?auto_119706 ?auto_119705 ) ( not ( = ?auto_119706 ?auto_119707 ) ) ( not ( = ?auto_119706 ?auto_119713 ) ) ( not ( = ?auto_119705 ?auto_119708 ) ) ( CALIBRATION_TARGET ?auto_119714 ?auto_119713 ) ( POINTING ?auto_119711 ?auto_119709 ) ( not ( = ?auto_119713 ?auto_119709 ) ) ( not ( = ?auto_119707 ?auto_119709 ) ) ( not ( = ?auto_119706 ?auto_119709 ) ) ( ON_BOARD ?auto_119712 ?auto_119711 ) ( POWER_ON ?auto_119712 ) ( not ( = ?auto_119714 ?auto_119712 ) ) ( HAVE_IMAGE ?auto_119704 ?auto_119705 ) ( HAVE_IMAGE ?auto_119706 ?auto_119703 ) ( HAVE_IMAGE ?auto_119709 ?auto_119710 ) ( not ( = ?auto_119704 ?auto_119706 ) ) ( not ( = ?auto_119704 ?auto_119707 ) ) ( not ( = ?auto_119704 ?auto_119709 ) ) ( not ( = ?auto_119704 ?auto_119713 ) ) ( not ( = ?auto_119705 ?auto_119703 ) ) ( not ( = ?auto_119705 ?auto_119710 ) ) ( not ( = ?auto_119703 ?auto_119708 ) ) ( not ( = ?auto_119703 ?auto_119710 ) ) ( not ( = ?auto_119708 ?auto_119710 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119706 ?auto_119705 ?auto_119707 ?auto_119708 )
      ( GET-4IMAGE-VERIFY ?auto_119704 ?auto_119705 ?auto_119706 ?auto_119703 ?auto_119707 ?auto_119708 ?auto_119709 ?auto_119710 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119729 - DIRECTION
      ?auto_119730 - MODE
      ?auto_119731 - DIRECTION
      ?auto_119728 - MODE
      ?auto_119732 - DIRECTION
      ?auto_119733 - MODE
      ?auto_119734 - DIRECTION
      ?auto_119735 - MODE
    )
    :vars
    (
      ?auto_119739 - INSTRUMENT
      ?auto_119736 - SATELLITE
      ?auto_119738 - DIRECTION
      ?auto_119737 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119739 ?auto_119736 ) ( SUPPORTS ?auto_119739 ?auto_119735 ) ( not ( = ?auto_119734 ?auto_119738 ) ) ( HAVE_IMAGE ?auto_119732 ?auto_119733 ) ( not ( = ?auto_119732 ?auto_119734 ) ) ( not ( = ?auto_119732 ?auto_119738 ) ) ( not ( = ?auto_119733 ?auto_119735 ) ) ( CALIBRATION_TARGET ?auto_119739 ?auto_119738 ) ( POINTING ?auto_119736 ?auto_119731 ) ( not ( = ?auto_119738 ?auto_119731 ) ) ( not ( = ?auto_119734 ?auto_119731 ) ) ( not ( = ?auto_119732 ?auto_119731 ) ) ( ON_BOARD ?auto_119737 ?auto_119736 ) ( POWER_ON ?auto_119737 ) ( not ( = ?auto_119739 ?auto_119737 ) ) ( HAVE_IMAGE ?auto_119729 ?auto_119730 ) ( HAVE_IMAGE ?auto_119731 ?auto_119728 ) ( not ( = ?auto_119729 ?auto_119731 ) ) ( not ( = ?auto_119729 ?auto_119732 ) ) ( not ( = ?auto_119729 ?auto_119734 ) ) ( not ( = ?auto_119729 ?auto_119738 ) ) ( not ( = ?auto_119730 ?auto_119728 ) ) ( not ( = ?auto_119730 ?auto_119733 ) ) ( not ( = ?auto_119730 ?auto_119735 ) ) ( not ( = ?auto_119728 ?auto_119733 ) ) ( not ( = ?auto_119728 ?auto_119735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119732 ?auto_119733 ?auto_119734 ?auto_119735 )
      ( GET-4IMAGE-VERIFY ?auto_119729 ?auto_119730 ?auto_119731 ?auto_119728 ?auto_119732 ?auto_119733 ?auto_119734 ?auto_119735 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119741 - DIRECTION
      ?auto_119742 - MODE
      ?auto_119743 - DIRECTION
      ?auto_119740 - MODE
      ?auto_119744 - DIRECTION
      ?auto_119745 - MODE
      ?auto_119746 - DIRECTION
      ?auto_119747 - MODE
    )
    :vars
    (
      ?auto_119751 - INSTRUMENT
      ?auto_119748 - SATELLITE
      ?auto_119750 - DIRECTION
      ?auto_119749 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119751 ?auto_119748 ) ( SUPPORTS ?auto_119751 ?auto_119747 ) ( not ( = ?auto_119746 ?auto_119750 ) ) ( HAVE_IMAGE ?auto_119741 ?auto_119742 ) ( not ( = ?auto_119741 ?auto_119746 ) ) ( not ( = ?auto_119741 ?auto_119750 ) ) ( not ( = ?auto_119742 ?auto_119747 ) ) ( CALIBRATION_TARGET ?auto_119751 ?auto_119750 ) ( POINTING ?auto_119748 ?auto_119744 ) ( not ( = ?auto_119750 ?auto_119744 ) ) ( not ( = ?auto_119746 ?auto_119744 ) ) ( not ( = ?auto_119741 ?auto_119744 ) ) ( ON_BOARD ?auto_119749 ?auto_119748 ) ( POWER_ON ?auto_119749 ) ( not ( = ?auto_119751 ?auto_119749 ) ) ( HAVE_IMAGE ?auto_119743 ?auto_119740 ) ( HAVE_IMAGE ?auto_119744 ?auto_119745 ) ( not ( = ?auto_119741 ?auto_119743 ) ) ( not ( = ?auto_119742 ?auto_119740 ) ) ( not ( = ?auto_119742 ?auto_119745 ) ) ( not ( = ?auto_119743 ?auto_119744 ) ) ( not ( = ?auto_119743 ?auto_119746 ) ) ( not ( = ?auto_119743 ?auto_119750 ) ) ( not ( = ?auto_119740 ?auto_119745 ) ) ( not ( = ?auto_119740 ?auto_119747 ) ) ( not ( = ?auto_119745 ?auto_119747 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119741 ?auto_119742 ?auto_119746 ?auto_119747 )
      ( GET-4IMAGE-VERIFY ?auto_119741 ?auto_119742 ?auto_119743 ?auto_119740 ?auto_119744 ?auto_119745 ?auto_119746 ?auto_119747 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119753 - DIRECTION
      ?auto_119754 - MODE
      ?auto_119755 - DIRECTION
      ?auto_119752 - MODE
      ?auto_119756 - DIRECTION
      ?auto_119757 - MODE
      ?auto_119758 - DIRECTION
      ?auto_119759 - MODE
    )
    :vars
    (
      ?auto_119763 - INSTRUMENT
      ?auto_119760 - SATELLITE
      ?auto_119762 - DIRECTION
      ?auto_119761 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119763 ?auto_119760 ) ( SUPPORTS ?auto_119763 ?auto_119757 ) ( not ( = ?auto_119756 ?auto_119762 ) ) ( HAVE_IMAGE ?auto_119753 ?auto_119759 ) ( not ( = ?auto_119753 ?auto_119756 ) ) ( not ( = ?auto_119753 ?auto_119762 ) ) ( not ( = ?auto_119759 ?auto_119757 ) ) ( CALIBRATION_TARGET ?auto_119763 ?auto_119762 ) ( POINTING ?auto_119760 ?auto_119755 ) ( not ( = ?auto_119762 ?auto_119755 ) ) ( not ( = ?auto_119756 ?auto_119755 ) ) ( not ( = ?auto_119753 ?auto_119755 ) ) ( ON_BOARD ?auto_119761 ?auto_119760 ) ( POWER_ON ?auto_119761 ) ( not ( = ?auto_119763 ?auto_119761 ) ) ( HAVE_IMAGE ?auto_119753 ?auto_119754 ) ( HAVE_IMAGE ?auto_119755 ?auto_119752 ) ( HAVE_IMAGE ?auto_119758 ?auto_119759 ) ( not ( = ?auto_119753 ?auto_119758 ) ) ( not ( = ?auto_119754 ?auto_119752 ) ) ( not ( = ?auto_119754 ?auto_119757 ) ) ( not ( = ?auto_119754 ?auto_119759 ) ) ( not ( = ?auto_119755 ?auto_119758 ) ) ( not ( = ?auto_119752 ?auto_119757 ) ) ( not ( = ?auto_119752 ?auto_119759 ) ) ( not ( = ?auto_119756 ?auto_119758 ) ) ( not ( = ?auto_119758 ?auto_119762 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119753 ?auto_119759 ?auto_119756 ?auto_119757 )
      ( GET-4IMAGE-VERIFY ?auto_119753 ?auto_119754 ?auto_119755 ?auto_119752 ?auto_119756 ?auto_119757 ?auto_119758 ?auto_119759 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119765 - DIRECTION
      ?auto_119766 - MODE
      ?auto_119767 - DIRECTION
      ?auto_119764 - MODE
      ?auto_119768 - DIRECTION
      ?auto_119769 - MODE
      ?auto_119770 - DIRECTION
      ?auto_119771 - MODE
    )
    :vars
    (
      ?auto_119775 - INSTRUMENT
      ?auto_119772 - SATELLITE
      ?auto_119774 - DIRECTION
      ?auto_119773 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119775 ?auto_119772 ) ( SUPPORTS ?auto_119775 ?auto_119769 ) ( not ( = ?auto_119768 ?auto_119774 ) ) ( HAVE_IMAGE ?auto_119765 ?auto_119766 ) ( not ( = ?auto_119765 ?auto_119768 ) ) ( not ( = ?auto_119765 ?auto_119774 ) ) ( not ( = ?auto_119766 ?auto_119769 ) ) ( CALIBRATION_TARGET ?auto_119775 ?auto_119774 ) ( POINTING ?auto_119772 ?auto_119767 ) ( not ( = ?auto_119774 ?auto_119767 ) ) ( not ( = ?auto_119768 ?auto_119767 ) ) ( not ( = ?auto_119765 ?auto_119767 ) ) ( ON_BOARD ?auto_119773 ?auto_119772 ) ( POWER_ON ?auto_119773 ) ( not ( = ?auto_119775 ?auto_119773 ) ) ( HAVE_IMAGE ?auto_119767 ?auto_119764 ) ( HAVE_IMAGE ?auto_119770 ?auto_119771 ) ( not ( = ?auto_119765 ?auto_119770 ) ) ( not ( = ?auto_119766 ?auto_119764 ) ) ( not ( = ?auto_119766 ?auto_119771 ) ) ( not ( = ?auto_119767 ?auto_119770 ) ) ( not ( = ?auto_119764 ?auto_119769 ) ) ( not ( = ?auto_119764 ?auto_119771 ) ) ( not ( = ?auto_119768 ?auto_119770 ) ) ( not ( = ?auto_119769 ?auto_119771 ) ) ( not ( = ?auto_119770 ?auto_119774 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119765 ?auto_119766 ?auto_119768 ?auto_119769 )
      ( GET-4IMAGE-VERIFY ?auto_119765 ?auto_119766 ?auto_119767 ?auto_119764 ?auto_119768 ?auto_119769 ?auto_119770 ?auto_119771 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119789 - DIRECTION
      ?auto_119790 - MODE
      ?auto_119791 - DIRECTION
      ?auto_119788 - MODE
      ?auto_119792 - DIRECTION
      ?auto_119793 - MODE
      ?auto_119794 - DIRECTION
      ?auto_119795 - MODE
    )
    :vars
    (
      ?auto_119800 - INSTRUMENT
      ?auto_119797 - SATELLITE
      ?auto_119799 - DIRECTION
      ?auto_119796 - DIRECTION
      ?auto_119798 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119800 ?auto_119797 ) ( SUPPORTS ?auto_119800 ?auto_119788 ) ( not ( = ?auto_119791 ?auto_119799 ) ) ( HAVE_IMAGE ?auto_119789 ?auto_119795 ) ( not ( = ?auto_119789 ?auto_119791 ) ) ( not ( = ?auto_119789 ?auto_119799 ) ) ( not ( = ?auto_119795 ?auto_119788 ) ) ( CALIBRATION_TARGET ?auto_119800 ?auto_119799 ) ( POINTING ?auto_119797 ?auto_119796 ) ( not ( = ?auto_119799 ?auto_119796 ) ) ( not ( = ?auto_119791 ?auto_119796 ) ) ( not ( = ?auto_119789 ?auto_119796 ) ) ( ON_BOARD ?auto_119798 ?auto_119797 ) ( POWER_ON ?auto_119798 ) ( not ( = ?auto_119800 ?auto_119798 ) ) ( HAVE_IMAGE ?auto_119789 ?auto_119790 ) ( HAVE_IMAGE ?auto_119792 ?auto_119793 ) ( HAVE_IMAGE ?auto_119794 ?auto_119795 ) ( not ( = ?auto_119789 ?auto_119792 ) ) ( not ( = ?auto_119789 ?auto_119794 ) ) ( not ( = ?auto_119790 ?auto_119788 ) ) ( not ( = ?auto_119790 ?auto_119793 ) ) ( not ( = ?auto_119790 ?auto_119795 ) ) ( not ( = ?auto_119791 ?auto_119792 ) ) ( not ( = ?auto_119791 ?auto_119794 ) ) ( not ( = ?auto_119788 ?auto_119793 ) ) ( not ( = ?auto_119792 ?auto_119794 ) ) ( not ( = ?auto_119792 ?auto_119799 ) ) ( not ( = ?auto_119792 ?auto_119796 ) ) ( not ( = ?auto_119793 ?auto_119795 ) ) ( not ( = ?auto_119794 ?auto_119799 ) ) ( not ( = ?auto_119794 ?auto_119796 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119789 ?auto_119795 ?auto_119791 ?auto_119788 )
      ( GET-4IMAGE-VERIFY ?auto_119789 ?auto_119790 ?auto_119791 ?auto_119788 ?auto_119792 ?auto_119793 ?auto_119794 ?auto_119795 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119802 - DIRECTION
      ?auto_119803 - MODE
      ?auto_119804 - DIRECTION
      ?auto_119801 - MODE
      ?auto_119805 - DIRECTION
      ?auto_119806 - MODE
      ?auto_119807 - DIRECTION
      ?auto_119808 - MODE
    )
    :vars
    (
      ?auto_119812 - INSTRUMENT
      ?auto_119809 - SATELLITE
      ?auto_119811 - DIRECTION
      ?auto_119810 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119812 ?auto_119809 ) ( SUPPORTS ?auto_119812 ?auto_119801 ) ( not ( = ?auto_119804 ?auto_119811 ) ) ( HAVE_IMAGE ?auto_119805 ?auto_119806 ) ( not ( = ?auto_119805 ?auto_119804 ) ) ( not ( = ?auto_119805 ?auto_119811 ) ) ( not ( = ?auto_119806 ?auto_119801 ) ) ( CALIBRATION_TARGET ?auto_119812 ?auto_119811 ) ( POINTING ?auto_119809 ?auto_119807 ) ( not ( = ?auto_119811 ?auto_119807 ) ) ( not ( = ?auto_119804 ?auto_119807 ) ) ( not ( = ?auto_119805 ?auto_119807 ) ) ( ON_BOARD ?auto_119810 ?auto_119809 ) ( POWER_ON ?auto_119810 ) ( not ( = ?auto_119812 ?auto_119810 ) ) ( HAVE_IMAGE ?auto_119802 ?auto_119803 ) ( HAVE_IMAGE ?auto_119807 ?auto_119808 ) ( not ( = ?auto_119802 ?auto_119804 ) ) ( not ( = ?auto_119802 ?auto_119805 ) ) ( not ( = ?auto_119802 ?auto_119807 ) ) ( not ( = ?auto_119802 ?auto_119811 ) ) ( not ( = ?auto_119803 ?auto_119801 ) ) ( not ( = ?auto_119803 ?auto_119806 ) ) ( not ( = ?auto_119803 ?auto_119808 ) ) ( not ( = ?auto_119801 ?auto_119808 ) ) ( not ( = ?auto_119806 ?auto_119808 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119805 ?auto_119806 ?auto_119804 ?auto_119801 )
      ( GET-4IMAGE-VERIFY ?auto_119802 ?auto_119803 ?auto_119804 ?auto_119801 ?auto_119805 ?auto_119806 ?auto_119807 ?auto_119808 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119827 - DIRECTION
      ?auto_119828 - MODE
      ?auto_119829 - DIRECTION
      ?auto_119826 - MODE
      ?auto_119830 - DIRECTION
      ?auto_119831 - MODE
      ?auto_119832 - DIRECTION
      ?auto_119833 - MODE
    )
    :vars
    (
      ?auto_119837 - INSTRUMENT
      ?auto_119834 - SATELLITE
      ?auto_119836 - DIRECTION
      ?auto_119835 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119837 ?auto_119834 ) ( SUPPORTS ?auto_119837 ?auto_119826 ) ( not ( = ?auto_119829 ?auto_119836 ) ) ( HAVE_IMAGE ?auto_119827 ?auto_119833 ) ( not ( = ?auto_119827 ?auto_119829 ) ) ( not ( = ?auto_119827 ?auto_119836 ) ) ( not ( = ?auto_119833 ?auto_119826 ) ) ( CALIBRATION_TARGET ?auto_119837 ?auto_119836 ) ( POINTING ?auto_119834 ?auto_119830 ) ( not ( = ?auto_119836 ?auto_119830 ) ) ( not ( = ?auto_119829 ?auto_119830 ) ) ( not ( = ?auto_119827 ?auto_119830 ) ) ( ON_BOARD ?auto_119835 ?auto_119834 ) ( POWER_ON ?auto_119835 ) ( not ( = ?auto_119837 ?auto_119835 ) ) ( HAVE_IMAGE ?auto_119827 ?auto_119828 ) ( HAVE_IMAGE ?auto_119830 ?auto_119831 ) ( HAVE_IMAGE ?auto_119832 ?auto_119833 ) ( not ( = ?auto_119827 ?auto_119832 ) ) ( not ( = ?auto_119828 ?auto_119826 ) ) ( not ( = ?auto_119828 ?auto_119831 ) ) ( not ( = ?auto_119828 ?auto_119833 ) ) ( not ( = ?auto_119829 ?auto_119832 ) ) ( not ( = ?auto_119826 ?auto_119831 ) ) ( not ( = ?auto_119830 ?auto_119832 ) ) ( not ( = ?auto_119831 ?auto_119833 ) ) ( not ( = ?auto_119832 ?auto_119836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119827 ?auto_119833 ?auto_119829 ?auto_119826 )
      ( GET-4IMAGE-VERIFY ?auto_119827 ?auto_119828 ?auto_119829 ?auto_119826 ?auto_119830 ?auto_119831 ?auto_119832 ?auto_119833 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119839 - DIRECTION
      ?auto_119840 - MODE
      ?auto_119841 - DIRECTION
      ?auto_119838 - MODE
      ?auto_119842 - DIRECTION
      ?auto_119843 - MODE
      ?auto_119844 - DIRECTION
      ?auto_119845 - MODE
    )
    :vars
    (
      ?auto_119849 - INSTRUMENT
      ?auto_119846 - SATELLITE
      ?auto_119848 - DIRECTION
      ?auto_119847 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119849 ?auto_119846 ) ( SUPPORTS ?auto_119849 ?auto_119838 ) ( not ( = ?auto_119841 ?auto_119848 ) ) ( HAVE_IMAGE ?auto_119839 ?auto_119840 ) ( not ( = ?auto_119839 ?auto_119841 ) ) ( not ( = ?auto_119839 ?auto_119848 ) ) ( not ( = ?auto_119840 ?auto_119838 ) ) ( CALIBRATION_TARGET ?auto_119849 ?auto_119848 ) ( POINTING ?auto_119846 ?auto_119842 ) ( not ( = ?auto_119848 ?auto_119842 ) ) ( not ( = ?auto_119841 ?auto_119842 ) ) ( not ( = ?auto_119839 ?auto_119842 ) ) ( ON_BOARD ?auto_119847 ?auto_119846 ) ( POWER_ON ?auto_119847 ) ( not ( = ?auto_119849 ?auto_119847 ) ) ( HAVE_IMAGE ?auto_119842 ?auto_119843 ) ( HAVE_IMAGE ?auto_119844 ?auto_119845 ) ( not ( = ?auto_119839 ?auto_119844 ) ) ( not ( = ?auto_119840 ?auto_119843 ) ) ( not ( = ?auto_119840 ?auto_119845 ) ) ( not ( = ?auto_119841 ?auto_119844 ) ) ( not ( = ?auto_119838 ?auto_119843 ) ) ( not ( = ?auto_119838 ?auto_119845 ) ) ( not ( = ?auto_119842 ?auto_119844 ) ) ( not ( = ?auto_119843 ?auto_119845 ) ) ( not ( = ?auto_119844 ?auto_119848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119839 ?auto_119840 ?auto_119841 ?auto_119838 )
      ( GET-4IMAGE-VERIFY ?auto_119839 ?auto_119840 ?auto_119841 ?auto_119838 ?auto_119842 ?auto_119843 ?auto_119844 ?auto_119845 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119901 - DIRECTION
      ?auto_119902 - MODE
      ?auto_119903 - DIRECTION
      ?auto_119900 - MODE
      ?auto_119904 - DIRECTION
      ?auto_119905 - MODE
      ?auto_119906 - DIRECTION
      ?auto_119907 - MODE
    )
    :vars
    (
      ?auto_119911 - INSTRUMENT
      ?auto_119908 - SATELLITE
      ?auto_119910 - DIRECTION
      ?auto_119909 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119911 ?auto_119908 ) ( SUPPORTS ?auto_119911 ?auto_119907 ) ( not ( = ?auto_119906 ?auto_119910 ) ) ( HAVE_IMAGE ?auto_119903 ?auto_119900 ) ( not ( = ?auto_119903 ?auto_119906 ) ) ( not ( = ?auto_119903 ?auto_119910 ) ) ( not ( = ?auto_119900 ?auto_119907 ) ) ( CALIBRATION_TARGET ?auto_119911 ?auto_119910 ) ( POINTING ?auto_119908 ?auto_119901 ) ( not ( = ?auto_119910 ?auto_119901 ) ) ( not ( = ?auto_119906 ?auto_119901 ) ) ( not ( = ?auto_119903 ?auto_119901 ) ) ( ON_BOARD ?auto_119909 ?auto_119908 ) ( POWER_ON ?auto_119909 ) ( not ( = ?auto_119911 ?auto_119909 ) ) ( HAVE_IMAGE ?auto_119901 ?auto_119902 ) ( HAVE_IMAGE ?auto_119904 ?auto_119905 ) ( not ( = ?auto_119901 ?auto_119904 ) ) ( not ( = ?auto_119902 ?auto_119900 ) ) ( not ( = ?auto_119902 ?auto_119905 ) ) ( not ( = ?auto_119902 ?auto_119907 ) ) ( not ( = ?auto_119903 ?auto_119904 ) ) ( not ( = ?auto_119900 ?auto_119905 ) ) ( not ( = ?auto_119904 ?auto_119906 ) ) ( not ( = ?auto_119904 ?auto_119910 ) ) ( not ( = ?auto_119905 ?auto_119907 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119903 ?auto_119900 ?auto_119906 ?auto_119907 )
      ( GET-4IMAGE-VERIFY ?auto_119901 ?auto_119902 ?auto_119903 ?auto_119900 ?auto_119904 ?auto_119905 ?auto_119906 ?auto_119907 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119913 - DIRECTION
      ?auto_119914 - MODE
      ?auto_119915 - DIRECTION
      ?auto_119912 - MODE
      ?auto_119916 - DIRECTION
      ?auto_119917 - MODE
      ?auto_119918 - DIRECTION
      ?auto_119919 - MODE
    )
    :vars
    (
      ?auto_119923 - INSTRUMENT
      ?auto_119920 - SATELLITE
      ?auto_119922 - DIRECTION
      ?auto_119921 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119923 ?auto_119920 ) ( SUPPORTS ?auto_119923 ?auto_119919 ) ( not ( = ?auto_119918 ?auto_119922 ) ) ( HAVE_IMAGE ?auto_119915 ?auto_119912 ) ( not ( = ?auto_119915 ?auto_119918 ) ) ( not ( = ?auto_119915 ?auto_119922 ) ) ( not ( = ?auto_119912 ?auto_119919 ) ) ( CALIBRATION_TARGET ?auto_119923 ?auto_119922 ) ( POINTING ?auto_119920 ?auto_119916 ) ( not ( = ?auto_119922 ?auto_119916 ) ) ( not ( = ?auto_119918 ?auto_119916 ) ) ( not ( = ?auto_119915 ?auto_119916 ) ) ( ON_BOARD ?auto_119921 ?auto_119920 ) ( POWER_ON ?auto_119921 ) ( not ( = ?auto_119923 ?auto_119921 ) ) ( HAVE_IMAGE ?auto_119913 ?auto_119914 ) ( HAVE_IMAGE ?auto_119916 ?auto_119917 ) ( not ( = ?auto_119913 ?auto_119915 ) ) ( not ( = ?auto_119913 ?auto_119916 ) ) ( not ( = ?auto_119913 ?auto_119918 ) ) ( not ( = ?auto_119913 ?auto_119922 ) ) ( not ( = ?auto_119914 ?auto_119912 ) ) ( not ( = ?auto_119914 ?auto_119917 ) ) ( not ( = ?auto_119914 ?auto_119919 ) ) ( not ( = ?auto_119912 ?auto_119917 ) ) ( not ( = ?auto_119917 ?auto_119919 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119915 ?auto_119912 ?auto_119918 ?auto_119919 )
      ( GET-4IMAGE-VERIFY ?auto_119913 ?auto_119914 ?auto_119915 ?auto_119912 ?auto_119916 ?auto_119917 ?auto_119918 ?auto_119919 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119925 - DIRECTION
      ?auto_119926 - MODE
      ?auto_119927 - DIRECTION
      ?auto_119924 - MODE
      ?auto_119928 - DIRECTION
      ?auto_119929 - MODE
      ?auto_119930 - DIRECTION
      ?auto_119931 - MODE
    )
    :vars
    (
      ?auto_119935 - INSTRUMENT
      ?auto_119932 - SATELLITE
      ?auto_119934 - DIRECTION
      ?auto_119933 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119935 ?auto_119932 ) ( SUPPORTS ?auto_119935 ?auto_119929 ) ( not ( = ?auto_119928 ?auto_119934 ) ) ( HAVE_IMAGE ?auto_119927 ?auto_119931 ) ( not ( = ?auto_119927 ?auto_119928 ) ) ( not ( = ?auto_119927 ?auto_119934 ) ) ( not ( = ?auto_119931 ?auto_119929 ) ) ( CALIBRATION_TARGET ?auto_119935 ?auto_119934 ) ( POINTING ?auto_119932 ?auto_119925 ) ( not ( = ?auto_119934 ?auto_119925 ) ) ( not ( = ?auto_119928 ?auto_119925 ) ) ( not ( = ?auto_119927 ?auto_119925 ) ) ( ON_BOARD ?auto_119933 ?auto_119932 ) ( POWER_ON ?auto_119933 ) ( not ( = ?auto_119935 ?auto_119933 ) ) ( HAVE_IMAGE ?auto_119925 ?auto_119926 ) ( HAVE_IMAGE ?auto_119927 ?auto_119924 ) ( HAVE_IMAGE ?auto_119930 ?auto_119931 ) ( not ( = ?auto_119925 ?auto_119930 ) ) ( not ( = ?auto_119926 ?auto_119924 ) ) ( not ( = ?auto_119926 ?auto_119929 ) ) ( not ( = ?auto_119926 ?auto_119931 ) ) ( not ( = ?auto_119927 ?auto_119930 ) ) ( not ( = ?auto_119924 ?auto_119929 ) ) ( not ( = ?auto_119924 ?auto_119931 ) ) ( not ( = ?auto_119928 ?auto_119930 ) ) ( not ( = ?auto_119930 ?auto_119934 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119927 ?auto_119931 ?auto_119928 ?auto_119929 )
      ( GET-4IMAGE-VERIFY ?auto_119925 ?auto_119926 ?auto_119927 ?auto_119924 ?auto_119928 ?auto_119929 ?auto_119930 ?auto_119931 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119937 - DIRECTION
      ?auto_119938 - MODE
      ?auto_119939 - DIRECTION
      ?auto_119936 - MODE
      ?auto_119940 - DIRECTION
      ?auto_119941 - MODE
      ?auto_119942 - DIRECTION
      ?auto_119943 - MODE
    )
    :vars
    (
      ?auto_119947 - INSTRUMENT
      ?auto_119944 - SATELLITE
      ?auto_119946 - DIRECTION
      ?auto_119945 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119947 ?auto_119944 ) ( SUPPORTS ?auto_119947 ?auto_119941 ) ( not ( = ?auto_119940 ?auto_119946 ) ) ( HAVE_IMAGE ?auto_119939 ?auto_119936 ) ( not ( = ?auto_119939 ?auto_119940 ) ) ( not ( = ?auto_119939 ?auto_119946 ) ) ( not ( = ?auto_119936 ?auto_119941 ) ) ( CALIBRATION_TARGET ?auto_119947 ?auto_119946 ) ( POINTING ?auto_119944 ?auto_119937 ) ( not ( = ?auto_119946 ?auto_119937 ) ) ( not ( = ?auto_119940 ?auto_119937 ) ) ( not ( = ?auto_119939 ?auto_119937 ) ) ( ON_BOARD ?auto_119945 ?auto_119944 ) ( POWER_ON ?auto_119945 ) ( not ( = ?auto_119947 ?auto_119945 ) ) ( HAVE_IMAGE ?auto_119937 ?auto_119938 ) ( HAVE_IMAGE ?auto_119942 ?auto_119943 ) ( not ( = ?auto_119937 ?auto_119942 ) ) ( not ( = ?auto_119938 ?auto_119936 ) ) ( not ( = ?auto_119938 ?auto_119941 ) ) ( not ( = ?auto_119938 ?auto_119943 ) ) ( not ( = ?auto_119939 ?auto_119942 ) ) ( not ( = ?auto_119936 ?auto_119943 ) ) ( not ( = ?auto_119940 ?auto_119942 ) ) ( not ( = ?auto_119941 ?auto_119943 ) ) ( not ( = ?auto_119942 ?auto_119946 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119939 ?auto_119936 ?auto_119940 ?auto_119941 )
      ( GET-4IMAGE-VERIFY ?auto_119937 ?auto_119938 ?auto_119939 ?auto_119936 ?auto_119940 ?auto_119941 ?auto_119942 ?auto_119943 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119961 - DIRECTION
      ?auto_119962 - MODE
      ?auto_119963 - DIRECTION
      ?auto_119960 - MODE
      ?auto_119964 - DIRECTION
      ?auto_119965 - MODE
      ?auto_119966 - DIRECTION
      ?auto_119967 - MODE
    )
    :vars
    (
      ?auto_119971 - INSTRUMENT
      ?auto_119968 - SATELLITE
      ?auto_119970 - DIRECTION
      ?auto_119969 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119971 ?auto_119968 ) ( SUPPORTS ?auto_119971 ?auto_119967 ) ( not ( = ?auto_119966 ?auto_119970 ) ) ( HAVE_IMAGE ?auto_119964 ?auto_119965 ) ( not ( = ?auto_119964 ?auto_119966 ) ) ( not ( = ?auto_119964 ?auto_119970 ) ) ( not ( = ?auto_119965 ?auto_119967 ) ) ( CALIBRATION_TARGET ?auto_119971 ?auto_119970 ) ( POINTING ?auto_119968 ?auto_119961 ) ( not ( = ?auto_119970 ?auto_119961 ) ) ( not ( = ?auto_119966 ?auto_119961 ) ) ( not ( = ?auto_119964 ?auto_119961 ) ) ( ON_BOARD ?auto_119969 ?auto_119968 ) ( POWER_ON ?auto_119969 ) ( not ( = ?auto_119971 ?auto_119969 ) ) ( HAVE_IMAGE ?auto_119961 ?auto_119962 ) ( HAVE_IMAGE ?auto_119963 ?auto_119960 ) ( not ( = ?auto_119961 ?auto_119963 ) ) ( not ( = ?auto_119962 ?auto_119960 ) ) ( not ( = ?auto_119962 ?auto_119965 ) ) ( not ( = ?auto_119962 ?auto_119967 ) ) ( not ( = ?auto_119963 ?auto_119964 ) ) ( not ( = ?auto_119963 ?auto_119966 ) ) ( not ( = ?auto_119963 ?auto_119970 ) ) ( not ( = ?auto_119960 ?auto_119965 ) ) ( not ( = ?auto_119960 ?auto_119967 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119964 ?auto_119965 ?auto_119966 ?auto_119967 )
      ( GET-4IMAGE-VERIFY ?auto_119961 ?auto_119962 ?auto_119963 ?auto_119960 ?auto_119964 ?auto_119965 ?auto_119966 ?auto_119967 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119973 - DIRECTION
      ?auto_119974 - MODE
      ?auto_119975 - DIRECTION
      ?auto_119972 - MODE
      ?auto_119976 - DIRECTION
      ?auto_119977 - MODE
      ?auto_119978 - DIRECTION
      ?auto_119979 - MODE
    )
    :vars
    (
      ?auto_119983 - INSTRUMENT
      ?auto_119980 - SATELLITE
      ?auto_119982 - DIRECTION
      ?auto_119985 - DIRECTION
      ?auto_119984 - MODE
      ?auto_119981 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119983 ?auto_119980 ) ( SUPPORTS ?auto_119983 ?auto_119979 ) ( not ( = ?auto_119978 ?auto_119982 ) ) ( HAVE_IMAGE ?auto_119985 ?auto_119984 ) ( not ( = ?auto_119985 ?auto_119978 ) ) ( not ( = ?auto_119985 ?auto_119982 ) ) ( not ( = ?auto_119984 ?auto_119979 ) ) ( CALIBRATION_TARGET ?auto_119983 ?auto_119982 ) ( POINTING ?auto_119980 ?auto_119976 ) ( not ( = ?auto_119982 ?auto_119976 ) ) ( not ( = ?auto_119978 ?auto_119976 ) ) ( not ( = ?auto_119985 ?auto_119976 ) ) ( ON_BOARD ?auto_119981 ?auto_119980 ) ( POWER_ON ?auto_119981 ) ( not ( = ?auto_119983 ?auto_119981 ) ) ( HAVE_IMAGE ?auto_119973 ?auto_119974 ) ( HAVE_IMAGE ?auto_119975 ?auto_119972 ) ( HAVE_IMAGE ?auto_119976 ?auto_119977 ) ( not ( = ?auto_119973 ?auto_119975 ) ) ( not ( = ?auto_119973 ?auto_119976 ) ) ( not ( = ?auto_119973 ?auto_119978 ) ) ( not ( = ?auto_119973 ?auto_119982 ) ) ( not ( = ?auto_119973 ?auto_119985 ) ) ( not ( = ?auto_119974 ?auto_119972 ) ) ( not ( = ?auto_119974 ?auto_119977 ) ) ( not ( = ?auto_119974 ?auto_119979 ) ) ( not ( = ?auto_119974 ?auto_119984 ) ) ( not ( = ?auto_119975 ?auto_119976 ) ) ( not ( = ?auto_119975 ?auto_119978 ) ) ( not ( = ?auto_119975 ?auto_119982 ) ) ( not ( = ?auto_119975 ?auto_119985 ) ) ( not ( = ?auto_119972 ?auto_119977 ) ) ( not ( = ?auto_119972 ?auto_119979 ) ) ( not ( = ?auto_119972 ?auto_119984 ) ) ( not ( = ?auto_119977 ?auto_119979 ) ) ( not ( = ?auto_119977 ?auto_119984 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119985 ?auto_119984 ?auto_119978 ?auto_119979 )
      ( GET-4IMAGE-VERIFY ?auto_119973 ?auto_119974 ?auto_119975 ?auto_119972 ?auto_119976 ?auto_119977 ?auto_119978 ?auto_119979 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119987 - DIRECTION
      ?auto_119988 - MODE
      ?auto_119989 - DIRECTION
      ?auto_119986 - MODE
      ?auto_119990 - DIRECTION
      ?auto_119991 - MODE
      ?auto_119992 - DIRECTION
      ?auto_119993 - MODE
    )
    :vars
    (
      ?auto_119997 - INSTRUMENT
      ?auto_119994 - SATELLITE
      ?auto_119996 - DIRECTION
      ?auto_119995 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_119997 ?auto_119994 ) ( SUPPORTS ?auto_119997 ?auto_119991 ) ( not ( = ?auto_119990 ?auto_119996 ) ) ( HAVE_IMAGE ?auto_119992 ?auto_119993 ) ( not ( = ?auto_119992 ?auto_119990 ) ) ( not ( = ?auto_119992 ?auto_119996 ) ) ( not ( = ?auto_119993 ?auto_119991 ) ) ( CALIBRATION_TARGET ?auto_119997 ?auto_119996 ) ( POINTING ?auto_119994 ?auto_119987 ) ( not ( = ?auto_119996 ?auto_119987 ) ) ( not ( = ?auto_119990 ?auto_119987 ) ) ( not ( = ?auto_119992 ?auto_119987 ) ) ( ON_BOARD ?auto_119995 ?auto_119994 ) ( POWER_ON ?auto_119995 ) ( not ( = ?auto_119997 ?auto_119995 ) ) ( HAVE_IMAGE ?auto_119987 ?auto_119988 ) ( HAVE_IMAGE ?auto_119989 ?auto_119986 ) ( not ( = ?auto_119987 ?auto_119989 ) ) ( not ( = ?auto_119988 ?auto_119986 ) ) ( not ( = ?auto_119988 ?auto_119991 ) ) ( not ( = ?auto_119988 ?auto_119993 ) ) ( not ( = ?auto_119989 ?auto_119990 ) ) ( not ( = ?auto_119989 ?auto_119992 ) ) ( not ( = ?auto_119989 ?auto_119996 ) ) ( not ( = ?auto_119986 ?auto_119991 ) ) ( not ( = ?auto_119986 ?auto_119993 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_119992 ?auto_119993 ?auto_119990 ?auto_119991 )
      ( GET-4IMAGE-VERIFY ?auto_119987 ?auto_119988 ?auto_119989 ?auto_119986 ?auto_119990 ?auto_119991 ?auto_119992 ?auto_119993 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_119999 - DIRECTION
      ?auto_120000 - MODE
      ?auto_120001 - DIRECTION
      ?auto_119998 - MODE
      ?auto_120002 - DIRECTION
      ?auto_120003 - MODE
      ?auto_120004 - DIRECTION
      ?auto_120005 - MODE
    )
    :vars
    (
      ?auto_120009 - INSTRUMENT
      ?auto_120006 - SATELLITE
      ?auto_120008 - DIRECTION
      ?auto_120011 - DIRECTION
      ?auto_120010 - MODE
      ?auto_120007 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120009 ?auto_120006 ) ( SUPPORTS ?auto_120009 ?auto_120003 ) ( not ( = ?auto_120002 ?auto_120008 ) ) ( HAVE_IMAGE ?auto_120011 ?auto_120010 ) ( not ( = ?auto_120011 ?auto_120002 ) ) ( not ( = ?auto_120011 ?auto_120008 ) ) ( not ( = ?auto_120010 ?auto_120003 ) ) ( CALIBRATION_TARGET ?auto_120009 ?auto_120008 ) ( POINTING ?auto_120006 ?auto_119999 ) ( not ( = ?auto_120008 ?auto_119999 ) ) ( not ( = ?auto_120002 ?auto_119999 ) ) ( not ( = ?auto_120011 ?auto_119999 ) ) ( ON_BOARD ?auto_120007 ?auto_120006 ) ( POWER_ON ?auto_120007 ) ( not ( = ?auto_120009 ?auto_120007 ) ) ( HAVE_IMAGE ?auto_119999 ?auto_120000 ) ( HAVE_IMAGE ?auto_120001 ?auto_119998 ) ( HAVE_IMAGE ?auto_120004 ?auto_120005 ) ( not ( = ?auto_119999 ?auto_120001 ) ) ( not ( = ?auto_119999 ?auto_120004 ) ) ( not ( = ?auto_120000 ?auto_119998 ) ) ( not ( = ?auto_120000 ?auto_120003 ) ) ( not ( = ?auto_120000 ?auto_120005 ) ) ( not ( = ?auto_120000 ?auto_120010 ) ) ( not ( = ?auto_120001 ?auto_120002 ) ) ( not ( = ?auto_120001 ?auto_120004 ) ) ( not ( = ?auto_120001 ?auto_120008 ) ) ( not ( = ?auto_120001 ?auto_120011 ) ) ( not ( = ?auto_119998 ?auto_120003 ) ) ( not ( = ?auto_119998 ?auto_120005 ) ) ( not ( = ?auto_119998 ?auto_120010 ) ) ( not ( = ?auto_120002 ?auto_120004 ) ) ( not ( = ?auto_120003 ?auto_120005 ) ) ( not ( = ?auto_120004 ?auto_120008 ) ) ( not ( = ?auto_120004 ?auto_120011 ) ) ( not ( = ?auto_120005 ?auto_120010 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120011 ?auto_120010 ?auto_120002 ?auto_120003 )
      ( GET-4IMAGE-VERIFY ?auto_119999 ?auto_120000 ?auto_120001 ?auto_119998 ?auto_120002 ?auto_120003 ?auto_120004 ?auto_120005 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120027 - DIRECTION
      ?auto_120028 - MODE
      ?auto_120029 - DIRECTION
      ?auto_120026 - MODE
      ?auto_120030 - DIRECTION
      ?auto_120031 - MODE
      ?auto_120032 - DIRECTION
      ?auto_120033 - MODE
    )
    :vars
    (
      ?auto_120037 - INSTRUMENT
      ?auto_120034 - SATELLITE
      ?auto_120036 - DIRECTION
      ?auto_120035 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120037 ?auto_120034 ) ( SUPPORTS ?auto_120037 ?auto_120026 ) ( not ( = ?auto_120029 ?auto_120036 ) ) ( HAVE_IMAGE ?auto_120030 ?auto_120033 ) ( not ( = ?auto_120030 ?auto_120029 ) ) ( not ( = ?auto_120030 ?auto_120036 ) ) ( not ( = ?auto_120033 ?auto_120026 ) ) ( CALIBRATION_TARGET ?auto_120037 ?auto_120036 ) ( POINTING ?auto_120034 ?auto_120027 ) ( not ( = ?auto_120036 ?auto_120027 ) ) ( not ( = ?auto_120029 ?auto_120027 ) ) ( not ( = ?auto_120030 ?auto_120027 ) ) ( ON_BOARD ?auto_120035 ?auto_120034 ) ( POWER_ON ?auto_120035 ) ( not ( = ?auto_120037 ?auto_120035 ) ) ( HAVE_IMAGE ?auto_120027 ?auto_120028 ) ( HAVE_IMAGE ?auto_120030 ?auto_120031 ) ( HAVE_IMAGE ?auto_120032 ?auto_120033 ) ( not ( = ?auto_120027 ?auto_120032 ) ) ( not ( = ?auto_120028 ?auto_120026 ) ) ( not ( = ?auto_120028 ?auto_120031 ) ) ( not ( = ?auto_120028 ?auto_120033 ) ) ( not ( = ?auto_120029 ?auto_120032 ) ) ( not ( = ?auto_120026 ?auto_120031 ) ) ( not ( = ?auto_120030 ?auto_120032 ) ) ( not ( = ?auto_120031 ?auto_120033 ) ) ( not ( = ?auto_120032 ?auto_120036 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120030 ?auto_120033 ?auto_120029 ?auto_120026 )
      ( GET-4IMAGE-VERIFY ?auto_120027 ?auto_120028 ?auto_120029 ?auto_120026 ?auto_120030 ?auto_120031 ?auto_120032 ?auto_120033 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120039 - DIRECTION
      ?auto_120040 - MODE
      ?auto_120041 - DIRECTION
      ?auto_120038 - MODE
      ?auto_120042 - DIRECTION
      ?auto_120043 - MODE
      ?auto_120044 - DIRECTION
      ?auto_120045 - MODE
    )
    :vars
    (
      ?auto_120049 - INSTRUMENT
      ?auto_120046 - SATELLITE
      ?auto_120048 - DIRECTION
      ?auto_120047 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120049 ?auto_120046 ) ( SUPPORTS ?auto_120049 ?auto_120038 ) ( not ( = ?auto_120041 ?auto_120048 ) ) ( HAVE_IMAGE ?auto_120042 ?auto_120043 ) ( not ( = ?auto_120042 ?auto_120041 ) ) ( not ( = ?auto_120042 ?auto_120048 ) ) ( not ( = ?auto_120043 ?auto_120038 ) ) ( CALIBRATION_TARGET ?auto_120049 ?auto_120048 ) ( POINTING ?auto_120046 ?auto_120039 ) ( not ( = ?auto_120048 ?auto_120039 ) ) ( not ( = ?auto_120041 ?auto_120039 ) ) ( not ( = ?auto_120042 ?auto_120039 ) ) ( ON_BOARD ?auto_120047 ?auto_120046 ) ( POWER_ON ?auto_120047 ) ( not ( = ?auto_120049 ?auto_120047 ) ) ( HAVE_IMAGE ?auto_120039 ?auto_120040 ) ( HAVE_IMAGE ?auto_120044 ?auto_120045 ) ( not ( = ?auto_120039 ?auto_120044 ) ) ( not ( = ?auto_120040 ?auto_120038 ) ) ( not ( = ?auto_120040 ?auto_120043 ) ) ( not ( = ?auto_120040 ?auto_120045 ) ) ( not ( = ?auto_120041 ?auto_120044 ) ) ( not ( = ?auto_120038 ?auto_120045 ) ) ( not ( = ?auto_120042 ?auto_120044 ) ) ( not ( = ?auto_120043 ?auto_120045 ) ) ( not ( = ?auto_120044 ?auto_120048 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120042 ?auto_120043 ?auto_120041 ?auto_120038 )
      ( GET-4IMAGE-VERIFY ?auto_120039 ?auto_120040 ?auto_120041 ?auto_120038 ?auto_120042 ?auto_120043 ?auto_120044 ?auto_120045 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120063 - DIRECTION
      ?auto_120064 - MODE
      ?auto_120065 - DIRECTION
      ?auto_120062 - MODE
      ?auto_120066 - DIRECTION
      ?auto_120067 - MODE
      ?auto_120068 - DIRECTION
      ?auto_120069 - MODE
    )
    :vars
    (
      ?auto_120073 - INSTRUMENT
      ?auto_120070 - SATELLITE
      ?auto_120072 - DIRECTION
      ?auto_120071 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120073 ?auto_120070 ) ( SUPPORTS ?auto_120073 ?auto_120062 ) ( not ( = ?auto_120065 ?auto_120072 ) ) ( HAVE_IMAGE ?auto_120068 ?auto_120069 ) ( not ( = ?auto_120068 ?auto_120065 ) ) ( not ( = ?auto_120068 ?auto_120072 ) ) ( not ( = ?auto_120069 ?auto_120062 ) ) ( CALIBRATION_TARGET ?auto_120073 ?auto_120072 ) ( POINTING ?auto_120070 ?auto_120063 ) ( not ( = ?auto_120072 ?auto_120063 ) ) ( not ( = ?auto_120065 ?auto_120063 ) ) ( not ( = ?auto_120068 ?auto_120063 ) ) ( ON_BOARD ?auto_120071 ?auto_120070 ) ( POWER_ON ?auto_120071 ) ( not ( = ?auto_120073 ?auto_120071 ) ) ( HAVE_IMAGE ?auto_120063 ?auto_120064 ) ( HAVE_IMAGE ?auto_120066 ?auto_120067 ) ( not ( = ?auto_120063 ?auto_120066 ) ) ( not ( = ?auto_120064 ?auto_120062 ) ) ( not ( = ?auto_120064 ?auto_120067 ) ) ( not ( = ?auto_120064 ?auto_120069 ) ) ( not ( = ?auto_120065 ?auto_120066 ) ) ( not ( = ?auto_120062 ?auto_120067 ) ) ( not ( = ?auto_120066 ?auto_120068 ) ) ( not ( = ?auto_120066 ?auto_120072 ) ) ( not ( = ?auto_120067 ?auto_120069 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120068 ?auto_120069 ?auto_120065 ?auto_120062 )
      ( GET-4IMAGE-VERIFY ?auto_120063 ?auto_120064 ?auto_120065 ?auto_120062 ?auto_120066 ?auto_120067 ?auto_120068 ?auto_120069 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120075 - DIRECTION
      ?auto_120076 - MODE
      ?auto_120077 - DIRECTION
      ?auto_120074 - MODE
      ?auto_120078 - DIRECTION
      ?auto_120079 - MODE
      ?auto_120080 - DIRECTION
      ?auto_120081 - MODE
    )
    :vars
    (
      ?auto_120085 - INSTRUMENT
      ?auto_120082 - SATELLITE
      ?auto_120084 - DIRECTION
      ?auto_120087 - DIRECTION
      ?auto_120086 - MODE
      ?auto_120083 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120085 ?auto_120082 ) ( SUPPORTS ?auto_120085 ?auto_120074 ) ( not ( = ?auto_120077 ?auto_120084 ) ) ( HAVE_IMAGE ?auto_120087 ?auto_120086 ) ( not ( = ?auto_120087 ?auto_120077 ) ) ( not ( = ?auto_120087 ?auto_120084 ) ) ( not ( = ?auto_120086 ?auto_120074 ) ) ( CALIBRATION_TARGET ?auto_120085 ?auto_120084 ) ( POINTING ?auto_120082 ?auto_120078 ) ( not ( = ?auto_120084 ?auto_120078 ) ) ( not ( = ?auto_120077 ?auto_120078 ) ) ( not ( = ?auto_120087 ?auto_120078 ) ) ( ON_BOARD ?auto_120083 ?auto_120082 ) ( POWER_ON ?auto_120083 ) ( not ( = ?auto_120085 ?auto_120083 ) ) ( HAVE_IMAGE ?auto_120075 ?auto_120076 ) ( HAVE_IMAGE ?auto_120078 ?auto_120079 ) ( HAVE_IMAGE ?auto_120080 ?auto_120081 ) ( not ( = ?auto_120075 ?auto_120077 ) ) ( not ( = ?auto_120075 ?auto_120078 ) ) ( not ( = ?auto_120075 ?auto_120080 ) ) ( not ( = ?auto_120075 ?auto_120084 ) ) ( not ( = ?auto_120075 ?auto_120087 ) ) ( not ( = ?auto_120076 ?auto_120074 ) ) ( not ( = ?auto_120076 ?auto_120079 ) ) ( not ( = ?auto_120076 ?auto_120081 ) ) ( not ( = ?auto_120076 ?auto_120086 ) ) ( not ( = ?auto_120077 ?auto_120080 ) ) ( not ( = ?auto_120074 ?auto_120079 ) ) ( not ( = ?auto_120074 ?auto_120081 ) ) ( not ( = ?auto_120078 ?auto_120080 ) ) ( not ( = ?auto_120079 ?auto_120081 ) ) ( not ( = ?auto_120079 ?auto_120086 ) ) ( not ( = ?auto_120080 ?auto_120084 ) ) ( not ( = ?auto_120080 ?auto_120087 ) ) ( not ( = ?auto_120081 ?auto_120086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120087 ?auto_120086 ?auto_120077 ?auto_120074 )
      ( GET-4IMAGE-VERIFY ?auto_120075 ?auto_120076 ?auto_120077 ?auto_120074 ?auto_120078 ?auto_120079 ?auto_120080 ?auto_120081 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120143 - DIRECTION
      ?auto_120144 - MODE
      ?auto_120145 - DIRECTION
      ?auto_120142 - MODE
      ?auto_120146 - DIRECTION
      ?auto_120147 - MODE
      ?auto_120148 - DIRECTION
      ?auto_120149 - MODE
    )
    :vars
    (
      ?auto_120154 - INSTRUMENT
      ?auto_120151 - SATELLITE
      ?auto_120153 - DIRECTION
      ?auto_120150 - DIRECTION
      ?auto_120152 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120154 ?auto_120151 ) ( SUPPORTS ?auto_120154 ?auto_120144 ) ( not ( = ?auto_120143 ?auto_120153 ) ) ( HAVE_IMAGE ?auto_120146 ?auto_120149 ) ( not ( = ?auto_120146 ?auto_120143 ) ) ( not ( = ?auto_120146 ?auto_120153 ) ) ( not ( = ?auto_120149 ?auto_120144 ) ) ( CALIBRATION_TARGET ?auto_120154 ?auto_120153 ) ( POINTING ?auto_120151 ?auto_120150 ) ( not ( = ?auto_120153 ?auto_120150 ) ) ( not ( = ?auto_120143 ?auto_120150 ) ) ( not ( = ?auto_120146 ?auto_120150 ) ) ( ON_BOARD ?auto_120152 ?auto_120151 ) ( POWER_ON ?auto_120152 ) ( not ( = ?auto_120154 ?auto_120152 ) ) ( HAVE_IMAGE ?auto_120145 ?auto_120142 ) ( HAVE_IMAGE ?auto_120146 ?auto_120147 ) ( HAVE_IMAGE ?auto_120148 ?auto_120149 ) ( not ( = ?auto_120143 ?auto_120145 ) ) ( not ( = ?auto_120143 ?auto_120148 ) ) ( not ( = ?auto_120144 ?auto_120142 ) ) ( not ( = ?auto_120144 ?auto_120147 ) ) ( not ( = ?auto_120145 ?auto_120146 ) ) ( not ( = ?auto_120145 ?auto_120148 ) ) ( not ( = ?auto_120145 ?auto_120153 ) ) ( not ( = ?auto_120145 ?auto_120150 ) ) ( not ( = ?auto_120142 ?auto_120147 ) ) ( not ( = ?auto_120142 ?auto_120149 ) ) ( not ( = ?auto_120146 ?auto_120148 ) ) ( not ( = ?auto_120147 ?auto_120149 ) ) ( not ( = ?auto_120148 ?auto_120153 ) ) ( not ( = ?auto_120148 ?auto_120150 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120146 ?auto_120149 ?auto_120143 ?auto_120144 )
      ( GET-4IMAGE-VERIFY ?auto_120143 ?auto_120144 ?auto_120145 ?auto_120142 ?auto_120146 ?auto_120147 ?auto_120148 ?auto_120149 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120156 - DIRECTION
      ?auto_120157 - MODE
      ?auto_120158 - DIRECTION
      ?auto_120155 - MODE
      ?auto_120159 - DIRECTION
      ?auto_120160 - MODE
      ?auto_120161 - DIRECTION
      ?auto_120162 - MODE
    )
    :vars
    (
      ?auto_120166 - INSTRUMENT
      ?auto_120163 - SATELLITE
      ?auto_120165 - DIRECTION
      ?auto_120164 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120166 ?auto_120163 ) ( SUPPORTS ?auto_120166 ?auto_120157 ) ( not ( = ?auto_120156 ?auto_120165 ) ) ( HAVE_IMAGE ?auto_120159 ?auto_120155 ) ( not ( = ?auto_120159 ?auto_120156 ) ) ( not ( = ?auto_120159 ?auto_120165 ) ) ( not ( = ?auto_120155 ?auto_120157 ) ) ( CALIBRATION_TARGET ?auto_120166 ?auto_120165 ) ( POINTING ?auto_120163 ?auto_120161 ) ( not ( = ?auto_120165 ?auto_120161 ) ) ( not ( = ?auto_120156 ?auto_120161 ) ) ( not ( = ?auto_120159 ?auto_120161 ) ) ( ON_BOARD ?auto_120164 ?auto_120163 ) ( POWER_ON ?auto_120164 ) ( not ( = ?auto_120166 ?auto_120164 ) ) ( HAVE_IMAGE ?auto_120158 ?auto_120155 ) ( HAVE_IMAGE ?auto_120159 ?auto_120160 ) ( HAVE_IMAGE ?auto_120161 ?auto_120162 ) ( not ( = ?auto_120156 ?auto_120158 ) ) ( not ( = ?auto_120157 ?auto_120160 ) ) ( not ( = ?auto_120157 ?auto_120162 ) ) ( not ( = ?auto_120158 ?auto_120159 ) ) ( not ( = ?auto_120158 ?auto_120161 ) ) ( not ( = ?auto_120158 ?auto_120165 ) ) ( not ( = ?auto_120155 ?auto_120160 ) ) ( not ( = ?auto_120155 ?auto_120162 ) ) ( not ( = ?auto_120160 ?auto_120162 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120159 ?auto_120155 ?auto_120156 ?auto_120157 )
      ( GET-4IMAGE-VERIFY ?auto_120156 ?auto_120157 ?auto_120158 ?auto_120155 ?auto_120159 ?auto_120160 ?auto_120161 ?auto_120162 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120181 - DIRECTION
      ?auto_120182 - MODE
      ?auto_120183 - DIRECTION
      ?auto_120180 - MODE
      ?auto_120184 - DIRECTION
      ?auto_120185 - MODE
      ?auto_120186 - DIRECTION
      ?auto_120187 - MODE
    )
    :vars
    (
      ?auto_120191 - INSTRUMENT
      ?auto_120188 - SATELLITE
      ?auto_120190 - DIRECTION
      ?auto_120189 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120191 ?auto_120188 ) ( SUPPORTS ?auto_120191 ?auto_120182 ) ( not ( = ?auto_120181 ?auto_120190 ) ) ( HAVE_IMAGE ?auto_120183 ?auto_120187 ) ( not ( = ?auto_120183 ?auto_120181 ) ) ( not ( = ?auto_120183 ?auto_120190 ) ) ( not ( = ?auto_120187 ?auto_120182 ) ) ( CALIBRATION_TARGET ?auto_120191 ?auto_120190 ) ( POINTING ?auto_120188 ?auto_120184 ) ( not ( = ?auto_120190 ?auto_120184 ) ) ( not ( = ?auto_120181 ?auto_120184 ) ) ( not ( = ?auto_120183 ?auto_120184 ) ) ( ON_BOARD ?auto_120189 ?auto_120188 ) ( POWER_ON ?auto_120189 ) ( not ( = ?auto_120191 ?auto_120189 ) ) ( HAVE_IMAGE ?auto_120183 ?auto_120180 ) ( HAVE_IMAGE ?auto_120184 ?auto_120185 ) ( HAVE_IMAGE ?auto_120186 ?auto_120187 ) ( not ( = ?auto_120181 ?auto_120186 ) ) ( not ( = ?auto_120182 ?auto_120180 ) ) ( not ( = ?auto_120182 ?auto_120185 ) ) ( not ( = ?auto_120183 ?auto_120186 ) ) ( not ( = ?auto_120180 ?auto_120185 ) ) ( not ( = ?auto_120180 ?auto_120187 ) ) ( not ( = ?auto_120184 ?auto_120186 ) ) ( not ( = ?auto_120185 ?auto_120187 ) ) ( not ( = ?auto_120186 ?auto_120190 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120183 ?auto_120187 ?auto_120181 ?auto_120182 )
      ( GET-4IMAGE-VERIFY ?auto_120181 ?auto_120182 ?auto_120183 ?auto_120180 ?auto_120184 ?auto_120185 ?auto_120186 ?auto_120187 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120193 - DIRECTION
      ?auto_120194 - MODE
      ?auto_120195 - DIRECTION
      ?auto_120192 - MODE
      ?auto_120196 - DIRECTION
      ?auto_120197 - MODE
      ?auto_120198 - DIRECTION
      ?auto_120199 - MODE
    )
    :vars
    (
      ?auto_120203 - INSTRUMENT
      ?auto_120200 - SATELLITE
      ?auto_120202 - DIRECTION
      ?auto_120201 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120203 ?auto_120200 ) ( SUPPORTS ?auto_120203 ?auto_120194 ) ( not ( = ?auto_120193 ?auto_120202 ) ) ( HAVE_IMAGE ?auto_120195 ?auto_120192 ) ( not ( = ?auto_120195 ?auto_120193 ) ) ( not ( = ?auto_120195 ?auto_120202 ) ) ( not ( = ?auto_120192 ?auto_120194 ) ) ( CALIBRATION_TARGET ?auto_120203 ?auto_120202 ) ( POINTING ?auto_120200 ?auto_120196 ) ( not ( = ?auto_120202 ?auto_120196 ) ) ( not ( = ?auto_120193 ?auto_120196 ) ) ( not ( = ?auto_120195 ?auto_120196 ) ) ( ON_BOARD ?auto_120201 ?auto_120200 ) ( POWER_ON ?auto_120201 ) ( not ( = ?auto_120203 ?auto_120201 ) ) ( HAVE_IMAGE ?auto_120196 ?auto_120197 ) ( HAVE_IMAGE ?auto_120198 ?auto_120199 ) ( not ( = ?auto_120193 ?auto_120198 ) ) ( not ( = ?auto_120194 ?auto_120197 ) ) ( not ( = ?auto_120194 ?auto_120199 ) ) ( not ( = ?auto_120195 ?auto_120198 ) ) ( not ( = ?auto_120192 ?auto_120197 ) ) ( not ( = ?auto_120192 ?auto_120199 ) ) ( not ( = ?auto_120196 ?auto_120198 ) ) ( not ( = ?auto_120197 ?auto_120199 ) ) ( not ( = ?auto_120198 ?auto_120202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120195 ?auto_120192 ?auto_120193 ?auto_120194 )
      ( GET-4IMAGE-VERIFY ?auto_120193 ?auto_120194 ?auto_120195 ?auto_120192 ?auto_120196 ?auto_120197 ?auto_120198 ?auto_120199 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120255 - DIRECTION
      ?auto_120256 - MODE
      ?auto_120257 - DIRECTION
      ?auto_120254 - MODE
      ?auto_120258 - DIRECTION
      ?auto_120259 - MODE
      ?auto_120260 - DIRECTION
      ?auto_120261 - MODE
    )
    :vars
    (
      ?auto_120265 - INSTRUMENT
      ?auto_120262 - SATELLITE
      ?auto_120264 - DIRECTION
      ?auto_120263 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120265 ?auto_120262 ) ( SUPPORTS ?auto_120265 ?auto_120256 ) ( not ( = ?auto_120255 ?auto_120264 ) ) ( HAVE_IMAGE ?auto_120258 ?auto_120261 ) ( not ( = ?auto_120258 ?auto_120255 ) ) ( not ( = ?auto_120258 ?auto_120264 ) ) ( not ( = ?auto_120261 ?auto_120256 ) ) ( CALIBRATION_TARGET ?auto_120265 ?auto_120264 ) ( POINTING ?auto_120262 ?auto_120257 ) ( not ( = ?auto_120264 ?auto_120257 ) ) ( not ( = ?auto_120255 ?auto_120257 ) ) ( not ( = ?auto_120258 ?auto_120257 ) ) ( ON_BOARD ?auto_120263 ?auto_120262 ) ( POWER_ON ?auto_120263 ) ( not ( = ?auto_120265 ?auto_120263 ) ) ( HAVE_IMAGE ?auto_120257 ?auto_120254 ) ( HAVE_IMAGE ?auto_120258 ?auto_120259 ) ( HAVE_IMAGE ?auto_120260 ?auto_120261 ) ( not ( = ?auto_120255 ?auto_120260 ) ) ( not ( = ?auto_120256 ?auto_120254 ) ) ( not ( = ?auto_120256 ?auto_120259 ) ) ( not ( = ?auto_120257 ?auto_120260 ) ) ( not ( = ?auto_120254 ?auto_120259 ) ) ( not ( = ?auto_120254 ?auto_120261 ) ) ( not ( = ?auto_120258 ?auto_120260 ) ) ( not ( = ?auto_120259 ?auto_120261 ) ) ( not ( = ?auto_120260 ?auto_120264 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120258 ?auto_120261 ?auto_120255 ?auto_120256 )
      ( GET-4IMAGE-VERIFY ?auto_120255 ?auto_120256 ?auto_120257 ?auto_120254 ?auto_120258 ?auto_120259 ?auto_120260 ?auto_120261 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120267 - DIRECTION
      ?auto_120268 - MODE
      ?auto_120269 - DIRECTION
      ?auto_120266 - MODE
      ?auto_120270 - DIRECTION
      ?auto_120271 - MODE
      ?auto_120272 - DIRECTION
      ?auto_120273 - MODE
    )
    :vars
    (
      ?auto_120277 - INSTRUMENT
      ?auto_120274 - SATELLITE
      ?auto_120276 - DIRECTION
      ?auto_120275 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120277 ?auto_120274 ) ( SUPPORTS ?auto_120277 ?auto_120268 ) ( not ( = ?auto_120267 ?auto_120276 ) ) ( HAVE_IMAGE ?auto_120270 ?auto_120271 ) ( not ( = ?auto_120270 ?auto_120267 ) ) ( not ( = ?auto_120270 ?auto_120276 ) ) ( not ( = ?auto_120271 ?auto_120268 ) ) ( CALIBRATION_TARGET ?auto_120277 ?auto_120276 ) ( POINTING ?auto_120274 ?auto_120269 ) ( not ( = ?auto_120276 ?auto_120269 ) ) ( not ( = ?auto_120267 ?auto_120269 ) ) ( not ( = ?auto_120270 ?auto_120269 ) ) ( ON_BOARD ?auto_120275 ?auto_120274 ) ( POWER_ON ?auto_120275 ) ( not ( = ?auto_120277 ?auto_120275 ) ) ( HAVE_IMAGE ?auto_120269 ?auto_120266 ) ( HAVE_IMAGE ?auto_120272 ?auto_120273 ) ( not ( = ?auto_120267 ?auto_120272 ) ) ( not ( = ?auto_120268 ?auto_120266 ) ) ( not ( = ?auto_120268 ?auto_120273 ) ) ( not ( = ?auto_120269 ?auto_120272 ) ) ( not ( = ?auto_120266 ?auto_120271 ) ) ( not ( = ?auto_120266 ?auto_120273 ) ) ( not ( = ?auto_120270 ?auto_120272 ) ) ( not ( = ?auto_120271 ?auto_120273 ) ) ( not ( = ?auto_120272 ?auto_120276 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120270 ?auto_120271 ?auto_120267 ?auto_120268 )
      ( GET-4IMAGE-VERIFY ?auto_120267 ?auto_120268 ?auto_120269 ?auto_120266 ?auto_120270 ?auto_120271 ?auto_120272 ?auto_120273 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120291 - DIRECTION
      ?auto_120292 - MODE
      ?auto_120293 - DIRECTION
      ?auto_120290 - MODE
      ?auto_120294 - DIRECTION
      ?auto_120295 - MODE
      ?auto_120296 - DIRECTION
      ?auto_120297 - MODE
    )
    :vars
    (
      ?auto_120301 - INSTRUMENT
      ?auto_120298 - SATELLITE
      ?auto_120300 - DIRECTION
      ?auto_120299 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120301 ?auto_120298 ) ( SUPPORTS ?auto_120301 ?auto_120292 ) ( not ( = ?auto_120291 ?auto_120300 ) ) ( HAVE_IMAGE ?auto_120296 ?auto_120297 ) ( not ( = ?auto_120296 ?auto_120291 ) ) ( not ( = ?auto_120296 ?auto_120300 ) ) ( not ( = ?auto_120297 ?auto_120292 ) ) ( CALIBRATION_TARGET ?auto_120301 ?auto_120300 ) ( POINTING ?auto_120298 ?auto_120294 ) ( not ( = ?auto_120300 ?auto_120294 ) ) ( not ( = ?auto_120291 ?auto_120294 ) ) ( not ( = ?auto_120296 ?auto_120294 ) ) ( ON_BOARD ?auto_120299 ?auto_120298 ) ( POWER_ON ?auto_120299 ) ( not ( = ?auto_120301 ?auto_120299 ) ) ( HAVE_IMAGE ?auto_120293 ?auto_120290 ) ( HAVE_IMAGE ?auto_120294 ?auto_120295 ) ( not ( = ?auto_120291 ?auto_120293 ) ) ( not ( = ?auto_120292 ?auto_120290 ) ) ( not ( = ?auto_120292 ?auto_120295 ) ) ( not ( = ?auto_120293 ?auto_120294 ) ) ( not ( = ?auto_120293 ?auto_120296 ) ) ( not ( = ?auto_120293 ?auto_120300 ) ) ( not ( = ?auto_120290 ?auto_120295 ) ) ( not ( = ?auto_120290 ?auto_120297 ) ) ( not ( = ?auto_120295 ?auto_120297 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120296 ?auto_120297 ?auto_120291 ?auto_120292 )
      ( GET-4IMAGE-VERIFY ?auto_120291 ?auto_120292 ?auto_120293 ?auto_120290 ?auto_120294 ?auto_120295 ?auto_120296 ?auto_120297 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120303 - DIRECTION
      ?auto_120304 - MODE
      ?auto_120305 - DIRECTION
      ?auto_120302 - MODE
      ?auto_120306 - DIRECTION
      ?auto_120307 - MODE
      ?auto_120308 - DIRECTION
      ?auto_120309 - MODE
    )
    :vars
    (
      ?auto_120313 - INSTRUMENT
      ?auto_120310 - SATELLITE
      ?auto_120312 - DIRECTION
      ?auto_120315 - DIRECTION
      ?auto_120314 - MODE
      ?auto_120311 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120313 ?auto_120310 ) ( SUPPORTS ?auto_120313 ?auto_120304 ) ( not ( = ?auto_120303 ?auto_120312 ) ) ( HAVE_IMAGE ?auto_120315 ?auto_120314 ) ( not ( = ?auto_120315 ?auto_120303 ) ) ( not ( = ?auto_120315 ?auto_120312 ) ) ( not ( = ?auto_120314 ?auto_120304 ) ) ( CALIBRATION_TARGET ?auto_120313 ?auto_120312 ) ( POINTING ?auto_120310 ?auto_120306 ) ( not ( = ?auto_120312 ?auto_120306 ) ) ( not ( = ?auto_120303 ?auto_120306 ) ) ( not ( = ?auto_120315 ?auto_120306 ) ) ( ON_BOARD ?auto_120311 ?auto_120310 ) ( POWER_ON ?auto_120311 ) ( not ( = ?auto_120313 ?auto_120311 ) ) ( HAVE_IMAGE ?auto_120305 ?auto_120302 ) ( HAVE_IMAGE ?auto_120306 ?auto_120307 ) ( HAVE_IMAGE ?auto_120308 ?auto_120309 ) ( not ( = ?auto_120303 ?auto_120305 ) ) ( not ( = ?auto_120303 ?auto_120308 ) ) ( not ( = ?auto_120304 ?auto_120302 ) ) ( not ( = ?auto_120304 ?auto_120307 ) ) ( not ( = ?auto_120304 ?auto_120309 ) ) ( not ( = ?auto_120305 ?auto_120306 ) ) ( not ( = ?auto_120305 ?auto_120308 ) ) ( not ( = ?auto_120305 ?auto_120312 ) ) ( not ( = ?auto_120305 ?auto_120315 ) ) ( not ( = ?auto_120302 ?auto_120307 ) ) ( not ( = ?auto_120302 ?auto_120309 ) ) ( not ( = ?auto_120302 ?auto_120314 ) ) ( not ( = ?auto_120306 ?auto_120308 ) ) ( not ( = ?auto_120307 ?auto_120309 ) ) ( not ( = ?auto_120307 ?auto_120314 ) ) ( not ( = ?auto_120308 ?auto_120312 ) ) ( not ( = ?auto_120308 ?auto_120315 ) ) ( not ( = ?auto_120309 ?auto_120314 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120315 ?auto_120314 ?auto_120303 ?auto_120304 )
      ( GET-4IMAGE-VERIFY ?auto_120303 ?auto_120304 ?auto_120305 ?auto_120302 ?auto_120306 ?auto_120307 ?auto_120308 ?auto_120309 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_120553 - DIRECTION
      ?auto_120554 - MODE
      ?auto_120555 - DIRECTION
      ?auto_120552 - MODE
      ?auto_120556 - DIRECTION
      ?auto_120557 - MODE
    )
    :vars
    (
      ?auto_120560 - INSTRUMENT
      ?auto_120558 - SATELLITE
      ?auto_120561 - DIRECTION
      ?auto_120559 - DIRECTION
      ?auto_120562 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120560 ?auto_120558 ) ( SUPPORTS ?auto_120560 ?auto_120552 ) ( not ( = ?auto_120555 ?auto_120561 ) ) ( HAVE_IMAGE ?auto_120553 ?auto_120554 ) ( not ( = ?auto_120553 ?auto_120555 ) ) ( not ( = ?auto_120553 ?auto_120561 ) ) ( not ( = ?auto_120554 ?auto_120552 ) ) ( CALIBRATION_TARGET ?auto_120560 ?auto_120561 ) ( POINTING ?auto_120558 ?auto_120559 ) ( not ( = ?auto_120561 ?auto_120559 ) ) ( not ( = ?auto_120555 ?auto_120559 ) ) ( not ( = ?auto_120553 ?auto_120559 ) ) ( ON_BOARD ?auto_120562 ?auto_120558 ) ( POWER_ON ?auto_120562 ) ( not ( = ?auto_120560 ?auto_120562 ) ) ( HAVE_IMAGE ?auto_120556 ?auto_120557 ) ( not ( = ?auto_120553 ?auto_120556 ) ) ( not ( = ?auto_120554 ?auto_120557 ) ) ( not ( = ?auto_120555 ?auto_120556 ) ) ( not ( = ?auto_120552 ?auto_120557 ) ) ( not ( = ?auto_120556 ?auto_120561 ) ) ( not ( = ?auto_120556 ?auto_120559 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120553 ?auto_120554 ?auto_120555 ?auto_120552 )
      ( GET-3IMAGE-VERIFY ?auto_120553 ?auto_120554 ?auto_120555 ?auto_120552 ?auto_120556 ?auto_120557 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_120641 - DIRECTION
      ?auto_120642 - MODE
      ?auto_120643 - DIRECTION
      ?auto_120640 - MODE
      ?auto_120644 - DIRECTION
      ?auto_120645 - MODE
    )
    :vars
    (
      ?auto_120648 - INSTRUMENT
      ?auto_120646 - SATELLITE
      ?auto_120649 - DIRECTION
      ?auto_120647 - DIRECTION
      ?auto_120650 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120648 ?auto_120646 ) ( SUPPORTS ?auto_120648 ?auto_120642 ) ( not ( = ?auto_120641 ?auto_120649 ) ) ( HAVE_IMAGE ?auto_120643 ?auto_120640 ) ( not ( = ?auto_120643 ?auto_120641 ) ) ( not ( = ?auto_120643 ?auto_120649 ) ) ( not ( = ?auto_120640 ?auto_120642 ) ) ( CALIBRATION_TARGET ?auto_120648 ?auto_120649 ) ( POINTING ?auto_120646 ?auto_120647 ) ( not ( = ?auto_120649 ?auto_120647 ) ) ( not ( = ?auto_120641 ?auto_120647 ) ) ( not ( = ?auto_120643 ?auto_120647 ) ) ( ON_BOARD ?auto_120650 ?auto_120646 ) ( POWER_ON ?auto_120650 ) ( not ( = ?auto_120648 ?auto_120650 ) ) ( HAVE_IMAGE ?auto_120644 ?auto_120645 ) ( not ( = ?auto_120641 ?auto_120644 ) ) ( not ( = ?auto_120642 ?auto_120645 ) ) ( not ( = ?auto_120643 ?auto_120644 ) ) ( not ( = ?auto_120640 ?auto_120645 ) ) ( not ( = ?auto_120644 ?auto_120649 ) ) ( not ( = ?auto_120644 ?auto_120647 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120643 ?auto_120640 ?auto_120641 ?auto_120642 )
      ( GET-3IMAGE-VERIFY ?auto_120641 ?auto_120642 ?auto_120643 ?auto_120640 ?auto_120644 ?auto_120645 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120743 - DIRECTION
      ?auto_120744 - MODE
      ?auto_120745 - DIRECTION
      ?auto_120742 - MODE
      ?auto_120746 - DIRECTION
      ?auto_120747 - MODE
      ?auto_120748 - DIRECTION
      ?auto_120749 - MODE
    )
    :vars
    (
      ?auto_120752 - INSTRUMENT
      ?auto_120750 - SATELLITE
      ?auto_120753 - DIRECTION
      ?auto_120751 - DIRECTION
      ?auto_120754 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120752 ?auto_120750 ) ( SUPPORTS ?auto_120752 ?auto_120749 ) ( not ( = ?auto_120748 ?auto_120753 ) ) ( HAVE_IMAGE ?auto_120743 ?auto_120742 ) ( not ( = ?auto_120743 ?auto_120748 ) ) ( not ( = ?auto_120743 ?auto_120753 ) ) ( not ( = ?auto_120742 ?auto_120749 ) ) ( CALIBRATION_TARGET ?auto_120752 ?auto_120753 ) ( POINTING ?auto_120750 ?auto_120751 ) ( not ( = ?auto_120753 ?auto_120751 ) ) ( not ( = ?auto_120748 ?auto_120751 ) ) ( not ( = ?auto_120743 ?auto_120751 ) ) ( ON_BOARD ?auto_120754 ?auto_120750 ) ( POWER_ON ?auto_120754 ) ( not ( = ?auto_120752 ?auto_120754 ) ) ( HAVE_IMAGE ?auto_120743 ?auto_120744 ) ( HAVE_IMAGE ?auto_120745 ?auto_120742 ) ( HAVE_IMAGE ?auto_120746 ?auto_120747 ) ( not ( = ?auto_120743 ?auto_120745 ) ) ( not ( = ?auto_120743 ?auto_120746 ) ) ( not ( = ?auto_120744 ?auto_120742 ) ) ( not ( = ?auto_120744 ?auto_120747 ) ) ( not ( = ?auto_120744 ?auto_120749 ) ) ( not ( = ?auto_120745 ?auto_120746 ) ) ( not ( = ?auto_120745 ?auto_120748 ) ) ( not ( = ?auto_120745 ?auto_120753 ) ) ( not ( = ?auto_120745 ?auto_120751 ) ) ( not ( = ?auto_120742 ?auto_120747 ) ) ( not ( = ?auto_120746 ?auto_120748 ) ) ( not ( = ?auto_120746 ?auto_120753 ) ) ( not ( = ?auto_120746 ?auto_120751 ) ) ( not ( = ?auto_120747 ?auto_120749 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120743 ?auto_120742 ?auto_120748 ?auto_120749 )
      ( GET-4IMAGE-VERIFY ?auto_120743 ?auto_120744 ?auto_120745 ?auto_120742 ?auto_120746 ?auto_120747 ?auto_120748 ?auto_120749 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_120768 - DIRECTION
      ?auto_120769 - MODE
      ?auto_120770 - DIRECTION
      ?auto_120767 - MODE
      ?auto_120771 - DIRECTION
      ?auto_120772 - MODE
      ?auto_120773 - DIRECTION
      ?auto_120774 - MODE
    )
    :vars
    (
      ?auto_120777 - INSTRUMENT
      ?auto_120775 - SATELLITE
      ?auto_120778 - DIRECTION
      ?auto_120776 - DIRECTION
      ?auto_120779 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_120777 ?auto_120775 ) ( SUPPORTS ?auto_120777 ?auto_120772 ) ( not ( = ?auto_120771 ?auto_120778 ) ) ( HAVE_IMAGE ?auto_120768 ?auto_120774 ) ( not ( = ?auto_120768 ?auto_120771 ) ) ( not ( = ?auto_120768 ?auto_120778 ) ) ( not ( = ?auto_120774 ?auto_120772 ) ) ( CALIBRATION_TARGET ?auto_120777 ?auto_120778 ) ( POINTING ?auto_120775 ?auto_120776 ) ( not ( = ?auto_120778 ?auto_120776 ) ) ( not ( = ?auto_120771 ?auto_120776 ) ) ( not ( = ?auto_120768 ?auto_120776 ) ) ( ON_BOARD ?auto_120779 ?auto_120775 ) ( POWER_ON ?auto_120779 ) ( not ( = ?auto_120777 ?auto_120779 ) ) ( HAVE_IMAGE ?auto_120768 ?auto_120769 ) ( HAVE_IMAGE ?auto_120770 ?auto_120767 ) ( HAVE_IMAGE ?auto_120773 ?auto_120774 ) ( not ( = ?auto_120768 ?auto_120770 ) ) ( not ( = ?auto_120768 ?auto_120773 ) ) ( not ( = ?auto_120769 ?auto_120767 ) ) ( not ( = ?auto_120769 ?auto_120772 ) ) ( not ( = ?auto_120769 ?auto_120774 ) ) ( not ( = ?auto_120770 ?auto_120771 ) ) ( not ( = ?auto_120770 ?auto_120773 ) ) ( not ( = ?auto_120770 ?auto_120778 ) ) ( not ( = ?auto_120770 ?auto_120776 ) ) ( not ( = ?auto_120767 ?auto_120772 ) ) ( not ( = ?auto_120767 ?auto_120774 ) ) ( not ( = ?auto_120771 ?auto_120773 ) ) ( not ( = ?auto_120773 ?auto_120778 ) ) ( not ( = ?auto_120773 ?auto_120776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_120768 ?auto_120774 ?auto_120771 ?auto_120772 )
      ( GET-4IMAGE-VERIFY ?auto_120768 ?auto_120769 ?auto_120770 ?auto_120767 ?auto_120771 ?auto_120772 ?auto_120773 ?auto_120774 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_121220 - DIRECTION
      ?auto_121221 - MODE
      ?auto_121222 - DIRECTION
      ?auto_121219 - MODE
      ?auto_121223 - DIRECTION
      ?auto_121224 - MODE
      ?auto_121225 - DIRECTION
      ?auto_121226 - MODE
    )
    :vars
    (
      ?auto_121229 - INSTRUMENT
      ?auto_121227 - SATELLITE
      ?auto_121230 - DIRECTION
      ?auto_121228 - DIRECTION
      ?auto_121231 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_121229 ?auto_121227 ) ( SUPPORTS ?auto_121229 ?auto_121221 ) ( not ( = ?auto_121220 ?auto_121230 ) ) ( HAVE_IMAGE ?auto_121222 ?auto_121224 ) ( not ( = ?auto_121222 ?auto_121220 ) ) ( not ( = ?auto_121222 ?auto_121230 ) ) ( not ( = ?auto_121224 ?auto_121221 ) ) ( CALIBRATION_TARGET ?auto_121229 ?auto_121230 ) ( POINTING ?auto_121227 ?auto_121228 ) ( not ( = ?auto_121230 ?auto_121228 ) ) ( not ( = ?auto_121220 ?auto_121228 ) ) ( not ( = ?auto_121222 ?auto_121228 ) ) ( ON_BOARD ?auto_121231 ?auto_121227 ) ( POWER_ON ?auto_121231 ) ( not ( = ?auto_121229 ?auto_121231 ) ) ( HAVE_IMAGE ?auto_121222 ?auto_121219 ) ( HAVE_IMAGE ?auto_121223 ?auto_121224 ) ( HAVE_IMAGE ?auto_121225 ?auto_121226 ) ( not ( = ?auto_121220 ?auto_121223 ) ) ( not ( = ?auto_121220 ?auto_121225 ) ) ( not ( = ?auto_121221 ?auto_121219 ) ) ( not ( = ?auto_121221 ?auto_121226 ) ) ( not ( = ?auto_121222 ?auto_121223 ) ) ( not ( = ?auto_121222 ?auto_121225 ) ) ( not ( = ?auto_121219 ?auto_121224 ) ) ( not ( = ?auto_121219 ?auto_121226 ) ) ( not ( = ?auto_121223 ?auto_121225 ) ) ( not ( = ?auto_121223 ?auto_121230 ) ) ( not ( = ?auto_121223 ?auto_121228 ) ) ( not ( = ?auto_121224 ?auto_121226 ) ) ( not ( = ?auto_121225 ?auto_121230 ) ) ( not ( = ?auto_121225 ?auto_121228 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_121222 ?auto_121224 ?auto_121220 ?auto_121221 )
      ( GET-4IMAGE-VERIFY ?auto_121220 ?auto_121221 ?auto_121222 ?auto_121219 ?auto_121223 ?auto_121224 ?auto_121225 ?auto_121226 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_121567 - DIRECTION
      ?auto_121568 - MODE
    )
    :vars
    (
      ?auto_121572 - INSTRUMENT
      ?auto_121570 - SATELLITE
      ?auto_121574 - DIRECTION
      ?auto_121569 - DIRECTION
      ?auto_121573 - MODE
      ?auto_121571 - DIRECTION
      ?auto_121575 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_121572 ?auto_121570 ) ( SUPPORTS ?auto_121572 ?auto_121568 ) ( not ( = ?auto_121567 ?auto_121574 ) ) ( HAVE_IMAGE ?auto_121569 ?auto_121573 ) ( not ( = ?auto_121569 ?auto_121567 ) ) ( not ( = ?auto_121569 ?auto_121574 ) ) ( not ( = ?auto_121573 ?auto_121568 ) ) ( CALIBRATION_TARGET ?auto_121572 ?auto_121574 ) ( not ( = ?auto_121574 ?auto_121571 ) ) ( not ( = ?auto_121567 ?auto_121571 ) ) ( not ( = ?auto_121569 ?auto_121571 ) ) ( ON_BOARD ?auto_121575 ?auto_121570 ) ( POWER_ON ?auto_121575 ) ( not ( = ?auto_121572 ?auto_121575 ) ) ( POINTING ?auto_121570 ?auto_121574 ) )
    :subtasks
    ( ( !TURN_TO ?auto_121570 ?auto_121571 ?auto_121574 )
      ( GET-2IMAGE ?auto_121569 ?auto_121573 ?auto_121567 ?auto_121568 )
      ( GET-1IMAGE-VERIFY ?auto_121567 ?auto_121568 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_121577 - DIRECTION
      ?auto_121578 - MODE
      ?auto_121579 - DIRECTION
      ?auto_121576 - MODE
    )
    :vars
    (
      ?auto_121584 - INSTRUMENT
      ?auto_121580 - SATELLITE
      ?auto_121581 - DIRECTION
      ?auto_121583 - DIRECTION
      ?auto_121582 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_121584 ?auto_121580 ) ( SUPPORTS ?auto_121584 ?auto_121576 ) ( not ( = ?auto_121579 ?auto_121581 ) ) ( HAVE_IMAGE ?auto_121577 ?auto_121578 ) ( not ( = ?auto_121577 ?auto_121579 ) ) ( not ( = ?auto_121577 ?auto_121581 ) ) ( not ( = ?auto_121578 ?auto_121576 ) ) ( CALIBRATION_TARGET ?auto_121584 ?auto_121581 ) ( not ( = ?auto_121581 ?auto_121583 ) ) ( not ( = ?auto_121579 ?auto_121583 ) ) ( not ( = ?auto_121577 ?auto_121583 ) ) ( ON_BOARD ?auto_121582 ?auto_121580 ) ( POWER_ON ?auto_121582 ) ( not ( = ?auto_121584 ?auto_121582 ) ) ( POINTING ?auto_121580 ?auto_121581 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_121579 ?auto_121576 )
      ( GET-2IMAGE-VERIFY ?auto_121577 ?auto_121578 ?auto_121579 ?auto_121576 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_121596 - DIRECTION
      ?auto_121597 - MODE
      ?auto_121598 - DIRECTION
      ?auto_121595 - MODE
    )
    :vars
    (
      ?auto_121602 - INSTRUMENT
      ?auto_121600 - SATELLITE
      ?auto_121601 - DIRECTION
      ?auto_121603 - DIRECTION
      ?auto_121599 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_121602 ?auto_121600 ) ( SUPPORTS ?auto_121602 ?auto_121597 ) ( not ( = ?auto_121596 ?auto_121601 ) ) ( HAVE_IMAGE ?auto_121598 ?auto_121595 ) ( not ( = ?auto_121598 ?auto_121596 ) ) ( not ( = ?auto_121598 ?auto_121601 ) ) ( not ( = ?auto_121595 ?auto_121597 ) ) ( CALIBRATION_TARGET ?auto_121602 ?auto_121601 ) ( not ( = ?auto_121601 ?auto_121603 ) ) ( not ( = ?auto_121596 ?auto_121603 ) ) ( not ( = ?auto_121598 ?auto_121603 ) ) ( ON_BOARD ?auto_121599 ?auto_121600 ) ( POWER_ON ?auto_121599 ) ( not ( = ?auto_121602 ?auto_121599 ) ) ( POINTING ?auto_121600 ?auto_121601 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_121598 ?auto_121595 ?auto_121596 ?auto_121597 )
      ( GET-2IMAGE-VERIFY ?auto_121596 ?auto_121597 ?auto_121598 ?auto_121595 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_121626 - DIRECTION
      ?auto_121627 - MODE
      ?auto_121628 - DIRECTION
      ?auto_121625 - MODE
      ?auto_121629 - DIRECTION
      ?auto_121630 - MODE
    )
    :vars
    (
      ?auto_121634 - INSTRUMENT
      ?auto_121632 - SATELLITE
      ?auto_121633 - DIRECTION
      ?auto_121635 - DIRECTION
      ?auto_121631 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_121634 ?auto_121632 ) ( SUPPORTS ?auto_121634 ?auto_121630 ) ( not ( = ?auto_121629 ?auto_121633 ) ) ( HAVE_IMAGE ?auto_121628 ?auto_121625 ) ( not ( = ?auto_121628 ?auto_121629 ) ) ( not ( = ?auto_121628 ?auto_121633 ) ) ( not ( = ?auto_121625 ?auto_121630 ) ) ( CALIBRATION_TARGET ?auto_121634 ?auto_121633 ) ( not ( = ?auto_121633 ?auto_121635 ) ) ( not ( = ?auto_121629 ?auto_121635 ) ) ( not ( = ?auto_121628 ?auto_121635 ) ) ( ON_BOARD ?auto_121631 ?auto_121632 ) ( POWER_ON ?auto_121631 ) ( not ( = ?auto_121634 ?auto_121631 ) ) ( POINTING ?auto_121632 ?auto_121633 ) ( HAVE_IMAGE ?auto_121626 ?auto_121627 ) ( not ( = ?auto_121626 ?auto_121628 ) ) ( not ( = ?auto_121626 ?auto_121629 ) ) ( not ( = ?auto_121626 ?auto_121633 ) ) ( not ( = ?auto_121626 ?auto_121635 ) ) ( not ( = ?auto_121627 ?auto_121625 ) ) ( not ( = ?auto_121627 ?auto_121630 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_121628 ?auto_121625 ?auto_121629 ?auto_121630 )
      ( GET-3IMAGE-VERIFY ?auto_121626 ?auto_121627 ?auto_121628 ?auto_121625 ?auto_121629 ?auto_121630 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_121647 - DIRECTION
      ?auto_121648 - MODE
      ?auto_121649 - DIRECTION
      ?auto_121646 - MODE
      ?auto_121650 - DIRECTION
      ?auto_121651 - MODE
    )
    :vars
    (
      ?auto_121655 - INSTRUMENT
      ?auto_121653 - SATELLITE
      ?auto_121654 - DIRECTION
      ?auto_121656 - DIRECTION
      ?auto_121652 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_121655 ?auto_121653 ) ( SUPPORTS ?auto_121655 ?auto_121646 ) ( not ( = ?auto_121649 ?auto_121654 ) ) ( HAVE_IMAGE ?auto_121650 ?auto_121648 ) ( not ( = ?auto_121650 ?auto_121649 ) ) ( not ( = ?auto_121650 ?auto_121654 ) ) ( not ( = ?auto_121648 ?auto_121646 ) ) ( CALIBRATION_TARGET ?auto_121655 ?auto_121654 ) ( not ( = ?auto_121654 ?auto_121656 ) ) ( not ( = ?auto_121649 ?auto_121656 ) ) ( not ( = ?auto_121650 ?auto_121656 ) ) ( ON_BOARD ?auto_121652 ?auto_121653 ) ( POWER_ON ?auto_121652 ) ( not ( = ?auto_121655 ?auto_121652 ) ) ( POINTING ?auto_121653 ?auto_121654 ) ( HAVE_IMAGE ?auto_121647 ?auto_121648 ) ( HAVE_IMAGE ?auto_121650 ?auto_121651 ) ( not ( = ?auto_121647 ?auto_121649 ) ) ( not ( = ?auto_121647 ?auto_121650 ) ) ( not ( = ?auto_121647 ?auto_121654 ) ) ( not ( = ?auto_121647 ?auto_121656 ) ) ( not ( = ?auto_121648 ?auto_121651 ) ) ( not ( = ?auto_121646 ?auto_121651 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_121650 ?auto_121648 ?auto_121649 ?auto_121646 )
      ( GET-3IMAGE-VERIFY ?auto_121647 ?auto_121648 ?auto_121649 ?auto_121646 ?auto_121650 ?auto_121651 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153473 - DIRECTION
      ?auto_153474 - MODE
      ?auto_153475 - DIRECTION
      ?auto_153472 - MODE
      ?auto_153476 - DIRECTION
      ?auto_153477 - MODE
    )
    :vars
    (
      ?auto_153478 - INSTRUMENT
      ?auto_153481 - SATELLITE
      ?auto_153479 - DIRECTION
      ?auto_153480 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153478 ?auto_153481 ) ( SUPPORTS ?auto_153478 ?auto_153474 ) ( not ( = ?auto_153473 ?auto_153479 ) ) ( HAVE_IMAGE ?auto_153475 ?auto_153472 ) ( not ( = ?auto_153475 ?auto_153473 ) ) ( not ( = ?auto_153475 ?auto_153479 ) ) ( not ( = ?auto_153472 ?auto_153474 ) ) ( CALIBRATION_TARGET ?auto_153478 ?auto_153479 ) ( not ( = ?auto_153479 ?auto_153476 ) ) ( not ( = ?auto_153473 ?auto_153476 ) ) ( not ( = ?auto_153475 ?auto_153476 ) ) ( ON_BOARD ?auto_153480 ?auto_153481 ) ( POWER_ON ?auto_153480 ) ( not ( = ?auto_153478 ?auto_153480 ) ) ( POINTING ?auto_153481 ?auto_153479 ) ( HAVE_IMAGE ?auto_153476 ?auto_153477 ) ( not ( = ?auto_153474 ?auto_153477 ) ) ( not ( = ?auto_153472 ?auto_153477 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153475 ?auto_153472 ?auto_153473 ?auto_153474 )
      ( GET-3IMAGE-VERIFY ?auto_153473 ?auto_153474 ?auto_153475 ?auto_153472 ?auto_153476 ?auto_153477 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153746 - DIRECTION
      ?auto_153747 - MODE
      ?auto_153748 - DIRECTION
      ?auto_153745 - MODE
      ?auto_153749 - DIRECTION
      ?auto_153750 - MODE
      ?auto_153751 - DIRECTION
      ?auto_153752 - MODE
    )
    :vars
    (
      ?auto_153753 - INSTRUMENT
      ?auto_153756 - SATELLITE
      ?auto_153754 - DIRECTION
      ?auto_153755 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153753 ?auto_153756 ) ( SUPPORTS ?auto_153753 ?auto_153752 ) ( not ( = ?auto_153751 ?auto_153754 ) ) ( HAVE_IMAGE ?auto_153746 ?auto_153747 ) ( not ( = ?auto_153746 ?auto_153751 ) ) ( not ( = ?auto_153746 ?auto_153754 ) ) ( not ( = ?auto_153747 ?auto_153752 ) ) ( CALIBRATION_TARGET ?auto_153753 ?auto_153754 ) ( not ( = ?auto_153754 ?auto_153749 ) ) ( not ( = ?auto_153751 ?auto_153749 ) ) ( not ( = ?auto_153746 ?auto_153749 ) ) ( ON_BOARD ?auto_153755 ?auto_153756 ) ( POWER_ON ?auto_153755 ) ( not ( = ?auto_153753 ?auto_153755 ) ) ( POINTING ?auto_153756 ?auto_153754 ) ( HAVE_IMAGE ?auto_153748 ?auto_153745 ) ( HAVE_IMAGE ?auto_153749 ?auto_153750 ) ( not ( = ?auto_153746 ?auto_153748 ) ) ( not ( = ?auto_153747 ?auto_153745 ) ) ( not ( = ?auto_153747 ?auto_153750 ) ) ( not ( = ?auto_153748 ?auto_153749 ) ) ( not ( = ?auto_153748 ?auto_153751 ) ) ( not ( = ?auto_153748 ?auto_153754 ) ) ( not ( = ?auto_153745 ?auto_153750 ) ) ( not ( = ?auto_153745 ?auto_153752 ) ) ( not ( = ?auto_153750 ?auto_153752 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153746 ?auto_153747 ?auto_153751 ?auto_153752 )
      ( GET-4IMAGE-VERIFY ?auto_153746 ?auto_153747 ?auto_153748 ?auto_153745 ?auto_153749 ?auto_153750 ?auto_153751 ?auto_153752 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_121862 - DIRECTION
      ?auto_121863 - MODE
      ?auto_121864 - DIRECTION
      ?auto_121861 - MODE
      ?auto_121865 - DIRECTION
      ?auto_121866 - MODE
      ?auto_121867 - DIRECTION
      ?auto_121868 - MODE
    )
    :vars
    (
      ?auto_121872 - INSTRUMENT
      ?auto_121870 - SATELLITE
      ?auto_121871 - DIRECTION
      ?auto_121873 - DIRECTION
      ?auto_121869 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_121872 ?auto_121870 ) ( SUPPORTS ?auto_121872 ?auto_121866 ) ( not ( = ?auto_121865 ?auto_121871 ) ) ( HAVE_IMAGE ?auto_121862 ?auto_121861 ) ( not ( = ?auto_121862 ?auto_121865 ) ) ( not ( = ?auto_121862 ?auto_121871 ) ) ( not ( = ?auto_121861 ?auto_121866 ) ) ( CALIBRATION_TARGET ?auto_121872 ?auto_121871 ) ( not ( = ?auto_121871 ?auto_121873 ) ) ( not ( = ?auto_121865 ?auto_121873 ) ) ( not ( = ?auto_121862 ?auto_121873 ) ) ( ON_BOARD ?auto_121869 ?auto_121870 ) ( POWER_ON ?auto_121869 ) ( not ( = ?auto_121872 ?auto_121869 ) ) ( POINTING ?auto_121870 ?auto_121871 ) ( HAVE_IMAGE ?auto_121862 ?auto_121863 ) ( HAVE_IMAGE ?auto_121864 ?auto_121861 ) ( HAVE_IMAGE ?auto_121867 ?auto_121868 ) ( not ( = ?auto_121862 ?auto_121864 ) ) ( not ( = ?auto_121862 ?auto_121867 ) ) ( not ( = ?auto_121863 ?auto_121861 ) ) ( not ( = ?auto_121863 ?auto_121866 ) ) ( not ( = ?auto_121863 ?auto_121868 ) ) ( not ( = ?auto_121864 ?auto_121865 ) ) ( not ( = ?auto_121864 ?auto_121867 ) ) ( not ( = ?auto_121864 ?auto_121871 ) ) ( not ( = ?auto_121864 ?auto_121873 ) ) ( not ( = ?auto_121861 ?auto_121868 ) ) ( not ( = ?auto_121865 ?auto_121867 ) ) ( not ( = ?auto_121866 ?auto_121868 ) ) ( not ( = ?auto_121867 ?auto_121871 ) ) ( not ( = ?auto_121867 ?auto_121873 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_121862 ?auto_121861 ?auto_121865 ?auto_121866 )
      ( GET-4IMAGE-VERIFY ?auto_121862 ?auto_121863 ?auto_121864 ?auto_121861 ?auto_121865 ?auto_121866 ?auto_121867 ?auto_121868 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153958 - DIRECTION
      ?auto_153959 - MODE
      ?auto_153960 - DIRECTION
      ?auto_153957 - MODE
      ?auto_153961 - DIRECTION
      ?auto_153962 - MODE
      ?auto_153963 - DIRECTION
      ?auto_153964 - MODE
    )
    :vars
    (
      ?auto_153965 - INSTRUMENT
      ?auto_153968 - SATELLITE
      ?auto_153966 - DIRECTION
      ?auto_153967 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153965 ?auto_153968 ) ( SUPPORTS ?auto_153965 ?auto_153957 ) ( not ( = ?auto_153960 ?auto_153966 ) ) ( HAVE_IMAGE ?auto_153958 ?auto_153964 ) ( not ( = ?auto_153958 ?auto_153960 ) ) ( not ( = ?auto_153958 ?auto_153966 ) ) ( not ( = ?auto_153964 ?auto_153957 ) ) ( CALIBRATION_TARGET ?auto_153965 ?auto_153966 ) ( not ( = ?auto_153966 ?auto_153961 ) ) ( not ( = ?auto_153960 ?auto_153961 ) ) ( not ( = ?auto_153958 ?auto_153961 ) ) ( ON_BOARD ?auto_153967 ?auto_153968 ) ( POWER_ON ?auto_153967 ) ( not ( = ?auto_153965 ?auto_153967 ) ) ( POINTING ?auto_153968 ?auto_153966 ) ( HAVE_IMAGE ?auto_153958 ?auto_153959 ) ( HAVE_IMAGE ?auto_153961 ?auto_153962 ) ( HAVE_IMAGE ?auto_153963 ?auto_153964 ) ( not ( = ?auto_153958 ?auto_153963 ) ) ( not ( = ?auto_153959 ?auto_153957 ) ) ( not ( = ?auto_153959 ?auto_153962 ) ) ( not ( = ?auto_153959 ?auto_153964 ) ) ( not ( = ?auto_153960 ?auto_153963 ) ) ( not ( = ?auto_153957 ?auto_153962 ) ) ( not ( = ?auto_153961 ?auto_153963 ) ) ( not ( = ?auto_153962 ?auto_153964 ) ) ( not ( = ?auto_153963 ?auto_153966 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153958 ?auto_153964 ?auto_153960 ?auto_153957 )
      ( GET-4IMAGE-VERIFY ?auto_153958 ?auto_153959 ?auto_153960 ?auto_153957 ?auto_153961 ?auto_153962 ?auto_153963 ?auto_153964 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_155154 - DIRECTION
      ?auto_155155 - MODE
      ?auto_155156 - DIRECTION
      ?auto_155153 - MODE
      ?auto_155157 - DIRECTION
      ?auto_155158 - MODE
      ?auto_155159 - DIRECTION
      ?auto_155160 - MODE
    )
    :vars
    (
      ?auto_155161 - INSTRUMENT
      ?auto_155164 - SATELLITE
      ?auto_155162 - DIRECTION
      ?auto_155163 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_155161 ?auto_155164 ) ( SUPPORTS ?auto_155161 ?auto_155155 ) ( not ( = ?auto_155154 ?auto_155162 ) ) ( HAVE_IMAGE ?auto_155156 ?auto_155153 ) ( not ( = ?auto_155156 ?auto_155154 ) ) ( not ( = ?auto_155156 ?auto_155162 ) ) ( not ( = ?auto_155153 ?auto_155155 ) ) ( CALIBRATION_TARGET ?auto_155161 ?auto_155162 ) ( not ( = ?auto_155162 ?auto_155157 ) ) ( not ( = ?auto_155154 ?auto_155157 ) ) ( not ( = ?auto_155156 ?auto_155157 ) ) ( ON_BOARD ?auto_155163 ?auto_155164 ) ( POWER_ON ?auto_155163 ) ( not ( = ?auto_155161 ?auto_155163 ) ) ( POINTING ?auto_155164 ?auto_155162 ) ( HAVE_IMAGE ?auto_155157 ?auto_155158 ) ( HAVE_IMAGE ?auto_155159 ?auto_155160 ) ( not ( = ?auto_155154 ?auto_155159 ) ) ( not ( = ?auto_155155 ?auto_155158 ) ) ( not ( = ?auto_155155 ?auto_155160 ) ) ( not ( = ?auto_155156 ?auto_155159 ) ) ( not ( = ?auto_155153 ?auto_155158 ) ) ( not ( = ?auto_155153 ?auto_155160 ) ) ( not ( = ?auto_155157 ?auto_155159 ) ) ( not ( = ?auto_155158 ?auto_155160 ) ) ( not ( = ?auto_155159 ?auto_155162 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_155156 ?auto_155153 ?auto_155154 ?auto_155155 )
      ( GET-4IMAGE-VERIFY ?auto_155154 ?auto_155155 ?auto_155156 ?auto_155153 ?auto_155157 ?auto_155158 ?auto_155159 ?auto_155160 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_123793 - DIRECTION
      ?auto_123794 - MODE
      ?auto_123795 - DIRECTION
      ?auto_123792 - MODE
      ?auto_123796 - DIRECTION
      ?auto_123797 - MODE
    )
    :vars
    (
      ?auto_123798 - INSTRUMENT
      ?auto_123800 - SATELLITE
      ?auto_123799 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_123798 ?auto_123800 ) ( SUPPORTS ?auto_123798 ?auto_123797 ) ( POINTING ?auto_123800 ?auto_123799 ) ( not ( = ?auto_123796 ?auto_123799 ) ) ( HAVE_IMAGE ?auto_123793 ?auto_123792 ) ( not ( = ?auto_123793 ?auto_123796 ) ) ( not ( = ?auto_123793 ?auto_123799 ) ) ( not ( = ?auto_123792 ?auto_123797 ) ) ( CALIBRATION_TARGET ?auto_123798 ?auto_123799 ) ( POWER_AVAIL ?auto_123800 ) ( HAVE_IMAGE ?auto_123793 ?auto_123794 ) ( HAVE_IMAGE ?auto_123795 ?auto_123792 ) ( not ( = ?auto_123793 ?auto_123795 ) ) ( not ( = ?auto_123794 ?auto_123792 ) ) ( not ( = ?auto_123794 ?auto_123797 ) ) ( not ( = ?auto_123795 ?auto_123796 ) ) ( not ( = ?auto_123795 ?auto_123799 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_123793 ?auto_123792 ?auto_123796 ?auto_123797 )
      ( GET-3IMAGE-VERIFY ?auto_123793 ?auto_123794 ?auto_123795 ?auto_123792 ?auto_123796 ?auto_123797 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_123811 - DIRECTION
      ?auto_123812 - MODE
      ?auto_123813 - DIRECTION
      ?auto_123810 - MODE
      ?auto_123814 - DIRECTION
      ?auto_123815 - MODE
    )
    :vars
    (
      ?auto_123816 - INSTRUMENT
      ?auto_123818 - SATELLITE
      ?auto_123817 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_123816 ?auto_123818 ) ( SUPPORTS ?auto_123816 ?auto_123810 ) ( POINTING ?auto_123818 ?auto_123817 ) ( not ( = ?auto_123813 ?auto_123817 ) ) ( HAVE_IMAGE ?auto_123814 ?auto_123815 ) ( not ( = ?auto_123814 ?auto_123813 ) ) ( not ( = ?auto_123814 ?auto_123817 ) ) ( not ( = ?auto_123815 ?auto_123810 ) ) ( CALIBRATION_TARGET ?auto_123816 ?auto_123817 ) ( POWER_AVAIL ?auto_123818 ) ( HAVE_IMAGE ?auto_123811 ?auto_123812 ) ( not ( = ?auto_123811 ?auto_123813 ) ) ( not ( = ?auto_123811 ?auto_123814 ) ) ( not ( = ?auto_123811 ?auto_123817 ) ) ( not ( = ?auto_123812 ?auto_123810 ) ) ( not ( = ?auto_123812 ?auto_123815 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_123814 ?auto_123815 ?auto_123813 ?auto_123810 )
      ( GET-3IMAGE-VERIFY ?auto_123811 ?auto_123812 ?auto_123813 ?auto_123810 ?auto_123814 ?auto_123815 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_123889 - DIRECTION
      ?auto_123890 - MODE
      ?auto_123891 - DIRECTION
      ?auto_123888 - MODE
      ?auto_123892 - DIRECTION
      ?auto_123893 - MODE
    )
    :vars
    (
      ?auto_123894 - INSTRUMENT
      ?auto_123896 - SATELLITE
      ?auto_123895 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_123894 ?auto_123896 ) ( SUPPORTS ?auto_123894 ?auto_123890 ) ( POINTING ?auto_123896 ?auto_123895 ) ( not ( = ?auto_123889 ?auto_123895 ) ) ( HAVE_IMAGE ?auto_123891 ?auto_123893 ) ( not ( = ?auto_123891 ?auto_123889 ) ) ( not ( = ?auto_123891 ?auto_123895 ) ) ( not ( = ?auto_123893 ?auto_123890 ) ) ( CALIBRATION_TARGET ?auto_123894 ?auto_123895 ) ( POWER_AVAIL ?auto_123896 ) ( HAVE_IMAGE ?auto_123891 ?auto_123888 ) ( HAVE_IMAGE ?auto_123892 ?auto_123893 ) ( not ( = ?auto_123889 ?auto_123892 ) ) ( not ( = ?auto_123890 ?auto_123888 ) ) ( not ( = ?auto_123891 ?auto_123892 ) ) ( not ( = ?auto_123888 ?auto_123893 ) ) ( not ( = ?auto_123892 ?auto_123895 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_123891 ?auto_123893 ?auto_123889 ?auto_123890 )
      ( GET-3IMAGE-VERIFY ?auto_123889 ?auto_123890 ?auto_123891 ?auto_123888 ?auto_123892 ?auto_123893 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_124760 - DIRECTION
      ?auto_124761 - MODE
      ?auto_124762 - DIRECTION
      ?auto_124759 - MODE
      ?auto_124763 - DIRECTION
      ?auto_124764 - MODE
    )
    :vars
    (
      ?auto_124765 - INSTRUMENT
      ?auto_124767 - SATELLITE
      ?auto_124766 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_124765 ?auto_124767 ) ( SUPPORTS ?auto_124765 ?auto_124764 ) ( not ( = ?auto_124763 ?auto_124766 ) ) ( HAVE_IMAGE ?auto_124760 ?auto_124759 ) ( not ( = ?auto_124760 ?auto_124763 ) ) ( not ( = ?auto_124760 ?auto_124766 ) ) ( not ( = ?auto_124759 ?auto_124764 ) ) ( CALIBRATION_TARGET ?auto_124765 ?auto_124766 ) ( POWER_AVAIL ?auto_124767 ) ( POINTING ?auto_124767 ?auto_124760 ) ( HAVE_IMAGE ?auto_124760 ?auto_124761 ) ( HAVE_IMAGE ?auto_124762 ?auto_124759 ) ( not ( = ?auto_124760 ?auto_124762 ) ) ( not ( = ?auto_124761 ?auto_124759 ) ) ( not ( = ?auto_124761 ?auto_124764 ) ) ( not ( = ?auto_124762 ?auto_124763 ) ) ( not ( = ?auto_124762 ?auto_124766 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_124760 ?auto_124759 ?auto_124763 ?auto_124764 )
      ( GET-3IMAGE-VERIFY ?auto_124760 ?auto_124761 ?auto_124762 ?auto_124759 ?auto_124763 ?auto_124764 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_124778 - DIRECTION
      ?auto_124779 - MODE
      ?auto_124780 - DIRECTION
      ?auto_124777 - MODE
      ?auto_124781 - DIRECTION
      ?auto_124782 - MODE
    )
    :vars
    (
      ?auto_124783 - INSTRUMENT
      ?auto_124785 - SATELLITE
      ?auto_124784 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_124783 ?auto_124785 ) ( SUPPORTS ?auto_124783 ?auto_124777 ) ( not ( = ?auto_124780 ?auto_124784 ) ) ( HAVE_IMAGE ?auto_124781 ?auto_124782 ) ( not ( = ?auto_124781 ?auto_124780 ) ) ( not ( = ?auto_124781 ?auto_124784 ) ) ( not ( = ?auto_124782 ?auto_124777 ) ) ( CALIBRATION_TARGET ?auto_124783 ?auto_124784 ) ( POWER_AVAIL ?auto_124785 ) ( POINTING ?auto_124785 ?auto_124781 ) ( HAVE_IMAGE ?auto_124778 ?auto_124779 ) ( not ( = ?auto_124778 ?auto_124780 ) ) ( not ( = ?auto_124778 ?auto_124781 ) ) ( not ( = ?auto_124778 ?auto_124784 ) ) ( not ( = ?auto_124779 ?auto_124777 ) ) ( not ( = ?auto_124779 ?auto_124782 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_124781 ?auto_124782 ?auto_124780 ?auto_124777 )
      ( GET-3IMAGE-VERIFY ?auto_124778 ?auto_124779 ?auto_124780 ?auto_124777 ?auto_124781 ?auto_124782 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_124856 - DIRECTION
      ?auto_124857 - MODE
      ?auto_124858 - DIRECTION
      ?auto_124855 - MODE
      ?auto_124859 - DIRECTION
      ?auto_124860 - MODE
    )
    :vars
    (
      ?auto_124861 - INSTRUMENT
      ?auto_124863 - SATELLITE
      ?auto_124862 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_124861 ?auto_124863 ) ( SUPPORTS ?auto_124861 ?auto_124857 ) ( not ( = ?auto_124856 ?auto_124862 ) ) ( HAVE_IMAGE ?auto_124858 ?auto_124860 ) ( not ( = ?auto_124858 ?auto_124856 ) ) ( not ( = ?auto_124858 ?auto_124862 ) ) ( not ( = ?auto_124860 ?auto_124857 ) ) ( CALIBRATION_TARGET ?auto_124861 ?auto_124862 ) ( POWER_AVAIL ?auto_124863 ) ( POINTING ?auto_124863 ?auto_124858 ) ( HAVE_IMAGE ?auto_124858 ?auto_124855 ) ( HAVE_IMAGE ?auto_124859 ?auto_124860 ) ( not ( = ?auto_124856 ?auto_124859 ) ) ( not ( = ?auto_124857 ?auto_124855 ) ) ( not ( = ?auto_124858 ?auto_124859 ) ) ( not ( = ?auto_124855 ?auto_124860 ) ) ( not ( = ?auto_124859 ?auto_124862 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_124858 ?auto_124860 ?auto_124856 ?auto_124857 )
      ( GET-3IMAGE-VERIFY ?auto_124856 ?auto_124857 ?auto_124858 ?auto_124855 ?auto_124859 ?auto_124860 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_124945 - DIRECTION
      ?auto_124946 - MODE
      ?auto_124947 - DIRECTION
      ?auto_124944 - MODE
      ?auto_124948 - DIRECTION
      ?auto_124949 - MODE
      ?auto_124950 - DIRECTION
      ?auto_124951 - MODE
    )
    :vars
    (
      ?auto_124952 - INSTRUMENT
      ?auto_124954 - SATELLITE
      ?auto_124953 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_124952 ?auto_124954 ) ( SUPPORTS ?auto_124952 ?auto_124951 ) ( not ( = ?auto_124950 ?auto_124953 ) ) ( HAVE_IMAGE ?auto_124948 ?auto_124946 ) ( not ( = ?auto_124948 ?auto_124950 ) ) ( not ( = ?auto_124948 ?auto_124953 ) ) ( not ( = ?auto_124946 ?auto_124951 ) ) ( CALIBRATION_TARGET ?auto_124952 ?auto_124953 ) ( POWER_AVAIL ?auto_124954 ) ( POINTING ?auto_124954 ?auto_124948 ) ( HAVE_IMAGE ?auto_124945 ?auto_124946 ) ( HAVE_IMAGE ?auto_124947 ?auto_124944 ) ( HAVE_IMAGE ?auto_124948 ?auto_124949 ) ( not ( = ?auto_124945 ?auto_124947 ) ) ( not ( = ?auto_124945 ?auto_124948 ) ) ( not ( = ?auto_124945 ?auto_124950 ) ) ( not ( = ?auto_124945 ?auto_124953 ) ) ( not ( = ?auto_124946 ?auto_124944 ) ) ( not ( = ?auto_124946 ?auto_124949 ) ) ( not ( = ?auto_124947 ?auto_124948 ) ) ( not ( = ?auto_124947 ?auto_124950 ) ) ( not ( = ?auto_124947 ?auto_124953 ) ) ( not ( = ?auto_124944 ?auto_124949 ) ) ( not ( = ?auto_124944 ?auto_124951 ) ) ( not ( = ?auto_124949 ?auto_124951 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_124948 ?auto_124946 ?auto_124950 ?auto_124951 )
      ( GET-4IMAGE-VERIFY ?auto_124945 ?auto_124946 ?auto_124947 ?auto_124944 ?auto_124948 ?auto_124949 ?auto_124950 ?auto_124951 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_124967 - DIRECTION
      ?auto_124968 - MODE
      ?auto_124969 - DIRECTION
      ?auto_124966 - MODE
      ?auto_124970 - DIRECTION
      ?auto_124971 - MODE
      ?auto_124972 - DIRECTION
      ?auto_124973 - MODE
    )
    :vars
    (
      ?auto_124974 - INSTRUMENT
      ?auto_124976 - SATELLITE
      ?auto_124975 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_124974 ?auto_124976 ) ( SUPPORTS ?auto_124974 ?auto_124971 ) ( not ( = ?auto_124970 ?auto_124975 ) ) ( HAVE_IMAGE ?auto_124972 ?auto_124966 ) ( not ( = ?auto_124972 ?auto_124970 ) ) ( not ( = ?auto_124972 ?auto_124975 ) ) ( not ( = ?auto_124966 ?auto_124971 ) ) ( CALIBRATION_TARGET ?auto_124974 ?auto_124975 ) ( POWER_AVAIL ?auto_124976 ) ( POINTING ?auto_124976 ?auto_124972 ) ( HAVE_IMAGE ?auto_124967 ?auto_124968 ) ( HAVE_IMAGE ?auto_124969 ?auto_124966 ) ( HAVE_IMAGE ?auto_124972 ?auto_124973 ) ( not ( = ?auto_124967 ?auto_124969 ) ) ( not ( = ?auto_124967 ?auto_124970 ) ) ( not ( = ?auto_124967 ?auto_124972 ) ) ( not ( = ?auto_124967 ?auto_124975 ) ) ( not ( = ?auto_124968 ?auto_124966 ) ) ( not ( = ?auto_124968 ?auto_124971 ) ) ( not ( = ?auto_124968 ?auto_124973 ) ) ( not ( = ?auto_124969 ?auto_124970 ) ) ( not ( = ?auto_124969 ?auto_124972 ) ) ( not ( = ?auto_124969 ?auto_124975 ) ) ( not ( = ?auto_124966 ?auto_124973 ) ) ( not ( = ?auto_124971 ?auto_124973 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_124972 ?auto_124966 ?auto_124970 ?auto_124971 )
      ( GET-4IMAGE-VERIFY ?auto_124967 ?auto_124968 ?auto_124969 ?auto_124966 ?auto_124970 ?auto_124971 ?auto_124972 ?auto_124973 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_125055 - DIRECTION
      ?auto_125056 - MODE
      ?auto_125057 - DIRECTION
      ?auto_125054 - MODE
      ?auto_125058 - DIRECTION
      ?auto_125059 - MODE
      ?auto_125060 - DIRECTION
      ?auto_125061 - MODE
    )
    :vars
    (
      ?auto_125062 - INSTRUMENT
      ?auto_125064 - SATELLITE
      ?auto_125063 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_125062 ?auto_125064 ) ( SUPPORTS ?auto_125062 ?auto_125054 ) ( not ( = ?auto_125057 ?auto_125063 ) ) ( HAVE_IMAGE ?auto_125060 ?auto_125056 ) ( not ( = ?auto_125060 ?auto_125057 ) ) ( not ( = ?auto_125060 ?auto_125063 ) ) ( not ( = ?auto_125056 ?auto_125054 ) ) ( CALIBRATION_TARGET ?auto_125062 ?auto_125063 ) ( POWER_AVAIL ?auto_125064 ) ( POINTING ?auto_125064 ?auto_125060 ) ( HAVE_IMAGE ?auto_125055 ?auto_125056 ) ( HAVE_IMAGE ?auto_125058 ?auto_125059 ) ( HAVE_IMAGE ?auto_125060 ?auto_125061 ) ( not ( = ?auto_125055 ?auto_125057 ) ) ( not ( = ?auto_125055 ?auto_125058 ) ) ( not ( = ?auto_125055 ?auto_125060 ) ) ( not ( = ?auto_125055 ?auto_125063 ) ) ( not ( = ?auto_125056 ?auto_125059 ) ) ( not ( = ?auto_125056 ?auto_125061 ) ) ( not ( = ?auto_125057 ?auto_125058 ) ) ( not ( = ?auto_125054 ?auto_125059 ) ) ( not ( = ?auto_125054 ?auto_125061 ) ) ( not ( = ?auto_125058 ?auto_125060 ) ) ( not ( = ?auto_125058 ?auto_125063 ) ) ( not ( = ?auto_125059 ?auto_125061 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_125060 ?auto_125056 ?auto_125057 ?auto_125054 )
      ( GET-4IMAGE-VERIFY ?auto_125055 ?auto_125056 ?auto_125057 ?auto_125054 ?auto_125058 ?auto_125059 ?auto_125060 ?auto_125061 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_125377 - DIRECTION
      ?auto_125378 - MODE
      ?auto_125379 - DIRECTION
      ?auto_125376 - MODE
      ?auto_125380 - DIRECTION
      ?auto_125381 - MODE
      ?auto_125382 - DIRECTION
      ?auto_125383 - MODE
    )
    :vars
    (
      ?auto_125384 - INSTRUMENT
      ?auto_125386 - SATELLITE
      ?auto_125385 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_125384 ?auto_125386 ) ( SUPPORTS ?auto_125384 ?auto_125378 ) ( not ( = ?auto_125377 ?auto_125385 ) ) ( HAVE_IMAGE ?auto_125379 ?auto_125383 ) ( not ( = ?auto_125379 ?auto_125377 ) ) ( not ( = ?auto_125379 ?auto_125385 ) ) ( not ( = ?auto_125383 ?auto_125378 ) ) ( CALIBRATION_TARGET ?auto_125384 ?auto_125385 ) ( POWER_AVAIL ?auto_125386 ) ( POINTING ?auto_125386 ?auto_125379 ) ( HAVE_IMAGE ?auto_125379 ?auto_125376 ) ( HAVE_IMAGE ?auto_125380 ?auto_125381 ) ( HAVE_IMAGE ?auto_125382 ?auto_125383 ) ( not ( = ?auto_125377 ?auto_125380 ) ) ( not ( = ?auto_125377 ?auto_125382 ) ) ( not ( = ?auto_125378 ?auto_125376 ) ) ( not ( = ?auto_125378 ?auto_125381 ) ) ( not ( = ?auto_125379 ?auto_125380 ) ) ( not ( = ?auto_125379 ?auto_125382 ) ) ( not ( = ?auto_125376 ?auto_125381 ) ) ( not ( = ?auto_125376 ?auto_125383 ) ) ( not ( = ?auto_125380 ?auto_125382 ) ) ( not ( = ?auto_125380 ?auto_125385 ) ) ( not ( = ?auto_125381 ?auto_125383 ) ) ( not ( = ?auto_125382 ?auto_125385 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_125379 ?auto_125383 ?auto_125377 ?auto_125378 )
      ( GET-4IMAGE-VERIFY ?auto_125377 ?auto_125378 ?auto_125379 ?auto_125376 ?auto_125380 ?auto_125381 ?auto_125382 ?auto_125383 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_125730 - DIRECTION
      ?auto_125731 - MODE
      ?auto_125732 - DIRECTION
      ?auto_125729 - MODE
      ?auto_125733 - DIRECTION
      ?auto_125734 - MODE
    )
    :vars
    (
      ?auto_125737 - INSTRUMENT
      ?auto_125736 - SATELLITE
      ?auto_125738 - DIRECTION
      ?auto_125735 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_125737 ?auto_125736 ) ( SUPPORTS ?auto_125737 ?auto_125734 ) ( not ( = ?auto_125733 ?auto_125738 ) ) ( HAVE_IMAGE ?auto_125730 ?auto_125729 ) ( not ( = ?auto_125730 ?auto_125733 ) ) ( not ( = ?auto_125730 ?auto_125738 ) ) ( not ( = ?auto_125729 ?auto_125734 ) ) ( CALIBRATION_TARGET ?auto_125737 ?auto_125738 ) ( POINTING ?auto_125736 ?auto_125730 ) ( ON_BOARD ?auto_125735 ?auto_125736 ) ( POWER_ON ?auto_125735 ) ( not ( = ?auto_125737 ?auto_125735 ) ) ( HAVE_IMAGE ?auto_125730 ?auto_125731 ) ( HAVE_IMAGE ?auto_125732 ?auto_125729 ) ( not ( = ?auto_125730 ?auto_125732 ) ) ( not ( = ?auto_125731 ?auto_125729 ) ) ( not ( = ?auto_125731 ?auto_125734 ) ) ( not ( = ?auto_125732 ?auto_125733 ) ) ( not ( = ?auto_125732 ?auto_125738 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_125730 ?auto_125729 ?auto_125733 ?auto_125734 )
      ( GET-3IMAGE-VERIFY ?auto_125730 ?auto_125731 ?auto_125732 ?auto_125729 ?auto_125733 ?auto_125734 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_125750 - DIRECTION
      ?auto_125751 - MODE
      ?auto_125752 - DIRECTION
      ?auto_125749 - MODE
      ?auto_125753 - DIRECTION
      ?auto_125754 - MODE
    )
    :vars
    (
      ?auto_125757 - INSTRUMENT
      ?auto_125756 - SATELLITE
      ?auto_125758 - DIRECTION
      ?auto_125755 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_125757 ?auto_125756 ) ( SUPPORTS ?auto_125757 ?auto_125749 ) ( not ( = ?auto_125752 ?auto_125758 ) ) ( HAVE_IMAGE ?auto_125750 ?auto_125754 ) ( not ( = ?auto_125750 ?auto_125752 ) ) ( not ( = ?auto_125750 ?auto_125758 ) ) ( not ( = ?auto_125754 ?auto_125749 ) ) ( CALIBRATION_TARGET ?auto_125757 ?auto_125758 ) ( POINTING ?auto_125756 ?auto_125750 ) ( ON_BOARD ?auto_125755 ?auto_125756 ) ( POWER_ON ?auto_125755 ) ( not ( = ?auto_125757 ?auto_125755 ) ) ( HAVE_IMAGE ?auto_125750 ?auto_125751 ) ( HAVE_IMAGE ?auto_125753 ?auto_125754 ) ( not ( = ?auto_125750 ?auto_125753 ) ) ( not ( = ?auto_125751 ?auto_125749 ) ) ( not ( = ?auto_125751 ?auto_125754 ) ) ( not ( = ?auto_125752 ?auto_125753 ) ) ( not ( = ?auto_125753 ?auto_125758 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_125750 ?auto_125754 ?auto_125752 ?auto_125749 )
      ( GET-3IMAGE-VERIFY ?auto_125750 ?auto_125751 ?auto_125752 ?auto_125749 ?auto_125753 ?auto_125754 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_125836 - DIRECTION
      ?auto_125837 - MODE
      ?auto_125838 - DIRECTION
      ?auto_125835 - MODE
      ?auto_125839 - DIRECTION
      ?auto_125840 - MODE
    )
    :vars
    (
      ?auto_125843 - INSTRUMENT
      ?auto_125842 - SATELLITE
      ?auto_125844 - DIRECTION
      ?auto_125841 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_125843 ?auto_125842 ) ( SUPPORTS ?auto_125843 ?auto_125837 ) ( not ( = ?auto_125836 ?auto_125844 ) ) ( HAVE_IMAGE ?auto_125838 ?auto_125840 ) ( not ( = ?auto_125838 ?auto_125836 ) ) ( not ( = ?auto_125838 ?auto_125844 ) ) ( not ( = ?auto_125840 ?auto_125837 ) ) ( CALIBRATION_TARGET ?auto_125843 ?auto_125844 ) ( POINTING ?auto_125842 ?auto_125838 ) ( ON_BOARD ?auto_125841 ?auto_125842 ) ( POWER_ON ?auto_125841 ) ( not ( = ?auto_125843 ?auto_125841 ) ) ( HAVE_IMAGE ?auto_125838 ?auto_125835 ) ( HAVE_IMAGE ?auto_125839 ?auto_125840 ) ( not ( = ?auto_125836 ?auto_125839 ) ) ( not ( = ?auto_125837 ?auto_125835 ) ) ( not ( = ?auto_125838 ?auto_125839 ) ) ( not ( = ?auto_125835 ?auto_125840 ) ) ( not ( = ?auto_125839 ?auto_125844 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_125838 ?auto_125840 ?auto_125836 ?auto_125837 )
      ( GET-3IMAGE-VERIFY ?auto_125836 ?auto_125837 ?auto_125838 ?auto_125835 ?auto_125839 ?auto_125840 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_125934 - DIRECTION
      ?auto_125935 - MODE
      ?auto_125936 - DIRECTION
      ?auto_125933 - MODE
      ?auto_125937 - DIRECTION
      ?auto_125938 - MODE
      ?auto_125939 - DIRECTION
      ?auto_125940 - MODE
    )
    :vars
    (
      ?auto_125943 - INSTRUMENT
      ?auto_125942 - SATELLITE
      ?auto_125944 - DIRECTION
      ?auto_125941 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_125943 ?auto_125942 ) ( SUPPORTS ?auto_125943 ?auto_125940 ) ( not ( = ?auto_125939 ?auto_125944 ) ) ( HAVE_IMAGE ?auto_125934 ?auto_125933 ) ( not ( = ?auto_125934 ?auto_125939 ) ) ( not ( = ?auto_125934 ?auto_125944 ) ) ( not ( = ?auto_125933 ?auto_125940 ) ) ( CALIBRATION_TARGET ?auto_125943 ?auto_125944 ) ( POINTING ?auto_125942 ?auto_125934 ) ( ON_BOARD ?auto_125941 ?auto_125942 ) ( POWER_ON ?auto_125941 ) ( not ( = ?auto_125943 ?auto_125941 ) ) ( HAVE_IMAGE ?auto_125934 ?auto_125935 ) ( HAVE_IMAGE ?auto_125936 ?auto_125933 ) ( HAVE_IMAGE ?auto_125937 ?auto_125938 ) ( not ( = ?auto_125934 ?auto_125936 ) ) ( not ( = ?auto_125934 ?auto_125937 ) ) ( not ( = ?auto_125935 ?auto_125933 ) ) ( not ( = ?auto_125935 ?auto_125938 ) ) ( not ( = ?auto_125935 ?auto_125940 ) ) ( not ( = ?auto_125936 ?auto_125937 ) ) ( not ( = ?auto_125936 ?auto_125939 ) ) ( not ( = ?auto_125936 ?auto_125944 ) ) ( not ( = ?auto_125933 ?auto_125938 ) ) ( not ( = ?auto_125937 ?auto_125939 ) ) ( not ( = ?auto_125937 ?auto_125944 ) ) ( not ( = ?auto_125938 ?auto_125940 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_125934 ?auto_125933 ?auto_125939 ?auto_125940 )
      ( GET-4IMAGE-VERIFY ?auto_125934 ?auto_125935 ?auto_125936 ?auto_125933 ?auto_125937 ?auto_125938 ?auto_125939 ?auto_125940 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_125958 - DIRECTION
      ?auto_125959 - MODE
      ?auto_125960 - DIRECTION
      ?auto_125957 - MODE
      ?auto_125961 - DIRECTION
      ?auto_125962 - MODE
      ?auto_125963 - DIRECTION
      ?auto_125964 - MODE
    )
    :vars
    (
      ?auto_125967 - INSTRUMENT
      ?auto_125966 - SATELLITE
      ?auto_125968 - DIRECTION
      ?auto_125965 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_125967 ?auto_125966 ) ( SUPPORTS ?auto_125967 ?auto_125962 ) ( not ( = ?auto_125961 ?auto_125968 ) ) ( HAVE_IMAGE ?auto_125958 ?auto_125964 ) ( not ( = ?auto_125958 ?auto_125961 ) ) ( not ( = ?auto_125958 ?auto_125968 ) ) ( not ( = ?auto_125964 ?auto_125962 ) ) ( CALIBRATION_TARGET ?auto_125967 ?auto_125968 ) ( POINTING ?auto_125966 ?auto_125958 ) ( ON_BOARD ?auto_125965 ?auto_125966 ) ( POWER_ON ?auto_125965 ) ( not ( = ?auto_125967 ?auto_125965 ) ) ( HAVE_IMAGE ?auto_125958 ?auto_125959 ) ( HAVE_IMAGE ?auto_125960 ?auto_125957 ) ( HAVE_IMAGE ?auto_125963 ?auto_125964 ) ( not ( = ?auto_125958 ?auto_125960 ) ) ( not ( = ?auto_125958 ?auto_125963 ) ) ( not ( = ?auto_125959 ?auto_125957 ) ) ( not ( = ?auto_125959 ?auto_125962 ) ) ( not ( = ?auto_125959 ?auto_125964 ) ) ( not ( = ?auto_125960 ?auto_125961 ) ) ( not ( = ?auto_125960 ?auto_125963 ) ) ( not ( = ?auto_125960 ?auto_125968 ) ) ( not ( = ?auto_125957 ?auto_125962 ) ) ( not ( = ?auto_125957 ?auto_125964 ) ) ( not ( = ?auto_125961 ?auto_125963 ) ) ( not ( = ?auto_125963 ?auto_125968 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_125958 ?auto_125964 ?auto_125961 ?auto_125962 )
      ( GET-4IMAGE-VERIFY ?auto_125958 ?auto_125959 ?auto_125960 ?auto_125957 ?auto_125961 ?auto_125962 ?auto_125963 ?auto_125964 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_126054 - DIRECTION
      ?auto_126055 - MODE
      ?auto_126056 - DIRECTION
      ?auto_126053 - MODE
      ?auto_126057 - DIRECTION
      ?auto_126058 - MODE
      ?auto_126059 - DIRECTION
      ?auto_126060 - MODE
    )
    :vars
    (
      ?auto_126063 - INSTRUMENT
      ?auto_126062 - SATELLITE
      ?auto_126064 - DIRECTION
      ?auto_126061 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_126063 ?auto_126062 ) ( SUPPORTS ?auto_126063 ?auto_126053 ) ( not ( = ?auto_126056 ?auto_126064 ) ) ( HAVE_IMAGE ?auto_126054 ?auto_126058 ) ( not ( = ?auto_126054 ?auto_126056 ) ) ( not ( = ?auto_126054 ?auto_126064 ) ) ( not ( = ?auto_126058 ?auto_126053 ) ) ( CALIBRATION_TARGET ?auto_126063 ?auto_126064 ) ( POINTING ?auto_126062 ?auto_126054 ) ( ON_BOARD ?auto_126061 ?auto_126062 ) ( POWER_ON ?auto_126061 ) ( not ( = ?auto_126063 ?auto_126061 ) ) ( HAVE_IMAGE ?auto_126054 ?auto_126055 ) ( HAVE_IMAGE ?auto_126057 ?auto_126058 ) ( HAVE_IMAGE ?auto_126059 ?auto_126060 ) ( not ( = ?auto_126054 ?auto_126057 ) ) ( not ( = ?auto_126054 ?auto_126059 ) ) ( not ( = ?auto_126055 ?auto_126053 ) ) ( not ( = ?auto_126055 ?auto_126058 ) ) ( not ( = ?auto_126055 ?auto_126060 ) ) ( not ( = ?auto_126056 ?auto_126057 ) ) ( not ( = ?auto_126056 ?auto_126059 ) ) ( not ( = ?auto_126053 ?auto_126060 ) ) ( not ( = ?auto_126057 ?auto_126059 ) ) ( not ( = ?auto_126057 ?auto_126064 ) ) ( not ( = ?auto_126058 ?auto_126060 ) ) ( not ( = ?auto_126059 ?auto_126064 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_126054 ?auto_126058 ?auto_126056 ?auto_126053 )
      ( GET-4IMAGE-VERIFY ?auto_126054 ?auto_126055 ?auto_126056 ?auto_126053 ?auto_126057 ?auto_126058 ?auto_126059 ?auto_126060 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_126404 - DIRECTION
      ?auto_126405 - MODE
      ?auto_126406 - DIRECTION
      ?auto_126403 - MODE
      ?auto_126407 - DIRECTION
      ?auto_126408 - MODE
      ?auto_126409 - DIRECTION
      ?auto_126410 - MODE
    )
    :vars
    (
      ?auto_126413 - INSTRUMENT
      ?auto_126412 - SATELLITE
      ?auto_126414 - DIRECTION
      ?auto_126411 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_126413 ?auto_126412 ) ( SUPPORTS ?auto_126413 ?auto_126405 ) ( not ( = ?auto_126404 ?auto_126414 ) ) ( HAVE_IMAGE ?auto_126407 ?auto_126403 ) ( not ( = ?auto_126407 ?auto_126404 ) ) ( not ( = ?auto_126407 ?auto_126414 ) ) ( not ( = ?auto_126403 ?auto_126405 ) ) ( CALIBRATION_TARGET ?auto_126413 ?auto_126414 ) ( POINTING ?auto_126412 ?auto_126407 ) ( ON_BOARD ?auto_126411 ?auto_126412 ) ( POWER_ON ?auto_126411 ) ( not ( = ?auto_126413 ?auto_126411 ) ) ( HAVE_IMAGE ?auto_126406 ?auto_126403 ) ( HAVE_IMAGE ?auto_126407 ?auto_126408 ) ( HAVE_IMAGE ?auto_126409 ?auto_126410 ) ( not ( = ?auto_126404 ?auto_126406 ) ) ( not ( = ?auto_126404 ?auto_126409 ) ) ( not ( = ?auto_126405 ?auto_126408 ) ) ( not ( = ?auto_126405 ?auto_126410 ) ) ( not ( = ?auto_126406 ?auto_126407 ) ) ( not ( = ?auto_126406 ?auto_126409 ) ) ( not ( = ?auto_126406 ?auto_126414 ) ) ( not ( = ?auto_126403 ?auto_126408 ) ) ( not ( = ?auto_126403 ?auto_126410 ) ) ( not ( = ?auto_126407 ?auto_126409 ) ) ( not ( = ?auto_126408 ?auto_126410 ) ) ( not ( = ?auto_126409 ?auto_126414 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_126407 ?auto_126403 ?auto_126404 ?auto_126405 )
      ( GET-4IMAGE-VERIFY ?auto_126404 ?auto_126405 ?auto_126406 ?auto_126403 ?auto_126407 ?auto_126408 ?auto_126409 ?auto_126410 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_136076 - DIRECTION
      ?auto_136077 - MODE
      ?auto_136078 - DIRECTION
      ?auto_136075 - MODE
      ?auto_136079 - DIRECTION
      ?auto_136080 - MODE
      ?auto_136081 - DIRECTION
      ?auto_136082 - MODE
    )
    :vars
    (
      ?auto_136083 - INSTRUMENT
      ?auto_136084 - SATELLITE
      ?auto_136085 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_136083 ) ( ON_BOARD ?auto_136083 ?auto_136084 ) ( SUPPORTS ?auto_136083 ?auto_136075 ) ( POWER_ON ?auto_136083 ) ( POINTING ?auto_136084 ?auto_136085 ) ( not ( = ?auto_136078 ?auto_136085 ) ) ( HAVE_IMAGE ?auto_136079 ?auto_136082 ) ( not ( = ?auto_136079 ?auto_136078 ) ) ( not ( = ?auto_136079 ?auto_136085 ) ) ( not ( = ?auto_136082 ?auto_136075 ) ) ( HAVE_IMAGE ?auto_136076 ?auto_136077 ) ( HAVE_IMAGE ?auto_136079 ?auto_136080 ) ( HAVE_IMAGE ?auto_136081 ?auto_136082 ) ( not ( = ?auto_136076 ?auto_136078 ) ) ( not ( = ?auto_136076 ?auto_136079 ) ) ( not ( = ?auto_136076 ?auto_136081 ) ) ( not ( = ?auto_136076 ?auto_136085 ) ) ( not ( = ?auto_136077 ?auto_136075 ) ) ( not ( = ?auto_136077 ?auto_136080 ) ) ( not ( = ?auto_136077 ?auto_136082 ) ) ( not ( = ?auto_136078 ?auto_136081 ) ) ( not ( = ?auto_136075 ?auto_136080 ) ) ( not ( = ?auto_136079 ?auto_136081 ) ) ( not ( = ?auto_136080 ?auto_136082 ) ) ( not ( = ?auto_136081 ?auto_136085 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_136079 ?auto_136082 ?auto_136078 ?auto_136075 )
      ( GET-4IMAGE-VERIFY ?auto_136076 ?auto_136077 ?auto_136078 ?auto_136075 ?auto_136079 ?auto_136080 ?auto_136081 ?auto_136082 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_136703 - DIRECTION
      ?auto_136704 - MODE
      ?auto_136705 - DIRECTION
      ?auto_136702 - MODE
      ?auto_136706 - DIRECTION
      ?auto_136707 - MODE
      ?auto_136708 - DIRECTION
      ?auto_136709 - MODE
    )
    :vars
    (
      ?auto_136710 - INSTRUMENT
      ?auto_136711 - SATELLITE
      ?auto_136712 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_136710 ) ( ON_BOARD ?auto_136710 ?auto_136711 ) ( SUPPORTS ?auto_136710 ?auto_136707 ) ( POWER_ON ?auto_136710 ) ( POINTING ?auto_136711 ?auto_136712 ) ( not ( = ?auto_136706 ?auto_136712 ) ) ( HAVE_IMAGE ?auto_136705 ?auto_136709 ) ( not ( = ?auto_136705 ?auto_136706 ) ) ( not ( = ?auto_136705 ?auto_136712 ) ) ( not ( = ?auto_136709 ?auto_136707 ) ) ( HAVE_IMAGE ?auto_136703 ?auto_136704 ) ( HAVE_IMAGE ?auto_136705 ?auto_136702 ) ( HAVE_IMAGE ?auto_136708 ?auto_136709 ) ( not ( = ?auto_136703 ?auto_136705 ) ) ( not ( = ?auto_136703 ?auto_136706 ) ) ( not ( = ?auto_136703 ?auto_136708 ) ) ( not ( = ?auto_136703 ?auto_136712 ) ) ( not ( = ?auto_136704 ?auto_136702 ) ) ( not ( = ?auto_136704 ?auto_136707 ) ) ( not ( = ?auto_136704 ?auto_136709 ) ) ( not ( = ?auto_136705 ?auto_136708 ) ) ( not ( = ?auto_136702 ?auto_136707 ) ) ( not ( = ?auto_136702 ?auto_136709 ) ) ( not ( = ?auto_136706 ?auto_136708 ) ) ( not ( = ?auto_136708 ?auto_136712 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_136705 ?auto_136709 ?auto_136706 ?auto_136707 )
      ( GET-4IMAGE-VERIFY ?auto_136703 ?auto_136704 ?auto_136705 ?auto_136702 ?auto_136706 ?auto_136707 ?auto_136708 ?auto_136709 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_137185 - DIRECTION
      ?auto_137186 - MODE
      ?auto_137187 - DIRECTION
      ?auto_137184 - MODE
      ?auto_137188 - DIRECTION
      ?auto_137189 - MODE
      ?auto_137190 - DIRECTION
      ?auto_137191 - MODE
    )
    :vars
    (
      ?auto_137192 - INSTRUMENT
      ?auto_137193 - SATELLITE
      ?auto_137194 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_137192 ) ( ON_BOARD ?auto_137192 ?auto_137193 ) ( SUPPORTS ?auto_137192 ?auto_137186 ) ( POWER_ON ?auto_137192 ) ( POINTING ?auto_137193 ?auto_137194 ) ( not ( = ?auto_137185 ?auto_137194 ) ) ( HAVE_IMAGE ?auto_137187 ?auto_137191 ) ( not ( = ?auto_137187 ?auto_137185 ) ) ( not ( = ?auto_137187 ?auto_137194 ) ) ( not ( = ?auto_137191 ?auto_137186 ) ) ( HAVE_IMAGE ?auto_137187 ?auto_137184 ) ( HAVE_IMAGE ?auto_137188 ?auto_137189 ) ( HAVE_IMAGE ?auto_137190 ?auto_137191 ) ( not ( = ?auto_137185 ?auto_137188 ) ) ( not ( = ?auto_137185 ?auto_137190 ) ) ( not ( = ?auto_137186 ?auto_137184 ) ) ( not ( = ?auto_137186 ?auto_137189 ) ) ( not ( = ?auto_137187 ?auto_137188 ) ) ( not ( = ?auto_137187 ?auto_137190 ) ) ( not ( = ?auto_137184 ?auto_137189 ) ) ( not ( = ?auto_137184 ?auto_137191 ) ) ( not ( = ?auto_137188 ?auto_137190 ) ) ( not ( = ?auto_137188 ?auto_137194 ) ) ( not ( = ?auto_137189 ?auto_137191 ) ) ( not ( = ?auto_137190 ?auto_137194 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_137187 ?auto_137191 ?auto_137185 ?auto_137186 )
      ( GET-4IMAGE-VERIFY ?auto_137185 ?auto_137186 ?auto_137187 ?auto_137184 ?auto_137188 ?auto_137189 ?auto_137190 ?auto_137191 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_137270 - DIRECTION
      ?auto_137271 - MODE
      ?auto_137272 - DIRECTION
      ?auto_137269 - MODE
      ?auto_137273 - DIRECTION
      ?auto_137274 - MODE
      ?auto_137275 - DIRECTION
      ?auto_137276 - MODE
    )
    :vars
    (
      ?auto_137277 - INSTRUMENT
      ?auto_137278 - SATELLITE
      ?auto_137279 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_137277 ) ( ON_BOARD ?auto_137277 ?auto_137278 ) ( SUPPORTS ?auto_137277 ?auto_137271 ) ( POWER_ON ?auto_137277 ) ( POINTING ?auto_137278 ?auto_137279 ) ( not ( = ?auto_137270 ?auto_137279 ) ) ( HAVE_IMAGE ?auto_137273 ?auto_137276 ) ( not ( = ?auto_137273 ?auto_137270 ) ) ( not ( = ?auto_137273 ?auto_137279 ) ) ( not ( = ?auto_137276 ?auto_137271 ) ) ( HAVE_IMAGE ?auto_137272 ?auto_137269 ) ( HAVE_IMAGE ?auto_137273 ?auto_137274 ) ( HAVE_IMAGE ?auto_137275 ?auto_137276 ) ( not ( = ?auto_137270 ?auto_137272 ) ) ( not ( = ?auto_137270 ?auto_137275 ) ) ( not ( = ?auto_137271 ?auto_137269 ) ) ( not ( = ?auto_137271 ?auto_137274 ) ) ( not ( = ?auto_137272 ?auto_137273 ) ) ( not ( = ?auto_137272 ?auto_137275 ) ) ( not ( = ?auto_137272 ?auto_137279 ) ) ( not ( = ?auto_137269 ?auto_137274 ) ) ( not ( = ?auto_137269 ?auto_137276 ) ) ( not ( = ?auto_137273 ?auto_137275 ) ) ( not ( = ?auto_137274 ?auto_137276 ) ) ( not ( = ?auto_137275 ?auto_137279 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_137273 ?auto_137276 ?auto_137270 ?auto_137271 )
      ( GET-4IMAGE-VERIFY ?auto_137270 ?auto_137271 ?auto_137272 ?auto_137269 ?auto_137273 ?auto_137274 ?auto_137275 ?auto_137276 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_137458 - DIRECTION
      ?auto_137459 - MODE
      ?auto_137460 - DIRECTION
      ?auto_137457 - MODE
      ?auto_137461 - DIRECTION
      ?auto_137462 - MODE
      ?auto_137463 - DIRECTION
      ?auto_137464 - MODE
    )
    :vars
    (
      ?auto_137465 - INSTRUMENT
      ?auto_137466 - SATELLITE
      ?auto_137467 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_137465 ) ( ON_BOARD ?auto_137465 ?auto_137466 ) ( SUPPORTS ?auto_137465 ?auto_137459 ) ( POWER_ON ?auto_137465 ) ( POINTING ?auto_137466 ?auto_137467 ) ( not ( = ?auto_137458 ?auto_137467 ) ) ( HAVE_IMAGE ?auto_137463 ?auto_137462 ) ( not ( = ?auto_137463 ?auto_137458 ) ) ( not ( = ?auto_137463 ?auto_137467 ) ) ( not ( = ?auto_137462 ?auto_137459 ) ) ( HAVE_IMAGE ?auto_137460 ?auto_137457 ) ( HAVE_IMAGE ?auto_137461 ?auto_137462 ) ( HAVE_IMAGE ?auto_137463 ?auto_137464 ) ( not ( = ?auto_137458 ?auto_137460 ) ) ( not ( = ?auto_137458 ?auto_137461 ) ) ( not ( = ?auto_137459 ?auto_137457 ) ) ( not ( = ?auto_137459 ?auto_137464 ) ) ( not ( = ?auto_137460 ?auto_137461 ) ) ( not ( = ?auto_137460 ?auto_137463 ) ) ( not ( = ?auto_137460 ?auto_137467 ) ) ( not ( = ?auto_137457 ?auto_137462 ) ) ( not ( = ?auto_137457 ?auto_137464 ) ) ( not ( = ?auto_137461 ?auto_137463 ) ) ( not ( = ?auto_137461 ?auto_137467 ) ) ( not ( = ?auto_137462 ?auto_137464 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_137463 ?auto_137462 ?auto_137458 ?auto_137459 )
      ( GET-4IMAGE-VERIFY ?auto_137458 ?auto_137459 ?auto_137460 ?auto_137457 ?auto_137461 ?auto_137462 ?auto_137463 ?auto_137464 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_137886 - DIRECTION
      ?auto_137887 - MODE
      ?auto_137888 - DIRECTION
      ?auto_137885 - MODE
      ?auto_137889 - DIRECTION
      ?auto_137890 - MODE
    )
    :vars
    (
      ?auto_137891 - INSTRUMENT
      ?auto_137893 - SATELLITE
      ?auto_137892 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_137891 ?auto_137893 ) ( SUPPORTS ?auto_137891 ?auto_137890 ) ( POWER_ON ?auto_137891 ) ( POINTING ?auto_137893 ?auto_137892 ) ( not ( = ?auto_137889 ?auto_137892 ) ) ( HAVE_IMAGE ?auto_137886 ?auto_137885 ) ( not ( = ?auto_137886 ?auto_137889 ) ) ( not ( = ?auto_137886 ?auto_137892 ) ) ( not ( = ?auto_137885 ?auto_137890 ) ) ( CALIBRATION_TARGET ?auto_137891 ?auto_137892 ) ( NOT_CALIBRATED ?auto_137891 ) ( HAVE_IMAGE ?auto_137886 ?auto_137887 ) ( HAVE_IMAGE ?auto_137888 ?auto_137885 ) ( not ( = ?auto_137886 ?auto_137888 ) ) ( not ( = ?auto_137887 ?auto_137885 ) ) ( not ( = ?auto_137887 ?auto_137890 ) ) ( not ( = ?auto_137888 ?auto_137889 ) ) ( not ( = ?auto_137888 ?auto_137892 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_137886 ?auto_137885 ?auto_137889 ?auto_137890 )
      ( GET-3IMAGE-VERIFY ?auto_137886 ?auto_137887 ?auto_137888 ?auto_137885 ?auto_137889 ?auto_137890 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_137919 - DIRECTION
      ?auto_137920 - MODE
      ?auto_137921 - DIRECTION
      ?auto_137918 - MODE
      ?auto_137922 - DIRECTION
      ?auto_137923 - MODE
    )
    :vars
    (
      ?auto_137924 - INSTRUMENT
      ?auto_137926 - SATELLITE
      ?auto_137925 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_137924 ?auto_137926 ) ( SUPPORTS ?auto_137924 ?auto_137918 ) ( POWER_ON ?auto_137924 ) ( POINTING ?auto_137926 ?auto_137925 ) ( not ( = ?auto_137921 ?auto_137925 ) ) ( HAVE_IMAGE ?auto_137919 ?auto_137920 ) ( not ( = ?auto_137919 ?auto_137921 ) ) ( not ( = ?auto_137919 ?auto_137925 ) ) ( not ( = ?auto_137920 ?auto_137918 ) ) ( CALIBRATION_TARGET ?auto_137924 ?auto_137925 ) ( NOT_CALIBRATED ?auto_137924 ) ( HAVE_IMAGE ?auto_137922 ?auto_137923 ) ( not ( = ?auto_137919 ?auto_137922 ) ) ( not ( = ?auto_137920 ?auto_137923 ) ) ( not ( = ?auto_137921 ?auto_137922 ) ) ( not ( = ?auto_137918 ?auto_137923 ) ) ( not ( = ?auto_137922 ?auto_137925 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_137919 ?auto_137920 ?auto_137921 ?auto_137918 )
      ( GET-3IMAGE-VERIFY ?auto_137919 ?auto_137920 ?auto_137921 ?auto_137918 ?auto_137922 ?auto_137923 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_138057 - DIRECTION
      ?auto_138058 - MODE
      ?auto_138059 - DIRECTION
      ?auto_138056 - MODE
      ?auto_138060 - DIRECTION
      ?auto_138061 - MODE
    )
    :vars
    (
      ?auto_138062 - INSTRUMENT
      ?auto_138064 - SATELLITE
      ?auto_138063 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_138062 ?auto_138064 ) ( SUPPORTS ?auto_138062 ?auto_138058 ) ( POWER_ON ?auto_138062 ) ( POINTING ?auto_138064 ?auto_138063 ) ( not ( = ?auto_138057 ?auto_138063 ) ) ( HAVE_IMAGE ?auto_138060 ?auto_138061 ) ( not ( = ?auto_138060 ?auto_138057 ) ) ( not ( = ?auto_138060 ?auto_138063 ) ) ( not ( = ?auto_138061 ?auto_138058 ) ) ( CALIBRATION_TARGET ?auto_138062 ?auto_138063 ) ( NOT_CALIBRATED ?auto_138062 ) ( HAVE_IMAGE ?auto_138059 ?auto_138056 ) ( not ( = ?auto_138057 ?auto_138059 ) ) ( not ( = ?auto_138058 ?auto_138056 ) ) ( not ( = ?auto_138059 ?auto_138060 ) ) ( not ( = ?auto_138059 ?auto_138063 ) ) ( not ( = ?auto_138056 ?auto_138061 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_138060 ?auto_138061 ?auto_138057 ?auto_138058 )
      ( GET-3IMAGE-VERIFY ?auto_138057 ?auto_138058 ?auto_138059 ?auto_138056 ?auto_138060 ?auto_138061 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_138230 - DIRECTION
      ?auto_138231 - MODE
      ?auto_138232 - DIRECTION
      ?auto_138229 - MODE
      ?auto_138233 - DIRECTION
      ?auto_138234 - MODE
      ?auto_138235 - DIRECTION
      ?auto_138236 - MODE
    )
    :vars
    (
      ?auto_138237 - INSTRUMENT
      ?auto_138239 - SATELLITE
      ?auto_138238 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_138237 ?auto_138239 ) ( SUPPORTS ?auto_138237 ?auto_138234 ) ( POWER_ON ?auto_138237 ) ( POINTING ?auto_138239 ?auto_138238 ) ( not ( = ?auto_138233 ?auto_138238 ) ) ( HAVE_IMAGE ?auto_138230 ?auto_138236 ) ( not ( = ?auto_138230 ?auto_138233 ) ) ( not ( = ?auto_138230 ?auto_138238 ) ) ( not ( = ?auto_138236 ?auto_138234 ) ) ( CALIBRATION_TARGET ?auto_138237 ?auto_138238 ) ( NOT_CALIBRATED ?auto_138237 ) ( HAVE_IMAGE ?auto_138230 ?auto_138231 ) ( HAVE_IMAGE ?auto_138232 ?auto_138229 ) ( HAVE_IMAGE ?auto_138235 ?auto_138236 ) ( not ( = ?auto_138230 ?auto_138232 ) ) ( not ( = ?auto_138230 ?auto_138235 ) ) ( not ( = ?auto_138231 ?auto_138229 ) ) ( not ( = ?auto_138231 ?auto_138234 ) ) ( not ( = ?auto_138231 ?auto_138236 ) ) ( not ( = ?auto_138232 ?auto_138233 ) ) ( not ( = ?auto_138232 ?auto_138235 ) ) ( not ( = ?auto_138232 ?auto_138238 ) ) ( not ( = ?auto_138229 ?auto_138234 ) ) ( not ( = ?auto_138229 ?auto_138236 ) ) ( not ( = ?auto_138233 ?auto_138235 ) ) ( not ( = ?auto_138235 ?auto_138238 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_138230 ?auto_138236 ?auto_138233 ?auto_138234 )
      ( GET-4IMAGE-VERIFY ?auto_138230 ?auto_138231 ?auto_138232 ?auto_138229 ?auto_138233 ?auto_138234 ?auto_138235 ?auto_138236 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_138241 - DIRECTION
      ?auto_138242 - MODE
      ?auto_138243 - DIRECTION
      ?auto_138240 - MODE
      ?auto_138244 - DIRECTION
      ?auto_138245 - MODE
      ?auto_138246 - DIRECTION
      ?auto_138247 - MODE
    )
    :vars
    (
      ?auto_138248 - INSTRUMENT
      ?auto_138250 - SATELLITE
      ?auto_138249 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_138248 ?auto_138250 ) ( SUPPORTS ?auto_138248 ?auto_138245 ) ( POWER_ON ?auto_138248 ) ( POINTING ?auto_138250 ?auto_138249 ) ( not ( = ?auto_138244 ?auto_138249 ) ) ( HAVE_IMAGE ?auto_138243 ?auto_138242 ) ( not ( = ?auto_138243 ?auto_138244 ) ) ( not ( = ?auto_138243 ?auto_138249 ) ) ( not ( = ?auto_138242 ?auto_138245 ) ) ( CALIBRATION_TARGET ?auto_138248 ?auto_138249 ) ( NOT_CALIBRATED ?auto_138248 ) ( HAVE_IMAGE ?auto_138241 ?auto_138242 ) ( HAVE_IMAGE ?auto_138243 ?auto_138240 ) ( HAVE_IMAGE ?auto_138246 ?auto_138247 ) ( not ( = ?auto_138241 ?auto_138243 ) ) ( not ( = ?auto_138241 ?auto_138244 ) ) ( not ( = ?auto_138241 ?auto_138246 ) ) ( not ( = ?auto_138241 ?auto_138249 ) ) ( not ( = ?auto_138242 ?auto_138240 ) ) ( not ( = ?auto_138242 ?auto_138247 ) ) ( not ( = ?auto_138243 ?auto_138246 ) ) ( not ( = ?auto_138240 ?auto_138245 ) ) ( not ( = ?auto_138240 ?auto_138247 ) ) ( not ( = ?auto_138244 ?auto_138246 ) ) ( not ( = ?auto_138245 ?auto_138247 ) ) ( not ( = ?auto_138246 ?auto_138249 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_138243 ?auto_138242 ?auto_138244 ?auto_138245 )
      ( GET-4IMAGE-VERIFY ?auto_138241 ?auto_138242 ?auto_138243 ?auto_138240 ?auto_138244 ?auto_138245 ?auto_138246 ?auto_138247 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_138416 - DIRECTION
      ?auto_138417 - MODE
      ?auto_138418 - DIRECTION
      ?auto_138415 - MODE
      ?auto_138419 - DIRECTION
      ?auto_138420 - MODE
      ?auto_138421 - DIRECTION
      ?auto_138422 - MODE
    )
    :vars
    (
      ?auto_138423 - INSTRUMENT
      ?auto_138425 - SATELLITE
      ?auto_138424 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_138423 ?auto_138425 ) ( SUPPORTS ?auto_138423 ?auto_138415 ) ( POWER_ON ?auto_138423 ) ( POINTING ?auto_138425 ?auto_138424 ) ( not ( = ?auto_138418 ?auto_138424 ) ) ( HAVE_IMAGE ?auto_138416 ?auto_138422 ) ( not ( = ?auto_138416 ?auto_138418 ) ) ( not ( = ?auto_138416 ?auto_138424 ) ) ( not ( = ?auto_138422 ?auto_138415 ) ) ( CALIBRATION_TARGET ?auto_138423 ?auto_138424 ) ( NOT_CALIBRATED ?auto_138423 ) ( HAVE_IMAGE ?auto_138416 ?auto_138417 ) ( HAVE_IMAGE ?auto_138419 ?auto_138420 ) ( HAVE_IMAGE ?auto_138421 ?auto_138422 ) ( not ( = ?auto_138416 ?auto_138419 ) ) ( not ( = ?auto_138416 ?auto_138421 ) ) ( not ( = ?auto_138417 ?auto_138415 ) ) ( not ( = ?auto_138417 ?auto_138420 ) ) ( not ( = ?auto_138417 ?auto_138422 ) ) ( not ( = ?auto_138418 ?auto_138419 ) ) ( not ( = ?auto_138418 ?auto_138421 ) ) ( not ( = ?auto_138415 ?auto_138420 ) ) ( not ( = ?auto_138419 ?auto_138421 ) ) ( not ( = ?auto_138419 ?auto_138424 ) ) ( not ( = ?auto_138420 ?auto_138422 ) ) ( not ( = ?auto_138421 ?auto_138424 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_138416 ?auto_138422 ?auto_138418 ?auto_138415 )
      ( GET-4IMAGE-VERIFY ?auto_138416 ?auto_138417 ?auto_138418 ?auto_138415 ?auto_138419 ?auto_138420 ?auto_138421 ?auto_138422 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_138616 - DIRECTION
      ?auto_138617 - MODE
      ?auto_138618 - DIRECTION
      ?auto_138615 - MODE
      ?auto_138619 - DIRECTION
      ?auto_138620 - MODE
      ?auto_138621 - DIRECTION
      ?auto_138622 - MODE
    )
    :vars
    (
      ?auto_138623 - INSTRUMENT
      ?auto_138625 - SATELLITE
      ?auto_138624 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_138623 ?auto_138625 ) ( SUPPORTS ?auto_138623 ?auto_138620 ) ( POWER_ON ?auto_138623 ) ( POINTING ?auto_138625 ?auto_138624 ) ( not ( = ?auto_138619 ?auto_138624 ) ) ( HAVE_IMAGE ?auto_138618 ?auto_138622 ) ( not ( = ?auto_138618 ?auto_138619 ) ) ( not ( = ?auto_138618 ?auto_138624 ) ) ( not ( = ?auto_138622 ?auto_138620 ) ) ( CALIBRATION_TARGET ?auto_138623 ?auto_138624 ) ( NOT_CALIBRATED ?auto_138623 ) ( HAVE_IMAGE ?auto_138616 ?auto_138617 ) ( HAVE_IMAGE ?auto_138618 ?auto_138615 ) ( HAVE_IMAGE ?auto_138621 ?auto_138622 ) ( not ( = ?auto_138616 ?auto_138618 ) ) ( not ( = ?auto_138616 ?auto_138619 ) ) ( not ( = ?auto_138616 ?auto_138621 ) ) ( not ( = ?auto_138616 ?auto_138624 ) ) ( not ( = ?auto_138617 ?auto_138615 ) ) ( not ( = ?auto_138617 ?auto_138620 ) ) ( not ( = ?auto_138617 ?auto_138622 ) ) ( not ( = ?auto_138618 ?auto_138621 ) ) ( not ( = ?auto_138615 ?auto_138620 ) ) ( not ( = ?auto_138615 ?auto_138622 ) ) ( not ( = ?auto_138619 ?auto_138621 ) ) ( not ( = ?auto_138621 ?auto_138624 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_138618 ?auto_138622 ?auto_138619 ?auto_138620 )
      ( GET-4IMAGE-VERIFY ?auto_138616 ?auto_138617 ?auto_138618 ?auto_138615 ?auto_138619 ?auto_138620 ?auto_138621 ?auto_138622 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_138825 - DIRECTION
      ?auto_138826 - MODE
      ?auto_138827 - DIRECTION
      ?auto_138824 - MODE
      ?auto_138828 - DIRECTION
      ?auto_138829 - MODE
      ?auto_138830 - DIRECTION
      ?auto_138831 - MODE
    )
    :vars
    (
      ?auto_138832 - INSTRUMENT
      ?auto_138834 - SATELLITE
      ?auto_138833 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_138832 ?auto_138834 ) ( SUPPORTS ?auto_138832 ?auto_138824 ) ( POWER_ON ?auto_138832 ) ( POINTING ?auto_138834 ?auto_138833 ) ( not ( = ?auto_138827 ?auto_138833 ) ) ( HAVE_IMAGE ?auto_138830 ?auto_138829 ) ( not ( = ?auto_138830 ?auto_138827 ) ) ( not ( = ?auto_138830 ?auto_138833 ) ) ( not ( = ?auto_138829 ?auto_138824 ) ) ( CALIBRATION_TARGET ?auto_138832 ?auto_138833 ) ( NOT_CALIBRATED ?auto_138832 ) ( HAVE_IMAGE ?auto_138825 ?auto_138826 ) ( HAVE_IMAGE ?auto_138828 ?auto_138829 ) ( HAVE_IMAGE ?auto_138830 ?auto_138831 ) ( not ( = ?auto_138825 ?auto_138827 ) ) ( not ( = ?auto_138825 ?auto_138828 ) ) ( not ( = ?auto_138825 ?auto_138830 ) ) ( not ( = ?auto_138825 ?auto_138833 ) ) ( not ( = ?auto_138826 ?auto_138824 ) ) ( not ( = ?auto_138826 ?auto_138829 ) ) ( not ( = ?auto_138826 ?auto_138831 ) ) ( not ( = ?auto_138827 ?auto_138828 ) ) ( not ( = ?auto_138824 ?auto_138831 ) ) ( not ( = ?auto_138828 ?auto_138830 ) ) ( not ( = ?auto_138828 ?auto_138833 ) ) ( not ( = ?auto_138829 ?auto_138831 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_138830 ?auto_138829 ?auto_138827 ?auto_138824 )
      ( GET-4IMAGE-VERIFY ?auto_138825 ?auto_138826 ?auto_138827 ?auto_138824 ?auto_138828 ?auto_138829 ?auto_138830 ?auto_138831 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_139013 - DIRECTION
      ?auto_139014 - MODE
      ?auto_139015 - DIRECTION
      ?auto_139012 - MODE
      ?auto_139016 - DIRECTION
      ?auto_139017 - MODE
      ?auto_139018 - DIRECTION
      ?auto_139019 - MODE
    )
    :vars
    (
      ?auto_139020 - INSTRUMENT
      ?auto_139022 - SATELLITE
      ?auto_139021 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_139020 ?auto_139022 ) ( SUPPORTS ?auto_139020 ?auto_139019 ) ( POWER_ON ?auto_139020 ) ( POINTING ?auto_139022 ?auto_139021 ) ( not ( = ?auto_139018 ?auto_139021 ) ) ( HAVE_IMAGE ?auto_139015 ?auto_139017 ) ( not ( = ?auto_139015 ?auto_139018 ) ) ( not ( = ?auto_139015 ?auto_139021 ) ) ( not ( = ?auto_139017 ?auto_139019 ) ) ( CALIBRATION_TARGET ?auto_139020 ?auto_139021 ) ( NOT_CALIBRATED ?auto_139020 ) ( HAVE_IMAGE ?auto_139013 ?auto_139014 ) ( HAVE_IMAGE ?auto_139015 ?auto_139012 ) ( HAVE_IMAGE ?auto_139016 ?auto_139017 ) ( not ( = ?auto_139013 ?auto_139015 ) ) ( not ( = ?auto_139013 ?auto_139016 ) ) ( not ( = ?auto_139013 ?auto_139018 ) ) ( not ( = ?auto_139013 ?auto_139021 ) ) ( not ( = ?auto_139014 ?auto_139012 ) ) ( not ( = ?auto_139014 ?auto_139017 ) ) ( not ( = ?auto_139014 ?auto_139019 ) ) ( not ( = ?auto_139015 ?auto_139016 ) ) ( not ( = ?auto_139012 ?auto_139017 ) ) ( not ( = ?auto_139012 ?auto_139019 ) ) ( not ( = ?auto_139016 ?auto_139018 ) ) ( not ( = ?auto_139016 ?auto_139021 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_139015 ?auto_139017 ?auto_139018 ?auto_139019 )
      ( GET-4IMAGE-VERIFY ?auto_139013 ?auto_139014 ?auto_139015 ?auto_139012 ?auto_139016 ?auto_139017 ?auto_139018 ?auto_139019 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_139484 - DIRECTION
      ?auto_139485 - MODE
      ?auto_139486 - DIRECTION
      ?auto_139483 - MODE
      ?auto_139487 - DIRECTION
      ?auto_139488 - MODE
      ?auto_139489 - DIRECTION
      ?auto_139490 - MODE
    )
    :vars
    (
      ?auto_139491 - INSTRUMENT
      ?auto_139493 - SATELLITE
      ?auto_139492 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_139491 ?auto_139493 ) ( SUPPORTS ?auto_139491 ?auto_139485 ) ( POWER_ON ?auto_139491 ) ( POINTING ?auto_139493 ?auto_139492 ) ( not ( = ?auto_139484 ?auto_139492 ) ) ( HAVE_IMAGE ?auto_139489 ?auto_139483 ) ( not ( = ?auto_139489 ?auto_139484 ) ) ( not ( = ?auto_139489 ?auto_139492 ) ) ( not ( = ?auto_139483 ?auto_139485 ) ) ( CALIBRATION_TARGET ?auto_139491 ?auto_139492 ) ( NOT_CALIBRATED ?auto_139491 ) ( HAVE_IMAGE ?auto_139486 ?auto_139483 ) ( HAVE_IMAGE ?auto_139487 ?auto_139488 ) ( HAVE_IMAGE ?auto_139489 ?auto_139490 ) ( not ( = ?auto_139484 ?auto_139486 ) ) ( not ( = ?auto_139484 ?auto_139487 ) ) ( not ( = ?auto_139485 ?auto_139488 ) ) ( not ( = ?auto_139485 ?auto_139490 ) ) ( not ( = ?auto_139486 ?auto_139487 ) ) ( not ( = ?auto_139486 ?auto_139489 ) ) ( not ( = ?auto_139486 ?auto_139492 ) ) ( not ( = ?auto_139483 ?auto_139488 ) ) ( not ( = ?auto_139483 ?auto_139490 ) ) ( not ( = ?auto_139487 ?auto_139489 ) ) ( not ( = ?auto_139487 ?auto_139492 ) ) ( not ( = ?auto_139488 ?auto_139490 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_139489 ?auto_139483 ?auto_139484 ?auto_139485 )
      ( GET-4IMAGE-VERIFY ?auto_139484 ?auto_139485 ?auto_139486 ?auto_139483 ?auto_139487 ?auto_139488 ?auto_139489 ?auto_139490 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_139610 - DIRECTION
      ?auto_139611 - MODE
      ?auto_139612 - DIRECTION
      ?auto_139609 - MODE
      ?auto_139613 - DIRECTION
      ?auto_139614 - MODE
      ?auto_139615 - DIRECTION
      ?auto_139616 - MODE
    )
    :vars
    (
      ?auto_139617 - INSTRUMENT
      ?auto_139619 - SATELLITE
      ?auto_139618 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_139617 ?auto_139619 ) ( SUPPORTS ?auto_139617 ?auto_139611 ) ( POWER_ON ?auto_139617 ) ( POINTING ?auto_139619 ?auto_139618 ) ( not ( = ?auto_139610 ?auto_139618 ) ) ( HAVE_IMAGE ?auto_139613 ?auto_139616 ) ( not ( = ?auto_139613 ?auto_139610 ) ) ( not ( = ?auto_139613 ?auto_139618 ) ) ( not ( = ?auto_139616 ?auto_139611 ) ) ( CALIBRATION_TARGET ?auto_139617 ?auto_139618 ) ( NOT_CALIBRATED ?auto_139617 ) ( HAVE_IMAGE ?auto_139612 ?auto_139609 ) ( HAVE_IMAGE ?auto_139613 ?auto_139614 ) ( HAVE_IMAGE ?auto_139615 ?auto_139616 ) ( not ( = ?auto_139610 ?auto_139612 ) ) ( not ( = ?auto_139610 ?auto_139615 ) ) ( not ( = ?auto_139611 ?auto_139609 ) ) ( not ( = ?auto_139611 ?auto_139614 ) ) ( not ( = ?auto_139612 ?auto_139613 ) ) ( not ( = ?auto_139612 ?auto_139615 ) ) ( not ( = ?auto_139612 ?auto_139618 ) ) ( not ( = ?auto_139609 ?auto_139614 ) ) ( not ( = ?auto_139609 ?auto_139616 ) ) ( not ( = ?auto_139613 ?auto_139615 ) ) ( not ( = ?auto_139614 ?auto_139616 ) ) ( not ( = ?auto_139615 ?auto_139618 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_139613 ?auto_139616 ?auto_139610 ?auto_139611 )
      ( GET-4IMAGE-VERIFY ?auto_139610 ?auto_139611 ?auto_139612 ?auto_139609 ?auto_139613 ?auto_139614 ?auto_139615 ?auto_139616 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_140226 - DIRECTION
      ?auto_140227 - MODE
      ?auto_140228 - DIRECTION
      ?auto_140225 - MODE
      ?auto_140229 - DIRECTION
      ?auto_140230 - MODE
    )
    :vars
    (
      ?auto_140232 - INSTRUMENT
      ?auto_140233 - SATELLITE
      ?auto_140231 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_140232 ?auto_140233 ) ( SUPPORTS ?auto_140232 ?auto_140230 ) ( POINTING ?auto_140233 ?auto_140231 ) ( not ( = ?auto_140229 ?auto_140231 ) ) ( HAVE_IMAGE ?auto_140228 ?auto_140225 ) ( not ( = ?auto_140228 ?auto_140229 ) ) ( not ( = ?auto_140228 ?auto_140231 ) ) ( not ( = ?auto_140225 ?auto_140230 ) ) ( CALIBRATION_TARGET ?auto_140232 ?auto_140231 ) ( POWER_AVAIL ?auto_140233 ) ( HAVE_IMAGE ?auto_140226 ?auto_140227 ) ( not ( = ?auto_140226 ?auto_140228 ) ) ( not ( = ?auto_140226 ?auto_140229 ) ) ( not ( = ?auto_140226 ?auto_140231 ) ) ( not ( = ?auto_140227 ?auto_140225 ) ) ( not ( = ?auto_140227 ?auto_140230 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_140228 ?auto_140225 ?auto_140229 ?auto_140230 )
      ( GET-3IMAGE-VERIFY ?auto_140226 ?auto_140227 ?auto_140228 ?auto_140225 ?auto_140229 ?auto_140230 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_140534 - DIRECTION
      ?auto_140535 - MODE
      ?auto_140536 - DIRECTION
      ?auto_140533 - MODE
      ?auto_140537 - DIRECTION
      ?auto_140538 - MODE
      ?auto_140539 - DIRECTION
      ?auto_140540 - MODE
    )
    :vars
    (
      ?auto_140542 - INSTRUMENT
      ?auto_140543 - SATELLITE
      ?auto_140541 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_140542 ?auto_140543 ) ( SUPPORTS ?auto_140542 ?auto_140540 ) ( POINTING ?auto_140543 ?auto_140541 ) ( not ( = ?auto_140539 ?auto_140541 ) ) ( HAVE_IMAGE ?auto_140534 ?auto_140533 ) ( not ( = ?auto_140534 ?auto_140539 ) ) ( not ( = ?auto_140534 ?auto_140541 ) ) ( not ( = ?auto_140533 ?auto_140540 ) ) ( CALIBRATION_TARGET ?auto_140542 ?auto_140541 ) ( POWER_AVAIL ?auto_140543 ) ( HAVE_IMAGE ?auto_140534 ?auto_140535 ) ( HAVE_IMAGE ?auto_140536 ?auto_140533 ) ( HAVE_IMAGE ?auto_140537 ?auto_140538 ) ( not ( = ?auto_140534 ?auto_140536 ) ) ( not ( = ?auto_140534 ?auto_140537 ) ) ( not ( = ?auto_140535 ?auto_140533 ) ) ( not ( = ?auto_140535 ?auto_140538 ) ) ( not ( = ?auto_140535 ?auto_140540 ) ) ( not ( = ?auto_140536 ?auto_140537 ) ) ( not ( = ?auto_140536 ?auto_140539 ) ) ( not ( = ?auto_140536 ?auto_140541 ) ) ( not ( = ?auto_140533 ?auto_140538 ) ) ( not ( = ?auto_140537 ?auto_140539 ) ) ( not ( = ?auto_140537 ?auto_140541 ) ) ( not ( = ?auto_140538 ?auto_140540 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_140534 ?auto_140533 ?auto_140539 ?auto_140540 )
      ( GET-4IMAGE-VERIFY ?auto_140534 ?auto_140535 ?auto_140536 ?auto_140533 ?auto_140537 ?auto_140538 ?auto_140539 ?auto_140540 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_140611 - DIRECTION
      ?auto_140612 - MODE
      ?auto_140613 - DIRECTION
      ?auto_140610 - MODE
      ?auto_140614 - DIRECTION
      ?auto_140615 - MODE
      ?auto_140616 - DIRECTION
      ?auto_140617 - MODE
    )
    :vars
    (
      ?auto_140619 - INSTRUMENT
      ?auto_140620 - SATELLITE
      ?auto_140618 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_140619 ?auto_140620 ) ( SUPPORTS ?auto_140619 ?auto_140617 ) ( POINTING ?auto_140620 ?auto_140618 ) ( not ( = ?auto_140616 ?auto_140618 ) ) ( HAVE_IMAGE ?auto_140614 ?auto_140612 ) ( not ( = ?auto_140614 ?auto_140616 ) ) ( not ( = ?auto_140614 ?auto_140618 ) ) ( not ( = ?auto_140612 ?auto_140617 ) ) ( CALIBRATION_TARGET ?auto_140619 ?auto_140618 ) ( POWER_AVAIL ?auto_140620 ) ( HAVE_IMAGE ?auto_140611 ?auto_140612 ) ( HAVE_IMAGE ?auto_140613 ?auto_140610 ) ( HAVE_IMAGE ?auto_140614 ?auto_140615 ) ( not ( = ?auto_140611 ?auto_140613 ) ) ( not ( = ?auto_140611 ?auto_140614 ) ) ( not ( = ?auto_140611 ?auto_140616 ) ) ( not ( = ?auto_140611 ?auto_140618 ) ) ( not ( = ?auto_140612 ?auto_140610 ) ) ( not ( = ?auto_140612 ?auto_140615 ) ) ( not ( = ?auto_140613 ?auto_140614 ) ) ( not ( = ?auto_140613 ?auto_140616 ) ) ( not ( = ?auto_140613 ?auto_140618 ) ) ( not ( = ?auto_140610 ?auto_140615 ) ) ( not ( = ?auto_140610 ?auto_140617 ) ) ( not ( = ?auto_140615 ?auto_140617 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_140614 ?auto_140612 ?auto_140616 ?auto_140617 )
      ( GET-4IMAGE-VERIFY ?auto_140611 ?auto_140612 ?auto_140613 ?auto_140610 ?auto_140614 ?auto_140615 ?auto_140616 ?auto_140617 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_140641 - DIRECTION
      ?auto_140642 - MODE
      ?auto_140643 - DIRECTION
      ?auto_140640 - MODE
      ?auto_140644 - DIRECTION
      ?auto_140645 - MODE
      ?auto_140646 - DIRECTION
      ?auto_140647 - MODE
    )
    :vars
    (
      ?auto_140649 - INSTRUMENT
      ?auto_140650 - SATELLITE
      ?auto_140648 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_140649 ?auto_140650 ) ( SUPPORTS ?auto_140649 ?auto_140645 ) ( POINTING ?auto_140650 ?auto_140648 ) ( not ( = ?auto_140644 ?auto_140648 ) ) ( HAVE_IMAGE ?auto_140646 ?auto_140642 ) ( not ( = ?auto_140646 ?auto_140644 ) ) ( not ( = ?auto_140646 ?auto_140648 ) ) ( not ( = ?auto_140642 ?auto_140645 ) ) ( CALIBRATION_TARGET ?auto_140649 ?auto_140648 ) ( POWER_AVAIL ?auto_140650 ) ( HAVE_IMAGE ?auto_140641 ?auto_140642 ) ( HAVE_IMAGE ?auto_140643 ?auto_140640 ) ( HAVE_IMAGE ?auto_140646 ?auto_140647 ) ( not ( = ?auto_140641 ?auto_140643 ) ) ( not ( = ?auto_140641 ?auto_140644 ) ) ( not ( = ?auto_140641 ?auto_140646 ) ) ( not ( = ?auto_140641 ?auto_140648 ) ) ( not ( = ?auto_140642 ?auto_140640 ) ) ( not ( = ?auto_140642 ?auto_140647 ) ) ( not ( = ?auto_140643 ?auto_140644 ) ) ( not ( = ?auto_140643 ?auto_140646 ) ) ( not ( = ?auto_140643 ?auto_140648 ) ) ( not ( = ?auto_140640 ?auto_140645 ) ) ( not ( = ?auto_140640 ?auto_140647 ) ) ( not ( = ?auto_140645 ?auto_140647 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_140646 ?auto_140642 ?auto_140644 ?auto_140645 )
      ( GET-4IMAGE-VERIFY ?auto_140641 ?auto_140642 ?auto_140643 ?auto_140640 ?auto_140644 ?auto_140645 ?auto_140646 ?auto_140647 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_141350 - DIRECTION
      ?auto_141351 - MODE
      ?auto_141352 - DIRECTION
      ?auto_141349 - MODE
      ?auto_141353 - DIRECTION
      ?auto_141354 - MODE
      ?auto_141355 - DIRECTION
      ?auto_141356 - MODE
    )
    :vars
    (
      ?auto_141358 - INSTRUMENT
      ?auto_141359 - SATELLITE
      ?auto_141357 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_141358 ?auto_141359 ) ( SUPPORTS ?auto_141358 ?auto_141356 ) ( POINTING ?auto_141359 ?auto_141357 ) ( not ( = ?auto_141355 ?auto_141357 ) ) ( HAVE_IMAGE ?auto_141352 ?auto_141354 ) ( not ( = ?auto_141352 ?auto_141355 ) ) ( not ( = ?auto_141352 ?auto_141357 ) ) ( not ( = ?auto_141354 ?auto_141356 ) ) ( CALIBRATION_TARGET ?auto_141358 ?auto_141357 ) ( POWER_AVAIL ?auto_141359 ) ( HAVE_IMAGE ?auto_141350 ?auto_141351 ) ( HAVE_IMAGE ?auto_141352 ?auto_141349 ) ( HAVE_IMAGE ?auto_141353 ?auto_141354 ) ( not ( = ?auto_141350 ?auto_141352 ) ) ( not ( = ?auto_141350 ?auto_141353 ) ) ( not ( = ?auto_141350 ?auto_141355 ) ) ( not ( = ?auto_141350 ?auto_141357 ) ) ( not ( = ?auto_141351 ?auto_141349 ) ) ( not ( = ?auto_141351 ?auto_141354 ) ) ( not ( = ?auto_141351 ?auto_141356 ) ) ( not ( = ?auto_141352 ?auto_141353 ) ) ( not ( = ?auto_141349 ?auto_141354 ) ) ( not ( = ?auto_141349 ?auto_141356 ) ) ( not ( = ?auto_141353 ?auto_141355 ) ) ( not ( = ?auto_141353 ?auto_141357 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_141352 ?auto_141354 ?auto_141355 ?auto_141356 )
      ( GET-4IMAGE-VERIFY ?auto_141350 ?auto_141351 ?auto_141352 ?auto_141349 ?auto_141353 ?auto_141354 ?auto_141355 ?auto_141356 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_141777 - DIRECTION
      ?auto_141778 - MODE
      ?auto_141779 - DIRECTION
      ?auto_141776 - MODE
      ?auto_141780 - DIRECTION
      ?auto_141781 - MODE
      ?auto_141782 - DIRECTION
      ?auto_141783 - MODE
    )
    :vars
    (
      ?auto_141785 - INSTRUMENT
      ?auto_141786 - SATELLITE
      ?auto_141784 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_141785 ?auto_141786 ) ( SUPPORTS ?auto_141785 ?auto_141778 ) ( POINTING ?auto_141786 ?auto_141784 ) ( not ( = ?auto_141777 ?auto_141784 ) ) ( HAVE_IMAGE ?auto_141782 ?auto_141781 ) ( not ( = ?auto_141782 ?auto_141777 ) ) ( not ( = ?auto_141782 ?auto_141784 ) ) ( not ( = ?auto_141781 ?auto_141778 ) ) ( CALIBRATION_TARGET ?auto_141785 ?auto_141784 ) ( POWER_AVAIL ?auto_141786 ) ( HAVE_IMAGE ?auto_141779 ?auto_141776 ) ( HAVE_IMAGE ?auto_141780 ?auto_141781 ) ( HAVE_IMAGE ?auto_141782 ?auto_141783 ) ( not ( = ?auto_141777 ?auto_141779 ) ) ( not ( = ?auto_141777 ?auto_141780 ) ) ( not ( = ?auto_141778 ?auto_141776 ) ) ( not ( = ?auto_141778 ?auto_141783 ) ) ( not ( = ?auto_141779 ?auto_141780 ) ) ( not ( = ?auto_141779 ?auto_141782 ) ) ( not ( = ?auto_141779 ?auto_141784 ) ) ( not ( = ?auto_141776 ?auto_141781 ) ) ( not ( = ?auto_141776 ?auto_141783 ) ) ( not ( = ?auto_141780 ?auto_141782 ) ) ( not ( = ?auto_141780 ?auto_141784 ) ) ( not ( = ?auto_141781 ?auto_141783 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_141782 ?auto_141781 ?auto_141777 ?auto_141778 )
      ( GET-4IMAGE-VERIFY ?auto_141777 ?auto_141778 ?auto_141779 ?auto_141776 ?auto_141780 ?auto_141781 ?auto_141782 ?auto_141783 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_141821 - DIRECTION
      ?auto_141822 - MODE
      ?auto_141823 - DIRECTION
      ?auto_141820 - MODE
      ?auto_141824 - DIRECTION
      ?auto_141825 - MODE
      ?auto_141826 - DIRECTION
      ?auto_141827 - MODE
    )
    :vars
    (
      ?auto_141829 - INSTRUMENT
      ?auto_141830 - SATELLITE
      ?auto_141828 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_141829 ?auto_141830 ) ( SUPPORTS ?auto_141829 ?auto_141822 ) ( POINTING ?auto_141830 ?auto_141828 ) ( not ( = ?auto_141821 ?auto_141828 ) ) ( HAVE_IMAGE ?auto_141823 ?auto_141827 ) ( not ( = ?auto_141823 ?auto_141821 ) ) ( not ( = ?auto_141823 ?auto_141828 ) ) ( not ( = ?auto_141827 ?auto_141822 ) ) ( CALIBRATION_TARGET ?auto_141829 ?auto_141828 ) ( POWER_AVAIL ?auto_141830 ) ( HAVE_IMAGE ?auto_141823 ?auto_141820 ) ( HAVE_IMAGE ?auto_141824 ?auto_141825 ) ( HAVE_IMAGE ?auto_141826 ?auto_141827 ) ( not ( = ?auto_141821 ?auto_141824 ) ) ( not ( = ?auto_141821 ?auto_141826 ) ) ( not ( = ?auto_141822 ?auto_141820 ) ) ( not ( = ?auto_141822 ?auto_141825 ) ) ( not ( = ?auto_141823 ?auto_141824 ) ) ( not ( = ?auto_141823 ?auto_141826 ) ) ( not ( = ?auto_141820 ?auto_141825 ) ) ( not ( = ?auto_141820 ?auto_141827 ) ) ( not ( = ?auto_141824 ?auto_141826 ) ) ( not ( = ?auto_141824 ?auto_141828 ) ) ( not ( = ?auto_141825 ?auto_141827 ) ) ( not ( = ?auto_141826 ?auto_141828 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_141823 ?auto_141827 ?auto_141821 ?auto_141822 )
      ( GET-4IMAGE-VERIFY ?auto_141821 ?auto_141822 ?auto_141823 ?auto_141820 ?auto_141824 ?auto_141825 ?auto_141826 ?auto_141827 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_141862 - DIRECTION
      ?auto_141863 - MODE
      ?auto_141864 - DIRECTION
      ?auto_141861 - MODE
      ?auto_141865 - DIRECTION
      ?auto_141866 - MODE
      ?auto_141867 - DIRECTION
      ?auto_141868 - MODE
    )
    :vars
    (
      ?auto_141870 - INSTRUMENT
      ?auto_141871 - SATELLITE
      ?auto_141869 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_141870 ?auto_141871 ) ( SUPPORTS ?auto_141870 ?auto_141863 ) ( POINTING ?auto_141871 ?auto_141869 ) ( not ( = ?auto_141862 ?auto_141869 ) ) ( HAVE_IMAGE ?auto_141867 ?auto_141861 ) ( not ( = ?auto_141867 ?auto_141862 ) ) ( not ( = ?auto_141867 ?auto_141869 ) ) ( not ( = ?auto_141861 ?auto_141863 ) ) ( CALIBRATION_TARGET ?auto_141870 ?auto_141869 ) ( POWER_AVAIL ?auto_141871 ) ( HAVE_IMAGE ?auto_141864 ?auto_141861 ) ( HAVE_IMAGE ?auto_141865 ?auto_141866 ) ( HAVE_IMAGE ?auto_141867 ?auto_141868 ) ( not ( = ?auto_141862 ?auto_141864 ) ) ( not ( = ?auto_141862 ?auto_141865 ) ) ( not ( = ?auto_141863 ?auto_141866 ) ) ( not ( = ?auto_141863 ?auto_141868 ) ) ( not ( = ?auto_141864 ?auto_141865 ) ) ( not ( = ?auto_141864 ?auto_141867 ) ) ( not ( = ?auto_141864 ?auto_141869 ) ) ( not ( = ?auto_141861 ?auto_141866 ) ) ( not ( = ?auto_141861 ?auto_141868 ) ) ( not ( = ?auto_141865 ?auto_141867 ) ) ( not ( = ?auto_141865 ?auto_141869 ) ) ( not ( = ?auto_141866 ?auto_141868 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_141867 ?auto_141861 ?auto_141862 ?auto_141863 )
      ( GET-4IMAGE-VERIFY ?auto_141862 ?auto_141863 ?auto_141864 ?auto_141861 ?auto_141865 ?auto_141866 ?auto_141867 ?auto_141868 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142577 - DIRECTION
      ?auto_142578 - MODE
      ?auto_142579 - DIRECTION
      ?auto_142576 - MODE
      ?auto_142580 - DIRECTION
      ?auto_142581 - MODE
    )
    :vars
    (
      ?auto_142584 - INSTRUMENT
      ?auto_142585 - SATELLITE
      ?auto_142582 - DIRECTION
      ?auto_142583 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142584 ?auto_142585 ) ( SUPPORTS ?auto_142584 ?auto_142581 ) ( not ( = ?auto_142580 ?auto_142582 ) ) ( HAVE_IMAGE ?auto_142577 ?auto_142578 ) ( not ( = ?auto_142577 ?auto_142580 ) ) ( not ( = ?auto_142577 ?auto_142582 ) ) ( not ( = ?auto_142578 ?auto_142581 ) ) ( CALIBRATION_TARGET ?auto_142584 ?auto_142582 ) ( POWER_AVAIL ?auto_142585 ) ( POINTING ?auto_142585 ?auto_142583 ) ( not ( = ?auto_142582 ?auto_142583 ) ) ( not ( = ?auto_142580 ?auto_142583 ) ) ( not ( = ?auto_142577 ?auto_142583 ) ) ( HAVE_IMAGE ?auto_142579 ?auto_142576 ) ( not ( = ?auto_142577 ?auto_142579 ) ) ( not ( = ?auto_142578 ?auto_142576 ) ) ( not ( = ?auto_142579 ?auto_142580 ) ) ( not ( = ?auto_142579 ?auto_142582 ) ) ( not ( = ?auto_142579 ?auto_142583 ) ) ( not ( = ?auto_142576 ?auto_142581 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142577 ?auto_142578 ?auto_142580 ?auto_142581 )
      ( GET-3IMAGE-VERIFY ?auto_142577 ?auto_142578 ?auto_142579 ?auto_142576 ?auto_142580 ?auto_142581 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142602 - DIRECTION
      ?auto_142603 - MODE
      ?auto_142604 - DIRECTION
      ?auto_142601 - MODE
      ?auto_142605 - DIRECTION
      ?auto_142606 - MODE
    )
    :vars
    (
      ?auto_142609 - INSTRUMENT
      ?auto_142610 - SATELLITE
      ?auto_142607 - DIRECTION
      ?auto_142608 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142609 ?auto_142610 ) ( SUPPORTS ?auto_142609 ?auto_142601 ) ( not ( = ?auto_142604 ?auto_142607 ) ) ( HAVE_IMAGE ?auto_142602 ?auto_142603 ) ( not ( = ?auto_142602 ?auto_142604 ) ) ( not ( = ?auto_142602 ?auto_142607 ) ) ( not ( = ?auto_142603 ?auto_142601 ) ) ( CALIBRATION_TARGET ?auto_142609 ?auto_142607 ) ( POWER_AVAIL ?auto_142610 ) ( POINTING ?auto_142610 ?auto_142608 ) ( not ( = ?auto_142607 ?auto_142608 ) ) ( not ( = ?auto_142604 ?auto_142608 ) ) ( not ( = ?auto_142602 ?auto_142608 ) ) ( HAVE_IMAGE ?auto_142605 ?auto_142606 ) ( not ( = ?auto_142602 ?auto_142605 ) ) ( not ( = ?auto_142603 ?auto_142606 ) ) ( not ( = ?auto_142604 ?auto_142605 ) ) ( not ( = ?auto_142601 ?auto_142606 ) ) ( not ( = ?auto_142605 ?auto_142607 ) ) ( not ( = ?auto_142605 ?auto_142608 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142602 ?auto_142603 ?auto_142604 ?auto_142601 )
      ( GET-3IMAGE-VERIFY ?auto_142602 ?auto_142603 ?auto_142604 ?auto_142601 ?auto_142605 ?auto_142606 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142643 - DIRECTION
      ?auto_142644 - MODE
      ?auto_142645 - DIRECTION
      ?auto_142642 - MODE
      ?auto_142646 - DIRECTION
      ?auto_142647 - MODE
    )
    :vars
    (
      ?auto_142652 - INSTRUMENT
      ?auto_142653 - SATELLITE
      ?auto_142648 - DIRECTION
      ?auto_142649 - DIRECTION
      ?auto_142650 - MODE
      ?auto_142651 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142652 ?auto_142653 ) ( SUPPORTS ?auto_142652 ?auto_142647 ) ( not ( = ?auto_142646 ?auto_142648 ) ) ( HAVE_IMAGE ?auto_142649 ?auto_142650 ) ( not ( = ?auto_142649 ?auto_142646 ) ) ( not ( = ?auto_142649 ?auto_142648 ) ) ( not ( = ?auto_142650 ?auto_142647 ) ) ( CALIBRATION_TARGET ?auto_142652 ?auto_142648 ) ( POWER_AVAIL ?auto_142653 ) ( POINTING ?auto_142653 ?auto_142651 ) ( not ( = ?auto_142648 ?auto_142651 ) ) ( not ( = ?auto_142646 ?auto_142651 ) ) ( not ( = ?auto_142649 ?auto_142651 ) ) ( HAVE_IMAGE ?auto_142643 ?auto_142644 ) ( HAVE_IMAGE ?auto_142645 ?auto_142642 ) ( not ( = ?auto_142643 ?auto_142645 ) ) ( not ( = ?auto_142643 ?auto_142646 ) ) ( not ( = ?auto_142643 ?auto_142648 ) ) ( not ( = ?auto_142643 ?auto_142649 ) ) ( not ( = ?auto_142643 ?auto_142651 ) ) ( not ( = ?auto_142644 ?auto_142642 ) ) ( not ( = ?auto_142644 ?auto_142647 ) ) ( not ( = ?auto_142644 ?auto_142650 ) ) ( not ( = ?auto_142645 ?auto_142646 ) ) ( not ( = ?auto_142645 ?auto_142648 ) ) ( not ( = ?auto_142645 ?auto_142649 ) ) ( not ( = ?auto_142645 ?auto_142651 ) ) ( not ( = ?auto_142642 ?auto_142647 ) ) ( not ( = ?auto_142642 ?auto_142650 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142649 ?auto_142650 ?auto_142646 ?auto_142647 )
      ( GET-3IMAGE-VERIFY ?auto_142643 ?auto_142644 ?auto_142645 ?auto_142642 ?auto_142646 ?auto_142647 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142667 - DIRECTION
      ?auto_142668 - MODE
      ?auto_142669 - DIRECTION
      ?auto_142666 - MODE
      ?auto_142670 - DIRECTION
      ?auto_142671 - MODE
    )
    :vars
    (
      ?auto_142676 - INSTRUMENT
      ?auto_142677 - SATELLITE
      ?auto_142672 - DIRECTION
      ?auto_142673 - DIRECTION
      ?auto_142674 - MODE
      ?auto_142675 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142676 ?auto_142677 ) ( SUPPORTS ?auto_142676 ?auto_142666 ) ( not ( = ?auto_142669 ?auto_142672 ) ) ( HAVE_IMAGE ?auto_142673 ?auto_142674 ) ( not ( = ?auto_142673 ?auto_142669 ) ) ( not ( = ?auto_142673 ?auto_142672 ) ) ( not ( = ?auto_142674 ?auto_142666 ) ) ( CALIBRATION_TARGET ?auto_142676 ?auto_142672 ) ( POWER_AVAIL ?auto_142677 ) ( POINTING ?auto_142677 ?auto_142675 ) ( not ( = ?auto_142672 ?auto_142675 ) ) ( not ( = ?auto_142669 ?auto_142675 ) ) ( not ( = ?auto_142673 ?auto_142675 ) ) ( HAVE_IMAGE ?auto_142667 ?auto_142668 ) ( HAVE_IMAGE ?auto_142670 ?auto_142671 ) ( not ( = ?auto_142667 ?auto_142669 ) ) ( not ( = ?auto_142667 ?auto_142670 ) ) ( not ( = ?auto_142667 ?auto_142672 ) ) ( not ( = ?auto_142667 ?auto_142673 ) ) ( not ( = ?auto_142667 ?auto_142675 ) ) ( not ( = ?auto_142668 ?auto_142666 ) ) ( not ( = ?auto_142668 ?auto_142671 ) ) ( not ( = ?auto_142668 ?auto_142674 ) ) ( not ( = ?auto_142669 ?auto_142670 ) ) ( not ( = ?auto_142666 ?auto_142671 ) ) ( not ( = ?auto_142670 ?auto_142672 ) ) ( not ( = ?auto_142670 ?auto_142673 ) ) ( not ( = ?auto_142670 ?auto_142675 ) ) ( not ( = ?auto_142671 ?auto_142674 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142673 ?auto_142674 ?auto_142669 ?auto_142666 )
      ( GET-3IMAGE-VERIFY ?auto_142667 ?auto_142668 ?auto_142669 ?auto_142666 ?auto_142670 ?auto_142671 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142712 - DIRECTION
      ?auto_142713 - MODE
      ?auto_142714 - DIRECTION
      ?auto_142711 - MODE
      ?auto_142715 - DIRECTION
      ?auto_142716 - MODE
    )
    :vars
    (
      ?auto_142720 - INSTRUMENT
      ?auto_142721 - SATELLITE
      ?auto_142717 - DIRECTION
      ?auto_142718 - DIRECTION
      ?auto_142719 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_142720 ?auto_142721 ) ( SUPPORTS ?auto_142720 ?auto_142716 ) ( not ( = ?auto_142715 ?auto_142717 ) ) ( HAVE_IMAGE ?auto_142718 ?auto_142719 ) ( not ( = ?auto_142718 ?auto_142715 ) ) ( not ( = ?auto_142718 ?auto_142717 ) ) ( not ( = ?auto_142719 ?auto_142716 ) ) ( CALIBRATION_TARGET ?auto_142720 ?auto_142717 ) ( POWER_AVAIL ?auto_142721 ) ( POINTING ?auto_142721 ?auto_142714 ) ( not ( = ?auto_142717 ?auto_142714 ) ) ( not ( = ?auto_142715 ?auto_142714 ) ) ( not ( = ?auto_142718 ?auto_142714 ) ) ( HAVE_IMAGE ?auto_142712 ?auto_142713 ) ( HAVE_IMAGE ?auto_142714 ?auto_142711 ) ( not ( = ?auto_142712 ?auto_142714 ) ) ( not ( = ?auto_142712 ?auto_142715 ) ) ( not ( = ?auto_142712 ?auto_142717 ) ) ( not ( = ?auto_142712 ?auto_142718 ) ) ( not ( = ?auto_142713 ?auto_142711 ) ) ( not ( = ?auto_142713 ?auto_142716 ) ) ( not ( = ?auto_142713 ?auto_142719 ) ) ( not ( = ?auto_142711 ?auto_142716 ) ) ( not ( = ?auto_142711 ?auto_142719 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142718 ?auto_142719 ?auto_142715 ?auto_142716 )
      ( GET-3IMAGE-VERIFY ?auto_142712 ?auto_142713 ?auto_142714 ?auto_142711 ?auto_142715 ?auto_142716 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142738 - DIRECTION
      ?auto_142739 - MODE
      ?auto_142740 - DIRECTION
      ?auto_142737 - MODE
      ?auto_142741 - DIRECTION
      ?auto_142742 - MODE
    )
    :vars
    (
      ?auto_142746 - INSTRUMENT
      ?auto_142747 - SATELLITE
      ?auto_142743 - DIRECTION
      ?auto_142744 - DIRECTION
      ?auto_142745 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_142746 ?auto_142747 ) ( SUPPORTS ?auto_142746 ?auto_142737 ) ( not ( = ?auto_142740 ?auto_142743 ) ) ( HAVE_IMAGE ?auto_142744 ?auto_142745 ) ( not ( = ?auto_142744 ?auto_142740 ) ) ( not ( = ?auto_142744 ?auto_142743 ) ) ( not ( = ?auto_142745 ?auto_142737 ) ) ( CALIBRATION_TARGET ?auto_142746 ?auto_142743 ) ( POWER_AVAIL ?auto_142747 ) ( POINTING ?auto_142747 ?auto_142741 ) ( not ( = ?auto_142743 ?auto_142741 ) ) ( not ( = ?auto_142740 ?auto_142741 ) ) ( not ( = ?auto_142744 ?auto_142741 ) ) ( HAVE_IMAGE ?auto_142738 ?auto_142739 ) ( HAVE_IMAGE ?auto_142741 ?auto_142742 ) ( not ( = ?auto_142738 ?auto_142740 ) ) ( not ( = ?auto_142738 ?auto_142741 ) ) ( not ( = ?auto_142738 ?auto_142743 ) ) ( not ( = ?auto_142738 ?auto_142744 ) ) ( not ( = ?auto_142739 ?auto_142737 ) ) ( not ( = ?auto_142739 ?auto_142742 ) ) ( not ( = ?auto_142739 ?auto_142745 ) ) ( not ( = ?auto_142737 ?auto_142742 ) ) ( not ( = ?auto_142742 ?auto_142745 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142744 ?auto_142745 ?auto_142740 ?auto_142737 )
      ( GET-3IMAGE-VERIFY ?auto_142738 ?auto_142739 ?auto_142740 ?auto_142737 ?auto_142741 ?auto_142742 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142760 - DIRECTION
      ?auto_142761 - MODE
      ?auto_142762 - DIRECTION
      ?auto_142759 - MODE
      ?auto_142763 - DIRECTION
      ?auto_142764 - MODE
    )
    :vars
    (
      ?auto_142767 - INSTRUMENT
      ?auto_142768 - SATELLITE
      ?auto_142765 - DIRECTION
      ?auto_142766 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142767 ?auto_142768 ) ( SUPPORTS ?auto_142767 ?auto_142761 ) ( not ( = ?auto_142760 ?auto_142765 ) ) ( HAVE_IMAGE ?auto_142763 ?auto_142759 ) ( not ( = ?auto_142763 ?auto_142760 ) ) ( not ( = ?auto_142763 ?auto_142765 ) ) ( not ( = ?auto_142759 ?auto_142761 ) ) ( CALIBRATION_TARGET ?auto_142767 ?auto_142765 ) ( POWER_AVAIL ?auto_142768 ) ( POINTING ?auto_142768 ?auto_142766 ) ( not ( = ?auto_142765 ?auto_142766 ) ) ( not ( = ?auto_142760 ?auto_142766 ) ) ( not ( = ?auto_142763 ?auto_142766 ) ) ( HAVE_IMAGE ?auto_142762 ?auto_142759 ) ( HAVE_IMAGE ?auto_142763 ?auto_142764 ) ( not ( = ?auto_142760 ?auto_142762 ) ) ( not ( = ?auto_142761 ?auto_142764 ) ) ( not ( = ?auto_142762 ?auto_142763 ) ) ( not ( = ?auto_142762 ?auto_142765 ) ) ( not ( = ?auto_142762 ?auto_142766 ) ) ( not ( = ?auto_142759 ?auto_142764 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142763 ?auto_142759 ?auto_142760 ?auto_142761 )
      ( GET-3IMAGE-VERIFY ?auto_142760 ?auto_142761 ?auto_142762 ?auto_142759 ?auto_142763 ?auto_142764 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142770 - DIRECTION
      ?auto_142771 - MODE
      ?auto_142772 - DIRECTION
      ?auto_142769 - MODE
      ?auto_142773 - DIRECTION
      ?auto_142774 - MODE
    )
    :vars
    (
      ?auto_142777 - INSTRUMENT
      ?auto_142778 - SATELLITE
      ?auto_142775 - DIRECTION
      ?auto_142776 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142777 ?auto_142778 ) ( SUPPORTS ?auto_142777 ?auto_142771 ) ( not ( = ?auto_142770 ?auto_142775 ) ) ( HAVE_IMAGE ?auto_142772 ?auto_142769 ) ( not ( = ?auto_142772 ?auto_142770 ) ) ( not ( = ?auto_142772 ?auto_142775 ) ) ( not ( = ?auto_142769 ?auto_142771 ) ) ( CALIBRATION_TARGET ?auto_142777 ?auto_142775 ) ( POWER_AVAIL ?auto_142778 ) ( POINTING ?auto_142778 ?auto_142776 ) ( not ( = ?auto_142775 ?auto_142776 ) ) ( not ( = ?auto_142770 ?auto_142776 ) ) ( not ( = ?auto_142772 ?auto_142776 ) ) ( HAVE_IMAGE ?auto_142773 ?auto_142774 ) ( not ( = ?auto_142770 ?auto_142773 ) ) ( not ( = ?auto_142771 ?auto_142774 ) ) ( not ( = ?auto_142772 ?auto_142773 ) ) ( not ( = ?auto_142769 ?auto_142774 ) ) ( not ( = ?auto_142773 ?auto_142775 ) ) ( not ( = ?auto_142773 ?auto_142776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142772 ?auto_142769 ?auto_142770 ?auto_142771 )
      ( GET-3IMAGE-VERIFY ?auto_142770 ?auto_142771 ?auto_142772 ?auto_142769 ?auto_142773 ?auto_142774 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142805 - DIRECTION
      ?auto_142806 - MODE
      ?auto_142807 - DIRECTION
      ?auto_142804 - MODE
      ?auto_142808 - DIRECTION
      ?auto_142809 - MODE
    )
    :vars
    (
      ?auto_142814 - INSTRUMENT
      ?auto_142815 - SATELLITE
      ?auto_142810 - DIRECTION
      ?auto_142811 - DIRECTION
      ?auto_142812 - MODE
      ?auto_142813 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142814 ?auto_142815 ) ( SUPPORTS ?auto_142814 ?auto_142806 ) ( not ( = ?auto_142805 ?auto_142810 ) ) ( HAVE_IMAGE ?auto_142811 ?auto_142812 ) ( not ( = ?auto_142811 ?auto_142805 ) ) ( not ( = ?auto_142811 ?auto_142810 ) ) ( not ( = ?auto_142812 ?auto_142806 ) ) ( CALIBRATION_TARGET ?auto_142814 ?auto_142810 ) ( POWER_AVAIL ?auto_142815 ) ( POINTING ?auto_142815 ?auto_142813 ) ( not ( = ?auto_142810 ?auto_142813 ) ) ( not ( = ?auto_142805 ?auto_142813 ) ) ( not ( = ?auto_142811 ?auto_142813 ) ) ( HAVE_IMAGE ?auto_142807 ?auto_142804 ) ( HAVE_IMAGE ?auto_142808 ?auto_142809 ) ( not ( = ?auto_142805 ?auto_142807 ) ) ( not ( = ?auto_142805 ?auto_142808 ) ) ( not ( = ?auto_142806 ?auto_142804 ) ) ( not ( = ?auto_142806 ?auto_142809 ) ) ( not ( = ?auto_142807 ?auto_142808 ) ) ( not ( = ?auto_142807 ?auto_142810 ) ) ( not ( = ?auto_142807 ?auto_142811 ) ) ( not ( = ?auto_142807 ?auto_142813 ) ) ( not ( = ?auto_142804 ?auto_142809 ) ) ( not ( = ?auto_142804 ?auto_142812 ) ) ( not ( = ?auto_142808 ?auto_142810 ) ) ( not ( = ?auto_142808 ?auto_142811 ) ) ( not ( = ?auto_142808 ?auto_142813 ) ) ( not ( = ?auto_142809 ?auto_142812 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142811 ?auto_142812 ?auto_142805 ?auto_142806 )
      ( GET-3IMAGE-VERIFY ?auto_142805 ?auto_142806 ?auto_142807 ?auto_142804 ?auto_142808 ?auto_142809 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_142850 - DIRECTION
      ?auto_142851 - MODE
      ?auto_142852 - DIRECTION
      ?auto_142849 - MODE
      ?auto_142853 - DIRECTION
      ?auto_142854 - MODE
    )
    :vars
    (
      ?auto_142858 - INSTRUMENT
      ?auto_142859 - SATELLITE
      ?auto_142855 - DIRECTION
      ?auto_142856 - DIRECTION
      ?auto_142857 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_142858 ?auto_142859 ) ( SUPPORTS ?auto_142858 ?auto_142851 ) ( not ( = ?auto_142850 ?auto_142855 ) ) ( HAVE_IMAGE ?auto_142856 ?auto_142857 ) ( not ( = ?auto_142856 ?auto_142850 ) ) ( not ( = ?auto_142856 ?auto_142855 ) ) ( not ( = ?auto_142857 ?auto_142851 ) ) ( CALIBRATION_TARGET ?auto_142858 ?auto_142855 ) ( POWER_AVAIL ?auto_142859 ) ( POINTING ?auto_142859 ?auto_142852 ) ( not ( = ?auto_142855 ?auto_142852 ) ) ( not ( = ?auto_142850 ?auto_142852 ) ) ( not ( = ?auto_142856 ?auto_142852 ) ) ( HAVE_IMAGE ?auto_142852 ?auto_142849 ) ( HAVE_IMAGE ?auto_142853 ?auto_142854 ) ( not ( = ?auto_142850 ?auto_142853 ) ) ( not ( = ?auto_142851 ?auto_142849 ) ) ( not ( = ?auto_142851 ?auto_142854 ) ) ( not ( = ?auto_142852 ?auto_142853 ) ) ( not ( = ?auto_142849 ?auto_142854 ) ) ( not ( = ?auto_142849 ?auto_142857 ) ) ( not ( = ?auto_142853 ?auto_142855 ) ) ( not ( = ?auto_142853 ?auto_142856 ) ) ( not ( = ?auto_142854 ?auto_142857 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142856 ?auto_142857 ?auto_142850 ?auto_142851 )
      ( GET-3IMAGE-VERIFY ?auto_142850 ?auto_142851 ?auto_142852 ?auto_142849 ?auto_142853 ?auto_142854 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_142917 - DIRECTION
      ?auto_142918 - MODE
      ?auto_142919 - DIRECTION
      ?auto_142916 - MODE
      ?auto_142920 - DIRECTION
      ?auto_142921 - MODE
      ?auto_142922 - DIRECTION
      ?auto_142923 - MODE
    )
    :vars
    (
      ?auto_142926 - INSTRUMENT
      ?auto_142927 - SATELLITE
      ?auto_142924 - DIRECTION
      ?auto_142925 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142926 ?auto_142927 ) ( SUPPORTS ?auto_142926 ?auto_142923 ) ( not ( = ?auto_142922 ?auto_142924 ) ) ( HAVE_IMAGE ?auto_142919 ?auto_142921 ) ( not ( = ?auto_142919 ?auto_142922 ) ) ( not ( = ?auto_142919 ?auto_142924 ) ) ( not ( = ?auto_142921 ?auto_142923 ) ) ( CALIBRATION_TARGET ?auto_142926 ?auto_142924 ) ( POWER_AVAIL ?auto_142927 ) ( POINTING ?auto_142927 ?auto_142925 ) ( not ( = ?auto_142924 ?auto_142925 ) ) ( not ( = ?auto_142922 ?auto_142925 ) ) ( not ( = ?auto_142919 ?auto_142925 ) ) ( HAVE_IMAGE ?auto_142917 ?auto_142918 ) ( HAVE_IMAGE ?auto_142919 ?auto_142916 ) ( HAVE_IMAGE ?auto_142920 ?auto_142921 ) ( not ( = ?auto_142917 ?auto_142919 ) ) ( not ( = ?auto_142917 ?auto_142920 ) ) ( not ( = ?auto_142917 ?auto_142922 ) ) ( not ( = ?auto_142917 ?auto_142924 ) ) ( not ( = ?auto_142917 ?auto_142925 ) ) ( not ( = ?auto_142918 ?auto_142916 ) ) ( not ( = ?auto_142918 ?auto_142921 ) ) ( not ( = ?auto_142918 ?auto_142923 ) ) ( not ( = ?auto_142919 ?auto_142920 ) ) ( not ( = ?auto_142916 ?auto_142921 ) ) ( not ( = ?auto_142916 ?auto_142923 ) ) ( not ( = ?auto_142920 ?auto_142922 ) ) ( not ( = ?auto_142920 ?auto_142924 ) ) ( not ( = ?auto_142920 ?auto_142925 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142919 ?auto_142921 ?auto_142922 ?auto_142923 )
      ( GET-4IMAGE-VERIFY ?auto_142917 ?auto_142918 ?auto_142919 ?auto_142916 ?auto_142920 ?auto_142921 ?auto_142922 ?auto_142923 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_142929 - DIRECTION
      ?auto_142930 - MODE
      ?auto_142931 - DIRECTION
      ?auto_142928 - MODE
      ?auto_142932 - DIRECTION
      ?auto_142933 - MODE
      ?auto_142934 - DIRECTION
      ?auto_142935 - MODE
    )
    :vars
    (
      ?auto_142938 - INSTRUMENT
      ?auto_142939 - SATELLITE
      ?auto_142936 - DIRECTION
      ?auto_142937 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142938 ?auto_142939 ) ( SUPPORTS ?auto_142938 ?auto_142935 ) ( not ( = ?auto_142934 ?auto_142936 ) ) ( HAVE_IMAGE ?auto_142929 ?auto_142930 ) ( not ( = ?auto_142929 ?auto_142934 ) ) ( not ( = ?auto_142929 ?auto_142936 ) ) ( not ( = ?auto_142930 ?auto_142935 ) ) ( CALIBRATION_TARGET ?auto_142938 ?auto_142936 ) ( POWER_AVAIL ?auto_142939 ) ( POINTING ?auto_142939 ?auto_142937 ) ( not ( = ?auto_142936 ?auto_142937 ) ) ( not ( = ?auto_142934 ?auto_142937 ) ) ( not ( = ?auto_142929 ?auto_142937 ) ) ( HAVE_IMAGE ?auto_142931 ?auto_142928 ) ( HAVE_IMAGE ?auto_142932 ?auto_142933 ) ( not ( = ?auto_142929 ?auto_142931 ) ) ( not ( = ?auto_142929 ?auto_142932 ) ) ( not ( = ?auto_142930 ?auto_142928 ) ) ( not ( = ?auto_142930 ?auto_142933 ) ) ( not ( = ?auto_142931 ?auto_142932 ) ) ( not ( = ?auto_142931 ?auto_142934 ) ) ( not ( = ?auto_142931 ?auto_142936 ) ) ( not ( = ?auto_142931 ?auto_142937 ) ) ( not ( = ?auto_142928 ?auto_142933 ) ) ( not ( = ?auto_142928 ?auto_142935 ) ) ( not ( = ?auto_142932 ?auto_142934 ) ) ( not ( = ?auto_142932 ?auto_142936 ) ) ( not ( = ?auto_142932 ?auto_142937 ) ) ( not ( = ?auto_142933 ?auto_142935 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142929 ?auto_142930 ?auto_142934 ?auto_142935 )
      ( GET-4IMAGE-VERIFY ?auto_142929 ?auto_142930 ?auto_142931 ?auto_142928 ?auto_142932 ?auto_142933 ?auto_142934 ?auto_142935 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_142952 - DIRECTION
      ?auto_142953 - MODE
      ?auto_142954 - DIRECTION
      ?auto_142951 - MODE
      ?auto_142955 - DIRECTION
      ?auto_142956 - MODE
      ?auto_142957 - DIRECTION
      ?auto_142958 - MODE
    )
    :vars
    (
      ?auto_142961 - INSTRUMENT
      ?auto_142962 - SATELLITE
      ?auto_142959 - DIRECTION
      ?auto_142960 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142961 ?auto_142962 ) ( SUPPORTS ?auto_142961 ?auto_142956 ) ( not ( = ?auto_142955 ?auto_142959 ) ) ( HAVE_IMAGE ?auto_142952 ?auto_142958 ) ( not ( = ?auto_142952 ?auto_142955 ) ) ( not ( = ?auto_142952 ?auto_142959 ) ) ( not ( = ?auto_142958 ?auto_142956 ) ) ( CALIBRATION_TARGET ?auto_142961 ?auto_142959 ) ( POWER_AVAIL ?auto_142962 ) ( POINTING ?auto_142962 ?auto_142960 ) ( not ( = ?auto_142959 ?auto_142960 ) ) ( not ( = ?auto_142955 ?auto_142960 ) ) ( not ( = ?auto_142952 ?auto_142960 ) ) ( HAVE_IMAGE ?auto_142952 ?auto_142953 ) ( HAVE_IMAGE ?auto_142954 ?auto_142951 ) ( HAVE_IMAGE ?auto_142957 ?auto_142958 ) ( not ( = ?auto_142952 ?auto_142954 ) ) ( not ( = ?auto_142952 ?auto_142957 ) ) ( not ( = ?auto_142953 ?auto_142951 ) ) ( not ( = ?auto_142953 ?auto_142956 ) ) ( not ( = ?auto_142953 ?auto_142958 ) ) ( not ( = ?auto_142954 ?auto_142955 ) ) ( not ( = ?auto_142954 ?auto_142957 ) ) ( not ( = ?auto_142954 ?auto_142959 ) ) ( not ( = ?auto_142954 ?auto_142960 ) ) ( not ( = ?auto_142951 ?auto_142956 ) ) ( not ( = ?auto_142951 ?auto_142958 ) ) ( not ( = ?auto_142955 ?auto_142957 ) ) ( not ( = ?auto_142957 ?auto_142959 ) ) ( not ( = ?auto_142957 ?auto_142960 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142952 ?auto_142958 ?auto_142955 ?auto_142956 )
      ( GET-4IMAGE-VERIFY ?auto_142952 ?auto_142953 ?auto_142954 ?auto_142951 ?auto_142955 ?auto_142956 ?auto_142957 ?auto_142958 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_142964 - DIRECTION
      ?auto_142965 - MODE
      ?auto_142966 - DIRECTION
      ?auto_142963 - MODE
      ?auto_142967 - DIRECTION
      ?auto_142968 - MODE
      ?auto_142969 - DIRECTION
      ?auto_142970 - MODE
    )
    :vars
    (
      ?auto_142973 - INSTRUMENT
      ?auto_142974 - SATELLITE
      ?auto_142971 - DIRECTION
      ?auto_142972 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_142973 ?auto_142974 ) ( SUPPORTS ?auto_142973 ?auto_142968 ) ( not ( = ?auto_142967 ?auto_142971 ) ) ( HAVE_IMAGE ?auto_142966 ?auto_142965 ) ( not ( = ?auto_142966 ?auto_142967 ) ) ( not ( = ?auto_142966 ?auto_142971 ) ) ( not ( = ?auto_142965 ?auto_142968 ) ) ( CALIBRATION_TARGET ?auto_142973 ?auto_142971 ) ( POWER_AVAIL ?auto_142974 ) ( POINTING ?auto_142974 ?auto_142972 ) ( not ( = ?auto_142971 ?auto_142972 ) ) ( not ( = ?auto_142967 ?auto_142972 ) ) ( not ( = ?auto_142966 ?auto_142972 ) ) ( HAVE_IMAGE ?auto_142964 ?auto_142965 ) ( HAVE_IMAGE ?auto_142966 ?auto_142963 ) ( HAVE_IMAGE ?auto_142969 ?auto_142970 ) ( not ( = ?auto_142964 ?auto_142966 ) ) ( not ( = ?auto_142964 ?auto_142967 ) ) ( not ( = ?auto_142964 ?auto_142969 ) ) ( not ( = ?auto_142964 ?auto_142971 ) ) ( not ( = ?auto_142964 ?auto_142972 ) ) ( not ( = ?auto_142965 ?auto_142963 ) ) ( not ( = ?auto_142965 ?auto_142970 ) ) ( not ( = ?auto_142966 ?auto_142969 ) ) ( not ( = ?auto_142963 ?auto_142968 ) ) ( not ( = ?auto_142963 ?auto_142970 ) ) ( not ( = ?auto_142967 ?auto_142969 ) ) ( not ( = ?auto_142968 ?auto_142970 ) ) ( not ( = ?auto_142969 ?auto_142971 ) ) ( not ( = ?auto_142969 ?auto_142972 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_142966 ?auto_142965 ?auto_142967 ?auto_142968 )
      ( GET-4IMAGE-VERIFY ?auto_142964 ?auto_142965 ?auto_142966 ?auto_142963 ?auto_142967 ?auto_142968 ?auto_142969 ?auto_142970 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143031 - DIRECTION
      ?auto_143032 - MODE
      ?auto_143033 - DIRECTION
      ?auto_143030 - MODE
      ?auto_143034 - DIRECTION
      ?auto_143035 - MODE
      ?auto_143036 - DIRECTION
      ?auto_143037 - MODE
    )
    :vars
    (
      ?auto_143040 - INSTRUMENT
      ?auto_143041 - SATELLITE
      ?auto_143038 - DIRECTION
      ?auto_143039 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143040 ?auto_143041 ) ( SUPPORTS ?auto_143040 ?auto_143035 ) ( not ( = ?auto_143034 ?auto_143038 ) ) ( HAVE_IMAGE ?auto_143031 ?auto_143032 ) ( not ( = ?auto_143031 ?auto_143034 ) ) ( not ( = ?auto_143031 ?auto_143038 ) ) ( not ( = ?auto_143032 ?auto_143035 ) ) ( CALIBRATION_TARGET ?auto_143040 ?auto_143038 ) ( POWER_AVAIL ?auto_143041 ) ( POINTING ?auto_143041 ?auto_143039 ) ( not ( = ?auto_143038 ?auto_143039 ) ) ( not ( = ?auto_143034 ?auto_143039 ) ) ( not ( = ?auto_143031 ?auto_143039 ) ) ( HAVE_IMAGE ?auto_143033 ?auto_143030 ) ( HAVE_IMAGE ?auto_143036 ?auto_143037 ) ( not ( = ?auto_143031 ?auto_143033 ) ) ( not ( = ?auto_143031 ?auto_143036 ) ) ( not ( = ?auto_143032 ?auto_143030 ) ) ( not ( = ?auto_143032 ?auto_143037 ) ) ( not ( = ?auto_143033 ?auto_143034 ) ) ( not ( = ?auto_143033 ?auto_143036 ) ) ( not ( = ?auto_143033 ?auto_143038 ) ) ( not ( = ?auto_143033 ?auto_143039 ) ) ( not ( = ?auto_143030 ?auto_143035 ) ) ( not ( = ?auto_143030 ?auto_143037 ) ) ( not ( = ?auto_143034 ?auto_143036 ) ) ( not ( = ?auto_143035 ?auto_143037 ) ) ( not ( = ?auto_143036 ?auto_143038 ) ) ( not ( = ?auto_143036 ?auto_143039 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143031 ?auto_143032 ?auto_143034 ?auto_143035 )
      ( GET-4IMAGE-VERIFY ?auto_143031 ?auto_143032 ?auto_143033 ?auto_143030 ?auto_143034 ?auto_143035 ?auto_143036 ?auto_143037 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143055 - DIRECTION
      ?auto_143056 - MODE
      ?auto_143057 - DIRECTION
      ?auto_143054 - MODE
      ?auto_143058 - DIRECTION
      ?auto_143059 - MODE
      ?auto_143060 - DIRECTION
      ?auto_143061 - MODE
    )
    :vars
    (
      ?auto_143063 - INSTRUMENT
      ?auto_143064 - SATELLITE
      ?auto_143062 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143063 ?auto_143064 ) ( SUPPORTS ?auto_143063 ?auto_143059 ) ( not ( = ?auto_143058 ?auto_143062 ) ) ( HAVE_IMAGE ?auto_143055 ?auto_143056 ) ( not ( = ?auto_143055 ?auto_143058 ) ) ( not ( = ?auto_143055 ?auto_143062 ) ) ( not ( = ?auto_143056 ?auto_143059 ) ) ( CALIBRATION_TARGET ?auto_143063 ?auto_143062 ) ( POWER_AVAIL ?auto_143064 ) ( POINTING ?auto_143064 ?auto_143060 ) ( not ( = ?auto_143062 ?auto_143060 ) ) ( not ( = ?auto_143058 ?auto_143060 ) ) ( not ( = ?auto_143055 ?auto_143060 ) ) ( HAVE_IMAGE ?auto_143057 ?auto_143054 ) ( HAVE_IMAGE ?auto_143060 ?auto_143061 ) ( not ( = ?auto_143055 ?auto_143057 ) ) ( not ( = ?auto_143056 ?auto_143054 ) ) ( not ( = ?auto_143056 ?auto_143061 ) ) ( not ( = ?auto_143057 ?auto_143058 ) ) ( not ( = ?auto_143057 ?auto_143060 ) ) ( not ( = ?auto_143057 ?auto_143062 ) ) ( not ( = ?auto_143054 ?auto_143059 ) ) ( not ( = ?auto_143054 ?auto_143061 ) ) ( not ( = ?auto_143059 ?auto_143061 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143055 ?auto_143056 ?auto_143058 ?auto_143059 )
      ( GET-4IMAGE-VERIFY ?auto_143055 ?auto_143056 ?auto_143057 ?auto_143054 ?auto_143058 ?auto_143059 ?auto_143060 ?auto_143061 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143078 - DIRECTION
      ?auto_143079 - MODE
      ?auto_143080 - DIRECTION
      ?auto_143077 - MODE
      ?auto_143081 - DIRECTION
      ?auto_143082 - MODE
      ?auto_143083 - DIRECTION
      ?auto_143084 - MODE
    )
    :vars
    (
      ?auto_143086 - INSTRUMENT
      ?auto_143087 - SATELLITE
      ?auto_143085 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143086 ?auto_143087 ) ( SUPPORTS ?auto_143086 ?auto_143084 ) ( not ( = ?auto_143083 ?auto_143085 ) ) ( HAVE_IMAGE ?auto_143078 ?auto_143082 ) ( not ( = ?auto_143078 ?auto_143083 ) ) ( not ( = ?auto_143078 ?auto_143085 ) ) ( not ( = ?auto_143082 ?auto_143084 ) ) ( CALIBRATION_TARGET ?auto_143086 ?auto_143085 ) ( POWER_AVAIL ?auto_143087 ) ( POINTING ?auto_143087 ?auto_143080 ) ( not ( = ?auto_143085 ?auto_143080 ) ) ( not ( = ?auto_143083 ?auto_143080 ) ) ( not ( = ?auto_143078 ?auto_143080 ) ) ( HAVE_IMAGE ?auto_143078 ?auto_143079 ) ( HAVE_IMAGE ?auto_143080 ?auto_143077 ) ( HAVE_IMAGE ?auto_143081 ?auto_143082 ) ( not ( = ?auto_143078 ?auto_143081 ) ) ( not ( = ?auto_143079 ?auto_143077 ) ) ( not ( = ?auto_143079 ?auto_143082 ) ) ( not ( = ?auto_143079 ?auto_143084 ) ) ( not ( = ?auto_143080 ?auto_143081 ) ) ( not ( = ?auto_143077 ?auto_143082 ) ) ( not ( = ?auto_143077 ?auto_143084 ) ) ( not ( = ?auto_143081 ?auto_143083 ) ) ( not ( = ?auto_143081 ?auto_143085 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143078 ?auto_143082 ?auto_143083 ?auto_143084 )
      ( GET-4IMAGE-VERIFY ?auto_143078 ?auto_143079 ?auto_143080 ?auto_143077 ?auto_143081 ?auto_143082 ?auto_143083 ?auto_143084 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143089 - DIRECTION
      ?auto_143090 - MODE
      ?auto_143091 - DIRECTION
      ?auto_143088 - MODE
      ?auto_143092 - DIRECTION
      ?auto_143093 - MODE
      ?auto_143094 - DIRECTION
      ?auto_143095 - MODE
    )
    :vars
    (
      ?auto_143097 - INSTRUMENT
      ?auto_143098 - SATELLITE
      ?auto_143096 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143097 ?auto_143098 ) ( SUPPORTS ?auto_143097 ?auto_143095 ) ( not ( = ?auto_143094 ?auto_143096 ) ) ( HAVE_IMAGE ?auto_143089 ?auto_143090 ) ( not ( = ?auto_143089 ?auto_143094 ) ) ( not ( = ?auto_143089 ?auto_143096 ) ) ( not ( = ?auto_143090 ?auto_143095 ) ) ( CALIBRATION_TARGET ?auto_143097 ?auto_143096 ) ( POWER_AVAIL ?auto_143098 ) ( POINTING ?auto_143098 ?auto_143091 ) ( not ( = ?auto_143096 ?auto_143091 ) ) ( not ( = ?auto_143094 ?auto_143091 ) ) ( not ( = ?auto_143089 ?auto_143091 ) ) ( HAVE_IMAGE ?auto_143091 ?auto_143088 ) ( HAVE_IMAGE ?auto_143092 ?auto_143093 ) ( not ( = ?auto_143089 ?auto_143092 ) ) ( not ( = ?auto_143090 ?auto_143088 ) ) ( not ( = ?auto_143090 ?auto_143093 ) ) ( not ( = ?auto_143091 ?auto_143092 ) ) ( not ( = ?auto_143088 ?auto_143093 ) ) ( not ( = ?auto_143088 ?auto_143095 ) ) ( not ( = ?auto_143092 ?auto_143094 ) ) ( not ( = ?auto_143092 ?auto_143096 ) ) ( not ( = ?auto_143093 ?auto_143095 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143089 ?auto_143090 ?auto_143094 ?auto_143095 )
      ( GET-4IMAGE-VERIFY ?auto_143089 ?auto_143090 ?auto_143091 ?auto_143088 ?auto_143092 ?auto_143093 ?auto_143094 ?auto_143095 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143155 - DIRECTION
      ?auto_143156 - MODE
      ?auto_143157 - DIRECTION
      ?auto_143154 - MODE
      ?auto_143158 - DIRECTION
      ?auto_143159 - MODE
      ?auto_143160 - DIRECTION
      ?auto_143161 - MODE
    )
    :vars
    (
      ?auto_143164 - INSTRUMENT
      ?auto_143165 - SATELLITE
      ?auto_143162 - DIRECTION
      ?auto_143163 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143164 ?auto_143165 ) ( SUPPORTS ?auto_143164 ?auto_143154 ) ( not ( = ?auto_143157 ?auto_143162 ) ) ( HAVE_IMAGE ?auto_143160 ?auto_143161 ) ( not ( = ?auto_143160 ?auto_143157 ) ) ( not ( = ?auto_143160 ?auto_143162 ) ) ( not ( = ?auto_143161 ?auto_143154 ) ) ( CALIBRATION_TARGET ?auto_143164 ?auto_143162 ) ( POWER_AVAIL ?auto_143165 ) ( POINTING ?auto_143165 ?auto_143163 ) ( not ( = ?auto_143162 ?auto_143163 ) ) ( not ( = ?auto_143157 ?auto_143163 ) ) ( not ( = ?auto_143160 ?auto_143163 ) ) ( HAVE_IMAGE ?auto_143155 ?auto_143156 ) ( HAVE_IMAGE ?auto_143158 ?auto_143159 ) ( not ( = ?auto_143155 ?auto_143157 ) ) ( not ( = ?auto_143155 ?auto_143158 ) ) ( not ( = ?auto_143155 ?auto_143160 ) ) ( not ( = ?auto_143155 ?auto_143162 ) ) ( not ( = ?auto_143155 ?auto_143163 ) ) ( not ( = ?auto_143156 ?auto_143154 ) ) ( not ( = ?auto_143156 ?auto_143159 ) ) ( not ( = ?auto_143156 ?auto_143161 ) ) ( not ( = ?auto_143157 ?auto_143158 ) ) ( not ( = ?auto_143154 ?auto_143159 ) ) ( not ( = ?auto_143158 ?auto_143160 ) ) ( not ( = ?auto_143158 ?auto_143162 ) ) ( not ( = ?auto_143158 ?auto_143163 ) ) ( not ( = ?auto_143159 ?auto_143161 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143160 ?auto_143161 ?auto_143157 ?auto_143154 )
      ( GET-4IMAGE-VERIFY ?auto_143155 ?auto_143156 ?auto_143157 ?auto_143154 ?auto_143158 ?auto_143159 ?auto_143160 ?auto_143161 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143167 - DIRECTION
      ?auto_143168 - MODE
      ?auto_143169 - DIRECTION
      ?auto_143166 - MODE
      ?auto_143170 - DIRECTION
      ?auto_143171 - MODE
      ?auto_143172 - DIRECTION
      ?auto_143173 - MODE
    )
    :vars
    (
      ?auto_143176 - INSTRUMENT
      ?auto_143177 - SATELLITE
      ?auto_143174 - DIRECTION
      ?auto_143175 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143176 ?auto_143177 ) ( SUPPORTS ?auto_143176 ?auto_143166 ) ( not ( = ?auto_143169 ?auto_143174 ) ) ( HAVE_IMAGE ?auto_143167 ?auto_143168 ) ( not ( = ?auto_143167 ?auto_143169 ) ) ( not ( = ?auto_143167 ?auto_143174 ) ) ( not ( = ?auto_143168 ?auto_143166 ) ) ( CALIBRATION_TARGET ?auto_143176 ?auto_143174 ) ( POWER_AVAIL ?auto_143177 ) ( POINTING ?auto_143177 ?auto_143175 ) ( not ( = ?auto_143174 ?auto_143175 ) ) ( not ( = ?auto_143169 ?auto_143175 ) ) ( not ( = ?auto_143167 ?auto_143175 ) ) ( HAVE_IMAGE ?auto_143170 ?auto_143171 ) ( HAVE_IMAGE ?auto_143172 ?auto_143173 ) ( not ( = ?auto_143167 ?auto_143170 ) ) ( not ( = ?auto_143167 ?auto_143172 ) ) ( not ( = ?auto_143168 ?auto_143171 ) ) ( not ( = ?auto_143168 ?auto_143173 ) ) ( not ( = ?auto_143169 ?auto_143170 ) ) ( not ( = ?auto_143169 ?auto_143172 ) ) ( not ( = ?auto_143166 ?auto_143171 ) ) ( not ( = ?auto_143166 ?auto_143173 ) ) ( not ( = ?auto_143170 ?auto_143172 ) ) ( not ( = ?auto_143170 ?auto_143174 ) ) ( not ( = ?auto_143170 ?auto_143175 ) ) ( not ( = ?auto_143171 ?auto_143173 ) ) ( not ( = ?auto_143172 ?auto_143174 ) ) ( not ( = ?auto_143172 ?auto_143175 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143167 ?auto_143168 ?auto_143169 ?auto_143166 )
      ( GET-4IMAGE-VERIFY ?auto_143167 ?auto_143168 ?auto_143169 ?auto_143166 ?auto_143170 ?auto_143171 ?auto_143172 ?auto_143173 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143246 - DIRECTION
      ?auto_143247 - MODE
      ?auto_143248 - DIRECTION
      ?auto_143245 - MODE
      ?auto_143249 - DIRECTION
      ?auto_143250 - MODE
      ?auto_143251 - DIRECTION
      ?auto_143252 - MODE
    )
    :vars
    (
      ?auto_143254 - INSTRUMENT
      ?auto_143255 - SATELLITE
      ?auto_143253 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143254 ?auto_143255 ) ( SUPPORTS ?auto_143254 ?auto_143245 ) ( not ( = ?auto_143248 ?auto_143253 ) ) ( HAVE_IMAGE ?auto_143246 ?auto_143252 ) ( not ( = ?auto_143246 ?auto_143248 ) ) ( not ( = ?auto_143246 ?auto_143253 ) ) ( not ( = ?auto_143252 ?auto_143245 ) ) ( CALIBRATION_TARGET ?auto_143254 ?auto_143253 ) ( POWER_AVAIL ?auto_143255 ) ( POINTING ?auto_143255 ?auto_143249 ) ( not ( = ?auto_143253 ?auto_143249 ) ) ( not ( = ?auto_143248 ?auto_143249 ) ) ( not ( = ?auto_143246 ?auto_143249 ) ) ( HAVE_IMAGE ?auto_143246 ?auto_143247 ) ( HAVE_IMAGE ?auto_143249 ?auto_143250 ) ( HAVE_IMAGE ?auto_143251 ?auto_143252 ) ( not ( = ?auto_143246 ?auto_143251 ) ) ( not ( = ?auto_143247 ?auto_143245 ) ) ( not ( = ?auto_143247 ?auto_143250 ) ) ( not ( = ?auto_143247 ?auto_143252 ) ) ( not ( = ?auto_143248 ?auto_143251 ) ) ( not ( = ?auto_143245 ?auto_143250 ) ) ( not ( = ?auto_143249 ?auto_143251 ) ) ( not ( = ?auto_143250 ?auto_143252 ) ) ( not ( = ?auto_143251 ?auto_143253 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143246 ?auto_143252 ?auto_143248 ?auto_143245 )
      ( GET-4IMAGE-VERIFY ?auto_143246 ?auto_143247 ?auto_143248 ?auto_143245 ?auto_143249 ?auto_143250 ?auto_143251 ?auto_143252 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143268 - DIRECTION
      ?auto_143269 - MODE
      ?auto_143270 - DIRECTION
      ?auto_143267 - MODE
      ?auto_143271 - DIRECTION
      ?auto_143272 - MODE
      ?auto_143273 - DIRECTION
      ?auto_143274 - MODE
    )
    :vars
    (
      ?auto_143276 - INSTRUMENT
      ?auto_143277 - SATELLITE
      ?auto_143275 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143276 ?auto_143277 ) ( SUPPORTS ?auto_143276 ?auto_143267 ) ( not ( = ?auto_143270 ?auto_143275 ) ) ( HAVE_IMAGE ?auto_143268 ?auto_143269 ) ( not ( = ?auto_143268 ?auto_143270 ) ) ( not ( = ?auto_143268 ?auto_143275 ) ) ( not ( = ?auto_143269 ?auto_143267 ) ) ( CALIBRATION_TARGET ?auto_143276 ?auto_143275 ) ( POWER_AVAIL ?auto_143277 ) ( POINTING ?auto_143277 ?auto_143273 ) ( not ( = ?auto_143275 ?auto_143273 ) ) ( not ( = ?auto_143270 ?auto_143273 ) ) ( not ( = ?auto_143268 ?auto_143273 ) ) ( HAVE_IMAGE ?auto_143271 ?auto_143272 ) ( HAVE_IMAGE ?auto_143273 ?auto_143274 ) ( not ( = ?auto_143268 ?auto_143271 ) ) ( not ( = ?auto_143269 ?auto_143272 ) ) ( not ( = ?auto_143269 ?auto_143274 ) ) ( not ( = ?auto_143270 ?auto_143271 ) ) ( not ( = ?auto_143267 ?auto_143272 ) ) ( not ( = ?auto_143267 ?auto_143274 ) ) ( not ( = ?auto_143271 ?auto_143273 ) ) ( not ( = ?auto_143271 ?auto_143275 ) ) ( not ( = ?auto_143272 ?auto_143274 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143268 ?auto_143269 ?auto_143270 ?auto_143267 )
      ( GET-4IMAGE-VERIFY ?auto_143268 ?auto_143269 ?auto_143270 ?auto_143267 ?auto_143271 ?auto_143272 ?auto_143273 ?auto_143274 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143337 - DIRECTION
      ?auto_143338 - MODE
      ?auto_143339 - DIRECTION
      ?auto_143336 - MODE
      ?auto_143340 - DIRECTION
      ?auto_143341 - MODE
      ?auto_143342 - DIRECTION
      ?auto_143343 - MODE
    )
    :vars
    (
      ?auto_143346 - INSTRUMENT
      ?auto_143347 - SATELLITE
      ?auto_143344 - DIRECTION
      ?auto_143345 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143346 ?auto_143347 ) ( SUPPORTS ?auto_143346 ?auto_143343 ) ( not ( = ?auto_143342 ?auto_143344 ) ) ( HAVE_IMAGE ?auto_143340 ?auto_143341 ) ( not ( = ?auto_143340 ?auto_143342 ) ) ( not ( = ?auto_143340 ?auto_143344 ) ) ( not ( = ?auto_143341 ?auto_143343 ) ) ( CALIBRATION_TARGET ?auto_143346 ?auto_143344 ) ( POWER_AVAIL ?auto_143347 ) ( POINTING ?auto_143347 ?auto_143345 ) ( not ( = ?auto_143344 ?auto_143345 ) ) ( not ( = ?auto_143342 ?auto_143345 ) ) ( not ( = ?auto_143340 ?auto_143345 ) ) ( HAVE_IMAGE ?auto_143337 ?auto_143338 ) ( HAVE_IMAGE ?auto_143339 ?auto_143336 ) ( not ( = ?auto_143337 ?auto_143339 ) ) ( not ( = ?auto_143337 ?auto_143340 ) ) ( not ( = ?auto_143337 ?auto_143342 ) ) ( not ( = ?auto_143337 ?auto_143344 ) ) ( not ( = ?auto_143337 ?auto_143345 ) ) ( not ( = ?auto_143338 ?auto_143336 ) ) ( not ( = ?auto_143338 ?auto_143341 ) ) ( not ( = ?auto_143338 ?auto_143343 ) ) ( not ( = ?auto_143339 ?auto_143340 ) ) ( not ( = ?auto_143339 ?auto_143342 ) ) ( not ( = ?auto_143339 ?auto_143344 ) ) ( not ( = ?auto_143339 ?auto_143345 ) ) ( not ( = ?auto_143336 ?auto_143341 ) ) ( not ( = ?auto_143336 ?auto_143343 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143340 ?auto_143341 ?auto_143342 ?auto_143343 )
      ( GET-4IMAGE-VERIFY ?auto_143337 ?auto_143338 ?auto_143339 ?auto_143336 ?auto_143340 ?auto_143341 ?auto_143342 ?auto_143343 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143349 - DIRECTION
      ?auto_143350 - MODE
      ?auto_143351 - DIRECTION
      ?auto_143348 - MODE
      ?auto_143352 - DIRECTION
      ?auto_143353 - MODE
      ?auto_143354 - DIRECTION
      ?auto_143355 - MODE
    )
    :vars
    (
      ?auto_143358 - INSTRUMENT
      ?auto_143359 - SATELLITE
      ?auto_143356 - DIRECTION
      ?auto_143357 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143358 ?auto_143359 ) ( SUPPORTS ?auto_143358 ?auto_143355 ) ( not ( = ?auto_143354 ?auto_143356 ) ) ( HAVE_IMAGE ?auto_143351 ?auto_143348 ) ( not ( = ?auto_143351 ?auto_143354 ) ) ( not ( = ?auto_143351 ?auto_143356 ) ) ( not ( = ?auto_143348 ?auto_143355 ) ) ( CALIBRATION_TARGET ?auto_143358 ?auto_143356 ) ( POWER_AVAIL ?auto_143359 ) ( POINTING ?auto_143359 ?auto_143357 ) ( not ( = ?auto_143356 ?auto_143357 ) ) ( not ( = ?auto_143354 ?auto_143357 ) ) ( not ( = ?auto_143351 ?auto_143357 ) ) ( HAVE_IMAGE ?auto_143349 ?auto_143350 ) ( HAVE_IMAGE ?auto_143352 ?auto_143353 ) ( not ( = ?auto_143349 ?auto_143351 ) ) ( not ( = ?auto_143349 ?auto_143352 ) ) ( not ( = ?auto_143349 ?auto_143354 ) ) ( not ( = ?auto_143349 ?auto_143356 ) ) ( not ( = ?auto_143349 ?auto_143357 ) ) ( not ( = ?auto_143350 ?auto_143348 ) ) ( not ( = ?auto_143350 ?auto_143353 ) ) ( not ( = ?auto_143350 ?auto_143355 ) ) ( not ( = ?auto_143351 ?auto_143352 ) ) ( not ( = ?auto_143348 ?auto_143353 ) ) ( not ( = ?auto_143352 ?auto_143354 ) ) ( not ( = ?auto_143352 ?auto_143356 ) ) ( not ( = ?auto_143352 ?auto_143357 ) ) ( not ( = ?auto_143353 ?auto_143355 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143351 ?auto_143348 ?auto_143354 ?auto_143355 )
      ( GET-4IMAGE-VERIFY ?auto_143349 ?auto_143350 ?auto_143351 ?auto_143348 ?auto_143352 ?auto_143353 ?auto_143354 ?auto_143355 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143369 - DIRECTION
      ?auto_143370 - MODE
      ?auto_143371 - DIRECTION
      ?auto_143368 - MODE
      ?auto_143372 - DIRECTION
      ?auto_143373 - MODE
      ?auto_143374 - DIRECTION
      ?auto_143375 - MODE
    )
    :vars
    (
      ?auto_143378 - INSTRUMENT
      ?auto_143379 - SATELLITE
      ?auto_143376 - DIRECTION
      ?auto_143377 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143378 ?auto_143379 ) ( SUPPORTS ?auto_143378 ?auto_143373 ) ( not ( = ?auto_143372 ?auto_143376 ) ) ( HAVE_IMAGE ?auto_143374 ?auto_143375 ) ( not ( = ?auto_143374 ?auto_143372 ) ) ( not ( = ?auto_143374 ?auto_143376 ) ) ( not ( = ?auto_143375 ?auto_143373 ) ) ( CALIBRATION_TARGET ?auto_143378 ?auto_143376 ) ( POWER_AVAIL ?auto_143379 ) ( POINTING ?auto_143379 ?auto_143377 ) ( not ( = ?auto_143376 ?auto_143377 ) ) ( not ( = ?auto_143372 ?auto_143377 ) ) ( not ( = ?auto_143374 ?auto_143377 ) ) ( HAVE_IMAGE ?auto_143369 ?auto_143370 ) ( HAVE_IMAGE ?auto_143371 ?auto_143368 ) ( not ( = ?auto_143369 ?auto_143371 ) ) ( not ( = ?auto_143369 ?auto_143372 ) ) ( not ( = ?auto_143369 ?auto_143374 ) ) ( not ( = ?auto_143369 ?auto_143376 ) ) ( not ( = ?auto_143369 ?auto_143377 ) ) ( not ( = ?auto_143370 ?auto_143368 ) ) ( not ( = ?auto_143370 ?auto_143373 ) ) ( not ( = ?auto_143370 ?auto_143375 ) ) ( not ( = ?auto_143371 ?auto_143372 ) ) ( not ( = ?auto_143371 ?auto_143374 ) ) ( not ( = ?auto_143371 ?auto_143376 ) ) ( not ( = ?auto_143371 ?auto_143377 ) ) ( not ( = ?auto_143368 ?auto_143373 ) ) ( not ( = ?auto_143368 ?auto_143375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143374 ?auto_143375 ?auto_143372 ?auto_143373 )
      ( GET-4IMAGE-VERIFY ?auto_143369 ?auto_143370 ?auto_143371 ?auto_143368 ?auto_143372 ?auto_143373 ?auto_143374 ?auto_143375 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143381 - DIRECTION
      ?auto_143382 - MODE
      ?auto_143383 - DIRECTION
      ?auto_143380 - MODE
      ?auto_143384 - DIRECTION
      ?auto_143385 - MODE
      ?auto_143386 - DIRECTION
      ?auto_143387 - MODE
    )
    :vars
    (
      ?auto_143390 - INSTRUMENT
      ?auto_143391 - SATELLITE
      ?auto_143388 - DIRECTION
      ?auto_143389 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143390 ?auto_143391 ) ( SUPPORTS ?auto_143390 ?auto_143385 ) ( not ( = ?auto_143384 ?auto_143388 ) ) ( HAVE_IMAGE ?auto_143383 ?auto_143380 ) ( not ( = ?auto_143383 ?auto_143384 ) ) ( not ( = ?auto_143383 ?auto_143388 ) ) ( not ( = ?auto_143380 ?auto_143385 ) ) ( CALIBRATION_TARGET ?auto_143390 ?auto_143388 ) ( POWER_AVAIL ?auto_143391 ) ( POINTING ?auto_143391 ?auto_143389 ) ( not ( = ?auto_143388 ?auto_143389 ) ) ( not ( = ?auto_143384 ?auto_143389 ) ) ( not ( = ?auto_143383 ?auto_143389 ) ) ( HAVE_IMAGE ?auto_143381 ?auto_143382 ) ( HAVE_IMAGE ?auto_143386 ?auto_143387 ) ( not ( = ?auto_143381 ?auto_143383 ) ) ( not ( = ?auto_143381 ?auto_143384 ) ) ( not ( = ?auto_143381 ?auto_143386 ) ) ( not ( = ?auto_143381 ?auto_143388 ) ) ( not ( = ?auto_143381 ?auto_143389 ) ) ( not ( = ?auto_143382 ?auto_143380 ) ) ( not ( = ?auto_143382 ?auto_143385 ) ) ( not ( = ?auto_143382 ?auto_143387 ) ) ( not ( = ?auto_143383 ?auto_143386 ) ) ( not ( = ?auto_143380 ?auto_143387 ) ) ( not ( = ?auto_143384 ?auto_143386 ) ) ( not ( = ?auto_143385 ?auto_143387 ) ) ( not ( = ?auto_143386 ?auto_143388 ) ) ( not ( = ?auto_143386 ?auto_143389 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143383 ?auto_143380 ?auto_143384 ?auto_143385 )
      ( GET-4IMAGE-VERIFY ?auto_143381 ?auto_143382 ?auto_143383 ?auto_143380 ?auto_143384 ?auto_143385 ?auto_143386 ?auto_143387 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143425 - DIRECTION
      ?auto_143426 - MODE
      ?auto_143427 - DIRECTION
      ?auto_143424 - MODE
      ?auto_143428 - DIRECTION
      ?auto_143429 - MODE
      ?auto_143430 - DIRECTION
      ?auto_143431 - MODE
    )
    :vars
    (
      ?auto_143436 - INSTRUMENT
      ?auto_143437 - SATELLITE
      ?auto_143432 - DIRECTION
      ?auto_143433 - DIRECTION
      ?auto_143434 - MODE
      ?auto_143435 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143436 ?auto_143437 ) ( SUPPORTS ?auto_143436 ?auto_143431 ) ( not ( = ?auto_143430 ?auto_143432 ) ) ( HAVE_IMAGE ?auto_143433 ?auto_143434 ) ( not ( = ?auto_143433 ?auto_143430 ) ) ( not ( = ?auto_143433 ?auto_143432 ) ) ( not ( = ?auto_143434 ?auto_143431 ) ) ( CALIBRATION_TARGET ?auto_143436 ?auto_143432 ) ( POWER_AVAIL ?auto_143437 ) ( POINTING ?auto_143437 ?auto_143435 ) ( not ( = ?auto_143432 ?auto_143435 ) ) ( not ( = ?auto_143430 ?auto_143435 ) ) ( not ( = ?auto_143433 ?auto_143435 ) ) ( HAVE_IMAGE ?auto_143425 ?auto_143426 ) ( HAVE_IMAGE ?auto_143427 ?auto_143424 ) ( HAVE_IMAGE ?auto_143428 ?auto_143429 ) ( not ( = ?auto_143425 ?auto_143427 ) ) ( not ( = ?auto_143425 ?auto_143428 ) ) ( not ( = ?auto_143425 ?auto_143430 ) ) ( not ( = ?auto_143425 ?auto_143432 ) ) ( not ( = ?auto_143425 ?auto_143433 ) ) ( not ( = ?auto_143425 ?auto_143435 ) ) ( not ( = ?auto_143426 ?auto_143424 ) ) ( not ( = ?auto_143426 ?auto_143429 ) ) ( not ( = ?auto_143426 ?auto_143431 ) ) ( not ( = ?auto_143426 ?auto_143434 ) ) ( not ( = ?auto_143427 ?auto_143428 ) ) ( not ( = ?auto_143427 ?auto_143430 ) ) ( not ( = ?auto_143427 ?auto_143432 ) ) ( not ( = ?auto_143427 ?auto_143433 ) ) ( not ( = ?auto_143427 ?auto_143435 ) ) ( not ( = ?auto_143424 ?auto_143429 ) ) ( not ( = ?auto_143424 ?auto_143431 ) ) ( not ( = ?auto_143424 ?auto_143434 ) ) ( not ( = ?auto_143428 ?auto_143430 ) ) ( not ( = ?auto_143428 ?auto_143432 ) ) ( not ( = ?auto_143428 ?auto_143433 ) ) ( not ( = ?auto_143428 ?auto_143435 ) ) ( not ( = ?auto_143429 ?auto_143431 ) ) ( not ( = ?auto_143429 ?auto_143434 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143433 ?auto_143434 ?auto_143430 ?auto_143431 )
      ( GET-4IMAGE-VERIFY ?auto_143425 ?auto_143426 ?auto_143427 ?auto_143424 ?auto_143428 ?auto_143429 ?auto_143430 ?auto_143431 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143464 - DIRECTION
      ?auto_143465 - MODE
      ?auto_143466 - DIRECTION
      ?auto_143463 - MODE
      ?auto_143467 - DIRECTION
      ?auto_143468 - MODE
      ?auto_143469 - DIRECTION
      ?auto_143470 - MODE
    )
    :vars
    (
      ?auto_143475 - INSTRUMENT
      ?auto_143476 - SATELLITE
      ?auto_143471 - DIRECTION
      ?auto_143472 - DIRECTION
      ?auto_143473 - MODE
      ?auto_143474 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143475 ?auto_143476 ) ( SUPPORTS ?auto_143475 ?auto_143468 ) ( not ( = ?auto_143467 ?auto_143471 ) ) ( HAVE_IMAGE ?auto_143472 ?auto_143473 ) ( not ( = ?auto_143472 ?auto_143467 ) ) ( not ( = ?auto_143472 ?auto_143471 ) ) ( not ( = ?auto_143473 ?auto_143468 ) ) ( CALIBRATION_TARGET ?auto_143475 ?auto_143471 ) ( POWER_AVAIL ?auto_143476 ) ( POINTING ?auto_143476 ?auto_143474 ) ( not ( = ?auto_143471 ?auto_143474 ) ) ( not ( = ?auto_143467 ?auto_143474 ) ) ( not ( = ?auto_143472 ?auto_143474 ) ) ( HAVE_IMAGE ?auto_143464 ?auto_143465 ) ( HAVE_IMAGE ?auto_143466 ?auto_143463 ) ( HAVE_IMAGE ?auto_143469 ?auto_143470 ) ( not ( = ?auto_143464 ?auto_143466 ) ) ( not ( = ?auto_143464 ?auto_143467 ) ) ( not ( = ?auto_143464 ?auto_143469 ) ) ( not ( = ?auto_143464 ?auto_143471 ) ) ( not ( = ?auto_143464 ?auto_143472 ) ) ( not ( = ?auto_143464 ?auto_143474 ) ) ( not ( = ?auto_143465 ?auto_143463 ) ) ( not ( = ?auto_143465 ?auto_143468 ) ) ( not ( = ?auto_143465 ?auto_143470 ) ) ( not ( = ?auto_143465 ?auto_143473 ) ) ( not ( = ?auto_143466 ?auto_143467 ) ) ( not ( = ?auto_143466 ?auto_143469 ) ) ( not ( = ?auto_143466 ?auto_143471 ) ) ( not ( = ?auto_143466 ?auto_143472 ) ) ( not ( = ?auto_143466 ?auto_143474 ) ) ( not ( = ?auto_143463 ?auto_143468 ) ) ( not ( = ?auto_143463 ?auto_143470 ) ) ( not ( = ?auto_143463 ?auto_143473 ) ) ( not ( = ?auto_143467 ?auto_143469 ) ) ( not ( = ?auto_143468 ?auto_143470 ) ) ( not ( = ?auto_143469 ?auto_143471 ) ) ( not ( = ?auto_143469 ?auto_143472 ) ) ( not ( = ?auto_143469 ?auto_143474 ) ) ( not ( = ?auto_143470 ?auto_143473 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143472 ?auto_143473 ?auto_143467 ?auto_143468 )
      ( GET-4IMAGE-VERIFY ?auto_143464 ?auto_143465 ?auto_143466 ?auto_143463 ?auto_143467 ?auto_143468 ?auto_143469 ?auto_143470 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143478 - DIRECTION
      ?auto_143479 - MODE
      ?auto_143480 - DIRECTION
      ?auto_143477 - MODE
      ?auto_143481 - DIRECTION
      ?auto_143482 - MODE
      ?auto_143483 - DIRECTION
      ?auto_143484 - MODE
    )
    :vars
    (
      ?auto_143488 - INSTRUMENT
      ?auto_143489 - SATELLITE
      ?auto_143485 - DIRECTION
      ?auto_143486 - DIRECTION
      ?auto_143487 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_143488 ?auto_143489 ) ( SUPPORTS ?auto_143488 ?auto_143482 ) ( not ( = ?auto_143481 ?auto_143485 ) ) ( HAVE_IMAGE ?auto_143486 ?auto_143487 ) ( not ( = ?auto_143486 ?auto_143481 ) ) ( not ( = ?auto_143486 ?auto_143485 ) ) ( not ( = ?auto_143487 ?auto_143482 ) ) ( CALIBRATION_TARGET ?auto_143488 ?auto_143485 ) ( POWER_AVAIL ?auto_143489 ) ( POINTING ?auto_143489 ?auto_143483 ) ( not ( = ?auto_143485 ?auto_143483 ) ) ( not ( = ?auto_143481 ?auto_143483 ) ) ( not ( = ?auto_143486 ?auto_143483 ) ) ( HAVE_IMAGE ?auto_143478 ?auto_143479 ) ( HAVE_IMAGE ?auto_143480 ?auto_143477 ) ( HAVE_IMAGE ?auto_143483 ?auto_143484 ) ( not ( = ?auto_143478 ?auto_143480 ) ) ( not ( = ?auto_143478 ?auto_143481 ) ) ( not ( = ?auto_143478 ?auto_143483 ) ) ( not ( = ?auto_143478 ?auto_143485 ) ) ( not ( = ?auto_143478 ?auto_143486 ) ) ( not ( = ?auto_143479 ?auto_143477 ) ) ( not ( = ?auto_143479 ?auto_143482 ) ) ( not ( = ?auto_143479 ?auto_143484 ) ) ( not ( = ?auto_143479 ?auto_143487 ) ) ( not ( = ?auto_143480 ?auto_143481 ) ) ( not ( = ?auto_143480 ?auto_143483 ) ) ( not ( = ?auto_143480 ?auto_143485 ) ) ( not ( = ?auto_143480 ?auto_143486 ) ) ( not ( = ?auto_143477 ?auto_143482 ) ) ( not ( = ?auto_143477 ?auto_143484 ) ) ( not ( = ?auto_143477 ?auto_143487 ) ) ( not ( = ?auto_143482 ?auto_143484 ) ) ( not ( = ?auto_143484 ?auto_143487 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143486 ?auto_143487 ?auto_143481 ?auto_143482 )
      ( GET-4IMAGE-VERIFY ?auto_143478 ?auto_143479 ?auto_143480 ?auto_143477 ?auto_143481 ?auto_143482 ?auto_143483 ?auto_143484 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143513 - DIRECTION
      ?auto_143514 - MODE
      ?auto_143515 - DIRECTION
      ?auto_143512 - MODE
      ?auto_143516 - DIRECTION
      ?auto_143517 - MODE
      ?auto_143518 - DIRECTION
      ?auto_143519 - MODE
    )
    :vars
    (
      ?auto_143523 - INSTRUMENT
      ?auto_143524 - SATELLITE
      ?auto_143520 - DIRECTION
      ?auto_143521 - DIRECTION
      ?auto_143522 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_143523 ?auto_143524 ) ( SUPPORTS ?auto_143523 ?auto_143519 ) ( not ( = ?auto_143518 ?auto_143520 ) ) ( HAVE_IMAGE ?auto_143521 ?auto_143522 ) ( not ( = ?auto_143521 ?auto_143518 ) ) ( not ( = ?auto_143521 ?auto_143520 ) ) ( not ( = ?auto_143522 ?auto_143519 ) ) ( CALIBRATION_TARGET ?auto_143523 ?auto_143520 ) ( POWER_AVAIL ?auto_143524 ) ( POINTING ?auto_143524 ?auto_143515 ) ( not ( = ?auto_143520 ?auto_143515 ) ) ( not ( = ?auto_143518 ?auto_143515 ) ) ( not ( = ?auto_143521 ?auto_143515 ) ) ( HAVE_IMAGE ?auto_143513 ?auto_143514 ) ( HAVE_IMAGE ?auto_143515 ?auto_143512 ) ( HAVE_IMAGE ?auto_143516 ?auto_143517 ) ( not ( = ?auto_143513 ?auto_143515 ) ) ( not ( = ?auto_143513 ?auto_143516 ) ) ( not ( = ?auto_143513 ?auto_143518 ) ) ( not ( = ?auto_143513 ?auto_143520 ) ) ( not ( = ?auto_143513 ?auto_143521 ) ) ( not ( = ?auto_143514 ?auto_143512 ) ) ( not ( = ?auto_143514 ?auto_143517 ) ) ( not ( = ?auto_143514 ?auto_143519 ) ) ( not ( = ?auto_143514 ?auto_143522 ) ) ( not ( = ?auto_143515 ?auto_143516 ) ) ( not ( = ?auto_143512 ?auto_143517 ) ) ( not ( = ?auto_143512 ?auto_143519 ) ) ( not ( = ?auto_143512 ?auto_143522 ) ) ( not ( = ?auto_143516 ?auto_143518 ) ) ( not ( = ?auto_143516 ?auto_143520 ) ) ( not ( = ?auto_143516 ?auto_143521 ) ) ( not ( = ?auto_143517 ?auto_143519 ) ) ( not ( = ?auto_143517 ?auto_143522 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143521 ?auto_143522 ?auto_143518 ?auto_143519 )
      ( GET-4IMAGE-VERIFY ?auto_143513 ?auto_143514 ?auto_143515 ?auto_143512 ?auto_143516 ?auto_143517 ?auto_143518 ?auto_143519 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143547 - DIRECTION
      ?auto_143548 - MODE
      ?auto_143549 - DIRECTION
      ?auto_143546 - MODE
      ?auto_143550 - DIRECTION
      ?auto_143551 - MODE
      ?auto_143552 - DIRECTION
      ?auto_143553 - MODE
    )
    :vars
    (
      ?auto_143557 - INSTRUMENT
      ?auto_143558 - SATELLITE
      ?auto_143554 - DIRECTION
      ?auto_143555 - DIRECTION
      ?auto_143556 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_143557 ?auto_143558 ) ( SUPPORTS ?auto_143557 ?auto_143551 ) ( not ( = ?auto_143550 ?auto_143554 ) ) ( HAVE_IMAGE ?auto_143555 ?auto_143556 ) ( not ( = ?auto_143555 ?auto_143550 ) ) ( not ( = ?auto_143555 ?auto_143554 ) ) ( not ( = ?auto_143556 ?auto_143551 ) ) ( CALIBRATION_TARGET ?auto_143557 ?auto_143554 ) ( POWER_AVAIL ?auto_143558 ) ( POINTING ?auto_143558 ?auto_143549 ) ( not ( = ?auto_143554 ?auto_143549 ) ) ( not ( = ?auto_143550 ?auto_143549 ) ) ( not ( = ?auto_143555 ?auto_143549 ) ) ( HAVE_IMAGE ?auto_143547 ?auto_143548 ) ( HAVE_IMAGE ?auto_143549 ?auto_143546 ) ( HAVE_IMAGE ?auto_143552 ?auto_143553 ) ( not ( = ?auto_143547 ?auto_143549 ) ) ( not ( = ?auto_143547 ?auto_143550 ) ) ( not ( = ?auto_143547 ?auto_143552 ) ) ( not ( = ?auto_143547 ?auto_143554 ) ) ( not ( = ?auto_143547 ?auto_143555 ) ) ( not ( = ?auto_143548 ?auto_143546 ) ) ( not ( = ?auto_143548 ?auto_143551 ) ) ( not ( = ?auto_143548 ?auto_143553 ) ) ( not ( = ?auto_143548 ?auto_143556 ) ) ( not ( = ?auto_143549 ?auto_143552 ) ) ( not ( = ?auto_143546 ?auto_143551 ) ) ( not ( = ?auto_143546 ?auto_143553 ) ) ( not ( = ?auto_143546 ?auto_143556 ) ) ( not ( = ?auto_143550 ?auto_143552 ) ) ( not ( = ?auto_143551 ?auto_143553 ) ) ( not ( = ?auto_143552 ?auto_143554 ) ) ( not ( = ?auto_143552 ?auto_143555 ) ) ( not ( = ?auto_143553 ?auto_143556 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143555 ?auto_143556 ?auto_143550 ?auto_143551 )
      ( GET-4IMAGE-VERIFY ?auto_143547 ?auto_143548 ?auto_143549 ?auto_143546 ?auto_143550 ?auto_143551 ?auto_143552 ?auto_143553 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143586 - DIRECTION
      ?auto_143587 - MODE
      ?auto_143588 - DIRECTION
      ?auto_143585 - MODE
      ?auto_143589 - DIRECTION
      ?auto_143590 - MODE
      ?auto_143591 - DIRECTION
      ?auto_143592 - MODE
    )
    :vars
    (
      ?auto_143595 - INSTRUMENT
      ?auto_143596 - SATELLITE
      ?auto_143593 - DIRECTION
      ?auto_143594 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143595 ?auto_143596 ) ( SUPPORTS ?auto_143595 ?auto_143585 ) ( not ( = ?auto_143588 ?auto_143593 ) ) ( HAVE_IMAGE ?auto_143591 ?auto_143590 ) ( not ( = ?auto_143591 ?auto_143588 ) ) ( not ( = ?auto_143591 ?auto_143593 ) ) ( not ( = ?auto_143590 ?auto_143585 ) ) ( CALIBRATION_TARGET ?auto_143595 ?auto_143593 ) ( POWER_AVAIL ?auto_143596 ) ( POINTING ?auto_143596 ?auto_143594 ) ( not ( = ?auto_143593 ?auto_143594 ) ) ( not ( = ?auto_143588 ?auto_143594 ) ) ( not ( = ?auto_143591 ?auto_143594 ) ) ( HAVE_IMAGE ?auto_143586 ?auto_143587 ) ( HAVE_IMAGE ?auto_143589 ?auto_143590 ) ( HAVE_IMAGE ?auto_143591 ?auto_143592 ) ( not ( = ?auto_143586 ?auto_143588 ) ) ( not ( = ?auto_143586 ?auto_143589 ) ) ( not ( = ?auto_143586 ?auto_143591 ) ) ( not ( = ?auto_143586 ?auto_143593 ) ) ( not ( = ?auto_143586 ?auto_143594 ) ) ( not ( = ?auto_143587 ?auto_143585 ) ) ( not ( = ?auto_143587 ?auto_143590 ) ) ( not ( = ?auto_143587 ?auto_143592 ) ) ( not ( = ?auto_143588 ?auto_143589 ) ) ( not ( = ?auto_143585 ?auto_143592 ) ) ( not ( = ?auto_143589 ?auto_143591 ) ) ( not ( = ?auto_143589 ?auto_143593 ) ) ( not ( = ?auto_143589 ?auto_143594 ) ) ( not ( = ?auto_143590 ?auto_143592 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143591 ?auto_143590 ?auto_143588 ?auto_143585 )
      ( GET-4IMAGE-VERIFY ?auto_143586 ?auto_143587 ?auto_143588 ?auto_143585 ?auto_143589 ?auto_143590 ?auto_143591 ?auto_143592 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143598 - DIRECTION
      ?auto_143599 - MODE
      ?auto_143600 - DIRECTION
      ?auto_143597 - MODE
      ?auto_143601 - DIRECTION
      ?auto_143602 - MODE
      ?auto_143603 - DIRECTION
      ?auto_143604 - MODE
    )
    :vars
    (
      ?auto_143607 - INSTRUMENT
      ?auto_143608 - SATELLITE
      ?auto_143605 - DIRECTION
      ?auto_143606 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143607 ?auto_143608 ) ( SUPPORTS ?auto_143607 ?auto_143597 ) ( not ( = ?auto_143600 ?auto_143605 ) ) ( HAVE_IMAGE ?auto_143601 ?auto_143602 ) ( not ( = ?auto_143601 ?auto_143600 ) ) ( not ( = ?auto_143601 ?auto_143605 ) ) ( not ( = ?auto_143602 ?auto_143597 ) ) ( CALIBRATION_TARGET ?auto_143607 ?auto_143605 ) ( POWER_AVAIL ?auto_143608 ) ( POINTING ?auto_143608 ?auto_143606 ) ( not ( = ?auto_143605 ?auto_143606 ) ) ( not ( = ?auto_143600 ?auto_143606 ) ) ( not ( = ?auto_143601 ?auto_143606 ) ) ( HAVE_IMAGE ?auto_143598 ?auto_143599 ) ( HAVE_IMAGE ?auto_143603 ?auto_143604 ) ( not ( = ?auto_143598 ?auto_143600 ) ) ( not ( = ?auto_143598 ?auto_143601 ) ) ( not ( = ?auto_143598 ?auto_143603 ) ) ( not ( = ?auto_143598 ?auto_143605 ) ) ( not ( = ?auto_143598 ?auto_143606 ) ) ( not ( = ?auto_143599 ?auto_143597 ) ) ( not ( = ?auto_143599 ?auto_143602 ) ) ( not ( = ?auto_143599 ?auto_143604 ) ) ( not ( = ?auto_143600 ?auto_143603 ) ) ( not ( = ?auto_143597 ?auto_143604 ) ) ( not ( = ?auto_143601 ?auto_143603 ) ) ( not ( = ?auto_143602 ?auto_143604 ) ) ( not ( = ?auto_143603 ?auto_143605 ) ) ( not ( = ?auto_143603 ?auto_143606 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143601 ?auto_143602 ?auto_143600 ?auto_143597 )
      ( GET-4IMAGE-VERIFY ?auto_143598 ?auto_143599 ?auto_143600 ?auto_143597 ?auto_143601 ?auto_143602 ?auto_143603 ?auto_143604 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143642 - DIRECTION
      ?auto_143643 - MODE
      ?auto_143644 - DIRECTION
      ?auto_143641 - MODE
      ?auto_143645 - DIRECTION
      ?auto_143646 - MODE
      ?auto_143647 - DIRECTION
      ?auto_143648 - MODE
    )
    :vars
    (
      ?auto_143653 - INSTRUMENT
      ?auto_143654 - SATELLITE
      ?auto_143649 - DIRECTION
      ?auto_143650 - DIRECTION
      ?auto_143651 - MODE
      ?auto_143652 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143653 ?auto_143654 ) ( SUPPORTS ?auto_143653 ?auto_143641 ) ( not ( = ?auto_143644 ?auto_143649 ) ) ( HAVE_IMAGE ?auto_143650 ?auto_143651 ) ( not ( = ?auto_143650 ?auto_143644 ) ) ( not ( = ?auto_143650 ?auto_143649 ) ) ( not ( = ?auto_143651 ?auto_143641 ) ) ( CALIBRATION_TARGET ?auto_143653 ?auto_143649 ) ( POWER_AVAIL ?auto_143654 ) ( POINTING ?auto_143654 ?auto_143652 ) ( not ( = ?auto_143649 ?auto_143652 ) ) ( not ( = ?auto_143644 ?auto_143652 ) ) ( not ( = ?auto_143650 ?auto_143652 ) ) ( HAVE_IMAGE ?auto_143642 ?auto_143643 ) ( HAVE_IMAGE ?auto_143645 ?auto_143646 ) ( HAVE_IMAGE ?auto_143647 ?auto_143648 ) ( not ( = ?auto_143642 ?auto_143644 ) ) ( not ( = ?auto_143642 ?auto_143645 ) ) ( not ( = ?auto_143642 ?auto_143647 ) ) ( not ( = ?auto_143642 ?auto_143649 ) ) ( not ( = ?auto_143642 ?auto_143650 ) ) ( not ( = ?auto_143642 ?auto_143652 ) ) ( not ( = ?auto_143643 ?auto_143641 ) ) ( not ( = ?auto_143643 ?auto_143646 ) ) ( not ( = ?auto_143643 ?auto_143648 ) ) ( not ( = ?auto_143643 ?auto_143651 ) ) ( not ( = ?auto_143644 ?auto_143645 ) ) ( not ( = ?auto_143644 ?auto_143647 ) ) ( not ( = ?auto_143641 ?auto_143646 ) ) ( not ( = ?auto_143641 ?auto_143648 ) ) ( not ( = ?auto_143645 ?auto_143647 ) ) ( not ( = ?auto_143645 ?auto_143649 ) ) ( not ( = ?auto_143645 ?auto_143650 ) ) ( not ( = ?auto_143645 ?auto_143652 ) ) ( not ( = ?auto_143646 ?auto_143648 ) ) ( not ( = ?auto_143646 ?auto_143651 ) ) ( not ( = ?auto_143647 ?auto_143649 ) ) ( not ( = ?auto_143647 ?auto_143650 ) ) ( not ( = ?auto_143647 ?auto_143652 ) ) ( not ( = ?auto_143648 ?auto_143651 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143650 ?auto_143651 ?auto_143644 ?auto_143641 )
      ( GET-4IMAGE-VERIFY ?auto_143642 ?auto_143643 ?auto_143644 ?auto_143641 ?auto_143645 ?auto_143646 ?auto_143647 ?auto_143648 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143656 - DIRECTION
      ?auto_143657 - MODE
      ?auto_143658 - DIRECTION
      ?auto_143655 - MODE
      ?auto_143659 - DIRECTION
      ?auto_143660 - MODE
      ?auto_143661 - DIRECTION
      ?auto_143662 - MODE
    )
    :vars
    (
      ?auto_143666 - INSTRUMENT
      ?auto_143667 - SATELLITE
      ?auto_143663 - DIRECTION
      ?auto_143664 - DIRECTION
      ?auto_143665 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_143666 ?auto_143667 ) ( SUPPORTS ?auto_143666 ?auto_143655 ) ( not ( = ?auto_143658 ?auto_143663 ) ) ( HAVE_IMAGE ?auto_143664 ?auto_143665 ) ( not ( = ?auto_143664 ?auto_143658 ) ) ( not ( = ?auto_143664 ?auto_143663 ) ) ( not ( = ?auto_143665 ?auto_143655 ) ) ( CALIBRATION_TARGET ?auto_143666 ?auto_143663 ) ( POWER_AVAIL ?auto_143667 ) ( POINTING ?auto_143667 ?auto_143661 ) ( not ( = ?auto_143663 ?auto_143661 ) ) ( not ( = ?auto_143658 ?auto_143661 ) ) ( not ( = ?auto_143664 ?auto_143661 ) ) ( HAVE_IMAGE ?auto_143656 ?auto_143657 ) ( HAVE_IMAGE ?auto_143659 ?auto_143660 ) ( HAVE_IMAGE ?auto_143661 ?auto_143662 ) ( not ( = ?auto_143656 ?auto_143658 ) ) ( not ( = ?auto_143656 ?auto_143659 ) ) ( not ( = ?auto_143656 ?auto_143661 ) ) ( not ( = ?auto_143656 ?auto_143663 ) ) ( not ( = ?auto_143656 ?auto_143664 ) ) ( not ( = ?auto_143657 ?auto_143655 ) ) ( not ( = ?auto_143657 ?auto_143660 ) ) ( not ( = ?auto_143657 ?auto_143662 ) ) ( not ( = ?auto_143657 ?auto_143665 ) ) ( not ( = ?auto_143658 ?auto_143659 ) ) ( not ( = ?auto_143655 ?auto_143660 ) ) ( not ( = ?auto_143655 ?auto_143662 ) ) ( not ( = ?auto_143659 ?auto_143661 ) ) ( not ( = ?auto_143659 ?auto_143663 ) ) ( not ( = ?auto_143659 ?auto_143664 ) ) ( not ( = ?auto_143660 ?auto_143662 ) ) ( not ( = ?auto_143660 ?auto_143665 ) ) ( not ( = ?auto_143662 ?auto_143665 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143664 ?auto_143665 ?auto_143658 ?auto_143655 )
      ( GET-4IMAGE-VERIFY ?auto_143656 ?auto_143657 ?auto_143658 ?auto_143655 ?auto_143659 ?auto_143660 ?auto_143661 ?auto_143662 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143794 - DIRECTION
      ?auto_143795 - MODE
      ?auto_143796 - DIRECTION
      ?auto_143793 - MODE
      ?auto_143797 - DIRECTION
      ?auto_143798 - MODE
      ?auto_143799 - DIRECTION
      ?auto_143800 - MODE
    )
    :vars
    (
      ?auto_143802 - INSTRUMENT
      ?auto_143803 - SATELLITE
      ?auto_143801 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_143802 ?auto_143803 ) ( SUPPORTS ?auto_143802 ?auto_143800 ) ( not ( = ?auto_143799 ?auto_143801 ) ) ( HAVE_IMAGE ?auto_143796 ?auto_143793 ) ( not ( = ?auto_143796 ?auto_143799 ) ) ( not ( = ?auto_143796 ?auto_143801 ) ) ( not ( = ?auto_143793 ?auto_143800 ) ) ( CALIBRATION_TARGET ?auto_143802 ?auto_143801 ) ( POWER_AVAIL ?auto_143803 ) ( POINTING ?auto_143803 ?auto_143794 ) ( not ( = ?auto_143801 ?auto_143794 ) ) ( not ( = ?auto_143799 ?auto_143794 ) ) ( not ( = ?auto_143796 ?auto_143794 ) ) ( HAVE_IMAGE ?auto_143794 ?auto_143795 ) ( HAVE_IMAGE ?auto_143797 ?auto_143798 ) ( not ( = ?auto_143794 ?auto_143797 ) ) ( not ( = ?auto_143795 ?auto_143793 ) ) ( not ( = ?auto_143795 ?auto_143798 ) ) ( not ( = ?auto_143795 ?auto_143800 ) ) ( not ( = ?auto_143796 ?auto_143797 ) ) ( not ( = ?auto_143793 ?auto_143798 ) ) ( not ( = ?auto_143797 ?auto_143799 ) ) ( not ( = ?auto_143797 ?auto_143801 ) ) ( not ( = ?auto_143798 ?auto_143800 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143796 ?auto_143793 ?auto_143799 ?auto_143800 )
      ( GET-4IMAGE-VERIFY ?auto_143794 ?auto_143795 ?auto_143796 ?auto_143793 ?auto_143797 ?auto_143798 ?auto_143799 ?auto_143800 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_143868 - DIRECTION
      ?auto_143869 - MODE
      ?auto_143870 - DIRECTION
      ?auto_143867 - MODE
      ?auto_143871 - DIRECTION
      ?auto_143872 - MODE
      ?auto_143873 - DIRECTION
      ?auto_143874 - MODE
    )
    :vars
    (
      ?auto_143878 - INSTRUMENT
      ?auto_143879 - SATELLITE
      ?auto_143875 - DIRECTION
      ?auto_143876 - DIRECTION
      ?auto_143877 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_143878 ?auto_143879 ) ( SUPPORTS ?auto_143878 ?auto_143874 ) ( not ( = ?auto_143873 ?auto_143875 ) ) ( HAVE_IMAGE ?auto_143876 ?auto_143877 ) ( not ( = ?auto_143876 ?auto_143873 ) ) ( not ( = ?auto_143876 ?auto_143875 ) ) ( not ( = ?auto_143877 ?auto_143874 ) ) ( CALIBRATION_TARGET ?auto_143878 ?auto_143875 ) ( POWER_AVAIL ?auto_143879 ) ( POINTING ?auto_143879 ?auto_143868 ) ( not ( = ?auto_143875 ?auto_143868 ) ) ( not ( = ?auto_143873 ?auto_143868 ) ) ( not ( = ?auto_143876 ?auto_143868 ) ) ( HAVE_IMAGE ?auto_143868 ?auto_143869 ) ( HAVE_IMAGE ?auto_143870 ?auto_143867 ) ( HAVE_IMAGE ?auto_143871 ?auto_143872 ) ( not ( = ?auto_143868 ?auto_143870 ) ) ( not ( = ?auto_143868 ?auto_143871 ) ) ( not ( = ?auto_143869 ?auto_143867 ) ) ( not ( = ?auto_143869 ?auto_143872 ) ) ( not ( = ?auto_143869 ?auto_143874 ) ) ( not ( = ?auto_143869 ?auto_143877 ) ) ( not ( = ?auto_143870 ?auto_143871 ) ) ( not ( = ?auto_143870 ?auto_143873 ) ) ( not ( = ?auto_143870 ?auto_143875 ) ) ( not ( = ?auto_143870 ?auto_143876 ) ) ( not ( = ?auto_143867 ?auto_143872 ) ) ( not ( = ?auto_143867 ?auto_143874 ) ) ( not ( = ?auto_143867 ?auto_143877 ) ) ( not ( = ?auto_143871 ?auto_143873 ) ) ( not ( = ?auto_143871 ?auto_143875 ) ) ( not ( = ?auto_143871 ?auto_143876 ) ) ( not ( = ?auto_143872 ?auto_143874 ) ) ( not ( = ?auto_143872 ?auto_143877 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_143876 ?auto_143877 ?auto_143873 ?auto_143874 )
      ( GET-4IMAGE-VERIFY ?auto_143868 ?auto_143869 ?auto_143870 ?auto_143867 ?auto_143871 ?auto_143872 ?auto_143873 ?auto_143874 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144077 - DIRECTION
      ?auto_144078 - MODE
      ?auto_144079 - DIRECTION
      ?auto_144076 - MODE
      ?auto_144080 - DIRECTION
      ?auto_144081 - MODE
      ?auto_144082 - DIRECTION
      ?auto_144083 - MODE
    )
    :vars
    (
      ?auto_144087 - INSTRUMENT
      ?auto_144088 - SATELLITE
      ?auto_144084 - DIRECTION
      ?auto_144085 - DIRECTION
      ?auto_144086 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_144087 ?auto_144088 ) ( SUPPORTS ?auto_144087 ?auto_144076 ) ( not ( = ?auto_144079 ?auto_144084 ) ) ( HAVE_IMAGE ?auto_144085 ?auto_144086 ) ( not ( = ?auto_144085 ?auto_144079 ) ) ( not ( = ?auto_144085 ?auto_144084 ) ) ( not ( = ?auto_144086 ?auto_144076 ) ) ( CALIBRATION_TARGET ?auto_144087 ?auto_144084 ) ( POWER_AVAIL ?auto_144088 ) ( POINTING ?auto_144088 ?auto_144077 ) ( not ( = ?auto_144084 ?auto_144077 ) ) ( not ( = ?auto_144079 ?auto_144077 ) ) ( not ( = ?auto_144085 ?auto_144077 ) ) ( HAVE_IMAGE ?auto_144077 ?auto_144078 ) ( HAVE_IMAGE ?auto_144080 ?auto_144081 ) ( HAVE_IMAGE ?auto_144082 ?auto_144083 ) ( not ( = ?auto_144077 ?auto_144080 ) ) ( not ( = ?auto_144077 ?auto_144082 ) ) ( not ( = ?auto_144078 ?auto_144076 ) ) ( not ( = ?auto_144078 ?auto_144081 ) ) ( not ( = ?auto_144078 ?auto_144083 ) ) ( not ( = ?auto_144078 ?auto_144086 ) ) ( not ( = ?auto_144079 ?auto_144080 ) ) ( not ( = ?auto_144079 ?auto_144082 ) ) ( not ( = ?auto_144076 ?auto_144081 ) ) ( not ( = ?auto_144076 ?auto_144083 ) ) ( not ( = ?auto_144080 ?auto_144082 ) ) ( not ( = ?auto_144080 ?auto_144084 ) ) ( not ( = ?auto_144080 ?auto_144085 ) ) ( not ( = ?auto_144081 ?auto_144083 ) ) ( not ( = ?auto_144081 ?auto_144086 ) ) ( not ( = ?auto_144082 ?auto_144084 ) ) ( not ( = ?auto_144082 ?auto_144085 ) ) ( not ( = ?auto_144083 ?auto_144086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144085 ?auto_144086 ?auto_144079 ?auto_144076 )
      ( GET-4IMAGE-VERIFY ?auto_144077 ?auto_144078 ?auto_144079 ?auto_144076 ?auto_144080 ?auto_144081 ?auto_144082 ?auto_144083 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144216 - DIRECTION
      ?auto_144217 - MODE
      ?auto_144218 - DIRECTION
      ?auto_144215 - MODE
      ?auto_144219 - DIRECTION
      ?auto_144220 - MODE
      ?auto_144221 - DIRECTION
      ?auto_144222 - MODE
    )
    :vars
    (
      ?auto_144225 - INSTRUMENT
      ?auto_144226 - SATELLITE
      ?auto_144223 - DIRECTION
      ?auto_144224 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_144225 ?auto_144226 ) ( SUPPORTS ?auto_144225 ?auto_144217 ) ( not ( = ?auto_144216 ?auto_144223 ) ) ( HAVE_IMAGE ?auto_144221 ?auto_144220 ) ( not ( = ?auto_144221 ?auto_144216 ) ) ( not ( = ?auto_144221 ?auto_144223 ) ) ( not ( = ?auto_144220 ?auto_144217 ) ) ( CALIBRATION_TARGET ?auto_144225 ?auto_144223 ) ( POWER_AVAIL ?auto_144226 ) ( POINTING ?auto_144226 ?auto_144224 ) ( not ( = ?auto_144223 ?auto_144224 ) ) ( not ( = ?auto_144216 ?auto_144224 ) ) ( not ( = ?auto_144221 ?auto_144224 ) ) ( HAVE_IMAGE ?auto_144218 ?auto_144215 ) ( HAVE_IMAGE ?auto_144219 ?auto_144220 ) ( HAVE_IMAGE ?auto_144221 ?auto_144222 ) ( not ( = ?auto_144216 ?auto_144218 ) ) ( not ( = ?auto_144216 ?auto_144219 ) ) ( not ( = ?auto_144217 ?auto_144215 ) ) ( not ( = ?auto_144217 ?auto_144222 ) ) ( not ( = ?auto_144218 ?auto_144219 ) ) ( not ( = ?auto_144218 ?auto_144221 ) ) ( not ( = ?auto_144218 ?auto_144223 ) ) ( not ( = ?auto_144218 ?auto_144224 ) ) ( not ( = ?auto_144215 ?auto_144220 ) ) ( not ( = ?auto_144215 ?auto_144222 ) ) ( not ( = ?auto_144219 ?auto_144221 ) ) ( not ( = ?auto_144219 ?auto_144223 ) ) ( not ( = ?auto_144219 ?auto_144224 ) ) ( not ( = ?auto_144220 ?auto_144222 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144221 ?auto_144220 ?auto_144216 ?auto_144217 )
      ( GET-4IMAGE-VERIFY ?auto_144216 ?auto_144217 ?auto_144218 ?auto_144215 ?auto_144219 ?auto_144220 ?auto_144221 ?auto_144222 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144228 - DIRECTION
      ?auto_144229 - MODE
      ?auto_144230 - DIRECTION
      ?auto_144227 - MODE
      ?auto_144231 - DIRECTION
      ?auto_144232 - MODE
      ?auto_144233 - DIRECTION
      ?auto_144234 - MODE
    )
    :vars
    (
      ?auto_144237 - INSTRUMENT
      ?auto_144238 - SATELLITE
      ?auto_144235 - DIRECTION
      ?auto_144236 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_144237 ?auto_144238 ) ( SUPPORTS ?auto_144237 ?auto_144229 ) ( not ( = ?auto_144228 ?auto_144235 ) ) ( HAVE_IMAGE ?auto_144231 ?auto_144232 ) ( not ( = ?auto_144231 ?auto_144228 ) ) ( not ( = ?auto_144231 ?auto_144235 ) ) ( not ( = ?auto_144232 ?auto_144229 ) ) ( CALIBRATION_TARGET ?auto_144237 ?auto_144235 ) ( POWER_AVAIL ?auto_144238 ) ( POINTING ?auto_144238 ?auto_144236 ) ( not ( = ?auto_144235 ?auto_144236 ) ) ( not ( = ?auto_144228 ?auto_144236 ) ) ( not ( = ?auto_144231 ?auto_144236 ) ) ( HAVE_IMAGE ?auto_144230 ?auto_144227 ) ( HAVE_IMAGE ?auto_144233 ?auto_144234 ) ( not ( = ?auto_144228 ?auto_144230 ) ) ( not ( = ?auto_144228 ?auto_144233 ) ) ( not ( = ?auto_144229 ?auto_144227 ) ) ( not ( = ?auto_144229 ?auto_144234 ) ) ( not ( = ?auto_144230 ?auto_144231 ) ) ( not ( = ?auto_144230 ?auto_144233 ) ) ( not ( = ?auto_144230 ?auto_144235 ) ) ( not ( = ?auto_144230 ?auto_144236 ) ) ( not ( = ?auto_144227 ?auto_144232 ) ) ( not ( = ?auto_144227 ?auto_144234 ) ) ( not ( = ?auto_144231 ?auto_144233 ) ) ( not ( = ?auto_144232 ?auto_144234 ) ) ( not ( = ?auto_144233 ?auto_144235 ) ) ( not ( = ?auto_144233 ?auto_144236 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144231 ?auto_144232 ?auto_144228 ?auto_144229 )
      ( GET-4IMAGE-VERIFY ?auto_144228 ?auto_144229 ?auto_144230 ?auto_144227 ?auto_144231 ?auto_144232 ?auto_144233 ?auto_144234 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144240 - DIRECTION
      ?auto_144241 - MODE
      ?auto_144242 - DIRECTION
      ?auto_144239 - MODE
      ?auto_144243 - DIRECTION
      ?auto_144244 - MODE
      ?auto_144245 - DIRECTION
      ?auto_144246 - MODE
    )
    :vars
    (
      ?auto_144248 - INSTRUMENT
      ?auto_144249 - SATELLITE
      ?auto_144247 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_144248 ?auto_144249 ) ( SUPPORTS ?auto_144248 ?auto_144241 ) ( not ( = ?auto_144240 ?auto_144247 ) ) ( HAVE_IMAGE ?auto_144243 ?auto_144244 ) ( not ( = ?auto_144243 ?auto_144240 ) ) ( not ( = ?auto_144243 ?auto_144247 ) ) ( not ( = ?auto_144244 ?auto_144241 ) ) ( CALIBRATION_TARGET ?auto_144248 ?auto_144247 ) ( POWER_AVAIL ?auto_144249 ) ( POINTING ?auto_144249 ?auto_144245 ) ( not ( = ?auto_144247 ?auto_144245 ) ) ( not ( = ?auto_144240 ?auto_144245 ) ) ( not ( = ?auto_144243 ?auto_144245 ) ) ( HAVE_IMAGE ?auto_144242 ?auto_144239 ) ( HAVE_IMAGE ?auto_144245 ?auto_144246 ) ( not ( = ?auto_144240 ?auto_144242 ) ) ( not ( = ?auto_144241 ?auto_144239 ) ) ( not ( = ?auto_144241 ?auto_144246 ) ) ( not ( = ?auto_144242 ?auto_144243 ) ) ( not ( = ?auto_144242 ?auto_144245 ) ) ( not ( = ?auto_144242 ?auto_144247 ) ) ( not ( = ?auto_144239 ?auto_144244 ) ) ( not ( = ?auto_144239 ?auto_144246 ) ) ( not ( = ?auto_144244 ?auto_144246 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144243 ?auto_144244 ?auto_144240 ?auto_144241 )
      ( GET-4IMAGE-VERIFY ?auto_144240 ?auto_144241 ?auto_144242 ?auto_144239 ?auto_144243 ?auto_144244 ?auto_144245 ?auto_144246 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144263 - DIRECTION
      ?auto_144264 - MODE
      ?auto_144265 - DIRECTION
      ?auto_144262 - MODE
      ?auto_144266 - DIRECTION
      ?auto_144267 - MODE
      ?auto_144268 - DIRECTION
      ?auto_144269 - MODE
    )
    :vars
    (
      ?auto_144272 - INSTRUMENT
      ?auto_144273 - SATELLITE
      ?auto_144270 - DIRECTION
      ?auto_144271 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_144272 ?auto_144273 ) ( SUPPORTS ?auto_144272 ?auto_144264 ) ( not ( = ?auto_144263 ?auto_144270 ) ) ( HAVE_IMAGE ?auto_144268 ?auto_144269 ) ( not ( = ?auto_144268 ?auto_144263 ) ) ( not ( = ?auto_144268 ?auto_144270 ) ) ( not ( = ?auto_144269 ?auto_144264 ) ) ( CALIBRATION_TARGET ?auto_144272 ?auto_144270 ) ( POWER_AVAIL ?auto_144273 ) ( POINTING ?auto_144273 ?auto_144271 ) ( not ( = ?auto_144270 ?auto_144271 ) ) ( not ( = ?auto_144263 ?auto_144271 ) ) ( not ( = ?auto_144268 ?auto_144271 ) ) ( HAVE_IMAGE ?auto_144265 ?auto_144262 ) ( HAVE_IMAGE ?auto_144266 ?auto_144267 ) ( not ( = ?auto_144263 ?auto_144265 ) ) ( not ( = ?auto_144263 ?auto_144266 ) ) ( not ( = ?auto_144264 ?auto_144262 ) ) ( not ( = ?auto_144264 ?auto_144267 ) ) ( not ( = ?auto_144265 ?auto_144266 ) ) ( not ( = ?auto_144265 ?auto_144268 ) ) ( not ( = ?auto_144265 ?auto_144270 ) ) ( not ( = ?auto_144265 ?auto_144271 ) ) ( not ( = ?auto_144262 ?auto_144267 ) ) ( not ( = ?auto_144262 ?auto_144269 ) ) ( not ( = ?auto_144266 ?auto_144268 ) ) ( not ( = ?auto_144266 ?auto_144270 ) ) ( not ( = ?auto_144266 ?auto_144271 ) ) ( not ( = ?auto_144267 ?auto_144269 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144268 ?auto_144269 ?auto_144263 ?auto_144264 )
      ( GET-4IMAGE-VERIFY ?auto_144263 ?auto_144264 ?auto_144265 ?auto_144262 ?auto_144266 ?auto_144267 ?auto_144268 ?auto_144269 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144275 - DIRECTION
      ?auto_144276 - MODE
      ?auto_144277 - DIRECTION
      ?auto_144274 - MODE
      ?auto_144278 - DIRECTION
      ?auto_144279 - MODE
      ?auto_144280 - DIRECTION
      ?auto_144281 - MODE
    )
    :vars
    (
      ?auto_144284 - INSTRUMENT
      ?auto_144285 - SATELLITE
      ?auto_144282 - DIRECTION
      ?auto_144283 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_144284 ?auto_144285 ) ( SUPPORTS ?auto_144284 ?auto_144276 ) ( not ( = ?auto_144275 ?auto_144282 ) ) ( HAVE_IMAGE ?auto_144277 ?auto_144274 ) ( not ( = ?auto_144277 ?auto_144275 ) ) ( not ( = ?auto_144277 ?auto_144282 ) ) ( not ( = ?auto_144274 ?auto_144276 ) ) ( CALIBRATION_TARGET ?auto_144284 ?auto_144282 ) ( POWER_AVAIL ?auto_144285 ) ( POINTING ?auto_144285 ?auto_144283 ) ( not ( = ?auto_144282 ?auto_144283 ) ) ( not ( = ?auto_144275 ?auto_144283 ) ) ( not ( = ?auto_144277 ?auto_144283 ) ) ( HAVE_IMAGE ?auto_144278 ?auto_144279 ) ( HAVE_IMAGE ?auto_144280 ?auto_144281 ) ( not ( = ?auto_144275 ?auto_144278 ) ) ( not ( = ?auto_144275 ?auto_144280 ) ) ( not ( = ?auto_144276 ?auto_144279 ) ) ( not ( = ?auto_144276 ?auto_144281 ) ) ( not ( = ?auto_144277 ?auto_144278 ) ) ( not ( = ?auto_144277 ?auto_144280 ) ) ( not ( = ?auto_144274 ?auto_144279 ) ) ( not ( = ?auto_144274 ?auto_144281 ) ) ( not ( = ?auto_144278 ?auto_144280 ) ) ( not ( = ?auto_144278 ?auto_144282 ) ) ( not ( = ?auto_144278 ?auto_144283 ) ) ( not ( = ?auto_144279 ?auto_144281 ) ) ( not ( = ?auto_144280 ?auto_144282 ) ) ( not ( = ?auto_144280 ?auto_144283 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144277 ?auto_144274 ?auto_144275 ?auto_144276 )
      ( GET-4IMAGE-VERIFY ?auto_144275 ?auto_144276 ?auto_144277 ?auto_144274 ?auto_144278 ?auto_144279 ?auto_144280 ?auto_144281 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144307 - DIRECTION
      ?auto_144308 - MODE
      ?auto_144309 - DIRECTION
      ?auto_144306 - MODE
      ?auto_144310 - DIRECTION
      ?auto_144311 - MODE
      ?auto_144312 - DIRECTION
      ?auto_144313 - MODE
    )
    :vars
    (
      ?auto_144315 - INSTRUMENT
      ?auto_144316 - SATELLITE
      ?auto_144314 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_144315 ?auto_144316 ) ( SUPPORTS ?auto_144315 ?auto_144308 ) ( not ( = ?auto_144307 ?auto_144314 ) ) ( HAVE_IMAGE ?auto_144309 ?auto_144313 ) ( not ( = ?auto_144309 ?auto_144307 ) ) ( not ( = ?auto_144309 ?auto_144314 ) ) ( not ( = ?auto_144313 ?auto_144308 ) ) ( CALIBRATION_TARGET ?auto_144315 ?auto_144314 ) ( POWER_AVAIL ?auto_144316 ) ( POINTING ?auto_144316 ?auto_144310 ) ( not ( = ?auto_144314 ?auto_144310 ) ) ( not ( = ?auto_144307 ?auto_144310 ) ) ( not ( = ?auto_144309 ?auto_144310 ) ) ( HAVE_IMAGE ?auto_144309 ?auto_144306 ) ( HAVE_IMAGE ?auto_144310 ?auto_144311 ) ( HAVE_IMAGE ?auto_144312 ?auto_144313 ) ( not ( = ?auto_144307 ?auto_144312 ) ) ( not ( = ?auto_144308 ?auto_144306 ) ) ( not ( = ?auto_144308 ?auto_144311 ) ) ( not ( = ?auto_144309 ?auto_144312 ) ) ( not ( = ?auto_144306 ?auto_144311 ) ) ( not ( = ?auto_144306 ?auto_144313 ) ) ( not ( = ?auto_144310 ?auto_144312 ) ) ( not ( = ?auto_144311 ?auto_144313 ) ) ( not ( = ?auto_144312 ?auto_144314 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144309 ?auto_144313 ?auto_144307 ?auto_144308 )
      ( GET-4IMAGE-VERIFY ?auto_144307 ?auto_144308 ?auto_144309 ?auto_144306 ?auto_144310 ?auto_144311 ?auto_144312 ?auto_144313 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144454 - DIRECTION
      ?auto_144455 - MODE
      ?auto_144456 - DIRECTION
      ?auto_144453 - MODE
      ?auto_144457 - DIRECTION
      ?auto_144458 - MODE
      ?auto_144459 - DIRECTION
      ?auto_144460 - MODE
    )
    :vars
    (
      ?auto_144465 - INSTRUMENT
      ?auto_144466 - SATELLITE
      ?auto_144461 - DIRECTION
      ?auto_144462 - DIRECTION
      ?auto_144463 - MODE
      ?auto_144464 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_144465 ?auto_144466 ) ( SUPPORTS ?auto_144465 ?auto_144455 ) ( not ( = ?auto_144454 ?auto_144461 ) ) ( HAVE_IMAGE ?auto_144462 ?auto_144463 ) ( not ( = ?auto_144462 ?auto_144454 ) ) ( not ( = ?auto_144462 ?auto_144461 ) ) ( not ( = ?auto_144463 ?auto_144455 ) ) ( CALIBRATION_TARGET ?auto_144465 ?auto_144461 ) ( POWER_AVAIL ?auto_144466 ) ( POINTING ?auto_144466 ?auto_144464 ) ( not ( = ?auto_144461 ?auto_144464 ) ) ( not ( = ?auto_144454 ?auto_144464 ) ) ( not ( = ?auto_144462 ?auto_144464 ) ) ( HAVE_IMAGE ?auto_144456 ?auto_144453 ) ( HAVE_IMAGE ?auto_144457 ?auto_144458 ) ( HAVE_IMAGE ?auto_144459 ?auto_144460 ) ( not ( = ?auto_144454 ?auto_144456 ) ) ( not ( = ?auto_144454 ?auto_144457 ) ) ( not ( = ?auto_144454 ?auto_144459 ) ) ( not ( = ?auto_144455 ?auto_144453 ) ) ( not ( = ?auto_144455 ?auto_144458 ) ) ( not ( = ?auto_144455 ?auto_144460 ) ) ( not ( = ?auto_144456 ?auto_144457 ) ) ( not ( = ?auto_144456 ?auto_144459 ) ) ( not ( = ?auto_144456 ?auto_144461 ) ) ( not ( = ?auto_144456 ?auto_144462 ) ) ( not ( = ?auto_144456 ?auto_144464 ) ) ( not ( = ?auto_144453 ?auto_144458 ) ) ( not ( = ?auto_144453 ?auto_144460 ) ) ( not ( = ?auto_144453 ?auto_144463 ) ) ( not ( = ?auto_144457 ?auto_144459 ) ) ( not ( = ?auto_144457 ?auto_144461 ) ) ( not ( = ?auto_144457 ?auto_144462 ) ) ( not ( = ?auto_144457 ?auto_144464 ) ) ( not ( = ?auto_144458 ?auto_144460 ) ) ( not ( = ?auto_144458 ?auto_144463 ) ) ( not ( = ?auto_144459 ?auto_144461 ) ) ( not ( = ?auto_144459 ?auto_144462 ) ) ( not ( = ?auto_144459 ?auto_144464 ) ) ( not ( = ?auto_144460 ?auto_144463 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144462 ?auto_144463 ?auto_144454 ?auto_144455 )
      ( GET-4IMAGE-VERIFY ?auto_144454 ?auto_144455 ?auto_144456 ?auto_144453 ?auto_144457 ?auto_144458 ?auto_144459 ?auto_144460 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144468 - DIRECTION
      ?auto_144469 - MODE
      ?auto_144470 - DIRECTION
      ?auto_144467 - MODE
      ?auto_144471 - DIRECTION
      ?auto_144472 - MODE
      ?auto_144473 - DIRECTION
      ?auto_144474 - MODE
    )
    :vars
    (
      ?auto_144478 - INSTRUMENT
      ?auto_144479 - SATELLITE
      ?auto_144475 - DIRECTION
      ?auto_144476 - DIRECTION
      ?auto_144477 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_144478 ?auto_144479 ) ( SUPPORTS ?auto_144478 ?auto_144469 ) ( not ( = ?auto_144468 ?auto_144475 ) ) ( HAVE_IMAGE ?auto_144476 ?auto_144477 ) ( not ( = ?auto_144476 ?auto_144468 ) ) ( not ( = ?auto_144476 ?auto_144475 ) ) ( not ( = ?auto_144477 ?auto_144469 ) ) ( CALIBRATION_TARGET ?auto_144478 ?auto_144475 ) ( POWER_AVAIL ?auto_144479 ) ( POINTING ?auto_144479 ?auto_144473 ) ( not ( = ?auto_144475 ?auto_144473 ) ) ( not ( = ?auto_144468 ?auto_144473 ) ) ( not ( = ?auto_144476 ?auto_144473 ) ) ( HAVE_IMAGE ?auto_144470 ?auto_144467 ) ( HAVE_IMAGE ?auto_144471 ?auto_144472 ) ( HAVE_IMAGE ?auto_144473 ?auto_144474 ) ( not ( = ?auto_144468 ?auto_144470 ) ) ( not ( = ?auto_144468 ?auto_144471 ) ) ( not ( = ?auto_144469 ?auto_144467 ) ) ( not ( = ?auto_144469 ?auto_144472 ) ) ( not ( = ?auto_144469 ?auto_144474 ) ) ( not ( = ?auto_144470 ?auto_144471 ) ) ( not ( = ?auto_144470 ?auto_144473 ) ) ( not ( = ?auto_144470 ?auto_144475 ) ) ( not ( = ?auto_144470 ?auto_144476 ) ) ( not ( = ?auto_144467 ?auto_144472 ) ) ( not ( = ?auto_144467 ?auto_144474 ) ) ( not ( = ?auto_144467 ?auto_144477 ) ) ( not ( = ?auto_144471 ?auto_144473 ) ) ( not ( = ?auto_144471 ?auto_144475 ) ) ( not ( = ?auto_144471 ?auto_144476 ) ) ( not ( = ?auto_144472 ?auto_144474 ) ) ( not ( = ?auto_144472 ?auto_144477 ) ) ( not ( = ?auto_144474 ?auto_144477 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144476 ?auto_144477 ?auto_144468 ?auto_144469 )
      ( GET-4IMAGE-VERIFY ?auto_144468 ?auto_144469 ?auto_144470 ?auto_144467 ?auto_144471 ?auto_144472 ?auto_144473 ?auto_144474 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144503 - DIRECTION
      ?auto_144504 - MODE
      ?auto_144505 - DIRECTION
      ?auto_144502 - MODE
      ?auto_144506 - DIRECTION
      ?auto_144507 - MODE
      ?auto_144508 - DIRECTION
      ?auto_144509 - MODE
    )
    :vars
    (
      ?auto_144513 - INSTRUMENT
      ?auto_144514 - SATELLITE
      ?auto_144510 - DIRECTION
      ?auto_144511 - DIRECTION
      ?auto_144512 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_144513 ?auto_144514 ) ( SUPPORTS ?auto_144513 ?auto_144504 ) ( not ( = ?auto_144503 ?auto_144510 ) ) ( HAVE_IMAGE ?auto_144511 ?auto_144512 ) ( not ( = ?auto_144511 ?auto_144503 ) ) ( not ( = ?auto_144511 ?auto_144510 ) ) ( not ( = ?auto_144512 ?auto_144504 ) ) ( CALIBRATION_TARGET ?auto_144513 ?auto_144510 ) ( POWER_AVAIL ?auto_144514 ) ( POINTING ?auto_144514 ?auto_144506 ) ( not ( = ?auto_144510 ?auto_144506 ) ) ( not ( = ?auto_144503 ?auto_144506 ) ) ( not ( = ?auto_144511 ?auto_144506 ) ) ( HAVE_IMAGE ?auto_144505 ?auto_144502 ) ( HAVE_IMAGE ?auto_144506 ?auto_144507 ) ( HAVE_IMAGE ?auto_144508 ?auto_144509 ) ( not ( = ?auto_144503 ?auto_144505 ) ) ( not ( = ?auto_144503 ?auto_144508 ) ) ( not ( = ?auto_144504 ?auto_144502 ) ) ( not ( = ?auto_144504 ?auto_144507 ) ) ( not ( = ?auto_144504 ?auto_144509 ) ) ( not ( = ?auto_144505 ?auto_144506 ) ) ( not ( = ?auto_144505 ?auto_144508 ) ) ( not ( = ?auto_144505 ?auto_144510 ) ) ( not ( = ?auto_144505 ?auto_144511 ) ) ( not ( = ?auto_144502 ?auto_144507 ) ) ( not ( = ?auto_144502 ?auto_144509 ) ) ( not ( = ?auto_144502 ?auto_144512 ) ) ( not ( = ?auto_144506 ?auto_144508 ) ) ( not ( = ?auto_144507 ?auto_144509 ) ) ( not ( = ?auto_144507 ?auto_144512 ) ) ( not ( = ?auto_144508 ?auto_144510 ) ) ( not ( = ?auto_144508 ?auto_144511 ) ) ( not ( = ?auto_144509 ?auto_144512 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144511 ?auto_144512 ?auto_144503 ?auto_144504 )
      ( GET-4IMAGE-VERIFY ?auto_144503 ?auto_144504 ?auto_144505 ?auto_144502 ?auto_144506 ?auto_144507 ?auto_144508 ?auto_144509 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_144595 - DIRECTION
      ?auto_144596 - MODE
      ?auto_144597 - DIRECTION
      ?auto_144594 - MODE
      ?auto_144598 - DIRECTION
      ?auto_144599 - MODE
      ?auto_144600 - DIRECTION
      ?auto_144601 - MODE
    )
    :vars
    (
      ?auto_144603 - INSTRUMENT
      ?auto_144604 - SATELLITE
      ?auto_144602 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_144603 ?auto_144604 ) ( SUPPORTS ?auto_144603 ?auto_144596 ) ( not ( = ?auto_144595 ?auto_144602 ) ) ( HAVE_IMAGE ?auto_144600 ?auto_144601 ) ( not ( = ?auto_144600 ?auto_144595 ) ) ( not ( = ?auto_144600 ?auto_144602 ) ) ( not ( = ?auto_144601 ?auto_144596 ) ) ( CALIBRATION_TARGET ?auto_144603 ?auto_144602 ) ( POWER_AVAIL ?auto_144604 ) ( POINTING ?auto_144604 ?auto_144597 ) ( not ( = ?auto_144602 ?auto_144597 ) ) ( not ( = ?auto_144595 ?auto_144597 ) ) ( not ( = ?auto_144600 ?auto_144597 ) ) ( HAVE_IMAGE ?auto_144597 ?auto_144594 ) ( HAVE_IMAGE ?auto_144598 ?auto_144599 ) ( not ( = ?auto_144595 ?auto_144598 ) ) ( not ( = ?auto_144596 ?auto_144594 ) ) ( not ( = ?auto_144596 ?auto_144599 ) ) ( not ( = ?auto_144597 ?auto_144598 ) ) ( not ( = ?auto_144594 ?auto_144599 ) ) ( not ( = ?auto_144594 ?auto_144601 ) ) ( not ( = ?auto_144598 ?auto_144600 ) ) ( not ( = ?auto_144598 ?auto_144602 ) ) ( not ( = ?auto_144599 ?auto_144601 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_144600 ?auto_144601 ?auto_144595 ?auto_144596 )
      ( GET-4IMAGE-VERIFY ?auto_144595 ?auto_144596 ?auto_144597 ?auto_144594 ?auto_144598 ?auto_144599 ?auto_144600 ?auto_144601 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_145063 - DIRECTION
      ?auto_145064 - MODE
      ?auto_145065 - DIRECTION
      ?auto_145062 - MODE
      ?auto_145066 - DIRECTION
      ?auto_145067 - MODE
    )
    :vars
    (
      ?auto_145070 - INSTRUMENT
      ?auto_145069 - SATELLITE
      ?auto_145071 - DIRECTION
      ?auto_145068 - DIRECTION
      ?auto_145072 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145070 ?auto_145069 ) ( SUPPORTS ?auto_145070 ?auto_145067 ) ( not ( = ?auto_145066 ?auto_145071 ) ) ( HAVE_IMAGE ?auto_145063 ?auto_145064 ) ( not ( = ?auto_145063 ?auto_145066 ) ) ( not ( = ?auto_145063 ?auto_145071 ) ) ( not ( = ?auto_145064 ?auto_145067 ) ) ( CALIBRATION_TARGET ?auto_145070 ?auto_145071 ) ( POINTING ?auto_145069 ?auto_145068 ) ( not ( = ?auto_145071 ?auto_145068 ) ) ( not ( = ?auto_145066 ?auto_145068 ) ) ( not ( = ?auto_145063 ?auto_145068 ) ) ( ON_BOARD ?auto_145072 ?auto_145069 ) ( POWER_ON ?auto_145072 ) ( not ( = ?auto_145070 ?auto_145072 ) ) ( HAVE_IMAGE ?auto_145065 ?auto_145062 ) ( not ( = ?auto_145063 ?auto_145065 ) ) ( not ( = ?auto_145064 ?auto_145062 ) ) ( not ( = ?auto_145065 ?auto_145066 ) ) ( not ( = ?auto_145065 ?auto_145071 ) ) ( not ( = ?auto_145065 ?auto_145068 ) ) ( not ( = ?auto_145062 ?auto_145067 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145063 ?auto_145064 ?auto_145066 ?auto_145067 )
      ( GET-3IMAGE-VERIFY ?auto_145063 ?auto_145064 ?auto_145065 ?auto_145062 ?auto_145066 ?auto_145067 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_145128 - DIRECTION
      ?auto_145129 - MODE
      ?auto_145130 - DIRECTION
      ?auto_145127 - MODE
      ?auto_145131 - DIRECTION
      ?auto_145132 - MODE
    )
    :vars
    (
      ?auto_145136 - INSTRUMENT
      ?auto_145135 - SATELLITE
      ?auto_145137 - DIRECTION
      ?auto_145133 - DIRECTION
      ?auto_145139 - MODE
      ?auto_145134 - DIRECTION
      ?auto_145138 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145136 ?auto_145135 ) ( SUPPORTS ?auto_145136 ?auto_145132 ) ( not ( = ?auto_145131 ?auto_145137 ) ) ( HAVE_IMAGE ?auto_145133 ?auto_145139 ) ( not ( = ?auto_145133 ?auto_145131 ) ) ( not ( = ?auto_145133 ?auto_145137 ) ) ( not ( = ?auto_145139 ?auto_145132 ) ) ( CALIBRATION_TARGET ?auto_145136 ?auto_145137 ) ( POINTING ?auto_145135 ?auto_145134 ) ( not ( = ?auto_145137 ?auto_145134 ) ) ( not ( = ?auto_145131 ?auto_145134 ) ) ( not ( = ?auto_145133 ?auto_145134 ) ) ( ON_BOARD ?auto_145138 ?auto_145135 ) ( POWER_ON ?auto_145138 ) ( not ( = ?auto_145136 ?auto_145138 ) ) ( HAVE_IMAGE ?auto_145128 ?auto_145129 ) ( HAVE_IMAGE ?auto_145130 ?auto_145127 ) ( not ( = ?auto_145128 ?auto_145130 ) ) ( not ( = ?auto_145128 ?auto_145131 ) ) ( not ( = ?auto_145128 ?auto_145137 ) ) ( not ( = ?auto_145128 ?auto_145133 ) ) ( not ( = ?auto_145128 ?auto_145134 ) ) ( not ( = ?auto_145129 ?auto_145127 ) ) ( not ( = ?auto_145129 ?auto_145132 ) ) ( not ( = ?auto_145129 ?auto_145139 ) ) ( not ( = ?auto_145130 ?auto_145131 ) ) ( not ( = ?auto_145130 ?auto_145137 ) ) ( not ( = ?auto_145130 ?auto_145133 ) ) ( not ( = ?auto_145130 ?auto_145134 ) ) ( not ( = ?auto_145127 ?auto_145132 ) ) ( not ( = ?auto_145127 ?auto_145139 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145133 ?auto_145139 ?auto_145131 ?auto_145132 )
      ( GET-3IMAGE-VERIFY ?auto_145128 ?auto_145129 ?auto_145130 ?auto_145127 ?auto_145131 ?auto_145132 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_145153 - DIRECTION
      ?auto_145154 - MODE
      ?auto_145155 - DIRECTION
      ?auto_145152 - MODE
      ?auto_145156 - DIRECTION
      ?auto_145157 - MODE
    )
    :vars
    (
      ?auto_145161 - INSTRUMENT
      ?auto_145160 - SATELLITE
      ?auto_145162 - DIRECTION
      ?auto_145158 - DIRECTION
      ?auto_145164 - MODE
      ?auto_145159 - DIRECTION
      ?auto_145163 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145161 ?auto_145160 ) ( SUPPORTS ?auto_145161 ?auto_145152 ) ( not ( = ?auto_145155 ?auto_145162 ) ) ( HAVE_IMAGE ?auto_145158 ?auto_145164 ) ( not ( = ?auto_145158 ?auto_145155 ) ) ( not ( = ?auto_145158 ?auto_145162 ) ) ( not ( = ?auto_145164 ?auto_145152 ) ) ( CALIBRATION_TARGET ?auto_145161 ?auto_145162 ) ( POINTING ?auto_145160 ?auto_145159 ) ( not ( = ?auto_145162 ?auto_145159 ) ) ( not ( = ?auto_145155 ?auto_145159 ) ) ( not ( = ?auto_145158 ?auto_145159 ) ) ( ON_BOARD ?auto_145163 ?auto_145160 ) ( POWER_ON ?auto_145163 ) ( not ( = ?auto_145161 ?auto_145163 ) ) ( HAVE_IMAGE ?auto_145153 ?auto_145154 ) ( HAVE_IMAGE ?auto_145156 ?auto_145157 ) ( not ( = ?auto_145153 ?auto_145155 ) ) ( not ( = ?auto_145153 ?auto_145156 ) ) ( not ( = ?auto_145153 ?auto_145162 ) ) ( not ( = ?auto_145153 ?auto_145158 ) ) ( not ( = ?auto_145153 ?auto_145159 ) ) ( not ( = ?auto_145154 ?auto_145152 ) ) ( not ( = ?auto_145154 ?auto_145157 ) ) ( not ( = ?auto_145154 ?auto_145164 ) ) ( not ( = ?auto_145155 ?auto_145156 ) ) ( not ( = ?auto_145152 ?auto_145157 ) ) ( not ( = ?auto_145156 ?auto_145162 ) ) ( not ( = ?auto_145156 ?auto_145158 ) ) ( not ( = ?auto_145156 ?auto_145159 ) ) ( not ( = ?auto_145157 ?auto_145164 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145158 ?auto_145164 ?auto_145155 ?auto_145152 )
      ( GET-3IMAGE-VERIFY ?auto_145153 ?auto_145154 ?auto_145155 ?auto_145152 ?auto_145156 ?auto_145157 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_145229 - DIRECTION
      ?auto_145230 - MODE
      ?auto_145231 - DIRECTION
      ?auto_145228 - MODE
      ?auto_145232 - DIRECTION
      ?auto_145233 - MODE
    )
    :vars
    (
      ?auto_145236 - INSTRUMENT
      ?auto_145235 - SATELLITE
      ?auto_145237 - DIRECTION
      ?auto_145234 - DIRECTION
      ?auto_145239 - MODE
      ?auto_145238 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145236 ?auto_145235 ) ( SUPPORTS ?auto_145236 ?auto_145228 ) ( not ( = ?auto_145231 ?auto_145237 ) ) ( HAVE_IMAGE ?auto_145234 ?auto_145239 ) ( not ( = ?auto_145234 ?auto_145231 ) ) ( not ( = ?auto_145234 ?auto_145237 ) ) ( not ( = ?auto_145239 ?auto_145228 ) ) ( CALIBRATION_TARGET ?auto_145236 ?auto_145237 ) ( POINTING ?auto_145235 ?auto_145232 ) ( not ( = ?auto_145237 ?auto_145232 ) ) ( not ( = ?auto_145231 ?auto_145232 ) ) ( not ( = ?auto_145234 ?auto_145232 ) ) ( ON_BOARD ?auto_145238 ?auto_145235 ) ( POWER_ON ?auto_145238 ) ( not ( = ?auto_145236 ?auto_145238 ) ) ( HAVE_IMAGE ?auto_145229 ?auto_145230 ) ( HAVE_IMAGE ?auto_145232 ?auto_145233 ) ( not ( = ?auto_145229 ?auto_145231 ) ) ( not ( = ?auto_145229 ?auto_145232 ) ) ( not ( = ?auto_145229 ?auto_145237 ) ) ( not ( = ?auto_145229 ?auto_145234 ) ) ( not ( = ?auto_145230 ?auto_145228 ) ) ( not ( = ?auto_145230 ?auto_145233 ) ) ( not ( = ?auto_145230 ?auto_145239 ) ) ( not ( = ?auto_145228 ?auto_145233 ) ) ( not ( = ?auto_145233 ?auto_145239 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145234 ?auto_145239 ?auto_145231 ?auto_145228 )
      ( GET-3IMAGE-VERIFY ?auto_145229 ?auto_145230 ?auto_145231 ?auto_145228 ?auto_145232 ?auto_145233 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_145302 - DIRECTION
      ?auto_145303 - MODE
      ?auto_145304 - DIRECTION
      ?auto_145301 - MODE
      ?auto_145305 - DIRECTION
      ?auto_145306 - MODE
    )
    :vars
    (
      ?auto_145310 - INSTRUMENT
      ?auto_145309 - SATELLITE
      ?auto_145311 - DIRECTION
      ?auto_145307 - DIRECTION
      ?auto_145313 - MODE
      ?auto_145308 - DIRECTION
      ?auto_145312 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145310 ?auto_145309 ) ( SUPPORTS ?auto_145310 ?auto_145303 ) ( not ( = ?auto_145302 ?auto_145311 ) ) ( HAVE_IMAGE ?auto_145307 ?auto_145313 ) ( not ( = ?auto_145307 ?auto_145302 ) ) ( not ( = ?auto_145307 ?auto_145311 ) ) ( not ( = ?auto_145313 ?auto_145303 ) ) ( CALIBRATION_TARGET ?auto_145310 ?auto_145311 ) ( POINTING ?auto_145309 ?auto_145308 ) ( not ( = ?auto_145311 ?auto_145308 ) ) ( not ( = ?auto_145302 ?auto_145308 ) ) ( not ( = ?auto_145307 ?auto_145308 ) ) ( ON_BOARD ?auto_145312 ?auto_145309 ) ( POWER_ON ?auto_145312 ) ( not ( = ?auto_145310 ?auto_145312 ) ) ( HAVE_IMAGE ?auto_145304 ?auto_145301 ) ( HAVE_IMAGE ?auto_145305 ?auto_145306 ) ( not ( = ?auto_145302 ?auto_145304 ) ) ( not ( = ?auto_145302 ?auto_145305 ) ) ( not ( = ?auto_145303 ?auto_145301 ) ) ( not ( = ?auto_145303 ?auto_145306 ) ) ( not ( = ?auto_145304 ?auto_145305 ) ) ( not ( = ?auto_145304 ?auto_145311 ) ) ( not ( = ?auto_145304 ?auto_145307 ) ) ( not ( = ?auto_145304 ?auto_145308 ) ) ( not ( = ?auto_145301 ?auto_145306 ) ) ( not ( = ?auto_145301 ?auto_145313 ) ) ( not ( = ?auto_145305 ?auto_145311 ) ) ( not ( = ?auto_145305 ?auto_145307 ) ) ( not ( = ?auto_145305 ?auto_145308 ) ) ( not ( = ?auto_145306 ?auto_145313 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145307 ?auto_145313 ?auto_145302 ?auto_145303 )
      ( GET-3IMAGE-VERIFY ?auto_145302 ?auto_145303 ?auto_145304 ?auto_145301 ?auto_145305 ?auto_145306 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_145350 - DIRECTION
      ?auto_145351 - MODE
      ?auto_145352 - DIRECTION
      ?auto_145349 - MODE
      ?auto_145353 - DIRECTION
      ?auto_145354 - MODE
    )
    :vars
    (
      ?auto_145357 - INSTRUMENT
      ?auto_145356 - SATELLITE
      ?auto_145358 - DIRECTION
      ?auto_145355 - DIRECTION
      ?auto_145360 - MODE
      ?auto_145359 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145357 ?auto_145356 ) ( SUPPORTS ?auto_145357 ?auto_145351 ) ( not ( = ?auto_145350 ?auto_145358 ) ) ( HAVE_IMAGE ?auto_145355 ?auto_145360 ) ( not ( = ?auto_145355 ?auto_145350 ) ) ( not ( = ?auto_145355 ?auto_145358 ) ) ( not ( = ?auto_145360 ?auto_145351 ) ) ( CALIBRATION_TARGET ?auto_145357 ?auto_145358 ) ( POINTING ?auto_145356 ?auto_145352 ) ( not ( = ?auto_145358 ?auto_145352 ) ) ( not ( = ?auto_145350 ?auto_145352 ) ) ( not ( = ?auto_145355 ?auto_145352 ) ) ( ON_BOARD ?auto_145359 ?auto_145356 ) ( POWER_ON ?auto_145359 ) ( not ( = ?auto_145357 ?auto_145359 ) ) ( HAVE_IMAGE ?auto_145352 ?auto_145349 ) ( HAVE_IMAGE ?auto_145353 ?auto_145354 ) ( not ( = ?auto_145350 ?auto_145353 ) ) ( not ( = ?auto_145351 ?auto_145349 ) ) ( not ( = ?auto_145351 ?auto_145354 ) ) ( not ( = ?auto_145352 ?auto_145353 ) ) ( not ( = ?auto_145349 ?auto_145354 ) ) ( not ( = ?auto_145349 ?auto_145360 ) ) ( not ( = ?auto_145353 ?auto_145358 ) ) ( not ( = ?auto_145353 ?auto_145355 ) ) ( not ( = ?auto_145354 ?auto_145360 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145355 ?auto_145360 ?auto_145350 ?auto_145351 )
      ( GET-3IMAGE-VERIFY ?auto_145350 ?auto_145351 ?auto_145352 ?auto_145349 ?auto_145353 ?auto_145354 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145436 - DIRECTION
      ?auto_145437 - MODE
      ?auto_145438 - DIRECTION
      ?auto_145435 - MODE
      ?auto_145439 - DIRECTION
      ?auto_145440 - MODE
      ?auto_145441 - DIRECTION
      ?auto_145442 - MODE
    )
    :vars
    (
      ?auto_145445 - INSTRUMENT
      ?auto_145444 - SATELLITE
      ?auto_145446 - DIRECTION
      ?auto_145443 - DIRECTION
      ?auto_145447 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145445 ?auto_145444 ) ( SUPPORTS ?auto_145445 ?auto_145442 ) ( not ( = ?auto_145441 ?auto_145446 ) ) ( HAVE_IMAGE ?auto_145438 ?auto_145437 ) ( not ( = ?auto_145438 ?auto_145441 ) ) ( not ( = ?auto_145438 ?auto_145446 ) ) ( not ( = ?auto_145437 ?auto_145442 ) ) ( CALIBRATION_TARGET ?auto_145445 ?auto_145446 ) ( POINTING ?auto_145444 ?auto_145443 ) ( not ( = ?auto_145446 ?auto_145443 ) ) ( not ( = ?auto_145441 ?auto_145443 ) ) ( not ( = ?auto_145438 ?auto_145443 ) ) ( ON_BOARD ?auto_145447 ?auto_145444 ) ( POWER_ON ?auto_145447 ) ( not ( = ?auto_145445 ?auto_145447 ) ) ( HAVE_IMAGE ?auto_145436 ?auto_145437 ) ( HAVE_IMAGE ?auto_145438 ?auto_145435 ) ( HAVE_IMAGE ?auto_145439 ?auto_145440 ) ( not ( = ?auto_145436 ?auto_145438 ) ) ( not ( = ?auto_145436 ?auto_145439 ) ) ( not ( = ?auto_145436 ?auto_145441 ) ) ( not ( = ?auto_145436 ?auto_145446 ) ) ( not ( = ?auto_145436 ?auto_145443 ) ) ( not ( = ?auto_145437 ?auto_145435 ) ) ( not ( = ?auto_145437 ?auto_145440 ) ) ( not ( = ?auto_145438 ?auto_145439 ) ) ( not ( = ?auto_145435 ?auto_145440 ) ) ( not ( = ?auto_145435 ?auto_145442 ) ) ( not ( = ?auto_145439 ?auto_145441 ) ) ( not ( = ?auto_145439 ?auto_145446 ) ) ( not ( = ?auto_145439 ?auto_145443 ) ) ( not ( = ?auto_145440 ?auto_145442 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145438 ?auto_145437 ?auto_145441 ?auto_145442 )
      ( GET-4IMAGE-VERIFY ?auto_145436 ?auto_145437 ?auto_145438 ?auto_145435 ?auto_145439 ?auto_145440 ?auto_145441 ?auto_145442 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145474 - DIRECTION
      ?auto_145475 - MODE
      ?auto_145476 - DIRECTION
      ?auto_145473 - MODE
      ?auto_145477 - DIRECTION
      ?auto_145478 - MODE
      ?auto_145479 - DIRECTION
      ?auto_145480 - MODE
    )
    :vars
    (
      ?auto_145483 - INSTRUMENT
      ?auto_145482 - SATELLITE
      ?auto_145484 - DIRECTION
      ?auto_145481 - DIRECTION
      ?auto_145485 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145483 ?auto_145482 ) ( SUPPORTS ?auto_145483 ?auto_145478 ) ( not ( = ?auto_145477 ?auto_145484 ) ) ( HAVE_IMAGE ?auto_145476 ?auto_145475 ) ( not ( = ?auto_145476 ?auto_145477 ) ) ( not ( = ?auto_145476 ?auto_145484 ) ) ( not ( = ?auto_145475 ?auto_145478 ) ) ( CALIBRATION_TARGET ?auto_145483 ?auto_145484 ) ( POINTING ?auto_145482 ?auto_145481 ) ( not ( = ?auto_145484 ?auto_145481 ) ) ( not ( = ?auto_145477 ?auto_145481 ) ) ( not ( = ?auto_145476 ?auto_145481 ) ) ( ON_BOARD ?auto_145485 ?auto_145482 ) ( POWER_ON ?auto_145485 ) ( not ( = ?auto_145483 ?auto_145485 ) ) ( HAVE_IMAGE ?auto_145474 ?auto_145475 ) ( HAVE_IMAGE ?auto_145476 ?auto_145473 ) ( HAVE_IMAGE ?auto_145479 ?auto_145480 ) ( not ( = ?auto_145474 ?auto_145476 ) ) ( not ( = ?auto_145474 ?auto_145477 ) ) ( not ( = ?auto_145474 ?auto_145479 ) ) ( not ( = ?auto_145474 ?auto_145484 ) ) ( not ( = ?auto_145474 ?auto_145481 ) ) ( not ( = ?auto_145475 ?auto_145473 ) ) ( not ( = ?auto_145475 ?auto_145480 ) ) ( not ( = ?auto_145476 ?auto_145479 ) ) ( not ( = ?auto_145473 ?auto_145478 ) ) ( not ( = ?auto_145473 ?auto_145480 ) ) ( not ( = ?auto_145477 ?auto_145479 ) ) ( not ( = ?auto_145478 ?auto_145480 ) ) ( not ( = ?auto_145479 ?auto_145484 ) ) ( not ( = ?auto_145479 ?auto_145481 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145476 ?auto_145475 ?auto_145477 ?auto_145478 )
      ( GET-4IMAGE-VERIFY ?auto_145474 ?auto_145475 ?auto_145476 ?auto_145473 ?auto_145477 ?auto_145478 ?auto_145479 ?auto_145480 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145512 - DIRECTION
      ?auto_145513 - MODE
      ?auto_145514 - DIRECTION
      ?auto_145511 - MODE
      ?auto_145515 - DIRECTION
      ?auto_145516 - MODE
      ?auto_145517 - DIRECTION
      ?auto_145518 - MODE
    )
    :vars
    (
      ?auto_145521 - INSTRUMENT
      ?auto_145520 - SATELLITE
      ?auto_145522 - DIRECTION
      ?auto_145519 - DIRECTION
      ?auto_145523 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145521 ?auto_145520 ) ( SUPPORTS ?auto_145521 ?auto_145518 ) ( not ( = ?auto_145517 ?auto_145522 ) ) ( HAVE_IMAGE ?auto_145512 ?auto_145516 ) ( not ( = ?auto_145512 ?auto_145517 ) ) ( not ( = ?auto_145512 ?auto_145522 ) ) ( not ( = ?auto_145516 ?auto_145518 ) ) ( CALIBRATION_TARGET ?auto_145521 ?auto_145522 ) ( POINTING ?auto_145520 ?auto_145519 ) ( not ( = ?auto_145522 ?auto_145519 ) ) ( not ( = ?auto_145517 ?auto_145519 ) ) ( not ( = ?auto_145512 ?auto_145519 ) ) ( ON_BOARD ?auto_145523 ?auto_145520 ) ( POWER_ON ?auto_145523 ) ( not ( = ?auto_145521 ?auto_145523 ) ) ( HAVE_IMAGE ?auto_145512 ?auto_145513 ) ( HAVE_IMAGE ?auto_145514 ?auto_145511 ) ( HAVE_IMAGE ?auto_145515 ?auto_145516 ) ( not ( = ?auto_145512 ?auto_145514 ) ) ( not ( = ?auto_145512 ?auto_145515 ) ) ( not ( = ?auto_145513 ?auto_145511 ) ) ( not ( = ?auto_145513 ?auto_145516 ) ) ( not ( = ?auto_145513 ?auto_145518 ) ) ( not ( = ?auto_145514 ?auto_145515 ) ) ( not ( = ?auto_145514 ?auto_145517 ) ) ( not ( = ?auto_145514 ?auto_145522 ) ) ( not ( = ?auto_145514 ?auto_145519 ) ) ( not ( = ?auto_145511 ?auto_145516 ) ) ( not ( = ?auto_145511 ?auto_145518 ) ) ( not ( = ?auto_145515 ?auto_145517 ) ) ( not ( = ?auto_145515 ?auto_145522 ) ) ( not ( = ?auto_145515 ?auto_145519 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145512 ?auto_145516 ?auto_145517 ?auto_145518 )
      ( GET-4IMAGE-VERIFY ?auto_145512 ?auto_145513 ?auto_145514 ?auto_145511 ?auto_145515 ?auto_145516 ?auto_145517 ?auto_145518 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145563 - DIRECTION
      ?auto_145564 - MODE
      ?auto_145565 - DIRECTION
      ?auto_145562 - MODE
      ?auto_145566 - DIRECTION
      ?auto_145567 - MODE
      ?auto_145568 - DIRECTION
      ?auto_145569 - MODE
    )
    :vars
    (
      ?auto_145572 - INSTRUMENT
      ?auto_145571 - SATELLITE
      ?auto_145573 - DIRECTION
      ?auto_145570 - DIRECTION
      ?auto_145574 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145572 ?auto_145571 ) ( SUPPORTS ?auto_145572 ?auto_145567 ) ( not ( = ?auto_145566 ?auto_145573 ) ) ( HAVE_IMAGE ?auto_145563 ?auto_145564 ) ( not ( = ?auto_145563 ?auto_145566 ) ) ( not ( = ?auto_145563 ?auto_145573 ) ) ( not ( = ?auto_145564 ?auto_145567 ) ) ( CALIBRATION_TARGET ?auto_145572 ?auto_145573 ) ( POINTING ?auto_145571 ?auto_145570 ) ( not ( = ?auto_145573 ?auto_145570 ) ) ( not ( = ?auto_145566 ?auto_145570 ) ) ( not ( = ?auto_145563 ?auto_145570 ) ) ( ON_BOARD ?auto_145574 ?auto_145571 ) ( POWER_ON ?auto_145574 ) ( not ( = ?auto_145572 ?auto_145574 ) ) ( HAVE_IMAGE ?auto_145565 ?auto_145562 ) ( HAVE_IMAGE ?auto_145568 ?auto_145569 ) ( not ( = ?auto_145563 ?auto_145565 ) ) ( not ( = ?auto_145563 ?auto_145568 ) ) ( not ( = ?auto_145564 ?auto_145562 ) ) ( not ( = ?auto_145564 ?auto_145569 ) ) ( not ( = ?auto_145565 ?auto_145566 ) ) ( not ( = ?auto_145565 ?auto_145568 ) ) ( not ( = ?auto_145565 ?auto_145573 ) ) ( not ( = ?auto_145565 ?auto_145570 ) ) ( not ( = ?auto_145562 ?auto_145567 ) ) ( not ( = ?auto_145562 ?auto_145569 ) ) ( not ( = ?auto_145566 ?auto_145568 ) ) ( not ( = ?auto_145567 ?auto_145569 ) ) ( not ( = ?auto_145568 ?auto_145573 ) ) ( not ( = ?auto_145568 ?auto_145570 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145563 ?auto_145564 ?auto_145566 ?auto_145567 )
      ( GET-4IMAGE-VERIFY ?auto_145563 ?auto_145564 ?auto_145565 ?auto_145562 ?auto_145566 ?auto_145567 ?auto_145568 ?auto_145569 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145576 - DIRECTION
      ?auto_145577 - MODE
      ?auto_145578 - DIRECTION
      ?auto_145575 - MODE
      ?auto_145579 - DIRECTION
      ?auto_145580 - MODE
      ?auto_145581 - DIRECTION
      ?auto_145582 - MODE
    )
    :vars
    (
      ?auto_145584 - INSTRUMENT
      ?auto_145583 - SATELLITE
      ?auto_145585 - DIRECTION
      ?auto_145586 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145584 ?auto_145583 ) ( SUPPORTS ?auto_145584 ?auto_145580 ) ( not ( = ?auto_145579 ?auto_145585 ) ) ( HAVE_IMAGE ?auto_145576 ?auto_145577 ) ( not ( = ?auto_145576 ?auto_145579 ) ) ( not ( = ?auto_145576 ?auto_145585 ) ) ( not ( = ?auto_145577 ?auto_145580 ) ) ( CALIBRATION_TARGET ?auto_145584 ?auto_145585 ) ( POINTING ?auto_145583 ?auto_145581 ) ( not ( = ?auto_145585 ?auto_145581 ) ) ( not ( = ?auto_145579 ?auto_145581 ) ) ( not ( = ?auto_145576 ?auto_145581 ) ) ( ON_BOARD ?auto_145586 ?auto_145583 ) ( POWER_ON ?auto_145586 ) ( not ( = ?auto_145584 ?auto_145586 ) ) ( HAVE_IMAGE ?auto_145578 ?auto_145575 ) ( HAVE_IMAGE ?auto_145581 ?auto_145582 ) ( not ( = ?auto_145576 ?auto_145578 ) ) ( not ( = ?auto_145577 ?auto_145575 ) ) ( not ( = ?auto_145577 ?auto_145582 ) ) ( not ( = ?auto_145578 ?auto_145579 ) ) ( not ( = ?auto_145578 ?auto_145581 ) ) ( not ( = ?auto_145578 ?auto_145585 ) ) ( not ( = ?auto_145575 ?auto_145580 ) ) ( not ( = ?auto_145575 ?auto_145582 ) ) ( not ( = ?auto_145580 ?auto_145582 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145576 ?auto_145577 ?auto_145579 ?auto_145580 )
      ( GET-4IMAGE-VERIFY ?auto_145576 ?auto_145577 ?auto_145578 ?auto_145575 ?auto_145579 ?auto_145580 ?auto_145581 ?auto_145582 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145621 - DIRECTION
      ?auto_145622 - MODE
      ?auto_145623 - DIRECTION
      ?auto_145620 - MODE
      ?auto_145624 - DIRECTION
      ?auto_145625 - MODE
      ?auto_145626 - DIRECTION
      ?auto_145627 - MODE
    )
    :vars
    (
      ?auto_145629 - INSTRUMENT
      ?auto_145628 - SATELLITE
      ?auto_145630 - DIRECTION
      ?auto_145631 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145629 ?auto_145628 ) ( SUPPORTS ?auto_145629 ?auto_145627 ) ( not ( = ?auto_145626 ?auto_145630 ) ) ( HAVE_IMAGE ?auto_145621 ?auto_145622 ) ( not ( = ?auto_145621 ?auto_145626 ) ) ( not ( = ?auto_145621 ?auto_145630 ) ) ( not ( = ?auto_145622 ?auto_145627 ) ) ( CALIBRATION_TARGET ?auto_145629 ?auto_145630 ) ( POINTING ?auto_145628 ?auto_145623 ) ( not ( = ?auto_145630 ?auto_145623 ) ) ( not ( = ?auto_145626 ?auto_145623 ) ) ( not ( = ?auto_145621 ?auto_145623 ) ) ( ON_BOARD ?auto_145631 ?auto_145628 ) ( POWER_ON ?auto_145631 ) ( not ( = ?auto_145629 ?auto_145631 ) ) ( HAVE_IMAGE ?auto_145623 ?auto_145620 ) ( HAVE_IMAGE ?auto_145624 ?auto_145625 ) ( not ( = ?auto_145621 ?auto_145624 ) ) ( not ( = ?auto_145622 ?auto_145620 ) ) ( not ( = ?auto_145622 ?auto_145625 ) ) ( not ( = ?auto_145623 ?auto_145624 ) ) ( not ( = ?auto_145620 ?auto_145625 ) ) ( not ( = ?auto_145620 ?auto_145627 ) ) ( not ( = ?auto_145624 ?auto_145626 ) ) ( not ( = ?auto_145624 ?auto_145630 ) ) ( not ( = ?auto_145625 ?auto_145627 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145621 ?auto_145622 ?auto_145626 ?auto_145627 )
      ( GET-4IMAGE-VERIFY ?auto_145621 ?auto_145622 ?auto_145623 ?auto_145620 ?auto_145624 ?auto_145625 ?auto_145626 ?auto_145627 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145681 - DIRECTION
      ?auto_145682 - MODE
      ?auto_145683 - DIRECTION
      ?auto_145680 - MODE
      ?auto_145684 - DIRECTION
      ?auto_145685 - MODE
      ?auto_145686 - DIRECTION
      ?auto_145687 - MODE
    )
    :vars
    (
      ?auto_145690 - INSTRUMENT
      ?auto_145689 - SATELLITE
      ?auto_145691 - DIRECTION
      ?auto_145688 - DIRECTION
      ?auto_145692 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145690 ?auto_145689 ) ( SUPPORTS ?auto_145690 ?auto_145680 ) ( not ( = ?auto_145683 ?auto_145691 ) ) ( HAVE_IMAGE ?auto_145684 ?auto_145682 ) ( not ( = ?auto_145684 ?auto_145683 ) ) ( not ( = ?auto_145684 ?auto_145691 ) ) ( not ( = ?auto_145682 ?auto_145680 ) ) ( CALIBRATION_TARGET ?auto_145690 ?auto_145691 ) ( POINTING ?auto_145689 ?auto_145688 ) ( not ( = ?auto_145691 ?auto_145688 ) ) ( not ( = ?auto_145683 ?auto_145688 ) ) ( not ( = ?auto_145684 ?auto_145688 ) ) ( ON_BOARD ?auto_145692 ?auto_145689 ) ( POWER_ON ?auto_145692 ) ( not ( = ?auto_145690 ?auto_145692 ) ) ( HAVE_IMAGE ?auto_145681 ?auto_145682 ) ( HAVE_IMAGE ?auto_145684 ?auto_145685 ) ( HAVE_IMAGE ?auto_145686 ?auto_145687 ) ( not ( = ?auto_145681 ?auto_145683 ) ) ( not ( = ?auto_145681 ?auto_145684 ) ) ( not ( = ?auto_145681 ?auto_145686 ) ) ( not ( = ?auto_145681 ?auto_145691 ) ) ( not ( = ?auto_145681 ?auto_145688 ) ) ( not ( = ?auto_145682 ?auto_145685 ) ) ( not ( = ?auto_145682 ?auto_145687 ) ) ( not ( = ?auto_145683 ?auto_145686 ) ) ( not ( = ?auto_145680 ?auto_145685 ) ) ( not ( = ?auto_145680 ?auto_145687 ) ) ( not ( = ?auto_145684 ?auto_145686 ) ) ( not ( = ?auto_145685 ?auto_145687 ) ) ( not ( = ?auto_145686 ?auto_145691 ) ) ( not ( = ?auto_145686 ?auto_145688 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145684 ?auto_145682 ?auto_145683 ?auto_145680 )
      ( GET-4IMAGE-VERIFY ?auto_145681 ?auto_145682 ?auto_145683 ?auto_145680 ?auto_145684 ?auto_145685 ?auto_145686 ?auto_145687 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145694 - DIRECTION
      ?auto_145695 - MODE
      ?auto_145696 - DIRECTION
      ?auto_145693 - MODE
      ?auto_145697 - DIRECTION
      ?auto_145698 - MODE
      ?auto_145699 - DIRECTION
      ?auto_145700 - MODE
    )
    :vars
    (
      ?auto_145703 - INSTRUMENT
      ?auto_145702 - SATELLITE
      ?auto_145704 - DIRECTION
      ?auto_145701 - DIRECTION
      ?auto_145705 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145703 ?auto_145702 ) ( SUPPORTS ?auto_145703 ?auto_145693 ) ( not ( = ?auto_145696 ?auto_145704 ) ) ( HAVE_IMAGE ?auto_145694 ?auto_145695 ) ( not ( = ?auto_145694 ?auto_145696 ) ) ( not ( = ?auto_145694 ?auto_145704 ) ) ( not ( = ?auto_145695 ?auto_145693 ) ) ( CALIBRATION_TARGET ?auto_145703 ?auto_145704 ) ( POINTING ?auto_145702 ?auto_145701 ) ( not ( = ?auto_145704 ?auto_145701 ) ) ( not ( = ?auto_145696 ?auto_145701 ) ) ( not ( = ?auto_145694 ?auto_145701 ) ) ( ON_BOARD ?auto_145705 ?auto_145702 ) ( POWER_ON ?auto_145705 ) ( not ( = ?auto_145703 ?auto_145705 ) ) ( HAVE_IMAGE ?auto_145697 ?auto_145698 ) ( HAVE_IMAGE ?auto_145699 ?auto_145700 ) ( not ( = ?auto_145694 ?auto_145697 ) ) ( not ( = ?auto_145694 ?auto_145699 ) ) ( not ( = ?auto_145695 ?auto_145698 ) ) ( not ( = ?auto_145695 ?auto_145700 ) ) ( not ( = ?auto_145696 ?auto_145697 ) ) ( not ( = ?auto_145696 ?auto_145699 ) ) ( not ( = ?auto_145693 ?auto_145698 ) ) ( not ( = ?auto_145693 ?auto_145700 ) ) ( not ( = ?auto_145697 ?auto_145699 ) ) ( not ( = ?auto_145697 ?auto_145704 ) ) ( not ( = ?auto_145697 ?auto_145701 ) ) ( not ( = ?auto_145698 ?auto_145700 ) ) ( not ( = ?auto_145699 ?auto_145704 ) ) ( not ( = ?auto_145699 ?auto_145701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145694 ?auto_145695 ?auto_145696 ?auto_145693 )
      ( GET-4IMAGE-VERIFY ?auto_145694 ?auto_145695 ?auto_145696 ?auto_145693 ?auto_145697 ?auto_145698 ?auto_145699 ?auto_145700 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145803 - DIRECTION
      ?auto_145804 - MODE
      ?auto_145805 - DIRECTION
      ?auto_145802 - MODE
      ?auto_145806 - DIRECTION
      ?auto_145807 - MODE
      ?auto_145808 - DIRECTION
      ?auto_145809 - MODE
    )
    :vars
    (
      ?auto_145811 - INSTRUMENT
      ?auto_145810 - SATELLITE
      ?auto_145812 - DIRECTION
      ?auto_145813 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145811 ?auto_145810 ) ( SUPPORTS ?auto_145811 ?auto_145802 ) ( not ( = ?auto_145805 ?auto_145812 ) ) ( HAVE_IMAGE ?auto_145803 ?auto_145804 ) ( not ( = ?auto_145803 ?auto_145805 ) ) ( not ( = ?auto_145803 ?auto_145812 ) ) ( not ( = ?auto_145804 ?auto_145802 ) ) ( CALIBRATION_TARGET ?auto_145811 ?auto_145812 ) ( POINTING ?auto_145810 ?auto_145808 ) ( not ( = ?auto_145812 ?auto_145808 ) ) ( not ( = ?auto_145805 ?auto_145808 ) ) ( not ( = ?auto_145803 ?auto_145808 ) ) ( ON_BOARD ?auto_145813 ?auto_145810 ) ( POWER_ON ?auto_145813 ) ( not ( = ?auto_145811 ?auto_145813 ) ) ( HAVE_IMAGE ?auto_145806 ?auto_145807 ) ( HAVE_IMAGE ?auto_145808 ?auto_145809 ) ( not ( = ?auto_145803 ?auto_145806 ) ) ( not ( = ?auto_145804 ?auto_145807 ) ) ( not ( = ?auto_145804 ?auto_145809 ) ) ( not ( = ?auto_145805 ?auto_145806 ) ) ( not ( = ?auto_145802 ?auto_145807 ) ) ( not ( = ?auto_145802 ?auto_145809 ) ) ( not ( = ?auto_145806 ?auto_145808 ) ) ( not ( = ?auto_145806 ?auto_145812 ) ) ( not ( = ?auto_145807 ?auto_145809 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145803 ?auto_145804 ?auto_145805 ?auto_145802 )
      ( GET-4IMAGE-VERIFY ?auto_145803 ?auto_145804 ?auto_145805 ?auto_145802 ?auto_145806 ?auto_145807 ?auto_145808 ?auto_145809 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145878 - DIRECTION
      ?auto_145879 - MODE
      ?auto_145880 - DIRECTION
      ?auto_145877 - MODE
      ?auto_145881 - DIRECTION
      ?auto_145882 - MODE
      ?auto_145883 - DIRECTION
      ?auto_145884 - MODE
    )
    :vars
    (
      ?auto_145887 - INSTRUMENT
      ?auto_145886 - SATELLITE
      ?auto_145888 - DIRECTION
      ?auto_145885 - DIRECTION
      ?auto_145889 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145887 ?auto_145886 ) ( SUPPORTS ?auto_145887 ?auto_145884 ) ( not ( = ?auto_145883 ?auto_145888 ) ) ( HAVE_IMAGE ?auto_145881 ?auto_145882 ) ( not ( = ?auto_145881 ?auto_145883 ) ) ( not ( = ?auto_145881 ?auto_145888 ) ) ( not ( = ?auto_145882 ?auto_145884 ) ) ( CALIBRATION_TARGET ?auto_145887 ?auto_145888 ) ( POINTING ?auto_145886 ?auto_145885 ) ( not ( = ?auto_145888 ?auto_145885 ) ) ( not ( = ?auto_145883 ?auto_145885 ) ) ( not ( = ?auto_145881 ?auto_145885 ) ) ( ON_BOARD ?auto_145889 ?auto_145886 ) ( POWER_ON ?auto_145889 ) ( not ( = ?auto_145887 ?auto_145889 ) ) ( HAVE_IMAGE ?auto_145878 ?auto_145879 ) ( HAVE_IMAGE ?auto_145880 ?auto_145877 ) ( not ( = ?auto_145878 ?auto_145880 ) ) ( not ( = ?auto_145878 ?auto_145881 ) ) ( not ( = ?auto_145878 ?auto_145883 ) ) ( not ( = ?auto_145878 ?auto_145888 ) ) ( not ( = ?auto_145878 ?auto_145885 ) ) ( not ( = ?auto_145879 ?auto_145877 ) ) ( not ( = ?auto_145879 ?auto_145882 ) ) ( not ( = ?auto_145879 ?auto_145884 ) ) ( not ( = ?auto_145880 ?auto_145881 ) ) ( not ( = ?auto_145880 ?auto_145883 ) ) ( not ( = ?auto_145880 ?auto_145888 ) ) ( not ( = ?auto_145880 ?auto_145885 ) ) ( not ( = ?auto_145877 ?auto_145882 ) ) ( not ( = ?auto_145877 ?auto_145884 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145881 ?auto_145882 ?auto_145883 ?auto_145884 )
      ( GET-4IMAGE-VERIFY ?auto_145878 ?auto_145879 ?auto_145880 ?auto_145877 ?auto_145881 ?auto_145882 ?auto_145883 ?auto_145884 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145891 - DIRECTION
      ?auto_145892 - MODE
      ?auto_145893 - DIRECTION
      ?auto_145890 - MODE
      ?auto_145894 - DIRECTION
      ?auto_145895 - MODE
      ?auto_145896 - DIRECTION
      ?auto_145897 - MODE
    )
    :vars
    (
      ?auto_145900 - INSTRUMENT
      ?auto_145899 - SATELLITE
      ?auto_145901 - DIRECTION
      ?auto_145898 - DIRECTION
      ?auto_145902 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145900 ?auto_145899 ) ( SUPPORTS ?auto_145900 ?auto_145897 ) ( not ( = ?auto_145896 ?auto_145901 ) ) ( HAVE_IMAGE ?auto_145893 ?auto_145890 ) ( not ( = ?auto_145893 ?auto_145896 ) ) ( not ( = ?auto_145893 ?auto_145901 ) ) ( not ( = ?auto_145890 ?auto_145897 ) ) ( CALIBRATION_TARGET ?auto_145900 ?auto_145901 ) ( POINTING ?auto_145899 ?auto_145898 ) ( not ( = ?auto_145901 ?auto_145898 ) ) ( not ( = ?auto_145896 ?auto_145898 ) ) ( not ( = ?auto_145893 ?auto_145898 ) ) ( ON_BOARD ?auto_145902 ?auto_145899 ) ( POWER_ON ?auto_145902 ) ( not ( = ?auto_145900 ?auto_145902 ) ) ( HAVE_IMAGE ?auto_145891 ?auto_145892 ) ( HAVE_IMAGE ?auto_145894 ?auto_145895 ) ( not ( = ?auto_145891 ?auto_145893 ) ) ( not ( = ?auto_145891 ?auto_145894 ) ) ( not ( = ?auto_145891 ?auto_145896 ) ) ( not ( = ?auto_145891 ?auto_145901 ) ) ( not ( = ?auto_145891 ?auto_145898 ) ) ( not ( = ?auto_145892 ?auto_145890 ) ) ( not ( = ?auto_145892 ?auto_145895 ) ) ( not ( = ?auto_145892 ?auto_145897 ) ) ( not ( = ?auto_145893 ?auto_145894 ) ) ( not ( = ?auto_145890 ?auto_145895 ) ) ( not ( = ?auto_145894 ?auto_145896 ) ) ( not ( = ?auto_145894 ?auto_145901 ) ) ( not ( = ?auto_145894 ?auto_145898 ) ) ( not ( = ?auto_145895 ?auto_145897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145893 ?auto_145890 ?auto_145896 ?auto_145897 )
      ( GET-4IMAGE-VERIFY ?auto_145891 ?auto_145892 ?auto_145893 ?auto_145890 ?auto_145894 ?auto_145895 ?auto_145896 ?auto_145897 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145912 - DIRECTION
      ?auto_145913 - MODE
      ?auto_145914 - DIRECTION
      ?auto_145911 - MODE
      ?auto_145915 - DIRECTION
      ?auto_145916 - MODE
      ?auto_145917 - DIRECTION
      ?auto_145918 - MODE
    )
    :vars
    (
      ?auto_145921 - INSTRUMENT
      ?auto_145920 - SATELLITE
      ?auto_145922 - DIRECTION
      ?auto_145919 - DIRECTION
      ?auto_145923 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145921 ?auto_145920 ) ( SUPPORTS ?auto_145921 ?auto_145916 ) ( not ( = ?auto_145915 ?auto_145922 ) ) ( HAVE_IMAGE ?auto_145914 ?auto_145911 ) ( not ( = ?auto_145914 ?auto_145915 ) ) ( not ( = ?auto_145914 ?auto_145922 ) ) ( not ( = ?auto_145911 ?auto_145916 ) ) ( CALIBRATION_TARGET ?auto_145921 ?auto_145922 ) ( POINTING ?auto_145920 ?auto_145919 ) ( not ( = ?auto_145922 ?auto_145919 ) ) ( not ( = ?auto_145915 ?auto_145919 ) ) ( not ( = ?auto_145914 ?auto_145919 ) ) ( ON_BOARD ?auto_145923 ?auto_145920 ) ( POWER_ON ?auto_145923 ) ( not ( = ?auto_145921 ?auto_145923 ) ) ( HAVE_IMAGE ?auto_145912 ?auto_145913 ) ( HAVE_IMAGE ?auto_145917 ?auto_145918 ) ( not ( = ?auto_145912 ?auto_145914 ) ) ( not ( = ?auto_145912 ?auto_145915 ) ) ( not ( = ?auto_145912 ?auto_145917 ) ) ( not ( = ?auto_145912 ?auto_145922 ) ) ( not ( = ?auto_145912 ?auto_145919 ) ) ( not ( = ?auto_145913 ?auto_145911 ) ) ( not ( = ?auto_145913 ?auto_145916 ) ) ( not ( = ?auto_145913 ?auto_145918 ) ) ( not ( = ?auto_145914 ?auto_145917 ) ) ( not ( = ?auto_145911 ?auto_145918 ) ) ( not ( = ?auto_145915 ?auto_145917 ) ) ( not ( = ?auto_145916 ?auto_145918 ) ) ( not ( = ?auto_145917 ?auto_145922 ) ) ( not ( = ?auto_145917 ?auto_145919 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145914 ?auto_145911 ?auto_145915 ?auto_145916 )
      ( GET-4IMAGE-VERIFY ?auto_145912 ?auto_145913 ?auto_145914 ?auto_145911 ?auto_145915 ?auto_145916 ?auto_145917 ?auto_145918 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_145972 - DIRECTION
      ?auto_145973 - MODE
      ?auto_145974 - DIRECTION
      ?auto_145971 - MODE
      ?auto_145975 - DIRECTION
      ?auto_145976 - MODE
      ?auto_145977 - DIRECTION
      ?auto_145978 - MODE
    )
    :vars
    (
      ?auto_145982 - INSTRUMENT
      ?auto_145981 - SATELLITE
      ?auto_145983 - DIRECTION
      ?auto_145979 - DIRECTION
      ?auto_145985 - MODE
      ?auto_145980 - DIRECTION
      ?auto_145984 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_145982 ?auto_145981 ) ( SUPPORTS ?auto_145982 ?auto_145978 ) ( not ( = ?auto_145977 ?auto_145983 ) ) ( HAVE_IMAGE ?auto_145979 ?auto_145985 ) ( not ( = ?auto_145979 ?auto_145977 ) ) ( not ( = ?auto_145979 ?auto_145983 ) ) ( not ( = ?auto_145985 ?auto_145978 ) ) ( CALIBRATION_TARGET ?auto_145982 ?auto_145983 ) ( POINTING ?auto_145981 ?auto_145980 ) ( not ( = ?auto_145983 ?auto_145980 ) ) ( not ( = ?auto_145977 ?auto_145980 ) ) ( not ( = ?auto_145979 ?auto_145980 ) ) ( ON_BOARD ?auto_145984 ?auto_145981 ) ( POWER_ON ?auto_145984 ) ( not ( = ?auto_145982 ?auto_145984 ) ) ( HAVE_IMAGE ?auto_145972 ?auto_145973 ) ( HAVE_IMAGE ?auto_145974 ?auto_145971 ) ( HAVE_IMAGE ?auto_145975 ?auto_145976 ) ( not ( = ?auto_145972 ?auto_145974 ) ) ( not ( = ?auto_145972 ?auto_145975 ) ) ( not ( = ?auto_145972 ?auto_145977 ) ) ( not ( = ?auto_145972 ?auto_145983 ) ) ( not ( = ?auto_145972 ?auto_145979 ) ) ( not ( = ?auto_145972 ?auto_145980 ) ) ( not ( = ?auto_145973 ?auto_145971 ) ) ( not ( = ?auto_145973 ?auto_145976 ) ) ( not ( = ?auto_145973 ?auto_145978 ) ) ( not ( = ?auto_145973 ?auto_145985 ) ) ( not ( = ?auto_145974 ?auto_145975 ) ) ( not ( = ?auto_145974 ?auto_145977 ) ) ( not ( = ?auto_145974 ?auto_145983 ) ) ( not ( = ?auto_145974 ?auto_145979 ) ) ( not ( = ?auto_145974 ?auto_145980 ) ) ( not ( = ?auto_145971 ?auto_145976 ) ) ( not ( = ?auto_145971 ?auto_145978 ) ) ( not ( = ?auto_145971 ?auto_145985 ) ) ( not ( = ?auto_145975 ?auto_145977 ) ) ( not ( = ?auto_145975 ?auto_145983 ) ) ( not ( = ?auto_145975 ?auto_145979 ) ) ( not ( = ?auto_145975 ?auto_145980 ) ) ( not ( = ?auto_145976 ?auto_145978 ) ) ( not ( = ?auto_145976 ?auto_145985 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_145979 ?auto_145985 ?auto_145977 ?auto_145978 )
      ( GET-4IMAGE-VERIFY ?auto_145972 ?auto_145973 ?auto_145974 ?auto_145971 ?auto_145975 ?auto_145976 ?auto_145977 ?auto_145978 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146001 - DIRECTION
      ?auto_146002 - MODE
      ?auto_146003 - DIRECTION
      ?auto_146000 - MODE
      ?auto_146004 - DIRECTION
      ?auto_146005 - MODE
      ?auto_146006 - DIRECTION
      ?auto_146007 - MODE
    )
    :vars
    (
      ?auto_146010 - INSTRUMENT
      ?auto_146009 - SATELLITE
      ?auto_146011 - DIRECTION
      ?auto_146008 - DIRECTION
      ?auto_146012 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146010 ?auto_146009 ) ( SUPPORTS ?auto_146010 ?auto_146005 ) ( not ( = ?auto_146004 ?auto_146011 ) ) ( HAVE_IMAGE ?auto_146006 ?auto_146007 ) ( not ( = ?auto_146006 ?auto_146004 ) ) ( not ( = ?auto_146006 ?auto_146011 ) ) ( not ( = ?auto_146007 ?auto_146005 ) ) ( CALIBRATION_TARGET ?auto_146010 ?auto_146011 ) ( POINTING ?auto_146009 ?auto_146008 ) ( not ( = ?auto_146011 ?auto_146008 ) ) ( not ( = ?auto_146004 ?auto_146008 ) ) ( not ( = ?auto_146006 ?auto_146008 ) ) ( ON_BOARD ?auto_146012 ?auto_146009 ) ( POWER_ON ?auto_146012 ) ( not ( = ?auto_146010 ?auto_146012 ) ) ( HAVE_IMAGE ?auto_146001 ?auto_146002 ) ( HAVE_IMAGE ?auto_146003 ?auto_146000 ) ( not ( = ?auto_146001 ?auto_146003 ) ) ( not ( = ?auto_146001 ?auto_146004 ) ) ( not ( = ?auto_146001 ?auto_146006 ) ) ( not ( = ?auto_146001 ?auto_146011 ) ) ( not ( = ?auto_146001 ?auto_146008 ) ) ( not ( = ?auto_146002 ?auto_146000 ) ) ( not ( = ?auto_146002 ?auto_146005 ) ) ( not ( = ?auto_146002 ?auto_146007 ) ) ( not ( = ?auto_146003 ?auto_146004 ) ) ( not ( = ?auto_146003 ?auto_146006 ) ) ( not ( = ?auto_146003 ?auto_146011 ) ) ( not ( = ?auto_146003 ?auto_146008 ) ) ( not ( = ?auto_146000 ?auto_146005 ) ) ( not ( = ?auto_146000 ?auto_146007 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146006 ?auto_146007 ?auto_146004 ?auto_146005 )
      ( GET-4IMAGE-VERIFY ?auto_146001 ?auto_146002 ?auto_146003 ?auto_146000 ?auto_146004 ?auto_146005 ?auto_146006 ?auto_146007 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146014 - DIRECTION
      ?auto_146015 - MODE
      ?auto_146016 - DIRECTION
      ?auto_146013 - MODE
      ?auto_146017 - DIRECTION
      ?auto_146018 - MODE
      ?auto_146019 - DIRECTION
      ?auto_146020 - MODE
    )
    :vars
    (
      ?auto_146024 - INSTRUMENT
      ?auto_146023 - SATELLITE
      ?auto_146025 - DIRECTION
      ?auto_146021 - DIRECTION
      ?auto_146027 - MODE
      ?auto_146022 - DIRECTION
      ?auto_146026 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146024 ?auto_146023 ) ( SUPPORTS ?auto_146024 ?auto_146018 ) ( not ( = ?auto_146017 ?auto_146025 ) ) ( HAVE_IMAGE ?auto_146021 ?auto_146027 ) ( not ( = ?auto_146021 ?auto_146017 ) ) ( not ( = ?auto_146021 ?auto_146025 ) ) ( not ( = ?auto_146027 ?auto_146018 ) ) ( CALIBRATION_TARGET ?auto_146024 ?auto_146025 ) ( POINTING ?auto_146023 ?auto_146022 ) ( not ( = ?auto_146025 ?auto_146022 ) ) ( not ( = ?auto_146017 ?auto_146022 ) ) ( not ( = ?auto_146021 ?auto_146022 ) ) ( ON_BOARD ?auto_146026 ?auto_146023 ) ( POWER_ON ?auto_146026 ) ( not ( = ?auto_146024 ?auto_146026 ) ) ( HAVE_IMAGE ?auto_146014 ?auto_146015 ) ( HAVE_IMAGE ?auto_146016 ?auto_146013 ) ( HAVE_IMAGE ?auto_146019 ?auto_146020 ) ( not ( = ?auto_146014 ?auto_146016 ) ) ( not ( = ?auto_146014 ?auto_146017 ) ) ( not ( = ?auto_146014 ?auto_146019 ) ) ( not ( = ?auto_146014 ?auto_146025 ) ) ( not ( = ?auto_146014 ?auto_146021 ) ) ( not ( = ?auto_146014 ?auto_146022 ) ) ( not ( = ?auto_146015 ?auto_146013 ) ) ( not ( = ?auto_146015 ?auto_146018 ) ) ( not ( = ?auto_146015 ?auto_146020 ) ) ( not ( = ?auto_146015 ?auto_146027 ) ) ( not ( = ?auto_146016 ?auto_146017 ) ) ( not ( = ?auto_146016 ?auto_146019 ) ) ( not ( = ?auto_146016 ?auto_146025 ) ) ( not ( = ?auto_146016 ?auto_146021 ) ) ( not ( = ?auto_146016 ?auto_146022 ) ) ( not ( = ?auto_146013 ?auto_146018 ) ) ( not ( = ?auto_146013 ?auto_146020 ) ) ( not ( = ?auto_146013 ?auto_146027 ) ) ( not ( = ?auto_146017 ?auto_146019 ) ) ( not ( = ?auto_146018 ?auto_146020 ) ) ( not ( = ?auto_146019 ?auto_146025 ) ) ( not ( = ?auto_146019 ?auto_146021 ) ) ( not ( = ?auto_146019 ?auto_146022 ) ) ( not ( = ?auto_146020 ?auto_146027 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146021 ?auto_146027 ?auto_146017 ?auto_146018 )
      ( GET-4IMAGE-VERIFY ?auto_146014 ?auto_146015 ?auto_146016 ?auto_146013 ?auto_146017 ?auto_146018 ?auto_146019 ?auto_146020 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146029 - DIRECTION
      ?auto_146030 - MODE
      ?auto_146031 - DIRECTION
      ?auto_146028 - MODE
      ?auto_146032 - DIRECTION
      ?auto_146033 - MODE
      ?auto_146034 - DIRECTION
      ?auto_146035 - MODE
    )
    :vars
    (
      ?auto_146038 - INSTRUMENT
      ?auto_146037 - SATELLITE
      ?auto_146039 - DIRECTION
      ?auto_146036 - DIRECTION
      ?auto_146041 - MODE
      ?auto_146040 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146038 ?auto_146037 ) ( SUPPORTS ?auto_146038 ?auto_146033 ) ( not ( = ?auto_146032 ?auto_146039 ) ) ( HAVE_IMAGE ?auto_146036 ?auto_146041 ) ( not ( = ?auto_146036 ?auto_146032 ) ) ( not ( = ?auto_146036 ?auto_146039 ) ) ( not ( = ?auto_146041 ?auto_146033 ) ) ( CALIBRATION_TARGET ?auto_146038 ?auto_146039 ) ( POINTING ?auto_146037 ?auto_146034 ) ( not ( = ?auto_146039 ?auto_146034 ) ) ( not ( = ?auto_146032 ?auto_146034 ) ) ( not ( = ?auto_146036 ?auto_146034 ) ) ( ON_BOARD ?auto_146040 ?auto_146037 ) ( POWER_ON ?auto_146040 ) ( not ( = ?auto_146038 ?auto_146040 ) ) ( HAVE_IMAGE ?auto_146029 ?auto_146030 ) ( HAVE_IMAGE ?auto_146031 ?auto_146028 ) ( HAVE_IMAGE ?auto_146034 ?auto_146035 ) ( not ( = ?auto_146029 ?auto_146031 ) ) ( not ( = ?auto_146029 ?auto_146032 ) ) ( not ( = ?auto_146029 ?auto_146034 ) ) ( not ( = ?auto_146029 ?auto_146039 ) ) ( not ( = ?auto_146029 ?auto_146036 ) ) ( not ( = ?auto_146030 ?auto_146028 ) ) ( not ( = ?auto_146030 ?auto_146033 ) ) ( not ( = ?auto_146030 ?auto_146035 ) ) ( not ( = ?auto_146030 ?auto_146041 ) ) ( not ( = ?auto_146031 ?auto_146032 ) ) ( not ( = ?auto_146031 ?auto_146034 ) ) ( not ( = ?auto_146031 ?auto_146039 ) ) ( not ( = ?auto_146031 ?auto_146036 ) ) ( not ( = ?auto_146028 ?auto_146033 ) ) ( not ( = ?auto_146028 ?auto_146035 ) ) ( not ( = ?auto_146028 ?auto_146041 ) ) ( not ( = ?auto_146033 ?auto_146035 ) ) ( not ( = ?auto_146035 ?auto_146041 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146036 ?auto_146041 ?auto_146032 ?auto_146033 )
      ( GET-4IMAGE-VERIFY ?auto_146029 ?auto_146030 ?auto_146031 ?auto_146028 ?auto_146032 ?auto_146033 ?auto_146034 ?auto_146035 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146066 - DIRECTION
      ?auto_146067 - MODE
      ?auto_146068 - DIRECTION
      ?auto_146065 - MODE
      ?auto_146069 - DIRECTION
      ?auto_146070 - MODE
      ?auto_146071 - DIRECTION
      ?auto_146072 - MODE
    )
    :vars
    (
      ?auto_146075 - INSTRUMENT
      ?auto_146074 - SATELLITE
      ?auto_146076 - DIRECTION
      ?auto_146073 - DIRECTION
      ?auto_146078 - MODE
      ?auto_146077 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146075 ?auto_146074 ) ( SUPPORTS ?auto_146075 ?auto_146072 ) ( not ( = ?auto_146071 ?auto_146076 ) ) ( HAVE_IMAGE ?auto_146073 ?auto_146078 ) ( not ( = ?auto_146073 ?auto_146071 ) ) ( not ( = ?auto_146073 ?auto_146076 ) ) ( not ( = ?auto_146078 ?auto_146072 ) ) ( CALIBRATION_TARGET ?auto_146075 ?auto_146076 ) ( POINTING ?auto_146074 ?auto_146068 ) ( not ( = ?auto_146076 ?auto_146068 ) ) ( not ( = ?auto_146071 ?auto_146068 ) ) ( not ( = ?auto_146073 ?auto_146068 ) ) ( ON_BOARD ?auto_146077 ?auto_146074 ) ( POWER_ON ?auto_146077 ) ( not ( = ?auto_146075 ?auto_146077 ) ) ( HAVE_IMAGE ?auto_146066 ?auto_146067 ) ( HAVE_IMAGE ?auto_146068 ?auto_146065 ) ( HAVE_IMAGE ?auto_146069 ?auto_146070 ) ( not ( = ?auto_146066 ?auto_146068 ) ) ( not ( = ?auto_146066 ?auto_146069 ) ) ( not ( = ?auto_146066 ?auto_146071 ) ) ( not ( = ?auto_146066 ?auto_146076 ) ) ( not ( = ?auto_146066 ?auto_146073 ) ) ( not ( = ?auto_146067 ?auto_146065 ) ) ( not ( = ?auto_146067 ?auto_146070 ) ) ( not ( = ?auto_146067 ?auto_146072 ) ) ( not ( = ?auto_146067 ?auto_146078 ) ) ( not ( = ?auto_146068 ?auto_146069 ) ) ( not ( = ?auto_146065 ?auto_146070 ) ) ( not ( = ?auto_146065 ?auto_146072 ) ) ( not ( = ?auto_146065 ?auto_146078 ) ) ( not ( = ?auto_146069 ?auto_146071 ) ) ( not ( = ?auto_146069 ?auto_146076 ) ) ( not ( = ?auto_146069 ?auto_146073 ) ) ( not ( = ?auto_146070 ?auto_146072 ) ) ( not ( = ?auto_146070 ?auto_146078 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146073 ?auto_146078 ?auto_146071 ?auto_146072 )
      ( GET-4IMAGE-VERIFY ?auto_146066 ?auto_146067 ?auto_146068 ?auto_146065 ?auto_146069 ?auto_146070 ?auto_146071 ?auto_146072 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146102 - DIRECTION
      ?auto_146103 - MODE
      ?auto_146104 - DIRECTION
      ?auto_146101 - MODE
      ?auto_146105 - DIRECTION
      ?auto_146106 - MODE
      ?auto_146107 - DIRECTION
      ?auto_146108 - MODE
    )
    :vars
    (
      ?auto_146111 - INSTRUMENT
      ?auto_146110 - SATELLITE
      ?auto_146112 - DIRECTION
      ?auto_146109 - DIRECTION
      ?auto_146114 - MODE
      ?auto_146113 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146111 ?auto_146110 ) ( SUPPORTS ?auto_146111 ?auto_146106 ) ( not ( = ?auto_146105 ?auto_146112 ) ) ( HAVE_IMAGE ?auto_146109 ?auto_146114 ) ( not ( = ?auto_146109 ?auto_146105 ) ) ( not ( = ?auto_146109 ?auto_146112 ) ) ( not ( = ?auto_146114 ?auto_146106 ) ) ( CALIBRATION_TARGET ?auto_146111 ?auto_146112 ) ( POINTING ?auto_146110 ?auto_146104 ) ( not ( = ?auto_146112 ?auto_146104 ) ) ( not ( = ?auto_146105 ?auto_146104 ) ) ( not ( = ?auto_146109 ?auto_146104 ) ) ( ON_BOARD ?auto_146113 ?auto_146110 ) ( POWER_ON ?auto_146113 ) ( not ( = ?auto_146111 ?auto_146113 ) ) ( HAVE_IMAGE ?auto_146102 ?auto_146103 ) ( HAVE_IMAGE ?auto_146104 ?auto_146101 ) ( HAVE_IMAGE ?auto_146107 ?auto_146108 ) ( not ( = ?auto_146102 ?auto_146104 ) ) ( not ( = ?auto_146102 ?auto_146105 ) ) ( not ( = ?auto_146102 ?auto_146107 ) ) ( not ( = ?auto_146102 ?auto_146112 ) ) ( not ( = ?auto_146102 ?auto_146109 ) ) ( not ( = ?auto_146103 ?auto_146101 ) ) ( not ( = ?auto_146103 ?auto_146106 ) ) ( not ( = ?auto_146103 ?auto_146108 ) ) ( not ( = ?auto_146103 ?auto_146114 ) ) ( not ( = ?auto_146104 ?auto_146107 ) ) ( not ( = ?auto_146101 ?auto_146106 ) ) ( not ( = ?auto_146101 ?auto_146108 ) ) ( not ( = ?auto_146101 ?auto_146114 ) ) ( not ( = ?auto_146105 ?auto_146107 ) ) ( not ( = ?auto_146106 ?auto_146108 ) ) ( not ( = ?auto_146107 ?auto_146112 ) ) ( not ( = ?auto_146107 ?auto_146109 ) ) ( not ( = ?auto_146108 ?auto_146114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146109 ?auto_146114 ?auto_146105 ?auto_146106 )
      ( GET-4IMAGE-VERIFY ?auto_146102 ?auto_146103 ?auto_146104 ?auto_146101 ?auto_146105 ?auto_146106 ?auto_146107 ?auto_146108 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146144 - DIRECTION
      ?auto_146145 - MODE
      ?auto_146146 - DIRECTION
      ?auto_146143 - MODE
      ?auto_146147 - DIRECTION
      ?auto_146148 - MODE
      ?auto_146149 - DIRECTION
      ?auto_146150 - MODE
    )
    :vars
    (
      ?auto_146153 - INSTRUMENT
      ?auto_146152 - SATELLITE
      ?auto_146154 - DIRECTION
      ?auto_146151 - DIRECTION
      ?auto_146155 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146153 ?auto_146152 ) ( SUPPORTS ?auto_146153 ?auto_146143 ) ( not ( = ?auto_146146 ?auto_146154 ) ) ( HAVE_IMAGE ?auto_146147 ?auto_146148 ) ( not ( = ?auto_146147 ?auto_146146 ) ) ( not ( = ?auto_146147 ?auto_146154 ) ) ( not ( = ?auto_146148 ?auto_146143 ) ) ( CALIBRATION_TARGET ?auto_146153 ?auto_146154 ) ( POINTING ?auto_146152 ?auto_146151 ) ( not ( = ?auto_146154 ?auto_146151 ) ) ( not ( = ?auto_146146 ?auto_146151 ) ) ( not ( = ?auto_146147 ?auto_146151 ) ) ( ON_BOARD ?auto_146155 ?auto_146152 ) ( POWER_ON ?auto_146155 ) ( not ( = ?auto_146153 ?auto_146155 ) ) ( HAVE_IMAGE ?auto_146144 ?auto_146145 ) ( HAVE_IMAGE ?auto_146149 ?auto_146150 ) ( not ( = ?auto_146144 ?auto_146146 ) ) ( not ( = ?auto_146144 ?auto_146147 ) ) ( not ( = ?auto_146144 ?auto_146149 ) ) ( not ( = ?auto_146144 ?auto_146154 ) ) ( not ( = ?auto_146144 ?auto_146151 ) ) ( not ( = ?auto_146145 ?auto_146143 ) ) ( not ( = ?auto_146145 ?auto_146148 ) ) ( not ( = ?auto_146145 ?auto_146150 ) ) ( not ( = ?auto_146146 ?auto_146149 ) ) ( not ( = ?auto_146143 ?auto_146150 ) ) ( not ( = ?auto_146147 ?auto_146149 ) ) ( not ( = ?auto_146148 ?auto_146150 ) ) ( not ( = ?auto_146149 ?auto_146154 ) ) ( not ( = ?auto_146149 ?auto_146151 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146147 ?auto_146148 ?auto_146146 ?auto_146143 )
      ( GET-4IMAGE-VERIFY ?auto_146144 ?auto_146145 ?auto_146146 ?auto_146143 ?auto_146147 ?auto_146148 ?auto_146149 ?auto_146150 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146191 - DIRECTION
      ?auto_146192 - MODE
      ?auto_146193 - DIRECTION
      ?auto_146190 - MODE
      ?auto_146194 - DIRECTION
      ?auto_146195 - MODE
      ?auto_146196 - DIRECTION
      ?auto_146197 - MODE
    )
    :vars
    (
      ?auto_146200 - INSTRUMENT
      ?auto_146199 - SATELLITE
      ?auto_146201 - DIRECTION
      ?auto_146198 - DIRECTION
      ?auto_146202 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146200 ?auto_146199 ) ( SUPPORTS ?auto_146200 ?auto_146190 ) ( not ( = ?auto_146193 ?auto_146201 ) ) ( HAVE_IMAGE ?auto_146196 ?auto_146197 ) ( not ( = ?auto_146196 ?auto_146193 ) ) ( not ( = ?auto_146196 ?auto_146201 ) ) ( not ( = ?auto_146197 ?auto_146190 ) ) ( CALIBRATION_TARGET ?auto_146200 ?auto_146201 ) ( POINTING ?auto_146199 ?auto_146198 ) ( not ( = ?auto_146201 ?auto_146198 ) ) ( not ( = ?auto_146193 ?auto_146198 ) ) ( not ( = ?auto_146196 ?auto_146198 ) ) ( ON_BOARD ?auto_146202 ?auto_146199 ) ( POWER_ON ?auto_146202 ) ( not ( = ?auto_146200 ?auto_146202 ) ) ( HAVE_IMAGE ?auto_146191 ?auto_146192 ) ( HAVE_IMAGE ?auto_146194 ?auto_146195 ) ( not ( = ?auto_146191 ?auto_146193 ) ) ( not ( = ?auto_146191 ?auto_146194 ) ) ( not ( = ?auto_146191 ?auto_146196 ) ) ( not ( = ?auto_146191 ?auto_146201 ) ) ( not ( = ?auto_146191 ?auto_146198 ) ) ( not ( = ?auto_146192 ?auto_146190 ) ) ( not ( = ?auto_146192 ?auto_146195 ) ) ( not ( = ?auto_146192 ?auto_146197 ) ) ( not ( = ?auto_146193 ?auto_146194 ) ) ( not ( = ?auto_146190 ?auto_146195 ) ) ( not ( = ?auto_146194 ?auto_146196 ) ) ( not ( = ?auto_146194 ?auto_146201 ) ) ( not ( = ?auto_146194 ?auto_146198 ) ) ( not ( = ?auto_146195 ?auto_146197 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146196 ?auto_146197 ?auto_146193 ?auto_146190 )
      ( GET-4IMAGE-VERIFY ?auto_146191 ?auto_146192 ?auto_146193 ?auto_146190 ?auto_146194 ?auto_146195 ?auto_146196 ?auto_146197 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146204 - DIRECTION
      ?auto_146205 - MODE
      ?auto_146206 - DIRECTION
      ?auto_146203 - MODE
      ?auto_146207 - DIRECTION
      ?auto_146208 - MODE
      ?auto_146209 - DIRECTION
      ?auto_146210 - MODE
    )
    :vars
    (
      ?auto_146214 - INSTRUMENT
      ?auto_146213 - SATELLITE
      ?auto_146215 - DIRECTION
      ?auto_146211 - DIRECTION
      ?auto_146217 - MODE
      ?auto_146212 - DIRECTION
      ?auto_146216 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146214 ?auto_146213 ) ( SUPPORTS ?auto_146214 ?auto_146203 ) ( not ( = ?auto_146206 ?auto_146215 ) ) ( HAVE_IMAGE ?auto_146211 ?auto_146217 ) ( not ( = ?auto_146211 ?auto_146206 ) ) ( not ( = ?auto_146211 ?auto_146215 ) ) ( not ( = ?auto_146217 ?auto_146203 ) ) ( CALIBRATION_TARGET ?auto_146214 ?auto_146215 ) ( POINTING ?auto_146213 ?auto_146212 ) ( not ( = ?auto_146215 ?auto_146212 ) ) ( not ( = ?auto_146206 ?auto_146212 ) ) ( not ( = ?auto_146211 ?auto_146212 ) ) ( ON_BOARD ?auto_146216 ?auto_146213 ) ( POWER_ON ?auto_146216 ) ( not ( = ?auto_146214 ?auto_146216 ) ) ( HAVE_IMAGE ?auto_146204 ?auto_146205 ) ( HAVE_IMAGE ?auto_146207 ?auto_146208 ) ( HAVE_IMAGE ?auto_146209 ?auto_146210 ) ( not ( = ?auto_146204 ?auto_146206 ) ) ( not ( = ?auto_146204 ?auto_146207 ) ) ( not ( = ?auto_146204 ?auto_146209 ) ) ( not ( = ?auto_146204 ?auto_146215 ) ) ( not ( = ?auto_146204 ?auto_146211 ) ) ( not ( = ?auto_146204 ?auto_146212 ) ) ( not ( = ?auto_146205 ?auto_146203 ) ) ( not ( = ?auto_146205 ?auto_146208 ) ) ( not ( = ?auto_146205 ?auto_146210 ) ) ( not ( = ?auto_146205 ?auto_146217 ) ) ( not ( = ?auto_146206 ?auto_146207 ) ) ( not ( = ?auto_146206 ?auto_146209 ) ) ( not ( = ?auto_146203 ?auto_146208 ) ) ( not ( = ?auto_146203 ?auto_146210 ) ) ( not ( = ?auto_146207 ?auto_146209 ) ) ( not ( = ?auto_146207 ?auto_146215 ) ) ( not ( = ?auto_146207 ?auto_146211 ) ) ( not ( = ?auto_146207 ?auto_146212 ) ) ( not ( = ?auto_146208 ?auto_146210 ) ) ( not ( = ?auto_146208 ?auto_146217 ) ) ( not ( = ?auto_146209 ?auto_146215 ) ) ( not ( = ?auto_146209 ?auto_146211 ) ) ( not ( = ?auto_146209 ?auto_146212 ) ) ( not ( = ?auto_146210 ?auto_146217 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146211 ?auto_146217 ?auto_146206 ?auto_146203 )
      ( GET-4IMAGE-VERIFY ?auto_146204 ?auto_146205 ?auto_146206 ?auto_146203 ?auto_146207 ?auto_146208 ?auto_146209 ?auto_146210 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146219 - DIRECTION
      ?auto_146220 - MODE
      ?auto_146221 - DIRECTION
      ?auto_146218 - MODE
      ?auto_146222 - DIRECTION
      ?auto_146223 - MODE
      ?auto_146224 - DIRECTION
      ?auto_146225 - MODE
    )
    :vars
    (
      ?auto_146228 - INSTRUMENT
      ?auto_146227 - SATELLITE
      ?auto_146229 - DIRECTION
      ?auto_146226 - DIRECTION
      ?auto_146231 - MODE
      ?auto_146230 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146228 ?auto_146227 ) ( SUPPORTS ?auto_146228 ?auto_146218 ) ( not ( = ?auto_146221 ?auto_146229 ) ) ( HAVE_IMAGE ?auto_146226 ?auto_146231 ) ( not ( = ?auto_146226 ?auto_146221 ) ) ( not ( = ?auto_146226 ?auto_146229 ) ) ( not ( = ?auto_146231 ?auto_146218 ) ) ( CALIBRATION_TARGET ?auto_146228 ?auto_146229 ) ( POINTING ?auto_146227 ?auto_146224 ) ( not ( = ?auto_146229 ?auto_146224 ) ) ( not ( = ?auto_146221 ?auto_146224 ) ) ( not ( = ?auto_146226 ?auto_146224 ) ) ( ON_BOARD ?auto_146230 ?auto_146227 ) ( POWER_ON ?auto_146230 ) ( not ( = ?auto_146228 ?auto_146230 ) ) ( HAVE_IMAGE ?auto_146219 ?auto_146220 ) ( HAVE_IMAGE ?auto_146222 ?auto_146223 ) ( HAVE_IMAGE ?auto_146224 ?auto_146225 ) ( not ( = ?auto_146219 ?auto_146221 ) ) ( not ( = ?auto_146219 ?auto_146222 ) ) ( not ( = ?auto_146219 ?auto_146224 ) ) ( not ( = ?auto_146219 ?auto_146229 ) ) ( not ( = ?auto_146219 ?auto_146226 ) ) ( not ( = ?auto_146220 ?auto_146218 ) ) ( not ( = ?auto_146220 ?auto_146223 ) ) ( not ( = ?auto_146220 ?auto_146225 ) ) ( not ( = ?auto_146220 ?auto_146231 ) ) ( not ( = ?auto_146221 ?auto_146222 ) ) ( not ( = ?auto_146218 ?auto_146223 ) ) ( not ( = ?auto_146218 ?auto_146225 ) ) ( not ( = ?auto_146222 ?auto_146224 ) ) ( not ( = ?auto_146222 ?auto_146229 ) ) ( not ( = ?auto_146222 ?auto_146226 ) ) ( not ( = ?auto_146223 ?auto_146225 ) ) ( not ( = ?auto_146223 ?auto_146231 ) ) ( not ( = ?auto_146225 ?auto_146231 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146226 ?auto_146231 ?auto_146221 ?auto_146218 )
      ( GET-4IMAGE-VERIFY ?auto_146219 ?auto_146220 ?auto_146221 ?auto_146218 ?auto_146222 ?auto_146223 ?auto_146224 ?auto_146225 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146443 - DIRECTION
      ?auto_146444 - MODE
      ?auto_146445 - DIRECTION
      ?auto_146442 - MODE
      ?auto_146446 - DIRECTION
      ?auto_146447 - MODE
      ?auto_146448 - DIRECTION
      ?auto_146449 - MODE
    )
    :vars
    (
      ?auto_146452 - INSTRUMENT
      ?auto_146451 - SATELLITE
      ?auto_146453 - DIRECTION
      ?auto_146450 - DIRECTION
      ?auto_146455 - MODE
      ?auto_146454 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146452 ?auto_146451 ) ( SUPPORTS ?auto_146452 ?auto_146449 ) ( not ( = ?auto_146448 ?auto_146453 ) ) ( HAVE_IMAGE ?auto_146450 ?auto_146455 ) ( not ( = ?auto_146450 ?auto_146448 ) ) ( not ( = ?auto_146450 ?auto_146453 ) ) ( not ( = ?auto_146455 ?auto_146449 ) ) ( CALIBRATION_TARGET ?auto_146452 ?auto_146453 ) ( POINTING ?auto_146451 ?auto_146443 ) ( not ( = ?auto_146453 ?auto_146443 ) ) ( not ( = ?auto_146448 ?auto_146443 ) ) ( not ( = ?auto_146450 ?auto_146443 ) ) ( ON_BOARD ?auto_146454 ?auto_146451 ) ( POWER_ON ?auto_146454 ) ( not ( = ?auto_146452 ?auto_146454 ) ) ( HAVE_IMAGE ?auto_146443 ?auto_146444 ) ( HAVE_IMAGE ?auto_146445 ?auto_146442 ) ( HAVE_IMAGE ?auto_146446 ?auto_146447 ) ( not ( = ?auto_146443 ?auto_146445 ) ) ( not ( = ?auto_146443 ?auto_146446 ) ) ( not ( = ?auto_146444 ?auto_146442 ) ) ( not ( = ?auto_146444 ?auto_146447 ) ) ( not ( = ?auto_146444 ?auto_146449 ) ) ( not ( = ?auto_146444 ?auto_146455 ) ) ( not ( = ?auto_146445 ?auto_146446 ) ) ( not ( = ?auto_146445 ?auto_146448 ) ) ( not ( = ?auto_146445 ?auto_146453 ) ) ( not ( = ?auto_146445 ?auto_146450 ) ) ( not ( = ?auto_146442 ?auto_146447 ) ) ( not ( = ?auto_146442 ?auto_146449 ) ) ( not ( = ?auto_146442 ?auto_146455 ) ) ( not ( = ?auto_146446 ?auto_146448 ) ) ( not ( = ?auto_146446 ?auto_146453 ) ) ( not ( = ?auto_146446 ?auto_146450 ) ) ( not ( = ?auto_146447 ?auto_146449 ) ) ( not ( = ?auto_146447 ?auto_146455 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146450 ?auto_146455 ?auto_146448 ?auto_146449 )
      ( GET-4IMAGE-VERIFY ?auto_146443 ?auto_146444 ?auto_146445 ?auto_146442 ?auto_146446 ?auto_146447 ?auto_146448 ?auto_146449 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146561 - DIRECTION
      ?auto_146562 - MODE
      ?auto_146563 - DIRECTION
      ?auto_146560 - MODE
      ?auto_146564 - DIRECTION
      ?auto_146565 - MODE
      ?auto_146566 - DIRECTION
      ?auto_146567 - MODE
    )
    :vars
    (
      ?auto_146569 - INSTRUMENT
      ?auto_146568 - SATELLITE
      ?auto_146570 - DIRECTION
      ?auto_146571 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146569 ?auto_146568 ) ( SUPPORTS ?auto_146569 ?auto_146565 ) ( not ( = ?auto_146564 ?auto_146570 ) ) ( HAVE_IMAGE ?auto_146566 ?auto_146567 ) ( not ( = ?auto_146566 ?auto_146564 ) ) ( not ( = ?auto_146566 ?auto_146570 ) ) ( not ( = ?auto_146567 ?auto_146565 ) ) ( CALIBRATION_TARGET ?auto_146569 ?auto_146570 ) ( POINTING ?auto_146568 ?auto_146563 ) ( not ( = ?auto_146570 ?auto_146563 ) ) ( not ( = ?auto_146564 ?auto_146563 ) ) ( not ( = ?auto_146566 ?auto_146563 ) ) ( ON_BOARD ?auto_146571 ?auto_146568 ) ( POWER_ON ?auto_146571 ) ( not ( = ?auto_146569 ?auto_146571 ) ) ( HAVE_IMAGE ?auto_146561 ?auto_146562 ) ( HAVE_IMAGE ?auto_146563 ?auto_146560 ) ( not ( = ?auto_146561 ?auto_146563 ) ) ( not ( = ?auto_146561 ?auto_146564 ) ) ( not ( = ?auto_146561 ?auto_146566 ) ) ( not ( = ?auto_146561 ?auto_146570 ) ) ( not ( = ?auto_146562 ?auto_146560 ) ) ( not ( = ?auto_146562 ?auto_146565 ) ) ( not ( = ?auto_146562 ?auto_146567 ) ) ( not ( = ?auto_146560 ?auto_146565 ) ) ( not ( = ?auto_146560 ?auto_146567 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146566 ?auto_146567 ?auto_146564 ?auto_146565 )
      ( GET-4IMAGE-VERIFY ?auto_146561 ?auto_146562 ?auto_146563 ?auto_146560 ?auto_146564 ?auto_146565 ?auto_146566 ?auto_146567 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146671 - DIRECTION
      ?auto_146672 - MODE
      ?auto_146673 - DIRECTION
      ?auto_146670 - MODE
      ?auto_146674 - DIRECTION
      ?auto_146675 - MODE
      ?auto_146676 - DIRECTION
      ?auto_146677 - MODE
    )
    :vars
    (
      ?auto_146680 - INSTRUMENT
      ?auto_146679 - SATELLITE
      ?auto_146681 - DIRECTION
      ?auto_146678 - DIRECTION
      ?auto_146683 - MODE
      ?auto_146682 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146680 ?auto_146679 ) ( SUPPORTS ?auto_146680 ?auto_146670 ) ( not ( = ?auto_146673 ?auto_146681 ) ) ( HAVE_IMAGE ?auto_146678 ?auto_146683 ) ( not ( = ?auto_146678 ?auto_146673 ) ) ( not ( = ?auto_146678 ?auto_146681 ) ) ( not ( = ?auto_146683 ?auto_146670 ) ) ( CALIBRATION_TARGET ?auto_146680 ?auto_146681 ) ( POINTING ?auto_146679 ?auto_146671 ) ( not ( = ?auto_146681 ?auto_146671 ) ) ( not ( = ?auto_146673 ?auto_146671 ) ) ( not ( = ?auto_146678 ?auto_146671 ) ) ( ON_BOARD ?auto_146682 ?auto_146679 ) ( POWER_ON ?auto_146682 ) ( not ( = ?auto_146680 ?auto_146682 ) ) ( HAVE_IMAGE ?auto_146671 ?auto_146672 ) ( HAVE_IMAGE ?auto_146674 ?auto_146675 ) ( HAVE_IMAGE ?auto_146676 ?auto_146677 ) ( not ( = ?auto_146671 ?auto_146674 ) ) ( not ( = ?auto_146671 ?auto_146676 ) ) ( not ( = ?auto_146672 ?auto_146670 ) ) ( not ( = ?auto_146672 ?auto_146675 ) ) ( not ( = ?auto_146672 ?auto_146677 ) ) ( not ( = ?auto_146672 ?auto_146683 ) ) ( not ( = ?auto_146673 ?auto_146674 ) ) ( not ( = ?auto_146673 ?auto_146676 ) ) ( not ( = ?auto_146670 ?auto_146675 ) ) ( not ( = ?auto_146670 ?auto_146677 ) ) ( not ( = ?auto_146674 ?auto_146676 ) ) ( not ( = ?auto_146674 ?auto_146681 ) ) ( not ( = ?auto_146674 ?auto_146678 ) ) ( not ( = ?auto_146675 ?auto_146677 ) ) ( not ( = ?auto_146675 ?auto_146683 ) ) ( not ( = ?auto_146676 ?auto_146681 ) ) ( not ( = ?auto_146676 ?auto_146678 ) ) ( not ( = ?auto_146677 ?auto_146683 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146678 ?auto_146683 ?auto_146673 ?auto_146670 )
      ( GET-4IMAGE-VERIFY ?auto_146671 ?auto_146672 ?auto_146673 ?auto_146670 ?auto_146674 ?auto_146675 ?auto_146676 ?auto_146677 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146713 - DIRECTION
      ?auto_146714 - MODE
      ?auto_146715 - DIRECTION
      ?auto_146712 - MODE
      ?auto_146716 - DIRECTION
      ?auto_146717 - MODE
      ?auto_146718 - DIRECTION
      ?auto_146719 - MODE
    )
    :vars
    (
      ?auto_146721 - INSTRUMENT
      ?auto_146720 - SATELLITE
      ?auto_146722 - DIRECTION
      ?auto_146723 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146721 ?auto_146720 ) ( SUPPORTS ?auto_146721 ?auto_146712 ) ( not ( = ?auto_146715 ?auto_146722 ) ) ( HAVE_IMAGE ?auto_146718 ?auto_146719 ) ( not ( = ?auto_146718 ?auto_146715 ) ) ( not ( = ?auto_146718 ?auto_146722 ) ) ( not ( = ?auto_146719 ?auto_146712 ) ) ( CALIBRATION_TARGET ?auto_146721 ?auto_146722 ) ( POINTING ?auto_146720 ?auto_146716 ) ( not ( = ?auto_146722 ?auto_146716 ) ) ( not ( = ?auto_146715 ?auto_146716 ) ) ( not ( = ?auto_146718 ?auto_146716 ) ) ( ON_BOARD ?auto_146723 ?auto_146720 ) ( POWER_ON ?auto_146723 ) ( not ( = ?auto_146721 ?auto_146723 ) ) ( HAVE_IMAGE ?auto_146713 ?auto_146714 ) ( HAVE_IMAGE ?auto_146716 ?auto_146717 ) ( not ( = ?auto_146713 ?auto_146715 ) ) ( not ( = ?auto_146713 ?auto_146716 ) ) ( not ( = ?auto_146713 ?auto_146718 ) ) ( not ( = ?auto_146713 ?auto_146722 ) ) ( not ( = ?auto_146714 ?auto_146712 ) ) ( not ( = ?auto_146714 ?auto_146717 ) ) ( not ( = ?auto_146714 ?auto_146719 ) ) ( not ( = ?auto_146712 ?auto_146717 ) ) ( not ( = ?auto_146717 ?auto_146719 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146718 ?auto_146719 ?auto_146715 ?auto_146712 )
      ( GET-4IMAGE-VERIFY ?auto_146713 ?auto_146714 ?auto_146715 ?auto_146712 ?auto_146716 ?auto_146717 ?auto_146718 ?auto_146719 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146821 - DIRECTION
      ?auto_146822 - MODE
      ?auto_146823 - DIRECTION
      ?auto_146820 - MODE
      ?auto_146824 - DIRECTION
      ?auto_146825 - MODE
      ?auto_146826 - DIRECTION
      ?auto_146827 - MODE
    )
    :vars
    (
      ?auto_146830 - INSTRUMENT
      ?auto_146829 - SATELLITE
      ?auto_146831 - DIRECTION
      ?auto_146828 - DIRECTION
      ?auto_146832 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146830 ?auto_146829 ) ( SUPPORTS ?auto_146830 ?auto_146822 ) ( not ( = ?auto_146821 ?auto_146831 ) ) ( HAVE_IMAGE ?auto_146823 ?auto_146827 ) ( not ( = ?auto_146823 ?auto_146821 ) ) ( not ( = ?auto_146823 ?auto_146831 ) ) ( not ( = ?auto_146827 ?auto_146822 ) ) ( CALIBRATION_TARGET ?auto_146830 ?auto_146831 ) ( POINTING ?auto_146829 ?auto_146828 ) ( not ( = ?auto_146831 ?auto_146828 ) ) ( not ( = ?auto_146821 ?auto_146828 ) ) ( not ( = ?auto_146823 ?auto_146828 ) ) ( ON_BOARD ?auto_146832 ?auto_146829 ) ( POWER_ON ?auto_146832 ) ( not ( = ?auto_146830 ?auto_146832 ) ) ( HAVE_IMAGE ?auto_146823 ?auto_146820 ) ( HAVE_IMAGE ?auto_146824 ?auto_146825 ) ( HAVE_IMAGE ?auto_146826 ?auto_146827 ) ( not ( = ?auto_146821 ?auto_146824 ) ) ( not ( = ?auto_146821 ?auto_146826 ) ) ( not ( = ?auto_146822 ?auto_146820 ) ) ( not ( = ?auto_146822 ?auto_146825 ) ) ( not ( = ?auto_146823 ?auto_146824 ) ) ( not ( = ?auto_146823 ?auto_146826 ) ) ( not ( = ?auto_146820 ?auto_146825 ) ) ( not ( = ?auto_146820 ?auto_146827 ) ) ( not ( = ?auto_146824 ?auto_146826 ) ) ( not ( = ?auto_146824 ?auto_146831 ) ) ( not ( = ?auto_146824 ?auto_146828 ) ) ( not ( = ?auto_146825 ?auto_146827 ) ) ( not ( = ?auto_146826 ?auto_146831 ) ) ( not ( = ?auto_146826 ?auto_146828 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146823 ?auto_146827 ?auto_146821 ?auto_146822 )
      ( GET-4IMAGE-VERIFY ?auto_146821 ?auto_146822 ?auto_146823 ?auto_146820 ?auto_146824 ?auto_146825 ?auto_146826 ?auto_146827 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146834 - DIRECTION
      ?auto_146835 - MODE
      ?auto_146836 - DIRECTION
      ?auto_146833 - MODE
      ?auto_146837 - DIRECTION
      ?auto_146838 - MODE
      ?auto_146839 - DIRECTION
      ?auto_146840 - MODE
    )
    :vars
    (
      ?auto_146843 - INSTRUMENT
      ?auto_146842 - SATELLITE
      ?auto_146844 - DIRECTION
      ?auto_146841 - DIRECTION
      ?auto_146845 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146843 ?auto_146842 ) ( SUPPORTS ?auto_146843 ?auto_146835 ) ( not ( = ?auto_146834 ?auto_146844 ) ) ( HAVE_IMAGE ?auto_146836 ?auto_146833 ) ( not ( = ?auto_146836 ?auto_146834 ) ) ( not ( = ?auto_146836 ?auto_146844 ) ) ( not ( = ?auto_146833 ?auto_146835 ) ) ( CALIBRATION_TARGET ?auto_146843 ?auto_146844 ) ( POINTING ?auto_146842 ?auto_146841 ) ( not ( = ?auto_146844 ?auto_146841 ) ) ( not ( = ?auto_146834 ?auto_146841 ) ) ( not ( = ?auto_146836 ?auto_146841 ) ) ( ON_BOARD ?auto_146845 ?auto_146842 ) ( POWER_ON ?auto_146845 ) ( not ( = ?auto_146843 ?auto_146845 ) ) ( HAVE_IMAGE ?auto_146837 ?auto_146838 ) ( HAVE_IMAGE ?auto_146839 ?auto_146840 ) ( not ( = ?auto_146834 ?auto_146837 ) ) ( not ( = ?auto_146834 ?auto_146839 ) ) ( not ( = ?auto_146835 ?auto_146838 ) ) ( not ( = ?auto_146835 ?auto_146840 ) ) ( not ( = ?auto_146836 ?auto_146837 ) ) ( not ( = ?auto_146836 ?auto_146839 ) ) ( not ( = ?auto_146833 ?auto_146838 ) ) ( not ( = ?auto_146833 ?auto_146840 ) ) ( not ( = ?auto_146837 ?auto_146839 ) ) ( not ( = ?auto_146837 ?auto_146844 ) ) ( not ( = ?auto_146837 ?auto_146841 ) ) ( not ( = ?auto_146838 ?auto_146840 ) ) ( not ( = ?auto_146839 ?auto_146844 ) ) ( not ( = ?auto_146839 ?auto_146841 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146836 ?auto_146833 ?auto_146834 ?auto_146835 )
      ( GET-4IMAGE-VERIFY ?auto_146834 ?auto_146835 ?auto_146836 ?auto_146833 ?auto_146837 ?auto_146838 ?auto_146839 ?auto_146840 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146847 - DIRECTION
      ?auto_146848 - MODE
      ?auto_146849 - DIRECTION
      ?auto_146846 - MODE
      ?auto_146850 - DIRECTION
      ?auto_146851 - MODE
      ?auto_146852 - DIRECTION
      ?auto_146853 - MODE
    )
    :vars
    (
      ?auto_146855 - INSTRUMENT
      ?auto_146854 - SATELLITE
      ?auto_146856 - DIRECTION
      ?auto_146857 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146855 ?auto_146854 ) ( SUPPORTS ?auto_146855 ?auto_146848 ) ( not ( = ?auto_146847 ?auto_146856 ) ) ( HAVE_IMAGE ?auto_146850 ?auto_146851 ) ( not ( = ?auto_146850 ?auto_146847 ) ) ( not ( = ?auto_146850 ?auto_146856 ) ) ( not ( = ?auto_146851 ?auto_146848 ) ) ( CALIBRATION_TARGET ?auto_146855 ?auto_146856 ) ( POINTING ?auto_146854 ?auto_146852 ) ( not ( = ?auto_146856 ?auto_146852 ) ) ( not ( = ?auto_146847 ?auto_146852 ) ) ( not ( = ?auto_146850 ?auto_146852 ) ) ( ON_BOARD ?auto_146857 ?auto_146854 ) ( POWER_ON ?auto_146857 ) ( not ( = ?auto_146855 ?auto_146857 ) ) ( HAVE_IMAGE ?auto_146849 ?auto_146846 ) ( HAVE_IMAGE ?auto_146852 ?auto_146853 ) ( not ( = ?auto_146847 ?auto_146849 ) ) ( not ( = ?auto_146848 ?auto_146846 ) ) ( not ( = ?auto_146848 ?auto_146853 ) ) ( not ( = ?auto_146849 ?auto_146850 ) ) ( not ( = ?auto_146849 ?auto_146852 ) ) ( not ( = ?auto_146849 ?auto_146856 ) ) ( not ( = ?auto_146846 ?auto_146851 ) ) ( not ( = ?auto_146846 ?auto_146853 ) ) ( not ( = ?auto_146851 ?auto_146853 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146850 ?auto_146851 ?auto_146847 ?auto_146848 )
      ( GET-4IMAGE-VERIFY ?auto_146847 ?auto_146848 ?auto_146849 ?auto_146846 ?auto_146850 ?auto_146851 ?auto_146852 ?auto_146853 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_146943 - DIRECTION
      ?auto_146944 - MODE
      ?auto_146945 - DIRECTION
      ?auto_146942 - MODE
      ?auto_146946 - DIRECTION
      ?auto_146947 - MODE
      ?auto_146948 - DIRECTION
      ?auto_146949 - MODE
    )
    :vars
    (
      ?auto_146951 - INSTRUMENT
      ?auto_146950 - SATELLITE
      ?auto_146952 - DIRECTION
      ?auto_146953 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_146951 ?auto_146950 ) ( SUPPORTS ?auto_146951 ?auto_146944 ) ( not ( = ?auto_146943 ?auto_146952 ) ) ( HAVE_IMAGE ?auto_146945 ?auto_146942 ) ( not ( = ?auto_146945 ?auto_146943 ) ) ( not ( = ?auto_146945 ?auto_146952 ) ) ( not ( = ?auto_146942 ?auto_146944 ) ) ( CALIBRATION_TARGET ?auto_146951 ?auto_146952 ) ( POINTING ?auto_146950 ?auto_146948 ) ( not ( = ?auto_146952 ?auto_146948 ) ) ( not ( = ?auto_146943 ?auto_146948 ) ) ( not ( = ?auto_146945 ?auto_146948 ) ) ( ON_BOARD ?auto_146953 ?auto_146950 ) ( POWER_ON ?auto_146953 ) ( not ( = ?auto_146951 ?auto_146953 ) ) ( HAVE_IMAGE ?auto_146946 ?auto_146947 ) ( HAVE_IMAGE ?auto_146948 ?auto_146949 ) ( not ( = ?auto_146943 ?auto_146946 ) ) ( not ( = ?auto_146944 ?auto_146947 ) ) ( not ( = ?auto_146944 ?auto_146949 ) ) ( not ( = ?auto_146945 ?auto_146946 ) ) ( not ( = ?auto_146942 ?auto_146947 ) ) ( not ( = ?auto_146942 ?auto_146949 ) ) ( not ( = ?auto_146946 ?auto_146948 ) ) ( not ( = ?auto_146946 ?auto_146952 ) ) ( not ( = ?auto_146947 ?auto_146949 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_146945 ?auto_146942 ?auto_146943 ?auto_146944 )
      ( GET-4IMAGE-VERIFY ?auto_146943 ?auto_146944 ?auto_146945 ?auto_146942 ?auto_146946 ?auto_146947 ?auto_146948 ?auto_146949 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147018 - DIRECTION
      ?auto_147019 - MODE
      ?auto_147020 - DIRECTION
      ?auto_147017 - MODE
      ?auto_147021 - DIRECTION
      ?auto_147022 - MODE
      ?auto_147023 - DIRECTION
      ?auto_147024 - MODE
    )
    :vars
    (
      ?auto_147027 - INSTRUMENT
      ?auto_147026 - SATELLITE
      ?auto_147028 - DIRECTION
      ?auto_147025 - DIRECTION
      ?auto_147029 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_147027 ?auto_147026 ) ( SUPPORTS ?auto_147027 ?auto_147019 ) ( not ( = ?auto_147018 ?auto_147028 ) ) ( HAVE_IMAGE ?auto_147023 ?auto_147024 ) ( not ( = ?auto_147023 ?auto_147018 ) ) ( not ( = ?auto_147023 ?auto_147028 ) ) ( not ( = ?auto_147024 ?auto_147019 ) ) ( CALIBRATION_TARGET ?auto_147027 ?auto_147028 ) ( POINTING ?auto_147026 ?auto_147025 ) ( not ( = ?auto_147028 ?auto_147025 ) ) ( not ( = ?auto_147018 ?auto_147025 ) ) ( not ( = ?auto_147023 ?auto_147025 ) ) ( ON_BOARD ?auto_147029 ?auto_147026 ) ( POWER_ON ?auto_147029 ) ( not ( = ?auto_147027 ?auto_147029 ) ) ( HAVE_IMAGE ?auto_147020 ?auto_147017 ) ( HAVE_IMAGE ?auto_147021 ?auto_147022 ) ( not ( = ?auto_147018 ?auto_147020 ) ) ( not ( = ?auto_147018 ?auto_147021 ) ) ( not ( = ?auto_147019 ?auto_147017 ) ) ( not ( = ?auto_147019 ?auto_147022 ) ) ( not ( = ?auto_147020 ?auto_147021 ) ) ( not ( = ?auto_147020 ?auto_147023 ) ) ( not ( = ?auto_147020 ?auto_147028 ) ) ( not ( = ?auto_147020 ?auto_147025 ) ) ( not ( = ?auto_147017 ?auto_147022 ) ) ( not ( = ?auto_147017 ?auto_147024 ) ) ( not ( = ?auto_147021 ?auto_147023 ) ) ( not ( = ?auto_147021 ?auto_147028 ) ) ( not ( = ?auto_147021 ?auto_147025 ) ) ( not ( = ?auto_147022 ?auto_147024 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147023 ?auto_147024 ?auto_147018 ?auto_147019 )
      ( GET-4IMAGE-VERIFY ?auto_147018 ?auto_147019 ?auto_147020 ?auto_147017 ?auto_147021 ?auto_147022 ?auto_147023 ?auto_147024 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147031 - DIRECTION
      ?auto_147032 - MODE
      ?auto_147033 - DIRECTION
      ?auto_147030 - MODE
      ?auto_147034 - DIRECTION
      ?auto_147035 - MODE
      ?auto_147036 - DIRECTION
      ?auto_147037 - MODE
    )
    :vars
    (
      ?auto_147040 - INSTRUMENT
      ?auto_147039 - SATELLITE
      ?auto_147041 - DIRECTION
      ?auto_147038 - DIRECTION
      ?auto_147042 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_147040 ?auto_147039 ) ( SUPPORTS ?auto_147040 ?auto_147032 ) ( not ( = ?auto_147031 ?auto_147041 ) ) ( HAVE_IMAGE ?auto_147034 ?auto_147035 ) ( not ( = ?auto_147034 ?auto_147031 ) ) ( not ( = ?auto_147034 ?auto_147041 ) ) ( not ( = ?auto_147035 ?auto_147032 ) ) ( CALIBRATION_TARGET ?auto_147040 ?auto_147041 ) ( POINTING ?auto_147039 ?auto_147038 ) ( not ( = ?auto_147041 ?auto_147038 ) ) ( not ( = ?auto_147031 ?auto_147038 ) ) ( not ( = ?auto_147034 ?auto_147038 ) ) ( ON_BOARD ?auto_147042 ?auto_147039 ) ( POWER_ON ?auto_147042 ) ( not ( = ?auto_147040 ?auto_147042 ) ) ( HAVE_IMAGE ?auto_147033 ?auto_147030 ) ( HAVE_IMAGE ?auto_147036 ?auto_147037 ) ( not ( = ?auto_147031 ?auto_147033 ) ) ( not ( = ?auto_147031 ?auto_147036 ) ) ( not ( = ?auto_147032 ?auto_147030 ) ) ( not ( = ?auto_147032 ?auto_147037 ) ) ( not ( = ?auto_147033 ?auto_147034 ) ) ( not ( = ?auto_147033 ?auto_147036 ) ) ( not ( = ?auto_147033 ?auto_147041 ) ) ( not ( = ?auto_147033 ?auto_147038 ) ) ( not ( = ?auto_147030 ?auto_147035 ) ) ( not ( = ?auto_147030 ?auto_147037 ) ) ( not ( = ?auto_147034 ?auto_147036 ) ) ( not ( = ?auto_147035 ?auto_147037 ) ) ( not ( = ?auto_147036 ?auto_147041 ) ) ( not ( = ?auto_147036 ?auto_147038 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147034 ?auto_147035 ?auto_147031 ?auto_147032 )
      ( GET-4IMAGE-VERIFY ?auto_147031 ?auto_147032 ?auto_147033 ?auto_147030 ?auto_147034 ?auto_147035 ?auto_147036 ?auto_147037 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147078 - DIRECTION
      ?auto_147079 - MODE
      ?auto_147080 - DIRECTION
      ?auto_147077 - MODE
      ?auto_147081 - DIRECTION
      ?auto_147082 - MODE
      ?auto_147083 - DIRECTION
      ?auto_147084 - MODE
    )
    :vars
    (
      ?auto_147088 - INSTRUMENT
      ?auto_147087 - SATELLITE
      ?auto_147089 - DIRECTION
      ?auto_147085 - DIRECTION
      ?auto_147091 - MODE
      ?auto_147086 - DIRECTION
      ?auto_147090 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_147088 ?auto_147087 ) ( SUPPORTS ?auto_147088 ?auto_147079 ) ( not ( = ?auto_147078 ?auto_147089 ) ) ( HAVE_IMAGE ?auto_147085 ?auto_147091 ) ( not ( = ?auto_147085 ?auto_147078 ) ) ( not ( = ?auto_147085 ?auto_147089 ) ) ( not ( = ?auto_147091 ?auto_147079 ) ) ( CALIBRATION_TARGET ?auto_147088 ?auto_147089 ) ( POINTING ?auto_147087 ?auto_147086 ) ( not ( = ?auto_147089 ?auto_147086 ) ) ( not ( = ?auto_147078 ?auto_147086 ) ) ( not ( = ?auto_147085 ?auto_147086 ) ) ( ON_BOARD ?auto_147090 ?auto_147087 ) ( POWER_ON ?auto_147090 ) ( not ( = ?auto_147088 ?auto_147090 ) ) ( HAVE_IMAGE ?auto_147080 ?auto_147077 ) ( HAVE_IMAGE ?auto_147081 ?auto_147082 ) ( HAVE_IMAGE ?auto_147083 ?auto_147084 ) ( not ( = ?auto_147078 ?auto_147080 ) ) ( not ( = ?auto_147078 ?auto_147081 ) ) ( not ( = ?auto_147078 ?auto_147083 ) ) ( not ( = ?auto_147079 ?auto_147077 ) ) ( not ( = ?auto_147079 ?auto_147082 ) ) ( not ( = ?auto_147079 ?auto_147084 ) ) ( not ( = ?auto_147080 ?auto_147081 ) ) ( not ( = ?auto_147080 ?auto_147083 ) ) ( not ( = ?auto_147080 ?auto_147089 ) ) ( not ( = ?auto_147080 ?auto_147085 ) ) ( not ( = ?auto_147080 ?auto_147086 ) ) ( not ( = ?auto_147077 ?auto_147082 ) ) ( not ( = ?auto_147077 ?auto_147084 ) ) ( not ( = ?auto_147077 ?auto_147091 ) ) ( not ( = ?auto_147081 ?auto_147083 ) ) ( not ( = ?auto_147081 ?auto_147089 ) ) ( not ( = ?auto_147081 ?auto_147085 ) ) ( not ( = ?auto_147081 ?auto_147086 ) ) ( not ( = ?auto_147082 ?auto_147084 ) ) ( not ( = ?auto_147082 ?auto_147091 ) ) ( not ( = ?auto_147083 ?auto_147089 ) ) ( not ( = ?auto_147083 ?auto_147085 ) ) ( not ( = ?auto_147083 ?auto_147086 ) ) ( not ( = ?auto_147084 ?auto_147091 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147085 ?auto_147091 ?auto_147078 ?auto_147079 )
      ( GET-4IMAGE-VERIFY ?auto_147078 ?auto_147079 ?auto_147080 ?auto_147077 ?auto_147081 ?auto_147082 ?auto_147083 ?auto_147084 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147093 - DIRECTION
      ?auto_147094 - MODE
      ?auto_147095 - DIRECTION
      ?auto_147092 - MODE
      ?auto_147096 - DIRECTION
      ?auto_147097 - MODE
      ?auto_147098 - DIRECTION
      ?auto_147099 - MODE
    )
    :vars
    (
      ?auto_147102 - INSTRUMENT
      ?auto_147101 - SATELLITE
      ?auto_147103 - DIRECTION
      ?auto_147100 - DIRECTION
      ?auto_147105 - MODE
      ?auto_147104 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_147102 ?auto_147101 ) ( SUPPORTS ?auto_147102 ?auto_147094 ) ( not ( = ?auto_147093 ?auto_147103 ) ) ( HAVE_IMAGE ?auto_147100 ?auto_147105 ) ( not ( = ?auto_147100 ?auto_147093 ) ) ( not ( = ?auto_147100 ?auto_147103 ) ) ( not ( = ?auto_147105 ?auto_147094 ) ) ( CALIBRATION_TARGET ?auto_147102 ?auto_147103 ) ( POINTING ?auto_147101 ?auto_147098 ) ( not ( = ?auto_147103 ?auto_147098 ) ) ( not ( = ?auto_147093 ?auto_147098 ) ) ( not ( = ?auto_147100 ?auto_147098 ) ) ( ON_BOARD ?auto_147104 ?auto_147101 ) ( POWER_ON ?auto_147104 ) ( not ( = ?auto_147102 ?auto_147104 ) ) ( HAVE_IMAGE ?auto_147095 ?auto_147092 ) ( HAVE_IMAGE ?auto_147096 ?auto_147097 ) ( HAVE_IMAGE ?auto_147098 ?auto_147099 ) ( not ( = ?auto_147093 ?auto_147095 ) ) ( not ( = ?auto_147093 ?auto_147096 ) ) ( not ( = ?auto_147094 ?auto_147092 ) ) ( not ( = ?auto_147094 ?auto_147097 ) ) ( not ( = ?auto_147094 ?auto_147099 ) ) ( not ( = ?auto_147095 ?auto_147096 ) ) ( not ( = ?auto_147095 ?auto_147098 ) ) ( not ( = ?auto_147095 ?auto_147103 ) ) ( not ( = ?auto_147095 ?auto_147100 ) ) ( not ( = ?auto_147092 ?auto_147097 ) ) ( not ( = ?auto_147092 ?auto_147099 ) ) ( not ( = ?auto_147092 ?auto_147105 ) ) ( not ( = ?auto_147096 ?auto_147098 ) ) ( not ( = ?auto_147096 ?auto_147103 ) ) ( not ( = ?auto_147096 ?auto_147100 ) ) ( not ( = ?auto_147097 ?auto_147099 ) ) ( not ( = ?auto_147097 ?auto_147105 ) ) ( not ( = ?auto_147099 ?auto_147105 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147100 ?auto_147105 ?auto_147093 ?auto_147094 )
      ( GET-4IMAGE-VERIFY ?auto_147093 ?auto_147094 ?auto_147095 ?auto_147092 ?auto_147096 ?auto_147097 ?auto_147098 ?auto_147099 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147281 - DIRECTION
      ?auto_147282 - MODE
      ?auto_147283 - DIRECTION
      ?auto_147280 - MODE
      ?auto_147284 - DIRECTION
      ?auto_147285 - MODE
      ?auto_147286 - DIRECTION
      ?auto_147287 - MODE
    )
    :vars
    (
      ?auto_147290 - INSTRUMENT
      ?auto_147289 - SATELLITE
      ?auto_147291 - DIRECTION
      ?auto_147288 - DIRECTION
      ?auto_147293 - MODE
      ?auto_147292 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_147290 ?auto_147289 ) ( SUPPORTS ?auto_147290 ?auto_147282 ) ( not ( = ?auto_147281 ?auto_147291 ) ) ( HAVE_IMAGE ?auto_147288 ?auto_147293 ) ( not ( = ?auto_147288 ?auto_147281 ) ) ( not ( = ?auto_147288 ?auto_147291 ) ) ( not ( = ?auto_147293 ?auto_147282 ) ) ( CALIBRATION_TARGET ?auto_147290 ?auto_147291 ) ( POINTING ?auto_147289 ?auto_147283 ) ( not ( = ?auto_147291 ?auto_147283 ) ) ( not ( = ?auto_147281 ?auto_147283 ) ) ( not ( = ?auto_147288 ?auto_147283 ) ) ( ON_BOARD ?auto_147292 ?auto_147289 ) ( POWER_ON ?auto_147292 ) ( not ( = ?auto_147290 ?auto_147292 ) ) ( HAVE_IMAGE ?auto_147283 ?auto_147280 ) ( HAVE_IMAGE ?auto_147284 ?auto_147285 ) ( HAVE_IMAGE ?auto_147286 ?auto_147287 ) ( not ( = ?auto_147281 ?auto_147284 ) ) ( not ( = ?auto_147281 ?auto_147286 ) ) ( not ( = ?auto_147282 ?auto_147280 ) ) ( not ( = ?auto_147282 ?auto_147285 ) ) ( not ( = ?auto_147282 ?auto_147287 ) ) ( not ( = ?auto_147283 ?auto_147284 ) ) ( not ( = ?auto_147283 ?auto_147286 ) ) ( not ( = ?auto_147280 ?auto_147285 ) ) ( not ( = ?auto_147280 ?auto_147287 ) ) ( not ( = ?auto_147280 ?auto_147293 ) ) ( not ( = ?auto_147284 ?auto_147286 ) ) ( not ( = ?auto_147284 ?auto_147291 ) ) ( not ( = ?auto_147284 ?auto_147288 ) ) ( not ( = ?auto_147285 ?auto_147287 ) ) ( not ( = ?auto_147285 ?auto_147293 ) ) ( not ( = ?auto_147286 ?auto_147291 ) ) ( not ( = ?auto_147286 ?auto_147288 ) ) ( not ( = ?auto_147287 ?auto_147293 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147288 ?auto_147293 ?auto_147281 ?auto_147282 )
      ( GET-4IMAGE-VERIFY ?auto_147281 ?auto_147282 ?auto_147283 ?auto_147280 ?auto_147284 ?auto_147285 ?auto_147286 ?auto_147287 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_147323 - DIRECTION
      ?auto_147324 - MODE
      ?auto_147325 - DIRECTION
      ?auto_147322 - MODE
      ?auto_147326 - DIRECTION
      ?auto_147327 - MODE
      ?auto_147328 - DIRECTION
      ?auto_147329 - MODE
    )
    :vars
    (
      ?auto_147331 - INSTRUMENT
      ?auto_147330 - SATELLITE
      ?auto_147332 - DIRECTION
      ?auto_147333 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_147331 ?auto_147330 ) ( SUPPORTS ?auto_147331 ?auto_147324 ) ( not ( = ?auto_147323 ?auto_147332 ) ) ( HAVE_IMAGE ?auto_147328 ?auto_147329 ) ( not ( = ?auto_147328 ?auto_147323 ) ) ( not ( = ?auto_147328 ?auto_147332 ) ) ( not ( = ?auto_147329 ?auto_147324 ) ) ( CALIBRATION_TARGET ?auto_147331 ?auto_147332 ) ( POINTING ?auto_147330 ?auto_147325 ) ( not ( = ?auto_147332 ?auto_147325 ) ) ( not ( = ?auto_147323 ?auto_147325 ) ) ( not ( = ?auto_147328 ?auto_147325 ) ) ( ON_BOARD ?auto_147333 ?auto_147330 ) ( POWER_ON ?auto_147333 ) ( not ( = ?auto_147331 ?auto_147333 ) ) ( HAVE_IMAGE ?auto_147325 ?auto_147322 ) ( HAVE_IMAGE ?auto_147326 ?auto_147327 ) ( not ( = ?auto_147323 ?auto_147326 ) ) ( not ( = ?auto_147324 ?auto_147322 ) ) ( not ( = ?auto_147324 ?auto_147327 ) ) ( not ( = ?auto_147325 ?auto_147326 ) ) ( not ( = ?auto_147322 ?auto_147327 ) ) ( not ( = ?auto_147322 ?auto_147329 ) ) ( not ( = ?auto_147326 ?auto_147328 ) ) ( not ( = ?auto_147326 ?auto_147332 ) ) ( not ( = ?auto_147327 ?auto_147329 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147328 ?auto_147329 ?auto_147323 ?auto_147324 )
      ( GET-4IMAGE-VERIFY ?auto_147323 ?auto_147324 ?auto_147325 ?auto_147322 ?auto_147326 ?auto_147327 ?auto_147328 ?auto_147329 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_147919 - DIRECTION
      ?auto_147920 - MODE
      ?auto_147921 - DIRECTION
      ?auto_147918 - MODE
      ?auto_147922 - DIRECTION
      ?auto_147923 - MODE
    )
    :vars
    (
      ?auto_147928 - INSTRUMENT
      ?auto_147925 - SATELLITE
      ?auto_147924 - DIRECTION
      ?auto_147926 - DIRECTION
      ?auto_147927 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_147928 ?auto_147925 ) ( SUPPORTS ?auto_147928 ?auto_147920 ) ( not ( = ?auto_147919 ?auto_147924 ) ) ( HAVE_IMAGE ?auto_147922 ?auto_147918 ) ( not ( = ?auto_147922 ?auto_147919 ) ) ( not ( = ?auto_147922 ?auto_147924 ) ) ( not ( = ?auto_147918 ?auto_147920 ) ) ( CALIBRATION_TARGET ?auto_147928 ?auto_147924 ) ( POINTING ?auto_147925 ?auto_147926 ) ( not ( = ?auto_147924 ?auto_147926 ) ) ( not ( = ?auto_147919 ?auto_147926 ) ) ( not ( = ?auto_147922 ?auto_147926 ) ) ( ON_BOARD ?auto_147927 ?auto_147925 ) ( POWER_ON ?auto_147927 ) ( not ( = ?auto_147928 ?auto_147927 ) ) ( HAVE_IMAGE ?auto_147921 ?auto_147918 ) ( HAVE_IMAGE ?auto_147922 ?auto_147923 ) ( not ( = ?auto_147919 ?auto_147921 ) ) ( not ( = ?auto_147920 ?auto_147923 ) ) ( not ( = ?auto_147921 ?auto_147922 ) ) ( not ( = ?auto_147921 ?auto_147924 ) ) ( not ( = ?auto_147921 ?auto_147926 ) ) ( not ( = ?auto_147918 ?auto_147923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_147922 ?auto_147918 ?auto_147919 ?auto_147920 )
      ( GET-3IMAGE-VERIFY ?auto_147919 ?auto_147920 ?auto_147921 ?auto_147918 ?auto_147922 ?auto_147923 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_148358 - DIRECTION
      ?auto_148359 - MODE
      ?auto_148360 - DIRECTION
      ?auto_148357 - MODE
      ?auto_148361 - DIRECTION
      ?auto_148362 - MODE
      ?auto_148363 - DIRECTION
      ?auto_148364 - MODE
    )
    :vars
    (
      ?auto_148369 - INSTRUMENT
      ?auto_148366 - SATELLITE
      ?auto_148365 - DIRECTION
      ?auto_148367 - DIRECTION
      ?auto_148368 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_148369 ?auto_148366 ) ( SUPPORTS ?auto_148369 ?auto_148357 ) ( not ( = ?auto_148360 ?auto_148365 ) ) ( HAVE_IMAGE ?auto_148363 ?auto_148362 ) ( not ( = ?auto_148363 ?auto_148360 ) ) ( not ( = ?auto_148363 ?auto_148365 ) ) ( not ( = ?auto_148362 ?auto_148357 ) ) ( CALIBRATION_TARGET ?auto_148369 ?auto_148365 ) ( POINTING ?auto_148366 ?auto_148367 ) ( not ( = ?auto_148365 ?auto_148367 ) ) ( not ( = ?auto_148360 ?auto_148367 ) ) ( not ( = ?auto_148363 ?auto_148367 ) ) ( ON_BOARD ?auto_148368 ?auto_148366 ) ( POWER_ON ?auto_148368 ) ( not ( = ?auto_148369 ?auto_148368 ) ) ( HAVE_IMAGE ?auto_148358 ?auto_148359 ) ( HAVE_IMAGE ?auto_148361 ?auto_148362 ) ( HAVE_IMAGE ?auto_148363 ?auto_148364 ) ( not ( = ?auto_148358 ?auto_148360 ) ) ( not ( = ?auto_148358 ?auto_148361 ) ) ( not ( = ?auto_148358 ?auto_148363 ) ) ( not ( = ?auto_148358 ?auto_148365 ) ) ( not ( = ?auto_148358 ?auto_148367 ) ) ( not ( = ?auto_148359 ?auto_148357 ) ) ( not ( = ?auto_148359 ?auto_148362 ) ) ( not ( = ?auto_148359 ?auto_148364 ) ) ( not ( = ?auto_148360 ?auto_148361 ) ) ( not ( = ?auto_148357 ?auto_148364 ) ) ( not ( = ?auto_148361 ?auto_148363 ) ) ( not ( = ?auto_148361 ?auto_148365 ) ) ( not ( = ?auto_148361 ?auto_148367 ) ) ( not ( = ?auto_148362 ?auto_148364 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_148363 ?auto_148362 ?auto_148360 ?auto_148357 )
      ( GET-4IMAGE-VERIFY ?auto_148358 ?auto_148359 ?auto_148360 ?auto_148357 ?auto_148361 ?auto_148362 ?auto_148363 ?auto_148364 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_148559 - DIRECTION
      ?auto_148560 - MODE
      ?auto_148561 - DIRECTION
      ?auto_148558 - MODE
      ?auto_148562 - DIRECTION
      ?auto_148563 - MODE
      ?auto_148564 - DIRECTION
      ?auto_148565 - MODE
    )
    :vars
    (
      ?auto_148570 - INSTRUMENT
      ?auto_148567 - SATELLITE
      ?auto_148566 - DIRECTION
      ?auto_148568 - DIRECTION
      ?auto_148569 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_148570 ?auto_148567 ) ( SUPPORTS ?auto_148570 ?auto_148565 ) ( not ( = ?auto_148564 ?auto_148566 ) ) ( HAVE_IMAGE ?auto_148561 ?auto_148563 ) ( not ( = ?auto_148561 ?auto_148564 ) ) ( not ( = ?auto_148561 ?auto_148566 ) ) ( not ( = ?auto_148563 ?auto_148565 ) ) ( CALIBRATION_TARGET ?auto_148570 ?auto_148566 ) ( POINTING ?auto_148567 ?auto_148568 ) ( not ( = ?auto_148566 ?auto_148568 ) ) ( not ( = ?auto_148564 ?auto_148568 ) ) ( not ( = ?auto_148561 ?auto_148568 ) ) ( ON_BOARD ?auto_148569 ?auto_148567 ) ( POWER_ON ?auto_148569 ) ( not ( = ?auto_148570 ?auto_148569 ) ) ( HAVE_IMAGE ?auto_148559 ?auto_148560 ) ( HAVE_IMAGE ?auto_148561 ?auto_148558 ) ( HAVE_IMAGE ?auto_148562 ?auto_148563 ) ( not ( = ?auto_148559 ?auto_148561 ) ) ( not ( = ?auto_148559 ?auto_148562 ) ) ( not ( = ?auto_148559 ?auto_148564 ) ) ( not ( = ?auto_148559 ?auto_148566 ) ) ( not ( = ?auto_148559 ?auto_148568 ) ) ( not ( = ?auto_148560 ?auto_148558 ) ) ( not ( = ?auto_148560 ?auto_148563 ) ) ( not ( = ?auto_148560 ?auto_148565 ) ) ( not ( = ?auto_148561 ?auto_148562 ) ) ( not ( = ?auto_148558 ?auto_148563 ) ) ( not ( = ?auto_148558 ?auto_148565 ) ) ( not ( = ?auto_148562 ?auto_148564 ) ) ( not ( = ?auto_148562 ?auto_148566 ) ) ( not ( = ?auto_148562 ?auto_148568 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_148561 ?auto_148563 ?auto_148564 ?auto_148565 )
      ( GET-4IMAGE-VERIFY ?auto_148559 ?auto_148560 ?auto_148561 ?auto_148558 ?auto_148562 ?auto_148563 ?auto_148564 ?auto_148565 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_149743 - DIRECTION
      ?auto_149744 - MODE
      ?auto_149745 - DIRECTION
      ?auto_149742 - MODE
      ?auto_149746 - DIRECTION
      ?auto_149747 - MODE
      ?auto_149748 - DIRECTION
      ?auto_149749 - MODE
    )
    :vars
    (
      ?auto_149754 - INSTRUMENT
      ?auto_149751 - SATELLITE
      ?auto_149750 - DIRECTION
      ?auto_149752 - DIRECTION
      ?auto_149753 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_149754 ?auto_149751 ) ( SUPPORTS ?auto_149754 ?auto_149744 ) ( not ( = ?auto_149743 ?auto_149750 ) ) ( HAVE_IMAGE ?auto_149748 ?auto_149747 ) ( not ( = ?auto_149748 ?auto_149743 ) ) ( not ( = ?auto_149748 ?auto_149750 ) ) ( not ( = ?auto_149747 ?auto_149744 ) ) ( CALIBRATION_TARGET ?auto_149754 ?auto_149750 ) ( POINTING ?auto_149751 ?auto_149752 ) ( not ( = ?auto_149750 ?auto_149752 ) ) ( not ( = ?auto_149743 ?auto_149752 ) ) ( not ( = ?auto_149748 ?auto_149752 ) ) ( ON_BOARD ?auto_149753 ?auto_149751 ) ( POWER_ON ?auto_149753 ) ( not ( = ?auto_149754 ?auto_149753 ) ) ( HAVE_IMAGE ?auto_149745 ?auto_149742 ) ( HAVE_IMAGE ?auto_149746 ?auto_149747 ) ( HAVE_IMAGE ?auto_149748 ?auto_149749 ) ( not ( = ?auto_149743 ?auto_149745 ) ) ( not ( = ?auto_149743 ?auto_149746 ) ) ( not ( = ?auto_149744 ?auto_149742 ) ) ( not ( = ?auto_149744 ?auto_149749 ) ) ( not ( = ?auto_149745 ?auto_149746 ) ) ( not ( = ?auto_149745 ?auto_149748 ) ) ( not ( = ?auto_149745 ?auto_149750 ) ) ( not ( = ?auto_149745 ?auto_149752 ) ) ( not ( = ?auto_149742 ?auto_149747 ) ) ( not ( = ?auto_149742 ?auto_149749 ) ) ( not ( = ?auto_149746 ?auto_149748 ) ) ( not ( = ?auto_149746 ?auto_149750 ) ) ( not ( = ?auto_149746 ?auto_149752 ) ) ( not ( = ?auto_149747 ?auto_149749 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_149748 ?auto_149747 ?auto_149743 ?auto_149744 )
      ( GET-4IMAGE-VERIFY ?auto_149743 ?auto_149744 ?auto_149745 ?auto_149742 ?auto_149746 ?auto_149747 ?auto_149748 ?auto_149749 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_150457 - DIRECTION
      ?auto_150458 - MODE
      ?auto_150459 - DIRECTION
      ?auto_150456 - MODE
      ?auto_150460 - DIRECTION
      ?auto_150461 - MODE
    )
    :vars
    (
      ?auto_150465 - INSTRUMENT
      ?auto_150462 - SATELLITE
      ?auto_150463 - DIRECTION
      ?auto_150464 - DIRECTION
      ?auto_150466 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_150465 ?auto_150462 ) ( SUPPORTS ?auto_150465 ?auto_150461 ) ( not ( = ?auto_150460 ?auto_150463 ) ) ( HAVE_IMAGE ?auto_150459 ?auto_150458 ) ( not ( = ?auto_150459 ?auto_150460 ) ) ( not ( = ?auto_150459 ?auto_150463 ) ) ( not ( = ?auto_150458 ?auto_150461 ) ) ( CALIBRATION_TARGET ?auto_150465 ?auto_150463 ) ( not ( = ?auto_150463 ?auto_150464 ) ) ( not ( = ?auto_150460 ?auto_150464 ) ) ( not ( = ?auto_150459 ?auto_150464 ) ) ( ON_BOARD ?auto_150466 ?auto_150462 ) ( POWER_ON ?auto_150466 ) ( not ( = ?auto_150465 ?auto_150466 ) ) ( POINTING ?auto_150462 ?auto_150463 ) ( HAVE_IMAGE ?auto_150457 ?auto_150458 ) ( HAVE_IMAGE ?auto_150459 ?auto_150456 ) ( not ( = ?auto_150457 ?auto_150459 ) ) ( not ( = ?auto_150457 ?auto_150460 ) ) ( not ( = ?auto_150457 ?auto_150463 ) ) ( not ( = ?auto_150457 ?auto_150464 ) ) ( not ( = ?auto_150458 ?auto_150456 ) ) ( not ( = ?auto_150456 ?auto_150461 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_150459 ?auto_150458 ?auto_150460 ?auto_150461 )
      ( GET-3IMAGE-VERIFY ?auto_150457 ?auto_150458 ?auto_150459 ?auto_150456 ?auto_150460 ?auto_150461 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153241 - DIRECTION
      ?auto_153242 - MODE
      ?auto_153243 - DIRECTION
      ?auto_153240 - MODE
      ?auto_153244 - DIRECTION
      ?auto_153245 - MODE
    )
    :vars
    (
      ?auto_153246 - INSTRUMENT
      ?auto_153249 - SATELLITE
      ?auto_153247 - DIRECTION
      ?auto_153248 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153246 ?auto_153249 ) ( SUPPORTS ?auto_153246 ?auto_153245 ) ( not ( = ?auto_153244 ?auto_153247 ) ) ( HAVE_IMAGE ?auto_153241 ?auto_153242 ) ( not ( = ?auto_153241 ?auto_153244 ) ) ( not ( = ?auto_153241 ?auto_153247 ) ) ( not ( = ?auto_153242 ?auto_153245 ) ) ( CALIBRATION_TARGET ?auto_153246 ?auto_153247 ) ( not ( = ?auto_153247 ?auto_153243 ) ) ( not ( = ?auto_153244 ?auto_153243 ) ) ( not ( = ?auto_153241 ?auto_153243 ) ) ( ON_BOARD ?auto_153248 ?auto_153249 ) ( POWER_ON ?auto_153248 ) ( not ( = ?auto_153246 ?auto_153248 ) ) ( POINTING ?auto_153249 ?auto_153247 ) ( HAVE_IMAGE ?auto_153243 ?auto_153240 ) ( not ( = ?auto_153242 ?auto_153240 ) ) ( not ( = ?auto_153240 ?auto_153245 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153241 ?auto_153242 ?auto_153244 ?auto_153245 )
      ( GET-3IMAGE-VERIFY ?auto_153241 ?auto_153242 ?auto_153243 ?auto_153240 ?auto_153244 ?auto_153245 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153273 - DIRECTION
      ?auto_153274 - MODE
      ?auto_153275 - DIRECTION
      ?auto_153272 - MODE
      ?auto_153276 - DIRECTION
      ?auto_153277 - MODE
    )
    :vars
    (
      ?auto_153278 - INSTRUMENT
      ?auto_153281 - SATELLITE
      ?auto_153279 - DIRECTION
      ?auto_153280 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153278 ?auto_153281 ) ( SUPPORTS ?auto_153278 ?auto_153272 ) ( not ( = ?auto_153275 ?auto_153279 ) ) ( HAVE_IMAGE ?auto_153273 ?auto_153274 ) ( not ( = ?auto_153273 ?auto_153275 ) ) ( not ( = ?auto_153273 ?auto_153279 ) ) ( not ( = ?auto_153274 ?auto_153272 ) ) ( CALIBRATION_TARGET ?auto_153278 ?auto_153279 ) ( not ( = ?auto_153279 ?auto_153276 ) ) ( not ( = ?auto_153275 ?auto_153276 ) ) ( not ( = ?auto_153273 ?auto_153276 ) ) ( ON_BOARD ?auto_153280 ?auto_153281 ) ( POWER_ON ?auto_153280 ) ( not ( = ?auto_153278 ?auto_153280 ) ) ( POINTING ?auto_153281 ?auto_153279 ) ( HAVE_IMAGE ?auto_153276 ?auto_153277 ) ( not ( = ?auto_153274 ?auto_153277 ) ) ( not ( = ?auto_153272 ?auto_153277 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153273 ?auto_153274 ?auto_153275 ?auto_153272 )
      ( GET-3IMAGE-VERIFY ?auto_153273 ?auto_153274 ?auto_153275 ?auto_153272 ?auto_153276 ?auto_153277 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153311 - DIRECTION
      ?auto_153312 - MODE
      ?auto_153313 - DIRECTION
      ?auto_153310 - MODE
      ?auto_153314 - DIRECTION
      ?auto_153315 - MODE
    )
    :vars
    (
      ?auto_153316 - INSTRUMENT
      ?auto_153321 - SATELLITE
      ?auto_153319 - DIRECTION
      ?auto_153318 - DIRECTION
      ?auto_153317 - MODE
      ?auto_153320 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153316 ?auto_153321 ) ( SUPPORTS ?auto_153316 ?auto_153315 ) ( not ( = ?auto_153314 ?auto_153319 ) ) ( HAVE_IMAGE ?auto_153318 ?auto_153317 ) ( not ( = ?auto_153318 ?auto_153314 ) ) ( not ( = ?auto_153318 ?auto_153319 ) ) ( not ( = ?auto_153317 ?auto_153315 ) ) ( CALIBRATION_TARGET ?auto_153316 ?auto_153319 ) ( not ( = ?auto_153319 ?auto_153313 ) ) ( not ( = ?auto_153314 ?auto_153313 ) ) ( not ( = ?auto_153318 ?auto_153313 ) ) ( ON_BOARD ?auto_153320 ?auto_153321 ) ( POWER_ON ?auto_153320 ) ( not ( = ?auto_153316 ?auto_153320 ) ) ( POINTING ?auto_153321 ?auto_153319 ) ( HAVE_IMAGE ?auto_153311 ?auto_153312 ) ( HAVE_IMAGE ?auto_153313 ?auto_153310 ) ( not ( = ?auto_153311 ?auto_153313 ) ) ( not ( = ?auto_153311 ?auto_153314 ) ) ( not ( = ?auto_153311 ?auto_153319 ) ) ( not ( = ?auto_153311 ?auto_153318 ) ) ( not ( = ?auto_153312 ?auto_153310 ) ) ( not ( = ?auto_153312 ?auto_153315 ) ) ( not ( = ?auto_153312 ?auto_153317 ) ) ( not ( = ?auto_153310 ?auto_153315 ) ) ( not ( = ?auto_153310 ?auto_153317 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153318 ?auto_153317 ?auto_153314 ?auto_153315 )
      ( GET-3IMAGE-VERIFY ?auto_153311 ?auto_153312 ?auto_153313 ?auto_153310 ?auto_153314 ?auto_153315 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_150568 - DIRECTION
      ?auto_150569 - MODE
      ?auto_150570 - DIRECTION
      ?auto_150567 - MODE
      ?auto_150571 - DIRECTION
      ?auto_150572 - MODE
    )
    :vars
    (
      ?auto_150576 - INSTRUMENT
      ?auto_150573 - SATELLITE
      ?auto_150574 - DIRECTION
      ?auto_150575 - DIRECTION
      ?auto_150577 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_150576 ?auto_150573 ) ( SUPPORTS ?auto_150576 ?auto_150567 ) ( not ( = ?auto_150570 ?auto_150574 ) ) ( HAVE_IMAGE ?auto_150571 ?auto_150572 ) ( not ( = ?auto_150571 ?auto_150570 ) ) ( not ( = ?auto_150571 ?auto_150574 ) ) ( not ( = ?auto_150572 ?auto_150567 ) ) ( CALIBRATION_TARGET ?auto_150576 ?auto_150574 ) ( not ( = ?auto_150574 ?auto_150575 ) ) ( not ( = ?auto_150570 ?auto_150575 ) ) ( not ( = ?auto_150571 ?auto_150575 ) ) ( ON_BOARD ?auto_150577 ?auto_150573 ) ( POWER_ON ?auto_150577 ) ( not ( = ?auto_150576 ?auto_150577 ) ) ( POINTING ?auto_150573 ?auto_150574 ) ( HAVE_IMAGE ?auto_150568 ?auto_150569 ) ( not ( = ?auto_150568 ?auto_150570 ) ) ( not ( = ?auto_150568 ?auto_150571 ) ) ( not ( = ?auto_150568 ?auto_150574 ) ) ( not ( = ?auto_150568 ?auto_150575 ) ) ( not ( = ?auto_150569 ?auto_150567 ) ) ( not ( = ?auto_150569 ?auto_150572 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_150571 ?auto_150572 ?auto_150570 ?auto_150567 )
      ( GET-3IMAGE-VERIFY ?auto_150568 ?auto_150569 ?auto_150570 ?auto_150567 ?auto_150571 ?auto_150572 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153341 - DIRECTION
      ?auto_153342 - MODE
      ?auto_153343 - DIRECTION
      ?auto_153340 - MODE
      ?auto_153344 - DIRECTION
      ?auto_153345 - MODE
    )
    :vars
    (
      ?auto_153346 - INSTRUMENT
      ?auto_153351 - SATELLITE
      ?auto_153349 - DIRECTION
      ?auto_153348 - DIRECTION
      ?auto_153347 - MODE
      ?auto_153350 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153346 ?auto_153351 ) ( SUPPORTS ?auto_153346 ?auto_153340 ) ( not ( = ?auto_153343 ?auto_153349 ) ) ( HAVE_IMAGE ?auto_153348 ?auto_153347 ) ( not ( = ?auto_153348 ?auto_153343 ) ) ( not ( = ?auto_153348 ?auto_153349 ) ) ( not ( = ?auto_153347 ?auto_153340 ) ) ( CALIBRATION_TARGET ?auto_153346 ?auto_153349 ) ( not ( = ?auto_153349 ?auto_153344 ) ) ( not ( = ?auto_153343 ?auto_153344 ) ) ( not ( = ?auto_153348 ?auto_153344 ) ) ( ON_BOARD ?auto_153350 ?auto_153351 ) ( POWER_ON ?auto_153350 ) ( not ( = ?auto_153346 ?auto_153350 ) ) ( POINTING ?auto_153351 ?auto_153349 ) ( HAVE_IMAGE ?auto_153341 ?auto_153342 ) ( HAVE_IMAGE ?auto_153344 ?auto_153345 ) ( not ( = ?auto_153341 ?auto_153343 ) ) ( not ( = ?auto_153341 ?auto_153344 ) ) ( not ( = ?auto_153341 ?auto_153349 ) ) ( not ( = ?auto_153341 ?auto_153348 ) ) ( not ( = ?auto_153342 ?auto_153340 ) ) ( not ( = ?auto_153342 ?auto_153345 ) ) ( not ( = ?auto_153342 ?auto_153347 ) ) ( not ( = ?auto_153340 ?auto_153345 ) ) ( not ( = ?auto_153345 ?auto_153347 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153348 ?auto_153347 ?auto_153343 ?auto_153340 )
      ( GET-3IMAGE-VERIFY ?auto_153341 ?auto_153342 ?auto_153343 ?auto_153340 ?auto_153344 ?auto_153345 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_150740 - DIRECTION
      ?auto_150741 - MODE
      ?auto_150742 - DIRECTION
      ?auto_150739 - MODE
      ?auto_150743 - DIRECTION
      ?auto_150744 - MODE
    )
    :vars
    (
      ?auto_150748 - INSTRUMENT
      ?auto_150745 - SATELLITE
      ?auto_150746 - DIRECTION
      ?auto_150747 - DIRECTION
      ?auto_150749 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_150748 ?auto_150745 ) ( SUPPORTS ?auto_150748 ?auto_150741 ) ( not ( = ?auto_150740 ?auto_150746 ) ) ( HAVE_IMAGE ?auto_150743 ?auto_150744 ) ( not ( = ?auto_150743 ?auto_150740 ) ) ( not ( = ?auto_150743 ?auto_150746 ) ) ( not ( = ?auto_150744 ?auto_150741 ) ) ( CALIBRATION_TARGET ?auto_150748 ?auto_150746 ) ( not ( = ?auto_150746 ?auto_150747 ) ) ( not ( = ?auto_150740 ?auto_150747 ) ) ( not ( = ?auto_150743 ?auto_150747 ) ) ( ON_BOARD ?auto_150749 ?auto_150745 ) ( POWER_ON ?auto_150749 ) ( not ( = ?auto_150748 ?auto_150749 ) ) ( POINTING ?auto_150745 ?auto_150746 ) ( HAVE_IMAGE ?auto_150742 ?auto_150739 ) ( not ( = ?auto_150740 ?auto_150742 ) ) ( not ( = ?auto_150741 ?auto_150739 ) ) ( not ( = ?auto_150742 ?auto_150743 ) ) ( not ( = ?auto_150742 ?auto_150746 ) ) ( not ( = ?auto_150742 ?auto_150747 ) ) ( not ( = ?auto_150739 ?auto_150744 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_150743 ?auto_150744 ?auto_150740 ?auto_150741 )
      ( GET-3IMAGE-VERIFY ?auto_150740 ?auto_150741 ?auto_150742 ?auto_150739 ?auto_150743 ?auto_150744 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153511 - DIRECTION
      ?auto_153512 - MODE
      ?auto_153513 - DIRECTION
      ?auto_153510 - MODE
      ?auto_153514 - DIRECTION
      ?auto_153515 - MODE
    )
    :vars
    (
      ?auto_153516 - INSTRUMENT
      ?auto_153521 - SATELLITE
      ?auto_153519 - DIRECTION
      ?auto_153518 - DIRECTION
      ?auto_153517 - MODE
      ?auto_153520 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153516 ?auto_153521 ) ( SUPPORTS ?auto_153516 ?auto_153512 ) ( not ( = ?auto_153511 ?auto_153519 ) ) ( HAVE_IMAGE ?auto_153518 ?auto_153517 ) ( not ( = ?auto_153518 ?auto_153511 ) ) ( not ( = ?auto_153518 ?auto_153519 ) ) ( not ( = ?auto_153517 ?auto_153512 ) ) ( CALIBRATION_TARGET ?auto_153516 ?auto_153519 ) ( not ( = ?auto_153519 ?auto_153513 ) ) ( not ( = ?auto_153511 ?auto_153513 ) ) ( not ( = ?auto_153518 ?auto_153513 ) ) ( ON_BOARD ?auto_153520 ?auto_153521 ) ( POWER_ON ?auto_153520 ) ( not ( = ?auto_153516 ?auto_153520 ) ) ( POINTING ?auto_153521 ?auto_153519 ) ( HAVE_IMAGE ?auto_153513 ?auto_153510 ) ( HAVE_IMAGE ?auto_153514 ?auto_153515 ) ( not ( = ?auto_153511 ?auto_153514 ) ) ( not ( = ?auto_153512 ?auto_153510 ) ) ( not ( = ?auto_153512 ?auto_153515 ) ) ( not ( = ?auto_153513 ?auto_153514 ) ) ( not ( = ?auto_153510 ?auto_153515 ) ) ( not ( = ?auto_153510 ?auto_153517 ) ) ( not ( = ?auto_153514 ?auto_153519 ) ) ( not ( = ?auto_153514 ?auto_153518 ) ) ( not ( = ?auto_153515 ?auto_153517 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153518 ?auto_153517 ?auto_153511 ?auto_153512 )
      ( GET-3IMAGE-VERIFY ?auto_153511 ?auto_153512 ?auto_153513 ?auto_153510 ?auto_153514 ?auto_153515 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_150884 - DIRECTION
      ?auto_150885 - MODE
      ?auto_150886 - DIRECTION
      ?auto_150883 - MODE
      ?auto_150887 - DIRECTION
      ?auto_150888 - MODE
      ?auto_150889 - DIRECTION
      ?auto_150890 - MODE
    )
    :vars
    (
      ?auto_150894 - INSTRUMENT
      ?auto_150891 - SATELLITE
      ?auto_150892 - DIRECTION
      ?auto_150893 - DIRECTION
      ?auto_150895 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_150894 ?auto_150891 ) ( SUPPORTS ?auto_150894 ?auto_150890 ) ( not ( = ?auto_150889 ?auto_150892 ) ) ( HAVE_IMAGE ?auto_150884 ?auto_150888 ) ( not ( = ?auto_150884 ?auto_150889 ) ) ( not ( = ?auto_150884 ?auto_150892 ) ) ( not ( = ?auto_150888 ?auto_150890 ) ) ( CALIBRATION_TARGET ?auto_150894 ?auto_150892 ) ( not ( = ?auto_150892 ?auto_150893 ) ) ( not ( = ?auto_150889 ?auto_150893 ) ) ( not ( = ?auto_150884 ?auto_150893 ) ) ( ON_BOARD ?auto_150895 ?auto_150891 ) ( POWER_ON ?auto_150895 ) ( not ( = ?auto_150894 ?auto_150895 ) ) ( POINTING ?auto_150891 ?auto_150892 ) ( HAVE_IMAGE ?auto_150884 ?auto_150885 ) ( HAVE_IMAGE ?auto_150886 ?auto_150883 ) ( HAVE_IMAGE ?auto_150887 ?auto_150888 ) ( not ( = ?auto_150884 ?auto_150886 ) ) ( not ( = ?auto_150884 ?auto_150887 ) ) ( not ( = ?auto_150885 ?auto_150883 ) ) ( not ( = ?auto_150885 ?auto_150888 ) ) ( not ( = ?auto_150885 ?auto_150890 ) ) ( not ( = ?auto_150886 ?auto_150887 ) ) ( not ( = ?auto_150886 ?auto_150889 ) ) ( not ( = ?auto_150886 ?auto_150892 ) ) ( not ( = ?auto_150886 ?auto_150893 ) ) ( not ( = ?auto_150883 ?auto_150888 ) ) ( not ( = ?auto_150883 ?auto_150890 ) ) ( not ( = ?auto_150887 ?auto_150889 ) ) ( not ( = ?auto_150887 ?auto_150892 ) ) ( not ( = ?auto_150887 ?auto_150893 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_150884 ?auto_150888 ?auto_150889 ?auto_150890 )
      ( GET-4IMAGE-VERIFY ?auto_150884 ?auto_150885 ?auto_150886 ?auto_150883 ?auto_150887 ?auto_150888 ?auto_150889 ?auto_150890 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153658 - DIRECTION
      ?auto_153659 - MODE
      ?auto_153660 - DIRECTION
      ?auto_153657 - MODE
      ?auto_153661 - DIRECTION
      ?auto_153662 - MODE
      ?auto_153663 - DIRECTION
      ?auto_153664 - MODE
    )
    :vars
    (
      ?auto_153665 - INSTRUMENT
      ?auto_153668 - SATELLITE
      ?auto_153666 - DIRECTION
      ?auto_153667 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153665 ?auto_153668 ) ( SUPPORTS ?auto_153665 ?auto_153664 ) ( not ( = ?auto_153663 ?auto_153666 ) ) ( HAVE_IMAGE ?auto_153660 ?auto_153659 ) ( not ( = ?auto_153660 ?auto_153663 ) ) ( not ( = ?auto_153660 ?auto_153666 ) ) ( not ( = ?auto_153659 ?auto_153664 ) ) ( CALIBRATION_TARGET ?auto_153665 ?auto_153666 ) ( not ( = ?auto_153666 ?auto_153661 ) ) ( not ( = ?auto_153663 ?auto_153661 ) ) ( not ( = ?auto_153660 ?auto_153661 ) ) ( ON_BOARD ?auto_153667 ?auto_153668 ) ( POWER_ON ?auto_153667 ) ( not ( = ?auto_153665 ?auto_153667 ) ) ( POINTING ?auto_153668 ?auto_153666 ) ( HAVE_IMAGE ?auto_153658 ?auto_153659 ) ( HAVE_IMAGE ?auto_153660 ?auto_153657 ) ( HAVE_IMAGE ?auto_153661 ?auto_153662 ) ( not ( = ?auto_153658 ?auto_153660 ) ) ( not ( = ?auto_153658 ?auto_153661 ) ) ( not ( = ?auto_153658 ?auto_153663 ) ) ( not ( = ?auto_153658 ?auto_153666 ) ) ( not ( = ?auto_153659 ?auto_153657 ) ) ( not ( = ?auto_153659 ?auto_153662 ) ) ( not ( = ?auto_153657 ?auto_153662 ) ) ( not ( = ?auto_153657 ?auto_153664 ) ) ( not ( = ?auto_153662 ?auto_153664 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153660 ?auto_153659 ?auto_153663 ?auto_153664 )
      ( GET-4IMAGE-VERIFY ?auto_153658 ?auto_153659 ?auto_153660 ?auto_153657 ?auto_153661 ?auto_153662 ?auto_153663 ?auto_153664 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153770 - DIRECTION
      ?auto_153771 - MODE
      ?auto_153772 - DIRECTION
      ?auto_153769 - MODE
      ?auto_153773 - DIRECTION
      ?auto_153774 - MODE
      ?auto_153775 - DIRECTION
      ?auto_153776 - MODE
    )
    :vars
    (
      ?auto_153777 - INSTRUMENT
      ?auto_153780 - SATELLITE
      ?auto_153778 - DIRECTION
      ?auto_153779 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153777 ?auto_153780 ) ( SUPPORTS ?auto_153777 ?auto_153774 ) ( not ( = ?auto_153773 ?auto_153778 ) ) ( HAVE_IMAGE ?auto_153770 ?auto_153776 ) ( not ( = ?auto_153770 ?auto_153773 ) ) ( not ( = ?auto_153770 ?auto_153778 ) ) ( not ( = ?auto_153776 ?auto_153774 ) ) ( CALIBRATION_TARGET ?auto_153777 ?auto_153778 ) ( not ( = ?auto_153778 ?auto_153772 ) ) ( not ( = ?auto_153773 ?auto_153772 ) ) ( not ( = ?auto_153770 ?auto_153772 ) ) ( ON_BOARD ?auto_153779 ?auto_153780 ) ( POWER_ON ?auto_153779 ) ( not ( = ?auto_153777 ?auto_153779 ) ) ( POINTING ?auto_153780 ?auto_153778 ) ( HAVE_IMAGE ?auto_153770 ?auto_153771 ) ( HAVE_IMAGE ?auto_153772 ?auto_153769 ) ( HAVE_IMAGE ?auto_153775 ?auto_153776 ) ( not ( = ?auto_153770 ?auto_153775 ) ) ( not ( = ?auto_153771 ?auto_153769 ) ) ( not ( = ?auto_153771 ?auto_153774 ) ) ( not ( = ?auto_153771 ?auto_153776 ) ) ( not ( = ?auto_153772 ?auto_153775 ) ) ( not ( = ?auto_153769 ?auto_153774 ) ) ( not ( = ?auto_153769 ?auto_153776 ) ) ( not ( = ?auto_153773 ?auto_153775 ) ) ( not ( = ?auto_153775 ?auto_153778 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153770 ?auto_153776 ?auto_153773 ?auto_153774 )
      ( GET-4IMAGE-VERIFY ?auto_153770 ?auto_153771 ?auto_153772 ?auto_153769 ?auto_153773 ?auto_153774 ?auto_153775 ?auto_153776 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_150935 - DIRECTION
      ?auto_150936 - MODE
      ?auto_150937 - DIRECTION
      ?auto_150934 - MODE
      ?auto_150938 - DIRECTION
      ?auto_150939 - MODE
      ?auto_150940 - DIRECTION
      ?auto_150941 - MODE
    )
    :vars
    (
      ?auto_150945 - INSTRUMENT
      ?auto_150942 - SATELLITE
      ?auto_150943 - DIRECTION
      ?auto_150944 - DIRECTION
      ?auto_150946 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_150945 ?auto_150942 ) ( SUPPORTS ?auto_150945 ?auto_150939 ) ( not ( = ?auto_150938 ?auto_150943 ) ) ( HAVE_IMAGE ?auto_150937 ?auto_150936 ) ( not ( = ?auto_150937 ?auto_150938 ) ) ( not ( = ?auto_150937 ?auto_150943 ) ) ( not ( = ?auto_150936 ?auto_150939 ) ) ( CALIBRATION_TARGET ?auto_150945 ?auto_150943 ) ( not ( = ?auto_150943 ?auto_150944 ) ) ( not ( = ?auto_150938 ?auto_150944 ) ) ( not ( = ?auto_150937 ?auto_150944 ) ) ( ON_BOARD ?auto_150946 ?auto_150942 ) ( POWER_ON ?auto_150946 ) ( not ( = ?auto_150945 ?auto_150946 ) ) ( POINTING ?auto_150942 ?auto_150943 ) ( HAVE_IMAGE ?auto_150935 ?auto_150936 ) ( HAVE_IMAGE ?auto_150937 ?auto_150934 ) ( HAVE_IMAGE ?auto_150940 ?auto_150941 ) ( not ( = ?auto_150935 ?auto_150937 ) ) ( not ( = ?auto_150935 ?auto_150938 ) ) ( not ( = ?auto_150935 ?auto_150940 ) ) ( not ( = ?auto_150935 ?auto_150943 ) ) ( not ( = ?auto_150935 ?auto_150944 ) ) ( not ( = ?auto_150936 ?auto_150934 ) ) ( not ( = ?auto_150936 ?auto_150941 ) ) ( not ( = ?auto_150937 ?auto_150940 ) ) ( not ( = ?auto_150934 ?auto_150939 ) ) ( not ( = ?auto_150934 ?auto_150941 ) ) ( not ( = ?auto_150938 ?auto_150940 ) ) ( not ( = ?auto_150939 ?auto_150941 ) ) ( not ( = ?auto_150940 ?auto_150943 ) ) ( not ( = ?auto_150940 ?auto_150944 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_150937 ?auto_150936 ?auto_150938 ?auto_150939 )
      ( GET-4IMAGE-VERIFY ?auto_150935 ?auto_150936 ?auto_150937 ?auto_150934 ?auto_150938 ?auto_150939 ?auto_150940 ?auto_150941 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_154232 - DIRECTION
      ?auto_154233 - MODE
      ?auto_154234 - DIRECTION
      ?auto_154231 - MODE
      ?auto_154235 - DIRECTION
      ?auto_154236 - MODE
      ?auto_154237 - DIRECTION
      ?auto_154238 - MODE
    )
    :vars
    (
      ?auto_154239 - INSTRUMENT
      ?auto_154242 - SATELLITE
      ?auto_154240 - DIRECTION
      ?auto_154241 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_154239 ?auto_154242 ) ( SUPPORTS ?auto_154239 ?auto_154236 ) ( not ( = ?auto_154235 ?auto_154240 ) ) ( HAVE_IMAGE ?auto_154237 ?auto_154238 ) ( not ( = ?auto_154237 ?auto_154235 ) ) ( not ( = ?auto_154237 ?auto_154240 ) ) ( not ( = ?auto_154238 ?auto_154236 ) ) ( CALIBRATION_TARGET ?auto_154239 ?auto_154240 ) ( not ( = ?auto_154240 ?auto_154234 ) ) ( not ( = ?auto_154235 ?auto_154234 ) ) ( not ( = ?auto_154237 ?auto_154234 ) ) ( ON_BOARD ?auto_154241 ?auto_154242 ) ( POWER_ON ?auto_154241 ) ( not ( = ?auto_154239 ?auto_154241 ) ) ( POINTING ?auto_154242 ?auto_154240 ) ( HAVE_IMAGE ?auto_154232 ?auto_154233 ) ( HAVE_IMAGE ?auto_154234 ?auto_154231 ) ( not ( = ?auto_154232 ?auto_154234 ) ) ( not ( = ?auto_154232 ?auto_154235 ) ) ( not ( = ?auto_154232 ?auto_154237 ) ) ( not ( = ?auto_154232 ?auto_154240 ) ) ( not ( = ?auto_154233 ?auto_154231 ) ) ( not ( = ?auto_154233 ?auto_154236 ) ) ( not ( = ?auto_154233 ?auto_154238 ) ) ( not ( = ?auto_154231 ?auto_154236 ) ) ( not ( = ?auto_154231 ?auto_154238 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_154237 ?auto_154238 ?auto_154235 ?auto_154236 )
      ( GET-4IMAGE-VERIFY ?auto_154232 ?auto_154233 ?auto_154234 ?auto_154231 ?auto_154235 ?auto_154236 ?auto_154237 ?auto_154238 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153696 - DIRECTION
      ?auto_153697 - MODE
      ?auto_153698 - DIRECTION
      ?auto_153695 - MODE
      ?auto_153699 - DIRECTION
      ?auto_153700 - MODE
      ?auto_153701 - DIRECTION
      ?auto_153702 - MODE
    )
    :vars
    (
      ?auto_153703 - INSTRUMENT
      ?auto_153706 - SATELLITE
      ?auto_153704 - DIRECTION
      ?auto_153705 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153703 ?auto_153706 ) ( SUPPORTS ?auto_153703 ?auto_153700 ) ( not ( = ?auto_153699 ?auto_153704 ) ) ( HAVE_IMAGE ?auto_153696 ?auto_153697 ) ( not ( = ?auto_153696 ?auto_153699 ) ) ( not ( = ?auto_153696 ?auto_153704 ) ) ( not ( = ?auto_153697 ?auto_153700 ) ) ( CALIBRATION_TARGET ?auto_153703 ?auto_153704 ) ( not ( = ?auto_153704 ?auto_153701 ) ) ( not ( = ?auto_153699 ?auto_153701 ) ) ( not ( = ?auto_153696 ?auto_153701 ) ) ( ON_BOARD ?auto_153705 ?auto_153706 ) ( POWER_ON ?auto_153705 ) ( not ( = ?auto_153703 ?auto_153705 ) ) ( POINTING ?auto_153706 ?auto_153704 ) ( HAVE_IMAGE ?auto_153698 ?auto_153695 ) ( HAVE_IMAGE ?auto_153701 ?auto_153702 ) ( not ( = ?auto_153696 ?auto_153698 ) ) ( not ( = ?auto_153697 ?auto_153695 ) ) ( not ( = ?auto_153697 ?auto_153702 ) ) ( not ( = ?auto_153698 ?auto_153699 ) ) ( not ( = ?auto_153698 ?auto_153701 ) ) ( not ( = ?auto_153698 ?auto_153704 ) ) ( not ( = ?auto_153695 ?auto_153700 ) ) ( not ( = ?auto_153695 ?auto_153702 ) ) ( not ( = ?auto_153700 ?auto_153702 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153696 ?auto_153697 ?auto_153699 ?auto_153700 )
      ( GET-4IMAGE-VERIFY ?auto_153696 ?auto_153697 ?auto_153698 ?auto_153695 ?auto_153699 ?auto_153700 ?auto_153701 ?auto_153702 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153970 - DIRECTION
      ?auto_153971 - MODE
      ?auto_153972 - DIRECTION
      ?auto_153969 - MODE
      ?auto_153973 - DIRECTION
      ?auto_153974 - MODE
      ?auto_153975 - DIRECTION
      ?auto_153976 - MODE
    )
    :vars
    (
      ?auto_153977 - INSTRUMENT
      ?auto_153980 - SATELLITE
      ?auto_153978 - DIRECTION
      ?auto_153979 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153977 ?auto_153980 ) ( SUPPORTS ?auto_153977 ?auto_153969 ) ( not ( = ?auto_153972 ?auto_153978 ) ) ( HAVE_IMAGE ?auto_153970 ?auto_153971 ) ( not ( = ?auto_153970 ?auto_153972 ) ) ( not ( = ?auto_153970 ?auto_153978 ) ) ( not ( = ?auto_153971 ?auto_153969 ) ) ( CALIBRATION_TARGET ?auto_153977 ?auto_153978 ) ( not ( = ?auto_153978 ?auto_153973 ) ) ( not ( = ?auto_153972 ?auto_153973 ) ) ( not ( = ?auto_153970 ?auto_153973 ) ) ( ON_BOARD ?auto_153979 ?auto_153980 ) ( POWER_ON ?auto_153979 ) ( not ( = ?auto_153977 ?auto_153979 ) ) ( POINTING ?auto_153980 ?auto_153978 ) ( HAVE_IMAGE ?auto_153973 ?auto_153974 ) ( HAVE_IMAGE ?auto_153975 ?auto_153976 ) ( not ( = ?auto_153970 ?auto_153975 ) ) ( not ( = ?auto_153971 ?auto_153974 ) ) ( not ( = ?auto_153971 ?auto_153976 ) ) ( not ( = ?auto_153972 ?auto_153975 ) ) ( not ( = ?auto_153969 ?auto_153974 ) ) ( not ( = ?auto_153969 ?auto_153976 ) ) ( not ( = ?auto_153973 ?auto_153975 ) ) ( not ( = ?auto_153974 ?auto_153976 ) ) ( not ( = ?auto_153975 ?auto_153978 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153970 ?auto_153971 ?auto_153972 ?auto_153969 )
      ( GET-4IMAGE-VERIFY ?auto_153970 ?auto_153971 ?auto_153972 ?auto_153969 ?auto_153973 ?auto_153974 ?auto_153975 ?auto_153976 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_154380 - DIRECTION
      ?auto_154381 - MODE
      ?auto_154382 - DIRECTION
      ?auto_154379 - MODE
      ?auto_154383 - DIRECTION
      ?auto_154384 - MODE
      ?auto_154385 - DIRECTION
      ?auto_154386 - MODE
    )
    :vars
    (
      ?auto_154387 - INSTRUMENT
      ?auto_154390 - SATELLITE
      ?auto_154388 - DIRECTION
      ?auto_154389 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_154387 ?auto_154390 ) ( SUPPORTS ?auto_154387 ?auto_154379 ) ( not ( = ?auto_154382 ?auto_154388 ) ) ( HAVE_IMAGE ?auto_154385 ?auto_154386 ) ( not ( = ?auto_154385 ?auto_154382 ) ) ( not ( = ?auto_154385 ?auto_154388 ) ) ( not ( = ?auto_154386 ?auto_154379 ) ) ( CALIBRATION_TARGET ?auto_154387 ?auto_154388 ) ( not ( = ?auto_154388 ?auto_154380 ) ) ( not ( = ?auto_154382 ?auto_154380 ) ) ( not ( = ?auto_154385 ?auto_154380 ) ) ( ON_BOARD ?auto_154389 ?auto_154390 ) ( POWER_ON ?auto_154389 ) ( not ( = ?auto_154387 ?auto_154389 ) ) ( POINTING ?auto_154390 ?auto_154388 ) ( HAVE_IMAGE ?auto_154380 ?auto_154381 ) ( HAVE_IMAGE ?auto_154383 ?auto_154384 ) ( not ( = ?auto_154380 ?auto_154383 ) ) ( not ( = ?auto_154381 ?auto_154379 ) ) ( not ( = ?auto_154381 ?auto_154384 ) ) ( not ( = ?auto_154381 ?auto_154386 ) ) ( not ( = ?auto_154382 ?auto_154383 ) ) ( not ( = ?auto_154379 ?auto_154384 ) ) ( not ( = ?auto_154383 ?auto_154385 ) ) ( not ( = ?auto_154383 ?auto_154388 ) ) ( not ( = ?auto_154384 ?auto_154386 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_154385 ?auto_154386 ?auto_154382 ?auto_154379 )
      ( GET-4IMAGE-VERIFY ?auto_154380 ?auto_154381 ?auto_154382 ?auto_154379 ?auto_154383 ?auto_154384 ?auto_154385 ?auto_154386 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153734 - DIRECTION
      ?auto_153735 - MODE
      ?auto_153736 - DIRECTION
      ?auto_153733 - MODE
      ?auto_153737 - DIRECTION
      ?auto_153738 - MODE
      ?auto_153739 - DIRECTION
      ?auto_153740 - MODE
    )
    :vars
    (
      ?auto_153741 - INSTRUMENT
      ?auto_153744 - SATELLITE
      ?auto_153742 - DIRECTION
      ?auto_153743 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153741 ?auto_153744 ) ( SUPPORTS ?auto_153741 ?auto_153740 ) ( not ( = ?auto_153739 ?auto_153742 ) ) ( HAVE_IMAGE ?auto_153737 ?auto_153738 ) ( not ( = ?auto_153737 ?auto_153739 ) ) ( not ( = ?auto_153737 ?auto_153742 ) ) ( not ( = ?auto_153738 ?auto_153740 ) ) ( CALIBRATION_TARGET ?auto_153741 ?auto_153742 ) ( not ( = ?auto_153742 ?auto_153736 ) ) ( not ( = ?auto_153739 ?auto_153736 ) ) ( not ( = ?auto_153737 ?auto_153736 ) ) ( ON_BOARD ?auto_153743 ?auto_153744 ) ( POWER_ON ?auto_153743 ) ( not ( = ?auto_153741 ?auto_153743 ) ) ( POINTING ?auto_153744 ?auto_153742 ) ( HAVE_IMAGE ?auto_153734 ?auto_153735 ) ( HAVE_IMAGE ?auto_153736 ?auto_153733 ) ( not ( = ?auto_153734 ?auto_153736 ) ) ( not ( = ?auto_153734 ?auto_153737 ) ) ( not ( = ?auto_153734 ?auto_153739 ) ) ( not ( = ?auto_153734 ?auto_153742 ) ) ( not ( = ?auto_153735 ?auto_153733 ) ) ( not ( = ?auto_153735 ?auto_153738 ) ) ( not ( = ?auto_153735 ?auto_153740 ) ) ( not ( = ?auto_153733 ?auto_153738 ) ) ( not ( = ?auto_153733 ?auto_153740 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153737 ?auto_153738 ?auto_153739 ?auto_153740 )
      ( GET-4IMAGE-VERIFY ?auto_153734 ?auto_153735 ?auto_153736 ?auto_153733 ?auto_153737 ?auto_153738 ?auto_153739 ?auto_153740 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_154108 - DIRECTION
      ?auto_154109 - MODE
      ?auto_154110 - DIRECTION
      ?auto_154107 - MODE
      ?auto_154111 - DIRECTION
      ?auto_154112 - MODE
      ?auto_154113 - DIRECTION
      ?auto_154114 - MODE
    )
    :vars
    (
      ?auto_154115 - INSTRUMENT
      ?auto_154118 - SATELLITE
      ?auto_154116 - DIRECTION
      ?auto_154117 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_154115 ?auto_154118 ) ( SUPPORTS ?auto_154115 ?auto_154114 ) ( not ( = ?auto_154113 ?auto_154116 ) ) ( HAVE_IMAGE ?auto_154110 ?auto_154107 ) ( not ( = ?auto_154110 ?auto_154113 ) ) ( not ( = ?auto_154110 ?auto_154116 ) ) ( not ( = ?auto_154107 ?auto_154114 ) ) ( CALIBRATION_TARGET ?auto_154115 ?auto_154116 ) ( not ( = ?auto_154116 ?auto_154108 ) ) ( not ( = ?auto_154113 ?auto_154108 ) ) ( not ( = ?auto_154110 ?auto_154108 ) ) ( ON_BOARD ?auto_154117 ?auto_154118 ) ( POWER_ON ?auto_154117 ) ( not ( = ?auto_154115 ?auto_154117 ) ) ( POINTING ?auto_154118 ?auto_154116 ) ( HAVE_IMAGE ?auto_154108 ?auto_154109 ) ( HAVE_IMAGE ?auto_154111 ?auto_154112 ) ( not ( = ?auto_154108 ?auto_154111 ) ) ( not ( = ?auto_154109 ?auto_154107 ) ) ( not ( = ?auto_154109 ?auto_154112 ) ) ( not ( = ?auto_154109 ?auto_154114 ) ) ( not ( = ?auto_154110 ?auto_154111 ) ) ( not ( = ?auto_154107 ?auto_154112 ) ) ( not ( = ?auto_154111 ?auto_154113 ) ) ( not ( = ?auto_154111 ?auto_154116 ) ) ( not ( = ?auto_154112 ?auto_154114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_154110 ?auto_154107 ?auto_154113 ?auto_154114 )
      ( GET-4IMAGE-VERIFY ?auto_154108 ?auto_154109 ?auto_154110 ?auto_154107 ?auto_154111 ?auto_154112 ?auto_154113 ?auto_154114 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_154144 - DIRECTION
      ?auto_154145 - MODE
      ?auto_154146 - DIRECTION
      ?auto_154143 - MODE
      ?auto_154147 - DIRECTION
      ?auto_154148 - MODE
      ?auto_154149 - DIRECTION
      ?auto_154150 - MODE
    )
    :vars
    (
      ?auto_154151 - INSTRUMENT
      ?auto_154154 - SATELLITE
      ?auto_154152 - DIRECTION
      ?auto_154153 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_154151 ?auto_154154 ) ( SUPPORTS ?auto_154151 ?auto_154148 ) ( not ( = ?auto_154147 ?auto_154152 ) ) ( HAVE_IMAGE ?auto_154146 ?auto_154150 ) ( not ( = ?auto_154146 ?auto_154147 ) ) ( not ( = ?auto_154146 ?auto_154152 ) ) ( not ( = ?auto_154150 ?auto_154148 ) ) ( CALIBRATION_TARGET ?auto_154151 ?auto_154152 ) ( not ( = ?auto_154152 ?auto_154144 ) ) ( not ( = ?auto_154147 ?auto_154144 ) ) ( not ( = ?auto_154146 ?auto_154144 ) ) ( ON_BOARD ?auto_154153 ?auto_154154 ) ( POWER_ON ?auto_154153 ) ( not ( = ?auto_154151 ?auto_154153 ) ) ( POINTING ?auto_154154 ?auto_154152 ) ( HAVE_IMAGE ?auto_154144 ?auto_154145 ) ( HAVE_IMAGE ?auto_154146 ?auto_154143 ) ( HAVE_IMAGE ?auto_154149 ?auto_154150 ) ( not ( = ?auto_154144 ?auto_154149 ) ) ( not ( = ?auto_154145 ?auto_154143 ) ) ( not ( = ?auto_154145 ?auto_154148 ) ) ( not ( = ?auto_154145 ?auto_154150 ) ) ( not ( = ?auto_154146 ?auto_154149 ) ) ( not ( = ?auto_154143 ?auto_154148 ) ) ( not ( = ?auto_154143 ?auto_154150 ) ) ( not ( = ?auto_154147 ?auto_154149 ) ) ( not ( = ?auto_154149 ?auto_154152 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_154146 ?auto_154150 ?auto_154147 ?auto_154148 )
      ( GET-4IMAGE-VERIFY ?auto_154144 ?auto_154145 ?auto_154146 ?auto_154143 ?auto_154147 ?auto_154148 ?auto_154149 ?auto_154150 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_154156 - DIRECTION
      ?auto_154157 - MODE
      ?auto_154158 - DIRECTION
      ?auto_154155 - MODE
      ?auto_154159 - DIRECTION
      ?auto_154160 - MODE
      ?auto_154161 - DIRECTION
      ?auto_154162 - MODE
    )
    :vars
    (
      ?auto_154163 - INSTRUMENT
      ?auto_154166 - SATELLITE
      ?auto_154164 - DIRECTION
      ?auto_154165 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_154163 ?auto_154166 ) ( SUPPORTS ?auto_154163 ?auto_154160 ) ( not ( = ?auto_154159 ?auto_154164 ) ) ( HAVE_IMAGE ?auto_154158 ?auto_154155 ) ( not ( = ?auto_154158 ?auto_154159 ) ) ( not ( = ?auto_154158 ?auto_154164 ) ) ( not ( = ?auto_154155 ?auto_154160 ) ) ( CALIBRATION_TARGET ?auto_154163 ?auto_154164 ) ( not ( = ?auto_154164 ?auto_154156 ) ) ( not ( = ?auto_154159 ?auto_154156 ) ) ( not ( = ?auto_154158 ?auto_154156 ) ) ( ON_BOARD ?auto_154165 ?auto_154166 ) ( POWER_ON ?auto_154165 ) ( not ( = ?auto_154163 ?auto_154165 ) ) ( POINTING ?auto_154166 ?auto_154164 ) ( HAVE_IMAGE ?auto_154156 ?auto_154157 ) ( HAVE_IMAGE ?auto_154161 ?auto_154162 ) ( not ( = ?auto_154156 ?auto_154161 ) ) ( not ( = ?auto_154157 ?auto_154155 ) ) ( not ( = ?auto_154157 ?auto_154160 ) ) ( not ( = ?auto_154157 ?auto_154162 ) ) ( not ( = ?auto_154158 ?auto_154161 ) ) ( not ( = ?auto_154155 ?auto_154162 ) ) ( not ( = ?auto_154159 ?auto_154161 ) ) ( not ( = ?auto_154160 ?auto_154162 ) ) ( not ( = ?auto_154161 ?auto_154164 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_154158 ?auto_154155 ?auto_154159 ?auto_154160 )
      ( GET-4IMAGE-VERIFY ?auto_154156 ?auto_154157 ?auto_154158 ?auto_154155 ?auto_154159 ?auto_154160 ?auto_154161 ?auto_154162 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_154204 - DIRECTION
      ?auto_154205 - MODE
      ?auto_154206 - DIRECTION
      ?auto_154203 - MODE
      ?auto_154207 - DIRECTION
      ?auto_154208 - MODE
      ?auto_154209 - DIRECTION
      ?auto_154210 - MODE
    )
    :vars
    (
      ?auto_154211 - INSTRUMENT
      ?auto_154216 - SATELLITE
      ?auto_154214 - DIRECTION
      ?auto_154213 - DIRECTION
      ?auto_154212 - MODE
      ?auto_154215 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_154211 ?auto_154216 ) ( SUPPORTS ?auto_154211 ?auto_154210 ) ( not ( = ?auto_154209 ?auto_154214 ) ) ( HAVE_IMAGE ?auto_154213 ?auto_154212 ) ( not ( = ?auto_154213 ?auto_154209 ) ) ( not ( = ?auto_154213 ?auto_154214 ) ) ( not ( = ?auto_154212 ?auto_154210 ) ) ( CALIBRATION_TARGET ?auto_154211 ?auto_154214 ) ( not ( = ?auto_154214 ?auto_154204 ) ) ( not ( = ?auto_154209 ?auto_154204 ) ) ( not ( = ?auto_154213 ?auto_154204 ) ) ( ON_BOARD ?auto_154215 ?auto_154216 ) ( POWER_ON ?auto_154215 ) ( not ( = ?auto_154211 ?auto_154215 ) ) ( POINTING ?auto_154216 ?auto_154214 ) ( HAVE_IMAGE ?auto_154204 ?auto_154205 ) ( HAVE_IMAGE ?auto_154206 ?auto_154203 ) ( HAVE_IMAGE ?auto_154207 ?auto_154208 ) ( not ( = ?auto_154204 ?auto_154206 ) ) ( not ( = ?auto_154204 ?auto_154207 ) ) ( not ( = ?auto_154205 ?auto_154203 ) ) ( not ( = ?auto_154205 ?auto_154208 ) ) ( not ( = ?auto_154205 ?auto_154210 ) ) ( not ( = ?auto_154205 ?auto_154212 ) ) ( not ( = ?auto_154206 ?auto_154207 ) ) ( not ( = ?auto_154206 ?auto_154209 ) ) ( not ( = ?auto_154206 ?auto_154214 ) ) ( not ( = ?auto_154206 ?auto_154213 ) ) ( not ( = ?auto_154203 ?auto_154208 ) ) ( not ( = ?auto_154203 ?auto_154210 ) ) ( not ( = ?auto_154203 ?auto_154212 ) ) ( not ( = ?auto_154207 ?auto_154209 ) ) ( not ( = ?auto_154207 ?auto_154214 ) ) ( not ( = ?auto_154207 ?auto_154213 ) ) ( not ( = ?auto_154208 ?auto_154210 ) ) ( not ( = ?auto_154208 ?auto_154212 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_154213 ?auto_154212 ?auto_154209 ?auto_154210 )
      ( GET-4IMAGE-VERIFY ?auto_154204 ?auto_154205 ?auto_154206 ?auto_154203 ?auto_154207 ?auto_154208 ?auto_154209 ?auto_154210 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_154244 - DIRECTION
      ?auto_154245 - MODE
      ?auto_154246 - DIRECTION
      ?auto_154243 - MODE
      ?auto_154247 - DIRECTION
      ?auto_154248 - MODE
      ?auto_154249 - DIRECTION
      ?auto_154250 - MODE
    )
    :vars
    (
      ?auto_154251 - INSTRUMENT
      ?auto_154256 - SATELLITE
      ?auto_154254 - DIRECTION
      ?auto_154253 - DIRECTION
      ?auto_154252 - MODE
      ?auto_154255 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_154251 ?auto_154256 ) ( SUPPORTS ?auto_154251 ?auto_154248 ) ( not ( = ?auto_154247 ?auto_154254 ) ) ( HAVE_IMAGE ?auto_154253 ?auto_154252 ) ( not ( = ?auto_154253 ?auto_154247 ) ) ( not ( = ?auto_154253 ?auto_154254 ) ) ( not ( = ?auto_154252 ?auto_154248 ) ) ( CALIBRATION_TARGET ?auto_154251 ?auto_154254 ) ( not ( = ?auto_154254 ?auto_154246 ) ) ( not ( = ?auto_154247 ?auto_154246 ) ) ( not ( = ?auto_154253 ?auto_154246 ) ) ( ON_BOARD ?auto_154255 ?auto_154256 ) ( POWER_ON ?auto_154255 ) ( not ( = ?auto_154251 ?auto_154255 ) ) ( POINTING ?auto_154256 ?auto_154254 ) ( HAVE_IMAGE ?auto_154244 ?auto_154245 ) ( HAVE_IMAGE ?auto_154246 ?auto_154243 ) ( HAVE_IMAGE ?auto_154249 ?auto_154250 ) ( not ( = ?auto_154244 ?auto_154246 ) ) ( not ( = ?auto_154244 ?auto_154247 ) ) ( not ( = ?auto_154244 ?auto_154249 ) ) ( not ( = ?auto_154244 ?auto_154254 ) ) ( not ( = ?auto_154244 ?auto_154253 ) ) ( not ( = ?auto_154245 ?auto_154243 ) ) ( not ( = ?auto_154245 ?auto_154248 ) ) ( not ( = ?auto_154245 ?auto_154250 ) ) ( not ( = ?auto_154245 ?auto_154252 ) ) ( not ( = ?auto_154246 ?auto_154249 ) ) ( not ( = ?auto_154243 ?auto_154248 ) ) ( not ( = ?auto_154243 ?auto_154250 ) ) ( not ( = ?auto_154243 ?auto_154252 ) ) ( not ( = ?auto_154247 ?auto_154249 ) ) ( not ( = ?auto_154248 ?auto_154250 ) ) ( not ( = ?auto_154249 ?auto_154254 ) ) ( not ( = ?auto_154249 ?auto_154253 ) ) ( not ( = ?auto_154250 ?auto_154252 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_154253 ?auto_154252 ?auto_154247 ?auto_154248 )
      ( GET-4IMAGE-VERIFY ?auto_154244 ?auto_154245 ?auto_154246 ?auto_154243 ?auto_154247 ?auto_154248 ?auto_154249 ?auto_154250 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_151629 - DIRECTION
      ?auto_151630 - MODE
      ?auto_151631 - DIRECTION
      ?auto_151628 - MODE
      ?auto_151632 - DIRECTION
      ?auto_151633 - MODE
      ?auto_151634 - DIRECTION
      ?auto_151635 - MODE
    )
    :vars
    (
      ?auto_151639 - INSTRUMENT
      ?auto_151636 - SATELLITE
      ?auto_151637 - DIRECTION
      ?auto_151638 - DIRECTION
      ?auto_151640 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_151639 ?auto_151636 ) ( SUPPORTS ?auto_151639 ?auto_151628 ) ( not ( = ?auto_151631 ?auto_151637 ) ) ( HAVE_IMAGE ?auto_151632 ?auto_151635 ) ( not ( = ?auto_151632 ?auto_151631 ) ) ( not ( = ?auto_151632 ?auto_151637 ) ) ( not ( = ?auto_151635 ?auto_151628 ) ) ( CALIBRATION_TARGET ?auto_151639 ?auto_151637 ) ( not ( = ?auto_151637 ?auto_151638 ) ) ( not ( = ?auto_151631 ?auto_151638 ) ) ( not ( = ?auto_151632 ?auto_151638 ) ) ( ON_BOARD ?auto_151640 ?auto_151636 ) ( POWER_ON ?auto_151640 ) ( not ( = ?auto_151639 ?auto_151640 ) ) ( POINTING ?auto_151636 ?auto_151637 ) ( HAVE_IMAGE ?auto_151629 ?auto_151630 ) ( HAVE_IMAGE ?auto_151632 ?auto_151633 ) ( HAVE_IMAGE ?auto_151634 ?auto_151635 ) ( not ( = ?auto_151629 ?auto_151631 ) ) ( not ( = ?auto_151629 ?auto_151632 ) ) ( not ( = ?auto_151629 ?auto_151634 ) ) ( not ( = ?auto_151629 ?auto_151637 ) ) ( not ( = ?auto_151629 ?auto_151638 ) ) ( not ( = ?auto_151630 ?auto_151628 ) ) ( not ( = ?auto_151630 ?auto_151633 ) ) ( not ( = ?auto_151630 ?auto_151635 ) ) ( not ( = ?auto_151631 ?auto_151634 ) ) ( not ( = ?auto_151628 ?auto_151633 ) ) ( not ( = ?auto_151632 ?auto_151634 ) ) ( not ( = ?auto_151633 ?auto_151635 ) ) ( not ( = ?auto_151634 ?auto_151637 ) ) ( not ( = ?auto_151634 ?auto_151638 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_151632 ?auto_151635 ?auto_151631 ?auto_151628 )
      ( GET-4IMAGE-VERIFY ?auto_151629 ?auto_151630 ?auto_151631 ?auto_151628 ?auto_151632 ?auto_151633 ?auto_151634 ?auto_151635 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153920 - DIRECTION
      ?auto_153921 - MODE
      ?auto_153922 - DIRECTION
      ?auto_153919 - MODE
      ?auto_153923 - DIRECTION
      ?auto_153924 - MODE
      ?auto_153925 - DIRECTION
      ?auto_153926 - MODE
    )
    :vars
    (
      ?auto_153927 - INSTRUMENT
      ?auto_153930 - SATELLITE
      ?auto_153928 - DIRECTION
      ?auto_153929 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153927 ?auto_153930 ) ( SUPPORTS ?auto_153927 ?auto_153919 ) ( not ( = ?auto_153922 ?auto_153928 ) ) ( HAVE_IMAGE ?auto_153923 ?auto_153924 ) ( not ( = ?auto_153923 ?auto_153922 ) ) ( not ( = ?auto_153923 ?auto_153928 ) ) ( not ( = ?auto_153924 ?auto_153919 ) ) ( CALIBRATION_TARGET ?auto_153927 ?auto_153928 ) ( not ( = ?auto_153928 ?auto_153925 ) ) ( not ( = ?auto_153922 ?auto_153925 ) ) ( not ( = ?auto_153923 ?auto_153925 ) ) ( ON_BOARD ?auto_153929 ?auto_153930 ) ( POWER_ON ?auto_153929 ) ( not ( = ?auto_153927 ?auto_153929 ) ) ( POINTING ?auto_153930 ?auto_153928 ) ( HAVE_IMAGE ?auto_153920 ?auto_153921 ) ( HAVE_IMAGE ?auto_153925 ?auto_153926 ) ( not ( = ?auto_153920 ?auto_153922 ) ) ( not ( = ?auto_153920 ?auto_153923 ) ) ( not ( = ?auto_153920 ?auto_153925 ) ) ( not ( = ?auto_153920 ?auto_153928 ) ) ( not ( = ?auto_153921 ?auto_153919 ) ) ( not ( = ?auto_153921 ?auto_153924 ) ) ( not ( = ?auto_153921 ?auto_153926 ) ) ( not ( = ?auto_153919 ?auto_153926 ) ) ( not ( = ?auto_153924 ?auto_153926 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153923 ?auto_153924 ?auto_153922 ?auto_153919 )
      ( GET-4IMAGE-VERIFY ?auto_153920 ?auto_153921 ?auto_153922 ?auto_153919 ?auto_153923 ?auto_153924 ?auto_153925 ?auto_153926 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_154440 - DIRECTION
      ?auto_154441 - MODE
      ?auto_154442 - DIRECTION
      ?auto_154439 - MODE
      ?auto_154443 - DIRECTION
      ?auto_154444 - MODE
      ?auto_154445 - DIRECTION
      ?auto_154446 - MODE
    )
    :vars
    (
      ?auto_154447 - INSTRUMENT
      ?auto_154452 - SATELLITE
      ?auto_154450 - DIRECTION
      ?auto_154449 - DIRECTION
      ?auto_154448 - MODE
      ?auto_154451 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_154447 ?auto_154452 ) ( SUPPORTS ?auto_154447 ?auto_154439 ) ( not ( = ?auto_154442 ?auto_154450 ) ) ( HAVE_IMAGE ?auto_154449 ?auto_154448 ) ( not ( = ?auto_154449 ?auto_154442 ) ) ( not ( = ?auto_154449 ?auto_154450 ) ) ( not ( = ?auto_154448 ?auto_154439 ) ) ( CALIBRATION_TARGET ?auto_154447 ?auto_154450 ) ( not ( = ?auto_154450 ?auto_154445 ) ) ( not ( = ?auto_154442 ?auto_154445 ) ) ( not ( = ?auto_154449 ?auto_154445 ) ) ( ON_BOARD ?auto_154451 ?auto_154452 ) ( POWER_ON ?auto_154451 ) ( not ( = ?auto_154447 ?auto_154451 ) ) ( POINTING ?auto_154452 ?auto_154450 ) ( HAVE_IMAGE ?auto_154440 ?auto_154441 ) ( HAVE_IMAGE ?auto_154443 ?auto_154444 ) ( HAVE_IMAGE ?auto_154445 ?auto_154446 ) ( not ( = ?auto_154440 ?auto_154442 ) ) ( not ( = ?auto_154440 ?auto_154443 ) ) ( not ( = ?auto_154440 ?auto_154445 ) ) ( not ( = ?auto_154440 ?auto_154450 ) ) ( not ( = ?auto_154440 ?auto_154449 ) ) ( not ( = ?auto_154441 ?auto_154439 ) ) ( not ( = ?auto_154441 ?auto_154444 ) ) ( not ( = ?auto_154441 ?auto_154446 ) ) ( not ( = ?auto_154441 ?auto_154448 ) ) ( not ( = ?auto_154442 ?auto_154443 ) ) ( not ( = ?auto_154439 ?auto_154444 ) ) ( not ( = ?auto_154439 ?auto_154446 ) ) ( not ( = ?auto_154443 ?auto_154445 ) ) ( not ( = ?auto_154443 ?auto_154450 ) ) ( not ( = ?auto_154443 ?auto_154449 ) ) ( not ( = ?auto_154444 ?auto_154446 ) ) ( not ( = ?auto_154444 ?auto_154448 ) ) ( not ( = ?auto_154446 ?auto_154448 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_154449 ?auto_154448 ?auto_154442 ?auto_154439 )
      ( GET-4IMAGE-VERIFY ?auto_154440 ?auto_154441 ?auto_154442 ?auto_154439 ?auto_154443 ?auto_154444 ?auto_154445 ?auto_154446 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_155142 - DIRECTION
      ?auto_155143 - MODE
      ?auto_155144 - DIRECTION
      ?auto_155141 - MODE
      ?auto_155145 - DIRECTION
      ?auto_155146 - MODE
      ?auto_155147 - DIRECTION
      ?auto_155148 - MODE
    )
    :vars
    (
      ?auto_155149 - INSTRUMENT
      ?auto_155152 - SATELLITE
      ?auto_155150 - DIRECTION
      ?auto_155151 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_155149 ?auto_155152 ) ( SUPPORTS ?auto_155149 ?auto_155143 ) ( not ( = ?auto_155142 ?auto_155150 ) ) ( HAVE_IMAGE ?auto_155144 ?auto_155148 ) ( not ( = ?auto_155144 ?auto_155142 ) ) ( not ( = ?auto_155144 ?auto_155150 ) ) ( not ( = ?auto_155148 ?auto_155143 ) ) ( CALIBRATION_TARGET ?auto_155149 ?auto_155150 ) ( not ( = ?auto_155150 ?auto_155145 ) ) ( not ( = ?auto_155142 ?auto_155145 ) ) ( not ( = ?auto_155144 ?auto_155145 ) ) ( ON_BOARD ?auto_155151 ?auto_155152 ) ( POWER_ON ?auto_155151 ) ( not ( = ?auto_155149 ?auto_155151 ) ) ( POINTING ?auto_155152 ?auto_155150 ) ( HAVE_IMAGE ?auto_155144 ?auto_155141 ) ( HAVE_IMAGE ?auto_155145 ?auto_155146 ) ( HAVE_IMAGE ?auto_155147 ?auto_155148 ) ( not ( = ?auto_155142 ?auto_155147 ) ) ( not ( = ?auto_155143 ?auto_155141 ) ) ( not ( = ?auto_155143 ?auto_155146 ) ) ( not ( = ?auto_155144 ?auto_155147 ) ) ( not ( = ?auto_155141 ?auto_155146 ) ) ( not ( = ?auto_155141 ?auto_155148 ) ) ( not ( = ?auto_155145 ?auto_155147 ) ) ( not ( = ?auto_155146 ?auto_155148 ) ) ( not ( = ?auto_155147 ?auto_155150 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_155144 ?auto_155148 ?auto_155142 ?auto_155143 )
      ( GET-4IMAGE-VERIFY ?auto_155142 ?auto_155143 ?auto_155144 ?auto_155141 ?auto_155145 ?auto_155146 ?auto_155147 ?auto_155148 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_155304 - DIRECTION
      ?auto_155305 - MODE
      ?auto_155306 - DIRECTION
      ?auto_155303 - MODE
      ?auto_155307 - DIRECTION
      ?auto_155308 - MODE
      ?auto_155309 - DIRECTION
      ?auto_155310 - MODE
    )
    :vars
    (
      ?auto_155311 - INSTRUMENT
      ?auto_155314 - SATELLITE
      ?auto_155312 - DIRECTION
      ?auto_155313 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_155311 ?auto_155314 ) ( SUPPORTS ?auto_155311 ?auto_155305 ) ( not ( = ?auto_155304 ?auto_155312 ) ) ( HAVE_IMAGE ?auto_155307 ?auto_155308 ) ( not ( = ?auto_155307 ?auto_155304 ) ) ( not ( = ?auto_155307 ?auto_155312 ) ) ( not ( = ?auto_155308 ?auto_155305 ) ) ( CALIBRATION_TARGET ?auto_155311 ?auto_155312 ) ( not ( = ?auto_155312 ?auto_155306 ) ) ( not ( = ?auto_155304 ?auto_155306 ) ) ( not ( = ?auto_155307 ?auto_155306 ) ) ( ON_BOARD ?auto_155313 ?auto_155314 ) ( POWER_ON ?auto_155313 ) ( not ( = ?auto_155311 ?auto_155313 ) ) ( POINTING ?auto_155314 ?auto_155312 ) ( HAVE_IMAGE ?auto_155306 ?auto_155303 ) ( HAVE_IMAGE ?auto_155309 ?auto_155310 ) ( not ( = ?auto_155304 ?auto_155309 ) ) ( not ( = ?auto_155305 ?auto_155303 ) ) ( not ( = ?auto_155305 ?auto_155310 ) ) ( not ( = ?auto_155306 ?auto_155309 ) ) ( not ( = ?auto_155303 ?auto_155308 ) ) ( not ( = ?auto_155303 ?auto_155310 ) ) ( not ( = ?auto_155307 ?auto_155309 ) ) ( not ( = ?auto_155308 ?auto_155310 ) ) ( not ( = ?auto_155309 ?auto_155312 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_155307 ?auto_155308 ?auto_155304 ?auto_155305 )
      ( GET-4IMAGE-VERIFY ?auto_155304 ?auto_155305 ?auto_155306 ?auto_155303 ?auto_155307 ?auto_155308 ?auto_155309 ?auto_155310 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_155292 - DIRECTION
      ?auto_155293 - MODE
      ?auto_155294 - DIRECTION
      ?auto_155291 - MODE
      ?auto_155295 - DIRECTION
      ?auto_155296 - MODE
      ?auto_155297 - DIRECTION
      ?auto_155298 - MODE
    )
    :vars
    (
      ?auto_155299 - INSTRUMENT
      ?auto_155302 - SATELLITE
      ?auto_155300 - DIRECTION
      ?auto_155301 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_155299 ?auto_155302 ) ( SUPPORTS ?auto_155299 ?auto_155293 ) ( not ( = ?auto_155292 ?auto_155300 ) ) ( HAVE_IMAGE ?auto_155297 ?auto_155298 ) ( not ( = ?auto_155297 ?auto_155292 ) ) ( not ( = ?auto_155297 ?auto_155300 ) ) ( not ( = ?auto_155298 ?auto_155293 ) ) ( CALIBRATION_TARGET ?auto_155299 ?auto_155300 ) ( not ( = ?auto_155300 ?auto_155294 ) ) ( not ( = ?auto_155292 ?auto_155294 ) ) ( not ( = ?auto_155297 ?auto_155294 ) ) ( ON_BOARD ?auto_155301 ?auto_155302 ) ( POWER_ON ?auto_155301 ) ( not ( = ?auto_155299 ?auto_155301 ) ) ( POINTING ?auto_155302 ?auto_155300 ) ( HAVE_IMAGE ?auto_155294 ?auto_155291 ) ( HAVE_IMAGE ?auto_155295 ?auto_155296 ) ( not ( = ?auto_155292 ?auto_155295 ) ) ( not ( = ?auto_155293 ?auto_155291 ) ) ( not ( = ?auto_155293 ?auto_155296 ) ) ( not ( = ?auto_155294 ?auto_155295 ) ) ( not ( = ?auto_155291 ?auto_155296 ) ) ( not ( = ?auto_155291 ?auto_155298 ) ) ( not ( = ?auto_155295 ?auto_155297 ) ) ( not ( = ?auto_155295 ?auto_155300 ) ) ( not ( = ?auto_155296 ?auto_155298 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_155297 ?auto_155298 ?auto_155292 ?auto_155293 )
      ( GET-4IMAGE-VERIFY ?auto_155292 ?auto_155293 ?auto_155294 ?auto_155291 ?auto_155295 ?auto_155296 ?auto_155297 ?auto_155298 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_155352 - DIRECTION
      ?auto_155353 - MODE
      ?auto_155354 - DIRECTION
      ?auto_155351 - MODE
      ?auto_155355 - DIRECTION
      ?auto_155356 - MODE
      ?auto_155357 - DIRECTION
      ?auto_155358 - MODE
    )
    :vars
    (
      ?auto_155359 - INSTRUMENT
      ?auto_155364 - SATELLITE
      ?auto_155362 - DIRECTION
      ?auto_155361 - DIRECTION
      ?auto_155360 - MODE
      ?auto_155363 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_155359 ?auto_155364 ) ( SUPPORTS ?auto_155359 ?auto_155353 ) ( not ( = ?auto_155352 ?auto_155362 ) ) ( HAVE_IMAGE ?auto_155361 ?auto_155360 ) ( not ( = ?auto_155361 ?auto_155352 ) ) ( not ( = ?auto_155361 ?auto_155362 ) ) ( not ( = ?auto_155360 ?auto_155353 ) ) ( CALIBRATION_TARGET ?auto_155359 ?auto_155362 ) ( not ( = ?auto_155362 ?auto_155357 ) ) ( not ( = ?auto_155352 ?auto_155357 ) ) ( not ( = ?auto_155361 ?auto_155357 ) ) ( ON_BOARD ?auto_155363 ?auto_155364 ) ( POWER_ON ?auto_155363 ) ( not ( = ?auto_155359 ?auto_155363 ) ) ( POINTING ?auto_155364 ?auto_155362 ) ( HAVE_IMAGE ?auto_155354 ?auto_155351 ) ( HAVE_IMAGE ?auto_155355 ?auto_155356 ) ( HAVE_IMAGE ?auto_155357 ?auto_155358 ) ( not ( = ?auto_155352 ?auto_155354 ) ) ( not ( = ?auto_155352 ?auto_155355 ) ) ( not ( = ?auto_155353 ?auto_155351 ) ) ( not ( = ?auto_155353 ?auto_155356 ) ) ( not ( = ?auto_155353 ?auto_155358 ) ) ( not ( = ?auto_155354 ?auto_155355 ) ) ( not ( = ?auto_155354 ?auto_155357 ) ) ( not ( = ?auto_155354 ?auto_155362 ) ) ( not ( = ?auto_155354 ?auto_155361 ) ) ( not ( = ?auto_155351 ?auto_155356 ) ) ( not ( = ?auto_155351 ?auto_155358 ) ) ( not ( = ?auto_155351 ?auto_155360 ) ) ( not ( = ?auto_155355 ?auto_155357 ) ) ( not ( = ?auto_155355 ?auto_155362 ) ) ( not ( = ?auto_155355 ?auto_155361 ) ) ( not ( = ?auto_155356 ?auto_155358 ) ) ( not ( = ?auto_155356 ?auto_155360 ) ) ( not ( = ?auto_155358 ?auto_155360 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_155361 ?auto_155360 ?auto_155352 ?auto_155353 )
      ( GET-4IMAGE-VERIFY ?auto_155352 ?auto_155353 ?auto_155354 ?auto_155351 ?auto_155355 ?auto_155356 ?auto_155357 ?auto_155358 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153230 - DIRECTION
      ?auto_153231 - MODE
      ?auto_153232 - DIRECTION
      ?auto_153229 - MODE
      ?auto_153233 - DIRECTION
      ?auto_153234 - MODE
    )
    :vars
    (
      ?auto_153235 - INSTRUMENT
      ?auto_153239 - SATELLITE
      ?auto_153236 - DIRECTION
      ?auto_153238 - DIRECTION
      ?auto_153237 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153235 ?auto_153239 ) ( SUPPORTS ?auto_153235 ?auto_153234 ) ( not ( = ?auto_153233 ?auto_153236 ) ) ( HAVE_IMAGE ?auto_153230 ?auto_153229 ) ( not ( = ?auto_153230 ?auto_153233 ) ) ( not ( = ?auto_153230 ?auto_153236 ) ) ( not ( = ?auto_153229 ?auto_153234 ) ) ( CALIBRATION_TARGET ?auto_153235 ?auto_153236 ) ( not ( = ?auto_153236 ?auto_153238 ) ) ( not ( = ?auto_153233 ?auto_153238 ) ) ( not ( = ?auto_153230 ?auto_153238 ) ) ( ON_BOARD ?auto_153237 ?auto_153239 ) ( POWER_ON ?auto_153237 ) ( not ( = ?auto_153235 ?auto_153237 ) ) ( POINTING ?auto_153239 ?auto_153236 ) ( HAVE_IMAGE ?auto_153230 ?auto_153231 ) ( HAVE_IMAGE ?auto_153232 ?auto_153229 ) ( not ( = ?auto_153230 ?auto_153232 ) ) ( not ( = ?auto_153231 ?auto_153229 ) ) ( not ( = ?auto_153231 ?auto_153234 ) ) ( not ( = ?auto_153232 ?auto_153233 ) ) ( not ( = ?auto_153232 ?auto_153236 ) ) ( not ( = ?auto_153232 ?auto_153238 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153230 ?auto_153229 ?auto_153233 ?auto_153234 )
      ( GET-3IMAGE-VERIFY ?auto_153230 ?auto_153231 ?auto_153232 ?auto_153229 ?auto_153233 ?auto_153234 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_153262 - DIRECTION
      ?auto_153263 - MODE
      ?auto_153264 - DIRECTION
      ?auto_153261 - MODE
      ?auto_153265 - DIRECTION
      ?auto_153266 - MODE
    )
    :vars
    (
      ?auto_153267 - INSTRUMENT
      ?auto_153271 - SATELLITE
      ?auto_153268 - DIRECTION
      ?auto_153270 - DIRECTION
      ?auto_153269 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153267 ?auto_153271 ) ( SUPPORTS ?auto_153267 ?auto_153261 ) ( not ( = ?auto_153264 ?auto_153268 ) ) ( HAVE_IMAGE ?auto_153262 ?auto_153266 ) ( not ( = ?auto_153262 ?auto_153264 ) ) ( not ( = ?auto_153262 ?auto_153268 ) ) ( not ( = ?auto_153266 ?auto_153261 ) ) ( CALIBRATION_TARGET ?auto_153267 ?auto_153268 ) ( not ( = ?auto_153268 ?auto_153270 ) ) ( not ( = ?auto_153264 ?auto_153270 ) ) ( not ( = ?auto_153262 ?auto_153270 ) ) ( ON_BOARD ?auto_153269 ?auto_153271 ) ( POWER_ON ?auto_153269 ) ( not ( = ?auto_153267 ?auto_153269 ) ) ( POINTING ?auto_153271 ?auto_153268 ) ( HAVE_IMAGE ?auto_153262 ?auto_153263 ) ( HAVE_IMAGE ?auto_153265 ?auto_153266 ) ( not ( = ?auto_153262 ?auto_153265 ) ) ( not ( = ?auto_153263 ?auto_153261 ) ) ( not ( = ?auto_153263 ?auto_153266 ) ) ( not ( = ?auto_153264 ?auto_153265 ) ) ( not ( = ?auto_153265 ?auto_153268 ) ) ( not ( = ?auto_153265 ?auto_153270 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153262 ?auto_153266 ?auto_153264 ?auto_153261 )
      ( GET-3IMAGE-VERIFY ?auto_153262 ?auto_153263 ?auto_153264 ?auto_153261 ?auto_153265 ?auto_153266 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153645 - DIRECTION
      ?auto_153646 - MODE
      ?auto_153647 - DIRECTION
      ?auto_153644 - MODE
      ?auto_153648 - DIRECTION
      ?auto_153649 - MODE
      ?auto_153650 - DIRECTION
      ?auto_153651 - MODE
    )
    :vars
    (
      ?auto_153652 - INSTRUMENT
      ?auto_153656 - SATELLITE
      ?auto_153653 - DIRECTION
      ?auto_153655 - DIRECTION
      ?auto_153654 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153652 ?auto_153656 ) ( SUPPORTS ?auto_153652 ?auto_153651 ) ( not ( = ?auto_153650 ?auto_153653 ) ) ( HAVE_IMAGE ?auto_153645 ?auto_153644 ) ( not ( = ?auto_153645 ?auto_153650 ) ) ( not ( = ?auto_153645 ?auto_153653 ) ) ( not ( = ?auto_153644 ?auto_153651 ) ) ( CALIBRATION_TARGET ?auto_153652 ?auto_153653 ) ( not ( = ?auto_153653 ?auto_153655 ) ) ( not ( = ?auto_153650 ?auto_153655 ) ) ( not ( = ?auto_153645 ?auto_153655 ) ) ( ON_BOARD ?auto_153654 ?auto_153656 ) ( POWER_ON ?auto_153654 ) ( not ( = ?auto_153652 ?auto_153654 ) ) ( POINTING ?auto_153656 ?auto_153653 ) ( HAVE_IMAGE ?auto_153645 ?auto_153646 ) ( HAVE_IMAGE ?auto_153647 ?auto_153644 ) ( HAVE_IMAGE ?auto_153648 ?auto_153649 ) ( not ( = ?auto_153645 ?auto_153647 ) ) ( not ( = ?auto_153645 ?auto_153648 ) ) ( not ( = ?auto_153646 ?auto_153644 ) ) ( not ( = ?auto_153646 ?auto_153649 ) ) ( not ( = ?auto_153646 ?auto_153651 ) ) ( not ( = ?auto_153647 ?auto_153648 ) ) ( not ( = ?auto_153647 ?auto_153650 ) ) ( not ( = ?auto_153647 ?auto_153653 ) ) ( not ( = ?auto_153647 ?auto_153655 ) ) ( not ( = ?auto_153644 ?auto_153649 ) ) ( not ( = ?auto_153648 ?auto_153650 ) ) ( not ( = ?auto_153648 ?auto_153653 ) ) ( not ( = ?auto_153648 ?auto_153655 ) ) ( not ( = ?auto_153649 ?auto_153651 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153645 ?auto_153644 ?auto_153650 ?auto_153651 )
      ( GET-4IMAGE-VERIFY ?auto_153645 ?auto_153646 ?auto_153647 ?auto_153644 ?auto_153648 ?auto_153649 ?auto_153650 ?auto_153651 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_153907 - DIRECTION
      ?auto_153908 - MODE
      ?auto_153909 - DIRECTION
      ?auto_153906 - MODE
      ?auto_153910 - DIRECTION
      ?auto_153911 - MODE
      ?auto_153912 - DIRECTION
      ?auto_153913 - MODE
    )
    :vars
    (
      ?auto_153914 - INSTRUMENT
      ?auto_153918 - SATELLITE
      ?auto_153915 - DIRECTION
      ?auto_153917 - DIRECTION
      ?auto_153916 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_153914 ?auto_153918 ) ( SUPPORTS ?auto_153914 ?auto_153906 ) ( not ( = ?auto_153909 ?auto_153915 ) ) ( HAVE_IMAGE ?auto_153910 ?auto_153908 ) ( not ( = ?auto_153910 ?auto_153909 ) ) ( not ( = ?auto_153910 ?auto_153915 ) ) ( not ( = ?auto_153908 ?auto_153906 ) ) ( CALIBRATION_TARGET ?auto_153914 ?auto_153915 ) ( not ( = ?auto_153915 ?auto_153917 ) ) ( not ( = ?auto_153909 ?auto_153917 ) ) ( not ( = ?auto_153910 ?auto_153917 ) ) ( ON_BOARD ?auto_153916 ?auto_153918 ) ( POWER_ON ?auto_153916 ) ( not ( = ?auto_153914 ?auto_153916 ) ) ( POINTING ?auto_153918 ?auto_153915 ) ( HAVE_IMAGE ?auto_153907 ?auto_153908 ) ( HAVE_IMAGE ?auto_153910 ?auto_153911 ) ( HAVE_IMAGE ?auto_153912 ?auto_153913 ) ( not ( = ?auto_153907 ?auto_153909 ) ) ( not ( = ?auto_153907 ?auto_153910 ) ) ( not ( = ?auto_153907 ?auto_153912 ) ) ( not ( = ?auto_153907 ?auto_153915 ) ) ( not ( = ?auto_153907 ?auto_153917 ) ) ( not ( = ?auto_153908 ?auto_153911 ) ) ( not ( = ?auto_153908 ?auto_153913 ) ) ( not ( = ?auto_153909 ?auto_153912 ) ) ( not ( = ?auto_153906 ?auto_153911 ) ) ( not ( = ?auto_153906 ?auto_153913 ) ) ( not ( = ?auto_153910 ?auto_153912 ) ) ( not ( = ?auto_153911 ?auto_153913 ) ) ( not ( = ?auto_153912 ?auto_153915 ) ) ( not ( = ?auto_153912 ?auto_153917 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_153910 ?auto_153908 ?auto_153909 ?auto_153906 )
      ( GET-4IMAGE-VERIFY ?auto_153907 ?auto_153908 ?auto_153909 ?auto_153906 ?auto_153910 ?auto_153911 ?auto_153912 ?auto_153913 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_155104 - DIRECTION
      ?auto_155105 - MODE
      ?auto_155106 - DIRECTION
      ?auto_155103 - MODE
      ?auto_155107 - DIRECTION
      ?auto_155108 - MODE
      ?auto_155109 - DIRECTION
      ?auto_155110 - MODE
    )
    :vars
    (
      ?auto_155111 - INSTRUMENT
      ?auto_155114 - SATELLITE
      ?auto_155112 - DIRECTION
      ?auto_155113 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_155111 ?auto_155114 ) ( SUPPORTS ?auto_155111 ?auto_155105 ) ( not ( = ?auto_155104 ?auto_155112 ) ) ( HAVE_IMAGE ?auto_155107 ?auto_155103 ) ( not ( = ?auto_155107 ?auto_155104 ) ) ( not ( = ?auto_155107 ?auto_155112 ) ) ( not ( = ?auto_155103 ?auto_155105 ) ) ( CALIBRATION_TARGET ?auto_155111 ?auto_155112 ) ( not ( = ?auto_155112 ?auto_155109 ) ) ( not ( = ?auto_155104 ?auto_155109 ) ) ( not ( = ?auto_155107 ?auto_155109 ) ) ( ON_BOARD ?auto_155113 ?auto_155114 ) ( POWER_ON ?auto_155113 ) ( not ( = ?auto_155111 ?auto_155113 ) ) ( POINTING ?auto_155114 ?auto_155112 ) ( HAVE_IMAGE ?auto_155106 ?auto_155103 ) ( HAVE_IMAGE ?auto_155107 ?auto_155108 ) ( HAVE_IMAGE ?auto_155109 ?auto_155110 ) ( not ( = ?auto_155104 ?auto_155106 ) ) ( not ( = ?auto_155105 ?auto_155108 ) ) ( not ( = ?auto_155105 ?auto_155110 ) ) ( not ( = ?auto_155106 ?auto_155107 ) ) ( not ( = ?auto_155106 ?auto_155109 ) ) ( not ( = ?auto_155106 ?auto_155112 ) ) ( not ( = ?auto_155103 ?auto_155108 ) ) ( not ( = ?auto_155103 ?auto_155110 ) ) ( not ( = ?auto_155108 ?auto_155110 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_155107 ?auto_155103 ?auto_155104 ?auto_155105 )
      ( GET-4IMAGE-VERIFY ?auto_155104 ?auto_155105 ?auto_155106 ?auto_155103 ?auto_155107 ?auto_155108 ?auto_155109 ?auto_155110 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_158441 - DIRECTION
      ?auto_158442 - MODE
      ?auto_158443 - DIRECTION
      ?auto_158440 - MODE
      ?auto_158444 - DIRECTION
      ?auto_158445 - MODE
    )
    :vars
    (
      ?auto_158449 - INSTRUMENT
      ?auto_158446 - SATELLITE
      ?auto_158448 - DIRECTION
      ?auto_158447 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_158449 ?auto_158446 ) ( SUPPORTS ?auto_158449 ?auto_158445 ) ( not ( = ?auto_158444 ?auto_158448 ) ) ( HAVE_IMAGE ?auto_158441 ?auto_158440 ) ( not ( = ?auto_158441 ?auto_158444 ) ) ( not ( = ?auto_158441 ?auto_158448 ) ) ( not ( = ?auto_158440 ?auto_158445 ) ) ( CALIBRATION_TARGET ?auto_158449 ?auto_158448 ) ( POWER_AVAIL ?auto_158446 ) ( POINTING ?auto_158446 ?auto_158447 ) ( not ( = ?auto_158448 ?auto_158447 ) ) ( not ( = ?auto_158444 ?auto_158447 ) ) ( not ( = ?auto_158441 ?auto_158447 ) ) ( HAVE_IMAGE ?auto_158441 ?auto_158442 ) ( HAVE_IMAGE ?auto_158443 ?auto_158440 ) ( not ( = ?auto_158441 ?auto_158443 ) ) ( not ( = ?auto_158442 ?auto_158440 ) ) ( not ( = ?auto_158442 ?auto_158445 ) ) ( not ( = ?auto_158443 ?auto_158444 ) ) ( not ( = ?auto_158443 ?auto_158448 ) ) ( not ( = ?auto_158443 ?auto_158447 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_158441 ?auto_158440 ?auto_158444 ?auto_158445 )
      ( GET-3IMAGE-VERIFY ?auto_158441 ?auto_158442 ?auto_158443 ?auto_158440 ?auto_158444 ?auto_158445 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_159054 - DIRECTION
      ?auto_159055 - MODE
      ?auto_159056 - DIRECTION
      ?auto_159053 - MODE
      ?auto_159057 - DIRECTION
      ?auto_159058 - MODE
      ?auto_159059 - DIRECTION
      ?auto_159060 - MODE
    )
    :vars
    (
      ?auto_159064 - INSTRUMENT
      ?auto_159061 - SATELLITE
      ?auto_159063 - DIRECTION
      ?auto_159062 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_159064 ?auto_159061 ) ( SUPPORTS ?auto_159064 ?auto_159053 ) ( not ( = ?auto_159056 ?auto_159063 ) ) ( HAVE_IMAGE ?auto_159054 ?auto_159058 ) ( not ( = ?auto_159054 ?auto_159056 ) ) ( not ( = ?auto_159054 ?auto_159063 ) ) ( not ( = ?auto_159058 ?auto_159053 ) ) ( CALIBRATION_TARGET ?auto_159064 ?auto_159063 ) ( POWER_AVAIL ?auto_159061 ) ( POINTING ?auto_159061 ?auto_159062 ) ( not ( = ?auto_159063 ?auto_159062 ) ) ( not ( = ?auto_159056 ?auto_159062 ) ) ( not ( = ?auto_159054 ?auto_159062 ) ) ( HAVE_IMAGE ?auto_159054 ?auto_159055 ) ( HAVE_IMAGE ?auto_159057 ?auto_159058 ) ( HAVE_IMAGE ?auto_159059 ?auto_159060 ) ( not ( = ?auto_159054 ?auto_159057 ) ) ( not ( = ?auto_159054 ?auto_159059 ) ) ( not ( = ?auto_159055 ?auto_159053 ) ) ( not ( = ?auto_159055 ?auto_159058 ) ) ( not ( = ?auto_159055 ?auto_159060 ) ) ( not ( = ?auto_159056 ?auto_159057 ) ) ( not ( = ?auto_159056 ?auto_159059 ) ) ( not ( = ?auto_159053 ?auto_159060 ) ) ( not ( = ?auto_159057 ?auto_159059 ) ) ( not ( = ?auto_159057 ?auto_159063 ) ) ( not ( = ?auto_159057 ?auto_159062 ) ) ( not ( = ?auto_159058 ?auto_159060 ) ) ( not ( = ?auto_159059 ?auto_159063 ) ) ( not ( = ?auto_159059 ?auto_159062 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_159054 ?auto_159058 ?auto_159056 ?auto_159053 )
      ( GET-4IMAGE-VERIFY ?auto_159054 ?auto_159055 ?auto_159056 ?auto_159053 ?auto_159057 ?auto_159058 ?auto_159059 ?auto_159060 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_159353 - DIRECTION
      ?auto_159354 - MODE
      ?auto_159355 - DIRECTION
      ?auto_159352 - MODE
      ?auto_159356 - DIRECTION
      ?auto_159357 - MODE
      ?auto_159358 - DIRECTION
      ?auto_159359 - MODE
    )
    :vars
    (
      ?auto_159362 - INSTRUMENT
      ?auto_159360 - SATELLITE
      ?auto_159361 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_159362 ?auto_159360 ) ( SUPPORTS ?auto_159362 ?auto_159357 ) ( not ( = ?auto_159356 ?auto_159361 ) ) ( HAVE_IMAGE ?auto_159358 ?auto_159359 ) ( not ( = ?auto_159358 ?auto_159356 ) ) ( not ( = ?auto_159358 ?auto_159361 ) ) ( not ( = ?auto_159359 ?auto_159357 ) ) ( CALIBRATION_TARGET ?auto_159362 ?auto_159361 ) ( POWER_AVAIL ?auto_159360 ) ( POINTING ?auto_159360 ?auto_159355 ) ( not ( = ?auto_159361 ?auto_159355 ) ) ( not ( = ?auto_159356 ?auto_159355 ) ) ( not ( = ?auto_159358 ?auto_159355 ) ) ( HAVE_IMAGE ?auto_159353 ?auto_159354 ) ( HAVE_IMAGE ?auto_159355 ?auto_159352 ) ( not ( = ?auto_159353 ?auto_159355 ) ) ( not ( = ?auto_159353 ?auto_159356 ) ) ( not ( = ?auto_159353 ?auto_159358 ) ) ( not ( = ?auto_159353 ?auto_159361 ) ) ( not ( = ?auto_159354 ?auto_159352 ) ) ( not ( = ?auto_159354 ?auto_159357 ) ) ( not ( = ?auto_159354 ?auto_159359 ) ) ( not ( = ?auto_159352 ?auto_159357 ) ) ( not ( = ?auto_159352 ?auto_159359 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_159358 ?auto_159359 ?auto_159356 ?auto_159357 )
      ( GET-4IMAGE-VERIFY ?auto_159353 ?auto_159354 ?auto_159355 ?auto_159352 ?auto_159356 ?auto_159357 ?auto_159358 ?auto_159359 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_160195 - DIRECTION
      ?auto_160196 - MODE
      ?auto_160197 - DIRECTION
      ?auto_160194 - MODE
      ?auto_160198 - DIRECTION
      ?auto_160199 - MODE
      ?auto_160200 - DIRECTION
      ?auto_160201 - MODE
    )
    :vars
    (
      ?auto_160204 - INSTRUMENT
      ?auto_160202 - SATELLITE
      ?auto_160203 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_160204 ?auto_160202 ) ( SUPPORTS ?auto_160204 ?auto_160196 ) ( not ( = ?auto_160195 ?auto_160203 ) ) ( HAVE_IMAGE ?auto_160200 ?auto_160194 ) ( not ( = ?auto_160200 ?auto_160195 ) ) ( not ( = ?auto_160200 ?auto_160203 ) ) ( not ( = ?auto_160194 ?auto_160196 ) ) ( CALIBRATION_TARGET ?auto_160204 ?auto_160203 ) ( POWER_AVAIL ?auto_160202 ) ( POINTING ?auto_160202 ?auto_160198 ) ( not ( = ?auto_160203 ?auto_160198 ) ) ( not ( = ?auto_160195 ?auto_160198 ) ) ( not ( = ?auto_160200 ?auto_160198 ) ) ( HAVE_IMAGE ?auto_160197 ?auto_160194 ) ( HAVE_IMAGE ?auto_160198 ?auto_160199 ) ( HAVE_IMAGE ?auto_160200 ?auto_160201 ) ( not ( = ?auto_160195 ?auto_160197 ) ) ( not ( = ?auto_160196 ?auto_160199 ) ) ( not ( = ?auto_160196 ?auto_160201 ) ) ( not ( = ?auto_160197 ?auto_160198 ) ) ( not ( = ?auto_160197 ?auto_160200 ) ) ( not ( = ?auto_160197 ?auto_160203 ) ) ( not ( = ?auto_160194 ?auto_160199 ) ) ( not ( = ?auto_160194 ?auto_160201 ) ) ( not ( = ?auto_160199 ?auto_160201 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_160200 ?auto_160194 ?auto_160195 ?auto_160196 )
      ( GET-4IMAGE-VERIFY ?auto_160195 ?auto_160196 ?auto_160197 ?auto_160194 ?auto_160198 ?auto_160199 ?auto_160200 ?auto_160201 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_160333 - DIRECTION
      ?auto_160334 - MODE
      ?auto_160335 - DIRECTION
      ?auto_160332 - MODE
      ?auto_160336 - DIRECTION
      ?auto_160337 - MODE
      ?auto_160338 - DIRECTION
      ?auto_160339 - MODE
    )
    :vars
    (
      ?auto_160342 - INSTRUMENT
      ?auto_160340 - SATELLITE
      ?auto_160341 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_160342 ?auto_160340 ) ( SUPPORTS ?auto_160342 ?auto_160334 ) ( not ( = ?auto_160333 ?auto_160341 ) ) ( HAVE_IMAGE ?auto_160338 ?auto_160337 ) ( not ( = ?auto_160338 ?auto_160333 ) ) ( not ( = ?auto_160338 ?auto_160341 ) ) ( not ( = ?auto_160337 ?auto_160334 ) ) ( CALIBRATION_TARGET ?auto_160342 ?auto_160341 ) ( POWER_AVAIL ?auto_160340 ) ( POINTING ?auto_160340 ?auto_160335 ) ( not ( = ?auto_160341 ?auto_160335 ) ) ( not ( = ?auto_160333 ?auto_160335 ) ) ( not ( = ?auto_160338 ?auto_160335 ) ) ( HAVE_IMAGE ?auto_160335 ?auto_160332 ) ( HAVE_IMAGE ?auto_160336 ?auto_160337 ) ( HAVE_IMAGE ?auto_160338 ?auto_160339 ) ( not ( = ?auto_160333 ?auto_160336 ) ) ( not ( = ?auto_160334 ?auto_160332 ) ) ( not ( = ?auto_160334 ?auto_160339 ) ) ( not ( = ?auto_160335 ?auto_160336 ) ) ( not ( = ?auto_160332 ?auto_160337 ) ) ( not ( = ?auto_160332 ?auto_160339 ) ) ( not ( = ?auto_160336 ?auto_160338 ) ) ( not ( = ?auto_160336 ?auto_160341 ) ) ( not ( = ?auto_160337 ?auto_160339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_160338 ?auto_160337 ?auto_160333 ?auto_160334 )
      ( GET-4IMAGE-VERIFY ?auto_160333 ?auto_160334 ?auto_160335 ?auto_160332 ?auto_160336 ?auto_160337 ?auto_160338 ?auto_160339 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_161012 - DIRECTION
      ?auto_161013 - MODE
      ?auto_161014 - DIRECTION
      ?auto_161011 - MODE
      ?auto_161015 - DIRECTION
      ?auto_161016 - MODE
    )
    :vars
    (
      ?auto_161019 - INSTRUMENT
      ?auto_161020 - SATELLITE
      ?auto_161021 - DIRECTION
      ?auto_161017 - DIRECTION
      ?auto_161018 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_161019 ?auto_161020 ) ( SUPPORTS ?auto_161019 ?auto_161011 ) ( not ( = ?auto_161014 ?auto_161021 ) ) ( HAVE_IMAGE ?auto_161012 ?auto_161016 ) ( not ( = ?auto_161012 ?auto_161014 ) ) ( not ( = ?auto_161012 ?auto_161021 ) ) ( not ( = ?auto_161016 ?auto_161011 ) ) ( CALIBRATION_TARGET ?auto_161019 ?auto_161021 ) ( POINTING ?auto_161020 ?auto_161017 ) ( not ( = ?auto_161021 ?auto_161017 ) ) ( not ( = ?auto_161014 ?auto_161017 ) ) ( not ( = ?auto_161012 ?auto_161017 ) ) ( ON_BOARD ?auto_161018 ?auto_161020 ) ( POWER_ON ?auto_161018 ) ( not ( = ?auto_161019 ?auto_161018 ) ) ( HAVE_IMAGE ?auto_161012 ?auto_161013 ) ( HAVE_IMAGE ?auto_161015 ?auto_161016 ) ( not ( = ?auto_161012 ?auto_161015 ) ) ( not ( = ?auto_161013 ?auto_161011 ) ) ( not ( = ?auto_161013 ?auto_161016 ) ) ( not ( = ?auto_161014 ?auto_161015 ) ) ( not ( = ?auto_161015 ?auto_161021 ) ) ( not ( = ?auto_161015 ?auto_161017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_161012 ?auto_161016 ?auto_161014 ?auto_161011 )
      ( GET-3IMAGE-VERIFY ?auto_161012 ?auto_161013 ?auto_161014 ?auto_161011 ?auto_161015 ?auto_161016 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_161649 - DIRECTION
      ?auto_161650 - MODE
      ?auto_161651 - DIRECTION
      ?auto_161648 - MODE
      ?auto_161652 - DIRECTION
      ?auto_161653 - MODE
      ?auto_161654 - DIRECTION
      ?auto_161655 - MODE
    )
    :vars
    (
      ?auto_161658 - INSTRUMENT
      ?auto_161659 - SATELLITE
      ?auto_161660 - DIRECTION
      ?auto_161656 - DIRECTION
      ?auto_161657 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_161658 ?auto_161659 ) ( SUPPORTS ?auto_161658 ?auto_161648 ) ( not ( = ?auto_161651 ?auto_161660 ) ) ( HAVE_IMAGE ?auto_161654 ?auto_161650 ) ( not ( = ?auto_161654 ?auto_161651 ) ) ( not ( = ?auto_161654 ?auto_161660 ) ) ( not ( = ?auto_161650 ?auto_161648 ) ) ( CALIBRATION_TARGET ?auto_161658 ?auto_161660 ) ( POINTING ?auto_161659 ?auto_161656 ) ( not ( = ?auto_161660 ?auto_161656 ) ) ( not ( = ?auto_161651 ?auto_161656 ) ) ( not ( = ?auto_161654 ?auto_161656 ) ) ( ON_BOARD ?auto_161657 ?auto_161659 ) ( POWER_ON ?auto_161657 ) ( not ( = ?auto_161658 ?auto_161657 ) ) ( HAVE_IMAGE ?auto_161649 ?auto_161650 ) ( HAVE_IMAGE ?auto_161652 ?auto_161653 ) ( HAVE_IMAGE ?auto_161654 ?auto_161655 ) ( not ( = ?auto_161649 ?auto_161651 ) ) ( not ( = ?auto_161649 ?auto_161652 ) ) ( not ( = ?auto_161649 ?auto_161654 ) ) ( not ( = ?auto_161649 ?auto_161660 ) ) ( not ( = ?auto_161649 ?auto_161656 ) ) ( not ( = ?auto_161650 ?auto_161653 ) ) ( not ( = ?auto_161650 ?auto_161655 ) ) ( not ( = ?auto_161651 ?auto_161652 ) ) ( not ( = ?auto_161648 ?auto_161653 ) ) ( not ( = ?auto_161648 ?auto_161655 ) ) ( not ( = ?auto_161652 ?auto_161654 ) ) ( not ( = ?auto_161652 ?auto_161660 ) ) ( not ( = ?auto_161652 ?auto_161656 ) ) ( not ( = ?auto_161653 ?auto_161655 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_161654 ?auto_161650 ?auto_161651 ?auto_161648 )
      ( GET-4IMAGE-VERIFY ?auto_161649 ?auto_161650 ?auto_161651 ?auto_161648 ?auto_161652 ?auto_161653 ?auto_161654 ?auto_161655 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_166787 - DIRECTION
      ?auto_166788 - MODE
      ?auto_166789 - DIRECTION
      ?auto_166786 - MODE
      ?auto_166790 - DIRECTION
      ?auto_166791 - MODE
    )
    :vars
    (
      ?auto_166796 - INSTRUMENT
      ?auto_166793 - SATELLITE
      ?auto_166792 - DIRECTION
      ?auto_166794 - DIRECTION
      ?auto_166795 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_166796 ?auto_166793 ) ( SUPPORTS ?auto_166796 ?auto_166788 ) ( not ( = ?auto_166787 ?auto_166792 ) ) ( HAVE_IMAGE ?auto_166789 ?auto_166791 ) ( not ( = ?auto_166789 ?auto_166787 ) ) ( not ( = ?auto_166789 ?auto_166792 ) ) ( not ( = ?auto_166791 ?auto_166788 ) ) ( CALIBRATION_TARGET ?auto_166796 ?auto_166792 ) ( not ( = ?auto_166792 ?auto_166794 ) ) ( not ( = ?auto_166787 ?auto_166794 ) ) ( not ( = ?auto_166789 ?auto_166794 ) ) ( ON_BOARD ?auto_166795 ?auto_166793 ) ( POWER_ON ?auto_166795 ) ( not ( = ?auto_166796 ?auto_166795 ) ) ( POINTING ?auto_166793 ?auto_166792 ) ( HAVE_IMAGE ?auto_166789 ?auto_166786 ) ( HAVE_IMAGE ?auto_166790 ?auto_166791 ) ( not ( = ?auto_166787 ?auto_166790 ) ) ( not ( = ?auto_166788 ?auto_166786 ) ) ( not ( = ?auto_166789 ?auto_166790 ) ) ( not ( = ?auto_166786 ?auto_166791 ) ) ( not ( = ?auto_166790 ?auto_166792 ) ) ( not ( = ?auto_166790 ?auto_166794 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_166789 ?auto_166791 ?auto_166787 ?auto_166788 )
      ( GET-3IMAGE-VERIFY ?auto_166787 ?auto_166788 ?auto_166789 ?auto_166786 ?auto_166790 ?auto_166791 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_172728 - DIRECTION
      ?auto_172729 - MODE
      ?auto_172730 - DIRECTION
      ?auto_172727 - MODE
      ?auto_172731 - DIRECTION
      ?auto_172732 - MODE
      ?auto_172733 - DIRECTION
      ?auto_172734 - MODE
    )
    :vars
    (
      ?auto_172735 - INSTRUMENT
      ?auto_172736 - SATELLITE
      ?auto_172737 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_172735 ?auto_172736 ) ( SUPPORTS ?auto_172735 ?auto_172727 ) ( POINTING ?auto_172736 ?auto_172737 ) ( not ( = ?auto_172730 ?auto_172737 ) ) ( HAVE_IMAGE ?auto_172728 ?auto_172732 ) ( not ( = ?auto_172728 ?auto_172730 ) ) ( not ( = ?auto_172728 ?auto_172737 ) ) ( not ( = ?auto_172732 ?auto_172727 ) ) ( CALIBRATION_TARGET ?auto_172735 ?auto_172737 ) ( POWER_AVAIL ?auto_172736 ) ( HAVE_IMAGE ?auto_172728 ?auto_172729 ) ( HAVE_IMAGE ?auto_172731 ?auto_172732 ) ( HAVE_IMAGE ?auto_172733 ?auto_172734 ) ( not ( = ?auto_172728 ?auto_172731 ) ) ( not ( = ?auto_172728 ?auto_172733 ) ) ( not ( = ?auto_172729 ?auto_172727 ) ) ( not ( = ?auto_172729 ?auto_172732 ) ) ( not ( = ?auto_172729 ?auto_172734 ) ) ( not ( = ?auto_172730 ?auto_172731 ) ) ( not ( = ?auto_172730 ?auto_172733 ) ) ( not ( = ?auto_172727 ?auto_172734 ) ) ( not ( = ?auto_172731 ?auto_172733 ) ) ( not ( = ?auto_172731 ?auto_172737 ) ) ( not ( = ?auto_172732 ?auto_172734 ) ) ( not ( = ?auto_172733 ?auto_172737 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_172728 ?auto_172732 ?auto_172730 ?auto_172727 )
      ( GET-4IMAGE-VERIFY ?auto_172728 ?auto_172729 ?auto_172730 ?auto_172727 ?auto_172731 ?auto_172732 ?auto_172733 ?auto_172734 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_174816 - DIRECTION
      ?auto_174817 - MODE
      ?auto_174818 - DIRECTION
      ?auto_174815 - MODE
      ?auto_174819 - DIRECTION
      ?auto_174820 - MODE
    )
    :vars
    (
      ?auto_174823 - INSTRUMENT
      ?auto_174821 - SATELLITE
      ?auto_174822 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_174823 ?auto_174821 ) ( SUPPORTS ?auto_174823 ?auto_174817 ) ( not ( = ?auto_174816 ?auto_174822 ) ) ( HAVE_IMAGE ?auto_174818 ?auto_174815 ) ( not ( = ?auto_174818 ?auto_174816 ) ) ( not ( = ?auto_174818 ?auto_174822 ) ) ( not ( = ?auto_174815 ?auto_174817 ) ) ( CALIBRATION_TARGET ?auto_174823 ?auto_174822 ) ( POWER_AVAIL ?auto_174821 ) ( POINTING ?auto_174821 ?auto_174818 ) ( HAVE_IMAGE ?auto_174819 ?auto_174820 ) ( not ( = ?auto_174816 ?auto_174819 ) ) ( not ( = ?auto_174817 ?auto_174820 ) ) ( not ( = ?auto_174818 ?auto_174819 ) ) ( not ( = ?auto_174815 ?auto_174820 ) ) ( not ( = ?auto_174819 ?auto_174822 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_174818 ?auto_174815 ?auto_174816 ?auto_174817 )
      ( GET-3IMAGE-VERIFY ?auto_174816 ?auto_174817 ?auto_174818 ?auto_174815 ?auto_174819 ?auto_174820 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_175011 - DIRECTION
      ?auto_175012 - MODE
      ?auto_175013 - DIRECTION
      ?auto_175010 - MODE
      ?auto_175014 - DIRECTION
      ?auto_175015 - MODE
      ?auto_175016 - DIRECTION
      ?auto_175017 - MODE
    )
    :vars
    (
      ?auto_175020 - INSTRUMENT
      ?auto_175018 - SATELLITE
      ?auto_175019 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_175020 ?auto_175018 ) ( SUPPORTS ?auto_175020 ?auto_175015 ) ( not ( = ?auto_175014 ?auto_175019 ) ) ( HAVE_IMAGE ?auto_175013 ?auto_175010 ) ( not ( = ?auto_175013 ?auto_175014 ) ) ( not ( = ?auto_175013 ?auto_175019 ) ) ( not ( = ?auto_175010 ?auto_175015 ) ) ( CALIBRATION_TARGET ?auto_175020 ?auto_175019 ) ( POWER_AVAIL ?auto_175018 ) ( POINTING ?auto_175018 ?auto_175013 ) ( HAVE_IMAGE ?auto_175011 ?auto_175012 ) ( HAVE_IMAGE ?auto_175016 ?auto_175017 ) ( not ( = ?auto_175011 ?auto_175013 ) ) ( not ( = ?auto_175011 ?auto_175014 ) ) ( not ( = ?auto_175011 ?auto_175016 ) ) ( not ( = ?auto_175011 ?auto_175019 ) ) ( not ( = ?auto_175012 ?auto_175010 ) ) ( not ( = ?auto_175012 ?auto_175015 ) ) ( not ( = ?auto_175012 ?auto_175017 ) ) ( not ( = ?auto_175013 ?auto_175016 ) ) ( not ( = ?auto_175010 ?auto_175017 ) ) ( not ( = ?auto_175014 ?auto_175016 ) ) ( not ( = ?auto_175015 ?auto_175017 ) ) ( not ( = ?auto_175016 ?auto_175019 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_175013 ?auto_175010 ?auto_175014 ?auto_175015 )
      ( GET-4IMAGE-VERIFY ?auto_175011 ?auto_175012 ?auto_175013 ?auto_175010 ?auto_175014 ?auto_175015 ?auto_175016 ?auto_175017 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_175209 - DIRECTION
      ?auto_175210 - MODE
      ?auto_175211 - DIRECTION
      ?auto_175208 - MODE
      ?auto_175212 - DIRECTION
      ?auto_175213 - MODE
      ?auto_175214 - DIRECTION
      ?auto_175215 - MODE
    )
    :vars
    (
      ?auto_175218 - INSTRUMENT
      ?auto_175216 - SATELLITE
      ?auto_175217 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_175218 ?auto_175216 ) ( SUPPORTS ?auto_175218 ?auto_175208 ) ( not ( = ?auto_175211 ?auto_175217 ) ) ( HAVE_IMAGE ?auto_175212 ?auto_175215 ) ( not ( = ?auto_175212 ?auto_175211 ) ) ( not ( = ?auto_175212 ?auto_175217 ) ) ( not ( = ?auto_175215 ?auto_175208 ) ) ( CALIBRATION_TARGET ?auto_175218 ?auto_175217 ) ( POWER_AVAIL ?auto_175216 ) ( POINTING ?auto_175216 ?auto_175212 ) ( HAVE_IMAGE ?auto_175209 ?auto_175210 ) ( HAVE_IMAGE ?auto_175212 ?auto_175213 ) ( HAVE_IMAGE ?auto_175214 ?auto_175215 ) ( not ( = ?auto_175209 ?auto_175211 ) ) ( not ( = ?auto_175209 ?auto_175212 ) ) ( not ( = ?auto_175209 ?auto_175214 ) ) ( not ( = ?auto_175209 ?auto_175217 ) ) ( not ( = ?auto_175210 ?auto_175208 ) ) ( not ( = ?auto_175210 ?auto_175213 ) ) ( not ( = ?auto_175210 ?auto_175215 ) ) ( not ( = ?auto_175211 ?auto_175214 ) ) ( not ( = ?auto_175208 ?auto_175213 ) ) ( not ( = ?auto_175212 ?auto_175214 ) ) ( not ( = ?auto_175213 ?auto_175215 ) ) ( not ( = ?auto_175214 ?auto_175217 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_175212 ?auto_175215 ?auto_175211 ?auto_175208 )
      ( GET-4IMAGE-VERIFY ?auto_175209 ?auto_175210 ?auto_175211 ?auto_175208 ?auto_175212 ?auto_175213 ?auto_175214 ?auto_175215 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_177123 - DIRECTION
      ?auto_177124 - MODE
      ?auto_177125 - DIRECTION
      ?auto_177122 - MODE
      ?auto_177126 - DIRECTION
      ?auto_177127 - MODE
    )
    :vars
    (
      ?auto_177128 - INSTRUMENT
      ?auto_177129 - SATELLITE
      ?auto_177131 - DIRECTION
      ?auto_177130 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_177128 ?auto_177129 ) ( SUPPORTS ?auto_177128 ?auto_177122 ) ( not ( = ?auto_177125 ?auto_177131 ) ) ( HAVE_IMAGE ?auto_177123 ?auto_177124 ) ( not ( = ?auto_177123 ?auto_177125 ) ) ( not ( = ?auto_177123 ?auto_177131 ) ) ( not ( = ?auto_177124 ?auto_177122 ) ) ( CALIBRATION_TARGET ?auto_177128 ?auto_177131 ) ( POINTING ?auto_177129 ?auto_177123 ) ( ON_BOARD ?auto_177130 ?auto_177129 ) ( POWER_ON ?auto_177130 ) ( not ( = ?auto_177128 ?auto_177130 ) ) ( HAVE_IMAGE ?auto_177126 ?auto_177127 ) ( not ( = ?auto_177123 ?auto_177126 ) ) ( not ( = ?auto_177124 ?auto_177127 ) ) ( not ( = ?auto_177125 ?auto_177126 ) ) ( not ( = ?auto_177122 ?auto_177127 ) ) ( not ( = ?auto_177126 ?auto_177131 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_177123 ?auto_177124 ?auto_177125 ?auto_177122 )
      ( GET-3IMAGE-VERIFY ?auto_177123 ?auto_177124 ?auto_177125 ?auto_177122 ?auto_177126 ?auto_177127 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_177501 - DIRECTION
      ?auto_177502 - MODE
      ?auto_177503 - DIRECTION
      ?auto_177500 - MODE
      ?auto_177504 - DIRECTION
      ?auto_177505 - MODE
      ?auto_177506 - DIRECTION
      ?auto_177507 - MODE
    )
    :vars
    (
      ?auto_177508 - INSTRUMENT
      ?auto_177509 - SATELLITE
      ?auto_177511 - DIRECTION
      ?auto_177510 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_177508 ?auto_177509 ) ( SUPPORTS ?auto_177508 ?auto_177507 ) ( not ( = ?auto_177506 ?auto_177511 ) ) ( HAVE_IMAGE ?auto_177504 ?auto_177500 ) ( not ( = ?auto_177504 ?auto_177506 ) ) ( not ( = ?auto_177504 ?auto_177511 ) ) ( not ( = ?auto_177500 ?auto_177507 ) ) ( CALIBRATION_TARGET ?auto_177508 ?auto_177511 ) ( POINTING ?auto_177509 ?auto_177504 ) ( ON_BOARD ?auto_177510 ?auto_177509 ) ( POWER_ON ?auto_177510 ) ( not ( = ?auto_177508 ?auto_177510 ) ) ( HAVE_IMAGE ?auto_177501 ?auto_177502 ) ( HAVE_IMAGE ?auto_177503 ?auto_177500 ) ( HAVE_IMAGE ?auto_177504 ?auto_177505 ) ( not ( = ?auto_177501 ?auto_177503 ) ) ( not ( = ?auto_177501 ?auto_177504 ) ) ( not ( = ?auto_177501 ?auto_177506 ) ) ( not ( = ?auto_177501 ?auto_177511 ) ) ( not ( = ?auto_177502 ?auto_177500 ) ) ( not ( = ?auto_177502 ?auto_177505 ) ) ( not ( = ?auto_177502 ?auto_177507 ) ) ( not ( = ?auto_177503 ?auto_177504 ) ) ( not ( = ?auto_177503 ?auto_177506 ) ) ( not ( = ?auto_177503 ?auto_177511 ) ) ( not ( = ?auto_177500 ?auto_177505 ) ) ( not ( = ?auto_177505 ?auto_177507 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_177504 ?auto_177500 ?auto_177506 ?auto_177507 )
      ( GET-4IMAGE-VERIFY ?auto_177501 ?auto_177502 ?auto_177503 ?auto_177500 ?auto_177504 ?auto_177505 ?auto_177506 ?auto_177507 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_177537 - DIRECTION
      ?auto_177538 - MODE
      ?auto_177539 - DIRECTION
      ?auto_177536 - MODE
      ?auto_177540 - DIRECTION
      ?auto_177541 - MODE
      ?auto_177542 - DIRECTION
      ?auto_177543 - MODE
    )
    :vars
    (
      ?auto_177544 - INSTRUMENT
      ?auto_177545 - SATELLITE
      ?auto_177547 - DIRECTION
      ?auto_177546 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_177544 ?auto_177545 ) ( SUPPORTS ?auto_177544 ?auto_177541 ) ( not ( = ?auto_177540 ?auto_177547 ) ) ( HAVE_IMAGE ?auto_177537 ?auto_177538 ) ( not ( = ?auto_177537 ?auto_177540 ) ) ( not ( = ?auto_177537 ?auto_177547 ) ) ( not ( = ?auto_177538 ?auto_177541 ) ) ( CALIBRATION_TARGET ?auto_177544 ?auto_177547 ) ( POINTING ?auto_177545 ?auto_177537 ) ( ON_BOARD ?auto_177546 ?auto_177545 ) ( POWER_ON ?auto_177546 ) ( not ( = ?auto_177544 ?auto_177546 ) ) ( HAVE_IMAGE ?auto_177539 ?auto_177536 ) ( HAVE_IMAGE ?auto_177542 ?auto_177543 ) ( not ( = ?auto_177537 ?auto_177539 ) ) ( not ( = ?auto_177537 ?auto_177542 ) ) ( not ( = ?auto_177538 ?auto_177536 ) ) ( not ( = ?auto_177538 ?auto_177543 ) ) ( not ( = ?auto_177539 ?auto_177540 ) ) ( not ( = ?auto_177539 ?auto_177542 ) ) ( not ( = ?auto_177539 ?auto_177547 ) ) ( not ( = ?auto_177536 ?auto_177541 ) ) ( not ( = ?auto_177536 ?auto_177543 ) ) ( not ( = ?auto_177540 ?auto_177542 ) ) ( not ( = ?auto_177541 ?auto_177543 ) ) ( not ( = ?auto_177542 ?auto_177547 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_177537 ?auto_177538 ?auto_177540 ?auto_177541 )
      ( GET-4IMAGE-VERIFY ?auto_177537 ?auto_177538 ?auto_177539 ?auto_177536 ?auto_177540 ?auto_177541 ?auto_177542 ?auto_177543 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_177753 - DIRECTION
      ?auto_177754 - MODE
      ?auto_177755 - DIRECTION
      ?auto_177752 - MODE
      ?auto_177756 - DIRECTION
      ?auto_177757 - MODE
      ?auto_177758 - DIRECTION
      ?auto_177759 - MODE
    )
    :vars
    (
      ?auto_177760 - INSTRUMENT
      ?auto_177761 - SATELLITE
      ?auto_177763 - DIRECTION
      ?auto_177762 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_177760 ?auto_177761 ) ( SUPPORTS ?auto_177760 ?auto_177752 ) ( not ( = ?auto_177755 ?auto_177763 ) ) ( HAVE_IMAGE ?auto_177753 ?auto_177754 ) ( not ( = ?auto_177753 ?auto_177755 ) ) ( not ( = ?auto_177753 ?auto_177763 ) ) ( not ( = ?auto_177754 ?auto_177752 ) ) ( CALIBRATION_TARGET ?auto_177760 ?auto_177763 ) ( POINTING ?auto_177761 ?auto_177753 ) ( ON_BOARD ?auto_177762 ?auto_177761 ) ( POWER_ON ?auto_177762 ) ( not ( = ?auto_177760 ?auto_177762 ) ) ( HAVE_IMAGE ?auto_177756 ?auto_177757 ) ( HAVE_IMAGE ?auto_177758 ?auto_177759 ) ( not ( = ?auto_177753 ?auto_177756 ) ) ( not ( = ?auto_177753 ?auto_177758 ) ) ( not ( = ?auto_177754 ?auto_177757 ) ) ( not ( = ?auto_177754 ?auto_177759 ) ) ( not ( = ?auto_177755 ?auto_177756 ) ) ( not ( = ?auto_177755 ?auto_177758 ) ) ( not ( = ?auto_177752 ?auto_177757 ) ) ( not ( = ?auto_177752 ?auto_177759 ) ) ( not ( = ?auto_177756 ?auto_177758 ) ) ( not ( = ?auto_177756 ?auto_177763 ) ) ( not ( = ?auto_177757 ?auto_177759 ) ) ( not ( = ?auto_177758 ?auto_177763 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_177753 ?auto_177754 ?auto_177755 ?auto_177752 )
      ( GET-4IMAGE-VERIFY ?auto_177753 ?auto_177754 ?auto_177755 ?auto_177752 ?auto_177756 ?auto_177757 ?auto_177758 ?auto_177759 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_178909 - DIRECTION
      ?auto_178910 - MODE
      ?auto_178911 - DIRECTION
      ?auto_178908 - MODE
      ?auto_178912 - DIRECTION
      ?auto_178913 - MODE
      ?auto_178914 - DIRECTION
      ?auto_178915 - MODE
    )
    :vars
    (
      ?auto_178916 - INSTRUMENT
      ?auto_178917 - SATELLITE
      ?auto_178919 - DIRECTION
      ?auto_178918 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_178916 ?auto_178917 ) ( SUPPORTS ?auto_178916 ?auto_178910 ) ( not ( = ?auto_178909 ?auto_178919 ) ) ( HAVE_IMAGE ?auto_178914 ?auto_178915 ) ( not ( = ?auto_178914 ?auto_178909 ) ) ( not ( = ?auto_178914 ?auto_178919 ) ) ( not ( = ?auto_178915 ?auto_178910 ) ) ( CALIBRATION_TARGET ?auto_178916 ?auto_178919 ) ( POINTING ?auto_178917 ?auto_178914 ) ( ON_BOARD ?auto_178918 ?auto_178917 ) ( POWER_ON ?auto_178918 ) ( not ( = ?auto_178916 ?auto_178918 ) ) ( HAVE_IMAGE ?auto_178911 ?auto_178908 ) ( HAVE_IMAGE ?auto_178912 ?auto_178913 ) ( not ( = ?auto_178909 ?auto_178911 ) ) ( not ( = ?auto_178909 ?auto_178912 ) ) ( not ( = ?auto_178910 ?auto_178908 ) ) ( not ( = ?auto_178910 ?auto_178913 ) ) ( not ( = ?auto_178911 ?auto_178912 ) ) ( not ( = ?auto_178911 ?auto_178914 ) ) ( not ( = ?auto_178911 ?auto_178919 ) ) ( not ( = ?auto_178908 ?auto_178913 ) ) ( not ( = ?auto_178908 ?auto_178915 ) ) ( not ( = ?auto_178912 ?auto_178914 ) ) ( not ( = ?auto_178912 ?auto_178919 ) ) ( not ( = ?auto_178913 ?auto_178915 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_178914 ?auto_178915 ?auto_178909 ?auto_178910 )
      ( GET-4IMAGE-VERIFY ?auto_178909 ?auto_178910 ?auto_178911 ?auto_178908 ?auto_178912 ?auto_178913 ?auto_178914 ?auto_178915 ) )
  )

)

