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
      ?auto_7327 - SURFACE
      ?auto_7328 - SURFACE
    )
    :vars
    (
      ?auto_7329 - HOIST
      ?auto_7330 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7329 ?auto_7330 ) ( SURFACE-AT ?auto_7328 ?auto_7330 ) ( CLEAR ?auto_7328 ) ( LIFTING ?auto_7329 ?auto_7327 ) ( IS-CRATE ?auto_7327 ) ( not ( = ?auto_7327 ?auto_7328 ) ) )
    :subtasks
    ( ( !DROP ?auto_7329 ?auto_7327 ?auto_7328 ?auto_7330 )
      ( MAKE-ON-VERIFY ?auto_7327 ?auto_7328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7331 - SURFACE
      ?auto_7332 - SURFACE
    )
    :vars
    (
      ?auto_7334 - HOIST
      ?auto_7333 - PLACE
      ?auto_7335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7334 ?auto_7333 ) ( SURFACE-AT ?auto_7332 ?auto_7333 ) ( CLEAR ?auto_7332 ) ( IS-CRATE ?auto_7331 ) ( not ( = ?auto_7331 ?auto_7332 ) ) ( TRUCK-AT ?auto_7335 ?auto_7333 ) ( AVAILABLE ?auto_7334 ) ( IN ?auto_7331 ?auto_7335 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7334 ?auto_7331 ?auto_7335 ?auto_7333 )
      ( MAKE-ON ?auto_7331 ?auto_7332 )
      ( MAKE-ON-VERIFY ?auto_7331 ?auto_7332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7336 - SURFACE
      ?auto_7337 - SURFACE
    )
    :vars
    (
      ?auto_7339 - HOIST
      ?auto_7340 - PLACE
      ?auto_7338 - TRUCK
      ?auto_7341 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7339 ?auto_7340 ) ( SURFACE-AT ?auto_7337 ?auto_7340 ) ( CLEAR ?auto_7337 ) ( IS-CRATE ?auto_7336 ) ( not ( = ?auto_7336 ?auto_7337 ) ) ( AVAILABLE ?auto_7339 ) ( IN ?auto_7336 ?auto_7338 ) ( TRUCK-AT ?auto_7338 ?auto_7341 ) ( not ( = ?auto_7341 ?auto_7340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7338 ?auto_7341 ?auto_7340 )
      ( MAKE-ON ?auto_7336 ?auto_7337 )
      ( MAKE-ON-VERIFY ?auto_7336 ?auto_7337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7342 - SURFACE
      ?auto_7343 - SURFACE
    )
    :vars
    (
      ?auto_7345 - HOIST
      ?auto_7346 - PLACE
      ?auto_7344 - TRUCK
      ?auto_7347 - PLACE
      ?auto_7348 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7345 ?auto_7346 ) ( SURFACE-AT ?auto_7343 ?auto_7346 ) ( CLEAR ?auto_7343 ) ( IS-CRATE ?auto_7342 ) ( not ( = ?auto_7342 ?auto_7343 ) ) ( AVAILABLE ?auto_7345 ) ( TRUCK-AT ?auto_7344 ?auto_7347 ) ( not ( = ?auto_7347 ?auto_7346 ) ) ( HOIST-AT ?auto_7348 ?auto_7347 ) ( LIFTING ?auto_7348 ?auto_7342 ) ( not ( = ?auto_7345 ?auto_7348 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7348 ?auto_7342 ?auto_7344 ?auto_7347 )
      ( MAKE-ON ?auto_7342 ?auto_7343 )
      ( MAKE-ON-VERIFY ?auto_7342 ?auto_7343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7349 - SURFACE
      ?auto_7350 - SURFACE
    )
    :vars
    (
      ?auto_7351 - HOIST
      ?auto_7355 - PLACE
      ?auto_7353 - TRUCK
      ?auto_7354 - PLACE
      ?auto_7352 - HOIST
      ?auto_7356 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7351 ?auto_7355 ) ( SURFACE-AT ?auto_7350 ?auto_7355 ) ( CLEAR ?auto_7350 ) ( IS-CRATE ?auto_7349 ) ( not ( = ?auto_7349 ?auto_7350 ) ) ( AVAILABLE ?auto_7351 ) ( TRUCK-AT ?auto_7353 ?auto_7354 ) ( not ( = ?auto_7354 ?auto_7355 ) ) ( HOIST-AT ?auto_7352 ?auto_7354 ) ( not ( = ?auto_7351 ?auto_7352 ) ) ( AVAILABLE ?auto_7352 ) ( SURFACE-AT ?auto_7349 ?auto_7354 ) ( ON ?auto_7349 ?auto_7356 ) ( CLEAR ?auto_7349 ) ( not ( = ?auto_7349 ?auto_7356 ) ) ( not ( = ?auto_7350 ?auto_7356 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7352 ?auto_7349 ?auto_7356 ?auto_7354 )
      ( MAKE-ON ?auto_7349 ?auto_7350 )
      ( MAKE-ON-VERIFY ?auto_7349 ?auto_7350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7357 - SURFACE
      ?auto_7358 - SURFACE
    )
    :vars
    (
      ?auto_7362 - HOIST
      ?auto_7361 - PLACE
      ?auto_7359 - PLACE
      ?auto_7360 - HOIST
      ?auto_7363 - SURFACE
      ?auto_7364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7362 ?auto_7361 ) ( SURFACE-AT ?auto_7358 ?auto_7361 ) ( CLEAR ?auto_7358 ) ( IS-CRATE ?auto_7357 ) ( not ( = ?auto_7357 ?auto_7358 ) ) ( AVAILABLE ?auto_7362 ) ( not ( = ?auto_7359 ?auto_7361 ) ) ( HOIST-AT ?auto_7360 ?auto_7359 ) ( not ( = ?auto_7362 ?auto_7360 ) ) ( AVAILABLE ?auto_7360 ) ( SURFACE-AT ?auto_7357 ?auto_7359 ) ( ON ?auto_7357 ?auto_7363 ) ( CLEAR ?auto_7357 ) ( not ( = ?auto_7357 ?auto_7363 ) ) ( not ( = ?auto_7358 ?auto_7363 ) ) ( TRUCK-AT ?auto_7364 ?auto_7361 ) )
    :subtasks
    ( ( !DRIVE ?auto_7364 ?auto_7361 ?auto_7359 )
      ( MAKE-ON ?auto_7357 ?auto_7358 )
      ( MAKE-ON-VERIFY ?auto_7357 ?auto_7358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7367 - SURFACE
      ?auto_7368 - SURFACE
    )
    :vars
    (
      ?auto_7369 - HOIST
      ?auto_7370 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7369 ?auto_7370 ) ( SURFACE-AT ?auto_7368 ?auto_7370 ) ( CLEAR ?auto_7368 ) ( LIFTING ?auto_7369 ?auto_7367 ) ( IS-CRATE ?auto_7367 ) ( not ( = ?auto_7367 ?auto_7368 ) ) )
    :subtasks
    ( ( !DROP ?auto_7369 ?auto_7367 ?auto_7368 ?auto_7370 )
      ( MAKE-ON-VERIFY ?auto_7367 ?auto_7368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7371 - SURFACE
      ?auto_7372 - SURFACE
    )
    :vars
    (
      ?auto_7374 - HOIST
      ?auto_7373 - PLACE
      ?auto_7375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7374 ?auto_7373 ) ( SURFACE-AT ?auto_7372 ?auto_7373 ) ( CLEAR ?auto_7372 ) ( IS-CRATE ?auto_7371 ) ( not ( = ?auto_7371 ?auto_7372 ) ) ( TRUCK-AT ?auto_7375 ?auto_7373 ) ( AVAILABLE ?auto_7374 ) ( IN ?auto_7371 ?auto_7375 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7374 ?auto_7371 ?auto_7375 ?auto_7373 )
      ( MAKE-ON ?auto_7371 ?auto_7372 )
      ( MAKE-ON-VERIFY ?auto_7371 ?auto_7372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7376 - SURFACE
      ?auto_7377 - SURFACE
    )
    :vars
    (
      ?auto_7378 - HOIST
      ?auto_7379 - PLACE
      ?auto_7380 - TRUCK
      ?auto_7381 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7378 ?auto_7379 ) ( SURFACE-AT ?auto_7377 ?auto_7379 ) ( CLEAR ?auto_7377 ) ( IS-CRATE ?auto_7376 ) ( not ( = ?auto_7376 ?auto_7377 ) ) ( AVAILABLE ?auto_7378 ) ( IN ?auto_7376 ?auto_7380 ) ( TRUCK-AT ?auto_7380 ?auto_7381 ) ( not ( = ?auto_7381 ?auto_7379 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7380 ?auto_7381 ?auto_7379 )
      ( MAKE-ON ?auto_7376 ?auto_7377 )
      ( MAKE-ON-VERIFY ?auto_7376 ?auto_7377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7382 - SURFACE
      ?auto_7383 - SURFACE
    )
    :vars
    (
      ?auto_7384 - HOIST
      ?auto_7385 - PLACE
      ?auto_7386 - TRUCK
      ?auto_7387 - PLACE
      ?auto_7388 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7384 ?auto_7385 ) ( SURFACE-AT ?auto_7383 ?auto_7385 ) ( CLEAR ?auto_7383 ) ( IS-CRATE ?auto_7382 ) ( not ( = ?auto_7382 ?auto_7383 ) ) ( AVAILABLE ?auto_7384 ) ( TRUCK-AT ?auto_7386 ?auto_7387 ) ( not ( = ?auto_7387 ?auto_7385 ) ) ( HOIST-AT ?auto_7388 ?auto_7387 ) ( LIFTING ?auto_7388 ?auto_7382 ) ( not ( = ?auto_7384 ?auto_7388 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7388 ?auto_7382 ?auto_7386 ?auto_7387 )
      ( MAKE-ON ?auto_7382 ?auto_7383 )
      ( MAKE-ON-VERIFY ?auto_7382 ?auto_7383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7389 - SURFACE
      ?auto_7390 - SURFACE
    )
    :vars
    (
      ?auto_7391 - HOIST
      ?auto_7393 - PLACE
      ?auto_7394 - TRUCK
      ?auto_7395 - PLACE
      ?auto_7392 - HOIST
      ?auto_7396 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7391 ?auto_7393 ) ( SURFACE-AT ?auto_7390 ?auto_7393 ) ( CLEAR ?auto_7390 ) ( IS-CRATE ?auto_7389 ) ( not ( = ?auto_7389 ?auto_7390 ) ) ( AVAILABLE ?auto_7391 ) ( TRUCK-AT ?auto_7394 ?auto_7395 ) ( not ( = ?auto_7395 ?auto_7393 ) ) ( HOIST-AT ?auto_7392 ?auto_7395 ) ( not ( = ?auto_7391 ?auto_7392 ) ) ( AVAILABLE ?auto_7392 ) ( SURFACE-AT ?auto_7389 ?auto_7395 ) ( ON ?auto_7389 ?auto_7396 ) ( CLEAR ?auto_7389 ) ( not ( = ?auto_7389 ?auto_7396 ) ) ( not ( = ?auto_7390 ?auto_7396 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7392 ?auto_7389 ?auto_7396 ?auto_7395 )
      ( MAKE-ON ?auto_7389 ?auto_7390 )
      ( MAKE-ON-VERIFY ?auto_7389 ?auto_7390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7397 - SURFACE
      ?auto_7398 - SURFACE
    )
    :vars
    (
      ?auto_7401 - HOIST
      ?auto_7399 - PLACE
      ?auto_7404 - PLACE
      ?auto_7402 - HOIST
      ?auto_7400 - SURFACE
      ?auto_7403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7401 ?auto_7399 ) ( SURFACE-AT ?auto_7398 ?auto_7399 ) ( CLEAR ?auto_7398 ) ( IS-CRATE ?auto_7397 ) ( not ( = ?auto_7397 ?auto_7398 ) ) ( AVAILABLE ?auto_7401 ) ( not ( = ?auto_7404 ?auto_7399 ) ) ( HOIST-AT ?auto_7402 ?auto_7404 ) ( not ( = ?auto_7401 ?auto_7402 ) ) ( AVAILABLE ?auto_7402 ) ( SURFACE-AT ?auto_7397 ?auto_7404 ) ( ON ?auto_7397 ?auto_7400 ) ( CLEAR ?auto_7397 ) ( not ( = ?auto_7397 ?auto_7400 ) ) ( not ( = ?auto_7398 ?auto_7400 ) ) ( TRUCK-AT ?auto_7403 ?auto_7399 ) )
    :subtasks
    ( ( !DRIVE ?auto_7403 ?auto_7399 ?auto_7404 )
      ( MAKE-ON ?auto_7397 ?auto_7398 )
      ( MAKE-ON-VERIFY ?auto_7397 ?auto_7398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7405 - SURFACE
      ?auto_7406 - SURFACE
    )
    :vars
    (
      ?auto_7410 - HOIST
      ?auto_7408 - PLACE
      ?auto_7412 - PLACE
      ?auto_7411 - HOIST
      ?auto_7407 - SURFACE
      ?auto_7409 - TRUCK
      ?auto_7413 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7410 ?auto_7408 ) ( IS-CRATE ?auto_7405 ) ( not ( = ?auto_7405 ?auto_7406 ) ) ( not ( = ?auto_7412 ?auto_7408 ) ) ( HOIST-AT ?auto_7411 ?auto_7412 ) ( not ( = ?auto_7410 ?auto_7411 ) ) ( AVAILABLE ?auto_7411 ) ( SURFACE-AT ?auto_7405 ?auto_7412 ) ( ON ?auto_7405 ?auto_7407 ) ( CLEAR ?auto_7405 ) ( not ( = ?auto_7405 ?auto_7407 ) ) ( not ( = ?auto_7406 ?auto_7407 ) ) ( TRUCK-AT ?auto_7409 ?auto_7408 ) ( SURFACE-AT ?auto_7413 ?auto_7408 ) ( CLEAR ?auto_7413 ) ( LIFTING ?auto_7410 ?auto_7406 ) ( IS-CRATE ?auto_7406 ) ( not ( = ?auto_7405 ?auto_7413 ) ) ( not ( = ?auto_7406 ?auto_7413 ) ) ( not ( = ?auto_7407 ?auto_7413 ) ) )
    :subtasks
    ( ( !DROP ?auto_7410 ?auto_7406 ?auto_7413 ?auto_7408 )
      ( MAKE-ON ?auto_7405 ?auto_7406 )
      ( MAKE-ON-VERIFY ?auto_7405 ?auto_7406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7414 - SURFACE
      ?auto_7415 - SURFACE
    )
    :vars
    (
      ?auto_7422 - HOIST
      ?auto_7421 - PLACE
      ?auto_7418 - PLACE
      ?auto_7420 - HOIST
      ?auto_7416 - SURFACE
      ?auto_7419 - TRUCK
      ?auto_7417 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7422 ?auto_7421 ) ( IS-CRATE ?auto_7414 ) ( not ( = ?auto_7414 ?auto_7415 ) ) ( not ( = ?auto_7418 ?auto_7421 ) ) ( HOIST-AT ?auto_7420 ?auto_7418 ) ( not ( = ?auto_7422 ?auto_7420 ) ) ( AVAILABLE ?auto_7420 ) ( SURFACE-AT ?auto_7414 ?auto_7418 ) ( ON ?auto_7414 ?auto_7416 ) ( CLEAR ?auto_7414 ) ( not ( = ?auto_7414 ?auto_7416 ) ) ( not ( = ?auto_7415 ?auto_7416 ) ) ( TRUCK-AT ?auto_7419 ?auto_7421 ) ( SURFACE-AT ?auto_7417 ?auto_7421 ) ( CLEAR ?auto_7417 ) ( IS-CRATE ?auto_7415 ) ( not ( = ?auto_7414 ?auto_7417 ) ) ( not ( = ?auto_7415 ?auto_7417 ) ) ( not ( = ?auto_7416 ?auto_7417 ) ) ( AVAILABLE ?auto_7422 ) ( IN ?auto_7415 ?auto_7419 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7422 ?auto_7415 ?auto_7419 ?auto_7421 )
      ( MAKE-ON ?auto_7414 ?auto_7415 )
      ( MAKE-ON-VERIFY ?auto_7414 ?auto_7415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7423 - SURFACE
      ?auto_7424 - SURFACE
    )
    :vars
    (
      ?auto_7428 - HOIST
      ?auto_7430 - PLACE
      ?auto_7427 - PLACE
      ?auto_7426 - HOIST
      ?auto_7431 - SURFACE
      ?auto_7425 - SURFACE
      ?auto_7429 - TRUCK
      ?auto_7432 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7428 ?auto_7430 ) ( IS-CRATE ?auto_7423 ) ( not ( = ?auto_7423 ?auto_7424 ) ) ( not ( = ?auto_7427 ?auto_7430 ) ) ( HOIST-AT ?auto_7426 ?auto_7427 ) ( not ( = ?auto_7428 ?auto_7426 ) ) ( AVAILABLE ?auto_7426 ) ( SURFACE-AT ?auto_7423 ?auto_7427 ) ( ON ?auto_7423 ?auto_7431 ) ( CLEAR ?auto_7423 ) ( not ( = ?auto_7423 ?auto_7431 ) ) ( not ( = ?auto_7424 ?auto_7431 ) ) ( SURFACE-AT ?auto_7425 ?auto_7430 ) ( CLEAR ?auto_7425 ) ( IS-CRATE ?auto_7424 ) ( not ( = ?auto_7423 ?auto_7425 ) ) ( not ( = ?auto_7424 ?auto_7425 ) ) ( not ( = ?auto_7431 ?auto_7425 ) ) ( AVAILABLE ?auto_7428 ) ( IN ?auto_7424 ?auto_7429 ) ( TRUCK-AT ?auto_7429 ?auto_7432 ) ( not ( = ?auto_7432 ?auto_7430 ) ) ( not ( = ?auto_7427 ?auto_7432 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7429 ?auto_7432 ?auto_7430 )
      ( MAKE-ON ?auto_7423 ?auto_7424 )
      ( MAKE-ON-VERIFY ?auto_7423 ?auto_7424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7433 - SURFACE
      ?auto_7434 - SURFACE
    )
    :vars
    (
      ?auto_7440 - HOIST
      ?auto_7442 - PLACE
      ?auto_7436 - PLACE
      ?auto_7439 - HOIST
      ?auto_7435 - SURFACE
      ?auto_7437 - SURFACE
      ?auto_7438 - TRUCK
      ?auto_7441 - PLACE
      ?auto_7443 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7440 ?auto_7442 ) ( IS-CRATE ?auto_7433 ) ( not ( = ?auto_7433 ?auto_7434 ) ) ( not ( = ?auto_7436 ?auto_7442 ) ) ( HOIST-AT ?auto_7439 ?auto_7436 ) ( not ( = ?auto_7440 ?auto_7439 ) ) ( AVAILABLE ?auto_7439 ) ( SURFACE-AT ?auto_7433 ?auto_7436 ) ( ON ?auto_7433 ?auto_7435 ) ( CLEAR ?auto_7433 ) ( not ( = ?auto_7433 ?auto_7435 ) ) ( not ( = ?auto_7434 ?auto_7435 ) ) ( SURFACE-AT ?auto_7437 ?auto_7442 ) ( CLEAR ?auto_7437 ) ( IS-CRATE ?auto_7434 ) ( not ( = ?auto_7433 ?auto_7437 ) ) ( not ( = ?auto_7434 ?auto_7437 ) ) ( not ( = ?auto_7435 ?auto_7437 ) ) ( AVAILABLE ?auto_7440 ) ( TRUCK-AT ?auto_7438 ?auto_7441 ) ( not ( = ?auto_7441 ?auto_7442 ) ) ( not ( = ?auto_7436 ?auto_7441 ) ) ( HOIST-AT ?auto_7443 ?auto_7441 ) ( LIFTING ?auto_7443 ?auto_7434 ) ( not ( = ?auto_7440 ?auto_7443 ) ) ( not ( = ?auto_7439 ?auto_7443 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7443 ?auto_7434 ?auto_7438 ?auto_7441 )
      ( MAKE-ON ?auto_7433 ?auto_7434 )
      ( MAKE-ON-VERIFY ?auto_7433 ?auto_7434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7444 - SURFACE
      ?auto_7445 - SURFACE
    )
    :vars
    (
      ?auto_7454 - HOIST
      ?auto_7447 - PLACE
      ?auto_7451 - PLACE
      ?auto_7452 - HOIST
      ?auto_7453 - SURFACE
      ?auto_7446 - SURFACE
      ?auto_7448 - TRUCK
      ?auto_7450 - PLACE
      ?auto_7449 - HOIST
      ?auto_7455 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7454 ?auto_7447 ) ( IS-CRATE ?auto_7444 ) ( not ( = ?auto_7444 ?auto_7445 ) ) ( not ( = ?auto_7451 ?auto_7447 ) ) ( HOIST-AT ?auto_7452 ?auto_7451 ) ( not ( = ?auto_7454 ?auto_7452 ) ) ( AVAILABLE ?auto_7452 ) ( SURFACE-AT ?auto_7444 ?auto_7451 ) ( ON ?auto_7444 ?auto_7453 ) ( CLEAR ?auto_7444 ) ( not ( = ?auto_7444 ?auto_7453 ) ) ( not ( = ?auto_7445 ?auto_7453 ) ) ( SURFACE-AT ?auto_7446 ?auto_7447 ) ( CLEAR ?auto_7446 ) ( IS-CRATE ?auto_7445 ) ( not ( = ?auto_7444 ?auto_7446 ) ) ( not ( = ?auto_7445 ?auto_7446 ) ) ( not ( = ?auto_7453 ?auto_7446 ) ) ( AVAILABLE ?auto_7454 ) ( TRUCK-AT ?auto_7448 ?auto_7450 ) ( not ( = ?auto_7450 ?auto_7447 ) ) ( not ( = ?auto_7451 ?auto_7450 ) ) ( HOIST-AT ?auto_7449 ?auto_7450 ) ( not ( = ?auto_7454 ?auto_7449 ) ) ( not ( = ?auto_7452 ?auto_7449 ) ) ( AVAILABLE ?auto_7449 ) ( SURFACE-AT ?auto_7445 ?auto_7450 ) ( ON ?auto_7445 ?auto_7455 ) ( CLEAR ?auto_7445 ) ( not ( = ?auto_7444 ?auto_7455 ) ) ( not ( = ?auto_7445 ?auto_7455 ) ) ( not ( = ?auto_7453 ?auto_7455 ) ) ( not ( = ?auto_7446 ?auto_7455 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7449 ?auto_7445 ?auto_7455 ?auto_7450 )
      ( MAKE-ON ?auto_7444 ?auto_7445 )
      ( MAKE-ON-VERIFY ?auto_7444 ?auto_7445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7456 - SURFACE
      ?auto_7457 - SURFACE
    )
    :vars
    (
      ?auto_7458 - HOIST
      ?auto_7463 - PLACE
      ?auto_7464 - PLACE
      ?auto_7459 - HOIST
      ?auto_7466 - SURFACE
      ?auto_7462 - SURFACE
      ?auto_7460 - PLACE
      ?auto_7467 - HOIST
      ?auto_7465 - SURFACE
      ?auto_7461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7458 ?auto_7463 ) ( IS-CRATE ?auto_7456 ) ( not ( = ?auto_7456 ?auto_7457 ) ) ( not ( = ?auto_7464 ?auto_7463 ) ) ( HOIST-AT ?auto_7459 ?auto_7464 ) ( not ( = ?auto_7458 ?auto_7459 ) ) ( AVAILABLE ?auto_7459 ) ( SURFACE-AT ?auto_7456 ?auto_7464 ) ( ON ?auto_7456 ?auto_7466 ) ( CLEAR ?auto_7456 ) ( not ( = ?auto_7456 ?auto_7466 ) ) ( not ( = ?auto_7457 ?auto_7466 ) ) ( SURFACE-AT ?auto_7462 ?auto_7463 ) ( CLEAR ?auto_7462 ) ( IS-CRATE ?auto_7457 ) ( not ( = ?auto_7456 ?auto_7462 ) ) ( not ( = ?auto_7457 ?auto_7462 ) ) ( not ( = ?auto_7466 ?auto_7462 ) ) ( AVAILABLE ?auto_7458 ) ( not ( = ?auto_7460 ?auto_7463 ) ) ( not ( = ?auto_7464 ?auto_7460 ) ) ( HOIST-AT ?auto_7467 ?auto_7460 ) ( not ( = ?auto_7458 ?auto_7467 ) ) ( not ( = ?auto_7459 ?auto_7467 ) ) ( AVAILABLE ?auto_7467 ) ( SURFACE-AT ?auto_7457 ?auto_7460 ) ( ON ?auto_7457 ?auto_7465 ) ( CLEAR ?auto_7457 ) ( not ( = ?auto_7456 ?auto_7465 ) ) ( not ( = ?auto_7457 ?auto_7465 ) ) ( not ( = ?auto_7466 ?auto_7465 ) ) ( not ( = ?auto_7462 ?auto_7465 ) ) ( TRUCK-AT ?auto_7461 ?auto_7463 ) )
    :subtasks
    ( ( !DRIVE ?auto_7461 ?auto_7463 ?auto_7460 )
      ( MAKE-ON ?auto_7456 ?auto_7457 )
      ( MAKE-ON-VERIFY ?auto_7456 ?auto_7457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7470 - SURFACE
      ?auto_7471 - SURFACE
    )
    :vars
    (
      ?auto_7472 - HOIST
      ?auto_7473 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7472 ?auto_7473 ) ( SURFACE-AT ?auto_7471 ?auto_7473 ) ( CLEAR ?auto_7471 ) ( LIFTING ?auto_7472 ?auto_7470 ) ( IS-CRATE ?auto_7470 ) ( not ( = ?auto_7470 ?auto_7471 ) ) )
    :subtasks
    ( ( !DROP ?auto_7472 ?auto_7470 ?auto_7471 ?auto_7473 )
      ( MAKE-ON-VERIFY ?auto_7470 ?auto_7471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7474 - SURFACE
      ?auto_7475 - SURFACE
    )
    :vars
    (
      ?auto_7477 - HOIST
      ?auto_7476 - PLACE
      ?auto_7478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7477 ?auto_7476 ) ( SURFACE-AT ?auto_7475 ?auto_7476 ) ( CLEAR ?auto_7475 ) ( IS-CRATE ?auto_7474 ) ( not ( = ?auto_7474 ?auto_7475 ) ) ( TRUCK-AT ?auto_7478 ?auto_7476 ) ( AVAILABLE ?auto_7477 ) ( IN ?auto_7474 ?auto_7478 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7477 ?auto_7474 ?auto_7478 ?auto_7476 )
      ( MAKE-ON ?auto_7474 ?auto_7475 )
      ( MAKE-ON-VERIFY ?auto_7474 ?auto_7475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7479 - SURFACE
      ?auto_7480 - SURFACE
    )
    :vars
    (
      ?auto_7483 - HOIST
      ?auto_7481 - PLACE
      ?auto_7482 - TRUCK
      ?auto_7484 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7483 ?auto_7481 ) ( SURFACE-AT ?auto_7480 ?auto_7481 ) ( CLEAR ?auto_7480 ) ( IS-CRATE ?auto_7479 ) ( not ( = ?auto_7479 ?auto_7480 ) ) ( AVAILABLE ?auto_7483 ) ( IN ?auto_7479 ?auto_7482 ) ( TRUCK-AT ?auto_7482 ?auto_7484 ) ( not ( = ?auto_7484 ?auto_7481 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7482 ?auto_7484 ?auto_7481 )
      ( MAKE-ON ?auto_7479 ?auto_7480 )
      ( MAKE-ON-VERIFY ?auto_7479 ?auto_7480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7485 - SURFACE
      ?auto_7486 - SURFACE
    )
    :vars
    (
      ?auto_7488 - HOIST
      ?auto_7490 - PLACE
      ?auto_7489 - TRUCK
      ?auto_7487 - PLACE
      ?auto_7491 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7488 ?auto_7490 ) ( SURFACE-AT ?auto_7486 ?auto_7490 ) ( CLEAR ?auto_7486 ) ( IS-CRATE ?auto_7485 ) ( not ( = ?auto_7485 ?auto_7486 ) ) ( AVAILABLE ?auto_7488 ) ( TRUCK-AT ?auto_7489 ?auto_7487 ) ( not ( = ?auto_7487 ?auto_7490 ) ) ( HOIST-AT ?auto_7491 ?auto_7487 ) ( LIFTING ?auto_7491 ?auto_7485 ) ( not ( = ?auto_7488 ?auto_7491 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7491 ?auto_7485 ?auto_7489 ?auto_7487 )
      ( MAKE-ON ?auto_7485 ?auto_7486 )
      ( MAKE-ON-VERIFY ?auto_7485 ?auto_7486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7492 - SURFACE
      ?auto_7493 - SURFACE
    )
    :vars
    (
      ?auto_7494 - HOIST
      ?auto_7498 - PLACE
      ?auto_7497 - TRUCK
      ?auto_7495 - PLACE
      ?auto_7496 - HOIST
      ?auto_7499 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7494 ?auto_7498 ) ( SURFACE-AT ?auto_7493 ?auto_7498 ) ( CLEAR ?auto_7493 ) ( IS-CRATE ?auto_7492 ) ( not ( = ?auto_7492 ?auto_7493 ) ) ( AVAILABLE ?auto_7494 ) ( TRUCK-AT ?auto_7497 ?auto_7495 ) ( not ( = ?auto_7495 ?auto_7498 ) ) ( HOIST-AT ?auto_7496 ?auto_7495 ) ( not ( = ?auto_7494 ?auto_7496 ) ) ( AVAILABLE ?auto_7496 ) ( SURFACE-AT ?auto_7492 ?auto_7495 ) ( ON ?auto_7492 ?auto_7499 ) ( CLEAR ?auto_7492 ) ( not ( = ?auto_7492 ?auto_7499 ) ) ( not ( = ?auto_7493 ?auto_7499 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7496 ?auto_7492 ?auto_7499 ?auto_7495 )
      ( MAKE-ON ?auto_7492 ?auto_7493 )
      ( MAKE-ON-VERIFY ?auto_7492 ?auto_7493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7500 - SURFACE
      ?auto_7501 - SURFACE
    )
    :vars
    (
      ?auto_7505 - HOIST
      ?auto_7504 - PLACE
      ?auto_7503 - PLACE
      ?auto_7502 - HOIST
      ?auto_7507 - SURFACE
      ?auto_7506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7505 ?auto_7504 ) ( SURFACE-AT ?auto_7501 ?auto_7504 ) ( CLEAR ?auto_7501 ) ( IS-CRATE ?auto_7500 ) ( not ( = ?auto_7500 ?auto_7501 ) ) ( AVAILABLE ?auto_7505 ) ( not ( = ?auto_7503 ?auto_7504 ) ) ( HOIST-AT ?auto_7502 ?auto_7503 ) ( not ( = ?auto_7505 ?auto_7502 ) ) ( AVAILABLE ?auto_7502 ) ( SURFACE-AT ?auto_7500 ?auto_7503 ) ( ON ?auto_7500 ?auto_7507 ) ( CLEAR ?auto_7500 ) ( not ( = ?auto_7500 ?auto_7507 ) ) ( not ( = ?auto_7501 ?auto_7507 ) ) ( TRUCK-AT ?auto_7506 ?auto_7504 ) )
    :subtasks
    ( ( !DRIVE ?auto_7506 ?auto_7504 ?auto_7503 )
      ( MAKE-ON ?auto_7500 ?auto_7501 )
      ( MAKE-ON-VERIFY ?auto_7500 ?auto_7501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7508 - SURFACE
      ?auto_7509 - SURFACE
    )
    :vars
    (
      ?auto_7512 - HOIST
      ?auto_7511 - PLACE
      ?auto_7515 - PLACE
      ?auto_7510 - HOIST
      ?auto_7513 - SURFACE
      ?auto_7514 - TRUCK
      ?auto_7516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7512 ?auto_7511 ) ( IS-CRATE ?auto_7508 ) ( not ( = ?auto_7508 ?auto_7509 ) ) ( not ( = ?auto_7515 ?auto_7511 ) ) ( HOIST-AT ?auto_7510 ?auto_7515 ) ( not ( = ?auto_7512 ?auto_7510 ) ) ( AVAILABLE ?auto_7510 ) ( SURFACE-AT ?auto_7508 ?auto_7515 ) ( ON ?auto_7508 ?auto_7513 ) ( CLEAR ?auto_7508 ) ( not ( = ?auto_7508 ?auto_7513 ) ) ( not ( = ?auto_7509 ?auto_7513 ) ) ( TRUCK-AT ?auto_7514 ?auto_7511 ) ( SURFACE-AT ?auto_7516 ?auto_7511 ) ( CLEAR ?auto_7516 ) ( LIFTING ?auto_7512 ?auto_7509 ) ( IS-CRATE ?auto_7509 ) ( not ( = ?auto_7508 ?auto_7516 ) ) ( not ( = ?auto_7509 ?auto_7516 ) ) ( not ( = ?auto_7513 ?auto_7516 ) ) )
    :subtasks
    ( ( !DROP ?auto_7512 ?auto_7509 ?auto_7516 ?auto_7511 )
      ( MAKE-ON ?auto_7508 ?auto_7509 )
      ( MAKE-ON-VERIFY ?auto_7508 ?auto_7509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7517 - SURFACE
      ?auto_7518 - SURFACE
    )
    :vars
    (
      ?auto_7522 - HOIST
      ?auto_7519 - PLACE
      ?auto_7523 - PLACE
      ?auto_7521 - HOIST
      ?auto_7524 - SURFACE
      ?auto_7525 - TRUCK
      ?auto_7520 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7522 ?auto_7519 ) ( IS-CRATE ?auto_7517 ) ( not ( = ?auto_7517 ?auto_7518 ) ) ( not ( = ?auto_7523 ?auto_7519 ) ) ( HOIST-AT ?auto_7521 ?auto_7523 ) ( not ( = ?auto_7522 ?auto_7521 ) ) ( AVAILABLE ?auto_7521 ) ( SURFACE-AT ?auto_7517 ?auto_7523 ) ( ON ?auto_7517 ?auto_7524 ) ( CLEAR ?auto_7517 ) ( not ( = ?auto_7517 ?auto_7524 ) ) ( not ( = ?auto_7518 ?auto_7524 ) ) ( TRUCK-AT ?auto_7525 ?auto_7519 ) ( SURFACE-AT ?auto_7520 ?auto_7519 ) ( CLEAR ?auto_7520 ) ( IS-CRATE ?auto_7518 ) ( not ( = ?auto_7517 ?auto_7520 ) ) ( not ( = ?auto_7518 ?auto_7520 ) ) ( not ( = ?auto_7524 ?auto_7520 ) ) ( AVAILABLE ?auto_7522 ) ( IN ?auto_7518 ?auto_7525 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7522 ?auto_7518 ?auto_7525 ?auto_7519 )
      ( MAKE-ON ?auto_7517 ?auto_7518 )
      ( MAKE-ON-VERIFY ?auto_7517 ?auto_7518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7526 - SURFACE
      ?auto_7527 - SURFACE
    )
    :vars
    (
      ?auto_7531 - HOIST
      ?auto_7532 - PLACE
      ?auto_7530 - PLACE
      ?auto_7534 - HOIST
      ?auto_7528 - SURFACE
      ?auto_7533 - SURFACE
      ?auto_7529 - TRUCK
      ?auto_7535 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7531 ?auto_7532 ) ( IS-CRATE ?auto_7526 ) ( not ( = ?auto_7526 ?auto_7527 ) ) ( not ( = ?auto_7530 ?auto_7532 ) ) ( HOIST-AT ?auto_7534 ?auto_7530 ) ( not ( = ?auto_7531 ?auto_7534 ) ) ( AVAILABLE ?auto_7534 ) ( SURFACE-AT ?auto_7526 ?auto_7530 ) ( ON ?auto_7526 ?auto_7528 ) ( CLEAR ?auto_7526 ) ( not ( = ?auto_7526 ?auto_7528 ) ) ( not ( = ?auto_7527 ?auto_7528 ) ) ( SURFACE-AT ?auto_7533 ?auto_7532 ) ( CLEAR ?auto_7533 ) ( IS-CRATE ?auto_7527 ) ( not ( = ?auto_7526 ?auto_7533 ) ) ( not ( = ?auto_7527 ?auto_7533 ) ) ( not ( = ?auto_7528 ?auto_7533 ) ) ( AVAILABLE ?auto_7531 ) ( IN ?auto_7527 ?auto_7529 ) ( TRUCK-AT ?auto_7529 ?auto_7535 ) ( not ( = ?auto_7535 ?auto_7532 ) ) ( not ( = ?auto_7530 ?auto_7535 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7529 ?auto_7535 ?auto_7532 )
      ( MAKE-ON ?auto_7526 ?auto_7527 )
      ( MAKE-ON-VERIFY ?auto_7526 ?auto_7527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7536 - SURFACE
      ?auto_7537 - SURFACE
    )
    :vars
    (
      ?auto_7544 - HOIST
      ?auto_7540 - PLACE
      ?auto_7543 - PLACE
      ?auto_7541 - HOIST
      ?auto_7545 - SURFACE
      ?auto_7539 - SURFACE
      ?auto_7542 - TRUCK
      ?auto_7538 - PLACE
      ?auto_7546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7544 ?auto_7540 ) ( IS-CRATE ?auto_7536 ) ( not ( = ?auto_7536 ?auto_7537 ) ) ( not ( = ?auto_7543 ?auto_7540 ) ) ( HOIST-AT ?auto_7541 ?auto_7543 ) ( not ( = ?auto_7544 ?auto_7541 ) ) ( AVAILABLE ?auto_7541 ) ( SURFACE-AT ?auto_7536 ?auto_7543 ) ( ON ?auto_7536 ?auto_7545 ) ( CLEAR ?auto_7536 ) ( not ( = ?auto_7536 ?auto_7545 ) ) ( not ( = ?auto_7537 ?auto_7545 ) ) ( SURFACE-AT ?auto_7539 ?auto_7540 ) ( CLEAR ?auto_7539 ) ( IS-CRATE ?auto_7537 ) ( not ( = ?auto_7536 ?auto_7539 ) ) ( not ( = ?auto_7537 ?auto_7539 ) ) ( not ( = ?auto_7545 ?auto_7539 ) ) ( AVAILABLE ?auto_7544 ) ( TRUCK-AT ?auto_7542 ?auto_7538 ) ( not ( = ?auto_7538 ?auto_7540 ) ) ( not ( = ?auto_7543 ?auto_7538 ) ) ( HOIST-AT ?auto_7546 ?auto_7538 ) ( LIFTING ?auto_7546 ?auto_7537 ) ( not ( = ?auto_7544 ?auto_7546 ) ) ( not ( = ?auto_7541 ?auto_7546 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7546 ?auto_7537 ?auto_7542 ?auto_7538 )
      ( MAKE-ON ?auto_7536 ?auto_7537 )
      ( MAKE-ON-VERIFY ?auto_7536 ?auto_7537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7547 - SURFACE
      ?auto_7548 - SURFACE
    )
    :vars
    (
      ?auto_7552 - HOIST
      ?auto_7555 - PLACE
      ?auto_7553 - PLACE
      ?auto_7550 - HOIST
      ?auto_7557 - SURFACE
      ?auto_7549 - SURFACE
      ?auto_7551 - TRUCK
      ?auto_7554 - PLACE
      ?auto_7556 - HOIST
      ?auto_7558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7552 ?auto_7555 ) ( IS-CRATE ?auto_7547 ) ( not ( = ?auto_7547 ?auto_7548 ) ) ( not ( = ?auto_7553 ?auto_7555 ) ) ( HOIST-AT ?auto_7550 ?auto_7553 ) ( not ( = ?auto_7552 ?auto_7550 ) ) ( AVAILABLE ?auto_7550 ) ( SURFACE-AT ?auto_7547 ?auto_7553 ) ( ON ?auto_7547 ?auto_7557 ) ( CLEAR ?auto_7547 ) ( not ( = ?auto_7547 ?auto_7557 ) ) ( not ( = ?auto_7548 ?auto_7557 ) ) ( SURFACE-AT ?auto_7549 ?auto_7555 ) ( CLEAR ?auto_7549 ) ( IS-CRATE ?auto_7548 ) ( not ( = ?auto_7547 ?auto_7549 ) ) ( not ( = ?auto_7548 ?auto_7549 ) ) ( not ( = ?auto_7557 ?auto_7549 ) ) ( AVAILABLE ?auto_7552 ) ( TRUCK-AT ?auto_7551 ?auto_7554 ) ( not ( = ?auto_7554 ?auto_7555 ) ) ( not ( = ?auto_7553 ?auto_7554 ) ) ( HOIST-AT ?auto_7556 ?auto_7554 ) ( not ( = ?auto_7552 ?auto_7556 ) ) ( not ( = ?auto_7550 ?auto_7556 ) ) ( AVAILABLE ?auto_7556 ) ( SURFACE-AT ?auto_7548 ?auto_7554 ) ( ON ?auto_7548 ?auto_7558 ) ( CLEAR ?auto_7548 ) ( not ( = ?auto_7547 ?auto_7558 ) ) ( not ( = ?auto_7548 ?auto_7558 ) ) ( not ( = ?auto_7557 ?auto_7558 ) ) ( not ( = ?auto_7549 ?auto_7558 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7556 ?auto_7548 ?auto_7558 ?auto_7554 )
      ( MAKE-ON ?auto_7547 ?auto_7548 )
      ( MAKE-ON-VERIFY ?auto_7547 ?auto_7548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7559 - SURFACE
      ?auto_7560 - SURFACE
    )
    :vars
    (
      ?auto_7561 - HOIST
      ?auto_7564 - PLACE
      ?auto_7562 - PLACE
      ?auto_7565 - HOIST
      ?auto_7563 - SURFACE
      ?auto_7568 - SURFACE
      ?auto_7569 - PLACE
      ?auto_7567 - HOIST
      ?auto_7570 - SURFACE
      ?auto_7566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7561 ?auto_7564 ) ( IS-CRATE ?auto_7559 ) ( not ( = ?auto_7559 ?auto_7560 ) ) ( not ( = ?auto_7562 ?auto_7564 ) ) ( HOIST-AT ?auto_7565 ?auto_7562 ) ( not ( = ?auto_7561 ?auto_7565 ) ) ( AVAILABLE ?auto_7565 ) ( SURFACE-AT ?auto_7559 ?auto_7562 ) ( ON ?auto_7559 ?auto_7563 ) ( CLEAR ?auto_7559 ) ( not ( = ?auto_7559 ?auto_7563 ) ) ( not ( = ?auto_7560 ?auto_7563 ) ) ( SURFACE-AT ?auto_7568 ?auto_7564 ) ( CLEAR ?auto_7568 ) ( IS-CRATE ?auto_7560 ) ( not ( = ?auto_7559 ?auto_7568 ) ) ( not ( = ?auto_7560 ?auto_7568 ) ) ( not ( = ?auto_7563 ?auto_7568 ) ) ( AVAILABLE ?auto_7561 ) ( not ( = ?auto_7569 ?auto_7564 ) ) ( not ( = ?auto_7562 ?auto_7569 ) ) ( HOIST-AT ?auto_7567 ?auto_7569 ) ( not ( = ?auto_7561 ?auto_7567 ) ) ( not ( = ?auto_7565 ?auto_7567 ) ) ( AVAILABLE ?auto_7567 ) ( SURFACE-AT ?auto_7560 ?auto_7569 ) ( ON ?auto_7560 ?auto_7570 ) ( CLEAR ?auto_7560 ) ( not ( = ?auto_7559 ?auto_7570 ) ) ( not ( = ?auto_7560 ?auto_7570 ) ) ( not ( = ?auto_7563 ?auto_7570 ) ) ( not ( = ?auto_7568 ?auto_7570 ) ) ( TRUCK-AT ?auto_7566 ?auto_7564 ) )
    :subtasks
    ( ( !DRIVE ?auto_7566 ?auto_7564 ?auto_7569 )
      ( MAKE-ON ?auto_7559 ?auto_7560 )
      ( MAKE-ON-VERIFY ?auto_7559 ?auto_7560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7571 - SURFACE
      ?auto_7572 - SURFACE
    )
    :vars
    (
      ?auto_7580 - HOIST
      ?auto_7574 - PLACE
      ?auto_7582 - PLACE
      ?auto_7575 - HOIST
      ?auto_7579 - SURFACE
      ?auto_7573 - SURFACE
      ?auto_7577 - PLACE
      ?auto_7581 - HOIST
      ?auto_7576 - SURFACE
      ?auto_7578 - TRUCK
      ?auto_7583 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7580 ?auto_7574 ) ( IS-CRATE ?auto_7571 ) ( not ( = ?auto_7571 ?auto_7572 ) ) ( not ( = ?auto_7582 ?auto_7574 ) ) ( HOIST-AT ?auto_7575 ?auto_7582 ) ( not ( = ?auto_7580 ?auto_7575 ) ) ( AVAILABLE ?auto_7575 ) ( SURFACE-AT ?auto_7571 ?auto_7582 ) ( ON ?auto_7571 ?auto_7579 ) ( CLEAR ?auto_7571 ) ( not ( = ?auto_7571 ?auto_7579 ) ) ( not ( = ?auto_7572 ?auto_7579 ) ) ( IS-CRATE ?auto_7572 ) ( not ( = ?auto_7571 ?auto_7573 ) ) ( not ( = ?auto_7572 ?auto_7573 ) ) ( not ( = ?auto_7579 ?auto_7573 ) ) ( not ( = ?auto_7577 ?auto_7574 ) ) ( not ( = ?auto_7582 ?auto_7577 ) ) ( HOIST-AT ?auto_7581 ?auto_7577 ) ( not ( = ?auto_7580 ?auto_7581 ) ) ( not ( = ?auto_7575 ?auto_7581 ) ) ( AVAILABLE ?auto_7581 ) ( SURFACE-AT ?auto_7572 ?auto_7577 ) ( ON ?auto_7572 ?auto_7576 ) ( CLEAR ?auto_7572 ) ( not ( = ?auto_7571 ?auto_7576 ) ) ( not ( = ?auto_7572 ?auto_7576 ) ) ( not ( = ?auto_7579 ?auto_7576 ) ) ( not ( = ?auto_7573 ?auto_7576 ) ) ( TRUCK-AT ?auto_7578 ?auto_7574 ) ( SURFACE-AT ?auto_7583 ?auto_7574 ) ( CLEAR ?auto_7583 ) ( LIFTING ?auto_7580 ?auto_7573 ) ( IS-CRATE ?auto_7573 ) ( not ( = ?auto_7571 ?auto_7583 ) ) ( not ( = ?auto_7572 ?auto_7583 ) ) ( not ( = ?auto_7579 ?auto_7583 ) ) ( not ( = ?auto_7573 ?auto_7583 ) ) ( not ( = ?auto_7576 ?auto_7583 ) ) )
    :subtasks
    ( ( !DROP ?auto_7580 ?auto_7573 ?auto_7583 ?auto_7574 )
      ( MAKE-ON ?auto_7571 ?auto_7572 )
      ( MAKE-ON-VERIFY ?auto_7571 ?auto_7572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7584 - SURFACE
      ?auto_7585 - SURFACE
    )
    :vars
    (
      ?auto_7586 - HOIST
      ?auto_7589 - PLACE
      ?auto_7596 - PLACE
      ?auto_7590 - HOIST
      ?auto_7594 - SURFACE
      ?auto_7593 - SURFACE
      ?auto_7587 - PLACE
      ?auto_7595 - HOIST
      ?auto_7588 - SURFACE
      ?auto_7592 - TRUCK
      ?auto_7591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7586 ?auto_7589 ) ( IS-CRATE ?auto_7584 ) ( not ( = ?auto_7584 ?auto_7585 ) ) ( not ( = ?auto_7596 ?auto_7589 ) ) ( HOIST-AT ?auto_7590 ?auto_7596 ) ( not ( = ?auto_7586 ?auto_7590 ) ) ( AVAILABLE ?auto_7590 ) ( SURFACE-AT ?auto_7584 ?auto_7596 ) ( ON ?auto_7584 ?auto_7594 ) ( CLEAR ?auto_7584 ) ( not ( = ?auto_7584 ?auto_7594 ) ) ( not ( = ?auto_7585 ?auto_7594 ) ) ( IS-CRATE ?auto_7585 ) ( not ( = ?auto_7584 ?auto_7593 ) ) ( not ( = ?auto_7585 ?auto_7593 ) ) ( not ( = ?auto_7594 ?auto_7593 ) ) ( not ( = ?auto_7587 ?auto_7589 ) ) ( not ( = ?auto_7596 ?auto_7587 ) ) ( HOIST-AT ?auto_7595 ?auto_7587 ) ( not ( = ?auto_7586 ?auto_7595 ) ) ( not ( = ?auto_7590 ?auto_7595 ) ) ( AVAILABLE ?auto_7595 ) ( SURFACE-AT ?auto_7585 ?auto_7587 ) ( ON ?auto_7585 ?auto_7588 ) ( CLEAR ?auto_7585 ) ( not ( = ?auto_7584 ?auto_7588 ) ) ( not ( = ?auto_7585 ?auto_7588 ) ) ( not ( = ?auto_7594 ?auto_7588 ) ) ( not ( = ?auto_7593 ?auto_7588 ) ) ( TRUCK-AT ?auto_7592 ?auto_7589 ) ( SURFACE-AT ?auto_7591 ?auto_7589 ) ( CLEAR ?auto_7591 ) ( IS-CRATE ?auto_7593 ) ( not ( = ?auto_7584 ?auto_7591 ) ) ( not ( = ?auto_7585 ?auto_7591 ) ) ( not ( = ?auto_7594 ?auto_7591 ) ) ( not ( = ?auto_7593 ?auto_7591 ) ) ( not ( = ?auto_7588 ?auto_7591 ) ) ( AVAILABLE ?auto_7586 ) ( IN ?auto_7593 ?auto_7592 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7586 ?auto_7593 ?auto_7592 ?auto_7589 )
      ( MAKE-ON ?auto_7584 ?auto_7585 )
      ( MAKE-ON-VERIFY ?auto_7584 ?auto_7585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7597 - SURFACE
      ?auto_7598 - SURFACE
    )
    :vars
    (
      ?auto_7599 - HOIST
      ?auto_7602 - PLACE
      ?auto_7601 - PLACE
      ?auto_7607 - HOIST
      ?auto_7606 - SURFACE
      ?auto_7603 - SURFACE
      ?auto_7605 - PLACE
      ?auto_7609 - HOIST
      ?auto_7600 - SURFACE
      ?auto_7608 - SURFACE
      ?auto_7604 - TRUCK
      ?auto_7610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7599 ?auto_7602 ) ( IS-CRATE ?auto_7597 ) ( not ( = ?auto_7597 ?auto_7598 ) ) ( not ( = ?auto_7601 ?auto_7602 ) ) ( HOIST-AT ?auto_7607 ?auto_7601 ) ( not ( = ?auto_7599 ?auto_7607 ) ) ( AVAILABLE ?auto_7607 ) ( SURFACE-AT ?auto_7597 ?auto_7601 ) ( ON ?auto_7597 ?auto_7606 ) ( CLEAR ?auto_7597 ) ( not ( = ?auto_7597 ?auto_7606 ) ) ( not ( = ?auto_7598 ?auto_7606 ) ) ( IS-CRATE ?auto_7598 ) ( not ( = ?auto_7597 ?auto_7603 ) ) ( not ( = ?auto_7598 ?auto_7603 ) ) ( not ( = ?auto_7606 ?auto_7603 ) ) ( not ( = ?auto_7605 ?auto_7602 ) ) ( not ( = ?auto_7601 ?auto_7605 ) ) ( HOIST-AT ?auto_7609 ?auto_7605 ) ( not ( = ?auto_7599 ?auto_7609 ) ) ( not ( = ?auto_7607 ?auto_7609 ) ) ( AVAILABLE ?auto_7609 ) ( SURFACE-AT ?auto_7598 ?auto_7605 ) ( ON ?auto_7598 ?auto_7600 ) ( CLEAR ?auto_7598 ) ( not ( = ?auto_7597 ?auto_7600 ) ) ( not ( = ?auto_7598 ?auto_7600 ) ) ( not ( = ?auto_7606 ?auto_7600 ) ) ( not ( = ?auto_7603 ?auto_7600 ) ) ( SURFACE-AT ?auto_7608 ?auto_7602 ) ( CLEAR ?auto_7608 ) ( IS-CRATE ?auto_7603 ) ( not ( = ?auto_7597 ?auto_7608 ) ) ( not ( = ?auto_7598 ?auto_7608 ) ) ( not ( = ?auto_7606 ?auto_7608 ) ) ( not ( = ?auto_7603 ?auto_7608 ) ) ( not ( = ?auto_7600 ?auto_7608 ) ) ( AVAILABLE ?auto_7599 ) ( IN ?auto_7603 ?auto_7604 ) ( TRUCK-AT ?auto_7604 ?auto_7610 ) ( not ( = ?auto_7610 ?auto_7602 ) ) ( not ( = ?auto_7601 ?auto_7610 ) ) ( not ( = ?auto_7605 ?auto_7610 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7604 ?auto_7610 ?auto_7602 )
      ( MAKE-ON ?auto_7597 ?auto_7598 )
      ( MAKE-ON-VERIFY ?auto_7597 ?auto_7598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7611 - SURFACE
      ?auto_7612 - SURFACE
    )
    :vars
    (
      ?auto_7614 - HOIST
      ?auto_7616 - PLACE
      ?auto_7621 - PLACE
      ?auto_7618 - HOIST
      ?auto_7623 - SURFACE
      ?auto_7617 - SURFACE
      ?auto_7620 - PLACE
      ?auto_7615 - HOIST
      ?auto_7613 - SURFACE
      ?auto_7624 - SURFACE
      ?auto_7622 - TRUCK
      ?auto_7619 - PLACE
      ?auto_7625 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7614 ?auto_7616 ) ( IS-CRATE ?auto_7611 ) ( not ( = ?auto_7611 ?auto_7612 ) ) ( not ( = ?auto_7621 ?auto_7616 ) ) ( HOIST-AT ?auto_7618 ?auto_7621 ) ( not ( = ?auto_7614 ?auto_7618 ) ) ( AVAILABLE ?auto_7618 ) ( SURFACE-AT ?auto_7611 ?auto_7621 ) ( ON ?auto_7611 ?auto_7623 ) ( CLEAR ?auto_7611 ) ( not ( = ?auto_7611 ?auto_7623 ) ) ( not ( = ?auto_7612 ?auto_7623 ) ) ( IS-CRATE ?auto_7612 ) ( not ( = ?auto_7611 ?auto_7617 ) ) ( not ( = ?auto_7612 ?auto_7617 ) ) ( not ( = ?auto_7623 ?auto_7617 ) ) ( not ( = ?auto_7620 ?auto_7616 ) ) ( not ( = ?auto_7621 ?auto_7620 ) ) ( HOIST-AT ?auto_7615 ?auto_7620 ) ( not ( = ?auto_7614 ?auto_7615 ) ) ( not ( = ?auto_7618 ?auto_7615 ) ) ( AVAILABLE ?auto_7615 ) ( SURFACE-AT ?auto_7612 ?auto_7620 ) ( ON ?auto_7612 ?auto_7613 ) ( CLEAR ?auto_7612 ) ( not ( = ?auto_7611 ?auto_7613 ) ) ( not ( = ?auto_7612 ?auto_7613 ) ) ( not ( = ?auto_7623 ?auto_7613 ) ) ( not ( = ?auto_7617 ?auto_7613 ) ) ( SURFACE-AT ?auto_7624 ?auto_7616 ) ( CLEAR ?auto_7624 ) ( IS-CRATE ?auto_7617 ) ( not ( = ?auto_7611 ?auto_7624 ) ) ( not ( = ?auto_7612 ?auto_7624 ) ) ( not ( = ?auto_7623 ?auto_7624 ) ) ( not ( = ?auto_7617 ?auto_7624 ) ) ( not ( = ?auto_7613 ?auto_7624 ) ) ( AVAILABLE ?auto_7614 ) ( TRUCK-AT ?auto_7622 ?auto_7619 ) ( not ( = ?auto_7619 ?auto_7616 ) ) ( not ( = ?auto_7621 ?auto_7619 ) ) ( not ( = ?auto_7620 ?auto_7619 ) ) ( HOIST-AT ?auto_7625 ?auto_7619 ) ( LIFTING ?auto_7625 ?auto_7617 ) ( not ( = ?auto_7614 ?auto_7625 ) ) ( not ( = ?auto_7618 ?auto_7625 ) ) ( not ( = ?auto_7615 ?auto_7625 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7625 ?auto_7617 ?auto_7622 ?auto_7619 )
      ( MAKE-ON ?auto_7611 ?auto_7612 )
      ( MAKE-ON-VERIFY ?auto_7611 ?auto_7612 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7626 - SURFACE
      ?auto_7627 - SURFACE
    )
    :vars
    (
      ?auto_7635 - HOIST
      ?auto_7634 - PLACE
      ?auto_7628 - PLACE
      ?auto_7636 - HOIST
      ?auto_7640 - SURFACE
      ?auto_7638 - SURFACE
      ?auto_7629 - PLACE
      ?auto_7631 - HOIST
      ?auto_7633 - SURFACE
      ?auto_7632 - SURFACE
      ?auto_7630 - TRUCK
      ?auto_7639 - PLACE
      ?auto_7637 - HOIST
      ?auto_7641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7635 ?auto_7634 ) ( IS-CRATE ?auto_7626 ) ( not ( = ?auto_7626 ?auto_7627 ) ) ( not ( = ?auto_7628 ?auto_7634 ) ) ( HOIST-AT ?auto_7636 ?auto_7628 ) ( not ( = ?auto_7635 ?auto_7636 ) ) ( AVAILABLE ?auto_7636 ) ( SURFACE-AT ?auto_7626 ?auto_7628 ) ( ON ?auto_7626 ?auto_7640 ) ( CLEAR ?auto_7626 ) ( not ( = ?auto_7626 ?auto_7640 ) ) ( not ( = ?auto_7627 ?auto_7640 ) ) ( IS-CRATE ?auto_7627 ) ( not ( = ?auto_7626 ?auto_7638 ) ) ( not ( = ?auto_7627 ?auto_7638 ) ) ( not ( = ?auto_7640 ?auto_7638 ) ) ( not ( = ?auto_7629 ?auto_7634 ) ) ( not ( = ?auto_7628 ?auto_7629 ) ) ( HOIST-AT ?auto_7631 ?auto_7629 ) ( not ( = ?auto_7635 ?auto_7631 ) ) ( not ( = ?auto_7636 ?auto_7631 ) ) ( AVAILABLE ?auto_7631 ) ( SURFACE-AT ?auto_7627 ?auto_7629 ) ( ON ?auto_7627 ?auto_7633 ) ( CLEAR ?auto_7627 ) ( not ( = ?auto_7626 ?auto_7633 ) ) ( not ( = ?auto_7627 ?auto_7633 ) ) ( not ( = ?auto_7640 ?auto_7633 ) ) ( not ( = ?auto_7638 ?auto_7633 ) ) ( SURFACE-AT ?auto_7632 ?auto_7634 ) ( CLEAR ?auto_7632 ) ( IS-CRATE ?auto_7638 ) ( not ( = ?auto_7626 ?auto_7632 ) ) ( not ( = ?auto_7627 ?auto_7632 ) ) ( not ( = ?auto_7640 ?auto_7632 ) ) ( not ( = ?auto_7638 ?auto_7632 ) ) ( not ( = ?auto_7633 ?auto_7632 ) ) ( AVAILABLE ?auto_7635 ) ( TRUCK-AT ?auto_7630 ?auto_7639 ) ( not ( = ?auto_7639 ?auto_7634 ) ) ( not ( = ?auto_7628 ?auto_7639 ) ) ( not ( = ?auto_7629 ?auto_7639 ) ) ( HOIST-AT ?auto_7637 ?auto_7639 ) ( not ( = ?auto_7635 ?auto_7637 ) ) ( not ( = ?auto_7636 ?auto_7637 ) ) ( not ( = ?auto_7631 ?auto_7637 ) ) ( AVAILABLE ?auto_7637 ) ( SURFACE-AT ?auto_7638 ?auto_7639 ) ( ON ?auto_7638 ?auto_7641 ) ( CLEAR ?auto_7638 ) ( not ( = ?auto_7626 ?auto_7641 ) ) ( not ( = ?auto_7627 ?auto_7641 ) ) ( not ( = ?auto_7640 ?auto_7641 ) ) ( not ( = ?auto_7638 ?auto_7641 ) ) ( not ( = ?auto_7633 ?auto_7641 ) ) ( not ( = ?auto_7632 ?auto_7641 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7637 ?auto_7638 ?auto_7641 ?auto_7639 )
      ( MAKE-ON ?auto_7626 ?auto_7627 )
      ( MAKE-ON-VERIFY ?auto_7626 ?auto_7627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7642 - SURFACE
      ?auto_7643 - SURFACE
    )
    :vars
    (
      ?auto_7648 - HOIST
      ?auto_7649 - PLACE
      ?auto_7656 - PLACE
      ?auto_7654 - HOIST
      ?auto_7647 - SURFACE
      ?auto_7655 - SURFACE
      ?auto_7645 - PLACE
      ?auto_7652 - HOIST
      ?auto_7644 - SURFACE
      ?auto_7657 - SURFACE
      ?auto_7646 - PLACE
      ?auto_7650 - HOIST
      ?auto_7653 - SURFACE
      ?auto_7651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7648 ?auto_7649 ) ( IS-CRATE ?auto_7642 ) ( not ( = ?auto_7642 ?auto_7643 ) ) ( not ( = ?auto_7656 ?auto_7649 ) ) ( HOIST-AT ?auto_7654 ?auto_7656 ) ( not ( = ?auto_7648 ?auto_7654 ) ) ( AVAILABLE ?auto_7654 ) ( SURFACE-AT ?auto_7642 ?auto_7656 ) ( ON ?auto_7642 ?auto_7647 ) ( CLEAR ?auto_7642 ) ( not ( = ?auto_7642 ?auto_7647 ) ) ( not ( = ?auto_7643 ?auto_7647 ) ) ( IS-CRATE ?auto_7643 ) ( not ( = ?auto_7642 ?auto_7655 ) ) ( not ( = ?auto_7643 ?auto_7655 ) ) ( not ( = ?auto_7647 ?auto_7655 ) ) ( not ( = ?auto_7645 ?auto_7649 ) ) ( not ( = ?auto_7656 ?auto_7645 ) ) ( HOIST-AT ?auto_7652 ?auto_7645 ) ( not ( = ?auto_7648 ?auto_7652 ) ) ( not ( = ?auto_7654 ?auto_7652 ) ) ( AVAILABLE ?auto_7652 ) ( SURFACE-AT ?auto_7643 ?auto_7645 ) ( ON ?auto_7643 ?auto_7644 ) ( CLEAR ?auto_7643 ) ( not ( = ?auto_7642 ?auto_7644 ) ) ( not ( = ?auto_7643 ?auto_7644 ) ) ( not ( = ?auto_7647 ?auto_7644 ) ) ( not ( = ?auto_7655 ?auto_7644 ) ) ( SURFACE-AT ?auto_7657 ?auto_7649 ) ( CLEAR ?auto_7657 ) ( IS-CRATE ?auto_7655 ) ( not ( = ?auto_7642 ?auto_7657 ) ) ( not ( = ?auto_7643 ?auto_7657 ) ) ( not ( = ?auto_7647 ?auto_7657 ) ) ( not ( = ?auto_7655 ?auto_7657 ) ) ( not ( = ?auto_7644 ?auto_7657 ) ) ( AVAILABLE ?auto_7648 ) ( not ( = ?auto_7646 ?auto_7649 ) ) ( not ( = ?auto_7656 ?auto_7646 ) ) ( not ( = ?auto_7645 ?auto_7646 ) ) ( HOIST-AT ?auto_7650 ?auto_7646 ) ( not ( = ?auto_7648 ?auto_7650 ) ) ( not ( = ?auto_7654 ?auto_7650 ) ) ( not ( = ?auto_7652 ?auto_7650 ) ) ( AVAILABLE ?auto_7650 ) ( SURFACE-AT ?auto_7655 ?auto_7646 ) ( ON ?auto_7655 ?auto_7653 ) ( CLEAR ?auto_7655 ) ( not ( = ?auto_7642 ?auto_7653 ) ) ( not ( = ?auto_7643 ?auto_7653 ) ) ( not ( = ?auto_7647 ?auto_7653 ) ) ( not ( = ?auto_7655 ?auto_7653 ) ) ( not ( = ?auto_7644 ?auto_7653 ) ) ( not ( = ?auto_7657 ?auto_7653 ) ) ( TRUCK-AT ?auto_7651 ?auto_7649 ) )
    :subtasks
    ( ( !DRIVE ?auto_7651 ?auto_7649 ?auto_7646 )
      ( MAKE-ON ?auto_7642 ?auto_7643 )
      ( MAKE-ON-VERIFY ?auto_7642 ?auto_7643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7660 - SURFACE
      ?auto_7661 - SURFACE
    )
    :vars
    (
      ?auto_7662 - HOIST
      ?auto_7663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7662 ?auto_7663 ) ( SURFACE-AT ?auto_7661 ?auto_7663 ) ( CLEAR ?auto_7661 ) ( LIFTING ?auto_7662 ?auto_7660 ) ( IS-CRATE ?auto_7660 ) ( not ( = ?auto_7660 ?auto_7661 ) ) )
    :subtasks
    ( ( !DROP ?auto_7662 ?auto_7660 ?auto_7661 ?auto_7663 )
      ( MAKE-ON-VERIFY ?auto_7660 ?auto_7661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7664 - SURFACE
      ?auto_7665 - SURFACE
    )
    :vars
    (
      ?auto_7667 - HOIST
      ?auto_7666 - PLACE
      ?auto_7668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7667 ?auto_7666 ) ( SURFACE-AT ?auto_7665 ?auto_7666 ) ( CLEAR ?auto_7665 ) ( IS-CRATE ?auto_7664 ) ( not ( = ?auto_7664 ?auto_7665 ) ) ( TRUCK-AT ?auto_7668 ?auto_7666 ) ( AVAILABLE ?auto_7667 ) ( IN ?auto_7664 ?auto_7668 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7667 ?auto_7664 ?auto_7668 ?auto_7666 )
      ( MAKE-ON ?auto_7664 ?auto_7665 )
      ( MAKE-ON-VERIFY ?auto_7664 ?auto_7665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7669 - SURFACE
      ?auto_7670 - SURFACE
    )
    :vars
    (
      ?auto_7673 - HOIST
      ?auto_7671 - PLACE
      ?auto_7672 - TRUCK
      ?auto_7674 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7673 ?auto_7671 ) ( SURFACE-AT ?auto_7670 ?auto_7671 ) ( CLEAR ?auto_7670 ) ( IS-CRATE ?auto_7669 ) ( not ( = ?auto_7669 ?auto_7670 ) ) ( AVAILABLE ?auto_7673 ) ( IN ?auto_7669 ?auto_7672 ) ( TRUCK-AT ?auto_7672 ?auto_7674 ) ( not ( = ?auto_7674 ?auto_7671 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7672 ?auto_7674 ?auto_7671 )
      ( MAKE-ON ?auto_7669 ?auto_7670 )
      ( MAKE-ON-VERIFY ?auto_7669 ?auto_7670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7675 - SURFACE
      ?auto_7676 - SURFACE
    )
    :vars
    (
      ?auto_7680 - HOIST
      ?auto_7678 - PLACE
      ?auto_7679 - TRUCK
      ?auto_7677 - PLACE
      ?auto_7681 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7680 ?auto_7678 ) ( SURFACE-AT ?auto_7676 ?auto_7678 ) ( CLEAR ?auto_7676 ) ( IS-CRATE ?auto_7675 ) ( not ( = ?auto_7675 ?auto_7676 ) ) ( AVAILABLE ?auto_7680 ) ( TRUCK-AT ?auto_7679 ?auto_7677 ) ( not ( = ?auto_7677 ?auto_7678 ) ) ( HOIST-AT ?auto_7681 ?auto_7677 ) ( LIFTING ?auto_7681 ?auto_7675 ) ( not ( = ?auto_7680 ?auto_7681 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7681 ?auto_7675 ?auto_7679 ?auto_7677 )
      ( MAKE-ON ?auto_7675 ?auto_7676 )
      ( MAKE-ON-VERIFY ?auto_7675 ?auto_7676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7682 - SURFACE
      ?auto_7683 - SURFACE
    )
    :vars
    (
      ?auto_7685 - HOIST
      ?auto_7684 - PLACE
      ?auto_7686 - TRUCK
      ?auto_7687 - PLACE
      ?auto_7688 - HOIST
      ?auto_7689 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7685 ?auto_7684 ) ( SURFACE-AT ?auto_7683 ?auto_7684 ) ( CLEAR ?auto_7683 ) ( IS-CRATE ?auto_7682 ) ( not ( = ?auto_7682 ?auto_7683 ) ) ( AVAILABLE ?auto_7685 ) ( TRUCK-AT ?auto_7686 ?auto_7687 ) ( not ( = ?auto_7687 ?auto_7684 ) ) ( HOIST-AT ?auto_7688 ?auto_7687 ) ( not ( = ?auto_7685 ?auto_7688 ) ) ( AVAILABLE ?auto_7688 ) ( SURFACE-AT ?auto_7682 ?auto_7687 ) ( ON ?auto_7682 ?auto_7689 ) ( CLEAR ?auto_7682 ) ( not ( = ?auto_7682 ?auto_7689 ) ) ( not ( = ?auto_7683 ?auto_7689 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7688 ?auto_7682 ?auto_7689 ?auto_7687 )
      ( MAKE-ON ?auto_7682 ?auto_7683 )
      ( MAKE-ON-VERIFY ?auto_7682 ?auto_7683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7690 - SURFACE
      ?auto_7691 - SURFACE
    )
    :vars
    (
      ?auto_7697 - HOIST
      ?auto_7694 - PLACE
      ?auto_7696 - PLACE
      ?auto_7693 - HOIST
      ?auto_7695 - SURFACE
      ?auto_7692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7697 ?auto_7694 ) ( SURFACE-AT ?auto_7691 ?auto_7694 ) ( CLEAR ?auto_7691 ) ( IS-CRATE ?auto_7690 ) ( not ( = ?auto_7690 ?auto_7691 ) ) ( AVAILABLE ?auto_7697 ) ( not ( = ?auto_7696 ?auto_7694 ) ) ( HOIST-AT ?auto_7693 ?auto_7696 ) ( not ( = ?auto_7697 ?auto_7693 ) ) ( AVAILABLE ?auto_7693 ) ( SURFACE-AT ?auto_7690 ?auto_7696 ) ( ON ?auto_7690 ?auto_7695 ) ( CLEAR ?auto_7690 ) ( not ( = ?auto_7690 ?auto_7695 ) ) ( not ( = ?auto_7691 ?auto_7695 ) ) ( TRUCK-AT ?auto_7692 ?auto_7694 ) )
    :subtasks
    ( ( !DRIVE ?auto_7692 ?auto_7694 ?auto_7696 )
      ( MAKE-ON ?auto_7690 ?auto_7691 )
      ( MAKE-ON-VERIFY ?auto_7690 ?auto_7691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7698 - SURFACE
      ?auto_7699 - SURFACE
    )
    :vars
    (
      ?auto_7703 - HOIST
      ?auto_7705 - PLACE
      ?auto_7704 - PLACE
      ?auto_7700 - HOIST
      ?auto_7702 - SURFACE
      ?auto_7701 - TRUCK
      ?auto_7706 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7703 ?auto_7705 ) ( IS-CRATE ?auto_7698 ) ( not ( = ?auto_7698 ?auto_7699 ) ) ( not ( = ?auto_7704 ?auto_7705 ) ) ( HOIST-AT ?auto_7700 ?auto_7704 ) ( not ( = ?auto_7703 ?auto_7700 ) ) ( AVAILABLE ?auto_7700 ) ( SURFACE-AT ?auto_7698 ?auto_7704 ) ( ON ?auto_7698 ?auto_7702 ) ( CLEAR ?auto_7698 ) ( not ( = ?auto_7698 ?auto_7702 ) ) ( not ( = ?auto_7699 ?auto_7702 ) ) ( TRUCK-AT ?auto_7701 ?auto_7705 ) ( SURFACE-AT ?auto_7706 ?auto_7705 ) ( CLEAR ?auto_7706 ) ( LIFTING ?auto_7703 ?auto_7699 ) ( IS-CRATE ?auto_7699 ) ( not ( = ?auto_7698 ?auto_7706 ) ) ( not ( = ?auto_7699 ?auto_7706 ) ) ( not ( = ?auto_7702 ?auto_7706 ) ) )
    :subtasks
    ( ( !DROP ?auto_7703 ?auto_7699 ?auto_7706 ?auto_7705 )
      ( MAKE-ON ?auto_7698 ?auto_7699 )
      ( MAKE-ON-VERIFY ?auto_7698 ?auto_7699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7707 - SURFACE
      ?auto_7708 - SURFACE
    )
    :vars
    (
      ?auto_7714 - HOIST
      ?auto_7710 - PLACE
      ?auto_7713 - PLACE
      ?auto_7715 - HOIST
      ?auto_7712 - SURFACE
      ?auto_7711 - TRUCK
      ?auto_7709 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7714 ?auto_7710 ) ( IS-CRATE ?auto_7707 ) ( not ( = ?auto_7707 ?auto_7708 ) ) ( not ( = ?auto_7713 ?auto_7710 ) ) ( HOIST-AT ?auto_7715 ?auto_7713 ) ( not ( = ?auto_7714 ?auto_7715 ) ) ( AVAILABLE ?auto_7715 ) ( SURFACE-AT ?auto_7707 ?auto_7713 ) ( ON ?auto_7707 ?auto_7712 ) ( CLEAR ?auto_7707 ) ( not ( = ?auto_7707 ?auto_7712 ) ) ( not ( = ?auto_7708 ?auto_7712 ) ) ( TRUCK-AT ?auto_7711 ?auto_7710 ) ( SURFACE-AT ?auto_7709 ?auto_7710 ) ( CLEAR ?auto_7709 ) ( IS-CRATE ?auto_7708 ) ( not ( = ?auto_7707 ?auto_7709 ) ) ( not ( = ?auto_7708 ?auto_7709 ) ) ( not ( = ?auto_7712 ?auto_7709 ) ) ( AVAILABLE ?auto_7714 ) ( IN ?auto_7708 ?auto_7711 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7714 ?auto_7708 ?auto_7711 ?auto_7710 )
      ( MAKE-ON ?auto_7707 ?auto_7708 )
      ( MAKE-ON-VERIFY ?auto_7707 ?auto_7708 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7716 - SURFACE
      ?auto_7717 - SURFACE
    )
    :vars
    (
      ?auto_7724 - HOIST
      ?auto_7720 - PLACE
      ?auto_7718 - PLACE
      ?auto_7721 - HOIST
      ?auto_7719 - SURFACE
      ?auto_7722 - SURFACE
      ?auto_7723 - TRUCK
      ?auto_7725 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7724 ?auto_7720 ) ( IS-CRATE ?auto_7716 ) ( not ( = ?auto_7716 ?auto_7717 ) ) ( not ( = ?auto_7718 ?auto_7720 ) ) ( HOIST-AT ?auto_7721 ?auto_7718 ) ( not ( = ?auto_7724 ?auto_7721 ) ) ( AVAILABLE ?auto_7721 ) ( SURFACE-AT ?auto_7716 ?auto_7718 ) ( ON ?auto_7716 ?auto_7719 ) ( CLEAR ?auto_7716 ) ( not ( = ?auto_7716 ?auto_7719 ) ) ( not ( = ?auto_7717 ?auto_7719 ) ) ( SURFACE-AT ?auto_7722 ?auto_7720 ) ( CLEAR ?auto_7722 ) ( IS-CRATE ?auto_7717 ) ( not ( = ?auto_7716 ?auto_7722 ) ) ( not ( = ?auto_7717 ?auto_7722 ) ) ( not ( = ?auto_7719 ?auto_7722 ) ) ( AVAILABLE ?auto_7724 ) ( IN ?auto_7717 ?auto_7723 ) ( TRUCK-AT ?auto_7723 ?auto_7725 ) ( not ( = ?auto_7725 ?auto_7720 ) ) ( not ( = ?auto_7718 ?auto_7725 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7723 ?auto_7725 ?auto_7720 )
      ( MAKE-ON ?auto_7716 ?auto_7717 )
      ( MAKE-ON-VERIFY ?auto_7716 ?auto_7717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7726 - SURFACE
      ?auto_7727 - SURFACE
    )
    :vars
    (
      ?auto_7728 - HOIST
      ?auto_7730 - PLACE
      ?auto_7732 - PLACE
      ?auto_7729 - HOIST
      ?auto_7731 - SURFACE
      ?auto_7734 - SURFACE
      ?auto_7733 - TRUCK
      ?auto_7735 - PLACE
      ?auto_7736 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7728 ?auto_7730 ) ( IS-CRATE ?auto_7726 ) ( not ( = ?auto_7726 ?auto_7727 ) ) ( not ( = ?auto_7732 ?auto_7730 ) ) ( HOIST-AT ?auto_7729 ?auto_7732 ) ( not ( = ?auto_7728 ?auto_7729 ) ) ( AVAILABLE ?auto_7729 ) ( SURFACE-AT ?auto_7726 ?auto_7732 ) ( ON ?auto_7726 ?auto_7731 ) ( CLEAR ?auto_7726 ) ( not ( = ?auto_7726 ?auto_7731 ) ) ( not ( = ?auto_7727 ?auto_7731 ) ) ( SURFACE-AT ?auto_7734 ?auto_7730 ) ( CLEAR ?auto_7734 ) ( IS-CRATE ?auto_7727 ) ( not ( = ?auto_7726 ?auto_7734 ) ) ( not ( = ?auto_7727 ?auto_7734 ) ) ( not ( = ?auto_7731 ?auto_7734 ) ) ( AVAILABLE ?auto_7728 ) ( TRUCK-AT ?auto_7733 ?auto_7735 ) ( not ( = ?auto_7735 ?auto_7730 ) ) ( not ( = ?auto_7732 ?auto_7735 ) ) ( HOIST-AT ?auto_7736 ?auto_7735 ) ( LIFTING ?auto_7736 ?auto_7727 ) ( not ( = ?auto_7728 ?auto_7736 ) ) ( not ( = ?auto_7729 ?auto_7736 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7736 ?auto_7727 ?auto_7733 ?auto_7735 )
      ( MAKE-ON ?auto_7726 ?auto_7727 )
      ( MAKE-ON-VERIFY ?auto_7726 ?auto_7727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7737 - SURFACE
      ?auto_7738 - SURFACE
    )
    :vars
    (
      ?auto_7739 - HOIST
      ?auto_7746 - PLACE
      ?auto_7744 - PLACE
      ?auto_7745 - HOIST
      ?auto_7741 - SURFACE
      ?auto_7743 - SURFACE
      ?auto_7747 - TRUCK
      ?auto_7742 - PLACE
      ?auto_7740 - HOIST
      ?auto_7748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7739 ?auto_7746 ) ( IS-CRATE ?auto_7737 ) ( not ( = ?auto_7737 ?auto_7738 ) ) ( not ( = ?auto_7744 ?auto_7746 ) ) ( HOIST-AT ?auto_7745 ?auto_7744 ) ( not ( = ?auto_7739 ?auto_7745 ) ) ( AVAILABLE ?auto_7745 ) ( SURFACE-AT ?auto_7737 ?auto_7744 ) ( ON ?auto_7737 ?auto_7741 ) ( CLEAR ?auto_7737 ) ( not ( = ?auto_7737 ?auto_7741 ) ) ( not ( = ?auto_7738 ?auto_7741 ) ) ( SURFACE-AT ?auto_7743 ?auto_7746 ) ( CLEAR ?auto_7743 ) ( IS-CRATE ?auto_7738 ) ( not ( = ?auto_7737 ?auto_7743 ) ) ( not ( = ?auto_7738 ?auto_7743 ) ) ( not ( = ?auto_7741 ?auto_7743 ) ) ( AVAILABLE ?auto_7739 ) ( TRUCK-AT ?auto_7747 ?auto_7742 ) ( not ( = ?auto_7742 ?auto_7746 ) ) ( not ( = ?auto_7744 ?auto_7742 ) ) ( HOIST-AT ?auto_7740 ?auto_7742 ) ( not ( = ?auto_7739 ?auto_7740 ) ) ( not ( = ?auto_7745 ?auto_7740 ) ) ( AVAILABLE ?auto_7740 ) ( SURFACE-AT ?auto_7738 ?auto_7742 ) ( ON ?auto_7738 ?auto_7748 ) ( CLEAR ?auto_7738 ) ( not ( = ?auto_7737 ?auto_7748 ) ) ( not ( = ?auto_7738 ?auto_7748 ) ) ( not ( = ?auto_7741 ?auto_7748 ) ) ( not ( = ?auto_7743 ?auto_7748 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7740 ?auto_7738 ?auto_7748 ?auto_7742 )
      ( MAKE-ON ?auto_7737 ?auto_7738 )
      ( MAKE-ON-VERIFY ?auto_7737 ?auto_7738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7749 - SURFACE
      ?auto_7750 - SURFACE
    )
    :vars
    (
      ?auto_7752 - HOIST
      ?auto_7753 - PLACE
      ?auto_7756 - PLACE
      ?auto_7751 - HOIST
      ?auto_7755 - SURFACE
      ?auto_7760 - SURFACE
      ?auto_7759 - PLACE
      ?auto_7754 - HOIST
      ?auto_7758 - SURFACE
      ?auto_7757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7752 ?auto_7753 ) ( IS-CRATE ?auto_7749 ) ( not ( = ?auto_7749 ?auto_7750 ) ) ( not ( = ?auto_7756 ?auto_7753 ) ) ( HOIST-AT ?auto_7751 ?auto_7756 ) ( not ( = ?auto_7752 ?auto_7751 ) ) ( AVAILABLE ?auto_7751 ) ( SURFACE-AT ?auto_7749 ?auto_7756 ) ( ON ?auto_7749 ?auto_7755 ) ( CLEAR ?auto_7749 ) ( not ( = ?auto_7749 ?auto_7755 ) ) ( not ( = ?auto_7750 ?auto_7755 ) ) ( SURFACE-AT ?auto_7760 ?auto_7753 ) ( CLEAR ?auto_7760 ) ( IS-CRATE ?auto_7750 ) ( not ( = ?auto_7749 ?auto_7760 ) ) ( not ( = ?auto_7750 ?auto_7760 ) ) ( not ( = ?auto_7755 ?auto_7760 ) ) ( AVAILABLE ?auto_7752 ) ( not ( = ?auto_7759 ?auto_7753 ) ) ( not ( = ?auto_7756 ?auto_7759 ) ) ( HOIST-AT ?auto_7754 ?auto_7759 ) ( not ( = ?auto_7752 ?auto_7754 ) ) ( not ( = ?auto_7751 ?auto_7754 ) ) ( AVAILABLE ?auto_7754 ) ( SURFACE-AT ?auto_7750 ?auto_7759 ) ( ON ?auto_7750 ?auto_7758 ) ( CLEAR ?auto_7750 ) ( not ( = ?auto_7749 ?auto_7758 ) ) ( not ( = ?auto_7750 ?auto_7758 ) ) ( not ( = ?auto_7755 ?auto_7758 ) ) ( not ( = ?auto_7760 ?auto_7758 ) ) ( TRUCK-AT ?auto_7757 ?auto_7753 ) )
    :subtasks
    ( ( !DRIVE ?auto_7757 ?auto_7753 ?auto_7759 )
      ( MAKE-ON ?auto_7749 ?auto_7750 )
      ( MAKE-ON-VERIFY ?auto_7749 ?auto_7750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7761 - SURFACE
      ?auto_7762 - SURFACE
    )
    :vars
    (
      ?auto_7765 - HOIST
      ?auto_7772 - PLACE
      ?auto_7764 - PLACE
      ?auto_7767 - HOIST
      ?auto_7763 - SURFACE
      ?auto_7766 - SURFACE
      ?auto_7771 - PLACE
      ?auto_7768 - HOIST
      ?auto_7769 - SURFACE
      ?auto_7770 - TRUCK
      ?auto_7773 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7765 ?auto_7772 ) ( IS-CRATE ?auto_7761 ) ( not ( = ?auto_7761 ?auto_7762 ) ) ( not ( = ?auto_7764 ?auto_7772 ) ) ( HOIST-AT ?auto_7767 ?auto_7764 ) ( not ( = ?auto_7765 ?auto_7767 ) ) ( AVAILABLE ?auto_7767 ) ( SURFACE-AT ?auto_7761 ?auto_7764 ) ( ON ?auto_7761 ?auto_7763 ) ( CLEAR ?auto_7761 ) ( not ( = ?auto_7761 ?auto_7763 ) ) ( not ( = ?auto_7762 ?auto_7763 ) ) ( IS-CRATE ?auto_7762 ) ( not ( = ?auto_7761 ?auto_7766 ) ) ( not ( = ?auto_7762 ?auto_7766 ) ) ( not ( = ?auto_7763 ?auto_7766 ) ) ( not ( = ?auto_7771 ?auto_7772 ) ) ( not ( = ?auto_7764 ?auto_7771 ) ) ( HOIST-AT ?auto_7768 ?auto_7771 ) ( not ( = ?auto_7765 ?auto_7768 ) ) ( not ( = ?auto_7767 ?auto_7768 ) ) ( AVAILABLE ?auto_7768 ) ( SURFACE-AT ?auto_7762 ?auto_7771 ) ( ON ?auto_7762 ?auto_7769 ) ( CLEAR ?auto_7762 ) ( not ( = ?auto_7761 ?auto_7769 ) ) ( not ( = ?auto_7762 ?auto_7769 ) ) ( not ( = ?auto_7763 ?auto_7769 ) ) ( not ( = ?auto_7766 ?auto_7769 ) ) ( TRUCK-AT ?auto_7770 ?auto_7772 ) ( SURFACE-AT ?auto_7773 ?auto_7772 ) ( CLEAR ?auto_7773 ) ( LIFTING ?auto_7765 ?auto_7766 ) ( IS-CRATE ?auto_7766 ) ( not ( = ?auto_7761 ?auto_7773 ) ) ( not ( = ?auto_7762 ?auto_7773 ) ) ( not ( = ?auto_7763 ?auto_7773 ) ) ( not ( = ?auto_7766 ?auto_7773 ) ) ( not ( = ?auto_7769 ?auto_7773 ) ) )
    :subtasks
    ( ( !DROP ?auto_7765 ?auto_7766 ?auto_7773 ?auto_7772 )
      ( MAKE-ON ?auto_7761 ?auto_7762 )
      ( MAKE-ON-VERIFY ?auto_7761 ?auto_7762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7774 - SURFACE
      ?auto_7775 - SURFACE
    )
    :vars
    (
      ?auto_7786 - HOIST
      ?auto_7781 - PLACE
      ?auto_7783 - PLACE
      ?auto_7778 - HOIST
      ?auto_7777 - SURFACE
      ?auto_7784 - SURFACE
      ?auto_7776 - PLACE
      ?auto_7785 - HOIST
      ?auto_7780 - SURFACE
      ?auto_7782 - TRUCK
      ?auto_7779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7786 ?auto_7781 ) ( IS-CRATE ?auto_7774 ) ( not ( = ?auto_7774 ?auto_7775 ) ) ( not ( = ?auto_7783 ?auto_7781 ) ) ( HOIST-AT ?auto_7778 ?auto_7783 ) ( not ( = ?auto_7786 ?auto_7778 ) ) ( AVAILABLE ?auto_7778 ) ( SURFACE-AT ?auto_7774 ?auto_7783 ) ( ON ?auto_7774 ?auto_7777 ) ( CLEAR ?auto_7774 ) ( not ( = ?auto_7774 ?auto_7777 ) ) ( not ( = ?auto_7775 ?auto_7777 ) ) ( IS-CRATE ?auto_7775 ) ( not ( = ?auto_7774 ?auto_7784 ) ) ( not ( = ?auto_7775 ?auto_7784 ) ) ( not ( = ?auto_7777 ?auto_7784 ) ) ( not ( = ?auto_7776 ?auto_7781 ) ) ( not ( = ?auto_7783 ?auto_7776 ) ) ( HOIST-AT ?auto_7785 ?auto_7776 ) ( not ( = ?auto_7786 ?auto_7785 ) ) ( not ( = ?auto_7778 ?auto_7785 ) ) ( AVAILABLE ?auto_7785 ) ( SURFACE-AT ?auto_7775 ?auto_7776 ) ( ON ?auto_7775 ?auto_7780 ) ( CLEAR ?auto_7775 ) ( not ( = ?auto_7774 ?auto_7780 ) ) ( not ( = ?auto_7775 ?auto_7780 ) ) ( not ( = ?auto_7777 ?auto_7780 ) ) ( not ( = ?auto_7784 ?auto_7780 ) ) ( TRUCK-AT ?auto_7782 ?auto_7781 ) ( SURFACE-AT ?auto_7779 ?auto_7781 ) ( CLEAR ?auto_7779 ) ( IS-CRATE ?auto_7784 ) ( not ( = ?auto_7774 ?auto_7779 ) ) ( not ( = ?auto_7775 ?auto_7779 ) ) ( not ( = ?auto_7777 ?auto_7779 ) ) ( not ( = ?auto_7784 ?auto_7779 ) ) ( not ( = ?auto_7780 ?auto_7779 ) ) ( AVAILABLE ?auto_7786 ) ( IN ?auto_7784 ?auto_7782 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7786 ?auto_7784 ?auto_7782 ?auto_7781 )
      ( MAKE-ON ?auto_7774 ?auto_7775 )
      ( MAKE-ON-VERIFY ?auto_7774 ?auto_7775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7787 - SURFACE
      ?auto_7788 - SURFACE
    )
    :vars
    (
      ?auto_7793 - HOIST
      ?auto_7795 - PLACE
      ?auto_7789 - PLACE
      ?auto_7796 - HOIST
      ?auto_7797 - SURFACE
      ?auto_7798 - SURFACE
      ?auto_7799 - PLACE
      ?auto_7790 - HOIST
      ?auto_7792 - SURFACE
      ?auto_7794 - SURFACE
      ?auto_7791 - TRUCK
      ?auto_7800 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7793 ?auto_7795 ) ( IS-CRATE ?auto_7787 ) ( not ( = ?auto_7787 ?auto_7788 ) ) ( not ( = ?auto_7789 ?auto_7795 ) ) ( HOIST-AT ?auto_7796 ?auto_7789 ) ( not ( = ?auto_7793 ?auto_7796 ) ) ( AVAILABLE ?auto_7796 ) ( SURFACE-AT ?auto_7787 ?auto_7789 ) ( ON ?auto_7787 ?auto_7797 ) ( CLEAR ?auto_7787 ) ( not ( = ?auto_7787 ?auto_7797 ) ) ( not ( = ?auto_7788 ?auto_7797 ) ) ( IS-CRATE ?auto_7788 ) ( not ( = ?auto_7787 ?auto_7798 ) ) ( not ( = ?auto_7788 ?auto_7798 ) ) ( not ( = ?auto_7797 ?auto_7798 ) ) ( not ( = ?auto_7799 ?auto_7795 ) ) ( not ( = ?auto_7789 ?auto_7799 ) ) ( HOIST-AT ?auto_7790 ?auto_7799 ) ( not ( = ?auto_7793 ?auto_7790 ) ) ( not ( = ?auto_7796 ?auto_7790 ) ) ( AVAILABLE ?auto_7790 ) ( SURFACE-AT ?auto_7788 ?auto_7799 ) ( ON ?auto_7788 ?auto_7792 ) ( CLEAR ?auto_7788 ) ( not ( = ?auto_7787 ?auto_7792 ) ) ( not ( = ?auto_7788 ?auto_7792 ) ) ( not ( = ?auto_7797 ?auto_7792 ) ) ( not ( = ?auto_7798 ?auto_7792 ) ) ( SURFACE-AT ?auto_7794 ?auto_7795 ) ( CLEAR ?auto_7794 ) ( IS-CRATE ?auto_7798 ) ( not ( = ?auto_7787 ?auto_7794 ) ) ( not ( = ?auto_7788 ?auto_7794 ) ) ( not ( = ?auto_7797 ?auto_7794 ) ) ( not ( = ?auto_7798 ?auto_7794 ) ) ( not ( = ?auto_7792 ?auto_7794 ) ) ( AVAILABLE ?auto_7793 ) ( IN ?auto_7798 ?auto_7791 ) ( TRUCK-AT ?auto_7791 ?auto_7800 ) ( not ( = ?auto_7800 ?auto_7795 ) ) ( not ( = ?auto_7789 ?auto_7800 ) ) ( not ( = ?auto_7799 ?auto_7800 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7791 ?auto_7800 ?auto_7795 )
      ( MAKE-ON ?auto_7787 ?auto_7788 )
      ( MAKE-ON-VERIFY ?auto_7787 ?auto_7788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7801 - SURFACE
      ?auto_7802 - SURFACE
    )
    :vars
    (
      ?auto_7806 - HOIST
      ?auto_7803 - PLACE
      ?auto_7804 - PLACE
      ?auto_7808 - HOIST
      ?auto_7805 - SURFACE
      ?auto_7809 - SURFACE
      ?auto_7814 - PLACE
      ?auto_7811 - HOIST
      ?auto_7813 - SURFACE
      ?auto_7807 - SURFACE
      ?auto_7810 - TRUCK
      ?auto_7812 - PLACE
      ?auto_7815 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7806 ?auto_7803 ) ( IS-CRATE ?auto_7801 ) ( not ( = ?auto_7801 ?auto_7802 ) ) ( not ( = ?auto_7804 ?auto_7803 ) ) ( HOIST-AT ?auto_7808 ?auto_7804 ) ( not ( = ?auto_7806 ?auto_7808 ) ) ( AVAILABLE ?auto_7808 ) ( SURFACE-AT ?auto_7801 ?auto_7804 ) ( ON ?auto_7801 ?auto_7805 ) ( CLEAR ?auto_7801 ) ( not ( = ?auto_7801 ?auto_7805 ) ) ( not ( = ?auto_7802 ?auto_7805 ) ) ( IS-CRATE ?auto_7802 ) ( not ( = ?auto_7801 ?auto_7809 ) ) ( not ( = ?auto_7802 ?auto_7809 ) ) ( not ( = ?auto_7805 ?auto_7809 ) ) ( not ( = ?auto_7814 ?auto_7803 ) ) ( not ( = ?auto_7804 ?auto_7814 ) ) ( HOIST-AT ?auto_7811 ?auto_7814 ) ( not ( = ?auto_7806 ?auto_7811 ) ) ( not ( = ?auto_7808 ?auto_7811 ) ) ( AVAILABLE ?auto_7811 ) ( SURFACE-AT ?auto_7802 ?auto_7814 ) ( ON ?auto_7802 ?auto_7813 ) ( CLEAR ?auto_7802 ) ( not ( = ?auto_7801 ?auto_7813 ) ) ( not ( = ?auto_7802 ?auto_7813 ) ) ( not ( = ?auto_7805 ?auto_7813 ) ) ( not ( = ?auto_7809 ?auto_7813 ) ) ( SURFACE-AT ?auto_7807 ?auto_7803 ) ( CLEAR ?auto_7807 ) ( IS-CRATE ?auto_7809 ) ( not ( = ?auto_7801 ?auto_7807 ) ) ( not ( = ?auto_7802 ?auto_7807 ) ) ( not ( = ?auto_7805 ?auto_7807 ) ) ( not ( = ?auto_7809 ?auto_7807 ) ) ( not ( = ?auto_7813 ?auto_7807 ) ) ( AVAILABLE ?auto_7806 ) ( TRUCK-AT ?auto_7810 ?auto_7812 ) ( not ( = ?auto_7812 ?auto_7803 ) ) ( not ( = ?auto_7804 ?auto_7812 ) ) ( not ( = ?auto_7814 ?auto_7812 ) ) ( HOIST-AT ?auto_7815 ?auto_7812 ) ( LIFTING ?auto_7815 ?auto_7809 ) ( not ( = ?auto_7806 ?auto_7815 ) ) ( not ( = ?auto_7808 ?auto_7815 ) ) ( not ( = ?auto_7811 ?auto_7815 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7815 ?auto_7809 ?auto_7810 ?auto_7812 )
      ( MAKE-ON ?auto_7801 ?auto_7802 )
      ( MAKE-ON-VERIFY ?auto_7801 ?auto_7802 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7816 - SURFACE
      ?auto_7817 - SURFACE
    )
    :vars
    (
      ?auto_7825 - HOIST
      ?auto_7830 - PLACE
      ?auto_7826 - PLACE
      ?auto_7819 - HOIST
      ?auto_7821 - SURFACE
      ?auto_7827 - SURFACE
      ?auto_7818 - PLACE
      ?auto_7829 - HOIST
      ?auto_7824 - SURFACE
      ?auto_7823 - SURFACE
      ?auto_7822 - TRUCK
      ?auto_7820 - PLACE
      ?auto_7828 - HOIST
      ?auto_7831 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7825 ?auto_7830 ) ( IS-CRATE ?auto_7816 ) ( not ( = ?auto_7816 ?auto_7817 ) ) ( not ( = ?auto_7826 ?auto_7830 ) ) ( HOIST-AT ?auto_7819 ?auto_7826 ) ( not ( = ?auto_7825 ?auto_7819 ) ) ( AVAILABLE ?auto_7819 ) ( SURFACE-AT ?auto_7816 ?auto_7826 ) ( ON ?auto_7816 ?auto_7821 ) ( CLEAR ?auto_7816 ) ( not ( = ?auto_7816 ?auto_7821 ) ) ( not ( = ?auto_7817 ?auto_7821 ) ) ( IS-CRATE ?auto_7817 ) ( not ( = ?auto_7816 ?auto_7827 ) ) ( not ( = ?auto_7817 ?auto_7827 ) ) ( not ( = ?auto_7821 ?auto_7827 ) ) ( not ( = ?auto_7818 ?auto_7830 ) ) ( not ( = ?auto_7826 ?auto_7818 ) ) ( HOIST-AT ?auto_7829 ?auto_7818 ) ( not ( = ?auto_7825 ?auto_7829 ) ) ( not ( = ?auto_7819 ?auto_7829 ) ) ( AVAILABLE ?auto_7829 ) ( SURFACE-AT ?auto_7817 ?auto_7818 ) ( ON ?auto_7817 ?auto_7824 ) ( CLEAR ?auto_7817 ) ( not ( = ?auto_7816 ?auto_7824 ) ) ( not ( = ?auto_7817 ?auto_7824 ) ) ( not ( = ?auto_7821 ?auto_7824 ) ) ( not ( = ?auto_7827 ?auto_7824 ) ) ( SURFACE-AT ?auto_7823 ?auto_7830 ) ( CLEAR ?auto_7823 ) ( IS-CRATE ?auto_7827 ) ( not ( = ?auto_7816 ?auto_7823 ) ) ( not ( = ?auto_7817 ?auto_7823 ) ) ( not ( = ?auto_7821 ?auto_7823 ) ) ( not ( = ?auto_7827 ?auto_7823 ) ) ( not ( = ?auto_7824 ?auto_7823 ) ) ( AVAILABLE ?auto_7825 ) ( TRUCK-AT ?auto_7822 ?auto_7820 ) ( not ( = ?auto_7820 ?auto_7830 ) ) ( not ( = ?auto_7826 ?auto_7820 ) ) ( not ( = ?auto_7818 ?auto_7820 ) ) ( HOIST-AT ?auto_7828 ?auto_7820 ) ( not ( = ?auto_7825 ?auto_7828 ) ) ( not ( = ?auto_7819 ?auto_7828 ) ) ( not ( = ?auto_7829 ?auto_7828 ) ) ( AVAILABLE ?auto_7828 ) ( SURFACE-AT ?auto_7827 ?auto_7820 ) ( ON ?auto_7827 ?auto_7831 ) ( CLEAR ?auto_7827 ) ( not ( = ?auto_7816 ?auto_7831 ) ) ( not ( = ?auto_7817 ?auto_7831 ) ) ( not ( = ?auto_7821 ?auto_7831 ) ) ( not ( = ?auto_7827 ?auto_7831 ) ) ( not ( = ?auto_7824 ?auto_7831 ) ) ( not ( = ?auto_7823 ?auto_7831 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7828 ?auto_7827 ?auto_7831 ?auto_7820 )
      ( MAKE-ON ?auto_7816 ?auto_7817 )
      ( MAKE-ON-VERIFY ?auto_7816 ?auto_7817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7832 - SURFACE
      ?auto_7833 - SURFACE
    )
    :vars
    (
      ?auto_7843 - HOIST
      ?auto_7845 - PLACE
      ?auto_7842 - PLACE
      ?auto_7837 - HOIST
      ?auto_7834 - SURFACE
      ?auto_7835 - SURFACE
      ?auto_7847 - PLACE
      ?auto_7836 - HOIST
      ?auto_7844 - SURFACE
      ?auto_7838 - SURFACE
      ?auto_7841 - PLACE
      ?auto_7840 - HOIST
      ?auto_7846 - SURFACE
      ?auto_7839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7843 ?auto_7845 ) ( IS-CRATE ?auto_7832 ) ( not ( = ?auto_7832 ?auto_7833 ) ) ( not ( = ?auto_7842 ?auto_7845 ) ) ( HOIST-AT ?auto_7837 ?auto_7842 ) ( not ( = ?auto_7843 ?auto_7837 ) ) ( AVAILABLE ?auto_7837 ) ( SURFACE-AT ?auto_7832 ?auto_7842 ) ( ON ?auto_7832 ?auto_7834 ) ( CLEAR ?auto_7832 ) ( not ( = ?auto_7832 ?auto_7834 ) ) ( not ( = ?auto_7833 ?auto_7834 ) ) ( IS-CRATE ?auto_7833 ) ( not ( = ?auto_7832 ?auto_7835 ) ) ( not ( = ?auto_7833 ?auto_7835 ) ) ( not ( = ?auto_7834 ?auto_7835 ) ) ( not ( = ?auto_7847 ?auto_7845 ) ) ( not ( = ?auto_7842 ?auto_7847 ) ) ( HOIST-AT ?auto_7836 ?auto_7847 ) ( not ( = ?auto_7843 ?auto_7836 ) ) ( not ( = ?auto_7837 ?auto_7836 ) ) ( AVAILABLE ?auto_7836 ) ( SURFACE-AT ?auto_7833 ?auto_7847 ) ( ON ?auto_7833 ?auto_7844 ) ( CLEAR ?auto_7833 ) ( not ( = ?auto_7832 ?auto_7844 ) ) ( not ( = ?auto_7833 ?auto_7844 ) ) ( not ( = ?auto_7834 ?auto_7844 ) ) ( not ( = ?auto_7835 ?auto_7844 ) ) ( SURFACE-AT ?auto_7838 ?auto_7845 ) ( CLEAR ?auto_7838 ) ( IS-CRATE ?auto_7835 ) ( not ( = ?auto_7832 ?auto_7838 ) ) ( not ( = ?auto_7833 ?auto_7838 ) ) ( not ( = ?auto_7834 ?auto_7838 ) ) ( not ( = ?auto_7835 ?auto_7838 ) ) ( not ( = ?auto_7844 ?auto_7838 ) ) ( AVAILABLE ?auto_7843 ) ( not ( = ?auto_7841 ?auto_7845 ) ) ( not ( = ?auto_7842 ?auto_7841 ) ) ( not ( = ?auto_7847 ?auto_7841 ) ) ( HOIST-AT ?auto_7840 ?auto_7841 ) ( not ( = ?auto_7843 ?auto_7840 ) ) ( not ( = ?auto_7837 ?auto_7840 ) ) ( not ( = ?auto_7836 ?auto_7840 ) ) ( AVAILABLE ?auto_7840 ) ( SURFACE-AT ?auto_7835 ?auto_7841 ) ( ON ?auto_7835 ?auto_7846 ) ( CLEAR ?auto_7835 ) ( not ( = ?auto_7832 ?auto_7846 ) ) ( not ( = ?auto_7833 ?auto_7846 ) ) ( not ( = ?auto_7834 ?auto_7846 ) ) ( not ( = ?auto_7835 ?auto_7846 ) ) ( not ( = ?auto_7844 ?auto_7846 ) ) ( not ( = ?auto_7838 ?auto_7846 ) ) ( TRUCK-AT ?auto_7839 ?auto_7845 ) )
    :subtasks
    ( ( !DRIVE ?auto_7839 ?auto_7845 ?auto_7841 )
      ( MAKE-ON ?auto_7832 ?auto_7833 )
      ( MAKE-ON-VERIFY ?auto_7832 ?auto_7833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7848 - SURFACE
      ?auto_7849 - SURFACE
    )
    :vars
    (
      ?auto_7850 - HOIST
      ?auto_7860 - PLACE
      ?auto_7862 - PLACE
      ?auto_7861 - HOIST
      ?auto_7859 - SURFACE
      ?auto_7863 - SURFACE
      ?auto_7851 - PLACE
      ?auto_7853 - HOIST
      ?auto_7858 - SURFACE
      ?auto_7855 - SURFACE
      ?auto_7852 - PLACE
      ?auto_7854 - HOIST
      ?auto_7856 - SURFACE
      ?auto_7857 - TRUCK
      ?auto_7864 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7850 ?auto_7860 ) ( IS-CRATE ?auto_7848 ) ( not ( = ?auto_7848 ?auto_7849 ) ) ( not ( = ?auto_7862 ?auto_7860 ) ) ( HOIST-AT ?auto_7861 ?auto_7862 ) ( not ( = ?auto_7850 ?auto_7861 ) ) ( AVAILABLE ?auto_7861 ) ( SURFACE-AT ?auto_7848 ?auto_7862 ) ( ON ?auto_7848 ?auto_7859 ) ( CLEAR ?auto_7848 ) ( not ( = ?auto_7848 ?auto_7859 ) ) ( not ( = ?auto_7849 ?auto_7859 ) ) ( IS-CRATE ?auto_7849 ) ( not ( = ?auto_7848 ?auto_7863 ) ) ( not ( = ?auto_7849 ?auto_7863 ) ) ( not ( = ?auto_7859 ?auto_7863 ) ) ( not ( = ?auto_7851 ?auto_7860 ) ) ( not ( = ?auto_7862 ?auto_7851 ) ) ( HOIST-AT ?auto_7853 ?auto_7851 ) ( not ( = ?auto_7850 ?auto_7853 ) ) ( not ( = ?auto_7861 ?auto_7853 ) ) ( AVAILABLE ?auto_7853 ) ( SURFACE-AT ?auto_7849 ?auto_7851 ) ( ON ?auto_7849 ?auto_7858 ) ( CLEAR ?auto_7849 ) ( not ( = ?auto_7848 ?auto_7858 ) ) ( not ( = ?auto_7849 ?auto_7858 ) ) ( not ( = ?auto_7859 ?auto_7858 ) ) ( not ( = ?auto_7863 ?auto_7858 ) ) ( IS-CRATE ?auto_7863 ) ( not ( = ?auto_7848 ?auto_7855 ) ) ( not ( = ?auto_7849 ?auto_7855 ) ) ( not ( = ?auto_7859 ?auto_7855 ) ) ( not ( = ?auto_7863 ?auto_7855 ) ) ( not ( = ?auto_7858 ?auto_7855 ) ) ( not ( = ?auto_7852 ?auto_7860 ) ) ( not ( = ?auto_7862 ?auto_7852 ) ) ( not ( = ?auto_7851 ?auto_7852 ) ) ( HOIST-AT ?auto_7854 ?auto_7852 ) ( not ( = ?auto_7850 ?auto_7854 ) ) ( not ( = ?auto_7861 ?auto_7854 ) ) ( not ( = ?auto_7853 ?auto_7854 ) ) ( AVAILABLE ?auto_7854 ) ( SURFACE-AT ?auto_7863 ?auto_7852 ) ( ON ?auto_7863 ?auto_7856 ) ( CLEAR ?auto_7863 ) ( not ( = ?auto_7848 ?auto_7856 ) ) ( not ( = ?auto_7849 ?auto_7856 ) ) ( not ( = ?auto_7859 ?auto_7856 ) ) ( not ( = ?auto_7863 ?auto_7856 ) ) ( not ( = ?auto_7858 ?auto_7856 ) ) ( not ( = ?auto_7855 ?auto_7856 ) ) ( TRUCK-AT ?auto_7857 ?auto_7860 ) ( SURFACE-AT ?auto_7864 ?auto_7860 ) ( CLEAR ?auto_7864 ) ( LIFTING ?auto_7850 ?auto_7855 ) ( IS-CRATE ?auto_7855 ) ( not ( = ?auto_7848 ?auto_7864 ) ) ( not ( = ?auto_7849 ?auto_7864 ) ) ( not ( = ?auto_7859 ?auto_7864 ) ) ( not ( = ?auto_7863 ?auto_7864 ) ) ( not ( = ?auto_7858 ?auto_7864 ) ) ( not ( = ?auto_7855 ?auto_7864 ) ) ( not ( = ?auto_7856 ?auto_7864 ) ) )
    :subtasks
    ( ( !DROP ?auto_7850 ?auto_7855 ?auto_7864 ?auto_7860 )
      ( MAKE-ON ?auto_7848 ?auto_7849 )
      ( MAKE-ON-VERIFY ?auto_7848 ?auto_7849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7865 - SURFACE
      ?auto_7866 - SURFACE
    )
    :vars
    (
      ?auto_7878 - HOIST
      ?auto_7870 - PLACE
      ?auto_7880 - PLACE
      ?auto_7876 - HOIST
      ?auto_7867 - SURFACE
      ?auto_7873 - SURFACE
      ?auto_7874 - PLACE
      ?auto_7875 - HOIST
      ?auto_7877 - SURFACE
      ?auto_7872 - SURFACE
      ?auto_7879 - PLACE
      ?auto_7868 - HOIST
      ?auto_7881 - SURFACE
      ?auto_7871 - TRUCK
      ?auto_7869 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7878 ?auto_7870 ) ( IS-CRATE ?auto_7865 ) ( not ( = ?auto_7865 ?auto_7866 ) ) ( not ( = ?auto_7880 ?auto_7870 ) ) ( HOIST-AT ?auto_7876 ?auto_7880 ) ( not ( = ?auto_7878 ?auto_7876 ) ) ( AVAILABLE ?auto_7876 ) ( SURFACE-AT ?auto_7865 ?auto_7880 ) ( ON ?auto_7865 ?auto_7867 ) ( CLEAR ?auto_7865 ) ( not ( = ?auto_7865 ?auto_7867 ) ) ( not ( = ?auto_7866 ?auto_7867 ) ) ( IS-CRATE ?auto_7866 ) ( not ( = ?auto_7865 ?auto_7873 ) ) ( not ( = ?auto_7866 ?auto_7873 ) ) ( not ( = ?auto_7867 ?auto_7873 ) ) ( not ( = ?auto_7874 ?auto_7870 ) ) ( not ( = ?auto_7880 ?auto_7874 ) ) ( HOIST-AT ?auto_7875 ?auto_7874 ) ( not ( = ?auto_7878 ?auto_7875 ) ) ( not ( = ?auto_7876 ?auto_7875 ) ) ( AVAILABLE ?auto_7875 ) ( SURFACE-AT ?auto_7866 ?auto_7874 ) ( ON ?auto_7866 ?auto_7877 ) ( CLEAR ?auto_7866 ) ( not ( = ?auto_7865 ?auto_7877 ) ) ( not ( = ?auto_7866 ?auto_7877 ) ) ( not ( = ?auto_7867 ?auto_7877 ) ) ( not ( = ?auto_7873 ?auto_7877 ) ) ( IS-CRATE ?auto_7873 ) ( not ( = ?auto_7865 ?auto_7872 ) ) ( not ( = ?auto_7866 ?auto_7872 ) ) ( not ( = ?auto_7867 ?auto_7872 ) ) ( not ( = ?auto_7873 ?auto_7872 ) ) ( not ( = ?auto_7877 ?auto_7872 ) ) ( not ( = ?auto_7879 ?auto_7870 ) ) ( not ( = ?auto_7880 ?auto_7879 ) ) ( not ( = ?auto_7874 ?auto_7879 ) ) ( HOIST-AT ?auto_7868 ?auto_7879 ) ( not ( = ?auto_7878 ?auto_7868 ) ) ( not ( = ?auto_7876 ?auto_7868 ) ) ( not ( = ?auto_7875 ?auto_7868 ) ) ( AVAILABLE ?auto_7868 ) ( SURFACE-AT ?auto_7873 ?auto_7879 ) ( ON ?auto_7873 ?auto_7881 ) ( CLEAR ?auto_7873 ) ( not ( = ?auto_7865 ?auto_7881 ) ) ( not ( = ?auto_7866 ?auto_7881 ) ) ( not ( = ?auto_7867 ?auto_7881 ) ) ( not ( = ?auto_7873 ?auto_7881 ) ) ( not ( = ?auto_7877 ?auto_7881 ) ) ( not ( = ?auto_7872 ?auto_7881 ) ) ( TRUCK-AT ?auto_7871 ?auto_7870 ) ( SURFACE-AT ?auto_7869 ?auto_7870 ) ( CLEAR ?auto_7869 ) ( IS-CRATE ?auto_7872 ) ( not ( = ?auto_7865 ?auto_7869 ) ) ( not ( = ?auto_7866 ?auto_7869 ) ) ( not ( = ?auto_7867 ?auto_7869 ) ) ( not ( = ?auto_7873 ?auto_7869 ) ) ( not ( = ?auto_7877 ?auto_7869 ) ) ( not ( = ?auto_7872 ?auto_7869 ) ) ( not ( = ?auto_7881 ?auto_7869 ) ) ( AVAILABLE ?auto_7878 ) ( IN ?auto_7872 ?auto_7871 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7878 ?auto_7872 ?auto_7871 ?auto_7870 )
      ( MAKE-ON ?auto_7865 ?auto_7866 )
      ( MAKE-ON-VERIFY ?auto_7865 ?auto_7866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7882 - SURFACE
      ?auto_7883 - SURFACE
    )
    :vars
    (
      ?auto_7898 - HOIST
      ?auto_7897 - PLACE
      ?auto_7886 - PLACE
      ?auto_7890 - HOIST
      ?auto_7896 - SURFACE
      ?auto_7884 - SURFACE
      ?auto_7887 - PLACE
      ?auto_7885 - HOIST
      ?auto_7889 - SURFACE
      ?auto_7893 - SURFACE
      ?auto_7892 - PLACE
      ?auto_7888 - HOIST
      ?auto_7891 - SURFACE
      ?auto_7894 - SURFACE
      ?auto_7895 - TRUCK
      ?auto_7899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7898 ?auto_7897 ) ( IS-CRATE ?auto_7882 ) ( not ( = ?auto_7882 ?auto_7883 ) ) ( not ( = ?auto_7886 ?auto_7897 ) ) ( HOIST-AT ?auto_7890 ?auto_7886 ) ( not ( = ?auto_7898 ?auto_7890 ) ) ( AVAILABLE ?auto_7890 ) ( SURFACE-AT ?auto_7882 ?auto_7886 ) ( ON ?auto_7882 ?auto_7896 ) ( CLEAR ?auto_7882 ) ( not ( = ?auto_7882 ?auto_7896 ) ) ( not ( = ?auto_7883 ?auto_7896 ) ) ( IS-CRATE ?auto_7883 ) ( not ( = ?auto_7882 ?auto_7884 ) ) ( not ( = ?auto_7883 ?auto_7884 ) ) ( not ( = ?auto_7896 ?auto_7884 ) ) ( not ( = ?auto_7887 ?auto_7897 ) ) ( not ( = ?auto_7886 ?auto_7887 ) ) ( HOIST-AT ?auto_7885 ?auto_7887 ) ( not ( = ?auto_7898 ?auto_7885 ) ) ( not ( = ?auto_7890 ?auto_7885 ) ) ( AVAILABLE ?auto_7885 ) ( SURFACE-AT ?auto_7883 ?auto_7887 ) ( ON ?auto_7883 ?auto_7889 ) ( CLEAR ?auto_7883 ) ( not ( = ?auto_7882 ?auto_7889 ) ) ( not ( = ?auto_7883 ?auto_7889 ) ) ( not ( = ?auto_7896 ?auto_7889 ) ) ( not ( = ?auto_7884 ?auto_7889 ) ) ( IS-CRATE ?auto_7884 ) ( not ( = ?auto_7882 ?auto_7893 ) ) ( not ( = ?auto_7883 ?auto_7893 ) ) ( not ( = ?auto_7896 ?auto_7893 ) ) ( not ( = ?auto_7884 ?auto_7893 ) ) ( not ( = ?auto_7889 ?auto_7893 ) ) ( not ( = ?auto_7892 ?auto_7897 ) ) ( not ( = ?auto_7886 ?auto_7892 ) ) ( not ( = ?auto_7887 ?auto_7892 ) ) ( HOIST-AT ?auto_7888 ?auto_7892 ) ( not ( = ?auto_7898 ?auto_7888 ) ) ( not ( = ?auto_7890 ?auto_7888 ) ) ( not ( = ?auto_7885 ?auto_7888 ) ) ( AVAILABLE ?auto_7888 ) ( SURFACE-AT ?auto_7884 ?auto_7892 ) ( ON ?auto_7884 ?auto_7891 ) ( CLEAR ?auto_7884 ) ( not ( = ?auto_7882 ?auto_7891 ) ) ( not ( = ?auto_7883 ?auto_7891 ) ) ( not ( = ?auto_7896 ?auto_7891 ) ) ( not ( = ?auto_7884 ?auto_7891 ) ) ( not ( = ?auto_7889 ?auto_7891 ) ) ( not ( = ?auto_7893 ?auto_7891 ) ) ( SURFACE-AT ?auto_7894 ?auto_7897 ) ( CLEAR ?auto_7894 ) ( IS-CRATE ?auto_7893 ) ( not ( = ?auto_7882 ?auto_7894 ) ) ( not ( = ?auto_7883 ?auto_7894 ) ) ( not ( = ?auto_7896 ?auto_7894 ) ) ( not ( = ?auto_7884 ?auto_7894 ) ) ( not ( = ?auto_7889 ?auto_7894 ) ) ( not ( = ?auto_7893 ?auto_7894 ) ) ( not ( = ?auto_7891 ?auto_7894 ) ) ( AVAILABLE ?auto_7898 ) ( IN ?auto_7893 ?auto_7895 ) ( TRUCK-AT ?auto_7895 ?auto_7899 ) ( not ( = ?auto_7899 ?auto_7897 ) ) ( not ( = ?auto_7886 ?auto_7899 ) ) ( not ( = ?auto_7887 ?auto_7899 ) ) ( not ( = ?auto_7892 ?auto_7899 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7895 ?auto_7899 ?auto_7897 )
      ( MAKE-ON ?auto_7882 ?auto_7883 )
      ( MAKE-ON-VERIFY ?auto_7882 ?auto_7883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7900 - SURFACE
      ?auto_7901 - SURFACE
    )
    :vars
    (
      ?auto_7904 - HOIST
      ?auto_7905 - PLACE
      ?auto_7909 - PLACE
      ?auto_7912 - HOIST
      ?auto_7914 - SURFACE
      ?auto_7902 - SURFACE
      ?auto_7911 - PLACE
      ?auto_7908 - HOIST
      ?auto_7907 - SURFACE
      ?auto_7916 - SURFACE
      ?auto_7917 - PLACE
      ?auto_7915 - HOIST
      ?auto_7906 - SURFACE
      ?auto_7910 - SURFACE
      ?auto_7913 - TRUCK
      ?auto_7903 - PLACE
      ?auto_7918 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7904 ?auto_7905 ) ( IS-CRATE ?auto_7900 ) ( not ( = ?auto_7900 ?auto_7901 ) ) ( not ( = ?auto_7909 ?auto_7905 ) ) ( HOIST-AT ?auto_7912 ?auto_7909 ) ( not ( = ?auto_7904 ?auto_7912 ) ) ( AVAILABLE ?auto_7912 ) ( SURFACE-AT ?auto_7900 ?auto_7909 ) ( ON ?auto_7900 ?auto_7914 ) ( CLEAR ?auto_7900 ) ( not ( = ?auto_7900 ?auto_7914 ) ) ( not ( = ?auto_7901 ?auto_7914 ) ) ( IS-CRATE ?auto_7901 ) ( not ( = ?auto_7900 ?auto_7902 ) ) ( not ( = ?auto_7901 ?auto_7902 ) ) ( not ( = ?auto_7914 ?auto_7902 ) ) ( not ( = ?auto_7911 ?auto_7905 ) ) ( not ( = ?auto_7909 ?auto_7911 ) ) ( HOIST-AT ?auto_7908 ?auto_7911 ) ( not ( = ?auto_7904 ?auto_7908 ) ) ( not ( = ?auto_7912 ?auto_7908 ) ) ( AVAILABLE ?auto_7908 ) ( SURFACE-AT ?auto_7901 ?auto_7911 ) ( ON ?auto_7901 ?auto_7907 ) ( CLEAR ?auto_7901 ) ( not ( = ?auto_7900 ?auto_7907 ) ) ( not ( = ?auto_7901 ?auto_7907 ) ) ( not ( = ?auto_7914 ?auto_7907 ) ) ( not ( = ?auto_7902 ?auto_7907 ) ) ( IS-CRATE ?auto_7902 ) ( not ( = ?auto_7900 ?auto_7916 ) ) ( not ( = ?auto_7901 ?auto_7916 ) ) ( not ( = ?auto_7914 ?auto_7916 ) ) ( not ( = ?auto_7902 ?auto_7916 ) ) ( not ( = ?auto_7907 ?auto_7916 ) ) ( not ( = ?auto_7917 ?auto_7905 ) ) ( not ( = ?auto_7909 ?auto_7917 ) ) ( not ( = ?auto_7911 ?auto_7917 ) ) ( HOIST-AT ?auto_7915 ?auto_7917 ) ( not ( = ?auto_7904 ?auto_7915 ) ) ( not ( = ?auto_7912 ?auto_7915 ) ) ( not ( = ?auto_7908 ?auto_7915 ) ) ( AVAILABLE ?auto_7915 ) ( SURFACE-AT ?auto_7902 ?auto_7917 ) ( ON ?auto_7902 ?auto_7906 ) ( CLEAR ?auto_7902 ) ( not ( = ?auto_7900 ?auto_7906 ) ) ( not ( = ?auto_7901 ?auto_7906 ) ) ( not ( = ?auto_7914 ?auto_7906 ) ) ( not ( = ?auto_7902 ?auto_7906 ) ) ( not ( = ?auto_7907 ?auto_7906 ) ) ( not ( = ?auto_7916 ?auto_7906 ) ) ( SURFACE-AT ?auto_7910 ?auto_7905 ) ( CLEAR ?auto_7910 ) ( IS-CRATE ?auto_7916 ) ( not ( = ?auto_7900 ?auto_7910 ) ) ( not ( = ?auto_7901 ?auto_7910 ) ) ( not ( = ?auto_7914 ?auto_7910 ) ) ( not ( = ?auto_7902 ?auto_7910 ) ) ( not ( = ?auto_7907 ?auto_7910 ) ) ( not ( = ?auto_7916 ?auto_7910 ) ) ( not ( = ?auto_7906 ?auto_7910 ) ) ( AVAILABLE ?auto_7904 ) ( TRUCK-AT ?auto_7913 ?auto_7903 ) ( not ( = ?auto_7903 ?auto_7905 ) ) ( not ( = ?auto_7909 ?auto_7903 ) ) ( not ( = ?auto_7911 ?auto_7903 ) ) ( not ( = ?auto_7917 ?auto_7903 ) ) ( HOIST-AT ?auto_7918 ?auto_7903 ) ( LIFTING ?auto_7918 ?auto_7916 ) ( not ( = ?auto_7904 ?auto_7918 ) ) ( not ( = ?auto_7912 ?auto_7918 ) ) ( not ( = ?auto_7908 ?auto_7918 ) ) ( not ( = ?auto_7915 ?auto_7918 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7918 ?auto_7916 ?auto_7913 ?auto_7903 )
      ( MAKE-ON ?auto_7900 ?auto_7901 )
      ( MAKE-ON-VERIFY ?auto_7900 ?auto_7901 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7919 - SURFACE
      ?auto_7920 - SURFACE
    )
    :vars
    (
      ?auto_7934 - HOIST
      ?auto_7930 - PLACE
      ?auto_7935 - PLACE
      ?auto_7929 - HOIST
      ?auto_7937 - SURFACE
      ?auto_7921 - SURFACE
      ?auto_7928 - PLACE
      ?auto_7933 - HOIST
      ?auto_7932 - SURFACE
      ?auto_7922 - SURFACE
      ?auto_7925 - PLACE
      ?auto_7923 - HOIST
      ?auto_7924 - SURFACE
      ?auto_7926 - SURFACE
      ?auto_7927 - TRUCK
      ?auto_7936 - PLACE
      ?auto_7931 - HOIST
      ?auto_7938 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7934 ?auto_7930 ) ( IS-CRATE ?auto_7919 ) ( not ( = ?auto_7919 ?auto_7920 ) ) ( not ( = ?auto_7935 ?auto_7930 ) ) ( HOIST-AT ?auto_7929 ?auto_7935 ) ( not ( = ?auto_7934 ?auto_7929 ) ) ( AVAILABLE ?auto_7929 ) ( SURFACE-AT ?auto_7919 ?auto_7935 ) ( ON ?auto_7919 ?auto_7937 ) ( CLEAR ?auto_7919 ) ( not ( = ?auto_7919 ?auto_7937 ) ) ( not ( = ?auto_7920 ?auto_7937 ) ) ( IS-CRATE ?auto_7920 ) ( not ( = ?auto_7919 ?auto_7921 ) ) ( not ( = ?auto_7920 ?auto_7921 ) ) ( not ( = ?auto_7937 ?auto_7921 ) ) ( not ( = ?auto_7928 ?auto_7930 ) ) ( not ( = ?auto_7935 ?auto_7928 ) ) ( HOIST-AT ?auto_7933 ?auto_7928 ) ( not ( = ?auto_7934 ?auto_7933 ) ) ( not ( = ?auto_7929 ?auto_7933 ) ) ( AVAILABLE ?auto_7933 ) ( SURFACE-AT ?auto_7920 ?auto_7928 ) ( ON ?auto_7920 ?auto_7932 ) ( CLEAR ?auto_7920 ) ( not ( = ?auto_7919 ?auto_7932 ) ) ( not ( = ?auto_7920 ?auto_7932 ) ) ( not ( = ?auto_7937 ?auto_7932 ) ) ( not ( = ?auto_7921 ?auto_7932 ) ) ( IS-CRATE ?auto_7921 ) ( not ( = ?auto_7919 ?auto_7922 ) ) ( not ( = ?auto_7920 ?auto_7922 ) ) ( not ( = ?auto_7937 ?auto_7922 ) ) ( not ( = ?auto_7921 ?auto_7922 ) ) ( not ( = ?auto_7932 ?auto_7922 ) ) ( not ( = ?auto_7925 ?auto_7930 ) ) ( not ( = ?auto_7935 ?auto_7925 ) ) ( not ( = ?auto_7928 ?auto_7925 ) ) ( HOIST-AT ?auto_7923 ?auto_7925 ) ( not ( = ?auto_7934 ?auto_7923 ) ) ( not ( = ?auto_7929 ?auto_7923 ) ) ( not ( = ?auto_7933 ?auto_7923 ) ) ( AVAILABLE ?auto_7923 ) ( SURFACE-AT ?auto_7921 ?auto_7925 ) ( ON ?auto_7921 ?auto_7924 ) ( CLEAR ?auto_7921 ) ( not ( = ?auto_7919 ?auto_7924 ) ) ( not ( = ?auto_7920 ?auto_7924 ) ) ( not ( = ?auto_7937 ?auto_7924 ) ) ( not ( = ?auto_7921 ?auto_7924 ) ) ( not ( = ?auto_7932 ?auto_7924 ) ) ( not ( = ?auto_7922 ?auto_7924 ) ) ( SURFACE-AT ?auto_7926 ?auto_7930 ) ( CLEAR ?auto_7926 ) ( IS-CRATE ?auto_7922 ) ( not ( = ?auto_7919 ?auto_7926 ) ) ( not ( = ?auto_7920 ?auto_7926 ) ) ( not ( = ?auto_7937 ?auto_7926 ) ) ( not ( = ?auto_7921 ?auto_7926 ) ) ( not ( = ?auto_7932 ?auto_7926 ) ) ( not ( = ?auto_7922 ?auto_7926 ) ) ( not ( = ?auto_7924 ?auto_7926 ) ) ( AVAILABLE ?auto_7934 ) ( TRUCK-AT ?auto_7927 ?auto_7936 ) ( not ( = ?auto_7936 ?auto_7930 ) ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7928 ?auto_7936 ) ) ( not ( = ?auto_7925 ?auto_7936 ) ) ( HOIST-AT ?auto_7931 ?auto_7936 ) ( not ( = ?auto_7934 ?auto_7931 ) ) ( not ( = ?auto_7929 ?auto_7931 ) ) ( not ( = ?auto_7933 ?auto_7931 ) ) ( not ( = ?auto_7923 ?auto_7931 ) ) ( AVAILABLE ?auto_7931 ) ( SURFACE-AT ?auto_7922 ?auto_7936 ) ( ON ?auto_7922 ?auto_7938 ) ( CLEAR ?auto_7922 ) ( not ( = ?auto_7919 ?auto_7938 ) ) ( not ( = ?auto_7920 ?auto_7938 ) ) ( not ( = ?auto_7937 ?auto_7938 ) ) ( not ( = ?auto_7921 ?auto_7938 ) ) ( not ( = ?auto_7932 ?auto_7938 ) ) ( not ( = ?auto_7922 ?auto_7938 ) ) ( not ( = ?auto_7924 ?auto_7938 ) ) ( not ( = ?auto_7926 ?auto_7938 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7931 ?auto_7922 ?auto_7938 ?auto_7936 )
      ( MAKE-ON ?auto_7919 ?auto_7920 )
      ( MAKE-ON-VERIFY ?auto_7919 ?auto_7920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7939 - SURFACE
      ?auto_7940 - SURFACE
    )
    :vars
    (
      ?auto_7945 - HOIST
      ?auto_7943 - PLACE
      ?auto_7955 - PLACE
      ?auto_7944 - HOIST
      ?auto_7946 - SURFACE
      ?auto_7948 - SURFACE
      ?auto_7950 - PLACE
      ?auto_7953 - HOIST
      ?auto_7956 - SURFACE
      ?auto_7952 - SURFACE
      ?auto_7942 - PLACE
      ?auto_7951 - HOIST
      ?auto_7941 - SURFACE
      ?auto_7949 - SURFACE
      ?auto_7947 - PLACE
      ?auto_7958 - HOIST
      ?auto_7957 - SURFACE
      ?auto_7954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7945 ?auto_7943 ) ( IS-CRATE ?auto_7939 ) ( not ( = ?auto_7939 ?auto_7940 ) ) ( not ( = ?auto_7955 ?auto_7943 ) ) ( HOIST-AT ?auto_7944 ?auto_7955 ) ( not ( = ?auto_7945 ?auto_7944 ) ) ( AVAILABLE ?auto_7944 ) ( SURFACE-AT ?auto_7939 ?auto_7955 ) ( ON ?auto_7939 ?auto_7946 ) ( CLEAR ?auto_7939 ) ( not ( = ?auto_7939 ?auto_7946 ) ) ( not ( = ?auto_7940 ?auto_7946 ) ) ( IS-CRATE ?auto_7940 ) ( not ( = ?auto_7939 ?auto_7948 ) ) ( not ( = ?auto_7940 ?auto_7948 ) ) ( not ( = ?auto_7946 ?auto_7948 ) ) ( not ( = ?auto_7950 ?auto_7943 ) ) ( not ( = ?auto_7955 ?auto_7950 ) ) ( HOIST-AT ?auto_7953 ?auto_7950 ) ( not ( = ?auto_7945 ?auto_7953 ) ) ( not ( = ?auto_7944 ?auto_7953 ) ) ( AVAILABLE ?auto_7953 ) ( SURFACE-AT ?auto_7940 ?auto_7950 ) ( ON ?auto_7940 ?auto_7956 ) ( CLEAR ?auto_7940 ) ( not ( = ?auto_7939 ?auto_7956 ) ) ( not ( = ?auto_7940 ?auto_7956 ) ) ( not ( = ?auto_7946 ?auto_7956 ) ) ( not ( = ?auto_7948 ?auto_7956 ) ) ( IS-CRATE ?auto_7948 ) ( not ( = ?auto_7939 ?auto_7952 ) ) ( not ( = ?auto_7940 ?auto_7952 ) ) ( not ( = ?auto_7946 ?auto_7952 ) ) ( not ( = ?auto_7948 ?auto_7952 ) ) ( not ( = ?auto_7956 ?auto_7952 ) ) ( not ( = ?auto_7942 ?auto_7943 ) ) ( not ( = ?auto_7955 ?auto_7942 ) ) ( not ( = ?auto_7950 ?auto_7942 ) ) ( HOIST-AT ?auto_7951 ?auto_7942 ) ( not ( = ?auto_7945 ?auto_7951 ) ) ( not ( = ?auto_7944 ?auto_7951 ) ) ( not ( = ?auto_7953 ?auto_7951 ) ) ( AVAILABLE ?auto_7951 ) ( SURFACE-AT ?auto_7948 ?auto_7942 ) ( ON ?auto_7948 ?auto_7941 ) ( CLEAR ?auto_7948 ) ( not ( = ?auto_7939 ?auto_7941 ) ) ( not ( = ?auto_7940 ?auto_7941 ) ) ( not ( = ?auto_7946 ?auto_7941 ) ) ( not ( = ?auto_7948 ?auto_7941 ) ) ( not ( = ?auto_7956 ?auto_7941 ) ) ( not ( = ?auto_7952 ?auto_7941 ) ) ( SURFACE-AT ?auto_7949 ?auto_7943 ) ( CLEAR ?auto_7949 ) ( IS-CRATE ?auto_7952 ) ( not ( = ?auto_7939 ?auto_7949 ) ) ( not ( = ?auto_7940 ?auto_7949 ) ) ( not ( = ?auto_7946 ?auto_7949 ) ) ( not ( = ?auto_7948 ?auto_7949 ) ) ( not ( = ?auto_7956 ?auto_7949 ) ) ( not ( = ?auto_7952 ?auto_7949 ) ) ( not ( = ?auto_7941 ?auto_7949 ) ) ( AVAILABLE ?auto_7945 ) ( not ( = ?auto_7947 ?auto_7943 ) ) ( not ( = ?auto_7955 ?auto_7947 ) ) ( not ( = ?auto_7950 ?auto_7947 ) ) ( not ( = ?auto_7942 ?auto_7947 ) ) ( HOIST-AT ?auto_7958 ?auto_7947 ) ( not ( = ?auto_7945 ?auto_7958 ) ) ( not ( = ?auto_7944 ?auto_7958 ) ) ( not ( = ?auto_7953 ?auto_7958 ) ) ( not ( = ?auto_7951 ?auto_7958 ) ) ( AVAILABLE ?auto_7958 ) ( SURFACE-AT ?auto_7952 ?auto_7947 ) ( ON ?auto_7952 ?auto_7957 ) ( CLEAR ?auto_7952 ) ( not ( = ?auto_7939 ?auto_7957 ) ) ( not ( = ?auto_7940 ?auto_7957 ) ) ( not ( = ?auto_7946 ?auto_7957 ) ) ( not ( = ?auto_7948 ?auto_7957 ) ) ( not ( = ?auto_7956 ?auto_7957 ) ) ( not ( = ?auto_7952 ?auto_7957 ) ) ( not ( = ?auto_7941 ?auto_7957 ) ) ( not ( = ?auto_7949 ?auto_7957 ) ) ( TRUCK-AT ?auto_7954 ?auto_7943 ) )
    :subtasks
    ( ( !DRIVE ?auto_7954 ?auto_7943 ?auto_7947 )
      ( MAKE-ON ?auto_7939 ?auto_7940 )
      ( MAKE-ON-VERIFY ?auto_7939 ?auto_7940 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7961 - SURFACE
      ?auto_7962 - SURFACE
    )
    :vars
    (
      ?auto_7963 - HOIST
      ?auto_7964 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7963 ?auto_7964 ) ( SURFACE-AT ?auto_7962 ?auto_7964 ) ( CLEAR ?auto_7962 ) ( LIFTING ?auto_7963 ?auto_7961 ) ( IS-CRATE ?auto_7961 ) ( not ( = ?auto_7961 ?auto_7962 ) ) )
    :subtasks
    ( ( !DROP ?auto_7963 ?auto_7961 ?auto_7962 ?auto_7964 )
      ( MAKE-ON-VERIFY ?auto_7961 ?auto_7962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7965 - SURFACE
      ?auto_7966 - SURFACE
    )
    :vars
    (
      ?auto_7968 - HOIST
      ?auto_7967 - PLACE
      ?auto_7969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7968 ?auto_7967 ) ( SURFACE-AT ?auto_7966 ?auto_7967 ) ( CLEAR ?auto_7966 ) ( IS-CRATE ?auto_7965 ) ( not ( = ?auto_7965 ?auto_7966 ) ) ( TRUCK-AT ?auto_7969 ?auto_7967 ) ( AVAILABLE ?auto_7968 ) ( IN ?auto_7965 ?auto_7969 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7968 ?auto_7965 ?auto_7969 ?auto_7967 )
      ( MAKE-ON ?auto_7965 ?auto_7966 )
      ( MAKE-ON-VERIFY ?auto_7965 ?auto_7966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7970 - SURFACE
      ?auto_7971 - SURFACE
    )
    :vars
    (
      ?auto_7974 - HOIST
      ?auto_7973 - PLACE
      ?auto_7972 - TRUCK
      ?auto_7975 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7974 ?auto_7973 ) ( SURFACE-AT ?auto_7971 ?auto_7973 ) ( CLEAR ?auto_7971 ) ( IS-CRATE ?auto_7970 ) ( not ( = ?auto_7970 ?auto_7971 ) ) ( AVAILABLE ?auto_7974 ) ( IN ?auto_7970 ?auto_7972 ) ( TRUCK-AT ?auto_7972 ?auto_7975 ) ( not ( = ?auto_7975 ?auto_7973 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7972 ?auto_7975 ?auto_7973 )
      ( MAKE-ON ?auto_7970 ?auto_7971 )
      ( MAKE-ON-VERIFY ?auto_7970 ?auto_7971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7976 - SURFACE
      ?auto_7977 - SURFACE
    )
    :vars
    (
      ?auto_7978 - HOIST
      ?auto_7979 - PLACE
      ?auto_7980 - TRUCK
      ?auto_7981 - PLACE
      ?auto_7982 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7978 ?auto_7979 ) ( SURFACE-AT ?auto_7977 ?auto_7979 ) ( CLEAR ?auto_7977 ) ( IS-CRATE ?auto_7976 ) ( not ( = ?auto_7976 ?auto_7977 ) ) ( AVAILABLE ?auto_7978 ) ( TRUCK-AT ?auto_7980 ?auto_7981 ) ( not ( = ?auto_7981 ?auto_7979 ) ) ( HOIST-AT ?auto_7982 ?auto_7981 ) ( LIFTING ?auto_7982 ?auto_7976 ) ( not ( = ?auto_7978 ?auto_7982 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7982 ?auto_7976 ?auto_7980 ?auto_7981 )
      ( MAKE-ON ?auto_7976 ?auto_7977 )
      ( MAKE-ON-VERIFY ?auto_7976 ?auto_7977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7983 - SURFACE
      ?auto_7984 - SURFACE
    )
    :vars
    (
      ?auto_7988 - HOIST
      ?auto_7985 - PLACE
      ?auto_7987 - TRUCK
      ?auto_7989 - PLACE
      ?auto_7986 - HOIST
      ?auto_7990 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7988 ?auto_7985 ) ( SURFACE-AT ?auto_7984 ?auto_7985 ) ( CLEAR ?auto_7984 ) ( IS-CRATE ?auto_7983 ) ( not ( = ?auto_7983 ?auto_7984 ) ) ( AVAILABLE ?auto_7988 ) ( TRUCK-AT ?auto_7987 ?auto_7989 ) ( not ( = ?auto_7989 ?auto_7985 ) ) ( HOIST-AT ?auto_7986 ?auto_7989 ) ( not ( = ?auto_7988 ?auto_7986 ) ) ( AVAILABLE ?auto_7986 ) ( SURFACE-AT ?auto_7983 ?auto_7989 ) ( ON ?auto_7983 ?auto_7990 ) ( CLEAR ?auto_7983 ) ( not ( = ?auto_7983 ?auto_7990 ) ) ( not ( = ?auto_7984 ?auto_7990 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7986 ?auto_7983 ?auto_7990 ?auto_7989 )
      ( MAKE-ON ?auto_7983 ?auto_7984 )
      ( MAKE-ON-VERIFY ?auto_7983 ?auto_7984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7991 - SURFACE
      ?auto_7992 - SURFACE
    )
    :vars
    (
      ?auto_7998 - HOIST
      ?auto_7995 - PLACE
      ?auto_7996 - PLACE
      ?auto_7997 - HOIST
      ?auto_7993 - SURFACE
      ?auto_7994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7998 ?auto_7995 ) ( SURFACE-AT ?auto_7992 ?auto_7995 ) ( CLEAR ?auto_7992 ) ( IS-CRATE ?auto_7991 ) ( not ( = ?auto_7991 ?auto_7992 ) ) ( AVAILABLE ?auto_7998 ) ( not ( = ?auto_7996 ?auto_7995 ) ) ( HOIST-AT ?auto_7997 ?auto_7996 ) ( not ( = ?auto_7998 ?auto_7997 ) ) ( AVAILABLE ?auto_7997 ) ( SURFACE-AT ?auto_7991 ?auto_7996 ) ( ON ?auto_7991 ?auto_7993 ) ( CLEAR ?auto_7991 ) ( not ( = ?auto_7991 ?auto_7993 ) ) ( not ( = ?auto_7992 ?auto_7993 ) ) ( TRUCK-AT ?auto_7994 ?auto_7995 ) )
    :subtasks
    ( ( !DRIVE ?auto_7994 ?auto_7995 ?auto_7996 )
      ( MAKE-ON ?auto_7991 ?auto_7992 )
      ( MAKE-ON-VERIFY ?auto_7991 ?auto_7992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_7999 - SURFACE
      ?auto_8000 - SURFACE
    )
    :vars
    (
      ?auto_8001 - HOIST
      ?auto_8005 - PLACE
      ?auto_8006 - PLACE
      ?auto_8002 - HOIST
      ?auto_8003 - SURFACE
      ?auto_8004 - TRUCK
      ?auto_8007 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8001 ?auto_8005 ) ( IS-CRATE ?auto_7999 ) ( not ( = ?auto_7999 ?auto_8000 ) ) ( not ( = ?auto_8006 ?auto_8005 ) ) ( HOIST-AT ?auto_8002 ?auto_8006 ) ( not ( = ?auto_8001 ?auto_8002 ) ) ( AVAILABLE ?auto_8002 ) ( SURFACE-AT ?auto_7999 ?auto_8006 ) ( ON ?auto_7999 ?auto_8003 ) ( CLEAR ?auto_7999 ) ( not ( = ?auto_7999 ?auto_8003 ) ) ( not ( = ?auto_8000 ?auto_8003 ) ) ( TRUCK-AT ?auto_8004 ?auto_8005 ) ( SURFACE-AT ?auto_8007 ?auto_8005 ) ( CLEAR ?auto_8007 ) ( LIFTING ?auto_8001 ?auto_8000 ) ( IS-CRATE ?auto_8000 ) ( not ( = ?auto_7999 ?auto_8007 ) ) ( not ( = ?auto_8000 ?auto_8007 ) ) ( not ( = ?auto_8003 ?auto_8007 ) ) )
    :subtasks
    ( ( !DROP ?auto_8001 ?auto_8000 ?auto_8007 ?auto_8005 )
      ( MAKE-ON ?auto_7999 ?auto_8000 )
      ( MAKE-ON-VERIFY ?auto_7999 ?auto_8000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8008 - SURFACE
      ?auto_8009 - SURFACE
    )
    :vars
    (
      ?auto_8012 - HOIST
      ?auto_8011 - PLACE
      ?auto_8015 - PLACE
      ?auto_8014 - HOIST
      ?auto_8010 - SURFACE
      ?auto_8013 - TRUCK
      ?auto_8016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8012 ?auto_8011 ) ( IS-CRATE ?auto_8008 ) ( not ( = ?auto_8008 ?auto_8009 ) ) ( not ( = ?auto_8015 ?auto_8011 ) ) ( HOIST-AT ?auto_8014 ?auto_8015 ) ( not ( = ?auto_8012 ?auto_8014 ) ) ( AVAILABLE ?auto_8014 ) ( SURFACE-AT ?auto_8008 ?auto_8015 ) ( ON ?auto_8008 ?auto_8010 ) ( CLEAR ?auto_8008 ) ( not ( = ?auto_8008 ?auto_8010 ) ) ( not ( = ?auto_8009 ?auto_8010 ) ) ( TRUCK-AT ?auto_8013 ?auto_8011 ) ( SURFACE-AT ?auto_8016 ?auto_8011 ) ( CLEAR ?auto_8016 ) ( IS-CRATE ?auto_8009 ) ( not ( = ?auto_8008 ?auto_8016 ) ) ( not ( = ?auto_8009 ?auto_8016 ) ) ( not ( = ?auto_8010 ?auto_8016 ) ) ( AVAILABLE ?auto_8012 ) ( IN ?auto_8009 ?auto_8013 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8012 ?auto_8009 ?auto_8013 ?auto_8011 )
      ( MAKE-ON ?auto_8008 ?auto_8009 )
      ( MAKE-ON-VERIFY ?auto_8008 ?auto_8009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8017 - SURFACE
      ?auto_8018 - SURFACE
    )
    :vars
    (
      ?auto_8021 - HOIST
      ?auto_8025 - PLACE
      ?auto_8020 - PLACE
      ?auto_8022 - HOIST
      ?auto_8024 - SURFACE
      ?auto_8019 - SURFACE
      ?auto_8023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8021 ?auto_8025 ) ( IS-CRATE ?auto_8017 ) ( not ( = ?auto_8017 ?auto_8018 ) ) ( not ( = ?auto_8020 ?auto_8025 ) ) ( HOIST-AT ?auto_8022 ?auto_8020 ) ( not ( = ?auto_8021 ?auto_8022 ) ) ( AVAILABLE ?auto_8022 ) ( SURFACE-AT ?auto_8017 ?auto_8020 ) ( ON ?auto_8017 ?auto_8024 ) ( CLEAR ?auto_8017 ) ( not ( = ?auto_8017 ?auto_8024 ) ) ( not ( = ?auto_8018 ?auto_8024 ) ) ( SURFACE-AT ?auto_8019 ?auto_8025 ) ( CLEAR ?auto_8019 ) ( IS-CRATE ?auto_8018 ) ( not ( = ?auto_8017 ?auto_8019 ) ) ( not ( = ?auto_8018 ?auto_8019 ) ) ( not ( = ?auto_8024 ?auto_8019 ) ) ( AVAILABLE ?auto_8021 ) ( IN ?auto_8018 ?auto_8023 ) ( TRUCK-AT ?auto_8023 ?auto_8020 ) )
    :subtasks
    ( ( !DRIVE ?auto_8023 ?auto_8020 ?auto_8025 )
      ( MAKE-ON ?auto_8017 ?auto_8018 )
      ( MAKE-ON-VERIFY ?auto_8017 ?auto_8018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8026 - SURFACE
      ?auto_8027 - SURFACE
    )
    :vars
    (
      ?auto_8032 - HOIST
      ?auto_8029 - PLACE
      ?auto_8028 - PLACE
      ?auto_8033 - HOIST
      ?auto_8034 - SURFACE
      ?auto_8031 - SURFACE
      ?auto_8030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8032 ?auto_8029 ) ( IS-CRATE ?auto_8026 ) ( not ( = ?auto_8026 ?auto_8027 ) ) ( not ( = ?auto_8028 ?auto_8029 ) ) ( HOIST-AT ?auto_8033 ?auto_8028 ) ( not ( = ?auto_8032 ?auto_8033 ) ) ( SURFACE-AT ?auto_8026 ?auto_8028 ) ( ON ?auto_8026 ?auto_8034 ) ( CLEAR ?auto_8026 ) ( not ( = ?auto_8026 ?auto_8034 ) ) ( not ( = ?auto_8027 ?auto_8034 ) ) ( SURFACE-AT ?auto_8031 ?auto_8029 ) ( CLEAR ?auto_8031 ) ( IS-CRATE ?auto_8027 ) ( not ( = ?auto_8026 ?auto_8031 ) ) ( not ( = ?auto_8027 ?auto_8031 ) ) ( not ( = ?auto_8034 ?auto_8031 ) ) ( AVAILABLE ?auto_8032 ) ( TRUCK-AT ?auto_8030 ?auto_8028 ) ( LIFTING ?auto_8033 ?auto_8027 ) )
    :subtasks
    ( ( !LOAD ?auto_8033 ?auto_8027 ?auto_8030 ?auto_8028 )
      ( MAKE-ON ?auto_8026 ?auto_8027 )
      ( MAKE-ON-VERIFY ?auto_8026 ?auto_8027 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8035 - SURFACE
      ?auto_8036 - SURFACE
    )
    :vars
    (
      ?auto_8041 - HOIST
      ?auto_8039 - PLACE
      ?auto_8037 - PLACE
      ?auto_8043 - HOIST
      ?auto_8040 - SURFACE
      ?auto_8042 - SURFACE
      ?auto_8038 - TRUCK
      ?auto_8044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8041 ?auto_8039 ) ( IS-CRATE ?auto_8035 ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8037 ?auto_8039 ) ) ( HOIST-AT ?auto_8043 ?auto_8037 ) ( not ( = ?auto_8041 ?auto_8043 ) ) ( SURFACE-AT ?auto_8035 ?auto_8037 ) ( ON ?auto_8035 ?auto_8040 ) ( CLEAR ?auto_8035 ) ( not ( = ?auto_8035 ?auto_8040 ) ) ( not ( = ?auto_8036 ?auto_8040 ) ) ( SURFACE-AT ?auto_8042 ?auto_8039 ) ( CLEAR ?auto_8042 ) ( IS-CRATE ?auto_8036 ) ( not ( = ?auto_8035 ?auto_8042 ) ) ( not ( = ?auto_8036 ?auto_8042 ) ) ( not ( = ?auto_8040 ?auto_8042 ) ) ( AVAILABLE ?auto_8041 ) ( TRUCK-AT ?auto_8038 ?auto_8037 ) ( AVAILABLE ?auto_8043 ) ( SURFACE-AT ?auto_8036 ?auto_8037 ) ( ON ?auto_8036 ?auto_8044 ) ( CLEAR ?auto_8036 ) ( not ( = ?auto_8035 ?auto_8044 ) ) ( not ( = ?auto_8036 ?auto_8044 ) ) ( not ( = ?auto_8040 ?auto_8044 ) ) ( not ( = ?auto_8042 ?auto_8044 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8043 ?auto_8036 ?auto_8044 ?auto_8037 )
      ( MAKE-ON ?auto_8035 ?auto_8036 )
      ( MAKE-ON-VERIFY ?auto_8035 ?auto_8036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8045 - SURFACE
      ?auto_8046 - SURFACE
    )
    :vars
    (
      ?auto_8053 - HOIST
      ?auto_8050 - PLACE
      ?auto_8049 - PLACE
      ?auto_8047 - HOIST
      ?auto_8052 - SURFACE
      ?auto_8051 - SURFACE
      ?auto_8054 - SURFACE
      ?auto_8048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8053 ?auto_8050 ) ( IS-CRATE ?auto_8045 ) ( not ( = ?auto_8045 ?auto_8046 ) ) ( not ( = ?auto_8049 ?auto_8050 ) ) ( HOIST-AT ?auto_8047 ?auto_8049 ) ( not ( = ?auto_8053 ?auto_8047 ) ) ( SURFACE-AT ?auto_8045 ?auto_8049 ) ( ON ?auto_8045 ?auto_8052 ) ( CLEAR ?auto_8045 ) ( not ( = ?auto_8045 ?auto_8052 ) ) ( not ( = ?auto_8046 ?auto_8052 ) ) ( SURFACE-AT ?auto_8051 ?auto_8050 ) ( CLEAR ?auto_8051 ) ( IS-CRATE ?auto_8046 ) ( not ( = ?auto_8045 ?auto_8051 ) ) ( not ( = ?auto_8046 ?auto_8051 ) ) ( not ( = ?auto_8052 ?auto_8051 ) ) ( AVAILABLE ?auto_8053 ) ( AVAILABLE ?auto_8047 ) ( SURFACE-AT ?auto_8046 ?auto_8049 ) ( ON ?auto_8046 ?auto_8054 ) ( CLEAR ?auto_8046 ) ( not ( = ?auto_8045 ?auto_8054 ) ) ( not ( = ?auto_8046 ?auto_8054 ) ) ( not ( = ?auto_8052 ?auto_8054 ) ) ( not ( = ?auto_8051 ?auto_8054 ) ) ( TRUCK-AT ?auto_8048 ?auto_8050 ) )
    :subtasks
    ( ( !DRIVE ?auto_8048 ?auto_8050 ?auto_8049 )
      ( MAKE-ON ?auto_8045 ?auto_8046 )
      ( MAKE-ON-VERIFY ?auto_8045 ?auto_8046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8055 - SURFACE
      ?auto_8056 - SURFACE
    )
    :vars
    (
      ?auto_8060 - HOIST
      ?auto_8062 - PLACE
      ?auto_8063 - PLACE
      ?auto_8064 - HOIST
      ?auto_8061 - SURFACE
      ?auto_8058 - SURFACE
      ?auto_8059 - SURFACE
      ?auto_8057 - TRUCK
      ?auto_8065 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8060 ?auto_8062 ) ( IS-CRATE ?auto_8055 ) ( not ( = ?auto_8055 ?auto_8056 ) ) ( not ( = ?auto_8063 ?auto_8062 ) ) ( HOIST-AT ?auto_8064 ?auto_8063 ) ( not ( = ?auto_8060 ?auto_8064 ) ) ( SURFACE-AT ?auto_8055 ?auto_8063 ) ( ON ?auto_8055 ?auto_8061 ) ( CLEAR ?auto_8055 ) ( not ( = ?auto_8055 ?auto_8061 ) ) ( not ( = ?auto_8056 ?auto_8061 ) ) ( IS-CRATE ?auto_8056 ) ( not ( = ?auto_8055 ?auto_8058 ) ) ( not ( = ?auto_8056 ?auto_8058 ) ) ( not ( = ?auto_8061 ?auto_8058 ) ) ( AVAILABLE ?auto_8064 ) ( SURFACE-AT ?auto_8056 ?auto_8063 ) ( ON ?auto_8056 ?auto_8059 ) ( CLEAR ?auto_8056 ) ( not ( = ?auto_8055 ?auto_8059 ) ) ( not ( = ?auto_8056 ?auto_8059 ) ) ( not ( = ?auto_8061 ?auto_8059 ) ) ( not ( = ?auto_8058 ?auto_8059 ) ) ( TRUCK-AT ?auto_8057 ?auto_8062 ) ( SURFACE-AT ?auto_8065 ?auto_8062 ) ( CLEAR ?auto_8065 ) ( LIFTING ?auto_8060 ?auto_8058 ) ( IS-CRATE ?auto_8058 ) ( not ( = ?auto_8055 ?auto_8065 ) ) ( not ( = ?auto_8056 ?auto_8065 ) ) ( not ( = ?auto_8061 ?auto_8065 ) ) ( not ( = ?auto_8058 ?auto_8065 ) ) ( not ( = ?auto_8059 ?auto_8065 ) ) )
    :subtasks
    ( ( !DROP ?auto_8060 ?auto_8058 ?auto_8065 ?auto_8062 )
      ( MAKE-ON ?auto_8055 ?auto_8056 )
      ( MAKE-ON-VERIFY ?auto_8055 ?auto_8056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8066 - SURFACE
      ?auto_8067 - SURFACE
    )
    :vars
    (
      ?auto_8071 - HOIST
      ?auto_8072 - PLACE
      ?auto_8070 - PLACE
      ?auto_8076 - HOIST
      ?auto_8073 - SURFACE
      ?auto_8069 - SURFACE
      ?auto_8068 - SURFACE
      ?auto_8074 - TRUCK
      ?auto_8075 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8071 ?auto_8072 ) ( IS-CRATE ?auto_8066 ) ( not ( = ?auto_8066 ?auto_8067 ) ) ( not ( = ?auto_8070 ?auto_8072 ) ) ( HOIST-AT ?auto_8076 ?auto_8070 ) ( not ( = ?auto_8071 ?auto_8076 ) ) ( SURFACE-AT ?auto_8066 ?auto_8070 ) ( ON ?auto_8066 ?auto_8073 ) ( CLEAR ?auto_8066 ) ( not ( = ?auto_8066 ?auto_8073 ) ) ( not ( = ?auto_8067 ?auto_8073 ) ) ( IS-CRATE ?auto_8067 ) ( not ( = ?auto_8066 ?auto_8069 ) ) ( not ( = ?auto_8067 ?auto_8069 ) ) ( not ( = ?auto_8073 ?auto_8069 ) ) ( AVAILABLE ?auto_8076 ) ( SURFACE-AT ?auto_8067 ?auto_8070 ) ( ON ?auto_8067 ?auto_8068 ) ( CLEAR ?auto_8067 ) ( not ( = ?auto_8066 ?auto_8068 ) ) ( not ( = ?auto_8067 ?auto_8068 ) ) ( not ( = ?auto_8073 ?auto_8068 ) ) ( not ( = ?auto_8069 ?auto_8068 ) ) ( TRUCK-AT ?auto_8074 ?auto_8072 ) ( SURFACE-AT ?auto_8075 ?auto_8072 ) ( CLEAR ?auto_8075 ) ( IS-CRATE ?auto_8069 ) ( not ( = ?auto_8066 ?auto_8075 ) ) ( not ( = ?auto_8067 ?auto_8075 ) ) ( not ( = ?auto_8073 ?auto_8075 ) ) ( not ( = ?auto_8069 ?auto_8075 ) ) ( not ( = ?auto_8068 ?auto_8075 ) ) ( AVAILABLE ?auto_8071 ) ( IN ?auto_8069 ?auto_8074 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8071 ?auto_8069 ?auto_8074 ?auto_8072 )
      ( MAKE-ON ?auto_8066 ?auto_8067 )
      ( MAKE-ON-VERIFY ?auto_8066 ?auto_8067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8077 - SURFACE
      ?auto_8078 - SURFACE
    )
    :vars
    (
      ?auto_8080 - HOIST
      ?auto_8082 - PLACE
      ?auto_8081 - PLACE
      ?auto_8084 - HOIST
      ?auto_8087 - SURFACE
      ?auto_8083 - SURFACE
      ?auto_8079 - SURFACE
      ?auto_8086 - SURFACE
      ?auto_8085 - TRUCK
      ?auto_8088 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8080 ?auto_8082 ) ( IS-CRATE ?auto_8077 ) ( not ( = ?auto_8077 ?auto_8078 ) ) ( not ( = ?auto_8081 ?auto_8082 ) ) ( HOIST-AT ?auto_8084 ?auto_8081 ) ( not ( = ?auto_8080 ?auto_8084 ) ) ( SURFACE-AT ?auto_8077 ?auto_8081 ) ( ON ?auto_8077 ?auto_8087 ) ( CLEAR ?auto_8077 ) ( not ( = ?auto_8077 ?auto_8087 ) ) ( not ( = ?auto_8078 ?auto_8087 ) ) ( IS-CRATE ?auto_8078 ) ( not ( = ?auto_8077 ?auto_8083 ) ) ( not ( = ?auto_8078 ?auto_8083 ) ) ( not ( = ?auto_8087 ?auto_8083 ) ) ( AVAILABLE ?auto_8084 ) ( SURFACE-AT ?auto_8078 ?auto_8081 ) ( ON ?auto_8078 ?auto_8079 ) ( CLEAR ?auto_8078 ) ( not ( = ?auto_8077 ?auto_8079 ) ) ( not ( = ?auto_8078 ?auto_8079 ) ) ( not ( = ?auto_8087 ?auto_8079 ) ) ( not ( = ?auto_8083 ?auto_8079 ) ) ( SURFACE-AT ?auto_8086 ?auto_8082 ) ( CLEAR ?auto_8086 ) ( IS-CRATE ?auto_8083 ) ( not ( = ?auto_8077 ?auto_8086 ) ) ( not ( = ?auto_8078 ?auto_8086 ) ) ( not ( = ?auto_8087 ?auto_8086 ) ) ( not ( = ?auto_8083 ?auto_8086 ) ) ( not ( = ?auto_8079 ?auto_8086 ) ) ( AVAILABLE ?auto_8080 ) ( IN ?auto_8083 ?auto_8085 ) ( TRUCK-AT ?auto_8085 ?auto_8088 ) ( not ( = ?auto_8088 ?auto_8082 ) ) ( not ( = ?auto_8081 ?auto_8088 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8085 ?auto_8088 ?auto_8082 )
      ( MAKE-ON ?auto_8077 ?auto_8078 )
      ( MAKE-ON-VERIFY ?auto_8077 ?auto_8078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8089 - SURFACE
      ?auto_8090 - SURFACE
    )
    :vars
    (
      ?auto_8099 - HOIST
      ?auto_8094 - PLACE
      ?auto_8096 - PLACE
      ?auto_8092 - HOIST
      ?auto_8091 - SURFACE
      ?auto_8100 - SURFACE
      ?auto_8093 - SURFACE
      ?auto_8095 - SURFACE
      ?auto_8098 - TRUCK
      ?auto_8097 - PLACE
      ?auto_8101 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8099 ?auto_8094 ) ( IS-CRATE ?auto_8089 ) ( not ( = ?auto_8089 ?auto_8090 ) ) ( not ( = ?auto_8096 ?auto_8094 ) ) ( HOIST-AT ?auto_8092 ?auto_8096 ) ( not ( = ?auto_8099 ?auto_8092 ) ) ( SURFACE-AT ?auto_8089 ?auto_8096 ) ( ON ?auto_8089 ?auto_8091 ) ( CLEAR ?auto_8089 ) ( not ( = ?auto_8089 ?auto_8091 ) ) ( not ( = ?auto_8090 ?auto_8091 ) ) ( IS-CRATE ?auto_8090 ) ( not ( = ?auto_8089 ?auto_8100 ) ) ( not ( = ?auto_8090 ?auto_8100 ) ) ( not ( = ?auto_8091 ?auto_8100 ) ) ( AVAILABLE ?auto_8092 ) ( SURFACE-AT ?auto_8090 ?auto_8096 ) ( ON ?auto_8090 ?auto_8093 ) ( CLEAR ?auto_8090 ) ( not ( = ?auto_8089 ?auto_8093 ) ) ( not ( = ?auto_8090 ?auto_8093 ) ) ( not ( = ?auto_8091 ?auto_8093 ) ) ( not ( = ?auto_8100 ?auto_8093 ) ) ( SURFACE-AT ?auto_8095 ?auto_8094 ) ( CLEAR ?auto_8095 ) ( IS-CRATE ?auto_8100 ) ( not ( = ?auto_8089 ?auto_8095 ) ) ( not ( = ?auto_8090 ?auto_8095 ) ) ( not ( = ?auto_8091 ?auto_8095 ) ) ( not ( = ?auto_8100 ?auto_8095 ) ) ( not ( = ?auto_8093 ?auto_8095 ) ) ( AVAILABLE ?auto_8099 ) ( TRUCK-AT ?auto_8098 ?auto_8097 ) ( not ( = ?auto_8097 ?auto_8094 ) ) ( not ( = ?auto_8096 ?auto_8097 ) ) ( HOIST-AT ?auto_8101 ?auto_8097 ) ( LIFTING ?auto_8101 ?auto_8100 ) ( not ( = ?auto_8099 ?auto_8101 ) ) ( not ( = ?auto_8092 ?auto_8101 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8101 ?auto_8100 ?auto_8098 ?auto_8097 )
      ( MAKE-ON ?auto_8089 ?auto_8090 )
      ( MAKE-ON-VERIFY ?auto_8089 ?auto_8090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8102 - SURFACE
      ?auto_8103 - SURFACE
    )
    :vars
    (
      ?auto_8109 - HOIST
      ?auto_8106 - PLACE
      ?auto_8105 - PLACE
      ?auto_8104 - HOIST
      ?auto_8111 - SURFACE
      ?auto_8114 - SURFACE
      ?auto_8107 - SURFACE
      ?auto_8113 - SURFACE
      ?auto_8112 - TRUCK
      ?auto_8108 - PLACE
      ?auto_8110 - HOIST
      ?auto_8115 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8109 ?auto_8106 ) ( IS-CRATE ?auto_8102 ) ( not ( = ?auto_8102 ?auto_8103 ) ) ( not ( = ?auto_8105 ?auto_8106 ) ) ( HOIST-AT ?auto_8104 ?auto_8105 ) ( not ( = ?auto_8109 ?auto_8104 ) ) ( SURFACE-AT ?auto_8102 ?auto_8105 ) ( ON ?auto_8102 ?auto_8111 ) ( CLEAR ?auto_8102 ) ( not ( = ?auto_8102 ?auto_8111 ) ) ( not ( = ?auto_8103 ?auto_8111 ) ) ( IS-CRATE ?auto_8103 ) ( not ( = ?auto_8102 ?auto_8114 ) ) ( not ( = ?auto_8103 ?auto_8114 ) ) ( not ( = ?auto_8111 ?auto_8114 ) ) ( AVAILABLE ?auto_8104 ) ( SURFACE-AT ?auto_8103 ?auto_8105 ) ( ON ?auto_8103 ?auto_8107 ) ( CLEAR ?auto_8103 ) ( not ( = ?auto_8102 ?auto_8107 ) ) ( not ( = ?auto_8103 ?auto_8107 ) ) ( not ( = ?auto_8111 ?auto_8107 ) ) ( not ( = ?auto_8114 ?auto_8107 ) ) ( SURFACE-AT ?auto_8113 ?auto_8106 ) ( CLEAR ?auto_8113 ) ( IS-CRATE ?auto_8114 ) ( not ( = ?auto_8102 ?auto_8113 ) ) ( not ( = ?auto_8103 ?auto_8113 ) ) ( not ( = ?auto_8111 ?auto_8113 ) ) ( not ( = ?auto_8114 ?auto_8113 ) ) ( not ( = ?auto_8107 ?auto_8113 ) ) ( AVAILABLE ?auto_8109 ) ( TRUCK-AT ?auto_8112 ?auto_8108 ) ( not ( = ?auto_8108 ?auto_8106 ) ) ( not ( = ?auto_8105 ?auto_8108 ) ) ( HOIST-AT ?auto_8110 ?auto_8108 ) ( not ( = ?auto_8109 ?auto_8110 ) ) ( not ( = ?auto_8104 ?auto_8110 ) ) ( AVAILABLE ?auto_8110 ) ( SURFACE-AT ?auto_8114 ?auto_8108 ) ( ON ?auto_8114 ?auto_8115 ) ( CLEAR ?auto_8114 ) ( not ( = ?auto_8102 ?auto_8115 ) ) ( not ( = ?auto_8103 ?auto_8115 ) ) ( not ( = ?auto_8111 ?auto_8115 ) ) ( not ( = ?auto_8114 ?auto_8115 ) ) ( not ( = ?auto_8107 ?auto_8115 ) ) ( not ( = ?auto_8113 ?auto_8115 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8110 ?auto_8114 ?auto_8115 ?auto_8108 )
      ( MAKE-ON ?auto_8102 ?auto_8103 )
      ( MAKE-ON-VERIFY ?auto_8102 ?auto_8103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8116 - SURFACE
      ?auto_8117 - SURFACE
    )
    :vars
    (
      ?auto_8118 - HOIST
      ?auto_8123 - PLACE
      ?auto_8125 - PLACE
      ?auto_8124 - HOIST
      ?auto_8128 - SURFACE
      ?auto_8120 - SURFACE
      ?auto_8121 - SURFACE
      ?auto_8122 - SURFACE
      ?auto_8126 - PLACE
      ?auto_8127 - HOIST
      ?auto_8129 - SURFACE
      ?auto_8119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8118 ?auto_8123 ) ( IS-CRATE ?auto_8116 ) ( not ( = ?auto_8116 ?auto_8117 ) ) ( not ( = ?auto_8125 ?auto_8123 ) ) ( HOIST-AT ?auto_8124 ?auto_8125 ) ( not ( = ?auto_8118 ?auto_8124 ) ) ( SURFACE-AT ?auto_8116 ?auto_8125 ) ( ON ?auto_8116 ?auto_8128 ) ( CLEAR ?auto_8116 ) ( not ( = ?auto_8116 ?auto_8128 ) ) ( not ( = ?auto_8117 ?auto_8128 ) ) ( IS-CRATE ?auto_8117 ) ( not ( = ?auto_8116 ?auto_8120 ) ) ( not ( = ?auto_8117 ?auto_8120 ) ) ( not ( = ?auto_8128 ?auto_8120 ) ) ( AVAILABLE ?auto_8124 ) ( SURFACE-AT ?auto_8117 ?auto_8125 ) ( ON ?auto_8117 ?auto_8121 ) ( CLEAR ?auto_8117 ) ( not ( = ?auto_8116 ?auto_8121 ) ) ( not ( = ?auto_8117 ?auto_8121 ) ) ( not ( = ?auto_8128 ?auto_8121 ) ) ( not ( = ?auto_8120 ?auto_8121 ) ) ( SURFACE-AT ?auto_8122 ?auto_8123 ) ( CLEAR ?auto_8122 ) ( IS-CRATE ?auto_8120 ) ( not ( = ?auto_8116 ?auto_8122 ) ) ( not ( = ?auto_8117 ?auto_8122 ) ) ( not ( = ?auto_8128 ?auto_8122 ) ) ( not ( = ?auto_8120 ?auto_8122 ) ) ( not ( = ?auto_8121 ?auto_8122 ) ) ( AVAILABLE ?auto_8118 ) ( not ( = ?auto_8126 ?auto_8123 ) ) ( not ( = ?auto_8125 ?auto_8126 ) ) ( HOIST-AT ?auto_8127 ?auto_8126 ) ( not ( = ?auto_8118 ?auto_8127 ) ) ( not ( = ?auto_8124 ?auto_8127 ) ) ( AVAILABLE ?auto_8127 ) ( SURFACE-AT ?auto_8120 ?auto_8126 ) ( ON ?auto_8120 ?auto_8129 ) ( CLEAR ?auto_8120 ) ( not ( = ?auto_8116 ?auto_8129 ) ) ( not ( = ?auto_8117 ?auto_8129 ) ) ( not ( = ?auto_8128 ?auto_8129 ) ) ( not ( = ?auto_8120 ?auto_8129 ) ) ( not ( = ?auto_8121 ?auto_8129 ) ) ( not ( = ?auto_8122 ?auto_8129 ) ) ( TRUCK-AT ?auto_8119 ?auto_8123 ) )
    :subtasks
    ( ( !DRIVE ?auto_8119 ?auto_8123 ?auto_8126 )
      ( MAKE-ON ?auto_8116 ?auto_8117 )
      ( MAKE-ON-VERIFY ?auto_8116 ?auto_8117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8130 - SURFACE
      ?auto_8131 - SURFACE
    )
    :vars
    (
      ?auto_8142 - HOIST
      ?auto_8134 - PLACE
      ?auto_8132 - PLACE
      ?auto_8138 - HOIST
      ?auto_8143 - SURFACE
      ?auto_8137 - SURFACE
      ?auto_8141 - SURFACE
      ?auto_8136 - SURFACE
      ?auto_8135 - PLACE
      ?auto_8133 - HOIST
      ?auto_8140 - SURFACE
      ?auto_8139 - TRUCK
      ?auto_8144 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8142 ?auto_8134 ) ( IS-CRATE ?auto_8130 ) ( not ( = ?auto_8130 ?auto_8131 ) ) ( not ( = ?auto_8132 ?auto_8134 ) ) ( HOIST-AT ?auto_8138 ?auto_8132 ) ( not ( = ?auto_8142 ?auto_8138 ) ) ( SURFACE-AT ?auto_8130 ?auto_8132 ) ( ON ?auto_8130 ?auto_8143 ) ( CLEAR ?auto_8130 ) ( not ( = ?auto_8130 ?auto_8143 ) ) ( not ( = ?auto_8131 ?auto_8143 ) ) ( IS-CRATE ?auto_8131 ) ( not ( = ?auto_8130 ?auto_8137 ) ) ( not ( = ?auto_8131 ?auto_8137 ) ) ( not ( = ?auto_8143 ?auto_8137 ) ) ( AVAILABLE ?auto_8138 ) ( SURFACE-AT ?auto_8131 ?auto_8132 ) ( ON ?auto_8131 ?auto_8141 ) ( CLEAR ?auto_8131 ) ( not ( = ?auto_8130 ?auto_8141 ) ) ( not ( = ?auto_8131 ?auto_8141 ) ) ( not ( = ?auto_8143 ?auto_8141 ) ) ( not ( = ?auto_8137 ?auto_8141 ) ) ( IS-CRATE ?auto_8137 ) ( not ( = ?auto_8130 ?auto_8136 ) ) ( not ( = ?auto_8131 ?auto_8136 ) ) ( not ( = ?auto_8143 ?auto_8136 ) ) ( not ( = ?auto_8137 ?auto_8136 ) ) ( not ( = ?auto_8141 ?auto_8136 ) ) ( not ( = ?auto_8135 ?auto_8134 ) ) ( not ( = ?auto_8132 ?auto_8135 ) ) ( HOIST-AT ?auto_8133 ?auto_8135 ) ( not ( = ?auto_8142 ?auto_8133 ) ) ( not ( = ?auto_8138 ?auto_8133 ) ) ( AVAILABLE ?auto_8133 ) ( SURFACE-AT ?auto_8137 ?auto_8135 ) ( ON ?auto_8137 ?auto_8140 ) ( CLEAR ?auto_8137 ) ( not ( = ?auto_8130 ?auto_8140 ) ) ( not ( = ?auto_8131 ?auto_8140 ) ) ( not ( = ?auto_8143 ?auto_8140 ) ) ( not ( = ?auto_8137 ?auto_8140 ) ) ( not ( = ?auto_8141 ?auto_8140 ) ) ( not ( = ?auto_8136 ?auto_8140 ) ) ( TRUCK-AT ?auto_8139 ?auto_8134 ) ( SURFACE-AT ?auto_8144 ?auto_8134 ) ( CLEAR ?auto_8144 ) ( LIFTING ?auto_8142 ?auto_8136 ) ( IS-CRATE ?auto_8136 ) ( not ( = ?auto_8130 ?auto_8144 ) ) ( not ( = ?auto_8131 ?auto_8144 ) ) ( not ( = ?auto_8143 ?auto_8144 ) ) ( not ( = ?auto_8137 ?auto_8144 ) ) ( not ( = ?auto_8141 ?auto_8144 ) ) ( not ( = ?auto_8136 ?auto_8144 ) ) ( not ( = ?auto_8140 ?auto_8144 ) ) )
    :subtasks
    ( ( !DROP ?auto_8142 ?auto_8136 ?auto_8144 ?auto_8134 )
      ( MAKE-ON ?auto_8130 ?auto_8131 )
      ( MAKE-ON-VERIFY ?auto_8130 ?auto_8131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8145 - SURFACE
      ?auto_8146 - SURFACE
    )
    :vars
    (
      ?auto_8158 - HOIST
      ?auto_8155 - PLACE
      ?auto_8154 - PLACE
      ?auto_8157 - HOIST
      ?auto_8150 - SURFACE
      ?auto_8151 - SURFACE
      ?auto_8156 - SURFACE
      ?auto_8152 - SURFACE
      ?auto_8147 - PLACE
      ?auto_8148 - HOIST
      ?auto_8159 - SURFACE
      ?auto_8149 - TRUCK
      ?auto_8153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8158 ?auto_8155 ) ( IS-CRATE ?auto_8145 ) ( not ( = ?auto_8145 ?auto_8146 ) ) ( not ( = ?auto_8154 ?auto_8155 ) ) ( HOIST-AT ?auto_8157 ?auto_8154 ) ( not ( = ?auto_8158 ?auto_8157 ) ) ( SURFACE-AT ?auto_8145 ?auto_8154 ) ( ON ?auto_8145 ?auto_8150 ) ( CLEAR ?auto_8145 ) ( not ( = ?auto_8145 ?auto_8150 ) ) ( not ( = ?auto_8146 ?auto_8150 ) ) ( IS-CRATE ?auto_8146 ) ( not ( = ?auto_8145 ?auto_8151 ) ) ( not ( = ?auto_8146 ?auto_8151 ) ) ( not ( = ?auto_8150 ?auto_8151 ) ) ( AVAILABLE ?auto_8157 ) ( SURFACE-AT ?auto_8146 ?auto_8154 ) ( ON ?auto_8146 ?auto_8156 ) ( CLEAR ?auto_8146 ) ( not ( = ?auto_8145 ?auto_8156 ) ) ( not ( = ?auto_8146 ?auto_8156 ) ) ( not ( = ?auto_8150 ?auto_8156 ) ) ( not ( = ?auto_8151 ?auto_8156 ) ) ( IS-CRATE ?auto_8151 ) ( not ( = ?auto_8145 ?auto_8152 ) ) ( not ( = ?auto_8146 ?auto_8152 ) ) ( not ( = ?auto_8150 ?auto_8152 ) ) ( not ( = ?auto_8151 ?auto_8152 ) ) ( not ( = ?auto_8156 ?auto_8152 ) ) ( not ( = ?auto_8147 ?auto_8155 ) ) ( not ( = ?auto_8154 ?auto_8147 ) ) ( HOIST-AT ?auto_8148 ?auto_8147 ) ( not ( = ?auto_8158 ?auto_8148 ) ) ( not ( = ?auto_8157 ?auto_8148 ) ) ( AVAILABLE ?auto_8148 ) ( SURFACE-AT ?auto_8151 ?auto_8147 ) ( ON ?auto_8151 ?auto_8159 ) ( CLEAR ?auto_8151 ) ( not ( = ?auto_8145 ?auto_8159 ) ) ( not ( = ?auto_8146 ?auto_8159 ) ) ( not ( = ?auto_8150 ?auto_8159 ) ) ( not ( = ?auto_8151 ?auto_8159 ) ) ( not ( = ?auto_8156 ?auto_8159 ) ) ( not ( = ?auto_8152 ?auto_8159 ) ) ( TRUCK-AT ?auto_8149 ?auto_8155 ) ( SURFACE-AT ?auto_8153 ?auto_8155 ) ( CLEAR ?auto_8153 ) ( IS-CRATE ?auto_8152 ) ( not ( = ?auto_8145 ?auto_8153 ) ) ( not ( = ?auto_8146 ?auto_8153 ) ) ( not ( = ?auto_8150 ?auto_8153 ) ) ( not ( = ?auto_8151 ?auto_8153 ) ) ( not ( = ?auto_8156 ?auto_8153 ) ) ( not ( = ?auto_8152 ?auto_8153 ) ) ( not ( = ?auto_8159 ?auto_8153 ) ) ( AVAILABLE ?auto_8158 ) ( IN ?auto_8152 ?auto_8149 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8158 ?auto_8152 ?auto_8149 ?auto_8155 )
      ( MAKE-ON ?auto_8145 ?auto_8146 )
      ( MAKE-ON-VERIFY ?auto_8145 ?auto_8146 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8160 - SURFACE
      ?auto_8161 - SURFACE
    )
    :vars
    (
      ?auto_8168 - HOIST
      ?auto_8172 - PLACE
      ?auto_8163 - PLACE
      ?auto_8167 - HOIST
      ?auto_8165 - SURFACE
      ?auto_8164 - SURFACE
      ?auto_8166 - SURFACE
      ?auto_8170 - SURFACE
      ?auto_8162 - PLACE
      ?auto_8174 - HOIST
      ?auto_8173 - SURFACE
      ?auto_8171 - SURFACE
      ?auto_8169 - TRUCK
      ?auto_8175 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8168 ?auto_8172 ) ( IS-CRATE ?auto_8160 ) ( not ( = ?auto_8160 ?auto_8161 ) ) ( not ( = ?auto_8163 ?auto_8172 ) ) ( HOIST-AT ?auto_8167 ?auto_8163 ) ( not ( = ?auto_8168 ?auto_8167 ) ) ( SURFACE-AT ?auto_8160 ?auto_8163 ) ( ON ?auto_8160 ?auto_8165 ) ( CLEAR ?auto_8160 ) ( not ( = ?auto_8160 ?auto_8165 ) ) ( not ( = ?auto_8161 ?auto_8165 ) ) ( IS-CRATE ?auto_8161 ) ( not ( = ?auto_8160 ?auto_8164 ) ) ( not ( = ?auto_8161 ?auto_8164 ) ) ( not ( = ?auto_8165 ?auto_8164 ) ) ( AVAILABLE ?auto_8167 ) ( SURFACE-AT ?auto_8161 ?auto_8163 ) ( ON ?auto_8161 ?auto_8166 ) ( CLEAR ?auto_8161 ) ( not ( = ?auto_8160 ?auto_8166 ) ) ( not ( = ?auto_8161 ?auto_8166 ) ) ( not ( = ?auto_8165 ?auto_8166 ) ) ( not ( = ?auto_8164 ?auto_8166 ) ) ( IS-CRATE ?auto_8164 ) ( not ( = ?auto_8160 ?auto_8170 ) ) ( not ( = ?auto_8161 ?auto_8170 ) ) ( not ( = ?auto_8165 ?auto_8170 ) ) ( not ( = ?auto_8164 ?auto_8170 ) ) ( not ( = ?auto_8166 ?auto_8170 ) ) ( not ( = ?auto_8162 ?auto_8172 ) ) ( not ( = ?auto_8163 ?auto_8162 ) ) ( HOIST-AT ?auto_8174 ?auto_8162 ) ( not ( = ?auto_8168 ?auto_8174 ) ) ( not ( = ?auto_8167 ?auto_8174 ) ) ( AVAILABLE ?auto_8174 ) ( SURFACE-AT ?auto_8164 ?auto_8162 ) ( ON ?auto_8164 ?auto_8173 ) ( CLEAR ?auto_8164 ) ( not ( = ?auto_8160 ?auto_8173 ) ) ( not ( = ?auto_8161 ?auto_8173 ) ) ( not ( = ?auto_8165 ?auto_8173 ) ) ( not ( = ?auto_8164 ?auto_8173 ) ) ( not ( = ?auto_8166 ?auto_8173 ) ) ( not ( = ?auto_8170 ?auto_8173 ) ) ( SURFACE-AT ?auto_8171 ?auto_8172 ) ( CLEAR ?auto_8171 ) ( IS-CRATE ?auto_8170 ) ( not ( = ?auto_8160 ?auto_8171 ) ) ( not ( = ?auto_8161 ?auto_8171 ) ) ( not ( = ?auto_8165 ?auto_8171 ) ) ( not ( = ?auto_8164 ?auto_8171 ) ) ( not ( = ?auto_8166 ?auto_8171 ) ) ( not ( = ?auto_8170 ?auto_8171 ) ) ( not ( = ?auto_8173 ?auto_8171 ) ) ( AVAILABLE ?auto_8168 ) ( IN ?auto_8170 ?auto_8169 ) ( TRUCK-AT ?auto_8169 ?auto_8175 ) ( not ( = ?auto_8175 ?auto_8172 ) ) ( not ( = ?auto_8163 ?auto_8175 ) ) ( not ( = ?auto_8162 ?auto_8175 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8169 ?auto_8175 ?auto_8172 )
      ( MAKE-ON ?auto_8160 ?auto_8161 )
      ( MAKE-ON-VERIFY ?auto_8160 ?auto_8161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8176 - SURFACE
      ?auto_8177 - SURFACE
    )
    :vars
    (
      ?auto_8188 - HOIST
      ?auto_8182 - PLACE
      ?auto_8189 - PLACE
      ?auto_8178 - HOIST
      ?auto_8183 - SURFACE
      ?auto_8179 - SURFACE
      ?auto_8191 - SURFACE
      ?auto_8184 - SURFACE
      ?auto_8185 - PLACE
      ?auto_8181 - HOIST
      ?auto_8187 - SURFACE
      ?auto_8190 - SURFACE
      ?auto_8180 - TRUCK
      ?auto_8186 - PLACE
      ?auto_8192 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8188 ?auto_8182 ) ( IS-CRATE ?auto_8176 ) ( not ( = ?auto_8176 ?auto_8177 ) ) ( not ( = ?auto_8189 ?auto_8182 ) ) ( HOIST-AT ?auto_8178 ?auto_8189 ) ( not ( = ?auto_8188 ?auto_8178 ) ) ( SURFACE-AT ?auto_8176 ?auto_8189 ) ( ON ?auto_8176 ?auto_8183 ) ( CLEAR ?auto_8176 ) ( not ( = ?auto_8176 ?auto_8183 ) ) ( not ( = ?auto_8177 ?auto_8183 ) ) ( IS-CRATE ?auto_8177 ) ( not ( = ?auto_8176 ?auto_8179 ) ) ( not ( = ?auto_8177 ?auto_8179 ) ) ( not ( = ?auto_8183 ?auto_8179 ) ) ( AVAILABLE ?auto_8178 ) ( SURFACE-AT ?auto_8177 ?auto_8189 ) ( ON ?auto_8177 ?auto_8191 ) ( CLEAR ?auto_8177 ) ( not ( = ?auto_8176 ?auto_8191 ) ) ( not ( = ?auto_8177 ?auto_8191 ) ) ( not ( = ?auto_8183 ?auto_8191 ) ) ( not ( = ?auto_8179 ?auto_8191 ) ) ( IS-CRATE ?auto_8179 ) ( not ( = ?auto_8176 ?auto_8184 ) ) ( not ( = ?auto_8177 ?auto_8184 ) ) ( not ( = ?auto_8183 ?auto_8184 ) ) ( not ( = ?auto_8179 ?auto_8184 ) ) ( not ( = ?auto_8191 ?auto_8184 ) ) ( not ( = ?auto_8185 ?auto_8182 ) ) ( not ( = ?auto_8189 ?auto_8185 ) ) ( HOIST-AT ?auto_8181 ?auto_8185 ) ( not ( = ?auto_8188 ?auto_8181 ) ) ( not ( = ?auto_8178 ?auto_8181 ) ) ( AVAILABLE ?auto_8181 ) ( SURFACE-AT ?auto_8179 ?auto_8185 ) ( ON ?auto_8179 ?auto_8187 ) ( CLEAR ?auto_8179 ) ( not ( = ?auto_8176 ?auto_8187 ) ) ( not ( = ?auto_8177 ?auto_8187 ) ) ( not ( = ?auto_8183 ?auto_8187 ) ) ( not ( = ?auto_8179 ?auto_8187 ) ) ( not ( = ?auto_8191 ?auto_8187 ) ) ( not ( = ?auto_8184 ?auto_8187 ) ) ( SURFACE-AT ?auto_8190 ?auto_8182 ) ( CLEAR ?auto_8190 ) ( IS-CRATE ?auto_8184 ) ( not ( = ?auto_8176 ?auto_8190 ) ) ( not ( = ?auto_8177 ?auto_8190 ) ) ( not ( = ?auto_8183 ?auto_8190 ) ) ( not ( = ?auto_8179 ?auto_8190 ) ) ( not ( = ?auto_8191 ?auto_8190 ) ) ( not ( = ?auto_8184 ?auto_8190 ) ) ( not ( = ?auto_8187 ?auto_8190 ) ) ( AVAILABLE ?auto_8188 ) ( TRUCK-AT ?auto_8180 ?auto_8186 ) ( not ( = ?auto_8186 ?auto_8182 ) ) ( not ( = ?auto_8189 ?auto_8186 ) ) ( not ( = ?auto_8185 ?auto_8186 ) ) ( HOIST-AT ?auto_8192 ?auto_8186 ) ( LIFTING ?auto_8192 ?auto_8184 ) ( not ( = ?auto_8188 ?auto_8192 ) ) ( not ( = ?auto_8178 ?auto_8192 ) ) ( not ( = ?auto_8181 ?auto_8192 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8192 ?auto_8184 ?auto_8180 ?auto_8186 )
      ( MAKE-ON ?auto_8176 ?auto_8177 )
      ( MAKE-ON-VERIFY ?auto_8176 ?auto_8177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8193 - SURFACE
      ?auto_8194 - SURFACE
    )
    :vars
    (
      ?auto_8198 - HOIST
      ?auto_8206 - PLACE
      ?auto_8208 - PLACE
      ?auto_8196 - HOIST
      ?auto_8203 - SURFACE
      ?auto_8197 - SURFACE
      ?auto_8204 - SURFACE
      ?auto_8202 - SURFACE
      ?auto_8200 - PLACE
      ?auto_8209 - HOIST
      ?auto_8207 - SURFACE
      ?auto_8195 - SURFACE
      ?auto_8199 - TRUCK
      ?auto_8205 - PLACE
      ?auto_8201 - HOIST
      ?auto_8210 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8198 ?auto_8206 ) ( IS-CRATE ?auto_8193 ) ( not ( = ?auto_8193 ?auto_8194 ) ) ( not ( = ?auto_8208 ?auto_8206 ) ) ( HOIST-AT ?auto_8196 ?auto_8208 ) ( not ( = ?auto_8198 ?auto_8196 ) ) ( SURFACE-AT ?auto_8193 ?auto_8208 ) ( ON ?auto_8193 ?auto_8203 ) ( CLEAR ?auto_8193 ) ( not ( = ?auto_8193 ?auto_8203 ) ) ( not ( = ?auto_8194 ?auto_8203 ) ) ( IS-CRATE ?auto_8194 ) ( not ( = ?auto_8193 ?auto_8197 ) ) ( not ( = ?auto_8194 ?auto_8197 ) ) ( not ( = ?auto_8203 ?auto_8197 ) ) ( AVAILABLE ?auto_8196 ) ( SURFACE-AT ?auto_8194 ?auto_8208 ) ( ON ?auto_8194 ?auto_8204 ) ( CLEAR ?auto_8194 ) ( not ( = ?auto_8193 ?auto_8204 ) ) ( not ( = ?auto_8194 ?auto_8204 ) ) ( not ( = ?auto_8203 ?auto_8204 ) ) ( not ( = ?auto_8197 ?auto_8204 ) ) ( IS-CRATE ?auto_8197 ) ( not ( = ?auto_8193 ?auto_8202 ) ) ( not ( = ?auto_8194 ?auto_8202 ) ) ( not ( = ?auto_8203 ?auto_8202 ) ) ( not ( = ?auto_8197 ?auto_8202 ) ) ( not ( = ?auto_8204 ?auto_8202 ) ) ( not ( = ?auto_8200 ?auto_8206 ) ) ( not ( = ?auto_8208 ?auto_8200 ) ) ( HOIST-AT ?auto_8209 ?auto_8200 ) ( not ( = ?auto_8198 ?auto_8209 ) ) ( not ( = ?auto_8196 ?auto_8209 ) ) ( AVAILABLE ?auto_8209 ) ( SURFACE-AT ?auto_8197 ?auto_8200 ) ( ON ?auto_8197 ?auto_8207 ) ( CLEAR ?auto_8197 ) ( not ( = ?auto_8193 ?auto_8207 ) ) ( not ( = ?auto_8194 ?auto_8207 ) ) ( not ( = ?auto_8203 ?auto_8207 ) ) ( not ( = ?auto_8197 ?auto_8207 ) ) ( not ( = ?auto_8204 ?auto_8207 ) ) ( not ( = ?auto_8202 ?auto_8207 ) ) ( SURFACE-AT ?auto_8195 ?auto_8206 ) ( CLEAR ?auto_8195 ) ( IS-CRATE ?auto_8202 ) ( not ( = ?auto_8193 ?auto_8195 ) ) ( not ( = ?auto_8194 ?auto_8195 ) ) ( not ( = ?auto_8203 ?auto_8195 ) ) ( not ( = ?auto_8197 ?auto_8195 ) ) ( not ( = ?auto_8204 ?auto_8195 ) ) ( not ( = ?auto_8202 ?auto_8195 ) ) ( not ( = ?auto_8207 ?auto_8195 ) ) ( AVAILABLE ?auto_8198 ) ( TRUCK-AT ?auto_8199 ?auto_8205 ) ( not ( = ?auto_8205 ?auto_8206 ) ) ( not ( = ?auto_8208 ?auto_8205 ) ) ( not ( = ?auto_8200 ?auto_8205 ) ) ( HOIST-AT ?auto_8201 ?auto_8205 ) ( not ( = ?auto_8198 ?auto_8201 ) ) ( not ( = ?auto_8196 ?auto_8201 ) ) ( not ( = ?auto_8209 ?auto_8201 ) ) ( AVAILABLE ?auto_8201 ) ( SURFACE-AT ?auto_8202 ?auto_8205 ) ( ON ?auto_8202 ?auto_8210 ) ( CLEAR ?auto_8202 ) ( not ( = ?auto_8193 ?auto_8210 ) ) ( not ( = ?auto_8194 ?auto_8210 ) ) ( not ( = ?auto_8203 ?auto_8210 ) ) ( not ( = ?auto_8197 ?auto_8210 ) ) ( not ( = ?auto_8204 ?auto_8210 ) ) ( not ( = ?auto_8202 ?auto_8210 ) ) ( not ( = ?auto_8207 ?auto_8210 ) ) ( not ( = ?auto_8195 ?auto_8210 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8201 ?auto_8202 ?auto_8210 ?auto_8205 )
      ( MAKE-ON ?auto_8193 ?auto_8194 )
      ( MAKE-ON-VERIFY ?auto_8193 ?auto_8194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8211 - SURFACE
      ?auto_8212 - SURFACE
    )
    :vars
    (
      ?auto_8214 - HOIST
      ?auto_8219 - PLACE
      ?auto_8213 - PLACE
      ?auto_8218 - HOIST
      ?auto_8224 - SURFACE
      ?auto_8221 - SURFACE
      ?auto_8223 - SURFACE
      ?auto_8215 - SURFACE
      ?auto_8217 - PLACE
      ?auto_8226 - HOIST
      ?auto_8220 - SURFACE
      ?auto_8216 - SURFACE
      ?auto_8222 - PLACE
      ?auto_8227 - HOIST
      ?auto_8228 - SURFACE
      ?auto_8225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8214 ?auto_8219 ) ( IS-CRATE ?auto_8211 ) ( not ( = ?auto_8211 ?auto_8212 ) ) ( not ( = ?auto_8213 ?auto_8219 ) ) ( HOIST-AT ?auto_8218 ?auto_8213 ) ( not ( = ?auto_8214 ?auto_8218 ) ) ( SURFACE-AT ?auto_8211 ?auto_8213 ) ( ON ?auto_8211 ?auto_8224 ) ( CLEAR ?auto_8211 ) ( not ( = ?auto_8211 ?auto_8224 ) ) ( not ( = ?auto_8212 ?auto_8224 ) ) ( IS-CRATE ?auto_8212 ) ( not ( = ?auto_8211 ?auto_8221 ) ) ( not ( = ?auto_8212 ?auto_8221 ) ) ( not ( = ?auto_8224 ?auto_8221 ) ) ( AVAILABLE ?auto_8218 ) ( SURFACE-AT ?auto_8212 ?auto_8213 ) ( ON ?auto_8212 ?auto_8223 ) ( CLEAR ?auto_8212 ) ( not ( = ?auto_8211 ?auto_8223 ) ) ( not ( = ?auto_8212 ?auto_8223 ) ) ( not ( = ?auto_8224 ?auto_8223 ) ) ( not ( = ?auto_8221 ?auto_8223 ) ) ( IS-CRATE ?auto_8221 ) ( not ( = ?auto_8211 ?auto_8215 ) ) ( not ( = ?auto_8212 ?auto_8215 ) ) ( not ( = ?auto_8224 ?auto_8215 ) ) ( not ( = ?auto_8221 ?auto_8215 ) ) ( not ( = ?auto_8223 ?auto_8215 ) ) ( not ( = ?auto_8217 ?auto_8219 ) ) ( not ( = ?auto_8213 ?auto_8217 ) ) ( HOIST-AT ?auto_8226 ?auto_8217 ) ( not ( = ?auto_8214 ?auto_8226 ) ) ( not ( = ?auto_8218 ?auto_8226 ) ) ( AVAILABLE ?auto_8226 ) ( SURFACE-AT ?auto_8221 ?auto_8217 ) ( ON ?auto_8221 ?auto_8220 ) ( CLEAR ?auto_8221 ) ( not ( = ?auto_8211 ?auto_8220 ) ) ( not ( = ?auto_8212 ?auto_8220 ) ) ( not ( = ?auto_8224 ?auto_8220 ) ) ( not ( = ?auto_8221 ?auto_8220 ) ) ( not ( = ?auto_8223 ?auto_8220 ) ) ( not ( = ?auto_8215 ?auto_8220 ) ) ( SURFACE-AT ?auto_8216 ?auto_8219 ) ( CLEAR ?auto_8216 ) ( IS-CRATE ?auto_8215 ) ( not ( = ?auto_8211 ?auto_8216 ) ) ( not ( = ?auto_8212 ?auto_8216 ) ) ( not ( = ?auto_8224 ?auto_8216 ) ) ( not ( = ?auto_8221 ?auto_8216 ) ) ( not ( = ?auto_8223 ?auto_8216 ) ) ( not ( = ?auto_8215 ?auto_8216 ) ) ( not ( = ?auto_8220 ?auto_8216 ) ) ( AVAILABLE ?auto_8214 ) ( not ( = ?auto_8222 ?auto_8219 ) ) ( not ( = ?auto_8213 ?auto_8222 ) ) ( not ( = ?auto_8217 ?auto_8222 ) ) ( HOIST-AT ?auto_8227 ?auto_8222 ) ( not ( = ?auto_8214 ?auto_8227 ) ) ( not ( = ?auto_8218 ?auto_8227 ) ) ( not ( = ?auto_8226 ?auto_8227 ) ) ( AVAILABLE ?auto_8227 ) ( SURFACE-AT ?auto_8215 ?auto_8222 ) ( ON ?auto_8215 ?auto_8228 ) ( CLEAR ?auto_8215 ) ( not ( = ?auto_8211 ?auto_8228 ) ) ( not ( = ?auto_8212 ?auto_8228 ) ) ( not ( = ?auto_8224 ?auto_8228 ) ) ( not ( = ?auto_8221 ?auto_8228 ) ) ( not ( = ?auto_8223 ?auto_8228 ) ) ( not ( = ?auto_8215 ?auto_8228 ) ) ( not ( = ?auto_8220 ?auto_8228 ) ) ( not ( = ?auto_8216 ?auto_8228 ) ) ( TRUCK-AT ?auto_8225 ?auto_8219 ) )
    :subtasks
    ( ( !DRIVE ?auto_8225 ?auto_8219 ?auto_8222 )
      ( MAKE-ON ?auto_8211 ?auto_8212 )
      ( MAKE-ON-VERIFY ?auto_8211 ?auto_8212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8229 - SURFACE
      ?auto_8230 - SURFACE
    )
    :vars
    (
      ?auto_8234 - HOIST
      ?auto_8245 - PLACE
      ?auto_8236 - PLACE
      ?auto_8239 - HOIST
      ?auto_8235 - SURFACE
      ?auto_8246 - SURFACE
      ?auto_8237 - SURFACE
      ?auto_8238 - SURFACE
      ?auto_8242 - PLACE
      ?auto_8233 - HOIST
      ?auto_8240 - SURFACE
      ?auto_8231 - SURFACE
      ?auto_8232 - PLACE
      ?auto_8243 - HOIST
      ?auto_8244 - SURFACE
      ?auto_8241 - TRUCK
      ?auto_8247 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8234 ?auto_8245 ) ( IS-CRATE ?auto_8229 ) ( not ( = ?auto_8229 ?auto_8230 ) ) ( not ( = ?auto_8236 ?auto_8245 ) ) ( HOIST-AT ?auto_8239 ?auto_8236 ) ( not ( = ?auto_8234 ?auto_8239 ) ) ( SURFACE-AT ?auto_8229 ?auto_8236 ) ( ON ?auto_8229 ?auto_8235 ) ( CLEAR ?auto_8229 ) ( not ( = ?auto_8229 ?auto_8235 ) ) ( not ( = ?auto_8230 ?auto_8235 ) ) ( IS-CRATE ?auto_8230 ) ( not ( = ?auto_8229 ?auto_8246 ) ) ( not ( = ?auto_8230 ?auto_8246 ) ) ( not ( = ?auto_8235 ?auto_8246 ) ) ( AVAILABLE ?auto_8239 ) ( SURFACE-AT ?auto_8230 ?auto_8236 ) ( ON ?auto_8230 ?auto_8237 ) ( CLEAR ?auto_8230 ) ( not ( = ?auto_8229 ?auto_8237 ) ) ( not ( = ?auto_8230 ?auto_8237 ) ) ( not ( = ?auto_8235 ?auto_8237 ) ) ( not ( = ?auto_8246 ?auto_8237 ) ) ( IS-CRATE ?auto_8246 ) ( not ( = ?auto_8229 ?auto_8238 ) ) ( not ( = ?auto_8230 ?auto_8238 ) ) ( not ( = ?auto_8235 ?auto_8238 ) ) ( not ( = ?auto_8246 ?auto_8238 ) ) ( not ( = ?auto_8237 ?auto_8238 ) ) ( not ( = ?auto_8242 ?auto_8245 ) ) ( not ( = ?auto_8236 ?auto_8242 ) ) ( HOIST-AT ?auto_8233 ?auto_8242 ) ( not ( = ?auto_8234 ?auto_8233 ) ) ( not ( = ?auto_8239 ?auto_8233 ) ) ( AVAILABLE ?auto_8233 ) ( SURFACE-AT ?auto_8246 ?auto_8242 ) ( ON ?auto_8246 ?auto_8240 ) ( CLEAR ?auto_8246 ) ( not ( = ?auto_8229 ?auto_8240 ) ) ( not ( = ?auto_8230 ?auto_8240 ) ) ( not ( = ?auto_8235 ?auto_8240 ) ) ( not ( = ?auto_8246 ?auto_8240 ) ) ( not ( = ?auto_8237 ?auto_8240 ) ) ( not ( = ?auto_8238 ?auto_8240 ) ) ( IS-CRATE ?auto_8238 ) ( not ( = ?auto_8229 ?auto_8231 ) ) ( not ( = ?auto_8230 ?auto_8231 ) ) ( not ( = ?auto_8235 ?auto_8231 ) ) ( not ( = ?auto_8246 ?auto_8231 ) ) ( not ( = ?auto_8237 ?auto_8231 ) ) ( not ( = ?auto_8238 ?auto_8231 ) ) ( not ( = ?auto_8240 ?auto_8231 ) ) ( not ( = ?auto_8232 ?auto_8245 ) ) ( not ( = ?auto_8236 ?auto_8232 ) ) ( not ( = ?auto_8242 ?auto_8232 ) ) ( HOIST-AT ?auto_8243 ?auto_8232 ) ( not ( = ?auto_8234 ?auto_8243 ) ) ( not ( = ?auto_8239 ?auto_8243 ) ) ( not ( = ?auto_8233 ?auto_8243 ) ) ( AVAILABLE ?auto_8243 ) ( SURFACE-AT ?auto_8238 ?auto_8232 ) ( ON ?auto_8238 ?auto_8244 ) ( CLEAR ?auto_8238 ) ( not ( = ?auto_8229 ?auto_8244 ) ) ( not ( = ?auto_8230 ?auto_8244 ) ) ( not ( = ?auto_8235 ?auto_8244 ) ) ( not ( = ?auto_8246 ?auto_8244 ) ) ( not ( = ?auto_8237 ?auto_8244 ) ) ( not ( = ?auto_8238 ?auto_8244 ) ) ( not ( = ?auto_8240 ?auto_8244 ) ) ( not ( = ?auto_8231 ?auto_8244 ) ) ( TRUCK-AT ?auto_8241 ?auto_8245 ) ( SURFACE-AT ?auto_8247 ?auto_8245 ) ( CLEAR ?auto_8247 ) ( LIFTING ?auto_8234 ?auto_8231 ) ( IS-CRATE ?auto_8231 ) ( not ( = ?auto_8229 ?auto_8247 ) ) ( not ( = ?auto_8230 ?auto_8247 ) ) ( not ( = ?auto_8235 ?auto_8247 ) ) ( not ( = ?auto_8246 ?auto_8247 ) ) ( not ( = ?auto_8237 ?auto_8247 ) ) ( not ( = ?auto_8238 ?auto_8247 ) ) ( not ( = ?auto_8240 ?auto_8247 ) ) ( not ( = ?auto_8231 ?auto_8247 ) ) ( not ( = ?auto_8244 ?auto_8247 ) ) )
    :subtasks
    ( ( !DROP ?auto_8234 ?auto_8231 ?auto_8247 ?auto_8245 )
      ( MAKE-ON ?auto_8229 ?auto_8230 )
      ( MAKE-ON-VERIFY ?auto_8229 ?auto_8230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8248 - SURFACE
      ?auto_8249 - SURFACE
    )
    :vars
    (
      ?auto_8251 - HOIST
      ?auto_8263 - PLACE
      ?auto_8254 - PLACE
      ?auto_8264 - HOIST
      ?auto_8250 - SURFACE
      ?auto_8259 - SURFACE
      ?auto_8260 - SURFACE
      ?auto_8257 - SURFACE
      ?auto_8258 - PLACE
      ?auto_8252 - HOIST
      ?auto_8262 - SURFACE
      ?auto_8265 - SURFACE
      ?auto_8253 - PLACE
      ?auto_8261 - HOIST
      ?auto_8256 - SURFACE
      ?auto_8255 - TRUCK
      ?auto_8266 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8251 ?auto_8263 ) ( IS-CRATE ?auto_8248 ) ( not ( = ?auto_8248 ?auto_8249 ) ) ( not ( = ?auto_8254 ?auto_8263 ) ) ( HOIST-AT ?auto_8264 ?auto_8254 ) ( not ( = ?auto_8251 ?auto_8264 ) ) ( SURFACE-AT ?auto_8248 ?auto_8254 ) ( ON ?auto_8248 ?auto_8250 ) ( CLEAR ?auto_8248 ) ( not ( = ?auto_8248 ?auto_8250 ) ) ( not ( = ?auto_8249 ?auto_8250 ) ) ( IS-CRATE ?auto_8249 ) ( not ( = ?auto_8248 ?auto_8259 ) ) ( not ( = ?auto_8249 ?auto_8259 ) ) ( not ( = ?auto_8250 ?auto_8259 ) ) ( AVAILABLE ?auto_8264 ) ( SURFACE-AT ?auto_8249 ?auto_8254 ) ( ON ?auto_8249 ?auto_8260 ) ( CLEAR ?auto_8249 ) ( not ( = ?auto_8248 ?auto_8260 ) ) ( not ( = ?auto_8249 ?auto_8260 ) ) ( not ( = ?auto_8250 ?auto_8260 ) ) ( not ( = ?auto_8259 ?auto_8260 ) ) ( IS-CRATE ?auto_8259 ) ( not ( = ?auto_8248 ?auto_8257 ) ) ( not ( = ?auto_8249 ?auto_8257 ) ) ( not ( = ?auto_8250 ?auto_8257 ) ) ( not ( = ?auto_8259 ?auto_8257 ) ) ( not ( = ?auto_8260 ?auto_8257 ) ) ( not ( = ?auto_8258 ?auto_8263 ) ) ( not ( = ?auto_8254 ?auto_8258 ) ) ( HOIST-AT ?auto_8252 ?auto_8258 ) ( not ( = ?auto_8251 ?auto_8252 ) ) ( not ( = ?auto_8264 ?auto_8252 ) ) ( AVAILABLE ?auto_8252 ) ( SURFACE-AT ?auto_8259 ?auto_8258 ) ( ON ?auto_8259 ?auto_8262 ) ( CLEAR ?auto_8259 ) ( not ( = ?auto_8248 ?auto_8262 ) ) ( not ( = ?auto_8249 ?auto_8262 ) ) ( not ( = ?auto_8250 ?auto_8262 ) ) ( not ( = ?auto_8259 ?auto_8262 ) ) ( not ( = ?auto_8260 ?auto_8262 ) ) ( not ( = ?auto_8257 ?auto_8262 ) ) ( IS-CRATE ?auto_8257 ) ( not ( = ?auto_8248 ?auto_8265 ) ) ( not ( = ?auto_8249 ?auto_8265 ) ) ( not ( = ?auto_8250 ?auto_8265 ) ) ( not ( = ?auto_8259 ?auto_8265 ) ) ( not ( = ?auto_8260 ?auto_8265 ) ) ( not ( = ?auto_8257 ?auto_8265 ) ) ( not ( = ?auto_8262 ?auto_8265 ) ) ( not ( = ?auto_8253 ?auto_8263 ) ) ( not ( = ?auto_8254 ?auto_8253 ) ) ( not ( = ?auto_8258 ?auto_8253 ) ) ( HOIST-AT ?auto_8261 ?auto_8253 ) ( not ( = ?auto_8251 ?auto_8261 ) ) ( not ( = ?auto_8264 ?auto_8261 ) ) ( not ( = ?auto_8252 ?auto_8261 ) ) ( AVAILABLE ?auto_8261 ) ( SURFACE-AT ?auto_8257 ?auto_8253 ) ( ON ?auto_8257 ?auto_8256 ) ( CLEAR ?auto_8257 ) ( not ( = ?auto_8248 ?auto_8256 ) ) ( not ( = ?auto_8249 ?auto_8256 ) ) ( not ( = ?auto_8250 ?auto_8256 ) ) ( not ( = ?auto_8259 ?auto_8256 ) ) ( not ( = ?auto_8260 ?auto_8256 ) ) ( not ( = ?auto_8257 ?auto_8256 ) ) ( not ( = ?auto_8262 ?auto_8256 ) ) ( not ( = ?auto_8265 ?auto_8256 ) ) ( TRUCK-AT ?auto_8255 ?auto_8263 ) ( SURFACE-AT ?auto_8266 ?auto_8263 ) ( CLEAR ?auto_8266 ) ( IS-CRATE ?auto_8265 ) ( not ( = ?auto_8248 ?auto_8266 ) ) ( not ( = ?auto_8249 ?auto_8266 ) ) ( not ( = ?auto_8250 ?auto_8266 ) ) ( not ( = ?auto_8259 ?auto_8266 ) ) ( not ( = ?auto_8260 ?auto_8266 ) ) ( not ( = ?auto_8257 ?auto_8266 ) ) ( not ( = ?auto_8262 ?auto_8266 ) ) ( not ( = ?auto_8265 ?auto_8266 ) ) ( not ( = ?auto_8256 ?auto_8266 ) ) ( AVAILABLE ?auto_8251 ) ( IN ?auto_8265 ?auto_8255 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8251 ?auto_8265 ?auto_8255 ?auto_8263 )
      ( MAKE-ON ?auto_8248 ?auto_8249 )
      ( MAKE-ON-VERIFY ?auto_8248 ?auto_8249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8267 - SURFACE
      ?auto_8268 - SURFACE
    )
    :vars
    (
      ?auto_8278 - HOIST
      ?auto_8280 - PLACE
      ?auto_8279 - PLACE
      ?auto_8284 - HOIST
      ?auto_8283 - SURFACE
      ?auto_8273 - SURFACE
      ?auto_8272 - SURFACE
      ?auto_8270 - SURFACE
      ?auto_8281 - PLACE
      ?auto_8269 - HOIST
      ?auto_8277 - SURFACE
      ?auto_8276 - SURFACE
      ?auto_8274 - PLACE
      ?auto_8282 - HOIST
      ?auto_8275 - SURFACE
      ?auto_8285 - SURFACE
      ?auto_8271 - TRUCK
      ?auto_8286 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8278 ?auto_8280 ) ( IS-CRATE ?auto_8267 ) ( not ( = ?auto_8267 ?auto_8268 ) ) ( not ( = ?auto_8279 ?auto_8280 ) ) ( HOIST-AT ?auto_8284 ?auto_8279 ) ( not ( = ?auto_8278 ?auto_8284 ) ) ( SURFACE-AT ?auto_8267 ?auto_8279 ) ( ON ?auto_8267 ?auto_8283 ) ( CLEAR ?auto_8267 ) ( not ( = ?auto_8267 ?auto_8283 ) ) ( not ( = ?auto_8268 ?auto_8283 ) ) ( IS-CRATE ?auto_8268 ) ( not ( = ?auto_8267 ?auto_8273 ) ) ( not ( = ?auto_8268 ?auto_8273 ) ) ( not ( = ?auto_8283 ?auto_8273 ) ) ( AVAILABLE ?auto_8284 ) ( SURFACE-AT ?auto_8268 ?auto_8279 ) ( ON ?auto_8268 ?auto_8272 ) ( CLEAR ?auto_8268 ) ( not ( = ?auto_8267 ?auto_8272 ) ) ( not ( = ?auto_8268 ?auto_8272 ) ) ( not ( = ?auto_8283 ?auto_8272 ) ) ( not ( = ?auto_8273 ?auto_8272 ) ) ( IS-CRATE ?auto_8273 ) ( not ( = ?auto_8267 ?auto_8270 ) ) ( not ( = ?auto_8268 ?auto_8270 ) ) ( not ( = ?auto_8283 ?auto_8270 ) ) ( not ( = ?auto_8273 ?auto_8270 ) ) ( not ( = ?auto_8272 ?auto_8270 ) ) ( not ( = ?auto_8281 ?auto_8280 ) ) ( not ( = ?auto_8279 ?auto_8281 ) ) ( HOIST-AT ?auto_8269 ?auto_8281 ) ( not ( = ?auto_8278 ?auto_8269 ) ) ( not ( = ?auto_8284 ?auto_8269 ) ) ( AVAILABLE ?auto_8269 ) ( SURFACE-AT ?auto_8273 ?auto_8281 ) ( ON ?auto_8273 ?auto_8277 ) ( CLEAR ?auto_8273 ) ( not ( = ?auto_8267 ?auto_8277 ) ) ( not ( = ?auto_8268 ?auto_8277 ) ) ( not ( = ?auto_8283 ?auto_8277 ) ) ( not ( = ?auto_8273 ?auto_8277 ) ) ( not ( = ?auto_8272 ?auto_8277 ) ) ( not ( = ?auto_8270 ?auto_8277 ) ) ( IS-CRATE ?auto_8270 ) ( not ( = ?auto_8267 ?auto_8276 ) ) ( not ( = ?auto_8268 ?auto_8276 ) ) ( not ( = ?auto_8283 ?auto_8276 ) ) ( not ( = ?auto_8273 ?auto_8276 ) ) ( not ( = ?auto_8272 ?auto_8276 ) ) ( not ( = ?auto_8270 ?auto_8276 ) ) ( not ( = ?auto_8277 ?auto_8276 ) ) ( not ( = ?auto_8274 ?auto_8280 ) ) ( not ( = ?auto_8279 ?auto_8274 ) ) ( not ( = ?auto_8281 ?auto_8274 ) ) ( HOIST-AT ?auto_8282 ?auto_8274 ) ( not ( = ?auto_8278 ?auto_8282 ) ) ( not ( = ?auto_8284 ?auto_8282 ) ) ( not ( = ?auto_8269 ?auto_8282 ) ) ( AVAILABLE ?auto_8282 ) ( SURFACE-AT ?auto_8270 ?auto_8274 ) ( ON ?auto_8270 ?auto_8275 ) ( CLEAR ?auto_8270 ) ( not ( = ?auto_8267 ?auto_8275 ) ) ( not ( = ?auto_8268 ?auto_8275 ) ) ( not ( = ?auto_8283 ?auto_8275 ) ) ( not ( = ?auto_8273 ?auto_8275 ) ) ( not ( = ?auto_8272 ?auto_8275 ) ) ( not ( = ?auto_8270 ?auto_8275 ) ) ( not ( = ?auto_8277 ?auto_8275 ) ) ( not ( = ?auto_8276 ?auto_8275 ) ) ( SURFACE-AT ?auto_8285 ?auto_8280 ) ( CLEAR ?auto_8285 ) ( IS-CRATE ?auto_8276 ) ( not ( = ?auto_8267 ?auto_8285 ) ) ( not ( = ?auto_8268 ?auto_8285 ) ) ( not ( = ?auto_8283 ?auto_8285 ) ) ( not ( = ?auto_8273 ?auto_8285 ) ) ( not ( = ?auto_8272 ?auto_8285 ) ) ( not ( = ?auto_8270 ?auto_8285 ) ) ( not ( = ?auto_8277 ?auto_8285 ) ) ( not ( = ?auto_8276 ?auto_8285 ) ) ( not ( = ?auto_8275 ?auto_8285 ) ) ( AVAILABLE ?auto_8278 ) ( IN ?auto_8276 ?auto_8271 ) ( TRUCK-AT ?auto_8271 ?auto_8286 ) ( not ( = ?auto_8286 ?auto_8280 ) ) ( not ( = ?auto_8279 ?auto_8286 ) ) ( not ( = ?auto_8281 ?auto_8286 ) ) ( not ( = ?auto_8274 ?auto_8286 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8271 ?auto_8286 ?auto_8280 )
      ( MAKE-ON ?auto_8267 ?auto_8268 )
      ( MAKE-ON-VERIFY ?auto_8267 ?auto_8268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8287 - SURFACE
      ?auto_8288 - SURFACE
    )
    :vars
    (
      ?auto_8306 - HOIST
      ?auto_8305 - PLACE
      ?auto_8293 - PLACE
      ?auto_8295 - HOIST
      ?auto_8302 - SURFACE
      ?auto_8297 - SURFACE
      ?auto_8289 - SURFACE
      ?auto_8294 - SURFACE
      ?auto_8298 - PLACE
      ?auto_8296 - HOIST
      ?auto_8299 - SURFACE
      ?auto_8291 - SURFACE
      ?auto_8290 - PLACE
      ?auto_8301 - HOIST
      ?auto_8303 - SURFACE
      ?auto_8292 - SURFACE
      ?auto_8300 - TRUCK
      ?auto_8304 - PLACE
      ?auto_8307 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8306 ?auto_8305 ) ( IS-CRATE ?auto_8287 ) ( not ( = ?auto_8287 ?auto_8288 ) ) ( not ( = ?auto_8293 ?auto_8305 ) ) ( HOIST-AT ?auto_8295 ?auto_8293 ) ( not ( = ?auto_8306 ?auto_8295 ) ) ( SURFACE-AT ?auto_8287 ?auto_8293 ) ( ON ?auto_8287 ?auto_8302 ) ( CLEAR ?auto_8287 ) ( not ( = ?auto_8287 ?auto_8302 ) ) ( not ( = ?auto_8288 ?auto_8302 ) ) ( IS-CRATE ?auto_8288 ) ( not ( = ?auto_8287 ?auto_8297 ) ) ( not ( = ?auto_8288 ?auto_8297 ) ) ( not ( = ?auto_8302 ?auto_8297 ) ) ( AVAILABLE ?auto_8295 ) ( SURFACE-AT ?auto_8288 ?auto_8293 ) ( ON ?auto_8288 ?auto_8289 ) ( CLEAR ?auto_8288 ) ( not ( = ?auto_8287 ?auto_8289 ) ) ( not ( = ?auto_8288 ?auto_8289 ) ) ( not ( = ?auto_8302 ?auto_8289 ) ) ( not ( = ?auto_8297 ?auto_8289 ) ) ( IS-CRATE ?auto_8297 ) ( not ( = ?auto_8287 ?auto_8294 ) ) ( not ( = ?auto_8288 ?auto_8294 ) ) ( not ( = ?auto_8302 ?auto_8294 ) ) ( not ( = ?auto_8297 ?auto_8294 ) ) ( not ( = ?auto_8289 ?auto_8294 ) ) ( not ( = ?auto_8298 ?auto_8305 ) ) ( not ( = ?auto_8293 ?auto_8298 ) ) ( HOIST-AT ?auto_8296 ?auto_8298 ) ( not ( = ?auto_8306 ?auto_8296 ) ) ( not ( = ?auto_8295 ?auto_8296 ) ) ( AVAILABLE ?auto_8296 ) ( SURFACE-AT ?auto_8297 ?auto_8298 ) ( ON ?auto_8297 ?auto_8299 ) ( CLEAR ?auto_8297 ) ( not ( = ?auto_8287 ?auto_8299 ) ) ( not ( = ?auto_8288 ?auto_8299 ) ) ( not ( = ?auto_8302 ?auto_8299 ) ) ( not ( = ?auto_8297 ?auto_8299 ) ) ( not ( = ?auto_8289 ?auto_8299 ) ) ( not ( = ?auto_8294 ?auto_8299 ) ) ( IS-CRATE ?auto_8294 ) ( not ( = ?auto_8287 ?auto_8291 ) ) ( not ( = ?auto_8288 ?auto_8291 ) ) ( not ( = ?auto_8302 ?auto_8291 ) ) ( not ( = ?auto_8297 ?auto_8291 ) ) ( not ( = ?auto_8289 ?auto_8291 ) ) ( not ( = ?auto_8294 ?auto_8291 ) ) ( not ( = ?auto_8299 ?auto_8291 ) ) ( not ( = ?auto_8290 ?auto_8305 ) ) ( not ( = ?auto_8293 ?auto_8290 ) ) ( not ( = ?auto_8298 ?auto_8290 ) ) ( HOIST-AT ?auto_8301 ?auto_8290 ) ( not ( = ?auto_8306 ?auto_8301 ) ) ( not ( = ?auto_8295 ?auto_8301 ) ) ( not ( = ?auto_8296 ?auto_8301 ) ) ( AVAILABLE ?auto_8301 ) ( SURFACE-AT ?auto_8294 ?auto_8290 ) ( ON ?auto_8294 ?auto_8303 ) ( CLEAR ?auto_8294 ) ( not ( = ?auto_8287 ?auto_8303 ) ) ( not ( = ?auto_8288 ?auto_8303 ) ) ( not ( = ?auto_8302 ?auto_8303 ) ) ( not ( = ?auto_8297 ?auto_8303 ) ) ( not ( = ?auto_8289 ?auto_8303 ) ) ( not ( = ?auto_8294 ?auto_8303 ) ) ( not ( = ?auto_8299 ?auto_8303 ) ) ( not ( = ?auto_8291 ?auto_8303 ) ) ( SURFACE-AT ?auto_8292 ?auto_8305 ) ( CLEAR ?auto_8292 ) ( IS-CRATE ?auto_8291 ) ( not ( = ?auto_8287 ?auto_8292 ) ) ( not ( = ?auto_8288 ?auto_8292 ) ) ( not ( = ?auto_8302 ?auto_8292 ) ) ( not ( = ?auto_8297 ?auto_8292 ) ) ( not ( = ?auto_8289 ?auto_8292 ) ) ( not ( = ?auto_8294 ?auto_8292 ) ) ( not ( = ?auto_8299 ?auto_8292 ) ) ( not ( = ?auto_8291 ?auto_8292 ) ) ( not ( = ?auto_8303 ?auto_8292 ) ) ( AVAILABLE ?auto_8306 ) ( TRUCK-AT ?auto_8300 ?auto_8304 ) ( not ( = ?auto_8304 ?auto_8305 ) ) ( not ( = ?auto_8293 ?auto_8304 ) ) ( not ( = ?auto_8298 ?auto_8304 ) ) ( not ( = ?auto_8290 ?auto_8304 ) ) ( HOIST-AT ?auto_8307 ?auto_8304 ) ( LIFTING ?auto_8307 ?auto_8291 ) ( not ( = ?auto_8306 ?auto_8307 ) ) ( not ( = ?auto_8295 ?auto_8307 ) ) ( not ( = ?auto_8296 ?auto_8307 ) ) ( not ( = ?auto_8301 ?auto_8307 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8307 ?auto_8291 ?auto_8300 ?auto_8304 )
      ( MAKE-ON ?auto_8287 ?auto_8288 )
      ( MAKE-ON-VERIFY ?auto_8287 ?auto_8288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8308 - SURFACE
      ?auto_8309 - SURFACE
    )
    :vars
    (
      ?auto_8313 - HOIST
      ?auto_8314 - PLACE
      ?auto_8311 - PLACE
      ?auto_8319 - HOIST
      ?auto_8324 - SURFACE
      ?auto_8320 - SURFACE
      ?auto_8310 - SURFACE
      ?auto_8315 - SURFACE
      ?auto_8325 - PLACE
      ?auto_8323 - HOIST
      ?auto_8312 - SURFACE
      ?auto_8327 - SURFACE
      ?auto_8316 - PLACE
      ?auto_8326 - HOIST
      ?auto_8322 - SURFACE
      ?auto_8328 - SURFACE
      ?auto_8317 - TRUCK
      ?auto_8321 - PLACE
      ?auto_8318 - HOIST
      ?auto_8329 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8313 ?auto_8314 ) ( IS-CRATE ?auto_8308 ) ( not ( = ?auto_8308 ?auto_8309 ) ) ( not ( = ?auto_8311 ?auto_8314 ) ) ( HOIST-AT ?auto_8319 ?auto_8311 ) ( not ( = ?auto_8313 ?auto_8319 ) ) ( SURFACE-AT ?auto_8308 ?auto_8311 ) ( ON ?auto_8308 ?auto_8324 ) ( CLEAR ?auto_8308 ) ( not ( = ?auto_8308 ?auto_8324 ) ) ( not ( = ?auto_8309 ?auto_8324 ) ) ( IS-CRATE ?auto_8309 ) ( not ( = ?auto_8308 ?auto_8320 ) ) ( not ( = ?auto_8309 ?auto_8320 ) ) ( not ( = ?auto_8324 ?auto_8320 ) ) ( AVAILABLE ?auto_8319 ) ( SURFACE-AT ?auto_8309 ?auto_8311 ) ( ON ?auto_8309 ?auto_8310 ) ( CLEAR ?auto_8309 ) ( not ( = ?auto_8308 ?auto_8310 ) ) ( not ( = ?auto_8309 ?auto_8310 ) ) ( not ( = ?auto_8324 ?auto_8310 ) ) ( not ( = ?auto_8320 ?auto_8310 ) ) ( IS-CRATE ?auto_8320 ) ( not ( = ?auto_8308 ?auto_8315 ) ) ( not ( = ?auto_8309 ?auto_8315 ) ) ( not ( = ?auto_8324 ?auto_8315 ) ) ( not ( = ?auto_8320 ?auto_8315 ) ) ( not ( = ?auto_8310 ?auto_8315 ) ) ( not ( = ?auto_8325 ?auto_8314 ) ) ( not ( = ?auto_8311 ?auto_8325 ) ) ( HOIST-AT ?auto_8323 ?auto_8325 ) ( not ( = ?auto_8313 ?auto_8323 ) ) ( not ( = ?auto_8319 ?auto_8323 ) ) ( AVAILABLE ?auto_8323 ) ( SURFACE-AT ?auto_8320 ?auto_8325 ) ( ON ?auto_8320 ?auto_8312 ) ( CLEAR ?auto_8320 ) ( not ( = ?auto_8308 ?auto_8312 ) ) ( not ( = ?auto_8309 ?auto_8312 ) ) ( not ( = ?auto_8324 ?auto_8312 ) ) ( not ( = ?auto_8320 ?auto_8312 ) ) ( not ( = ?auto_8310 ?auto_8312 ) ) ( not ( = ?auto_8315 ?auto_8312 ) ) ( IS-CRATE ?auto_8315 ) ( not ( = ?auto_8308 ?auto_8327 ) ) ( not ( = ?auto_8309 ?auto_8327 ) ) ( not ( = ?auto_8324 ?auto_8327 ) ) ( not ( = ?auto_8320 ?auto_8327 ) ) ( not ( = ?auto_8310 ?auto_8327 ) ) ( not ( = ?auto_8315 ?auto_8327 ) ) ( not ( = ?auto_8312 ?auto_8327 ) ) ( not ( = ?auto_8316 ?auto_8314 ) ) ( not ( = ?auto_8311 ?auto_8316 ) ) ( not ( = ?auto_8325 ?auto_8316 ) ) ( HOIST-AT ?auto_8326 ?auto_8316 ) ( not ( = ?auto_8313 ?auto_8326 ) ) ( not ( = ?auto_8319 ?auto_8326 ) ) ( not ( = ?auto_8323 ?auto_8326 ) ) ( AVAILABLE ?auto_8326 ) ( SURFACE-AT ?auto_8315 ?auto_8316 ) ( ON ?auto_8315 ?auto_8322 ) ( CLEAR ?auto_8315 ) ( not ( = ?auto_8308 ?auto_8322 ) ) ( not ( = ?auto_8309 ?auto_8322 ) ) ( not ( = ?auto_8324 ?auto_8322 ) ) ( not ( = ?auto_8320 ?auto_8322 ) ) ( not ( = ?auto_8310 ?auto_8322 ) ) ( not ( = ?auto_8315 ?auto_8322 ) ) ( not ( = ?auto_8312 ?auto_8322 ) ) ( not ( = ?auto_8327 ?auto_8322 ) ) ( SURFACE-AT ?auto_8328 ?auto_8314 ) ( CLEAR ?auto_8328 ) ( IS-CRATE ?auto_8327 ) ( not ( = ?auto_8308 ?auto_8328 ) ) ( not ( = ?auto_8309 ?auto_8328 ) ) ( not ( = ?auto_8324 ?auto_8328 ) ) ( not ( = ?auto_8320 ?auto_8328 ) ) ( not ( = ?auto_8310 ?auto_8328 ) ) ( not ( = ?auto_8315 ?auto_8328 ) ) ( not ( = ?auto_8312 ?auto_8328 ) ) ( not ( = ?auto_8327 ?auto_8328 ) ) ( not ( = ?auto_8322 ?auto_8328 ) ) ( AVAILABLE ?auto_8313 ) ( TRUCK-AT ?auto_8317 ?auto_8321 ) ( not ( = ?auto_8321 ?auto_8314 ) ) ( not ( = ?auto_8311 ?auto_8321 ) ) ( not ( = ?auto_8325 ?auto_8321 ) ) ( not ( = ?auto_8316 ?auto_8321 ) ) ( HOIST-AT ?auto_8318 ?auto_8321 ) ( not ( = ?auto_8313 ?auto_8318 ) ) ( not ( = ?auto_8319 ?auto_8318 ) ) ( not ( = ?auto_8323 ?auto_8318 ) ) ( not ( = ?auto_8326 ?auto_8318 ) ) ( AVAILABLE ?auto_8318 ) ( SURFACE-AT ?auto_8327 ?auto_8321 ) ( ON ?auto_8327 ?auto_8329 ) ( CLEAR ?auto_8327 ) ( not ( = ?auto_8308 ?auto_8329 ) ) ( not ( = ?auto_8309 ?auto_8329 ) ) ( not ( = ?auto_8324 ?auto_8329 ) ) ( not ( = ?auto_8320 ?auto_8329 ) ) ( not ( = ?auto_8310 ?auto_8329 ) ) ( not ( = ?auto_8315 ?auto_8329 ) ) ( not ( = ?auto_8312 ?auto_8329 ) ) ( not ( = ?auto_8327 ?auto_8329 ) ) ( not ( = ?auto_8322 ?auto_8329 ) ) ( not ( = ?auto_8328 ?auto_8329 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8318 ?auto_8327 ?auto_8329 ?auto_8321 )
      ( MAKE-ON ?auto_8308 ?auto_8309 )
      ( MAKE-ON-VERIFY ?auto_8308 ?auto_8309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_8330 - SURFACE
      ?auto_8331 - SURFACE
    )
    :vars
    (
      ?auto_8344 - HOIST
      ?auto_8334 - PLACE
      ?auto_8341 - PLACE
      ?auto_8343 - HOIST
      ?auto_8337 - SURFACE
      ?auto_8347 - SURFACE
      ?auto_8349 - SURFACE
      ?auto_8340 - SURFACE
      ?auto_8339 - PLACE
      ?auto_8333 - HOIST
      ?auto_8342 - SURFACE
      ?auto_8332 - SURFACE
      ?auto_8346 - PLACE
      ?auto_8338 - HOIST
      ?auto_8345 - SURFACE
      ?auto_8350 - SURFACE
      ?auto_8335 - PLACE
      ?auto_8348 - HOIST
      ?auto_8351 - SURFACE
      ?auto_8336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8344 ?auto_8334 ) ( IS-CRATE ?auto_8330 ) ( not ( = ?auto_8330 ?auto_8331 ) ) ( not ( = ?auto_8341 ?auto_8334 ) ) ( HOIST-AT ?auto_8343 ?auto_8341 ) ( not ( = ?auto_8344 ?auto_8343 ) ) ( SURFACE-AT ?auto_8330 ?auto_8341 ) ( ON ?auto_8330 ?auto_8337 ) ( CLEAR ?auto_8330 ) ( not ( = ?auto_8330 ?auto_8337 ) ) ( not ( = ?auto_8331 ?auto_8337 ) ) ( IS-CRATE ?auto_8331 ) ( not ( = ?auto_8330 ?auto_8347 ) ) ( not ( = ?auto_8331 ?auto_8347 ) ) ( not ( = ?auto_8337 ?auto_8347 ) ) ( AVAILABLE ?auto_8343 ) ( SURFACE-AT ?auto_8331 ?auto_8341 ) ( ON ?auto_8331 ?auto_8349 ) ( CLEAR ?auto_8331 ) ( not ( = ?auto_8330 ?auto_8349 ) ) ( not ( = ?auto_8331 ?auto_8349 ) ) ( not ( = ?auto_8337 ?auto_8349 ) ) ( not ( = ?auto_8347 ?auto_8349 ) ) ( IS-CRATE ?auto_8347 ) ( not ( = ?auto_8330 ?auto_8340 ) ) ( not ( = ?auto_8331 ?auto_8340 ) ) ( not ( = ?auto_8337 ?auto_8340 ) ) ( not ( = ?auto_8347 ?auto_8340 ) ) ( not ( = ?auto_8349 ?auto_8340 ) ) ( not ( = ?auto_8339 ?auto_8334 ) ) ( not ( = ?auto_8341 ?auto_8339 ) ) ( HOIST-AT ?auto_8333 ?auto_8339 ) ( not ( = ?auto_8344 ?auto_8333 ) ) ( not ( = ?auto_8343 ?auto_8333 ) ) ( AVAILABLE ?auto_8333 ) ( SURFACE-AT ?auto_8347 ?auto_8339 ) ( ON ?auto_8347 ?auto_8342 ) ( CLEAR ?auto_8347 ) ( not ( = ?auto_8330 ?auto_8342 ) ) ( not ( = ?auto_8331 ?auto_8342 ) ) ( not ( = ?auto_8337 ?auto_8342 ) ) ( not ( = ?auto_8347 ?auto_8342 ) ) ( not ( = ?auto_8349 ?auto_8342 ) ) ( not ( = ?auto_8340 ?auto_8342 ) ) ( IS-CRATE ?auto_8340 ) ( not ( = ?auto_8330 ?auto_8332 ) ) ( not ( = ?auto_8331 ?auto_8332 ) ) ( not ( = ?auto_8337 ?auto_8332 ) ) ( not ( = ?auto_8347 ?auto_8332 ) ) ( not ( = ?auto_8349 ?auto_8332 ) ) ( not ( = ?auto_8340 ?auto_8332 ) ) ( not ( = ?auto_8342 ?auto_8332 ) ) ( not ( = ?auto_8346 ?auto_8334 ) ) ( not ( = ?auto_8341 ?auto_8346 ) ) ( not ( = ?auto_8339 ?auto_8346 ) ) ( HOIST-AT ?auto_8338 ?auto_8346 ) ( not ( = ?auto_8344 ?auto_8338 ) ) ( not ( = ?auto_8343 ?auto_8338 ) ) ( not ( = ?auto_8333 ?auto_8338 ) ) ( AVAILABLE ?auto_8338 ) ( SURFACE-AT ?auto_8340 ?auto_8346 ) ( ON ?auto_8340 ?auto_8345 ) ( CLEAR ?auto_8340 ) ( not ( = ?auto_8330 ?auto_8345 ) ) ( not ( = ?auto_8331 ?auto_8345 ) ) ( not ( = ?auto_8337 ?auto_8345 ) ) ( not ( = ?auto_8347 ?auto_8345 ) ) ( not ( = ?auto_8349 ?auto_8345 ) ) ( not ( = ?auto_8340 ?auto_8345 ) ) ( not ( = ?auto_8342 ?auto_8345 ) ) ( not ( = ?auto_8332 ?auto_8345 ) ) ( SURFACE-AT ?auto_8350 ?auto_8334 ) ( CLEAR ?auto_8350 ) ( IS-CRATE ?auto_8332 ) ( not ( = ?auto_8330 ?auto_8350 ) ) ( not ( = ?auto_8331 ?auto_8350 ) ) ( not ( = ?auto_8337 ?auto_8350 ) ) ( not ( = ?auto_8347 ?auto_8350 ) ) ( not ( = ?auto_8349 ?auto_8350 ) ) ( not ( = ?auto_8340 ?auto_8350 ) ) ( not ( = ?auto_8342 ?auto_8350 ) ) ( not ( = ?auto_8332 ?auto_8350 ) ) ( not ( = ?auto_8345 ?auto_8350 ) ) ( AVAILABLE ?auto_8344 ) ( not ( = ?auto_8335 ?auto_8334 ) ) ( not ( = ?auto_8341 ?auto_8335 ) ) ( not ( = ?auto_8339 ?auto_8335 ) ) ( not ( = ?auto_8346 ?auto_8335 ) ) ( HOIST-AT ?auto_8348 ?auto_8335 ) ( not ( = ?auto_8344 ?auto_8348 ) ) ( not ( = ?auto_8343 ?auto_8348 ) ) ( not ( = ?auto_8333 ?auto_8348 ) ) ( not ( = ?auto_8338 ?auto_8348 ) ) ( AVAILABLE ?auto_8348 ) ( SURFACE-AT ?auto_8332 ?auto_8335 ) ( ON ?auto_8332 ?auto_8351 ) ( CLEAR ?auto_8332 ) ( not ( = ?auto_8330 ?auto_8351 ) ) ( not ( = ?auto_8331 ?auto_8351 ) ) ( not ( = ?auto_8337 ?auto_8351 ) ) ( not ( = ?auto_8347 ?auto_8351 ) ) ( not ( = ?auto_8349 ?auto_8351 ) ) ( not ( = ?auto_8340 ?auto_8351 ) ) ( not ( = ?auto_8342 ?auto_8351 ) ) ( not ( = ?auto_8332 ?auto_8351 ) ) ( not ( = ?auto_8345 ?auto_8351 ) ) ( not ( = ?auto_8350 ?auto_8351 ) ) ( TRUCK-AT ?auto_8336 ?auto_8334 ) )
    :subtasks
    ( ( !DRIVE ?auto_8336 ?auto_8334 ?auto_8335 )
      ( MAKE-ON ?auto_8330 ?auto_8331 )
      ( MAKE-ON-VERIFY ?auto_8330 ?auto_8331 ) )
  )

)

