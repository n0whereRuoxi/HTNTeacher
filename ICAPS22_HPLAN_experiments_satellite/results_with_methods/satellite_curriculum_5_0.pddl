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

  ( :method GET-5IMAGE-VERIFY
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
      ?goal_dir5 - DIRECTION
      ?goal_mode5 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) ( HAVE_IMAGE ?goal_dir5 ?goal_mode5 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26822 - DIRECTION
      ?auto_26823 - MODE
    )
    :vars
    (
      ?auto_26824 - INSTRUMENT
      ?auto_26825 - SATELLITE
      ?auto_26826 - DIRECTION
      ?auto_26827 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26824 ?auto_26825 ) ( SUPPORTS ?auto_26824 ?auto_26823 ) ( not ( = ?auto_26822 ?auto_26826 ) ) ( CALIBRATION_TARGET ?auto_26824 ?auto_26826 ) ( POWER_AVAIL ?auto_26825 ) ( POINTING ?auto_26825 ?auto_26827 ) ( not ( = ?auto_26826 ?auto_26827 ) ) ( not ( = ?auto_26822 ?auto_26827 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_26825 ?auto_26826 ?auto_26827 )
      ( !SWITCH_ON ?auto_26824 ?auto_26825 )
      ( !CALIBRATE ?auto_26825 ?auto_26824 ?auto_26826 )
      ( !TURN_TO ?auto_26825 ?auto_26822 ?auto_26826 )
      ( !TAKE_IMAGE ?auto_26825 ?auto_26822 ?auto_26824 ?auto_26823 )
      ( GET-1IMAGE-VERIFY ?auto_26822 ?auto_26823 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26830 - DIRECTION
      ?auto_26831 - MODE
    )
    :vars
    (
      ?auto_26832 - INSTRUMENT
      ?auto_26833 - SATELLITE
      ?auto_26834 - DIRECTION
      ?auto_26835 - DIRECTION
      ?auto_26836 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26832 ?auto_26833 ) ( SUPPORTS ?auto_26832 ?auto_26831 ) ( not ( = ?auto_26830 ?auto_26834 ) ) ( CALIBRATION_TARGET ?auto_26832 ?auto_26834 ) ( POINTING ?auto_26833 ?auto_26835 ) ( not ( = ?auto_26834 ?auto_26835 ) ) ( ON_BOARD ?auto_26836 ?auto_26833 ) ( POWER_ON ?auto_26836 ) ( not ( = ?auto_26830 ?auto_26835 ) ) ( not ( = ?auto_26832 ?auto_26836 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_26836 ?auto_26833 )
      ( !TURN_TO ?auto_26833 ?auto_26834 ?auto_26835 )
      ( !SWITCH_ON ?auto_26832 ?auto_26833 )
      ( !CALIBRATE ?auto_26833 ?auto_26832 ?auto_26834 )
      ( !TURN_TO ?auto_26833 ?auto_26830 ?auto_26834 )
      ( !TAKE_IMAGE ?auto_26833 ?auto_26830 ?auto_26832 ?auto_26831 )
      ( GET-1IMAGE-VERIFY ?auto_26830 ?auto_26831 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26849 - DIRECTION
      ?auto_26850 - MODE
      ?auto_26852 - DIRECTION
      ?auto_26851 - MODE
    )
    :vars
    (
      ?auto_26853 - INSTRUMENT
      ?auto_26854 - SATELLITE
      ?auto_26856 - DIRECTION
      ?auto_26855 - INSTRUMENT
      ?auto_26857 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26852 ?auto_26849 ) ) ( ON_BOARD ?auto_26853 ?auto_26854 ) ( SUPPORTS ?auto_26853 ?auto_26851 ) ( not ( = ?auto_26852 ?auto_26856 ) ) ( CALIBRATION_TARGET ?auto_26853 ?auto_26856 ) ( not ( = ?auto_26856 ?auto_26849 ) ) ( ON_BOARD ?auto_26855 ?auto_26854 ) ( not ( = ?auto_26853 ?auto_26855 ) ) ( SUPPORTS ?auto_26855 ?auto_26850 ) ( CALIBRATION_TARGET ?auto_26855 ?auto_26856 ) ( POWER_AVAIL ?auto_26854 ) ( POINTING ?auto_26854 ?auto_26857 ) ( not ( = ?auto_26856 ?auto_26857 ) ) ( not ( = ?auto_26849 ?auto_26857 ) ) ( not ( = ?auto_26850 ?auto_26851 ) ) ( not ( = ?auto_26852 ?auto_26857 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26849 ?auto_26850 )
      ( GET-1IMAGE ?auto_26852 ?auto_26851 )
      ( GET-2IMAGE-VERIFY ?auto_26849 ?auto_26850 ?auto_26852 ?auto_26851 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26858 - DIRECTION
      ?auto_26859 - MODE
      ?auto_26861 - DIRECTION
      ?auto_26860 - MODE
    )
    :vars
    (
      ?auto_26864 - INSTRUMENT
      ?auto_26863 - SATELLITE
      ?auto_26866 - DIRECTION
      ?auto_26865 - INSTRUMENT
      ?auto_26862 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26861 ?auto_26858 ) ) ( ON_BOARD ?auto_26864 ?auto_26863 ) ( SUPPORTS ?auto_26864 ?auto_26859 ) ( not ( = ?auto_26858 ?auto_26866 ) ) ( CALIBRATION_TARGET ?auto_26864 ?auto_26866 ) ( not ( = ?auto_26866 ?auto_26861 ) ) ( ON_BOARD ?auto_26865 ?auto_26863 ) ( not ( = ?auto_26864 ?auto_26865 ) ) ( SUPPORTS ?auto_26865 ?auto_26860 ) ( CALIBRATION_TARGET ?auto_26865 ?auto_26866 ) ( POWER_AVAIL ?auto_26863 ) ( POINTING ?auto_26863 ?auto_26862 ) ( not ( = ?auto_26866 ?auto_26862 ) ) ( not ( = ?auto_26861 ?auto_26862 ) ) ( not ( = ?auto_26860 ?auto_26859 ) ) ( not ( = ?auto_26858 ?auto_26862 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26861 ?auto_26860 ?auto_26858 ?auto_26859 )
      ( GET-2IMAGE-VERIFY ?auto_26858 ?auto_26859 ?auto_26861 ?auto_26860 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26880 - DIRECTION
      ?auto_26881 - MODE
    )
    :vars
    (
      ?auto_26882 - INSTRUMENT
      ?auto_26883 - SATELLITE
      ?auto_26884 - DIRECTION
      ?auto_26885 - DIRECTION
      ?auto_26886 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26882 ?auto_26883 ) ( SUPPORTS ?auto_26882 ?auto_26881 ) ( not ( = ?auto_26880 ?auto_26884 ) ) ( CALIBRATION_TARGET ?auto_26882 ?auto_26884 ) ( POINTING ?auto_26883 ?auto_26885 ) ( not ( = ?auto_26884 ?auto_26885 ) ) ( ON_BOARD ?auto_26886 ?auto_26883 ) ( POWER_ON ?auto_26886 ) ( not ( = ?auto_26880 ?auto_26885 ) ) ( not ( = ?auto_26882 ?auto_26886 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_26886 ?auto_26883 )
      ( !TURN_TO ?auto_26883 ?auto_26884 ?auto_26885 )
      ( !SWITCH_ON ?auto_26882 ?auto_26883 )
      ( !CALIBRATE ?auto_26883 ?auto_26882 ?auto_26884 )
      ( !TURN_TO ?auto_26883 ?auto_26880 ?auto_26884 )
      ( !TAKE_IMAGE ?auto_26883 ?auto_26880 ?auto_26882 ?auto_26881 )
      ( GET-1IMAGE-VERIFY ?auto_26880 ?auto_26881 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27015 - DIRECTION
      ?auto_27016 - MODE
      ?auto_27018 - DIRECTION
      ?auto_27017 - MODE
      ?auto_27019 - DIRECTION
      ?auto_27020 - MODE
    )
    :vars
    (
      ?auto_27022 - INSTRUMENT
      ?auto_27024 - SATELLITE
      ?auto_27021 - DIRECTION
      ?auto_27023 - INSTRUMENT
      ?auto_27025 - INSTRUMENT
      ?auto_27026 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27018 ?auto_27015 ) ) ( not ( = ?auto_27019 ?auto_27015 ) ) ( not ( = ?auto_27019 ?auto_27018 ) ) ( ON_BOARD ?auto_27022 ?auto_27024 ) ( SUPPORTS ?auto_27022 ?auto_27020 ) ( not ( = ?auto_27019 ?auto_27021 ) ) ( CALIBRATION_TARGET ?auto_27022 ?auto_27021 ) ( not ( = ?auto_27021 ?auto_27018 ) ) ( ON_BOARD ?auto_27023 ?auto_27024 ) ( not ( = ?auto_27022 ?auto_27023 ) ) ( SUPPORTS ?auto_27023 ?auto_27017 ) ( CALIBRATION_TARGET ?auto_27023 ?auto_27021 ) ( not ( = ?auto_27021 ?auto_27015 ) ) ( ON_BOARD ?auto_27025 ?auto_27024 ) ( not ( = ?auto_27023 ?auto_27025 ) ) ( SUPPORTS ?auto_27025 ?auto_27016 ) ( CALIBRATION_TARGET ?auto_27025 ?auto_27021 ) ( POWER_AVAIL ?auto_27024 ) ( POINTING ?auto_27024 ?auto_27026 ) ( not ( = ?auto_27021 ?auto_27026 ) ) ( not ( = ?auto_27015 ?auto_27026 ) ) ( not ( = ?auto_27016 ?auto_27017 ) ) ( not ( = ?auto_27018 ?auto_27026 ) ) ( not ( = ?auto_27016 ?auto_27020 ) ) ( not ( = ?auto_27017 ?auto_27020 ) ) ( not ( = ?auto_27019 ?auto_27026 ) ) ( not ( = ?auto_27022 ?auto_27025 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27018 ?auto_27017 ?auto_27015 ?auto_27016 )
      ( GET-1IMAGE ?auto_27019 ?auto_27020 )
      ( GET-3IMAGE-VERIFY ?auto_27015 ?auto_27016 ?auto_27018 ?auto_27017 ?auto_27019 ?auto_27020 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27041 - DIRECTION
      ?auto_27042 - MODE
      ?auto_27044 - DIRECTION
      ?auto_27043 - MODE
      ?auto_27045 - DIRECTION
      ?auto_27046 - MODE
    )
    :vars
    (
      ?auto_27048 - INSTRUMENT
      ?auto_27047 - SATELLITE
      ?auto_27052 - DIRECTION
      ?auto_27049 - INSTRUMENT
      ?auto_27051 - INSTRUMENT
      ?auto_27050 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27044 ?auto_27041 ) ) ( not ( = ?auto_27045 ?auto_27041 ) ) ( not ( = ?auto_27045 ?auto_27044 ) ) ( ON_BOARD ?auto_27048 ?auto_27047 ) ( SUPPORTS ?auto_27048 ?auto_27043 ) ( not ( = ?auto_27044 ?auto_27052 ) ) ( CALIBRATION_TARGET ?auto_27048 ?auto_27052 ) ( not ( = ?auto_27052 ?auto_27045 ) ) ( ON_BOARD ?auto_27049 ?auto_27047 ) ( not ( = ?auto_27048 ?auto_27049 ) ) ( SUPPORTS ?auto_27049 ?auto_27046 ) ( CALIBRATION_TARGET ?auto_27049 ?auto_27052 ) ( not ( = ?auto_27052 ?auto_27041 ) ) ( ON_BOARD ?auto_27051 ?auto_27047 ) ( not ( = ?auto_27049 ?auto_27051 ) ) ( SUPPORTS ?auto_27051 ?auto_27042 ) ( CALIBRATION_TARGET ?auto_27051 ?auto_27052 ) ( POWER_AVAIL ?auto_27047 ) ( POINTING ?auto_27047 ?auto_27050 ) ( not ( = ?auto_27052 ?auto_27050 ) ) ( not ( = ?auto_27041 ?auto_27050 ) ) ( not ( = ?auto_27042 ?auto_27046 ) ) ( not ( = ?auto_27045 ?auto_27050 ) ) ( not ( = ?auto_27042 ?auto_27043 ) ) ( not ( = ?auto_27046 ?auto_27043 ) ) ( not ( = ?auto_27044 ?auto_27050 ) ) ( not ( = ?auto_27048 ?auto_27051 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_27041 ?auto_27042 ?auto_27045 ?auto_27046 ?auto_27044 ?auto_27043 )
      ( GET-3IMAGE-VERIFY ?auto_27041 ?auto_27042 ?auto_27044 ?auto_27043 ?auto_27045 ?auto_27046 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27067 - DIRECTION
      ?auto_27068 - MODE
      ?auto_27070 - DIRECTION
      ?auto_27069 - MODE
      ?auto_27071 - DIRECTION
      ?auto_27072 - MODE
    )
    :vars
    (
      ?auto_27076 - INSTRUMENT
      ?auto_27078 - SATELLITE
      ?auto_27074 - DIRECTION
      ?auto_27077 - INSTRUMENT
      ?auto_27075 - INSTRUMENT
      ?auto_27073 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27070 ?auto_27067 ) ) ( not ( = ?auto_27071 ?auto_27067 ) ) ( not ( = ?auto_27071 ?auto_27070 ) ) ( ON_BOARD ?auto_27076 ?auto_27078 ) ( SUPPORTS ?auto_27076 ?auto_27072 ) ( not ( = ?auto_27071 ?auto_27074 ) ) ( CALIBRATION_TARGET ?auto_27076 ?auto_27074 ) ( not ( = ?auto_27074 ?auto_27067 ) ) ( ON_BOARD ?auto_27077 ?auto_27078 ) ( not ( = ?auto_27076 ?auto_27077 ) ) ( SUPPORTS ?auto_27077 ?auto_27068 ) ( CALIBRATION_TARGET ?auto_27077 ?auto_27074 ) ( not ( = ?auto_27074 ?auto_27070 ) ) ( ON_BOARD ?auto_27075 ?auto_27078 ) ( not ( = ?auto_27077 ?auto_27075 ) ) ( SUPPORTS ?auto_27075 ?auto_27069 ) ( CALIBRATION_TARGET ?auto_27075 ?auto_27074 ) ( POWER_AVAIL ?auto_27078 ) ( POINTING ?auto_27078 ?auto_27073 ) ( not ( = ?auto_27074 ?auto_27073 ) ) ( not ( = ?auto_27070 ?auto_27073 ) ) ( not ( = ?auto_27069 ?auto_27068 ) ) ( not ( = ?auto_27067 ?auto_27073 ) ) ( not ( = ?auto_27069 ?auto_27072 ) ) ( not ( = ?auto_27068 ?auto_27072 ) ) ( not ( = ?auto_27071 ?auto_27073 ) ) ( not ( = ?auto_27076 ?auto_27075 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_27070 ?auto_27069 ?auto_27071 ?auto_27072 ?auto_27067 ?auto_27068 )
      ( GET-3IMAGE-VERIFY ?auto_27067 ?auto_27068 ?auto_27070 ?auto_27069 ?auto_27071 ?auto_27072 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27093 - DIRECTION
      ?auto_27094 - MODE
      ?auto_27096 - DIRECTION
      ?auto_27095 - MODE
      ?auto_27097 - DIRECTION
      ?auto_27098 - MODE
    )
    :vars
    (
      ?auto_27102 - INSTRUMENT
      ?auto_27104 - SATELLITE
      ?auto_27100 - DIRECTION
      ?auto_27103 - INSTRUMENT
      ?auto_27101 - INSTRUMENT
      ?auto_27099 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27096 ?auto_27093 ) ) ( not ( = ?auto_27097 ?auto_27093 ) ) ( not ( = ?auto_27097 ?auto_27096 ) ) ( ON_BOARD ?auto_27102 ?auto_27104 ) ( SUPPORTS ?auto_27102 ?auto_27095 ) ( not ( = ?auto_27096 ?auto_27100 ) ) ( CALIBRATION_TARGET ?auto_27102 ?auto_27100 ) ( not ( = ?auto_27100 ?auto_27093 ) ) ( ON_BOARD ?auto_27103 ?auto_27104 ) ( not ( = ?auto_27102 ?auto_27103 ) ) ( SUPPORTS ?auto_27103 ?auto_27094 ) ( CALIBRATION_TARGET ?auto_27103 ?auto_27100 ) ( not ( = ?auto_27100 ?auto_27097 ) ) ( ON_BOARD ?auto_27101 ?auto_27104 ) ( not ( = ?auto_27103 ?auto_27101 ) ) ( SUPPORTS ?auto_27101 ?auto_27098 ) ( CALIBRATION_TARGET ?auto_27101 ?auto_27100 ) ( POWER_AVAIL ?auto_27104 ) ( POINTING ?auto_27104 ?auto_27099 ) ( not ( = ?auto_27100 ?auto_27099 ) ) ( not ( = ?auto_27097 ?auto_27099 ) ) ( not ( = ?auto_27098 ?auto_27094 ) ) ( not ( = ?auto_27093 ?auto_27099 ) ) ( not ( = ?auto_27098 ?auto_27095 ) ) ( not ( = ?auto_27094 ?auto_27095 ) ) ( not ( = ?auto_27096 ?auto_27099 ) ) ( not ( = ?auto_27102 ?auto_27101 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_27097 ?auto_27098 ?auto_27096 ?auto_27095 ?auto_27093 ?auto_27094 )
      ( GET-3IMAGE-VERIFY ?auto_27093 ?auto_27094 ?auto_27096 ?auto_27095 ?auto_27097 ?auto_27098 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27147 - DIRECTION
      ?auto_27148 - MODE
      ?auto_27150 - DIRECTION
      ?auto_27149 - MODE
      ?auto_27151 - DIRECTION
      ?auto_27152 - MODE
    )
    :vars
    (
      ?auto_27156 - INSTRUMENT
      ?auto_27158 - SATELLITE
      ?auto_27154 - DIRECTION
      ?auto_27157 - INSTRUMENT
      ?auto_27155 - INSTRUMENT
      ?auto_27153 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27150 ?auto_27147 ) ) ( not ( = ?auto_27151 ?auto_27147 ) ) ( not ( = ?auto_27151 ?auto_27150 ) ) ( ON_BOARD ?auto_27156 ?auto_27158 ) ( SUPPORTS ?auto_27156 ?auto_27148 ) ( not ( = ?auto_27147 ?auto_27154 ) ) ( CALIBRATION_TARGET ?auto_27156 ?auto_27154 ) ( not ( = ?auto_27154 ?auto_27151 ) ) ( ON_BOARD ?auto_27157 ?auto_27158 ) ( not ( = ?auto_27156 ?auto_27157 ) ) ( SUPPORTS ?auto_27157 ?auto_27152 ) ( CALIBRATION_TARGET ?auto_27157 ?auto_27154 ) ( not ( = ?auto_27154 ?auto_27150 ) ) ( ON_BOARD ?auto_27155 ?auto_27158 ) ( not ( = ?auto_27157 ?auto_27155 ) ) ( SUPPORTS ?auto_27155 ?auto_27149 ) ( CALIBRATION_TARGET ?auto_27155 ?auto_27154 ) ( POWER_AVAIL ?auto_27158 ) ( POINTING ?auto_27158 ?auto_27153 ) ( not ( = ?auto_27154 ?auto_27153 ) ) ( not ( = ?auto_27150 ?auto_27153 ) ) ( not ( = ?auto_27149 ?auto_27152 ) ) ( not ( = ?auto_27151 ?auto_27153 ) ) ( not ( = ?auto_27149 ?auto_27148 ) ) ( not ( = ?auto_27152 ?auto_27148 ) ) ( not ( = ?auto_27147 ?auto_27153 ) ) ( not ( = ?auto_27156 ?auto_27155 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_27150 ?auto_27149 ?auto_27147 ?auto_27148 ?auto_27151 ?auto_27152 )
      ( GET-3IMAGE-VERIFY ?auto_27147 ?auto_27148 ?auto_27150 ?auto_27149 ?auto_27151 ?auto_27152 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27173 - DIRECTION
      ?auto_27174 - MODE
      ?auto_27176 - DIRECTION
      ?auto_27175 - MODE
      ?auto_27177 - DIRECTION
      ?auto_27178 - MODE
    )
    :vars
    (
      ?auto_27182 - INSTRUMENT
      ?auto_27184 - SATELLITE
      ?auto_27180 - DIRECTION
      ?auto_27183 - INSTRUMENT
      ?auto_27181 - INSTRUMENT
      ?auto_27179 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_27176 ?auto_27173 ) ) ( not ( = ?auto_27177 ?auto_27173 ) ) ( not ( = ?auto_27177 ?auto_27176 ) ) ( ON_BOARD ?auto_27182 ?auto_27184 ) ( SUPPORTS ?auto_27182 ?auto_27174 ) ( not ( = ?auto_27173 ?auto_27180 ) ) ( CALIBRATION_TARGET ?auto_27182 ?auto_27180 ) ( not ( = ?auto_27180 ?auto_27176 ) ) ( ON_BOARD ?auto_27183 ?auto_27184 ) ( not ( = ?auto_27182 ?auto_27183 ) ) ( SUPPORTS ?auto_27183 ?auto_27175 ) ( CALIBRATION_TARGET ?auto_27183 ?auto_27180 ) ( not ( = ?auto_27180 ?auto_27177 ) ) ( ON_BOARD ?auto_27181 ?auto_27184 ) ( not ( = ?auto_27183 ?auto_27181 ) ) ( SUPPORTS ?auto_27181 ?auto_27178 ) ( CALIBRATION_TARGET ?auto_27181 ?auto_27180 ) ( POWER_AVAIL ?auto_27184 ) ( POINTING ?auto_27184 ?auto_27179 ) ( not ( = ?auto_27180 ?auto_27179 ) ) ( not ( = ?auto_27177 ?auto_27179 ) ) ( not ( = ?auto_27178 ?auto_27175 ) ) ( not ( = ?auto_27176 ?auto_27179 ) ) ( not ( = ?auto_27178 ?auto_27174 ) ) ( not ( = ?auto_27175 ?auto_27174 ) ) ( not ( = ?auto_27173 ?auto_27179 ) ) ( not ( = ?auto_27182 ?auto_27181 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_27177 ?auto_27178 ?auto_27173 ?auto_27174 ?auto_27176 ?auto_27175 )
      ( GET-3IMAGE-VERIFY ?auto_27173 ?auto_27174 ?auto_27176 ?auto_27175 ?auto_27177 ?auto_27178 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_27259 - DIRECTION
      ?auto_27260 - MODE
    )
    :vars
    (
      ?auto_27261 - INSTRUMENT
      ?auto_27262 - SATELLITE
      ?auto_27263 - DIRECTION
      ?auto_27264 - DIRECTION
      ?auto_27265 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27261 ?auto_27262 ) ( SUPPORTS ?auto_27261 ?auto_27260 ) ( not ( = ?auto_27259 ?auto_27263 ) ) ( CALIBRATION_TARGET ?auto_27261 ?auto_27263 ) ( POINTING ?auto_27262 ?auto_27264 ) ( not ( = ?auto_27263 ?auto_27264 ) ) ( ON_BOARD ?auto_27265 ?auto_27262 ) ( POWER_ON ?auto_27265 ) ( not ( = ?auto_27259 ?auto_27264 ) ) ( not ( = ?auto_27261 ?auto_27265 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_27265 ?auto_27262 )
      ( !TURN_TO ?auto_27262 ?auto_27263 ?auto_27264 )
      ( !SWITCH_ON ?auto_27261 ?auto_27262 )
      ( !CALIBRATE ?auto_27262 ?auto_27261 ?auto_27263 )
      ( !TURN_TO ?auto_27262 ?auto_27259 ?auto_27263 )
      ( !TAKE_IMAGE ?auto_27262 ?auto_27259 ?auto_27261 ?auto_27260 )
      ( GET-1IMAGE-VERIFY ?auto_27259 ?auto_27260 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_28825 - DIRECTION
      ?auto_28826 - MODE
      ?auto_28828 - DIRECTION
      ?auto_28827 - MODE
      ?auto_28829 - DIRECTION
      ?auto_28830 - MODE
      ?auto_28831 - DIRECTION
      ?auto_28832 - MODE
    )
    :vars
    (
      ?auto_28833 - INSTRUMENT
      ?auto_28834 - SATELLITE
      ?auto_28835 - DIRECTION
      ?auto_28836 - INSTRUMENT
      ?auto_28839 - INSTRUMENT
      ?auto_28838 - INSTRUMENT
      ?auto_28837 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28828 ?auto_28825 ) ) ( not ( = ?auto_28829 ?auto_28825 ) ) ( not ( = ?auto_28829 ?auto_28828 ) ) ( not ( = ?auto_28831 ?auto_28825 ) ) ( not ( = ?auto_28831 ?auto_28828 ) ) ( not ( = ?auto_28831 ?auto_28829 ) ) ( ON_BOARD ?auto_28833 ?auto_28834 ) ( SUPPORTS ?auto_28833 ?auto_28832 ) ( not ( = ?auto_28831 ?auto_28835 ) ) ( CALIBRATION_TARGET ?auto_28833 ?auto_28835 ) ( not ( = ?auto_28835 ?auto_28829 ) ) ( ON_BOARD ?auto_28836 ?auto_28834 ) ( not ( = ?auto_28833 ?auto_28836 ) ) ( SUPPORTS ?auto_28836 ?auto_28830 ) ( CALIBRATION_TARGET ?auto_28836 ?auto_28835 ) ( not ( = ?auto_28835 ?auto_28828 ) ) ( ON_BOARD ?auto_28839 ?auto_28834 ) ( not ( = ?auto_28836 ?auto_28839 ) ) ( SUPPORTS ?auto_28839 ?auto_28827 ) ( CALIBRATION_TARGET ?auto_28839 ?auto_28835 ) ( not ( = ?auto_28835 ?auto_28825 ) ) ( ON_BOARD ?auto_28838 ?auto_28834 ) ( not ( = ?auto_28839 ?auto_28838 ) ) ( SUPPORTS ?auto_28838 ?auto_28826 ) ( CALIBRATION_TARGET ?auto_28838 ?auto_28835 ) ( POWER_AVAIL ?auto_28834 ) ( POINTING ?auto_28834 ?auto_28837 ) ( not ( = ?auto_28835 ?auto_28837 ) ) ( not ( = ?auto_28825 ?auto_28837 ) ) ( not ( = ?auto_28826 ?auto_28827 ) ) ( not ( = ?auto_28828 ?auto_28837 ) ) ( not ( = ?auto_28826 ?auto_28830 ) ) ( not ( = ?auto_28827 ?auto_28830 ) ) ( not ( = ?auto_28829 ?auto_28837 ) ) ( not ( = ?auto_28836 ?auto_28838 ) ) ( not ( = ?auto_28826 ?auto_28832 ) ) ( not ( = ?auto_28827 ?auto_28832 ) ) ( not ( = ?auto_28830 ?auto_28832 ) ) ( not ( = ?auto_28831 ?auto_28837 ) ) ( not ( = ?auto_28833 ?auto_28839 ) ) ( not ( = ?auto_28833 ?auto_28838 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_28825 ?auto_28826 ?auto_28829 ?auto_28830 ?auto_28828 ?auto_28827 )
      ( GET-1IMAGE ?auto_28831 ?auto_28832 )
      ( GET-4IMAGE-VERIFY ?auto_28825 ?auto_28826 ?auto_28828 ?auto_28827 ?auto_28829 ?auto_28830 ?auto_28831 ?auto_28832 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_28874 - DIRECTION
      ?auto_28875 - MODE
      ?auto_28877 - DIRECTION
      ?auto_28876 - MODE
      ?auto_28878 - DIRECTION
      ?auto_28879 - MODE
      ?auto_28880 - DIRECTION
      ?auto_28881 - MODE
    )
    :vars
    (
      ?auto_28885 - INSTRUMENT
      ?auto_28884 - SATELLITE
      ?auto_28886 - DIRECTION
      ?auto_28888 - INSTRUMENT
      ?auto_28887 - INSTRUMENT
      ?auto_28882 - INSTRUMENT
      ?auto_28883 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28877 ?auto_28874 ) ) ( not ( = ?auto_28878 ?auto_28874 ) ) ( not ( = ?auto_28878 ?auto_28877 ) ) ( not ( = ?auto_28880 ?auto_28874 ) ) ( not ( = ?auto_28880 ?auto_28877 ) ) ( not ( = ?auto_28880 ?auto_28878 ) ) ( ON_BOARD ?auto_28885 ?auto_28884 ) ( SUPPORTS ?auto_28885 ?auto_28879 ) ( not ( = ?auto_28878 ?auto_28886 ) ) ( CALIBRATION_TARGET ?auto_28885 ?auto_28886 ) ( not ( = ?auto_28886 ?auto_28880 ) ) ( ON_BOARD ?auto_28888 ?auto_28884 ) ( not ( = ?auto_28885 ?auto_28888 ) ) ( SUPPORTS ?auto_28888 ?auto_28881 ) ( CALIBRATION_TARGET ?auto_28888 ?auto_28886 ) ( not ( = ?auto_28886 ?auto_28877 ) ) ( ON_BOARD ?auto_28887 ?auto_28884 ) ( not ( = ?auto_28888 ?auto_28887 ) ) ( SUPPORTS ?auto_28887 ?auto_28876 ) ( CALIBRATION_TARGET ?auto_28887 ?auto_28886 ) ( not ( = ?auto_28886 ?auto_28874 ) ) ( ON_BOARD ?auto_28882 ?auto_28884 ) ( not ( = ?auto_28887 ?auto_28882 ) ) ( SUPPORTS ?auto_28882 ?auto_28875 ) ( CALIBRATION_TARGET ?auto_28882 ?auto_28886 ) ( POWER_AVAIL ?auto_28884 ) ( POINTING ?auto_28884 ?auto_28883 ) ( not ( = ?auto_28886 ?auto_28883 ) ) ( not ( = ?auto_28874 ?auto_28883 ) ) ( not ( = ?auto_28875 ?auto_28876 ) ) ( not ( = ?auto_28877 ?auto_28883 ) ) ( not ( = ?auto_28875 ?auto_28881 ) ) ( not ( = ?auto_28876 ?auto_28881 ) ) ( not ( = ?auto_28880 ?auto_28883 ) ) ( not ( = ?auto_28888 ?auto_28882 ) ) ( not ( = ?auto_28875 ?auto_28879 ) ) ( not ( = ?auto_28876 ?auto_28879 ) ) ( not ( = ?auto_28881 ?auto_28879 ) ) ( not ( = ?auto_28878 ?auto_28883 ) ) ( not ( = ?auto_28885 ?auto_28887 ) ) ( not ( = ?auto_28885 ?auto_28882 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_28874 ?auto_28875 ?auto_28877 ?auto_28876 ?auto_28880 ?auto_28881 ?auto_28878 ?auto_28879 )
      ( GET-4IMAGE-VERIFY ?auto_28874 ?auto_28875 ?auto_28877 ?auto_28876 ?auto_28878 ?auto_28879 ?auto_28880 ?auto_28881 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_28923 - DIRECTION
      ?auto_28924 - MODE
      ?auto_28926 - DIRECTION
      ?auto_28925 - MODE
      ?auto_28927 - DIRECTION
      ?auto_28928 - MODE
      ?auto_28929 - DIRECTION
      ?auto_28930 - MODE
    )
    :vars
    (
      ?auto_28935 - INSTRUMENT
      ?auto_28936 - SATELLITE
      ?auto_28932 - DIRECTION
      ?auto_28937 - INSTRUMENT
      ?auto_28931 - INSTRUMENT
      ?auto_28934 - INSTRUMENT
      ?auto_28933 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28926 ?auto_28923 ) ) ( not ( = ?auto_28927 ?auto_28923 ) ) ( not ( = ?auto_28927 ?auto_28926 ) ) ( not ( = ?auto_28929 ?auto_28923 ) ) ( not ( = ?auto_28929 ?auto_28926 ) ) ( not ( = ?auto_28929 ?auto_28927 ) ) ( ON_BOARD ?auto_28935 ?auto_28936 ) ( SUPPORTS ?auto_28935 ?auto_28930 ) ( not ( = ?auto_28929 ?auto_28932 ) ) ( CALIBRATION_TARGET ?auto_28935 ?auto_28932 ) ( not ( = ?auto_28932 ?auto_28926 ) ) ( ON_BOARD ?auto_28937 ?auto_28936 ) ( not ( = ?auto_28935 ?auto_28937 ) ) ( SUPPORTS ?auto_28937 ?auto_28925 ) ( CALIBRATION_TARGET ?auto_28937 ?auto_28932 ) ( not ( = ?auto_28932 ?auto_28927 ) ) ( ON_BOARD ?auto_28931 ?auto_28936 ) ( not ( = ?auto_28937 ?auto_28931 ) ) ( SUPPORTS ?auto_28931 ?auto_28928 ) ( CALIBRATION_TARGET ?auto_28931 ?auto_28932 ) ( not ( = ?auto_28932 ?auto_28923 ) ) ( ON_BOARD ?auto_28934 ?auto_28936 ) ( not ( = ?auto_28931 ?auto_28934 ) ) ( SUPPORTS ?auto_28934 ?auto_28924 ) ( CALIBRATION_TARGET ?auto_28934 ?auto_28932 ) ( POWER_AVAIL ?auto_28936 ) ( POINTING ?auto_28936 ?auto_28933 ) ( not ( = ?auto_28932 ?auto_28933 ) ) ( not ( = ?auto_28923 ?auto_28933 ) ) ( not ( = ?auto_28924 ?auto_28928 ) ) ( not ( = ?auto_28927 ?auto_28933 ) ) ( not ( = ?auto_28924 ?auto_28925 ) ) ( not ( = ?auto_28928 ?auto_28925 ) ) ( not ( = ?auto_28926 ?auto_28933 ) ) ( not ( = ?auto_28937 ?auto_28934 ) ) ( not ( = ?auto_28924 ?auto_28930 ) ) ( not ( = ?auto_28928 ?auto_28930 ) ) ( not ( = ?auto_28925 ?auto_28930 ) ) ( not ( = ?auto_28929 ?auto_28933 ) ) ( not ( = ?auto_28935 ?auto_28931 ) ) ( not ( = ?auto_28935 ?auto_28934 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_28923 ?auto_28924 ?auto_28927 ?auto_28928 ?auto_28929 ?auto_28930 ?auto_28926 ?auto_28925 )
      ( GET-4IMAGE-VERIFY ?auto_28923 ?auto_28924 ?auto_28926 ?auto_28925 ?auto_28927 ?auto_28928 ?auto_28929 ?auto_28930 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_28972 - DIRECTION
      ?auto_28973 - MODE
      ?auto_28975 - DIRECTION
      ?auto_28974 - MODE
      ?auto_28976 - DIRECTION
      ?auto_28977 - MODE
      ?auto_28978 - DIRECTION
      ?auto_28979 - MODE
    )
    :vars
    (
      ?auto_28984 - INSTRUMENT
      ?auto_28985 - SATELLITE
      ?auto_28981 - DIRECTION
      ?auto_28986 - INSTRUMENT
      ?auto_28980 - INSTRUMENT
      ?auto_28983 - INSTRUMENT
      ?auto_28982 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_28975 ?auto_28972 ) ) ( not ( = ?auto_28976 ?auto_28972 ) ) ( not ( = ?auto_28976 ?auto_28975 ) ) ( not ( = ?auto_28978 ?auto_28972 ) ) ( not ( = ?auto_28978 ?auto_28975 ) ) ( not ( = ?auto_28978 ?auto_28976 ) ) ( ON_BOARD ?auto_28984 ?auto_28985 ) ( SUPPORTS ?auto_28984 ?auto_28977 ) ( not ( = ?auto_28976 ?auto_28981 ) ) ( CALIBRATION_TARGET ?auto_28984 ?auto_28981 ) ( not ( = ?auto_28981 ?auto_28975 ) ) ( ON_BOARD ?auto_28986 ?auto_28985 ) ( not ( = ?auto_28984 ?auto_28986 ) ) ( SUPPORTS ?auto_28986 ?auto_28974 ) ( CALIBRATION_TARGET ?auto_28986 ?auto_28981 ) ( not ( = ?auto_28981 ?auto_28978 ) ) ( ON_BOARD ?auto_28980 ?auto_28985 ) ( not ( = ?auto_28986 ?auto_28980 ) ) ( SUPPORTS ?auto_28980 ?auto_28979 ) ( CALIBRATION_TARGET ?auto_28980 ?auto_28981 ) ( not ( = ?auto_28981 ?auto_28972 ) ) ( ON_BOARD ?auto_28983 ?auto_28985 ) ( not ( = ?auto_28980 ?auto_28983 ) ) ( SUPPORTS ?auto_28983 ?auto_28973 ) ( CALIBRATION_TARGET ?auto_28983 ?auto_28981 ) ( POWER_AVAIL ?auto_28985 ) ( POINTING ?auto_28985 ?auto_28982 ) ( not ( = ?auto_28981 ?auto_28982 ) ) ( not ( = ?auto_28972 ?auto_28982 ) ) ( not ( = ?auto_28973 ?auto_28979 ) ) ( not ( = ?auto_28978 ?auto_28982 ) ) ( not ( = ?auto_28973 ?auto_28974 ) ) ( not ( = ?auto_28979 ?auto_28974 ) ) ( not ( = ?auto_28975 ?auto_28982 ) ) ( not ( = ?auto_28986 ?auto_28983 ) ) ( not ( = ?auto_28973 ?auto_28977 ) ) ( not ( = ?auto_28979 ?auto_28977 ) ) ( not ( = ?auto_28974 ?auto_28977 ) ) ( not ( = ?auto_28976 ?auto_28982 ) ) ( not ( = ?auto_28984 ?auto_28980 ) ) ( not ( = ?auto_28984 ?auto_28983 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_28972 ?auto_28973 ?auto_28978 ?auto_28979 ?auto_28976 ?auto_28977 ?auto_28975 ?auto_28974 )
      ( GET-4IMAGE-VERIFY ?auto_28972 ?auto_28973 ?auto_28975 ?auto_28974 ?auto_28976 ?auto_28977 ?auto_28978 ?auto_28979 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29127 - DIRECTION
      ?auto_29128 - MODE
      ?auto_29130 - DIRECTION
      ?auto_29129 - MODE
      ?auto_29131 - DIRECTION
      ?auto_29132 - MODE
      ?auto_29133 - DIRECTION
      ?auto_29134 - MODE
    )
    :vars
    (
      ?auto_29139 - INSTRUMENT
      ?auto_29140 - SATELLITE
      ?auto_29136 - DIRECTION
      ?auto_29141 - INSTRUMENT
      ?auto_29135 - INSTRUMENT
      ?auto_29138 - INSTRUMENT
      ?auto_29137 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29130 ?auto_29127 ) ) ( not ( = ?auto_29131 ?auto_29127 ) ) ( not ( = ?auto_29131 ?auto_29130 ) ) ( not ( = ?auto_29133 ?auto_29127 ) ) ( not ( = ?auto_29133 ?auto_29130 ) ) ( not ( = ?auto_29133 ?auto_29131 ) ) ( ON_BOARD ?auto_29139 ?auto_29140 ) ( SUPPORTS ?auto_29139 ?auto_29129 ) ( not ( = ?auto_29130 ?auto_29136 ) ) ( CALIBRATION_TARGET ?auto_29139 ?auto_29136 ) ( not ( = ?auto_29136 ?auto_29133 ) ) ( ON_BOARD ?auto_29141 ?auto_29140 ) ( not ( = ?auto_29139 ?auto_29141 ) ) ( SUPPORTS ?auto_29141 ?auto_29134 ) ( CALIBRATION_TARGET ?auto_29141 ?auto_29136 ) ( not ( = ?auto_29136 ?auto_29131 ) ) ( ON_BOARD ?auto_29135 ?auto_29140 ) ( not ( = ?auto_29141 ?auto_29135 ) ) ( SUPPORTS ?auto_29135 ?auto_29132 ) ( CALIBRATION_TARGET ?auto_29135 ?auto_29136 ) ( not ( = ?auto_29136 ?auto_29127 ) ) ( ON_BOARD ?auto_29138 ?auto_29140 ) ( not ( = ?auto_29135 ?auto_29138 ) ) ( SUPPORTS ?auto_29138 ?auto_29128 ) ( CALIBRATION_TARGET ?auto_29138 ?auto_29136 ) ( POWER_AVAIL ?auto_29140 ) ( POINTING ?auto_29140 ?auto_29137 ) ( not ( = ?auto_29136 ?auto_29137 ) ) ( not ( = ?auto_29127 ?auto_29137 ) ) ( not ( = ?auto_29128 ?auto_29132 ) ) ( not ( = ?auto_29131 ?auto_29137 ) ) ( not ( = ?auto_29128 ?auto_29134 ) ) ( not ( = ?auto_29132 ?auto_29134 ) ) ( not ( = ?auto_29133 ?auto_29137 ) ) ( not ( = ?auto_29141 ?auto_29138 ) ) ( not ( = ?auto_29128 ?auto_29129 ) ) ( not ( = ?auto_29132 ?auto_29129 ) ) ( not ( = ?auto_29134 ?auto_29129 ) ) ( not ( = ?auto_29130 ?auto_29137 ) ) ( not ( = ?auto_29139 ?auto_29135 ) ) ( not ( = ?auto_29139 ?auto_29138 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29127 ?auto_29128 ?auto_29131 ?auto_29132 ?auto_29130 ?auto_29129 ?auto_29133 ?auto_29134 )
      ( GET-4IMAGE-VERIFY ?auto_29127 ?auto_29128 ?auto_29130 ?auto_29129 ?auto_29131 ?auto_29132 ?auto_29133 ?auto_29134 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29176 - DIRECTION
      ?auto_29177 - MODE
      ?auto_29179 - DIRECTION
      ?auto_29178 - MODE
      ?auto_29180 - DIRECTION
      ?auto_29181 - MODE
      ?auto_29182 - DIRECTION
      ?auto_29183 - MODE
    )
    :vars
    (
      ?auto_29188 - INSTRUMENT
      ?auto_29189 - SATELLITE
      ?auto_29185 - DIRECTION
      ?auto_29190 - INSTRUMENT
      ?auto_29184 - INSTRUMENT
      ?auto_29187 - INSTRUMENT
      ?auto_29186 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29179 ?auto_29176 ) ) ( not ( = ?auto_29180 ?auto_29176 ) ) ( not ( = ?auto_29180 ?auto_29179 ) ) ( not ( = ?auto_29182 ?auto_29176 ) ) ( not ( = ?auto_29182 ?auto_29179 ) ) ( not ( = ?auto_29182 ?auto_29180 ) ) ( ON_BOARD ?auto_29188 ?auto_29189 ) ( SUPPORTS ?auto_29188 ?auto_29178 ) ( not ( = ?auto_29179 ?auto_29185 ) ) ( CALIBRATION_TARGET ?auto_29188 ?auto_29185 ) ( not ( = ?auto_29185 ?auto_29180 ) ) ( ON_BOARD ?auto_29190 ?auto_29189 ) ( not ( = ?auto_29188 ?auto_29190 ) ) ( SUPPORTS ?auto_29190 ?auto_29181 ) ( CALIBRATION_TARGET ?auto_29190 ?auto_29185 ) ( not ( = ?auto_29185 ?auto_29182 ) ) ( ON_BOARD ?auto_29184 ?auto_29189 ) ( not ( = ?auto_29190 ?auto_29184 ) ) ( SUPPORTS ?auto_29184 ?auto_29183 ) ( CALIBRATION_TARGET ?auto_29184 ?auto_29185 ) ( not ( = ?auto_29185 ?auto_29176 ) ) ( ON_BOARD ?auto_29187 ?auto_29189 ) ( not ( = ?auto_29184 ?auto_29187 ) ) ( SUPPORTS ?auto_29187 ?auto_29177 ) ( CALIBRATION_TARGET ?auto_29187 ?auto_29185 ) ( POWER_AVAIL ?auto_29189 ) ( POINTING ?auto_29189 ?auto_29186 ) ( not ( = ?auto_29185 ?auto_29186 ) ) ( not ( = ?auto_29176 ?auto_29186 ) ) ( not ( = ?auto_29177 ?auto_29183 ) ) ( not ( = ?auto_29182 ?auto_29186 ) ) ( not ( = ?auto_29177 ?auto_29181 ) ) ( not ( = ?auto_29183 ?auto_29181 ) ) ( not ( = ?auto_29180 ?auto_29186 ) ) ( not ( = ?auto_29190 ?auto_29187 ) ) ( not ( = ?auto_29177 ?auto_29178 ) ) ( not ( = ?auto_29183 ?auto_29178 ) ) ( not ( = ?auto_29181 ?auto_29178 ) ) ( not ( = ?auto_29179 ?auto_29186 ) ) ( not ( = ?auto_29188 ?auto_29184 ) ) ( not ( = ?auto_29188 ?auto_29187 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29176 ?auto_29177 ?auto_29182 ?auto_29183 ?auto_29179 ?auto_29178 ?auto_29180 ?auto_29181 )
      ( GET-4IMAGE-VERIFY ?auto_29176 ?auto_29177 ?auto_29179 ?auto_29178 ?auto_29180 ?auto_29181 ?auto_29182 ?auto_29183 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29331 - DIRECTION
      ?auto_29332 - MODE
      ?auto_29334 - DIRECTION
      ?auto_29333 - MODE
      ?auto_29335 - DIRECTION
      ?auto_29336 - MODE
      ?auto_29337 - DIRECTION
      ?auto_29338 - MODE
    )
    :vars
    (
      ?auto_29343 - INSTRUMENT
      ?auto_29344 - SATELLITE
      ?auto_29340 - DIRECTION
      ?auto_29345 - INSTRUMENT
      ?auto_29339 - INSTRUMENT
      ?auto_29342 - INSTRUMENT
      ?auto_29341 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29334 ?auto_29331 ) ) ( not ( = ?auto_29335 ?auto_29331 ) ) ( not ( = ?auto_29335 ?auto_29334 ) ) ( not ( = ?auto_29337 ?auto_29331 ) ) ( not ( = ?auto_29337 ?auto_29334 ) ) ( not ( = ?auto_29337 ?auto_29335 ) ) ( ON_BOARD ?auto_29343 ?auto_29344 ) ( SUPPORTS ?auto_29343 ?auto_29338 ) ( not ( = ?auto_29337 ?auto_29340 ) ) ( CALIBRATION_TARGET ?auto_29343 ?auto_29340 ) ( not ( = ?auto_29340 ?auto_29335 ) ) ( ON_BOARD ?auto_29345 ?auto_29344 ) ( not ( = ?auto_29343 ?auto_29345 ) ) ( SUPPORTS ?auto_29345 ?auto_29336 ) ( CALIBRATION_TARGET ?auto_29345 ?auto_29340 ) ( not ( = ?auto_29340 ?auto_29331 ) ) ( ON_BOARD ?auto_29339 ?auto_29344 ) ( not ( = ?auto_29345 ?auto_29339 ) ) ( SUPPORTS ?auto_29339 ?auto_29332 ) ( CALIBRATION_TARGET ?auto_29339 ?auto_29340 ) ( not ( = ?auto_29340 ?auto_29334 ) ) ( ON_BOARD ?auto_29342 ?auto_29344 ) ( not ( = ?auto_29339 ?auto_29342 ) ) ( SUPPORTS ?auto_29342 ?auto_29333 ) ( CALIBRATION_TARGET ?auto_29342 ?auto_29340 ) ( POWER_AVAIL ?auto_29344 ) ( POINTING ?auto_29344 ?auto_29341 ) ( not ( = ?auto_29340 ?auto_29341 ) ) ( not ( = ?auto_29334 ?auto_29341 ) ) ( not ( = ?auto_29333 ?auto_29332 ) ) ( not ( = ?auto_29331 ?auto_29341 ) ) ( not ( = ?auto_29333 ?auto_29336 ) ) ( not ( = ?auto_29332 ?auto_29336 ) ) ( not ( = ?auto_29335 ?auto_29341 ) ) ( not ( = ?auto_29345 ?auto_29342 ) ) ( not ( = ?auto_29333 ?auto_29338 ) ) ( not ( = ?auto_29332 ?auto_29338 ) ) ( not ( = ?auto_29336 ?auto_29338 ) ) ( not ( = ?auto_29337 ?auto_29341 ) ) ( not ( = ?auto_29343 ?auto_29339 ) ) ( not ( = ?auto_29343 ?auto_29342 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29334 ?auto_29333 ?auto_29331 ?auto_29332 ?auto_29337 ?auto_29338 ?auto_29335 ?auto_29336 )
      ( GET-4IMAGE-VERIFY ?auto_29331 ?auto_29332 ?auto_29334 ?auto_29333 ?auto_29335 ?auto_29336 ?auto_29337 ?auto_29338 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29380 - DIRECTION
      ?auto_29381 - MODE
      ?auto_29383 - DIRECTION
      ?auto_29382 - MODE
      ?auto_29384 - DIRECTION
      ?auto_29385 - MODE
      ?auto_29386 - DIRECTION
      ?auto_29387 - MODE
    )
    :vars
    (
      ?auto_29392 - INSTRUMENT
      ?auto_29393 - SATELLITE
      ?auto_29389 - DIRECTION
      ?auto_29394 - INSTRUMENT
      ?auto_29388 - INSTRUMENT
      ?auto_29391 - INSTRUMENT
      ?auto_29390 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29383 ?auto_29380 ) ) ( not ( = ?auto_29384 ?auto_29380 ) ) ( not ( = ?auto_29384 ?auto_29383 ) ) ( not ( = ?auto_29386 ?auto_29380 ) ) ( not ( = ?auto_29386 ?auto_29383 ) ) ( not ( = ?auto_29386 ?auto_29384 ) ) ( ON_BOARD ?auto_29392 ?auto_29393 ) ( SUPPORTS ?auto_29392 ?auto_29385 ) ( not ( = ?auto_29384 ?auto_29389 ) ) ( CALIBRATION_TARGET ?auto_29392 ?auto_29389 ) ( not ( = ?auto_29389 ?auto_29386 ) ) ( ON_BOARD ?auto_29394 ?auto_29393 ) ( not ( = ?auto_29392 ?auto_29394 ) ) ( SUPPORTS ?auto_29394 ?auto_29387 ) ( CALIBRATION_TARGET ?auto_29394 ?auto_29389 ) ( not ( = ?auto_29389 ?auto_29380 ) ) ( ON_BOARD ?auto_29388 ?auto_29393 ) ( not ( = ?auto_29394 ?auto_29388 ) ) ( SUPPORTS ?auto_29388 ?auto_29381 ) ( CALIBRATION_TARGET ?auto_29388 ?auto_29389 ) ( not ( = ?auto_29389 ?auto_29383 ) ) ( ON_BOARD ?auto_29391 ?auto_29393 ) ( not ( = ?auto_29388 ?auto_29391 ) ) ( SUPPORTS ?auto_29391 ?auto_29382 ) ( CALIBRATION_TARGET ?auto_29391 ?auto_29389 ) ( POWER_AVAIL ?auto_29393 ) ( POINTING ?auto_29393 ?auto_29390 ) ( not ( = ?auto_29389 ?auto_29390 ) ) ( not ( = ?auto_29383 ?auto_29390 ) ) ( not ( = ?auto_29382 ?auto_29381 ) ) ( not ( = ?auto_29380 ?auto_29390 ) ) ( not ( = ?auto_29382 ?auto_29387 ) ) ( not ( = ?auto_29381 ?auto_29387 ) ) ( not ( = ?auto_29386 ?auto_29390 ) ) ( not ( = ?auto_29394 ?auto_29391 ) ) ( not ( = ?auto_29382 ?auto_29385 ) ) ( not ( = ?auto_29381 ?auto_29385 ) ) ( not ( = ?auto_29387 ?auto_29385 ) ) ( not ( = ?auto_29384 ?auto_29390 ) ) ( not ( = ?auto_29392 ?auto_29388 ) ) ( not ( = ?auto_29392 ?auto_29391 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29383 ?auto_29382 ?auto_29380 ?auto_29381 ?auto_29384 ?auto_29385 ?auto_29386 ?auto_29387 )
      ( GET-4IMAGE-VERIFY ?auto_29380 ?auto_29381 ?auto_29383 ?auto_29382 ?auto_29384 ?auto_29385 ?auto_29386 ?auto_29387 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29537 - DIRECTION
      ?auto_29538 - MODE
      ?auto_29540 - DIRECTION
      ?auto_29539 - MODE
      ?auto_29541 - DIRECTION
      ?auto_29542 - MODE
      ?auto_29543 - DIRECTION
      ?auto_29544 - MODE
    )
    :vars
    (
      ?auto_29549 - INSTRUMENT
      ?auto_29550 - SATELLITE
      ?auto_29546 - DIRECTION
      ?auto_29551 - INSTRUMENT
      ?auto_29545 - INSTRUMENT
      ?auto_29548 - INSTRUMENT
      ?auto_29547 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29540 ?auto_29537 ) ) ( not ( = ?auto_29541 ?auto_29537 ) ) ( not ( = ?auto_29541 ?auto_29540 ) ) ( not ( = ?auto_29543 ?auto_29537 ) ) ( not ( = ?auto_29543 ?auto_29540 ) ) ( not ( = ?auto_29543 ?auto_29541 ) ) ( ON_BOARD ?auto_29549 ?auto_29550 ) ( SUPPORTS ?auto_29549 ?auto_29544 ) ( not ( = ?auto_29543 ?auto_29546 ) ) ( CALIBRATION_TARGET ?auto_29549 ?auto_29546 ) ( not ( = ?auto_29546 ?auto_29540 ) ) ( ON_BOARD ?auto_29551 ?auto_29550 ) ( not ( = ?auto_29549 ?auto_29551 ) ) ( SUPPORTS ?auto_29551 ?auto_29539 ) ( CALIBRATION_TARGET ?auto_29551 ?auto_29546 ) ( not ( = ?auto_29546 ?auto_29537 ) ) ( ON_BOARD ?auto_29545 ?auto_29550 ) ( not ( = ?auto_29551 ?auto_29545 ) ) ( SUPPORTS ?auto_29545 ?auto_29538 ) ( CALIBRATION_TARGET ?auto_29545 ?auto_29546 ) ( not ( = ?auto_29546 ?auto_29541 ) ) ( ON_BOARD ?auto_29548 ?auto_29550 ) ( not ( = ?auto_29545 ?auto_29548 ) ) ( SUPPORTS ?auto_29548 ?auto_29542 ) ( CALIBRATION_TARGET ?auto_29548 ?auto_29546 ) ( POWER_AVAIL ?auto_29550 ) ( POINTING ?auto_29550 ?auto_29547 ) ( not ( = ?auto_29546 ?auto_29547 ) ) ( not ( = ?auto_29541 ?auto_29547 ) ) ( not ( = ?auto_29542 ?auto_29538 ) ) ( not ( = ?auto_29537 ?auto_29547 ) ) ( not ( = ?auto_29542 ?auto_29539 ) ) ( not ( = ?auto_29538 ?auto_29539 ) ) ( not ( = ?auto_29540 ?auto_29547 ) ) ( not ( = ?auto_29551 ?auto_29548 ) ) ( not ( = ?auto_29542 ?auto_29544 ) ) ( not ( = ?auto_29538 ?auto_29544 ) ) ( not ( = ?auto_29539 ?auto_29544 ) ) ( not ( = ?auto_29543 ?auto_29547 ) ) ( not ( = ?auto_29549 ?auto_29545 ) ) ( not ( = ?auto_29549 ?auto_29548 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29541 ?auto_29542 ?auto_29537 ?auto_29538 ?auto_29543 ?auto_29544 ?auto_29540 ?auto_29539 )
      ( GET-4IMAGE-VERIFY ?auto_29537 ?auto_29538 ?auto_29540 ?auto_29539 ?auto_29541 ?auto_29542 ?auto_29543 ?auto_29544 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29586 - DIRECTION
      ?auto_29587 - MODE
      ?auto_29589 - DIRECTION
      ?auto_29588 - MODE
      ?auto_29590 - DIRECTION
      ?auto_29591 - MODE
      ?auto_29592 - DIRECTION
      ?auto_29593 - MODE
    )
    :vars
    (
      ?auto_29598 - INSTRUMENT
      ?auto_29599 - SATELLITE
      ?auto_29595 - DIRECTION
      ?auto_29600 - INSTRUMENT
      ?auto_29594 - INSTRUMENT
      ?auto_29597 - INSTRUMENT
      ?auto_29596 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29589 ?auto_29586 ) ) ( not ( = ?auto_29590 ?auto_29586 ) ) ( not ( = ?auto_29590 ?auto_29589 ) ) ( not ( = ?auto_29592 ?auto_29586 ) ) ( not ( = ?auto_29592 ?auto_29589 ) ) ( not ( = ?auto_29592 ?auto_29590 ) ) ( ON_BOARD ?auto_29598 ?auto_29599 ) ( SUPPORTS ?auto_29598 ?auto_29591 ) ( not ( = ?auto_29590 ?auto_29595 ) ) ( CALIBRATION_TARGET ?auto_29598 ?auto_29595 ) ( not ( = ?auto_29595 ?auto_29589 ) ) ( ON_BOARD ?auto_29600 ?auto_29599 ) ( not ( = ?auto_29598 ?auto_29600 ) ) ( SUPPORTS ?auto_29600 ?auto_29588 ) ( CALIBRATION_TARGET ?auto_29600 ?auto_29595 ) ( not ( = ?auto_29595 ?auto_29586 ) ) ( ON_BOARD ?auto_29594 ?auto_29599 ) ( not ( = ?auto_29600 ?auto_29594 ) ) ( SUPPORTS ?auto_29594 ?auto_29587 ) ( CALIBRATION_TARGET ?auto_29594 ?auto_29595 ) ( not ( = ?auto_29595 ?auto_29592 ) ) ( ON_BOARD ?auto_29597 ?auto_29599 ) ( not ( = ?auto_29594 ?auto_29597 ) ) ( SUPPORTS ?auto_29597 ?auto_29593 ) ( CALIBRATION_TARGET ?auto_29597 ?auto_29595 ) ( POWER_AVAIL ?auto_29599 ) ( POINTING ?auto_29599 ?auto_29596 ) ( not ( = ?auto_29595 ?auto_29596 ) ) ( not ( = ?auto_29592 ?auto_29596 ) ) ( not ( = ?auto_29593 ?auto_29587 ) ) ( not ( = ?auto_29586 ?auto_29596 ) ) ( not ( = ?auto_29593 ?auto_29588 ) ) ( not ( = ?auto_29587 ?auto_29588 ) ) ( not ( = ?auto_29589 ?auto_29596 ) ) ( not ( = ?auto_29600 ?auto_29597 ) ) ( not ( = ?auto_29593 ?auto_29591 ) ) ( not ( = ?auto_29587 ?auto_29591 ) ) ( not ( = ?auto_29588 ?auto_29591 ) ) ( not ( = ?auto_29590 ?auto_29596 ) ) ( not ( = ?auto_29598 ?auto_29594 ) ) ( not ( = ?auto_29598 ?auto_29597 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29592 ?auto_29593 ?auto_29586 ?auto_29587 ?auto_29590 ?auto_29591 ?auto_29589 ?auto_29588 )
      ( GET-4IMAGE-VERIFY ?auto_29586 ?auto_29587 ?auto_29589 ?auto_29588 ?auto_29590 ?auto_29591 ?auto_29592 ?auto_29593 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29686 - DIRECTION
      ?auto_29687 - MODE
      ?auto_29689 - DIRECTION
      ?auto_29688 - MODE
      ?auto_29690 - DIRECTION
      ?auto_29691 - MODE
      ?auto_29692 - DIRECTION
      ?auto_29693 - MODE
    )
    :vars
    (
      ?auto_29698 - INSTRUMENT
      ?auto_29699 - SATELLITE
      ?auto_29695 - DIRECTION
      ?auto_29700 - INSTRUMENT
      ?auto_29694 - INSTRUMENT
      ?auto_29697 - INSTRUMENT
      ?auto_29696 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29689 ?auto_29686 ) ) ( not ( = ?auto_29690 ?auto_29686 ) ) ( not ( = ?auto_29690 ?auto_29689 ) ) ( not ( = ?auto_29692 ?auto_29686 ) ) ( not ( = ?auto_29692 ?auto_29689 ) ) ( not ( = ?auto_29692 ?auto_29690 ) ) ( ON_BOARD ?auto_29698 ?auto_29699 ) ( SUPPORTS ?auto_29698 ?auto_29688 ) ( not ( = ?auto_29689 ?auto_29695 ) ) ( CALIBRATION_TARGET ?auto_29698 ?auto_29695 ) ( not ( = ?auto_29695 ?auto_29692 ) ) ( ON_BOARD ?auto_29700 ?auto_29699 ) ( not ( = ?auto_29698 ?auto_29700 ) ) ( SUPPORTS ?auto_29700 ?auto_29693 ) ( CALIBRATION_TARGET ?auto_29700 ?auto_29695 ) ( not ( = ?auto_29695 ?auto_29686 ) ) ( ON_BOARD ?auto_29694 ?auto_29699 ) ( not ( = ?auto_29700 ?auto_29694 ) ) ( SUPPORTS ?auto_29694 ?auto_29687 ) ( CALIBRATION_TARGET ?auto_29694 ?auto_29695 ) ( not ( = ?auto_29695 ?auto_29690 ) ) ( ON_BOARD ?auto_29697 ?auto_29699 ) ( not ( = ?auto_29694 ?auto_29697 ) ) ( SUPPORTS ?auto_29697 ?auto_29691 ) ( CALIBRATION_TARGET ?auto_29697 ?auto_29695 ) ( POWER_AVAIL ?auto_29699 ) ( POINTING ?auto_29699 ?auto_29696 ) ( not ( = ?auto_29695 ?auto_29696 ) ) ( not ( = ?auto_29690 ?auto_29696 ) ) ( not ( = ?auto_29691 ?auto_29687 ) ) ( not ( = ?auto_29686 ?auto_29696 ) ) ( not ( = ?auto_29691 ?auto_29693 ) ) ( not ( = ?auto_29687 ?auto_29693 ) ) ( not ( = ?auto_29692 ?auto_29696 ) ) ( not ( = ?auto_29700 ?auto_29697 ) ) ( not ( = ?auto_29691 ?auto_29688 ) ) ( not ( = ?auto_29687 ?auto_29688 ) ) ( not ( = ?auto_29693 ?auto_29688 ) ) ( not ( = ?auto_29689 ?auto_29696 ) ) ( not ( = ?auto_29698 ?auto_29694 ) ) ( not ( = ?auto_29698 ?auto_29697 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29690 ?auto_29691 ?auto_29686 ?auto_29687 ?auto_29689 ?auto_29688 ?auto_29692 ?auto_29693 )
      ( GET-4IMAGE-VERIFY ?auto_29686 ?auto_29687 ?auto_29689 ?auto_29688 ?auto_29690 ?auto_29691 ?auto_29692 ?auto_29693 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29790 - DIRECTION
      ?auto_29791 - MODE
      ?auto_29793 - DIRECTION
      ?auto_29792 - MODE
      ?auto_29794 - DIRECTION
      ?auto_29795 - MODE
      ?auto_29796 - DIRECTION
      ?auto_29797 - MODE
    )
    :vars
    (
      ?auto_29802 - INSTRUMENT
      ?auto_29803 - SATELLITE
      ?auto_29799 - DIRECTION
      ?auto_29804 - INSTRUMENT
      ?auto_29798 - INSTRUMENT
      ?auto_29801 - INSTRUMENT
      ?auto_29800 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29793 ?auto_29790 ) ) ( not ( = ?auto_29794 ?auto_29790 ) ) ( not ( = ?auto_29794 ?auto_29793 ) ) ( not ( = ?auto_29796 ?auto_29790 ) ) ( not ( = ?auto_29796 ?auto_29793 ) ) ( not ( = ?auto_29796 ?auto_29794 ) ) ( ON_BOARD ?auto_29802 ?auto_29803 ) ( SUPPORTS ?auto_29802 ?auto_29792 ) ( not ( = ?auto_29793 ?auto_29799 ) ) ( CALIBRATION_TARGET ?auto_29802 ?auto_29799 ) ( not ( = ?auto_29799 ?auto_29794 ) ) ( ON_BOARD ?auto_29804 ?auto_29803 ) ( not ( = ?auto_29802 ?auto_29804 ) ) ( SUPPORTS ?auto_29804 ?auto_29795 ) ( CALIBRATION_TARGET ?auto_29804 ?auto_29799 ) ( not ( = ?auto_29799 ?auto_29790 ) ) ( ON_BOARD ?auto_29798 ?auto_29803 ) ( not ( = ?auto_29804 ?auto_29798 ) ) ( SUPPORTS ?auto_29798 ?auto_29791 ) ( CALIBRATION_TARGET ?auto_29798 ?auto_29799 ) ( not ( = ?auto_29799 ?auto_29796 ) ) ( ON_BOARD ?auto_29801 ?auto_29803 ) ( not ( = ?auto_29798 ?auto_29801 ) ) ( SUPPORTS ?auto_29801 ?auto_29797 ) ( CALIBRATION_TARGET ?auto_29801 ?auto_29799 ) ( POWER_AVAIL ?auto_29803 ) ( POINTING ?auto_29803 ?auto_29800 ) ( not ( = ?auto_29799 ?auto_29800 ) ) ( not ( = ?auto_29796 ?auto_29800 ) ) ( not ( = ?auto_29797 ?auto_29791 ) ) ( not ( = ?auto_29790 ?auto_29800 ) ) ( not ( = ?auto_29797 ?auto_29795 ) ) ( not ( = ?auto_29791 ?auto_29795 ) ) ( not ( = ?auto_29794 ?auto_29800 ) ) ( not ( = ?auto_29804 ?auto_29801 ) ) ( not ( = ?auto_29797 ?auto_29792 ) ) ( not ( = ?auto_29791 ?auto_29792 ) ) ( not ( = ?auto_29795 ?auto_29792 ) ) ( not ( = ?auto_29793 ?auto_29800 ) ) ( not ( = ?auto_29802 ?auto_29798 ) ) ( not ( = ?auto_29802 ?auto_29801 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29796 ?auto_29797 ?auto_29790 ?auto_29791 ?auto_29793 ?auto_29792 ?auto_29794 ?auto_29795 )
      ( GET-4IMAGE-VERIFY ?auto_29790 ?auto_29791 ?auto_29793 ?auto_29792 ?auto_29794 ?auto_29795 ?auto_29796 ?auto_29797 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29945 - DIRECTION
      ?auto_29946 - MODE
      ?auto_29948 - DIRECTION
      ?auto_29947 - MODE
      ?auto_29949 - DIRECTION
      ?auto_29950 - MODE
      ?auto_29951 - DIRECTION
      ?auto_29952 - MODE
    )
    :vars
    (
      ?auto_29957 - INSTRUMENT
      ?auto_29958 - SATELLITE
      ?auto_29954 - DIRECTION
      ?auto_29959 - INSTRUMENT
      ?auto_29953 - INSTRUMENT
      ?auto_29956 - INSTRUMENT
      ?auto_29955 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29948 ?auto_29945 ) ) ( not ( = ?auto_29949 ?auto_29945 ) ) ( not ( = ?auto_29949 ?auto_29948 ) ) ( not ( = ?auto_29951 ?auto_29945 ) ) ( not ( = ?auto_29951 ?auto_29948 ) ) ( not ( = ?auto_29951 ?auto_29949 ) ) ( ON_BOARD ?auto_29957 ?auto_29958 ) ( SUPPORTS ?auto_29957 ?auto_29952 ) ( not ( = ?auto_29951 ?auto_29954 ) ) ( CALIBRATION_TARGET ?auto_29957 ?auto_29954 ) ( not ( = ?auto_29954 ?auto_29945 ) ) ( ON_BOARD ?auto_29959 ?auto_29958 ) ( not ( = ?auto_29957 ?auto_29959 ) ) ( SUPPORTS ?auto_29959 ?auto_29946 ) ( CALIBRATION_TARGET ?auto_29959 ?auto_29954 ) ( not ( = ?auto_29954 ?auto_29949 ) ) ( ON_BOARD ?auto_29953 ?auto_29958 ) ( not ( = ?auto_29959 ?auto_29953 ) ) ( SUPPORTS ?auto_29953 ?auto_29950 ) ( CALIBRATION_TARGET ?auto_29953 ?auto_29954 ) ( not ( = ?auto_29954 ?auto_29948 ) ) ( ON_BOARD ?auto_29956 ?auto_29958 ) ( not ( = ?auto_29953 ?auto_29956 ) ) ( SUPPORTS ?auto_29956 ?auto_29947 ) ( CALIBRATION_TARGET ?auto_29956 ?auto_29954 ) ( POWER_AVAIL ?auto_29958 ) ( POINTING ?auto_29958 ?auto_29955 ) ( not ( = ?auto_29954 ?auto_29955 ) ) ( not ( = ?auto_29948 ?auto_29955 ) ) ( not ( = ?auto_29947 ?auto_29950 ) ) ( not ( = ?auto_29949 ?auto_29955 ) ) ( not ( = ?auto_29947 ?auto_29946 ) ) ( not ( = ?auto_29950 ?auto_29946 ) ) ( not ( = ?auto_29945 ?auto_29955 ) ) ( not ( = ?auto_29959 ?auto_29956 ) ) ( not ( = ?auto_29947 ?auto_29952 ) ) ( not ( = ?auto_29950 ?auto_29952 ) ) ( not ( = ?auto_29946 ?auto_29952 ) ) ( not ( = ?auto_29951 ?auto_29955 ) ) ( not ( = ?auto_29957 ?auto_29953 ) ) ( not ( = ?auto_29957 ?auto_29956 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29948 ?auto_29947 ?auto_29949 ?auto_29950 ?auto_29951 ?auto_29952 ?auto_29945 ?auto_29946 )
      ( GET-4IMAGE-VERIFY ?auto_29945 ?auto_29946 ?auto_29948 ?auto_29947 ?auto_29949 ?auto_29950 ?auto_29951 ?auto_29952 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_29994 - DIRECTION
      ?auto_29995 - MODE
      ?auto_29997 - DIRECTION
      ?auto_29996 - MODE
      ?auto_29998 - DIRECTION
      ?auto_29999 - MODE
      ?auto_30000 - DIRECTION
      ?auto_30001 - MODE
    )
    :vars
    (
      ?auto_30006 - INSTRUMENT
      ?auto_30007 - SATELLITE
      ?auto_30003 - DIRECTION
      ?auto_30008 - INSTRUMENT
      ?auto_30002 - INSTRUMENT
      ?auto_30005 - INSTRUMENT
      ?auto_30004 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29997 ?auto_29994 ) ) ( not ( = ?auto_29998 ?auto_29994 ) ) ( not ( = ?auto_29998 ?auto_29997 ) ) ( not ( = ?auto_30000 ?auto_29994 ) ) ( not ( = ?auto_30000 ?auto_29997 ) ) ( not ( = ?auto_30000 ?auto_29998 ) ) ( ON_BOARD ?auto_30006 ?auto_30007 ) ( SUPPORTS ?auto_30006 ?auto_29999 ) ( not ( = ?auto_29998 ?auto_30003 ) ) ( CALIBRATION_TARGET ?auto_30006 ?auto_30003 ) ( not ( = ?auto_30003 ?auto_29994 ) ) ( ON_BOARD ?auto_30008 ?auto_30007 ) ( not ( = ?auto_30006 ?auto_30008 ) ) ( SUPPORTS ?auto_30008 ?auto_29995 ) ( CALIBRATION_TARGET ?auto_30008 ?auto_30003 ) ( not ( = ?auto_30003 ?auto_30000 ) ) ( ON_BOARD ?auto_30002 ?auto_30007 ) ( not ( = ?auto_30008 ?auto_30002 ) ) ( SUPPORTS ?auto_30002 ?auto_30001 ) ( CALIBRATION_TARGET ?auto_30002 ?auto_30003 ) ( not ( = ?auto_30003 ?auto_29997 ) ) ( ON_BOARD ?auto_30005 ?auto_30007 ) ( not ( = ?auto_30002 ?auto_30005 ) ) ( SUPPORTS ?auto_30005 ?auto_29996 ) ( CALIBRATION_TARGET ?auto_30005 ?auto_30003 ) ( POWER_AVAIL ?auto_30007 ) ( POINTING ?auto_30007 ?auto_30004 ) ( not ( = ?auto_30003 ?auto_30004 ) ) ( not ( = ?auto_29997 ?auto_30004 ) ) ( not ( = ?auto_29996 ?auto_30001 ) ) ( not ( = ?auto_30000 ?auto_30004 ) ) ( not ( = ?auto_29996 ?auto_29995 ) ) ( not ( = ?auto_30001 ?auto_29995 ) ) ( not ( = ?auto_29994 ?auto_30004 ) ) ( not ( = ?auto_30008 ?auto_30005 ) ) ( not ( = ?auto_29996 ?auto_29999 ) ) ( not ( = ?auto_30001 ?auto_29999 ) ) ( not ( = ?auto_29995 ?auto_29999 ) ) ( not ( = ?auto_29998 ?auto_30004 ) ) ( not ( = ?auto_30006 ?auto_30002 ) ) ( not ( = ?auto_30006 ?auto_30005 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_29997 ?auto_29996 ?auto_30000 ?auto_30001 ?auto_29998 ?auto_29999 ?auto_29994 ?auto_29995 )
      ( GET-4IMAGE-VERIFY ?auto_29994 ?auto_29995 ?auto_29997 ?auto_29996 ?auto_29998 ?auto_29999 ?auto_30000 ?auto_30001 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30043 - DIRECTION
      ?auto_30044 - MODE
      ?auto_30046 - DIRECTION
      ?auto_30045 - MODE
      ?auto_30047 - DIRECTION
      ?auto_30048 - MODE
      ?auto_30049 - DIRECTION
      ?auto_30050 - MODE
    )
    :vars
    (
      ?auto_30055 - INSTRUMENT
      ?auto_30056 - SATELLITE
      ?auto_30052 - DIRECTION
      ?auto_30057 - INSTRUMENT
      ?auto_30051 - INSTRUMENT
      ?auto_30054 - INSTRUMENT
      ?auto_30053 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30046 ?auto_30043 ) ) ( not ( = ?auto_30047 ?auto_30043 ) ) ( not ( = ?auto_30047 ?auto_30046 ) ) ( not ( = ?auto_30049 ?auto_30043 ) ) ( not ( = ?auto_30049 ?auto_30046 ) ) ( not ( = ?auto_30049 ?auto_30047 ) ) ( ON_BOARD ?auto_30055 ?auto_30056 ) ( SUPPORTS ?auto_30055 ?auto_30050 ) ( not ( = ?auto_30049 ?auto_30052 ) ) ( CALIBRATION_TARGET ?auto_30055 ?auto_30052 ) ( not ( = ?auto_30052 ?auto_30043 ) ) ( ON_BOARD ?auto_30057 ?auto_30056 ) ( not ( = ?auto_30055 ?auto_30057 ) ) ( SUPPORTS ?auto_30057 ?auto_30044 ) ( CALIBRATION_TARGET ?auto_30057 ?auto_30052 ) ( not ( = ?auto_30052 ?auto_30046 ) ) ( ON_BOARD ?auto_30051 ?auto_30056 ) ( not ( = ?auto_30057 ?auto_30051 ) ) ( SUPPORTS ?auto_30051 ?auto_30045 ) ( CALIBRATION_TARGET ?auto_30051 ?auto_30052 ) ( not ( = ?auto_30052 ?auto_30047 ) ) ( ON_BOARD ?auto_30054 ?auto_30056 ) ( not ( = ?auto_30051 ?auto_30054 ) ) ( SUPPORTS ?auto_30054 ?auto_30048 ) ( CALIBRATION_TARGET ?auto_30054 ?auto_30052 ) ( POWER_AVAIL ?auto_30056 ) ( POINTING ?auto_30056 ?auto_30053 ) ( not ( = ?auto_30052 ?auto_30053 ) ) ( not ( = ?auto_30047 ?auto_30053 ) ) ( not ( = ?auto_30048 ?auto_30045 ) ) ( not ( = ?auto_30046 ?auto_30053 ) ) ( not ( = ?auto_30048 ?auto_30044 ) ) ( not ( = ?auto_30045 ?auto_30044 ) ) ( not ( = ?auto_30043 ?auto_30053 ) ) ( not ( = ?auto_30057 ?auto_30054 ) ) ( not ( = ?auto_30048 ?auto_30050 ) ) ( not ( = ?auto_30045 ?auto_30050 ) ) ( not ( = ?auto_30044 ?auto_30050 ) ) ( not ( = ?auto_30049 ?auto_30053 ) ) ( not ( = ?auto_30055 ?auto_30051 ) ) ( not ( = ?auto_30055 ?auto_30054 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_30047 ?auto_30048 ?auto_30046 ?auto_30045 ?auto_30049 ?auto_30050 ?auto_30043 ?auto_30044 )
      ( GET-4IMAGE-VERIFY ?auto_30043 ?auto_30044 ?auto_30046 ?auto_30045 ?auto_30047 ?auto_30048 ?auto_30049 ?auto_30050 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30092 - DIRECTION
      ?auto_30093 - MODE
      ?auto_30095 - DIRECTION
      ?auto_30094 - MODE
      ?auto_30096 - DIRECTION
      ?auto_30097 - MODE
      ?auto_30098 - DIRECTION
      ?auto_30099 - MODE
    )
    :vars
    (
      ?auto_30104 - INSTRUMENT
      ?auto_30105 - SATELLITE
      ?auto_30101 - DIRECTION
      ?auto_30106 - INSTRUMENT
      ?auto_30100 - INSTRUMENT
      ?auto_30103 - INSTRUMENT
      ?auto_30102 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30095 ?auto_30092 ) ) ( not ( = ?auto_30096 ?auto_30092 ) ) ( not ( = ?auto_30096 ?auto_30095 ) ) ( not ( = ?auto_30098 ?auto_30092 ) ) ( not ( = ?auto_30098 ?auto_30095 ) ) ( not ( = ?auto_30098 ?auto_30096 ) ) ( ON_BOARD ?auto_30104 ?auto_30105 ) ( SUPPORTS ?auto_30104 ?auto_30097 ) ( not ( = ?auto_30096 ?auto_30101 ) ) ( CALIBRATION_TARGET ?auto_30104 ?auto_30101 ) ( not ( = ?auto_30101 ?auto_30092 ) ) ( ON_BOARD ?auto_30106 ?auto_30105 ) ( not ( = ?auto_30104 ?auto_30106 ) ) ( SUPPORTS ?auto_30106 ?auto_30093 ) ( CALIBRATION_TARGET ?auto_30106 ?auto_30101 ) ( not ( = ?auto_30101 ?auto_30095 ) ) ( ON_BOARD ?auto_30100 ?auto_30105 ) ( not ( = ?auto_30106 ?auto_30100 ) ) ( SUPPORTS ?auto_30100 ?auto_30094 ) ( CALIBRATION_TARGET ?auto_30100 ?auto_30101 ) ( not ( = ?auto_30101 ?auto_30098 ) ) ( ON_BOARD ?auto_30103 ?auto_30105 ) ( not ( = ?auto_30100 ?auto_30103 ) ) ( SUPPORTS ?auto_30103 ?auto_30099 ) ( CALIBRATION_TARGET ?auto_30103 ?auto_30101 ) ( POWER_AVAIL ?auto_30105 ) ( POINTING ?auto_30105 ?auto_30102 ) ( not ( = ?auto_30101 ?auto_30102 ) ) ( not ( = ?auto_30098 ?auto_30102 ) ) ( not ( = ?auto_30099 ?auto_30094 ) ) ( not ( = ?auto_30095 ?auto_30102 ) ) ( not ( = ?auto_30099 ?auto_30093 ) ) ( not ( = ?auto_30094 ?auto_30093 ) ) ( not ( = ?auto_30092 ?auto_30102 ) ) ( not ( = ?auto_30106 ?auto_30103 ) ) ( not ( = ?auto_30099 ?auto_30097 ) ) ( not ( = ?auto_30094 ?auto_30097 ) ) ( not ( = ?auto_30093 ?auto_30097 ) ) ( not ( = ?auto_30096 ?auto_30102 ) ) ( not ( = ?auto_30104 ?auto_30100 ) ) ( not ( = ?auto_30104 ?auto_30103 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_30098 ?auto_30099 ?auto_30095 ?auto_30094 ?auto_30096 ?auto_30097 ?auto_30092 ?auto_30093 )
      ( GET-4IMAGE-VERIFY ?auto_30092 ?auto_30093 ?auto_30095 ?auto_30094 ?auto_30096 ?auto_30097 ?auto_30098 ?auto_30099 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30300 - DIRECTION
      ?auto_30301 - MODE
      ?auto_30303 - DIRECTION
      ?auto_30302 - MODE
      ?auto_30304 - DIRECTION
      ?auto_30305 - MODE
      ?auto_30306 - DIRECTION
      ?auto_30307 - MODE
    )
    :vars
    (
      ?auto_30312 - INSTRUMENT
      ?auto_30313 - SATELLITE
      ?auto_30309 - DIRECTION
      ?auto_30314 - INSTRUMENT
      ?auto_30308 - INSTRUMENT
      ?auto_30311 - INSTRUMENT
      ?auto_30310 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30303 ?auto_30300 ) ) ( not ( = ?auto_30304 ?auto_30300 ) ) ( not ( = ?auto_30304 ?auto_30303 ) ) ( not ( = ?auto_30306 ?auto_30300 ) ) ( not ( = ?auto_30306 ?auto_30303 ) ) ( not ( = ?auto_30306 ?auto_30304 ) ) ( ON_BOARD ?auto_30312 ?auto_30313 ) ( SUPPORTS ?auto_30312 ?auto_30302 ) ( not ( = ?auto_30303 ?auto_30309 ) ) ( CALIBRATION_TARGET ?auto_30312 ?auto_30309 ) ( not ( = ?auto_30309 ?auto_30300 ) ) ( ON_BOARD ?auto_30314 ?auto_30313 ) ( not ( = ?auto_30312 ?auto_30314 ) ) ( SUPPORTS ?auto_30314 ?auto_30301 ) ( CALIBRATION_TARGET ?auto_30314 ?auto_30309 ) ( not ( = ?auto_30309 ?auto_30306 ) ) ( ON_BOARD ?auto_30308 ?auto_30313 ) ( not ( = ?auto_30314 ?auto_30308 ) ) ( SUPPORTS ?auto_30308 ?auto_30307 ) ( CALIBRATION_TARGET ?auto_30308 ?auto_30309 ) ( not ( = ?auto_30309 ?auto_30304 ) ) ( ON_BOARD ?auto_30311 ?auto_30313 ) ( not ( = ?auto_30308 ?auto_30311 ) ) ( SUPPORTS ?auto_30311 ?auto_30305 ) ( CALIBRATION_TARGET ?auto_30311 ?auto_30309 ) ( POWER_AVAIL ?auto_30313 ) ( POINTING ?auto_30313 ?auto_30310 ) ( not ( = ?auto_30309 ?auto_30310 ) ) ( not ( = ?auto_30304 ?auto_30310 ) ) ( not ( = ?auto_30305 ?auto_30307 ) ) ( not ( = ?auto_30306 ?auto_30310 ) ) ( not ( = ?auto_30305 ?auto_30301 ) ) ( not ( = ?auto_30307 ?auto_30301 ) ) ( not ( = ?auto_30300 ?auto_30310 ) ) ( not ( = ?auto_30314 ?auto_30311 ) ) ( not ( = ?auto_30305 ?auto_30302 ) ) ( not ( = ?auto_30307 ?auto_30302 ) ) ( not ( = ?auto_30301 ?auto_30302 ) ) ( not ( = ?auto_30303 ?auto_30310 ) ) ( not ( = ?auto_30312 ?auto_30308 ) ) ( not ( = ?auto_30312 ?auto_30311 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_30304 ?auto_30305 ?auto_30306 ?auto_30307 ?auto_30303 ?auto_30302 ?auto_30300 ?auto_30301 )
      ( GET-4IMAGE-VERIFY ?auto_30300 ?auto_30301 ?auto_30303 ?auto_30302 ?auto_30304 ?auto_30305 ?auto_30306 ?auto_30307 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30349 - DIRECTION
      ?auto_30350 - MODE
      ?auto_30352 - DIRECTION
      ?auto_30351 - MODE
      ?auto_30353 - DIRECTION
      ?auto_30354 - MODE
      ?auto_30355 - DIRECTION
      ?auto_30356 - MODE
    )
    :vars
    (
      ?auto_30361 - INSTRUMENT
      ?auto_30362 - SATELLITE
      ?auto_30358 - DIRECTION
      ?auto_30363 - INSTRUMENT
      ?auto_30357 - INSTRUMENT
      ?auto_30360 - INSTRUMENT
      ?auto_30359 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30352 ?auto_30349 ) ) ( not ( = ?auto_30353 ?auto_30349 ) ) ( not ( = ?auto_30353 ?auto_30352 ) ) ( not ( = ?auto_30355 ?auto_30349 ) ) ( not ( = ?auto_30355 ?auto_30352 ) ) ( not ( = ?auto_30355 ?auto_30353 ) ) ( ON_BOARD ?auto_30361 ?auto_30362 ) ( SUPPORTS ?auto_30361 ?auto_30351 ) ( not ( = ?auto_30352 ?auto_30358 ) ) ( CALIBRATION_TARGET ?auto_30361 ?auto_30358 ) ( not ( = ?auto_30358 ?auto_30349 ) ) ( ON_BOARD ?auto_30363 ?auto_30362 ) ( not ( = ?auto_30361 ?auto_30363 ) ) ( SUPPORTS ?auto_30363 ?auto_30350 ) ( CALIBRATION_TARGET ?auto_30363 ?auto_30358 ) ( not ( = ?auto_30358 ?auto_30353 ) ) ( ON_BOARD ?auto_30357 ?auto_30362 ) ( not ( = ?auto_30363 ?auto_30357 ) ) ( SUPPORTS ?auto_30357 ?auto_30354 ) ( CALIBRATION_TARGET ?auto_30357 ?auto_30358 ) ( not ( = ?auto_30358 ?auto_30355 ) ) ( ON_BOARD ?auto_30360 ?auto_30362 ) ( not ( = ?auto_30357 ?auto_30360 ) ) ( SUPPORTS ?auto_30360 ?auto_30356 ) ( CALIBRATION_TARGET ?auto_30360 ?auto_30358 ) ( POWER_AVAIL ?auto_30362 ) ( POINTING ?auto_30362 ?auto_30359 ) ( not ( = ?auto_30358 ?auto_30359 ) ) ( not ( = ?auto_30355 ?auto_30359 ) ) ( not ( = ?auto_30356 ?auto_30354 ) ) ( not ( = ?auto_30353 ?auto_30359 ) ) ( not ( = ?auto_30356 ?auto_30350 ) ) ( not ( = ?auto_30354 ?auto_30350 ) ) ( not ( = ?auto_30349 ?auto_30359 ) ) ( not ( = ?auto_30363 ?auto_30360 ) ) ( not ( = ?auto_30356 ?auto_30351 ) ) ( not ( = ?auto_30354 ?auto_30351 ) ) ( not ( = ?auto_30350 ?auto_30351 ) ) ( not ( = ?auto_30352 ?auto_30359 ) ) ( not ( = ?auto_30361 ?auto_30357 ) ) ( not ( = ?auto_30361 ?auto_30360 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_30355 ?auto_30356 ?auto_30353 ?auto_30354 ?auto_30352 ?auto_30351 ?auto_30349 ?auto_30350 )
      ( GET-4IMAGE-VERIFY ?auto_30349 ?auto_30350 ?auto_30352 ?auto_30351 ?auto_30353 ?auto_30354 ?auto_30355 ?auto_30356 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30665 - DIRECTION
      ?auto_30666 - MODE
      ?auto_30668 - DIRECTION
      ?auto_30667 - MODE
      ?auto_30669 - DIRECTION
      ?auto_30670 - MODE
      ?auto_30671 - DIRECTION
      ?auto_30672 - MODE
    )
    :vars
    (
      ?auto_30677 - INSTRUMENT
      ?auto_30678 - SATELLITE
      ?auto_30674 - DIRECTION
      ?auto_30679 - INSTRUMENT
      ?auto_30673 - INSTRUMENT
      ?auto_30676 - INSTRUMENT
      ?auto_30675 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30668 ?auto_30665 ) ) ( not ( = ?auto_30669 ?auto_30665 ) ) ( not ( = ?auto_30669 ?auto_30668 ) ) ( not ( = ?auto_30671 ?auto_30665 ) ) ( not ( = ?auto_30671 ?auto_30668 ) ) ( not ( = ?auto_30671 ?auto_30669 ) ) ( ON_BOARD ?auto_30677 ?auto_30678 ) ( SUPPORTS ?auto_30677 ?auto_30666 ) ( not ( = ?auto_30665 ?auto_30674 ) ) ( CALIBRATION_TARGET ?auto_30677 ?auto_30674 ) ( not ( = ?auto_30674 ?auto_30671 ) ) ( ON_BOARD ?auto_30679 ?auto_30678 ) ( not ( = ?auto_30677 ?auto_30679 ) ) ( SUPPORTS ?auto_30679 ?auto_30672 ) ( CALIBRATION_TARGET ?auto_30679 ?auto_30674 ) ( not ( = ?auto_30674 ?auto_30669 ) ) ( ON_BOARD ?auto_30673 ?auto_30678 ) ( not ( = ?auto_30679 ?auto_30673 ) ) ( SUPPORTS ?auto_30673 ?auto_30670 ) ( CALIBRATION_TARGET ?auto_30673 ?auto_30674 ) ( not ( = ?auto_30674 ?auto_30668 ) ) ( ON_BOARD ?auto_30676 ?auto_30678 ) ( not ( = ?auto_30673 ?auto_30676 ) ) ( SUPPORTS ?auto_30676 ?auto_30667 ) ( CALIBRATION_TARGET ?auto_30676 ?auto_30674 ) ( POWER_AVAIL ?auto_30678 ) ( POINTING ?auto_30678 ?auto_30675 ) ( not ( = ?auto_30674 ?auto_30675 ) ) ( not ( = ?auto_30668 ?auto_30675 ) ) ( not ( = ?auto_30667 ?auto_30670 ) ) ( not ( = ?auto_30669 ?auto_30675 ) ) ( not ( = ?auto_30667 ?auto_30672 ) ) ( not ( = ?auto_30670 ?auto_30672 ) ) ( not ( = ?auto_30671 ?auto_30675 ) ) ( not ( = ?auto_30679 ?auto_30676 ) ) ( not ( = ?auto_30667 ?auto_30666 ) ) ( not ( = ?auto_30670 ?auto_30666 ) ) ( not ( = ?auto_30672 ?auto_30666 ) ) ( not ( = ?auto_30665 ?auto_30675 ) ) ( not ( = ?auto_30677 ?auto_30673 ) ) ( not ( = ?auto_30677 ?auto_30676 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_30668 ?auto_30667 ?auto_30669 ?auto_30670 ?auto_30665 ?auto_30666 ?auto_30671 ?auto_30672 )
      ( GET-4IMAGE-VERIFY ?auto_30665 ?auto_30666 ?auto_30668 ?auto_30667 ?auto_30669 ?auto_30670 ?auto_30671 ?auto_30672 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30714 - DIRECTION
      ?auto_30715 - MODE
      ?auto_30717 - DIRECTION
      ?auto_30716 - MODE
      ?auto_30718 - DIRECTION
      ?auto_30719 - MODE
      ?auto_30720 - DIRECTION
      ?auto_30721 - MODE
    )
    :vars
    (
      ?auto_30726 - INSTRUMENT
      ?auto_30727 - SATELLITE
      ?auto_30723 - DIRECTION
      ?auto_30728 - INSTRUMENT
      ?auto_30722 - INSTRUMENT
      ?auto_30725 - INSTRUMENT
      ?auto_30724 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30717 ?auto_30714 ) ) ( not ( = ?auto_30718 ?auto_30714 ) ) ( not ( = ?auto_30718 ?auto_30717 ) ) ( not ( = ?auto_30720 ?auto_30714 ) ) ( not ( = ?auto_30720 ?auto_30717 ) ) ( not ( = ?auto_30720 ?auto_30718 ) ) ( ON_BOARD ?auto_30726 ?auto_30727 ) ( SUPPORTS ?auto_30726 ?auto_30715 ) ( not ( = ?auto_30714 ?auto_30723 ) ) ( CALIBRATION_TARGET ?auto_30726 ?auto_30723 ) ( not ( = ?auto_30723 ?auto_30718 ) ) ( ON_BOARD ?auto_30728 ?auto_30727 ) ( not ( = ?auto_30726 ?auto_30728 ) ) ( SUPPORTS ?auto_30728 ?auto_30719 ) ( CALIBRATION_TARGET ?auto_30728 ?auto_30723 ) ( not ( = ?auto_30723 ?auto_30720 ) ) ( ON_BOARD ?auto_30722 ?auto_30727 ) ( not ( = ?auto_30728 ?auto_30722 ) ) ( SUPPORTS ?auto_30722 ?auto_30721 ) ( CALIBRATION_TARGET ?auto_30722 ?auto_30723 ) ( not ( = ?auto_30723 ?auto_30717 ) ) ( ON_BOARD ?auto_30725 ?auto_30727 ) ( not ( = ?auto_30722 ?auto_30725 ) ) ( SUPPORTS ?auto_30725 ?auto_30716 ) ( CALIBRATION_TARGET ?auto_30725 ?auto_30723 ) ( POWER_AVAIL ?auto_30727 ) ( POINTING ?auto_30727 ?auto_30724 ) ( not ( = ?auto_30723 ?auto_30724 ) ) ( not ( = ?auto_30717 ?auto_30724 ) ) ( not ( = ?auto_30716 ?auto_30721 ) ) ( not ( = ?auto_30720 ?auto_30724 ) ) ( not ( = ?auto_30716 ?auto_30719 ) ) ( not ( = ?auto_30721 ?auto_30719 ) ) ( not ( = ?auto_30718 ?auto_30724 ) ) ( not ( = ?auto_30728 ?auto_30725 ) ) ( not ( = ?auto_30716 ?auto_30715 ) ) ( not ( = ?auto_30721 ?auto_30715 ) ) ( not ( = ?auto_30719 ?auto_30715 ) ) ( not ( = ?auto_30714 ?auto_30724 ) ) ( not ( = ?auto_30726 ?auto_30722 ) ) ( not ( = ?auto_30726 ?auto_30725 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_30717 ?auto_30716 ?auto_30720 ?auto_30721 ?auto_30714 ?auto_30715 ?auto_30718 ?auto_30719 )
      ( GET-4IMAGE-VERIFY ?auto_30714 ?auto_30715 ?auto_30717 ?auto_30716 ?auto_30718 ?auto_30719 ?auto_30720 ?auto_30721 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30869 - DIRECTION
      ?auto_30870 - MODE
      ?auto_30872 - DIRECTION
      ?auto_30871 - MODE
      ?auto_30873 - DIRECTION
      ?auto_30874 - MODE
      ?auto_30875 - DIRECTION
      ?auto_30876 - MODE
    )
    :vars
    (
      ?auto_30881 - INSTRUMENT
      ?auto_30882 - SATELLITE
      ?auto_30878 - DIRECTION
      ?auto_30883 - INSTRUMENT
      ?auto_30877 - INSTRUMENT
      ?auto_30880 - INSTRUMENT
      ?auto_30879 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30872 ?auto_30869 ) ) ( not ( = ?auto_30873 ?auto_30869 ) ) ( not ( = ?auto_30873 ?auto_30872 ) ) ( not ( = ?auto_30875 ?auto_30869 ) ) ( not ( = ?auto_30875 ?auto_30872 ) ) ( not ( = ?auto_30875 ?auto_30873 ) ) ( ON_BOARD ?auto_30881 ?auto_30882 ) ( SUPPORTS ?auto_30881 ?auto_30870 ) ( not ( = ?auto_30869 ?auto_30878 ) ) ( CALIBRATION_TARGET ?auto_30881 ?auto_30878 ) ( not ( = ?auto_30878 ?auto_30875 ) ) ( ON_BOARD ?auto_30883 ?auto_30882 ) ( not ( = ?auto_30881 ?auto_30883 ) ) ( SUPPORTS ?auto_30883 ?auto_30876 ) ( CALIBRATION_TARGET ?auto_30883 ?auto_30878 ) ( not ( = ?auto_30878 ?auto_30872 ) ) ( ON_BOARD ?auto_30877 ?auto_30882 ) ( not ( = ?auto_30883 ?auto_30877 ) ) ( SUPPORTS ?auto_30877 ?auto_30871 ) ( CALIBRATION_TARGET ?auto_30877 ?auto_30878 ) ( not ( = ?auto_30878 ?auto_30873 ) ) ( ON_BOARD ?auto_30880 ?auto_30882 ) ( not ( = ?auto_30877 ?auto_30880 ) ) ( SUPPORTS ?auto_30880 ?auto_30874 ) ( CALIBRATION_TARGET ?auto_30880 ?auto_30878 ) ( POWER_AVAIL ?auto_30882 ) ( POINTING ?auto_30882 ?auto_30879 ) ( not ( = ?auto_30878 ?auto_30879 ) ) ( not ( = ?auto_30873 ?auto_30879 ) ) ( not ( = ?auto_30874 ?auto_30871 ) ) ( not ( = ?auto_30872 ?auto_30879 ) ) ( not ( = ?auto_30874 ?auto_30876 ) ) ( not ( = ?auto_30871 ?auto_30876 ) ) ( not ( = ?auto_30875 ?auto_30879 ) ) ( not ( = ?auto_30883 ?auto_30880 ) ) ( not ( = ?auto_30874 ?auto_30870 ) ) ( not ( = ?auto_30871 ?auto_30870 ) ) ( not ( = ?auto_30876 ?auto_30870 ) ) ( not ( = ?auto_30869 ?auto_30879 ) ) ( not ( = ?auto_30881 ?auto_30877 ) ) ( not ( = ?auto_30881 ?auto_30880 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_30873 ?auto_30874 ?auto_30872 ?auto_30871 ?auto_30869 ?auto_30870 ?auto_30875 ?auto_30876 )
      ( GET-4IMAGE-VERIFY ?auto_30869 ?auto_30870 ?auto_30872 ?auto_30871 ?auto_30873 ?auto_30874 ?auto_30875 ?auto_30876 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_30973 - DIRECTION
      ?auto_30974 - MODE
      ?auto_30976 - DIRECTION
      ?auto_30975 - MODE
      ?auto_30977 - DIRECTION
      ?auto_30978 - MODE
      ?auto_30979 - DIRECTION
      ?auto_30980 - MODE
    )
    :vars
    (
      ?auto_30985 - INSTRUMENT
      ?auto_30986 - SATELLITE
      ?auto_30982 - DIRECTION
      ?auto_30987 - INSTRUMENT
      ?auto_30981 - INSTRUMENT
      ?auto_30984 - INSTRUMENT
      ?auto_30983 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30976 ?auto_30973 ) ) ( not ( = ?auto_30977 ?auto_30973 ) ) ( not ( = ?auto_30977 ?auto_30976 ) ) ( not ( = ?auto_30979 ?auto_30973 ) ) ( not ( = ?auto_30979 ?auto_30976 ) ) ( not ( = ?auto_30979 ?auto_30977 ) ) ( ON_BOARD ?auto_30985 ?auto_30986 ) ( SUPPORTS ?auto_30985 ?auto_30974 ) ( not ( = ?auto_30973 ?auto_30982 ) ) ( CALIBRATION_TARGET ?auto_30985 ?auto_30982 ) ( not ( = ?auto_30982 ?auto_30977 ) ) ( ON_BOARD ?auto_30987 ?auto_30986 ) ( not ( = ?auto_30985 ?auto_30987 ) ) ( SUPPORTS ?auto_30987 ?auto_30978 ) ( CALIBRATION_TARGET ?auto_30987 ?auto_30982 ) ( not ( = ?auto_30982 ?auto_30976 ) ) ( ON_BOARD ?auto_30981 ?auto_30986 ) ( not ( = ?auto_30987 ?auto_30981 ) ) ( SUPPORTS ?auto_30981 ?auto_30975 ) ( CALIBRATION_TARGET ?auto_30981 ?auto_30982 ) ( not ( = ?auto_30982 ?auto_30979 ) ) ( ON_BOARD ?auto_30984 ?auto_30986 ) ( not ( = ?auto_30981 ?auto_30984 ) ) ( SUPPORTS ?auto_30984 ?auto_30980 ) ( CALIBRATION_TARGET ?auto_30984 ?auto_30982 ) ( POWER_AVAIL ?auto_30986 ) ( POINTING ?auto_30986 ?auto_30983 ) ( not ( = ?auto_30982 ?auto_30983 ) ) ( not ( = ?auto_30979 ?auto_30983 ) ) ( not ( = ?auto_30980 ?auto_30975 ) ) ( not ( = ?auto_30976 ?auto_30983 ) ) ( not ( = ?auto_30980 ?auto_30978 ) ) ( not ( = ?auto_30975 ?auto_30978 ) ) ( not ( = ?auto_30977 ?auto_30983 ) ) ( not ( = ?auto_30987 ?auto_30984 ) ) ( not ( = ?auto_30980 ?auto_30974 ) ) ( not ( = ?auto_30975 ?auto_30974 ) ) ( not ( = ?auto_30978 ?auto_30974 ) ) ( not ( = ?auto_30973 ?auto_30983 ) ) ( not ( = ?auto_30985 ?auto_30981 ) ) ( not ( = ?auto_30985 ?auto_30984 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_30979 ?auto_30980 ?auto_30976 ?auto_30975 ?auto_30973 ?auto_30974 ?auto_30977 ?auto_30978 )
      ( GET-4IMAGE-VERIFY ?auto_30973 ?auto_30974 ?auto_30976 ?auto_30975 ?auto_30977 ?auto_30978 ?auto_30979 ?auto_30980 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_31128 - DIRECTION
      ?auto_31129 - MODE
      ?auto_31131 - DIRECTION
      ?auto_31130 - MODE
      ?auto_31132 - DIRECTION
      ?auto_31133 - MODE
      ?auto_31134 - DIRECTION
      ?auto_31135 - MODE
    )
    :vars
    (
      ?auto_31140 - INSTRUMENT
      ?auto_31141 - SATELLITE
      ?auto_31137 - DIRECTION
      ?auto_31142 - INSTRUMENT
      ?auto_31136 - INSTRUMENT
      ?auto_31139 - INSTRUMENT
      ?auto_31138 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_31131 ?auto_31128 ) ) ( not ( = ?auto_31132 ?auto_31128 ) ) ( not ( = ?auto_31132 ?auto_31131 ) ) ( not ( = ?auto_31134 ?auto_31128 ) ) ( not ( = ?auto_31134 ?auto_31131 ) ) ( not ( = ?auto_31134 ?auto_31132 ) ) ( ON_BOARD ?auto_31140 ?auto_31141 ) ( SUPPORTS ?auto_31140 ?auto_31129 ) ( not ( = ?auto_31128 ?auto_31137 ) ) ( CALIBRATION_TARGET ?auto_31140 ?auto_31137 ) ( not ( = ?auto_31137 ?auto_31131 ) ) ( ON_BOARD ?auto_31142 ?auto_31141 ) ( not ( = ?auto_31140 ?auto_31142 ) ) ( SUPPORTS ?auto_31142 ?auto_31130 ) ( CALIBRATION_TARGET ?auto_31142 ?auto_31137 ) ( not ( = ?auto_31137 ?auto_31134 ) ) ( ON_BOARD ?auto_31136 ?auto_31141 ) ( not ( = ?auto_31142 ?auto_31136 ) ) ( SUPPORTS ?auto_31136 ?auto_31135 ) ( CALIBRATION_TARGET ?auto_31136 ?auto_31137 ) ( not ( = ?auto_31137 ?auto_31132 ) ) ( ON_BOARD ?auto_31139 ?auto_31141 ) ( not ( = ?auto_31136 ?auto_31139 ) ) ( SUPPORTS ?auto_31139 ?auto_31133 ) ( CALIBRATION_TARGET ?auto_31139 ?auto_31137 ) ( POWER_AVAIL ?auto_31141 ) ( POINTING ?auto_31141 ?auto_31138 ) ( not ( = ?auto_31137 ?auto_31138 ) ) ( not ( = ?auto_31132 ?auto_31138 ) ) ( not ( = ?auto_31133 ?auto_31135 ) ) ( not ( = ?auto_31134 ?auto_31138 ) ) ( not ( = ?auto_31133 ?auto_31130 ) ) ( not ( = ?auto_31135 ?auto_31130 ) ) ( not ( = ?auto_31131 ?auto_31138 ) ) ( not ( = ?auto_31142 ?auto_31139 ) ) ( not ( = ?auto_31133 ?auto_31129 ) ) ( not ( = ?auto_31135 ?auto_31129 ) ) ( not ( = ?auto_31130 ?auto_31129 ) ) ( not ( = ?auto_31128 ?auto_31138 ) ) ( not ( = ?auto_31140 ?auto_31136 ) ) ( not ( = ?auto_31140 ?auto_31139 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_31132 ?auto_31133 ?auto_31134 ?auto_31135 ?auto_31128 ?auto_31129 ?auto_31131 ?auto_31130 )
      ( GET-4IMAGE-VERIFY ?auto_31128 ?auto_31129 ?auto_31131 ?auto_31130 ?auto_31132 ?auto_31133 ?auto_31134 ?auto_31135 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_31177 - DIRECTION
      ?auto_31178 - MODE
      ?auto_31180 - DIRECTION
      ?auto_31179 - MODE
      ?auto_31181 - DIRECTION
      ?auto_31182 - MODE
      ?auto_31183 - DIRECTION
      ?auto_31184 - MODE
    )
    :vars
    (
      ?auto_31189 - INSTRUMENT
      ?auto_31190 - SATELLITE
      ?auto_31186 - DIRECTION
      ?auto_31191 - INSTRUMENT
      ?auto_31185 - INSTRUMENT
      ?auto_31188 - INSTRUMENT
      ?auto_31187 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_31180 ?auto_31177 ) ) ( not ( = ?auto_31181 ?auto_31177 ) ) ( not ( = ?auto_31181 ?auto_31180 ) ) ( not ( = ?auto_31183 ?auto_31177 ) ) ( not ( = ?auto_31183 ?auto_31180 ) ) ( not ( = ?auto_31183 ?auto_31181 ) ) ( ON_BOARD ?auto_31189 ?auto_31190 ) ( SUPPORTS ?auto_31189 ?auto_31178 ) ( not ( = ?auto_31177 ?auto_31186 ) ) ( CALIBRATION_TARGET ?auto_31189 ?auto_31186 ) ( not ( = ?auto_31186 ?auto_31180 ) ) ( ON_BOARD ?auto_31191 ?auto_31190 ) ( not ( = ?auto_31189 ?auto_31191 ) ) ( SUPPORTS ?auto_31191 ?auto_31179 ) ( CALIBRATION_TARGET ?auto_31191 ?auto_31186 ) ( not ( = ?auto_31186 ?auto_31181 ) ) ( ON_BOARD ?auto_31185 ?auto_31190 ) ( not ( = ?auto_31191 ?auto_31185 ) ) ( SUPPORTS ?auto_31185 ?auto_31182 ) ( CALIBRATION_TARGET ?auto_31185 ?auto_31186 ) ( not ( = ?auto_31186 ?auto_31183 ) ) ( ON_BOARD ?auto_31188 ?auto_31190 ) ( not ( = ?auto_31185 ?auto_31188 ) ) ( SUPPORTS ?auto_31188 ?auto_31184 ) ( CALIBRATION_TARGET ?auto_31188 ?auto_31186 ) ( POWER_AVAIL ?auto_31190 ) ( POINTING ?auto_31190 ?auto_31187 ) ( not ( = ?auto_31186 ?auto_31187 ) ) ( not ( = ?auto_31183 ?auto_31187 ) ) ( not ( = ?auto_31184 ?auto_31182 ) ) ( not ( = ?auto_31181 ?auto_31187 ) ) ( not ( = ?auto_31184 ?auto_31179 ) ) ( not ( = ?auto_31182 ?auto_31179 ) ) ( not ( = ?auto_31180 ?auto_31187 ) ) ( not ( = ?auto_31191 ?auto_31188 ) ) ( not ( = ?auto_31184 ?auto_31178 ) ) ( not ( = ?auto_31182 ?auto_31178 ) ) ( not ( = ?auto_31179 ?auto_31178 ) ) ( not ( = ?auto_31177 ?auto_31187 ) ) ( not ( = ?auto_31189 ?auto_31185 ) ) ( not ( = ?auto_31189 ?auto_31188 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_31183 ?auto_31184 ?auto_31181 ?auto_31182 ?auto_31177 ?auto_31178 ?auto_31180 ?auto_31179 )
      ( GET-4IMAGE-VERIFY ?auto_31177 ?auto_31178 ?auto_31180 ?auto_31179 ?auto_31181 ?auto_31182 ?auto_31183 ?auto_31184 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_31683 - DIRECTION
      ?auto_31684 - MODE
    )
    :vars
    (
      ?auto_31685 - INSTRUMENT
      ?auto_31686 - SATELLITE
      ?auto_31687 - DIRECTION
      ?auto_31688 - DIRECTION
      ?auto_31689 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_31685 ?auto_31686 ) ( SUPPORTS ?auto_31685 ?auto_31684 ) ( not ( = ?auto_31683 ?auto_31687 ) ) ( CALIBRATION_TARGET ?auto_31685 ?auto_31687 ) ( POINTING ?auto_31686 ?auto_31688 ) ( not ( = ?auto_31687 ?auto_31688 ) ) ( ON_BOARD ?auto_31689 ?auto_31686 ) ( POWER_ON ?auto_31689 ) ( not ( = ?auto_31683 ?auto_31688 ) ) ( not ( = ?auto_31685 ?auto_31689 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_31689 ?auto_31686 )
      ( !TURN_TO ?auto_31686 ?auto_31687 ?auto_31688 )
      ( !SWITCH_ON ?auto_31685 ?auto_31686 )
      ( !CALIBRATE ?auto_31686 ?auto_31685 ?auto_31687 )
      ( !TURN_TO ?auto_31686 ?auto_31683 ?auto_31687 )
      ( !TAKE_IMAGE ?auto_31686 ?auto_31683 ?auto_31685 ?auto_31684 )
      ( GET-1IMAGE-VERIFY ?auto_31683 ?auto_31684 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_54460 - DIRECTION
      ?auto_54461 - MODE
      ?auto_54463 - DIRECTION
      ?auto_54462 - MODE
      ?auto_54464 - DIRECTION
      ?auto_54465 - MODE
      ?auto_54466 - DIRECTION
      ?auto_54467 - MODE
      ?auto_54468 - DIRECTION
      ?auto_54469 - MODE
    )
    :vars
    (
      ?auto_54473 - INSTRUMENT
      ?auto_54470 - SATELLITE
      ?auto_54471 - DIRECTION
      ?auto_54472 - INSTRUMENT
      ?auto_54477 - INSTRUMENT
      ?auto_54474 - INSTRUMENT
      ?auto_54476 - INSTRUMENT
      ?auto_54475 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_54463 ?auto_54460 ) ) ( not ( = ?auto_54464 ?auto_54460 ) ) ( not ( = ?auto_54464 ?auto_54463 ) ) ( not ( = ?auto_54466 ?auto_54460 ) ) ( not ( = ?auto_54466 ?auto_54463 ) ) ( not ( = ?auto_54466 ?auto_54464 ) ) ( not ( = ?auto_54468 ?auto_54460 ) ) ( not ( = ?auto_54468 ?auto_54463 ) ) ( not ( = ?auto_54468 ?auto_54464 ) ) ( not ( = ?auto_54468 ?auto_54466 ) ) ( ON_BOARD ?auto_54473 ?auto_54470 ) ( SUPPORTS ?auto_54473 ?auto_54469 ) ( not ( = ?auto_54468 ?auto_54471 ) ) ( CALIBRATION_TARGET ?auto_54473 ?auto_54471 ) ( not ( = ?auto_54471 ?auto_54466 ) ) ( ON_BOARD ?auto_54472 ?auto_54470 ) ( not ( = ?auto_54473 ?auto_54472 ) ) ( SUPPORTS ?auto_54472 ?auto_54467 ) ( CALIBRATION_TARGET ?auto_54472 ?auto_54471 ) ( not ( = ?auto_54471 ?auto_54464 ) ) ( ON_BOARD ?auto_54477 ?auto_54470 ) ( not ( = ?auto_54472 ?auto_54477 ) ) ( SUPPORTS ?auto_54477 ?auto_54465 ) ( CALIBRATION_TARGET ?auto_54477 ?auto_54471 ) ( not ( = ?auto_54471 ?auto_54463 ) ) ( ON_BOARD ?auto_54474 ?auto_54470 ) ( not ( = ?auto_54477 ?auto_54474 ) ) ( SUPPORTS ?auto_54474 ?auto_54462 ) ( CALIBRATION_TARGET ?auto_54474 ?auto_54471 ) ( not ( = ?auto_54471 ?auto_54460 ) ) ( ON_BOARD ?auto_54476 ?auto_54470 ) ( not ( = ?auto_54474 ?auto_54476 ) ) ( SUPPORTS ?auto_54476 ?auto_54461 ) ( CALIBRATION_TARGET ?auto_54476 ?auto_54471 ) ( POWER_AVAIL ?auto_54470 ) ( POINTING ?auto_54470 ?auto_54475 ) ( not ( = ?auto_54471 ?auto_54475 ) ) ( not ( = ?auto_54460 ?auto_54475 ) ) ( not ( = ?auto_54461 ?auto_54462 ) ) ( not ( = ?auto_54463 ?auto_54475 ) ) ( not ( = ?auto_54461 ?auto_54465 ) ) ( not ( = ?auto_54462 ?auto_54465 ) ) ( not ( = ?auto_54464 ?auto_54475 ) ) ( not ( = ?auto_54477 ?auto_54476 ) ) ( not ( = ?auto_54461 ?auto_54467 ) ) ( not ( = ?auto_54462 ?auto_54467 ) ) ( not ( = ?auto_54465 ?auto_54467 ) ) ( not ( = ?auto_54466 ?auto_54475 ) ) ( not ( = ?auto_54472 ?auto_54474 ) ) ( not ( = ?auto_54472 ?auto_54476 ) ) ( not ( = ?auto_54461 ?auto_54469 ) ) ( not ( = ?auto_54462 ?auto_54469 ) ) ( not ( = ?auto_54465 ?auto_54469 ) ) ( not ( = ?auto_54467 ?auto_54469 ) ) ( not ( = ?auto_54468 ?auto_54475 ) ) ( not ( = ?auto_54473 ?auto_54477 ) ) ( not ( = ?auto_54473 ?auto_54474 ) ) ( not ( = ?auto_54473 ?auto_54476 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_54460 ?auto_54461 ?auto_54463 ?auto_54462 ?auto_54466 ?auto_54467 ?auto_54464 ?auto_54465 )
      ( GET-1IMAGE ?auto_54468 ?auto_54469 )
      ( GET-5IMAGE-VERIFY ?auto_54460 ?auto_54461 ?auto_54463 ?auto_54462 ?auto_54464 ?auto_54465 ?auto_54466 ?auto_54467 ?auto_54468 ?auto_54469 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_54538 - DIRECTION
      ?auto_54539 - MODE
      ?auto_54541 - DIRECTION
      ?auto_54540 - MODE
      ?auto_54542 - DIRECTION
      ?auto_54543 - MODE
      ?auto_54544 - DIRECTION
      ?auto_54545 - MODE
      ?auto_54546 - DIRECTION
      ?auto_54547 - MODE
    )
    :vars
    (
      ?auto_54550 - INSTRUMENT
      ?auto_54554 - SATELLITE
      ?auto_54548 - DIRECTION
      ?auto_54551 - INSTRUMENT
      ?auto_54555 - INSTRUMENT
      ?auto_54553 - INSTRUMENT
      ?auto_54552 - INSTRUMENT
      ?auto_54549 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_54541 ?auto_54538 ) ) ( not ( = ?auto_54542 ?auto_54538 ) ) ( not ( = ?auto_54542 ?auto_54541 ) ) ( not ( = ?auto_54544 ?auto_54538 ) ) ( not ( = ?auto_54544 ?auto_54541 ) ) ( not ( = ?auto_54544 ?auto_54542 ) ) ( not ( = ?auto_54546 ?auto_54538 ) ) ( not ( = ?auto_54546 ?auto_54541 ) ) ( not ( = ?auto_54546 ?auto_54542 ) ) ( not ( = ?auto_54546 ?auto_54544 ) ) ( ON_BOARD ?auto_54550 ?auto_54554 ) ( SUPPORTS ?auto_54550 ?auto_54545 ) ( not ( = ?auto_54544 ?auto_54548 ) ) ( CALIBRATION_TARGET ?auto_54550 ?auto_54548 ) ( not ( = ?auto_54548 ?auto_54546 ) ) ( ON_BOARD ?auto_54551 ?auto_54554 ) ( not ( = ?auto_54550 ?auto_54551 ) ) ( SUPPORTS ?auto_54551 ?auto_54547 ) ( CALIBRATION_TARGET ?auto_54551 ?auto_54548 ) ( not ( = ?auto_54548 ?auto_54542 ) ) ( ON_BOARD ?auto_54555 ?auto_54554 ) ( not ( = ?auto_54551 ?auto_54555 ) ) ( SUPPORTS ?auto_54555 ?auto_54543 ) ( CALIBRATION_TARGET ?auto_54555 ?auto_54548 ) ( not ( = ?auto_54548 ?auto_54541 ) ) ( ON_BOARD ?auto_54553 ?auto_54554 ) ( not ( = ?auto_54555 ?auto_54553 ) ) ( SUPPORTS ?auto_54553 ?auto_54540 ) ( CALIBRATION_TARGET ?auto_54553 ?auto_54548 ) ( not ( = ?auto_54548 ?auto_54538 ) ) ( ON_BOARD ?auto_54552 ?auto_54554 ) ( not ( = ?auto_54553 ?auto_54552 ) ) ( SUPPORTS ?auto_54552 ?auto_54539 ) ( CALIBRATION_TARGET ?auto_54552 ?auto_54548 ) ( POWER_AVAIL ?auto_54554 ) ( POINTING ?auto_54554 ?auto_54549 ) ( not ( = ?auto_54548 ?auto_54549 ) ) ( not ( = ?auto_54538 ?auto_54549 ) ) ( not ( = ?auto_54539 ?auto_54540 ) ) ( not ( = ?auto_54541 ?auto_54549 ) ) ( not ( = ?auto_54539 ?auto_54543 ) ) ( not ( = ?auto_54540 ?auto_54543 ) ) ( not ( = ?auto_54542 ?auto_54549 ) ) ( not ( = ?auto_54555 ?auto_54552 ) ) ( not ( = ?auto_54539 ?auto_54547 ) ) ( not ( = ?auto_54540 ?auto_54547 ) ) ( not ( = ?auto_54543 ?auto_54547 ) ) ( not ( = ?auto_54546 ?auto_54549 ) ) ( not ( = ?auto_54551 ?auto_54553 ) ) ( not ( = ?auto_54551 ?auto_54552 ) ) ( not ( = ?auto_54539 ?auto_54545 ) ) ( not ( = ?auto_54540 ?auto_54545 ) ) ( not ( = ?auto_54543 ?auto_54545 ) ) ( not ( = ?auto_54547 ?auto_54545 ) ) ( not ( = ?auto_54544 ?auto_54549 ) ) ( not ( = ?auto_54550 ?auto_54555 ) ) ( not ( = ?auto_54550 ?auto_54553 ) ) ( not ( = ?auto_54550 ?auto_54552 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_54538 ?auto_54539 ?auto_54541 ?auto_54540 ?auto_54542 ?auto_54543 ?auto_54546 ?auto_54547 ?auto_54544 ?auto_54545 )
      ( GET-5IMAGE-VERIFY ?auto_54538 ?auto_54539 ?auto_54541 ?auto_54540 ?auto_54542 ?auto_54543 ?auto_54544 ?auto_54545 ?auto_54546 ?auto_54547 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_54616 - DIRECTION
      ?auto_54617 - MODE
      ?auto_54619 - DIRECTION
      ?auto_54618 - MODE
      ?auto_54620 - DIRECTION
      ?auto_54621 - MODE
      ?auto_54622 - DIRECTION
      ?auto_54623 - MODE
      ?auto_54624 - DIRECTION
      ?auto_54625 - MODE
    )
    :vars
    (
      ?auto_54627 - INSTRUMENT
      ?auto_54631 - SATELLITE
      ?auto_54633 - DIRECTION
      ?auto_54626 - INSTRUMENT
      ?auto_54632 - INSTRUMENT
      ?auto_54628 - INSTRUMENT
      ?auto_54629 - INSTRUMENT
      ?auto_54630 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_54619 ?auto_54616 ) ) ( not ( = ?auto_54620 ?auto_54616 ) ) ( not ( = ?auto_54620 ?auto_54619 ) ) ( not ( = ?auto_54622 ?auto_54616 ) ) ( not ( = ?auto_54622 ?auto_54619 ) ) ( not ( = ?auto_54622 ?auto_54620 ) ) ( not ( = ?auto_54624 ?auto_54616 ) ) ( not ( = ?auto_54624 ?auto_54619 ) ) ( not ( = ?auto_54624 ?auto_54620 ) ) ( not ( = ?auto_54624 ?auto_54622 ) ) ( ON_BOARD ?auto_54627 ?auto_54631 ) ( SUPPORTS ?auto_54627 ?auto_54625 ) ( not ( = ?auto_54624 ?auto_54633 ) ) ( CALIBRATION_TARGET ?auto_54627 ?auto_54633 ) ( not ( = ?auto_54633 ?auto_54620 ) ) ( ON_BOARD ?auto_54626 ?auto_54631 ) ( not ( = ?auto_54627 ?auto_54626 ) ) ( SUPPORTS ?auto_54626 ?auto_54621 ) ( CALIBRATION_TARGET ?auto_54626 ?auto_54633 ) ( not ( = ?auto_54633 ?auto_54622 ) ) ( ON_BOARD ?auto_54632 ?auto_54631 ) ( not ( = ?auto_54626 ?auto_54632 ) ) ( SUPPORTS ?auto_54632 ?auto_54623 ) ( CALIBRATION_TARGET ?auto_54632 ?auto_54633 ) ( not ( = ?auto_54633 ?auto_54619 ) ) ( ON_BOARD ?auto_54628 ?auto_54631 ) ( not ( = ?auto_54632 ?auto_54628 ) ) ( SUPPORTS ?auto_54628 ?auto_54618 ) ( CALIBRATION_TARGET ?auto_54628 ?auto_54633 ) ( not ( = ?auto_54633 ?auto_54616 ) ) ( ON_BOARD ?auto_54629 ?auto_54631 ) ( not ( = ?auto_54628 ?auto_54629 ) ) ( SUPPORTS ?auto_54629 ?auto_54617 ) ( CALIBRATION_TARGET ?auto_54629 ?auto_54633 ) ( POWER_AVAIL ?auto_54631 ) ( POINTING ?auto_54631 ?auto_54630 ) ( not ( = ?auto_54633 ?auto_54630 ) ) ( not ( = ?auto_54616 ?auto_54630 ) ) ( not ( = ?auto_54617 ?auto_54618 ) ) ( not ( = ?auto_54619 ?auto_54630 ) ) ( not ( = ?auto_54617 ?auto_54623 ) ) ( not ( = ?auto_54618 ?auto_54623 ) ) ( not ( = ?auto_54622 ?auto_54630 ) ) ( not ( = ?auto_54632 ?auto_54629 ) ) ( not ( = ?auto_54617 ?auto_54621 ) ) ( not ( = ?auto_54618 ?auto_54621 ) ) ( not ( = ?auto_54623 ?auto_54621 ) ) ( not ( = ?auto_54620 ?auto_54630 ) ) ( not ( = ?auto_54626 ?auto_54628 ) ) ( not ( = ?auto_54626 ?auto_54629 ) ) ( not ( = ?auto_54617 ?auto_54625 ) ) ( not ( = ?auto_54618 ?auto_54625 ) ) ( not ( = ?auto_54623 ?auto_54625 ) ) ( not ( = ?auto_54621 ?auto_54625 ) ) ( not ( = ?auto_54624 ?auto_54630 ) ) ( not ( = ?auto_54627 ?auto_54632 ) ) ( not ( = ?auto_54627 ?auto_54628 ) ) ( not ( = ?auto_54627 ?auto_54629 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_54616 ?auto_54617 ?auto_54619 ?auto_54618 ?auto_54622 ?auto_54623 ?auto_54624 ?auto_54625 ?auto_54620 ?auto_54621 )
      ( GET-5IMAGE-VERIFY ?auto_54616 ?auto_54617 ?auto_54619 ?auto_54618 ?auto_54620 ?auto_54621 ?auto_54622 ?auto_54623 ?auto_54624 ?auto_54625 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_54694 - DIRECTION
      ?auto_54695 - MODE
      ?auto_54697 - DIRECTION
      ?auto_54696 - MODE
      ?auto_54698 - DIRECTION
      ?auto_54699 - MODE
      ?auto_54700 - DIRECTION
      ?auto_54701 - MODE
      ?auto_54702 - DIRECTION
      ?auto_54703 - MODE
    )
    :vars
    (
      ?auto_54705 - INSTRUMENT
      ?auto_54709 - SATELLITE
      ?auto_54711 - DIRECTION
      ?auto_54704 - INSTRUMENT
      ?auto_54710 - INSTRUMENT
      ?auto_54706 - INSTRUMENT
      ?auto_54707 - INSTRUMENT
      ?auto_54708 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_54697 ?auto_54694 ) ) ( not ( = ?auto_54698 ?auto_54694 ) ) ( not ( = ?auto_54698 ?auto_54697 ) ) ( not ( = ?auto_54700 ?auto_54694 ) ) ( not ( = ?auto_54700 ?auto_54697 ) ) ( not ( = ?auto_54700 ?auto_54698 ) ) ( not ( = ?auto_54702 ?auto_54694 ) ) ( not ( = ?auto_54702 ?auto_54697 ) ) ( not ( = ?auto_54702 ?auto_54698 ) ) ( not ( = ?auto_54702 ?auto_54700 ) ) ( ON_BOARD ?auto_54705 ?auto_54709 ) ( SUPPORTS ?auto_54705 ?auto_54701 ) ( not ( = ?auto_54700 ?auto_54711 ) ) ( CALIBRATION_TARGET ?auto_54705 ?auto_54711 ) ( not ( = ?auto_54711 ?auto_54698 ) ) ( ON_BOARD ?auto_54704 ?auto_54709 ) ( not ( = ?auto_54705 ?auto_54704 ) ) ( SUPPORTS ?auto_54704 ?auto_54699 ) ( CALIBRATION_TARGET ?auto_54704 ?auto_54711 ) ( not ( = ?auto_54711 ?auto_54702 ) ) ( ON_BOARD ?auto_54710 ?auto_54709 ) ( not ( = ?auto_54704 ?auto_54710 ) ) ( SUPPORTS ?auto_54710 ?auto_54703 ) ( CALIBRATION_TARGET ?auto_54710 ?auto_54711 ) ( not ( = ?auto_54711 ?auto_54697 ) ) ( ON_BOARD ?auto_54706 ?auto_54709 ) ( not ( = ?auto_54710 ?auto_54706 ) ) ( SUPPORTS ?auto_54706 ?auto_54696 ) ( CALIBRATION_TARGET ?auto_54706 ?auto_54711 ) ( not ( = ?auto_54711 ?auto_54694 ) ) ( ON_BOARD ?auto_54707 ?auto_54709 ) ( not ( = ?auto_54706 ?auto_54707 ) ) ( SUPPORTS ?auto_54707 ?auto_54695 ) ( CALIBRATION_TARGET ?auto_54707 ?auto_54711 ) ( POWER_AVAIL ?auto_54709 ) ( POINTING ?auto_54709 ?auto_54708 ) ( not ( = ?auto_54711 ?auto_54708 ) ) ( not ( = ?auto_54694 ?auto_54708 ) ) ( not ( = ?auto_54695 ?auto_54696 ) ) ( not ( = ?auto_54697 ?auto_54708 ) ) ( not ( = ?auto_54695 ?auto_54703 ) ) ( not ( = ?auto_54696 ?auto_54703 ) ) ( not ( = ?auto_54702 ?auto_54708 ) ) ( not ( = ?auto_54710 ?auto_54707 ) ) ( not ( = ?auto_54695 ?auto_54699 ) ) ( not ( = ?auto_54696 ?auto_54699 ) ) ( not ( = ?auto_54703 ?auto_54699 ) ) ( not ( = ?auto_54698 ?auto_54708 ) ) ( not ( = ?auto_54704 ?auto_54706 ) ) ( not ( = ?auto_54704 ?auto_54707 ) ) ( not ( = ?auto_54695 ?auto_54701 ) ) ( not ( = ?auto_54696 ?auto_54701 ) ) ( not ( = ?auto_54703 ?auto_54701 ) ) ( not ( = ?auto_54699 ?auto_54701 ) ) ( not ( = ?auto_54700 ?auto_54708 ) ) ( not ( = ?auto_54705 ?auto_54710 ) ) ( not ( = ?auto_54705 ?auto_54706 ) ) ( not ( = ?auto_54705 ?auto_54707 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_54694 ?auto_54695 ?auto_54697 ?auto_54696 ?auto_54702 ?auto_54703 ?auto_54700 ?auto_54701 ?auto_54698 ?auto_54699 )
      ( GET-5IMAGE-VERIFY ?auto_54694 ?auto_54695 ?auto_54697 ?auto_54696 ?auto_54698 ?auto_54699 ?auto_54700 ?auto_54701 ?auto_54702 ?auto_54703 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_55024 - DIRECTION
      ?auto_55025 - MODE
      ?auto_55027 - DIRECTION
      ?auto_55026 - MODE
      ?auto_55028 - DIRECTION
      ?auto_55029 - MODE
      ?auto_55030 - DIRECTION
      ?auto_55031 - MODE
      ?auto_55032 - DIRECTION
      ?auto_55033 - MODE
    )
    :vars
    (
      ?auto_55035 - INSTRUMENT
      ?auto_55039 - SATELLITE
      ?auto_55041 - DIRECTION
      ?auto_55034 - INSTRUMENT
      ?auto_55040 - INSTRUMENT
      ?auto_55036 - INSTRUMENT
      ?auto_55037 - INSTRUMENT
      ?auto_55038 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_55027 ?auto_55024 ) ) ( not ( = ?auto_55028 ?auto_55024 ) ) ( not ( = ?auto_55028 ?auto_55027 ) ) ( not ( = ?auto_55030 ?auto_55024 ) ) ( not ( = ?auto_55030 ?auto_55027 ) ) ( not ( = ?auto_55030 ?auto_55028 ) ) ( not ( = ?auto_55032 ?auto_55024 ) ) ( not ( = ?auto_55032 ?auto_55027 ) ) ( not ( = ?auto_55032 ?auto_55028 ) ) ( not ( = ?auto_55032 ?auto_55030 ) ) ( ON_BOARD ?auto_55035 ?auto_55039 ) ( SUPPORTS ?auto_55035 ?auto_55029 ) ( not ( = ?auto_55028 ?auto_55041 ) ) ( CALIBRATION_TARGET ?auto_55035 ?auto_55041 ) ( not ( = ?auto_55041 ?auto_55032 ) ) ( ON_BOARD ?auto_55034 ?auto_55039 ) ( not ( = ?auto_55035 ?auto_55034 ) ) ( SUPPORTS ?auto_55034 ?auto_55033 ) ( CALIBRATION_TARGET ?auto_55034 ?auto_55041 ) ( not ( = ?auto_55041 ?auto_55030 ) ) ( ON_BOARD ?auto_55040 ?auto_55039 ) ( not ( = ?auto_55034 ?auto_55040 ) ) ( SUPPORTS ?auto_55040 ?auto_55031 ) ( CALIBRATION_TARGET ?auto_55040 ?auto_55041 ) ( not ( = ?auto_55041 ?auto_55027 ) ) ( ON_BOARD ?auto_55036 ?auto_55039 ) ( not ( = ?auto_55040 ?auto_55036 ) ) ( SUPPORTS ?auto_55036 ?auto_55026 ) ( CALIBRATION_TARGET ?auto_55036 ?auto_55041 ) ( not ( = ?auto_55041 ?auto_55024 ) ) ( ON_BOARD ?auto_55037 ?auto_55039 ) ( not ( = ?auto_55036 ?auto_55037 ) ) ( SUPPORTS ?auto_55037 ?auto_55025 ) ( CALIBRATION_TARGET ?auto_55037 ?auto_55041 ) ( POWER_AVAIL ?auto_55039 ) ( POINTING ?auto_55039 ?auto_55038 ) ( not ( = ?auto_55041 ?auto_55038 ) ) ( not ( = ?auto_55024 ?auto_55038 ) ) ( not ( = ?auto_55025 ?auto_55026 ) ) ( not ( = ?auto_55027 ?auto_55038 ) ) ( not ( = ?auto_55025 ?auto_55031 ) ) ( not ( = ?auto_55026 ?auto_55031 ) ) ( not ( = ?auto_55030 ?auto_55038 ) ) ( not ( = ?auto_55040 ?auto_55037 ) ) ( not ( = ?auto_55025 ?auto_55033 ) ) ( not ( = ?auto_55026 ?auto_55033 ) ) ( not ( = ?auto_55031 ?auto_55033 ) ) ( not ( = ?auto_55032 ?auto_55038 ) ) ( not ( = ?auto_55034 ?auto_55036 ) ) ( not ( = ?auto_55034 ?auto_55037 ) ) ( not ( = ?auto_55025 ?auto_55029 ) ) ( not ( = ?auto_55026 ?auto_55029 ) ) ( not ( = ?auto_55031 ?auto_55029 ) ) ( not ( = ?auto_55033 ?auto_55029 ) ) ( not ( = ?auto_55028 ?auto_55038 ) ) ( not ( = ?auto_55035 ?auto_55040 ) ) ( not ( = ?auto_55035 ?auto_55036 ) ) ( not ( = ?auto_55035 ?auto_55037 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_55024 ?auto_55025 ?auto_55027 ?auto_55026 ?auto_55030 ?auto_55031 ?auto_55028 ?auto_55029 ?auto_55032 ?auto_55033 )
      ( GET-5IMAGE-VERIFY ?auto_55024 ?auto_55025 ?auto_55027 ?auto_55026 ?auto_55028 ?auto_55029 ?auto_55030 ?auto_55031 ?auto_55032 ?auto_55033 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_55102 - DIRECTION
      ?auto_55103 - MODE
      ?auto_55105 - DIRECTION
      ?auto_55104 - MODE
      ?auto_55106 - DIRECTION
      ?auto_55107 - MODE
      ?auto_55108 - DIRECTION
      ?auto_55109 - MODE
      ?auto_55110 - DIRECTION
      ?auto_55111 - MODE
    )
    :vars
    (
      ?auto_55113 - INSTRUMENT
      ?auto_55117 - SATELLITE
      ?auto_55119 - DIRECTION
      ?auto_55112 - INSTRUMENT
      ?auto_55118 - INSTRUMENT
      ?auto_55114 - INSTRUMENT
      ?auto_55115 - INSTRUMENT
      ?auto_55116 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_55105 ?auto_55102 ) ) ( not ( = ?auto_55106 ?auto_55102 ) ) ( not ( = ?auto_55106 ?auto_55105 ) ) ( not ( = ?auto_55108 ?auto_55102 ) ) ( not ( = ?auto_55108 ?auto_55105 ) ) ( not ( = ?auto_55108 ?auto_55106 ) ) ( not ( = ?auto_55110 ?auto_55102 ) ) ( not ( = ?auto_55110 ?auto_55105 ) ) ( not ( = ?auto_55110 ?auto_55106 ) ) ( not ( = ?auto_55110 ?auto_55108 ) ) ( ON_BOARD ?auto_55113 ?auto_55117 ) ( SUPPORTS ?auto_55113 ?auto_55107 ) ( not ( = ?auto_55106 ?auto_55119 ) ) ( CALIBRATION_TARGET ?auto_55113 ?auto_55119 ) ( not ( = ?auto_55119 ?auto_55108 ) ) ( ON_BOARD ?auto_55112 ?auto_55117 ) ( not ( = ?auto_55113 ?auto_55112 ) ) ( SUPPORTS ?auto_55112 ?auto_55109 ) ( CALIBRATION_TARGET ?auto_55112 ?auto_55119 ) ( not ( = ?auto_55119 ?auto_55110 ) ) ( ON_BOARD ?auto_55118 ?auto_55117 ) ( not ( = ?auto_55112 ?auto_55118 ) ) ( SUPPORTS ?auto_55118 ?auto_55111 ) ( CALIBRATION_TARGET ?auto_55118 ?auto_55119 ) ( not ( = ?auto_55119 ?auto_55105 ) ) ( ON_BOARD ?auto_55114 ?auto_55117 ) ( not ( = ?auto_55118 ?auto_55114 ) ) ( SUPPORTS ?auto_55114 ?auto_55104 ) ( CALIBRATION_TARGET ?auto_55114 ?auto_55119 ) ( not ( = ?auto_55119 ?auto_55102 ) ) ( ON_BOARD ?auto_55115 ?auto_55117 ) ( not ( = ?auto_55114 ?auto_55115 ) ) ( SUPPORTS ?auto_55115 ?auto_55103 ) ( CALIBRATION_TARGET ?auto_55115 ?auto_55119 ) ( POWER_AVAIL ?auto_55117 ) ( POINTING ?auto_55117 ?auto_55116 ) ( not ( = ?auto_55119 ?auto_55116 ) ) ( not ( = ?auto_55102 ?auto_55116 ) ) ( not ( = ?auto_55103 ?auto_55104 ) ) ( not ( = ?auto_55105 ?auto_55116 ) ) ( not ( = ?auto_55103 ?auto_55111 ) ) ( not ( = ?auto_55104 ?auto_55111 ) ) ( not ( = ?auto_55110 ?auto_55116 ) ) ( not ( = ?auto_55118 ?auto_55115 ) ) ( not ( = ?auto_55103 ?auto_55109 ) ) ( not ( = ?auto_55104 ?auto_55109 ) ) ( not ( = ?auto_55111 ?auto_55109 ) ) ( not ( = ?auto_55108 ?auto_55116 ) ) ( not ( = ?auto_55112 ?auto_55114 ) ) ( not ( = ?auto_55112 ?auto_55115 ) ) ( not ( = ?auto_55103 ?auto_55107 ) ) ( not ( = ?auto_55104 ?auto_55107 ) ) ( not ( = ?auto_55111 ?auto_55107 ) ) ( not ( = ?auto_55109 ?auto_55107 ) ) ( not ( = ?auto_55106 ?auto_55116 ) ) ( not ( = ?auto_55113 ?auto_55118 ) ) ( not ( = ?auto_55113 ?auto_55114 ) ) ( not ( = ?auto_55113 ?auto_55115 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_55102 ?auto_55103 ?auto_55105 ?auto_55104 ?auto_55110 ?auto_55111 ?auto_55106 ?auto_55107 ?auto_55108 ?auto_55109 )
      ( GET-5IMAGE-VERIFY ?auto_55102 ?auto_55103 ?auto_55105 ?auto_55104 ?auto_55106 ?auto_55107 ?auto_55108 ?auto_55109 ?auto_55110 ?auto_55111 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_55516 - DIRECTION
      ?auto_55517 - MODE
      ?auto_55519 - DIRECTION
      ?auto_55518 - MODE
      ?auto_55520 - DIRECTION
      ?auto_55521 - MODE
      ?auto_55522 - DIRECTION
      ?auto_55523 - MODE
      ?auto_55524 - DIRECTION
      ?auto_55525 - MODE
    )
    :vars
    (
      ?auto_55527 - INSTRUMENT
      ?auto_55531 - SATELLITE
      ?auto_55533 - DIRECTION
      ?auto_55526 - INSTRUMENT
      ?auto_55532 - INSTRUMENT
      ?auto_55528 - INSTRUMENT
      ?auto_55529 - INSTRUMENT
      ?auto_55530 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_55519 ?auto_55516 ) ) ( not ( = ?auto_55520 ?auto_55516 ) ) ( not ( = ?auto_55520 ?auto_55519 ) ) ( not ( = ?auto_55522 ?auto_55516 ) ) ( not ( = ?auto_55522 ?auto_55519 ) ) ( not ( = ?auto_55522 ?auto_55520 ) ) ( not ( = ?auto_55524 ?auto_55516 ) ) ( not ( = ?auto_55524 ?auto_55519 ) ) ( not ( = ?auto_55524 ?auto_55520 ) ) ( not ( = ?auto_55524 ?auto_55522 ) ) ( ON_BOARD ?auto_55527 ?auto_55531 ) ( SUPPORTS ?auto_55527 ?auto_55525 ) ( not ( = ?auto_55524 ?auto_55533 ) ) ( CALIBRATION_TARGET ?auto_55527 ?auto_55533 ) ( not ( = ?auto_55533 ?auto_55522 ) ) ( ON_BOARD ?auto_55526 ?auto_55531 ) ( not ( = ?auto_55527 ?auto_55526 ) ) ( SUPPORTS ?auto_55526 ?auto_55523 ) ( CALIBRATION_TARGET ?auto_55526 ?auto_55533 ) ( not ( = ?auto_55533 ?auto_55519 ) ) ( ON_BOARD ?auto_55532 ?auto_55531 ) ( not ( = ?auto_55526 ?auto_55532 ) ) ( SUPPORTS ?auto_55532 ?auto_55518 ) ( CALIBRATION_TARGET ?auto_55532 ?auto_55533 ) ( not ( = ?auto_55533 ?auto_55520 ) ) ( ON_BOARD ?auto_55528 ?auto_55531 ) ( not ( = ?auto_55532 ?auto_55528 ) ) ( SUPPORTS ?auto_55528 ?auto_55521 ) ( CALIBRATION_TARGET ?auto_55528 ?auto_55533 ) ( not ( = ?auto_55533 ?auto_55516 ) ) ( ON_BOARD ?auto_55529 ?auto_55531 ) ( not ( = ?auto_55528 ?auto_55529 ) ) ( SUPPORTS ?auto_55529 ?auto_55517 ) ( CALIBRATION_TARGET ?auto_55529 ?auto_55533 ) ( POWER_AVAIL ?auto_55531 ) ( POINTING ?auto_55531 ?auto_55530 ) ( not ( = ?auto_55533 ?auto_55530 ) ) ( not ( = ?auto_55516 ?auto_55530 ) ) ( not ( = ?auto_55517 ?auto_55521 ) ) ( not ( = ?auto_55520 ?auto_55530 ) ) ( not ( = ?auto_55517 ?auto_55518 ) ) ( not ( = ?auto_55521 ?auto_55518 ) ) ( not ( = ?auto_55519 ?auto_55530 ) ) ( not ( = ?auto_55532 ?auto_55529 ) ) ( not ( = ?auto_55517 ?auto_55523 ) ) ( not ( = ?auto_55521 ?auto_55523 ) ) ( not ( = ?auto_55518 ?auto_55523 ) ) ( not ( = ?auto_55522 ?auto_55530 ) ) ( not ( = ?auto_55526 ?auto_55528 ) ) ( not ( = ?auto_55526 ?auto_55529 ) ) ( not ( = ?auto_55517 ?auto_55525 ) ) ( not ( = ?auto_55521 ?auto_55525 ) ) ( not ( = ?auto_55518 ?auto_55525 ) ) ( not ( = ?auto_55523 ?auto_55525 ) ) ( not ( = ?auto_55524 ?auto_55530 ) ) ( not ( = ?auto_55527 ?auto_55532 ) ) ( not ( = ?auto_55527 ?auto_55528 ) ) ( not ( = ?auto_55527 ?auto_55529 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_55516 ?auto_55517 ?auto_55520 ?auto_55521 ?auto_55519 ?auto_55518 ?auto_55524 ?auto_55525 ?auto_55522 ?auto_55523 )
      ( GET-5IMAGE-VERIFY ?auto_55516 ?auto_55517 ?auto_55519 ?auto_55518 ?auto_55520 ?auto_55521 ?auto_55522 ?auto_55523 ?auto_55524 ?auto_55525 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_55594 - DIRECTION
      ?auto_55595 - MODE
      ?auto_55597 - DIRECTION
      ?auto_55596 - MODE
      ?auto_55598 - DIRECTION
      ?auto_55599 - MODE
      ?auto_55600 - DIRECTION
      ?auto_55601 - MODE
      ?auto_55602 - DIRECTION
      ?auto_55603 - MODE
    )
    :vars
    (
      ?auto_55605 - INSTRUMENT
      ?auto_55609 - SATELLITE
      ?auto_55611 - DIRECTION
      ?auto_55604 - INSTRUMENT
      ?auto_55610 - INSTRUMENT
      ?auto_55606 - INSTRUMENT
      ?auto_55607 - INSTRUMENT
      ?auto_55608 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_55597 ?auto_55594 ) ) ( not ( = ?auto_55598 ?auto_55594 ) ) ( not ( = ?auto_55598 ?auto_55597 ) ) ( not ( = ?auto_55600 ?auto_55594 ) ) ( not ( = ?auto_55600 ?auto_55597 ) ) ( not ( = ?auto_55600 ?auto_55598 ) ) ( not ( = ?auto_55602 ?auto_55594 ) ) ( not ( = ?auto_55602 ?auto_55597 ) ) ( not ( = ?auto_55602 ?auto_55598 ) ) ( not ( = ?auto_55602 ?auto_55600 ) ) ( ON_BOARD ?auto_55605 ?auto_55609 ) ( SUPPORTS ?auto_55605 ?auto_55601 ) ( not ( = ?auto_55600 ?auto_55611 ) ) ( CALIBRATION_TARGET ?auto_55605 ?auto_55611 ) ( not ( = ?auto_55611 ?auto_55602 ) ) ( ON_BOARD ?auto_55604 ?auto_55609 ) ( not ( = ?auto_55605 ?auto_55604 ) ) ( SUPPORTS ?auto_55604 ?auto_55603 ) ( CALIBRATION_TARGET ?auto_55604 ?auto_55611 ) ( not ( = ?auto_55611 ?auto_55597 ) ) ( ON_BOARD ?auto_55610 ?auto_55609 ) ( not ( = ?auto_55604 ?auto_55610 ) ) ( SUPPORTS ?auto_55610 ?auto_55596 ) ( CALIBRATION_TARGET ?auto_55610 ?auto_55611 ) ( not ( = ?auto_55611 ?auto_55598 ) ) ( ON_BOARD ?auto_55606 ?auto_55609 ) ( not ( = ?auto_55610 ?auto_55606 ) ) ( SUPPORTS ?auto_55606 ?auto_55599 ) ( CALIBRATION_TARGET ?auto_55606 ?auto_55611 ) ( not ( = ?auto_55611 ?auto_55594 ) ) ( ON_BOARD ?auto_55607 ?auto_55609 ) ( not ( = ?auto_55606 ?auto_55607 ) ) ( SUPPORTS ?auto_55607 ?auto_55595 ) ( CALIBRATION_TARGET ?auto_55607 ?auto_55611 ) ( POWER_AVAIL ?auto_55609 ) ( POINTING ?auto_55609 ?auto_55608 ) ( not ( = ?auto_55611 ?auto_55608 ) ) ( not ( = ?auto_55594 ?auto_55608 ) ) ( not ( = ?auto_55595 ?auto_55599 ) ) ( not ( = ?auto_55598 ?auto_55608 ) ) ( not ( = ?auto_55595 ?auto_55596 ) ) ( not ( = ?auto_55599 ?auto_55596 ) ) ( not ( = ?auto_55597 ?auto_55608 ) ) ( not ( = ?auto_55610 ?auto_55607 ) ) ( not ( = ?auto_55595 ?auto_55603 ) ) ( not ( = ?auto_55599 ?auto_55603 ) ) ( not ( = ?auto_55596 ?auto_55603 ) ) ( not ( = ?auto_55602 ?auto_55608 ) ) ( not ( = ?auto_55604 ?auto_55606 ) ) ( not ( = ?auto_55604 ?auto_55607 ) ) ( not ( = ?auto_55595 ?auto_55601 ) ) ( not ( = ?auto_55599 ?auto_55601 ) ) ( not ( = ?auto_55596 ?auto_55601 ) ) ( not ( = ?auto_55603 ?auto_55601 ) ) ( not ( = ?auto_55600 ?auto_55608 ) ) ( not ( = ?auto_55605 ?auto_55610 ) ) ( not ( = ?auto_55605 ?auto_55606 ) ) ( not ( = ?auto_55605 ?auto_55607 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_55594 ?auto_55595 ?auto_55598 ?auto_55599 ?auto_55597 ?auto_55596 ?auto_55600 ?auto_55601 ?auto_55602 ?auto_55603 )
      ( GET-5IMAGE-VERIFY ?auto_55594 ?auto_55595 ?auto_55597 ?auto_55596 ?auto_55598 ?auto_55599 ?auto_55600 ?auto_55601 ?auto_55602 ?auto_55603 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_55842 - DIRECTION
      ?auto_55843 - MODE
      ?auto_55845 - DIRECTION
      ?auto_55844 - MODE
      ?auto_55846 - DIRECTION
      ?auto_55847 - MODE
      ?auto_55848 - DIRECTION
      ?auto_55849 - MODE
      ?auto_55850 - DIRECTION
      ?auto_55851 - MODE
    )
    :vars
    (
      ?auto_55853 - INSTRUMENT
      ?auto_55857 - SATELLITE
      ?auto_55859 - DIRECTION
      ?auto_55852 - INSTRUMENT
      ?auto_55858 - INSTRUMENT
      ?auto_55854 - INSTRUMENT
      ?auto_55855 - INSTRUMENT
      ?auto_55856 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_55845 ?auto_55842 ) ) ( not ( = ?auto_55846 ?auto_55842 ) ) ( not ( = ?auto_55846 ?auto_55845 ) ) ( not ( = ?auto_55848 ?auto_55842 ) ) ( not ( = ?auto_55848 ?auto_55845 ) ) ( not ( = ?auto_55848 ?auto_55846 ) ) ( not ( = ?auto_55850 ?auto_55842 ) ) ( not ( = ?auto_55850 ?auto_55845 ) ) ( not ( = ?auto_55850 ?auto_55846 ) ) ( not ( = ?auto_55850 ?auto_55848 ) ) ( ON_BOARD ?auto_55853 ?auto_55857 ) ( SUPPORTS ?auto_55853 ?auto_55851 ) ( not ( = ?auto_55850 ?auto_55859 ) ) ( CALIBRATION_TARGET ?auto_55853 ?auto_55859 ) ( not ( = ?auto_55859 ?auto_55846 ) ) ( ON_BOARD ?auto_55852 ?auto_55857 ) ( not ( = ?auto_55853 ?auto_55852 ) ) ( SUPPORTS ?auto_55852 ?auto_55847 ) ( CALIBRATION_TARGET ?auto_55852 ?auto_55859 ) ( not ( = ?auto_55859 ?auto_55845 ) ) ( ON_BOARD ?auto_55858 ?auto_55857 ) ( not ( = ?auto_55852 ?auto_55858 ) ) ( SUPPORTS ?auto_55858 ?auto_55844 ) ( CALIBRATION_TARGET ?auto_55858 ?auto_55859 ) ( not ( = ?auto_55859 ?auto_55848 ) ) ( ON_BOARD ?auto_55854 ?auto_55857 ) ( not ( = ?auto_55858 ?auto_55854 ) ) ( SUPPORTS ?auto_55854 ?auto_55849 ) ( CALIBRATION_TARGET ?auto_55854 ?auto_55859 ) ( not ( = ?auto_55859 ?auto_55842 ) ) ( ON_BOARD ?auto_55855 ?auto_55857 ) ( not ( = ?auto_55854 ?auto_55855 ) ) ( SUPPORTS ?auto_55855 ?auto_55843 ) ( CALIBRATION_TARGET ?auto_55855 ?auto_55859 ) ( POWER_AVAIL ?auto_55857 ) ( POINTING ?auto_55857 ?auto_55856 ) ( not ( = ?auto_55859 ?auto_55856 ) ) ( not ( = ?auto_55842 ?auto_55856 ) ) ( not ( = ?auto_55843 ?auto_55849 ) ) ( not ( = ?auto_55848 ?auto_55856 ) ) ( not ( = ?auto_55843 ?auto_55844 ) ) ( not ( = ?auto_55849 ?auto_55844 ) ) ( not ( = ?auto_55845 ?auto_55856 ) ) ( not ( = ?auto_55858 ?auto_55855 ) ) ( not ( = ?auto_55843 ?auto_55847 ) ) ( not ( = ?auto_55849 ?auto_55847 ) ) ( not ( = ?auto_55844 ?auto_55847 ) ) ( not ( = ?auto_55846 ?auto_55856 ) ) ( not ( = ?auto_55852 ?auto_55854 ) ) ( not ( = ?auto_55852 ?auto_55855 ) ) ( not ( = ?auto_55843 ?auto_55851 ) ) ( not ( = ?auto_55849 ?auto_55851 ) ) ( not ( = ?auto_55844 ?auto_55851 ) ) ( not ( = ?auto_55847 ?auto_55851 ) ) ( not ( = ?auto_55850 ?auto_55856 ) ) ( not ( = ?auto_55853 ?auto_55858 ) ) ( not ( = ?auto_55853 ?auto_55854 ) ) ( not ( = ?auto_55853 ?auto_55855 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_55842 ?auto_55843 ?auto_55848 ?auto_55849 ?auto_55845 ?auto_55844 ?auto_55850 ?auto_55851 ?auto_55846 ?auto_55847 )
      ( GET-5IMAGE-VERIFY ?auto_55842 ?auto_55843 ?auto_55845 ?auto_55844 ?auto_55846 ?auto_55847 ?auto_55848 ?auto_55849 ?auto_55850 ?auto_55851 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_55920 - DIRECTION
      ?auto_55921 - MODE
      ?auto_55923 - DIRECTION
      ?auto_55922 - MODE
      ?auto_55924 - DIRECTION
      ?auto_55925 - MODE
      ?auto_55926 - DIRECTION
      ?auto_55927 - MODE
      ?auto_55928 - DIRECTION
      ?auto_55929 - MODE
    )
    :vars
    (
      ?auto_55931 - INSTRUMENT
      ?auto_55935 - SATELLITE
      ?auto_55937 - DIRECTION
      ?auto_55930 - INSTRUMENT
      ?auto_55936 - INSTRUMENT
      ?auto_55932 - INSTRUMENT
      ?auto_55933 - INSTRUMENT
      ?auto_55934 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_55923 ?auto_55920 ) ) ( not ( = ?auto_55924 ?auto_55920 ) ) ( not ( = ?auto_55924 ?auto_55923 ) ) ( not ( = ?auto_55926 ?auto_55920 ) ) ( not ( = ?auto_55926 ?auto_55923 ) ) ( not ( = ?auto_55926 ?auto_55924 ) ) ( not ( = ?auto_55928 ?auto_55920 ) ) ( not ( = ?auto_55928 ?auto_55923 ) ) ( not ( = ?auto_55928 ?auto_55924 ) ) ( not ( = ?auto_55928 ?auto_55926 ) ) ( ON_BOARD ?auto_55931 ?auto_55935 ) ( SUPPORTS ?auto_55931 ?auto_55927 ) ( not ( = ?auto_55926 ?auto_55937 ) ) ( CALIBRATION_TARGET ?auto_55931 ?auto_55937 ) ( not ( = ?auto_55937 ?auto_55924 ) ) ( ON_BOARD ?auto_55930 ?auto_55935 ) ( not ( = ?auto_55931 ?auto_55930 ) ) ( SUPPORTS ?auto_55930 ?auto_55925 ) ( CALIBRATION_TARGET ?auto_55930 ?auto_55937 ) ( not ( = ?auto_55937 ?auto_55923 ) ) ( ON_BOARD ?auto_55936 ?auto_55935 ) ( not ( = ?auto_55930 ?auto_55936 ) ) ( SUPPORTS ?auto_55936 ?auto_55922 ) ( CALIBRATION_TARGET ?auto_55936 ?auto_55937 ) ( not ( = ?auto_55937 ?auto_55928 ) ) ( ON_BOARD ?auto_55932 ?auto_55935 ) ( not ( = ?auto_55936 ?auto_55932 ) ) ( SUPPORTS ?auto_55932 ?auto_55929 ) ( CALIBRATION_TARGET ?auto_55932 ?auto_55937 ) ( not ( = ?auto_55937 ?auto_55920 ) ) ( ON_BOARD ?auto_55933 ?auto_55935 ) ( not ( = ?auto_55932 ?auto_55933 ) ) ( SUPPORTS ?auto_55933 ?auto_55921 ) ( CALIBRATION_TARGET ?auto_55933 ?auto_55937 ) ( POWER_AVAIL ?auto_55935 ) ( POINTING ?auto_55935 ?auto_55934 ) ( not ( = ?auto_55937 ?auto_55934 ) ) ( not ( = ?auto_55920 ?auto_55934 ) ) ( not ( = ?auto_55921 ?auto_55929 ) ) ( not ( = ?auto_55928 ?auto_55934 ) ) ( not ( = ?auto_55921 ?auto_55922 ) ) ( not ( = ?auto_55929 ?auto_55922 ) ) ( not ( = ?auto_55923 ?auto_55934 ) ) ( not ( = ?auto_55936 ?auto_55933 ) ) ( not ( = ?auto_55921 ?auto_55925 ) ) ( not ( = ?auto_55929 ?auto_55925 ) ) ( not ( = ?auto_55922 ?auto_55925 ) ) ( not ( = ?auto_55924 ?auto_55934 ) ) ( not ( = ?auto_55930 ?auto_55932 ) ) ( not ( = ?auto_55930 ?auto_55933 ) ) ( not ( = ?auto_55921 ?auto_55927 ) ) ( not ( = ?auto_55929 ?auto_55927 ) ) ( not ( = ?auto_55922 ?auto_55927 ) ) ( not ( = ?auto_55925 ?auto_55927 ) ) ( not ( = ?auto_55926 ?auto_55934 ) ) ( not ( = ?auto_55931 ?auto_55936 ) ) ( not ( = ?auto_55931 ?auto_55932 ) ) ( not ( = ?auto_55931 ?auto_55933 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_55920 ?auto_55921 ?auto_55928 ?auto_55929 ?auto_55923 ?auto_55922 ?auto_55926 ?auto_55927 ?auto_55924 ?auto_55925 )
      ( GET-5IMAGE-VERIFY ?auto_55920 ?auto_55921 ?auto_55923 ?auto_55922 ?auto_55924 ?auto_55925 ?auto_55926 ?auto_55927 ?auto_55928 ?auto_55929 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_56164 - DIRECTION
      ?auto_56165 - MODE
      ?auto_56167 - DIRECTION
      ?auto_56166 - MODE
      ?auto_56168 - DIRECTION
      ?auto_56169 - MODE
      ?auto_56170 - DIRECTION
      ?auto_56171 - MODE
      ?auto_56172 - DIRECTION
      ?auto_56173 - MODE
    )
    :vars
    (
      ?auto_56175 - INSTRUMENT
      ?auto_56179 - SATELLITE
      ?auto_56181 - DIRECTION
      ?auto_56174 - INSTRUMENT
      ?auto_56180 - INSTRUMENT
      ?auto_56176 - INSTRUMENT
      ?auto_56177 - INSTRUMENT
      ?auto_56178 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_56167 ?auto_56164 ) ) ( not ( = ?auto_56168 ?auto_56164 ) ) ( not ( = ?auto_56168 ?auto_56167 ) ) ( not ( = ?auto_56170 ?auto_56164 ) ) ( not ( = ?auto_56170 ?auto_56167 ) ) ( not ( = ?auto_56170 ?auto_56168 ) ) ( not ( = ?auto_56172 ?auto_56164 ) ) ( not ( = ?auto_56172 ?auto_56167 ) ) ( not ( = ?auto_56172 ?auto_56168 ) ) ( not ( = ?auto_56172 ?auto_56170 ) ) ( ON_BOARD ?auto_56175 ?auto_56179 ) ( SUPPORTS ?auto_56175 ?auto_56169 ) ( not ( = ?auto_56168 ?auto_56181 ) ) ( CALIBRATION_TARGET ?auto_56175 ?auto_56181 ) ( not ( = ?auto_56181 ?auto_56172 ) ) ( ON_BOARD ?auto_56174 ?auto_56179 ) ( not ( = ?auto_56175 ?auto_56174 ) ) ( SUPPORTS ?auto_56174 ?auto_56173 ) ( CALIBRATION_TARGET ?auto_56174 ?auto_56181 ) ( not ( = ?auto_56181 ?auto_56167 ) ) ( ON_BOARD ?auto_56180 ?auto_56179 ) ( not ( = ?auto_56174 ?auto_56180 ) ) ( SUPPORTS ?auto_56180 ?auto_56166 ) ( CALIBRATION_TARGET ?auto_56180 ?auto_56181 ) ( not ( = ?auto_56181 ?auto_56170 ) ) ( ON_BOARD ?auto_56176 ?auto_56179 ) ( not ( = ?auto_56180 ?auto_56176 ) ) ( SUPPORTS ?auto_56176 ?auto_56171 ) ( CALIBRATION_TARGET ?auto_56176 ?auto_56181 ) ( not ( = ?auto_56181 ?auto_56164 ) ) ( ON_BOARD ?auto_56177 ?auto_56179 ) ( not ( = ?auto_56176 ?auto_56177 ) ) ( SUPPORTS ?auto_56177 ?auto_56165 ) ( CALIBRATION_TARGET ?auto_56177 ?auto_56181 ) ( POWER_AVAIL ?auto_56179 ) ( POINTING ?auto_56179 ?auto_56178 ) ( not ( = ?auto_56181 ?auto_56178 ) ) ( not ( = ?auto_56164 ?auto_56178 ) ) ( not ( = ?auto_56165 ?auto_56171 ) ) ( not ( = ?auto_56170 ?auto_56178 ) ) ( not ( = ?auto_56165 ?auto_56166 ) ) ( not ( = ?auto_56171 ?auto_56166 ) ) ( not ( = ?auto_56167 ?auto_56178 ) ) ( not ( = ?auto_56180 ?auto_56177 ) ) ( not ( = ?auto_56165 ?auto_56173 ) ) ( not ( = ?auto_56171 ?auto_56173 ) ) ( not ( = ?auto_56166 ?auto_56173 ) ) ( not ( = ?auto_56172 ?auto_56178 ) ) ( not ( = ?auto_56174 ?auto_56176 ) ) ( not ( = ?auto_56174 ?auto_56177 ) ) ( not ( = ?auto_56165 ?auto_56169 ) ) ( not ( = ?auto_56171 ?auto_56169 ) ) ( not ( = ?auto_56166 ?auto_56169 ) ) ( not ( = ?auto_56173 ?auto_56169 ) ) ( not ( = ?auto_56168 ?auto_56178 ) ) ( not ( = ?auto_56175 ?auto_56180 ) ) ( not ( = ?auto_56175 ?auto_56176 ) ) ( not ( = ?auto_56175 ?auto_56177 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_56164 ?auto_56165 ?auto_56170 ?auto_56171 ?auto_56167 ?auto_56166 ?auto_56168 ?auto_56169 ?auto_56172 ?auto_56173 )
      ( GET-5IMAGE-VERIFY ?auto_56164 ?auto_56165 ?auto_56167 ?auto_56166 ?auto_56168 ?auto_56169 ?auto_56170 ?auto_56171 ?auto_56172 ?auto_56173 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_56328 - DIRECTION
      ?auto_56329 - MODE
      ?auto_56331 - DIRECTION
      ?auto_56330 - MODE
      ?auto_56332 - DIRECTION
      ?auto_56333 - MODE
      ?auto_56334 - DIRECTION
      ?auto_56335 - MODE
      ?auto_56336 - DIRECTION
      ?auto_56337 - MODE
    )
    :vars
    (
      ?auto_56339 - INSTRUMENT
      ?auto_56343 - SATELLITE
      ?auto_56345 - DIRECTION
      ?auto_56338 - INSTRUMENT
      ?auto_56344 - INSTRUMENT
      ?auto_56340 - INSTRUMENT
      ?auto_56341 - INSTRUMENT
      ?auto_56342 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_56331 ?auto_56328 ) ) ( not ( = ?auto_56332 ?auto_56328 ) ) ( not ( = ?auto_56332 ?auto_56331 ) ) ( not ( = ?auto_56334 ?auto_56328 ) ) ( not ( = ?auto_56334 ?auto_56331 ) ) ( not ( = ?auto_56334 ?auto_56332 ) ) ( not ( = ?auto_56336 ?auto_56328 ) ) ( not ( = ?auto_56336 ?auto_56331 ) ) ( not ( = ?auto_56336 ?auto_56332 ) ) ( not ( = ?auto_56336 ?auto_56334 ) ) ( ON_BOARD ?auto_56339 ?auto_56343 ) ( SUPPORTS ?auto_56339 ?auto_56333 ) ( not ( = ?auto_56332 ?auto_56345 ) ) ( CALIBRATION_TARGET ?auto_56339 ?auto_56345 ) ( not ( = ?auto_56345 ?auto_56334 ) ) ( ON_BOARD ?auto_56338 ?auto_56343 ) ( not ( = ?auto_56339 ?auto_56338 ) ) ( SUPPORTS ?auto_56338 ?auto_56335 ) ( CALIBRATION_TARGET ?auto_56338 ?auto_56345 ) ( not ( = ?auto_56345 ?auto_56331 ) ) ( ON_BOARD ?auto_56344 ?auto_56343 ) ( not ( = ?auto_56338 ?auto_56344 ) ) ( SUPPORTS ?auto_56344 ?auto_56330 ) ( CALIBRATION_TARGET ?auto_56344 ?auto_56345 ) ( not ( = ?auto_56345 ?auto_56336 ) ) ( ON_BOARD ?auto_56340 ?auto_56343 ) ( not ( = ?auto_56344 ?auto_56340 ) ) ( SUPPORTS ?auto_56340 ?auto_56337 ) ( CALIBRATION_TARGET ?auto_56340 ?auto_56345 ) ( not ( = ?auto_56345 ?auto_56328 ) ) ( ON_BOARD ?auto_56341 ?auto_56343 ) ( not ( = ?auto_56340 ?auto_56341 ) ) ( SUPPORTS ?auto_56341 ?auto_56329 ) ( CALIBRATION_TARGET ?auto_56341 ?auto_56345 ) ( POWER_AVAIL ?auto_56343 ) ( POINTING ?auto_56343 ?auto_56342 ) ( not ( = ?auto_56345 ?auto_56342 ) ) ( not ( = ?auto_56328 ?auto_56342 ) ) ( not ( = ?auto_56329 ?auto_56337 ) ) ( not ( = ?auto_56336 ?auto_56342 ) ) ( not ( = ?auto_56329 ?auto_56330 ) ) ( not ( = ?auto_56337 ?auto_56330 ) ) ( not ( = ?auto_56331 ?auto_56342 ) ) ( not ( = ?auto_56344 ?auto_56341 ) ) ( not ( = ?auto_56329 ?auto_56335 ) ) ( not ( = ?auto_56337 ?auto_56335 ) ) ( not ( = ?auto_56330 ?auto_56335 ) ) ( not ( = ?auto_56334 ?auto_56342 ) ) ( not ( = ?auto_56338 ?auto_56340 ) ) ( not ( = ?auto_56338 ?auto_56341 ) ) ( not ( = ?auto_56329 ?auto_56333 ) ) ( not ( = ?auto_56337 ?auto_56333 ) ) ( not ( = ?auto_56330 ?auto_56333 ) ) ( not ( = ?auto_56335 ?auto_56333 ) ) ( not ( = ?auto_56332 ?auto_56342 ) ) ( not ( = ?auto_56339 ?auto_56344 ) ) ( not ( = ?auto_56339 ?auto_56340 ) ) ( not ( = ?auto_56339 ?auto_56341 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_56328 ?auto_56329 ?auto_56336 ?auto_56337 ?auto_56331 ?auto_56330 ?auto_56332 ?auto_56333 ?auto_56334 ?auto_56335 )
      ( GET-5IMAGE-VERIFY ?auto_56328 ?auto_56329 ?auto_56331 ?auto_56330 ?auto_56332 ?auto_56333 ?auto_56334 ?auto_56335 ?auto_56336 ?auto_56337 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_56742 - DIRECTION
      ?auto_56743 - MODE
      ?auto_56745 - DIRECTION
      ?auto_56744 - MODE
      ?auto_56746 - DIRECTION
      ?auto_56747 - MODE
      ?auto_56748 - DIRECTION
      ?auto_56749 - MODE
      ?auto_56750 - DIRECTION
      ?auto_56751 - MODE
    )
    :vars
    (
      ?auto_56753 - INSTRUMENT
      ?auto_56757 - SATELLITE
      ?auto_56759 - DIRECTION
      ?auto_56752 - INSTRUMENT
      ?auto_56758 - INSTRUMENT
      ?auto_56754 - INSTRUMENT
      ?auto_56755 - INSTRUMENT
      ?auto_56756 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_56745 ?auto_56742 ) ) ( not ( = ?auto_56746 ?auto_56742 ) ) ( not ( = ?auto_56746 ?auto_56745 ) ) ( not ( = ?auto_56748 ?auto_56742 ) ) ( not ( = ?auto_56748 ?auto_56745 ) ) ( not ( = ?auto_56748 ?auto_56746 ) ) ( not ( = ?auto_56750 ?auto_56742 ) ) ( not ( = ?auto_56750 ?auto_56745 ) ) ( not ( = ?auto_56750 ?auto_56746 ) ) ( not ( = ?auto_56750 ?auto_56748 ) ) ( ON_BOARD ?auto_56753 ?auto_56757 ) ( SUPPORTS ?auto_56753 ?auto_56751 ) ( not ( = ?auto_56750 ?auto_56759 ) ) ( CALIBRATION_TARGET ?auto_56753 ?auto_56759 ) ( not ( = ?auto_56759 ?auto_56745 ) ) ( ON_BOARD ?auto_56752 ?auto_56757 ) ( not ( = ?auto_56753 ?auto_56752 ) ) ( SUPPORTS ?auto_56752 ?auto_56744 ) ( CALIBRATION_TARGET ?auto_56752 ?auto_56759 ) ( not ( = ?auto_56759 ?auto_56748 ) ) ( ON_BOARD ?auto_56758 ?auto_56757 ) ( not ( = ?auto_56752 ?auto_56758 ) ) ( SUPPORTS ?auto_56758 ?auto_56749 ) ( CALIBRATION_TARGET ?auto_56758 ?auto_56759 ) ( not ( = ?auto_56759 ?auto_56746 ) ) ( ON_BOARD ?auto_56754 ?auto_56757 ) ( not ( = ?auto_56758 ?auto_56754 ) ) ( SUPPORTS ?auto_56754 ?auto_56747 ) ( CALIBRATION_TARGET ?auto_56754 ?auto_56759 ) ( not ( = ?auto_56759 ?auto_56742 ) ) ( ON_BOARD ?auto_56755 ?auto_56757 ) ( not ( = ?auto_56754 ?auto_56755 ) ) ( SUPPORTS ?auto_56755 ?auto_56743 ) ( CALIBRATION_TARGET ?auto_56755 ?auto_56759 ) ( POWER_AVAIL ?auto_56757 ) ( POINTING ?auto_56757 ?auto_56756 ) ( not ( = ?auto_56759 ?auto_56756 ) ) ( not ( = ?auto_56742 ?auto_56756 ) ) ( not ( = ?auto_56743 ?auto_56747 ) ) ( not ( = ?auto_56746 ?auto_56756 ) ) ( not ( = ?auto_56743 ?auto_56749 ) ) ( not ( = ?auto_56747 ?auto_56749 ) ) ( not ( = ?auto_56748 ?auto_56756 ) ) ( not ( = ?auto_56758 ?auto_56755 ) ) ( not ( = ?auto_56743 ?auto_56744 ) ) ( not ( = ?auto_56747 ?auto_56744 ) ) ( not ( = ?auto_56749 ?auto_56744 ) ) ( not ( = ?auto_56745 ?auto_56756 ) ) ( not ( = ?auto_56752 ?auto_56754 ) ) ( not ( = ?auto_56752 ?auto_56755 ) ) ( not ( = ?auto_56743 ?auto_56751 ) ) ( not ( = ?auto_56747 ?auto_56751 ) ) ( not ( = ?auto_56749 ?auto_56751 ) ) ( not ( = ?auto_56744 ?auto_56751 ) ) ( not ( = ?auto_56750 ?auto_56756 ) ) ( not ( = ?auto_56753 ?auto_56758 ) ) ( not ( = ?auto_56753 ?auto_56754 ) ) ( not ( = ?auto_56753 ?auto_56755 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_56742 ?auto_56743 ?auto_56746 ?auto_56747 ?auto_56748 ?auto_56749 ?auto_56750 ?auto_56751 ?auto_56745 ?auto_56744 )
      ( GET-5IMAGE-VERIFY ?auto_56742 ?auto_56743 ?auto_56745 ?auto_56744 ?auto_56746 ?auto_56747 ?auto_56748 ?auto_56749 ?auto_56750 ?auto_56751 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_56820 - DIRECTION
      ?auto_56821 - MODE
      ?auto_56823 - DIRECTION
      ?auto_56822 - MODE
      ?auto_56824 - DIRECTION
      ?auto_56825 - MODE
      ?auto_56826 - DIRECTION
      ?auto_56827 - MODE
      ?auto_56828 - DIRECTION
      ?auto_56829 - MODE
    )
    :vars
    (
      ?auto_56831 - INSTRUMENT
      ?auto_56835 - SATELLITE
      ?auto_56837 - DIRECTION
      ?auto_56830 - INSTRUMENT
      ?auto_56836 - INSTRUMENT
      ?auto_56832 - INSTRUMENT
      ?auto_56833 - INSTRUMENT
      ?auto_56834 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_56823 ?auto_56820 ) ) ( not ( = ?auto_56824 ?auto_56820 ) ) ( not ( = ?auto_56824 ?auto_56823 ) ) ( not ( = ?auto_56826 ?auto_56820 ) ) ( not ( = ?auto_56826 ?auto_56823 ) ) ( not ( = ?auto_56826 ?auto_56824 ) ) ( not ( = ?auto_56828 ?auto_56820 ) ) ( not ( = ?auto_56828 ?auto_56823 ) ) ( not ( = ?auto_56828 ?auto_56824 ) ) ( not ( = ?auto_56828 ?auto_56826 ) ) ( ON_BOARD ?auto_56831 ?auto_56835 ) ( SUPPORTS ?auto_56831 ?auto_56827 ) ( not ( = ?auto_56826 ?auto_56837 ) ) ( CALIBRATION_TARGET ?auto_56831 ?auto_56837 ) ( not ( = ?auto_56837 ?auto_56823 ) ) ( ON_BOARD ?auto_56830 ?auto_56835 ) ( not ( = ?auto_56831 ?auto_56830 ) ) ( SUPPORTS ?auto_56830 ?auto_56822 ) ( CALIBRATION_TARGET ?auto_56830 ?auto_56837 ) ( not ( = ?auto_56837 ?auto_56828 ) ) ( ON_BOARD ?auto_56836 ?auto_56835 ) ( not ( = ?auto_56830 ?auto_56836 ) ) ( SUPPORTS ?auto_56836 ?auto_56829 ) ( CALIBRATION_TARGET ?auto_56836 ?auto_56837 ) ( not ( = ?auto_56837 ?auto_56824 ) ) ( ON_BOARD ?auto_56832 ?auto_56835 ) ( not ( = ?auto_56836 ?auto_56832 ) ) ( SUPPORTS ?auto_56832 ?auto_56825 ) ( CALIBRATION_TARGET ?auto_56832 ?auto_56837 ) ( not ( = ?auto_56837 ?auto_56820 ) ) ( ON_BOARD ?auto_56833 ?auto_56835 ) ( not ( = ?auto_56832 ?auto_56833 ) ) ( SUPPORTS ?auto_56833 ?auto_56821 ) ( CALIBRATION_TARGET ?auto_56833 ?auto_56837 ) ( POWER_AVAIL ?auto_56835 ) ( POINTING ?auto_56835 ?auto_56834 ) ( not ( = ?auto_56837 ?auto_56834 ) ) ( not ( = ?auto_56820 ?auto_56834 ) ) ( not ( = ?auto_56821 ?auto_56825 ) ) ( not ( = ?auto_56824 ?auto_56834 ) ) ( not ( = ?auto_56821 ?auto_56829 ) ) ( not ( = ?auto_56825 ?auto_56829 ) ) ( not ( = ?auto_56828 ?auto_56834 ) ) ( not ( = ?auto_56836 ?auto_56833 ) ) ( not ( = ?auto_56821 ?auto_56822 ) ) ( not ( = ?auto_56825 ?auto_56822 ) ) ( not ( = ?auto_56829 ?auto_56822 ) ) ( not ( = ?auto_56823 ?auto_56834 ) ) ( not ( = ?auto_56830 ?auto_56832 ) ) ( not ( = ?auto_56830 ?auto_56833 ) ) ( not ( = ?auto_56821 ?auto_56827 ) ) ( not ( = ?auto_56825 ?auto_56827 ) ) ( not ( = ?auto_56829 ?auto_56827 ) ) ( not ( = ?auto_56822 ?auto_56827 ) ) ( not ( = ?auto_56826 ?auto_56834 ) ) ( not ( = ?auto_56831 ?auto_56836 ) ) ( not ( = ?auto_56831 ?auto_56832 ) ) ( not ( = ?auto_56831 ?auto_56833 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_56820 ?auto_56821 ?auto_56824 ?auto_56825 ?auto_56828 ?auto_56829 ?auto_56826 ?auto_56827 ?auto_56823 ?auto_56822 )
      ( GET-5IMAGE-VERIFY ?auto_56820 ?auto_56821 ?auto_56823 ?auto_56822 ?auto_56824 ?auto_56825 ?auto_56826 ?auto_56827 ?auto_56828 ?auto_56829 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_56898 - DIRECTION
      ?auto_56899 - MODE
      ?auto_56901 - DIRECTION
      ?auto_56900 - MODE
      ?auto_56902 - DIRECTION
      ?auto_56903 - MODE
      ?auto_56904 - DIRECTION
      ?auto_56905 - MODE
      ?auto_56906 - DIRECTION
      ?auto_56907 - MODE
    )
    :vars
    (
      ?auto_56909 - INSTRUMENT
      ?auto_56913 - SATELLITE
      ?auto_56915 - DIRECTION
      ?auto_56908 - INSTRUMENT
      ?auto_56914 - INSTRUMENT
      ?auto_56910 - INSTRUMENT
      ?auto_56911 - INSTRUMENT
      ?auto_56912 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_56901 ?auto_56898 ) ) ( not ( = ?auto_56902 ?auto_56898 ) ) ( not ( = ?auto_56902 ?auto_56901 ) ) ( not ( = ?auto_56904 ?auto_56898 ) ) ( not ( = ?auto_56904 ?auto_56901 ) ) ( not ( = ?auto_56904 ?auto_56902 ) ) ( not ( = ?auto_56906 ?auto_56898 ) ) ( not ( = ?auto_56906 ?auto_56901 ) ) ( not ( = ?auto_56906 ?auto_56902 ) ) ( not ( = ?auto_56906 ?auto_56904 ) ) ( ON_BOARD ?auto_56909 ?auto_56913 ) ( SUPPORTS ?auto_56909 ?auto_56907 ) ( not ( = ?auto_56906 ?auto_56915 ) ) ( CALIBRATION_TARGET ?auto_56909 ?auto_56915 ) ( not ( = ?auto_56915 ?auto_56901 ) ) ( ON_BOARD ?auto_56908 ?auto_56913 ) ( not ( = ?auto_56909 ?auto_56908 ) ) ( SUPPORTS ?auto_56908 ?auto_56900 ) ( CALIBRATION_TARGET ?auto_56908 ?auto_56915 ) ( not ( = ?auto_56915 ?auto_56902 ) ) ( ON_BOARD ?auto_56914 ?auto_56913 ) ( not ( = ?auto_56908 ?auto_56914 ) ) ( SUPPORTS ?auto_56914 ?auto_56903 ) ( CALIBRATION_TARGET ?auto_56914 ?auto_56915 ) ( not ( = ?auto_56915 ?auto_56904 ) ) ( ON_BOARD ?auto_56910 ?auto_56913 ) ( not ( = ?auto_56914 ?auto_56910 ) ) ( SUPPORTS ?auto_56910 ?auto_56905 ) ( CALIBRATION_TARGET ?auto_56910 ?auto_56915 ) ( not ( = ?auto_56915 ?auto_56898 ) ) ( ON_BOARD ?auto_56911 ?auto_56913 ) ( not ( = ?auto_56910 ?auto_56911 ) ) ( SUPPORTS ?auto_56911 ?auto_56899 ) ( CALIBRATION_TARGET ?auto_56911 ?auto_56915 ) ( POWER_AVAIL ?auto_56913 ) ( POINTING ?auto_56913 ?auto_56912 ) ( not ( = ?auto_56915 ?auto_56912 ) ) ( not ( = ?auto_56898 ?auto_56912 ) ) ( not ( = ?auto_56899 ?auto_56905 ) ) ( not ( = ?auto_56904 ?auto_56912 ) ) ( not ( = ?auto_56899 ?auto_56903 ) ) ( not ( = ?auto_56905 ?auto_56903 ) ) ( not ( = ?auto_56902 ?auto_56912 ) ) ( not ( = ?auto_56914 ?auto_56911 ) ) ( not ( = ?auto_56899 ?auto_56900 ) ) ( not ( = ?auto_56905 ?auto_56900 ) ) ( not ( = ?auto_56903 ?auto_56900 ) ) ( not ( = ?auto_56901 ?auto_56912 ) ) ( not ( = ?auto_56908 ?auto_56910 ) ) ( not ( = ?auto_56908 ?auto_56911 ) ) ( not ( = ?auto_56899 ?auto_56907 ) ) ( not ( = ?auto_56905 ?auto_56907 ) ) ( not ( = ?auto_56903 ?auto_56907 ) ) ( not ( = ?auto_56900 ?auto_56907 ) ) ( not ( = ?auto_56906 ?auto_56912 ) ) ( not ( = ?auto_56909 ?auto_56914 ) ) ( not ( = ?auto_56909 ?auto_56910 ) ) ( not ( = ?auto_56909 ?auto_56911 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_56898 ?auto_56899 ?auto_56904 ?auto_56905 ?auto_56902 ?auto_56903 ?auto_56906 ?auto_56907 ?auto_56901 ?auto_56900 )
      ( GET-5IMAGE-VERIFY ?auto_56898 ?auto_56899 ?auto_56901 ?auto_56900 ?auto_56902 ?auto_56903 ?auto_56904 ?auto_56905 ?auto_56906 ?auto_56907 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_56976 - DIRECTION
      ?auto_56977 - MODE
      ?auto_56979 - DIRECTION
      ?auto_56978 - MODE
      ?auto_56980 - DIRECTION
      ?auto_56981 - MODE
      ?auto_56982 - DIRECTION
      ?auto_56983 - MODE
      ?auto_56984 - DIRECTION
      ?auto_56985 - MODE
    )
    :vars
    (
      ?auto_56987 - INSTRUMENT
      ?auto_56991 - SATELLITE
      ?auto_56993 - DIRECTION
      ?auto_56986 - INSTRUMENT
      ?auto_56992 - INSTRUMENT
      ?auto_56988 - INSTRUMENT
      ?auto_56989 - INSTRUMENT
      ?auto_56990 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_56979 ?auto_56976 ) ) ( not ( = ?auto_56980 ?auto_56976 ) ) ( not ( = ?auto_56980 ?auto_56979 ) ) ( not ( = ?auto_56982 ?auto_56976 ) ) ( not ( = ?auto_56982 ?auto_56979 ) ) ( not ( = ?auto_56982 ?auto_56980 ) ) ( not ( = ?auto_56984 ?auto_56976 ) ) ( not ( = ?auto_56984 ?auto_56979 ) ) ( not ( = ?auto_56984 ?auto_56980 ) ) ( not ( = ?auto_56984 ?auto_56982 ) ) ( ON_BOARD ?auto_56987 ?auto_56991 ) ( SUPPORTS ?auto_56987 ?auto_56983 ) ( not ( = ?auto_56982 ?auto_56993 ) ) ( CALIBRATION_TARGET ?auto_56987 ?auto_56993 ) ( not ( = ?auto_56993 ?auto_56979 ) ) ( ON_BOARD ?auto_56986 ?auto_56991 ) ( not ( = ?auto_56987 ?auto_56986 ) ) ( SUPPORTS ?auto_56986 ?auto_56978 ) ( CALIBRATION_TARGET ?auto_56986 ?auto_56993 ) ( not ( = ?auto_56993 ?auto_56980 ) ) ( ON_BOARD ?auto_56992 ?auto_56991 ) ( not ( = ?auto_56986 ?auto_56992 ) ) ( SUPPORTS ?auto_56992 ?auto_56981 ) ( CALIBRATION_TARGET ?auto_56992 ?auto_56993 ) ( not ( = ?auto_56993 ?auto_56984 ) ) ( ON_BOARD ?auto_56988 ?auto_56991 ) ( not ( = ?auto_56992 ?auto_56988 ) ) ( SUPPORTS ?auto_56988 ?auto_56985 ) ( CALIBRATION_TARGET ?auto_56988 ?auto_56993 ) ( not ( = ?auto_56993 ?auto_56976 ) ) ( ON_BOARD ?auto_56989 ?auto_56991 ) ( not ( = ?auto_56988 ?auto_56989 ) ) ( SUPPORTS ?auto_56989 ?auto_56977 ) ( CALIBRATION_TARGET ?auto_56989 ?auto_56993 ) ( POWER_AVAIL ?auto_56991 ) ( POINTING ?auto_56991 ?auto_56990 ) ( not ( = ?auto_56993 ?auto_56990 ) ) ( not ( = ?auto_56976 ?auto_56990 ) ) ( not ( = ?auto_56977 ?auto_56985 ) ) ( not ( = ?auto_56984 ?auto_56990 ) ) ( not ( = ?auto_56977 ?auto_56981 ) ) ( not ( = ?auto_56985 ?auto_56981 ) ) ( not ( = ?auto_56980 ?auto_56990 ) ) ( not ( = ?auto_56992 ?auto_56989 ) ) ( not ( = ?auto_56977 ?auto_56978 ) ) ( not ( = ?auto_56985 ?auto_56978 ) ) ( not ( = ?auto_56981 ?auto_56978 ) ) ( not ( = ?auto_56979 ?auto_56990 ) ) ( not ( = ?auto_56986 ?auto_56988 ) ) ( not ( = ?auto_56986 ?auto_56989 ) ) ( not ( = ?auto_56977 ?auto_56983 ) ) ( not ( = ?auto_56985 ?auto_56983 ) ) ( not ( = ?auto_56981 ?auto_56983 ) ) ( not ( = ?auto_56978 ?auto_56983 ) ) ( not ( = ?auto_56982 ?auto_56990 ) ) ( not ( = ?auto_56987 ?auto_56992 ) ) ( not ( = ?auto_56987 ?auto_56988 ) ) ( not ( = ?auto_56987 ?auto_56989 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_56976 ?auto_56977 ?auto_56984 ?auto_56985 ?auto_56980 ?auto_56981 ?auto_56982 ?auto_56983 ?auto_56979 ?auto_56978 )
      ( GET-5IMAGE-VERIFY ?auto_56976 ?auto_56977 ?auto_56979 ?auto_56978 ?auto_56980 ?auto_56981 ?auto_56982 ?auto_56983 ?auto_56984 ?auto_56985 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_57390 - DIRECTION
      ?auto_57391 - MODE
      ?auto_57393 - DIRECTION
      ?auto_57392 - MODE
      ?auto_57394 - DIRECTION
      ?auto_57395 - MODE
      ?auto_57396 - DIRECTION
      ?auto_57397 - MODE
      ?auto_57398 - DIRECTION
      ?auto_57399 - MODE
    )
    :vars
    (
      ?auto_57401 - INSTRUMENT
      ?auto_57405 - SATELLITE
      ?auto_57407 - DIRECTION
      ?auto_57400 - INSTRUMENT
      ?auto_57406 - INSTRUMENT
      ?auto_57402 - INSTRUMENT
      ?auto_57403 - INSTRUMENT
      ?auto_57404 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_57393 ?auto_57390 ) ) ( not ( = ?auto_57394 ?auto_57390 ) ) ( not ( = ?auto_57394 ?auto_57393 ) ) ( not ( = ?auto_57396 ?auto_57390 ) ) ( not ( = ?auto_57396 ?auto_57393 ) ) ( not ( = ?auto_57396 ?auto_57394 ) ) ( not ( = ?auto_57398 ?auto_57390 ) ) ( not ( = ?auto_57398 ?auto_57393 ) ) ( not ( = ?auto_57398 ?auto_57394 ) ) ( not ( = ?auto_57398 ?auto_57396 ) ) ( ON_BOARD ?auto_57401 ?auto_57405 ) ( SUPPORTS ?auto_57401 ?auto_57395 ) ( not ( = ?auto_57394 ?auto_57407 ) ) ( CALIBRATION_TARGET ?auto_57401 ?auto_57407 ) ( not ( = ?auto_57407 ?auto_57393 ) ) ( ON_BOARD ?auto_57400 ?auto_57405 ) ( not ( = ?auto_57401 ?auto_57400 ) ) ( SUPPORTS ?auto_57400 ?auto_57392 ) ( CALIBRATION_TARGET ?auto_57400 ?auto_57407 ) ( not ( = ?auto_57407 ?auto_57398 ) ) ( ON_BOARD ?auto_57406 ?auto_57405 ) ( not ( = ?auto_57400 ?auto_57406 ) ) ( SUPPORTS ?auto_57406 ?auto_57399 ) ( CALIBRATION_TARGET ?auto_57406 ?auto_57407 ) ( not ( = ?auto_57407 ?auto_57396 ) ) ( ON_BOARD ?auto_57402 ?auto_57405 ) ( not ( = ?auto_57406 ?auto_57402 ) ) ( SUPPORTS ?auto_57402 ?auto_57397 ) ( CALIBRATION_TARGET ?auto_57402 ?auto_57407 ) ( not ( = ?auto_57407 ?auto_57390 ) ) ( ON_BOARD ?auto_57403 ?auto_57405 ) ( not ( = ?auto_57402 ?auto_57403 ) ) ( SUPPORTS ?auto_57403 ?auto_57391 ) ( CALIBRATION_TARGET ?auto_57403 ?auto_57407 ) ( POWER_AVAIL ?auto_57405 ) ( POINTING ?auto_57405 ?auto_57404 ) ( not ( = ?auto_57407 ?auto_57404 ) ) ( not ( = ?auto_57390 ?auto_57404 ) ) ( not ( = ?auto_57391 ?auto_57397 ) ) ( not ( = ?auto_57396 ?auto_57404 ) ) ( not ( = ?auto_57391 ?auto_57399 ) ) ( not ( = ?auto_57397 ?auto_57399 ) ) ( not ( = ?auto_57398 ?auto_57404 ) ) ( not ( = ?auto_57406 ?auto_57403 ) ) ( not ( = ?auto_57391 ?auto_57392 ) ) ( not ( = ?auto_57397 ?auto_57392 ) ) ( not ( = ?auto_57399 ?auto_57392 ) ) ( not ( = ?auto_57393 ?auto_57404 ) ) ( not ( = ?auto_57400 ?auto_57402 ) ) ( not ( = ?auto_57400 ?auto_57403 ) ) ( not ( = ?auto_57391 ?auto_57395 ) ) ( not ( = ?auto_57397 ?auto_57395 ) ) ( not ( = ?auto_57399 ?auto_57395 ) ) ( not ( = ?auto_57392 ?auto_57395 ) ) ( not ( = ?auto_57394 ?auto_57404 ) ) ( not ( = ?auto_57401 ?auto_57406 ) ) ( not ( = ?auto_57401 ?auto_57402 ) ) ( not ( = ?auto_57401 ?auto_57403 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_57390 ?auto_57391 ?auto_57396 ?auto_57397 ?auto_57398 ?auto_57399 ?auto_57394 ?auto_57395 ?auto_57393 ?auto_57392 )
      ( GET-5IMAGE-VERIFY ?auto_57390 ?auto_57391 ?auto_57393 ?auto_57392 ?auto_57394 ?auto_57395 ?auto_57396 ?auto_57397 ?auto_57398 ?auto_57399 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_57468 - DIRECTION
      ?auto_57469 - MODE
      ?auto_57471 - DIRECTION
      ?auto_57470 - MODE
      ?auto_57472 - DIRECTION
      ?auto_57473 - MODE
      ?auto_57474 - DIRECTION
      ?auto_57475 - MODE
      ?auto_57476 - DIRECTION
      ?auto_57477 - MODE
    )
    :vars
    (
      ?auto_57479 - INSTRUMENT
      ?auto_57483 - SATELLITE
      ?auto_57485 - DIRECTION
      ?auto_57478 - INSTRUMENT
      ?auto_57484 - INSTRUMENT
      ?auto_57480 - INSTRUMENT
      ?auto_57481 - INSTRUMENT
      ?auto_57482 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_57471 ?auto_57468 ) ) ( not ( = ?auto_57472 ?auto_57468 ) ) ( not ( = ?auto_57472 ?auto_57471 ) ) ( not ( = ?auto_57474 ?auto_57468 ) ) ( not ( = ?auto_57474 ?auto_57471 ) ) ( not ( = ?auto_57474 ?auto_57472 ) ) ( not ( = ?auto_57476 ?auto_57468 ) ) ( not ( = ?auto_57476 ?auto_57471 ) ) ( not ( = ?auto_57476 ?auto_57472 ) ) ( not ( = ?auto_57476 ?auto_57474 ) ) ( ON_BOARD ?auto_57479 ?auto_57483 ) ( SUPPORTS ?auto_57479 ?auto_57473 ) ( not ( = ?auto_57472 ?auto_57485 ) ) ( CALIBRATION_TARGET ?auto_57479 ?auto_57485 ) ( not ( = ?auto_57485 ?auto_57471 ) ) ( ON_BOARD ?auto_57478 ?auto_57483 ) ( not ( = ?auto_57479 ?auto_57478 ) ) ( SUPPORTS ?auto_57478 ?auto_57470 ) ( CALIBRATION_TARGET ?auto_57478 ?auto_57485 ) ( not ( = ?auto_57485 ?auto_57474 ) ) ( ON_BOARD ?auto_57484 ?auto_57483 ) ( not ( = ?auto_57478 ?auto_57484 ) ) ( SUPPORTS ?auto_57484 ?auto_57475 ) ( CALIBRATION_TARGET ?auto_57484 ?auto_57485 ) ( not ( = ?auto_57485 ?auto_57476 ) ) ( ON_BOARD ?auto_57480 ?auto_57483 ) ( not ( = ?auto_57484 ?auto_57480 ) ) ( SUPPORTS ?auto_57480 ?auto_57477 ) ( CALIBRATION_TARGET ?auto_57480 ?auto_57485 ) ( not ( = ?auto_57485 ?auto_57468 ) ) ( ON_BOARD ?auto_57481 ?auto_57483 ) ( not ( = ?auto_57480 ?auto_57481 ) ) ( SUPPORTS ?auto_57481 ?auto_57469 ) ( CALIBRATION_TARGET ?auto_57481 ?auto_57485 ) ( POWER_AVAIL ?auto_57483 ) ( POINTING ?auto_57483 ?auto_57482 ) ( not ( = ?auto_57485 ?auto_57482 ) ) ( not ( = ?auto_57468 ?auto_57482 ) ) ( not ( = ?auto_57469 ?auto_57477 ) ) ( not ( = ?auto_57476 ?auto_57482 ) ) ( not ( = ?auto_57469 ?auto_57475 ) ) ( not ( = ?auto_57477 ?auto_57475 ) ) ( not ( = ?auto_57474 ?auto_57482 ) ) ( not ( = ?auto_57484 ?auto_57481 ) ) ( not ( = ?auto_57469 ?auto_57470 ) ) ( not ( = ?auto_57477 ?auto_57470 ) ) ( not ( = ?auto_57475 ?auto_57470 ) ) ( not ( = ?auto_57471 ?auto_57482 ) ) ( not ( = ?auto_57478 ?auto_57480 ) ) ( not ( = ?auto_57478 ?auto_57481 ) ) ( not ( = ?auto_57469 ?auto_57473 ) ) ( not ( = ?auto_57477 ?auto_57473 ) ) ( not ( = ?auto_57475 ?auto_57473 ) ) ( not ( = ?auto_57470 ?auto_57473 ) ) ( not ( = ?auto_57472 ?auto_57482 ) ) ( not ( = ?auto_57479 ?auto_57484 ) ) ( not ( = ?auto_57479 ?auto_57480 ) ) ( not ( = ?auto_57479 ?auto_57481 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_57468 ?auto_57469 ?auto_57476 ?auto_57477 ?auto_57474 ?auto_57475 ?auto_57472 ?auto_57473 ?auto_57471 ?auto_57470 )
      ( GET-5IMAGE-VERIFY ?auto_57468 ?auto_57469 ?auto_57471 ?auto_57470 ?auto_57472 ?auto_57473 ?auto_57474 ?auto_57475 ?auto_57476 ?auto_57477 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_58576 - DIRECTION
      ?auto_58577 - MODE
      ?auto_58579 - DIRECTION
      ?auto_58578 - MODE
      ?auto_58580 - DIRECTION
      ?auto_58581 - MODE
      ?auto_58582 - DIRECTION
      ?auto_58583 - MODE
      ?auto_58584 - DIRECTION
      ?auto_58585 - MODE
    )
    :vars
    (
      ?auto_58587 - INSTRUMENT
      ?auto_58591 - SATELLITE
      ?auto_58593 - DIRECTION
      ?auto_58586 - INSTRUMENT
      ?auto_58592 - INSTRUMENT
      ?auto_58588 - INSTRUMENT
      ?auto_58589 - INSTRUMENT
      ?auto_58590 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_58579 ?auto_58576 ) ) ( not ( = ?auto_58580 ?auto_58576 ) ) ( not ( = ?auto_58580 ?auto_58579 ) ) ( not ( = ?auto_58582 ?auto_58576 ) ) ( not ( = ?auto_58582 ?auto_58579 ) ) ( not ( = ?auto_58582 ?auto_58580 ) ) ( not ( = ?auto_58584 ?auto_58576 ) ) ( not ( = ?auto_58584 ?auto_58579 ) ) ( not ( = ?auto_58584 ?auto_58580 ) ) ( not ( = ?auto_58584 ?auto_58582 ) ) ( ON_BOARD ?auto_58587 ?auto_58591 ) ( SUPPORTS ?auto_58587 ?auto_58578 ) ( not ( = ?auto_58579 ?auto_58593 ) ) ( CALIBRATION_TARGET ?auto_58587 ?auto_58593 ) ( not ( = ?auto_58593 ?auto_58584 ) ) ( ON_BOARD ?auto_58586 ?auto_58591 ) ( not ( = ?auto_58587 ?auto_58586 ) ) ( SUPPORTS ?auto_58586 ?auto_58585 ) ( CALIBRATION_TARGET ?auto_58586 ?auto_58593 ) ( not ( = ?auto_58593 ?auto_58582 ) ) ( ON_BOARD ?auto_58592 ?auto_58591 ) ( not ( = ?auto_58586 ?auto_58592 ) ) ( SUPPORTS ?auto_58592 ?auto_58583 ) ( CALIBRATION_TARGET ?auto_58592 ?auto_58593 ) ( not ( = ?auto_58593 ?auto_58580 ) ) ( ON_BOARD ?auto_58588 ?auto_58591 ) ( not ( = ?auto_58592 ?auto_58588 ) ) ( SUPPORTS ?auto_58588 ?auto_58581 ) ( CALIBRATION_TARGET ?auto_58588 ?auto_58593 ) ( not ( = ?auto_58593 ?auto_58576 ) ) ( ON_BOARD ?auto_58589 ?auto_58591 ) ( not ( = ?auto_58588 ?auto_58589 ) ) ( SUPPORTS ?auto_58589 ?auto_58577 ) ( CALIBRATION_TARGET ?auto_58589 ?auto_58593 ) ( POWER_AVAIL ?auto_58591 ) ( POINTING ?auto_58591 ?auto_58590 ) ( not ( = ?auto_58593 ?auto_58590 ) ) ( not ( = ?auto_58576 ?auto_58590 ) ) ( not ( = ?auto_58577 ?auto_58581 ) ) ( not ( = ?auto_58580 ?auto_58590 ) ) ( not ( = ?auto_58577 ?auto_58583 ) ) ( not ( = ?auto_58581 ?auto_58583 ) ) ( not ( = ?auto_58582 ?auto_58590 ) ) ( not ( = ?auto_58592 ?auto_58589 ) ) ( not ( = ?auto_58577 ?auto_58585 ) ) ( not ( = ?auto_58581 ?auto_58585 ) ) ( not ( = ?auto_58583 ?auto_58585 ) ) ( not ( = ?auto_58584 ?auto_58590 ) ) ( not ( = ?auto_58586 ?auto_58588 ) ) ( not ( = ?auto_58586 ?auto_58589 ) ) ( not ( = ?auto_58577 ?auto_58578 ) ) ( not ( = ?auto_58581 ?auto_58578 ) ) ( not ( = ?auto_58583 ?auto_58578 ) ) ( not ( = ?auto_58585 ?auto_58578 ) ) ( not ( = ?auto_58579 ?auto_58590 ) ) ( not ( = ?auto_58587 ?auto_58592 ) ) ( not ( = ?auto_58587 ?auto_58588 ) ) ( not ( = ?auto_58587 ?auto_58589 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_58576 ?auto_58577 ?auto_58580 ?auto_58581 ?auto_58582 ?auto_58583 ?auto_58579 ?auto_58578 ?auto_58584 ?auto_58585 )
      ( GET-5IMAGE-VERIFY ?auto_58576 ?auto_58577 ?auto_58579 ?auto_58578 ?auto_58580 ?auto_58581 ?auto_58582 ?auto_58583 ?auto_58584 ?auto_58585 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_58654 - DIRECTION
      ?auto_58655 - MODE
      ?auto_58657 - DIRECTION
      ?auto_58656 - MODE
      ?auto_58658 - DIRECTION
      ?auto_58659 - MODE
      ?auto_58660 - DIRECTION
      ?auto_58661 - MODE
      ?auto_58662 - DIRECTION
      ?auto_58663 - MODE
    )
    :vars
    (
      ?auto_58665 - INSTRUMENT
      ?auto_58669 - SATELLITE
      ?auto_58671 - DIRECTION
      ?auto_58664 - INSTRUMENT
      ?auto_58670 - INSTRUMENT
      ?auto_58666 - INSTRUMENT
      ?auto_58667 - INSTRUMENT
      ?auto_58668 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_58657 ?auto_58654 ) ) ( not ( = ?auto_58658 ?auto_58654 ) ) ( not ( = ?auto_58658 ?auto_58657 ) ) ( not ( = ?auto_58660 ?auto_58654 ) ) ( not ( = ?auto_58660 ?auto_58657 ) ) ( not ( = ?auto_58660 ?auto_58658 ) ) ( not ( = ?auto_58662 ?auto_58654 ) ) ( not ( = ?auto_58662 ?auto_58657 ) ) ( not ( = ?auto_58662 ?auto_58658 ) ) ( not ( = ?auto_58662 ?auto_58660 ) ) ( ON_BOARD ?auto_58665 ?auto_58669 ) ( SUPPORTS ?auto_58665 ?auto_58656 ) ( not ( = ?auto_58657 ?auto_58671 ) ) ( CALIBRATION_TARGET ?auto_58665 ?auto_58671 ) ( not ( = ?auto_58671 ?auto_58660 ) ) ( ON_BOARD ?auto_58664 ?auto_58669 ) ( not ( = ?auto_58665 ?auto_58664 ) ) ( SUPPORTS ?auto_58664 ?auto_58661 ) ( CALIBRATION_TARGET ?auto_58664 ?auto_58671 ) ( not ( = ?auto_58671 ?auto_58662 ) ) ( ON_BOARD ?auto_58670 ?auto_58669 ) ( not ( = ?auto_58664 ?auto_58670 ) ) ( SUPPORTS ?auto_58670 ?auto_58663 ) ( CALIBRATION_TARGET ?auto_58670 ?auto_58671 ) ( not ( = ?auto_58671 ?auto_58658 ) ) ( ON_BOARD ?auto_58666 ?auto_58669 ) ( not ( = ?auto_58670 ?auto_58666 ) ) ( SUPPORTS ?auto_58666 ?auto_58659 ) ( CALIBRATION_TARGET ?auto_58666 ?auto_58671 ) ( not ( = ?auto_58671 ?auto_58654 ) ) ( ON_BOARD ?auto_58667 ?auto_58669 ) ( not ( = ?auto_58666 ?auto_58667 ) ) ( SUPPORTS ?auto_58667 ?auto_58655 ) ( CALIBRATION_TARGET ?auto_58667 ?auto_58671 ) ( POWER_AVAIL ?auto_58669 ) ( POINTING ?auto_58669 ?auto_58668 ) ( not ( = ?auto_58671 ?auto_58668 ) ) ( not ( = ?auto_58654 ?auto_58668 ) ) ( not ( = ?auto_58655 ?auto_58659 ) ) ( not ( = ?auto_58658 ?auto_58668 ) ) ( not ( = ?auto_58655 ?auto_58663 ) ) ( not ( = ?auto_58659 ?auto_58663 ) ) ( not ( = ?auto_58662 ?auto_58668 ) ) ( not ( = ?auto_58670 ?auto_58667 ) ) ( not ( = ?auto_58655 ?auto_58661 ) ) ( not ( = ?auto_58659 ?auto_58661 ) ) ( not ( = ?auto_58663 ?auto_58661 ) ) ( not ( = ?auto_58660 ?auto_58668 ) ) ( not ( = ?auto_58664 ?auto_58666 ) ) ( not ( = ?auto_58664 ?auto_58667 ) ) ( not ( = ?auto_58655 ?auto_58656 ) ) ( not ( = ?auto_58659 ?auto_58656 ) ) ( not ( = ?auto_58663 ?auto_58656 ) ) ( not ( = ?auto_58661 ?auto_58656 ) ) ( not ( = ?auto_58657 ?auto_58668 ) ) ( not ( = ?auto_58665 ?auto_58670 ) ) ( not ( = ?auto_58665 ?auto_58666 ) ) ( not ( = ?auto_58665 ?auto_58667 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_58654 ?auto_58655 ?auto_58658 ?auto_58659 ?auto_58662 ?auto_58663 ?auto_58657 ?auto_58656 ?auto_58660 ?auto_58661 )
      ( GET-5IMAGE-VERIFY ?auto_58654 ?auto_58655 ?auto_58657 ?auto_58656 ?auto_58658 ?auto_58659 ?auto_58660 ?auto_58661 ?auto_58662 ?auto_58663 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_58984 - DIRECTION
      ?auto_58985 - MODE
      ?auto_58987 - DIRECTION
      ?auto_58986 - MODE
      ?auto_58988 - DIRECTION
      ?auto_58989 - MODE
      ?auto_58990 - DIRECTION
      ?auto_58991 - MODE
      ?auto_58992 - DIRECTION
      ?auto_58993 - MODE
    )
    :vars
    (
      ?auto_58995 - INSTRUMENT
      ?auto_58999 - SATELLITE
      ?auto_59001 - DIRECTION
      ?auto_58994 - INSTRUMENT
      ?auto_59000 - INSTRUMENT
      ?auto_58996 - INSTRUMENT
      ?auto_58997 - INSTRUMENT
      ?auto_58998 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_58987 ?auto_58984 ) ) ( not ( = ?auto_58988 ?auto_58984 ) ) ( not ( = ?auto_58988 ?auto_58987 ) ) ( not ( = ?auto_58990 ?auto_58984 ) ) ( not ( = ?auto_58990 ?auto_58987 ) ) ( not ( = ?auto_58990 ?auto_58988 ) ) ( not ( = ?auto_58992 ?auto_58984 ) ) ( not ( = ?auto_58992 ?auto_58987 ) ) ( not ( = ?auto_58992 ?auto_58988 ) ) ( not ( = ?auto_58992 ?auto_58990 ) ) ( ON_BOARD ?auto_58995 ?auto_58999 ) ( SUPPORTS ?auto_58995 ?auto_58986 ) ( not ( = ?auto_58987 ?auto_59001 ) ) ( CALIBRATION_TARGET ?auto_58995 ?auto_59001 ) ( not ( = ?auto_59001 ?auto_58992 ) ) ( ON_BOARD ?auto_58994 ?auto_58999 ) ( not ( = ?auto_58995 ?auto_58994 ) ) ( SUPPORTS ?auto_58994 ?auto_58993 ) ( CALIBRATION_TARGET ?auto_58994 ?auto_59001 ) ( not ( = ?auto_59001 ?auto_58988 ) ) ( ON_BOARD ?auto_59000 ?auto_58999 ) ( not ( = ?auto_58994 ?auto_59000 ) ) ( SUPPORTS ?auto_59000 ?auto_58989 ) ( CALIBRATION_TARGET ?auto_59000 ?auto_59001 ) ( not ( = ?auto_59001 ?auto_58990 ) ) ( ON_BOARD ?auto_58996 ?auto_58999 ) ( not ( = ?auto_59000 ?auto_58996 ) ) ( SUPPORTS ?auto_58996 ?auto_58991 ) ( CALIBRATION_TARGET ?auto_58996 ?auto_59001 ) ( not ( = ?auto_59001 ?auto_58984 ) ) ( ON_BOARD ?auto_58997 ?auto_58999 ) ( not ( = ?auto_58996 ?auto_58997 ) ) ( SUPPORTS ?auto_58997 ?auto_58985 ) ( CALIBRATION_TARGET ?auto_58997 ?auto_59001 ) ( POWER_AVAIL ?auto_58999 ) ( POINTING ?auto_58999 ?auto_58998 ) ( not ( = ?auto_59001 ?auto_58998 ) ) ( not ( = ?auto_58984 ?auto_58998 ) ) ( not ( = ?auto_58985 ?auto_58991 ) ) ( not ( = ?auto_58990 ?auto_58998 ) ) ( not ( = ?auto_58985 ?auto_58989 ) ) ( not ( = ?auto_58991 ?auto_58989 ) ) ( not ( = ?auto_58988 ?auto_58998 ) ) ( not ( = ?auto_59000 ?auto_58997 ) ) ( not ( = ?auto_58985 ?auto_58993 ) ) ( not ( = ?auto_58991 ?auto_58993 ) ) ( not ( = ?auto_58989 ?auto_58993 ) ) ( not ( = ?auto_58992 ?auto_58998 ) ) ( not ( = ?auto_58994 ?auto_58996 ) ) ( not ( = ?auto_58994 ?auto_58997 ) ) ( not ( = ?auto_58985 ?auto_58986 ) ) ( not ( = ?auto_58991 ?auto_58986 ) ) ( not ( = ?auto_58989 ?auto_58986 ) ) ( not ( = ?auto_58993 ?auto_58986 ) ) ( not ( = ?auto_58987 ?auto_58998 ) ) ( not ( = ?auto_58995 ?auto_59000 ) ) ( not ( = ?auto_58995 ?auto_58996 ) ) ( not ( = ?auto_58995 ?auto_58997 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_58984 ?auto_58985 ?auto_58990 ?auto_58991 ?auto_58988 ?auto_58989 ?auto_58987 ?auto_58986 ?auto_58992 ?auto_58993 )
      ( GET-5IMAGE-VERIFY ?auto_58984 ?auto_58985 ?auto_58987 ?auto_58986 ?auto_58988 ?auto_58989 ?auto_58990 ?auto_58991 ?auto_58992 ?auto_58993 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_59148 - DIRECTION
      ?auto_59149 - MODE
      ?auto_59151 - DIRECTION
      ?auto_59150 - MODE
      ?auto_59152 - DIRECTION
      ?auto_59153 - MODE
      ?auto_59154 - DIRECTION
      ?auto_59155 - MODE
      ?auto_59156 - DIRECTION
      ?auto_59157 - MODE
    )
    :vars
    (
      ?auto_59159 - INSTRUMENT
      ?auto_59163 - SATELLITE
      ?auto_59165 - DIRECTION
      ?auto_59158 - INSTRUMENT
      ?auto_59164 - INSTRUMENT
      ?auto_59160 - INSTRUMENT
      ?auto_59161 - INSTRUMENT
      ?auto_59162 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_59151 ?auto_59148 ) ) ( not ( = ?auto_59152 ?auto_59148 ) ) ( not ( = ?auto_59152 ?auto_59151 ) ) ( not ( = ?auto_59154 ?auto_59148 ) ) ( not ( = ?auto_59154 ?auto_59151 ) ) ( not ( = ?auto_59154 ?auto_59152 ) ) ( not ( = ?auto_59156 ?auto_59148 ) ) ( not ( = ?auto_59156 ?auto_59151 ) ) ( not ( = ?auto_59156 ?auto_59152 ) ) ( not ( = ?auto_59156 ?auto_59154 ) ) ( ON_BOARD ?auto_59159 ?auto_59163 ) ( SUPPORTS ?auto_59159 ?auto_59150 ) ( not ( = ?auto_59151 ?auto_59165 ) ) ( CALIBRATION_TARGET ?auto_59159 ?auto_59165 ) ( not ( = ?auto_59165 ?auto_59154 ) ) ( ON_BOARD ?auto_59158 ?auto_59163 ) ( not ( = ?auto_59159 ?auto_59158 ) ) ( SUPPORTS ?auto_59158 ?auto_59155 ) ( CALIBRATION_TARGET ?auto_59158 ?auto_59165 ) ( not ( = ?auto_59165 ?auto_59152 ) ) ( ON_BOARD ?auto_59164 ?auto_59163 ) ( not ( = ?auto_59158 ?auto_59164 ) ) ( SUPPORTS ?auto_59164 ?auto_59153 ) ( CALIBRATION_TARGET ?auto_59164 ?auto_59165 ) ( not ( = ?auto_59165 ?auto_59156 ) ) ( ON_BOARD ?auto_59160 ?auto_59163 ) ( not ( = ?auto_59164 ?auto_59160 ) ) ( SUPPORTS ?auto_59160 ?auto_59157 ) ( CALIBRATION_TARGET ?auto_59160 ?auto_59165 ) ( not ( = ?auto_59165 ?auto_59148 ) ) ( ON_BOARD ?auto_59161 ?auto_59163 ) ( not ( = ?auto_59160 ?auto_59161 ) ) ( SUPPORTS ?auto_59161 ?auto_59149 ) ( CALIBRATION_TARGET ?auto_59161 ?auto_59165 ) ( POWER_AVAIL ?auto_59163 ) ( POINTING ?auto_59163 ?auto_59162 ) ( not ( = ?auto_59165 ?auto_59162 ) ) ( not ( = ?auto_59148 ?auto_59162 ) ) ( not ( = ?auto_59149 ?auto_59157 ) ) ( not ( = ?auto_59156 ?auto_59162 ) ) ( not ( = ?auto_59149 ?auto_59153 ) ) ( not ( = ?auto_59157 ?auto_59153 ) ) ( not ( = ?auto_59152 ?auto_59162 ) ) ( not ( = ?auto_59164 ?auto_59161 ) ) ( not ( = ?auto_59149 ?auto_59155 ) ) ( not ( = ?auto_59157 ?auto_59155 ) ) ( not ( = ?auto_59153 ?auto_59155 ) ) ( not ( = ?auto_59154 ?auto_59162 ) ) ( not ( = ?auto_59158 ?auto_59160 ) ) ( not ( = ?auto_59158 ?auto_59161 ) ) ( not ( = ?auto_59149 ?auto_59150 ) ) ( not ( = ?auto_59157 ?auto_59150 ) ) ( not ( = ?auto_59153 ?auto_59150 ) ) ( not ( = ?auto_59155 ?auto_59150 ) ) ( not ( = ?auto_59151 ?auto_59162 ) ) ( not ( = ?auto_59159 ?auto_59164 ) ) ( not ( = ?auto_59159 ?auto_59160 ) ) ( not ( = ?auto_59159 ?auto_59161 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_59148 ?auto_59149 ?auto_59156 ?auto_59157 ?auto_59152 ?auto_59153 ?auto_59151 ?auto_59150 ?auto_59154 ?auto_59155 )
      ( GET-5IMAGE-VERIFY ?auto_59148 ?auto_59149 ?auto_59151 ?auto_59150 ?auto_59152 ?auto_59153 ?auto_59154 ?auto_59155 ?auto_59156 ?auto_59157 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_59478 - DIRECTION
      ?auto_59479 - MODE
      ?auto_59481 - DIRECTION
      ?auto_59480 - MODE
      ?auto_59482 - DIRECTION
      ?auto_59483 - MODE
      ?auto_59484 - DIRECTION
      ?auto_59485 - MODE
      ?auto_59486 - DIRECTION
      ?auto_59487 - MODE
    )
    :vars
    (
      ?auto_59489 - INSTRUMENT
      ?auto_59493 - SATELLITE
      ?auto_59495 - DIRECTION
      ?auto_59488 - INSTRUMENT
      ?auto_59494 - INSTRUMENT
      ?auto_59490 - INSTRUMENT
      ?auto_59491 - INSTRUMENT
      ?auto_59492 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_59481 ?auto_59478 ) ) ( not ( = ?auto_59482 ?auto_59478 ) ) ( not ( = ?auto_59482 ?auto_59481 ) ) ( not ( = ?auto_59484 ?auto_59478 ) ) ( not ( = ?auto_59484 ?auto_59481 ) ) ( not ( = ?auto_59484 ?auto_59482 ) ) ( not ( = ?auto_59486 ?auto_59478 ) ) ( not ( = ?auto_59486 ?auto_59481 ) ) ( not ( = ?auto_59486 ?auto_59482 ) ) ( not ( = ?auto_59486 ?auto_59484 ) ) ( ON_BOARD ?auto_59489 ?auto_59493 ) ( SUPPORTS ?auto_59489 ?auto_59480 ) ( not ( = ?auto_59481 ?auto_59495 ) ) ( CALIBRATION_TARGET ?auto_59489 ?auto_59495 ) ( not ( = ?auto_59495 ?auto_59482 ) ) ( ON_BOARD ?auto_59488 ?auto_59493 ) ( not ( = ?auto_59489 ?auto_59488 ) ) ( SUPPORTS ?auto_59488 ?auto_59483 ) ( CALIBRATION_TARGET ?auto_59488 ?auto_59495 ) ( not ( = ?auto_59495 ?auto_59486 ) ) ( ON_BOARD ?auto_59494 ?auto_59493 ) ( not ( = ?auto_59488 ?auto_59494 ) ) ( SUPPORTS ?auto_59494 ?auto_59487 ) ( CALIBRATION_TARGET ?auto_59494 ?auto_59495 ) ( not ( = ?auto_59495 ?auto_59484 ) ) ( ON_BOARD ?auto_59490 ?auto_59493 ) ( not ( = ?auto_59494 ?auto_59490 ) ) ( SUPPORTS ?auto_59490 ?auto_59485 ) ( CALIBRATION_TARGET ?auto_59490 ?auto_59495 ) ( not ( = ?auto_59495 ?auto_59478 ) ) ( ON_BOARD ?auto_59491 ?auto_59493 ) ( not ( = ?auto_59490 ?auto_59491 ) ) ( SUPPORTS ?auto_59491 ?auto_59479 ) ( CALIBRATION_TARGET ?auto_59491 ?auto_59495 ) ( POWER_AVAIL ?auto_59493 ) ( POINTING ?auto_59493 ?auto_59492 ) ( not ( = ?auto_59495 ?auto_59492 ) ) ( not ( = ?auto_59478 ?auto_59492 ) ) ( not ( = ?auto_59479 ?auto_59485 ) ) ( not ( = ?auto_59484 ?auto_59492 ) ) ( not ( = ?auto_59479 ?auto_59487 ) ) ( not ( = ?auto_59485 ?auto_59487 ) ) ( not ( = ?auto_59486 ?auto_59492 ) ) ( not ( = ?auto_59494 ?auto_59491 ) ) ( not ( = ?auto_59479 ?auto_59483 ) ) ( not ( = ?auto_59485 ?auto_59483 ) ) ( not ( = ?auto_59487 ?auto_59483 ) ) ( not ( = ?auto_59482 ?auto_59492 ) ) ( not ( = ?auto_59488 ?auto_59490 ) ) ( not ( = ?auto_59488 ?auto_59491 ) ) ( not ( = ?auto_59479 ?auto_59480 ) ) ( not ( = ?auto_59485 ?auto_59480 ) ) ( not ( = ?auto_59487 ?auto_59480 ) ) ( not ( = ?auto_59483 ?auto_59480 ) ) ( not ( = ?auto_59481 ?auto_59492 ) ) ( not ( = ?auto_59489 ?auto_59494 ) ) ( not ( = ?auto_59489 ?auto_59490 ) ) ( not ( = ?auto_59489 ?auto_59491 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_59478 ?auto_59479 ?auto_59484 ?auto_59485 ?auto_59486 ?auto_59487 ?auto_59481 ?auto_59480 ?auto_59482 ?auto_59483 )
      ( GET-5IMAGE-VERIFY ?auto_59478 ?auto_59479 ?auto_59481 ?auto_59480 ?auto_59482 ?auto_59483 ?auto_59484 ?auto_59485 ?auto_59486 ?auto_59487 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_59556 - DIRECTION
      ?auto_59557 - MODE
      ?auto_59559 - DIRECTION
      ?auto_59558 - MODE
      ?auto_59560 - DIRECTION
      ?auto_59561 - MODE
      ?auto_59562 - DIRECTION
      ?auto_59563 - MODE
      ?auto_59564 - DIRECTION
      ?auto_59565 - MODE
    )
    :vars
    (
      ?auto_59567 - INSTRUMENT
      ?auto_59571 - SATELLITE
      ?auto_59573 - DIRECTION
      ?auto_59566 - INSTRUMENT
      ?auto_59572 - INSTRUMENT
      ?auto_59568 - INSTRUMENT
      ?auto_59569 - INSTRUMENT
      ?auto_59570 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_59559 ?auto_59556 ) ) ( not ( = ?auto_59560 ?auto_59556 ) ) ( not ( = ?auto_59560 ?auto_59559 ) ) ( not ( = ?auto_59562 ?auto_59556 ) ) ( not ( = ?auto_59562 ?auto_59559 ) ) ( not ( = ?auto_59562 ?auto_59560 ) ) ( not ( = ?auto_59564 ?auto_59556 ) ) ( not ( = ?auto_59564 ?auto_59559 ) ) ( not ( = ?auto_59564 ?auto_59560 ) ) ( not ( = ?auto_59564 ?auto_59562 ) ) ( ON_BOARD ?auto_59567 ?auto_59571 ) ( SUPPORTS ?auto_59567 ?auto_59558 ) ( not ( = ?auto_59559 ?auto_59573 ) ) ( CALIBRATION_TARGET ?auto_59567 ?auto_59573 ) ( not ( = ?auto_59573 ?auto_59560 ) ) ( ON_BOARD ?auto_59566 ?auto_59571 ) ( not ( = ?auto_59567 ?auto_59566 ) ) ( SUPPORTS ?auto_59566 ?auto_59561 ) ( CALIBRATION_TARGET ?auto_59566 ?auto_59573 ) ( not ( = ?auto_59573 ?auto_59562 ) ) ( ON_BOARD ?auto_59572 ?auto_59571 ) ( not ( = ?auto_59566 ?auto_59572 ) ) ( SUPPORTS ?auto_59572 ?auto_59563 ) ( CALIBRATION_TARGET ?auto_59572 ?auto_59573 ) ( not ( = ?auto_59573 ?auto_59564 ) ) ( ON_BOARD ?auto_59568 ?auto_59571 ) ( not ( = ?auto_59572 ?auto_59568 ) ) ( SUPPORTS ?auto_59568 ?auto_59565 ) ( CALIBRATION_TARGET ?auto_59568 ?auto_59573 ) ( not ( = ?auto_59573 ?auto_59556 ) ) ( ON_BOARD ?auto_59569 ?auto_59571 ) ( not ( = ?auto_59568 ?auto_59569 ) ) ( SUPPORTS ?auto_59569 ?auto_59557 ) ( CALIBRATION_TARGET ?auto_59569 ?auto_59573 ) ( POWER_AVAIL ?auto_59571 ) ( POINTING ?auto_59571 ?auto_59570 ) ( not ( = ?auto_59573 ?auto_59570 ) ) ( not ( = ?auto_59556 ?auto_59570 ) ) ( not ( = ?auto_59557 ?auto_59565 ) ) ( not ( = ?auto_59564 ?auto_59570 ) ) ( not ( = ?auto_59557 ?auto_59563 ) ) ( not ( = ?auto_59565 ?auto_59563 ) ) ( not ( = ?auto_59562 ?auto_59570 ) ) ( not ( = ?auto_59572 ?auto_59569 ) ) ( not ( = ?auto_59557 ?auto_59561 ) ) ( not ( = ?auto_59565 ?auto_59561 ) ) ( not ( = ?auto_59563 ?auto_59561 ) ) ( not ( = ?auto_59560 ?auto_59570 ) ) ( not ( = ?auto_59566 ?auto_59568 ) ) ( not ( = ?auto_59566 ?auto_59569 ) ) ( not ( = ?auto_59557 ?auto_59558 ) ) ( not ( = ?auto_59565 ?auto_59558 ) ) ( not ( = ?auto_59563 ?auto_59558 ) ) ( not ( = ?auto_59561 ?auto_59558 ) ) ( not ( = ?auto_59559 ?auto_59570 ) ) ( not ( = ?auto_59567 ?auto_59572 ) ) ( not ( = ?auto_59567 ?auto_59568 ) ) ( not ( = ?auto_59567 ?auto_59569 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_59556 ?auto_59557 ?auto_59564 ?auto_59565 ?auto_59562 ?auto_59563 ?auto_59559 ?auto_59558 ?auto_59560 ?auto_59561 )
      ( GET-5IMAGE-VERIFY ?auto_59556 ?auto_59557 ?auto_59559 ?auto_59558 ?auto_59560 ?auto_59561 ?auto_59562 ?auto_59563 ?auto_59564 ?auto_59565 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_60832 - DIRECTION
      ?auto_60833 - MODE
      ?auto_60835 - DIRECTION
      ?auto_60834 - MODE
      ?auto_60836 - DIRECTION
      ?auto_60837 - MODE
      ?auto_60838 - DIRECTION
      ?auto_60839 - MODE
      ?auto_60840 - DIRECTION
      ?auto_60841 - MODE
    )
    :vars
    (
      ?auto_60843 - INSTRUMENT
      ?auto_60847 - SATELLITE
      ?auto_60849 - DIRECTION
      ?auto_60842 - INSTRUMENT
      ?auto_60848 - INSTRUMENT
      ?auto_60844 - INSTRUMENT
      ?auto_60845 - INSTRUMENT
      ?auto_60846 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_60835 ?auto_60832 ) ) ( not ( = ?auto_60836 ?auto_60832 ) ) ( not ( = ?auto_60836 ?auto_60835 ) ) ( not ( = ?auto_60838 ?auto_60832 ) ) ( not ( = ?auto_60838 ?auto_60835 ) ) ( not ( = ?auto_60838 ?auto_60836 ) ) ( not ( = ?auto_60840 ?auto_60832 ) ) ( not ( = ?auto_60840 ?auto_60835 ) ) ( not ( = ?auto_60840 ?auto_60836 ) ) ( not ( = ?auto_60840 ?auto_60838 ) ) ( ON_BOARD ?auto_60843 ?auto_60847 ) ( SUPPORTS ?auto_60843 ?auto_60841 ) ( not ( = ?auto_60840 ?auto_60849 ) ) ( CALIBRATION_TARGET ?auto_60843 ?auto_60849 ) ( not ( = ?auto_60849 ?auto_60838 ) ) ( ON_BOARD ?auto_60842 ?auto_60847 ) ( not ( = ?auto_60843 ?auto_60842 ) ) ( SUPPORTS ?auto_60842 ?auto_60839 ) ( CALIBRATION_TARGET ?auto_60842 ?auto_60849 ) ( not ( = ?auto_60849 ?auto_60836 ) ) ( ON_BOARD ?auto_60848 ?auto_60847 ) ( not ( = ?auto_60842 ?auto_60848 ) ) ( SUPPORTS ?auto_60848 ?auto_60837 ) ( CALIBRATION_TARGET ?auto_60848 ?auto_60849 ) ( not ( = ?auto_60849 ?auto_60832 ) ) ( ON_BOARD ?auto_60844 ?auto_60847 ) ( not ( = ?auto_60848 ?auto_60844 ) ) ( SUPPORTS ?auto_60844 ?auto_60833 ) ( CALIBRATION_TARGET ?auto_60844 ?auto_60849 ) ( not ( = ?auto_60849 ?auto_60835 ) ) ( ON_BOARD ?auto_60845 ?auto_60847 ) ( not ( = ?auto_60844 ?auto_60845 ) ) ( SUPPORTS ?auto_60845 ?auto_60834 ) ( CALIBRATION_TARGET ?auto_60845 ?auto_60849 ) ( POWER_AVAIL ?auto_60847 ) ( POINTING ?auto_60847 ?auto_60846 ) ( not ( = ?auto_60849 ?auto_60846 ) ) ( not ( = ?auto_60835 ?auto_60846 ) ) ( not ( = ?auto_60834 ?auto_60833 ) ) ( not ( = ?auto_60832 ?auto_60846 ) ) ( not ( = ?auto_60834 ?auto_60837 ) ) ( not ( = ?auto_60833 ?auto_60837 ) ) ( not ( = ?auto_60836 ?auto_60846 ) ) ( not ( = ?auto_60848 ?auto_60845 ) ) ( not ( = ?auto_60834 ?auto_60839 ) ) ( not ( = ?auto_60833 ?auto_60839 ) ) ( not ( = ?auto_60837 ?auto_60839 ) ) ( not ( = ?auto_60838 ?auto_60846 ) ) ( not ( = ?auto_60842 ?auto_60844 ) ) ( not ( = ?auto_60842 ?auto_60845 ) ) ( not ( = ?auto_60834 ?auto_60841 ) ) ( not ( = ?auto_60833 ?auto_60841 ) ) ( not ( = ?auto_60837 ?auto_60841 ) ) ( not ( = ?auto_60839 ?auto_60841 ) ) ( not ( = ?auto_60840 ?auto_60846 ) ) ( not ( = ?auto_60843 ?auto_60848 ) ) ( not ( = ?auto_60843 ?auto_60844 ) ) ( not ( = ?auto_60843 ?auto_60845 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_60835 ?auto_60834 ?auto_60832 ?auto_60833 ?auto_60836 ?auto_60837 ?auto_60840 ?auto_60841 ?auto_60838 ?auto_60839 )
      ( GET-5IMAGE-VERIFY ?auto_60832 ?auto_60833 ?auto_60835 ?auto_60834 ?auto_60836 ?auto_60837 ?auto_60838 ?auto_60839 ?auto_60840 ?auto_60841 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_60910 - DIRECTION
      ?auto_60911 - MODE
      ?auto_60913 - DIRECTION
      ?auto_60912 - MODE
      ?auto_60914 - DIRECTION
      ?auto_60915 - MODE
      ?auto_60916 - DIRECTION
      ?auto_60917 - MODE
      ?auto_60918 - DIRECTION
      ?auto_60919 - MODE
    )
    :vars
    (
      ?auto_60921 - INSTRUMENT
      ?auto_60925 - SATELLITE
      ?auto_60927 - DIRECTION
      ?auto_60920 - INSTRUMENT
      ?auto_60926 - INSTRUMENT
      ?auto_60922 - INSTRUMENT
      ?auto_60923 - INSTRUMENT
      ?auto_60924 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_60913 ?auto_60910 ) ) ( not ( = ?auto_60914 ?auto_60910 ) ) ( not ( = ?auto_60914 ?auto_60913 ) ) ( not ( = ?auto_60916 ?auto_60910 ) ) ( not ( = ?auto_60916 ?auto_60913 ) ) ( not ( = ?auto_60916 ?auto_60914 ) ) ( not ( = ?auto_60918 ?auto_60910 ) ) ( not ( = ?auto_60918 ?auto_60913 ) ) ( not ( = ?auto_60918 ?auto_60914 ) ) ( not ( = ?auto_60918 ?auto_60916 ) ) ( ON_BOARD ?auto_60921 ?auto_60925 ) ( SUPPORTS ?auto_60921 ?auto_60917 ) ( not ( = ?auto_60916 ?auto_60927 ) ) ( CALIBRATION_TARGET ?auto_60921 ?auto_60927 ) ( not ( = ?auto_60927 ?auto_60918 ) ) ( ON_BOARD ?auto_60920 ?auto_60925 ) ( not ( = ?auto_60921 ?auto_60920 ) ) ( SUPPORTS ?auto_60920 ?auto_60919 ) ( CALIBRATION_TARGET ?auto_60920 ?auto_60927 ) ( not ( = ?auto_60927 ?auto_60914 ) ) ( ON_BOARD ?auto_60926 ?auto_60925 ) ( not ( = ?auto_60920 ?auto_60926 ) ) ( SUPPORTS ?auto_60926 ?auto_60915 ) ( CALIBRATION_TARGET ?auto_60926 ?auto_60927 ) ( not ( = ?auto_60927 ?auto_60910 ) ) ( ON_BOARD ?auto_60922 ?auto_60925 ) ( not ( = ?auto_60926 ?auto_60922 ) ) ( SUPPORTS ?auto_60922 ?auto_60911 ) ( CALIBRATION_TARGET ?auto_60922 ?auto_60927 ) ( not ( = ?auto_60927 ?auto_60913 ) ) ( ON_BOARD ?auto_60923 ?auto_60925 ) ( not ( = ?auto_60922 ?auto_60923 ) ) ( SUPPORTS ?auto_60923 ?auto_60912 ) ( CALIBRATION_TARGET ?auto_60923 ?auto_60927 ) ( POWER_AVAIL ?auto_60925 ) ( POINTING ?auto_60925 ?auto_60924 ) ( not ( = ?auto_60927 ?auto_60924 ) ) ( not ( = ?auto_60913 ?auto_60924 ) ) ( not ( = ?auto_60912 ?auto_60911 ) ) ( not ( = ?auto_60910 ?auto_60924 ) ) ( not ( = ?auto_60912 ?auto_60915 ) ) ( not ( = ?auto_60911 ?auto_60915 ) ) ( not ( = ?auto_60914 ?auto_60924 ) ) ( not ( = ?auto_60926 ?auto_60923 ) ) ( not ( = ?auto_60912 ?auto_60919 ) ) ( not ( = ?auto_60911 ?auto_60919 ) ) ( not ( = ?auto_60915 ?auto_60919 ) ) ( not ( = ?auto_60918 ?auto_60924 ) ) ( not ( = ?auto_60920 ?auto_60922 ) ) ( not ( = ?auto_60920 ?auto_60923 ) ) ( not ( = ?auto_60912 ?auto_60917 ) ) ( not ( = ?auto_60911 ?auto_60917 ) ) ( not ( = ?auto_60915 ?auto_60917 ) ) ( not ( = ?auto_60919 ?auto_60917 ) ) ( not ( = ?auto_60916 ?auto_60924 ) ) ( not ( = ?auto_60921 ?auto_60926 ) ) ( not ( = ?auto_60921 ?auto_60922 ) ) ( not ( = ?auto_60921 ?auto_60923 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_60913 ?auto_60912 ?auto_60910 ?auto_60911 ?auto_60914 ?auto_60915 ?auto_60916 ?auto_60917 ?auto_60918 ?auto_60919 )
      ( GET-5IMAGE-VERIFY ?auto_60910 ?auto_60911 ?auto_60913 ?auto_60912 ?auto_60914 ?auto_60915 ?auto_60916 ?auto_60917 ?auto_60918 ?auto_60919 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_60988 - DIRECTION
      ?auto_60989 - MODE
      ?auto_60991 - DIRECTION
      ?auto_60990 - MODE
      ?auto_60992 - DIRECTION
      ?auto_60993 - MODE
      ?auto_60994 - DIRECTION
      ?auto_60995 - MODE
      ?auto_60996 - DIRECTION
      ?auto_60997 - MODE
    )
    :vars
    (
      ?auto_60999 - INSTRUMENT
      ?auto_61003 - SATELLITE
      ?auto_61005 - DIRECTION
      ?auto_60998 - INSTRUMENT
      ?auto_61004 - INSTRUMENT
      ?auto_61000 - INSTRUMENT
      ?auto_61001 - INSTRUMENT
      ?auto_61002 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_60991 ?auto_60988 ) ) ( not ( = ?auto_60992 ?auto_60988 ) ) ( not ( = ?auto_60992 ?auto_60991 ) ) ( not ( = ?auto_60994 ?auto_60988 ) ) ( not ( = ?auto_60994 ?auto_60991 ) ) ( not ( = ?auto_60994 ?auto_60992 ) ) ( not ( = ?auto_60996 ?auto_60988 ) ) ( not ( = ?auto_60996 ?auto_60991 ) ) ( not ( = ?auto_60996 ?auto_60992 ) ) ( not ( = ?auto_60996 ?auto_60994 ) ) ( ON_BOARD ?auto_60999 ?auto_61003 ) ( SUPPORTS ?auto_60999 ?auto_60997 ) ( not ( = ?auto_60996 ?auto_61005 ) ) ( CALIBRATION_TARGET ?auto_60999 ?auto_61005 ) ( not ( = ?auto_61005 ?auto_60992 ) ) ( ON_BOARD ?auto_60998 ?auto_61003 ) ( not ( = ?auto_60999 ?auto_60998 ) ) ( SUPPORTS ?auto_60998 ?auto_60993 ) ( CALIBRATION_TARGET ?auto_60998 ?auto_61005 ) ( not ( = ?auto_61005 ?auto_60994 ) ) ( ON_BOARD ?auto_61004 ?auto_61003 ) ( not ( = ?auto_60998 ?auto_61004 ) ) ( SUPPORTS ?auto_61004 ?auto_60995 ) ( CALIBRATION_TARGET ?auto_61004 ?auto_61005 ) ( not ( = ?auto_61005 ?auto_60988 ) ) ( ON_BOARD ?auto_61000 ?auto_61003 ) ( not ( = ?auto_61004 ?auto_61000 ) ) ( SUPPORTS ?auto_61000 ?auto_60989 ) ( CALIBRATION_TARGET ?auto_61000 ?auto_61005 ) ( not ( = ?auto_61005 ?auto_60991 ) ) ( ON_BOARD ?auto_61001 ?auto_61003 ) ( not ( = ?auto_61000 ?auto_61001 ) ) ( SUPPORTS ?auto_61001 ?auto_60990 ) ( CALIBRATION_TARGET ?auto_61001 ?auto_61005 ) ( POWER_AVAIL ?auto_61003 ) ( POINTING ?auto_61003 ?auto_61002 ) ( not ( = ?auto_61005 ?auto_61002 ) ) ( not ( = ?auto_60991 ?auto_61002 ) ) ( not ( = ?auto_60990 ?auto_60989 ) ) ( not ( = ?auto_60988 ?auto_61002 ) ) ( not ( = ?auto_60990 ?auto_60995 ) ) ( not ( = ?auto_60989 ?auto_60995 ) ) ( not ( = ?auto_60994 ?auto_61002 ) ) ( not ( = ?auto_61004 ?auto_61001 ) ) ( not ( = ?auto_60990 ?auto_60993 ) ) ( not ( = ?auto_60989 ?auto_60993 ) ) ( not ( = ?auto_60995 ?auto_60993 ) ) ( not ( = ?auto_60992 ?auto_61002 ) ) ( not ( = ?auto_60998 ?auto_61000 ) ) ( not ( = ?auto_60998 ?auto_61001 ) ) ( not ( = ?auto_60990 ?auto_60997 ) ) ( not ( = ?auto_60989 ?auto_60997 ) ) ( not ( = ?auto_60995 ?auto_60997 ) ) ( not ( = ?auto_60993 ?auto_60997 ) ) ( not ( = ?auto_60996 ?auto_61002 ) ) ( not ( = ?auto_60999 ?auto_61004 ) ) ( not ( = ?auto_60999 ?auto_61000 ) ) ( not ( = ?auto_60999 ?auto_61001 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_60991 ?auto_60990 ?auto_60988 ?auto_60989 ?auto_60994 ?auto_60995 ?auto_60996 ?auto_60997 ?auto_60992 ?auto_60993 )
      ( GET-5IMAGE-VERIFY ?auto_60988 ?auto_60989 ?auto_60991 ?auto_60990 ?auto_60992 ?auto_60993 ?auto_60994 ?auto_60995 ?auto_60996 ?auto_60997 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_61066 - DIRECTION
      ?auto_61067 - MODE
      ?auto_61069 - DIRECTION
      ?auto_61068 - MODE
      ?auto_61070 - DIRECTION
      ?auto_61071 - MODE
      ?auto_61072 - DIRECTION
      ?auto_61073 - MODE
      ?auto_61074 - DIRECTION
      ?auto_61075 - MODE
    )
    :vars
    (
      ?auto_61077 - INSTRUMENT
      ?auto_61081 - SATELLITE
      ?auto_61083 - DIRECTION
      ?auto_61076 - INSTRUMENT
      ?auto_61082 - INSTRUMENT
      ?auto_61078 - INSTRUMENT
      ?auto_61079 - INSTRUMENT
      ?auto_61080 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61069 ?auto_61066 ) ) ( not ( = ?auto_61070 ?auto_61066 ) ) ( not ( = ?auto_61070 ?auto_61069 ) ) ( not ( = ?auto_61072 ?auto_61066 ) ) ( not ( = ?auto_61072 ?auto_61069 ) ) ( not ( = ?auto_61072 ?auto_61070 ) ) ( not ( = ?auto_61074 ?auto_61066 ) ) ( not ( = ?auto_61074 ?auto_61069 ) ) ( not ( = ?auto_61074 ?auto_61070 ) ) ( not ( = ?auto_61074 ?auto_61072 ) ) ( ON_BOARD ?auto_61077 ?auto_61081 ) ( SUPPORTS ?auto_61077 ?auto_61073 ) ( not ( = ?auto_61072 ?auto_61083 ) ) ( CALIBRATION_TARGET ?auto_61077 ?auto_61083 ) ( not ( = ?auto_61083 ?auto_61070 ) ) ( ON_BOARD ?auto_61076 ?auto_61081 ) ( not ( = ?auto_61077 ?auto_61076 ) ) ( SUPPORTS ?auto_61076 ?auto_61071 ) ( CALIBRATION_TARGET ?auto_61076 ?auto_61083 ) ( not ( = ?auto_61083 ?auto_61074 ) ) ( ON_BOARD ?auto_61082 ?auto_61081 ) ( not ( = ?auto_61076 ?auto_61082 ) ) ( SUPPORTS ?auto_61082 ?auto_61075 ) ( CALIBRATION_TARGET ?auto_61082 ?auto_61083 ) ( not ( = ?auto_61083 ?auto_61066 ) ) ( ON_BOARD ?auto_61078 ?auto_61081 ) ( not ( = ?auto_61082 ?auto_61078 ) ) ( SUPPORTS ?auto_61078 ?auto_61067 ) ( CALIBRATION_TARGET ?auto_61078 ?auto_61083 ) ( not ( = ?auto_61083 ?auto_61069 ) ) ( ON_BOARD ?auto_61079 ?auto_61081 ) ( not ( = ?auto_61078 ?auto_61079 ) ) ( SUPPORTS ?auto_61079 ?auto_61068 ) ( CALIBRATION_TARGET ?auto_61079 ?auto_61083 ) ( POWER_AVAIL ?auto_61081 ) ( POINTING ?auto_61081 ?auto_61080 ) ( not ( = ?auto_61083 ?auto_61080 ) ) ( not ( = ?auto_61069 ?auto_61080 ) ) ( not ( = ?auto_61068 ?auto_61067 ) ) ( not ( = ?auto_61066 ?auto_61080 ) ) ( not ( = ?auto_61068 ?auto_61075 ) ) ( not ( = ?auto_61067 ?auto_61075 ) ) ( not ( = ?auto_61074 ?auto_61080 ) ) ( not ( = ?auto_61082 ?auto_61079 ) ) ( not ( = ?auto_61068 ?auto_61071 ) ) ( not ( = ?auto_61067 ?auto_61071 ) ) ( not ( = ?auto_61075 ?auto_61071 ) ) ( not ( = ?auto_61070 ?auto_61080 ) ) ( not ( = ?auto_61076 ?auto_61078 ) ) ( not ( = ?auto_61076 ?auto_61079 ) ) ( not ( = ?auto_61068 ?auto_61073 ) ) ( not ( = ?auto_61067 ?auto_61073 ) ) ( not ( = ?auto_61075 ?auto_61073 ) ) ( not ( = ?auto_61071 ?auto_61073 ) ) ( not ( = ?auto_61072 ?auto_61080 ) ) ( not ( = ?auto_61077 ?auto_61082 ) ) ( not ( = ?auto_61077 ?auto_61078 ) ) ( not ( = ?auto_61077 ?auto_61079 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_61069 ?auto_61068 ?auto_61066 ?auto_61067 ?auto_61074 ?auto_61075 ?auto_61072 ?auto_61073 ?auto_61070 ?auto_61071 )
      ( GET-5IMAGE-VERIFY ?auto_61066 ?auto_61067 ?auto_61069 ?auto_61068 ?auto_61070 ?auto_61071 ?auto_61072 ?auto_61073 ?auto_61074 ?auto_61075 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_61396 - DIRECTION
      ?auto_61397 - MODE
      ?auto_61399 - DIRECTION
      ?auto_61398 - MODE
      ?auto_61400 - DIRECTION
      ?auto_61401 - MODE
      ?auto_61402 - DIRECTION
      ?auto_61403 - MODE
      ?auto_61404 - DIRECTION
      ?auto_61405 - MODE
    )
    :vars
    (
      ?auto_61407 - INSTRUMENT
      ?auto_61411 - SATELLITE
      ?auto_61413 - DIRECTION
      ?auto_61406 - INSTRUMENT
      ?auto_61412 - INSTRUMENT
      ?auto_61408 - INSTRUMENT
      ?auto_61409 - INSTRUMENT
      ?auto_61410 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61399 ?auto_61396 ) ) ( not ( = ?auto_61400 ?auto_61396 ) ) ( not ( = ?auto_61400 ?auto_61399 ) ) ( not ( = ?auto_61402 ?auto_61396 ) ) ( not ( = ?auto_61402 ?auto_61399 ) ) ( not ( = ?auto_61402 ?auto_61400 ) ) ( not ( = ?auto_61404 ?auto_61396 ) ) ( not ( = ?auto_61404 ?auto_61399 ) ) ( not ( = ?auto_61404 ?auto_61400 ) ) ( not ( = ?auto_61404 ?auto_61402 ) ) ( ON_BOARD ?auto_61407 ?auto_61411 ) ( SUPPORTS ?auto_61407 ?auto_61401 ) ( not ( = ?auto_61400 ?auto_61413 ) ) ( CALIBRATION_TARGET ?auto_61407 ?auto_61413 ) ( not ( = ?auto_61413 ?auto_61404 ) ) ( ON_BOARD ?auto_61406 ?auto_61411 ) ( not ( = ?auto_61407 ?auto_61406 ) ) ( SUPPORTS ?auto_61406 ?auto_61405 ) ( CALIBRATION_TARGET ?auto_61406 ?auto_61413 ) ( not ( = ?auto_61413 ?auto_61402 ) ) ( ON_BOARD ?auto_61412 ?auto_61411 ) ( not ( = ?auto_61406 ?auto_61412 ) ) ( SUPPORTS ?auto_61412 ?auto_61403 ) ( CALIBRATION_TARGET ?auto_61412 ?auto_61413 ) ( not ( = ?auto_61413 ?auto_61396 ) ) ( ON_BOARD ?auto_61408 ?auto_61411 ) ( not ( = ?auto_61412 ?auto_61408 ) ) ( SUPPORTS ?auto_61408 ?auto_61397 ) ( CALIBRATION_TARGET ?auto_61408 ?auto_61413 ) ( not ( = ?auto_61413 ?auto_61399 ) ) ( ON_BOARD ?auto_61409 ?auto_61411 ) ( not ( = ?auto_61408 ?auto_61409 ) ) ( SUPPORTS ?auto_61409 ?auto_61398 ) ( CALIBRATION_TARGET ?auto_61409 ?auto_61413 ) ( POWER_AVAIL ?auto_61411 ) ( POINTING ?auto_61411 ?auto_61410 ) ( not ( = ?auto_61413 ?auto_61410 ) ) ( not ( = ?auto_61399 ?auto_61410 ) ) ( not ( = ?auto_61398 ?auto_61397 ) ) ( not ( = ?auto_61396 ?auto_61410 ) ) ( not ( = ?auto_61398 ?auto_61403 ) ) ( not ( = ?auto_61397 ?auto_61403 ) ) ( not ( = ?auto_61402 ?auto_61410 ) ) ( not ( = ?auto_61412 ?auto_61409 ) ) ( not ( = ?auto_61398 ?auto_61405 ) ) ( not ( = ?auto_61397 ?auto_61405 ) ) ( not ( = ?auto_61403 ?auto_61405 ) ) ( not ( = ?auto_61404 ?auto_61410 ) ) ( not ( = ?auto_61406 ?auto_61408 ) ) ( not ( = ?auto_61406 ?auto_61409 ) ) ( not ( = ?auto_61398 ?auto_61401 ) ) ( not ( = ?auto_61397 ?auto_61401 ) ) ( not ( = ?auto_61403 ?auto_61401 ) ) ( not ( = ?auto_61405 ?auto_61401 ) ) ( not ( = ?auto_61400 ?auto_61410 ) ) ( not ( = ?auto_61407 ?auto_61412 ) ) ( not ( = ?auto_61407 ?auto_61408 ) ) ( not ( = ?auto_61407 ?auto_61409 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_61399 ?auto_61398 ?auto_61396 ?auto_61397 ?auto_61402 ?auto_61403 ?auto_61400 ?auto_61401 ?auto_61404 ?auto_61405 )
      ( GET-5IMAGE-VERIFY ?auto_61396 ?auto_61397 ?auto_61399 ?auto_61398 ?auto_61400 ?auto_61401 ?auto_61402 ?auto_61403 ?auto_61404 ?auto_61405 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_61474 - DIRECTION
      ?auto_61475 - MODE
      ?auto_61477 - DIRECTION
      ?auto_61476 - MODE
      ?auto_61478 - DIRECTION
      ?auto_61479 - MODE
      ?auto_61480 - DIRECTION
      ?auto_61481 - MODE
      ?auto_61482 - DIRECTION
      ?auto_61483 - MODE
    )
    :vars
    (
      ?auto_61485 - INSTRUMENT
      ?auto_61489 - SATELLITE
      ?auto_61491 - DIRECTION
      ?auto_61484 - INSTRUMENT
      ?auto_61490 - INSTRUMENT
      ?auto_61486 - INSTRUMENT
      ?auto_61487 - INSTRUMENT
      ?auto_61488 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61477 ?auto_61474 ) ) ( not ( = ?auto_61478 ?auto_61474 ) ) ( not ( = ?auto_61478 ?auto_61477 ) ) ( not ( = ?auto_61480 ?auto_61474 ) ) ( not ( = ?auto_61480 ?auto_61477 ) ) ( not ( = ?auto_61480 ?auto_61478 ) ) ( not ( = ?auto_61482 ?auto_61474 ) ) ( not ( = ?auto_61482 ?auto_61477 ) ) ( not ( = ?auto_61482 ?auto_61478 ) ) ( not ( = ?auto_61482 ?auto_61480 ) ) ( ON_BOARD ?auto_61485 ?auto_61489 ) ( SUPPORTS ?auto_61485 ?auto_61479 ) ( not ( = ?auto_61478 ?auto_61491 ) ) ( CALIBRATION_TARGET ?auto_61485 ?auto_61491 ) ( not ( = ?auto_61491 ?auto_61480 ) ) ( ON_BOARD ?auto_61484 ?auto_61489 ) ( not ( = ?auto_61485 ?auto_61484 ) ) ( SUPPORTS ?auto_61484 ?auto_61481 ) ( CALIBRATION_TARGET ?auto_61484 ?auto_61491 ) ( not ( = ?auto_61491 ?auto_61482 ) ) ( ON_BOARD ?auto_61490 ?auto_61489 ) ( not ( = ?auto_61484 ?auto_61490 ) ) ( SUPPORTS ?auto_61490 ?auto_61483 ) ( CALIBRATION_TARGET ?auto_61490 ?auto_61491 ) ( not ( = ?auto_61491 ?auto_61474 ) ) ( ON_BOARD ?auto_61486 ?auto_61489 ) ( not ( = ?auto_61490 ?auto_61486 ) ) ( SUPPORTS ?auto_61486 ?auto_61475 ) ( CALIBRATION_TARGET ?auto_61486 ?auto_61491 ) ( not ( = ?auto_61491 ?auto_61477 ) ) ( ON_BOARD ?auto_61487 ?auto_61489 ) ( not ( = ?auto_61486 ?auto_61487 ) ) ( SUPPORTS ?auto_61487 ?auto_61476 ) ( CALIBRATION_TARGET ?auto_61487 ?auto_61491 ) ( POWER_AVAIL ?auto_61489 ) ( POINTING ?auto_61489 ?auto_61488 ) ( not ( = ?auto_61491 ?auto_61488 ) ) ( not ( = ?auto_61477 ?auto_61488 ) ) ( not ( = ?auto_61476 ?auto_61475 ) ) ( not ( = ?auto_61474 ?auto_61488 ) ) ( not ( = ?auto_61476 ?auto_61483 ) ) ( not ( = ?auto_61475 ?auto_61483 ) ) ( not ( = ?auto_61482 ?auto_61488 ) ) ( not ( = ?auto_61490 ?auto_61487 ) ) ( not ( = ?auto_61476 ?auto_61481 ) ) ( not ( = ?auto_61475 ?auto_61481 ) ) ( not ( = ?auto_61483 ?auto_61481 ) ) ( not ( = ?auto_61480 ?auto_61488 ) ) ( not ( = ?auto_61484 ?auto_61486 ) ) ( not ( = ?auto_61484 ?auto_61487 ) ) ( not ( = ?auto_61476 ?auto_61479 ) ) ( not ( = ?auto_61475 ?auto_61479 ) ) ( not ( = ?auto_61483 ?auto_61479 ) ) ( not ( = ?auto_61481 ?auto_61479 ) ) ( not ( = ?auto_61478 ?auto_61488 ) ) ( not ( = ?auto_61485 ?auto_61490 ) ) ( not ( = ?auto_61485 ?auto_61486 ) ) ( not ( = ?auto_61485 ?auto_61487 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_61477 ?auto_61476 ?auto_61474 ?auto_61475 ?auto_61482 ?auto_61483 ?auto_61478 ?auto_61479 ?auto_61480 ?auto_61481 )
      ( GET-5IMAGE-VERIFY ?auto_61474 ?auto_61475 ?auto_61477 ?auto_61476 ?auto_61478 ?auto_61479 ?auto_61480 ?auto_61481 ?auto_61482 ?auto_61483 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_63018 - DIRECTION
      ?auto_63019 - MODE
      ?auto_63021 - DIRECTION
      ?auto_63020 - MODE
      ?auto_63022 - DIRECTION
      ?auto_63023 - MODE
      ?auto_63024 - DIRECTION
      ?auto_63025 - MODE
      ?auto_63026 - DIRECTION
      ?auto_63027 - MODE
    )
    :vars
    (
      ?auto_63029 - INSTRUMENT
      ?auto_63033 - SATELLITE
      ?auto_63035 - DIRECTION
      ?auto_63028 - INSTRUMENT
      ?auto_63034 - INSTRUMENT
      ?auto_63030 - INSTRUMENT
      ?auto_63031 - INSTRUMENT
      ?auto_63032 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_63021 ?auto_63018 ) ) ( not ( = ?auto_63022 ?auto_63018 ) ) ( not ( = ?auto_63022 ?auto_63021 ) ) ( not ( = ?auto_63024 ?auto_63018 ) ) ( not ( = ?auto_63024 ?auto_63021 ) ) ( not ( = ?auto_63024 ?auto_63022 ) ) ( not ( = ?auto_63026 ?auto_63018 ) ) ( not ( = ?auto_63026 ?auto_63021 ) ) ( not ( = ?auto_63026 ?auto_63022 ) ) ( not ( = ?auto_63026 ?auto_63024 ) ) ( ON_BOARD ?auto_63029 ?auto_63033 ) ( SUPPORTS ?auto_63029 ?auto_63027 ) ( not ( = ?auto_63026 ?auto_63035 ) ) ( CALIBRATION_TARGET ?auto_63029 ?auto_63035 ) ( not ( = ?auto_63035 ?auto_63024 ) ) ( ON_BOARD ?auto_63028 ?auto_63033 ) ( not ( = ?auto_63029 ?auto_63028 ) ) ( SUPPORTS ?auto_63028 ?auto_63025 ) ( CALIBRATION_TARGET ?auto_63028 ?auto_63035 ) ( not ( = ?auto_63035 ?auto_63021 ) ) ( ON_BOARD ?auto_63034 ?auto_63033 ) ( not ( = ?auto_63028 ?auto_63034 ) ) ( SUPPORTS ?auto_63034 ?auto_63020 ) ( CALIBRATION_TARGET ?auto_63034 ?auto_63035 ) ( not ( = ?auto_63035 ?auto_63018 ) ) ( ON_BOARD ?auto_63030 ?auto_63033 ) ( not ( = ?auto_63034 ?auto_63030 ) ) ( SUPPORTS ?auto_63030 ?auto_63019 ) ( CALIBRATION_TARGET ?auto_63030 ?auto_63035 ) ( not ( = ?auto_63035 ?auto_63022 ) ) ( ON_BOARD ?auto_63031 ?auto_63033 ) ( not ( = ?auto_63030 ?auto_63031 ) ) ( SUPPORTS ?auto_63031 ?auto_63023 ) ( CALIBRATION_TARGET ?auto_63031 ?auto_63035 ) ( POWER_AVAIL ?auto_63033 ) ( POINTING ?auto_63033 ?auto_63032 ) ( not ( = ?auto_63035 ?auto_63032 ) ) ( not ( = ?auto_63022 ?auto_63032 ) ) ( not ( = ?auto_63023 ?auto_63019 ) ) ( not ( = ?auto_63018 ?auto_63032 ) ) ( not ( = ?auto_63023 ?auto_63020 ) ) ( not ( = ?auto_63019 ?auto_63020 ) ) ( not ( = ?auto_63021 ?auto_63032 ) ) ( not ( = ?auto_63034 ?auto_63031 ) ) ( not ( = ?auto_63023 ?auto_63025 ) ) ( not ( = ?auto_63019 ?auto_63025 ) ) ( not ( = ?auto_63020 ?auto_63025 ) ) ( not ( = ?auto_63024 ?auto_63032 ) ) ( not ( = ?auto_63028 ?auto_63030 ) ) ( not ( = ?auto_63028 ?auto_63031 ) ) ( not ( = ?auto_63023 ?auto_63027 ) ) ( not ( = ?auto_63019 ?auto_63027 ) ) ( not ( = ?auto_63020 ?auto_63027 ) ) ( not ( = ?auto_63025 ?auto_63027 ) ) ( not ( = ?auto_63026 ?auto_63032 ) ) ( not ( = ?auto_63029 ?auto_63034 ) ) ( not ( = ?auto_63029 ?auto_63030 ) ) ( not ( = ?auto_63029 ?auto_63031 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_63022 ?auto_63023 ?auto_63018 ?auto_63019 ?auto_63021 ?auto_63020 ?auto_63026 ?auto_63027 ?auto_63024 ?auto_63025 )
      ( GET-5IMAGE-VERIFY ?auto_63018 ?auto_63019 ?auto_63021 ?auto_63020 ?auto_63022 ?auto_63023 ?auto_63024 ?auto_63025 ?auto_63026 ?auto_63027 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_63096 - DIRECTION
      ?auto_63097 - MODE
      ?auto_63099 - DIRECTION
      ?auto_63098 - MODE
      ?auto_63100 - DIRECTION
      ?auto_63101 - MODE
      ?auto_63102 - DIRECTION
      ?auto_63103 - MODE
      ?auto_63104 - DIRECTION
      ?auto_63105 - MODE
    )
    :vars
    (
      ?auto_63107 - INSTRUMENT
      ?auto_63111 - SATELLITE
      ?auto_63113 - DIRECTION
      ?auto_63106 - INSTRUMENT
      ?auto_63112 - INSTRUMENT
      ?auto_63108 - INSTRUMENT
      ?auto_63109 - INSTRUMENT
      ?auto_63110 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_63099 ?auto_63096 ) ) ( not ( = ?auto_63100 ?auto_63096 ) ) ( not ( = ?auto_63100 ?auto_63099 ) ) ( not ( = ?auto_63102 ?auto_63096 ) ) ( not ( = ?auto_63102 ?auto_63099 ) ) ( not ( = ?auto_63102 ?auto_63100 ) ) ( not ( = ?auto_63104 ?auto_63096 ) ) ( not ( = ?auto_63104 ?auto_63099 ) ) ( not ( = ?auto_63104 ?auto_63100 ) ) ( not ( = ?auto_63104 ?auto_63102 ) ) ( ON_BOARD ?auto_63107 ?auto_63111 ) ( SUPPORTS ?auto_63107 ?auto_63103 ) ( not ( = ?auto_63102 ?auto_63113 ) ) ( CALIBRATION_TARGET ?auto_63107 ?auto_63113 ) ( not ( = ?auto_63113 ?auto_63104 ) ) ( ON_BOARD ?auto_63106 ?auto_63111 ) ( not ( = ?auto_63107 ?auto_63106 ) ) ( SUPPORTS ?auto_63106 ?auto_63105 ) ( CALIBRATION_TARGET ?auto_63106 ?auto_63113 ) ( not ( = ?auto_63113 ?auto_63099 ) ) ( ON_BOARD ?auto_63112 ?auto_63111 ) ( not ( = ?auto_63106 ?auto_63112 ) ) ( SUPPORTS ?auto_63112 ?auto_63098 ) ( CALIBRATION_TARGET ?auto_63112 ?auto_63113 ) ( not ( = ?auto_63113 ?auto_63096 ) ) ( ON_BOARD ?auto_63108 ?auto_63111 ) ( not ( = ?auto_63112 ?auto_63108 ) ) ( SUPPORTS ?auto_63108 ?auto_63097 ) ( CALIBRATION_TARGET ?auto_63108 ?auto_63113 ) ( not ( = ?auto_63113 ?auto_63100 ) ) ( ON_BOARD ?auto_63109 ?auto_63111 ) ( not ( = ?auto_63108 ?auto_63109 ) ) ( SUPPORTS ?auto_63109 ?auto_63101 ) ( CALIBRATION_TARGET ?auto_63109 ?auto_63113 ) ( POWER_AVAIL ?auto_63111 ) ( POINTING ?auto_63111 ?auto_63110 ) ( not ( = ?auto_63113 ?auto_63110 ) ) ( not ( = ?auto_63100 ?auto_63110 ) ) ( not ( = ?auto_63101 ?auto_63097 ) ) ( not ( = ?auto_63096 ?auto_63110 ) ) ( not ( = ?auto_63101 ?auto_63098 ) ) ( not ( = ?auto_63097 ?auto_63098 ) ) ( not ( = ?auto_63099 ?auto_63110 ) ) ( not ( = ?auto_63112 ?auto_63109 ) ) ( not ( = ?auto_63101 ?auto_63105 ) ) ( not ( = ?auto_63097 ?auto_63105 ) ) ( not ( = ?auto_63098 ?auto_63105 ) ) ( not ( = ?auto_63104 ?auto_63110 ) ) ( not ( = ?auto_63106 ?auto_63108 ) ) ( not ( = ?auto_63106 ?auto_63109 ) ) ( not ( = ?auto_63101 ?auto_63103 ) ) ( not ( = ?auto_63097 ?auto_63103 ) ) ( not ( = ?auto_63098 ?auto_63103 ) ) ( not ( = ?auto_63105 ?auto_63103 ) ) ( not ( = ?auto_63102 ?auto_63110 ) ) ( not ( = ?auto_63107 ?auto_63112 ) ) ( not ( = ?auto_63107 ?auto_63108 ) ) ( not ( = ?auto_63107 ?auto_63109 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_63100 ?auto_63101 ?auto_63096 ?auto_63097 ?auto_63099 ?auto_63098 ?auto_63102 ?auto_63103 ?auto_63104 ?auto_63105 )
      ( GET-5IMAGE-VERIFY ?auto_63096 ?auto_63097 ?auto_63099 ?auto_63098 ?auto_63100 ?auto_63101 ?auto_63102 ?auto_63103 ?auto_63104 ?auto_63105 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_63514 - DIRECTION
      ?auto_63515 - MODE
      ?auto_63517 - DIRECTION
      ?auto_63516 - MODE
      ?auto_63518 - DIRECTION
      ?auto_63519 - MODE
      ?auto_63520 - DIRECTION
      ?auto_63521 - MODE
      ?auto_63522 - DIRECTION
      ?auto_63523 - MODE
    )
    :vars
    (
      ?auto_63525 - INSTRUMENT
      ?auto_63529 - SATELLITE
      ?auto_63531 - DIRECTION
      ?auto_63524 - INSTRUMENT
      ?auto_63530 - INSTRUMENT
      ?auto_63526 - INSTRUMENT
      ?auto_63527 - INSTRUMENT
      ?auto_63528 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_63517 ?auto_63514 ) ) ( not ( = ?auto_63518 ?auto_63514 ) ) ( not ( = ?auto_63518 ?auto_63517 ) ) ( not ( = ?auto_63520 ?auto_63514 ) ) ( not ( = ?auto_63520 ?auto_63517 ) ) ( not ( = ?auto_63520 ?auto_63518 ) ) ( not ( = ?auto_63522 ?auto_63514 ) ) ( not ( = ?auto_63522 ?auto_63517 ) ) ( not ( = ?auto_63522 ?auto_63518 ) ) ( not ( = ?auto_63522 ?auto_63520 ) ) ( ON_BOARD ?auto_63525 ?auto_63529 ) ( SUPPORTS ?auto_63525 ?auto_63523 ) ( not ( = ?auto_63522 ?auto_63531 ) ) ( CALIBRATION_TARGET ?auto_63525 ?auto_63531 ) ( not ( = ?auto_63531 ?auto_63518 ) ) ( ON_BOARD ?auto_63524 ?auto_63529 ) ( not ( = ?auto_63525 ?auto_63524 ) ) ( SUPPORTS ?auto_63524 ?auto_63519 ) ( CALIBRATION_TARGET ?auto_63524 ?auto_63531 ) ( not ( = ?auto_63531 ?auto_63517 ) ) ( ON_BOARD ?auto_63530 ?auto_63529 ) ( not ( = ?auto_63524 ?auto_63530 ) ) ( SUPPORTS ?auto_63530 ?auto_63516 ) ( CALIBRATION_TARGET ?auto_63530 ?auto_63531 ) ( not ( = ?auto_63531 ?auto_63514 ) ) ( ON_BOARD ?auto_63526 ?auto_63529 ) ( not ( = ?auto_63530 ?auto_63526 ) ) ( SUPPORTS ?auto_63526 ?auto_63515 ) ( CALIBRATION_TARGET ?auto_63526 ?auto_63531 ) ( not ( = ?auto_63531 ?auto_63520 ) ) ( ON_BOARD ?auto_63527 ?auto_63529 ) ( not ( = ?auto_63526 ?auto_63527 ) ) ( SUPPORTS ?auto_63527 ?auto_63521 ) ( CALIBRATION_TARGET ?auto_63527 ?auto_63531 ) ( POWER_AVAIL ?auto_63529 ) ( POINTING ?auto_63529 ?auto_63528 ) ( not ( = ?auto_63531 ?auto_63528 ) ) ( not ( = ?auto_63520 ?auto_63528 ) ) ( not ( = ?auto_63521 ?auto_63515 ) ) ( not ( = ?auto_63514 ?auto_63528 ) ) ( not ( = ?auto_63521 ?auto_63516 ) ) ( not ( = ?auto_63515 ?auto_63516 ) ) ( not ( = ?auto_63517 ?auto_63528 ) ) ( not ( = ?auto_63530 ?auto_63527 ) ) ( not ( = ?auto_63521 ?auto_63519 ) ) ( not ( = ?auto_63515 ?auto_63519 ) ) ( not ( = ?auto_63516 ?auto_63519 ) ) ( not ( = ?auto_63518 ?auto_63528 ) ) ( not ( = ?auto_63524 ?auto_63526 ) ) ( not ( = ?auto_63524 ?auto_63527 ) ) ( not ( = ?auto_63521 ?auto_63523 ) ) ( not ( = ?auto_63515 ?auto_63523 ) ) ( not ( = ?auto_63516 ?auto_63523 ) ) ( not ( = ?auto_63519 ?auto_63523 ) ) ( not ( = ?auto_63522 ?auto_63528 ) ) ( not ( = ?auto_63525 ?auto_63530 ) ) ( not ( = ?auto_63525 ?auto_63526 ) ) ( not ( = ?auto_63525 ?auto_63527 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_63520 ?auto_63521 ?auto_63514 ?auto_63515 ?auto_63517 ?auto_63516 ?auto_63522 ?auto_63523 ?auto_63518 ?auto_63519 )
      ( GET-5IMAGE-VERIFY ?auto_63514 ?auto_63515 ?auto_63517 ?auto_63516 ?auto_63518 ?auto_63519 ?auto_63520 ?auto_63521 ?auto_63522 ?auto_63523 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_63592 - DIRECTION
      ?auto_63593 - MODE
      ?auto_63595 - DIRECTION
      ?auto_63594 - MODE
      ?auto_63596 - DIRECTION
      ?auto_63597 - MODE
      ?auto_63598 - DIRECTION
      ?auto_63599 - MODE
      ?auto_63600 - DIRECTION
      ?auto_63601 - MODE
    )
    :vars
    (
      ?auto_63603 - INSTRUMENT
      ?auto_63607 - SATELLITE
      ?auto_63609 - DIRECTION
      ?auto_63602 - INSTRUMENT
      ?auto_63608 - INSTRUMENT
      ?auto_63604 - INSTRUMENT
      ?auto_63605 - INSTRUMENT
      ?auto_63606 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_63595 ?auto_63592 ) ) ( not ( = ?auto_63596 ?auto_63592 ) ) ( not ( = ?auto_63596 ?auto_63595 ) ) ( not ( = ?auto_63598 ?auto_63592 ) ) ( not ( = ?auto_63598 ?auto_63595 ) ) ( not ( = ?auto_63598 ?auto_63596 ) ) ( not ( = ?auto_63600 ?auto_63592 ) ) ( not ( = ?auto_63600 ?auto_63595 ) ) ( not ( = ?auto_63600 ?auto_63596 ) ) ( not ( = ?auto_63600 ?auto_63598 ) ) ( ON_BOARD ?auto_63603 ?auto_63607 ) ( SUPPORTS ?auto_63603 ?auto_63599 ) ( not ( = ?auto_63598 ?auto_63609 ) ) ( CALIBRATION_TARGET ?auto_63603 ?auto_63609 ) ( not ( = ?auto_63609 ?auto_63596 ) ) ( ON_BOARD ?auto_63602 ?auto_63607 ) ( not ( = ?auto_63603 ?auto_63602 ) ) ( SUPPORTS ?auto_63602 ?auto_63597 ) ( CALIBRATION_TARGET ?auto_63602 ?auto_63609 ) ( not ( = ?auto_63609 ?auto_63595 ) ) ( ON_BOARD ?auto_63608 ?auto_63607 ) ( not ( = ?auto_63602 ?auto_63608 ) ) ( SUPPORTS ?auto_63608 ?auto_63594 ) ( CALIBRATION_TARGET ?auto_63608 ?auto_63609 ) ( not ( = ?auto_63609 ?auto_63592 ) ) ( ON_BOARD ?auto_63604 ?auto_63607 ) ( not ( = ?auto_63608 ?auto_63604 ) ) ( SUPPORTS ?auto_63604 ?auto_63593 ) ( CALIBRATION_TARGET ?auto_63604 ?auto_63609 ) ( not ( = ?auto_63609 ?auto_63600 ) ) ( ON_BOARD ?auto_63605 ?auto_63607 ) ( not ( = ?auto_63604 ?auto_63605 ) ) ( SUPPORTS ?auto_63605 ?auto_63601 ) ( CALIBRATION_TARGET ?auto_63605 ?auto_63609 ) ( POWER_AVAIL ?auto_63607 ) ( POINTING ?auto_63607 ?auto_63606 ) ( not ( = ?auto_63609 ?auto_63606 ) ) ( not ( = ?auto_63600 ?auto_63606 ) ) ( not ( = ?auto_63601 ?auto_63593 ) ) ( not ( = ?auto_63592 ?auto_63606 ) ) ( not ( = ?auto_63601 ?auto_63594 ) ) ( not ( = ?auto_63593 ?auto_63594 ) ) ( not ( = ?auto_63595 ?auto_63606 ) ) ( not ( = ?auto_63608 ?auto_63605 ) ) ( not ( = ?auto_63601 ?auto_63597 ) ) ( not ( = ?auto_63593 ?auto_63597 ) ) ( not ( = ?auto_63594 ?auto_63597 ) ) ( not ( = ?auto_63596 ?auto_63606 ) ) ( not ( = ?auto_63602 ?auto_63604 ) ) ( not ( = ?auto_63602 ?auto_63605 ) ) ( not ( = ?auto_63601 ?auto_63599 ) ) ( not ( = ?auto_63593 ?auto_63599 ) ) ( not ( = ?auto_63594 ?auto_63599 ) ) ( not ( = ?auto_63597 ?auto_63599 ) ) ( not ( = ?auto_63598 ?auto_63606 ) ) ( not ( = ?auto_63603 ?auto_63608 ) ) ( not ( = ?auto_63603 ?auto_63604 ) ) ( not ( = ?auto_63603 ?auto_63605 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_63600 ?auto_63601 ?auto_63592 ?auto_63593 ?auto_63595 ?auto_63594 ?auto_63598 ?auto_63599 ?auto_63596 ?auto_63597 )
      ( GET-5IMAGE-VERIFY ?auto_63592 ?auto_63593 ?auto_63595 ?auto_63594 ?auto_63596 ?auto_63597 ?auto_63598 ?auto_63599 ?auto_63600 ?auto_63601 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_63750 - DIRECTION
      ?auto_63751 - MODE
      ?auto_63753 - DIRECTION
      ?auto_63752 - MODE
      ?auto_63754 - DIRECTION
      ?auto_63755 - MODE
      ?auto_63756 - DIRECTION
      ?auto_63757 - MODE
      ?auto_63758 - DIRECTION
      ?auto_63759 - MODE
    )
    :vars
    (
      ?auto_63761 - INSTRUMENT
      ?auto_63765 - SATELLITE
      ?auto_63767 - DIRECTION
      ?auto_63760 - INSTRUMENT
      ?auto_63766 - INSTRUMENT
      ?auto_63762 - INSTRUMENT
      ?auto_63763 - INSTRUMENT
      ?auto_63764 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_63753 ?auto_63750 ) ) ( not ( = ?auto_63754 ?auto_63750 ) ) ( not ( = ?auto_63754 ?auto_63753 ) ) ( not ( = ?auto_63756 ?auto_63750 ) ) ( not ( = ?auto_63756 ?auto_63753 ) ) ( not ( = ?auto_63756 ?auto_63754 ) ) ( not ( = ?auto_63758 ?auto_63750 ) ) ( not ( = ?auto_63758 ?auto_63753 ) ) ( not ( = ?auto_63758 ?auto_63754 ) ) ( not ( = ?auto_63758 ?auto_63756 ) ) ( ON_BOARD ?auto_63761 ?auto_63765 ) ( SUPPORTS ?auto_63761 ?auto_63755 ) ( not ( = ?auto_63754 ?auto_63767 ) ) ( CALIBRATION_TARGET ?auto_63761 ?auto_63767 ) ( not ( = ?auto_63767 ?auto_63758 ) ) ( ON_BOARD ?auto_63760 ?auto_63765 ) ( not ( = ?auto_63761 ?auto_63760 ) ) ( SUPPORTS ?auto_63760 ?auto_63759 ) ( CALIBRATION_TARGET ?auto_63760 ?auto_63767 ) ( not ( = ?auto_63767 ?auto_63753 ) ) ( ON_BOARD ?auto_63766 ?auto_63765 ) ( not ( = ?auto_63760 ?auto_63766 ) ) ( SUPPORTS ?auto_63766 ?auto_63752 ) ( CALIBRATION_TARGET ?auto_63766 ?auto_63767 ) ( not ( = ?auto_63767 ?auto_63750 ) ) ( ON_BOARD ?auto_63762 ?auto_63765 ) ( not ( = ?auto_63766 ?auto_63762 ) ) ( SUPPORTS ?auto_63762 ?auto_63751 ) ( CALIBRATION_TARGET ?auto_63762 ?auto_63767 ) ( not ( = ?auto_63767 ?auto_63756 ) ) ( ON_BOARD ?auto_63763 ?auto_63765 ) ( not ( = ?auto_63762 ?auto_63763 ) ) ( SUPPORTS ?auto_63763 ?auto_63757 ) ( CALIBRATION_TARGET ?auto_63763 ?auto_63767 ) ( POWER_AVAIL ?auto_63765 ) ( POINTING ?auto_63765 ?auto_63764 ) ( not ( = ?auto_63767 ?auto_63764 ) ) ( not ( = ?auto_63756 ?auto_63764 ) ) ( not ( = ?auto_63757 ?auto_63751 ) ) ( not ( = ?auto_63750 ?auto_63764 ) ) ( not ( = ?auto_63757 ?auto_63752 ) ) ( not ( = ?auto_63751 ?auto_63752 ) ) ( not ( = ?auto_63753 ?auto_63764 ) ) ( not ( = ?auto_63766 ?auto_63763 ) ) ( not ( = ?auto_63757 ?auto_63759 ) ) ( not ( = ?auto_63751 ?auto_63759 ) ) ( not ( = ?auto_63752 ?auto_63759 ) ) ( not ( = ?auto_63758 ?auto_63764 ) ) ( not ( = ?auto_63760 ?auto_63762 ) ) ( not ( = ?auto_63760 ?auto_63763 ) ) ( not ( = ?auto_63757 ?auto_63755 ) ) ( not ( = ?auto_63751 ?auto_63755 ) ) ( not ( = ?auto_63752 ?auto_63755 ) ) ( not ( = ?auto_63759 ?auto_63755 ) ) ( not ( = ?auto_63754 ?auto_63764 ) ) ( not ( = ?auto_63761 ?auto_63766 ) ) ( not ( = ?auto_63761 ?auto_63762 ) ) ( not ( = ?auto_63761 ?auto_63763 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_63756 ?auto_63757 ?auto_63750 ?auto_63751 ?auto_63753 ?auto_63752 ?auto_63754 ?auto_63755 ?auto_63758 ?auto_63759 )
      ( GET-5IMAGE-VERIFY ?auto_63750 ?auto_63751 ?auto_63753 ?auto_63752 ?auto_63754 ?auto_63755 ?auto_63756 ?auto_63757 ?auto_63758 ?auto_63759 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_64000 - DIRECTION
      ?auto_64001 - MODE
      ?auto_64003 - DIRECTION
      ?auto_64002 - MODE
      ?auto_64004 - DIRECTION
      ?auto_64005 - MODE
      ?auto_64006 - DIRECTION
      ?auto_64007 - MODE
      ?auto_64008 - DIRECTION
      ?auto_64009 - MODE
    )
    :vars
    (
      ?auto_64011 - INSTRUMENT
      ?auto_64015 - SATELLITE
      ?auto_64017 - DIRECTION
      ?auto_64010 - INSTRUMENT
      ?auto_64016 - INSTRUMENT
      ?auto_64012 - INSTRUMENT
      ?auto_64013 - INSTRUMENT
      ?auto_64014 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_64003 ?auto_64000 ) ) ( not ( = ?auto_64004 ?auto_64000 ) ) ( not ( = ?auto_64004 ?auto_64003 ) ) ( not ( = ?auto_64006 ?auto_64000 ) ) ( not ( = ?auto_64006 ?auto_64003 ) ) ( not ( = ?auto_64006 ?auto_64004 ) ) ( not ( = ?auto_64008 ?auto_64000 ) ) ( not ( = ?auto_64008 ?auto_64003 ) ) ( not ( = ?auto_64008 ?auto_64004 ) ) ( not ( = ?auto_64008 ?auto_64006 ) ) ( ON_BOARD ?auto_64011 ?auto_64015 ) ( SUPPORTS ?auto_64011 ?auto_64005 ) ( not ( = ?auto_64004 ?auto_64017 ) ) ( CALIBRATION_TARGET ?auto_64011 ?auto_64017 ) ( not ( = ?auto_64017 ?auto_64006 ) ) ( ON_BOARD ?auto_64010 ?auto_64015 ) ( not ( = ?auto_64011 ?auto_64010 ) ) ( SUPPORTS ?auto_64010 ?auto_64007 ) ( CALIBRATION_TARGET ?auto_64010 ?auto_64017 ) ( not ( = ?auto_64017 ?auto_64003 ) ) ( ON_BOARD ?auto_64016 ?auto_64015 ) ( not ( = ?auto_64010 ?auto_64016 ) ) ( SUPPORTS ?auto_64016 ?auto_64002 ) ( CALIBRATION_TARGET ?auto_64016 ?auto_64017 ) ( not ( = ?auto_64017 ?auto_64000 ) ) ( ON_BOARD ?auto_64012 ?auto_64015 ) ( not ( = ?auto_64016 ?auto_64012 ) ) ( SUPPORTS ?auto_64012 ?auto_64001 ) ( CALIBRATION_TARGET ?auto_64012 ?auto_64017 ) ( not ( = ?auto_64017 ?auto_64008 ) ) ( ON_BOARD ?auto_64013 ?auto_64015 ) ( not ( = ?auto_64012 ?auto_64013 ) ) ( SUPPORTS ?auto_64013 ?auto_64009 ) ( CALIBRATION_TARGET ?auto_64013 ?auto_64017 ) ( POWER_AVAIL ?auto_64015 ) ( POINTING ?auto_64015 ?auto_64014 ) ( not ( = ?auto_64017 ?auto_64014 ) ) ( not ( = ?auto_64008 ?auto_64014 ) ) ( not ( = ?auto_64009 ?auto_64001 ) ) ( not ( = ?auto_64000 ?auto_64014 ) ) ( not ( = ?auto_64009 ?auto_64002 ) ) ( not ( = ?auto_64001 ?auto_64002 ) ) ( not ( = ?auto_64003 ?auto_64014 ) ) ( not ( = ?auto_64016 ?auto_64013 ) ) ( not ( = ?auto_64009 ?auto_64007 ) ) ( not ( = ?auto_64001 ?auto_64007 ) ) ( not ( = ?auto_64002 ?auto_64007 ) ) ( not ( = ?auto_64006 ?auto_64014 ) ) ( not ( = ?auto_64010 ?auto_64012 ) ) ( not ( = ?auto_64010 ?auto_64013 ) ) ( not ( = ?auto_64009 ?auto_64005 ) ) ( not ( = ?auto_64001 ?auto_64005 ) ) ( not ( = ?auto_64002 ?auto_64005 ) ) ( not ( = ?auto_64007 ?auto_64005 ) ) ( not ( = ?auto_64004 ?auto_64014 ) ) ( not ( = ?auto_64011 ?auto_64016 ) ) ( not ( = ?auto_64011 ?auto_64012 ) ) ( not ( = ?auto_64011 ?auto_64013 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_64008 ?auto_64009 ?auto_64000 ?auto_64001 ?auto_64003 ?auto_64002 ?auto_64004 ?auto_64005 ?auto_64006 ?auto_64007 )
      ( GET-5IMAGE-VERIFY ?auto_64000 ?auto_64001 ?auto_64003 ?auto_64002 ?auto_64004 ?auto_64005 ?auto_64006 ?auto_64007 ?auto_64008 ?auto_64009 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_64244 - DIRECTION
      ?auto_64245 - MODE
      ?auto_64247 - DIRECTION
      ?auto_64246 - MODE
      ?auto_64248 - DIRECTION
      ?auto_64249 - MODE
      ?auto_64250 - DIRECTION
      ?auto_64251 - MODE
      ?auto_64252 - DIRECTION
      ?auto_64253 - MODE
    )
    :vars
    (
      ?auto_64255 - INSTRUMENT
      ?auto_64259 - SATELLITE
      ?auto_64261 - DIRECTION
      ?auto_64254 - INSTRUMENT
      ?auto_64260 - INSTRUMENT
      ?auto_64256 - INSTRUMENT
      ?auto_64257 - INSTRUMENT
      ?auto_64258 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_64247 ?auto_64244 ) ) ( not ( = ?auto_64248 ?auto_64244 ) ) ( not ( = ?auto_64248 ?auto_64247 ) ) ( not ( = ?auto_64250 ?auto_64244 ) ) ( not ( = ?auto_64250 ?auto_64247 ) ) ( not ( = ?auto_64250 ?auto_64248 ) ) ( not ( = ?auto_64252 ?auto_64244 ) ) ( not ( = ?auto_64252 ?auto_64247 ) ) ( not ( = ?auto_64252 ?auto_64248 ) ) ( not ( = ?auto_64252 ?auto_64250 ) ) ( ON_BOARD ?auto_64255 ?auto_64259 ) ( SUPPORTS ?auto_64255 ?auto_64253 ) ( not ( = ?auto_64252 ?auto_64261 ) ) ( CALIBRATION_TARGET ?auto_64255 ?auto_64261 ) ( not ( = ?auto_64261 ?auto_64247 ) ) ( ON_BOARD ?auto_64254 ?auto_64259 ) ( not ( = ?auto_64255 ?auto_64254 ) ) ( SUPPORTS ?auto_64254 ?auto_64246 ) ( CALIBRATION_TARGET ?auto_64254 ?auto_64261 ) ( not ( = ?auto_64261 ?auto_64250 ) ) ( ON_BOARD ?auto_64260 ?auto_64259 ) ( not ( = ?auto_64254 ?auto_64260 ) ) ( SUPPORTS ?auto_64260 ?auto_64251 ) ( CALIBRATION_TARGET ?auto_64260 ?auto_64261 ) ( not ( = ?auto_64261 ?auto_64244 ) ) ( ON_BOARD ?auto_64256 ?auto_64259 ) ( not ( = ?auto_64260 ?auto_64256 ) ) ( SUPPORTS ?auto_64256 ?auto_64245 ) ( CALIBRATION_TARGET ?auto_64256 ?auto_64261 ) ( not ( = ?auto_64261 ?auto_64248 ) ) ( ON_BOARD ?auto_64257 ?auto_64259 ) ( not ( = ?auto_64256 ?auto_64257 ) ) ( SUPPORTS ?auto_64257 ?auto_64249 ) ( CALIBRATION_TARGET ?auto_64257 ?auto_64261 ) ( POWER_AVAIL ?auto_64259 ) ( POINTING ?auto_64259 ?auto_64258 ) ( not ( = ?auto_64261 ?auto_64258 ) ) ( not ( = ?auto_64248 ?auto_64258 ) ) ( not ( = ?auto_64249 ?auto_64245 ) ) ( not ( = ?auto_64244 ?auto_64258 ) ) ( not ( = ?auto_64249 ?auto_64251 ) ) ( not ( = ?auto_64245 ?auto_64251 ) ) ( not ( = ?auto_64250 ?auto_64258 ) ) ( not ( = ?auto_64260 ?auto_64257 ) ) ( not ( = ?auto_64249 ?auto_64246 ) ) ( not ( = ?auto_64245 ?auto_64246 ) ) ( not ( = ?auto_64251 ?auto_64246 ) ) ( not ( = ?auto_64247 ?auto_64258 ) ) ( not ( = ?auto_64254 ?auto_64256 ) ) ( not ( = ?auto_64254 ?auto_64257 ) ) ( not ( = ?auto_64249 ?auto_64253 ) ) ( not ( = ?auto_64245 ?auto_64253 ) ) ( not ( = ?auto_64251 ?auto_64253 ) ) ( not ( = ?auto_64246 ?auto_64253 ) ) ( not ( = ?auto_64252 ?auto_64258 ) ) ( not ( = ?auto_64255 ?auto_64260 ) ) ( not ( = ?auto_64255 ?auto_64256 ) ) ( not ( = ?auto_64255 ?auto_64257 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_64248 ?auto_64249 ?auto_64244 ?auto_64245 ?auto_64250 ?auto_64251 ?auto_64252 ?auto_64253 ?auto_64247 ?auto_64246 )
      ( GET-5IMAGE-VERIFY ?auto_64244 ?auto_64245 ?auto_64247 ?auto_64246 ?auto_64248 ?auto_64249 ?auto_64250 ?auto_64251 ?auto_64252 ?auto_64253 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_64322 - DIRECTION
      ?auto_64323 - MODE
      ?auto_64325 - DIRECTION
      ?auto_64324 - MODE
      ?auto_64326 - DIRECTION
      ?auto_64327 - MODE
      ?auto_64328 - DIRECTION
      ?auto_64329 - MODE
      ?auto_64330 - DIRECTION
      ?auto_64331 - MODE
    )
    :vars
    (
      ?auto_64333 - INSTRUMENT
      ?auto_64337 - SATELLITE
      ?auto_64339 - DIRECTION
      ?auto_64332 - INSTRUMENT
      ?auto_64338 - INSTRUMENT
      ?auto_64334 - INSTRUMENT
      ?auto_64335 - INSTRUMENT
      ?auto_64336 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_64325 ?auto_64322 ) ) ( not ( = ?auto_64326 ?auto_64322 ) ) ( not ( = ?auto_64326 ?auto_64325 ) ) ( not ( = ?auto_64328 ?auto_64322 ) ) ( not ( = ?auto_64328 ?auto_64325 ) ) ( not ( = ?auto_64328 ?auto_64326 ) ) ( not ( = ?auto_64330 ?auto_64322 ) ) ( not ( = ?auto_64330 ?auto_64325 ) ) ( not ( = ?auto_64330 ?auto_64326 ) ) ( not ( = ?auto_64330 ?auto_64328 ) ) ( ON_BOARD ?auto_64333 ?auto_64337 ) ( SUPPORTS ?auto_64333 ?auto_64329 ) ( not ( = ?auto_64328 ?auto_64339 ) ) ( CALIBRATION_TARGET ?auto_64333 ?auto_64339 ) ( not ( = ?auto_64339 ?auto_64325 ) ) ( ON_BOARD ?auto_64332 ?auto_64337 ) ( not ( = ?auto_64333 ?auto_64332 ) ) ( SUPPORTS ?auto_64332 ?auto_64324 ) ( CALIBRATION_TARGET ?auto_64332 ?auto_64339 ) ( not ( = ?auto_64339 ?auto_64330 ) ) ( ON_BOARD ?auto_64338 ?auto_64337 ) ( not ( = ?auto_64332 ?auto_64338 ) ) ( SUPPORTS ?auto_64338 ?auto_64331 ) ( CALIBRATION_TARGET ?auto_64338 ?auto_64339 ) ( not ( = ?auto_64339 ?auto_64322 ) ) ( ON_BOARD ?auto_64334 ?auto_64337 ) ( not ( = ?auto_64338 ?auto_64334 ) ) ( SUPPORTS ?auto_64334 ?auto_64323 ) ( CALIBRATION_TARGET ?auto_64334 ?auto_64339 ) ( not ( = ?auto_64339 ?auto_64326 ) ) ( ON_BOARD ?auto_64335 ?auto_64337 ) ( not ( = ?auto_64334 ?auto_64335 ) ) ( SUPPORTS ?auto_64335 ?auto_64327 ) ( CALIBRATION_TARGET ?auto_64335 ?auto_64339 ) ( POWER_AVAIL ?auto_64337 ) ( POINTING ?auto_64337 ?auto_64336 ) ( not ( = ?auto_64339 ?auto_64336 ) ) ( not ( = ?auto_64326 ?auto_64336 ) ) ( not ( = ?auto_64327 ?auto_64323 ) ) ( not ( = ?auto_64322 ?auto_64336 ) ) ( not ( = ?auto_64327 ?auto_64331 ) ) ( not ( = ?auto_64323 ?auto_64331 ) ) ( not ( = ?auto_64330 ?auto_64336 ) ) ( not ( = ?auto_64338 ?auto_64335 ) ) ( not ( = ?auto_64327 ?auto_64324 ) ) ( not ( = ?auto_64323 ?auto_64324 ) ) ( not ( = ?auto_64331 ?auto_64324 ) ) ( not ( = ?auto_64325 ?auto_64336 ) ) ( not ( = ?auto_64332 ?auto_64334 ) ) ( not ( = ?auto_64332 ?auto_64335 ) ) ( not ( = ?auto_64327 ?auto_64329 ) ) ( not ( = ?auto_64323 ?auto_64329 ) ) ( not ( = ?auto_64331 ?auto_64329 ) ) ( not ( = ?auto_64324 ?auto_64329 ) ) ( not ( = ?auto_64328 ?auto_64336 ) ) ( not ( = ?auto_64333 ?auto_64338 ) ) ( not ( = ?auto_64333 ?auto_64334 ) ) ( not ( = ?auto_64333 ?auto_64335 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_64326 ?auto_64327 ?auto_64322 ?auto_64323 ?auto_64330 ?auto_64331 ?auto_64328 ?auto_64329 ?auto_64325 ?auto_64324 )
      ( GET-5IMAGE-VERIFY ?auto_64322 ?auto_64323 ?auto_64325 ?auto_64324 ?auto_64326 ?auto_64327 ?auto_64328 ?auto_64329 ?auto_64330 ?auto_64331 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_64570 - DIRECTION
      ?auto_64571 - MODE
      ?auto_64573 - DIRECTION
      ?auto_64572 - MODE
      ?auto_64574 - DIRECTION
      ?auto_64575 - MODE
      ?auto_64576 - DIRECTION
      ?auto_64577 - MODE
      ?auto_64578 - DIRECTION
      ?auto_64579 - MODE
    )
    :vars
    (
      ?auto_64581 - INSTRUMENT
      ?auto_64585 - SATELLITE
      ?auto_64587 - DIRECTION
      ?auto_64580 - INSTRUMENT
      ?auto_64586 - INSTRUMENT
      ?auto_64582 - INSTRUMENT
      ?auto_64583 - INSTRUMENT
      ?auto_64584 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_64573 ?auto_64570 ) ) ( not ( = ?auto_64574 ?auto_64570 ) ) ( not ( = ?auto_64574 ?auto_64573 ) ) ( not ( = ?auto_64576 ?auto_64570 ) ) ( not ( = ?auto_64576 ?auto_64573 ) ) ( not ( = ?auto_64576 ?auto_64574 ) ) ( not ( = ?auto_64578 ?auto_64570 ) ) ( not ( = ?auto_64578 ?auto_64573 ) ) ( not ( = ?auto_64578 ?auto_64574 ) ) ( not ( = ?auto_64578 ?auto_64576 ) ) ( ON_BOARD ?auto_64581 ?auto_64585 ) ( SUPPORTS ?auto_64581 ?auto_64579 ) ( not ( = ?auto_64578 ?auto_64587 ) ) ( CALIBRATION_TARGET ?auto_64581 ?auto_64587 ) ( not ( = ?auto_64587 ?auto_64573 ) ) ( ON_BOARD ?auto_64580 ?auto_64585 ) ( not ( = ?auto_64581 ?auto_64580 ) ) ( SUPPORTS ?auto_64580 ?auto_64572 ) ( CALIBRATION_TARGET ?auto_64580 ?auto_64587 ) ( not ( = ?auto_64587 ?auto_64574 ) ) ( ON_BOARD ?auto_64586 ?auto_64585 ) ( not ( = ?auto_64580 ?auto_64586 ) ) ( SUPPORTS ?auto_64586 ?auto_64575 ) ( CALIBRATION_TARGET ?auto_64586 ?auto_64587 ) ( not ( = ?auto_64587 ?auto_64570 ) ) ( ON_BOARD ?auto_64582 ?auto_64585 ) ( not ( = ?auto_64586 ?auto_64582 ) ) ( SUPPORTS ?auto_64582 ?auto_64571 ) ( CALIBRATION_TARGET ?auto_64582 ?auto_64587 ) ( not ( = ?auto_64587 ?auto_64576 ) ) ( ON_BOARD ?auto_64583 ?auto_64585 ) ( not ( = ?auto_64582 ?auto_64583 ) ) ( SUPPORTS ?auto_64583 ?auto_64577 ) ( CALIBRATION_TARGET ?auto_64583 ?auto_64587 ) ( POWER_AVAIL ?auto_64585 ) ( POINTING ?auto_64585 ?auto_64584 ) ( not ( = ?auto_64587 ?auto_64584 ) ) ( not ( = ?auto_64576 ?auto_64584 ) ) ( not ( = ?auto_64577 ?auto_64571 ) ) ( not ( = ?auto_64570 ?auto_64584 ) ) ( not ( = ?auto_64577 ?auto_64575 ) ) ( not ( = ?auto_64571 ?auto_64575 ) ) ( not ( = ?auto_64574 ?auto_64584 ) ) ( not ( = ?auto_64586 ?auto_64583 ) ) ( not ( = ?auto_64577 ?auto_64572 ) ) ( not ( = ?auto_64571 ?auto_64572 ) ) ( not ( = ?auto_64575 ?auto_64572 ) ) ( not ( = ?auto_64573 ?auto_64584 ) ) ( not ( = ?auto_64580 ?auto_64582 ) ) ( not ( = ?auto_64580 ?auto_64583 ) ) ( not ( = ?auto_64577 ?auto_64579 ) ) ( not ( = ?auto_64571 ?auto_64579 ) ) ( not ( = ?auto_64575 ?auto_64579 ) ) ( not ( = ?auto_64572 ?auto_64579 ) ) ( not ( = ?auto_64578 ?auto_64584 ) ) ( not ( = ?auto_64581 ?auto_64586 ) ) ( not ( = ?auto_64581 ?auto_64582 ) ) ( not ( = ?auto_64581 ?auto_64583 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_64576 ?auto_64577 ?auto_64570 ?auto_64571 ?auto_64574 ?auto_64575 ?auto_64578 ?auto_64579 ?auto_64573 ?auto_64572 )
      ( GET-5IMAGE-VERIFY ?auto_64570 ?auto_64571 ?auto_64573 ?auto_64572 ?auto_64574 ?auto_64575 ?auto_64576 ?auto_64577 ?auto_64578 ?auto_64579 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_64648 - DIRECTION
      ?auto_64649 - MODE
      ?auto_64651 - DIRECTION
      ?auto_64650 - MODE
      ?auto_64652 - DIRECTION
      ?auto_64653 - MODE
      ?auto_64654 - DIRECTION
      ?auto_64655 - MODE
      ?auto_64656 - DIRECTION
      ?auto_64657 - MODE
    )
    :vars
    (
      ?auto_64659 - INSTRUMENT
      ?auto_64663 - SATELLITE
      ?auto_64665 - DIRECTION
      ?auto_64658 - INSTRUMENT
      ?auto_64664 - INSTRUMENT
      ?auto_64660 - INSTRUMENT
      ?auto_64661 - INSTRUMENT
      ?auto_64662 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_64651 ?auto_64648 ) ) ( not ( = ?auto_64652 ?auto_64648 ) ) ( not ( = ?auto_64652 ?auto_64651 ) ) ( not ( = ?auto_64654 ?auto_64648 ) ) ( not ( = ?auto_64654 ?auto_64651 ) ) ( not ( = ?auto_64654 ?auto_64652 ) ) ( not ( = ?auto_64656 ?auto_64648 ) ) ( not ( = ?auto_64656 ?auto_64651 ) ) ( not ( = ?auto_64656 ?auto_64652 ) ) ( not ( = ?auto_64656 ?auto_64654 ) ) ( ON_BOARD ?auto_64659 ?auto_64663 ) ( SUPPORTS ?auto_64659 ?auto_64655 ) ( not ( = ?auto_64654 ?auto_64665 ) ) ( CALIBRATION_TARGET ?auto_64659 ?auto_64665 ) ( not ( = ?auto_64665 ?auto_64651 ) ) ( ON_BOARD ?auto_64658 ?auto_64663 ) ( not ( = ?auto_64659 ?auto_64658 ) ) ( SUPPORTS ?auto_64658 ?auto_64650 ) ( CALIBRATION_TARGET ?auto_64658 ?auto_64665 ) ( not ( = ?auto_64665 ?auto_64652 ) ) ( ON_BOARD ?auto_64664 ?auto_64663 ) ( not ( = ?auto_64658 ?auto_64664 ) ) ( SUPPORTS ?auto_64664 ?auto_64653 ) ( CALIBRATION_TARGET ?auto_64664 ?auto_64665 ) ( not ( = ?auto_64665 ?auto_64648 ) ) ( ON_BOARD ?auto_64660 ?auto_64663 ) ( not ( = ?auto_64664 ?auto_64660 ) ) ( SUPPORTS ?auto_64660 ?auto_64649 ) ( CALIBRATION_TARGET ?auto_64660 ?auto_64665 ) ( not ( = ?auto_64665 ?auto_64656 ) ) ( ON_BOARD ?auto_64661 ?auto_64663 ) ( not ( = ?auto_64660 ?auto_64661 ) ) ( SUPPORTS ?auto_64661 ?auto_64657 ) ( CALIBRATION_TARGET ?auto_64661 ?auto_64665 ) ( POWER_AVAIL ?auto_64663 ) ( POINTING ?auto_64663 ?auto_64662 ) ( not ( = ?auto_64665 ?auto_64662 ) ) ( not ( = ?auto_64656 ?auto_64662 ) ) ( not ( = ?auto_64657 ?auto_64649 ) ) ( not ( = ?auto_64648 ?auto_64662 ) ) ( not ( = ?auto_64657 ?auto_64653 ) ) ( not ( = ?auto_64649 ?auto_64653 ) ) ( not ( = ?auto_64652 ?auto_64662 ) ) ( not ( = ?auto_64664 ?auto_64661 ) ) ( not ( = ?auto_64657 ?auto_64650 ) ) ( not ( = ?auto_64649 ?auto_64650 ) ) ( not ( = ?auto_64653 ?auto_64650 ) ) ( not ( = ?auto_64651 ?auto_64662 ) ) ( not ( = ?auto_64658 ?auto_64660 ) ) ( not ( = ?auto_64658 ?auto_64661 ) ) ( not ( = ?auto_64657 ?auto_64655 ) ) ( not ( = ?auto_64649 ?auto_64655 ) ) ( not ( = ?auto_64653 ?auto_64655 ) ) ( not ( = ?auto_64650 ?auto_64655 ) ) ( not ( = ?auto_64654 ?auto_64662 ) ) ( not ( = ?auto_64659 ?auto_64664 ) ) ( not ( = ?auto_64659 ?auto_64660 ) ) ( not ( = ?auto_64659 ?auto_64661 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_64656 ?auto_64657 ?auto_64648 ?auto_64649 ?auto_64652 ?auto_64653 ?auto_64654 ?auto_64655 ?auto_64651 ?auto_64650 )
      ( GET-5IMAGE-VERIFY ?auto_64648 ?auto_64649 ?auto_64651 ?auto_64650 ?auto_64652 ?auto_64653 ?auto_64654 ?auto_64655 ?auto_64656 ?auto_64657 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_64976 - DIRECTION
      ?auto_64977 - MODE
      ?auto_64979 - DIRECTION
      ?auto_64978 - MODE
      ?auto_64980 - DIRECTION
      ?auto_64981 - MODE
      ?auto_64982 - DIRECTION
      ?auto_64983 - MODE
      ?auto_64984 - DIRECTION
      ?auto_64985 - MODE
    )
    :vars
    (
      ?auto_64987 - INSTRUMENT
      ?auto_64991 - SATELLITE
      ?auto_64993 - DIRECTION
      ?auto_64986 - INSTRUMENT
      ?auto_64992 - INSTRUMENT
      ?auto_64988 - INSTRUMENT
      ?auto_64989 - INSTRUMENT
      ?auto_64990 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_64979 ?auto_64976 ) ) ( not ( = ?auto_64980 ?auto_64976 ) ) ( not ( = ?auto_64980 ?auto_64979 ) ) ( not ( = ?auto_64982 ?auto_64976 ) ) ( not ( = ?auto_64982 ?auto_64979 ) ) ( not ( = ?auto_64982 ?auto_64980 ) ) ( not ( = ?auto_64984 ?auto_64976 ) ) ( not ( = ?auto_64984 ?auto_64979 ) ) ( not ( = ?auto_64984 ?auto_64980 ) ) ( not ( = ?auto_64984 ?auto_64982 ) ) ( ON_BOARD ?auto_64987 ?auto_64991 ) ( SUPPORTS ?auto_64987 ?auto_64981 ) ( not ( = ?auto_64980 ?auto_64993 ) ) ( CALIBRATION_TARGET ?auto_64987 ?auto_64993 ) ( not ( = ?auto_64993 ?auto_64979 ) ) ( ON_BOARD ?auto_64986 ?auto_64991 ) ( not ( = ?auto_64987 ?auto_64986 ) ) ( SUPPORTS ?auto_64986 ?auto_64978 ) ( CALIBRATION_TARGET ?auto_64986 ?auto_64993 ) ( not ( = ?auto_64993 ?auto_64984 ) ) ( ON_BOARD ?auto_64992 ?auto_64991 ) ( not ( = ?auto_64986 ?auto_64992 ) ) ( SUPPORTS ?auto_64992 ?auto_64985 ) ( CALIBRATION_TARGET ?auto_64992 ?auto_64993 ) ( not ( = ?auto_64993 ?auto_64976 ) ) ( ON_BOARD ?auto_64988 ?auto_64991 ) ( not ( = ?auto_64992 ?auto_64988 ) ) ( SUPPORTS ?auto_64988 ?auto_64977 ) ( CALIBRATION_TARGET ?auto_64988 ?auto_64993 ) ( not ( = ?auto_64993 ?auto_64982 ) ) ( ON_BOARD ?auto_64989 ?auto_64991 ) ( not ( = ?auto_64988 ?auto_64989 ) ) ( SUPPORTS ?auto_64989 ?auto_64983 ) ( CALIBRATION_TARGET ?auto_64989 ?auto_64993 ) ( POWER_AVAIL ?auto_64991 ) ( POINTING ?auto_64991 ?auto_64990 ) ( not ( = ?auto_64993 ?auto_64990 ) ) ( not ( = ?auto_64982 ?auto_64990 ) ) ( not ( = ?auto_64983 ?auto_64977 ) ) ( not ( = ?auto_64976 ?auto_64990 ) ) ( not ( = ?auto_64983 ?auto_64985 ) ) ( not ( = ?auto_64977 ?auto_64985 ) ) ( not ( = ?auto_64984 ?auto_64990 ) ) ( not ( = ?auto_64992 ?auto_64989 ) ) ( not ( = ?auto_64983 ?auto_64978 ) ) ( not ( = ?auto_64977 ?auto_64978 ) ) ( not ( = ?auto_64985 ?auto_64978 ) ) ( not ( = ?auto_64979 ?auto_64990 ) ) ( not ( = ?auto_64986 ?auto_64988 ) ) ( not ( = ?auto_64986 ?auto_64989 ) ) ( not ( = ?auto_64983 ?auto_64981 ) ) ( not ( = ?auto_64977 ?auto_64981 ) ) ( not ( = ?auto_64985 ?auto_64981 ) ) ( not ( = ?auto_64978 ?auto_64981 ) ) ( not ( = ?auto_64980 ?auto_64990 ) ) ( not ( = ?auto_64987 ?auto_64992 ) ) ( not ( = ?auto_64987 ?auto_64988 ) ) ( not ( = ?auto_64987 ?auto_64989 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_64982 ?auto_64983 ?auto_64976 ?auto_64977 ?auto_64984 ?auto_64985 ?auto_64980 ?auto_64981 ?auto_64979 ?auto_64978 )
      ( GET-5IMAGE-VERIFY ?auto_64976 ?auto_64977 ?auto_64979 ?auto_64978 ?auto_64980 ?auto_64981 ?auto_64982 ?auto_64983 ?auto_64984 ?auto_64985 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_65140 - DIRECTION
      ?auto_65141 - MODE
      ?auto_65143 - DIRECTION
      ?auto_65142 - MODE
      ?auto_65144 - DIRECTION
      ?auto_65145 - MODE
      ?auto_65146 - DIRECTION
      ?auto_65147 - MODE
      ?auto_65148 - DIRECTION
      ?auto_65149 - MODE
    )
    :vars
    (
      ?auto_65151 - INSTRUMENT
      ?auto_65155 - SATELLITE
      ?auto_65157 - DIRECTION
      ?auto_65150 - INSTRUMENT
      ?auto_65156 - INSTRUMENT
      ?auto_65152 - INSTRUMENT
      ?auto_65153 - INSTRUMENT
      ?auto_65154 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_65143 ?auto_65140 ) ) ( not ( = ?auto_65144 ?auto_65140 ) ) ( not ( = ?auto_65144 ?auto_65143 ) ) ( not ( = ?auto_65146 ?auto_65140 ) ) ( not ( = ?auto_65146 ?auto_65143 ) ) ( not ( = ?auto_65146 ?auto_65144 ) ) ( not ( = ?auto_65148 ?auto_65140 ) ) ( not ( = ?auto_65148 ?auto_65143 ) ) ( not ( = ?auto_65148 ?auto_65144 ) ) ( not ( = ?auto_65148 ?auto_65146 ) ) ( ON_BOARD ?auto_65151 ?auto_65155 ) ( SUPPORTS ?auto_65151 ?auto_65145 ) ( not ( = ?auto_65144 ?auto_65157 ) ) ( CALIBRATION_TARGET ?auto_65151 ?auto_65157 ) ( not ( = ?auto_65157 ?auto_65143 ) ) ( ON_BOARD ?auto_65150 ?auto_65155 ) ( not ( = ?auto_65151 ?auto_65150 ) ) ( SUPPORTS ?auto_65150 ?auto_65142 ) ( CALIBRATION_TARGET ?auto_65150 ?auto_65157 ) ( not ( = ?auto_65157 ?auto_65146 ) ) ( ON_BOARD ?auto_65156 ?auto_65155 ) ( not ( = ?auto_65150 ?auto_65156 ) ) ( SUPPORTS ?auto_65156 ?auto_65147 ) ( CALIBRATION_TARGET ?auto_65156 ?auto_65157 ) ( not ( = ?auto_65157 ?auto_65140 ) ) ( ON_BOARD ?auto_65152 ?auto_65155 ) ( not ( = ?auto_65156 ?auto_65152 ) ) ( SUPPORTS ?auto_65152 ?auto_65141 ) ( CALIBRATION_TARGET ?auto_65152 ?auto_65157 ) ( not ( = ?auto_65157 ?auto_65148 ) ) ( ON_BOARD ?auto_65153 ?auto_65155 ) ( not ( = ?auto_65152 ?auto_65153 ) ) ( SUPPORTS ?auto_65153 ?auto_65149 ) ( CALIBRATION_TARGET ?auto_65153 ?auto_65157 ) ( POWER_AVAIL ?auto_65155 ) ( POINTING ?auto_65155 ?auto_65154 ) ( not ( = ?auto_65157 ?auto_65154 ) ) ( not ( = ?auto_65148 ?auto_65154 ) ) ( not ( = ?auto_65149 ?auto_65141 ) ) ( not ( = ?auto_65140 ?auto_65154 ) ) ( not ( = ?auto_65149 ?auto_65147 ) ) ( not ( = ?auto_65141 ?auto_65147 ) ) ( not ( = ?auto_65146 ?auto_65154 ) ) ( not ( = ?auto_65156 ?auto_65153 ) ) ( not ( = ?auto_65149 ?auto_65142 ) ) ( not ( = ?auto_65141 ?auto_65142 ) ) ( not ( = ?auto_65147 ?auto_65142 ) ) ( not ( = ?auto_65143 ?auto_65154 ) ) ( not ( = ?auto_65150 ?auto_65152 ) ) ( not ( = ?auto_65150 ?auto_65153 ) ) ( not ( = ?auto_65149 ?auto_65145 ) ) ( not ( = ?auto_65141 ?auto_65145 ) ) ( not ( = ?auto_65147 ?auto_65145 ) ) ( not ( = ?auto_65142 ?auto_65145 ) ) ( not ( = ?auto_65144 ?auto_65154 ) ) ( not ( = ?auto_65151 ?auto_65156 ) ) ( not ( = ?auto_65151 ?auto_65152 ) ) ( not ( = ?auto_65151 ?auto_65153 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_65148 ?auto_65149 ?auto_65140 ?auto_65141 ?auto_65146 ?auto_65147 ?auto_65144 ?auto_65145 ?auto_65143 ?auto_65142 )
      ( GET-5IMAGE-VERIFY ?auto_65140 ?auto_65141 ?auto_65143 ?auto_65142 ?auto_65144 ?auto_65145 ?auto_65146 ?auto_65147 ?auto_65148 ?auto_65149 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_65722 - DIRECTION
      ?auto_65723 - MODE
      ?auto_65725 - DIRECTION
      ?auto_65724 - MODE
      ?auto_65726 - DIRECTION
      ?auto_65727 - MODE
      ?auto_65728 - DIRECTION
      ?auto_65729 - MODE
      ?auto_65730 - DIRECTION
      ?auto_65731 - MODE
    )
    :vars
    (
      ?auto_65733 - INSTRUMENT
      ?auto_65737 - SATELLITE
      ?auto_65739 - DIRECTION
      ?auto_65732 - INSTRUMENT
      ?auto_65738 - INSTRUMENT
      ?auto_65734 - INSTRUMENT
      ?auto_65735 - INSTRUMENT
      ?auto_65736 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_65725 ?auto_65722 ) ) ( not ( = ?auto_65726 ?auto_65722 ) ) ( not ( = ?auto_65726 ?auto_65725 ) ) ( not ( = ?auto_65728 ?auto_65722 ) ) ( not ( = ?auto_65728 ?auto_65725 ) ) ( not ( = ?auto_65728 ?auto_65726 ) ) ( not ( = ?auto_65730 ?auto_65722 ) ) ( not ( = ?auto_65730 ?auto_65725 ) ) ( not ( = ?auto_65730 ?auto_65726 ) ) ( not ( = ?auto_65730 ?auto_65728 ) ) ( ON_BOARD ?auto_65733 ?auto_65737 ) ( SUPPORTS ?auto_65733 ?auto_65724 ) ( not ( = ?auto_65725 ?auto_65739 ) ) ( CALIBRATION_TARGET ?auto_65733 ?auto_65739 ) ( not ( = ?auto_65739 ?auto_65730 ) ) ( ON_BOARD ?auto_65732 ?auto_65737 ) ( not ( = ?auto_65733 ?auto_65732 ) ) ( SUPPORTS ?auto_65732 ?auto_65731 ) ( CALIBRATION_TARGET ?auto_65732 ?auto_65739 ) ( not ( = ?auto_65739 ?auto_65728 ) ) ( ON_BOARD ?auto_65738 ?auto_65737 ) ( not ( = ?auto_65732 ?auto_65738 ) ) ( SUPPORTS ?auto_65738 ?auto_65729 ) ( CALIBRATION_TARGET ?auto_65738 ?auto_65739 ) ( not ( = ?auto_65739 ?auto_65722 ) ) ( ON_BOARD ?auto_65734 ?auto_65737 ) ( not ( = ?auto_65738 ?auto_65734 ) ) ( SUPPORTS ?auto_65734 ?auto_65723 ) ( CALIBRATION_TARGET ?auto_65734 ?auto_65739 ) ( not ( = ?auto_65739 ?auto_65726 ) ) ( ON_BOARD ?auto_65735 ?auto_65737 ) ( not ( = ?auto_65734 ?auto_65735 ) ) ( SUPPORTS ?auto_65735 ?auto_65727 ) ( CALIBRATION_TARGET ?auto_65735 ?auto_65739 ) ( POWER_AVAIL ?auto_65737 ) ( POINTING ?auto_65737 ?auto_65736 ) ( not ( = ?auto_65739 ?auto_65736 ) ) ( not ( = ?auto_65726 ?auto_65736 ) ) ( not ( = ?auto_65727 ?auto_65723 ) ) ( not ( = ?auto_65722 ?auto_65736 ) ) ( not ( = ?auto_65727 ?auto_65729 ) ) ( not ( = ?auto_65723 ?auto_65729 ) ) ( not ( = ?auto_65728 ?auto_65736 ) ) ( not ( = ?auto_65738 ?auto_65735 ) ) ( not ( = ?auto_65727 ?auto_65731 ) ) ( not ( = ?auto_65723 ?auto_65731 ) ) ( not ( = ?auto_65729 ?auto_65731 ) ) ( not ( = ?auto_65730 ?auto_65736 ) ) ( not ( = ?auto_65732 ?auto_65734 ) ) ( not ( = ?auto_65732 ?auto_65735 ) ) ( not ( = ?auto_65727 ?auto_65724 ) ) ( not ( = ?auto_65723 ?auto_65724 ) ) ( not ( = ?auto_65729 ?auto_65724 ) ) ( not ( = ?auto_65731 ?auto_65724 ) ) ( not ( = ?auto_65725 ?auto_65736 ) ) ( not ( = ?auto_65733 ?auto_65738 ) ) ( not ( = ?auto_65733 ?auto_65734 ) ) ( not ( = ?auto_65733 ?auto_65735 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_65726 ?auto_65727 ?auto_65722 ?auto_65723 ?auto_65728 ?auto_65729 ?auto_65725 ?auto_65724 ?auto_65730 ?auto_65731 )
      ( GET-5IMAGE-VERIFY ?auto_65722 ?auto_65723 ?auto_65725 ?auto_65724 ?auto_65726 ?auto_65727 ?auto_65728 ?auto_65729 ?auto_65730 ?auto_65731 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_65800 - DIRECTION
      ?auto_65801 - MODE
      ?auto_65803 - DIRECTION
      ?auto_65802 - MODE
      ?auto_65804 - DIRECTION
      ?auto_65805 - MODE
      ?auto_65806 - DIRECTION
      ?auto_65807 - MODE
      ?auto_65808 - DIRECTION
      ?auto_65809 - MODE
    )
    :vars
    (
      ?auto_65811 - INSTRUMENT
      ?auto_65815 - SATELLITE
      ?auto_65817 - DIRECTION
      ?auto_65810 - INSTRUMENT
      ?auto_65816 - INSTRUMENT
      ?auto_65812 - INSTRUMENT
      ?auto_65813 - INSTRUMENT
      ?auto_65814 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_65803 ?auto_65800 ) ) ( not ( = ?auto_65804 ?auto_65800 ) ) ( not ( = ?auto_65804 ?auto_65803 ) ) ( not ( = ?auto_65806 ?auto_65800 ) ) ( not ( = ?auto_65806 ?auto_65803 ) ) ( not ( = ?auto_65806 ?auto_65804 ) ) ( not ( = ?auto_65808 ?auto_65800 ) ) ( not ( = ?auto_65808 ?auto_65803 ) ) ( not ( = ?auto_65808 ?auto_65804 ) ) ( not ( = ?auto_65808 ?auto_65806 ) ) ( ON_BOARD ?auto_65811 ?auto_65815 ) ( SUPPORTS ?auto_65811 ?auto_65802 ) ( not ( = ?auto_65803 ?auto_65817 ) ) ( CALIBRATION_TARGET ?auto_65811 ?auto_65817 ) ( not ( = ?auto_65817 ?auto_65806 ) ) ( ON_BOARD ?auto_65810 ?auto_65815 ) ( not ( = ?auto_65811 ?auto_65810 ) ) ( SUPPORTS ?auto_65810 ?auto_65807 ) ( CALIBRATION_TARGET ?auto_65810 ?auto_65817 ) ( not ( = ?auto_65817 ?auto_65808 ) ) ( ON_BOARD ?auto_65816 ?auto_65815 ) ( not ( = ?auto_65810 ?auto_65816 ) ) ( SUPPORTS ?auto_65816 ?auto_65809 ) ( CALIBRATION_TARGET ?auto_65816 ?auto_65817 ) ( not ( = ?auto_65817 ?auto_65800 ) ) ( ON_BOARD ?auto_65812 ?auto_65815 ) ( not ( = ?auto_65816 ?auto_65812 ) ) ( SUPPORTS ?auto_65812 ?auto_65801 ) ( CALIBRATION_TARGET ?auto_65812 ?auto_65817 ) ( not ( = ?auto_65817 ?auto_65804 ) ) ( ON_BOARD ?auto_65813 ?auto_65815 ) ( not ( = ?auto_65812 ?auto_65813 ) ) ( SUPPORTS ?auto_65813 ?auto_65805 ) ( CALIBRATION_TARGET ?auto_65813 ?auto_65817 ) ( POWER_AVAIL ?auto_65815 ) ( POINTING ?auto_65815 ?auto_65814 ) ( not ( = ?auto_65817 ?auto_65814 ) ) ( not ( = ?auto_65804 ?auto_65814 ) ) ( not ( = ?auto_65805 ?auto_65801 ) ) ( not ( = ?auto_65800 ?auto_65814 ) ) ( not ( = ?auto_65805 ?auto_65809 ) ) ( not ( = ?auto_65801 ?auto_65809 ) ) ( not ( = ?auto_65808 ?auto_65814 ) ) ( not ( = ?auto_65816 ?auto_65813 ) ) ( not ( = ?auto_65805 ?auto_65807 ) ) ( not ( = ?auto_65801 ?auto_65807 ) ) ( not ( = ?auto_65809 ?auto_65807 ) ) ( not ( = ?auto_65806 ?auto_65814 ) ) ( not ( = ?auto_65810 ?auto_65812 ) ) ( not ( = ?auto_65810 ?auto_65813 ) ) ( not ( = ?auto_65805 ?auto_65802 ) ) ( not ( = ?auto_65801 ?auto_65802 ) ) ( not ( = ?auto_65809 ?auto_65802 ) ) ( not ( = ?auto_65807 ?auto_65802 ) ) ( not ( = ?auto_65803 ?auto_65814 ) ) ( not ( = ?auto_65811 ?auto_65816 ) ) ( not ( = ?auto_65811 ?auto_65812 ) ) ( not ( = ?auto_65811 ?auto_65813 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_65804 ?auto_65805 ?auto_65800 ?auto_65801 ?auto_65808 ?auto_65809 ?auto_65803 ?auto_65802 ?auto_65806 ?auto_65807 )
      ( GET-5IMAGE-VERIFY ?auto_65800 ?auto_65801 ?auto_65803 ?auto_65802 ?auto_65804 ?auto_65805 ?auto_65806 ?auto_65807 ?auto_65808 ?auto_65809 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_66570 - DIRECTION
      ?auto_66571 - MODE
      ?auto_66573 - DIRECTION
      ?auto_66572 - MODE
      ?auto_66574 - DIRECTION
      ?auto_66575 - MODE
      ?auto_66576 - DIRECTION
      ?auto_66577 - MODE
      ?auto_66578 - DIRECTION
      ?auto_66579 - MODE
    )
    :vars
    (
      ?auto_66581 - INSTRUMENT
      ?auto_66585 - SATELLITE
      ?auto_66587 - DIRECTION
      ?auto_66580 - INSTRUMENT
      ?auto_66586 - INSTRUMENT
      ?auto_66582 - INSTRUMENT
      ?auto_66583 - INSTRUMENT
      ?auto_66584 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_66573 ?auto_66570 ) ) ( not ( = ?auto_66574 ?auto_66570 ) ) ( not ( = ?auto_66574 ?auto_66573 ) ) ( not ( = ?auto_66576 ?auto_66570 ) ) ( not ( = ?auto_66576 ?auto_66573 ) ) ( not ( = ?auto_66576 ?auto_66574 ) ) ( not ( = ?auto_66578 ?auto_66570 ) ) ( not ( = ?auto_66578 ?auto_66573 ) ) ( not ( = ?auto_66578 ?auto_66574 ) ) ( not ( = ?auto_66578 ?auto_66576 ) ) ( ON_BOARD ?auto_66581 ?auto_66585 ) ( SUPPORTS ?auto_66581 ?auto_66572 ) ( not ( = ?auto_66573 ?auto_66587 ) ) ( CALIBRATION_TARGET ?auto_66581 ?auto_66587 ) ( not ( = ?auto_66587 ?auto_66578 ) ) ( ON_BOARD ?auto_66580 ?auto_66585 ) ( not ( = ?auto_66581 ?auto_66580 ) ) ( SUPPORTS ?auto_66580 ?auto_66579 ) ( CALIBRATION_TARGET ?auto_66580 ?auto_66587 ) ( not ( = ?auto_66587 ?auto_66574 ) ) ( ON_BOARD ?auto_66586 ?auto_66585 ) ( not ( = ?auto_66580 ?auto_66586 ) ) ( SUPPORTS ?auto_66586 ?auto_66575 ) ( CALIBRATION_TARGET ?auto_66586 ?auto_66587 ) ( not ( = ?auto_66587 ?auto_66570 ) ) ( ON_BOARD ?auto_66582 ?auto_66585 ) ( not ( = ?auto_66586 ?auto_66582 ) ) ( SUPPORTS ?auto_66582 ?auto_66571 ) ( CALIBRATION_TARGET ?auto_66582 ?auto_66587 ) ( not ( = ?auto_66587 ?auto_66576 ) ) ( ON_BOARD ?auto_66583 ?auto_66585 ) ( not ( = ?auto_66582 ?auto_66583 ) ) ( SUPPORTS ?auto_66583 ?auto_66577 ) ( CALIBRATION_TARGET ?auto_66583 ?auto_66587 ) ( POWER_AVAIL ?auto_66585 ) ( POINTING ?auto_66585 ?auto_66584 ) ( not ( = ?auto_66587 ?auto_66584 ) ) ( not ( = ?auto_66576 ?auto_66584 ) ) ( not ( = ?auto_66577 ?auto_66571 ) ) ( not ( = ?auto_66570 ?auto_66584 ) ) ( not ( = ?auto_66577 ?auto_66575 ) ) ( not ( = ?auto_66571 ?auto_66575 ) ) ( not ( = ?auto_66574 ?auto_66584 ) ) ( not ( = ?auto_66586 ?auto_66583 ) ) ( not ( = ?auto_66577 ?auto_66579 ) ) ( not ( = ?auto_66571 ?auto_66579 ) ) ( not ( = ?auto_66575 ?auto_66579 ) ) ( not ( = ?auto_66578 ?auto_66584 ) ) ( not ( = ?auto_66580 ?auto_66582 ) ) ( not ( = ?auto_66580 ?auto_66583 ) ) ( not ( = ?auto_66577 ?auto_66572 ) ) ( not ( = ?auto_66571 ?auto_66572 ) ) ( not ( = ?auto_66575 ?auto_66572 ) ) ( not ( = ?auto_66579 ?auto_66572 ) ) ( not ( = ?auto_66573 ?auto_66584 ) ) ( not ( = ?auto_66581 ?auto_66586 ) ) ( not ( = ?auto_66581 ?auto_66582 ) ) ( not ( = ?auto_66581 ?auto_66583 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_66576 ?auto_66577 ?auto_66570 ?auto_66571 ?auto_66574 ?auto_66575 ?auto_66573 ?auto_66572 ?auto_66578 ?auto_66579 )
      ( GET-5IMAGE-VERIFY ?auto_66570 ?auto_66571 ?auto_66573 ?auto_66572 ?auto_66574 ?auto_66575 ?auto_66576 ?auto_66577 ?auto_66578 ?auto_66579 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_66820 - DIRECTION
      ?auto_66821 - MODE
      ?auto_66823 - DIRECTION
      ?auto_66822 - MODE
      ?auto_66824 - DIRECTION
      ?auto_66825 - MODE
      ?auto_66826 - DIRECTION
      ?auto_66827 - MODE
      ?auto_66828 - DIRECTION
      ?auto_66829 - MODE
    )
    :vars
    (
      ?auto_66831 - INSTRUMENT
      ?auto_66835 - SATELLITE
      ?auto_66837 - DIRECTION
      ?auto_66830 - INSTRUMENT
      ?auto_66836 - INSTRUMENT
      ?auto_66832 - INSTRUMENT
      ?auto_66833 - INSTRUMENT
      ?auto_66834 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_66823 ?auto_66820 ) ) ( not ( = ?auto_66824 ?auto_66820 ) ) ( not ( = ?auto_66824 ?auto_66823 ) ) ( not ( = ?auto_66826 ?auto_66820 ) ) ( not ( = ?auto_66826 ?auto_66823 ) ) ( not ( = ?auto_66826 ?auto_66824 ) ) ( not ( = ?auto_66828 ?auto_66820 ) ) ( not ( = ?auto_66828 ?auto_66823 ) ) ( not ( = ?auto_66828 ?auto_66824 ) ) ( not ( = ?auto_66828 ?auto_66826 ) ) ( ON_BOARD ?auto_66831 ?auto_66835 ) ( SUPPORTS ?auto_66831 ?auto_66822 ) ( not ( = ?auto_66823 ?auto_66837 ) ) ( CALIBRATION_TARGET ?auto_66831 ?auto_66837 ) ( not ( = ?auto_66837 ?auto_66826 ) ) ( ON_BOARD ?auto_66830 ?auto_66835 ) ( not ( = ?auto_66831 ?auto_66830 ) ) ( SUPPORTS ?auto_66830 ?auto_66827 ) ( CALIBRATION_TARGET ?auto_66830 ?auto_66837 ) ( not ( = ?auto_66837 ?auto_66824 ) ) ( ON_BOARD ?auto_66836 ?auto_66835 ) ( not ( = ?auto_66830 ?auto_66836 ) ) ( SUPPORTS ?auto_66836 ?auto_66825 ) ( CALIBRATION_TARGET ?auto_66836 ?auto_66837 ) ( not ( = ?auto_66837 ?auto_66820 ) ) ( ON_BOARD ?auto_66832 ?auto_66835 ) ( not ( = ?auto_66836 ?auto_66832 ) ) ( SUPPORTS ?auto_66832 ?auto_66821 ) ( CALIBRATION_TARGET ?auto_66832 ?auto_66837 ) ( not ( = ?auto_66837 ?auto_66828 ) ) ( ON_BOARD ?auto_66833 ?auto_66835 ) ( not ( = ?auto_66832 ?auto_66833 ) ) ( SUPPORTS ?auto_66833 ?auto_66829 ) ( CALIBRATION_TARGET ?auto_66833 ?auto_66837 ) ( POWER_AVAIL ?auto_66835 ) ( POINTING ?auto_66835 ?auto_66834 ) ( not ( = ?auto_66837 ?auto_66834 ) ) ( not ( = ?auto_66828 ?auto_66834 ) ) ( not ( = ?auto_66829 ?auto_66821 ) ) ( not ( = ?auto_66820 ?auto_66834 ) ) ( not ( = ?auto_66829 ?auto_66825 ) ) ( not ( = ?auto_66821 ?auto_66825 ) ) ( not ( = ?auto_66824 ?auto_66834 ) ) ( not ( = ?auto_66836 ?auto_66833 ) ) ( not ( = ?auto_66829 ?auto_66827 ) ) ( not ( = ?auto_66821 ?auto_66827 ) ) ( not ( = ?auto_66825 ?auto_66827 ) ) ( not ( = ?auto_66826 ?auto_66834 ) ) ( not ( = ?auto_66830 ?auto_66832 ) ) ( not ( = ?auto_66830 ?auto_66833 ) ) ( not ( = ?auto_66829 ?auto_66822 ) ) ( not ( = ?auto_66821 ?auto_66822 ) ) ( not ( = ?auto_66825 ?auto_66822 ) ) ( not ( = ?auto_66827 ?auto_66822 ) ) ( not ( = ?auto_66823 ?auto_66834 ) ) ( not ( = ?auto_66831 ?auto_66836 ) ) ( not ( = ?auto_66831 ?auto_66832 ) ) ( not ( = ?auto_66831 ?auto_66833 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_66828 ?auto_66829 ?auto_66820 ?auto_66821 ?auto_66824 ?auto_66825 ?auto_66823 ?auto_66822 ?auto_66826 ?auto_66827 )
      ( GET-5IMAGE-VERIFY ?auto_66820 ?auto_66821 ?auto_66823 ?auto_66822 ?auto_66824 ?auto_66825 ?auto_66826 ?auto_66827 ?auto_66828 ?auto_66829 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_67064 - DIRECTION
      ?auto_67065 - MODE
      ?auto_67067 - DIRECTION
      ?auto_67066 - MODE
      ?auto_67068 - DIRECTION
      ?auto_67069 - MODE
      ?auto_67070 - DIRECTION
      ?auto_67071 - MODE
      ?auto_67072 - DIRECTION
      ?auto_67073 - MODE
    )
    :vars
    (
      ?auto_67075 - INSTRUMENT
      ?auto_67079 - SATELLITE
      ?auto_67081 - DIRECTION
      ?auto_67074 - INSTRUMENT
      ?auto_67080 - INSTRUMENT
      ?auto_67076 - INSTRUMENT
      ?auto_67077 - INSTRUMENT
      ?auto_67078 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_67067 ?auto_67064 ) ) ( not ( = ?auto_67068 ?auto_67064 ) ) ( not ( = ?auto_67068 ?auto_67067 ) ) ( not ( = ?auto_67070 ?auto_67064 ) ) ( not ( = ?auto_67070 ?auto_67067 ) ) ( not ( = ?auto_67070 ?auto_67068 ) ) ( not ( = ?auto_67072 ?auto_67064 ) ) ( not ( = ?auto_67072 ?auto_67067 ) ) ( not ( = ?auto_67072 ?auto_67068 ) ) ( not ( = ?auto_67072 ?auto_67070 ) ) ( ON_BOARD ?auto_67075 ?auto_67079 ) ( SUPPORTS ?auto_67075 ?auto_67066 ) ( not ( = ?auto_67067 ?auto_67081 ) ) ( CALIBRATION_TARGET ?auto_67075 ?auto_67081 ) ( not ( = ?auto_67081 ?auto_67068 ) ) ( ON_BOARD ?auto_67074 ?auto_67079 ) ( not ( = ?auto_67075 ?auto_67074 ) ) ( SUPPORTS ?auto_67074 ?auto_67069 ) ( CALIBRATION_TARGET ?auto_67074 ?auto_67081 ) ( not ( = ?auto_67081 ?auto_67072 ) ) ( ON_BOARD ?auto_67080 ?auto_67079 ) ( not ( = ?auto_67074 ?auto_67080 ) ) ( SUPPORTS ?auto_67080 ?auto_67073 ) ( CALIBRATION_TARGET ?auto_67080 ?auto_67081 ) ( not ( = ?auto_67081 ?auto_67064 ) ) ( ON_BOARD ?auto_67076 ?auto_67079 ) ( not ( = ?auto_67080 ?auto_67076 ) ) ( SUPPORTS ?auto_67076 ?auto_67065 ) ( CALIBRATION_TARGET ?auto_67076 ?auto_67081 ) ( not ( = ?auto_67081 ?auto_67070 ) ) ( ON_BOARD ?auto_67077 ?auto_67079 ) ( not ( = ?auto_67076 ?auto_67077 ) ) ( SUPPORTS ?auto_67077 ?auto_67071 ) ( CALIBRATION_TARGET ?auto_67077 ?auto_67081 ) ( POWER_AVAIL ?auto_67079 ) ( POINTING ?auto_67079 ?auto_67078 ) ( not ( = ?auto_67081 ?auto_67078 ) ) ( not ( = ?auto_67070 ?auto_67078 ) ) ( not ( = ?auto_67071 ?auto_67065 ) ) ( not ( = ?auto_67064 ?auto_67078 ) ) ( not ( = ?auto_67071 ?auto_67073 ) ) ( not ( = ?auto_67065 ?auto_67073 ) ) ( not ( = ?auto_67072 ?auto_67078 ) ) ( not ( = ?auto_67080 ?auto_67077 ) ) ( not ( = ?auto_67071 ?auto_67069 ) ) ( not ( = ?auto_67065 ?auto_67069 ) ) ( not ( = ?auto_67073 ?auto_67069 ) ) ( not ( = ?auto_67068 ?auto_67078 ) ) ( not ( = ?auto_67074 ?auto_67076 ) ) ( not ( = ?auto_67074 ?auto_67077 ) ) ( not ( = ?auto_67071 ?auto_67066 ) ) ( not ( = ?auto_67065 ?auto_67066 ) ) ( not ( = ?auto_67073 ?auto_67066 ) ) ( not ( = ?auto_67069 ?auto_67066 ) ) ( not ( = ?auto_67067 ?auto_67078 ) ) ( not ( = ?auto_67075 ?auto_67080 ) ) ( not ( = ?auto_67075 ?auto_67076 ) ) ( not ( = ?auto_67075 ?auto_67077 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_67070 ?auto_67071 ?auto_67064 ?auto_67065 ?auto_67072 ?auto_67073 ?auto_67067 ?auto_67066 ?auto_67068 ?auto_67069 )
      ( GET-5IMAGE-VERIFY ?auto_67064 ?auto_67065 ?auto_67067 ?auto_67066 ?auto_67068 ?auto_67069 ?auto_67070 ?auto_67071 ?auto_67072 ?auto_67073 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_67228 - DIRECTION
      ?auto_67229 - MODE
      ?auto_67231 - DIRECTION
      ?auto_67230 - MODE
      ?auto_67232 - DIRECTION
      ?auto_67233 - MODE
      ?auto_67234 - DIRECTION
      ?auto_67235 - MODE
      ?auto_67236 - DIRECTION
      ?auto_67237 - MODE
    )
    :vars
    (
      ?auto_67239 - INSTRUMENT
      ?auto_67243 - SATELLITE
      ?auto_67245 - DIRECTION
      ?auto_67238 - INSTRUMENT
      ?auto_67244 - INSTRUMENT
      ?auto_67240 - INSTRUMENT
      ?auto_67241 - INSTRUMENT
      ?auto_67242 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_67231 ?auto_67228 ) ) ( not ( = ?auto_67232 ?auto_67228 ) ) ( not ( = ?auto_67232 ?auto_67231 ) ) ( not ( = ?auto_67234 ?auto_67228 ) ) ( not ( = ?auto_67234 ?auto_67231 ) ) ( not ( = ?auto_67234 ?auto_67232 ) ) ( not ( = ?auto_67236 ?auto_67228 ) ) ( not ( = ?auto_67236 ?auto_67231 ) ) ( not ( = ?auto_67236 ?auto_67232 ) ) ( not ( = ?auto_67236 ?auto_67234 ) ) ( ON_BOARD ?auto_67239 ?auto_67243 ) ( SUPPORTS ?auto_67239 ?auto_67230 ) ( not ( = ?auto_67231 ?auto_67245 ) ) ( CALIBRATION_TARGET ?auto_67239 ?auto_67245 ) ( not ( = ?auto_67245 ?auto_67232 ) ) ( ON_BOARD ?auto_67238 ?auto_67243 ) ( not ( = ?auto_67239 ?auto_67238 ) ) ( SUPPORTS ?auto_67238 ?auto_67233 ) ( CALIBRATION_TARGET ?auto_67238 ?auto_67245 ) ( not ( = ?auto_67245 ?auto_67234 ) ) ( ON_BOARD ?auto_67244 ?auto_67243 ) ( not ( = ?auto_67238 ?auto_67244 ) ) ( SUPPORTS ?auto_67244 ?auto_67235 ) ( CALIBRATION_TARGET ?auto_67244 ?auto_67245 ) ( not ( = ?auto_67245 ?auto_67228 ) ) ( ON_BOARD ?auto_67240 ?auto_67243 ) ( not ( = ?auto_67244 ?auto_67240 ) ) ( SUPPORTS ?auto_67240 ?auto_67229 ) ( CALIBRATION_TARGET ?auto_67240 ?auto_67245 ) ( not ( = ?auto_67245 ?auto_67236 ) ) ( ON_BOARD ?auto_67241 ?auto_67243 ) ( not ( = ?auto_67240 ?auto_67241 ) ) ( SUPPORTS ?auto_67241 ?auto_67237 ) ( CALIBRATION_TARGET ?auto_67241 ?auto_67245 ) ( POWER_AVAIL ?auto_67243 ) ( POINTING ?auto_67243 ?auto_67242 ) ( not ( = ?auto_67245 ?auto_67242 ) ) ( not ( = ?auto_67236 ?auto_67242 ) ) ( not ( = ?auto_67237 ?auto_67229 ) ) ( not ( = ?auto_67228 ?auto_67242 ) ) ( not ( = ?auto_67237 ?auto_67235 ) ) ( not ( = ?auto_67229 ?auto_67235 ) ) ( not ( = ?auto_67234 ?auto_67242 ) ) ( not ( = ?auto_67244 ?auto_67241 ) ) ( not ( = ?auto_67237 ?auto_67233 ) ) ( not ( = ?auto_67229 ?auto_67233 ) ) ( not ( = ?auto_67235 ?auto_67233 ) ) ( not ( = ?auto_67232 ?auto_67242 ) ) ( not ( = ?auto_67238 ?auto_67240 ) ) ( not ( = ?auto_67238 ?auto_67241 ) ) ( not ( = ?auto_67237 ?auto_67230 ) ) ( not ( = ?auto_67229 ?auto_67230 ) ) ( not ( = ?auto_67235 ?auto_67230 ) ) ( not ( = ?auto_67233 ?auto_67230 ) ) ( not ( = ?auto_67231 ?auto_67242 ) ) ( not ( = ?auto_67239 ?auto_67244 ) ) ( not ( = ?auto_67239 ?auto_67240 ) ) ( not ( = ?auto_67239 ?auto_67241 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_67236 ?auto_67237 ?auto_67228 ?auto_67229 ?auto_67234 ?auto_67235 ?auto_67231 ?auto_67230 ?auto_67232 ?auto_67233 )
      ( GET-5IMAGE-VERIFY ?auto_67228 ?auto_67229 ?auto_67231 ?auto_67230 ?auto_67232 ?auto_67233 ?auto_67234 ?auto_67235 ?auto_67236 ?auto_67237 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_68334 - DIRECTION
      ?auto_68335 - MODE
      ?auto_68337 - DIRECTION
      ?auto_68336 - MODE
      ?auto_68338 - DIRECTION
      ?auto_68339 - MODE
      ?auto_68340 - DIRECTION
      ?auto_68341 - MODE
      ?auto_68342 - DIRECTION
      ?auto_68343 - MODE
    )
    :vars
    (
      ?auto_68345 - INSTRUMENT
      ?auto_68349 - SATELLITE
      ?auto_68351 - DIRECTION
      ?auto_68344 - INSTRUMENT
      ?auto_68350 - INSTRUMENT
      ?auto_68346 - INSTRUMENT
      ?auto_68347 - INSTRUMENT
      ?auto_68348 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_68337 ?auto_68334 ) ) ( not ( = ?auto_68338 ?auto_68334 ) ) ( not ( = ?auto_68338 ?auto_68337 ) ) ( not ( = ?auto_68340 ?auto_68334 ) ) ( not ( = ?auto_68340 ?auto_68337 ) ) ( not ( = ?auto_68340 ?auto_68338 ) ) ( not ( = ?auto_68342 ?auto_68334 ) ) ( not ( = ?auto_68342 ?auto_68337 ) ) ( not ( = ?auto_68342 ?auto_68338 ) ) ( not ( = ?auto_68342 ?auto_68340 ) ) ( ON_BOARD ?auto_68345 ?auto_68349 ) ( SUPPORTS ?auto_68345 ?auto_68343 ) ( not ( = ?auto_68342 ?auto_68351 ) ) ( CALIBRATION_TARGET ?auto_68345 ?auto_68351 ) ( not ( = ?auto_68351 ?auto_68340 ) ) ( ON_BOARD ?auto_68344 ?auto_68349 ) ( not ( = ?auto_68345 ?auto_68344 ) ) ( SUPPORTS ?auto_68344 ?auto_68341 ) ( CALIBRATION_TARGET ?auto_68344 ?auto_68351 ) ( not ( = ?auto_68351 ?auto_68334 ) ) ( ON_BOARD ?auto_68350 ?auto_68349 ) ( not ( = ?auto_68344 ?auto_68350 ) ) ( SUPPORTS ?auto_68350 ?auto_68335 ) ( CALIBRATION_TARGET ?auto_68350 ?auto_68351 ) ( not ( = ?auto_68351 ?auto_68338 ) ) ( ON_BOARD ?auto_68346 ?auto_68349 ) ( not ( = ?auto_68350 ?auto_68346 ) ) ( SUPPORTS ?auto_68346 ?auto_68339 ) ( CALIBRATION_TARGET ?auto_68346 ?auto_68351 ) ( not ( = ?auto_68351 ?auto_68337 ) ) ( ON_BOARD ?auto_68347 ?auto_68349 ) ( not ( = ?auto_68346 ?auto_68347 ) ) ( SUPPORTS ?auto_68347 ?auto_68336 ) ( CALIBRATION_TARGET ?auto_68347 ?auto_68351 ) ( POWER_AVAIL ?auto_68349 ) ( POINTING ?auto_68349 ?auto_68348 ) ( not ( = ?auto_68351 ?auto_68348 ) ) ( not ( = ?auto_68337 ?auto_68348 ) ) ( not ( = ?auto_68336 ?auto_68339 ) ) ( not ( = ?auto_68338 ?auto_68348 ) ) ( not ( = ?auto_68336 ?auto_68335 ) ) ( not ( = ?auto_68339 ?auto_68335 ) ) ( not ( = ?auto_68334 ?auto_68348 ) ) ( not ( = ?auto_68350 ?auto_68347 ) ) ( not ( = ?auto_68336 ?auto_68341 ) ) ( not ( = ?auto_68339 ?auto_68341 ) ) ( not ( = ?auto_68335 ?auto_68341 ) ) ( not ( = ?auto_68340 ?auto_68348 ) ) ( not ( = ?auto_68344 ?auto_68346 ) ) ( not ( = ?auto_68344 ?auto_68347 ) ) ( not ( = ?auto_68336 ?auto_68343 ) ) ( not ( = ?auto_68339 ?auto_68343 ) ) ( not ( = ?auto_68335 ?auto_68343 ) ) ( not ( = ?auto_68341 ?auto_68343 ) ) ( not ( = ?auto_68342 ?auto_68348 ) ) ( not ( = ?auto_68345 ?auto_68350 ) ) ( not ( = ?auto_68345 ?auto_68346 ) ) ( not ( = ?auto_68345 ?auto_68347 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_68337 ?auto_68336 ?auto_68338 ?auto_68339 ?auto_68334 ?auto_68335 ?auto_68342 ?auto_68343 ?auto_68340 ?auto_68341 )
      ( GET-5IMAGE-VERIFY ?auto_68334 ?auto_68335 ?auto_68337 ?auto_68336 ?auto_68338 ?auto_68339 ?auto_68340 ?auto_68341 ?auto_68342 ?auto_68343 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_68412 - DIRECTION
      ?auto_68413 - MODE
      ?auto_68415 - DIRECTION
      ?auto_68414 - MODE
      ?auto_68416 - DIRECTION
      ?auto_68417 - MODE
      ?auto_68418 - DIRECTION
      ?auto_68419 - MODE
      ?auto_68420 - DIRECTION
      ?auto_68421 - MODE
    )
    :vars
    (
      ?auto_68423 - INSTRUMENT
      ?auto_68427 - SATELLITE
      ?auto_68429 - DIRECTION
      ?auto_68422 - INSTRUMENT
      ?auto_68428 - INSTRUMENT
      ?auto_68424 - INSTRUMENT
      ?auto_68425 - INSTRUMENT
      ?auto_68426 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_68415 ?auto_68412 ) ) ( not ( = ?auto_68416 ?auto_68412 ) ) ( not ( = ?auto_68416 ?auto_68415 ) ) ( not ( = ?auto_68418 ?auto_68412 ) ) ( not ( = ?auto_68418 ?auto_68415 ) ) ( not ( = ?auto_68418 ?auto_68416 ) ) ( not ( = ?auto_68420 ?auto_68412 ) ) ( not ( = ?auto_68420 ?auto_68415 ) ) ( not ( = ?auto_68420 ?auto_68416 ) ) ( not ( = ?auto_68420 ?auto_68418 ) ) ( ON_BOARD ?auto_68423 ?auto_68427 ) ( SUPPORTS ?auto_68423 ?auto_68419 ) ( not ( = ?auto_68418 ?auto_68429 ) ) ( CALIBRATION_TARGET ?auto_68423 ?auto_68429 ) ( not ( = ?auto_68429 ?auto_68420 ) ) ( ON_BOARD ?auto_68422 ?auto_68427 ) ( not ( = ?auto_68423 ?auto_68422 ) ) ( SUPPORTS ?auto_68422 ?auto_68421 ) ( CALIBRATION_TARGET ?auto_68422 ?auto_68429 ) ( not ( = ?auto_68429 ?auto_68412 ) ) ( ON_BOARD ?auto_68428 ?auto_68427 ) ( not ( = ?auto_68422 ?auto_68428 ) ) ( SUPPORTS ?auto_68428 ?auto_68413 ) ( CALIBRATION_TARGET ?auto_68428 ?auto_68429 ) ( not ( = ?auto_68429 ?auto_68416 ) ) ( ON_BOARD ?auto_68424 ?auto_68427 ) ( not ( = ?auto_68428 ?auto_68424 ) ) ( SUPPORTS ?auto_68424 ?auto_68417 ) ( CALIBRATION_TARGET ?auto_68424 ?auto_68429 ) ( not ( = ?auto_68429 ?auto_68415 ) ) ( ON_BOARD ?auto_68425 ?auto_68427 ) ( not ( = ?auto_68424 ?auto_68425 ) ) ( SUPPORTS ?auto_68425 ?auto_68414 ) ( CALIBRATION_TARGET ?auto_68425 ?auto_68429 ) ( POWER_AVAIL ?auto_68427 ) ( POINTING ?auto_68427 ?auto_68426 ) ( not ( = ?auto_68429 ?auto_68426 ) ) ( not ( = ?auto_68415 ?auto_68426 ) ) ( not ( = ?auto_68414 ?auto_68417 ) ) ( not ( = ?auto_68416 ?auto_68426 ) ) ( not ( = ?auto_68414 ?auto_68413 ) ) ( not ( = ?auto_68417 ?auto_68413 ) ) ( not ( = ?auto_68412 ?auto_68426 ) ) ( not ( = ?auto_68428 ?auto_68425 ) ) ( not ( = ?auto_68414 ?auto_68421 ) ) ( not ( = ?auto_68417 ?auto_68421 ) ) ( not ( = ?auto_68413 ?auto_68421 ) ) ( not ( = ?auto_68420 ?auto_68426 ) ) ( not ( = ?auto_68422 ?auto_68424 ) ) ( not ( = ?auto_68422 ?auto_68425 ) ) ( not ( = ?auto_68414 ?auto_68419 ) ) ( not ( = ?auto_68417 ?auto_68419 ) ) ( not ( = ?auto_68413 ?auto_68419 ) ) ( not ( = ?auto_68421 ?auto_68419 ) ) ( not ( = ?auto_68418 ?auto_68426 ) ) ( not ( = ?auto_68423 ?auto_68428 ) ) ( not ( = ?auto_68423 ?auto_68424 ) ) ( not ( = ?auto_68423 ?auto_68425 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_68415 ?auto_68414 ?auto_68416 ?auto_68417 ?auto_68412 ?auto_68413 ?auto_68418 ?auto_68419 ?auto_68420 ?auto_68421 )
      ( GET-5IMAGE-VERIFY ?auto_68412 ?auto_68413 ?auto_68415 ?auto_68414 ?auto_68416 ?auto_68417 ?auto_68418 ?auto_68419 ?auto_68420 ?auto_68421 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_68660 - DIRECTION
      ?auto_68661 - MODE
      ?auto_68663 - DIRECTION
      ?auto_68662 - MODE
      ?auto_68664 - DIRECTION
      ?auto_68665 - MODE
      ?auto_68666 - DIRECTION
      ?auto_68667 - MODE
      ?auto_68668 - DIRECTION
      ?auto_68669 - MODE
    )
    :vars
    (
      ?auto_68671 - INSTRUMENT
      ?auto_68675 - SATELLITE
      ?auto_68677 - DIRECTION
      ?auto_68670 - INSTRUMENT
      ?auto_68676 - INSTRUMENT
      ?auto_68672 - INSTRUMENT
      ?auto_68673 - INSTRUMENT
      ?auto_68674 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_68663 ?auto_68660 ) ) ( not ( = ?auto_68664 ?auto_68660 ) ) ( not ( = ?auto_68664 ?auto_68663 ) ) ( not ( = ?auto_68666 ?auto_68660 ) ) ( not ( = ?auto_68666 ?auto_68663 ) ) ( not ( = ?auto_68666 ?auto_68664 ) ) ( not ( = ?auto_68668 ?auto_68660 ) ) ( not ( = ?auto_68668 ?auto_68663 ) ) ( not ( = ?auto_68668 ?auto_68664 ) ) ( not ( = ?auto_68668 ?auto_68666 ) ) ( ON_BOARD ?auto_68671 ?auto_68675 ) ( SUPPORTS ?auto_68671 ?auto_68669 ) ( not ( = ?auto_68668 ?auto_68677 ) ) ( CALIBRATION_TARGET ?auto_68671 ?auto_68677 ) ( not ( = ?auto_68677 ?auto_68664 ) ) ( ON_BOARD ?auto_68670 ?auto_68675 ) ( not ( = ?auto_68671 ?auto_68670 ) ) ( SUPPORTS ?auto_68670 ?auto_68665 ) ( CALIBRATION_TARGET ?auto_68670 ?auto_68677 ) ( not ( = ?auto_68677 ?auto_68660 ) ) ( ON_BOARD ?auto_68676 ?auto_68675 ) ( not ( = ?auto_68670 ?auto_68676 ) ) ( SUPPORTS ?auto_68676 ?auto_68661 ) ( CALIBRATION_TARGET ?auto_68676 ?auto_68677 ) ( not ( = ?auto_68677 ?auto_68666 ) ) ( ON_BOARD ?auto_68672 ?auto_68675 ) ( not ( = ?auto_68676 ?auto_68672 ) ) ( SUPPORTS ?auto_68672 ?auto_68667 ) ( CALIBRATION_TARGET ?auto_68672 ?auto_68677 ) ( not ( = ?auto_68677 ?auto_68663 ) ) ( ON_BOARD ?auto_68673 ?auto_68675 ) ( not ( = ?auto_68672 ?auto_68673 ) ) ( SUPPORTS ?auto_68673 ?auto_68662 ) ( CALIBRATION_TARGET ?auto_68673 ?auto_68677 ) ( POWER_AVAIL ?auto_68675 ) ( POINTING ?auto_68675 ?auto_68674 ) ( not ( = ?auto_68677 ?auto_68674 ) ) ( not ( = ?auto_68663 ?auto_68674 ) ) ( not ( = ?auto_68662 ?auto_68667 ) ) ( not ( = ?auto_68666 ?auto_68674 ) ) ( not ( = ?auto_68662 ?auto_68661 ) ) ( not ( = ?auto_68667 ?auto_68661 ) ) ( not ( = ?auto_68660 ?auto_68674 ) ) ( not ( = ?auto_68676 ?auto_68673 ) ) ( not ( = ?auto_68662 ?auto_68665 ) ) ( not ( = ?auto_68667 ?auto_68665 ) ) ( not ( = ?auto_68661 ?auto_68665 ) ) ( not ( = ?auto_68664 ?auto_68674 ) ) ( not ( = ?auto_68670 ?auto_68672 ) ) ( not ( = ?auto_68670 ?auto_68673 ) ) ( not ( = ?auto_68662 ?auto_68669 ) ) ( not ( = ?auto_68667 ?auto_68669 ) ) ( not ( = ?auto_68661 ?auto_68669 ) ) ( not ( = ?auto_68665 ?auto_68669 ) ) ( not ( = ?auto_68668 ?auto_68674 ) ) ( not ( = ?auto_68671 ?auto_68676 ) ) ( not ( = ?auto_68671 ?auto_68672 ) ) ( not ( = ?auto_68671 ?auto_68673 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_68663 ?auto_68662 ?auto_68666 ?auto_68667 ?auto_68660 ?auto_68661 ?auto_68668 ?auto_68669 ?auto_68664 ?auto_68665 )
      ( GET-5IMAGE-VERIFY ?auto_68660 ?auto_68661 ?auto_68663 ?auto_68662 ?auto_68664 ?auto_68665 ?auto_68666 ?auto_68667 ?auto_68668 ?auto_68669 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_68738 - DIRECTION
      ?auto_68739 - MODE
      ?auto_68741 - DIRECTION
      ?auto_68740 - MODE
      ?auto_68742 - DIRECTION
      ?auto_68743 - MODE
      ?auto_68744 - DIRECTION
      ?auto_68745 - MODE
      ?auto_68746 - DIRECTION
      ?auto_68747 - MODE
    )
    :vars
    (
      ?auto_68749 - INSTRUMENT
      ?auto_68753 - SATELLITE
      ?auto_68755 - DIRECTION
      ?auto_68748 - INSTRUMENT
      ?auto_68754 - INSTRUMENT
      ?auto_68750 - INSTRUMENT
      ?auto_68751 - INSTRUMENT
      ?auto_68752 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_68741 ?auto_68738 ) ) ( not ( = ?auto_68742 ?auto_68738 ) ) ( not ( = ?auto_68742 ?auto_68741 ) ) ( not ( = ?auto_68744 ?auto_68738 ) ) ( not ( = ?auto_68744 ?auto_68741 ) ) ( not ( = ?auto_68744 ?auto_68742 ) ) ( not ( = ?auto_68746 ?auto_68738 ) ) ( not ( = ?auto_68746 ?auto_68741 ) ) ( not ( = ?auto_68746 ?auto_68742 ) ) ( not ( = ?auto_68746 ?auto_68744 ) ) ( ON_BOARD ?auto_68749 ?auto_68753 ) ( SUPPORTS ?auto_68749 ?auto_68745 ) ( not ( = ?auto_68744 ?auto_68755 ) ) ( CALIBRATION_TARGET ?auto_68749 ?auto_68755 ) ( not ( = ?auto_68755 ?auto_68742 ) ) ( ON_BOARD ?auto_68748 ?auto_68753 ) ( not ( = ?auto_68749 ?auto_68748 ) ) ( SUPPORTS ?auto_68748 ?auto_68743 ) ( CALIBRATION_TARGET ?auto_68748 ?auto_68755 ) ( not ( = ?auto_68755 ?auto_68738 ) ) ( ON_BOARD ?auto_68754 ?auto_68753 ) ( not ( = ?auto_68748 ?auto_68754 ) ) ( SUPPORTS ?auto_68754 ?auto_68739 ) ( CALIBRATION_TARGET ?auto_68754 ?auto_68755 ) ( not ( = ?auto_68755 ?auto_68746 ) ) ( ON_BOARD ?auto_68750 ?auto_68753 ) ( not ( = ?auto_68754 ?auto_68750 ) ) ( SUPPORTS ?auto_68750 ?auto_68747 ) ( CALIBRATION_TARGET ?auto_68750 ?auto_68755 ) ( not ( = ?auto_68755 ?auto_68741 ) ) ( ON_BOARD ?auto_68751 ?auto_68753 ) ( not ( = ?auto_68750 ?auto_68751 ) ) ( SUPPORTS ?auto_68751 ?auto_68740 ) ( CALIBRATION_TARGET ?auto_68751 ?auto_68755 ) ( POWER_AVAIL ?auto_68753 ) ( POINTING ?auto_68753 ?auto_68752 ) ( not ( = ?auto_68755 ?auto_68752 ) ) ( not ( = ?auto_68741 ?auto_68752 ) ) ( not ( = ?auto_68740 ?auto_68747 ) ) ( not ( = ?auto_68746 ?auto_68752 ) ) ( not ( = ?auto_68740 ?auto_68739 ) ) ( not ( = ?auto_68747 ?auto_68739 ) ) ( not ( = ?auto_68738 ?auto_68752 ) ) ( not ( = ?auto_68754 ?auto_68751 ) ) ( not ( = ?auto_68740 ?auto_68743 ) ) ( not ( = ?auto_68747 ?auto_68743 ) ) ( not ( = ?auto_68739 ?auto_68743 ) ) ( not ( = ?auto_68742 ?auto_68752 ) ) ( not ( = ?auto_68748 ?auto_68750 ) ) ( not ( = ?auto_68748 ?auto_68751 ) ) ( not ( = ?auto_68740 ?auto_68745 ) ) ( not ( = ?auto_68747 ?auto_68745 ) ) ( not ( = ?auto_68739 ?auto_68745 ) ) ( not ( = ?auto_68743 ?auto_68745 ) ) ( not ( = ?auto_68744 ?auto_68752 ) ) ( not ( = ?auto_68749 ?auto_68754 ) ) ( not ( = ?auto_68749 ?auto_68750 ) ) ( not ( = ?auto_68749 ?auto_68751 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_68741 ?auto_68740 ?auto_68746 ?auto_68747 ?auto_68738 ?auto_68739 ?auto_68744 ?auto_68745 ?auto_68742 ?auto_68743 )
      ( GET-5IMAGE-VERIFY ?auto_68738 ?auto_68739 ?auto_68741 ?auto_68740 ?auto_68742 ?auto_68743 ?auto_68744 ?auto_68745 ?auto_68746 ?auto_68747 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_68982 - DIRECTION
      ?auto_68983 - MODE
      ?auto_68985 - DIRECTION
      ?auto_68984 - MODE
      ?auto_68986 - DIRECTION
      ?auto_68987 - MODE
      ?auto_68988 - DIRECTION
      ?auto_68989 - MODE
      ?auto_68990 - DIRECTION
      ?auto_68991 - MODE
    )
    :vars
    (
      ?auto_68993 - INSTRUMENT
      ?auto_68997 - SATELLITE
      ?auto_68999 - DIRECTION
      ?auto_68992 - INSTRUMENT
      ?auto_68998 - INSTRUMENT
      ?auto_68994 - INSTRUMENT
      ?auto_68995 - INSTRUMENT
      ?auto_68996 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_68985 ?auto_68982 ) ) ( not ( = ?auto_68986 ?auto_68982 ) ) ( not ( = ?auto_68986 ?auto_68985 ) ) ( not ( = ?auto_68988 ?auto_68982 ) ) ( not ( = ?auto_68988 ?auto_68985 ) ) ( not ( = ?auto_68988 ?auto_68986 ) ) ( not ( = ?auto_68990 ?auto_68982 ) ) ( not ( = ?auto_68990 ?auto_68985 ) ) ( not ( = ?auto_68990 ?auto_68986 ) ) ( not ( = ?auto_68990 ?auto_68988 ) ) ( ON_BOARD ?auto_68993 ?auto_68997 ) ( SUPPORTS ?auto_68993 ?auto_68987 ) ( not ( = ?auto_68986 ?auto_68999 ) ) ( CALIBRATION_TARGET ?auto_68993 ?auto_68999 ) ( not ( = ?auto_68999 ?auto_68990 ) ) ( ON_BOARD ?auto_68992 ?auto_68997 ) ( not ( = ?auto_68993 ?auto_68992 ) ) ( SUPPORTS ?auto_68992 ?auto_68991 ) ( CALIBRATION_TARGET ?auto_68992 ?auto_68999 ) ( not ( = ?auto_68999 ?auto_68982 ) ) ( ON_BOARD ?auto_68998 ?auto_68997 ) ( not ( = ?auto_68992 ?auto_68998 ) ) ( SUPPORTS ?auto_68998 ?auto_68983 ) ( CALIBRATION_TARGET ?auto_68998 ?auto_68999 ) ( not ( = ?auto_68999 ?auto_68988 ) ) ( ON_BOARD ?auto_68994 ?auto_68997 ) ( not ( = ?auto_68998 ?auto_68994 ) ) ( SUPPORTS ?auto_68994 ?auto_68989 ) ( CALIBRATION_TARGET ?auto_68994 ?auto_68999 ) ( not ( = ?auto_68999 ?auto_68985 ) ) ( ON_BOARD ?auto_68995 ?auto_68997 ) ( not ( = ?auto_68994 ?auto_68995 ) ) ( SUPPORTS ?auto_68995 ?auto_68984 ) ( CALIBRATION_TARGET ?auto_68995 ?auto_68999 ) ( POWER_AVAIL ?auto_68997 ) ( POINTING ?auto_68997 ?auto_68996 ) ( not ( = ?auto_68999 ?auto_68996 ) ) ( not ( = ?auto_68985 ?auto_68996 ) ) ( not ( = ?auto_68984 ?auto_68989 ) ) ( not ( = ?auto_68988 ?auto_68996 ) ) ( not ( = ?auto_68984 ?auto_68983 ) ) ( not ( = ?auto_68989 ?auto_68983 ) ) ( not ( = ?auto_68982 ?auto_68996 ) ) ( not ( = ?auto_68998 ?auto_68995 ) ) ( not ( = ?auto_68984 ?auto_68991 ) ) ( not ( = ?auto_68989 ?auto_68991 ) ) ( not ( = ?auto_68983 ?auto_68991 ) ) ( not ( = ?auto_68990 ?auto_68996 ) ) ( not ( = ?auto_68992 ?auto_68994 ) ) ( not ( = ?auto_68992 ?auto_68995 ) ) ( not ( = ?auto_68984 ?auto_68987 ) ) ( not ( = ?auto_68989 ?auto_68987 ) ) ( not ( = ?auto_68983 ?auto_68987 ) ) ( not ( = ?auto_68991 ?auto_68987 ) ) ( not ( = ?auto_68986 ?auto_68996 ) ) ( not ( = ?auto_68993 ?auto_68998 ) ) ( not ( = ?auto_68993 ?auto_68994 ) ) ( not ( = ?auto_68993 ?auto_68995 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_68985 ?auto_68984 ?auto_68988 ?auto_68989 ?auto_68982 ?auto_68983 ?auto_68986 ?auto_68987 ?auto_68990 ?auto_68991 )
      ( GET-5IMAGE-VERIFY ?auto_68982 ?auto_68983 ?auto_68985 ?auto_68984 ?auto_68986 ?auto_68987 ?auto_68988 ?auto_68989 ?auto_68990 ?auto_68991 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_69146 - DIRECTION
      ?auto_69147 - MODE
      ?auto_69149 - DIRECTION
      ?auto_69148 - MODE
      ?auto_69150 - DIRECTION
      ?auto_69151 - MODE
      ?auto_69152 - DIRECTION
      ?auto_69153 - MODE
      ?auto_69154 - DIRECTION
      ?auto_69155 - MODE
    )
    :vars
    (
      ?auto_69157 - INSTRUMENT
      ?auto_69161 - SATELLITE
      ?auto_69163 - DIRECTION
      ?auto_69156 - INSTRUMENT
      ?auto_69162 - INSTRUMENT
      ?auto_69158 - INSTRUMENT
      ?auto_69159 - INSTRUMENT
      ?auto_69160 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_69149 ?auto_69146 ) ) ( not ( = ?auto_69150 ?auto_69146 ) ) ( not ( = ?auto_69150 ?auto_69149 ) ) ( not ( = ?auto_69152 ?auto_69146 ) ) ( not ( = ?auto_69152 ?auto_69149 ) ) ( not ( = ?auto_69152 ?auto_69150 ) ) ( not ( = ?auto_69154 ?auto_69146 ) ) ( not ( = ?auto_69154 ?auto_69149 ) ) ( not ( = ?auto_69154 ?auto_69150 ) ) ( not ( = ?auto_69154 ?auto_69152 ) ) ( ON_BOARD ?auto_69157 ?auto_69161 ) ( SUPPORTS ?auto_69157 ?auto_69151 ) ( not ( = ?auto_69150 ?auto_69163 ) ) ( CALIBRATION_TARGET ?auto_69157 ?auto_69163 ) ( not ( = ?auto_69163 ?auto_69152 ) ) ( ON_BOARD ?auto_69156 ?auto_69161 ) ( not ( = ?auto_69157 ?auto_69156 ) ) ( SUPPORTS ?auto_69156 ?auto_69153 ) ( CALIBRATION_TARGET ?auto_69156 ?auto_69163 ) ( not ( = ?auto_69163 ?auto_69146 ) ) ( ON_BOARD ?auto_69162 ?auto_69161 ) ( not ( = ?auto_69156 ?auto_69162 ) ) ( SUPPORTS ?auto_69162 ?auto_69147 ) ( CALIBRATION_TARGET ?auto_69162 ?auto_69163 ) ( not ( = ?auto_69163 ?auto_69154 ) ) ( ON_BOARD ?auto_69158 ?auto_69161 ) ( not ( = ?auto_69162 ?auto_69158 ) ) ( SUPPORTS ?auto_69158 ?auto_69155 ) ( CALIBRATION_TARGET ?auto_69158 ?auto_69163 ) ( not ( = ?auto_69163 ?auto_69149 ) ) ( ON_BOARD ?auto_69159 ?auto_69161 ) ( not ( = ?auto_69158 ?auto_69159 ) ) ( SUPPORTS ?auto_69159 ?auto_69148 ) ( CALIBRATION_TARGET ?auto_69159 ?auto_69163 ) ( POWER_AVAIL ?auto_69161 ) ( POINTING ?auto_69161 ?auto_69160 ) ( not ( = ?auto_69163 ?auto_69160 ) ) ( not ( = ?auto_69149 ?auto_69160 ) ) ( not ( = ?auto_69148 ?auto_69155 ) ) ( not ( = ?auto_69154 ?auto_69160 ) ) ( not ( = ?auto_69148 ?auto_69147 ) ) ( not ( = ?auto_69155 ?auto_69147 ) ) ( not ( = ?auto_69146 ?auto_69160 ) ) ( not ( = ?auto_69162 ?auto_69159 ) ) ( not ( = ?auto_69148 ?auto_69153 ) ) ( not ( = ?auto_69155 ?auto_69153 ) ) ( not ( = ?auto_69147 ?auto_69153 ) ) ( not ( = ?auto_69152 ?auto_69160 ) ) ( not ( = ?auto_69156 ?auto_69158 ) ) ( not ( = ?auto_69156 ?auto_69159 ) ) ( not ( = ?auto_69148 ?auto_69151 ) ) ( not ( = ?auto_69155 ?auto_69151 ) ) ( not ( = ?auto_69147 ?auto_69151 ) ) ( not ( = ?auto_69153 ?auto_69151 ) ) ( not ( = ?auto_69150 ?auto_69160 ) ) ( not ( = ?auto_69157 ?auto_69162 ) ) ( not ( = ?auto_69157 ?auto_69158 ) ) ( not ( = ?auto_69157 ?auto_69159 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_69149 ?auto_69148 ?auto_69154 ?auto_69155 ?auto_69146 ?auto_69147 ?auto_69150 ?auto_69151 ?auto_69152 ?auto_69153 )
      ( GET-5IMAGE-VERIFY ?auto_69146 ?auto_69147 ?auto_69149 ?auto_69148 ?auto_69150 ?auto_69151 ?auto_69152 ?auto_69153 ?auto_69154 ?auto_69155 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_69390 - DIRECTION
      ?auto_69391 - MODE
      ?auto_69393 - DIRECTION
      ?auto_69392 - MODE
      ?auto_69394 - DIRECTION
      ?auto_69395 - MODE
      ?auto_69396 - DIRECTION
      ?auto_69397 - MODE
      ?auto_69398 - DIRECTION
      ?auto_69399 - MODE
    )
    :vars
    (
      ?auto_69401 - INSTRUMENT
      ?auto_69405 - SATELLITE
      ?auto_69407 - DIRECTION
      ?auto_69400 - INSTRUMENT
      ?auto_69406 - INSTRUMENT
      ?auto_69402 - INSTRUMENT
      ?auto_69403 - INSTRUMENT
      ?auto_69404 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_69393 ?auto_69390 ) ) ( not ( = ?auto_69394 ?auto_69390 ) ) ( not ( = ?auto_69394 ?auto_69393 ) ) ( not ( = ?auto_69396 ?auto_69390 ) ) ( not ( = ?auto_69396 ?auto_69393 ) ) ( not ( = ?auto_69396 ?auto_69394 ) ) ( not ( = ?auto_69398 ?auto_69390 ) ) ( not ( = ?auto_69398 ?auto_69393 ) ) ( not ( = ?auto_69398 ?auto_69394 ) ) ( not ( = ?auto_69398 ?auto_69396 ) ) ( ON_BOARD ?auto_69401 ?auto_69405 ) ( SUPPORTS ?auto_69401 ?auto_69399 ) ( not ( = ?auto_69398 ?auto_69407 ) ) ( CALIBRATION_TARGET ?auto_69401 ?auto_69407 ) ( not ( = ?auto_69407 ?auto_69396 ) ) ( ON_BOARD ?auto_69400 ?auto_69405 ) ( not ( = ?auto_69401 ?auto_69400 ) ) ( SUPPORTS ?auto_69400 ?auto_69397 ) ( CALIBRATION_TARGET ?auto_69400 ?auto_69407 ) ( not ( = ?auto_69407 ?auto_69390 ) ) ( ON_BOARD ?auto_69406 ?auto_69405 ) ( not ( = ?auto_69400 ?auto_69406 ) ) ( SUPPORTS ?auto_69406 ?auto_69391 ) ( CALIBRATION_TARGET ?auto_69406 ?auto_69407 ) ( not ( = ?auto_69407 ?auto_69393 ) ) ( ON_BOARD ?auto_69402 ?auto_69405 ) ( not ( = ?auto_69406 ?auto_69402 ) ) ( SUPPORTS ?auto_69402 ?auto_69392 ) ( CALIBRATION_TARGET ?auto_69402 ?auto_69407 ) ( not ( = ?auto_69407 ?auto_69394 ) ) ( ON_BOARD ?auto_69403 ?auto_69405 ) ( not ( = ?auto_69402 ?auto_69403 ) ) ( SUPPORTS ?auto_69403 ?auto_69395 ) ( CALIBRATION_TARGET ?auto_69403 ?auto_69407 ) ( POWER_AVAIL ?auto_69405 ) ( POINTING ?auto_69405 ?auto_69404 ) ( not ( = ?auto_69407 ?auto_69404 ) ) ( not ( = ?auto_69394 ?auto_69404 ) ) ( not ( = ?auto_69395 ?auto_69392 ) ) ( not ( = ?auto_69393 ?auto_69404 ) ) ( not ( = ?auto_69395 ?auto_69391 ) ) ( not ( = ?auto_69392 ?auto_69391 ) ) ( not ( = ?auto_69390 ?auto_69404 ) ) ( not ( = ?auto_69406 ?auto_69403 ) ) ( not ( = ?auto_69395 ?auto_69397 ) ) ( not ( = ?auto_69392 ?auto_69397 ) ) ( not ( = ?auto_69391 ?auto_69397 ) ) ( not ( = ?auto_69396 ?auto_69404 ) ) ( not ( = ?auto_69400 ?auto_69402 ) ) ( not ( = ?auto_69400 ?auto_69403 ) ) ( not ( = ?auto_69395 ?auto_69399 ) ) ( not ( = ?auto_69392 ?auto_69399 ) ) ( not ( = ?auto_69391 ?auto_69399 ) ) ( not ( = ?auto_69397 ?auto_69399 ) ) ( not ( = ?auto_69398 ?auto_69404 ) ) ( not ( = ?auto_69401 ?auto_69406 ) ) ( not ( = ?auto_69401 ?auto_69402 ) ) ( not ( = ?auto_69401 ?auto_69403 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_69394 ?auto_69395 ?auto_69393 ?auto_69392 ?auto_69390 ?auto_69391 ?auto_69398 ?auto_69399 ?auto_69396 ?auto_69397 )
      ( GET-5IMAGE-VERIFY ?auto_69390 ?auto_69391 ?auto_69393 ?auto_69392 ?auto_69394 ?auto_69395 ?auto_69396 ?auto_69397 ?auto_69398 ?auto_69399 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_69468 - DIRECTION
      ?auto_69469 - MODE
      ?auto_69471 - DIRECTION
      ?auto_69470 - MODE
      ?auto_69472 - DIRECTION
      ?auto_69473 - MODE
      ?auto_69474 - DIRECTION
      ?auto_69475 - MODE
      ?auto_69476 - DIRECTION
      ?auto_69477 - MODE
    )
    :vars
    (
      ?auto_69479 - INSTRUMENT
      ?auto_69483 - SATELLITE
      ?auto_69485 - DIRECTION
      ?auto_69478 - INSTRUMENT
      ?auto_69484 - INSTRUMENT
      ?auto_69480 - INSTRUMENT
      ?auto_69481 - INSTRUMENT
      ?auto_69482 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_69471 ?auto_69468 ) ) ( not ( = ?auto_69472 ?auto_69468 ) ) ( not ( = ?auto_69472 ?auto_69471 ) ) ( not ( = ?auto_69474 ?auto_69468 ) ) ( not ( = ?auto_69474 ?auto_69471 ) ) ( not ( = ?auto_69474 ?auto_69472 ) ) ( not ( = ?auto_69476 ?auto_69468 ) ) ( not ( = ?auto_69476 ?auto_69471 ) ) ( not ( = ?auto_69476 ?auto_69472 ) ) ( not ( = ?auto_69476 ?auto_69474 ) ) ( ON_BOARD ?auto_69479 ?auto_69483 ) ( SUPPORTS ?auto_69479 ?auto_69475 ) ( not ( = ?auto_69474 ?auto_69485 ) ) ( CALIBRATION_TARGET ?auto_69479 ?auto_69485 ) ( not ( = ?auto_69485 ?auto_69476 ) ) ( ON_BOARD ?auto_69478 ?auto_69483 ) ( not ( = ?auto_69479 ?auto_69478 ) ) ( SUPPORTS ?auto_69478 ?auto_69477 ) ( CALIBRATION_TARGET ?auto_69478 ?auto_69485 ) ( not ( = ?auto_69485 ?auto_69468 ) ) ( ON_BOARD ?auto_69484 ?auto_69483 ) ( not ( = ?auto_69478 ?auto_69484 ) ) ( SUPPORTS ?auto_69484 ?auto_69469 ) ( CALIBRATION_TARGET ?auto_69484 ?auto_69485 ) ( not ( = ?auto_69485 ?auto_69471 ) ) ( ON_BOARD ?auto_69480 ?auto_69483 ) ( not ( = ?auto_69484 ?auto_69480 ) ) ( SUPPORTS ?auto_69480 ?auto_69470 ) ( CALIBRATION_TARGET ?auto_69480 ?auto_69485 ) ( not ( = ?auto_69485 ?auto_69472 ) ) ( ON_BOARD ?auto_69481 ?auto_69483 ) ( not ( = ?auto_69480 ?auto_69481 ) ) ( SUPPORTS ?auto_69481 ?auto_69473 ) ( CALIBRATION_TARGET ?auto_69481 ?auto_69485 ) ( POWER_AVAIL ?auto_69483 ) ( POINTING ?auto_69483 ?auto_69482 ) ( not ( = ?auto_69485 ?auto_69482 ) ) ( not ( = ?auto_69472 ?auto_69482 ) ) ( not ( = ?auto_69473 ?auto_69470 ) ) ( not ( = ?auto_69471 ?auto_69482 ) ) ( not ( = ?auto_69473 ?auto_69469 ) ) ( not ( = ?auto_69470 ?auto_69469 ) ) ( not ( = ?auto_69468 ?auto_69482 ) ) ( not ( = ?auto_69484 ?auto_69481 ) ) ( not ( = ?auto_69473 ?auto_69477 ) ) ( not ( = ?auto_69470 ?auto_69477 ) ) ( not ( = ?auto_69469 ?auto_69477 ) ) ( not ( = ?auto_69476 ?auto_69482 ) ) ( not ( = ?auto_69478 ?auto_69480 ) ) ( not ( = ?auto_69478 ?auto_69481 ) ) ( not ( = ?auto_69473 ?auto_69475 ) ) ( not ( = ?auto_69470 ?auto_69475 ) ) ( not ( = ?auto_69469 ?auto_69475 ) ) ( not ( = ?auto_69477 ?auto_69475 ) ) ( not ( = ?auto_69474 ?auto_69482 ) ) ( not ( = ?auto_69479 ?auto_69484 ) ) ( not ( = ?auto_69479 ?auto_69480 ) ) ( not ( = ?auto_69479 ?auto_69481 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_69472 ?auto_69473 ?auto_69471 ?auto_69470 ?auto_69468 ?auto_69469 ?auto_69474 ?auto_69475 ?auto_69476 ?auto_69477 )
      ( GET-5IMAGE-VERIFY ?auto_69468 ?auto_69469 ?auto_69471 ?auto_69470 ?auto_69472 ?auto_69473 ?auto_69474 ?auto_69475 ?auto_69476 ?auto_69477 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_69886 - DIRECTION
      ?auto_69887 - MODE
      ?auto_69889 - DIRECTION
      ?auto_69888 - MODE
      ?auto_69890 - DIRECTION
      ?auto_69891 - MODE
      ?auto_69892 - DIRECTION
      ?auto_69893 - MODE
      ?auto_69894 - DIRECTION
      ?auto_69895 - MODE
    )
    :vars
    (
      ?auto_69897 - INSTRUMENT
      ?auto_69901 - SATELLITE
      ?auto_69903 - DIRECTION
      ?auto_69896 - INSTRUMENT
      ?auto_69902 - INSTRUMENT
      ?auto_69898 - INSTRUMENT
      ?auto_69899 - INSTRUMENT
      ?auto_69900 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_69889 ?auto_69886 ) ) ( not ( = ?auto_69890 ?auto_69886 ) ) ( not ( = ?auto_69890 ?auto_69889 ) ) ( not ( = ?auto_69892 ?auto_69886 ) ) ( not ( = ?auto_69892 ?auto_69889 ) ) ( not ( = ?auto_69892 ?auto_69890 ) ) ( not ( = ?auto_69894 ?auto_69886 ) ) ( not ( = ?auto_69894 ?auto_69889 ) ) ( not ( = ?auto_69894 ?auto_69890 ) ) ( not ( = ?auto_69894 ?auto_69892 ) ) ( ON_BOARD ?auto_69897 ?auto_69901 ) ( SUPPORTS ?auto_69897 ?auto_69895 ) ( not ( = ?auto_69894 ?auto_69903 ) ) ( CALIBRATION_TARGET ?auto_69897 ?auto_69903 ) ( not ( = ?auto_69903 ?auto_69890 ) ) ( ON_BOARD ?auto_69896 ?auto_69901 ) ( not ( = ?auto_69897 ?auto_69896 ) ) ( SUPPORTS ?auto_69896 ?auto_69891 ) ( CALIBRATION_TARGET ?auto_69896 ?auto_69903 ) ( not ( = ?auto_69903 ?auto_69886 ) ) ( ON_BOARD ?auto_69902 ?auto_69901 ) ( not ( = ?auto_69896 ?auto_69902 ) ) ( SUPPORTS ?auto_69902 ?auto_69887 ) ( CALIBRATION_TARGET ?auto_69902 ?auto_69903 ) ( not ( = ?auto_69903 ?auto_69889 ) ) ( ON_BOARD ?auto_69898 ?auto_69901 ) ( not ( = ?auto_69902 ?auto_69898 ) ) ( SUPPORTS ?auto_69898 ?auto_69888 ) ( CALIBRATION_TARGET ?auto_69898 ?auto_69903 ) ( not ( = ?auto_69903 ?auto_69892 ) ) ( ON_BOARD ?auto_69899 ?auto_69901 ) ( not ( = ?auto_69898 ?auto_69899 ) ) ( SUPPORTS ?auto_69899 ?auto_69893 ) ( CALIBRATION_TARGET ?auto_69899 ?auto_69903 ) ( POWER_AVAIL ?auto_69901 ) ( POINTING ?auto_69901 ?auto_69900 ) ( not ( = ?auto_69903 ?auto_69900 ) ) ( not ( = ?auto_69892 ?auto_69900 ) ) ( not ( = ?auto_69893 ?auto_69888 ) ) ( not ( = ?auto_69889 ?auto_69900 ) ) ( not ( = ?auto_69893 ?auto_69887 ) ) ( not ( = ?auto_69888 ?auto_69887 ) ) ( not ( = ?auto_69886 ?auto_69900 ) ) ( not ( = ?auto_69902 ?auto_69899 ) ) ( not ( = ?auto_69893 ?auto_69891 ) ) ( not ( = ?auto_69888 ?auto_69891 ) ) ( not ( = ?auto_69887 ?auto_69891 ) ) ( not ( = ?auto_69890 ?auto_69900 ) ) ( not ( = ?auto_69896 ?auto_69898 ) ) ( not ( = ?auto_69896 ?auto_69899 ) ) ( not ( = ?auto_69893 ?auto_69895 ) ) ( not ( = ?auto_69888 ?auto_69895 ) ) ( not ( = ?auto_69887 ?auto_69895 ) ) ( not ( = ?auto_69891 ?auto_69895 ) ) ( not ( = ?auto_69894 ?auto_69900 ) ) ( not ( = ?auto_69897 ?auto_69902 ) ) ( not ( = ?auto_69897 ?auto_69898 ) ) ( not ( = ?auto_69897 ?auto_69899 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_69892 ?auto_69893 ?auto_69889 ?auto_69888 ?auto_69886 ?auto_69887 ?auto_69894 ?auto_69895 ?auto_69890 ?auto_69891 )
      ( GET-5IMAGE-VERIFY ?auto_69886 ?auto_69887 ?auto_69889 ?auto_69888 ?auto_69890 ?auto_69891 ?auto_69892 ?auto_69893 ?auto_69894 ?auto_69895 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_69964 - DIRECTION
      ?auto_69965 - MODE
      ?auto_69967 - DIRECTION
      ?auto_69966 - MODE
      ?auto_69968 - DIRECTION
      ?auto_69969 - MODE
      ?auto_69970 - DIRECTION
      ?auto_69971 - MODE
      ?auto_69972 - DIRECTION
      ?auto_69973 - MODE
    )
    :vars
    (
      ?auto_69975 - INSTRUMENT
      ?auto_69979 - SATELLITE
      ?auto_69981 - DIRECTION
      ?auto_69974 - INSTRUMENT
      ?auto_69980 - INSTRUMENT
      ?auto_69976 - INSTRUMENT
      ?auto_69977 - INSTRUMENT
      ?auto_69978 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_69967 ?auto_69964 ) ) ( not ( = ?auto_69968 ?auto_69964 ) ) ( not ( = ?auto_69968 ?auto_69967 ) ) ( not ( = ?auto_69970 ?auto_69964 ) ) ( not ( = ?auto_69970 ?auto_69967 ) ) ( not ( = ?auto_69970 ?auto_69968 ) ) ( not ( = ?auto_69972 ?auto_69964 ) ) ( not ( = ?auto_69972 ?auto_69967 ) ) ( not ( = ?auto_69972 ?auto_69968 ) ) ( not ( = ?auto_69972 ?auto_69970 ) ) ( ON_BOARD ?auto_69975 ?auto_69979 ) ( SUPPORTS ?auto_69975 ?auto_69971 ) ( not ( = ?auto_69970 ?auto_69981 ) ) ( CALIBRATION_TARGET ?auto_69975 ?auto_69981 ) ( not ( = ?auto_69981 ?auto_69968 ) ) ( ON_BOARD ?auto_69974 ?auto_69979 ) ( not ( = ?auto_69975 ?auto_69974 ) ) ( SUPPORTS ?auto_69974 ?auto_69969 ) ( CALIBRATION_TARGET ?auto_69974 ?auto_69981 ) ( not ( = ?auto_69981 ?auto_69964 ) ) ( ON_BOARD ?auto_69980 ?auto_69979 ) ( not ( = ?auto_69974 ?auto_69980 ) ) ( SUPPORTS ?auto_69980 ?auto_69965 ) ( CALIBRATION_TARGET ?auto_69980 ?auto_69981 ) ( not ( = ?auto_69981 ?auto_69967 ) ) ( ON_BOARD ?auto_69976 ?auto_69979 ) ( not ( = ?auto_69980 ?auto_69976 ) ) ( SUPPORTS ?auto_69976 ?auto_69966 ) ( CALIBRATION_TARGET ?auto_69976 ?auto_69981 ) ( not ( = ?auto_69981 ?auto_69972 ) ) ( ON_BOARD ?auto_69977 ?auto_69979 ) ( not ( = ?auto_69976 ?auto_69977 ) ) ( SUPPORTS ?auto_69977 ?auto_69973 ) ( CALIBRATION_TARGET ?auto_69977 ?auto_69981 ) ( POWER_AVAIL ?auto_69979 ) ( POINTING ?auto_69979 ?auto_69978 ) ( not ( = ?auto_69981 ?auto_69978 ) ) ( not ( = ?auto_69972 ?auto_69978 ) ) ( not ( = ?auto_69973 ?auto_69966 ) ) ( not ( = ?auto_69967 ?auto_69978 ) ) ( not ( = ?auto_69973 ?auto_69965 ) ) ( not ( = ?auto_69966 ?auto_69965 ) ) ( not ( = ?auto_69964 ?auto_69978 ) ) ( not ( = ?auto_69980 ?auto_69977 ) ) ( not ( = ?auto_69973 ?auto_69969 ) ) ( not ( = ?auto_69966 ?auto_69969 ) ) ( not ( = ?auto_69965 ?auto_69969 ) ) ( not ( = ?auto_69968 ?auto_69978 ) ) ( not ( = ?auto_69974 ?auto_69976 ) ) ( not ( = ?auto_69974 ?auto_69977 ) ) ( not ( = ?auto_69973 ?auto_69971 ) ) ( not ( = ?auto_69966 ?auto_69971 ) ) ( not ( = ?auto_69965 ?auto_69971 ) ) ( not ( = ?auto_69969 ?auto_69971 ) ) ( not ( = ?auto_69970 ?auto_69978 ) ) ( not ( = ?auto_69975 ?auto_69980 ) ) ( not ( = ?auto_69975 ?auto_69976 ) ) ( not ( = ?auto_69975 ?auto_69977 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_69972 ?auto_69973 ?auto_69967 ?auto_69966 ?auto_69964 ?auto_69965 ?auto_69970 ?auto_69971 ?auto_69968 ?auto_69969 )
      ( GET-5IMAGE-VERIFY ?auto_69964 ?auto_69965 ?auto_69967 ?auto_69966 ?auto_69968 ?auto_69969 ?auto_69970 ?auto_69971 ?auto_69972 ?auto_69973 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_70122 - DIRECTION
      ?auto_70123 - MODE
      ?auto_70125 - DIRECTION
      ?auto_70124 - MODE
      ?auto_70126 - DIRECTION
      ?auto_70127 - MODE
      ?auto_70128 - DIRECTION
      ?auto_70129 - MODE
      ?auto_70130 - DIRECTION
      ?auto_70131 - MODE
    )
    :vars
    (
      ?auto_70133 - INSTRUMENT
      ?auto_70137 - SATELLITE
      ?auto_70139 - DIRECTION
      ?auto_70132 - INSTRUMENT
      ?auto_70138 - INSTRUMENT
      ?auto_70134 - INSTRUMENT
      ?auto_70135 - INSTRUMENT
      ?auto_70136 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_70125 ?auto_70122 ) ) ( not ( = ?auto_70126 ?auto_70122 ) ) ( not ( = ?auto_70126 ?auto_70125 ) ) ( not ( = ?auto_70128 ?auto_70122 ) ) ( not ( = ?auto_70128 ?auto_70125 ) ) ( not ( = ?auto_70128 ?auto_70126 ) ) ( not ( = ?auto_70130 ?auto_70122 ) ) ( not ( = ?auto_70130 ?auto_70125 ) ) ( not ( = ?auto_70130 ?auto_70126 ) ) ( not ( = ?auto_70130 ?auto_70128 ) ) ( ON_BOARD ?auto_70133 ?auto_70137 ) ( SUPPORTS ?auto_70133 ?auto_70127 ) ( not ( = ?auto_70126 ?auto_70139 ) ) ( CALIBRATION_TARGET ?auto_70133 ?auto_70139 ) ( not ( = ?auto_70139 ?auto_70130 ) ) ( ON_BOARD ?auto_70132 ?auto_70137 ) ( not ( = ?auto_70133 ?auto_70132 ) ) ( SUPPORTS ?auto_70132 ?auto_70131 ) ( CALIBRATION_TARGET ?auto_70132 ?auto_70139 ) ( not ( = ?auto_70139 ?auto_70122 ) ) ( ON_BOARD ?auto_70138 ?auto_70137 ) ( not ( = ?auto_70132 ?auto_70138 ) ) ( SUPPORTS ?auto_70138 ?auto_70123 ) ( CALIBRATION_TARGET ?auto_70138 ?auto_70139 ) ( not ( = ?auto_70139 ?auto_70125 ) ) ( ON_BOARD ?auto_70134 ?auto_70137 ) ( not ( = ?auto_70138 ?auto_70134 ) ) ( SUPPORTS ?auto_70134 ?auto_70124 ) ( CALIBRATION_TARGET ?auto_70134 ?auto_70139 ) ( not ( = ?auto_70139 ?auto_70128 ) ) ( ON_BOARD ?auto_70135 ?auto_70137 ) ( not ( = ?auto_70134 ?auto_70135 ) ) ( SUPPORTS ?auto_70135 ?auto_70129 ) ( CALIBRATION_TARGET ?auto_70135 ?auto_70139 ) ( POWER_AVAIL ?auto_70137 ) ( POINTING ?auto_70137 ?auto_70136 ) ( not ( = ?auto_70139 ?auto_70136 ) ) ( not ( = ?auto_70128 ?auto_70136 ) ) ( not ( = ?auto_70129 ?auto_70124 ) ) ( not ( = ?auto_70125 ?auto_70136 ) ) ( not ( = ?auto_70129 ?auto_70123 ) ) ( not ( = ?auto_70124 ?auto_70123 ) ) ( not ( = ?auto_70122 ?auto_70136 ) ) ( not ( = ?auto_70138 ?auto_70135 ) ) ( not ( = ?auto_70129 ?auto_70131 ) ) ( not ( = ?auto_70124 ?auto_70131 ) ) ( not ( = ?auto_70123 ?auto_70131 ) ) ( not ( = ?auto_70130 ?auto_70136 ) ) ( not ( = ?auto_70132 ?auto_70134 ) ) ( not ( = ?auto_70132 ?auto_70135 ) ) ( not ( = ?auto_70129 ?auto_70127 ) ) ( not ( = ?auto_70124 ?auto_70127 ) ) ( not ( = ?auto_70123 ?auto_70127 ) ) ( not ( = ?auto_70131 ?auto_70127 ) ) ( not ( = ?auto_70126 ?auto_70136 ) ) ( not ( = ?auto_70133 ?auto_70138 ) ) ( not ( = ?auto_70133 ?auto_70134 ) ) ( not ( = ?auto_70133 ?auto_70135 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_70128 ?auto_70129 ?auto_70125 ?auto_70124 ?auto_70122 ?auto_70123 ?auto_70126 ?auto_70127 ?auto_70130 ?auto_70131 )
      ( GET-5IMAGE-VERIFY ?auto_70122 ?auto_70123 ?auto_70125 ?auto_70124 ?auto_70126 ?auto_70127 ?auto_70128 ?auto_70129 ?auto_70130 ?auto_70131 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_70372 - DIRECTION
      ?auto_70373 - MODE
      ?auto_70375 - DIRECTION
      ?auto_70374 - MODE
      ?auto_70376 - DIRECTION
      ?auto_70377 - MODE
      ?auto_70378 - DIRECTION
      ?auto_70379 - MODE
      ?auto_70380 - DIRECTION
      ?auto_70381 - MODE
    )
    :vars
    (
      ?auto_70383 - INSTRUMENT
      ?auto_70387 - SATELLITE
      ?auto_70389 - DIRECTION
      ?auto_70382 - INSTRUMENT
      ?auto_70388 - INSTRUMENT
      ?auto_70384 - INSTRUMENT
      ?auto_70385 - INSTRUMENT
      ?auto_70386 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_70375 ?auto_70372 ) ) ( not ( = ?auto_70376 ?auto_70372 ) ) ( not ( = ?auto_70376 ?auto_70375 ) ) ( not ( = ?auto_70378 ?auto_70372 ) ) ( not ( = ?auto_70378 ?auto_70375 ) ) ( not ( = ?auto_70378 ?auto_70376 ) ) ( not ( = ?auto_70380 ?auto_70372 ) ) ( not ( = ?auto_70380 ?auto_70375 ) ) ( not ( = ?auto_70380 ?auto_70376 ) ) ( not ( = ?auto_70380 ?auto_70378 ) ) ( ON_BOARD ?auto_70383 ?auto_70387 ) ( SUPPORTS ?auto_70383 ?auto_70377 ) ( not ( = ?auto_70376 ?auto_70389 ) ) ( CALIBRATION_TARGET ?auto_70383 ?auto_70389 ) ( not ( = ?auto_70389 ?auto_70378 ) ) ( ON_BOARD ?auto_70382 ?auto_70387 ) ( not ( = ?auto_70383 ?auto_70382 ) ) ( SUPPORTS ?auto_70382 ?auto_70379 ) ( CALIBRATION_TARGET ?auto_70382 ?auto_70389 ) ( not ( = ?auto_70389 ?auto_70372 ) ) ( ON_BOARD ?auto_70388 ?auto_70387 ) ( not ( = ?auto_70382 ?auto_70388 ) ) ( SUPPORTS ?auto_70388 ?auto_70373 ) ( CALIBRATION_TARGET ?auto_70388 ?auto_70389 ) ( not ( = ?auto_70389 ?auto_70375 ) ) ( ON_BOARD ?auto_70384 ?auto_70387 ) ( not ( = ?auto_70388 ?auto_70384 ) ) ( SUPPORTS ?auto_70384 ?auto_70374 ) ( CALIBRATION_TARGET ?auto_70384 ?auto_70389 ) ( not ( = ?auto_70389 ?auto_70380 ) ) ( ON_BOARD ?auto_70385 ?auto_70387 ) ( not ( = ?auto_70384 ?auto_70385 ) ) ( SUPPORTS ?auto_70385 ?auto_70381 ) ( CALIBRATION_TARGET ?auto_70385 ?auto_70389 ) ( POWER_AVAIL ?auto_70387 ) ( POINTING ?auto_70387 ?auto_70386 ) ( not ( = ?auto_70389 ?auto_70386 ) ) ( not ( = ?auto_70380 ?auto_70386 ) ) ( not ( = ?auto_70381 ?auto_70374 ) ) ( not ( = ?auto_70375 ?auto_70386 ) ) ( not ( = ?auto_70381 ?auto_70373 ) ) ( not ( = ?auto_70374 ?auto_70373 ) ) ( not ( = ?auto_70372 ?auto_70386 ) ) ( not ( = ?auto_70388 ?auto_70385 ) ) ( not ( = ?auto_70381 ?auto_70379 ) ) ( not ( = ?auto_70374 ?auto_70379 ) ) ( not ( = ?auto_70373 ?auto_70379 ) ) ( not ( = ?auto_70378 ?auto_70386 ) ) ( not ( = ?auto_70382 ?auto_70384 ) ) ( not ( = ?auto_70382 ?auto_70385 ) ) ( not ( = ?auto_70381 ?auto_70377 ) ) ( not ( = ?auto_70374 ?auto_70377 ) ) ( not ( = ?auto_70373 ?auto_70377 ) ) ( not ( = ?auto_70379 ?auto_70377 ) ) ( not ( = ?auto_70376 ?auto_70386 ) ) ( not ( = ?auto_70383 ?auto_70388 ) ) ( not ( = ?auto_70383 ?auto_70384 ) ) ( not ( = ?auto_70383 ?auto_70385 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_70380 ?auto_70381 ?auto_70375 ?auto_70374 ?auto_70372 ?auto_70373 ?auto_70376 ?auto_70377 ?auto_70378 ?auto_70379 )
      ( GET-5IMAGE-VERIFY ?auto_70372 ?auto_70373 ?auto_70375 ?auto_70374 ?auto_70376 ?auto_70377 ?auto_70378 ?auto_70379 ?auto_70380 ?auto_70381 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_71916 - DIRECTION
      ?auto_71917 - MODE
      ?auto_71919 - DIRECTION
      ?auto_71918 - MODE
      ?auto_71920 - DIRECTION
      ?auto_71921 - MODE
      ?auto_71922 - DIRECTION
      ?auto_71923 - MODE
      ?auto_71924 - DIRECTION
      ?auto_71925 - MODE
    )
    :vars
    (
      ?auto_71927 - INSTRUMENT
      ?auto_71931 - SATELLITE
      ?auto_71933 - DIRECTION
      ?auto_71926 - INSTRUMENT
      ?auto_71932 - INSTRUMENT
      ?auto_71928 - INSTRUMENT
      ?auto_71929 - INSTRUMENT
      ?auto_71930 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_71919 ?auto_71916 ) ) ( not ( = ?auto_71920 ?auto_71916 ) ) ( not ( = ?auto_71920 ?auto_71919 ) ) ( not ( = ?auto_71922 ?auto_71916 ) ) ( not ( = ?auto_71922 ?auto_71919 ) ) ( not ( = ?auto_71922 ?auto_71920 ) ) ( not ( = ?auto_71924 ?auto_71916 ) ) ( not ( = ?auto_71924 ?auto_71919 ) ) ( not ( = ?auto_71924 ?auto_71920 ) ) ( not ( = ?auto_71924 ?auto_71922 ) ) ( ON_BOARD ?auto_71927 ?auto_71931 ) ( SUPPORTS ?auto_71927 ?auto_71925 ) ( not ( = ?auto_71924 ?auto_71933 ) ) ( CALIBRATION_TARGET ?auto_71927 ?auto_71933 ) ( not ( = ?auto_71933 ?auto_71919 ) ) ( ON_BOARD ?auto_71926 ?auto_71931 ) ( not ( = ?auto_71927 ?auto_71926 ) ) ( SUPPORTS ?auto_71926 ?auto_71918 ) ( CALIBRATION_TARGET ?auto_71926 ?auto_71933 ) ( not ( = ?auto_71933 ?auto_71916 ) ) ( ON_BOARD ?auto_71932 ?auto_71931 ) ( not ( = ?auto_71926 ?auto_71932 ) ) ( SUPPORTS ?auto_71932 ?auto_71917 ) ( CALIBRATION_TARGET ?auto_71932 ?auto_71933 ) ( not ( = ?auto_71933 ?auto_71922 ) ) ( ON_BOARD ?auto_71928 ?auto_71931 ) ( not ( = ?auto_71932 ?auto_71928 ) ) ( SUPPORTS ?auto_71928 ?auto_71923 ) ( CALIBRATION_TARGET ?auto_71928 ?auto_71933 ) ( not ( = ?auto_71933 ?auto_71920 ) ) ( ON_BOARD ?auto_71929 ?auto_71931 ) ( not ( = ?auto_71928 ?auto_71929 ) ) ( SUPPORTS ?auto_71929 ?auto_71921 ) ( CALIBRATION_TARGET ?auto_71929 ?auto_71933 ) ( POWER_AVAIL ?auto_71931 ) ( POINTING ?auto_71931 ?auto_71930 ) ( not ( = ?auto_71933 ?auto_71930 ) ) ( not ( = ?auto_71920 ?auto_71930 ) ) ( not ( = ?auto_71921 ?auto_71923 ) ) ( not ( = ?auto_71922 ?auto_71930 ) ) ( not ( = ?auto_71921 ?auto_71917 ) ) ( not ( = ?auto_71923 ?auto_71917 ) ) ( not ( = ?auto_71916 ?auto_71930 ) ) ( not ( = ?auto_71932 ?auto_71929 ) ) ( not ( = ?auto_71921 ?auto_71918 ) ) ( not ( = ?auto_71923 ?auto_71918 ) ) ( not ( = ?auto_71917 ?auto_71918 ) ) ( not ( = ?auto_71919 ?auto_71930 ) ) ( not ( = ?auto_71926 ?auto_71928 ) ) ( not ( = ?auto_71926 ?auto_71929 ) ) ( not ( = ?auto_71921 ?auto_71925 ) ) ( not ( = ?auto_71923 ?auto_71925 ) ) ( not ( = ?auto_71917 ?auto_71925 ) ) ( not ( = ?auto_71918 ?auto_71925 ) ) ( not ( = ?auto_71924 ?auto_71930 ) ) ( not ( = ?auto_71927 ?auto_71932 ) ) ( not ( = ?auto_71927 ?auto_71928 ) ) ( not ( = ?auto_71927 ?auto_71929 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_71920 ?auto_71921 ?auto_71922 ?auto_71923 ?auto_71916 ?auto_71917 ?auto_71924 ?auto_71925 ?auto_71919 ?auto_71918 )
      ( GET-5IMAGE-VERIFY ?auto_71916 ?auto_71917 ?auto_71919 ?auto_71918 ?auto_71920 ?auto_71921 ?auto_71922 ?auto_71923 ?auto_71924 ?auto_71925 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_71994 - DIRECTION
      ?auto_71995 - MODE
      ?auto_71997 - DIRECTION
      ?auto_71996 - MODE
      ?auto_71998 - DIRECTION
      ?auto_71999 - MODE
      ?auto_72000 - DIRECTION
      ?auto_72001 - MODE
      ?auto_72002 - DIRECTION
      ?auto_72003 - MODE
    )
    :vars
    (
      ?auto_72005 - INSTRUMENT
      ?auto_72009 - SATELLITE
      ?auto_72011 - DIRECTION
      ?auto_72004 - INSTRUMENT
      ?auto_72010 - INSTRUMENT
      ?auto_72006 - INSTRUMENT
      ?auto_72007 - INSTRUMENT
      ?auto_72008 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_71997 ?auto_71994 ) ) ( not ( = ?auto_71998 ?auto_71994 ) ) ( not ( = ?auto_71998 ?auto_71997 ) ) ( not ( = ?auto_72000 ?auto_71994 ) ) ( not ( = ?auto_72000 ?auto_71997 ) ) ( not ( = ?auto_72000 ?auto_71998 ) ) ( not ( = ?auto_72002 ?auto_71994 ) ) ( not ( = ?auto_72002 ?auto_71997 ) ) ( not ( = ?auto_72002 ?auto_71998 ) ) ( not ( = ?auto_72002 ?auto_72000 ) ) ( ON_BOARD ?auto_72005 ?auto_72009 ) ( SUPPORTS ?auto_72005 ?auto_72001 ) ( not ( = ?auto_72000 ?auto_72011 ) ) ( CALIBRATION_TARGET ?auto_72005 ?auto_72011 ) ( not ( = ?auto_72011 ?auto_71997 ) ) ( ON_BOARD ?auto_72004 ?auto_72009 ) ( not ( = ?auto_72005 ?auto_72004 ) ) ( SUPPORTS ?auto_72004 ?auto_71996 ) ( CALIBRATION_TARGET ?auto_72004 ?auto_72011 ) ( not ( = ?auto_72011 ?auto_71994 ) ) ( ON_BOARD ?auto_72010 ?auto_72009 ) ( not ( = ?auto_72004 ?auto_72010 ) ) ( SUPPORTS ?auto_72010 ?auto_71995 ) ( CALIBRATION_TARGET ?auto_72010 ?auto_72011 ) ( not ( = ?auto_72011 ?auto_72002 ) ) ( ON_BOARD ?auto_72006 ?auto_72009 ) ( not ( = ?auto_72010 ?auto_72006 ) ) ( SUPPORTS ?auto_72006 ?auto_72003 ) ( CALIBRATION_TARGET ?auto_72006 ?auto_72011 ) ( not ( = ?auto_72011 ?auto_71998 ) ) ( ON_BOARD ?auto_72007 ?auto_72009 ) ( not ( = ?auto_72006 ?auto_72007 ) ) ( SUPPORTS ?auto_72007 ?auto_71999 ) ( CALIBRATION_TARGET ?auto_72007 ?auto_72011 ) ( POWER_AVAIL ?auto_72009 ) ( POINTING ?auto_72009 ?auto_72008 ) ( not ( = ?auto_72011 ?auto_72008 ) ) ( not ( = ?auto_71998 ?auto_72008 ) ) ( not ( = ?auto_71999 ?auto_72003 ) ) ( not ( = ?auto_72002 ?auto_72008 ) ) ( not ( = ?auto_71999 ?auto_71995 ) ) ( not ( = ?auto_72003 ?auto_71995 ) ) ( not ( = ?auto_71994 ?auto_72008 ) ) ( not ( = ?auto_72010 ?auto_72007 ) ) ( not ( = ?auto_71999 ?auto_71996 ) ) ( not ( = ?auto_72003 ?auto_71996 ) ) ( not ( = ?auto_71995 ?auto_71996 ) ) ( not ( = ?auto_71997 ?auto_72008 ) ) ( not ( = ?auto_72004 ?auto_72006 ) ) ( not ( = ?auto_72004 ?auto_72007 ) ) ( not ( = ?auto_71999 ?auto_72001 ) ) ( not ( = ?auto_72003 ?auto_72001 ) ) ( not ( = ?auto_71995 ?auto_72001 ) ) ( not ( = ?auto_71996 ?auto_72001 ) ) ( not ( = ?auto_72000 ?auto_72008 ) ) ( not ( = ?auto_72005 ?auto_72010 ) ) ( not ( = ?auto_72005 ?auto_72006 ) ) ( not ( = ?auto_72005 ?auto_72007 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_71998 ?auto_71999 ?auto_72002 ?auto_72003 ?auto_71994 ?auto_71995 ?auto_72000 ?auto_72001 ?auto_71997 ?auto_71996 )
      ( GET-5IMAGE-VERIFY ?auto_71994 ?auto_71995 ?auto_71997 ?auto_71996 ?auto_71998 ?auto_71999 ?auto_72000 ?auto_72001 ?auto_72002 ?auto_72003 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_72072 - DIRECTION
      ?auto_72073 - MODE
      ?auto_72075 - DIRECTION
      ?auto_72074 - MODE
      ?auto_72076 - DIRECTION
      ?auto_72077 - MODE
      ?auto_72078 - DIRECTION
      ?auto_72079 - MODE
      ?auto_72080 - DIRECTION
      ?auto_72081 - MODE
    )
    :vars
    (
      ?auto_72083 - INSTRUMENT
      ?auto_72087 - SATELLITE
      ?auto_72089 - DIRECTION
      ?auto_72082 - INSTRUMENT
      ?auto_72088 - INSTRUMENT
      ?auto_72084 - INSTRUMENT
      ?auto_72085 - INSTRUMENT
      ?auto_72086 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_72075 ?auto_72072 ) ) ( not ( = ?auto_72076 ?auto_72072 ) ) ( not ( = ?auto_72076 ?auto_72075 ) ) ( not ( = ?auto_72078 ?auto_72072 ) ) ( not ( = ?auto_72078 ?auto_72075 ) ) ( not ( = ?auto_72078 ?auto_72076 ) ) ( not ( = ?auto_72080 ?auto_72072 ) ) ( not ( = ?auto_72080 ?auto_72075 ) ) ( not ( = ?auto_72080 ?auto_72076 ) ) ( not ( = ?auto_72080 ?auto_72078 ) ) ( ON_BOARD ?auto_72083 ?auto_72087 ) ( SUPPORTS ?auto_72083 ?auto_72081 ) ( not ( = ?auto_72080 ?auto_72089 ) ) ( CALIBRATION_TARGET ?auto_72083 ?auto_72089 ) ( not ( = ?auto_72089 ?auto_72075 ) ) ( ON_BOARD ?auto_72082 ?auto_72087 ) ( not ( = ?auto_72083 ?auto_72082 ) ) ( SUPPORTS ?auto_72082 ?auto_72074 ) ( CALIBRATION_TARGET ?auto_72082 ?auto_72089 ) ( not ( = ?auto_72089 ?auto_72072 ) ) ( ON_BOARD ?auto_72088 ?auto_72087 ) ( not ( = ?auto_72082 ?auto_72088 ) ) ( SUPPORTS ?auto_72088 ?auto_72073 ) ( CALIBRATION_TARGET ?auto_72088 ?auto_72089 ) ( not ( = ?auto_72089 ?auto_72076 ) ) ( ON_BOARD ?auto_72084 ?auto_72087 ) ( not ( = ?auto_72088 ?auto_72084 ) ) ( SUPPORTS ?auto_72084 ?auto_72077 ) ( CALIBRATION_TARGET ?auto_72084 ?auto_72089 ) ( not ( = ?auto_72089 ?auto_72078 ) ) ( ON_BOARD ?auto_72085 ?auto_72087 ) ( not ( = ?auto_72084 ?auto_72085 ) ) ( SUPPORTS ?auto_72085 ?auto_72079 ) ( CALIBRATION_TARGET ?auto_72085 ?auto_72089 ) ( POWER_AVAIL ?auto_72087 ) ( POINTING ?auto_72087 ?auto_72086 ) ( not ( = ?auto_72089 ?auto_72086 ) ) ( not ( = ?auto_72078 ?auto_72086 ) ) ( not ( = ?auto_72079 ?auto_72077 ) ) ( not ( = ?auto_72076 ?auto_72086 ) ) ( not ( = ?auto_72079 ?auto_72073 ) ) ( not ( = ?auto_72077 ?auto_72073 ) ) ( not ( = ?auto_72072 ?auto_72086 ) ) ( not ( = ?auto_72088 ?auto_72085 ) ) ( not ( = ?auto_72079 ?auto_72074 ) ) ( not ( = ?auto_72077 ?auto_72074 ) ) ( not ( = ?auto_72073 ?auto_72074 ) ) ( not ( = ?auto_72075 ?auto_72086 ) ) ( not ( = ?auto_72082 ?auto_72084 ) ) ( not ( = ?auto_72082 ?auto_72085 ) ) ( not ( = ?auto_72079 ?auto_72081 ) ) ( not ( = ?auto_72077 ?auto_72081 ) ) ( not ( = ?auto_72073 ?auto_72081 ) ) ( not ( = ?auto_72074 ?auto_72081 ) ) ( not ( = ?auto_72080 ?auto_72086 ) ) ( not ( = ?auto_72083 ?auto_72088 ) ) ( not ( = ?auto_72083 ?auto_72084 ) ) ( not ( = ?auto_72083 ?auto_72085 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_72078 ?auto_72079 ?auto_72076 ?auto_72077 ?auto_72072 ?auto_72073 ?auto_72080 ?auto_72081 ?auto_72075 ?auto_72074 )
      ( GET-5IMAGE-VERIFY ?auto_72072 ?auto_72073 ?auto_72075 ?auto_72074 ?auto_72076 ?auto_72077 ?auto_72078 ?auto_72079 ?auto_72080 ?auto_72081 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_72150 - DIRECTION
      ?auto_72151 - MODE
      ?auto_72153 - DIRECTION
      ?auto_72152 - MODE
      ?auto_72154 - DIRECTION
      ?auto_72155 - MODE
      ?auto_72156 - DIRECTION
      ?auto_72157 - MODE
      ?auto_72158 - DIRECTION
      ?auto_72159 - MODE
    )
    :vars
    (
      ?auto_72161 - INSTRUMENT
      ?auto_72165 - SATELLITE
      ?auto_72167 - DIRECTION
      ?auto_72160 - INSTRUMENT
      ?auto_72166 - INSTRUMENT
      ?auto_72162 - INSTRUMENT
      ?auto_72163 - INSTRUMENT
      ?auto_72164 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_72153 ?auto_72150 ) ) ( not ( = ?auto_72154 ?auto_72150 ) ) ( not ( = ?auto_72154 ?auto_72153 ) ) ( not ( = ?auto_72156 ?auto_72150 ) ) ( not ( = ?auto_72156 ?auto_72153 ) ) ( not ( = ?auto_72156 ?auto_72154 ) ) ( not ( = ?auto_72158 ?auto_72150 ) ) ( not ( = ?auto_72158 ?auto_72153 ) ) ( not ( = ?auto_72158 ?auto_72154 ) ) ( not ( = ?auto_72158 ?auto_72156 ) ) ( ON_BOARD ?auto_72161 ?auto_72165 ) ( SUPPORTS ?auto_72161 ?auto_72157 ) ( not ( = ?auto_72156 ?auto_72167 ) ) ( CALIBRATION_TARGET ?auto_72161 ?auto_72167 ) ( not ( = ?auto_72167 ?auto_72153 ) ) ( ON_BOARD ?auto_72160 ?auto_72165 ) ( not ( = ?auto_72161 ?auto_72160 ) ) ( SUPPORTS ?auto_72160 ?auto_72152 ) ( CALIBRATION_TARGET ?auto_72160 ?auto_72167 ) ( not ( = ?auto_72167 ?auto_72150 ) ) ( ON_BOARD ?auto_72166 ?auto_72165 ) ( not ( = ?auto_72160 ?auto_72166 ) ) ( SUPPORTS ?auto_72166 ?auto_72151 ) ( CALIBRATION_TARGET ?auto_72166 ?auto_72167 ) ( not ( = ?auto_72167 ?auto_72154 ) ) ( ON_BOARD ?auto_72162 ?auto_72165 ) ( not ( = ?auto_72166 ?auto_72162 ) ) ( SUPPORTS ?auto_72162 ?auto_72155 ) ( CALIBRATION_TARGET ?auto_72162 ?auto_72167 ) ( not ( = ?auto_72167 ?auto_72158 ) ) ( ON_BOARD ?auto_72163 ?auto_72165 ) ( not ( = ?auto_72162 ?auto_72163 ) ) ( SUPPORTS ?auto_72163 ?auto_72159 ) ( CALIBRATION_TARGET ?auto_72163 ?auto_72167 ) ( POWER_AVAIL ?auto_72165 ) ( POINTING ?auto_72165 ?auto_72164 ) ( not ( = ?auto_72167 ?auto_72164 ) ) ( not ( = ?auto_72158 ?auto_72164 ) ) ( not ( = ?auto_72159 ?auto_72155 ) ) ( not ( = ?auto_72154 ?auto_72164 ) ) ( not ( = ?auto_72159 ?auto_72151 ) ) ( not ( = ?auto_72155 ?auto_72151 ) ) ( not ( = ?auto_72150 ?auto_72164 ) ) ( not ( = ?auto_72166 ?auto_72163 ) ) ( not ( = ?auto_72159 ?auto_72152 ) ) ( not ( = ?auto_72155 ?auto_72152 ) ) ( not ( = ?auto_72151 ?auto_72152 ) ) ( not ( = ?auto_72153 ?auto_72164 ) ) ( not ( = ?auto_72160 ?auto_72162 ) ) ( not ( = ?auto_72160 ?auto_72163 ) ) ( not ( = ?auto_72159 ?auto_72157 ) ) ( not ( = ?auto_72155 ?auto_72157 ) ) ( not ( = ?auto_72151 ?auto_72157 ) ) ( not ( = ?auto_72152 ?auto_72157 ) ) ( not ( = ?auto_72156 ?auto_72164 ) ) ( not ( = ?auto_72161 ?auto_72166 ) ) ( not ( = ?auto_72161 ?auto_72162 ) ) ( not ( = ?auto_72161 ?auto_72163 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_72158 ?auto_72159 ?auto_72154 ?auto_72155 ?auto_72150 ?auto_72151 ?auto_72156 ?auto_72157 ?auto_72153 ?auto_72152 )
      ( GET-5IMAGE-VERIFY ?auto_72150 ?auto_72151 ?auto_72153 ?auto_72152 ?auto_72154 ?auto_72155 ?auto_72156 ?auto_72157 ?auto_72158 ?auto_72159 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_72648 - DIRECTION
      ?auto_72649 - MODE
      ?auto_72651 - DIRECTION
      ?auto_72650 - MODE
      ?auto_72652 - DIRECTION
      ?auto_72653 - MODE
      ?auto_72654 - DIRECTION
      ?auto_72655 - MODE
      ?auto_72656 - DIRECTION
      ?auto_72657 - MODE
    )
    :vars
    (
      ?auto_72659 - INSTRUMENT
      ?auto_72663 - SATELLITE
      ?auto_72665 - DIRECTION
      ?auto_72658 - INSTRUMENT
      ?auto_72664 - INSTRUMENT
      ?auto_72660 - INSTRUMENT
      ?auto_72661 - INSTRUMENT
      ?auto_72662 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_72651 ?auto_72648 ) ) ( not ( = ?auto_72652 ?auto_72648 ) ) ( not ( = ?auto_72652 ?auto_72651 ) ) ( not ( = ?auto_72654 ?auto_72648 ) ) ( not ( = ?auto_72654 ?auto_72651 ) ) ( not ( = ?auto_72654 ?auto_72652 ) ) ( not ( = ?auto_72656 ?auto_72648 ) ) ( not ( = ?auto_72656 ?auto_72651 ) ) ( not ( = ?auto_72656 ?auto_72652 ) ) ( not ( = ?auto_72656 ?auto_72654 ) ) ( ON_BOARD ?auto_72659 ?auto_72663 ) ( SUPPORTS ?auto_72659 ?auto_72653 ) ( not ( = ?auto_72652 ?auto_72665 ) ) ( CALIBRATION_TARGET ?auto_72659 ?auto_72665 ) ( not ( = ?auto_72665 ?auto_72651 ) ) ( ON_BOARD ?auto_72658 ?auto_72663 ) ( not ( = ?auto_72659 ?auto_72658 ) ) ( SUPPORTS ?auto_72658 ?auto_72650 ) ( CALIBRATION_TARGET ?auto_72658 ?auto_72665 ) ( not ( = ?auto_72665 ?auto_72648 ) ) ( ON_BOARD ?auto_72664 ?auto_72663 ) ( not ( = ?auto_72658 ?auto_72664 ) ) ( SUPPORTS ?auto_72664 ?auto_72649 ) ( CALIBRATION_TARGET ?auto_72664 ?auto_72665 ) ( not ( = ?auto_72665 ?auto_72656 ) ) ( ON_BOARD ?auto_72660 ?auto_72663 ) ( not ( = ?auto_72664 ?auto_72660 ) ) ( SUPPORTS ?auto_72660 ?auto_72657 ) ( CALIBRATION_TARGET ?auto_72660 ?auto_72665 ) ( not ( = ?auto_72665 ?auto_72654 ) ) ( ON_BOARD ?auto_72661 ?auto_72663 ) ( not ( = ?auto_72660 ?auto_72661 ) ) ( SUPPORTS ?auto_72661 ?auto_72655 ) ( CALIBRATION_TARGET ?auto_72661 ?auto_72665 ) ( POWER_AVAIL ?auto_72663 ) ( POINTING ?auto_72663 ?auto_72662 ) ( not ( = ?auto_72665 ?auto_72662 ) ) ( not ( = ?auto_72654 ?auto_72662 ) ) ( not ( = ?auto_72655 ?auto_72657 ) ) ( not ( = ?auto_72656 ?auto_72662 ) ) ( not ( = ?auto_72655 ?auto_72649 ) ) ( not ( = ?auto_72657 ?auto_72649 ) ) ( not ( = ?auto_72648 ?auto_72662 ) ) ( not ( = ?auto_72664 ?auto_72661 ) ) ( not ( = ?auto_72655 ?auto_72650 ) ) ( not ( = ?auto_72657 ?auto_72650 ) ) ( not ( = ?auto_72649 ?auto_72650 ) ) ( not ( = ?auto_72651 ?auto_72662 ) ) ( not ( = ?auto_72658 ?auto_72660 ) ) ( not ( = ?auto_72658 ?auto_72661 ) ) ( not ( = ?auto_72655 ?auto_72653 ) ) ( not ( = ?auto_72657 ?auto_72653 ) ) ( not ( = ?auto_72649 ?auto_72653 ) ) ( not ( = ?auto_72650 ?auto_72653 ) ) ( not ( = ?auto_72652 ?auto_72662 ) ) ( not ( = ?auto_72659 ?auto_72664 ) ) ( not ( = ?auto_72659 ?auto_72660 ) ) ( not ( = ?auto_72659 ?auto_72661 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_72654 ?auto_72655 ?auto_72656 ?auto_72657 ?auto_72648 ?auto_72649 ?auto_72652 ?auto_72653 ?auto_72651 ?auto_72650 )
      ( GET-5IMAGE-VERIFY ?auto_72648 ?auto_72649 ?auto_72651 ?auto_72650 ?auto_72652 ?auto_72653 ?auto_72654 ?auto_72655 ?auto_72656 ?auto_72657 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_72726 - DIRECTION
      ?auto_72727 - MODE
      ?auto_72729 - DIRECTION
      ?auto_72728 - MODE
      ?auto_72730 - DIRECTION
      ?auto_72731 - MODE
      ?auto_72732 - DIRECTION
      ?auto_72733 - MODE
      ?auto_72734 - DIRECTION
      ?auto_72735 - MODE
    )
    :vars
    (
      ?auto_72737 - INSTRUMENT
      ?auto_72741 - SATELLITE
      ?auto_72743 - DIRECTION
      ?auto_72736 - INSTRUMENT
      ?auto_72742 - INSTRUMENT
      ?auto_72738 - INSTRUMENT
      ?auto_72739 - INSTRUMENT
      ?auto_72740 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_72729 ?auto_72726 ) ) ( not ( = ?auto_72730 ?auto_72726 ) ) ( not ( = ?auto_72730 ?auto_72729 ) ) ( not ( = ?auto_72732 ?auto_72726 ) ) ( not ( = ?auto_72732 ?auto_72729 ) ) ( not ( = ?auto_72732 ?auto_72730 ) ) ( not ( = ?auto_72734 ?auto_72726 ) ) ( not ( = ?auto_72734 ?auto_72729 ) ) ( not ( = ?auto_72734 ?auto_72730 ) ) ( not ( = ?auto_72734 ?auto_72732 ) ) ( ON_BOARD ?auto_72737 ?auto_72741 ) ( SUPPORTS ?auto_72737 ?auto_72731 ) ( not ( = ?auto_72730 ?auto_72743 ) ) ( CALIBRATION_TARGET ?auto_72737 ?auto_72743 ) ( not ( = ?auto_72743 ?auto_72729 ) ) ( ON_BOARD ?auto_72736 ?auto_72741 ) ( not ( = ?auto_72737 ?auto_72736 ) ) ( SUPPORTS ?auto_72736 ?auto_72728 ) ( CALIBRATION_TARGET ?auto_72736 ?auto_72743 ) ( not ( = ?auto_72743 ?auto_72726 ) ) ( ON_BOARD ?auto_72742 ?auto_72741 ) ( not ( = ?auto_72736 ?auto_72742 ) ) ( SUPPORTS ?auto_72742 ?auto_72727 ) ( CALIBRATION_TARGET ?auto_72742 ?auto_72743 ) ( not ( = ?auto_72743 ?auto_72732 ) ) ( ON_BOARD ?auto_72738 ?auto_72741 ) ( not ( = ?auto_72742 ?auto_72738 ) ) ( SUPPORTS ?auto_72738 ?auto_72733 ) ( CALIBRATION_TARGET ?auto_72738 ?auto_72743 ) ( not ( = ?auto_72743 ?auto_72734 ) ) ( ON_BOARD ?auto_72739 ?auto_72741 ) ( not ( = ?auto_72738 ?auto_72739 ) ) ( SUPPORTS ?auto_72739 ?auto_72735 ) ( CALIBRATION_TARGET ?auto_72739 ?auto_72743 ) ( POWER_AVAIL ?auto_72741 ) ( POINTING ?auto_72741 ?auto_72740 ) ( not ( = ?auto_72743 ?auto_72740 ) ) ( not ( = ?auto_72734 ?auto_72740 ) ) ( not ( = ?auto_72735 ?auto_72733 ) ) ( not ( = ?auto_72732 ?auto_72740 ) ) ( not ( = ?auto_72735 ?auto_72727 ) ) ( not ( = ?auto_72733 ?auto_72727 ) ) ( not ( = ?auto_72726 ?auto_72740 ) ) ( not ( = ?auto_72742 ?auto_72739 ) ) ( not ( = ?auto_72735 ?auto_72728 ) ) ( not ( = ?auto_72733 ?auto_72728 ) ) ( not ( = ?auto_72727 ?auto_72728 ) ) ( not ( = ?auto_72729 ?auto_72740 ) ) ( not ( = ?auto_72736 ?auto_72738 ) ) ( not ( = ?auto_72736 ?auto_72739 ) ) ( not ( = ?auto_72735 ?auto_72731 ) ) ( not ( = ?auto_72733 ?auto_72731 ) ) ( not ( = ?auto_72727 ?auto_72731 ) ) ( not ( = ?auto_72728 ?auto_72731 ) ) ( not ( = ?auto_72730 ?auto_72740 ) ) ( not ( = ?auto_72737 ?auto_72742 ) ) ( not ( = ?auto_72737 ?auto_72738 ) ) ( not ( = ?auto_72737 ?auto_72739 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_72734 ?auto_72735 ?auto_72732 ?auto_72733 ?auto_72726 ?auto_72727 ?auto_72730 ?auto_72731 ?auto_72729 ?auto_72728 )
      ( GET-5IMAGE-VERIFY ?auto_72726 ?auto_72727 ?auto_72729 ?auto_72728 ?auto_72730 ?auto_72731 ?auto_72732 ?auto_72733 ?auto_72734 ?auto_72735 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_73308 - DIRECTION
      ?auto_73309 - MODE
      ?auto_73311 - DIRECTION
      ?auto_73310 - MODE
      ?auto_73312 - DIRECTION
      ?auto_73313 - MODE
      ?auto_73314 - DIRECTION
      ?auto_73315 - MODE
      ?auto_73316 - DIRECTION
      ?auto_73317 - MODE
    )
    :vars
    (
      ?auto_73319 - INSTRUMENT
      ?auto_73323 - SATELLITE
      ?auto_73325 - DIRECTION
      ?auto_73318 - INSTRUMENT
      ?auto_73324 - INSTRUMENT
      ?auto_73320 - INSTRUMENT
      ?auto_73321 - INSTRUMENT
      ?auto_73322 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_73311 ?auto_73308 ) ) ( not ( = ?auto_73312 ?auto_73308 ) ) ( not ( = ?auto_73312 ?auto_73311 ) ) ( not ( = ?auto_73314 ?auto_73308 ) ) ( not ( = ?auto_73314 ?auto_73311 ) ) ( not ( = ?auto_73314 ?auto_73312 ) ) ( not ( = ?auto_73316 ?auto_73308 ) ) ( not ( = ?auto_73316 ?auto_73311 ) ) ( not ( = ?auto_73316 ?auto_73312 ) ) ( not ( = ?auto_73316 ?auto_73314 ) ) ( ON_BOARD ?auto_73319 ?auto_73323 ) ( SUPPORTS ?auto_73319 ?auto_73310 ) ( not ( = ?auto_73311 ?auto_73325 ) ) ( CALIBRATION_TARGET ?auto_73319 ?auto_73325 ) ( not ( = ?auto_73325 ?auto_73316 ) ) ( ON_BOARD ?auto_73318 ?auto_73323 ) ( not ( = ?auto_73319 ?auto_73318 ) ) ( SUPPORTS ?auto_73318 ?auto_73317 ) ( CALIBRATION_TARGET ?auto_73318 ?auto_73325 ) ( not ( = ?auto_73325 ?auto_73308 ) ) ( ON_BOARD ?auto_73324 ?auto_73323 ) ( not ( = ?auto_73318 ?auto_73324 ) ) ( SUPPORTS ?auto_73324 ?auto_73309 ) ( CALIBRATION_TARGET ?auto_73324 ?auto_73325 ) ( not ( = ?auto_73325 ?auto_73314 ) ) ( ON_BOARD ?auto_73320 ?auto_73323 ) ( not ( = ?auto_73324 ?auto_73320 ) ) ( SUPPORTS ?auto_73320 ?auto_73315 ) ( CALIBRATION_TARGET ?auto_73320 ?auto_73325 ) ( not ( = ?auto_73325 ?auto_73312 ) ) ( ON_BOARD ?auto_73321 ?auto_73323 ) ( not ( = ?auto_73320 ?auto_73321 ) ) ( SUPPORTS ?auto_73321 ?auto_73313 ) ( CALIBRATION_TARGET ?auto_73321 ?auto_73325 ) ( POWER_AVAIL ?auto_73323 ) ( POINTING ?auto_73323 ?auto_73322 ) ( not ( = ?auto_73325 ?auto_73322 ) ) ( not ( = ?auto_73312 ?auto_73322 ) ) ( not ( = ?auto_73313 ?auto_73315 ) ) ( not ( = ?auto_73314 ?auto_73322 ) ) ( not ( = ?auto_73313 ?auto_73309 ) ) ( not ( = ?auto_73315 ?auto_73309 ) ) ( not ( = ?auto_73308 ?auto_73322 ) ) ( not ( = ?auto_73324 ?auto_73321 ) ) ( not ( = ?auto_73313 ?auto_73317 ) ) ( not ( = ?auto_73315 ?auto_73317 ) ) ( not ( = ?auto_73309 ?auto_73317 ) ) ( not ( = ?auto_73316 ?auto_73322 ) ) ( not ( = ?auto_73318 ?auto_73320 ) ) ( not ( = ?auto_73318 ?auto_73321 ) ) ( not ( = ?auto_73313 ?auto_73310 ) ) ( not ( = ?auto_73315 ?auto_73310 ) ) ( not ( = ?auto_73309 ?auto_73310 ) ) ( not ( = ?auto_73317 ?auto_73310 ) ) ( not ( = ?auto_73311 ?auto_73322 ) ) ( not ( = ?auto_73319 ?auto_73324 ) ) ( not ( = ?auto_73319 ?auto_73320 ) ) ( not ( = ?auto_73319 ?auto_73321 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_73312 ?auto_73313 ?auto_73314 ?auto_73315 ?auto_73308 ?auto_73309 ?auto_73311 ?auto_73310 ?auto_73316 ?auto_73317 )
      ( GET-5IMAGE-VERIFY ?auto_73308 ?auto_73309 ?auto_73311 ?auto_73310 ?auto_73312 ?auto_73313 ?auto_73314 ?auto_73315 ?auto_73316 ?auto_73317 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_73472 - DIRECTION
      ?auto_73473 - MODE
      ?auto_73475 - DIRECTION
      ?auto_73474 - MODE
      ?auto_73476 - DIRECTION
      ?auto_73477 - MODE
      ?auto_73478 - DIRECTION
      ?auto_73479 - MODE
      ?auto_73480 - DIRECTION
      ?auto_73481 - MODE
    )
    :vars
    (
      ?auto_73483 - INSTRUMENT
      ?auto_73487 - SATELLITE
      ?auto_73489 - DIRECTION
      ?auto_73482 - INSTRUMENT
      ?auto_73488 - INSTRUMENT
      ?auto_73484 - INSTRUMENT
      ?auto_73485 - INSTRUMENT
      ?auto_73486 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_73475 ?auto_73472 ) ) ( not ( = ?auto_73476 ?auto_73472 ) ) ( not ( = ?auto_73476 ?auto_73475 ) ) ( not ( = ?auto_73478 ?auto_73472 ) ) ( not ( = ?auto_73478 ?auto_73475 ) ) ( not ( = ?auto_73478 ?auto_73476 ) ) ( not ( = ?auto_73480 ?auto_73472 ) ) ( not ( = ?auto_73480 ?auto_73475 ) ) ( not ( = ?auto_73480 ?auto_73476 ) ) ( not ( = ?auto_73480 ?auto_73478 ) ) ( ON_BOARD ?auto_73483 ?auto_73487 ) ( SUPPORTS ?auto_73483 ?auto_73474 ) ( not ( = ?auto_73475 ?auto_73489 ) ) ( CALIBRATION_TARGET ?auto_73483 ?auto_73489 ) ( not ( = ?auto_73489 ?auto_73478 ) ) ( ON_BOARD ?auto_73482 ?auto_73487 ) ( not ( = ?auto_73483 ?auto_73482 ) ) ( SUPPORTS ?auto_73482 ?auto_73479 ) ( CALIBRATION_TARGET ?auto_73482 ?auto_73489 ) ( not ( = ?auto_73489 ?auto_73472 ) ) ( ON_BOARD ?auto_73488 ?auto_73487 ) ( not ( = ?auto_73482 ?auto_73488 ) ) ( SUPPORTS ?auto_73488 ?auto_73473 ) ( CALIBRATION_TARGET ?auto_73488 ?auto_73489 ) ( not ( = ?auto_73489 ?auto_73480 ) ) ( ON_BOARD ?auto_73484 ?auto_73487 ) ( not ( = ?auto_73488 ?auto_73484 ) ) ( SUPPORTS ?auto_73484 ?auto_73481 ) ( CALIBRATION_TARGET ?auto_73484 ?auto_73489 ) ( not ( = ?auto_73489 ?auto_73476 ) ) ( ON_BOARD ?auto_73485 ?auto_73487 ) ( not ( = ?auto_73484 ?auto_73485 ) ) ( SUPPORTS ?auto_73485 ?auto_73477 ) ( CALIBRATION_TARGET ?auto_73485 ?auto_73489 ) ( POWER_AVAIL ?auto_73487 ) ( POINTING ?auto_73487 ?auto_73486 ) ( not ( = ?auto_73489 ?auto_73486 ) ) ( not ( = ?auto_73476 ?auto_73486 ) ) ( not ( = ?auto_73477 ?auto_73481 ) ) ( not ( = ?auto_73480 ?auto_73486 ) ) ( not ( = ?auto_73477 ?auto_73473 ) ) ( not ( = ?auto_73481 ?auto_73473 ) ) ( not ( = ?auto_73472 ?auto_73486 ) ) ( not ( = ?auto_73488 ?auto_73485 ) ) ( not ( = ?auto_73477 ?auto_73479 ) ) ( not ( = ?auto_73481 ?auto_73479 ) ) ( not ( = ?auto_73473 ?auto_73479 ) ) ( not ( = ?auto_73478 ?auto_73486 ) ) ( not ( = ?auto_73482 ?auto_73484 ) ) ( not ( = ?auto_73482 ?auto_73485 ) ) ( not ( = ?auto_73477 ?auto_73474 ) ) ( not ( = ?auto_73481 ?auto_73474 ) ) ( not ( = ?auto_73473 ?auto_73474 ) ) ( not ( = ?auto_73479 ?auto_73474 ) ) ( not ( = ?auto_73475 ?auto_73486 ) ) ( not ( = ?auto_73483 ?auto_73488 ) ) ( not ( = ?auto_73483 ?auto_73484 ) ) ( not ( = ?auto_73483 ?auto_73485 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_73476 ?auto_73477 ?auto_73480 ?auto_73481 ?auto_73472 ?auto_73473 ?auto_73475 ?auto_73474 ?auto_73478 ?auto_73479 )
      ( GET-5IMAGE-VERIFY ?auto_73472 ?auto_73473 ?auto_73475 ?auto_73474 ?auto_73476 ?auto_73477 ?auto_73478 ?auto_73479 ?auto_73480 ?auto_73481 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_73716 - DIRECTION
      ?auto_73717 - MODE
      ?auto_73719 - DIRECTION
      ?auto_73718 - MODE
      ?auto_73720 - DIRECTION
      ?auto_73721 - MODE
      ?auto_73722 - DIRECTION
      ?auto_73723 - MODE
      ?auto_73724 - DIRECTION
      ?auto_73725 - MODE
    )
    :vars
    (
      ?auto_73727 - INSTRUMENT
      ?auto_73731 - SATELLITE
      ?auto_73733 - DIRECTION
      ?auto_73726 - INSTRUMENT
      ?auto_73732 - INSTRUMENT
      ?auto_73728 - INSTRUMENT
      ?auto_73729 - INSTRUMENT
      ?auto_73730 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_73719 ?auto_73716 ) ) ( not ( = ?auto_73720 ?auto_73716 ) ) ( not ( = ?auto_73720 ?auto_73719 ) ) ( not ( = ?auto_73722 ?auto_73716 ) ) ( not ( = ?auto_73722 ?auto_73719 ) ) ( not ( = ?auto_73722 ?auto_73720 ) ) ( not ( = ?auto_73724 ?auto_73716 ) ) ( not ( = ?auto_73724 ?auto_73719 ) ) ( not ( = ?auto_73724 ?auto_73720 ) ) ( not ( = ?auto_73724 ?auto_73722 ) ) ( ON_BOARD ?auto_73727 ?auto_73731 ) ( SUPPORTS ?auto_73727 ?auto_73718 ) ( not ( = ?auto_73719 ?auto_73733 ) ) ( CALIBRATION_TARGET ?auto_73727 ?auto_73733 ) ( not ( = ?auto_73733 ?auto_73724 ) ) ( ON_BOARD ?auto_73726 ?auto_73731 ) ( not ( = ?auto_73727 ?auto_73726 ) ) ( SUPPORTS ?auto_73726 ?auto_73725 ) ( CALIBRATION_TARGET ?auto_73726 ?auto_73733 ) ( not ( = ?auto_73733 ?auto_73716 ) ) ( ON_BOARD ?auto_73732 ?auto_73731 ) ( not ( = ?auto_73726 ?auto_73732 ) ) ( SUPPORTS ?auto_73732 ?auto_73717 ) ( CALIBRATION_TARGET ?auto_73732 ?auto_73733 ) ( not ( = ?auto_73733 ?auto_73720 ) ) ( ON_BOARD ?auto_73728 ?auto_73731 ) ( not ( = ?auto_73732 ?auto_73728 ) ) ( SUPPORTS ?auto_73728 ?auto_73721 ) ( CALIBRATION_TARGET ?auto_73728 ?auto_73733 ) ( not ( = ?auto_73733 ?auto_73722 ) ) ( ON_BOARD ?auto_73729 ?auto_73731 ) ( not ( = ?auto_73728 ?auto_73729 ) ) ( SUPPORTS ?auto_73729 ?auto_73723 ) ( CALIBRATION_TARGET ?auto_73729 ?auto_73733 ) ( POWER_AVAIL ?auto_73731 ) ( POINTING ?auto_73731 ?auto_73730 ) ( not ( = ?auto_73733 ?auto_73730 ) ) ( not ( = ?auto_73722 ?auto_73730 ) ) ( not ( = ?auto_73723 ?auto_73721 ) ) ( not ( = ?auto_73720 ?auto_73730 ) ) ( not ( = ?auto_73723 ?auto_73717 ) ) ( not ( = ?auto_73721 ?auto_73717 ) ) ( not ( = ?auto_73716 ?auto_73730 ) ) ( not ( = ?auto_73732 ?auto_73729 ) ) ( not ( = ?auto_73723 ?auto_73725 ) ) ( not ( = ?auto_73721 ?auto_73725 ) ) ( not ( = ?auto_73717 ?auto_73725 ) ) ( not ( = ?auto_73724 ?auto_73730 ) ) ( not ( = ?auto_73726 ?auto_73728 ) ) ( not ( = ?auto_73726 ?auto_73729 ) ) ( not ( = ?auto_73723 ?auto_73718 ) ) ( not ( = ?auto_73721 ?auto_73718 ) ) ( not ( = ?auto_73717 ?auto_73718 ) ) ( not ( = ?auto_73725 ?auto_73718 ) ) ( not ( = ?auto_73719 ?auto_73730 ) ) ( not ( = ?auto_73727 ?auto_73732 ) ) ( not ( = ?auto_73727 ?auto_73728 ) ) ( not ( = ?auto_73727 ?auto_73729 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_73722 ?auto_73723 ?auto_73720 ?auto_73721 ?auto_73716 ?auto_73717 ?auto_73719 ?auto_73718 ?auto_73724 ?auto_73725 )
      ( GET-5IMAGE-VERIFY ?auto_73716 ?auto_73717 ?auto_73719 ?auto_73718 ?auto_73720 ?auto_73721 ?auto_73722 ?auto_73723 ?auto_73724 ?auto_73725 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_73966 - DIRECTION
      ?auto_73967 - MODE
      ?auto_73969 - DIRECTION
      ?auto_73968 - MODE
      ?auto_73970 - DIRECTION
      ?auto_73971 - MODE
      ?auto_73972 - DIRECTION
      ?auto_73973 - MODE
      ?auto_73974 - DIRECTION
      ?auto_73975 - MODE
    )
    :vars
    (
      ?auto_73977 - INSTRUMENT
      ?auto_73981 - SATELLITE
      ?auto_73983 - DIRECTION
      ?auto_73976 - INSTRUMENT
      ?auto_73982 - INSTRUMENT
      ?auto_73978 - INSTRUMENT
      ?auto_73979 - INSTRUMENT
      ?auto_73980 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_73969 ?auto_73966 ) ) ( not ( = ?auto_73970 ?auto_73966 ) ) ( not ( = ?auto_73970 ?auto_73969 ) ) ( not ( = ?auto_73972 ?auto_73966 ) ) ( not ( = ?auto_73972 ?auto_73969 ) ) ( not ( = ?auto_73972 ?auto_73970 ) ) ( not ( = ?auto_73974 ?auto_73966 ) ) ( not ( = ?auto_73974 ?auto_73969 ) ) ( not ( = ?auto_73974 ?auto_73970 ) ) ( not ( = ?auto_73974 ?auto_73972 ) ) ( ON_BOARD ?auto_73977 ?auto_73981 ) ( SUPPORTS ?auto_73977 ?auto_73968 ) ( not ( = ?auto_73969 ?auto_73983 ) ) ( CALIBRATION_TARGET ?auto_73977 ?auto_73983 ) ( not ( = ?auto_73983 ?auto_73972 ) ) ( ON_BOARD ?auto_73976 ?auto_73981 ) ( not ( = ?auto_73977 ?auto_73976 ) ) ( SUPPORTS ?auto_73976 ?auto_73973 ) ( CALIBRATION_TARGET ?auto_73976 ?auto_73983 ) ( not ( = ?auto_73983 ?auto_73966 ) ) ( ON_BOARD ?auto_73982 ?auto_73981 ) ( not ( = ?auto_73976 ?auto_73982 ) ) ( SUPPORTS ?auto_73982 ?auto_73967 ) ( CALIBRATION_TARGET ?auto_73982 ?auto_73983 ) ( not ( = ?auto_73983 ?auto_73970 ) ) ( ON_BOARD ?auto_73978 ?auto_73981 ) ( not ( = ?auto_73982 ?auto_73978 ) ) ( SUPPORTS ?auto_73978 ?auto_73971 ) ( CALIBRATION_TARGET ?auto_73978 ?auto_73983 ) ( not ( = ?auto_73983 ?auto_73974 ) ) ( ON_BOARD ?auto_73979 ?auto_73981 ) ( not ( = ?auto_73978 ?auto_73979 ) ) ( SUPPORTS ?auto_73979 ?auto_73975 ) ( CALIBRATION_TARGET ?auto_73979 ?auto_73983 ) ( POWER_AVAIL ?auto_73981 ) ( POINTING ?auto_73981 ?auto_73980 ) ( not ( = ?auto_73983 ?auto_73980 ) ) ( not ( = ?auto_73974 ?auto_73980 ) ) ( not ( = ?auto_73975 ?auto_73971 ) ) ( not ( = ?auto_73970 ?auto_73980 ) ) ( not ( = ?auto_73975 ?auto_73967 ) ) ( not ( = ?auto_73971 ?auto_73967 ) ) ( not ( = ?auto_73966 ?auto_73980 ) ) ( not ( = ?auto_73982 ?auto_73979 ) ) ( not ( = ?auto_73975 ?auto_73973 ) ) ( not ( = ?auto_73971 ?auto_73973 ) ) ( not ( = ?auto_73967 ?auto_73973 ) ) ( not ( = ?auto_73972 ?auto_73980 ) ) ( not ( = ?auto_73976 ?auto_73978 ) ) ( not ( = ?auto_73976 ?auto_73979 ) ) ( not ( = ?auto_73975 ?auto_73968 ) ) ( not ( = ?auto_73971 ?auto_73968 ) ) ( not ( = ?auto_73967 ?auto_73968 ) ) ( not ( = ?auto_73973 ?auto_73968 ) ) ( not ( = ?auto_73969 ?auto_73980 ) ) ( not ( = ?auto_73977 ?auto_73982 ) ) ( not ( = ?auto_73977 ?auto_73978 ) ) ( not ( = ?auto_73977 ?auto_73979 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_73974 ?auto_73975 ?auto_73970 ?auto_73971 ?auto_73966 ?auto_73967 ?auto_73969 ?auto_73968 ?auto_73972 ?auto_73973 )
      ( GET-5IMAGE-VERIFY ?auto_73966 ?auto_73967 ?auto_73969 ?auto_73968 ?auto_73970 ?auto_73971 ?auto_73972 ?auto_73973 ?auto_73974 ?auto_73975 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_74736 - DIRECTION
      ?auto_74737 - MODE
      ?auto_74739 - DIRECTION
      ?auto_74738 - MODE
      ?auto_74740 - DIRECTION
      ?auto_74741 - MODE
      ?auto_74742 - DIRECTION
      ?auto_74743 - MODE
      ?auto_74744 - DIRECTION
      ?auto_74745 - MODE
    )
    :vars
    (
      ?auto_74747 - INSTRUMENT
      ?auto_74751 - SATELLITE
      ?auto_74753 - DIRECTION
      ?auto_74746 - INSTRUMENT
      ?auto_74752 - INSTRUMENT
      ?auto_74748 - INSTRUMENT
      ?auto_74749 - INSTRUMENT
      ?auto_74750 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_74739 ?auto_74736 ) ) ( not ( = ?auto_74740 ?auto_74736 ) ) ( not ( = ?auto_74740 ?auto_74739 ) ) ( not ( = ?auto_74742 ?auto_74736 ) ) ( not ( = ?auto_74742 ?auto_74739 ) ) ( not ( = ?auto_74742 ?auto_74740 ) ) ( not ( = ?auto_74744 ?auto_74736 ) ) ( not ( = ?auto_74744 ?auto_74739 ) ) ( not ( = ?auto_74744 ?auto_74740 ) ) ( not ( = ?auto_74744 ?auto_74742 ) ) ( ON_BOARD ?auto_74747 ?auto_74751 ) ( SUPPORTS ?auto_74747 ?auto_74738 ) ( not ( = ?auto_74739 ?auto_74753 ) ) ( CALIBRATION_TARGET ?auto_74747 ?auto_74753 ) ( not ( = ?auto_74753 ?auto_74740 ) ) ( ON_BOARD ?auto_74746 ?auto_74751 ) ( not ( = ?auto_74747 ?auto_74746 ) ) ( SUPPORTS ?auto_74746 ?auto_74741 ) ( CALIBRATION_TARGET ?auto_74746 ?auto_74753 ) ( not ( = ?auto_74753 ?auto_74736 ) ) ( ON_BOARD ?auto_74752 ?auto_74751 ) ( not ( = ?auto_74746 ?auto_74752 ) ) ( SUPPORTS ?auto_74752 ?auto_74737 ) ( CALIBRATION_TARGET ?auto_74752 ?auto_74753 ) ( not ( = ?auto_74753 ?auto_74744 ) ) ( ON_BOARD ?auto_74748 ?auto_74751 ) ( not ( = ?auto_74752 ?auto_74748 ) ) ( SUPPORTS ?auto_74748 ?auto_74745 ) ( CALIBRATION_TARGET ?auto_74748 ?auto_74753 ) ( not ( = ?auto_74753 ?auto_74742 ) ) ( ON_BOARD ?auto_74749 ?auto_74751 ) ( not ( = ?auto_74748 ?auto_74749 ) ) ( SUPPORTS ?auto_74749 ?auto_74743 ) ( CALIBRATION_TARGET ?auto_74749 ?auto_74753 ) ( POWER_AVAIL ?auto_74751 ) ( POINTING ?auto_74751 ?auto_74750 ) ( not ( = ?auto_74753 ?auto_74750 ) ) ( not ( = ?auto_74742 ?auto_74750 ) ) ( not ( = ?auto_74743 ?auto_74745 ) ) ( not ( = ?auto_74744 ?auto_74750 ) ) ( not ( = ?auto_74743 ?auto_74737 ) ) ( not ( = ?auto_74745 ?auto_74737 ) ) ( not ( = ?auto_74736 ?auto_74750 ) ) ( not ( = ?auto_74752 ?auto_74749 ) ) ( not ( = ?auto_74743 ?auto_74741 ) ) ( not ( = ?auto_74745 ?auto_74741 ) ) ( not ( = ?auto_74737 ?auto_74741 ) ) ( not ( = ?auto_74740 ?auto_74750 ) ) ( not ( = ?auto_74746 ?auto_74748 ) ) ( not ( = ?auto_74746 ?auto_74749 ) ) ( not ( = ?auto_74743 ?auto_74738 ) ) ( not ( = ?auto_74745 ?auto_74738 ) ) ( not ( = ?auto_74737 ?auto_74738 ) ) ( not ( = ?auto_74741 ?auto_74738 ) ) ( not ( = ?auto_74739 ?auto_74750 ) ) ( not ( = ?auto_74747 ?auto_74752 ) ) ( not ( = ?auto_74747 ?auto_74748 ) ) ( not ( = ?auto_74747 ?auto_74749 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_74742 ?auto_74743 ?auto_74744 ?auto_74745 ?auto_74736 ?auto_74737 ?auto_74739 ?auto_74738 ?auto_74740 ?auto_74741 )
      ( GET-5IMAGE-VERIFY ?auto_74736 ?auto_74737 ?auto_74739 ?auto_74738 ?auto_74740 ?auto_74741 ?auto_74742 ?auto_74743 ?auto_74744 ?auto_74745 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_74814 - DIRECTION
      ?auto_74815 - MODE
      ?auto_74817 - DIRECTION
      ?auto_74816 - MODE
      ?auto_74818 - DIRECTION
      ?auto_74819 - MODE
      ?auto_74820 - DIRECTION
      ?auto_74821 - MODE
      ?auto_74822 - DIRECTION
      ?auto_74823 - MODE
    )
    :vars
    (
      ?auto_74825 - INSTRUMENT
      ?auto_74829 - SATELLITE
      ?auto_74831 - DIRECTION
      ?auto_74824 - INSTRUMENT
      ?auto_74830 - INSTRUMENT
      ?auto_74826 - INSTRUMENT
      ?auto_74827 - INSTRUMENT
      ?auto_74828 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_74817 ?auto_74814 ) ) ( not ( = ?auto_74818 ?auto_74814 ) ) ( not ( = ?auto_74818 ?auto_74817 ) ) ( not ( = ?auto_74820 ?auto_74814 ) ) ( not ( = ?auto_74820 ?auto_74817 ) ) ( not ( = ?auto_74820 ?auto_74818 ) ) ( not ( = ?auto_74822 ?auto_74814 ) ) ( not ( = ?auto_74822 ?auto_74817 ) ) ( not ( = ?auto_74822 ?auto_74818 ) ) ( not ( = ?auto_74822 ?auto_74820 ) ) ( ON_BOARD ?auto_74825 ?auto_74829 ) ( SUPPORTS ?auto_74825 ?auto_74816 ) ( not ( = ?auto_74817 ?auto_74831 ) ) ( CALIBRATION_TARGET ?auto_74825 ?auto_74831 ) ( not ( = ?auto_74831 ?auto_74818 ) ) ( ON_BOARD ?auto_74824 ?auto_74829 ) ( not ( = ?auto_74825 ?auto_74824 ) ) ( SUPPORTS ?auto_74824 ?auto_74819 ) ( CALIBRATION_TARGET ?auto_74824 ?auto_74831 ) ( not ( = ?auto_74831 ?auto_74814 ) ) ( ON_BOARD ?auto_74830 ?auto_74829 ) ( not ( = ?auto_74824 ?auto_74830 ) ) ( SUPPORTS ?auto_74830 ?auto_74815 ) ( CALIBRATION_TARGET ?auto_74830 ?auto_74831 ) ( not ( = ?auto_74831 ?auto_74820 ) ) ( ON_BOARD ?auto_74826 ?auto_74829 ) ( not ( = ?auto_74830 ?auto_74826 ) ) ( SUPPORTS ?auto_74826 ?auto_74821 ) ( CALIBRATION_TARGET ?auto_74826 ?auto_74831 ) ( not ( = ?auto_74831 ?auto_74822 ) ) ( ON_BOARD ?auto_74827 ?auto_74829 ) ( not ( = ?auto_74826 ?auto_74827 ) ) ( SUPPORTS ?auto_74827 ?auto_74823 ) ( CALIBRATION_TARGET ?auto_74827 ?auto_74831 ) ( POWER_AVAIL ?auto_74829 ) ( POINTING ?auto_74829 ?auto_74828 ) ( not ( = ?auto_74831 ?auto_74828 ) ) ( not ( = ?auto_74822 ?auto_74828 ) ) ( not ( = ?auto_74823 ?auto_74821 ) ) ( not ( = ?auto_74820 ?auto_74828 ) ) ( not ( = ?auto_74823 ?auto_74815 ) ) ( not ( = ?auto_74821 ?auto_74815 ) ) ( not ( = ?auto_74814 ?auto_74828 ) ) ( not ( = ?auto_74830 ?auto_74827 ) ) ( not ( = ?auto_74823 ?auto_74819 ) ) ( not ( = ?auto_74821 ?auto_74819 ) ) ( not ( = ?auto_74815 ?auto_74819 ) ) ( not ( = ?auto_74818 ?auto_74828 ) ) ( not ( = ?auto_74824 ?auto_74826 ) ) ( not ( = ?auto_74824 ?auto_74827 ) ) ( not ( = ?auto_74823 ?auto_74816 ) ) ( not ( = ?auto_74821 ?auto_74816 ) ) ( not ( = ?auto_74815 ?auto_74816 ) ) ( not ( = ?auto_74819 ?auto_74816 ) ) ( not ( = ?auto_74817 ?auto_74828 ) ) ( not ( = ?auto_74825 ?auto_74830 ) ) ( not ( = ?auto_74825 ?auto_74826 ) ) ( not ( = ?auto_74825 ?auto_74827 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_74822 ?auto_74823 ?auto_74820 ?auto_74821 ?auto_74814 ?auto_74815 ?auto_74817 ?auto_74816 ?auto_74818 ?auto_74819 )
      ( GET-5IMAGE-VERIFY ?auto_74814 ?auto_74815 ?auto_74817 ?auto_74816 ?auto_74818 ?auto_74819 ?auto_74820 ?auto_74821 ?auto_74822 ?auto_74823 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_76006 - DIRECTION
      ?auto_76007 - MODE
      ?auto_76009 - DIRECTION
      ?auto_76008 - MODE
      ?auto_76010 - DIRECTION
      ?auto_76011 - MODE
      ?auto_76012 - DIRECTION
      ?auto_76013 - MODE
      ?auto_76014 - DIRECTION
      ?auto_76015 - MODE
    )
    :vars
    (
      ?auto_76017 - INSTRUMENT
      ?auto_76021 - SATELLITE
      ?auto_76023 - DIRECTION
      ?auto_76016 - INSTRUMENT
      ?auto_76022 - INSTRUMENT
      ?auto_76018 - INSTRUMENT
      ?auto_76019 - INSTRUMENT
      ?auto_76020 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_76009 ?auto_76006 ) ) ( not ( = ?auto_76010 ?auto_76006 ) ) ( not ( = ?auto_76010 ?auto_76009 ) ) ( not ( = ?auto_76012 ?auto_76006 ) ) ( not ( = ?auto_76012 ?auto_76009 ) ) ( not ( = ?auto_76012 ?auto_76010 ) ) ( not ( = ?auto_76014 ?auto_76006 ) ) ( not ( = ?auto_76014 ?auto_76009 ) ) ( not ( = ?auto_76014 ?auto_76010 ) ) ( not ( = ?auto_76014 ?auto_76012 ) ) ( ON_BOARD ?auto_76017 ?auto_76021 ) ( SUPPORTS ?auto_76017 ?auto_76015 ) ( not ( = ?auto_76014 ?auto_76023 ) ) ( CALIBRATION_TARGET ?auto_76017 ?auto_76023 ) ( not ( = ?auto_76023 ?auto_76006 ) ) ( ON_BOARD ?auto_76016 ?auto_76021 ) ( not ( = ?auto_76017 ?auto_76016 ) ) ( SUPPORTS ?auto_76016 ?auto_76007 ) ( CALIBRATION_TARGET ?auto_76016 ?auto_76023 ) ( not ( = ?auto_76023 ?auto_76012 ) ) ( ON_BOARD ?auto_76022 ?auto_76021 ) ( not ( = ?auto_76016 ?auto_76022 ) ) ( SUPPORTS ?auto_76022 ?auto_76013 ) ( CALIBRATION_TARGET ?auto_76022 ?auto_76023 ) ( not ( = ?auto_76023 ?auto_76010 ) ) ( ON_BOARD ?auto_76018 ?auto_76021 ) ( not ( = ?auto_76022 ?auto_76018 ) ) ( SUPPORTS ?auto_76018 ?auto_76011 ) ( CALIBRATION_TARGET ?auto_76018 ?auto_76023 ) ( not ( = ?auto_76023 ?auto_76009 ) ) ( ON_BOARD ?auto_76019 ?auto_76021 ) ( not ( = ?auto_76018 ?auto_76019 ) ) ( SUPPORTS ?auto_76019 ?auto_76008 ) ( CALIBRATION_TARGET ?auto_76019 ?auto_76023 ) ( POWER_AVAIL ?auto_76021 ) ( POINTING ?auto_76021 ?auto_76020 ) ( not ( = ?auto_76023 ?auto_76020 ) ) ( not ( = ?auto_76009 ?auto_76020 ) ) ( not ( = ?auto_76008 ?auto_76011 ) ) ( not ( = ?auto_76010 ?auto_76020 ) ) ( not ( = ?auto_76008 ?auto_76013 ) ) ( not ( = ?auto_76011 ?auto_76013 ) ) ( not ( = ?auto_76012 ?auto_76020 ) ) ( not ( = ?auto_76022 ?auto_76019 ) ) ( not ( = ?auto_76008 ?auto_76007 ) ) ( not ( = ?auto_76011 ?auto_76007 ) ) ( not ( = ?auto_76013 ?auto_76007 ) ) ( not ( = ?auto_76006 ?auto_76020 ) ) ( not ( = ?auto_76016 ?auto_76018 ) ) ( not ( = ?auto_76016 ?auto_76019 ) ) ( not ( = ?auto_76008 ?auto_76015 ) ) ( not ( = ?auto_76011 ?auto_76015 ) ) ( not ( = ?auto_76013 ?auto_76015 ) ) ( not ( = ?auto_76007 ?auto_76015 ) ) ( not ( = ?auto_76014 ?auto_76020 ) ) ( not ( = ?auto_76017 ?auto_76022 ) ) ( not ( = ?auto_76017 ?auto_76018 ) ) ( not ( = ?auto_76017 ?auto_76019 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_76009 ?auto_76008 ?auto_76010 ?auto_76011 ?auto_76012 ?auto_76013 ?auto_76014 ?auto_76015 ?auto_76006 ?auto_76007 )
      ( GET-5IMAGE-VERIFY ?auto_76006 ?auto_76007 ?auto_76009 ?auto_76008 ?auto_76010 ?auto_76011 ?auto_76012 ?auto_76013 ?auto_76014 ?auto_76015 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_76084 - DIRECTION
      ?auto_76085 - MODE
      ?auto_76087 - DIRECTION
      ?auto_76086 - MODE
      ?auto_76088 - DIRECTION
      ?auto_76089 - MODE
      ?auto_76090 - DIRECTION
      ?auto_76091 - MODE
      ?auto_76092 - DIRECTION
      ?auto_76093 - MODE
    )
    :vars
    (
      ?auto_76095 - INSTRUMENT
      ?auto_76099 - SATELLITE
      ?auto_76101 - DIRECTION
      ?auto_76094 - INSTRUMENT
      ?auto_76100 - INSTRUMENT
      ?auto_76096 - INSTRUMENT
      ?auto_76097 - INSTRUMENT
      ?auto_76098 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_76087 ?auto_76084 ) ) ( not ( = ?auto_76088 ?auto_76084 ) ) ( not ( = ?auto_76088 ?auto_76087 ) ) ( not ( = ?auto_76090 ?auto_76084 ) ) ( not ( = ?auto_76090 ?auto_76087 ) ) ( not ( = ?auto_76090 ?auto_76088 ) ) ( not ( = ?auto_76092 ?auto_76084 ) ) ( not ( = ?auto_76092 ?auto_76087 ) ) ( not ( = ?auto_76092 ?auto_76088 ) ) ( not ( = ?auto_76092 ?auto_76090 ) ) ( ON_BOARD ?auto_76095 ?auto_76099 ) ( SUPPORTS ?auto_76095 ?auto_76091 ) ( not ( = ?auto_76090 ?auto_76101 ) ) ( CALIBRATION_TARGET ?auto_76095 ?auto_76101 ) ( not ( = ?auto_76101 ?auto_76084 ) ) ( ON_BOARD ?auto_76094 ?auto_76099 ) ( not ( = ?auto_76095 ?auto_76094 ) ) ( SUPPORTS ?auto_76094 ?auto_76085 ) ( CALIBRATION_TARGET ?auto_76094 ?auto_76101 ) ( not ( = ?auto_76101 ?auto_76092 ) ) ( ON_BOARD ?auto_76100 ?auto_76099 ) ( not ( = ?auto_76094 ?auto_76100 ) ) ( SUPPORTS ?auto_76100 ?auto_76093 ) ( CALIBRATION_TARGET ?auto_76100 ?auto_76101 ) ( not ( = ?auto_76101 ?auto_76088 ) ) ( ON_BOARD ?auto_76096 ?auto_76099 ) ( not ( = ?auto_76100 ?auto_76096 ) ) ( SUPPORTS ?auto_76096 ?auto_76089 ) ( CALIBRATION_TARGET ?auto_76096 ?auto_76101 ) ( not ( = ?auto_76101 ?auto_76087 ) ) ( ON_BOARD ?auto_76097 ?auto_76099 ) ( not ( = ?auto_76096 ?auto_76097 ) ) ( SUPPORTS ?auto_76097 ?auto_76086 ) ( CALIBRATION_TARGET ?auto_76097 ?auto_76101 ) ( POWER_AVAIL ?auto_76099 ) ( POINTING ?auto_76099 ?auto_76098 ) ( not ( = ?auto_76101 ?auto_76098 ) ) ( not ( = ?auto_76087 ?auto_76098 ) ) ( not ( = ?auto_76086 ?auto_76089 ) ) ( not ( = ?auto_76088 ?auto_76098 ) ) ( not ( = ?auto_76086 ?auto_76093 ) ) ( not ( = ?auto_76089 ?auto_76093 ) ) ( not ( = ?auto_76092 ?auto_76098 ) ) ( not ( = ?auto_76100 ?auto_76097 ) ) ( not ( = ?auto_76086 ?auto_76085 ) ) ( not ( = ?auto_76089 ?auto_76085 ) ) ( not ( = ?auto_76093 ?auto_76085 ) ) ( not ( = ?auto_76084 ?auto_76098 ) ) ( not ( = ?auto_76094 ?auto_76096 ) ) ( not ( = ?auto_76094 ?auto_76097 ) ) ( not ( = ?auto_76086 ?auto_76091 ) ) ( not ( = ?auto_76089 ?auto_76091 ) ) ( not ( = ?auto_76093 ?auto_76091 ) ) ( not ( = ?auto_76085 ?auto_76091 ) ) ( not ( = ?auto_76090 ?auto_76098 ) ) ( not ( = ?auto_76095 ?auto_76100 ) ) ( not ( = ?auto_76095 ?auto_76096 ) ) ( not ( = ?auto_76095 ?auto_76097 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_76087 ?auto_76086 ?auto_76088 ?auto_76089 ?auto_76092 ?auto_76093 ?auto_76090 ?auto_76091 ?auto_76084 ?auto_76085 )
      ( GET-5IMAGE-VERIFY ?auto_76084 ?auto_76085 ?auto_76087 ?auto_76086 ?auto_76088 ?auto_76089 ?auto_76090 ?auto_76091 ?auto_76092 ?auto_76093 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_76162 - DIRECTION
      ?auto_76163 - MODE
      ?auto_76165 - DIRECTION
      ?auto_76164 - MODE
      ?auto_76166 - DIRECTION
      ?auto_76167 - MODE
      ?auto_76168 - DIRECTION
      ?auto_76169 - MODE
      ?auto_76170 - DIRECTION
      ?auto_76171 - MODE
    )
    :vars
    (
      ?auto_76173 - INSTRUMENT
      ?auto_76177 - SATELLITE
      ?auto_76179 - DIRECTION
      ?auto_76172 - INSTRUMENT
      ?auto_76178 - INSTRUMENT
      ?auto_76174 - INSTRUMENT
      ?auto_76175 - INSTRUMENT
      ?auto_76176 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_76165 ?auto_76162 ) ) ( not ( = ?auto_76166 ?auto_76162 ) ) ( not ( = ?auto_76166 ?auto_76165 ) ) ( not ( = ?auto_76168 ?auto_76162 ) ) ( not ( = ?auto_76168 ?auto_76165 ) ) ( not ( = ?auto_76168 ?auto_76166 ) ) ( not ( = ?auto_76170 ?auto_76162 ) ) ( not ( = ?auto_76170 ?auto_76165 ) ) ( not ( = ?auto_76170 ?auto_76166 ) ) ( not ( = ?auto_76170 ?auto_76168 ) ) ( ON_BOARD ?auto_76173 ?auto_76177 ) ( SUPPORTS ?auto_76173 ?auto_76171 ) ( not ( = ?auto_76170 ?auto_76179 ) ) ( CALIBRATION_TARGET ?auto_76173 ?auto_76179 ) ( not ( = ?auto_76179 ?auto_76162 ) ) ( ON_BOARD ?auto_76172 ?auto_76177 ) ( not ( = ?auto_76173 ?auto_76172 ) ) ( SUPPORTS ?auto_76172 ?auto_76163 ) ( CALIBRATION_TARGET ?auto_76172 ?auto_76179 ) ( not ( = ?auto_76179 ?auto_76166 ) ) ( ON_BOARD ?auto_76178 ?auto_76177 ) ( not ( = ?auto_76172 ?auto_76178 ) ) ( SUPPORTS ?auto_76178 ?auto_76167 ) ( CALIBRATION_TARGET ?auto_76178 ?auto_76179 ) ( not ( = ?auto_76179 ?auto_76168 ) ) ( ON_BOARD ?auto_76174 ?auto_76177 ) ( not ( = ?auto_76178 ?auto_76174 ) ) ( SUPPORTS ?auto_76174 ?auto_76169 ) ( CALIBRATION_TARGET ?auto_76174 ?auto_76179 ) ( not ( = ?auto_76179 ?auto_76165 ) ) ( ON_BOARD ?auto_76175 ?auto_76177 ) ( not ( = ?auto_76174 ?auto_76175 ) ) ( SUPPORTS ?auto_76175 ?auto_76164 ) ( CALIBRATION_TARGET ?auto_76175 ?auto_76179 ) ( POWER_AVAIL ?auto_76177 ) ( POINTING ?auto_76177 ?auto_76176 ) ( not ( = ?auto_76179 ?auto_76176 ) ) ( not ( = ?auto_76165 ?auto_76176 ) ) ( not ( = ?auto_76164 ?auto_76169 ) ) ( not ( = ?auto_76168 ?auto_76176 ) ) ( not ( = ?auto_76164 ?auto_76167 ) ) ( not ( = ?auto_76169 ?auto_76167 ) ) ( not ( = ?auto_76166 ?auto_76176 ) ) ( not ( = ?auto_76178 ?auto_76175 ) ) ( not ( = ?auto_76164 ?auto_76163 ) ) ( not ( = ?auto_76169 ?auto_76163 ) ) ( not ( = ?auto_76167 ?auto_76163 ) ) ( not ( = ?auto_76162 ?auto_76176 ) ) ( not ( = ?auto_76172 ?auto_76174 ) ) ( not ( = ?auto_76172 ?auto_76175 ) ) ( not ( = ?auto_76164 ?auto_76171 ) ) ( not ( = ?auto_76169 ?auto_76171 ) ) ( not ( = ?auto_76167 ?auto_76171 ) ) ( not ( = ?auto_76163 ?auto_76171 ) ) ( not ( = ?auto_76170 ?auto_76176 ) ) ( not ( = ?auto_76173 ?auto_76178 ) ) ( not ( = ?auto_76173 ?auto_76174 ) ) ( not ( = ?auto_76173 ?auto_76175 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_76165 ?auto_76164 ?auto_76168 ?auto_76169 ?auto_76166 ?auto_76167 ?auto_76170 ?auto_76171 ?auto_76162 ?auto_76163 )
      ( GET-5IMAGE-VERIFY ?auto_76162 ?auto_76163 ?auto_76165 ?auto_76164 ?auto_76166 ?auto_76167 ?auto_76168 ?auto_76169 ?auto_76170 ?auto_76171 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_76240 - DIRECTION
      ?auto_76241 - MODE
      ?auto_76243 - DIRECTION
      ?auto_76242 - MODE
      ?auto_76244 - DIRECTION
      ?auto_76245 - MODE
      ?auto_76246 - DIRECTION
      ?auto_76247 - MODE
      ?auto_76248 - DIRECTION
      ?auto_76249 - MODE
    )
    :vars
    (
      ?auto_76251 - INSTRUMENT
      ?auto_76255 - SATELLITE
      ?auto_76257 - DIRECTION
      ?auto_76250 - INSTRUMENT
      ?auto_76256 - INSTRUMENT
      ?auto_76252 - INSTRUMENT
      ?auto_76253 - INSTRUMENT
      ?auto_76254 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_76243 ?auto_76240 ) ) ( not ( = ?auto_76244 ?auto_76240 ) ) ( not ( = ?auto_76244 ?auto_76243 ) ) ( not ( = ?auto_76246 ?auto_76240 ) ) ( not ( = ?auto_76246 ?auto_76243 ) ) ( not ( = ?auto_76246 ?auto_76244 ) ) ( not ( = ?auto_76248 ?auto_76240 ) ) ( not ( = ?auto_76248 ?auto_76243 ) ) ( not ( = ?auto_76248 ?auto_76244 ) ) ( not ( = ?auto_76248 ?auto_76246 ) ) ( ON_BOARD ?auto_76251 ?auto_76255 ) ( SUPPORTS ?auto_76251 ?auto_76247 ) ( not ( = ?auto_76246 ?auto_76257 ) ) ( CALIBRATION_TARGET ?auto_76251 ?auto_76257 ) ( not ( = ?auto_76257 ?auto_76240 ) ) ( ON_BOARD ?auto_76250 ?auto_76255 ) ( not ( = ?auto_76251 ?auto_76250 ) ) ( SUPPORTS ?auto_76250 ?auto_76241 ) ( CALIBRATION_TARGET ?auto_76250 ?auto_76257 ) ( not ( = ?auto_76257 ?auto_76244 ) ) ( ON_BOARD ?auto_76256 ?auto_76255 ) ( not ( = ?auto_76250 ?auto_76256 ) ) ( SUPPORTS ?auto_76256 ?auto_76245 ) ( CALIBRATION_TARGET ?auto_76256 ?auto_76257 ) ( not ( = ?auto_76257 ?auto_76248 ) ) ( ON_BOARD ?auto_76252 ?auto_76255 ) ( not ( = ?auto_76256 ?auto_76252 ) ) ( SUPPORTS ?auto_76252 ?auto_76249 ) ( CALIBRATION_TARGET ?auto_76252 ?auto_76257 ) ( not ( = ?auto_76257 ?auto_76243 ) ) ( ON_BOARD ?auto_76253 ?auto_76255 ) ( not ( = ?auto_76252 ?auto_76253 ) ) ( SUPPORTS ?auto_76253 ?auto_76242 ) ( CALIBRATION_TARGET ?auto_76253 ?auto_76257 ) ( POWER_AVAIL ?auto_76255 ) ( POINTING ?auto_76255 ?auto_76254 ) ( not ( = ?auto_76257 ?auto_76254 ) ) ( not ( = ?auto_76243 ?auto_76254 ) ) ( not ( = ?auto_76242 ?auto_76249 ) ) ( not ( = ?auto_76248 ?auto_76254 ) ) ( not ( = ?auto_76242 ?auto_76245 ) ) ( not ( = ?auto_76249 ?auto_76245 ) ) ( not ( = ?auto_76244 ?auto_76254 ) ) ( not ( = ?auto_76256 ?auto_76253 ) ) ( not ( = ?auto_76242 ?auto_76241 ) ) ( not ( = ?auto_76249 ?auto_76241 ) ) ( not ( = ?auto_76245 ?auto_76241 ) ) ( not ( = ?auto_76240 ?auto_76254 ) ) ( not ( = ?auto_76250 ?auto_76252 ) ) ( not ( = ?auto_76250 ?auto_76253 ) ) ( not ( = ?auto_76242 ?auto_76247 ) ) ( not ( = ?auto_76249 ?auto_76247 ) ) ( not ( = ?auto_76245 ?auto_76247 ) ) ( not ( = ?auto_76241 ?auto_76247 ) ) ( not ( = ?auto_76246 ?auto_76254 ) ) ( not ( = ?auto_76251 ?auto_76256 ) ) ( not ( = ?auto_76251 ?auto_76252 ) ) ( not ( = ?auto_76251 ?auto_76253 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_76243 ?auto_76242 ?auto_76248 ?auto_76249 ?auto_76244 ?auto_76245 ?auto_76246 ?auto_76247 ?auto_76240 ?auto_76241 )
      ( GET-5IMAGE-VERIFY ?auto_76240 ?auto_76241 ?auto_76243 ?auto_76242 ?auto_76244 ?auto_76245 ?auto_76246 ?auto_76247 ?auto_76248 ?auto_76249 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_76654 - DIRECTION
      ?auto_76655 - MODE
      ?auto_76657 - DIRECTION
      ?auto_76656 - MODE
      ?auto_76658 - DIRECTION
      ?auto_76659 - MODE
      ?auto_76660 - DIRECTION
      ?auto_76661 - MODE
      ?auto_76662 - DIRECTION
      ?auto_76663 - MODE
    )
    :vars
    (
      ?auto_76665 - INSTRUMENT
      ?auto_76669 - SATELLITE
      ?auto_76671 - DIRECTION
      ?auto_76664 - INSTRUMENT
      ?auto_76670 - INSTRUMENT
      ?auto_76666 - INSTRUMENT
      ?auto_76667 - INSTRUMENT
      ?auto_76668 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_76657 ?auto_76654 ) ) ( not ( = ?auto_76658 ?auto_76654 ) ) ( not ( = ?auto_76658 ?auto_76657 ) ) ( not ( = ?auto_76660 ?auto_76654 ) ) ( not ( = ?auto_76660 ?auto_76657 ) ) ( not ( = ?auto_76660 ?auto_76658 ) ) ( not ( = ?auto_76662 ?auto_76654 ) ) ( not ( = ?auto_76662 ?auto_76657 ) ) ( not ( = ?auto_76662 ?auto_76658 ) ) ( not ( = ?auto_76662 ?auto_76660 ) ) ( ON_BOARD ?auto_76665 ?auto_76669 ) ( SUPPORTS ?auto_76665 ?auto_76659 ) ( not ( = ?auto_76658 ?auto_76671 ) ) ( CALIBRATION_TARGET ?auto_76665 ?auto_76671 ) ( not ( = ?auto_76671 ?auto_76654 ) ) ( ON_BOARD ?auto_76664 ?auto_76669 ) ( not ( = ?auto_76665 ?auto_76664 ) ) ( SUPPORTS ?auto_76664 ?auto_76655 ) ( CALIBRATION_TARGET ?auto_76664 ?auto_76671 ) ( not ( = ?auto_76671 ?auto_76662 ) ) ( ON_BOARD ?auto_76670 ?auto_76669 ) ( not ( = ?auto_76664 ?auto_76670 ) ) ( SUPPORTS ?auto_76670 ?auto_76663 ) ( CALIBRATION_TARGET ?auto_76670 ?auto_76671 ) ( not ( = ?auto_76671 ?auto_76660 ) ) ( ON_BOARD ?auto_76666 ?auto_76669 ) ( not ( = ?auto_76670 ?auto_76666 ) ) ( SUPPORTS ?auto_76666 ?auto_76661 ) ( CALIBRATION_TARGET ?auto_76666 ?auto_76671 ) ( not ( = ?auto_76671 ?auto_76657 ) ) ( ON_BOARD ?auto_76667 ?auto_76669 ) ( not ( = ?auto_76666 ?auto_76667 ) ) ( SUPPORTS ?auto_76667 ?auto_76656 ) ( CALIBRATION_TARGET ?auto_76667 ?auto_76671 ) ( POWER_AVAIL ?auto_76669 ) ( POINTING ?auto_76669 ?auto_76668 ) ( not ( = ?auto_76671 ?auto_76668 ) ) ( not ( = ?auto_76657 ?auto_76668 ) ) ( not ( = ?auto_76656 ?auto_76661 ) ) ( not ( = ?auto_76660 ?auto_76668 ) ) ( not ( = ?auto_76656 ?auto_76663 ) ) ( not ( = ?auto_76661 ?auto_76663 ) ) ( not ( = ?auto_76662 ?auto_76668 ) ) ( not ( = ?auto_76670 ?auto_76667 ) ) ( not ( = ?auto_76656 ?auto_76655 ) ) ( not ( = ?auto_76661 ?auto_76655 ) ) ( not ( = ?auto_76663 ?auto_76655 ) ) ( not ( = ?auto_76654 ?auto_76668 ) ) ( not ( = ?auto_76664 ?auto_76666 ) ) ( not ( = ?auto_76664 ?auto_76667 ) ) ( not ( = ?auto_76656 ?auto_76659 ) ) ( not ( = ?auto_76661 ?auto_76659 ) ) ( not ( = ?auto_76663 ?auto_76659 ) ) ( not ( = ?auto_76655 ?auto_76659 ) ) ( not ( = ?auto_76658 ?auto_76668 ) ) ( not ( = ?auto_76665 ?auto_76670 ) ) ( not ( = ?auto_76665 ?auto_76666 ) ) ( not ( = ?auto_76665 ?auto_76667 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_76657 ?auto_76656 ?auto_76660 ?auto_76661 ?auto_76662 ?auto_76663 ?auto_76658 ?auto_76659 ?auto_76654 ?auto_76655 )
      ( GET-5IMAGE-VERIFY ?auto_76654 ?auto_76655 ?auto_76657 ?auto_76656 ?auto_76658 ?auto_76659 ?auto_76660 ?auto_76661 ?auto_76662 ?auto_76663 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_76732 - DIRECTION
      ?auto_76733 - MODE
      ?auto_76735 - DIRECTION
      ?auto_76734 - MODE
      ?auto_76736 - DIRECTION
      ?auto_76737 - MODE
      ?auto_76738 - DIRECTION
      ?auto_76739 - MODE
      ?auto_76740 - DIRECTION
      ?auto_76741 - MODE
    )
    :vars
    (
      ?auto_76743 - INSTRUMENT
      ?auto_76747 - SATELLITE
      ?auto_76749 - DIRECTION
      ?auto_76742 - INSTRUMENT
      ?auto_76748 - INSTRUMENT
      ?auto_76744 - INSTRUMENT
      ?auto_76745 - INSTRUMENT
      ?auto_76746 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_76735 ?auto_76732 ) ) ( not ( = ?auto_76736 ?auto_76732 ) ) ( not ( = ?auto_76736 ?auto_76735 ) ) ( not ( = ?auto_76738 ?auto_76732 ) ) ( not ( = ?auto_76738 ?auto_76735 ) ) ( not ( = ?auto_76738 ?auto_76736 ) ) ( not ( = ?auto_76740 ?auto_76732 ) ) ( not ( = ?auto_76740 ?auto_76735 ) ) ( not ( = ?auto_76740 ?auto_76736 ) ) ( not ( = ?auto_76740 ?auto_76738 ) ) ( ON_BOARD ?auto_76743 ?auto_76747 ) ( SUPPORTS ?auto_76743 ?auto_76737 ) ( not ( = ?auto_76736 ?auto_76749 ) ) ( CALIBRATION_TARGET ?auto_76743 ?auto_76749 ) ( not ( = ?auto_76749 ?auto_76732 ) ) ( ON_BOARD ?auto_76742 ?auto_76747 ) ( not ( = ?auto_76743 ?auto_76742 ) ) ( SUPPORTS ?auto_76742 ?auto_76733 ) ( CALIBRATION_TARGET ?auto_76742 ?auto_76749 ) ( not ( = ?auto_76749 ?auto_76738 ) ) ( ON_BOARD ?auto_76748 ?auto_76747 ) ( not ( = ?auto_76742 ?auto_76748 ) ) ( SUPPORTS ?auto_76748 ?auto_76739 ) ( CALIBRATION_TARGET ?auto_76748 ?auto_76749 ) ( not ( = ?auto_76749 ?auto_76740 ) ) ( ON_BOARD ?auto_76744 ?auto_76747 ) ( not ( = ?auto_76748 ?auto_76744 ) ) ( SUPPORTS ?auto_76744 ?auto_76741 ) ( CALIBRATION_TARGET ?auto_76744 ?auto_76749 ) ( not ( = ?auto_76749 ?auto_76735 ) ) ( ON_BOARD ?auto_76745 ?auto_76747 ) ( not ( = ?auto_76744 ?auto_76745 ) ) ( SUPPORTS ?auto_76745 ?auto_76734 ) ( CALIBRATION_TARGET ?auto_76745 ?auto_76749 ) ( POWER_AVAIL ?auto_76747 ) ( POINTING ?auto_76747 ?auto_76746 ) ( not ( = ?auto_76749 ?auto_76746 ) ) ( not ( = ?auto_76735 ?auto_76746 ) ) ( not ( = ?auto_76734 ?auto_76741 ) ) ( not ( = ?auto_76740 ?auto_76746 ) ) ( not ( = ?auto_76734 ?auto_76739 ) ) ( not ( = ?auto_76741 ?auto_76739 ) ) ( not ( = ?auto_76738 ?auto_76746 ) ) ( not ( = ?auto_76748 ?auto_76745 ) ) ( not ( = ?auto_76734 ?auto_76733 ) ) ( not ( = ?auto_76741 ?auto_76733 ) ) ( not ( = ?auto_76739 ?auto_76733 ) ) ( not ( = ?auto_76732 ?auto_76746 ) ) ( not ( = ?auto_76742 ?auto_76744 ) ) ( not ( = ?auto_76742 ?auto_76745 ) ) ( not ( = ?auto_76734 ?auto_76737 ) ) ( not ( = ?auto_76741 ?auto_76737 ) ) ( not ( = ?auto_76739 ?auto_76737 ) ) ( not ( = ?auto_76733 ?auto_76737 ) ) ( not ( = ?auto_76736 ?auto_76746 ) ) ( not ( = ?auto_76743 ?auto_76748 ) ) ( not ( = ?auto_76743 ?auto_76744 ) ) ( not ( = ?auto_76743 ?auto_76745 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_76735 ?auto_76734 ?auto_76740 ?auto_76741 ?auto_76738 ?auto_76739 ?auto_76736 ?auto_76737 ?auto_76732 ?auto_76733 )
      ( GET-5IMAGE-VERIFY ?auto_76732 ?auto_76733 ?auto_76735 ?auto_76734 ?auto_76736 ?auto_76737 ?auto_76738 ?auto_76739 ?auto_76740 ?auto_76741 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_77062 - DIRECTION
      ?auto_77063 - MODE
      ?auto_77065 - DIRECTION
      ?auto_77064 - MODE
      ?auto_77066 - DIRECTION
      ?auto_77067 - MODE
      ?auto_77068 - DIRECTION
      ?auto_77069 - MODE
      ?auto_77070 - DIRECTION
      ?auto_77071 - MODE
    )
    :vars
    (
      ?auto_77073 - INSTRUMENT
      ?auto_77077 - SATELLITE
      ?auto_77079 - DIRECTION
      ?auto_77072 - INSTRUMENT
      ?auto_77078 - INSTRUMENT
      ?auto_77074 - INSTRUMENT
      ?auto_77075 - INSTRUMENT
      ?auto_77076 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_77065 ?auto_77062 ) ) ( not ( = ?auto_77066 ?auto_77062 ) ) ( not ( = ?auto_77066 ?auto_77065 ) ) ( not ( = ?auto_77068 ?auto_77062 ) ) ( not ( = ?auto_77068 ?auto_77065 ) ) ( not ( = ?auto_77068 ?auto_77066 ) ) ( not ( = ?auto_77070 ?auto_77062 ) ) ( not ( = ?auto_77070 ?auto_77065 ) ) ( not ( = ?auto_77070 ?auto_77066 ) ) ( not ( = ?auto_77070 ?auto_77068 ) ) ( ON_BOARD ?auto_77073 ?auto_77077 ) ( SUPPORTS ?auto_77073 ?auto_77071 ) ( not ( = ?auto_77070 ?auto_77079 ) ) ( CALIBRATION_TARGET ?auto_77073 ?auto_77079 ) ( not ( = ?auto_77079 ?auto_77062 ) ) ( ON_BOARD ?auto_77072 ?auto_77077 ) ( not ( = ?auto_77073 ?auto_77072 ) ) ( SUPPORTS ?auto_77072 ?auto_77063 ) ( CALIBRATION_TARGET ?auto_77072 ?auto_77079 ) ( not ( = ?auto_77079 ?auto_77068 ) ) ( ON_BOARD ?auto_77078 ?auto_77077 ) ( not ( = ?auto_77072 ?auto_77078 ) ) ( SUPPORTS ?auto_77078 ?auto_77069 ) ( CALIBRATION_TARGET ?auto_77078 ?auto_77079 ) ( not ( = ?auto_77079 ?auto_77065 ) ) ( ON_BOARD ?auto_77074 ?auto_77077 ) ( not ( = ?auto_77078 ?auto_77074 ) ) ( SUPPORTS ?auto_77074 ?auto_77064 ) ( CALIBRATION_TARGET ?auto_77074 ?auto_77079 ) ( not ( = ?auto_77079 ?auto_77066 ) ) ( ON_BOARD ?auto_77075 ?auto_77077 ) ( not ( = ?auto_77074 ?auto_77075 ) ) ( SUPPORTS ?auto_77075 ?auto_77067 ) ( CALIBRATION_TARGET ?auto_77075 ?auto_77079 ) ( POWER_AVAIL ?auto_77077 ) ( POINTING ?auto_77077 ?auto_77076 ) ( not ( = ?auto_77079 ?auto_77076 ) ) ( not ( = ?auto_77066 ?auto_77076 ) ) ( not ( = ?auto_77067 ?auto_77064 ) ) ( not ( = ?auto_77065 ?auto_77076 ) ) ( not ( = ?auto_77067 ?auto_77069 ) ) ( not ( = ?auto_77064 ?auto_77069 ) ) ( not ( = ?auto_77068 ?auto_77076 ) ) ( not ( = ?auto_77078 ?auto_77075 ) ) ( not ( = ?auto_77067 ?auto_77063 ) ) ( not ( = ?auto_77064 ?auto_77063 ) ) ( not ( = ?auto_77069 ?auto_77063 ) ) ( not ( = ?auto_77062 ?auto_77076 ) ) ( not ( = ?auto_77072 ?auto_77074 ) ) ( not ( = ?auto_77072 ?auto_77075 ) ) ( not ( = ?auto_77067 ?auto_77071 ) ) ( not ( = ?auto_77064 ?auto_77071 ) ) ( not ( = ?auto_77069 ?auto_77071 ) ) ( not ( = ?auto_77063 ?auto_77071 ) ) ( not ( = ?auto_77070 ?auto_77076 ) ) ( not ( = ?auto_77073 ?auto_77078 ) ) ( not ( = ?auto_77073 ?auto_77074 ) ) ( not ( = ?auto_77073 ?auto_77075 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_77066 ?auto_77067 ?auto_77065 ?auto_77064 ?auto_77068 ?auto_77069 ?auto_77070 ?auto_77071 ?auto_77062 ?auto_77063 )
      ( GET-5IMAGE-VERIFY ?auto_77062 ?auto_77063 ?auto_77065 ?auto_77064 ?auto_77066 ?auto_77067 ?auto_77068 ?auto_77069 ?auto_77070 ?auto_77071 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_77140 - DIRECTION
      ?auto_77141 - MODE
      ?auto_77143 - DIRECTION
      ?auto_77142 - MODE
      ?auto_77144 - DIRECTION
      ?auto_77145 - MODE
      ?auto_77146 - DIRECTION
      ?auto_77147 - MODE
      ?auto_77148 - DIRECTION
      ?auto_77149 - MODE
    )
    :vars
    (
      ?auto_77151 - INSTRUMENT
      ?auto_77155 - SATELLITE
      ?auto_77157 - DIRECTION
      ?auto_77150 - INSTRUMENT
      ?auto_77156 - INSTRUMENT
      ?auto_77152 - INSTRUMENT
      ?auto_77153 - INSTRUMENT
      ?auto_77154 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_77143 ?auto_77140 ) ) ( not ( = ?auto_77144 ?auto_77140 ) ) ( not ( = ?auto_77144 ?auto_77143 ) ) ( not ( = ?auto_77146 ?auto_77140 ) ) ( not ( = ?auto_77146 ?auto_77143 ) ) ( not ( = ?auto_77146 ?auto_77144 ) ) ( not ( = ?auto_77148 ?auto_77140 ) ) ( not ( = ?auto_77148 ?auto_77143 ) ) ( not ( = ?auto_77148 ?auto_77144 ) ) ( not ( = ?auto_77148 ?auto_77146 ) ) ( ON_BOARD ?auto_77151 ?auto_77155 ) ( SUPPORTS ?auto_77151 ?auto_77147 ) ( not ( = ?auto_77146 ?auto_77157 ) ) ( CALIBRATION_TARGET ?auto_77151 ?auto_77157 ) ( not ( = ?auto_77157 ?auto_77140 ) ) ( ON_BOARD ?auto_77150 ?auto_77155 ) ( not ( = ?auto_77151 ?auto_77150 ) ) ( SUPPORTS ?auto_77150 ?auto_77141 ) ( CALIBRATION_TARGET ?auto_77150 ?auto_77157 ) ( not ( = ?auto_77157 ?auto_77148 ) ) ( ON_BOARD ?auto_77156 ?auto_77155 ) ( not ( = ?auto_77150 ?auto_77156 ) ) ( SUPPORTS ?auto_77156 ?auto_77149 ) ( CALIBRATION_TARGET ?auto_77156 ?auto_77157 ) ( not ( = ?auto_77157 ?auto_77143 ) ) ( ON_BOARD ?auto_77152 ?auto_77155 ) ( not ( = ?auto_77156 ?auto_77152 ) ) ( SUPPORTS ?auto_77152 ?auto_77142 ) ( CALIBRATION_TARGET ?auto_77152 ?auto_77157 ) ( not ( = ?auto_77157 ?auto_77144 ) ) ( ON_BOARD ?auto_77153 ?auto_77155 ) ( not ( = ?auto_77152 ?auto_77153 ) ) ( SUPPORTS ?auto_77153 ?auto_77145 ) ( CALIBRATION_TARGET ?auto_77153 ?auto_77157 ) ( POWER_AVAIL ?auto_77155 ) ( POINTING ?auto_77155 ?auto_77154 ) ( not ( = ?auto_77157 ?auto_77154 ) ) ( not ( = ?auto_77144 ?auto_77154 ) ) ( not ( = ?auto_77145 ?auto_77142 ) ) ( not ( = ?auto_77143 ?auto_77154 ) ) ( not ( = ?auto_77145 ?auto_77149 ) ) ( not ( = ?auto_77142 ?auto_77149 ) ) ( not ( = ?auto_77148 ?auto_77154 ) ) ( not ( = ?auto_77156 ?auto_77153 ) ) ( not ( = ?auto_77145 ?auto_77141 ) ) ( not ( = ?auto_77142 ?auto_77141 ) ) ( not ( = ?auto_77149 ?auto_77141 ) ) ( not ( = ?auto_77140 ?auto_77154 ) ) ( not ( = ?auto_77150 ?auto_77152 ) ) ( not ( = ?auto_77150 ?auto_77153 ) ) ( not ( = ?auto_77145 ?auto_77147 ) ) ( not ( = ?auto_77142 ?auto_77147 ) ) ( not ( = ?auto_77149 ?auto_77147 ) ) ( not ( = ?auto_77141 ?auto_77147 ) ) ( not ( = ?auto_77146 ?auto_77154 ) ) ( not ( = ?auto_77151 ?auto_77156 ) ) ( not ( = ?auto_77151 ?auto_77152 ) ) ( not ( = ?auto_77151 ?auto_77153 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_77144 ?auto_77145 ?auto_77143 ?auto_77142 ?auto_77148 ?auto_77149 ?auto_77146 ?auto_77147 ?auto_77140 ?auto_77141 )
      ( GET-5IMAGE-VERIFY ?auto_77140 ?auto_77141 ?auto_77143 ?auto_77142 ?auto_77144 ?auto_77145 ?auto_77146 ?auto_77147 ?auto_77148 ?auto_77149 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_77388 - DIRECTION
      ?auto_77389 - MODE
      ?auto_77391 - DIRECTION
      ?auto_77390 - MODE
      ?auto_77392 - DIRECTION
      ?auto_77393 - MODE
      ?auto_77394 - DIRECTION
      ?auto_77395 - MODE
      ?auto_77396 - DIRECTION
      ?auto_77397 - MODE
    )
    :vars
    (
      ?auto_77399 - INSTRUMENT
      ?auto_77403 - SATELLITE
      ?auto_77405 - DIRECTION
      ?auto_77398 - INSTRUMENT
      ?auto_77404 - INSTRUMENT
      ?auto_77400 - INSTRUMENT
      ?auto_77401 - INSTRUMENT
      ?auto_77402 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_77391 ?auto_77388 ) ) ( not ( = ?auto_77392 ?auto_77388 ) ) ( not ( = ?auto_77392 ?auto_77391 ) ) ( not ( = ?auto_77394 ?auto_77388 ) ) ( not ( = ?auto_77394 ?auto_77391 ) ) ( not ( = ?auto_77394 ?auto_77392 ) ) ( not ( = ?auto_77396 ?auto_77388 ) ) ( not ( = ?auto_77396 ?auto_77391 ) ) ( not ( = ?auto_77396 ?auto_77392 ) ) ( not ( = ?auto_77396 ?auto_77394 ) ) ( ON_BOARD ?auto_77399 ?auto_77403 ) ( SUPPORTS ?auto_77399 ?auto_77397 ) ( not ( = ?auto_77396 ?auto_77405 ) ) ( CALIBRATION_TARGET ?auto_77399 ?auto_77405 ) ( not ( = ?auto_77405 ?auto_77388 ) ) ( ON_BOARD ?auto_77398 ?auto_77403 ) ( not ( = ?auto_77399 ?auto_77398 ) ) ( SUPPORTS ?auto_77398 ?auto_77389 ) ( CALIBRATION_TARGET ?auto_77398 ?auto_77405 ) ( not ( = ?auto_77405 ?auto_77392 ) ) ( ON_BOARD ?auto_77404 ?auto_77403 ) ( not ( = ?auto_77398 ?auto_77404 ) ) ( SUPPORTS ?auto_77404 ?auto_77393 ) ( CALIBRATION_TARGET ?auto_77404 ?auto_77405 ) ( not ( = ?auto_77405 ?auto_77391 ) ) ( ON_BOARD ?auto_77400 ?auto_77403 ) ( not ( = ?auto_77404 ?auto_77400 ) ) ( SUPPORTS ?auto_77400 ?auto_77390 ) ( CALIBRATION_TARGET ?auto_77400 ?auto_77405 ) ( not ( = ?auto_77405 ?auto_77394 ) ) ( ON_BOARD ?auto_77401 ?auto_77403 ) ( not ( = ?auto_77400 ?auto_77401 ) ) ( SUPPORTS ?auto_77401 ?auto_77395 ) ( CALIBRATION_TARGET ?auto_77401 ?auto_77405 ) ( POWER_AVAIL ?auto_77403 ) ( POINTING ?auto_77403 ?auto_77402 ) ( not ( = ?auto_77405 ?auto_77402 ) ) ( not ( = ?auto_77394 ?auto_77402 ) ) ( not ( = ?auto_77395 ?auto_77390 ) ) ( not ( = ?auto_77391 ?auto_77402 ) ) ( not ( = ?auto_77395 ?auto_77393 ) ) ( not ( = ?auto_77390 ?auto_77393 ) ) ( not ( = ?auto_77392 ?auto_77402 ) ) ( not ( = ?auto_77404 ?auto_77401 ) ) ( not ( = ?auto_77395 ?auto_77389 ) ) ( not ( = ?auto_77390 ?auto_77389 ) ) ( not ( = ?auto_77393 ?auto_77389 ) ) ( not ( = ?auto_77388 ?auto_77402 ) ) ( not ( = ?auto_77398 ?auto_77400 ) ) ( not ( = ?auto_77398 ?auto_77401 ) ) ( not ( = ?auto_77395 ?auto_77397 ) ) ( not ( = ?auto_77390 ?auto_77397 ) ) ( not ( = ?auto_77393 ?auto_77397 ) ) ( not ( = ?auto_77389 ?auto_77397 ) ) ( not ( = ?auto_77396 ?auto_77402 ) ) ( not ( = ?auto_77399 ?auto_77404 ) ) ( not ( = ?auto_77399 ?auto_77400 ) ) ( not ( = ?auto_77399 ?auto_77401 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_77394 ?auto_77395 ?auto_77391 ?auto_77390 ?auto_77392 ?auto_77393 ?auto_77396 ?auto_77397 ?auto_77388 ?auto_77389 )
      ( GET-5IMAGE-VERIFY ?auto_77388 ?auto_77389 ?auto_77391 ?auto_77390 ?auto_77392 ?auto_77393 ?auto_77394 ?auto_77395 ?auto_77396 ?auto_77397 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_77466 - DIRECTION
      ?auto_77467 - MODE
      ?auto_77469 - DIRECTION
      ?auto_77468 - MODE
      ?auto_77470 - DIRECTION
      ?auto_77471 - MODE
      ?auto_77472 - DIRECTION
      ?auto_77473 - MODE
      ?auto_77474 - DIRECTION
      ?auto_77475 - MODE
    )
    :vars
    (
      ?auto_77477 - INSTRUMENT
      ?auto_77481 - SATELLITE
      ?auto_77483 - DIRECTION
      ?auto_77476 - INSTRUMENT
      ?auto_77482 - INSTRUMENT
      ?auto_77478 - INSTRUMENT
      ?auto_77479 - INSTRUMENT
      ?auto_77480 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_77469 ?auto_77466 ) ) ( not ( = ?auto_77470 ?auto_77466 ) ) ( not ( = ?auto_77470 ?auto_77469 ) ) ( not ( = ?auto_77472 ?auto_77466 ) ) ( not ( = ?auto_77472 ?auto_77469 ) ) ( not ( = ?auto_77472 ?auto_77470 ) ) ( not ( = ?auto_77474 ?auto_77466 ) ) ( not ( = ?auto_77474 ?auto_77469 ) ) ( not ( = ?auto_77474 ?auto_77470 ) ) ( not ( = ?auto_77474 ?auto_77472 ) ) ( ON_BOARD ?auto_77477 ?auto_77481 ) ( SUPPORTS ?auto_77477 ?auto_77473 ) ( not ( = ?auto_77472 ?auto_77483 ) ) ( CALIBRATION_TARGET ?auto_77477 ?auto_77483 ) ( not ( = ?auto_77483 ?auto_77466 ) ) ( ON_BOARD ?auto_77476 ?auto_77481 ) ( not ( = ?auto_77477 ?auto_77476 ) ) ( SUPPORTS ?auto_77476 ?auto_77467 ) ( CALIBRATION_TARGET ?auto_77476 ?auto_77483 ) ( not ( = ?auto_77483 ?auto_77470 ) ) ( ON_BOARD ?auto_77482 ?auto_77481 ) ( not ( = ?auto_77476 ?auto_77482 ) ) ( SUPPORTS ?auto_77482 ?auto_77471 ) ( CALIBRATION_TARGET ?auto_77482 ?auto_77483 ) ( not ( = ?auto_77483 ?auto_77469 ) ) ( ON_BOARD ?auto_77478 ?auto_77481 ) ( not ( = ?auto_77482 ?auto_77478 ) ) ( SUPPORTS ?auto_77478 ?auto_77468 ) ( CALIBRATION_TARGET ?auto_77478 ?auto_77483 ) ( not ( = ?auto_77483 ?auto_77474 ) ) ( ON_BOARD ?auto_77479 ?auto_77481 ) ( not ( = ?auto_77478 ?auto_77479 ) ) ( SUPPORTS ?auto_77479 ?auto_77475 ) ( CALIBRATION_TARGET ?auto_77479 ?auto_77483 ) ( POWER_AVAIL ?auto_77481 ) ( POINTING ?auto_77481 ?auto_77480 ) ( not ( = ?auto_77483 ?auto_77480 ) ) ( not ( = ?auto_77474 ?auto_77480 ) ) ( not ( = ?auto_77475 ?auto_77468 ) ) ( not ( = ?auto_77469 ?auto_77480 ) ) ( not ( = ?auto_77475 ?auto_77471 ) ) ( not ( = ?auto_77468 ?auto_77471 ) ) ( not ( = ?auto_77470 ?auto_77480 ) ) ( not ( = ?auto_77482 ?auto_77479 ) ) ( not ( = ?auto_77475 ?auto_77467 ) ) ( not ( = ?auto_77468 ?auto_77467 ) ) ( not ( = ?auto_77471 ?auto_77467 ) ) ( not ( = ?auto_77466 ?auto_77480 ) ) ( not ( = ?auto_77476 ?auto_77478 ) ) ( not ( = ?auto_77476 ?auto_77479 ) ) ( not ( = ?auto_77475 ?auto_77473 ) ) ( not ( = ?auto_77468 ?auto_77473 ) ) ( not ( = ?auto_77471 ?auto_77473 ) ) ( not ( = ?auto_77467 ?auto_77473 ) ) ( not ( = ?auto_77472 ?auto_77480 ) ) ( not ( = ?auto_77477 ?auto_77482 ) ) ( not ( = ?auto_77477 ?auto_77478 ) ) ( not ( = ?auto_77477 ?auto_77479 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_77474 ?auto_77475 ?auto_77469 ?auto_77468 ?auto_77470 ?auto_77471 ?auto_77472 ?auto_77473 ?auto_77466 ?auto_77467 )
      ( GET-5IMAGE-VERIFY ?auto_77466 ?auto_77467 ?auto_77469 ?auto_77468 ?auto_77470 ?auto_77471 ?auto_77472 ?auto_77473 ?auto_77474 ?auto_77475 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_77794 - DIRECTION
      ?auto_77795 - MODE
      ?auto_77797 - DIRECTION
      ?auto_77796 - MODE
      ?auto_77798 - DIRECTION
      ?auto_77799 - MODE
      ?auto_77800 - DIRECTION
      ?auto_77801 - MODE
      ?auto_77802 - DIRECTION
      ?auto_77803 - MODE
    )
    :vars
    (
      ?auto_77805 - INSTRUMENT
      ?auto_77809 - SATELLITE
      ?auto_77811 - DIRECTION
      ?auto_77804 - INSTRUMENT
      ?auto_77810 - INSTRUMENT
      ?auto_77806 - INSTRUMENT
      ?auto_77807 - INSTRUMENT
      ?auto_77808 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_77797 ?auto_77794 ) ) ( not ( = ?auto_77798 ?auto_77794 ) ) ( not ( = ?auto_77798 ?auto_77797 ) ) ( not ( = ?auto_77800 ?auto_77794 ) ) ( not ( = ?auto_77800 ?auto_77797 ) ) ( not ( = ?auto_77800 ?auto_77798 ) ) ( not ( = ?auto_77802 ?auto_77794 ) ) ( not ( = ?auto_77802 ?auto_77797 ) ) ( not ( = ?auto_77802 ?auto_77798 ) ) ( not ( = ?auto_77802 ?auto_77800 ) ) ( ON_BOARD ?auto_77805 ?auto_77809 ) ( SUPPORTS ?auto_77805 ?auto_77799 ) ( not ( = ?auto_77798 ?auto_77811 ) ) ( CALIBRATION_TARGET ?auto_77805 ?auto_77811 ) ( not ( = ?auto_77811 ?auto_77794 ) ) ( ON_BOARD ?auto_77804 ?auto_77809 ) ( not ( = ?auto_77805 ?auto_77804 ) ) ( SUPPORTS ?auto_77804 ?auto_77795 ) ( CALIBRATION_TARGET ?auto_77804 ?auto_77811 ) ( not ( = ?auto_77811 ?auto_77802 ) ) ( ON_BOARD ?auto_77810 ?auto_77809 ) ( not ( = ?auto_77804 ?auto_77810 ) ) ( SUPPORTS ?auto_77810 ?auto_77803 ) ( CALIBRATION_TARGET ?auto_77810 ?auto_77811 ) ( not ( = ?auto_77811 ?auto_77797 ) ) ( ON_BOARD ?auto_77806 ?auto_77809 ) ( not ( = ?auto_77810 ?auto_77806 ) ) ( SUPPORTS ?auto_77806 ?auto_77796 ) ( CALIBRATION_TARGET ?auto_77806 ?auto_77811 ) ( not ( = ?auto_77811 ?auto_77800 ) ) ( ON_BOARD ?auto_77807 ?auto_77809 ) ( not ( = ?auto_77806 ?auto_77807 ) ) ( SUPPORTS ?auto_77807 ?auto_77801 ) ( CALIBRATION_TARGET ?auto_77807 ?auto_77811 ) ( POWER_AVAIL ?auto_77809 ) ( POINTING ?auto_77809 ?auto_77808 ) ( not ( = ?auto_77811 ?auto_77808 ) ) ( not ( = ?auto_77800 ?auto_77808 ) ) ( not ( = ?auto_77801 ?auto_77796 ) ) ( not ( = ?auto_77797 ?auto_77808 ) ) ( not ( = ?auto_77801 ?auto_77803 ) ) ( not ( = ?auto_77796 ?auto_77803 ) ) ( not ( = ?auto_77802 ?auto_77808 ) ) ( not ( = ?auto_77810 ?auto_77807 ) ) ( not ( = ?auto_77801 ?auto_77795 ) ) ( not ( = ?auto_77796 ?auto_77795 ) ) ( not ( = ?auto_77803 ?auto_77795 ) ) ( not ( = ?auto_77794 ?auto_77808 ) ) ( not ( = ?auto_77804 ?auto_77806 ) ) ( not ( = ?auto_77804 ?auto_77807 ) ) ( not ( = ?auto_77801 ?auto_77799 ) ) ( not ( = ?auto_77796 ?auto_77799 ) ) ( not ( = ?auto_77803 ?auto_77799 ) ) ( not ( = ?auto_77795 ?auto_77799 ) ) ( not ( = ?auto_77798 ?auto_77808 ) ) ( not ( = ?auto_77805 ?auto_77810 ) ) ( not ( = ?auto_77805 ?auto_77806 ) ) ( not ( = ?auto_77805 ?auto_77807 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_77800 ?auto_77801 ?auto_77797 ?auto_77796 ?auto_77802 ?auto_77803 ?auto_77798 ?auto_77799 ?auto_77794 ?auto_77795 )
      ( GET-5IMAGE-VERIFY ?auto_77794 ?auto_77795 ?auto_77797 ?auto_77796 ?auto_77798 ?auto_77799 ?auto_77800 ?auto_77801 ?auto_77802 ?auto_77803 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_77958 - DIRECTION
      ?auto_77959 - MODE
      ?auto_77961 - DIRECTION
      ?auto_77960 - MODE
      ?auto_77962 - DIRECTION
      ?auto_77963 - MODE
      ?auto_77964 - DIRECTION
      ?auto_77965 - MODE
      ?auto_77966 - DIRECTION
      ?auto_77967 - MODE
    )
    :vars
    (
      ?auto_77969 - INSTRUMENT
      ?auto_77973 - SATELLITE
      ?auto_77975 - DIRECTION
      ?auto_77968 - INSTRUMENT
      ?auto_77974 - INSTRUMENT
      ?auto_77970 - INSTRUMENT
      ?auto_77971 - INSTRUMENT
      ?auto_77972 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_77961 ?auto_77958 ) ) ( not ( = ?auto_77962 ?auto_77958 ) ) ( not ( = ?auto_77962 ?auto_77961 ) ) ( not ( = ?auto_77964 ?auto_77958 ) ) ( not ( = ?auto_77964 ?auto_77961 ) ) ( not ( = ?auto_77964 ?auto_77962 ) ) ( not ( = ?auto_77966 ?auto_77958 ) ) ( not ( = ?auto_77966 ?auto_77961 ) ) ( not ( = ?auto_77966 ?auto_77962 ) ) ( not ( = ?auto_77966 ?auto_77964 ) ) ( ON_BOARD ?auto_77969 ?auto_77973 ) ( SUPPORTS ?auto_77969 ?auto_77963 ) ( not ( = ?auto_77962 ?auto_77975 ) ) ( CALIBRATION_TARGET ?auto_77969 ?auto_77975 ) ( not ( = ?auto_77975 ?auto_77958 ) ) ( ON_BOARD ?auto_77968 ?auto_77973 ) ( not ( = ?auto_77969 ?auto_77968 ) ) ( SUPPORTS ?auto_77968 ?auto_77959 ) ( CALIBRATION_TARGET ?auto_77968 ?auto_77975 ) ( not ( = ?auto_77975 ?auto_77964 ) ) ( ON_BOARD ?auto_77974 ?auto_77973 ) ( not ( = ?auto_77968 ?auto_77974 ) ) ( SUPPORTS ?auto_77974 ?auto_77965 ) ( CALIBRATION_TARGET ?auto_77974 ?auto_77975 ) ( not ( = ?auto_77975 ?auto_77961 ) ) ( ON_BOARD ?auto_77970 ?auto_77973 ) ( not ( = ?auto_77974 ?auto_77970 ) ) ( SUPPORTS ?auto_77970 ?auto_77960 ) ( CALIBRATION_TARGET ?auto_77970 ?auto_77975 ) ( not ( = ?auto_77975 ?auto_77966 ) ) ( ON_BOARD ?auto_77971 ?auto_77973 ) ( not ( = ?auto_77970 ?auto_77971 ) ) ( SUPPORTS ?auto_77971 ?auto_77967 ) ( CALIBRATION_TARGET ?auto_77971 ?auto_77975 ) ( POWER_AVAIL ?auto_77973 ) ( POINTING ?auto_77973 ?auto_77972 ) ( not ( = ?auto_77975 ?auto_77972 ) ) ( not ( = ?auto_77966 ?auto_77972 ) ) ( not ( = ?auto_77967 ?auto_77960 ) ) ( not ( = ?auto_77961 ?auto_77972 ) ) ( not ( = ?auto_77967 ?auto_77965 ) ) ( not ( = ?auto_77960 ?auto_77965 ) ) ( not ( = ?auto_77964 ?auto_77972 ) ) ( not ( = ?auto_77974 ?auto_77971 ) ) ( not ( = ?auto_77967 ?auto_77959 ) ) ( not ( = ?auto_77960 ?auto_77959 ) ) ( not ( = ?auto_77965 ?auto_77959 ) ) ( not ( = ?auto_77958 ?auto_77972 ) ) ( not ( = ?auto_77968 ?auto_77970 ) ) ( not ( = ?auto_77968 ?auto_77971 ) ) ( not ( = ?auto_77967 ?auto_77963 ) ) ( not ( = ?auto_77960 ?auto_77963 ) ) ( not ( = ?auto_77965 ?auto_77963 ) ) ( not ( = ?auto_77959 ?auto_77963 ) ) ( not ( = ?auto_77962 ?auto_77972 ) ) ( not ( = ?auto_77969 ?auto_77974 ) ) ( not ( = ?auto_77969 ?auto_77970 ) ) ( not ( = ?auto_77969 ?auto_77971 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_77966 ?auto_77967 ?auto_77961 ?auto_77960 ?auto_77964 ?auto_77965 ?auto_77962 ?auto_77963 ?auto_77958 ?auto_77959 )
      ( GET-5IMAGE-VERIFY ?auto_77958 ?auto_77959 ?auto_77961 ?auto_77960 ?auto_77962 ?auto_77963 ?auto_77964 ?auto_77965 ?auto_77966 ?auto_77967 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_78288 - DIRECTION
      ?auto_78289 - MODE
      ?auto_78291 - DIRECTION
      ?auto_78290 - MODE
      ?auto_78292 - DIRECTION
      ?auto_78293 - MODE
      ?auto_78294 - DIRECTION
      ?auto_78295 - MODE
      ?auto_78296 - DIRECTION
      ?auto_78297 - MODE
    )
    :vars
    (
      ?auto_78299 - INSTRUMENT
      ?auto_78303 - SATELLITE
      ?auto_78305 - DIRECTION
      ?auto_78298 - INSTRUMENT
      ?auto_78304 - INSTRUMENT
      ?auto_78300 - INSTRUMENT
      ?auto_78301 - INSTRUMENT
      ?auto_78302 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_78291 ?auto_78288 ) ) ( not ( = ?auto_78292 ?auto_78288 ) ) ( not ( = ?auto_78292 ?auto_78291 ) ) ( not ( = ?auto_78294 ?auto_78288 ) ) ( not ( = ?auto_78294 ?auto_78291 ) ) ( not ( = ?auto_78294 ?auto_78292 ) ) ( not ( = ?auto_78296 ?auto_78288 ) ) ( not ( = ?auto_78296 ?auto_78291 ) ) ( not ( = ?auto_78296 ?auto_78292 ) ) ( not ( = ?auto_78296 ?auto_78294 ) ) ( ON_BOARD ?auto_78299 ?auto_78303 ) ( SUPPORTS ?auto_78299 ?auto_78297 ) ( not ( = ?auto_78296 ?auto_78305 ) ) ( CALIBRATION_TARGET ?auto_78299 ?auto_78305 ) ( not ( = ?auto_78305 ?auto_78288 ) ) ( ON_BOARD ?auto_78298 ?auto_78303 ) ( not ( = ?auto_78299 ?auto_78298 ) ) ( SUPPORTS ?auto_78298 ?auto_78289 ) ( CALIBRATION_TARGET ?auto_78298 ?auto_78305 ) ( not ( = ?auto_78305 ?auto_78291 ) ) ( ON_BOARD ?auto_78304 ?auto_78303 ) ( not ( = ?auto_78298 ?auto_78304 ) ) ( SUPPORTS ?auto_78304 ?auto_78290 ) ( CALIBRATION_TARGET ?auto_78304 ?auto_78305 ) ( not ( = ?auto_78305 ?auto_78294 ) ) ( ON_BOARD ?auto_78300 ?auto_78303 ) ( not ( = ?auto_78304 ?auto_78300 ) ) ( SUPPORTS ?auto_78300 ?auto_78295 ) ( CALIBRATION_TARGET ?auto_78300 ?auto_78305 ) ( not ( = ?auto_78305 ?auto_78292 ) ) ( ON_BOARD ?auto_78301 ?auto_78303 ) ( not ( = ?auto_78300 ?auto_78301 ) ) ( SUPPORTS ?auto_78301 ?auto_78293 ) ( CALIBRATION_TARGET ?auto_78301 ?auto_78305 ) ( POWER_AVAIL ?auto_78303 ) ( POINTING ?auto_78303 ?auto_78302 ) ( not ( = ?auto_78305 ?auto_78302 ) ) ( not ( = ?auto_78292 ?auto_78302 ) ) ( not ( = ?auto_78293 ?auto_78295 ) ) ( not ( = ?auto_78294 ?auto_78302 ) ) ( not ( = ?auto_78293 ?auto_78290 ) ) ( not ( = ?auto_78295 ?auto_78290 ) ) ( not ( = ?auto_78291 ?auto_78302 ) ) ( not ( = ?auto_78304 ?auto_78301 ) ) ( not ( = ?auto_78293 ?auto_78289 ) ) ( not ( = ?auto_78295 ?auto_78289 ) ) ( not ( = ?auto_78290 ?auto_78289 ) ) ( not ( = ?auto_78288 ?auto_78302 ) ) ( not ( = ?auto_78298 ?auto_78300 ) ) ( not ( = ?auto_78298 ?auto_78301 ) ) ( not ( = ?auto_78293 ?auto_78297 ) ) ( not ( = ?auto_78295 ?auto_78297 ) ) ( not ( = ?auto_78290 ?auto_78297 ) ) ( not ( = ?auto_78289 ?auto_78297 ) ) ( not ( = ?auto_78296 ?auto_78302 ) ) ( not ( = ?auto_78299 ?auto_78304 ) ) ( not ( = ?auto_78299 ?auto_78300 ) ) ( not ( = ?auto_78299 ?auto_78301 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_78292 ?auto_78293 ?auto_78294 ?auto_78295 ?auto_78291 ?auto_78290 ?auto_78296 ?auto_78297 ?auto_78288 ?auto_78289 )
      ( GET-5IMAGE-VERIFY ?auto_78288 ?auto_78289 ?auto_78291 ?auto_78290 ?auto_78292 ?auto_78293 ?auto_78294 ?auto_78295 ?auto_78296 ?auto_78297 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_78366 - DIRECTION
      ?auto_78367 - MODE
      ?auto_78369 - DIRECTION
      ?auto_78368 - MODE
      ?auto_78370 - DIRECTION
      ?auto_78371 - MODE
      ?auto_78372 - DIRECTION
      ?auto_78373 - MODE
      ?auto_78374 - DIRECTION
      ?auto_78375 - MODE
    )
    :vars
    (
      ?auto_78377 - INSTRUMENT
      ?auto_78381 - SATELLITE
      ?auto_78383 - DIRECTION
      ?auto_78376 - INSTRUMENT
      ?auto_78382 - INSTRUMENT
      ?auto_78378 - INSTRUMENT
      ?auto_78379 - INSTRUMENT
      ?auto_78380 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_78369 ?auto_78366 ) ) ( not ( = ?auto_78370 ?auto_78366 ) ) ( not ( = ?auto_78370 ?auto_78369 ) ) ( not ( = ?auto_78372 ?auto_78366 ) ) ( not ( = ?auto_78372 ?auto_78369 ) ) ( not ( = ?auto_78372 ?auto_78370 ) ) ( not ( = ?auto_78374 ?auto_78366 ) ) ( not ( = ?auto_78374 ?auto_78369 ) ) ( not ( = ?auto_78374 ?auto_78370 ) ) ( not ( = ?auto_78374 ?auto_78372 ) ) ( ON_BOARD ?auto_78377 ?auto_78381 ) ( SUPPORTS ?auto_78377 ?auto_78373 ) ( not ( = ?auto_78372 ?auto_78383 ) ) ( CALIBRATION_TARGET ?auto_78377 ?auto_78383 ) ( not ( = ?auto_78383 ?auto_78366 ) ) ( ON_BOARD ?auto_78376 ?auto_78381 ) ( not ( = ?auto_78377 ?auto_78376 ) ) ( SUPPORTS ?auto_78376 ?auto_78367 ) ( CALIBRATION_TARGET ?auto_78376 ?auto_78383 ) ( not ( = ?auto_78383 ?auto_78369 ) ) ( ON_BOARD ?auto_78382 ?auto_78381 ) ( not ( = ?auto_78376 ?auto_78382 ) ) ( SUPPORTS ?auto_78382 ?auto_78368 ) ( CALIBRATION_TARGET ?auto_78382 ?auto_78383 ) ( not ( = ?auto_78383 ?auto_78374 ) ) ( ON_BOARD ?auto_78378 ?auto_78381 ) ( not ( = ?auto_78382 ?auto_78378 ) ) ( SUPPORTS ?auto_78378 ?auto_78375 ) ( CALIBRATION_TARGET ?auto_78378 ?auto_78383 ) ( not ( = ?auto_78383 ?auto_78370 ) ) ( ON_BOARD ?auto_78379 ?auto_78381 ) ( not ( = ?auto_78378 ?auto_78379 ) ) ( SUPPORTS ?auto_78379 ?auto_78371 ) ( CALIBRATION_TARGET ?auto_78379 ?auto_78383 ) ( POWER_AVAIL ?auto_78381 ) ( POINTING ?auto_78381 ?auto_78380 ) ( not ( = ?auto_78383 ?auto_78380 ) ) ( not ( = ?auto_78370 ?auto_78380 ) ) ( not ( = ?auto_78371 ?auto_78375 ) ) ( not ( = ?auto_78374 ?auto_78380 ) ) ( not ( = ?auto_78371 ?auto_78368 ) ) ( not ( = ?auto_78375 ?auto_78368 ) ) ( not ( = ?auto_78369 ?auto_78380 ) ) ( not ( = ?auto_78382 ?auto_78379 ) ) ( not ( = ?auto_78371 ?auto_78367 ) ) ( not ( = ?auto_78375 ?auto_78367 ) ) ( not ( = ?auto_78368 ?auto_78367 ) ) ( not ( = ?auto_78366 ?auto_78380 ) ) ( not ( = ?auto_78376 ?auto_78378 ) ) ( not ( = ?auto_78376 ?auto_78379 ) ) ( not ( = ?auto_78371 ?auto_78373 ) ) ( not ( = ?auto_78375 ?auto_78373 ) ) ( not ( = ?auto_78368 ?auto_78373 ) ) ( not ( = ?auto_78367 ?auto_78373 ) ) ( not ( = ?auto_78372 ?auto_78380 ) ) ( not ( = ?auto_78377 ?auto_78382 ) ) ( not ( = ?auto_78377 ?auto_78378 ) ) ( not ( = ?auto_78377 ?auto_78379 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_78370 ?auto_78371 ?auto_78374 ?auto_78375 ?auto_78369 ?auto_78368 ?auto_78372 ?auto_78373 ?auto_78366 ?auto_78367 )
      ( GET-5IMAGE-VERIFY ?auto_78366 ?auto_78367 ?auto_78369 ?auto_78368 ?auto_78370 ?auto_78371 ?auto_78372 ?auto_78373 ?auto_78374 ?auto_78375 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_78444 - DIRECTION
      ?auto_78445 - MODE
      ?auto_78447 - DIRECTION
      ?auto_78446 - MODE
      ?auto_78448 - DIRECTION
      ?auto_78449 - MODE
      ?auto_78450 - DIRECTION
      ?auto_78451 - MODE
      ?auto_78452 - DIRECTION
      ?auto_78453 - MODE
    )
    :vars
    (
      ?auto_78455 - INSTRUMENT
      ?auto_78459 - SATELLITE
      ?auto_78461 - DIRECTION
      ?auto_78454 - INSTRUMENT
      ?auto_78460 - INSTRUMENT
      ?auto_78456 - INSTRUMENT
      ?auto_78457 - INSTRUMENT
      ?auto_78458 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_78447 ?auto_78444 ) ) ( not ( = ?auto_78448 ?auto_78444 ) ) ( not ( = ?auto_78448 ?auto_78447 ) ) ( not ( = ?auto_78450 ?auto_78444 ) ) ( not ( = ?auto_78450 ?auto_78447 ) ) ( not ( = ?auto_78450 ?auto_78448 ) ) ( not ( = ?auto_78452 ?auto_78444 ) ) ( not ( = ?auto_78452 ?auto_78447 ) ) ( not ( = ?auto_78452 ?auto_78448 ) ) ( not ( = ?auto_78452 ?auto_78450 ) ) ( ON_BOARD ?auto_78455 ?auto_78459 ) ( SUPPORTS ?auto_78455 ?auto_78453 ) ( not ( = ?auto_78452 ?auto_78461 ) ) ( CALIBRATION_TARGET ?auto_78455 ?auto_78461 ) ( not ( = ?auto_78461 ?auto_78444 ) ) ( ON_BOARD ?auto_78454 ?auto_78459 ) ( not ( = ?auto_78455 ?auto_78454 ) ) ( SUPPORTS ?auto_78454 ?auto_78445 ) ( CALIBRATION_TARGET ?auto_78454 ?auto_78461 ) ( not ( = ?auto_78461 ?auto_78447 ) ) ( ON_BOARD ?auto_78460 ?auto_78459 ) ( not ( = ?auto_78454 ?auto_78460 ) ) ( SUPPORTS ?auto_78460 ?auto_78446 ) ( CALIBRATION_TARGET ?auto_78460 ?auto_78461 ) ( not ( = ?auto_78461 ?auto_78448 ) ) ( ON_BOARD ?auto_78456 ?auto_78459 ) ( not ( = ?auto_78460 ?auto_78456 ) ) ( SUPPORTS ?auto_78456 ?auto_78449 ) ( CALIBRATION_TARGET ?auto_78456 ?auto_78461 ) ( not ( = ?auto_78461 ?auto_78450 ) ) ( ON_BOARD ?auto_78457 ?auto_78459 ) ( not ( = ?auto_78456 ?auto_78457 ) ) ( SUPPORTS ?auto_78457 ?auto_78451 ) ( CALIBRATION_TARGET ?auto_78457 ?auto_78461 ) ( POWER_AVAIL ?auto_78459 ) ( POINTING ?auto_78459 ?auto_78458 ) ( not ( = ?auto_78461 ?auto_78458 ) ) ( not ( = ?auto_78450 ?auto_78458 ) ) ( not ( = ?auto_78451 ?auto_78449 ) ) ( not ( = ?auto_78448 ?auto_78458 ) ) ( not ( = ?auto_78451 ?auto_78446 ) ) ( not ( = ?auto_78449 ?auto_78446 ) ) ( not ( = ?auto_78447 ?auto_78458 ) ) ( not ( = ?auto_78460 ?auto_78457 ) ) ( not ( = ?auto_78451 ?auto_78445 ) ) ( not ( = ?auto_78449 ?auto_78445 ) ) ( not ( = ?auto_78446 ?auto_78445 ) ) ( not ( = ?auto_78444 ?auto_78458 ) ) ( not ( = ?auto_78454 ?auto_78456 ) ) ( not ( = ?auto_78454 ?auto_78457 ) ) ( not ( = ?auto_78451 ?auto_78453 ) ) ( not ( = ?auto_78449 ?auto_78453 ) ) ( not ( = ?auto_78446 ?auto_78453 ) ) ( not ( = ?auto_78445 ?auto_78453 ) ) ( not ( = ?auto_78452 ?auto_78458 ) ) ( not ( = ?auto_78455 ?auto_78460 ) ) ( not ( = ?auto_78455 ?auto_78456 ) ) ( not ( = ?auto_78455 ?auto_78457 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_78450 ?auto_78451 ?auto_78448 ?auto_78449 ?auto_78447 ?auto_78446 ?auto_78452 ?auto_78453 ?auto_78444 ?auto_78445 )
      ( GET-5IMAGE-VERIFY ?auto_78444 ?auto_78445 ?auto_78447 ?auto_78446 ?auto_78448 ?auto_78449 ?auto_78450 ?auto_78451 ?auto_78452 ?auto_78453 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_78522 - DIRECTION
      ?auto_78523 - MODE
      ?auto_78525 - DIRECTION
      ?auto_78524 - MODE
      ?auto_78526 - DIRECTION
      ?auto_78527 - MODE
      ?auto_78528 - DIRECTION
      ?auto_78529 - MODE
      ?auto_78530 - DIRECTION
      ?auto_78531 - MODE
    )
    :vars
    (
      ?auto_78533 - INSTRUMENT
      ?auto_78537 - SATELLITE
      ?auto_78539 - DIRECTION
      ?auto_78532 - INSTRUMENT
      ?auto_78538 - INSTRUMENT
      ?auto_78534 - INSTRUMENT
      ?auto_78535 - INSTRUMENT
      ?auto_78536 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_78525 ?auto_78522 ) ) ( not ( = ?auto_78526 ?auto_78522 ) ) ( not ( = ?auto_78526 ?auto_78525 ) ) ( not ( = ?auto_78528 ?auto_78522 ) ) ( not ( = ?auto_78528 ?auto_78525 ) ) ( not ( = ?auto_78528 ?auto_78526 ) ) ( not ( = ?auto_78530 ?auto_78522 ) ) ( not ( = ?auto_78530 ?auto_78525 ) ) ( not ( = ?auto_78530 ?auto_78526 ) ) ( not ( = ?auto_78530 ?auto_78528 ) ) ( ON_BOARD ?auto_78533 ?auto_78537 ) ( SUPPORTS ?auto_78533 ?auto_78529 ) ( not ( = ?auto_78528 ?auto_78539 ) ) ( CALIBRATION_TARGET ?auto_78533 ?auto_78539 ) ( not ( = ?auto_78539 ?auto_78522 ) ) ( ON_BOARD ?auto_78532 ?auto_78537 ) ( not ( = ?auto_78533 ?auto_78532 ) ) ( SUPPORTS ?auto_78532 ?auto_78523 ) ( CALIBRATION_TARGET ?auto_78532 ?auto_78539 ) ( not ( = ?auto_78539 ?auto_78525 ) ) ( ON_BOARD ?auto_78538 ?auto_78537 ) ( not ( = ?auto_78532 ?auto_78538 ) ) ( SUPPORTS ?auto_78538 ?auto_78524 ) ( CALIBRATION_TARGET ?auto_78538 ?auto_78539 ) ( not ( = ?auto_78539 ?auto_78526 ) ) ( ON_BOARD ?auto_78534 ?auto_78537 ) ( not ( = ?auto_78538 ?auto_78534 ) ) ( SUPPORTS ?auto_78534 ?auto_78527 ) ( CALIBRATION_TARGET ?auto_78534 ?auto_78539 ) ( not ( = ?auto_78539 ?auto_78530 ) ) ( ON_BOARD ?auto_78535 ?auto_78537 ) ( not ( = ?auto_78534 ?auto_78535 ) ) ( SUPPORTS ?auto_78535 ?auto_78531 ) ( CALIBRATION_TARGET ?auto_78535 ?auto_78539 ) ( POWER_AVAIL ?auto_78537 ) ( POINTING ?auto_78537 ?auto_78536 ) ( not ( = ?auto_78539 ?auto_78536 ) ) ( not ( = ?auto_78530 ?auto_78536 ) ) ( not ( = ?auto_78531 ?auto_78527 ) ) ( not ( = ?auto_78526 ?auto_78536 ) ) ( not ( = ?auto_78531 ?auto_78524 ) ) ( not ( = ?auto_78527 ?auto_78524 ) ) ( not ( = ?auto_78525 ?auto_78536 ) ) ( not ( = ?auto_78538 ?auto_78535 ) ) ( not ( = ?auto_78531 ?auto_78523 ) ) ( not ( = ?auto_78527 ?auto_78523 ) ) ( not ( = ?auto_78524 ?auto_78523 ) ) ( not ( = ?auto_78522 ?auto_78536 ) ) ( not ( = ?auto_78532 ?auto_78534 ) ) ( not ( = ?auto_78532 ?auto_78535 ) ) ( not ( = ?auto_78531 ?auto_78529 ) ) ( not ( = ?auto_78527 ?auto_78529 ) ) ( not ( = ?auto_78524 ?auto_78529 ) ) ( not ( = ?auto_78523 ?auto_78529 ) ) ( not ( = ?auto_78528 ?auto_78536 ) ) ( not ( = ?auto_78533 ?auto_78538 ) ) ( not ( = ?auto_78533 ?auto_78534 ) ) ( not ( = ?auto_78533 ?auto_78535 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_78530 ?auto_78531 ?auto_78526 ?auto_78527 ?auto_78525 ?auto_78524 ?auto_78528 ?auto_78529 ?auto_78522 ?auto_78523 )
      ( GET-5IMAGE-VERIFY ?auto_78522 ?auto_78523 ?auto_78525 ?auto_78524 ?auto_78526 ?auto_78527 ?auto_78528 ?auto_78529 ?auto_78530 ?auto_78531 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_79020 - DIRECTION
      ?auto_79021 - MODE
      ?auto_79023 - DIRECTION
      ?auto_79022 - MODE
      ?auto_79024 - DIRECTION
      ?auto_79025 - MODE
      ?auto_79026 - DIRECTION
      ?auto_79027 - MODE
      ?auto_79028 - DIRECTION
      ?auto_79029 - MODE
    )
    :vars
    (
      ?auto_79031 - INSTRUMENT
      ?auto_79035 - SATELLITE
      ?auto_79037 - DIRECTION
      ?auto_79030 - INSTRUMENT
      ?auto_79036 - INSTRUMENT
      ?auto_79032 - INSTRUMENT
      ?auto_79033 - INSTRUMENT
      ?auto_79034 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_79023 ?auto_79020 ) ) ( not ( = ?auto_79024 ?auto_79020 ) ) ( not ( = ?auto_79024 ?auto_79023 ) ) ( not ( = ?auto_79026 ?auto_79020 ) ) ( not ( = ?auto_79026 ?auto_79023 ) ) ( not ( = ?auto_79026 ?auto_79024 ) ) ( not ( = ?auto_79028 ?auto_79020 ) ) ( not ( = ?auto_79028 ?auto_79023 ) ) ( not ( = ?auto_79028 ?auto_79024 ) ) ( not ( = ?auto_79028 ?auto_79026 ) ) ( ON_BOARD ?auto_79031 ?auto_79035 ) ( SUPPORTS ?auto_79031 ?auto_79025 ) ( not ( = ?auto_79024 ?auto_79037 ) ) ( CALIBRATION_TARGET ?auto_79031 ?auto_79037 ) ( not ( = ?auto_79037 ?auto_79020 ) ) ( ON_BOARD ?auto_79030 ?auto_79035 ) ( not ( = ?auto_79031 ?auto_79030 ) ) ( SUPPORTS ?auto_79030 ?auto_79021 ) ( CALIBRATION_TARGET ?auto_79030 ?auto_79037 ) ( not ( = ?auto_79037 ?auto_79023 ) ) ( ON_BOARD ?auto_79036 ?auto_79035 ) ( not ( = ?auto_79030 ?auto_79036 ) ) ( SUPPORTS ?auto_79036 ?auto_79022 ) ( CALIBRATION_TARGET ?auto_79036 ?auto_79037 ) ( not ( = ?auto_79037 ?auto_79028 ) ) ( ON_BOARD ?auto_79032 ?auto_79035 ) ( not ( = ?auto_79036 ?auto_79032 ) ) ( SUPPORTS ?auto_79032 ?auto_79029 ) ( CALIBRATION_TARGET ?auto_79032 ?auto_79037 ) ( not ( = ?auto_79037 ?auto_79026 ) ) ( ON_BOARD ?auto_79033 ?auto_79035 ) ( not ( = ?auto_79032 ?auto_79033 ) ) ( SUPPORTS ?auto_79033 ?auto_79027 ) ( CALIBRATION_TARGET ?auto_79033 ?auto_79037 ) ( POWER_AVAIL ?auto_79035 ) ( POINTING ?auto_79035 ?auto_79034 ) ( not ( = ?auto_79037 ?auto_79034 ) ) ( not ( = ?auto_79026 ?auto_79034 ) ) ( not ( = ?auto_79027 ?auto_79029 ) ) ( not ( = ?auto_79028 ?auto_79034 ) ) ( not ( = ?auto_79027 ?auto_79022 ) ) ( not ( = ?auto_79029 ?auto_79022 ) ) ( not ( = ?auto_79023 ?auto_79034 ) ) ( not ( = ?auto_79036 ?auto_79033 ) ) ( not ( = ?auto_79027 ?auto_79021 ) ) ( not ( = ?auto_79029 ?auto_79021 ) ) ( not ( = ?auto_79022 ?auto_79021 ) ) ( not ( = ?auto_79020 ?auto_79034 ) ) ( not ( = ?auto_79030 ?auto_79032 ) ) ( not ( = ?auto_79030 ?auto_79033 ) ) ( not ( = ?auto_79027 ?auto_79025 ) ) ( not ( = ?auto_79029 ?auto_79025 ) ) ( not ( = ?auto_79022 ?auto_79025 ) ) ( not ( = ?auto_79021 ?auto_79025 ) ) ( not ( = ?auto_79024 ?auto_79034 ) ) ( not ( = ?auto_79031 ?auto_79036 ) ) ( not ( = ?auto_79031 ?auto_79032 ) ) ( not ( = ?auto_79031 ?auto_79033 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_79026 ?auto_79027 ?auto_79028 ?auto_79029 ?auto_79023 ?auto_79022 ?auto_79024 ?auto_79025 ?auto_79020 ?auto_79021 )
      ( GET-5IMAGE-VERIFY ?auto_79020 ?auto_79021 ?auto_79023 ?auto_79022 ?auto_79024 ?auto_79025 ?auto_79026 ?auto_79027 ?auto_79028 ?auto_79029 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_79098 - DIRECTION
      ?auto_79099 - MODE
      ?auto_79101 - DIRECTION
      ?auto_79100 - MODE
      ?auto_79102 - DIRECTION
      ?auto_79103 - MODE
      ?auto_79104 - DIRECTION
      ?auto_79105 - MODE
      ?auto_79106 - DIRECTION
      ?auto_79107 - MODE
    )
    :vars
    (
      ?auto_79109 - INSTRUMENT
      ?auto_79113 - SATELLITE
      ?auto_79115 - DIRECTION
      ?auto_79108 - INSTRUMENT
      ?auto_79114 - INSTRUMENT
      ?auto_79110 - INSTRUMENT
      ?auto_79111 - INSTRUMENT
      ?auto_79112 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_79101 ?auto_79098 ) ) ( not ( = ?auto_79102 ?auto_79098 ) ) ( not ( = ?auto_79102 ?auto_79101 ) ) ( not ( = ?auto_79104 ?auto_79098 ) ) ( not ( = ?auto_79104 ?auto_79101 ) ) ( not ( = ?auto_79104 ?auto_79102 ) ) ( not ( = ?auto_79106 ?auto_79098 ) ) ( not ( = ?auto_79106 ?auto_79101 ) ) ( not ( = ?auto_79106 ?auto_79102 ) ) ( not ( = ?auto_79106 ?auto_79104 ) ) ( ON_BOARD ?auto_79109 ?auto_79113 ) ( SUPPORTS ?auto_79109 ?auto_79103 ) ( not ( = ?auto_79102 ?auto_79115 ) ) ( CALIBRATION_TARGET ?auto_79109 ?auto_79115 ) ( not ( = ?auto_79115 ?auto_79098 ) ) ( ON_BOARD ?auto_79108 ?auto_79113 ) ( not ( = ?auto_79109 ?auto_79108 ) ) ( SUPPORTS ?auto_79108 ?auto_79099 ) ( CALIBRATION_TARGET ?auto_79108 ?auto_79115 ) ( not ( = ?auto_79115 ?auto_79101 ) ) ( ON_BOARD ?auto_79114 ?auto_79113 ) ( not ( = ?auto_79108 ?auto_79114 ) ) ( SUPPORTS ?auto_79114 ?auto_79100 ) ( CALIBRATION_TARGET ?auto_79114 ?auto_79115 ) ( not ( = ?auto_79115 ?auto_79104 ) ) ( ON_BOARD ?auto_79110 ?auto_79113 ) ( not ( = ?auto_79114 ?auto_79110 ) ) ( SUPPORTS ?auto_79110 ?auto_79105 ) ( CALIBRATION_TARGET ?auto_79110 ?auto_79115 ) ( not ( = ?auto_79115 ?auto_79106 ) ) ( ON_BOARD ?auto_79111 ?auto_79113 ) ( not ( = ?auto_79110 ?auto_79111 ) ) ( SUPPORTS ?auto_79111 ?auto_79107 ) ( CALIBRATION_TARGET ?auto_79111 ?auto_79115 ) ( POWER_AVAIL ?auto_79113 ) ( POINTING ?auto_79113 ?auto_79112 ) ( not ( = ?auto_79115 ?auto_79112 ) ) ( not ( = ?auto_79106 ?auto_79112 ) ) ( not ( = ?auto_79107 ?auto_79105 ) ) ( not ( = ?auto_79104 ?auto_79112 ) ) ( not ( = ?auto_79107 ?auto_79100 ) ) ( not ( = ?auto_79105 ?auto_79100 ) ) ( not ( = ?auto_79101 ?auto_79112 ) ) ( not ( = ?auto_79114 ?auto_79111 ) ) ( not ( = ?auto_79107 ?auto_79099 ) ) ( not ( = ?auto_79105 ?auto_79099 ) ) ( not ( = ?auto_79100 ?auto_79099 ) ) ( not ( = ?auto_79098 ?auto_79112 ) ) ( not ( = ?auto_79108 ?auto_79110 ) ) ( not ( = ?auto_79108 ?auto_79111 ) ) ( not ( = ?auto_79107 ?auto_79103 ) ) ( not ( = ?auto_79105 ?auto_79103 ) ) ( not ( = ?auto_79100 ?auto_79103 ) ) ( not ( = ?auto_79099 ?auto_79103 ) ) ( not ( = ?auto_79102 ?auto_79112 ) ) ( not ( = ?auto_79109 ?auto_79114 ) ) ( not ( = ?auto_79109 ?auto_79110 ) ) ( not ( = ?auto_79109 ?auto_79111 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_79106 ?auto_79107 ?auto_79104 ?auto_79105 ?auto_79101 ?auto_79100 ?auto_79102 ?auto_79103 ?auto_79098 ?auto_79099 )
      ( GET-5IMAGE-VERIFY ?auto_79098 ?auto_79099 ?auto_79101 ?auto_79100 ?auto_79102 ?auto_79103 ?auto_79104 ?auto_79105 ?auto_79106 ?auto_79107 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_80980 - DIRECTION
      ?auto_80981 - MODE
      ?auto_80983 - DIRECTION
      ?auto_80982 - MODE
      ?auto_80984 - DIRECTION
      ?auto_80985 - MODE
      ?auto_80986 - DIRECTION
      ?auto_80987 - MODE
      ?auto_80988 - DIRECTION
      ?auto_80989 - MODE
    )
    :vars
    (
      ?auto_80991 - INSTRUMENT
      ?auto_80995 - SATELLITE
      ?auto_80997 - DIRECTION
      ?auto_80990 - INSTRUMENT
      ?auto_80996 - INSTRUMENT
      ?auto_80992 - INSTRUMENT
      ?auto_80993 - INSTRUMENT
      ?auto_80994 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_80983 ?auto_80980 ) ) ( not ( = ?auto_80984 ?auto_80980 ) ) ( not ( = ?auto_80984 ?auto_80983 ) ) ( not ( = ?auto_80986 ?auto_80980 ) ) ( not ( = ?auto_80986 ?auto_80983 ) ) ( not ( = ?auto_80986 ?auto_80984 ) ) ( not ( = ?auto_80988 ?auto_80980 ) ) ( not ( = ?auto_80988 ?auto_80983 ) ) ( not ( = ?auto_80988 ?auto_80984 ) ) ( not ( = ?auto_80988 ?auto_80986 ) ) ( ON_BOARD ?auto_80991 ?auto_80995 ) ( SUPPORTS ?auto_80991 ?auto_80982 ) ( not ( = ?auto_80983 ?auto_80997 ) ) ( CALIBRATION_TARGET ?auto_80991 ?auto_80997 ) ( not ( = ?auto_80997 ?auto_80980 ) ) ( ON_BOARD ?auto_80990 ?auto_80995 ) ( not ( = ?auto_80991 ?auto_80990 ) ) ( SUPPORTS ?auto_80990 ?auto_80981 ) ( CALIBRATION_TARGET ?auto_80990 ?auto_80997 ) ( not ( = ?auto_80997 ?auto_80988 ) ) ( ON_BOARD ?auto_80996 ?auto_80995 ) ( not ( = ?auto_80990 ?auto_80996 ) ) ( SUPPORTS ?auto_80996 ?auto_80989 ) ( CALIBRATION_TARGET ?auto_80996 ?auto_80997 ) ( not ( = ?auto_80997 ?auto_80986 ) ) ( ON_BOARD ?auto_80992 ?auto_80995 ) ( not ( = ?auto_80996 ?auto_80992 ) ) ( SUPPORTS ?auto_80992 ?auto_80987 ) ( CALIBRATION_TARGET ?auto_80992 ?auto_80997 ) ( not ( = ?auto_80997 ?auto_80984 ) ) ( ON_BOARD ?auto_80993 ?auto_80995 ) ( not ( = ?auto_80992 ?auto_80993 ) ) ( SUPPORTS ?auto_80993 ?auto_80985 ) ( CALIBRATION_TARGET ?auto_80993 ?auto_80997 ) ( POWER_AVAIL ?auto_80995 ) ( POINTING ?auto_80995 ?auto_80994 ) ( not ( = ?auto_80997 ?auto_80994 ) ) ( not ( = ?auto_80984 ?auto_80994 ) ) ( not ( = ?auto_80985 ?auto_80987 ) ) ( not ( = ?auto_80986 ?auto_80994 ) ) ( not ( = ?auto_80985 ?auto_80989 ) ) ( not ( = ?auto_80987 ?auto_80989 ) ) ( not ( = ?auto_80988 ?auto_80994 ) ) ( not ( = ?auto_80996 ?auto_80993 ) ) ( not ( = ?auto_80985 ?auto_80981 ) ) ( not ( = ?auto_80987 ?auto_80981 ) ) ( not ( = ?auto_80989 ?auto_80981 ) ) ( not ( = ?auto_80980 ?auto_80994 ) ) ( not ( = ?auto_80990 ?auto_80992 ) ) ( not ( = ?auto_80990 ?auto_80993 ) ) ( not ( = ?auto_80985 ?auto_80982 ) ) ( not ( = ?auto_80987 ?auto_80982 ) ) ( not ( = ?auto_80989 ?auto_80982 ) ) ( not ( = ?auto_80981 ?auto_80982 ) ) ( not ( = ?auto_80983 ?auto_80994 ) ) ( not ( = ?auto_80991 ?auto_80996 ) ) ( not ( = ?auto_80991 ?auto_80992 ) ) ( not ( = ?auto_80991 ?auto_80993 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_80984 ?auto_80985 ?auto_80986 ?auto_80987 ?auto_80988 ?auto_80989 ?auto_80983 ?auto_80982 ?auto_80980 ?auto_80981 )
      ( GET-5IMAGE-VERIFY ?auto_80980 ?auto_80981 ?auto_80983 ?auto_80982 ?auto_80984 ?auto_80985 ?auto_80986 ?auto_80987 ?auto_80988 ?auto_80989 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_81058 - DIRECTION
      ?auto_81059 - MODE
      ?auto_81061 - DIRECTION
      ?auto_81060 - MODE
      ?auto_81062 - DIRECTION
      ?auto_81063 - MODE
      ?auto_81064 - DIRECTION
      ?auto_81065 - MODE
      ?auto_81066 - DIRECTION
      ?auto_81067 - MODE
    )
    :vars
    (
      ?auto_81069 - INSTRUMENT
      ?auto_81073 - SATELLITE
      ?auto_81075 - DIRECTION
      ?auto_81068 - INSTRUMENT
      ?auto_81074 - INSTRUMENT
      ?auto_81070 - INSTRUMENT
      ?auto_81071 - INSTRUMENT
      ?auto_81072 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_81061 ?auto_81058 ) ) ( not ( = ?auto_81062 ?auto_81058 ) ) ( not ( = ?auto_81062 ?auto_81061 ) ) ( not ( = ?auto_81064 ?auto_81058 ) ) ( not ( = ?auto_81064 ?auto_81061 ) ) ( not ( = ?auto_81064 ?auto_81062 ) ) ( not ( = ?auto_81066 ?auto_81058 ) ) ( not ( = ?auto_81066 ?auto_81061 ) ) ( not ( = ?auto_81066 ?auto_81062 ) ) ( not ( = ?auto_81066 ?auto_81064 ) ) ( ON_BOARD ?auto_81069 ?auto_81073 ) ( SUPPORTS ?auto_81069 ?auto_81060 ) ( not ( = ?auto_81061 ?auto_81075 ) ) ( CALIBRATION_TARGET ?auto_81069 ?auto_81075 ) ( not ( = ?auto_81075 ?auto_81058 ) ) ( ON_BOARD ?auto_81068 ?auto_81073 ) ( not ( = ?auto_81069 ?auto_81068 ) ) ( SUPPORTS ?auto_81068 ?auto_81059 ) ( CALIBRATION_TARGET ?auto_81068 ?auto_81075 ) ( not ( = ?auto_81075 ?auto_81064 ) ) ( ON_BOARD ?auto_81074 ?auto_81073 ) ( not ( = ?auto_81068 ?auto_81074 ) ) ( SUPPORTS ?auto_81074 ?auto_81065 ) ( CALIBRATION_TARGET ?auto_81074 ?auto_81075 ) ( not ( = ?auto_81075 ?auto_81066 ) ) ( ON_BOARD ?auto_81070 ?auto_81073 ) ( not ( = ?auto_81074 ?auto_81070 ) ) ( SUPPORTS ?auto_81070 ?auto_81067 ) ( CALIBRATION_TARGET ?auto_81070 ?auto_81075 ) ( not ( = ?auto_81075 ?auto_81062 ) ) ( ON_BOARD ?auto_81071 ?auto_81073 ) ( not ( = ?auto_81070 ?auto_81071 ) ) ( SUPPORTS ?auto_81071 ?auto_81063 ) ( CALIBRATION_TARGET ?auto_81071 ?auto_81075 ) ( POWER_AVAIL ?auto_81073 ) ( POINTING ?auto_81073 ?auto_81072 ) ( not ( = ?auto_81075 ?auto_81072 ) ) ( not ( = ?auto_81062 ?auto_81072 ) ) ( not ( = ?auto_81063 ?auto_81067 ) ) ( not ( = ?auto_81066 ?auto_81072 ) ) ( not ( = ?auto_81063 ?auto_81065 ) ) ( not ( = ?auto_81067 ?auto_81065 ) ) ( not ( = ?auto_81064 ?auto_81072 ) ) ( not ( = ?auto_81074 ?auto_81071 ) ) ( not ( = ?auto_81063 ?auto_81059 ) ) ( not ( = ?auto_81067 ?auto_81059 ) ) ( not ( = ?auto_81065 ?auto_81059 ) ) ( not ( = ?auto_81058 ?auto_81072 ) ) ( not ( = ?auto_81068 ?auto_81070 ) ) ( not ( = ?auto_81068 ?auto_81071 ) ) ( not ( = ?auto_81063 ?auto_81060 ) ) ( not ( = ?auto_81067 ?auto_81060 ) ) ( not ( = ?auto_81065 ?auto_81060 ) ) ( not ( = ?auto_81059 ?auto_81060 ) ) ( not ( = ?auto_81061 ?auto_81072 ) ) ( not ( = ?auto_81069 ?auto_81074 ) ) ( not ( = ?auto_81069 ?auto_81070 ) ) ( not ( = ?auto_81069 ?auto_81071 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_81062 ?auto_81063 ?auto_81066 ?auto_81067 ?auto_81064 ?auto_81065 ?auto_81061 ?auto_81060 ?auto_81058 ?auto_81059 )
      ( GET-5IMAGE-VERIFY ?auto_81058 ?auto_81059 ?auto_81061 ?auto_81060 ?auto_81062 ?auto_81063 ?auto_81064 ?auto_81065 ?auto_81066 ?auto_81067 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_81388 - DIRECTION
      ?auto_81389 - MODE
      ?auto_81391 - DIRECTION
      ?auto_81390 - MODE
      ?auto_81392 - DIRECTION
      ?auto_81393 - MODE
      ?auto_81394 - DIRECTION
      ?auto_81395 - MODE
      ?auto_81396 - DIRECTION
      ?auto_81397 - MODE
    )
    :vars
    (
      ?auto_81399 - INSTRUMENT
      ?auto_81403 - SATELLITE
      ?auto_81405 - DIRECTION
      ?auto_81398 - INSTRUMENT
      ?auto_81404 - INSTRUMENT
      ?auto_81400 - INSTRUMENT
      ?auto_81401 - INSTRUMENT
      ?auto_81402 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_81391 ?auto_81388 ) ) ( not ( = ?auto_81392 ?auto_81388 ) ) ( not ( = ?auto_81392 ?auto_81391 ) ) ( not ( = ?auto_81394 ?auto_81388 ) ) ( not ( = ?auto_81394 ?auto_81391 ) ) ( not ( = ?auto_81394 ?auto_81392 ) ) ( not ( = ?auto_81396 ?auto_81388 ) ) ( not ( = ?auto_81396 ?auto_81391 ) ) ( not ( = ?auto_81396 ?auto_81392 ) ) ( not ( = ?auto_81396 ?auto_81394 ) ) ( ON_BOARD ?auto_81399 ?auto_81403 ) ( SUPPORTS ?auto_81399 ?auto_81390 ) ( not ( = ?auto_81391 ?auto_81405 ) ) ( CALIBRATION_TARGET ?auto_81399 ?auto_81405 ) ( not ( = ?auto_81405 ?auto_81388 ) ) ( ON_BOARD ?auto_81398 ?auto_81403 ) ( not ( = ?auto_81399 ?auto_81398 ) ) ( SUPPORTS ?auto_81398 ?auto_81389 ) ( CALIBRATION_TARGET ?auto_81398 ?auto_81405 ) ( not ( = ?auto_81405 ?auto_81396 ) ) ( ON_BOARD ?auto_81404 ?auto_81403 ) ( not ( = ?auto_81398 ?auto_81404 ) ) ( SUPPORTS ?auto_81404 ?auto_81397 ) ( CALIBRATION_TARGET ?auto_81404 ?auto_81405 ) ( not ( = ?auto_81405 ?auto_81392 ) ) ( ON_BOARD ?auto_81400 ?auto_81403 ) ( not ( = ?auto_81404 ?auto_81400 ) ) ( SUPPORTS ?auto_81400 ?auto_81393 ) ( CALIBRATION_TARGET ?auto_81400 ?auto_81405 ) ( not ( = ?auto_81405 ?auto_81394 ) ) ( ON_BOARD ?auto_81401 ?auto_81403 ) ( not ( = ?auto_81400 ?auto_81401 ) ) ( SUPPORTS ?auto_81401 ?auto_81395 ) ( CALIBRATION_TARGET ?auto_81401 ?auto_81405 ) ( POWER_AVAIL ?auto_81403 ) ( POINTING ?auto_81403 ?auto_81402 ) ( not ( = ?auto_81405 ?auto_81402 ) ) ( not ( = ?auto_81394 ?auto_81402 ) ) ( not ( = ?auto_81395 ?auto_81393 ) ) ( not ( = ?auto_81392 ?auto_81402 ) ) ( not ( = ?auto_81395 ?auto_81397 ) ) ( not ( = ?auto_81393 ?auto_81397 ) ) ( not ( = ?auto_81396 ?auto_81402 ) ) ( not ( = ?auto_81404 ?auto_81401 ) ) ( not ( = ?auto_81395 ?auto_81389 ) ) ( not ( = ?auto_81393 ?auto_81389 ) ) ( not ( = ?auto_81397 ?auto_81389 ) ) ( not ( = ?auto_81388 ?auto_81402 ) ) ( not ( = ?auto_81398 ?auto_81400 ) ) ( not ( = ?auto_81398 ?auto_81401 ) ) ( not ( = ?auto_81395 ?auto_81390 ) ) ( not ( = ?auto_81393 ?auto_81390 ) ) ( not ( = ?auto_81397 ?auto_81390 ) ) ( not ( = ?auto_81389 ?auto_81390 ) ) ( not ( = ?auto_81391 ?auto_81402 ) ) ( not ( = ?auto_81399 ?auto_81404 ) ) ( not ( = ?auto_81399 ?auto_81400 ) ) ( not ( = ?auto_81399 ?auto_81401 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_81394 ?auto_81395 ?auto_81392 ?auto_81393 ?auto_81396 ?auto_81397 ?auto_81391 ?auto_81390 ?auto_81388 ?auto_81389 )
      ( GET-5IMAGE-VERIFY ?auto_81388 ?auto_81389 ?auto_81391 ?auto_81390 ?auto_81392 ?auto_81393 ?auto_81394 ?auto_81395 ?auto_81396 ?auto_81397 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_81552 - DIRECTION
      ?auto_81553 - MODE
      ?auto_81555 - DIRECTION
      ?auto_81554 - MODE
      ?auto_81556 - DIRECTION
      ?auto_81557 - MODE
      ?auto_81558 - DIRECTION
      ?auto_81559 - MODE
      ?auto_81560 - DIRECTION
      ?auto_81561 - MODE
    )
    :vars
    (
      ?auto_81563 - INSTRUMENT
      ?auto_81567 - SATELLITE
      ?auto_81569 - DIRECTION
      ?auto_81562 - INSTRUMENT
      ?auto_81568 - INSTRUMENT
      ?auto_81564 - INSTRUMENT
      ?auto_81565 - INSTRUMENT
      ?auto_81566 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_81555 ?auto_81552 ) ) ( not ( = ?auto_81556 ?auto_81552 ) ) ( not ( = ?auto_81556 ?auto_81555 ) ) ( not ( = ?auto_81558 ?auto_81552 ) ) ( not ( = ?auto_81558 ?auto_81555 ) ) ( not ( = ?auto_81558 ?auto_81556 ) ) ( not ( = ?auto_81560 ?auto_81552 ) ) ( not ( = ?auto_81560 ?auto_81555 ) ) ( not ( = ?auto_81560 ?auto_81556 ) ) ( not ( = ?auto_81560 ?auto_81558 ) ) ( ON_BOARD ?auto_81563 ?auto_81567 ) ( SUPPORTS ?auto_81563 ?auto_81554 ) ( not ( = ?auto_81555 ?auto_81569 ) ) ( CALIBRATION_TARGET ?auto_81563 ?auto_81569 ) ( not ( = ?auto_81569 ?auto_81552 ) ) ( ON_BOARD ?auto_81562 ?auto_81567 ) ( not ( = ?auto_81563 ?auto_81562 ) ) ( SUPPORTS ?auto_81562 ?auto_81553 ) ( CALIBRATION_TARGET ?auto_81562 ?auto_81569 ) ( not ( = ?auto_81569 ?auto_81558 ) ) ( ON_BOARD ?auto_81568 ?auto_81567 ) ( not ( = ?auto_81562 ?auto_81568 ) ) ( SUPPORTS ?auto_81568 ?auto_81559 ) ( CALIBRATION_TARGET ?auto_81568 ?auto_81569 ) ( not ( = ?auto_81569 ?auto_81556 ) ) ( ON_BOARD ?auto_81564 ?auto_81567 ) ( not ( = ?auto_81568 ?auto_81564 ) ) ( SUPPORTS ?auto_81564 ?auto_81557 ) ( CALIBRATION_TARGET ?auto_81564 ?auto_81569 ) ( not ( = ?auto_81569 ?auto_81560 ) ) ( ON_BOARD ?auto_81565 ?auto_81567 ) ( not ( = ?auto_81564 ?auto_81565 ) ) ( SUPPORTS ?auto_81565 ?auto_81561 ) ( CALIBRATION_TARGET ?auto_81565 ?auto_81569 ) ( POWER_AVAIL ?auto_81567 ) ( POINTING ?auto_81567 ?auto_81566 ) ( not ( = ?auto_81569 ?auto_81566 ) ) ( not ( = ?auto_81560 ?auto_81566 ) ) ( not ( = ?auto_81561 ?auto_81557 ) ) ( not ( = ?auto_81556 ?auto_81566 ) ) ( not ( = ?auto_81561 ?auto_81559 ) ) ( not ( = ?auto_81557 ?auto_81559 ) ) ( not ( = ?auto_81558 ?auto_81566 ) ) ( not ( = ?auto_81568 ?auto_81565 ) ) ( not ( = ?auto_81561 ?auto_81553 ) ) ( not ( = ?auto_81557 ?auto_81553 ) ) ( not ( = ?auto_81559 ?auto_81553 ) ) ( not ( = ?auto_81552 ?auto_81566 ) ) ( not ( = ?auto_81562 ?auto_81564 ) ) ( not ( = ?auto_81562 ?auto_81565 ) ) ( not ( = ?auto_81561 ?auto_81554 ) ) ( not ( = ?auto_81557 ?auto_81554 ) ) ( not ( = ?auto_81559 ?auto_81554 ) ) ( not ( = ?auto_81553 ?auto_81554 ) ) ( not ( = ?auto_81555 ?auto_81566 ) ) ( not ( = ?auto_81563 ?auto_81568 ) ) ( not ( = ?auto_81563 ?auto_81564 ) ) ( not ( = ?auto_81563 ?auto_81565 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_81560 ?auto_81561 ?auto_81556 ?auto_81557 ?auto_81558 ?auto_81559 ?auto_81555 ?auto_81554 ?auto_81552 ?auto_81553 )
      ( GET-5IMAGE-VERIFY ?auto_81552 ?auto_81553 ?auto_81555 ?auto_81554 ?auto_81556 ?auto_81557 ?auto_81558 ?auto_81559 ?auto_81560 ?auto_81561 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_81882 - DIRECTION
      ?auto_81883 - MODE
      ?auto_81885 - DIRECTION
      ?auto_81884 - MODE
      ?auto_81886 - DIRECTION
      ?auto_81887 - MODE
      ?auto_81888 - DIRECTION
      ?auto_81889 - MODE
      ?auto_81890 - DIRECTION
      ?auto_81891 - MODE
    )
    :vars
    (
      ?auto_81893 - INSTRUMENT
      ?auto_81897 - SATELLITE
      ?auto_81899 - DIRECTION
      ?auto_81892 - INSTRUMENT
      ?auto_81898 - INSTRUMENT
      ?auto_81894 - INSTRUMENT
      ?auto_81895 - INSTRUMENT
      ?auto_81896 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_81885 ?auto_81882 ) ) ( not ( = ?auto_81886 ?auto_81882 ) ) ( not ( = ?auto_81886 ?auto_81885 ) ) ( not ( = ?auto_81888 ?auto_81882 ) ) ( not ( = ?auto_81888 ?auto_81885 ) ) ( not ( = ?auto_81888 ?auto_81886 ) ) ( not ( = ?auto_81890 ?auto_81882 ) ) ( not ( = ?auto_81890 ?auto_81885 ) ) ( not ( = ?auto_81890 ?auto_81886 ) ) ( not ( = ?auto_81890 ?auto_81888 ) ) ( ON_BOARD ?auto_81893 ?auto_81897 ) ( SUPPORTS ?auto_81893 ?auto_81884 ) ( not ( = ?auto_81885 ?auto_81899 ) ) ( CALIBRATION_TARGET ?auto_81893 ?auto_81899 ) ( not ( = ?auto_81899 ?auto_81882 ) ) ( ON_BOARD ?auto_81892 ?auto_81897 ) ( not ( = ?auto_81893 ?auto_81892 ) ) ( SUPPORTS ?auto_81892 ?auto_81883 ) ( CALIBRATION_TARGET ?auto_81892 ?auto_81899 ) ( not ( = ?auto_81899 ?auto_81886 ) ) ( ON_BOARD ?auto_81898 ?auto_81897 ) ( not ( = ?auto_81892 ?auto_81898 ) ) ( SUPPORTS ?auto_81898 ?auto_81887 ) ( CALIBRATION_TARGET ?auto_81898 ?auto_81899 ) ( not ( = ?auto_81899 ?auto_81890 ) ) ( ON_BOARD ?auto_81894 ?auto_81897 ) ( not ( = ?auto_81898 ?auto_81894 ) ) ( SUPPORTS ?auto_81894 ?auto_81891 ) ( CALIBRATION_TARGET ?auto_81894 ?auto_81899 ) ( not ( = ?auto_81899 ?auto_81888 ) ) ( ON_BOARD ?auto_81895 ?auto_81897 ) ( not ( = ?auto_81894 ?auto_81895 ) ) ( SUPPORTS ?auto_81895 ?auto_81889 ) ( CALIBRATION_TARGET ?auto_81895 ?auto_81899 ) ( POWER_AVAIL ?auto_81897 ) ( POINTING ?auto_81897 ?auto_81896 ) ( not ( = ?auto_81899 ?auto_81896 ) ) ( not ( = ?auto_81888 ?auto_81896 ) ) ( not ( = ?auto_81889 ?auto_81891 ) ) ( not ( = ?auto_81890 ?auto_81896 ) ) ( not ( = ?auto_81889 ?auto_81887 ) ) ( not ( = ?auto_81891 ?auto_81887 ) ) ( not ( = ?auto_81886 ?auto_81896 ) ) ( not ( = ?auto_81898 ?auto_81895 ) ) ( not ( = ?auto_81889 ?auto_81883 ) ) ( not ( = ?auto_81891 ?auto_81883 ) ) ( not ( = ?auto_81887 ?auto_81883 ) ) ( not ( = ?auto_81882 ?auto_81896 ) ) ( not ( = ?auto_81892 ?auto_81894 ) ) ( not ( = ?auto_81892 ?auto_81895 ) ) ( not ( = ?auto_81889 ?auto_81884 ) ) ( not ( = ?auto_81891 ?auto_81884 ) ) ( not ( = ?auto_81887 ?auto_81884 ) ) ( not ( = ?auto_81883 ?auto_81884 ) ) ( not ( = ?auto_81885 ?auto_81896 ) ) ( not ( = ?auto_81893 ?auto_81898 ) ) ( not ( = ?auto_81893 ?auto_81894 ) ) ( not ( = ?auto_81893 ?auto_81895 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_81888 ?auto_81889 ?auto_81890 ?auto_81891 ?auto_81886 ?auto_81887 ?auto_81885 ?auto_81884 ?auto_81882 ?auto_81883 )
      ( GET-5IMAGE-VERIFY ?auto_81882 ?auto_81883 ?auto_81885 ?auto_81884 ?auto_81886 ?auto_81887 ?auto_81888 ?auto_81889 ?auto_81890 ?auto_81891 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_81960 - DIRECTION
      ?auto_81961 - MODE
      ?auto_81963 - DIRECTION
      ?auto_81962 - MODE
      ?auto_81964 - DIRECTION
      ?auto_81965 - MODE
      ?auto_81966 - DIRECTION
      ?auto_81967 - MODE
      ?auto_81968 - DIRECTION
      ?auto_81969 - MODE
    )
    :vars
    (
      ?auto_81971 - INSTRUMENT
      ?auto_81975 - SATELLITE
      ?auto_81977 - DIRECTION
      ?auto_81970 - INSTRUMENT
      ?auto_81976 - INSTRUMENT
      ?auto_81972 - INSTRUMENT
      ?auto_81973 - INSTRUMENT
      ?auto_81974 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_81963 ?auto_81960 ) ) ( not ( = ?auto_81964 ?auto_81960 ) ) ( not ( = ?auto_81964 ?auto_81963 ) ) ( not ( = ?auto_81966 ?auto_81960 ) ) ( not ( = ?auto_81966 ?auto_81963 ) ) ( not ( = ?auto_81966 ?auto_81964 ) ) ( not ( = ?auto_81968 ?auto_81960 ) ) ( not ( = ?auto_81968 ?auto_81963 ) ) ( not ( = ?auto_81968 ?auto_81964 ) ) ( not ( = ?auto_81968 ?auto_81966 ) ) ( ON_BOARD ?auto_81971 ?auto_81975 ) ( SUPPORTS ?auto_81971 ?auto_81962 ) ( not ( = ?auto_81963 ?auto_81977 ) ) ( CALIBRATION_TARGET ?auto_81971 ?auto_81977 ) ( not ( = ?auto_81977 ?auto_81960 ) ) ( ON_BOARD ?auto_81970 ?auto_81975 ) ( not ( = ?auto_81971 ?auto_81970 ) ) ( SUPPORTS ?auto_81970 ?auto_81961 ) ( CALIBRATION_TARGET ?auto_81970 ?auto_81977 ) ( not ( = ?auto_81977 ?auto_81964 ) ) ( ON_BOARD ?auto_81976 ?auto_81975 ) ( not ( = ?auto_81970 ?auto_81976 ) ) ( SUPPORTS ?auto_81976 ?auto_81965 ) ( CALIBRATION_TARGET ?auto_81976 ?auto_81977 ) ( not ( = ?auto_81977 ?auto_81966 ) ) ( ON_BOARD ?auto_81972 ?auto_81975 ) ( not ( = ?auto_81976 ?auto_81972 ) ) ( SUPPORTS ?auto_81972 ?auto_81967 ) ( CALIBRATION_TARGET ?auto_81972 ?auto_81977 ) ( not ( = ?auto_81977 ?auto_81968 ) ) ( ON_BOARD ?auto_81973 ?auto_81975 ) ( not ( = ?auto_81972 ?auto_81973 ) ) ( SUPPORTS ?auto_81973 ?auto_81969 ) ( CALIBRATION_TARGET ?auto_81973 ?auto_81977 ) ( POWER_AVAIL ?auto_81975 ) ( POINTING ?auto_81975 ?auto_81974 ) ( not ( = ?auto_81977 ?auto_81974 ) ) ( not ( = ?auto_81968 ?auto_81974 ) ) ( not ( = ?auto_81969 ?auto_81967 ) ) ( not ( = ?auto_81966 ?auto_81974 ) ) ( not ( = ?auto_81969 ?auto_81965 ) ) ( not ( = ?auto_81967 ?auto_81965 ) ) ( not ( = ?auto_81964 ?auto_81974 ) ) ( not ( = ?auto_81976 ?auto_81973 ) ) ( not ( = ?auto_81969 ?auto_81961 ) ) ( not ( = ?auto_81967 ?auto_81961 ) ) ( not ( = ?auto_81965 ?auto_81961 ) ) ( not ( = ?auto_81960 ?auto_81974 ) ) ( not ( = ?auto_81970 ?auto_81972 ) ) ( not ( = ?auto_81970 ?auto_81973 ) ) ( not ( = ?auto_81969 ?auto_81962 ) ) ( not ( = ?auto_81967 ?auto_81962 ) ) ( not ( = ?auto_81965 ?auto_81962 ) ) ( not ( = ?auto_81961 ?auto_81962 ) ) ( not ( = ?auto_81963 ?auto_81974 ) ) ( not ( = ?auto_81971 ?auto_81976 ) ) ( not ( = ?auto_81971 ?auto_81972 ) ) ( not ( = ?auto_81971 ?auto_81973 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_81968 ?auto_81969 ?auto_81966 ?auto_81967 ?auto_81964 ?auto_81965 ?auto_81963 ?auto_81962 ?auto_81960 ?auto_81961 )
      ( GET-5IMAGE-VERIFY ?auto_81960 ?auto_81961 ?auto_81963 ?auto_81962 ?auto_81964 ?auto_81965 ?auto_81966 ?auto_81967 ?auto_81968 ?auto_81969 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_84286 - DIRECTION
      ?auto_84287 - MODE
      ?auto_84289 - DIRECTION
      ?auto_84288 - MODE
      ?auto_84290 - DIRECTION
      ?auto_84291 - MODE
      ?auto_84292 - DIRECTION
      ?auto_84293 - MODE
      ?auto_84294 - DIRECTION
      ?auto_84295 - MODE
    )
    :vars
    (
      ?auto_84297 - INSTRUMENT
      ?auto_84301 - SATELLITE
      ?auto_84303 - DIRECTION
      ?auto_84296 - INSTRUMENT
      ?auto_84302 - INSTRUMENT
      ?auto_84298 - INSTRUMENT
      ?auto_84299 - INSTRUMENT
      ?auto_84300 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_84289 ?auto_84286 ) ) ( not ( = ?auto_84290 ?auto_84286 ) ) ( not ( = ?auto_84290 ?auto_84289 ) ) ( not ( = ?auto_84292 ?auto_84286 ) ) ( not ( = ?auto_84292 ?auto_84289 ) ) ( not ( = ?auto_84292 ?auto_84290 ) ) ( not ( = ?auto_84294 ?auto_84286 ) ) ( not ( = ?auto_84294 ?auto_84289 ) ) ( not ( = ?auto_84294 ?auto_84290 ) ) ( not ( = ?auto_84294 ?auto_84292 ) ) ( ON_BOARD ?auto_84297 ?auto_84301 ) ( SUPPORTS ?auto_84297 ?auto_84287 ) ( not ( = ?auto_84286 ?auto_84303 ) ) ( CALIBRATION_TARGET ?auto_84297 ?auto_84303 ) ( not ( = ?auto_84303 ?auto_84294 ) ) ( ON_BOARD ?auto_84296 ?auto_84301 ) ( not ( = ?auto_84297 ?auto_84296 ) ) ( SUPPORTS ?auto_84296 ?auto_84295 ) ( CALIBRATION_TARGET ?auto_84296 ?auto_84303 ) ( not ( = ?auto_84303 ?auto_84292 ) ) ( ON_BOARD ?auto_84302 ?auto_84301 ) ( not ( = ?auto_84296 ?auto_84302 ) ) ( SUPPORTS ?auto_84302 ?auto_84293 ) ( CALIBRATION_TARGET ?auto_84302 ?auto_84303 ) ( not ( = ?auto_84303 ?auto_84290 ) ) ( ON_BOARD ?auto_84298 ?auto_84301 ) ( not ( = ?auto_84302 ?auto_84298 ) ) ( SUPPORTS ?auto_84298 ?auto_84291 ) ( CALIBRATION_TARGET ?auto_84298 ?auto_84303 ) ( not ( = ?auto_84303 ?auto_84289 ) ) ( ON_BOARD ?auto_84299 ?auto_84301 ) ( not ( = ?auto_84298 ?auto_84299 ) ) ( SUPPORTS ?auto_84299 ?auto_84288 ) ( CALIBRATION_TARGET ?auto_84299 ?auto_84303 ) ( POWER_AVAIL ?auto_84301 ) ( POINTING ?auto_84301 ?auto_84300 ) ( not ( = ?auto_84303 ?auto_84300 ) ) ( not ( = ?auto_84289 ?auto_84300 ) ) ( not ( = ?auto_84288 ?auto_84291 ) ) ( not ( = ?auto_84290 ?auto_84300 ) ) ( not ( = ?auto_84288 ?auto_84293 ) ) ( not ( = ?auto_84291 ?auto_84293 ) ) ( not ( = ?auto_84292 ?auto_84300 ) ) ( not ( = ?auto_84302 ?auto_84299 ) ) ( not ( = ?auto_84288 ?auto_84295 ) ) ( not ( = ?auto_84291 ?auto_84295 ) ) ( not ( = ?auto_84293 ?auto_84295 ) ) ( not ( = ?auto_84294 ?auto_84300 ) ) ( not ( = ?auto_84296 ?auto_84298 ) ) ( not ( = ?auto_84296 ?auto_84299 ) ) ( not ( = ?auto_84288 ?auto_84287 ) ) ( not ( = ?auto_84291 ?auto_84287 ) ) ( not ( = ?auto_84293 ?auto_84287 ) ) ( not ( = ?auto_84295 ?auto_84287 ) ) ( not ( = ?auto_84286 ?auto_84300 ) ) ( not ( = ?auto_84297 ?auto_84302 ) ) ( not ( = ?auto_84297 ?auto_84298 ) ) ( not ( = ?auto_84297 ?auto_84299 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_84289 ?auto_84288 ?auto_84290 ?auto_84291 ?auto_84292 ?auto_84293 ?auto_84286 ?auto_84287 ?auto_84294 ?auto_84295 )
      ( GET-5IMAGE-VERIFY ?auto_84286 ?auto_84287 ?auto_84289 ?auto_84288 ?auto_84290 ?auto_84291 ?auto_84292 ?auto_84293 ?auto_84294 ?auto_84295 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_84364 - DIRECTION
      ?auto_84365 - MODE
      ?auto_84367 - DIRECTION
      ?auto_84366 - MODE
      ?auto_84368 - DIRECTION
      ?auto_84369 - MODE
      ?auto_84370 - DIRECTION
      ?auto_84371 - MODE
      ?auto_84372 - DIRECTION
      ?auto_84373 - MODE
    )
    :vars
    (
      ?auto_84375 - INSTRUMENT
      ?auto_84379 - SATELLITE
      ?auto_84381 - DIRECTION
      ?auto_84374 - INSTRUMENT
      ?auto_84380 - INSTRUMENT
      ?auto_84376 - INSTRUMENT
      ?auto_84377 - INSTRUMENT
      ?auto_84378 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_84367 ?auto_84364 ) ) ( not ( = ?auto_84368 ?auto_84364 ) ) ( not ( = ?auto_84368 ?auto_84367 ) ) ( not ( = ?auto_84370 ?auto_84364 ) ) ( not ( = ?auto_84370 ?auto_84367 ) ) ( not ( = ?auto_84370 ?auto_84368 ) ) ( not ( = ?auto_84372 ?auto_84364 ) ) ( not ( = ?auto_84372 ?auto_84367 ) ) ( not ( = ?auto_84372 ?auto_84368 ) ) ( not ( = ?auto_84372 ?auto_84370 ) ) ( ON_BOARD ?auto_84375 ?auto_84379 ) ( SUPPORTS ?auto_84375 ?auto_84365 ) ( not ( = ?auto_84364 ?auto_84381 ) ) ( CALIBRATION_TARGET ?auto_84375 ?auto_84381 ) ( not ( = ?auto_84381 ?auto_84370 ) ) ( ON_BOARD ?auto_84374 ?auto_84379 ) ( not ( = ?auto_84375 ?auto_84374 ) ) ( SUPPORTS ?auto_84374 ?auto_84371 ) ( CALIBRATION_TARGET ?auto_84374 ?auto_84381 ) ( not ( = ?auto_84381 ?auto_84372 ) ) ( ON_BOARD ?auto_84380 ?auto_84379 ) ( not ( = ?auto_84374 ?auto_84380 ) ) ( SUPPORTS ?auto_84380 ?auto_84373 ) ( CALIBRATION_TARGET ?auto_84380 ?auto_84381 ) ( not ( = ?auto_84381 ?auto_84368 ) ) ( ON_BOARD ?auto_84376 ?auto_84379 ) ( not ( = ?auto_84380 ?auto_84376 ) ) ( SUPPORTS ?auto_84376 ?auto_84369 ) ( CALIBRATION_TARGET ?auto_84376 ?auto_84381 ) ( not ( = ?auto_84381 ?auto_84367 ) ) ( ON_BOARD ?auto_84377 ?auto_84379 ) ( not ( = ?auto_84376 ?auto_84377 ) ) ( SUPPORTS ?auto_84377 ?auto_84366 ) ( CALIBRATION_TARGET ?auto_84377 ?auto_84381 ) ( POWER_AVAIL ?auto_84379 ) ( POINTING ?auto_84379 ?auto_84378 ) ( not ( = ?auto_84381 ?auto_84378 ) ) ( not ( = ?auto_84367 ?auto_84378 ) ) ( not ( = ?auto_84366 ?auto_84369 ) ) ( not ( = ?auto_84368 ?auto_84378 ) ) ( not ( = ?auto_84366 ?auto_84373 ) ) ( not ( = ?auto_84369 ?auto_84373 ) ) ( not ( = ?auto_84372 ?auto_84378 ) ) ( not ( = ?auto_84380 ?auto_84377 ) ) ( not ( = ?auto_84366 ?auto_84371 ) ) ( not ( = ?auto_84369 ?auto_84371 ) ) ( not ( = ?auto_84373 ?auto_84371 ) ) ( not ( = ?auto_84370 ?auto_84378 ) ) ( not ( = ?auto_84374 ?auto_84376 ) ) ( not ( = ?auto_84374 ?auto_84377 ) ) ( not ( = ?auto_84366 ?auto_84365 ) ) ( not ( = ?auto_84369 ?auto_84365 ) ) ( not ( = ?auto_84373 ?auto_84365 ) ) ( not ( = ?auto_84371 ?auto_84365 ) ) ( not ( = ?auto_84364 ?auto_84378 ) ) ( not ( = ?auto_84375 ?auto_84380 ) ) ( not ( = ?auto_84375 ?auto_84376 ) ) ( not ( = ?auto_84375 ?auto_84377 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_84367 ?auto_84366 ?auto_84368 ?auto_84369 ?auto_84372 ?auto_84373 ?auto_84364 ?auto_84365 ?auto_84370 ?auto_84371 )
      ( GET-5IMAGE-VERIFY ?auto_84364 ?auto_84365 ?auto_84367 ?auto_84366 ?auto_84368 ?auto_84369 ?auto_84370 ?auto_84371 ?auto_84372 ?auto_84373 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_84694 - DIRECTION
      ?auto_84695 - MODE
      ?auto_84697 - DIRECTION
      ?auto_84696 - MODE
      ?auto_84698 - DIRECTION
      ?auto_84699 - MODE
      ?auto_84700 - DIRECTION
      ?auto_84701 - MODE
      ?auto_84702 - DIRECTION
      ?auto_84703 - MODE
    )
    :vars
    (
      ?auto_84705 - INSTRUMENT
      ?auto_84709 - SATELLITE
      ?auto_84711 - DIRECTION
      ?auto_84704 - INSTRUMENT
      ?auto_84710 - INSTRUMENT
      ?auto_84706 - INSTRUMENT
      ?auto_84707 - INSTRUMENT
      ?auto_84708 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_84697 ?auto_84694 ) ) ( not ( = ?auto_84698 ?auto_84694 ) ) ( not ( = ?auto_84698 ?auto_84697 ) ) ( not ( = ?auto_84700 ?auto_84694 ) ) ( not ( = ?auto_84700 ?auto_84697 ) ) ( not ( = ?auto_84700 ?auto_84698 ) ) ( not ( = ?auto_84702 ?auto_84694 ) ) ( not ( = ?auto_84702 ?auto_84697 ) ) ( not ( = ?auto_84702 ?auto_84698 ) ) ( not ( = ?auto_84702 ?auto_84700 ) ) ( ON_BOARD ?auto_84705 ?auto_84709 ) ( SUPPORTS ?auto_84705 ?auto_84695 ) ( not ( = ?auto_84694 ?auto_84711 ) ) ( CALIBRATION_TARGET ?auto_84705 ?auto_84711 ) ( not ( = ?auto_84711 ?auto_84702 ) ) ( ON_BOARD ?auto_84704 ?auto_84709 ) ( not ( = ?auto_84705 ?auto_84704 ) ) ( SUPPORTS ?auto_84704 ?auto_84703 ) ( CALIBRATION_TARGET ?auto_84704 ?auto_84711 ) ( not ( = ?auto_84711 ?auto_84698 ) ) ( ON_BOARD ?auto_84710 ?auto_84709 ) ( not ( = ?auto_84704 ?auto_84710 ) ) ( SUPPORTS ?auto_84710 ?auto_84699 ) ( CALIBRATION_TARGET ?auto_84710 ?auto_84711 ) ( not ( = ?auto_84711 ?auto_84700 ) ) ( ON_BOARD ?auto_84706 ?auto_84709 ) ( not ( = ?auto_84710 ?auto_84706 ) ) ( SUPPORTS ?auto_84706 ?auto_84701 ) ( CALIBRATION_TARGET ?auto_84706 ?auto_84711 ) ( not ( = ?auto_84711 ?auto_84697 ) ) ( ON_BOARD ?auto_84707 ?auto_84709 ) ( not ( = ?auto_84706 ?auto_84707 ) ) ( SUPPORTS ?auto_84707 ?auto_84696 ) ( CALIBRATION_TARGET ?auto_84707 ?auto_84711 ) ( POWER_AVAIL ?auto_84709 ) ( POINTING ?auto_84709 ?auto_84708 ) ( not ( = ?auto_84711 ?auto_84708 ) ) ( not ( = ?auto_84697 ?auto_84708 ) ) ( not ( = ?auto_84696 ?auto_84701 ) ) ( not ( = ?auto_84700 ?auto_84708 ) ) ( not ( = ?auto_84696 ?auto_84699 ) ) ( not ( = ?auto_84701 ?auto_84699 ) ) ( not ( = ?auto_84698 ?auto_84708 ) ) ( not ( = ?auto_84710 ?auto_84707 ) ) ( not ( = ?auto_84696 ?auto_84703 ) ) ( not ( = ?auto_84701 ?auto_84703 ) ) ( not ( = ?auto_84699 ?auto_84703 ) ) ( not ( = ?auto_84702 ?auto_84708 ) ) ( not ( = ?auto_84704 ?auto_84706 ) ) ( not ( = ?auto_84704 ?auto_84707 ) ) ( not ( = ?auto_84696 ?auto_84695 ) ) ( not ( = ?auto_84701 ?auto_84695 ) ) ( not ( = ?auto_84699 ?auto_84695 ) ) ( not ( = ?auto_84703 ?auto_84695 ) ) ( not ( = ?auto_84694 ?auto_84708 ) ) ( not ( = ?auto_84705 ?auto_84710 ) ) ( not ( = ?auto_84705 ?auto_84706 ) ) ( not ( = ?auto_84705 ?auto_84707 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_84697 ?auto_84696 ?auto_84700 ?auto_84701 ?auto_84698 ?auto_84699 ?auto_84694 ?auto_84695 ?auto_84702 ?auto_84703 )
      ( GET-5IMAGE-VERIFY ?auto_84694 ?auto_84695 ?auto_84697 ?auto_84696 ?auto_84698 ?auto_84699 ?auto_84700 ?auto_84701 ?auto_84702 ?auto_84703 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_84858 - DIRECTION
      ?auto_84859 - MODE
      ?auto_84861 - DIRECTION
      ?auto_84860 - MODE
      ?auto_84862 - DIRECTION
      ?auto_84863 - MODE
      ?auto_84864 - DIRECTION
      ?auto_84865 - MODE
      ?auto_84866 - DIRECTION
      ?auto_84867 - MODE
    )
    :vars
    (
      ?auto_84869 - INSTRUMENT
      ?auto_84873 - SATELLITE
      ?auto_84875 - DIRECTION
      ?auto_84868 - INSTRUMENT
      ?auto_84874 - INSTRUMENT
      ?auto_84870 - INSTRUMENT
      ?auto_84871 - INSTRUMENT
      ?auto_84872 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_84861 ?auto_84858 ) ) ( not ( = ?auto_84862 ?auto_84858 ) ) ( not ( = ?auto_84862 ?auto_84861 ) ) ( not ( = ?auto_84864 ?auto_84858 ) ) ( not ( = ?auto_84864 ?auto_84861 ) ) ( not ( = ?auto_84864 ?auto_84862 ) ) ( not ( = ?auto_84866 ?auto_84858 ) ) ( not ( = ?auto_84866 ?auto_84861 ) ) ( not ( = ?auto_84866 ?auto_84862 ) ) ( not ( = ?auto_84866 ?auto_84864 ) ) ( ON_BOARD ?auto_84869 ?auto_84873 ) ( SUPPORTS ?auto_84869 ?auto_84859 ) ( not ( = ?auto_84858 ?auto_84875 ) ) ( CALIBRATION_TARGET ?auto_84869 ?auto_84875 ) ( not ( = ?auto_84875 ?auto_84864 ) ) ( ON_BOARD ?auto_84868 ?auto_84873 ) ( not ( = ?auto_84869 ?auto_84868 ) ) ( SUPPORTS ?auto_84868 ?auto_84865 ) ( CALIBRATION_TARGET ?auto_84868 ?auto_84875 ) ( not ( = ?auto_84875 ?auto_84862 ) ) ( ON_BOARD ?auto_84874 ?auto_84873 ) ( not ( = ?auto_84868 ?auto_84874 ) ) ( SUPPORTS ?auto_84874 ?auto_84863 ) ( CALIBRATION_TARGET ?auto_84874 ?auto_84875 ) ( not ( = ?auto_84875 ?auto_84866 ) ) ( ON_BOARD ?auto_84870 ?auto_84873 ) ( not ( = ?auto_84874 ?auto_84870 ) ) ( SUPPORTS ?auto_84870 ?auto_84867 ) ( CALIBRATION_TARGET ?auto_84870 ?auto_84875 ) ( not ( = ?auto_84875 ?auto_84861 ) ) ( ON_BOARD ?auto_84871 ?auto_84873 ) ( not ( = ?auto_84870 ?auto_84871 ) ) ( SUPPORTS ?auto_84871 ?auto_84860 ) ( CALIBRATION_TARGET ?auto_84871 ?auto_84875 ) ( POWER_AVAIL ?auto_84873 ) ( POINTING ?auto_84873 ?auto_84872 ) ( not ( = ?auto_84875 ?auto_84872 ) ) ( not ( = ?auto_84861 ?auto_84872 ) ) ( not ( = ?auto_84860 ?auto_84867 ) ) ( not ( = ?auto_84866 ?auto_84872 ) ) ( not ( = ?auto_84860 ?auto_84863 ) ) ( not ( = ?auto_84867 ?auto_84863 ) ) ( not ( = ?auto_84862 ?auto_84872 ) ) ( not ( = ?auto_84874 ?auto_84871 ) ) ( not ( = ?auto_84860 ?auto_84865 ) ) ( not ( = ?auto_84867 ?auto_84865 ) ) ( not ( = ?auto_84863 ?auto_84865 ) ) ( not ( = ?auto_84864 ?auto_84872 ) ) ( not ( = ?auto_84868 ?auto_84870 ) ) ( not ( = ?auto_84868 ?auto_84871 ) ) ( not ( = ?auto_84860 ?auto_84859 ) ) ( not ( = ?auto_84867 ?auto_84859 ) ) ( not ( = ?auto_84863 ?auto_84859 ) ) ( not ( = ?auto_84865 ?auto_84859 ) ) ( not ( = ?auto_84858 ?auto_84872 ) ) ( not ( = ?auto_84869 ?auto_84874 ) ) ( not ( = ?auto_84869 ?auto_84870 ) ) ( not ( = ?auto_84869 ?auto_84871 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_84861 ?auto_84860 ?auto_84866 ?auto_84867 ?auto_84862 ?auto_84863 ?auto_84858 ?auto_84859 ?auto_84864 ?auto_84865 )
      ( GET-5IMAGE-VERIFY ?auto_84858 ?auto_84859 ?auto_84861 ?auto_84860 ?auto_84862 ?auto_84863 ?auto_84864 ?auto_84865 ?auto_84866 ?auto_84867 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_85188 - DIRECTION
      ?auto_85189 - MODE
      ?auto_85191 - DIRECTION
      ?auto_85190 - MODE
      ?auto_85192 - DIRECTION
      ?auto_85193 - MODE
      ?auto_85194 - DIRECTION
      ?auto_85195 - MODE
      ?auto_85196 - DIRECTION
      ?auto_85197 - MODE
    )
    :vars
    (
      ?auto_85199 - INSTRUMENT
      ?auto_85203 - SATELLITE
      ?auto_85205 - DIRECTION
      ?auto_85198 - INSTRUMENT
      ?auto_85204 - INSTRUMENT
      ?auto_85200 - INSTRUMENT
      ?auto_85201 - INSTRUMENT
      ?auto_85202 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_85191 ?auto_85188 ) ) ( not ( = ?auto_85192 ?auto_85188 ) ) ( not ( = ?auto_85192 ?auto_85191 ) ) ( not ( = ?auto_85194 ?auto_85188 ) ) ( not ( = ?auto_85194 ?auto_85191 ) ) ( not ( = ?auto_85194 ?auto_85192 ) ) ( not ( = ?auto_85196 ?auto_85188 ) ) ( not ( = ?auto_85196 ?auto_85191 ) ) ( not ( = ?auto_85196 ?auto_85192 ) ) ( not ( = ?auto_85196 ?auto_85194 ) ) ( ON_BOARD ?auto_85199 ?auto_85203 ) ( SUPPORTS ?auto_85199 ?auto_85189 ) ( not ( = ?auto_85188 ?auto_85205 ) ) ( CALIBRATION_TARGET ?auto_85199 ?auto_85205 ) ( not ( = ?auto_85205 ?auto_85192 ) ) ( ON_BOARD ?auto_85198 ?auto_85203 ) ( not ( = ?auto_85199 ?auto_85198 ) ) ( SUPPORTS ?auto_85198 ?auto_85193 ) ( CALIBRATION_TARGET ?auto_85198 ?auto_85205 ) ( not ( = ?auto_85205 ?auto_85196 ) ) ( ON_BOARD ?auto_85204 ?auto_85203 ) ( not ( = ?auto_85198 ?auto_85204 ) ) ( SUPPORTS ?auto_85204 ?auto_85197 ) ( CALIBRATION_TARGET ?auto_85204 ?auto_85205 ) ( not ( = ?auto_85205 ?auto_85194 ) ) ( ON_BOARD ?auto_85200 ?auto_85203 ) ( not ( = ?auto_85204 ?auto_85200 ) ) ( SUPPORTS ?auto_85200 ?auto_85195 ) ( CALIBRATION_TARGET ?auto_85200 ?auto_85205 ) ( not ( = ?auto_85205 ?auto_85191 ) ) ( ON_BOARD ?auto_85201 ?auto_85203 ) ( not ( = ?auto_85200 ?auto_85201 ) ) ( SUPPORTS ?auto_85201 ?auto_85190 ) ( CALIBRATION_TARGET ?auto_85201 ?auto_85205 ) ( POWER_AVAIL ?auto_85203 ) ( POINTING ?auto_85203 ?auto_85202 ) ( not ( = ?auto_85205 ?auto_85202 ) ) ( not ( = ?auto_85191 ?auto_85202 ) ) ( not ( = ?auto_85190 ?auto_85195 ) ) ( not ( = ?auto_85194 ?auto_85202 ) ) ( not ( = ?auto_85190 ?auto_85197 ) ) ( not ( = ?auto_85195 ?auto_85197 ) ) ( not ( = ?auto_85196 ?auto_85202 ) ) ( not ( = ?auto_85204 ?auto_85201 ) ) ( not ( = ?auto_85190 ?auto_85193 ) ) ( not ( = ?auto_85195 ?auto_85193 ) ) ( not ( = ?auto_85197 ?auto_85193 ) ) ( not ( = ?auto_85192 ?auto_85202 ) ) ( not ( = ?auto_85198 ?auto_85200 ) ) ( not ( = ?auto_85198 ?auto_85201 ) ) ( not ( = ?auto_85190 ?auto_85189 ) ) ( not ( = ?auto_85195 ?auto_85189 ) ) ( not ( = ?auto_85197 ?auto_85189 ) ) ( not ( = ?auto_85193 ?auto_85189 ) ) ( not ( = ?auto_85188 ?auto_85202 ) ) ( not ( = ?auto_85199 ?auto_85204 ) ) ( not ( = ?auto_85199 ?auto_85200 ) ) ( not ( = ?auto_85199 ?auto_85201 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_85191 ?auto_85190 ?auto_85194 ?auto_85195 ?auto_85196 ?auto_85197 ?auto_85188 ?auto_85189 ?auto_85192 ?auto_85193 )
      ( GET-5IMAGE-VERIFY ?auto_85188 ?auto_85189 ?auto_85191 ?auto_85190 ?auto_85192 ?auto_85193 ?auto_85194 ?auto_85195 ?auto_85196 ?auto_85197 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_85266 - DIRECTION
      ?auto_85267 - MODE
      ?auto_85269 - DIRECTION
      ?auto_85268 - MODE
      ?auto_85270 - DIRECTION
      ?auto_85271 - MODE
      ?auto_85272 - DIRECTION
      ?auto_85273 - MODE
      ?auto_85274 - DIRECTION
      ?auto_85275 - MODE
    )
    :vars
    (
      ?auto_85277 - INSTRUMENT
      ?auto_85281 - SATELLITE
      ?auto_85283 - DIRECTION
      ?auto_85276 - INSTRUMENT
      ?auto_85282 - INSTRUMENT
      ?auto_85278 - INSTRUMENT
      ?auto_85279 - INSTRUMENT
      ?auto_85280 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_85269 ?auto_85266 ) ) ( not ( = ?auto_85270 ?auto_85266 ) ) ( not ( = ?auto_85270 ?auto_85269 ) ) ( not ( = ?auto_85272 ?auto_85266 ) ) ( not ( = ?auto_85272 ?auto_85269 ) ) ( not ( = ?auto_85272 ?auto_85270 ) ) ( not ( = ?auto_85274 ?auto_85266 ) ) ( not ( = ?auto_85274 ?auto_85269 ) ) ( not ( = ?auto_85274 ?auto_85270 ) ) ( not ( = ?auto_85274 ?auto_85272 ) ) ( ON_BOARD ?auto_85277 ?auto_85281 ) ( SUPPORTS ?auto_85277 ?auto_85267 ) ( not ( = ?auto_85266 ?auto_85283 ) ) ( CALIBRATION_TARGET ?auto_85277 ?auto_85283 ) ( not ( = ?auto_85283 ?auto_85270 ) ) ( ON_BOARD ?auto_85276 ?auto_85281 ) ( not ( = ?auto_85277 ?auto_85276 ) ) ( SUPPORTS ?auto_85276 ?auto_85271 ) ( CALIBRATION_TARGET ?auto_85276 ?auto_85283 ) ( not ( = ?auto_85283 ?auto_85272 ) ) ( ON_BOARD ?auto_85282 ?auto_85281 ) ( not ( = ?auto_85276 ?auto_85282 ) ) ( SUPPORTS ?auto_85282 ?auto_85273 ) ( CALIBRATION_TARGET ?auto_85282 ?auto_85283 ) ( not ( = ?auto_85283 ?auto_85274 ) ) ( ON_BOARD ?auto_85278 ?auto_85281 ) ( not ( = ?auto_85282 ?auto_85278 ) ) ( SUPPORTS ?auto_85278 ?auto_85275 ) ( CALIBRATION_TARGET ?auto_85278 ?auto_85283 ) ( not ( = ?auto_85283 ?auto_85269 ) ) ( ON_BOARD ?auto_85279 ?auto_85281 ) ( not ( = ?auto_85278 ?auto_85279 ) ) ( SUPPORTS ?auto_85279 ?auto_85268 ) ( CALIBRATION_TARGET ?auto_85279 ?auto_85283 ) ( POWER_AVAIL ?auto_85281 ) ( POINTING ?auto_85281 ?auto_85280 ) ( not ( = ?auto_85283 ?auto_85280 ) ) ( not ( = ?auto_85269 ?auto_85280 ) ) ( not ( = ?auto_85268 ?auto_85275 ) ) ( not ( = ?auto_85274 ?auto_85280 ) ) ( not ( = ?auto_85268 ?auto_85273 ) ) ( not ( = ?auto_85275 ?auto_85273 ) ) ( not ( = ?auto_85272 ?auto_85280 ) ) ( not ( = ?auto_85282 ?auto_85279 ) ) ( not ( = ?auto_85268 ?auto_85271 ) ) ( not ( = ?auto_85275 ?auto_85271 ) ) ( not ( = ?auto_85273 ?auto_85271 ) ) ( not ( = ?auto_85270 ?auto_85280 ) ) ( not ( = ?auto_85276 ?auto_85278 ) ) ( not ( = ?auto_85276 ?auto_85279 ) ) ( not ( = ?auto_85268 ?auto_85267 ) ) ( not ( = ?auto_85275 ?auto_85267 ) ) ( not ( = ?auto_85273 ?auto_85267 ) ) ( not ( = ?auto_85271 ?auto_85267 ) ) ( not ( = ?auto_85266 ?auto_85280 ) ) ( not ( = ?auto_85277 ?auto_85282 ) ) ( not ( = ?auto_85277 ?auto_85278 ) ) ( not ( = ?auto_85277 ?auto_85279 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_85269 ?auto_85268 ?auto_85274 ?auto_85275 ?auto_85272 ?auto_85273 ?auto_85266 ?auto_85267 ?auto_85270 ?auto_85271 )
      ( GET-5IMAGE-VERIFY ?auto_85266 ?auto_85267 ?auto_85269 ?auto_85268 ?auto_85270 ?auto_85271 ?auto_85272 ?auto_85273 ?auto_85274 ?auto_85275 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_86374 - DIRECTION
      ?auto_86375 - MODE
      ?auto_86377 - DIRECTION
      ?auto_86376 - MODE
      ?auto_86378 - DIRECTION
      ?auto_86379 - MODE
      ?auto_86380 - DIRECTION
      ?auto_86381 - MODE
      ?auto_86382 - DIRECTION
      ?auto_86383 - MODE
    )
    :vars
    (
      ?auto_86385 - INSTRUMENT
      ?auto_86389 - SATELLITE
      ?auto_86391 - DIRECTION
      ?auto_86384 - INSTRUMENT
      ?auto_86390 - INSTRUMENT
      ?auto_86386 - INSTRUMENT
      ?auto_86387 - INSTRUMENT
      ?auto_86388 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_86377 ?auto_86374 ) ) ( not ( = ?auto_86378 ?auto_86374 ) ) ( not ( = ?auto_86378 ?auto_86377 ) ) ( not ( = ?auto_86380 ?auto_86374 ) ) ( not ( = ?auto_86380 ?auto_86377 ) ) ( not ( = ?auto_86380 ?auto_86378 ) ) ( not ( = ?auto_86382 ?auto_86374 ) ) ( not ( = ?auto_86382 ?auto_86377 ) ) ( not ( = ?auto_86382 ?auto_86378 ) ) ( not ( = ?auto_86382 ?auto_86380 ) ) ( ON_BOARD ?auto_86385 ?auto_86389 ) ( SUPPORTS ?auto_86385 ?auto_86375 ) ( not ( = ?auto_86374 ?auto_86391 ) ) ( CALIBRATION_TARGET ?auto_86385 ?auto_86391 ) ( not ( = ?auto_86391 ?auto_86382 ) ) ( ON_BOARD ?auto_86384 ?auto_86389 ) ( not ( = ?auto_86385 ?auto_86384 ) ) ( SUPPORTS ?auto_86384 ?auto_86383 ) ( CALIBRATION_TARGET ?auto_86384 ?auto_86391 ) ( not ( = ?auto_86391 ?auto_86380 ) ) ( ON_BOARD ?auto_86390 ?auto_86389 ) ( not ( = ?auto_86384 ?auto_86390 ) ) ( SUPPORTS ?auto_86390 ?auto_86381 ) ( CALIBRATION_TARGET ?auto_86390 ?auto_86391 ) ( not ( = ?auto_86391 ?auto_86377 ) ) ( ON_BOARD ?auto_86386 ?auto_86389 ) ( not ( = ?auto_86390 ?auto_86386 ) ) ( SUPPORTS ?auto_86386 ?auto_86376 ) ( CALIBRATION_TARGET ?auto_86386 ?auto_86391 ) ( not ( = ?auto_86391 ?auto_86378 ) ) ( ON_BOARD ?auto_86387 ?auto_86389 ) ( not ( = ?auto_86386 ?auto_86387 ) ) ( SUPPORTS ?auto_86387 ?auto_86379 ) ( CALIBRATION_TARGET ?auto_86387 ?auto_86391 ) ( POWER_AVAIL ?auto_86389 ) ( POINTING ?auto_86389 ?auto_86388 ) ( not ( = ?auto_86391 ?auto_86388 ) ) ( not ( = ?auto_86378 ?auto_86388 ) ) ( not ( = ?auto_86379 ?auto_86376 ) ) ( not ( = ?auto_86377 ?auto_86388 ) ) ( not ( = ?auto_86379 ?auto_86381 ) ) ( not ( = ?auto_86376 ?auto_86381 ) ) ( not ( = ?auto_86380 ?auto_86388 ) ) ( not ( = ?auto_86390 ?auto_86387 ) ) ( not ( = ?auto_86379 ?auto_86383 ) ) ( not ( = ?auto_86376 ?auto_86383 ) ) ( not ( = ?auto_86381 ?auto_86383 ) ) ( not ( = ?auto_86382 ?auto_86388 ) ) ( not ( = ?auto_86384 ?auto_86386 ) ) ( not ( = ?auto_86384 ?auto_86387 ) ) ( not ( = ?auto_86379 ?auto_86375 ) ) ( not ( = ?auto_86376 ?auto_86375 ) ) ( not ( = ?auto_86381 ?auto_86375 ) ) ( not ( = ?auto_86383 ?auto_86375 ) ) ( not ( = ?auto_86374 ?auto_86388 ) ) ( not ( = ?auto_86385 ?auto_86390 ) ) ( not ( = ?auto_86385 ?auto_86386 ) ) ( not ( = ?auto_86385 ?auto_86387 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_86378 ?auto_86379 ?auto_86377 ?auto_86376 ?auto_86380 ?auto_86381 ?auto_86374 ?auto_86375 ?auto_86382 ?auto_86383 )
      ( GET-5IMAGE-VERIFY ?auto_86374 ?auto_86375 ?auto_86377 ?auto_86376 ?auto_86378 ?auto_86379 ?auto_86380 ?auto_86381 ?auto_86382 ?auto_86383 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_86452 - DIRECTION
      ?auto_86453 - MODE
      ?auto_86455 - DIRECTION
      ?auto_86454 - MODE
      ?auto_86456 - DIRECTION
      ?auto_86457 - MODE
      ?auto_86458 - DIRECTION
      ?auto_86459 - MODE
      ?auto_86460 - DIRECTION
      ?auto_86461 - MODE
    )
    :vars
    (
      ?auto_86463 - INSTRUMENT
      ?auto_86467 - SATELLITE
      ?auto_86469 - DIRECTION
      ?auto_86462 - INSTRUMENT
      ?auto_86468 - INSTRUMENT
      ?auto_86464 - INSTRUMENT
      ?auto_86465 - INSTRUMENT
      ?auto_86466 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_86455 ?auto_86452 ) ) ( not ( = ?auto_86456 ?auto_86452 ) ) ( not ( = ?auto_86456 ?auto_86455 ) ) ( not ( = ?auto_86458 ?auto_86452 ) ) ( not ( = ?auto_86458 ?auto_86455 ) ) ( not ( = ?auto_86458 ?auto_86456 ) ) ( not ( = ?auto_86460 ?auto_86452 ) ) ( not ( = ?auto_86460 ?auto_86455 ) ) ( not ( = ?auto_86460 ?auto_86456 ) ) ( not ( = ?auto_86460 ?auto_86458 ) ) ( ON_BOARD ?auto_86463 ?auto_86467 ) ( SUPPORTS ?auto_86463 ?auto_86453 ) ( not ( = ?auto_86452 ?auto_86469 ) ) ( CALIBRATION_TARGET ?auto_86463 ?auto_86469 ) ( not ( = ?auto_86469 ?auto_86458 ) ) ( ON_BOARD ?auto_86462 ?auto_86467 ) ( not ( = ?auto_86463 ?auto_86462 ) ) ( SUPPORTS ?auto_86462 ?auto_86459 ) ( CALIBRATION_TARGET ?auto_86462 ?auto_86469 ) ( not ( = ?auto_86469 ?auto_86460 ) ) ( ON_BOARD ?auto_86468 ?auto_86467 ) ( not ( = ?auto_86462 ?auto_86468 ) ) ( SUPPORTS ?auto_86468 ?auto_86461 ) ( CALIBRATION_TARGET ?auto_86468 ?auto_86469 ) ( not ( = ?auto_86469 ?auto_86455 ) ) ( ON_BOARD ?auto_86464 ?auto_86467 ) ( not ( = ?auto_86468 ?auto_86464 ) ) ( SUPPORTS ?auto_86464 ?auto_86454 ) ( CALIBRATION_TARGET ?auto_86464 ?auto_86469 ) ( not ( = ?auto_86469 ?auto_86456 ) ) ( ON_BOARD ?auto_86465 ?auto_86467 ) ( not ( = ?auto_86464 ?auto_86465 ) ) ( SUPPORTS ?auto_86465 ?auto_86457 ) ( CALIBRATION_TARGET ?auto_86465 ?auto_86469 ) ( POWER_AVAIL ?auto_86467 ) ( POINTING ?auto_86467 ?auto_86466 ) ( not ( = ?auto_86469 ?auto_86466 ) ) ( not ( = ?auto_86456 ?auto_86466 ) ) ( not ( = ?auto_86457 ?auto_86454 ) ) ( not ( = ?auto_86455 ?auto_86466 ) ) ( not ( = ?auto_86457 ?auto_86461 ) ) ( not ( = ?auto_86454 ?auto_86461 ) ) ( not ( = ?auto_86460 ?auto_86466 ) ) ( not ( = ?auto_86468 ?auto_86465 ) ) ( not ( = ?auto_86457 ?auto_86459 ) ) ( not ( = ?auto_86454 ?auto_86459 ) ) ( not ( = ?auto_86461 ?auto_86459 ) ) ( not ( = ?auto_86458 ?auto_86466 ) ) ( not ( = ?auto_86462 ?auto_86464 ) ) ( not ( = ?auto_86462 ?auto_86465 ) ) ( not ( = ?auto_86457 ?auto_86453 ) ) ( not ( = ?auto_86454 ?auto_86453 ) ) ( not ( = ?auto_86461 ?auto_86453 ) ) ( not ( = ?auto_86459 ?auto_86453 ) ) ( not ( = ?auto_86452 ?auto_86466 ) ) ( not ( = ?auto_86463 ?auto_86468 ) ) ( not ( = ?auto_86463 ?auto_86464 ) ) ( not ( = ?auto_86463 ?auto_86465 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_86456 ?auto_86457 ?auto_86455 ?auto_86454 ?auto_86460 ?auto_86461 ?auto_86452 ?auto_86453 ?auto_86458 ?auto_86459 )
      ( GET-5IMAGE-VERIFY ?auto_86452 ?auto_86453 ?auto_86455 ?auto_86454 ?auto_86456 ?auto_86457 ?auto_86458 ?auto_86459 ?auto_86460 ?auto_86461 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_87222 - DIRECTION
      ?auto_87223 - MODE
      ?auto_87225 - DIRECTION
      ?auto_87224 - MODE
      ?auto_87226 - DIRECTION
      ?auto_87227 - MODE
      ?auto_87228 - DIRECTION
      ?auto_87229 - MODE
      ?auto_87230 - DIRECTION
      ?auto_87231 - MODE
    )
    :vars
    (
      ?auto_87233 - INSTRUMENT
      ?auto_87237 - SATELLITE
      ?auto_87239 - DIRECTION
      ?auto_87232 - INSTRUMENT
      ?auto_87238 - INSTRUMENT
      ?auto_87234 - INSTRUMENT
      ?auto_87235 - INSTRUMENT
      ?auto_87236 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_87225 ?auto_87222 ) ) ( not ( = ?auto_87226 ?auto_87222 ) ) ( not ( = ?auto_87226 ?auto_87225 ) ) ( not ( = ?auto_87228 ?auto_87222 ) ) ( not ( = ?auto_87228 ?auto_87225 ) ) ( not ( = ?auto_87228 ?auto_87226 ) ) ( not ( = ?auto_87230 ?auto_87222 ) ) ( not ( = ?auto_87230 ?auto_87225 ) ) ( not ( = ?auto_87230 ?auto_87226 ) ) ( not ( = ?auto_87230 ?auto_87228 ) ) ( ON_BOARD ?auto_87233 ?auto_87237 ) ( SUPPORTS ?auto_87233 ?auto_87223 ) ( not ( = ?auto_87222 ?auto_87239 ) ) ( CALIBRATION_TARGET ?auto_87233 ?auto_87239 ) ( not ( = ?auto_87239 ?auto_87230 ) ) ( ON_BOARD ?auto_87232 ?auto_87237 ) ( not ( = ?auto_87233 ?auto_87232 ) ) ( SUPPORTS ?auto_87232 ?auto_87231 ) ( CALIBRATION_TARGET ?auto_87232 ?auto_87239 ) ( not ( = ?auto_87239 ?auto_87226 ) ) ( ON_BOARD ?auto_87238 ?auto_87237 ) ( not ( = ?auto_87232 ?auto_87238 ) ) ( SUPPORTS ?auto_87238 ?auto_87227 ) ( CALIBRATION_TARGET ?auto_87238 ?auto_87239 ) ( not ( = ?auto_87239 ?auto_87225 ) ) ( ON_BOARD ?auto_87234 ?auto_87237 ) ( not ( = ?auto_87238 ?auto_87234 ) ) ( SUPPORTS ?auto_87234 ?auto_87224 ) ( CALIBRATION_TARGET ?auto_87234 ?auto_87239 ) ( not ( = ?auto_87239 ?auto_87228 ) ) ( ON_BOARD ?auto_87235 ?auto_87237 ) ( not ( = ?auto_87234 ?auto_87235 ) ) ( SUPPORTS ?auto_87235 ?auto_87229 ) ( CALIBRATION_TARGET ?auto_87235 ?auto_87239 ) ( POWER_AVAIL ?auto_87237 ) ( POINTING ?auto_87237 ?auto_87236 ) ( not ( = ?auto_87239 ?auto_87236 ) ) ( not ( = ?auto_87228 ?auto_87236 ) ) ( not ( = ?auto_87229 ?auto_87224 ) ) ( not ( = ?auto_87225 ?auto_87236 ) ) ( not ( = ?auto_87229 ?auto_87227 ) ) ( not ( = ?auto_87224 ?auto_87227 ) ) ( not ( = ?auto_87226 ?auto_87236 ) ) ( not ( = ?auto_87238 ?auto_87235 ) ) ( not ( = ?auto_87229 ?auto_87231 ) ) ( not ( = ?auto_87224 ?auto_87231 ) ) ( not ( = ?auto_87227 ?auto_87231 ) ) ( not ( = ?auto_87230 ?auto_87236 ) ) ( not ( = ?auto_87232 ?auto_87234 ) ) ( not ( = ?auto_87232 ?auto_87235 ) ) ( not ( = ?auto_87229 ?auto_87223 ) ) ( not ( = ?auto_87224 ?auto_87223 ) ) ( not ( = ?auto_87227 ?auto_87223 ) ) ( not ( = ?auto_87231 ?auto_87223 ) ) ( not ( = ?auto_87222 ?auto_87236 ) ) ( not ( = ?auto_87233 ?auto_87238 ) ) ( not ( = ?auto_87233 ?auto_87234 ) ) ( not ( = ?auto_87233 ?auto_87235 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_87228 ?auto_87229 ?auto_87225 ?auto_87224 ?auto_87226 ?auto_87227 ?auto_87222 ?auto_87223 ?auto_87230 ?auto_87231 )
      ( GET-5IMAGE-VERIFY ?auto_87222 ?auto_87223 ?auto_87225 ?auto_87224 ?auto_87226 ?auto_87227 ?auto_87228 ?auto_87229 ?auto_87230 ?auto_87231 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_87472 - DIRECTION
      ?auto_87473 - MODE
      ?auto_87475 - DIRECTION
      ?auto_87474 - MODE
      ?auto_87476 - DIRECTION
      ?auto_87477 - MODE
      ?auto_87478 - DIRECTION
      ?auto_87479 - MODE
      ?auto_87480 - DIRECTION
      ?auto_87481 - MODE
    )
    :vars
    (
      ?auto_87483 - INSTRUMENT
      ?auto_87487 - SATELLITE
      ?auto_87489 - DIRECTION
      ?auto_87482 - INSTRUMENT
      ?auto_87488 - INSTRUMENT
      ?auto_87484 - INSTRUMENT
      ?auto_87485 - INSTRUMENT
      ?auto_87486 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_87475 ?auto_87472 ) ) ( not ( = ?auto_87476 ?auto_87472 ) ) ( not ( = ?auto_87476 ?auto_87475 ) ) ( not ( = ?auto_87478 ?auto_87472 ) ) ( not ( = ?auto_87478 ?auto_87475 ) ) ( not ( = ?auto_87478 ?auto_87476 ) ) ( not ( = ?auto_87480 ?auto_87472 ) ) ( not ( = ?auto_87480 ?auto_87475 ) ) ( not ( = ?auto_87480 ?auto_87476 ) ) ( not ( = ?auto_87480 ?auto_87478 ) ) ( ON_BOARD ?auto_87483 ?auto_87487 ) ( SUPPORTS ?auto_87483 ?auto_87473 ) ( not ( = ?auto_87472 ?auto_87489 ) ) ( CALIBRATION_TARGET ?auto_87483 ?auto_87489 ) ( not ( = ?auto_87489 ?auto_87478 ) ) ( ON_BOARD ?auto_87482 ?auto_87487 ) ( not ( = ?auto_87483 ?auto_87482 ) ) ( SUPPORTS ?auto_87482 ?auto_87479 ) ( CALIBRATION_TARGET ?auto_87482 ?auto_87489 ) ( not ( = ?auto_87489 ?auto_87476 ) ) ( ON_BOARD ?auto_87488 ?auto_87487 ) ( not ( = ?auto_87482 ?auto_87488 ) ) ( SUPPORTS ?auto_87488 ?auto_87477 ) ( CALIBRATION_TARGET ?auto_87488 ?auto_87489 ) ( not ( = ?auto_87489 ?auto_87475 ) ) ( ON_BOARD ?auto_87484 ?auto_87487 ) ( not ( = ?auto_87488 ?auto_87484 ) ) ( SUPPORTS ?auto_87484 ?auto_87474 ) ( CALIBRATION_TARGET ?auto_87484 ?auto_87489 ) ( not ( = ?auto_87489 ?auto_87480 ) ) ( ON_BOARD ?auto_87485 ?auto_87487 ) ( not ( = ?auto_87484 ?auto_87485 ) ) ( SUPPORTS ?auto_87485 ?auto_87481 ) ( CALIBRATION_TARGET ?auto_87485 ?auto_87489 ) ( POWER_AVAIL ?auto_87487 ) ( POINTING ?auto_87487 ?auto_87486 ) ( not ( = ?auto_87489 ?auto_87486 ) ) ( not ( = ?auto_87480 ?auto_87486 ) ) ( not ( = ?auto_87481 ?auto_87474 ) ) ( not ( = ?auto_87475 ?auto_87486 ) ) ( not ( = ?auto_87481 ?auto_87477 ) ) ( not ( = ?auto_87474 ?auto_87477 ) ) ( not ( = ?auto_87476 ?auto_87486 ) ) ( not ( = ?auto_87488 ?auto_87485 ) ) ( not ( = ?auto_87481 ?auto_87479 ) ) ( not ( = ?auto_87474 ?auto_87479 ) ) ( not ( = ?auto_87477 ?auto_87479 ) ) ( not ( = ?auto_87478 ?auto_87486 ) ) ( not ( = ?auto_87482 ?auto_87484 ) ) ( not ( = ?auto_87482 ?auto_87485 ) ) ( not ( = ?auto_87481 ?auto_87473 ) ) ( not ( = ?auto_87474 ?auto_87473 ) ) ( not ( = ?auto_87477 ?auto_87473 ) ) ( not ( = ?auto_87479 ?auto_87473 ) ) ( not ( = ?auto_87472 ?auto_87486 ) ) ( not ( = ?auto_87483 ?auto_87488 ) ) ( not ( = ?auto_87483 ?auto_87484 ) ) ( not ( = ?auto_87483 ?auto_87485 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_87480 ?auto_87481 ?auto_87475 ?auto_87474 ?auto_87476 ?auto_87477 ?auto_87472 ?auto_87473 ?auto_87478 ?auto_87479 )
      ( GET-5IMAGE-VERIFY ?auto_87472 ?auto_87473 ?auto_87475 ?auto_87474 ?auto_87476 ?auto_87477 ?auto_87478 ?auto_87479 ?auto_87480 ?auto_87481 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_87716 - DIRECTION
      ?auto_87717 - MODE
      ?auto_87719 - DIRECTION
      ?auto_87718 - MODE
      ?auto_87720 - DIRECTION
      ?auto_87721 - MODE
      ?auto_87722 - DIRECTION
      ?auto_87723 - MODE
      ?auto_87724 - DIRECTION
      ?auto_87725 - MODE
    )
    :vars
    (
      ?auto_87727 - INSTRUMENT
      ?auto_87731 - SATELLITE
      ?auto_87733 - DIRECTION
      ?auto_87726 - INSTRUMENT
      ?auto_87732 - INSTRUMENT
      ?auto_87728 - INSTRUMENT
      ?auto_87729 - INSTRUMENT
      ?auto_87730 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_87719 ?auto_87716 ) ) ( not ( = ?auto_87720 ?auto_87716 ) ) ( not ( = ?auto_87720 ?auto_87719 ) ) ( not ( = ?auto_87722 ?auto_87716 ) ) ( not ( = ?auto_87722 ?auto_87719 ) ) ( not ( = ?auto_87722 ?auto_87720 ) ) ( not ( = ?auto_87724 ?auto_87716 ) ) ( not ( = ?auto_87724 ?auto_87719 ) ) ( not ( = ?auto_87724 ?auto_87720 ) ) ( not ( = ?auto_87724 ?auto_87722 ) ) ( ON_BOARD ?auto_87727 ?auto_87731 ) ( SUPPORTS ?auto_87727 ?auto_87717 ) ( not ( = ?auto_87716 ?auto_87733 ) ) ( CALIBRATION_TARGET ?auto_87727 ?auto_87733 ) ( not ( = ?auto_87733 ?auto_87720 ) ) ( ON_BOARD ?auto_87726 ?auto_87731 ) ( not ( = ?auto_87727 ?auto_87726 ) ) ( SUPPORTS ?auto_87726 ?auto_87721 ) ( CALIBRATION_TARGET ?auto_87726 ?auto_87733 ) ( not ( = ?auto_87733 ?auto_87724 ) ) ( ON_BOARD ?auto_87732 ?auto_87731 ) ( not ( = ?auto_87726 ?auto_87732 ) ) ( SUPPORTS ?auto_87732 ?auto_87725 ) ( CALIBRATION_TARGET ?auto_87732 ?auto_87733 ) ( not ( = ?auto_87733 ?auto_87719 ) ) ( ON_BOARD ?auto_87728 ?auto_87731 ) ( not ( = ?auto_87732 ?auto_87728 ) ) ( SUPPORTS ?auto_87728 ?auto_87718 ) ( CALIBRATION_TARGET ?auto_87728 ?auto_87733 ) ( not ( = ?auto_87733 ?auto_87722 ) ) ( ON_BOARD ?auto_87729 ?auto_87731 ) ( not ( = ?auto_87728 ?auto_87729 ) ) ( SUPPORTS ?auto_87729 ?auto_87723 ) ( CALIBRATION_TARGET ?auto_87729 ?auto_87733 ) ( POWER_AVAIL ?auto_87731 ) ( POINTING ?auto_87731 ?auto_87730 ) ( not ( = ?auto_87733 ?auto_87730 ) ) ( not ( = ?auto_87722 ?auto_87730 ) ) ( not ( = ?auto_87723 ?auto_87718 ) ) ( not ( = ?auto_87719 ?auto_87730 ) ) ( not ( = ?auto_87723 ?auto_87725 ) ) ( not ( = ?auto_87718 ?auto_87725 ) ) ( not ( = ?auto_87724 ?auto_87730 ) ) ( not ( = ?auto_87732 ?auto_87729 ) ) ( not ( = ?auto_87723 ?auto_87721 ) ) ( not ( = ?auto_87718 ?auto_87721 ) ) ( not ( = ?auto_87725 ?auto_87721 ) ) ( not ( = ?auto_87720 ?auto_87730 ) ) ( not ( = ?auto_87726 ?auto_87728 ) ) ( not ( = ?auto_87726 ?auto_87729 ) ) ( not ( = ?auto_87723 ?auto_87717 ) ) ( not ( = ?auto_87718 ?auto_87717 ) ) ( not ( = ?auto_87725 ?auto_87717 ) ) ( not ( = ?auto_87721 ?auto_87717 ) ) ( not ( = ?auto_87716 ?auto_87730 ) ) ( not ( = ?auto_87727 ?auto_87732 ) ) ( not ( = ?auto_87727 ?auto_87728 ) ) ( not ( = ?auto_87727 ?auto_87729 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_87722 ?auto_87723 ?auto_87719 ?auto_87718 ?auto_87724 ?auto_87725 ?auto_87716 ?auto_87717 ?auto_87720 ?auto_87721 )
      ( GET-5IMAGE-VERIFY ?auto_87716 ?auto_87717 ?auto_87719 ?auto_87718 ?auto_87720 ?auto_87721 ?auto_87722 ?auto_87723 ?auto_87724 ?auto_87725 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_87880 - DIRECTION
      ?auto_87881 - MODE
      ?auto_87883 - DIRECTION
      ?auto_87882 - MODE
      ?auto_87884 - DIRECTION
      ?auto_87885 - MODE
      ?auto_87886 - DIRECTION
      ?auto_87887 - MODE
      ?auto_87888 - DIRECTION
      ?auto_87889 - MODE
    )
    :vars
    (
      ?auto_87891 - INSTRUMENT
      ?auto_87895 - SATELLITE
      ?auto_87897 - DIRECTION
      ?auto_87890 - INSTRUMENT
      ?auto_87896 - INSTRUMENT
      ?auto_87892 - INSTRUMENT
      ?auto_87893 - INSTRUMENT
      ?auto_87894 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_87883 ?auto_87880 ) ) ( not ( = ?auto_87884 ?auto_87880 ) ) ( not ( = ?auto_87884 ?auto_87883 ) ) ( not ( = ?auto_87886 ?auto_87880 ) ) ( not ( = ?auto_87886 ?auto_87883 ) ) ( not ( = ?auto_87886 ?auto_87884 ) ) ( not ( = ?auto_87888 ?auto_87880 ) ) ( not ( = ?auto_87888 ?auto_87883 ) ) ( not ( = ?auto_87888 ?auto_87884 ) ) ( not ( = ?auto_87888 ?auto_87886 ) ) ( ON_BOARD ?auto_87891 ?auto_87895 ) ( SUPPORTS ?auto_87891 ?auto_87881 ) ( not ( = ?auto_87880 ?auto_87897 ) ) ( CALIBRATION_TARGET ?auto_87891 ?auto_87897 ) ( not ( = ?auto_87897 ?auto_87884 ) ) ( ON_BOARD ?auto_87890 ?auto_87895 ) ( not ( = ?auto_87891 ?auto_87890 ) ) ( SUPPORTS ?auto_87890 ?auto_87885 ) ( CALIBRATION_TARGET ?auto_87890 ?auto_87897 ) ( not ( = ?auto_87897 ?auto_87886 ) ) ( ON_BOARD ?auto_87896 ?auto_87895 ) ( not ( = ?auto_87890 ?auto_87896 ) ) ( SUPPORTS ?auto_87896 ?auto_87887 ) ( CALIBRATION_TARGET ?auto_87896 ?auto_87897 ) ( not ( = ?auto_87897 ?auto_87883 ) ) ( ON_BOARD ?auto_87892 ?auto_87895 ) ( not ( = ?auto_87896 ?auto_87892 ) ) ( SUPPORTS ?auto_87892 ?auto_87882 ) ( CALIBRATION_TARGET ?auto_87892 ?auto_87897 ) ( not ( = ?auto_87897 ?auto_87888 ) ) ( ON_BOARD ?auto_87893 ?auto_87895 ) ( not ( = ?auto_87892 ?auto_87893 ) ) ( SUPPORTS ?auto_87893 ?auto_87889 ) ( CALIBRATION_TARGET ?auto_87893 ?auto_87897 ) ( POWER_AVAIL ?auto_87895 ) ( POINTING ?auto_87895 ?auto_87894 ) ( not ( = ?auto_87897 ?auto_87894 ) ) ( not ( = ?auto_87888 ?auto_87894 ) ) ( not ( = ?auto_87889 ?auto_87882 ) ) ( not ( = ?auto_87883 ?auto_87894 ) ) ( not ( = ?auto_87889 ?auto_87887 ) ) ( not ( = ?auto_87882 ?auto_87887 ) ) ( not ( = ?auto_87886 ?auto_87894 ) ) ( not ( = ?auto_87896 ?auto_87893 ) ) ( not ( = ?auto_87889 ?auto_87885 ) ) ( not ( = ?auto_87882 ?auto_87885 ) ) ( not ( = ?auto_87887 ?auto_87885 ) ) ( not ( = ?auto_87884 ?auto_87894 ) ) ( not ( = ?auto_87890 ?auto_87892 ) ) ( not ( = ?auto_87890 ?auto_87893 ) ) ( not ( = ?auto_87889 ?auto_87881 ) ) ( not ( = ?auto_87882 ?auto_87881 ) ) ( not ( = ?auto_87887 ?auto_87881 ) ) ( not ( = ?auto_87885 ?auto_87881 ) ) ( not ( = ?auto_87880 ?auto_87894 ) ) ( not ( = ?auto_87891 ?auto_87896 ) ) ( not ( = ?auto_87891 ?auto_87892 ) ) ( not ( = ?auto_87891 ?auto_87893 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_87888 ?auto_87889 ?auto_87883 ?auto_87882 ?auto_87886 ?auto_87887 ?auto_87880 ?auto_87881 ?auto_87884 ?auto_87885 )
      ( GET-5IMAGE-VERIFY ?auto_87880 ?auto_87881 ?auto_87883 ?auto_87882 ?auto_87884 ?auto_87885 ?auto_87886 ?auto_87887 ?auto_87888 ?auto_87889 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_88902 - DIRECTION
      ?auto_88903 - MODE
      ?auto_88905 - DIRECTION
      ?auto_88904 - MODE
      ?auto_88906 - DIRECTION
      ?auto_88907 - MODE
      ?auto_88908 - DIRECTION
      ?auto_88909 - MODE
      ?auto_88910 - DIRECTION
      ?auto_88911 - MODE
    )
    :vars
    (
      ?auto_88913 - INSTRUMENT
      ?auto_88917 - SATELLITE
      ?auto_88919 - DIRECTION
      ?auto_88912 - INSTRUMENT
      ?auto_88918 - INSTRUMENT
      ?auto_88914 - INSTRUMENT
      ?auto_88915 - INSTRUMENT
      ?auto_88916 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_88905 ?auto_88902 ) ) ( not ( = ?auto_88906 ?auto_88902 ) ) ( not ( = ?auto_88906 ?auto_88905 ) ) ( not ( = ?auto_88908 ?auto_88902 ) ) ( not ( = ?auto_88908 ?auto_88905 ) ) ( not ( = ?auto_88908 ?auto_88906 ) ) ( not ( = ?auto_88910 ?auto_88902 ) ) ( not ( = ?auto_88910 ?auto_88905 ) ) ( not ( = ?auto_88910 ?auto_88906 ) ) ( not ( = ?auto_88910 ?auto_88908 ) ) ( ON_BOARD ?auto_88913 ?auto_88917 ) ( SUPPORTS ?auto_88913 ?auto_88903 ) ( not ( = ?auto_88902 ?auto_88919 ) ) ( CALIBRATION_TARGET ?auto_88913 ?auto_88919 ) ( not ( = ?auto_88919 ?auto_88910 ) ) ( ON_BOARD ?auto_88912 ?auto_88917 ) ( not ( = ?auto_88913 ?auto_88912 ) ) ( SUPPORTS ?auto_88912 ?auto_88911 ) ( CALIBRATION_TARGET ?auto_88912 ?auto_88919 ) ( not ( = ?auto_88919 ?auto_88905 ) ) ( ON_BOARD ?auto_88918 ?auto_88917 ) ( not ( = ?auto_88912 ?auto_88918 ) ) ( SUPPORTS ?auto_88918 ?auto_88904 ) ( CALIBRATION_TARGET ?auto_88918 ?auto_88919 ) ( not ( = ?auto_88919 ?auto_88908 ) ) ( ON_BOARD ?auto_88914 ?auto_88917 ) ( not ( = ?auto_88918 ?auto_88914 ) ) ( SUPPORTS ?auto_88914 ?auto_88909 ) ( CALIBRATION_TARGET ?auto_88914 ?auto_88919 ) ( not ( = ?auto_88919 ?auto_88906 ) ) ( ON_BOARD ?auto_88915 ?auto_88917 ) ( not ( = ?auto_88914 ?auto_88915 ) ) ( SUPPORTS ?auto_88915 ?auto_88907 ) ( CALIBRATION_TARGET ?auto_88915 ?auto_88919 ) ( POWER_AVAIL ?auto_88917 ) ( POINTING ?auto_88917 ?auto_88916 ) ( not ( = ?auto_88919 ?auto_88916 ) ) ( not ( = ?auto_88906 ?auto_88916 ) ) ( not ( = ?auto_88907 ?auto_88909 ) ) ( not ( = ?auto_88908 ?auto_88916 ) ) ( not ( = ?auto_88907 ?auto_88904 ) ) ( not ( = ?auto_88909 ?auto_88904 ) ) ( not ( = ?auto_88905 ?auto_88916 ) ) ( not ( = ?auto_88918 ?auto_88915 ) ) ( not ( = ?auto_88907 ?auto_88911 ) ) ( not ( = ?auto_88909 ?auto_88911 ) ) ( not ( = ?auto_88904 ?auto_88911 ) ) ( not ( = ?auto_88910 ?auto_88916 ) ) ( not ( = ?auto_88912 ?auto_88914 ) ) ( not ( = ?auto_88912 ?auto_88915 ) ) ( not ( = ?auto_88907 ?auto_88903 ) ) ( not ( = ?auto_88909 ?auto_88903 ) ) ( not ( = ?auto_88904 ?auto_88903 ) ) ( not ( = ?auto_88911 ?auto_88903 ) ) ( not ( = ?auto_88902 ?auto_88916 ) ) ( not ( = ?auto_88913 ?auto_88918 ) ) ( not ( = ?auto_88913 ?auto_88914 ) ) ( not ( = ?auto_88913 ?auto_88915 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_88906 ?auto_88907 ?auto_88908 ?auto_88909 ?auto_88905 ?auto_88904 ?auto_88902 ?auto_88903 ?auto_88910 ?auto_88911 )
      ( GET-5IMAGE-VERIFY ?auto_88902 ?auto_88903 ?auto_88905 ?auto_88904 ?auto_88906 ?auto_88907 ?auto_88908 ?auto_88909 ?auto_88910 ?auto_88911 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_89066 - DIRECTION
      ?auto_89067 - MODE
      ?auto_89069 - DIRECTION
      ?auto_89068 - MODE
      ?auto_89070 - DIRECTION
      ?auto_89071 - MODE
      ?auto_89072 - DIRECTION
      ?auto_89073 - MODE
      ?auto_89074 - DIRECTION
      ?auto_89075 - MODE
    )
    :vars
    (
      ?auto_89077 - INSTRUMENT
      ?auto_89081 - SATELLITE
      ?auto_89083 - DIRECTION
      ?auto_89076 - INSTRUMENT
      ?auto_89082 - INSTRUMENT
      ?auto_89078 - INSTRUMENT
      ?auto_89079 - INSTRUMENT
      ?auto_89080 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_89069 ?auto_89066 ) ) ( not ( = ?auto_89070 ?auto_89066 ) ) ( not ( = ?auto_89070 ?auto_89069 ) ) ( not ( = ?auto_89072 ?auto_89066 ) ) ( not ( = ?auto_89072 ?auto_89069 ) ) ( not ( = ?auto_89072 ?auto_89070 ) ) ( not ( = ?auto_89074 ?auto_89066 ) ) ( not ( = ?auto_89074 ?auto_89069 ) ) ( not ( = ?auto_89074 ?auto_89070 ) ) ( not ( = ?auto_89074 ?auto_89072 ) ) ( ON_BOARD ?auto_89077 ?auto_89081 ) ( SUPPORTS ?auto_89077 ?auto_89067 ) ( not ( = ?auto_89066 ?auto_89083 ) ) ( CALIBRATION_TARGET ?auto_89077 ?auto_89083 ) ( not ( = ?auto_89083 ?auto_89072 ) ) ( ON_BOARD ?auto_89076 ?auto_89081 ) ( not ( = ?auto_89077 ?auto_89076 ) ) ( SUPPORTS ?auto_89076 ?auto_89073 ) ( CALIBRATION_TARGET ?auto_89076 ?auto_89083 ) ( not ( = ?auto_89083 ?auto_89069 ) ) ( ON_BOARD ?auto_89082 ?auto_89081 ) ( not ( = ?auto_89076 ?auto_89082 ) ) ( SUPPORTS ?auto_89082 ?auto_89068 ) ( CALIBRATION_TARGET ?auto_89082 ?auto_89083 ) ( not ( = ?auto_89083 ?auto_89074 ) ) ( ON_BOARD ?auto_89078 ?auto_89081 ) ( not ( = ?auto_89082 ?auto_89078 ) ) ( SUPPORTS ?auto_89078 ?auto_89075 ) ( CALIBRATION_TARGET ?auto_89078 ?auto_89083 ) ( not ( = ?auto_89083 ?auto_89070 ) ) ( ON_BOARD ?auto_89079 ?auto_89081 ) ( not ( = ?auto_89078 ?auto_89079 ) ) ( SUPPORTS ?auto_89079 ?auto_89071 ) ( CALIBRATION_TARGET ?auto_89079 ?auto_89083 ) ( POWER_AVAIL ?auto_89081 ) ( POINTING ?auto_89081 ?auto_89080 ) ( not ( = ?auto_89083 ?auto_89080 ) ) ( not ( = ?auto_89070 ?auto_89080 ) ) ( not ( = ?auto_89071 ?auto_89075 ) ) ( not ( = ?auto_89074 ?auto_89080 ) ) ( not ( = ?auto_89071 ?auto_89068 ) ) ( not ( = ?auto_89075 ?auto_89068 ) ) ( not ( = ?auto_89069 ?auto_89080 ) ) ( not ( = ?auto_89082 ?auto_89079 ) ) ( not ( = ?auto_89071 ?auto_89073 ) ) ( not ( = ?auto_89075 ?auto_89073 ) ) ( not ( = ?auto_89068 ?auto_89073 ) ) ( not ( = ?auto_89072 ?auto_89080 ) ) ( not ( = ?auto_89076 ?auto_89078 ) ) ( not ( = ?auto_89076 ?auto_89079 ) ) ( not ( = ?auto_89071 ?auto_89067 ) ) ( not ( = ?auto_89075 ?auto_89067 ) ) ( not ( = ?auto_89068 ?auto_89067 ) ) ( not ( = ?auto_89073 ?auto_89067 ) ) ( not ( = ?auto_89066 ?auto_89080 ) ) ( not ( = ?auto_89077 ?auto_89082 ) ) ( not ( = ?auto_89077 ?auto_89078 ) ) ( not ( = ?auto_89077 ?auto_89079 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_89070 ?auto_89071 ?auto_89074 ?auto_89075 ?auto_89069 ?auto_89068 ?auto_89066 ?auto_89067 ?auto_89072 ?auto_89073 )
      ( GET-5IMAGE-VERIFY ?auto_89066 ?auto_89067 ?auto_89069 ?auto_89068 ?auto_89070 ?auto_89071 ?auto_89072 ?auto_89073 ?auto_89074 ?auto_89075 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_89310 - DIRECTION
      ?auto_89311 - MODE
      ?auto_89313 - DIRECTION
      ?auto_89312 - MODE
      ?auto_89314 - DIRECTION
      ?auto_89315 - MODE
      ?auto_89316 - DIRECTION
      ?auto_89317 - MODE
      ?auto_89318 - DIRECTION
      ?auto_89319 - MODE
    )
    :vars
    (
      ?auto_89321 - INSTRUMENT
      ?auto_89325 - SATELLITE
      ?auto_89327 - DIRECTION
      ?auto_89320 - INSTRUMENT
      ?auto_89326 - INSTRUMENT
      ?auto_89322 - INSTRUMENT
      ?auto_89323 - INSTRUMENT
      ?auto_89324 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_89313 ?auto_89310 ) ) ( not ( = ?auto_89314 ?auto_89310 ) ) ( not ( = ?auto_89314 ?auto_89313 ) ) ( not ( = ?auto_89316 ?auto_89310 ) ) ( not ( = ?auto_89316 ?auto_89313 ) ) ( not ( = ?auto_89316 ?auto_89314 ) ) ( not ( = ?auto_89318 ?auto_89310 ) ) ( not ( = ?auto_89318 ?auto_89313 ) ) ( not ( = ?auto_89318 ?auto_89314 ) ) ( not ( = ?auto_89318 ?auto_89316 ) ) ( ON_BOARD ?auto_89321 ?auto_89325 ) ( SUPPORTS ?auto_89321 ?auto_89311 ) ( not ( = ?auto_89310 ?auto_89327 ) ) ( CALIBRATION_TARGET ?auto_89321 ?auto_89327 ) ( not ( = ?auto_89327 ?auto_89318 ) ) ( ON_BOARD ?auto_89320 ?auto_89325 ) ( not ( = ?auto_89321 ?auto_89320 ) ) ( SUPPORTS ?auto_89320 ?auto_89319 ) ( CALIBRATION_TARGET ?auto_89320 ?auto_89327 ) ( not ( = ?auto_89327 ?auto_89313 ) ) ( ON_BOARD ?auto_89326 ?auto_89325 ) ( not ( = ?auto_89320 ?auto_89326 ) ) ( SUPPORTS ?auto_89326 ?auto_89312 ) ( CALIBRATION_TARGET ?auto_89326 ?auto_89327 ) ( not ( = ?auto_89327 ?auto_89314 ) ) ( ON_BOARD ?auto_89322 ?auto_89325 ) ( not ( = ?auto_89326 ?auto_89322 ) ) ( SUPPORTS ?auto_89322 ?auto_89315 ) ( CALIBRATION_TARGET ?auto_89322 ?auto_89327 ) ( not ( = ?auto_89327 ?auto_89316 ) ) ( ON_BOARD ?auto_89323 ?auto_89325 ) ( not ( = ?auto_89322 ?auto_89323 ) ) ( SUPPORTS ?auto_89323 ?auto_89317 ) ( CALIBRATION_TARGET ?auto_89323 ?auto_89327 ) ( POWER_AVAIL ?auto_89325 ) ( POINTING ?auto_89325 ?auto_89324 ) ( not ( = ?auto_89327 ?auto_89324 ) ) ( not ( = ?auto_89316 ?auto_89324 ) ) ( not ( = ?auto_89317 ?auto_89315 ) ) ( not ( = ?auto_89314 ?auto_89324 ) ) ( not ( = ?auto_89317 ?auto_89312 ) ) ( not ( = ?auto_89315 ?auto_89312 ) ) ( not ( = ?auto_89313 ?auto_89324 ) ) ( not ( = ?auto_89326 ?auto_89323 ) ) ( not ( = ?auto_89317 ?auto_89319 ) ) ( not ( = ?auto_89315 ?auto_89319 ) ) ( not ( = ?auto_89312 ?auto_89319 ) ) ( not ( = ?auto_89318 ?auto_89324 ) ) ( not ( = ?auto_89320 ?auto_89322 ) ) ( not ( = ?auto_89320 ?auto_89323 ) ) ( not ( = ?auto_89317 ?auto_89311 ) ) ( not ( = ?auto_89315 ?auto_89311 ) ) ( not ( = ?auto_89312 ?auto_89311 ) ) ( not ( = ?auto_89319 ?auto_89311 ) ) ( not ( = ?auto_89310 ?auto_89324 ) ) ( not ( = ?auto_89321 ?auto_89326 ) ) ( not ( = ?auto_89321 ?auto_89322 ) ) ( not ( = ?auto_89321 ?auto_89323 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_89316 ?auto_89317 ?auto_89314 ?auto_89315 ?auto_89313 ?auto_89312 ?auto_89310 ?auto_89311 ?auto_89318 ?auto_89319 )
      ( GET-5IMAGE-VERIFY ?auto_89310 ?auto_89311 ?auto_89313 ?auto_89312 ?auto_89314 ?auto_89315 ?auto_89316 ?auto_89317 ?auto_89318 ?auto_89319 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_89560 - DIRECTION
      ?auto_89561 - MODE
      ?auto_89563 - DIRECTION
      ?auto_89562 - MODE
      ?auto_89564 - DIRECTION
      ?auto_89565 - MODE
      ?auto_89566 - DIRECTION
      ?auto_89567 - MODE
      ?auto_89568 - DIRECTION
      ?auto_89569 - MODE
    )
    :vars
    (
      ?auto_89571 - INSTRUMENT
      ?auto_89575 - SATELLITE
      ?auto_89577 - DIRECTION
      ?auto_89570 - INSTRUMENT
      ?auto_89576 - INSTRUMENT
      ?auto_89572 - INSTRUMENT
      ?auto_89573 - INSTRUMENT
      ?auto_89574 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_89563 ?auto_89560 ) ) ( not ( = ?auto_89564 ?auto_89560 ) ) ( not ( = ?auto_89564 ?auto_89563 ) ) ( not ( = ?auto_89566 ?auto_89560 ) ) ( not ( = ?auto_89566 ?auto_89563 ) ) ( not ( = ?auto_89566 ?auto_89564 ) ) ( not ( = ?auto_89568 ?auto_89560 ) ) ( not ( = ?auto_89568 ?auto_89563 ) ) ( not ( = ?auto_89568 ?auto_89564 ) ) ( not ( = ?auto_89568 ?auto_89566 ) ) ( ON_BOARD ?auto_89571 ?auto_89575 ) ( SUPPORTS ?auto_89571 ?auto_89561 ) ( not ( = ?auto_89560 ?auto_89577 ) ) ( CALIBRATION_TARGET ?auto_89571 ?auto_89577 ) ( not ( = ?auto_89577 ?auto_89566 ) ) ( ON_BOARD ?auto_89570 ?auto_89575 ) ( not ( = ?auto_89571 ?auto_89570 ) ) ( SUPPORTS ?auto_89570 ?auto_89567 ) ( CALIBRATION_TARGET ?auto_89570 ?auto_89577 ) ( not ( = ?auto_89577 ?auto_89563 ) ) ( ON_BOARD ?auto_89576 ?auto_89575 ) ( not ( = ?auto_89570 ?auto_89576 ) ) ( SUPPORTS ?auto_89576 ?auto_89562 ) ( CALIBRATION_TARGET ?auto_89576 ?auto_89577 ) ( not ( = ?auto_89577 ?auto_89564 ) ) ( ON_BOARD ?auto_89572 ?auto_89575 ) ( not ( = ?auto_89576 ?auto_89572 ) ) ( SUPPORTS ?auto_89572 ?auto_89565 ) ( CALIBRATION_TARGET ?auto_89572 ?auto_89577 ) ( not ( = ?auto_89577 ?auto_89568 ) ) ( ON_BOARD ?auto_89573 ?auto_89575 ) ( not ( = ?auto_89572 ?auto_89573 ) ) ( SUPPORTS ?auto_89573 ?auto_89569 ) ( CALIBRATION_TARGET ?auto_89573 ?auto_89577 ) ( POWER_AVAIL ?auto_89575 ) ( POINTING ?auto_89575 ?auto_89574 ) ( not ( = ?auto_89577 ?auto_89574 ) ) ( not ( = ?auto_89568 ?auto_89574 ) ) ( not ( = ?auto_89569 ?auto_89565 ) ) ( not ( = ?auto_89564 ?auto_89574 ) ) ( not ( = ?auto_89569 ?auto_89562 ) ) ( not ( = ?auto_89565 ?auto_89562 ) ) ( not ( = ?auto_89563 ?auto_89574 ) ) ( not ( = ?auto_89576 ?auto_89573 ) ) ( not ( = ?auto_89569 ?auto_89567 ) ) ( not ( = ?auto_89565 ?auto_89567 ) ) ( not ( = ?auto_89562 ?auto_89567 ) ) ( not ( = ?auto_89566 ?auto_89574 ) ) ( not ( = ?auto_89570 ?auto_89572 ) ) ( not ( = ?auto_89570 ?auto_89573 ) ) ( not ( = ?auto_89569 ?auto_89561 ) ) ( not ( = ?auto_89565 ?auto_89561 ) ) ( not ( = ?auto_89562 ?auto_89561 ) ) ( not ( = ?auto_89567 ?auto_89561 ) ) ( not ( = ?auto_89560 ?auto_89574 ) ) ( not ( = ?auto_89571 ?auto_89576 ) ) ( not ( = ?auto_89571 ?auto_89572 ) ) ( not ( = ?auto_89571 ?auto_89573 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_89568 ?auto_89569 ?auto_89564 ?auto_89565 ?auto_89563 ?auto_89562 ?auto_89560 ?auto_89561 ?auto_89566 ?auto_89567 )
      ( GET-5IMAGE-VERIFY ?auto_89560 ?auto_89561 ?auto_89563 ?auto_89562 ?auto_89564 ?auto_89565 ?auto_89566 ?auto_89567 ?auto_89568 ?auto_89569 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_90330 - DIRECTION
      ?auto_90331 - MODE
      ?auto_90333 - DIRECTION
      ?auto_90332 - MODE
      ?auto_90334 - DIRECTION
      ?auto_90335 - MODE
      ?auto_90336 - DIRECTION
      ?auto_90337 - MODE
      ?auto_90338 - DIRECTION
      ?auto_90339 - MODE
    )
    :vars
    (
      ?auto_90341 - INSTRUMENT
      ?auto_90345 - SATELLITE
      ?auto_90347 - DIRECTION
      ?auto_90340 - INSTRUMENT
      ?auto_90346 - INSTRUMENT
      ?auto_90342 - INSTRUMENT
      ?auto_90343 - INSTRUMENT
      ?auto_90344 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_90333 ?auto_90330 ) ) ( not ( = ?auto_90334 ?auto_90330 ) ) ( not ( = ?auto_90334 ?auto_90333 ) ) ( not ( = ?auto_90336 ?auto_90330 ) ) ( not ( = ?auto_90336 ?auto_90333 ) ) ( not ( = ?auto_90336 ?auto_90334 ) ) ( not ( = ?auto_90338 ?auto_90330 ) ) ( not ( = ?auto_90338 ?auto_90333 ) ) ( not ( = ?auto_90338 ?auto_90334 ) ) ( not ( = ?auto_90338 ?auto_90336 ) ) ( ON_BOARD ?auto_90341 ?auto_90345 ) ( SUPPORTS ?auto_90341 ?auto_90331 ) ( not ( = ?auto_90330 ?auto_90347 ) ) ( CALIBRATION_TARGET ?auto_90341 ?auto_90347 ) ( not ( = ?auto_90347 ?auto_90334 ) ) ( ON_BOARD ?auto_90340 ?auto_90345 ) ( not ( = ?auto_90341 ?auto_90340 ) ) ( SUPPORTS ?auto_90340 ?auto_90335 ) ( CALIBRATION_TARGET ?auto_90340 ?auto_90347 ) ( not ( = ?auto_90347 ?auto_90333 ) ) ( ON_BOARD ?auto_90346 ?auto_90345 ) ( not ( = ?auto_90340 ?auto_90346 ) ) ( SUPPORTS ?auto_90346 ?auto_90332 ) ( CALIBRATION_TARGET ?auto_90346 ?auto_90347 ) ( not ( = ?auto_90347 ?auto_90338 ) ) ( ON_BOARD ?auto_90342 ?auto_90345 ) ( not ( = ?auto_90346 ?auto_90342 ) ) ( SUPPORTS ?auto_90342 ?auto_90339 ) ( CALIBRATION_TARGET ?auto_90342 ?auto_90347 ) ( not ( = ?auto_90347 ?auto_90336 ) ) ( ON_BOARD ?auto_90343 ?auto_90345 ) ( not ( = ?auto_90342 ?auto_90343 ) ) ( SUPPORTS ?auto_90343 ?auto_90337 ) ( CALIBRATION_TARGET ?auto_90343 ?auto_90347 ) ( POWER_AVAIL ?auto_90345 ) ( POINTING ?auto_90345 ?auto_90344 ) ( not ( = ?auto_90347 ?auto_90344 ) ) ( not ( = ?auto_90336 ?auto_90344 ) ) ( not ( = ?auto_90337 ?auto_90339 ) ) ( not ( = ?auto_90338 ?auto_90344 ) ) ( not ( = ?auto_90337 ?auto_90332 ) ) ( not ( = ?auto_90339 ?auto_90332 ) ) ( not ( = ?auto_90333 ?auto_90344 ) ) ( not ( = ?auto_90346 ?auto_90343 ) ) ( not ( = ?auto_90337 ?auto_90335 ) ) ( not ( = ?auto_90339 ?auto_90335 ) ) ( not ( = ?auto_90332 ?auto_90335 ) ) ( not ( = ?auto_90334 ?auto_90344 ) ) ( not ( = ?auto_90340 ?auto_90342 ) ) ( not ( = ?auto_90340 ?auto_90343 ) ) ( not ( = ?auto_90337 ?auto_90331 ) ) ( not ( = ?auto_90339 ?auto_90331 ) ) ( not ( = ?auto_90332 ?auto_90331 ) ) ( not ( = ?auto_90335 ?auto_90331 ) ) ( not ( = ?auto_90330 ?auto_90344 ) ) ( not ( = ?auto_90341 ?auto_90346 ) ) ( not ( = ?auto_90341 ?auto_90342 ) ) ( not ( = ?auto_90341 ?auto_90343 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_90336 ?auto_90337 ?auto_90338 ?auto_90339 ?auto_90333 ?auto_90332 ?auto_90330 ?auto_90331 ?auto_90334 ?auto_90335 )
      ( GET-5IMAGE-VERIFY ?auto_90330 ?auto_90331 ?auto_90333 ?auto_90332 ?auto_90334 ?auto_90335 ?auto_90336 ?auto_90337 ?auto_90338 ?auto_90339 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_90408 - DIRECTION
      ?auto_90409 - MODE
      ?auto_90411 - DIRECTION
      ?auto_90410 - MODE
      ?auto_90412 - DIRECTION
      ?auto_90413 - MODE
      ?auto_90414 - DIRECTION
      ?auto_90415 - MODE
      ?auto_90416 - DIRECTION
      ?auto_90417 - MODE
    )
    :vars
    (
      ?auto_90419 - INSTRUMENT
      ?auto_90423 - SATELLITE
      ?auto_90425 - DIRECTION
      ?auto_90418 - INSTRUMENT
      ?auto_90424 - INSTRUMENT
      ?auto_90420 - INSTRUMENT
      ?auto_90421 - INSTRUMENT
      ?auto_90422 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_90411 ?auto_90408 ) ) ( not ( = ?auto_90412 ?auto_90408 ) ) ( not ( = ?auto_90412 ?auto_90411 ) ) ( not ( = ?auto_90414 ?auto_90408 ) ) ( not ( = ?auto_90414 ?auto_90411 ) ) ( not ( = ?auto_90414 ?auto_90412 ) ) ( not ( = ?auto_90416 ?auto_90408 ) ) ( not ( = ?auto_90416 ?auto_90411 ) ) ( not ( = ?auto_90416 ?auto_90412 ) ) ( not ( = ?auto_90416 ?auto_90414 ) ) ( ON_BOARD ?auto_90419 ?auto_90423 ) ( SUPPORTS ?auto_90419 ?auto_90409 ) ( not ( = ?auto_90408 ?auto_90425 ) ) ( CALIBRATION_TARGET ?auto_90419 ?auto_90425 ) ( not ( = ?auto_90425 ?auto_90412 ) ) ( ON_BOARD ?auto_90418 ?auto_90423 ) ( not ( = ?auto_90419 ?auto_90418 ) ) ( SUPPORTS ?auto_90418 ?auto_90413 ) ( CALIBRATION_TARGET ?auto_90418 ?auto_90425 ) ( not ( = ?auto_90425 ?auto_90411 ) ) ( ON_BOARD ?auto_90424 ?auto_90423 ) ( not ( = ?auto_90418 ?auto_90424 ) ) ( SUPPORTS ?auto_90424 ?auto_90410 ) ( CALIBRATION_TARGET ?auto_90424 ?auto_90425 ) ( not ( = ?auto_90425 ?auto_90414 ) ) ( ON_BOARD ?auto_90420 ?auto_90423 ) ( not ( = ?auto_90424 ?auto_90420 ) ) ( SUPPORTS ?auto_90420 ?auto_90415 ) ( CALIBRATION_TARGET ?auto_90420 ?auto_90425 ) ( not ( = ?auto_90425 ?auto_90416 ) ) ( ON_BOARD ?auto_90421 ?auto_90423 ) ( not ( = ?auto_90420 ?auto_90421 ) ) ( SUPPORTS ?auto_90421 ?auto_90417 ) ( CALIBRATION_TARGET ?auto_90421 ?auto_90425 ) ( POWER_AVAIL ?auto_90423 ) ( POINTING ?auto_90423 ?auto_90422 ) ( not ( = ?auto_90425 ?auto_90422 ) ) ( not ( = ?auto_90416 ?auto_90422 ) ) ( not ( = ?auto_90417 ?auto_90415 ) ) ( not ( = ?auto_90414 ?auto_90422 ) ) ( not ( = ?auto_90417 ?auto_90410 ) ) ( not ( = ?auto_90415 ?auto_90410 ) ) ( not ( = ?auto_90411 ?auto_90422 ) ) ( not ( = ?auto_90424 ?auto_90421 ) ) ( not ( = ?auto_90417 ?auto_90413 ) ) ( not ( = ?auto_90415 ?auto_90413 ) ) ( not ( = ?auto_90410 ?auto_90413 ) ) ( not ( = ?auto_90412 ?auto_90422 ) ) ( not ( = ?auto_90418 ?auto_90420 ) ) ( not ( = ?auto_90418 ?auto_90421 ) ) ( not ( = ?auto_90417 ?auto_90409 ) ) ( not ( = ?auto_90415 ?auto_90409 ) ) ( not ( = ?auto_90410 ?auto_90409 ) ) ( not ( = ?auto_90413 ?auto_90409 ) ) ( not ( = ?auto_90408 ?auto_90422 ) ) ( not ( = ?auto_90419 ?auto_90424 ) ) ( not ( = ?auto_90419 ?auto_90420 ) ) ( not ( = ?auto_90419 ?auto_90421 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_90416 ?auto_90417 ?auto_90414 ?auto_90415 ?auto_90411 ?auto_90410 ?auto_90408 ?auto_90409 ?auto_90412 ?auto_90413 )
      ( GET-5IMAGE-VERIFY ?auto_90408 ?auto_90409 ?auto_90411 ?auto_90410 ?auto_90412 ?auto_90413 ?auto_90414 ?auto_90415 ?auto_90416 ?auto_90417 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_91516 - DIRECTION
      ?auto_91517 - MODE
      ?auto_91519 - DIRECTION
      ?auto_91518 - MODE
      ?auto_91520 - DIRECTION
      ?auto_91521 - MODE
      ?auto_91522 - DIRECTION
      ?auto_91523 - MODE
      ?auto_91524 - DIRECTION
      ?auto_91525 - MODE
    )
    :vars
    (
      ?auto_91527 - INSTRUMENT
      ?auto_91531 - SATELLITE
      ?auto_91533 - DIRECTION
      ?auto_91526 - INSTRUMENT
      ?auto_91532 - INSTRUMENT
      ?auto_91528 - INSTRUMENT
      ?auto_91529 - INSTRUMENT
      ?auto_91530 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_91519 ?auto_91516 ) ) ( not ( = ?auto_91520 ?auto_91516 ) ) ( not ( = ?auto_91520 ?auto_91519 ) ) ( not ( = ?auto_91522 ?auto_91516 ) ) ( not ( = ?auto_91522 ?auto_91519 ) ) ( not ( = ?auto_91522 ?auto_91520 ) ) ( not ( = ?auto_91524 ?auto_91516 ) ) ( not ( = ?auto_91524 ?auto_91519 ) ) ( not ( = ?auto_91524 ?auto_91520 ) ) ( not ( = ?auto_91524 ?auto_91522 ) ) ( ON_BOARD ?auto_91527 ?auto_91531 ) ( SUPPORTS ?auto_91527 ?auto_91517 ) ( not ( = ?auto_91516 ?auto_91533 ) ) ( CALIBRATION_TARGET ?auto_91527 ?auto_91533 ) ( not ( = ?auto_91533 ?auto_91519 ) ) ( ON_BOARD ?auto_91526 ?auto_91531 ) ( not ( = ?auto_91527 ?auto_91526 ) ) ( SUPPORTS ?auto_91526 ?auto_91518 ) ( CALIBRATION_TARGET ?auto_91526 ?auto_91533 ) ( not ( = ?auto_91533 ?auto_91524 ) ) ( ON_BOARD ?auto_91532 ?auto_91531 ) ( not ( = ?auto_91526 ?auto_91532 ) ) ( SUPPORTS ?auto_91532 ?auto_91525 ) ( CALIBRATION_TARGET ?auto_91532 ?auto_91533 ) ( not ( = ?auto_91533 ?auto_91522 ) ) ( ON_BOARD ?auto_91528 ?auto_91531 ) ( not ( = ?auto_91532 ?auto_91528 ) ) ( SUPPORTS ?auto_91528 ?auto_91523 ) ( CALIBRATION_TARGET ?auto_91528 ?auto_91533 ) ( not ( = ?auto_91533 ?auto_91520 ) ) ( ON_BOARD ?auto_91529 ?auto_91531 ) ( not ( = ?auto_91528 ?auto_91529 ) ) ( SUPPORTS ?auto_91529 ?auto_91521 ) ( CALIBRATION_TARGET ?auto_91529 ?auto_91533 ) ( POWER_AVAIL ?auto_91531 ) ( POINTING ?auto_91531 ?auto_91530 ) ( not ( = ?auto_91533 ?auto_91530 ) ) ( not ( = ?auto_91520 ?auto_91530 ) ) ( not ( = ?auto_91521 ?auto_91523 ) ) ( not ( = ?auto_91522 ?auto_91530 ) ) ( not ( = ?auto_91521 ?auto_91525 ) ) ( not ( = ?auto_91523 ?auto_91525 ) ) ( not ( = ?auto_91524 ?auto_91530 ) ) ( not ( = ?auto_91532 ?auto_91529 ) ) ( not ( = ?auto_91521 ?auto_91518 ) ) ( not ( = ?auto_91523 ?auto_91518 ) ) ( not ( = ?auto_91525 ?auto_91518 ) ) ( not ( = ?auto_91519 ?auto_91530 ) ) ( not ( = ?auto_91526 ?auto_91528 ) ) ( not ( = ?auto_91526 ?auto_91529 ) ) ( not ( = ?auto_91521 ?auto_91517 ) ) ( not ( = ?auto_91523 ?auto_91517 ) ) ( not ( = ?auto_91525 ?auto_91517 ) ) ( not ( = ?auto_91518 ?auto_91517 ) ) ( not ( = ?auto_91516 ?auto_91530 ) ) ( not ( = ?auto_91527 ?auto_91532 ) ) ( not ( = ?auto_91527 ?auto_91528 ) ) ( not ( = ?auto_91527 ?auto_91529 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_91520 ?auto_91521 ?auto_91522 ?auto_91523 ?auto_91524 ?auto_91525 ?auto_91516 ?auto_91517 ?auto_91519 ?auto_91518 )
      ( GET-5IMAGE-VERIFY ?auto_91516 ?auto_91517 ?auto_91519 ?auto_91518 ?auto_91520 ?auto_91521 ?auto_91522 ?auto_91523 ?auto_91524 ?auto_91525 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_91594 - DIRECTION
      ?auto_91595 - MODE
      ?auto_91597 - DIRECTION
      ?auto_91596 - MODE
      ?auto_91598 - DIRECTION
      ?auto_91599 - MODE
      ?auto_91600 - DIRECTION
      ?auto_91601 - MODE
      ?auto_91602 - DIRECTION
      ?auto_91603 - MODE
    )
    :vars
    (
      ?auto_91605 - INSTRUMENT
      ?auto_91609 - SATELLITE
      ?auto_91611 - DIRECTION
      ?auto_91604 - INSTRUMENT
      ?auto_91610 - INSTRUMENT
      ?auto_91606 - INSTRUMENT
      ?auto_91607 - INSTRUMENT
      ?auto_91608 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_91597 ?auto_91594 ) ) ( not ( = ?auto_91598 ?auto_91594 ) ) ( not ( = ?auto_91598 ?auto_91597 ) ) ( not ( = ?auto_91600 ?auto_91594 ) ) ( not ( = ?auto_91600 ?auto_91597 ) ) ( not ( = ?auto_91600 ?auto_91598 ) ) ( not ( = ?auto_91602 ?auto_91594 ) ) ( not ( = ?auto_91602 ?auto_91597 ) ) ( not ( = ?auto_91602 ?auto_91598 ) ) ( not ( = ?auto_91602 ?auto_91600 ) ) ( ON_BOARD ?auto_91605 ?auto_91609 ) ( SUPPORTS ?auto_91605 ?auto_91595 ) ( not ( = ?auto_91594 ?auto_91611 ) ) ( CALIBRATION_TARGET ?auto_91605 ?auto_91611 ) ( not ( = ?auto_91611 ?auto_91597 ) ) ( ON_BOARD ?auto_91604 ?auto_91609 ) ( not ( = ?auto_91605 ?auto_91604 ) ) ( SUPPORTS ?auto_91604 ?auto_91596 ) ( CALIBRATION_TARGET ?auto_91604 ?auto_91611 ) ( not ( = ?auto_91611 ?auto_91600 ) ) ( ON_BOARD ?auto_91610 ?auto_91609 ) ( not ( = ?auto_91604 ?auto_91610 ) ) ( SUPPORTS ?auto_91610 ?auto_91601 ) ( CALIBRATION_TARGET ?auto_91610 ?auto_91611 ) ( not ( = ?auto_91611 ?auto_91602 ) ) ( ON_BOARD ?auto_91606 ?auto_91609 ) ( not ( = ?auto_91610 ?auto_91606 ) ) ( SUPPORTS ?auto_91606 ?auto_91603 ) ( CALIBRATION_TARGET ?auto_91606 ?auto_91611 ) ( not ( = ?auto_91611 ?auto_91598 ) ) ( ON_BOARD ?auto_91607 ?auto_91609 ) ( not ( = ?auto_91606 ?auto_91607 ) ) ( SUPPORTS ?auto_91607 ?auto_91599 ) ( CALIBRATION_TARGET ?auto_91607 ?auto_91611 ) ( POWER_AVAIL ?auto_91609 ) ( POINTING ?auto_91609 ?auto_91608 ) ( not ( = ?auto_91611 ?auto_91608 ) ) ( not ( = ?auto_91598 ?auto_91608 ) ) ( not ( = ?auto_91599 ?auto_91603 ) ) ( not ( = ?auto_91602 ?auto_91608 ) ) ( not ( = ?auto_91599 ?auto_91601 ) ) ( not ( = ?auto_91603 ?auto_91601 ) ) ( not ( = ?auto_91600 ?auto_91608 ) ) ( not ( = ?auto_91610 ?auto_91607 ) ) ( not ( = ?auto_91599 ?auto_91596 ) ) ( not ( = ?auto_91603 ?auto_91596 ) ) ( not ( = ?auto_91601 ?auto_91596 ) ) ( not ( = ?auto_91597 ?auto_91608 ) ) ( not ( = ?auto_91604 ?auto_91606 ) ) ( not ( = ?auto_91604 ?auto_91607 ) ) ( not ( = ?auto_91599 ?auto_91595 ) ) ( not ( = ?auto_91603 ?auto_91595 ) ) ( not ( = ?auto_91601 ?auto_91595 ) ) ( not ( = ?auto_91596 ?auto_91595 ) ) ( not ( = ?auto_91594 ?auto_91608 ) ) ( not ( = ?auto_91605 ?auto_91610 ) ) ( not ( = ?auto_91605 ?auto_91606 ) ) ( not ( = ?auto_91605 ?auto_91607 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_91598 ?auto_91599 ?auto_91602 ?auto_91603 ?auto_91600 ?auto_91601 ?auto_91594 ?auto_91595 ?auto_91597 ?auto_91596 )
      ( GET-5IMAGE-VERIFY ?auto_91594 ?auto_91595 ?auto_91597 ?auto_91596 ?auto_91598 ?auto_91599 ?auto_91600 ?auto_91601 ?auto_91602 ?auto_91603 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_91924 - DIRECTION
      ?auto_91925 - MODE
      ?auto_91927 - DIRECTION
      ?auto_91926 - MODE
      ?auto_91928 - DIRECTION
      ?auto_91929 - MODE
      ?auto_91930 - DIRECTION
      ?auto_91931 - MODE
      ?auto_91932 - DIRECTION
      ?auto_91933 - MODE
    )
    :vars
    (
      ?auto_91935 - INSTRUMENT
      ?auto_91939 - SATELLITE
      ?auto_91941 - DIRECTION
      ?auto_91934 - INSTRUMENT
      ?auto_91940 - INSTRUMENT
      ?auto_91936 - INSTRUMENT
      ?auto_91937 - INSTRUMENT
      ?auto_91938 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_91927 ?auto_91924 ) ) ( not ( = ?auto_91928 ?auto_91924 ) ) ( not ( = ?auto_91928 ?auto_91927 ) ) ( not ( = ?auto_91930 ?auto_91924 ) ) ( not ( = ?auto_91930 ?auto_91927 ) ) ( not ( = ?auto_91930 ?auto_91928 ) ) ( not ( = ?auto_91932 ?auto_91924 ) ) ( not ( = ?auto_91932 ?auto_91927 ) ) ( not ( = ?auto_91932 ?auto_91928 ) ) ( not ( = ?auto_91932 ?auto_91930 ) ) ( ON_BOARD ?auto_91935 ?auto_91939 ) ( SUPPORTS ?auto_91935 ?auto_91925 ) ( not ( = ?auto_91924 ?auto_91941 ) ) ( CALIBRATION_TARGET ?auto_91935 ?auto_91941 ) ( not ( = ?auto_91941 ?auto_91927 ) ) ( ON_BOARD ?auto_91934 ?auto_91939 ) ( not ( = ?auto_91935 ?auto_91934 ) ) ( SUPPORTS ?auto_91934 ?auto_91926 ) ( CALIBRATION_TARGET ?auto_91934 ?auto_91941 ) ( not ( = ?auto_91941 ?auto_91932 ) ) ( ON_BOARD ?auto_91940 ?auto_91939 ) ( not ( = ?auto_91934 ?auto_91940 ) ) ( SUPPORTS ?auto_91940 ?auto_91933 ) ( CALIBRATION_TARGET ?auto_91940 ?auto_91941 ) ( not ( = ?auto_91941 ?auto_91928 ) ) ( ON_BOARD ?auto_91936 ?auto_91939 ) ( not ( = ?auto_91940 ?auto_91936 ) ) ( SUPPORTS ?auto_91936 ?auto_91929 ) ( CALIBRATION_TARGET ?auto_91936 ?auto_91941 ) ( not ( = ?auto_91941 ?auto_91930 ) ) ( ON_BOARD ?auto_91937 ?auto_91939 ) ( not ( = ?auto_91936 ?auto_91937 ) ) ( SUPPORTS ?auto_91937 ?auto_91931 ) ( CALIBRATION_TARGET ?auto_91937 ?auto_91941 ) ( POWER_AVAIL ?auto_91939 ) ( POINTING ?auto_91939 ?auto_91938 ) ( not ( = ?auto_91941 ?auto_91938 ) ) ( not ( = ?auto_91930 ?auto_91938 ) ) ( not ( = ?auto_91931 ?auto_91929 ) ) ( not ( = ?auto_91928 ?auto_91938 ) ) ( not ( = ?auto_91931 ?auto_91933 ) ) ( not ( = ?auto_91929 ?auto_91933 ) ) ( not ( = ?auto_91932 ?auto_91938 ) ) ( not ( = ?auto_91940 ?auto_91937 ) ) ( not ( = ?auto_91931 ?auto_91926 ) ) ( not ( = ?auto_91929 ?auto_91926 ) ) ( not ( = ?auto_91933 ?auto_91926 ) ) ( not ( = ?auto_91927 ?auto_91938 ) ) ( not ( = ?auto_91934 ?auto_91936 ) ) ( not ( = ?auto_91934 ?auto_91937 ) ) ( not ( = ?auto_91931 ?auto_91925 ) ) ( not ( = ?auto_91929 ?auto_91925 ) ) ( not ( = ?auto_91933 ?auto_91925 ) ) ( not ( = ?auto_91926 ?auto_91925 ) ) ( not ( = ?auto_91924 ?auto_91938 ) ) ( not ( = ?auto_91935 ?auto_91940 ) ) ( not ( = ?auto_91935 ?auto_91936 ) ) ( not ( = ?auto_91935 ?auto_91937 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_91930 ?auto_91931 ?auto_91928 ?auto_91929 ?auto_91932 ?auto_91933 ?auto_91924 ?auto_91925 ?auto_91927 ?auto_91926 )
      ( GET-5IMAGE-VERIFY ?auto_91924 ?auto_91925 ?auto_91927 ?auto_91926 ?auto_91928 ?auto_91929 ?auto_91930 ?auto_91931 ?auto_91932 ?auto_91933 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_92088 - DIRECTION
      ?auto_92089 - MODE
      ?auto_92091 - DIRECTION
      ?auto_92090 - MODE
      ?auto_92092 - DIRECTION
      ?auto_92093 - MODE
      ?auto_92094 - DIRECTION
      ?auto_92095 - MODE
      ?auto_92096 - DIRECTION
      ?auto_92097 - MODE
    )
    :vars
    (
      ?auto_92099 - INSTRUMENT
      ?auto_92103 - SATELLITE
      ?auto_92105 - DIRECTION
      ?auto_92098 - INSTRUMENT
      ?auto_92104 - INSTRUMENT
      ?auto_92100 - INSTRUMENT
      ?auto_92101 - INSTRUMENT
      ?auto_92102 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_92091 ?auto_92088 ) ) ( not ( = ?auto_92092 ?auto_92088 ) ) ( not ( = ?auto_92092 ?auto_92091 ) ) ( not ( = ?auto_92094 ?auto_92088 ) ) ( not ( = ?auto_92094 ?auto_92091 ) ) ( not ( = ?auto_92094 ?auto_92092 ) ) ( not ( = ?auto_92096 ?auto_92088 ) ) ( not ( = ?auto_92096 ?auto_92091 ) ) ( not ( = ?auto_92096 ?auto_92092 ) ) ( not ( = ?auto_92096 ?auto_92094 ) ) ( ON_BOARD ?auto_92099 ?auto_92103 ) ( SUPPORTS ?auto_92099 ?auto_92089 ) ( not ( = ?auto_92088 ?auto_92105 ) ) ( CALIBRATION_TARGET ?auto_92099 ?auto_92105 ) ( not ( = ?auto_92105 ?auto_92091 ) ) ( ON_BOARD ?auto_92098 ?auto_92103 ) ( not ( = ?auto_92099 ?auto_92098 ) ) ( SUPPORTS ?auto_92098 ?auto_92090 ) ( CALIBRATION_TARGET ?auto_92098 ?auto_92105 ) ( not ( = ?auto_92105 ?auto_92094 ) ) ( ON_BOARD ?auto_92104 ?auto_92103 ) ( not ( = ?auto_92098 ?auto_92104 ) ) ( SUPPORTS ?auto_92104 ?auto_92095 ) ( CALIBRATION_TARGET ?auto_92104 ?auto_92105 ) ( not ( = ?auto_92105 ?auto_92092 ) ) ( ON_BOARD ?auto_92100 ?auto_92103 ) ( not ( = ?auto_92104 ?auto_92100 ) ) ( SUPPORTS ?auto_92100 ?auto_92093 ) ( CALIBRATION_TARGET ?auto_92100 ?auto_92105 ) ( not ( = ?auto_92105 ?auto_92096 ) ) ( ON_BOARD ?auto_92101 ?auto_92103 ) ( not ( = ?auto_92100 ?auto_92101 ) ) ( SUPPORTS ?auto_92101 ?auto_92097 ) ( CALIBRATION_TARGET ?auto_92101 ?auto_92105 ) ( POWER_AVAIL ?auto_92103 ) ( POINTING ?auto_92103 ?auto_92102 ) ( not ( = ?auto_92105 ?auto_92102 ) ) ( not ( = ?auto_92096 ?auto_92102 ) ) ( not ( = ?auto_92097 ?auto_92093 ) ) ( not ( = ?auto_92092 ?auto_92102 ) ) ( not ( = ?auto_92097 ?auto_92095 ) ) ( not ( = ?auto_92093 ?auto_92095 ) ) ( not ( = ?auto_92094 ?auto_92102 ) ) ( not ( = ?auto_92104 ?auto_92101 ) ) ( not ( = ?auto_92097 ?auto_92090 ) ) ( not ( = ?auto_92093 ?auto_92090 ) ) ( not ( = ?auto_92095 ?auto_92090 ) ) ( not ( = ?auto_92091 ?auto_92102 ) ) ( not ( = ?auto_92098 ?auto_92100 ) ) ( not ( = ?auto_92098 ?auto_92101 ) ) ( not ( = ?auto_92097 ?auto_92089 ) ) ( not ( = ?auto_92093 ?auto_92089 ) ) ( not ( = ?auto_92095 ?auto_92089 ) ) ( not ( = ?auto_92090 ?auto_92089 ) ) ( not ( = ?auto_92088 ?auto_92102 ) ) ( not ( = ?auto_92099 ?auto_92104 ) ) ( not ( = ?auto_92099 ?auto_92100 ) ) ( not ( = ?auto_92099 ?auto_92101 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_92096 ?auto_92097 ?auto_92092 ?auto_92093 ?auto_92094 ?auto_92095 ?auto_92088 ?auto_92089 ?auto_92091 ?auto_92090 )
      ( GET-5IMAGE-VERIFY ?auto_92088 ?auto_92089 ?auto_92091 ?auto_92090 ?auto_92092 ?auto_92093 ?auto_92094 ?auto_92095 ?auto_92096 ?auto_92097 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_92418 - DIRECTION
      ?auto_92419 - MODE
      ?auto_92421 - DIRECTION
      ?auto_92420 - MODE
      ?auto_92422 - DIRECTION
      ?auto_92423 - MODE
      ?auto_92424 - DIRECTION
      ?auto_92425 - MODE
      ?auto_92426 - DIRECTION
      ?auto_92427 - MODE
    )
    :vars
    (
      ?auto_92429 - INSTRUMENT
      ?auto_92433 - SATELLITE
      ?auto_92435 - DIRECTION
      ?auto_92428 - INSTRUMENT
      ?auto_92434 - INSTRUMENT
      ?auto_92430 - INSTRUMENT
      ?auto_92431 - INSTRUMENT
      ?auto_92432 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_92421 ?auto_92418 ) ) ( not ( = ?auto_92422 ?auto_92418 ) ) ( not ( = ?auto_92422 ?auto_92421 ) ) ( not ( = ?auto_92424 ?auto_92418 ) ) ( not ( = ?auto_92424 ?auto_92421 ) ) ( not ( = ?auto_92424 ?auto_92422 ) ) ( not ( = ?auto_92426 ?auto_92418 ) ) ( not ( = ?auto_92426 ?auto_92421 ) ) ( not ( = ?auto_92426 ?auto_92422 ) ) ( not ( = ?auto_92426 ?auto_92424 ) ) ( ON_BOARD ?auto_92429 ?auto_92433 ) ( SUPPORTS ?auto_92429 ?auto_92419 ) ( not ( = ?auto_92418 ?auto_92435 ) ) ( CALIBRATION_TARGET ?auto_92429 ?auto_92435 ) ( not ( = ?auto_92435 ?auto_92421 ) ) ( ON_BOARD ?auto_92428 ?auto_92433 ) ( not ( = ?auto_92429 ?auto_92428 ) ) ( SUPPORTS ?auto_92428 ?auto_92420 ) ( CALIBRATION_TARGET ?auto_92428 ?auto_92435 ) ( not ( = ?auto_92435 ?auto_92422 ) ) ( ON_BOARD ?auto_92434 ?auto_92433 ) ( not ( = ?auto_92428 ?auto_92434 ) ) ( SUPPORTS ?auto_92434 ?auto_92423 ) ( CALIBRATION_TARGET ?auto_92434 ?auto_92435 ) ( not ( = ?auto_92435 ?auto_92426 ) ) ( ON_BOARD ?auto_92430 ?auto_92433 ) ( not ( = ?auto_92434 ?auto_92430 ) ) ( SUPPORTS ?auto_92430 ?auto_92427 ) ( CALIBRATION_TARGET ?auto_92430 ?auto_92435 ) ( not ( = ?auto_92435 ?auto_92424 ) ) ( ON_BOARD ?auto_92431 ?auto_92433 ) ( not ( = ?auto_92430 ?auto_92431 ) ) ( SUPPORTS ?auto_92431 ?auto_92425 ) ( CALIBRATION_TARGET ?auto_92431 ?auto_92435 ) ( POWER_AVAIL ?auto_92433 ) ( POINTING ?auto_92433 ?auto_92432 ) ( not ( = ?auto_92435 ?auto_92432 ) ) ( not ( = ?auto_92424 ?auto_92432 ) ) ( not ( = ?auto_92425 ?auto_92427 ) ) ( not ( = ?auto_92426 ?auto_92432 ) ) ( not ( = ?auto_92425 ?auto_92423 ) ) ( not ( = ?auto_92427 ?auto_92423 ) ) ( not ( = ?auto_92422 ?auto_92432 ) ) ( not ( = ?auto_92434 ?auto_92431 ) ) ( not ( = ?auto_92425 ?auto_92420 ) ) ( not ( = ?auto_92427 ?auto_92420 ) ) ( not ( = ?auto_92423 ?auto_92420 ) ) ( not ( = ?auto_92421 ?auto_92432 ) ) ( not ( = ?auto_92428 ?auto_92430 ) ) ( not ( = ?auto_92428 ?auto_92431 ) ) ( not ( = ?auto_92425 ?auto_92419 ) ) ( not ( = ?auto_92427 ?auto_92419 ) ) ( not ( = ?auto_92423 ?auto_92419 ) ) ( not ( = ?auto_92420 ?auto_92419 ) ) ( not ( = ?auto_92418 ?auto_92432 ) ) ( not ( = ?auto_92429 ?auto_92434 ) ) ( not ( = ?auto_92429 ?auto_92430 ) ) ( not ( = ?auto_92429 ?auto_92431 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_92424 ?auto_92425 ?auto_92426 ?auto_92427 ?auto_92422 ?auto_92423 ?auto_92418 ?auto_92419 ?auto_92421 ?auto_92420 )
      ( GET-5IMAGE-VERIFY ?auto_92418 ?auto_92419 ?auto_92421 ?auto_92420 ?auto_92422 ?auto_92423 ?auto_92424 ?auto_92425 ?auto_92426 ?auto_92427 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_92496 - DIRECTION
      ?auto_92497 - MODE
      ?auto_92499 - DIRECTION
      ?auto_92498 - MODE
      ?auto_92500 - DIRECTION
      ?auto_92501 - MODE
      ?auto_92502 - DIRECTION
      ?auto_92503 - MODE
      ?auto_92504 - DIRECTION
      ?auto_92505 - MODE
    )
    :vars
    (
      ?auto_92507 - INSTRUMENT
      ?auto_92511 - SATELLITE
      ?auto_92513 - DIRECTION
      ?auto_92506 - INSTRUMENT
      ?auto_92512 - INSTRUMENT
      ?auto_92508 - INSTRUMENT
      ?auto_92509 - INSTRUMENT
      ?auto_92510 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_92499 ?auto_92496 ) ) ( not ( = ?auto_92500 ?auto_92496 ) ) ( not ( = ?auto_92500 ?auto_92499 ) ) ( not ( = ?auto_92502 ?auto_92496 ) ) ( not ( = ?auto_92502 ?auto_92499 ) ) ( not ( = ?auto_92502 ?auto_92500 ) ) ( not ( = ?auto_92504 ?auto_92496 ) ) ( not ( = ?auto_92504 ?auto_92499 ) ) ( not ( = ?auto_92504 ?auto_92500 ) ) ( not ( = ?auto_92504 ?auto_92502 ) ) ( ON_BOARD ?auto_92507 ?auto_92511 ) ( SUPPORTS ?auto_92507 ?auto_92497 ) ( not ( = ?auto_92496 ?auto_92513 ) ) ( CALIBRATION_TARGET ?auto_92507 ?auto_92513 ) ( not ( = ?auto_92513 ?auto_92499 ) ) ( ON_BOARD ?auto_92506 ?auto_92511 ) ( not ( = ?auto_92507 ?auto_92506 ) ) ( SUPPORTS ?auto_92506 ?auto_92498 ) ( CALIBRATION_TARGET ?auto_92506 ?auto_92513 ) ( not ( = ?auto_92513 ?auto_92500 ) ) ( ON_BOARD ?auto_92512 ?auto_92511 ) ( not ( = ?auto_92506 ?auto_92512 ) ) ( SUPPORTS ?auto_92512 ?auto_92501 ) ( CALIBRATION_TARGET ?auto_92512 ?auto_92513 ) ( not ( = ?auto_92513 ?auto_92502 ) ) ( ON_BOARD ?auto_92508 ?auto_92511 ) ( not ( = ?auto_92512 ?auto_92508 ) ) ( SUPPORTS ?auto_92508 ?auto_92503 ) ( CALIBRATION_TARGET ?auto_92508 ?auto_92513 ) ( not ( = ?auto_92513 ?auto_92504 ) ) ( ON_BOARD ?auto_92509 ?auto_92511 ) ( not ( = ?auto_92508 ?auto_92509 ) ) ( SUPPORTS ?auto_92509 ?auto_92505 ) ( CALIBRATION_TARGET ?auto_92509 ?auto_92513 ) ( POWER_AVAIL ?auto_92511 ) ( POINTING ?auto_92511 ?auto_92510 ) ( not ( = ?auto_92513 ?auto_92510 ) ) ( not ( = ?auto_92504 ?auto_92510 ) ) ( not ( = ?auto_92505 ?auto_92503 ) ) ( not ( = ?auto_92502 ?auto_92510 ) ) ( not ( = ?auto_92505 ?auto_92501 ) ) ( not ( = ?auto_92503 ?auto_92501 ) ) ( not ( = ?auto_92500 ?auto_92510 ) ) ( not ( = ?auto_92512 ?auto_92509 ) ) ( not ( = ?auto_92505 ?auto_92498 ) ) ( not ( = ?auto_92503 ?auto_92498 ) ) ( not ( = ?auto_92501 ?auto_92498 ) ) ( not ( = ?auto_92499 ?auto_92510 ) ) ( not ( = ?auto_92506 ?auto_92508 ) ) ( not ( = ?auto_92506 ?auto_92509 ) ) ( not ( = ?auto_92505 ?auto_92497 ) ) ( not ( = ?auto_92503 ?auto_92497 ) ) ( not ( = ?auto_92501 ?auto_92497 ) ) ( not ( = ?auto_92498 ?auto_92497 ) ) ( not ( = ?auto_92496 ?auto_92510 ) ) ( not ( = ?auto_92507 ?auto_92512 ) ) ( not ( = ?auto_92507 ?auto_92508 ) ) ( not ( = ?auto_92507 ?auto_92509 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_92504 ?auto_92505 ?auto_92502 ?auto_92503 ?auto_92500 ?auto_92501 ?auto_92496 ?auto_92497 ?auto_92499 ?auto_92498 )
      ( GET-5IMAGE-VERIFY ?auto_92496 ?auto_92497 ?auto_92499 ?auto_92498 ?auto_92500 ?auto_92501 ?auto_92502 ?auto_92503 ?auto_92504 ?auto_92505 ) )
  )

)

