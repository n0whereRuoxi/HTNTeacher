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

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7376 - SURFACE
      ?auto_7377 - SURFACE
    )
    :vars
    (
      ?auto_7378 - HOIST
      ?auto_7379 - PLACE
      ?auto_7381 - PLACE
      ?auto_7382 - HOIST
      ?auto_7383 - SURFACE
      ?auto_7380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7378 ?auto_7379 ) ( SURFACE-AT ?auto_7376 ?auto_7379 ) ( CLEAR ?auto_7376 ) ( IS-CRATE ?auto_7377 ) ( AVAILABLE ?auto_7378 ) ( not ( = ?auto_7381 ?auto_7379 ) ) ( HOIST-AT ?auto_7382 ?auto_7381 ) ( AVAILABLE ?auto_7382 ) ( SURFACE-AT ?auto_7377 ?auto_7381 ) ( ON ?auto_7377 ?auto_7383 ) ( CLEAR ?auto_7377 ) ( TRUCK-AT ?auto_7380 ?auto_7379 ) ( not ( = ?auto_7376 ?auto_7377 ) ) ( not ( = ?auto_7376 ?auto_7383 ) ) ( not ( = ?auto_7377 ?auto_7383 ) ) ( not ( = ?auto_7378 ?auto_7382 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7380 ?auto_7379 ?auto_7381 )
      ( !LIFT ?auto_7382 ?auto_7377 ?auto_7383 ?auto_7381 )
      ( !LOAD ?auto_7382 ?auto_7377 ?auto_7380 ?auto_7381 )
      ( !DRIVE ?auto_7380 ?auto_7381 ?auto_7379 )
      ( !UNLOAD ?auto_7378 ?auto_7377 ?auto_7380 ?auto_7379 )
      ( !DROP ?auto_7378 ?auto_7377 ?auto_7376 ?auto_7379 )
      ( MAKE-1CRATE-VERIFY ?auto_7376 ?auto_7377 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7386 - SURFACE
      ?auto_7387 - SURFACE
    )
    :vars
    (
      ?auto_7388 - HOIST
      ?auto_7389 - PLACE
      ?auto_7391 - PLACE
      ?auto_7392 - HOIST
      ?auto_7393 - SURFACE
      ?auto_7390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7388 ?auto_7389 ) ( SURFACE-AT ?auto_7386 ?auto_7389 ) ( CLEAR ?auto_7386 ) ( IS-CRATE ?auto_7387 ) ( AVAILABLE ?auto_7388 ) ( not ( = ?auto_7391 ?auto_7389 ) ) ( HOIST-AT ?auto_7392 ?auto_7391 ) ( AVAILABLE ?auto_7392 ) ( SURFACE-AT ?auto_7387 ?auto_7391 ) ( ON ?auto_7387 ?auto_7393 ) ( CLEAR ?auto_7387 ) ( TRUCK-AT ?auto_7390 ?auto_7389 ) ( not ( = ?auto_7386 ?auto_7387 ) ) ( not ( = ?auto_7386 ?auto_7393 ) ) ( not ( = ?auto_7387 ?auto_7393 ) ) ( not ( = ?auto_7388 ?auto_7392 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7390 ?auto_7389 ?auto_7391 )
      ( !LIFT ?auto_7392 ?auto_7387 ?auto_7393 ?auto_7391 )
      ( !LOAD ?auto_7392 ?auto_7387 ?auto_7390 ?auto_7391 )
      ( !DRIVE ?auto_7390 ?auto_7391 ?auto_7389 )
      ( !UNLOAD ?auto_7388 ?auto_7387 ?auto_7390 ?auto_7389 )
      ( !DROP ?auto_7388 ?auto_7387 ?auto_7386 ?auto_7389 )
      ( MAKE-1CRATE-VERIFY ?auto_7386 ?auto_7387 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7397 - SURFACE
      ?auto_7398 - SURFACE
      ?auto_7399 - SURFACE
    )
    :vars
    (
      ?auto_7402 - HOIST
      ?auto_7405 - PLACE
      ?auto_7403 - PLACE
      ?auto_7400 - HOIST
      ?auto_7404 - SURFACE
      ?auto_7407 - PLACE
      ?auto_7406 - HOIST
      ?auto_7408 - SURFACE
      ?auto_7401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7402 ?auto_7405 ) ( IS-CRATE ?auto_7399 ) ( not ( = ?auto_7403 ?auto_7405 ) ) ( HOIST-AT ?auto_7400 ?auto_7403 ) ( AVAILABLE ?auto_7400 ) ( SURFACE-AT ?auto_7399 ?auto_7403 ) ( ON ?auto_7399 ?auto_7404 ) ( CLEAR ?auto_7399 ) ( not ( = ?auto_7398 ?auto_7399 ) ) ( not ( = ?auto_7398 ?auto_7404 ) ) ( not ( = ?auto_7399 ?auto_7404 ) ) ( not ( = ?auto_7402 ?auto_7400 ) ) ( SURFACE-AT ?auto_7397 ?auto_7405 ) ( CLEAR ?auto_7397 ) ( IS-CRATE ?auto_7398 ) ( AVAILABLE ?auto_7402 ) ( not ( = ?auto_7407 ?auto_7405 ) ) ( HOIST-AT ?auto_7406 ?auto_7407 ) ( AVAILABLE ?auto_7406 ) ( SURFACE-AT ?auto_7398 ?auto_7407 ) ( ON ?auto_7398 ?auto_7408 ) ( CLEAR ?auto_7398 ) ( TRUCK-AT ?auto_7401 ?auto_7405 ) ( not ( = ?auto_7397 ?auto_7398 ) ) ( not ( = ?auto_7397 ?auto_7408 ) ) ( not ( = ?auto_7398 ?auto_7408 ) ) ( not ( = ?auto_7402 ?auto_7406 ) ) ( not ( = ?auto_7397 ?auto_7399 ) ) ( not ( = ?auto_7397 ?auto_7404 ) ) ( not ( = ?auto_7399 ?auto_7408 ) ) ( not ( = ?auto_7403 ?auto_7407 ) ) ( not ( = ?auto_7400 ?auto_7406 ) ) ( not ( = ?auto_7404 ?auto_7408 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7397 ?auto_7398 )
      ( MAKE-1CRATE ?auto_7398 ?auto_7399 )
      ( MAKE-2CRATE-VERIFY ?auto_7397 ?auto_7398 ?auto_7399 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7411 - SURFACE
      ?auto_7412 - SURFACE
    )
    :vars
    (
      ?auto_7413 - HOIST
      ?auto_7414 - PLACE
      ?auto_7416 - PLACE
      ?auto_7417 - HOIST
      ?auto_7418 - SURFACE
      ?auto_7415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7413 ?auto_7414 ) ( SURFACE-AT ?auto_7411 ?auto_7414 ) ( CLEAR ?auto_7411 ) ( IS-CRATE ?auto_7412 ) ( AVAILABLE ?auto_7413 ) ( not ( = ?auto_7416 ?auto_7414 ) ) ( HOIST-AT ?auto_7417 ?auto_7416 ) ( AVAILABLE ?auto_7417 ) ( SURFACE-AT ?auto_7412 ?auto_7416 ) ( ON ?auto_7412 ?auto_7418 ) ( CLEAR ?auto_7412 ) ( TRUCK-AT ?auto_7415 ?auto_7414 ) ( not ( = ?auto_7411 ?auto_7412 ) ) ( not ( = ?auto_7411 ?auto_7418 ) ) ( not ( = ?auto_7412 ?auto_7418 ) ) ( not ( = ?auto_7413 ?auto_7417 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7415 ?auto_7414 ?auto_7416 )
      ( !LIFT ?auto_7417 ?auto_7412 ?auto_7418 ?auto_7416 )
      ( !LOAD ?auto_7417 ?auto_7412 ?auto_7415 ?auto_7416 )
      ( !DRIVE ?auto_7415 ?auto_7416 ?auto_7414 )
      ( !UNLOAD ?auto_7413 ?auto_7412 ?auto_7415 ?auto_7414 )
      ( !DROP ?auto_7413 ?auto_7412 ?auto_7411 ?auto_7414 )
      ( MAKE-1CRATE-VERIFY ?auto_7411 ?auto_7412 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7423 - SURFACE
      ?auto_7424 - SURFACE
      ?auto_7425 - SURFACE
      ?auto_7426 - SURFACE
    )
    :vars
    (
      ?auto_7432 - HOIST
      ?auto_7429 - PLACE
      ?auto_7428 - PLACE
      ?auto_7431 - HOIST
      ?auto_7427 - SURFACE
      ?auto_7434 - PLACE
      ?auto_7435 - HOIST
      ?auto_7436 - SURFACE
      ?auto_7433 - SURFACE
      ?auto_7430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7432 ?auto_7429 ) ( IS-CRATE ?auto_7426 ) ( not ( = ?auto_7428 ?auto_7429 ) ) ( HOIST-AT ?auto_7431 ?auto_7428 ) ( SURFACE-AT ?auto_7426 ?auto_7428 ) ( ON ?auto_7426 ?auto_7427 ) ( CLEAR ?auto_7426 ) ( not ( = ?auto_7425 ?auto_7426 ) ) ( not ( = ?auto_7425 ?auto_7427 ) ) ( not ( = ?auto_7426 ?auto_7427 ) ) ( not ( = ?auto_7432 ?auto_7431 ) ) ( IS-CRATE ?auto_7425 ) ( not ( = ?auto_7434 ?auto_7429 ) ) ( HOIST-AT ?auto_7435 ?auto_7434 ) ( AVAILABLE ?auto_7435 ) ( SURFACE-AT ?auto_7425 ?auto_7434 ) ( ON ?auto_7425 ?auto_7436 ) ( CLEAR ?auto_7425 ) ( not ( = ?auto_7424 ?auto_7425 ) ) ( not ( = ?auto_7424 ?auto_7436 ) ) ( not ( = ?auto_7425 ?auto_7436 ) ) ( not ( = ?auto_7432 ?auto_7435 ) ) ( SURFACE-AT ?auto_7423 ?auto_7429 ) ( CLEAR ?auto_7423 ) ( IS-CRATE ?auto_7424 ) ( AVAILABLE ?auto_7432 ) ( AVAILABLE ?auto_7431 ) ( SURFACE-AT ?auto_7424 ?auto_7428 ) ( ON ?auto_7424 ?auto_7433 ) ( CLEAR ?auto_7424 ) ( TRUCK-AT ?auto_7430 ?auto_7429 ) ( not ( = ?auto_7423 ?auto_7424 ) ) ( not ( = ?auto_7423 ?auto_7433 ) ) ( not ( = ?auto_7424 ?auto_7433 ) ) ( not ( = ?auto_7423 ?auto_7425 ) ) ( not ( = ?auto_7423 ?auto_7436 ) ) ( not ( = ?auto_7425 ?auto_7433 ) ) ( not ( = ?auto_7434 ?auto_7428 ) ) ( not ( = ?auto_7435 ?auto_7431 ) ) ( not ( = ?auto_7436 ?auto_7433 ) ) ( not ( = ?auto_7423 ?auto_7426 ) ) ( not ( = ?auto_7423 ?auto_7427 ) ) ( not ( = ?auto_7424 ?auto_7426 ) ) ( not ( = ?auto_7424 ?auto_7427 ) ) ( not ( = ?auto_7426 ?auto_7436 ) ) ( not ( = ?auto_7426 ?auto_7433 ) ) ( not ( = ?auto_7427 ?auto_7436 ) ) ( not ( = ?auto_7427 ?auto_7433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7423 ?auto_7424 ?auto_7425 )
      ( MAKE-1CRATE ?auto_7425 ?auto_7426 )
      ( MAKE-3CRATE-VERIFY ?auto_7423 ?auto_7424 ?auto_7425 ?auto_7426 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7439 - SURFACE
      ?auto_7440 - SURFACE
    )
    :vars
    (
      ?auto_7441 - HOIST
      ?auto_7442 - PLACE
      ?auto_7444 - PLACE
      ?auto_7445 - HOIST
      ?auto_7446 - SURFACE
      ?auto_7443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7441 ?auto_7442 ) ( SURFACE-AT ?auto_7439 ?auto_7442 ) ( CLEAR ?auto_7439 ) ( IS-CRATE ?auto_7440 ) ( AVAILABLE ?auto_7441 ) ( not ( = ?auto_7444 ?auto_7442 ) ) ( HOIST-AT ?auto_7445 ?auto_7444 ) ( AVAILABLE ?auto_7445 ) ( SURFACE-AT ?auto_7440 ?auto_7444 ) ( ON ?auto_7440 ?auto_7446 ) ( CLEAR ?auto_7440 ) ( TRUCK-AT ?auto_7443 ?auto_7442 ) ( not ( = ?auto_7439 ?auto_7440 ) ) ( not ( = ?auto_7439 ?auto_7446 ) ) ( not ( = ?auto_7440 ?auto_7446 ) ) ( not ( = ?auto_7441 ?auto_7445 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7443 ?auto_7442 ?auto_7444 )
      ( !LIFT ?auto_7445 ?auto_7440 ?auto_7446 ?auto_7444 )
      ( !LOAD ?auto_7445 ?auto_7440 ?auto_7443 ?auto_7444 )
      ( !DRIVE ?auto_7443 ?auto_7444 ?auto_7442 )
      ( !UNLOAD ?auto_7441 ?auto_7440 ?auto_7443 ?auto_7442 )
      ( !DROP ?auto_7441 ?auto_7440 ?auto_7439 ?auto_7442 )
      ( MAKE-1CRATE-VERIFY ?auto_7439 ?auto_7440 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7452 - SURFACE
      ?auto_7453 - SURFACE
      ?auto_7454 - SURFACE
      ?auto_7455 - SURFACE
      ?auto_7456 - SURFACE
    )
    :vars
    (
      ?auto_7461 - HOIST
      ?auto_7462 - PLACE
      ?auto_7459 - PLACE
      ?auto_7457 - HOIST
      ?auto_7458 - SURFACE
      ?auto_7464 - SURFACE
      ?auto_7467 - PLACE
      ?auto_7466 - HOIST
      ?auto_7465 - SURFACE
      ?auto_7463 - SURFACE
      ?auto_7460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7461 ?auto_7462 ) ( IS-CRATE ?auto_7456 ) ( not ( = ?auto_7459 ?auto_7462 ) ) ( HOIST-AT ?auto_7457 ?auto_7459 ) ( SURFACE-AT ?auto_7456 ?auto_7459 ) ( ON ?auto_7456 ?auto_7458 ) ( CLEAR ?auto_7456 ) ( not ( = ?auto_7455 ?auto_7456 ) ) ( not ( = ?auto_7455 ?auto_7458 ) ) ( not ( = ?auto_7456 ?auto_7458 ) ) ( not ( = ?auto_7461 ?auto_7457 ) ) ( IS-CRATE ?auto_7455 ) ( SURFACE-AT ?auto_7455 ?auto_7459 ) ( ON ?auto_7455 ?auto_7464 ) ( CLEAR ?auto_7455 ) ( not ( = ?auto_7454 ?auto_7455 ) ) ( not ( = ?auto_7454 ?auto_7464 ) ) ( not ( = ?auto_7455 ?auto_7464 ) ) ( IS-CRATE ?auto_7454 ) ( not ( = ?auto_7467 ?auto_7462 ) ) ( HOIST-AT ?auto_7466 ?auto_7467 ) ( AVAILABLE ?auto_7466 ) ( SURFACE-AT ?auto_7454 ?auto_7467 ) ( ON ?auto_7454 ?auto_7465 ) ( CLEAR ?auto_7454 ) ( not ( = ?auto_7453 ?auto_7454 ) ) ( not ( = ?auto_7453 ?auto_7465 ) ) ( not ( = ?auto_7454 ?auto_7465 ) ) ( not ( = ?auto_7461 ?auto_7466 ) ) ( SURFACE-AT ?auto_7452 ?auto_7462 ) ( CLEAR ?auto_7452 ) ( IS-CRATE ?auto_7453 ) ( AVAILABLE ?auto_7461 ) ( AVAILABLE ?auto_7457 ) ( SURFACE-AT ?auto_7453 ?auto_7459 ) ( ON ?auto_7453 ?auto_7463 ) ( CLEAR ?auto_7453 ) ( TRUCK-AT ?auto_7460 ?auto_7462 ) ( not ( = ?auto_7452 ?auto_7453 ) ) ( not ( = ?auto_7452 ?auto_7463 ) ) ( not ( = ?auto_7453 ?auto_7463 ) ) ( not ( = ?auto_7452 ?auto_7454 ) ) ( not ( = ?auto_7452 ?auto_7465 ) ) ( not ( = ?auto_7454 ?auto_7463 ) ) ( not ( = ?auto_7467 ?auto_7459 ) ) ( not ( = ?auto_7466 ?auto_7457 ) ) ( not ( = ?auto_7465 ?auto_7463 ) ) ( not ( = ?auto_7452 ?auto_7455 ) ) ( not ( = ?auto_7452 ?auto_7464 ) ) ( not ( = ?auto_7453 ?auto_7455 ) ) ( not ( = ?auto_7453 ?auto_7464 ) ) ( not ( = ?auto_7455 ?auto_7465 ) ) ( not ( = ?auto_7455 ?auto_7463 ) ) ( not ( = ?auto_7464 ?auto_7465 ) ) ( not ( = ?auto_7464 ?auto_7463 ) ) ( not ( = ?auto_7452 ?auto_7456 ) ) ( not ( = ?auto_7452 ?auto_7458 ) ) ( not ( = ?auto_7453 ?auto_7456 ) ) ( not ( = ?auto_7453 ?auto_7458 ) ) ( not ( = ?auto_7454 ?auto_7456 ) ) ( not ( = ?auto_7454 ?auto_7458 ) ) ( not ( = ?auto_7456 ?auto_7464 ) ) ( not ( = ?auto_7456 ?auto_7465 ) ) ( not ( = ?auto_7456 ?auto_7463 ) ) ( not ( = ?auto_7458 ?auto_7464 ) ) ( not ( = ?auto_7458 ?auto_7465 ) ) ( not ( = ?auto_7458 ?auto_7463 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7452 ?auto_7453 ?auto_7454 ?auto_7455 )
      ( MAKE-1CRATE ?auto_7455 ?auto_7456 )
      ( MAKE-4CRATE-VERIFY ?auto_7452 ?auto_7453 ?auto_7454 ?auto_7455 ?auto_7456 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7470 - SURFACE
      ?auto_7471 - SURFACE
    )
    :vars
    (
      ?auto_7472 - HOIST
      ?auto_7473 - PLACE
      ?auto_7475 - PLACE
      ?auto_7476 - HOIST
      ?auto_7477 - SURFACE
      ?auto_7474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7472 ?auto_7473 ) ( SURFACE-AT ?auto_7470 ?auto_7473 ) ( CLEAR ?auto_7470 ) ( IS-CRATE ?auto_7471 ) ( AVAILABLE ?auto_7472 ) ( not ( = ?auto_7475 ?auto_7473 ) ) ( HOIST-AT ?auto_7476 ?auto_7475 ) ( AVAILABLE ?auto_7476 ) ( SURFACE-AT ?auto_7471 ?auto_7475 ) ( ON ?auto_7471 ?auto_7477 ) ( CLEAR ?auto_7471 ) ( TRUCK-AT ?auto_7474 ?auto_7473 ) ( not ( = ?auto_7470 ?auto_7471 ) ) ( not ( = ?auto_7470 ?auto_7477 ) ) ( not ( = ?auto_7471 ?auto_7477 ) ) ( not ( = ?auto_7472 ?auto_7476 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7474 ?auto_7473 ?auto_7475 )
      ( !LIFT ?auto_7476 ?auto_7471 ?auto_7477 ?auto_7475 )
      ( !LOAD ?auto_7476 ?auto_7471 ?auto_7474 ?auto_7475 )
      ( !DRIVE ?auto_7474 ?auto_7475 ?auto_7473 )
      ( !UNLOAD ?auto_7472 ?auto_7471 ?auto_7474 ?auto_7473 )
      ( !DROP ?auto_7472 ?auto_7471 ?auto_7470 ?auto_7473 )
      ( MAKE-1CRATE-VERIFY ?auto_7470 ?auto_7471 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7484 - SURFACE
      ?auto_7485 - SURFACE
      ?auto_7486 - SURFACE
      ?auto_7487 - SURFACE
      ?auto_7488 - SURFACE
      ?auto_7489 - SURFACE
    )
    :vars
    (
      ?auto_7490 - HOIST
      ?auto_7494 - PLACE
      ?auto_7495 - PLACE
      ?auto_7493 - HOIST
      ?auto_7492 - SURFACE
      ?auto_7501 - SURFACE
      ?auto_7500 - SURFACE
      ?auto_7498 - PLACE
      ?auto_7497 - HOIST
      ?auto_7499 - SURFACE
      ?auto_7496 - SURFACE
      ?auto_7491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7490 ?auto_7494 ) ( IS-CRATE ?auto_7489 ) ( not ( = ?auto_7495 ?auto_7494 ) ) ( HOIST-AT ?auto_7493 ?auto_7495 ) ( SURFACE-AT ?auto_7489 ?auto_7495 ) ( ON ?auto_7489 ?auto_7492 ) ( CLEAR ?auto_7489 ) ( not ( = ?auto_7488 ?auto_7489 ) ) ( not ( = ?auto_7488 ?auto_7492 ) ) ( not ( = ?auto_7489 ?auto_7492 ) ) ( not ( = ?auto_7490 ?auto_7493 ) ) ( IS-CRATE ?auto_7488 ) ( SURFACE-AT ?auto_7488 ?auto_7495 ) ( ON ?auto_7488 ?auto_7501 ) ( CLEAR ?auto_7488 ) ( not ( = ?auto_7487 ?auto_7488 ) ) ( not ( = ?auto_7487 ?auto_7501 ) ) ( not ( = ?auto_7488 ?auto_7501 ) ) ( IS-CRATE ?auto_7487 ) ( SURFACE-AT ?auto_7487 ?auto_7495 ) ( ON ?auto_7487 ?auto_7500 ) ( CLEAR ?auto_7487 ) ( not ( = ?auto_7486 ?auto_7487 ) ) ( not ( = ?auto_7486 ?auto_7500 ) ) ( not ( = ?auto_7487 ?auto_7500 ) ) ( IS-CRATE ?auto_7486 ) ( not ( = ?auto_7498 ?auto_7494 ) ) ( HOIST-AT ?auto_7497 ?auto_7498 ) ( AVAILABLE ?auto_7497 ) ( SURFACE-AT ?auto_7486 ?auto_7498 ) ( ON ?auto_7486 ?auto_7499 ) ( CLEAR ?auto_7486 ) ( not ( = ?auto_7485 ?auto_7486 ) ) ( not ( = ?auto_7485 ?auto_7499 ) ) ( not ( = ?auto_7486 ?auto_7499 ) ) ( not ( = ?auto_7490 ?auto_7497 ) ) ( SURFACE-AT ?auto_7484 ?auto_7494 ) ( CLEAR ?auto_7484 ) ( IS-CRATE ?auto_7485 ) ( AVAILABLE ?auto_7490 ) ( AVAILABLE ?auto_7493 ) ( SURFACE-AT ?auto_7485 ?auto_7495 ) ( ON ?auto_7485 ?auto_7496 ) ( CLEAR ?auto_7485 ) ( TRUCK-AT ?auto_7491 ?auto_7494 ) ( not ( = ?auto_7484 ?auto_7485 ) ) ( not ( = ?auto_7484 ?auto_7496 ) ) ( not ( = ?auto_7485 ?auto_7496 ) ) ( not ( = ?auto_7484 ?auto_7486 ) ) ( not ( = ?auto_7484 ?auto_7499 ) ) ( not ( = ?auto_7486 ?auto_7496 ) ) ( not ( = ?auto_7498 ?auto_7495 ) ) ( not ( = ?auto_7497 ?auto_7493 ) ) ( not ( = ?auto_7499 ?auto_7496 ) ) ( not ( = ?auto_7484 ?auto_7487 ) ) ( not ( = ?auto_7484 ?auto_7500 ) ) ( not ( = ?auto_7485 ?auto_7487 ) ) ( not ( = ?auto_7485 ?auto_7500 ) ) ( not ( = ?auto_7487 ?auto_7499 ) ) ( not ( = ?auto_7487 ?auto_7496 ) ) ( not ( = ?auto_7500 ?auto_7499 ) ) ( not ( = ?auto_7500 ?auto_7496 ) ) ( not ( = ?auto_7484 ?auto_7488 ) ) ( not ( = ?auto_7484 ?auto_7501 ) ) ( not ( = ?auto_7485 ?auto_7488 ) ) ( not ( = ?auto_7485 ?auto_7501 ) ) ( not ( = ?auto_7486 ?auto_7488 ) ) ( not ( = ?auto_7486 ?auto_7501 ) ) ( not ( = ?auto_7488 ?auto_7500 ) ) ( not ( = ?auto_7488 ?auto_7499 ) ) ( not ( = ?auto_7488 ?auto_7496 ) ) ( not ( = ?auto_7501 ?auto_7500 ) ) ( not ( = ?auto_7501 ?auto_7499 ) ) ( not ( = ?auto_7501 ?auto_7496 ) ) ( not ( = ?auto_7484 ?auto_7489 ) ) ( not ( = ?auto_7484 ?auto_7492 ) ) ( not ( = ?auto_7485 ?auto_7489 ) ) ( not ( = ?auto_7485 ?auto_7492 ) ) ( not ( = ?auto_7486 ?auto_7489 ) ) ( not ( = ?auto_7486 ?auto_7492 ) ) ( not ( = ?auto_7487 ?auto_7489 ) ) ( not ( = ?auto_7487 ?auto_7492 ) ) ( not ( = ?auto_7489 ?auto_7501 ) ) ( not ( = ?auto_7489 ?auto_7500 ) ) ( not ( = ?auto_7489 ?auto_7499 ) ) ( not ( = ?auto_7489 ?auto_7496 ) ) ( not ( = ?auto_7492 ?auto_7501 ) ) ( not ( = ?auto_7492 ?auto_7500 ) ) ( not ( = ?auto_7492 ?auto_7499 ) ) ( not ( = ?auto_7492 ?auto_7496 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7484 ?auto_7485 ?auto_7486 ?auto_7487 ?auto_7488 )
      ( MAKE-1CRATE ?auto_7488 ?auto_7489 )
      ( MAKE-5CRATE-VERIFY ?auto_7484 ?auto_7485 ?auto_7486 ?auto_7487 ?auto_7488 ?auto_7489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7504 - SURFACE
      ?auto_7505 - SURFACE
    )
    :vars
    (
      ?auto_7506 - HOIST
      ?auto_7507 - PLACE
      ?auto_7509 - PLACE
      ?auto_7510 - HOIST
      ?auto_7511 - SURFACE
      ?auto_7508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7506 ?auto_7507 ) ( SURFACE-AT ?auto_7504 ?auto_7507 ) ( CLEAR ?auto_7504 ) ( IS-CRATE ?auto_7505 ) ( AVAILABLE ?auto_7506 ) ( not ( = ?auto_7509 ?auto_7507 ) ) ( HOIST-AT ?auto_7510 ?auto_7509 ) ( AVAILABLE ?auto_7510 ) ( SURFACE-AT ?auto_7505 ?auto_7509 ) ( ON ?auto_7505 ?auto_7511 ) ( CLEAR ?auto_7505 ) ( TRUCK-AT ?auto_7508 ?auto_7507 ) ( not ( = ?auto_7504 ?auto_7505 ) ) ( not ( = ?auto_7504 ?auto_7511 ) ) ( not ( = ?auto_7505 ?auto_7511 ) ) ( not ( = ?auto_7506 ?auto_7510 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7508 ?auto_7507 ?auto_7509 )
      ( !LIFT ?auto_7510 ?auto_7505 ?auto_7511 ?auto_7509 )
      ( !LOAD ?auto_7510 ?auto_7505 ?auto_7508 ?auto_7509 )
      ( !DRIVE ?auto_7508 ?auto_7509 ?auto_7507 )
      ( !UNLOAD ?auto_7506 ?auto_7505 ?auto_7508 ?auto_7507 )
      ( !DROP ?auto_7506 ?auto_7505 ?auto_7504 ?auto_7507 )
      ( MAKE-1CRATE-VERIFY ?auto_7504 ?auto_7505 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7519 - SURFACE
      ?auto_7520 - SURFACE
      ?auto_7521 - SURFACE
      ?auto_7522 - SURFACE
      ?auto_7523 - SURFACE
      ?auto_7525 - SURFACE
      ?auto_7524 - SURFACE
    )
    :vars
    (
      ?auto_7531 - HOIST
      ?auto_7529 - PLACE
      ?auto_7527 - PLACE
      ?auto_7528 - HOIST
      ?auto_7530 - SURFACE
      ?auto_7537 - PLACE
      ?auto_7538 - HOIST
      ?auto_7540 - SURFACE
      ?auto_7534 - SURFACE
      ?auto_7533 - SURFACE
      ?auto_7539 - PLACE
      ?auto_7535 - HOIST
      ?auto_7532 - SURFACE
      ?auto_7536 - SURFACE
      ?auto_7526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7531 ?auto_7529 ) ( IS-CRATE ?auto_7524 ) ( not ( = ?auto_7527 ?auto_7529 ) ) ( HOIST-AT ?auto_7528 ?auto_7527 ) ( AVAILABLE ?auto_7528 ) ( SURFACE-AT ?auto_7524 ?auto_7527 ) ( ON ?auto_7524 ?auto_7530 ) ( CLEAR ?auto_7524 ) ( not ( = ?auto_7525 ?auto_7524 ) ) ( not ( = ?auto_7525 ?auto_7530 ) ) ( not ( = ?auto_7524 ?auto_7530 ) ) ( not ( = ?auto_7531 ?auto_7528 ) ) ( IS-CRATE ?auto_7525 ) ( not ( = ?auto_7537 ?auto_7529 ) ) ( HOIST-AT ?auto_7538 ?auto_7537 ) ( SURFACE-AT ?auto_7525 ?auto_7537 ) ( ON ?auto_7525 ?auto_7540 ) ( CLEAR ?auto_7525 ) ( not ( = ?auto_7523 ?auto_7525 ) ) ( not ( = ?auto_7523 ?auto_7540 ) ) ( not ( = ?auto_7525 ?auto_7540 ) ) ( not ( = ?auto_7531 ?auto_7538 ) ) ( IS-CRATE ?auto_7523 ) ( SURFACE-AT ?auto_7523 ?auto_7537 ) ( ON ?auto_7523 ?auto_7534 ) ( CLEAR ?auto_7523 ) ( not ( = ?auto_7522 ?auto_7523 ) ) ( not ( = ?auto_7522 ?auto_7534 ) ) ( not ( = ?auto_7523 ?auto_7534 ) ) ( IS-CRATE ?auto_7522 ) ( SURFACE-AT ?auto_7522 ?auto_7537 ) ( ON ?auto_7522 ?auto_7533 ) ( CLEAR ?auto_7522 ) ( not ( = ?auto_7521 ?auto_7522 ) ) ( not ( = ?auto_7521 ?auto_7533 ) ) ( not ( = ?auto_7522 ?auto_7533 ) ) ( IS-CRATE ?auto_7521 ) ( not ( = ?auto_7539 ?auto_7529 ) ) ( HOIST-AT ?auto_7535 ?auto_7539 ) ( AVAILABLE ?auto_7535 ) ( SURFACE-AT ?auto_7521 ?auto_7539 ) ( ON ?auto_7521 ?auto_7532 ) ( CLEAR ?auto_7521 ) ( not ( = ?auto_7520 ?auto_7521 ) ) ( not ( = ?auto_7520 ?auto_7532 ) ) ( not ( = ?auto_7521 ?auto_7532 ) ) ( not ( = ?auto_7531 ?auto_7535 ) ) ( SURFACE-AT ?auto_7519 ?auto_7529 ) ( CLEAR ?auto_7519 ) ( IS-CRATE ?auto_7520 ) ( AVAILABLE ?auto_7531 ) ( AVAILABLE ?auto_7538 ) ( SURFACE-AT ?auto_7520 ?auto_7537 ) ( ON ?auto_7520 ?auto_7536 ) ( CLEAR ?auto_7520 ) ( TRUCK-AT ?auto_7526 ?auto_7529 ) ( not ( = ?auto_7519 ?auto_7520 ) ) ( not ( = ?auto_7519 ?auto_7536 ) ) ( not ( = ?auto_7520 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7521 ) ) ( not ( = ?auto_7519 ?auto_7532 ) ) ( not ( = ?auto_7521 ?auto_7536 ) ) ( not ( = ?auto_7539 ?auto_7537 ) ) ( not ( = ?auto_7535 ?auto_7538 ) ) ( not ( = ?auto_7532 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7522 ) ) ( not ( = ?auto_7519 ?auto_7533 ) ) ( not ( = ?auto_7520 ?auto_7522 ) ) ( not ( = ?auto_7520 ?auto_7533 ) ) ( not ( = ?auto_7522 ?auto_7532 ) ) ( not ( = ?auto_7522 ?auto_7536 ) ) ( not ( = ?auto_7533 ?auto_7532 ) ) ( not ( = ?auto_7533 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7523 ) ) ( not ( = ?auto_7519 ?auto_7534 ) ) ( not ( = ?auto_7520 ?auto_7523 ) ) ( not ( = ?auto_7520 ?auto_7534 ) ) ( not ( = ?auto_7521 ?auto_7523 ) ) ( not ( = ?auto_7521 ?auto_7534 ) ) ( not ( = ?auto_7523 ?auto_7533 ) ) ( not ( = ?auto_7523 ?auto_7532 ) ) ( not ( = ?auto_7523 ?auto_7536 ) ) ( not ( = ?auto_7534 ?auto_7533 ) ) ( not ( = ?auto_7534 ?auto_7532 ) ) ( not ( = ?auto_7534 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7525 ) ) ( not ( = ?auto_7519 ?auto_7540 ) ) ( not ( = ?auto_7520 ?auto_7525 ) ) ( not ( = ?auto_7520 ?auto_7540 ) ) ( not ( = ?auto_7521 ?auto_7525 ) ) ( not ( = ?auto_7521 ?auto_7540 ) ) ( not ( = ?auto_7522 ?auto_7525 ) ) ( not ( = ?auto_7522 ?auto_7540 ) ) ( not ( = ?auto_7525 ?auto_7534 ) ) ( not ( = ?auto_7525 ?auto_7533 ) ) ( not ( = ?auto_7525 ?auto_7532 ) ) ( not ( = ?auto_7525 ?auto_7536 ) ) ( not ( = ?auto_7540 ?auto_7534 ) ) ( not ( = ?auto_7540 ?auto_7533 ) ) ( not ( = ?auto_7540 ?auto_7532 ) ) ( not ( = ?auto_7540 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7524 ) ) ( not ( = ?auto_7519 ?auto_7530 ) ) ( not ( = ?auto_7520 ?auto_7524 ) ) ( not ( = ?auto_7520 ?auto_7530 ) ) ( not ( = ?auto_7521 ?auto_7524 ) ) ( not ( = ?auto_7521 ?auto_7530 ) ) ( not ( = ?auto_7522 ?auto_7524 ) ) ( not ( = ?auto_7522 ?auto_7530 ) ) ( not ( = ?auto_7523 ?auto_7524 ) ) ( not ( = ?auto_7523 ?auto_7530 ) ) ( not ( = ?auto_7524 ?auto_7540 ) ) ( not ( = ?auto_7524 ?auto_7534 ) ) ( not ( = ?auto_7524 ?auto_7533 ) ) ( not ( = ?auto_7524 ?auto_7532 ) ) ( not ( = ?auto_7524 ?auto_7536 ) ) ( not ( = ?auto_7527 ?auto_7537 ) ) ( not ( = ?auto_7527 ?auto_7539 ) ) ( not ( = ?auto_7528 ?auto_7538 ) ) ( not ( = ?auto_7528 ?auto_7535 ) ) ( not ( = ?auto_7530 ?auto_7540 ) ) ( not ( = ?auto_7530 ?auto_7534 ) ) ( not ( = ?auto_7530 ?auto_7533 ) ) ( not ( = ?auto_7530 ?auto_7532 ) ) ( not ( = ?auto_7530 ?auto_7536 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7519 ?auto_7520 ?auto_7521 ?auto_7522 ?auto_7523 ?auto_7525 )
      ( MAKE-1CRATE ?auto_7525 ?auto_7524 )
      ( MAKE-6CRATE-VERIFY ?auto_7519 ?auto_7520 ?auto_7521 ?auto_7522 ?auto_7523 ?auto_7525 ?auto_7524 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7543 - SURFACE
      ?auto_7544 - SURFACE
    )
    :vars
    (
      ?auto_7545 - HOIST
      ?auto_7546 - PLACE
      ?auto_7548 - PLACE
      ?auto_7549 - HOIST
      ?auto_7550 - SURFACE
      ?auto_7547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7545 ?auto_7546 ) ( SURFACE-AT ?auto_7543 ?auto_7546 ) ( CLEAR ?auto_7543 ) ( IS-CRATE ?auto_7544 ) ( AVAILABLE ?auto_7545 ) ( not ( = ?auto_7548 ?auto_7546 ) ) ( HOIST-AT ?auto_7549 ?auto_7548 ) ( AVAILABLE ?auto_7549 ) ( SURFACE-AT ?auto_7544 ?auto_7548 ) ( ON ?auto_7544 ?auto_7550 ) ( CLEAR ?auto_7544 ) ( TRUCK-AT ?auto_7547 ?auto_7546 ) ( not ( = ?auto_7543 ?auto_7544 ) ) ( not ( = ?auto_7543 ?auto_7550 ) ) ( not ( = ?auto_7544 ?auto_7550 ) ) ( not ( = ?auto_7545 ?auto_7549 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7547 ?auto_7546 ?auto_7548 )
      ( !LIFT ?auto_7549 ?auto_7544 ?auto_7550 ?auto_7548 )
      ( !LOAD ?auto_7549 ?auto_7544 ?auto_7547 ?auto_7548 )
      ( !DRIVE ?auto_7547 ?auto_7548 ?auto_7546 )
      ( !UNLOAD ?auto_7545 ?auto_7544 ?auto_7547 ?auto_7546 )
      ( !DROP ?auto_7545 ?auto_7544 ?auto_7543 ?auto_7546 )
      ( MAKE-1CRATE-VERIFY ?auto_7543 ?auto_7544 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7559 - SURFACE
      ?auto_7560 - SURFACE
      ?auto_7561 - SURFACE
      ?auto_7562 - SURFACE
      ?auto_7563 - SURFACE
      ?auto_7565 - SURFACE
      ?auto_7564 - SURFACE
      ?auto_7566 - SURFACE
    )
    :vars
    (
      ?auto_7569 - HOIST
      ?auto_7567 - PLACE
      ?auto_7571 - PLACE
      ?auto_7572 - HOIST
      ?auto_7570 - SURFACE
      ?auto_7574 - PLACE
      ?auto_7582 - HOIST
      ?auto_7575 - SURFACE
      ?auto_7580 - PLACE
      ?auto_7579 - HOIST
      ?auto_7577 - SURFACE
      ?auto_7584 - SURFACE
      ?auto_7583 - SURFACE
      ?auto_7578 - PLACE
      ?auto_7576 - HOIST
      ?auto_7573 - SURFACE
      ?auto_7581 - SURFACE
      ?auto_7568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7569 ?auto_7567 ) ( IS-CRATE ?auto_7566 ) ( not ( = ?auto_7571 ?auto_7567 ) ) ( HOIST-AT ?auto_7572 ?auto_7571 ) ( AVAILABLE ?auto_7572 ) ( SURFACE-AT ?auto_7566 ?auto_7571 ) ( ON ?auto_7566 ?auto_7570 ) ( CLEAR ?auto_7566 ) ( not ( = ?auto_7564 ?auto_7566 ) ) ( not ( = ?auto_7564 ?auto_7570 ) ) ( not ( = ?auto_7566 ?auto_7570 ) ) ( not ( = ?auto_7569 ?auto_7572 ) ) ( IS-CRATE ?auto_7564 ) ( not ( = ?auto_7574 ?auto_7567 ) ) ( HOIST-AT ?auto_7582 ?auto_7574 ) ( AVAILABLE ?auto_7582 ) ( SURFACE-AT ?auto_7564 ?auto_7574 ) ( ON ?auto_7564 ?auto_7575 ) ( CLEAR ?auto_7564 ) ( not ( = ?auto_7565 ?auto_7564 ) ) ( not ( = ?auto_7565 ?auto_7575 ) ) ( not ( = ?auto_7564 ?auto_7575 ) ) ( not ( = ?auto_7569 ?auto_7582 ) ) ( IS-CRATE ?auto_7565 ) ( not ( = ?auto_7580 ?auto_7567 ) ) ( HOIST-AT ?auto_7579 ?auto_7580 ) ( SURFACE-AT ?auto_7565 ?auto_7580 ) ( ON ?auto_7565 ?auto_7577 ) ( CLEAR ?auto_7565 ) ( not ( = ?auto_7563 ?auto_7565 ) ) ( not ( = ?auto_7563 ?auto_7577 ) ) ( not ( = ?auto_7565 ?auto_7577 ) ) ( not ( = ?auto_7569 ?auto_7579 ) ) ( IS-CRATE ?auto_7563 ) ( SURFACE-AT ?auto_7563 ?auto_7580 ) ( ON ?auto_7563 ?auto_7584 ) ( CLEAR ?auto_7563 ) ( not ( = ?auto_7562 ?auto_7563 ) ) ( not ( = ?auto_7562 ?auto_7584 ) ) ( not ( = ?auto_7563 ?auto_7584 ) ) ( IS-CRATE ?auto_7562 ) ( SURFACE-AT ?auto_7562 ?auto_7580 ) ( ON ?auto_7562 ?auto_7583 ) ( CLEAR ?auto_7562 ) ( not ( = ?auto_7561 ?auto_7562 ) ) ( not ( = ?auto_7561 ?auto_7583 ) ) ( not ( = ?auto_7562 ?auto_7583 ) ) ( IS-CRATE ?auto_7561 ) ( not ( = ?auto_7578 ?auto_7567 ) ) ( HOIST-AT ?auto_7576 ?auto_7578 ) ( AVAILABLE ?auto_7576 ) ( SURFACE-AT ?auto_7561 ?auto_7578 ) ( ON ?auto_7561 ?auto_7573 ) ( CLEAR ?auto_7561 ) ( not ( = ?auto_7560 ?auto_7561 ) ) ( not ( = ?auto_7560 ?auto_7573 ) ) ( not ( = ?auto_7561 ?auto_7573 ) ) ( not ( = ?auto_7569 ?auto_7576 ) ) ( SURFACE-AT ?auto_7559 ?auto_7567 ) ( CLEAR ?auto_7559 ) ( IS-CRATE ?auto_7560 ) ( AVAILABLE ?auto_7569 ) ( AVAILABLE ?auto_7579 ) ( SURFACE-AT ?auto_7560 ?auto_7580 ) ( ON ?auto_7560 ?auto_7581 ) ( CLEAR ?auto_7560 ) ( TRUCK-AT ?auto_7568 ?auto_7567 ) ( not ( = ?auto_7559 ?auto_7560 ) ) ( not ( = ?auto_7559 ?auto_7581 ) ) ( not ( = ?auto_7560 ?auto_7581 ) ) ( not ( = ?auto_7559 ?auto_7561 ) ) ( not ( = ?auto_7559 ?auto_7573 ) ) ( not ( = ?auto_7561 ?auto_7581 ) ) ( not ( = ?auto_7578 ?auto_7580 ) ) ( not ( = ?auto_7576 ?auto_7579 ) ) ( not ( = ?auto_7573 ?auto_7581 ) ) ( not ( = ?auto_7559 ?auto_7562 ) ) ( not ( = ?auto_7559 ?auto_7583 ) ) ( not ( = ?auto_7560 ?auto_7562 ) ) ( not ( = ?auto_7560 ?auto_7583 ) ) ( not ( = ?auto_7562 ?auto_7573 ) ) ( not ( = ?auto_7562 ?auto_7581 ) ) ( not ( = ?auto_7583 ?auto_7573 ) ) ( not ( = ?auto_7583 ?auto_7581 ) ) ( not ( = ?auto_7559 ?auto_7563 ) ) ( not ( = ?auto_7559 ?auto_7584 ) ) ( not ( = ?auto_7560 ?auto_7563 ) ) ( not ( = ?auto_7560 ?auto_7584 ) ) ( not ( = ?auto_7561 ?auto_7563 ) ) ( not ( = ?auto_7561 ?auto_7584 ) ) ( not ( = ?auto_7563 ?auto_7583 ) ) ( not ( = ?auto_7563 ?auto_7573 ) ) ( not ( = ?auto_7563 ?auto_7581 ) ) ( not ( = ?auto_7584 ?auto_7583 ) ) ( not ( = ?auto_7584 ?auto_7573 ) ) ( not ( = ?auto_7584 ?auto_7581 ) ) ( not ( = ?auto_7559 ?auto_7565 ) ) ( not ( = ?auto_7559 ?auto_7577 ) ) ( not ( = ?auto_7560 ?auto_7565 ) ) ( not ( = ?auto_7560 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7565 ) ) ( not ( = ?auto_7561 ?auto_7577 ) ) ( not ( = ?auto_7562 ?auto_7565 ) ) ( not ( = ?auto_7562 ?auto_7577 ) ) ( not ( = ?auto_7565 ?auto_7584 ) ) ( not ( = ?auto_7565 ?auto_7583 ) ) ( not ( = ?auto_7565 ?auto_7573 ) ) ( not ( = ?auto_7565 ?auto_7581 ) ) ( not ( = ?auto_7577 ?auto_7584 ) ) ( not ( = ?auto_7577 ?auto_7583 ) ) ( not ( = ?auto_7577 ?auto_7573 ) ) ( not ( = ?auto_7577 ?auto_7581 ) ) ( not ( = ?auto_7559 ?auto_7564 ) ) ( not ( = ?auto_7559 ?auto_7575 ) ) ( not ( = ?auto_7560 ?auto_7564 ) ) ( not ( = ?auto_7560 ?auto_7575 ) ) ( not ( = ?auto_7561 ?auto_7564 ) ) ( not ( = ?auto_7561 ?auto_7575 ) ) ( not ( = ?auto_7562 ?auto_7564 ) ) ( not ( = ?auto_7562 ?auto_7575 ) ) ( not ( = ?auto_7563 ?auto_7564 ) ) ( not ( = ?auto_7563 ?auto_7575 ) ) ( not ( = ?auto_7564 ?auto_7577 ) ) ( not ( = ?auto_7564 ?auto_7584 ) ) ( not ( = ?auto_7564 ?auto_7583 ) ) ( not ( = ?auto_7564 ?auto_7573 ) ) ( not ( = ?auto_7564 ?auto_7581 ) ) ( not ( = ?auto_7574 ?auto_7580 ) ) ( not ( = ?auto_7574 ?auto_7578 ) ) ( not ( = ?auto_7582 ?auto_7579 ) ) ( not ( = ?auto_7582 ?auto_7576 ) ) ( not ( = ?auto_7575 ?auto_7577 ) ) ( not ( = ?auto_7575 ?auto_7584 ) ) ( not ( = ?auto_7575 ?auto_7583 ) ) ( not ( = ?auto_7575 ?auto_7573 ) ) ( not ( = ?auto_7575 ?auto_7581 ) ) ( not ( = ?auto_7559 ?auto_7566 ) ) ( not ( = ?auto_7559 ?auto_7570 ) ) ( not ( = ?auto_7560 ?auto_7566 ) ) ( not ( = ?auto_7560 ?auto_7570 ) ) ( not ( = ?auto_7561 ?auto_7566 ) ) ( not ( = ?auto_7561 ?auto_7570 ) ) ( not ( = ?auto_7562 ?auto_7566 ) ) ( not ( = ?auto_7562 ?auto_7570 ) ) ( not ( = ?auto_7563 ?auto_7566 ) ) ( not ( = ?auto_7563 ?auto_7570 ) ) ( not ( = ?auto_7565 ?auto_7566 ) ) ( not ( = ?auto_7565 ?auto_7570 ) ) ( not ( = ?auto_7566 ?auto_7575 ) ) ( not ( = ?auto_7566 ?auto_7577 ) ) ( not ( = ?auto_7566 ?auto_7584 ) ) ( not ( = ?auto_7566 ?auto_7583 ) ) ( not ( = ?auto_7566 ?auto_7573 ) ) ( not ( = ?auto_7566 ?auto_7581 ) ) ( not ( = ?auto_7571 ?auto_7574 ) ) ( not ( = ?auto_7571 ?auto_7580 ) ) ( not ( = ?auto_7571 ?auto_7578 ) ) ( not ( = ?auto_7572 ?auto_7582 ) ) ( not ( = ?auto_7572 ?auto_7579 ) ) ( not ( = ?auto_7572 ?auto_7576 ) ) ( not ( = ?auto_7570 ?auto_7575 ) ) ( not ( = ?auto_7570 ?auto_7577 ) ) ( not ( = ?auto_7570 ?auto_7584 ) ) ( not ( = ?auto_7570 ?auto_7583 ) ) ( not ( = ?auto_7570 ?auto_7573 ) ) ( not ( = ?auto_7570 ?auto_7581 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7559 ?auto_7560 ?auto_7561 ?auto_7562 ?auto_7563 ?auto_7565 ?auto_7564 )
      ( MAKE-1CRATE ?auto_7564 ?auto_7566 )
      ( MAKE-7CRATE-VERIFY ?auto_7559 ?auto_7560 ?auto_7561 ?auto_7562 ?auto_7563 ?auto_7565 ?auto_7564 ?auto_7566 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7587 - SURFACE
      ?auto_7588 - SURFACE
    )
    :vars
    (
      ?auto_7589 - HOIST
      ?auto_7590 - PLACE
      ?auto_7592 - PLACE
      ?auto_7593 - HOIST
      ?auto_7594 - SURFACE
      ?auto_7591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7589 ?auto_7590 ) ( SURFACE-AT ?auto_7587 ?auto_7590 ) ( CLEAR ?auto_7587 ) ( IS-CRATE ?auto_7588 ) ( AVAILABLE ?auto_7589 ) ( not ( = ?auto_7592 ?auto_7590 ) ) ( HOIST-AT ?auto_7593 ?auto_7592 ) ( AVAILABLE ?auto_7593 ) ( SURFACE-AT ?auto_7588 ?auto_7592 ) ( ON ?auto_7588 ?auto_7594 ) ( CLEAR ?auto_7588 ) ( TRUCK-AT ?auto_7591 ?auto_7590 ) ( not ( = ?auto_7587 ?auto_7588 ) ) ( not ( = ?auto_7587 ?auto_7594 ) ) ( not ( = ?auto_7588 ?auto_7594 ) ) ( not ( = ?auto_7589 ?auto_7593 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7591 ?auto_7590 ?auto_7592 )
      ( !LIFT ?auto_7593 ?auto_7588 ?auto_7594 ?auto_7592 )
      ( !LOAD ?auto_7593 ?auto_7588 ?auto_7591 ?auto_7592 )
      ( !DRIVE ?auto_7591 ?auto_7592 ?auto_7590 )
      ( !UNLOAD ?auto_7589 ?auto_7588 ?auto_7591 ?auto_7590 )
      ( !DROP ?auto_7589 ?auto_7588 ?auto_7587 ?auto_7590 )
      ( MAKE-1CRATE-VERIFY ?auto_7587 ?auto_7588 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_7604 - SURFACE
      ?auto_7605 - SURFACE
      ?auto_7606 - SURFACE
      ?auto_7607 - SURFACE
      ?auto_7608 - SURFACE
      ?auto_7610 - SURFACE
      ?auto_7609 - SURFACE
      ?auto_7612 - SURFACE
      ?auto_7611 - SURFACE
    )
    :vars
    (
      ?auto_7613 - HOIST
      ?auto_7614 - PLACE
      ?auto_7616 - PLACE
      ?auto_7615 - HOIST
      ?auto_7618 - SURFACE
      ?auto_7632 - PLACE
      ?auto_7619 - HOIST
      ?auto_7633 - SURFACE
      ?auto_7621 - PLACE
      ?auto_7626 - HOIST
      ?auto_7622 - SURFACE
      ?auto_7628 - PLACE
      ?auto_7629 - HOIST
      ?auto_7631 - SURFACE
      ?auto_7627 - SURFACE
      ?auto_7625 - SURFACE
      ?auto_7630 - PLACE
      ?auto_7620 - HOIST
      ?auto_7623 - SURFACE
      ?auto_7624 - SURFACE
      ?auto_7617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7613 ?auto_7614 ) ( IS-CRATE ?auto_7611 ) ( not ( = ?auto_7616 ?auto_7614 ) ) ( HOIST-AT ?auto_7615 ?auto_7616 ) ( AVAILABLE ?auto_7615 ) ( SURFACE-AT ?auto_7611 ?auto_7616 ) ( ON ?auto_7611 ?auto_7618 ) ( CLEAR ?auto_7611 ) ( not ( = ?auto_7612 ?auto_7611 ) ) ( not ( = ?auto_7612 ?auto_7618 ) ) ( not ( = ?auto_7611 ?auto_7618 ) ) ( not ( = ?auto_7613 ?auto_7615 ) ) ( IS-CRATE ?auto_7612 ) ( not ( = ?auto_7632 ?auto_7614 ) ) ( HOIST-AT ?auto_7619 ?auto_7632 ) ( AVAILABLE ?auto_7619 ) ( SURFACE-AT ?auto_7612 ?auto_7632 ) ( ON ?auto_7612 ?auto_7633 ) ( CLEAR ?auto_7612 ) ( not ( = ?auto_7609 ?auto_7612 ) ) ( not ( = ?auto_7609 ?auto_7633 ) ) ( not ( = ?auto_7612 ?auto_7633 ) ) ( not ( = ?auto_7613 ?auto_7619 ) ) ( IS-CRATE ?auto_7609 ) ( not ( = ?auto_7621 ?auto_7614 ) ) ( HOIST-AT ?auto_7626 ?auto_7621 ) ( AVAILABLE ?auto_7626 ) ( SURFACE-AT ?auto_7609 ?auto_7621 ) ( ON ?auto_7609 ?auto_7622 ) ( CLEAR ?auto_7609 ) ( not ( = ?auto_7610 ?auto_7609 ) ) ( not ( = ?auto_7610 ?auto_7622 ) ) ( not ( = ?auto_7609 ?auto_7622 ) ) ( not ( = ?auto_7613 ?auto_7626 ) ) ( IS-CRATE ?auto_7610 ) ( not ( = ?auto_7628 ?auto_7614 ) ) ( HOIST-AT ?auto_7629 ?auto_7628 ) ( SURFACE-AT ?auto_7610 ?auto_7628 ) ( ON ?auto_7610 ?auto_7631 ) ( CLEAR ?auto_7610 ) ( not ( = ?auto_7608 ?auto_7610 ) ) ( not ( = ?auto_7608 ?auto_7631 ) ) ( not ( = ?auto_7610 ?auto_7631 ) ) ( not ( = ?auto_7613 ?auto_7629 ) ) ( IS-CRATE ?auto_7608 ) ( SURFACE-AT ?auto_7608 ?auto_7628 ) ( ON ?auto_7608 ?auto_7627 ) ( CLEAR ?auto_7608 ) ( not ( = ?auto_7607 ?auto_7608 ) ) ( not ( = ?auto_7607 ?auto_7627 ) ) ( not ( = ?auto_7608 ?auto_7627 ) ) ( IS-CRATE ?auto_7607 ) ( SURFACE-AT ?auto_7607 ?auto_7628 ) ( ON ?auto_7607 ?auto_7625 ) ( CLEAR ?auto_7607 ) ( not ( = ?auto_7606 ?auto_7607 ) ) ( not ( = ?auto_7606 ?auto_7625 ) ) ( not ( = ?auto_7607 ?auto_7625 ) ) ( IS-CRATE ?auto_7606 ) ( not ( = ?auto_7630 ?auto_7614 ) ) ( HOIST-AT ?auto_7620 ?auto_7630 ) ( AVAILABLE ?auto_7620 ) ( SURFACE-AT ?auto_7606 ?auto_7630 ) ( ON ?auto_7606 ?auto_7623 ) ( CLEAR ?auto_7606 ) ( not ( = ?auto_7605 ?auto_7606 ) ) ( not ( = ?auto_7605 ?auto_7623 ) ) ( not ( = ?auto_7606 ?auto_7623 ) ) ( not ( = ?auto_7613 ?auto_7620 ) ) ( SURFACE-AT ?auto_7604 ?auto_7614 ) ( CLEAR ?auto_7604 ) ( IS-CRATE ?auto_7605 ) ( AVAILABLE ?auto_7613 ) ( AVAILABLE ?auto_7629 ) ( SURFACE-AT ?auto_7605 ?auto_7628 ) ( ON ?auto_7605 ?auto_7624 ) ( CLEAR ?auto_7605 ) ( TRUCK-AT ?auto_7617 ?auto_7614 ) ( not ( = ?auto_7604 ?auto_7605 ) ) ( not ( = ?auto_7604 ?auto_7624 ) ) ( not ( = ?auto_7605 ?auto_7624 ) ) ( not ( = ?auto_7604 ?auto_7606 ) ) ( not ( = ?auto_7604 ?auto_7623 ) ) ( not ( = ?auto_7606 ?auto_7624 ) ) ( not ( = ?auto_7630 ?auto_7628 ) ) ( not ( = ?auto_7620 ?auto_7629 ) ) ( not ( = ?auto_7623 ?auto_7624 ) ) ( not ( = ?auto_7604 ?auto_7607 ) ) ( not ( = ?auto_7604 ?auto_7625 ) ) ( not ( = ?auto_7605 ?auto_7607 ) ) ( not ( = ?auto_7605 ?auto_7625 ) ) ( not ( = ?auto_7607 ?auto_7623 ) ) ( not ( = ?auto_7607 ?auto_7624 ) ) ( not ( = ?auto_7625 ?auto_7623 ) ) ( not ( = ?auto_7625 ?auto_7624 ) ) ( not ( = ?auto_7604 ?auto_7608 ) ) ( not ( = ?auto_7604 ?auto_7627 ) ) ( not ( = ?auto_7605 ?auto_7608 ) ) ( not ( = ?auto_7605 ?auto_7627 ) ) ( not ( = ?auto_7606 ?auto_7608 ) ) ( not ( = ?auto_7606 ?auto_7627 ) ) ( not ( = ?auto_7608 ?auto_7625 ) ) ( not ( = ?auto_7608 ?auto_7623 ) ) ( not ( = ?auto_7608 ?auto_7624 ) ) ( not ( = ?auto_7627 ?auto_7625 ) ) ( not ( = ?auto_7627 ?auto_7623 ) ) ( not ( = ?auto_7627 ?auto_7624 ) ) ( not ( = ?auto_7604 ?auto_7610 ) ) ( not ( = ?auto_7604 ?auto_7631 ) ) ( not ( = ?auto_7605 ?auto_7610 ) ) ( not ( = ?auto_7605 ?auto_7631 ) ) ( not ( = ?auto_7606 ?auto_7610 ) ) ( not ( = ?auto_7606 ?auto_7631 ) ) ( not ( = ?auto_7607 ?auto_7610 ) ) ( not ( = ?auto_7607 ?auto_7631 ) ) ( not ( = ?auto_7610 ?auto_7627 ) ) ( not ( = ?auto_7610 ?auto_7625 ) ) ( not ( = ?auto_7610 ?auto_7623 ) ) ( not ( = ?auto_7610 ?auto_7624 ) ) ( not ( = ?auto_7631 ?auto_7627 ) ) ( not ( = ?auto_7631 ?auto_7625 ) ) ( not ( = ?auto_7631 ?auto_7623 ) ) ( not ( = ?auto_7631 ?auto_7624 ) ) ( not ( = ?auto_7604 ?auto_7609 ) ) ( not ( = ?auto_7604 ?auto_7622 ) ) ( not ( = ?auto_7605 ?auto_7609 ) ) ( not ( = ?auto_7605 ?auto_7622 ) ) ( not ( = ?auto_7606 ?auto_7609 ) ) ( not ( = ?auto_7606 ?auto_7622 ) ) ( not ( = ?auto_7607 ?auto_7609 ) ) ( not ( = ?auto_7607 ?auto_7622 ) ) ( not ( = ?auto_7608 ?auto_7609 ) ) ( not ( = ?auto_7608 ?auto_7622 ) ) ( not ( = ?auto_7609 ?auto_7631 ) ) ( not ( = ?auto_7609 ?auto_7627 ) ) ( not ( = ?auto_7609 ?auto_7625 ) ) ( not ( = ?auto_7609 ?auto_7623 ) ) ( not ( = ?auto_7609 ?auto_7624 ) ) ( not ( = ?auto_7621 ?auto_7628 ) ) ( not ( = ?auto_7621 ?auto_7630 ) ) ( not ( = ?auto_7626 ?auto_7629 ) ) ( not ( = ?auto_7626 ?auto_7620 ) ) ( not ( = ?auto_7622 ?auto_7631 ) ) ( not ( = ?auto_7622 ?auto_7627 ) ) ( not ( = ?auto_7622 ?auto_7625 ) ) ( not ( = ?auto_7622 ?auto_7623 ) ) ( not ( = ?auto_7622 ?auto_7624 ) ) ( not ( = ?auto_7604 ?auto_7612 ) ) ( not ( = ?auto_7604 ?auto_7633 ) ) ( not ( = ?auto_7605 ?auto_7612 ) ) ( not ( = ?auto_7605 ?auto_7633 ) ) ( not ( = ?auto_7606 ?auto_7612 ) ) ( not ( = ?auto_7606 ?auto_7633 ) ) ( not ( = ?auto_7607 ?auto_7612 ) ) ( not ( = ?auto_7607 ?auto_7633 ) ) ( not ( = ?auto_7608 ?auto_7612 ) ) ( not ( = ?auto_7608 ?auto_7633 ) ) ( not ( = ?auto_7610 ?auto_7612 ) ) ( not ( = ?auto_7610 ?auto_7633 ) ) ( not ( = ?auto_7612 ?auto_7622 ) ) ( not ( = ?auto_7612 ?auto_7631 ) ) ( not ( = ?auto_7612 ?auto_7627 ) ) ( not ( = ?auto_7612 ?auto_7625 ) ) ( not ( = ?auto_7612 ?auto_7623 ) ) ( not ( = ?auto_7612 ?auto_7624 ) ) ( not ( = ?auto_7632 ?auto_7621 ) ) ( not ( = ?auto_7632 ?auto_7628 ) ) ( not ( = ?auto_7632 ?auto_7630 ) ) ( not ( = ?auto_7619 ?auto_7626 ) ) ( not ( = ?auto_7619 ?auto_7629 ) ) ( not ( = ?auto_7619 ?auto_7620 ) ) ( not ( = ?auto_7633 ?auto_7622 ) ) ( not ( = ?auto_7633 ?auto_7631 ) ) ( not ( = ?auto_7633 ?auto_7627 ) ) ( not ( = ?auto_7633 ?auto_7625 ) ) ( not ( = ?auto_7633 ?auto_7623 ) ) ( not ( = ?auto_7633 ?auto_7624 ) ) ( not ( = ?auto_7604 ?auto_7611 ) ) ( not ( = ?auto_7604 ?auto_7618 ) ) ( not ( = ?auto_7605 ?auto_7611 ) ) ( not ( = ?auto_7605 ?auto_7618 ) ) ( not ( = ?auto_7606 ?auto_7611 ) ) ( not ( = ?auto_7606 ?auto_7618 ) ) ( not ( = ?auto_7607 ?auto_7611 ) ) ( not ( = ?auto_7607 ?auto_7618 ) ) ( not ( = ?auto_7608 ?auto_7611 ) ) ( not ( = ?auto_7608 ?auto_7618 ) ) ( not ( = ?auto_7610 ?auto_7611 ) ) ( not ( = ?auto_7610 ?auto_7618 ) ) ( not ( = ?auto_7609 ?auto_7611 ) ) ( not ( = ?auto_7609 ?auto_7618 ) ) ( not ( = ?auto_7611 ?auto_7633 ) ) ( not ( = ?auto_7611 ?auto_7622 ) ) ( not ( = ?auto_7611 ?auto_7631 ) ) ( not ( = ?auto_7611 ?auto_7627 ) ) ( not ( = ?auto_7611 ?auto_7625 ) ) ( not ( = ?auto_7611 ?auto_7623 ) ) ( not ( = ?auto_7611 ?auto_7624 ) ) ( not ( = ?auto_7616 ?auto_7632 ) ) ( not ( = ?auto_7616 ?auto_7621 ) ) ( not ( = ?auto_7616 ?auto_7628 ) ) ( not ( = ?auto_7616 ?auto_7630 ) ) ( not ( = ?auto_7615 ?auto_7619 ) ) ( not ( = ?auto_7615 ?auto_7626 ) ) ( not ( = ?auto_7615 ?auto_7629 ) ) ( not ( = ?auto_7615 ?auto_7620 ) ) ( not ( = ?auto_7618 ?auto_7633 ) ) ( not ( = ?auto_7618 ?auto_7622 ) ) ( not ( = ?auto_7618 ?auto_7631 ) ) ( not ( = ?auto_7618 ?auto_7627 ) ) ( not ( = ?auto_7618 ?auto_7625 ) ) ( not ( = ?auto_7618 ?auto_7623 ) ) ( not ( = ?auto_7618 ?auto_7624 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7604 ?auto_7605 ?auto_7606 ?auto_7607 ?auto_7608 ?auto_7610 ?auto_7609 ?auto_7612 )
      ( MAKE-1CRATE ?auto_7612 ?auto_7611 )
      ( MAKE-8CRATE-VERIFY ?auto_7604 ?auto_7605 ?auto_7606 ?auto_7607 ?auto_7608 ?auto_7610 ?auto_7609 ?auto_7612 ?auto_7611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7636 - SURFACE
      ?auto_7637 - SURFACE
    )
    :vars
    (
      ?auto_7638 - HOIST
      ?auto_7639 - PLACE
      ?auto_7641 - PLACE
      ?auto_7642 - HOIST
      ?auto_7643 - SURFACE
      ?auto_7640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7638 ?auto_7639 ) ( SURFACE-AT ?auto_7636 ?auto_7639 ) ( CLEAR ?auto_7636 ) ( IS-CRATE ?auto_7637 ) ( AVAILABLE ?auto_7638 ) ( not ( = ?auto_7641 ?auto_7639 ) ) ( HOIST-AT ?auto_7642 ?auto_7641 ) ( AVAILABLE ?auto_7642 ) ( SURFACE-AT ?auto_7637 ?auto_7641 ) ( ON ?auto_7637 ?auto_7643 ) ( CLEAR ?auto_7637 ) ( TRUCK-AT ?auto_7640 ?auto_7639 ) ( not ( = ?auto_7636 ?auto_7637 ) ) ( not ( = ?auto_7636 ?auto_7643 ) ) ( not ( = ?auto_7637 ?auto_7643 ) ) ( not ( = ?auto_7638 ?auto_7642 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7640 ?auto_7639 ?auto_7641 )
      ( !LIFT ?auto_7642 ?auto_7637 ?auto_7643 ?auto_7641 )
      ( !LOAD ?auto_7642 ?auto_7637 ?auto_7640 ?auto_7641 )
      ( !DRIVE ?auto_7640 ?auto_7641 ?auto_7639 )
      ( !UNLOAD ?auto_7638 ?auto_7637 ?auto_7640 ?auto_7639 )
      ( !DROP ?auto_7638 ?auto_7637 ?auto_7636 ?auto_7639 )
      ( MAKE-1CRATE-VERIFY ?auto_7636 ?auto_7637 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_7654 - SURFACE
      ?auto_7655 - SURFACE
      ?auto_7656 - SURFACE
      ?auto_7657 - SURFACE
      ?auto_7658 - SURFACE
      ?auto_7661 - SURFACE
      ?auto_7659 - SURFACE
      ?auto_7663 - SURFACE
      ?auto_7662 - SURFACE
      ?auto_7660 - SURFACE
    )
    :vars
    (
      ?auto_7664 - HOIST
      ?auto_7668 - PLACE
      ?auto_7669 - PLACE
      ?auto_7667 - HOIST
      ?auto_7665 - SURFACE
      ?auto_7685 - PLACE
      ?auto_7679 - HOIST
      ?auto_7681 - SURFACE
      ?auto_7674 - PLACE
      ?auto_7670 - HOIST
      ?auto_7680 - SURFACE
      ?auto_7682 - PLACE
      ?auto_7675 - HOIST
      ?auto_7683 - SURFACE
      ?auto_7673 - SURFACE
      ?auto_7671 - SURFACE
      ?auto_7676 - SURFACE
      ?auto_7672 - PLACE
      ?auto_7684 - HOIST
      ?auto_7678 - SURFACE
      ?auto_7677 - SURFACE
      ?auto_7666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7664 ?auto_7668 ) ( IS-CRATE ?auto_7660 ) ( not ( = ?auto_7669 ?auto_7668 ) ) ( HOIST-AT ?auto_7667 ?auto_7669 ) ( SURFACE-AT ?auto_7660 ?auto_7669 ) ( ON ?auto_7660 ?auto_7665 ) ( CLEAR ?auto_7660 ) ( not ( = ?auto_7662 ?auto_7660 ) ) ( not ( = ?auto_7662 ?auto_7665 ) ) ( not ( = ?auto_7660 ?auto_7665 ) ) ( not ( = ?auto_7664 ?auto_7667 ) ) ( IS-CRATE ?auto_7662 ) ( not ( = ?auto_7685 ?auto_7668 ) ) ( HOIST-AT ?auto_7679 ?auto_7685 ) ( AVAILABLE ?auto_7679 ) ( SURFACE-AT ?auto_7662 ?auto_7685 ) ( ON ?auto_7662 ?auto_7681 ) ( CLEAR ?auto_7662 ) ( not ( = ?auto_7663 ?auto_7662 ) ) ( not ( = ?auto_7663 ?auto_7681 ) ) ( not ( = ?auto_7662 ?auto_7681 ) ) ( not ( = ?auto_7664 ?auto_7679 ) ) ( IS-CRATE ?auto_7663 ) ( not ( = ?auto_7674 ?auto_7668 ) ) ( HOIST-AT ?auto_7670 ?auto_7674 ) ( AVAILABLE ?auto_7670 ) ( SURFACE-AT ?auto_7663 ?auto_7674 ) ( ON ?auto_7663 ?auto_7680 ) ( CLEAR ?auto_7663 ) ( not ( = ?auto_7659 ?auto_7663 ) ) ( not ( = ?auto_7659 ?auto_7680 ) ) ( not ( = ?auto_7663 ?auto_7680 ) ) ( not ( = ?auto_7664 ?auto_7670 ) ) ( IS-CRATE ?auto_7659 ) ( not ( = ?auto_7682 ?auto_7668 ) ) ( HOIST-AT ?auto_7675 ?auto_7682 ) ( AVAILABLE ?auto_7675 ) ( SURFACE-AT ?auto_7659 ?auto_7682 ) ( ON ?auto_7659 ?auto_7683 ) ( CLEAR ?auto_7659 ) ( not ( = ?auto_7661 ?auto_7659 ) ) ( not ( = ?auto_7661 ?auto_7683 ) ) ( not ( = ?auto_7659 ?auto_7683 ) ) ( not ( = ?auto_7664 ?auto_7675 ) ) ( IS-CRATE ?auto_7661 ) ( SURFACE-AT ?auto_7661 ?auto_7669 ) ( ON ?auto_7661 ?auto_7673 ) ( CLEAR ?auto_7661 ) ( not ( = ?auto_7658 ?auto_7661 ) ) ( not ( = ?auto_7658 ?auto_7673 ) ) ( not ( = ?auto_7661 ?auto_7673 ) ) ( IS-CRATE ?auto_7658 ) ( SURFACE-AT ?auto_7658 ?auto_7669 ) ( ON ?auto_7658 ?auto_7671 ) ( CLEAR ?auto_7658 ) ( not ( = ?auto_7657 ?auto_7658 ) ) ( not ( = ?auto_7657 ?auto_7671 ) ) ( not ( = ?auto_7658 ?auto_7671 ) ) ( IS-CRATE ?auto_7657 ) ( SURFACE-AT ?auto_7657 ?auto_7669 ) ( ON ?auto_7657 ?auto_7676 ) ( CLEAR ?auto_7657 ) ( not ( = ?auto_7656 ?auto_7657 ) ) ( not ( = ?auto_7656 ?auto_7676 ) ) ( not ( = ?auto_7657 ?auto_7676 ) ) ( IS-CRATE ?auto_7656 ) ( not ( = ?auto_7672 ?auto_7668 ) ) ( HOIST-AT ?auto_7684 ?auto_7672 ) ( AVAILABLE ?auto_7684 ) ( SURFACE-AT ?auto_7656 ?auto_7672 ) ( ON ?auto_7656 ?auto_7678 ) ( CLEAR ?auto_7656 ) ( not ( = ?auto_7655 ?auto_7656 ) ) ( not ( = ?auto_7655 ?auto_7678 ) ) ( not ( = ?auto_7656 ?auto_7678 ) ) ( not ( = ?auto_7664 ?auto_7684 ) ) ( SURFACE-AT ?auto_7654 ?auto_7668 ) ( CLEAR ?auto_7654 ) ( IS-CRATE ?auto_7655 ) ( AVAILABLE ?auto_7664 ) ( AVAILABLE ?auto_7667 ) ( SURFACE-AT ?auto_7655 ?auto_7669 ) ( ON ?auto_7655 ?auto_7677 ) ( CLEAR ?auto_7655 ) ( TRUCK-AT ?auto_7666 ?auto_7668 ) ( not ( = ?auto_7654 ?auto_7655 ) ) ( not ( = ?auto_7654 ?auto_7677 ) ) ( not ( = ?auto_7655 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7656 ) ) ( not ( = ?auto_7654 ?auto_7678 ) ) ( not ( = ?auto_7656 ?auto_7677 ) ) ( not ( = ?auto_7672 ?auto_7669 ) ) ( not ( = ?auto_7684 ?auto_7667 ) ) ( not ( = ?auto_7678 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7657 ) ) ( not ( = ?auto_7654 ?auto_7676 ) ) ( not ( = ?auto_7655 ?auto_7657 ) ) ( not ( = ?auto_7655 ?auto_7676 ) ) ( not ( = ?auto_7657 ?auto_7678 ) ) ( not ( = ?auto_7657 ?auto_7677 ) ) ( not ( = ?auto_7676 ?auto_7678 ) ) ( not ( = ?auto_7676 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7658 ) ) ( not ( = ?auto_7654 ?auto_7671 ) ) ( not ( = ?auto_7655 ?auto_7658 ) ) ( not ( = ?auto_7655 ?auto_7671 ) ) ( not ( = ?auto_7656 ?auto_7658 ) ) ( not ( = ?auto_7656 ?auto_7671 ) ) ( not ( = ?auto_7658 ?auto_7676 ) ) ( not ( = ?auto_7658 ?auto_7678 ) ) ( not ( = ?auto_7658 ?auto_7677 ) ) ( not ( = ?auto_7671 ?auto_7676 ) ) ( not ( = ?auto_7671 ?auto_7678 ) ) ( not ( = ?auto_7671 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7661 ) ) ( not ( = ?auto_7654 ?auto_7673 ) ) ( not ( = ?auto_7655 ?auto_7661 ) ) ( not ( = ?auto_7655 ?auto_7673 ) ) ( not ( = ?auto_7656 ?auto_7661 ) ) ( not ( = ?auto_7656 ?auto_7673 ) ) ( not ( = ?auto_7657 ?auto_7661 ) ) ( not ( = ?auto_7657 ?auto_7673 ) ) ( not ( = ?auto_7661 ?auto_7671 ) ) ( not ( = ?auto_7661 ?auto_7676 ) ) ( not ( = ?auto_7661 ?auto_7678 ) ) ( not ( = ?auto_7661 ?auto_7677 ) ) ( not ( = ?auto_7673 ?auto_7671 ) ) ( not ( = ?auto_7673 ?auto_7676 ) ) ( not ( = ?auto_7673 ?auto_7678 ) ) ( not ( = ?auto_7673 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7659 ) ) ( not ( = ?auto_7654 ?auto_7683 ) ) ( not ( = ?auto_7655 ?auto_7659 ) ) ( not ( = ?auto_7655 ?auto_7683 ) ) ( not ( = ?auto_7656 ?auto_7659 ) ) ( not ( = ?auto_7656 ?auto_7683 ) ) ( not ( = ?auto_7657 ?auto_7659 ) ) ( not ( = ?auto_7657 ?auto_7683 ) ) ( not ( = ?auto_7658 ?auto_7659 ) ) ( not ( = ?auto_7658 ?auto_7683 ) ) ( not ( = ?auto_7659 ?auto_7673 ) ) ( not ( = ?auto_7659 ?auto_7671 ) ) ( not ( = ?auto_7659 ?auto_7676 ) ) ( not ( = ?auto_7659 ?auto_7678 ) ) ( not ( = ?auto_7659 ?auto_7677 ) ) ( not ( = ?auto_7682 ?auto_7669 ) ) ( not ( = ?auto_7682 ?auto_7672 ) ) ( not ( = ?auto_7675 ?auto_7667 ) ) ( not ( = ?auto_7675 ?auto_7684 ) ) ( not ( = ?auto_7683 ?auto_7673 ) ) ( not ( = ?auto_7683 ?auto_7671 ) ) ( not ( = ?auto_7683 ?auto_7676 ) ) ( not ( = ?auto_7683 ?auto_7678 ) ) ( not ( = ?auto_7683 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7663 ) ) ( not ( = ?auto_7654 ?auto_7680 ) ) ( not ( = ?auto_7655 ?auto_7663 ) ) ( not ( = ?auto_7655 ?auto_7680 ) ) ( not ( = ?auto_7656 ?auto_7663 ) ) ( not ( = ?auto_7656 ?auto_7680 ) ) ( not ( = ?auto_7657 ?auto_7663 ) ) ( not ( = ?auto_7657 ?auto_7680 ) ) ( not ( = ?auto_7658 ?auto_7663 ) ) ( not ( = ?auto_7658 ?auto_7680 ) ) ( not ( = ?auto_7661 ?auto_7663 ) ) ( not ( = ?auto_7661 ?auto_7680 ) ) ( not ( = ?auto_7663 ?auto_7683 ) ) ( not ( = ?auto_7663 ?auto_7673 ) ) ( not ( = ?auto_7663 ?auto_7671 ) ) ( not ( = ?auto_7663 ?auto_7676 ) ) ( not ( = ?auto_7663 ?auto_7678 ) ) ( not ( = ?auto_7663 ?auto_7677 ) ) ( not ( = ?auto_7674 ?auto_7682 ) ) ( not ( = ?auto_7674 ?auto_7669 ) ) ( not ( = ?auto_7674 ?auto_7672 ) ) ( not ( = ?auto_7670 ?auto_7675 ) ) ( not ( = ?auto_7670 ?auto_7667 ) ) ( not ( = ?auto_7670 ?auto_7684 ) ) ( not ( = ?auto_7680 ?auto_7683 ) ) ( not ( = ?auto_7680 ?auto_7673 ) ) ( not ( = ?auto_7680 ?auto_7671 ) ) ( not ( = ?auto_7680 ?auto_7676 ) ) ( not ( = ?auto_7680 ?auto_7678 ) ) ( not ( = ?auto_7680 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7662 ) ) ( not ( = ?auto_7654 ?auto_7681 ) ) ( not ( = ?auto_7655 ?auto_7662 ) ) ( not ( = ?auto_7655 ?auto_7681 ) ) ( not ( = ?auto_7656 ?auto_7662 ) ) ( not ( = ?auto_7656 ?auto_7681 ) ) ( not ( = ?auto_7657 ?auto_7662 ) ) ( not ( = ?auto_7657 ?auto_7681 ) ) ( not ( = ?auto_7658 ?auto_7662 ) ) ( not ( = ?auto_7658 ?auto_7681 ) ) ( not ( = ?auto_7661 ?auto_7662 ) ) ( not ( = ?auto_7661 ?auto_7681 ) ) ( not ( = ?auto_7659 ?auto_7662 ) ) ( not ( = ?auto_7659 ?auto_7681 ) ) ( not ( = ?auto_7662 ?auto_7680 ) ) ( not ( = ?auto_7662 ?auto_7683 ) ) ( not ( = ?auto_7662 ?auto_7673 ) ) ( not ( = ?auto_7662 ?auto_7671 ) ) ( not ( = ?auto_7662 ?auto_7676 ) ) ( not ( = ?auto_7662 ?auto_7678 ) ) ( not ( = ?auto_7662 ?auto_7677 ) ) ( not ( = ?auto_7685 ?auto_7674 ) ) ( not ( = ?auto_7685 ?auto_7682 ) ) ( not ( = ?auto_7685 ?auto_7669 ) ) ( not ( = ?auto_7685 ?auto_7672 ) ) ( not ( = ?auto_7679 ?auto_7670 ) ) ( not ( = ?auto_7679 ?auto_7675 ) ) ( not ( = ?auto_7679 ?auto_7667 ) ) ( not ( = ?auto_7679 ?auto_7684 ) ) ( not ( = ?auto_7681 ?auto_7680 ) ) ( not ( = ?auto_7681 ?auto_7683 ) ) ( not ( = ?auto_7681 ?auto_7673 ) ) ( not ( = ?auto_7681 ?auto_7671 ) ) ( not ( = ?auto_7681 ?auto_7676 ) ) ( not ( = ?auto_7681 ?auto_7678 ) ) ( not ( = ?auto_7681 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7660 ) ) ( not ( = ?auto_7654 ?auto_7665 ) ) ( not ( = ?auto_7655 ?auto_7660 ) ) ( not ( = ?auto_7655 ?auto_7665 ) ) ( not ( = ?auto_7656 ?auto_7660 ) ) ( not ( = ?auto_7656 ?auto_7665 ) ) ( not ( = ?auto_7657 ?auto_7660 ) ) ( not ( = ?auto_7657 ?auto_7665 ) ) ( not ( = ?auto_7658 ?auto_7660 ) ) ( not ( = ?auto_7658 ?auto_7665 ) ) ( not ( = ?auto_7661 ?auto_7660 ) ) ( not ( = ?auto_7661 ?auto_7665 ) ) ( not ( = ?auto_7659 ?auto_7660 ) ) ( not ( = ?auto_7659 ?auto_7665 ) ) ( not ( = ?auto_7663 ?auto_7660 ) ) ( not ( = ?auto_7663 ?auto_7665 ) ) ( not ( = ?auto_7660 ?auto_7681 ) ) ( not ( = ?auto_7660 ?auto_7680 ) ) ( not ( = ?auto_7660 ?auto_7683 ) ) ( not ( = ?auto_7660 ?auto_7673 ) ) ( not ( = ?auto_7660 ?auto_7671 ) ) ( not ( = ?auto_7660 ?auto_7676 ) ) ( not ( = ?auto_7660 ?auto_7678 ) ) ( not ( = ?auto_7660 ?auto_7677 ) ) ( not ( = ?auto_7665 ?auto_7681 ) ) ( not ( = ?auto_7665 ?auto_7680 ) ) ( not ( = ?auto_7665 ?auto_7683 ) ) ( not ( = ?auto_7665 ?auto_7673 ) ) ( not ( = ?auto_7665 ?auto_7671 ) ) ( not ( = ?auto_7665 ?auto_7676 ) ) ( not ( = ?auto_7665 ?auto_7678 ) ) ( not ( = ?auto_7665 ?auto_7677 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7654 ?auto_7655 ?auto_7656 ?auto_7657 ?auto_7658 ?auto_7661 ?auto_7659 ?auto_7663 ?auto_7662 )
      ( MAKE-1CRATE ?auto_7662 ?auto_7660 )
      ( MAKE-9CRATE-VERIFY ?auto_7654 ?auto_7655 ?auto_7656 ?auto_7657 ?auto_7658 ?auto_7661 ?auto_7659 ?auto_7663 ?auto_7662 ?auto_7660 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7688 - SURFACE
      ?auto_7689 - SURFACE
    )
    :vars
    (
      ?auto_7690 - HOIST
      ?auto_7691 - PLACE
      ?auto_7693 - PLACE
      ?auto_7694 - HOIST
      ?auto_7695 - SURFACE
      ?auto_7692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7690 ?auto_7691 ) ( SURFACE-AT ?auto_7688 ?auto_7691 ) ( CLEAR ?auto_7688 ) ( IS-CRATE ?auto_7689 ) ( AVAILABLE ?auto_7690 ) ( not ( = ?auto_7693 ?auto_7691 ) ) ( HOIST-AT ?auto_7694 ?auto_7693 ) ( AVAILABLE ?auto_7694 ) ( SURFACE-AT ?auto_7689 ?auto_7693 ) ( ON ?auto_7689 ?auto_7695 ) ( CLEAR ?auto_7689 ) ( TRUCK-AT ?auto_7692 ?auto_7691 ) ( not ( = ?auto_7688 ?auto_7689 ) ) ( not ( = ?auto_7688 ?auto_7695 ) ) ( not ( = ?auto_7689 ?auto_7695 ) ) ( not ( = ?auto_7690 ?auto_7694 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7692 ?auto_7691 ?auto_7693 )
      ( !LIFT ?auto_7694 ?auto_7689 ?auto_7695 ?auto_7693 )
      ( !LOAD ?auto_7694 ?auto_7689 ?auto_7692 ?auto_7693 )
      ( !DRIVE ?auto_7692 ?auto_7693 ?auto_7691 )
      ( !UNLOAD ?auto_7690 ?auto_7689 ?auto_7692 ?auto_7691 )
      ( !DROP ?auto_7690 ?auto_7689 ?auto_7688 ?auto_7691 )
      ( MAKE-1CRATE-VERIFY ?auto_7688 ?auto_7689 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_7707 - SURFACE
      ?auto_7708 - SURFACE
      ?auto_7709 - SURFACE
      ?auto_7710 - SURFACE
      ?auto_7711 - SURFACE
      ?auto_7714 - SURFACE
      ?auto_7712 - SURFACE
      ?auto_7716 - SURFACE
      ?auto_7715 - SURFACE
      ?auto_7713 - SURFACE
      ?auto_7717 - SURFACE
    )
    :vars
    (
      ?auto_7720 - HOIST
      ?auto_7719 - PLACE
      ?auto_7723 - PLACE
      ?auto_7722 - HOIST
      ?auto_7721 - SURFACE
      ?auto_7729 - PLACE
      ?auto_7728 - HOIST
      ?auto_7733 - SURFACE
      ?auto_7739 - PLACE
      ?auto_7735 - HOIST
      ?auto_7738 - SURFACE
      ?auto_7730 - PLACE
      ?auto_7734 - HOIST
      ?auto_7724 - SURFACE
      ?auto_7740 - PLACE
      ?auto_7731 - HOIST
      ?auto_7736 - SURFACE
      ?auto_7741 - SURFACE
      ?auto_7726 - SURFACE
      ?auto_7732 - SURFACE
      ?auto_7727 - PLACE
      ?auto_7742 - HOIST
      ?auto_7725 - SURFACE
      ?auto_7737 - SURFACE
      ?auto_7718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7720 ?auto_7719 ) ( IS-CRATE ?auto_7717 ) ( not ( = ?auto_7723 ?auto_7719 ) ) ( HOIST-AT ?auto_7722 ?auto_7723 ) ( AVAILABLE ?auto_7722 ) ( SURFACE-AT ?auto_7717 ?auto_7723 ) ( ON ?auto_7717 ?auto_7721 ) ( CLEAR ?auto_7717 ) ( not ( = ?auto_7713 ?auto_7717 ) ) ( not ( = ?auto_7713 ?auto_7721 ) ) ( not ( = ?auto_7717 ?auto_7721 ) ) ( not ( = ?auto_7720 ?auto_7722 ) ) ( IS-CRATE ?auto_7713 ) ( not ( = ?auto_7729 ?auto_7719 ) ) ( HOIST-AT ?auto_7728 ?auto_7729 ) ( SURFACE-AT ?auto_7713 ?auto_7729 ) ( ON ?auto_7713 ?auto_7733 ) ( CLEAR ?auto_7713 ) ( not ( = ?auto_7715 ?auto_7713 ) ) ( not ( = ?auto_7715 ?auto_7733 ) ) ( not ( = ?auto_7713 ?auto_7733 ) ) ( not ( = ?auto_7720 ?auto_7728 ) ) ( IS-CRATE ?auto_7715 ) ( not ( = ?auto_7739 ?auto_7719 ) ) ( HOIST-AT ?auto_7735 ?auto_7739 ) ( AVAILABLE ?auto_7735 ) ( SURFACE-AT ?auto_7715 ?auto_7739 ) ( ON ?auto_7715 ?auto_7738 ) ( CLEAR ?auto_7715 ) ( not ( = ?auto_7716 ?auto_7715 ) ) ( not ( = ?auto_7716 ?auto_7738 ) ) ( not ( = ?auto_7715 ?auto_7738 ) ) ( not ( = ?auto_7720 ?auto_7735 ) ) ( IS-CRATE ?auto_7716 ) ( not ( = ?auto_7730 ?auto_7719 ) ) ( HOIST-AT ?auto_7734 ?auto_7730 ) ( AVAILABLE ?auto_7734 ) ( SURFACE-AT ?auto_7716 ?auto_7730 ) ( ON ?auto_7716 ?auto_7724 ) ( CLEAR ?auto_7716 ) ( not ( = ?auto_7712 ?auto_7716 ) ) ( not ( = ?auto_7712 ?auto_7724 ) ) ( not ( = ?auto_7716 ?auto_7724 ) ) ( not ( = ?auto_7720 ?auto_7734 ) ) ( IS-CRATE ?auto_7712 ) ( not ( = ?auto_7740 ?auto_7719 ) ) ( HOIST-AT ?auto_7731 ?auto_7740 ) ( AVAILABLE ?auto_7731 ) ( SURFACE-AT ?auto_7712 ?auto_7740 ) ( ON ?auto_7712 ?auto_7736 ) ( CLEAR ?auto_7712 ) ( not ( = ?auto_7714 ?auto_7712 ) ) ( not ( = ?auto_7714 ?auto_7736 ) ) ( not ( = ?auto_7712 ?auto_7736 ) ) ( not ( = ?auto_7720 ?auto_7731 ) ) ( IS-CRATE ?auto_7714 ) ( SURFACE-AT ?auto_7714 ?auto_7729 ) ( ON ?auto_7714 ?auto_7741 ) ( CLEAR ?auto_7714 ) ( not ( = ?auto_7711 ?auto_7714 ) ) ( not ( = ?auto_7711 ?auto_7741 ) ) ( not ( = ?auto_7714 ?auto_7741 ) ) ( IS-CRATE ?auto_7711 ) ( SURFACE-AT ?auto_7711 ?auto_7729 ) ( ON ?auto_7711 ?auto_7726 ) ( CLEAR ?auto_7711 ) ( not ( = ?auto_7710 ?auto_7711 ) ) ( not ( = ?auto_7710 ?auto_7726 ) ) ( not ( = ?auto_7711 ?auto_7726 ) ) ( IS-CRATE ?auto_7710 ) ( SURFACE-AT ?auto_7710 ?auto_7729 ) ( ON ?auto_7710 ?auto_7732 ) ( CLEAR ?auto_7710 ) ( not ( = ?auto_7709 ?auto_7710 ) ) ( not ( = ?auto_7709 ?auto_7732 ) ) ( not ( = ?auto_7710 ?auto_7732 ) ) ( IS-CRATE ?auto_7709 ) ( not ( = ?auto_7727 ?auto_7719 ) ) ( HOIST-AT ?auto_7742 ?auto_7727 ) ( AVAILABLE ?auto_7742 ) ( SURFACE-AT ?auto_7709 ?auto_7727 ) ( ON ?auto_7709 ?auto_7725 ) ( CLEAR ?auto_7709 ) ( not ( = ?auto_7708 ?auto_7709 ) ) ( not ( = ?auto_7708 ?auto_7725 ) ) ( not ( = ?auto_7709 ?auto_7725 ) ) ( not ( = ?auto_7720 ?auto_7742 ) ) ( SURFACE-AT ?auto_7707 ?auto_7719 ) ( CLEAR ?auto_7707 ) ( IS-CRATE ?auto_7708 ) ( AVAILABLE ?auto_7720 ) ( AVAILABLE ?auto_7728 ) ( SURFACE-AT ?auto_7708 ?auto_7729 ) ( ON ?auto_7708 ?auto_7737 ) ( CLEAR ?auto_7708 ) ( TRUCK-AT ?auto_7718 ?auto_7719 ) ( not ( = ?auto_7707 ?auto_7708 ) ) ( not ( = ?auto_7707 ?auto_7737 ) ) ( not ( = ?auto_7708 ?auto_7737 ) ) ( not ( = ?auto_7707 ?auto_7709 ) ) ( not ( = ?auto_7707 ?auto_7725 ) ) ( not ( = ?auto_7709 ?auto_7737 ) ) ( not ( = ?auto_7727 ?auto_7729 ) ) ( not ( = ?auto_7742 ?auto_7728 ) ) ( not ( = ?auto_7725 ?auto_7737 ) ) ( not ( = ?auto_7707 ?auto_7710 ) ) ( not ( = ?auto_7707 ?auto_7732 ) ) ( not ( = ?auto_7708 ?auto_7710 ) ) ( not ( = ?auto_7708 ?auto_7732 ) ) ( not ( = ?auto_7710 ?auto_7725 ) ) ( not ( = ?auto_7710 ?auto_7737 ) ) ( not ( = ?auto_7732 ?auto_7725 ) ) ( not ( = ?auto_7732 ?auto_7737 ) ) ( not ( = ?auto_7707 ?auto_7711 ) ) ( not ( = ?auto_7707 ?auto_7726 ) ) ( not ( = ?auto_7708 ?auto_7711 ) ) ( not ( = ?auto_7708 ?auto_7726 ) ) ( not ( = ?auto_7709 ?auto_7711 ) ) ( not ( = ?auto_7709 ?auto_7726 ) ) ( not ( = ?auto_7711 ?auto_7732 ) ) ( not ( = ?auto_7711 ?auto_7725 ) ) ( not ( = ?auto_7711 ?auto_7737 ) ) ( not ( = ?auto_7726 ?auto_7732 ) ) ( not ( = ?auto_7726 ?auto_7725 ) ) ( not ( = ?auto_7726 ?auto_7737 ) ) ( not ( = ?auto_7707 ?auto_7714 ) ) ( not ( = ?auto_7707 ?auto_7741 ) ) ( not ( = ?auto_7708 ?auto_7714 ) ) ( not ( = ?auto_7708 ?auto_7741 ) ) ( not ( = ?auto_7709 ?auto_7714 ) ) ( not ( = ?auto_7709 ?auto_7741 ) ) ( not ( = ?auto_7710 ?auto_7714 ) ) ( not ( = ?auto_7710 ?auto_7741 ) ) ( not ( = ?auto_7714 ?auto_7726 ) ) ( not ( = ?auto_7714 ?auto_7732 ) ) ( not ( = ?auto_7714 ?auto_7725 ) ) ( not ( = ?auto_7714 ?auto_7737 ) ) ( not ( = ?auto_7741 ?auto_7726 ) ) ( not ( = ?auto_7741 ?auto_7732 ) ) ( not ( = ?auto_7741 ?auto_7725 ) ) ( not ( = ?auto_7741 ?auto_7737 ) ) ( not ( = ?auto_7707 ?auto_7712 ) ) ( not ( = ?auto_7707 ?auto_7736 ) ) ( not ( = ?auto_7708 ?auto_7712 ) ) ( not ( = ?auto_7708 ?auto_7736 ) ) ( not ( = ?auto_7709 ?auto_7712 ) ) ( not ( = ?auto_7709 ?auto_7736 ) ) ( not ( = ?auto_7710 ?auto_7712 ) ) ( not ( = ?auto_7710 ?auto_7736 ) ) ( not ( = ?auto_7711 ?auto_7712 ) ) ( not ( = ?auto_7711 ?auto_7736 ) ) ( not ( = ?auto_7712 ?auto_7741 ) ) ( not ( = ?auto_7712 ?auto_7726 ) ) ( not ( = ?auto_7712 ?auto_7732 ) ) ( not ( = ?auto_7712 ?auto_7725 ) ) ( not ( = ?auto_7712 ?auto_7737 ) ) ( not ( = ?auto_7740 ?auto_7729 ) ) ( not ( = ?auto_7740 ?auto_7727 ) ) ( not ( = ?auto_7731 ?auto_7728 ) ) ( not ( = ?auto_7731 ?auto_7742 ) ) ( not ( = ?auto_7736 ?auto_7741 ) ) ( not ( = ?auto_7736 ?auto_7726 ) ) ( not ( = ?auto_7736 ?auto_7732 ) ) ( not ( = ?auto_7736 ?auto_7725 ) ) ( not ( = ?auto_7736 ?auto_7737 ) ) ( not ( = ?auto_7707 ?auto_7716 ) ) ( not ( = ?auto_7707 ?auto_7724 ) ) ( not ( = ?auto_7708 ?auto_7716 ) ) ( not ( = ?auto_7708 ?auto_7724 ) ) ( not ( = ?auto_7709 ?auto_7716 ) ) ( not ( = ?auto_7709 ?auto_7724 ) ) ( not ( = ?auto_7710 ?auto_7716 ) ) ( not ( = ?auto_7710 ?auto_7724 ) ) ( not ( = ?auto_7711 ?auto_7716 ) ) ( not ( = ?auto_7711 ?auto_7724 ) ) ( not ( = ?auto_7714 ?auto_7716 ) ) ( not ( = ?auto_7714 ?auto_7724 ) ) ( not ( = ?auto_7716 ?auto_7736 ) ) ( not ( = ?auto_7716 ?auto_7741 ) ) ( not ( = ?auto_7716 ?auto_7726 ) ) ( not ( = ?auto_7716 ?auto_7732 ) ) ( not ( = ?auto_7716 ?auto_7725 ) ) ( not ( = ?auto_7716 ?auto_7737 ) ) ( not ( = ?auto_7730 ?auto_7740 ) ) ( not ( = ?auto_7730 ?auto_7729 ) ) ( not ( = ?auto_7730 ?auto_7727 ) ) ( not ( = ?auto_7734 ?auto_7731 ) ) ( not ( = ?auto_7734 ?auto_7728 ) ) ( not ( = ?auto_7734 ?auto_7742 ) ) ( not ( = ?auto_7724 ?auto_7736 ) ) ( not ( = ?auto_7724 ?auto_7741 ) ) ( not ( = ?auto_7724 ?auto_7726 ) ) ( not ( = ?auto_7724 ?auto_7732 ) ) ( not ( = ?auto_7724 ?auto_7725 ) ) ( not ( = ?auto_7724 ?auto_7737 ) ) ( not ( = ?auto_7707 ?auto_7715 ) ) ( not ( = ?auto_7707 ?auto_7738 ) ) ( not ( = ?auto_7708 ?auto_7715 ) ) ( not ( = ?auto_7708 ?auto_7738 ) ) ( not ( = ?auto_7709 ?auto_7715 ) ) ( not ( = ?auto_7709 ?auto_7738 ) ) ( not ( = ?auto_7710 ?auto_7715 ) ) ( not ( = ?auto_7710 ?auto_7738 ) ) ( not ( = ?auto_7711 ?auto_7715 ) ) ( not ( = ?auto_7711 ?auto_7738 ) ) ( not ( = ?auto_7714 ?auto_7715 ) ) ( not ( = ?auto_7714 ?auto_7738 ) ) ( not ( = ?auto_7712 ?auto_7715 ) ) ( not ( = ?auto_7712 ?auto_7738 ) ) ( not ( = ?auto_7715 ?auto_7724 ) ) ( not ( = ?auto_7715 ?auto_7736 ) ) ( not ( = ?auto_7715 ?auto_7741 ) ) ( not ( = ?auto_7715 ?auto_7726 ) ) ( not ( = ?auto_7715 ?auto_7732 ) ) ( not ( = ?auto_7715 ?auto_7725 ) ) ( not ( = ?auto_7715 ?auto_7737 ) ) ( not ( = ?auto_7739 ?auto_7730 ) ) ( not ( = ?auto_7739 ?auto_7740 ) ) ( not ( = ?auto_7739 ?auto_7729 ) ) ( not ( = ?auto_7739 ?auto_7727 ) ) ( not ( = ?auto_7735 ?auto_7734 ) ) ( not ( = ?auto_7735 ?auto_7731 ) ) ( not ( = ?auto_7735 ?auto_7728 ) ) ( not ( = ?auto_7735 ?auto_7742 ) ) ( not ( = ?auto_7738 ?auto_7724 ) ) ( not ( = ?auto_7738 ?auto_7736 ) ) ( not ( = ?auto_7738 ?auto_7741 ) ) ( not ( = ?auto_7738 ?auto_7726 ) ) ( not ( = ?auto_7738 ?auto_7732 ) ) ( not ( = ?auto_7738 ?auto_7725 ) ) ( not ( = ?auto_7738 ?auto_7737 ) ) ( not ( = ?auto_7707 ?auto_7713 ) ) ( not ( = ?auto_7707 ?auto_7733 ) ) ( not ( = ?auto_7708 ?auto_7713 ) ) ( not ( = ?auto_7708 ?auto_7733 ) ) ( not ( = ?auto_7709 ?auto_7713 ) ) ( not ( = ?auto_7709 ?auto_7733 ) ) ( not ( = ?auto_7710 ?auto_7713 ) ) ( not ( = ?auto_7710 ?auto_7733 ) ) ( not ( = ?auto_7711 ?auto_7713 ) ) ( not ( = ?auto_7711 ?auto_7733 ) ) ( not ( = ?auto_7714 ?auto_7713 ) ) ( not ( = ?auto_7714 ?auto_7733 ) ) ( not ( = ?auto_7712 ?auto_7713 ) ) ( not ( = ?auto_7712 ?auto_7733 ) ) ( not ( = ?auto_7716 ?auto_7713 ) ) ( not ( = ?auto_7716 ?auto_7733 ) ) ( not ( = ?auto_7713 ?auto_7738 ) ) ( not ( = ?auto_7713 ?auto_7724 ) ) ( not ( = ?auto_7713 ?auto_7736 ) ) ( not ( = ?auto_7713 ?auto_7741 ) ) ( not ( = ?auto_7713 ?auto_7726 ) ) ( not ( = ?auto_7713 ?auto_7732 ) ) ( not ( = ?auto_7713 ?auto_7725 ) ) ( not ( = ?auto_7713 ?auto_7737 ) ) ( not ( = ?auto_7733 ?auto_7738 ) ) ( not ( = ?auto_7733 ?auto_7724 ) ) ( not ( = ?auto_7733 ?auto_7736 ) ) ( not ( = ?auto_7733 ?auto_7741 ) ) ( not ( = ?auto_7733 ?auto_7726 ) ) ( not ( = ?auto_7733 ?auto_7732 ) ) ( not ( = ?auto_7733 ?auto_7725 ) ) ( not ( = ?auto_7733 ?auto_7737 ) ) ( not ( = ?auto_7707 ?auto_7717 ) ) ( not ( = ?auto_7707 ?auto_7721 ) ) ( not ( = ?auto_7708 ?auto_7717 ) ) ( not ( = ?auto_7708 ?auto_7721 ) ) ( not ( = ?auto_7709 ?auto_7717 ) ) ( not ( = ?auto_7709 ?auto_7721 ) ) ( not ( = ?auto_7710 ?auto_7717 ) ) ( not ( = ?auto_7710 ?auto_7721 ) ) ( not ( = ?auto_7711 ?auto_7717 ) ) ( not ( = ?auto_7711 ?auto_7721 ) ) ( not ( = ?auto_7714 ?auto_7717 ) ) ( not ( = ?auto_7714 ?auto_7721 ) ) ( not ( = ?auto_7712 ?auto_7717 ) ) ( not ( = ?auto_7712 ?auto_7721 ) ) ( not ( = ?auto_7716 ?auto_7717 ) ) ( not ( = ?auto_7716 ?auto_7721 ) ) ( not ( = ?auto_7715 ?auto_7717 ) ) ( not ( = ?auto_7715 ?auto_7721 ) ) ( not ( = ?auto_7717 ?auto_7733 ) ) ( not ( = ?auto_7717 ?auto_7738 ) ) ( not ( = ?auto_7717 ?auto_7724 ) ) ( not ( = ?auto_7717 ?auto_7736 ) ) ( not ( = ?auto_7717 ?auto_7741 ) ) ( not ( = ?auto_7717 ?auto_7726 ) ) ( not ( = ?auto_7717 ?auto_7732 ) ) ( not ( = ?auto_7717 ?auto_7725 ) ) ( not ( = ?auto_7717 ?auto_7737 ) ) ( not ( = ?auto_7723 ?auto_7729 ) ) ( not ( = ?auto_7723 ?auto_7739 ) ) ( not ( = ?auto_7723 ?auto_7730 ) ) ( not ( = ?auto_7723 ?auto_7740 ) ) ( not ( = ?auto_7723 ?auto_7727 ) ) ( not ( = ?auto_7722 ?auto_7728 ) ) ( not ( = ?auto_7722 ?auto_7735 ) ) ( not ( = ?auto_7722 ?auto_7734 ) ) ( not ( = ?auto_7722 ?auto_7731 ) ) ( not ( = ?auto_7722 ?auto_7742 ) ) ( not ( = ?auto_7721 ?auto_7733 ) ) ( not ( = ?auto_7721 ?auto_7738 ) ) ( not ( = ?auto_7721 ?auto_7724 ) ) ( not ( = ?auto_7721 ?auto_7736 ) ) ( not ( = ?auto_7721 ?auto_7741 ) ) ( not ( = ?auto_7721 ?auto_7726 ) ) ( not ( = ?auto_7721 ?auto_7732 ) ) ( not ( = ?auto_7721 ?auto_7725 ) ) ( not ( = ?auto_7721 ?auto_7737 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7707 ?auto_7708 ?auto_7709 ?auto_7710 ?auto_7711 ?auto_7714 ?auto_7712 ?auto_7716 ?auto_7715 ?auto_7713 )
      ( MAKE-1CRATE ?auto_7713 ?auto_7717 )
      ( MAKE-10CRATE-VERIFY ?auto_7707 ?auto_7708 ?auto_7709 ?auto_7710 ?auto_7711 ?auto_7714 ?auto_7712 ?auto_7716 ?auto_7715 ?auto_7713 ?auto_7717 ) )
  )

)

