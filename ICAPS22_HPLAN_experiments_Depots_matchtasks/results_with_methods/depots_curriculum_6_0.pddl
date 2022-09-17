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

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1640 - SURFACE
      ?auto_1641 - SURFACE
    )
    :vars
    (
      ?auto_1642 - HOIST
      ?auto_1643 - PLACE
      ?auto_1645 - PLACE
      ?auto_1646 - HOIST
      ?auto_1647 - SURFACE
      ?auto_1644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1642 ?auto_1643 ) ( SURFACE-AT ?auto_1640 ?auto_1643 ) ( CLEAR ?auto_1640 ) ( IS-CRATE ?auto_1641 ) ( AVAILABLE ?auto_1642 ) ( not ( = ?auto_1645 ?auto_1643 ) ) ( HOIST-AT ?auto_1646 ?auto_1645 ) ( AVAILABLE ?auto_1646 ) ( SURFACE-AT ?auto_1641 ?auto_1645 ) ( ON ?auto_1641 ?auto_1647 ) ( CLEAR ?auto_1641 ) ( TRUCK-AT ?auto_1644 ?auto_1643 ) ( not ( = ?auto_1640 ?auto_1641 ) ) ( not ( = ?auto_1640 ?auto_1647 ) ) ( not ( = ?auto_1641 ?auto_1647 ) ) ( not ( = ?auto_1642 ?auto_1646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1644 ?auto_1643 ?auto_1645 )
      ( !LIFT ?auto_1646 ?auto_1641 ?auto_1647 ?auto_1645 )
      ( !LOAD ?auto_1646 ?auto_1641 ?auto_1644 ?auto_1645 )
      ( !DRIVE ?auto_1644 ?auto_1645 ?auto_1643 )
      ( !UNLOAD ?auto_1642 ?auto_1641 ?auto_1644 ?auto_1643 )
      ( !DROP ?auto_1642 ?auto_1641 ?auto_1640 ?auto_1643 )
      ( MAKE-1CRATE-VERIFY ?auto_1640 ?auto_1641 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1650 - SURFACE
      ?auto_1651 - SURFACE
    )
    :vars
    (
      ?auto_1652 - HOIST
      ?auto_1653 - PLACE
      ?auto_1655 - PLACE
      ?auto_1656 - HOIST
      ?auto_1657 - SURFACE
      ?auto_1654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1652 ?auto_1653 ) ( SURFACE-AT ?auto_1650 ?auto_1653 ) ( CLEAR ?auto_1650 ) ( IS-CRATE ?auto_1651 ) ( AVAILABLE ?auto_1652 ) ( not ( = ?auto_1655 ?auto_1653 ) ) ( HOIST-AT ?auto_1656 ?auto_1655 ) ( AVAILABLE ?auto_1656 ) ( SURFACE-AT ?auto_1651 ?auto_1655 ) ( ON ?auto_1651 ?auto_1657 ) ( CLEAR ?auto_1651 ) ( TRUCK-AT ?auto_1654 ?auto_1653 ) ( not ( = ?auto_1650 ?auto_1651 ) ) ( not ( = ?auto_1650 ?auto_1657 ) ) ( not ( = ?auto_1651 ?auto_1657 ) ) ( not ( = ?auto_1652 ?auto_1656 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1654 ?auto_1653 ?auto_1655 )
      ( !LIFT ?auto_1656 ?auto_1651 ?auto_1657 ?auto_1655 )
      ( !LOAD ?auto_1656 ?auto_1651 ?auto_1654 ?auto_1655 )
      ( !DRIVE ?auto_1654 ?auto_1655 ?auto_1653 )
      ( !UNLOAD ?auto_1652 ?auto_1651 ?auto_1654 ?auto_1653 )
      ( !DROP ?auto_1652 ?auto_1651 ?auto_1650 ?auto_1653 )
      ( MAKE-1CRATE-VERIFY ?auto_1650 ?auto_1651 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1661 - SURFACE
      ?auto_1662 - SURFACE
      ?auto_1663 - SURFACE
    )
    :vars
    (
      ?auto_1668 - HOIST
      ?auto_1667 - PLACE
      ?auto_1666 - PLACE
      ?auto_1664 - HOIST
      ?auto_1669 - SURFACE
      ?auto_1670 - SURFACE
      ?auto_1665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1668 ?auto_1667 ) ( IS-CRATE ?auto_1663 ) ( not ( = ?auto_1666 ?auto_1667 ) ) ( HOIST-AT ?auto_1664 ?auto_1666 ) ( SURFACE-AT ?auto_1663 ?auto_1666 ) ( ON ?auto_1663 ?auto_1669 ) ( CLEAR ?auto_1663 ) ( not ( = ?auto_1662 ?auto_1663 ) ) ( not ( = ?auto_1662 ?auto_1669 ) ) ( not ( = ?auto_1663 ?auto_1669 ) ) ( not ( = ?auto_1668 ?auto_1664 ) ) ( SURFACE-AT ?auto_1661 ?auto_1667 ) ( CLEAR ?auto_1661 ) ( IS-CRATE ?auto_1662 ) ( AVAILABLE ?auto_1668 ) ( AVAILABLE ?auto_1664 ) ( SURFACE-AT ?auto_1662 ?auto_1666 ) ( ON ?auto_1662 ?auto_1670 ) ( CLEAR ?auto_1662 ) ( TRUCK-AT ?auto_1665 ?auto_1667 ) ( not ( = ?auto_1661 ?auto_1662 ) ) ( not ( = ?auto_1661 ?auto_1670 ) ) ( not ( = ?auto_1662 ?auto_1670 ) ) ( not ( = ?auto_1661 ?auto_1663 ) ) ( not ( = ?auto_1661 ?auto_1669 ) ) ( not ( = ?auto_1663 ?auto_1670 ) ) ( not ( = ?auto_1669 ?auto_1670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1661 ?auto_1662 )
      ( MAKE-1CRATE ?auto_1662 ?auto_1663 )
      ( MAKE-2CRATE-VERIFY ?auto_1661 ?auto_1662 ?auto_1663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1673 - SURFACE
      ?auto_1674 - SURFACE
    )
    :vars
    (
      ?auto_1675 - HOIST
      ?auto_1676 - PLACE
      ?auto_1678 - PLACE
      ?auto_1679 - HOIST
      ?auto_1680 - SURFACE
      ?auto_1677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1675 ?auto_1676 ) ( SURFACE-AT ?auto_1673 ?auto_1676 ) ( CLEAR ?auto_1673 ) ( IS-CRATE ?auto_1674 ) ( AVAILABLE ?auto_1675 ) ( not ( = ?auto_1678 ?auto_1676 ) ) ( HOIST-AT ?auto_1679 ?auto_1678 ) ( AVAILABLE ?auto_1679 ) ( SURFACE-AT ?auto_1674 ?auto_1678 ) ( ON ?auto_1674 ?auto_1680 ) ( CLEAR ?auto_1674 ) ( TRUCK-AT ?auto_1677 ?auto_1676 ) ( not ( = ?auto_1673 ?auto_1674 ) ) ( not ( = ?auto_1673 ?auto_1680 ) ) ( not ( = ?auto_1674 ?auto_1680 ) ) ( not ( = ?auto_1675 ?auto_1679 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1677 ?auto_1676 ?auto_1678 )
      ( !LIFT ?auto_1679 ?auto_1674 ?auto_1680 ?auto_1678 )
      ( !LOAD ?auto_1679 ?auto_1674 ?auto_1677 ?auto_1678 )
      ( !DRIVE ?auto_1677 ?auto_1678 ?auto_1676 )
      ( !UNLOAD ?auto_1675 ?auto_1674 ?auto_1677 ?auto_1676 )
      ( !DROP ?auto_1675 ?auto_1674 ?auto_1673 ?auto_1676 )
      ( MAKE-1CRATE-VERIFY ?auto_1673 ?auto_1674 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1685 - SURFACE
      ?auto_1686 - SURFACE
      ?auto_1687 - SURFACE
      ?auto_1688 - SURFACE
    )
    :vars
    (
      ?auto_1693 - HOIST
      ?auto_1689 - PLACE
      ?auto_1694 - PLACE
      ?auto_1690 - HOIST
      ?auto_1692 - SURFACE
      ?auto_1697 - PLACE
      ?auto_1698 - HOIST
      ?auto_1695 - SURFACE
      ?auto_1696 - SURFACE
      ?auto_1691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1693 ?auto_1689 ) ( IS-CRATE ?auto_1688 ) ( not ( = ?auto_1694 ?auto_1689 ) ) ( HOIST-AT ?auto_1690 ?auto_1694 ) ( AVAILABLE ?auto_1690 ) ( SURFACE-AT ?auto_1688 ?auto_1694 ) ( ON ?auto_1688 ?auto_1692 ) ( CLEAR ?auto_1688 ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( not ( = ?auto_1687 ?auto_1692 ) ) ( not ( = ?auto_1688 ?auto_1692 ) ) ( not ( = ?auto_1693 ?auto_1690 ) ) ( IS-CRATE ?auto_1687 ) ( not ( = ?auto_1697 ?auto_1689 ) ) ( HOIST-AT ?auto_1698 ?auto_1697 ) ( SURFACE-AT ?auto_1687 ?auto_1697 ) ( ON ?auto_1687 ?auto_1695 ) ( CLEAR ?auto_1687 ) ( not ( = ?auto_1686 ?auto_1687 ) ) ( not ( = ?auto_1686 ?auto_1695 ) ) ( not ( = ?auto_1687 ?auto_1695 ) ) ( not ( = ?auto_1693 ?auto_1698 ) ) ( SURFACE-AT ?auto_1685 ?auto_1689 ) ( CLEAR ?auto_1685 ) ( IS-CRATE ?auto_1686 ) ( AVAILABLE ?auto_1693 ) ( AVAILABLE ?auto_1698 ) ( SURFACE-AT ?auto_1686 ?auto_1697 ) ( ON ?auto_1686 ?auto_1696 ) ( CLEAR ?auto_1686 ) ( TRUCK-AT ?auto_1691 ?auto_1689 ) ( not ( = ?auto_1685 ?auto_1686 ) ) ( not ( = ?auto_1685 ?auto_1696 ) ) ( not ( = ?auto_1686 ?auto_1696 ) ) ( not ( = ?auto_1685 ?auto_1687 ) ) ( not ( = ?auto_1685 ?auto_1695 ) ) ( not ( = ?auto_1687 ?auto_1696 ) ) ( not ( = ?auto_1695 ?auto_1696 ) ) ( not ( = ?auto_1685 ?auto_1688 ) ) ( not ( = ?auto_1685 ?auto_1692 ) ) ( not ( = ?auto_1686 ?auto_1688 ) ) ( not ( = ?auto_1686 ?auto_1692 ) ) ( not ( = ?auto_1688 ?auto_1695 ) ) ( not ( = ?auto_1688 ?auto_1696 ) ) ( not ( = ?auto_1694 ?auto_1697 ) ) ( not ( = ?auto_1690 ?auto_1698 ) ) ( not ( = ?auto_1692 ?auto_1695 ) ) ( not ( = ?auto_1692 ?auto_1696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1685 ?auto_1686 ?auto_1687 )
      ( MAKE-1CRATE ?auto_1687 ?auto_1688 )
      ( MAKE-3CRATE-VERIFY ?auto_1685 ?auto_1686 ?auto_1687 ?auto_1688 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1701 - SURFACE
      ?auto_1702 - SURFACE
    )
    :vars
    (
      ?auto_1703 - HOIST
      ?auto_1704 - PLACE
      ?auto_1706 - PLACE
      ?auto_1707 - HOIST
      ?auto_1708 - SURFACE
      ?auto_1705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1703 ?auto_1704 ) ( SURFACE-AT ?auto_1701 ?auto_1704 ) ( CLEAR ?auto_1701 ) ( IS-CRATE ?auto_1702 ) ( AVAILABLE ?auto_1703 ) ( not ( = ?auto_1706 ?auto_1704 ) ) ( HOIST-AT ?auto_1707 ?auto_1706 ) ( AVAILABLE ?auto_1707 ) ( SURFACE-AT ?auto_1702 ?auto_1706 ) ( ON ?auto_1702 ?auto_1708 ) ( CLEAR ?auto_1702 ) ( TRUCK-AT ?auto_1705 ?auto_1704 ) ( not ( = ?auto_1701 ?auto_1702 ) ) ( not ( = ?auto_1701 ?auto_1708 ) ) ( not ( = ?auto_1702 ?auto_1708 ) ) ( not ( = ?auto_1703 ?auto_1707 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1705 ?auto_1704 ?auto_1706 )
      ( !LIFT ?auto_1707 ?auto_1702 ?auto_1708 ?auto_1706 )
      ( !LOAD ?auto_1707 ?auto_1702 ?auto_1705 ?auto_1706 )
      ( !DRIVE ?auto_1705 ?auto_1706 ?auto_1704 )
      ( !UNLOAD ?auto_1703 ?auto_1702 ?auto_1705 ?auto_1704 )
      ( !DROP ?auto_1703 ?auto_1702 ?auto_1701 ?auto_1704 )
      ( MAKE-1CRATE-VERIFY ?auto_1701 ?auto_1702 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1714 - SURFACE
      ?auto_1715 - SURFACE
      ?auto_1716 - SURFACE
      ?auto_1717 - SURFACE
      ?auto_1718 - SURFACE
    )
    :vars
    (
      ?auto_1724 - HOIST
      ?auto_1721 - PLACE
      ?auto_1722 - PLACE
      ?auto_1720 - HOIST
      ?auto_1719 - SURFACE
      ?auto_1728 - PLACE
      ?auto_1729 - HOIST
      ?auto_1727 - SURFACE
      ?auto_1726 - PLACE
      ?auto_1725 - HOIST
      ?auto_1730 - SURFACE
      ?auto_1731 - SURFACE
      ?auto_1723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1724 ?auto_1721 ) ( IS-CRATE ?auto_1718 ) ( not ( = ?auto_1722 ?auto_1721 ) ) ( HOIST-AT ?auto_1720 ?auto_1722 ) ( AVAILABLE ?auto_1720 ) ( SURFACE-AT ?auto_1718 ?auto_1722 ) ( ON ?auto_1718 ?auto_1719 ) ( CLEAR ?auto_1718 ) ( not ( = ?auto_1717 ?auto_1718 ) ) ( not ( = ?auto_1717 ?auto_1719 ) ) ( not ( = ?auto_1718 ?auto_1719 ) ) ( not ( = ?auto_1724 ?auto_1720 ) ) ( IS-CRATE ?auto_1717 ) ( not ( = ?auto_1728 ?auto_1721 ) ) ( HOIST-AT ?auto_1729 ?auto_1728 ) ( AVAILABLE ?auto_1729 ) ( SURFACE-AT ?auto_1717 ?auto_1728 ) ( ON ?auto_1717 ?auto_1727 ) ( CLEAR ?auto_1717 ) ( not ( = ?auto_1716 ?auto_1717 ) ) ( not ( = ?auto_1716 ?auto_1727 ) ) ( not ( = ?auto_1717 ?auto_1727 ) ) ( not ( = ?auto_1724 ?auto_1729 ) ) ( IS-CRATE ?auto_1716 ) ( not ( = ?auto_1726 ?auto_1721 ) ) ( HOIST-AT ?auto_1725 ?auto_1726 ) ( SURFACE-AT ?auto_1716 ?auto_1726 ) ( ON ?auto_1716 ?auto_1730 ) ( CLEAR ?auto_1716 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1715 ?auto_1730 ) ) ( not ( = ?auto_1716 ?auto_1730 ) ) ( not ( = ?auto_1724 ?auto_1725 ) ) ( SURFACE-AT ?auto_1714 ?auto_1721 ) ( CLEAR ?auto_1714 ) ( IS-CRATE ?auto_1715 ) ( AVAILABLE ?auto_1724 ) ( AVAILABLE ?auto_1725 ) ( SURFACE-AT ?auto_1715 ?auto_1726 ) ( ON ?auto_1715 ?auto_1731 ) ( CLEAR ?auto_1715 ) ( TRUCK-AT ?auto_1723 ?auto_1721 ) ( not ( = ?auto_1714 ?auto_1715 ) ) ( not ( = ?auto_1714 ?auto_1731 ) ) ( not ( = ?auto_1715 ?auto_1731 ) ) ( not ( = ?auto_1714 ?auto_1716 ) ) ( not ( = ?auto_1714 ?auto_1730 ) ) ( not ( = ?auto_1716 ?auto_1731 ) ) ( not ( = ?auto_1730 ?auto_1731 ) ) ( not ( = ?auto_1714 ?auto_1717 ) ) ( not ( = ?auto_1714 ?auto_1727 ) ) ( not ( = ?auto_1715 ?auto_1717 ) ) ( not ( = ?auto_1715 ?auto_1727 ) ) ( not ( = ?auto_1717 ?auto_1730 ) ) ( not ( = ?auto_1717 ?auto_1731 ) ) ( not ( = ?auto_1728 ?auto_1726 ) ) ( not ( = ?auto_1729 ?auto_1725 ) ) ( not ( = ?auto_1727 ?auto_1730 ) ) ( not ( = ?auto_1727 ?auto_1731 ) ) ( not ( = ?auto_1714 ?auto_1718 ) ) ( not ( = ?auto_1714 ?auto_1719 ) ) ( not ( = ?auto_1715 ?auto_1718 ) ) ( not ( = ?auto_1715 ?auto_1719 ) ) ( not ( = ?auto_1716 ?auto_1718 ) ) ( not ( = ?auto_1716 ?auto_1719 ) ) ( not ( = ?auto_1718 ?auto_1727 ) ) ( not ( = ?auto_1718 ?auto_1730 ) ) ( not ( = ?auto_1718 ?auto_1731 ) ) ( not ( = ?auto_1722 ?auto_1728 ) ) ( not ( = ?auto_1722 ?auto_1726 ) ) ( not ( = ?auto_1720 ?auto_1729 ) ) ( not ( = ?auto_1720 ?auto_1725 ) ) ( not ( = ?auto_1719 ?auto_1727 ) ) ( not ( = ?auto_1719 ?auto_1730 ) ) ( not ( = ?auto_1719 ?auto_1731 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1714 ?auto_1715 ?auto_1716 ?auto_1717 )
      ( MAKE-1CRATE ?auto_1717 ?auto_1718 )
      ( MAKE-4CRATE-VERIFY ?auto_1714 ?auto_1715 ?auto_1716 ?auto_1717 ?auto_1718 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1734 - SURFACE
      ?auto_1735 - SURFACE
    )
    :vars
    (
      ?auto_1736 - HOIST
      ?auto_1737 - PLACE
      ?auto_1739 - PLACE
      ?auto_1740 - HOIST
      ?auto_1741 - SURFACE
      ?auto_1738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1736 ?auto_1737 ) ( SURFACE-AT ?auto_1734 ?auto_1737 ) ( CLEAR ?auto_1734 ) ( IS-CRATE ?auto_1735 ) ( AVAILABLE ?auto_1736 ) ( not ( = ?auto_1739 ?auto_1737 ) ) ( HOIST-AT ?auto_1740 ?auto_1739 ) ( AVAILABLE ?auto_1740 ) ( SURFACE-AT ?auto_1735 ?auto_1739 ) ( ON ?auto_1735 ?auto_1741 ) ( CLEAR ?auto_1735 ) ( TRUCK-AT ?auto_1738 ?auto_1737 ) ( not ( = ?auto_1734 ?auto_1735 ) ) ( not ( = ?auto_1734 ?auto_1741 ) ) ( not ( = ?auto_1735 ?auto_1741 ) ) ( not ( = ?auto_1736 ?auto_1740 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1738 ?auto_1737 ?auto_1739 )
      ( !LIFT ?auto_1740 ?auto_1735 ?auto_1741 ?auto_1739 )
      ( !LOAD ?auto_1740 ?auto_1735 ?auto_1738 ?auto_1739 )
      ( !DRIVE ?auto_1738 ?auto_1739 ?auto_1737 )
      ( !UNLOAD ?auto_1736 ?auto_1735 ?auto_1738 ?auto_1737 )
      ( !DROP ?auto_1736 ?auto_1735 ?auto_1734 ?auto_1737 )
      ( MAKE-1CRATE-VERIFY ?auto_1734 ?auto_1735 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1748 - SURFACE
      ?auto_1749 - SURFACE
      ?auto_1750 - SURFACE
      ?auto_1751 - SURFACE
      ?auto_1752 - SURFACE
      ?auto_1753 - SURFACE
    )
    :vars
    (
      ?auto_1754 - HOIST
      ?auto_1757 - PLACE
      ?auto_1758 - PLACE
      ?auto_1756 - HOIST
      ?auto_1755 - SURFACE
      ?auto_1769 - PLACE
      ?auto_1762 - HOIST
      ?auto_1761 - SURFACE
      ?auto_1763 - PLACE
      ?auto_1760 - HOIST
      ?auto_1767 - SURFACE
      ?auto_1768 - PLACE
      ?auto_1766 - HOIST
      ?auto_1764 - SURFACE
      ?auto_1765 - SURFACE
      ?auto_1759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754 ?auto_1757 ) ( IS-CRATE ?auto_1753 ) ( not ( = ?auto_1758 ?auto_1757 ) ) ( HOIST-AT ?auto_1756 ?auto_1758 ) ( AVAILABLE ?auto_1756 ) ( SURFACE-AT ?auto_1753 ?auto_1758 ) ( ON ?auto_1753 ?auto_1755 ) ( CLEAR ?auto_1753 ) ( not ( = ?auto_1752 ?auto_1753 ) ) ( not ( = ?auto_1752 ?auto_1755 ) ) ( not ( = ?auto_1753 ?auto_1755 ) ) ( not ( = ?auto_1754 ?auto_1756 ) ) ( IS-CRATE ?auto_1752 ) ( not ( = ?auto_1769 ?auto_1757 ) ) ( HOIST-AT ?auto_1762 ?auto_1769 ) ( AVAILABLE ?auto_1762 ) ( SURFACE-AT ?auto_1752 ?auto_1769 ) ( ON ?auto_1752 ?auto_1761 ) ( CLEAR ?auto_1752 ) ( not ( = ?auto_1751 ?auto_1752 ) ) ( not ( = ?auto_1751 ?auto_1761 ) ) ( not ( = ?auto_1752 ?auto_1761 ) ) ( not ( = ?auto_1754 ?auto_1762 ) ) ( IS-CRATE ?auto_1751 ) ( not ( = ?auto_1763 ?auto_1757 ) ) ( HOIST-AT ?auto_1760 ?auto_1763 ) ( AVAILABLE ?auto_1760 ) ( SURFACE-AT ?auto_1751 ?auto_1763 ) ( ON ?auto_1751 ?auto_1767 ) ( CLEAR ?auto_1751 ) ( not ( = ?auto_1750 ?auto_1751 ) ) ( not ( = ?auto_1750 ?auto_1767 ) ) ( not ( = ?auto_1751 ?auto_1767 ) ) ( not ( = ?auto_1754 ?auto_1760 ) ) ( IS-CRATE ?auto_1750 ) ( not ( = ?auto_1768 ?auto_1757 ) ) ( HOIST-AT ?auto_1766 ?auto_1768 ) ( SURFACE-AT ?auto_1750 ?auto_1768 ) ( ON ?auto_1750 ?auto_1764 ) ( CLEAR ?auto_1750 ) ( not ( = ?auto_1749 ?auto_1750 ) ) ( not ( = ?auto_1749 ?auto_1764 ) ) ( not ( = ?auto_1750 ?auto_1764 ) ) ( not ( = ?auto_1754 ?auto_1766 ) ) ( SURFACE-AT ?auto_1748 ?auto_1757 ) ( CLEAR ?auto_1748 ) ( IS-CRATE ?auto_1749 ) ( AVAILABLE ?auto_1754 ) ( AVAILABLE ?auto_1766 ) ( SURFACE-AT ?auto_1749 ?auto_1768 ) ( ON ?auto_1749 ?auto_1765 ) ( CLEAR ?auto_1749 ) ( TRUCK-AT ?auto_1759 ?auto_1757 ) ( not ( = ?auto_1748 ?auto_1749 ) ) ( not ( = ?auto_1748 ?auto_1765 ) ) ( not ( = ?auto_1749 ?auto_1765 ) ) ( not ( = ?auto_1748 ?auto_1750 ) ) ( not ( = ?auto_1748 ?auto_1764 ) ) ( not ( = ?auto_1750 ?auto_1765 ) ) ( not ( = ?auto_1764 ?auto_1765 ) ) ( not ( = ?auto_1748 ?auto_1751 ) ) ( not ( = ?auto_1748 ?auto_1767 ) ) ( not ( = ?auto_1749 ?auto_1751 ) ) ( not ( = ?auto_1749 ?auto_1767 ) ) ( not ( = ?auto_1751 ?auto_1764 ) ) ( not ( = ?auto_1751 ?auto_1765 ) ) ( not ( = ?auto_1763 ?auto_1768 ) ) ( not ( = ?auto_1760 ?auto_1766 ) ) ( not ( = ?auto_1767 ?auto_1764 ) ) ( not ( = ?auto_1767 ?auto_1765 ) ) ( not ( = ?auto_1748 ?auto_1752 ) ) ( not ( = ?auto_1748 ?auto_1761 ) ) ( not ( = ?auto_1749 ?auto_1752 ) ) ( not ( = ?auto_1749 ?auto_1761 ) ) ( not ( = ?auto_1750 ?auto_1752 ) ) ( not ( = ?auto_1750 ?auto_1761 ) ) ( not ( = ?auto_1752 ?auto_1767 ) ) ( not ( = ?auto_1752 ?auto_1764 ) ) ( not ( = ?auto_1752 ?auto_1765 ) ) ( not ( = ?auto_1769 ?auto_1763 ) ) ( not ( = ?auto_1769 ?auto_1768 ) ) ( not ( = ?auto_1762 ?auto_1760 ) ) ( not ( = ?auto_1762 ?auto_1766 ) ) ( not ( = ?auto_1761 ?auto_1767 ) ) ( not ( = ?auto_1761 ?auto_1764 ) ) ( not ( = ?auto_1761 ?auto_1765 ) ) ( not ( = ?auto_1748 ?auto_1753 ) ) ( not ( = ?auto_1748 ?auto_1755 ) ) ( not ( = ?auto_1749 ?auto_1753 ) ) ( not ( = ?auto_1749 ?auto_1755 ) ) ( not ( = ?auto_1750 ?auto_1753 ) ) ( not ( = ?auto_1750 ?auto_1755 ) ) ( not ( = ?auto_1751 ?auto_1753 ) ) ( not ( = ?auto_1751 ?auto_1755 ) ) ( not ( = ?auto_1753 ?auto_1761 ) ) ( not ( = ?auto_1753 ?auto_1767 ) ) ( not ( = ?auto_1753 ?auto_1764 ) ) ( not ( = ?auto_1753 ?auto_1765 ) ) ( not ( = ?auto_1758 ?auto_1769 ) ) ( not ( = ?auto_1758 ?auto_1763 ) ) ( not ( = ?auto_1758 ?auto_1768 ) ) ( not ( = ?auto_1756 ?auto_1762 ) ) ( not ( = ?auto_1756 ?auto_1760 ) ) ( not ( = ?auto_1756 ?auto_1766 ) ) ( not ( = ?auto_1755 ?auto_1761 ) ) ( not ( = ?auto_1755 ?auto_1767 ) ) ( not ( = ?auto_1755 ?auto_1764 ) ) ( not ( = ?auto_1755 ?auto_1765 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1748 ?auto_1749 ?auto_1750 ?auto_1751 ?auto_1752 )
      ( MAKE-1CRATE ?auto_1752 ?auto_1753 )
      ( MAKE-5CRATE-VERIFY ?auto_1748 ?auto_1749 ?auto_1750 ?auto_1751 ?auto_1752 ?auto_1753 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1772 - SURFACE
      ?auto_1773 - SURFACE
    )
    :vars
    (
      ?auto_1774 - HOIST
      ?auto_1775 - PLACE
      ?auto_1777 - PLACE
      ?auto_1778 - HOIST
      ?auto_1779 - SURFACE
      ?auto_1776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1774 ?auto_1775 ) ( SURFACE-AT ?auto_1772 ?auto_1775 ) ( CLEAR ?auto_1772 ) ( IS-CRATE ?auto_1773 ) ( AVAILABLE ?auto_1774 ) ( not ( = ?auto_1777 ?auto_1775 ) ) ( HOIST-AT ?auto_1778 ?auto_1777 ) ( AVAILABLE ?auto_1778 ) ( SURFACE-AT ?auto_1773 ?auto_1777 ) ( ON ?auto_1773 ?auto_1779 ) ( CLEAR ?auto_1773 ) ( TRUCK-AT ?auto_1776 ?auto_1775 ) ( not ( = ?auto_1772 ?auto_1773 ) ) ( not ( = ?auto_1772 ?auto_1779 ) ) ( not ( = ?auto_1773 ?auto_1779 ) ) ( not ( = ?auto_1774 ?auto_1778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1776 ?auto_1775 ?auto_1777 )
      ( !LIFT ?auto_1778 ?auto_1773 ?auto_1779 ?auto_1777 )
      ( !LOAD ?auto_1778 ?auto_1773 ?auto_1776 ?auto_1777 )
      ( !DRIVE ?auto_1776 ?auto_1777 ?auto_1775 )
      ( !UNLOAD ?auto_1774 ?auto_1773 ?auto_1776 ?auto_1775 )
      ( !DROP ?auto_1774 ?auto_1773 ?auto_1772 ?auto_1775 )
      ( MAKE-1CRATE-VERIFY ?auto_1772 ?auto_1773 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1787 - SURFACE
      ?auto_1788 - SURFACE
      ?auto_1789 - SURFACE
      ?auto_1790 - SURFACE
      ?auto_1791 - SURFACE
      ?auto_1793 - SURFACE
      ?auto_1792 - SURFACE
    )
    :vars
    (
      ?auto_1799 - HOIST
      ?auto_1798 - PLACE
      ?auto_1796 - PLACE
      ?auto_1794 - HOIST
      ?auto_1795 - SURFACE
      ?auto_1801 - PLACE
      ?auto_1806 - HOIST
      ?auto_1811 - SURFACE
      ?auto_1812 - PLACE
      ?auto_1804 - HOIST
      ?auto_1802 - SURFACE
      ?auto_1805 - PLACE
      ?auto_1800 - HOIST
      ?auto_1808 - SURFACE
      ?auto_1803 - PLACE
      ?auto_1810 - HOIST
      ?auto_1807 - SURFACE
      ?auto_1809 - SURFACE
      ?auto_1797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1799 ?auto_1798 ) ( IS-CRATE ?auto_1792 ) ( not ( = ?auto_1796 ?auto_1798 ) ) ( HOIST-AT ?auto_1794 ?auto_1796 ) ( AVAILABLE ?auto_1794 ) ( SURFACE-AT ?auto_1792 ?auto_1796 ) ( ON ?auto_1792 ?auto_1795 ) ( CLEAR ?auto_1792 ) ( not ( = ?auto_1793 ?auto_1792 ) ) ( not ( = ?auto_1793 ?auto_1795 ) ) ( not ( = ?auto_1792 ?auto_1795 ) ) ( not ( = ?auto_1799 ?auto_1794 ) ) ( IS-CRATE ?auto_1793 ) ( not ( = ?auto_1801 ?auto_1798 ) ) ( HOIST-AT ?auto_1806 ?auto_1801 ) ( AVAILABLE ?auto_1806 ) ( SURFACE-AT ?auto_1793 ?auto_1801 ) ( ON ?auto_1793 ?auto_1811 ) ( CLEAR ?auto_1793 ) ( not ( = ?auto_1791 ?auto_1793 ) ) ( not ( = ?auto_1791 ?auto_1811 ) ) ( not ( = ?auto_1793 ?auto_1811 ) ) ( not ( = ?auto_1799 ?auto_1806 ) ) ( IS-CRATE ?auto_1791 ) ( not ( = ?auto_1812 ?auto_1798 ) ) ( HOIST-AT ?auto_1804 ?auto_1812 ) ( AVAILABLE ?auto_1804 ) ( SURFACE-AT ?auto_1791 ?auto_1812 ) ( ON ?auto_1791 ?auto_1802 ) ( CLEAR ?auto_1791 ) ( not ( = ?auto_1790 ?auto_1791 ) ) ( not ( = ?auto_1790 ?auto_1802 ) ) ( not ( = ?auto_1791 ?auto_1802 ) ) ( not ( = ?auto_1799 ?auto_1804 ) ) ( IS-CRATE ?auto_1790 ) ( not ( = ?auto_1805 ?auto_1798 ) ) ( HOIST-AT ?auto_1800 ?auto_1805 ) ( AVAILABLE ?auto_1800 ) ( SURFACE-AT ?auto_1790 ?auto_1805 ) ( ON ?auto_1790 ?auto_1808 ) ( CLEAR ?auto_1790 ) ( not ( = ?auto_1789 ?auto_1790 ) ) ( not ( = ?auto_1789 ?auto_1808 ) ) ( not ( = ?auto_1790 ?auto_1808 ) ) ( not ( = ?auto_1799 ?auto_1800 ) ) ( IS-CRATE ?auto_1789 ) ( not ( = ?auto_1803 ?auto_1798 ) ) ( HOIST-AT ?auto_1810 ?auto_1803 ) ( SURFACE-AT ?auto_1789 ?auto_1803 ) ( ON ?auto_1789 ?auto_1807 ) ( CLEAR ?auto_1789 ) ( not ( = ?auto_1788 ?auto_1789 ) ) ( not ( = ?auto_1788 ?auto_1807 ) ) ( not ( = ?auto_1789 ?auto_1807 ) ) ( not ( = ?auto_1799 ?auto_1810 ) ) ( SURFACE-AT ?auto_1787 ?auto_1798 ) ( CLEAR ?auto_1787 ) ( IS-CRATE ?auto_1788 ) ( AVAILABLE ?auto_1799 ) ( AVAILABLE ?auto_1810 ) ( SURFACE-AT ?auto_1788 ?auto_1803 ) ( ON ?auto_1788 ?auto_1809 ) ( CLEAR ?auto_1788 ) ( TRUCK-AT ?auto_1797 ?auto_1798 ) ( not ( = ?auto_1787 ?auto_1788 ) ) ( not ( = ?auto_1787 ?auto_1809 ) ) ( not ( = ?auto_1788 ?auto_1809 ) ) ( not ( = ?auto_1787 ?auto_1789 ) ) ( not ( = ?auto_1787 ?auto_1807 ) ) ( not ( = ?auto_1789 ?auto_1809 ) ) ( not ( = ?auto_1807 ?auto_1809 ) ) ( not ( = ?auto_1787 ?auto_1790 ) ) ( not ( = ?auto_1787 ?auto_1808 ) ) ( not ( = ?auto_1788 ?auto_1790 ) ) ( not ( = ?auto_1788 ?auto_1808 ) ) ( not ( = ?auto_1790 ?auto_1807 ) ) ( not ( = ?auto_1790 ?auto_1809 ) ) ( not ( = ?auto_1805 ?auto_1803 ) ) ( not ( = ?auto_1800 ?auto_1810 ) ) ( not ( = ?auto_1808 ?auto_1807 ) ) ( not ( = ?auto_1808 ?auto_1809 ) ) ( not ( = ?auto_1787 ?auto_1791 ) ) ( not ( = ?auto_1787 ?auto_1802 ) ) ( not ( = ?auto_1788 ?auto_1791 ) ) ( not ( = ?auto_1788 ?auto_1802 ) ) ( not ( = ?auto_1789 ?auto_1791 ) ) ( not ( = ?auto_1789 ?auto_1802 ) ) ( not ( = ?auto_1791 ?auto_1808 ) ) ( not ( = ?auto_1791 ?auto_1807 ) ) ( not ( = ?auto_1791 ?auto_1809 ) ) ( not ( = ?auto_1812 ?auto_1805 ) ) ( not ( = ?auto_1812 ?auto_1803 ) ) ( not ( = ?auto_1804 ?auto_1800 ) ) ( not ( = ?auto_1804 ?auto_1810 ) ) ( not ( = ?auto_1802 ?auto_1808 ) ) ( not ( = ?auto_1802 ?auto_1807 ) ) ( not ( = ?auto_1802 ?auto_1809 ) ) ( not ( = ?auto_1787 ?auto_1793 ) ) ( not ( = ?auto_1787 ?auto_1811 ) ) ( not ( = ?auto_1788 ?auto_1793 ) ) ( not ( = ?auto_1788 ?auto_1811 ) ) ( not ( = ?auto_1789 ?auto_1793 ) ) ( not ( = ?auto_1789 ?auto_1811 ) ) ( not ( = ?auto_1790 ?auto_1793 ) ) ( not ( = ?auto_1790 ?auto_1811 ) ) ( not ( = ?auto_1793 ?auto_1802 ) ) ( not ( = ?auto_1793 ?auto_1808 ) ) ( not ( = ?auto_1793 ?auto_1807 ) ) ( not ( = ?auto_1793 ?auto_1809 ) ) ( not ( = ?auto_1801 ?auto_1812 ) ) ( not ( = ?auto_1801 ?auto_1805 ) ) ( not ( = ?auto_1801 ?auto_1803 ) ) ( not ( = ?auto_1806 ?auto_1804 ) ) ( not ( = ?auto_1806 ?auto_1800 ) ) ( not ( = ?auto_1806 ?auto_1810 ) ) ( not ( = ?auto_1811 ?auto_1802 ) ) ( not ( = ?auto_1811 ?auto_1808 ) ) ( not ( = ?auto_1811 ?auto_1807 ) ) ( not ( = ?auto_1811 ?auto_1809 ) ) ( not ( = ?auto_1787 ?auto_1792 ) ) ( not ( = ?auto_1787 ?auto_1795 ) ) ( not ( = ?auto_1788 ?auto_1792 ) ) ( not ( = ?auto_1788 ?auto_1795 ) ) ( not ( = ?auto_1789 ?auto_1792 ) ) ( not ( = ?auto_1789 ?auto_1795 ) ) ( not ( = ?auto_1790 ?auto_1792 ) ) ( not ( = ?auto_1790 ?auto_1795 ) ) ( not ( = ?auto_1791 ?auto_1792 ) ) ( not ( = ?auto_1791 ?auto_1795 ) ) ( not ( = ?auto_1792 ?auto_1811 ) ) ( not ( = ?auto_1792 ?auto_1802 ) ) ( not ( = ?auto_1792 ?auto_1808 ) ) ( not ( = ?auto_1792 ?auto_1807 ) ) ( not ( = ?auto_1792 ?auto_1809 ) ) ( not ( = ?auto_1796 ?auto_1801 ) ) ( not ( = ?auto_1796 ?auto_1812 ) ) ( not ( = ?auto_1796 ?auto_1805 ) ) ( not ( = ?auto_1796 ?auto_1803 ) ) ( not ( = ?auto_1794 ?auto_1806 ) ) ( not ( = ?auto_1794 ?auto_1804 ) ) ( not ( = ?auto_1794 ?auto_1800 ) ) ( not ( = ?auto_1794 ?auto_1810 ) ) ( not ( = ?auto_1795 ?auto_1811 ) ) ( not ( = ?auto_1795 ?auto_1802 ) ) ( not ( = ?auto_1795 ?auto_1808 ) ) ( not ( = ?auto_1795 ?auto_1807 ) ) ( not ( = ?auto_1795 ?auto_1809 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1787 ?auto_1788 ?auto_1789 ?auto_1790 ?auto_1791 ?auto_1793 )
      ( MAKE-1CRATE ?auto_1793 ?auto_1792 )
      ( MAKE-6CRATE-VERIFY ?auto_1787 ?auto_1788 ?auto_1789 ?auto_1790 ?auto_1791 ?auto_1793 ?auto_1792 ) )
  )

)

