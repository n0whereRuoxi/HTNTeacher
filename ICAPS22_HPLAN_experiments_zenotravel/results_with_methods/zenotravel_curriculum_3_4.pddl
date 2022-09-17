( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1561 - PERSON
      ?auto_1560 - CITY
    )
    :vars
    (
      ?auto_1564 - FLEVEL
      ?auto_1563 - FLEVEL
      ?auto_1565 - CITY
      ?auto_1562 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1564 ?auto_1563 ) ( PERSON-AT ?auto_1561 ?auto_1565 ) ( AIRCRAFT-AT ?auto_1562 ?auto_1560 ) ( FUEL-LEVEL ?auto_1562 ?auto_1564 ) ( not ( = ?auto_1560 ?auto_1565 ) ) ( not ( = ?auto_1564 ?auto_1563 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1562 ?auto_1560 ?auto_1564 ?auto_1563 )
      ( !FLY ?auto_1562 ?auto_1560 ?auto_1565 ?auto_1563 ?auto_1564 )
      ( !REFUEL ?auto_1562 ?auto_1565 ?auto_1564 ?auto_1563 )
      ( !BOARD ?auto_1561 ?auto_1562 ?auto_1565 )
      ( !FLY ?auto_1562 ?auto_1565 ?auto_1560 ?auto_1563 ?auto_1564 )
      ( !DEBARK ?auto_1561 ?auto_1562 ?auto_1560 )
      ( FLY-1PPL-VERIFY ?auto_1561 ?auto_1560 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1569 - PERSON
      ?auto_1568 - CITY
    )
    :vars
    (
      ?auto_1572 - FLEVEL
      ?auto_1571 - FLEVEL
      ?auto_1573 - CITY
      ?auto_1570 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1572 ?auto_1571 ) ( PERSON-AT ?auto_1569 ?auto_1573 ) ( AIRCRAFT-AT ?auto_1570 ?auto_1568 ) ( FUEL-LEVEL ?auto_1570 ?auto_1572 ) ( not ( = ?auto_1568 ?auto_1573 ) ) ( not ( = ?auto_1572 ?auto_1571 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1570 ?auto_1568 ?auto_1572 ?auto_1571 )
      ( !FLY ?auto_1570 ?auto_1568 ?auto_1573 ?auto_1571 ?auto_1572 )
      ( !REFUEL ?auto_1570 ?auto_1573 ?auto_1572 ?auto_1571 )
      ( !BOARD ?auto_1569 ?auto_1570 ?auto_1573 )
      ( !FLY ?auto_1570 ?auto_1573 ?auto_1568 ?auto_1571 ?auto_1572 )
      ( !DEBARK ?auto_1569 ?auto_1570 ?auto_1568 )
      ( FLY-1PPL-VERIFY ?auto_1569 ?auto_1568 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1584 - PERSON
      ?auto_1585 - PERSON
      ?auto_1583 - CITY
    )
    :vars
    (
      ?auto_1587 - FLEVEL
      ?auto_1589 - FLEVEL
      ?auto_1586 - CITY
      ?auto_1590 - CITY
      ?auto_1588 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1587 ?auto_1589 ) ( PERSON-AT ?auto_1585 ?auto_1586 ) ( not ( = ?auto_1583 ?auto_1586 ) ) ( not ( = ?auto_1587 ?auto_1589 ) ) ( PERSON-AT ?auto_1584 ?auto_1590 ) ( AIRCRAFT-AT ?auto_1588 ?auto_1583 ) ( FUEL-LEVEL ?auto_1588 ?auto_1587 ) ( not ( = ?auto_1583 ?auto_1590 ) ) ( not ( = ?auto_1584 ?auto_1585 ) ) ( not ( = ?auto_1586 ?auto_1590 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1584 ?auto_1583 )
      ( FLY-1PPL ?auto_1585 ?auto_1583 )
      ( FLY-2PPL-VERIFY ?auto_1584 ?auto_1585 ?auto_1583 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1592 - PERSON
      ?auto_1593 - PERSON
      ?auto_1591 - CITY
    )
    :vars
    (
      ?auto_1598 - FLEVEL
      ?auto_1596 - FLEVEL
      ?auto_1595 - CITY
      ?auto_1594 - CITY
      ?auto_1597 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1598 ?auto_1596 ) ( PERSON-AT ?auto_1592 ?auto_1595 ) ( not ( = ?auto_1591 ?auto_1595 ) ) ( not ( = ?auto_1598 ?auto_1596 ) ) ( PERSON-AT ?auto_1593 ?auto_1594 ) ( AIRCRAFT-AT ?auto_1597 ?auto_1591 ) ( FUEL-LEVEL ?auto_1597 ?auto_1598 ) ( not ( = ?auto_1591 ?auto_1594 ) ) ( not ( = ?auto_1593 ?auto_1592 ) ) ( not ( = ?auto_1595 ?auto_1594 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1593 ?auto_1592 ?auto_1591 )
      ( FLY-2PPL-VERIFY ?auto_1592 ?auto_1593 ?auto_1591 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1611 - PERSON
      ?auto_1610 - CITY
    )
    :vars
    (
      ?auto_1614 - FLEVEL
      ?auto_1613 - FLEVEL
      ?auto_1615 - CITY
      ?auto_1612 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1614 ?auto_1613 ) ( PERSON-AT ?auto_1611 ?auto_1615 ) ( AIRCRAFT-AT ?auto_1612 ?auto_1610 ) ( FUEL-LEVEL ?auto_1612 ?auto_1614 ) ( not ( = ?auto_1610 ?auto_1615 ) ) ( not ( = ?auto_1614 ?auto_1613 ) ) )
    :subtasks
    ( ( !REFUEL ?auto_1612 ?auto_1610 ?auto_1614 ?auto_1613 )
      ( !FLY ?auto_1612 ?auto_1610 ?auto_1615 ?auto_1613 ?auto_1614 )
      ( !REFUEL ?auto_1612 ?auto_1615 ?auto_1614 ?auto_1613 )
      ( !BOARD ?auto_1611 ?auto_1612 ?auto_1615 )
      ( !FLY ?auto_1612 ?auto_1615 ?auto_1610 ?auto_1613 ?auto_1614 )
      ( !DEBARK ?auto_1611 ?auto_1612 ?auto_1610 )
      ( FLY-1PPL-VERIFY ?auto_1611 ?auto_1610 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1704 - PERSON
      ?auto_1705 - PERSON
      ?auto_1706 - PERSON
      ?auto_1703 - CITY
    )
    :vars
    (
      ?auto_1709 - FLEVEL
      ?auto_1710 - FLEVEL
      ?auto_1707 - CITY
      ?auto_1711 - CITY
      ?auto_1712 - CITY
      ?auto_1708 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1709 ?auto_1710 ) ( PERSON-AT ?auto_1706 ?auto_1707 ) ( not ( = ?auto_1703 ?auto_1707 ) ) ( not ( = ?auto_1709 ?auto_1710 ) ) ( PERSON-AT ?auto_1705 ?auto_1711 ) ( not ( = ?auto_1703 ?auto_1711 ) ) ( PERSON-AT ?auto_1704 ?auto_1712 ) ( AIRCRAFT-AT ?auto_1708 ?auto_1703 ) ( FUEL-LEVEL ?auto_1708 ?auto_1709 ) ( not ( = ?auto_1703 ?auto_1712 ) ) ( not ( = ?auto_1704 ?auto_1705 ) ) ( not ( = ?auto_1711 ?auto_1712 ) ) ( not ( = ?auto_1704 ?auto_1706 ) ) ( not ( = ?auto_1705 ?auto_1706 ) ) ( not ( = ?auto_1707 ?auto_1711 ) ) ( not ( = ?auto_1707 ?auto_1712 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1705 ?auto_1704 ?auto_1703 )
      ( FLY-1PPL ?auto_1706 ?auto_1703 )
      ( FLY-3PPL-VERIFY ?auto_1704 ?auto_1705 ?auto_1706 ?auto_1703 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1725 - PERSON
      ?auto_1726 - PERSON
      ?auto_1727 - PERSON
      ?auto_1724 - CITY
    )
    :vars
    (
      ?auto_1733 - FLEVEL
      ?auto_1728 - FLEVEL
      ?auto_1731 - CITY
      ?auto_1730 - CITY
      ?auto_1732 - CITY
      ?auto_1729 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1733 ?auto_1728 ) ( PERSON-AT ?auto_1726 ?auto_1731 ) ( not ( = ?auto_1724 ?auto_1731 ) ) ( not ( = ?auto_1733 ?auto_1728 ) ) ( PERSON-AT ?auto_1727 ?auto_1730 ) ( not ( = ?auto_1724 ?auto_1730 ) ) ( PERSON-AT ?auto_1725 ?auto_1732 ) ( AIRCRAFT-AT ?auto_1729 ?auto_1724 ) ( FUEL-LEVEL ?auto_1729 ?auto_1733 ) ( not ( = ?auto_1724 ?auto_1732 ) ) ( not ( = ?auto_1725 ?auto_1727 ) ) ( not ( = ?auto_1730 ?auto_1732 ) ) ( not ( = ?auto_1725 ?auto_1726 ) ) ( not ( = ?auto_1727 ?auto_1726 ) ) ( not ( = ?auto_1731 ?auto_1730 ) ) ( not ( = ?auto_1731 ?auto_1732 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1725 ?auto_1727 ?auto_1726 ?auto_1724 )
      ( FLY-3PPL-VERIFY ?auto_1725 ?auto_1726 ?auto_1727 ?auto_1724 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1746 - PERSON
      ?auto_1747 - PERSON
      ?auto_1748 - PERSON
      ?auto_1745 - CITY
    )
    :vars
    (
      ?auto_1749 - FLEVEL
      ?auto_1752 - FLEVEL
      ?auto_1751 - CITY
      ?auto_1754 - CITY
      ?auto_1750 - CITY
      ?auto_1753 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1749 ?auto_1752 ) ( PERSON-AT ?auto_1748 ?auto_1751 ) ( not ( = ?auto_1745 ?auto_1751 ) ) ( not ( = ?auto_1749 ?auto_1752 ) ) ( PERSON-AT ?auto_1746 ?auto_1754 ) ( not ( = ?auto_1745 ?auto_1754 ) ) ( PERSON-AT ?auto_1747 ?auto_1750 ) ( AIRCRAFT-AT ?auto_1753 ?auto_1745 ) ( FUEL-LEVEL ?auto_1753 ?auto_1749 ) ( not ( = ?auto_1745 ?auto_1750 ) ) ( not ( = ?auto_1747 ?auto_1746 ) ) ( not ( = ?auto_1754 ?auto_1750 ) ) ( not ( = ?auto_1747 ?auto_1748 ) ) ( not ( = ?auto_1746 ?auto_1748 ) ) ( not ( = ?auto_1751 ?auto_1754 ) ) ( not ( = ?auto_1751 ?auto_1750 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1747 ?auto_1748 ?auto_1746 ?auto_1745 )
      ( FLY-3PPL-VERIFY ?auto_1746 ?auto_1747 ?auto_1748 ?auto_1745 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1767 - PERSON
      ?auto_1768 - PERSON
      ?auto_1769 - PERSON
      ?auto_1766 - CITY
    )
    :vars
    (
      ?auto_1770 - FLEVEL
      ?auto_1773 - FLEVEL
      ?auto_1772 - CITY
      ?auto_1775 - CITY
      ?auto_1771 - CITY
      ?auto_1774 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1770 ?auto_1773 ) ( PERSON-AT ?auto_1768 ?auto_1772 ) ( not ( = ?auto_1766 ?auto_1772 ) ) ( not ( = ?auto_1770 ?auto_1773 ) ) ( PERSON-AT ?auto_1767 ?auto_1775 ) ( not ( = ?auto_1766 ?auto_1775 ) ) ( PERSON-AT ?auto_1769 ?auto_1771 ) ( AIRCRAFT-AT ?auto_1774 ?auto_1766 ) ( FUEL-LEVEL ?auto_1774 ?auto_1770 ) ( not ( = ?auto_1766 ?auto_1771 ) ) ( not ( = ?auto_1769 ?auto_1767 ) ) ( not ( = ?auto_1775 ?auto_1771 ) ) ( not ( = ?auto_1769 ?auto_1768 ) ) ( not ( = ?auto_1767 ?auto_1768 ) ) ( not ( = ?auto_1772 ?auto_1775 ) ) ( not ( = ?auto_1772 ?auto_1771 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1769 ?auto_1768 ?auto_1767 ?auto_1766 )
      ( FLY-3PPL-VERIFY ?auto_1767 ?auto_1768 ?auto_1769 ?auto_1766 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1810 - PERSON
      ?auto_1811 - PERSON
      ?auto_1812 - PERSON
      ?auto_1809 - CITY
    )
    :vars
    (
      ?auto_1813 - FLEVEL
      ?auto_1816 - FLEVEL
      ?auto_1815 - CITY
      ?auto_1818 - CITY
      ?auto_1814 - CITY
      ?auto_1817 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1813 ?auto_1816 ) ( PERSON-AT ?auto_1810 ?auto_1815 ) ( not ( = ?auto_1809 ?auto_1815 ) ) ( not ( = ?auto_1813 ?auto_1816 ) ) ( PERSON-AT ?auto_1812 ?auto_1818 ) ( not ( = ?auto_1809 ?auto_1818 ) ) ( PERSON-AT ?auto_1811 ?auto_1814 ) ( AIRCRAFT-AT ?auto_1817 ?auto_1809 ) ( FUEL-LEVEL ?auto_1817 ?auto_1813 ) ( not ( = ?auto_1809 ?auto_1814 ) ) ( not ( = ?auto_1811 ?auto_1812 ) ) ( not ( = ?auto_1818 ?auto_1814 ) ) ( not ( = ?auto_1811 ?auto_1810 ) ) ( not ( = ?auto_1812 ?auto_1810 ) ) ( not ( = ?auto_1815 ?auto_1818 ) ) ( not ( = ?auto_1815 ?auto_1814 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1811 ?auto_1810 ?auto_1812 ?auto_1809 )
      ( FLY-3PPL-VERIFY ?auto_1810 ?auto_1811 ?auto_1812 ?auto_1809 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_1831 - PERSON
      ?auto_1832 - PERSON
      ?auto_1833 - PERSON
      ?auto_1830 - CITY
    )
    :vars
    (
      ?auto_1834 - FLEVEL
      ?auto_1837 - FLEVEL
      ?auto_1836 - CITY
      ?auto_1839 - CITY
      ?auto_1835 - CITY
      ?auto_1838 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1834 ?auto_1837 ) ( PERSON-AT ?auto_1831 ?auto_1836 ) ( not ( = ?auto_1830 ?auto_1836 ) ) ( not ( = ?auto_1834 ?auto_1837 ) ) ( PERSON-AT ?auto_1832 ?auto_1839 ) ( not ( = ?auto_1830 ?auto_1839 ) ) ( PERSON-AT ?auto_1833 ?auto_1835 ) ( AIRCRAFT-AT ?auto_1838 ?auto_1830 ) ( FUEL-LEVEL ?auto_1838 ?auto_1834 ) ( not ( = ?auto_1830 ?auto_1835 ) ) ( not ( = ?auto_1833 ?auto_1832 ) ) ( not ( = ?auto_1839 ?auto_1835 ) ) ( not ( = ?auto_1833 ?auto_1831 ) ) ( not ( = ?auto_1832 ?auto_1831 ) ) ( not ( = ?auto_1836 ?auto_1839 ) ) ( not ( = ?auto_1836 ?auto_1835 ) ) )
    :subtasks
    ( ( FLY-3PPL ?auto_1833 ?auto_1831 ?auto_1832 ?auto_1830 )
      ( FLY-3PPL-VERIFY ?auto_1831 ?auto_1832 ?auto_1833 ?auto_1830 ) )
  )

)

