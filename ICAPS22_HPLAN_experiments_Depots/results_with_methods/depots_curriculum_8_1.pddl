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
      ?auto_1432 - SURFACE
      ?auto_1433 - SURFACE
    )
    :vars
    (
      ?auto_1434 - HOIST
      ?auto_1435 - PLACE
      ?auto_1437 - PLACE
      ?auto_1438 - HOIST
      ?auto_1439 - SURFACE
      ?auto_1436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1434 ?auto_1435 ) ( SURFACE-AT ?auto_1433 ?auto_1435 ) ( CLEAR ?auto_1433 ) ( IS-CRATE ?auto_1432 ) ( AVAILABLE ?auto_1434 ) ( not ( = ?auto_1437 ?auto_1435 ) ) ( HOIST-AT ?auto_1438 ?auto_1437 ) ( AVAILABLE ?auto_1438 ) ( SURFACE-AT ?auto_1432 ?auto_1437 ) ( ON ?auto_1432 ?auto_1439 ) ( CLEAR ?auto_1432 ) ( TRUCK-AT ?auto_1436 ?auto_1435 ) ( not ( = ?auto_1432 ?auto_1433 ) ) ( not ( = ?auto_1432 ?auto_1439 ) ) ( not ( = ?auto_1433 ?auto_1439 ) ) ( not ( = ?auto_1434 ?auto_1438 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1436 ?auto_1435 ?auto_1437 )
      ( !LIFT ?auto_1438 ?auto_1432 ?auto_1439 ?auto_1437 )
      ( !LOAD ?auto_1438 ?auto_1432 ?auto_1436 ?auto_1437 )
      ( !DRIVE ?auto_1436 ?auto_1437 ?auto_1435 )
      ( !UNLOAD ?auto_1434 ?auto_1432 ?auto_1436 ?auto_1435 )
      ( !DROP ?auto_1434 ?auto_1432 ?auto_1433 ?auto_1435 )
      ( MAKE-ON-VERIFY ?auto_1432 ?auto_1433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1442 - SURFACE
      ?auto_1443 - SURFACE
    )
    :vars
    (
      ?auto_1444 - HOIST
      ?auto_1445 - PLACE
      ?auto_1447 - PLACE
      ?auto_1448 - HOIST
      ?auto_1449 - SURFACE
      ?auto_1446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1444 ?auto_1445 ) ( SURFACE-AT ?auto_1443 ?auto_1445 ) ( CLEAR ?auto_1443 ) ( IS-CRATE ?auto_1442 ) ( AVAILABLE ?auto_1444 ) ( not ( = ?auto_1447 ?auto_1445 ) ) ( HOIST-AT ?auto_1448 ?auto_1447 ) ( AVAILABLE ?auto_1448 ) ( SURFACE-AT ?auto_1442 ?auto_1447 ) ( ON ?auto_1442 ?auto_1449 ) ( CLEAR ?auto_1442 ) ( TRUCK-AT ?auto_1446 ?auto_1445 ) ( not ( = ?auto_1442 ?auto_1443 ) ) ( not ( = ?auto_1442 ?auto_1449 ) ) ( not ( = ?auto_1443 ?auto_1449 ) ) ( not ( = ?auto_1444 ?auto_1448 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1446 ?auto_1445 ?auto_1447 )
      ( !LIFT ?auto_1448 ?auto_1442 ?auto_1449 ?auto_1447 )
      ( !LOAD ?auto_1448 ?auto_1442 ?auto_1446 ?auto_1447 )
      ( !DRIVE ?auto_1446 ?auto_1447 ?auto_1445 )
      ( !UNLOAD ?auto_1444 ?auto_1442 ?auto_1446 ?auto_1445 )
      ( !DROP ?auto_1444 ?auto_1442 ?auto_1443 ?auto_1445 )
      ( MAKE-ON-VERIFY ?auto_1442 ?auto_1443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1452 - SURFACE
      ?auto_1453 - SURFACE
    )
    :vars
    (
      ?auto_1454 - HOIST
      ?auto_1455 - PLACE
      ?auto_1457 - PLACE
      ?auto_1458 - HOIST
      ?auto_1459 - SURFACE
      ?auto_1456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1454 ?auto_1455 ) ( SURFACE-AT ?auto_1453 ?auto_1455 ) ( CLEAR ?auto_1453 ) ( IS-CRATE ?auto_1452 ) ( AVAILABLE ?auto_1454 ) ( not ( = ?auto_1457 ?auto_1455 ) ) ( HOIST-AT ?auto_1458 ?auto_1457 ) ( AVAILABLE ?auto_1458 ) ( SURFACE-AT ?auto_1452 ?auto_1457 ) ( ON ?auto_1452 ?auto_1459 ) ( CLEAR ?auto_1452 ) ( TRUCK-AT ?auto_1456 ?auto_1455 ) ( not ( = ?auto_1452 ?auto_1453 ) ) ( not ( = ?auto_1452 ?auto_1459 ) ) ( not ( = ?auto_1453 ?auto_1459 ) ) ( not ( = ?auto_1454 ?auto_1458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1456 ?auto_1455 ?auto_1457 )
      ( !LIFT ?auto_1458 ?auto_1452 ?auto_1459 ?auto_1457 )
      ( !LOAD ?auto_1458 ?auto_1452 ?auto_1456 ?auto_1457 )
      ( !DRIVE ?auto_1456 ?auto_1457 ?auto_1455 )
      ( !UNLOAD ?auto_1454 ?auto_1452 ?auto_1456 ?auto_1455 )
      ( !DROP ?auto_1454 ?auto_1452 ?auto_1453 ?auto_1455 )
      ( MAKE-ON-VERIFY ?auto_1452 ?auto_1453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1462 - SURFACE
      ?auto_1463 - SURFACE
    )
    :vars
    (
      ?auto_1464 - HOIST
      ?auto_1465 - PLACE
      ?auto_1467 - PLACE
      ?auto_1468 - HOIST
      ?auto_1469 - SURFACE
      ?auto_1466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1464 ?auto_1465 ) ( SURFACE-AT ?auto_1463 ?auto_1465 ) ( CLEAR ?auto_1463 ) ( IS-CRATE ?auto_1462 ) ( AVAILABLE ?auto_1464 ) ( not ( = ?auto_1467 ?auto_1465 ) ) ( HOIST-AT ?auto_1468 ?auto_1467 ) ( AVAILABLE ?auto_1468 ) ( SURFACE-AT ?auto_1462 ?auto_1467 ) ( ON ?auto_1462 ?auto_1469 ) ( CLEAR ?auto_1462 ) ( TRUCK-AT ?auto_1466 ?auto_1465 ) ( not ( = ?auto_1462 ?auto_1463 ) ) ( not ( = ?auto_1462 ?auto_1469 ) ) ( not ( = ?auto_1463 ?auto_1469 ) ) ( not ( = ?auto_1464 ?auto_1468 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1466 ?auto_1465 ?auto_1467 )
      ( !LIFT ?auto_1468 ?auto_1462 ?auto_1469 ?auto_1467 )
      ( !LOAD ?auto_1468 ?auto_1462 ?auto_1466 ?auto_1467 )
      ( !DRIVE ?auto_1466 ?auto_1467 ?auto_1465 )
      ( !UNLOAD ?auto_1464 ?auto_1462 ?auto_1466 ?auto_1465 )
      ( !DROP ?auto_1464 ?auto_1462 ?auto_1463 ?auto_1465 )
      ( MAKE-ON-VERIFY ?auto_1462 ?auto_1463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1472 - SURFACE
      ?auto_1473 - SURFACE
    )
    :vars
    (
      ?auto_1474 - HOIST
      ?auto_1475 - PLACE
      ?auto_1477 - PLACE
      ?auto_1478 - HOIST
      ?auto_1479 - SURFACE
      ?auto_1476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1474 ?auto_1475 ) ( SURFACE-AT ?auto_1473 ?auto_1475 ) ( CLEAR ?auto_1473 ) ( IS-CRATE ?auto_1472 ) ( AVAILABLE ?auto_1474 ) ( not ( = ?auto_1477 ?auto_1475 ) ) ( HOIST-AT ?auto_1478 ?auto_1477 ) ( AVAILABLE ?auto_1478 ) ( SURFACE-AT ?auto_1472 ?auto_1477 ) ( ON ?auto_1472 ?auto_1479 ) ( CLEAR ?auto_1472 ) ( TRUCK-AT ?auto_1476 ?auto_1475 ) ( not ( = ?auto_1472 ?auto_1473 ) ) ( not ( = ?auto_1472 ?auto_1479 ) ) ( not ( = ?auto_1473 ?auto_1479 ) ) ( not ( = ?auto_1474 ?auto_1478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1476 ?auto_1475 ?auto_1477 )
      ( !LIFT ?auto_1478 ?auto_1472 ?auto_1479 ?auto_1477 )
      ( !LOAD ?auto_1478 ?auto_1472 ?auto_1476 ?auto_1477 )
      ( !DRIVE ?auto_1476 ?auto_1477 ?auto_1475 )
      ( !UNLOAD ?auto_1474 ?auto_1472 ?auto_1476 ?auto_1475 )
      ( !DROP ?auto_1474 ?auto_1472 ?auto_1473 ?auto_1475 )
      ( MAKE-ON-VERIFY ?auto_1472 ?auto_1473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1482 - SURFACE
      ?auto_1483 - SURFACE
    )
    :vars
    (
      ?auto_1484 - HOIST
      ?auto_1485 - PLACE
      ?auto_1487 - PLACE
      ?auto_1488 - HOIST
      ?auto_1489 - SURFACE
      ?auto_1486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1484 ?auto_1485 ) ( SURFACE-AT ?auto_1483 ?auto_1485 ) ( CLEAR ?auto_1483 ) ( IS-CRATE ?auto_1482 ) ( AVAILABLE ?auto_1484 ) ( not ( = ?auto_1487 ?auto_1485 ) ) ( HOIST-AT ?auto_1488 ?auto_1487 ) ( AVAILABLE ?auto_1488 ) ( SURFACE-AT ?auto_1482 ?auto_1487 ) ( ON ?auto_1482 ?auto_1489 ) ( CLEAR ?auto_1482 ) ( TRUCK-AT ?auto_1486 ?auto_1485 ) ( not ( = ?auto_1482 ?auto_1483 ) ) ( not ( = ?auto_1482 ?auto_1489 ) ) ( not ( = ?auto_1483 ?auto_1489 ) ) ( not ( = ?auto_1484 ?auto_1488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1486 ?auto_1485 ?auto_1487 )
      ( !LIFT ?auto_1488 ?auto_1482 ?auto_1489 ?auto_1487 )
      ( !LOAD ?auto_1488 ?auto_1482 ?auto_1486 ?auto_1487 )
      ( !DRIVE ?auto_1486 ?auto_1487 ?auto_1485 )
      ( !UNLOAD ?auto_1484 ?auto_1482 ?auto_1486 ?auto_1485 )
      ( !DROP ?auto_1484 ?auto_1482 ?auto_1483 ?auto_1485 )
      ( MAKE-ON-VERIFY ?auto_1482 ?auto_1483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1492 - SURFACE
      ?auto_1493 - SURFACE
    )
    :vars
    (
      ?auto_1494 - HOIST
      ?auto_1495 - PLACE
      ?auto_1497 - PLACE
      ?auto_1498 - HOIST
      ?auto_1499 - SURFACE
      ?auto_1496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494 ?auto_1495 ) ( SURFACE-AT ?auto_1493 ?auto_1495 ) ( CLEAR ?auto_1493 ) ( IS-CRATE ?auto_1492 ) ( AVAILABLE ?auto_1494 ) ( not ( = ?auto_1497 ?auto_1495 ) ) ( HOIST-AT ?auto_1498 ?auto_1497 ) ( AVAILABLE ?auto_1498 ) ( SURFACE-AT ?auto_1492 ?auto_1497 ) ( ON ?auto_1492 ?auto_1499 ) ( CLEAR ?auto_1492 ) ( TRUCK-AT ?auto_1496 ?auto_1495 ) ( not ( = ?auto_1492 ?auto_1493 ) ) ( not ( = ?auto_1492 ?auto_1499 ) ) ( not ( = ?auto_1493 ?auto_1499 ) ) ( not ( = ?auto_1494 ?auto_1498 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1496 ?auto_1495 ?auto_1497 )
      ( !LIFT ?auto_1498 ?auto_1492 ?auto_1499 ?auto_1497 )
      ( !LOAD ?auto_1498 ?auto_1492 ?auto_1496 ?auto_1497 )
      ( !DRIVE ?auto_1496 ?auto_1497 ?auto_1495 )
      ( !UNLOAD ?auto_1494 ?auto_1492 ?auto_1496 ?auto_1495 )
      ( !DROP ?auto_1494 ?auto_1492 ?auto_1493 ?auto_1495 )
      ( MAKE-ON-VERIFY ?auto_1492 ?auto_1493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1502 - SURFACE
      ?auto_1503 - SURFACE
    )
    :vars
    (
      ?auto_1504 - HOIST
      ?auto_1505 - PLACE
      ?auto_1507 - PLACE
      ?auto_1508 - HOIST
      ?auto_1509 - SURFACE
      ?auto_1506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1504 ?auto_1505 ) ( SURFACE-AT ?auto_1503 ?auto_1505 ) ( CLEAR ?auto_1503 ) ( IS-CRATE ?auto_1502 ) ( AVAILABLE ?auto_1504 ) ( not ( = ?auto_1507 ?auto_1505 ) ) ( HOIST-AT ?auto_1508 ?auto_1507 ) ( AVAILABLE ?auto_1508 ) ( SURFACE-AT ?auto_1502 ?auto_1507 ) ( ON ?auto_1502 ?auto_1509 ) ( CLEAR ?auto_1502 ) ( TRUCK-AT ?auto_1506 ?auto_1505 ) ( not ( = ?auto_1502 ?auto_1503 ) ) ( not ( = ?auto_1502 ?auto_1509 ) ) ( not ( = ?auto_1503 ?auto_1509 ) ) ( not ( = ?auto_1504 ?auto_1508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1506 ?auto_1505 ?auto_1507 )
      ( !LIFT ?auto_1508 ?auto_1502 ?auto_1509 ?auto_1507 )
      ( !LOAD ?auto_1508 ?auto_1502 ?auto_1506 ?auto_1507 )
      ( !DRIVE ?auto_1506 ?auto_1507 ?auto_1505 )
      ( !UNLOAD ?auto_1504 ?auto_1502 ?auto_1506 ?auto_1505 )
      ( !DROP ?auto_1504 ?auto_1502 ?auto_1503 ?auto_1505 )
      ( MAKE-ON-VERIFY ?auto_1502 ?auto_1503 ) )
  )

)

