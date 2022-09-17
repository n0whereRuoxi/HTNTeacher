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
      ?auto_2112 - SURFACE
      ?auto_2113 - SURFACE
    )
    :vars
    (
      ?auto_2114 - HOIST
      ?auto_2115 - PLACE
      ?auto_2117 - PLACE
      ?auto_2118 - HOIST
      ?auto_2119 - SURFACE
      ?auto_2116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2114 ?auto_2115 ) ( SURFACE-AT ?auto_2113 ?auto_2115 ) ( CLEAR ?auto_2113 ) ( IS-CRATE ?auto_2112 ) ( AVAILABLE ?auto_2114 ) ( not ( = ?auto_2117 ?auto_2115 ) ) ( HOIST-AT ?auto_2118 ?auto_2117 ) ( AVAILABLE ?auto_2118 ) ( SURFACE-AT ?auto_2112 ?auto_2117 ) ( ON ?auto_2112 ?auto_2119 ) ( CLEAR ?auto_2112 ) ( TRUCK-AT ?auto_2116 ?auto_2115 ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( not ( = ?auto_2112 ?auto_2119 ) ) ( not ( = ?auto_2113 ?auto_2119 ) ) ( not ( = ?auto_2114 ?auto_2118 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2116 ?auto_2115 ?auto_2117 )
      ( !LIFT ?auto_2118 ?auto_2112 ?auto_2119 ?auto_2117 )
      ( !LOAD ?auto_2118 ?auto_2112 ?auto_2116 ?auto_2117 )
      ( !DRIVE ?auto_2116 ?auto_2117 ?auto_2115 )
      ( !UNLOAD ?auto_2114 ?auto_2112 ?auto_2116 ?auto_2115 )
      ( !DROP ?auto_2114 ?auto_2112 ?auto_2113 ?auto_2115 )
      ( MAKE-ON-VERIFY ?auto_2112 ?auto_2113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2122 - SURFACE
      ?auto_2123 - SURFACE
    )
    :vars
    (
      ?auto_2124 - HOIST
      ?auto_2125 - PLACE
      ?auto_2127 - PLACE
      ?auto_2128 - HOIST
      ?auto_2129 - SURFACE
      ?auto_2126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2124 ?auto_2125 ) ( SURFACE-AT ?auto_2123 ?auto_2125 ) ( CLEAR ?auto_2123 ) ( IS-CRATE ?auto_2122 ) ( AVAILABLE ?auto_2124 ) ( not ( = ?auto_2127 ?auto_2125 ) ) ( HOIST-AT ?auto_2128 ?auto_2127 ) ( AVAILABLE ?auto_2128 ) ( SURFACE-AT ?auto_2122 ?auto_2127 ) ( ON ?auto_2122 ?auto_2129 ) ( CLEAR ?auto_2122 ) ( TRUCK-AT ?auto_2126 ?auto_2125 ) ( not ( = ?auto_2122 ?auto_2123 ) ) ( not ( = ?auto_2122 ?auto_2129 ) ) ( not ( = ?auto_2123 ?auto_2129 ) ) ( not ( = ?auto_2124 ?auto_2128 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2126 ?auto_2125 ?auto_2127 )
      ( !LIFT ?auto_2128 ?auto_2122 ?auto_2129 ?auto_2127 )
      ( !LOAD ?auto_2128 ?auto_2122 ?auto_2126 ?auto_2127 )
      ( !DRIVE ?auto_2126 ?auto_2127 ?auto_2125 )
      ( !UNLOAD ?auto_2124 ?auto_2122 ?auto_2126 ?auto_2125 )
      ( !DROP ?auto_2124 ?auto_2122 ?auto_2123 ?auto_2125 )
      ( MAKE-ON-VERIFY ?auto_2122 ?auto_2123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2132 - SURFACE
      ?auto_2133 - SURFACE
    )
    :vars
    (
      ?auto_2134 - HOIST
      ?auto_2135 - PLACE
      ?auto_2137 - PLACE
      ?auto_2138 - HOIST
      ?auto_2139 - SURFACE
      ?auto_2136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2134 ?auto_2135 ) ( SURFACE-AT ?auto_2133 ?auto_2135 ) ( CLEAR ?auto_2133 ) ( IS-CRATE ?auto_2132 ) ( AVAILABLE ?auto_2134 ) ( not ( = ?auto_2137 ?auto_2135 ) ) ( HOIST-AT ?auto_2138 ?auto_2137 ) ( AVAILABLE ?auto_2138 ) ( SURFACE-AT ?auto_2132 ?auto_2137 ) ( ON ?auto_2132 ?auto_2139 ) ( CLEAR ?auto_2132 ) ( TRUCK-AT ?auto_2136 ?auto_2135 ) ( not ( = ?auto_2132 ?auto_2133 ) ) ( not ( = ?auto_2132 ?auto_2139 ) ) ( not ( = ?auto_2133 ?auto_2139 ) ) ( not ( = ?auto_2134 ?auto_2138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2136 ?auto_2135 ?auto_2137 )
      ( !LIFT ?auto_2138 ?auto_2132 ?auto_2139 ?auto_2137 )
      ( !LOAD ?auto_2138 ?auto_2132 ?auto_2136 ?auto_2137 )
      ( !DRIVE ?auto_2136 ?auto_2137 ?auto_2135 )
      ( !UNLOAD ?auto_2134 ?auto_2132 ?auto_2136 ?auto_2135 )
      ( !DROP ?auto_2134 ?auto_2132 ?auto_2133 ?auto_2135 )
      ( MAKE-ON-VERIFY ?auto_2132 ?auto_2133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2142 - SURFACE
      ?auto_2143 - SURFACE
    )
    :vars
    (
      ?auto_2144 - HOIST
      ?auto_2145 - PLACE
      ?auto_2147 - PLACE
      ?auto_2148 - HOIST
      ?auto_2149 - SURFACE
      ?auto_2146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2144 ?auto_2145 ) ( SURFACE-AT ?auto_2143 ?auto_2145 ) ( CLEAR ?auto_2143 ) ( IS-CRATE ?auto_2142 ) ( AVAILABLE ?auto_2144 ) ( not ( = ?auto_2147 ?auto_2145 ) ) ( HOIST-AT ?auto_2148 ?auto_2147 ) ( AVAILABLE ?auto_2148 ) ( SURFACE-AT ?auto_2142 ?auto_2147 ) ( ON ?auto_2142 ?auto_2149 ) ( CLEAR ?auto_2142 ) ( TRUCK-AT ?auto_2146 ?auto_2145 ) ( not ( = ?auto_2142 ?auto_2143 ) ) ( not ( = ?auto_2142 ?auto_2149 ) ) ( not ( = ?auto_2143 ?auto_2149 ) ) ( not ( = ?auto_2144 ?auto_2148 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2146 ?auto_2145 ?auto_2147 )
      ( !LIFT ?auto_2148 ?auto_2142 ?auto_2149 ?auto_2147 )
      ( !LOAD ?auto_2148 ?auto_2142 ?auto_2146 ?auto_2147 )
      ( !DRIVE ?auto_2146 ?auto_2147 ?auto_2145 )
      ( !UNLOAD ?auto_2144 ?auto_2142 ?auto_2146 ?auto_2145 )
      ( !DROP ?auto_2144 ?auto_2142 ?auto_2143 ?auto_2145 )
      ( MAKE-ON-VERIFY ?auto_2142 ?auto_2143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2152 - SURFACE
      ?auto_2153 - SURFACE
    )
    :vars
    (
      ?auto_2154 - HOIST
      ?auto_2155 - PLACE
      ?auto_2157 - PLACE
      ?auto_2158 - HOIST
      ?auto_2159 - SURFACE
      ?auto_2156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2154 ?auto_2155 ) ( SURFACE-AT ?auto_2153 ?auto_2155 ) ( CLEAR ?auto_2153 ) ( IS-CRATE ?auto_2152 ) ( AVAILABLE ?auto_2154 ) ( not ( = ?auto_2157 ?auto_2155 ) ) ( HOIST-AT ?auto_2158 ?auto_2157 ) ( AVAILABLE ?auto_2158 ) ( SURFACE-AT ?auto_2152 ?auto_2157 ) ( ON ?auto_2152 ?auto_2159 ) ( CLEAR ?auto_2152 ) ( TRUCK-AT ?auto_2156 ?auto_2155 ) ( not ( = ?auto_2152 ?auto_2153 ) ) ( not ( = ?auto_2152 ?auto_2159 ) ) ( not ( = ?auto_2153 ?auto_2159 ) ) ( not ( = ?auto_2154 ?auto_2158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2156 ?auto_2155 ?auto_2157 )
      ( !LIFT ?auto_2158 ?auto_2152 ?auto_2159 ?auto_2157 )
      ( !LOAD ?auto_2158 ?auto_2152 ?auto_2156 ?auto_2157 )
      ( !DRIVE ?auto_2156 ?auto_2157 ?auto_2155 )
      ( !UNLOAD ?auto_2154 ?auto_2152 ?auto_2156 ?auto_2155 )
      ( !DROP ?auto_2154 ?auto_2152 ?auto_2153 ?auto_2155 )
      ( MAKE-ON-VERIFY ?auto_2152 ?auto_2153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2162 - SURFACE
      ?auto_2163 - SURFACE
    )
    :vars
    (
      ?auto_2164 - HOIST
      ?auto_2165 - PLACE
      ?auto_2167 - PLACE
      ?auto_2168 - HOIST
      ?auto_2169 - SURFACE
      ?auto_2166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2164 ?auto_2165 ) ( SURFACE-AT ?auto_2163 ?auto_2165 ) ( CLEAR ?auto_2163 ) ( IS-CRATE ?auto_2162 ) ( AVAILABLE ?auto_2164 ) ( not ( = ?auto_2167 ?auto_2165 ) ) ( HOIST-AT ?auto_2168 ?auto_2167 ) ( AVAILABLE ?auto_2168 ) ( SURFACE-AT ?auto_2162 ?auto_2167 ) ( ON ?auto_2162 ?auto_2169 ) ( CLEAR ?auto_2162 ) ( TRUCK-AT ?auto_2166 ?auto_2165 ) ( not ( = ?auto_2162 ?auto_2163 ) ) ( not ( = ?auto_2162 ?auto_2169 ) ) ( not ( = ?auto_2163 ?auto_2169 ) ) ( not ( = ?auto_2164 ?auto_2168 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2166 ?auto_2165 ?auto_2167 )
      ( !LIFT ?auto_2168 ?auto_2162 ?auto_2169 ?auto_2167 )
      ( !LOAD ?auto_2168 ?auto_2162 ?auto_2166 ?auto_2167 )
      ( !DRIVE ?auto_2166 ?auto_2167 ?auto_2165 )
      ( !UNLOAD ?auto_2164 ?auto_2162 ?auto_2166 ?auto_2165 )
      ( !DROP ?auto_2164 ?auto_2162 ?auto_2163 ?auto_2165 )
      ( MAKE-ON-VERIFY ?auto_2162 ?auto_2163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2172 - SURFACE
      ?auto_2173 - SURFACE
    )
    :vars
    (
      ?auto_2174 - HOIST
      ?auto_2175 - PLACE
      ?auto_2177 - PLACE
      ?auto_2178 - HOIST
      ?auto_2179 - SURFACE
      ?auto_2176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2174 ?auto_2175 ) ( SURFACE-AT ?auto_2173 ?auto_2175 ) ( CLEAR ?auto_2173 ) ( IS-CRATE ?auto_2172 ) ( AVAILABLE ?auto_2174 ) ( not ( = ?auto_2177 ?auto_2175 ) ) ( HOIST-AT ?auto_2178 ?auto_2177 ) ( AVAILABLE ?auto_2178 ) ( SURFACE-AT ?auto_2172 ?auto_2177 ) ( ON ?auto_2172 ?auto_2179 ) ( CLEAR ?auto_2172 ) ( TRUCK-AT ?auto_2176 ?auto_2175 ) ( not ( = ?auto_2172 ?auto_2173 ) ) ( not ( = ?auto_2172 ?auto_2179 ) ) ( not ( = ?auto_2173 ?auto_2179 ) ) ( not ( = ?auto_2174 ?auto_2178 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2176 ?auto_2175 ?auto_2177 )
      ( !LIFT ?auto_2178 ?auto_2172 ?auto_2179 ?auto_2177 )
      ( !LOAD ?auto_2178 ?auto_2172 ?auto_2176 ?auto_2177 )
      ( !DRIVE ?auto_2176 ?auto_2177 ?auto_2175 )
      ( !UNLOAD ?auto_2174 ?auto_2172 ?auto_2176 ?auto_2175 )
      ( !DROP ?auto_2174 ?auto_2172 ?auto_2173 ?auto_2175 )
      ( MAKE-ON-VERIFY ?auto_2172 ?auto_2173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2182 - SURFACE
      ?auto_2183 - SURFACE
    )
    :vars
    (
      ?auto_2184 - HOIST
      ?auto_2185 - PLACE
      ?auto_2187 - PLACE
      ?auto_2188 - HOIST
      ?auto_2189 - SURFACE
      ?auto_2186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2184 ?auto_2185 ) ( SURFACE-AT ?auto_2183 ?auto_2185 ) ( CLEAR ?auto_2183 ) ( IS-CRATE ?auto_2182 ) ( AVAILABLE ?auto_2184 ) ( not ( = ?auto_2187 ?auto_2185 ) ) ( HOIST-AT ?auto_2188 ?auto_2187 ) ( AVAILABLE ?auto_2188 ) ( SURFACE-AT ?auto_2182 ?auto_2187 ) ( ON ?auto_2182 ?auto_2189 ) ( CLEAR ?auto_2182 ) ( TRUCK-AT ?auto_2186 ?auto_2185 ) ( not ( = ?auto_2182 ?auto_2183 ) ) ( not ( = ?auto_2182 ?auto_2189 ) ) ( not ( = ?auto_2183 ?auto_2189 ) ) ( not ( = ?auto_2184 ?auto_2188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2186 ?auto_2185 ?auto_2187 )
      ( !LIFT ?auto_2188 ?auto_2182 ?auto_2189 ?auto_2187 )
      ( !LOAD ?auto_2188 ?auto_2182 ?auto_2186 ?auto_2187 )
      ( !DRIVE ?auto_2186 ?auto_2187 ?auto_2185 )
      ( !UNLOAD ?auto_2184 ?auto_2182 ?auto_2186 ?auto_2185 )
      ( !DROP ?auto_2184 ?auto_2182 ?auto_2183 ?auto_2185 )
      ( MAKE-ON-VERIFY ?auto_2182 ?auto_2183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2192 - SURFACE
      ?auto_2193 - SURFACE
    )
    :vars
    (
      ?auto_2194 - HOIST
      ?auto_2195 - PLACE
      ?auto_2197 - PLACE
      ?auto_2198 - HOIST
      ?auto_2199 - SURFACE
      ?auto_2196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194 ?auto_2195 ) ( SURFACE-AT ?auto_2193 ?auto_2195 ) ( CLEAR ?auto_2193 ) ( IS-CRATE ?auto_2192 ) ( AVAILABLE ?auto_2194 ) ( not ( = ?auto_2197 ?auto_2195 ) ) ( HOIST-AT ?auto_2198 ?auto_2197 ) ( AVAILABLE ?auto_2198 ) ( SURFACE-AT ?auto_2192 ?auto_2197 ) ( ON ?auto_2192 ?auto_2199 ) ( CLEAR ?auto_2192 ) ( TRUCK-AT ?auto_2196 ?auto_2195 ) ( not ( = ?auto_2192 ?auto_2193 ) ) ( not ( = ?auto_2192 ?auto_2199 ) ) ( not ( = ?auto_2193 ?auto_2199 ) ) ( not ( = ?auto_2194 ?auto_2198 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2196 ?auto_2195 ?auto_2197 )
      ( !LIFT ?auto_2198 ?auto_2192 ?auto_2199 ?auto_2197 )
      ( !LOAD ?auto_2198 ?auto_2192 ?auto_2196 ?auto_2197 )
      ( !DRIVE ?auto_2196 ?auto_2197 ?auto_2195 )
      ( !UNLOAD ?auto_2194 ?auto_2192 ?auto_2196 ?auto_2195 )
      ( !DROP ?auto_2194 ?auto_2192 ?auto_2193 ?auto_2195 )
      ( MAKE-ON-VERIFY ?auto_2192 ?auto_2193 ) )
  )

)

