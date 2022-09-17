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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2180 - SURFACE
      ?auto_2181 - SURFACE
      ?auto_2182 - SURFACE
    )
    :vars
    (
      ?auto_2183 - HOIST
      ?auto_2187 - PLACE
      ?auto_2188 - PLACE
      ?auto_2186 - HOIST
      ?auto_2185 - SURFACE
      ?auto_2190 - PLACE
      ?auto_2189 - HOIST
      ?auto_2191 - SURFACE
      ?auto_2184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2183 ?auto_2187 ) ( IS-CRATE ?auto_2182 ) ( not ( = ?auto_2188 ?auto_2187 ) ) ( HOIST-AT ?auto_2186 ?auto_2188 ) ( AVAILABLE ?auto_2186 ) ( SURFACE-AT ?auto_2182 ?auto_2188 ) ( ON ?auto_2182 ?auto_2185 ) ( CLEAR ?auto_2182 ) ( not ( = ?auto_2181 ?auto_2182 ) ) ( not ( = ?auto_2181 ?auto_2185 ) ) ( not ( = ?auto_2182 ?auto_2185 ) ) ( not ( = ?auto_2183 ?auto_2186 ) ) ( SURFACE-AT ?auto_2180 ?auto_2187 ) ( CLEAR ?auto_2180 ) ( IS-CRATE ?auto_2181 ) ( AVAILABLE ?auto_2183 ) ( not ( = ?auto_2190 ?auto_2187 ) ) ( HOIST-AT ?auto_2189 ?auto_2190 ) ( AVAILABLE ?auto_2189 ) ( SURFACE-AT ?auto_2181 ?auto_2190 ) ( ON ?auto_2181 ?auto_2191 ) ( CLEAR ?auto_2181 ) ( TRUCK-AT ?auto_2184 ?auto_2187 ) ( not ( = ?auto_2180 ?auto_2181 ) ) ( not ( = ?auto_2180 ?auto_2191 ) ) ( not ( = ?auto_2181 ?auto_2191 ) ) ( not ( = ?auto_2183 ?auto_2189 ) ) ( not ( = ?auto_2180 ?auto_2182 ) ) ( not ( = ?auto_2180 ?auto_2185 ) ) ( not ( = ?auto_2182 ?auto_2191 ) ) ( not ( = ?auto_2188 ?auto_2190 ) ) ( not ( = ?auto_2186 ?auto_2189 ) ) ( not ( = ?auto_2185 ?auto_2191 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2180 ?auto_2181 )
      ( MAKE-1CRATE ?auto_2181 ?auto_2182 )
      ( MAKE-2CRATE-VERIFY ?auto_2180 ?auto_2181 ?auto_2182 ) )
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
      ?auto_2212 - HOIST
      ?auto_2214 - PLACE
      ?auto_2213 - PLACE
      ?auto_2210 - HOIST
      ?auto_2211 - SURFACE
      ?auto_2217 - PLACE
      ?auto_2216 - HOIST
      ?auto_2221 - SURFACE
      ?auto_2219 - PLACE
      ?auto_2218 - HOIST
      ?auto_2220 - SURFACE
      ?auto_2215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2212 ?auto_2214 ) ( IS-CRATE ?auto_2209 ) ( not ( = ?auto_2213 ?auto_2214 ) ) ( HOIST-AT ?auto_2210 ?auto_2213 ) ( AVAILABLE ?auto_2210 ) ( SURFACE-AT ?auto_2209 ?auto_2213 ) ( ON ?auto_2209 ?auto_2211 ) ( CLEAR ?auto_2209 ) ( not ( = ?auto_2208 ?auto_2209 ) ) ( not ( = ?auto_2208 ?auto_2211 ) ) ( not ( = ?auto_2209 ?auto_2211 ) ) ( not ( = ?auto_2212 ?auto_2210 ) ) ( IS-CRATE ?auto_2208 ) ( not ( = ?auto_2217 ?auto_2214 ) ) ( HOIST-AT ?auto_2216 ?auto_2217 ) ( AVAILABLE ?auto_2216 ) ( SURFACE-AT ?auto_2208 ?auto_2217 ) ( ON ?auto_2208 ?auto_2221 ) ( CLEAR ?auto_2208 ) ( not ( = ?auto_2207 ?auto_2208 ) ) ( not ( = ?auto_2207 ?auto_2221 ) ) ( not ( = ?auto_2208 ?auto_2221 ) ) ( not ( = ?auto_2212 ?auto_2216 ) ) ( SURFACE-AT ?auto_2206 ?auto_2214 ) ( CLEAR ?auto_2206 ) ( IS-CRATE ?auto_2207 ) ( AVAILABLE ?auto_2212 ) ( not ( = ?auto_2219 ?auto_2214 ) ) ( HOIST-AT ?auto_2218 ?auto_2219 ) ( AVAILABLE ?auto_2218 ) ( SURFACE-AT ?auto_2207 ?auto_2219 ) ( ON ?auto_2207 ?auto_2220 ) ( CLEAR ?auto_2207 ) ( TRUCK-AT ?auto_2215 ?auto_2214 ) ( not ( = ?auto_2206 ?auto_2207 ) ) ( not ( = ?auto_2206 ?auto_2220 ) ) ( not ( = ?auto_2207 ?auto_2220 ) ) ( not ( = ?auto_2212 ?auto_2218 ) ) ( not ( = ?auto_2206 ?auto_2208 ) ) ( not ( = ?auto_2206 ?auto_2221 ) ) ( not ( = ?auto_2208 ?auto_2220 ) ) ( not ( = ?auto_2217 ?auto_2219 ) ) ( not ( = ?auto_2216 ?auto_2218 ) ) ( not ( = ?auto_2221 ?auto_2220 ) ) ( not ( = ?auto_2206 ?auto_2209 ) ) ( not ( = ?auto_2206 ?auto_2211 ) ) ( not ( = ?auto_2207 ?auto_2209 ) ) ( not ( = ?auto_2207 ?auto_2211 ) ) ( not ( = ?auto_2209 ?auto_2221 ) ) ( not ( = ?auto_2209 ?auto_2220 ) ) ( not ( = ?auto_2213 ?auto_2217 ) ) ( not ( = ?auto_2213 ?auto_2219 ) ) ( not ( = ?auto_2210 ?auto_2216 ) ) ( not ( = ?auto_2210 ?auto_2218 ) ) ( not ( = ?auto_2211 ?auto_2221 ) ) ( not ( = ?auto_2211 ?auto_2220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2206 ?auto_2207 ?auto_2208 )
      ( MAKE-1CRATE ?auto_2208 ?auto_2209 )
      ( MAKE-3CRATE-VERIFY ?auto_2206 ?auto_2207 ?auto_2208 ?auto_2209 ) )
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
      ?auto_2245 - HOIST
      ?auto_2242 - PLACE
      ?auto_2246 - PLACE
      ?auto_2243 - HOIST
      ?auto_2247 - SURFACE
      ?auto_2250 - PLACE
      ?auto_2252 - HOIST
      ?auto_2249 - SURFACE
      ?auto_2254 - PLACE
      ?auto_2253 - HOIST
      ?auto_2251 - SURFACE
      ?auto_2248 - SURFACE
      ?auto_2244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2245 ?auto_2242 ) ( IS-CRATE ?auto_2241 ) ( not ( = ?auto_2246 ?auto_2242 ) ) ( HOIST-AT ?auto_2243 ?auto_2246 ) ( SURFACE-AT ?auto_2241 ?auto_2246 ) ( ON ?auto_2241 ?auto_2247 ) ( CLEAR ?auto_2241 ) ( not ( = ?auto_2240 ?auto_2241 ) ) ( not ( = ?auto_2240 ?auto_2247 ) ) ( not ( = ?auto_2241 ?auto_2247 ) ) ( not ( = ?auto_2245 ?auto_2243 ) ) ( IS-CRATE ?auto_2240 ) ( not ( = ?auto_2250 ?auto_2242 ) ) ( HOIST-AT ?auto_2252 ?auto_2250 ) ( AVAILABLE ?auto_2252 ) ( SURFACE-AT ?auto_2240 ?auto_2250 ) ( ON ?auto_2240 ?auto_2249 ) ( CLEAR ?auto_2240 ) ( not ( = ?auto_2239 ?auto_2240 ) ) ( not ( = ?auto_2239 ?auto_2249 ) ) ( not ( = ?auto_2240 ?auto_2249 ) ) ( not ( = ?auto_2245 ?auto_2252 ) ) ( IS-CRATE ?auto_2239 ) ( not ( = ?auto_2254 ?auto_2242 ) ) ( HOIST-AT ?auto_2253 ?auto_2254 ) ( AVAILABLE ?auto_2253 ) ( SURFACE-AT ?auto_2239 ?auto_2254 ) ( ON ?auto_2239 ?auto_2251 ) ( CLEAR ?auto_2239 ) ( not ( = ?auto_2238 ?auto_2239 ) ) ( not ( = ?auto_2238 ?auto_2251 ) ) ( not ( = ?auto_2239 ?auto_2251 ) ) ( not ( = ?auto_2245 ?auto_2253 ) ) ( SURFACE-AT ?auto_2237 ?auto_2242 ) ( CLEAR ?auto_2237 ) ( IS-CRATE ?auto_2238 ) ( AVAILABLE ?auto_2245 ) ( AVAILABLE ?auto_2243 ) ( SURFACE-AT ?auto_2238 ?auto_2246 ) ( ON ?auto_2238 ?auto_2248 ) ( CLEAR ?auto_2238 ) ( TRUCK-AT ?auto_2244 ?auto_2242 ) ( not ( = ?auto_2237 ?auto_2238 ) ) ( not ( = ?auto_2237 ?auto_2248 ) ) ( not ( = ?auto_2238 ?auto_2248 ) ) ( not ( = ?auto_2237 ?auto_2239 ) ) ( not ( = ?auto_2237 ?auto_2251 ) ) ( not ( = ?auto_2239 ?auto_2248 ) ) ( not ( = ?auto_2254 ?auto_2246 ) ) ( not ( = ?auto_2253 ?auto_2243 ) ) ( not ( = ?auto_2251 ?auto_2248 ) ) ( not ( = ?auto_2237 ?auto_2240 ) ) ( not ( = ?auto_2237 ?auto_2249 ) ) ( not ( = ?auto_2238 ?auto_2240 ) ) ( not ( = ?auto_2238 ?auto_2249 ) ) ( not ( = ?auto_2240 ?auto_2251 ) ) ( not ( = ?auto_2240 ?auto_2248 ) ) ( not ( = ?auto_2250 ?auto_2254 ) ) ( not ( = ?auto_2250 ?auto_2246 ) ) ( not ( = ?auto_2252 ?auto_2253 ) ) ( not ( = ?auto_2252 ?auto_2243 ) ) ( not ( = ?auto_2249 ?auto_2251 ) ) ( not ( = ?auto_2249 ?auto_2248 ) ) ( not ( = ?auto_2237 ?auto_2241 ) ) ( not ( = ?auto_2237 ?auto_2247 ) ) ( not ( = ?auto_2238 ?auto_2241 ) ) ( not ( = ?auto_2238 ?auto_2247 ) ) ( not ( = ?auto_2239 ?auto_2241 ) ) ( not ( = ?auto_2239 ?auto_2247 ) ) ( not ( = ?auto_2241 ?auto_2249 ) ) ( not ( = ?auto_2241 ?auto_2251 ) ) ( not ( = ?auto_2241 ?auto_2248 ) ) ( not ( = ?auto_2247 ?auto_2249 ) ) ( not ( = ?auto_2247 ?auto_2251 ) ) ( not ( = ?auto_2247 ?auto_2248 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2237 ?auto_2238 ?auto_2239 ?auto_2240 )
      ( MAKE-1CRATE ?auto_2240 ?auto_2241 )
      ( MAKE-4CRATE-VERIFY ?auto_2237 ?auto_2238 ?auto_2239 ?auto_2240 ?auto_2241 ) )
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
      ?auto_2278 - PLACE
      ?auto_2277 - PLACE
      ?auto_2279 - HOIST
      ?auto_2282 - SURFACE
      ?auto_2285 - PLACE
      ?auto_2284 - HOIST
      ?auto_2288 - SURFACE
      ?auto_2290 - PLACE
      ?auto_2286 - HOIST
      ?auto_2287 - SURFACE
      ?auto_2283 - SURFACE
      ?auto_2289 - SURFACE
      ?auto_2281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2280 ?auto_2278 ) ( IS-CRATE ?auto_2276 ) ( not ( = ?auto_2277 ?auto_2278 ) ) ( HOIST-AT ?auto_2279 ?auto_2277 ) ( SURFACE-AT ?auto_2276 ?auto_2277 ) ( ON ?auto_2276 ?auto_2282 ) ( CLEAR ?auto_2276 ) ( not ( = ?auto_2275 ?auto_2276 ) ) ( not ( = ?auto_2275 ?auto_2282 ) ) ( not ( = ?auto_2276 ?auto_2282 ) ) ( not ( = ?auto_2280 ?auto_2279 ) ) ( IS-CRATE ?auto_2275 ) ( not ( = ?auto_2285 ?auto_2278 ) ) ( HOIST-AT ?auto_2284 ?auto_2285 ) ( SURFACE-AT ?auto_2275 ?auto_2285 ) ( ON ?auto_2275 ?auto_2288 ) ( CLEAR ?auto_2275 ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( not ( = ?auto_2274 ?auto_2288 ) ) ( not ( = ?auto_2275 ?auto_2288 ) ) ( not ( = ?auto_2280 ?auto_2284 ) ) ( IS-CRATE ?auto_2274 ) ( not ( = ?auto_2290 ?auto_2278 ) ) ( HOIST-AT ?auto_2286 ?auto_2290 ) ( AVAILABLE ?auto_2286 ) ( SURFACE-AT ?auto_2274 ?auto_2290 ) ( ON ?auto_2274 ?auto_2287 ) ( CLEAR ?auto_2274 ) ( not ( = ?auto_2273 ?auto_2274 ) ) ( not ( = ?auto_2273 ?auto_2287 ) ) ( not ( = ?auto_2274 ?auto_2287 ) ) ( not ( = ?auto_2280 ?auto_2286 ) ) ( IS-CRATE ?auto_2273 ) ( AVAILABLE ?auto_2279 ) ( SURFACE-AT ?auto_2273 ?auto_2277 ) ( ON ?auto_2273 ?auto_2283 ) ( CLEAR ?auto_2273 ) ( not ( = ?auto_2272 ?auto_2273 ) ) ( not ( = ?auto_2272 ?auto_2283 ) ) ( not ( = ?auto_2273 ?auto_2283 ) ) ( SURFACE-AT ?auto_2271 ?auto_2278 ) ( CLEAR ?auto_2271 ) ( IS-CRATE ?auto_2272 ) ( AVAILABLE ?auto_2280 ) ( AVAILABLE ?auto_2284 ) ( SURFACE-AT ?auto_2272 ?auto_2285 ) ( ON ?auto_2272 ?auto_2289 ) ( CLEAR ?auto_2272 ) ( TRUCK-AT ?auto_2281 ?auto_2278 ) ( not ( = ?auto_2271 ?auto_2272 ) ) ( not ( = ?auto_2271 ?auto_2289 ) ) ( not ( = ?auto_2272 ?auto_2289 ) ) ( not ( = ?auto_2271 ?auto_2273 ) ) ( not ( = ?auto_2271 ?auto_2283 ) ) ( not ( = ?auto_2273 ?auto_2289 ) ) ( not ( = ?auto_2277 ?auto_2285 ) ) ( not ( = ?auto_2279 ?auto_2284 ) ) ( not ( = ?auto_2283 ?auto_2289 ) ) ( not ( = ?auto_2271 ?auto_2274 ) ) ( not ( = ?auto_2271 ?auto_2287 ) ) ( not ( = ?auto_2272 ?auto_2274 ) ) ( not ( = ?auto_2272 ?auto_2287 ) ) ( not ( = ?auto_2274 ?auto_2283 ) ) ( not ( = ?auto_2274 ?auto_2289 ) ) ( not ( = ?auto_2290 ?auto_2277 ) ) ( not ( = ?auto_2290 ?auto_2285 ) ) ( not ( = ?auto_2286 ?auto_2279 ) ) ( not ( = ?auto_2286 ?auto_2284 ) ) ( not ( = ?auto_2287 ?auto_2283 ) ) ( not ( = ?auto_2287 ?auto_2289 ) ) ( not ( = ?auto_2271 ?auto_2275 ) ) ( not ( = ?auto_2271 ?auto_2288 ) ) ( not ( = ?auto_2272 ?auto_2275 ) ) ( not ( = ?auto_2272 ?auto_2288 ) ) ( not ( = ?auto_2273 ?auto_2275 ) ) ( not ( = ?auto_2273 ?auto_2288 ) ) ( not ( = ?auto_2275 ?auto_2287 ) ) ( not ( = ?auto_2275 ?auto_2283 ) ) ( not ( = ?auto_2275 ?auto_2289 ) ) ( not ( = ?auto_2288 ?auto_2287 ) ) ( not ( = ?auto_2288 ?auto_2283 ) ) ( not ( = ?auto_2288 ?auto_2289 ) ) ( not ( = ?auto_2271 ?auto_2276 ) ) ( not ( = ?auto_2271 ?auto_2282 ) ) ( not ( = ?auto_2272 ?auto_2276 ) ) ( not ( = ?auto_2272 ?auto_2282 ) ) ( not ( = ?auto_2273 ?auto_2276 ) ) ( not ( = ?auto_2273 ?auto_2282 ) ) ( not ( = ?auto_2274 ?auto_2276 ) ) ( not ( = ?auto_2274 ?auto_2282 ) ) ( not ( = ?auto_2276 ?auto_2288 ) ) ( not ( = ?auto_2276 ?auto_2287 ) ) ( not ( = ?auto_2276 ?auto_2283 ) ) ( not ( = ?auto_2276 ?auto_2289 ) ) ( not ( = ?auto_2282 ?auto_2288 ) ) ( not ( = ?auto_2282 ?auto_2287 ) ) ( not ( = ?auto_2282 ?auto_2283 ) ) ( not ( = ?auto_2282 ?auto_2289 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2271 ?auto_2272 ?auto_2273 ?auto_2274 ?auto_2275 )
      ( MAKE-1CRATE ?auto_2275 ?auto_2276 )
      ( MAKE-5CRATE-VERIFY ?auto_2271 ?auto_2272 ?auto_2273 ?auto_2274 ?auto_2275 ?auto_2276 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2308 - SURFACE
      ?auto_2309 - SURFACE
      ?auto_2310 - SURFACE
      ?auto_2311 - SURFACE
      ?auto_2312 - SURFACE
      ?auto_2313 - SURFACE
      ?auto_2314 - SURFACE
    )
    :vars
    (
      ?auto_2319 - HOIST
      ?auto_2316 - PLACE
      ?auto_2317 - PLACE
      ?auto_2318 - HOIST
      ?auto_2320 - SURFACE
      ?auto_2329 - PLACE
      ?auto_2321 - HOIST
      ?auto_2330 - SURFACE
      ?auto_2322 - PLACE
      ?auto_2325 - HOIST
      ?auto_2327 - SURFACE
      ?auto_2326 - PLACE
      ?auto_2323 - HOIST
      ?auto_2328 - SURFACE
      ?auto_2324 - SURFACE
      ?auto_2331 - SURFACE
      ?auto_2315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2319 ?auto_2316 ) ( IS-CRATE ?auto_2314 ) ( not ( = ?auto_2317 ?auto_2316 ) ) ( HOIST-AT ?auto_2318 ?auto_2317 ) ( AVAILABLE ?auto_2318 ) ( SURFACE-AT ?auto_2314 ?auto_2317 ) ( ON ?auto_2314 ?auto_2320 ) ( CLEAR ?auto_2314 ) ( not ( = ?auto_2313 ?auto_2314 ) ) ( not ( = ?auto_2313 ?auto_2320 ) ) ( not ( = ?auto_2314 ?auto_2320 ) ) ( not ( = ?auto_2319 ?auto_2318 ) ) ( IS-CRATE ?auto_2313 ) ( not ( = ?auto_2329 ?auto_2316 ) ) ( HOIST-AT ?auto_2321 ?auto_2329 ) ( SURFACE-AT ?auto_2313 ?auto_2329 ) ( ON ?auto_2313 ?auto_2330 ) ( CLEAR ?auto_2313 ) ( not ( = ?auto_2312 ?auto_2313 ) ) ( not ( = ?auto_2312 ?auto_2330 ) ) ( not ( = ?auto_2313 ?auto_2330 ) ) ( not ( = ?auto_2319 ?auto_2321 ) ) ( IS-CRATE ?auto_2312 ) ( not ( = ?auto_2322 ?auto_2316 ) ) ( HOIST-AT ?auto_2325 ?auto_2322 ) ( SURFACE-AT ?auto_2312 ?auto_2322 ) ( ON ?auto_2312 ?auto_2327 ) ( CLEAR ?auto_2312 ) ( not ( = ?auto_2311 ?auto_2312 ) ) ( not ( = ?auto_2311 ?auto_2327 ) ) ( not ( = ?auto_2312 ?auto_2327 ) ) ( not ( = ?auto_2319 ?auto_2325 ) ) ( IS-CRATE ?auto_2311 ) ( not ( = ?auto_2326 ?auto_2316 ) ) ( HOIST-AT ?auto_2323 ?auto_2326 ) ( AVAILABLE ?auto_2323 ) ( SURFACE-AT ?auto_2311 ?auto_2326 ) ( ON ?auto_2311 ?auto_2328 ) ( CLEAR ?auto_2311 ) ( not ( = ?auto_2310 ?auto_2311 ) ) ( not ( = ?auto_2310 ?auto_2328 ) ) ( not ( = ?auto_2311 ?auto_2328 ) ) ( not ( = ?auto_2319 ?auto_2323 ) ) ( IS-CRATE ?auto_2310 ) ( AVAILABLE ?auto_2321 ) ( SURFACE-AT ?auto_2310 ?auto_2329 ) ( ON ?auto_2310 ?auto_2324 ) ( CLEAR ?auto_2310 ) ( not ( = ?auto_2309 ?auto_2310 ) ) ( not ( = ?auto_2309 ?auto_2324 ) ) ( not ( = ?auto_2310 ?auto_2324 ) ) ( SURFACE-AT ?auto_2308 ?auto_2316 ) ( CLEAR ?auto_2308 ) ( IS-CRATE ?auto_2309 ) ( AVAILABLE ?auto_2319 ) ( AVAILABLE ?auto_2325 ) ( SURFACE-AT ?auto_2309 ?auto_2322 ) ( ON ?auto_2309 ?auto_2331 ) ( CLEAR ?auto_2309 ) ( TRUCK-AT ?auto_2315 ?auto_2316 ) ( not ( = ?auto_2308 ?auto_2309 ) ) ( not ( = ?auto_2308 ?auto_2331 ) ) ( not ( = ?auto_2309 ?auto_2331 ) ) ( not ( = ?auto_2308 ?auto_2310 ) ) ( not ( = ?auto_2308 ?auto_2324 ) ) ( not ( = ?auto_2310 ?auto_2331 ) ) ( not ( = ?auto_2329 ?auto_2322 ) ) ( not ( = ?auto_2321 ?auto_2325 ) ) ( not ( = ?auto_2324 ?auto_2331 ) ) ( not ( = ?auto_2308 ?auto_2311 ) ) ( not ( = ?auto_2308 ?auto_2328 ) ) ( not ( = ?auto_2309 ?auto_2311 ) ) ( not ( = ?auto_2309 ?auto_2328 ) ) ( not ( = ?auto_2311 ?auto_2324 ) ) ( not ( = ?auto_2311 ?auto_2331 ) ) ( not ( = ?auto_2326 ?auto_2329 ) ) ( not ( = ?auto_2326 ?auto_2322 ) ) ( not ( = ?auto_2323 ?auto_2321 ) ) ( not ( = ?auto_2323 ?auto_2325 ) ) ( not ( = ?auto_2328 ?auto_2324 ) ) ( not ( = ?auto_2328 ?auto_2331 ) ) ( not ( = ?auto_2308 ?auto_2312 ) ) ( not ( = ?auto_2308 ?auto_2327 ) ) ( not ( = ?auto_2309 ?auto_2312 ) ) ( not ( = ?auto_2309 ?auto_2327 ) ) ( not ( = ?auto_2310 ?auto_2312 ) ) ( not ( = ?auto_2310 ?auto_2327 ) ) ( not ( = ?auto_2312 ?auto_2328 ) ) ( not ( = ?auto_2312 ?auto_2324 ) ) ( not ( = ?auto_2312 ?auto_2331 ) ) ( not ( = ?auto_2327 ?auto_2328 ) ) ( not ( = ?auto_2327 ?auto_2324 ) ) ( not ( = ?auto_2327 ?auto_2331 ) ) ( not ( = ?auto_2308 ?auto_2313 ) ) ( not ( = ?auto_2308 ?auto_2330 ) ) ( not ( = ?auto_2309 ?auto_2313 ) ) ( not ( = ?auto_2309 ?auto_2330 ) ) ( not ( = ?auto_2310 ?auto_2313 ) ) ( not ( = ?auto_2310 ?auto_2330 ) ) ( not ( = ?auto_2311 ?auto_2313 ) ) ( not ( = ?auto_2311 ?auto_2330 ) ) ( not ( = ?auto_2313 ?auto_2327 ) ) ( not ( = ?auto_2313 ?auto_2328 ) ) ( not ( = ?auto_2313 ?auto_2324 ) ) ( not ( = ?auto_2313 ?auto_2331 ) ) ( not ( = ?auto_2330 ?auto_2327 ) ) ( not ( = ?auto_2330 ?auto_2328 ) ) ( not ( = ?auto_2330 ?auto_2324 ) ) ( not ( = ?auto_2330 ?auto_2331 ) ) ( not ( = ?auto_2308 ?auto_2314 ) ) ( not ( = ?auto_2308 ?auto_2320 ) ) ( not ( = ?auto_2309 ?auto_2314 ) ) ( not ( = ?auto_2309 ?auto_2320 ) ) ( not ( = ?auto_2310 ?auto_2314 ) ) ( not ( = ?auto_2310 ?auto_2320 ) ) ( not ( = ?auto_2311 ?auto_2314 ) ) ( not ( = ?auto_2311 ?auto_2320 ) ) ( not ( = ?auto_2312 ?auto_2314 ) ) ( not ( = ?auto_2312 ?auto_2320 ) ) ( not ( = ?auto_2314 ?auto_2330 ) ) ( not ( = ?auto_2314 ?auto_2327 ) ) ( not ( = ?auto_2314 ?auto_2328 ) ) ( not ( = ?auto_2314 ?auto_2324 ) ) ( not ( = ?auto_2314 ?auto_2331 ) ) ( not ( = ?auto_2317 ?auto_2329 ) ) ( not ( = ?auto_2317 ?auto_2322 ) ) ( not ( = ?auto_2317 ?auto_2326 ) ) ( not ( = ?auto_2318 ?auto_2321 ) ) ( not ( = ?auto_2318 ?auto_2325 ) ) ( not ( = ?auto_2318 ?auto_2323 ) ) ( not ( = ?auto_2320 ?auto_2330 ) ) ( not ( = ?auto_2320 ?auto_2327 ) ) ( not ( = ?auto_2320 ?auto_2328 ) ) ( not ( = ?auto_2320 ?auto_2324 ) ) ( not ( = ?auto_2320 ?auto_2331 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2308 ?auto_2309 ?auto_2310 ?auto_2311 ?auto_2312 ?auto_2313 )
      ( MAKE-1CRATE ?auto_2313 ?auto_2314 )
      ( MAKE-6CRATE-VERIFY ?auto_2308 ?auto_2309 ?auto_2310 ?auto_2311 ?auto_2312 ?auto_2313 ?auto_2314 ) )
  )

)

