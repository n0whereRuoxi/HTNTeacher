( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) )
    :subtasks
    (  )
  )

  ( :method GET-2IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) )
    :subtasks
    (  )
  )

  ( :method GET-3IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2080 - DIRECTION
      ?auto_2081 - MODE
    )
    :vars
    (
      ?auto_2082 - INSTRUMENT
      ?auto_2083 - SATELLITE
      ?auto_2084 - DIRECTION
      ?auto_2085 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2082 ?auto_2083 ) ( SUPPORTS ?auto_2082 ?auto_2081 ) ( not ( = ?auto_2080 ?auto_2084 ) ) ( CALIBRATION_TARGET ?auto_2082 ?auto_2084 ) ( POWER_AVAIL ?auto_2083 ) ( POINTING ?auto_2083 ?auto_2085 ) ( not ( = ?auto_2084 ?auto_2085 ) ) ( not ( = ?auto_2080 ?auto_2085 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2083 ?auto_2084 ?auto_2085 )
      ( !SWITCH_ON ?auto_2082 ?auto_2083 )
      ( !CALIBRATE ?auto_2083 ?auto_2082 ?auto_2084 )
      ( !TURN_TO ?auto_2083 ?auto_2080 ?auto_2084 )
      ( !TAKE_IMAGE ?auto_2083 ?auto_2080 ?auto_2082 ?auto_2081 )
      ( GET-1IMAGE-VERIFY ?auto_2080 ?auto_2081 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2088 - DIRECTION
      ?auto_2089 - MODE
    )
    :vars
    (
      ?auto_2090 - INSTRUMENT
      ?auto_2091 - SATELLITE
      ?auto_2092 - DIRECTION
      ?auto_2093 - DIRECTION
      ?auto_2094 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2090 ?auto_2091 ) ( SUPPORTS ?auto_2090 ?auto_2089 ) ( not ( = ?auto_2088 ?auto_2092 ) ) ( CALIBRATION_TARGET ?auto_2090 ?auto_2092 ) ( POINTING ?auto_2091 ?auto_2093 ) ( not ( = ?auto_2092 ?auto_2093 ) ) ( ON_BOARD ?auto_2094 ?auto_2091 ) ( POWER_ON ?auto_2094 ) ( not ( = ?auto_2088 ?auto_2093 ) ) ( not ( = ?auto_2090 ?auto_2094 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2094 ?auto_2091 )
      ( !TURN_TO ?auto_2091 ?auto_2092 ?auto_2093 )
      ( !SWITCH_ON ?auto_2090 ?auto_2091 )
      ( !CALIBRATE ?auto_2091 ?auto_2090 ?auto_2092 )
      ( !TURN_TO ?auto_2091 ?auto_2088 ?auto_2092 )
      ( !TAKE_IMAGE ?auto_2091 ?auto_2088 ?auto_2090 ?auto_2089 )
      ( GET-1IMAGE-VERIFY ?auto_2088 ?auto_2089 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2107 - DIRECTION
      ?auto_2108 - MODE
      ?auto_2110 - DIRECTION
      ?auto_2109 - MODE
    )
    :vars
    (
      ?auto_2112 - INSTRUMENT
      ?auto_2113 - SATELLITE
      ?auto_2111 - DIRECTION
      ?auto_2114 - INSTRUMENT
      ?auto_2115 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2110 ?auto_2107 ) ) ( ON_BOARD ?auto_2112 ?auto_2113 ) ( SUPPORTS ?auto_2112 ?auto_2109 ) ( not ( = ?auto_2110 ?auto_2111 ) ) ( CALIBRATION_TARGET ?auto_2112 ?auto_2111 ) ( not ( = ?auto_2111 ?auto_2107 ) ) ( ON_BOARD ?auto_2114 ?auto_2113 ) ( not ( = ?auto_2112 ?auto_2114 ) ) ( SUPPORTS ?auto_2114 ?auto_2108 ) ( CALIBRATION_TARGET ?auto_2114 ?auto_2111 ) ( POWER_AVAIL ?auto_2113 ) ( POINTING ?auto_2113 ?auto_2115 ) ( not ( = ?auto_2111 ?auto_2115 ) ) ( not ( = ?auto_2107 ?auto_2115 ) ) ( not ( = ?auto_2108 ?auto_2109 ) ) ( not ( = ?auto_2110 ?auto_2115 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2107 ?auto_2108 )
      ( GET-1IMAGE ?auto_2110 ?auto_2109 )
      ( GET-2IMAGE-VERIFY ?auto_2107 ?auto_2108 ?auto_2110 ?auto_2109 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2116 - DIRECTION
      ?auto_2117 - MODE
      ?auto_2119 - DIRECTION
      ?auto_2118 - MODE
    )
    :vars
    (
      ?auto_2122 - INSTRUMENT
      ?auto_2124 - SATELLITE
      ?auto_2120 - DIRECTION
      ?auto_2121 - INSTRUMENT
      ?auto_2123 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2119 ?auto_2116 ) ) ( ON_BOARD ?auto_2122 ?auto_2124 ) ( SUPPORTS ?auto_2122 ?auto_2117 ) ( not ( = ?auto_2116 ?auto_2120 ) ) ( CALIBRATION_TARGET ?auto_2122 ?auto_2120 ) ( not ( = ?auto_2120 ?auto_2119 ) ) ( ON_BOARD ?auto_2121 ?auto_2124 ) ( not ( = ?auto_2122 ?auto_2121 ) ) ( SUPPORTS ?auto_2121 ?auto_2118 ) ( CALIBRATION_TARGET ?auto_2121 ?auto_2120 ) ( POWER_AVAIL ?auto_2124 ) ( POINTING ?auto_2124 ?auto_2123 ) ( not ( = ?auto_2120 ?auto_2123 ) ) ( not ( = ?auto_2119 ?auto_2123 ) ) ( not ( = ?auto_2118 ?auto_2117 ) ) ( not ( = ?auto_2116 ?auto_2123 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2119 ?auto_2118 ?auto_2116 ?auto_2117 )
      ( GET-2IMAGE-VERIFY ?auto_2116 ?auto_2117 ?auto_2119 ?auto_2118 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2138 - DIRECTION
      ?auto_2139 - MODE
    )
    :vars
    (
      ?auto_2140 - INSTRUMENT
      ?auto_2141 - SATELLITE
      ?auto_2142 - DIRECTION
      ?auto_2143 - DIRECTION
      ?auto_2144 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2140 ?auto_2141 ) ( SUPPORTS ?auto_2140 ?auto_2139 ) ( not ( = ?auto_2138 ?auto_2142 ) ) ( CALIBRATION_TARGET ?auto_2140 ?auto_2142 ) ( POINTING ?auto_2141 ?auto_2143 ) ( not ( = ?auto_2142 ?auto_2143 ) ) ( ON_BOARD ?auto_2144 ?auto_2141 ) ( POWER_ON ?auto_2144 ) ( not ( = ?auto_2138 ?auto_2143 ) ) ( not ( = ?auto_2140 ?auto_2144 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2144 ?auto_2141 )
      ( !TURN_TO ?auto_2141 ?auto_2142 ?auto_2143 )
      ( !SWITCH_ON ?auto_2140 ?auto_2141 )
      ( !CALIBRATE ?auto_2141 ?auto_2140 ?auto_2142 )
      ( !TURN_TO ?auto_2141 ?auto_2138 ?auto_2142 )
      ( !TAKE_IMAGE ?auto_2141 ?auto_2138 ?auto_2140 ?auto_2139 )
      ( GET-1IMAGE-VERIFY ?auto_2138 ?auto_2139 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2273 - DIRECTION
      ?auto_2274 - MODE
      ?auto_2276 - DIRECTION
      ?auto_2275 - MODE
      ?auto_2277 - DIRECTION
      ?auto_2278 - MODE
    )
    :vars
    (
      ?auto_2279 - INSTRUMENT
      ?auto_2281 - SATELLITE
      ?auto_2280 - DIRECTION
      ?auto_2282 - INSTRUMENT
      ?auto_2284 - INSTRUMENT
      ?auto_2283 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2276 ?auto_2273 ) ) ( not ( = ?auto_2277 ?auto_2273 ) ) ( not ( = ?auto_2277 ?auto_2276 ) ) ( ON_BOARD ?auto_2279 ?auto_2281 ) ( SUPPORTS ?auto_2279 ?auto_2278 ) ( not ( = ?auto_2277 ?auto_2280 ) ) ( CALIBRATION_TARGET ?auto_2279 ?auto_2280 ) ( not ( = ?auto_2280 ?auto_2276 ) ) ( ON_BOARD ?auto_2282 ?auto_2281 ) ( not ( = ?auto_2279 ?auto_2282 ) ) ( SUPPORTS ?auto_2282 ?auto_2275 ) ( CALIBRATION_TARGET ?auto_2282 ?auto_2280 ) ( not ( = ?auto_2280 ?auto_2273 ) ) ( ON_BOARD ?auto_2284 ?auto_2281 ) ( not ( = ?auto_2282 ?auto_2284 ) ) ( SUPPORTS ?auto_2284 ?auto_2274 ) ( CALIBRATION_TARGET ?auto_2284 ?auto_2280 ) ( POWER_AVAIL ?auto_2281 ) ( POINTING ?auto_2281 ?auto_2283 ) ( not ( = ?auto_2280 ?auto_2283 ) ) ( not ( = ?auto_2273 ?auto_2283 ) ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( not ( = ?auto_2276 ?auto_2283 ) ) ( not ( = ?auto_2274 ?auto_2278 ) ) ( not ( = ?auto_2275 ?auto_2278 ) ) ( not ( = ?auto_2277 ?auto_2283 ) ) ( not ( = ?auto_2279 ?auto_2284 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2276 ?auto_2275 ?auto_2273 ?auto_2274 )
      ( GET-1IMAGE ?auto_2277 ?auto_2278 )
      ( GET-3IMAGE-VERIFY ?auto_2273 ?auto_2274 ?auto_2276 ?auto_2275 ?auto_2277 ?auto_2278 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2299 - DIRECTION
      ?auto_2300 - MODE
      ?auto_2302 - DIRECTION
      ?auto_2301 - MODE
      ?auto_2303 - DIRECTION
      ?auto_2304 - MODE
    )
    :vars
    (
      ?auto_2306 - INSTRUMENT
      ?auto_2309 - SATELLITE
      ?auto_2307 - DIRECTION
      ?auto_2308 - INSTRUMENT
      ?auto_2310 - INSTRUMENT
      ?auto_2305 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2302 ?auto_2299 ) ) ( not ( = ?auto_2303 ?auto_2299 ) ) ( not ( = ?auto_2303 ?auto_2302 ) ) ( ON_BOARD ?auto_2306 ?auto_2309 ) ( SUPPORTS ?auto_2306 ?auto_2301 ) ( not ( = ?auto_2302 ?auto_2307 ) ) ( CALIBRATION_TARGET ?auto_2306 ?auto_2307 ) ( not ( = ?auto_2307 ?auto_2303 ) ) ( ON_BOARD ?auto_2308 ?auto_2309 ) ( not ( = ?auto_2306 ?auto_2308 ) ) ( SUPPORTS ?auto_2308 ?auto_2304 ) ( CALIBRATION_TARGET ?auto_2308 ?auto_2307 ) ( not ( = ?auto_2307 ?auto_2299 ) ) ( ON_BOARD ?auto_2310 ?auto_2309 ) ( not ( = ?auto_2308 ?auto_2310 ) ) ( SUPPORTS ?auto_2310 ?auto_2300 ) ( CALIBRATION_TARGET ?auto_2310 ?auto_2307 ) ( POWER_AVAIL ?auto_2309 ) ( POINTING ?auto_2309 ?auto_2305 ) ( not ( = ?auto_2307 ?auto_2305 ) ) ( not ( = ?auto_2299 ?auto_2305 ) ) ( not ( = ?auto_2300 ?auto_2304 ) ) ( not ( = ?auto_2303 ?auto_2305 ) ) ( not ( = ?auto_2300 ?auto_2301 ) ) ( not ( = ?auto_2304 ?auto_2301 ) ) ( not ( = ?auto_2302 ?auto_2305 ) ) ( not ( = ?auto_2306 ?auto_2310 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2299 ?auto_2300 ?auto_2303 ?auto_2304 ?auto_2302 ?auto_2301 )
      ( GET-3IMAGE-VERIFY ?auto_2299 ?auto_2300 ?auto_2302 ?auto_2301 ?auto_2303 ?auto_2304 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2325 - DIRECTION
      ?auto_2326 - MODE
      ?auto_2328 - DIRECTION
      ?auto_2327 - MODE
      ?auto_2329 - DIRECTION
      ?auto_2330 - MODE
    )
    :vars
    (
      ?auto_2332 - INSTRUMENT
      ?auto_2333 - SATELLITE
      ?auto_2334 - DIRECTION
      ?auto_2335 - INSTRUMENT
      ?auto_2336 - INSTRUMENT
      ?auto_2331 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2328 ?auto_2325 ) ) ( not ( = ?auto_2329 ?auto_2325 ) ) ( not ( = ?auto_2329 ?auto_2328 ) ) ( ON_BOARD ?auto_2332 ?auto_2333 ) ( SUPPORTS ?auto_2332 ?auto_2330 ) ( not ( = ?auto_2329 ?auto_2334 ) ) ( CALIBRATION_TARGET ?auto_2332 ?auto_2334 ) ( not ( = ?auto_2334 ?auto_2325 ) ) ( ON_BOARD ?auto_2335 ?auto_2333 ) ( not ( = ?auto_2332 ?auto_2335 ) ) ( SUPPORTS ?auto_2335 ?auto_2326 ) ( CALIBRATION_TARGET ?auto_2335 ?auto_2334 ) ( not ( = ?auto_2334 ?auto_2328 ) ) ( ON_BOARD ?auto_2336 ?auto_2333 ) ( not ( = ?auto_2335 ?auto_2336 ) ) ( SUPPORTS ?auto_2336 ?auto_2327 ) ( CALIBRATION_TARGET ?auto_2336 ?auto_2334 ) ( POWER_AVAIL ?auto_2333 ) ( POINTING ?auto_2333 ?auto_2331 ) ( not ( = ?auto_2334 ?auto_2331 ) ) ( not ( = ?auto_2328 ?auto_2331 ) ) ( not ( = ?auto_2327 ?auto_2326 ) ) ( not ( = ?auto_2325 ?auto_2331 ) ) ( not ( = ?auto_2327 ?auto_2330 ) ) ( not ( = ?auto_2326 ?auto_2330 ) ) ( not ( = ?auto_2329 ?auto_2331 ) ) ( not ( = ?auto_2332 ?auto_2336 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2328 ?auto_2327 ?auto_2329 ?auto_2330 ?auto_2325 ?auto_2326 )
      ( GET-3IMAGE-VERIFY ?auto_2325 ?auto_2326 ?auto_2328 ?auto_2327 ?auto_2329 ?auto_2330 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2351 - DIRECTION
      ?auto_2352 - MODE
      ?auto_2354 - DIRECTION
      ?auto_2353 - MODE
      ?auto_2355 - DIRECTION
      ?auto_2356 - MODE
    )
    :vars
    (
      ?auto_2358 - INSTRUMENT
      ?auto_2359 - SATELLITE
      ?auto_2360 - DIRECTION
      ?auto_2361 - INSTRUMENT
      ?auto_2362 - INSTRUMENT
      ?auto_2357 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2354 ?auto_2351 ) ) ( not ( = ?auto_2355 ?auto_2351 ) ) ( not ( = ?auto_2355 ?auto_2354 ) ) ( ON_BOARD ?auto_2358 ?auto_2359 ) ( SUPPORTS ?auto_2358 ?auto_2353 ) ( not ( = ?auto_2354 ?auto_2360 ) ) ( CALIBRATION_TARGET ?auto_2358 ?auto_2360 ) ( not ( = ?auto_2360 ?auto_2351 ) ) ( ON_BOARD ?auto_2361 ?auto_2359 ) ( not ( = ?auto_2358 ?auto_2361 ) ) ( SUPPORTS ?auto_2361 ?auto_2352 ) ( CALIBRATION_TARGET ?auto_2361 ?auto_2360 ) ( not ( = ?auto_2360 ?auto_2355 ) ) ( ON_BOARD ?auto_2362 ?auto_2359 ) ( not ( = ?auto_2361 ?auto_2362 ) ) ( SUPPORTS ?auto_2362 ?auto_2356 ) ( CALIBRATION_TARGET ?auto_2362 ?auto_2360 ) ( POWER_AVAIL ?auto_2359 ) ( POINTING ?auto_2359 ?auto_2357 ) ( not ( = ?auto_2360 ?auto_2357 ) ) ( not ( = ?auto_2355 ?auto_2357 ) ) ( not ( = ?auto_2356 ?auto_2352 ) ) ( not ( = ?auto_2351 ?auto_2357 ) ) ( not ( = ?auto_2356 ?auto_2353 ) ) ( not ( = ?auto_2352 ?auto_2353 ) ) ( not ( = ?auto_2354 ?auto_2357 ) ) ( not ( = ?auto_2358 ?auto_2362 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2355 ?auto_2356 ?auto_2354 ?auto_2353 ?auto_2351 ?auto_2352 )
      ( GET-3IMAGE-VERIFY ?auto_2351 ?auto_2352 ?auto_2354 ?auto_2353 ?auto_2355 ?auto_2356 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2405 - DIRECTION
      ?auto_2406 - MODE
      ?auto_2408 - DIRECTION
      ?auto_2407 - MODE
      ?auto_2409 - DIRECTION
      ?auto_2410 - MODE
    )
    :vars
    (
      ?auto_2412 - INSTRUMENT
      ?auto_2413 - SATELLITE
      ?auto_2414 - DIRECTION
      ?auto_2415 - INSTRUMENT
      ?auto_2416 - INSTRUMENT
      ?auto_2411 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2408 ?auto_2405 ) ) ( not ( = ?auto_2409 ?auto_2405 ) ) ( not ( = ?auto_2409 ?auto_2408 ) ) ( ON_BOARD ?auto_2412 ?auto_2413 ) ( SUPPORTS ?auto_2412 ?auto_2406 ) ( not ( = ?auto_2405 ?auto_2414 ) ) ( CALIBRATION_TARGET ?auto_2412 ?auto_2414 ) ( not ( = ?auto_2414 ?auto_2409 ) ) ( ON_BOARD ?auto_2415 ?auto_2413 ) ( not ( = ?auto_2412 ?auto_2415 ) ) ( SUPPORTS ?auto_2415 ?auto_2410 ) ( CALIBRATION_TARGET ?auto_2415 ?auto_2414 ) ( not ( = ?auto_2414 ?auto_2408 ) ) ( ON_BOARD ?auto_2416 ?auto_2413 ) ( not ( = ?auto_2415 ?auto_2416 ) ) ( SUPPORTS ?auto_2416 ?auto_2407 ) ( CALIBRATION_TARGET ?auto_2416 ?auto_2414 ) ( POWER_AVAIL ?auto_2413 ) ( POINTING ?auto_2413 ?auto_2411 ) ( not ( = ?auto_2414 ?auto_2411 ) ) ( not ( = ?auto_2408 ?auto_2411 ) ) ( not ( = ?auto_2407 ?auto_2410 ) ) ( not ( = ?auto_2409 ?auto_2411 ) ) ( not ( = ?auto_2407 ?auto_2406 ) ) ( not ( = ?auto_2410 ?auto_2406 ) ) ( not ( = ?auto_2405 ?auto_2411 ) ) ( not ( = ?auto_2412 ?auto_2416 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2408 ?auto_2407 ?auto_2405 ?auto_2406 ?auto_2409 ?auto_2410 )
      ( GET-3IMAGE-VERIFY ?auto_2405 ?auto_2406 ?auto_2408 ?auto_2407 ?auto_2409 ?auto_2410 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2431 - DIRECTION
      ?auto_2432 - MODE
      ?auto_2434 - DIRECTION
      ?auto_2433 - MODE
      ?auto_2435 - DIRECTION
      ?auto_2436 - MODE
    )
    :vars
    (
      ?auto_2438 - INSTRUMENT
      ?auto_2439 - SATELLITE
      ?auto_2440 - DIRECTION
      ?auto_2441 - INSTRUMENT
      ?auto_2442 - INSTRUMENT
      ?auto_2437 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2434 ?auto_2431 ) ) ( not ( = ?auto_2435 ?auto_2431 ) ) ( not ( = ?auto_2435 ?auto_2434 ) ) ( ON_BOARD ?auto_2438 ?auto_2439 ) ( SUPPORTS ?auto_2438 ?auto_2432 ) ( not ( = ?auto_2431 ?auto_2440 ) ) ( CALIBRATION_TARGET ?auto_2438 ?auto_2440 ) ( not ( = ?auto_2440 ?auto_2434 ) ) ( ON_BOARD ?auto_2441 ?auto_2439 ) ( not ( = ?auto_2438 ?auto_2441 ) ) ( SUPPORTS ?auto_2441 ?auto_2433 ) ( CALIBRATION_TARGET ?auto_2441 ?auto_2440 ) ( not ( = ?auto_2440 ?auto_2435 ) ) ( ON_BOARD ?auto_2442 ?auto_2439 ) ( not ( = ?auto_2441 ?auto_2442 ) ) ( SUPPORTS ?auto_2442 ?auto_2436 ) ( CALIBRATION_TARGET ?auto_2442 ?auto_2440 ) ( POWER_AVAIL ?auto_2439 ) ( POINTING ?auto_2439 ?auto_2437 ) ( not ( = ?auto_2440 ?auto_2437 ) ) ( not ( = ?auto_2435 ?auto_2437 ) ) ( not ( = ?auto_2436 ?auto_2433 ) ) ( not ( = ?auto_2434 ?auto_2437 ) ) ( not ( = ?auto_2436 ?auto_2432 ) ) ( not ( = ?auto_2433 ?auto_2432 ) ) ( not ( = ?auto_2431 ?auto_2437 ) ) ( not ( = ?auto_2438 ?auto_2442 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2435 ?auto_2436 ?auto_2431 ?auto_2432 ?auto_2434 ?auto_2433 )
      ( GET-3IMAGE-VERIFY ?auto_2431 ?auto_2432 ?auto_2434 ?auto_2433 ?auto_2435 ?auto_2436 ) )
  )

)

