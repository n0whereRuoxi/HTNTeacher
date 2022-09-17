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
      ?auto_2202 - SURFACE
      ?auto_2203 - SURFACE
    )
    :vars
    (
      ?auto_2204 - HOIST
      ?auto_2205 - PLACE
      ?auto_2207 - PLACE
      ?auto_2208 - HOIST
      ?auto_2209 - SURFACE
      ?auto_2206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2204 ?auto_2205 ) ( SURFACE-AT ?auto_2203 ?auto_2205 ) ( CLEAR ?auto_2203 ) ( IS-CRATE ?auto_2202 ) ( AVAILABLE ?auto_2204 ) ( not ( = ?auto_2207 ?auto_2205 ) ) ( HOIST-AT ?auto_2208 ?auto_2207 ) ( AVAILABLE ?auto_2208 ) ( SURFACE-AT ?auto_2202 ?auto_2207 ) ( ON ?auto_2202 ?auto_2209 ) ( CLEAR ?auto_2202 ) ( TRUCK-AT ?auto_2206 ?auto_2205 ) ( not ( = ?auto_2202 ?auto_2203 ) ) ( not ( = ?auto_2202 ?auto_2209 ) ) ( not ( = ?auto_2203 ?auto_2209 ) ) ( not ( = ?auto_2204 ?auto_2208 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2206 ?auto_2205 ?auto_2207 )
      ( !LIFT ?auto_2208 ?auto_2202 ?auto_2209 ?auto_2207 )
      ( !LOAD ?auto_2208 ?auto_2202 ?auto_2206 ?auto_2207 )
      ( !DRIVE ?auto_2206 ?auto_2207 ?auto_2205 )
      ( !UNLOAD ?auto_2204 ?auto_2202 ?auto_2206 ?auto_2205 )
      ( !DROP ?auto_2204 ?auto_2202 ?auto_2203 ?auto_2205 )
      ( MAKE-ON-VERIFY ?auto_2202 ?auto_2203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2212 - SURFACE
      ?auto_2213 - SURFACE
    )
    :vars
    (
      ?auto_2214 - HOIST
      ?auto_2215 - PLACE
      ?auto_2217 - PLACE
      ?auto_2218 - HOIST
      ?auto_2219 - SURFACE
      ?auto_2216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2214 ?auto_2215 ) ( SURFACE-AT ?auto_2213 ?auto_2215 ) ( CLEAR ?auto_2213 ) ( IS-CRATE ?auto_2212 ) ( AVAILABLE ?auto_2214 ) ( not ( = ?auto_2217 ?auto_2215 ) ) ( HOIST-AT ?auto_2218 ?auto_2217 ) ( AVAILABLE ?auto_2218 ) ( SURFACE-AT ?auto_2212 ?auto_2217 ) ( ON ?auto_2212 ?auto_2219 ) ( CLEAR ?auto_2212 ) ( TRUCK-AT ?auto_2216 ?auto_2215 ) ( not ( = ?auto_2212 ?auto_2213 ) ) ( not ( = ?auto_2212 ?auto_2219 ) ) ( not ( = ?auto_2213 ?auto_2219 ) ) ( not ( = ?auto_2214 ?auto_2218 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2216 ?auto_2215 ?auto_2217 )
      ( !LIFT ?auto_2218 ?auto_2212 ?auto_2219 ?auto_2217 )
      ( !LOAD ?auto_2218 ?auto_2212 ?auto_2216 ?auto_2217 )
      ( !DRIVE ?auto_2216 ?auto_2217 ?auto_2215 )
      ( !UNLOAD ?auto_2214 ?auto_2212 ?auto_2216 ?auto_2215 )
      ( !DROP ?auto_2214 ?auto_2212 ?auto_2213 ?auto_2215 )
      ( MAKE-ON-VERIFY ?auto_2212 ?auto_2213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2222 - SURFACE
      ?auto_2223 - SURFACE
    )
    :vars
    (
      ?auto_2224 - HOIST
      ?auto_2225 - PLACE
      ?auto_2227 - PLACE
      ?auto_2228 - HOIST
      ?auto_2229 - SURFACE
      ?auto_2226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2224 ?auto_2225 ) ( SURFACE-AT ?auto_2223 ?auto_2225 ) ( CLEAR ?auto_2223 ) ( IS-CRATE ?auto_2222 ) ( AVAILABLE ?auto_2224 ) ( not ( = ?auto_2227 ?auto_2225 ) ) ( HOIST-AT ?auto_2228 ?auto_2227 ) ( AVAILABLE ?auto_2228 ) ( SURFACE-AT ?auto_2222 ?auto_2227 ) ( ON ?auto_2222 ?auto_2229 ) ( CLEAR ?auto_2222 ) ( TRUCK-AT ?auto_2226 ?auto_2225 ) ( not ( = ?auto_2222 ?auto_2223 ) ) ( not ( = ?auto_2222 ?auto_2229 ) ) ( not ( = ?auto_2223 ?auto_2229 ) ) ( not ( = ?auto_2224 ?auto_2228 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2226 ?auto_2225 ?auto_2227 )
      ( !LIFT ?auto_2228 ?auto_2222 ?auto_2229 ?auto_2227 )
      ( !LOAD ?auto_2228 ?auto_2222 ?auto_2226 ?auto_2227 )
      ( !DRIVE ?auto_2226 ?auto_2227 ?auto_2225 )
      ( !UNLOAD ?auto_2224 ?auto_2222 ?auto_2226 ?auto_2225 )
      ( !DROP ?auto_2224 ?auto_2222 ?auto_2223 ?auto_2225 )
      ( MAKE-ON-VERIFY ?auto_2222 ?auto_2223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2232 - SURFACE
      ?auto_2233 - SURFACE
    )
    :vars
    (
      ?auto_2234 - HOIST
      ?auto_2235 - PLACE
      ?auto_2237 - PLACE
      ?auto_2238 - HOIST
      ?auto_2239 - SURFACE
      ?auto_2236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2234 ?auto_2235 ) ( SURFACE-AT ?auto_2233 ?auto_2235 ) ( CLEAR ?auto_2233 ) ( IS-CRATE ?auto_2232 ) ( AVAILABLE ?auto_2234 ) ( not ( = ?auto_2237 ?auto_2235 ) ) ( HOIST-AT ?auto_2238 ?auto_2237 ) ( AVAILABLE ?auto_2238 ) ( SURFACE-AT ?auto_2232 ?auto_2237 ) ( ON ?auto_2232 ?auto_2239 ) ( CLEAR ?auto_2232 ) ( TRUCK-AT ?auto_2236 ?auto_2235 ) ( not ( = ?auto_2232 ?auto_2233 ) ) ( not ( = ?auto_2232 ?auto_2239 ) ) ( not ( = ?auto_2233 ?auto_2239 ) ) ( not ( = ?auto_2234 ?auto_2238 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2236 ?auto_2235 ?auto_2237 )
      ( !LIFT ?auto_2238 ?auto_2232 ?auto_2239 ?auto_2237 )
      ( !LOAD ?auto_2238 ?auto_2232 ?auto_2236 ?auto_2237 )
      ( !DRIVE ?auto_2236 ?auto_2237 ?auto_2235 )
      ( !UNLOAD ?auto_2234 ?auto_2232 ?auto_2236 ?auto_2235 )
      ( !DROP ?auto_2234 ?auto_2232 ?auto_2233 ?auto_2235 )
      ( MAKE-ON-VERIFY ?auto_2232 ?auto_2233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2242 - SURFACE
      ?auto_2243 - SURFACE
    )
    :vars
    (
      ?auto_2244 - HOIST
      ?auto_2245 - PLACE
      ?auto_2247 - PLACE
      ?auto_2248 - HOIST
      ?auto_2249 - SURFACE
      ?auto_2246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2244 ?auto_2245 ) ( SURFACE-AT ?auto_2243 ?auto_2245 ) ( CLEAR ?auto_2243 ) ( IS-CRATE ?auto_2242 ) ( AVAILABLE ?auto_2244 ) ( not ( = ?auto_2247 ?auto_2245 ) ) ( HOIST-AT ?auto_2248 ?auto_2247 ) ( AVAILABLE ?auto_2248 ) ( SURFACE-AT ?auto_2242 ?auto_2247 ) ( ON ?auto_2242 ?auto_2249 ) ( CLEAR ?auto_2242 ) ( TRUCK-AT ?auto_2246 ?auto_2245 ) ( not ( = ?auto_2242 ?auto_2243 ) ) ( not ( = ?auto_2242 ?auto_2249 ) ) ( not ( = ?auto_2243 ?auto_2249 ) ) ( not ( = ?auto_2244 ?auto_2248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2246 ?auto_2245 ?auto_2247 )
      ( !LIFT ?auto_2248 ?auto_2242 ?auto_2249 ?auto_2247 )
      ( !LOAD ?auto_2248 ?auto_2242 ?auto_2246 ?auto_2247 )
      ( !DRIVE ?auto_2246 ?auto_2247 ?auto_2245 )
      ( !UNLOAD ?auto_2244 ?auto_2242 ?auto_2246 ?auto_2245 )
      ( !DROP ?auto_2244 ?auto_2242 ?auto_2243 ?auto_2245 )
      ( MAKE-ON-VERIFY ?auto_2242 ?auto_2243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2252 - SURFACE
      ?auto_2253 - SURFACE
    )
    :vars
    (
      ?auto_2254 - HOIST
      ?auto_2255 - PLACE
      ?auto_2257 - PLACE
      ?auto_2258 - HOIST
      ?auto_2259 - SURFACE
      ?auto_2256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2254 ?auto_2255 ) ( SURFACE-AT ?auto_2253 ?auto_2255 ) ( CLEAR ?auto_2253 ) ( IS-CRATE ?auto_2252 ) ( AVAILABLE ?auto_2254 ) ( not ( = ?auto_2257 ?auto_2255 ) ) ( HOIST-AT ?auto_2258 ?auto_2257 ) ( AVAILABLE ?auto_2258 ) ( SURFACE-AT ?auto_2252 ?auto_2257 ) ( ON ?auto_2252 ?auto_2259 ) ( CLEAR ?auto_2252 ) ( TRUCK-AT ?auto_2256 ?auto_2255 ) ( not ( = ?auto_2252 ?auto_2253 ) ) ( not ( = ?auto_2252 ?auto_2259 ) ) ( not ( = ?auto_2253 ?auto_2259 ) ) ( not ( = ?auto_2254 ?auto_2258 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2256 ?auto_2255 ?auto_2257 )
      ( !LIFT ?auto_2258 ?auto_2252 ?auto_2259 ?auto_2257 )
      ( !LOAD ?auto_2258 ?auto_2252 ?auto_2256 ?auto_2257 )
      ( !DRIVE ?auto_2256 ?auto_2257 ?auto_2255 )
      ( !UNLOAD ?auto_2254 ?auto_2252 ?auto_2256 ?auto_2255 )
      ( !DROP ?auto_2254 ?auto_2252 ?auto_2253 ?auto_2255 )
      ( MAKE-ON-VERIFY ?auto_2252 ?auto_2253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2262 - SURFACE
      ?auto_2263 - SURFACE
    )
    :vars
    (
      ?auto_2264 - HOIST
      ?auto_2265 - PLACE
      ?auto_2267 - PLACE
      ?auto_2268 - HOIST
      ?auto_2269 - SURFACE
      ?auto_2266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2264 ?auto_2265 ) ( SURFACE-AT ?auto_2263 ?auto_2265 ) ( CLEAR ?auto_2263 ) ( IS-CRATE ?auto_2262 ) ( AVAILABLE ?auto_2264 ) ( not ( = ?auto_2267 ?auto_2265 ) ) ( HOIST-AT ?auto_2268 ?auto_2267 ) ( AVAILABLE ?auto_2268 ) ( SURFACE-AT ?auto_2262 ?auto_2267 ) ( ON ?auto_2262 ?auto_2269 ) ( CLEAR ?auto_2262 ) ( TRUCK-AT ?auto_2266 ?auto_2265 ) ( not ( = ?auto_2262 ?auto_2263 ) ) ( not ( = ?auto_2262 ?auto_2269 ) ) ( not ( = ?auto_2263 ?auto_2269 ) ) ( not ( = ?auto_2264 ?auto_2268 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2266 ?auto_2265 ?auto_2267 )
      ( !LIFT ?auto_2268 ?auto_2262 ?auto_2269 ?auto_2267 )
      ( !LOAD ?auto_2268 ?auto_2262 ?auto_2266 ?auto_2267 )
      ( !DRIVE ?auto_2266 ?auto_2267 ?auto_2265 )
      ( !UNLOAD ?auto_2264 ?auto_2262 ?auto_2266 ?auto_2265 )
      ( !DROP ?auto_2264 ?auto_2262 ?auto_2263 ?auto_2265 )
      ( MAKE-ON-VERIFY ?auto_2262 ?auto_2263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2272 - SURFACE
      ?auto_2273 - SURFACE
    )
    :vars
    (
      ?auto_2274 - HOIST
      ?auto_2275 - PLACE
      ?auto_2277 - PLACE
      ?auto_2278 - HOIST
      ?auto_2279 - SURFACE
      ?auto_2276 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2274 ?auto_2275 ) ( SURFACE-AT ?auto_2273 ?auto_2275 ) ( CLEAR ?auto_2273 ) ( IS-CRATE ?auto_2272 ) ( AVAILABLE ?auto_2274 ) ( not ( = ?auto_2277 ?auto_2275 ) ) ( HOIST-AT ?auto_2278 ?auto_2277 ) ( AVAILABLE ?auto_2278 ) ( SURFACE-AT ?auto_2272 ?auto_2277 ) ( ON ?auto_2272 ?auto_2279 ) ( CLEAR ?auto_2272 ) ( TRUCK-AT ?auto_2276 ?auto_2275 ) ( not ( = ?auto_2272 ?auto_2273 ) ) ( not ( = ?auto_2272 ?auto_2279 ) ) ( not ( = ?auto_2273 ?auto_2279 ) ) ( not ( = ?auto_2274 ?auto_2278 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2276 ?auto_2275 ?auto_2277 )
      ( !LIFT ?auto_2278 ?auto_2272 ?auto_2279 ?auto_2277 )
      ( !LOAD ?auto_2278 ?auto_2272 ?auto_2276 ?auto_2277 )
      ( !DRIVE ?auto_2276 ?auto_2277 ?auto_2275 )
      ( !UNLOAD ?auto_2274 ?auto_2272 ?auto_2276 ?auto_2275 )
      ( !DROP ?auto_2274 ?auto_2272 ?auto_2273 ?auto_2275 )
      ( MAKE-ON-VERIFY ?auto_2272 ?auto_2273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2282 - SURFACE
      ?auto_2283 - SURFACE
    )
    :vars
    (
      ?auto_2284 - HOIST
      ?auto_2285 - PLACE
      ?auto_2287 - PLACE
      ?auto_2288 - HOIST
      ?auto_2289 - SURFACE
      ?auto_2286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2284 ?auto_2285 ) ( SURFACE-AT ?auto_2283 ?auto_2285 ) ( CLEAR ?auto_2283 ) ( IS-CRATE ?auto_2282 ) ( AVAILABLE ?auto_2284 ) ( not ( = ?auto_2287 ?auto_2285 ) ) ( HOIST-AT ?auto_2288 ?auto_2287 ) ( AVAILABLE ?auto_2288 ) ( SURFACE-AT ?auto_2282 ?auto_2287 ) ( ON ?auto_2282 ?auto_2289 ) ( CLEAR ?auto_2282 ) ( TRUCK-AT ?auto_2286 ?auto_2285 ) ( not ( = ?auto_2282 ?auto_2283 ) ) ( not ( = ?auto_2282 ?auto_2289 ) ) ( not ( = ?auto_2283 ?auto_2289 ) ) ( not ( = ?auto_2284 ?auto_2288 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2286 ?auto_2285 ?auto_2287 )
      ( !LIFT ?auto_2288 ?auto_2282 ?auto_2289 ?auto_2287 )
      ( !LOAD ?auto_2288 ?auto_2282 ?auto_2286 ?auto_2287 )
      ( !DRIVE ?auto_2286 ?auto_2287 ?auto_2285 )
      ( !UNLOAD ?auto_2284 ?auto_2282 ?auto_2286 ?auto_2285 )
      ( !DROP ?auto_2284 ?auto_2282 ?auto_2283 ?auto_2285 )
      ( MAKE-ON-VERIFY ?auto_2282 ?auto_2283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2292 - SURFACE
      ?auto_2293 - SURFACE
    )
    :vars
    (
      ?auto_2294 - HOIST
      ?auto_2295 - PLACE
      ?auto_2297 - PLACE
      ?auto_2298 - HOIST
      ?auto_2299 - SURFACE
      ?auto_2296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2294 ?auto_2295 ) ( SURFACE-AT ?auto_2293 ?auto_2295 ) ( CLEAR ?auto_2293 ) ( IS-CRATE ?auto_2292 ) ( AVAILABLE ?auto_2294 ) ( not ( = ?auto_2297 ?auto_2295 ) ) ( HOIST-AT ?auto_2298 ?auto_2297 ) ( AVAILABLE ?auto_2298 ) ( SURFACE-AT ?auto_2292 ?auto_2297 ) ( ON ?auto_2292 ?auto_2299 ) ( CLEAR ?auto_2292 ) ( TRUCK-AT ?auto_2296 ?auto_2295 ) ( not ( = ?auto_2292 ?auto_2293 ) ) ( not ( = ?auto_2292 ?auto_2299 ) ) ( not ( = ?auto_2293 ?auto_2299 ) ) ( not ( = ?auto_2294 ?auto_2298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2296 ?auto_2295 ?auto_2297 )
      ( !LIFT ?auto_2298 ?auto_2292 ?auto_2299 ?auto_2297 )
      ( !LOAD ?auto_2298 ?auto_2292 ?auto_2296 ?auto_2297 )
      ( !DRIVE ?auto_2296 ?auto_2297 ?auto_2295 )
      ( !UNLOAD ?auto_2294 ?auto_2292 ?auto_2296 ?auto_2295 )
      ( !DROP ?auto_2294 ?auto_2292 ?auto_2293 ?auto_2295 )
      ( MAKE-ON-VERIFY ?auto_2292 ?auto_2293 ) )
  )

)

