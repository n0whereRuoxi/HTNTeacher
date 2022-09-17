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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9285 - SURFACE
      ?auto_9286 - SURFACE
    )
    :vars
    (
      ?auto_9287 - HOIST
      ?auto_9288 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9287 ?auto_9288 ) ( SURFACE-AT ?auto_9285 ?auto_9288 ) ( CLEAR ?auto_9285 ) ( LIFTING ?auto_9287 ?auto_9286 ) ( IS-CRATE ?auto_9286 ) ( not ( = ?auto_9285 ?auto_9286 ) ) )
    :subtasks
    ( ( !DROP ?auto_9287 ?auto_9286 ?auto_9285 ?auto_9288 )
      ( MAKE-1CRATE-VERIFY ?auto_9285 ?auto_9286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9289 - SURFACE
      ?auto_9290 - SURFACE
    )
    :vars
    (
      ?auto_9291 - HOIST
      ?auto_9292 - PLACE
      ?auto_9293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9291 ?auto_9292 ) ( SURFACE-AT ?auto_9289 ?auto_9292 ) ( CLEAR ?auto_9289 ) ( IS-CRATE ?auto_9290 ) ( not ( = ?auto_9289 ?auto_9290 ) ) ( TRUCK-AT ?auto_9293 ?auto_9292 ) ( AVAILABLE ?auto_9291 ) ( IN ?auto_9290 ?auto_9293 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9291 ?auto_9290 ?auto_9293 ?auto_9292 )
      ( MAKE-1CRATE ?auto_9289 ?auto_9290 )
      ( MAKE-1CRATE-VERIFY ?auto_9289 ?auto_9290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9294 - SURFACE
      ?auto_9295 - SURFACE
    )
    :vars
    (
      ?auto_9298 - HOIST
      ?auto_9296 - PLACE
      ?auto_9297 - TRUCK
      ?auto_9299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9298 ?auto_9296 ) ( SURFACE-AT ?auto_9294 ?auto_9296 ) ( CLEAR ?auto_9294 ) ( IS-CRATE ?auto_9295 ) ( not ( = ?auto_9294 ?auto_9295 ) ) ( AVAILABLE ?auto_9298 ) ( IN ?auto_9295 ?auto_9297 ) ( TRUCK-AT ?auto_9297 ?auto_9299 ) ( not ( = ?auto_9299 ?auto_9296 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9297 ?auto_9299 ?auto_9296 )
      ( MAKE-1CRATE ?auto_9294 ?auto_9295 )
      ( MAKE-1CRATE-VERIFY ?auto_9294 ?auto_9295 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9300 - SURFACE
      ?auto_9301 - SURFACE
    )
    :vars
    (
      ?auto_9303 - HOIST
      ?auto_9302 - PLACE
      ?auto_9305 - TRUCK
      ?auto_9304 - PLACE
      ?auto_9306 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9303 ?auto_9302 ) ( SURFACE-AT ?auto_9300 ?auto_9302 ) ( CLEAR ?auto_9300 ) ( IS-CRATE ?auto_9301 ) ( not ( = ?auto_9300 ?auto_9301 ) ) ( AVAILABLE ?auto_9303 ) ( TRUCK-AT ?auto_9305 ?auto_9304 ) ( not ( = ?auto_9304 ?auto_9302 ) ) ( HOIST-AT ?auto_9306 ?auto_9304 ) ( LIFTING ?auto_9306 ?auto_9301 ) ( not ( = ?auto_9303 ?auto_9306 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9306 ?auto_9301 ?auto_9305 ?auto_9304 )
      ( MAKE-1CRATE ?auto_9300 ?auto_9301 )
      ( MAKE-1CRATE-VERIFY ?auto_9300 ?auto_9301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9307 - SURFACE
      ?auto_9308 - SURFACE
    )
    :vars
    (
      ?auto_9310 - HOIST
      ?auto_9311 - PLACE
      ?auto_9309 - TRUCK
      ?auto_9313 - PLACE
      ?auto_9312 - HOIST
      ?auto_9314 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9310 ?auto_9311 ) ( SURFACE-AT ?auto_9307 ?auto_9311 ) ( CLEAR ?auto_9307 ) ( IS-CRATE ?auto_9308 ) ( not ( = ?auto_9307 ?auto_9308 ) ) ( AVAILABLE ?auto_9310 ) ( TRUCK-AT ?auto_9309 ?auto_9313 ) ( not ( = ?auto_9313 ?auto_9311 ) ) ( HOIST-AT ?auto_9312 ?auto_9313 ) ( not ( = ?auto_9310 ?auto_9312 ) ) ( AVAILABLE ?auto_9312 ) ( SURFACE-AT ?auto_9308 ?auto_9313 ) ( ON ?auto_9308 ?auto_9314 ) ( CLEAR ?auto_9308 ) ( not ( = ?auto_9307 ?auto_9314 ) ) ( not ( = ?auto_9308 ?auto_9314 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9312 ?auto_9308 ?auto_9314 ?auto_9313 )
      ( MAKE-1CRATE ?auto_9307 ?auto_9308 )
      ( MAKE-1CRATE-VERIFY ?auto_9307 ?auto_9308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9315 - SURFACE
      ?auto_9316 - SURFACE
    )
    :vars
    (
      ?auto_9320 - HOIST
      ?auto_9322 - PLACE
      ?auto_9317 - PLACE
      ?auto_9321 - HOIST
      ?auto_9319 - SURFACE
      ?auto_9318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9320 ?auto_9322 ) ( SURFACE-AT ?auto_9315 ?auto_9322 ) ( CLEAR ?auto_9315 ) ( IS-CRATE ?auto_9316 ) ( not ( = ?auto_9315 ?auto_9316 ) ) ( AVAILABLE ?auto_9320 ) ( not ( = ?auto_9317 ?auto_9322 ) ) ( HOIST-AT ?auto_9321 ?auto_9317 ) ( not ( = ?auto_9320 ?auto_9321 ) ) ( AVAILABLE ?auto_9321 ) ( SURFACE-AT ?auto_9316 ?auto_9317 ) ( ON ?auto_9316 ?auto_9319 ) ( CLEAR ?auto_9316 ) ( not ( = ?auto_9315 ?auto_9319 ) ) ( not ( = ?auto_9316 ?auto_9319 ) ) ( TRUCK-AT ?auto_9318 ?auto_9322 ) )
    :subtasks
    ( ( !DRIVE ?auto_9318 ?auto_9322 ?auto_9317 )
      ( MAKE-1CRATE ?auto_9315 ?auto_9316 )
      ( MAKE-1CRATE-VERIFY ?auto_9315 ?auto_9316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9332 - SURFACE
      ?auto_9333 - SURFACE
      ?auto_9334 - SURFACE
    )
    :vars
    (
      ?auto_9335 - HOIST
      ?auto_9336 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9335 ?auto_9336 ) ( SURFACE-AT ?auto_9333 ?auto_9336 ) ( CLEAR ?auto_9333 ) ( LIFTING ?auto_9335 ?auto_9334 ) ( IS-CRATE ?auto_9334 ) ( not ( = ?auto_9333 ?auto_9334 ) ) ( ON ?auto_9333 ?auto_9332 ) ( not ( = ?auto_9332 ?auto_9333 ) ) ( not ( = ?auto_9332 ?auto_9334 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9333 ?auto_9334 )
      ( MAKE-2CRATE-VERIFY ?auto_9332 ?auto_9333 ?auto_9334 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9342 - SURFACE
      ?auto_9343 - SURFACE
      ?auto_9344 - SURFACE
    )
    :vars
    (
      ?auto_9345 - HOIST
      ?auto_9346 - PLACE
      ?auto_9347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9345 ?auto_9346 ) ( SURFACE-AT ?auto_9343 ?auto_9346 ) ( CLEAR ?auto_9343 ) ( IS-CRATE ?auto_9344 ) ( not ( = ?auto_9343 ?auto_9344 ) ) ( TRUCK-AT ?auto_9347 ?auto_9346 ) ( AVAILABLE ?auto_9345 ) ( IN ?auto_9344 ?auto_9347 ) ( ON ?auto_9343 ?auto_9342 ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( not ( = ?auto_9342 ?auto_9344 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9343 ?auto_9344 )
      ( MAKE-2CRATE-VERIFY ?auto_9342 ?auto_9343 ?auto_9344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9348 - SURFACE
      ?auto_9349 - SURFACE
    )
    :vars
    (
      ?auto_9350 - HOIST
      ?auto_9352 - PLACE
      ?auto_9351 - TRUCK
      ?auto_9353 - SURFACE
      ?auto_9354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9350 ?auto_9352 ) ( SURFACE-AT ?auto_9348 ?auto_9352 ) ( CLEAR ?auto_9348 ) ( IS-CRATE ?auto_9349 ) ( not ( = ?auto_9348 ?auto_9349 ) ) ( AVAILABLE ?auto_9350 ) ( IN ?auto_9349 ?auto_9351 ) ( ON ?auto_9348 ?auto_9353 ) ( not ( = ?auto_9353 ?auto_9348 ) ) ( not ( = ?auto_9353 ?auto_9349 ) ) ( TRUCK-AT ?auto_9351 ?auto_9354 ) ( not ( = ?auto_9354 ?auto_9352 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9351 ?auto_9354 ?auto_9352 )
      ( MAKE-2CRATE ?auto_9353 ?auto_9348 ?auto_9349 )
      ( MAKE-1CRATE-VERIFY ?auto_9348 ?auto_9349 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9355 - SURFACE
      ?auto_9356 - SURFACE
      ?auto_9357 - SURFACE
    )
    :vars
    (
      ?auto_9359 - HOIST
      ?auto_9361 - PLACE
      ?auto_9360 - TRUCK
      ?auto_9358 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9359 ?auto_9361 ) ( SURFACE-AT ?auto_9356 ?auto_9361 ) ( CLEAR ?auto_9356 ) ( IS-CRATE ?auto_9357 ) ( not ( = ?auto_9356 ?auto_9357 ) ) ( AVAILABLE ?auto_9359 ) ( IN ?auto_9357 ?auto_9360 ) ( ON ?auto_9356 ?auto_9355 ) ( not ( = ?auto_9355 ?auto_9356 ) ) ( not ( = ?auto_9355 ?auto_9357 ) ) ( TRUCK-AT ?auto_9360 ?auto_9358 ) ( not ( = ?auto_9358 ?auto_9361 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9356 ?auto_9357 )
      ( MAKE-2CRATE-VERIFY ?auto_9355 ?auto_9356 ?auto_9357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9362 - SURFACE
      ?auto_9363 - SURFACE
    )
    :vars
    (
      ?auto_9364 - HOIST
      ?auto_9365 - PLACE
      ?auto_9368 - SURFACE
      ?auto_9366 - TRUCK
      ?auto_9367 - PLACE
      ?auto_9369 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9364 ?auto_9365 ) ( SURFACE-AT ?auto_9362 ?auto_9365 ) ( CLEAR ?auto_9362 ) ( IS-CRATE ?auto_9363 ) ( not ( = ?auto_9362 ?auto_9363 ) ) ( AVAILABLE ?auto_9364 ) ( ON ?auto_9362 ?auto_9368 ) ( not ( = ?auto_9368 ?auto_9362 ) ) ( not ( = ?auto_9368 ?auto_9363 ) ) ( TRUCK-AT ?auto_9366 ?auto_9367 ) ( not ( = ?auto_9367 ?auto_9365 ) ) ( HOIST-AT ?auto_9369 ?auto_9367 ) ( LIFTING ?auto_9369 ?auto_9363 ) ( not ( = ?auto_9364 ?auto_9369 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9369 ?auto_9363 ?auto_9366 ?auto_9367 )
      ( MAKE-2CRATE ?auto_9368 ?auto_9362 ?auto_9363 )
      ( MAKE-1CRATE-VERIFY ?auto_9362 ?auto_9363 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9370 - SURFACE
      ?auto_9371 - SURFACE
      ?auto_9372 - SURFACE
    )
    :vars
    (
      ?auto_9376 - HOIST
      ?auto_9377 - PLACE
      ?auto_9373 - TRUCK
      ?auto_9375 - PLACE
      ?auto_9374 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9376 ?auto_9377 ) ( SURFACE-AT ?auto_9371 ?auto_9377 ) ( CLEAR ?auto_9371 ) ( IS-CRATE ?auto_9372 ) ( not ( = ?auto_9371 ?auto_9372 ) ) ( AVAILABLE ?auto_9376 ) ( ON ?auto_9371 ?auto_9370 ) ( not ( = ?auto_9370 ?auto_9371 ) ) ( not ( = ?auto_9370 ?auto_9372 ) ) ( TRUCK-AT ?auto_9373 ?auto_9375 ) ( not ( = ?auto_9375 ?auto_9377 ) ) ( HOIST-AT ?auto_9374 ?auto_9375 ) ( LIFTING ?auto_9374 ?auto_9372 ) ( not ( = ?auto_9376 ?auto_9374 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9371 ?auto_9372 )
      ( MAKE-2CRATE-VERIFY ?auto_9370 ?auto_9371 ?auto_9372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9378 - SURFACE
      ?auto_9379 - SURFACE
    )
    :vars
    (
      ?auto_9384 - HOIST
      ?auto_9383 - PLACE
      ?auto_9385 - SURFACE
      ?auto_9380 - TRUCK
      ?auto_9382 - PLACE
      ?auto_9381 - HOIST
      ?auto_9386 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9384 ?auto_9383 ) ( SURFACE-AT ?auto_9378 ?auto_9383 ) ( CLEAR ?auto_9378 ) ( IS-CRATE ?auto_9379 ) ( not ( = ?auto_9378 ?auto_9379 ) ) ( AVAILABLE ?auto_9384 ) ( ON ?auto_9378 ?auto_9385 ) ( not ( = ?auto_9385 ?auto_9378 ) ) ( not ( = ?auto_9385 ?auto_9379 ) ) ( TRUCK-AT ?auto_9380 ?auto_9382 ) ( not ( = ?auto_9382 ?auto_9383 ) ) ( HOIST-AT ?auto_9381 ?auto_9382 ) ( not ( = ?auto_9384 ?auto_9381 ) ) ( AVAILABLE ?auto_9381 ) ( SURFACE-AT ?auto_9379 ?auto_9382 ) ( ON ?auto_9379 ?auto_9386 ) ( CLEAR ?auto_9379 ) ( not ( = ?auto_9378 ?auto_9386 ) ) ( not ( = ?auto_9379 ?auto_9386 ) ) ( not ( = ?auto_9385 ?auto_9386 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9381 ?auto_9379 ?auto_9386 ?auto_9382 )
      ( MAKE-2CRATE ?auto_9385 ?auto_9378 ?auto_9379 )
      ( MAKE-1CRATE-VERIFY ?auto_9378 ?auto_9379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9387 - SURFACE
      ?auto_9388 - SURFACE
      ?auto_9389 - SURFACE
    )
    :vars
    (
      ?auto_9392 - HOIST
      ?auto_9393 - PLACE
      ?auto_9394 - TRUCK
      ?auto_9395 - PLACE
      ?auto_9390 - HOIST
      ?auto_9391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9392 ?auto_9393 ) ( SURFACE-AT ?auto_9388 ?auto_9393 ) ( CLEAR ?auto_9388 ) ( IS-CRATE ?auto_9389 ) ( not ( = ?auto_9388 ?auto_9389 ) ) ( AVAILABLE ?auto_9392 ) ( ON ?auto_9388 ?auto_9387 ) ( not ( = ?auto_9387 ?auto_9388 ) ) ( not ( = ?auto_9387 ?auto_9389 ) ) ( TRUCK-AT ?auto_9394 ?auto_9395 ) ( not ( = ?auto_9395 ?auto_9393 ) ) ( HOIST-AT ?auto_9390 ?auto_9395 ) ( not ( = ?auto_9392 ?auto_9390 ) ) ( AVAILABLE ?auto_9390 ) ( SURFACE-AT ?auto_9389 ?auto_9395 ) ( ON ?auto_9389 ?auto_9391 ) ( CLEAR ?auto_9389 ) ( not ( = ?auto_9388 ?auto_9391 ) ) ( not ( = ?auto_9389 ?auto_9391 ) ) ( not ( = ?auto_9387 ?auto_9391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9388 ?auto_9389 )
      ( MAKE-2CRATE-VERIFY ?auto_9387 ?auto_9388 ?auto_9389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9396 - SURFACE
      ?auto_9397 - SURFACE
    )
    :vars
    (
      ?auto_9401 - HOIST
      ?auto_9398 - PLACE
      ?auto_9402 - SURFACE
      ?auto_9404 - PLACE
      ?auto_9400 - HOIST
      ?auto_9399 - SURFACE
      ?auto_9403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9401 ?auto_9398 ) ( SURFACE-AT ?auto_9396 ?auto_9398 ) ( CLEAR ?auto_9396 ) ( IS-CRATE ?auto_9397 ) ( not ( = ?auto_9396 ?auto_9397 ) ) ( AVAILABLE ?auto_9401 ) ( ON ?auto_9396 ?auto_9402 ) ( not ( = ?auto_9402 ?auto_9396 ) ) ( not ( = ?auto_9402 ?auto_9397 ) ) ( not ( = ?auto_9404 ?auto_9398 ) ) ( HOIST-AT ?auto_9400 ?auto_9404 ) ( not ( = ?auto_9401 ?auto_9400 ) ) ( AVAILABLE ?auto_9400 ) ( SURFACE-AT ?auto_9397 ?auto_9404 ) ( ON ?auto_9397 ?auto_9399 ) ( CLEAR ?auto_9397 ) ( not ( = ?auto_9396 ?auto_9399 ) ) ( not ( = ?auto_9397 ?auto_9399 ) ) ( not ( = ?auto_9402 ?auto_9399 ) ) ( TRUCK-AT ?auto_9403 ?auto_9398 ) )
    :subtasks
    ( ( !DRIVE ?auto_9403 ?auto_9398 ?auto_9404 )
      ( MAKE-2CRATE ?auto_9402 ?auto_9396 ?auto_9397 )
      ( MAKE-1CRATE-VERIFY ?auto_9396 ?auto_9397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9405 - SURFACE
      ?auto_9406 - SURFACE
      ?auto_9407 - SURFACE
    )
    :vars
    (
      ?auto_9412 - HOIST
      ?auto_9411 - PLACE
      ?auto_9413 - PLACE
      ?auto_9410 - HOIST
      ?auto_9409 - SURFACE
      ?auto_9408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9412 ?auto_9411 ) ( SURFACE-AT ?auto_9406 ?auto_9411 ) ( CLEAR ?auto_9406 ) ( IS-CRATE ?auto_9407 ) ( not ( = ?auto_9406 ?auto_9407 ) ) ( AVAILABLE ?auto_9412 ) ( ON ?auto_9406 ?auto_9405 ) ( not ( = ?auto_9405 ?auto_9406 ) ) ( not ( = ?auto_9405 ?auto_9407 ) ) ( not ( = ?auto_9413 ?auto_9411 ) ) ( HOIST-AT ?auto_9410 ?auto_9413 ) ( not ( = ?auto_9412 ?auto_9410 ) ) ( AVAILABLE ?auto_9410 ) ( SURFACE-AT ?auto_9407 ?auto_9413 ) ( ON ?auto_9407 ?auto_9409 ) ( CLEAR ?auto_9407 ) ( not ( = ?auto_9406 ?auto_9409 ) ) ( not ( = ?auto_9407 ?auto_9409 ) ) ( not ( = ?auto_9405 ?auto_9409 ) ) ( TRUCK-AT ?auto_9408 ?auto_9411 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9406 ?auto_9407 )
      ( MAKE-2CRATE-VERIFY ?auto_9405 ?auto_9406 ?auto_9407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9414 - SURFACE
      ?auto_9415 - SURFACE
    )
    :vars
    (
      ?auto_9420 - HOIST
      ?auto_9418 - PLACE
      ?auto_9416 - SURFACE
      ?auto_9422 - PLACE
      ?auto_9421 - HOIST
      ?auto_9419 - SURFACE
      ?auto_9417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9420 ?auto_9418 ) ( IS-CRATE ?auto_9415 ) ( not ( = ?auto_9414 ?auto_9415 ) ) ( not ( = ?auto_9416 ?auto_9414 ) ) ( not ( = ?auto_9416 ?auto_9415 ) ) ( not ( = ?auto_9422 ?auto_9418 ) ) ( HOIST-AT ?auto_9421 ?auto_9422 ) ( not ( = ?auto_9420 ?auto_9421 ) ) ( AVAILABLE ?auto_9421 ) ( SURFACE-AT ?auto_9415 ?auto_9422 ) ( ON ?auto_9415 ?auto_9419 ) ( CLEAR ?auto_9415 ) ( not ( = ?auto_9414 ?auto_9419 ) ) ( not ( = ?auto_9415 ?auto_9419 ) ) ( not ( = ?auto_9416 ?auto_9419 ) ) ( TRUCK-AT ?auto_9417 ?auto_9418 ) ( SURFACE-AT ?auto_9416 ?auto_9418 ) ( CLEAR ?auto_9416 ) ( LIFTING ?auto_9420 ?auto_9414 ) ( IS-CRATE ?auto_9414 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9416 ?auto_9414 )
      ( MAKE-2CRATE ?auto_9416 ?auto_9414 ?auto_9415 )
      ( MAKE-1CRATE-VERIFY ?auto_9414 ?auto_9415 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9423 - SURFACE
      ?auto_9424 - SURFACE
      ?auto_9425 - SURFACE
    )
    :vars
    (
      ?auto_9429 - HOIST
      ?auto_9431 - PLACE
      ?auto_9428 - PLACE
      ?auto_9430 - HOIST
      ?auto_9427 - SURFACE
      ?auto_9426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9429 ?auto_9431 ) ( IS-CRATE ?auto_9425 ) ( not ( = ?auto_9424 ?auto_9425 ) ) ( not ( = ?auto_9423 ?auto_9424 ) ) ( not ( = ?auto_9423 ?auto_9425 ) ) ( not ( = ?auto_9428 ?auto_9431 ) ) ( HOIST-AT ?auto_9430 ?auto_9428 ) ( not ( = ?auto_9429 ?auto_9430 ) ) ( AVAILABLE ?auto_9430 ) ( SURFACE-AT ?auto_9425 ?auto_9428 ) ( ON ?auto_9425 ?auto_9427 ) ( CLEAR ?auto_9425 ) ( not ( = ?auto_9424 ?auto_9427 ) ) ( not ( = ?auto_9425 ?auto_9427 ) ) ( not ( = ?auto_9423 ?auto_9427 ) ) ( TRUCK-AT ?auto_9426 ?auto_9431 ) ( SURFACE-AT ?auto_9423 ?auto_9431 ) ( CLEAR ?auto_9423 ) ( LIFTING ?auto_9429 ?auto_9424 ) ( IS-CRATE ?auto_9424 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9424 ?auto_9425 )
      ( MAKE-2CRATE-VERIFY ?auto_9423 ?auto_9424 ?auto_9425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9432 - SURFACE
      ?auto_9433 - SURFACE
    )
    :vars
    (
      ?auto_9440 - HOIST
      ?auto_9436 - PLACE
      ?auto_9435 - SURFACE
      ?auto_9439 - PLACE
      ?auto_9434 - HOIST
      ?auto_9437 - SURFACE
      ?auto_9438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9440 ?auto_9436 ) ( IS-CRATE ?auto_9433 ) ( not ( = ?auto_9432 ?auto_9433 ) ) ( not ( = ?auto_9435 ?auto_9432 ) ) ( not ( = ?auto_9435 ?auto_9433 ) ) ( not ( = ?auto_9439 ?auto_9436 ) ) ( HOIST-AT ?auto_9434 ?auto_9439 ) ( not ( = ?auto_9440 ?auto_9434 ) ) ( AVAILABLE ?auto_9434 ) ( SURFACE-AT ?auto_9433 ?auto_9439 ) ( ON ?auto_9433 ?auto_9437 ) ( CLEAR ?auto_9433 ) ( not ( = ?auto_9432 ?auto_9437 ) ) ( not ( = ?auto_9433 ?auto_9437 ) ) ( not ( = ?auto_9435 ?auto_9437 ) ) ( TRUCK-AT ?auto_9438 ?auto_9436 ) ( SURFACE-AT ?auto_9435 ?auto_9436 ) ( CLEAR ?auto_9435 ) ( IS-CRATE ?auto_9432 ) ( AVAILABLE ?auto_9440 ) ( IN ?auto_9432 ?auto_9438 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9440 ?auto_9432 ?auto_9438 ?auto_9436 )
      ( MAKE-2CRATE ?auto_9435 ?auto_9432 ?auto_9433 )
      ( MAKE-1CRATE-VERIFY ?auto_9432 ?auto_9433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9441 - SURFACE
      ?auto_9442 - SURFACE
      ?auto_9443 - SURFACE
    )
    :vars
    (
      ?auto_9445 - HOIST
      ?auto_9448 - PLACE
      ?auto_9444 - PLACE
      ?auto_9447 - HOIST
      ?auto_9449 - SURFACE
      ?auto_9446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9445 ?auto_9448 ) ( IS-CRATE ?auto_9443 ) ( not ( = ?auto_9442 ?auto_9443 ) ) ( not ( = ?auto_9441 ?auto_9442 ) ) ( not ( = ?auto_9441 ?auto_9443 ) ) ( not ( = ?auto_9444 ?auto_9448 ) ) ( HOIST-AT ?auto_9447 ?auto_9444 ) ( not ( = ?auto_9445 ?auto_9447 ) ) ( AVAILABLE ?auto_9447 ) ( SURFACE-AT ?auto_9443 ?auto_9444 ) ( ON ?auto_9443 ?auto_9449 ) ( CLEAR ?auto_9443 ) ( not ( = ?auto_9442 ?auto_9449 ) ) ( not ( = ?auto_9443 ?auto_9449 ) ) ( not ( = ?auto_9441 ?auto_9449 ) ) ( TRUCK-AT ?auto_9446 ?auto_9448 ) ( SURFACE-AT ?auto_9441 ?auto_9448 ) ( CLEAR ?auto_9441 ) ( IS-CRATE ?auto_9442 ) ( AVAILABLE ?auto_9445 ) ( IN ?auto_9442 ?auto_9446 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9442 ?auto_9443 )
      ( MAKE-2CRATE-VERIFY ?auto_9441 ?auto_9442 ?auto_9443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9486 - SURFACE
      ?auto_9487 - SURFACE
    )
    :vars
    (
      ?auto_9488 - HOIST
      ?auto_9492 - PLACE
      ?auto_9494 - SURFACE
      ?auto_9493 - PLACE
      ?auto_9491 - HOIST
      ?auto_9489 - SURFACE
      ?auto_9490 - TRUCK
      ?auto_9495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9488 ?auto_9492 ) ( SURFACE-AT ?auto_9486 ?auto_9492 ) ( CLEAR ?auto_9486 ) ( IS-CRATE ?auto_9487 ) ( not ( = ?auto_9486 ?auto_9487 ) ) ( AVAILABLE ?auto_9488 ) ( ON ?auto_9486 ?auto_9494 ) ( not ( = ?auto_9494 ?auto_9486 ) ) ( not ( = ?auto_9494 ?auto_9487 ) ) ( not ( = ?auto_9493 ?auto_9492 ) ) ( HOIST-AT ?auto_9491 ?auto_9493 ) ( not ( = ?auto_9488 ?auto_9491 ) ) ( AVAILABLE ?auto_9491 ) ( SURFACE-AT ?auto_9487 ?auto_9493 ) ( ON ?auto_9487 ?auto_9489 ) ( CLEAR ?auto_9487 ) ( not ( = ?auto_9486 ?auto_9489 ) ) ( not ( = ?auto_9487 ?auto_9489 ) ) ( not ( = ?auto_9494 ?auto_9489 ) ) ( TRUCK-AT ?auto_9490 ?auto_9495 ) ( not ( = ?auto_9495 ?auto_9492 ) ) ( not ( = ?auto_9493 ?auto_9495 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9490 ?auto_9495 ?auto_9492 )
      ( MAKE-1CRATE ?auto_9486 ?auto_9487 )
      ( MAKE-1CRATE-VERIFY ?auto_9486 ?auto_9487 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9526 - SURFACE
      ?auto_9527 - SURFACE
      ?auto_9528 - SURFACE
      ?auto_9525 - SURFACE
    )
    :vars
    (
      ?auto_9530 - HOIST
      ?auto_9529 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9530 ?auto_9529 ) ( SURFACE-AT ?auto_9528 ?auto_9529 ) ( CLEAR ?auto_9528 ) ( LIFTING ?auto_9530 ?auto_9525 ) ( IS-CRATE ?auto_9525 ) ( not ( = ?auto_9528 ?auto_9525 ) ) ( ON ?auto_9527 ?auto_9526 ) ( ON ?auto_9528 ?auto_9527 ) ( not ( = ?auto_9526 ?auto_9527 ) ) ( not ( = ?auto_9526 ?auto_9528 ) ) ( not ( = ?auto_9526 ?auto_9525 ) ) ( not ( = ?auto_9527 ?auto_9528 ) ) ( not ( = ?auto_9527 ?auto_9525 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9528 ?auto_9525 )
      ( MAKE-3CRATE-VERIFY ?auto_9526 ?auto_9527 ?auto_9528 ?auto_9525 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9543 - SURFACE
      ?auto_9544 - SURFACE
      ?auto_9545 - SURFACE
      ?auto_9542 - SURFACE
    )
    :vars
    (
      ?auto_9546 - HOIST
      ?auto_9548 - PLACE
      ?auto_9547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9546 ?auto_9548 ) ( SURFACE-AT ?auto_9545 ?auto_9548 ) ( CLEAR ?auto_9545 ) ( IS-CRATE ?auto_9542 ) ( not ( = ?auto_9545 ?auto_9542 ) ) ( TRUCK-AT ?auto_9547 ?auto_9548 ) ( AVAILABLE ?auto_9546 ) ( IN ?auto_9542 ?auto_9547 ) ( ON ?auto_9545 ?auto_9544 ) ( not ( = ?auto_9544 ?auto_9545 ) ) ( not ( = ?auto_9544 ?auto_9542 ) ) ( ON ?auto_9544 ?auto_9543 ) ( not ( = ?auto_9543 ?auto_9544 ) ) ( not ( = ?auto_9543 ?auto_9545 ) ) ( not ( = ?auto_9543 ?auto_9542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9544 ?auto_9545 ?auto_9542 )
      ( MAKE-3CRATE-VERIFY ?auto_9543 ?auto_9544 ?auto_9545 ?auto_9542 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9564 - SURFACE
      ?auto_9565 - SURFACE
      ?auto_9566 - SURFACE
      ?auto_9563 - SURFACE
    )
    :vars
    (
      ?auto_9569 - HOIST
      ?auto_9567 - PLACE
      ?auto_9570 - TRUCK
      ?auto_9568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9569 ?auto_9567 ) ( SURFACE-AT ?auto_9566 ?auto_9567 ) ( CLEAR ?auto_9566 ) ( IS-CRATE ?auto_9563 ) ( not ( = ?auto_9566 ?auto_9563 ) ) ( AVAILABLE ?auto_9569 ) ( IN ?auto_9563 ?auto_9570 ) ( ON ?auto_9566 ?auto_9565 ) ( not ( = ?auto_9565 ?auto_9566 ) ) ( not ( = ?auto_9565 ?auto_9563 ) ) ( TRUCK-AT ?auto_9570 ?auto_9568 ) ( not ( = ?auto_9568 ?auto_9567 ) ) ( ON ?auto_9565 ?auto_9564 ) ( not ( = ?auto_9564 ?auto_9565 ) ) ( not ( = ?auto_9564 ?auto_9566 ) ) ( not ( = ?auto_9564 ?auto_9563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9565 ?auto_9566 ?auto_9563 )
      ( MAKE-3CRATE-VERIFY ?auto_9564 ?auto_9565 ?auto_9566 ?auto_9563 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9588 - SURFACE
      ?auto_9589 - SURFACE
      ?auto_9590 - SURFACE
      ?auto_9587 - SURFACE
    )
    :vars
    (
      ?auto_9593 - HOIST
      ?auto_9592 - PLACE
      ?auto_9591 - TRUCK
      ?auto_9594 - PLACE
      ?auto_9595 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9593 ?auto_9592 ) ( SURFACE-AT ?auto_9590 ?auto_9592 ) ( CLEAR ?auto_9590 ) ( IS-CRATE ?auto_9587 ) ( not ( = ?auto_9590 ?auto_9587 ) ) ( AVAILABLE ?auto_9593 ) ( ON ?auto_9590 ?auto_9589 ) ( not ( = ?auto_9589 ?auto_9590 ) ) ( not ( = ?auto_9589 ?auto_9587 ) ) ( TRUCK-AT ?auto_9591 ?auto_9594 ) ( not ( = ?auto_9594 ?auto_9592 ) ) ( HOIST-AT ?auto_9595 ?auto_9594 ) ( LIFTING ?auto_9595 ?auto_9587 ) ( not ( = ?auto_9593 ?auto_9595 ) ) ( ON ?auto_9589 ?auto_9588 ) ( not ( = ?auto_9588 ?auto_9589 ) ) ( not ( = ?auto_9588 ?auto_9590 ) ) ( not ( = ?auto_9588 ?auto_9587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9589 ?auto_9590 ?auto_9587 )
      ( MAKE-3CRATE-VERIFY ?auto_9588 ?auto_9589 ?auto_9590 ?auto_9587 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9615 - SURFACE
      ?auto_9616 - SURFACE
      ?auto_9617 - SURFACE
      ?auto_9614 - SURFACE
    )
    :vars
    (
      ?auto_9621 - HOIST
      ?auto_9622 - PLACE
      ?auto_9619 - TRUCK
      ?auto_9623 - PLACE
      ?auto_9620 - HOIST
      ?auto_9618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9621 ?auto_9622 ) ( SURFACE-AT ?auto_9617 ?auto_9622 ) ( CLEAR ?auto_9617 ) ( IS-CRATE ?auto_9614 ) ( not ( = ?auto_9617 ?auto_9614 ) ) ( AVAILABLE ?auto_9621 ) ( ON ?auto_9617 ?auto_9616 ) ( not ( = ?auto_9616 ?auto_9617 ) ) ( not ( = ?auto_9616 ?auto_9614 ) ) ( TRUCK-AT ?auto_9619 ?auto_9623 ) ( not ( = ?auto_9623 ?auto_9622 ) ) ( HOIST-AT ?auto_9620 ?auto_9623 ) ( not ( = ?auto_9621 ?auto_9620 ) ) ( AVAILABLE ?auto_9620 ) ( SURFACE-AT ?auto_9614 ?auto_9623 ) ( ON ?auto_9614 ?auto_9618 ) ( CLEAR ?auto_9614 ) ( not ( = ?auto_9617 ?auto_9618 ) ) ( not ( = ?auto_9614 ?auto_9618 ) ) ( not ( = ?auto_9616 ?auto_9618 ) ) ( ON ?auto_9616 ?auto_9615 ) ( not ( = ?auto_9615 ?auto_9616 ) ) ( not ( = ?auto_9615 ?auto_9617 ) ) ( not ( = ?auto_9615 ?auto_9614 ) ) ( not ( = ?auto_9615 ?auto_9618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9616 ?auto_9617 ?auto_9614 )
      ( MAKE-3CRATE-VERIFY ?auto_9615 ?auto_9616 ?auto_9617 ?auto_9614 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9643 - SURFACE
      ?auto_9644 - SURFACE
      ?auto_9645 - SURFACE
      ?auto_9642 - SURFACE
    )
    :vars
    (
      ?auto_9647 - HOIST
      ?auto_9649 - PLACE
      ?auto_9651 - PLACE
      ?auto_9646 - HOIST
      ?auto_9650 - SURFACE
      ?auto_9648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9647 ?auto_9649 ) ( SURFACE-AT ?auto_9645 ?auto_9649 ) ( CLEAR ?auto_9645 ) ( IS-CRATE ?auto_9642 ) ( not ( = ?auto_9645 ?auto_9642 ) ) ( AVAILABLE ?auto_9647 ) ( ON ?auto_9645 ?auto_9644 ) ( not ( = ?auto_9644 ?auto_9645 ) ) ( not ( = ?auto_9644 ?auto_9642 ) ) ( not ( = ?auto_9651 ?auto_9649 ) ) ( HOIST-AT ?auto_9646 ?auto_9651 ) ( not ( = ?auto_9647 ?auto_9646 ) ) ( AVAILABLE ?auto_9646 ) ( SURFACE-AT ?auto_9642 ?auto_9651 ) ( ON ?auto_9642 ?auto_9650 ) ( CLEAR ?auto_9642 ) ( not ( = ?auto_9645 ?auto_9650 ) ) ( not ( = ?auto_9642 ?auto_9650 ) ) ( not ( = ?auto_9644 ?auto_9650 ) ) ( TRUCK-AT ?auto_9648 ?auto_9649 ) ( ON ?auto_9644 ?auto_9643 ) ( not ( = ?auto_9643 ?auto_9644 ) ) ( not ( = ?auto_9643 ?auto_9645 ) ) ( not ( = ?auto_9643 ?auto_9642 ) ) ( not ( = ?auto_9643 ?auto_9650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9644 ?auto_9645 ?auto_9642 )
      ( MAKE-3CRATE-VERIFY ?auto_9643 ?auto_9644 ?auto_9645 ?auto_9642 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9671 - SURFACE
      ?auto_9672 - SURFACE
      ?auto_9673 - SURFACE
      ?auto_9670 - SURFACE
    )
    :vars
    (
      ?auto_9679 - HOIST
      ?auto_9675 - PLACE
      ?auto_9676 - PLACE
      ?auto_9677 - HOIST
      ?auto_9678 - SURFACE
      ?auto_9674 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9679 ?auto_9675 ) ( IS-CRATE ?auto_9670 ) ( not ( = ?auto_9673 ?auto_9670 ) ) ( not ( = ?auto_9672 ?auto_9673 ) ) ( not ( = ?auto_9672 ?auto_9670 ) ) ( not ( = ?auto_9676 ?auto_9675 ) ) ( HOIST-AT ?auto_9677 ?auto_9676 ) ( not ( = ?auto_9679 ?auto_9677 ) ) ( AVAILABLE ?auto_9677 ) ( SURFACE-AT ?auto_9670 ?auto_9676 ) ( ON ?auto_9670 ?auto_9678 ) ( CLEAR ?auto_9670 ) ( not ( = ?auto_9673 ?auto_9678 ) ) ( not ( = ?auto_9670 ?auto_9678 ) ) ( not ( = ?auto_9672 ?auto_9678 ) ) ( TRUCK-AT ?auto_9674 ?auto_9675 ) ( SURFACE-AT ?auto_9672 ?auto_9675 ) ( CLEAR ?auto_9672 ) ( LIFTING ?auto_9679 ?auto_9673 ) ( IS-CRATE ?auto_9673 ) ( ON ?auto_9672 ?auto_9671 ) ( not ( = ?auto_9671 ?auto_9672 ) ) ( not ( = ?auto_9671 ?auto_9673 ) ) ( not ( = ?auto_9671 ?auto_9670 ) ) ( not ( = ?auto_9671 ?auto_9678 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9672 ?auto_9673 ?auto_9670 )
      ( MAKE-3CRATE-VERIFY ?auto_9671 ?auto_9672 ?auto_9673 ?auto_9670 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9699 - SURFACE
      ?auto_9700 - SURFACE
      ?auto_9701 - SURFACE
      ?auto_9698 - SURFACE
    )
    :vars
    (
      ?auto_9707 - HOIST
      ?auto_9702 - PLACE
      ?auto_9705 - PLACE
      ?auto_9703 - HOIST
      ?auto_9706 - SURFACE
      ?auto_9704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9707 ?auto_9702 ) ( IS-CRATE ?auto_9698 ) ( not ( = ?auto_9701 ?auto_9698 ) ) ( not ( = ?auto_9700 ?auto_9701 ) ) ( not ( = ?auto_9700 ?auto_9698 ) ) ( not ( = ?auto_9705 ?auto_9702 ) ) ( HOIST-AT ?auto_9703 ?auto_9705 ) ( not ( = ?auto_9707 ?auto_9703 ) ) ( AVAILABLE ?auto_9703 ) ( SURFACE-AT ?auto_9698 ?auto_9705 ) ( ON ?auto_9698 ?auto_9706 ) ( CLEAR ?auto_9698 ) ( not ( = ?auto_9701 ?auto_9706 ) ) ( not ( = ?auto_9698 ?auto_9706 ) ) ( not ( = ?auto_9700 ?auto_9706 ) ) ( TRUCK-AT ?auto_9704 ?auto_9702 ) ( SURFACE-AT ?auto_9700 ?auto_9702 ) ( CLEAR ?auto_9700 ) ( IS-CRATE ?auto_9701 ) ( AVAILABLE ?auto_9707 ) ( IN ?auto_9701 ?auto_9704 ) ( ON ?auto_9700 ?auto_9699 ) ( not ( = ?auto_9699 ?auto_9700 ) ) ( not ( = ?auto_9699 ?auto_9701 ) ) ( not ( = ?auto_9699 ?auto_9698 ) ) ( not ( = ?auto_9699 ?auto_9706 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9700 ?auto_9701 ?auto_9698 )
      ( MAKE-3CRATE-VERIFY ?auto_9699 ?auto_9700 ?auto_9701 ?auto_9698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9883 - SURFACE
      ?auto_9884 - SURFACE
    )
    :vars
    (
      ?auto_9890 - HOIST
      ?auto_9889 - PLACE
      ?auto_9886 - SURFACE
      ?auto_9885 - TRUCK
      ?auto_9891 - PLACE
      ?auto_9888 - HOIST
      ?auto_9887 - SURFACE
      ?auto_9892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9890 ?auto_9889 ) ( SURFACE-AT ?auto_9883 ?auto_9889 ) ( CLEAR ?auto_9883 ) ( IS-CRATE ?auto_9884 ) ( not ( = ?auto_9883 ?auto_9884 ) ) ( AVAILABLE ?auto_9890 ) ( ON ?auto_9883 ?auto_9886 ) ( not ( = ?auto_9886 ?auto_9883 ) ) ( not ( = ?auto_9886 ?auto_9884 ) ) ( TRUCK-AT ?auto_9885 ?auto_9891 ) ( not ( = ?auto_9891 ?auto_9889 ) ) ( HOIST-AT ?auto_9888 ?auto_9891 ) ( not ( = ?auto_9890 ?auto_9888 ) ) ( SURFACE-AT ?auto_9884 ?auto_9891 ) ( ON ?auto_9884 ?auto_9887 ) ( CLEAR ?auto_9884 ) ( not ( = ?auto_9883 ?auto_9887 ) ) ( not ( = ?auto_9884 ?auto_9887 ) ) ( not ( = ?auto_9886 ?auto_9887 ) ) ( LIFTING ?auto_9888 ?auto_9892 ) ( IS-CRATE ?auto_9892 ) ( not ( = ?auto_9883 ?auto_9892 ) ) ( not ( = ?auto_9884 ?auto_9892 ) ) ( not ( = ?auto_9886 ?auto_9892 ) ) ( not ( = ?auto_9887 ?auto_9892 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9888 ?auto_9892 ?auto_9885 ?auto_9891 )
      ( MAKE-1CRATE ?auto_9883 ?auto_9884 )
      ( MAKE-1CRATE-VERIFY ?auto_9883 ?auto_9884 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9992 - SURFACE
      ?auto_9993 - SURFACE
      ?auto_9994 - SURFACE
      ?auto_9991 - SURFACE
      ?auto_9995 - SURFACE
    )
    :vars
    (
      ?auto_9997 - HOIST
      ?auto_9996 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9997 ?auto_9996 ) ( SURFACE-AT ?auto_9991 ?auto_9996 ) ( CLEAR ?auto_9991 ) ( LIFTING ?auto_9997 ?auto_9995 ) ( IS-CRATE ?auto_9995 ) ( not ( = ?auto_9991 ?auto_9995 ) ) ( ON ?auto_9993 ?auto_9992 ) ( ON ?auto_9994 ?auto_9993 ) ( ON ?auto_9991 ?auto_9994 ) ( not ( = ?auto_9992 ?auto_9993 ) ) ( not ( = ?auto_9992 ?auto_9994 ) ) ( not ( = ?auto_9992 ?auto_9991 ) ) ( not ( = ?auto_9992 ?auto_9995 ) ) ( not ( = ?auto_9993 ?auto_9994 ) ) ( not ( = ?auto_9993 ?auto_9991 ) ) ( not ( = ?auto_9993 ?auto_9995 ) ) ( not ( = ?auto_9994 ?auto_9991 ) ) ( not ( = ?auto_9994 ?auto_9995 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9991 ?auto_9995 )
      ( MAKE-4CRATE-VERIFY ?auto_9992 ?auto_9993 ?auto_9994 ?auto_9991 ?auto_9995 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10017 - SURFACE
      ?auto_10018 - SURFACE
      ?auto_10019 - SURFACE
      ?auto_10016 - SURFACE
      ?auto_10020 - SURFACE
    )
    :vars
    (
      ?auto_10023 - HOIST
      ?auto_10022 - PLACE
      ?auto_10021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10023 ?auto_10022 ) ( SURFACE-AT ?auto_10016 ?auto_10022 ) ( CLEAR ?auto_10016 ) ( IS-CRATE ?auto_10020 ) ( not ( = ?auto_10016 ?auto_10020 ) ) ( TRUCK-AT ?auto_10021 ?auto_10022 ) ( AVAILABLE ?auto_10023 ) ( IN ?auto_10020 ?auto_10021 ) ( ON ?auto_10016 ?auto_10019 ) ( not ( = ?auto_10019 ?auto_10016 ) ) ( not ( = ?auto_10019 ?auto_10020 ) ) ( ON ?auto_10018 ?auto_10017 ) ( ON ?auto_10019 ?auto_10018 ) ( not ( = ?auto_10017 ?auto_10018 ) ) ( not ( = ?auto_10017 ?auto_10019 ) ) ( not ( = ?auto_10017 ?auto_10016 ) ) ( not ( = ?auto_10017 ?auto_10020 ) ) ( not ( = ?auto_10018 ?auto_10019 ) ) ( not ( = ?auto_10018 ?auto_10016 ) ) ( not ( = ?auto_10018 ?auto_10020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10019 ?auto_10016 ?auto_10020 )
      ( MAKE-4CRATE-VERIFY ?auto_10017 ?auto_10018 ?auto_10019 ?auto_10016 ?auto_10020 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10047 - SURFACE
      ?auto_10048 - SURFACE
      ?auto_10049 - SURFACE
      ?auto_10046 - SURFACE
      ?auto_10050 - SURFACE
    )
    :vars
    (
      ?auto_10054 - HOIST
      ?auto_10052 - PLACE
      ?auto_10051 - TRUCK
      ?auto_10053 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10054 ?auto_10052 ) ( SURFACE-AT ?auto_10046 ?auto_10052 ) ( CLEAR ?auto_10046 ) ( IS-CRATE ?auto_10050 ) ( not ( = ?auto_10046 ?auto_10050 ) ) ( AVAILABLE ?auto_10054 ) ( IN ?auto_10050 ?auto_10051 ) ( ON ?auto_10046 ?auto_10049 ) ( not ( = ?auto_10049 ?auto_10046 ) ) ( not ( = ?auto_10049 ?auto_10050 ) ) ( TRUCK-AT ?auto_10051 ?auto_10053 ) ( not ( = ?auto_10053 ?auto_10052 ) ) ( ON ?auto_10048 ?auto_10047 ) ( ON ?auto_10049 ?auto_10048 ) ( not ( = ?auto_10047 ?auto_10048 ) ) ( not ( = ?auto_10047 ?auto_10049 ) ) ( not ( = ?auto_10047 ?auto_10046 ) ) ( not ( = ?auto_10047 ?auto_10050 ) ) ( not ( = ?auto_10048 ?auto_10049 ) ) ( not ( = ?auto_10048 ?auto_10046 ) ) ( not ( = ?auto_10048 ?auto_10050 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10049 ?auto_10046 ?auto_10050 )
      ( MAKE-4CRATE-VERIFY ?auto_10047 ?auto_10048 ?auto_10049 ?auto_10046 ?auto_10050 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10081 - SURFACE
      ?auto_10082 - SURFACE
      ?auto_10083 - SURFACE
      ?auto_10080 - SURFACE
      ?auto_10084 - SURFACE
    )
    :vars
    (
      ?auto_10085 - HOIST
      ?auto_10086 - PLACE
      ?auto_10088 - TRUCK
      ?auto_10089 - PLACE
      ?auto_10087 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10085 ?auto_10086 ) ( SURFACE-AT ?auto_10080 ?auto_10086 ) ( CLEAR ?auto_10080 ) ( IS-CRATE ?auto_10084 ) ( not ( = ?auto_10080 ?auto_10084 ) ) ( AVAILABLE ?auto_10085 ) ( ON ?auto_10080 ?auto_10083 ) ( not ( = ?auto_10083 ?auto_10080 ) ) ( not ( = ?auto_10083 ?auto_10084 ) ) ( TRUCK-AT ?auto_10088 ?auto_10089 ) ( not ( = ?auto_10089 ?auto_10086 ) ) ( HOIST-AT ?auto_10087 ?auto_10089 ) ( LIFTING ?auto_10087 ?auto_10084 ) ( not ( = ?auto_10085 ?auto_10087 ) ) ( ON ?auto_10082 ?auto_10081 ) ( ON ?auto_10083 ?auto_10082 ) ( not ( = ?auto_10081 ?auto_10082 ) ) ( not ( = ?auto_10081 ?auto_10083 ) ) ( not ( = ?auto_10081 ?auto_10080 ) ) ( not ( = ?auto_10081 ?auto_10084 ) ) ( not ( = ?auto_10082 ?auto_10083 ) ) ( not ( = ?auto_10082 ?auto_10080 ) ) ( not ( = ?auto_10082 ?auto_10084 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10083 ?auto_10080 ?auto_10084 )
      ( MAKE-4CRATE-VERIFY ?auto_10081 ?auto_10082 ?auto_10083 ?auto_10080 ?auto_10084 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10119 - SURFACE
      ?auto_10120 - SURFACE
      ?auto_10121 - SURFACE
      ?auto_10118 - SURFACE
      ?auto_10122 - SURFACE
    )
    :vars
    (
      ?auto_10128 - HOIST
      ?auto_10125 - PLACE
      ?auto_10126 - TRUCK
      ?auto_10124 - PLACE
      ?auto_10127 - HOIST
      ?auto_10123 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10128 ?auto_10125 ) ( SURFACE-AT ?auto_10118 ?auto_10125 ) ( CLEAR ?auto_10118 ) ( IS-CRATE ?auto_10122 ) ( not ( = ?auto_10118 ?auto_10122 ) ) ( AVAILABLE ?auto_10128 ) ( ON ?auto_10118 ?auto_10121 ) ( not ( = ?auto_10121 ?auto_10118 ) ) ( not ( = ?auto_10121 ?auto_10122 ) ) ( TRUCK-AT ?auto_10126 ?auto_10124 ) ( not ( = ?auto_10124 ?auto_10125 ) ) ( HOIST-AT ?auto_10127 ?auto_10124 ) ( not ( = ?auto_10128 ?auto_10127 ) ) ( AVAILABLE ?auto_10127 ) ( SURFACE-AT ?auto_10122 ?auto_10124 ) ( ON ?auto_10122 ?auto_10123 ) ( CLEAR ?auto_10122 ) ( not ( = ?auto_10118 ?auto_10123 ) ) ( not ( = ?auto_10122 ?auto_10123 ) ) ( not ( = ?auto_10121 ?auto_10123 ) ) ( ON ?auto_10120 ?auto_10119 ) ( ON ?auto_10121 ?auto_10120 ) ( not ( = ?auto_10119 ?auto_10120 ) ) ( not ( = ?auto_10119 ?auto_10121 ) ) ( not ( = ?auto_10119 ?auto_10118 ) ) ( not ( = ?auto_10119 ?auto_10122 ) ) ( not ( = ?auto_10119 ?auto_10123 ) ) ( not ( = ?auto_10120 ?auto_10121 ) ) ( not ( = ?auto_10120 ?auto_10118 ) ) ( not ( = ?auto_10120 ?auto_10122 ) ) ( not ( = ?auto_10120 ?auto_10123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10121 ?auto_10118 ?auto_10122 )
      ( MAKE-4CRATE-VERIFY ?auto_10119 ?auto_10120 ?auto_10121 ?auto_10118 ?auto_10122 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10158 - SURFACE
      ?auto_10159 - SURFACE
      ?auto_10160 - SURFACE
      ?auto_10157 - SURFACE
      ?auto_10161 - SURFACE
    )
    :vars
    (
      ?auto_10162 - HOIST
      ?auto_10163 - PLACE
      ?auto_10165 - PLACE
      ?auto_10166 - HOIST
      ?auto_10167 - SURFACE
      ?auto_10164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10162 ?auto_10163 ) ( SURFACE-AT ?auto_10157 ?auto_10163 ) ( CLEAR ?auto_10157 ) ( IS-CRATE ?auto_10161 ) ( not ( = ?auto_10157 ?auto_10161 ) ) ( AVAILABLE ?auto_10162 ) ( ON ?auto_10157 ?auto_10160 ) ( not ( = ?auto_10160 ?auto_10157 ) ) ( not ( = ?auto_10160 ?auto_10161 ) ) ( not ( = ?auto_10165 ?auto_10163 ) ) ( HOIST-AT ?auto_10166 ?auto_10165 ) ( not ( = ?auto_10162 ?auto_10166 ) ) ( AVAILABLE ?auto_10166 ) ( SURFACE-AT ?auto_10161 ?auto_10165 ) ( ON ?auto_10161 ?auto_10167 ) ( CLEAR ?auto_10161 ) ( not ( = ?auto_10157 ?auto_10167 ) ) ( not ( = ?auto_10161 ?auto_10167 ) ) ( not ( = ?auto_10160 ?auto_10167 ) ) ( TRUCK-AT ?auto_10164 ?auto_10163 ) ( ON ?auto_10159 ?auto_10158 ) ( ON ?auto_10160 ?auto_10159 ) ( not ( = ?auto_10158 ?auto_10159 ) ) ( not ( = ?auto_10158 ?auto_10160 ) ) ( not ( = ?auto_10158 ?auto_10157 ) ) ( not ( = ?auto_10158 ?auto_10161 ) ) ( not ( = ?auto_10158 ?auto_10167 ) ) ( not ( = ?auto_10159 ?auto_10160 ) ) ( not ( = ?auto_10159 ?auto_10157 ) ) ( not ( = ?auto_10159 ?auto_10161 ) ) ( not ( = ?auto_10159 ?auto_10167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10160 ?auto_10157 ?auto_10161 )
      ( MAKE-4CRATE-VERIFY ?auto_10158 ?auto_10159 ?auto_10160 ?auto_10157 ?auto_10161 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10197 - SURFACE
      ?auto_10198 - SURFACE
      ?auto_10199 - SURFACE
      ?auto_10196 - SURFACE
      ?auto_10200 - SURFACE
    )
    :vars
    (
      ?auto_10203 - HOIST
      ?auto_10204 - PLACE
      ?auto_10206 - PLACE
      ?auto_10202 - HOIST
      ?auto_10201 - SURFACE
      ?auto_10205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10203 ?auto_10204 ) ( IS-CRATE ?auto_10200 ) ( not ( = ?auto_10196 ?auto_10200 ) ) ( not ( = ?auto_10199 ?auto_10196 ) ) ( not ( = ?auto_10199 ?auto_10200 ) ) ( not ( = ?auto_10206 ?auto_10204 ) ) ( HOIST-AT ?auto_10202 ?auto_10206 ) ( not ( = ?auto_10203 ?auto_10202 ) ) ( AVAILABLE ?auto_10202 ) ( SURFACE-AT ?auto_10200 ?auto_10206 ) ( ON ?auto_10200 ?auto_10201 ) ( CLEAR ?auto_10200 ) ( not ( = ?auto_10196 ?auto_10201 ) ) ( not ( = ?auto_10200 ?auto_10201 ) ) ( not ( = ?auto_10199 ?auto_10201 ) ) ( TRUCK-AT ?auto_10205 ?auto_10204 ) ( SURFACE-AT ?auto_10199 ?auto_10204 ) ( CLEAR ?auto_10199 ) ( LIFTING ?auto_10203 ?auto_10196 ) ( IS-CRATE ?auto_10196 ) ( ON ?auto_10198 ?auto_10197 ) ( ON ?auto_10199 ?auto_10198 ) ( not ( = ?auto_10197 ?auto_10198 ) ) ( not ( = ?auto_10197 ?auto_10199 ) ) ( not ( = ?auto_10197 ?auto_10196 ) ) ( not ( = ?auto_10197 ?auto_10200 ) ) ( not ( = ?auto_10197 ?auto_10201 ) ) ( not ( = ?auto_10198 ?auto_10199 ) ) ( not ( = ?auto_10198 ?auto_10196 ) ) ( not ( = ?auto_10198 ?auto_10200 ) ) ( not ( = ?auto_10198 ?auto_10201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10199 ?auto_10196 ?auto_10200 )
      ( MAKE-4CRATE-VERIFY ?auto_10197 ?auto_10198 ?auto_10199 ?auto_10196 ?auto_10200 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10236 - SURFACE
      ?auto_10237 - SURFACE
      ?auto_10238 - SURFACE
      ?auto_10235 - SURFACE
      ?auto_10239 - SURFACE
    )
    :vars
    (
      ?auto_10245 - HOIST
      ?auto_10240 - PLACE
      ?auto_10242 - PLACE
      ?auto_10243 - HOIST
      ?auto_10244 - SURFACE
      ?auto_10241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10245 ?auto_10240 ) ( IS-CRATE ?auto_10239 ) ( not ( = ?auto_10235 ?auto_10239 ) ) ( not ( = ?auto_10238 ?auto_10235 ) ) ( not ( = ?auto_10238 ?auto_10239 ) ) ( not ( = ?auto_10242 ?auto_10240 ) ) ( HOIST-AT ?auto_10243 ?auto_10242 ) ( not ( = ?auto_10245 ?auto_10243 ) ) ( AVAILABLE ?auto_10243 ) ( SURFACE-AT ?auto_10239 ?auto_10242 ) ( ON ?auto_10239 ?auto_10244 ) ( CLEAR ?auto_10239 ) ( not ( = ?auto_10235 ?auto_10244 ) ) ( not ( = ?auto_10239 ?auto_10244 ) ) ( not ( = ?auto_10238 ?auto_10244 ) ) ( TRUCK-AT ?auto_10241 ?auto_10240 ) ( SURFACE-AT ?auto_10238 ?auto_10240 ) ( CLEAR ?auto_10238 ) ( IS-CRATE ?auto_10235 ) ( AVAILABLE ?auto_10245 ) ( IN ?auto_10235 ?auto_10241 ) ( ON ?auto_10237 ?auto_10236 ) ( ON ?auto_10238 ?auto_10237 ) ( not ( = ?auto_10236 ?auto_10237 ) ) ( not ( = ?auto_10236 ?auto_10238 ) ) ( not ( = ?auto_10236 ?auto_10235 ) ) ( not ( = ?auto_10236 ?auto_10239 ) ) ( not ( = ?auto_10236 ?auto_10244 ) ) ( not ( = ?auto_10237 ?auto_10238 ) ) ( not ( = ?auto_10237 ?auto_10235 ) ) ( not ( = ?auto_10237 ?auto_10239 ) ) ( not ( = ?auto_10237 ?auto_10244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10238 ?auto_10235 ?auto_10239 )
      ( MAKE-4CRATE-VERIFY ?auto_10236 ?auto_10237 ?auto_10238 ?auto_10235 ?auto_10239 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10246 - SURFACE
      ?auto_10247 - SURFACE
    )
    :vars
    (
      ?auto_10254 - HOIST
      ?auto_10248 - PLACE
      ?auto_10253 - SURFACE
      ?auto_10250 - PLACE
      ?auto_10251 - HOIST
      ?auto_10252 - SURFACE
      ?auto_10249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10254 ?auto_10248 ) ( IS-CRATE ?auto_10247 ) ( not ( = ?auto_10246 ?auto_10247 ) ) ( not ( = ?auto_10253 ?auto_10246 ) ) ( not ( = ?auto_10253 ?auto_10247 ) ) ( not ( = ?auto_10250 ?auto_10248 ) ) ( HOIST-AT ?auto_10251 ?auto_10250 ) ( not ( = ?auto_10254 ?auto_10251 ) ) ( AVAILABLE ?auto_10251 ) ( SURFACE-AT ?auto_10247 ?auto_10250 ) ( ON ?auto_10247 ?auto_10252 ) ( CLEAR ?auto_10247 ) ( not ( = ?auto_10246 ?auto_10252 ) ) ( not ( = ?auto_10247 ?auto_10252 ) ) ( not ( = ?auto_10253 ?auto_10252 ) ) ( SURFACE-AT ?auto_10253 ?auto_10248 ) ( CLEAR ?auto_10253 ) ( IS-CRATE ?auto_10246 ) ( AVAILABLE ?auto_10254 ) ( IN ?auto_10246 ?auto_10249 ) ( TRUCK-AT ?auto_10249 ?auto_10250 ) )
    :subtasks
    ( ( !DRIVE ?auto_10249 ?auto_10250 ?auto_10248 )
      ( MAKE-2CRATE ?auto_10253 ?auto_10246 ?auto_10247 )
      ( MAKE-1CRATE-VERIFY ?auto_10246 ?auto_10247 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10255 - SURFACE
      ?auto_10256 - SURFACE
      ?auto_10257 - SURFACE
    )
    :vars
    (
      ?auto_10261 - HOIST
      ?auto_10259 - PLACE
      ?auto_10258 - PLACE
      ?auto_10263 - HOIST
      ?auto_10262 - SURFACE
      ?auto_10260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10261 ?auto_10259 ) ( IS-CRATE ?auto_10257 ) ( not ( = ?auto_10256 ?auto_10257 ) ) ( not ( = ?auto_10255 ?auto_10256 ) ) ( not ( = ?auto_10255 ?auto_10257 ) ) ( not ( = ?auto_10258 ?auto_10259 ) ) ( HOIST-AT ?auto_10263 ?auto_10258 ) ( not ( = ?auto_10261 ?auto_10263 ) ) ( AVAILABLE ?auto_10263 ) ( SURFACE-AT ?auto_10257 ?auto_10258 ) ( ON ?auto_10257 ?auto_10262 ) ( CLEAR ?auto_10257 ) ( not ( = ?auto_10256 ?auto_10262 ) ) ( not ( = ?auto_10257 ?auto_10262 ) ) ( not ( = ?auto_10255 ?auto_10262 ) ) ( SURFACE-AT ?auto_10255 ?auto_10259 ) ( CLEAR ?auto_10255 ) ( IS-CRATE ?auto_10256 ) ( AVAILABLE ?auto_10261 ) ( IN ?auto_10256 ?auto_10260 ) ( TRUCK-AT ?auto_10260 ?auto_10258 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10256 ?auto_10257 )
      ( MAKE-2CRATE-VERIFY ?auto_10255 ?auto_10256 ?auto_10257 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10265 - SURFACE
      ?auto_10266 - SURFACE
      ?auto_10267 - SURFACE
      ?auto_10264 - SURFACE
    )
    :vars
    (
      ?auto_10269 - HOIST
      ?auto_10268 - PLACE
      ?auto_10272 - PLACE
      ?auto_10273 - HOIST
      ?auto_10270 - SURFACE
      ?auto_10271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10269 ?auto_10268 ) ( IS-CRATE ?auto_10264 ) ( not ( = ?auto_10267 ?auto_10264 ) ) ( not ( = ?auto_10266 ?auto_10267 ) ) ( not ( = ?auto_10266 ?auto_10264 ) ) ( not ( = ?auto_10272 ?auto_10268 ) ) ( HOIST-AT ?auto_10273 ?auto_10272 ) ( not ( = ?auto_10269 ?auto_10273 ) ) ( AVAILABLE ?auto_10273 ) ( SURFACE-AT ?auto_10264 ?auto_10272 ) ( ON ?auto_10264 ?auto_10270 ) ( CLEAR ?auto_10264 ) ( not ( = ?auto_10267 ?auto_10270 ) ) ( not ( = ?auto_10264 ?auto_10270 ) ) ( not ( = ?auto_10266 ?auto_10270 ) ) ( SURFACE-AT ?auto_10266 ?auto_10268 ) ( CLEAR ?auto_10266 ) ( IS-CRATE ?auto_10267 ) ( AVAILABLE ?auto_10269 ) ( IN ?auto_10267 ?auto_10271 ) ( TRUCK-AT ?auto_10271 ?auto_10272 ) ( ON ?auto_10266 ?auto_10265 ) ( not ( = ?auto_10265 ?auto_10266 ) ) ( not ( = ?auto_10265 ?auto_10267 ) ) ( not ( = ?auto_10265 ?auto_10264 ) ) ( not ( = ?auto_10265 ?auto_10270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10266 ?auto_10267 ?auto_10264 )
      ( MAKE-3CRATE-VERIFY ?auto_10265 ?auto_10266 ?auto_10267 ?auto_10264 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10275 - SURFACE
      ?auto_10276 - SURFACE
      ?auto_10277 - SURFACE
      ?auto_10274 - SURFACE
      ?auto_10278 - SURFACE
    )
    :vars
    (
      ?auto_10280 - HOIST
      ?auto_10279 - PLACE
      ?auto_10283 - PLACE
      ?auto_10284 - HOIST
      ?auto_10281 - SURFACE
      ?auto_10282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10280 ?auto_10279 ) ( IS-CRATE ?auto_10278 ) ( not ( = ?auto_10274 ?auto_10278 ) ) ( not ( = ?auto_10277 ?auto_10274 ) ) ( not ( = ?auto_10277 ?auto_10278 ) ) ( not ( = ?auto_10283 ?auto_10279 ) ) ( HOIST-AT ?auto_10284 ?auto_10283 ) ( not ( = ?auto_10280 ?auto_10284 ) ) ( AVAILABLE ?auto_10284 ) ( SURFACE-AT ?auto_10278 ?auto_10283 ) ( ON ?auto_10278 ?auto_10281 ) ( CLEAR ?auto_10278 ) ( not ( = ?auto_10274 ?auto_10281 ) ) ( not ( = ?auto_10278 ?auto_10281 ) ) ( not ( = ?auto_10277 ?auto_10281 ) ) ( SURFACE-AT ?auto_10277 ?auto_10279 ) ( CLEAR ?auto_10277 ) ( IS-CRATE ?auto_10274 ) ( AVAILABLE ?auto_10280 ) ( IN ?auto_10274 ?auto_10282 ) ( TRUCK-AT ?auto_10282 ?auto_10283 ) ( ON ?auto_10276 ?auto_10275 ) ( ON ?auto_10277 ?auto_10276 ) ( not ( = ?auto_10275 ?auto_10276 ) ) ( not ( = ?auto_10275 ?auto_10277 ) ) ( not ( = ?auto_10275 ?auto_10274 ) ) ( not ( = ?auto_10275 ?auto_10278 ) ) ( not ( = ?auto_10275 ?auto_10281 ) ) ( not ( = ?auto_10276 ?auto_10277 ) ) ( not ( = ?auto_10276 ?auto_10274 ) ) ( not ( = ?auto_10276 ?auto_10278 ) ) ( not ( = ?auto_10276 ?auto_10281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10277 ?auto_10274 ?auto_10278 )
      ( MAKE-4CRATE-VERIFY ?auto_10275 ?auto_10276 ?auto_10277 ?auto_10274 ?auto_10278 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10285 - SURFACE
      ?auto_10286 - SURFACE
    )
    :vars
    (
      ?auto_10289 - HOIST
      ?auto_10287 - PLACE
      ?auto_10288 - SURFACE
      ?auto_10292 - PLACE
      ?auto_10293 - HOIST
      ?auto_10290 - SURFACE
      ?auto_10291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10289 ?auto_10287 ) ( IS-CRATE ?auto_10286 ) ( not ( = ?auto_10285 ?auto_10286 ) ) ( not ( = ?auto_10288 ?auto_10285 ) ) ( not ( = ?auto_10288 ?auto_10286 ) ) ( not ( = ?auto_10292 ?auto_10287 ) ) ( HOIST-AT ?auto_10293 ?auto_10292 ) ( not ( = ?auto_10289 ?auto_10293 ) ) ( SURFACE-AT ?auto_10286 ?auto_10292 ) ( ON ?auto_10286 ?auto_10290 ) ( CLEAR ?auto_10286 ) ( not ( = ?auto_10285 ?auto_10290 ) ) ( not ( = ?auto_10286 ?auto_10290 ) ) ( not ( = ?auto_10288 ?auto_10290 ) ) ( SURFACE-AT ?auto_10288 ?auto_10287 ) ( CLEAR ?auto_10288 ) ( IS-CRATE ?auto_10285 ) ( AVAILABLE ?auto_10289 ) ( TRUCK-AT ?auto_10291 ?auto_10292 ) ( LIFTING ?auto_10293 ?auto_10285 ) )
    :subtasks
    ( ( !LOAD ?auto_10293 ?auto_10285 ?auto_10291 ?auto_10292 )
      ( MAKE-2CRATE ?auto_10288 ?auto_10285 ?auto_10286 )
      ( MAKE-1CRATE-VERIFY ?auto_10285 ?auto_10286 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10294 - SURFACE
      ?auto_10295 - SURFACE
      ?auto_10296 - SURFACE
    )
    :vars
    (
      ?auto_10299 - HOIST
      ?auto_10298 - PLACE
      ?auto_10302 - PLACE
      ?auto_10301 - HOIST
      ?auto_10300 - SURFACE
      ?auto_10297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10299 ?auto_10298 ) ( IS-CRATE ?auto_10296 ) ( not ( = ?auto_10295 ?auto_10296 ) ) ( not ( = ?auto_10294 ?auto_10295 ) ) ( not ( = ?auto_10294 ?auto_10296 ) ) ( not ( = ?auto_10302 ?auto_10298 ) ) ( HOIST-AT ?auto_10301 ?auto_10302 ) ( not ( = ?auto_10299 ?auto_10301 ) ) ( SURFACE-AT ?auto_10296 ?auto_10302 ) ( ON ?auto_10296 ?auto_10300 ) ( CLEAR ?auto_10296 ) ( not ( = ?auto_10295 ?auto_10300 ) ) ( not ( = ?auto_10296 ?auto_10300 ) ) ( not ( = ?auto_10294 ?auto_10300 ) ) ( SURFACE-AT ?auto_10294 ?auto_10298 ) ( CLEAR ?auto_10294 ) ( IS-CRATE ?auto_10295 ) ( AVAILABLE ?auto_10299 ) ( TRUCK-AT ?auto_10297 ?auto_10302 ) ( LIFTING ?auto_10301 ?auto_10295 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10295 ?auto_10296 )
      ( MAKE-2CRATE-VERIFY ?auto_10294 ?auto_10295 ?auto_10296 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10304 - SURFACE
      ?auto_10305 - SURFACE
      ?auto_10306 - SURFACE
      ?auto_10303 - SURFACE
    )
    :vars
    (
      ?auto_10311 - HOIST
      ?auto_10307 - PLACE
      ?auto_10310 - PLACE
      ?auto_10309 - HOIST
      ?auto_10312 - SURFACE
      ?auto_10308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10311 ?auto_10307 ) ( IS-CRATE ?auto_10303 ) ( not ( = ?auto_10306 ?auto_10303 ) ) ( not ( = ?auto_10305 ?auto_10306 ) ) ( not ( = ?auto_10305 ?auto_10303 ) ) ( not ( = ?auto_10310 ?auto_10307 ) ) ( HOIST-AT ?auto_10309 ?auto_10310 ) ( not ( = ?auto_10311 ?auto_10309 ) ) ( SURFACE-AT ?auto_10303 ?auto_10310 ) ( ON ?auto_10303 ?auto_10312 ) ( CLEAR ?auto_10303 ) ( not ( = ?auto_10306 ?auto_10312 ) ) ( not ( = ?auto_10303 ?auto_10312 ) ) ( not ( = ?auto_10305 ?auto_10312 ) ) ( SURFACE-AT ?auto_10305 ?auto_10307 ) ( CLEAR ?auto_10305 ) ( IS-CRATE ?auto_10306 ) ( AVAILABLE ?auto_10311 ) ( TRUCK-AT ?auto_10308 ?auto_10310 ) ( LIFTING ?auto_10309 ?auto_10306 ) ( ON ?auto_10305 ?auto_10304 ) ( not ( = ?auto_10304 ?auto_10305 ) ) ( not ( = ?auto_10304 ?auto_10306 ) ) ( not ( = ?auto_10304 ?auto_10303 ) ) ( not ( = ?auto_10304 ?auto_10312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10305 ?auto_10306 ?auto_10303 )
      ( MAKE-3CRATE-VERIFY ?auto_10304 ?auto_10305 ?auto_10306 ?auto_10303 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10314 - SURFACE
      ?auto_10315 - SURFACE
      ?auto_10316 - SURFACE
      ?auto_10313 - SURFACE
      ?auto_10317 - SURFACE
    )
    :vars
    (
      ?auto_10322 - HOIST
      ?auto_10318 - PLACE
      ?auto_10321 - PLACE
      ?auto_10320 - HOIST
      ?auto_10323 - SURFACE
      ?auto_10319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10322 ?auto_10318 ) ( IS-CRATE ?auto_10317 ) ( not ( = ?auto_10313 ?auto_10317 ) ) ( not ( = ?auto_10316 ?auto_10313 ) ) ( not ( = ?auto_10316 ?auto_10317 ) ) ( not ( = ?auto_10321 ?auto_10318 ) ) ( HOIST-AT ?auto_10320 ?auto_10321 ) ( not ( = ?auto_10322 ?auto_10320 ) ) ( SURFACE-AT ?auto_10317 ?auto_10321 ) ( ON ?auto_10317 ?auto_10323 ) ( CLEAR ?auto_10317 ) ( not ( = ?auto_10313 ?auto_10323 ) ) ( not ( = ?auto_10317 ?auto_10323 ) ) ( not ( = ?auto_10316 ?auto_10323 ) ) ( SURFACE-AT ?auto_10316 ?auto_10318 ) ( CLEAR ?auto_10316 ) ( IS-CRATE ?auto_10313 ) ( AVAILABLE ?auto_10322 ) ( TRUCK-AT ?auto_10319 ?auto_10321 ) ( LIFTING ?auto_10320 ?auto_10313 ) ( ON ?auto_10315 ?auto_10314 ) ( ON ?auto_10316 ?auto_10315 ) ( not ( = ?auto_10314 ?auto_10315 ) ) ( not ( = ?auto_10314 ?auto_10316 ) ) ( not ( = ?auto_10314 ?auto_10313 ) ) ( not ( = ?auto_10314 ?auto_10317 ) ) ( not ( = ?auto_10314 ?auto_10323 ) ) ( not ( = ?auto_10315 ?auto_10316 ) ) ( not ( = ?auto_10315 ?auto_10313 ) ) ( not ( = ?auto_10315 ?auto_10317 ) ) ( not ( = ?auto_10315 ?auto_10323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10316 ?auto_10313 ?auto_10317 )
      ( MAKE-4CRATE-VERIFY ?auto_10314 ?auto_10315 ?auto_10316 ?auto_10313 ?auto_10317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10324 - SURFACE
      ?auto_10325 - SURFACE
    )
    :vars
    (
      ?auto_10330 - HOIST
      ?auto_10326 - PLACE
      ?auto_10332 - SURFACE
      ?auto_10329 - PLACE
      ?auto_10328 - HOIST
      ?auto_10331 - SURFACE
      ?auto_10327 - TRUCK
      ?auto_10333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10330 ?auto_10326 ) ( IS-CRATE ?auto_10325 ) ( not ( = ?auto_10324 ?auto_10325 ) ) ( not ( = ?auto_10332 ?auto_10324 ) ) ( not ( = ?auto_10332 ?auto_10325 ) ) ( not ( = ?auto_10329 ?auto_10326 ) ) ( HOIST-AT ?auto_10328 ?auto_10329 ) ( not ( = ?auto_10330 ?auto_10328 ) ) ( SURFACE-AT ?auto_10325 ?auto_10329 ) ( ON ?auto_10325 ?auto_10331 ) ( CLEAR ?auto_10325 ) ( not ( = ?auto_10324 ?auto_10331 ) ) ( not ( = ?auto_10325 ?auto_10331 ) ) ( not ( = ?auto_10332 ?auto_10331 ) ) ( SURFACE-AT ?auto_10332 ?auto_10326 ) ( CLEAR ?auto_10332 ) ( IS-CRATE ?auto_10324 ) ( AVAILABLE ?auto_10330 ) ( TRUCK-AT ?auto_10327 ?auto_10329 ) ( AVAILABLE ?auto_10328 ) ( SURFACE-AT ?auto_10324 ?auto_10329 ) ( ON ?auto_10324 ?auto_10333 ) ( CLEAR ?auto_10324 ) ( not ( = ?auto_10324 ?auto_10333 ) ) ( not ( = ?auto_10325 ?auto_10333 ) ) ( not ( = ?auto_10332 ?auto_10333 ) ) ( not ( = ?auto_10331 ?auto_10333 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10328 ?auto_10324 ?auto_10333 ?auto_10329 )
      ( MAKE-2CRATE ?auto_10332 ?auto_10324 ?auto_10325 )
      ( MAKE-1CRATE-VERIFY ?auto_10324 ?auto_10325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10334 - SURFACE
      ?auto_10335 - SURFACE
      ?auto_10336 - SURFACE
    )
    :vars
    (
      ?auto_10337 - HOIST
      ?auto_10338 - PLACE
      ?auto_10340 - PLACE
      ?auto_10341 - HOIST
      ?auto_10343 - SURFACE
      ?auto_10339 - TRUCK
      ?auto_10342 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10337 ?auto_10338 ) ( IS-CRATE ?auto_10336 ) ( not ( = ?auto_10335 ?auto_10336 ) ) ( not ( = ?auto_10334 ?auto_10335 ) ) ( not ( = ?auto_10334 ?auto_10336 ) ) ( not ( = ?auto_10340 ?auto_10338 ) ) ( HOIST-AT ?auto_10341 ?auto_10340 ) ( not ( = ?auto_10337 ?auto_10341 ) ) ( SURFACE-AT ?auto_10336 ?auto_10340 ) ( ON ?auto_10336 ?auto_10343 ) ( CLEAR ?auto_10336 ) ( not ( = ?auto_10335 ?auto_10343 ) ) ( not ( = ?auto_10336 ?auto_10343 ) ) ( not ( = ?auto_10334 ?auto_10343 ) ) ( SURFACE-AT ?auto_10334 ?auto_10338 ) ( CLEAR ?auto_10334 ) ( IS-CRATE ?auto_10335 ) ( AVAILABLE ?auto_10337 ) ( TRUCK-AT ?auto_10339 ?auto_10340 ) ( AVAILABLE ?auto_10341 ) ( SURFACE-AT ?auto_10335 ?auto_10340 ) ( ON ?auto_10335 ?auto_10342 ) ( CLEAR ?auto_10335 ) ( not ( = ?auto_10335 ?auto_10342 ) ) ( not ( = ?auto_10336 ?auto_10342 ) ) ( not ( = ?auto_10334 ?auto_10342 ) ) ( not ( = ?auto_10343 ?auto_10342 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10335 ?auto_10336 )
      ( MAKE-2CRATE-VERIFY ?auto_10334 ?auto_10335 ?auto_10336 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10345 - SURFACE
      ?auto_10346 - SURFACE
      ?auto_10347 - SURFACE
      ?auto_10344 - SURFACE
    )
    :vars
    (
      ?auto_10350 - HOIST
      ?auto_10349 - PLACE
      ?auto_10348 - PLACE
      ?auto_10351 - HOIST
      ?auto_10352 - SURFACE
      ?auto_10354 - TRUCK
      ?auto_10353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10350 ?auto_10349 ) ( IS-CRATE ?auto_10344 ) ( not ( = ?auto_10347 ?auto_10344 ) ) ( not ( = ?auto_10346 ?auto_10347 ) ) ( not ( = ?auto_10346 ?auto_10344 ) ) ( not ( = ?auto_10348 ?auto_10349 ) ) ( HOIST-AT ?auto_10351 ?auto_10348 ) ( not ( = ?auto_10350 ?auto_10351 ) ) ( SURFACE-AT ?auto_10344 ?auto_10348 ) ( ON ?auto_10344 ?auto_10352 ) ( CLEAR ?auto_10344 ) ( not ( = ?auto_10347 ?auto_10352 ) ) ( not ( = ?auto_10344 ?auto_10352 ) ) ( not ( = ?auto_10346 ?auto_10352 ) ) ( SURFACE-AT ?auto_10346 ?auto_10349 ) ( CLEAR ?auto_10346 ) ( IS-CRATE ?auto_10347 ) ( AVAILABLE ?auto_10350 ) ( TRUCK-AT ?auto_10354 ?auto_10348 ) ( AVAILABLE ?auto_10351 ) ( SURFACE-AT ?auto_10347 ?auto_10348 ) ( ON ?auto_10347 ?auto_10353 ) ( CLEAR ?auto_10347 ) ( not ( = ?auto_10347 ?auto_10353 ) ) ( not ( = ?auto_10344 ?auto_10353 ) ) ( not ( = ?auto_10346 ?auto_10353 ) ) ( not ( = ?auto_10352 ?auto_10353 ) ) ( ON ?auto_10346 ?auto_10345 ) ( not ( = ?auto_10345 ?auto_10346 ) ) ( not ( = ?auto_10345 ?auto_10347 ) ) ( not ( = ?auto_10345 ?auto_10344 ) ) ( not ( = ?auto_10345 ?auto_10352 ) ) ( not ( = ?auto_10345 ?auto_10353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10346 ?auto_10347 ?auto_10344 )
      ( MAKE-3CRATE-VERIFY ?auto_10345 ?auto_10346 ?auto_10347 ?auto_10344 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10356 - SURFACE
      ?auto_10357 - SURFACE
      ?auto_10358 - SURFACE
      ?auto_10355 - SURFACE
      ?auto_10359 - SURFACE
    )
    :vars
    (
      ?auto_10362 - HOIST
      ?auto_10361 - PLACE
      ?auto_10360 - PLACE
      ?auto_10363 - HOIST
      ?auto_10364 - SURFACE
      ?auto_10366 - TRUCK
      ?auto_10365 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10362 ?auto_10361 ) ( IS-CRATE ?auto_10359 ) ( not ( = ?auto_10355 ?auto_10359 ) ) ( not ( = ?auto_10358 ?auto_10355 ) ) ( not ( = ?auto_10358 ?auto_10359 ) ) ( not ( = ?auto_10360 ?auto_10361 ) ) ( HOIST-AT ?auto_10363 ?auto_10360 ) ( not ( = ?auto_10362 ?auto_10363 ) ) ( SURFACE-AT ?auto_10359 ?auto_10360 ) ( ON ?auto_10359 ?auto_10364 ) ( CLEAR ?auto_10359 ) ( not ( = ?auto_10355 ?auto_10364 ) ) ( not ( = ?auto_10359 ?auto_10364 ) ) ( not ( = ?auto_10358 ?auto_10364 ) ) ( SURFACE-AT ?auto_10358 ?auto_10361 ) ( CLEAR ?auto_10358 ) ( IS-CRATE ?auto_10355 ) ( AVAILABLE ?auto_10362 ) ( TRUCK-AT ?auto_10366 ?auto_10360 ) ( AVAILABLE ?auto_10363 ) ( SURFACE-AT ?auto_10355 ?auto_10360 ) ( ON ?auto_10355 ?auto_10365 ) ( CLEAR ?auto_10355 ) ( not ( = ?auto_10355 ?auto_10365 ) ) ( not ( = ?auto_10359 ?auto_10365 ) ) ( not ( = ?auto_10358 ?auto_10365 ) ) ( not ( = ?auto_10364 ?auto_10365 ) ) ( ON ?auto_10357 ?auto_10356 ) ( ON ?auto_10358 ?auto_10357 ) ( not ( = ?auto_10356 ?auto_10357 ) ) ( not ( = ?auto_10356 ?auto_10358 ) ) ( not ( = ?auto_10356 ?auto_10355 ) ) ( not ( = ?auto_10356 ?auto_10359 ) ) ( not ( = ?auto_10356 ?auto_10364 ) ) ( not ( = ?auto_10356 ?auto_10365 ) ) ( not ( = ?auto_10357 ?auto_10358 ) ) ( not ( = ?auto_10357 ?auto_10355 ) ) ( not ( = ?auto_10357 ?auto_10359 ) ) ( not ( = ?auto_10357 ?auto_10364 ) ) ( not ( = ?auto_10357 ?auto_10365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10358 ?auto_10355 ?auto_10359 )
      ( MAKE-4CRATE-VERIFY ?auto_10356 ?auto_10357 ?auto_10358 ?auto_10355 ?auto_10359 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10367 - SURFACE
      ?auto_10368 - SURFACE
    )
    :vars
    (
      ?auto_10371 - HOIST
      ?auto_10370 - PLACE
      ?auto_10375 - SURFACE
      ?auto_10369 - PLACE
      ?auto_10372 - HOIST
      ?auto_10373 - SURFACE
      ?auto_10374 - SURFACE
      ?auto_10376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10371 ?auto_10370 ) ( IS-CRATE ?auto_10368 ) ( not ( = ?auto_10367 ?auto_10368 ) ) ( not ( = ?auto_10375 ?auto_10367 ) ) ( not ( = ?auto_10375 ?auto_10368 ) ) ( not ( = ?auto_10369 ?auto_10370 ) ) ( HOIST-AT ?auto_10372 ?auto_10369 ) ( not ( = ?auto_10371 ?auto_10372 ) ) ( SURFACE-AT ?auto_10368 ?auto_10369 ) ( ON ?auto_10368 ?auto_10373 ) ( CLEAR ?auto_10368 ) ( not ( = ?auto_10367 ?auto_10373 ) ) ( not ( = ?auto_10368 ?auto_10373 ) ) ( not ( = ?auto_10375 ?auto_10373 ) ) ( SURFACE-AT ?auto_10375 ?auto_10370 ) ( CLEAR ?auto_10375 ) ( IS-CRATE ?auto_10367 ) ( AVAILABLE ?auto_10371 ) ( AVAILABLE ?auto_10372 ) ( SURFACE-AT ?auto_10367 ?auto_10369 ) ( ON ?auto_10367 ?auto_10374 ) ( CLEAR ?auto_10367 ) ( not ( = ?auto_10367 ?auto_10374 ) ) ( not ( = ?auto_10368 ?auto_10374 ) ) ( not ( = ?auto_10375 ?auto_10374 ) ) ( not ( = ?auto_10373 ?auto_10374 ) ) ( TRUCK-AT ?auto_10376 ?auto_10370 ) )
    :subtasks
    ( ( !DRIVE ?auto_10376 ?auto_10370 ?auto_10369 )
      ( MAKE-2CRATE ?auto_10375 ?auto_10367 ?auto_10368 )
      ( MAKE-1CRATE-VERIFY ?auto_10367 ?auto_10368 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10377 - SURFACE
      ?auto_10378 - SURFACE
      ?auto_10379 - SURFACE
    )
    :vars
    (
      ?auto_10381 - HOIST
      ?auto_10380 - PLACE
      ?auto_10382 - PLACE
      ?auto_10384 - HOIST
      ?auto_10385 - SURFACE
      ?auto_10386 - SURFACE
      ?auto_10383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10381 ?auto_10380 ) ( IS-CRATE ?auto_10379 ) ( not ( = ?auto_10378 ?auto_10379 ) ) ( not ( = ?auto_10377 ?auto_10378 ) ) ( not ( = ?auto_10377 ?auto_10379 ) ) ( not ( = ?auto_10382 ?auto_10380 ) ) ( HOIST-AT ?auto_10384 ?auto_10382 ) ( not ( = ?auto_10381 ?auto_10384 ) ) ( SURFACE-AT ?auto_10379 ?auto_10382 ) ( ON ?auto_10379 ?auto_10385 ) ( CLEAR ?auto_10379 ) ( not ( = ?auto_10378 ?auto_10385 ) ) ( not ( = ?auto_10379 ?auto_10385 ) ) ( not ( = ?auto_10377 ?auto_10385 ) ) ( SURFACE-AT ?auto_10377 ?auto_10380 ) ( CLEAR ?auto_10377 ) ( IS-CRATE ?auto_10378 ) ( AVAILABLE ?auto_10381 ) ( AVAILABLE ?auto_10384 ) ( SURFACE-AT ?auto_10378 ?auto_10382 ) ( ON ?auto_10378 ?auto_10386 ) ( CLEAR ?auto_10378 ) ( not ( = ?auto_10378 ?auto_10386 ) ) ( not ( = ?auto_10379 ?auto_10386 ) ) ( not ( = ?auto_10377 ?auto_10386 ) ) ( not ( = ?auto_10385 ?auto_10386 ) ) ( TRUCK-AT ?auto_10383 ?auto_10380 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10378 ?auto_10379 )
      ( MAKE-2CRATE-VERIFY ?auto_10377 ?auto_10378 ?auto_10379 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10388 - SURFACE
      ?auto_10389 - SURFACE
      ?auto_10390 - SURFACE
      ?auto_10387 - SURFACE
    )
    :vars
    (
      ?auto_10391 - HOIST
      ?auto_10396 - PLACE
      ?auto_10397 - PLACE
      ?auto_10393 - HOIST
      ?auto_10394 - SURFACE
      ?auto_10392 - SURFACE
      ?auto_10395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10391 ?auto_10396 ) ( IS-CRATE ?auto_10387 ) ( not ( = ?auto_10390 ?auto_10387 ) ) ( not ( = ?auto_10389 ?auto_10390 ) ) ( not ( = ?auto_10389 ?auto_10387 ) ) ( not ( = ?auto_10397 ?auto_10396 ) ) ( HOIST-AT ?auto_10393 ?auto_10397 ) ( not ( = ?auto_10391 ?auto_10393 ) ) ( SURFACE-AT ?auto_10387 ?auto_10397 ) ( ON ?auto_10387 ?auto_10394 ) ( CLEAR ?auto_10387 ) ( not ( = ?auto_10390 ?auto_10394 ) ) ( not ( = ?auto_10387 ?auto_10394 ) ) ( not ( = ?auto_10389 ?auto_10394 ) ) ( SURFACE-AT ?auto_10389 ?auto_10396 ) ( CLEAR ?auto_10389 ) ( IS-CRATE ?auto_10390 ) ( AVAILABLE ?auto_10391 ) ( AVAILABLE ?auto_10393 ) ( SURFACE-AT ?auto_10390 ?auto_10397 ) ( ON ?auto_10390 ?auto_10392 ) ( CLEAR ?auto_10390 ) ( not ( = ?auto_10390 ?auto_10392 ) ) ( not ( = ?auto_10387 ?auto_10392 ) ) ( not ( = ?auto_10389 ?auto_10392 ) ) ( not ( = ?auto_10394 ?auto_10392 ) ) ( TRUCK-AT ?auto_10395 ?auto_10396 ) ( ON ?auto_10389 ?auto_10388 ) ( not ( = ?auto_10388 ?auto_10389 ) ) ( not ( = ?auto_10388 ?auto_10390 ) ) ( not ( = ?auto_10388 ?auto_10387 ) ) ( not ( = ?auto_10388 ?auto_10394 ) ) ( not ( = ?auto_10388 ?auto_10392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10389 ?auto_10390 ?auto_10387 )
      ( MAKE-3CRATE-VERIFY ?auto_10388 ?auto_10389 ?auto_10390 ?auto_10387 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10399 - SURFACE
      ?auto_10400 - SURFACE
      ?auto_10401 - SURFACE
      ?auto_10398 - SURFACE
      ?auto_10402 - SURFACE
    )
    :vars
    (
      ?auto_10403 - HOIST
      ?auto_10408 - PLACE
      ?auto_10409 - PLACE
      ?auto_10405 - HOIST
      ?auto_10406 - SURFACE
      ?auto_10404 - SURFACE
      ?auto_10407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10403 ?auto_10408 ) ( IS-CRATE ?auto_10402 ) ( not ( = ?auto_10398 ?auto_10402 ) ) ( not ( = ?auto_10401 ?auto_10398 ) ) ( not ( = ?auto_10401 ?auto_10402 ) ) ( not ( = ?auto_10409 ?auto_10408 ) ) ( HOIST-AT ?auto_10405 ?auto_10409 ) ( not ( = ?auto_10403 ?auto_10405 ) ) ( SURFACE-AT ?auto_10402 ?auto_10409 ) ( ON ?auto_10402 ?auto_10406 ) ( CLEAR ?auto_10402 ) ( not ( = ?auto_10398 ?auto_10406 ) ) ( not ( = ?auto_10402 ?auto_10406 ) ) ( not ( = ?auto_10401 ?auto_10406 ) ) ( SURFACE-AT ?auto_10401 ?auto_10408 ) ( CLEAR ?auto_10401 ) ( IS-CRATE ?auto_10398 ) ( AVAILABLE ?auto_10403 ) ( AVAILABLE ?auto_10405 ) ( SURFACE-AT ?auto_10398 ?auto_10409 ) ( ON ?auto_10398 ?auto_10404 ) ( CLEAR ?auto_10398 ) ( not ( = ?auto_10398 ?auto_10404 ) ) ( not ( = ?auto_10402 ?auto_10404 ) ) ( not ( = ?auto_10401 ?auto_10404 ) ) ( not ( = ?auto_10406 ?auto_10404 ) ) ( TRUCK-AT ?auto_10407 ?auto_10408 ) ( ON ?auto_10400 ?auto_10399 ) ( ON ?auto_10401 ?auto_10400 ) ( not ( = ?auto_10399 ?auto_10400 ) ) ( not ( = ?auto_10399 ?auto_10401 ) ) ( not ( = ?auto_10399 ?auto_10398 ) ) ( not ( = ?auto_10399 ?auto_10402 ) ) ( not ( = ?auto_10399 ?auto_10406 ) ) ( not ( = ?auto_10399 ?auto_10404 ) ) ( not ( = ?auto_10400 ?auto_10401 ) ) ( not ( = ?auto_10400 ?auto_10398 ) ) ( not ( = ?auto_10400 ?auto_10402 ) ) ( not ( = ?auto_10400 ?auto_10406 ) ) ( not ( = ?auto_10400 ?auto_10404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10401 ?auto_10398 ?auto_10402 )
      ( MAKE-4CRATE-VERIFY ?auto_10399 ?auto_10400 ?auto_10401 ?auto_10398 ?auto_10402 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10410 - SURFACE
      ?auto_10411 - SURFACE
    )
    :vars
    (
      ?auto_10412 - HOIST
      ?auto_10417 - PLACE
      ?auto_10419 - SURFACE
      ?auto_10418 - PLACE
      ?auto_10414 - HOIST
      ?auto_10415 - SURFACE
      ?auto_10413 - SURFACE
      ?auto_10416 - TRUCK
      ?auto_10420 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10412 ?auto_10417 ) ( IS-CRATE ?auto_10411 ) ( not ( = ?auto_10410 ?auto_10411 ) ) ( not ( = ?auto_10419 ?auto_10410 ) ) ( not ( = ?auto_10419 ?auto_10411 ) ) ( not ( = ?auto_10418 ?auto_10417 ) ) ( HOIST-AT ?auto_10414 ?auto_10418 ) ( not ( = ?auto_10412 ?auto_10414 ) ) ( SURFACE-AT ?auto_10411 ?auto_10418 ) ( ON ?auto_10411 ?auto_10415 ) ( CLEAR ?auto_10411 ) ( not ( = ?auto_10410 ?auto_10415 ) ) ( not ( = ?auto_10411 ?auto_10415 ) ) ( not ( = ?auto_10419 ?auto_10415 ) ) ( IS-CRATE ?auto_10410 ) ( AVAILABLE ?auto_10414 ) ( SURFACE-AT ?auto_10410 ?auto_10418 ) ( ON ?auto_10410 ?auto_10413 ) ( CLEAR ?auto_10410 ) ( not ( = ?auto_10410 ?auto_10413 ) ) ( not ( = ?auto_10411 ?auto_10413 ) ) ( not ( = ?auto_10419 ?auto_10413 ) ) ( not ( = ?auto_10415 ?auto_10413 ) ) ( TRUCK-AT ?auto_10416 ?auto_10417 ) ( SURFACE-AT ?auto_10420 ?auto_10417 ) ( CLEAR ?auto_10420 ) ( LIFTING ?auto_10412 ?auto_10419 ) ( IS-CRATE ?auto_10419 ) ( not ( = ?auto_10420 ?auto_10419 ) ) ( not ( = ?auto_10410 ?auto_10420 ) ) ( not ( = ?auto_10411 ?auto_10420 ) ) ( not ( = ?auto_10415 ?auto_10420 ) ) ( not ( = ?auto_10413 ?auto_10420 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10420 ?auto_10419 )
      ( MAKE-2CRATE ?auto_10419 ?auto_10410 ?auto_10411 )
      ( MAKE-1CRATE-VERIFY ?auto_10410 ?auto_10411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10421 - SURFACE
      ?auto_10422 - SURFACE
      ?auto_10423 - SURFACE
    )
    :vars
    (
      ?auto_10430 - HOIST
      ?auto_10427 - PLACE
      ?auto_10424 - PLACE
      ?auto_10426 - HOIST
      ?auto_10429 - SURFACE
      ?auto_10431 - SURFACE
      ?auto_10425 - TRUCK
      ?auto_10428 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10430 ?auto_10427 ) ( IS-CRATE ?auto_10423 ) ( not ( = ?auto_10422 ?auto_10423 ) ) ( not ( = ?auto_10421 ?auto_10422 ) ) ( not ( = ?auto_10421 ?auto_10423 ) ) ( not ( = ?auto_10424 ?auto_10427 ) ) ( HOIST-AT ?auto_10426 ?auto_10424 ) ( not ( = ?auto_10430 ?auto_10426 ) ) ( SURFACE-AT ?auto_10423 ?auto_10424 ) ( ON ?auto_10423 ?auto_10429 ) ( CLEAR ?auto_10423 ) ( not ( = ?auto_10422 ?auto_10429 ) ) ( not ( = ?auto_10423 ?auto_10429 ) ) ( not ( = ?auto_10421 ?auto_10429 ) ) ( IS-CRATE ?auto_10422 ) ( AVAILABLE ?auto_10426 ) ( SURFACE-AT ?auto_10422 ?auto_10424 ) ( ON ?auto_10422 ?auto_10431 ) ( CLEAR ?auto_10422 ) ( not ( = ?auto_10422 ?auto_10431 ) ) ( not ( = ?auto_10423 ?auto_10431 ) ) ( not ( = ?auto_10421 ?auto_10431 ) ) ( not ( = ?auto_10429 ?auto_10431 ) ) ( TRUCK-AT ?auto_10425 ?auto_10427 ) ( SURFACE-AT ?auto_10428 ?auto_10427 ) ( CLEAR ?auto_10428 ) ( LIFTING ?auto_10430 ?auto_10421 ) ( IS-CRATE ?auto_10421 ) ( not ( = ?auto_10428 ?auto_10421 ) ) ( not ( = ?auto_10422 ?auto_10428 ) ) ( not ( = ?auto_10423 ?auto_10428 ) ) ( not ( = ?auto_10429 ?auto_10428 ) ) ( not ( = ?auto_10431 ?auto_10428 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10422 ?auto_10423 )
      ( MAKE-2CRATE-VERIFY ?auto_10421 ?auto_10422 ?auto_10423 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10433 - SURFACE
      ?auto_10434 - SURFACE
      ?auto_10435 - SURFACE
      ?auto_10432 - SURFACE
    )
    :vars
    (
      ?auto_10436 - HOIST
      ?auto_10441 - PLACE
      ?auto_10442 - PLACE
      ?auto_10439 - HOIST
      ?auto_10438 - SURFACE
      ?auto_10440 - SURFACE
      ?auto_10437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10436 ?auto_10441 ) ( IS-CRATE ?auto_10432 ) ( not ( = ?auto_10435 ?auto_10432 ) ) ( not ( = ?auto_10434 ?auto_10435 ) ) ( not ( = ?auto_10434 ?auto_10432 ) ) ( not ( = ?auto_10442 ?auto_10441 ) ) ( HOIST-AT ?auto_10439 ?auto_10442 ) ( not ( = ?auto_10436 ?auto_10439 ) ) ( SURFACE-AT ?auto_10432 ?auto_10442 ) ( ON ?auto_10432 ?auto_10438 ) ( CLEAR ?auto_10432 ) ( not ( = ?auto_10435 ?auto_10438 ) ) ( not ( = ?auto_10432 ?auto_10438 ) ) ( not ( = ?auto_10434 ?auto_10438 ) ) ( IS-CRATE ?auto_10435 ) ( AVAILABLE ?auto_10439 ) ( SURFACE-AT ?auto_10435 ?auto_10442 ) ( ON ?auto_10435 ?auto_10440 ) ( CLEAR ?auto_10435 ) ( not ( = ?auto_10435 ?auto_10440 ) ) ( not ( = ?auto_10432 ?auto_10440 ) ) ( not ( = ?auto_10434 ?auto_10440 ) ) ( not ( = ?auto_10438 ?auto_10440 ) ) ( TRUCK-AT ?auto_10437 ?auto_10441 ) ( SURFACE-AT ?auto_10433 ?auto_10441 ) ( CLEAR ?auto_10433 ) ( LIFTING ?auto_10436 ?auto_10434 ) ( IS-CRATE ?auto_10434 ) ( not ( = ?auto_10433 ?auto_10434 ) ) ( not ( = ?auto_10435 ?auto_10433 ) ) ( not ( = ?auto_10432 ?auto_10433 ) ) ( not ( = ?auto_10438 ?auto_10433 ) ) ( not ( = ?auto_10440 ?auto_10433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10434 ?auto_10435 ?auto_10432 )
      ( MAKE-3CRATE-VERIFY ?auto_10433 ?auto_10434 ?auto_10435 ?auto_10432 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10444 - SURFACE
      ?auto_10445 - SURFACE
      ?auto_10446 - SURFACE
      ?auto_10443 - SURFACE
      ?auto_10447 - SURFACE
    )
    :vars
    (
      ?auto_10448 - HOIST
      ?auto_10453 - PLACE
      ?auto_10454 - PLACE
      ?auto_10451 - HOIST
      ?auto_10450 - SURFACE
      ?auto_10452 - SURFACE
      ?auto_10449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10448 ?auto_10453 ) ( IS-CRATE ?auto_10447 ) ( not ( = ?auto_10443 ?auto_10447 ) ) ( not ( = ?auto_10446 ?auto_10443 ) ) ( not ( = ?auto_10446 ?auto_10447 ) ) ( not ( = ?auto_10454 ?auto_10453 ) ) ( HOIST-AT ?auto_10451 ?auto_10454 ) ( not ( = ?auto_10448 ?auto_10451 ) ) ( SURFACE-AT ?auto_10447 ?auto_10454 ) ( ON ?auto_10447 ?auto_10450 ) ( CLEAR ?auto_10447 ) ( not ( = ?auto_10443 ?auto_10450 ) ) ( not ( = ?auto_10447 ?auto_10450 ) ) ( not ( = ?auto_10446 ?auto_10450 ) ) ( IS-CRATE ?auto_10443 ) ( AVAILABLE ?auto_10451 ) ( SURFACE-AT ?auto_10443 ?auto_10454 ) ( ON ?auto_10443 ?auto_10452 ) ( CLEAR ?auto_10443 ) ( not ( = ?auto_10443 ?auto_10452 ) ) ( not ( = ?auto_10447 ?auto_10452 ) ) ( not ( = ?auto_10446 ?auto_10452 ) ) ( not ( = ?auto_10450 ?auto_10452 ) ) ( TRUCK-AT ?auto_10449 ?auto_10453 ) ( SURFACE-AT ?auto_10445 ?auto_10453 ) ( CLEAR ?auto_10445 ) ( LIFTING ?auto_10448 ?auto_10446 ) ( IS-CRATE ?auto_10446 ) ( not ( = ?auto_10445 ?auto_10446 ) ) ( not ( = ?auto_10443 ?auto_10445 ) ) ( not ( = ?auto_10447 ?auto_10445 ) ) ( not ( = ?auto_10450 ?auto_10445 ) ) ( not ( = ?auto_10452 ?auto_10445 ) ) ( ON ?auto_10445 ?auto_10444 ) ( not ( = ?auto_10444 ?auto_10445 ) ) ( not ( = ?auto_10444 ?auto_10446 ) ) ( not ( = ?auto_10444 ?auto_10443 ) ) ( not ( = ?auto_10444 ?auto_10447 ) ) ( not ( = ?auto_10444 ?auto_10450 ) ) ( not ( = ?auto_10444 ?auto_10452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10446 ?auto_10443 ?auto_10447 )
      ( MAKE-4CRATE-VERIFY ?auto_10444 ?auto_10445 ?auto_10446 ?auto_10443 ?auto_10447 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10726 - SURFACE
      ?auto_10727 - SURFACE
    )
    :vars
    (
      ?auto_10732 - HOIST
      ?auto_10731 - PLACE
      ?auto_10728 - SURFACE
      ?auto_10733 - PLACE
      ?auto_10730 - HOIST
      ?auto_10734 - SURFACE
      ?auto_10729 - TRUCK
      ?auto_10735 - SURFACE
      ?auto_10736 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10732 ?auto_10731 ) ( IS-CRATE ?auto_10727 ) ( not ( = ?auto_10726 ?auto_10727 ) ) ( not ( = ?auto_10728 ?auto_10726 ) ) ( not ( = ?auto_10728 ?auto_10727 ) ) ( not ( = ?auto_10733 ?auto_10731 ) ) ( HOIST-AT ?auto_10730 ?auto_10733 ) ( not ( = ?auto_10732 ?auto_10730 ) ) ( SURFACE-AT ?auto_10727 ?auto_10733 ) ( ON ?auto_10727 ?auto_10734 ) ( CLEAR ?auto_10727 ) ( not ( = ?auto_10726 ?auto_10734 ) ) ( not ( = ?auto_10727 ?auto_10734 ) ) ( not ( = ?auto_10728 ?auto_10734 ) ) ( SURFACE-AT ?auto_10728 ?auto_10731 ) ( CLEAR ?auto_10728 ) ( IS-CRATE ?auto_10726 ) ( AVAILABLE ?auto_10732 ) ( TRUCK-AT ?auto_10729 ?auto_10733 ) ( SURFACE-AT ?auto_10726 ?auto_10733 ) ( ON ?auto_10726 ?auto_10735 ) ( CLEAR ?auto_10726 ) ( not ( = ?auto_10726 ?auto_10735 ) ) ( not ( = ?auto_10727 ?auto_10735 ) ) ( not ( = ?auto_10728 ?auto_10735 ) ) ( not ( = ?auto_10734 ?auto_10735 ) ) ( LIFTING ?auto_10730 ?auto_10736 ) ( IS-CRATE ?auto_10736 ) ( not ( = ?auto_10726 ?auto_10736 ) ) ( not ( = ?auto_10727 ?auto_10736 ) ) ( not ( = ?auto_10728 ?auto_10736 ) ) ( not ( = ?auto_10734 ?auto_10736 ) ) ( not ( = ?auto_10735 ?auto_10736 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10730 ?auto_10736 ?auto_10729 ?auto_10733 )
      ( MAKE-2CRATE ?auto_10728 ?auto_10726 ?auto_10727 )
      ( MAKE-1CRATE-VERIFY ?auto_10726 ?auto_10727 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10737 - SURFACE
      ?auto_10738 - SURFACE
      ?auto_10739 - SURFACE
    )
    :vars
    (
      ?auto_10741 - HOIST
      ?auto_10746 - PLACE
      ?auto_10747 - PLACE
      ?auto_10742 - HOIST
      ?auto_10743 - SURFACE
      ?auto_10740 - TRUCK
      ?auto_10745 - SURFACE
      ?auto_10744 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10741 ?auto_10746 ) ( IS-CRATE ?auto_10739 ) ( not ( = ?auto_10738 ?auto_10739 ) ) ( not ( = ?auto_10737 ?auto_10738 ) ) ( not ( = ?auto_10737 ?auto_10739 ) ) ( not ( = ?auto_10747 ?auto_10746 ) ) ( HOIST-AT ?auto_10742 ?auto_10747 ) ( not ( = ?auto_10741 ?auto_10742 ) ) ( SURFACE-AT ?auto_10739 ?auto_10747 ) ( ON ?auto_10739 ?auto_10743 ) ( CLEAR ?auto_10739 ) ( not ( = ?auto_10738 ?auto_10743 ) ) ( not ( = ?auto_10739 ?auto_10743 ) ) ( not ( = ?auto_10737 ?auto_10743 ) ) ( SURFACE-AT ?auto_10737 ?auto_10746 ) ( CLEAR ?auto_10737 ) ( IS-CRATE ?auto_10738 ) ( AVAILABLE ?auto_10741 ) ( TRUCK-AT ?auto_10740 ?auto_10747 ) ( SURFACE-AT ?auto_10738 ?auto_10747 ) ( ON ?auto_10738 ?auto_10745 ) ( CLEAR ?auto_10738 ) ( not ( = ?auto_10738 ?auto_10745 ) ) ( not ( = ?auto_10739 ?auto_10745 ) ) ( not ( = ?auto_10737 ?auto_10745 ) ) ( not ( = ?auto_10743 ?auto_10745 ) ) ( LIFTING ?auto_10742 ?auto_10744 ) ( IS-CRATE ?auto_10744 ) ( not ( = ?auto_10738 ?auto_10744 ) ) ( not ( = ?auto_10739 ?auto_10744 ) ) ( not ( = ?auto_10737 ?auto_10744 ) ) ( not ( = ?auto_10743 ?auto_10744 ) ) ( not ( = ?auto_10745 ?auto_10744 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10738 ?auto_10739 )
      ( MAKE-2CRATE-VERIFY ?auto_10737 ?auto_10738 ?auto_10739 ) )
  )

)

