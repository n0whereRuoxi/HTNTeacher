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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1380 - SURFACE
      ?auto_1381 - SURFACE
    )
    :vars
    (
      ?auto_1382 - HOIST
      ?auto_1383 - PLACE
      ?auto_1385 - PLACE
      ?auto_1386 - HOIST
      ?auto_1387 - SURFACE
      ?auto_1384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382 ?auto_1383 ) ( SURFACE-AT ?auto_1380 ?auto_1383 ) ( CLEAR ?auto_1380 ) ( IS-CRATE ?auto_1381 ) ( AVAILABLE ?auto_1382 ) ( not ( = ?auto_1385 ?auto_1383 ) ) ( HOIST-AT ?auto_1386 ?auto_1385 ) ( AVAILABLE ?auto_1386 ) ( SURFACE-AT ?auto_1381 ?auto_1385 ) ( ON ?auto_1381 ?auto_1387 ) ( CLEAR ?auto_1381 ) ( TRUCK-AT ?auto_1384 ?auto_1383 ) ( not ( = ?auto_1380 ?auto_1381 ) ) ( not ( = ?auto_1380 ?auto_1387 ) ) ( not ( = ?auto_1381 ?auto_1387 ) ) ( not ( = ?auto_1382 ?auto_1386 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1384 ?auto_1383 ?auto_1385 )
      ( !LIFT ?auto_1386 ?auto_1381 ?auto_1387 ?auto_1385 )
      ( !LOAD ?auto_1386 ?auto_1381 ?auto_1384 ?auto_1385 )
      ( !DRIVE ?auto_1384 ?auto_1385 ?auto_1383 )
      ( !UNLOAD ?auto_1382 ?auto_1381 ?auto_1384 ?auto_1383 )
      ( !DROP ?auto_1382 ?auto_1381 ?auto_1380 ?auto_1383 )
      ( MAKE-1CRATE-VERIFY ?auto_1380 ?auto_1381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1390 - SURFACE
      ?auto_1391 - SURFACE
    )
    :vars
    (
      ?auto_1392 - HOIST
      ?auto_1393 - PLACE
      ?auto_1395 - PLACE
      ?auto_1396 - HOIST
      ?auto_1397 - SURFACE
      ?auto_1394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1392 ?auto_1393 ) ( SURFACE-AT ?auto_1390 ?auto_1393 ) ( CLEAR ?auto_1390 ) ( IS-CRATE ?auto_1391 ) ( AVAILABLE ?auto_1392 ) ( not ( = ?auto_1395 ?auto_1393 ) ) ( HOIST-AT ?auto_1396 ?auto_1395 ) ( AVAILABLE ?auto_1396 ) ( SURFACE-AT ?auto_1391 ?auto_1395 ) ( ON ?auto_1391 ?auto_1397 ) ( CLEAR ?auto_1391 ) ( TRUCK-AT ?auto_1394 ?auto_1393 ) ( not ( = ?auto_1390 ?auto_1391 ) ) ( not ( = ?auto_1390 ?auto_1397 ) ) ( not ( = ?auto_1391 ?auto_1397 ) ) ( not ( = ?auto_1392 ?auto_1396 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1394 ?auto_1393 ?auto_1395 )
      ( !LIFT ?auto_1396 ?auto_1391 ?auto_1397 ?auto_1395 )
      ( !LOAD ?auto_1396 ?auto_1391 ?auto_1394 ?auto_1395 )
      ( !DRIVE ?auto_1394 ?auto_1395 ?auto_1393 )
      ( !UNLOAD ?auto_1392 ?auto_1391 ?auto_1394 ?auto_1393 )
      ( !DROP ?auto_1392 ?auto_1391 ?auto_1390 ?auto_1393 )
      ( MAKE-1CRATE-VERIFY ?auto_1390 ?auto_1391 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1401 - SURFACE
      ?auto_1402 - SURFACE
      ?auto_1403 - SURFACE
    )
    :vars
    (
      ?auto_1408 - HOIST
      ?auto_1407 - PLACE
      ?auto_1405 - PLACE
      ?auto_1404 - HOIST
      ?auto_1409 - SURFACE
      ?auto_1411 - PLACE
      ?auto_1410 - HOIST
      ?auto_1412 - SURFACE
      ?auto_1406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1408 ?auto_1407 ) ( IS-CRATE ?auto_1403 ) ( not ( = ?auto_1405 ?auto_1407 ) ) ( HOIST-AT ?auto_1404 ?auto_1405 ) ( AVAILABLE ?auto_1404 ) ( SURFACE-AT ?auto_1403 ?auto_1405 ) ( ON ?auto_1403 ?auto_1409 ) ( CLEAR ?auto_1403 ) ( not ( = ?auto_1402 ?auto_1403 ) ) ( not ( = ?auto_1402 ?auto_1409 ) ) ( not ( = ?auto_1403 ?auto_1409 ) ) ( not ( = ?auto_1408 ?auto_1404 ) ) ( SURFACE-AT ?auto_1401 ?auto_1407 ) ( CLEAR ?auto_1401 ) ( IS-CRATE ?auto_1402 ) ( AVAILABLE ?auto_1408 ) ( not ( = ?auto_1411 ?auto_1407 ) ) ( HOIST-AT ?auto_1410 ?auto_1411 ) ( AVAILABLE ?auto_1410 ) ( SURFACE-AT ?auto_1402 ?auto_1411 ) ( ON ?auto_1402 ?auto_1412 ) ( CLEAR ?auto_1402 ) ( TRUCK-AT ?auto_1406 ?auto_1407 ) ( not ( = ?auto_1401 ?auto_1402 ) ) ( not ( = ?auto_1401 ?auto_1412 ) ) ( not ( = ?auto_1402 ?auto_1412 ) ) ( not ( = ?auto_1408 ?auto_1410 ) ) ( not ( = ?auto_1401 ?auto_1403 ) ) ( not ( = ?auto_1401 ?auto_1409 ) ) ( not ( = ?auto_1403 ?auto_1412 ) ) ( not ( = ?auto_1405 ?auto_1411 ) ) ( not ( = ?auto_1404 ?auto_1410 ) ) ( not ( = ?auto_1409 ?auto_1412 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1401 ?auto_1402 )
      ( MAKE-1CRATE ?auto_1402 ?auto_1403 )
      ( MAKE-2CRATE-VERIFY ?auto_1401 ?auto_1402 ?auto_1403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1415 - SURFACE
      ?auto_1416 - SURFACE
    )
    :vars
    (
      ?auto_1417 - HOIST
      ?auto_1418 - PLACE
      ?auto_1420 - PLACE
      ?auto_1421 - HOIST
      ?auto_1422 - SURFACE
      ?auto_1419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1417 ?auto_1418 ) ( SURFACE-AT ?auto_1415 ?auto_1418 ) ( CLEAR ?auto_1415 ) ( IS-CRATE ?auto_1416 ) ( AVAILABLE ?auto_1417 ) ( not ( = ?auto_1420 ?auto_1418 ) ) ( HOIST-AT ?auto_1421 ?auto_1420 ) ( AVAILABLE ?auto_1421 ) ( SURFACE-AT ?auto_1416 ?auto_1420 ) ( ON ?auto_1416 ?auto_1422 ) ( CLEAR ?auto_1416 ) ( TRUCK-AT ?auto_1419 ?auto_1418 ) ( not ( = ?auto_1415 ?auto_1416 ) ) ( not ( = ?auto_1415 ?auto_1422 ) ) ( not ( = ?auto_1416 ?auto_1422 ) ) ( not ( = ?auto_1417 ?auto_1421 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1419 ?auto_1418 ?auto_1420 )
      ( !LIFT ?auto_1421 ?auto_1416 ?auto_1422 ?auto_1420 )
      ( !LOAD ?auto_1421 ?auto_1416 ?auto_1419 ?auto_1420 )
      ( !DRIVE ?auto_1419 ?auto_1420 ?auto_1418 )
      ( !UNLOAD ?auto_1417 ?auto_1416 ?auto_1419 ?auto_1418 )
      ( !DROP ?auto_1417 ?auto_1416 ?auto_1415 ?auto_1418 )
      ( MAKE-1CRATE-VERIFY ?auto_1415 ?auto_1416 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427 - SURFACE
      ?auto_1428 - SURFACE
      ?auto_1429 - SURFACE
      ?auto_1430 - SURFACE
    )
    :vars
    (
      ?auto_1434 - HOIST
      ?auto_1431 - PLACE
      ?auto_1435 - PLACE
      ?auto_1433 - HOIST
      ?auto_1436 - SURFACE
      ?auto_1437 - SURFACE
      ?auto_1439 - PLACE
      ?auto_1438 - HOIST
      ?auto_1440 - SURFACE
      ?auto_1432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1434 ?auto_1431 ) ( IS-CRATE ?auto_1430 ) ( not ( = ?auto_1435 ?auto_1431 ) ) ( HOIST-AT ?auto_1433 ?auto_1435 ) ( SURFACE-AT ?auto_1430 ?auto_1435 ) ( ON ?auto_1430 ?auto_1436 ) ( CLEAR ?auto_1430 ) ( not ( = ?auto_1429 ?auto_1430 ) ) ( not ( = ?auto_1429 ?auto_1436 ) ) ( not ( = ?auto_1430 ?auto_1436 ) ) ( not ( = ?auto_1434 ?auto_1433 ) ) ( IS-CRATE ?auto_1429 ) ( AVAILABLE ?auto_1433 ) ( SURFACE-AT ?auto_1429 ?auto_1435 ) ( ON ?auto_1429 ?auto_1437 ) ( CLEAR ?auto_1429 ) ( not ( = ?auto_1428 ?auto_1429 ) ) ( not ( = ?auto_1428 ?auto_1437 ) ) ( not ( = ?auto_1429 ?auto_1437 ) ) ( SURFACE-AT ?auto_1427 ?auto_1431 ) ( CLEAR ?auto_1427 ) ( IS-CRATE ?auto_1428 ) ( AVAILABLE ?auto_1434 ) ( not ( = ?auto_1439 ?auto_1431 ) ) ( HOIST-AT ?auto_1438 ?auto_1439 ) ( AVAILABLE ?auto_1438 ) ( SURFACE-AT ?auto_1428 ?auto_1439 ) ( ON ?auto_1428 ?auto_1440 ) ( CLEAR ?auto_1428 ) ( TRUCK-AT ?auto_1432 ?auto_1431 ) ( not ( = ?auto_1427 ?auto_1428 ) ) ( not ( = ?auto_1427 ?auto_1440 ) ) ( not ( = ?auto_1428 ?auto_1440 ) ) ( not ( = ?auto_1434 ?auto_1438 ) ) ( not ( = ?auto_1427 ?auto_1429 ) ) ( not ( = ?auto_1427 ?auto_1437 ) ) ( not ( = ?auto_1429 ?auto_1440 ) ) ( not ( = ?auto_1435 ?auto_1439 ) ) ( not ( = ?auto_1433 ?auto_1438 ) ) ( not ( = ?auto_1437 ?auto_1440 ) ) ( not ( = ?auto_1427 ?auto_1430 ) ) ( not ( = ?auto_1427 ?auto_1436 ) ) ( not ( = ?auto_1428 ?auto_1430 ) ) ( not ( = ?auto_1428 ?auto_1436 ) ) ( not ( = ?auto_1430 ?auto_1437 ) ) ( not ( = ?auto_1430 ?auto_1440 ) ) ( not ( = ?auto_1436 ?auto_1437 ) ) ( not ( = ?auto_1436 ?auto_1440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427 ?auto_1428 ?auto_1429 )
      ( MAKE-1CRATE ?auto_1429 ?auto_1430 )
      ( MAKE-3CRATE-VERIFY ?auto_1427 ?auto_1428 ?auto_1429 ?auto_1430 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1443 - SURFACE
      ?auto_1444 - SURFACE
    )
    :vars
    (
      ?auto_1445 - HOIST
      ?auto_1446 - PLACE
      ?auto_1448 - PLACE
      ?auto_1449 - HOIST
      ?auto_1450 - SURFACE
      ?auto_1447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1445 ?auto_1446 ) ( SURFACE-AT ?auto_1443 ?auto_1446 ) ( CLEAR ?auto_1443 ) ( IS-CRATE ?auto_1444 ) ( AVAILABLE ?auto_1445 ) ( not ( = ?auto_1448 ?auto_1446 ) ) ( HOIST-AT ?auto_1449 ?auto_1448 ) ( AVAILABLE ?auto_1449 ) ( SURFACE-AT ?auto_1444 ?auto_1448 ) ( ON ?auto_1444 ?auto_1450 ) ( CLEAR ?auto_1444 ) ( TRUCK-AT ?auto_1447 ?auto_1446 ) ( not ( = ?auto_1443 ?auto_1444 ) ) ( not ( = ?auto_1443 ?auto_1450 ) ) ( not ( = ?auto_1444 ?auto_1450 ) ) ( not ( = ?auto_1445 ?auto_1449 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1447 ?auto_1446 ?auto_1448 )
      ( !LIFT ?auto_1449 ?auto_1444 ?auto_1450 ?auto_1448 )
      ( !LOAD ?auto_1449 ?auto_1444 ?auto_1447 ?auto_1448 )
      ( !DRIVE ?auto_1447 ?auto_1448 ?auto_1446 )
      ( !UNLOAD ?auto_1445 ?auto_1444 ?auto_1447 ?auto_1446 )
      ( !DROP ?auto_1445 ?auto_1444 ?auto_1443 ?auto_1446 )
      ( MAKE-1CRATE-VERIFY ?auto_1443 ?auto_1444 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1456 - SURFACE
      ?auto_1457 - SURFACE
      ?auto_1458 - SURFACE
      ?auto_1459 - SURFACE
      ?auto_1460 - SURFACE
    )
    :vars
    (
      ?auto_1464 - HOIST
      ?auto_1465 - PLACE
      ?auto_1463 - PLACE
      ?auto_1462 - HOIST
      ?auto_1466 - SURFACE
      ?auto_1467 - PLACE
      ?auto_1470 - HOIST
      ?auto_1469 - SURFACE
      ?auto_1468 - SURFACE
      ?auto_1471 - SURFACE
      ?auto_1461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1464 ?auto_1465 ) ( IS-CRATE ?auto_1460 ) ( not ( = ?auto_1463 ?auto_1465 ) ) ( HOIST-AT ?auto_1462 ?auto_1463 ) ( SURFACE-AT ?auto_1460 ?auto_1463 ) ( ON ?auto_1460 ?auto_1466 ) ( CLEAR ?auto_1460 ) ( not ( = ?auto_1459 ?auto_1460 ) ) ( not ( = ?auto_1459 ?auto_1466 ) ) ( not ( = ?auto_1460 ?auto_1466 ) ) ( not ( = ?auto_1464 ?auto_1462 ) ) ( IS-CRATE ?auto_1459 ) ( not ( = ?auto_1467 ?auto_1465 ) ) ( HOIST-AT ?auto_1470 ?auto_1467 ) ( SURFACE-AT ?auto_1459 ?auto_1467 ) ( ON ?auto_1459 ?auto_1469 ) ( CLEAR ?auto_1459 ) ( not ( = ?auto_1458 ?auto_1459 ) ) ( not ( = ?auto_1458 ?auto_1469 ) ) ( not ( = ?auto_1459 ?auto_1469 ) ) ( not ( = ?auto_1464 ?auto_1470 ) ) ( IS-CRATE ?auto_1458 ) ( AVAILABLE ?auto_1470 ) ( SURFACE-AT ?auto_1458 ?auto_1467 ) ( ON ?auto_1458 ?auto_1468 ) ( CLEAR ?auto_1458 ) ( not ( = ?auto_1457 ?auto_1458 ) ) ( not ( = ?auto_1457 ?auto_1468 ) ) ( not ( = ?auto_1458 ?auto_1468 ) ) ( SURFACE-AT ?auto_1456 ?auto_1465 ) ( CLEAR ?auto_1456 ) ( IS-CRATE ?auto_1457 ) ( AVAILABLE ?auto_1464 ) ( AVAILABLE ?auto_1462 ) ( SURFACE-AT ?auto_1457 ?auto_1463 ) ( ON ?auto_1457 ?auto_1471 ) ( CLEAR ?auto_1457 ) ( TRUCK-AT ?auto_1461 ?auto_1465 ) ( not ( = ?auto_1456 ?auto_1457 ) ) ( not ( = ?auto_1456 ?auto_1471 ) ) ( not ( = ?auto_1457 ?auto_1471 ) ) ( not ( = ?auto_1456 ?auto_1458 ) ) ( not ( = ?auto_1456 ?auto_1468 ) ) ( not ( = ?auto_1458 ?auto_1471 ) ) ( not ( = ?auto_1467 ?auto_1463 ) ) ( not ( = ?auto_1470 ?auto_1462 ) ) ( not ( = ?auto_1468 ?auto_1471 ) ) ( not ( = ?auto_1456 ?auto_1459 ) ) ( not ( = ?auto_1456 ?auto_1469 ) ) ( not ( = ?auto_1457 ?auto_1459 ) ) ( not ( = ?auto_1457 ?auto_1469 ) ) ( not ( = ?auto_1459 ?auto_1468 ) ) ( not ( = ?auto_1459 ?auto_1471 ) ) ( not ( = ?auto_1469 ?auto_1468 ) ) ( not ( = ?auto_1469 ?auto_1471 ) ) ( not ( = ?auto_1456 ?auto_1460 ) ) ( not ( = ?auto_1456 ?auto_1466 ) ) ( not ( = ?auto_1457 ?auto_1460 ) ) ( not ( = ?auto_1457 ?auto_1466 ) ) ( not ( = ?auto_1458 ?auto_1460 ) ) ( not ( = ?auto_1458 ?auto_1466 ) ) ( not ( = ?auto_1460 ?auto_1469 ) ) ( not ( = ?auto_1460 ?auto_1468 ) ) ( not ( = ?auto_1460 ?auto_1471 ) ) ( not ( = ?auto_1466 ?auto_1469 ) ) ( not ( = ?auto_1466 ?auto_1468 ) ) ( not ( = ?auto_1466 ?auto_1471 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1456 ?auto_1457 ?auto_1458 ?auto_1459 )
      ( MAKE-1CRATE ?auto_1459 ?auto_1460 )
      ( MAKE-4CRATE-VERIFY ?auto_1456 ?auto_1457 ?auto_1458 ?auto_1459 ?auto_1460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1474 - SURFACE
      ?auto_1475 - SURFACE
    )
    :vars
    (
      ?auto_1476 - HOIST
      ?auto_1477 - PLACE
      ?auto_1479 - PLACE
      ?auto_1480 - HOIST
      ?auto_1481 - SURFACE
      ?auto_1478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1476 ?auto_1477 ) ( SURFACE-AT ?auto_1474 ?auto_1477 ) ( CLEAR ?auto_1474 ) ( IS-CRATE ?auto_1475 ) ( AVAILABLE ?auto_1476 ) ( not ( = ?auto_1479 ?auto_1477 ) ) ( HOIST-AT ?auto_1480 ?auto_1479 ) ( AVAILABLE ?auto_1480 ) ( SURFACE-AT ?auto_1475 ?auto_1479 ) ( ON ?auto_1475 ?auto_1481 ) ( CLEAR ?auto_1475 ) ( TRUCK-AT ?auto_1478 ?auto_1477 ) ( not ( = ?auto_1474 ?auto_1475 ) ) ( not ( = ?auto_1474 ?auto_1481 ) ) ( not ( = ?auto_1475 ?auto_1481 ) ) ( not ( = ?auto_1476 ?auto_1480 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1478 ?auto_1477 ?auto_1479 )
      ( !LIFT ?auto_1480 ?auto_1475 ?auto_1481 ?auto_1479 )
      ( !LOAD ?auto_1480 ?auto_1475 ?auto_1478 ?auto_1479 )
      ( !DRIVE ?auto_1478 ?auto_1479 ?auto_1477 )
      ( !UNLOAD ?auto_1476 ?auto_1475 ?auto_1478 ?auto_1477 )
      ( !DROP ?auto_1476 ?auto_1475 ?auto_1474 ?auto_1477 )
      ( MAKE-1CRATE-VERIFY ?auto_1474 ?auto_1475 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1488 - SURFACE
      ?auto_1489 - SURFACE
      ?auto_1490 - SURFACE
      ?auto_1491 - SURFACE
      ?auto_1492 - SURFACE
      ?auto_1493 - SURFACE
    )
    :vars
    (
      ?auto_1495 - HOIST
      ?auto_1498 - PLACE
      ?auto_1494 - PLACE
      ?auto_1497 - HOIST
      ?auto_1496 - SURFACE
      ?auto_1506 - PLACE
      ?auto_1503 - HOIST
      ?auto_1501 - SURFACE
      ?auto_1502 - PLACE
      ?auto_1505 - HOIST
      ?auto_1507 - SURFACE
      ?auto_1504 - SURFACE
      ?auto_1500 - SURFACE
      ?auto_1499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1495 ?auto_1498 ) ( IS-CRATE ?auto_1493 ) ( not ( = ?auto_1494 ?auto_1498 ) ) ( HOIST-AT ?auto_1497 ?auto_1494 ) ( AVAILABLE ?auto_1497 ) ( SURFACE-AT ?auto_1493 ?auto_1494 ) ( ON ?auto_1493 ?auto_1496 ) ( CLEAR ?auto_1493 ) ( not ( = ?auto_1492 ?auto_1493 ) ) ( not ( = ?auto_1492 ?auto_1496 ) ) ( not ( = ?auto_1493 ?auto_1496 ) ) ( not ( = ?auto_1495 ?auto_1497 ) ) ( IS-CRATE ?auto_1492 ) ( not ( = ?auto_1506 ?auto_1498 ) ) ( HOIST-AT ?auto_1503 ?auto_1506 ) ( SURFACE-AT ?auto_1492 ?auto_1506 ) ( ON ?auto_1492 ?auto_1501 ) ( CLEAR ?auto_1492 ) ( not ( = ?auto_1491 ?auto_1492 ) ) ( not ( = ?auto_1491 ?auto_1501 ) ) ( not ( = ?auto_1492 ?auto_1501 ) ) ( not ( = ?auto_1495 ?auto_1503 ) ) ( IS-CRATE ?auto_1491 ) ( not ( = ?auto_1502 ?auto_1498 ) ) ( HOIST-AT ?auto_1505 ?auto_1502 ) ( SURFACE-AT ?auto_1491 ?auto_1502 ) ( ON ?auto_1491 ?auto_1507 ) ( CLEAR ?auto_1491 ) ( not ( = ?auto_1490 ?auto_1491 ) ) ( not ( = ?auto_1490 ?auto_1507 ) ) ( not ( = ?auto_1491 ?auto_1507 ) ) ( not ( = ?auto_1495 ?auto_1505 ) ) ( IS-CRATE ?auto_1490 ) ( AVAILABLE ?auto_1505 ) ( SURFACE-AT ?auto_1490 ?auto_1502 ) ( ON ?auto_1490 ?auto_1504 ) ( CLEAR ?auto_1490 ) ( not ( = ?auto_1489 ?auto_1490 ) ) ( not ( = ?auto_1489 ?auto_1504 ) ) ( not ( = ?auto_1490 ?auto_1504 ) ) ( SURFACE-AT ?auto_1488 ?auto_1498 ) ( CLEAR ?auto_1488 ) ( IS-CRATE ?auto_1489 ) ( AVAILABLE ?auto_1495 ) ( AVAILABLE ?auto_1503 ) ( SURFACE-AT ?auto_1489 ?auto_1506 ) ( ON ?auto_1489 ?auto_1500 ) ( CLEAR ?auto_1489 ) ( TRUCK-AT ?auto_1499 ?auto_1498 ) ( not ( = ?auto_1488 ?auto_1489 ) ) ( not ( = ?auto_1488 ?auto_1500 ) ) ( not ( = ?auto_1489 ?auto_1500 ) ) ( not ( = ?auto_1488 ?auto_1490 ) ) ( not ( = ?auto_1488 ?auto_1504 ) ) ( not ( = ?auto_1490 ?auto_1500 ) ) ( not ( = ?auto_1502 ?auto_1506 ) ) ( not ( = ?auto_1505 ?auto_1503 ) ) ( not ( = ?auto_1504 ?auto_1500 ) ) ( not ( = ?auto_1488 ?auto_1491 ) ) ( not ( = ?auto_1488 ?auto_1507 ) ) ( not ( = ?auto_1489 ?auto_1491 ) ) ( not ( = ?auto_1489 ?auto_1507 ) ) ( not ( = ?auto_1491 ?auto_1504 ) ) ( not ( = ?auto_1491 ?auto_1500 ) ) ( not ( = ?auto_1507 ?auto_1504 ) ) ( not ( = ?auto_1507 ?auto_1500 ) ) ( not ( = ?auto_1488 ?auto_1492 ) ) ( not ( = ?auto_1488 ?auto_1501 ) ) ( not ( = ?auto_1489 ?auto_1492 ) ) ( not ( = ?auto_1489 ?auto_1501 ) ) ( not ( = ?auto_1490 ?auto_1492 ) ) ( not ( = ?auto_1490 ?auto_1501 ) ) ( not ( = ?auto_1492 ?auto_1507 ) ) ( not ( = ?auto_1492 ?auto_1504 ) ) ( not ( = ?auto_1492 ?auto_1500 ) ) ( not ( = ?auto_1501 ?auto_1507 ) ) ( not ( = ?auto_1501 ?auto_1504 ) ) ( not ( = ?auto_1501 ?auto_1500 ) ) ( not ( = ?auto_1488 ?auto_1493 ) ) ( not ( = ?auto_1488 ?auto_1496 ) ) ( not ( = ?auto_1489 ?auto_1493 ) ) ( not ( = ?auto_1489 ?auto_1496 ) ) ( not ( = ?auto_1490 ?auto_1493 ) ) ( not ( = ?auto_1490 ?auto_1496 ) ) ( not ( = ?auto_1491 ?auto_1493 ) ) ( not ( = ?auto_1491 ?auto_1496 ) ) ( not ( = ?auto_1493 ?auto_1501 ) ) ( not ( = ?auto_1493 ?auto_1507 ) ) ( not ( = ?auto_1493 ?auto_1504 ) ) ( not ( = ?auto_1493 ?auto_1500 ) ) ( not ( = ?auto_1494 ?auto_1506 ) ) ( not ( = ?auto_1494 ?auto_1502 ) ) ( not ( = ?auto_1497 ?auto_1503 ) ) ( not ( = ?auto_1497 ?auto_1505 ) ) ( not ( = ?auto_1496 ?auto_1501 ) ) ( not ( = ?auto_1496 ?auto_1507 ) ) ( not ( = ?auto_1496 ?auto_1504 ) ) ( not ( = ?auto_1496 ?auto_1500 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1488 ?auto_1489 ?auto_1490 ?auto_1491 ?auto_1492 )
      ( MAKE-1CRATE ?auto_1492 ?auto_1493 )
      ( MAKE-5CRATE-VERIFY ?auto_1488 ?auto_1489 ?auto_1490 ?auto_1491 ?auto_1492 ?auto_1493 ) )
  )

)

