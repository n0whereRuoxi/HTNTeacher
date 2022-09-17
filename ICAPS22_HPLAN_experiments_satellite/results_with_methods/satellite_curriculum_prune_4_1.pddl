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
      ?auto_6982 - DIRECTION
      ?auto_6983 - MODE
    )
    :vars
    (
      ?auto_6984 - INSTRUMENT
      ?auto_6985 - SATELLITE
      ?auto_6986 - DIRECTION
      ?auto_6987 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_6984 ?auto_6985 ) ( SUPPORTS ?auto_6984 ?auto_6983 ) ( not ( = ?auto_6982 ?auto_6986 ) ) ( CALIBRATION_TARGET ?auto_6984 ?auto_6986 ) ( POWER_AVAIL ?auto_6985 ) ( POINTING ?auto_6985 ?auto_6987 ) ( not ( = ?auto_6986 ?auto_6987 ) ) ( not ( = ?auto_6982 ?auto_6987 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_6985 ?auto_6986 ?auto_6987 )
      ( !SWITCH_ON ?auto_6984 ?auto_6985 )
      ( !CALIBRATE ?auto_6985 ?auto_6984 ?auto_6986 )
      ( !TURN_TO ?auto_6985 ?auto_6982 ?auto_6986 )
      ( !TAKE_IMAGE ?auto_6985 ?auto_6982 ?auto_6984 ?auto_6983 )
      ( GET-1IMAGE-VERIFY ?auto_6982 ?auto_6983 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6990 - DIRECTION
      ?auto_6991 - MODE
    )
    :vars
    (
      ?auto_6992 - INSTRUMENT
      ?auto_6993 - SATELLITE
      ?auto_6994 - DIRECTION
      ?auto_6995 - DIRECTION
      ?auto_6996 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6992 ?auto_6993 ) ( SUPPORTS ?auto_6992 ?auto_6991 ) ( not ( = ?auto_6990 ?auto_6994 ) ) ( CALIBRATION_TARGET ?auto_6992 ?auto_6994 ) ( POINTING ?auto_6993 ?auto_6995 ) ( not ( = ?auto_6994 ?auto_6995 ) ) ( ON_BOARD ?auto_6996 ?auto_6993 ) ( POWER_ON ?auto_6996 ) ( not ( = ?auto_6990 ?auto_6995 ) ) ( not ( = ?auto_6992 ?auto_6996 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_6996 ?auto_6993 )
      ( !TURN_TO ?auto_6993 ?auto_6994 ?auto_6995 )
      ( !SWITCH_ON ?auto_6992 ?auto_6993 )
      ( !CALIBRATE ?auto_6993 ?auto_6992 ?auto_6994 )
      ( !TURN_TO ?auto_6993 ?auto_6990 ?auto_6994 )
      ( !TAKE_IMAGE ?auto_6993 ?auto_6990 ?auto_6992 ?auto_6991 )
      ( GET-1IMAGE-VERIFY ?auto_6990 ?auto_6991 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7009 - DIRECTION
      ?auto_7010 - MODE
      ?auto_7012 - DIRECTION
      ?auto_7011 - MODE
    )
    :vars
    (
      ?auto_7013 - INSTRUMENT
      ?auto_7016 - SATELLITE
      ?auto_7015 - DIRECTION
      ?auto_7014 - INSTRUMENT
      ?auto_7017 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7012 ?auto_7009 ) ) ( ON_BOARD ?auto_7013 ?auto_7016 ) ( SUPPORTS ?auto_7013 ?auto_7011 ) ( not ( = ?auto_7012 ?auto_7015 ) ) ( CALIBRATION_TARGET ?auto_7013 ?auto_7015 ) ( not ( = ?auto_7015 ?auto_7009 ) ) ( ON_BOARD ?auto_7014 ?auto_7016 ) ( not ( = ?auto_7013 ?auto_7014 ) ) ( SUPPORTS ?auto_7014 ?auto_7010 ) ( CALIBRATION_TARGET ?auto_7014 ?auto_7015 ) ( POWER_AVAIL ?auto_7016 ) ( POINTING ?auto_7016 ?auto_7017 ) ( not ( = ?auto_7015 ?auto_7017 ) ) ( not ( = ?auto_7009 ?auto_7017 ) ) ( not ( = ?auto_7010 ?auto_7011 ) ) ( not ( = ?auto_7012 ?auto_7017 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7009 ?auto_7010 )
      ( GET-1IMAGE ?auto_7012 ?auto_7011 )
      ( GET-2IMAGE-VERIFY ?auto_7009 ?auto_7010 ?auto_7012 ?auto_7011 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7170 - DIRECTION
      ?auto_7171 - MODE
      ?auto_7173 - DIRECTION
      ?auto_7172 - MODE
      ?auto_7174 - DIRECTION
      ?auto_7175 - MODE
    )
    :vars
    (
      ?auto_7177 - INSTRUMENT
      ?auto_7179 - SATELLITE
      ?auto_7178 - DIRECTION
      ?auto_7176 - INSTRUMENT
      ?auto_7180 - INSTRUMENT
      ?auto_7181 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7173 ?auto_7170 ) ) ( not ( = ?auto_7174 ?auto_7170 ) ) ( not ( = ?auto_7174 ?auto_7173 ) ) ( ON_BOARD ?auto_7177 ?auto_7179 ) ( SUPPORTS ?auto_7177 ?auto_7175 ) ( not ( = ?auto_7174 ?auto_7178 ) ) ( CALIBRATION_TARGET ?auto_7177 ?auto_7178 ) ( not ( = ?auto_7178 ?auto_7173 ) ) ( ON_BOARD ?auto_7176 ?auto_7179 ) ( not ( = ?auto_7177 ?auto_7176 ) ) ( SUPPORTS ?auto_7176 ?auto_7172 ) ( CALIBRATION_TARGET ?auto_7176 ?auto_7178 ) ( not ( = ?auto_7178 ?auto_7170 ) ) ( ON_BOARD ?auto_7180 ?auto_7179 ) ( not ( = ?auto_7176 ?auto_7180 ) ) ( SUPPORTS ?auto_7180 ?auto_7171 ) ( CALIBRATION_TARGET ?auto_7180 ?auto_7178 ) ( POWER_AVAIL ?auto_7179 ) ( POINTING ?auto_7179 ?auto_7181 ) ( not ( = ?auto_7178 ?auto_7181 ) ) ( not ( = ?auto_7170 ?auto_7181 ) ) ( not ( = ?auto_7171 ?auto_7172 ) ) ( not ( = ?auto_7173 ?auto_7181 ) ) ( not ( = ?auto_7171 ?auto_7175 ) ) ( not ( = ?auto_7172 ?auto_7175 ) ) ( not ( = ?auto_7174 ?auto_7181 ) ) ( not ( = ?auto_7177 ?auto_7180 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7170 ?auto_7171 ?auto_7173 ?auto_7172 )
      ( GET-1IMAGE ?auto_7174 ?auto_7175 )
      ( GET-3IMAGE-VERIFY ?auto_7170 ?auto_7171 ?auto_7173 ?auto_7172 ?auto_7174 ?auto_7175 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_8950 - DIRECTION
      ?auto_8951 - MODE
      ?auto_8953 - DIRECTION
      ?auto_8952 - MODE
      ?auto_8954 - DIRECTION
      ?auto_8955 - MODE
      ?auto_8956 - DIRECTION
      ?auto_8957 - MODE
    )
    :vars
    (
      ?auto_8960 - INSTRUMENT
      ?auto_8959 - SATELLITE
      ?auto_8958 - DIRECTION
      ?auto_8961 - INSTRUMENT
      ?auto_8964 - INSTRUMENT
      ?auto_8963 - INSTRUMENT
      ?auto_8962 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8953 ?auto_8950 ) ) ( not ( = ?auto_8954 ?auto_8950 ) ) ( not ( = ?auto_8954 ?auto_8953 ) ) ( not ( = ?auto_8956 ?auto_8950 ) ) ( not ( = ?auto_8956 ?auto_8953 ) ) ( not ( = ?auto_8956 ?auto_8954 ) ) ( ON_BOARD ?auto_8960 ?auto_8959 ) ( SUPPORTS ?auto_8960 ?auto_8957 ) ( not ( = ?auto_8956 ?auto_8958 ) ) ( CALIBRATION_TARGET ?auto_8960 ?auto_8958 ) ( not ( = ?auto_8958 ?auto_8954 ) ) ( ON_BOARD ?auto_8961 ?auto_8959 ) ( not ( = ?auto_8960 ?auto_8961 ) ) ( SUPPORTS ?auto_8961 ?auto_8955 ) ( CALIBRATION_TARGET ?auto_8961 ?auto_8958 ) ( not ( = ?auto_8958 ?auto_8953 ) ) ( ON_BOARD ?auto_8964 ?auto_8959 ) ( not ( = ?auto_8961 ?auto_8964 ) ) ( SUPPORTS ?auto_8964 ?auto_8952 ) ( CALIBRATION_TARGET ?auto_8964 ?auto_8958 ) ( not ( = ?auto_8958 ?auto_8950 ) ) ( ON_BOARD ?auto_8963 ?auto_8959 ) ( not ( = ?auto_8964 ?auto_8963 ) ) ( SUPPORTS ?auto_8963 ?auto_8951 ) ( CALIBRATION_TARGET ?auto_8963 ?auto_8958 ) ( POWER_AVAIL ?auto_8959 ) ( POINTING ?auto_8959 ?auto_8962 ) ( not ( = ?auto_8958 ?auto_8962 ) ) ( not ( = ?auto_8950 ?auto_8962 ) ) ( not ( = ?auto_8951 ?auto_8952 ) ) ( not ( = ?auto_8953 ?auto_8962 ) ) ( not ( = ?auto_8951 ?auto_8955 ) ) ( not ( = ?auto_8952 ?auto_8955 ) ) ( not ( = ?auto_8954 ?auto_8962 ) ) ( not ( = ?auto_8961 ?auto_8963 ) ) ( not ( = ?auto_8951 ?auto_8957 ) ) ( not ( = ?auto_8952 ?auto_8957 ) ) ( not ( = ?auto_8955 ?auto_8957 ) ) ( not ( = ?auto_8956 ?auto_8962 ) ) ( not ( = ?auto_8960 ?auto_8964 ) ) ( not ( = ?auto_8960 ?auto_8963 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_8950 ?auto_8951 ?auto_8953 ?auto_8952 ?auto_8954 ?auto_8955 )
      ( GET-1IMAGE ?auto_8956 ?auto_8957 )
      ( GET-4IMAGE-VERIFY ?auto_8950 ?auto_8951 ?auto_8953 ?auto_8952 ?auto_8954 ?auto_8955 ?auto_8956 ?auto_8957 ) )
  )

)

