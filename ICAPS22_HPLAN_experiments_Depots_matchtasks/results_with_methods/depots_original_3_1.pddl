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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2060 - SURFACE
      ?auto_2061 - SURFACE
    )
    :vars
    (
      ?auto_2062 - HOIST
      ?auto_2063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2062 ?auto_2063 ) ( SURFACE-AT ?auto_2060 ?auto_2063 ) ( CLEAR ?auto_2060 ) ( LIFTING ?auto_2062 ?auto_2061 ) ( IS-CRATE ?auto_2061 ) ( not ( = ?auto_2060 ?auto_2061 ) ) )
    :subtasks
    ( ( !DROP ?auto_2062 ?auto_2061 ?auto_2060 ?auto_2063 )
      ( MAKE-1CRATE-VERIFY ?auto_2060 ?auto_2061 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2064 - SURFACE
      ?auto_2065 - SURFACE
    )
    :vars
    (
      ?auto_2067 - HOIST
      ?auto_2066 - PLACE
      ?auto_2068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2067 ?auto_2066 ) ( SURFACE-AT ?auto_2064 ?auto_2066 ) ( CLEAR ?auto_2064 ) ( IS-CRATE ?auto_2065 ) ( not ( = ?auto_2064 ?auto_2065 ) ) ( TRUCK-AT ?auto_2068 ?auto_2066 ) ( AVAILABLE ?auto_2067 ) ( IN ?auto_2065 ?auto_2068 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2067 ?auto_2065 ?auto_2068 ?auto_2066 )
      ( MAKE-1CRATE ?auto_2064 ?auto_2065 )
      ( MAKE-1CRATE-VERIFY ?auto_2064 ?auto_2065 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2069 - SURFACE
      ?auto_2070 - SURFACE
    )
    :vars
    (
      ?auto_2073 - HOIST
      ?auto_2071 - PLACE
      ?auto_2072 - TRUCK
      ?auto_2074 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2073 ?auto_2071 ) ( SURFACE-AT ?auto_2069 ?auto_2071 ) ( CLEAR ?auto_2069 ) ( IS-CRATE ?auto_2070 ) ( not ( = ?auto_2069 ?auto_2070 ) ) ( AVAILABLE ?auto_2073 ) ( IN ?auto_2070 ?auto_2072 ) ( TRUCK-AT ?auto_2072 ?auto_2074 ) ( not ( = ?auto_2074 ?auto_2071 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2072 ?auto_2074 ?auto_2071 )
      ( MAKE-1CRATE ?auto_2069 ?auto_2070 )
      ( MAKE-1CRATE-VERIFY ?auto_2069 ?auto_2070 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2075 - SURFACE
      ?auto_2076 - SURFACE
    )
    :vars
    (
      ?auto_2080 - HOIST
      ?auto_2078 - PLACE
      ?auto_2079 - TRUCK
      ?auto_2077 - PLACE
      ?auto_2081 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2080 ?auto_2078 ) ( SURFACE-AT ?auto_2075 ?auto_2078 ) ( CLEAR ?auto_2075 ) ( IS-CRATE ?auto_2076 ) ( not ( = ?auto_2075 ?auto_2076 ) ) ( AVAILABLE ?auto_2080 ) ( TRUCK-AT ?auto_2079 ?auto_2077 ) ( not ( = ?auto_2077 ?auto_2078 ) ) ( HOIST-AT ?auto_2081 ?auto_2077 ) ( LIFTING ?auto_2081 ?auto_2076 ) ( not ( = ?auto_2080 ?auto_2081 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2081 ?auto_2076 ?auto_2079 ?auto_2077 )
      ( MAKE-1CRATE ?auto_2075 ?auto_2076 )
      ( MAKE-1CRATE-VERIFY ?auto_2075 ?auto_2076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2082 - SURFACE
      ?auto_2083 - SURFACE
    )
    :vars
    (
      ?auto_2087 - HOIST
      ?auto_2086 - PLACE
      ?auto_2085 - TRUCK
      ?auto_2088 - PLACE
      ?auto_2084 - HOIST
      ?auto_2089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2087 ?auto_2086 ) ( SURFACE-AT ?auto_2082 ?auto_2086 ) ( CLEAR ?auto_2082 ) ( IS-CRATE ?auto_2083 ) ( not ( = ?auto_2082 ?auto_2083 ) ) ( AVAILABLE ?auto_2087 ) ( TRUCK-AT ?auto_2085 ?auto_2088 ) ( not ( = ?auto_2088 ?auto_2086 ) ) ( HOIST-AT ?auto_2084 ?auto_2088 ) ( not ( = ?auto_2087 ?auto_2084 ) ) ( AVAILABLE ?auto_2084 ) ( SURFACE-AT ?auto_2083 ?auto_2088 ) ( ON ?auto_2083 ?auto_2089 ) ( CLEAR ?auto_2083 ) ( not ( = ?auto_2082 ?auto_2089 ) ) ( not ( = ?auto_2083 ?auto_2089 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2084 ?auto_2083 ?auto_2089 ?auto_2088 )
      ( MAKE-1CRATE ?auto_2082 ?auto_2083 )
      ( MAKE-1CRATE-VERIFY ?auto_2082 ?auto_2083 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2090 - SURFACE
      ?auto_2091 - SURFACE
    )
    :vars
    (
      ?auto_2097 - HOIST
      ?auto_2095 - PLACE
      ?auto_2096 - PLACE
      ?auto_2092 - HOIST
      ?auto_2094 - SURFACE
      ?auto_2093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2097 ?auto_2095 ) ( SURFACE-AT ?auto_2090 ?auto_2095 ) ( CLEAR ?auto_2090 ) ( IS-CRATE ?auto_2091 ) ( not ( = ?auto_2090 ?auto_2091 ) ) ( AVAILABLE ?auto_2097 ) ( not ( = ?auto_2096 ?auto_2095 ) ) ( HOIST-AT ?auto_2092 ?auto_2096 ) ( not ( = ?auto_2097 ?auto_2092 ) ) ( AVAILABLE ?auto_2092 ) ( SURFACE-AT ?auto_2091 ?auto_2096 ) ( ON ?auto_2091 ?auto_2094 ) ( CLEAR ?auto_2091 ) ( not ( = ?auto_2090 ?auto_2094 ) ) ( not ( = ?auto_2091 ?auto_2094 ) ) ( TRUCK-AT ?auto_2093 ?auto_2095 ) )
    :subtasks
    ( ( !DRIVE ?auto_2093 ?auto_2095 ?auto_2096 )
      ( MAKE-1CRATE ?auto_2090 ?auto_2091 )
      ( MAKE-1CRATE-VERIFY ?auto_2090 ?auto_2091 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2103 - SURFACE
      ?auto_2104 - SURFACE
    )
    :vars
    (
      ?auto_2105 - HOIST
      ?auto_2106 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2105 ?auto_2106 ) ( SURFACE-AT ?auto_2103 ?auto_2106 ) ( CLEAR ?auto_2103 ) ( LIFTING ?auto_2105 ?auto_2104 ) ( IS-CRATE ?auto_2104 ) ( not ( = ?auto_2103 ?auto_2104 ) ) )
    :subtasks
    ( ( !DROP ?auto_2105 ?auto_2104 ?auto_2103 ?auto_2106 )
      ( MAKE-1CRATE-VERIFY ?auto_2103 ?auto_2104 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2107 - SURFACE
      ?auto_2108 - SURFACE
      ?auto_2109 - SURFACE
    )
    :vars
    (
      ?auto_2111 - HOIST
      ?auto_2110 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2111 ?auto_2110 ) ( SURFACE-AT ?auto_2108 ?auto_2110 ) ( CLEAR ?auto_2108 ) ( LIFTING ?auto_2111 ?auto_2109 ) ( IS-CRATE ?auto_2109 ) ( not ( = ?auto_2108 ?auto_2109 ) ) ( ON ?auto_2108 ?auto_2107 ) ( not ( = ?auto_2107 ?auto_2108 ) ) ( not ( = ?auto_2107 ?auto_2109 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2108 ?auto_2109 )
      ( MAKE-2CRATE-VERIFY ?auto_2107 ?auto_2108 ?auto_2109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2112 - SURFACE
      ?auto_2113 - SURFACE
    )
    :vars
    (
      ?auto_2115 - HOIST
      ?auto_2114 - PLACE
      ?auto_2116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2115 ?auto_2114 ) ( SURFACE-AT ?auto_2112 ?auto_2114 ) ( CLEAR ?auto_2112 ) ( IS-CRATE ?auto_2113 ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( TRUCK-AT ?auto_2116 ?auto_2114 ) ( AVAILABLE ?auto_2115 ) ( IN ?auto_2113 ?auto_2116 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2115 ?auto_2113 ?auto_2116 ?auto_2114 )
      ( MAKE-1CRATE ?auto_2112 ?auto_2113 )
      ( MAKE-1CRATE-VERIFY ?auto_2112 ?auto_2113 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2117 - SURFACE
      ?auto_2118 - SURFACE
      ?auto_2119 - SURFACE
    )
    :vars
    (
      ?auto_2120 - HOIST
      ?auto_2121 - PLACE
      ?auto_2122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2120 ?auto_2121 ) ( SURFACE-AT ?auto_2118 ?auto_2121 ) ( CLEAR ?auto_2118 ) ( IS-CRATE ?auto_2119 ) ( not ( = ?auto_2118 ?auto_2119 ) ) ( TRUCK-AT ?auto_2122 ?auto_2121 ) ( AVAILABLE ?auto_2120 ) ( IN ?auto_2119 ?auto_2122 ) ( ON ?auto_2118 ?auto_2117 ) ( not ( = ?auto_2117 ?auto_2118 ) ) ( not ( = ?auto_2117 ?auto_2119 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2118 ?auto_2119 )
      ( MAKE-2CRATE-VERIFY ?auto_2117 ?auto_2118 ?auto_2119 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2123 - SURFACE
      ?auto_2124 - SURFACE
    )
    :vars
    (
      ?auto_2126 - HOIST
      ?auto_2127 - PLACE
      ?auto_2128 - TRUCK
      ?auto_2125 - SURFACE
      ?auto_2129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2126 ?auto_2127 ) ( SURFACE-AT ?auto_2123 ?auto_2127 ) ( CLEAR ?auto_2123 ) ( IS-CRATE ?auto_2124 ) ( not ( = ?auto_2123 ?auto_2124 ) ) ( AVAILABLE ?auto_2126 ) ( IN ?auto_2124 ?auto_2128 ) ( ON ?auto_2123 ?auto_2125 ) ( not ( = ?auto_2125 ?auto_2123 ) ) ( not ( = ?auto_2125 ?auto_2124 ) ) ( TRUCK-AT ?auto_2128 ?auto_2129 ) ( not ( = ?auto_2129 ?auto_2127 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2128 ?auto_2129 ?auto_2127 )
      ( MAKE-2CRATE ?auto_2125 ?auto_2123 ?auto_2124 )
      ( MAKE-1CRATE-VERIFY ?auto_2123 ?auto_2124 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2130 - SURFACE
      ?auto_2131 - SURFACE
      ?auto_2132 - SURFACE
    )
    :vars
    (
      ?auto_2136 - HOIST
      ?auto_2134 - PLACE
      ?auto_2135 - TRUCK
      ?auto_2133 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2136 ?auto_2134 ) ( SURFACE-AT ?auto_2131 ?auto_2134 ) ( CLEAR ?auto_2131 ) ( IS-CRATE ?auto_2132 ) ( not ( = ?auto_2131 ?auto_2132 ) ) ( AVAILABLE ?auto_2136 ) ( IN ?auto_2132 ?auto_2135 ) ( ON ?auto_2131 ?auto_2130 ) ( not ( = ?auto_2130 ?auto_2131 ) ) ( not ( = ?auto_2130 ?auto_2132 ) ) ( TRUCK-AT ?auto_2135 ?auto_2133 ) ( not ( = ?auto_2133 ?auto_2134 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2131 ?auto_2132 )
      ( MAKE-2CRATE-VERIFY ?auto_2130 ?auto_2131 ?auto_2132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2137 - SURFACE
      ?auto_2138 - SURFACE
    )
    :vars
    (
      ?auto_2140 - HOIST
      ?auto_2141 - PLACE
      ?auto_2143 - SURFACE
      ?auto_2139 - TRUCK
      ?auto_2142 - PLACE
      ?auto_2144 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2140 ?auto_2141 ) ( SURFACE-AT ?auto_2137 ?auto_2141 ) ( CLEAR ?auto_2137 ) ( IS-CRATE ?auto_2138 ) ( not ( = ?auto_2137 ?auto_2138 ) ) ( AVAILABLE ?auto_2140 ) ( ON ?auto_2137 ?auto_2143 ) ( not ( = ?auto_2143 ?auto_2137 ) ) ( not ( = ?auto_2143 ?auto_2138 ) ) ( TRUCK-AT ?auto_2139 ?auto_2142 ) ( not ( = ?auto_2142 ?auto_2141 ) ) ( HOIST-AT ?auto_2144 ?auto_2142 ) ( LIFTING ?auto_2144 ?auto_2138 ) ( not ( = ?auto_2140 ?auto_2144 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2144 ?auto_2138 ?auto_2139 ?auto_2142 )
      ( MAKE-2CRATE ?auto_2143 ?auto_2137 ?auto_2138 )
      ( MAKE-1CRATE-VERIFY ?auto_2137 ?auto_2138 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2145 - SURFACE
      ?auto_2146 - SURFACE
      ?auto_2147 - SURFACE
    )
    :vars
    (
      ?auto_2149 - HOIST
      ?auto_2148 - PLACE
      ?auto_2151 - TRUCK
      ?auto_2152 - PLACE
      ?auto_2150 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2149 ?auto_2148 ) ( SURFACE-AT ?auto_2146 ?auto_2148 ) ( CLEAR ?auto_2146 ) ( IS-CRATE ?auto_2147 ) ( not ( = ?auto_2146 ?auto_2147 ) ) ( AVAILABLE ?auto_2149 ) ( ON ?auto_2146 ?auto_2145 ) ( not ( = ?auto_2145 ?auto_2146 ) ) ( not ( = ?auto_2145 ?auto_2147 ) ) ( TRUCK-AT ?auto_2151 ?auto_2152 ) ( not ( = ?auto_2152 ?auto_2148 ) ) ( HOIST-AT ?auto_2150 ?auto_2152 ) ( LIFTING ?auto_2150 ?auto_2147 ) ( not ( = ?auto_2149 ?auto_2150 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2146 ?auto_2147 )
      ( MAKE-2CRATE-VERIFY ?auto_2145 ?auto_2146 ?auto_2147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2153 - SURFACE
      ?auto_2154 - SURFACE
    )
    :vars
    (
      ?auto_2157 - HOIST
      ?auto_2160 - PLACE
      ?auto_2158 - SURFACE
      ?auto_2156 - TRUCK
      ?auto_2155 - PLACE
      ?auto_2159 - HOIST
      ?auto_2161 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2157 ?auto_2160 ) ( SURFACE-AT ?auto_2153 ?auto_2160 ) ( CLEAR ?auto_2153 ) ( IS-CRATE ?auto_2154 ) ( not ( = ?auto_2153 ?auto_2154 ) ) ( AVAILABLE ?auto_2157 ) ( ON ?auto_2153 ?auto_2158 ) ( not ( = ?auto_2158 ?auto_2153 ) ) ( not ( = ?auto_2158 ?auto_2154 ) ) ( TRUCK-AT ?auto_2156 ?auto_2155 ) ( not ( = ?auto_2155 ?auto_2160 ) ) ( HOIST-AT ?auto_2159 ?auto_2155 ) ( not ( = ?auto_2157 ?auto_2159 ) ) ( AVAILABLE ?auto_2159 ) ( SURFACE-AT ?auto_2154 ?auto_2155 ) ( ON ?auto_2154 ?auto_2161 ) ( CLEAR ?auto_2154 ) ( not ( = ?auto_2153 ?auto_2161 ) ) ( not ( = ?auto_2154 ?auto_2161 ) ) ( not ( = ?auto_2158 ?auto_2161 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2159 ?auto_2154 ?auto_2161 ?auto_2155 )
      ( MAKE-2CRATE ?auto_2158 ?auto_2153 ?auto_2154 )
      ( MAKE-1CRATE-VERIFY ?auto_2153 ?auto_2154 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2162 - SURFACE
      ?auto_2163 - SURFACE
      ?auto_2164 - SURFACE
    )
    :vars
    (
      ?auto_2166 - HOIST
      ?auto_2167 - PLACE
      ?auto_2168 - TRUCK
      ?auto_2169 - PLACE
      ?auto_2165 - HOIST
      ?auto_2170 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166 ?auto_2167 ) ( SURFACE-AT ?auto_2163 ?auto_2167 ) ( CLEAR ?auto_2163 ) ( IS-CRATE ?auto_2164 ) ( not ( = ?auto_2163 ?auto_2164 ) ) ( AVAILABLE ?auto_2166 ) ( ON ?auto_2163 ?auto_2162 ) ( not ( = ?auto_2162 ?auto_2163 ) ) ( not ( = ?auto_2162 ?auto_2164 ) ) ( TRUCK-AT ?auto_2168 ?auto_2169 ) ( not ( = ?auto_2169 ?auto_2167 ) ) ( HOIST-AT ?auto_2165 ?auto_2169 ) ( not ( = ?auto_2166 ?auto_2165 ) ) ( AVAILABLE ?auto_2165 ) ( SURFACE-AT ?auto_2164 ?auto_2169 ) ( ON ?auto_2164 ?auto_2170 ) ( CLEAR ?auto_2164 ) ( not ( = ?auto_2163 ?auto_2170 ) ) ( not ( = ?auto_2164 ?auto_2170 ) ) ( not ( = ?auto_2162 ?auto_2170 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2163 ?auto_2164 )
      ( MAKE-2CRATE-VERIFY ?auto_2162 ?auto_2163 ?auto_2164 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2171 - SURFACE
      ?auto_2172 - SURFACE
    )
    :vars
    (
      ?auto_2178 - HOIST
      ?auto_2175 - PLACE
      ?auto_2177 - SURFACE
      ?auto_2174 - PLACE
      ?auto_2179 - HOIST
      ?auto_2173 - SURFACE
      ?auto_2176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178 ?auto_2175 ) ( SURFACE-AT ?auto_2171 ?auto_2175 ) ( CLEAR ?auto_2171 ) ( IS-CRATE ?auto_2172 ) ( not ( = ?auto_2171 ?auto_2172 ) ) ( AVAILABLE ?auto_2178 ) ( ON ?auto_2171 ?auto_2177 ) ( not ( = ?auto_2177 ?auto_2171 ) ) ( not ( = ?auto_2177 ?auto_2172 ) ) ( not ( = ?auto_2174 ?auto_2175 ) ) ( HOIST-AT ?auto_2179 ?auto_2174 ) ( not ( = ?auto_2178 ?auto_2179 ) ) ( AVAILABLE ?auto_2179 ) ( SURFACE-AT ?auto_2172 ?auto_2174 ) ( ON ?auto_2172 ?auto_2173 ) ( CLEAR ?auto_2172 ) ( not ( = ?auto_2171 ?auto_2173 ) ) ( not ( = ?auto_2172 ?auto_2173 ) ) ( not ( = ?auto_2177 ?auto_2173 ) ) ( TRUCK-AT ?auto_2176 ?auto_2175 ) )
    :subtasks
    ( ( !DRIVE ?auto_2176 ?auto_2175 ?auto_2174 )
      ( MAKE-2CRATE ?auto_2177 ?auto_2171 ?auto_2172 )
      ( MAKE-1CRATE-VERIFY ?auto_2171 ?auto_2172 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2180 - SURFACE
      ?auto_2181 - SURFACE
      ?auto_2182 - SURFACE
    )
    :vars
    (
      ?auto_2184 - HOIST
      ?auto_2187 - PLACE
      ?auto_2183 - PLACE
      ?auto_2185 - HOIST
      ?auto_2188 - SURFACE
      ?auto_2186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2184 ?auto_2187 ) ( SURFACE-AT ?auto_2181 ?auto_2187 ) ( CLEAR ?auto_2181 ) ( IS-CRATE ?auto_2182 ) ( not ( = ?auto_2181 ?auto_2182 ) ) ( AVAILABLE ?auto_2184 ) ( ON ?auto_2181 ?auto_2180 ) ( not ( = ?auto_2180 ?auto_2181 ) ) ( not ( = ?auto_2180 ?auto_2182 ) ) ( not ( = ?auto_2183 ?auto_2187 ) ) ( HOIST-AT ?auto_2185 ?auto_2183 ) ( not ( = ?auto_2184 ?auto_2185 ) ) ( AVAILABLE ?auto_2185 ) ( SURFACE-AT ?auto_2182 ?auto_2183 ) ( ON ?auto_2182 ?auto_2188 ) ( CLEAR ?auto_2182 ) ( not ( = ?auto_2181 ?auto_2188 ) ) ( not ( = ?auto_2182 ?auto_2188 ) ) ( not ( = ?auto_2180 ?auto_2188 ) ) ( TRUCK-AT ?auto_2186 ?auto_2187 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2181 ?auto_2182 )
      ( MAKE-2CRATE-VERIFY ?auto_2180 ?auto_2181 ?auto_2182 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2189 - SURFACE
      ?auto_2190 - SURFACE
    )
    :vars
    (
      ?auto_2197 - HOIST
      ?auto_2195 - PLACE
      ?auto_2191 - SURFACE
      ?auto_2192 - PLACE
      ?auto_2196 - HOIST
      ?auto_2193 - SURFACE
      ?auto_2194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2197 ?auto_2195 ) ( IS-CRATE ?auto_2190 ) ( not ( = ?auto_2189 ?auto_2190 ) ) ( not ( = ?auto_2191 ?auto_2189 ) ) ( not ( = ?auto_2191 ?auto_2190 ) ) ( not ( = ?auto_2192 ?auto_2195 ) ) ( HOIST-AT ?auto_2196 ?auto_2192 ) ( not ( = ?auto_2197 ?auto_2196 ) ) ( AVAILABLE ?auto_2196 ) ( SURFACE-AT ?auto_2190 ?auto_2192 ) ( ON ?auto_2190 ?auto_2193 ) ( CLEAR ?auto_2190 ) ( not ( = ?auto_2189 ?auto_2193 ) ) ( not ( = ?auto_2190 ?auto_2193 ) ) ( not ( = ?auto_2191 ?auto_2193 ) ) ( TRUCK-AT ?auto_2194 ?auto_2195 ) ( SURFACE-AT ?auto_2191 ?auto_2195 ) ( CLEAR ?auto_2191 ) ( LIFTING ?auto_2197 ?auto_2189 ) ( IS-CRATE ?auto_2189 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2191 ?auto_2189 )
      ( MAKE-2CRATE ?auto_2191 ?auto_2189 ?auto_2190 )
      ( MAKE-1CRATE-VERIFY ?auto_2189 ?auto_2190 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2198 - SURFACE
      ?auto_2199 - SURFACE
      ?auto_2200 - SURFACE
    )
    :vars
    (
      ?auto_2204 - HOIST
      ?auto_2206 - PLACE
      ?auto_2201 - PLACE
      ?auto_2202 - HOIST
      ?auto_2205 - SURFACE
      ?auto_2203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2204 ?auto_2206 ) ( IS-CRATE ?auto_2200 ) ( not ( = ?auto_2199 ?auto_2200 ) ) ( not ( = ?auto_2198 ?auto_2199 ) ) ( not ( = ?auto_2198 ?auto_2200 ) ) ( not ( = ?auto_2201 ?auto_2206 ) ) ( HOIST-AT ?auto_2202 ?auto_2201 ) ( not ( = ?auto_2204 ?auto_2202 ) ) ( AVAILABLE ?auto_2202 ) ( SURFACE-AT ?auto_2200 ?auto_2201 ) ( ON ?auto_2200 ?auto_2205 ) ( CLEAR ?auto_2200 ) ( not ( = ?auto_2199 ?auto_2205 ) ) ( not ( = ?auto_2200 ?auto_2205 ) ) ( not ( = ?auto_2198 ?auto_2205 ) ) ( TRUCK-AT ?auto_2203 ?auto_2206 ) ( SURFACE-AT ?auto_2198 ?auto_2206 ) ( CLEAR ?auto_2198 ) ( LIFTING ?auto_2204 ?auto_2199 ) ( IS-CRATE ?auto_2199 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2199 ?auto_2200 )
      ( MAKE-2CRATE-VERIFY ?auto_2198 ?auto_2199 ?auto_2200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2207 - SURFACE
      ?auto_2208 - SURFACE
    )
    :vars
    (
      ?auto_2213 - HOIST
      ?auto_2212 - PLACE
      ?auto_2209 - SURFACE
      ?auto_2211 - PLACE
      ?auto_2210 - HOIST
      ?auto_2215 - SURFACE
      ?auto_2214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213 ?auto_2212 ) ( IS-CRATE ?auto_2208 ) ( not ( = ?auto_2207 ?auto_2208 ) ) ( not ( = ?auto_2209 ?auto_2207 ) ) ( not ( = ?auto_2209 ?auto_2208 ) ) ( not ( = ?auto_2211 ?auto_2212 ) ) ( HOIST-AT ?auto_2210 ?auto_2211 ) ( not ( = ?auto_2213 ?auto_2210 ) ) ( AVAILABLE ?auto_2210 ) ( SURFACE-AT ?auto_2208 ?auto_2211 ) ( ON ?auto_2208 ?auto_2215 ) ( CLEAR ?auto_2208 ) ( not ( = ?auto_2207 ?auto_2215 ) ) ( not ( = ?auto_2208 ?auto_2215 ) ) ( not ( = ?auto_2209 ?auto_2215 ) ) ( TRUCK-AT ?auto_2214 ?auto_2212 ) ( SURFACE-AT ?auto_2209 ?auto_2212 ) ( CLEAR ?auto_2209 ) ( IS-CRATE ?auto_2207 ) ( AVAILABLE ?auto_2213 ) ( IN ?auto_2207 ?auto_2214 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2213 ?auto_2207 ?auto_2214 ?auto_2212 )
      ( MAKE-2CRATE ?auto_2209 ?auto_2207 ?auto_2208 )
      ( MAKE-1CRATE-VERIFY ?auto_2207 ?auto_2208 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2216 - SURFACE
      ?auto_2217 - SURFACE
      ?auto_2218 - SURFACE
    )
    :vars
    (
      ?auto_2219 - HOIST
      ?auto_2224 - PLACE
      ?auto_2222 - PLACE
      ?auto_2223 - HOIST
      ?auto_2221 - SURFACE
      ?auto_2220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2219 ?auto_2224 ) ( IS-CRATE ?auto_2218 ) ( not ( = ?auto_2217 ?auto_2218 ) ) ( not ( = ?auto_2216 ?auto_2217 ) ) ( not ( = ?auto_2216 ?auto_2218 ) ) ( not ( = ?auto_2222 ?auto_2224 ) ) ( HOIST-AT ?auto_2223 ?auto_2222 ) ( not ( = ?auto_2219 ?auto_2223 ) ) ( AVAILABLE ?auto_2223 ) ( SURFACE-AT ?auto_2218 ?auto_2222 ) ( ON ?auto_2218 ?auto_2221 ) ( CLEAR ?auto_2218 ) ( not ( = ?auto_2217 ?auto_2221 ) ) ( not ( = ?auto_2218 ?auto_2221 ) ) ( not ( = ?auto_2216 ?auto_2221 ) ) ( TRUCK-AT ?auto_2220 ?auto_2224 ) ( SURFACE-AT ?auto_2216 ?auto_2224 ) ( CLEAR ?auto_2216 ) ( IS-CRATE ?auto_2217 ) ( AVAILABLE ?auto_2219 ) ( IN ?auto_2217 ?auto_2220 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2217 ?auto_2218 )
      ( MAKE-2CRATE-VERIFY ?auto_2216 ?auto_2217 ?auto_2218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2225 - SURFACE
      ?auto_2226 - SURFACE
    )
    :vars
    (
      ?auto_2231 - HOIST
      ?auto_2228 - PLACE
      ?auto_2227 - SURFACE
      ?auto_2232 - PLACE
      ?auto_2233 - HOIST
      ?auto_2229 - SURFACE
      ?auto_2230 - TRUCK
      ?auto_2234 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2231 ?auto_2228 ) ( IS-CRATE ?auto_2226 ) ( not ( = ?auto_2225 ?auto_2226 ) ) ( not ( = ?auto_2227 ?auto_2225 ) ) ( not ( = ?auto_2227 ?auto_2226 ) ) ( not ( = ?auto_2232 ?auto_2228 ) ) ( HOIST-AT ?auto_2233 ?auto_2232 ) ( not ( = ?auto_2231 ?auto_2233 ) ) ( AVAILABLE ?auto_2233 ) ( SURFACE-AT ?auto_2226 ?auto_2232 ) ( ON ?auto_2226 ?auto_2229 ) ( CLEAR ?auto_2226 ) ( not ( = ?auto_2225 ?auto_2229 ) ) ( not ( = ?auto_2226 ?auto_2229 ) ) ( not ( = ?auto_2227 ?auto_2229 ) ) ( SURFACE-AT ?auto_2227 ?auto_2228 ) ( CLEAR ?auto_2227 ) ( IS-CRATE ?auto_2225 ) ( AVAILABLE ?auto_2231 ) ( IN ?auto_2225 ?auto_2230 ) ( TRUCK-AT ?auto_2230 ?auto_2234 ) ( not ( = ?auto_2234 ?auto_2228 ) ) ( not ( = ?auto_2232 ?auto_2234 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2230 ?auto_2234 ?auto_2228 )
      ( MAKE-2CRATE ?auto_2227 ?auto_2225 ?auto_2226 )
      ( MAKE-1CRATE-VERIFY ?auto_2225 ?auto_2226 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2235 - SURFACE
      ?auto_2236 - SURFACE
      ?auto_2237 - SURFACE
    )
    :vars
    (
      ?auto_2241 - HOIST
      ?auto_2242 - PLACE
      ?auto_2240 - PLACE
      ?auto_2243 - HOIST
      ?auto_2244 - SURFACE
      ?auto_2239 - TRUCK
      ?auto_2238 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2241 ?auto_2242 ) ( IS-CRATE ?auto_2237 ) ( not ( = ?auto_2236 ?auto_2237 ) ) ( not ( = ?auto_2235 ?auto_2236 ) ) ( not ( = ?auto_2235 ?auto_2237 ) ) ( not ( = ?auto_2240 ?auto_2242 ) ) ( HOIST-AT ?auto_2243 ?auto_2240 ) ( not ( = ?auto_2241 ?auto_2243 ) ) ( AVAILABLE ?auto_2243 ) ( SURFACE-AT ?auto_2237 ?auto_2240 ) ( ON ?auto_2237 ?auto_2244 ) ( CLEAR ?auto_2237 ) ( not ( = ?auto_2236 ?auto_2244 ) ) ( not ( = ?auto_2237 ?auto_2244 ) ) ( not ( = ?auto_2235 ?auto_2244 ) ) ( SURFACE-AT ?auto_2235 ?auto_2242 ) ( CLEAR ?auto_2235 ) ( IS-CRATE ?auto_2236 ) ( AVAILABLE ?auto_2241 ) ( IN ?auto_2236 ?auto_2239 ) ( TRUCK-AT ?auto_2239 ?auto_2238 ) ( not ( = ?auto_2238 ?auto_2242 ) ) ( not ( = ?auto_2240 ?auto_2238 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2236 ?auto_2237 )
      ( MAKE-2CRATE-VERIFY ?auto_2235 ?auto_2236 ?auto_2237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2245 - SURFACE
      ?auto_2246 - SURFACE
    )
    :vars
    (
      ?auto_2247 - HOIST
      ?auto_2250 - PLACE
      ?auto_2249 - SURFACE
      ?auto_2254 - PLACE
      ?auto_2252 - HOIST
      ?auto_2248 - SURFACE
      ?auto_2253 - TRUCK
      ?auto_2251 - PLACE
      ?auto_2255 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2247 ?auto_2250 ) ( IS-CRATE ?auto_2246 ) ( not ( = ?auto_2245 ?auto_2246 ) ) ( not ( = ?auto_2249 ?auto_2245 ) ) ( not ( = ?auto_2249 ?auto_2246 ) ) ( not ( = ?auto_2254 ?auto_2250 ) ) ( HOIST-AT ?auto_2252 ?auto_2254 ) ( not ( = ?auto_2247 ?auto_2252 ) ) ( AVAILABLE ?auto_2252 ) ( SURFACE-AT ?auto_2246 ?auto_2254 ) ( ON ?auto_2246 ?auto_2248 ) ( CLEAR ?auto_2246 ) ( not ( = ?auto_2245 ?auto_2248 ) ) ( not ( = ?auto_2246 ?auto_2248 ) ) ( not ( = ?auto_2249 ?auto_2248 ) ) ( SURFACE-AT ?auto_2249 ?auto_2250 ) ( CLEAR ?auto_2249 ) ( IS-CRATE ?auto_2245 ) ( AVAILABLE ?auto_2247 ) ( TRUCK-AT ?auto_2253 ?auto_2251 ) ( not ( = ?auto_2251 ?auto_2250 ) ) ( not ( = ?auto_2254 ?auto_2251 ) ) ( HOIST-AT ?auto_2255 ?auto_2251 ) ( LIFTING ?auto_2255 ?auto_2245 ) ( not ( = ?auto_2247 ?auto_2255 ) ) ( not ( = ?auto_2252 ?auto_2255 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2255 ?auto_2245 ?auto_2253 ?auto_2251 )
      ( MAKE-2CRATE ?auto_2249 ?auto_2245 ?auto_2246 )
      ( MAKE-1CRATE-VERIFY ?auto_2245 ?auto_2246 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2256 - SURFACE
      ?auto_2257 - SURFACE
      ?auto_2258 - SURFACE
    )
    :vars
    (
      ?auto_2266 - HOIST
      ?auto_2261 - PLACE
      ?auto_2263 - PLACE
      ?auto_2259 - HOIST
      ?auto_2265 - SURFACE
      ?auto_2264 - TRUCK
      ?auto_2260 - PLACE
      ?auto_2262 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2266 ?auto_2261 ) ( IS-CRATE ?auto_2258 ) ( not ( = ?auto_2257 ?auto_2258 ) ) ( not ( = ?auto_2256 ?auto_2257 ) ) ( not ( = ?auto_2256 ?auto_2258 ) ) ( not ( = ?auto_2263 ?auto_2261 ) ) ( HOIST-AT ?auto_2259 ?auto_2263 ) ( not ( = ?auto_2266 ?auto_2259 ) ) ( AVAILABLE ?auto_2259 ) ( SURFACE-AT ?auto_2258 ?auto_2263 ) ( ON ?auto_2258 ?auto_2265 ) ( CLEAR ?auto_2258 ) ( not ( = ?auto_2257 ?auto_2265 ) ) ( not ( = ?auto_2258 ?auto_2265 ) ) ( not ( = ?auto_2256 ?auto_2265 ) ) ( SURFACE-AT ?auto_2256 ?auto_2261 ) ( CLEAR ?auto_2256 ) ( IS-CRATE ?auto_2257 ) ( AVAILABLE ?auto_2266 ) ( TRUCK-AT ?auto_2264 ?auto_2260 ) ( not ( = ?auto_2260 ?auto_2261 ) ) ( not ( = ?auto_2263 ?auto_2260 ) ) ( HOIST-AT ?auto_2262 ?auto_2260 ) ( LIFTING ?auto_2262 ?auto_2257 ) ( not ( = ?auto_2266 ?auto_2262 ) ) ( not ( = ?auto_2259 ?auto_2262 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2257 ?auto_2258 )
      ( MAKE-2CRATE-VERIFY ?auto_2256 ?auto_2257 ?auto_2258 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2267 - SURFACE
      ?auto_2268 - SURFACE
    )
    :vars
    (
      ?auto_2274 - HOIST
      ?auto_2275 - PLACE
      ?auto_2270 - SURFACE
      ?auto_2271 - PLACE
      ?auto_2272 - HOIST
      ?auto_2269 - SURFACE
      ?auto_2273 - TRUCK
      ?auto_2276 - PLACE
      ?auto_2277 - HOIST
      ?auto_2278 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274 ?auto_2275 ) ( IS-CRATE ?auto_2268 ) ( not ( = ?auto_2267 ?auto_2268 ) ) ( not ( = ?auto_2270 ?auto_2267 ) ) ( not ( = ?auto_2270 ?auto_2268 ) ) ( not ( = ?auto_2271 ?auto_2275 ) ) ( HOIST-AT ?auto_2272 ?auto_2271 ) ( not ( = ?auto_2274 ?auto_2272 ) ) ( AVAILABLE ?auto_2272 ) ( SURFACE-AT ?auto_2268 ?auto_2271 ) ( ON ?auto_2268 ?auto_2269 ) ( CLEAR ?auto_2268 ) ( not ( = ?auto_2267 ?auto_2269 ) ) ( not ( = ?auto_2268 ?auto_2269 ) ) ( not ( = ?auto_2270 ?auto_2269 ) ) ( SURFACE-AT ?auto_2270 ?auto_2275 ) ( CLEAR ?auto_2270 ) ( IS-CRATE ?auto_2267 ) ( AVAILABLE ?auto_2274 ) ( TRUCK-AT ?auto_2273 ?auto_2276 ) ( not ( = ?auto_2276 ?auto_2275 ) ) ( not ( = ?auto_2271 ?auto_2276 ) ) ( HOIST-AT ?auto_2277 ?auto_2276 ) ( not ( = ?auto_2274 ?auto_2277 ) ) ( not ( = ?auto_2272 ?auto_2277 ) ) ( AVAILABLE ?auto_2277 ) ( SURFACE-AT ?auto_2267 ?auto_2276 ) ( ON ?auto_2267 ?auto_2278 ) ( CLEAR ?auto_2267 ) ( not ( = ?auto_2267 ?auto_2278 ) ) ( not ( = ?auto_2268 ?auto_2278 ) ) ( not ( = ?auto_2270 ?auto_2278 ) ) ( not ( = ?auto_2269 ?auto_2278 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2277 ?auto_2267 ?auto_2278 ?auto_2276 )
      ( MAKE-2CRATE ?auto_2270 ?auto_2267 ?auto_2268 )
      ( MAKE-1CRATE-VERIFY ?auto_2267 ?auto_2268 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2279 - SURFACE
      ?auto_2280 - SURFACE
      ?auto_2281 - SURFACE
    )
    :vars
    (
      ?auto_2286 - HOIST
      ?auto_2290 - PLACE
      ?auto_2285 - PLACE
      ?auto_2287 - HOIST
      ?auto_2284 - SURFACE
      ?auto_2283 - TRUCK
      ?auto_2282 - PLACE
      ?auto_2289 - HOIST
      ?auto_2288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2286 ?auto_2290 ) ( IS-CRATE ?auto_2281 ) ( not ( = ?auto_2280 ?auto_2281 ) ) ( not ( = ?auto_2279 ?auto_2280 ) ) ( not ( = ?auto_2279 ?auto_2281 ) ) ( not ( = ?auto_2285 ?auto_2290 ) ) ( HOIST-AT ?auto_2287 ?auto_2285 ) ( not ( = ?auto_2286 ?auto_2287 ) ) ( AVAILABLE ?auto_2287 ) ( SURFACE-AT ?auto_2281 ?auto_2285 ) ( ON ?auto_2281 ?auto_2284 ) ( CLEAR ?auto_2281 ) ( not ( = ?auto_2280 ?auto_2284 ) ) ( not ( = ?auto_2281 ?auto_2284 ) ) ( not ( = ?auto_2279 ?auto_2284 ) ) ( SURFACE-AT ?auto_2279 ?auto_2290 ) ( CLEAR ?auto_2279 ) ( IS-CRATE ?auto_2280 ) ( AVAILABLE ?auto_2286 ) ( TRUCK-AT ?auto_2283 ?auto_2282 ) ( not ( = ?auto_2282 ?auto_2290 ) ) ( not ( = ?auto_2285 ?auto_2282 ) ) ( HOIST-AT ?auto_2289 ?auto_2282 ) ( not ( = ?auto_2286 ?auto_2289 ) ) ( not ( = ?auto_2287 ?auto_2289 ) ) ( AVAILABLE ?auto_2289 ) ( SURFACE-AT ?auto_2280 ?auto_2282 ) ( ON ?auto_2280 ?auto_2288 ) ( CLEAR ?auto_2280 ) ( not ( = ?auto_2280 ?auto_2288 ) ) ( not ( = ?auto_2281 ?auto_2288 ) ) ( not ( = ?auto_2279 ?auto_2288 ) ) ( not ( = ?auto_2284 ?auto_2288 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2280 ?auto_2281 )
      ( MAKE-2CRATE-VERIFY ?auto_2279 ?auto_2280 ?auto_2281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2291 - SURFACE
      ?auto_2292 - SURFACE
    )
    :vars
    (
      ?auto_2298 - HOIST
      ?auto_2297 - PLACE
      ?auto_2299 - SURFACE
      ?auto_2293 - PLACE
      ?auto_2301 - HOIST
      ?auto_2296 - SURFACE
      ?auto_2302 - PLACE
      ?auto_2295 - HOIST
      ?auto_2300 - SURFACE
      ?auto_2294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2298 ?auto_2297 ) ( IS-CRATE ?auto_2292 ) ( not ( = ?auto_2291 ?auto_2292 ) ) ( not ( = ?auto_2299 ?auto_2291 ) ) ( not ( = ?auto_2299 ?auto_2292 ) ) ( not ( = ?auto_2293 ?auto_2297 ) ) ( HOIST-AT ?auto_2301 ?auto_2293 ) ( not ( = ?auto_2298 ?auto_2301 ) ) ( AVAILABLE ?auto_2301 ) ( SURFACE-AT ?auto_2292 ?auto_2293 ) ( ON ?auto_2292 ?auto_2296 ) ( CLEAR ?auto_2292 ) ( not ( = ?auto_2291 ?auto_2296 ) ) ( not ( = ?auto_2292 ?auto_2296 ) ) ( not ( = ?auto_2299 ?auto_2296 ) ) ( SURFACE-AT ?auto_2299 ?auto_2297 ) ( CLEAR ?auto_2299 ) ( IS-CRATE ?auto_2291 ) ( AVAILABLE ?auto_2298 ) ( not ( = ?auto_2302 ?auto_2297 ) ) ( not ( = ?auto_2293 ?auto_2302 ) ) ( HOIST-AT ?auto_2295 ?auto_2302 ) ( not ( = ?auto_2298 ?auto_2295 ) ) ( not ( = ?auto_2301 ?auto_2295 ) ) ( AVAILABLE ?auto_2295 ) ( SURFACE-AT ?auto_2291 ?auto_2302 ) ( ON ?auto_2291 ?auto_2300 ) ( CLEAR ?auto_2291 ) ( not ( = ?auto_2291 ?auto_2300 ) ) ( not ( = ?auto_2292 ?auto_2300 ) ) ( not ( = ?auto_2299 ?auto_2300 ) ) ( not ( = ?auto_2296 ?auto_2300 ) ) ( TRUCK-AT ?auto_2294 ?auto_2297 ) )
    :subtasks
    ( ( !DRIVE ?auto_2294 ?auto_2297 ?auto_2302 )
      ( MAKE-2CRATE ?auto_2299 ?auto_2291 ?auto_2292 )
      ( MAKE-1CRATE-VERIFY ?auto_2291 ?auto_2292 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2303 - SURFACE
      ?auto_2304 - SURFACE
      ?auto_2305 - SURFACE
    )
    :vars
    (
      ?auto_2306 - HOIST
      ?auto_2312 - PLACE
      ?auto_2314 - PLACE
      ?auto_2308 - HOIST
      ?auto_2310 - SURFACE
      ?auto_2309 - PLACE
      ?auto_2311 - HOIST
      ?auto_2307 - SURFACE
      ?auto_2313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2306 ?auto_2312 ) ( IS-CRATE ?auto_2305 ) ( not ( = ?auto_2304 ?auto_2305 ) ) ( not ( = ?auto_2303 ?auto_2304 ) ) ( not ( = ?auto_2303 ?auto_2305 ) ) ( not ( = ?auto_2314 ?auto_2312 ) ) ( HOIST-AT ?auto_2308 ?auto_2314 ) ( not ( = ?auto_2306 ?auto_2308 ) ) ( AVAILABLE ?auto_2308 ) ( SURFACE-AT ?auto_2305 ?auto_2314 ) ( ON ?auto_2305 ?auto_2310 ) ( CLEAR ?auto_2305 ) ( not ( = ?auto_2304 ?auto_2310 ) ) ( not ( = ?auto_2305 ?auto_2310 ) ) ( not ( = ?auto_2303 ?auto_2310 ) ) ( SURFACE-AT ?auto_2303 ?auto_2312 ) ( CLEAR ?auto_2303 ) ( IS-CRATE ?auto_2304 ) ( AVAILABLE ?auto_2306 ) ( not ( = ?auto_2309 ?auto_2312 ) ) ( not ( = ?auto_2314 ?auto_2309 ) ) ( HOIST-AT ?auto_2311 ?auto_2309 ) ( not ( = ?auto_2306 ?auto_2311 ) ) ( not ( = ?auto_2308 ?auto_2311 ) ) ( AVAILABLE ?auto_2311 ) ( SURFACE-AT ?auto_2304 ?auto_2309 ) ( ON ?auto_2304 ?auto_2307 ) ( CLEAR ?auto_2304 ) ( not ( = ?auto_2304 ?auto_2307 ) ) ( not ( = ?auto_2305 ?auto_2307 ) ) ( not ( = ?auto_2303 ?auto_2307 ) ) ( not ( = ?auto_2310 ?auto_2307 ) ) ( TRUCK-AT ?auto_2313 ?auto_2312 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2304 ?auto_2305 )
      ( MAKE-2CRATE-VERIFY ?auto_2303 ?auto_2304 ?auto_2305 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2324 - SURFACE
      ?auto_2325 - SURFACE
    )
    :vars
    (
      ?auto_2326 - HOIST
      ?auto_2327 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2326 ?auto_2327 ) ( SURFACE-AT ?auto_2324 ?auto_2327 ) ( CLEAR ?auto_2324 ) ( LIFTING ?auto_2326 ?auto_2325 ) ( IS-CRATE ?auto_2325 ) ( not ( = ?auto_2324 ?auto_2325 ) ) )
    :subtasks
    ( ( !DROP ?auto_2326 ?auto_2325 ?auto_2324 ?auto_2327 )
      ( MAKE-1CRATE-VERIFY ?auto_2324 ?auto_2325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2328 - SURFACE
      ?auto_2329 - SURFACE
      ?auto_2330 - SURFACE
    )
    :vars
    (
      ?auto_2331 - HOIST
      ?auto_2332 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2331 ?auto_2332 ) ( SURFACE-AT ?auto_2329 ?auto_2332 ) ( CLEAR ?auto_2329 ) ( LIFTING ?auto_2331 ?auto_2330 ) ( IS-CRATE ?auto_2330 ) ( not ( = ?auto_2329 ?auto_2330 ) ) ( ON ?auto_2329 ?auto_2328 ) ( not ( = ?auto_2328 ?auto_2329 ) ) ( not ( = ?auto_2328 ?auto_2330 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2329 ?auto_2330 )
      ( MAKE-2CRATE-VERIFY ?auto_2328 ?auto_2329 ?auto_2330 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2333 - SURFACE
      ?auto_2334 - SURFACE
      ?auto_2335 - SURFACE
      ?auto_2336 - SURFACE
    )
    :vars
    (
      ?auto_2337 - HOIST
      ?auto_2338 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2337 ?auto_2338 ) ( SURFACE-AT ?auto_2335 ?auto_2338 ) ( CLEAR ?auto_2335 ) ( LIFTING ?auto_2337 ?auto_2336 ) ( IS-CRATE ?auto_2336 ) ( not ( = ?auto_2335 ?auto_2336 ) ) ( ON ?auto_2334 ?auto_2333 ) ( ON ?auto_2335 ?auto_2334 ) ( not ( = ?auto_2333 ?auto_2334 ) ) ( not ( = ?auto_2333 ?auto_2335 ) ) ( not ( = ?auto_2333 ?auto_2336 ) ) ( not ( = ?auto_2334 ?auto_2335 ) ) ( not ( = ?auto_2334 ?auto_2336 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2335 ?auto_2336 )
      ( MAKE-3CRATE-VERIFY ?auto_2333 ?auto_2334 ?auto_2335 ?auto_2336 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2339 - SURFACE
      ?auto_2340 - SURFACE
    )
    :vars
    (
      ?auto_2341 - HOIST
      ?auto_2342 - PLACE
      ?auto_2343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2341 ?auto_2342 ) ( SURFACE-AT ?auto_2339 ?auto_2342 ) ( CLEAR ?auto_2339 ) ( IS-CRATE ?auto_2340 ) ( not ( = ?auto_2339 ?auto_2340 ) ) ( TRUCK-AT ?auto_2343 ?auto_2342 ) ( AVAILABLE ?auto_2341 ) ( IN ?auto_2340 ?auto_2343 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2341 ?auto_2340 ?auto_2343 ?auto_2342 )
      ( MAKE-1CRATE ?auto_2339 ?auto_2340 )
      ( MAKE-1CRATE-VERIFY ?auto_2339 ?auto_2340 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2344 - SURFACE
      ?auto_2345 - SURFACE
      ?auto_2346 - SURFACE
    )
    :vars
    (
      ?auto_2347 - HOIST
      ?auto_2349 - PLACE
      ?auto_2348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2347 ?auto_2349 ) ( SURFACE-AT ?auto_2345 ?auto_2349 ) ( CLEAR ?auto_2345 ) ( IS-CRATE ?auto_2346 ) ( not ( = ?auto_2345 ?auto_2346 ) ) ( TRUCK-AT ?auto_2348 ?auto_2349 ) ( AVAILABLE ?auto_2347 ) ( IN ?auto_2346 ?auto_2348 ) ( ON ?auto_2345 ?auto_2344 ) ( not ( = ?auto_2344 ?auto_2345 ) ) ( not ( = ?auto_2344 ?auto_2346 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2345 ?auto_2346 )
      ( MAKE-2CRATE-VERIFY ?auto_2344 ?auto_2345 ?auto_2346 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2350 - SURFACE
      ?auto_2351 - SURFACE
      ?auto_2352 - SURFACE
      ?auto_2353 - SURFACE
    )
    :vars
    (
      ?auto_2356 - HOIST
      ?auto_2355 - PLACE
      ?auto_2354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2356 ?auto_2355 ) ( SURFACE-AT ?auto_2352 ?auto_2355 ) ( CLEAR ?auto_2352 ) ( IS-CRATE ?auto_2353 ) ( not ( = ?auto_2352 ?auto_2353 ) ) ( TRUCK-AT ?auto_2354 ?auto_2355 ) ( AVAILABLE ?auto_2356 ) ( IN ?auto_2353 ?auto_2354 ) ( ON ?auto_2352 ?auto_2351 ) ( not ( = ?auto_2351 ?auto_2352 ) ) ( not ( = ?auto_2351 ?auto_2353 ) ) ( ON ?auto_2351 ?auto_2350 ) ( not ( = ?auto_2350 ?auto_2351 ) ) ( not ( = ?auto_2350 ?auto_2352 ) ) ( not ( = ?auto_2350 ?auto_2353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2351 ?auto_2352 ?auto_2353 )
      ( MAKE-3CRATE-VERIFY ?auto_2350 ?auto_2351 ?auto_2352 ?auto_2353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2357 - SURFACE
      ?auto_2358 - SURFACE
    )
    :vars
    (
      ?auto_2361 - HOIST
      ?auto_2360 - PLACE
      ?auto_2359 - TRUCK
      ?auto_2362 - SURFACE
      ?auto_2363 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2361 ?auto_2360 ) ( SURFACE-AT ?auto_2357 ?auto_2360 ) ( CLEAR ?auto_2357 ) ( IS-CRATE ?auto_2358 ) ( not ( = ?auto_2357 ?auto_2358 ) ) ( AVAILABLE ?auto_2361 ) ( IN ?auto_2358 ?auto_2359 ) ( ON ?auto_2357 ?auto_2362 ) ( not ( = ?auto_2362 ?auto_2357 ) ) ( not ( = ?auto_2362 ?auto_2358 ) ) ( TRUCK-AT ?auto_2359 ?auto_2363 ) ( not ( = ?auto_2363 ?auto_2360 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2359 ?auto_2363 ?auto_2360 )
      ( MAKE-2CRATE ?auto_2362 ?auto_2357 ?auto_2358 )
      ( MAKE-1CRATE-VERIFY ?auto_2357 ?auto_2358 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2364 - SURFACE
      ?auto_2365 - SURFACE
      ?auto_2366 - SURFACE
    )
    :vars
    (
      ?auto_2367 - HOIST
      ?auto_2370 - PLACE
      ?auto_2368 - TRUCK
      ?auto_2369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367 ?auto_2370 ) ( SURFACE-AT ?auto_2365 ?auto_2370 ) ( CLEAR ?auto_2365 ) ( IS-CRATE ?auto_2366 ) ( not ( = ?auto_2365 ?auto_2366 ) ) ( AVAILABLE ?auto_2367 ) ( IN ?auto_2366 ?auto_2368 ) ( ON ?auto_2365 ?auto_2364 ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( not ( = ?auto_2364 ?auto_2366 ) ) ( TRUCK-AT ?auto_2368 ?auto_2369 ) ( not ( = ?auto_2369 ?auto_2370 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2365 ?auto_2366 )
      ( MAKE-2CRATE-VERIFY ?auto_2364 ?auto_2365 ?auto_2366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2371 - SURFACE
      ?auto_2372 - SURFACE
      ?auto_2373 - SURFACE
      ?auto_2374 - SURFACE
    )
    :vars
    (
      ?auto_2377 - HOIST
      ?auto_2375 - PLACE
      ?auto_2378 - TRUCK
      ?auto_2376 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2377 ?auto_2375 ) ( SURFACE-AT ?auto_2373 ?auto_2375 ) ( CLEAR ?auto_2373 ) ( IS-CRATE ?auto_2374 ) ( not ( = ?auto_2373 ?auto_2374 ) ) ( AVAILABLE ?auto_2377 ) ( IN ?auto_2374 ?auto_2378 ) ( ON ?auto_2373 ?auto_2372 ) ( not ( = ?auto_2372 ?auto_2373 ) ) ( not ( = ?auto_2372 ?auto_2374 ) ) ( TRUCK-AT ?auto_2378 ?auto_2376 ) ( not ( = ?auto_2376 ?auto_2375 ) ) ( ON ?auto_2372 ?auto_2371 ) ( not ( = ?auto_2371 ?auto_2372 ) ) ( not ( = ?auto_2371 ?auto_2373 ) ) ( not ( = ?auto_2371 ?auto_2374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2372 ?auto_2373 ?auto_2374 )
      ( MAKE-3CRATE-VERIFY ?auto_2371 ?auto_2372 ?auto_2373 ?auto_2374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2379 - SURFACE
      ?auto_2380 - SURFACE
    )
    :vars
    (
      ?auto_2383 - HOIST
      ?auto_2381 - PLACE
      ?auto_2384 - SURFACE
      ?auto_2385 - TRUCK
      ?auto_2382 - PLACE
      ?auto_2386 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2383 ?auto_2381 ) ( SURFACE-AT ?auto_2379 ?auto_2381 ) ( CLEAR ?auto_2379 ) ( IS-CRATE ?auto_2380 ) ( not ( = ?auto_2379 ?auto_2380 ) ) ( AVAILABLE ?auto_2383 ) ( ON ?auto_2379 ?auto_2384 ) ( not ( = ?auto_2384 ?auto_2379 ) ) ( not ( = ?auto_2384 ?auto_2380 ) ) ( TRUCK-AT ?auto_2385 ?auto_2382 ) ( not ( = ?auto_2382 ?auto_2381 ) ) ( HOIST-AT ?auto_2386 ?auto_2382 ) ( LIFTING ?auto_2386 ?auto_2380 ) ( not ( = ?auto_2383 ?auto_2386 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2386 ?auto_2380 ?auto_2385 ?auto_2382 )
      ( MAKE-2CRATE ?auto_2384 ?auto_2379 ?auto_2380 )
      ( MAKE-1CRATE-VERIFY ?auto_2379 ?auto_2380 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2387 - SURFACE
      ?auto_2388 - SURFACE
      ?auto_2389 - SURFACE
    )
    :vars
    (
      ?auto_2392 - HOIST
      ?auto_2390 - PLACE
      ?auto_2394 - TRUCK
      ?auto_2393 - PLACE
      ?auto_2391 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2392 ?auto_2390 ) ( SURFACE-AT ?auto_2388 ?auto_2390 ) ( CLEAR ?auto_2388 ) ( IS-CRATE ?auto_2389 ) ( not ( = ?auto_2388 ?auto_2389 ) ) ( AVAILABLE ?auto_2392 ) ( ON ?auto_2388 ?auto_2387 ) ( not ( = ?auto_2387 ?auto_2388 ) ) ( not ( = ?auto_2387 ?auto_2389 ) ) ( TRUCK-AT ?auto_2394 ?auto_2393 ) ( not ( = ?auto_2393 ?auto_2390 ) ) ( HOIST-AT ?auto_2391 ?auto_2393 ) ( LIFTING ?auto_2391 ?auto_2389 ) ( not ( = ?auto_2392 ?auto_2391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2388 ?auto_2389 )
      ( MAKE-2CRATE-VERIFY ?auto_2387 ?auto_2388 ?auto_2389 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2395 - SURFACE
      ?auto_2396 - SURFACE
      ?auto_2397 - SURFACE
      ?auto_2398 - SURFACE
    )
    :vars
    (
      ?auto_2399 - HOIST
      ?auto_2403 - PLACE
      ?auto_2401 - TRUCK
      ?auto_2400 - PLACE
      ?auto_2402 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399 ?auto_2403 ) ( SURFACE-AT ?auto_2397 ?auto_2403 ) ( CLEAR ?auto_2397 ) ( IS-CRATE ?auto_2398 ) ( not ( = ?auto_2397 ?auto_2398 ) ) ( AVAILABLE ?auto_2399 ) ( ON ?auto_2397 ?auto_2396 ) ( not ( = ?auto_2396 ?auto_2397 ) ) ( not ( = ?auto_2396 ?auto_2398 ) ) ( TRUCK-AT ?auto_2401 ?auto_2400 ) ( not ( = ?auto_2400 ?auto_2403 ) ) ( HOIST-AT ?auto_2402 ?auto_2400 ) ( LIFTING ?auto_2402 ?auto_2398 ) ( not ( = ?auto_2399 ?auto_2402 ) ) ( ON ?auto_2396 ?auto_2395 ) ( not ( = ?auto_2395 ?auto_2396 ) ) ( not ( = ?auto_2395 ?auto_2397 ) ) ( not ( = ?auto_2395 ?auto_2398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2396 ?auto_2397 ?auto_2398 )
      ( MAKE-3CRATE-VERIFY ?auto_2395 ?auto_2396 ?auto_2397 ?auto_2398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2404 - SURFACE
      ?auto_2405 - SURFACE
    )
    :vars
    (
      ?auto_2407 - HOIST
      ?auto_2411 - PLACE
      ?auto_2406 - SURFACE
      ?auto_2409 - TRUCK
      ?auto_2408 - PLACE
      ?auto_2410 - HOIST
      ?auto_2412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2407 ?auto_2411 ) ( SURFACE-AT ?auto_2404 ?auto_2411 ) ( CLEAR ?auto_2404 ) ( IS-CRATE ?auto_2405 ) ( not ( = ?auto_2404 ?auto_2405 ) ) ( AVAILABLE ?auto_2407 ) ( ON ?auto_2404 ?auto_2406 ) ( not ( = ?auto_2406 ?auto_2404 ) ) ( not ( = ?auto_2406 ?auto_2405 ) ) ( TRUCK-AT ?auto_2409 ?auto_2408 ) ( not ( = ?auto_2408 ?auto_2411 ) ) ( HOIST-AT ?auto_2410 ?auto_2408 ) ( not ( = ?auto_2407 ?auto_2410 ) ) ( AVAILABLE ?auto_2410 ) ( SURFACE-AT ?auto_2405 ?auto_2408 ) ( ON ?auto_2405 ?auto_2412 ) ( CLEAR ?auto_2405 ) ( not ( = ?auto_2404 ?auto_2412 ) ) ( not ( = ?auto_2405 ?auto_2412 ) ) ( not ( = ?auto_2406 ?auto_2412 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2410 ?auto_2405 ?auto_2412 ?auto_2408 )
      ( MAKE-2CRATE ?auto_2406 ?auto_2404 ?auto_2405 )
      ( MAKE-1CRATE-VERIFY ?auto_2404 ?auto_2405 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2413 - SURFACE
      ?auto_2414 - SURFACE
      ?auto_2415 - SURFACE
    )
    :vars
    (
      ?auto_2420 - HOIST
      ?auto_2419 - PLACE
      ?auto_2417 - TRUCK
      ?auto_2421 - PLACE
      ?auto_2418 - HOIST
      ?auto_2416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2420 ?auto_2419 ) ( SURFACE-AT ?auto_2414 ?auto_2419 ) ( CLEAR ?auto_2414 ) ( IS-CRATE ?auto_2415 ) ( not ( = ?auto_2414 ?auto_2415 ) ) ( AVAILABLE ?auto_2420 ) ( ON ?auto_2414 ?auto_2413 ) ( not ( = ?auto_2413 ?auto_2414 ) ) ( not ( = ?auto_2413 ?auto_2415 ) ) ( TRUCK-AT ?auto_2417 ?auto_2421 ) ( not ( = ?auto_2421 ?auto_2419 ) ) ( HOIST-AT ?auto_2418 ?auto_2421 ) ( not ( = ?auto_2420 ?auto_2418 ) ) ( AVAILABLE ?auto_2418 ) ( SURFACE-AT ?auto_2415 ?auto_2421 ) ( ON ?auto_2415 ?auto_2416 ) ( CLEAR ?auto_2415 ) ( not ( = ?auto_2414 ?auto_2416 ) ) ( not ( = ?auto_2415 ?auto_2416 ) ) ( not ( = ?auto_2413 ?auto_2416 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2414 ?auto_2415 )
      ( MAKE-2CRATE-VERIFY ?auto_2413 ?auto_2414 ?auto_2415 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2422 - SURFACE
      ?auto_2423 - SURFACE
      ?auto_2424 - SURFACE
      ?auto_2425 - SURFACE
    )
    :vars
    (
      ?auto_2431 - HOIST
      ?auto_2427 - PLACE
      ?auto_2426 - TRUCK
      ?auto_2430 - PLACE
      ?auto_2428 - HOIST
      ?auto_2429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431 ?auto_2427 ) ( SURFACE-AT ?auto_2424 ?auto_2427 ) ( CLEAR ?auto_2424 ) ( IS-CRATE ?auto_2425 ) ( not ( = ?auto_2424 ?auto_2425 ) ) ( AVAILABLE ?auto_2431 ) ( ON ?auto_2424 ?auto_2423 ) ( not ( = ?auto_2423 ?auto_2424 ) ) ( not ( = ?auto_2423 ?auto_2425 ) ) ( TRUCK-AT ?auto_2426 ?auto_2430 ) ( not ( = ?auto_2430 ?auto_2427 ) ) ( HOIST-AT ?auto_2428 ?auto_2430 ) ( not ( = ?auto_2431 ?auto_2428 ) ) ( AVAILABLE ?auto_2428 ) ( SURFACE-AT ?auto_2425 ?auto_2430 ) ( ON ?auto_2425 ?auto_2429 ) ( CLEAR ?auto_2425 ) ( not ( = ?auto_2424 ?auto_2429 ) ) ( not ( = ?auto_2425 ?auto_2429 ) ) ( not ( = ?auto_2423 ?auto_2429 ) ) ( ON ?auto_2423 ?auto_2422 ) ( not ( = ?auto_2422 ?auto_2423 ) ) ( not ( = ?auto_2422 ?auto_2424 ) ) ( not ( = ?auto_2422 ?auto_2425 ) ) ( not ( = ?auto_2422 ?auto_2429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2423 ?auto_2424 ?auto_2425 )
      ( MAKE-3CRATE-VERIFY ?auto_2422 ?auto_2423 ?auto_2424 ?auto_2425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2432 - SURFACE
      ?auto_2433 - SURFACE
    )
    :vars
    (
      ?auto_2440 - HOIST
      ?auto_2435 - PLACE
      ?auto_2439 - SURFACE
      ?auto_2438 - PLACE
      ?auto_2436 - HOIST
      ?auto_2437 - SURFACE
      ?auto_2434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2440 ?auto_2435 ) ( SURFACE-AT ?auto_2432 ?auto_2435 ) ( CLEAR ?auto_2432 ) ( IS-CRATE ?auto_2433 ) ( not ( = ?auto_2432 ?auto_2433 ) ) ( AVAILABLE ?auto_2440 ) ( ON ?auto_2432 ?auto_2439 ) ( not ( = ?auto_2439 ?auto_2432 ) ) ( not ( = ?auto_2439 ?auto_2433 ) ) ( not ( = ?auto_2438 ?auto_2435 ) ) ( HOIST-AT ?auto_2436 ?auto_2438 ) ( not ( = ?auto_2440 ?auto_2436 ) ) ( AVAILABLE ?auto_2436 ) ( SURFACE-AT ?auto_2433 ?auto_2438 ) ( ON ?auto_2433 ?auto_2437 ) ( CLEAR ?auto_2433 ) ( not ( = ?auto_2432 ?auto_2437 ) ) ( not ( = ?auto_2433 ?auto_2437 ) ) ( not ( = ?auto_2439 ?auto_2437 ) ) ( TRUCK-AT ?auto_2434 ?auto_2435 ) )
    :subtasks
    ( ( !DRIVE ?auto_2434 ?auto_2435 ?auto_2438 )
      ( MAKE-2CRATE ?auto_2439 ?auto_2432 ?auto_2433 )
      ( MAKE-1CRATE-VERIFY ?auto_2432 ?auto_2433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2441 - SURFACE
      ?auto_2442 - SURFACE
      ?auto_2443 - SURFACE
    )
    :vars
    (
      ?auto_2449 - HOIST
      ?auto_2444 - PLACE
      ?auto_2446 - PLACE
      ?auto_2445 - HOIST
      ?auto_2447 - SURFACE
      ?auto_2448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2449 ?auto_2444 ) ( SURFACE-AT ?auto_2442 ?auto_2444 ) ( CLEAR ?auto_2442 ) ( IS-CRATE ?auto_2443 ) ( not ( = ?auto_2442 ?auto_2443 ) ) ( AVAILABLE ?auto_2449 ) ( ON ?auto_2442 ?auto_2441 ) ( not ( = ?auto_2441 ?auto_2442 ) ) ( not ( = ?auto_2441 ?auto_2443 ) ) ( not ( = ?auto_2446 ?auto_2444 ) ) ( HOIST-AT ?auto_2445 ?auto_2446 ) ( not ( = ?auto_2449 ?auto_2445 ) ) ( AVAILABLE ?auto_2445 ) ( SURFACE-AT ?auto_2443 ?auto_2446 ) ( ON ?auto_2443 ?auto_2447 ) ( CLEAR ?auto_2443 ) ( not ( = ?auto_2442 ?auto_2447 ) ) ( not ( = ?auto_2443 ?auto_2447 ) ) ( not ( = ?auto_2441 ?auto_2447 ) ) ( TRUCK-AT ?auto_2448 ?auto_2444 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2442 ?auto_2443 )
      ( MAKE-2CRATE-VERIFY ?auto_2441 ?auto_2442 ?auto_2443 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2450 - SURFACE
      ?auto_2451 - SURFACE
      ?auto_2452 - SURFACE
      ?auto_2453 - SURFACE
    )
    :vars
    (
      ?auto_2457 - HOIST
      ?auto_2455 - PLACE
      ?auto_2454 - PLACE
      ?auto_2459 - HOIST
      ?auto_2456 - SURFACE
      ?auto_2458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2457 ?auto_2455 ) ( SURFACE-AT ?auto_2452 ?auto_2455 ) ( CLEAR ?auto_2452 ) ( IS-CRATE ?auto_2453 ) ( not ( = ?auto_2452 ?auto_2453 ) ) ( AVAILABLE ?auto_2457 ) ( ON ?auto_2452 ?auto_2451 ) ( not ( = ?auto_2451 ?auto_2452 ) ) ( not ( = ?auto_2451 ?auto_2453 ) ) ( not ( = ?auto_2454 ?auto_2455 ) ) ( HOIST-AT ?auto_2459 ?auto_2454 ) ( not ( = ?auto_2457 ?auto_2459 ) ) ( AVAILABLE ?auto_2459 ) ( SURFACE-AT ?auto_2453 ?auto_2454 ) ( ON ?auto_2453 ?auto_2456 ) ( CLEAR ?auto_2453 ) ( not ( = ?auto_2452 ?auto_2456 ) ) ( not ( = ?auto_2453 ?auto_2456 ) ) ( not ( = ?auto_2451 ?auto_2456 ) ) ( TRUCK-AT ?auto_2458 ?auto_2455 ) ( ON ?auto_2451 ?auto_2450 ) ( not ( = ?auto_2450 ?auto_2451 ) ) ( not ( = ?auto_2450 ?auto_2452 ) ) ( not ( = ?auto_2450 ?auto_2453 ) ) ( not ( = ?auto_2450 ?auto_2456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2451 ?auto_2452 ?auto_2453 )
      ( MAKE-3CRATE-VERIFY ?auto_2450 ?auto_2451 ?auto_2452 ?auto_2453 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2460 - SURFACE
      ?auto_2461 - SURFACE
    )
    :vars
    (
      ?auto_2466 - HOIST
      ?auto_2463 - PLACE
      ?auto_2464 - SURFACE
      ?auto_2462 - PLACE
      ?auto_2468 - HOIST
      ?auto_2465 - SURFACE
      ?auto_2467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2466 ?auto_2463 ) ( IS-CRATE ?auto_2461 ) ( not ( = ?auto_2460 ?auto_2461 ) ) ( not ( = ?auto_2464 ?auto_2460 ) ) ( not ( = ?auto_2464 ?auto_2461 ) ) ( not ( = ?auto_2462 ?auto_2463 ) ) ( HOIST-AT ?auto_2468 ?auto_2462 ) ( not ( = ?auto_2466 ?auto_2468 ) ) ( AVAILABLE ?auto_2468 ) ( SURFACE-AT ?auto_2461 ?auto_2462 ) ( ON ?auto_2461 ?auto_2465 ) ( CLEAR ?auto_2461 ) ( not ( = ?auto_2460 ?auto_2465 ) ) ( not ( = ?auto_2461 ?auto_2465 ) ) ( not ( = ?auto_2464 ?auto_2465 ) ) ( TRUCK-AT ?auto_2467 ?auto_2463 ) ( SURFACE-AT ?auto_2464 ?auto_2463 ) ( CLEAR ?auto_2464 ) ( LIFTING ?auto_2466 ?auto_2460 ) ( IS-CRATE ?auto_2460 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2464 ?auto_2460 )
      ( MAKE-2CRATE ?auto_2464 ?auto_2460 ?auto_2461 )
      ( MAKE-1CRATE-VERIFY ?auto_2460 ?auto_2461 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2469 - SURFACE
      ?auto_2470 - SURFACE
      ?auto_2471 - SURFACE
    )
    :vars
    (
      ?auto_2475 - HOIST
      ?auto_2473 - PLACE
      ?auto_2476 - PLACE
      ?auto_2474 - HOIST
      ?auto_2472 - SURFACE
      ?auto_2477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2475 ?auto_2473 ) ( IS-CRATE ?auto_2471 ) ( not ( = ?auto_2470 ?auto_2471 ) ) ( not ( = ?auto_2469 ?auto_2470 ) ) ( not ( = ?auto_2469 ?auto_2471 ) ) ( not ( = ?auto_2476 ?auto_2473 ) ) ( HOIST-AT ?auto_2474 ?auto_2476 ) ( not ( = ?auto_2475 ?auto_2474 ) ) ( AVAILABLE ?auto_2474 ) ( SURFACE-AT ?auto_2471 ?auto_2476 ) ( ON ?auto_2471 ?auto_2472 ) ( CLEAR ?auto_2471 ) ( not ( = ?auto_2470 ?auto_2472 ) ) ( not ( = ?auto_2471 ?auto_2472 ) ) ( not ( = ?auto_2469 ?auto_2472 ) ) ( TRUCK-AT ?auto_2477 ?auto_2473 ) ( SURFACE-AT ?auto_2469 ?auto_2473 ) ( CLEAR ?auto_2469 ) ( LIFTING ?auto_2475 ?auto_2470 ) ( IS-CRATE ?auto_2470 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2470 ?auto_2471 )
      ( MAKE-2CRATE-VERIFY ?auto_2469 ?auto_2470 ?auto_2471 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2478 - SURFACE
      ?auto_2479 - SURFACE
      ?auto_2480 - SURFACE
      ?auto_2481 - SURFACE
    )
    :vars
    (
      ?auto_2485 - HOIST
      ?auto_2482 - PLACE
      ?auto_2486 - PLACE
      ?auto_2483 - HOIST
      ?auto_2484 - SURFACE
      ?auto_2487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2485 ?auto_2482 ) ( IS-CRATE ?auto_2481 ) ( not ( = ?auto_2480 ?auto_2481 ) ) ( not ( = ?auto_2479 ?auto_2480 ) ) ( not ( = ?auto_2479 ?auto_2481 ) ) ( not ( = ?auto_2486 ?auto_2482 ) ) ( HOIST-AT ?auto_2483 ?auto_2486 ) ( not ( = ?auto_2485 ?auto_2483 ) ) ( AVAILABLE ?auto_2483 ) ( SURFACE-AT ?auto_2481 ?auto_2486 ) ( ON ?auto_2481 ?auto_2484 ) ( CLEAR ?auto_2481 ) ( not ( = ?auto_2480 ?auto_2484 ) ) ( not ( = ?auto_2481 ?auto_2484 ) ) ( not ( = ?auto_2479 ?auto_2484 ) ) ( TRUCK-AT ?auto_2487 ?auto_2482 ) ( SURFACE-AT ?auto_2479 ?auto_2482 ) ( CLEAR ?auto_2479 ) ( LIFTING ?auto_2485 ?auto_2480 ) ( IS-CRATE ?auto_2480 ) ( ON ?auto_2479 ?auto_2478 ) ( not ( = ?auto_2478 ?auto_2479 ) ) ( not ( = ?auto_2478 ?auto_2480 ) ) ( not ( = ?auto_2478 ?auto_2481 ) ) ( not ( = ?auto_2478 ?auto_2484 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2479 ?auto_2480 ?auto_2481 )
      ( MAKE-3CRATE-VERIFY ?auto_2478 ?auto_2479 ?auto_2480 ?auto_2481 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2488 - SURFACE
      ?auto_2489 - SURFACE
    )
    :vars
    (
      ?auto_2493 - HOIST
      ?auto_2490 - PLACE
      ?auto_2496 - SURFACE
      ?auto_2494 - PLACE
      ?auto_2491 - HOIST
      ?auto_2492 - SURFACE
      ?auto_2495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2493 ?auto_2490 ) ( IS-CRATE ?auto_2489 ) ( not ( = ?auto_2488 ?auto_2489 ) ) ( not ( = ?auto_2496 ?auto_2488 ) ) ( not ( = ?auto_2496 ?auto_2489 ) ) ( not ( = ?auto_2494 ?auto_2490 ) ) ( HOIST-AT ?auto_2491 ?auto_2494 ) ( not ( = ?auto_2493 ?auto_2491 ) ) ( AVAILABLE ?auto_2491 ) ( SURFACE-AT ?auto_2489 ?auto_2494 ) ( ON ?auto_2489 ?auto_2492 ) ( CLEAR ?auto_2489 ) ( not ( = ?auto_2488 ?auto_2492 ) ) ( not ( = ?auto_2489 ?auto_2492 ) ) ( not ( = ?auto_2496 ?auto_2492 ) ) ( TRUCK-AT ?auto_2495 ?auto_2490 ) ( SURFACE-AT ?auto_2496 ?auto_2490 ) ( CLEAR ?auto_2496 ) ( IS-CRATE ?auto_2488 ) ( AVAILABLE ?auto_2493 ) ( IN ?auto_2488 ?auto_2495 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2493 ?auto_2488 ?auto_2495 ?auto_2490 )
      ( MAKE-2CRATE ?auto_2496 ?auto_2488 ?auto_2489 )
      ( MAKE-1CRATE-VERIFY ?auto_2488 ?auto_2489 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2497 - SURFACE
      ?auto_2498 - SURFACE
      ?auto_2499 - SURFACE
    )
    :vars
    (
      ?auto_2503 - HOIST
      ?auto_2505 - PLACE
      ?auto_2502 - PLACE
      ?auto_2504 - HOIST
      ?auto_2501 - SURFACE
      ?auto_2500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2503 ?auto_2505 ) ( IS-CRATE ?auto_2499 ) ( not ( = ?auto_2498 ?auto_2499 ) ) ( not ( = ?auto_2497 ?auto_2498 ) ) ( not ( = ?auto_2497 ?auto_2499 ) ) ( not ( = ?auto_2502 ?auto_2505 ) ) ( HOIST-AT ?auto_2504 ?auto_2502 ) ( not ( = ?auto_2503 ?auto_2504 ) ) ( AVAILABLE ?auto_2504 ) ( SURFACE-AT ?auto_2499 ?auto_2502 ) ( ON ?auto_2499 ?auto_2501 ) ( CLEAR ?auto_2499 ) ( not ( = ?auto_2498 ?auto_2501 ) ) ( not ( = ?auto_2499 ?auto_2501 ) ) ( not ( = ?auto_2497 ?auto_2501 ) ) ( TRUCK-AT ?auto_2500 ?auto_2505 ) ( SURFACE-AT ?auto_2497 ?auto_2505 ) ( CLEAR ?auto_2497 ) ( IS-CRATE ?auto_2498 ) ( AVAILABLE ?auto_2503 ) ( IN ?auto_2498 ?auto_2500 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2498 ?auto_2499 )
      ( MAKE-2CRATE-VERIFY ?auto_2497 ?auto_2498 ?auto_2499 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2506 - SURFACE
      ?auto_2507 - SURFACE
      ?auto_2508 - SURFACE
      ?auto_2509 - SURFACE
    )
    :vars
    (
      ?auto_2515 - HOIST
      ?auto_2514 - PLACE
      ?auto_2511 - PLACE
      ?auto_2510 - HOIST
      ?auto_2513 - SURFACE
      ?auto_2512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2515 ?auto_2514 ) ( IS-CRATE ?auto_2509 ) ( not ( = ?auto_2508 ?auto_2509 ) ) ( not ( = ?auto_2507 ?auto_2508 ) ) ( not ( = ?auto_2507 ?auto_2509 ) ) ( not ( = ?auto_2511 ?auto_2514 ) ) ( HOIST-AT ?auto_2510 ?auto_2511 ) ( not ( = ?auto_2515 ?auto_2510 ) ) ( AVAILABLE ?auto_2510 ) ( SURFACE-AT ?auto_2509 ?auto_2511 ) ( ON ?auto_2509 ?auto_2513 ) ( CLEAR ?auto_2509 ) ( not ( = ?auto_2508 ?auto_2513 ) ) ( not ( = ?auto_2509 ?auto_2513 ) ) ( not ( = ?auto_2507 ?auto_2513 ) ) ( TRUCK-AT ?auto_2512 ?auto_2514 ) ( SURFACE-AT ?auto_2507 ?auto_2514 ) ( CLEAR ?auto_2507 ) ( IS-CRATE ?auto_2508 ) ( AVAILABLE ?auto_2515 ) ( IN ?auto_2508 ?auto_2512 ) ( ON ?auto_2507 ?auto_2506 ) ( not ( = ?auto_2506 ?auto_2507 ) ) ( not ( = ?auto_2506 ?auto_2508 ) ) ( not ( = ?auto_2506 ?auto_2509 ) ) ( not ( = ?auto_2506 ?auto_2513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2507 ?auto_2508 ?auto_2509 )
      ( MAKE-3CRATE-VERIFY ?auto_2506 ?auto_2507 ?auto_2508 ?auto_2509 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2516 - SURFACE
      ?auto_2517 - SURFACE
    )
    :vars
    (
      ?auto_2524 - HOIST
      ?auto_2523 - PLACE
      ?auto_2522 - SURFACE
      ?auto_2519 - PLACE
      ?auto_2518 - HOIST
      ?auto_2521 - SURFACE
      ?auto_2520 - TRUCK
      ?auto_2525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524 ?auto_2523 ) ( IS-CRATE ?auto_2517 ) ( not ( = ?auto_2516 ?auto_2517 ) ) ( not ( = ?auto_2522 ?auto_2516 ) ) ( not ( = ?auto_2522 ?auto_2517 ) ) ( not ( = ?auto_2519 ?auto_2523 ) ) ( HOIST-AT ?auto_2518 ?auto_2519 ) ( not ( = ?auto_2524 ?auto_2518 ) ) ( AVAILABLE ?auto_2518 ) ( SURFACE-AT ?auto_2517 ?auto_2519 ) ( ON ?auto_2517 ?auto_2521 ) ( CLEAR ?auto_2517 ) ( not ( = ?auto_2516 ?auto_2521 ) ) ( not ( = ?auto_2517 ?auto_2521 ) ) ( not ( = ?auto_2522 ?auto_2521 ) ) ( SURFACE-AT ?auto_2522 ?auto_2523 ) ( CLEAR ?auto_2522 ) ( IS-CRATE ?auto_2516 ) ( AVAILABLE ?auto_2524 ) ( IN ?auto_2516 ?auto_2520 ) ( TRUCK-AT ?auto_2520 ?auto_2525 ) ( not ( = ?auto_2525 ?auto_2523 ) ) ( not ( = ?auto_2519 ?auto_2525 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2520 ?auto_2525 ?auto_2523 )
      ( MAKE-2CRATE ?auto_2522 ?auto_2516 ?auto_2517 )
      ( MAKE-1CRATE-VERIFY ?auto_2516 ?auto_2517 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2526 - SURFACE
      ?auto_2527 - SURFACE
      ?auto_2528 - SURFACE
    )
    :vars
    (
      ?auto_2531 - HOIST
      ?auto_2530 - PLACE
      ?auto_2534 - PLACE
      ?auto_2533 - HOIST
      ?auto_2529 - SURFACE
      ?auto_2532 - TRUCK
      ?auto_2535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2531 ?auto_2530 ) ( IS-CRATE ?auto_2528 ) ( not ( = ?auto_2527 ?auto_2528 ) ) ( not ( = ?auto_2526 ?auto_2527 ) ) ( not ( = ?auto_2526 ?auto_2528 ) ) ( not ( = ?auto_2534 ?auto_2530 ) ) ( HOIST-AT ?auto_2533 ?auto_2534 ) ( not ( = ?auto_2531 ?auto_2533 ) ) ( AVAILABLE ?auto_2533 ) ( SURFACE-AT ?auto_2528 ?auto_2534 ) ( ON ?auto_2528 ?auto_2529 ) ( CLEAR ?auto_2528 ) ( not ( = ?auto_2527 ?auto_2529 ) ) ( not ( = ?auto_2528 ?auto_2529 ) ) ( not ( = ?auto_2526 ?auto_2529 ) ) ( SURFACE-AT ?auto_2526 ?auto_2530 ) ( CLEAR ?auto_2526 ) ( IS-CRATE ?auto_2527 ) ( AVAILABLE ?auto_2531 ) ( IN ?auto_2527 ?auto_2532 ) ( TRUCK-AT ?auto_2532 ?auto_2535 ) ( not ( = ?auto_2535 ?auto_2530 ) ) ( not ( = ?auto_2534 ?auto_2535 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2527 ?auto_2528 )
      ( MAKE-2CRATE-VERIFY ?auto_2526 ?auto_2527 ?auto_2528 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2536 - SURFACE
      ?auto_2537 - SURFACE
      ?auto_2538 - SURFACE
      ?auto_2539 - SURFACE
    )
    :vars
    (
      ?auto_2542 - HOIST
      ?auto_2546 - PLACE
      ?auto_2543 - PLACE
      ?auto_2544 - HOIST
      ?auto_2540 - SURFACE
      ?auto_2545 - TRUCK
      ?auto_2541 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2542 ?auto_2546 ) ( IS-CRATE ?auto_2539 ) ( not ( = ?auto_2538 ?auto_2539 ) ) ( not ( = ?auto_2537 ?auto_2538 ) ) ( not ( = ?auto_2537 ?auto_2539 ) ) ( not ( = ?auto_2543 ?auto_2546 ) ) ( HOIST-AT ?auto_2544 ?auto_2543 ) ( not ( = ?auto_2542 ?auto_2544 ) ) ( AVAILABLE ?auto_2544 ) ( SURFACE-AT ?auto_2539 ?auto_2543 ) ( ON ?auto_2539 ?auto_2540 ) ( CLEAR ?auto_2539 ) ( not ( = ?auto_2538 ?auto_2540 ) ) ( not ( = ?auto_2539 ?auto_2540 ) ) ( not ( = ?auto_2537 ?auto_2540 ) ) ( SURFACE-AT ?auto_2537 ?auto_2546 ) ( CLEAR ?auto_2537 ) ( IS-CRATE ?auto_2538 ) ( AVAILABLE ?auto_2542 ) ( IN ?auto_2538 ?auto_2545 ) ( TRUCK-AT ?auto_2545 ?auto_2541 ) ( not ( = ?auto_2541 ?auto_2546 ) ) ( not ( = ?auto_2543 ?auto_2541 ) ) ( ON ?auto_2537 ?auto_2536 ) ( not ( = ?auto_2536 ?auto_2537 ) ) ( not ( = ?auto_2536 ?auto_2538 ) ) ( not ( = ?auto_2536 ?auto_2539 ) ) ( not ( = ?auto_2536 ?auto_2540 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2537 ?auto_2538 ?auto_2539 )
      ( MAKE-3CRATE-VERIFY ?auto_2536 ?auto_2537 ?auto_2538 ?auto_2539 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2547 - SURFACE
      ?auto_2548 - SURFACE
    )
    :vars
    (
      ?auto_2551 - HOIST
      ?auto_2556 - PLACE
      ?auto_2555 - SURFACE
      ?auto_2552 - PLACE
      ?auto_2553 - HOIST
      ?auto_2549 - SURFACE
      ?auto_2554 - TRUCK
      ?auto_2550 - PLACE
      ?auto_2557 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2551 ?auto_2556 ) ( IS-CRATE ?auto_2548 ) ( not ( = ?auto_2547 ?auto_2548 ) ) ( not ( = ?auto_2555 ?auto_2547 ) ) ( not ( = ?auto_2555 ?auto_2548 ) ) ( not ( = ?auto_2552 ?auto_2556 ) ) ( HOIST-AT ?auto_2553 ?auto_2552 ) ( not ( = ?auto_2551 ?auto_2553 ) ) ( AVAILABLE ?auto_2553 ) ( SURFACE-AT ?auto_2548 ?auto_2552 ) ( ON ?auto_2548 ?auto_2549 ) ( CLEAR ?auto_2548 ) ( not ( = ?auto_2547 ?auto_2549 ) ) ( not ( = ?auto_2548 ?auto_2549 ) ) ( not ( = ?auto_2555 ?auto_2549 ) ) ( SURFACE-AT ?auto_2555 ?auto_2556 ) ( CLEAR ?auto_2555 ) ( IS-CRATE ?auto_2547 ) ( AVAILABLE ?auto_2551 ) ( TRUCK-AT ?auto_2554 ?auto_2550 ) ( not ( = ?auto_2550 ?auto_2556 ) ) ( not ( = ?auto_2552 ?auto_2550 ) ) ( HOIST-AT ?auto_2557 ?auto_2550 ) ( LIFTING ?auto_2557 ?auto_2547 ) ( not ( = ?auto_2551 ?auto_2557 ) ) ( not ( = ?auto_2553 ?auto_2557 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2557 ?auto_2547 ?auto_2554 ?auto_2550 )
      ( MAKE-2CRATE ?auto_2555 ?auto_2547 ?auto_2548 )
      ( MAKE-1CRATE-VERIFY ?auto_2547 ?auto_2548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2558 - SURFACE
      ?auto_2559 - SURFACE
      ?auto_2560 - SURFACE
    )
    :vars
    (
      ?auto_2562 - HOIST
      ?auto_2564 - PLACE
      ?auto_2567 - PLACE
      ?auto_2563 - HOIST
      ?auto_2566 - SURFACE
      ?auto_2568 - TRUCK
      ?auto_2565 - PLACE
      ?auto_2561 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2562 ?auto_2564 ) ( IS-CRATE ?auto_2560 ) ( not ( = ?auto_2559 ?auto_2560 ) ) ( not ( = ?auto_2558 ?auto_2559 ) ) ( not ( = ?auto_2558 ?auto_2560 ) ) ( not ( = ?auto_2567 ?auto_2564 ) ) ( HOIST-AT ?auto_2563 ?auto_2567 ) ( not ( = ?auto_2562 ?auto_2563 ) ) ( AVAILABLE ?auto_2563 ) ( SURFACE-AT ?auto_2560 ?auto_2567 ) ( ON ?auto_2560 ?auto_2566 ) ( CLEAR ?auto_2560 ) ( not ( = ?auto_2559 ?auto_2566 ) ) ( not ( = ?auto_2560 ?auto_2566 ) ) ( not ( = ?auto_2558 ?auto_2566 ) ) ( SURFACE-AT ?auto_2558 ?auto_2564 ) ( CLEAR ?auto_2558 ) ( IS-CRATE ?auto_2559 ) ( AVAILABLE ?auto_2562 ) ( TRUCK-AT ?auto_2568 ?auto_2565 ) ( not ( = ?auto_2565 ?auto_2564 ) ) ( not ( = ?auto_2567 ?auto_2565 ) ) ( HOIST-AT ?auto_2561 ?auto_2565 ) ( LIFTING ?auto_2561 ?auto_2559 ) ( not ( = ?auto_2562 ?auto_2561 ) ) ( not ( = ?auto_2563 ?auto_2561 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2559 ?auto_2560 )
      ( MAKE-2CRATE-VERIFY ?auto_2558 ?auto_2559 ?auto_2560 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2569 - SURFACE
      ?auto_2570 - SURFACE
      ?auto_2571 - SURFACE
      ?auto_2572 - SURFACE
    )
    :vars
    (
      ?auto_2574 - HOIST
      ?auto_2573 - PLACE
      ?auto_2577 - PLACE
      ?auto_2579 - HOIST
      ?auto_2580 - SURFACE
      ?auto_2576 - TRUCK
      ?auto_2578 - PLACE
      ?auto_2575 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2574 ?auto_2573 ) ( IS-CRATE ?auto_2572 ) ( not ( = ?auto_2571 ?auto_2572 ) ) ( not ( = ?auto_2570 ?auto_2571 ) ) ( not ( = ?auto_2570 ?auto_2572 ) ) ( not ( = ?auto_2577 ?auto_2573 ) ) ( HOIST-AT ?auto_2579 ?auto_2577 ) ( not ( = ?auto_2574 ?auto_2579 ) ) ( AVAILABLE ?auto_2579 ) ( SURFACE-AT ?auto_2572 ?auto_2577 ) ( ON ?auto_2572 ?auto_2580 ) ( CLEAR ?auto_2572 ) ( not ( = ?auto_2571 ?auto_2580 ) ) ( not ( = ?auto_2572 ?auto_2580 ) ) ( not ( = ?auto_2570 ?auto_2580 ) ) ( SURFACE-AT ?auto_2570 ?auto_2573 ) ( CLEAR ?auto_2570 ) ( IS-CRATE ?auto_2571 ) ( AVAILABLE ?auto_2574 ) ( TRUCK-AT ?auto_2576 ?auto_2578 ) ( not ( = ?auto_2578 ?auto_2573 ) ) ( not ( = ?auto_2577 ?auto_2578 ) ) ( HOIST-AT ?auto_2575 ?auto_2578 ) ( LIFTING ?auto_2575 ?auto_2571 ) ( not ( = ?auto_2574 ?auto_2575 ) ) ( not ( = ?auto_2579 ?auto_2575 ) ) ( ON ?auto_2570 ?auto_2569 ) ( not ( = ?auto_2569 ?auto_2570 ) ) ( not ( = ?auto_2569 ?auto_2571 ) ) ( not ( = ?auto_2569 ?auto_2572 ) ) ( not ( = ?auto_2569 ?auto_2580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2570 ?auto_2571 ?auto_2572 )
      ( MAKE-3CRATE-VERIFY ?auto_2569 ?auto_2570 ?auto_2571 ?auto_2572 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2581 - SURFACE
      ?auto_2582 - SURFACE
    )
    :vars
    (
      ?auto_2585 - HOIST
      ?auto_2583 - PLACE
      ?auto_2584 - SURFACE
      ?auto_2588 - PLACE
      ?auto_2590 - HOIST
      ?auto_2591 - SURFACE
      ?auto_2587 - TRUCK
      ?auto_2589 - PLACE
      ?auto_2586 - HOIST
      ?auto_2592 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2585 ?auto_2583 ) ( IS-CRATE ?auto_2582 ) ( not ( = ?auto_2581 ?auto_2582 ) ) ( not ( = ?auto_2584 ?auto_2581 ) ) ( not ( = ?auto_2584 ?auto_2582 ) ) ( not ( = ?auto_2588 ?auto_2583 ) ) ( HOIST-AT ?auto_2590 ?auto_2588 ) ( not ( = ?auto_2585 ?auto_2590 ) ) ( AVAILABLE ?auto_2590 ) ( SURFACE-AT ?auto_2582 ?auto_2588 ) ( ON ?auto_2582 ?auto_2591 ) ( CLEAR ?auto_2582 ) ( not ( = ?auto_2581 ?auto_2591 ) ) ( not ( = ?auto_2582 ?auto_2591 ) ) ( not ( = ?auto_2584 ?auto_2591 ) ) ( SURFACE-AT ?auto_2584 ?auto_2583 ) ( CLEAR ?auto_2584 ) ( IS-CRATE ?auto_2581 ) ( AVAILABLE ?auto_2585 ) ( TRUCK-AT ?auto_2587 ?auto_2589 ) ( not ( = ?auto_2589 ?auto_2583 ) ) ( not ( = ?auto_2588 ?auto_2589 ) ) ( HOIST-AT ?auto_2586 ?auto_2589 ) ( not ( = ?auto_2585 ?auto_2586 ) ) ( not ( = ?auto_2590 ?auto_2586 ) ) ( AVAILABLE ?auto_2586 ) ( SURFACE-AT ?auto_2581 ?auto_2589 ) ( ON ?auto_2581 ?auto_2592 ) ( CLEAR ?auto_2581 ) ( not ( = ?auto_2581 ?auto_2592 ) ) ( not ( = ?auto_2582 ?auto_2592 ) ) ( not ( = ?auto_2584 ?auto_2592 ) ) ( not ( = ?auto_2591 ?auto_2592 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2586 ?auto_2581 ?auto_2592 ?auto_2589 )
      ( MAKE-2CRATE ?auto_2584 ?auto_2581 ?auto_2582 )
      ( MAKE-1CRATE-VERIFY ?auto_2581 ?auto_2582 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2593 - SURFACE
      ?auto_2594 - SURFACE
      ?auto_2595 - SURFACE
    )
    :vars
    (
      ?auto_2601 - HOIST
      ?auto_2600 - PLACE
      ?auto_2599 - PLACE
      ?auto_2604 - HOIST
      ?auto_2598 - SURFACE
      ?auto_2597 - TRUCK
      ?auto_2602 - PLACE
      ?auto_2603 - HOIST
      ?auto_2596 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2601 ?auto_2600 ) ( IS-CRATE ?auto_2595 ) ( not ( = ?auto_2594 ?auto_2595 ) ) ( not ( = ?auto_2593 ?auto_2594 ) ) ( not ( = ?auto_2593 ?auto_2595 ) ) ( not ( = ?auto_2599 ?auto_2600 ) ) ( HOIST-AT ?auto_2604 ?auto_2599 ) ( not ( = ?auto_2601 ?auto_2604 ) ) ( AVAILABLE ?auto_2604 ) ( SURFACE-AT ?auto_2595 ?auto_2599 ) ( ON ?auto_2595 ?auto_2598 ) ( CLEAR ?auto_2595 ) ( not ( = ?auto_2594 ?auto_2598 ) ) ( not ( = ?auto_2595 ?auto_2598 ) ) ( not ( = ?auto_2593 ?auto_2598 ) ) ( SURFACE-AT ?auto_2593 ?auto_2600 ) ( CLEAR ?auto_2593 ) ( IS-CRATE ?auto_2594 ) ( AVAILABLE ?auto_2601 ) ( TRUCK-AT ?auto_2597 ?auto_2602 ) ( not ( = ?auto_2602 ?auto_2600 ) ) ( not ( = ?auto_2599 ?auto_2602 ) ) ( HOIST-AT ?auto_2603 ?auto_2602 ) ( not ( = ?auto_2601 ?auto_2603 ) ) ( not ( = ?auto_2604 ?auto_2603 ) ) ( AVAILABLE ?auto_2603 ) ( SURFACE-AT ?auto_2594 ?auto_2602 ) ( ON ?auto_2594 ?auto_2596 ) ( CLEAR ?auto_2594 ) ( not ( = ?auto_2594 ?auto_2596 ) ) ( not ( = ?auto_2595 ?auto_2596 ) ) ( not ( = ?auto_2593 ?auto_2596 ) ) ( not ( = ?auto_2598 ?auto_2596 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2594 ?auto_2595 )
      ( MAKE-2CRATE-VERIFY ?auto_2593 ?auto_2594 ?auto_2595 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2605 - SURFACE
      ?auto_2606 - SURFACE
      ?auto_2607 - SURFACE
      ?auto_2608 - SURFACE
    )
    :vars
    (
      ?auto_2610 - HOIST
      ?auto_2616 - PLACE
      ?auto_2614 - PLACE
      ?auto_2612 - HOIST
      ?auto_2617 - SURFACE
      ?auto_2613 - TRUCK
      ?auto_2615 - PLACE
      ?auto_2611 - HOIST
      ?auto_2609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2610 ?auto_2616 ) ( IS-CRATE ?auto_2608 ) ( not ( = ?auto_2607 ?auto_2608 ) ) ( not ( = ?auto_2606 ?auto_2607 ) ) ( not ( = ?auto_2606 ?auto_2608 ) ) ( not ( = ?auto_2614 ?auto_2616 ) ) ( HOIST-AT ?auto_2612 ?auto_2614 ) ( not ( = ?auto_2610 ?auto_2612 ) ) ( AVAILABLE ?auto_2612 ) ( SURFACE-AT ?auto_2608 ?auto_2614 ) ( ON ?auto_2608 ?auto_2617 ) ( CLEAR ?auto_2608 ) ( not ( = ?auto_2607 ?auto_2617 ) ) ( not ( = ?auto_2608 ?auto_2617 ) ) ( not ( = ?auto_2606 ?auto_2617 ) ) ( SURFACE-AT ?auto_2606 ?auto_2616 ) ( CLEAR ?auto_2606 ) ( IS-CRATE ?auto_2607 ) ( AVAILABLE ?auto_2610 ) ( TRUCK-AT ?auto_2613 ?auto_2615 ) ( not ( = ?auto_2615 ?auto_2616 ) ) ( not ( = ?auto_2614 ?auto_2615 ) ) ( HOIST-AT ?auto_2611 ?auto_2615 ) ( not ( = ?auto_2610 ?auto_2611 ) ) ( not ( = ?auto_2612 ?auto_2611 ) ) ( AVAILABLE ?auto_2611 ) ( SURFACE-AT ?auto_2607 ?auto_2615 ) ( ON ?auto_2607 ?auto_2609 ) ( CLEAR ?auto_2607 ) ( not ( = ?auto_2607 ?auto_2609 ) ) ( not ( = ?auto_2608 ?auto_2609 ) ) ( not ( = ?auto_2606 ?auto_2609 ) ) ( not ( = ?auto_2617 ?auto_2609 ) ) ( ON ?auto_2606 ?auto_2605 ) ( not ( = ?auto_2605 ?auto_2606 ) ) ( not ( = ?auto_2605 ?auto_2607 ) ) ( not ( = ?auto_2605 ?auto_2608 ) ) ( not ( = ?auto_2605 ?auto_2617 ) ) ( not ( = ?auto_2605 ?auto_2609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2606 ?auto_2607 ?auto_2608 )
      ( MAKE-3CRATE-VERIFY ?auto_2605 ?auto_2606 ?auto_2607 ?auto_2608 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2618 - SURFACE
      ?auto_2619 - SURFACE
    )
    :vars
    (
      ?auto_2622 - HOIST
      ?auto_2628 - PLACE
      ?auto_2620 - SURFACE
      ?auto_2626 - PLACE
      ?auto_2624 - HOIST
      ?auto_2629 - SURFACE
      ?auto_2627 - PLACE
      ?auto_2623 - HOIST
      ?auto_2621 - SURFACE
      ?auto_2625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2622 ?auto_2628 ) ( IS-CRATE ?auto_2619 ) ( not ( = ?auto_2618 ?auto_2619 ) ) ( not ( = ?auto_2620 ?auto_2618 ) ) ( not ( = ?auto_2620 ?auto_2619 ) ) ( not ( = ?auto_2626 ?auto_2628 ) ) ( HOIST-AT ?auto_2624 ?auto_2626 ) ( not ( = ?auto_2622 ?auto_2624 ) ) ( AVAILABLE ?auto_2624 ) ( SURFACE-AT ?auto_2619 ?auto_2626 ) ( ON ?auto_2619 ?auto_2629 ) ( CLEAR ?auto_2619 ) ( not ( = ?auto_2618 ?auto_2629 ) ) ( not ( = ?auto_2619 ?auto_2629 ) ) ( not ( = ?auto_2620 ?auto_2629 ) ) ( SURFACE-AT ?auto_2620 ?auto_2628 ) ( CLEAR ?auto_2620 ) ( IS-CRATE ?auto_2618 ) ( AVAILABLE ?auto_2622 ) ( not ( = ?auto_2627 ?auto_2628 ) ) ( not ( = ?auto_2626 ?auto_2627 ) ) ( HOIST-AT ?auto_2623 ?auto_2627 ) ( not ( = ?auto_2622 ?auto_2623 ) ) ( not ( = ?auto_2624 ?auto_2623 ) ) ( AVAILABLE ?auto_2623 ) ( SURFACE-AT ?auto_2618 ?auto_2627 ) ( ON ?auto_2618 ?auto_2621 ) ( CLEAR ?auto_2618 ) ( not ( = ?auto_2618 ?auto_2621 ) ) ( not ( = ?auto_2619 ?auto_2621 ) ) ( not ( = ?auto_2620 ?auto_2621 ) ) ( not ( = ?auto_2629 ?auto_2621 ) ) ( TRUCK-AT ?auto_2625 ?auto_2628 ) )
    :subtasks
    ( ( !DRIVE ?auto_2625 ?auto_2628 ?auto_2627 )
      ( MAKE-2CRATE ?auto_2620 ?auto_2618 ?auto_2619 )
      ( MAKE-1CRATE-VERIFY ?auto_2618 ?auto_2619 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2630 - SURFACE
      ?auto_2631 - SURFACE
      ?auto_2632 - SURFACE
    )
    :vars
    (
      ?auto_2640 - HOIST
      ?auto_2633 - PLACE
      ?auto_2638 - PLACE
      ?auto_2635 - HOIST
      ?auto_2641 - SURFACE
      ?auto_2639 - PLACE
      ?auto_2634 - HOIST
      ?auto_2636 - SURFACE
      ?auto_2637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2640 ?auto_2633 ) ( IS-CRATE ?auto_2632 ) ( not ( = ?auto_2631 ?auto_2632 ) ) ( not ( = ?auto_2630 ?auto_2631 ) ) ( not ( = ?auto_2630 ?auto_2632 ) ) ( not ( = ?auto_2638 ?auto_2633 ) ) ( HOIST-AT ?auto_2635 ?auto_2638 ) ( not ( = ?auto_2640 ?auto_2635 ) ) ( AVAILABLE ?auto_2635 ) ( SURFACE-AT ?auto_2632 ?auto_2638 ) ( ON ?auto_2632 ?auto_2641 ) ( CLEAR ?auto_2632 ) ( not ( = ?auto_2631 ?auto_2641 ) ) ( not ( = ?auto_2632 ?auto_2641 ) ) ( not ( = ?auto_2630 ?auto_2641 ) ) ( SURFACE-AT ?auto_2630 ?auto_2633 ) ( CLEAR ?auto_2630 ) ( IS-CRATE ?auto_2631 ) ( AVAILABLE ?auto_2640 ) ( not ( = ?auto_2639 ?auto_2633 ) ) ( not ( = ?auto_2638 ?auto_2639 ) ) ( HOIST-AT ?auto_2634 ?auto_2639 ) ( not ( = ?auto_2640 ?auto_2634 ) ) ( not ( = ?auto_2635 ?auto_2634 ) ) ( AVAILABLE ?auto_2634 ) ( SURFACE-AT ?auto_2631 ?auto_2639 ) ( ON ?auto_2631 ?auto_2636 ) ( CLEAR ?auto_2631 ) ( not ( = ?auto_2631 ?auto_2636 ) ) ( not ( = ?auto_2632 ?auto_2636 ) ) ( not ( = ?auto_2630 ?auto_2636 ) ) ( not ( = ?auto_2641 ?auto_2636 ) ) ( TRUCK-AT ?auto_2637 ?auto_2633 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2631 ?auto_2632 )
      ( MAKE-2CRATE-VERIFY ?auto_2630 ?auto_2631 ?auto_2632 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2642 - SURFACE
      ?auto_2643 - SURFACE
      ?auto_2644 - SURFACE
      ?auto_2645 - SURFACE
    )
    :vars
    (
      ?auto_2647 - HOIST
      ?auto_2648 - PLACE
      ?auto_2650 - PLACE
      ?auto_2649 - HOIST
      ?auto_2652 - SURFACE
      ?auto_2651 - PLACE
      ?auto_2654 - HOIST
      ?auto_2646 - SURFACE
      ?auto_2653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2647 ?auto_2648 ) ( IS-CRATE ?auto_2645 ) ( not ( = ?auto_2644 ?auto_2645 ) ) ( not ( = ?auto_2643 ?auto_2644 ) ) ( not ( = ?auto_2643 ?auto_2645 ) ) ( not ( = ?auto_2650 ?auto_2648 ) ) ( HOIST-AT ?auto_2649 ?auto_2650 ) ( not ( = ?auto_2647 ?auto_2649 ) ) ( AVAILABLE ?auto_2649 ) ( SURFACE-AT ?auto_2645 ?auto_2650 ) ( ON ?auto_2645 ?auto_2652 ) ( CLEAR ?auto_2645 ) ( not ( = ?auto_2644 ?auto_2652 ) ) ( not ( = ?auto_2645 ?auto_2652 ) ) ( not ( = ?auto_2643 ?auto_2652 ) ) ( SURFACE-AT ?auto_2643 ?auto_2648 ) ( CLEAR ?auto_2643 ) ( IS-CRATE ?auto_2644 ) ( AVAILABLE ?auto_2647 ) ( not ( = ?auto_2651 ?auto_2648 ) ) ( not ( = ?auto_2650 ?auto_2651 ) ) ( HOIST-AT ?auto_2654 ?auto_2651 ) ( not ( = ?auto_2647 ?auto_2654 ) ) ( not ( = ?auto_2649 ?auto_2654 ) ) ( AVAILABLE ?auto_2654 ) ( SURFACE-AT ?auto_2644 ?auto_2651 ) ( ON ?auto_2644 ?auto_2646 ) ( CLEAR ?auto_2644 ) ( not ( = ?auto_2644 ?auto_2646 ) ) ( not ( = ?auto_2645 ?auto_2646 ) ) ( not ( = ?auto_2643 ?auto_2646 ) ) ( not ( = ?auto_2652 ?auto_2646 ) ) ( TRUCK-AT ?auto_2653 ?auto_2648 ) ( ON ?auto_2643 ?auto_2642 ) ( not ( = ?auto_2642 ?auto_2643 ) ) ( not ( = ?auto_2642 ?auto_2644 ) ) ( not ( = ?auto_2642 ?auto_2645 ) ) ( not ( = ?auto_2642 ?auto_2652 ) ) ( not ( = ?auto_2642 ?auto_2646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2643 ?auto_2644 ?auto_2645 )
      ( MAKE-3CRATE-VERIFY ?auto_2642 ?auto_2643 ?auto_2644 ?auto_2645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2655 - SURFACE
      ?auto_2656 - SURFACE
    )
    :vars
    (
      ?auto_2658 - HOIST
      ?auto_2659 - PLACE
      ?auto_2666 - SURFACE
      ?auto_2661 - PLACE
      ?auto_2660 - HOIST
      ?auto_2663 - SURFACE
      ?auto_2662 - PLACE
      ?auto_2665 - HOIST
      ?auto_2657 - SURFACE
      ?auto_2664 - TRUCK
      ?auto_2667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2658 ?auto_2659 ) ( IS-CRATE ?auto_2656 ) ( not ( = ?auto_2655 ?auto_2656 ) ) ( not ( = ?auto_2666 ?auto_2655 ) ) ( not ( = ?auto_2666 ?auto_2656 ) ) ( not ( = ?auto_2661 ?auto_2659 ) ) ( HOIST-AT ?auto_2660 ?auto_2661 ) ( not ( = ?auto_2658 ?auto_2660 ) ) ( AVAILABLE ?auto_2660 ) ( SURFACE-AT ?auto_2656 ?auto_2661 ) ( ON ?auto_2656 ?auto_2663 ) ( CLEAR ?auto_2656 ) ( not ( = ?auto_2655 ?auto_2663 ) ) ( not ( = ?auto_2656 ?auto_2663 ) ) ( not ( = ?auto_2666 ?auto_2663 ) ) ( IS-CRATE ?auto_2655 ) ( not ( = ?auto_2662 ?auto_2659 ) ) ( not ( = ?auto_2661 ?auto_2662 ) ) ( HOIST-AT ?auto_2665 ?auto_2662 ) ( not ( = ?auto_2658 ?auto_2665 ) ) ( not ( = ?auto_2660 ?auto_2665 ) ) ( AVAILABLE ?auto_2665 ) ( SURFACE-AT ?auto_2655 ?auto_2662 ) ( ON ?auto_2655 ?auto_2657 ) ( CLEAR ?auto_2655 ) ( not ( = ?auto_2655 ?auto_2657 ) ) ( not ( = ?auto_2656 ?auto_2657 ) ) ( not ( = ?auto_2666 ?auto_2657 ) ) ( not ( = ?auto_2663 ?auto_2657 ) ) ( TRUCK-AT ?auto_2664 ?auto_2659 ) ( SURFACE-AT ?auto_2667 ?auto_2659 ) ( CLEAR ?auto_2667 ) ( LIFTING ?auto_2658 ?auto_2666 ) ( IS-CRATE ?auto_2666 ) ( not ( = ?auto_2667 ?auto_2666 ) ) ( not ( = ?auto_2655 ?auto_2667 ) ) ( not ( = ?auto_2656 ?auto_2667 ) ) ( not ( = ?auto_2663 ?auto_2667 ) ) ( not ( = ?auto_2657 ?auto_2667 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2667 ?auto_2666 )
      ( MAKE-2CRATE ?auto_2666 ?auto_2655 ?auto_2656 )
      ( MAKE-1CRATE-VERIFY ?auto_2655 ?auto_2656 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2668 - SURFACE
      ?auto_2669 - SURFACE
      ?auto_2670 - SURFACE
    )
    :vars
    (
      ?auto_2676 - HOIST
      ?auto_2673 - PLACE
      ?auto_2674 - PLACE
      ?auto_2680 - HOIST
      ?auto_2671 - SURFACE
      ?auto_2679 - PLACE
      ?auto_2675 - HOIST
      ?auto_2672 - SURFACE
      ?auto_2678 - TRUCK
      ?auto_2677 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676 ?auto_2673 ) ( IS-CRATE ?auto_2670 ) ( not ( = ?auto_2669 ?auto_2670 ) ) ( not ( = ?auto_2668 ?auto_2669 ) ) ( not ( = ?auto_2668 ?auto_2670 ) ) ( not ( = ?auto_2674 ?auto_2673 ) ) ( HOIST-AT ?auto_2680 ?auto_2674 ) ( not ( = ?auto_2676 ?auto_2680 ) ) ( AVAILABLE ?auto_2680 ) ( SURFACE-AT ?auto_2670 ?auto_2674 ) ( ON ?auto_2670 ?auto_2671 ) ( CLEAR ?auto_2670 ) ( not ( = ?auto_2669 ?auto_2671 ) ) ( not ( = ?auto_2670 ?auto_2671 ) ) ( not ( = ?auto_2668 ?auto_2671 ) ) ( IS-CRATE ?auto_2669 ) ( not ( = ?auto_2679 ?auto_2673 ) ) ( not ( = ?auto_2674 ?auto_2679 ) ) ( HOIST-AT ?auto_2675 ?auto_2679 ) ( not ( = ?auto_2676 ?auto_2675 ) ) ( not ( = ?auto_2680 ?auto_2675 ) ) ( AVAILABLE ?auto_2675 ) ( SURFACE-AT ?auto_2669 ?auto_2679 ) ( ON ?auto_2669 ?auto_2672 ) ( CLEAR ?auto_2669 ) ( not ( = ?auto_2669 ?auto_2672 ) ) ( not ( = ?auto_2670 ?auto_2672 ) ) ( not ( = ?auto_2668 ?auto_2672 ) ) ( not ( = ?auto_2671 ?auto_2672 ) ) ( TRUCK-AT ?auto_2678 ?auto_2673 ) ( SURFACE-AT ?auto_2677 ?auto_2673 ) ( CLEAR ?auto_2677 ) ( LIFTING ?auto_2676 ?auto_2668 ) ( IS-CRATE ?auto_2668 ) ( not ( = ?auto_2677 ?auto_2668 ) ) ( not ( = ?auto_2669 ?auto_2677 ) ) ( not ( = ?auto_2670 ?auto_2677 ) ) ( not ( = ?auto_2671 ?auto_2677 ) ) ( not ( = ?auto_2672 ?auto_2677 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2669 ?auto_2670 )
      ( MAKE-2CRATE-VERIFY ?auto_2668 ?auto_2669 ?auto_2670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2681 - SURFACE
      ?auto_2682 - SURFACE
      ?auto_2683 - SURFACE
      ?auto_2684 - SURFACE
    )
    :vars
    (
      ?auto_2691 - HOIST
      ?auto_2686 - PLACE
      ?auto_2689 - PLACE
      ?auto_2690 - HOIST
      ?auto_2685 - SURFACE
      ?auto_2687 - PLACE
      ?auto_2692 - HOIST
      ?auto_2693 - SURFACE
      ?auto_2688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2691 ?auto_2686 ) ( IS-CRATE ?auto_2684 ) ( not ( = ?auto_2683 ?auto_2684 ) ) ( not ( = ?auto_2682 ?auto_2683 ) ) ( not ( = ?auto_2682 ?auto_2684 ) ) ( not ( = ?auto_2689 ?auto_2686 ) ) ( HOIST-AT ?auto_2690 ?auto_2689 ) ( not ( = ?auto_2691 ?auto_2690 ) ) ( AVAILABLE ?auto_2690 ) ( SURFACE-AT ?auto_2684 ?auto_2689 ) ( ON ?auto_2684 ?auto_2685 ) ( CLEAR ?auto_2684 ) ( not ( = ?auto_2683 ?auto_2685 ) ) ( not ( = ?auto_2684 ?auto_2685 ) ) ( not ( = ?auto_2682 ?auto_2685 ) ) ( IS-CRATE ?auto_2683 ) ( not ( = ?auto_2687 ?auto_2686 ) ) ( not ( = ?auto_2689 ?auto_2687 ) ) ( HOIST-AT ?auto_2692 ?auto_2687 ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2690 ?auto_2692 ) ) ( AVAILABLE ?auto_2692 ) ( SURFACE-AT ?auto_2683 ?auto_2687 ) ( ON ?auto_2683 ?auto_2693 ) ( CLEAR ?auto_2683 ) ( not ( = ?auto_2683 ?auto_2693 ) ) ( not ( = ?auto_2684 ?auto_2693 ) ) ( not ( = ?auto_2682 ?auto_2693 ) ) ( not ( = ?auto_2685 ?auto_2693 ) ) ( TRUCK-AT ?auto_2688 ?auto_2686 ) ( SURFACE-AT ?auto_2681 ?auto_2686 ) ( CLEAR ?auto_2681 ) ( LIFTING ?auto_2691 ?auto_2682 ) ( IS-CRATE ?auto_2682 ) ( not ( = ?auto_2681 ?auto_2682 ) ) ( not ( = ?auto_2683 ?auto_2681 ) ) ( not ( = ?auto_2684 ?auto_2681 ) ) ( not ( = ?auto_2685 ?auto_2681 ) ) ( not ( = ?auto_2693 ?auto_2681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2682 ?auto_2683 ?auto_2684 )
      ( MAKE-3CRATE-VERIFY ?auto_2681 ?auto_2682 ?auto_2683 ?auto_2684 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2694 - SURFACE
      ?auto_2695 - SURFACE
    )
    :vars
    (
      ?auto_2704 - HOIST
      ?auto_2697 - PLACE
      ?auto_2703 - SURFACE
      ?auto_2701 - PLACE
      ?auto_2702 - HOIST
      ?auto_2696 - SURFACE
      ?auto_2699 - PLACE
      ?auto_2705 - HOIST
      ?auto_2706 - SURFACE
      ?auto_2700 - TRUCK
      ?auto_2698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2704 ?auto_2697 ) ( IS-CRATE ?auto_2695 ) ( not ( = ?auto_2694 ?auto_2695 ) ) ( not ( = ?auto_2703 ?auto_2694 ) ) ( not ( = ?auto_2703 ?auto_2695 ) ) ( not ( = ?auto_2701 ?auto_2697 ) ) ( HOIST-AT ?auto_2702 ?auto_2701 ) ( not ( = ?auto_2704 ?auto_2702 ) ) ( AVAILABLE ?auto_2702 ) ( SURFACE-AT ?auto_2695 ?auto_2701 ) ( ON ?auto_2695 ?auto_2696 ) ( CLEAR ?auto_2695 ) ( not ( = ?auto_2694 ?auto_2696 ) ) ( not ( = ?auto_2695 ?auto_2696 ) ) ( not ( = ?auto_2703 ?auto_2696 ) ) ( IS-CRATE ?auto_2694 ) ( not ( = ?auto_2699 ?auto_2697 ) ) ( not ( = ?auto_2701 ?auto_2699 ) ) ( HOIST-AT ?auto_2705 ?auto_2699 ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( not ( = ?auto_2702 ?auto_2705 ) ) ( AVAILABLE ?auto_2705 ) ( SURFACE-AT ?auto_2694 ?auto_2699 ) ( ON ?auto_2694 ?auto_2706 ) ( CLEAR ?auto_2694 ) ( not ( = ?auto_2694 ?auto_2706 ) ) ( not ( = ?auto_2695 ?auto_2706 ) ) ( not ( = ?auto_2703 ?auto_2706 ) ) ( not ( = ?auto_2696 ?auto_2706 ) ) ( TRUCK-AT ?auto_2700 ?auto_2697 ) ( SURFACE-AT ?auto_2698 ?auto_2697 ) ( CLEAR ?auto_2698 ) ( IS-CRATE ?auto_2703 ) ( not ( = ?auto_2698 ?auto_2703 ) ) ( not ( = ?auto_2694 ?auto_2698 ) ) ( not ( = ?auto_2695 ?auto_2698 ) ) ( not ( = ?auto_2696 ?auto_2698 ) ) ( not ( = ?auto_2706 ?auto_2698 ) ) ( AVAILABLE ?auto_2704 ) ( IN ?auto_2703 ?auto_2700 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2704 ?auto_2703 ?auto_2700 ?auto_2697 )
      ( MAKE-2CRATE ?auto_2703 ?auto_2694 ?auto_2695 )
      ( MAKE-1CRATE-VERIFY ?auto_2694 ?auto_2695 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2707 - SURFACE
      ?auto_2708 - SURFACE
      ?auto_2709 - SURFACE
    )
    :vars
    (
      ?auto_2714 - HOIST
      ?auto_2710 - PLACE
      ?auto_2719 - PLACE
      ?auto_2712 - HOIST
      ?auto_2715 - SURFACE
      ?auto_2717 - PLACE
      ?auto_2713 - HOIST
      ?auto_2716 - SURFACE
      ?auto_2718 - TRUCK
      ?auto_2711 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2714 ?auto_2710 ) ( IS-CRATE ?auto_2709 ) ( not ( = ?auto_2708 ?auto_2709 ) ) ( not ( = ?auto_2707 ?auto_2708 ) ) ( not ( = ?auto_2707 ?auto_2709 ) ) ( not ( = ?auto_2719 ?auto_2710 ) ) ( HOIST-AT ?auto_2712 ?auto_2719 ) ( not ( = ?auto_2714 ?auto_2712 ) ) ( AVAILABLE ?auto_2712 ) ( SURFACE-AT ?auto_2709 ?auto_2719 ) ( ON ?auto_2709 ?auto_2715 ) ( CLEAR ?auto_2709 ) ( not ( = ?auto_2708 ?auto_2715 ) ) ( not ( = ?auto_2709 ?auto_2715 ) ) ( not ( = ?auto_2707 ?auto_2715 ) ) ( IS-CRATE ?auto_2708 ) ( not ( = ?auto_2717 ?auto_2710 ) ) ( not ( = ?auto_2719 ?auto_2717 ) ) ( HOIST-AT ?auto_2713 ?auto_2717 ) ( not ( = ?auto_2714 ?auto_2713 ) ) ( not ( = ?auto_2712 ?auto_2713 ) ) ( AVAILABLE ?auto_2713 ) ( SURFACE-AT ?auto_2708 ?auto_2717 ) ( ON ?auto_2708 ?auto_2716 ) ( CLEAR ?auto_2708 ) ( not ( = ?auto_2708 ?auto_2716 ) ) ( not ( = ?auto_2709 ?auto_2716 ) ) ( not ( = ?auto_2707 ?auto_2716 ) ) ( not ( = ?auto_2715 ?auto_2716 ) ) ( TRUCK-AT ?auto_2718 ?auto_2710 ) ( SURFACE-AT ?auto_2711 ?auto_2710 ) ( CLEAR ?auto_2711 ) ( IS-CRATE ?auto_2707 ) ( not ( = ?auto_2711 ?auto_2707 ) ) ( not ( = ?auto_2708 ?auto_2711 ) ) ( not ( = ?auto_2709 ?auto_2711 ) ) ( not ( = ?auto_2715 ?auto_2711 ) ) ( not ( = ?auto_2716 ?auto_2711 ) ) ( AVAILABLE ?auto_2714 ) ( IN ?auto_2707 ?auto_2718 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2708 ?auto_2709 )
      ( MAKE-2CRATE-VERIFY ?auto_2707 ?auto_2708 ?auto_2709 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2720 - SURFACE
      ?auto_2721 - SURFACE
      ?auto_2722 - SURFACE
      ?auto_2723 - SURFACE
    )
    :vars
    (
      ?auto_2731 - HOIST
      ?auto_2725 - PLACE
      ?auto_2732 - PLACE
      ?auto_2728 - HOIST
      ?auto_2727 - SURFACE
      ?auto_2724 - PLACE
      ?auto_2730 - HOIST
      ?auto_2726 - SURFACE
      ?auto_2729 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2731 ?auto_2725 ) ( IS-CRATE ?auto_2723 ) ( not ( = ?auto_2722 ?auto_2723 ) ) ( not ( = ?auto_2721 ?auto_2722 ) ) ( not ( = ?auto_2721 ?auto_2723 ) ) ( not ( = ?auto_2732 ?auto_2725 ) ) ( HOIST-AT ?auto_2728 ?auto_2732 ) ( not ( = ?auto_2731 ?auto_2728 ) ) ( AVAILABLE ?auto_2728 ) ( SURFACE-AT ?auto_2723 ?auto_2732 ) ( ON ?auto_2723 ?auto_2727 ) ( CLEAR ?auto_2723 ) ( not ( = ?auto_2722 ?auto_2727 ) ) ( not ( = ?auto_2723 ?auto_2727 ) ) ( not ( = ?auto_2721 ?auto_2727 ) ) ( IS-CRATE ?auto_2722 ) ( not ( = ?auto_2724 ?auto_2725 ) ) ( not ( = ?auto_2732 ?auto_2724 ) ) ( HOIST-AT ?auto_2730 ?auto_2724 ) ( not ( = ?auto_2731 ?auto_2730 ) ) ( not ( = ?auto_2728 ?auto_2730 ) ) ( AVAILABLE ?auto_2730 ) ( SURFACE-AT ?auto_2722 ?auto_2724 ) ( ON ?auto_2722 ?auto_2726 ) ( CLEAR ?auto_2722 ) ( not ( = ?auto_2722 ?auto_2726 ) ) ( not ( = ?auto_2723 ?auto_2726 ) ) ( not ( = ?auto_2721 ?auto_2726 ) ) ( not ( = ?auto_2727 ?auto_2726 ) ) ( TRUCK-AT ?auto_2729 ?auto_2725 ) ( SURFACE-AT ?auto_2720 ?auto_2725 ) ( CLEAR ?auto_2720 ) ( IS-CRATE ?auto_2721 ) ( not ( = ?auto_2720 ?auto_2721 ) ) ( not ( = ?auto_2722 ?auto_2720 ) ) ( not ( = ?auto_2723 ?auto_2720 ) ) ( not ( = ?auto_2727 ?auto_2720 ) ) ( not ( = ?auto_2726 ?auto_2720 ) ) ( AVAILABLE ?auto_2731 ) ( IN ?auto_2721 ?auto_2729 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2721 ?auto_2722 ?auto_2723 )
      ( MAKE-3CRATE-VERIFY ?auto_2720 ?auto_2721 ?auto_2722 ?auto_2723 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2733 - SURFACE
      ?auto_2734 - SURFACE
    )
    :vars
    (
      ?auto_2744 - HOIST
      ?auto_2736 - PLACE
      ?auto_2743 - SURFACE
      ?auto_2745 - PLACE
      ?auto_2740 - HOIST
      ?auto_2738 - SURFACE
      ?auto_2735 - PLACE
      ?auto_2742 - HOIST
      ?auto_2737 - SURFACE
      ?auto_2739 - SURFACE
      ?auto_2741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2744 ?auto_2736 ) ( IS-CRATE ?auto_2734 ) ( not ( = ?auto_2733 ?auto_2734 ) ) ( not ( = ?auto_2743 ?auto_2733 ) ) ( not ( = ?auto_2743 ?auto_2734 ) ) ( not ( = ?auto_2745 ?auto_2736 ) ) ( HOIST-AT ?auto_2740 ?auto_2745 ) ( not ( = ?auto_2744 ?auto_2740 ) ) ( AVAILABLE ?auto_2740 ) ( SURFACE-AT ?auto_2734 ?auto_2745 ) ( ON ?auto_2734 ?auto_2738 ) ( CLEAR ?auto_2734 ) ( not ( = ?auto_2733 ?auto_2738 ) ) ( not ( = ?auto_2734 ?auto_2738 ) ) ( not ( = ?auto_2743 ?auto_2738 ) ) ( IS-CRATE ?auto_2733 ) ( not ( = ?auto_2735 ?auto_2736 ) ) ( not ( = ?auto_2745 ?auto_2735 ) ) ( HOIST-AT ?auto_2742 ?auto_2735 ) ( not ( = ?auto_2744 ?auto_2742 ) ) ( not ( = ?auto_2740 ?auto_2742 ) ) ( AVAILABLE ?auto_2742 ) ( SURFACE-AT ?auto_2733 ?auto_2735 ) ( ON ?auto_2733 ?auto_2737 ) ( CLEAR ?auto_2733 ) ( not ( = ?auto_2733 ?auto_2737 ) ) ( not ( = ?auto_2734 ?auto_2737 ) ) ( not ( = ?auto_2743 ?auto_2737 ) ) ( not ( = ?auto_2738 ?auto_2737 ) ) ( SURFACE-AT ?auto_2739 ?auto_2736 ) ( CLEAR ?auto_2739 ) ( IS-CRATE ?auto_2743 ) ( not ( = ?auto_2739 ?auto_2743 ) ) ( not ( = ?auto_2733 ?auto_2739 ) ) ( not ( = ?auto_2734 ?auto_2739 ) ) ( not ( = ?auto_2738 ?auto_2739 ) ) ( not ( = ?auto_2737 ?auto_2739 ) ) ( AVAILABLE ?auto_2744 ) ( IN ?auto_2743 ?auto_2741 ) ( TRUCK-AT ?auto_2741 ?auto_2745 ) )
    :subtasks
    ( ( !DRIVE ?auto_2741 ?auto_2745 ?auto_2736 )
      ( MAKE-2CRATE ?auto_2743 ?auto_2733 ?auto_2734 )
      ( MAKE-1CRATE-VERIFY ?auto_2733 ?auto_2734 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2746 - SURFACE
      ?auto_2747 - SURFACE
      ?auto_2748 - SURFACE
    )
    :vars
    (
      ?auto_2755 - HOIST
      ?auto_2754 - PLACE
      ?auto_2750 - PLACE
      ?auto_2749 - HOIST
      ?auto_2752 - SURFACE
      ?auto_2751 - PLACE
      ?auto_2758 - HOIST
      ?auto_2757 - SURFACE
      ?auto_2756 - SURFACE
      ?auto_2753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2755 ?auto_2754 ) ( IS-CRATE ?auto_2748 ) ( not ( = ?auto_2747 ?auto_2748 ) ) ( not ( = ?auto_2746 ?auto_2747 ) ) ( not ( = ?auto_2746 ?auto_2748 ) ) ( not ( = ?auto_2750 ?auto_2754 ) ) ( HOIST-AT ?auto_2749 ?auto_2750 ) ( not ( = ?auto_2755 ?auto_2749 ) ) ( AVAILABLE ?auto_2749 ) ( SURFACE-AT ?auto_2748 ?auto_2750 ) ( ON ?auto_2748 ?auto_2752 ) ( CLEAR ?auto_2748 ) ( not ( = ?auto_2747 ?auto_2752 ) ) ( not ( = ?auto_2748 ?auto_2752 ) ) ( not ( = ?auto_2746 ?auto_2752 ) ) ( IS-CRATE ?auto_2747 ) ( not ( = ?auto_2751 ?auto_2754 ) ) ( not ( = ?auto_2750 ?auto_2751 ) ) ( HOIST-AT ?auto_2758 ?auto_2751 ) ( not ( = ?auto_2755 ?auto_2758 ) ) ( not ( = ?auto_2749 ?auto_2758 ) ) ( AVAILABLE ?auto_2758 ) ( SURFACE-AT ?auto_2747 ?auto_2751 ) ( ON ?auto_2747 ?auto_2757 ) ( CLEAR ?auto_2747 ) ( not ( = ?auto_2747 ?auto_2757 ) ) ( not ( = ?auto_2748 ?auto_2757 ) ) ( not ( = ?auto_2746 ?auto_2757 ) ) ( not ( = ?auto_2752 ?auto_2757 ) ) ( SURFACE-AT ?auto_2756 ?auto_2754 ) ( CLEAR ?auto_2756 ) ( IS-CRATE ?auto_2746 ) ( not ( = ?auto_2756 ?auto_2746 ) ) ( not ( = ?auto_2747 ?auto_2756 ) ) ( not ( = ?auto_2748 ?auto_2756 ) ) ( not ( = ?auto_2752 ?auto_2756 ) ) ( not ( = ?auto_2757 ?auto_2756 ) ) ( AVAILABLE ?auto_2755 ) ( IN ?auto_2746 ?auto_2753 ) ( TRUCK-AT ?auto_2753 ?auto_2750 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2747 ?auto_2748 )
      ( MAKE-2CRATE-VERIFY ?auto_2746 ?auto_2747 ?auto_2748 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2759 - SURFACE
      ?auto_2760 - SURFACE
      ?auto_2761 - SURFACE
      ?auto_2762 - SURFACE
    )
    :vars
    (
      ?auto_2763 - HOIST
      ?auto_2771 - PLACE
      ?auto_2769 - PLACE
      ?auto_2766 - HOIST
      ?auto_2770 - SURFACE
      ?auto_2765 - PLACE
      ?auto_2767 - HOIST
      ?auto_2764 - SURFACE
      ?auto_2768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2763 ?auto_2771 ) ( IS-CRATE ?auto_2762 ) ( not ( = ?auto_2761 ?auto_2762 ) ) ( not ( = ?auto_2760 ?auto_2761 ) ) ( not ( = ?auto_2760 ?auto_2762 ) ) ( not ( = ?auto_2769 ?auto_2771 ) ) ( HOIST-AT ?auto_2766 ?auto_2769 ) ( not ( = ?auto_2763 ?auto_2766 ) ) ( AVAILABLE ?auto_2766 ) ( SURFACE-AT ?auto_2762 ?auto_2769 ) ( ON ?auto_2762 ?auto_2770 ) ( CLEAR ?auto_2762 ) ( not ( = ?auto_2761 ?auto_2770 ) ) ( not ( = ?auto_2762 ?auto_2770 ) ) ( not ( = ?auto_2760 ?auto_2770 ) ) ( IS-CRATE ?auto_2761 ) ( not ( = ?auto_2765 ?auto_2771 ) ) ( not ( = ?auto_2769 ?auto_2765 ) ) ( HOIST-AT ?auto_2767 ?auto_2765 ) ( not ( = ?auto_2763 ?auto_2767 ) ) ( not ( = ?auto_2766 ?auto_2767 ) ) ( AVAILABLE ?auto_2767 ) ( SURFACE-AT ?auto_2761 ?auto_2765 ) ( ON ?auto_2761 ?auto_2764 ) ( CLEAR ?auto_2761 ) ( not ( = ?auto_2761 ?auto_2764 ) ) ( not ( = ?auto_2762 ?auto_2764 ) ) ( not ( = ?auto_2760 ?auto_2764 ) ) ( not ( = ?auto_2770 ?auto_2764 ) ) ( SURFACE-AT ?auto_2759 ?auto_2771 ) ( CLEAR ?auto_2759 ) ( IS-CRATE ?auto_2760 ) ( not ( = ?auto_2759 ?auto_2760 ) ) ( not ( = ?auto_2761 ?auto_2759 ) ) ( not ( = ?auto_2762 ?auto_2759 ) ) ( not ( = ?auto_2770 ?auto_2759 ) ) ( not ( = ?auto_2764 ?auto_2759 ) ) ( AVAILABLE ?auto_2763 ) ( IN ?auto_2760 ?auto_2768 ) ( TRUCK-AT ?auto_2768 ?auto_2769 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2760 ?auto_2761 ?auto_2762 )
      ( MAKE-3CRATE-VERIFY ?auto_2759 ?auto_2760 ?auto_2761 ?auto_2762 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2772 - SURFACE
      ?auto_2773 - SURFACE
    )
    :vars
    (
      ?auto_2774 - HOIST
      ?auto_2783 - PLACE
      ?auto_2784 - SURFACE
      ?auto_2781 - PLACE
      ?auto_2777 - HOIST
      ?auto_2782 - SURFACE
      ?auto_2776 - PLACE
      ?auto_2778 - HOIST
      ?auto_2775 - SURFACE
      ?auto_2780 - SURFACE
      ?auto_2779 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2774 ?auto_2783 ) ( IS-CRATE ?auto_2773 ) ( not ( = ?auto_2772 ?auto_2773 ) ) ( not ( = ?auto_2784 ?auto_2772 ) ) ( not ( = ?auto_2784 ?auto_2773 ) ) ( not ( = ?auto_2781 ?auto_2783 ) ) ( HOIST-AT ?auto_2777 ?auto_2781 ) ( not ( = ?auto_2774 ?auto_2777 ) ) ( SURFACE-AT ?auto_2773 ?auto_2781 ) ( ON ?auto_2773 ?auto_2782 ) ( CLEAR ?auto_2773 ) ( not ( = ?auto_2772 ?auto_2782 ) ) ( not ( = ?auto_2773 ?auto_2782 ) ) ( not ( = ?auto_2784 ?auto_2782 ) ) ( IS-CRATE ?auto_2772 ) ( not ( = ?auto_2776 ?auto_2783 ) ) ( not ( = ?auto_2781 ?auto_2776 ) ) ( HOIST-AT ?auto_2778 ?auto_2776 ) ( not ( = ?auto_2774 ?auto_2778 ) ) ( not ( = ?auto_2777 ?auto_2778 ) ) ( AVAILABLE ?auto_2778 ) ( SURFACE-AT ?auto_2772 ?auto_2776 ) ( ON ?auto_2772 ?auto_2775 ) ( CLEAR ?auto_2772 ) ( not ( = ?auto_2772 ?auto_2775 ) ) ( not ( = ?auto_2773 ?auto_2775 ) ) ( not ( = ?auto_2784 ?auto_2775 ) ) ( not ( = ?auto_2782 ?auto_2775 ) ) ( SURFACE-AT ?auto_2780 ?auto_2783 ) ( CLEAR ?auto_2780 ) ( IS-CRATE ?auto_2784 ) ( not ( = ?auto_2780 ?auto_2784 ) ) ( not ( = ?auto_2772 ?auto_2780 ) ) ( not ( = ?auto_2773 ?auto_2780 ) ) ( not ( = ?auto_2782 ?auto_2780 ) ) ( not ( = ?auto_2775 ?auto_2780 ) ) ( AVAILABLE ?auto_2774 ) ( TRUCK-AT ?auto_2779 ?auto_2781 ) ( LIFTING ?auto_2777 ?auto_2784 ) )
    :subtasks
    ( ( !LOAD ?auto_2777 ?auto_2784 ?auto_2779 ?auto_2781 )
      ( MAKE-2CRATE ?auto_2784 ?auto_2772 ?auto_2773 )
      ( MAKE-1CRATE-VERIFY ?auto_2772 ?auto_2773 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2785 - SURFACE
      ?auto_2786 - SURFACE
      ?auto_2787 - SURFACE
    )
    :vars
    (
      ?auto_2797 - HOIST
      ?auto_2796 - PLACE
      ?auto_2791 - PLACE
      ?auto_2795 - HOIST
      ?auto_2789 - SURFACE
      ?auto_2793 - PLACE
      ?auto_2794 - HOIST
      ?auto_2792 - SURFACE
      ?auto_2790 - SURFACE
      ?auto_2788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2797 ?auto_2796 ) ( IS-CRATE ?auto_2787 ) ( not ( = ?auto_2786 ?auto_2787 ) ) ( not ( = ?auto_2785 ?auto_2786 ) ) ( not ( = ?auto_2785 ?auto_2787 ) ) ( not ( = ?auto_2791 ?auto_2796 ) ) ( HOIST-AT ?auto_2795 ?auto_2791 ) ( not ( = ?auto_2797 ?auto_2795 ) ) ( SURFACE-AT ?auto_2787 ?auto_2791 ) ( ON ?auto_2787 ?auto_2789 ) ( CLEAR ?auto_2787 ) ( not ( = ?auto_2786 ?auto_2789 ) ) ( not ( = ?auto_2787 ?auto_2789 ) ) ( not ( = ?auto_2785 ?auto_2789 ) ) ( IS-CRATE ?auto_2786 ) ( not ( = ?auto_2793 ?auto_2796 ) ) ( not ( = ?auto_2791 ?auto_2793 ) ) ( HOIST-AT ?auto_2794 ?auto_2793 ) ( not ( = ?auto_2797 ?auto_2794 ) ) ( not ( = ?auto_2795 ?auto_2794 ) ) ( AVAILABLE ?auto_2794 ) ( SURFACE-AT ?auto_2786 ?auto_2793 ) ( ON ?auto_2786 ?auto_2792 ) ( CLEAR ?auto_2786 ) ( not ( = ?auto_2786 ?auto_2792 ) ) ( not ( = ?auto_2787 ?auto_2792 ) ) ( not ( = ?auto_2785 ?auto_2792 ) ) ( not ( = ?auto_2789 ?auto_2792 ) ) ( SURFACE-AT ?auto_2790 ?auto_2796 ) ( CLEAR ?auto_2790 ) ( IS-CRATE ?auto_2785 ) ( not ( = ?auto_2790 ?auto_2785 ) ) ( not ( = ?auto_2786 ?auto_2790 ) ) ( not ( = ?auto_2787 ?auto_2790 ) ) ( not ( = ?auto_2789 ?auto_2790 ) ) ( not ( = ?auto_2792 ?auto_2790 ) ) ( AVAILABLE ?auto_2797 ) ( TRUCK-AT ?auto_2788 ?auto_2791 ) ( LIFTING ?auto_2795 ?auto_2785 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2786 ?auto_2787 )
      ( MAKE-2CRATE-VERIFY ?auto_2785 ?auto_2786 ?auto_2787 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2798 - SURFACE
      ?auto_2799 - SURFACE
      ?auto_2800 - SURFACE
      ?auto_2801 - SURFACE
    )
    :vars
    (
      ?auto_2809 - HOIST
      ?auto_2804 - PLACE
      ?auto_2807 - PLACE
      ?auto_2802 - HOIST
      ?auto_2810 - SURFACE
      ?auto_2805 - PLACE
      ?auto_2803 - HOIST
      ?auto_2806 - SURFACE
      ?auto_2808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2809 ?auto_2804 ) ( IS-CRATE ?auto_2801 ) ( not ( = ?auto_2800 ?auto_2801 ) ) ( not ( = ?auto_2799 ?auto_2800 ) ) ( not ( = ?auto_2799 ?auto_2801 ) ) ( not ( = ?auto_2807 ?auto_2804 ) ) ( HOIST-AT ?auto_2802 ?auto_2807 ) ( not ( = ?auto_2809 ?auto_2802 ) ) ( SURFACE-AT ?auto_2801 ?auto_2807 ) ( ON ?auto_2801 ?auto_2810 ) ( CLEAR ?auto_2801 ) ( not ( = ?auto_2800 ?auto_2810 ) ) ( not ( = ?auto_2801 ?auto_2810 ) ) ( not ( = ?auto_2799 ?auto_2810 ) ) ( IS-CRATE ?auto_2800 ) ( not ( = ?auto_2805 ?auto_2804 ) ) ( not ( = ?auto_2807 ?auto_2805 ) ) ( HOIST-AT ?auto_2803 ?auto_2805 ) ( not ( = ?auto_2809 ?auto_2803 ) ) ( not ( = ?auto_2802 ?auto_2803 ) ) ( AVAILABLE ?auto_2803 ) ( SURFACE-AT ?auto_2800 ?auto_2805 ) ( ON ?auto_2800 ?auto_2806 ) ( CLEAR ?auto_2800 ) ( not ( = ?auto_2800 ?auto_2806 ) ) ( not ( = ?auto_2801 ?auto_2806 ) ) ( not ( = ?auto_2799 ?auto_2806 ) ) ( not ( = ?auto_2810 ?auto_2806 ) ) ( SURFACE-AT ?auto_2798 ?auto_2804 ) ( CLEAR ?auto_2798 ) ( IS-CRATE ?auto_2799 ) ( not ( = ?auto_2798 ?auto_2799 ) ) ( not ( = ?auto_2800 ?auto_2798 ) ) ( not ( = ?auto_2801 ?auto_2798 ) ) ( not ( = ?auto_2810 ?auto_2798 ) ) ( not ( = ?auto_2806 ?auto_2798 ) ) ( AVAILABLE ?auto_2809 ) ( TRUCK-AT ?auto_2808 ?auto_2807 ) ( LIFTING ?auto_2802 ?auto_2799 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2799 ?auto_2800 ?auto_2801 )
      ( MAKE-3CRATE-VERIFY ?auto_2798 ?auto_2799 ?auto_2800 ?auto_2801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2811 - SURFACE
      ?auto_2812 - SURFACE
    )
    :vars
    (
      ?auto_2820 - HOIST
      ?auto_2815 - PLACE
      ?auto_2823 - SURFACE
      ?auto_2818 - PLACE
      ?auto_2813 - HOIST
      ?auto_2822 - SURFACE
      ?auto_2816 - PLACE
      ?auto_2814 - HOIST
      ?auto_2817 - SURFACE
      ?auto_2821 - SURFACE
      ?auto_2819 - TRUCK
      ?auto_2824 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2820 ?auto_2815 ) ( IS-CRATE ?auto_2812 ) ( not ( = ?auto_2811 ?auto_2812 ) ) ( not ( = ?auto_2823 ?auto_2811 ) ) ( not ( = ?auto_2823 ?auto_2812 ) ) ( not ( = ?auto_2818 ?auto_2815 ) ) ( HOIST-AT ?auto_2813 ?auto_2818 ) ( not ( = ?auto_2820 ?auto_2813 ) ) ( SURFACE-AT ?auto_2812 ?auto_2818 ) ( ON ?auto_2812 ?auto_2822 ) ( CLEAR ?auto_2812 ) ( not ( = ?auto_2811 ?auto_2822 ) ) ( not ( = ?auto_2812 ?auto_2822 ) ) ( not ( = ?auto_2823 ?auto_2822 ) ) ( IS-CRATE ?auto_2811 ) ( not ( = ?auto_2816 ?auto_2815 ) ) ( not ( = ?auto_2818 ?auto_2816 ) ) ( HOIST-AT ?auto_2814 ?auto_2816 ) ( not ( = ?auto_2820 ?auto_2814 ) ) ( not ( = ?auto_2813 ?auto_2814 ) ) ( AVAILABLE ?auto_2814 ) ( SURFACE-AT ?auto_2811 ?auto_2816 ) ( ON ?auto_2811 ?auto_2817 ) ( CLEAR ?auto_2811 ) ( not ( = ?auto_2811 ?auto_2817 ) ) ( not ( = ?auto_2812 ?auto_2817 ) ) ( not ( = ?auto_2823 ?auto_2817 ) ) ( not ( = ?auto_2822 ?auto_2817 ) ) ( SURFACE-AT ?auto_2821 ?auto_2815 ) ( CLEAR ?auto_2821 ) ( IS-CRATE ?auto_2823 ) ( not ( = ?auto_2821 ?auto_2823 ) ) ( not ( = ?auto_2811 ?auto_2821 ) ) ( not ( = ?auto_2812 ?auto_2821 ) ) ( not ( = ?auto_2822 ?auto_2821 ) ) ( not ( = ?auto_2817 ?auto_2821 ) ) ( AVAILABLE ?auto_2820 ) ( TRUCK-AT ?auto_2819 ?auto_2818 ) ( AVAILABLE ?auto_2813 ) ( SURFACE-AT ?auto_2823 ?auto_2818 ) ( ON ?auto_2823 ?auto_2824 ) ( CLEAR ?auto_2823 ) ( not ( = ?auto_2811 ?auto_2824 ) ) ( not ( = ?auto_2812 ?auto_2824 ) ) ( not ( = ?auto_2823 ?auto_2824 ) ) ( not ( = ?auto_2822 ?auto_2824 ) ) ( not ( = ?auto_2817 ?auto_2824 ) ) ( not ( = ?auto_2821 ?auto_2824 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2813 ?auto_2823 ?auto_2824 ?auto_2818 )
      ( MAKE-2CRATE ?auto_2823 ?auto_2811 ?auto_2812 )
      ( MAKE-1CRATE-VERIFY ?auto_2811 ?auto_2812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2825 - SURFACE
      ?auto_2826 - SURFACE
      ?auto_2827 - SURFACE
    )
    :vars
    (
      ?auto_2834 - HOIST
      ?auto_2831 - PLACE
      ?auto_2828 - PLACE
      ?auto_2833 - HOIST
      ?auto_2829 - SURFACE
      ?auto_2830 - PLACE
      ?auto_2837 - HOIST
      ?auto_2832 - SURFACE
      ?auto_2838 - SURFACE
      ?auto_2835 - TRUCK
      ?auto_2836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2834 ?auto_2831 ) ( IS-CRATE ?auto_2827 ) ( not ( = ?auto_2826 ?auto_2827 ) ) ( not ( = ?auto_2825 ?auto_2826 ) ) ( not ( = ?auto_2825 ?auto_2827 ) ) ( not ( = ?auto_2828 ?auto_2831 ) ) ( HOIST-AT ?auto_2833 ?auto_2828 ) ( not ( = ?auto_2834 ?auto_2833 ) ) ( SURFACE-AT ?auto_2827 ?auto_2828 ) ( ON ?auto_2827 ?auto_2829 ) ( CLEAR ?auto_2827 ) ( not ( = ?auto_2826 ?auto_2829 ) ) ( not ( = ?auto_2827 ?auto_2829 ) ) ( not ( = ?auto_2825 ?auto_2829 ) ) ( IS-CRATE ?auto_2826 ) ( not ( = ?auto_2830 ?auto_2831 ) ) ( not ( = ?auto_2828 ?auto_2830 ) ) ( HOIST-AT ?auto_2837 ?auto_2830 ) ( not ( = ?auto_2834 ?auto_2837 ) ) ( not ( = ?auto_2833 ?auto_2837 ) ) ( AVAILABLE ?auto_2837 ) ( SURFACE-AT ?auto_2826 ?auto_2830 ) ( ON ?auto_2826 ?auto_2832 ) ( CLEAR ?auto_2826 ) ( not ( = ?auto_2826 ?auto_2832 ) ) ( not ( = ?auto_2827 ?auto_2832 ) ) ( not ( = ?auto_2825 ?auto_2832 ) ) ( not ( = ?auto_2829 ?auto_2832 ) ) ( SURFACE-AT ?auto_2838 ?auto_2831 ) ( CLEAR ?auto_2838 ) ( IS-CRATE ?auto_2825 ) ( not ( = ?auto_2838 ?auto_2825 ) ) ( not ( = ?auto_2826 ?auto_2838 ) ) ( not ( = ?auto_2827 ?auto_2838 ) ) ( not ( = ?auto_2829 ?auto_2838 ) ) ( not ( = ?auto_2832 ?auto_2838 ) ) ( AVAILABLE ?auto_2834 ) ( TRUCK-AT ?auto_2835 ?auto_2828 ) ( AVAILABLE ?auto_2833 ) ( SURFACE-AT ?auto_2825 ?auto_2828 ) ( ON ?auto_2825 ?auto_2836 ) ( CLEAR ?auto_2825 ) ( not ( = ?auto_2826 ?auto_2836 ) ) ( not ( = ?auto_2827 ?auto_2836 ) ) ( not ( = ?auto_2825 ?auto_2836 ) ) ( not ( = ?auto_2829 ?auto_2836 ) ) ( not ( = ?auto_2832 ?auto_2836 ) ) ( not ( = ?auto_2838 ?auto_2836 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2826 ?auto_2827 )
      ( MAKE-2CRATE-VERIFY ?auto_2825 ?auto_2826 ?auto_2827 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2839 - SURFACE
      ?auto_2840 - SURFACE
      ?auto_2841 - SURFACE
      ?auto_2842 - SURFACE
    )
    :vars
    (
      ?auto_2852 - HOIST
      ?auto_2850 - PLACE
      ?auto_2844 - PLACE
      ?auto_2851 - HOIST
      ?auto_2848 - SURFACE
      ?auto_2849 - PLACE
      ?auto_2846 - HOIST
      ?auto_2847 - SURFACE
      ?auto_2845 - TRUCK
      ?auto_2843 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2852 ?auto_2850 ) ( IS-CRATE ?auto_2842 ) ( not ( = ?auto_2841 ?auto_2842 ) ) ( not ( = ?auto_2840 ?auto_2841 ) ) ( not ( = ?auto_2840 ?auto_2842 ) ) ( not ( = ?auto_2844 ?auto_2850 ) ) ( HOIST-AT ?auto_2851 ?auto_2844 ) ( not ( = ?auto_2852 ?auto_2851 ) ) ( SURFACE-AT ?auto_2842 ?auto_2844 ) ( ON ?auto_2842 ?auto_2848 ) ( CLEAR ?auto_2842 ) ( not ( = ?auto_2841 ?auto_2848 ) ) ( not ( = ?auto_2842 ?auto_2848 ) ) ( not ( = ?auto_2840 ?auto_2848 ) ) ( IS-CRATE ?auto_2841 ) ( not ( = ?auto_2849 ?auto_2850 ) ) ( not ( = ?auto_2844 ?auto_2849 ) ) ( HOIST-AT ?auto_2846 ?auto_2849 ) ( not ( = ?auto_2852 ?auto_2846 ) ) ( not ( = ?auto_2851 ?auto_2846 ) ) ( AVAILABLE ?auto_2846 ) ( SURFACE-AT ?auto_2841 ?auto_2849 ) ( ON ?auto_2841 ?auto_2847 ) ( CLEAR ?auto_2841 ) ( not ( = ?auto_2841 ?auto_2847 ) ) ( not ( = ?auto_2842 ?auto_2847 ) ) ( not ( = ?auto_2840 ?auto_2847 ) ) ( not ( = ?auto_2848 ?auto_2847 ) ) ( SURFACE-AT ?auto_2839 ?auto_2850 ) ( CLEAR ?auto_2839 ) ( IS-CRATE ?auto_2840 ) ( not ( = ?auto_2839 ?auto_2840 ) ) ( not ( = ?auto_2841 ?auto_2839 ) ) ( not ( = ?auto_2842 ?auto_2839 ) ) ( not ( = ?auto_2848 ?auto_2839 ) ) ( not ( = ?auto_2847 ?auto_2839 ) ) ( AVAILABLE ?auto_2852 ) ( TRUCK-AT ?auto_2845 ?auto_2844 ) ( AVAILABLE ?auto_2851 ) ( SURFACE-AT ?auto_2840 ?auto_2844 ) ( ON ?auto_2840 ?auto_2843 ) ( CLEAR ?auto_2840 ) ( not ( = ?auto_2841 ?auto_2843 ) ) ( not ( = ?auto_2842 ?auto_2843 ) ) ( not ( = ?auto_2840 ?auto_2843 ) ) ( not ( = ?auto_2848 ?auto_2843 ) ) ( not ( = ?auto_2847 ?auto_2843 ) ) ( not ( = ?auto_2839 ?auto_2843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2840 ?auto_2841 ?auto_2842 )
      ( MAKE-3CRATE-VERIFY ?auto_2839 ?auto_2840 ?auto_2841 ?auto_2842 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2853 - SURFACE
      ?auto_2854 - SURFACE
    )
    :vars
    (
      ?auto_2865 - HOIST
      ?auto_2863 - PLACE
      ?auto_2866 - SURFACE
      ?auto_2857 - PLACE
      ?auto_2864 - HOIST
      ?auto_2861 - SURFACE
      ?auto_2862 - PLACE
      ?auto_2859 - HOIST
      ?auto_2860 - SURFACE
      ?auto_2855 - SURFACE
      ?auto_2856 - SURFACE
      ?auto_2858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2865 ?auto_2863 ) ( IS-CRATE ?auto_2854 ) ( not ( = ?auto_2853 ?auto_2854 ) ) ( not ( = ?auto_2866 ?auto_2853 ) ) ( not ( = ?auto_2866 ?auto_2854 ) ) ( not ( = ?auto_2857 ?auto_2863 ) ) ( HOIST-AT ?auto_2864 ?auto_2857 ) ( not ( = ?auto_2865 ?auto_2864 ) ) ( SURFACE-AT ?auto_2854 ?auto_2857 ) ( ON ?auto_2854 ?auto_2861 ) ( CLEAR ?auto_2854 ) ( not ( = ?auto_2853 ?auto_2861 ) ) ( not ( = ?auto_2854 ?auto_2861 ) ) ( not ( = ?auto_2866 ?auto_2861 ) ) ( IS-CRATE ?auto_2853 ) ( not ( = ?auto_2862 ?auto_2863 ) ) ( not ( = ?auto_2857 ?auto_2862 ) ) ( HOIST-AT ?auto_2859 ?auto_2862 ) ( not ( = ?auto_2865 ?auto_2859 ) ) ( not ( = ?auto_2864 ?auto_2859 ) ) ( AVAILABLE ?auto_2859 ) ( SURFACE-AT ?auto_2853 ?auto_2862 ) ( ON ?auto_2853 ?auto_2860 ) ( CLEAR ?auto_2853 ) ( not ( = ?auto_2853 ?auto_2860 ) ) ( not ( = ?auto_2854 ?auto_2860 ) ) ( not ( = ?auto_2866 ?auto_2860 ) ) ( not ( = ?auto_2861 ?auto_2860 ) ) ( SURFACE-AT ?auto_2855 ?auto_2863 ) ( CLEAR ?auto_2855 ) ( IS-CRATE ?auto_2866 ) ( not ( = ?auto_2855 ?auto_2866 ) ) ( not ( = ?auto_2853 ?auto_2855 ) ) ( not ( = ?auto_2854 ?auto_2855 ) ) ( not ( = ?auto_2861 ?auto_2855 ) ) ( not ( = ?auto_2860 ?auto_2855 ) ) ( AVAILABLE ?auto_2865 ) ( AVAILABLE ?auto_2864 ) ( SURFACE-AT ?auto_2866 ?auto_2857 ) ( ON ?auto_2866 ?auto_2856 ) ( CLEAR ?auto_2866 ) ( not ( = ?auto_2853 ?auto_2856 ) ) ( not ( = ?auto_2854 ?auto_2856 ) ) ( not ( = ?auto_2866 ?auto_2856 ) ) ( not ( = ?auto_2861 ?auto_2856 ) ) ( not ( = ?auto_2860 ?auto_2856 ) ) ( not ( = ?auto_2855 ?auto_2856 ) ) ( TRUCK-AT ?auto_2858 ?auto_2863 ) )
    :subtasks
    ( ( !DRIVE ?auto_2858 ?auto_2863 ?auto_2857 )
      ( MAKE-2CRATE ?auto_2866 ?auto_2853 ?auto_2854 )
      ( MAKE-1CRATE-VERIFY ?auto_2853 ?auto_2854 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2867 - SURFACE
      ?auto_2868 - SURFACE
      ?auto_2869 - SURFACE
    )
    :vars
    (
      ?auto_2879 - HOIST
      ?auto_2870 - PLACE
      ?auto_2878 - PLACE
      ?auto_2875 - HOIST
      ?auto_2871 - SURFACE
      ?auto_2877 - PLACE
      ?auto_2872 - HOIST
      ?auto_2873 - SURFACE
      ?auto_2880 - SURFACE
      ?auto_2874 - SURFACE
      ?auto_2876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2879 ?auto_2870 ) ( IS-CRATE ?auto_2869 ) ( not ( = ?auto_2868 ?auto_2869 ) ) ( not ( = ?auto_2867 ?auto_2868 ) ) ( not ( = ?auto_2867 ?auto_2869 ) ) ( not ( = ?auto_2878 ?auto_2870 ) ) ( HOIST-AT ?auto_2875 ?auto_2878 ) ( not ( = ?auto_2879 ?auto_2875 ) ) ( SURFACE-AT ?auto_2869 ?auto_2878 ) ( ON ?auto_2869 ?auto_2871 ) ( CLEAR ?auto_2869 ) ( not ( = ?auto_2868 ?auto_2871 ) ) ( not ( = ?auto_2869 ?auto_2871 ) ) ( not ( = ?auto_2867 ?auto_2871 ) ) ( IS-CRATE ?auto_2868 ) ( not ( = ?auto_2877 ?auto_2870 ) ) ( not ( = ?auto_2878 ?auto_2877 ) ) ( HOIST-AT ?auto_2872 ?auto_2877 ) ( not ( = ?auto_2879 ?auto_2872 ) ) ( not ( = ?auto_2875 ?auto_2872 ) ) ( AVAILABLE ?auto_2872 ) ( SURFACE-AT ?auto_2868 ?auto_2877 ) ( ON ?auto_2868 ?auto_2873 ) ( CLEAR ?auto_2868 ) ( not ( = ?auto_2868 ?auto_2873 ) ) ( not ( = ?auto_2869 ?auto_2873 ) ) ( not ( = ?auto_2867 ?auto_2873 ) ) ( not ( = ?auto_2871 ?auto_2873 ) ) ( SURFACE-AT ?auto_2880 ?auto_2870 ) ( CLEAR ?auto_2880 ) ( IS-CRATE ?auto_2867 ) ( not ( = ?auto_2880 ?auto_2867 ) ) ( not ( = ?auto_2868 ?auto_2880 ) ) ( not ( = ?auto_2869 ?auto_2880 ) ) ( not ( = ?auto_2871 ?auto_2880 ) ) ( not ( = ?auto_2873 ?auto_2880 ) ) ( AVAILABLE ?auto_2879 ) ( AVAILABLE ?auto_2875 ) ( SURFACE-AT ?auto_2867 ?auto_2878 ) ( ON ?auto_2867 ?auto_2874 ) ( CLEAR ?auto_2867 ) ( not ( = ?auto_2868 ?auto_2874 ) ) ( not ( = ?auto_2869 ?auto_2874 ) ) ( not ( = ?auto_2867 ?auto_2874 ) ) ( not ( = ?auto_2871 ?auto_2874 ) ) ( not ( = ?auto_2873 ?auto_2874 ) ) ( not ( = ?auto_2880 ?auto_2874 ) ) ( TRUCK-AT ?auto_2876 ?auto_2870 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2868 ?auto_2869 )
      ( MAKE-2CRATE-VERIFY ?auto_2867 ?auto_2868 ?auto_2869 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2881 - SURFACE
      ?auto_2882 - SURFACE
      ?auto_2883 - SURFACE
      ?auto_2884 - SURFACE
    )
    :vars
    (
      ?auto_2888 - HOIST
      ?auto_2894 - PLACE
      ?auto_2891 - PLACE
      ?auto_2885 - HOIST
      ?auto_2893 - SURFACE
      ?auto_2886 - PLACE
      ?auto_2887 - HOIST
      ?auto_2889 - SURFACE
      ?auto_2890 - SURFACE
      ?auto_2892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2888 ?auto_2894 ) ( IS-CRATE ?auto_2884 ) ( not ( = ?auto_2883 ?auto_2884 ) ) ( not ( = ?auto_2882 ?auto_2883 ) ) ( not ( = ?auto_2882 ?auto_2884 ) ) ( not ( = ?auto_2891 ?auto_2894 ) ) ( HOIST-AT ?auto_2885 ?auto_2891 ) ( not ( = ?auto_2888 ?auto_2885 ) ) ( SURFACE-AT ?auto_2884 ?auto_2891 ) ( ON ?auto_2884 ?auto_2893 ) ( CLEAR ?auto_2884 ) ( not ( = ?auto_2883 ?auto_2893 ) ) ( not ( = ?auto_2884 ?auto_2893 ) ) ( not ( = ?auto_2882 ?auto_2893 ) ) ( IS-CRATE ?auto_2883 ) ( not ( = ?auto_2886 ?auto_2894 ) ) ( not ( = ?auto_2891 ?auto_2886 ) ) ( HOIST-AT ?auto_2887 ?auto_2886 ) ( not ( = ?auto_2888 ?auto_2887 ) ) ( not ( = ?auto_2885 ?auto_2887 ) ) ( AVAILABLE ?auto_2887 ) ( SURFACE-AT ?auto_2883 ?auto_2886 ) ( ON ?auto_2883 ?auto_2889 ) ( CLEAR ?auto_2883 ) ( not ( = ?auto_2883 ?auto_2889 ) ) ( not ( = ?auto_2884 ?auto_2889 ) ) ( not ( = ?auto_2882 ?auto_2889 ) ) ( not ( = ?auto_2893 ?auto_2889 ) ) ( SURFACE-AT ?auto_2881 ?auto_2894 ) ( CLEAR ?auto_2881 ) ( IS-CRATE ?auto_2882 ) ( not ( = ?auto_2881 ?auto_2882 ) ) ( not ( = ?auto_2883 ?auto_2881 ) ) ( not ( = ?auto_2884 ?auto_2881 ) ) ( not ( = ?auto_2893 ?auto_2881 ) ) ( not ( = ?auto_2889 ?auto_2881 ) ) ( AVAILABLE ?auto_2888 ) ( AVAILABLE ?auto_2885 ) ( SURFACE-AT ?auto_2882 ?auto_2891 ) ( ON ?auto_2882 ?auto_2890 ) ( CLEAR ?auto_2882 ) ( not ( = ?auto_2883 ?auto_2890 ) ) ( not ( = ?auto_2884 ?auto_2890 ) ) ( not ( = ?auto_2882 ?auto_2890 ) ) ( not ( = ?auto_2893 ?auto_2890 ) ) ( not ( = ?auto_2889 ?auto_2890 ) ) ( not ( = ?auto_2881 ?auto_2890 ) ) ( TRUCK-AT ?auto_2892 ?auto_2894 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2882 ?auto_2883 ?auto_2884 )
      ( MAKE-3CRATE-VERIFY ?auto_2881 ?auto_2882 ?auto_2883 ?auto_2884 ) )
  )

)

