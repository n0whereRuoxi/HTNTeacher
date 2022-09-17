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
      ?auto_1588 - OBJ
      ?auto_1587 - LOCATION
    )
    :vars
    (
      ?auto_1590 - LOCATION
      ?auto_1591 - CITY
      ?auto_1589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1590 ?auto_1591 ) ( IN-CITY ?auto_1587 ?auto_1591 ) ( not ( = ?auto_1587 ?auto_1590 ) ) ( OBJ-AT ?auto_1588 ?auto_1590 ) ( TRUCK-AT ?auto_1589 ?auto_1587 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1589 ?auto_1587 ?auto_1590 ?auto_1591 )
      ( !LOAD-TRUCK ?auto_1588 ?auto_1589 ?auto_1590 )
      ( !DRIVE-TRUCK ?auto_1589 ?auto_1590 ?auto_1587 ?auto_1591 )
      ( !UNLOAD-TRUCK ?auto_1588 ?auto_1589 ?auto_1587 )
      ( DELIVER-1PKG-VERIFY ?auto_1588 ?auto_1587 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1609 - OBJ
      ?auto_1610 - OBJ
      ?auto_1608 - LOCATION
    )
    :vars
    (
      ?auto_1613 - LOCATION
      ?auto_1612 - CITY
      ?auto_1614 - LOCATION
      ?auto_1611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1613 ?auto_1612 ) ( IN-CITY ?auto_1608 ?auto_1612 ) ( not ( = ?auto_1608 ?auto_1613 ) ) ( OBJ-AT ?auto_1610 ?auto_1613 ) ( IN-CITY ?auto_1614 ?auto_1612 ) ( not ( = ?auto_1608 ?auto_1614 ) ) ( OBJ-AT ?auto_1609 ?auto_1614 ) ( TRUCK-AT ?auto_1611 ?auto_1608 ) ( not ( = ?auto_1609 ?auto_1610 ) ) ( not ( = ?auto_1613 ?auto_1614 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1609 ?auto_1608 )
      ( DELIVER-1PKG ?auto_1610 ?auto_1608 )
      ( DELIVER-2PKG-VERIFY ?auto_1609 ?auto_1610 ?auto_1608 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1719 - OBJ
      ?auto_1720 - OBJ
      ?auto_1721 - OBJ
      ?auto_1718 - LOCATION
    )
    :vars
    (
      ?auto_1723 - LOCATION
      ?auto_1722 - CITY
      ?auto_1725 - LOCATION
      ?auto_1724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1723 ?auto_1722 ) ( IN-CITY ?auto_1718 ?auto_1722 ) ( not ( = ?auto_1718 ?auto_1723 ) ) ( OBJ-AT ?auto_1721 ?auto_1723 ) ( IN-CITY ?auto_1725 ?auto_1722 ) ( not ( = ?auto_1718 ?auto_1725 ) ) ( OBJ-AT ?auto_1720 ?auto_1725 ) ( OBJ-AT ?auto_1719 ?auto_1723 ) ( TRUCK-AT ?auto_1724 ?auto_1718 ) ( not ( = ?auto_1719 ?auto_1720 ) ) ( not ( = ?auto_1725 ?auto_1723 ) ) ( not ( = ?auto_1719 ?auto_1721 ) ) ( not ( = ?auto_1720 ?auto_1721 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1719 ?auto_1720 ?auto_1718 )
      ( DELIVER-1PKG ?auto_1721 ?auto_1718 )
      ( DELIVER-3PKG-VERIFY ?auto_1719 ?auto_1720 ?auto_1721 ?auto_1718 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1736 - OBJ
      ?auto_1737 - OBJ
      ?auto_1738 - OBJ
      ?auto_1735 - LOCATION
    )
    :vars
    (
      ?auto_1739 - LOCATION
      ?auto_1741 - CITY
      ?auto_1742 - LOCATION
      ?auto_1740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1739 ?auto_1741 ) ( IN-CITY ?auto_1735 ?auto_1741 ) ( not ( = ?auto_1735 ?auto_1739 ) ) ( OBJ-AT ?auto_1737 ?auto_1739 ) ( IN-CITY ?auto_1742 ?auto_1741 ) ( not ( = ?auto_1735 ?auto_1742 ) ) ( OBJ-AT ?auto_1738 ?auto_1742 ) ( OBJ-AT ?auto_1736 ?auto_1739 ) ( TRUCK-AT ?auto_1740 ?auto_1735 ) ( not ( = ?auto_1736 ?auto_1738 ) ) ( not ( = ?auto_1742 ?auto_1739 ) ) ( not ( = ?auto_1736 ?auto_1737 ) ) ( not ( = ?auto_1738 ?auto_1737 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1736 ?auto_1738 ?auto_1737 ?auto_1735 )
      ( DELIVER-3PKG-VERIFY ?auto_1736 ?auto_1737 ?auto_1738 ?auto_1735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1753 - OBJ
      ?auto_1754 - OBJ
      ?auto_1755 - OBJ
      ?auto_1752 - LOCATION
    )
    :vars
    (
      ?auto_1758 - LOCATION
      ?auto_1759 - CITY
      ?auto_1756 - LOCATION
      ?auto_1757 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1758 ?auto_1759 ) ( IN-CITY ?auto_1752 ?auto_1759 ) ( not ( = ?auto_1752 ?auto_1758 ) ) ( OBJ-AT ?auto_1755 ?auto_1758 ) ( IN-CITY ?auto_1756 ?auto_1759 ) ( not ( = ?auto_1752 ?auto_1756 ) ) ( OBJ-AT ?auto_1753 ?auto_1756 ) ( OBJ-AT ?auto_1754 ?auto_1758 ) ( TRUCK-AT ?auto_1757 ?auto_1752 ) ( not ( = ?auto_1754 ?auto_1753 ) ) ( not ( = ?auto_1756 ?auto_1758 ) ) ( not ( = ?auto_1754 ?auto_1755 ) ) ( not ( = ?auto_1753 ?auto_1755 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1754 ?auto_1755 ?auto_1753 ?auto_1752 )
      ( DELIVER-3PKG-VERIFY ?auto_1753 ?auto_1754 ?auto_1755 ?auto_1752 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2839 - OBJ
      ?auto_2840 - OBJ
      ?auto_2841 - OBJ
      ?auto_2842 - OBJ
      ?auto_2838 - LOCATION
    )
    :vars
    (
      ?auto_2845 - LOCATION
      ?auto_2844 - CITY
      ?auto_2846 - LOCATION
      ?auto_2843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2845 ?auto_2844 ) ( IN-CITY ?auto_2838 ?auto_2844 ) ( not ( = ?auto_2838 ?auto_2845 ) ) ( OBJ-AT ?auto_2842 ?auto_2845 ) ( OBJ-AT ?auto_2841 ?auto_2845 ) ( IN-CITY ?auto_2846 ?auto_2844 ) ( not ( = ?auto_2838 ?auto_2846 ) ) ( OBJ-AT ?auto_2840 ?auto_2846 ) ( OBJ-AT ?auto_2839 ?auto_2845 ) ( TRUCK-AT ?auto_2843 ?auto_2838 ) ( not ( = ?auto_2839 ?auto_2840 ) ) ( not ( = ?auto_2846 ?auto_2845 ) ) ( not ( = ?auto_2839 ?auto_2841 ) ) ( not ( = ?auto_2840 ?auto_2841 ) ) ( not ( = ?auto_2839 ?auto_2842 ) ) ( not ( = ?auto_2840 ?auto_2842 ) ) ( not ( = ?auto_2841 ?auto_2842 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2839 ?auto_2841 ?auto_2840 ?auto_2838 )
      ( DELIVER-1PKG ?auto_2842 ?auto_2838 )
      ( DELIVER-4PKG-VERIFY ?auto_2839 ?auto_2840 ?auto_2841 ?auto_2842 ?auto_2838 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2893 - OBJ
      ?auto_2894 - OBJ
      ?auto_2895 - OBJ
      ?auto_2896 - OBJ
      ?auto_2892 - LOCATION
    )
    :vars
    (
      ?auto_2897 - LOCATION
      ?auto_2900 - CITY
      ?auto_2898 - LOCATION
      ?auto_2899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2897 ?auto_2900 ) ( IN-CITY ?auto_2892 ?auto_2900 ) ( not ( = ?auto_2892 ?auto_2897 ) ) ( OBJ-AT ?auto_2896 ?auto_2897 ) ( OBJ-AT ?auto_2894 ?auto_2897 ) ( IN-CITY ?auto_2898 ?auto_2900 ) ( not ( = ?auto_2892 ?auto_2898 ) ) ( OBJ-AT ?auto_2895 ?auto_2898 ) ( OBJ-AT ?auto_2893 ?auto_2897 ) ( TRUCK-AT ?auto_2899 ?auto_2892 ) ( not ( = ?auto_2893 ?auto_2895 ) ) ( not ( = ?auto_2898 ?auto_2897 ) ) ( not ( = ?auto_2893 ?auto_2894 ) ) ( not ( = ?auto_2895 ?auto_2894 ) ) ( not ( = ?auto_2893 ?auto_2896 ) ) ( not ( = ?auto_2895 ?auto_2896 ) ) ( not ( = ?auto_2894 ?auto_2896 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2893 ?auto_2895 ?auto_2894 ?auto_2896 ?auto_2892 )
      ( DELIVER-4PKG-VERIFY ?auto_2893 ?auto_2894 ?auto_2895 ?auto_2896 ?auto_2892 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2922 - OBJ
      ?auto_2923 - OBJ
      ?auto_2924 - OBJ
      ?auto_2925 - OBJ
      ?auto_2921 - LOCATION
    )
    :vars
    (
      ?auto_2927 - LOCATION
      ?auto_2928 - CITY
      ?auto_2929 - LOCATION
      ?auto_2926 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2927 ?auto_2928 ) ( IN-CITY ?auto_2921 ?auto_2928 ) ( not ( = ?auto_2921 ?auto_2927 ) ) ( OBJ-AT ?auto_2924 ?auto_2927 ) ( OBJ-AT ?auto_2923 ?auto_2927 ) ( IN-CITY ?auto_2929 ?auto_2928 ) ( not ( = ?auto_2921 ?auto_2929 ) ) ( OBJ-AT ?auto_2925 ?auto_2929 ) ( OBJ-AT ?auto_2922 ?auto_2927 ) ( TRUCK-AT ?auto_2926 ?auto_2921 ) ( not ( = ?auto_2922 ?auto_2925 ) ) ( not ( = ?auto_2929 ?auto_2927 ) ) ( not ( = ?auto_2922 ?auto_2923 ) ) ( not ( = ?auto_2925 ?auto_2923 ) ) ( not ( = ?auto_2922 ?auto_2924 ) ) ( not ( = ?auto_2925 ?auto_2924 ) ) ( not ( = ?auto_2923 ?auto_2924 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2922 ?auto_2923 ?auto_2925 ?auto_2924 ?auto_2921 )
      ( DELIVER-4PKG-VERIFY ?auto_2922 ?auto_2923 ?auto_2924 ?auto_2925 ?auto_2921 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3125 - OBJ
      ?auto_3126 - OBJ
      ?auto_3127 - OBJ
      ?auto_3128 - OBJ
      ?auto_3124 - LOCATION
    )
    :vars
    (
      ?auto_3130 - LOCATION
      ?auto_3131 - CITY
      ?auto_3132 - LOCATION
      ?auto_3129 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3130 ?auto_3131 ) ( IN-CITY ?auto_3124 ?auto_3131 ) ( not ( = ?auto_3124 ?auto_3130 ) ) ( OBJ-AT ?auto_3128 ?auto_3130 ) ( OBJ-AT ?auto_3127 ?auto_3130 ) ( IN-CITY ?auto_3132 ?auto_3131 ) ( not ( = ?auto_3124 ?auto_3132 ) ) ( OBJ-AT ?auto_3125 ?auto_3132 ) ( OBJ-AT ?auto_3126 ?auto_3130 ) ( TRUCK-AT ?auto_3129 ?auto_3124 ) ( not ( = ?auto_3126 ?auto_3125 ) ) ( not ( = ?auto_3132 ?auto_3130 ) ) ( not ( = ?auto_3126 ?auto_3127 ) ) ( not ( = ?auto_3125 ?auto_3127 ) ) ( not ( = ?auto_3126 ?auto_3128 ) ) ( not ( = ?auto_3125 ?auto_3128 ) ) ( not ( = ?auto_3127 ?auto_3128 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3126 ?auto_3127 ?auto_3125 ?auto_3128 ?auto_3124 )
      ( DELIVER-4PKG-VERIFY ?auto_3125 ?auto_3126 ?auto_3127 ?auto_3128 ?auto_3124 ) )
  )

)

