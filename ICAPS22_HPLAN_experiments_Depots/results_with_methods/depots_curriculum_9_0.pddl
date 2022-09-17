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
      ?auto_1752 - SURFACE
      ?auto_1753 - SURFACE
    )
    :vars
    (
      ?auto_1754 - HOIST
      ?auto_1755 - PLACE
      ?auto_1757 - PLACE
      ?auto_1758 - HOIST
      ?auto_1759 - SURFACE
      ?auto_1756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1754 ?auto_1755 ) ( SURFACE-AT ?auto_1753 ?auto_1755 ) ( CLEAR ?auto_1753 ) ( IS-CRATE ?auto_1752 ) ( AVAILABLE ?auto_1754 ) ( not ( = ?auto_1757 ?auto_1755 ) ) ( HOIST-AT ?auto_1758 ?auto_1757 ) ( AVAILABLE ?auto_1758 ) ( SURFACE-AT ?auto_1752 ?auto_1757 ) ( ON ?auto_1752 ?auto_1759 ) ( CLEAR ?auto_1752 ) ( TRUCK-AT ?auto_1756 ?auto_1755 ) ( not ( = ?auto_1752 ?auto_1753 ) ) ( not ( = ?auto_1752 ?auto_1759 ) ) ( not ( = ?auto_1753 ?auto_1759 ) ) ( not ( = ?auto_1754 ?auto_1758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1756 ?auto_1755 ?auto_1757 )
      ( !LIFT ?auto_1758 ?auto_1752 ?auto_1759 ?auto_1757 )
      ( !LOAD ?auto_1758 ?auto_1752 ?auto_1756 ?auto_1757 )
      ( !DRIVE ?auto_1756 ?auto_1757 ?auto_1755 )
      ( !UNLOAD ?auto_1754 ?auto_1752 ?auto_1756 ?auto_1755 )
      ( !DROP ?auto_1754 ?auto_1752 ?auto_1753 ?auto_1755 )
      ( MAKE-ON-VERIFY ?auto_1752 ?auto_1753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1762 - SURFACE
      ?auto_1763 - SURFACE
    )
    :vars
    (
      ?auto_1764 - HOIST
      ?auto_1765 - PLACE
      ?auto_1767 - PLACE
      ?auto_1768 - HOIST
      ?auto_1769 - SURFACE
      ?auto_1766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1764 ?auto_1765 ) ( SURFACE-AT ?auto_1763 ?auto_1765 ) ( CLEAR ?auto_1763 ) ( IS-CRATE ?auto_1762 ) ( AVAILABLE ?auto_1764 ) ( not ( = ?auto_1767 ?auto_1765 ) ) ( HOIST-AT ?auto_1768 ?auto_1767 ) ( AVAILABLE ?auto_1768 ) ( SURFACE-AT ?auto_1762 ?auto_1767 ) ( ON ?auto_1762 ?auto_1769 ) ( CLEAR ?auto_1762 ) ( TRUCK-AT ?auto_1766 ?auto_1765 ) ( not ( = ?auto_1762 ?auto_1763 ) ) ( not ( = ?auto_1762 ?auto_1769 ) ) ( not ( = ?auto_1763 ?auto_1769 ) ) ( not ( = ?auto_1764 ?auto_1768 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1766 ?auto_1765 ?auto_1767 )
      ( !LIFT ?auto_1768 ?auto_1762 ?auto_1769 ?auto_1767 )
      ( !LOAD ?auto_1768 ?auto_1762 ?auto_1766 ?auto_1767 )
      ( !DRIVE ?auto_1766 ?auto_1767 ?auto_1765 )
      ( !UNLOAD ?auto_1764 ?auto_1762 ?auto_1766 ?auto_1765 )
      ( !DROP ?auto_1764 ?auto_1762 ?auto_1763 ?auto_1765 )
      ( MAKE-ON-VERIFY ?auto_1762 ?auto_1763 ) )
  )

  ( :method MAKE-ON
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
    ( and ( HOIST-AT ?auto_1774 ?auto_1775 ) ( SURFACE-AT ?auto_1773 ?auto_1775 ) ( CLEAR ?auto_1773 ) ( IS-CRATE ?auto_1772 ) ( AVAILABLE ?auto_1774 ) ( not ( = ?auto_1777 ?auto_1775 ) ) ( HOIST-AT ?auto_1778 ?auto_1777 ) ( AVAILABLE ?auto_1778 ) ( SURFACE-AT ?auto_1772 ?auto_1777 ) ( ON ?auto_1772 ?auto_1779 ) ( CLEAR ?auto_1772 ) ( TRUCK-AT ?auto_1776 ?auto_1775 ) ( not ( = ?auto_1772 ?auto_1773 ) ) ( not ( = ?auto_1772 ?auto_1779 ) ) ( not ( = ?auto_1773 ?auto_1779 ) ) ( not ( = ?auto_1774 ?auto_1778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1776 ?auto_1775 ?auto_1777 )
      ( !LIFT ?auto_1778 ?auto_1772 ?auto_1779 ?auto_1777 )
      ( !LOAD ?auto_1778 ?auto_1772 ?auto_1776 ?auto_1777 )
      ( !DRIVE ?auto_1776 ?auto_1777 ?auto_1775 )
      ( !UNLOAD ?auto_1774 ?auto_1772 ?auto_1776 ?auto_1775 )
      ( !DROP ?auto_1774 ?auto_1772 ?auto_1773 ?auto_1775 )
      ( MAKE-ON-VERIFY ?auto_1772 ?auto_1773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1782 - SURFACE
      ?auto_1783 - SURFACE
    )
    :vars
    (
      ?auto_1784 - HOIST
      ?auto_1785 - PLACE
      ?auto_1787 - PLACE
      ?auto_1788 - HOIST
      ?auto_1789 - SURFACE
      ?auto_1786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1784 ?auto_1785 ) ( SURFACE-AT ?auto_1783 ?auto_1785 ) ( CLEAR ?auto_1783 ) ( IS-CRATE ?auto_1782 ) ( AVAILABLE ?auto_1784 ) ( not ( = ?auto_1787 ?auto_1785 ) ) ( HOIST-AT ?auto_1788 ?auto_1787 ) ( AVAILABLE ?auto_1788 ) ( SURFACE-AT ?auto_1782 ?auto_1787 ) ( ON ?auto_1782 ?auto_1789 ) ( CLEAR ?auto_1782 ) ( TRUCK-AT ?auto_1786 ?auto_1785 ) ( not ( = ?auto_1782 ?auto_1783 ) ) ( not ( = ?auto_1782 ?auto_1789 ) ) ( not ( = ?auto_1783 ?auto_1789 ) ) ( not ( = ?auto_1784 ?auto_1788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1786 ?auto_1785 ?auto_1787 )
      ( !LIFT ?auto_1788 ?auto_1782 ?auto_1789 ?auto_1787 )
      ( !LOAD ?auto_1788 ?auto_1782 ?auto_1786 ?auto_1787 )
      ( !DRIVE ?auto_1786 ?auto_1787 ?auto_1785 )
      ( !UNLOAD ?auto_1784 ?auto_1782 ?auto_1786 ?auto_1785 )
      ( !DROP ?auto_1784 ?auto_1782 ?auto_1783 ?auto_1785 )
      ( MAKE-ON-VERIFY ?auto_1782 ?auto_1783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1792 - SURFACE
      ?auto_1793 - SURFACE
    )
    :vars
    (
      ?auto_1794 - HOIST
      ?auto_1795 - PLACE
      ?auto_1797 - PLACE
      ?auto_1798 - HOIST
      ?auto_1799 - SURFACE
      ?auto_1796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1794 ?auto_1795 ) ( SURFACE-AT ?auto_1793 ?auto_1795 ) ( CLEAR ?auto_1793 ) ( IS-CRATE ?auto_1792 ) ( AVAILABLE ?auto_1794 ) ( not ( = ?auto_1797 ?auto_1795 ) ) ( HOIST-AT ?auto_1798 ?auto_1797 ) ( AVAILABLE ?auto_1798 ) ( SURFACE-AT ?auto_1792 ?auto_1797 ) ( ON ?auto_1792 ?auto_1799 ) ( CLEAR ?auto_1792 ) ( TRUCK-AT ?auto_1796 ?auto_1795 ) ( not ( = ?auto_1792 ?auto_1793 ) ) ( not ( = ?auto_1792 ?auto_1799 ) ) ( not ( = ?auto_1793 ?auto_1799 ) ) ( not ( = ?auto_1794 ?auto_1798 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1796 ?auto_1795 ?auto_1797 )
      ( !LIFT ?auto_1798 ?auto_1792 ?auto_1799 ?auto_1797 )
      ( !LOAD ?auto_1798 ?auto_1792 ?auto_1796 ?auto_1797 )
      ( !DRIVE ?auto_1796 ?auto_1797 ?auto_1795 )
      ( !UNLOAD ?auto_1794 ?auto_1792 ?auto_1796 ?auto_1795 )
      ( !DROP ?auto_1794 ?auto_1792 ?auto_1793 ?auto_1795 )
      ( MAKE-ON-VERIFY ?auto_1792 ?auto_1793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1802 - SURFACE
      ?auto_1803 - SURFACE
    )
    :vars
    (
      ?auto_1804 - HOIST
      ?auto_1805 - PLACE
      ?auto_1807 - PLACE
      ?auto_1808 - HOIST
      ?auto_1809 - SURFACE
      ?auto_1806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1804 ?auto_1805 ) ( SURFACE-AT ?auto_1803 ?auto_1805 ) ( CLEAR ?auto_1803 ) ( IS-CRATE ?auto_1802 ) ( AVAILABLE ?auto_1804 ) ( not ( = ?auto_1807 ?auto_1805 ) ) ( HOIST-AT ?auto_1808 ?auto_1807 ) ( AVAILABLE ?auto_1808 ) ( SURFACE-AT ?auto_1802 ?auto_1807 ) ( ON ?auto_1802 ?auto_1809 ) ( CLEAR ?auto_1802 ) ( TRUCK-AT ?auto_1806 ?auto_1805 ) ( not ( = ?auto_1802 ?auto_1803 ) ) ( not ( = ?auto_1802 ?auto_1809 ) ) ( not ( = ?auto_1803 ?auto_1809 ) ) ( not ( = ?auto_1804 ?auto_1808 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1806 ?auto_1805 ?auto_1807 )
      ( !LIFT ?auto_1808 ?auto_1802 ?auto_1809 ?auto_1807 )
      ( !LOAD ?auto_1808 ?auto_1802 ?auto_1806 ?auto_1807 )
      ( !DRIVE ?auto_1806 ?auto_1807 ?auto_1805 )
      ( !UNLOAD ?auto_1804 ?auto_1802 ?auto_1806 ?auto_1805 )
      ( !DROP ?auto_1804 ?auto_1802 ?auto_1803 ?auto_1805 )
      ( MAKE-ON-VERIFY ?auto_1802 ?auto_1803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1812 - SURFACE
      ?auto_1813 - SURFACE
    )
    :vars
    (
      ?auto_1814 - HOIST
      ?auto_1815 - PLACE
      ?auto_1817 - PLACE
      ?auto_1818 - HOIST
      ?auto_1819 - SURFACE
      ?auto_1816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1814 ?auto_1815 ) ( SURFACE-AT ?auto_1813 ?auto_1815 ) ( CLEAR ?auto_1813 ) ( IS-CRATE ?auto_1812 ) ( AVAILABLE ?auto_1814 ) ( not ( = ?auto_1817 ?auto_1815 ) ) ( HOIST-AT ?auto_1818 ?auto_1817 ) ( AVAILABLE ?auto_1818 ) ( SURFACE-AT ?auto_1812 ?auto_1817 ) ( ON ?auto_1812 ?auto_1819 ) ( CLEAR ?auto_1812 ) ( TRUCK-AT ?auto_1816 ?auto_1815 ) ( not ( = ?auto_1812 ?auto_1813 ) ) ( not ( = ?auto_1812 ?auto_1819 ) ) ( not ( = ?auto_1813 ?auto_1819 ) ) ( not ( = ?auto_1814 ?auto_1818 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1816 ?auto_1815 ?auto_1817 )
      ( !LIFT ?auto_1818 ?auto_1812 ?auto_1819 ?auto_1817 )
      ( !LOAD ?auto_1818 ?auto_1812 ?auto_1816 ?auto_1817 )
      ( !DRIVE ?auto_1816 ?auto_1817 ?auto_1815 )
      ( !UNLOAD ?auto_1814 ?auto_1812 ?auto_1816 ?auto_1815 )
      ( !DROP ?auto_1814 ?auto_1812 ?auto_1813 ?auto_1815 )
      ( MAKE-ON-VERIFY ?auto_1812 ?auto_1813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1822 - SURFACE
      ?auto_1823 - SURFACE
    )
    :vars
    (
      ?auto_1824 - HOIST
      ?auto_1825 - PLACE
      ?auto_1827 - PLACE
      ?auto_1828 - HOIST
      ?auto_1829 - SURFACE
      ?auto_1826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1824 ?auto_1825 ) ( SURFACE-AT ?auto_1823 ?auto_1825 ) ( CLEAR ?auto_1823 ) ( IS-CRATE ?auto_1822 ) ( AVAILABLE ?auto_1824 ) ( not ( = ?auto_1827 ?auto_1825 ) ) ( HOIST-AT ?auto_1828 ?auto_1827 ) ( AVAILABLE ?auto_1828 ) ( SURFACE-AT ?auto_1822 ?auto_1827 ) ( ON ?auto_1822 ?auto_1829 ) ( CLEAR ?auto_1822 ) ( TRUCK-AT ?auto_1826 ?auto_1825 ) ( not ( = ?auto_1822 ?auto_1823 ) ) ( not ( = ?auto_1822 ?auto_1829 ) ) ( not ( = ?auto_1823 ?auto_1829 ) ) ( not ( = ?auto_1824 ?auto_1828 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1826 ?auto_1825 ?auto_1827 )
      ( !LIFT ?auto_1828 ?auto_1822 ?auto_1829 ?auto_1827 )
      ( !LOAD ?auto_1828 ?auto_1822 ?auto_1826 ?auto_1827 )
      ( !DRIVE ?auto_1826 ?auto_1827 ?auto_1825 )
      ( !UNLOAD ?auto_1824 ?auto_1822 ?auto_1826 ?auto_1825 )
      ( !DROP ?auto_1824 ?auto_1822 ?auto_1823 ?auto_1825 )
      ( MAKE-ON-VERIFY ?auto_1822 ?auto_1823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1832 - SURFACE
      ?auto_1833 - SURFACE
    )
    :vars
    (
      ?auto_1834 - HOIST
      ?auto_1835 - PLACE
      ?auto_1837 - PLACE
      ?auto_1838 - HOIST
      ?auto_1839 - SURFACE
      ?auto_1836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1834 ?auto_1835 ) ( SURFACE-AT ?auto_1833 ?auto_1835 ) ( CLEAR ?auto_1833 ) ( IS-CRATE ?auto_1832 ) ( AVAILABLE ?auto_1834 ) ( not ( = ?auto_1837 ?auto_1835 ) ) ( HOIST-AT ?auto_1838 ?auto_1837 ) ( AVAILABLE ?auto_1838 ) ( SURFACE-AT ?auto_1832 ?auto_1837 ) ( ON ?auto_1832 ?auto_1839 ) ( CLEAR ?auto_1832 ) ( TRUCK-AT ?auto_1836 ?auto_1835 ) ( not ( = ?auto_1832 ?auto_1833 ) ) ( not ( = ?auto_1832 ?auto_1839 ) ) ( not ( = ?auto_1833 ?auto_1839 ) ) ( not ( = ?auto_1834 ?auto_1838 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1836 ?auto_1835 ?auto_1837 )
      ( !LIFT ?auto_1838 ?auto_1832 ?auto_1839 ?auto_1837 )
      ( !LOAD ?auto_1838 ?auto_1832 ?auto_1836 ?auto_1837 )
      ( !DRIVE ?auto_1836 ?auto_1837 ?auto_1835 )
      ( !UNLOAD ?auto_1834 ?auto_1832 ?auto_1836 ?auto_1835 )
      ( !DROP ?auto_1834 ?auto_1832 ?auto_1833 ?auto_1835 )
      ( MAKE-ON-VERIFY ?auto_1832 ?auto_1833 ) )
  )

)

