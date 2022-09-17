( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1292 - SURFACE
      ?auto_1293 - SURFACE
    )
    :vars
    (
      ?auto_1294 - HOIST
      ?auto_1295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1294 ?auto_1295 ) ( SURFACE-AT ?auto_1293 ?auto_1295 ) ( CLEAR ?auto_1293 ) ( LIFTING ?auto_1294 ?auto_1292 ) ( IS-CRATE ?auto_1292 ) ( not ( = ?auto_1292 ?auto_1293 ) ) )
    :subtasks
    ( ( !DROP ?auto_1294 ?auto_1292 ?auto_1293 ?auto_1295 )
      ( MAKE-ON-VERIFY ?auto_1292 ?auto_1293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1296 - SURFACE
      ?auto_1297 - SURFACE
    )
    :vars
    (
      ?auto_1299 - HOIST
      ?auto_1298 - PLACE
      ?auto_1300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1299 ?auto_1298 ) ( SURFACE-AT ?auto_1297 ?auto_1298 ) ( CLEAR ?auto_1297 ) ( IS-CRATE ?auto_1296 ) ( not ( = ?auto_1296 ?auto_1297 ) ) ( TRUCK-AT ?auto_1300 ?auto_1298 ) ( AVAILABLE ?auto_1299 ) ( IN ?auto_1296 ?auto_1300 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1299 ?auto_1296 ?auto_1300 ?auto_1298 )
      ( MAKE-ON ?auto_1296 ?auto_1297 )
      ( MAKE-ON-VERIFY ?auto_1296 ?auto_1297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1301 - SURFACE
      ?auto_1302 - SURFACE
    )
    :vars
    (
      ?auto_1303 - HOIST
      ?auto_1304 - PLACE
      ?auto_1305 - TRUCK
      ?auto_1306 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1303 ?auto_1304 ) ( SURFACE-AT ?auto_1302 ?auto_1304 ) ( CLEAR ?auto_1302 ) ( IS-CRATE ?auto_1301 ) ( not ( = ?auto_1301 ?auto_1302 ) ) ( AVAILABLE ?auto_1303 ) ( IN ?auto_1301 ?auto_1305 ) ( TRUCK-AT ?auto_1305 ?auto_1306 ) ( not ( = ?auto_1306 ?auto_1304 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1305 ?auto_1306 ?auto_1304 )
      ( MAKE-ON ?auto_1301 ?auto_1302 )
      ( MAKE-ON-VERIFY ?auto_1301 ?auto_1302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1307 - SURFACE
      ?auto_1308 - SURFACE
    )
    :vars
    (
      ?auto_1309 - HOIST
      ?auto_1311 - PLACE
      ?auto_1310 - TRUCK
      ?auto_1312 - PLACE
      ?auto_1313 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1309 ?auto_1311 ) ( SURFACE-AT ?auto_1308 ?auto_1311 ) ( CLEAR ?auto_1308 ) ( IS-CRATE ?auto_1307 ) ( not ( = ?auto_1307 ?auto_1308 ) ) ( AVAILABLE ?auto_1309 ) ( TRUCK-AT ?auto_1310 ?auto_1312 ) ( not ( = ?auto_1312 ?auto_1311 ) ) ( HOIST-AT ?auto_1313 ?auto_1312 ) ( LIFTING ?auto_1313 ?auto_1307 ) ( not ( = ?auto_1309 ?auto_1313 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1313 ?auto_1307 ?auto_1310 ?auto_1312 )
      ( MAKE-ON ?auto_1307 ?auto_1308 )
      ( MAKE-ON-VERIFY ?auto_1307 ?auto_1308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1314 - SURFACE
      ?auto_1315 - SURFACE
    )
    :vars
    (
      ?auto_1318 - HOIST
      ?auto_1320 - PLACE
      ?auto_1316 - TRUCK
      ?auto_1317 - PLACE
      ?auto_1319 - HOIST
      ?auto_1321 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1318 ?auto_1320 ) ( SURFACE-AT ?auto_1315 ?auto_1320 ) ( CLEAR ?auto_1315 ) ( IS-CRATE ?auto_1314 ) ( not ( = ?auto_1314 ?auto_1315 ) ) ( AVAILABLE ?auto_1318 ) ( TRUCK-AT ?auto_1316 ?auto_1317 ) ( not ( = ?auto_1317 ?auto_1320 ) ) ( HOIST-AT ?auto_1319 ?auto_1317 ) ( not ( = ?auto_1318 ?auto_1319 ) ) ( AVAILABLE ?auto_1319 ) ( SURFACE-AT ?auto_1314 ?auto_1317 ) ( ON ?auto_1314 ?auto_1321 ) ( CLEAR ?auto_1314 ) ( not ( = ?auto_1314 ?auto_1321 ) ) ( not ( = ?auto_1315 ?auto_1321 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1319 ?auto_1314 ?auto_1321 ?auto_1317 )
      ( MAKE-ON ?auto_1314 ?auto_1315 )
      ( MAKE-ON-VERIFY ?auto_1314 ?auto_1315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1322 - SURFACE
      ?auto_1323 - SURFACE
    )
    :vars
    (
      ?auto_1329 - HOIST
      ?auto_1324 - PLACE
      ?auto_1325 - PLACE
      ?auto_1328 - HOIST
      ?auto_1326 - SURFACE
      ?auto_1327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1329 ?auto_1324 ) ( SURFACE-AT ?auto_1323 ?auto_1324 ) ( CLEAR ?auto_1323 ) ( IS-CRATE ?auto_1322 ) ( not ( = ?auto_1322 ?auto_1323 ) ) ( AVAILABLE ?auto_1329 ) ( not ( = ?auto_1325 ?auto_1324 ) ) ( HOIST-AT ?auto_1328 ?auto_1325 ) ( not ( = ?auto_1329 ?auto_1328 ) ) ( AVAILABLE ?auto_1328 ) ( SURFACE-AT ?auto_1322 ?auto_1325 ) ( ON ?auto_1322 ?auto_1326 ) ( CLEAR ?auto_1322 ) ( not ( = ?auto_1322 ?auto_1326 ) ) ( not ( = ?auto_1323 ?auto_1326 ) ) ( TRUCK-AT ?auto_1327 ?auto_1324 ) )
    :subtasks
    ( ( !DRIVE ?auto_1327 ?auto_1324 ?auto_1325 )
      ( MAKE-ON ?auto_1322 ?auto_1323 )
      ( MAKE-ON-VERIFY ?auto_1322 ?auto_1323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1370 - SURFACE
      ?auto_1371 - SURFACE
    )
    :vars
    (
      ?auto_1377 - HOIST
      ?auto_1373 - PLACE
      ?auto_1376 - PLACE
      ?auto_1374 - HOIST
      ?auto_1375 - SURFACE
      ?auto_1372 - TRUCK
      ?auto_1378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1377 ?auto_1373 ) ( IS-CRATE ?auto_1370 ) ( not ( = ?auto_1370 ?auto_1371 ) ) ( not ( = ?auto_1376 ?auto_1373 ) ) ( HOIST-AT ?auto_1374 ?auto_1376 ) ( not ( = ?auto_1377 ?auto_1374 ) ) ( AVAILABLE ?auto_1374 ) ( SURFACE-AT ?auto_1370 ?auto_1376 ) ( ON ?auto_1370 ?auto_1375 ) ( CLEAR ?auto_1370 ) ( not ( = ?auto_1370 ?auto_1375 ) ) ( not ( = ?auto_1371 ?auto_1375 ) ) ( TRUCK-AT ?auto_1372 ?auto_1373 ) ( SURFACE-AT ?auto_1378 ?auto_1373 ) ( CLEAR ?auto_1378 ) ( LIFTING ?auto_1377 ?auto_1371 ) ( IS-CRATE ?auto_1371 ) ( not ( = ?auto_1370 ?auto_1378 ) ) ( not ( = ?auto_1371 ?auto_1378 ) ) ( not ( = ?auto_1375 ?auto_1378 ) ) )
    :subtasks
    ( ( !DROP ?auto_1377 ?auto_1371 ?auto_1378 ?auto_1373 )
      ( MAKE-ON ?auto_1370 ?auto_1371 )
      ( MAKE-ON-VERIFY ?auto_1370 ?auto_1371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1379 - SURFACE
      ?auto_1380 - SURFACE
    )
    :vars
    (
      ?auto_1383 - HOIST
      ?auto_1386 - PLACE
      ?auto_1382 - PLACE
      ?auto_1387 - HOIST
      ?auto_1381 - SURFACE
      ?auto_1384 - TRUCK
      ?auto_1385 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1383 ?auto_1386 ) ( IS-CRATE ?auto_1379 ) ( not ( = ?auto_1379 ?auto_1380 ) ) ( not ( = ?auto_1382 ?auto_1386 ) ) ( HOIST-AT ?auto_1387 ?auto_1382 ) ( not ( = ?auto_1383 ?auto_1387 ) ) ( AVAILABLE ?auto_1387 ) ( SURFACE-AT ?auto_1379 ?auto_1382 ) ( ON ?auto_1379 ?auto_1381 ) ( CLEAR ?auto_1379 ) ( not ( = ?auto_1379 ?auto_1381 ) ) ( not ( = ?auto_1380 ?auto_1381 ) ) ( TRUCK-AT ?auto_1384 ?auto_1386 ) ( SURFACE-AT ?auto_1385 ?auto_1386 ) ( CLEAR ?auto_1385 ) ( IS-CRATE ?auto_1380 ) ( not ( = ?auto_1379 ?auto_1385 ) ) ( not ( = ?auto_1380 ?auto_1385 ) ) ( not ( = ?auto_1381 ?auto_1385 ) ) ( AVAILABLE ?auto_1383 ) ( IN ?auto_1380 ?auto_1384 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1383 ?auto_1380 ?auto_1384 ?auto_1386 )
      ( MAKE-ON ?auto_1379 ?auto_1380 )
      ( MAKE-ON-VERIFY ?auto_1379 ?auto_1380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1394 - SURFACE
      ?auto_1395 - SURFACE
    )
    :vars
    (
      ?auto_1401 - HOIST
      ?auto_1398 - PLACE
      ?auto_1399 - PLACE
      ?auto_1396 - HOIST
      ?auto_1400 - SURFACE
      ?auto_1397 - TRUCK
      ?auto_1402 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1401 ?auto_1398 ) ( SURFACE-AT ?auto_1395 ?auto_1398 ) ( CLEAR ?auto_1395 ) ( IS-CRATE ?auto_1394 ) ( not ( = ?auto_1394 ?auto_1395 ) ) ( AVAILABLE ?auto_1401 ) ( not ( = ?auto_1399 ?auto_1398 ) ) ( HOIST-AT ?auto_1396 ?auto_1399 ) ( not ( = ?auto_1401 ?auto_1396 ) ) ( AVAILABLE ?auto_1396 ) ( SURFACE-AT ?auto_1394 ?auto_1399 ) ( ON ?auto_1394 ?auto_1400 ) ( CLEAR ?auto_1394 ) ( not ( = ?auto_1394 ?auto_1400 ) ) ( not ( = ?auto_1395 ?auto_1400 ) ) ( TRUCK-AT ?auto_1397 ?auto_1402 ) ( not ( = ?auto_1402 ?auto_1398 ) ) ( not ( = ?auto_1399 ?auto_1402 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1397 ?auto_1402 ?auto_1398 )
      ( MAKE-ON ?auto_1394 ?auto_1395 )
      ( MAKE-ON-VERIFY ?auto_1394 ?auto_1395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1461 - SURFACE
      ?auto_1462 - SURFACE
    )
    :vars
    (
      ?auto_1469 - HOIST
      ?auto_1464 - PLACE
      ?auto_1466 - PLACE
      ?auto_1463 - HOIST
      ?auto_1465 - SURFACE
      ?auto_1468 - SURFACE
      ?auto_1467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1469 ?auto_1464 ) ( IS-CRATE ?auto_1461 ) ( not ( = ?auto_1461 ?auto_1462 ) ) ( not ( = ?auto_1466 ?auto_1464 ) ) ( HOIST-AT ?auto_1463 ?auto_1466 ) ( not ( = ?auto_1469 ?auto_1463 ) ) ( AVAILABLE ?auto_1463 ) ( SURFACE-AT ?auto_1461 ?auto_1466 ) ( ON ?auto_1461 ?auto_1465 ) ( CLEAR ?auto_1461 ) ( not ( = ?auto_1461 ?auto_1465 ) ) ( not ( = ?auto_1462 ?auto_1465 ) ) ( SURFACE-AT ?auto_1468 ?auto_1464 ) ( CLEAR ?auto_1468 ) ( IS-CRATE ?auto_1462 ) ( not ( = ?auto_1461 ?auto_1468 ) ) ( not ( = ?auto_1462 ?auto_1468 ) ) ( not ( = ?auto_1465 ?auto_1468 ) ) ( AVAILABLE ?auto_1469 ) ( IN ?auto_1462 ?auto_1467 ) ( TRUCK-AT ?auto_1467 ?auto_1466 ) )
    :subtasks
    ( ( !DRIVE ?auto_1467 ?auto_1466 ?auto_1464 )
      ( MAKE-ON ?auto_1461 ?auto_1462 )
      ( MAKE-ON-VERIFY ?auto_1461 ?auto_1462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1470 - SURFACE
      ?auto_1471 - SURFACE
    )
    :vars
    (
      ?auto_1477 - HOIST
      ?auto_1474 - PLACE
      ?auto_1478 - PLACE
      ?auto_1476 - HOIST
      ?auto_1475 - SURFACE
      ?auto_1472 - SURFACE
      ?auto_1473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1477 ?auto_1474 ) ( IS-CRATE ?auto_1470 ) ( not ( = ?auto_1470 ?auto_1471 ) ) ( not ( = ?auto_1478 ?auto_1474 ) ) ( HOIST-AT ?auto_1476 ?auto_1478 ) ( not ( = ?auto_1477 ?auto_1476 ) ) ( SURFACE-AT ?auto_1470 ?auto_1478 ) ( ON ?auto_1470 ?auto_1475 ) ( CLEAR ?auto_1470 ) ( not ( = ?auto_1470 ?auto_1475 ) ) ( not ( = ?auto_1471 ?auto_1475 ) ) ( SURFACE-AT ?auto_1472 ?auto_1474 ) ( CLEAR ?auto_1472 ) ( IS-CRATE ?auto_1471 ) ( not ( = ?auto_1470 ?auto_1472 ) ) ( not ( = ?auto_1471 ?auto_1472 ) ) ( not ( = ?auto_1475 ?auto_1472 ) ) ( AVAILABLE ?auto_1477 ) ( TRUCK-AT ?auto_1473 ?auto_1478 ) ( LIFTING ?auto_1476 ?auto_1471 ) )
    :subtasks
    ( ( !LOAD ?auto_1476 ?auto_1471 ?auto_1473 ?auto_1478 )
      ( MAKE-ON ?auto_1470 ?auto_1471 )
      ( MAKE-ON-VERIFY ?auto_1470 ?auto_1471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1479 - SURFACE
      ?auto_1480 - SURFACE
    )
    :vars
    (
      ?auto_1481 - HOIST
      ?auto_1484 - PLACE
      ?auto_1482 - PLACE
      ?auto_1485 - HOIST
      ?auto_1483 - SURFACE
      ?auto_1486 - SURFACE
      ?auto_1487 - TRUCK
      ?auto_1488 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1481 ?auto_1484 ) ( IS-CRATE ?auto_1479 ) ( not ( = ?auto_1479 ?auto_1480 ) ) ( not ( = ?auto_1482 ?auto_1484 ) ) ( HOIST-AT ?auto_1485 ?auto_1482 ) ( not ( = ?auto_1481 ?auto_1485 ) ) ( SURFACE-AT ?auto_1479 ?auto_1482 ) ( ON ?auto_1479 ?auto_1483 ) ( CLEAR ?auto_1479 ) ( not ( = ?auto_1479 ?auto_1483 ) ) ( not ( = ?auto_1480 ?auto_1483 ) ) ( SURFACE-AT ?auto_1486 ?auto_1484 ) ( CLEAR ?auto_1486 ) ( IS-CRATE ?auto_1480 ) ( not ( = ?auto_1479 ?auto_1486 ) ) ( not ( = ?auto_1480 ?auto_1486 ) ) ( not ( = ?auto_1483 ?auto_1486 ) ) ( AVAILABLE ?auto_1481 ) ( TRUCK-AT ?auto_1487 ?auto_1482 ) ( AVAILABLE ?auto_1485 ) ( SURFACE-AT ?auto_1480 ?auto_1482 ) ( ON ?auto_1480 ?auto_1488 ) ( CLEAR ?auto_1480 ) ( not ( = ?auto_1479 ?auto_1488 ) ) ( not ( = ?auto_1480 ?auto_1488 ) ) ( not ( = ?auto_1483 ?auto_1488 ) ) ( not ( = ?auto_1486 ?auto_1488 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1485 ?auto_1480 ?auto_1488 ?auto_1482 )
      ( MAKE-ON ?auto_1479 ?auto_1480 )
      ( MAKE-ON-VERIFY ?auto_1479 ?auto_1480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1489 - SURFACE
      ?auto_1490 - SURFACE
    )
    :vars
    (
      ?auto_1494 - HOIST
      ?auto_1498 - PLACE
      ?auto_1496 - PLACE
      ?auto_1497 - HOIST
      ?auto_1495 - SURFACE
      ?auto_1493 - SURFACE
      ?auto_1491 - SURFACE
      ?auto_1492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494 ?auto_1498 ) ( IS-CRATE ?auto_1489 ) ( not ( = ?auto_1489 ?auto_1490 ) ) ( not ( = ?auto_1496 ?auto_1498 ) ) ( HOIST-AT ?auto_1497 ?auto_1496 ) ( not ( = ?auto_1494 ?auto_1497 ) ) ( SURFACE-AT ?auto_1489 ?auto_1496 ) ( ON ?auto_1489 ?auto_1495 ) ( CLEAR ?auto_1489 ) ( not ( = ?auto_1489 ?auto_1495 ) ) ( not ( = ?auto_1490 ?auto_1495 ) ) ( SURFACE-AT ?auto_1493 ?auto_1498 ) ( CLEAR ?auto_1493 ) ( IS-CRATE ?auto_1490 ) ( not ( = ?auto_1489 ?auto_1493 ) ) ( not ( = ?auto_1490 ?auto_1493 ) ) ( not ( = ?auto_1495 ?auto_1493 ) ) ( AVAILABLE ?auto_1494 ) ( AVAILABLE ?auto_1497 ) ( SURFACE-AT ?auto_1490 ?auto_1496 ) ( ON ?auto_1490 ?auto_1491 ) ( CLEAR ?auto_1490 ) ( not ( = ?auto_1489 ?auto_1491 ) ) ( not ( = ?auto_1490 ?auto_1491 ) ) ( not ( = ?auto_1495 ?auto_1491 ) ) ( not ( = ?auto_1493 ?auto_1491 ) ) ( TRUCK-AT ?auto_1492 ?auto_1498 ) )
    :subtasks
    ( ( !DRIVE ?auto_1492 ?auto_1498 ?auto_1496 )
      ( MAKE-ON ?auto_1489 ?auto_1490 )
      ( MAKE-ON-VERIFY ?auto_1489 ?auto_1490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1499 - SURFACE
      ?auto_1500 - SURFACE
    )
    :vars
    (
      ?auto_1502 - HOIST
      ?auto_1505 - PLACE
      ?auto_1508 - PLACE
      ?auto_1504 - HOIST
      ?auto_1507 - SURFACE
      ?auto_1506 - SURFACE
      ?auto_1503 - SURFACE
      ?auto_1501 - TRUCK
      ?auto_1509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1502 ?auto_1505 ) ( IS-CRATE ?auto_1499 ) ( not ( = ?auto_1499 ?auto_1500 ) ) ( not ( = ?auto_1508 ?auto_1505 ) ) ( HOIST-AT ?auto_1504 ?auto_1508 ) ( not ( = ?auto_1502 ?auto_1504 ) ) ( SURFACE-AT ?auto_1499 ?auto_1508 ) ( ON ?auto_1499 ?auto_1507 ) ( CLEAR ?auto_1499 ) ( not ( = ?auto_1499 ?auto_1507 ) ) ( not ( = ?auto_1500 ?auto_1507 ) ) ( IS-CRATE ?auto_1500 ) ( not ( = ?auto_1499 ?auto_1506 ) ) ( not ( = ?auto_1500 ?auto_1506 ) ) ( not ( = ?auto_1507 ?auto_1506 ) ) ( AVAILABLE ?auto_1504 ) ( SURFACE-AT ?auto_1500 ?auto_1508 ) ( ON ?auto_1500 ?auto_1503 ) ( CLEAR ?auto_1500 ) ( not ( = ?auto_1499 ?auto_1503 ) ) ( not ( = ?auto_1500 ?auto_1503 ) ) ( not ( = ?auto_1507 ?auto_1503 ) ) ( not ( = ?auto_1506 ?auto_1503 ) ) ( TRUCK-AT ?auto_1501 ?auto_1505 ) ( SURFACE-AT ?auto_1509 ?auto_1505 ) ( CLEAR ?auto_1509 ) ( LIFTING ?auto_1502 ?auto_1506 ) ( IS-CRATE ?auto_1506 ) ( not ( = ?auto_1499 ?auto_1509 ) ) ( not ( = ?auto_1500 ?auto_1509 ) ) ( not ( = ?auto_1507 ?auto_1509 ) ) ( not ( = ?auto_1506 ?auto_1509 ) ) ( not ( = ?auto_1503 ?auto_1509 ) ) )
    :subtasks
    ( ( !DROP ?auto_1502 ?auto_1506 ?auto_1509 ?auto_1505 )
      ( MAKE-ON ?auto_1499 ?auto_1500 )
      ( MAKE-ON-VERIFY ?auto_1499 ?auto_1500 ) )
  )

)

