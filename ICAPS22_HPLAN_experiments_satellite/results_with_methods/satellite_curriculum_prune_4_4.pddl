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
      ?auto_20977 - DIRECTION
      ?auto_20978 - MODE
    )
    :vars
    (
      ?auto_20979 - INSTRUMENT
      ?auto_20980 - SATELLITE
      ?auto_20981 - DIRECTION
      ?auto_20982 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20979 ?auto_20980 ) ( SUPPORTS ?auto_20979 ?auto_20978 ) ( not ( = ?auto_20977 ?auto_20981 ) ) ( CALIBRATION_TARGET ?auto_20979 ?auto_20981 ) ( POWER_AVAIL ?auto_20980 ) ( POINTING ?auto_20980 ?auto_20982 ) ( not ( = ?auto_20981 ?auto_20982 ) ) ( not ( = ?auto_20977 ?auto_20982 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20980 ?auto_20981 ?auto_20982 )
      ( !SWITCH_ON ?auto_20979 ?auto_20980 )
      ( !CALIBRATE ?auto_20980 ?auto_20979 ?auto_20981 )
      ( !TURN_TO ?auto_20980 ?auto_20977 ?auto_20981 )
      ( !TAKE_IMAGE ?auto_20980 ?auto_20977 ?auto_20979 ?auto_20978 )
      ( GET-1IMAGE-VERIFY ?auto_20977 ?auto_20978 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20985 - DIRECTION
      ?auto_20986 - MODE
    )
    :vars
    (
      ?auto_20987 - INSTRUMENT
      ?auto_20988 - SATELLITE
      ?auto_20989 - DIRECTION
      ?auto_20990 - DIRECTION
      ?auto_20991 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20987 ?auto_20988 ) ( SUPPORTS ?auto_20987 ?auto_20986 ) ( not ( = ?auto_20985 ?auto_20989 ) ) ( CALIBRATION_TARGET ?auto_20987 ?auto_20989 ) ( POINTING ?auto_20988 ?auto_20990 ) ( not ( = ?auto_20989 ?auto_20990 ) ) ( ON_BOARD ?auto_20991 ?auto_20988 ) ( POWER_ON ?auto_20991 ) ( not ( = ?auto_20985 ?auto_20990 ) ) ( not ( = ?auto_20987 ?auto_20991 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_20991 ?auto_20988 )
      ( !TURN_TO ?auto_20988 ?auto_20989 ?auto_20990 )
      ( !SWITCH_ON ?auto_20987 ?auto_20988 )
      ( !CALIBRATE ?auto_20988 ?auto_20987 ?auto_20989 )
      ( !TURN_TO ?auto_20988 ?auto_20985 ?auto_20989 )
      ( !TAKE_IMAGE ?auto_20988 ?auto_20985 ?auto_20987 ?auto_20986 )
      ( GET-1IMAGE-VERIFY ?auto_20985 ?auto_20986 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21004 - DIRECTION
      ?auto_21005 - MODE
      ?auto_21007 - DIRECTION
      ?auto_21006 - MODE
    )
    :vars
    (
      ?auto_21011 - INSTRUMENT
      ?auto_21008 - SATELLITE
      ?auto_21010 - DIRECTION
      ?auto_21009 - INSTRUMENT
      ?auto_21012 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_21007 ?auto_21004 ) ) ( ON_BOARD ?auto_21011 ?auto_21008 ) ( SUPPORTS ?auto_21011 ?auto_21006 ) ( not ( = ?auto_21007 ?auto_21010 ) ) ( CALIBRATION_TARGET ?auto_21011 ?auto_21010 ) ( not ( = ?auto_21010 ?auto_21004 ) ) ( ON_BOARD ?auto_21009 ?auto_21008 ) ( not ( = ?auto_21011 ?auto_21009 ) ) ( SUPPORTS ?auto_21009 ?auto_21005 ) ( CALIBRATION_TARGET ?auto_21009 ?auto_21010 ) ( POWER_AVAIL ?auto_21008 ) ( POINTING ?auto_21008 ?auto_21012 ) ( not ( = ?auto_21010 ?auto_21012 ) ) ( not ( = ?auto_21004 ?auto_21012 ) ) ( not ( = ?auto_21005 ?auto_21006 ) ) ( not ( = ?auto_21007 ?auto_21012 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21004 ?auto_21005 )
      ( GET-1IMAGE ?auto_21007 ?auto_21006 )
      ( GET-2IMAGE-VERIFY ?auto_21004 ?auto_21005 ?auto_21007 ?auto_21006 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21165 - DIRECTION
      ?auto_21166 - MODE
      ?auto_21168 - DIRECTION
      ?auto_21167 - MODE
      ?auto_21169 - DIRECTION
      ?auto_21170 - MODE
    )
    :vars
    (
      ?auto_21173 - INSTRUMENT
      ?auto_21171 - SATELLITE
      ?auto_21172 - DIRECTION
      ?auto_21174 - INSTRUMENT
      ?auto_21176 - INSTRUMENT
      ?auto_21175 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_21168 ?auto_21165 ) ) ( not ( = ?auto_21169 ?auto_21165 ) ) ( not ( = ?auto_21169 ?auto_21168 ) ) ( ON_BOARD ?auto_21173 ?auto_21171 ) ( SUPPORTS ?auto_21173 ?auto_21170 ) ( not ( = ?auto_21169 ?auto_21172 ) ) ( CALIBRATION_TARGET ?auto_21173 ?auto_21172 ) ( not ( = ?auto_21172 ?auto_21168 ) ) ( ON_BOARD ?auto_21174 ?auto_21171 ) ( not ( = ?auto_21173 ?auto_21174 ) ) ( SUPPORTS ?auto_21174 ?auto_21167 ) ( CALIBRATION_TARGET ?auto_21174 ?auto_21172 ) ( not ( = ?auto_21172 ?auto_21165 ) ) ( ON_BOARD ?auto_21176 ?auto_21171 ) ( not ( = ?auto_21174 ?auto_21176 ) ) ( SUPPORTS ?auto_21176 ?auto_21166 ) ( CALIBRATION_TARGET ?auto_21176 ?auto_21172 ) ( POWER_AVAIL ?auto_21171 ) ( POINTING ?auto_21171 ?auto_21175 ) ( not ( = ?auto_21172 ?auto_21175 ) ) ( not ( = ?auto_21165 ?auto_21175 ) ) ( not ( = ?auto_21166 ?auto_21167 ) ) ( not ( = ?auto_21168 ?auto_21175 ) ) ( not ( = ?auto_21166 ?auto_21170 ) ) ( not ( = ?auto_21167 ?auto_21170 ) ) ( not ( = ?auto_21169 ?auto_21175 ) ) ( not ( = ?auto_21173 ?auto_21176 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21165 ?auto_21166 ?auto_21168 ?auto_21167 )
      ( GET-1IMAGE ?auto_21169 ?auto_21170 )
      ( GET-3IMAGE-VERIFY ?auto_21165 ?auto_21166 ?auto_21168 ?auto_21167 ?auto_21169 ?auto_21170 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_22945 - DIRECTION
      ?auto_22946 - MODE
      ?auto_22948 - DIRECTION
      ?auto_22947 - MODE
      ?auto_22949 - DIRECTION
      ?auto_22950 - MODE
      ?auto_22951 - DIRECTION
      ?auto_22952 - MODE
    )
    :vars
    (
      ?auto_22954 - INSTRUMENT
      ?auto_22956 - SATELLITE
      ?auto_22955 - DIRECTION
      ?auto_22953 - INSTRUMENT
      ?auto_22958 - INSTRUMENT
      ?auto_22959 - INSTRUMENT
      ?auto_22957 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22948 ?auto_22945 ) ) ( not ( = ?auto_22949 ?auto_22945 ) ) ( not ( = ?auto_22949 ?auto_22948 ) ) ( not ( = ?auto_22951 ?auto_22945 ) ) ( not ( = ?auto_22951 ?auto_22948 ) ) ( not ( = ?auto_22951 ?auto_22949 ) ) ( ON_BOARD ?auto_22954 ?auto_22956 ) ( SUPPORTS ?auto_22954 ?auto_22952 ) ( not ( = ?auto_22951 ?auto_22955 ) ) ( CALIBRATION_TARGET ?auto_22954 ?auto_22955 ) ( not ( = ?auto_22955 ?auto_22949 ) ) ( ON_BOARD ?auto_22953 ?auto_22956 ) ( not ( = ?auto_22954 ?auto_22953 ) ) ( SUPPORTS ?auto_22953 ?auto_22950 ) ( CALIBRATION_TARGET ?auto_22953 ?auto_22955 ) ( not ( = ?auto_22955 ?auto_22948 ) ) ( ON_BOARD ?auto_22958 ?auto_22956 ) ( not ( = ?auto_22953 ?auto_22958 ) ) ( SUPPORTS ?auto_22958 ?auto_22947 ) ( CALIBRATION_TARGET ?auto_22958 ?auto_22955 ) ( not ( = ?auto_22955 ?auto_22945 ) ) ( ON_BOARD ?auto_22959 ?auto_22956 ) ( not ( = ?auto_22958 ?auto_22959 ) ) ( SUPPORTS ?auto_22959 ?auto_22946 ) ( CALIBRATION_TARGET ?auto_22959 ?auto_22955 ) ( POWER_AVAIL ?auto_22956 ) ( POINTING ?auto_22956 ?auto_22957 ) ( not ( = ?auto_22955 ?auto_22957 ) ) ( not ( = ?auto_22945 ?auto_22957 ) ) ( not ( = ?auto_22946 ?auto_22947 ) ) ( not ( = ?auto_22948 ?auto_22957 ) ) ( not ( = ?auto_22946 ?auto_22950 ) ) ( not ( = ?auto_22947 ?auto_22950 ) ) ( not ( = ?auto_22949 ?auto_22957 ) ) ( not ( = ?auto_22953 ?auto_22959 ) ) ( not ( = ?auto_22946 ?auto_22952 ) ) ( not ( = ?auto_22947 ?auto_22952 ) ) ( not ( = ?auto_22950 ?auto_22952 ) ) ( not ( = ?auto_22951 ?auto_22957 ) ) ( not ( = ?auto_22954 ?auto_22958 ) ) ( not ( = ?auto_22954 ?auto_22959 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_22945 ?auto_22946 ?auto_22948 ?auto_22947 ?auto_22949 ?auto_22950 )
      ( GET-1IMAGE ?auto_22951 ?auto_22952 )
      ( GET-4IMAGE-VERIFY ?auto_22945 ?auto_22946 ?auto_22948 ?auto_22947 ?auto_22949 ?auto_22950 ?auto_22951 ?auto_22952 ) )
  )

)

