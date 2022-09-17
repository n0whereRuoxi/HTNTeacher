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
      ?auto_1206 - DIRECTION
      ?auto_1207 - MODE
    )
    :vars
    (
      ?auto_1208 - INSTRUMENT
      ?auto_1209 - SATELLITE
      ?auto_1210 - DIRECTION
      ?auto_1211 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1208 ?auto_1209 ) ( SUPPORTS ?auto_1208 ?auto_1207 ) ( not ( = ?auto_1206 ?auto_1210 ) ) ( CALIBRATION_TARGET ?auto_1208 ?auto_1210 ) ( POWER_AVAIL ?auto_1209 ) ( POINTING ?auto_1209 ?auto_1211 ) ( not ( = ?auto_1210 ?auto_1211 ) ) ( not ( = ?auto_1206 ?auto_1211 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1209 ?auto_1210 ?auto_1211 )
      ( !SWITCH_ON ?auto_1208 ?auto_1209 )
      ( !CALIBRATE ?auto_1209 ?auto_1208 ?auto_1210 )
      ( !TURN_TO ?auto_1209 ?auto_1206 ?auto_1210 )
      ( !TAKE_IMAGE ?auto_1209 ?auto_1206 ?auto_1208 ?auto_1207 )
      ( GET-1IMAGE-VERIFY ?auto_1206 ?auto_1207 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1214 - DIRECTION
      ?auto_1215 - MODE
    )
    :vars
    (
      ?auto_1216 - INSTRUMENT
      ?auto_1217 - SATELLITE
      ?auto_1218 - DIRECTION
      ?auto_1219 - DIRECTION
      ?auto_1220 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1216 ?auto_1217 ) ( SUPPORTS ?auto_1216 ?auto_1215 ) ( not ( = ?auto_1214 ?auto_1218 ) ) ( CALIBRATION_TARGET ?auto_1216 ?auto_1218 ) ( POINTING ?auto_1217 ?auto_1219 ) ( not ( = ?auto_1218 ?auto_1219 ) ) ( ON_BOARD ?auto_1220 ?auto_1217 ) ( POWER_ON ?auto_1220 ) ( not ( = ?auto_1214 ?auto_1219 ) ) ( not ( = ?auto_1216 ?auto_1220 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1220 ?auto_1217 )
      ( !TURN_TO ?auto_1217 ?auto_1218 ?auto_1219 )
      ( !SWITCH_ON ?auto_1216 ?auto_1217 )
      ( !CALIBRATE ?auto_1217 ?auto_1216 ?auto_1218 )
      ( !TURN_TO ?auto_1217 ?auto_1214 ?auto_1218 )
      ( !TAKE_IMAGE ?auto_1217 ?auto_1214 ?auto_1216 ?auto_1215 )
      ( GET-1IMAGE-VERIFY ?auto_1214 ?auto_1215 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1233 - DIRECTION
      ?auto_1234 - MODE
      ?auto_1236 - DIRECTION
      ?auto_1235 - MODE
    )
    :vars
    (
      ?auto_1239 - INSTRUMENT
      ?auto_1240 - SATELLITE
      ?auto_1238 - DIRECTION
      ?auto_1237 - INSTRUMENT
      ?auto_1241 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1239 ?auto_1240 ) ( SUPPORTS ?auto_1239 ?auto_1235 ) ( not ( = ?auto_1236 ?auto_1238 ) ) ( CALIBRATION_TARGET ?auto_1239 ?auto_1238 ) ( not ( = ?auto_1238 ?auto_1233 ) ) ( ON_BOARD ?auto_1237 ?auto_1240 ) ( not ( = ?auto_1236 ?auto_1233 ) ) ( not ( = ?auto_1239 ?auto_1237 ) ) ( SUPPORTS ?auto_1237 ?auto_1234 ) ( CALIBRATION_TARGET ?auto_1237 ?auto_1238 ) ( POWER_AVAIL ?auto_1240 ) ( POINTING ?auto_1240 ?auto_1241 ) ( not ( = ?auto_1238 ?auto_1241 ) ) ( not ( = ?auto_1233 ?auto_1241 ) ) ( not ( = ?auto_1234 ?auto_1235 ) ) ( not ( = ?auto_1236 ?auto_1241 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1233 ?auto_1234 )
      ( GET-1IMAGE ?auto_1236 ?auto_1235 )
      ( GET-2IMAGE-VERIFY ?auto_1233 ?auto_1234 ?auto_1236 ?auto_1235 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1242 - DIRECTION
      ?auto_1243 - MODE
      ?auto_1245 - DIRECTION
      ?auto_1244 - MODE
    )
    :vars
    (
      ?auto_1248 - INSTRUMENT
      ?auto_1250 - SATELLITE
      ?auto_1247 - DIRECTION
      ?auto_1246 - INSTRUMENT
      ?auto_1249 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1248 ?auto_1250 ) ( SUPPORTS ?auto_1248 ?auto_1243 ) ( not ( = ?auto_1242 ?auto_1247 ) ) ( CALIBRATION_TARGET ?auto_1248 ?auto_1247 ) ( not ( = ?auto_1247 ?auto_1245 ) ) ( ON_BOARD ?auto_1246 ?auto_1250 ) ( not ( = ?auto_1242 ?auto_1245 ) ) ( not ( = ?auto_1248 ?auto_1246 ) ) ( SUPPORTS ?auto_1246 ?auto_1244 ) ( CALIBRATION_TARGET ?auto_1246 ?auto_1247 ) ( POWER_AVAIL ?auto_1250 ) ( POINTING ?auto_1250 ?auto_1249 ) ( not ( = ?auto_1247 ?auto_1249 ) ) ( not ( = ?auto_1245 ?auto_1249 ) ) ( not ( = ?auto_1244 ?auto_1243 ) ) ( not ( = ?auto_1242 ?auto_1249 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1245 ?auto_1244 ?auto_1242 ?auto_1243 )
      ( GET-2IMAGE-VERIFY ?auto_1242 ?auto_1243 ?auto_1245 ?auto_1244 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1264 - DIRECTION
      ?auto_1265 - MODE
    )
    :vars
    (
      ?auto_1266 - INSTRUMENT
      ?auto_1267 - SATELLITE
      ?auto_1268 - DIRECTION
      ?auto_1269 - DIRECTION
      ?auto_1270 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1266 ?auto_1267 ) ( SUPPORTS ?auto_1266 ?auto_1265 ) ( not ( = ?auto_1264 ?auto_1268 ) ) ( CALIBRATION_TARGET ?auto_1266 ?auto_1268 ) ( POINTING ?auto_1267 ?auto_1269 ) ( not ( = ?auto_1268 ?auto_1269 ) ) ( ON_BOARD ?auto_1270 ?auto_1267 ) ( POWER_ON ?auto_1270 ) ( not ( = ?auto_1264 ?auto_1269 ) ) ( not ( = ?auto_1266 ?auto_1270 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1270 ?auto_1267 )
      ( !TURN_TO ?auto_1267 ?auto_1268 ?auto_1269 )
      ( !SWITCH_ON ?auto_1266 ?auto_1267 )
      ( !CALIBRATE ?auto_1267 ?auto_1266 ?auto_1268 )
      ( !TURN_TO ?auto_1267 ?auto_1264 ?auto_1268 )
      ( !TAKE_IMAGE ?auto_1267 ?auto_1264 ?auto_1266 ?auto_1265 )
      ( GET-1IMAGE-VERIFY ?auto_1264 ?auto_1265 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1399 - DIRECTION
      ?auto_1400 - MODE
      ?auto_1402 - DIRECTION
      ?auto_1401 - MODE
      ?auto_1403 - DIRECTION
      ?auto_1404 - MODE
    )
    :vars
    (
      ?auto_1406 - INSTRUMENT
      ?auto_1408 - SATELLITE
      ?auto_1407 - DIRECTION
      ?auto_1405 - INSTRUMENT
      ?auto_1409 - INSTRUMENT
      ?auto_1410 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1406 ?auto_1408 ) ( SUPPORTS ?auto_1406 ?auto_1404 ) ( not ( = ?auto_1403 ?auto_1407 ) ) ( CALIBRATION_TARGET ?auto_1406 ?auto_1407 ) ( not ( = ?auto_1407 ?auto_1402 ) ) ( ON_BOARD ?auto_1405 ?auto_1408 ) ( not ( = ?auto_1403 ?auto_1402 ) ) ( not ( = ?auto_1406 ?auto_1405 ) ) ( SUPPORTS ?auto_1405 ?auto_1401 ) ( CALIBRATION_TARGET ?auto_1405 ?auto_1407 ) ( not ( = ?auto_1407 ?auto_1399 ) ) ( ON_BOARD ?auto_1409 ?auto_1408 ) ( not ( = ?auto_1402 ?auto_1399 ) ) ( not ( = ?auto_1405 ?auto_1409 ) ) ( SUPPORTS ?auto_1409 ?auto_1400 ) ( CALIBRATION_TARGET ?auto_1409 ?auto_1407 ) ( POWER_AVAIL ?auto_1408 ) ( POINTING ?auto_1408 ?auto_1410 ) ( not ( = ?auto_1407 ?auto_1410 ) ) ( not ( = ?auto_1399 ?auto_1410 ) ) ( not ( = ?auto_1400 ?auto_1401 ) ) ( not ( = ?auto_1402 ?auto_1410 ) ) ( not ( = ?auto_1399 ?auto_1403 ) ) ( not ( = ?auto_1400 ?auto_1404 ) ) ( not ( = ?auto_1401 ?auto_1404 ) ) ( not ( = ?auto_1403 ?auto_1410 ) ) ( not ( = ?auto_1406 ?auto_1409 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1402 ?auto_1401 ?auto_1399 ?auto_1400 )
      ( GET-1IMAGE ?auto_1403 ?auto_1404 )
      ( GET-3IMAGE-VERIFY ?auto_1399 ?auto_1400 ?auto_1402 ?auto_1401 ?auto_1403 ?auto_1404 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1425 - DIRECTION
      ?auto_1426 - MODE
      ?auto_1428 - DIRECTION
      ?auto_1427 - MODE
      ?auto_1429 - DIRECTION
      ?auto_1430 - MODE
    )
    :vars
    (
      ?auto_1436 - INSTRUMENT
      ?auto_1435 - SATELLITE
      ?auto_1434 - DIRECTION
      ?auto_1431 - INSTRUMENT
      ?auto_1433 - INSTRUMENT
      ?auto_1432 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1436 ?auto_1435 ) ( SUPPORTS ?auto_1436 ?auto_1427 ) ( not ( = ?auto_1428 ?auto_1434 ) ) ( CALIBRATION_TARGET ?auto_1436 ?auto_1434 ) ( not ( = ?auto_1434 ?auto_1429 ) ) ( ON_BOARD ?auto_1431 ?auto_1435 ) ( not ( = ?auto_1428 ?auto_1429 ) ) ( not ( = ?auto_1436 ?auto_1431 ) ) ( SUPPORTS ?auto_1431 ?auto_1430 ) ( CALIBRATION_TARGET ?auto_1431 ?auto_1434 ) ( not ( = ?auto_1434 ?auto_1425 ) ) ( ON_BOARD ?auto_1433 ?auto_1435 ) ( not ( = ?auto_1429 ?auto_1425 ) ) ( not ( = ?auto_1431 ?auto_1433 ) ) ( SUPPORTS ?auto_1433 ?auto_1426 ) ( CALIBRATION_TARGET ?auto_1433 ?auto_1434 ) ( POWER_AVAIL ?auto_1435 ) ( POINTING ?auto_1435 ?auto_1432 ) ( not ( = ?auto_1434 ?auto_1432 ) ) ( not ( = ?auto_1425 ?auto_1432 ) ) ( not ( = ?auto_1426 ?auto_1430 ) ) ( not ( = ?auto_1429 ?auto_1432 ) ) ( not ( = ?auto_1425 ?auto_1428 ) ) ( not ( = ?auto_1426 ?auto_1427 ) ) ( not ( = ?auto_1430 ?auto_1427 ) ) ( not ( = ?auto_1428 ?auto_1432 ) ) ( not ( = ?auto_1436 ?auto_1433 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1425 ?auto_1426 ?auto_1429 ?auto_1430 ?auto_1428 ?auto_1427 )
      ( GET-3IMAGE-VERIFY ?auto_1425 ?auto_1426 ?auto_1428 ?auto_1427 ?auto_1429 ?auto_1430 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1451 - DIRECTION
      ?auto_1452 - MODE
      ?auto_1454 - DIRECTION
      ?auto_1453 - MODE
      ?auto_1455 - DIRECTION
      ?auto_1456 - MODE
    )
    :vars
    (
      ?auto_1461 - INSTRUMENT
      ?auto_1460 - SATELLITE
      ?auto_1462 - DIRECTION
      ?auto_1459 - INSTRUMENT
      ?auto_1457 - INSTRUMENT
      ?auto_1458 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1461 ?auto_1460 ) ( SUPPORTS ?auto_1461 ?auto_1456 ) ( not ( = ?auto_1455 ?auto_1462 ) ) ( CALIBRATION_TARGET ?auto_1461 ?auto_1462 ) ( not ( = ?auto_1462 ?auto_1451 ) ) ( ON_BOARD ?auto_1459 ?auto_1460 ) ( not ( = ?auto_1455 ?auto_1451 ) ) ( not ( = ?auto_1461 ?auto_1459 ) ) ( SUPPORTS ?auto_1459 ?auto_1452 ) ( CALIBRATION_TARGET ?auto_1459 ?auto_1462 ) ( not ( = ?auto_1462 ?auto_1454 ) ) ( ON_BOARD ?auto_1457 ?auto_1460 ) ( not ( = ?auto_1451 ?auto_1454 ) ) ( not ( = ?auto_1459 ?auto_1457 ) ) ( SUPPORTS ?auto_1457 ?auto_1453 ) ( CALIBRATION_TARGET ?auto_1457 ?auto_1462 ) ( POWER_AVAIL ?auto_1460 ) ( POINTING ?auto_1460 ?auto_1458 ) ( not ( = ?auto_1462 ?auto_1458 ) ) ( not ( = ?auto_1454 ?auto_1458 ) ) ( not ( = ?auto_1453 ?auto_1452 ) ) ( not ( = ?auto_1451 ?auto_1458 ) ) ( not ( = ?auto_1454 ?auto_1455 ) ) ( not ( = ?auto_1453 ?auto_1456 ) ) ( not ( = ?auto_1452 ?auto_1456 ) ) ( not ( = ?auto_1455 ?auto_1458 ) ) ( not ( = ?auto_1461 ?auto_1457 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1454 ?auto_1453 ?auto_1455 ?auto_1456 ?auto_1451 ?auto_1452 )
      ( GET-3IMAGE-VERIFY ?auto_1451 ?auto_1452 ?auto_1454 ?auto_1453 ?auto_1455 ?auto_1456 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1477 - DIRECTION
      ?auto_1478 - MODE
      ?auto_1480 - DIRECTION
      ?auto_1479 - MODE
      ?auto_1481 - DIRECTION
      ?auto_1482 - MODE
    )
    :vars
    (
      ?auto_1487 - INSTRUMENT
      ?auto_1486 - SATELLITE
      ?auto_1488 - DIRECTION
      ?auto_1485 - INSTRUMENT
      ?auto_1483 - INSTRUMENT
      ?auto_1484 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1487 ?auto_1486 ) ( SUPPORTS ?auto_1487 ?auto_1479 ) ( not ( = ?auto_1480 ?auto_1488 ) ) ( CALIBRATION_TARGET ?auto_1487 ?auto_1488 ) ( not ( = ?auto_1488 ?auto_1477 ) ) ( ON_BOARD ?auto_1485 ?auto_1486 ) ( not ( = ?auto_1480 ?auto_1477 ) ) ( not ( = ?auto_1487 ?auto_1485 ) ) ( SUPPORTS ?auto_1485 ?auto_1478 ) ( CALIBRATION_TARGET ?auto_1485 ?auto_1488 ) ( not ( = ?auto_1488 ?auto_1481 ) ) ( ON_BOARD ?auto_1483 ?auto_1486 ) ( not ( = ?auto_1477 ?auto_1481 ) ) ( not ( = ?auto_1485 ?auto_1483 ) ) ( SUPPORTS ?auto_1483 ?auto_1482 ) ( CALIBRATION_TARGET ?auto_1483 ?auto_1488 ) ( POWER_AVAIL ?auto_1486 ) ( POINTING ?auto_1486 ?auto_1484 ) ( not ( = ?auto_1488 ?auto_1484 ) ) ( not ( = ?auto_1481 ?auto_1484 ) ) ( not ( = ?auto_1482 ?auto_1478 ) ) ( not ( = ?auto_1477 ?auto_1484 ) ) ( not ( = ?auto_1481 ?auto_1480 ) ) ( not ( = ?auto_1482 ?auto_1479 ) ) ( not ( = ?auto_1478 ?auto_1479 ) ) ( not ( = ?auto_1480 ?auto_1484 ) ) ( not ( = ?auto_1487 ?auto_1483 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1481 ?auto_1482 ?auto_1480 ?auto_1479 ?auto_1477 ?auto_1478 )
      ( GET-3IMAGE-VERIFY ?auto_1477 ?auto_1478 ?auto_1480 ?auto_1479 ?auto_1481 ?auto_1482 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1531 - DIRECTION
      ?auto_1532 - MODE
      ?auto_1534 - DIRECTION
      ?auto_1533 - MODE
      ?auto_1535 - DIRECTION
      ?auto_1536 - MODE
    )
    :vars
    (
      ?auto_1541 - INSTRUMENT
      ?auto_1540 - SATELLITE
      ?auto_1542 - DIRECTION
      ?auto_1539 - INSTRUMENT
      ?auto_1537 - INSTRUMENT
      ?auto_1538 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1541 ?auto_1540 ) ( SUPPORTS ?auto_1541 ?auto_1532 ) ( not ( = ?auto_1531 ?auto_1542 ) ) ( CALIBRATION_TARGET ?auto_1541 ?auto_1542 ) ( not ( = ?auto_1542 ?auto_1535 ) ) ( ON_BOARD ?auto_1539 ?auto_1540 ) ( not ( = ?auto_1531 ?auto_1535 ) ) ( not ( = ?auto_1541 ?auto_1539 ) ) ( SUPPORTS ?auto_1539 ?auto_1536 ) ( CALIBRATION_TARGET ?auto_1539 ?auto_1542 ) ( not ( = ?auto_1542 ?auto_1534 ) ) ( ON_BOARD ?auto_1537 ?auto_1540 ) ( not ( = ?auto_1535 ?auto_1534 ) ) ( not ( = ?auto_1539 ?auto_1537 ) ) ( SUPPORTS ?auto_1537 ?auto_1533 ) ( CALIBRATION_TARGET ?auto_1537 ?auto_1542 ) ( POWER_AVAIL ?auto_1540 ) ( POINTING ?auto_1540 ?auto_1538 ) ( not ( = ?auto_1542 ?auto_1538 ) ) ( not ( = ?auto_1534 ?auto_1538 ) ) ( not ( = ?auto_1533 ?auto_1536 ) ) ( not ( = ?auto_1535 ?auto_1538 ) ) ( not ( = ?auto_1534 ?auto_1531 ) ) ( not ( = ?auto_1533 ?auto_1532 ) ) ( not ( = ?auto_1536 ?auto_1532 ) ) ( not ( = ?auto_1531 ?auto_1538 ) ) ( not ( = ?auto_1541 ?auto_1537 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1534 ?auto_1533 ?auto_1531 ?auto_1532 ?auto_1535 ?auto_1536 )
      ( GET-3IMAGE-VERIFY ?auto_1531 ?auto_1532 ?auto_1534 ?auto_1533 ?auto_1535 ?auto_1536 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1557 - DIRECTION
      ?auto_1558 - MODE
      ?auto_1560 - DIRECTION
      ?auto_1559 - MODE
      ?auto_1561 - DIRECTION
      ?auto_1562 - MODE
    )
    :vars
    (
      ?auto_1567 - INSTRUMENT
      ?auto_1566 - SATELLITE
      ?auto_1568 - DIRECTION
      ?auto_1565 - INSTRUMENT
      ?auto_1563 - INSTRUMENT
      ?auto_1564 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1567 ?auto_1566 ) ( SUPPORTS ?auto_1567 ?auto_1558 ) ( not ( = ?auto_1557 ?auto_1568 ) ) ( CALIBRATION_TARGET ?auto_1567 ?auto_1568 ) ( not ( = ?auto_1568 ?auto_1560 ) ) ( ON_BOARD ?auto_1565 ?auto_1566 ) ( not ( = ?auto_1557 ?auto_1560 ) ) ( not ( = ?auto_1567 ?auto_1565 ) ) ( SUPPORTS ?auto_1565 ?auto_1559 ) ( CALIBRATION_TARGET ?auto_1565 ?auto_1568 ) ( not ( = ?auto_1568 ?auto_1561 ) ) ( ON_BOARD ?auto_1563 ?auto_1566 ) ( not ( = ?auto_1560 ?auto_1561 ) ) ( not ( = ?auto_1565 ?auto_1563 ) ) ( SUPPORTS ?auto_1563 ?auto_1562 ) ( CALIBRATION_TARGET ?auto_1563 ?auto_1568 ) ( POWER_AVAIL ?auto_1566 ) ( POINTING ?auto_1566 ?auto_1564 ) ( not ( = ?auto_1568 ?auto_1564 ) ) ( not ( = ?auto_1561 ?auto_1564 ) ) ( not ( = ?auto_1562 ?auto_1559 ) ) ( not ( = ?auto_1560 ?auto_1564 ) ) ( not ( = ?auto_1561 ?auto_1557 ) ) ( not ( = ?auto_1562 ?auto_1558 ) ) ( not ( = ?auto_1559 ?auto_1558 ) ) ( not ( = ?auto_1557 ?auto_1564 ) ) ( not ( = ?auto_1567 ?auto_1563 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1561 ?auto_1562 ?auto_1557 ?auto_1558 ?auto_1560 ?auto_1559 )
      ( GET-3IMAGE-VERIFY ?auto_1557 ?auto_1558 ?auto_1560 ?auto_1559 ?auto_1561 ?auto_1562 ) )
  )

)

