( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
    ( GREATER-THAN ?p - OBJ ?q - OBJ )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1586 - OBJ
      ?auto_1585 - LOCATION
    )
    :vars
    (
      ?auto_1588 - LOCATION
      ?auto_1589 - CITY
      ?auto_1587 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1588 ?auto_1589 ) ( IN-CITY ?auto_1585 ?auto_1589 ) ( not ( = ?auto_1585 ?auto_1588 ) ) ( OBJ-AT ?auto_1586 ?auto_1588 ) ( TRUCK-AT ?auto_1587 ?auto_1585 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1587 ?auto_1585 ?auto_1588 ?auto_1589 )
      ( !LOAD-TRUCK ?auto_1586 ?auto_1587 ?auto_1588 )
      ( !DRIVE-TRUCK ?auto_1587 ?auto_1588 ?auto_1585 ?auto_1589 )
      ( !UNLOAD-TRUCK ?auto_1586 ?auto_1587 ?auto_1585 )
      ( DELIVER-1PKG-VERIFY ?auto_1586 ?auto_1585 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1607 - OBJ
      ?auto_1608 - OBJ
      ?auto_1606 - LOCATION
    )
    :vars
    (
      ?auto_1610 - LOCATION
      ?auto_1609 - CITY
      ?auto_1611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1610 ?auto_1609 ) ( IN-CITY ?auto_1606 ?auto_1609 ) ( not ( = ?auto_1606 ?auto_1610 ) ) ( OBJ-AT ?auto_1608 ?auto_1610 ) ( OBJ-AT ?auto_1607 ?auto_1610 ) ( TRUCK-AT ?auto_1611 ?auto_1606 ) ( not ( = ?auto_1607 ?auto_1608 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1607 ?auto_1606 )
      ( DELIVER-1PKG ?auto_1608 ?auto_1606 )
      ( DELIVER-2PKG-VERIFY ?auto_1607 ?auto_1608 ?auto_1606 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1715 - OBJ
      ?auto_1716 - OBJ
      ?auto_1717 - OBJ
      ?auto_1714 - LOCATION
    )
    :vars
    (
      ?auto_1719 - LOCATION
      ?auto_1720 - CITY
      ?auto_1721 - LOCATION
      ?auto_1718 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1719 ?auto_1720 ) ( IN-CITY ?auto_1714 ?auto_1720 ) ( not ( = ?auto_1714 ?auto_1719 ) ) ( OBJ-AT ?auto_1717 ?auto_1719 ) ( IN-CITY ?auto_1721 ?auto_1720 ) ( not ( = ?auto_1714 ?auto_1721 ) ) ( OBJ-AT ?auto_1716 ?auto_1721 ) ( OBJ-AT ?auto_1715 ?auto_1721 ) ( TRUCK-AT ?auto_1718 ?auto_1714 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1715 ?auto_1717 ) ) ( not ( = ?auto_1716 ?auto_1717 ) ) ( not ( = ?auto_1719 ?auto_1721 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1715 ?auto_1716 ?auto_1714 )
      ( DELIVER-1PKG ?auto_1717 ?auto_1714 )
      ( DELIVER-3PKG-VERIFY ?auto_1715 ?auto_1716 ?auto_1717 ?auto_1714 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1732 - OBJ
      ?auto_1733 - OBJ
      ?auto_1734 - OBJ
      ?auto_1731 - LOCATION
    )
    :vars
    (
      ?auto_1736 - LOCATION
      ?auto_1735 - CITY
      ?auto_1738 - LOCATION
      ?auto_1737 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1736 ?auto_1735 ) ( IN-CITY ?auto_1731 ?auto_1735 ) ( not ( = ?auto_1731 ?auto_1736 ) ) ( OBJ-AT ?auto_1733 ?auto_1736 ) ( IN-CITY ?auto_1738 ?auto_1735 ) ( not ( = ?auto_1731 ?auto_1738 ) ) ( OBJ-AT ?auto_1734 ?auto_1738 ) ( OBJ-AT ?auto_1732 ?auto_1738 ) ( TRUCK-AT ?auto_1737 ?auto_1731 ) ( not ( = ?auto_1732 ?auto_1734 ) ) ( not ( = ?auto_1732 ?auto_1733 ) ) ( not ( = ?auto_1734 ?auto_1733 ) ) ( not ( = ?auto_1736 ?auto_1738 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1732 ?auto_1734 ?auto_1733 ?auto_1731 )
      ( DELIVER-3PKG-VERIFY ?auto_1732 ?auto_1733 ?auto_1734 ?auto_1731 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1793 - OBJ
      ?auto_1794 - OBJ
      ?auto_1795 - OBJ
      ?auto_1792 - LOCATION
    )
    :vars
    (
      ?auto_1796 - LOCATION
      ?auto_1797 - CITY
      ?auto_1799 - LOCATION
      ?auto_1798 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1796 ?auto_1797 ) ( IN-CITY ?auto_1792 ?auto_1797 ) ( not ( = ?auto_1792 ?auto_1796 ) ) ( OBJ-AT ?auto_1793 ?auto_1796 ) ( IN-CITY ?auto_1799 ?auto_1797 ) ( not ( = ?auto_1792 ?auto_1799 ) ) ( OBJ-AT ?auto_1795 ?auto_1799 ) ( OBJ-AT ?auto_1794 ?auto_1799 ) ( TRUCK-AT ?auto_1798 ?auto_1792 ) ( not ( = ?auto_1794 ?auto_1795 ) ) ( not ( = ?auto_1794 ?auto_1793 ) ) ( not ( = ?auto_1795 ?auto_1793 ) ) ( not ( = ?auto_1796 ?auto_1799 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1794 ?auto_1793 ?auto_1795 ?auto_1792 )
      ( DELIVER-3PKG-VERIFY ?auto_1793 ?auto_1794 ?auto_1795 ?auto_1792 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2835 - OBJ
      ?auto_2836 - OBJ
      ?auto_2837 - OBJ
      ?auto_2838 - OBJ
      ?auto_2834 - LOCATION
    )
    :vars
    (
      ?auto_2840 - LOCATION
      ?auto_2841 - CITY
      ?auto_2842 - LOCATION
      ?auto_2839 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2840 ?auto_2841 ) ( IN-CITY ?auto_2834 ?auto_2841 ) ( not ( = ?auto_2834 ?auto_2840 ) ) ( OBJ-AT ?auto_2838 ?auto_2840 ) ( OBJ-AT ?auto_2837 ?auto_2840 ) ( IN-CITY ?auto_2842 ?auto_2841 ) ( not ( = ?auto_2834 ?auto_2842 ) ) ( OBJ-AT ?auto_2836 ?auto_2842 ) ( OBJ-AT ?auto_2835 ?auto_2842 ) ( TRUCK-AT ?auto_2839 ?auto_2834 ) ( not ( = ?auto_2835 ?auto_2836 ) ) ( not ( = ?auto_2835 ?auto_2837 ) ) ( not ( = ?auto_2836 ?auto_2837 ) ) ( not ( = ?auto_2840 ?auto_2842 ) ) ( not ( = ?auto_2835 ?auto_2838 ) ) ( not ( = ?auto_2836 ?auto_2838 ) ) ( not ( = ?auto_2837 ?auto_2838 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2835 ?auto_2837 ?auto_2836 ?auto_2834 )
      ( DELIVER-1PKG ?auto_2838 ?auto_2834 )
      ( DELIVER-4PKG-VERIFY ?auto_2835 ?auto_2836 ?auto_2837 ?auto_2838 ?auto_2834 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2889 - OBJ
      ?auto_2890 - OBJ
      ?auto_2891 - OBJ
      ?auto_2892 - OBJ
      ?auto_2888 - LOCATION
    )
    :vars
    (
      ?auto_2895 - LOCATION
      ?auto_2894 - CITY
      ?auto_2896 - LOCATION
      ?auto_2893 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2895 ?auto_2894 ) ( IN-CITY ?auto_2888 ?auto_2894 ) ( not ( = ?auto_2888 ?auto_2895 ) ) ( OBJ-AT ?auto_2892 ?auto_2895 ) ( OBJ-AT ?auto_2890 ?auto_2895 ) ( IN-CITY ?auto_2896 ?auto_2894 ) ( not ( = ?auto_2888 ?auto_2896 ) ) ( OBJ-AT ?auto_2891 ?auto_2896 ) ( OBJ-AT ?auto_2889 ?auto_2896 ) ( TRUCK-AT ?auto_2893 ?auto_2888 ) ( not ( = ?auto_2889 ?auto_2891 ) ) ( not ( = ?auto_2889 ?auto_2890 ) ) ( not ( = ?auto_2891 ?auto_2890 ) ) ( not ( = ?auto_2895 ?auto_2896 ) ) ( not ( = ?auto_2889 ?auto_2892 ) ) ( not ( = ?auto_2891 ?auto_2892 ) ) ( not ( = ?auto_2890 ?auto_2892 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2889 ?auto_2891 ?auto_2890 ?auto_2892 ?auto_2888 )
      ( DELIVER-4PKG-VERIFY ?auto_2889 ?auto_2890 ?auto_2891 ?auto_2892 ?auto_2888 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2918 - OBJ
      ?auto_2919 - OBJ
      ?auto_2920 - OBJ
      ?auto_2921 - OBJ
      ?auto_2917 - LOCATION
    )
    :vars
    (
      ?auto_2923 - LOCATION
      ?auto_2925 - CITY
      ?auto_2922 - LOCATION
      ?auto_2924 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2923 ?auto_2925 ) ( IN-CITY ?auto_2917 ?auto_2925 ) ( not ( = ?auto_2917 ?auto_2923 ) ) ( OBJ-AT ?auto_2920 ?auto_2923 ) ( OBJ-AT ?auto_2919 ?auto_2923 ) ( IN-CITY ?auto_2922 ?auto_2925 ) ( not ( = ?auto_2917 ?auto_2922 ) ) ( OBJ-AT ?auto_2921 ?auto_2922 ) ( OBJ-AT ?auto_2918 ?auto_2922 ) ( TRUCK-AT ?auto_2924 ?auto_2917 ) ( not ( = ?auto_2918 ?auto_2921 ) ) ( not ( = ?auto_2918 ?auto_2919 ) ) ( not ( = ?auto_2921 ?auto_2919 ) ) ( not ( = ?auto_2923 ?auto_2922 ) ) ( not ( = ?auto_2918 ?auto_2920 ) ) ( not ( = ?auto_2921 ?auto_2920 ) ) ( not ( = ?auto_2919 ?auto_2920 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2918 ?auto_2919 ?auto_2921 ?auto_2920 ?auto_2917 )
      ( DELIVER-4PKG-VERIFY ?auto_2918 ?auto_2919 ?auto_2920 ?auto_2921 ?auto_2917 ) )
  )

)

