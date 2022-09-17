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
      ?auto_2015 - SURFACE
      ?auto_2016 - SURFACE
    )
    :vars
    (
      ?auto_2017 - HOIST
      ?auto_2018 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2017 ?auto_2018 ) ( SURFACE-AT ?auto_2016 ?auto_2018 ) ( CLEAR ?auto_2016 ) ( LIFTING ?auto_2017 ?auto_2015 ) ( IS-CRATE ?auto_2015 ) ( not ( = ?auto_2015 ?auto_2016 ) ) )
    :subtasks
    ( ( !DROP ?auto_2017 ?auto_2015 ?auto_2016 ?auto_2018 )
      ( MAKE-ON-VERIFY ?auto_2015 ?auto_2016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2019 - SURFACE
      ?auto_2020 - SURFACE
    )
    :vars
    (
      ?auto_2021 - HOIST
      ?auto_2022 - PLACE
      ?auto_2023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2021 ?auto_2022 ) ( SURFACE-AT ?auto_2020 ?auto_2022 ) ( CLEAR ?auto_2020 ) ( IS-CRATE ?auto_2019 ) ( not ( = ?auto_2019 ?auto_2020 ) ) ( TRUCK-AT ?auto_2023 ?auto_2022 ) ( AVAILABLE ?auto_2021 ) ( IN ?auto_2019 ?auto_2023 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2021 ?auto_2019 ?auto_2023 ?auto_2022 )
      ( MAKE-ON ?auto_2019 ?auto_2020 )
      ( MAKE-ON-VERIFY ?auto_2019 ?auto_2020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2024 - SURFACE
      ?auto_2025 - SURFACE
    )
    :vars
    (
      ?auto_2027 - HOIST
      ?auto_2028 - PLACE
      ?auto_2026 - TRUCK
      ?auto_2029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2027 ?auto_2028 ) ( SURFACE-AT ?auto_2025 ?auto_2028 ) ( CLEAR ?auto_2025 ) ( IS-CRATE ?auto_2024 ) ( not ( = ?auto_2024 ?auto_2025 ) ) ( AVAILABLE ?auto_2027 ) ( IN ?auto_2024 ?auto_2026 ) ( TRUCK-AT ?auto_2026 ?auto_2029 ) ( not ( = ?auto_2029 ?auto_2028 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2026 ?auto_2029 ?auto_2028 )
      ( MAKE-ON ?auto_2024 ?auto_2025 )
      ( MAKE-ON-VERIFY ?auto_2024 ?auto_2025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2030 - SURFACE
      ?auto_2031 - SURFACE
    )
    :vars
    (
      ?auto_2033 - HOIST
      ?auto_2034 - PLACE
      ?auto_2035 - TRUCK
      ?auto_2032 - PLACE
      ?auto_2036 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2033 ?auto_2034 ) ( SURFACE-AT ?auto_2031 ?auto_2034 ) ( CLEAR ?auto_2031 ) ( IS-CRATE ?auto_2030 ) ( not ( = ?auto_2030 ?auto_2031 ) ) ( AVAILABLE ?auto_2033 ) ( TRUCK-AT ?auto_2035 ?auto_2032 ) ( not ( = ?auto_2032 ?auto_2034 ) ) ( HOIST-AT ?auto_2036 ?auto_2032 ) ( LIFTING ?auto_2036 ?auto_2030 ) ( not ( = ?auto_2033 ?auto_2036 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2036 ?auto_2030 ?auto_2035 ?auto_2032 )
      ( MAKE-ON ?auto_2030 ?auto_2031 )
      ( MAKE-ON-VERIFY ?auto_2030 ?auto_2031 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2037 - SURFACE
      ?auto_2038 - SURFACE
    )
    :vars
    (
      ?auto_2041 - HOIST
      ?auto_2039 - PLACE
      ?auto_2042 - TRUCK
      ?auto_2040 - PLACE
      ?auto_2043 - HOIST
      ?auto_2044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2041 ?auto_2039 ) ( SURFACE-AT ?auto_2038 ?auto_2039 ) ( CLEAR ?auto_2038 ) ( IS-CRATE ?auto_2037 ) ( not ( = ?auto_2037 ?auto_2038 ) ) ( AVAILABLE ?auto_2041 ) ( TRUCK-AT ?auto_2042 ?auto_2040 ) ( not ( = ?auto_2040 ?auto_2039 ) ) ( HOIST-AT ?auto_2043 ?auto_2040 ) ( not ( = ?auto_2041 ?auto_2043 ) ) ( AVAILABLE ?auto_2043 ) ( SURFACE-AT ?auto_2037 ?auto_2040 ) ( ON ?auto_2037 ?auto_2044 ) ( CLEAR ?auto_2037 ) ( not ( = ?auto_2037 ?auto_2044 ) ) ( not ( = ?auto_2038 ?auto_2044 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2043 ?auto_2037 ?auto_2044 ?auto_2040 )
      ( MAKE-ON ?auto_2037 ?auto_2038 )
      ( MAKE-ON-VERIFY ?auto_2037 ?auto_2038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2045 - SURFACE
      ?auto_2046 - SURFACE
    )
    :vars
    (
      ?auto_2052 - HOIST
      ?auto_2049 - PLACE
      ?auto_2050 - PLACE
      ?auto_2047 - HOIST
      ?auto_2051 - SURFACE
      ?auto_2048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2052 ?auto_2049 ) ( SURFACE-AT ?auto_2046 ?auto_2049 ) ( CLEAR ?auto_2046 ) ( IS-CRATE ?auto_2045 ) ( not ( = ?auto_2045 ?auto_2046 ) ) ( AVAILABLE ?auto_2052 ) ( not ( = ?auto_2050 ?auto_2049 ) ) ( HOIST-AT ?auto_2047 ?auto_2050 ) ( not ( = ?auto_2052 ?auto_2047 ) ) ( AVAILABLE ?auto_2047 ) ( SURFACE-AT ?auto_2045 ?auto_2050 ) ( ON ?auto_2045 ?auto_2051 ) ( CLEAR ?auto_2045 ) ( not ( = ?auto_2045 ?auto_2051 ) ) ( not ( = ?auto_2046 ?auto_2051 ) ) ( TRUCK-AT ?auto_2048 ?auto_2049 ) )
    :subtasks
    ( ( !DRIVE ?auto_2048 ?auto_2049 ?auto_2050 )
      ( MAKE-ON ?auto_2045 ?auto_2046 )
      ( MAKE-ON-VERIFY ?auto_2045 ?auto_2046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2093 - SURFACE
      ?auto_2094 - SURFACE
    )
    :vars
    (
      ?auto_2097 - HOIST
      ?auto_2096 - PLACE
      ?auto_2100 - PLACE
      ?auto_2095 - HOIST
      ?auto_2099 - SURFACE
      ?auto_2098 - TRUCK
      ?auto_2101 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2097 ?auto_2096 ) ( IS-CRATE ?auto_2093 ) ( not ( = ?auto_2093 ?auto_2094 ) ) ( not ( = ?auto_2100 ?auto_2096 ) ) ( HOIST-AT ?auto_2095 ?auto_2100 ) ( not ( = ?auto_2097 ?auto_2095 ) ) ( AVAILABLE ?auto_2095 ) ( SURFACE-AT ?auto_2093 ?auto_2100 ) ( ON ?auto_2093 ?auto_2099 ) ( CLEAR ?auto_2093 ) ( not ( = ?auto_2093 ?auto_2099 ) ) ( not ( = ?auto_2094 ?auto_2099 ) ) ( TRUCK-AT ?auto_2098 ?auto_2096 ) ( SURFACE-AT ?auto_2101 ?auto_2096 ) ( CLEAR ?auto_2101 ) ( LIFTING ?auto_2097 ?auto_2094 ) ( IS-CRATE ?auto_2094 ) ( not ( = ?auto_2093 ?auto_2101 ) ) ( not ( = ?auto_2094 ?auto_2101 ) ) ( not ( = ?auto_2099 ?auto_2101 ) ) )
    :subtasks
    ( ( !DROP ?auto_2097 ?auto_2094 ?auto_2101 ?auto_2096 )
      ( MAKE-ON ?auto_2093 ?auto_2094 )
      ( MAKE-ON-VERIFY ?auto_2093 ?auto_2094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2102 - SURFACE
      ?auto_2103 - SURFACE
    )
    :vars
    (
      ?auto_2108 - HOIST
      ?auto_2110 - PLACE
      ?auto_2109 - PLACE
      ?auto_2106 - HOIST
      ?auto_2107 - SURFACE
      ?auto_2104 - TRUCK
      ?auto_2105 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2108 ?auto_2110 ) ( IS-CRATE ?auto_2102 ) ( not ( = ?auto_2102 ?auto_2103 ) ) ( not ( = ?auto_2109 ?auto_2110 ) ) ( HOIST-AT ?auto_2106 ?auto_2109 ) ( not ( = ?auto_2108 ?auto_2106 ) ) ( AVAILABLE ?auto_2106 ) ( SURFACE-AT ?auto_2102 ?auto_2109 ) ( ON ?auto_2102 ?auto_2107 ) ( CLEAR ?auto_2102 ) ( not ( = ?auto_2102 ?auto_2107 ) ) ( not ( = ?auto_2103 ?auto_2107 ) ) ( TRUCK-AT ?auto_2104 ?auto_2110 ) ( SURFACE-AT ?auto_2105 ?auto_2110 ) ( CLEAR ?auto_2105 ) ( IS-CRATE ?auto_2103 ) ( not ( = ?auto_2102 ?auto_2105 ) ) ( not ( = ?auto_2103 ?auto_2105 ) ) ( not ( = ?auto_2107 ?auto_2105 ) ) ( AVAILABLE ?auto_2108 ) ( IN ?auto_2103 ?auto_2104 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2108 ?auto_2103 ?auto_2104 ?auto_2110 )
      ( MAKE-ON ?auto_2102 ?auto_2103 )
      ( MAKE-ON-VERIFY ?auto_2102 ?auto_2103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2117 - SURFACE
      ?auto_2118 - SURFACE
    )
    :vars
    (
      ?auto_2119 - HOIST
      ?auto_2121 - PLACE
      ?auto_2124 - PLACE
      ?auto_2122 - HOIST
      ?auto_2123 - SURFACE
      ?auto_2120 - TRUCK
      ?auto_2125 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2119 ?auto_2121 ) ( SURFACE-AT ?auto_2118 ?auto_2121 ) ( CLEAR ?auto_2118 ) ( IS-CRATE ?auto_2117 ) ( not ( = ?auto_2117 ?auto_2118 ) ) ( AVAILABLE ?auto_2119 ) ( not ( = ?auto_2124 ?auto_2121 ) ) ( HOIST-AT ?auto_2122 ?auto_2124 ) ( not ( = ?auto_2119 ?auto_2122 ) ) ( AVAILABLE ?auto_2122 ) ( SURFACE-AT ?auto_2117 ?auto_2124 ) ( ON ?auto_2117 ?auto_2123 ) ( CLEAR ?auto_2117 ) ( not ( = ?auto_2117 ?auto_2123 ) ) ( not ( = ?auto_2118 ?auto_2123 ) ) ( TRUCK-AT ?auto_2120 ?auto_2125 ) ( not ( = ?auto_2125 ?auto_2121 ) ) ( not ( = ?auto_2124 ?auto_2125 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2120 ?auto_2125 ?auto_2121 )
      ( MAKE-ON ?auto_2117 ?auto_2118 )
      ( MAKE-ON-VERIFY ?auto_2117 ?auto_2118 ) )
  )

)

