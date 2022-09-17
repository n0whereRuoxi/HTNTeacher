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
      ?auto_1662 - SURFACE
      ?auto_1663 - SURFACE
    )
    :vars
    (
      ?auto_1664 - HOIST
      ?auto_1665 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1664 ?auto_1665 ) ( SURFACE-AT ?auto_1663 ?auto_1665 ) ( CLEAR ?auto_1663 ) ( LIFTING ?auto_1664 ?auto_1662 ) ( IS-CRATE ?auto_1662 ) ( not ( = ?auto_1662 ?auto_1663 ) ) )
    :subtasks
    ( ( !DROP ?auto_1664 ?auto_1662 ?auto_1663 ?auto_1665 )
      ( MAKE-ON-VERIFY ?auto_1662 ?auto_1663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1666 - SURFACE
      ?auto_1667 - SURFACE
    )
    :vars
    (
      ?auto_1668 - HOIST
      ?auto_1669 - PLACE
      ?auto_1670 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1668 ?auto_1669 ) ( SURFACE-AT ?auto_1667 ?auto_1669 ) ( CLEAR ?auto_1667 ) ( IS-CRATE ?auto_1666 ) ( not ( = ?auto_1666 ?auto_1667 ) ) ( TRUCK-AT ?auto_1670 ?auto_1669 ) ( AVAILABLE ?auto_1668 ) ( IN ?auto_1666 ?auto_1670 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1668 ?auto_1666 ?auto_1670 ?auto_1669 )
      ( MAKE-ON ?auto_1666 ?auto_1667 )
      ( MAKE-ON-VERIFY ?auto_1666 ?auto_1667 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1671 - SURFACE
      ?auto_1672 - SURFACE
    )
    :vars
    (
      ?auto_1673 - HOIST
      ?auto_1675 - PLACE
      ?auto_1674 - TRUCK
      ?auto_1676 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1673 ?auto_1675 ) ( SURFACE-AT ?auto_1672 ?auto_1675 ) ( CLEAR ?auto_1672 ) ( IS-CRATE ?auto_1671 ) ( not ( = ?auto_1671 ?auto_1672 ) ) ( AVAILABLE ?auto_1673 ) ( IN ?auto_1671 ?auto_1674 ) ( TRUCK-AT ?auto_1674 ?auto_1676 ) ( not ( = ?auto_1676 ?auto_1675 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1674 ?auto_1676 ?auto_1675 )
      ( MAKE-ON ?auto_1671 ?auto_1672 )
      ( MAKE-ON-VERIFY ?auto_1671 ?auto_1672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1677 - SURFACE
      ?auto_1678 - SURFACE
    )
    :vars
    (
      ?auto_1682 - HOIST
      ?auto_1679 - PLACE
      ?auto_1681 - TRUCK
      ?auto_1680 - PLACE
      ?auto_1683 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1682 ?auto_1679 ) ( SURFACE-AT ?auto_1678 ?auto_1679 ) ( CLEAR ?auto_1678 ) ( IS-CRATE ?auto_1677 ) ( not ( = ?auto_1677 ?auto_1678 ) ) ( AVAILABLE ?auto_1682 ) ( TRUCK-AT ?auto_1681 ?auto_1680 ) ( not ( = ?auto_1680 ?auto_1679 ) ) ( HOIST-AT ?auto_1683 ?auto_1680 ) ( LIFTING ?auto_1683 ?auto_1677 ) ( not ( = ?auto_1682 ?auto_1683 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1683 ?auto_1677 ?auto_1681 ?auto_1680 )
      ( MAKE-ON ?auto_1677 ?auto_1678 )
      ( MAKE-ON-VERIFY ?auto_1677 ?auto_1678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1684 - SURFACE
      ?auto_1685 - SURFACE
    )
    :vars
    (
      ?auto_1688 - HOIST
      ?auto_1687 - PLACE
      ?auto_1689 - TRUCK
      ?auto_1686 - PLACE
      ?auto_1690 - HOIST
      ?auto_1691 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1688 ?auto_1687 ) ( SURFACE-AT ?auto_1685 ?auto_1687 ) ( CLEAR ?auto_1685 ) ( IS-CRATE ?auto_1684 ) ( not ( = ?auto_1684 ?auto_1685 ) ) ( AVAILABLE ?auto_1688 ) ( TRUCK-AT ?auto_1689 ?auto_1686 ) ( not ( = ?auto_1686 ?auto_1687 ) ) ( HOIST-AT ?auto_1690 ?auto_1686 ) ( not ( = ?auto_1688 ?auto_1690 ) ) ( AVAILABLE ?auto_1690 ) ( SURFACE-AT ?auto_1684 ?auto_1686 ) ( ON ?auto_1684 ?auto_1691 ) ( CLEAR ?auto_1684 ) ( not ( = ?auto_1684 ?auto_1691 ) ) ( not ( = ?auto_1685 ?auto_1691 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1690 ?auto_1684 ?auto_1691 ?auto_1686 )
      ( MAKE-ON ?auto_1684 ?auto_1685 )
      ( MAKE-ON-VERIFY ?auto_1684 ?auto_1685 ) )
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
      ?auto_1699 - PLACE
      ?auto_1696 - PLACE
      ?auto_1695 - HOIST
      ?auto_1697 - SURFACE
      ?auto_1698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1694 ?auto_1699 ) ( SURFACE-AT ?auto_1693 ?auto_1699 ) ( CLEAR ?auto_1693 ) ( IS-CRATE ?auto_1692 ) ( not ( = ?auto_1692 ?auto_1693 ) ) ( AVAILABLE ?auto_1694 ) ( not ( = ?auto_1696 ?auto_1699 ) ) ( HOIST-AT ?auto_1695 ?auto_1696 ) ( not ( = ?auto_1694 ?auto_1695 ) ) ( AVAILABLE ?auto_1695 ) ( SURFACE-AT ?auto_1692 ?auto_1696 ) ( ON ?auto_1692 ?auto_1697 ) ( CLEAR ?auto_1692 ) ( not ( = ?auto_1692 ?auto_1697 ) ) ( not ( = ?auto_1693 ?auto_1697 ) ) ( TRUCK-AT ?auto_1698 ?auto_1699 ) )
    :subtasks
    ( ( !DRIVE ?auto_1698 ?auto_1699 ?auto_1696 )
      ( MAKE-ON ?auto_1692 ?auto_1693 )
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
    )
    :precondition
    ( and ( HOIST-AT ?auto_1704 ?auto_1705 ) ( SURFACE-AT ?auto_1703 ?auto_1705 ) ( CLEAR ?auto_1703 ) ( LIFTING ?auto_1704 ?auto_1702 ) ( IS-CRATE ?auto_1702 ) ( not ( = ?auto_1702 ?auto_1703 ) ) )
    :subtasks
    ( ( !DROP ?auto_1704 ?auto_1702 ?auto_1703 ?auto_1705 )
      ( MAKE-ON-VERIFY ?auto_1702 ?auto_1703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1706 - SURFACE
      ?auto_1707 - SURFACE
    )
    :vars
    (
      ?auto_1709 - HOIST
      ?auto_1708 - PLACE
      ?auto_1710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1709 ?auto_1708 ) ( SURFACE-AT ?auto_1707 ?auto_1708 ) ( CLEAR ?auto_1707 ) ( IS-CRATE ?auto_1706 ) ( not ( = ?auto_1706 ?auto_1707 ) ) ( TRUCK-AT ?auto_1710 ?auto_1708 ) ( AVAILABLE ?auto_1709 ) ( IN ?auto_1706 ?auto_1710 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1709 ?auto_1706 ?auto_1710 ?auto_1708 )
      ( MAKE-ON ?auto_1706 ?auto_1707 )
      ( MAKE-ON-VERIFY ?auto_1706 ?auto_1707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1711 - SURFACE
      ?auto_1712 - SURFACE
    )
    :vars
    (
      ?auto_1715 - HOIST
      ?auto_1713 - PLACE
      ?auto_1714 - TRUCK
      ?auto_1716 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1715 ?auto_1713 ) ( SURFACE-AT ?auto_1712 ?auto_1713 ) ( CLEAR ?auto_1712 ) ( IS-CRATE ?auto_1711 ) ( not ( = ?auto_1711 ?auto_1712 ) ) ( AVAILABLE ?auto_1715 ) ( IN ?auto_1711 ?auto_1714 ) ( TRUCK-AT ?auto_1714 ?auto_1716 ) ( not ( = ?auto_1716 ?auto_1713 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1714 ?auto_1716 ?auto_1713 )
      ( MAKE-ON ?auto_1711 ?auto_1712 )
      ( MAKE-ON-VERIFY ?auto_1711 ?auto_1712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1717 - SURFACE
      ?auto_1718 - SURFACE
    )
    :vars
    (
      ?auto_1720 - HOIST
      ?auto_1722 - PLACE
      ?auto_1719 - TRUCK
      ?auto_1721 - PLACE
      ?auto_1723 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1720 ?auto_1722 ) ( SURFACE-AT ?auto_1718 ?auto_1722 ) ( CLEAR ?auto_1718 ) ( IS-CRATE ?auto_1717 ) ( not ( = ?auto_1717 ?auto_1718 ) ) ( AVAILABLE ?auto_1720 ) ( TRUCK-AT ?auto_1719 ?auto_1721 ) ( not ( = ?auto_1721 ?auto_1722 ) ) ( HOIST-AT ?auto_1723 ?auto_1721 ) ( LIFTING ?auto_1723 ?auto_1717 ) ( not ( = ?auto_1720 ?auto_1723 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1723 ?auto_1717 ?auto_1719 ?auto_1721 )
      ( MAKE-ON ?auto_1717 ?auto_1718 )
      ( MAKE-ON-VERIFY ?auto_1717 ?auto_1718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1724 - SURFACE
      ?auto_1725 - SURFACE
    )
    :vars
    (
      ?auto_1727 - HOIST
      ?auto_1728 - PLACE
      ?auto_1730 - TRUCK
      ?auto_1726 - PLACE
      ?auto_1729 - HOIST
      ?auto_1731 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1727 ?auto_1728 ) ( SURFACE-AT ?auto_1725 ?auto_1728 ) ( CLEAR ?auto_1725 ) ( IS-CRATE ?auto_1724 ) ( not ( = ?auto_1724 ?auto_1725 ) ) ( AVAILABLE ?auto_1727 ) ( TRUCK-AT ?auto_1730 ?auto_1726 ) ( not ( = ?auto_1726 ?auto_1728 ) ) ( HOIST-AT ?auto_1729 ?auto_1726 ) ( not ( = ?auto_1727 ?auto_1729 ) ) ( AVAILABLE ?auto_1729 ) ( SURFACE-AT ?auto_1724 ?auto_1726 ) ( ON ?auto_1724 ?auto_1731 ) ( CLEAR ?auto_1724 ) ( not ( = ?auto_1724 ?auto_1731 ) ) ( not ( = ?auto_1725 ?auto_1731 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1729 ?auto_1724 ?auto_1731 ?auto_1726 )
      ( MAKE-ON ?auto_1724 ?auto_1725 )
      ( MAKE-ON-VERIFY ?auto_1724 ?auto_1725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1732 - SURFACE
      ?auto_1733 - SURFACE
    )
    :vars
    (
      ?auto_1735 - HOIST
      ?auto_1739 - PLACE
      ?auto_1736 - PLACE
      ?auto_1737 - HOIST
      ?auto_1738 - SURFACE
      ?auto_1734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1735 ?auto_1739 ) ( SURFACE-AT ?auto_1733 ?auto_1739 ) ( CLEAR ?auto_1733 ) ( IS-CRATE ?auto_1732 ) ( not ( = ?auto_1732 ?auto_1733 ) ) ( AVAILABLE ?auto_1735 ) ( not ( = ?auto_1736 ?auto_1739 ) ) ( HOIST-AT ?auto_1737 ?auto_1736 ) ( not ( = ?auto_1735 ?auto_1737 ) ) ( AVAILABLE ?auto_1737 ) ( SURFACE-AT ?auto_1732 ?auto_1736 ) ( ON ?auto_1732 ?auto_1738 ) ( CLEAR ?auto_1732 ) ( not ( = ?auto_1732 ?auto_1738 ) ) ( not ( = ?auto_1733 ?auto_1738 ) ) ( TRUCK-AT ?auto_1734 ?auto_1739 ) )
    :subtasks
    ( ( !DRIVE ?auto_1734 ?auto_1739 ?auto_1736 )
      ( MAKE-ON ?auto_1732 ?auto_1733 )
      ( MAKE-ON-VERIFY ?auto_1732 ?auto_1733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1740 - SURFACE
      ?auto_1741 - SURFACE
    )
    :vars
    (
      ?auto_1742 - HOIST
      ?auto_1744 - PLACE
      ?auto_1746 - PLACE
      ?auto_1745 - HOIST
      ?auto_1743 - SURFACE
      ?auto_1747 - TRUCK
      ?auto_1748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742 ?auto_1744 ) ( IS-CRATE ?auto_1740 ) ( not ( = ?auto_1740 ?auto_1741 ) ) ( not ( = ?auto_1746 ?auto_1744 ) ) ( HOIST-AT ?auto_1745 ?auto_1746 ) ( not ( = ?auto_1742 ?auto_1745 ) ) ( AVAILABLE ?auto_1745 ) ( SURFACE-AT ?auto_1740 ?auto_1746 ) ( ON ?auto_1740 ?auto_1743 ) ( CLEAR ?auto_1740 ) ( not ( = ?auto_1740 ?auto_1743 ) ) ( not ( = ?auto_1741 ?auto_1743 ) ) ( TRUCK-AT ?auto_1747 ?auto_1744 ) ( SURFACE-AT ?auto_1748 ?auto_1744 ) ( CLEAR ?auto_1748 ) ( LIFTING ?auto_1742 ?auto_1741 ) ( IS-CRATE ?auto_1741 ) ( not ( = ?auto_1740 ?auto_1748 ) ) ( not ( = ?auto_1741 ?auto_1748 ) ) ( not ( = ?auto_1743 ?auto_1748 ) ) )
    :subtasks
    ( ( !DROP ?auto_1742 ?auto_1741 ?auto_1748 ?auto_1744 )
      ( MAKE-ON ?auto_1740 ?auto_1741 )
      ( MAKE-ON-VERIFY ?auto_1740 ?auto_1741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1749 - SURFACE
      ?auto_1750 - SURFACE
    )
    :vars
    (
      ?auto_1755 - HOIST
      ?auto_1751 - PLACE
      ?auto_1752 - PLACE
      ?auto_1754 - HOIST
      ?auto_1757 - SURFACE
      ?auto_1753 - TRUCK
      ?auto_1756 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1755 ?auto_1751 ) ( IS-CRATE ?auto_1749 ) ( not ( = ?auto_1749 ?auto_1750 ) ) ( not ( = ?auto_1752 ?auto_1751 ) ) ( HOIST-AT ?auto_1754 ?auto_1752 ) ( not ( = ?auto_1755 ?auto_1754 ) ) ( AVAILABLE ?auto_1754 ) ( SURFACE-AT ?auto_1749 ?auto_1752 ) ( ON ?auto_1749 ?auto_1757 ) ( CLEAR ?auto_1749 ) ( not ( = ?auto_1749 ?auto_1757 ) ) ( not ( = ?auto_1750 ?auto_1757 ) ) ( TRUCK-AT ?auto_1753 ?auto_1751 ) ( SURFACE-AT ?auto_1756 ?auto_1751 ) ( CLEAR ?auto_1756 ) ( IS-CRATE ?auto_1750 ) ( not ( = ?auto_1749 ?auto_1756 ) ) ( not ( = ?auto_1750 ?auto_1756 ) ) ( not ( = ?auto_1757 ?auto_1756 ) ) ( AVAILABLE ?auto_1755 ) ( IN ?auto_1750 ?auto_1753 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1755 ?auto_1750 ?auto_1753 ?auto_1751 )
      ( MAKE-ON ?auto_1749 ?auto_1750 )
      ( MAKE-ON-VERIFY ?auto_1749 ?auto_1750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1758 - SURFACE
      ?auto_1759 - SURFACE
    )
    :vars
    (
      ?auto_1764 - HOIST
      ?auto_1761 - PLACE
      ?auto_1760 - PLACE
      ?auto_1762 - HOIST
      ?auto_1765 - SURFACE
      ?auto_1763 - SURFACE
      ?auto_1766 - TRUCK
      ?auto_1767 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1764 ?auto_1761 ) ( IS-CRATE ?auto_1758 ) ( not ( = ?auto_1758 ?auto_1759 ) ) ( not ( = ?auto_1760 ?auto_1761 ) ) ( HOIST-AT ?auto_1762 ?auto_1760 ) ( not ( = ?auto_1764 ?auto_1762 ) ) ( AVAILABLE ?auto_1762 ) ( SURFACE-AT ?auto_1758 ?auto_1760 ) ( ON ?auto_1758 ?auto_1765 ) ( CLEAR ?auto_1758 ) ( not ( = ?auto_1758 ?auto_1765 ) ) ( not ( = ?auto_1759 ?auto_1765 ) ) ( SURFACE-AT ?auto_1763 ?auto_1761 ) ( CLEAR ?auto_1763 ) ( IS-CRATE ?auto_1759 ) ( not ( = ?auto_1758 ?auto_1763 ) ) ( not ( = ?auto_1759 ?auto_1763 ) ) ( not ( = ?auto_1765 ?auto_1763 ) ) ( AVAILABLE ?auto_1764 ) ( IN ?auto_1759 ?auto_1766 ) ( TRUCK-AT ?auto_1766 ?auto_1767 ) ( not ( = ?auto_1767 ?auto_1761 ) ) ( not ( = ?auto_1760 ?auto_1767 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1766 ?auto_1767 ?auto_1761 )
      ( MAKE-ON ?auto_1758 ?auto_1759 )
      ( MAKE-ON-VERIFY ?auto_1758 ?auto_1759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1768 - SURFACE
      ?auto_1769 - SURFACE
    )
    :vars
    (
      ?auto_1773 - HOIST
      ?auto_1774 - PLACE
      ?auto_1777 - PLACE
      ?auto_1775 - HOIST
      ?auto_1770 - SURFACE
      ?auto_1772 - SURFACE
      ?auto_1776 - TRUCK
      ?auto_1771 - PLACE
      ?auto_1778 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1773 ?auto_1774 ) ( IS-CRATE ?auto_1768 ) ( not ( = ?auto_1768 ?auto_1769 ) ) ( not ( = ?auto_1777 ?auto_1774 ) ) ( HOIST-AT ?auto_1775 ?auto_1777 ) ( not ( = ?auto_1773 ?auto_1775 ) ) ( AVAILABLE ?auto_1775 ) ( SURFACE-AT ?auto_1768 ?auto_1777 ) ( ON ?auto_1768 ?auto_1770 ) ( CLEAR ?auto_1768 ) ( not ( = ?auto_1768 ?auto_1770 ) ) ( not ( = ?auto_1769 ?auto_1770 ) ) ( SURFACE-AT ?auto_1772 ?auto_1774 ) ( CLEAR ?auto_1772 ) ( IS-CRATE ?auto_1769 ) ( not ( = ?auto_1768 ?auto_1772 ) ) ( not ( = ?auto_1769 ?auto_1772 ) ) ( not ( = ?auto_1770 ?auto_1772 ) ) ( AVAILABLE ?auto_1773 ) ( TRUCK-AT ?auto_1776 ?auto_1771 ) ( not ( = ?auto_1771 ?auto_1774 ) ) ( not ( = ?auto_1777 ?auto_1771 ) ) ( HOIST-AT ?auto_1778 ?auto_1771 ) ( LIFTING ?auto_1778 ?auto_1769 ) ( not ( = ?auto_1773 ?auto_1778 ) ) ( not ( = ?auto_1775 ?auto_1778 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1778 ?auto_1769 ?auto_1776 ?auto_1771 )
      ( MAKE-ON ?auto_1768 ?auto_1769 )
      ( MAKE-ON-VERIFY ?auto_1768 ?auto_1769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1779 - SURFACE
      ?auto_1780 - SURFACE
    )
    :vars
    (
      ?auto_1788 - HOIST
      ?auto_1783 - PLACE
      ?auto_1785 - PLACE
      ?auto_1789 - HOIST
      ?auto_1782 - SURFACE
      ?auto_1787 - SURFACE
      ?auto_1786 - TRUCK
      ?auto_1784 - PLACE
      ?auto_1781 - HOIST
      ?auto_1790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1788 ?auto_1783 ) ( IS-CRATE ?auto_1779 ) ( not ( = ?auto_1779 ?auto_1780 ) ) ( not ( = ?auto_1785 ?auto_1783 ) ) ( HOIST-AT ?auto_1789 ?auto_1785 ) ( not ( = ?auto_1788 ?auto_1789 ) ) ( AVAILABLE ?auto_1789 ) ( SURFACE-AT ?auto_1779 ?auto_1785 ) ( ON ?auto_1779 ?auto_1782 ) ( CLEAR ?auto_1779 ) ( not ( = ?auto_1779 ?auto_1782 ) ) ( not ( = ?auto_1780 ?auto_1782 ) ) ( SURFACE-AT ?auto_1787 ?auto_1783 ) ( CLEAR ?auto_1787 ) ( IS-CRATE ?auto_1780 ) ( not ( = ?auto_1779 ?auto_1787 ) ) ( not ( = ?auto_1780 ?auto_1787 ) ) ( not ( = ?auto_1782 ?auto_1787 ) ) ( AVAILABLE ?auto_1788 ) ( TRUCK-AT ?auto_1786 ?auto_1784 ) ( not ( = ?auto_1784 ?auto_1783 ) ) ( not ( = ?auto_1785 ?auto_1784 ) ) ( HOIST-AT ?auto_1781 ?auto_1784 ) ( not ( = ?auto_1788 ?auto_1781 ) ) ( not ( = ?auto_1789 ?auto_1781 ) ) ( AVAILABLE ?auto_1781 ) ( SURFACE-AT ?auto_1780 ?auto_1784 ) ( ON ?auto_1780 ?auto_1790 ) ( CLEAR ?auto_1780 ) ( not ( = ?auto_1779 ?auto_1790 ) ) ( not ( = ?auto_1780 ?auto_1790 ) ) ( not ( = ?auto_1782 ?auto_1790 ) ) ( not ( = ?auto_1787 ?auto_1790 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1781 ?auto_1780 ?auto_1790 ?auto_1784 )
      ( MAKE-ON ?auto_1779 ?auto_1780 )
      ( MAKE-ON-VERIFY ?auto_1779 ?auto_1780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1791 - SURFACE
      ?auto_1792 - SURFACE
    )
    :vars
    (
      ?auto_1802 - HOIST
      ?auto_1798 - PLACE
      ?auto_1801 - PLACE
      ?auto_1799 - HOIST
      ?auto_1797 - SURFACE
      ?auto_1796 - SURFACE
      ?auto_1794 - PLACE
      ?auto_1795 - HOIST
      ?auto_1800 - SURFACE
      ?auto_1793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1802 ?auto_1798 ) ( IS-CRATE ?auto_1791 ) ( not ( = ?auto_1791 ?auto_1792 ) ) ( not ( = ?auto_1801 ?auto_1798 ) ) ( HOIST-AT ?auto_1799 ?auto_1801 ) ( not ( = ?auto_1802 ?auto_1799 ) ) ( AVAILABLE ?auto_1799 ) ( SURFACE-AT ?auto_1791 ?auto_1801 ) ( ON ?auto_1791 ?auto_1797 ) ( CLEAR ?auto_1791 ) ( not ( = ?auto_1791 ?auto_1797 ) ) ( not ( = ?auto_1792 ?auto_1797 ) ) ( SURFACE-AT ?auto_1796 ?auto_1798 ) ( CLEAR ?auto_1796 ) ( IS-CRATE ?auto_1792 ) ( not ( = ?auto_1791 ?auto_1796 ) ) ( not ( = ?auto_1792 ?auto_1796 ) ) ( not ( = ?auto_1797 ?auto_1796 ) ) ( AVAILABLE ?auto_1802 ) ( not ( = ?auto_1794 ?auto_1798 ) ) ( not ( = ?auto_1801 ?auto_1794 ) ) ( HOIST-AT ?auto_1795 ?auto_1794 ) ( not ( = ?auto_1802 ?auto_1795 ) ) ( not ( = ?auto_1799 ?auto_1795 ) ) ( AVAILABLE ?auto_1795 ) ( SURFACE-AT ?auto_1792 ?auto_1794 ) ( ON ?auto_1792 ?auto_1800 ) ( CLEAR ?auto_1792 ) ( not ( = ?auto_1791 ?auto_1800 ) ) ( not ( = ?auto_1792 ?auto_1800 ) ) ( not ( = ?auto_1797 ?auto_1800 ) ) ( not ( = ?auto_1796 ?auto_1800 ) ) ( TRUCK-AT ?auto_1793 ?auto_1798 ) )
    :subtasks
    ( ( !DRIVE ?auto_1793 ?auto_1798 ?auto_1794 )
      ( MAKE-ON ?auto_1791 ?auto_1792 )
      ( MAKE-ON-VERIFY ?auto_1791 ?auto_1792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1805 - SURFACE
      ?auto_1806 - SURFACE
    )
    :vars
    (
      ?auto_1807 - HOIST
      ?auto_1808 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1807 ?auto_1808 ) ( SURFACE-AT ?auto_1806 ?auto_1808 ) ( CLEAR ?auto_1806 ) ( LIFTING ?auto_1807 ?auto_1805 ) ( IS-CRATE ?auto_1805 ) ( not ( = ?auto_1805 ?auto_1806 ) ) )
    :subtasks
    ( ( !DROP ?auto_1807 ?auto_1805 ?auto_1806 ?auto_1808 )
      ( MAKE-ON-VERIFY ?auto_1805 ?auto_1806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1809 - SURFACE
      ?auto_1810 - SURFACE
    )
    :vars
    (
      ?auto_1812 - HOIST
      ?auto_1811 - PLACE
      ?auto_1813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1812 ?auto_1811 ) ( SURFACE-AT ?auto_1810 ?auto_1811 ) ( CLEAR ?auto_1810 ) ( IS-CRATE ?auto_1809 ) ( not ( = ?auto_1809 ?auto_1810 ) ) ( TRUCK-AT ?auto_1813 ?auto_1811 ) ( AVAILABLE ?auto_1812 ) ( IN ?auto_1809 ?auto_1813 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1812 ?auto_1809 ?auto_1813 ?auto_1811 )
      ( MAKE-ON ?auto_1809 ?auto_1810 )
      ( MAKE-ON-VERIFY ?auto_1809 ?auto_1810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1814 - SURFACE
      ?auto_1815 - SURFACE
    )
    :vars
    (
      ?auto_1818 - HOIST
      ?auto_1816 - PLACE
      ?auto_1817 - TRUCK
      ?auto_1819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1818 ?auto_1816 ) ( SURFACE-AT ?auto_1815 ?auto_1816 ) ( CLEAR ?auto_1815 ) ( IS-CRATE ?auto_1814 ) ( not ( = ?auto_1814 ?auto_1815 ) ) ( AVAILABLE ?auto_1818 ) ( IN ?auto_1814 ?auto_1817 ) ( TRUCK-AT ?auto_1817 ?auto_1819 ) ( not ( = ?auto_1819 ?auto_1816 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1817 ?auto_1819 ?auto_1816 )
      ( MAKE-ON ?auto_1814 ?auto_1815 )
      ( MAKE-ON-VERIFY ?auto_1814 ?auto_1815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1820 - SURFACE
      ?auto_1821 - SURFACE
    )
    :vars
    (
      ?auto_1823 - HOIST
      ?auto_1822 - PLACE
      ?auto_1824 - TRUCK
      ?auto_1825 - PLACE
      ?auto_1826 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1823 ?auto_1822 ) ( SURFACE-AT ?auto_1821 ?auto_1822 ) ( CLEAR ?auto_1821 ) ( IS-CRATE ?auto_1820 ) ( not ( = ?auto_1820 ?auto_1821 ) ) ( AVAILABLE ?auto_1823 ) ( TRUCK-AT ?auto_1824 ?auto_1825 ) ( not ( = ?auto_1825 ?auto_1822 ) ) ( HOIST-AT ?auto_1826 ?auto_1825 ) ( LIFTING ?auto_1826 ?auto_1820 ) ( not ( = ?auto_1823 ?auto_1826 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1826 ?auto_1820 ?auto_1824 ?auto_1825 )
      ( MAKE-ON ?auto_1820 ?auto_1821 )
      ( MAKE-ON-VERIFY ?auto_1820 ?auto_1821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1827 - SURFACE
      ?auto_1828 - SURFACE
    )
    :vars
    (
      ?auto_1831 - HOIST
      ?auto_1833 - PLACE
      ?auto_1829 - TRUCK
      ?auto_1832 - PLACE
      ?auto_1830 - HOIST
      ?auto_1834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1831 ?auto_1833 ) ( SURFACE-AT ?auto_1828 ?auto_1833 ) ( CLEAR ?auto_1828 ) ( IS-CRATE ?auto_1827 ) ( not ( = ?auto_1827 ?auto_1828 ) ) ( AVAILABLE ?auto_1831 ) ( TRUCK-AT ?auto_1829 ?auto_1832 ) ( not ( = ?auto_1832 ?auto_1833 ) ) ( HOIST-AT ?auto_1830 ?auto_1832 ) ( not ( = ?auto_1831 ?auto_1830 ) ) ( AVAILABLE ?auto_1830 ) ( SURFACE-AT ?auto_1827 ?auto_1832 ) ( ON ?auto_1827 ?auto_1834 ) ( CLEAR ?auto_1827 ) ( not ( = ?auto_1827 ?auto_1834 ) ) ( not ( = ?auto_1828 ?auto_1834 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1830 ?auto_1827 ?auto_1834 ?auto_1832 )
      ( MAKE-ON ?auto_1827 ?auto_1828 )
      ( MAKE-ON-VERIFY ?auto_1827 ?auto_1828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1835 - SURFACE
      ?auto_1836 - SURFACE
    )
    :vars
    (
      ?auto_1840 - HOIST
      ?auto_1837 - PLACE
      ?auto_1842 - PLACE
      ?auto_1841 - HOIST
      ?auto_1839 - SURFACE
      ?auto_1838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1840 ?auto_1837 ) ( SURFACE-AT ?auto_1836 ?auto_1837 ) ( CLEAR ?auto_1836 ) ( IS-CRATE ?auto_1835 ) ( not ( = ?auto_1835 ?auto_1836 ) ) ( AVAILABLE ?auto_1840 ) ( not ( = ?auto_1842 ?auto_1837 ) ) ( HOIST-AT ?auto_1841 ?auto_1842 ) ( not ( = ?auto_1840 ?auto_1841 ) ) ( AVAILABLE ?auto_1841 ) ( SURFACE-AT ?auto_1835 ?auto_1842 ) ( ON ?auto_1835 ?auto_1839 ) ( CLEAR ?auto_1835 ) ( not ( = ?auto_1835 ?auto_1839 ) ) ( not ( = ?auto_1836 ?auto_1839 ) ) ( TRUCK-AT ?auto_1838 ?auto_1837 ) )
    :subtasks
    ( ( !DRIVE ?auto_1838 ?auto_1837 ?auto_1842 )
      ( MAKE-ON ?auto_1835 ?auto_1836 )
      ( MAKE-ON-VERIFY ?auto_1835 ?auto_1836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1843 - SURFACE
      ?auto_1844 - SURFACE
    )
    :vars
    (
      ?auto_1850 - HOIST
      ?auto_1849 - PLACE
      ?auto_1847 - PLACE
      ?auto_1846 - HOIST
      ?auto_1845 - SURFACE
      ?auto_1848 - TRUCK
      ?auto_1851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1850 ?auto_1849 ) ( IS-CRATE ?auto_1843 ) ( not ( = ?auto_1843 ?auto_1844 ) ) ( not ( = ?auto_1847 ?auto_1849 ) ) ( HOIST-AT ?auto_1846 ?auto_1847 ) ( not ( = ?auto_1850 ?auto_1846 ) ) ( AVAILABLE ?auto_1846 ) ( SURFACE-AT ?auto_1843 ?auto_1847 ) ( ON ?auto_1843 ?auto_1845 ) ( CLEAR ?auto_1843 ) ( not ( = ?auto_1843 ?auto_1845 ) ) ( not ( = ?auto_1844 ?auto_1845 ) ) ( TRUCK-AT ?auto_1848 ?auto_1849 ) ( SURFACE-AT ?auto_1851 ?auto_1849 ) ( CLEAR ?auto_1851 ) ( LIFTING ?auto_1850 ?auto_1844 ) ( IS-CRATE ?auto_1844 ) ( not ( = ?auto_1843 ?auto_1851 ) ) ( not ( = ?auto_1844 ?auto_1851 ) ) ( not ( = ?auto_1845 ?auto_1851 ) ) )
    :subtasks
    ( ( !DROP ?auto_1850 ?auto_1844 ?auto_1851 ?auto_1849 )
      ( MAKE-ON ?auto_1843 ?auto_1844 )
      ( MAKE-ON-VERIFY ?auto_1843 ?auto_1844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1852 - SURFACE
      ?auto_1853 - SURFACE
    )
    :vars
    (
      ?auto_1858 - HOIST
      ?auto_1854 - PLACE
      ?auto_1857 - PLACE
      ?auto_1856 - HOIST
      ?auto_1859 - SURFACE
      ?auto_1860 - TRUCK
      ?auto_1855 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1858 ?auto_1854 ) ( IS-CRATE ?auto_1852 ) ( not ( = ?auto_1852 ?auto_1853 ) ) ( not ( = ?auto_1857 ?auto_1854 ) ) ( HOIST-AT ?auto_1856 ?auto_1857 ) ( not ( = ?auto_1858 ?auto_1856 ) ) ( AVAILABLE ?auto_1856 ) ( SURFACE-AT ?auto_1852 ?auto_1857 ) ( ON ?auto_1852 ?auto_1859 ) ( CLEAR ?auto_1852 ) ( not ( = ?auto_1852 ?auto_1859 ) ) ( not ( = ?auto_1853 ?auto_1859 ) ) ( TRUCK-AT ?auto_1860 ?auto_1854 ) ( SURFACE-AT ?auto_1855 ?auto_1854 ) ( CLEAR ?auto_1855 ) ( IS-CRATE ?auto_1853 ) ( not ( = ?auto_1852 ?auto_1855 ) ) ( not ( = ?auto_1853 ?auto_1855 ) ) ( not ( = ?auto_1859 ?auto_1855 ) ) ( AVAILABLE ?auto_1858 ) ( IN ?auto_1853 ?auto_1860 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1858 ?auto_1853 ?auto_1860 ?auto_1854 )
      ( MAKE-ON ?auto_1852 ?auto_1853 )
      ( MAKE-ON-VERIFY ?auto_1852 ?auto_1853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1861 - SURFACE
      ?auto_1862 - SURFACE
    )
    :vars
    (
      ?auto_1869 - HOIST
      ?auto_1866 - PLACE
      ?auto_1863 - PLACE
      ?auto_1864 - HOIST
      ?auto_1867 - SURFACE
      ?auto_1868 - SURFACE
      ?auto_1865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1869 ?auto_1866 ) ( IS-CRATE ?auto_1861 ) ( not ( = ?auto_1861 ?auto_1862 ) ) ( not ( = ?auto_1863 ?auto_1866 ) ) ( HOIST-AT ?auto_1864 ?auto_1863 ) ( not ( = ?auto_1869 ?auto_1864 ) ) ( AVAILABLE ?auto_1864 ) ( SURFACE-AT ?auto_1861 ?auto_1863 ) ( ON ?auto_1861 ?auto_1867 ) ( CLEAR ?auto_1861 ) ( not ( = ?auto_1861 ?auto_1867 ) ) ( not ( = ?auto_1862 ?auto_1867 ) ) ( SURFACE-AT ?auto_1868 ?auto_1866 ) ( CLEAR ?auto_1868 ) ( IS-CRATE ?auto_1862 ) ( not ( = ?auto_1861 ?auto_1868 ) ) ( not ( = ?auto_1862 ?auto_1868 ) ) ( not ( = ?auto_1867 ?auto_1868 ) ) ( AVAILABLE ?auto_1869 ) ( IN ?auto_1862 ?auto_1865 ) ( TRUCK-AT ?auto_1865 ?auto_1863 ) )
    :subtasks
    ( ( !DRIVE ?auto_1865 ?auto_1863 ?auto_1866 )
      ( MAKE-ON ?auto_1861 ?auto_1862 )
      ( MAKE-ON-VERIFY ?auto_1861 ?auto_1862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1870 - SURFACE
      ?auto_1871 - SURFACE
    )
    :vars
    (
      ?auto_1877 - HOIST
      ?auto_1873 - PLACE
      ?auto_1874 - PLACE
      ?auto_1875 - HOIST
      ?auto_1872 - SURFACE
      ?auto_1878 - SURFACE
      ?auto_1876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1877 ?auto_1873 ) ( IS-CRATE ?auto_1870 ) ( not ( = ?auto_1870 ?auto_1871 ) ) ( not ( = ?auto_1874 ?auto_1873 ) ) ( HOIST-AT ?auto_1875 ?auto_1874 ) ( not ( = ?auto_1877 ?auto_1875 ) ) ( SURFACE-AT ?auto_1870 ?auto_1874 ) ( ON ?auto_1870 ?auto_1872 ) ( CLEAR ?auto_1870 ) ( not ( = ?auto_1870 ?auto_1872 ) ) ( not ( = ?auto_1871 ?auto_1872 ) ) ( SURFACE-AT ?auto_1878 ?auto_1873 ) ( CLEAR ?auto_1878 ) ( IS-CRATE ?auto_1871 ) ( not ( = ?auto_1870 ?auto_1878 ) ) ( not ( = ?auto_1871 ?auto_1878 ) ) ( not ( = ?auto_1872 ?auto_1878 ) ) ( AVAILABLE ?auto_1877 ) ( TRUCK-AT ?auto_1876 ?auto_1874 ) ( LIFTING ?auto_1875 ?auto_1871 ) )
    :subtasks
    ( ( !LOAD ?auto_1875 ?auto_1871 ?auto_1876 ?auto_1874 )
      ( MAKE-ON ?auto_1870 ?auto_1871 )
      ( MAKE-ON-VERIFY ?auto_1870 ?auto_1871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1879 - SURFACE
      ?auto_1880 - SURFACE
    )
    :vars
    (
      ?auto_1886 - HOIST
      ?auto_1882 - PLACE
      ?auto_1883 - PLACE
      ?auto_1887 - HOIST
      ?auto_1881 - SURFACE
      ?auto_1884 - SURFACE
      ?auto_1885 - TRUCK
      ?auto_1888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1886 ?auto_1882 ) ( IS-CRATE ?auto_1879 ) ( not ( = ?auto_1879 ?auto_1880 ) ) ( not ( = ?auto_1883 ?auto_1882 ) ) ( HOIST-AT ?auto_1887 ?auto_1883 ) ( not ( = ?auto_1886 ?auto_1887 ) ) ( SURFACE-AT ?auto_1879 ?auto_1883 ) ( ON ?auto_1879 ?auto_1881 ) ( CLEAR ?auto_1879 ) ( not ( = ?auto_1879 ?auto_1881 ) ) ( not ( = ?auto_1880 ?auto_1881 ) ) ( SURFACE-AT ?auto_1884 ?auto_1882 ) ( CLEAR ?auto_1884 ) ( IS-CRATE ?auto_1880 ) ( not ( = ?auto_1879 ?auto_1884 ) ) ( not ( = ?auto_1880 ?auto_1884 ) ) ( not ( = ?auto_1881 ?auto_1884 ) ) ( AVAILABLE ?auto_1886 ) ( TRUCK-AT ?auto_1885 ?auto_1883 ) ( AVAILABLE ?auto_1887 ) ( SURFACE-AT ?auto_1880 ?auto_1883 ) ( ON ?auto_1880 ?auto_1888 ) ( CLEAR ?auto_1880 ) ( not ( = ?auto_1879 ?auto_1888 ) ) ( not ( = ?auto_1880 ?auto_1888 ) ) ( not ( = ?auto_1881 ?auto_1888 ) ) ( not ( = ?auto_1884 ?auto_1888 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1887 ?auto_1880 ?auto_1888 ?auto_1883 )
      ( MAKE-ON ?auto_1879 ?auto_1880 )
      ( MAKE-ON-VERIFY ?auto_1879 ?auto_1880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1889 - SURFACE
      ?auto_1890 - SURFACE
    )
    :vars
    (
      ?auto_1892 - HOIST
      ?auto_1891 - PLACE
      ?auto_1898 - PLACE
      ?auto_1896 - HOIST
      ?auto_1897 - SURFACE
      ?auto_1893 - SURFACE
      ?auto_1894 - SURFACE
      ?auto_1895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1892 ?auto_1891 ) ( IS-CRATE ?auto_1889 ) ( not ( = ?auto_1889 ?auto_1890 ) ) ( not ( = ?auto_1898 ?auto_1891 ) ) ( HOIST-AT ?auto_1896 ?auto_1898 ) ( not ( = ?auto_1892 ?auto_1896 ) ) ( SURFACE-AT ?auto_1889 ?auto_1898 ) ( ON ?auto_1889 ?auto_1897 ) ( CLEAR ?auto_1889 ) ( not ( = ?auto_1889 ?auto_1897 ) ) ( not ( = ?auto_1890 ?auto_1897 ) ) ( SURFACE-AT ?auto_1893 ?auto_1891 ) ( CLEAR ?auto_1893 ) ( IS-CRATE ?auto_1890 ) ( not ( = ?auto_1889 ?auto_1893 ) ) ( not ( = ?auto_1890 ?auto_1893 ) ) ( not ( = ?auto_1897 ?auto_1893 ) ) ( AVAILABLE ?auto_1892 ) ( AVAILABLE ?auto_1896 ) ( SURFACE-AT ?auto_1890 ?auto_1898 ) ( ON ?auto_1890 ?auto_1894 ) ( CLEAR ?auto_1890 ) ( not ( = ?auto_1889 ?auto_1894 ) ) ( not ( = ?auto_1890 ?auto_1894 ) ) ( not ( = ?auto_1897 ?auto_1894 ) ) ( not ( = ?auto_1893 ?auto_1894 ) ) ( TRUCK-AT ?auto_1895 ?auto_1891 ) )
    :subtasks
    ( ( !DRIVE ?auto_1895 ?auto_1891 ?auto_1898 )
      ( MAKE-ON ?auto_1889 ?auto_1890 )
      ( MAKE-ON-VERIFY ?auto_1889 ?auto_1890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1899 - SURFACE
      ?auto_1900 - SURFACE
    )
    :vars
    (
      ?auto_1904 - HOIST
      ?auto_1905 - PLACE
      ?auto_1901 - PLACE
      ?auto_1906 - HOIST
      ?auto_1902 - SURFACE
      ?auto_1903 - SURFACE
      ?auto_1908 - SURFACE
      ?auto_1907 - TRUCK
      ?auto_1909 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1904 ?auto_1905 ) ( IS-CRATE ?auto_1899 ) ( not ( = ?auto_1899 ?auto_1900 ) ) ( not ( = ?auto_1901 ?auto_1905 ) ) ( HOIST-AT ?auto_1906 ?auto_1901 ) ( not ( = ?auto_1904 ?auto_1906 ) ) ( SURFACE-AT ?auto_1899 ?auto_1901 ) ( ON ?auto_1899 ?auto_1902 ) ( CLEAR ?auto_1899 ) ( not ( = ?auto_1899 ?auto_1902 ) ) ( not ( = ?auto_1900 ?auto_1902 ) ) ( IS-CRATE ?auto_1900 ) ( not ( = ?auto_1899 ?auto_1903 ) ) ( not ( = ?auto_1900 ?auto_1903 ) ) ( not ( = ?auto_1902 ?auto_1903 ) ) ( AVAILABLE ?auto_1906 ) ( SURFACE-AT ?auto_1900 ?auto_1901 ) ( ON ?auto_1900 ?auto_1908 ) ( CLEAR ?auto_1900 ) ( not ( = ?auto_1899 ?auto_1908 ) ) ( not ( = ?auto_1900 ?auto_1908 ) ) ( not ( = ?auto_1902 ?auto_1908 ) ) ( not ( = ?auto_1903 ?auto_1908 ) ) ( TRUCK-AT ?auto_1907 ?auto_1905 ) ( SURFACE-AT ?auto_1909 ?auto_1905 ) ( CLEAR ?auto_1909 ) ( LIFTING ?auto_1904 ?auto_1903 ) ( IS-CRATE ?auto_1903 ) ( not ( = ?auto_1899 ?auto_1909 ) ) ( not ( = ?auto_1900 ?auto_1909 ) ) ( not ( = ?auto_1902 ?auto_1909 ) ) ( not ( = ?auto_1903 ?auto_1909 ) ) ( not ( = ?auto_1908 ?auto_1909 ) ) )
    :subtasks
    ( ( !DROP ?auto_1904 ?auto_1903 ?auto_1909 ?auto_1905 )
      ( MAKE-ON ?auto_1899 ?auto_1900 )
      ( MAKE-ON-VERIFY ?auto_1899 ?auto_1900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1910 - SURFACE
      ?auto_1911 - SURFACE
    )
    :vars
    (
      ?auto_1912 - HOIST
      ?auto_1919 - PLACE
      ?auto_1914 - PLACE
      ?auto_1918 - HOIST
      ?auto_1916 - SURFACE
      ?auto_1920 - SURFACE
      ?auto_1917 - SURFACE
      ?auto_1913 - TRUCK
      ?auto_1915 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1912 ?auto_1919 ) ( IS-CRATE ?auto_1910 ) ( not ( = ?auto_1910 ?auto_1911 ) ) ( not ( = ?auto_1914 ?auto_1919 ) ) ( HOIST-AT ?auto_1918 ?auto_1914 ) ( not ( = ?auto_1912 ?auto_1918 ) ) ( SURFACE-AT ?auto_1910 ?auto_1914 ) ( ON ?auto_1910 ?auto_1916 ) ( CLEAR ?auto_1910 ) ( not ( = ?auto_1910 ?auto_1916 ) ) ( not ( = ?auto_1911 ?auto_1916 ) ) ( IS-CRATE ?auto_1911 ) ( not ( = ?auto_1910 ?auto_1920 ) ) ( not ( = ?auto_1911 ?auto_1920 ) ) ( not ( = ?auto_1916 ?auto_1920 ) ) ( AVAILABLE ?auto_1918 ) ( SURFACE-AT ?auto_1911 ?auto_1914 ) ( ON ?auto_1911 ?auto_1917 ) ( CLEAR ?auto_1911 ) ( not ( = ?auto_1910 ?auto_1917 ) ) ( not ( = ?auto_1911 ?auto_1917 ) ) ( not ( = ?auto_1916 ?auto_1917 ) ) ( not ( = ?auto_1920 ?auto_1917 ) ) ( TRUCK-AT ?auto_1913 ?auto_1919 ) ( SURFACE-AT ?auto_1915 ?auto_1919 ) ( CLEAR ?auto_1915 ) ( IS-CRATE ?auto_1920 ) ( not ( = ?auto_1910 ?auto_1915 ) ) ( not ( = ?auto_1911 ?auto_1915 ) ) ( not ( = ?auto_1916 ?auto_1915 ) ) ( not ( = ?auto_1920 ?auto_1915 ) ) ( not ( = ?auto_1917 ?auto_1915 ) ) ( AVAILABLE ?auto_1912 ) ( IN ?auto_1920 ?auto_1913 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1912 ?auto_1920 ?auto_1913 ?auto_1919 )
      ( MAKE-ON ?auto_1910 ?auto_1911 )
      ( MAKE-ON-VERIFY ?auto_1910 ?auto_1911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1921 - SURFACE
      ?auto_1922 - SURFACE
    )
    :vars
    (
      ?auto_1929 - HOIST
      ?auto_1926 - PLACE
      ?auto_1931 - PLACE
      ?auto_1923 - HOIST
      ?auto_1928 - SURFACE
      ?auto_1924 - SURFACE
      ?auto_1927 - SURFACE
      ?auto_1930 - SURFACE
      ?auto_1925 - TRUCK
      ?auto_1932 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929 ?auto_1926 ) ( IS-CRATE ?auto_1921 ) ( not ( = ?auto_1921 ?auto_1922 ) ) ( not ( = ?auto_1931 ?auto_1926 ) ) ( HOIST-AT ?auto_1923 ?auto_1931 ) ( not ( = ?auto_1929 ?auto_1923 ) ) ( SURFACE-AT ?auto_1921 ?auto_1931 ) ( ON ?auto_1921 ?auto_1928 ) ( CLEAR ?auto_1921 ) ( not ( = ?auto_1921 ?auto_1928 ) ) ( not ( = ?auto_1922 ?auto_1928 ) ) ( IS-CRATE ?auto_1922 ) ( not ( = ?auto_1921 ?auto_1924 ) ) ( not ( = ?auto_1922 ?auto_1924 ) ) ( not ( = ?auto_1928 ?auto_1924 ) ) ( AVAILABLE ?auto_1923 ) ( SURFACE-AT ?auto_1922 ?auto_1931 ) ( ON ?auto_1922 ?auto_1927 ) ( CLEAR ?auto_1922 ) ( not ( = ?auto_1921 ?auto_1927 ) ) ( not ( = ?auto_1922 ?auto_1927 ) ) ( not ( = ?auto_1928 ?auto_1927 ) ) ( not ( = ?auto_1924 ?auto_1927 ) ) ( SURFACE-AT ?auto_1930 ?auto_1926 ) ( CLEAR ?auto_1930 ) ( IS-CRATE ?auto_1924 ) ( not ( = ?auto_1921 ?auto_1930 ) ) ( not ( = ?auto_1922 ?auto_1930 ) ) ( not ( = ?auto_1928 ?auto_1930 ) ) ( not ( = ?auto_1924 ?auto_1930 ) ) ( not ( = ?auto_1927 ?auto_1930 ) ) ( AVAILABLE ?auto_1929 ) ( IN ?auto_1924 ?auto_1925 ) ( TRUCK-AT ?auto_1925 ?auto_1932 ) ( not ( = ?auto_1932 ?auto_1926 ) ) ( not ( = ?auto_1931 ?auto_1932 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1925 ?auto_1932 ?auto_1926 )
      ( MAKE-ON ?auto_1921 ?auto_1922 )
      ( MAKE-ON-VERIFY ?auto_1921 ?auto_1922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1933 - SURFACE
      ?auto_1934 - SURFACE
    )
    :vars
    (
      ?auto_1939 - HOIST
      ?auto_1944 - PLACE
      ?auto_1941 - PLACE
      ?auto_1938 - HOIST
      ?auto_1935 - SURFACE
      ?auto_1943 - SURFACE
      ?auto_1942 - SURFACE
      ?auto_1936 - SURFACE
      ?auto_1937 - TRUCK
      ?auto_1940 - PLACE
      ?auto_1945 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1939 ?auto_1944 ) ( IS-CRATE ?auto_1933 ) ( not ( = ?auto_1933 ?auto_1934 ) ) ( not ( = ?auto_1941 ?auto_1944 ) ) ( HOIST-AT ?auto_1938 ?auto_1941 ) ( not ( = ?auto_1939 ?auto_1938 ) ) ( SURFACE-AT ?auto_1933 ?auto_1941 ) ( ON ?auto_1933 ?auto_1935 ) ( CLEAR ?auto_1933 ) ( not ( = ?auto_1933 ?auto_1935 ) ) ( not ( = ?auto_1934 ?auto_1935 ) ) ( IS-CRATE ?auto_1934 ) ( not ( = ?auto_1933 ?auto_1943 ) ) ( not ( = ?auto_1934 ?auto_1943 ) ) ( not ( = ?auto_1935 ?auto_1943 ) ) ( AVAILABLE ?auto_1938 ) ( SURFACE-AT ?auto_1934 ?auto_1941 ) ( ON ?auto_1934 ?auto_1942 ) ( CLEAR ?auto_1934 ) ( not ( = ?auto_1933 ?auto_1942 ) ) ( not ( = ?auto_1934 ?auto_1942 ) ) ( not ( = ?auto_1935 ?auto_1942 ) ) ( not ( = ?auto_1943 ?auto_1942 ) ) ( SURFACE-AT ?auto_1936 ?auto_1944 ) ( CLEAR ?auto_1936 ) ( IS-CRATE ?auto_1943 ) ( not ( = ?auto_1933 ?auto_1936 ) ) ( not ( = ?auto_1934 ?auto_1936 ) ) ( not ( = ?auto_1935 ?auto_1936 ) ) ( not ( = ?auto_1943 ?auto_1936 ) ) ( not ( = ?auto_1942 ?auto_1936 ) ) ( AVAILABLE ?auto_1939 ) ( TRUCK-AT ?auto_1937 ?auto_1940 ) ( not ( = ?auto_1940 ?auto_1944 ) ) ( not ( = ?auto_1941 ?auto_1940 ) ) ( HOIST-AT ?auto_1945 ?auto_1940 ) ( LIFTING ?auto_1945 ?auto_1943 ) ( not ( = ?auto_1939 ?auto_1945 ) ) ( not ( = ?auto_1938 ?auto_1945 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1945 ?auto_1943 ?auto_1937 ?auto_1940 )
      ( MAKE-ON ?auto_1933 ?auto_1934 )
      ( MAKE-ON-VERIFY ?auto_1933 ?auto_1934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1946 - SURFACE
      ?auto_1947 - SURFACE
    )
    :vars
    (
      ?auto_1948 - HOIST
      ?auto_1950 - PLACE
      ?auto_1953 - PLACE
      ?auto_1951 - HOIST
      ?auto_1956 - SURFACE
      ?auto_1954 - SURFACE
      ?auto_1957 - SURFACE
      ?auto_1949 - SURFACE
      ?auto_1958 - TRUCK
      ?auto_1955 - PLACE
      ?auto_1952 - HOIST
      ?auto_1959 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1948 ?auto_1950 ) ( IS-CRATE ?auto_1946 ) ( not ( = ?auto_1946 ?auto_1947 ) ) ( not ( = ?auto_1953 ?auto_1950 ) ) ( HOIST-AT ?auto_1951 ?auto_1953 ) ( not ( = ?auto_1948 ?auto_1951 ) ) ( SURFACE-AT ?auto_1946 ?auto_1953 ) ( ON ?auto_1946 ?auto_1956 ) ( CLEAR ?auto_1946 ) ( not ( = ?auto_1946 ?auto_1956 ) ) ( not ( = ?auto_1947 ?auto_1956 ) ) ( IS-CRATE ?auto_1947 ) ( not ( = ?auto_1946 ?auto_1954 ) ) ( not ( = ?auto_1947 ?auto_1954 ) ) ( not ( = ?auto_1956 ?auto_1954 ) ) ( AVAILABLE ?auto_1951 ) ( SURFACE-AT ?auto_1947 ?auto_1953 ) ( ON ?auto_1947 ?auto_1957 ) ( CLEAR ?auto_1947 ) ( not ( = ?auto_1946 ?auto_1957 ) ) ( not ( = ?auto_1947 ?auto_1957 ) ) ( not ( = ?auto_1956 ?auto_1957 ) ) ( not ( = ?auto_1954 ?auto_1957 ) ) ( SURFACE-AT ?auto_1949 ?auto_1950 ) ( CLEAR ?auto_1949 ) ( IS-CRATE ?auto_1954 ) ( not ( = ?auto_1946 ?auto_1949 ) ) ( not ( = ?auto_1947 ?auto_1949 ) ) ( not ( = ?auto_1956 ?auto_1949 ) ) ( not ( = ?auto_1954 ?auto_1949 ) ) ( not ( = ?auto_1957 ?auto_1949 ) ) ( AVAILABLE ?auto_1948 ) ( TRUCK-AT ?auto_1958 ?auto_1955 ) ( not ( = ?auto_1955 ?auto_1950 ) ) ( not ( = ?auto_1953 ?auto_1955 ) ) ( HOIST-AT ?auto_1952 ?auto_1955 ) ( not ( = ?auto_1948 ?auto_1952 ) ) ( not ( = ?auto_1951 ?auto_1952 ) ) ( AVAILABLE ?auto_1952 ) ( SURFACE-AT ?auto_1954 ?auto_1955 ) ( ON ?auto_1954 ?auto_1959 ) ( CLEAR ?auto_1954 ) ( not ( = ?auto_1946 ?auto_1959 ) ) ( not ( = ?auto_1947 ?auto_1959 ) ) ( not ( = ?auto_1956 ?auto_1959 ) ) ( not ( = ?auto_1954 ?auto_1959 ) ) ( not ( = ?auto_1957 ?auto_1959 ) ) ( not ( = ?auto_1949 ?auto_1959 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1952 ?auto_1954 ?auto_1959 ?auto_1955 )
      ( MAKE-ON ?auto_1946 ?auto_1947 )
      ( MAKE-ON-VERIFY ?auto_1946 ?auto_1947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1960 - SURFACE
      ?auto_1961 - SURFACE
    )
    :vars
    (
      ?auto_1963 - HOIST
      ?auto_1967 - PLACE
      ?auto_1966 - PLACE
      ?auto_1969 - HOIST
      ?auto_1964 - SURFACE
      ?auto_1972 - SURFACE
      ?auto_1962 - SURFACE
      ?auto_1968 - SURFACE
      ?auto_1973 - PLACE
      ?auto_1971 - HOIST
      ?auto_1965 - SURFACE
      ?auto_1970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1963 ?auto_1967 ) ( IS-CRATE ?auto_1960 ) ( not ( = ?auto_1960 ?auto_1961 ) ) ( not ( = ?auto_1966 ?auto_1967 ) ) ( HOIST-AT ?auto_1969 ?auto_1966 ) ( not ( = ?auto_1963 ?auto_1969 ) ) ( SURFACE-AT ?auto_1960 ?auto_1966 ) ( ON ?auto_1960 ?auto_1964 ) ( CLEAR ?auto_1960 ) ( not ( = ?auto_1960 ?auto_1964 ) ) ( not ( = ?auto_1961 ?auto_1964 ) ) ( IS-CRATE ?auto_1961 ) ( not ( = ?auto_1960 ?auto_1972 ) ) ( not ( = ?auto_1961 ?auto_1972 ) ) ( not ( = ?auto_1964 ?auto_1972 ) ) ( AVAILABLE ?auto_1969 ) ( SURFACE-AT ?auto_1961 ?auto_1966 ) ( ON ?auto_1961 ?auto_1962 ) ( CLEAR ?auto_1961 ) ( not ( = ?auto_1960 ?auto_1962 ) ) ( not ( = ?auto_1961 ?auto_1962 ) ) ( not ( = ?auto_1964 ?auto_1962 ) ) ( not ( = ?auto_1972 ?auto_1962 ) ) ( SURFACE-AT ?auto_1968 ?auto_1967 ) ( CLEAR ?auto_1968 ) ( IS-CRATE ?auto_1972 ) ( not ( = ?auto_1960 ?auto_1968 ) ) ( not ( = ?auto_1961 ?auto_1968 ) ) ( not ( = ?auto_1964 ?auto_1968 ) ) ( not ( = ?auto_1972 ?auto_1968 ) ) ( not ( = ?auto_1962 ?auto_1968 ) ) ( AVAILABLE ?auto_1963 ) ( not ( = ?auto_1973 ?auto_1967 ) ) ( not ( = ?auto_1966 ?auto_1973 ) ) ( HOIST-AT ?auto_1971 ?auto_1973 ) ( not ( = ?auto_1963 ?auto_1971 ) ) ( not ( = ?auto_1969 ?auto_1971 ) ) ( AVAILABLE ?auto_1971 ) ( SURFACE-AT ?auto_1972 ?auto_1973 ) ( ON ?auto_1972 ?auto_1965 ) ( CLEAR ?auto_1972 ) ( not ( = ?auto_1960 ?auto_1965 ) ) ( not ( = ?auto_1961 ?auto_1965 ) ) ( not ( = ?auto_1964 ?auto_1965 ) ) ( not ( = ?auto_1972 ?auto_1965 ) ) ( not ( = ?auto_1962 ?auto_1965 ) ) ( not ( = ?auto_1968 ?auto_1965 ) ) ( TRUCK-AT ?auto_1970 ?auto_1967 ) )
    :subtasks
    ( ( !DRIVE ?auto_1970 ?auto_1967 ?auto_1973 )
      ( MAKE-ON ?auto_1960 ?auto_1961 )
      ( MAKE-ON-VERIFY ?auto_1960 ?auto_1961 ) )
  )

)

