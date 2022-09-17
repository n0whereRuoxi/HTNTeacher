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
      ?auto_1510 - SURFACE
      ?auto_1511 - SURFACE
    )
    :vars
    (
      ?auto_1512 - HOIST
      ?auto_1513 - PLACE
      ?auto_1515 - PLACE
      ?auto_1516 - HOIST
      ?auto_1517 - SURFACE
      ?auto_1514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1512 ?auto_1513 ) ( SURFACE-AT ?auto_1510 ?auto_1513 ) ( CLEAR ?auto_1510 ) ( IS-CRATE ?auto_1511 ) ( AVAILABLE ?auto_1512 ) ( not ( = ?auto_1515 ?auto_1513 ) ) ( HOIST-AT ?auto_1516 ?auto_1515 ) ( AVAILABLE ?auto_1516 ) ( SURFACE-AT ?auto_1511 ?auto_1515 ) ( ON ?auto_1511 ?auto_1517 ) ( CLEAR ?auto_1511 ) ( TRUCK-AT ?auto_1514 ?auto_1513 ) ( not ( = ?auto_1510 ?auto_1511 ) ) ( not ( = ?auto_1510 ?auto_1517 ) ) ( not ( = ?auto_1511 ?auto_1517 ) ) ( not ( = ?auto_1512 ?auto_1516 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1514 ?auto_1513 ?auto_1515 )
      ( !LIFT ?auto_1516 ?auto_1511 ?auto_1517 ?auto_1515 )
      ( !LOAD ?auto_1516 ?auto_1511 ?auto_1514 ?auto_1515 )
      ( !DRIVE ?auto_1514 ?auto_1515 ?auto_1513 )
      ( !UNLOAD ?auto_1512 ?auto_1511 ?auto_1514 ?auto_1513 )
      ( !DROP ?auto_1512 ?auto_1511 ?auto_1510 ?auto_1513 )
      ( MAKE-1CRATE-VERIFY ?auto_1510 ?auto_1511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1520 - SURFACE
      ?auto_1521 - SURFACE
    )
    :vars
    (
      ?auto_1522 - HOIST
      ?auto_1523 - PLACE
      ?auto_1525 - PLACE
      ?auto_1526 - HOIST
      ?auto_1527 - SURFACE
      ?auto_1524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1522 ?auto_1523 ) ( SURFACE-AT ?auto_1520 ?auto_1523 ) ( CLEAR ?auto_1520 ) ( IS-CRATE ?auto_1521 ) ( AVAILABLE ?auto_1522 ) ( not ( = ?auto_1525 ?auto_1523 ) ) ( HOIST-AT ?auto_1526 ?auto_1525 ) ( AVAILABLE ?auto_1526 ) ( SURFACE-AT ?auto_1521 ?auto_1525 ) ( ON ?auto_1521 ?auto_1527 ) ( CLEAR ?auto_1521 ) ( TRUCK-AT ?auto_1524 ?auto_1523 ) ( not ( = ?auto_1520 ?auto_1521 ) ) ( not ( = ?auto_1520 ?auto_1527 ) ) ( not ( = ?auto_1521 ?auto_1527 ) ) ( not ( = ?auto_1522 ?auto_1526 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1524 ?auto_1523 ?auto_1525 )
      ( !LIFT ?auto_1526 ?auto_1521 ?auto_1527 ?auto_1525 )
      ( !LOAD ?auto_1526 ?auto_1521 ?auto_1524 ?auto_1525 )
      ( !DRIVE ?auto_1524 ?auto_1525 ?auto_1523 )
      ( !UNLOAD ?auto_1522 ?auto_1521 ?auto_1524 ?auto_1523 )
      ( !DROP ?auto_1522 ?auto_1521 ?auto_1520 ?auto_1523 )
      ( MAKE-1CRATE-VERIFY ?auto_1520 ?auto_1521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1531 - SURFACE
      ?auto_1532 - SURFACE
      ?auto_1533 - SURFACE
    )
    :vars
    (
      ?auto_1538 - HOIST
      ?auto_1536 - PLACE
      ?auto_1537 - PLACE
      ?auto_1539 - HOIST
      ?auto_1535 - SURFACE
      ?auto_1540 - SURFACE
      ?auto_1534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1538 ?auto_1536 ) ( IS-CRATE ?auto_1533 ) ( not ( = ?auto_1537 ?auto_1536 ) ) ( HOIST-AT ?auto_1539 ?auto_1537 ) ( SURFACE-AT ?auto_1533 ?auto_1537 ) ( ON ?auto_1533 ?auto_1535 ) ( CLEAR ?auto_1533 ) ( not ( = ?auto_1532 ?auto_1533 ) ) ( not ( = ?auto_1532 ?auto_1535 ) ) ( not ( = ?auto_1533 ?auto_1535 ) ) ( not ( = ?auto_1538 ?auto_1539 ) ) ( SURFACE-AT ?auto_1531 ?auto_1536 ) ( CLEAR ?auto_1531 ) ( IS-CRATE ?auto_1532 ) ( AVAILABLE ?auto_1538 ) ( AVAILABLE ?auto_1539 ) ( SURFACE-AT ?auto_1532 ?auto_1537 ) ( ON ?auto_1532 ?auto_1540 ) ( CLEAR ?auto_1532 ) ( TRUCK-AT ?auto_1534 ?auto_1536 ) ( not ( = ?auto_1531 ?auto_1532 ) ) ( not ( = ?auto_1531 ?auto_1540 ) ) ( not ( = ?auto_1532 ?auto_1540 ) ) ( not ( = ?auto_1531 ?auto_1533 ) ) ( not ( = ?auto_1531 ?auto_1535 ) ) ( not ( = ?auto_1533 ?auto_1540 ) ) ( not ( = ?auto_1535 ?auto_1540 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1531 ?auto_1532 )
      ( MAKE-1CRATE ?auto_1532 ?auto_1533 )
      ( MAKE-2CRATE-VERIFY ?auto_1531 ?auto_1532 ?auto_1533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1543 - SURFACE
      ?auto_1544 - SURFACE
    )
    :vars
    (
      ?auto_1545 - HOIST
      ?auto_1546 - PLACE
      ?auto_1548 - PLACE
      ?auto_1549 - HOIST
      ?auto_1550 - SURFACE
      ?auto_1547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1545 ?auto_1546 ) ( SURFACE-AT ?auto_1543 ?auto_1546 ) ( CLEAR ?auto_1543 ) ( IS-CRATE ?auto_1544 ) ( AVAILABLE ?auto_1545 ) ( not ( = ?auto_1548 ?auto_1546 ) ) ( HOIST-AT ?auto_1549 ?auto_1548 ) ( AVAILABLE ?auto_1549 ) ( SURFACE-AT ?auto_1544 ?auto_1548 ) ( ON ?auto_1544 ?auto_1550 ) ( CLEAR ?auto_1544 ) ( TRUCK-AT ?auto_1547 ?auto_1546 ) ( not ( = ?auto_1543 ?auto_1544 ) ) ( not ( = ?auto_1543 ?auto_1550 ) ) ( not ( = ?auto_1544 ?auto_1550 ) ) ( not ( = ?auto_1545 ?auto_1549 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1547 ?auto_1546 ?auto_1548 )
      ( !LIFT ?auto_1549 ?auto_1544 ?auto_1550 ?auto_1548 )
      ( !LOAD ?auto_1549 ?auto_1544 ?auto_1547 ?auto_1548 )
      ( !DRIVE ?auto_1547 ?auto_1548 ?auto_1546 )
      ( !UNLOAD ?auto_1545 ?auto_1544 ?auto_1547 ?auto_1546 )
      ( !DROP ?auto_1545 ?auto_1544 ?auto_1543 ?auto_1546 )
      ( MAKE-1CRATE-VERIFY ?auto_1543 ?auto_1544 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1555 - SURFACE
      ?auto_1556 - SURFACE
      ?auto_1557 - SURFACE
      ?auto_1558 - SURFACE
    )
    :vars
    (
      ?auto_1564 - HOIST
      ?auto_1562 - PLACE
      ?auto_1561 - PLACE
      ?auto_1559 - HOIST
      ?auto_1560 - SURFACE
      ?auto_1566 - PLACE
      ?auto_1568 - HOIST
      ?auto_1565 - SURFACE
      ?auto_1567 - SURFACE
      ?auto_1563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1564 ?auto_1562 ) ( IS-CRATE ?auto_1558 ) ( not ( = ?auto_1561 ?auto_1562 ) ) ( HOIST-AT ?auto_1559 ?auto_1561 ) ( AVAILABLE ?auto_1559 ) ( SURFACE-AT ?auto_1558 ?auto_1561 ) ( ON ?auto_1558 ?auto_1560 ) ( CLEAR ?auto_1558 ) ( not ( = ?auto_1557 ?auto_1558 ) ) ( not ( = ?auto_1557 ?auto_1560 ) ) ( not ( = ?auto_1558 ?auto_1560 ) ) ( not ( = ?auto_1564 ?auto_1559 ) ) ( IS-CRATE ?auto_1557 ) ( not ( = ?auto_1566 ?auto_1562 ) ) ( HOIST-AT ?auto_1568 ?auto_1566 ) ( SURFACE-AT ?auto_1557 ?auto_1566 ) ( ON ?auto_1557 ?auto_1565 ) ( CLEAR ?auto_1557 ) ( not ( = ?auto_1556 ?auto_1557 ) ) ( not ( = ?auto_1556 ?auto_1565 ) ) ( not ( = ?auto_1557 ?auto_1565 ) ) ( not ( = ?auto_1564 ?auto_1568 ) ) ( SURFACE-AT ?auto_1555 ?auto_1562 ) ( CLEAR ?auto_1555 ) ( IS-CRATE ?auto_1556 ) ( AVAILABLE ?auto_1564 ) ( AVAILABLE ?auto_1568 ) ( SURFACE-AT ?auto_1556 ?auto_1566 ) ( ON ?auto_1556 ?auto_1567 ) ( CLEAR ?auto_1556 ) ( TRUCK-AT ?auto_1563 ?auto_1562 ) ( not ( = ?auto_1555 ?auto_1556 ) ) ( not ( = ?auto_1555 ?auto_1567 ) ) ( not ( = ?auto_1556 ?auto_1567 ) ) ( not ( = ?auto_1555 ?auto_1557 ) ) ( not ( = ?auto_1555 ?auto_1565 ) ) ( not ( = ?auto_1557 ?auto_1567 ) ) ( not ( = ?auto_1565 ?auto_1567 ) ) ( not ( = ?auto_1555 ?auto_1558 ) ) ( not ( = ?auto_1555 ?auto_1560 ) ) ( not ( = ?auto_1556 ?auto_1558 ) ) ( not ( = ?auto_1556 ?auto_1560 ) ) ( not ( = ?auto_1558 ?auto_1565 ) ) ( not ( = ?auto_1558 ?auto_1567 ) ) ( not ( = ?auto_1561 ?auto_1566 ) ) ( not ( = ?auto_1559 ?auto_1568 ) ) ( not ( = ?auto_1560 ?auto_1565 ) ) ( not ( = ?auto_1560 ?auto_1567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1555 ?auto_1556 ?auto_1557 )
      ( MAKE-1CRATE ?auto_1557 ?auto_1558 )
      ( MAKE-3CRATE-VERIFY ?auto_1555 ?auto_1556 ?auto_1557 ?auto_1558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1571 - SURFACE
      ?auto_1572 - SURFACE
    )
    :vars
    (
      ?auto_1573 - HOIST
      ?auto_1574 - PLACE
      ?auto_1576 - PLACE
      ?auto_1577 - HOIST
      ?auto_1578 - SURFACE
      ?auto_1575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1573 ?auto_1574 ) ( SURFACE-AT ?auto_1571 ?auto_1574 ) ( CLEAR ?auto_1571 ) ( IS-CRATE ?auto_1572 ) ( AVAILABLE ?auto_1573 ) ( not ( = ?auto_1576 ?auto_1574 ) ) ( HOIST-AT ?auto_1577 ?auto_1576 ) ( AVAILABLE ?auto_1577 ) ( SURFACE-AT ?auto_1572 ?auto_1576 ) ( ON ?auto_1572 ?auto_1578 ) ( CLEAR ?auto_1572 ) ( TRUCK-AT ?auto_1575 ?auto_1574 ) ( not ( = ?auto_1571 ?auto_1572 ) ) ( not ( = ?auto_1571 ?auto_1578 ) ) ( not ( = ?auto_1572 ?auto_1578 ) ) ( not ( = ?auto_1573 ?auto_1577 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1575 ?auto_1574 ?auto_1576 )
      ( !LIFT ?auto_1577 ?auto_1572 ?auto_1578 ?auto_1576 )
      ( !LOAD ?auto_1577 ?auto_1572 ?auto_1575 ?auto_1576 )
      ( !DRIVE ?auto_1575 ?auto_1576 ?auto_1574 )
      ( !UNLOAD ?auto_1573 ?auto_1572 ?auto_1575 ?auto_1574 )
      ( !DROP ?auto_1573 ?auto_1572 ?auto_1571 ?auto_1574 )
      ( MAKE-1CRATE-VERIFY ?auto_1571 ?auto_1572 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1584 - SURFACE
      ?auto_1585 - SURFACE
      ?auto_1586 - SURFACE
      ?auto_1587 - SURFACE
      ?auto_1588 - SURFACE
    )
    :vars
    (
      ?auto_1592 - HOIST
      ?auto_1593 - PLACE
      ?auto_1591 - PLACE
      ?auto_1590 - HOIST
      ?auto_1594 - SURFACE
      ?auto_1600 - PLACE
      ?auto_1595 - HOIST
      ?auto_1601 - SURFACE
      ?auto_1599 - PLACE
      ?auto_1597 - HOIST
      ?auto_1598 - SURFACE
      ?auto_1596 - SURFACE
      ?auto_1589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1592 ?auto_1593 ) ( IS-CRATE ?auto_1588 ) ( not ( = ?auto_1591 ?auto_1593 ) ) ( HOIST-AT ?auto_1590 ?auto_1591 ) ( AVAILABLE ?auto_1590 ) ( SURFACE-AT ?auto_1588 ?auto_1591 ) ( ON ?auto_1588 ?auto_1594 ) ( CLEAR ?auto_1588 ) ( not ( = ?auto_1587 ?auto_1588 ) ) ( not ( = ?auto_1587 ?auto_1594 ) ) ( not ( = ?auto_1588 ?auto_1594 ) ) ( not ( = ?auto_1592 ?auto_1590 ) ) ( IS-CRATE ?auto_1587 ) ( not ( = ?auto_1600 ?auto_1593 ) ) ( HOIST-AT ?auto_1595 ?auto_1600 ) ( AVAILABLE ?auto_1595 ) ( SURFACE-AT ?auto_1587 ?auto_1600 ) ( ON ?auto_1587 ?auto_1601 ) ( CLEAR ?auto_1587 ) ( not ( = ?auto_1586 ?auto_1587 ) ) ( not ( = ?auto_1586 ?auto_1601 ) ) ( not ( = ?auto_1587 ?auto_1601 ) ) ( not ( = ?auto_1592 ?auto_1595 ) ) ( IS-CRATE ?auto_1586 ) ( not ( = ?auto_1599 ?auto_1593 ) ) ( HOIST-AT ?auto_1597 ?auto_1599 ) ( SURFACE-AT ?auto_1586 ?auto_1599 ) ( ON ?auto_1586 ?auto_1598 ) ( CLEAR ?auto_1586 ) ( not ( = ?auto_1585 ?auto_1586 ) ) ( not ( = ?auto_1585 ?auto_1598 ) ) ( not ( = ?auto_1586 ?auto_1598 ) ) ( not ( = ?auto_1592 ?auto_1597 ) ) ( SURFACE-AT ?auto_1584 ?auto_1593 ) ( CLEAR ?auto_1584 ) ( IS-CRATE ?auto_1585 ) ( AVAILABLE ?auto_1592 ) ( AVAILABLE ?auto_1597 ) ( SURFACE-AT ?auto_1585 ?auto_1599 ) ( ON ?auto_1585 ?auto_1596 ) ( CLEAR ?auto_1585 ) ( TRUCK-AT ?auto_1589 ?auto_1593 ) ( not ( = ?auto_1584 ?auto_1585 ) ) ( not ( = ?auto_1584 ?auto_1596 ) ) ( not ( = ?auto_1585 ?auto_1596 ) ) ( not ( = ?auto_1584 ?auto_1586 ) ) ( not ( = ?auto_1584 ?auto_1598 ) ) ( not ( = ?auto_1586 ?auto_1596 ) ) ( not ( = ?auto_1598 ?auto_1596 ) ) ( not ( = ?auto_1584 ?auto_1587 ) ) ( not ( = ?auto_1584 ?auto_1601 ) ) ( not ( = ?auto_1585 ?auto_1587 ) ) ( not ( = ?auto_1585 ?auto_1601 ) ) ( not ( = ?auto_1587 ?auto_1598 ) ) ( not ( = ?auto_1587 ?auto_1596 ) ) ( not ( = ?auto_1600 ?auto_1599 ) ) ( not ( = ?auto_1595 ?auto_1597 ) ) ( not ( = ?auto_1601 ?auto_1598 ) ) ( not ( = ?auto_1601 ?auto_1596 ) ) ( not ( = ?auto_1584 ?auto_1588 ) ) ( not ( = ?auto_1584 ?auto_1594 ) ) ( not ( = ?auto_1585 ?auto_1588 ) ) ( not ( = ?auto_1585 ?auto_1594 ) ) ( not ( = ?auto_1586 ?auto_1588 ) ) ( not ( = ?auto_1586 ?auto_1594 ) ) ( not ( = ?auto_1588 ?auto_1601 ) ) ( not ( = ?auto_1588 ?auto_1598 ) ) ( not ( = ?auto_1588 ?auto_1596 ) ) ( not ( = ?auto_1591 ?auto_1600 ) ) ( not ( = ?auto_1591 ?auto_1599 ) ) ( not ( = ?auto_1590 ?auto_1595 ) ) ( not ( = ?auto_1590 ?auto_1597 ) ) ( not ( = ?auto_1594 ?auto_1601 ) ) ( not ( = ?auto_1594 ?auto_1598 ) ) ( not ( = ?auto_1594 ?auto_1596 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1584 ?auto_1585 ?auto_1586 ?auto_1587 )
      ( MAKE-1CRATE ?auto_1587 ?auto_1588 )
      ( MAKE-4CRATE-VERIFY ?auto_1584 ?auto_1585 ?auto_1586 ?auto_1587 ?auto_1588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1604 - SURFACE
      ?auto_1605 - SURFACE
    )
    :vars
    (
      ?auto_1606 - HOIST
      ?auto_1607 - PLACE
      ?auto_1609 - PLACE
      ?auto_1610 - HOIST
      ?auto_1611 - SURFACE
      ?auto_1608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606 ?auto_1607 ) ( SURFACE-AT ?auto_1604 ?auto_1607 ) ( CLEAR ?auto_1604 ) ( IS-CRATE ?auto_1605 ) ( AVAILABLE ?auto_1606 ) ( not ( = ?auto_1609 ?auto_1607 ) ) ( HOIST-AT ?auto_1610 ?auto_1609 ) ( AVAILABLE ?auto_1610 ) ( SURFACE-AT ?auto_1605 ?auto_1609 ) ( ON ?auto_1605 ?auto_1611 ) ( CLEAR ?auto_1605 ) ( TRUCK-AT ?auto_1608 ?auto_1607 ) ( not ( = ?auto_1604 ?auto_1605 ) ) ( not ( = ?auto_1604 ?auto_1611 ) ) ( not ( = ?auto_1605 ?auto_1611 ) ) ( not ( = ?auto_1606 ?auto_1610 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1608 ?auto_1607 ?auto_1609 )
      ( !LIFT ?auto_1610 ?auto_1605 ?auto_1611 ?auto_1609 )
      ( !LOAD ?auto_1610 ?auto_1605 ?auto_1608 ?auto_1609 )
      ( !DRIVE ?auto_1608 ?auto_1609 ?auto_1607 )
      ( !UNLOAD ?auto_1606 ?auto_1605 ?auto_1608 ?auto_1607 )
      ( !DROP ?auto_1606 ?auto_1605 ?auto_1604 ?auto_1607 )
      ( MAKE-1CRATE-VERIFY ?auto_1604 ?auto_1605 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1618 - SURFACE
      ?auto_1619 - SURFACE
      ?auto_1620 - SURFACE
      ?auto_1621 - SURFACE
      ?auto_1622 - SURFACE
      ?auto_1623 - SURFACE
    )
    :vars
    (
      ?auto_1624 - HOIST
      ?auto_1628 - PLACE
      ?auto_1629 - PLACE
      ?auto_1627 - HOIST
      ?auto_1626 - SURFACE
      ?auto_1637 - SURFACE
      ?auto_1635 - PLACE
      ?auto_1632 - HOIST
      ?auto_1636 - SURFACE
      ?auto_1630 - PLACE
      ?auto_1633 - HOIST
      ?auto_1631 - SURFACE
      ?auto_1634 - SURFACE
      ?auto_1625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624 ?auto_1628 ) ( IS-CRATE ?auto_1623 ) ( not ( = ?auto_1629 ?auto_1628 ) ) ( HOIST-AT ?auto_1627 ?auto_1629 ) ( SURFACE-AT ?auto_1623 ?auto_1629 ) ( ON ?auto_1623 ?auto_1626 ) ( CLEAR ?auto_1623 ) ( not ( = ?auto_1622 ?auto_1623 ) ) ( not ( = ?auto_1622 ?auto_1626 ) ) ( not ( = ?auto_1623 ?auto_1626 ) ) ( not ( = ?auto_1624 ?auto_1627 ) ) ( IS-CRATE ?auto_1622 ) ( AVAILABLE ?auto_1627 ) ( SURFACE-AT ?auto_1622 ?auto_1629 ) ( ON ?auto_1622 ?auto_1637 ) ( CLEAR ?auto_1622 ) ( not ( = ?auto_1621 ?auto_1622 ) ) ( not ( = ?auto_1621 ?auto_1637 ) ) ( not ( = ?auto_1622 ?auto_1637 ) ) ( IS-CRATE ?auto_1621 ) ( not ( = ?auto_1635 ?auto_1628 ) ) ( HOIST-AT ?auto_1632 ?auto_1635 ) ( AVAILABLE ?auto_1632 ) ( SURFACE-AT ?auto_1621 ?auto_1635 ) ( ON ?auto_1621 ?auto_1636 ) ( CLEAR ?auto_1621 ) ( not ( = ?auto_1620 ?auto_1621 ) ) ( not ( = ?auto_1620 ?auto_1636 ) ) ( not ( = ?auto_1621 ?auto_1636 ) ) ( not ( = ?auto_1624 ?auto_1632 ) ) ( IS-CRATE ?auto_1620 ) ( not ( = ?auto_1630 ?auto_1628 ) ) ( HOIST-AT ?auto_1633 ?auto_1630 ) ( SURFACE-AT ?auto_1620 ?auto_1630 ) ( ON ?auto_1620 ?auto_1631 ) ( CLEAR ?auto_1620 ) ( not ( = ?auto_1619 ?auto_1620 ) ) ( not ( = ?auto_1619 ?auto_1631 ) ) ( not ( = ?auto_1620 ?auto_1631 ) ) ( not ( = ?auto_1624 ?auto_1633 ) ) ( SURFACE-AT ?auto_1618 ?auto_1628 ) ( CLEAR ?auto_1618 ) ( IS-CRATE ?auto_1619 ) ( AVAILABLE ?auto_1624 ) ( AVAILABLE ?auto_1633 ) ( SURFACE-AT ?auto_1619 ?auto_1630 ) ( ON ?auto_1619 ?auto_1634 ) ( CLEAR ?auto_1619 ) ( TRUCK-AT ?auto_1625 ?auto_1628 ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( not ( = ?auto_1618 ?auto_1634 ) ) ( not ( = ?auto_1619 ?auto_1634 ) ) ( not ( = ?auto_1618 ?auto_1620 ) ) ( not ( = ?auto_1618 ?auto_1631 ) ) ( not ( = ?auto_1620 ?auto_1634 ) ) ( not ( = ?auto_1631 ?auto_1634 ) ) ( not ( = ?auto_1618 ?auto_1621 ) ) ( not ( = ?auto_1618 ?auto_1636 ) ) ( not ( = ?auto_1619 ?auto_1621 ) ) ( not ( = ?auto_1619 ?auto_1636 ) ) ( not ( = ?auto_1621 ?auto_1631 ) ) ( not ( = ?auto_1621 ?auto_1634 ) ) ( not ( = ?auto_1635 ?auto_1630 ) ) ( not ( = ?auto_1632 ?auto_1633 ) ) ( not ( = ?auto_1636 ?auto_1631 ) ) ( not ( = ?auto_1636 ?auto_1634 ) ) ( not ( = ?auto_1618 ?auto_1622 ) ) ( not ( = ?auto_1618 ?auto_1637 ) ) ( not ( = ?auto_1619 ?auto_1622 ) ) ( not ( = ?auto_1619 ?auto_1637 ) ) ( not ( = ?auto_1620 ?auto_1622 ) ) ( not ( = ?auto_1620 ?auto_1637 ) ) ( not ( = ?auto_1622 ?auto_1636 ) ) ( not ( = ?auto_1622 ?auto_1631 ) ) ( not ( = ?auto_1622 ?auto_1634 ) ) ( not ( = ?auto_1629 ?auto_1635 ) ) ( not ( = ?auto_1629 ?auto_1630 ) ) ( not ( = ?auto_1627 ?auto_1632 ) ) ( not ( = ?auto_1627 ?auto_1633 ) ) ( not ( = ?auto_1637 ?auto_1636 ) ) ( not ( = ?auto_1637 ?auto_1631 ) ) ( not ( = ?auto_1637 ?auto_1634 ) ) ( not ( = ?auto_1618 ?auto_1623 ) ) ( not ( = ?auto_1618 ?auto_1626 ) ) ( not ( = ?auto_1619 ?auto_1623 ) ) ( not ( = ?auto_1619 ?auto_1626 ) ) ( not ( = ?auto_1620 ?auto_1623 ) ) ( not ( = ?auto_1620 ?auto_1626 ) ) ( not ( = ?auto_1621 ?auto_1623 ) ) ( not ( = ?auto_1621 ?auto_1626 ) ) ( not ( = ?auto_1623 ?auto_1637 ) ) ( not ( = ?auto_1623 ?auto_1636 ) ) ( not ( = ?auto_1623 ?auto_1631 ) ) ( not ( = ?auto_1623 ?auto_1634 ) ) ( not ( = ?auto_1626 ?auto_1637 ) ) ( not ( = ?auto_1626 ?auto_1636 ) ) ( not ( = ?auto_1626 ?auto_1631 ) ) ( not ( = ?auto_1626 ?auto_1634 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1618 ?auto_1619 ?auto_1620 ?auto_1621 ?auto_1622 )
      ( MAKE-1CRATE ?auto_1622 ?auto_1623 )
      ( MAKE-5CRATE-VERIFY ?auto_1618 ?auto_1619 ?auto_1620 ?auto_1621 ?auto_1622 ?auto_1623 ) )
  )

)

