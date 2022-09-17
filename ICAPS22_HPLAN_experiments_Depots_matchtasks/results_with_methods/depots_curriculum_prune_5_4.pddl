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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1531 - SURFACE
      ?auto_1532 - SURFACE
      ?auto_1533 - SURFACE
    )
    :vars
    (
      ?auto_1536 - HOIST
      ?auto_1538 - PLACE
      ?auto_1534 - PLACE
      ?auto_1537 - HOIST
      ?auto_1539 - SURFACE
      ?auto_1540 - SURFACE
      ?auto_1535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1536 ?auto_1538 ) ( IS-CRATE ?auto_1533 ) ( not ( = ?auto_1534 ?auto_1538 ) ) ( HOIST-AT ?auto_1537 ?auto_1534 ) ( SURFACE-AT ?auto_1533 ?auto_1534 ) ( ON ?auto_1533 ?auto_1539 ) ( CLEAR ?auto_1533 ) ( not ( = ?auto_1532 ?auto_1533 ) ) ( not ( = ?auto_1532 ?auto_1539 ) ) ( not ( = ?auto_1533 ?auto_1539 ) ) ( not ( = ?auto_1536 ?auto_1537 ) ) ( SURFACE-AT ?auto_1531 ?auto_1538 ) ( CLEAR ?auto_1531 ) ( IS-CRATE ?auto_1532 ) ( AVAILABLE ?auto_1536 ) ( AVAILABLE ?auto_1537 ) ( SURFACE-AT ?auto_1532 ?auto_1534 ) ( ON ?auto_1532 ?auto_1540 ) ( CLEAR ?auto_1532 ) ( TRUCK-AT ?auto_1535 ?auto_1538 ) ( not ( = ?auto_1531 ?auto_1532 ) ) ( not ( = ?auto_1531 ?auto_1540 ) ) ( not ( = ?auto_1532 ?auto_1540 ) ) ( not ( = ?auto_1531 ?auto_1533 ) ) ( not ( = ?auto_1531 ?auto_1539 ) ) ( not ( = ?auto_1533 ?auto_1540 ) ) ( not ( = ?auto_1539 ?auto_1540 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1531 ?auto_1532 )
      ( MAKE-1CRATE ?auto_1532 ?auto_1533 )
      ( MAKE-2CRATE-VERIFY ?auto_1531 ?auto_1532 ?auto_1533 ) )
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
      ?auto_1562 - HOIST
      ?auto_1560 - PLACE
      ?auto_1561 - PLACE
      ?auto_1564 - HOIST
      ?auto_1559 - SURFACE
      ?auto_1567 - PLACE
      ?auto_1566 - HOIST
      ?auto_1565 - SURFACE
      ?auto_1568 - SURFACE
      ?auto_1563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1562 ?auto_1560 ) ( IS-CRATE ?auto_1558 ) ( not ( = ?auto_1561 ?auto_1560 ) ) ( HOIST-AT ?auto_1564 ?auto_1561 ) ( AVAILABLE ?auto_1564 ) ( SURFACE-AT ?auto_1558 ?auto_1561 ) ( ON ?auto_1558 ?auto_1559 ) ( CLEAR ?auto_1558 ) ( not ( = ?auto_1557 ?auto_1558 ) ) ( not ( = ?auto_1557 ?auto_1559 ) ) ( not ( = ?auto_1558 ?auto_1559 ) ) ( not ( = ?auto_1562 ?auto_1564 ) ) ( IS-CRATE ?auto_1557 ) ( not ( = ?auto_1567 ?auto_1560 ) ) ( HOIST-AT ?auto_1566 ?auto_1567 ) ( SURFACE-AT ?auto_1557 ?auto_1567 ) ( ON ?auto_1557 ?auto_1565 ) ( CLEAR ?auto_1557 ) ( not ( = ?auto_1556 ?auto_1557 ) ) ( not ( = ?auto_1556 ?auto_1565 ) ) ( not ( = ?auto_1557 ?auto_1565 ) ) ( not ( = ?auto_1562 ?auto_1566 ) ) ( SURFACE-AT ?auto_1555 ?auto_1560 ) ( CLEAR ?auto_1555 ) ( IS-CRATE ?auto_1556 ) ( AVAILABLE ?auto_1562 ) ( AVAILABLE ?auto_1566 ) ( SURFACE-AT ?auto_1556 ?auto_1567 ) ( ON ?auto_1556 ?auto_1568 ) ( CLEAR ?auto_1556 ) ( TRUCK-AT ?auto_1563 ?auto_1560 ) ( not ( = ?auto_1555 ?auto_1556 ) ) ( not ( = ?auto_1555 ?auto_1568 ) ) ( not ( = ?auto_1556 ?auto_1568 ) ) ( not ( = ?auto_1555 ?auto_1557 ) ) ( not ( = ?auto_1555 ?auto_1565 ) ) ( not ( = ?auto_1557 ?auto_1568 ) ) ( not ( = ?auto_1565 ?auto_1568 ) ) ( not ( = ?auto_1555 ?auto_1558 ) ) ( not ( = ?auto_1555 ?auto_1559 ) ) ( not ( = ?auto_1556 ?auto_1558 ) ) ( not ( = ?auto_1556 ?auto_1559 ) ) ( not ( = ?auto_1558 ?auto_1565 ) ) ( not ( = ?auto_1558 ?auto_1568 ) ) ( not ( = ?auto_1561 ?auto_1567 ) ) ( not ( = ?auto_1564 ?auto_1566 ) ) ( not ( = ?auto_1559 ?auto_1565 ) ) ( not ( = ?auto_1559 ?auto_1568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1555 ?auto_1556 ?auto_1557 )
      ( MAKE-1CRATE ?auto_1557 ?auto_1558 )
      ( MAKE-3CRATE-VERIFY ?auto_1555 ?auto_1556 ?auto_1557 ?auto_1558 ) )
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
      ?auto_1589 - HOIST
      ?auto_1594 - SURFACE
      ?auto_1601 - PLACE
      ?auto_1600 - HOIST
      ?auto_1595 - SURFACE
      ?auto_1598 - PLACE
      ?auto_1597 - HOIST
      ?auto_1596 - SURFACE
      ?auto_1599 - SURFACE
      ?auto_1590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1592 ?auto_1593 ) ( IS-CRATE ?auto_1588 ) ( not ( = ?auto_1591 ?auto_1593 ) ) ( HOIST-AT ?auto_1589 ?auto_1591 ) ( AVAILABLE ?auto_1589 ) ( SURFACE-AT ?auto_1588 ?auto_1591 ) ( ON ?auto_1588 ?auto_1594 ) ( CLEAR ?auto_1588 ) ( not ( = ?auto_1587 ?auto_1588 ) ) ( not ( = ?auto_1587 ?auto_1594 ) ) ( not ( = ?auto_1588 ?auto_1594 ) ) ( not ( = ?auto_1592 ?auto_1589 ) ) ( IS-CRATE ?auto_1587 ) ( not ( = ?auto_1601 ?auto_1593 ) ) ( HOIST-AT ?auto_1600 ?auto_1601 ) ( AVAILABLE ?auto_1600 ) ( SURFACE-AT ?auto_1587 ?auto_1601 ) ( ON ?auto_1587 ?auto_1595 ) ( CLEAR ?auto_1587 ) ( not ( = ?auto_1586 ?auto_1587 ) ) ( not ( = ?auto_1586 ?auto_1595 ) ) ( not ( = ?auto_1587 ?auto_1595 ) ) ( not ( = ?auto_1592 ?auto_1600 ) ) ( IS-CRATE ?auto_1586 ) ( not ( = ?auto_1598 ?auto_1593 ) ) ( HOIST-AT ?auto_1597 ?auto_1598 ) ( SURFACE-AT ?auto_1586 ?auto_1598 ) ( ON ?auto_1586 ?auto_1596 ) ( CLEAR ?auto_1586 ) ( not ( = ?auto_1585 ?auto_1586 ) ) ( not ( = ?auto_1585 ?auto_1596 ) ) ( not ( = ?auto_1586 ?auto_1596 ) ) ( not ( = ?auto_1592 ?auto_1597 ) ) ( SURFACE-AT ?auto_1584 ?auto_1593 ) ( CLEAR ?auto_1584 ) ( IS-CRATE ?auto_1585 ) ( AVAILABLE ?auto_1592 ) ( AVAILABLE ?auto_1597 ) ( SURFACE-AT ?auto_1585 ?auto_1598 ) ( ON ?auto_1585 ?auto_1599 ) ( CLEAR ?auto_1585 ) ( TRUCK-AT ?auto_1590 ?auto_1593 ) ( not ( = ?auto_1584 ?auto_1585 ) ) ( not ( = ?auto_1584 ?auto_1599 ) ) ( not ( = ?auto_1585 ?auto_1599 ) ) ( not ( = ?auto_1584 ?auto_1586 ) ) ( not ( = ?auto_1584 ?auto_1596 ) ) ( not ( = ?auto_1586 ?auto_1599 ) ) ( not ( = ?auto_1596 ?auto_1599 ) ) ( not ( = ?auto_1584 ?auto_1587 ) ) ( not ( = ?auto_1584 ?auto_1595 ) ) ( not ( = ?auto_1585 ?auto_1587 ) ) ( not ( = ?auto_1585 ?auto_1595 ) ) ( not ( = ?auto_1587 ?auto_1596 ) ) ( not ( = ?auto_1587 ?auto_1599 ) ) ( not ( = ?auto_1601 ?auto_1598 ) ) ( not ( = ?auto_1600 ?auto_1597 ) ) ( not ( = ?auto_1595 ?auto_1596 ) ) ( not ( = ?auto_1595 ?auto_1599 ) ) ( not ( = ?auto_1584 ?auto_1588 ) ) ( not ( = ?auto_1584 ?auto_1594 ) ) ( not ( = ?auto_1585 ?auto_1588 ) ) ( not ( = ?auto_1585 ?auto_1594 ) ) ( not ( = ?auto_1586 ?auto_1588 ) ) ( not ( = ?auto_1586 ?auto_1594 ) ) ( not ( = ?auto_1588 ?auto_1595 ) ) ( not ( = ?auto_1588 ?auto_1596 ) ) ( not ( = ?auto_1588 ?auto_1599 ) ) ( not ( = ?auto_1591 ?auto_1601 ) ) ( not ( = ?auto_1591 ?auto_1598 ) ) ( not ( = ?auto_1589 ?auto_1600 ) ) ( not ( = ?auto_1589 ?auto_1597 ) ) ( not ( = ?auto_1594 ?auto_1595 ) ) ( not ( = ?auto_1594 ?auto_1596 ) ) ( not ( = ?auto_1594 ?auto_1599 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1584 ?auto_1585 ?auto_1586 ?auto_1587 )
      ( MAKE-1CRATE ?auto_1587 ?auto_1588 )
      ( MAKE-4CRATE-VERIFY ?auto_1584 ?auto_1585 ?auto_1586 ?auto_1587 ?auto_1588 ) )
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
      ?auto_1625 - HOIST
      ?auto_1627 - PLACE
      ?auto_1626 - PLACE
      ?auto_1629 - HOIST
      ?auto_1628 - SURFACE
      ?auto_1635 - SURFACE
      ?auto_1636 - PLACE
      ?auto_1632 - HOIST
      ?auto_1633 - SURFACE
      ?auto_1630 - PLACE
      ?auto_1634 - HOIST
      ?auto_1637 - SURFACE
      ?auto_1631 - SURFACE
      ?auto_1624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625 ?auto_1627 ) ( IS-CRATE ?auto_1623 ) ( not ( = ?auto_1626 ?auto_1627 ) ) ( HOIST-AT ?auto_1629 ?auto_1626 ) ( SURFACE-AT ?auto_1623 ?auto_1626 ) ( ON ?auto_1623 ?auto_1628 ) ( CLEAR ?auto_1623 ) ( not ( = ?auto_1622 ?auto_1623 ) ) ( not ( = ?auto_1622 ?auto_1628 ) ) ( not ( = ?auto_1623 ?auto_1628 ) ) ( not ( = ?auto_1625 ?auto_1629 ) ) ( IS-CRATE ?auto_1622 ) ( AVAILABLE ?auto_1629 ) ( SURFACE-AT ?auto_1622 ?auto_1626 ) ( ON ?auto_1622 ?auto_1635 ) ( CLEAR ?auto_1622 ) ( not ( = ?auto_1621 ?auto_1622 ) ) ( not ( = ?auto_1621 ?auto_1635 ) ) ( not ( = ?auto_1622 ?auto_1635 ) ) ( IS-CRATE ?auto_1621 ) ( not ( = ?auto_1636 ?auto_1627 ) ) ( HOIST-AT ?auto_1632 ?auto_1636 ) ( AVAILABLE ?auto_1632 ) ( SURFACE-AT ?auto_1621 ?auto_1636 ) ( ON ?auto_1621 ?auto_1633 ) ( CLEAR ?auto_1621 ) ( not ( = ?auto_1620 ?auto_1621 ) ) ( not ( = ?auto_1620 ?auto_1633 ) ) ( not ( = ?auto_1621 ?auto_1633 ) ) ( not ( = ?auto_1625 ?auto_1632 ) ) ( IS-CRATE ?auto_1620 ) ( not ( = ?auto_1630 ?auto_1627 ) ) ( HOIST-AT ?auto_1634 ?auto_1630 ) ( SURFACE-AT ?auto_1620 ?auto_1630 ) ( ON ?auto_1620 ?auto_1637 ) ( CLEAR ?auto_1620 ) ( not ( = ?auto_1619 ?auto_1620 ) ) ( not ( = ?auto_1619 ?auto_1637 ) ) ( not ( = ?auto_1620 ?auto_1637 ) ) ( not ( = ?auto_1625 ?auto_1634 ) ) ( SURFACE-AT ?auto_1618 ?auto_1627 ) ( CLEAR ?auto_1618 ) ( IS-CRATE ?auto_1619 ) ( AVAILABLE ?auto_1625 ) ( AVAILABLE ?auto_1634 ) ( SURFACE-AT ?auto_1619 ?auto_1630 ) ( ON ?auto_1619 ?auto_1631 ) ( CLEAR ?auto_1619 ) ( TRUCK-AT ?auto_1624 ?auto_1627 ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( not ( = ?auto_1618 ?auto_1631 ) ) ( not ( = ?auto_1619 ?auto_1631 ) ) ( not ( = ?auto_1618 ?auto_1620 ) ) ( not ( = ?auto_1618 ?auto_1637 ) ) ( not ( = ?auto_1620 ?auto_1631 ) ) ( not ( = ?auto_1637 ?auto_1631 ) ) ( not ( = ?auto_1618 ?auto_1621 ) ) ( not ( = ?auto_1618 ?auto_1633 ) ) ( not ( = ?auto_1619 ?auto_1621 ) ) ( not ( = ?auto_1619 ?auto_1633 ) ) ( not ( = ?auto_1621 ?auto_1637 ) ) ( not ( = ?auto_1621 ?auto_1631 ) ) ( not ( = ?auto_1636 ?auto_1630 ) ) ( not ( = ?auto_1632 ?auto_1634 ) ) ( not ( = ?auto_1633 ?auto_1637 ) ) ( not ( = ?auto_1633 ?auto_1631 ) ) ( not ( = ?auto_1618 ?auto_1622 ) ) ( not ( = ?auto_1618 ?auto_1635 ) ) ( not ( = ?auto_1619 ?auto_1622 ) ) ( not ( = ?auto_1619 ?auto_1635 ) ) ( not ( = ?auto_1620 ?auto_1622 ) ) ( not ( = ?auto_1620 ?auto_1635 ) ) ( not ( = ?auto_1622 ?auto_1633 ) ) ( not ( = ?auto_1622 ?auto_1637 ) ) ( not ( = ?auto_1622 ?auto_1631 ) ) ( not ( = ?auto_1626 ?auto_1636 ) ) ( not ( = ?auto_1626 ?auto_1630 ) ) ( not ( = ?auto_1629 ?auto_1632 ) ) ( not ( = ?auto_1629 ?auto_1634 ) ) ( not ( = ?auto_1635 ?auto_1633 ) ) ( not ( = ?auto_1635 ?auto_1637 ) ) ( not ( = ?auto_1635 ?auto_1631 ) ) ( not ( = ?auto_1618 ?auto_1623 ) ) ( not ( = ?auto_1618 ?auto_1628 ) ) ( not ( = ?auto_1619 ?auto_1623 ) ) ( not ( = ?auto_1619 ?auto_1628 ) ) ( not ( = ?auto_1620 ?auto_1623 ) ) ( not ( = ?auto_1620 ?auto_1628 ) ) ( not ( = ?auto_1621 ?auto_1623 ) ) ( not ( = ?auto_1621 ?auto_1628 ) ) ( not ( = ?auto_1623 ?auto_1635 ) ) ( not ( = ?auto_1623 ?auto_1633 ) ) ( not ( = ?auto_1623 ?auto_1637 ) ) ( not ( = ?auto_1623 ?auto_1631 ) ) ( not ( = ?auto_1628 ?auto_1635 ) ) ( not ( = ?auto_1628 ?auto_1633 ) ) ( not ( = ?auto_1628 ?auto_1637 ) ) ( not ( = ?auto_1628 ?auto_1631 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1618 ?auto_1619 ?auto_1620 ?auto_1621 ?auto_1622 )
      ( MAKE-1CRATE ?auto_1622 ?auto_1623 )
      ( MAKE-5CRATE-VERIFY ?auto_1618 ?auto_1619 ?auto_1620 ?auto_1621 ?auto_1622 ?auto_1623 ) )
  )

)

