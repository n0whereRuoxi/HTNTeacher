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
      ?auto_2282 - OBJ
      ?auto_2283 - LOCATION
    )
    :vars
    (
      ?auto_2285 - LOCATION
      ?auto_2286 - CITY
      ?auto_2284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2285 ?auto_2286 ) ( IN-CITY ?auto_2283 ?auto_2286 ) ( not ( = ?auto_2283 ?auto_2285 ) ) ( OBJ-AT ?auto_2282 ?auto_2285 ) ( TRUCK-AT ?auto_2284 ?auto_2283 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2284 ?auto_2283 ?auto_2285 ?auto_2286 )
      ( !LOAD-TRUCK ?auto_2282 ?auto_2284 ?auto_2285 )
      ( !DRIVE-TRUCK ?auto_2284 ?auto_2285 ?auto_2283 ?auto_2286 )
      ( !UNLOAD-TRUCK ?auto_2282 ?auto_2284 ?auto_2283 )
      ( DELIVER-1PKG-VERIFY ?auto_2282 ?auto_2283 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2297 - OBJ
      ?auto_2299 - OBJ
      ?auto_2298 - LOCATION
    )
    :vars
    (
      ?auto_2302 - LOCATION
      ?auto_2301 - CITY
      ?auto_2303 - LOCATION
      ?auto_2300 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2299 ?auto_2297 ) ( IN-CITY ?auto_2302 ?auto_2301 ) ( IN-CITY ?auto_2298 ?auto_2301 ) ( not ( = ?auto_2298 ?auto_2302 ) ) ( OBJ-AT ?auto_2299 ?auto_2302 ) ( IN-CITY ?auto_2303 ?auto_2301 ) ( not ( = ?auto_2298 ?auto_2303 ) ) ( OBJ-AT ?auto_2297 ?auto_2303 ) ( TRUCK-AT ?auto_2300 ?auto_2298 ) ( not ( = ?auto_2297 ?auto_2299 ) ) ( not ( = ?auto_2302 ?auto_2303 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2297 ?auto_2298 )
      ( DELIVER-1PKG ?auto_2299 ?auto_2298 )
      ( DELIVER-2PKG-VERIFY ?auto_2297 ?auto_2299 ?auto_2298 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2315 - OBJ
      ?auto_2317 - OBJ
      ?auto_2318 - OBJ
      ?auto_2316 - LOCATION
    )
    :vars
    (
      ?auto_2320 - LOCATION
      ?auto_2321 - CITY
      ?auto_2322 - LOCATION
      ?auto_2323 - LOCATION
      ?auto_2319 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2317 ?auto_2315 ) ( GREATER-THAN ?auto_2318 ?auto_2315 ) ( GREATER-THAN ?auto_2318 ?auto_2317 ) ( IN-CITY ?auto_2320 ?auto_2321 ) ( IN-CITY ?auto_2316 ?auto_2321 ) ( not ( = ?auto_2316 ?auto_2320 ) ) ( OBJ-AT ?auto_2318 ?auto_2320 ) ( IN-CITY ?auto_2322 ?auto_2321 ) ( not ( = ?auto_2316 ?auto_2322 ) ) ( OBJ-AT ?auto_2317 ?auto_2322 ) ( IN-CITY ?auto_2323 ?auto_2321 ) ( not ( = ?auto_2316 ?auto_2323 ) ) ( OBJ-AT ?auto_2315 ?auto_2323 ) ( TRUCK-AT ?auto_2319 ?auto_2316 ) ( not ( = ?auto_2315 ?auto_2317 ) ) ( not ( = ?auto_2322 ?auto_2323 ) ) ( not ( = ?auto_2315 ?auto_2318 ) ) ( not ( = ?auto_2317 ?auto_2318 ) ) ( not ( = ?auto_2320 ?auto_2322 ) ) ( not ( = ?auto_2320 ?auto_2323 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2315 ?auto_2317 ?auto_2316 )
      ( DELIVER-1PKG ?auto_2318 ?auto_2316 )
      ( DELIVER-3PKG-VERIFY ?auto_2315 ?auto_2317 ?auto_2318 ?auto_2316 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2336 - OBJ
      ?auto_2338 - OBJ
      ?auto_2339 - OBJ
      ?auto_2340 - OBJ
      ?auto_2337 - LOCATION
    )
    :vars
    (
      ?auto_2341 - LOCATION
      ?auto_2342 - CITY
      ?auto_2346 - LOCATION
      ?auto_2344 - LOCATION
      ?auto_2345 - LOCATION
      ?auto_2343 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2338 ?auto_2336 ) ( GREATER-THAN ?auto_2339 ?auto_2336 ) ( GREATER-THAN ?auto_2339 ?auto_2338 ) ( GREATER-THAN ?auto_2340 ?auto_2336 ) ( GREATER-THAN ?auto_2340 ?auto_2338 ) ( GREATER-THAN ?auto_2340 ?auto_2339 ) ( IN-CITY ?auto_2341 ?auto_2342 ) ( IN-CITY ?auto_2337 ?auto_2342 ) ( not ( = ?auto_2337 ?auto_2341 ) ) ( OBJ-AT ?auto_2340 ?auto_2341 ) ( IN-CITY ?auto_2346 ?auto_2342 ) ( not ( = ?auto_2337 ?auto_2346 ) ) ( OBJ-AT ?auto_2339 ?auto_2346 ) ( IN-CITY ?auto_2344 ?auto_2342 ) ( not ( = ?auto_2337 ?auto_2344 ) ) ( OBJ-AT ?auto_2338 ?auto_2344 ) ( IN-CITY ?auto_2345 ?auto_2342 ) ( not ( = ?auto_2337 ?auto_2345 ) ) ( OBJ-AT ?auto_2336 ?auto_2345 ) ( TRUCK-AT ?auto_2343 ?auto_2337 ) ( not ( = ?auto_2336 ?auto_2338 ) ) ( not ( = ?auto_2344 ?auto_2345 ) ) ( not ( = ?auto_2336 ?auto_2339 ) ) ( not ( = ?auto_2338 ?auto_2339 ) ) ( not ( = ?auto_2346 ?auto_2344 ) ) ( not ( = ?auto_2346 ?auto_2345 ) ) ( not ( = ?auto_2336 ?auto_2340 ) ) ( not ( = ?auto_2338 ?auto_2340 ) ) ( not ( = ?auto_2339 ?auto_2340 ) ) ( not ( = ?auto_2341 ?auto_2346 ) ) ( not ( = ?auto_2341 ?auto_2344 ) ) ( not ( = ?auto_2341 ?auto_2345 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2336 ?auto_2338 ?auto_2339 ?auto_2337 )
      ( DELIVER-1PKG ?auto_2340 ?auto_2337 )
      ( DELIVER-4PKG-VERIFY ?auto_2336 ?auto_2338 ?auto_2339 ?auto_2340 ?auto_2337 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2360 - OBJ
      ?auto_2362 - OBJ
      ?auto_2363 - OBJ
      ?auto_2364 - OBJ
      ?auto_2365 - OBJ
      ?auto_2361 - LOCATION
    )
    :vars
    (
      ?auto_2368 - LOCATION
      ?auto_2367 - CITY
      ?auto_2370 - LOCATION
      ?auto_2371 - LOCATION
      ?auto_2372 - LOCATION
      ?auto_2369 - LOCATION
      ?auto_2366 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2362 ?auto_2360 ) ( GREATER-THAN ?auto_2363 ?auto_2360 ) ( GREATER-THAN ?auto_2363 ?auto_2362 ) ( GREATER-THAN ?auto_2364 ?auto_2360 ) ( GREATER-THAN ?auto_2364 ?auto_2362 ) ( GREATER-THAN ?auto_2364 ?auto_2363 ) ( GREATER-THAN ?auto_2365 ?auto_2360 ) ( GREATER-THAN ?auto_2365 ?auto_2362 ) ( GREATER-THAN ?auto_2365 ?auto_2363 ) ( GREATER-THAN ?auto_2365 ?auto_2364 ) ( IN-CITY ?auto_2368 ?auto_2367 ) ( IN-CITY ?auto_2361 ?auto_2367 ) ( not ( = ?auto_2361 ?auto_2368 ) ) ( OBJ-AT ?auto_2365 ?auto_2368 ) ( IN-CITY ?auto_2370 ?auto_2367 ) ( not ( = ?auto_2361 ?auto_2370 ) ) ( OBJ-AT ?auto_2364 ?auto_2370 ) ( IN-CITY ?auto_2371 ?auto_2367 ) ( not ( = ?auto_2361 ?auto_2371 ) ) ( OBJ-AT ?auto_2363 ?auto_2371 ) ( IN-CITY ?auto_2372 ?auto_2367 ) ( not ( = ?auto_2361 ?auto_2372 ) ) ( OBJ-AT ?auto_2362 ?auto_2372 ) ( IN-CITY ?auto_2369 ?auto_2367 ) ( not ( = ?auto_2361 ?auto_2369 ) ) ( OBJ-AT ?auto_2360 ?auto_2369 ) ( TRUCK-AT ?auto_2366 ?auto_2361 ) ( not ( = ?auto_2360 ?auto_2362 ) ) ( not ( = ?auto_2372 ?auto_2369 ) ) ( not ( = ?auto_2360 ?auto_2363 ) ) ( not ( = ?auto_2362 ?auto_2363 ) ) ( not ( = ?auto_2371 ?auto_2372 ) ) ( not ( = ?auto_2371 ?auto_2369 ) ) ( not ( = ?auto_2360 ?auto_2364 ) ) ( not ( = ?auto_2362 ?auto_2364 ) ) ( not ( = ?auto_2363 ?auto_2364 ) ) ( not ( = ?auto_2370 ?auto_2371 ) ) ( not ( = ?auto_2370 ?auto_2372 ) ) ( not ( = ?auto_2370 ?auto_2369 ) ) ( not ( = ?auto_2360 ?auto_2365 ) ) ( not ( = ?auto_2362 ?auto_2365 ) ) ( not ( = ?auto_2363 ?auto_2365 ) ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( not ( = ?auto_2368 ?auto_2370 ) ) ( not ( = ?auto_2368 ?auto_2371 ) ) ( not ( = ?auto_2368 ?auto_2372 ) ) ( not ( = ?auto_2368 ?auto_2369 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2360 ?auto_2362 ?auto_2363 ?auto_2364 ?auto_2361 )
      ( DELIVER-1PKG ?auto_2365 ?auto_2361 )
      ( DELIVER-5PKG-VERIFY ?auto_2360 ?auto_2362 ?auto_2363 ?auto_2364 ?auto_2365 ?auto_2361 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2387 - OBJ
      ?auto_2389 - OBJ
      ?auto_2390 - OBJ
      ?auto_2391 - OBJ
      ?auto_2392 - OBJ
      ?auto_2393 - OBJ
      ?auto_2388 - LOCATION
    )
    :vars
    (
      ?auto_2395 - LOCATION
      ?auto_2396 - CITY
      ?auto_2401 - LOCATION
      ?auto_2399 - LOCATION
      ?auto_2398 - LOCATION
      ?auto_2400 - LOCATION
      ?auto_2397 - LOCATION
      ?auto_2394 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2389 ?auto_2387 ) ( GREATER-THAN ?auto_2390 ?auto_2387 ) ( GREATER-THAN ?auto_2390 ?auto_2389 ) ( GREATER-THAN ?auto_2391 ?auto_2387 ) ( GREATER-THAN ?auto_2391 ?auto_2389 ) ( GREATER-THAN ?auto_2391 ?auto_2390 ) ( GREATER-THAN ?auto_2392 ?auto_2387 ) ( GREATER-THAN ?auto_2392 ?auto_2389 ) ( GREATER-THAN ?auto_2392 ?auto_2390 ) ( GREATER-THAN ?auto_2392 ?auto_2391 ) ( GREATER-THAN ?auto_2393 ?auto_2387 ) ( GREATER-THAN ?auto_2393 ?auto_2389 ) ( GREATER-THAN ?auto_2393 ?auto_2390 ) ( GREATER-THAN ?auto_2393 ?auto_2391 ) ( GREATER-THAN ?auto_2393 ?auto_2392 ) ( IN-CITY ?auto_2395 ?auto_2396 ) ( IN-CITY ?auto_2388 ?auto_2396 ) ( not ( = ?auto_2388 ?auto_2395 ) ) ( OBJ-AT ?auto_2393 ?auto_2395 ) ( IN-CITY ?auto_2401 ?auto_2396 ) ( not ( = ?auto_2388 ?auto_2401 ) ) ( OBJ-AT ?auto_2392 ?auto_2401 ) ( IN-CITY ?auto_2399 ?auto_2396 ) ( not ( = ?auto_2388 ?auto_2399 ) ) ( OBJ-AT ?auto_2391 ?auto_2399 ) ( IN-CITY ?auto_2398 ?auto_2396 ) ( not ( = ?auto_2388 ?auto_2398 ) ) ( OBJ-AT ?auto_2390 ?auto_2398 ) ( IN-CITY ?auto_2400 ?auto_2396 ) ( not ( = ?auto_2388 ?auto_2400 ) ) ( OBJ-AT ?auto_2389 ?auto_2400 ) ( IN-CITY ?auto_2397 ?auto_2396 ) ( not ( = ?auto_2388 ?auto_2397 ) ) ( OBJ-AT ?auto_2387 ?auto_2397 ) ( TRUCK-AT ?auto_2394 ?auto_2388 ) ( not ( = ?auto_2387 ?auto_2389 ) ) ( not ( = ?auto_2400 ?auto_2397 ) ) ( not ( = ?auto_2387 ?auto_2390 ) ) ( not ( = ?auto_2389 ?auto_2390 ) ) ( not ( = ?auto_2398 ?auto_2400 ) ) ( not ( = ?auto_2398 ?auto_2397 ) ) ( not ( = ?auto_2387 ?auto_2391 ) ) ( not ( = ?auto_2389 ?auto_2391 ) ) ( not ( = ?auto_2390 ?auto_2391 ) ) ( not ( = ?auto_2399 ?auto_2398 ) ) ( not ( = ?auto_2399 ?auto_2400 ) ) ( not ( = ?auto_2399 ?auto_2397 ) ) ( not ( = ?auto_2387 ?auto_2392 ) ) ( not ( = ?auto_2389 ?auto_2392 ) ) ( not ( = ?auto_2390 ?auto_2392 ) ) ( not ( = ?auto_2391 ?auto_2392 ) ) ( not ( = ?auto_2401 ?auto_2399 ) ) ( not ( = ?auto_2401 ?auto_2398 ) ) ( not ( = ?auto_2401 ?auto_2400 ) ) ( not ( = ?auto_2401 ?auto_2397 ) ) ( not ( = ?auto_2387 ?auto_2393 ) ) ( not ( = ?auto_2389 ?auto_2393 ) ) ( not ( = ?auto_2390 ?auto_2393 ) ) ( not ( = ?auto_2391 ?auto_2393 ) ) ( not ( = ?auto_2392 ?auto_2393 ) ) ( not ( = ?auto_2395 ?auto_2401 ) ) ( not ( = ?auto_2395 ?auto_2399 ) ) ( not ( = ?auto_2395 ?auto_2398 ) ) ( not ( = ?auto_2395 ?auto_2400 ) ) ( not ( = ?auto_2395 ?auto_2397 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2387 ?auto_2389 ?auto_2390 ?auto_2391 ?auto_2392 ?auto_2388 )
      ( DELIVER-1PKG ?auto_2393 ?auto_2388 )
      ( DELIVER-6PKG-VERIFY ?auto_2387 ?auto_2389 ?auto_2390 ?auto_2391 ?auto_2392 ?auto_2393 ?auto_2388 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_2417 - OBJ
      ?auto_2419 - OBJ
      ?auto_2420 - OBJ
      ?auto_2421 - OBJ
      ?auto_2422 - OBJ
      ?auto_2423 - OBJ
      ?auto_2424 - OBJ
      ?auto_2418 - LOCATION
    )
    :vars
    (
      ?auto_2426 - LOCATION
      ?auto_2425 - CITY
      ?auto_2428 - LOCATION
      ?auto_2432 - LOCATION
      ?auto_2429 - LOCATION
      ?auto_2430 - LOCATION
      ?auto_2431 - LOCATION
      ?auto_2433 - LOCATION
      ?auto_2427 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2419 ?auto_2417 ) ( GREATER-THAN ?auto_2420 ?auto_2417 ) ( GREATER-THAN ?auto_2420 ?auto_2419 ) ( GREATER-THAN ?auto_2421 ?auto_2417 ) ( GREATER-THAN ?auto_2421 ?auto_2419 ) ( GREATER-THAN ?auto_2421 ?auto_2420 ) ( GREATER-THAN ?auto_2422 ?auto_2417 ) ( GREATER-THAN ?auto_2422 ?auto_2419 ) ( GREATER-THAN ?auto_2422 ?auto_2420 ) ( GREATER-THAN ?auto_2422 ?auto_2421 ) ( GREATER-THAN ?auto_2423 ?auto_2417 ) ( GREATER-THAN ?auto_2423 ?auto_2419 ) ( GREATER-THAN ?auto_2423 ?auto_2420 ) ( GREATER-THAN ?auto_2423 ?auto_2421 ) ( GREATER-THAN ?auto_2423 ?auto_2422 ) ( GREATER-THAN ?auto_2424 ?auto_2417 ) ( GREATER-THAN ?auto_2424 ?auto_2419 ) ( GREATER-THAN ?auto_2424 ?auto_2420 ) ( GREATER-THAN ?auto_2424 ?auto_2421 ) ( GREATER-THAN ?auto_2424 ?auto_2422 ) ( GREATER-THAN ?auto_2424 ?auto_2423 ) ( IN-CITY ?auto_2426 ?auto_2425 ) ( IN-CITY ?auto_2418 ?auto_2425 ) ( not ( = ?auto_2418 ?auto_2426 ) ) ( OBJ-AT ?auto_2424 ?auto_2426 ) ( IN-CITY ?auto_2428 ?auto_2425 ) ( not ( = ?auto_2418 ?auto_2428 ) ) ( OBJ-AT ?auto_2423 ?auto_2428 ) ( IN-CITY ?auto_2432 ?auto_2425 ) ( not ( = ?auto_2418 ?auto_2432 ) ) ( OBJ-AT ?auto_2422 ?auto_2432 ) ( IN-CITY ?auto_2429 ?auto_2425 ) ( not ( = ?auto_2418 ?auto_2429 ) ) ( OBJ-AT ?auto_2421 ?auto_2429 ) ( IN-CITY ?auto_2430 ?auto_2425 ) ( not ( = ?auto_2418 ?auto_2430 ) ) ( OBJ-AT ?auto_2420 ?auto_2430 ) ( IN-CITY ?auto_2431 ?auto_2425 ) ( not ( = ?auto_2418 ?auto_2431 ) ) ( OBJ-AT ?auto_2419 ?auto_2431 ) ( IN-CITY ?auto_2433 ?auto_2425 ) ( not ( = ?auto_2418 ?auto_2433 ) ) ( OBJ-AT ?auto_2417 ?auto_2433 ) ( TRUCK-AT ?auto_2427 ?auto_2418 ) ( not ( = ?auto_2417 ?auto_2419 ) ) ( not ( = ?auto_2431 ?auto_2433 ) ) ( not ( = ?auto_2417 ?auto_2420 ) ) ( not ( = ?auto_2419 ?auto_2420 ) ) ( not ( = ?auto_2430 ?auto_2431 ) ) ( not ( = ?auto_2430 ?auto_2433 ) ) ( not ( = ?auto_2417 ?auto_2421 ) ) ( not ( = ?auto_2419 ?auto_2421 ) ) ( not ( = ?auto_2420 ?auto_2421 ) ) ( not ( = ?auto_2429 ?auto_2430 ) ) ( not ( = ?auto_2429 ?auto_2431 ) ) ( not ( = ?auto_2429 ?auto_2433 ) ) ( not ( = ?auto_2417 ?auto_2422 ) ) ( not ( = ?auto_2419 ?auto_2422 ) ) ( not ( = ?auto_2420 ?auto_2422 ) ) ( not ( = ?auto_2421 ?auto_2422 ) ) ( not ( = ?auto_2432 ?auto_2429 ) ) ( not ( = ?auto_2432 ?auto_2430 ) ) ( not ( = ?auto_2432 ?auto_2431 ) ) ( not ( = ?auto_2432 ?auto_2433 ) ) ( not ( = ?auto_2417 ?auto_2423 ) ) ( not ( = ?auto_2419 ?auto_2423 ) ) ( not ( = ?auto_2420 ?auto_2423 ) ) ( not ( = ?auto_2421 ?auto_2423 ) ) ( not ( = ?auto_2422 ?auto_2423 ) ) ( not ( = ?auto_2428 ?auto_2432 ) ) ( not ( = ?auto_2428 ?auto_2429 ) ) ( not ( = ?auto_2428 ?auto_2430 ) ) ( not ( = ?auto_2428 ?auto_2431 ) ) ( not ( = ?auto_2428 ?auto_2433 ) ) ( not ( = ?auto_2417 ?auto_2424 ) ) ( not ( = ?auto_2419 ?auto_2424 ) ) ( not ( = ?auto_2420 ?auto_2424 ) ) ( not ( = ?auto_2421 ?auto_2424 ) ) ( not ( = ?auto_2422 ?auto_2424 ) ) ( not ( = ?auto_2423 ?auto_2424 ) ) ( not ( = ?auto_2426 ?auto_2428 ) ) ( not ( = ?auto_2426 ?auto_2432 ) ) ( not ( = ?auto_2426 ?auto_2429 ) ) ( not ( = ?auto_2426 ?auto_2430 ) ) ( not ( = ?auto_2426 ?auto_2431 ) ) ( not ( = ?auto_2426 ?auto_2433 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2417 ?auto_2419 ?auto_2420 ?auto_2421 ?auto_2422 ?auto_2423 ?auto_2418 )
      ( DELIVER-1PKG ?auto_2424 ?auto_2418 )
      ( DELIVER-7PKG-VERIFY ?auto_2417 ?auto_2419 ?auto_2420 ?auto_2421 ?auto_2422 ?auto_2423 ?auto_2424 ?auto_2418 ) )
  )

)

