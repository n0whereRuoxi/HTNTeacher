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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1984 - OBJ
      ?auto_1985 - LOCATION
    )
    :vars
    (
      ?auto_1987 - LOCATION
      ?auto_1988 - CITY
      ?auto_1986 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1987 ?auto_1988 ) ( IN-CITY ?auto_1985 ?auto_1988 ) ( not ( = ?auto_1985 ?auto_1987 ) ) ( OBJ-AT ?auto_1984 ?auto_1987 ) ( TRUCK-AT ?auto_1986 ?auto_1985 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1986 ?auto_1985 ?auto_1987 ?auto_1988 )
      ( !LOAD-TRUCK ?auto_1984 ?auto_1986 ?auto_1987 )
      ( !DRIVE-TRUCK ?auto_1986 ?auto_1987 ?auto_1985 ?auto_1988 )
      ( !UNLOAD-TRUCK ?auto_1984 ?auto_1986 ?auto_1985 )
      ( DELIVER-1PKG-VERIFY ?auto_1984 ?auto_1985 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1999 - OBJ
      ?auto_2001 - OBJ
      ?auto_2000 - LOCATION
    )
    :vars
    (
      ?auto_2004 - LOCATION
      ?auto_2003 - CITY
      ?auto_2005 - LOCATION
      ?auto_2002 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2001 ?auto_1999 ) ( IN-CITY ?auto_2004 ?auto_2003 ) ( IN-CITY ?auto_2000 ?auto_2003 ) ( not ( = ?auto_2000 ?auto_2004 ) ) ( OBJ-AT ?auto_2001 ?auto_2004 ) ( IN-CITY ?auto_2005 ?auto_2003 ) ( not ( = ?auto_2000 ?auto_2005 ) ) ( OBJ-AT ?auto_1999 ?auto_2005 ) ( TRUCK-AT ?auto_2002 ?auto_2000 ) ( not ( = ?auto_1999 ?auto_2001 ) ) ( not ( = ?auto_2004 ?auto_2005 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1999 ?auto_2000 )
      ( DELIVER-1PKG ?auto_2001 ?auto_2000 )
      ( DELIVER-2PKG-VERIFY ?auto_1999 ?auto_2001 ?auto_2000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2017 - OBJ
      ?auto_2019 - OBJ
      ?auto_2020 - OBJ
      ?auto_2018 - LOCATION
    )
    :vars
    (
      ?auto_2021 - LOCATION
      ?auto_2022 - CITY
      ?auto_2024 - LOCATION
      ?auto_2023 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2019 ?auto_2017 ) ( GREATER-THAN ?auto_2020 ?auto_2017 ) ( GREATER-THAN ?auto_2020 ?auto_2019 ) ( IN-CITY ?auto_2021 ?auto_2022 ) ( IN-CITY ?auto_2018 ?auto_2022 ) ( not ( = ?auto_2018 ?auto_2021 ) ) ( OBJ-AT ?auto_2020 ?auto_2021 ) ( OBJ-AT ?auto_2019 ?auto_2021 ) ( IN-CITY ?auto_2024 ?auto_2022 ) ( not ( = ?auto_2018 ?auto_2024 ) ) ( OBJ-AT ?auto_2017 ?auto_2024 ) ( TRUCK-AT ?auto_2023 ?auto_2018 ) ( not ( = ?auto_2017 ?auto_2019 ) ) ( not ( = ?auto_2021 ?auto_2024 ) ) ( not ( = ?auto_2017 ?auto_2020 ) ) ( not ( = ?auto_2019 ?auto_2020 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2017 ?auto_2019 ?auto_2018 )
      ( DELIVER-1PKG ?auto_2020 ?auto_2018 )
      ( DELIVER-3PKG-VERIFY ?auto_2017 ?auto_2019 ?auto_2020 ?auto_2018 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2037 - OBJ
      ?auto_2039 - OBJ
      ?auto_2040 - OBJ
      ?auto_2041 - OBJ
      ?auto_2038 - LOCATION
    )
    :vars
    (
      ?auto_2044 - LOCATION
      ?auto_2043 - CITY
      ?auto_2045 - LOCATION
      ?auto_2042 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2039 ?auto_2037 ) ( GREATER-THAN ?auto_2040 ?auto_2037 ) ( GREATER-THAN ?auto_2040 ?auto_2039 ) ( GREATER-THAN ?auto_2041 ?auto_2037 ) ( GREATER-THAN ?auto_2041 ?auto_2039 ) ( GREATER-THAN ?auto_2041 ?auto_2040 ) ( IN-CITY ?auto_2044 ?auto_2043 ) ( IN-CITY ?auto_2038 ?auto_2043 ) ( not ( = ?auto_2038 ?auto_2044 ) ) ( OBJ-AT ?auto_2041 ?auto_2044 ) ( IN-CITY ?auto_2045 ?auto_2043 ) ( not ( = ?auto_2038 ?auto_2045 ) ) ( OBJ-AT ?auto_2040 ?auto_2045 ) ( OBJ-AT ?auto_2039 ?auto_2045 ) ( OBJ-AT ?auto_2037 ?auto_2044 ) ( TRUCK-AT ?auto_2042 ?auto_2038 ) ( not ( = ?auto_2037 ?auto_2039 ) ) ( not ( = ?auto_2045 ?auto_2044 ) ) ( not ( = ?auto_2037 ?auto_2040 ) ) ( not ( = ?auto_2039 ?auto_2040 ) ) ( not ( = ?auto_2037 ?auto_2041 ) ) ( not ( = ?auto_2039 ?auto_2041 ) ) ( not ( = ?auto_2040 ?auto_2041 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2037 ?auto_2039 ?auto_2040 ?auto_2038 )
      ( DELIVER-1PKG ?auto_2041 ?auto_2038 )
      ( DELIVER-4PKG-VERIFY ?auto_2037 ?auto_2039 ?auto_2040 ?auto_2041 ?auto_2038 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2059 - OBJ
      ?auto_2061 - OBJ
      ?auto_2062 - OBJ
      ?auto_2063 - OBJ
      ?auto_2064 - OBJ
      ?auto_2060 - LOCATION
    )
    :vars
    (
      ?auto_2065 - LOCATION
      ?auto_2067 - CITY
      ?auto_2068 - LOCATION
      ?auto_2069 - LOCATION
      ?auto_2066 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2061 ?auto_2059 ) ( GREATER-THAN ?auto_2062 ?auto_2059 ) ( GREATER-THAN ?auto_2062 ?auto_2061 ) ( GREATER-THAN ?auto_2063 ?auto_2059 ) ( GREATER-THAN ?auto_2063 ?auto_2061 ) ( GREATER-THAN ?auto_2063 ?auto_2062 ) ( GREATER-THAN ?auto_2064 ?auto_2059 ) ( GREATER-THAN ?auto_2064 ?auto_2061 ) ( GREATER-THAN ?auto_2064 ?auto_2062 ) ( GREATER-THAN ?auto_2064 ?auto_2063 ) ( IN-CITY ?auto_2065 ?auto_2067 ) ( IN-CITY ?auto_2060 ?auto_2067 ) ( not ( = ?auto_2060 ?auto_2065 ) ) ( OBJ-AT ?auto_2064 ?auto_2065 ) ( IN-CITY ?auto_2068 ?auto_2067 ) ( not ( = ?auto_2060 ?auto_2068 ) ) ( OBJ-AT ?auto_2063 ?auto_2068 ) ( IN-CITY ?auto_2069 ?auto_2067 ) ( not ( = ?auto_2060 ?auto_2069 ) ) ( OBJ-AT ?auto_2062 ?auto_2069 ) ( OBJ-AT ?auto_2061 ?auto_2069 ) ( OBJ-AT ?auto_2059 ?auto_2068 ) ( TRUCK-AT ?auto_2066 ?auto_2060 ) ( not ( = ?auto_2059 ?auto_2061 ) ) ( not ( = ?auto_2069 ?auto_2068 ) ) ( not ( = ?auto_2059 ?auto_2062 ) ) ( not ( = ?auto_2061 ?auto_2062 ) ) ( not ( = ?auto_2059 ?auto_2063 ) ) ( not ( = ?auto_2061 ?auto_2063 ) ) ( not ( = ?auto_2062 ?auto_2063 ) ) ( not ( = ?auto_2059 ?auto_2064 ) ) ( not ( = ?auto_2061 ?auto_2064 ) ) ( not ( = ?auto_2062 ?auto_2064 ) ) ( not ( = ?auto_2063 ?auto_2064 ) ) ( not ( = ?auto_2065 ?auto_2068 ) ) ( not ( = ?auto_2065 ?auto_2069 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2059 ?auto_2061 ?auto_2062 ?auto_2063 ?auto_2060 )
      ( DELIVER-1PKG ?auto_2064 ?auto_2060 )
      ( DELIVER-5PKG-VERIFY ?auto_2059 ?auto_2061 ?auto_2062 ?auto_2063 ?auto_2064 ?auto_2060 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2084 - OBJ
      ?auto_2086 - OBJ
      ?auto_2087 - OBJ
      ?auto_2088 - OBJ
      ?auto_2089 - OBJ
      ?auto_2090 - OBJ
      ?auto_2085 - LOCATION
    )
    :vars
    (
      ?auto_2093 - LOCATION
      ?auto_2091 - CITY
      ?auto_2096 - LOCATION
      ?auto_2095 - LOCATION
      ?auto_2094 - LOCATION
      ?auto_2092 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2086 ?auto_2084 ) ( GREATER-THAN ?auto_2087 ?auto_2084 ) ( GREATER-THAN ?auto_2087 ?auto_2086 ) ( GREATER-THAN ?auto_2088 ?auto_2084 ) ( GREATER-THAN ?auto_2088 ?auto_2086 ) ( GREATER-THAN ?auto_2088 ?auto_2087 ) ( GREATER-THAN ?auto_2089 ?auto_2084 ) ( GREATER-THAN ?auto_2089 ?auto_2086 ) ( GREATER-THAN ?auto_2089 ?auto_2087 ) ( GREATER-THAN ?auto_2089 ?auto_2088 ) ( GREATER-THAN ?auto_2090 ?auto_2084 ) ( GREATER-THAN ?auto_2090 ?auto_2086 ) ( GREATER-THAN ?auto_2090 ?auto_2087 ) ( GREATER-THAN ?auto_2090 ?auto_2088 ) ( GREATER-THAN ?auto_2090 ?auto_2089 ) ( IN-CITY ?auto_2093 ?auto_2091 ) ( IN-CITY ?auto_2085 ?auto_2091 ) ( not ( = ?auto_2085 ?auto_2093 ) ) ( OBJ-AT ?auto_2090 ?auto_2093 ) ( IN-CITY ?auto_2096 ?auto_2091 ) ( not ( = ?auto_2085 ?auto_2096 ) ) ( OBJ-AT ?auto_2089 ?auto_2096 ) ( IN-CITY ?auto_2095 ?auto_2091 ) ( not ( = ?auto_2085 ?auto_2095 ) ) ( OBJ-AT ?auto_2088 ?auto_2095 ) ( IN-CITY ?auto_2094 ?auto_2091 ) ( not ( = ?auto_2085 ?auto_2094 ) ) ( OBJ-AT ?auto_2087 ?auto_2094 ) ( OBJ-AT ?auto_2086 ?auto_2094 ) ( OBJ-AT ?auto_2084 ?auto_2095 ) ( TRUCK-AT ?auto_2092 ?auto_2085 ) ( not ( = ?auto_2084 ?auto_2086 ) ) ( not ( = ?auto_2094 ?auto_2095 ) ) ( not ( = ?auto_2084 ?auto_2087 ) ) ( not ( = ?auto_2086 ?auto_2087 ) ) ( not ( = ?auto_2084 ?auto_2088 ) ) ( not ( = ?auto_2086 ?auto_2088 ) ) ( not ( = ?auto_2087 ?auto_2088 ) ) ( not ( = ?auto_2084 ?auto_2089 ) ) ( not ( = ?auto_2086 ?auto_2089 ) ) ( not ( = ?auto_2087 ?auto_2089 ) ) ( not ( = ?auto_2088 ?auto_2089 ) ) ( not ( = ?auto_2096 ?auto_2095 ) ) ( not ( = ?auto_2096 ?auto_2094 ) ) ( not ( = ?auto_2084 ?auto_2090 ) ) ( not ( = ?auto_2086 ?auto_2090 ) ) ( not ( = ?auto_2087 ?auto_2090 ) ) ( not ( = ?auto_2088 ?auto_2090 ) ) ( not ( = ?auto_2089 ?auto_2090 ) ) ( not ( = ?auto_2093 ?auto_2096 ) ) ( not ( = ?auto_2093 ?auto_2095 ) ) ( not ( = ?auto_2093 ?auto_2094 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2084 ?auto_2086 ?auto_2087 ?auto_2088 ?auto_2089 ?auto_2085 )
      ( DELIVER-1PKG ?auto_2090 ?auto_2085 )
      ( DELIVER-6PKG-VERIFY ?auto_2084 ?auto_2086 ?auto_2087 ?auto_2088 ?auto_2089 ?auto_2090 ?auto_2085 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_2112 - OBJ
      ?auto_2114 - OBJ
      ?auto_2115 - OBJ
      ?auto_2116 - OBJ
      ?auto_2117 - OBJ
      ?auto_2118 - OBJ
      ?auto_2119 - OBJ
      ?auto_2113 - LOCATION
    )
    :vars
    (
      ?auto_2122 - LOCATION
      ?auto_2121 - CITY
      ?auto_2125 - LOCATION
      ?auto_2123 - LOCATION
      ?auto_2124 - LOCATION
      ?auto_2120 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2114 ?auto_2112 ) ( GREATER-THAN ?auto_2115 ?auto_2112 ) ( GREATER-THAN ?auto_2115 ?auto_2114 ) ( GREATER-THAN ?auto_2116 ?auto_2112 ) ( GREATER-THAN ?auto_2116 ?auto_2114 ) ( GREATER-THAN ?auto_2116 ?auto_2115 ) ( GREATER-THAN ?auto_2117 ?auto_2112 ) ( GREATER-THAN ?auto_2117 ?auto_2114 ) ( GREATER-THAN ?auto_2117 ?auto_2115 ) ( GREATER-THAN ?auto_2117 ?auto_2116 ) ( GREATER-THAN ?auto_2118 ?auto_2112 ) ( GREATER-THAN ?auto_2118 ?auto_2114 ) ( GREATER-THAN ?auto_2118 ?auto_2115 ) ( GREATER-THAN ?auto_2118 ?auto_2116 ) ( GREATER-THAN ?auto_2118 ?auto_2117 ) ( GREATER-THAN ?auto_2119 ?auto_2112 ) ( GREATER-THAN ?auto_2119 ?auto_2114 ) ( GREATER-THAN ?auto_2119 ?auto_2115 ) ( GREATER-THAN ?auto_2119 ?auto_2116 ) ( GREATER-THAN ?auto_2119 ?auto_2117 ) ( GREATER-THAN ?auto_2119 ?auto_2118 ) ( IN-CITY ?auto_2122 ?auto_2121 ) ( IN-CITY ?auto_2113 ?auto_2121 ) ( not ( = ?auto_2113 ?auto_2122 ) ) ( OBJ-AT ?auto_2119 ?auto_2122 ) ( IN-CITY ?auto_2125 ?auto_2121 ) ( not ( = ?auto_2113 ?auto_2125 ) ) ( OBJ-AT ?auto_2118 ?auto_2125 ) ( IN-CITY ?auto_2123 ?auto_2121 ) ( not ( = ?auto_2113 ?auto_2123 ) ) ( OBJ-AT ?auto_2117 ?auto_2123 ) ( OBJ-AT ?auto_2116 ?auto_2122 ) ( IN-CITY ?auto_2124 ?auto_2121 ) ( not ( = ?auto_2113 ?auto_2124 ) ) ( OBJ-AT ?auto_2115 ?auto_2124 ) ( OBJ-AT ?auto_2114 ?auto_2124 ) ( OBJ-AT ?auto_2112 ?auto_2122 ) ( TRUCK-AT ?auto_2120 ?auto_2113 ) ( not ( = ?auto_2112 ?auto_2114 ) ) ( not ( = ?auto_2124 ?auto_2122 ) ) ( not ( = ?auto_2112 ?auto_2115 ) ) ( not ( = ?auto_2114 ?auto_2115 ) ) ( not ( = ?auto_2112 ?auto_2116 ) ) ( not ( = ?auto_2114 ?auto_2116 ) ) ( not ( = ?auto_2115 ?auto_2116 ) ) ( not ( = ?auto_2112 ?auto_2117 ) ) ( not ( = ?auto_2114 ?auto_2117 ) ) ( not ( = ?auto_2115 ?auto_2117 ) ) ( not ( = ?auto_2116 ?auto_2117 ) ) ( not ( = ?auto_2123 ?auto_2122 ) ) ( not ( = ?auto_2123 ?auto_2124 ) ) ( not ( = ?auto_2112 ?auto_2118 ) ) ( not ( = ?auto_2114 ?auto_2118 ) ) ( not ( = ?auto_2115 ?auto_2118 ) ) ( not ( = ?auto_2116 ?auto_2118 ) ) ( not ( = ?auto_2117 ?auto_2118 ) ) ( not ( = ?auto_2125 ?auto_2123 ) ) ( not ( = ?auto_2125 ?auto_2122 ) ) ( not ( = ?auto_2125 ?auto_2124 ) ) ( not ( = ?auto_2112 ?auto_2119 ) ) ( not ( = ?auto_2114 ?auto_2119 ) ) ( not ( = ?auto_2115 ?auto_2119 ) ) ( not ( = ?auto_2116 ?auto_2119 ) ) ( not ( = ?auto_2117 ?auto_2119 ) ) ( not ( = ?auto_2118 ?auto_2119 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2112 ?auto_2114 ?auto_2115 ?auto_2116 ?auto_2117 ?auto_2118 ?auto_2113 )
      ( DELIVER-1PKG ?auto_2119 ?auto_2113 )
      ( DELIVER-7PKG-VERIFY ?auto_2112 ?auto_2114 ?auto_2115 ?auto_2116 ?auto_2117 ?auto_2118 ?auto_2119 ?auto_2113 ) )
  )

)

