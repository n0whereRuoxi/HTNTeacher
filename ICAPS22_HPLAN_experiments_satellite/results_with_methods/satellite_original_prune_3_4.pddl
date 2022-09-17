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
      ?auto_23620 - DIRECTION
      ?auto_23621 - MODE
    )
    :vars
    (
      ?auto_23622 - INSTRUMENT
      ?auto_23623 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_23622 ) ( ON_BOARD ?auto_23622 ?auto_23623 ) ( SUPPORTS ?auto_23622 ?auto_23621 ) ( POWER_ON ?auto_23622 ) ( POINTING ?auto_23623 ?auto_23620 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_23623 ?auto_23620 ?auto_23622 ?auto_23621 )
      ( GET-1IMAGE-VERIFY ?auto_23620 ?auto_23621 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23638 - DIRECTION
      ?auto_23639 - MODE
    )
    :vars
    (
      ?auto_23641 - INSTRUMENT
      ?auto_23640 - SATELLITE
      ?auto_23642 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_23641 ) ( ON_BOARD ?auto_23641 ?auto_23640 ) ( SUPPORTS ?auto_23641 ?auto_23639 ) ( POWER_ON ?auto_23641 ) ( POINTING ?auto_23640 ?auto_23642 ) ( not ( = ?auto_23638 ?auto_23642 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_23640 ?auto_23638 ?auto_23642 )
      ( GET-1IMAGE ?auto_23638 ?auto_23639 )
      ( GET-1IMAGE-VERIFY ?auto_23638 ?auto_23639 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23659 - DIRECTION
      ?auto_23660 - MODE
    )
    :vars
    (
      ?auto_23663 - INSTRUMENT
      ?auto_23661 - SATELLITE
      ?auto_23662 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23663 ?auto_23661 ) ( SUPPORTS ?auto_23663 ?auto_23660 ) ( POWER_ON ?auto_23663 ) ( POINTING ?auto_23661 ?auto_23662 ) ( not ( = ?auto_23659 ?auto_23662 ) ) ( CALIBRATION_TARGET ?auto_23663 ?auto_23662 ) ( NOT_CALIBRATED ?auto_23663 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_23661 ?auto_23663 ?auto_23662 )
      ( GET-1IMAGE ?auto_23659 ?auto_23660 )
      ( GET-1IMAGE-VERIFY ?auto_23659 ?auto_23660 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23680 - DIRECTION
      ?auto_23681 - MODE
    )
    :vars
    (
      ?auto_23684 - INSTRUMENT
      ?auto_23682 - SATELLITE
      ?auto_23683 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23684 ?auto_23682 ) ( SUPPORTS ?auto_23684 ?auto_23681 ) ( POINTING ?auto_23682 ?auto_23683 ) ( not ( = ?auto_23680 ?auto_23683 ) ) ( CALIBRATION_TARGET ?auto_23684 ?auto_23683 ) ( POWER_AVAIL ?auto_23682 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_23684 ?auto_23682 )
      ( GET-1IMAGE ?auto_23680 ?auto_23681 )
      ( GET-1IMAGE-VERIFY ?auto_23680 ?auto_23681 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23701 - DIRECTION
      ?auto_23702 - MODE
    )
    :vars
    (
      ?auto_23703 - INSTRUMENT
      ?auto_23705 - SATELLITE
      ?auto_23704 - DIRECTION
      ?auto_23706 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23703 ?auto_23705 ) ( SUPPORTS ?auto_23703 ?auto_23702 ) ( not ( = ?auto_23701 ?auto_23704 ) ) ( CALIBRATION_TARGET ?auto_23703 ?auto_23704 ) ( POWER_AVAIL ?auto_23705 ) ( POINTING ?auto_23705 ?auto_23706 ) ( not ( = ?auto_23704 ?auto_23706 ) ) ( not ( = ?auto_23701 ?auto_23706 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_23705 ?auto_23704 ?auto_23706 )
      ( GET-1IMAGE ?auto_23701 ?auto_23702 )
      ( GET-1IMAGE-VERIFY ?auto_23701 ?auto_23702 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23786 - DIRECTION
      ?auto_23787 - MODE
      ?auto_23788 - DIRECTION
      ?auto_23785 - MODE
    )
    :vars
    (
      ?auto_23790 - INSTRUMENT
      ?auto_23789 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_23788 ?auto_23786 ) ) ( CALIBRATED ?auto_23790 ) ( ON_BOARD ?auto_23790 ?auto_23789 ) ( SUPPORTS ?auto_23790 ?auto_23785 ) ( POWER_ON ?auto_23790 ) ( POINTING ?auto_23789 ?auto_23788 ) ( HAVE_IMAGE ?auto_23786 ?auto_23787 ) ( not ( = ?auto_23787 ?auto_23785 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23788 ?auto_23785 )
      ( GET-2IMAGE-VERIFY ?auto_23786 ?auto_23787 ?auto_23788 ?auto_23785 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23792 - DIRECTION
      ?auto_23793 - MODE
      ?auto_23794 - DIRECTION
      ?auto_23791 - MODE
    )
    :vars
    (
      ?auto_23796 - INSTRUMENT
      ?auto_23795 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_23794 ?auto_23792 ) ) ( CALIBRATED ?auto_23796 ) ( ON_BOARD ?auto_23796 ?auto_23795 ) ( SUPPORTS ?auto_23796 ?auto_23793 ) ( POWER_ON ?auto_23796 ) ( POINTING ?auto_23795 ?auto_23792 ) ( HAVE_IMAGE ?auto_23794 ?auto_23791 ) ( not ( = ?auto_23793 ?auto_23791 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23792 ?auto_23793 )
      ( GET-2IMAGE-VERIFY ?auto_23792 ?auto_23793 ?auto_23794 ?auto_23791 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23865 - DIRECTION
      ?auto_23866 - MODE
      ?auto_23867 - DIRECTION
      ?auto_23864 - MODE
    )
    :vars
    (
      ?auto_23869 - INSTRUMENT
      ?auto_23868 - SATELLITE
      ?auto_23870 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_23867 ?auto_23865 ) ) ( CALIBRATED ?auto_23869 ) ( ON_BOARD ?auto_23869 ?auto_23868 ) ( SUPPORTS ?auto_23869 ?auto_23864 ) ( POWER_ON ?auto_23869 ) ( POINTING ?auto_23868 ?auto_23870 ) ( not ( = ?auto_23867 ?auto_23870 ) ) ( HAVE_IMAGE ?auto_23865 ?auto_23866 ) ( not ( = ?auto_23865 ?auto_23870 ) ) ( not ( = ?auto_23866 ?auto_23864 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23867 ?auto_23864 )
      ( GET-2IMAGE-VERIFY ?auto_23865 ?auto_23866 ?auto_23867 ?auto_23864 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23872 - DIRECTION
      ?auto_23873 - MODE
      ?auto_23874 - DIRECTION
      ?auto_23871 - MODE
    )
    :vars
    (
      ?auto_23877 - INSTRUMENT
      ?auto_23875 - SATELLITE
      ?auto_23876 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_23874 ?auto_23872 ) ) ( CALIBRATED ?auto_23877 ) ( ON_BOARD ?auto_23877 ?auto_23875 ) ( SUPPORTS ?auto_23877 ?auto_23873 ) ( POWER_ON ?auto_23877 ) ( POINTING ?auto_23875 ?auto_23876 ) ( not ( = ?auto_23872 ?auto_23876 ) ) ( HAVE_IMAGE ?auto_23874 ?auto_23871 ) ( not ( = ?auto_23874 ?auto_23876 ) ) ( not ( = ?auto_23871 ?auto_23873 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23874 ?auto_23871 ?auto_23872 ?auto_23873 )
      ( GET-2IMAGE-VERIFY ?auto_23872 ?auto_23873 ?auto_23874 ?auto_23871 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23952 - DIRECTION
      ?auto_23953 - MODE
    )
    :vars
    (
      ?auto_23958 - DIRECTION
      ?auto_23957 - INSTRUMENT
      ?auto_23954 - SATELLITE
      ?auto_23955 - DIRECTION
      ?auto_23956 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23952 ?auto_23958 ) ) ( ON_BOARD ?auto_23957 ?auto_23954 ) ( SUPPORTS ?auto_23957 ?auto_23953 ) ( POWER_ON ?auto_23957 ) ( POINTING ?auto_23954 ?auto_23955 ) ( not ( = ?auto_23952 ?auto_23955 ) ) ( HAVE_IMAGE ?auto_23958 ?auto_23956 ) ( not ( = ?auto_23958 ?auto_23955 ) ) ( not ( = ?auto_23956 ?auto_23953 ) ) ( CALIBRATION_TARGET ?auto_23957 ?auto_23955 ) ( NOT_CALIBRATED ?auto_23957 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_23954 ?auto_23957 ?auto_23955 )
      ( GET-2IMAGE ?auto_23958 ?auto_23956 ?auto_23952 ?auto_23953 )
      ( GET-1IMAGE-VERIFY ?auto_23952 ?auto_23953 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23960 - DIRECTION
      ?auto_23961 - MODE
      ?auto_23962 - DIRECTION
      ?auto_23959 - MODE
    )
    :vars
    (
      ?auto_23965 - INSTRUMENT
      ?auto_23964 - SATELLITE
      ?auto_23963 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_23962 ?auto_23960 ) ) ( ON_BOARD ?auto_23965 ?auto_23964 ) ( SUPPORTS ?auto_23965 ?auto_23959 ) ( POWER_ON ?auto_23965 ) ( POINTING ?auto_23964 ?auto_23963 ) ( not ( = ?auto_23962 ?auto_23963 ) ) ( HAVE_IMAGE ?auto_23960 ?auto_23961 ) ( not ( = ?auto_23960 ?auto_23963 ) ) ( not ( = ?auto_23961 ?auto_23959 ) ) ( CALIBRATION_TARGET ?auto_23965 ?auto_23963 ) ( NOT_CALIBRATED ?auto_23965 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23962 ?auto_23959 )
      ( GET-2IMAGE-VERIFY ?auto_23960 ?auto_23961 ?auto_23962 ?auto_23959 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23967 - DIRECTION
      ?auto_23968 - MODE
      ?auto_23969 - DIRECTION
      ?auto_23966 - MODE
    )
    :vars
    (
      ?auto_23971 - INSTRUMENT
      ?auto_23972 - SATELLITE
      ?auto_23970 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_23969 ?auto_23967 ) ) ( ON_BOARD ?auto_23971 ?auto_23972 ) ( SUPPORTS ?auto_23971 ?auto_23968 ) ( POWER_ON ?auto_23971 ) ( POINTING ?auto_23972 ?auto_23970 ) ( not ( = ?auto_23967 ?auto_23970 ) ) ( HAVE_IMAGE ?auto_23969 ?auto_23966 ) ( not ( = ?auto_23969 ?auto_23970 ) ) ( not ( = ?auto_23966 ?auto_23968 ) ) ( CALIBRATION_TARGET ?auto_23971 ?auto_23970 ) ( NOT_CALIBRATED ?auto_23971 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23969 ?auto_23966 ?auto_23967 ?auto_23968 )
      ( GET-2IMAGE-VERIFY ?auto_23967 ?auto_23968 ?auto_23969 ?auto_23966 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24047 - DIRECTION
      ?auto_24048 - MODE
    )
    :vars
    (
      ?auto_24050 - DIRECTION
      ?auto_24052 - INSTRUMENT
      ?auto_24053 - SATELLITE
      ?auto_24051 - DIRECTION
      ?auto_24049 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_24047 ?auto_24050 ) ) ( ON_BOARD ?auto_24052 ?auto_24053 ) ( SUPPORTS ?auto_24052 ?auto_24048 ) ( POINTING ?auto_24053 ?auto_24051 ) ( not ( = ?auto_24047 ?auto_24051 ) ) ( HAVE_IMAGE ?auto_24050 ?auto_24049 ) ( not ( = ?auto_24050 ?auto_24051 ) ) ( not ( = ?auto_24049 ?auto_24048 ) ) ( CALIBRATION_TARGET ?auto_24052 ?auto_24051 ) ( POWER_AVAIL ?auto_24053 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_24052 ?auto_24053 )
      ( GET-2IMAGE ?auto_24050 ?auto_24049 ?auto_24047 ?auto_24048 )
      ( GET-1IMAGE-VERIFY ?auto_24047 ?auto_24048 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24055 - DIRECTION
      ?auto_24056 - MODE
      ?auto_24057 - DIRECTION
      ?auto_24054 - MODE
    )
    :vars
    (
      ?auto_24060 - INSTRUMENT
      ?auto_24059 - SATELLITE
      ?auto_24058 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24057 ?auto_24055 ) ) ( ON_BOARD ?auto_24060 ?auto_24059 ) ( SUPPORTS ?auto_24060 ?auto_24054 ) ( POINTING ?auto_24059 ?auto_24058 ) ( not ( = ?auto_24057 ?auto_24058 ) ) ( HAVE_IMAGE ?auto_24055 ?auto_24056 ) ( not ( = ?auto_24055 ?auto_24058 ) ) ( not ( = ?auto_24056 ?auto_24054 ) ) ( CALIBRATION_TARGET ?auto_24060 ?auto_24058 ) ( POWER_AVAIL ?auto_24059 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24057 ?auto_24054 )
      ( GET-2IMAGE-VERIFY ?auto_24055 ?auto_24056 ?auto_24057 ?auto_24054 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24062 - DIRECTION
      ?auto_24063 - MODE
      ?auto_24064 - DIRECTION
      ?auto_24061 - MODE
    )
    :vars
    (
      ?auto_24065 - INSTRUMENT
      ?auto_24067 - SATELLITE
      ?auto_24066 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24064 ?auto_24062 ) ) ( ON_BOARD ?auto_24065 ?auto_24067 ) ( SUPPORTS ?auto_24065 ?auto_24063 ) ( POINTING ?auto_24067 ?auto_24066 ) ( not ( = ?auto_24062 ?auto_24066 ) ) ( HAVE_IMAGE ?auto_24064 ?auto_24061 ) ( not ( = ?auto_24064 ?auto_24066 ) ) ( not ( = ?auto_24061 ?auto_24063 ) ) ( CALIBRATION_TARGET ?auto_24065 ?auto_24066 ) ( POWER_AVAIL ?auto_24067 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24064 ?auto_24061 ?auto_24062 ?auto_24063 )
      ( GET-2IMAGE-VERIFY ?auto_24062 ?auto_24063 ?auto_24064 ?auto_24061 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24142 - DIRECTION
      ?auto_24143 - MODE
    )
    :vars
    (
      ?auto_24146 - DIRECTION
      ?auto_24144 - INSTRUMENT
      ?auto_24148 - SATELLITE
      ?auto_24147 - DIRECTION
      ?auto_24145 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_24142 ?auto_24146 ) ) ( ON_BOARD ?auto_24144 ?auto_24148 ) ( SUPPORTS ?auto_24144 ?auto_24143 ) ( not ( = ?auto_24142 ?auto_24147 ) ) ( HAVE_IMAGE ?auto_24146 ?auto_24145 ) ( not ( = ?auto_24146 ?auto_24147 ) ) ( not ( = ?auto_24145 ?auto_24143 ) ) ( CALIBRATION_TARGET ?auto_24144 ?auto_24147 ) ( POWER_AVAIL ?auto_24148 ) ( POINTING ?auto_24148 ?auto_24146 ) )
    :subtasks
    ( ( !TURN_TO ?auto_24148 ?auto_24147 ?auto_24146 )
      ( GET-2IMAGE ?auto_24146 ?auto_24145 ?auto_24142 ?auto_24143 )
      ( GET-1IMAGE-VERIFY ?auto_24142 ?auto_24143 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24150 - DIRECTION
      ?auto_24151 - MODE
      ?auto_24152 - DIRECTION
      ?auto_24149 - MODE
    )
    :vars
    (
      ?auto_24154 - INSTRUMENT
      ?auto_24155 - SATELLITE
      ?auto_24153 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24152 ?auto_24150 ) ) ( ON_BOARD ?auto_24154 ?auto_24155 ) ( SUPPORTS ?auto_24154 ?auto_24149 ) ( not ( = ?auto_24152 ?auto_24153 ) ) ( HAVE_IMAGE ?auto_24150 ?auto_24151 ) ( not ( = ?auto_24150 ?auto_24153 ) ) ( not ( = ?auto_24151 ?auto_24149 ) ) ( CALIBRATION_TARGET ?auto_24154 ?auto_24153 ) ( POWER_AVAIL ?auto_24155 ) ( POINTING ?auto_24155 ?auto_24150 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24152 ?auto_24149 )
      ( GET-2IMAGE-VERIFY ?auto_24150 ?auto_24151 ?auto_24152 ?auto_24149 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24157 - DIRECTION
      ?auto_24158 - MODE
      ?auto_24159 - DIRECTION
      ?auto_24156 - MODE
    )
    :vars
    (
      ?auto_24161 - INSTRUMENT
      ?auto_24160 - SATELLITE
      ?auto_24162 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_24159 ?auto_24157 ) ) ( ON_BOARD ?auto_24161 ?auto_24160 ) ( SUPPORTS ?auto_24161 ?auto_24158 ) ( not ( = ?auto_24157 ?auto_24162 ) ) ( HAVE_IMAGE ?auto_24159 ?auto_24156 ) ( not ( = ?auto_24159 ?auto_24162 ) ) ( not ( = ?auto_24156 ?auto_24158 ) ) ( CALIBRATION_TARGET ?auto_24161 ?auto_24162 ) ( POWER_AVAIL ?auto_24160 ) ( POINTING ?auto_24160 ?auto_24159 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24159 ?auto_24156 ?auto_24157 ?auto_24158 )
      ( GET-2IMAGE-VERIFY ?auto_24157 ?auto_24158 ?auto_24159 ?auto_24156 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24237 - DIRECTION
      ?auto_24238 - MODE
    )
    :vars
    (
      ?auto_24242 - DIRECTION
      ?auto_24241 - INSTRUMENT
      ?auto_24240 - SATELLITE
      ?auto_24243 - DIRECTION
      ?auto_24239 - MODE
      ?auto_24244 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24237 ?auto_24242 ) ) ( ON_BOARD ?auto_24241 ?auto_24240 ) ( SUPPORTS ?auto_24241 ?auto_24238 ) ( not ( = ?auto_24237 ?auto_24243 ) ) ( HAVE_IMAGE ?auto_24242 ?auto_24239 ) ( not ( = ?auto_24242 ?auto_24243 ) ) ( not ( = ?auto_24239 ?auto_24238 ) ) ( CALIBRATION_TARGET ?auto_24241 ?auto_24243 ) ( POINTING ?auto_24240 ?auto_24242 ) ( ON_BOARD ?auto_24244 ?auto_24240 ) ( POWER_ON ?auto_24244 ) ( not ( = ?auto_24241 ?auto_24244 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_24244 ?auto_24240 )
      ( GET-2IMAGE ?auto_24242 ?auto_24239 ?auto_24237 ?auto_24238 )
      ( GET-1IMAGE-VERIFY ?auto_24237 ?auto_24238 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24246 - DIRECTION
      ?auto_24247 - MODE
      ?auto_24248 - DIRECTION
      ?auto_24245 - MODE
    )
    :vars
    (
      ?auto_24250 - INSTRUMENT
      ?auto_24252 - SATELLITE
      ?auto_24249 - DIRECTION
      ?auto_24251 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24248 ?auto_24246 ) ) ( ON_BOARD ?auto_24250 ?auto_24252 ) ( SUPPORTS ?auto_24250 ?auto_24245 ) ( not ( = ?auto_24248 ?auto_24249 ) ) ( HAVE_IMAGE ?auto_24246 ?auto_24247 ) ( not ( = ?auto_24246 ?auto_24249 ) ) ( not ( = ?auto_24247 ?auto_24245 ) ) ( CALIBRATION_TARGET ?auto_24250 ?auto_24249 ) ( POINTING ?auto_24252 ?auto_24246 ) ( ON_BOARD ?auto_24251 ?auto_24252 ) ( POWER_ON ?auto_24251 ) ( not ( = ?auto_24250 ?auto_24251 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24248 ?auto_24245 )
      ( GET-2IMAGE-VERIFY ?auto_24246 ?auto_24247 ?auto_24248 ?auto_24245 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24254 - DIRECTION
      ?auto_24255 - MODE
      ?auto_24256 - DIRECTION
      ?auto_24253 - MODE
    )
    :vars
    (
      ?auto_24259 - INSTRUMENT
      ?auto_24257 - SATELLITE
      ?auto_24260 - DIRECTION
      ?auto_24258 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24256 ?auto_24254 ) ) ( ON_BOARD ?auto_24259 ?auto_24257 ) ( SUPPORTS ?auto_24259 ?auto_24255 ) ( not ( = ?auto_24254 ?auto_24260 ) ) ( HAVE_IMAGE ?auto_24256 ?auto_24253 ) ( not ( = ?auto_24256 ?auto_24260 ) ) ( not ( = ?auto_24253 ?auto_24255 ) ) ( CALIBRATION_TARGET ?auto_24259 ?auto_24260 ) ( POINTING ?auto_24257 ?auto_24256 ) ( ON_BOARD ?auto_24258 ?auto_24257 ) ( POWER_ON ?auto_24258 ) ( not ( = ?auto_24259 ?auto_24258 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24256 ?auto_24253 ?auto_24254 ?auto_24255 )
      ( GET-2IMAGE-VERIFY ?auto_24254 ?auto_24255 ?auto_24256 ?auto_24253 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24343 - DIRECTION
      ?auto_24344 - MODE
    )
    :vars
    (
      ?auto_24348 - DIRECTION
      ?auto_24349 - INSTRUMENT
      ?auto_24345 - SATELLITE
      ?auto_24350 - DIRECTION
      ?auto_24346 - MODE
      ?auto_24347 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24343 ?auto_24348 ) ) ( ON_BOARD ?auto_24349 ?auto_24345 ) ( SUPPORTS ?auto_24349 ?auto_24344 ) ( not ( = ?auto_24343 ?auto_24350 ) ) ( not ( = ?auto_24348 ?auto_24350 ) ) ( not ( = ?auto_24346 ?auto_24344 ) ) ( CALIBRATION_TARGET ?auto_24349 ?auto_24350 ) ( POINTING ?auto_24345 ?auto_24348 ) ( ON_BOARD ?auto_24347 ?auto_24345 ) ( POWER_ON ?auto_24347 ) ( not ( = ?auto_24349 ?auto_24347 ) ) ( CALIBRATED ?auto_24347 ) ( SUPPORTS ?auto_24347 ?auto_24346 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24348 ?auto_24346 )
      ( GET-2IMAGE ?auto_24348 ?auto_24346 ?auto_24343 ?auto_24344 )
      ( GET-1IMAGE-VERIFY ?auto_24343 ?auto_24344 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24352 - DIRECTION
      ?auto_24353 - MODE
      ?auto_24354 - DIRECTION
      ?auto_24351 - MODE
    )
    :vars
    (
      ?auto_24356 - INSTRUMENT
      ?auto_24355 - SATELLITE
      ?auto_24358 - DIRECTION
      ?auto_24357 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24354 ?auto_24352 ) ) ( ON_BOARD ?auto_24356 ?auto_24355 ) ( SUPPORTS ?auto_24356 ?auto_24351 ) ( not ( = ?auto_24354 ?auto_24358 ) ) ( not ( = ?auto_24352 ?auto_24358 ) ) ( not ( = ?auto_24353 ?auto_24351 ) ) ( CALIBRATION_TARGET ?auto_24356 ?auto_24358 ) ( POINTING ?auto_24355 ?auto_24352 ) ( ON_BOARD ?auto_24357 ?auto_24355 ) ( POWER_ON ?auto_24357 ) ( not ( = ?auto_24356 ?auto_24357 ) ) ( CALIBRATED ?auto_24357 ) ( SUPPORTS ?auto_24357 ?auto_24353 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24354 ?auto_24351 )
      ( GET-2IMAGE-VERIFY ?auto_24352 ?auto_24353 ?auto_24354 ?auto_24351 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24360 - DIRECTION
      ?auto_24361 - MODE
      ?auto_24362 - DIRECTION
      ?auto_24359 - MODE
    )
    :vars
    (
      ?auto_24366 - INSTRUMENT
      ?auto_24363 - SATELLITE
      ?auto_24365 - DIRECTION
      ?auto_24364 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24362 ?auto_24360 ) ) ( ON_BOARD ?auto_24366 ?auto_24363 ) ( SUPPORTS ?auto_24366 ?auto_24361 ) ( not ( = ?auto_24360 ?auto_24365 ) ) ( not ( = ?auto_24362 ?auto_24365 ) ) ( not ( = ?auto_24359 ?auto_24361 ) ) ( CALIBRATION_TARGET ?auto_24366 ?auto_24365 ) ( POINTING ?auto_24363 ?auto_24362 ) ( ON_BOARD ?auto_24364 ?auto_24363 ) ( POWER_ON ?auto_24364 ) ( not ( = ?auto_24366 ?auto_24364 ) ) ( CALIBRATED ?auto_24364 ) ( SUPPORTS ?auto_24364 ?auto_24359 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24362 ?auto_24359 ?auto_24360 ?auto_24361 )
      ( GET-2IMAGE-VERIFY ?auto_24360 ?auto_24361 ?auto_24362 ?auto_24359 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24449 - DIRECTION
      ?auto_24450 - MODE
    )
    :vars
    (
      ?auto_24454 - DIRECTION
      ?auto_24456 - INSTRUMENT
      ?auto_24451 - SATELLITE
      ?auto_24455 - DIRECTION
      ?auto_24453 - MODE
      ?auto_24452 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24449 ?auto_24454 ) ) ( ON_BOARD ?auto_24456 ?auto_24451 ) ( SUPPORTS ?auto_24456 ?auto_24450 ) ( not ( = ?auto_24449 ?auto_24455 ) ) ( not ( = ?auto_24454 ?auto_24455 ) ) ( not ( = ?auto_24453 ?auto_24450 ) ) ( CALIBRATION_TARGET ?auto_24456 ?auto_24455 ) ( ON_BOARD ?auto_24452 ?auto_24451 ) ( POWER_ON ?auto_24452 ) ( not ( = ?auto_24456 ?auto_24452 ) ) ( CALIBRATED ?auto_24452 ) ( SUPPORTS ?auto_24452 ?auto_24453 ) ( POINTING ?auto_24451 ?auto_24455 ) )
    :subtasks
    ( ( !TURN_TO ?auto_24451 ?auto_24454 ?auto_24455 )
      ( GET-2IMAGE ?auto_24454 ?auto_24453 ?auto_24449 ?auto_24450 )
      ( GET-1IMAGE-VERIFY ?auto_24449 ?auto_24450 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24458 - DIRECTION
      ?auto_24459 - MODE
      ?auto_24460 - DIRECTION
      ?auto_24457 - MODE
    )
    :vars
    (
      ?auto_24464 - INSTRUMENT
      ?auto_24463 - SATELLITE
      ?auto_24462 - DIRECTION
      ?auto_24461 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24460 ?auto_24458 ) ) ( ON_BOARD ?auto_24464 ?auto_24463 ) ( SUPPORTS ?auto_24464 ?auto_24457 ) ( not ( = ?auto_24460 ?auto_24462 ) ) ( not ( = ?auto_24458 ?auto_24462 ) ) ( not ( = ?auto_24459 ?auto_24457 ) ) ( CALIBRATION_TARGET ?auto_24464 ?auto_24462 ) ( ON_BOARD ?auto_24461 ?auto_24463 ) ( POWER_ON ?auto_24461 ) ( not ( = ?auto_24464 ?auto_24461 ) ) ( CALIBRATED ?auto_24461 ) ( SUPPORTS ?auto_24461 ?auto_24459 ) ( POINTING ?auto_24463 ?auto_24462 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24460 ?auto_24457 )
      ( GET-2IMAGE-VERIFY ?auto_24458 ?auto_24459 ?auto_24460 ?auto_24457 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24466 - DIRECTION
      ?auto_24467 - MODE
      ?auto_24468 - DIRECTION
      ?auto_24465 - MODE
    )
    :vars
    (
      ?auto_24470 - INSTRUMENT
      ?auto_24471 - SATELLITE
      ?auto_24469 - DIRECTION
      ?auto_24472 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24468 ?auto_24466 ) ) ( ON_BOARD ?auto_24470 ?auto_24471 ) ( SUPPORTS ?auto_24470 ?auto_24467 ) ( not ( = ?auto_24466 ?auto_24469 ) ) ( not ( = ?auto_24468 ?auto_24469 ) ) ( not ( = ?auto_24465 ?auto_24467 ) ) ( CALIBRATION_TARGET ?auto_24470 ?auto_24469 ) ( ON_BOARD ?auto_24472 ?auto_24471 ) ( POWER_ON ?auto_24472 ) ( not ( = ?auto_24470 ?auto_24472 ) ) ( CALIBRATED ?auto_24472 ) ( SUPPORTS ?auto_24472 ?auto_24465 ) ( POINTING ?auto_24471 ?auto_24469 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24468 ?auto_24465 ?auto_24466 ?auto_24467 )
      ( GET-2IMAGE-VERIFY ?auto_24466 ?auto_24467 ?auto_24468 ?auto_24465 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24555 - DIRECTION
      ?auto_24556 - MODE
    )
    :vars
    (
      ?auto_24560 - DIRECTION
      ?auto_24559 - INSTRUMENT
      ?auto_24561 - SATELLITE
      ?auto_24558 - DIRECTION
      ?auto_24557 - MODE
      ?auto_24562 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24555 ?auto_24560 ) ) ( ON_BOARD ?auto_24559 ?auto_24561 ) ( SUPPORTS ?auto_24559 ?auto_24556 ) ( not ( = ?auto_24555 ?auto_24558 ) ) ( not ( = ?auto_24560 ?auto_24558 ) ) ( not ( = ?auto_24557 ?auto_24556 ) ) ( CALIBRATION_TARGET ?auto_24559 ?auto_24558 ) ( ON_BOARD ?auto_24562 ?auto_24561 ) ( POWER_ON ?auto_24562 ) ( not ( = ?auto_24559 ?auto_24562 ) ) ( SUPPORTS ?auto_24562 ?auto_24557 ) ( POINTING ?auto_24561 ?auto_24558 ) ( CALIBRATION_TARGET ?auto_24562 ?auto_24558 ) ( NOT_CALIBRATED ?auto_24562 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_24561 ?auto_24562 ?auto_24558 )
      ( GET-2IMAGE ?auto_24560 ?auto_24557 ?auto_24555 ?auto_24556 )
      ( GET-1IMAGE-VERIFY ?auto_24555 ?auto_24556 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24564 - DIRECTION
      ?auto_24565 - MODE
      ?auto_24566 - DIRECTION
      ?auto_24563 - MODE
    )
    :vars
    (
      ?auto_24569 - INSTRUMENT
      ?auto_24568 - SATELLITE
      ?auto_24567 - DIRECTION
      ?auto_24570 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24566 ?auto_24564 ) ) ( ON_BOARD ?auto_24569 ?auto_24568 ) ( SUPPORTS ?auto_24569 ?auto_24563 ) ( not ( = ?auto_24566 ?auto_24567 ) ) ( not ( = ?auto_24564 ?auto_24567 ) ) ( not ( = ?auto_24565 ?auto_24563 ) ) ( CALIBRATION_TARGET ?auto_24569 ?auto_24567 ) ( ON_BOARD ?auto_24570 ?auto_24568 ) ( POWER_ON ?auto_24570 ) ( not ( = ?auto_24569 ?auto_24570 ) ) ( SUPPORTS ?auto_24570 ?auto_24565 ) ( POINTING ?auto_24568 ?auto_24567 ) ( CALIBRATION_TARGET ?auto_24570 ?auto_24567 ) ( NOT_CALIBRATED ?auto_24570 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24566 ?auto_24563 )
      ( GET-2IMAGE-VERIFY ?auto_24564 ?auto_24565 ?auto_24566 ?auto_24563 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24572 - DIRECTION
      ?auto_24573 - MODE
      ?auto_24574 - DIRECTION
      ?auto_24571 - MODE
    )
    :vars
    (
      ?auto_24576 - INSTRUMENT
      ?auto_24578 - SATELLITE
      ?auto_24575 - DIRECTION
      ?auto_24577 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24574 ?auto_24572 ) ) ( ON_BOARD ?auto_24576 ?auto_24578 ) ( SUPPORTS ?auto_24576 ?auto_24573 ) ( not ( = ?auto_24572 ?auto_24575 ) ) ( not ( = ?auto_24574 ?auto_24575 ) ) ( not ( = ?auto_24571 ?auto_24573 ) ) ( CALIBRATION_TARGET ?auto_24576 ?auto_24575 ) ( ON_BOARD ?auto_24577 ?auto_24578 ) ( POWER_ON ?auto_24577 ) ( not ( = ?auto_24576 ?auto_24577 ) ) ( SUPPORTS ?auto_24577 ?auto_24571 ) ( POINTING ?auto_24578 ?auto_24575 ) ( CALIBRATION_TARGET ?auto_24577 ?auto_24575 ) ( NOT_CALIBRATED ?auto_24577 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24574 ?auto_24571 ?auto_24572 ?auto_24573 )
      ( GET-2IMAGE-VERIFY ?auto_24572 ?auto_24573 ?auto_24574 ?auto_24571 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25018 - DIRECTION
      ?auto_25019 - MODE
      ?auto_25020 - DIRECTION
      ?auto_25017 - MODE
      ?auto_25022 - DIRECTION
      ?auto_25021 - MODE
    )
    :vars
    (
      ?auto_25023 - INSTRUMENT
      ?auto_25024 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_25020 ?auto_25018 ) ) ( not ( = ?auto_25022 ?auto_25018 ) ) ( not ( = ?auto_25022 ?auto_25020 ) ) ( CALIBRATED ?auto_25023 ) ( ON_BOARD ?auto_25023 ?auto_25024 ) ( SUPPORTS ?auto_25023 ?auto_25021 ) ( POWER_ON ?auto_25023 ) ( POINTING ?auto_25024 ?auto_25022 ) ( HAVE_IMAGE ?auto_25018 ?auto_25019 ) ( HAVE_IMAGE ?auto_25020 ?auto_25017 ) ( not ( = ?auto_25019 ?auto_25017 ) ) ( not ( = ?auto_25019 ?auto_25021 ) ) ( not ( = ?auto_25017 ?auto_25021 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25022 ?auto_25021 )
      ( GET-3IMAGE-VERIFY ?auto_25018 ?auto_25019 ?auto_25020 ?auto_25017 ?auto_25022 ?auto_25021 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25034 - DIRECTION
      ?auto_25035 - MODE
      ?auto_25036 - DIRECTION
      ?auto_25033 - MODE
      ?auto_25038 - DIRECTION
      ?auto_25037 - MODE
    )
    :vars
    (
      ?auto_25039 - INSTRUMENT
      ?auto_25040 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_25036 ?auto_25034 ) ) ( not ( = ?auto_25038 ?auto_25034 ) ) ( not ( = ?auto_25038 ?auto_25036 ) ) ( CALIBRATED ?auto_25039 ) ( ON_BOARD ?auto_25039 ?auto_25040 ) ( SUPPORTS ?auto_25039 ?auto_25033 ) ( POWER_ON ?auto_25039 ) ( POINTING ?auto_25040 ?auto_25036 ) ( HAVE_IMAGE ?auto_25034 ?auto_25035 ) ( HAVE_IMAGE ?auto_25038 ?auto_25037 ) ( not ( = ?auto_25035 ?auto_25033 ) ) ( not ( = ?auto_25035 ?auto_25037 ) ) ( not ( = ?auto_25033 ?auto_25037 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25036 ?auto_25033 )
      ( GET-3IMAGE-VERIFY ?auto_25034 ?auto_25035 ?auto_25036 ?auto_25033 ?auto_25038 ?auto_25037 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25094 - DIRECTION
      ?auto_25095 - MODE
      ?auto_25096 - DIRECTION
      ?auto_25093 - MODE
      ?auto_25098 - DIRECTION
      ?auto_25097 - MODE
    )
    :vars
    (
      ?auto_25099 - INSTRUMENT
      ?auto_25100 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_25096 ?auto_25094 ) ) ( not ( = ?auto_25098 ?auto_25094 ) ) ( not ( = ?auto_25098 ?auto_25096 ) ) ( CALIBRATED ?auto_25099 ) ( ON_BOARD ?auto_25099 ?auto_25100 ) ( SUPPORTS ?auto_25099 ?auto_25095 ) ( POWER_ON ?auto_25099 ) ( POINTING ?auto_25100 ?auto_25094 ) ( HAVE_IMAGE ?auto_25096 ?auto_25093 ) ( HAVE_IMAGE ?auto_25098 ?auto_25097 ) ( not ( = ?auto_25095 ?auto_25093 ) ) ( not ( = ?auto_25095 ?auto_25097 ) ) ( not ( = ?auto_25093 ?auto_25097 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25094 ?auto_25095 )
      ( GET-3IMAGE-VERIFY ?auto_25094 ?auto_25095 ?auto_25096 ?auto_25093 ?auto_25098 ?auto_25097 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25201 - DIRECTION
      ?auto_25202 - MODE
      ?auto_25203 - DIRECTION
      ?auto_25200 - MODE
      ?auto_25205 - DIRECTION
      ?auto_25204 - MODE
    )
    :vars
    (
      ?auto_25207 - INSTRUMENT
      ?auto_25208 - SATELLITE
      ?auto_25206 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25203 ?auto_25201 ) ) ( not ( = ?auto_25205 ?auto_25201 ) ) ( not ( = ?auto_25205 ?auto_25203 ) ) ( CALIBRATED ?auto_25207 ) ( ON_BOARD ?auto_25207 ?auto_25208 ) ( SUPPORTS ?auto_25207 ?auto_25204 ) ( POWER_ON ?auto_25207 ) ( POINTING ?auto_25208 ?auto_25206 ) ( not ( = ?auto_25205 ?auto_25206 ) ) ( HAVE_IMAGE ?auto_25201 ?auto_25202 ) ( not ( = ?auto_25201 ?auto_25206 ) ) ( not ( = ?auto_25202 ?auto_25204 ) ) ( HAVE_IMAGE ?auto_25203 ?auto_25200 ) ( not ( = ?auto_25202 ?auto_25200 ) ) ( not ( = ?auto_25203 ?auto_25206 ) ) ( not ( = ?auto_25200 ?auto_25204 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25201 ?auto_25202 ?auto_25205 ?auto_25204 )
      ( GET-3IMAGE-VERIFY ?auto_25201 ?auto_25202 ?auto_25203 ?auto_25200 ?auto_25205 ?auto_25204 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25219 - DIRECTION
      ?auto_25220 - MODE
      ?auto_25221 - DIRECTION
      ?auto_25218 - MODE
      ?auto_25223 - DIRECTION
      ?auto_25222 - MODE
    )
    :vars
    (
      ?auto_25225 - INSTRUMENT
      ?auto_25226 - SATELLITE
      ?auto_25224 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25221 ?auto_25219 ) ) ( not ( = ?auto_25223 ?auto_25219 ) ) ( not ( = ?auto_25223 ?auto_25221 ) ) ( CALIBRATED ?auto_25225 ) ( ON_BOARD ?auto_25225 ?auto_25226 ) ( SUPPORTS ?auto_25225 ?auto_25218 ) ( POWER_ON ?auto_25225 ) ( POINTING ?auto_25226 ?auto_25224 ) ( not ( = ?auto_25221 ?auto_25224 ) ) ( HAVE_IMAGE ?auto_25219 ?auto_25220 ) ( not ( = ?auto_25219 ?auto_25224 ) ) ( not ( = ?auto_25220 ?auto_25218 ) ) ( HAVE_IMAGE ?auto_25223 ?auto_25222 ) ( not ( = ?auto_25220 ?auto_25222 ) ) ( not ( = ?auto_25218 ?auto_25222 ) ) ( not ( = ?auto_25223 ?auto_25224 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25219 ?auto_25220 ?auto_25221 ?auto_25218 )
      ( GET-3IMAGE-VERIFY ?auto_25219 ?auto_25220 ?auto_25221 ?auto_25218 ?auto_25223 ?auto_25222 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25291 - DIRECTION
      ?auto_25292 - MODE
      ?auto_25293 - DIRECTION
      ?auto_25290 - MODE
      ?auto_25295 - DIRECTION
      ?auto_25294 - MODE
    )
    :vars
    (
      ?auto_25297 - INSTRUMENT
      ?auto_25298 - SATELLITE
      ?auto_25296 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25293 ?auto_25291 ) ) ( not ( = ?auto_25295 ?auto_25291 ) ) ( not ( = ?auto_25295 ?auto_25293 ) ) ( CALIBRATED ?auto_25297 ) ( ON_BOARD ?auto_25297 ?auto_25298 ) ( SUPPORTS ?auto_25297 ?auto_25292 ) ( POWER_ON ?auto_25297 ) ( POINTING ?auto_25298 ?auto_25296 ) ( not ( = ?auto_25291 ?auto_25296 ) ) ( HAVE_IMAGE ?auto_25293 ?auto_25290 ) ( not ( = ?auto_25293 ?auto_25296 ) ) ( not ( = ?auto_25290 ?auto_25292 ) ) ( HAVE_IMAGE ?auto_25295 ?auto_25294 ) ( not ( = ?auto_25292 ?auto_25294 ) ) ( not ( = ?auto_25290 ?auto_25294 ) ) ( not ( = ?auto_25295 ?auto_25296 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25293 ?auto_25290 ?auto_25291 ?auto_25292 )
      ( GET-3IMAGE-VERIFY ?auto_25291 ?auto_25292 ?auto_25293 ?auto_25290 ?auto_25295 ?auto_25294 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25415 - DIRECTION
      ?auto_25416 - MODE
      ?auto_25417 - DIRECTION
      ?auto_25414 - MODE
      ?auto_25419 - DIRECTION
      ?auto_25418 - MODE
    )
    :vars
    (
      ?auto_25420 - INSTRUMENT
      ?auto_25421 - SATELLITE
      ?auto_25422 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25417 ?auto_25415 ) ) ( not ( = ?auto_25419 ?auto_25415 ) ) ( not ( = ?auto_25419 ?auto_25417 ) ) ( ON_BOARD ?auto_25420 ?auto_25421 ) ( SUPPORTS ?auto_25420 ?auto_25418 ) ( POWER_ON ?auto_25420 ) ( POINTING ?auto_25421 ?auto_25422 ) ( not ( = ?auto_25419 ?auto_25422 ) ) ( HAVE_IMAGE ?auto_25415 ?auto_25416 ) ( not ( = ?auto_25415 ?auto_25422 ) ) ( not ( = ?auto_25416 ?auto_25418 ) ) ( CALIBRATION_TARGET ?auto_25420 ?auto_25422 ) ( NOT_CALIBRATED ?auto_25420 ) ( HAVE_IMAGE ?auto_25417 ?auto_25414 ) ( not ( = ?auto_25416 ?auto_25414 ) ) ( not ( = ?auto_25417 ?auto_25422 ) ) ( not ( = ?auto_25414 ?auto_25418 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25415 ?auto_25416 ?auto_25419 ?auto_25418 )
      ( GET-3IMAGE-VERIFY ?auto_25415 ?auto_25416 ?auto_25417 ?auto_25414 ?auto_25419 ?auto_25418 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25433 - DIRECTION
      ?auto_25434 - MODE
      ?auto_25435 - DIRECTION
      ?auto_25432 - MODE
      ?auto_25437 - DIRECTION
      ?auto_25436 - MODE
    )
    :vars
    (
      ?auto_25438 - INSTRUMENT
      ?auto_25439 - SATELLITE
      ?auto_25440 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25435 ?auto_25433 ) ) ( not ( = ?auto_25437 ?auto_25433 ) ) ( not ( = ?auto_25437 ?auto_25435 ) ) ( ON_BOARD ?auto_25438 ?auto_25439 ) ( SUPPORTS ?auto_25438 ?auto_25432 ) ( POWER_ON ?auto_25438 ) ( POINTING ?auto_25439 ?auto_25440 ) ( not ( = ?auto_25435 ?auto_25440 ) ) ( HAVE_IMAGE ?auto_25433 ?auto_25434 ) ( not ( = ?auto_25433 ?auto_25440 ) ) ( not ( = ?auto_25434 ?auto_25432 ) ) ( CALIBRATION_TARGET ?auto_25438 ?auto_25440 ) ( NOT_CALIBRATED ?auto_25438 ) ( HAVE_IMAGE ?auto_25437 ?auto_25436 ) ( not ( = ?auto_25434 ?auto_25436 ) ) ( not ( = ?auto_25432 ?auto_25436 ) ) ( not ( = ?auto_25437 ?auto_25440 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25433 ?auto_25434 ?auto_25435 ?auto_25432 )
      ( GET-3IMAGE-VERIFY ?auto_25433 ?auto_25434 ?auto_25435 ?auto_25432 ?auto_25437 ?auto_25436 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25505 - DIRECTION
      ?auto_25506 - MODE
      ?auto_25507 - DIRECTION
      ?auto_25504 - MODE
      ?auto_25509 - DIRECTION
      ?auto_25508 - MODE
    )
    :vars
    (
      ?auto_25510 - INSTRUMENT
      ?auto_25511 - SATELLITE
      ?auto_25512 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25507 ?auto_25505 ) ) ( not ( = ?auto_25509 ?auto_25505 ) ) ( not ( = ?auto_25509 ?auto_25507 ) ) ( ON_BOARD ?auto_25510 ?auto_25511 ) ( SUPPORTS ?auto_25510 ?auto_25506 ) ( POWER_ON ?auto_25510 ) ( POINTING ?auto_25511 ?auto_25512 ) ( not ( = ?auto_25505 ?auto_25512 ) ) ( HAVE_IMAGE ?auto_25507 ?auto_25504 ) ( not ( = ?auto_25507 ?auto_25512 ) ) ( not ( = ?auto_25504 ?auto_25506 ) ) ( CALIBRATION_TARGET ?auto_25510 ?auto_25512 ) ( NOT_CALIBRATED ?auto_25510 ) ( HAVE_IMAGE ?auto_25509 ?auto_25508 ) ( not ( = ?auto_25506 ?auto_25508 ) ) ( not ( = ?auto_25504 ?auto_25508 ) ) ( not ( = ?auto_25509 ?auto_25512 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25507 ?auto_25504 ?auto_25505 ?auto_25506 )
      ( GET-3IMAGE-VERIFY ?auto_25505 ?auto_25506 ?auto_25507 ?auto_25504 ?auto_25509 ?auto_25508 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25629 - DIRECTION
      ?auto_25630 - MODE
      ?auto_25631 - DIRECTION
      ?auto_25628 - MODE
      ?auto_25633 - DIRECTION
      ?auto_25632 - MODE
    )
    :vars
    (
      ?auto_25634 - INSTRUMENT
      ?auto_25635 - SATELLITE
      ?auto_25636 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25631 ?auto_25629 ) ) ( not ( = ?auto_25633 ?auto_25629 ) ) ( not ( = ?auto_25633 ?auto_25631 ) ) ( ON_BOARD ?auto_25634 ?auto_25635 ) ( SUPPORTS ?auto_25634 ?auto_25632 ) ( POINTING ?auto_25635 ?auto_25636 ) ( not ( = ?auto_25633 ?auto_25636 ) ) ( HAVE_IMAGE ?auto_25629 ?auto_25630 ) ( not ( = ?auto_25629 ?auto_25636 ) ) ( not ( = ?auto_25630 ?auto_25632 ) ) ( CALIBRATION_TARGET ?auto_25634 ?auto_25636 ) ( POWER_AVAIL ?auto_25635 ) ( HAVE_IMAGE ?auto_25631 ?auto_25628 ) ( not ( = ?auto_25630 ?auto_25628 ) ) ( not ( = ?auto_25631 ?auto_25636 ) ) ( not ( = ?auto_25628 ?auto_25632 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25629 ?auto_25630 ?auto_25633 ?auto_25632 )
      ( GET-3IMAGE-VERIFY ?auto_25629 ?auto_25630 ?auto_25631 ?auto_25628 ?auto_25633 ?auto_25632 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25647 - DIRECTION
      ?auto_25648 - MODE
      ?auto_25649 - DIRECTION
      ?auto_25646 - MODE
      ?auto_25651 - DIRECTION
      ?auto_25650 - MODE
    )
    :vars
    (
      ?auto_25652 - INSTRUMENT
      ?auto_25653 - SATELLITE
      ?auto_25654 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25649 ?auto_25647 ) ) ( not ( = ?auto_25651 ?auto_25647 ) ) ( not ( = ?auto_25651 ?auto_25649 ) ) ( ON_BOARD ?auto_25652 ?auto_25653 ) ( SUPPORTS ?auto_25652 ?auto_25646 ) ( POINTING ?auto_25653 ?auto_25654 ) ( not ( = ?auto_25649 ?auto_25654 ) ) ( HAVE_IMAGE ?auto_25647 ?auto_25648 ) ( not ( = ?auto_25647 ?auto_25654 ) ) ( not ( = ?auto_25648 ?auto_25646 ) ) ( CALIBRATION_TARGET ?auto_25652 ?auto_25654 ) ( POWER_AVAIL ?auto_25653 ) ( HAVE_IMAGE ?auto_25651 ?auto_25650 ) ( not ( = ?auto_25648 ?auto_25650 ) ) ( not ( = ?auto_25646 ?auto_25650 ) ) ( not ( = ?auto_25651 ?auto_25654 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25647 ?auto_25648 ?auto_25649 ?auto_25646 )
      ( GET-3IMAGE-VERIFY ?auto_25647 ?auto_25648 ?auto_25649 ?auto_25646 ?auto_25651 ?auto_25650 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25719 - DIRECTION
      ?auto_25720 - MODE
      ?auto_25721 - DIRECTION
      ?auto_25718 - MODE
      ?auto_25723 - DIRECTION
      ?auto_25722 - MODE
    )
    :vars
    (
      ?auto_25724 - INSTRUMENT
      ?auto_25725 - SATELLITE
      ?auto_25726 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25721 ?auto_25719 ) ) ( not ( = ?auto_25723 ?auto_25719 ) ) ( not ( = ?auto_25723 ?auto_25721 ) ) ( ON_BOARD ?auto_25724 ?auto_25725 ) ( SUPPORTS ?auto_25724 ?auto_25720 ) ( POINTING ?auto_25725 ?auto_25726 ) ( not ( = ?auto_25719 ?auto_25726 ) ) ( HAVE_IMAGE ?auto_25721 ?auto_25718 ) ( not ( = ?auto_25721 ?auto_25726 ) ) ( not ( = ?auto_25718 ?auto_25720 ) ) ( CALIBRATION_TARGET ?auto_25724 ?auto_25726 ) ( POWER_AVAIL ?auto_25725 ) ( HAVE_IMAGE ?auto_25723 ?auto_25722 ) ( not ( = ?auto_25720 ?auto_25722 ) ) ( not ( = ?auto_25718 ?auto_25722 ) ) ( not ( = ?auto_25723 ?auto_25726 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25721 ?auto_25718 ?auto_25719 ?auto_25720 )
      ( GET-3IMAGE-VERIFY ?auto_25719 ?auto_25720 ?auto_25721 ?auto_25718 ?auto_25723 ?auto_25722 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_25795 - DIRECTION
      ?auto_25796 - MODE
    )
    :vars
    (
      ?auto_25799 - DIRECTION
      ?auto_25797 - INSTRUMENT
      ?auto_25798 - SATELLITE
      ?auto_25800 - DIRECTION
      ?auto_25801 - MODE
      ?auto_25802 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25795 ?auto_25799 ) ) ( ON_BOARD ?auto_25797 ?auto_25798 ) ( SUPPORTS ?auto_25797 ?auto_25796 ) ( not ( = ?auto_25795 ?auto_25800 ) ) ( HAVE_IMAGE ?auto_25799 ?auto_25801 ) ( not ( = ?auto_25799 ?auto_25800 ) ) ( not ( = ?auto_25801 ?auto_25796 ) ) ( CALIBRATION_TARGET ?auto_25797 ?auto_25800 ) ( POWER_AVAIL ?auto_25798 ) ( POINTING ?auto_25798 ?auto_25802 ) ( not ( = ?auto_25800 ?auto_25802 ) ) ( not ( = ?auto_25795 ?auto_25802 ) ) ( not ( = ?auto_25799 ?auto_25802 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_25798 ?auto_25800 ?auto_25802 )
      ( GET-2IMAGE ?auto_25799 ?auto_25801 ?auto_25795 ?auto_25796 )
      ( GET-1IMAGE-VERIFY ?auto_25795 ?auto_25796 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25804 - DIRECTION
      ?auto_25805 - MODE
      ?auto_25806 - DIRECTION
      ?auto_25803 - MODE
    )
    :vars
    (
      ?auto_25810 - INSTRUMENT
      ?auto_25809 - SATELLITE
      ?auto_25808 - DIRECTION
      ?auto_25807 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25806 ?auto_25804 ) ) ( ON_BOARD ?auto_25810 ?auto_25809 ) ( SUPPORTS ?auto_25810 ?auto_25803 ) ( not ( = ?auto_25806 ?auto_25808 ) ) ( HAVE_IMAGE ?auto_25804 ?auto_25805 ) ( not ( = ?auto_25804 ?auto_25808 ) ) ( not ( = ?auto_25805 ?auto_25803 ) ) ( CALIBRATION_TARGET ?auto_25810 ?auto_25808 ) ( POWER_AVAIL ?auto_25809 ) ( POINTING ?auto_25809 ?auto_25807 ) ( not ( = ?auto_25808 ?auto_25807 ) ) ( not ( = ?auto_25806 ?auto_25807 ) ) ( not ( = ?auto_25804 ?auto_25807 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25806 ?auto_25803 )
      ( GET-2IMAGE-VERIFY ?auto_25804 ?auto_25805 ?auto_25806 ?auto_25803 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25812 - DIRECTION
      ?auto_25813 - MODE
      ?auto_25814 - DIRECTION
      ?auto_25811 - MODE
    )
    :vars
    (
      ?auto_25818 - DIRECTION
      ?auto_25815 - INSTRUMENT
      ?auto_25816 - SATELLITE
      ?auto_25817 - DIRECTION
      ?auto_25819 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_25814 ?auto_25812 ) ) ( not ( = ?auto_25814 ?auto_25818 ) ) ( ON_BOARD ?auto_25815 ?auto_25816 ) ( SUPPORTS ?auto_25815 ?auto_25811 ) ( not ( = ?auto_25814 ?auto_25817 ) ) ( HAVE_IMAGE ?auto_25818 ?auto_25819 ) ( not ( = ?auto_25818 ?auto_25817 ) ) ( not ( = ?auto_25819 ?auto_25811 ) ) ( CALIBRATION_TARGET ?auto_25815 ?auto_25817 ) ( POWER_AVAIL ?auto_25816 ) ( POINTING ?auto_25816 ?auto_25812 ) ( not ( = ?auto_25817 ?auto_25812 ) ) ( not ( = ?auto_25818 ?auto_25812 ) ) ( HAVE_IMAGE ?auto_25812 ?auto_25813 ) ( not ( = ?auto_25813 ?auto_25811 ) ) ( not ( = ?auto_25813 ?auto_25819 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25818 ?auto_25819 ?auto_25814 ?auto_25811 )
      ( GET-2IMAGE-VERIFY ?auto_25812 ?auto_25813 ?auto_25814 ?auto_25811 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25821 - DIRECTION
      ?auto_25822 - MODE
      ?auto_25823 - DIRECTION
      ?auto_25820 - MODE
    )
    :vars
    (
      ?auto_25824 - INSTRUMENT
      ?auto_25825 - SATELLITE
      ?auto_25827 - DIRECTION
      ?auto_25826 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25823 ?auto_25821 ) ) ( ON_BOARD ?auto_25824 ?auto_25825 ) ( SUPPORTS ?auto_25824 ?auto_25822 ) ( not ( = ?auto_25821 ?auto_25827 ) ) ( HAVE_IMAGE ?auto_25823 ?auto_25820 ) ( not ( = ?auto_25823 ?auto_25827 ) ) ( not ( = ?auto_25820 ?auto_25822 ) ) ( CALIBRATION_TARGET ?auto_25824 ?auto_25827 ) ( POWER_AVAIL ?auto_25825 ) ( POINTING ?auto_25825 ?auto_25826 ) ( not ( = ?auto_25827 ?auto_25826 ) ) ( not ( = ?auto_25821 ?auto_25826 ) ) ( not ( = ?auto_25823 ?auto_25826 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25823 ?auto_25820 ?auto_25821 ?auto_25822 )
      ( GET-2IMAGE-VERIFY ?auto_25821 ?auto_25822 ?auto_25823 ?auto_25820 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25829 - DIRECTION
      ?auto_25830 - MODE
      ?auto_25831 - DIRECTION
      ?auto_25828 - MODE
    )
    :vars
    (
      ?auto_25835 - DIRECTION
      ?auto_25832 - INSTRUMENT
      ?auto_25833 - SATELLITE
      ?auto_25834 - DIRECTION
      ?auto_25836 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_25831 ?auto_25829 ) ) ( not ( = ?auto_25829 ?auto_25835 ) ) ( ON_BOARD ?auto_25832 ?auto_25833 ) ( SUPPORTS ?auto_25832 ?auto_25830 ) ( not ( = ?auto_25829 ?auto_25834 ) ) ( HAVE_IMAGE ?auto_25835 ?auto_25836 ) ( not ( = ?auto_25835 ?auto_25834 ) ) ( not ( = ?auto_25836 ?auto_25830 ) ) ( CALIBRATION_TARGET ?auto_25832 ?auto_25834 ) ( POWER_AVAIL ?auto_25833 ) ( POINTING ?auto_25833 ?auto_25831 ) ( not ( = ?auto_25834 ?auto_25831 ) ) ( not ( = ?auto_25835 ?auto_25831 ) ) ( HAVE_IMAGE ?auto_25831 ?auto_25828 ) ( not ( = ?auto_25830 ?auto_25828 ) ) ( not ( = ?auto_25828 ?auto_25836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25835 ?auto_25836 ?auto_25829 ?auto_25830 )
      ( GET-2IMAGE-VERIFY ?auto_25829 ?auto_25830 ?auto_25831 ?auto_25828 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25858 - DIRECTION
      ?auto_25859 - MODE
      ?auto_25860 - DIRECTION
      ?auto_25857 - MODE
      ?auto_25862 - DIRECTION
      ?auto_25861 - MODE
    )
    :vars
    (
      ?auto_25863 - INSTRUMENT
      ?auto_25864 - SATELLITE
      ?auto_25865 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25860 ?auto_25858 ) ) ( not ( = ?auto_25862 ?auto_25858 ) ) ( not ( = ?auto_25862 ?auto_25860 ) ) ( ON_BOARD ?auto_25863 ?auto_25864 ) ( SUPPORTS ?auto_25863 ?auto_25861 ) ( not ( = ?auto_25862 ?auto_25865 ) ) ( HAVE_IMAGE ?auto_25858 ?auto_25859 ) ( not ( = ?auto_25858 ?auto_25865 ) ) ( not ( = ?auto_25859 ?auto_25861 ) ) ( CALIBRATION_TARGET ?auto_25863 ?auto_25865 ) ( POWER_AVAIL ?auto_25864 ) ( POINTING ?auto_25864 ?auto_25860 ) ( not ( = ?auto_25865 ?auto_25860 ) ) ( HAVE_IMAGE ?auto_25860 ?auto_25857 ) ( not ( = ?auto_25859 ?auto_25857 ) ) ( not ( = ?auto_25857 ?auto_25861 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25858 ?auto_25859 ?auto_25862 ?auto_25861 )
      ( GET-3IMAGE-VERIFY ?auto_25858 ?auto_25859 ?auto_25860 ?auto_25857 ?auto_25862 ?auto_25861 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25877 - DIRECTION
      ?auto_25878 - MODE
      ?auto_25879 - DIRECTION
      ?auto_25876 - MODE
      ?auto_25881 - DIRECTION
      ?auto_25880 - MODE
    )
    :vars
    (
      ?auto_25882 - INSTRUMENT
      ?auto_25883 - SATELLITE
      ?auto_25884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25879 ?auto_25877 ) ) ( not ( = ?auto_25881 ?auto_25877 ) ) ( not ( = ?auto_25881 ?auto_25879 ) ) ( ON_BOARD ?auto_25882 ?auto_25883 ) ( SUPPORTS ?auto_25882 ?auto_25876 ) ( not ( = ?auto_25879 ?auto_25884 ) ) ( HAVE_IMAGE ?auto_25877 ?auto_25878 ) ( not ( = ?auto_25877 ?auto_25884 ) ) ( not ( = ?auto_25878 ?auto_25876 ) ) ( CALIBRATION_TARGET ?auto_25882 ?auto_25884 ) ( POWER_AVAIL ?auto_25883 ) ( POINTING ?auto_25883 ?auto_25881 ) ( not ( = ?auto_25884 ?auto_25881 ) ) ( HAVE_IMAGE ?auto_25881 ?auto_25880 ) ( not ( = ?auto_25878 ?auto_25880 ) ) ( not ( = ?auto_25876 ?auto_25880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25877 ?auto_25878 ?auto_25879 ?auto_25876 )
      ( GET-3IMAGE-VERIFY ?auto_25877 ?auto_25878 ?auto_25879 ?auto_25876 ?auto_25881 ?auto_25880 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25896 - DIRECTION
      ?auto_25897 - MODE
      ?auto_25898 - DIRECTION
      ?auto_25895 - MODE
      ?auto_25900 - DIRECTION
      ?auto_25899 - MODE
    )
    :vars
    (
      ?auto_25901 - INSTRUMENT
      ?auto_25902 - SATELLITE
      ?auto_25903 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25898 ?auto_25896 ) ) ( not ( = ?auto_25900 ?auto_25896 ) ) ( not ( = ?auto_25900 ?auto_25898 ) ) ( ON_BOARD ?auto_25901 ?auto_25902 ) ( SUPPORTS ?auto_25901 ?auto_25899 ) ( not ( = ?auto_25900 ?auto_25903 ) ) ( HAVE_IMAGE ?auto_25898 ?auto_25895 ) ( not ( = ?auto_25898 ?auto_25903 ) ) ( not ( = ?auto_25895 ?auto_25899 ) ) ( CALIBRATION_TARGET ?auto_25901 ?auto_25903 ) ( POWER_AVAIL ?auto_25902 ) ( POINTING ?auto_25902 ?auto_25896 ) ( not ( = ?auto_25903 ?auto_25896 ) ) ( HAVE_IMAGE ?auto_25896 ?auto_25897 ) ( not ( = ?auto_25897 ?auto_25895 ) ) ( not ( = ?auto_25897 ?auto_25899 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25898 ?auto_25895 ?auto_25900 ?auto_25899 )
      ( GET-3IMAGE-VERIFY ?auto_25896 ?auto_25897 ?auto_25898 ?auto_25895 ?auto_25900 ?auto_25899 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25916 - DIRECTION
      ?auto_25917 - MODE
      ?auto_25918 - DIRECTION
      ?auto_25915 - MODE
      ?auto_25920 - DIRECTION
      ?auto_25919 - MODE
    )
    :vars
    (
      ?auto_25921 - INSTRUMENT
      ?auto_25922 - SATELLITE
      ?auto_25923 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25918 ?auto_25916 ) ) ( not ( = ?auto_25920 ?auto_25916 ) ) ( not ( = ?auto_25920 ?auto_25918 ) ) ( ON_BOARD ?auto_25921 ?auto_25922 ) ( SUPPORTS ?auto_25921 ?auto_25915 ) ( not ( = ?auto_25918 ?auto_25923 ) ) ( HAVE_IMAGE ?auto_25920 ?auto_25919 ) ( not ( = ?auto_25920 ?auto_25923 ) ) ( not ( = ?auto_25919 ?auto_25915 ) ) ( CALIBRATION_TARGET ?auto_25921 ?auto_25923 ) ( POWER_AVAIL ?auto_25922 ) ( POINTING ?auto_25922 ?auto_25916 ) ( not ( = ?auto_25923 ?auto_25916 ) ) ( HAVE_IMAGE ?auto_25916 ?auto_25917 ) ( not ( = ?auto_25917 ?auto_25915 ) ) ( not ( = ?auto_25917 ?auto_25919 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25920 ?auto_25919 ?auto_25918 ?auto_25915 )
      ( GET-3IMAGE-VERIFY ?auto_25916 ?auto_25917 ?auto_25918 ?auto_25915 ?auto_25920 ?auto_25919 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25957 - DIRECTION
      ?auto_25958 - MODE
      ?auto_25959 - DIRECTION
      ?auto_25956 - MODE
      ?auto_25961 - DIRECTION
      ?auto_25960 - MODE
    )
    :vars
    (
      ?auto_25962 - INSTRUMENT
      ?auto_25963 - SATELLITE
      ?auto_25964 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25959 ?auto_25957 ) ) ( not ( = ?auto_25961 ?auto_25957 ) ) ( not ( = ?auto_25961 ?auto_25959 ) ) ( ON_BOARD ?auto_25962 ?auto_25963 ) ( SUPPORTS ?auto_25962 ?auto_25958 ) ( not ( = ?auto_25957 ?auto_25964 ) ) ( HAVE_IMAGE ?auto_25959 ?auto_25956 ) ( not ( = ?auto_25959 ?auto_25964 ) ) ( not ( = ?auto_25956 ?auto_25958 ) ) ( CALIBRATION_TARGET ?auto_25962 ?auto_25964 ) ( POWER_AVAIL ?auto_25963 ) ( POINTING ?auto_25963 ?auto_25961 ) ( not ( = ?auto_25964 ?auto_25961 ) ) ( HAVE_IMAGE ?auto_25961 ?auto_25960 ) ( not ( = ?auto_25958 ?auto_25960 ) ) ( not ( = ?auto_25956 ?auto_25960 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25959 ?auto_25956 ?auto_25957 ?auto_25958 )
      ( GET-3IMAGE-VERIFY ?auto_25957 ?auto_25958 ?auto_25959 ?auto_25956 ?auto_25961 ?auto_25960 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25976 - DIRECTION
      ?auto_25977 - MODE
      ?auto_25978 - DIRECTION
      ?auto_25975 - MODE
      ?auto_25980 - DIRECTION
      ?auto_25979 - MODE
    )
    :vars
    (
      ?auto_25981 - INSTRUMENT
      ?auto_25982 - SATELLITE
      ?auto_25983 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_25978 ?auto_25976 ) ) ( not ( = ?auto_25980 ?auto_25976 ) ) ( not ( = ?auto_25980 ?auto_25978 ) ) ( ON_BOARD ?auto_25981 ?auto_25982 ) ( SUPPORTS ?auto_25981 ?auto_25977 ) ( not ( = ?auto_25976 ?auto_25983 ) ) ( HAVE_IMAGE ?auto_25980 ?auto_25979 ) ( not ( = ?auto_25980 ?auto_25983 ) ) ( not ( = ?auto_25979 ?auto_25977 ) ) ( CALIBRATION_TARGET ?auto_25981 ?auto_25983 ) ( POWER_AVAIL ?auto_25982 ) ( POINTING ?auto_25982 ?auto_25978 ) ( not ( = ?auto_25983 ?auto_25978 ) ) ( HAVE_IMAGE ?auto_25978 ?auto_25975 ) ( not ( = ?auto_25977 ?auto_25975 ) ) ( not ( = ?auto_25975 ?auto_25979 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25980 ?auto_25979 ?auto_25976 ?auto_25977 )
      ( GET-3IMAGE-VERIFY ?auto_25976 ?auto_25977 ?auto_25978 ?auto_25975 ?auto_25980 ?auto_25979 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26039 - DIRECTION
      ?auto_26040 - MODE
    )
    :vars
    (
      ?auto_26045 - DIRECTION
      ?auto_26041 - INSTRUMENT
      ?auto_26042 - SATELLITE
      ?auto_26044 - DIRECTION
      ?auto_26046 - MODE
      ?auto_26043 - DIRECTION
      ?auto_26047 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26039 ?auto_26045 ) ) ( ON_BOARD ?auto_26041 ?auto_26042 ) ( SUPPORTS ?auto_26041 ?auto_26040 ) ( not ( = ?auto_26039 ?auto_26044 ) ) ( HAVE_IMAGE ?auto_26045 ?auto_26046 ) ( not ( = ?auto_26045 ?auto_26044 ) ) ( not ( = ?auto_26046 ?auto_26040 ) ) ( CALIBRATION_TARGET ?auto_26041 ?auto_26044 ) ( POINTING ?auto_26042 ?auto_26043 ) ( not ( = ?auto_26044 ?auto_26043 ) ) ( not ( = ?auto_26039 ?auto_26043 ) ) ( not ( = ?auto_26045 ?auto_26043 ) ) ( ON_BOARD ?auto_26047 ?auto_26042 ) ( POWER_ON ?auto_26047 ) ( not ( = ?auto_26041 ?auto_26047 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_26047 ?auto_26042 )
      ( GET-2IMAGE ?auto_26045 ?auto_26046 ?auto_26039 ?auto_26040 )
      ( GET-1IMAGE-VERIFY ?auto_26039 ?auto_26040 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26049 - DIRECTION
      ?auto_26050 - MODE
      ?auto_26051 - DIRECTION
      ?auto_26048 - MODE
    )
    :vars
    (
      ?auto_26053 - INSTRUMENT
      ?auto_26052 - SATELLITE
      ?auto_26054 - DIRECTION
      ?auto_26055 - DIRECTION
      ?auto_26056 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26051 ?auto_26049 ) ) ( ON_BOARD ?auto_26053 ?auto_26052 ) ( SUPPORTS ?auto_26053 ?auto_26048 ) ( not ( = ?auto_26051 ?auto_26054 ) ) ( HAVE_IMAGE ?auto_26049 ?auto_26050 ) ( not ( = ?auto_26049 ?auto_26054 ) ) ( not ( = ?auto_26050 ?auto_26048 ) ) ( CALIBRATION_TARGET ?auto_26053 ?auto_26054 ) ( POINTING ?auto_26052 ?auto_26055 ) ( not ( = ?auto_26054 ?auto_26055 ) ) ( not ( = ?auto_26051 ?auto_26055 ) ) ( not ( = ?auto_26049 ?auto_26055 ) ) ( ON_BOARD ?auto_26056 ?auto_26052 ) ( POWER_ON ?auto_26056 ) ( not ( = ?auto_26053 ?auto_26056 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26051 ?auto_26048 )
      ( GET-2IMAGE-VERIFY ?auto_26049 ?auto_26050 ?auto_26051 ?auto_26048 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26058 - DIRECTION
      ?auto_26059 - MODE
      ?auto_26060 - DIRECTION
      ?auto_26057 - MODE
    )
    :vars
    (
      ?auto_26066 - DIRECTION
      ?auto_26061 - INSTRUMENT
      ?auto_26065 - SATELLITE
      ?auto_26062 - DIRECTION
      ?auto_26063 - MODE
      ?auto_26064 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26060 ?auto_26058 ) ) ( not ( = ?auto_26060 ?auto_26066 ) ) ( ON_BOARD ?auto_26061 ?auto_26065 ) ( SUPPORTS ?auto_26061 ?auto_26057 ) ( not ( = ?auto_26060 ?auto_26062 ) ) ( HAVE_IMAGE ?auto_26066 ?auto_26063 ) ( not ( = ?auto_26066 ?auto_26062 ) ) ( not ( = ?auto_26063 ?auto_26057 ) ) ( CALIBRATION_TARGET ?auto_26061 ?auto_26062 ) ( POINTING ?auto_26065 ?auto_26058 ) ( not ( = ?auto_26062 ?auto_26058 ) ) ( not ( = ?auto_26066 ?auto_26058 ) ) ( ON_BOARD ?auto_26064 ?auto_26065 ) ( POWER_ON ?auto_26064 ) ( not ( = ?auto_26061 ?auto_26064 ) ) ( HAVE_IMAGE ?auto_26058 ?auto_26059 ) ( not ( = ?auto_26059 ?auto_26057 ) ) ( not ( = ?auto_26059 ?auto_26063 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26066 ?auto_26063 ?auto_26060 ?auto_26057 )
      ( GET-2IMAGE-VERIFY ?auto_26058 ?auto_26059 ?auto_26060 ?auto_26057 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26068 - DIRECTION
      ?auto_26069 - MODE
      ?auto_26070 - DIRECTION
      ?auto_26067 - MODE
    )
    :vars
    (
      ?auto_26071 - INSTRUMENT
      ?auto_26075 - SATELLITE
      ?auto_26073 - DIRECTION
      ?auto_26072 - DIRECTION
      ?auto_26074 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26070 ?auto_26068 ) ) ( ON_BOARD ?auto_26071 ?auto_26075 ) ( SUPPORTS ?auto_26071 ?auto_26069 ) ( not ( = ?auto_26068 ?auto_26073 ) ) ( HAVE_IMAGE ?auto_26070 ?auto_26067 ) ( not ( = ?auto_26070 ?auto_26073 ) ) ( not ( = ?auto_26067 ?auto_26069 ) ) ( CALIBRATION_TARGET ?auto_26071 ?auto_26073 ) ( POINTING ?auto_26075 ?auto_26072 ) ( not ( = ?auto_26073 ?auto_26072 ) ) ( not ( = ?auto_26068 ?auto_26072 ) ) ( not ( = ?auto_26070 ?auto_26072 ) ) ( ON_BOARD ?auto_26074 ?auto_26075 ) ( POWER_ON ?auto_26074 ) ( not ( = ?auto_26071 ?auto_26074 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26070 ?auto_26067 ?auto_26068 ?auto_26069 )
      ( GET-2IMAGE-VERIFY ?auto_26068 ?auto_26069 ?auto_26070 ?auto_26067 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26077 - DIRECTION
      ?auto_26078 - MODE
      ?auto_26079 - DIRECTION
      ?auto_26076 - MODE
    )
    :vars
    (
      ?auto_26085 - DIRECTION
      ?auto_26080 - INSTRUMENT
      ?auto_26084 - SATELLITE
      ?auto_26081 - DIRECTION
      ?auto_26082 - MODE
      ?auto_26083 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26079 ?auto_26077 ) ) ( not ( = ?auto_26077 ?auto_26085 ) ) ( ON_BOARD ?auto_26080 ?auto_26084 ) ( SUPPORTS ?auto_26080 ?auto_26078 ) ( not ( = ?auto_26077 ?auto_26081 ) ) ( HAVE_IMAGE ?auto_26085 ?auto_26082 ) ( not ( = ?auto_26085 ?auto_26081 ) ) ( not ( = ?auto_26082 ?auto_26078 ) ) ( CALIBRATION_TARGET ?auto_26080 ?auto_26081 ) ( POINTING ?auto_26084 ?auto_26079 ) ( not ( = ?auto_26081 ?auto_26079 ) ) ( not ( = ?auto_26085 ?auto_26079 ) ) ( ON_BOARD ?auto_26083 ?auto_26084 ) ( POWER_ON ?auto_26083 ) ( not ( = ?auto_26080 ?auto_26083 ) ) ( HAVE_IMAGE ?auto_26079 ?auto_26076 ) ( not ( = ?auto_26078 ?auto_26076 ) ) ( not ( = ?auto_26076 ?auto_26082 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26085 ?auto_26082 ?auto_26077 ?auto_26078 )
      ( GET-2IMAGE-VERIFY ?auto_26077 ?auto_26078 ?auto_26079 ?auto_26076 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26109 - DIRECTION
      ?auto_26110 - MODE
      ?auto_26111 - DIRECTION
      ?auto_26108 - MODE
      ?auto_26113 - DIRECTION
      ?auto_26112 - MODE
    )
    :vars
    (
      ?auto_26114 - INSTRUMENT
      ?auto_26117 - SATELLITE
      ?auto_26115 - DIRECTION
      ?auto_26116 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26111 ?auto_26109 ) ) ( not ( = ?auto_26113 ?auto_26109 ) ) ( not ( = ?auto_26113 ?auto_26111 ) ) ( ON_BOARD ?auto_26114 ?auto_26117 ) ( SUPPORTS ?auto_26114 ?auto_26112 ) ( not ( = ?auto_26113 ?auto_26115 ) ) ( HAVE_IMAGE ?auto_26109 ?auto_26110 ) ( not ( = ?auto_26109 ?auto_26115 ) ) ( not ( = ?auto_26110 ?auto_26112 ) ) ( CALIBRATION_TARGET ?auto_26114 ?auto_26115 ) ( POINTING ?auto_26117 ?auto_26111 ) ( not ( = ?auto_26115 ?auto_26111 ) ) ( ON_BOARD ?auto_26116 ?auto_26117 ) ( POWER_ON ?auto_26116 ) ( not ( = ?auto_26114 ?auto_26116 ) ) ( HAVE_IMAGE ?auto_26111 ?auto_26108 ) ( not ( = ?auto_26110 ?auto_26108 ) ) ( not ( = ?auto_26108 ?auto_26112 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26109 ?auto_26110 ?auto_26113 ?auto_26112 )
      ( GET-3IMAGE-VERIFY ?auto_26109 ?auto_26110 ?auto_26111 ?auto_26108 ?auto_26113 ?auto_26112 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26130 - DIRECTION
      ?auto_26131 - MODE
      ?auto_26132 - DIRECTION
      ?auto_26129 - MODE
      ?auto_26134 - DIRECTION
      ?auto_26133 - MODE
    )
    :vars
    (
      ?auto_26135 - INSTRUMENT
      ?auto_26138 - SATELLITE
      ?auto_26136 - DIRECTION
      ?auto_26137 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26132 ?auto_26130 ) ) ( not ( = ?auto_26134 ?auto_26130 ) ) ( not ( = ?auto_26134 ?auto_26132 ) ) ( ON_BOARD ?auto_26135 ?auto_26138 ) ( SUPPORTS ?auto_26135 ?auto_26129 ) ( not ( = ?auto_26132 ?auto_26136 ) ) ( HAVE_IMAGE ?auto_26130 ?auto_26131 ) ( not ( = ?auto_26130 ?auto_26136 ) ) ( not ( = ?auto_26131 ?auto_26129 ) ) ( CALIBRATION_TARGET ?auto_26135 ?auto_26136 ) ( POINTING ?auto_26138 ?auto_26134 ) ( not ( = ?auto_26136 ?auto_26134 ) ) ( ON_BOARD ?auto_26137 ?auto_26138 ) ( POWER_ON ?auto_26137 ) ( not ( = ?auto_26135 ?auto_26137 ) ) ( HAVE_IMAGE ?auto_26134 ?auto_26133 ) ( not ( = ?auto_26131 ?auto_26133 ) ) ( not ( = ?auto_26129 ?auto_26133 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26130 ?auto_26131 ?auto_26132 ?auto_26129 )
      ( GET-3IMAGE-VERIFY ?auto_26130 ?auto_26131 ?auto_26132 ?auto_26129 ?auto_26134 ?auto_26133 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26151 - DIRECTION
      ?auto_26152 - MODE
      ?auto_26153 - DIRECTION
      ?auto_26150 - MODE
      ?auto_26155 - DIRECTION
      ?auto_26154 - MODE
    )
    :vars
    (
      ?auto_26156 - INSTRUMENT
      ?auto_26159 - SATELLITE
      ?auto_26157 - DIRECTION
      ?auto_26158 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26153 ?auto_26151 ) ) ( not ( = ?auto_26155 ?auto_26151 ) ) ( not ( = ?auto_26155 ?auto_26153 ) ) ( ON_BOARD ?auto_26156 ?auto_26159 ) ( SUPPORTS ?auto_26156 ?auto_26154 ) ( not ( = ?auto_26155 ?auto_26157 ) ) ( HAVE_IMAGE ?auto_26153 ?auto_26150 ) ( not ( = ?auto_26153 ?auto_26157 ) ) ( not ( = ?auto_26150 ?auto_26154 ) ) ( CALIBRATION_TARGET ?auto_26156 ?auto_26157 ) ( POINTING ?auto_26159 ?auto_26151 ) ( not ( = ?auto_26157 ?auto_26151 ) ) ( ON_BOARD ?auto_26158 ?auto_26159 ) ( POWER_ON ?auto_26158 ) ( not ( = ?auto_26156 ?auto_26158 ) ) ( HAVE_IMAGE ?auto_26151 ?auto_26152 ) ( not ( = ?auto_26152 ?auto_26150 ) ) ( not ( = ?auto_26152 ?auto_26154 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26153 ?auto_26150 ?auto_26155 ?auto_26154 )
      ( GET-3IMAGE-VERIFY ?auto_26151 ?auto_26152 ?auto_26153 ?auto_26150 ?auto_26155 ?auto_26154 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26173 - DIRECTION
      ?auto_26174 - MODE
      ?auto_26175 - DIRECTION
      ?auto_26172 - MODE
      ?auto_26177 - DIRECTION
      ?auto_26176 - MODE
    )
    :vars
    (
      ?auto_26178 - INSTRUMENT
      ?auto_26181 - SATELLITE
      ?auto_26179 - DIRECTION
      ?auto_26180 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26175 ?auto_26173 ) ) ( not ( = ?auto_26177 ?auto_26173 ) ) ( not ( = ?auto_26177 ?auto_26175 ) ) ( ON_BOARD ?auto_26178 ?auto_26181 ) ( SUPPORTS ?auto_26178 ?auto_26172 ) ( not ( = ?auto_26175 ?auto_26179 ) ) ( HAVE_IMAGE ?auto_26177 ?auto_26176 ) ( not ( = ?auto_26177 ?auto_26179 ) ) ( not ( = ?auto_26176 ?auto_26172 ) ) ( CALIBRATION_TARGET ?auto_26178 ?auto_26179 ) ( POINTING ?auto_26181 ?auto_26173 ) ( not ( = ?auto_26179 ?auto_26173 ) ) ( ON_BOARD ?auto_26180 ?auto_26181 ) ( POWER_ON ?auto_26180 ) ( not ( = ?auto_26178 ?auto_26180 ) ) ( HAVE_IMAGE ?auto_26173 ?auto_26174 ) ( not ( = ?auto_26174 ?auto_26172 ) ) ( not ( = ?auto_26174 ?auto_26176 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26177 ?auto_26176 ?auto_26175 ?auto_26172 )
      ( GET-3IMAGE-VERIFY ?auto_26173 ?auto_26174 ?auto_26175 ?auto_26172 ?auto_26177 ?auto_26176 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26218 - DIRECTION
      ?auto_26219 - MODE
      ?auto_26220 - DIRECTION
      ?auto_26217 - MODE
      ?auto_26222 - DIRECTION
      ?auto_26221 - MODE
    )
    :vars
    (
      ?auto_26223 - INSTRUMENT
      ?auto_26226 - SATELLITE
      ?auto_26224 - DIRECTION
      ?auto_26225 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26220 ?auto_26218 ) ) ( not ( = ?auto_26222 ?auto_26218 ) ) ( not ( = ?auto_26222 ?auto_26220 ) ) ( ON_BOARD ?auto_26223 ?auto_26226 ) ( SUPPORTS ?auto_26223 ?auto_26219 ) ( not ( = ?auto_26218 ?auto_26224 ) ) ( HAVE_IMAGE ?auto_26220 ?auto_26217 ) ( not ( = ?auto_26220 ?auto_26224 ) ) ( not ( = ?auto_26217 ?auto_26219 ) ) ( CALIBRATION_TARGET ?auto_26223 ?auto_26224 ) ( POINTING ?auto_26226 ?auto_26222 ) ( not ( = ?auto_26224 ?auto_26222 ) ) ( ON_BOARD ?auto_26225 ?auto_26226 ) ( POWER_ON ?auto_26225 ) ( not ( = ?auto_26223 ?auto_26225 ) ) ( HAVE_IMAGE ?auto_26222 ?auto_26221 ) ( not ( = ?auto_26219 ?auto_26221 ) ) ( not ( = ?auto_26217 ?auto_26221 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26220 ?auto_26217 ?auto_26218 ?auto_26219 )
      ( GET-3IMAGE-VERIFY ?auto_26218 ?auto_26219 ?auto_26220 ?auto_26217 ?auto_26222 ?auto_26221 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26239 - DIRECTION
      ?auto_26240 - MODE
      ?auto_26241 - DIRECTION
      ?auto_26238 - MODE
      ?auto_26243 - DIRECTION
      ?auto_26242 - MODE
    )
    :vars
    (
      ?auto_26244 - INSTRUMENT
      ?auto_26247 - SATELLITE
      ?auto_26245 - DIRECTION
      ?auto_26246 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26241 ?auto_26239 ) ) ( not ( = ?auto_26243 ?auto_26239 ) ) ( not ( = ?auto_26243 ?auto_26241 ) ) ( ON_BOARD ?auto_26244 ?auto_26247 ) ( SUPPORTS ?auto_26244 ?auto_26240 ) ( not ( = ?auto_26239 ?auto_26245 ) ) ( HAVE_IMAGE ?auto_26243 ?auto_26242 ) ( not ( = ?auto_26243 ?auto_26245 ) ) ( not ( = ?auto_26242 ?auto_26240 ) ) ( CALIBRATION_TARGET ?auto_26244 ?auto_26245 ) ( POINTING ?auto_26247 ?auto_26241 ) ( not ( = ?auto_26245 ?auto_26241 ) ) ( ON_BOARD ?auto_26246 ?auto_26247 ) ( POWER_ON ?auto_26246 ) ( not ( = ?auto_26244 ?auto_26246 ) ) ( HAVE_IMAGE ?auto_26241 ?auto_26238 ) ( not ( = ?auto_26240 ?auto_26238 ) ) ( not ( = ?auto_26238 ?auto_26242 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26243 ?auto_26242 ?auto_26239 ?auto_26240 )
      ( GET-3IMAGE-VERIFY ?auto_26239 ?auto_26240 ?auto_26241 ?auto_26238 ?auto_26243 ?auto_26242 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26560 - DIRECTION
      ?auto_26561 - MODE
    )
    :vars
    (
      ?auto_26562 - DIRECTION
      ?auto_26566 - INSTRUMENT
      ?auto_26563 - SATELLITE
      ?auto_26564 - DIRECTION
      ?auto_26567 - MODE
      ?auto_26565 - DIRECTION
      ?auto_26568 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26560 ?auto_26562 ) ) ( ON_BOARD ?auto_26566 ?auto_26563 ) ( SUPPORTS ?auto_26566 ?auto_26561 ) ( not ( = ?auto_26560 ?auto_26564 ) ) ( HAVE_IMAGE ?auto_26562 ?auto_26567 ) ( not ( = ?auto_26562 ?auto_26564 ) ) ( not ( = ?auto_26567 ?auto_26561 ) ) ( CALIBRATION_TARGET ?auto_26566 ?auto_26564 ) ( not ( = ?auto_26564 ?auto_26565 ) ) ( not ( = ?auto_26560 ?auto_26565 ) ) ( not ( = ?auto_26562 ?auto_26565 ) ) ( ON_BOARD ?auto_26568 ?auto_26563 ) ( POWER_ON ?auto_26568 ) ( not ( = ?auto_26566 ?auto_26568 ) ) ( POINTING ?auto_26563 ?auto_26564 ) )
    :subtasks
    ( ( !TURN_TO ?auto_26563 ?auto_26565 ?auto_26564 )
      ( GET-2IMAGE ?auto_26562 ?auto_26567 ?auto_26560 ?auto_26561 )
      ( GET-1IMAGE-VERIFY ?auto_26560 ?auto_26561 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26570 - DIRECTION
      ?auto_26571 - MODE
      ?auto_26572 - DIRECTION
      ?auto_26569 - MODE
    )
    :vars
    (
      ?auto_26573 - INSTRUMENT
      ?auto_26575 - SATELLITE
      ?auto_26574 - DIRECTION
      ?auto_26577 - DIRECTION
      ?auto_26576 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26572 ?auto_26570 ) ) ( ON_BOARD ?auto_26573 ?auto_26575 ) ( SUPPORTS ?auto_26573 ?auto_26569 ) ( not ( = ?auto_26572 ?auto_26574 ) ) ( HAVE_IMAGE ?auto_26570 ?auto_26571 ) ( not ( = ?auto_26570 ?auto_26574 ) ) ( not ( = ?auto_26571 ?auto_26569 ) ) ( CALIBRATION_TARGET ?auto_26573 ?auto_26574 ) ( not ( = ?auto_26574 ?auto_26577 ) ) ( not ( = ?auto_26572 ?auto_26577 ) ) ( not ( = ?auto_26570 ?auto_26577 ) ) ( ON_BOARD ?auto_26576 ?auto_26575 ) ( POWER_ON ?auto_26576 ) ( not ( = ?auto_26573 ?auto_26576 ) ) ( POINTING ?auto_26575 ?auto_26574 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26572 ?auto_26569 )
      ( GET-2IMAGE-VERIFY ?auto_26570 ?auto_26571 ?auto_26572 ?auto_26569 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26589 - DIRECTION
      ?auto_26590 - MODE
      ?auto_26591 - DIRECTION
      ?auto_26588 - MODE
    )
    :vars
    (
      ?auto_26595 - INSTRUMENT
      ?auto_26596 - SATELLITE
      ?auto_26592 - DIRECTION
      ?auto_26594 - DIRECTION
      ?auto_26593 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26591 ?auto_26589 ) ) ( ON_BOARD ?auto_26595 ?auto_26596 ) ( SUPPORTS ?auto_26595 ?auto_26590 ) ( not ( = ?auto_26589 ?auto_26592 ) ) ( HAVE_IMAGE ?auto_26591 ?auto_26588 ) ( not ( = ?auto_26591 ?auto_26592 ) ) ( not ( = ?auto_26588 ?auto_26590 ) ) ( CALIBRATION_TARGET ?auto_26595 ?auto_26592 ) ( not ( = ?auto_26592 ?auto_26594 ) ) ( not ( = ?auto_26589 ?auto_26594 ) ) ( not ( = ?auto_26591 ?auto_26594 ) ) ( ON_BOARD ?auto_26593 ?auto_26596 ) ( POWER_ON ?auto_26593 ) ( not ( = ?auto_26595 ?auto_26593 ) ) ( POINTING ?auto_26596 ?auto_26592 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26591 ?auto_26588 ?auto_26589 ?auto_26590 )
      ( GET-2IMAGE-VERIFY ?auto_26589 ?auto_26590 ?auto_26591 ?auto_26588 ) )
  )

)

