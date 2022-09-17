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
      ?auto_2302 - SURFACE
      ?auto_2303 - SURFACE
    )
    :vars
    (
      ?auto_2304 - HOIST
      ?auto_2305 - PLACE
      ?auto_2307 - PLACE
      ?auto_2308 - HOIST
      ?auto_2309 - SURFACE
      ?auto_2306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2304 ?auto_2305 ) ( SURFACE-AT ?auto_2303 ?auto_2305 ) ( CLEAR ?auto_2303 ) ( IS-CRATE ?auto_2302 ) ( AVAILABLE ?auto_2304 ) ( not ( = ?auto_2307 ?auto_2305 ) ) ( HOIST-AT ?auto_2308 ?auto_2307 ) ( AVAILABLE ?auto_2308 ) ( SURFACE-AT ?auto_2302 ?auto_2307 ) ( ON ?auto_2302 ?auto_2309 ) ( CLEAR ?auto_2302 ) ( TRUCK-AT ?auto_2306 ?auto_2305 ) ( not ( = ?auto_2302 ?auto_2303 ) ) ( not ( = ?auto_2302 ?auto_2309 ) ) ( not ( = ?auto_2303 ?auto_2309 ) ) ( not ( = ?auto_2304 ?auto_2308 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2306 ?auto_2305 ?auto_2307 )
      ( !LIFT ?auto_2308 ?auto_2302 ?auto_2309 ?auto_2307 )
      ( !LOAD ?auto_2308 ?auto_2302 ?auto_2306 ?auto_2307 )
      ( !DRIVE ?auto_2306 ?auto_2307 ?auto_2305 )
      ( !UNLOAD ?auto_2304 ?auto_2302 ?auto_2306 ?auto_2305 )
      ( !DROP ?auto_2304 ?auto_2302 ?auto_2303 ?auto_2305 )
      ( MAKE-ON-VERIFY ?auto_2302 ?auto_2303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2312 - SURFACE
      ?auto_2313 - SURFACE
    )
    :vars
    (
      ?auto_2314 - HOIST
      ?auto_2315 - PLACE
      ?auto_2317 - PLACE
      ?auto_2318 - HOIST
      ?auto_2319 - SURFACE
      ?auto_2316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2314 ?auto_2315 ) ( SURFACE-AT ?auto_2313 ?auto_2315 ) ( CLEAR ?auto_2313 ) ( IS-CRATE ?auto_2312 ) ( AVAILABLE ?auto_2314 ) ( not ( = ?auto_2317 ?auto_2315 ) ) ( HOIST-AT ?auto_2318 ?auto_2317 ) ( AVAILABLE ?auto_2318 ) ( SURFACE-AT ?auto_2312 ?auto_2317 ) ( ON ?auto_2312 ?auto_2319 ) ( CLEAR ?auto_2312 ) ( TRUCK-AT ?auto_2316 ?auto_2315 ) ( not ( = ?auto_2312 ?auto_2313 ) ) ( not ( = ?auto_2312 ?auto_2319 ) ) ( not ( = ?auto_2313 ?auto_2319 ) ) ( not ( = ?auto_2314 ?auto_2318 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2316 ?auto_2315 ?auto_2317 )
      ( !LIFT ?auto_2318 ?auto_2312 ?auto_2319 ?auto_2317 )
      ( !LOAD ?auto_2318 ?auto_2312 ?auto_2316 ?auto_2317 )
      ( !DRIVE ?auto_2316 ?auto_2317 ?auto_2315 )
      ( !UNLOAD ?auto_2314 ?auto_2312 ?auto_2316 ?auto_2315 )
      ( !DROP ?auto_2314 ?auto_2312 ?auto_2313 ?auto_2315 )
      ( MAKE-ON-VERIFY ?auto_2312 ?auto_2313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2322 - SURFACE
      ?auto_2323 - SURFACE
    )
    :vars
    (
      ?auto_2324 - HOIST
      ?auto_2325 - PLACE
      ?auto_2327 - PLACE
      ?auto_2328 - HOIST
      ?auto_2329 - SURFACE
      ?auto_2326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2324 ?auto_2325 ) ( SURFACE-AT ?auto_2323 ?auto_2325 ) ( CLEAR ?auto_2323 ) ( IS-CRATE ?auto_2322 ) ( AVAILABLE ?auto_2324 ) ( not ( = ?auto_2327 ?auto_2325 ) ) ( HOIST-AT ?auto_2328 ?auto_2327 ) ( AVAILABLE ?auto_2328 ) ( SURFACE-AT ?auto_2322 ?auto_2327 ) ( ON ?auto_2322 ?auto_2329 ) ( CLEAR ?auto_2322 ) ( TRUCK-AT ?auto_2326 ?auto_2325 ) ( not ( = ?auto_2322 ?auto_2323 ) ) ( not ( = ?auto_2322 ?auto_2329 ) ) ( not ( = ?auto_2323 ?auto_2329 ) ) ( not ( = ?auto_2324 ?auto_2328 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2326 ?auto_2325 ?auto_2327 )
      ( !LIFT ?auto_2328 ?auto_2322 ?auto_2329 ?auto_2327 )
      ( !LOAD ?auto_2328 ?auto_2322 ?auto_2326 ?auto_2327 )
      ( !DRIVE ?auto_2326 ?auto_2327 ?auto_2325 )
      ( !UNLOAD ?auto_2324 ?auto_2322 ?auto_2326 ?auto_2325 )
      ( !DROP ?auto_2324 ?auto_2322 ?auto_2323 ?auto_2325 )
      ( MAKE-ON-VERIFY ?auto_2322 ?auto_2323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2332 - SURFACE
      ?auto_2333 - SURFACE
    )
    :vars
    (
      ?auto_2334 - HOIST
      ?auto_2335 - PLACE
      ?auto_2337 - PLACE
      ?auto_2338 - HOIST
      ?auto_2339 - SURFACE
      ?auto_2336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2334 ?auto_2335 ) ( SURFACE-AT ?auto_2333 ?auto_2335 ) ( CLEAR ?auto_2333 ) ( IS-CRATE ?auto_2332 ) ( AVAILABLE ?auto_2334 ) ( not ( = ?auto_2337 ?auto_2335 ) ) ( HOIST-AT ?auto_2338 ?auto_2337 ) ( AVAILABLE ?auto_2338 ) ( SURFACE-AT ?auto_2332 ?auto_2337 ) ( ON ?auto_2332 ?auto_2339 ) ( CLEAR ?auto_2332 ) ( TRUCK-AT ?auto_2336 ?auto_2335 ) ( not ( = ?auto_2332 ?auto_2333 ) ) ( not ( = ?auto_2332 ?auto_2339 ) ) ( not ( = ?auto_2333 ?auto_2339 ) ) ( not ( = ?auto_2334 ?auto_2338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2336 ?auto_2335 ?auto_2337 )
      ( !LIFT ?auto_2338 ?auto_2332 ?auto_2339 ?auto_2337 )
      ( !LOAD ?auto_2338 ?auto_2332 ?auto_2336 ?auto_2337 )
      ( !DRIVE ?auto_2336 ?auto_2337 ?auto_2335 )
      ( !UNLOAD ?auto_2334 ?auto_2332 ?auto_2336 ?auto_2335 )
      ( !DROP ?auto_2334 ?auto_2332 ?auto_2333 ?auto_2335 )
      ( MAKE-ON-VERIFY ?auto_2332 ?auto_2333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2342 - SURFACE
      ?auto_2343 - SURFACE
    )
    :vars
    (
      ?auto_2344 - HOIST
      ?auto_2345 - PLACE
      ?auto_2347 - PLACE
      ?auto_2348 - HOIST
      ?auto_2349 - SURFACE
      ?auto_2346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2344 ?auto_2345 ) ( SURFACE-AT ?auto_2343 ?auto_2345 ) ( CLEAR ?auto_2343 ) ( IS-CRATE ?auto_2342 ) ( AVAILABLE ?auto_2344 ) ( not ( = ?auto_2347 ?auto_2345 ) ) ( HOIST-AT ?auto_2348 ?auto_2347 ) ( AVAILABLE ?auto_2348 ) ( SURFACE-AT ?auto_2342 ?auto_2347 ) ( ON ?auto_2342 ?auto_2349 ) ( CLEAR ?auto_2342 ) ( TRUCK-AT ?auto_2346 ?auto_2345 ) ( not ( = ?auto_2342 ?auto_2343 ) ) ( not ( = ?auto_2342 ?auto_2349 ) ) ( not ( = ?auto_2343 ?auto_2349 ) ) ( not ( = ?auto_2344 ?auto_2348 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2346 ?auto_2345 ?auto_2347 )
      ( !LIFT ?auto_2348 ?auto_2342 ?auto_2349 ?auto_2347 )
      ( !LOAD ?auto_2348 ?auto_2342 ?auto_2346 ?auto_2347 )
      ( !DRIVE ?auto_2346 ?auto_2347 ?auto_2345 )
      ( !UNLOAD ?auto_2344 ?auto_2342 ?auto_2346 ?auto_2345 )
      ( !DROP ?auto_2344 ?auto_2342 ?auto_2343 ?auto_2345 )
      ( MAKE-ON-VERIFY ?auto_2342 ?auto_2343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2352 - SURFACE
      ?auto_2353 - SURFACE
    )
    :vars
    (
      ?auto_2354 - HOIST
      ?auto_2355 - PLACE
      ?auto_2357 - PLACE
      ?auto_2358 - HOIST
      ?auto_2359 - SURFACE
      ?auto_2356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2354 ?auto_2355 ) ( SURFACE-AT ?auto_2353 ?auto_2355 ) ( CLEAR ?auto_2353 ) ( IS-CRATE ?auto_2352 ) ( AVAILABLE ?auto_2354 ) ( not ( = ?auto_2357 ?auto_2355 ) ) ( HOIST-AT ?auto_2358 ?auto_2357 ) ( AVAILABLE ?auto_2358 ) ( SURFACE-AT ?auto_2352 ?auto_2357 ) ( ON ?auto_2352 ?auto_2359 ) ( CLEAR ?auto_2352 ) ( TRUCK-AT ?auto_2356 ?auto_2355 ) ( not ( = ?auto_2352 ?auto_2353 ) ) ( not ( = ?auto_2352 ?auto_2359 ) ) ( not ( = ?auto_2353 ?auto_2359 ) ) ( not ( = ?auto_2354 ?auto_2358 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2356 ?auto_2355 ?auto_2357 )
      ( !LIFT ?auto_2358 ?auto_2352 ?auto_2359 ?auto_2357 )
      ( !LOAD ?auto_2358 ?auto_2352 ?auto_2356 ?auto_2357 )
      ( !DRIVE ?auto_2356 ?auto_2357 ?auto_2355 )
      ( !UNLOAD ?auto_2354 ?auto_2352 ?auto_2356 ?auto_2355 )
      ( !DROP ?auto_2354 ?auto_2352 ?auto_2353 ?auto_2355 )
      ( MAKE-ON-VERIFY ?auto_2352 ?auto_2353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2362 - SURFACE
      ?auto_2363 - SURFACE
    )
    :vars
    (
      ?auto_2364 - HOIST
      ?auto_2365 - PLACE
      ?auto_2367 - PLACE
      ?auto_2368 - HOIST
      ?auto_2369 - SURFACE
      ?auto_2366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2364 ?auto_2365 ) ( SURFACE-AT ?auto_2363 ?auto_2365 ) ( CLEAR ?auto_2363 ) ( IS-CRATE ?auto_2362 ) ( AVAILABLE ?auto_2364 ) ( not ( = ?auto_2367 ?auto_2365 ) ) ( HOIST-AT ?auto_2368 ?auto_2367 ) ( AVAILABLE ?auto_2368 ) ( SURFACE-AT ?auto_2362 ?auto_2367 ) ( ON ?auto_2362 ?auto_2369 ) ( CLEAR ?auto_2362 ) ( TRUCK-AT ?auto_2366 ?auto_2365 ) ( not ( = ?auto_2362 ?auto_2363 ) ) ( not ( = ?auto_2362 ?auto_2369 ) ) ( not ( = ?auto_2363 ?auto_2369 ) ) ( not ( = ?auto_2364 ?auto_2368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2366 ?auto_2365 ?auto_2367 )
      ( !LIFT ?auto_2368 ?auto_2362 ?auto_2369 ?auto_2367 )
      ( !LOAD ?auto_2368 ?auto_2362 ?auto_2366 ?auto_2367 )
      ( !DRIVE ?auto_2366 ?auto_2367 ?auto_2365 )
      ( !UNLOAD ?auto_2364 ?auto_2362 ?auto_2366 ?auto_2365 )
      ( !DROP ?auto_2364 ?auto_2362 ?auto_2363 ?auto_2365 )
      ( MAKE-ON-VERIFY ?auto_2362 ?auto_2363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2372 - SURFACE
      ?auto_2373 - SURFACE
    )
    :vars
    (
      ?auto_2374 - HOIST
      ?auto_2375 - PLACE
      ?auto_2377 - PLACE
      ?auto_2378 - HOIST
      ?auto_2379 - SURFACE
      ?auto_2376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2374 ?auto_2375 ) ( SURFACE-AT ?auto_2373 ?auto_2375 ) ( CLEAR ?auto_2373 ) ( IS-CRATE ?auto_2372 ) ( AVAILABLE ?auto_2374 ) ( not ( = ?auto_2377 ?auto_2375 ) ) ( HOIST-AT ?auto_2378 ?auto_2377 ) ( AVAILABLE ?auto_2378 ) ( SURFACE-AT ?auto_2372 ?auto_2377 ) ( ON ?auto_2372 ?auto_2379 ) ( CLEAR ?auto_2372 ) ( TRUCK-AT ?auto_2376 ?auto_2375 ) ( not ( = ?auto_2372 ?auto_2373 ) ) ( not ( = ?auto_2372 ?auto_2379 ) ) ( not ( = ?auto_2373 ?auto_2379 ) ) ( not ( = ?auto_2374 ?auto_2378 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2376 ?auto_2375 ?auto_2377 )
      ( !LIFT ?auto_2378 ?auto_2372 ?auto_2379 ?auto_2377 )
      ( !LOAD ?auto_2378 ?auto_2372 ?auto_2376 ?auto_2377 )
      ( !DRIVE ?auto_2376 ?auto_2377 ?auto_2375 )
      ( !UNLOAD ?auto_2374 ?auto_2372 ?auto_2376 ?auto_2375 )
      ( !DROP ?auto_2374 ?auto_2372 ?auto_2373 ?auto_2375 )
      ( MAKE-ON-VERIFY ?auto_2372 ?auto_2373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2382 - SURFACE
      ?auto_2383 - SURFACE
    )
    :vars
    (
      ?auto_2384 - HOIST
      ?auto_2385 - PLACE
      ?auto_2387 - PLACE
      ?auto_2388 - HOIST
      ?auto_2389 - SURFACE
      ?auto_2386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2384 ?auto_2385 ) ( SURFACE-AT ?auto_2383 ?auto_2385 ) ( CLEAR ?auto_2383 ) ( IS-CRATE ?auto_2382 ) ( AVAILABLE ?auto_2384 ) ( not ( = ?auto_2387 ?auto_2385 ) ) ( HOIST-AT ?auto_2388 ?auto_2387 ) ( AVAILABLE ?auto_2388 ) ( SURFACE-AT ?auto_2382 ?auto_2387 ) ( ON ?auto_2382 ?auto_2389 ) ( CLEAR ?auto_2382 ) ( TRUCK-AT ?auto_2386 ?auto_2385 ) ( not ( = ?auto_2382 ?auto_2383 ) ) ( not ( = ?auto_2382 ?auto_2389 ) ) ( not ( = ?auto_2383 ?auto_2389 ) ) ( not ( = ?auto_2384 ?auto_2388 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2386 ?auto_2385 ?auto_2387 )
      ( !LIFT ?auto_2388 ?auto_2382 ?auto_2389 ?auto_2387 )
      ( !LOAD ?auto_2388 ?auto_2382 ?auto_2386 ?auto_2387 )
      ( !DRIVE ?auto_2386 ?auto_2387 ?auto_2385 )
      ( !UNLOAD ?auto_2384 ?auto_2382 ?auto_2386 ?auto_2385 )
      ( !DROP ?auto_2384 ?auto_2382 ?auto_2383 ?auto_2385 )
      ( MAKE-ON-VERIFY ?auto_2382 ?auto_2383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2392 - SURFACE
      ?auto_2393 - SURFACE
    )
    :vars
    (
      ?auto_2394 - HOIST
      ?auto_2395 - PLACE
      ?auto_2397 - PLACE
      ?auto_2398 - HOIST
      ?auto_2399 - SURFACE
      ?auto_2396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394 ?auto_2395 ) ( SURFACE-AT ?auto_2393 ?auto_2395 ) ( CLEAR ?auto_2393 ) ( IS-CRATE ?auto_2392 ) ( AVAILABLE ?auto_2394 ) ( not ( = ?auto_2397 ?auto_2395 ) ) ( HOIST-AT ?auto_2398 ?auto_2397 ) ( AVAILABLE ?auto_2398 ) ( SURFACE-AT ?auto_2392 ?auto_2397 ) ( ON ?auto_2392 ?auto_2399 ) ( CLEAR ?auto_2392 ) ( TRUCK-AT ?auto_2396 ?auto_2395 ) ( not ( = ?auto_2392 ?auto_2393 ) ) ( not ( = ?auto_2392 ?auto_2399 ) ) ( not ( = ?auto_2393 ?auto_2399 ) ) ( not ( = ?auto_2394 ?auto_2398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2396 ?auto_2395 ?auto_2397 )
      ( !LIFT ?auto_2398 ?auto_2392 ?auto_2399 ?auto_2397 )
      ( !LOAD ?auto_2398 ?auto_2392 ?auto_2396 ?auto_2397 )
      ( !DRIVE ?auto_2396 ?auto_2397 ?auto_2395 )
      ( !UNLOAD ?auto_2394 ?auto_2392 ?auto_2396 ?auto_2395 )
      ( !DROP ?auto_2394 ?auto_2392 ?auto_2393 ?auto_2395 )
      ( MAKE-ON-VERIFY ?auto_2392 ?auto_2393 ) )
  )

)

