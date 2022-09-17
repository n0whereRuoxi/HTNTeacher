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
      ?auto_1111 - DIRECTION
      ?auto_1112 - MODE
    )
    :vars
    (
      ?auto_1113 - INSTRUMENT
      ?auto_1114 - SATELLITE
      ?auto_1115 - DIRECTION
      ?auto_1116 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1113 ?auto_1114 ) ( SUPPORTS ?auto_1113 ?auto_1112 ) ( not ( = ?auto_1111 ?auto_1115 ) ) ( CALIBRATION_TARGET ?auto_1113 ?auto_1115 ) ( POWER_AVAIL ?auto_1114 ) ( POINTING ?auto_1114 ?auto_1116 ) ( not ( = ?auto_1115 ?auto_1116 ) ) ( not ( = ?auto_1111 ?auto_1116 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1114 ?auto_1115 ?auto_1116 )
      ( !SWITCH_ON ?auto_1113 ?auto_1114 )
      ( !CALIBRATE ?auto_1114 ?auto_1113 ?auto_1115 )
      ( !TURN_TO ?auto_1114 ?auto_1111 ?auto_1115 )
      ( !TAKE_IMAGE ?auto_1114 ?auto_1111 ?auto_1113 ?auto_1112 )
      ( GET-1IMAGE-VERIFY ?auto_1111 ?auto_1112 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1119 - DIRECTION
      ?auto_1120 - MODE
    )
    :vars
    (
      ?auto_1121 - INSTRUMENT
      ?auto_1122 - SATELLITE
      ?auto_1123 - DIRECTION
      ?auto_1124 - DIRECTION
      ?auto_1125 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1121 ?auto_1122 ) ( SUPPORTS ?auto_1121 ?auto_1120 ) ( not ( = ?auto_1119 ?auto_1123 ) ) ( CALIBRATION_TARGET ?auto_1121 ?auto_1123 ) ( POINTING ?auto_1122 ?auto_1124 ) ( not ( = ?auto_1123 ?auto_1124 ) ) ( ON_BOARD ?auto_1125 ?auto_1122 ) ( POWER_ON ?auto_1125 ) ( not ( = ?auto_1119 ?auto_1124 ) ) ( not ( = ?auto_1121 ?auto_1125 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1125 ?auto_1122 )
      ( !TURN_TO ?auto_1122 ?auto_1123 ?auto_1124 )
      ( !SWITCH_ON ?auto_1121 ?auto_1122 )
      ( !CALIBRATE ?auto_1122 ?auto_1121 ?auto_1123 )
      ( !TURN_TO ?auto_1122 ?auto_1119 ?auto_1123 )
      ( !TAKE_IMAGE ?auto_1122 ?auto_1119 ?auto_1121 ?auto_1120 )
      ( GET-1IMAGE-VERIFY ?auto_1119 ?auto_1120 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1138 - DIRECTION
      ?auto_1139 - MODE
      ?auto_1141 - DIRECTION
      ?auto_1140 - MODE
    )
    :vars
    (
      ?auto_1142 - INSTRUMENT
      ?auto_1143 - SATELLITE
      ?auto_1144 - DIRECTION
      ?auto_1145 - INSTRUMENT
      ?auto_1146 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1142 ?auto_1143 ) ( SUPPORTS ?auto_1142 ?auto_1140 ) ( not ( = ?auto_1141 ?auto_1144 ) ) ( CALIBRATION_TARGET ?auto_1142 ?auto_1144 ) ( not ( = ?auto_1144 ?auto_1138 ) ) ( ON_BOARD ?auto_1145 ?auto_1143 ) ( not ( = ?auto_1141 ?auto_1138 ) ) ( not ( = ?auto_1142 ?auto_1145 ) ) ( SUPPORTS ?auto_1145 ?auto_1139 ) ( CALIBRATION_TARGET ?auto_1145 ?auto_1144 ) ( POWER_AVAIL ?auto_1143 ) ( POINTING ?auto_1143 ?auto_1146 ) ( not ( = ?auto_1144 ?auto_1146 ) ) ( not ( = ?auto_1138 ?auto_1146 ) ) ( not ( = ?auto_1139 ?auto_1140 ) ) ( not ( = ?auto_1141 ?auto_1146 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1138 ?auto_1139 )
      ( GET-1IMAGE ?auto_1141 ?auto_1140 )
      ( GET-2IMAGE-VERIFY ?auto_1138 ?auto_1139 ?auto_1141 ?auto_1140 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1299 - DIRECTION
      ?auto_1300 - MODE
      ?auto_1302 - DIRECTION
      ?auto_1301 - MODE
      ?auto_1303 - DIRECTION
      ?auto_1304 - MODE
    )
    :vars
    (
      ?auto_1305 - INSTRUMENT
      ?auto_1306 - SATELLITE
      ?auto_1307 - DIRECTION
      ?auto_1308 - INSTRUMENT
      ?auto_1310 - INSTRUMENT
      ?auto_1309 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1305 ?auto_1306 ) ( SUPPORTS ?auto_1305 ?auto_1304 ) ( not ( = ?auto_1303 ?auto_1307 ) ) ( CALIBRATION_TARGET ?auto_1305 ?auto_1307 ) ( not ( = ?auto_1307 ?auto_1302 ) ) ( ON_BOARD ?auto_1308 ?auto_1306 ) ( not ( = ?auto_1303 ?auto_1302 ) ) ( not ( = ?auto_1305 ?auto_1308 ) ) ( SUPPORTS ?auto_1308 ?auto_1301 ) ( CALIBRATION_TARGET ?auto_1308 ?auto_1307 ) ( not ( = ?auto_1307 ?auto_1299 ) ) ( ON_BOARD ?auto_1310 ?auto_1306 ) ( not ( = ?auto_1302 ?auto_1299 ) ) ( not ( = ?auto_1308 ?auto_1310 ) ) ( SUPPORTS ?auto_1310 ?auto_1300 ) ( CALIBRATION_TARGET ?auto_1310 ?auto_1307 ) ( POWER_AVAIL ?auto_1306 ) ( POINTING ?auto_1306 ?auto_1309 ) ( not ( = ?auto_1307 ?auto_1309 ) ) ( not ( = ?auto_1299 ?auto_1309 ) ) ( not ( = ?auto_1300 ?auto_1301 ) ) ( not ( = ?auto_1302 ?auto_1309 ) ) ( not ( = ?auto_1299 ?auto_1303 ) ) ( not ( = ?auto_1300 ?auto_1304 ) ) ( not ( = ?auto_1301 ?auto_1304 ) ) ( not ( = ?auto_1303 ?auto_1309 ) ) ( not ( = ?auto_1305 ?auto_1310 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1299 ?auto_1300 ?auto_1302 ?auto_1301 )
      ( GET-1IMAGE ?auto_1303 ?auto_1304 )
      ( GET-3IMAGE-VERIFY ?auto_1299 ?auto_1300 ?auto_1302 ?auto_1301 ?auto_1303 ?auto_1304 ) )
  )

)

