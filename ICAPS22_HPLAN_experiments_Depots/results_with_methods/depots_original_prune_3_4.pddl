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
      ?auto_1522 - SURFACE
      ?auto_1523 - SURFACE
    )
    :vars
    (
      ?auto_1524 - HOIST
      ?auto_1525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1524 ?auto_1525 ) ( SURFACE-AT ?auto_1523 ?auto_1525 ) ( CLEAR ?auto_1523 ) ( LIFTING ?auto_1524 ?auto_1522 ) ( IS-CRATE ?auto_1522 ) ( not ( = ?auto_1522 ?auto_1523 ) ) )
    :subtasks
    ( ( !DROP ?auto_1524 ?auto_1522 ?auto_1523 ?auto_1525 )
      ( MAKE-ON-VERIFY ?auto_1522 ?auto_1523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1526 - SURFACE
      ?auto_1527 - SURFACE
    )
    :vars
    (
      ?auto_1529 - HOIST
      ?auto_1528 - PLACE
      ?auto_1530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1529 ?auto_1528 ) ( SURFACE-AT ?auto_1527 ?auto_1528 ) ( CLEAR ?auto_1527 ) ( IS-CRATE ?auto_1526 ) ( not ( = ?auto_1526 ?auto_1527 ) ) ( TRUCK-AT ?auto_1530 ?auto_1528 ) ( AVAILABLE ?auto_1529 ) ( IN ?auto_1526 ?auto_1530 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1529 ?auto_1526 ?auto_1530 ?auto_1528 )
      ( MAKE-ON ?auto_1526 ?auto_1527 )
      ( MAKE-ON-VERIFY ?auto_1526 ?auto_1527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1531 - SURFACE
      ?auto_1532 - SURFACE
    )
    :vars
    (
      ?auto_1535 - HOIST
      ?auto_1534 - PLACE
      ?auto_1533 - TRUCK
      ?auto_1536 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1535 ?auto_1534 ) ( SURFACE-AT ?auto_1532 ?auto_1534 ) ( CLEAR ?auto_1532 ) ( IS-CRATE ?auto_1531 ) ( not ( = ?auto_1531 ?auto_1532 ) ) ( AVAILABLE ?auto_1535 ) ( IN ?auto_1531 ?auto_1533 ) ( TRUCK-AT ?auto_1533 ?auto_1536 ) ( not ( = ?auto_1536 ?auto_1534 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1533 ?auto_1536 ?auto_1534 )
      ( MAKE-ON ?auto_1531 ?auto_1532 )
      ( MAKE-ON-VERIFY ?auto_1531 ?auto_1532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1537 - SURFACE
      ?auto_1538 - SURFACE
    )
    :vars
    (
      ?auto_1542 - HOIST
      ?auto_1541 - PLACE
      ?auto_1540 - TRUCK
      ?auto_1539 - PLACE
      ?auto_1543 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1542 ?auto_1541 ) ( SURFACE-AT ?auto_1538 ?auto_1541 ) ( CLEAR ?auto_1538 ) ( IS-CRATE ?auto_1537 ) ( not ( = ?auto_1537 ?auto_1538 ) ) ( AVAILABLE ?auto_1542 ) ( TRUCK-AT ?auto_1540 ?auto_1539 ) ( not ( = ?auto_1539 ?auto_1541 ) ) ( HOIST-AT ?auto_1543 ?auto_1539 ) ( LIFTING ?auto_1543 ?auto_1537 ) ( not ( = ?auto_1542 ?auto_1543 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1543 ?auto_1537 ?auto_1540 ?auto_1539 )
      ( MAKE-ON ?auto_1537 ?auto_1538 )
      ( MAKE-ON-VERIFY ?auto_1537 ?auto_1538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1544 - SURFACE
      ?auto_1545 - SURFACE
    )
    :vars
    (
      ?auto_1547 - HOIST
      ?auto_1546 - PLACE
      ?auto_1548 - TRUCK
      ?auto_1549 - PLACE
      ?auto_1550 - HOIST
      ?auto_1551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1547 ?auto_1546 ) ( SURFACE-AT ?auto_1545 ?auto_1546 ) ( CLEAR ?auto_1545 ) ( IS-CRATE ?auto_1544 ) ( not ( = ?auto_1544 ?auto_1545 ) ) ( AVAILABLE ?auto_1547 ) ( TRUCK-AT ?auto_1548 ?auto_1549 ) ( not ( = ?auto_1549 ?auto_1546 ) ) ( HOIST-AT ?auto_1550 ?auto_1549 ) ( not ( = ?auto_1547 ?auto_1550 ) ) ( AVAILABLE ?auto_1550 ) ( SURFACE-AT ?auto_1544 ?auto_1549 ) ( ON ?auto_1544 ?auto_1551 ) ( CLEAR ?auto_1544 ) ( not ( = ?auto_1544 ?auto_1551 ) ) ( not ( = ?auto_1545 ?auto_1551 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1550 ?auto_1544 ?auto_1551 ?auto_1549 )
      ( MAKE-ON ?auto_1544 ?auto_1545 )
      ( MAKE-ON-VERIFY ?auto_1544 ?auto_1545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1552 - SURFACE
      ?auto_1553 - SURFACE
    )
    :vars
    (
      ?auto_1558 - HOIST
      ?auto_1555 - PLACE
      ?auto_1554 - PLACE
      ?auto_1556 - HOIST
      ?auto_1559 - SURFACE
      ?auto_1557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1558 ?auto_1555 ) ( SURFACE-AT ?auto_1553 ?auto_1555 ) ( CLEAR ?auto_1553 ) ( IS-CRATE ?auto_1552 ) ( not ( = ?auto_1552 ?auto_1553 ) ) ( AVAILABLE ?auto_1558 ) ( not ( = ?auto_1554 ?auto_1555 ) ) ( HOIST-AT ?auto_1556 ?auto_1554 ) ( not ( = ?auto_1558 ?auto_1556 ) ) ( AVAILABLE ?auto_1556 ) ( SURFACE-AT ?auto_1552 ?auto_1554 ) ( ON ?auto_1552 ?auto_1559 ) ( CLEAR ?auto_1552 ) ( not ( = ?auto_1552 ?auto_1559 ) ) ( not ( = ?auto_1553 ?auto_1559 ) ) ( TRUCK-AT ?auto_1557 ?auto_1555 ) )
    :subtasks
    ( ( !DRIVE ?auto_1557 ?auto_1555 ?auto_1554 )
      ( MAKE-ON ?auto_1552 ?auto_1553 )
      ( MAKE-ON-VERIFY ?auto_1552 ?auto_1553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1600 - SURFACE
      ?auto_1601 - SURFACE
    )
    :vars
    (
      ?auto_1603 - HOIST
      ?auto_1604 - PLACE
      ?auto_1602 - PLACE
      ?auto_1606 - HOIST
      ?auto_1605 - SURFACE
      ?auto_1607 - TRUCK
      ?auto_1608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1603 ?auto_1604 ) ( IS-CRATE ?auto_1600 ) ( not ( = ?auto_1600 ?auto_1601 ) ) ( not ( = ?auto_1602 ?auto_1604 ) ) ( HOIST-AT ?auto_1606 ?auto_1602 ) ( not ( = ?auto_1603 ?auto_1606 ) ) ( AVAILABLE ?auto_1606 ) ( SURFACE-AT ?auto_1600 ?auto_1602 ) ( ON ?auto_1600 ?auto_1605 ) ( CLEAR ?auto_1600 ) ( not ( = ?auto_1600 ?auto_1605 ) ) ( not ( = ?auto_1601 ?auto_1605 ) ) ( TRUCK-AT ?auto_1607 ?auto_1604 ) ( SURFACE-AT ?auto_1608 ?auto_1604 ) ( CLEAR ?auto_1608 ) ( LIFTING ?auto_1603 ?auto_1601 ) ( IS-CRATE ?auto_1601 ) ( not ( = ?auto_1600 ?auto_1608 ) ) ( not ( = ?auto_1601 ?auto_1608 ) ) ( not ( = ?auto_1605 ?auto_1608 ) ) )
    :subtasks
    ( ( !DROP ?auto_1603 ?auto_1601 ?auto_1608 ?auto_1604 )
      ( MAKE-ON ?auto_1600 ?auto_1601 )
      ( MAKE-ON-VERIFY ?auto_1600 ?auto_1601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1609 - SURFACE
      ?auto_1610 - SURFACE
    )
    :vars
    (
      ?auto_1616 - HOIST
      ?auto_1615 - PLACE
      ?auto_1611 - PLACE
      ?auto_1617 - HOIST
      ?auto_1614 - SURFACE
      ?auto_1612 - TRUCK
      ?auto_1613 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616 ?auto_1615 ) ( IS-CRATE ?auto_1609 ) ( not ( = ?auto_1609 ?auto_1610 ) ) ( not ( = ?auto_1611 ?auto_1615 ) ) ( HOIST-AT ?auto_1617 ?auto_1611 ) ( not ( = ?auto_1616 ?auto_1617 ) ) ( AVAILABLE ?auto_1617 ) ( SURFACE-AT ?auto_1609 ?auto_1611 ) ( ON ?auto_1609 ?auto_1614 ) ( CLEAR ?auto_1609 ) ( not ( = ?auto_1609 ?auto_1614 ) ) ( not ( = ?auto_1610 ?auto_1614 ) ) ( TRUCK-AT ?auto_1612 ?auto_1615 ) ( SURFACE-AT ?auto_1613 ?auto_1615 ) ( CLEAR ?auto_1613 ) ( IS-CRATE ?auto_1610 ) ( not ( = ?auto_1609 ?auto_1613 ) ) ( not ( = ?auto_1610 ?auto_1613 ) ) ( not ( = ?auto_1614 ?auto_1613 ) ) ( AVAILABLE ?auto_1616 ) ( IN ?auto_1610 ?auto_1612 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1616 ?auto_1610 ?auto_1612 ?auto_1615 )
      ( MAKE-ON ?auto_1609 ?auto_1610 )
      ( MAKE-ON-VERIFY ?auto_1609 ?auto_1610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1624 - SURFACE
      ?auto_1625 - SURFACE
    )
    :vars
    (
      ?auto_1629 - HOIST
      ?auto_1628 - PLACE
      ?auto_1630 - PLACE
      ?auto_1627 - HOIST
      ?auto_1626 - SURFACE
      ?auto_1631 - TRUCK
      ?auto_1632 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1629 ?auto_1628 ) ( SURFACE-AT ?auto_1625 ?auto_1628 ) ( CLEAR ?auto_1625 ) ( IS-CRATE ?auto_1624 ) ( not ( = ?auto_1624 ?auto_1625 ) ) ( AVAILABLE ?auto_1629 ) ( not ( = ?auto_1630 ?auto_1628 ) ) ( HOIST-AT ?auto_1627 ?auto_1630 ) ( not ( = ?auto_1629 ?auto_1627 ) ) ( AVAILABLE ?auto_1627 ) ( SURFACE-AT ?auto_1624 ?auto_1630 ) ( ON ?auto_1624 ?auto_1626 ) ( CLEAR ?auto_1624 ) ( not ( = ?auto_1624 ?auto_1626 ) ) ( not ( = ?auto_1625 ?auto_1626 ) ) ( TRUCK-AT ?auto_1631 ?auto_1632 ) ( not ( = ?auto_1632 ?auto_1628 ) ) ( not ( = ?auto_1630 ?auto_1632 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1631 ?auto_1632 ?auto_1628 )
      ( MAKE-ON ?auto_1624 ?auto_1625 )
      ( MAKE-ON-VERIFY ?auto_1624 ?auto_1625 ) )
  )

)

