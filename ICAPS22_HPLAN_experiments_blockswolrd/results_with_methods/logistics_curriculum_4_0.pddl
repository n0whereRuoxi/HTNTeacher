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
      ?auto_1727 - OBJ
      ?auto_1726 - LOCATION
    )
    :vars
    (
      ?auto_1729 - LOCATION
      ?auto_1730 - CITY
      ?auto_1728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1729 ?auto_1730 ) ( IN-CITY ?auto_1726 ?auto_1730 ) ( not ( = ?auto_1726 ?auto_1729 ) ) ( OBJ-AT ?auto_1727 ?auto_1729 ) ( TRUCK-AT ?auto_1728 ?auto_1726 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1728 ?auto_1726 ?auto_1729 ?auto_1730 )
      ( !LOAD-TRUCK ?auto_1727 ?auto_1728 ?auto_1729 )
      ( !DRIVE-TRUCK ?auto_1728 ?auto_1729 ?auto_1726 ?auto_1730 )
      ( !UNLOAD-TRUCK ?auto_1727 ?auto_1728 ?auto_1726 )
      ( DELIVER-1PKG-VERIFY ?auto_1727 ?auto_1726 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1734 - OBJ
      ?auto_1733 - LOCATION
    )
    :vars
    (
      ?auto_1736 - LOCATION
      ?auto_1737 - CITY
      ?auto_1735 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1736 ?auto_1737 ) ( IN-CITY ?auto_1733 ?auto_1737 ) ( not ( = ?auto_1733 ?auto_1736 ) ) ( OBJ-AT ?auto_1734 ?auto_1736 ) ( TRUCK-AT ?auto_1735 ?auto_1733 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1735 ?auto_1733 ?auto_1736 ?auto_1737 )
      ( !LOAD-TRUCK ?auto_1734 ?auto_1735 ?auto_1736 )
      ( !DRIVE-TRUCK ?auto_1735 ?auto_1736 ?auto_1733 ?auto_1737 )
      ( !UNLOAD-TRUCK ?auto_1734 ?auto_1735 ?auto_1733 )
      ( DELIVER-1PKG-VERIFY ?auto_1734 ?auto_1733 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1748 - OBJ
      ?auto_1749 - OBJ
      ?auto_1747 - LOCATION
    )
    :vars
    (
      ?auto_1751 - LOCATION
      ?auto_1750 - CITY
      ?auto_1753 - LOCATION
      ?auto_1752 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1751 ?auto_1750 ) ( IN-CITY ?auto_1747 ?auto_1750 ) ( not ( = ?auto_1747 ?auto_1751 ) ) ( OBJ-AT ?auto_1749 ?auto_1751 ) ( IN-CITY ?auto_1753 ?auto_1750 ) ( not ( = ?auto_1747 ?auto_1753 ) ) ( OBJ-AT ?auto_1748 ?auto_1753 ) ( TRUCK-AT ?auto_1752 ?auto_1747 ) ( not ( = ?auto_1748 ?auto_1749 ) ) ( not ( = ?auto_1751 ?auto_1753 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1748 ?auto_1747 )
      ( DELIVER-1PKG ?auto_1749 ?auto_1747 )
      ( DELIVER-2PKG-VERIFY ?auto_1748 ?auto_1749 ?auto_1747 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1755 - OBJ
      ?auto_1756 - OBJ
      ?auto_1754 - LOCATION
    )
    :vars
    (
      ?auto_1758 - LOCATION
      ?auto_1757 - CITY
      ?auto_1760 - LOCATION
      ?auto_1759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1758 ?auto_1757 ) ( IN-CITY ?auto_1754 ?auto_1757 ) ( not ( = ?auto_1754 ?auto_1758 ) ) ( OBJ-AT ?auto_1755 ?auto_1758 ) ( IN-CITY ?auto_1760 ?auto_1757 ) ( not ( = ?auto_1754 ?auto_1760 ) ) ( OBJ-AT ?auto_1756 ?auto_1760 ) ( TRUCK-AT ?auto_1759 ?auto_1754 ) ( not ( = ?auto_1756 ?auto_1755 ) ) ( not ( = ?auto_1758 ?auto_1760 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1756 ?auto_1755 ?auto_1754 )
      ( DELIVER-2PKG-VERIFY ?auto_1755 ?auto_1756 ?auto_1754 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1772 - OBJ
      ?auto_1771 - LOCATION
    )
    :vars
    (
      ?auto_1774 - LOCATION
      ?auto_1775 - CITY
      ?auto_1773 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1774 ?auto_1775 ) ( IN-CITY ?auto_1771 ?auto_1775 ) ( not ( = ?auto_1771 ?auto_1774 ) ) ( OBJ-AT ?auto_1772 ?auto_1774 ) ( TRUCK-AT ?auto_1773 ?auto_1771 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1773 ?auto_1771 ?auto_1774 ?auto_1775 )
      ( !LOAD-TRUCK ?auto_1772 ?auto_1773 ?auto_1774 )
      ( !DRIVE-TRUCK ?auto_1773 ?auto_1774 ?auto_1771 ?auto_1775 )
      ( !UNLOAD-TRUCK ?auto_1772 ?auto_1773 ?auto_1771 )
      ( DELIVER-1PKG-VERIFY ?auto_1772 ?auto_1771 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1862 - OBJ
      ?auto_1863 - OBJ
      ?auto_1864 - OBJ
      ?auto_1861 - LOCATION
    )
    :vars
    (
      ?auto_1867 - LOCATION
      ?auto_1865 - CITY
      ?auto_1868 - LOCATION
      ?auto_1866 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1867 ?auto_1865 ) ( IN-CITY ?auto_1861 ?auto_1865 ) ( not ( = ?auto_1861 ?auto_1867 ) ) ( OBJ-AT ?auto_1864 ?auto_1867 ) ( IN-CITY ?auto_1868 ?auto_1865 ) ( not ( = ?auto_1861 ?auto_1868 ) ) ( OBJ-AT ?auto_1863 ?auto_1868 ) ( OBJ-AT ?auto_1862 ?auto_1867 ) ( TRUCK-AT ?auto_1866 ?auto_1861 ) ( not ( = ?auto_1862 ?auto_1863 ) ) ( not ( = ?auto_1868 ?auto_1867 ) ) ( not ( = ?auto_1862 ?auto_1864 ) ) ( not ( = ?auto_1863 ?auto_1864 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1863 ?auto_1862 ?auto_1861 )
      ( DELIVER-1PKG ?auto_1864 ?auto_1861 )
      ( DELIVER-3PKG-VERIFY ?auto_1862 ?auto_1863 ?auto_1864 ?auto_1861 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1879 - OBJ
      ?auto_1880 - OBJ
      ?auto_1881 - OBJ
      ?auto_1878 - LOCATION
    )
    :vars
    (
      ?auto_1884 - LOCATION
      ?auto_1882 - CITY
      ?auto_1885 - LOCATION
      ?auto_1883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1884 ?auto_1882 ) ( IN-CITY ?auto_1878 ?auto_1882 ) ( not ( = ?auto_1878 ?auto_1884 ) ) ( OBJ-AT ?auto_1880 ?auto_1884 ) ( IN-CITY ?auto_1885 ?auto_1882 ) ( not ( = ?auto_1878 ?auto_1885 ) ) ( OBJ-AT ?auto_1881 ?auto_1885 ) ( OBJ-AT ?auto_1879 ?auto_1884 ) ( TRUCK-AT ?auto_1883 ?auto_1878 ) ( not ( = ?auto_1879 ?auto_1881 ) ) ( not ( = ?auto_1885 ?auto_1884 ) ) ( not ( = ?auto_1879 ?auto_1880 ) ) ( not ( = ?auto_1881 ?auto_1880 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1879 ?auto_1881 ?auto_1880 ?auto_1878 )
      ( DELIVER-3PKG-VERIFY ?auto_1879 ?auto_1880 ?auto_1881 ?auto_1878 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1896 - OBJ
      ?auto_1897 - OBJ
      ?auto_1898 - OBJ
      ?auto_1895 - LOCATION
    )
    :vars
    (
      ?auto_1900 - LOCATION
      ?auto_1901 - CITY
      ?auto_1902 - LOCATION
      ?auto_1899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1900 ?auto_1901 ) ( IN-CITY ?auto_1895 ?auto_1901 ) ( not ( = ?auto_1895 ?auto_1900 ) ) ( OBJ-AT ?auto_1898 ?auto_1900 ) ( IN-CITY ?auto_1902 ?auto_1901 ) ( not ( = ?auto_1895 ?auto_1902 ) ) ( OBJ-AT ?auto_1896 ?auto_1902 ) ( OBJ-AT ?auto_1897 ?auto_1900 ) ( TRUCK-AT ?auto_1899 ?auto_1895 ) ( not ( = ?auto_1897 ?auto_1896 ) ) ( not ( = ?auto_1902 ?auto_1900 ) ) ( not ( = ?auto_1897 ?auto_1898 ) ) ( not ( = ?auto_1896 ?auto_1898 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1897 ?auto_1898 ?auto_1896 ?auto_1895 )
      ( DELIVER-3PKG-VERIFY ?auto_1896 ?auto_1897 ?auto_1898 ?auto_1895 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1913 - OBJ
      ?auto_1914 - OBJ
      ?auto_1915 - OBJ
      ?auto_1912 - LOCATION
    )
    :vars
    (
      ?auto_1917 - LOCATION
      ?auto_1918 - CITY
      ?auto_1919 - LOCATION
      ?auto_1916 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1917 ?auto_1918 ) ( IN-CITY ?auto_1912 ?auto_1918 ) ( not ( = ?auto_1912 ?auto_1917 ) ) ( OBJ-AT ?auto_1914 ?auto_1917 ) ( IN-CITY ?auto_1919 ?auto_1918 ) ( not ( = ?auto_1912 ?auto_1919 ) ) ( OBJ-AT ?auto_1913 ?auto_1919 ) ( OBJ-AT ?auto_1915 ?auto_1917 ) ( TRUCK-AT ?auto_1916 ?auto_1912 ) ( not ( = ?auto_1915 ?auto_1913 ) ) ( not ( = ?auto_1919 ?auto_1917 ) ) ( not ( = ?auto_1915 ?auto_1914 ) ) ( not ( = ?auto_1913 ?auto_1914 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1915 ?auto_1914 ?auto_1913 ?auto_1912 )
      ( DELIVER-3PKG-VERIFY ?auto_1913 ?auto_1914 ?auto_1915 ?auto_1912 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1948 - OBJ
      ?auto_1949 - OBJ
      ?auto_1950 - OBJ
      ?auto_1947 - LOCATION
    )
    :vars
    (
      ?auto_1952 - LOCATION
      ?auto_1953 - CITY
      ?auto_1954 - LOCATION
      ?auto_1951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1952 ?auto_1953 ) ( IN-CITY ?auto_1947 ?auto_1953 ) ( not ( = ?auto_1947 ?auto_1952 ) ) ( OBJ-AT ?auto_1948 ?auto_1952 ) ( IN-CITY ?auto_1954 ?auto_1953 ) ( not ( = ?auto_1947 ?auto_1954 ) ) ( OBJ-AT ?auto_1950 ?auto_1954 ) ( OBJ-AT ?auto_1949 ?auto_1952 ) ( TRUCK-AT ?auto_1951 ?auto_1947 ) ( not ( = ?auto_1949 ?auto_1950 ) ) ( not ( = ?auto_1954 ?auto_1952 ) ) ( not ( = ?auto_1949 ?auto_1948 ) ) ( not ( = ?auto_1950 ?auto_1948 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1949 ?auto_1948 ?auto_1950 ?auto_1947 )
      ( DELIVER-3PKG-VERIFY ?auto_1948 ?auto_1949 ?auto_1950 ?auto_1947 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1965 - OBJ
      ?auto_1966 - OBJ
      ?auto_1967 - OBJ
      ?auto_1964 - LOCATION
    )
    :vars
    (
      ?auto_1969 - LOCATION
      ?auto_1970 - CITY
      ?auto_1971 - LOCATION
      ?auto_1968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1969 ?auto_1970 ) ( IN-CITY ?auto_1964 ?auto_1970 ) ( not ( = ?auto_1964 ?auto_1969 ) ) ( OBJ-AT ?auto_1965 ?auto_1969 ) ( IN-CITY ?auto_1971 ?auto_1970 ) ( not ( = ?auto_1964 ?auto_1971 ) ) ( OBJ-AT ?auto_1966 ?auto_1971 ) ( OBJ-AT ?auto_1967 ?auto_1969 ) ( TRUCK-AT ?auto_1968 ?auto_1964 ) ( not ( = ?auto_1967 ?auto_1966 ) ) ( not ( = ?auto_1971 ?auto_1969 ) ) ( not ( = ?auto_1967 ?auto_1965 ) ) ( not ( = ?auto_1966 ?auto_1965 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1967 ?auto_1965 ?auto_1966 ?auto_1964 )
      ( DELIVER-3PKG-VERIFY ?auto_1965 ?auto_1966 ?auto_1967 ?auto_1964 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2021 - OBJ
      ?auto_2020 - LOCATION
    )
    :vars
    (
      ?auto_2023 - LOCATION
      ?auto_2024 - CITY
      ?auto_2022 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2023 ?auto_2024 ) ( IN-CITY ?auto_2020 ?auto_2024 ) ( not ( = ?auto_2020 ?auto_2023 ) ) ( OBJ-AT ?auto_2021 ?auto_2023 ) ( TRUCK-AT ?auto_2022 ?auto_2020 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2022 ?auto_2020 ?auto_2023 ?auto_2024 )
      ( !LOAD-TRUCK ?auto_2021 ?auto_2022 ?auto_2023 )
      ( !DRIVE-TRUCK ?auto_2022 ?auto_2023 ?auto_2020 ?auto_2024 )
      ( !UNLOAD-TRUCK ?auto_2021 ?auto_2022 ?auto_2020 )
      ( DELIVER-1PKG-VERIFY ?auto_2021 ?auto_2020 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2994 - OBJ
      ?auto_2995 - OBJ
      ?auto_2996 - OBJ
      ?auto_2997 - OBJ
      ?auto_2993 - LOCATION
    )
    :vars
    (
      ?auto_3000 - LOCATION
      ?auto_2998 - CITY
      ?auto_3001 - LOCATION
      ?auto_2999 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3000 ?auto_2998 ) ( IN-CITY ?auto_2993 ?auto_2998 ) ( not ( = ?auto_2993 ?auto_3000 ) ) ( OBJ-AT ?auto_2997 ?auto_3000 ) ( OBJ-AT ?auto_2996 ?auto_3000 ) ( IN-CITY ?auto_3001 ?auto_2998 ) ( not ( = ?auto_2993 ?auto_3001 ) ) ( OBJ-AT ?auto_2995 ?auto_3001 ) ( OBJ-AT ?auto_2994 ?auto_3000 ) ( TRUCK-AT ?auto_2999 ?auto_2993 ) ( not ( = ?auto_2994 ?auto_2995 ) ) ( not ( = ?auto_3001 ?auto_3000 ) ) ( not ( = ?auto_2994 ?auto_2996 ) ) ( not ( = ?auto_2995 ?auto_2996 ) ) ( not ( = ?auto_2994 ?auto_2997 ) ) ( not ( = ?auto_2995 ?auto_2997 ) ) ( not ( = ?auto_2996 ?auto_2997 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2994 ?auto_2996 ?auto_2995 ?auto_2993 )
      ( DELIVER-1PKG ?auto_2997 ?auto_2993 )
      ( DELIVER-4PKG-VERIFY ?auto_2994 ?auto_2995 ?auto_2996 ?auto_2997 ?auto_2993 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3023 - OBJ
      ?auto_3024 - OBJ
      ?auto_3025 - OBJ
      ?auto_3026 - OBJ
      ?auto_3022 - LOCATION
    )
    :vars
    (
      ?auto_3028 - LOCATION
      ?auto_3027 - CITY
      ?auto_3030 - LOCATION
      ?auto_3029 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3028 ?auto_3027 ) ( IN-CITY ?auto_3022 ?auto_3027 ) ( not ( = ?auto_3022 ?auto_3028 ) ) ( OBJ-AT ?auto_3025 ?auto_3028 ) ( OBJ-AT ?auto_3026 ?auto_3028 ) ( IN-CITY ?auto_3030 ?auto_3027 ) ( not ( = ?auto_3022 ?auto_3030 ) ) ( OBJ-AT ?auto_3024 ?auto_3030 ) ( OBJ-AT ?auto_3023 ?auto_3028 ) ( TRUCK-AT ?auto_3029 ?auto_3022 ) ( not ( = ?auto_3023 ?auto_3024 ) ) ( not ( = ?auto_3030 ?auto_3028 ) ) ( not ( = ?auto_3023 ?auto_3026 ) ) ( not ( = ?auto_3024 ?auto_3026 ) ) ( not ( = ?auto_3023 ?auto_3025 ) ) ( not ( = ?auto_3024 ?auto_3025 ) ) ( not ( = ?auto_3026 ?auto_3025 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3023 ?auto_3024 ?auto_3026 ?auto_3025 ?auto_3022 )
      ( DELIVER-4PKG-VERIFY ?auto_3023 ?auto_3024 ?auto_3025 ?auto_3026 ?auto_3022 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3052 - OBJ
      ?auto_3053 - OBJ
      ?auto_3054 - OBJ
      ?auto_3055 - OBJ
      ?auto_3051 - LOCATION
    )
    :vars
    (
      ?auto_3059 - LOCATION
      ?auto_3056 - CITY
      ?auto_3057 - LOCATION
      ?auto_3058 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3059 ?auto_3056 ) ( IN-CITY ?auto_3051 ?auto_3056 ) ( not ( = ?auto_3051 ?auto_3059 ) ) ( OBJ-AT ?auto_3055 ?auto_3059 ) ( OBJ-AT ?auto_3053 ?auto_3059 ) ( IN-CITY ?auto_3057 ?auto_3056 ) ( not ( = ?auto_3051 ?auto_3057 ) ) ( OBJ-AT ?auto_3054 ?auto_3057 ) ( OBJ-AT ?auto_3052 ?auto_3059 ) ( TRUCK-AT ?auto_3058 ?auto_3051 ) ( not ( = ?auto_3052 ?auto_3054 ) ) ( not ( = ?auto_3057 ?auto_3059 ) ) ( not ( = ?auto_3052 ?auto_3053 ) ) ( not ( = ?auto_3054 ?auto_3053 ) ) ( not ( = ?auto_3052 ?auto_3055 ) ) ( not ( = ?auto_3054 ?auto_3055 ) ) ( not ( = ?auto_3053 ?auto_3055 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3052 ?auto_3054 ?auto_3055 ?auto_3053 ?auto_3051 )
      ( DELIVER-4PKG-VERIFY ?auto_3052 ?auto_3053 ?auto_3054 ?auto_3055 ?auto_3051 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3081 - OBJ
      ?auto_3082 - OBJ
      ?auto_3083 - OBJ
      ?auto_3084 - OBJ
      ?auto_3080 - LOCATION
    )
    :vars
    (
      ?auto_3088 - LOCATION
      ?auto_3085 - CITY
      ?auto_3086 - LOCATION
      ?auto_3087 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3088 ?auto_3085 ) ( IN-CITY ?auto_3080 ?auto_3085 ) ( not ( = ?auto_3080 ?auto_3088 ) ) ( OBJ-AT ?auto_3083 ?auto_3088 ) ( OBJ-AT ?auto_3082 ?auto_3088 ) ( IN-CITY ?auto_3086 ?auto_3085 ) ( not ( = ?auto_3080 ?auto_3086 ) ) ( OBJ-AT ?auto_3084 ?auto_3086 ) ( OBJ-AT ?auto_3081 ?auto_3088 ) ( TRUCK-AT ?auto_3087 ?auto_3080 ) ( not ( = ?auto_3081 ?auto_3084 ) ) ( not ( = ?auto_3086 ?auto_3088 ) ) ( not ( = ?auto_3081 ?auto_3082 ) ) ( not ( = ?auto_3084 ?auto_3082 ) ) ( not ( = ?auto_3081 ?auto_3083 ) ) ( not ( = ?auto_3084 ?auto_3083 ) ) ( not ( = ?auto_3082 ?auto_3083 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3081 ?auto_3084 ?auto_3083 ?auto_3082 ?auto_3080 )
      ( DELIVER-4PKG-VERIFY ?auto_3081 ?auto_3082 ?auto_3083 ?auto_3084 ?auto_3080 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3172 - OBJ
      ?auto_3173 - OBJ
      ?auto_3174 - OBJ
      ?auto_3175 - OBJ
      ?auto_3171 - LOCATION
    )
    :vars
    (
      ?auto_3179 - LOCATION
      ?auto_3176 - CITY
      ?auto_3177 - LOCATION
      ?auto_3178 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3179 ?auto_3176 ) ( IN-CITY ?auto_3171 ?auto_3176 ) ( not ( = ?auto_3171 ?auto_3179 ) ) ( OBJ-AT ?auto_3173 ?auto_3179 ) ( OBJ-AT ?auto_3175 ?auto_3179 ) ( IN-CITY ?auto_3177 ?auto_3176 ) ( not ( = ?auto_3171 ?auto_3177 ) ) ( OBJ-AT ?auto_3174 ?auto_3177 ) ( OBJ-AT ?auto_3172 ?auto_3179 ) ( TRUCK-AT ?auto_3178 ?auto_3171 ) ( not ( = ?auto_3172 ?auto_3174 ) ) ( not ( = ?auto_3177 ?auto_3179 ) ) ( not ( = ?auto_3172 ?auto_3175 ) ) ( not ( = ?auto_3174 ?auto_3175 ) ) ( not ( = ?auto_3172 ?auto_3173 ) ) ( not ( = ?auto_3174 ?auto_3173 ) ) ( not ( = ?auto_3175 ?auto_3173 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3172 ?auto_3174 ?auto_3173 ?auto_3175 ?auto_3171 )
      ( DELIVER-4PKG-VERIFY ?auto_3172 ?auto_3173 ?auto_3174 ?auto_3175 ?auto_3171 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3201 - OBJ
      ?auto_3202 - OBJ
      ?auto_3203 - OBJ
      ?auto_3204 - OBJ
      ?auto_3200 - LOCATION
    )
    :vars
    (
      ?auto_3208 - LOCATION
      ?auto_3205 - CITY
      ?auto_3206 - LOCATION
      ?auto_3207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3208 ?auto_3205 ) ( IN-CITY ?auto_3200 ?auto_3205 ) ( not ( = ?auto_3200 ?auto_3208 ) ) ( OBJ-AT ?auto_3202 ?auto_3208 ) ( OBJ-AT ?auto_3203 ?auto_3208 ) ( IN-CITY ?auto_3206 ?auto_3205 ) ( not ( = ?auto_3200 ?auto_3206 ) ) ( OBJ-AT ?auto_3204 ?auto_3206 ) ( OBJ-AT ?auto_3201 ?auto_3208 ) ( TRUCK-AT ?auto_3207 ?auto_3200 ) ( not ( = ?auto_3201 ?auto_3204 ) ) ( not ( = ?auto_3206 ?auto_3208 ) ) ( not ( = ?auto_3201 ?auto_3203 ) ) ( not ( = ?auto_3204 ?auto_3203 ) ) ( not ( = ?auto_3201 ?auto_3202 ) ) ( not ( = ?auto_3204 ?auto_3202 ) ) ( not ( = ?auto_3203 ?auto_3202 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3201 ?auto_3204 ?auto_3202 ?auto_3203 ?auto_3200 )
      ( DELIVER-4PKG-VERIFY ?auto_3201 ?auto_3202 ?auto_3203 ?auto_3204 ?auto_3200 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3292 - OBJ
      ?auto_3293 - OBJ
      ?auto_3294 - OBJ
      ?auto_3295 - OBJ
      ?auto_3291 - LOCATION
    )
    :vars
    (
      ?auto_3299 - LOCATION
      ?auto_3296 - CITY
      ?auto_3297 - LOCATION
      ?auto_3298 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3299 ?auto_3296 ) ( IN-CITY ?auto_3291 ?auto_3296 ) ( not ( = ?auto_3291 ?auto_3299 ) ) ( OBJ-AT ?auto_3295 ?auto_3299 ) ( OBJ-AT ?auto_3294 ?auto_3299 ) ( IN-CITY ?auto_3297 ?auto_3296 ) ( not ( = ?auto_3291 ?auto_3297 ) ) ( OBJ-AT ?auto_3292 ?auto_3297 ) ( OBJ-AT ?auto_3293 ?auto_3299 ) ( TRUCK-AT ?auto_3298 ?auto_3291 ) ( not ( = ?auto_3293 ?auto_3292 ) ) ( not ( = ?auto_3297 ?auto_3299 ) ) ( not ( = ?auto_3293 ?auto_3294 ) ) ( not ( = ?auto_3292 ?auto_3294 ) ) ( not ( = ?auto_3293 ?auto_3295 ) ) ( not ( = ?auto_3292 ?auto_3295 ) ) ( not ( = ?auto_3294 ?auto_3295 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3293 ?auto_3292 ?auto_3295 ?auto_3294 ?auto_3291 )
      ( DELIVER-4PKG-VERIFY ?auto_3292 ?auto_3293 ?auto_3294 ?auto_3295 ?auto_3291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3321 - OBJ
      ?auto_3322 - OBJ
      ?auto_3323 - OBJ
      ?auto_3324 - OBJ
      ?auto_3320 - LOCATION
    )
    :vars
    (
      ?auto_3328 - LOCATION
      ?auto_3325 - CITY
      ?auto_3326 - LOCATION
      ?auto_3327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3328 ?auto_3325 ) ( IN-CITY ?auto_3320 ?auto_3325 ) ( not ( = ?auto_3320 ?auto_3328 ) ) ( OBJ-AT ?auto_3323 ?auto_3328 ) ( OBJ-AT ?auto_3324 ?auto_3328 ) ( IN-CITY ?auto_3326 ?auto_3325 ) ( not ( = ?auto_3320 ?auto_3326 ) ) ( OBJ-AT ?auto_3321 ?auto_3326 ) ( OBJ-AT ?auto_3322 ?auto_3328 ) ( TRUCK-AT ?auto_3327 ?auto_3320 ) ( not ( = ?auto_3322 ?auto_3321 ) ) ( not ( = ?auto_3326 ?auto_3328 ) ) ( not ( = ?auto_3322 ?auto_3324 ) ) ( not ( = ?auto_3321 ?auto_3324 ) ) ( not ( = ?auto_3322 ?auto_3323 ) ) ( not ( = ?auto_3321 ?auto_3323 ) ) ( not ( = ?auto_3324 ?auto_3323 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3322 ?auto_3321 ?auto_3323 ?auto_3324 ?auto_3320 )
      ( DELIVER-4PKG-VERIFY ?auto_3321 ?auto_3322 ?auto_3323 ?auto_3324 ?auto_3320 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3413 - OBJ
      ?auto_3414 - OBJ
      ?auto_3415 - OBJ
      ?auto_3416 - OBJ
      ?auto_3412 - LOCATION
    )
    :vars
    (
      ?auto_3420 - LOCATION
      ?auto_3417 - CITY
      ?auto_3418 - LOCATION
      ?auto_3419 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3420 ?auto_3417 ) ( IN-CITY ?auto_3412 ?auto_3417 ) ( not ( = ?auto_3412 ?auto_3420 ) ) ( OBJ-AT ?auto_3416 ?auto_3420 ) ( OBJ-AT ?auto_3414 ?auto_3420 ) ( IN-CITY ?auto_3418 ?auto_3417 ) ( not ( = ?auto_3412 ?auto_3418 ) ) ( OBJ-AT ?auto_3413 ?auto_3418 ) ( OBJ-AT ?auto_3415 ?auto_3420 ) ( TRUCK-AT ?auto_3419 ?auto_3412 ) ( not ( = ?auto_3415 ?auto_3413 ) ) ( not ( = ?auto_3418 ?auto_3420 ) ) ( not ( = ?auto_3415 ?auto_3414 ) ) ( not ( = ?auto_3413 ?auto_3414 ) ) ( not ( = ?auto_3415 ?auto_3416 ) ) ( not ( = ?auto_3413 ?auto_3416 ) ) ( not ( = ?auto_3414 ?auto_3416 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3415 ?auto_3413 ?auto_3416 ?auto_3414 ?auto_3412 )
      ( DELIVER-4PKG-VERIFY ?auto_3413 ?auto_3414 ?auto_3415 ?auto_3416 ?auto_3412 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3442 - OBJ
      ?auto_3443 - OBJ
      ?auto_3444 - OBJ
      ?auto_3445 - OBJ
      ?auto_3441 - LOCATION
    )
    :vars
    (
      ?auto_3449 - LOCATION
      ?auto_3446 - CITY
      ?auto_3447 - LOCATION
      ?auto_3448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3449 ?auto_3446 ) ( IN-CITY ?auto_3441 ?auto_3446 ) ( not ( = ?auto_3441 ?auto_3449 ) ) ( OBJ-AT ?auto_3444 ?auto_3449 ) ( OBJ-AT ?auto_3443 ?auto_3449 ) ( IN-CITY ?auto_3447 ?auto_3446 ) ( not ( = ?auto_3441 ?auto_3447 ) ) ( OBJ-AT ?auto_3442 ?auto_3447 ) ( OBJ-AT ?auto_3445 ?auto_3449 ) ( TRUCK-AT ?auto_3448 ?auto_3441 ) ( not ( = ?auto_3445 ?auto_3442 ) ) ( not ( = ?auto_3447 ?auto_3449 ) ) ( not ( = ?auto_3445 ?auto_3443 ) ) ( not ( = ?auto_3442 ?auto_3443 ) ) ( not ( = ?auto_3445 ?auto_3444 ) ) ( not ( = ?auto_3442 ?auto_3444 ) ) ( not ( = ?auto_3443 ?auto_3444 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3445 ?auto_3442 ?auto_3444 ?auto_3443 ?auto_3441 )
      ( DELIVER-4PKG-VERIFY ?auto_3442 ?auto_3443 ?auto_3444 ?auto_3445 ?auto_3441 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3501 - OBJ
      ?auto_3502 - OBJ
      ?auto_3503 - OBJ
      ?auto_3504 - OBJ
      ?auto_3500 - LOCATION
    )
    :vars
    (
      ?auto_3508 - LOCATION
      ?auto_3505 - CITY
      ?auto_3506 - LOCATION
      ?auto_3507 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3508 ?auto_3505 ) ( IN-CITY ?auto_3500 ?auto_3505 ) ( not ( = ?auto_3500 ?auto_3508 ) ) ( OBJ-AT ?auto_3502 ?auto_3508 ) ( OBJ-AT ?auto_3504 ?auto_3508 ) ( IN-CITY ?auto_3506 ?auto_3505 ) ( not ( = ?auto_3500 ?auto_3506 ) ) ( OBJ-AT ?auto_3501 ?auto_3506 ) ( OBJ-AT ?auto_3503 ?auto_3508 ) ( TRUCK-AT ?auto_3507 ?auto_3500 ) ( not ( = ?auto_3503 ?auto_3501 ) ) ( not ( = ?auto_3506 ?auto_3508 ) ) ( not ( = ?auto_3503 ?auto_3504 ) ) ( not ( = ?auto_3501 ?auto_3504 ) ) ( not ( = ?auto_3503 ?auto_3502 ) ) ( not ( = ?auto_3501 ?auto_3502 ) ) ( not ( = ?auto_3504 ?auto_3502 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3503 ?auto_3501 ?auto_3502 ?auto_3504 ?auto_3500 )
      ( DELIVER-4PKG-VERIFY ?auto_3501 ?auto_3502 ?auto_3503 ?auto_3504 ?auto_3500 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3562 - OBJ
      ?auto_3563 - OBJ
      ?auto_3564 - OBJ
      ?auto_3565 - OBJ
      ?auto_3561 - LOCATION
    )
    :vars
    (
      ?auto_3569 - LOCATION
      ?auto_3566 - CITY
      ?auto_3567 - LOCATION
      ?auto_3568 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3569 ?auto_3566 ) ( IN-CITY ?auto_3561 ?auto_3566 ) ( not ( = ?auto_3561 ?auto_3569 ) ) ( OBJ-AT ?auto_3563 ?auto_3569 ) ( OBJ-AT ?auto_3564 ?auto_3569 ) ( IN-CITY ?auto_3567 ?auto_3566 ) ( not ( = ?auto_3561 ?auto_3567 ) ) ( OBJ-AT ?auto_3562 ?auto_3567 ) ( OBJ-AT ?auto_3565 ?auto_3569 ) ( TRUCK-AT ?auto_3568 ?auto_3561 ) ( not ( = ?auto_3565 ?auto_3562 ) ) ( not ( = ?auto_3567 ?auto_3569 ) ) ( not ( = ?auto_3565 ?auto_3564 ) ) ( not ( = ?auto_3562 ?auto_3564 ) ) ( not ( = ?auto_3565 ?auto_3563 ) ) ( not ( = ?auto_3562 ?auto_3563 ) ) ( not ( = ?auto_3564 ?auto_3563 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3565 ?auto_3562 ?auto_3563 ?auto_3564 ?auto_3561 )
      ( DELIVER-4PKG-VERIFY ?auto_3562 ?auto_3563 ?auto_3564 ?auto_3565 ?auto_3561 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3653 - OBJ
      ?auto_3654 - OBJ
      ?auto_3655 - OBJ
      ?auto_3656 - OBJ
      ?auto_3652 - LOCATION
    )
    :vars
    (
      ?auto_3660 - LOCATION
      ?auto_3657 - CITY
      ?auto_3658 - LOCATION
      ?auto_3659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3660 ?auto_3657 ) ( IN-CITY ?auto_3652 ?auto_3657 ) ( not ( = ?auto_3652 ?auto_3660 ) ) ( OBJ-AT ?auto_3656 ?auto_3660 ) ( OBJ-AT ?auto_3653 ?auto_3660 ) ( IN-CITY ?auto_3658 ?auto_3657 ) ( not ( = ?auto_3652 ?auto_3658 ) ) ( OBJ-AT ?auto_3655 ?auto_3658 ) ( OBJ-AT ?auto_3654 ?auto_3660 ) ( TRUCK-AT ?auto_3659 ?auto_3652 ) ( not ( = ?auto_3654 ?auto_3655 ) ) ( not ( = ?auto_3658 ?auto_3660 ) ) ( not ( = ?auto_3654 ?auto_3653 ) ) ( not ( = ?auto_3655 ?auto_3653 ) ) ( not ( = ?auto_3654 ?auto_3656 ) ) ( not ( = ?auto_3655 ?auto_3656 ) ) ( not ( = ?auto_3653 ?auto_3656 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3654 ?auto_3655 ?auto_3656 ?auto_3653 ?auto_3652 )
      ( DELIVER-4PKG-VERIFY ?auto_3653 ?auto_3654 ?auto_3655 ?auto_3656 ?auto_3652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3682 - OBJ
      ?auto_3683 - OBJ
      ?auto_3684 - OBJ
      ?auto_3685 - OBJ
      ?auto_3681 - LOCATION
    )
    :vars
    (
      ?auto_3689 - LOCATION
      ?auto_3686 - CITY
      ?auto_3687 - LOCATION
      ?auto_3688 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3689 ?auto_3686 ) ( IN-CITY ?auto_3681 ?auto_3686 ) ( not ( = ?auto_3681 ?auto_3689 ) ) ( OBJ-AT ?auto_3684 ?auto_3689 ) ( OBJ-AT ?auto_3682 ?auto_3689 ) ( IN-CITY ?auto_3687 ?auto_3686 ) ( not ( = ?auto_3681 ?auto_3687 ) ) ( OBJ-AT ?auto_3685 ?auto_3687 ) ( OBJ-AT ?auto_3683 ?auto_3689 ) ( TRUCK-AT ?auto_3688 ?auto_3681 ) ( not ( = ?auto_3683 ?auto_3685 ) ) ( not ( = ?auto_3687 ?auto_3689 ) ) ( not ( = ?auto_3683 ?auto_3682 ) ) ( not ( = ?auto_3685 ?auto_3682 ) ) ( not ( = ?auto_3683 ?auto_3684 ) ) ( not ( = ?auto_3685 ?auto_3684 ) ) ( not ( = ?auto_3682 ?auto_3684 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3683 ?auto_3685 ?auto_3684 ?auto_3682 ?auto_3681 )
      ( DELIVER-4PKG-VERIFY ?auto_3682 ?auto_3683 ?auto_3684 ?auto_3685 ?auto_3681 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3711 - OBJ
      ?auto_3712 - OBJ
      ?auto_3713 - OBJ
      ?auto_3714 - OBJ
      ?auto_3710 - LOCATION
    )
    :vars
    (
      ?auto_3718 - LOCATION
      ?auto_3715 - CITY
      ?auto_3716 - LOCATION
      ?auto_3717 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3718 ?auto_3715 ) ( IN-CITY ?auto_3710 ?auto_3715 ) ( not ( = ?auto_3710 ?auto_3718 ) ) ( OBJ-AT ?auto_3714 ?auto_3718 ) ( OBJ-AT ?auto_3711 ?auto_3718 ) ( IN-CITY ?auto_3716 ?auto_3715 ) ( not ( = ?auto_3710 ?auto_3716 ) ) ( OBJ-AT ?auto_3712 ?auto_3716 ) ( OBJ-AT ?auto_3713 ?auto_3718 ) ( TRUCK-AT ?auto_3717 ?auto_3710 ) ( not ( = ?auto_3713 ?auto_3712 ) ) ( not ( = ?auto_3716 ?auto_3718 ) ) ( not ( = ?auto_3713 ?auto_3711 ) ) ( not ( = ?auto_3712 ?auto_3711 ) ) ( not ( = ?auto_3713 ?auto_3714 ) ) ( not ( = ?auto_3712 ?auto_3714 ) ) ( not ( = ?auto_3711 ?auto_3714 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3713 ?auto_3712 ?auto_3714 ?auto_3711 ?auto_3710 )
      ( DELIVER-4PKG-VERIFY ?auto_3711 ?auto_3712 ?auto_3713 ?auto_3714 ?auto_3710 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3740 - OBJ
      ?auto_3741 - OBJ
      ?auto_3742 - OBJ
      ?auto_3743 - OBJ
      ?auto_3739 - LOCATION
    )
    :vars
    (
      ?auto_3747 - LOCATION
      ?auto_3744 - CITY
      ?auto_3745 - LOCATION
      ?auto_3746 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3747 ?auto_3744 ) ( IN-CITY ?auto_3739 ?auto_3744 ) ( not ( = ?auto_3739 ?auto_3747 ) ) ( OBJ-AT ?auto_3742 ?auto_3747 ) ( OBJ-AT ?auto_3740 ?auto_3747 ) ( IN-CITY ?auto_3745 ?auto_3744 ) ( not ( = ?auto_3739 ?auto_3745 ) ) ( OBJ-AT ?auto_3741 ?auto_3745 ) ( OBJ-AT ?auto_3743 ?auto_3747 ) ( TRUCK-AT ?auto_3746 ?auto_3739 ) ( not ( = ?auto_3743 ?auto_3741 ) ) ( not ( = ?auto_3745 ?auto_3747 ) ) ( not ( = ?auto_3743 ?auto_3740 ) ) ( not ( = ?auto_3741 ?auto_3740 ) ) ( not ( = ?auto_3743 ?auto_3742 ) ) ( not ( = ?auto_3741 ?auto_3742 ) ) ( not ( = ?auto_3740 ?auto_3742 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3743 ?auto_3741 ?auto_3742 ?auto_3740 ?auto_3739 )
      ( DELIVER-4PKG-VERIFY ?auto_3740 ?auto_3741 ?auto_3742 ?auto_3743 ?auto_3739 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3862 - OBJ
      ?auto_3863 - OBJ
      ?auto_3864 - OBJ
      ?auto_3865 - OBJ
      ?auto_3861 - LOCATION
    )
    :vars
    (
      ?auto_3869 - LOCATION
      ?auto_3866 - CITY
      ?auto_3867 - LOCATION
      ?auto_3868 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3869 ?auto_3866 ) ( IN-CITY ?auto_3861 ?auto_3866 ) ( not ( = ?auto_3861 ?auto_3869 ) ) ( OBJ-AT ?auto_3863 ?auto_3869 ) ( OBJ-AT ?auto_3862 ?auto_3869 ) ( IN-CITY ?auto_3867 ?auto_3866 ) ( not ( = ?auto_3861 ?auto_3867 ) ) ( OBJ-AT ?auto_3865 ?auto_3867 ) ( OBJ-AT ?auto_3864 ?auto_3869 ) ( TRUCK-AT ?auto_3868 ?auto_3861 ) ( not ( = ?auto_3864 ?auto_3865 ) ) ( not ( = ?auto_3867 ?auto_3869 ) ) ( not ( = ?auto_3864 ?auto_3862 ) ) ( not ( = ?auto_3865 ?auto_3862 ) ) ( not ( = ?auto_3864 ?auto_3863 ) ) ( not ( = ?auto_3865 ?auto_3863 ) ) ( not ( = ?auto_3862 ?auto_3863 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3864 ?auto_3865 ?auto_3863 ?auto_3862 ?auto_3861 )
      ( DELIVER-4PKG-VERIFY ?auto_3862 ?auto_3863 ?auto_3864 ?auto_3865 ?auto_3861 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_3891 - OBJ
      ?auto_3892 - OBJ
      ?auto_3893 - OBJ
      ?auto_3894 - OBJ
      ?auto_3890 - LOCATION
    )
    :vars
    (
      ?auto_3898 - LOCATION
      ?auto_3895 - CITY
      ?auto_3896 - LOCATION
      ?auto_3897 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3898 ?auto_3895 ) ( IN-CITY ?auto_3890 ?auto_3895 ) ( not ( = ?auto_3890 ?auto_3898 ) ) ( OBJ-AT ?auto_3892 ?auto_3898 ) ( OBJ-AT ?auto_3891 ?auto_3898 ) ( IN-CITY ?auto_3896 ?auto_3895 ) ( not ( = ?auto_3890 ?auto_3896 ) ) ( OBJ-AT ?auto_3893 ?auto_3896 ) ( OBJ-AT ?auto_3894 ?auto_3898 ) ( TRUCK-AT ?auto_3897 ?auto_3890 ) ( not ( = ?auto_3894 ?auto_3893 ) ) ( not ( = ?auto_3896 ?auto_3898 ) ) ( not ( = ?auto_3894 ?auto_3891 ) ) ( not ( = ?auto_3893 ?auto_3891 ) ) ( not ( = ?auto_3894 ?auto_3892 ) ) ( not ( = ?auto_3893 ?auto_3892 ) ) ( not ( = ?auto_3891 ?auto_3892 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_3894 ?auto_3893 ?auto_3892 ?auto_3891 ?auto_3890 )
      ( DELIVER-4PKG-VERIFY ?auto_3891 ?auto_3892 ?auto_3893 ?auto_3894 ?auto_3890 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4076 - OBJ
      ?auto_4077 - OBJ
      ?auto_4078 - OBJ
      ?auto_4079 - OBJ
      ?auto_4075 - LOCATION
    )
    :vars
    (
      ?auto_4083 - LOCATION
      ?auto_4080 - CITY
      ?auto_4081 - LOCATION
      ?auto_4082 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4083 ?auto_4080 ) ( IN-CITY ?auto_4075 ?auto_4080 ) ( not ( = ?auto_4075 ?auto_4083 ) ) ( OBJ-AT ?auto_4076 ?auto_4083 ) ( OBJ-AT ?auto_4079 ?auto_4083 ) ( IN-CITY ?auto_4081 ?auto_4080 ) ( not ( = ?auto_4075 ?auto_4081 ) ) ( OBJ-AT ?auto_4078 ?auto_4081 ) ( OBJ-AT ?auto_4077 ?auto_4083 ) ( TRUCK-AT ?auto_4082 ?auto_4075 ) ( not ( = ?auto_4077 ?auto_4078 ) ) ( not ( = ?auto_4081 ?auto_4083 ) ) ( not ( = ?auto_4077 ?auto_4079 ) ) ( not ( = ?auto_4078 ?auto_4079 ) ) ( not ( = ?auto_4077 ?auto_4076 ) ) ( not ( = ?auto_4078 ?auto_4076 ) ) ( not ( = ?auto_4079 ?auto_4076 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4077 ?auto_4078 ?auto_4076 ?auto_4079 ?auto_4075 )
      ( DELIVER-4PKG-VERIFY ?auto_4076 ?auto_4077 ?auto_4078 ?auto_4079 ?auto_4075 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4105 - OBJ
      ?auto_4106 - OBJ
      ?auto_4107 - OBJ
      ?auto_4108 - OBJ
      ?auto_4104 - LOCATION
    )
    :vars
    (
      ?auto_4112 - LOCATION
      ?auto_4109 - CITY
      ?auto_4110 - LOCATION
      ?auto_4111 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4112 ?auto_4109 ) ( IN-CITY ?auto_4104 ?auto_4109 ) ( not ( = ?auto_4104 ?auto_4112 ) ) ( OBJ-AT ?auto_4105 ?auto_4112 ) ( OBJ-AT ?auto_4107 ?auto_4112 ) ( IN-CITY ?auto_4110 ?auto_4109 ) ( not ( = ?auto_4104 ?auto_4110 ) ) ( OBJ-AT ?auto_4108 ?auto_4110 ) ( OBJ-AT ?auto_4106 ?auto_4112 ) ( TRUCK-AT ?auto_4111 ?auto_4104 ) ( not ( = ?auto_4106 ?auto_4108 ) ) ( not ( = ?auto_4110 ?auto_4112 ) ) ( not ( = ?auto_4106 ?auto_4107 ) ) ( not ( = ?auto_4108 ?auto_4107 ) ) ( not ( = ?auto_4106 ?auto_4105 ) ) ( not ( = ?auto_4108 ?auto_4105 ) ) ( not ( = ?auto_4107 ?auto_4105 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4106 ?auto_4108 ?auto_4105 ?auto_4107 ?auto_4104 )
      ( DELIVER-4PKG-VERIFY ?auto_4105 ?auto_4106 ?auto_4107 ?auto_4108 ?auto_4104 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4196 - OBJ
      ?auto_4197 - OBJ
      ?auto_4198 - OBJ
      ?auto_4199 - OBJ
      ?auto_4195 - LOCATION
    )
    :vars
    (
      ?auto_4203 - LOCATION
      ?auto_4200 - CITY
      ?auto_4201 - LOCATION
      ?auto_4202 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4203 ?auto_4200 ) ( IN-CITY ?auto_4195 ?auto_4200 ) ( not ( = ?auto_4195 ?auto_4203 ) ) ( OBJ-AT ?auto_4196 ?auto_4203 ) ( OBJ-AT ?auto_4199 ?auto_4203 ) ( IN-CITY ?auto_4201 ?auto_4200 ) ( not ( = ?auto_4195 ?auto_4201 ) ) ( OBJ-AT ?auto_4197 ?auto_4201 ) ( OBJ-AT ?auto_4198 ?auto_4203 ) ( TRUCK-AT ?auto_4202 ?auto_4195 ) ( not ( = ?auto_4198 ?auto_4197 ) ) ( not ( = ?auto_4201 ?auto_4203 ) ) ( not ( = ?auto_4198 ?auto_4199 ) ) ( not ( = ?auto_4197 ?auto_4199 ) ) ( not ( = ?auto_4198 ?auto_4196 ) ) ( not ( = ?auto_4197 ?auto_4196 ) ) ( not ( = ?auto_4199 ?auto_4196 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4198 ?auto_4197 ?auto_4196 ?auto_4199 ?auto_4195 )
      ( DELIVER-4PKG-VERIFY ?auto_4196 ?auto_4197 ?auto_4198 ?auto_4199 ?auto_4195 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4257 - OBJ
      ?auto_4258 - OBJ
      ?auto_4259 - OBJ
      ?auto_4260 - OBJ
      ?auto_4256 - LOCATION
    )
    :vars
    (
      ?auto_4264 - LOCATION
      ?auto_4261 - CITY
      ?auto_4262 - LOCATION
      ?auto_4263 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4264 ?auto_4261 ) ( IN-CITY ?auto_4256 ?auto_4261 ) ( not ( = ?auto_4256 ?auto_4264 ) ) ( OBJ-AT ?auto_4257 ?auto_4264 ) ( OBJ-AT ?auto_4259 ?auto_4264 ) ( IN-CITY ?auto_4262 ?auto_4261 ) ( not ( = ?auto_4256 ?auto_4262 ) ) ( OBJ-AT ?auto_4258 ?auto_4262 ) ( OBJ-AT ?auto_4260 ?auto_4264 ) ( TRUCK-AT ?auto_4263 ?auto_4256 ) ( not ( = ?auto_4260 ?auto_4258 ) ) ( not ( = ?auto_4262 ?auto_4264 ) ) ( not ( = ?auto_4260 ?auto_4259 ) ) ( not ( = ?auto_4258 ?auto_4259 ) ) ( not ( = ?auto_4260 ?auto_4257 ) ) ( not ( = ?auto_4258 ?auto_4257 ) ) ( not ( = ?auto_4259 ?auto_4257 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4260 ?auto_4258 ?auto_4257 ?auto_4259 ?auto_4256 )
      ( DELIVER-4PKG-VERIFY ?auto_4257 ?auto_4258 ?auto_4259 ?auto_4260 ?auto_4256 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4348 - OBJ
      ?auto_4349 - OBJ
      ?auto_4350 - OBJ
      ?auto_4351 - OBJ
      ?auto_4347 - LOCATION
    )
    :vars
    (
      ?auto_4355 - LOCATION
      ?auto_4352 - CITY
      ?auto_4353 - LOCATION
      ?auto_4354 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4355 ?auto_4352 ) ( IN-CITY ?auto_4347 ?auto_4352 ) ( not ( = ?auto_4347 ?auto_4355 ) ) ( OBJ-AT ?auto_4348 ?auto_4355 ) ( OBJ-AT ?auto_4349 ?auto_4355 ) ( IN-CITY ?auto_4353 ?auto_4352 ) ( not ( = ?auto_4347 ?auto_4353 ) ) ( OBJ-AT ?auto_4351 ?auto_4353 ) ( OBJ-AT ?auto_4350 ?auto_4355 ) ( TRUCK-AT ?auto_4354 ?auto_4347 ) ( not ( = ?auto_4350 ?auto_4351 ) ) ( not ( = ?auto_4353 ?auto_4355 ) ) ( not ( = ?auto_4350 ?auto_4349 ) ) ( not ( = ?auto_4351 ?auto_4349 ) ) ( not ( = ?auto_4350 ?auto_4348 ) ) ( not ( = ?auto_4351 ?auto_4348 ) ) ( not ( = ?auto_4349 ?auto_4348 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4350 ?auto_4351 ?auto_4348 ?auto_4349 ?auto_4347 )
      ( DELIVER-4PKG-VERIFY ?auto_4348 ?auto_4349 ?auto_4350 ?auto_4351 ?auto_4347 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_4377 - OBJ
      ?auto_4378 - OBJ
      ?auto_4379 - OBJ
      ?auto_4380 - OBJ
      ?auto_4376 - LOCATION
    )
    :vars
    (
      ?auto_4384 - LOCATION
      ?auto_4381 - CITY
      ?auto_4382 - LOCATION
      ?auto_4383 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4384 ?auto_4381 ) ( IN-CITY ?auto_4376 ?auto_4381 ) ( not ( = ?auto_4376 ?auto_4384 ) ) ( OBJ-AT ?auto_4377 ?auto_4384 ) ( OBJ-AT ?auto_4378 ?auto_4384 ) ( IN-CITY ?auto_4382 ?auto_4381 ) ( not ( = ?auto_4376 ?auto_4382 ) ) ( OBJ-AT ?auto_4379 ?auto_4382 ) ( OBJ-AT ?auto_4380 ?auto_4384 ) ( TRUCK-AT ?auto_4383 ?auto_4376 ) ( not ( = ?auto_4380 ?auto_4379 ) ) ( not ( = ?auto_4382 ?auto_4384 ) ) ( not ( = ?auto_4380 ?auto_4378 ) ) ( not ( = ?auto_4379 ?auto_4378 ) ) ( not ( = ?auto_4380 ?auto_4377 ) ) ( not ( = ?auto_4379 ?auto_4377 ) ) ( not ( = ?auto_4378 ?auto_4377 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_4380 ?auto_4379 ?auto_4377 ?auto_4378 ?auto_4376 )
      ( DELIVER-4PKG-VERIFY ?auto_4377 ?auto_4378 ?auto_4379 ?auto_4380 ?auto_4376 ) )
  )

)

