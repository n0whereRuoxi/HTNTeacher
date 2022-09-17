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
      ?auto_1512 - SURFACE
      ?auto_1513 - SURFACE
    )
    :vars
    (
      ?auto_1514 - HOIST
      ?auto_1515 - PLACE
      ?auto_1517 - PLACE
      ?auto_1518 - HOIST
      ?auto_1519 - SURFACE
      ?auto_1516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514 ?auto_1515 ) ( SURFACE-AT ?auto_1513 ?auto_1515 ) ( CLEAR ?auto_1513 ) ( IS-CRATE ?auto_1512 ) ( AVAILABLE ?auto_1514 ) ( not ( = ?auto_1517 ?auto_1515 ) ) ( HOIST-AT ?auto_1518 ?auto_1517 ) ( AVAILABLE ?auto_1518 ) ( SURFACE-AT ?auto_1512 ?auto_1517 ) ( ON ?auto_1512 ?auto_1519 ) ( CLEAR ?auto_1512 ) ( TRUCK-AT ?auto_1516 ?auto_1515 ) ( not ( = ?auto_1512 ?auto_1513 ) ) ( not ( = ?auto_1512 ?auto_1519 ) ) ( not ( = ?auto_1513 ?auto_1519 ) ) ( not ( = ?auto_1514 ?auto_1518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1516 ?auto_1515 ?auto_1517 )
      ( !LIFT ?auto_1518 ?auto_1512 ?auto_1519 ?auto_1517 )
      ( !LOAD ?auto_1518 ?auto_1512 ?auto_1516 ?auto_1517 )
      ( !DRIVE ?auto_1516 ?auto_1517 ?auto_1515 )
      ( !UNLOAD ?auto_1514 ?auto_1512 ?auto_1516 ?auto_1515 )
      ( !DROP ?auto_1514 ?auto_1512 ?auto_1513 ?auto_1515 )
      ( MAKE-ON-VERIFY ?auto_1512 ?auto_1513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1522 - SURFACE
      ?auto_1523 - SURFACE
    )
    :vars
    (
      ?auto_1524 - HOIST
      ?auto_1525 - PLACE
      ?auto_1527 - PLACE
      ?auto_1528 - HOIST
      ?auto_1529 - SURFACE
      ?auto_1526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1524 ?auto_1525 ) ( SURFACE-AT ?auto_1523 ?auto_1525 ) ( CLEAR ?auto_1523 ) ( IS-CRATE ?auto_1522 ) ( AVAILABLE ?auto_1524 ) ( not ( = ?auto_1527 ?auto_1525 ) ) ( HOIST-AT ?auto_1528 ?auto_1527 ) ( AVAILABLE ?auto_1528 ) ( SURFACE-AT ?auto_1522 ?auto_1527 ) ( ON ?auto_1522 ?auto_1529 ) ( CLEAR ?auto_1522 ) ( TRUCK-AT ?auto_1526 ?auto_1525 ) ( not ( = ?auto_1522 ?auto_1523 ) ) ( not ( = ?auto_1522 ?auto_1529 ) ) ( not ( = ?auto_1523 ?auto_1529 ) ) ( not ( = ?auto_1524 ?auto_1528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1526 ?auto_1525 ?auto_1527 )
      ( !LIFT ?auto_1528 ?auto_1522 ?auto_1529 ?auto_1527 )
      ( !LOAD ?auto_1528 ?auto_1522 ?auto_1526 ?auto_1527 )
      ( !DRIVE ?auto_1526 ?auto_1527 ?auto_1525 )
      ( !UNLOAD ?auto_1524 ?auto_1522 ?auto_1526 ?auto_1525 )
      ( !DROP ?auto_1524 ?auto_1522 ?auto_1523 ?auto_1525 )
      ( MAKE-ON-VERIFY ?auto_1522 ?auto_1523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1532 - SURFACE
      ?auto_1533 - SURFACE
    )
    :vars
    (
      ?auto_1534 - HOIST
      ?auto_1535 - PLACE
      ?auto_1537 - PLACE
      ?auto_1538 - HOIST
      ?auto_1539 - SURFACE
      ?auto_1536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1534 ?auto_1535 ) ( SURFACE-AT ?auto_1533 ?auto_1535 ) ( CLEAR ?auto_1533 ) ( IS-CRATE ?auto_1532 ) ( AVAILABLE ?auto_1534 ) ( not ( = ?auto_1537 ?auto_1535 ) ) ( HOIST-AT ?auto_1538 ?auto_1537 ) ( AVAILABLE ?auto_1538 ) ( SURFACE-AT ?auto_1532 ?auto_1537 ) ( ON ?auto_1532 ?auto_1539 ) ( CLEAR ?auto_1532 ) ( TRUCK-AT ?auto_1536 ?auto_1535 ) ( not ( = ?auto_1532 ?auto_1533 ) ) ( not ( = ?auto_1532 ?auto_1539 ) ) ( not ( = ?auto_1533 ?auto_1539 ) ) ( not ( = ?auto_1534 ?auto_1538 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1536 ?auto_1535 ?auto_1537 )
      ( !LIFT ?auto_1538 ?auto_1532 ?auto_1539 ?auto_1537 )
      ( !LOAD ?auto_1538 ?auto_1532 ?auto_1536 ?auto_1537 )
      ( !DRIVE ?auto_1536 ?auto_1537 ?auto_1535 )
      ( !UNLOAD ?auto_1534 ?auto_1532 ?auto_1536 ?auto_1535 )
      ( !DROP ?auto_1534 ?auto_1532 ?auto_1533 ?auto_1535 )
      ( MAKE-ON-VERIFY ?auto_1532 ?auto_1533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1542 - SURFACE
      ?auto_1543 - SURFACE
    )
    :vars
    (
      ?auto_1544 - HOIST
      ?auto_1545 - PLACE
      ?auto_1547 - PLACE
      ?auto_1548 - HOIST
      ?auto_1549 - SURFACE
      ?auto_1546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1544 ?auto_1545 ) ( SURFACE-AT ?auto_1543 ?auto_1545 ) ( CLEAR ?auto_1543 ) ( IS-CRATE ?auto_1542 ) ( AVAILABLE ?auto_1544 ) ( not ( = ?auto_1547 ?auto_1545 ) ) ( HOIST-AT ?auto_1548 ?auto_1547 ) ( AVAILABLE ?auto_1548 ) ( SURFACE-AT ?auto_1542 ?auto_1547 ) ( ON ?auto_1542 ?auto_1549 ) ( CLEAR ?auto_1542 ) ( TRUCK-AT ?auto_1546 ?auto_1545 ) ( not ( = ?auto_1542 ?auto_1543 ) ) ( not ( = ?auto_1542 ?auto_1549 ) ) ( not ( = ?auto_1543 ?auto_1549 ) ) ( not ( = ?auto_1544 ?auto_1548 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1546 ?auto_1545 ?auto_1547 )
      ( !LIFT ?auto_1548 ?auto_1542 ?auto_1549 ?auto_1547 )
      ( !LOAD ?auto_1548 ?auto_1542 ?auto_1546 ?auto_1547 )
      ( !DRIVE ?auto_1546 ?auto_1547 ?auto_1545 )
      ( !UNLOAD ?auto_1544 ?auto_1542 ?auto_1546 ?auto_1545 )
      ( !DROP ?auto_1544 ?auto_1542 ?auto_1543 ?auto_1545 )
      ( MAKE-ON-VERIFY ?auto_1542 ?auto_1543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1552 - SURFACE
      ?auto_1553 - SURFACE
    )
    :vars
    (
      ?auto_1554 - HOIST
      ?auto_1555 - PLACE
      ?auto_1557 - PLACE
      ?auto_1558 - HOIST
      ?auto_1559 - SURFACE
      ?auto_1556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1554 ?auto_1555 ) ( SURFACE-AT ?auto_1553 ?auto_1555 ) ( CLEAR ?auto_1553 ) ( IS-CRATE ?auto_1552 ) ( AVAILABLE ?auto_1554 ) ( not ( = ?auto_1557 ?auto_1555 ) ) ( HOIST-AT ?auto_1558 ?auto_1557 ) ( AVAILABLE ?auto_1558 ) ( SURFACE-AT ?auto_1552 ?auto_1557 ) ( ON ?auto_1552 ?auto_1559 ) ( CLEAR ?auto_1552 ) ( TRUCK-AT ?auto_1556 ?auto_1555 ) ( not ( = ?auto_1552 ?auto_1553 ) ) ( not ( = ?auto_1552 ?auto_1559 ) ) ( not ( = ?auto_1553 ?auto_1559 ) ) ( not ( = ?auto_1554 ?auto_1558 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1556 ?auto_1555 ?auto_1557 )
      ( !LIFT ?auto_1558 ?auto_1552 ?auto_1559 ?auto_1557 )
      ( !LOAD ?auto_1558 ?auto_1552 ?auto_1556 ?auto_1557 )
      ( !DRIVE ?auto_1556 ?auto_1557 ?auto_1555 )
      ( !UNLOAD ?auto_1554 ?auto_1552 ?auto_1556 ?auto_1555 )
      ( !DROP ?auto_1554 ?auto_1552 ?auto_1553 ?auto_1555 )
      ( MAKE-ON-VERIFY ?auto_1552 ?auto_1553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1562 - SURFACE
      ?auto_1563 - SURFACE
    )
    :vars
    (
      ?auto_1564 - HOIST
      ?auto_1565 - PLACE
      ?auto_1567 - PLACE
      ?auto_1568 - HOIST
      ?auto_1569 - SURFACE
      ?auto_1566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564 ?auto_1565 ) ( SURFACE-AT ?auto_1563 ?auto_1565 ) ( CLEAR ?auto_1563 ) ( IS-CRATE ?auto_1562 ) ( AVAILABLE ?auto_1564 ) ( not ( = ?auto_1567 ?auto_1565 ) ) ( HOIST-AT ?auto_1568 ?auto_1567 ) ( AVAILABLE ?auto_1568 ) ( SURFACE-AT ?auto_1562 ?auto_1567 ) ( ON ?auto_1562 ?auto_1569 ) ( CLEAR ?auto_1562 ) ( TRUCK-AT ?auto_1566 ?auto_1565 ) ( not ( = ?auto_1562 ?auto_1563 ) ) ( not ( = ?auto_1562 ?auto_1569 ) ) ( not ( = ?auto_1563 ?auto_1569 ) ) ( not ( = ?auto_1564 ?auto_1568 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1566 ?auto_1565 ?auto_1567 )
      ( !LIFT ?auto_1568 ?auto_1562 ?auto_1569 ?auto_1567 )
      ( !LOAD ?auto_1568 ?auto_1562 ?auto_1566 ?auto_1567 )
      ( !DRIVE ?auto_1566 ?auto_1567 ?auto_1565 )
      ( !UNLOAD ?auto_1564 ?auto_1562 ?auto_1566 ?auto_1565 )
      ( !DROP ?auto_1564 ?auto_1562 ?auto_1563 ?auto_1565 )
      ( MAKE-ON-VERIFY ?auto_1562 ?auto_1563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1572 - SURFACE
      ?auto_1573 - SURFACE
    )
    :vars
    (
      ?auto_1574 - HOIST
      ?auto_1575 - PLACE
      ?auto_1577 - PLACE
      ?auto_1578 - HOIST
      ?auto_1579 - SURFACE
      ?auto_1576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1574 ?auto_1575 ) ( SURFACE-AT ?auto_1573 ?auto_1575 ) ( CLEAR ?auto_1573 ) ( IS-CRATE ?auto_1572 ) ( AVAILABLE ?auto_1574 ) ( not ( = ?auto_1577 ?auto_1575 ) ) ( HOIST-AT ?auto_1578 ?auto_1577 ) ( AVAILABLE ?auto_1578 ) ( SURFACE-AT ?auto_1572 ?auto_1577 ) ( ON ?auto_1572 ?auto_1579 ) ( CLEAR ?auto_1572 ) ( TRUCK-AT ?auto_1576 ?auto_1575 ) ( not ( = ?auto_1572 ?auto_1573 ) ) ( not ( = ?auto_1572 ?auto_1579 ) ) ( not ( = ?auto_1573 ?auto_1579 ) ) ( not ( = ?auto_1574 ?auto_1578 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1576 ?auto_1575 ?auto_1577 )
      ( !LIFT ?auto_1578 ?auto_1572 ?auto_1579 ?auto_1577 )
      ( !LOAD ?auto_1578 ?auto_1572 ?auto_1576 ?auto_1577 )
      ( !DRIVE ?auto_1576 ?auto_1577 ?auto_1575 )
      ( !UNLOAD ?auto_1574 ?auto_1572 ?auto_1576 ?auto_1575 )
      ( !DROP ?auto_1574 ?auto_1572 ?auto_1573 ?auto_1575 )
      ( MAKE-ON-VERIFY ?auto_1572 ?auto_1573 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1582 - SURFACE
      ?auto_1583 - SURFACE
    )
    :vars
    (
      ?auto_1584 - HOIST
      ?auto_1585 - PLACE
      ?auto_1587 - PLACE
      ?auto_1588 - HOIST
      ?auto_1589 - SURFACE
      ?auto_1586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1584 ?auto_1585 ) ( SURFACE-AT ?auto_1583 ?auto_1585 ) ( CLEAR ?auto_1583 ) ( IS-CRATE ?auto_1582 ) ( AVAILABLE ?auto_1584 ) ( not ( = ?auto_1587 ?auto_1585 ) ) ( HOIST-AT ?auto_1588 ?auto_1587 ) ( AVAILABLE ?auto_1588 ) ( SURFACE-AT ?auto_1582 ?auto_1587 ) ( ON ?auto_1582 ?auto_1589 ) ( CLEAR ?auto_1582 ) ( TRUCK-AT ?auto_1586 ?auto_1585 ) ( not ( = ?auto_1582 ?auto_1583 ) ) ( not ( = ?auto_1582 ?auto_1589 ) ) ( not ( = ?auto_1583 ?auto_1589 ) ) ( not ( = ?auto_1584 ?auto_1588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1586 ?auto_1585 ?auto_1587 )
      ( !LIFT ?auto_1588 ?auto_1582 ?auto_1589 ?auto_1587 )
      ( !LOAD ?auto_1588 ?auto_1582 ?auto_1586 ?auto_1587 )
      ( !DRIVE ?auto_1586 ?auto_1587 ?auto_1585 )
      ( !UNLOAD ?auto_1584 ?auto_1582 ?auto_1586 ?auto_1585 )
      ( !DROP ?auto_1584 ?auto_1582 ?auto_1583 ?auto_1585 )
      ( MAKE-ON-VERIFY ?auto_1582 ?auto_1583 ) )
  )

)

