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
      ?auto_1664 - PLACE
      ?auto_1665 - PLACE
      ?auto_1667 - HOIST
      ?auto_1666 - SURFACE
      ?auto_1670 - SURFACE
      ?auto_1669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1668 ?auto_1664 ) ( IS-CRATE ?auto_1663 ) ( not ( = ?auto_1665 ?auto_1664 ) ) ( HOIST-AT ?auto_1667 ?auto_1665 ) ( SURFACE-AT ?auto_1663 ?auto_1665 ) ( ON ?auto_1663 ?auto_1666 ) ( CLEAR ?auto_1663 ) ( not ( = ?auto_1662 ?auto_1663 ) ) ( not ( = ?auto_1662 ?auto_1666 ) ) ( not ( = ?auto_1663 ?auto_1666 ) ) ( not ( = ?auto_1668 ?auto_1667 ) ) ( SURFACE-AT ?auto_1661 ?auto_1664 ) ( CLEAR ?auto_1661 ) ( IS-CRATE ?auto_1662 ) ( AVAILABLE ?auto_1668 ) ( AVAILABLE ?auto_1667 ) ( SURFACE-AT ?auto_1662 ?auto_1665 ) ( ON ?auto_1662 ?auto_1670 ) ( CLEAR ?auto_1662 ) ( TRUCK-AT ?auto_1669 ?auto_1664 ) ( not ( = ?auto_1661 ?auto_1662 ) ) ( not ( = ?auto_1661 ?auto_1670 ) ) ( not ( = ?auto_1662 ?auto_1670 ) ) ( not ( = ?auto_1661 ?auto_1663 ) ) ( not ( = ?auto_1661 ?auto_1666 ) ) ( not ( = ?auto_1663 ?auto_1670 ) ) ( not ( = ?auto_1666 ?auto_1670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1661 ?auto_1662 )
      ( MAKE-1CRATE ?auto_1662 ?auto_1663 )
      ( MAKE-2CRATE-VERIFY ?auto_1661 ?auto_1662 ?auto_1663 ) )
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
      ?auto_1692 - HOIST
      ?auto_1689 - PLACE
      ?auto_1694 - PLACE
      ?auto_1691 - HOIST
      ?auto_1690 - SURFACE
      ?auto_1698 - PLACE
      ?auto_1696 - HOIST
      ?auto_1697 - SURFACE
      ?auto_1695 - SURFACE
      ?auto_1693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1692 ?auto_1689 ) ( IS-CRATE ?auto_1688 ) ( not ( = ?auto_1694 ?auto_1689 ) ) ( HOIST-AT ?auto_1691 ?auto_1694 ) ( AVAILABLE ?auto_1691 ) ( SURFACE-AT ?auto_1688 ?auto_1694 ) ( ON ?auto_1688 ?auto_1690 ) ( CLEAR ?auto_1688 ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( not ( = ?auto_1687 ?auto_1690 ) ) ( not ( = ?auto_1688 ?auto_1690 ) ) ( not ( = ?auto_1692 ?auto_1691 ) ) ( IS-CRATE ?auto_1687 ) ( not ( = ?auto_1698 ?auto_1689 ) ) ( HOIST-AT ?auto_1696 ?auto_1698 ) ( SURFACE-AT ?auto_1687 ?auto_1698 ) ( ON ?auto_1687 ?auto_1697 ) ( CLEAR ?auto_1687 ) ( not ( = ?auto_1686 ?auto_1687 ) ) ( not ( = ?auto_1686 ?auto_1697 ) ) ( not ( = ?auto_1687 ?auto_1697 ) ) ( not ( = ?auto_1692 ?auto_1696 ) ) ( SURFACE-AT ?auto_1685 ?auto_1689 ) ( CLEAR ?auto_1685 ) ( IS-CRATE ?auto_1686 ) ( AVAILABLE ?auto_1692 ) ( AVAILABLE ?auto_1696 ) ( SURFACE-AT ?auto_1686 ?auto_1698 ) ( ON ?auto_1686 ?auto_1695 ) ( CLEAR ?auto_1686 ) ( TRUCK-AT ?auto_1693 ?auto_1689 ) ( not ( = ?auto_1685 ?auto_1686 ) ) ( not ( = ?auto_1685 ?auto_1695 ) ) ( not ( = ?auto_1686 ?auto_1695 ) ) ( not ( = ?auto_1685 ?auto_1687 ) ) ( not ( = ?auto_1685 ?auto_1697 ) ) ( not ( = ?auto_1687 ?auto_1695 ) ) ( not ( = ?auto_1697 ?auto_1695 ) ) ( not ( = ?auto_1685 ?auto_1688 ) ) ( not ( = ?auto_1685 ?auto_1690 ) ) ( not ( = ?auto_1686 ?auto_1688 ) ) ( not ( = ?auto_1686 ?auto_1690 ) ) ( not ( = ?auto_1688 ?auto_1697 ) ) ( not ( = ?auto_1688 ?auto_1695 ) ) ( not ( = ?auto_1694 ?auto_1698 ) ) ( not ( = ?auto_1691 ?auto_1696 ) ) ( not ( = ?auto_1690 ?auto_1697 ) ) ( not ( = ?auto_1690 ?auto_1695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1685 ?auto_1686 ?auto_1687 )
      ( MAKE-1CRATE ?auto_1687 ?auto_1688 )
      ( MAKE-3CRATE-VERIFY ?auto_1685 ?auto_1686 ?auto_1687 ?auto_1688 ) )
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
      ?auto_1722 - HOIST
      ?auto_1719 - PLACE
      ?auto_1723 - PLACE
      ?auto_1724 - HOIST
      ?auto_1720 - SURFACE
      ?auto_1730 - PLACE
      ?auto_1731 - HOIST
      ?auto_1726 - SURFACE
      ?auto_1725 - PLACE
      ?auto_1729 - HOIST
      ?auto_1727 - SURFACE
      ?auto_1728 - SURFACE
      ?auto_1721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722 ?auto_1719 ) ( IS-CRATE ?auto_1718 ) ( not ( = ?auto_1723 ?auto_1719 ) ) ( HOIST-AT ?auto_1724 ?auto_1723 ) ( AVAILABLE ?auto_1724 ) ( SURFACE-AT ?auto_1718 ?auto_1723 ) ( ON ?auto_1718 ?auto_1720 ) ( CLEAR ?auto_1718 ) ( not ( = ?auto_1717 ?auto_1718 ) ) ( not ( = ?auto_1717 ?auto_1720 ) ) ( not ( = ?auto_1718 ?auto_1720 ) ) ( not ( = ?auto_1722 ?auto_1724 ) ) ( IS-CRATE ?auto_1717 ) ( not ( = ?auto_1730 ?auto_1719 ) ) ( HOIST-AT ?auto_1731 ?auto_1730 ) ( AVAILABLE ?auto_1731 ) ( SURFACE-AT ?auto_1717 ?auto_1730 ) ( ON ?auto_1717 ?auto_1726 ) ( CLEAR ?auto_1717 ) ( not ( = ?auto_1716 ?auto_1717 ) ) ( not ( = ?auto_1716 ?auto_1726 ) ) ( not ( = ?auto_1717 ?auto_1726 ) ) ( not ( = ?auto_1722 ?auto_1731 ) ) ( IS-CRATE ?auto_1716 ) ( not ( = ?auto_1725 ?auto_1719 ) ) ( HOIST-AT ?auto_1729 ?auto_1725 ) ( SURFACE-AT ?auto_1716 ?auto_1725 ) ( ON ?auto_1716 ?auto_1727 ) ( CLEAR ?auto_1716 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1715 ?auto_1727 ) ) ( not ( = ?auto_1716 ?auto_1727 ) ) ( not ( = ?auto_1722 ?auto_1729 ) ) ( SURFACE-AT ?auto_1714 ?auto_1719 ) ( CLEAR ?auto_1714 ) ( IS-CRATE ?auto_1715 ) ( AVAILABLE ?auto_1722 ) ( AVAILABLE ?auto_1729 ) ( SURFACE-AT ?auto_1715 ?auto_1725 ) ( ON ?auto_1715 ?auto_1728 ) ( CLEAR ?auto_1715 ) ( TRUCK-AT ?auto_1721 ?auto_1719 ) ( not ( = ?auto_1714 ?auto_1715 ) ) ( not ( = ?auto_1714 ?auto_1728 ) ) ( not ( = ?auto_1715 ?auto_1728 ) ) ( not ( = ?auto_1714 ?auto_1716 ) ) ( not ( = ?auto_1714 ?auto_1727 ) ) ( not ( = ?auto_1716 ?auto_1728 ) ) ( not ( = ?auto_1727 ?auto_1728 ) ) ( not ( = ?auto_1714 ?auto_1717 ) ) ( not ( = ?auto_1714 ?auto_1726 ) ) ( not ( = ?auto_1715 ?auto_1717 ) ) ( not ( = ?auto_1715 ?auto_1726 ) ) ( not ( = ?auto_1717 ?auto_1727 ) ) ( not ( = ?auto_1717 ?auto_1728 ) ) ( not ( = ?auto_1730 ?auto_1725 ) ) ( not ( = ?auto_1731 ?auto_1729 ) ) ( not ( = ?auto_1726 ?auto_1727 ) ) ( not ( = ?auto_1726 ?auto_1728 ) ) ( not ( = ?auto_1714 ?auto_1718 ) ) ( not ( = ?auto_1714 ?auto_1720 ) ) ( not ( = ?auto_1715 ?auto_1718 ) ) ( not ( = ?auto_1715 ?auto_1720 ) ) ( not ( = ?auto_1716 ?auto_1718 ) ) ( not ( = ?auto_1716 ?auto_1720 ) ) ( not ( = ?auto_1718 ?auto_1726 ) ) ( not ( = ?auto_1718 ?auto_1727 ) ) ( not ( = ?auto_1718 ?auto_1728 ) ) ( not ( = ?auto_1723 ?auto_1730 ) ) ( not ( = ?auto_1723 ?auto_1725 ) ) ( not ( = ?auto_1724 ?auto_1731 ) ) ( not ( = ?auto_1724 ?auto_1729 ) ) ( not ( = ?auto_1720 ?auto_1726 ) ) ( not ( = ?auto_1720 ?auto_1727 ) ) ( not ( = ?auto_1720 ?auto_1728 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1714 ?auto_1715 ?auto_1716 ?auto_1717 )
      ( MAKE-1CRATE ?auto_1717 ?auto_1718 )
      ( MAKE-4CRATE-VERIFY ?auto_1714 ?auto_1715 ?auto_1716 ?auto_1717 ?auto_1718 ) )
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
      ?auto_1755 - HOIST
      ?auto_1757 - PLACE
      ?auto_1756 - PLACE
      ?auto_1754 - HOIST
      ?auto_1758 - SURFACE
      ?auto_1768 - PLACE
      ?auto_1764 - HOIST
      ?auto_1765 - SURFACE
      ?auto_1767 - PLACE
      ?auto_1769 - HOIST
      ?auto_1763 - SURFACE
      ?auto_1761 - PLACE
      ?auto_1766 - HOIST
      ?auto_1760 - SURFACE
      ?auto_1762 - SURFACE
      ?auto_1759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1755 ?auto_1757 ) ( IS-CRATE ?auto_1753 ) ( not ( = ?auto_1756 ?auto_1757 ) ) ( HOIST-AT ?auto_1754 ?auto_1756 ) ( AVAILABLE ?auto_1754 ) ( SURFACE-AT ?auto_1753 ?auto_1756 ) ( ON ?auto_1753 ?auto_1758 ) ( CLEAR ?auto_1753 ) ( not ( = ?auto_1752 ?auto_1753 ) ) ( not ( = ?auto_1752 ?auto_1758 ) ) ( not ( = ?auto_1753 ?auto_1758 ) ) ( not ( = ?auto_1755 ?auto_1754 ) ) ( IS-CRATE ?auto_1752 ) ( not ( = ?auto_1768 ?auto_1757 ) ) ( HOIST-AT ?auto_1764 ?auto_1768 ) ( AVAILABLE ?auto_1764 ) ( SURFACE-AT ?auto_1752 ?auto_1768 ) ( ON ?auto_1752 ?auto_1765 ) ( CLEAR ?auto_1752 ) ( not ( = ?auto_1751 ?auto_1752 ) ) ( not ( = ?auto_1751 ?auto_1765 ) ) ( not ( = ?auto_1752 ?auto_1765 ) ) ( not ( = ?auto_1755 ?auto_1764 ) ) ( IS-CRATE ?auto_1751 ) ( not ( = ?auto_1767 ?auto_1757 ) ) ( HOIST-AT ?auto_1769 ?auto_1767 ) ( AVAILABLE ?auto_1769 ) ( SURFACE-AT ?auto_1751 ?auto_1767 ) ( ON ?auto_1751 ?auto_1763 ) ( CLEAR ?auto_1751 ) ( not ( = ?auto_1750 ?auto_1751 ) ) ( not ( = ?auto_1750 ?auto_1763 ) ) ( not ( = ?auto_1751 ?auto_1763 ) ) ( not ( = ?auto_1755 ?auto_1769 ) ) ( IS-CRATE ?auto_1750 ) ( not ( = ?auto_1761 ?auto_1757 ) ) ( HOIST-AT ?auto_1766 ?auto_1761 ) ( SURFACE-AT ?auto_1750 ?auto_1761 ) ( ON ?auto_1750 ?auto_1760 ) ( CLEAR ?auto_1750 ) ( not ( = ?auto_1749 ?auto_1750 ) ) ( not ( = ?auto_1749 ?auto_1760 ) ) ( not ( = ?auto_1750 ?auto_1760 ) ) ( not ( = ?auto_1755 ?auto_1766 ) ) ( SURFACE-AT ?auto_1748 ?auto_1757 ) ( CLEAR ?auto_1748 ) ( IS-CRATE ?auto_1749 ) ( AVAILABLE ?auto_1755 ) ( AVAILABLE ?auto_1766 ) ( SURFACE-AT ?auto_1749 ?auto_1761 ) ( ON ?auto_1749 ?auto_1762 ) ( CLEAR ?auto_1749 ) ( TRUCK-AT ?auto_1759 ?auto_1757 ) ( not ( = ?auto_1748 ?auto_1749 ) ) ( not ( = ?auto_1748 ?auto_1762 ) ) ( not ( = ?auto_1749 ?auto_1762 ) ) ( not ( = ?auto_1748 ?auto_1750 ) ) ( not ( = ?auto_1748 ?auto_1760 ) ) ( not ( = ?auto_1750 ?auto_1762 ) ) ( not ( = ?auto_1760 ?auto_1762 ) ) ( not ( = ?auto_1748 ?auto_1751 ) ) ( not ( = ?auto_1748 ?auto_1763 ) ) ( not ( = ?auto_1749 ?auto_1751 ) ) ( not ( = ?auto_1749 ?auto_1763 ) ) ( not ( = ?auto_1751 ?auto_1760 ) ) ( not ( = ?auto_1751 ?auto_1762 ) ) ( not ( = ?auto_1767 ?auto_1761 ) ) ( not ( = ?auto_1769 ?auto_1766 ) ) ( not ( = ?auto_1763 ?auto_1760 ) ) ( not ( = ?auto_1763 ?auto_1762 ) ) ( not ( = ?auto_1748 ?auto_1752 ) ) ( not ( = ?auto_1748 ?auto_1765 ) ) ( not ( = ?auto_1749 ?auto_1752 ) ) ( not ( = ?auto_1749 ?auto_1765 ) ) ( not ( = ?auto_1750 ?auto_1752 ) ) ( not ( = ?auto_1750 ?auto_1765 ) ) ( not ( = ?auto_1752 ?auto_1763 ) ) ( not ( = ?auto_1752 ?auto_1760 ) ) ( not ( = ?auto_1752 ?auto_1762 ) ) ( not ( = ?auto_1768 ?auto_1767 ) ) ( not ( = ?auto_1768 ?auto_1761 ) ) ( not ( = ?auto_1764 ?auto_1769 ) ) ( not ( = ?auto_1764 ?auto_1766 ) ) ( not ( = ?auto_1765 ?auto_1763 ) ) ( not ( = ?auto_1765 ?auto_1760 ) ) ( not ( = ?auto_1765 ?auto_1762 ) ) ( not ( = ?auto_1748 ?auto_1753 ) ) ( not ( = ?auto_1748 ?auto_1758 ) ) ( not ( = ?auto_1749 ?auto_1753 ) ) ( not ( = ?auto_1749 ?auto_1758 ) ) ( not ( = ?auto_1750 ?auto_1753 ) ) ( not ( = ?auto_1750 ?auto_1758 ) ) ( not ( = ?auto_1751 ?auto_1753 ) ) ( not ( = ?auto_1751 ?auto_1758 ) ) ( not ( = ?auto_1753 ?auto_1765 ) ) ( not ( = ?auto_1753 ?auto_1763 ) ) ( not ( = ?auto_1753 ?auto_1760 ) ) ( not ( = ?auto_1753 ?auto_1762 ) ) ( not ( = ?auto_1756 ?auto_1768 ) ) ( not ( = ?auto_1756 ?auto_1767 ) ) ( not ( = ?auto_1756 ?auto_1761 ) ) ( not ( = ?auto_1754 ?auto_1764 ) ) ( not ( = ?auto_1754 ?auto_1769 ) ) ( not ( = ?auto_1754 ?auto_1766 ) ) ( not ( = ?auto_1758 ?auto_1765 ) ) ( not ( = ?auto_1758 ?auto_1763 ) ) ( not ( = ?auto_1758 ?auto_1760 ) ) ( not ( = ?auto_1758 ?auto_1762 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1748 ?auto_1749 ?auto_1750 ?auto_1751 ?auto_1752 )
      ( MAKE-1CRATE ?auto_1752 ?auto_1753 )
      ( MAKE-5CRATE-VERIFY ?auto_1748 ?auto_1749 ?auto_1750 ?auto_1751 ?auto_1752 ?auto_1753 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1787 - SURFACE
      ?auto_1788 - SURFACE
      ?auto_1789 - SURFACE
      ?auto_1790 - SURFACE
      ?auto_1791 - SURFACE
      ?auto_1792 - SURFACE
      ?auto_1793 - SURFACE
    )
    :vars
    (
      ?auto_1797 - HOIST
      ?auto_1799 - PLACE
      ?auto_1794 - PLACE
      ?auto_1795 - HOIST
      ?auto_1796 - SURFACE
      ?auto_1804 - PLACE
      ?auto_1802 - HOIST
      ?auto_1808 - SURFACE
      ?auto_1812 - PLACE
      ?auto_1805 - HOIST
      ?auto_1806 - SURFACE
      ?auto_1807 - PLACE
      ?auto_1803 - HOIST
      ?auto_1811 - SURFACE
      ?auto_1810 - PLACE
      ?auto_1809 - HOIST
      ?auto_1801 - SURFACE
      ?auto_1800 - SURFACE
      ?auto_1798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1797 ?auto_1799 ) ( IS-CRATE ?auto_1793 ) ( not ( = ?auto_1794 ?auto_1799 ) ) ( HOIST-AT ?auto_1795 ?auto_1794 ) ( AVAILABLE ?auto_1795 ) ( SURFACE-AT ?auto_1793 ?auto_1794 ) ( ON ?auto_1793 ?auto_1796 ) ( CLEAR ?auto_1793 ) ( not ( = ?auto_1792 ?auto_1793 ) ) ( not ( = ?auto_1792 ?auto_1796 ) ) ( not ( = ?auto_1793 ?auto_1796 ) ) ( not ( = ?auto_1797 ?auto_1795 ) ) ( IS-CRATE ?auto_1792 ) ( not ( = ?auto_1804 ?auto_1799 ) ) ( HOIST-AT ?auto_1802 ?auto_1804 ) ( AVAILABLE ?auto_1802 ) ( SURFACE-AT ?auto_1792 ?auto_1804 ) ( ON ?auto_1792 ?auto_1808 ) ( CLEAR ?auto_1792 ) ( not ( = ?auto_1791 ?auto_1792 ) ) ( not ( = ?auto_1791 ?auto_1808 ) ) ( not ( = ?auto_1792 ?auto_1808 ) ) ( not ( = ?auto_1797 ?auto_1802 ) ) ( IS-CRATE ?auto_1791 ) ( not ( = ?auto_1812 ?auto_1799 ) ) ( HOIST-AT ?auto_1805 ?auto_1812 ) ( AVAILABLE ?auto_1805 ) ( SURFACE-AT ?auto_1791 ?auto_1812 ) ( ON ?auto_1791 ?auto_1806 ) ( CLEAR ?auto_1791 ) ( not ( = ?auto_1790 ?auto_1791 ) ) ( not ( = ?auto_1790 ?auto_1806 ) ) ( not ( = ?auto_1791 ?auto_1806 ) ) ( not ( = ?auto_1797 ?auto_1805 ) ) ( IS-CRATE ?auto_1790 ) ( not ( = ?auto_1807 ?auto_1799 ) ) ( HOIST-AT ?auto_1803 ?auto_1807 ) ( AVAILABLE ?auto_1803 ) ( SURFACE-AT ?auto_1790 ?auto_1807 ) ( ON ?auto_1790 ?auto_1811 ) ( CLEAR ?auto_1790 ) ( not ( = ?auto_1789 ?auto_1790 ) ) ( not ( = ?auto_1789 ?auto_1811 ) ) ( not ( = ?auto_1790 ?auto_1811 ) ) ( not ( = ?auto_1797 ?auto_1803 ) ) ( IS-CRATE ?auto_1789 ) ( not ( = ?auto_1810 ?auto_1799 ) ) ( HOIST-AT ?auto_1809 ?auto_1810 ) ( SURFACE-AT ?auto_1789 ?auto_1810 ) ( ON ?auto_1789 ?auto_1801 ) ( CLEAR ?auto_1789 ) ( not ( = ?auto_1788 ?auto_1789 ) ) ( not ( = ?auto_1788 ?auto_1801 ) ) ( not ( = ?auto_1789 ?auto_1801 ) ) ( not ( = ?auto_1797 ?auto_1809 ) ) ( SURFACE-AT ?auto_1787 ?auto_1799 ) ( CLEAR ?auto_1787 ) ( IS-CRATE ?auto_1788 ) ( AVAILABLE ?auto_1797 ) ( AVAILABLE ?auto_1809 ) ( SURFACE-AT ?auto_1788 ?auto_1810 ) ( ON ?auto_1788 ?auto_1800 ) ( CLEAR ?auto_1788 ) ( TRUCK-AT ?auto_1798 ?auto_1799 ) ( not ( = ?auto_1787 ?auto_1788 ) ) ( not ( = ?auto_1787 ?auto_1800 ) ) ( not ( = ?auto_1788 ?auto_1800 ) ) ( not ( = ?auto_1787 ?auto_1789 ) ) ( not ( = ?auto_1787 ?auto_1801 ) ) ( not ( = ?auto_1789 ?auto_1800 ) ) ( not ( = ?auto_1801 ?auto_1800 ) ) ( not ( = ?auto_1787 ?auto_1790 ) ) ( not ( = ?auto_1787 ?auto_1811 ) ) ( not ( = ?auto_1788 ?auto_1790 ) ) ( not ( = ?auto_1788 ?auto_1811 ) ) ( not ( = ?auto_1790 ?auto_1801 ) ) ( not ( = ?auto_1790 ?auto_1800 ) ) ( not ( = ?auto_1807 ?auto_1810 ) ) ( not ( = ?auto_1803 ?auto_1809 ) ) ( not ( = ?auto_1811 ?auto_1801 ) ) ( not ( = ?auto_1811 ?auto_1800 ) ) ( not ( = ?auto_1787 ?auto_1791 ) ) ( not ( = ?auto_1787 ?auto_1806 ) ) ( not ( = ?auto_1788 ?auto_1791 ) ) ( not ( = ?auto_1788 ?auto_1806 ) ) ( not ( = ?auto_1789 ?auto_1791 ) ) ( not ( = ?auto_1789 ?auto_1806 ) ) ( not ( = ?auto_1791 ?auto_1811 ) ) ( not ( = ?auto_1791 ?auto_1801 ) ) ( not ( = ?auto_1791 ?auto_1800 ) ) ( not ( = ?auto_1812 ?auto_1807 ) ) ( not ( = ?auto_1812 ?auto_1810 ) ) ( not ( = ?auto_1805 ?auto_1803 ) ) ( not ( = ?auto_1805 ?auto_1809 ) ) ( not ( = ?auto_1806 ?auto_1811 ) ) ( not ( = ?auto_1806 ?auto_1801 ) ) ( not ( = ?auto_1806 ?auto_1800 ) ) ( not ( = ?auto_1787 ?auto_1792 ) ) ( not ( = ?auto_1787 ?auto_1808 ) ) ( not ( = ?auto_1788 ?auto_1792 ) ) ( not ( = ?auto_1788 ?auto_1808 ) ) ( not ( = ?auto_1789 ?auto_1792 ) ) ( not ( = ?auto_1789 ?auto_1808 ) ) ( not ( = ?auto_1790 ?auto_1792 ) ) ( not ( = ?auto_1790 ?auto_1808 ) ) ( not ( = ?auto_1792 ?auto_1806 ) ) ( not ( = ?auto_1792 ?auto_1811 ) ) ( not ( = ?auto_1792 ?auto_1801 ) ) ( not ( = ?auto_1792 ?auto_1800 ) ) ( not ( = ?auto_1804 ?auto_1812 ) ) ( not ( = ?auto_1804 ?auto_1807 ) ) ( not ( = ?auto_1804 ?auto_1810 ) ) ( not ( = ?auto_1802 ?auto_1805 ) ) ( not ( = ?auto_1802 ?auto_1803 ) ) ( not ( = ?auto_1802 ?auto_1809 ) ) ( not ( = ?auto_1808 ?auto_1806 ) ) ( not ( = ?auto_1808 ?auto_1811 ) ) ( not ( = ?auto_1808 ?auto_1801 ) ) ( not ( = ?auto_1808 ?auto_1800 ) ) ( not ( = ?auto_1787 ?auto_1793 ) ) ( not ( = ?auto_1787 ?auto_1796 ) ) ( not ( = ?auto_1788 ?auto_1793 ) ) ( not ( = ?auto_1788 ?auto_1796 ) ) ( not ( = ?auto_1789 ?auto_1793 ) ) ( not ( = ?auto_1789 ?auto_1796 ) ) ( not ( = ?auto_1790 ?auto_1793 ) ) ( not ( = ?auto_1790 ?auto_1796 ) ) ( not ( = ?auto_1791 ?auto_1793 ) ) ( not ( = ?auto_1791 ?auto_1796 ) ) ( not ( = ?auto_1793 ?auto_1808 ) ) ( not ( = ?auto_1793 ?auto_1806 ) ) ( not ( = ?auto_1793 ?auto_1811 ) ) ( not ( = ?auto_1793 ?auto_1801 ) ) ( not ( = ?auto_1793 ?auto_1800 ) ) ( not ( = ?auto_1794 ?auto_1804 ) ) ( not ( = ?auto_1794 ?auto_1812 ) ) ( not ( = ?auto_1794 ?auto_1807 ) ) ( not ( = ?auto_1794 ?auto_1810 ) ) ( not ( = ?auto_1795 ?auto_1802 ) ) ( not ( = ?auto_1795 ?auto_1805 ) ) ( not ( = ?auto_1795 ?auto_1803 ) ) ( not ( = ?auto_1795 ?auto_1809 ) ) ( not ( = ?auto_1796 ?auto_1808 ) ) ( not ( = ?auto_1796 ?auto_1806 ) ) ( not ( = ?auto_1796 ?auto_1811 ) ) ( not ( = ?auto_1796 ?auto_1801 ) ) ( not ( = ?auto_1796 ?auto_1800 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1787 ?auto_1788 ?auto_1789 ?auto_1790 ?auto_1791 ?auto_1792 )
      ( MAKE-1CRATE ?auto_1792 ?auto_1793 )
      ( MAKE-6CRATE-VERIFY ?auto_1787 ?auto_1788 ?auto_1789 ?auto_1790 ?auto_1791 ?auto_1792 ?auto_1793 ) )
  )

)

