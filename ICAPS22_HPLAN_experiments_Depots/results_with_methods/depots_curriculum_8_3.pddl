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
      ?auto_1592 - SURFACE
      ?auto_1593 - SURFACE
    )
    :vars
    (
      ?auto_1594 - HOIST
      ?auto_1595 - PLACE
      ?auto_1597 - PLACE
      ?auto_1598 - HOIST
      ?auto_1599 - SURFACE
      ?auto_1596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1594 ?auto_1595 ) ( SURFACE-AT ?auto_1593 ?auto_1595 ) ( CLEAR ?auto_1593 ) ( IS-CRATE ?auto_1592 ) ( AVAILABLE ?auto_1594 ) ( not ( = ?auto_1597 ?auto_1595 ) ) ( HOIST-AT ?auto_1598 ?auto_1597 ) ( AVAILABLE ?auto_1598 ) ( SURFACE-AT ?auto_1592 ?auto_1597 ) ( ON ?auto_1592 ?auto_1599 ) ( CLEAR ?auto_1592 ) ( TRUCK-AT ?auto_1596 ?auto_1595 ) ( not ( = ?auto_1592 ?auto_1593 ) ) ( not ( = ?auto_1592 ?auto_1599 ) ) ( not ( = ?auto_1593 ?auto_1599 ) ) ( not ( = ?auto_1594 ?auto_1598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596 ?auto_1595 ?auto_1597 )
      ( !LIFT ?auto_1598 ?auto_1592 ?auto_1599 ?auto_1597 )
      ( !LOAD ?auto_1598 ?auto_1592 ?auto_1596 ?auto_1597 )
      ( !DRIVE ?auto_1596 ?auto_1597 ?auto_1595 )
      ( !UNLOAD ?auto_1594 ?auto_1592 ?auto_1596 ?auto_1595 )
      ( !DROP ?auto_1594 ?auto_1592 ?auto_1593 ?auto_1595 )
      ( MAKE-ON-VERIFY ?auto_1592 ?auto_1593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1602 - SURFACE
      ?auto_1603 - SURFACE
    )
    :vars
    (
      ?auto_1604 - HOIST
      ?auto_1605 - PLACE
      ?auto_1607 - PLACE
      ?auto_1608 - HOIST
      ?auto_1609 - SURFACE
      ?auto_1606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1604 ?auto_1605 ) ( SURFACE-AT ?auto_1603 ?auto_1605 ) ( CLEAR ?auto_1603 ) ( IS-CRATE ?auto_1602 ) ( AVAILABLE ?auto_1604 ) ( not ( = ?auto_1607 ?auto_1605 ) ) ( HOIST-AT ?auto_1608 ?auto_1607 ) ( AVAILABLE ?auto_1608 ) ( SURFACE-AT ?auto_1602 ?auto_1607 ) ( ON ?auto_1602 ?auto_1609 ) ( CLEAR ?auto_1602 ) ( TRUCK-AT ?auto_1606 ?auto_1605 ) ( not ( = ?auto_1602 ?auto_1603 ) ) ( not ( = ?auto_1602 ?auto_1609 ) ) ( not ( = ?auto_1603 ?auto_1609 ) ) ( not ( = ?auto_1604 ?auto_1608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1606 ?auto_1605 ?auto_1607 )
      ( !LIFT ?auto_1608 ?auto_1602 ?auto_1609 ?auto_1607 )
      ( !LOAD ?auto_1608 ?auto_1602 ?auto_1606 ?auto_1607 )
      ( !DRIVE ?auto_1606 ?auto_1607 ?auto_1605 )
      ( !UNLOAD ?auto_1604 ?auto_1602 ?auto_1606 ?auto_1605 )
      ( !DROP ?auto_1604 ?auto_1602 ?auto_1603 ?auto_1605 )
      ( MAKE-ON-VERIFY ?auto_1602 ?auto_1603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1612 - SURFACE
      ?auto_1613 - SURFACE
    )
    :vars
    (
      ?auto_1614 - HOIST
      ?auto_1615 - PLACE
      ?auto_1617 - PLACE
      ?auto_1618 - HOIST
      ?auto_1619 - SURFACE
      ?auto_1616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1614 ?auto_1615 ) ( SURFACE-AT ?auto_1613 ?auto_1615 ) ( CLEAR ?auto_1613 ) ( IS-CRATE ?auto_1612 ) ( AVAILABLE ?auto_1614 ) ( not ( = ?auto_1617 ?auto_1615 ) ) ( HOIST-AT ?auto_1618 ?auto_1617 ) ( AVAILABLE ?auto_1618 ) ( SURFACE-AT ?auto_1612 ?auto_1617 ) ( ON ?auto_1612 ?auto_1619 ) ( CLEAR ?auto_1612 ) ( TRUCK-AT ?auto_1616 ?auto_1615 ) ( not ( = ?auto_1612 ?auto_1613 ) ) ( not ( = ?auto_1612 ?auto_1619 ) ) ( not ( = ?auto_1613 ?auto_1619 ) ) ( not ( = ?auto_1614 ?auto_1618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1616 ?auto_1615 ?auto_1617 )
      ( !LIFT ?auto_1618 ?auto_1612 ?auto_1619 ?auto_1617 )
      ( !LOAD ?auto_1618 ?auto_1612 ?auto_1616 ?auto_1617 )
      ( !DRIVE ?auto_1616 ?auto_1617 ?auto_1615 )
      ( !UNLOAD ?auto_1614 ?auto_1612 ?auto_1616 ?auto_1615 )
      ( !DROP ?auto_1614 ?auto_1612 ?auto_1613 ?auto_1615 )
      ( MAKE-ON-VERIFY ?auto_1612 ?auto_1613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1622 - SURFACE
      ?auto_1623 - SURFACE
    )
    :vars
    (
      ?auto_1624 - HOIST
      ?auto_1625 - PLACE
      ?auto_1627 - PLACE
      ?auto_1628 - HOIST
      ?auto_1629 - SURFACE
      ?auto_1626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624 ?auto_1625 ) ( SURFACE-AT ?auto_1623 ?auto_1625 ) ( CLEAR ?auto_1623 ) ( IS-CRATE ?auto_1622 ) ( AVAILABLE ?auto_1624 ) ( not ( = ?auto_1627 ?auto_1625 ) ) ( HOIST-AT ?auto_1628 ?auto_1627 ) ( AVAILABLE ?auto_1628 ) ( SURFACE-AT ?auto_1622 ?auto_1627 ) ( ON ?auto_1622 ?auto_1629 ) ( CLEAR ?auto_1622 ) ( TRUCK-AT ?auto_1626 ?auto_1625 ) ( not ( = ?auto_1622 ?auto_1623 ) ) ( not ( = ?auto_1622 ?auto_1629 ) ) ( not ( = ?auto_1623 ?auto_1629 ) ) ( not ( = ?auto_1624 ?auto_1628 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1626 ?auto_1625 ?auto_1627 )
      ( !LIFT ?auto_1628 ?auto_1622 ?auto_1629 ?auto_1627 )
      ( !LOAD ?auto_1628 ?auto_1622 ?auto_1626 ?auto_1627 )
      ( !DRIVE ?auto_1626 ?auto_1627 ?auto_1625 )
      ( !UNLOAD ?auto_1624 ?auto_1622 ?auto_1626 ?auto_1625 )
      ( !DROP ?auto_1624 ?auto_1622 ?auto_1623 ?auto_1625 )
      ( MAKE-ON-VERIFY ?auto_1622 ?auto_1623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1632 - SURFACE
      ?auto_1633 - SURFACE
    )
    :vars
    (
      ?auto_1634 - HOIST
      ?auto_1635 - PLACE
      ?auto_1637 - PLACE
      ?auto_1638 - HOIST
      ?auto_1639 - SURFACE
      ?auto_1636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634 ?auto_1635 ) ( SURFACE-AT ?auto_1633 ?auto_1635 ) ( CLEAR ?auto_1633 ) ( IS-CRATE ?auto_1632 ) ( AVAILABLE ?auto_1634 ) ( not ( = ?auto_1637 ?auto_1635 ) ) ( HOIST-AT ?auto_1638 ?auto_1637 ) ( AVAILABLE ?auto_1638 ) ( SURFACE-AT ?auto_1632 ?auto_1637 ) ( ON ?auto_1632 ?auto_1639 ) ( CLEAR ?auto_1632 ) ( TRUCK-AT ?auto_1636 ?auto_1635 ) ( not ( = ?auto_1632 ?auto_1633 ) ) ( not ( = ?auto_1632 ?auto_1639 ) ) ( not ( = ?auto_1633 ?auto_1639 ) ) ( not ( = ?auto_1634 ?auto_1638 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1636 ?auto_1635 ?auto_1637 )
      ( !LIFT ?auto_1638 ?auto_1632 ?auto_1639 ?auto_1637 )
      ( !LOAD ?auto_1638 ?auto_1632 ?auto_1636 ?auto_1637 )
      ( !DRIVE ?auto_1636 ?auto_1637 ?auto_1635 )
      ( !UNLOAD ?auto_1634 ?auto_1632 ?auto_1636 ?auto_1635 )
      ( !DROP ?auto_1634 ?auto_1632 ?auto_1633 ?auto_1635 )
      ( MAKE-ON-VERIFY ?auto_1632 ?auto_1633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1642 - SURFACE
      ?auto_1643 - SURFACE
    )
    :vars
    (
      ?auto_1644 - HOIST
      ?auto_1645 - PLACE
      ?auto_1647 - PLACE
      ?auto_1648 - HOIST
      ?auto_1649 - SURFACE
      ?auto_1646 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1644 ?auto_1645 ) ( SURFACE-AT ?auto_1643 ?auto_1645 ) ( CLEAR ?auto_1643 ) ( IS-CRATE ?auto_1642 ) ( AVAILABLE ?auto_1644 ) ( not ( = ?auto_1647 ?auto_1645 ) ) ( HOIST-AT ?auto_1648 ?auto_1647 ) ( AVAILABLE ?auto_1648 ) ( SURFACE-AT ?auto_1642 ?auto_1647 ) ( ON ?auto_1642 ?auto_1649 ) ( CLEAR ?auto_1642 ) ( TRUCK-AT ?auto_1646 ?auto_1645 ) ( not ( = ?auto_1642 ?auto_1643 ) ) ( not ( = ?auto_1642 ?auto_1649 ) ) ( not ( = ?auto_1643 ?auto_1649 ) ) ( not ( = ?auto_1644 ?auto_1648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1646 ?auto_1645 ?auto_1647 )
      ( !LIFT ?auto_1648 ?auto_1642 ?auto_1649 ?auto_1647 )
      ( !LOAD ?auto_1648 ?auto_1642 ?auto_1646 ?auto_1647 )
      ( !DRIVE ?auto_1646 ?auto_1647 ?auto_1645 )
      ( !UNLOAD ?auto_1644 ?auto_1642 ?auto_1646 ?auto_1645 )
      ( !DROP ?auto_1644 ?auto_1642 ?auto_1643 ?auto_1645 )
      ( MAKE-ON-VERIFY ?auto_1642 ?auto_1643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1652 - SURFACE
      ?auto_1653 - SURFACE
    )
    :vars
    (
      ?auto_1654 - HOIST
      ?auto_1655 - PLACE
      ?auto_1657 - PLACE
      ?auto_1658 - HOIST
      ?auto_1659 - SURFACE
      ?auto_1656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1654 ?auto_1655 ) ( SURFACE-AT ?auto_1653 ?auto_1655 ) ( CLEAR ?auto_1653 ) ( IS-CRATE ?auto_1652 ) ( AVAILABLE ?auto_1654 ) ( not ( = ?auto_1657 ?auto_1655 ) ) ( HOIST-AT ?auto_1658 ?auto_1657 ) ( AVAILABLE ?auto_1658 ) ( SURFACE-AT ?auto_1652 ?auto_1657 ) ( ON ?auto_1652 ?auto_1659 ) ( CLEAR ?auto_1652 ) ( TRUCK-AT ?auto_1656 ?auto_1655 ) ( not ( = ?auto_1652 ?auto_1653 ) ) ( not ( = ?auto_1652 ?auto_1659 ) ) ( not ( = ?auto_1653 ?auto_1659 ) ) ( not ( = ?auto_1654 ?auto_1658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1656 ?auto_1655 ?auto_1657 )
      ( !LIFT ?auto_1658 ?auto_1652 ?auto_1659 ?auto_1657 )
      ( !LOAD ?auto_1658 ?auto_1652 ?auto_1656 ?auto_1657 )
      ( !DRIVE ?auto_1656 ?auto_1657 ?auto_1655 )
      ( !UNLOAD ?auto_1654 ?auto_1652 ?auto_1656 ?auto_1655 )
      ( !DROP ?auto_1654 ?auto_1652 ?auto_1653 ?auto_1655 )
      ( MAKE-ON-VERIFY ?auto_1652 ?auto_1653 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1662 - SURFACE
      ?auto_1663 - SURFACE
    )
    :vars
    (
      ?auto_1664 - HOIST
      ?auto_1665 - PLACE
      ?auto_1667 - PLACE
      ?auto_1668 - HOIST
      ?auto_1669 - SURFACE
      ?auto_1666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1664 ?auto_1665 ) ( SURFACE-AT ?auto_1663 ?auto_1665 ) ( CLEAR ?auto_1663 ) ( IS-CRATE ?auto_1662 ) ( AVAILABLE ?auto_1664 ) ( not ( = ?auto_1667 ?auto_1665 ) ) ( HOIST-AT ?auto_1668 ?auto_1667 ) ( AVAILABLE ?auto_1668 ) ( SURFACE-AT ?auto_1662 ?auto_1667 ) ( ON ?auto_1662 ?auto_1669 ) ( CLEAR ?auto_1662 ) ( TRUCK-AT ?auto_1666 ?auto_1665 ) ( not ( = ?auto_1662 ?auto_1663 ) ) ( not ( = ?auto_1662 ?auto_1669 ) ) ( not ( = ?auto_1663 ?auto_1669 ) ) ( not ( = ?auto_1664 ?auto_1668 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1666 ?auto_1665 ?auto_1667 )
      ( !LIFT ?auto_1668 ?auto_1662 ?auto_1669 ?auto_1667 )
      ( !LOAD ?auto_1668 ?auto_1662 ?auto_1666 ?auto_1667 )
      ( !DRIVE ?auto_1666 ?auto_1667 ?auto_1665 )
      ( !UNLOAD ?auto_1664 ?auto_1662 ?auto_1666 ?auto_1665 )
      ( !DROP ?auto_1664 ?auto_1662 ?auto_1663 ?auto_1665 )
      ( MAKE-ON-VERIFY ?auto_1662 ?auto_1663 ) )
  )

)

