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
      ?auto_1720 - SURFACE
      ?auto_1721 - SURFACE
    )
    :vars
    (
      ?auto_1722 - HOIST
      ?auto_1723 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1722 ?auto_1723 ) ( SURFACE-AT ?auto_1721 ?auto_1723 ) ( CLEAR ?auto_1721 ) ( LIFTING ?auto_1722 ?auto_1720 ) ( IS-CRATE ?auto_1720 ) ( not ( = ?auto_1720 ?auto_1721 ) ) )
    :subtasks
    ( ( !DROP ?auto_1722 ?auto_1720 ?auto_1721 ?auto_1723 )
      ( MAKE-ON-VERIFY ?auto_1720 ?auto_1721 ) )
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
      ?auto_1726 - PLACE
      ?auto_1728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1727 ?auto_1726 ) ( SURFACE-AT ?auto_1725 ?auto_1726 ) ( CLEAR ?auto_1725 ) ( IS-CRATE ?auto_1724 ) ( not ( = ?auto_1724 ?auto_1725 ) ) ( TRUCK-AT ?auto_1728 ?auto_1726 ) ( AVAILABLE ?auto_1727 ) ( IN ?auto_1724 ?auto_1728 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1727 ?auto_1724 ?auto_1728 ?auto_1726 )
      ( MAKE-ON ?auto_1724 ?auto_1725 )
      ( MAKE-ON-VERIFY ?auto_1724 ?auto_1725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1729 - SURFACE
      ?auto_1730 - SURFACE
    )
    :vars
    (
      ?auto_1731 - HOIST
      ?auto_1732 - PLACE
      ?auto_1733 - TRUCK
      ?auto_1734 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1731 ?auto_1732 ) ( SURFACE-AT ?auto_1730 ?auto_1732 ) ( CLEAR ?auto_1730 ) ( IS-CRATE ?auto_1729 ) ( not ( = ?auto_1729 ?auto_1730 ) ) ( AVAILABLE ?auto_1731 ) ( IN ?auto_1729 ?auto_1733 ) ( TRUCK-AT ?auto_1733 ?auto_1734 ) ( not ( = ?auto_1734 ?auto_1732 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1733 ?auto_1734 ?auto_1732 )
      ( MAKE-ON ?auto_1729 ?auto_1730 )
      ( MAKE-ON-VERIFY ?auto_1729 ?auto_1730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1735 - SURFACE
      ?auto_1736 - SURFACE
    )
    :vars
    (
      ?auto_1738 - HOIST
      ?auto_1737 - PLACE
      ?auto_1739 - TRUCK
      ?auto_1740 - PLACE
      ?auto_1741 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1738 ?auto_1737 ) ( SURFACE-AT ?auto_1736 ?auto_1737 ) ( CLEAR ?auto_1736 ) ( IS-CRATE ?auto_1735 ) ( not ( = ?auto_1735 ?auto_1736 ) ) ( AVAILABLE ?auto_1738 ) ( TRUCK-AT ?auto_1739 ?auto_1740 ) ( not ( = ?auto_1740 ?auto_1737 ) ) ( HOIST-AT ?auto_1741 ?auto_1740 ) ( LIFTING ?auto_1741 ?auto_1735 ) ( not ( = ?auto_1738 ?auto_1741 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1741 ?auto_1735 ?auto_1739 ?auto_1740 )
      ( MAKE-ON ?auto_1735 ?auto_1736 )
      ( MAKE-ON-VERIFY ?auto_1735 ?auto_1736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1742 - SURFACE
      ?auto_1743 - SURFACE
    )
    :vars
    (
      ?auto_1748 - HOIST
      ?auto_1744 - PLACE
      ?auto_1746 - TRUCK
      ?auto_1747 - PLACE
      ?auto_1745 - HOIST
      ?auto_1749 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1748 ?auto_1744 ) ( SURFACE-AT ?auto_1743 ?auto_1744 ) ( CLEAR ?auto_1743 ) ( IS-CRATE ?auto_1742 ) ( not ( = ?auto_1742 ?auto_1743 ) ) ( AVAILABLE ?auto_1748 ) ( TRUCK-AT ?auto_1746 ?auto_1747 ) ( not ( = ?auto_1747 ?auto_1744 ) ) ( HOIST-AT ?auto_1745 ?auto_1747 ) ( not ( = ?auto_1748 ?auto_1745 ) ) ( AVAILABLE ?auto_1745 ) ( SURFACE-AT ?auto_1742 ?auto_1747 ) ( ON ?auto_1742 ?auto_1749 ) ( CLEAR ?auto_1742 ) ( not ( = ?auto_1742 ?auto_1749 ) ) ( not ( = ?auto_1743 ?auto_1749 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1745 ?auto_1742 ?auto_1749 ?auto_1747 )
      ( MAKE-ON ?auto_1742 ?auto_1743 )
      ( MAKE-ON-VERIFY ?auto_1742 ?auto_1743 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1750 - SURFACE
      ?auto_1751 - SURFACE
    )
    :vars
    (
      ?auto_1753 - HOIST
      ?auto_1756 - PLACE
      ?auto_1755 - PLACE
      ?auto_1757 - HOIST
      ?auto_1754 - SURFACE
      ?auto_1752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1753 ?auto_1756 ) ( SURFACE-AT ?auto_1751 ?auto_1756 ) ( CLEAR ?auto_1751 ) ( IS-CRATE ?auto_1750 ) ( not ( = ?auto_1750 ?auto_1751 ) ) ( AVAILABLE ?auto_1753 ) ( not ( = ?auto_1755 ?auto_1756 ) ) ( HOIST-AT ?auto_1757 ?auto_1755 ) ( not ( = ?auto_1753 ?auto_1757 ) ) ( AVAILABLE ?auto_1757 ) ( SURFACE-AT ?auto_1750 ?auto_1755 ) ( ON ?auto_1750 ?auto_1754 ) ( CLEAR ?auto_1750 ) ( not ( = ?auto_1750 ?auto_1754 ) ) ( not ( = ?auto_1751 ?auto_1754 ) ) ( TRUCK-AT ?auto_1752 ?auto_1756 ) )
    :subtasks
    ( ( !DRIVE ?auto_1752 ?auto_1756 ?auto_1755 )
      ( MAKE-ON ?auto_1750 ?auto_1751 )
      ( MAKE-ON-VERIFY ?auto_1750 ?auto_1751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1798 - SURFACE
      ?auto_1799 - SURFACE
    )
    :vars
    (
      ?auto_1805 - HOIST
      ?auto_1803 - PLACE
      ?auto_1804 - PLACE
      ?auto_1800 - HOIST
      ?auto_1801 - SURFACE
      ?auto_1802 - TRUCK
      ?auto_1806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1805 ?auto_1803 ) ( IS-CRATE ?auto_1798 ) ( not ( = ?auto_1798 ?auto_1799 ) ) ( not ( = ?auto_1804 ?auto_1803 ) ) ( HOIST-AT ?auto_1800 ?auto_1804 ) ( not ( = ?auto_1805 ?auto_1800 ) ) ( AVAILABLE ?auto_1800 ) ( SURFACE-AT ?auto_1798 ?auto_1804 ) ( ON ?auto_1798 ?auto_1801 ) ( CLEAR ?auto_1798 ) ( not ( = ?auto_1798 ?auto_1801 ) ) ( not ( = ?auto_1799 ?auto_1801 ) ) ( TRUCK-AT ?auto_1802 ?auto_1803 ) ( SURFACE-AT ?auto_1806 ?auto_1803 ) ( CLEAR ?auto_1806 ) ( LIFTING ?auto_1805 ?auto_1799 ) ( IS-CRATE ?auto_1799 ) ( not ( = ?auto_1798 ?auto_1806 ) ) ( not ( = ?auto_1799 ?auto_1806 ) ) ( not ( = ?auto_1801 ?auto_1806 ) ) )
    :subtasks
    ( ( !DROP ?auto_1805 ?auto_1799 ?auto_1806 ?auto_1803 )
      ( MAKE-ON ?auto_1798 ?auto_1799 )
      ( MAKE-ON-VERIFY ?auto_1798 ?auto_1799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_1807 - SURFACE
      ?auto_1808 - SURFACE
    )
    :vars
    (
      ?auto_1809 - HOIST
      ?auto_1811 - PLACE
      ?auto_1815 - PLACE
      ?auto_1812 - HOIST
      ?auto_1814 - SURFACE
      ?auto_1813 - TRUCK
      ?auto_1810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1809 ?auto_1811 ) ( IS-CRATE ?auto_1807 ) ( not ( = ?auto_1807 ?auto_1808 ) ) ( not ( = ?auto_1815 ?auto_1811 ) ) ( HOIST-AT ?auto_1812 ?auto_1815 ) ( not ( = ?auto_1809 ?auto_1812 ) ) ( AVAILABLE ?auto_1812 ) ( SURFACE-AT ?auto_1807 ?auto_1815 ) ( ON ?auto_1807 ?auto_1814 ) ( CLEAR ?auto_1807 ) ( not ( = ?auto_1807 ?auto_1814 ) ) ( not ( = ?auto_1808 ?auto_1814 ) ) ( TRUCK-AT ?auto_1813 ?auto_1811 ) ( SURFACE-AT ?auto_1810 ?auto_1811 ) ( CLEAR ?auto_1810 ) ( IS-CRATE ?auto_1808 ) ( not ( = ?auto_1807 ?auto_1810 ) ) ( not ( = ?auto_1808 ?auto_1810 ) ) ( not ( = ?auto_1814 ?auto_1810 ) ) ( AVAILABLE ?auto_1809 ) ( IN ?auto_1808 ?auto_1813 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1809 ?auto_1808 ?auto_1813 ?auto_1811 )
      ( MAKE-ON ?auto_1807 ?auto_1808 )
      ( MAKE-ON-VERIFY ?auto_1807 ?auto_1808 ) )
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
      ?auto_1829 - PLACE
      ?auto_1828 - PLACE
      ?auto_1827 - HOIST
      ?auto_1825 - SURFACE
      ?auto_1826 - TRUCK
      ?auto_1830 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1824 ?auto_1829 ) ( SURFACE-AT ?auto_1823 ?auto_1829 ) ( CLEAR ?auto_1823 ) ( IS-CRATE ?auto_1822 ) ( not ( = ?auto_1822 ?auto_1823 ) ) ( AVAILABLE ?auto_1824 ) ( not ( = ?auto_1828 ?auto_1829 ) ) ( HOIST-AT ?auto_1827 ?auto_1828 ) ( not ( = ?auto_1824 ?auto_1827 ) ) ( AVAILABLE ?auto_1827 ) ( SURFACE-AT ?auto_1822 ?auto_1828 ) ( ON ?auto_1822 ?auto_1825 ) ( CLEAR ?auto_1822 ) ( not ( = ?auto_1822 ?auto_1825 ) ) ( not ( = ?auto_1823 ?auto_1825 ) ) ( TRUCK-AT ?auto_1826 ?auto_1830 ) ( not ( = ?auto_1830 ?auto_1829 ) ) ( not ( = ?auto_1828 ?auto_1830 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1826 ?auto_1830 ?auto_1829 )
      ( MAKE-ON ?auto_1822 ?auto_1823 )
      ( MAKE-ON-VERIFY ?auto_1822 ?auto_1823 ) )
  )

)

