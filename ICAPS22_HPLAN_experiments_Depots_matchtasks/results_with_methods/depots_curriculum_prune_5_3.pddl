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
      ?auto_1409 - PLACE
      ?auto_1404 - PLACE
      ?auto_1406 - HOIST
      ?auto_1407 - SURFACE
      ?auto_1412 - PLACE
      ?auto_1410 - HOIST
      ?auto_1411 - SURFACE
      ?auto_1405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1408 ?auto_1409 ) ( IS-CRATE ?auto_1403 ) ( not ( = ?auto_1404 ?auto_1409 ) ) ( HOIST-AT ?auto_1406 ?auto_1404 ) ( AVAILABLE ?auto_1406 ) ( SURFACE-AT ?auto_1403 ?auto_1404 ) ( ON ?auto_1403 ?auto_1407 ) ( CLEAR ?auto_1403 ) ( not ( = ?auto_1402 ?auto_1403 ) ) ( not ( = ?auto_1402 ?auto_1407 ) ) ( not ( = ?auto_1403 ?auto_1407 ) ) ( not ( = ?auto_1408 ?auto_1406 ) ) ( SURFACE-AT ?auto_1401 ?auto_1409 ) ( CLEAR ?auto_1401 ) ( IS-CRATE ?auto_1402 ) ( AVAILABLE ?auto_1408 ) ( not ( = ?auto_1412 ?auto_1409 ) ) ( HOIST-AT ?auto_1410 ?auto_1412 ) ( AVAILABLE ?auto_1410 ) ( SURFACE-AT ?auto_1402 ?auto_1412 ) ( ON ?auto_1402 ?auto_1411 ) ( CLEAR ?auto_1402 ) ( TRUCK-AT ?auto_1405 ?auto_1409 ) ( not ( = ?auto_1401 ?auto_1402 ) ) ( not ( = ?auto_1401 ?auto_1411 ) ) ( not ( = ?auto_1402 ?auto_1411 ) ) ( not ( = ?auto_1408 ?auto_1410 ) ) ( not ( = ?auto_1401 ?auto_1403 ) ) ( not ( = ?auto_1401 ?auto_1407 ) ) ( not ( = ?auto_1403 ?auto_1411 ) ) ( not ( = ?auto_1404 ?auto_1412 ) ) ( not ( = ?auto_1406 ?auto_1410 ) ) ( not ( = ?auto_1407 ?auto_1411 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1401 ?auto_1402 )
      ( MAKE-1CRATE ?auto_1402 ?auto_1403 )
      ( MAKE-2CRATE-VERIFY ?auto_1401 ?auto_1402 ?auto_1403 ) )
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
      ?auto_1436 - HOIST
      ?auto_1435 - PLACE
      ?auto_1431 - PLACE
      ?auto_1433 - HOIST
      ?auto_1432 - SURFACE
      ?auto_1437 - SURFACE
      ?auto_1440 - PLACE
      ?auto_1438 - HOIST
      ?auto_1439 - SURFACE
      ?auto_1434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436 ?auto_1435 ) ( IS-CRATE ?auto_1430 ) ( not ( = ?auto_1431 ?auto_1435 ) ) ( HOIST-AT ?auto_1433 ?auto_1431 ) ( SURFACE-AT ?auto_1430 ?auto_1431 ) ( ON ?auto_1430 ?auto_1432 ) ( CLEAR ?auto_1430 ) ( not ( = ?auto_1429 ?auto_1430 ) ) ( not ( = ?auto_1429 ?auto_1432 ) ) ( not ( = ?auto_1430 ?auto_1432 ) ) ( not ( = ?auto_1436 ?auto_1433 ) ) ( IS-CRATE ?auto_1429 ) ( AVAILABLE ?auto_1433 ) ( SURFACE-AT ?auto_1429 ?auto_1431 ) ( ON ?auto_1429 ?auto_1437 ) ( CLEAR ?auto_1429 ) ( not ( = ?auto_1428 ?auto_1429 ) ) ( not ( = ?auto_1428 ?auto_1437 ) ) ( not ( = ?auto_1429 ?auto_1437 ) ) ( SURFACE-AT ?auto_1427 ?auto_1435 ) ( CLEAR ?auto_1427 ) ( IS-CRATE ?auto_1428 ) ( AVAILABLE ?auto_1436 ) ( not ( = ?auto_1440 ?auto_1435 ) ) ( HOIST-AT ?auto_1438 ?auto_1440 ) ( AVAILABLE ?auto_1438 ) ( SURFACE-AT ?auto_1428 ?auto_1440 ) ( ON ?auto_1428 ?auto_1439 ) ( CLEAR ?auto_1428 ) ( TRUCK-AT ?auto_1434 ?auto_1435 ) ( not ( = ?auto_1427 ?auto_1428 ) ) ( not ( = ?auto_1427 ?auto_1439 ) ) ( not ( = ?auto_1428 ?auto_1439 ) ) ( not ( = ?auto_1436 ?auto_1438 ) ) ( not ( = ?auto_1427 ?auto_1429 ) ) ( not ( = ?auto_1427 ?auto_1437 ) ) ( not ( = ?auto_1429 ?auto_1439 ) ) ( not ( = ?auto_1431 ?auto_1440 ) ) ( not ( = ?auto_1433 ?auto_1438 ) ) ( not ( = ?auto_1437 ?auto_1439 ) ) ( not ( = ?auto_1427 ?auto_1430 ) ) ( not ( = ?auto_1427 ?auto_1432 ) ) ( not ( = ?auto_1428 ?auto_1430 ) ) ( not ( = ?auto_1428 ?auto_1432 ) ) ( not ( = ?auto_1430 ?auto_1437 ) ) ( not ( = ?auto_1430 ?auto_1439 ) ) ( not ( = ?auto_1432 ?auto_1437 ) ) ( not ( = ?auto_1432 ?auto_1439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427 ?auto_1428 ?auto_1429 )
      ( MAKE-1CRATE ?auto_1429 ?auto_1430 )
      ( MAKE-3CRATE-VERIFY ?auto_1427 ?auto_1428 ?auto_1429 ?auto_1430 ) )
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
      ?auto_1461 - HOIST
      ?auto_1463 - PLACE
      ?auto_1462 - PLACE
      ?auto_1466 - HOIST
      ?auto_1464 - SURFACE
      ?auto_1469 - PLACE
      ?auto_1470 - HOIST
      ?auto_1471 - SURFACE
      ?auto_1468 - SURFACE
      ?auto_1467 - SURFACE
      ?auto_1465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1461 ?auto_1463 ) ( IS-CRATE ?auto_1460 ) ( not ( = ?auto_1462 ?auto_1463 ) ) ( HOIST-AT ?auto_1466 ?auto_1462 ) ( SURFACE-AT ?auto_1460 ?auto_1462 ) ( ON ?auto_1460 ?auto_1464 ) ( CLEAR ?auto_1460 ) ( not ( = ?auto_1459 ?auto_1460 ) ) ( not ( = ?auto_1459 ?auto_1464 ) ) ( not ( = ?auto_1460 ?auto_1464 ) ) ( not ( = ?auto_1461 ?auto_1466 ) ) ( IS-CRATE ?auto_1459 ) ( not ( = ?auto_1469 ?auto_1463 ) ) ( HOIST-AT ?auto_1470 ?auto_1469 ) ( SURFACE-AT ?auto_1459 ?auto_1469 ) ( ON ?auto_1459 ?auto_1471 ) ( CLEAR ?auto_1459 ) ( not ( = ?auto_1458 ?auto_1459 ) ) ( not ( = ?auto_1458 ?auto_1471 ) ) ( not ( = ?auto_1459 ?auto_1471 ) ) ( not ( = ?auto_1461 ?auto_1470 ) ) ( IS-CRATE ?auto_1458 ) ( AVAILABLE ?auto_1470 ) ( SURFACE-AT ?auto_1458 ?auto_1469 ) ( ON ?auto_1458 ?auto_1468 ) ( CLEAR ?auto_1458 ) ( not ( = ?auto_1457 ?auto_1458 ) ) ( not ( = ?auto_1457 ?auto_1468 ) ) ( not ( = ?auto_1458 ?auto_1468 ) ) ( SURFACE-AT ?auto_1456 ?auto_1463 ) ( CLEAR ?auto_1456 ) ( IS-CRATE ?auto_1457 ) ( AVAILABLE ?auto_1461 ) ( AVAILABLE ?auto_1466 ) ( SURFACE-AT ?auto_1457 ?auto_1462 ) ( ON ?auto_1457 ?auto_1467 ) ( CLEAR ?auto_1457 ) ( TRUCK-AT ?auto_1465 ?auto_1463 ) ( not ( = ?auto_1456 ?auto_1457 ) ) ( not ( = ?auto_1456 ?auto_1467 ) ) ( not ( = ?auto_1457 ?auto_1467 ) ) ( not ( = ?auto_1456 ?auto_1458 ) ) ( not ( = ?auto_1456 ?auto_1468 ) ) ( not ( = ?auto_1458 ?auto_1467 ) ) ( not ( = ?auto_1469 ?auto_1462 ) ) ( not ( = ?auto_1470 ?auto_1466 ) ) ( not ( = ?auto_1468 ?auto_1467 ) ) ( not ( = ?auto_1456 ?auto_1459 ) ) ( not ( = ?auto_1456 ?auto_1471 ) ) ( not ( = ?auto_1457 ?auto_1459 ) ) ( not ( = ?auto_1457 ?auto_1471 ) ) ( not ( = ?auto_1459 ?auto_1468 ) ) ( not ( = ?auto_1459 ?auto_1467 ) ) ( not ( = ?auto_1471 ?auto_1468 ) ) ( not ( = ?auto_1471 ?auto_1467 ) ) ( not ( = ?auto_1456 ?auto_1460 ) ) ( not ( = ?auto_1456 ?auto_1464 ) ) ( not ( = ?auto_1457 ?auto_1460 ) ) ( not ( = ?auto_1457 ?auto_1464 ) ) ( not ( = ?auto_1458 ?auto_1460 ) ) ( not ( = ?auto_1458 ?auto_1464 ) ) ( not ( = ?auto_1460 ?auto_1471 ) ) ( not ( = ?auto_1460 ?auto_1468 ) ) ( not ( = ?auto_1460 ?auto_1467 ) ) ( not ( = ?auto_1464 ?auto_1471 ) ) ( not ( = ?auto_1464 ?auto_1468 ) ) ( not ( = ?auto_1464 ?auto_1467 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1456 ?auto_1457 ?auto_1458 ?auto_1459 )
      ( MAKE-1CRATE ?auto_1459 ?auto_1460 )
      ( MAKE-4CRATE-VERIFY ?auto_1456 ?auto_1457 ?auto_1458 ?auto_1459 ?auto_1460 ) )
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
      ?auto_1496 - HOIST
      ?auto_1497 - SURFACE
      ?auto_1502 - PLACE
      ?auto_1501 - HOIST
      ?auto_1507 - SURFACE
      ?auto_1500 - PLACE
      ?auto_1504 - HOIST
      ?auto_1505 - SURFACE
      ?auto_1503 - SURFACE
      ?auto_1506 - SURFACE
      ?auto_1499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1495 ?auto_1498 ) ( IS-CRATE ?auto_1493 ) ( not ( = ?auto_1494 ?auto_1498 ) ) ( HOIST-AT ?auto_1496 ?auto_1494 ) ( AVAILABLE ?auto_1496 ) ( SURFACE-AT ?auto_1493 ?auto_1494 ) ( ON ?auto_1493 ?auto_1497 ) ( CLEAR ?auto_1493 ) ( not ( = ?auto_1492 ?auto_1493 ) ) ( not ( = ?auto_1492 ?auto_1497 ) ) ( not ( = ?auto_1493 ?auto_1497 ) ) ( not ( = ?auto_1495 ?auto_1496 ) ) ( IS-CRATE ?auto_1492 ) ( not ( = ?auto_1502 ?auto_1498 ) ) ( HOIST-AT ?auto_1501 ?auto_1502 ) ( SURFACE-AT ?auto_1492 ?auto_1502 ) ( ON ?auto_1492 ?auto_1507 ) ( CLEAR ?auto_1492 ) ( not ( = ?auto_1491 ?auto_1492 ) ) ( not ( = ?auto_1491 ?auto_1507 ) ) ( not ( = ?auto_1492 ?auto_1507 ) ) ( not ( = ?auto_1495 ?auto_1501 ) ) ( IS-CRATE ?auto_1491 ) ( not ( = ?auto_1500 ?auto_1498 ) ) ( HOIST-AT ?auto_1504 ?auto_1500 ) ( SURFACE-AT ?auto_1491 ?auto_1500 ) ( ON ?auto_1491 ?auto_1505 ) ( CLEAR ?auto_1491 ) ( not ( = ?auto_1490 ?auto_1491 ) ) ( not ( = ?auto_1490 ?auto_1505 ) ) ( not ( = ?auto_1491 ?auto_1505 ) ) ( not ( = ?auto_1495 ?auto_1504 ) ) ( IS-CRATE ?auto_1490 ) ( AVAILABLE ?auto_1504 ) ( SURFACE-AT ?auto_1490 ?auto_1500 ) ( ON ?auto_1490 ?auto_1503 ) ( CLEAR ?auto_1490 ) ( not ( = ?auto_1489 ?auto_1490 ) ) ( not ( = ?auto_1489 ?auto_1503 ) ) ( not ( = ?auto_1490 ?auto_1503 ) ) ( SURFACE-AT ?auto_1488 ?auto_1498 ) ( CLEAR ?auto_1488 ) ( IS-CRATE ?auto_1489 ) ( AVAILABLE ?auto_1495 ) ( AVAILABLE ?auto_1501 ) ( SURFACE-AT ?auto_1489 ?auto_1502 ) ( ON ?auto_1489 ?auto_1506 ) ( CLEAR ?auto_1489 ) ( TRUCK-AT ?auto_1499 ?auto_1498 ) ( not ( = ?auto_1488 ?auto_1489 ) ) ( not ( = ?auto_1488 ?auto_1506 ) ) ( not ( = ?auto_1489 ?auto_1506 ) ) ( not ( = ?auto_1488 ?auto_1490 ) ) ( not ( = ?auto_1488 ?auto_1503 ) ) ( not ( = ?auto_1490 ?auto_1506 ) ) ( not ( = ?auto_1500 ?auto_1502 ) ) ( not ( = ?auto_1504 ?auto_1501 ) ) ( not ( = ?auto_1503 ?auto_1506 ) ) ( not ( = ?auto_1488 ?auto_1491 ) ) ( not ( = ?auto_1488 ?auto_1505 ) ) ( not ( = ?auto_1489 ?auto_1491 ) ) ( not ( = ?auto_1489 ?auto_1505 ) ) ( not ( = ?auto_1491 ?auto_1503 ) ) ( not ( = ?auto_1491 ?auto_1506 ) ) ( not ( = ?auto_1505 ?auto_1503 ) ) ( not ( = ?auto_1505 ?auto_1506 ) ) ( not ( = ?auto_1488 ?auto_1492 ) ) ( not ( = ?auto_1488 ?auto_1507 ) ) ( not ( = ?auto_1489 ?auto_1492 ) ) ( not ( = ?auto_1489 ?auto_1507 ) ) ( not ( = ?auto_1490 ?auto_1492 ) ) ( not ( = ?auto_1490 ?auto_1507 ) ) ( not ( = ?auto_1492 ?auto_1505 ) ) ( not ( = ?auto_1492 ?auto_1503 ) ) ( not ( = ?auto_1492 ?auto_1506 ) ) ( not ( = ?auto_1507 ?auto_1505 ) ) ( not ( = ?auto_1507 ?auto_1503 ) ) ( not ( = ?auto_1507 ?auto_1506 ) ) ( not ( = ?auto_1488 ?auto_1493 ) ) ( not ( = ?auto_1488 ?auto_1497 ) ) ( not ( = ?auto_1489 ?auto_1493 ) ) ( not ( = ?auto_1489 ?auto_1497 ) ) ( not ( = ?auto_1490 ?auto_1493 ) ) ( not ( = ?auto_1490 ?auto_1497 ) ) ( not ( = ?auto_1491 ?auto_1493 ) ) ( not ( = ?auto_1491 ?auto_1497 ) ) ( not ( = ?auto_1493 ?auto_1507 ) ) ( not ( = ?auto_1493 ?auto_1505 ) ) ( not ( = ?auto_1493 ?auto_1503 ) ) ( not ( = ?auto_1493 ?auto_1506 ) ) ( not ( = ?auto_1494 ?auto_1502 ) ) ( not ( = ?auto_1494 ?auto_1500 ) ) ( not ( = ?auto_1496 ?auto_1501 ) ) ( not ( = ?auto_1496 ?auto_1504 ) ) ( not ( = ?auto_1497 ?auto_1507 ) ) ( not ( = ?auto_1497 ?auto_1505 ) ) ( not ( = ?auto_1497 ?auto_1503 ) ) ( not ( = ?auto_1497 ?auto_1506 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1488 ?auto_1489 ?auto_1490 ?auto_1491 ?auto_1492 )
      ( MAKE-1CRATE ?auto_1492 ?auto_1493 )
      ( MAKE-5CRATE-VERIFY ?auto_1488 ?auto_1489 ?auto_1490 ?auto_1491 ?auto_1492 ?auto_1493 ) )
  )

)

