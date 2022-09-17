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
      ?auto_2022 - SURFACE
      ?auto_2023 - SURFACE
    )
    :vars
    (
      ?auto_2024 - HOIST
      ?auto_2025 - PLACE
      ?auto_2027 - PLACE
      ?auto_2028 - HOIST
      ?auto_2029 - SURFACE
      ?auto_2026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024 ?auto_2025 ) ( SURFACE-AT ?auto_2023 ?auto_2025 ) ( CLEAR ?auto_2023 ) ( IS-CRATE ?auto_2022 ) ( AVAILABLE ?auto_2024 ) ( not ( = ?auto_2027 ?auto_2025 ) ) ( HOIST-AT ?auto_2028 ?auto_2027 ) ( AVAILABLE ?auto_2028 ) ( SURFACE-AT ?auto_2022 ?auto_2027 ) ( ON ?auto_2022 ?auto_2029 ) ( CLEAR ?auto_2022 ) ( TRUCK-AT ?auto_2026 ?auto_2025 ) ( not ( = ?auto_2022 ?auto_2023 ) ) ( not ( = ?auto_2022 ?auto_2029 ) ) ( not ( = ?auto_2023 ?auto_2029 ) ) ( not ( = ?auto_2024 ?auto_2028 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2026 ?auto_2025 ?auto_2027 )
      ( !LIFT ?auto_2028 ?auto_2022 ?auto_2029 ?auto_2027 )
      ( !LOAD ?auto_2028 ?auto_2022 ?auto_2026 ?auto_2027 )
      ( !DRIVE ?auto_2026 ?auto_2027 ?auto_2025 )
      ( !UNLOAD ?auto_2024 ?auto_2022 ?auto_2026 ?auto_2025 )
      ( !DROP ?auto_2024 ?auto_2022 ?auto_2023 ?auto_2025 )
      ( MAKE-ON-VERIFY ?auto_2022 ?auto_2023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2032 - SURFACE
      ?auto_2033 - SURFACE
    )
    :vars
    (
      ?auto_2034 - HOIST
      ?auto_2035 - PLACE
      ?auto_2037 - PLACE
      ?auto_2038 - HOIST
      ?auto_2039 - SURFACE
      ?auto_2036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2034 ?auto_2035 ) ( SURFACE-AT ?auto_2033 ?auto_2035 ) ( CLEAR ?auto_2033 ) ( IS-CRATE ?auto_2032 ) ( AVAILABLE ?auto_2034 ) ( not ( = ?auto_2037 ?auto_2035 ) ) ( HOIST-AT ?auto_2038 ?auto_2037 ) ( AVAILABLE ?auto_2038 ) ( SURFACE-AT ?auto_2032 ?auto_2037 ) ( ON ?auto_2032 ?auto_2039 ) ( CLEAR ?auto_2032 ) ( TRUCK-AT ?auto_2036 ?auto_2035 ) ( not ( = ?auto_2032 ?auto_2033 ) ) ( not ( = ?auto_2032 ?auto_2039 ) ) ( not ( = ?auto_2033 ?auto_2039 ) ) ( not ( = ?auto_2034 ?auto_2038 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2036 ?auto_2035 ?auto_2037 )
      ( !LIFT ?auto_2038 ?auto_2032 ?auto_2039 ?auto_2037 )
      ( !LOAD ?auto_2038 ?auto_2032 ?auto_2036 ?auto_2037 )
      ( !DRIVE ?auto_2036 ?auto_2037 ?auto_2035 )
      ( !UNLOAD ?auto_2034 ?auto_2032 ?auto_2036 ?auto_2035 )
      ( !DROP ?auto_2034 ?auto_2032 ?auto_2033 ?auto_2035 )
      ( MAKE-ON-VERIFY ?auto_2032 ?auto_2033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2042 - SURFACE
      ?auto_2043 - SURFACE
    )
    :vars
    (
      ?auto_2044 - HOIST
      ?auto_2045 - PLACE
      ?auto_2047 - PLACE
      ?auto_2048 - HOIST
      ?auto_2049 - SURFACE
      ?auto_2046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2044 ?auto_2045 ) ( SURFACE-AT ?auto_2043 ?auto_2045 ) ( CLEAR ?auto_2043 ) ( IS-CRATE ?auto_2042 ) ( AVAILABLE ?auto_2044 ) ( not ( = ?auto_2047 ?auto_2045 ) ) ( HOIST-AT ?auto_2048 ?auto_2047 ) ( AVAILABLE ?auto_2048 ) ( SURFACE-AT ?auto_2042 ?auto_2047 ) ( ON ?auto_2042 ?auto_2049 ) ( CLEAR ?auto_2042 ) ( TRUCK-AT ?auto_2046 ?auto_2045 ) ( not ( = ?auto_2042 ?auto_2043 ) ) ( not ( = ?auto_2042 ?auto_2049 ) ) ( not ( = ?auto_2043 ?auto_2049 ) ) ( not ( = ?auto_2044 ?auto_2048 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2046 ?auto_2045 ?auto_2047 )
      ( !LIFT ?auto_2048 ?auto_2042 ?auto_2049 ?auto_2047 )
      ( !LOAD ?auto_2048 ?auto_2042 ?auto_2046 ?auto_2047 )
      ( !DRIVE ?auto_2046 ?auto_2047 ?auto_2045 )
      ( !UNLOAD ?auto_2044 ?auto_2042 ?auto_2046 ?auto_2045 )
      ( !DROP ?auto_2044 ?auto_2042 ?auto_2043 ?auto_2045 )
      ( MAKE-ON-VERIFY ?auto_2042 ?auto_2043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2052 - SURFACE
      ?auto_2053 - SURFACE
    )
    :vars
    (
      ?auto_2054 - HOIST
      ?auto_2055 - PLACE
      ?auto_2057 - PLACE
      ?auto_2058 - HOIST
      ?auto_2059 - SURFACE
      ?auto_2056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2054 ?auto_2055 ) ( SURFACE-AT ?auto_2053 ?auto_2055 ) ( CLEAR ?auto_2053 ) ( IS-CRATE ?auto_2052 ) ( AVAILABLE ?auto_2054 ) ( not ( = ?auto_2057 ?auto_2055 ) ) ( HOIST-AT ?auto_2058 ?auto_2057 ) ( AVAILABLE ?auto_2058 ) ( SURFACE-AT ?auto_2052 ?auto_2057 ) ( ON ?auto_2052 ?auto_2059 ) ( CLEAR ?auto_2052 ) ( TRUCK-AT ?auto_2056 ?auto_2055 ) ( not ( = ?auto_2052 ?auto_2053 ) ) ( not ( = ?auto_2052 ?auto_2059 ) ) ( not ( = ?auto_2053 ?auto_2059 ) ) ( not ( = ?auto_2054 ?auto_2058 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2056 ?auto_2055 ?auto_2057 )
      ( !LIFT ?auto_2058 ?auto_2052 ?auto_2059 ?auto_2057 )
      ( !LOAD ?auto_2058 ?auto_2052 ?auto_2056 ?auto_2057 )
      ( !DRIVE ?auto_2056 ?auto_2057 ?auto_2055 )
      ( !UNLOAD ?auto_2054 ?auto_2052 ?auto_2056 ?auto_2055 )
      ( !DROP ?auto_2054 ?auto_2052 ?auto_2053 ?auto_2055 )
      ( MAKE-ON-VERIFY ?auto_2052 ?auto_2053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2062 - SURFACE
      ?auto_2063 - SURFACE
    )
    :vars
    (
      ?auto_2064 - HOIST
      ?auto_2065 - PLACE
      ?auto_2067 - PLACE
      ?auto_2068 - HOIST
      ?auto_2069 - SURFACE
      ?auto_2066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2064 ?auto_2065 ) ( SURFACE-AT ?auto_2063 ?auto_2065 ) ( CLEAR ?auto_2063 ) ( IS-CRATE ?auto_2062 ) ( AVAILABLE ?auto_2064 ) ( not ( = ?auto_2067 ?auto_2065 ) ) ( HOIST-AT ?auto_2068 ?auto_2067 ) ( AVAILABLE ?auto_2068 ) ( SURFACE-AT ?auto_2062 ?auto_2067 ) ( ON ?auto_2062 ?auto_2069 ) ( CLEAR ?auto_2062 ) ( TRUCK-AT ?auto_2066 ?auto_2065 ) ( not ( = ?auto_2062 ?auto_2063 ) ) ( not ( = ?auto_2062 ?auto_2069 ) ) ( not ( = ?auto_2063 ?auto_2069 ) ) ( not ( = ?auto_2064 ?auto_2068 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2066 ?auto_2065 ?auto_2067 )
      ( !LIFT ?auto_2068 ?auto_2062 ?auto_2069 ?auto_2067 )
      ( !LOAD ?auto_2068 ?auto_2062 ?auto_2066 ?auto_2067 )
      ( !DRIVE ?auto_2066 ?auto_2067 ?auto_2065 )
      ( !UNLOAD ?auto_2064 ?auto_2062 ?auto_2066 ?auto_2065 )
      ( !DROP ?auto_2064 ?auto_2062 ?auto_2063 ?auto_2065 )
      ( MAKE-ON-VERIFY ?auto_2062 ?auto_2063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2072 - SURFACE
      ?auto_2073 - SURFACE
    )
    :vars
    (
      ?auto_2074 - HOIST
      ?auto_2075 - PLACE
      ?auto_2077 - PLACE
      ?auto_2078 - HOIST
      ?auto_2079 - SURFACE
      ?auto_2076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2074 ?auto_2075 ) ( SURFACE-AT ?auto_2073 ?auto_2075 ) ( CLEAR ?auto_2073 ) ( IS-CRATE ?auto_2072 ) ( AVAILABLE ?auto_2074 ) ( not ( = ?auto_2077 ?auto_2075 ) ) ( HOIST-AT ?auto_2078 ?auto_2077 ) ( AVAILABLE ?auto_2078 ) ( SURFACE-AT ?auto_2072 ?auto_2077 ) ( ON ?auto_2072 ?auto_2079 ) ( CLEAR ?auto_2072 ) ( TRUCK-AT ?auto_2076 ?auto_2075 ) ( not ( = ?auto_2072 ?auto_2073 ) ) ( not ( = ?auto_2072 ?auto_2079 ) ) ( not ( = ?auto_2073 ?auto_2079 ) ) ( not ( = ?auto_2074 ?auto_2078 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2076 ?auto_2075 ?auto_2077 )
      ( !LIFT ?auto_2078 ?auto_2072 ?auto_2079 ?auto_2077 )
      ( !LOAD ?auto_2078 ?auto_2072 ?auto_2076 ?auto_2077 )
      ( !DRIVE ?auto_2076 ?auto_2077 ?auto_2075 )
      ( !UNLOAD ?auto_2074 ?auto_2072 ?auto_2076 ?auto_2075 )
      ( !DROP ?auto_2074 ?auto_2072 ?auto_2073 ?auto_2075 )
      ( MAKE-ON-VERIFY ?auto_2072 ?auto_2073 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2082 - SURFACE
      ?auto_2083 - SURFACE
    )
    :vars
    (
      ?auto_2084 - HOIST
      ?auto_2085 - PLACE
      ?auto_2087 - PLACE
      ?auto_2088 - HOIST
      ?auto_2089 - SURFACE
      ?auto_2086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2084 ?auto_2085 ) ( SURFACE-AT ?auto_2083 ?auto_2085 ) ( CLEAR ?auto_2083 ) ( IS-CRATE ?auto_2082 ) ( AVAILABLE ?auto_2084 ) ( not ( = ?auto_2087 ?auto_2085 ) ) ( HOIST-AT ?auto_2088 ?auto_2087 ) ( AVAILABLE ?auto_2088 ) ( SURFACE-AT ?auto_2082 ?auto_2087 ) ( ON ?auto_2082 ?auto_2089 ) ( CLEAR ?auto_2082 ) ( TRUCK-AT ?auto_2086 ?auto_2085 ) ( not ( = ?auto_2082 ?auto_2083 ) ) ( not ( = ?auto_2082 ?auto_2089 ) ) ( not ( = ?auto_2083 ?auto_2089 ) ) ( not ( = ?auto_2084 ?auto_2088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2086 ?auto_2085 ?auto_2087 )
      ( !LIFT ?auto_2088 ?auto_2082 ?auto_2089 ?auto_2087 )
      ( !LOAD ?auto_2088 ?auto_2082 ?auto_2086 ?auto_2087 )
      ( !DRIVE ?auto_2086 ?auto_2087 ?auto_2085 )
      ( !UNLOAD ?auto_2084 ?auto_2082 ?auto_2086 ?auto_2085 )
      ( !DROP ?auto_2084 ?auto_2082 ?auto_2083 ?auto_2085 )
      ( MAKE-ON-VERIFY ?auto_2082 ?auto_2083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2092 - SURFACE
      ?auto_2093 - SURFACE
    )
    :vars
    (
      ?auto_2094 - HOIST
      ?auto_2095 - PLACE
      ?auto_2097 - PLACE
      ?auto_2098 - HOIST
      ?auto_2099 - SURFACE
      ?auto_2096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2094 ?auto_2095 ) ( SURFACE-AT ?auto_2093 ?auto_2095 ) ( CLEAR ?auto_2093 ) ( IS-CRATE ?auto_2092 ) ( AVAILABLE ?auto_2094 ) ( not ( = ?auto_2097 ?auto_2095 ) ) ( HOIST-AT ?auto_2098 ?auto_2097 ) ( AVAILABLE ?auto_2098 ) ( SURFACE-AT ?auto_2092 ?auto_2097 ) ( ON ?auto_2092 ?auto_2099 ) ( CLEAR ?auto_2092 ) ( TRUCK-AT ?auto_2096 ?auto_2095 ) ( not ( = ?auto_2092 ?auto_2093 ) ) ( not ( = ?auto_2092 ?auto_2099 ) ) ( not ( = ?auto_2093 ?auto_2099 ) ) ( not ( = ?auto_2094 ?auto_2098 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2096 ?auto_2095 ?auto_2097 )
      ( !LIFT ?auto_2098 ?auto_2092 ?auto_2099 ?auto_2097 )
      ( !LOAD ?auto_2098 ?auto_2092 ?auto_2096 ?auto_2097 )
      ( !DRIVE ?auto_2096 ?auto_2097 ?auto_2095 )
      ( !UNLOAD ?auto_2094 ?auto_2092 ?auto_2096 ?auto_2095 )
      ( !DROP ?auto_2094 ?auto_2092 ?auto_2093 ?auto_2095 )
      ( MAKE-ON-VERIFY ?auto_2092 ?auto_2093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2102 - SURFACE
      ?auto_2103 - SURFACE
    )
    :vars
    (
      ?auto_2104 - HOIST
      ?auto_2105 - PLACE
      ?auto_2107 - PLACE
      ?auto_2108 - HOIST
      ?auto_2109 - SURFACE
      ?auto_2106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2104 ?auto_2105 ) ( SURFACE-AT ?auto_2103 ?auto_2105 ) ( CLEAR ?auto_2103 ) ( IS-CRATE ?auto_2102 ) ( AVAILABLE ?auto_2104 ) ( not ( = ?auto_2107 ?auto_2105 ) ) ( HOIST-AT ?auto_2108 ?auto_2107 ) ( AVAILABLE ?auto_2108 ) ( SURFACE-AT ?auto_2102 ?auto_2107 ) ( ON ?auto_2102 ?auto_2109 ) ( CLEAR ?auto_2102 ) ( TRUCK-AT ?auto_2106 ?auto_2105 ) ( not ( = ?auto_2102 ?auto_2103 ) ) ( not ( = ?auto_2102 ?auto_2109 ) ) ( not ( = ?auto_2103 ?auto_2109 ) ) ( not ( = ?auto_2104 ?auto_2108 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2106 ?auto_2105 ?auto_2107 )
      ( !LIFT ?auto_2108 ?auto_2102 ?auto_2109 ?auto_2107 )
      ( !LOAD ?auto_2108 ?auto_2102 ?auto_2106 ?auto_2107 )
      ( !DRIVE ?auto_2106 ?auto_2107 ?auto_2105 )
      ( !UNLOAD ?auto_2104 ?auto_2102 ?auto_2106 ?auto_2105 )
      ( !DROP ?auto_2104 ?auto_2102 ?auto_2103 ?auto_2105 )
      ( MAKE-ON-VERIFY ?auto_2102 ?auto_2103 ) )
  )

)

