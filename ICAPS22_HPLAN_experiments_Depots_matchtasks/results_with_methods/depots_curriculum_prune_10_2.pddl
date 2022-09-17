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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7397 - SURFACE
      ?auto_7398 - SURFACE
      ?auto_7399 - SURFACE
    )
    :vars
    (
      ?auto_7405 - HOIST
      ?auto_7402 - PLACE
      ?auto_7400 - PLACE
      ?auto_7403 - HOIST
      ?auto_7401 - SURFACE
      ?auto_7407 - PLACE
      ?auto_7408 - HOIST
      ?auto_7406 - SURFACE
      ?auto_7404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7405 ?auto_7402 ) ( IS-CRATE ?auto_7399 ) ( not ( = ?auto_7400 ?auto_7402 ) ) ( HOIST-AT ?auto_7403 ?auto_7400 ) ( AVAILABLE ?auto_7403 ) ( SURFACE-AT ?auto_7399 ?auto_7400 ) ( ON ?auto_7399 ?auto_7401 ) ( CLEAR ?auto_7399 ) ( not ( = ?auto_7398 ?auto_7399 ) ) ( not ( = ?auto_7398 ?auto_7401 ) ) ( not ( = ?auto_7399 ?auto_7401 ) ) ( not ( = ?auto_7405 ?auto_7403 ) ) ( SURFACE-AT ?auto_7397 ?auto_7402 ) ( CLEAR ?auto_7397 ) ( IS-CRATE ?auto_7398 ) ( AVAILABLE ?auto_7405 ) ( not ( = ?auto_7407 ?auto_7402 ) ) ( HOIST-AT ?auto_7408 ?auto_7407 ) ( AVAILABLE ?auto_7408 ) ( SURFACE-AT ?auto_7398 ?auto_7407 ) ( ON ?auto_7398 ?auto_7406 ) ( CLEAR ?auto_7398 ) ( TRUCK-AT ?auto_7404 ?auto_7402 ) ( not ( = ?auto_7397 ?auto_7398 ) ) ( not ( = ?auto_7397 ?auto_7406 ) ) ( not ( = ?auto_7398 ?auto_7406 ) ) ( not ( = ?auto_7405 ?auto_7408 ) ) ( not ( = ?auto_7397 ?auto_7399 ) ) ( not ( = ?auto_7397 ?auto_7401 ) ) ( not ( = ?auto_7399 ?auto_7406 ) ) ( not ( = ?auto_7400 ?auto_7407 ) ) ( not ( = ?auto_7403 ?auto_7408 ) ) ( not ( = ?auto_7401 ?auto_7406 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7397 ?auto_7398 )
      ( MAKE-1CRATE ?auto_7398 ?auto_7399 )
      ( MAKE-2CRATE-VERIFY ?auto_7397 ?auto_7398 ?auto_7399 ) )
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
      ?auto_7429 - HOIST
      ?auto_7430 - PLACE
      ?auto_7427 - PLACE
      ?auto_7432 - HOIST
      ?auto_7428 - SURFACE
      ?auto_7436 - PLACE
      ?auto_7435 - HOIST
      ?auto_7434 - SURFACE
      ?auto_7433 - SURFACE
      ?auto_7431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7429 ?auto_7430 ) ( IS-CRATE ?auto_7426 ) ( not ( = ?auto_7427 ?auto_7430 ) ) ( HOIST-AT ?auto_7432 ?auto_7427 ) ( SURFACE-AT ?auto_7426 ?auto_7427 ) ( ON ?auto_7426 ?auto_7428 ) ( CLEAR ?auto_7426 ) ( not ( = ?auto_7425 ?auto_7426 ) ) ( not ( = ?auto_7425 ?auto_7428 ) ) ( not ( = ?auto_7426 ?auto_7428 ) ) ( not ( = ?auto_7429 ?auto_7432 ) ) ( IS-CRATE ?auto_7425 ) ( not ( = ?auto_7436 ?auto_7430 ) ) ( HOIST-AT ?auto_7435 ?auto_7436 ) ( AVAILABLE ?auto_7435 ) ( SURFACE-AT ?auto_7425 ?auto_7436 ) ( ON ?auto_7425 ?auto_7434 ) ( CLEAR ?auto_7425 ) ( not ( = ?auto_7424 ?auto_7425 ) ) ( not ( = ?auto_7424 ?auto_7434 ) ) ( not ( = ?auto_7425 ?auto_7434 ) ) ( not ( = ?auto_7429 ?auto_7435 ) ) ( SURFACE-AT ?auto_7423 ?auto_7430 ) ( CLEAR ?auto_7423 ) ( IS-CRATE ?auto_7424 ) ( AVAILABLE ?auto_7429 ) ( AVAILABLE ?auto_7432 ) ( SURFACE-AT ?auto_7424 ?auto_7427 ) ( ON ?auto_7424 ?auto_7433 ) ( CLEAR ?auto_7424 ) ( TRUCK-AT ?auto_7431 ?auto_7430 ) ( not ( = ?auto_7423 ?auto_7424 ) ) ( not ( = ?auto_7423 ?auto_7433 ) ) ( not ( = ?auto_7424 ?auto_7433 ) ) ( not ( = ?auto_7423 ?auto_7425 ) ) ( not ( = ?auto_7423 ?auto_7434 ) ) ( not ( = ?auto_7425 ?auto_7433 ) ) ( not ( = ?auto_7436 ?auto_7427 ) ) ( not ( = ?auto_7435 ?auto_7432 ) ) ( not ( = ?auto_7434 ?auto_7433 ) ) ( not ( = ?auto_7423 ?auto_7426 ) ) ( not ( = ?auto_7423 ?auto_7428 ) ) ( not ( = ?auto_7424 ?auto_7426 ) ) ( not ( = ?auto_7424 ?auto_7428 ) ) ( not ( = ?auto_7426 ?auto_7434 ) ) ( not ( = ?auto_7426 ?auto_7433 ) ) ( not ( = ?auto_7428 ?auto_7434 ) ) ( not ( = ?auto_7428 ?auto_7433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7423 ?auto_7424 ?auto_7425 )
      ( MAKE-1CRATE ?auto_7425 ?auto_7426 )
      ( MAKE-3CRATE-VERIFY ?auto_7423 ?auto_7424 ?auto_7425 ?auto_7426 ) )
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
      ?auto_7462 - HOIST
      ?auto_7458 - PLACE
      ?auto_7461 - PLACE
      ?auto_7457 - HOIST
      ?auto_7459 - SURFACE
      ?auto_7467 - SURFACE
      ?auto_7463 - PLACE
      ?auto_7464 - HOIST
      ?auto_7466 - SURFACE
      ?auto_7465 - SURFACE
      ?auto_7460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7462 ?auto_7458 ) ( IS-CRATE ?auto_7456 ) ( not ( = ?auto_7461 ?auto_7458 ) ) ( HOIST-AT ?auto_7457 ?auto_7461 ) ( SURFACE-AT ?auto_7456 ?auto_7461 ) ( ON ?auto_7456 ?auto_7459 ) ( CLEAR ?auto_7456 ) ( not ( = ?auto_7455 ?auto_7456 ) ) ( not ( = ?auto_7455 ?auto_7459 ) ) ( not ( = ?auto_7456 ?auto_7459 ) ) ( not ( = ?auto_7462 ?auto_7457 ) ) ( IS-CRATE ?auto_7455 ) ( SURFACE-AT ?auto_7455 ?auto_7461 ) ( ON ?auto_7455 ?auto_7467 ) ( CLEAR ?auto_7455 ) ( not ( = ?auto_7454 ?auto_7455 ) ) ( not ( = ?auto_7454 ?auto_7467 ) ) ( not ( = ?auto_7455 ?auto_7467 ) ) ( IS-CRATE ?auto_7454 ) ( not ( = ?auto_7463 ?auto_7458 ) ) ( HOIST-AT ?auto_7464 ?auto_7463 ) ( AVAILABLE ?auto_7464 ) ( SURFACE-AT ?auto_7454 ?auto_7463 ) ( ON ?auto_7454 ?auto_7466 ) ( CLEAR ?auto_7454 ) ( not ( = ?auto_7453 ?auto_7454 ) ) ( not ( = ?auto_7453 ?auto_7466 ) ) ( not ( = ?auto_7454 ?auto_7466 ) ) ( not ( = ?auto_7462 ?auto_7464 ) ) ( SURFACE-AT ?auto_7452 ?auto_7458 ) ( CLEAR ?auto_7452 ) ( IS-CRATE ?auto_7453 ) ( AVAILABLE ?auto_7462 ) ( AVAILABLE ?auto_7457 ) ( SURFACE-AT ?auto_7453 ?auto_7461 ) ( ON ?auto_7453 ?auto_7465 ) ( CLEAR ?auto_7453 ) ( TRUCK-AT ?auto_7460 ?auto_7458 ) ( not ( = ?auto_7452 ?auto_7453 ) ) ( not ( = ?auto_7452 ?auto_7465 ) ) ( not ( = ?auto_7453 ?auto_7465 ) ) ( not ( = ?auto_7452 ?auto_7454 ) ) ( not ( = ?auto_7452 ?auto_7466 ) ) ( not ( = ?auto_7454 ?auto_7465 ) ) ( not ( = ?auto_7463 ?auto_7461 ) ) ( not ( = ?auto_7464 ?auto_7457 ) ) ( not ( = ?auto_7466 ?auto_7465 ) ) ( not ( = ?auto_7452 ?auto_7455 ) ) ( not ( = ?auto_7452 ?auto_7467 ) ) ( not ( = ?auto_7453 ?auto_7455 ) ) ( not ( = ?auto_7453 ?auto_7467 ) ) ( not ( = ?auto_7455 ?auto_7466 ) ) ( not ( = ?auto_7455 ?auto_7465 ) ) ( not ( = ?auto_7467 ?auto_7466 ) ) ( not ( = ?auto_7467 ?auto_7465 ) ) ( not ( = ?auto_7452 ?auto_7456 ) ) ( not ( = ?auto_7452 ?auto_7459 ) ) ( not ( = ?auto_7453 ?auto_7456 ) ) ( not ( = ?auto_7453 ?auto_7459 ) ) ( not ( = ?auto_7454 ?auto_7456 ) ) ( not ( = ?auto_7454 ?auto_7459 ) ) ( not ( = ?auto_7456 ?auto_7467 ) ) ( not ( = ?auto_7456 ?auto_7466 ) ) ( not ( = ?auto_7456 ?auto_7465 ) ) ( not ( = ?auto_7459 ?auto_7467 ) ) ( not ( = ?auto_7459 ?auto_7466 ) ) ( not ( = ?auto_7459 ?auto_7465 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7452 ?auto_7453 ?auto_7454 ?auto_7455 )
      ( MAKE-1CRATE ?auto_7455 ?auto_7456 )
      ( MAKE-4CRATE-VERIFY ?auto_7452 ?auto_7453 ?auto_7454 ?auto_7455 ?auto_7456 ) )
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
      ?auto_7492 - HOIST
      ?auto_7493 - PLACE
      ?auto_7494 - PLACE
      ?auto_7495 - HOIST
      ?auto_7491 - SURFACE
      ?auto_7501 - SURFACE
      ?auto_7498 - SURFACE
      ?auto_7500 - PLACE
      ?auto_7497 - HOIST
      ?auto_7499 - SURFACE
      ?auto_7496 - SURFACE
      ?auto_7490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7492 ?auto_7493 ) ( IS-CRATE ?auto_7489 ) ( not ( = ?auto_7494 ?auto_7493 ) ) ( HOIST-AT ?auto_7495 ?auto_7494 ) ( SURFACE-AT ?auto_7489 ?auto_7494 ) ( ON ?auto_7489 ?auto_7491 ) ( CLEAR ?auto_7489 ) ( not ( = ?auto_7488 ?auto_7489 ) ) ( not ( = ?auto_7488 ?auto_7491 ) ) ( not ( = ?auto_7489 ?auto_7491 ) ) ( not ( = ?auto_7492 ?auto_7495 ) ) ( IS-CRATE ?auto_7488 ) ( SURFACE-AT ?auto_7488 ?auto_7494 ) ( ON ?auto_7488 ?auto_7501 ) ( CLEAR ?auto_7488 ) ( not ( = ?auto_7487 ?auto_7488 ) ) ( not ( = ?auto_7487 ?auto_7501 ) ) ( not ( = ?auto_7488 ?auto_7501 ) ) ( IS-CRATE ?auto_7487 ) ( SURFACE-AT ?auto_7487 ?auto_7494 ) ( ON ?auto_7487 ?auto_7498 ) ( CLEAR ?auto_7487 ) ( not ( = ?auto_7486 ?auto_7487 ) ) ( not ( = ?auto_7486 ?auto_7498 ) ) ( not ( = ?auto_7487 ?auto_7498 ) ) ( IS-CRATE ?auto_7486 ) ( not ( = ?auto_7500 ?auto_7493 ) ) ( HOIST-AT ?auto_7497 ?auto_7500 ) ( AVAILABLE ?auto_7497 ) ( SURFACE-AT ?auto_7486 ?auto_7500 ) ( ON ?auto_7486 ?auto_7499 ) ( CLEAR ?auto_7486 ) ( not ( = ?auto_7485 ?auto_7486 ) ) ( not ( = ?auto_7485 ?auto_7499 ) ) ( not ( = ?auto_7486 ?auto_7499 ) ) ( not ( = ?auto_7492 ?auto_7497 ) ) ( SURFACE-AT ?auto_7484 ?auto_7493 ) ( CLEAR ?auto_7484 ) ( IS-CRATE ?auto_7485 ) ( AVAILABLE ?auto_7492 ) ( AVAILABLE ?auto_7495 ) ( SURFACE-AT ?auto_7485 ?auto_7494 ) ( ON ?auto_7485 ?auto_7496 ) ( CLEAR ?auto_7485 ) ( TRUCK-AT ?auto_7490 ?auto_7493 ) ( not ( = ?auto_7484 ?auto_7485 ) ) ( not ( = ?auto_7484 ?auto_7496 ) ) ( not ( = ?auto_7485 ?auto_7496 ) ) ( not ( = ?auto_7484 ?auto_7486 ) ) ( not ( = ?auto_7484 ?auto_7499 ) ) ( not ( = ?auto_7486 ?auto_7496 ) ) ( not ( = ?auto_7500 ?auto_7494 ) ) ( not ( = ?auto_7497 ?auto_7495 ) ) ( not ( = ?auto_7499 ?auto_7496 ) ) ( not ( = ?auto_7484 ?auto_7487 ) ) ( not ( = ?auto_7484 ?auto_7498 ) ) ( not ( = ?auto_7485 ?auto_7487 ) ) ( not ( = ?auto_7485 ?auto_7498 ) ) ( not ( = ?auto_7487 ?auto_7499 ) ) ( not ( = ?auto_7487 ?auto_7496 ) ) ( not ( = ?auto_7498 ?auto_7499 ) ) ( not ( = ?auto_7498 ?auto_7496 ) ) ( not ( = ?auto_7484 ?auto_7488 ) ) ( not ( = ?auto_7484 ?auto_7501 ) ) ( not ( = ?auto_7485 ?auto_7488 ) ) ( not ( = ?auto_7485 ?auto_7501 ) ) ( not ( = ?auto_7486 ?auto_7488 ) ) ( not ( = ?auto_7486 ?auto_7501 ) ) ( not ( = ?auto_7488 ?auto_7498 ) ) ( not ( = ?auto_7488 ?auto_7499 ) ) ( not ( = ?auto_7488 ?auto_7496 ) ) ( not ( = ?auto_7501 ?auto_7498 ) ) ( not ( = ?auto_7501 ?auto_7499 ) ) ( not ( = ?auto_7501 ?auto_7496 ) ) ( not ( = ?auto_7484 ?auto_7489 ) ) ( not ( = ?auto_7484 ?auto_7491 ) ) ( not ( = ?auto_7485 ?auto_7489 ) ) ( not ( = ?auto_7485 ?auto_7491 ) ) ( not ( = ?auto_7486 ?auto_7489 ) ) ( not ( = ?auto_7486 ?auto_7491 ) ) ( not ( = ?auto_7487 ?auto_7489 ) ) ( not ( = ?auto_7487 ?auto_7491 ) ) ( not ( = ?auto_7489 ?auto_7501 ) ) ( not ( = ?auto_7489 ?auto_7498 ) ) ( not ( = ?auto_7489 ?auto_7499 ) ) ( not ( = ?auto_7489 ?auto_7496 ) ) ( not ( = ?auto_7491 ?auto_7501 ) ) ( not ( = ?auto_7491 ?auto_7498 ) ) ( not ( = ?auto_7491 ?auto_7499 ) ) ( not ( = ?auto_7491 ?auto_7496 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7484 ?auto_7485 ?auto_7486 ?auto_7487 ?auto_7488 )
      ( MAKE-1CRATE ?auto_7488 ?auto_7489 )
      ( MAKE-5CRATE-VERIFY ?auto_7484 ?auto_7485 ?auto_7486 ?auto_7487 ?auto_7488 ?auto_7489 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7519 - SURFACE
      ?auto_7520 - SURFACE
      ?auto_7521 - SURFACE
      ?auto_7522 - SURFACE
      ?auto_7523 - SURFACE
      ?auto_7524 - SURFACE
      ?auto_7525 - SURFACE
    )
    :vars
    (
      ?auto_7527 - HOIST
      ?auto_7530 - PLACE
      ?auto_7526 - PLACE
      ?auto_7528 - HOIST
      ?auto_7529 - SURFACE
      ?auto_7538 - PLACE
      ?auto_7532 - HOIST
      ?auto_7534 - SURFACE
      ?auto_7540 - SURFACE
      ?auto_7535 - SURFACE
      ?auto_7533 - PLACE
      ?auto_7537 - HOIST
      ?auto_7539 - SURFACE
      ?auto_7536 - SURFACE
      ?auto_7531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7527 ?auto_7530 ) ( IS-CRATE ?auto_7525 ) ( not ( = ?auto_7526 ?auto_7530 ) ) ( HOIST-AT ?auto_7528 ?auto_7526 ) ( AVAILABLE ?auto_7528 ) ( SURFACE-AT ?auto_7525 ?auto_7526 ) ( ON ?auto_7525 ?auto_7529 ) ( CLEAR ?auto_7525 ) ( not ( = ?auto_7524 ?auto_7525 ) ) ( not ( = ?auto_7524 ?auto_7529 ) ) ( not ( = ?auto_7525 ?auto_7529 ) ) ( not ( = ?auto_7527 ?auto_7528 ) ) ( IS-CRATE ?auto_7524 ) ( not ( = ?auto_7538 ?auto_7530 ) ) ( HOIST-AT ?auto_7532 ?auto_7538 ) ( SURFACE-AT ?auto_7524 ?auto_7538 ) ( ON ?auto_7524 ?auto_7534 ) ( CLEAR ?auto_7524 ) ( not ( = ?auto_7523 ?auto_7524 ) ) ( not ( = ?auto_7523 ?auto_7534 ) ) ( not ( = ?auto_7524 ?auto_7534 ) ) ( not ( = ?auto_7527 ?auto_7532 ) ) ( IS-CRATE ?auto_7523 ) ( SURFACE-AT ?auto_7523 ?auto_7538 ) ( ON ?auto_7523 ?auto_7540 ) ( CLEAR ?auto_7523 ) ( not ( = ?auto_7522 ?auto_7523 ) ) ( not ( = ?auto_7522 ?auto_7540 ) ) ( not ( = ?auto_7523 ?auto_7540 ) ) ( IS-CRATE ?auto_7522 ) ( SURFACE-AT ?auto_7522 ?auto_7538 ) ( ON ?auto_7522 ?auto_7535 ) ( CLEAR ?auto_7522 ) ( not ( = ?auto_7521 ?auto_7522 ) ) ( not ( = ?auto_7521 ?auto_7535 ) ) ( not ( = ?auto_7522 ?auto_7535 ) ) ( IS-CRATE ?auto_7521 ) ( not ( = ?auto_7533 ?auto_7530 ) ) ( HOIST-AT ?auto_7537 ?auto_7533 ) ( AVAILABLE ?auto_7537 ) ( SURFACE-AT ?auto_7521 ?auto_7533 ) ( ON ?auto_7521 ?auto_7539 ) ( CLEAR ?auto_7521 ) ( not ( = ?auto_7520 ?auto_7521 ) ) ( not ( = ?auto_7520 ?auto_7539 ) ) ( not ( = ?auto_7521 ?auto_7539 ) ) ( not ( = ?auto_7527 ?auto_7537 ) ) ( SURFACE-AT ?auto_7519 ?auto_7530 ) ( CLEAR ?auto_7519 ) ( IS-CRATE ?auto_7520 ) ( AVAILABLE ?auto_7527 ) ( AVAILABLE ?auto_7532 ) ( SURFACE-AT ?auto_7520 ?auto_7538 ) ( ON ?auto_7520 ?auto_7536 ) ( CLEAR ?auto_7520 ) ( TRUCK-AT ?auto_7531 ?auto_7530 ) ( not ( = ?auto_7519 ?auto_7520 ) ) ( not ( = ?auto_7519 ?auto_7536 ) ) ( not ( = ?auto_7520 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7521 ) ) ( not ( = ?auto_7519 ?auto_7539 ) ) ( not ( = ?auto_7521 ?auto_7536 ) ) ( not ( = ?auto_7533 ?auto_7538 ) ) ( not ( = ?auto_7537 ?auto_7532 ) ) ( not ( = ?auto_7539 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7522 ) ) ( not ( = ?auto_7519 ?auto_7535 ) ) ( not ( = ?auto_7520 ?auto_7522 ) ) ( not ( = ?auto_7520 ?auto_7535 ) ) ( not ( = ?auto_7522 ?auto_7539 ) ) ( not ( = ?auto_7522 ?auto_7536 ) ) ( not ( = ?auto_7535 ?auto_7539 ) ) ( not ( = ?auto_7535 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7523 ) ) ( not ( = ?auto_7519 ?auto_7540 ) ) ( not ( = ?auto_7520 ?auto_7523 ) ) ( not ( = ?auto_7520 ?auto_7540 ) ) ( not ( = ?auto_7521 ?auto_7523 ) ) ( not ( = ?auto_7521 ?auto_7540 ) ) ( not ( = ?auto_7523 ?auto_7535 ) ) ( not ( = ?auto_7523 ?auto_7539 ) ) ( not ( = ?auto_7523 ?auto_7536 ) ) ( not ( = ?auto_7540 ?auto_7535 ) ) ( not ( = ?auto_7540 ?auto_7539 ) ) ( not ( = ?auto_7540 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7524 ) ) ( not ( = ?auto_7519 ?auto_7534 ) ) ( not ( = ?auto_7520 ?auto_7524 ) ) ( not ( = ?auto_7520 ?auto_7534 ) ) ( not ( = ?auto_7521 ?auto_7524 ) ) ( not ( = ?auto_7521 ?auto_7534 ) ) ( not ( = ?auto_7522 ?auto_7524 ) ) ( not ( = ?auto_7522 ?auto_7534 ) ) ( not ( = ?auto_7524 ?auto_7540 ) ) ( not ( = ?auto_7524 ?auto_7535 ) ) ( not ( = ?auto_7524 ?auto_7539 ) ) ( not ( = ?auto_7524 ?auto_7536 ) ) ( not ( = ?auto_7534 ?auto_7540 ) ) ( not ( = ?auto_7534 ?auto_7535 ) ) ( not ( = ?auto_7534 ?auto_7539 ) ) ( not ( = ?auto_7534 ?auto_7536 ) ) ( not ( = ?auto_7519 ?auto_7525 ) ) ( not ( = ?auto_7519 ?auto_7529 ) ) ( not ( = ?auto_7520 ?auto_7525 ) ) ( not ( = ?auto_7520 ?auto_7529 ) ) ( not ( = ?auto_7521 ?auto_7525 ) ) ( not ( = ?auto_7521 ?auto_7529 ) ) ( not ( = ?auto_7522 ?auto_7525 ) ) ( not ( = ?auto_7522 ?auto_7529 ) ) ( not ( = ?auto_7523 ?auto_7525 ) ) ( not ( = ?auto_7523 ?auto_7529 ) ) ( not ( = ?auto_7525 ?auto_7534 ) ) ( not ( = ?auto_7525 ?auto_7540 ) ) ( not ( = ?auto_7525 ?auto_7535 ) ) ( not ( = ?auto_7525 ?auto_7539 ) ) ( not ( = ?auto_7525 ?auto_7536 ) ) ( not ( = ?auto_7526 ?auto_7538 ) ) ( not ( = ?auto_7526 ?auto_7533 ) ) ( not ( = ?auto_7528 ?auto_7532 ) ) ( not ( = ?auto_7528 ?auto_7537 ) ) ( not ( = ?auto_7529 ?auto_7534 ) ) ( not ( = ?auto_7529 ?auto_7540 ) ) ( not ( = ?auto_7529 ?auto_7535 ) ) ( not ( = ?auto_7529 ?auto_7539 ) ) ( not ( = ?auto_7529 ?auto_7536 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7519 ?auto_7520 ?auto_7521 ?auto_7522 ?auto_7523 ?auto_7524 )
      ( MAKE-1CRATE ?auto_7524 ?auto_7525 )
      ( MAKE-6CRATE-VERIFY ?auto_7519 ?auto_7520 ?auto_7521 ?auto_7522 ?auto_7523 ?auto_7524 ?auto_7525 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7559 - SURFACE
      ?auto_7560 - SURFACE
      ?auto_7561 - SURFACE
      ?auto_7562 - SURFACE
      ?auto_7563 - SURFACE
      ?auto_7564 - SURFACE
      ?auto_7565 - SURFACE
      ?auto_7566 - SURFACE
    )
    :vars
    (
      ?auto_7567 - HOIST
      ?auto_7571 - PLACE
      ?auto_7568 - PLACE
      ?auto_7569 - HOIST
      ?auto_7570 - SURFACE
      ?auto_7583 - PLACE
      ?auto_7581 - HOIST
      ?auto_7584 - SURFACE
      ?auto_7575 - PLACE
      ?auto_7578 - HOIST
      ?auto_7577 - SURFACE
      ?auto_7573 - SURFACE
      ?auto_7580 - SURFACE
      ?auto_7576 - PLACE
      ?auto_7579 - HOIST
      ?auto_7582 - SURFACE
      ?auto_7574 - SURFACE
      ?auto_7572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7567 ?auto_7571 ) ( IS-CRATE ?auto_7566 ) ( not ( = ?auto_7568 ?auto_7571 ) ) ( HOIST-AT ?auto_7569 ?auto_7568 ) ( AVAILABLE ?auto_7569 ) ( SURFACE-AT ?auto_7566 ?auto_7568 ) ( ON ?auto_7566 ?auto_7570 ) ( CLEAR ?auto_7566 ) ( not ( = ?auto_7565 ?auto_7566 ) ) ( not ( = ?auto_7565 ?auto_7570 ) ) ( not ( = ?auto_7566 ?auto_7570 ) ) ( not ( = ?auto_7567 ?auto_7569 ) ) ( IS-CRATE ?auto_7565 ) ( not ( = ?auto_7583 ?auto_7571 ) ) ( HOIST-AT ?auto_7581 ?auto_7583 ) ( AVAILABLE ?auto_7581 ) ( SURFACE-AT ?auto_7565 ?auto_7583 ) ( ON ?auto_7565 ?auto_7584 ) ( CLEAR ?auto_7565 ) ( not ( = ?auto_7564 ?auto_7565 ) ) ( not ( = ?auto_7564 ?auto_7584 ) ) ( not ( = ?auto_7565 ?auto_7584 ) ) ( not ( = ?auto_7567 ?auto_7581 ) ) ( IS-CRATE ?auto_7564 ) ( not ( = ?auto_7575 ?auto_7571 ) ) ( HOIST-AT ?auto_7578 ?auto_7575 ) ( SURFACE-AT ?auto_7564 ?auto_7575 ) ( ON ?auto_7564 ?auto_7577 ) ( CLEAR ?auto_7564 ) ( not ( = ?auto_7563 ?auto_7564 ) ) ( not ( = ?auto_7563 ?auto_7577 ) ) ( not ( = ?auto_7564 ?auto_7577 ) ) ( not ( = ?auto_7567 ?auto_7578 ) ) ( IS-CRATE ?auto_7563 ) ( SURFACE-AT ?auto_7563 ?auto_7575 ) ( ON ?auto_7563 ?auto_7573 ) ( CLEAR ?auto_7563 ) ( not ( = ?auto_7562 ?auto_7563 ) ) ( not ( = ?auto_7562 ?auto_7573 ) ) ( not ( = ?auto_7563 ?auto_7573 ) ) ( IS-CRATE ?auto_7562 ) ( SURFACE-AT ?auto_7562 ?auto_7575 ) ( ON ?auto_7562 ?auto_7580 ) ( CLEAR ?auto_7562 ) ( not ( = ?auto_7561 ?auto_7562 ) ) ( not ( = ?auto_7561 ?auto_7580 ) ) ( not ( = ?auto_7562 ?auto_7580 ) ) ( IS-CRATE ?auto_7561 ) ( not ( = ?auto_7576 ?auto_7571 ) ) ( HOIST-AT ?auto_7579 ?auto_7576 ) ( AVAILABLE ?auto_7579 ) ( SURFACE-AT ?auto_7561 ?auto_7576 ) ( ON ?auto_7561 ?auto_7582 ) ( CLEAR ?auto_7561 ) ( not ( = ?auto_7560 ?auto_7561 ) ) ( not ( = ?auto_7560 ?auto_7582 ) ) ( not ( = ?auto_7561 ?auto_7582 ) ) ( not ( = ?auto_7567 ?auto_7579 ) ) ( SURFACE-AT ?auto_7559 ?auto_7571 ) ( CLEAR ?auto_7559 ) ( IS-CRATE ?auto_7560 ) ( AVAILABLE ?auto_7567 ) ( AVAILABLE ?auto_7578 ) ( SURFACE-AT ?auto_7560 ?auto_7575 ) ( ON ?auto_7560 ?auto_7574 ) ( CLEAR ?auto_7560 ) ( TRUCK-AT ?auto_7572 ?auto_7571 ) ( not ( = ?auto_7559 ?auto_7560 ) ) ( not ( = ?auto_7559 ?auto_7574 ) ) ( not ( = ?auto_7560 ?auto_7574 ) ) ( not ( = ?auto_7559 ?auto_7561 ) ) ( not ( = ?auto_7559 ?auto_7582 ) ) ( not ( = ?auto_7561 ?auto_7574 ) ) ( not ( = ?auto_7576 ?auto_7575 ) ) ( not ( = ?auto_7579 ?auto_7578 ) ) ( not ( = ?auto_7582 ?auto_7574 ) ) ( not ( = ?auto_7559 ?auto_7562 ) ) ( not ( = ?auto_7559 ?auto_7580 ) ) ( not ( = ?auto_7560 ?auto_7562 ) ) ( not ( = ?auto_7560 ?auto_7580 ) ) ( not ( = ?auto_7562 ?auto_7582 ) ) ( not ( = ?auto_7562 ?auto_7574 ) ) ( not ( = ?auto_7580 ?auto_7582 ) ) ( not ( = ?auto_7580 ?auto_7574 ) ) ( not ( = ?auto_7559 ?auto_7563 ) ) ( not ( = ?auto_7559 ?auto_7573 ) ) ( not ( = ?auto_7560 ?auto_7563 ) ) ( not ( = ?auto_7560 ?auto_7573 ) ) ( not ( = ?auto_7561 ?auto_7563 ) ) ( not ( = ?auto_7561 ?auto_7573 ) ) ( not ( = ?auto_7563 ?auto_7580 ) ) ( not ( = ?auto_7563 ?auto_7582 ) ) ( not ( = ?auto_7563 ?auto_7574 ) ) ( not ( = ?auto_7573 ?auto_7580 ) ) ( not ( = ?auto_7573 ?auto_7582 ) ) ( not ( = ?auto_7573 ?auto_7574 ) ) ( not ( = ?auto_7559 ?auto_7564 ) ) ( not ( = ?auto_7559 ?auto_7577 ) ) ( not ( = ?auto_7560 ?auto_7564 ) ) ( not ( = ?auto_7560 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7564 ) ) ( not ( = ?auto_7561 ?auto_7577 ) ) ( not ( = ?auto_7562 ?auto_7564 ) ) ( not ( = ?auto_7562 ?auto_7577 ) ) ( not ( = ?auto_7564 ?auto_7573 ) ) ( not ( = ?auto_7564 ?auto_7580 ) ) ( not ( = ?auto_7564 ?auto_7582 ) ) ( not ( = ?auto_7564 ?auto_7574 ) ) ( not ( = ?auto_7577 ?auto_7573 ) ) ( not ( = ?auto_7577 ?auto_7580 ) ) ( not ( = ?auto_7577 ?auto_7582 ) ) ( not ( = ?auto_7577 ?auto_7574 ) ) ( not ( = ?auto_7559 ?auto_7565 ) ) ( not ( = ?auto_7559 ?auto_7584 ) ) ( not ( = ?auto_7560 ?auto_7565 ) ) ( not ( = ?auto_7560 ?auto_7584 ) ) ( not ( = ?auto_7561 ?auto_7565 ) ) ( not ( = ?auto_7561 ?auto_7584 ) ) ( not ( = ?auto_7562 ?auto_7565 ) ) ( not ( = ?auto_7562 ?auto_7584 ) ) ( not ( = ?auto_7563 ?auto_7565 ) ) ( not ( = ?auto_7563 ?auto_7584 ) ) ( not ( = ?auto_7565 ?auto_7577 ) ) ( not ( = ?auto_7565 ?auto_7573 ) ) ( not ( = ?auto_7565 ?auto_7580 ) ) ( not ( = ?auto_7565 ?auto_7582 ) ) ( not ( = ?auto_7565 ?auto_7574 ) ) ( not ( = ?auto_7583 ?auto_7575 ) ) ( not ( = ?auto_7583 ?auto_7576 ) ) ( not ( = ?auto_7581 ?auto_7578 ) ) ( not ( = ?auto_7581 ?auto_7579 ) ) ( not ( = ?auto_7584 ?auto_7577 ) ) ( not ( = ?auto_7584 ?auto_7573 ) ) ( not ( = ?auto_7584 ?auto_7580 ) ) ( not ( = ?auto_7584 ?auto_7582 ) ) ( not ( = ?auto_7584 ?auto_7574 ) ) ( not ( = ?auto_7559 ?auto_7566 ) ) ( not ( = ?auto_7559 ?auto_7570 ) ) ( not ( = ?auto_7560 ?auto_7566 ) ) ( not ( = ?auto_7560 ?auto_7570 ) ) ( not ( = ?auto_7561 ?auto_7566 ) ) ( not ( = ?auto_7561 ?auto_7570 ) ) ( not ( = ?auto_7562 ?auto_7566 ) ) ( not ( = ?auto_7562 ?auto_7570 ) ) ( not ( = ?auto_7563 ?auto_7566 ) ) ( not ( = ?auto_7563 ?auto_7570 ) ) ( not ( = ?auto_7564 ?auto_7566 ) ) ( not ( = ?auto_7564 ?auto_7570 ) ) ( not ( = ?auto_7566 ?auto_7584 ) ) ( not ( = ?auto_7566 ?auto_7577 ) ) ( not ( = ?auto_7566 ?auto_7573 ) ) ( not ( = ?auto_7566 ?auto_7580 ) ) ( not ( = ?auto_7566 ?auto_7582 ) ) ( not ( = ?auto_7566 ?auto_7574 ) ) ( not ( = ?auto_7568 ?auto_7583 ) ) ( not ( = ?auto_7568 ?auto_7575 ) ) ( not ( = ?auto_7568 ?auto_7576 ) ) ( not ( = ?auto_7569 ?auto_7581 ) ) ( not ( = ?auto_7569 ?auto_7578 ) ) ( not ( = ?auto_7569 ?auto_7579 ) ) ( not ( = ?auto_7570 ?auto_7584 ) ) ( not ( = ?auto_7570 ?auto_7577 ) ) ( not ( = ?auto_7570 ?auto_7573 ) ) ( not ( = ?auto_7570 ?auto_7580 ) ) ( not ( = ?auto_7570 ?auto_7582 ) ) ( not ( = ?auto_7570 ?auto_7574 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7559 ?auto_7560 ?auto_7561 ?auto_7562 ?auto_7563 ?auto_7564 ?auto_7565 )
      ( MAKE-1CRATE ?auto_7565 ?auto_7566 )
      ( MAKE-7CRATE-VERIFY ?auto_7559 ?auto_7560 ?auto_7561 ?auto_7562 ?auto_7563 ?auto_7564 ?auto_7565 ?auto_7566 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_7604 - SURFACE
      ?auto_7605 - SURFACE
      ?auto_7606 - SURFACE
      ?auto_7607 - SURFACE
      ?auto_7608 - SURFACE
      ?auto_7609 - SURFACE
      ?auto_7610 - SURFACE
      ?auto_7611 - SURFACE
      ?auto_7612 - SURFACE
    )
    :vars
    (
      ?auto_7616 - HOIST
      ?auto_7618 - PLACE
      ?auto_7613 - PLACE
      ?auto_7614 - HOIST
      ?auto_7615 - SURFACE
      ?auto_7630 - PLACE
      ?auto_7623 - HOIST
      ?auto_7632 - SURFACE
      ?auto_7619 - PLACE
      ?auto_7624 - HOIST
      ?auto_7629 - SURFACE
      ?auto_7626 - PLACE
      ?auto_7620 - HOIST
      ?auto_7631 - SURFACE
      ?auto_7628 - SURFACE
      ?auto_7621 - SURFACE
      ?auto_7625 - PLACE
      ?auto_7622 - HOIST
      ?auto_7633 - SURFACE
      ?auto_7627 - SURFACE
      ?auto_7617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7616 ?auto_7618 ) ( IS-CRATE ?auto_7612 ) ( not ( = ?auto_7613 ?auto_7618 ) ) ( HOIST-AT ?auto_7614 ?auto_7613 ) ( AVAILABLE ?auto_7614 ) ( SURFACE-AT ?auto_7612 ?auto_7613 ) ( ON ?auto_7612 ?auto_7615 ) ( CLEAR ?auto_7612 ) ( not ( = ?auto_7611 ?auto_7612 ) ) ( not ( = ?auto_7611 ?auto_7615 ) ) ( not ( = ?auto_7612 ?auto_7615 ) ) ( not ( = ?auto_7616 ?auto_7614 ) ) ( IS-CRATE ?auto_7611 ) ( not ( = ?auto_7630 ?auto_7618 ) ) ( HOIST-AT ?auto_7623 ?auto_7630 ) ( AVAILABLE ?auto_7623 ) ( SURFACE-AT ?auto_7611 ?auto_7630 ) ( ON ?auto_7611 ?auto_7632 ) ( CLEAR ?auto_7611 ) ( not ( = ?auto_7610 ?auto_7611 ) ) ( not ( = ?auto_7610 ?auto_7632 ) ) ( not ( = ?auto_7611 ?auto_7632 ) ) ( not ( = ?auto_7616 ?auto_7623 ) ) ( IS-CRATE ?auto_7610 ) ( not ( = ?auto_7619 ?auto_7618 ) ) ( HOIST-AT ?auto_7624 ?auto_7619 ) ( AVAILABLE ?auto_7624 ) ( SURFACE-AT ?auto_7610 ?auto_7619 ) ( ON ?auto_7610 ?auto_7629 ) ( CLEAR ?auto_7610 ) ( not ( = ?auto_7609 ?auto_7610 ) ) ( not ( = ?auto_7609 ?auto_7629 ) ) ( not ( = ?auto_7610 ?auto_7629 ) ) ( not ( = ?auto_7616 ?auto_7624 ) ) ( IS-CRATE ?auto_7609 ) ( not ( = ?auto_7626 ?auto_7618 ) ) ( HOIST-AT ?auto_7620 ?auto_7626 ) ( SURFACE-AT ?auto_7609 ?auto_7626 ) ( ON ?auto_7609 ?auto_7631 ) ( CLEAR ?auto_7609 ) ( not ( = ?auto_7608 ?auto_7609 ) ) ( not ( = ?auto_7608 ?auto_7631 ) ) ( not ( = ?auto_7609 ?auto_7631 ) ) ( not ( = ?auto_7616 ?auto_7620 ) ) ( IS-CRATE ?auto_7608 ) ( SURFACE-AT ?auto_7608 ?auto_7626 ) ( ON ?auto_7608 ?auto_7628 ) ( CLEAR ?auto_7608 ) ( not ( = ?auto_7607 ?auto_7608 ) ) ( not ( = ?auto_7607 ?auto_7628 ) ) ( not ( = ?auto_7608 ?auto_7628 ) ) ( IS-CRATE ?auto_7607 ) ( SURFACE-AT ?auto_7607 ?auto_7626 ) ( ON ?auto_7607 ?auto_7621 ) ( CLEAR ?auto_7607 ) ( not ( = ?auto_7606 ?auto_7607 ) ) ( not ( = ?auto_7606 ?auto_7621 ) ) ( not ( = ?auto_7607 ?auto_7621 ) ) ( IS-CRATE ?auto_7606 ) ( not ( = ?auto_7625 ?auto_7618 ) ) ( HOIST-AT ?auto_7622 ?auto_7625 ) ( AVAILABLE ?auto_7622 ) ( SURFACE-AT ?auto_7606 ?auto_7625 ) ( ON ?auto_7606 ?auto_7633 ) ( CLEAR ?auto_7606 ) ( not ( = ?auto_7605 ?auto_7606 ) ) ( not ( = ?auto_7605 ?auto_7633 ) ) ( not ( = ?auto_7606 ?auto_7633 ) ) ( not ( = ?auto_7616 ?auto_7622 ) ) ( SURFACE-AT ?auto_7604 ?auto_7618 ) ( CLEAR ?auto_7604 ) ( IS-CRATE ?auto_7605 ) ( AVAILABLE ?auto_7616 ) ( AVAILABLE ?auto_7620 ) ( SURFACE-AT ?auto_7605 ?auto_7626 ) ( ON ?auto_7605 ?auto_7627 ) ( CLEAR ?auto_7605 ) ( TRUCK-AT ?auto_7617 ?auto_7618 ) ( not ( = ?auto_7604 ?auto_7605 ) ) ( not ( = ?auto_7604 ?auto_7627 ) ) ( not ( = ?auto_7605 ?auto_7627 ) ) ( not ( = ?auto_7604 ?auto_7606 ) ) ( not ( = ?auto_7604 ?auto_7633 ) ) ( not ( = ?auto_7606 ?auto_7627 ) ) ( not ( = ?auto_7625 ?auto_7626 ) ) ( not ( = ?auto_7622 ?auto_7620 ) ) ( not ( = ?auto_7633 ?auto_7627 ) ) ( not ( = ?auto_7604 ?auto_7607 ) ) ( not ( = ?auto_7604 ?auto_7621 ) ) ( not ( = ?auto_7605 ?auto_7607 ) ) ( not ( = ?auto_7605 ?auto_7621 ) ) ( not ( = ?auto_7607 ?auto_7633 ) ) ( not ( = ?auto_7607 ?auto_7627 ) ) ( not ( = ?auto_7621 ?auto_7633 ) ) ( not ( = ?auto_7621 ?auto_7627 ) ) ( not ( = ?auto_7604 ?auto_7608 ) ) ( not ( = ?auto_7604 ?auto_7628 ) ) ( not ( = ?auto_7605 ?auto_7608 ) ) ( not ( = ?auto_7605 ?auto_7628 ) ) ( not ( = ?auto_7606 ?auto_7608 ) ) ( not ( = ?auto_7606 ?auto_7628 ) ) ( not ( = ?auto_7608 ?auto_7621 ) ) ( not ( = ?auto_7608 ?auto_7633 ) ) ( not ( = ?auto_7608 ?auto_7627 ) ) ( not ( = ?auto_7628 ?auto_7621 ) ) ( not ( = ?auto_7628 ?auto_7633 ) ) ( not ( = ?auto_7628 ?auto_7627 ) ) ( not ( = ?auto_7604 ?auto_7609 ) ) ( not ( = ?auto_7604 ?auto_7631 ) ) ( not ( = ?auto_7605 ?auto_7609 ) ) ( not ( = ?auto_7605 ?auto_7631 ) ) ( not ( = ?auto_7606 ?auto_7609 ) ) ( not ( = ?auto_7606 ?auto_7631 ) ) ( not ( = ?auto_7607 ?auto_7609 ) ) ( not ( = ?auto_7607 ?auto_7631 ) ) ( not ( = ?auto_7609 ?auto_7628 ) ) ( not ( = ?auto_7609 ?auto_7621 ) ) ( not ( = ?auto_7609 ?auto_7633 ) ) ( not ( = ?auto_7609 ?auto_7627 ) ) ( not ( = ?auto_7631 ?auto_7628 ) ) ( not ( = ?auto_7631 ?auto_7621 ) ) ( not ( = ?auto_7631 ?auto_7633 ) ) ( not ( = ?auto_7631 ?auto_7627 ) ) ( not ( = ?auto_7604 ?auto_7610 ) ) ( not ( = ?auto_7604 ?auto_7629 ) ) ( not ( = ?auto_7605 ?auto_7610 ) ) ( not ( = ?auto_7605 ?auto_7629 ) ) ( not ( = ?auto_7606 ?auto_7610 ) ) ( not ( = ?auto_7606 ?auto_7629 ) ) ( not ( = ?auto_7607 ?auto_7610 ) ) ( not ( = ?auto_7607 ?auto_7629 ) ) ( not ( = ?auto_7608 ?auto_7610 ) ) ( not ( = ?auto_7608 ?auto_7629 ) ) ( not ( = ?auto_7610 ?auto_7631 ) ) ( not ( = ?auto_7610 ?auto_7628 ) ) ( not ( = ?auto_7610 ?auto_7621 ) ) ( not ( = ?auto_7610 ?auto_7633 ) ) ( not ( = ?auto_7610 ?auto_7627 ) ) ( not ( = ?auto_7619 ?auto_7626 ) ) ( not ( = ?auto_7619 ?auto_7625 ) ) ( not ( = ?auto_7624 ?auto_7620 ) ) ( not ( = ?auto_7624 ?auto_7622 ) ) ( not ( = ?auto_7629 ?auto_7631 ) ) ( not ( = ?auto_7629 ?auto_7628 ) ) ( not ( = ?auto_7629 ?auto_7621 ) ) ( not ( = ?auto_7629 ?auto_7633 ) ) ( not ( = ?auto_7629 ?auto_7627 ) ) ( not ( = ?auto_7604 ?auto_7611 ) ) ( not ( = ?auto_7604 ?auto_7632 ) ) ( not ( = ?auto_7605 ?auto_7611 ) ) ( not ( = ?auto_7605 ?auto_7632 ) ) ( not ( = ?auto_7606 ?auto_7611 ) ) ( not ( = ?auto_7606 ?auto_7632 ) ) ( not ( = ?auto_7607 ?auto_7611 ) ) ( not ( = ?auto_7607 ?auto_7632 ) ) ( not ( = ?auto_7608 ?auto_7611 ) ) ( not ( = ?auto_7608 ?auto_7632 ) ) ( not ( = ?auto_7609 ?auto_7611 ) ) ( not ( = ?auto_7609 ?auto_7632 ) ) ( not ( = ?auto_7611 ?auto_7629 ) ) ( not ( = ?auto_7611 ?auto_7631 ) ) ( not ( = ?auto_7611 ?auto_7628 ) ) ( not ( = ?auto_7611 ?auto_7621 ) ) ( not ( = ?auto_7611 ?auto_7633 ) ) ( not ( = ?auto_7611 ?auto_7627 ) ) ( not ( = ?auto_7630 ?auto_7619 ) ) ( not ( = ?auto_7630 ?auto_7626 ) ) ( not ( = ?auto_7630 ?auto_7625 ) ) ( not ( = ?auto_7623 ?auto_7624 ) ) ( not ( = ?auto_7623 ?auto_7620 ) ) ( not ( = ?auto_7623 ?auto_7622 ) ) ( not ( = ?auto_7632 ?auto_7629 ) ) ( not ( = ?auto_7632 ?auto_7631 ) ) ( not ( = ?auto_7632 ?auto_7628 ) ) ( not ( = ?auto_7632 ?auto_7621 ) ) ( not ( = ?auto_7632 ?auto_7633 ) ) ( not ( = ?auto_7632 ?auto_7627 ) ) ( not ( = ?auto_7604 ?auto_7612 ) ) ( not ( = ?auto_7604 ?auto_7615 ) ) ( not ( = ?auto_7605 ?auto_7612 ) ) ( not ( = ?auto_7605 ?auto_7615 ) ) ( not ( = ?auto_7606 ?auto_7612 ) ) ( not ( = ?auto_7606 ?auto_7615 ) ) ( not ( = ?auto_7607 ?auto_7612 ) ) ( not ( = ?auto_7607 ?auto_7615 ) ) ( not ( = ?auto_7608 ?auto_7612 ) ) ( not ( = ?auto_7608 ?auto_7615 ) ) ( not ( = ?auto_7609 ?auto_7612 ) ) ( not ( = ?auto_7609 ?auto_7615 ) ) ( not ( = ?auto_7610 ?auto_7612 ) ) ( not ( = ?auto_7610 ?auto_7615 ) ) ( not ( = ?auto_7612 ?auto_7632 ) ) ( not ( = ?auto_7612 ?auto_7629 ) ) ( not ( = ?auto_7612 ?auto_7631 ) ) ( not ( = ?auto_7612 ?auto_7628 ) ) ( not ( = ?auto_7612 ?auto_7621 ) ) ( not ( = ?auto_7612 ?auto_7633 ) ) ( not ( = ?auto_7612 ?auto_7627 ) ) ( not ( = ?auto_7613 ?auto_7630 ) ) ( not ( = ?auto_7613 ?auto_7619 ) ) ( not ( = ?auto_7613 ?auto_7626 ) ) ( not ( = ?auto_7613 ?auto_7625 ) ) ( not ( = ?auto_7614 ?auto_7623 ) ) ( not ( = ?auto_7614 ?auto_7624 ) ) ( not ( = ?auto_7614 ?auto_7620 ) ) ( not ( = ?auto_7614 ?auto_7622 ) ) ( not ( = ?auto_7615 ?auto_7632 ) ) ( not ( = ?auto_7615 ?auto_7629 ) ) ( not ( = ?auto_7615 ?auto_7631 ) ) ( not ( = ?auto_7615 ?auto_7628 ) ) ( not ( = ?auto_7615 ?auto_7621 ) ) ( not ( = ?auto_7615 ?auto_7633 ) ) ( not ( = ?auto_7615 ?auto_7627 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7604 ?auto_7605 ?auto_7606 ?auto_7607 ?auto_7608 ?auto_7609 ?auto_7610 ?auto_7611 )
      ( MAKE-1CRATE ?auto_7611 ?auto_7612 )
      ( MAKE-8CRATE-VERIFY ?auto_7604 ?auto_7605 ?auto_7606 ?auto_7607 ?auto_7608 ?auto_7609 ?auto_7610 ?auto_7611 ?auto_7612 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_7654 - SURFACE
      ?auto_7655 - SURFACE
      ?auto_7656 - SURFACE
      ?auto_7657 - SURFACE
      ?auto_7658 - SURFACE
      ?auto_7659 - SURFACE
      ?auto_7660 - SURFACE
      ?auto_7661 - SURFACE
      ?auto_7662 - SURFACE
      ?auto_7663 - SURFACE
    )
    :vars
    (
      ?auto_7669 - HOIST
      ?auto_7668 - PLACE
      ?auto_7664 - PLACE
      ?auto_7666 - HOIST
      ?auto_7667 - SURFACE
      ?auto_7678 - PLACE
      ?auto_7672 - HOIST
      ?auto_7683 - SURFACE
      ?auto_7680 - PLACE
      ?auto_7675 - HOIST
      ?auto_7673 - SURFACE
      ?auto_7670 - PLACE
      ?auto_7674 - HOIST
      ?auto_7679 - SURFACE
      ?auto_7671 - SURFACE
      ?auto_7676 - SURFACE
      ?auto_7681 - SURFACE
      ?auto_7685 - PLACE
      ?auto_7682 - HOIST
      ?auto_7684 - SURFACE
      ?auto_7677 - SURFACE
      ?auto_7665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7669 ?auto_7668 ) ( IS-CRATE ?auto_7663 ) ( not ( = ?auto_7664 ?auto_7668 ) ) ( HOIST-AT ?auto_7666 ?auto_7664 ) ( SURFACE-AT ?auto_7663 ?auto_7664 ) ( ON ?auto_7663 ?auto_7667 ) ( CLEAR ?auto_7663 ) ( not ( = ?auto_7662 ?auto_7663 ) ) ( not ( = ?auto_7662 ?auto_7667 ) ) ( not ( = ?auto_7663 ?auto_7667 ) ) ( not ( = ?auto_7669 ?auto_7666 ) ) ( IS-CRATE ?auto_7662 ) ( not ( = ?auto_7678 ?auto_7668 ) ) ( HOIST-AT ?auto_7672 ?auto_7678 ) ( AVAILABLE ?auto_7672 ) ( SURFACE-AT ?auto_7662 ?auto_7678 ) ( ON ?auto_7662 ?auto_7683 ) ( CLEAR ?auto_7662 ) ( not ( = ?auto_7661 ?auto_7662 ) ) ( not ( = ?auto_7661 ?auto_7683 ) ) ( not ( = ?auto_7662 ?auto_7683 ) ) ( not ( = ?auto_7669 ?auto_7672 ) ) ( IS-CRATE ?auto_7661 ) ( not ( = ?auto_7680 ?auto_7668 ) ) ( HOIST-AT ?auto_7675 ?auto_7680 ) ( AVAILABLE ?auto_7675 ) ( SURFACE-AT ?auto_7661 ?auto_7680 ) ( ON ?auto_7661 ?auto_7673 ) ( CLEAR ?auto_7661 ) ( not ( = ?auto_7660 ?auto_7661 ) ) ( not ( = ?auto_7660 ?auto_7673 ) ) ( not ( = ?auto_7661 ?auto_7673 ) ) ( not ( = ?auto_7669 ?auto_7675 ) ) ( IS-CRATE ?auto_7660 ) ( not ( = ?auto_7670 ?auto_7668 ) ) ( HOIST-AT ?auto_7674 ?auto_7670 ) ( AVAILABLE ?auto_7674 ) ( SURFACE-AT ?auto_7660 ?auto_7670 ) ( ON ?auto_7660 ?auto_7679 ) ( CLEAR ?auto_7660 ) ( not ( = ?auto_7659 ?auto_7660 ) ) ( not ( = ?auto_7659 ?auto_7679 ) ) ( not ( = ?auto_7660 ?auto_7679 ) ) ( not ( = ?auto_7669 ?auto_7674 ) ) ( IS-CRATE ?auto_7659 ) ( SURFACE-AT ?auto_7659 ?auto_7664 ) ( ON ?auto_7659 ?auto_7671 ) ( CLEAR ?auto_7659 ) ( not ( = ?auto_7658 ?auto_7659 ) ) ( not ( = ?auto_7658 ?auto_7671 ) ) ( not ( = ?auto_7659 ?auto_7671 ) ) ( IS-CRATE ?auto_7658 ) ( SURFACE-AT ?auto_7658 ?auto_7664 ) ( ON ?auto_7658 ?auto_7676 ) ( CLEAR ?auto_7658 ) ( not ( = ?auto_7657 ?auto_7658 ) ) ( not ( = ?auto_7657 ?auto_7676 ) ) ( not ( = ?auto_7658 ?auto_7676 ) ) ( IS-CRATE ?auto_7657 ) ( SURFACE-AT ?auto_7657 ?auto_7664 ) ( ON ?auto_7657 ?auto_7681 ) ( CLEAR ?auto_7657 ) ( not ( = ?auto_7656 ?auto_7657 ) ) ( not ( = ?auto_7656 ?auto_7681 ) ) ( not ( = ?auto_7657 ?auto_7681 ) ) ( IS-CRATE ?auto_7656 ) ( not ( = ?auto_7685 ?auto_7668 ) ) ( HOIST-AT ?auto_7682 ?auto_7685 ) ( AVAILABLE ?auto_7682 ) ( SURFACE-AT ?auto_7656 ?auto_7685 ) ( ON ?auto_7656 ?auto_7684 ) ( CLEAR ?auto_7656 ) ( not ( = ?auto_7655 ?auto_7656 ) ) ( not ( = ?auto_7655 ?auto_7684 ) ) ( not ( = ?auto_7656 ?auto_7684 ) ) ( not ( = ?auto_7669 ?auto_7682 ) ) ( SURFACE-AT ?auto_7654 ?auto_7668 ) ( CLEAR ?auto_7654 ) ( IS-CRATE ?auto_7655 ) ( AVAILABLE ?auto_7669 ) ( AVAILABLE ?auto_7666 ) ( SURFACE-AT ?auto_7655 ?auto_7664 ) ( ON ?auto_7655 ?auto_7677 ) ( CLEAR ?auto_7655 ) ( TRUCK-AT ?auto_7665 ?auto_7668 ) ( not ( = ?auto_7654 ?auto_7655 ) ) ( not ( = ?auto_7654 ?auto_7677 ) ) ( not ( = ?auto_7655 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7656 ) ) ( not ( = ?auto_7654 ?auto_7684 ) ) ( not ( = ?auto_7656 ?auto_7677 ) ) ( not ( = ?auto_7685 ?auto_7664 ) ) ( not ( = ?auto_7682 ?auto_7666 ) ) ( not ( = ?auto_7684 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7657 ) ) ( not ( = ?auto_7654 ?auto_7681 ) ) ( not ( = ?auto_7655 ?auto_7657 ) ) ( not ( = ?auto_7655 ?auto_7681 ) ) ( not ( = ?auto_7657 ?auto_7684 ) ) ( not ( = ?auto_7657 ?auto_7677 ) ) ( not ( = ?auto_7681 ?auto_7684 ) ) ( not ( = ?auto_7681 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7658 ) ) ( not ( = ?auto_7654 ?auto_7676 ) ) ( not ( = ?auto_7655 ?auto_7658 ) ) ( not ( = ?auto_7655 ?auto_7676 ) ) ( not ( = ?auto_7656 ?auto_7658 ) ) ( not ( = ?auto_7656 ?auto_7676 ) ) ( not ( = ?auto_7658 ?auto_7681 ) ) ( not ( = ?auto_7658 ?auto_7684 ) ) ( not ( = ?auto_7658 ?auto_7677 ) ) ( not ( = ?auto_7676 ?auto_7681 ) ) ( not ( = ?auto_7676 ?auto_7684 ) ) ( not ( = ?auto_7676 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7659 ) ) ( not ( = ?auto_7654 ?auto_7671 ) ) ( not ( = ?auto_7655 ?auto_7659 ) ) ( not ( = ?auto_7655 ?auto_7671 ) ) ( not ( = ?auto_7656 ?auto_7659 ) ) ( not ( = ?auto_7656 ?auto_7671 ) ) ( not ( = ?auto_7657 ?auto_7659 ) ) ( not ( = ?auto_7657 ?auto_7671 ) ) ( not ( = ?auto_7659 ?auto_7676 ) ) ( not ( = ?auto_7659 ?auto_7681 ) ) ( not ( = ?auto_7659 ?auto_7684 ) ) ( not ( = ?auto_7659 ?auto_7677 ) ) ( not ( = ?auto_7671 ?auto_7676 ) ) ( not ( = ?auto_7671 ?auto_7681 ) ) ( not ( = ?auto_7671 ?auto_7684 ) ) ( not ( = ?auto_7671 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7660 ) ) ( not ( = ?auto_7654 ?auto_7679 ) ) ( not ( = ?auto_7655 ?auto_7660 ) ) ( not ( = ?auto_7655 ?auto_7679 ) ) ( not ( = ?auto_7656 ?auto_7660 ) ) ( not ( = ?auto_7656 ?auto_7679 ) ) ( not ( = ?auto_7657 ?auto_7660 ) ) ( not ( = ?auto_7657 ?auto_7679 ) ) ( not ( = ?auto_7658 ?auto_7660 ) ) ( not ( = ?auto_7658 ?auto_7679 ) ) ( not ( = ?auto_7660 ?auto_7671 ) ) ( not ( = ?auto_7660 ?auto_7676 ) ) ( not ( = ?auto_7660 ?auto_7681 ) ) ( not ( = ?auto_7660 ?auto_7684 ) ) ( not ( = ?auto_7660 ?auto_7677 ) ) ( not ( = ?auto_7670 ?auto_7664 ) ) ( not ( = ?auto_7670 ?auto_7685 ) ) ( not ( = ?auto_7674 ?auto_7666 ) ) ( not ( = ?auto_7674 ?auto_7682 ) ) ( not ( = ?auto_7679 ?auto_7671 ) ) ( not ( = ?auto_7679 ?auto_7676 ) ) ( not ( = ?auto_7679 ?auto_7681 ) ) ( not ( = ?auto_7679 ?auto_7684 ) ) ( not ( = ?auto_7679 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7661 ) ) ( not ( = ?auto_7654 ?auto_7673 ) ) ( not ( = ?auto_7655 ?auto_7661 ) ) ( not ( = ?auto_7655 ?auto_7673 ) ) ( not ( = ?auto_7656 ?auto_7661 ) ) ( not ( = ?auto_7656 ?auto_7673 ) ) ( not ( = ?auto_7657 ?auto_7661 ) ) ( not ( = ?auto_7657 ?auto_7673 ) ) ( not ( = ?auto_7658 ?auto_7661 ) ) ( not ( = ?auto_7658 ?auto_7673 ) ) ( not ( = ?auto_7659 ?auto_7661 ) ) ( not ( = ?auto_7659 ?auto_7673 ) ) ( not ( = ?auto_7661 ?auto_7679 ) ) ( not ( = ?auto_7661 ?auto_7671 ) ) ( not ( = ?auto_7661 ?auto_7676 ) ) ( not ( = ?auto_7661 ?auto_7681 ) ) ( not ( = ?auto_7661 ?auto_7684 ) ) ( not ( = ?auto_7661 ?auto_7677 ) ) ( not ( = ?auto_7680 ?auto_7670 ) ) ( not ( = ?auto_7680 ?auto_7664 ) ) ( not ( = ?auto_7680 ?auto_7685 ) ) ( not ( = ?auto_7675 ?auto_7674 ) ) ( not ( = ?auto_7675 ?auto_7666 ) ) ( not ( = ?auto_7675 ?auto_7682 ) ) ( not ( = ?auto_7673 ?auto_7679 ) ) ( not ( = ?auto_7673 ?auto_7671 ) ) ( not ( = ?auto_7673 ?auto_7676 ) ) ( not ( = ?auto_7673 ?auto_7681 ) ) ( not ( = ?auto_7673 ?auto_7684 ) ) ( not ( = ?auto_7673 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7662 ) ) ( not ( = ?auto_7654 ?auto_7683 ) ) ( not ( = ?auto_7655 ?auto_7662 ) ) ( not ( = ?auto_7655 ?auto_7683 ) ) ( not ( = ?auto_7656 ?auto_7662 ) ) ( not ( = ?auto_7656 ?auto_7683 ) ) ( not ( = ?auto_7657 ?auto_7662 ) ) ( not ( = ?auto_7657 ?auto_7683 ) ) ( not ( = ?auto_7658 ?auto_7662 ) ) ( not ( = ?auto_7658 ?auto_7683 ) ) ( not ( = ?auto_7659 ?auto_7662 ) ) ( not ( = ?auto_7659 ?auto_7683 ) ) ( not ( = ?auto_7660 ?auto_7662 ) ) ( not ( = ?auto_7660 ?auto_7683 ) ) ( not ( = ?auto_7662 ?auto_7673 ) ) ( not ( = ?auto_7662 ?auto_7679 ) ) ( not ( = ?auto_7662 ?auto_7671 ) ) ( not ( = ?auto_7662 ?auto_7676 ) ) ( not ( = ?auto_7662 ?auto_7681 ) ) ( not ( = ?auto_7662 ?auto_7684 ) ) ( not ( = ?auto_7662 ?auto_7677 ) ) ( not ( = ?auto_7678 ?auto_7680 ) ) ( not ( = ?auto_7678 ?auto_7670 ) ) ( not ( = ?auto_7678 ?auto_7664 ) ) ( not ( = ?auto_7678 ?auto_7685 ) ) ( not ( = ?auto_7672 ?auto_7675 ) ) ( not ( = ?auto_7672 ?auto_7674 ) ) ( not ( = ?auto_7672 ?auto_7666 ) ) ( not ( = ?auto_7672 ?auto_7682 ) ) ( not ( = ?auto_7683 ?auto_7673 ) ) ( not ( = ?auto_7683 ?auto_7679 ) ) ( not ( = ?auto_7683 ?auto_7671 ) ) ( not ( = ?auto_7683 ?auto_7676 ) ) ( not ( = ?auto_7683 ?auto_7681 ) ) ( not ( = ?auto_7683 ?auto_7684 ) ) ( not ( = ?auto_7683 ?auto_7677 ) ) ( not ( = ?auto_7654 ?auto_7663 ) ) ( not ( = ?auto_7654 ?auto_7667 ) ) ( not ( = ?auto_7655 ?auto_7663 ) ) ( not ( = ?auto_7655 ?auto_7667 ) ) ( not ( = ?auto_7656 ?auto_7663 ) ) ( not ( = ?auto_7656 ?auto_7667 ) ) ( not ( = ?auto_7657 ?auto_7663 ) ) ( not ( = ?auto_7657 ?auto_7667 ) ) ( not ( = ?auto_7658 ?auto_7663 ) ) ( not ( = ?auto_7658 ?auto_7667 ) ) ( not ( = ?auto_7659 ?auto_7663 ) ) ( not ( = ?auto_7659 ?auto_7667 ) ) ( not ( = ?auto_7660 ?auto_7663 ) ) ( not ( = ?auto_7660 ?auto_7667 ) ) ( not ( = ?auto_7661 ?auto_7663 ) ) ( not ( = ?auto_7661 ?auto_7667 ) ) ( not ( = ?auto_7663 ?auto_7683 ) ) ( not ( = ?auto_7663 ?auto_7673 ) ) ( not ( = ?auto_7663 ?auto_7679 ) ) ( not ( = ?auto_7663 ?auto_7671 ) ) ( not ( = ?auto_7663 ?auto_7676 ) ) ( not ( = ?auto_7663 ?auto_7681 ) ) ( not ( = ?auto_7663 ?auto_7684 ) ) ( not ( = ?auto_7663 ?auto_7677 ) ) ( not ( = ?auto_7667 ?auto_7683 ) ) ( not ( = ?auto_7667 ?auto_7673 ) ) ( not ( = ?auto_7667 ?auto_7679 ) ) ( not ( = ?auto_7667 ?auto_7671 ) ) ( not ( = ?auto_7667 ?auto_7676 ) ) ( not ( = ?auto_7667 ?auto_7681 ) ) ( not ( = ?auto_7667 ?auto_7684 ) ) ( not ( = ?auto_7667 ?auto_7677 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7654 ?auto_7655 ?auto_7656 ?auto_7657 ?auto_7658 ?auto_7659 ?auto_7660 ?auto_7661 ?auto_7662 )
      ( MAKE-1CRATE ?auto_7662 ?auto_7663 )
      ( MAKE-9CRATE-VERIFY ?auto_7654 ?auto_7655 ?auto_7656 ?auto_7657 ?auto_7658 ?auto_7659 ?auto_7660 ?auto_7661 ?auto_7662 ?auto_7663 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_7707 - SURFACE
      ?auto_7708 - SURFACE
      ?auto_7709 - SURFACE
      ?auto_7710 - SURFACE
      ?auto_7711 - SURFACE
      ?auto_7712 - SURFACE
      ?auto_7713 - SURFACE
      ?auto_7714 - SURFACE
      ?auto_7715 - SURFACE
      ?auto_7716 - SURFACE
      ?auto_7717 - SURFACE
    )
    :vars
    (
      ?auto_7720 - HOIST
      ?auto_7722 - PLACE
      ?auto_7719 - PLACE
      ?auto_7723 - HOIST
      ?auto_7721 - SURFACE
      ?auto_7728 - PLACE
      ?auto_7739 - HOIST
      ?auto_7729 - SURFACE
      ?auto_7742 - PLACE
      ?auto_7724 - HOIST
      ?auto_7737 - SURFACE
      ?auto_7735 - PLACE
      ?auto_7727 - HOIST
      ?auto_7730 - SURFACE
      ?auto_7732 - PLACE
      ?auto_7736 - HOIST
      ?auto_7726 - SURFACE
      ?auto_7733 - SURFACE
      ?auto_7731 - SURFACE
      ?auto_7734 - SURFACE
      ?auto_7741 - PLACE
      ?auto_7725 - HOIST
      ?auto_7740 - SURFACE
      ?auto_7738 - SURFACE
      ?auto_7718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7720 ?auto_7722 ) ( IS-CRATE ?auto_7717 ) ( not ( = ?auto_7719 ?auto_7722 ) ) ( HOIST-AT ?auto_7723 ?auto_7719 ) ( AVAILABLE ?auto_7723 ) ( SURFACE-AT ?auto_7717 ?auto_7719 ) ( ON ?auto_7717 ?auto_7721 ) ( CLEAR ?auto_7717 ) ( not ( = ?auto_7716 ?auto_7717 ) ) ( not ( = ?auto_7716 ?auto_7721 ) ) ( not ( = ?auto_7717 ?auto_7721 ) ) ( not ( = ?auto_7720 ?auto_7723 ) ) ( IS-CRATE ?auto_7716 ) ( not ( = ?auto_7728 ?auto_7722 ) ) ( HOIST-AT ?auto_7739 ?auto_7728 ) ( SURFACE-AT ?auto_7716 ?auto_7728 ) ( ON ?auto_7716 ?auto_7729 ) ( CLEAR ?auto_7716 ) ( not ( = ?auto_7715 ?auto_7716 ) ) ( not ( = ?auto_7715 ?auto_7729 ) ) ( not ( = ?auto_7716 ?auto_7729 ) ) ( not ( = ?auto_7720 ?auto_7739 ) ) ( IS-CRATE ?auto_7715 ) ( not ( = ?auto_7742 ?auto_7722 ) ) ( HOIST-AT ?auto_7724 ?auto_7742 ) ( AVAILABLE ?auto_7724 ) ( SURFACE-AT ?auto_7715 ?auto_7742 ) ( ON ?auto_7715 ?auto_7737 ) ( CLEAR ?auto_7715 ) ( not ( = ?auto_7714 ?auto_7715 ) ) ( not ( = ?auto_7714 ?auto_7737 ) ) ( not ( = ?auto_7715 ?auto_7737 ) ) ( not ( = ?auto_7720 ?auto_7724 ) ) ( IS-CRATE ?auto_7714 ) ( not ( = ?auto_7735 ?auto_7722 ) ) ( HOIST-AT ?auto_7727 ?auto_7735 ) ( AVAILABLE ?auto_7727 ) ( SURFACE-AT ?auto_7714 ?auto_7735 ) ( ON ?auto_7714 ?auto_7730 ) ( CLEAR ?auto_7714 ) ( not ( = ?auto_7713 ?auto_7714 ) ) ( not ( = ?auto_7713 ?auto_7730 ) ) ( not ( = ?auto_7714 ?auto_7730 ) ) ( not ( = ?auto_7720 ?auto_7727 ) ) ( IS-CRATE ?auto_7713 ) ( not ( = ?auto_7732 ?auto_7722 ) ) ( HOIST-AT ?auto_7736 ?auto_7732 ) ( AVAILABLE ?auto_7736 ) ( SURFACE-AT ?auto_7713 ?auto_7732 ) ( ON ?auto_7713 ?auto_7726 ) ( CLEAR ?auto_7713 ) ( not ( = ?auto_7712 ?auto_7713 ) ) ( not ( = ?auto_7712 ?auto_7726 ) ) ( not ( = ?auto_7713 ?auto_7726 ) ) ( not ( = ?auto_7720 ?auto_7736 ) ) ( IS-CRATE ?auto_7712 ) ( SURFACE-AT ?auto_7712 ?auto_7728 ) ( ON ?auto_7712 ?auto_7733 ) ( CLEAR ?auto_7712 ) ( not ( = ?auto_7711 ?auto_7712 ) ) ( not ( = ?auto_7711 ?auto_7733 ) ) ( not ( = ?auto_7712 ?auto_7733 ) ) ( IS-CRATE ?auto_7711 ) ( SURFACE-AT ?auto_7711 ?auto_7728 ) ( ON ?auto_7711 ?auto_7731 ) ( CLEAR ?auto_7711 ) ( not ( = ?auto_7710 ?auto_7711 ) ) ( not ( = ?auto_7710 ?auto_7731 ) ) ( not ( = ?auto_7711 ?auto_7731 ) ) ( IS-CRATE ?auto_7710 ) ( SURFACE-AT ?auto_7710 ?auto_7728 ) ( ON ?auto_7710 ?auto_7734 ) ( CLEAR ?auto_7710 ) ( not ( = ?auto_7709 ?auto_7710 ) ) ( not ( = ?auto_7709 ?auto_7734 ) ) ( not ( = ?auto_7710 ?auto_7734 ) ) ( IS-CRATE ?auto_7709 ) ( not ( = ?auto_7741 ?auto_7722 ) ) ( HOIST-AT ?auto_7725 ?auto_7741 ) ( AVAILABLE ?auto_7725 ) ( SURFACE-AT ?auto_7709 ?auto_7741 ) ( ON ?auto_7709 ?auto_7740 ) ( CLEAR ?auto_7709 ) ( not ( = ?auto_7708 ?auto_7709 ) ) ( not ( = ?auto_7708 ?auto_7740 ) ) ( not ( = ?auto_7709 ?auto_7740 ) ) ( not ( = ?auto_7720 ?auto_7725 ) ) ( SURFACE-AT ?auto_7707 ?auto_7722 ) ( CLEAR ?auto_7707 ) ( IS-CRATE ?auto_7708 ) ( AVAILABLE ?auto_7720 ) ( AVAILABLE ?auto_7739 ) ( SURFACE-AT ?auto_7708 ?auto_7728 ) ( ON ?auto_7708 ?auto_7738 ) ( CLEAR ?auto_7708 ) ( TRUCK-AT ?auto_7718 ?auto_7722 ) ( not ( = ?auto_7707 ?auto_7708 ) ) ( not ( = ?auto_7707 ?auto_7738 ) ) ( not ( = ?auto_7708 ?auto_7738 ) ) ( not ( = ?auto_7707 ?auto_7709 ) ) ( not ( = ?auto_7707 ?auto_7740 ) ) ( not ( = ?auto_7709 ?auto_7738 ) ) ( not ( = ?auto_7741 ?auto_7728 ) ) ( not ( = ?auto_7725 ?auto_7739 ) ) ( not ( = ?auto_7740 ?auto_7738 ) ) ( not ( = ?auto_7707 ?auto_7710 ) ) ( not ( = ?auto_7707 ?auto_7734 ) ) ( not ( = ?auto_7708 ?auto_7710 ) ) ( not ( = ?auto_7708 ?auto_7734 ) ) ( not ( = ?auto_7710 ?auto_7740 ) ) ( not ( = ?auto_7710 ?auto_7738 ) ) ( not ( = ?auto_7734 ?auto_7740 ) ) ( not ( = ?auto_7734 ?auto_7738 ) ) ( not ( = ?auto_7707 ?auto_7711 ) ) ( not ( = ?auto_7707 ?auto_7731 ) ) ( not ( = ?auto_7708 ?auto_7711 ) ) ( not ( = ?auto_7708 ?auto_7731 ) ) ( not ( = ?auto_7709 ?auto_7711 ) ) ( not ( = ?auto_7709 ?auto_7731 ) ) ( not ( = ?auto_7711 ?auto_7734 ) ) ( not ( = ?auto_7711 ?auto_7740 ) ) ( not ( = ?auto_7711 ?auto_7738 ) ) ( not ( = ?auto_7731 ?auto_7734 ) ) ( not ( = ?auto_7731 ?auto_7740 ) ) ( not ( = ?auto_7731 ?auto_7738 ) ) ( not ( = ?auto_7707 ?auto_7712 ) ) ( not ( = ?auto_7707 ?auto_7733 ) ) ( not ( = ?auto_7708 ?auto_7712 ) ) ( not ( = ?auto_7708 ?auto_7733 ) ) ( not ( = ?auto_7709 ?auto_7712 ) ) ( not ( = ?auto_7709 ?auto_7733 ) ) ( not ( = ?auto_7710 ?auto_7712 ) ) ( not ( = ?auto_7710 ?auto_7733 ) ) ( not ( = ?auto_7712 ?auto_7731 ) ) ( not ( = ?auto_7712 ?auto_7734 ) ) ( not ( = ?auto_7712 ?auto_7740 ) ) ( not ( = ?auto_7712 ?auto_7738 ) ) ( not ( = ?auto_7733 ?auto_7731 ) ) ( not ( = ?auto_7733 ?auto_7734 ) ) ( not ( = ?auto_7733 ?auto_7740 ) ) ( not ( = ?auto_7733 ?auto_7738 ) ) ( not ( = ?auto_7707 ?auto_7713 ) ) ( not ( = ?auto_7707 ?auto_7726 ) ) ( not ( = ?auto_7708 ?auto_7713 ) ) ( not ( = ?auto_7708 ?auto_7726 ) ) ( not ( = ?auto_7709 ?auto_7713 ) ) ( not ( = ?auto_7709 ?auto_7726 ) ) ( not ( = ?auto_7710 ?auto_7713 ) ) ( not ( = ?auto_7710 ?auto_7726 ) ) ( not ( = ?auto_7711 ?auto_7713 ) ) ( not ( = ?auto_7711 ?auto_7726 ) ) ( not ( = ?auto_7713 ?auto_7733 ) ) ( not ( = ?auto_7713 ?auto_7731 ) ) ( not ( = ?auto_7713 ?auto_7734 ) ) ( not ( = ?auto_7713 ?auto_7740 ) ) ( not ( = ?auto_7713 ?auto_7738 ) ) ( not ( = ?auto_7732 ?auto_7728 ) ) ( not ( = ?auto_7732 ?auto_7741 ) ) ( not ( = ?auto_7736 ?auto_7739 ) ) ( not ( = ?auto_7736 ?auto_7725 ) ) ( not ( = ?auto_7726 ?auto_7733 ) ) ( not ( = ?auto_7726 ?auto_7731 ) ) ( not ( = ?auto_7726 ?auto_7734 ) ) ( not ( = ?auto_7726 ?auto_7740 ) ) ( not ( = ?auto_7726 ?auto_7738 ) ) ( not ( = ?auto_7707 ?auto_7714 ) ) ( not ( = ?auto_7707 ?auto_7730 ) ) ( not ( = ?auto_7708 ?auto_7714 ) ) ( not ( = ?auto_7708 ?auto_7730 ) ) ( not ( = ?auto_7709 ?auto_7714 ) ) ( not ( = ?auto_7709 ?auto_7730 ) ) ( not ( = ?auto_7710 ?auto_7714 ) ) ( not ( = ?auto_7710 ?auto_7730 ) ) ( not ( = ?auto_7711 ?auto_7714 ) ) ( not ( = ?auto_7711 ?auto_7730 ) ) ( not ( = ?auto_7712 ?auto_7714 ) ) ( not ( = ?auto_7712 ?auto_7730 ) ) ( not ( = ?auto_7714 ?auto_7726 ) ) ( not ( = ?auto_7714 ?auto_7733 ) ) ( not ( = ?auto_7714 ?auto_7731 ) ) ( not ( = ?auto_7714 ?auto_7734 ) ) ( not ( = ?auto_7714 ?auto_7740 ) ) ( not ( = ?auto_7714 ?auto_7738 ) ) ( not ( = ?auto_7735 ?auto_7732 ) ) ( not ( = ?auto_7735 ?auto_7728 ) ) ( not ( = ?auto_7735 ?auto_7741 ) ) ( not ( = ?auto_7727 ?auto_7736 ) ) ( not ( = ?auto_7727 ?auto_7739 ) ) ( not ( = ?auto_7727 ?auto_7725 ) ) ( not ( = ?auto_7730 ?auto_7726 ) ) ( not ( = ?auto_7730 ?auto_7733 ) ) ( not ( = ?auto_7730 ?auto_7731 ) ) ( not ( = ?auto_7730 ?auto_7734 ) ) ( not ( = ?auto_7730 ?auto_7740 ) ) ( not ( = ?auto_7730 ?auto_7738 ) ) ( not ( = ?auto_7707 ?auto_7715 ) ) ( not ( = ?auto_7707 ?auto_7737 ) ) ( not ( = ?auto_7708 ?auto_7715 ) ) ( not ( = ?auto_7708 ?auto_7737 ) ) ( not ( = ?auto_7709 ?auto_7715 ) ) ( not ( = ?auto_7709 ?auto_7737 ) ) ( not ( = ?auto_7710 ?auto_7715 ) ) ( not ( = ?auto_7710 ?auto_7737 ) ) ( not ( = ?auto_7711 ?auto_7715 ) ) ( not ( = ?auto_7711 ?auto_7737 ) ) ( not ( = ?auto_7712 ?auto_7715 ) ) ( not ( = ?auto_7712 ?auto_7737 ) ) ( not ( = ?auto_7713 ?auto_7715 ) ) ( not ( = ?auto_7713 ?auto_7737 ) ) ( not ( = ?auto_7715 ?auto_7730 ) ) ( not ( = ?auto_7715 ?auto_7726 ) ) ( not ( = ?auto_7715 ?auto_7733 ) ) ( not ( = ?auto_7715 ?auto_7731 ) ) ( not ( = ?auto_7715 ?auto_7734 ) ) ( not ( = ?auto_7715 ?auto_7740 ) ) ( not ( = ?auto_7715 ?auto_7738 ) ) ( not ( = ?auto_7742 ?auto_7735 ) ) ( not ( = ?auto_7742 ?auto_7732 ) ) ( not ( = ?auto_7742 ?auto_7728 ) ) ( not ( = ?auto_7742 ?auto_7741 ) ) ( not ( = ?auto_7724 ?auto_7727 ) ) ( not ( = ?auto_7724 ?auto_7736 ) ) ( not ( = ?auto_7724 ?auto_7739 ) ) ( not ( = ?auto_7724 ?auto_7725 ) ) ( not ( = ?auto_7737 ?auto_7730 ) ) ( not ( = ?auto_7737 ?auto_7726 ) ) ( not ( = ?auto_7737 ?auto_7733 ) ) ( not ( = ?auto_7737 ?auto_7731 ) ) ( not ( = ?auto_7737 ?auto_7734 ) ) ( not ( = ?auto_7737 ?auto_7740 ) ) ( not ( = ?auto_7737 ?auto_7738 ) ) ( not ( = ?auto_7707 ?auto_7716 ) ) ( not ( = ?auto_7707 ?auto_7729 ) ) ( not ( = ?auto_7708 ?auto_7716 ) ) ( not ( = ?auto_7708 ?auto_7729 ) ) ( not ( = ?auto_7709 ?auto_7716 ) ) ( not ( = ?auto_7709 ?auto_7729 ) ) ( not ( = ?auto_7710 ?auto_7716 ) ) ( not ( = ?auto_7710 ?auto_7729 ) ) ( not ( = ?auto_7711 ?auto_7716 ) ) ( not ( = ?auto_7711 ?auto_7729 ) ) ( not ( = ?auto_7712 ?auto_7716 ) ) ( not ( = ?auto_7712 ?auto_7729 ) ) ( not ( = ?auto_7713 ?auto_7716 ) ) ( not ( = ?auto_7713 ?auto_7729 ) ) ( not ( = ?auto_7714 ?auto_7716 ) ) ( not ( = ?auto_7714 ?auto_7729 ) ) ( not ( = ?auto_7716 ?auto_7737 ) ) ( not ( = ?auto_7716 ?auto_7730 ) ) ( not ( = ?auto_7716 ?auto_7726 ) ) ( not ( = ?auto_7716 ?auto_7733 ) ) ( not ( = ?auto_7716 ?auto_7731 ) ) ( not ( = ?auto_7716 ?auto_7734 ) ) ( not ( = ?auto_7716 ?auto_7740 ) ) ( not ( = ?auto_7716 ?auto_7738 ) ) ( not ( = ?auto_7729 ?auto_7737 ) ) ( not ( = ?auto_7729 ?auto_7730 ) ) ( not ( = ?auto_7729 ?auto_7726 ) ) ( not ( = ?auto_7729 ?auto_7733 ) ) ( not ( = ?auto_7729 ?auto_7731 ) ) ( not ( = ?auto_7729 ?auto_7734 ) ) ( not ( = ?auto_7729 ?auto_7740 ) ) ( not ( = ?auto_7729 ?auto_7738 ) ) ( not ( = ?auto_7707 ?auto_7717 ) ) ( not ( = ?auto_7707 ?auto_7721 ) ) ( not ( = ?auto_7708 ?auto_7717 ) ) ( not ( = ?auto_7708 ?auto_7721 ) ) ( not ( = ?auto_7709 ?auto_7717 ) ) ( not ( = ?auto_7709 ?auto_7721 ) ) ( not ( = ?auto_7710 ?auto_7717 ) ) ( not ( = ?auto_7710 ?auto_7721 ) ) ( not ( = ?auto_7711 ?auto_7717 ) ) ( not ( = ?auto_7711 ?auto_7721 ) ) ( not ( = ?auto_7712 ?auto_7717 ) ) ( not ( = ?auto_7712 ?auto_7721 ) ) ( not ( = ?auto_7713 ?auto_7717 ) ) ( not ( = ?auto_7713 ?auto_7721 ) ) ( not ( = ?auto_7714 ?auto_7717 ) ) ( not ( = ?auto_7714 ?auto_7721 ) ) ( not ( = ?auto_7715 ?auto_7717 ) ) ( not ( = ?auto_7715 ?auto_7721 ) ) ( not ( = ?auto_7717 ?auto_7729 ) ) ( not ( = ?auto_7717 ?auto_7737 ) ) ( not ( = ?auto_7717 ?auto_7730 ) ) ( not ( = ?auto_7717 ?auto_7726 ) ) ( not ( = ?auto_7717 ?auto_7733 ) ) ( not ( = ?auto_7717 ?auto_7731 ) ) ( not ( = ?auto_7717 ?auto_7734 ) ) ( not ( = ?auto_7717 ?auto_7740 ) ) ( not ( = ?auto_7717 ?auto_7738 ) ) ( not ( = ?auto_7719 ?auto_7728 ) ) ( not ( = ?auto_7719 ?auto_7742 ) ) ( not ( = ?auto_7719 ?auto_7735 ) ) ( not ( = ?auto_7719 ?auto_7732 ) ) ( not ( = ?auto_7719 ?auto_7741 ) ) ( not ( = ?auto_7723 ?auto_7739 ) ) ( not ( = ?auto_7723 ?auto_7724 ) ) ( not ( = ?auto_7723 ?auto_7727 ) ) ( not ( = ?auto_7723 ?auto_7736 ) ) ( not ( = ?auto_7723 ?auto_7725 ) ) ( not ( = ?auto_7721 ?auto_7729 ) ) ( not ( = ?auto_7721 ?auto_7737 ) ) ( not ( = ?auto_7721 ?auto_7730 ) ) ( not ( = ?auto_7721 ?auto_7726 ) ) ( not ( = ?auto_7721 ?auto_7733 ) ) ( not ( = ?auto_7721 ?auto_7731 ) ) ( not ( = ?auto_7721 ?auto_7734 ) ) ( not ( = ?auto_7721 ?auto_7740 ) ) ( not ( = ?auto_7721 ?auto_7738 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7707 ?auto_7708 ?auto_7709 ?auto_7710 ?auto_7711 ?auto_7712 ?auto_7713 ?auto_7714 ?auto_7715 ?auto_7716 )
      ( MAKE-1CRATE ?auto_7716 ?auto_7717 )
      ( MAKE-10CRATE-VERIFY ?auto_7707 ?auto_7708 ?auto_7709 ?auto_7710 ?auto_7711 ?auto_7712 ?auto_7713 ?auto_7714 ?auto_7715 ?auto_7716 ?auto_7717 ) )
  )

)

