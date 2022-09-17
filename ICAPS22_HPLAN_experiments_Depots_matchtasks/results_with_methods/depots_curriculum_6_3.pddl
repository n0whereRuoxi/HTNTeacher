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

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2159 - SURFACE
      ?auto_2160 - SURFACE
    )
    :vars
    (
      ?auto_2161 - HOIST
      ?auto_2162 - PLACE
      ?auto_2164 - PLACE
      ?auto_2165 - HOIST
      ?auto_2166 - SURFACE
      ?auto_2163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2161 ?auto_2162 ) ( SURFACE-AT ?auto_2159 ?auto_2162 ) ( CLEAR ?auto_2159 ) ( IS-CRATE ?auto_2160 ) ( AVAILABLE ?auto_2161 ) ( not ( = ?auto_2164 ?auto_2162 ) ) ( HOIST-AT ?auto_2165 ?auto_2164 ) ( AVAILABLE ?auto_2165 ) ( SURFACE-AT ?auto_2160 ?auto_2164 ) ( ON ?auto_2160 ?auto_2166 ) ( CLEAR ?auto_2160 ) ( TRUCK-AT ?auto_2163 ?auto_2162 ) ( not ( = ?auto_2159 ?auto_2160 ) ) ( not ( = ?auto_2159 ?auto_2166 ) ) ( not ( = ?auto_2160 ?auto_2166 ) ) ( not ( = ?auto_2161 ?auto_2165 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2163 ?auto_2162 ?auto_2164 )
      ( !LIFT ?auto_2165 ?auto_2160 ?auto_2166 ?auto_2164 )
      ( !LOAD ?auto_2165 ?auto_2160 ?auto_2163 ?auto_2164 )
      ( !DRIVE ?auto_2163 ?auto_2164 ?auto_2162 )
      ( !UNLOAD ?auto_2161 ?auto_2160 ?auto_2163 ?auto_2162 )
      ( !DROP ?auto_2161 ?auto_2160 ?auto_2159 ?auto_2162 )
      ( MAKE-1CRATE-VERIFY ?auto_2159 ?auto_2160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2169 - SURFACE
      ?auto_2170 - SURFACE
    )
    :vars
    (
      ?auto_2171 - HOIST
      ?auto_2172 - PLACE
      ?auto_2174 - PLACE
      ?auto_2175 - HOIST
      ?auto_2176 - SURFACE
      ?auto_2173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2171 ?auto_2172 ) ( SURFACE-AT ?auto_2169 ?auto_2172 ) ( CLEAR ?auto_2169 ) ( IS-CRATE ?auto_2170 ) ( AVAILABLE ?auto_2171 ) ( not ( = ?auto_2174 ?auto_2172 ) ) ( HOIST-AT ?auto_2175 ?auto_2174 ) ( AVAILABLE ?auto_2175 ) ( SURFACE-AT ?auto_2170 ?auto_2174 ) ( ON ?auto_2170 ?auto_2176 ) ( CLEAR ?auto_2170 ) ( TRUCK-AT ?auto_2173 ?auto_2172 ) ( not ( = ?auto_2169 ?auto_2170 ) ) ( not ( = ?auto_2169 ?auto_2176 ) ) ( not ( = ?auto_2170 ?auto_2176 ) ) ( not ( = ?auto_2171 ?auto_2175 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2173 ?auto_2172 ?auto_2174 )
      ( !LIFT ?auto_2175 ?auto_2170 ?auto_2176 ?auto_2174 )
      ( !LOAD ?auto_2175 ?auto_2170 ?auto_2173 ?auto_2174 )
      ( !DRIVE ?auto_2173 ?auto_2174 ?auto_2172 )
      ( !UNLOAD ?auto_2171 ?auto_2170 ?auto_2173 ?auto_2172 )
      ( !DROP ?auto_2171 ?auto_2170 ?auto_2169 ?auto_2172 )
      ( MAKE-1CRATE-VERIFY ?auto_2169 ?auto_2170 ) )
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
      ?auto_2186 - HOIST
      ?auto_2183 - PLACE
      ?auto_2187 - PLACE
      ?auto_2184 - HOIST
      ?auto_2188 - SURFACE
      ?auto_2191 - PLACE
      ?auto_2190 - HOIST
      ?auto_2189 - SURFACE
      ?auto_2185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2186 ?auto_2183 ) ( IS-CRATE ?auto_2182 ) ( not ( = ?auto_2187 ?auto_2183 ) ) ( HOIST-AT ?auto_2184 ?auto_2187 ) ( AVAILABLE ?auto_2184 ) ( SURFACE-AT ?auto_2182 ?auto_2187 ) ( ON ?auto_2182 ?auto_2188 ) ( CLEAR ?auto_2182 ) ( not ( = ?auto_2181 ?auto_2182 ) ) ( not ( = ?auto_2181 ?auto_2188 ) ) ( not ( = ?auto_2182 ?auto_2188 ) ) ( not ( = ?auto_2186 ?auto_2184 ) ) ( SURFACE-AT ?auto_2180 ?auto_2183 ) ( CLEAR ?auto_2180 ) ( IS-CRATE ?auto_2181 ) ( AVAILABLE ?auto_2186 ) ( not ( = ?auto_2191 ?auto_2183 ) ) ( HOIST-AT ?auto_2190 ?auto_2191 ) ( AVAILABLE ?auto_2190 ) ( SURFACE-AT ?auto_2181 ?auto_2191 ) ( ON ?auto_2181 ?auto_2189 ) ( CLEAR ?auto_2181 ) ( TRUCK-AT ?auto_2185 ?auto_2183 ) ( not ( = ?auto_2180 ?auto_2181 ) ) ( not ( = ?auto_2180 ?auto_2189 ) ) ( not ( = ?auto_2181 ?auto_2189 ) ) ( not ( = ?auto_2186 ?auto_2190 ) ) ( not ( = ?auto_2180 ?auto_2182 ) ) ( not ( = ?auto_2180 ?auto_2188 ) ) ( not ( = ?auto_2182 ?auto_2189 ) ) ( not ( = ?auto_2187 ?auto_2191 ) ) ( not ( = ?auto_2184 ?auto_2190 ) ) ( not ( = ?auto_2188 ?auto_2189 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2180 ?auto_2181 )
      ( MAKE-1CRATE ?auto_2181 ?auto_2182 )
      ( MAKE-2CRATE-VERIFY ?auto_2180 ?auto_2181 ?auto_2182 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2194 - SURFACE
      ?auto_2195 - SURFACE
    )
    :vars
    (
      ?auto_2196 - HOIST
      ?auto_2197 - PLACE
      ?auto_2199 - PLACE
      ?auto_2200 - HOIST
      ?auto_2201 - SURFACE
      ?auto_2198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2196 ?auto_2197 ) ( SURFACE-AT ?auto_2194 ?auto_2197 ) ( CLEAR ?auto_2194 ) ( IS-CRATE ?auto_2195 ) ( AVAILABLE ?auto_2196 ) ( not ( = ?auto_2199 ?auto_2197 ) ) ( HOIST-AT ?auto_2200 ?auto_2199 ) ( AVAILABLE ?auto_2200 ) ( SURFACE-AT ?auto_2195 ?auto_2199 ) ( ON ?auto_2195 ?auto_2201 ) ( CLEAR ?auto_2195 ) ( TRUCK-AT ?auto_2198 ?auto_2197 ) ( not ( = ?auto_2194 ?auto_2195 ) ) ( not ( = ?auto_2194 ?auto_2201 ) ) ( not ( = ?auto_2195 ?auto_2201 ) ) ( not ( = ?auto_2196 ?auto_2200 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2198 ?auto_2197 ?auto_2199 )
      ( !LIFT ?auto_2200 ?auto_2195 ?auto_2201 ?auto_2199 )
      ( !LOAD ?auto_2200 ?auto_2195 ?auto_2198 ?auto_2199 )
      ( !DRIVE ?auto_2198 ?auto_2199 ?auto_2197 )
      ( !UNLOAD ?auto_2196 ?auto_2195 ?auto_2198 ?auto_2197 )
      ( !DROP ?auto_2196 ?auto_2195 ?auto_2194 ?auto_2197 )
      ( MAKE-1CRATE-VERIFY ?auto_2194 ?auto_2195 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2206 - SURFACE
      ?auto_2207 - SURFACE
      ?auto_2208 - SURFACE
      ?auto_2209 - SURFACE
    )
    :vars
    (
      ?auto_2215 - HOIST
      ?auto_2212 - PLACE
      ?auto_2213 - PLACE
      ?auto_2210 - HOIST
      ?auto_2214 - SURFACE
      ?auto_2218 - PLACE
      ?auto_2217 - HOIST
      ?auto_2216 - SURFACE
      ?auto_2221 - PLACE
      ?auto_2220 - HOIST
      ?auto_2219 - SURFACE
      ?auto_2211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2215 ?auto_2212 ) ( IS-CRATE ?auto_2209 ) ( not ( = ?auto_2213 ?auto_2212 ) ) ( HOIST-AT ?auto_2210 ?auto_2213 ) ( AVAILABLE ?auto_2210 ) ( SURFACE-AT ?auto_2209 ?auto_2213 ) ( ON ?auto_2209 ?auto_2214 ) ( CLEAR ?auto_2209 ) ( not ( = ?auto_2208 ?auto_2209 ) ) ( not ( = ?auto_2208 ?auto_2214 ) ) ( not ( = ?auto_2209 ?auto_2214 ) ) ( not ( = ?auto_2215 ?auto_2210 ) ) ( IS-CRATE ?auto_2208 ) ( not ( = ?auto_2218 ?auto_2212 ) ) ( HOIST-AT ?auto_2217 ?auto_2218 ) ( AVAILABLE ?auto_2217 ) ( SURFACE-AT ?auto_2208 ?auto_2218 ) ( ON ?auto_2208 ?auto_2216 ) ( CLEAR ?auto_2208 ) ( not ( = ?auto_2207 ?auto_2208 ) ) ( not ( = ?auto_2207 ?auto_2216 ) ) ( not ( = ?auto_2208 ?auto_2216 ) ) ( not ( = ?auto_2215 ?auto_2217 ) ) ( SURFACE-AT ?auto_2206 ?auto_2212 ) ( CLEAR ?auto_2206 ) ( IS-CRATE ?auto_2207 ) ( AVAILABLE ?auto_2215 ) ( not ( = ?auto_2221 ?auto_2212 ) ) ( HOIST-AT ?auto_2220 ?auto_2221 ) ( AVAILABLE ?auto_2220 ) ( SURFACE-AT ?auto_2207 ?auto_2221 ) ( ON ?auto_2207 ?auto_2219 ) ( CLEAR ?auto_2207 ) ( TRUCK-AT ?auto_2211 ?auto_2212 ) ( not ( = ?auto_2206 ?auto_2207 ) ) ( not ( = ?auto_2206 ?auto_2219 ) ) ( not ( = ?auto_2207 ?auto_2219 ) ) ( not ( = ?auto_2215 ?auto_2220 ) ) ( not ( = ?auto_2206 ?auto_2208 ) ) ( not ( = ?auto_2206 ?auto_2216 ) ) ( not ( = ?auto_2208 ?auto_2219 ) ) ( not ( = ?auto_2218 ?auto_2221 ) ) ( not ( = ?auto_2217 ?auto_2220 ) ) ( not ( = ?auto_2216 ?auto_2219 ) ) ( not ( = ?auto_2206 ?auto_2209 ) ) ( not ( = ?auto_2206 ?auto_2214 ) ) ( not ( = ?auto_2207 ?auto_2209 ) ) ( not ( = ?auto_2207 ?auto_2214 ) ) ( not ( = ?auto_2209 ?auto_2216 ) ) ( not ( = ?auto_2209 ?auto_2219 ) ) ( not ( = ?auto_2213 ?auto_2218 ) ) ( not ( = ?auto_2213 ?auto_2221 ) ) ( not ( = ?auto_2210 ?auto_2217 ) ) ( not ( = ?auto_2210 ?auto_2220 ) ) ( not ( = ?auto_2214 ?auto_2216 ) ) ( not ( = ?auto_2214 ?auto_2219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2206 ?auto_2207 ?auto_2208 )
      ( MAKE-1CRATE ?auto_2208 ?auto_2209 )
      ( MAKE-3CRATE-VERIFY ?auto_2206 ?auto_2207 ?auto_2208 ?auto_2209 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2224 - SURFACE
      ?auto_2225 - SURFACE
    )
    :vars
    (
      ?auto_2226 - HOIST
      ?auto_2227 - PLACE
      ?auto_2229 - PLACE
      ?auto_2230 - HOIST
      ?auto_2231 - SURFACE
      ?auto_2228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2226 ?auto_2227 ) ( SURFACE-AT ?auto_2224 ?auto_2227 ) ( CLEAR ?auto_2224 ) ( IS-CRATE ?auto_2225 ) ( AVAILABLE ?auto_2226 ) ( not ( = ?auto_2229 ?auto_2227 ) ) ( HOIST-AT ?auto_2230 ?auto_2229 ) ( AVAILABLE ?auto_2230 ) ( SURFACE-AT ?auto_2225 ?auto_2229 ) ( ON ?auto_2225 ?auto_2231 ) ( CLEAR ?auto_2225 ) ( TRUCK-AT ?auto_2228 ?auto_2227 ) ( not ( = ?auto_2224 ?auto_2225 ) ) ( not ( = ?auto_2224 ?auto_2231 ) ) ( not ( = ?auto_2225 ?auto_2231 ) ) ( not ( = ?auto_2226 ?auto_2230 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2228 ?auto_2227 ?auto_2229 )
      ( !LIFT ?auto_2230 ?auto_2225 ?auto_2231 ?auto_2229 )
      ( !LOAD ?auto_2230 ?auto_2225 ?auto_2228 ?auto_2229 )
      ( !DRIVE ?auto_2228 ?auto_2229 ?auto_2227 )
      ( !UNLOAD ?auto_2226 ?auto_2225 ?auto_2228 ?auto_2227 )
      ( !DROP ?auto_2226 ?auto_2225 ?auto_2224 ?auto_2227 )
      ( MAKE-1CRATE-VERIFY ?auto_2224 ?auto_2225 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2237 - SURFACE
      ?auto_2238 - SURFACE
      ?auto_2239 - SURFACE
      ?auto_2240 - SURFACE
      ?auto_2241 - SURFACE
    )
    :vars
    (
      ?auto_2247 - HOIST
      ?auto_2244 - PLACE
      ?auto_2245 - PLACE
      ?auto_2243 - HOIST
      ?auto_2242 - SURFACE
      ?auto_2254 - PLACE
      ?auto_2251 - HOIST
      ?auto_2249 - SURFACE
      ?auto_2250 - PLACE
      ?auto_2253 - HOIST
      ?auto_2248 - SURFACE
      ?auto_2252 - SURFACE
      ?auto_2246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2247 ?auto_2244 ) ( IS-CRATE ?auto_2241 ) ( not ( = ?auto_2245 ?auto_2244 ) ) ( HOIST-AT ?auto_2243 ?auto_2245 ) ( SURFACE-AT ?auto_2241 ?auto_2245 ) ( ON ?auto_2241 ?auto_2242 ) ( CLEAR ?auto_2241 ) ( not ( = ?auto_2240 ?auto_2241 ) ) ( not ( = ?auto_2240 ?auto_2242 ) ) ( not ( = ?auto_2241 ?auto_2242 ) ) ( not ( = ?auto_2247 ?auto_2243 ) ) ( IS-CRATE ?auto_2240 ) ( not ( = ?auto_2254 ?auto_2244 ) ) ( HOIST-AT ?auto_2251 ?auto_2254 ) ( AVAILABLE ?auto_2251 ) ( SURFACE-AT ?auto_2240 ?auto_2254 ) ( ON ?auto_2240 ?auto_2249 ) ( CLEAR ?auto_2240 ) ( not ( = ?auto_2239 ?auto_2240 ) ) ( not ( = ?auto_2239 ?auto_2249 ) ) ( not ( = ?auto_2240 ?auto_2249 ) ) ( not ( = ?auto_2247 ?auto_2251 ) ) ( IS-CRATE ?auto_2239 ) ( not ( = ?auto_2250 ?auto_2244 ) ) ( HOIST-AT ?auto_2253 ?auto_2250 ) ( AVAILABLE ?auto_2253 ) ( SURFACE-AT ?auto_2239 ?auto_2250 ) ( ON ?auto_2239 ?auto_2248 ) ( CLEAR ?auto_2239 ) ( not ( = ?auto_2238 ?auto_2239 ) ) ( not ( = ?auto_2238 ?auto_2248 ) ) ( not ( = ?auto_2239 ?auto_2248 ) ) ( not ( = ?auto_2247 ?auto_2253 ) ) ( SURFACE-AT ?auto_2237 ?auto_2244 ) ( CLEAR ?auto_2237 ) ( IS-CRATE ?auto_2238 ) ( AVAILABLE ?auto_2247 ) ( AVAILABLE ?auto_2243 ) ( SURFACE-AT ?auto_2238 ?auto_2245 ) ( ON ?auto_2238 ?auto_2252 ) ( CLEAR ?auto_2238 ) ( TRUCK-AT ?auto_2246 ?auto_2244 ) ( not ( = ?auto_2237 ?auto_2238 ) ) ( not ( = ?auto_2237 ?auto_2252 ) ) ( not ( = ?auto_2238 ?auto_2252 ) ) ( not ( = ?auto_2237 ?auto_2239 ) ) ( not ( = ?auto_2237 ?auto_2248 ) ) ( not ( = ?auto_2239 ?auto_2252 ) ) ( not ( = ?auto_2250 ?auto_2245 ) ) ( not ( = ?auto_2253 ?auto_2243 ) ) ( not ( = ?auto_2248 ?auto_2252 ) ) ( not ( = ?auto_2237 ?auto_2240 ) ) ( not ( = ?auto_2237 ?auto_2249 ) ) ( not ( = ?auto_2238 ?auto_2240 ) ) ( not ( = ?auto_2238 ?auto_2249 ) ) ( not ( = ?auto_2240 ?auto_2248 ) ) ( not ( = ?auto_2240 ?auto_2252 ) ) ( not ( = ?auto_2254 ?auto_2250 ) ) ( not ( = ?auto_2254 ?auto_2245 ) ) ( not ( = ?auto_2251 ?auto_2253 ) ) ( not ( = ?auto_2251 ?auto_2243 ) ) ( not ( = ?auto_2249 ?auto_2248 ) ) ( not ( = ?auto_2249 ?auto_2252 ) ) ( not ( = ?auto_2237 ?auto_2241 ) ) ( not ( = ?auto_2237 ?auto_2242 ) ) ( not ( = ?auto_2238 ?auto_2241 ) ) ( not ( = ?auto_2238 ?auto_2242 ) ) ( not ( = ?auto_2239 ?auto_2241 ) ) ( not ( = ?auto_2239 ?auto_2242 ) ) ( not ( = ?auto_2241 ?auto_2249 ) ) ( not ( = ?auto_2241 ?auto_2248 ) ) ( not ( = ?auto_2241 ?auto_2252 ) ) ( not ( = ?auto_2242 ?auto_2249 ) ) ( not ( = ?auto_2242 ?auto_2248 ) ) ( not ( = ?auto_2242 ?auto_2252 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2237 ?auto_2238 ?auto_2239 ?auto_2240 )
      ( MAKE-1CRATE ?auto_2240 ?auto_2241 )
      ( MAKE-4CRATE-VERIFY ?auto_2237 ?auto_2238 ?auto_2239 ?auto_2240 ?auto_2241 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2257 - SURFACE
      ?auto_2258 - SURFACE
    )
    :vars
    (
      ?auto_2259 - HOIST
      ?auto_2260 - PLACE
      ?auto_2262 - PLACE
      ?auto_2263 - HOIST
      ?auto_2264 - SURFACE
      ?auto_2261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2259 ?auto_2260 ) ( SURFACE-AT ?auto_2257 ?auto_2260 ) ( CLEAR ?auto_2257 ) ( IS-CRATE ?auto_2258 ) ( AVAILABLE ?auto_2259 ) ( not ( = ?auto_2262 ?auto_2260 ) ) ( HOIST-AT ?auto_2263 ?auto_2262 ) ( AVAILABLE ?auto_2263 ) ( SURFACE-AT ?auto_2258 ?auto_2262 ) ( ON ?auto_2258 ?auto_2264 ) ( CLEAR ?auto_2258 ) ( TRUCK-AT ?auto_2261 ?auto_2260 ) ( not ( = ?auto_2257 ?auto_2258 ) ) ( not ( = ?auto_2257 ?auto_2264 ) ) ( not ( = ?auto_2258 ?auto_2264 ) ) ( not ( = ?auto_2259 ?auto_2263 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2261 ?auto_2260 ?auto_2262 )
      ( !LIFT ?auto_2263 ?auto_2258 ?auto_2264 ?auto_2262 )
      ( !LOAD ?auto_2263 ?auto_2258 ?auto_2261 ?auto_2262 )
      ( !DRIVE ?auto_2261 ?auto_2262 ?auto_2260 )
      ( !UNLOAD ?auto_2259 ?auto_2258 ?auto_2261 ?auto_2260 )
      ( !DROP ?auto_2259 ?auto_2258 ?auto_2257 ?auto_2260 )
      ( MAKE-1CRATE-VERIFY ?auto_2257 ?auto_2258 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2271 - SURFACE
      ?auto_2272 - SURFACE
      ?auto_2273 - SURFACE
      ?auto_2274 - SURFACE
      ?auto_2275 - SURFACE
      ?auto_2276 - SURFACE
    )
    :vars
    (
      ?auto_2280 - HOIST
      ?auto_2281 - PLACE
      ?auto_2279 - PLACE
      ?auto_2278 - HOIST
      ?auto_2282 - SURFACE
      ?auto_2283 - PLACE
      ?auto_2289 - HOIST
      ?auto_2286 - SURFACE
      ?auto_2287 - PLACE
      ?auto_2285 - HOIST
      ?auto_2284 - SURFACE
      ?auto_2290 - SURFACE
      ?auto_2288 - SURFACE
      ?auto_2277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280 ?auto_2281 ) ( IS-CRATE ?auto_2276 ) ( not ( = ?auto_2279 ?auto_2281 ) ) ( HOIST-AT ?auto_2278 ?auto_2279 ) ( SURFACE-AT ?auto_2276 ?auto_2279 ) ( ON ?auto_2276 ?auto_2282 ) ( CLEAR ?auto_2276 ) ( not ( = ?auto_2275 ?auto_2276 ) ) ( not ( = ?auto_2275 ?auto_2282 ) ) ( not ( = ?auto_2276 ?auto_2282 ) ) ( not ( = ?auto_2280 ?auto_2278 ) ) ( IS-CRATE ?auto_2275 ) ( not ( = ?auto_2283 ?auto_2281 ) ) ( HOIST-AT ?auto_2289 ?auto_2283 ) ( SURFACE-AT ?auto_2275 ?auto_2283 ) ( ON ?auto_2275 ?auto_2286 ) ( CLEAR ?auto_2275 ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( not ( = ?auto_2274 ?auto_2286 ) ) ( not ( = ?auto_2275 ?auto_2286 ) ) ( not ( = ?auto_2280 ?auto_2289 ) ) ( IS-CRATE ?auto_2274 ) ( not ( = ?auto_2287 ?auto_2281 ) ) ( HOIST-AT ?auto_2285 ?auto_2287 ) ( AVAILABLE ?auto_2285 ) ( SURFACE-AT ?auto_2274 ?auto_2287 ) ( ON ?auto_2274 ?auto_2284 ) ( CLEAR ?auto_2274 ) ( not ( = ?auto_2273 ?auto_2274 ) ) ( not ( = ?auto_2273 ?auto_2284 ) ) ( not ( = ?auto_2274 ?auto_2284 ) ) ( not ( = ?auto_2280 ?auto_2285 ) ) ( IS-CRATE ?auto_2273 ) ( AVAILABLE ?auto_2278 ) ( SURFACE-AT ?auto_2273 ?auto_2279 ) ( ON ?auto_2273 ?auto_2290 ) ( CLEAR ?auto_2273 ) ( not ( = ?auto_2272 ?auto_2273 ) ) ( not ( = ?auto_2272 ?auto_2290 ) ) ( not ( = ?auto_2273 ?auto_2290 ) ) ( SURFACE-AT ?auto_2271 ?auto_2281 ) ( CLEAR ?auto_2271 ) ( IS-CRATE ?auto_2272 ) ( AVAILABLE ?auto_2280 ) ( AVAILABLE ?auto_2289 ) ( SURFACE-AT ?auto_2272 ?auto_2283 ) ( ON ?auto_2272 ?auto_2288 ) ( CLEAR ?auto_2272 ) ( TRUCK-AT ?auto_2277 ?auto_2281 ) ( not ( = ?auto_2271 ?auto_2272 ) ) ( not ( = ?auto_2271 ?auto_2288 ) ) ( not ( = ?auto_2272 ?auto_2288 ) ) ( not ( = ?auto_2271 ?auto_2273 ) ) ( not ( = ?auto_2271 ?auto_2290 ) ) ( not ( = ?auto_2273 ?auto_2288 ) ) ( not ( = ?auto_2279 ?auto_2283 ) ) ( not ( = ?auto_2278 ?auto_2289 ) ) ( not ( = ?auto_2290 ?auto_2288 ) ) ( not ( = ?auto_2271 ?auto_2274 ) ) ( not ( = ?auto_2271 ?auto_2284 ) ) ( not ( = ?auto_2272 ?auto_2274 ) ) ( not ( = ?auto_2272 ?auto_2284 ) ) ( not ( = ?auto_2274 ?auto_2290 ) ) ( not ( = ?auto_2274 ?auto_2288 ) ) ( not ( = ?auto_2287 ?auto_2279 ) ) ( not ( = ?auto_2287 ?auto_2283 ) ) ( not ( = ?auto_2285 ?auto_2278 ) ) ( not ( = ?auto_2285 ?auto_2289 ) ) ( not ( = ?auto_2284 ?auto_2290 ) ) ( not ( = ?auto_2284 ?auto_2288 ) ) ( not ( = ?auto_2271 ?auto_2275 ) ) ( not ( = ?auto_2271 ?auto_2286 ) ) ( not ( = ?auto_2272 ?auto_2275 ) ) ( not ( = ?auto_2272 ?auto_2286 ) ) ( not ( = ?auto_2273 ?auto_2275 ) ) ( not ( = ?auto_2273 ?auto_2286 ) ) ( not ( = ?auto_2275 ?auto_2284 ) ) ( not ( = ?auto_2275 ?auto_2290 ) ) ( not ( = ?auto_2275 ?auto_2288 ) ) ( not ( = ?auto_2286 ?auto_2284 ) ) ( not ( = ?auto_2286 ?auto_2290 ) ) ( not ( = ?auto_2286 ?auto_2288 ) ) ( not ( = ?auto_2271 ?auto_2276 ) ) ( not ( = ?auto_2271 ?auto_2282 ) ) ( not ( = ?auto_2272 ?auto_2276 ) ) ( not ( = ?auto_2272 ?auto_2282 ) ) ( not ( = ?auto_2273 ?auto_2276 ) ) ( not ( = ?auto_2273 ?auto_2282 ) ) ( not ( = ?auto_2274 ?auto_2276 ) ) ( not ( = ?auto_2274 ?auto_2282 ) ) ( not ( = ?auto_2276 ?auto_2286 ) ) ( not ( = ?auto_2276 ?auto_2284 ) ) ( not ( = ?auto_2276 ?auto_2290 ) ) ( not ( = ?auto_2276 ?auto_2288 ) ) ( not ( = ?auto_2282 ?auto_2286 ) ) ( not ( = ?auto_2282 ?auto_2284 ) ) ( not ( = ?auto_2282 ?auto_2290 ) ) ( not ( = ?auto_2282 ?auto_2288 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2271 ?auto_2272 ?auto_2273 ?auto_2274 ?auto_2275 )
      ( MAKE-1CRATE ?auto_2275 ?auto_2276 )
      ( MAKE-5CRATE-VERIFY ?auto_2271 ?auto_2272 ?auto_2273 ?auto_2274 ?auto_2275 ?auto_2276 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2293 - SURFACE
      ?auto_2294 - SURFACE
    )
    :vars
    (
      ?auto_2295 - HOIST
      ?auto_2296 - PLACE
      ?auto_2298 - PLACE
      ?auto_2299 - HOIST
      ?auto_2300 - SURFACE
      ?auto_2297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2295 ?auto_2296 ) ( SURFACE-AT ?auto_2293 ?auto_2296 ) ( CLEAR ?auto_2293 ) ( IS-CRATE ?auto_2294 ) ( AVAILABLE ?auto_2295 ) ( not ( = ?auto_2298 ?auto_2296 ) ) ( HOIST-AT ?auto_2299 ?auto_2298 ) ( AVAILABLE ?auto_2299 ) ( SURFACE-AT ?auto_2294 ?auto_2298 ) ( ON ?auto_2294 ?auto_2300 ) ( CLEAR ?auto_2294 ) ( TRUCK-AT ?auto_2297 ?auto_2296 ) ( not ( = ?auto_2293 ?auto_2294 ) ) ( not ( = ?auto_2293 ?auto_2300 ) ) ( not ( = ?auto_2294 ?auto_2300 ) ) ( not ( = ?auto_2295 ?auto_2299 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2297 ?auto_2296 ?auto_2298 )
      ( !LIFT ?auto_2299 ?auto_2294 ?auto_2300 ?auto_2298 )
      ( !LOAD ?auto_2299 ?auto_2294 ?auto_2297 ?auto_2298 )
      ( !DRIVE ?auto_2297 ?auto_2298 ?auto_2296 )
      ( !UNLOAD ?auto_2295 ?auto_2294 ?auto_2297 ?auto_2296 )
      ( !DROP ?auto_2295 ?auto_2294 ?auto_2293 ?auto_2296 )
      ( MAKE-1CRATE-VERIFY ?auto_2293 ?auto_2294 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2308 - SURFACE
      ?auto_2309 - SURFACE
      ?auto_2310 - SURFACE
      ?auto_2311 - SURFACE
      ?auto_2312 - SURFACE
      ?auto_2314 - SURFACE
      ?auto_2313 - SURFACE
    )
    :vars
    (
      ?auto_2317 - HOIST
      ?auto_2316 - PLACE
      ?auto_2315 - PLACE
      ?auto_2318 - HOIST
      ?auto_2319 - SURFACE
      ?auto_2321 - PLACE
      ?auto_2327 - HOIST
      ?auto_2323 - SURFACE
      ?auto_2322 - PLACE
      ?auto_2325 - HOIST
      ?auto_2328 - SURFACE
      ?auto_2326 - PLACE
      ?auto_2331 - HOIST
      ?auto_2329 - SURFACE
      ?auto_2330 - SURFACE
      ?auto_2324 - SURFACE
      ?auto_2320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2317 ?auto_2316 ) ( IS-CRATE ?auto_2313 ) ( not ( = ?auto_2315 ?auto_2316 ) ) ( HOIST-AT ?auto_2318 ?auto_2315 ) ( AVAILABLE ?auto_2318 ) ( SURFACE-AT ?auto_2313 ?auto_2315 ) ( ON ?auto_2313 ?auto_2319 ) ( CLEAR ?auto_2313 ) ( not ( = ?auto_2314 ?auto_2313 ) ) ( not ( = ?auto_2314 ?auto_2319 ) ) ( not ( = ?auto_2313 ?auto_2319 ) ) ( not ( = ?auto_2317 ?auto_2318 ) ) ( IS-CRATE ?auto_2314 ) ( not ( = ?auto_2321 ?auto_2316 ) ) ( HOIST-AT ?auto_2327 ?auto_2321 ) ( SURFACE-AT ?auto_2314 ?auto_2321 ) ( ON ?auto_2314 ?auto_2323 ) ( CLEAR ?auto_2314 ) ( not ( = ?auto_2312 ?auto_2314 ) ) ( not ( = ?auto_2312 ?auto_2323 ) ) ( not ( = ?auto_2314 ?auto_2323 ) ) ( not ( = ?auto_2317 ?auto_2327 ) ) ( IS-CRATE ?auto_2312 ) ( not ( = ?auto_2322 ?auto_2316 ) ) ( HOIST-AT ?auto_2325 ?auto_2322 ) ( SURFACE-AT ?auto_2312 ?auto_2322 ) ( ON ?auto_2312 ?auto_2328 ) ( CLEAR ?auto_2312 ) ( not ( = ?auto_2311 ?auto_2312 ) ) ( not ( = ?auto_2311 ?auto_2328 ) ) ( not ( = ?auto_2312 ?auto_2328 ) ) ( not ( = ?auto_2317 ?auto_2325 ) ) ( IS-CRATE ?auto_2311 ) ( not ( = ?auto_2326 ?auto_2316 ) ) ( HOIST-AT ?auto_2331 ?auto_2326 ) ( AVAILABLE ?auto_2331 ) ( SURFACE-AT ?auto_2311 ?auto_2326 ) ( ON ?auto_2311 ?auto_2329 ) ( CLEAR ?auto_2311 ) ( not ( = ?auto_2310 ?auto_2311 ) ) ( not ( = ?auto_2310 ?auto_2329 ) ) ( not ( = ?auto_2311 ?auto_2329 ) ) ( not ( = ?auto_2317 ?auto_2331 ) ) ( IS-CRATE ?auto_2310 ) ( AVAILABLE ?auto_2327 ) ( SURFACE-AT ?auto_2310 ?auto_2321 ) ( ON ?auto_2310 ?auto_2330 ) ( CLEAR ?auto_2310 ) ( not ( = ?auto_2309 ?auto_2310 ) ) ( not ( = ?auto_2309 ?auto_2330 ) ) ( not ( = ?auto_2310 ?auto_2330 ) ) ( SURFACE-AT ?auto_2308 ?auto_2316 ) ( CLEAR ?auto_2308 ) ( IS-CRATE ?auto_2309 ) ( AVAILABLE ?auto_2317 ) ( AVAILABLE ?auto_2325 ) ( SURFACE-AT ?auto_2309 ?auto_2322 ) ( ON ?auto_2309 ?auto_2324 ) ( CLEAR ?auto_2309 ) ( TRUCK-AT ?auto_2320 ?auto_2316 ) ( not ( = ?auto_2308 ?auto_2309 ) ) ( not ( = ?auto_2308 ?auto_2324 ) ) ( not ( = ?auto_2309 ?auto_2324 ) ) ( not ( = ?auto_2308 ?auto_2310 ) ) ( not ( = ?auto_2308 ?auto_2330 ) ) ( not ( = ?auto_2310 ?auto_2324 ) ) ( not ( = ?auto_2321 ?auto_2322 ) ) ( not ( = ?auto_2327 ?auto_2325 ) ) ( not ( = ?auto_2330 ?auto_2324 ) ) ( not ( = ?auto_2308 ?auto_2311 ) ) ( not ( = ?auto_2308 ?auto_2329 ) ) ( not ( = ?auto_2309 ?auto_2311 ) ) ( not ( = ?auto_2309 ?auto_2329 ) ) ( not ( = ?auto_2311 ?auto_2330 ) ) ( not ( = ?auto_2311 ?auto_2324 ) ) ( not ( = ?auto_2326 ?auto_2321 ) ) ( not ( = ?auto_2326 ?auto_2322 ) ) ( not ( = ?auto_2331 ?auto_2327 ) ) ( not ( = ?auto_2331 ?auto_2325 ) ) ( not ( = ?auto_2329 ?auto_2330 ) ) ( not ( = ?auto_2329 ?auto_2324 ) ) ( not ( = ?auto_2308 ?auto_2312 ) ) ( not ( = ?auto_2308 ?auto_2328 ) ) ( not ( = ?auto_2309 ?auto_2312 ) ) ( not ( = ?auto_2309 ?auto_2328 ) ) ( not ( = ?auto_2310 ?auto_2312 ) ) ( not ( = ?auto_2310 ?auto_2328 ) ) ( not ( = ?auto_2312 ?auto_2329 ) ) ( not ( = ?auto_2312 ?auto_2330 ) ) ( not ( = ?auto_2312 ?auto_2324 ) ) ( not ( = ?auto_2328 ?auto_2329 ) ) ( not ( = ?auto_2328 ?auto_2330 ) ) ( not ( = ?auto_2328 ?auto_2324 ) ) ( not ( = ?auto_2308 ?auto_2314 ) ) ( not ( = ?auto_2308 ?auto_2323 ) ) ( not ( = ?auto_2309 ?auto_2314 ) ) ( not ( = ?auto_2309 ?auto_2323 ) ) ( not ( = ?auto_2310 ?auto_2314 ) ) ( not ( = ?auto_2310 ?auto_2323 ) ) ( not ( = ?auto_2311 ?auto_2314 ) ) ( not ( = ?auto_2311 ?auto_2323 ) ) ( not ( = ?auto_2314 ?auto_2328 ) ) ( not ( = ?auto_2314 ?auto_2329 ) ) ( not ( = ?auto_2314 ?auto_2330 ) ) ( not ( = ?auto_2314 ?auto_2324 ) ) ( not ( = ?auto_2323 ?auto_2328 ) ) ( not ( = ?auto_2323 ?auto_2329 ) ) ( not ( = ?auto_2323 ?auto_2330 ) ) ( not ( = ?auto_2323 ?auto_2324 ) ) ( not ( = ?auto_2308 ?auto_2313 ) ) ( not ( = ?auto_2308 ?auto_2319 ) ) ( not ( = ?auto_2309 ?auto_2313 ) ) ( not ( = ?auto_2309 ?auto_2319 ) ) ( not ( = ?auto_2310 ?auto_2313 ) ) ( not ( = ?auto_2310 ?auto_2319 ) ) ( not ( = ?auto_2311 ?auto_2313 ) ) ( not ( = ?auto_2311 ?auto_2319 ) ) ( not ( = ?auto_2312 ?auto_2313 ) ) ( not ( = ?auto_2312 ?auto_2319 ) ) ( not ( = ?auto_2313 ?auto_2323 ) ) ( not ( = ?auto_2313 ?auto_2328 ) ) ( not ( = ?auto_2313 ?auto_2329 ) ) ( not ( = ?auto_2313 ?auto_2330 ) ) ( not ( = ?auto_2313 ?auto_2324 ) ) ( not ( = ?auto_2315 ?auto_2321 ) ) ( not ( = ?auto_2315 ?auto_2322 ) ) ( not ( = ?auto_2315 ?auto_2326 ) ) ( not ( = ?auto_2318 ?auto_2327 ) ) ( not ( = ?auto_2318 ?auto_2325 ) ) ( not ( = ?auto_2318 ?auto_2331 ) ) ( not ( = ?auto_2319 ?auto_2323 ) ) ( not ( = ?auto_2319 ?auto_2328 ) ) ( not ( = ?auto_2319 ?auto_2329 ) ) ( not ( = ?auto_2319 ?auto_2330 ) ) ( not ( = ?auto_2319 ?auto_2324 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2308 ?auto_2309 ?auto_2310 ?auto_2311 ?auto_2312 ?auto_2314 )
      ( MAKE-1CRATE ?auto_2314 ?auto_2313 )
      ( MAKE-6CRATE-VERIFY ?auto_2308 ?auto_2309 ?auto_2310 ?auto_2311 ?auto_2312 ?auto_2314 ?auto_2313 ) )
  )

)

