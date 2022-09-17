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
      ?auto_1672 - SURFACE
      ?auto_1673 - SURFACE
    )
    :vars
    (
      ?auto_1674 - HOIST
      ?auto_1675 - PLACE
      ?auto_1677 - PLACE
      ?auto_1678 - HOIST
      ?auto_1679 - SURFACE
      ?auto_1676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1674 ?auto_1675 ) ( SURFACE-AT ?auto_1673 ?auto_1675 ) ( CLEAR ?auto_1673 ) ( IS-CRATE ?auto_1672 ) ( AVAILABLE ?auto_1674 ) ( not ( = ?auto_1677 ?auto_1675 ) ) ( HOIST-AT ?auto_1678 ?auto_1677 ) ( AVAILABLE ?auto_1678 ) ( SURFACE-AT ?auto_1672 ?auto_1677 ) ( ON ?auto_1672 ?auto_1679 ) ( CLEAR ?auto_1672 ) ( TRUCK-AT ?auto_1676 ?auto_1675 ) ( not ( = ?auto_1672 ?auto_1673 ) ) ( not ( = ?auto_1672 ?auto_1679 ) ) ( not ( = ?auto_1673 ?auto_1679 ) ) ( not ( = ?auto_1674 ?auto_1678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1676 ?auto_1675 ?auto_1677 )
      ( !LIFT ?auto_1678 ?auto_1672 ?auto_1679 ?auto_1677 )
      ( !LOAD ?auto_1678 ?auto_1672 ?auto_1676 ?auto_1677 )
      ( !DRIVE ?auto_1676 ?auto_1677 ?auto_1675 )
      ( !UNLOAD ?auto_1674 ?auto_1672 ?auto_1676 ?auto_1675 )
      ( !DROP ?auto_1674 ?auto_1672 ?auto_1673 ?auto_1675 )
      ( MAKE-ON-VERIFY ?auto_1672 ?auto_1673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1682 - SURFACE
      ?auto_1683 - SURFACE
    )
    :vars
    (
      ?auto_1684 - HOIST
      ?auto_1685 - PLACE
      ?auto_1687 - PLACE
      ?auto_1688 - HOIST
      ?auto_1689 - SURFACE
      ?auto_1686 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1684 ?auto_1685 ) ( SURFACE-AT ?auto_1683 ?auto_1685 ) ( CLEAR ?auto_1683 ) ( IS-CRATE ?auto_1682 ) ( AVAILABLE ?auto_1684 ) ( not ( = ?auto_1687 ?auto_1685 ) ) ( HOIST-AT ?auto_1688 ?auto_1687 ) ( AVAILABLE ?auto_1688 ) ( SURFACE-AT ?auto_1682 ?auto_1687 ) ( ON ?auto_1682 ?auto_1689 ) ( CLEAR ?auto_1682 ) ( TRUCK-AT ?auto_1686 ?auto_1685 ) ( not ( = ?auto_1682 ?auto_1683 ) ) ( not ( = ?auto_1682 ?auto_1689 ) ) ( not ( = ?auto_1683 ?auto_1689 ) ) ( not ( = ?auto_1684 ?auto_1688 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1686 ?auto_1685 ?auto_1687 )
      ( !LIFT ?auto_1688 ?auto_1682 ?auto_1689 ?auto_1687 )
      ( !LOAD ?auto_1688 ?auto_1682 ?auto_1686 ?auto_1687 )
      ( !DRIVE ?auto_1686 ?auto_1687 ?auto_1685 )
      ( !UNLOAD ?auto_1684 ?auto_1682 ?auto_1686 ?auto_1685 )
      ( !DROP ?auto_1684 ?auto_1682 ?auto_1683 ?auto_1685 )
      ( MAKE-ON-VERIFY ?auto_1682 ?auto_1683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1692 - SURFACE
      ?auto_1693 - SURFACE
    )
    :vars
    (
      ?auto_1694 - HOIST
      ?auto_1695 - PLACE
      ?auto_1697 - PLACE
      ?auto_1698 - HOIST
      ?auto_1699 - SURFACE
      ?auto_1696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1694 ?auto_1695 ) ( SURFACE-AT ?auto_1693 ?auto_1695 ) ( CLEAR ?auto_1693 ) ( IS-CRATE ?auto_1692 ) ( AVAILABLE ?auto_1694 ) ( not ( = ?auto_1697 ?auto_1695 ) ) ( HOIST-AT ?auto_1698 ?auto_1697 ) ( AVAILABLE ?auto_1698 ) ( SURFACE-AT ?auto_1692 ?auto_1697 ) ( ON ?auto_1692 ?auto_1699 ) ( CLEAR ?auto_1692 ) ( TRUCK-AT ?auto_1696 ?auto_1695 ) ( not ( = ?auto_1692 ?auto_1693 ) ) ( not ( = ?auto_1692 ?auto_1699 ) ) ( not ( = ?auto_1693 ?auto_1699 ) ) ( not ( = ?auto_1694 ?auto_1698 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1696 ?auto_1695 ?auto_1697 )
      ( !LIFT ?auto_1698 ?auto_1692 ?auto_1699 ?auto_1697 )
      ( !LOAD ?auto_1698 ?auto_1692 ?auto_1696 ?auto_1697 )
      ( !DRIVE ?auto_1696 ?auto_1697 ?auto_1695 )
      ( !UNLOAD ?auto_1694 ?auto_1692 ?auto_1696 ?auto_1695 )
      ( !DROP ?auto_1694 ?auto_1692 ?auto_1693 ?auto_1695 )
      ( MAKE-ON-VERIFY ?auto_1692 ?auto_1693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1702 - SURFACE
      ?auto_1703 - SURFACE
    )
    :vars
    (
      ?auto_1704 - HOIST
      ?auto_1705 - PLACE
      ?auto_1707 - PLACE
      ?auto_1708 - HOIST
      ?auto_1709 - SURFACE
      ?auto_1706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704 ?auto_1705 ) ( SURFACE-AT ?auto_1703 ?auto_1705 ) ( CLEAR ?auto_1703 ) ( IS-CRATE ?auto_1702 ) ( AVAILABLE ?auto_1704 ) ( not ( = ?auto_1707 ?auto_1705 ) ) ( HOIST-AT ?auto_1708 ?auto_1707 ) ( AVAILABLE ?auto_1708 ) ( SURFACE-AT ?auto_1702 ?auto_1707 ) ( ON ?auto_1702 ?auto_1709 ) ( CLEAR ?auto_1702 ) ( TRUCK-AT ?auto_1706 ?auto_1705 ) ( not ( = ?auto_1702 ?auto_1703 ) ) ( not ( = ?auto_1702 ?auto_1709 ) ) ( not ( = ?auto_1703 ?auto_1709 ) ) ( not ( = ?auto_1704 ?auto_1708 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1706 ?auto_1705 ?auto_1707 )
      ( !LIFT ?auto_1708 ?auto_1702 ?auto_1709 ?auto_1707 )
      ( !LOAD ?auto_1708 ?auto_1702 ?auto_1706 ?auto_1707 )
      ( !DRIVE ?auto_1706 ?auto_1707 ?auto_1705 )
      ( !UNLOAD ?auto_1704 ?auto_1702 ?auto_1706 ?auto_1705 )
      ( !DROP ?auto_1704 ?auto_1702 ?auto_1703 ?auto_1705 )
      ( MAKE-ON-VERIFY ?auto_1702 ?auto_1703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1712 - SURFACE
      ?auto_1713 - SURFACE
    )
    :vars
    (
      ?auto_1714 - HOIST
      ?auto_1715 - PLACE
      ?auto_1717 - PLACE
      ?auto_1718 - HOIST
      ?auto_1719 - SURFACE
      ?auto_1716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1714 ?auto_1715 ) ( SURFACE-AT ?auto_1713 ?auto_1715 ) ( CLEAR ?auto_1713 ) ( IS-CRATE ?auto_1712 ) ( AVAILABLE ?auto_1714 ) ( not ( = ?auto_1717 ?auto_1715 ) ) ( HOIST-AT ?auto_1718 ?auto_1717 ) ( AVAILABLE ?auto_1718 ) ( SURFACE-AT ?auto_1712 ?auto_1717 ) ( ON ?auto_1712 ?auto_1719 ) ( CLEAR ?auto_1712 ) ( TRUCK-AT ?auto_1716 ?auto_1715 ) ( not ( = ?auto_1712 ?auto_1713 ) ) ( not ( = ?auto_1712 ?auto_1719 ) ) ( not ( = ?auto_1713 ?auto_1719 ) ) ( not ( = ?auto_1714 ?auto_1718 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1716 ?auto_1715 ?auto_1717 )
      ( !LIFT ?auto_1718 ?auto_1712 ?auto_1719 ?auto_1717 )
      ( !LOAD ?auto_1718 ?auto_1712 ?auto_1716 ?auto_1717 )
      ( !DRIVE ?auto_1716 ?auto_1717 ?auto_1715 )
      ( !UNLOAD ?auto_1714 ?auto_1712 ?auto_1716 ?auto_1715 )
      ( !DROP ?auto_1714 ?auto_1712 ?auto_1713 ?auto_1715 )
      ( MAKE-ON-VERIFY ?auto_1712 ?auto_1713 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1722 - SURFACE
      ?auto_1723 - SURFACE
    )
    :vars
    (
      ?auto_1724 - HOIST
      ?auto_1725 - PLACE
      ?auto_1727 - PLACE
      ?auto_1728 - HOIST
      ?auto_1729 - SURFACE
      ?auto_1726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1724 ?auto_1725 ) ( SURFACE-AT ?auto_1723 ?auto_1725 ) ( CLEAR ?auto_1723 ) ( IS-CRATE ?auto_1722 ) ( AVAILABLE ?auto_1724 ) ( not ( = ?auto_1727 ?auto_1725 ) ) ( HOIST-AT ?auto_1728 ?auto_1727 ) ( AVAILABLE ?auto_1728 ) ( SURFACE-AT ?auto_1722 ?auto_1727 ) ( ON ?auto_1722 ?auto_1729 ) ( CLEAR ?auto_1722 ) ( TRUCK-AT ?auto_1726 ?auto_1725 ) ( not ( = ?auto_1722 ?auto_1723 ) ) ( not ( = ?auto_1722 ?auto_1729 ) ) ( not ( = ?auto_1723 ?auto_1729 ) ) ( not ( = ?auto_1724 ?auto_1728 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1726 ?auto_1725 ?auto_1727 )
      ( !LIFT ?auto_1728 ?auto_1722 ?auto_1729 ?auto_1727 )
      ( !LOAD ?auto_1728 ?auto_1722 ?auto_1726 ?auto_1727 )
      ( !DRIVE ?auto_1726 ?auto_1727 ?auto_1725 )
      ( !UNLOAD ?auto_1724 ?auto_1722 ?auto_1726 ?auto_1725 )
      ( !DROP ?auto_1724 ?auto_1722 ?auto_1723 ?auto_1725 )
      ( MAKE-ON-VERIFY ?auto_1722 ?auto_1723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1732 - SURFACE
      ?auto_1733 - SURFACE
    )
    :vars
    (
      ?auto_1734 - HOIST
      ?auto_1735 - PLACE
      ?auto_1737 - PLACE
      ?auto_1738 - HOIST
      ?auto_1739 - SURFACE
      ?auto_1736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1734 ?auto_1735 ) ( SURFACE-AT ?auto_1733 ?auto_1735 ) ( CLEAR ?auto_1733 ) ( IS-CRATE ?auto_1732 ) ( AVAILABLE ?auto_1734 ) ( not ( = ?auto_1737 ?auto_1735 ) ) ( HOIST-AT ?auto_1738 ?auto_1737 ) ( AVAILABLE ?auto_1738 ) ( SURFACE-AT ?auto_1732 ?auto_1737 ) ( ON ?auto_1732 ?auto_1739 ) ( CLEAR ?auto_1732 ) ( TRUCK-AT ?auto_1736 ?auto_1735 ) ( not ( = ?auto_1732 ?auto_1733 ) ) ( not ( = ?auto_1732 ?auto_1739 ) ) ( not ( = ?auto_1733 ?auto_1739 ) ) ( not ( = ?auto_1734 ?auto_1738 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1736 ?auto_1735 ?auto_1737 )
      ( !LIFT ?auto_1738 ?auto_1732 ?auto_1739 ?auto_1737 )
      ( !LOAD ?auto_1738 ?auto_1732 ?auto_1736 ?auto_1737 )
      ( !DRIVE ?auto_1736 ?auto_1737 ?auto_1735 )
      ( !UNLOAD ?auto_1734 ?auto_1732 ?auto_1736 ?auto_1735 )
      ( !DROP ?auto_1734 ?auto_1732 ?auto_1733 ?auto_1735 )
      ( MAKE-ON-VERIFY ?auto_1732 ?auto_1733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1742 - SURFACE
      ?auto_1743 - SURFACE
    )
    :vars
    (
      ?auto_1744 - HOIST
      ?auto_1745 - PLACE
      ?auto_1747 - PLACE
      ?auto_1748 - HOIST
      ?auto_1749 - SURFACE
      ?auto_1746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1744 ?auto_1745 ) ( SURFACE-AT ?auto_1743 ?auto_1745 ) ( CLEAR ?auto_1743 ) ( IS-CRATE ?auto_1742 ) ( AVAILABLE ?auto_1744 ) ( not ( = ?auto_1747 ?auto_1745 ) ) ( HOIST-AT ?auto_1748 ?auto_1747 ) ( AVAILABLE ?auto_1748 ) ( SURFACE-AT ?auto_1742 ?auto_1747 ) ( ON ?auto_1742 ?auto_1749 ) ( CLEAR ?auto_1742 ) ( TRUCK-AT ?auto_1746 ?auto_1745 ) ( not ( = ?auto_1742 ?auto_1743 ) ) ( not ( = ?auto_1742 ?auto_1749 ) ) ( not ( = ?auto_1743 ?auto_1749 ) ) ( not ( = ?auto_1744 ?auto_1748 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1746 ?auto_1745 ?auto_1747 )
      ( !LIFT ?auto_1748 ?auto_1742 ?auto_1749 ?auto_1747 )
      ( !LOAD ?auto_1748 ?auto_1742 ?auto_1746 ?auto_1747 )
      ( !DRIVE ?auto_1746 ?auto_1747 ?auto_1745 )
      ( !UNLOAD ?auto_1744 ?auto_1742 ?auto_1746 ?auto_1745 )
      ( !DROP ?auto_1744 ?auto_1742 ?auto_1743 ?auto_1745 )
      ( MAKE-ON-VERIFY ?auto_1742 ?auto_1743 ) )
  )

)

