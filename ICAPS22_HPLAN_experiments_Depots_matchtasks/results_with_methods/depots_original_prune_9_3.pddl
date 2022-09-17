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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225393 - SURFACE
      ?auto_225394 - SURFACE
    )
    :vars
    (
      ?auto_225395 - HOIST
      ?auto_225396 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225395 ?auto_225396 ) ( SURFACE-AT ?auto_225393 ?auto_225396 ) ( CLEAR ?auto_225393 ) ( LIFTING ?auto_225395 ?auto_225394 ) ( IS-CRATE ?auto_225394 ) ( not ( = ?auto_225393 ?auto_225394 ) ) )
    :subtasks
    ( ( !DROP ?auto_225395 ?auto_225394 ?auto_225393 ?auto_225396 )
      ( MAKE-1CRATE-VERIFY ?auto_225393 ?auto_225394 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225397 - SURFACE
      ?auto_225398 - SURFACE
    )
    :vars
    (
      ?auto_225399 - HOIST
      ?auto_225400 - PLACE
      ?auto_225401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225399 ?auto_225400 ) ( SURFACE-AT ?auto_225397 ?auto_225400 ) ( CLEAR ?auto_225397 ) ( IS-CRATE ?auto_225398 ) ( not ( = ?auto_225397 ?auto_225398 ) ) ( TRUCK-AT ?auto_225401 ?auto_225400 ) ( AVAILABLE ?auto_225399 ) ( IN ?auto_225398 ?auto_225401 ) )
    :subtasks
    ( ( !UNLOAD ?auto_225399 ?auto_225398 ?auto_225401 ?auto_225400 )
      ( MAKE-1CRATE ?auto_225397 ?auto_225398 )
      ( MAKE-1CRATE-VERIFY ?auto_225397 ?auto_225398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225402 - SURFACE
      ?auto_225403 - SURFACE
    )
    :vars
    (
      ?auto_225406 - HOIST
      ?auto_225404 - PLACE
      ?auto_225405 - TRUCK
      ?auto_225407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225406 ?auto_225404 ) ( SURFACE-AT ?auto_225402 ?auto_225404 ) ( CLEAR ?auto_225402 ) ( IS-CRATE ?auto_225403 ) ( not ( = ?auto_225402 ?auto_225403 ) ) ( AVAILABLE ?auto_225406 ) ( IN ?auto_225403 ?auto_225405 ) ( TRUCK-AT ?auto_225405 ?auto_225407 ) ( not ( = ?auto_225407 ?auto_225404 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_225405 ?auto_225407 ?auto_225404 )
      ( MAKE-1CRATE ?auto_225402 ?auto_225403 )
      ( MAKE-1CRATE-VERIFY ?auto_225402 ?auto_225403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225408 - SURFACE
      ?auto_225409 - SURFACE
    )
    :vars
    (
      ?auto_225413 - HOIST
      ?auto_225412 - PLACE
      ?auto_225411 - TRUCK
      ?auto_225410 - PLACE
      ?auto_225414 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225413 ?auto_225412 ) ( SURFACE-AT ?auto_225408 ?auto_225412 ) ( CLEAR ?auto_225408 ) ( IS-CRATE ?auto_225409 ) ( not ( = ?auto_225408 ?auto_225409 ) ) ( AVAILABLE ?auto_225413 ) ( TRUCK-AT ?auto_225411 ?auto_225410 ) ( not ( = ?auto_225410 ?auto_225412 ) ) ( HOIST-AT ?auto_225414 ?auto_225410 ) ( LIFTING ?auto_225414 ?auto_225409 ) ( not ( = ?auto_225413 ?auto_225414 ) ) )
    :subtasks
    ( ( !LOAD ?auto_225414 ?auto_225409 ?auto_225411 ?auto_225410 )
      ( MAKE-1CRATE ?auto_225408 ?auto_225409 )
      ( MAKE-1CRATE-VERIFY ?auto_225408 ?auto_225409 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225415 - SURFACE
      ?auto_225416 - SURFACE
    )
    :vars
    (
      ?auto_225418 - HOIST
      ?auto_225420 - PLACE
      ?auto_225421 - TRUCK
      ?auto_225419 - PLACE
      ?auto_225417 - HOIST
      ?auto_225422 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225418 ?auto_225420 ) ( SURFACE-AT ?auto_225415 ?auto_225420 ) ( CLEAR ?auto_225415 ) ( IS-CRATE ?auto_225416 ) ( not ( = ?auto_225415 ?auto_225416 ) ) ( AVAILABLE ?auto_225418 ) ( TRUCK-AT ?auto_225421 ?auto_225419 ) ( not ( = ?auto_225419 ?auto_225420 ) ) ( HOIST-AT ?auto_225417 ?auto_225419 ) ( not ( = ?auto_225418 ?auto_225417 ) ) ( AVAILABLE ?auto_225417 ) ( SURFACE-AT ?auto_225416 ?auto_225419 ) ( ON ?auto_225416 ?auto_225422 ) ( CLEAR ?auto_225416 ) ( not ( = ?auto_225415 ?auto_225422 ) ) ( not ( = ?auto_225416 ?auto_225422 ) ) )
    :subtasks
    ( ( !LIFT ?auto_225417 ?auto_225416 ?auto_225422 ?auto_225419 )
      ( MAKE-1CRATE ?auto_225415 ?auto_225416 )
      ( MAKE-1CRATE-VERIFY ?auto_225415 ?auto_225416 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225423 - SURFACE
      ?auto_225424 - SURFACE
    )
    :vars
    (
      ?auto_225429 - HOIST
      ?auto_225430 - PLACE
      ?auto_225427 - PLACE
      ?auto_225428 - HOIST
      ?auto_225425 - SURFACE
      ?auto_225426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225429 ?auto_225430 ) ( SURFACE-AT ?auto_225423 ?auto_225430 ) ( CLEAR ?auto_225423 ) ( IS-CRATE ?auto_225424 ) ( not ( = ?auto_225423 ?auto_225424 ) ) ( AVAILABLE ?auto_225429 ) ( not ( = ?auto_225427 ?auto_225430 ) ) ( HOIST-AT ?auto_225428 ?auto_225427 ) ( not ( = ?auto_225429 ?auto_225428 ) ) ( AVAILABLE ?auto_225428 ) ( SURFACE-AT ?auto_225424 ?auto_225427 ) ( ON ?auto_225424 ?auto_225425 ) ( CLEAR ?auto_225424 ) ( not ( = ?auto_225423 ?auto_225425 ) ) ( not ( = ?auto_225424 ?auto_225425 ) ) ( TRUCK-AT ?auto_225426 ?auto_225430 ) )
    :subtasks
    ( ( !DRIVE ?auto_225426 ?auto_225430 ?auto_225427 )
      ( MAKE-1CRATE ?auto_225423 ?auto_225424 )
      ( MAKE-1CRATE-VERIFY ?auto_225423 ?auto_225424 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225440 - SURFACE
      ?auto_225441 - SURFACE
      ?auto_225442 - SURFACE
    )
    :vars
    (
      ?auto_225443 - HOIST
      ?auto_225444 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225443 ?auto_225444 ) ( SURFACE-AT ?auto_225441 ?auto_225444 ) ( CLEAR ?auto_225441 ) ( LIFTING ?auto_225443 ?auto_225442 ) ( IS-CRATE ?auto_225442 ) ( not ( = ?auto_225441 ?auto_225442 ) ) ( ON ?auto_225441 ?auto_225440 ) ( not ( = ?auto_225440 ?auto_225441 ) ) ( not ( = ?auto_225440 ?auto_225442 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225441 ?auto_225442 )
      ( MAKE-2CRATE-VERIFY ?auto_225440 ?auto_225441 ?auto_225442 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225450 - SURFACE
      ?auto_225451 - SURFACE
      ?auto_225452 - SURFACE
    )
    :vars
    (
      ?auto_225455 - HOIST
      ?auto_225453 - PLACE
      ?auto_225454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225455 ?auto_225453 ) ( SURFACE-AT ?auto_225451 ?auto_225453 ) ( CLEAR ?auto_225451 ) ( IS-CRATE ?auto_225452 ) ( not ( = ?auto_225451 ?auto_225452 ) ) ( TRUCK-AT ?auto_225454 ?auto_225453 ) ( AVAILABLE ?auto_225455 ) ( IN ?auto_225452 ?auto_225454 ) ( ON ?auto_225451 ?auto_225450 ) ( not ( = ?auto_225450 ?auto_225451 ) ) ( not ( = ?auto_225450 ?auto_225452 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225451 ?auto_225452 )
      ( MAKE-2CRATE-VERIFY ?auto_225450 ?auto_225451 ?auto_225452 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225456 - SURFACE
      ?auto_225457 - SURFACE
    )
    :vars
    (
      ?auto_225460 - HOIST
      ?auto_225461 - PLACE
      ?auto_225459 - TRUCK
      ?auto_225458 - SURFACE
      ?auto_225462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225460 ?auto_225461 ) ( SURFACE-AT ?auto_225456 ?auto_225461 ) ( CLEAR ?auto_225456 ) ( IS-CRATE ?auto_225457 ) ( not ( = ?auto_225456 ?auto_225457 ) ) ( AVAILABLE ?auto_225460 ) ( IN ?auto_225457 ?auto_225459 ) ( ON ?auto_225456 ?auto_225458 ) ( not ( = ?auto_225458 ?auto_225456 ) ) ( not ( = ?auto_225458 ?auto_225457 ) ) ( TRUCK-AT ?auto_225459 ?auto_225462 ) ( not ( = ?auto_225462 ?auto_225461 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_225459 ?auto_225462 ?auto_225461 )
      ( MAKE-2CRATE ?auto_225458 ?auto_225456 ?auto_225457 )
      ( MAKE-1CRATE-VERIFY ?auto_225456 ?auto_225457 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225463 - SURFACE
      ?auto_225464 - SURFACE
      ?auto_225465 - SURFACE
    )
    :vars
    (
      ?auto_225467 - HOIST
      ?auto_225469 - PLACE
      ?auto_225468 - TRUCK
      ?auto_225466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225467 ?auto_225469 ) ( SURFACE-AT ?auto_225464 ?auto_225469 ) ( CLEAR ?auto_225464 ) ( IS-CRATE ?auto_225465 ) ( not ( = ?auto_225464 ?auto_225465 ) ) ( AVAILABLE ?auto_225467 ) ( IN ?auto_225465 ?auto_225468 ) ( ON ?auto_225464 ?auto_225463 ) ( not ( = ?auto_225463 ?auto_225464 ) ) ( not ( = ?auto_225463 ?auto_225465 ) ) ( TRUCK-AT ?auto_225468 ?auto_225466 ) ( not ( = ?auto_225466 ?auto_225469 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225464 ?auto_225465 )
      ( MAKE-2CRATE-VERIFY ?auto_225463 ?auto_225464 ?auto_225465 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225470 - SURFACE
      ?auto_225471 - SURFACE
    )
    :vars
    (
      ?auto_225473 - HOIST
      ?auto_225475 - PLACE
      ?auto_225474 - SURFACE
      ?auto_225476 - TRUCK
      ?auto_225472 - PLACE
      ?auto_225477 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225473 ?auto_225475 ) ( SURFACE-AT ?auto_225470 ?auto_225475 ) ( CLEAR ?auto_225470 ) ( IS-CRATE ?auto_225471 ) ( not ( = ?auto_225470 ?auto_225471 ) ) ( AVAILABLE ?auto_225473 ) ( ON ?auto_225470 ?auto_225474 ) ( not ( = ?auto_225474 ?auto_225470 ) ) ( not ( = ?auto_225474 ?auto_225471 ) ) ( TRUCK-AT ?auto_225476 ?auto_225472 ) ( not ( = ?auto_225472 ?auto_225475 ) ) ( HOIST-AT ?auto_225477 ?auto_225472 ) ( LIFTING ?auto_225477 ?auto_225471 ) ( not ( = ?auto_225473 ?auto_225477 ) ) )
    :subtasks
    ( ( !LOAD ?auto_225477 ?auto_225471 ?auto_225476 ?auto_225472 )
      ( MAKE-2CRATE ?auto_225474 ?auto_225470 ?auto_225471 )
      ( MAKE-1CRATE-VERIFY ?auto_225470 ?auto_225471 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225478 - SURFACE
      ?auto_225479 - SURFACE
      ?auto_225480 - SURFACE
    )
    :vars
    (
      ?auto_225481 - HOIST
      ?auto_225484 - PLACE
      ?auto_225482 - TRUCK
      ?auto_225483 - PLACE
      ?auto_225485 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225481 ?auto_225484 ) ( SURFACE-AT ?auto_225479 ?auto_225484 ) ( CLEAR ?auto_225479 ) ( IS-CRATE ?auto_225480 ) ( not ( = ?auto_225479 ?auto_225480 ) ) ( AVAILABLE ?auto_225481 ) ( ON ?auto_225479 ?auto_225478 ) ( not ( = ?auto_225478 ?auto_225479 ) ) ( not ( = ?auto_225478 ?auto_225480 ) ) ( TRUCK-AT ?auto_225482 ?auto_225483 ) ( not ( = ?auto_225483 ?auto_225484 ) ) ( HOIST-AT ?auto_225485 ?auto_225483 ) ( LIFTING ?auto_225485 ?auto_225480 ) ( not ( = ?auto_225481 ?auto_225485 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225479 ?auto_225480 )
      ( MAKE-2CRATE-VERIFY ?auto_225478 ?auto_225479 ?auto_225480 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225486 - SURFACE
      ?auto_225487 - SURFACE
    )
    :vars
    (
      ?auto_225489 - HOIST
      ?auto_225491 - PLACE
      ?auto_225488 - SURFACE
      ?auto_225490 - TRUCK
      ?auto_225492 - PLACE
      ?auto_225493 - HOIST
      ?auto_225494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225489 ?auto_225491 ) ( SURFACE-AT ?auto_225486 ?auto_225491 ) ( CLEAR ?auto_225486 ) ( IS-CRATE ?auto_225487 ) ( not ( = ?auto_225486 ?auto_225487 ) ) ( AVAILABLE ?auto_225489 ) ( ON ?auto_225486 ?auto_225488 ) ( not ( = ?auto_225488 ?auto_225486 ) ) ( not ( = ?auto_225488 ?auto_225487 ) ) ( TRUCK-AT ?auto_225490 ?auto_225492 ) ( not ( = ?auto_225492 ?auto_225491 ) ) ( HOIST-AT ?auto_225493 ?auto_225492 ) ( not ( = ?auto_225489 ?auto_225493 ) ) ( AVAILABLE ?auto_225493 ) ( SURFACE-AT ?auto_225487 ?auto_225492 ) ( ON ?auto_225487 ?auto_225494 ) ( CLEAR ?auto_225487 ) ( not ( = ?auto_225486 ?auto_225494 ) ) ( not ( = ?auto_225487 ?auto_225494 ) ) ( not ( = ?auto_225488 ?auto_225494 ) ) )
    :subtasks
    ( ( !LIFT ?auto_225493 ?auto_225487 ?auto_225494 ?auto_225492 )
      ( MAKE-2CRATE ?auto_225488 ?auto_225486 ?auto_225487 )
      ( MAKE-1CRATE-VERIFY ?auto_225486 ?auto_225487 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225495 - SURFACE
      ?auto_225496 - SURFACE
      ?auto_225497 - SURFACE
    )
    :vars
    (
      ?auto_225499 - HOIST
      ?auto_225503 - PLACE
      ?auto_225500 - TRUCK
      ?auto_225498 - PLACE
      ?auto_225502 - HOIST
      ?auto_225501 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225499 ?auto_225503 ) ( SURFACE-AT ?auto_225496 ?auto_225503 ) ( CLEAR ?auto_225496 ) ( IS-CRATE ?auto_225497 ) ( not ( = ?auto_225496 ?auto_225497 ) ) ( AVAILABLE ?auto_225499 ) ( ON ?auto_225496 ?auto_225495 ) ( not ( = ?auto_225495 ?auto_225496 ) ) ( not ( = ?auto_225495 ?auto_225497 ) ) ( TRUCK-AT ?auto_225500 ?auto_225498 ) ( not ( = ?auto_225498 ?auto_225503 ) ) ( HOIST-AT ?auto_225502 ?auto_225498 ) ( not ( = ?auto_225499 ?auto_225502 ) ) ( AVAILABLE ?auto_225502 ) ( SURFACE-AT ?auto_225497 ?auto_225498 ) ( ON ?auto_225497 ?auto_225501 ) ( CLEAR ?auto_225497 ) ( not ( = ?auto_225496 ?auto_225501 ) ) ( not ( = ?auto_225497 ?auto_225501 ) ) ( not ( = ?auto_225495 ?auto_225501 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225496 ?auto_225497 )
      ( MAKE-2CRATE-VERIFY ?auto_225495 ?auto_225496 ?auto_225497 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225504 - SURFACE
      ?auto_225505 - SURFACE
    )
    :vars
    (
      ?auto_225508 - HOIST
      ?auto_225507 - PLACE
      ?auto_225509 - SURFACE
      ?auto_225506 - PLACE
      ?auto_225510 - HOIST
      ?auto_225511 - SURFACE
      ?auto_225512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225508 ?auto_225507 ) ( SURFACE-AT ?auto_225504 ?auto_225507 ) ( CLEAR ?auto_225504 ) ( IS-CRATE ?auto_225505 ) ( not ( = ?auto_225504 ?auto_225505 ) ) ( AVAILABLE ?auto_225508 ) ( ON ?auto_225504 ?auto_225509 ) ( not ( = ?auto_225509 ?auto_225504 ) ) ( not ( = ?auto_225509 ?auto_225505 ) ) ( not ( = ?auto_225506 ?auto_225507 ) ) ( HOIST-AT ?auto_225510 ?auto_225506 ) ( not ( = ?auto_225508 ?auto_225510 ) ) ( AVAILABLE ?auto_225510 ) ( SURFACE-AT ?auto_225505 ?auto_225506 ) ( ON ?auto_225505 ?auto_225511 ) ( CLEAR ?auto_225505 ) ( not ( = ?auto_225504 ?auto_225511 ) ) ( not ( = ?auto_225505 ?auto_225511 ) ) ( not ( = ?auto_225509 ?auto_225511 ) ) ( TRUCK-AT ?auto_225512 ?auto_225507 ) )
    :subtasks
    ( ( !DRIVE ?auto_225512 ?auto_225507 ?auto_225506 )
      ( MAKE-2CRATE ?auto_225509 ?auto_225504 ?auto_225505 )
      ( MAKE-1CRATE-VERIFY ?auto_225504 ?auto_225505 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225513 - SURFACE
      ?auto_225514 - SURFACE
      ?auto_225515 - SURFACE
    )
    :vars
    (
      ?auto_225518 - HOIST
      ?auto_225519 - PLACE
      ?auto_225520 - PLACE
      ?auto_225516 - HOIST
      ?auto_225521 - SURFACE
      ?auto_225517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225518 ?auto_225519 ) ( SURFACE-AT ?auto_225514 ?auto_225519 ) ( CLEAR ?auto_225514 ) ( IS-CRATE ?auto_225515 ) ( not ( = ?auto_225514 ?auto_225515 ) ) ( AVAILABLE ?auto_225518 ) ( ON ?auto_225514 ?auto_225513 ) ( not ( = ?auto_225513 ?auto_225514 ) ) ( not ( = ?auto_225513 ?auto_225515 ) ) ( not ( = ?auto_225520 ?auto_225519 ) ) ( HOIST-AT ?auto_225516 ?auto_225520 ) ( not ( = ?auto_225518 ?auto_225516 ) ) ( AVAILABLE ?auto_225516 ) ( SURFACE-AT ?auto_225515 ?auto_225520 ) ( ON ?auto_225515 ?auto_225521 ) ( CLEAR ?auto_225515 ) ( not ( = ?auto_225514 ?auto_225521 ) ) ( not ( = ?auto_225515 ?auto_225521 ) ) ( not ( = ?auto_225513 ?auto_225521 ) ) ( TRUCK-AT ?auto_225517 ?auto_225519 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225514 ?auto_225515 )
      ( MAKE-2CRATE-VERIFY ?auto_225513 ?auto_225514 ?auto_225515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225522 - SURFACE
      ?auto_225523 - SURFACE
    )
    :vars
    (
      ?auto_225526 - HOIST
      ?auto_225530 - PLACE
      ?auto_225525 - SURFACE
      ?auto_225527 - PLACE
      ?auto_225529 - HOIST
      ?auto_225524 - SURFACE
      ?auto_225528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225526 ?auto_225530 ) ( IS-CRATE ?auto_225523 ) ( not ( = ?auto_225522 ?auto_225523 ) ) ( not ( = ?auto_225525 ?auto_225522 ) ) ( not ( = ?auto_225525 ?auto_225523 ) ) ( not ( = ?auto_225527 ?auto_225530 ) ) ( HOIST-AT ?auto_225529 ?auto_225527 ) ( not ( = ?auto_225526 ?auto_225529 ) ) ( AVAILABLE ?auto_225529 ) ( SURFACE-AT ?auto_225523 ?auto_225527 ) ( ON ?auto_225523 ?auto_225524 ) ( CLEAR ?auto_225523 ) ( not ( = ?auto_225522 ?auto_225524 ) ) ( not ( = ?auto_225523 ?auto_225524 ) ) ( not ( = ?auto_225525 ?auto_225524 ) ) ( TRUCK-AT ?auto_225528 ?auto_225530 ) ( SURFACE-AT ?auto_225525 ?auto_225530 ) ( CLEAR ?auto_225525 ) ( LIFTING ?auto_225526 ?auto_225522 ) ( IS-CRATE ?auto_225522 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225525 ?auto_225522 )
      ( MAKE-2CRATE ?auto_225525 ?auto_225522 ?auto_225523 )
      ( MAKE-1CRATE-VERIFY ?auto_225522 ?auto_225523 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225531 - SURFACE
      ?auto_225532 - SURFACE
      ?auto_225533 - SURFACE
    )
    :vars
    (
      ?auto_225539 - HOIST
      ?auto_225534 - PLACE
      ?auto_225538 - PLACE
      ?auto_225537 - HOIST
      ?auto_225535 - SURFACE
      ?auto_225536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225539 ?auto_225534 ) ( IS-CRATE ?auto_225533 ) ( not ( = ?auto_225532 ?auto_225533 ) ) ( not ( = ?auto_225531 ?auto_225532 ) ) ( not ( = ?auto_225531 ?auto_225533 ) ) ( not ( = ?auto_225538 ?auto_225534 ) ) ( HOIST-AT ?auto_225537 ?auto_225538 ) ( not ( = ?auto_225539 ?auto_225537 ) ) ( AVAILABLE ?auto_225537 ) ( SURFACE-AT ?auto_225533 ?auto_225538 ) ( ON ?auto_225533 ?auto_225535 ) ( CLEAR ?auto_225533 ) ( not ( = ?auto_225532 ?auto_225535 ) ) ( not ( = ?auto_225533 ?auto_225535 ) ) ( not ( = ?auto_225531 ?auto_225535 ) ) ( TRUCK-AT ?auto_225536 ?auto_225534 ) ( SURFACE-AT ?auto_225531 ?auto_225534 ) ( CLEAR ?auto_225531 ) ( LIFTING ?auto_225539 ?auto_225532 ) ( IS-CRATE ?auto_225532 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225532 ?auto_225533 )
      ( MAKE-2CRATE-VERIFY ?auto_225531 ?auto_225532 ?auto_225533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225540 - SURFACE
      ?auto_225541 - SURFACE
    )
    :vars
    (
      ?auto_225546 - HOIST
      ?auto_225545 - PLACE
      ?auto_225543 - SURFACE
      ?auto_225548 - PLACE
      ?auto_225544 - HOIST
      ?auto_225542 - SURFACE
      ?auto_225547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225546 ?auto_225545 ) ( IS-CRATE ?auto_225541 ) ( not ( = ?auto_225540 ?auto_225541 ) ) ( not ( = ?auto_225543 ?auto_225540 ) ) ( not ( = ?auto_225543 ?auto_225541 ) ) ( not ( = ?auto_225548 ?auto_225545 ) ) ( HOIST-AT ?auto_225544 ?auto_225548 ) ( not ( = ?auto_225546 ?auto_225544 ) ) ( AVAILABLE ?auto_225544 ) ( SURFACE-AT ?auto_225541 ?auto_225548 ) ( ON ?auto_225541 ?auto_225542 ) ( CLEAR ?auto_225541 ) ( not ( = ?auto_225540 ?auto_225542 ) ) ( not ( = ?auto_225541 ?auto_225542 ) ) ( not ( = ?auto_225543 ?auto_225542 ) ) ( TRUCK-AT ?auto_225547 ?auto_225545 ) ( SURFACE-AT ?auto_225543 ?auto_225545 ) ( CLEAR ?auto_225543 ) ( IS-CRATE ?auto_225540 ) ( AVAILABLE ?auto_225546 ) ( IN ?auto_225540 ?auto_225547 ) )
    :subtasks
    ( ( !UNLOAD ?auto_225546 ?auto_225540 ?auto_225547 ?auto_225545 )
      ( MAKE-2CRATE ?auto_225543 ?auto_225540 ?auto_225541 )
      ( MAKE-1CRATE-VERIFY ?auto_225540 ?auto_225541 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225549 - SURFACE
      ?auto_225550 - SURFACE
      ?auto_225551 - SURFACE
    )
    :vars
    (
      ?auto_225557 - HOIST
      ?auto_225556 - PLACE
      ?auto_225552 - PLACE
      ?auto_225553 - HOIST
      ?auto_225555 - SURFACE
      ?auto_225554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225557 ?auto_225556 ) ( IS-CRATE ?auto_225551 ) ( not ( = ?auto_225550 ?auto_225551 ) ) ( not ( = ?auto_225549 ?auto_225550 ) ) ( not ( = ?auto_225549 ?auto_225551 ) ) ( not ( = ?auto_225552 ?auto_225556 ) ) ( HOIST-AT ?auto_225553 ?auto_225552 ) ( not ( = ?auto_225557 ?auto_225553 ) ) ( AVAILABLE ?auto_225553 ) ( SURFACE-AT ?auto_225551 ?auto_225552 ) ( ON ?auto_225551 ?auto_225555 ) ( CLEAR ?auto_225551 ) ( not ( = ?auto_225550 ?auto_225555 ) ) ( not ( = ?auto_225551 ?auto_225555 ) ) ( not ( = ?auto_225549 ?auto_225555 ) ) ( TRUCK-AT ?auto_225554 ?auto_225556 ) ( SURFACE-AT ?auto_225549 ?auto_225556 ) ( CLEAR ?auto_225549 ) ( IS-CRATE ?auto_225550 ) ( AVAILABLE ?auto_225557 ) ( IN ?auto_225550 ?auto_225554 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225550 ?auto_225551 )
      ( MAKE-2CRATE-VERIFY ?auto_225549 ?auto_225550 ?auto_225551 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225558 - SURFACE
      ?auto_225559 - SURFACE
    )
    :vars
    (
      ?auto_225562 - HOIST
      ?auto_225560 - PLACE
      ?auto_225564 - SURFACE
      ?auto_225566 - PLACE
      ?auto_225565 - HOIST
      ?auto_225563 - SURFACE
      ?auto_225561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225562 ?auto_225560 ) ( IS-CRATE ?auto_225559 ) ( not ( = ?auto_225558 ?auto_225559 ) ) ( not ( = ?auto_225564 ?auto_225558 ) ) ( not ( = ?auto_225564 ?auto_225559 ) ) ( not ( = ?auto_225566 ?auto_225560 ) ) ( HOIST-AT ?auto_225565 ?auto_225566 ) ( not ( = ?auto_225562 ?auto_225565 ) ) ( AVAILABLE ?auto_225565 ) ( SURFACE-AT ?auto_225559 ?auto_225566 ) ( ON ?auto_225559 ?auto_225563 ) ( CLEAR ?auto_225559 ) ( not ( = ?auto_225558 ?auto_225563 ) ) ( not ( = ?auto_225559 ?auto_225563 ) ) ( not ( = ?auto_225564 ?auto_225563 ) ) ( SURFACE-AT ?auto_225564 ?auto_225560 ) ( CLEAR ?auto_225564 ) ( IS-CRATE ?auto_225558 ) ( AVAILABLE ?auto_225562 ) ( IN ?auto_225558 ?auto_225561 ) ( TRUCK-AT ?auto_225561 ?auto_225566 ) )
    :subtasks
    ( ( !DRIVE ?auto_225561 ?auto_225566 ?auto_225560 )
      ( MAKE-2CRATE ?auto_225564 ?auto_225558 ?auto_225559 )
      ( MAKE-1CRATE-VERIFY ?auto_225558 ?auto_225559 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225567 - SURFACE
      ?auto_225568 - SURFACE
      ?auto_225569 - SURFACE
    )
    :vars
    (
      ?auto_225571 - HOIST
      ?auto_225574 - PLACE
      ?auto_225572 - PLACE
      ?auto_225575 - HOIST
      ?auto_225570 - SURFACE
      ?auto_225573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225571 ?auto_225574 ) ( IS-CRATE ?auto_225569 ) ( not ( = ?auto_225568 ?auto_225569 ) ) ( not ( = ?auto_225567 ?auto_225568 ) ) ( not ( = ?auto_225567 ?auto_225569 ) ) ( not ( = ?auto_225572 ?auto_225574 ) ) ( HOIST-AT ?auto_225575 ?auto_225572 ) ( not ( = ?auto_225571 ?auto_225575 ) ) ( AVAILABLE ?auto_225575 ) ( SURFACE-AT ?auto_225569 ?auto_225572 ) ( ON ?auto_225569 ?auto_225570 ) ( CLEAR ?auto_225569 ) ( not ( = ?auto_225568 ?auto_225570 ) ) ( not ( = ?auto_225569 ?auto_225570 ) ) ( not ( = ?auto_225567 ?auto_225570 ) ) ( SURFACE-AT ?auto_225567 ?auto_225574 ) ( CLEAR ?auto_225567 ) ( IS-CRATE ?auto_225568 ) ( AVAILABLE ?auto_225571 ) ( IN ?auto_225568 ?auto_225573 ) ( TRUCK-AT ?auto_225573 ?auto_225572 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225568 ?auto_225569 )
      ( MAKE-2CRATE-VERIFY ?auto_225567 ?auto_225568 ?auto_225569 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225576 - SURFACE
      ?auto_225577 - SURFACE
    )
    :vars
    (
      ?auto_225582 - HOIST
      ?auto_225579 - PLACE
      ?auto_225578 - SURFACE
      ?auto_225584 - PLACE
      ?auto_225580 - HOIST
      ?auto_225583 - SURFACE
      ?auto_225581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225582 ?auto_225579 ) ( IS-CRATE ?auto_225577 ) ( not ( = ?auto_225576 ?auto_225577 ) ) ( not ( = ?auto_225578 ?auto_225576 ) ) ( not ( = ?auto_225578 ?auto_225577 ) ) ( not ( = ?auto_225584 ?auto_225579 ) ) ( HOIST-AT ?auto_225580 ?auto_225584 ) ( not ( = ?auto_225582 ?auto_225580 ) ) ( SURFACE-AT ?auto_225577 ?auto_225584 ) ( ON ?auto_225577 ?auto_225583 ) ( CLEAR ?auto_225577 ) ( not ( = ?auto_225576 ?auto_225583 ) ) ( not ( = ?auto_225577 ?auto_225583 ) ) ( not ( = ?auto_225578 ?auto_225583 ) ) ( SURFACE-AT ?auto_225578 ?auto_225579 ) ( CLEAR ?auto_225578 ) ( IS-CRATE ?auto_225576 ) ( AVAILABLE ?auto_225582 ) ( TRUCK-AT ?auto_225581 ?auto_225584 ) ( LIFTING ?auto_225580 ?auto_225576 ) )
    :subtasks
    ( ( !LOAD ?auto_225580 ?auto_225576 ?auto_225581 ?auto_225584 )
      ( MAKE-2CRATE ?auto_225578 ?auto_225576 ?auto_225577 )
      ( MAKE-1CRATE-VERIFY ?auto_225576 ?auto_225577 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225585 - SURFACE
      ?auto_225586 - SURFACE
      ?auto_225587 - SURFACE
    )
    :vars
    (
      ?auto_225589 - HOIST
      ?auto_225590 - PLACE
      ?auto_225593 - PLACE
      ?auto_225591 - HOIST
      ?auto_225588 - SURFACE
      ?auto_225592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225589 ?auto_225590 ) ( IS-CRATE ?auto_225587 ) ( not ( = ?auto_225586 ?auto_225587 ) ) ( not ( = ?auto_225585 ?auto_225586 ) ) ( not ( = ?auto_225585 ?auto_225587 ) ) ( not ( = ?auto_225593 ?auto_225590 ) ) ( HOIST-AT ?auto_225591 ?auto_225593 ) ( not ( = ?auto_225589 ?auto_225591 ) ) ( SURFACE-AT ?auto_225587 ?auto_225593 ) ( ON ?auto_225587 ?auto_225588 ) ( CLEAR ?auto_225587 ) ( not ( = ?auto_225586 ?auto_225588 ) ) ( not ( = ?auto_225587 ?auto_225588 ) ) ( not ( = ?auto_225585 ?auto_225588 ) ) ( SURFACE-AT ?auto_225585 ?auto_225590 ) ( CLEAR ?auto_225585 ) ( IS-CRATE ?auto_225586 ) ( AVAILABLE ?auto_225589 ) ( TRUCK-AT ?auto_225592 ?auto_225593 ) ( LIFTING ?auto_225591 ?auto_225586 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225586 ?auto_225587 )
      ( MAKE-2CRATE-VERIFY ?auto_225585 ?auto_225586 ?auto_225587 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225594 - SURFACE
      ?auto_225595 - SURFACE
    )
    :vars
    (
      ?auto_225601 - HOIST
      ?auto_225598 - PLACE
      ?auto_225602 - SURFACE
      ?auto_225597 - PLACE
      ?auto_225600 - HOIST
      ?auto_225599 - SURFACE
      ?auto_225596 - TRUCK
      ?auto_225603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225601 ?auto_225598 ) ( IS-CRATE ?auto_225595 ) ( not ( = ?auto_225594 ?auto_225595 ) ) ( not ( = ?auto_225602 ?auto_225594 ) ) ( not ( = ?auto_225602 ?auto_225595 ) ) ( not ( = ?auto_225597 ?auto_225598 ) ) ( HOIST-AT ?auto_225600 ?auto_225597 ) ( not ( = ?auto_225601 ?auto_225600 ) ) ( SURFACE-AT ?auto_225595 ?auto_225597 ) ( ON ?auto_225595 ?auto_225599 ) ( CLEAR ?auto_225595 ) ( not ( = ?auto_225594 ?auto_225599 ) ) ( not ( = ?auto_225595 ?auto_225599 ) ) ( not ( = ?auto_225602 ?auto_225599 ) ) ( SURFACE-AT ?auto_225602 ?auto_225598 ) ( CLEAR ?auto_225602 ) ( IS-CRATE ?auto_225594 ) ( AVAILABLE ?auto_225601 ) ( TRUCK-AT ?auto_225596 ?auto_225597 ) ( AVAILABLE ?auto_225600 ) ( SURFACE-AT ?auto_225594 ?auto_225597 ) ( ON ?auto_225594 ?auto_225603 ) ( CLEAR ?auto_225594 ) ( not ( = ?auto_225594 ?auto_225603 ) ) ( not ( = ?auto_225595 ?auto_225603 ) ) ( not ( = ?auto_225602 ?auto_225603 ) ) ( not ( = ?auto_225599 ?auto_225603 ) ) )
    :subtasks
    ( ( !LIFT ?auto_225600 ?auto_225594 ?auto_225603 ?auto_225597 )
      ( MAKE-2CRATE ?auto_225602 ?auto_225594 ?auto_225595 )
      ( MAKE-1CRATE-VERIFY ?auto_225594 ?auto_225595 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225604 - SURFACE
      ?auto_225605 - SURFACE
      ?auto_225606 - SURFACE
    )
    :vars
    (
      ?auto_225610 - HOIST
      ?auto_225611 - PLACE
      ?auto_225613 - PLACE
      ?auto_225612 - HOIST
      ?auto_225609 - SURFACE
      ?auto_225608 - TRUCK
      ?auto_225607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225610 ?auto_225611 ) ( IS-CRATE ?auto_225606 ) ( not ( = ?auto_225605 ?auto_225606 ) ) ( not ( = ?auto_225604 ?auto_225605 ) ) ( not ( = ?auto_225604 ?auto_225606 ) ) ( not ( = ?auto_225613 ?auto_225611 ) ) ( HOIST-AT ?auto_225612 ?auto_225613 ) ( not ( = ?auto_225610 ?auto_225612 ) ) ( SURFACE-AT ?auto_225606 ?auto_225613 ) ( ON ?auto_225606 ?auto_225609 ) ( CLEAR ?auto_225606 ) ( not ( = ?auto_225605 ?auto_225609 ) ) ( not ( = ?auto_225606 ?auto_225609 ) ) ( not ( = ?auto_225604 ?auto_225609 ) ) ( SURFACE-AT ?auto_225604 ?auto_225611 ) ( CLEAR ?auto_225604 ) ( IS-CRATE ?auto_225605 ) ( AVAILABLE ?auto_225610 ) ( TRUCK-AT ?auto_225608 ?auto_225613 ) ( AVAILABLE ?auto_225612 ) ( SURFACE-AT ?auto_225605 ?auto_225613 ) ( ON ?auto_225605 ?auto_225607 ) ( CLEAR ?auto_225605 ) ( not ( = ?auto_225605 ?auto_225607 ) ) ( not ( = ?auto_225606 ?auto_225607 ) ) ( not ( = ?auto_225604 ?auto_225607 ) ) ( not ( = ?auto_225609 ?auto_225607 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225605 ?auto_225606 )
      ( MAKE-2CRATE-VERIFY ?auto_225604 ?auto_225605 ?auto_225606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225614 - SURFACE
      ?auto_225615 - SURFACE
    )
    :vars
    (
      ?auto_225623 - HOIST
      ?auto_225621 - PLACE
      ?auto_225620 - SURFACE
      ?auto_225619 - PLACE
      ?auto_225617 - HOIST
      ?auto_225618 - SURFACE
      ?auto_225616 - SURFACE
      ?auto_225622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225623 ?auto_225621 ) ( IS-CRATE ?auto_225615 ) ( not ( = ?auto_225614 ?auto_225615 ) ) ( not ( = ?auto_225620 ?auto_225614 ) ) ( not ( = ?auto_225620 ?auto_225615 ) ) ( not ( = ?auto_225619 ?auto_225621 ) ) ( HOIST-AT ?auto_225617 ?auto_225619 ) ( not ( = ?auto_225623 ?auto_225617 ) ) ( SURFACE-AT ?auto_225615 ?auto_225619 ) ( ON ?auto_225615 ?auto_225618 ) ( CLEAR ?auto_225615 ) ( not ( = ?auto_225614 ?auto_225618 ) ) ( not ( = ?auto_225615 ?auto_225618 ) ) ( not ( = ?auto_225620 ?auto_225618 ) ) ( SURFACE-AT ?auto_225620 ?auto_225621 ) ( CLEAR ?auto_225620 ) ( IS-CRATE ?auto_225614 ) ( AVAILABLE ?auto_225623 ) ( AVAILABLE ?auto_225617 ) ( SURFACE-AT ?auto_225614 ?auto_225619 ) ( ON ?auto_225614 ?auto_225616 ) ( CLEAR ?auto_225614 ) ( not ( = ?auto_225614 ?auto_225616 ) ) ( not ( = ?auto_225615 ?auto_225616 ) ) ( not ( = ?auto_225620 ?auto_225616 ) ) ( not ( = ?auto_225618 ?auto_225616 ) ) ( TRUCK-AT ?auto_225622 ?auto_225621 ) )
    :subtasks
    ( ( !DRIVE ?auto_225622 ?auto_225621 ?auto_225619 )
      ( MAKE-2CRATE ?auto_225620 ?auto_225614 ?auto_225615 )
      ( MAKE-1CRATE-VERIFY ?auto_225614 ?auto_225615 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225624 - SURFACE
      ?auto_225625 - SURFACE
      ?auto_225626 - SURFACE
    )
    :vars
    (
      ?auto_225631 - HOIST
      ?auto_225633 - PLACE
      ?auto_225629 - PLACE
      ?auto_225632 - HOIST
      ?auto_225628 - SURFACE
      ?auto_225630 - SURFACE
      ?auto_225627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225631 ?auto_225633 ) ( IS-CRATE ?auto_225626 ) ( not ( = ?auto_225625 ?auto_225626 ) ) ( not ( = ?auto_225624 ?auto_225625 ) ) ( not ( = ?auto_225624 ?auto_225626 ) ) ( not ( = ?auto_225629 ?auto_225633 ) ) ( HOIST-AT ?auto_225632 ?auto_225629 ) ( not ( = ?auto_225631 ?auto_225632 ) ) ( SURFACE-AT ?auto_225626 ?auto_225629 ) ( ON ?auto_225626 ?auto_225628 ) ( CLEAR ?auto_225626 ) ( not ( = ?auto_225625 ?auto_225628 ) ) ( not ( = ?auto_225626 ?auto_225628 ) ) ( not ( = ?auto_225624 ?auto_225628 ) ) ( SURFACE-AT ?auto_225624 ?auto_225633 ) ( CLEAR ?auto_225624 ) ( IS-CRATE ?auto_225625 ) ( AVAILABLE ?auto_225631 ) ( AVAILABLE ?auto_225632 ) ( SURFACE-AT ?auto_225625 ?auto_225629 ) ( ON ?auto_225625 ?auto_225630 ) ( CLEAR ?auto_225625 ) ( not ( = ?auto_225625 ?auto_225630 ) ) ( not ( = ?auto_225626 ?auto_225630 ) ) ( not ( = ?auto_225624 ?auto_225630 ) ) ( not ( = ?auto_225628 ?auto_225630 ) ) ( TRUCK-AT ?auto_225627 ?auto_225633 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225625 ?auto_225626 )
      ( MAKE-2CRATE-VERIFY ?auto_225624 ?auto_225625 ?auto_225626 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225653 - SURFACE
      ?auto_225654 - SURFACE
      ?auto_225655 - SURFACE
      ?auto_225652 - SURFACE
    )
    :vars
    (
      ?auto_225656 - HOIST
      ?auto_225657 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225656 ?auto_225657 ) ( SURFACE-AT ?auto_225655 ?auto_225657 ) ( CLEAR ?auto_225655 ) ( LIFTING ?auto_225656 ?auto_225652 ) ( IS-CRATE ?auto_225652 ) ( not ( = ?auto_225655 ?auto_225652 ) ) ( ON ?auto_225654 ?auto_225653 ) ( ON ?auto_225655 ?auto_225654 ) ( not ( = ?auto_225653 ?auto_225654 ) ) ( not ( = ?auto_225653 ?auto_225655 ) ) ( not ( = ?auto_225653 ?auto_225652 ) ) ( not ( = ?auto_225654 ?auto_225655 ) ) ( not ( = ?auto_225654 ?auto_225652 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225655 ?auto_225652 )
      ( MAKE-3CRATE-VERIFY ?auto_225653 ?auto_225654 ?auto_225655 ?auto_225652 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225670 - SURFACE
      ?auto_225671 - SURFACE
      ?auto_225672 - SURFACE
      ?auto_225669 - SURFACE
    )
    :vars
    (
      ?auto_225674 - HOIST
      ?auto_225673 - PLACE
      ?auto_225675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225674 ?auto_225673 ) ( SURFACE-AT ?auto_225672 ?auto_225673 ) ( CLEAR ?auto_225672 ) ( IS-CRATE ?auto_225669 ) ( not ( = ?auto_225672 ?auto_225669 ) ) ( TRUCK-AT ?auto_225675 ?auto_225673 ) ( AVAILABLE ?auto_225674 ) ( IN ?auto_225669 ?auto_225675 ) ( ON ?auto_225672 ?auto_225671 ) ( not ( = ?auto_225671 ?auto_225672 ) ) ( not ( = ?auto_225671 ?auto_225669 ) ) ( ON ?auto_225671 ?auto_225670 ) ( not ( = ?auto_225670 ?auto_225671 ) ) ( not ( = ?auto_225670 ?auto_225672 ) ) ( not ( = ?auto_225670 ?auto_225669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225671 ?auto_225672 ?auto_225669 )
      ( MAKE-3CRATE-VERIFY ?auto_225670 ?auto_225671 ?auto_225672 ?auto_225669 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225691 - SURFACE
      ?auto_225692 - SURFACE
      ?auto_225693 - SURFACE
      ?auto_225690 - SURFACE
    )
    :vars
    (
      ?auto_225696 - HOIST
      ?auto_225694 - PLACE
      ?auto_225695 - TRUCK
      ?auto_225697 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225696 ?auto_225694 ) ( SURFACE-AT ?auto_225693 ?auto_225694 ) ( CLEAR ?auto_225693 ) ( IS-CRATE ?auto_225690 ) ( not ( = ?auto_225693 ?auto_225690 ) ) ( AVAILABLE ?auto_225696 ) ( IN ?auto_225690 ?auto_225695 ) ( ON ?auto_225693 ?auto_225692 ) ( not ( = ?auto_225692 ?auto_225693 ) ) ( not ( = ?auto_225692 ?auto_225690 ) ) ( TRUCK-AT ?auto_225695 ?auto_225697 ) ( not ( = ?auto_225697 ?auto_225694 ) ) ( ON ?auto_225692 ?auto_225691 ) ( not ( = ?auto_225691 ?auto_225692 ) ) ( not ( = ?auto_225691 ?auto_225693 ) ) ( not ( = ?auto_225691 ?auto_225690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225692 ?auto_225693 ?auto_225690 )
      ( MAKE-3CRATE-VERIFY ?auto_225691 ?auto_225692 ?auto_225693 ?auto_225690 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225715 - SURFACE
      ?auto_225716 - SURFACE
      ?auto_225717 - SURFACE
      ?auto_225714 - SURFACE
    )
    :vars
    (
      ?auto_225718 - HOIST
      ?auto_225722 - PLACE
      ?auto_225719 - TRUCK
      ?auto_225721 - PLACE
      ?auto_225720 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225718 ?auto_225722 ) ( SURFACE-AT ?auto_225717 ?auto_225722 ) ( CLEAR ?auto_225717 ) ( IS-CRATE ?auto_225714 ) ( not ( = ?auto_225717 ?auto_225714 ) ) ( AVAILABLE ?auto_225718 ) ( ON ?auto_225717 ?auto_225716 ) ( not ( = ?auto_225716 ?auto_225717 ) ) ( not ( = ?auto_225716 ?auto_225714 ) ) ( TRUCK-AT ?auto_225719 ?auto_225721 ) ( not ( = ?auto_225721 ?auto_225722 ) ) ( HOIST-AT ?auto_225720 ?auto_225721 ) ( LIFTING ?auto_225720 ?auto_225714 ) ( not ( = ?auto_225718 ?auto_225720 ) ) ( ON ?auto_225716 ?auto_225715 ) ( not ( = ?auto_225715 ?auto_225716 ) ) ( not ( = ?auto_225715 ?auto_225717 ) ) ( not ( = ?auto_225715 ?auto_225714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225716 ?auto_225717 ?auto_225714 )
      ( MAKE-3CRATE-VERIFY ?auto_225715 ?auto_225716 ?auto_225717 ?auto_225714 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225742 - SURFACE
      ?auto_225743 - SURFACE
      ?auto_225744 - SURFACE
      ?auto_225741 - SURFACE
    )
    :vars
    (
      ?auto_225747 - HOIST
      ?auto_225749 - PLACE
      ?auto_225746 - TRUCK
      ?auto_225745 - PLACE
      ?auto_225750 - HOIST
      ?auto_225748 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225747 ?auto_225749 ) ( SURFACE-AT ?auto_225744 ?auto_225749 ) ( CLEAR ?auto_225744 ) ( IS-CRATE ?auto_225741 ) ( not ( = ?auto_225744 ?auto_225741 ) ) ( AVAILABLE ?auto_225747 ) ( ON ?auto_225744 ?auto_225743 ) ( not ( = ?auto_225743 ?auto_225744 ) ) ( not ( = ?auto_225743 ?auto_225741 ) ) ( TRUCK-AT ?auto_225746 ?auto_225745 ) ( not ( = ?auto_225745 ?auto_225749 ) ) ( HOIST-AT ?auto_225750 ?auto_225745 ) ( not ( = ?auto_225747 ?auto_225750 ) ) ( AVAILABLE ?auto_225750 ) ( SURFACE-AT ?auto_225741 ?auto_225745 ) ( ON ?auto_225741 ?auto_225748 ) ( CLEAR ?auto_225741 ) ( not ( = ?auto_225744 ?auto_225748 ) ) ( not ( = ?auto_225741 ?auto_225748 ) ) ( not ( = ?auto_225743 ?auto_225748 ) ) ( ON ?auto_225743 ?auto_225742 ) ( not ( = ?auto_225742 ?auto_225743 ) ) ( not ( = ?auto_225742 ?auto_225744 ) ) ( not ( = ?auto_225742 ?auto_225741 ) ) ( not ( = ?auto_225742 ?auto_225748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225743 ?auto_225744 ?auto_225741 )
      ( MAKE-3CRATE-VERIFY ?auto_225742 ?auto_225743 ?auto_225744 ?auto_225741 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225770 - SURFACE
      ?auto_225771 - SURFACE
      ?auto_225772 - SURFACE
      ?auto_225769 - SURFACE
    )
    :vars
    (
      ?auto_225774 - HOIST
      ?auto_225778 - PLACE
      ?auto_225777 - PLACE
      ?auto_225776 - HOIST
      ?auto_225775 - SURFACE
      ?auto_225773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225774 ?auto_225778 ) ( SURFACE-AT ?auto_225772 ?auto_225778 ) ( CLEAR ?auto_225772 ) ( IS-CRATE ?auto_225769 ) ( not ( = ?auto_225772 ?auto_225769 ) ) ( AVAILABLE ?auto_225774 ) ( ON ?auto_225772 ?auto_225771 ) ( not ( = ?auto_225771 ?auto_225772 ) ) ( not ( = ?auto_225771 ?auto_225769 ) ) ( not ( = ?auto_225777 ?auto_225778 ) ) ( HOIST-AT ?auto_225776 ?auto_225777 ) ( not ( = ?auto_225774 ?auto_225776 ) ) ( AVAILABLE ?auto_225776 ) ( SURFACE-AT ?auto_225769 ?auto_225777 ) ( ON ?auto_225769 ?auto_225775 ) ( CLEAR ?auto_225769 ) ( not ( = ?auto_225772 ?auto_225775 ) ) ( not ( = ?auto_225769 ?auto_225775 ) ) ( not ( = ?auto_225771 ?auto_225775 ) ) ( TRUCK-AT ?auto_225773 ?auto_225778 ) ( ON ?auto_225771 ?auto_225770 ) ( not ( = ?auto_225770 ?auto_225771 ) ) ( not ( = ?auto_225770 ?auto_225772 ) ) ( not ( = ?auto_225770 ?auto_225769 ) ) ( not ( = ?auto_225770 ?auto_225775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225771 ?auto_225772 ?auto_225769 )
      ( MAKE-3CRATE-VERIFY ?auto_225770 ?auto_225771 ?auto_225772 ?auto_225769 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225798 - SURFACE
      ?auto_225799 - SURFACE
      ?auto_225800 - SURFACE
      ?auto_225797 - SURFACE
    )
    :vars
    (
      ?auto_225802 - HOIST
      ?auto_225806 - PLACE
      ?auto_225803 - PLACE
      ?auto_225804 - HOIST
      ?auto_225805 - SURFACE
      ?auto_225801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225802 ?auto_225806 ) ( IS-CRATE ?auto_225797 ) ( not ( = ?auto_225800 ?auto_225797 ) ) ( not ( = ?auto_225799 ?auto_225800 ) ) ( not ( = ?auto_225799 ?auto_225797 ) ) ( not ( = ?auto_225803 ?auto_225806 ) ) ( HOIST-AT ?auto_225804 ?auto_225803 ) ( not ( = ?auto_225802 ?auto_225804 ) ) ( AVAILABLE ?auto_225804 ) ( SURFACE-AT ?auto_225797 ?auto_225803 ) ( ON ?auto_225797 ?auto_225805 ) ( CLEAR ?auto_225797 ) ( not ( = ?auto_225800 ?auto_225805 ) ) ( not ( = ?auto_225797 ?auto_225805 ) ) ( not ( = ?auto_225799 ?auto_225805 ) ) ( TRUCK-AT ?auto_225801 ?auto_225806 ) ( SURFACE-AT ?auto_225799 ?auto_225806 ) ( CLEAR ?auto_225799 ) ( LIFTING ?auto_225802 ?auto_225800 ) ( IS-CRATE ?auto_225800 ) ( ON ?auto_225799 ?auto_225798 ) ( not ( = ?auto_225798 ?auto_225799 ) ) ( not ( = ?auto_225798 ?auto_225800 ) ) ( not ( = ?auto_225798 ?auto_225797 ) ) ( not ( = ?auto_225798 ?auto_225805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225799 ?auto_225800 ?auto_225797 )
      ( MAKE-3CRATE-VERIFY ?auto_225798 ?auto_225799 ?auto_225800 ?auto_225797 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225826 - SURFACE
      ?auto_225827 - SURFACE
      ?auto_225828 - SURFACE
      ?auto_225825 - SURFACE
    )
    :vars
    (
      ?auto_225833 - HOIST
      ?auto_225830 - PLACE
      ?auto_225834 - PLACE
      ?auto_225832 - HOIST
      ?auto_225829 - SURFACE
      ?auto_225831 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225833 ?auto_225830 ) ( IS-CRATE ?auto_225825 ) ( not ( = ?auto_225828 ?auto_225825 ) ) ( not ( = ?auto_225827 ?auto_225828 ) ) ( not ( = ?auto_225827 ?auto_225825 ) ) ( not ( = ?auto_225834 ?auto_225830 ) ) ( HOIST-AT ?auto_225832 ?auto_225834 ) ( not ( = ?auto_225833 ?auto_225832 ) ) ( AVAILABLE ?auto_225832 ) ( SURFACE-AT ?auto_225825 ?auto_225834 ) ( ON ?auto_225825 ?auto_225829 ) ( CLEAR ?auto_225825 ) ( not ( = ?auto_225828 ?auto_225829 ) ) ( not ( = ?auto_225825 ?auto_225829 ) ) ( not ( = ?auto_225827 ?auto_225829 ) ) ( TRUCK-AT ?auto_225831 ?auto_225830 ) ( SURFACE-AT ?auto_225827 ?auto_225830 ) ( CLEAR ?auto_225827 ) ( IS-CRATE ?auto_225828 ) ( AVAILABLE ?auto_225833 ) ( IN ?auto_225828 ?auto_225831 ) ( ON ?auto_225827 ?auto_225826 ) ( not ( = ?auto_225826 ?auto_225827 ) ) ( not ( = ?auto_225826 ?auto_225828 ) ) ( not ( = ?auto_225826 ?auto_225825 ) ) ( not ( = ?auto_225826 ?auto_225829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225827 ?auto_225828 ?auto_225825 )
      ( MAKE-3CRATE-VERIFY ?auto_225826 ?auto_225827 ?auto_225828 ?auto_225825 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225854 - SURFACE
      ?auto_225855 - SURFACE
      ?auto_225856 - SURFACE
      ?auto_225853 - SURFACE
    )
    :vars
    (
      ?auto_225862 - HOIST
      ?auto_225859 - PLACE
      ?auto_225860 - PLACE
      ?auto_225858 - HOIST
      ?auto_225861 - SURFACE
      ?auto_225857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225862 ?auto_225859 ) ( IS-CRATE ?auto_225853 ) ( not ( = ?auto_225856 ?auto_225853 ) ) ( not ( = ?auto_225855 ?auto_225856 ) ) ( not ( = ?auto_225855 ?auto_225853 ) ) ( not ( = ?auto_225860 ?auto_225859 ) ) ( HOIST-AT ?auto_225858 ?auto_225860 ) ( not ( = ?auto_225862 ?auto_225858 ) ) ( AVAILABLE ?auto_225858 ) ( SURFACE-AT ?auto_225853 ?auto_225860 ) ( ON ?auto_225853 ?auto_225861 ) ( CLEAR ?auto_225853 ) ( not ( = ?auto_225856 ?auto_225861 ) ) ( not ( = ?auto_225853 ?auto_225861 ) ) ( not ( = ?auto_225855 ?auto_225861 ) ) ( SURFACE-AT ?auto_225855 ?auto_225859 ) ( CLEAR ?auto_225855 ) ( IS-CRATE ?auto_225856 ) ( AVAILABLE ?auto_225862 ) ( IN ?auto_225856 ?auto_225857 ) ( TRUCK-AT ?auto_225857 ?auto_225860 ) ( ON ?auto_225855 ?auto_225854 ) ( not ( = ?auto_225854 ?auto_225855 ) ) ( not ( = ?auto_225854 ?auto_225856 ) ) ( not ( = ?auto_225854 ?auto_225853 ) ) ( not ( = ?auto_225854 ?auto_225861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225855 ?auto_225856 ?auto_225853 )
      ( MAKE-3CRATE-VERIFY ?auto_225854 ?auto_225855 ?auto_225856 ?auto_225853 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225882 - SURFACE
      ?auto_225883 - SURFACE
      ?auto_225884 - SURFACE
      ?auto_225881 - SURFACE
    )
    :vars
    (
      ?auto_225886 - HOIST
      ?auto_225890 - PLACE
      ?auto_225888 - PLACE
      ?auto_225889 - HOIST
      ?auto_225885 - SURFACE
      ?auto_225887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225886 ?auto_225890 ) ( IS-CRATE ?auto_225881 ) ( not ( = ?auto_225884 ?auto_225881 ) ) ( not ( = ?auto_225883 ?auto_225884 ) ) ( not ( = ?auto_225883 ?auto_225881 ) ) ( not ( = ?auto_225888 ?auto_225890 ) ) ( HOIST-AT ?auto_225889 ?auto_225888 ) ( not ( = ?auto_225886 ?auto_225889 ) ) ( SURFACE-AT ?auto_225881 ?auto_225888 ) ( ON ?auto_225881 ?auto_225885 ) ( CLEAR ?auto_225881 ) ( not ( = ?auto_225884 ?auto_225885 ) ) ( not ( = ?auto_225881 ?auto_225885 ) ) ( not ( = ?auto_225883 ?auto_225885 ) ) ( SURFACE-AT ?auto_225883 ?auto_225890 ) ( CLEAR ?auto_225883 ) ( IS-CRATE ?auto_225884 ) ( AVAILABLE ?auto_225886 ) ( TRUCK-AT ?auto_225887 ?auto_225888 ) ( LIFTING ?auto_225889 ?auto_225884 ) ( ON ?auto_225883 ?auto_225882 ) ( not ( = ?auto_225882 ?auto_225883 ) ) ( not ( = ?auto_225882 ?auto_225884 ) ) ( not ( = ?auto_225882 ?auto_225881 ) ) ( not ( = ?auto_225882 ?auto_225885 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225883 ?auto_225884 ?auto_225881 )
      ( MAKE-3CRATE-VERIFY ?auto_225882 ?auto_225883 ?auto_225884 ?auto_225881 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225912 - SURFACE
      ?auto_225913 - SURFACE
      ?auto_225914 - SURFACE
      ?auto_225911 - SURFACE
    )
    :vars
    (
      ?auto_225921 - HOIST
      ?auto_225920 - PLACE
      ?auto_225917 - PLACE
      ?auto_225918 - HOIST
      ?auto_225919 - SURFACE
      ?auto_225915 - TRUCK
      ?auto_225916 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225921 ?auto_225920 ) ( IS-CRATE ?auto_225911 ) ( not ( = ?auto_225914 ?auto_225911 ) ) ( not ( = ?auto_225913 ?auto_225914 ) ) ( not ( = ?auto_225913 ?auto_225911 ) ) ( not ( = ?auto_225917 ?auto_225920 ) ) ( HOIST-AT ?auto_225918 ?auto_225917 ) ( not ( = ?auto_225921 ?auto_225918 ) ) ( SURFACE-AT ?auto_225911 ?auto_225917 ) ( ON ?auto_225911 ?auto_225919 ) ( CLEAR ?auto_225911 ) ( not ( = ?auto_225914 ?auto_225919 ) ) ( not ( = ?auto_225911 ?auto_225919 ) ) ( not ( = ?auto_225913 ?auto_225919 ) ) ( SURFACE-AT ?auto_225913 ?auto_225920 ) ( CLEAR ?auto_225913 ) ( IS-CRATE ?auto_225914 ) ( AVAILABLE ?auto_225921 ) ( TRUCK-AT ?auto_225915 ?auto_225917 ) ( AVAILABLE ?auto_225918 ) ( SURFACE-AT ?auto_225914 ?auto_225917 ) ( ON ?auto_225914 ?auto_225916 ) ( CLEAR ?auto_225914 ) ( not ( = ?auto_225914 ?auto_225916 ) ) ( not ( = ?auto_225911 ?auto_225916 ) ) ( not ( = ?auto_225913 ?auto_225916 ) ) ( not ( = ?auto_225919 ?auto_225916 ) ) ( ON ?auto_225913 ?auto_225912 ) ( not ( = ?auto_225912 ?auto_225913 ) ) ( not ( = ?auto_225912 ?auto_225914 ) ) ( not ( = ?auto_225912 ?auto_225911 ) ) ( not ( = ?auto_225912 ?auto_225919 ) ) ( not ( = ?auto_225912 ?auto_225916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225913 ?auto_225914 ?auto_225911 )
      ( MAKE-3CRATE-VERIFY ?auto_225912 ?auto_225913 ?auto_225914 ?auto_225911 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225943 - SURFACE
      ?auto_225944 - SURFACE
      ?auto_225945 - SURFACE
      ?auto_225942 - SURFACE
    )
    :vars
    (
      ?auto_225950 - HOIST
      ?auto_225952 - PLACE
      ?auto_225951 - PLACE
      ?auto_225949 - HOIST
      ?auto_225946 - SURFACE
      ?auto_225947 - SURFACE
      ?auto_225948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225950 ?auto_225952 ) ( IS-CRATE ?auto_225942 ) ( not ( = ?auto_225945 ?auto_225942 ) ) ( not ( = ?auto_225944 ?auto_225945 ) ) ( not ( = ?auto_225944 ?auto_225942 ) ) ( not ( = ?auto_225951 ?auto_225952 ) ) ( HOIST-AT ?auto_225949 ?auto_225951 ) ( not ( = ?auto_225950 ?auto_225949 ) ) ( SURFACE-AT ?auto_225942 ?auto_225951 ) ( ON ?auto_225942 ?auto_225946 ) ( CLEAR ?auto_225942 ) ( not ( = ?auto_225945 ?auto_225946 ) ) ( not ( = ?auto_225942 ?auto_225946 ) ) ( not ( = ?auto_225944 ?auto_225946 ) ) ( SURFACE-AT ?auto_225944 ?auto_225952 ) ( CLEAR ?auto_225944 ) ( IS-CRATE ?auto_225945 ) ( AVAILABLE ?auto_225950 ) ( AVAILABLE ?auto_225949 ) ( SURFACE-AT ?auto_225945 ?auto_225951 ) ( ON ?auto_225945 ?auto_225947 ) ( CLEAR ?auto_225945 ) ( not ( = ?auto_225945 ?auto_225947 ) ) ( not ( = ?auto_225942 ?auto_225947 ) ) ( not ( = ?auto_225944 ?auto_225947 ) ) ( not ( = ?auto_225946 ?auto_225947 ) ) ( TRUCK-AT ?auto_225948 ?auto_225952 ) ( ON ?auto_225944 ?auto_225943 ) ( not ( = ?auto_225943 ?auto_225944 ) ) ( not ( = ?auto_225943 ?auto_225945 ) ) ( not ( = ?auto_225943 ?auto_225942 ) ) ( not ( = ?auto_225943 ?auto_225946 ) ) ( not ( = ?auto_225943 ?auto_225947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225944 ?auto_225945 ?auto_225942 )
      ( MAKE-3CRATE-VERIFY ?auto_225943 ?auto_225944 ?auto_225945 ?auto_225942 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225953 - SURFACE
      ?auto_225954 - SURFACE
    )
    :vars
    (
      ?auto_225960 - HOIST
      ?auto_225962 - PLACE
      ?auto_225958 - SURFACE
      ?auto_225961 - PLACE
      ?auto_225959 - HOIST
      ?auto_225955 - SURFACE
      ?auto_225956 - SURFACE
      ?auto_225957 - TRUCK
      ?auto_225963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225960 ?auto_225962 ) ( IS-CRATE ?auto_225954 ) ( not ( = ?auto_225953 ?auto_225954 ) ) ( not ( = ?auto_225958 ?auto_225953 ) ) ( not ( = ?auto_225958 ?auto_225954 ) ) ( not ( = ?auto_225961 ?auto_225962 ) ) ( HOIST-AT ?auto_225959 ?auto_225961 ) ( not ( = ?auto_225960 ?auto_225959 ) ) ( SURFACE-AT ?auto_225954 ?auto_225961 ) ( ON ?auto_225954 ?auto_225955 ) ( CLEAR ?auto_225954 ) ( not ( = ?auto_225953 ?auto_225955 ) ) ( not ( = ?auto_225954 ?auto_225955 ) ) ( not ( = ?auto_225958 ?auto_225955 ) ) ( IS-CRATE ?auto_225953 ) ( AVAILABLE ?auto_225959 ) ( SURFACE-AT ?auto_225953 ?auto_225961 ) ( ON ?auto_225953 ?auto_225956 ) ( CLEAR ?auto_225953 ) ( not ( = ?auto_225953 ?auto_225956 ) ) ( not ( = ?auto_225954 ?auto_225956 ) ) ( not ( = ?auto_225958 ?auto_225956 ) ) ( not ( = ?auto_225955 ?auto_225956 ) ) ( TRUCK-AT ?auto_225957 ?auto_225962 ) ( SURFACE-AT ?auto_225963 ?auto_225962 ) ( CLEAR ?auto_225963 ) ( LIFTING ?auto_225960 ?auto_225958 ) ( IS-CRATE ?auto_225958 ) ( not ( = ?auto_225963 ?auto_225958 ) ) ( not ( = ?auto_225953 ?auto_225963 ) ) ( not ( = ?auto_225954 ?auto_225963 ) ) ( not ( = ?auto_225955 ?auto_225963 ) ) ( not ( = ?auto_225956 ?auto_225963 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225963 ?auto_225958 )
      ( MAKE-2CRATE ?auto_225958 ?auto_225953 ?auto_225954 )
      ( MAKE-1CRATE-VERIFY ?auto_225953 ?auto_225954 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225964 - SURFACE
      ?auto_225965 - SURFACE
      ?auto_225966 - SURFACE
    )
    :vars
    (
      ?auto_225968 - HOIST
      ?auto_225970 - PLACE
      ?auto_225969 - PLACE
      ?auto_225973 - HOIST
      ?auto_225971 - SURFACE
      ?auto_225974 - SURFACE
      ?auto_225972 - TRUCK
      ?auto_225967 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225968 ?auto_225970 ) ( IS-CRATE ?auto_225966 ) ( not ( = ?auto_225965 ?auto_225966 ) ) ( not ( = ?auto_225964 ?auto_225965 ) ) ( not ( = ?auto_225964 ?auto_225966 ) ) ( not ( = ?auto_225969 ?auto_225970 ) ) ( HOIST-AT ?auto_225973 ?auto_225969 ) ( not ( = ?auto_225968 ?auto_225973 ) ) ( SURFACE-AT ?auto_225966 ?auto_225969 ) ( ON ?auto_225966 ?auto_225971 ) ( CLEAR ?auto_225966 ) ( not ( = ?auto_225965 ?auto_225971 ) ) ( not ( = ?auto_225966 ?auto_225971 ) ) ( not ( = ?auto_225964 ?auto_225971 ) ) ( IS-CRATE ?auto_225965 ) ( AVAILABLE ?auto_225973 ) ( SURFACE-AT ?auto_225965 ?auto_225969 ) ( ON ?auto_225965 ?auto_225974 ) ( CLEAR ?auto_225965 ) ( not ( = ?auto_225965 ?auto_225974 ) ) ( not ( = ?auto_225966 ?auto_225974 ) ) ( not ( = ?auto_225964 ?auto_225974 ) ) ( not ( = ?auto_225971 ?auto_225974 ) ) ( TRUCK-AT ?auto_225972 ?auto_225970 ) ( SURFACE-AT ?auto_225967 ?auto_225970 ) ( CLEAR ?auto_225967 ) ( LIFTING ?auto_225968 ?auto_225964 ) ( IS-CRATE ?auto_225964 ) ( not ( = ?auto_225967 ?auto_225964 ) ) ( not ( = ?auto_225965 ?auto_225967 ) ) ( not ( = ?auto_225966 ?auto_225967 ) ) ( not ( = ?auto_225971 ?auto_225967 ) ) ( not ( = ?auto_225974 ?auto_225967 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225965 ?auto_225966 )
      ( MAKE-2CRATE-VERIFY ?auto_225964 ?auto_225965 ?auto_225966 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225976 - SURFACE
      ?auto_225977 - SURFACE
      ?auto_225978 - SURFACE
      ?auto_225975 - SURFACE
    )
    :vars
    (
      ?auto_225985 - HOIST
      ?auto_225981 - PLACE
      ?auto_225984 - PLACE
      ?auto_225980 - HOIST
      ?auto_225982 - SURFACE
      ?auto_225983 - SURFACE
      ?auto_225979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225985 ?auto_225981 ) ( IS-CRATE ?auto_225975 ) ( not ( = ?auto_225978 ?auto_225975 ) ) ( not ( = ?auto_225977 ?auto_225978 ) ) ( not ( = ?auto_225977 ?auto_225975 ) ) ( not ( = ?auto_225984 ?auto_225981 ) ) ( HOIST-AT ?auto_225980 ?auto_225984 ) ( not ( = ?auto_225985 ?auto_225980 ) ) ( SURFACE-AT ?auto_225975 ?auto_225984 ) ( ON ?auto_225975 ?auto_225982 ) ( CLEAR ?auto_225975 ) ( not ( = ?auto_225978 ?auto_225982 ) ) ( not ( = ?auto_225975 ?auto_225982 ) ) ( not ( = ?auto_225977 ?auto_225982 ) ) ( IS-CRATE ?auto_225978 ) ( AVAILABLE ?auto_225980 ) ( SURFACE-AT ?auto_225978 ?auto_225984 ) ( ON ?auto_225978 ?auto_225983 ) ( CLEAR ?auto_225978 ) ( not ( = ?auto_225978 ?auto_225983 ) ) ( not ( = ?auto_225975 ?auto_225983 ) ) ( not ( = ?auto_225977 ?auto_225983 ) ) ( not ( = ?auto_225982 ?auto_225983 ) ) ( TRUCK-AT ?auto_225979 ?auto_225981 ) ( SURFACE-AT ?auto_225976 ?auto_225981 ) ( CLEAR ?auto_225976 ) ( LIFTING ?auto_225985 ?auto_225977 ) ( IS-CRATE ?auto_225977 ) ( not ( = ?auto_225976 ?auto_225977 ) ) ( not ( = ?auto_225978 ?auto_225976 ) ) ( not ( = ?auto_225975 ?auto_225976 ) ) ( not ( = ?auto_225982 ?auto_225976 ) ) ( not ( = ?auto_225983 ?auto_225976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225977 ?auto_225978 ?auto_225975 )
      ( MAKE-3CRATE-VERIFY ?auto_225976 ?auto_225977 ?auto_225978 ?auto_225975 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226035 - SURFACE
      ?auto_226036 - SURFACE
    )
    :vars
    (
      ?auto_226040 - HOIST
      ?auto_226044 - PLACE
      ?auto_226039 - SURFACE
      ?auto_226037 - PLACE
      ?auto_226041 - HOIST
      ?auto_226043 - SURFACE
      ?auto_226038 - TRUCK
      ?auto_226042 - SURFACE
      ?auto_226045 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226040 ?auto_226044 ) ( IS-CRATE ?auto_226036 ) ( not ( = ?auto_226035 ?auto_226036 ) ) ( not ( = ?auto_226039 ?auto_226035 ) ) ( not ( = ?auto_226039 ?auto_226036 ) ) ( not ( = ?auto_226037 ?auto_226044 ) ) ( HOIST-AT ?auto_226041 ?auto_226037 ) ( not ( = ?auto_226040 ?auto_226041 ) ) ( SURFACE-AT ?auto_226036 ?auto_226037 ) ( ON ?auto_226036 ?auto_226043 ) ( CLEAR ?auto_226036 ) ( not ( = ?auto_226035 ?auto_226043 ) ) ( not ( = ?auto_226036 ?auto_226043 ) ) ( not ( = ?auto_226039 ?auto_226043 ) ) ( SURFACE-AT ?auto_226039 ?auto_226044 ) ( CLEAR ?auto_226039 ) ( IS-CRATE ?auto_226035 ) ( AVAILABLE ?auto_226040 ) ( TRUCK-AT ?auto_226038 ?auto_226037 ) ( SURFACE-AT ?auto_226035 ?auto_226037 ) ( ON ?auto_226035 ?auto_226042 ) ( CLEAR ?auto_226035 ) ( not ( = ?auto_226035 ?auto_226042 ) ) ( not ( = ?auto_226036 ?auto_226042 ) ) ( not ( = ?auto_226039 ?auto_226042 ) ) ( not ( = ?auto_226043 ?auto_226042 ) ) ( LIFTING ?auto_226041 ?auto_226045 ) ( IS-CRATE ?auto_226045 ) ( not ( = ?auto_226035 ?auto_226045 ) ) ( not ( = ?auto_226036 ?auto_226045 ) ) ( not ( = ?auto_226039 ?auto_226045 ) ) ( not ( = ?auto_226043 ?auto_226045 ) ) ( not ( = ?auto_226042 ?auto_226045 ) ) )
    :subtasks
    ( ( !LOAD ?auto_226041 ?auto_226045 ?auto_226038 ?auto_226037 )
      ( MAKE-1CRATE ?auto_226035 ?auto_226036 )
      ( MAKE-1CRATE-VERIFY ?auto_226035 ?auto_226036 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226148 - SURFACE
      ?auto_226149 - SURFACE
      ?auto_226150 - SURFACE
      ?auto_226147 - SURFACE
      ?auto_226151 - SURFACE
    )
    :vars
    (
      ?auto_226153 - HOIST
      ?auto_226152 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226153 ?auto_226152 ) ( SURFACE-AT ?auto_226147 ?auto_226152 ) ( CLEAR ?auto_226147 ) ( LIFTING ?auto_226153 ?auto_226151 ) ( IS-CRATE ?auto_226151 ) ( not ( = ?auto_226147 ?auto_226151 ) ) ( ON ?auto_226149 ?auto_226148 ) ( ON ?auto_226150 ?auto_226149 ) ( ON ?auto_226147 ?auto_226150 ) ( not ( = ?auto_226148 ?auto_226149 ) ) ( not ( = ?auto_226148 ?auto_226150 ) ) ( not ( = ?auto_226148 ?auto_226147 ) ) ( not ( = ?auto_226148 ?auto_226151 ) ) ( not ( = ?auto_226149 ?auto_226150 ) ) ( not ( = ?auto_226149 ?auto_226147 ) ) ( not ( = ?auto_226149 ?auto_226151 ) ) ( not ( = ?auto_226150 ?auto_226147 ) ) ( not ( = ?auto_226150 ?auto_226151 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_226147 ?auto_226151 )
      ( MAKE-4CRATE-VERIFY ?auto_226148 ?auto_226149 ?auto_226150 ?auto_226147 ?auto_226151 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226173 - SURFACE
      ?auto_226174 - SURFACE
      ?auto_226175 - SURFACE
      ?auto_226172 - SURFACE
      ?auto_226176 - SURFACE
    )
    :vars
    (
      ?auto_226177 - HOIST
      ?auto_226179 - PLACE
      ?auto_226178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226177 ?auto_226179 ) ( SURFACE-AT ?auto_226172 ?auto_226179 ) ( CLEAR ?auto_226172 ) ( IS-CRATE ?auto_226176 ) ( not ( = ?auto_226172 ?auto_226176 ) ) ( TRUCK-AT ?auto_226178 ?auto_226179 ) ( AVAILABLE ?auto_226177 ) ( IN ?auto_226176 ?auto_226178 ) ( ON ?auto_226172 ?auto_226175 ) ( not ( = ?auto_226175 ?auto_226172 ) ) ( not ( = ?auto_226175 ?auto_226176 ) ) ( ON ?auto_226174 ?auto_226173 ) ( ON ?auto_226175 ?auto_226174 ) ( not ( = ?auto_226173 ?auto_226174 ) ) ( not ( = ?auto_226173 ?auto_226175 ) ) ( not ( = ?auto_226173 ?auto_226172 ) ) ( not ( = ?auto_226173 ?auto_226176 ) ) ( not ( = ?auto_226174 ?auto_226175 ) ) ( not ( = ?auto_226174 ?auto_226172 ) ) ( not ( = ?auto_226174 ?auto_226176 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226175 ?auto_226172 ?auto_226176 )
      ( MAKE-4CRATE-VERIFY ?auto_226173 ?auto_226174 ?auto_226175 ?auto_226172 ?auto_226176 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226203 - SURFACE
      ?auto_226204 - SURFACE
      ?auto_226205 - SURFACE
      ?auto_226202 - SURFACE
      ?auto_226206 - SURFACE
    )
    :vars
    (
      ?auto_226209 - HOIST
      ?auto_226207 - PLACE
      ?auto_226210 - TRUCK
      ?auto_226208 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226209 ?auto_226207 ) ( SURFACE-AT ?auto_226202 ?auto_226207 ) ( CLEAR ?auto_226202 ) ( IS-CRATE ?auto_226206 ) ( not ( = ?auto_226202 ?auto_226206 ) ) ( AVAILABLE ?auto_226209 ) ( IN ?auto_226206 ?auto_226210 ) ( ON ?auto_226202 ?auto_226205 ) ( not ( = ?auto_226205 ?auto_226202 ) ) ( not ( = ?auto_226205 ?auto_226206 ) ) ( TRUCK-AT ?auto_226210 ?auto_226208 ) ( not ( = ?auto_226208 ?auto_226207 ) ) ( ON ?auto_226204 ?auto_226203 ) ( ON ?auto_226205 ?auto_226204 ) ( not ( = ?auto_226203 ?auto_226204 ) ) ( not ( = ?auto_226203 ?auto_226205 ) ) ( not ( = ?auto_226203 ?auto_226202 ) ) ( not ( = ?auto_226203 ?auto_226206 ) ) ( not ( = ?auto_226204 ?auto_226205 ) ) ( not ( = ?auto_226204 ?auto_226202 ) ) ( not ( = ?auto_226204 ?auto_226206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226205 ?auto_226202 ?auto_226206 )
      ( MAKE-4CRATE-VERIFY ?auto_226203 ?auto_226204 ?auto_226205 ?auto_226202 ?auto_226206 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226237 - SURFACE
      ?auto_226238 - SURFACE
      ?auto_226239 - SURFACE
      ?auto_226236 - SURFACE
      ?auto_226240 - SURFACE
    )
    :vars
    (
      ?auto_226245 - HOIST
      ?auto_226242 - PLACE
      ?auto_226243 - TRUCK
      ?auto_226244 - PLACE
      ?auto_226241 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_226245 ?auto_226242 ) ( SURFACE-AT ?auto_226236 ?auto_226242 ) ( CLEAR ?auto_226236 ) ( IS-CRATE ?auto_226240 ) ( not ( = ?auto_226236 ?auto_226240 ) ) ( AVAILABLE ?auto_226245 ) ( ON ?auto_226236 ?auto_226239 ) ( not ( = ?auto_226239 ?auto_226236 ) ) ( not ( = ?auto_226239 ?auto_226240 ) ) ( TRUCK-AT ?auto_226243 ?auto_226244 ) ( not ( = ?auto_226244 ?auto_226242 ) ) ( HOIST-AT ?auto_226241 ?auto_226244 ) ( LIFTING ?auto_226241 ?auto_226240 ) ( not ( = ?auto_226245 ?auto_226241 ) ) ( ON ?auto_226238 ?auto_226237 ) ( ON ?auto_226239 ?auto_226238 ) ( not ( = ?auto_226237 ?auto_226238 ) ) ( not ( = ?auto_226237 ?auto_226239 ) ) ( not ( = ?auto_226237 ?auto_226236 ) ) ( not ( = ?auto_226237 ?auto_226240 ) ) ( not ( = ?auto_226238 ?auto_226239 ) ) ( not ( = ?auto_226238 ?auto_226236 ) ) ( not ( = ?auto_226238 ?auto_226240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226239 ?auto_226236 ?auto_226240 )
      ( MAKE-4CRATE-VERIFY ?auto_226237 ?auto_226238 ?auto_226239 ?auto_226236 ?auto_226240 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226275 - SURFACE
      ?auto_226276 - SURFACE
      ?auto_226277 - SURFACE
      ?auto_226274 - SURFACE
      ?auto_226278 - SURFACE
    )
    :vars
    (
      ?auto_226283 - HOIST
      ?auto_226284 - PLACE
      ?auto_226279 - TRUCK
      ?auto_226282 - PLACE
      ?auto_226281 - HOIST
      ?auto_226280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226283 ?auto_226284 ) ( SURFACE-AT ?auto_226274 ?auto_226284 ) ( CLEAR ?auto_226274 ) ( IS-CRATE ?auto_226278 ) ( not ( = ?auto_226274 ?auto_226278 ) ) ( AVAILABLE ?auto_226283 ) ( ON ?auto_226274 ?auto_226277 ) ( not ( = ?auto_226277 ?auto_226274 ) ) ( not ( = ?auto_226277 ?auto_226278 ) ) ( TRUCK-AT ?auto_226279 ?auto_226282 ) ( not ( = ?auto_226282 ?auto_226284 ) ) ( HOIST-AT ?auto_226281 ?auto_226282 ) ( not ( = ?auto_226283 ?auto_226281 ) ) ( AVAILABLE ?auto_226281 ) ( SURFACE-AT ?auto_226278 ?auto_226282 ) ( ON ?auto_226278 ?auto_226280 ) ( CLEAR ?auto_226278 ) ( not ( = ?auto_226274 ?auto_226280 ) ) ( not ( = ?auto_226278 ?auto_226280 ) ) ( not ( = ?auto_226277 ?auto_226280 ) ) ( ON ?auto_226276 ?auto_226275 ) ( ON ?auto_226277 ?auto_226276 ) ( not ( = ?auto_226275 ?auto_226276 ) ) ( not ( = ?auto_226275 ?auto_226277 ) ) ( not ( = ?auto_226275 ?auto_226274 ) ) ( not ( = ?auto_226275 ?auto_226278 ) ) ( not ( = ?auto_226275 ?auto_226280 ) ) ( not ( = ?auto_226276 ?auto_226277 ) ) ( not ( = ?auto_226276 ?auto_226274 ) ) ( not ( = ?auto_226276 ?auto_226278 ) ) ( not ( = ?auto_226276 ?auto_226280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226277 ?auto_226274 ?auto_226278 )
      ( MAKE-4CRATE-VERIFY ?auto_226275 ?auto_226276 ?auto_226277 ?auto_226274 ?auto_226278 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226314 - SURFACE
      ?auto_226315 - SURFACE
      ?auto_226316 - SURFACE
      ?auto_226313 - SURFACE
      ?auto_226317 - SURFACE
    )
    :vars
    (
      ?auto_226322 - HOIST
      ?auto_226321 - PLACE
      ?auto_226320 - PLACE
      ?auto_226319 - HOIST
      ?auto_226318 - SURFACE
      ?auto_226323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226322 ?auto_226321 ) ( SURFACE-AT ?auto_226313 ?auto_226321 ) ( CLEAR ?auto_226313 ) ( IS-CRATE ?auto_226317 ) ( not ( = ?auto_226313 ?auto_226317 ) ) ( AVAILABLE ?auto_226322 ) ( ON ?auto_226313 ?auto_226316 ) ( not ( = ?auto_226316 ?auto_226313 ) ) ( not ( = ?auto_226316 ?auto_226317 ) ) ( not ( = ?auto_226320 ?auto_226321 ) ) ( HOIST-AT ?auto_226319 ?auto_226320 ) ( not ( = ?auto_226322 ?auto_226319 ) ) ( AVAILABLE ?auto_226319 ) ( SURFACE-AT ?auto_226317 ?auto_226320 ) ( ON ?auto_226317 ?auto_226318 ) ( CLEAR ?auto_226317 ) ( not ( = ?auto_226313 ?auto_226318 ) ) ( not ( = ?auto_226317 ?auto_226318 ) ) ( not ( = ?auto_226316 ?auto_226318 ) ) ( TRUCK-AT ?auto_226323 ?auto_226321 ) ( ON ?auto_226315 ?auto_226314 ) ( ON ?auto_226316 ?auto_226315 ) ( not ( = ?auto_226314 ?auto_226315 ) ) ( not ( = ?auto_226314 ?auto_226316 ) ) ( not ( = ?auto_226314 ?auto_226313 ) ) ( not ( = ?auto_226314 ?auto_226317 ) ) ( not ( = ?auto_226314 ?auto_226318 ) ) ( not ( = ?auto_226315 ?auto_226316 ) ) ( not ( = ?auto_226315 ?auto_226313 ) ) ( not ( = ?auto_226315 ?auto_226317 ) ) ( not ( = ?auto_226315 ?auto_226318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226316 ?auto_226313 ?auto_226317 )
      ( MAKE-4CRATE-VERIFY ?auto_226314 ?auto_226315 ?auto_226316 ?auto_226313 ?auto_226317 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226353 - SURFACE
      ?auto_226354 - SURFACE
      ?auto_226355 - SURFACE
      ?auto_226352 - SURFACE
      ?auto_226356 - SURFACE
    )
    :vars
    (
      ?auto_226359 - HOIST
      ?auto_226360 - PLACE
      ?auto_226358 - PLACE
      ?auto_226357 - HOIST
      ?auto_226362 - SURFACE
      ?auto_226361 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226359 ?auto_226360 ) ( IS-CRATE ?auto_226356 ) ( not ( = ?auto_226352 ?auto_226356 ) ) ( not ( = ?auto_226355 ?auto_226352 ) ) ( not ( = ?auto_226355 ?auto_226356 ) ) ( not ( = ?auto_226358 ?auto_226360 ) ) ( HOIST-AT ?auto_226357 ?auto_226358 ) ( not ( = ?auto_226359 ?auto_226357 ) ) ( AVAILABLE ?auto_226357 ) ( SURFACE-AT ?auto_226356 ?auto_226358 ) ( ON ?auto_226356 ?auto_226362 ) ( CLEAR ?auto_226356 ) ( not ( = ?auto_226352 ?auto_226362 ) ) ( not ( = ?auto_226356 ?auto_226362 ) ) ( not ( = ?auto_226355 ?auto_226362 ) ) ( TRUCK-AT ?auto_226361 ?auto_226360 ) ( SURFACE-AT ?auto_226355 ?auto_226360 ) ( CLEAR ?auto_226355 ) ( LIFTING ?auto_226359 ?auto_226352 ) ( IS-CRATE ?auto_226352 ) ( ON ?auto_226354 ?auto_226353 ) ( ON ?auto_226355 ?auto_226354 ) ( not ( = ?auto_226353 ?auto_226354 ) ) ( not ( = ?auto_226353 ?auto_226355 ) ) ( not ( = ?auto_226353 ?auto_226352 ) ) ( not ( = ?auto_226353 ?auto_226356 ) ) ( not ( = ?auto_226353 ?auto_226362 ) ) ( not ( = ?auto_226354 ?auto_226355 ) ) ( not ( = ?auto_226354 ?auto_226352 ) ) ( not ( = ?auto_226354 ?auto_226356 ) ) ( not ( = ?auto_226354 ?auto_226362 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226355 ?auto_226352 ?auto_226356 )
      ( MAKE-4CRATE-VERIFY ?auto_226353 ?auto_226354 ?auto_226355 ?auto_226352 ?auto_226356 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226392 - SURFACE
      ?auto_226393 - SURFACE
      ?auto_226394 - SURFACE
      ?auto_226391 - SURFACE
      ?auto_226395 - SURFACE
    )
    :vars
    (
      ?auto_226397 - HOIST
      ?auto_226396 - PLACE
      ?auto_226398 - PLACE
      ?auto_226400 - HOIST
      ?auto_226399 - SURFACE
      ?auto_226401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226397 ?auto_226396 ) ( IS-CRATE ?auto_226395 ) ( not ( = ?auto_226391 ?auto_226395 ) ) ( not ( = ?auto_226394 ?auto_226391 ) ) ( not ( = ?auto_226394 ?auto_226395 ) ) ( not ( = ?auto_226398 ?auto_226396 ) ) ( HOIST-AT ?auto_226400 ?auto_226398 ) ( not ( = ?auto_226397 ?auto_226400 ) ) ( AVAILABLE ?auto_226400 ) ( SURFACE-AT ?auto_226395 ?auto_226398 ) ( ON ?auto_226395 ?auto_226399 ) ( CLEAR ?auto_226395 ) ( not ( = ?auto_226391 ?auto_226399 ) ) ( not ( = ?auto_226395 ?auto_226399 ) ) ( not ( = ?auto_226394 ?auto_226399 ) ) ( TRUCK-AT ?auto_226401 ?auto_226396 ) ( SURFACE-AT ?auto_226394 ?auto_226396 ) ( CLEAR ?auto_226394 ) ( IS-CRATE ?auto_226391 ) ( AVAILABLE ?auto_226397 ) ( IN ?auto_226391 ?auto_226401 ) ( ON ?auto_226393 ?auto_226392 ) ( ON ?auto_226394 ?auto_226393 ) ( not ( = ?auto_226392 ?auto_226393 ) ) ( not ( = ?auto_226392 ?auto_226394 ) ) ( not ( = ?auto_226392 ?auto_226391 ) ) ( not ( = ?auto_226392 ?auto_226395 ) ) ( not ( = ?auto_226392 ?auto_226399 ) ) ( not ( = ?auto_226393 ?auto_226394 ) ) ( not ( = ?auto_226393 ?auto_226391 ) ) ( not ( = ?auto_226393 ?auto_226395 ) ) ( not ( = ?auto_226393 ?auto_226399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226394 ?auto_226391 ?auto_226395 )
      ( MAKE-4CRATE-VERIFY ?auto_226392 ?auto_226393 ?auto_226394 ?auto_226391 ?auto_226395 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226507 - SURFACE
      ?auto_226508 - SURFACE
    )
    :vars
    (
      ?auto_226515 - HOIST
      ?auto_226514 - PLACE
      ?auto_226510 - SURFACE
      ?auto_226513 - PLACE
      ?auto_226511 - HOIST
      ?auto_226512 - SURFACE
      ?auto_226509 - TRUCK
      ?auto_226516 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226515 ?auto_226514 ) ( SURFACE-AT ?auto_226507 ?auto_226514 ) ( CLEAR ?auto_226507 ) ( IS-CRATE ?auto_226508 ) ( not ( = ?auto_226507 ?auto_226508 ) ) ( AVAILABLE ?auto_226515 ) ( ON ?auto_226507 ?auto_226510 ) ( not ( = ?auto_226510 ?auto_226507 ) ) ( not ( = ?auto_226510 ?auto_226508 ) ) ( not ( = ?auto_226513 ?auto_226514 ) ) ( HOIST-AT ?auto_226511 ?auto_226513 ) ( not ( = ?auto_226515 ?auto_226511 ) ) ( AVAILABLE ?auto_226511 ) ( SURFACE-AT ?auto_226508 ?auto_226513 ) ( ON ?auto_226508 ?auto_226512 ) ( CLEAR ?auto_226508 ) ( not ( = ?auto_226507 ?auto_226512 ) ) ( not ( = ?auto_226508 ?auto_226512 ) ) ( not ( = ?auto_226510 ?auto_226512 ) ) ( TRUCK-AT ?auto_226509 ?auto_226516 ) ( not ( = ?auto_226516 ?auto_226514 ) ) ( not ( = ?auto_226513 ?auto_226516 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_226509 ?auto_226516 ?auto_226514 )
      ( MAKE-1CRATE ?auto_226507 ?auto_226508 )
      ( MAKE-1CRATE-VERIFY ?auto_226507 ?auto_226508 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226664 - SURFACE
      ?auto_226665 - SURFACE
    )
    :vars
    (
      ?auto_226666 - HOIST
      ?auto_226667 - PLACE
      ?auto_226672 - SURFACE
      ?auto_226669 - PLACE
      ?auto_226668 - HOIST
      ?auto_226670 - SURFACE
      ?auto_226671 - TRUCK
      ?auto_226673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226666 ?auto_226667 ) ( SURFACE-AT ?auto_226664 ?auto_226667 ) ( CLEAR ?auto_226664 ) ( IS-CRATE ?auto_226665 ) ( not ( = ?auto_226664 ?auto_226665 ) ) ( ON ?auto_226664 ?auto_226672 ) ( not ( = ?auto_226672 ?auto_226664 ) ) ( not ( = ?auto_226672 ?auto_226665 ) ) ( not ( = ?auto_226669 ?auto_226667 ) ) ( HOIST-AT ?auto_226668 ?auto_226669 ) ( not ( = ?auto_226666 ?auto_226668 ) ) ( AVAILABLE ?auto_226668 ) ( SURFACE-AT ?auto_226665 ?auto_226669 ) ( ON ?auto_226665 ?auto_226670 ) ( CLEAR ?auto_226665 ) ( not ( = ?auto_226664 ?auto_226670 ) ) ( not ( = ?auto_226665 ?auto_226670 ) ) ( not ( = ?auto_226672 ?auto_226670 ) ) ( TRUCK-AT ?auto_226671 ?auto_226667 ) ( LIFTING ?auto_226666 ?auto_226673 ) ( IS-CRATE ?auto_226673 ) ( not ( = ?auto_226664 ?auto_226673 ) ) ( not ( = ?auto_226665 ?auto_226673 ) ) ( not ( = ?auto_226672 ?auto_226673 ) ) ( not ( = ?auto_226670 ?auto_226673 ) ) )
    :subtasks
    ( ( !LOAD ?auto_226666 ?auto_226673 ?auto_226671 ?auto_226667 )
      ( MAKE-1CRATE ?auto_226664 ?auto_226665 )
      ( MAKE-1CRATE-VERIFY ?auto_226664 ?auto_226665 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227043 - SURFACE
      ?auto_227044 - SURFACE
      ?auto_227045 - SURFACE
      ?auto_227042 - SURFACE
      ?auto_227046 - SURFACE
      ?auto_227047 - SURFACE
    )
    :vars
    (
      ?auto_227049 - HOIST
      ?auto_227048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_227049 ?auto_227048 ) ( SURFACE-AT ?auto_227046 ?auto_227048 ) ( CLEAR ?auto_227046 ) ( LIFTING ?auto_227049 ?auto_227047 ) ( IS-CRATE ?auto_227047 ) ( not ( = ?auto_227046 ?auto_227047 ) ) ( ON ?auto_227044 ?auto_227043 ) ( ON ?auto_227045 ?auto_227044 ) ( ON ?auto_227042 ?auto_227045 ) ( ON ?auto_227046 ?auto_227042 ) ( not ( = ?auto_227043 ?auto_227044 ) ) ( not ( = ?auto_227043 ?auto_227045 ) ) ( not ( = ?auto_227043 ?auto_227042 ) ) ( not ( = ?auto_227043 ?auto_227046 ) ) ( not ( = ?auto_227043 ?auto_227047 ) ) ( not ( = ?auto_227044 ?auto_227045 ) ) ( not ( = ?auto_227044 ?auto_227042 ) ) ( not ( = ?auto_227044 ?auto_227046 ) ) ( not ( = ?auto_227044 ?auto_227047 ) ) ( not ( = ?auto_227045 ?auto_227042 ) ) ( not ( = ?auto_227045 ?auto_227046 ) ) ( not ( = ?auto_227045 ?auto_227047 ) ) ( not ( = ?auto_227042 ?auto_227046 ) ) ( not ( = ?auto_227042 ?auto_227047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_227046 ?auto_227047 )
      ( MAKE-5CRATE-VERIFY ?auto_227043 ?auto_227044 ?auto_227045 ?auto_227042 ?auto_227046 ?auto_227047 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227077 - SURFACE
      ?auto_227078 - SURFACE
      ?auto_227079 - SURFACE
      ?auto_227076 - SURFACE
      ?auto_227080 - SURFACE
      ?auto_227081 - SURFACE
    )
    :vars
    (
      ?auto_227082 - HOIST
      ?auto_227084 - PLACE
      ?auto_227083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_227082 ?auto_227084 ) ( SURFACE-AT ?auto_227080 ?auto_227084 ) ( CLEAR ?auto_227080 ) ( IS-CRATE ?auto_227081 ) ( not ( = ?auto_227080 ?auto_227081 ) ) ( TRUCK-AT ?auto_227083 ?auto_227084 ) ( AVAILABLE ?auto_227082 ) ( IN ?auto_227081 ?auto_227083 ) ( ON ?auto_227080 ?auto_227076 ) ( not ( = ?auto_227076 ?auto_227080 ) ) ( not ( = ?auto_227076 ?auto_227081 ) ) ( ON ?auto_227078 ?auto_227077 ) ( ON ?auto_227079 ?auto_227078 ) ( ON ?auto_227076 ?auto_227079 ) ( not ( = ?auto_227077 ?auto_227078 ) ) ( not ( = ?auto_227077 ?auto_227079 ) ) ( not ( = ?auto_227077 ?auto_227076 ) ) ( not ( = ?auto_227077 ?auto_227080 ) ) ( not ( = ?auto_227077 ?auto_227081 ) ) ( not ( = ?auto_227078 ?auto_227079 ) ) ( not ( = ?auto_227078 ?auto_227076 ) ) ( not ( = ?auto_227078 ?auto_227080 ) ) ( not ( = ?auto_227078 ?auto_227081 ) ) ( not ( = ?auto_227079 ?auto_227076 ) ) ( not ( = ?auto_227079 ?auto_227080 ) ) ( not ( = ?auto_227079 ?auto_227081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227076 ?auto_227080 ?auto_227081 )
      ( MAKE-5CRATE-VERIFY ?auto_227077 ?auto_227078 ?auto_227079 ?auto_227076 ?auto_227080 ?auto_227081 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227117 - SURFACE
      ?auto_227118 - SURFACE
      ?auto_227119 - SURFACE
      ?auto_227116 - SURFACE
      ?auto_227120 - SURFACE
      ?auto_227121 - SURFACE
    )
    :vars
    (
      ?auto_227125 - HOIST
      ?auto_227122 - PLACE
      ?auto_227124 - TRUCK
      ?auto_227123 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_227125 ?auto_227122 ) ( SURFACE-AT ?auto_227120 ?auto_227122 ) ( CLEAR ?auto_227120 ) ( IS-CRATE ?auto_227121 ) ( not ( = ?auto_227120 ?auto_227121 ) ) ( AVAILABLE ?auto_227125 ) ( IN ?auto_227121 ?auto_227124 ) ( ON ?auto_227120 ?auto_227116 ) ( not ( = ?auto_227116 ?auto_227120 ) ) ( not ( = ?auto_227116 ?auto_227121 ) ) ( TRUCK-AT ?auto_227124 ?auto_227123 ) ( not ( = ?auto_227123 ?auto_227122 ) ) ( ON ?auto_227118 ?auto_227117 ) ( ON ?auto_227119 ?auto_227118 ) ( ON ?auto_227116 ?auto_227119 ) ( not ( = ?auto_227117 ?auto_227118 ) ) ( not ( = ?auto_227117 ?auto_227119 ) ) ( not ( = ?auto_227117 ?auto_227116 ) ) ( not ( = ?auto_227117 ?auto_227120 ) ) ( not ( = ?auto_227117 ?auto_227121 ) ) ( not ( = ?auto_227118 ?auto_227119 ) ) ( not ( = ?auto_227118 ?auto_227116 ) ) ( not ( = ?auto_227118 ?auto_227120 ) ) ( not ( = ?auto_227118 ?auto_227121 ) ) ( not ( = ?auto_227119 ?auto_227116 ) ) ( not ( = ?auto_227119 ?auto_227120 ) ) ( not ( = ?auto_227119 ?auto_227121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227116 ?auto_227120 ?auto_227121 )
      ( MAKE-5CRATE-VERIFY ?auto_227117 ?auto_227118 ?auto_227119 ?auto_227116 ?auto_227120 ?auto_227121 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227162 - SURFACE
      ?auto_227163 - SURFACE
      ?auto_227164 - SURFACE
      ?auto_227161 - SURFACE
      ?auto_227165 - SURFACE
      ?auto_227166 - SURFACE
    )
    :vars
    (
      ?auto_227169 - HOIST
      ?auto_227171 - PLACE
      ?auto_227168 - TRUCK
      ?auto_227170 - PLACE
      ?auto_227167 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_227169 ?auto_227171 ) ( SURFACE-AT ?auto_227165 ?auto_227171 ) ( CLEAR ?auto_227165 ) ( IS-CRATE ?auto_227166 ) ( not ( = ?auto_227165 ?auto_227166 ) ) ( AVAILABLE ?auto_227169 ) ( ON ?auto_227165 ?auto_227161 ) ( not ( = ?auto_227161 ?auto_227165 ) ) ( not ( = ?auto_227161 ?auto_227166 ) ) ( TRUCK-AT ?auto_227168 ?auto_227170 ) ( not ( = ?auto_227170 ?auto_227171 ) ) ( HOIST-AT ?auto_227167 ?auto_227170 ) ( LIFTING ?auto_227167 ?auto_227166 ) ( not ( = ?auto_227169 ?auto_227167 ) ) ( ON ?auto_227163 ?auto_227162 ) ( ON ?auto_227164 ?auto_227163 ) ( ON ?auto_227161 ?auto_227164 ) ( not ( = ?auto_227162 ?auto_227163 ) ) ( not ( = ?auto_227162 ?auto_227164 ) ) ( not ( = ?auto_227162 ?auto_227161 ) ) ( not ( = ?auto_227162 ?auto_227165 ) ) ( not ( = ?auto_227162 ?auto_227166 ) ) ( not ( = ?auto_227163 ?auto_227164 ) ) ( not ( = ?auto_227163 ?auto_227161 ) ) ( not ( = ?auto_227163 ?auto_227165 ) ) ( not ( = ?auto_227163 ?auto_227166 ) ) ( not ( = ?auto_227164 ?auto_227161 ) ) ( not ( = ?auto_227164 ?auto_227165 ) ) ( not ( = ?auto_227164 ?auto_227166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227161 ?auto_227165 ?auto_227166 )
      ( MAKE-5CRATE-VERIFY ?auto_227162 ?auto_227163 ?auto_227164 ?auto_227161 ?auto_227165 ?auto_227166 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227212 - SURFACE
      ?auto_227213 - SURFACE
      ?auto_227214 - SURFACE
      ?auto_227211 - SURFACE
      ?auto_227215 - SURFACE
      ?auto_227216 - SURFACE
    )
    :vars
    (
      ?auto_227221 - HOIST
      ?auto_227222 - PLACE
      ?auto_227217 - TRUCK
      ?auto_227219 - PLACE
      ?auto_227218 - HOIST
      ?auto_227220 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_227221 ?auto_227222 ) ( SURFACE-AT ?auto_227215 ?auto_227222 ) ( CLEAR ?auto_227215 ) ( IS-CRATE ?auto_227216 ) ( not ( = ?auto_227215 ?auto_227216 ) ) ( AVAILABLE ?auto_227221 ) ( ON ?auto_227215 ?auto_227211 ) ( not ( = ?auto_227211 ?auto_227215 ) ) ( not ( = ?auto_227211 ?auto_227216 ) ) ( TRUCK-AT ?auto_227217 ?auto_227219 ) ( not ( = ?auto_227219 ?auto_227222 ) ) ( HOIST-AT ?auto_227218 ?auto_227219 ) ( not ( = ?auto_227221 ?auto_227218 ) ) ( AVAILABLE ?auto_227218 ) ( SURFACE-AT ?auto_227216 ?auto_227219 ) ( ON ?auto_227216 ?auto_227220 ) ( CLEAR ?auto_227216 ) ( not ( = ?auto_227215 ?auto_227220 ) ) ( not ( = ?auto_227216 ?auto_227220 ) ) ( not ( = ?auto_227211 ?auto_227220 ) ) ( ON ?auto_227213 ?auto_227212 ) ( ON ?auto_227214 ?auto_227213 ) ( ON ?auto_227211 ?auto_227214 ) ( not ( = ?auto_227212 ?auto_227213 ) ) ( not ( = ?auto_227212 ?auto_227214 ) ) ( not ( = ?auto_227212 ?auto_227211 ) ) ( not ( = ?auto_227212 ?auto_227215 ) ) ( not ( = ?auto_227212 ?auto_227216 ) ) ( not ( = ?auto_227212 ?auto_227220 ) ) ( not ( = ?auto_227213 ?auto_227214 ) ) ( not ( = ?auto_227213 ?auto_227211 ) ) ( not ( = ?auto_227213 ?auto_227215 ) ) ( not ( = ?auto_227213 ?auto_227216 ) ) ( not ( = ?auto_227213 ?auto_227220 ) ) ( not ( = ?auto_227214 ?auto_227211 ) ) ( not ( = ?auto_227214 ?auto_227215 ) ) ( not ( = ?auto_227214 ?auto_227216 ) ) ( not ( = ?auto_227214 ?auto_227220 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227211 ?auto_227215 ?auto_227216 )
      ( MAKE-5CRATE-VERIFY ?auto_227212 ?auto_227213 ?auto_227214 ?auto_227211 ?auto_227215 ?auto_227216 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227263 - SURFACE
      ?auto_227264 - SURFACE
      ?auto_227265 - SURFACE
      ?auto_227262 - SURFACE
      ?auto_227266 - SURFACE
      ?auto_227267 - SURFACE
    )
    :vars
    (
      ?auto_227268 - HOIST
      ?auto_227269 - PLACE
      ?auto_227270 - PLACE
      ?auto_227271 - HOIST
      ?auto_227272 - SURFACE
      ?auto_227273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_227268 ?auto_227269 ) ( SURFACE-AT ?auto_227266 ?auto_227269 ) ( CLEAR ?auto_227266 ) ( IS-CRATE ?auto_227267 ) ( not ( = ?auto_227266 ?auto_227267 ) ) ( AVAILABLE ?auto_227268 ) ( ON ?auto_227266 ?auto_227262 ) ( not ( = ?auto_227262 ?auto_227266 ) ) ( not ( = ?auto_227262 ?auto_227267 ) ) ( not ( = ?auto_227270 ?auto_227269 ) ) ( HOIST-AT ?auto_227271 ?auto_227270 ) ( not ( = ?auto_227268 ?auto_227271 ) ) ( AVAILABLE ?auto_227271 ) ( SURFACE-AT ?auto_227267 ?auto_227270 ) ( ON ?auto_227267 ?auto_227272 ) ( CLEAR ?auto_227267 ) ( not ( = ?auto_227266 ?auto_227272 ) ) ( not ( = ?auto_227267 ?auto_227272 ) ) ( not ( = ?auto_227262 ?auto_227272 ) ) ( TRUCK-AT ?auto_227273 ?auto_227269 ) ( ON ?auto_227264 ?auto_227263 ) ( ON ?auto_227265 ?auto_227264 ) ( ON ?auto_227262 ?auto_227265 ) ( not ( = ?auto_227263 ?auto_227264 ) ) ( not ( = ?auto_227263 ?auto_227265 ) ) ( not ( = ?auto_227263 ?auto_227262 ) ) ( not ( = ?auto_227263 ?auto_227266 ) ) ( not ( = ?auto_227263 ?auto_227267 ) ) ( not ( = ?auto_227263 ?auto_227272 ) ) ( not ( = ?auto_227264 ?auto_227265 ) ) ( not ( = ?auto_227264 ?auto_227262 ) ) ( not ( = ?auto_227264 ?auto_227266 ) ) ( not ( = ?auto_227264 ?auto_227267 ) ) ( not ( = ?auto_227264 ?auto_227272 ) ) ( not ( = ?auto_227265 ?auto_227262 ) ) ( not ( = ?auto_227265 ?auto_227266 ) ) ( not ( = ?auto_227265 ?auto_227267 ) ) ( not ( = ?auto_227265 ?auto_227272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227262 ?auto_227266 ?auto_227267 )
      ( MAKE-5CRATE-VERIFY ?auto_227263 ?auto_227264 ?auto_227265 ?auto_227262 ?auto_227266 ?auto_227267 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227314 - SURFACE
      ?auto_227315 - SURFACE
      ?auto_227316 - SURFACE
      ?auto_227313 - SURFACE
      ?auto_227317 - SURFACE
      ?auto_227318 - SURFACE
    )
    :vars
    (
      ?auto_227324 - HOIST
      ?auto_227319 - PLACE
      ?auto_227323 - PLACE
      ?auto_227321 - HOIST
      ?auto_227320 - SURFACE
      ?auto_227322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_227324 ?auto_227319 ) ( IS-CRATE ?auto_227318 ) ( not ( = ?auto_227317 ?auto_227318 ) ) ( not ( = ?auto_227313 ?auto_227317 ) ) ( not ( = ?auto_227313 ?auto_227318 ) ) ( not ( = ?auto_227323 ?auto_227319 ) ) ( HOIST-AT ?auto_227321 ?auto_227323 ) ( not ( = ?auto_227324 ?auto_227321 ) ) ( AVAILABLE ?auto_227321 ) ( SURFACE-AT ?auto_227318 ?auto_227323 ) ( ON ?auto_227318 ?auto_227320 ) ( CLEAR ?auto_227318 ) ( not ( = ?auto_227317 ?auto_227320 ) ) ( not ( = ?auto_227318 ?auto_227320 ) ) ( not ( = ?auto_227313 ?auto_227320 ) ) ( TRUCK-AT ?auto_227322 ?auto_227319 ) ( SURFACE-AT ?auto_227313 ?auto_227319 ) ( CLEAR ?auto_227313 ) ( LIFTING ?auto_227324 ?auto_227317 ) ( IS-CRATE ?auto_227317 ) ( ON ?auto_227315 ?auto_227314 ) ( ON ?auto_227316 ?auto_227315 ) ( ON ?auto_227313 ?auto_227316 ) ( not ( = ?auto_227314 ?auto_227315 ) ) ( not ( = ?auto_227314 ?auto_227316 ) ) ( not ( = ?auto_227314 ?auto_227313 ) ) ( not ( = ?auto_227314 ?auto_227317 ) ) ( not ( = ?auto_227314 ?auto_227318 ) ) ( not ( = ?auto_227314 ?auto_227320 ) ) ( not ( = ?auto_227315 ?auto_227316 ) ) ( not ( = ?auto_227315 ?auto_227313 ) ) ( not ( = ?auto_227315 ?auto_227317 ) ) ( not ( = ?auto_227315 ?auto_227318 ) ) ( not ( = ?auto_227315 ?auto_227320 ) ) ( not ( = ?auto_227316 ?auto_227313 ) ) ( not ( = ?auto_227316 ?auto_227317 ) ) ( not ( = ?auto_227316 ?auto_227318 ) ) ( not ( = ?auto_227316 ?auto_227320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227313 ?auto_227317 ?auto_227318 )
      ( MAKE-5CRATE-VERIFY ?auto_227314 ?auto_227315 ?auto_227316 ?auto_227313 ?auto_227317 ?auto_227318 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227365 - SURFACE
      ?auto_227366 - SURFACE
      ?auto_227367 - SURFACE
      ?auto_227364 - SURFACE
      ?auto_227368 - SURFACE
      ?auto_227369 - SURFACE
    )
    :vars
    (
      ?auto_227371 - HOIST
      ?auto_227374 - PLACE
      ?auto_227373 - PLACE
      ?auto_227375 - HOIST
      ?auto_227372 - SURFACE
      ?auto_227370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_227371 ?auto_227374 ) ( IS-CRATE ?auto_227369 ) ( not ( = ?auto_227368 ?auto_227369 ) ) ( not ( = ?auto_227364 ?auto_227368 ) ) ( not ( = ?auto_227364 ?auto_227369 ) ) ( not ( = ?auto_227373 ?auto_227374 ) ) ( HOIST-AT ?auto_227375 ?auto_227373 ) ( not ( = ?auto_227371 ?auto_227375 ) ) ( AVAILABLE ?auto_227375 ) ( SURFACE-AT ?auto_227369 ?auto_227373 ) ( ON ?auto_227369 ?auto_227372 ) ( CLEAR ?auto_227369 ) ( not ( = ?auto_227368 ?auto_227372 ) ) ( not ( = ?auto_227369 ?auto_227372 ) ) ( not ( = ?auto_227364 ?auto_227372 ) ) ( TRUCK-AT ?auto_227370 ?auto_227374 ) ( SURFACE-AT ?auto_227364 ?auto_227374 ) ( CLEAR ?auto_227364 ) ( IS-CRATE ?auto_227368 ) ( AVAILABLE ?auto_227371 ) ( IN ?auto_227368 ?auto_227370 ) ( ON ?auto_227366 ?auto_227365 ) ( ON ?auto_227367 ?auto_227366 ) ( ON ?auto_227364 ?auto_227367 ) ( not ( = ?auto_227365 ?auto_227366 ) ) ( not ( = ?auto_227365 ?auto_227367 ) ) ( not ( = ?auto_227365 ?auto_227364 ) ) ( not ( = ?auto_227365 ?auto_227368 ) ) ( not ( = ?auto_227365 ?auto_227369 ) ) ( not ( = ?auto_227365 ?auto_227372 ) ) ( not ( = ?auto_227366 ?auto_227367 ) ) ( not ( = ?auto_227366 ?auto_227364 ) ) ( not ( = ?auto_227366 ?auto_227368 ) ) ( not ( = ?auto_227366 ?auto_227369 ) ) ( not ( = ?auto_227366 ?auto_227372 ) ) ( not ( = ?auto_227367 ?auto_227364 ) ) ( not ( = ?auto_227367 ?auto_227368 ) ) ( not ( = ?auto_227367 ?auto_227369 ) ) ( not ( = ?auto_227367 ?auto_227372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227364 ?auto_227368 ?auto_227369 )
      ( MAKE-5CRATE-VERIFY ?auto_227365 ?auto_227366 ?auto_227367 ?auto_227364 ?auto_227368 ?auto_227369 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228574 - SURFACE
      ?auto_228575 - SURFACE
      ?auto_228576 - SURFACE
      ?auto_228573 - SURFACE
      ?auto_228577 - SURFACE
      ?auto_228579 - SURFACE
      ?auto_228578 - SURFACE
    )
    :vars
    (
      ?auto_228580 - HOIST
      ?auto_228581 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228580 ?auto_228581 ) ( SURFACE-AT ?auto_228579 ?auto_228581 ) ( CLEAR ?auto_228579 ) ( LIFTING ?auto_228580 ?auto_228578 ) ( IS-CRATE ?auto_228578 ) ( not ( = ?auto_228579 ?auto_228578 ) ) ( ON ?auto_228575 ?auto_228574 ) ( ON ?auto_228576 ?auto_228575 ) ( ON ?auto_228573 ?auto_228576 ) ( ON ?auto_228577 ?auto_228573 ) ( ON ?auto_228579 ?auto_228577 ) ( not ( = ?auto_228574 ?auto_228575 ) ) ( not ( = ?auto_228574 ?auto_228576 ) ) ( not ( = ?auto_228574 ?auto_228573 ) ) ( not ( = ?auto_228574 ?auto_228577 ) ) ( not ( = ?auto_228574 ?auto_228579 ) ) ( not ( = ?auto_228574 ?auto_228578 ) ) ( not ( = ?auto_228575 ?auto_228576 ) ) ( not ( = ?auto_228575 ?auto_228573 ) ) ( not ( = ?auto_228575 ?auto_228577 ) ) ( not ( = ?auto_228575 ?auto_228579 ) ) ( not ( = ?auto_228575 ?auto_228578 ) ) ( not ( = ?auto_228576 ?auto_228573 ) ) ( not ( = ?auto_228576 ?auto_228577 ) ) ( not ( = ?auto_228576 ?auto_228579 ) ) ( not ( = ?auto_228576 ?auto_228578 ) ) ( not ( = ?auto_228573 ?auto_228577 ) ) ( not ( = ?auto_228573 ?auto_228579 ) ) ( not ( = ?auto_228573 ?auto_228578 ) ) ( not ( = ?auto_228577 ?auto_228579 ) ) ( not ( = ?auto_228577 ?auto_228578 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_228579 ?auto_228578 )
      ( MAKE-6CRATE-VERIFY ?auto_228574 ?auto_228575 ?auto_228576 ?auto_228573 ?auto_228577 ?auto_228579 ?auto_228578 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228618 - SURFACE
      ?auto_228619 - SURFACE
      ?auto_228620 - SURFACE
      ?auto_228617 - SURFACE
      ?auto_228621 - SURFACE
      ?auto_228623 - SURFACE
      ?auto_228622 - SURFACE
    )
    :vars
    (
      ?auto_228626 - HOIST
      ?auto_228625 - PLACE
      ?auto_228624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228626 ?auto_228625 ) ( SURFACE-AT ?auto_228623 ?auto_228625 ) ( CLEAR ?auto_228623 ) ( IS-CRATE ?auto_228622 ) ( not ( = ?auto_228623 ?auto_228622 ) ) ( TRUCK-AT ?auto_228624 ?auto_228625 ) ( AVAILABLE ?auto_228626 ) ( IN ?auto_228622 ?auto_228624 ) ( ON ?auto_228623 ?auto_228621 ) ( not ( = ?auto_228621 ?auto_228623 ) ) ( not ( = ?auto_228621 ?auto_228622 ) ) ( ON ?auto_228619 ?auto_228618 ) ( ON ?auto_228620 ?auto_228619 ) ( ON ?auto_228617 ?auto_228620 ) ( ON ?auto_228621 ?auto_228617 ) ( not ( = ?auto_228618 ?auto_228619 ) ) ( not ( = ?auto_228618 ?auto_228620 ) ) ( not ( = ?auto_228618 ?auto_228617 ) ) ( not ( = ?auto_228618 ?auto_228621 ) ) ( not ( = ?auto_228618 ?auto_228623 ) ) ( not ( = ?auto_228618 ?auto_228622 ) ) ( not ( = ?auto_228619 ?auto_228620 ) ) ( not ( = ?auto_228619 ?auto_228617 ) ) ( not ( = ?auto_228619 ?auto_228621 ) ) ( not ( = ?auto_228619 ?auto_228623 ) ) ( not ( = ?auto_228619 ?auto_228622 ) ) ( not ( = ?auto_228620 ?auto_228617 ) ) ( not ( = ?auto_228620 ?auto_228621 ) ) ( not ( = ?auto_228620 ?auto_228623 ) ) ( not ( = ?auto_228620 ?auto_228622 ) ) ( not ( = ?auto_228617 ?auto_228621 ) ) ( not ( = ?auto_228617 ?auto_228623 ) ) ( not ( = ?auto_228617 ?auto_228622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228621 ?auto_228623 ?auto_228622 )
      ( MAKE-6CRATE-VERIFY ?auto_228618 ?auto_228619 ?auto_228620 ?auto_228617 ?auto_228621 ?auto_228623 ?auto_228622 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228669 - SURFACE
      ?auto_228670 - SURFACE
      ?auto_228671 - SURFACE
      ?auto_228668 - SURFACE
      ?auto_228672 - SURFACE
      ?auto_228674 - SURFACE
      ?auto_228673 - SURFACE
    )
    :vars
    (
      ?auto_228675 - HOIST
      ?auto_228676 - PLACE
      ?auto_228678 - TRUCK
      ?auto_228677 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228675 ?auto_228676 ) ( SURFACE-AT ?auto_228674 ?auto_228676 ) ( CLEAR ?auto_228674 ) ( IS-CRATE ?auto_228673 ) ( not ( = ?auto_228674 ?auto_228673 ) ) ( AVAILABLE ?auto_228675 ) ( IN ?auto_228673 ?auto_228678 ) ( ON ?auto_228674 ?auto_228672 ) ( not ( = ?auto_228672 ?auto_228674 ) ) ( not ( = ?auto_228672 ?auto_228673 ) ) ( TRUCK-AT ?auto_228678 ?auto_228677 ) ( not ( = ?auto_228677 ?auto_228676 ) ) ( ON ?auto_228670 ?auto_228669 ) ( ON ?auto_228671 ?auto_228670 ) ( ON ?auto_228668 ?auto_228671 ) ( ON ?auto_228672 ?auto_228668 ) ( not ( = ?auto_228669 ?auto_228670 ) ) ( not ( = ?auto_228669 ?auto_228671 ) ) ( not ( = ?auto_228669 ?auto_228668 ) ) ( not ( = ?auto_228669 ?auto_228672 ) ) ( not ( = ?auto_228669 ?auto_228674 ) ) ( not ( = ?auto_228669 ?auto_228673 ) ) ( not ( = ?auto_228670 ?auto_228671 ) ) ( not ( = ?auto_228670 ?auto_228668 ) ) ( not ( = ?auto_228670 ?auto_228672 ) ) ( not ( = ?auto_228670 ?auto_228674 ) ) ( not ( = ?auto_228670 ?auto_228673 ) ) ( not ( = ?auto_228671 ?auto_228668 ) ) ( not ( = ?auto_228671 ?auto_228672 ) ) ( not ( = ?auto_228671 ?auto_228674 ) ) ( not ( = ?auto_228671 ?auto_228673 ) ) ( not ( = ?auto_228668 ?auto_228672 ) ) ( not ( = ?auto_228668 ?auto_228674 ) ) ( not ( = ?auto_228668 ?auto_228673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228672 ?auto_228674 ?auto_228673 )
      ( MAKE-6CRATE-VERIFY ?auto_228669 ?auto_228670 ?auto_228671 ?auto_228668 ?auto_228672 ?auto_228674 ?auto_228673 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228726 - SURFACE
      ?auto_228727 - SURFACE
      ?auto_228728 - SURFACE
      ?auto_228725 - SURFACE
      ?auto_228729 - SURFACE
      ?auto_228731 - SURFACE
      ?auto_228730 - SURFACE
    )
    :vars
    (
      ?auto_228732 - HOIST
      ?auto_228736 - PLACE
      ?auto_228734 - TRUCK
      ?auto_228735 - PLACE
      ?auto_228733 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_228732 ?auto_228736 ) ( SURFACE-AT ?auto_228731 ?auto_228736 ) ( CLEAR ?auto_228731 ) ( IS-CRATE ?auto_228730 ) ( not ( = ?auto_228731 ?auto_228730 ) ) ( AVAILABLE ?auto_228732 ) ( ON ?auto_228731 ?auto_228729 ) ( not ( = ?auto_228729 ?auto_228731 ) ) ( not ( = ?auto_228729 ?auto_228730 ) ) ( TRUCK-AT ?auto_228734 ?auto_228735 ) ( not ( = ?auto_228735 ?auto_228736 ) ) ( HOIST-AT ?auto_228733 ?auto_228735 ) ( LIFTING ?auto_228733 ?auto_228730 ) ( not ( = ?auto_228732 ?auto_228733 ) ) ( ON ?auto_228727 ?auto_228726 ) ( ON ?auto_228728 ?auto_228727 ) ( ON ?auto_228725 ?auto_228728 ) ( ON ?auto_228729 ?auto_228725 ) ( not ( = ?auto_228726 ?auto_228727 ) ) ( not ( = ?auto_228726 ?auto_228728 ) ) ( not ( = ?auto_228726 ?auto_228725 ) ) ( not ( = ?auto_228726 ?auto_228729 ) ) ( not ( = ?auto_228726 ?auto_228731 ) ) ( not ( = ?auto_228726 ?auto_228730 ) ) ( not ( = ?auto_228727 ?auto_228728 ) ) ( not ( = ?auto_228727 ?auto_228725 ) ) ( not ( = ?auto_228727 ?auto_228729 ) ) ( not ( = ?auto_228727 ?auto_228731 ) ) ( not ( = ?auto_228727 ?auto_228730 ) ) ( not ( = ?auto_228728 ?auto_228725 ) ) ( not ( = ?auto_228728 ?auto_228729 ) ) ( not ( = ?auto_228728 ?auto_228731 ) ) ( not ( = ?auto_228728 ?auto_228730 ) ) ( not ( = ?auto_228725 ?auto_228729 ) ) ( not ( = ?auto_228725 ?auto_228731 ) ) ( not ( = ?auto_228725 ?auto_228730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228729 ?auto_228731 ?auto_228730 )
      ( MAKE-6CRATE-VERIFY ?auto_228726 ?auto_228727 ?auto_228728 ?auto_228725 ?auto_228729 ?auto_228731 ?auto_228730 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228789 - SURFACE
      ?auto_228790 - SURFACE
      ?auto_228791 - SURFACE
      ?auto_228788 - SURFACE
      ?auto_228792 - SURFACE
      ?auto_228794 - SURFACE
      ?auto_228793 - SURFACE
    )
    :vars
    (
      ?auto_228795 - HOIST
      ?auto_228799 - PLACE
      ?auto_228798 - TRUCK
      ?auto_228800 - PLACE
      ?auto_228797 - HOIST
      ?auto_228796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228795 ?auto_228799 ) ( SURFACE-AT ?auto_228794 ?auto_228799 ) ( CLEAR ?auto_228794 ) ( IS-CRATE ?auto_228793 ) ( not ( = ?auto_228794 ?auto_228793 ) ) ( AVAILABLE ?auto_228795 ) ( ON ?auto_228794 ?auto_228792 ) ( not ( = ?auto_228792 ?auto_228794 ) ) ( not ( = ?auto_228792 ?auto_228793 ) ) ( TRUCK-AT ?auto_228798 ?auto_228800 ) ( not ( = ?auto_228800 ?auto_228799 ) ) ( HOIST-AT ?auto_228797 ?auto_228800 ) ( not ( = ?auto_228795 ?auto_228797 ) ) ( AVAILABLE ?auto_228797 ) ( SURFACE-AT ?auto_228793 ?auto_228800 ) ( ON ?auto_228793 ?auto_228796 ) ( CLEAR ?auto_228793 ) ( not ( = ?auto_228794 ?auto_228796 ) ) ( not ( = ?auto_228793 ?auto_228796 ) ) ( not ( = ?auto_228792 ?auto_228796 ) ) ( ON ?auto_228790 ?auto_228789 ) ( ON ?auto_228791 ?auto_228790 ) ( ON ?auto_228788 ?auto_228791 ) ( ON ?auto_228792 ?auto_228788 ) ( not ( = ?auto_228789 ?auto_228790 ) ) ( not ( = ?auto_228789 ?auto_228791 ) ) ( not ( = ?auto_228789 ?auto_228788 ) ) ( not ( = ?auto_228789 ?auto_228792 ) ) ( not ( = ?auto_228789 ?auto_228794 ) ) ( not ( = ?auto_228789 ?auto_228793 ) ) ( not ( = ?auto_228789 ?auto_228796 ) ) ( not ( = ?auto_228790 ?auto_228791 ) ) ( not ( = ?auto_228790 ?auto_228788 ) ) ( not ( = ?auto_228790 ?auto_228792 ) ) ( not ( = ?auto_228790 ?auto_228794 ) ) ( not ( = ?auto_228790 ?auto_228793 ) ) ( not ( = ?auto_228790 ?auto_228796 ) ) ( not ( = ?auto_228791 ?auto_228788 ) ) ( not ( = ?auto_228791 ?auto_228792 ) ) ( not ( = ?auto_228791 ?auto_228794 ) ) ( not ( = ?auto_228791 ?auto_228793 ) ) ( not ( = ?auto_228791 ?auto_228796 ) ) ( not ( = ?auto_228788 ?auto_228792 ) ) ( not ( = ?auto_228788 ?auto_228794 ) ) ( not ( = ?auto_228788 ?auto_228793 ) ) ( not ( = ?auto_228788 ?auto_228796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228792 ?auto_228794 ?auto_228793 )
      ( MAKE-6CRATE-VERIFY ?auto_228789 ?auto_228790 ?auto_228791 ?auto_228788 ?auto_228792 ?auto_228794 ?auto_228793 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228853 - SURFACE
      ?auto_228854 - SURFACE
      ?auto_228855 - SURFACE
      ?auto_228852 - SURFACE
      ?auto_228856 - SURFACE
      ?auto_228858 - SURFACE
      ?auto_228857 - SURFACE
    )
    :vars
    (
      ?auto_228860 - HOIST
      ?auto_228862 - PLACE
      ?auto_228864 - PLACE
      ?auto_228861 - HOIST
      ?auto_228863 - SURFACE
      ?auto_228859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228860 ?auto_228862 ) ( SURFACE-AT ?auto_228858 ?auto_228862 ) ( CLEAR ?auto_228858 ) ( IS-CRATE ?auto_228857 ) ( not ( = ?auto_228858 ?auto_228857 ) ) ( AVAILABLE ?auto_228860 ) ( ON ?auto_228858 ?auto_228856 ) ( not ( = ?auto_228856 ?auto_228858 ) ) ( not ( = ?auto_228856 ?auto_228857 ) ) ( not ( = ?auto_228864 ?auto_228862 ) ) ( HOIST-AT ?auto_228861 ?auto_228864 ) ( not ( = ?auto_228860 ?auto_228861 ) ) ( AVAILABLE ?auto_228861 ) ( SURFACE-AT ?auto_228857 ?auto_228864 ) ( ON ?auto_228857 ?auto_228863 ) ( CLEAR ?auto_228857 ) ( not ( = ?auto_228858 ?auto_228863 ) ) ( not ( = ?auto_228857 ?auto_228863 ) ) ( not ( = ?auto_228856 ?auto_228863 ) ) ( TRUCK-AT ?auto_228859 ?auto_228862 ) ( ON ?auto_228854 ?auto_228853 ) ( ON ?auto_228855 ?auto_228854 ) ( ON ?auto_228852 ?auto_228855 ) ( ON ?auto_228856 ?auto_228852 ) ( not ( = ?auto_228853 ?auto_228854 ) ) ( not ( = ?auto_228853 ?auto_228855 ) ) ( not ( = ?auto_228853 ?auto_228852 ) ) ( not ( = ?auto_228853 ?auto_228856 ) ) ( not ( = ?auto_228853 ?auto_228858 ) ) ( not ( = ?auto_228853 ?auto_228857 ) ) ( not ( = ?auto_228853 ?auto_228863 ) ) ( not ( = ?auto_228854 ?auto_228855 ) ) ( not ( = ?auto_228854 ?auto_228852 ) ) ( not ( = ?auto_228854 ?auto_228856 ) ) ( not ( = ?auto_228854 ?auto_228858 ) ) ( not ( = ?auto_228854 ?auto_228857 ) ) ( not ( = ?auto_228854 ?auto_228863 ) ) ( not ( = ?auto_228855 ?auto_228852 ) ) ( not ( = ?auto_228855 ?auto_228856 ) ) ( not ( = ?auto_228855 ?auto_228858 ) ) ( not ( = ?auto_228855 ?auto_228857 ) ) ( not ( = ?auto_228855 ?auto_228863 ) ) ( not ( = ?auto_228852 ?auto_228856 ) ) ( not ( = ?auto_228852 ?auto_228858 ) ) ( not ( = ?auto_228852 ?auto_228857 ) ) ( not ( = ?auto_228852 ?auto_228863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228856 ?auto_228858 ?auto_228857 )
      ( MAKE-6CRATE-VERIFY ?auto_228853 ?auto_228854 ?auto_228855 ?auto_228852 ?auto_228856 ?auto_228858 ?auto_228857 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228917 - SURFACE
      ?auto_228918 - SURFACE
      ?auto_228919 - SURFACE
      ?auto_228916 - SURFACE
      ?auto_228920 - SURFACE
      ?auto_228922 - SURFACE
      ?auto_228921 - SURFACE
    )
    :vars
    (
      ?auto_228924 - HOIST
      ?auto_228928 - PLACE
      ?auto_228923 - PLACE
      ?auto_228927 - HOIST
      ?auto_228926 - SURFACE
      ?auto_228925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228924 ?auto_228928 ) ( IS-CRATE ?auto_228921 ) ( not ( = ?auto_228922 ?auto_228921 ) ) ( not ( = ?auto_228920 ?auto_228922 ) ) ( not ( = ?auto_228920 ?auto_228921 ) ) ( not ( = ?auto_228923 ?auto_228928 ) ) ( HOIST-AT ?auto_228927 ?auto_228923 ) ( not ( = ?auto_228924 ?auto_228927 ) ) ( AVAILABLE ?auto_228927 ) ( SURFACE-AT ?auto_228921 ?auto_228923 ) ( ON ?auto_228921 ?auto_228926 ) ( CLEAR ?auto_228921 ) ( not ( = ?auto_228922 ?auto_228926 ) ) ( not ( = ?auto_228921 ?auto_228926 ) ) ( not ( = ?auto_228920 ?auto_228926 ) ) ( TRUCK-AT ?auto_228925 ?auto_228928 ) ( SURFACE-AT ?auto_228920 ?auto_228928 ) ( CLEAR ?auto_228920 ) ( LIFTING ?auto_228924 ?auto_228922 ) ( IS-CRATE ?auto_228922 ) ( ON ?auto_228918 ?auto_228917 ) ( ON ?auto_228919 ?auto_228918 ) ( ON ?auto_228916 ?auto_228919 ) ( ON ?auto_228920 ?auto_228916 ) ( not ( = ?auto_228917 ?auto_228918 ) ) ( not ( = ?auto_228917 ?auto_228919 ) ) ( not ( = ?auto_228917 ?auto_228916 ) ) ( not ( = ?auto_228917 ?auto_228920 ) ) ( not ( = ?auto_228917 ?auto_228922 ) ) ( not ( = ?auto_228917 ?auto_228921 ) ) ( not ( = ?auto_228917 ?auto_228926 ) ) ( not ( = ?auto_228918 ?auto_228919 ) ) ( not ( = ?auto_228918 ?auto_228916 ) ) ( not ( = ?auto_228918 ?auto_228920 ) ) ( not ( = ?auto_228918 ?auto_228922 ) ) ( not ( = ?auto_228918 ?auto_228921 ) ) ( not ( = ?auto_228918 ?auto_228926 ) ) ( not ( = ?auto_228919 ?auto_228916 ) ) ( not ( = ?auto_228919 ?auto_228920 ) ) ( not ( = ?auto_228919 ?auto_228922 ) ) ( not ( = ?auto_228919 ?auto_228921 ) ) ( not ( = ?auto_228919 ?auto_228926 ) ) ( not ( = ?auto_228916 ?auto_228920 ) ) ( not ( = ?auto_228916 ?auto_228922 ) ) ( not ( = ?auto_228916 ?auto_228921 ) ) ( not ( = ?auto_228916 ?auto_228926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228920 ?auto_228922 ?auto_228921 )
      ( MAKE-6CRATE-VERIFY ?auto_228917 ?auto_228918 ?auto_228919 ?auto_228916 ?auto_228920 ?auto_228922 ?auto_228921 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228981 - SURFACE
      ?auto_228982 - SURFACE
      ?auto_228983 - SURFACE
      ?auto_228980 - SURFACE
      ?auto_228984 - SURFACE
      ?auto_228986 - SURFACE
      ?auto_228985 - SURFACE
    )
    :vars
    (
      ?auto_228992 - HOIST
      ?auto_228989 - PLACE
      ?auto_228987 - PLACE
      ?auto_228991 - HOIST
      ?auto_228988 - SURFACE
      ?auto_228990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228992 ?auto_228989 ) ( IS-CRATE ?auto_228985 ) ( not ( = ?auto_228986 ?auto_228985 ) ) ( not ( = ?auto_228984 ?auto_228986 ) ) ( not ( = ?auto_228984 ?auto_228985 ) ) ( not ( = ?auto_228987 ?auto_228989 ) ) ( HOIST-AT ?auto_228991 ?auto_228987 ) ( not ( = ?auto_228992 ?auto_228991 ) ) ( AVAILABLE ?auto_228991 ) ( SURFACE-AT ?auto_228985 ?auto_228987 ) ( ON ?auto_228985 ?auto_228988 ) ( CLEAR ?auto_228985 ) ( not ( = ?auto_228986 ?auto_228988 ) ) ( not ( = ?auto_228985 ?auto_228988 ) ) ( not ( = ?auto_228984 ?auto_228988 ) ) ( TRUCK-AT ?auto_228990 ?auto_228989 ) ( SURFACE-AT ?auto_228984 ?auto_228989 ) ( CLEAR ?auto_228984 ) ( IS-CRATE ?auto_228986 ) ( AVAILABLE ?auto_228992 ) ( IN ?auto_228986 ?auto_228990 ) ( ON ?auto_228982 ?auto_228981 ) ( ON ?auto_228983 ?auto_228982 ) ( ON ?auto_228980 ?auto_228983 ) ( ON ?auto_228984 ?auto_228980 ) ( not ( = ?auto_228981 ?auto_228982 ) ) ( not ( = ?auto_228981 ?auto_228983 ) ) ( not ( = ?auto_228981 ?auto_228980 ) ) ( not ( = ?auto_228981 ?auto_228984 ) ) ( not ( = ?auto_228981 ?auto_228986 ) ) ( not ( = ?auto_228981 ?auto_228985 ) ) ( not ( = ?auto_228981 ?auto_228988 ) ) ( not ( = ?auto_228982 ?auto_228983 ) ) ( not ( = ?auto_228982 ?auto_228980 ) ) ( not ( = ?auto_228982 ?auto_228984 ) ) ( not ( = ?auto_228982 ?auto_228986 ) ) ( not ( = ?auto_228982 ?auto_228985 ) ) ( not ( = ?auto_228982 ?auto_228988 ) ) ( not ( = ?auto_228983 ?auto_228980 ) ) ( not ( = ?auto_228983 ?auto_228984 ) ) ( not ( = ?auto_228983 ?auto_228986 ) ) ( not ( = ?auto_228983 ?auto_228985 ) ) ( not ( = ?auto_228983 ?auto_228988 ) ) ( not ( = ?auto_228980 ?auto_228984 ) ) ( not ( = ?auto_228980 ?auto_228986 ) ) ( not ( = ?auto_228980 ?auto_228985 ) ) ( not ( = ?auto_228980 ?auto_228988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228984 ?auto_228986 ?auto_228985 )
      ( MAKE-6CRATE-VERIFY ?auto_228981 ?auto_228982 ?auto_228983 ?auto_228980 ?auto_228984 ?auto_228986 ?auto_228985 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_229852 - SURFACE
      ?auto_229853 - SURFACE
    )
    :vars
    (
      ?auto_229858 - HOIST
      ?auto_229855 - PLACE
      ?auto_229860 - SURFACE
      ?auto_229857 - TRUCK
      ?auto_229856 - PLACE
      ?auto_229859 - HOIST
      ?auto_229854 - SURFACE
      ?auto_229861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_229858 ?auto_229855 ) ( SURFACE-AT ?auto_229852 ?auto_229855 ) ( CLEAR ?auto_229852 ) ( IS-CRATE ?auto_229853 ) ( not ( = ?auto_229852 ?auto_229853 ) ) ( AVAILABLE ?auto_229858 ) ( ON ?auto_229852 ?auto_229860 ) ( not ( = ?auto_229860 ?auto_229852 ) ) ( not ( = ?auto_229860 ?auto_229853 ) ) ( TRUCK-AT ?auto_229857 ?auto_229856 ) ( not ( = ?auto_229856 ?auto_229855 ) ) ( HOIST-AT ?auto_229859 ?auto_229856 ) ( not ( = ?auto_229858 ?auto_229859 ) ) ( SURFACE-AT ?auto_229853 ?auto_229856 ) ( ON ?auto_229853 ?auto_229854 ) ( CLEAR ?auto_229853 ) ( not ( = ?auto_229852 ?auto_229854 ) ) ( not ( = ?auto_229853 ?auto_229854 ) ) ( not ( = ?auto_229860 ?auto_229854 ) ) ( LIFTING ?auto_229859 ?auto_229861 ) ( IS-CRATE ?auto_229861 ) ( not ( = ?auto_229852 ?auto_229861 ) ) ( not ( = ?auto_229853 ?auto_229861 ) ) ( not ( = ?auto_229860 ?auto_229861 ) ) ( not ( = ?auto_229854 ?auto_229861 ) ) )
    :subtasks
    ( ( !LOAD ?auto_229859 ?auto_229861 ?auto_229857 ?auto_229856 )
      ( MAKE-1CRATE ?auto_229852 ?auto_229853 )
      ( MAKE-1CRATE-VERIFY ?auto_229852 ?auto_229853 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230906 - SURFACE
      ?auto_230907 - SURFACE
      ?auto_230908 - SURFACE
      ?auto_230905 - SURFACE
      ?auto_230909 - SURFACE
      ?auto_230911 - SURFACE
      ?auto_230910 - SURFACE
      ?auto_230912 - SURFACE
    )
    :vars
    (
      ?auto_230914 - HOIST
      ?auto_230913 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_230914 ?auto_230913 ) ( SURFACE-AT ?auto_230910 ?auto_230913 ) ( CLEAR ?auto_230910 ) ( LIFTING ?auto_230914 ?auto_230912 ) ( IS-CRATE ?auto_230912 ) ( not ( = ?auto_230910 ?auto_230912 ) ) ( ON ?auto_230907 ?auto_230906 ) ( ON ?auto_230908 ?auto_230907 ) ( ON ?auto_230905 ?auto_230908 ) ( ON ?auto_230909 ?auto_230905 ) ( ON ?auto_230911 ?auto_230909 ) ( ON ?auto_230910 ?auto_230911 ) ( not ( = ?auto_230906 ?auto_230907 ) ) ( not ( = ?auto_230906 ?auto_230908 ) ) ( not ( = ?auto_230906 ?auto_230905 ) ) ( not ( = ?auto_230906 ?auto_230909 ) ) ( not ( = ?auto_230906 ?auto_230911 ) ) ( not ( = ?auto_230906 ?auto_230910 ) ) ( not ( = ?auto_230906 ?auto_230912 ) ) ( not ( = ?auto_230907 ?auto_230908 ) ) ( not ( = ?auto_230907 ?auto_230905 ) ) ( not ( = ?auto_230907 ?auto_230909 ) ) ( not ( = ?auto_230907 ?auto_230911 ) ) ( not ( = ?auto_230907 ?auto_230910 ) ) ( not ( = ?auto_230907 ?auto_230912 ) ) ( not ( = ?auto_230908 ?auto_230905 ) ) ( not ( = ?auto_230908 ?auto_230909 ) ) ( not ( = ?auto_230908 ?auto_230911 ) ) ( not ( = ?auto_230908 ?auto_230910 ) ) ( not ( = ?auto_230908 ?auto_230912 ) ) ( not ( = ?auto_230905 ?auto_230909 ) ) ( not ( = ?auto_230905 ?auto_230911 ) ) ( not ( = ?auto_230905 ?auto_230910 ) ) ( not ( = ?auto_230905 ?auto_230912 ) ) ( not ( = ?auto_230909 ?auto_230911 ) ) ( not ( = ?auto_230909 ?auto_230910 ) ) ( not ( = ?auto_230909 ?auto_230912 ) ) ( not ( = ?auto_230911 ?auto_230910 ) ) ( not ( = ?auto_230911 ?auto_230912 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_230910 ?auto_230912 )
      ( MAKE-7CRATE-VERIFY ?auto_230906 ?auto_230907 ?auto_230908 ?auto_230905 ?auto_230909 ?auto_230911 ?auto_230910 ?auto_230912 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230961 - SURFACE
      ?auto_230962 - SURFACE
      ?auto_230963 - SURFACE
      ?auto_230960 - SURFACE
      ?auto_230964 - SURFACE
      ?auto_230966 - SURFACE
      ?auto_230965 - SURFACE
      ?auto_230967 - SURFACE
    )
    :vars
    (
      ?auto_230969 - HOIST
      ?auto_230968 - PLACE
      ?auto_230970 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_230969 ?auto_230968 ) ( SURFACE-AT ?auto_230965 ?auto_230968 ) ( CLEAR ?auto_230965 ) ( IS-CRATE ?auto_230967 ) ( not ( = ?auto_230965 ?auto_230967 ) ) ( TRUCK-AT ?auto_230970 ?auto_230968 ) ( AVAILABLE ?auto_230969 ) ( IN ?auto_230967 ?auto_230970 ) ( ON ?auto_230965 ?auto_230966 ) ( not ( = ?auto_230966 ?auto_230965 ) ) ( not ( = ?auto_230966 ?auto_230967 ) ) ( ON ?auto_230962 ?auto_230961 ) ( ON ?auto_230963 ?auto_230962 ) ( ON ?auto_230960 ?auto_230963 ) ( ON ?auto_230964 ?auto_230960 ) ( ON ?auto_230966 ?auto_230964 ) ( not ( = ?auto_230961 ?auto_230962 ) ) ( not ( = ?auto_230961 ?auto_230963 ) ) ( not ( = ?auto_230961 ?auto_230960 ) ) ( not ( = ?auto_230961 ?auto_230964 ) ) ( not ( = ?auto_230961 ?auto_230966 ) ) ( not ( = ?auto_230961 ?auto_230965 ) ) ( not ( = ?auto_230961 ?auto_230967 ) ) ( not ( = ?auto_230962 ?auto_230963 ) ) ( not ( = ?auto_230962 ?auto_230960 ) ) ( not ( = ?auto_230962 ?auto_230964 ) ) ( not ( = ?auto_230962 ?auto_230966 ) ) ( not ( = ?auto_230962 ?auto_230965 ) ) ( not ( = ?auto_230962 ?auto_230967 ) ) ( not ( = ?auto_230963 ?auto_230960 ) ) ( not ( = ?auto_230963 ?auto_230964 ) ) ( not ( = ?auto_230963 ?auto_230966 ) ) ( not ( = ?auto_230963 ?auto_230965 ) ) ( not ( = ?auto_230963 ?auto_230967 ) ) ( not ( = ?auto_230960 ?auto_230964 ) ) ( not ( = ?auto_230960 ?auto_230966 ) ) ( not ( = ?auto_230960 ?auto_230965 ) ) ( not ( = ?auto_230960 ?auto_230967 ) ) ( not ( = ?auto_230964 ?auto_230966 ) ) ( not ( = ?auto_230964 ?auto_230965 ) ) ( not ( = ?auto_230964 ?auto_230967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230966 ?auto_230965 ?auto_230967 )
      ( MAKE-7CRATE-VERIFY ?auto_230961 ?auto_230962 ?auto_230963 ?auto_230960 ?auto_230964 ?auto_230966 ?auto_230965 ?auto_230967 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231024 - SURFACE
      ?auto_231025 - SURFACE
      ?auto_231026 - SURFACE
      ?auto_231023 - SURFACE
      ?auto_231027 - SURFACE
      ?auto_231029 - SURFACE
      ?auto_231028 - SURFACE
      ?auto_231030 - SURFACE
    )
    :vars
    (
      ?auto_231031 - HOIST
      ?auto_231034 - PLACE
      ?auto_231033 - TRUCK
      ?auto_231032 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_231031 ?auto_231034 ) ( SURFACE-AT ?auto_231028 ?auto_231034 ) ( CLEAR ?auto_231028 ) ( IS-CRATE ?auto_231030 ) ( not ( = ?auto_231028 ?auto_231030 ) ) ( AVAILABLE ?auto_231031 ) ( IN ?auto_231030 ?auto_231033 ) ( ON ?auto_231028 ?auto_231029 ) ( not ( = ?auto_231029 ?auto_231028 ) ) ( not ( = ?auto_231029 ?auto_231030 ) ) ( TRUCK-AT ?auto_231033 ?auto_231032 ) ( not ( = ?auto_231032 ?auto_231034 ) ) ( ON ?auto_231025 ?auto_231024 ) ( ON ?auto_231026 ?auto_231025 ) ( ON ?auto_231023 ?auto_231026 ) ( ON ?auto_231027 ?auto_231023 ) ( ON ?auto_231029 ?auto_231027 ) ( not ( = ?auto_231024 ?auto_231025 ) ) ( not ( = ?auto_231024 ?auto_231026 ) ) ( not ( = ?auto_231024 ?auto_231023 ) ) ( not ( = ?auto_231024 ?auto_231027 ) ) ( not ( = ?auto_231024 ?auto_231029 ) ) ( not ( = ?auto_231024 ?auto_231028 ) ) ( not ( = ?auto_231024 ?auto_231030 ) ) ( not ( = ?auto_231025 ?auto_231026 ) ) ( not ( = ?auto_231025 ?auto_231023 ) ) ( not ( = ?auto_231025 ?auto_231027 ) ) ( not ( = ?auto_231025 ?auto_231029 ) ) ( not ( = ?auto_231025 ?auto_231028 ) ) ( not ( = ?auto_231025 ?auto_231030 ) ) ( not ( = ?auto_231026 ?auto_231023 ) ) ( not ( = ?auto_231026 ?auto_231027 ) ) ( not ( = ?auto_231026 ?auto_231029 ) ) ( not ( = ?auto_231026 ?auto_231028 ) ) ( not ( = ?auto_231026 ?auto_231030 ) ) ( not ( = ?auto_231023 ?auto_231027 ) ) ( not ( = ?auto_231023 ?auto_231029 ) ) ( not ( = ?auto_231023 ?auto_231028 ) ) ( not ( = ?auto_231023 ?auto_231030 ) ) ( not ( = ?auto_231027 ?auto_231029 ) ) ( not ( = ?auto_231027 ?auto_231028 ) ) ( not ( = ?auto_231027 ?auto_231030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231029 ?auto_231028 ?auto_231030 )
      ( MAKE-7CRATE-VERIFY ?auto_231024 ?auto_231025 ?auto_231026 ?auto_231023 ?auto_231027 ?auto_231029 ?auto_231028 ?auto_231030 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231094 - SURFACE
      ?auto_231095 - SURFACE
      ?auto_231096 - SURFACE
      ?auto_231093 - SURFACE
      ?auto_231097 - SURFACE
      ?auto_231099 - SURFACE
      ?auto_231098 - SURFACE
      ?auto_231100 - SURFACE
    )
    :vars
    (
      ?auto_231102 - HOIST
      ?auto_231101 - PLACE
      ?auto_231104 - TRUCK
      ?auto_231105 - PLACE
      ?auto_231103 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_231102 ?auto_231101 ) ( SURFACE-AT ?auto_231098 ?auto_231101 ) ( CLEAR ?auto_231098 ) ( IS-CRATE ?auto_231100 ) ( not ( = ?auto_231098 ?auto_231100 ) ) ( AVAILABLE ?auto_231102 ) ( ON ?auto_231098 ?auto_231099 ) ( not ( = ?auto_231099 ?auto_231098 ) ) ( not ( = ?auto_231099 ?auto_231100 ) ) ( TRUCK-AT ?auto_231104 ?auto_231105 ) ( not ( = ?auto_231105 ?auto_231101 ) ) ( HOIST-AT ?auto_231103 ?auto_231105 ) ( LIFTING ?auto_231103 ?auto_231100 ) ( not ( = ?auto_231102 ?auto_231103 ) ) ( ON ?auto_231095 ?auto_231094 ) ( ON ?auto_231096 ?auto_231095 ) ( ON ?auto_231093 ?auto_231096 ) ( ON ?auto_231097 ?auto_231093 ) ( ON ?auto_231099 ?auto_231097 ) ( not ( = ?auto_231094 ?auto_231095 ) ) ( not ( = ?auto_231094 ?auto_231096 ) ) ( not ( = ?auto_231094 ?auto_231093 ) ) ( not ( = ?auto_231094 ?auto_231097 ) ) ( not ( = ?auto_231094 ?auto_231099 ) ) ( not ( = ?auto_231094 ?auto_231098 ) ) ( not ( = ?auto_231094 ?auto_231100 ) ) ( not ( = ?auto_231095 ?auto_231096 ) ) ( not ( = ?auto_231095 ?auto_231093 ) ) ( not ( = ?auto_231095 ?auto_231097 ) ) ( not ( = ?auto_231095 ?auto_231099 ) ) ( not ( = ?auto_231095 ?auto_231098 ) ) ( not ( = ?auto_231095 ?auto_231100 ) ) ( not ( = ?auto_231096 ?auto_231093 ) ) ( not ( = ?auto_231096 ?auto_231097 ) ) ( not ( = ?auto_231096 ?auto_231099 ) ) ( not ( = ?auto_231096 ?auto_231098 ) ) ( not ( = ?auto_231096 ?auto_231100 ) ) ( not ( = ?auto_231093 ?auto_231097 ) ) ( not ( = ?auto_231093 ?auto_231099 ) ) ( not ( = ?auto_231093 ?auto_231098 ) ) ( not ( = ?auto_231093 ?auto_231100 ) ) ( not ( = ?auto_231097 ?auto_231099 ) ) ( not ( = ?auto_231097 ?auto_231098 ) ) ( not ( = ?auto_231097 ?auto_231100 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231099 ?auto_231098 ?auto_231100 )
      ( MAKE-7CRATE-VERIFY ?auto_231094 ?auto_231095 ?auto_231096 ?auto_231093 ?auto_231097 ?auto_231099 ?auto_231098 ?auto_231100 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231171 - SURFACE
      ?auto_231172 - SURFACE
      ?auto_231173 - SURFACE
      ?auto_231170 - SURFACE
      ?auto_231174 - SURFACE
      ?auto_231176 - SURFACE
      ?auto_231175 - SURFACE
      ?auto_231177 - SURFACE
    )
    :vars
    (
      ?auto_231182 - HOIST
      ?auto_231178 - PLACE
      ?auto_231179 - TRUCK
      ?auto_231180 - PLACE
      ?auto_231181 - HOIST
      ?auto_231183 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_231182 ?auto_231178 ) ( SURFACE-AT ?auto_231175 ?auto_231178 ) ( CLEAR ?auto_231175 ) ( IS-CRATE ?auto_231177 ) ( not ( = ?auto_231175 ?auto_231177 ) ) ( AVAILABLE ?auto_231182 ) ( ON ?auto_231175 ?auto_231176 ) ( not ( = ?auto_231176 ?auto_231175 ) ) ( not ( = ?auto_231176 ?auto_231177 ) ) ( TRUCK-AT ?auto_231179 ?auto_231180 ) ( not ( = ?auto_231180 ?auto_231178 ) ) ( HOIST-AT ?auto_231181 ?auto_231180 ) ( not ( = ?auto_231182 ?auto_231181 ) ) ( AVAILABLE ?auto_231181 ) ( SURFACE-AT ?auto_231177 ?auto_231180 ) ( ON ?auto_231177 ?auto_231183 ) ( CLEAR ?auto_231177 ) ( not ( = ?auto_231175 ?auto_231183 ) ) ( not ( = ?auto_231177 ?auto_231183 ) ) ( not ( = ?auto_231176 ?auto_231183 ) ) ( ON ?auto_231172 ?auto_231171 ) ( ON ?auto_231173 ?auto_231172 ) ( ON ?auto_231170 ?auto_231173 ) ( ON ?auto_231174 ?auto_231170 ) ( ON ?auto_231176 ?auto_231174 ) ( not ( = ?auto_231171 ?auto_231172 ) ) ( not ( = ?auto_231171 ?auto_231173 ) ) ( not ( = ?auto_231171 ?auto_231170 ) ) ( not ( = ?auto_231171 ?auto_231174 ) ) ( not ( = ?auto_231171 ?auto_231176 ) ) ( not ( = ?auto_231171 ?auto_231175 ) ) ( not ( = ?auto_231171 ?auto_231177 ) ) ( not ( = ?auto_231171 ?auto_231183 ) ) ( not ( = ?auto_231172 ?auto_231173 ) ) ( not ( = ?auto_231172 ?auto_231170 ) ) ( not ( = ?auto_231172 ?auto_231174 ) ) ( not ( = ?auto_231172 ?auto_231176 ) ) ( not ( = ?auto_231172 ?auto_231175 ) ) ( not ( = ?auto_231172 ?auto_231177 ) ) ( not ( = ?auto_231172 ?auto_231183 ) ) ( not ( = ?auto_231173 ?auto_231170 ) ) ( not ( = ?auto_231173 ?auto_231174 ) ) ( not ( = ?auto_231173 ?auto_231176 ) ) ( not ( = ?auto_231173 ?auto_231175 ) ) ( not ( = ?auto_231173 ?auto_231177 ) ) ( not ( = ?auto_231173 ?auto_231183 ) ) ( not ( = ?auto_231170 ?auto_231174 ) ) ( not ( = ?auto_231170 ?auto_231176 ) ) ( not ( = ?auto_231170 ?auto_231175 ) ) ( not ( = ?auto_231170 ?auto_231177 ) ) ( not ( = ?auto_231170 ?auto_231183 ) ) ( not ( = ?auto_231174 ?auto_231176 ) ) ( not ( = ?auto_231174 ?auto_231175 ) ) ( not ( = ?auto_231174 ?auto_231177 ) ) ( not ( = ?auto_231174 ?auto_231183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231176 ?auto_231175 ?auto_231177 )
      ( MAKE-7CRATE-VERIFY ?auto_231171 ?auto_231172 ?auto_231173 ?auto_231170 ?auto_231174 ?auto_231176 ?auto_231175 ?auto_231177 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231249 - SURFACE
      ?auto_231250 - SURFACE
      ?auto_231251 - SURFACE
      ?auto_231248 - SURFACE
      ?auto_231252 - SURFACE
      ?auto_231254 - SURFACE
      ?auto_231253 - SURFACE
      ?auto_231255 - SURFACE
    )
    :vars
    (
      ?auto_231259 - HOIST
      ?auto_231258 - PLACE
      ?auto_231261 - PLACE
      ?auto_231260 - HOIST
      ?auto_231256 - SURFACE
      ?auto_231257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_231259 ?auto_231258 ) ( SURFACE-AT ?auto_231253 ?auto_231258 ) ( CLEAR ?auto_231253 ) ( IS-CRATE ?auto_231255 ) ( not ( = ?auto_231253 ?auto_231255 ) ) ( AVAILABLE ?auto_231259 ) ( ON ?auto_231253 ?auto_231254 ) ( not ( = ?auto_231254 ?auto_231253 ) ) ( not ( = ?auto_231254 ?auto_231255 ) ) ( not ( = ?auto_231261 ?auto_231258 ) ) ( HOIST-AT ?auto_231260 ?auto_231261 ) ( not ( = ?auto_231259 ?auto_231260 ) ) ( AVAILABLE ?auto_231260 ) ( SURFACE-AT ?auto_231255 ?auto_231261 ) ( ON ?auto_231255 ?auto_231256 ) ( CLEAR ?auto_231255 ) ( not ( = ?auto_231253 ?auto_231256 ) ) ( not ( = ?auto_231255 ?auto_231256 ) ) ( not ( = ?auto_231254 ?auto_231256 ) ) ( TRUCK-AT ?auto_231257 ?auto_231258 ) ( ON ?auto_231250 ?auto_231249 ) ( ON ?auto_231251 ?auto_231250 ) ( ON ?auto_231248 ?auto_231251 ) ( ON ?auto_231252 ?auto_231248 ) ( ON ?auto_231254 ?auto_231252 ) ( not ( = ?auto_231249 ?auto_231250 ) ) ( not ( = ?auto_231249 ?auto_231251 ) ) ( not ( = ?auto_231249 ?auto_231248 ) ) ( not ( = ?auto_231249 ?auto_231252 ) ) ( not ( = ?auto_231249 ?auto_231254 ) ) ( not ( = ?auto_231249 ?auto_231253 ) ) ( not ( = ?auto_231249 ?auto_231255 ) ) ( not ( = ?auto_231249 ?auto_231256 ) ) ( not ( = ?auto_231250 ?auto_231251 ) ) ( not ( = ?auto_231250 ?auto_231248 ) ) ( not ( = ?auto_231250 ?auto_231252 ) ) ( not ( = ?auto_231250 ?auto_231254 ) ) ( not ( = ?auto_231250 ?auto_231253 ) ) ( not ( = ?auto_231250 ?auto_231255 ) ) ( not ( = ?auto_231250 ?auto_231256 ) ) ( not ( = ?auto_231251 ?auto_231248 ) ) ( not ( = ?auto_231251 ?auto_231252 ) ) ( not ( = ?auto_231251 ?auto_231254 ) ) ( not ( = ?auto_231251 ?auto_231253 ) ) ( not ( = ?auto_231251 ?auto_231255 ) ) ( not ( = ?auto_231251 ?auto_231256 ) ) ( not ( = ?auto_231248 ?auto_231252 ) ) ( not ( = ?auto_231248 ?auto_231254 ) ) ( not ( = ?auto_231248 ?auto_231253 ) ) ( not ( = ?auto_231248 ?auto_231255 ) ) ( not ( = ?auto_231248 ?auto_231256 ) ) ( not ( = ?auto_231252 ?auto_231254 ) ) ( not ( = ?auto_231252 ?auto_231253 ) ) ( not ( = ?auto_231252 ?auto_231255 ) ) ( not ( = ?auto_231252 ?auto_231256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231254 ?auto_231253 ?auto_231255 )
      ( MAKE-7CRATE-VERIFY ?auto_231249 ?auto_231250 ?auto_231251 ?auto_231248 ?auto_231252 ?auto_231254 ?auto_231253 ?auto_231255 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231327 - SURFACE
      ?auto_231328 - SURFACE
      ?auto_231329 - SURFACE
      ?auto_231326 - SURFACE
      ?auto_231330 - SURFACE
      ?auto_231332 - SURFACE
      ?auto_231331 - SURFACE
      ?auto_231333 - SURFACE
    )
    :vars
    (
      ?auto_231337 - HOIST
      ?auto_231334 - PLACE
      ?auto_231335 - PLACE
      ?auto_231338 - HOIST
      ?auto_231336 - SURFACE
      ?auto_231339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_231337 ?auto_231334 ) ( IS-CRATE ?auto_231333 ) ( not ( = ?auto_231331 ?auto_231333 ) ) ( not ( = ?auto_231332 ?auto_231331 ) ) ( not ( = ?auto_231332 ?auto_231333 ) ) ( not ( = ?auto_231335 ?auto_231334 ) ) ( HOIST-AT ?auto_231338 ?auto_231335 ) ( not ( = ?auto_231337 ?auto_231338 ) ) ( AVAILABLE ?auto_231338 ) ( SURFACE-AT ?auto_231333 ?auto_231335 ) ( ON ?auto_231333 ?auto_231336 ) ( CLEAR ?auto_231333 ) ( not ( = ?auto_231331 ?auto_231336 ) ) ( not ( = ?auto_231333 ?auto_231336 ) ) ( not ( = ?auto_231332 ?auto_231336 ) ) ( TRUCK-AT ?auto_231339 ?auto_231334 ) ( SURFACE-AT ?auto_231332 ?auto_231334 ) ( CLEAR ?auto_231332 ) ( LIFTING ?auto_231337 ?auto_231331 ) ( IS-CRATE ?auto_231331 ) ( ON ?auto_231328 ?auto_231327 ) ( ON ?auto_231329 ?auto_231328 ) ( ON ?auto_231326 ?auto_231329 ) ( ON ?auto_231330 ?auto_231326 ) ( ON ?auto_231332 ?auto_231330 ) ( not ( = ?auto_231327 ?auto_231328 ) ) ( not ( = ?auto_231327 ?auto_231329 ) ) ( not ( = ?auto_231327 ?auto_231326 ) ) ( not ( = ?auto_231327 ?auto_231330 ) ) ( not ( = ?auto_231327 ?auto_231332 ) ) ( not ( = ?auto_231327 ?auto_231331 ) ) ( not ( = ?auto_231327 ?auto_231333 ) ) ( not ( = ?auto_231327 ?auto_231336 ) ) ( not ( = ?auto_231328 ?auto_231329 ) ) ( not ( = ?auto_231328 ?auto_231326 ) ) ( not ( = ?auto_231328 ?auto_231330 ) ) ( not ( = ?auto_231328 ?auto_231332 ) ) ( not ( = ?auto_231328 ?auto_231331 ) ) ( not ( = ?auto_231328 ?auto_231333 ) ) ( not ( = ?auto_231328 ?auto_231336 ) ) ( not ( = ?auto_231329 ?auto_231326 ) ) ( not ( = ?auto_231329 ?auto_231330 ) ) ( not ( = ?auto_231329 ?auto_231332 ) ) ( not ( = ?auto_231329 ?auto_231331 ) ) ( not ( = ?auto_231329 ?auto_231333 ) ) ( not ( = ?auto_231329 ?auto_231336 ) ) ( not ( = ?auto_231326 ?auto_231330 ) ) ( not ( = ?auto_231326 ?auto_231332 ) ) ( not ( = ?auto_231326 ?auto_231331 ) ) ( not ( = ?auto_231326 ?auto_231333 ) ) ( not ( = ?auto_231326 ?auto_231336 ) ) ( not ( = ?auto_231330 ?auto_231332 ) ) ( not ( = ?auto_231330 ?auto_231331 ) ) ( not ( = ?auto_231330 ?auto_231333 ) ) ( not ( = ?auto_231330 ?auto_231336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231332 ?auto_231331 ?auto_231333 )
      ( MAKE-7CRATE-VERIFY ?auto_231327 ?auto_231328 ?auto_231329 ?auto_231326 ?auto_231330 ?auto_231332 ?auto_231331 ?auto_231333 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231405 - SURFACE
      ?auto_231406 - SURFACE
      ?auto_231407 - SURFACE
      ?auto_231404 - SURFACE
      ?auto_231408 - SURFACE
      ?auto_231410 - SURFACE
      ?auto_231409 - SURFACE
      ?auto_231411 - SURFACE
    )
    :vars
    (
      ?auto_231417 - HOIST
      ?auto_231416 - PLACE
      ?auto_231415 - PLACE
      ?auto_231412 - HOIST
      ?auto_231413 - SURFACE
      ?auto_231414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_231417 ?auto_231416 ) ( IS-CRATE ?auto_231411 ) ( not ( = ?auto_231409 ?auto_231411 ) ) ( not ( = ?auto_231410 ?auto_231409 ) ) ( not ( = ?auto_231410 ?auto_231411 ) ) ( not ( = ?auto_231415 ?auto_231416 ) ) ( HOIST-AT ?auto_231412 ?auto_231415 ) ( not ( = ?auto_231417 ?auto_231412 ) ) ( AVAILABLE ?auto_231412 ) ( SURFACE-AT ?auto_231411 ?auto_231415 ) ( ON ?auto_231411 ?auto_231413 ) ( CLEAR ?auto_231411 ) ( not ( = ?auto_231409 ?auto_231413 ) ) ( not ( = ?auto_231411 ?auto_231413 ) ) ( not ( = ?auto_231410 ?auto_231413 ) ) ( TRUCK-AT ?auto_231414 ?auto_231416 ) ( SURFACE-AT ?auto_231410 ?auto_231416 ) ( CLEAR ?auto_231410 ) ( IS-CRATE ?auto_231409 ) ( AVAILABLE ?auto_231417 ) ( IN ?auto_231409 ?auto_231414 ) ( ON ?auto_231406 ?auto_231405 ) ( ON ?auto_231407 ?auto_231406 ) ( ON ?auto_231404 ?auto_231407 ) ( ON ?auto_231408 ?auto_231404 ) ( ON ?auto_231410 ?auto_231408 ) ( not ( = ?auto_231405 ?auto_231406 ) ) ( not ( = ?auto_231405 ?auto_231407 ) ) ( not ( = ?auto_231405 ?auto_231404 ) ) ( not ( = ?auto_231405 ?auto_231408 ) ) ( not ( = ?auto_231405 ?auto_231410 ) ) ( not ( = ?auto_231405 ?auto_231409 ) ) ( not ( = ?auto_231405 ?auto_231411 ) ) ( not ( = ?auto_231405 ?auto_231413 ) ) ( not ( = ?auto_231406 ?auto_231407 ) ) ( not ( = ?auto_231406 ?auto_231404 ) ) ( not ( = ?auto_231406 ?auto_231408 ) ) ( not ( = ?auto_231406 ?auto_231410 ) ) ( not ( = ?auto_231406 ?auto_231409 ) ) ( not ( = ?auto_231406 ?auto_231411 ) ) ( not ( = ?auto_231406 ?auto_231413 ) ) ( not ( = ?auto_231407 ?auto_231404 ) ) ( not ( = ?auto_231407 ?auto_231408 ) ) ( not ( = ?auto_231407 ?auto_231410 ) ) ( not ( = ?auto_231407 ?auto_231409 ) ) ( not ( = ?auto_231407 ?auto_231411 ) ) ( not ( = ?auto_231407 ?auto_231413 ) ) ( not ( = ?auto_231404 ?auto_231408 ) ) ( not ( = ?auto_231404 ?auto_231410 ) ) ( not ( = ?auto_231404 ?auto_231409 ) ) ( not ( = ?auto_231404 ?auto_231411 ) ) ( not ( = ?auto_231404 ?auto_231413 ) ) ( not ( = ?auto_231408 ?auto_231410 ) ) ( not ( = ?auto_231408 ?auto_231409 ) ) ( not ( = ?auto_231408 ?auto_231411 ) ) ( not ( = ?auto_231408 ?auto_231413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231410 ?auto_231409 ?auto_231411 )
      ( MAKE-7CRATE-VERIFY ?auto_231405 ?auto_231406 ?auto_231407 ?auto_231404 ?auto_231408 ?auto_231410 ?auto_231409 ?auto_231411 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234287 - SURFACE
      ?auto_234288 - SURFACE
      ?auto_234289 - SURFACE
      ?auto_234286 - SURFACE
      ?auto_234290 - SURFACE
      ?auto_234292 - SURFACE
      ?auto_234291 - SURFACE
      ?auto_234293 - SURFACE
      ?auto_234294 - SURFACE
    )
    :vars
    (
      ?auto_234296 - HOIST
      ?auto_234295 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234296 ?auto_234295 ) ( SURFACE-AT ?auto_234293 ?auto_234295 ) ( CLEAR ?auto_234293 ) ( LIFTING ?auto_234296 ?auto_234294 ) ( IS-CRATE ?auto_234294 ) ( not ( = ?auto_234293 ?auto_234294 ) ) ( ON ?auto_234288 ?auto_234287 ) ( ON ?auto_234289 ?auto_234288 ) ( ON ?auto_234286 ?auto_234289 ) ( ON ?auto_234290 ?auto_234286 ) ( ON ?auto_234292 ?auto_234290 ) ( ON ?auto_234291 ?auto_234292 ) ( ON ?auto_234293 ?auto_234291 ) ( not ( = ?auto_234287 ?auto_234288 ) ) ( not ( = ?auto_234287 ?auto_234289 ) ) ( not ( = ?auto_234287 ?auto_234286 ) ) ( not ( = ?auto_234287 ?auto_234290 ) ) ( not ( = ?auto_234287 ?auto_234292 ) ) ( not ( = ?auto_234287 ?auto_234291 ) ) ( not ( = ?auto_234287 ?auto_234293 ) ) ( not ( = ?auto_234287 ?auto_234294 ) ) ( not ( = ?auto_234288 ?auto_234289 ) ) ( not ( = ?auto_234288 ?auto_234286 ) ) ( not ( = ?auto_234288 ?auto_234290 ) ) ( not ( = ?auto_234288 ?auto_234292 ) ) ( not ( = ?auto_234288 ?auto_234291 ) ) ( not ( = ?auto_234288 ?auto_234293 ) ) ( not ( = ?auto_234288 ?auto_234294 ) ) ( not ( = ?auto_234289 ?auto_234286 ) ) ( not ( = ?auto_234289 ?auto_234290 ) ) ( not ( = ?auto_234289 ?auto_234292 ) ) ( not ( = ?auto_234289 ?auto_234291 ) ) ( not ( = ?auto_234289 ?auto_234293 ) ) ( not ( = ?auto_234289 ?auto_234294 ) ) ( not ( = ?auto_234286 ?auto_234290 ) ) ( not ( = ?auto_234286 ?auto_234292 ) ) ( not ( = ?auto_234286 ?auto_234291 ) ) ( not ( = ?auto_234286 ?auto_234293 ) ) ( not ( = ?auto_234286 ?auto_234294 ) ) ( not ( = ?auto_234290 ?auto_234292 ) ) ( not ( = ?auto_234290 ?auto_234291 ) ) ( not ( = ?auto_234290 ?auto_234293 ) ) ( not ( = ?auto_234290 ?auto_234294 ) ) ( not ( = ?auto_234292 ?auto_234291 ) ) ( not ( = ?auto_234292 ?auto_234293 ) ) ( not ( = ?auto_234292 ?auto_234294 ) ) ( not ( = ?auto_234291 ?auto_234293 ) ) ( not ( = ?auto_234291 ?auto_234294 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_234293 ?auto_234294 )
      ( MAKE-8CRATE-VERIFY ?auto_234287 ?auto_234288 ?auto_234289 ?auto_234286 ?auto_234290 ?auto_234292 ?auto_234291 ?auto_234293 ?auto_234294 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234354 - SURFACE
      ?auto_234355 - SURFACE
      ?auto_234356 - SURFACE
      ?auto_234353 - SURFACE
      ?auto_234357 - SURFACE
      ?auto_234359 - SURFACE
      ?auto_234358 - SURFACE
      ?auto_234360 - SURFACE
      ?auto_234361 - SURFACE
    )
    :vars
    (
      ?auto_234364 - HOIST
      ?auto_234363 - PLACE
      ?auto_234362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234364 ?auto_234363 ) ( SURFACE-AT ?auto_234360 ?auto_234363 ) ( CLEAR ?auto_234360 ) ( IS-CRATE ?auto_234361 ) ( not ( = ?auto_234360 ?auto_234361 ) ) ( TRUCK-AT ?auto_234362 ?auto_234363 ) ( AVAILABLE ?auto_234364 ) ( IN ?auto_234361 ?auto_234362 ) ( ON ?auto_234360 ?auto_234358 ) ( not ( = ?auto_234358 ?auto_234360 ) ) ( not ( = ?auto_234358 ?auto_234361 ) ) ( ON ?auto_234355 ?auto_234354 ) ( ON ?auto_234356 ?auto_234355 ) ( ON ?auto_234353 ?auto_234356 ) ( ON ?auto_234357 ?auto_234353 ) ( ON ?auto_234359 ?auto_234357 ) ( ON ?auto_234358 ?auto_234359 ) ( not ( = ?auto_234354 ?auto_234355 ) ) ( not ( = ?auto_234354 ?auto_234356 ) ) ( not ( = ?auto_234354 ?auto_234353 ) ) ( not ( = ?auto_234354 ?auto_234357 ) ) ( not ( = ?auto_234354 ?auto_234359 ) ) ( not ( = ?auto_234354 ?auto_234358 ) ) ( not ( = ?auto_234354 ?auto_234360 ) ) ( not ( = ?auto_234354 ?auto_234361 ) ) ( not ( = ?auto_234355 ?auto_234356 ) ) ( not ( = ?auto_234355 ?auto_234353 ) ) ( not ( = ?auto_234355 ?auto_234357 ) ) ( not ( = ?auto_234355 ?auto_234359 ) ) ( not ( = ?auto_234355 ?auto_234358 ) ) ( not ( = ?auto_234355 ?auto_234360 ) ) ( not ( = ?auto_234355 ?auto_234361 ) ) ( not ( = ?auto_234356 ?auto_234353 ) ) ( not ( = ?auto_234356 ?auto_234357 ) ) ( not ( = ?auto_234356 ?auto_234359 ) ) ( not ( = ?auto_234356 ?auto_234358 ) ) ( not ( = ?auto_234356 ?auto_234360 ) ) ( not ( = ?auto_234356 ?auto_234361 ) ) ( not ( = ?auto_234353 ?auto_234357 ) ) ( not ( = ?auto_234353 ?auto_234359 ) ) ( not ( = ?auto_234353 ?auto_234358 ) ) ( not ( = ?auto_234353 ?auto_234360 ) ) ( not ( = ?auto_234353 ?auto_234361 ) ) ( not ( = ?auto_234357 ?auto_234359 ) ) ( not ( = ?auto_234357 ?auto_234358 ) ) ( not ( = ?auto_234357 ?auto_234360 ) ) ( not ( = ?auto_234357 ?auto_234361 ) ) ( not ( = ?auto_234359 ?auto_234358 ) ) ( not ( = ?auto_234359 ?auto_234360 ) ) ( not ( = ?auto_234359 ?auto_234361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234358 ?auto_234360 ?auto_234361 )
      ( MAKE-8CRATE-VERIFY ?auto_234354 ?auto_234355 ?auto_234356 ?auto_234353 ?auto_234357 ?auto_234359 ?auto_234358 ?auto_234360 ?auto_234361 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234430 - SURFACE
      ?auto_234431 - SURFACE
      ?auto_234432 - SURFACE
      ?auto_234429 - SURFACE
      ?auto_234433 - SURFACE
      ?auto_234435 - SURFACE
      ?auto_234434 - SURFACE
      ?auto_234436 - SURFACE
      ?auto_234437 - SURFACE
    )
    :vars
    (
      ?auto_234440 - HOIST
      ?auto_234438 - PLACE
      ?auto_234441 - TRUCK
      ?auto_234439 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234440 ?auto_234438 ) ( SURFACE-AT ?auto_234436 ?auto_234438 ) ( CLEAR ?auto_234436 ) ( IS-CRATE ?auto_234437 ) ( not ( = ?auto_234436 ?auto_234437 ) ) ( AVAILABLE ?auto_234440 ) ( IN ?auto_234437 ?auto_234441 ) ( ON ?auto_234436 ?auto_234434 ) ( not ( = ?auto_234434 ?auto_234436 ) ) ( not ( = ?auto_234434 ?auto_234437 ) ) ( TRUCK-AT ?auto_234441 ?auto_234439 ) ( not ( = ?auto_234439 ?auto_234438 ) ) ( ON ?auto_234431 ?auto_234430 ) ( ON ?auto_234432 ?auto_234431 ) ( ON ?auto_234429 ?auto_234432 ) ( ON ?auto_234433 ?auto_234429 ) ( ON ?auto_234435 ?auto_234433 ) ( ON ?auto_234434 ?auto_234435 ) ( not ( = ?auto_234430 ?auto_234431 ) ) ( not ( = ?auto_234430 ?auto_234432 ) ) ( not ( = ?auto_234430 ?auto_234429 ) ) ( not ( = ?auto_234430 ?auto_234433 ) ) ( not ( = ?auto_234430 ?auto_234435 ) ) ( not ( = ?auto_234430 ?auto_234434 ) ) ( not ( = ?auto_234430 ?auto_234436 ) ) ( not ( = ?auto_234430 ?auto_234437 ) ) ( not ( = ?auto_234431 ?auto_234432 ) ) ( not ( = ?auto_234431 ?auto_234429 ) ) ( not ( = ?auto_234431 ?auto_234433 ) ) ( not ( = ?auto_234431 ?auto_234435 ) ) ( not ( = ?auto_234431 ?auto_234434 ) ) ( not ( = ?auto_234431 ?auto_234436 ) ) ( not ( = ?auto_234431 ?auto_234437 ) ) ( not ( = ?auto_234432 ?auto_234429 ) ) ( not ( = ?auto_234432 ?auto_234433 ) ) ( not ( = ?auto_234432 ?auto_234435 ) ) ( not ( = ?auto_234432 ?auto_234434 ) ) ( not ( = ?auto_234432 ?auto_234436 ) ) ( not ( = ?auto_234432 ?auto_234437 ) ) ( not ( = ?auto_234429 ?auto_234433 ) ) ( not ( = ?auto_234429 ?auto_234435 ) ) ( not ( = ?auto_234429 ?auto_234434 ) ) ( not ( = ?auto_234429 ?auto_234436 ) ) ( not ( = ?auto_234429 ?auto_234437 ) ) ( not ( = ?auto_234433 ?auto_234435 ) ) ( not ( = ?auto_234433 ?auto_234434 ) ) ( not ( = ?auto_234433 ?auto_234436 ) ) ( not ( = ?auto_234433 ?auto_234437 ) ) ( not ( = ?auto_234435 ?auto_234434 ) ) ( not ( = ?auto_234435 ?auto_234436 ) ) ( not ( = ?auto_234435 ?auto_234437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234434 ?auto_234436 ?auto_234437 )
      ( MAKE-8CRATE-VERIFY ?auto_234430 ?auto_234431 ?auto_234432 ?auto_234429 ?auto_234433 ?auto_234435 ?auto_234434 ?auto_234436 ?auto_234437 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234514 - SURFACE
      ?auto_234515 - SURFACE
      ?auto_234516 - SURFACE
      ?auto_234513 - SURFACE
      ?auto_234517 - SURFACE
      ?auto_234519 - SURFACE
      ?auto_234518 - SURFACE
      ?auto_234520 - SURFACE
      ?auto_234521 - SURFACE
    )
    :vars
    (
      ?auto_234523 - HOIST
      ?auto_234526 - PLACE
      ?auto_234522 - TRUCK
      ?auto_234524 - PLACE
      ?auto_234525 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_234523 ?auto_234526 ) ( SURFACE-AT ?auto_234520 ?auto_234526 ) ( CLEAR ?auto_234520 ) ( IS-CRATE ?auto_234521 ) ( not ( = ?auto_234520 ?auto_234521 ) ) ( AVAILABLE ?auto_234523 ) ( ON ?auto_234520 ?auto_234518 ) ( not ( = ?auto_234518 ?auto_234520 ) ) ( not ( = ?auto_234518 ?auto_234521 ) ) ( TRUCK-AT ?auto_234522 ?auto_234524 ) ( not ( = ?auto_234524 ?auto_234526 ) ) ( HOIST-AT ?auto_234525 ?auto_234524 ) ( LIFTING ?auto_234525 ?auto_234521 ) ( not ( = ?auto_234523 ?auto_234525 ) ) ( ON ?auto_234515 ?auto_234514 ) ( ON ?auto_234516 ?auto_234515 ) ( ON ?auto_234513 ?auto_234516 ) ( ON ?auto_234517 ?auto_234513 ) ( ON ?auto_234519 ?auto_234517 ) ( ON ?auto_234518 ?auto_234519 ) ( not ( = ?auto_234514 ?auto_234515 ) ) ( not ( = ?auto_234514 ?auto_234516 ) ) ( not ( = ?auto_234514 ?auto_234513 ) ) ( not ( = ?auto_234514 ?auto_234517 ) ) ( not ( = ?auto_234514 ?auto_234519 ) ) ( not ( = ?auto_234514 ?auto_234518 ) ) ( not ( = ?auto_234514 ?auto_234520 ) ) ( not ( = ?auto_234514 ?auto_234521 ) ) ( not ( = ?auto_234515 ?auto_234516 ) ) ( not ( = ?auto_234515 ?auto_234513 ) ) ( not ( = ?auto_234515 ?auto_234517 ) ) ( not ( = ?auto_234515 ?auto_234519 ) ) ( not ( = ?auto_234515 ?auto_234518 ) ) ( not ( = ?auto_234515 ?auto_234520 ) ) ( not ( = ?auto_234515 ?auto_234521 ) ) ( not ( = ?auto_234516 ?auto_234513 ) ) ( not ( = ?auto_234516 ?auto_234517 ) ) ( not ( = ?auto_234516 ?auto_234519 ) ) ( not ( = ?auto_234516 ?auto_234518 ) ) ( not ( = ?auto_234516 ?auto_234520 ) ) ( not ( = ?auto_234516 ?auto_234521 ) ) ( not ( = ?auto_234513 ?auto_234517 ) ) ( not ( = ?auto_234513 ?auto_234519 ) ) ( not ( = ?auto_234513 ?auto_234518 ) ) ( not ( = ?auto_234513 ?auto_234520 ) ) ( not ( = ?auto_234513 ?auto_234521 ) ) ( not ( = ?auto_234517 ?auto_234519 ) ) ( not ( = ?auto_234517 ?auto_234518 ) ) ( not ( = ?auto_234517 ?auto_234520 ) ) ( not ( = ?auto_234517 ?auto_234521 ) ) ( not ( = ?auto_234519 ?auto_234518 ) ) ( not ( = ?auto_234519 ?auto_234520 ) ) ( not ( = ?auto_234519 ?auto_234521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234518 ?auto_234520 ?auto_234521 )
      ( MAKE-8CRATE-VERIFY ?auto_234514 ?auto_234515 ?auto_234516 ?auto_234513 ?auto_234517 ?auto_234519 ?auto_234518 ?auto_234520 ?auto_234521 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234606 - SURFACE
      ?auto_234607 - SURFACE
      ?auto_234608 - SURFACE
      ?auto_234605 - SURFACE
      ?auto_234609 - SURFACE
      ?auto_234611 - SURFACE
      ?auto_234610 - SURFACE
      ?auto_234612 - SURFACE
      ?auto_234613 - SURFACE
    )
    :vars
    (
      ?auto_234617 - HOIST
      ?auto_234619 - PLACE
      ?auto_234615 - TRUCK
      ?auto_234614 - PLACE
      ?auto_234616 - HOIST
      ?auto_234618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234617 ?auto_234619 ) ( SURFACE-AT ?auto_234612 ?auto_234619 ) ( CLEAR ?auto_234612 ) ( IS-CRATE ?auto_234613 ) ( not ( = ?auto_234612 ?auto_234613 ) ) ( AVAILABLE ?auto_234617 ) ( ON ?auto_234612 ?auto_234610 ) ( not ( = ?auto_234610 ?auto_234612 ) ) ( not ( = ?auto_234610 ?auto_234613 ) ) ( TRUCK-AT ?auto_234615 ?auto_234614 ) ( not ( = ?auto_234614 ?auto_234619 ) ) ( HOIST-AT ?auto_234616 ?auto_234614 ) ( not ( = ?auto_234617 ?auto_234616 ) ) ( AVAILABLE ?auto_234616 ) ( SURFACE-AT ?auto_234613 ?auto_234614 ) ( ON ?auto_234613 ?auto_234618 ) ( CLEAR ?auto_234613 ) ( not ( = ?auto_234612 ?auto_234618 ) ) ( not ( = ?auto_234613 ?auto_234618 ) ) ( not ( = ?auto_234610 ?auto_234618 ) ) ( ON ?auto_234607 ?auto_234606 ) ( ON ?auto_234608 ?auto_234607 ) ( ON ?auto_234605 ?auto_234608 ) ( ON ?auto_234609 ?auto_234605 ) ( ON ?auto_234611 ?auto_234609 ) ( ON ?auto_234610 ?auto_234611 ) ( not ( = ?auto_234606 ?auto_234607 ) ) ( not ( = ?auto_234606 ?auto_234608 ) ) ( not ( = ?auto_234606 ?auto_234605 ) ) ( not ( = ?auto_234606 ?auto_234609 ) ) ( not ( = ?auto_234606 ?auto_234611 ) ) ( not ( = ?auto_234606 ?auto_234610 ) ) ( not ( = ?auto_234606 ?auto_234612 ) ) ( not ( = ?auto_234606 ?auto_234613 ) ) ( not ( = ?auto_234606 ?auto_234618 ) ) ( not ( = ?auto_234607 ?auto_234608 ) ) ( not ( = ?auto_234607 ?auto_234605 ) ) ( not ( = ?auto_234607 ?auto_234609 ) ) ( not ( = ?auto_234607 ?auto_234611 ) ) ( not ( = ?auto_234607 ?auto_234610 ) ) ( not ( = ?auto_234607 ?auto_234612 ) ) ( not ( = ?auto_234607 ?auto_234613 ) ) ( not ( = ?auto_234607 ?auto_234618 ) ) ( not ( = ?auto_234608 ?auto_234605 ) ) ( not ( = ?auto_234608 ?auto_234609 ) ) ( not ( = ?auto_234608 ?auto_234611 ) ) ( not ( = ?auto_234608 ?auto_234610 ) ) ( not ( = ?auto_234608 ?auto_234612 ) ) ( not ( = ?auto_234608 ?auto_234613 ) ) ( not ( = ?auto_234608 ?auto_234618 ) ) ( not ( = ?auto_234605 ?auto_234609 ) ) ( not ( = ?auto_234605 ?auto_234611 ) ) ( not ( = ?auto_234605 ?auto_234610 ) ) ( not ( = ?auto_234605 ?auto_234612 ) ) ( not ( = ?auto_234605 ?auto_234613 ) ) ( not ( = ?auto_234605 ?auto_234618 ) ) ( not ( = ?auto_234609 ?auto_234611 ) ) ( not ( = ?auto_234609 ?auto_234610 ) ) ( not ( = ?auto_234609 ?auto_234612 ) ) ( not ( = ?auto_234609 ?auto_234613 ) ) ( not ( = ?auto_234609 ?auto_234618 ) ) ( not ( = ?auto_234611 ?auto_234610 ) ) ( not ( = ?auto_234611 ?auto_234612 ) ) ( not ( = ?auto_234611 ?auto_234613 ) ) ( not ( = ?auto_234611 ?auto_234618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234610 ?auto_234612 ?auto_234613 )
      ( MAKE-8CRATE-VERIFY ?auto_234606 ?auto_234607 ?auto_234608 ?auto_234605 ?auto_234609 ?auto_234611 ?auto_234610 ?auto_234612 ?auto_234613 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234699 - SURFACE
      ?auto_234700 - SURFACE
      ?auto_234701 - SURFACE
      ?auto_234698 - SURFACE
      ?auto_234702 - SURFACE
      ?auto_234704 - SURFACE
      ?auto_234703 - SURFACE
      ?auto_234705 - SURFACE
      ?auto_234706 - SURFACE
    )
    :vars
    (
      ?auto_234709 - HOIST
      ?auto_234712 - PLACE
      ?auto_234711 - PLACE
      ?auto_234707 - HOIST
      ?auto_234708 - SURFACE
      ?auto_234710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234709 ?auto_234712 ) ( SURFACE-AT ?auto_234705 ?auto_234712 ) ( CLEAR ?auto_234705 ) ( IS-CRATE ?auto_234706 ) ( not ( = ?auto_234705 ?auto_234706 ) ) ( AVAILABLE ?auto_234709 ) ( ON ?auto_234705 ?auto_234703 ) ( not ( = ?auto_234703 ?auto_234705 ) ) ( not ( = ?auto_234703 ?auto_234706 ) ) ( not ( = ?auto_234711 ?auto_234712 ) ) ( HOIST-AT ?auto_234707 ?auto_234711 ) ( not ( = ?auto_234709 ?auto_234707 ) ) ( AVAILABLE ?auto_234707 ) ( SURFACE-AT ?auto_234706 ?auto_234711 ) ( ON ?auto_234706 ?auto_234708 ) ( CLEAR ?auto_234706 ) ( not ( = ?auto_234705 ?auto_234708 ) ) ( not ( = ?auto_234706 ?auto_234708 ) ) ( not ( = ?auto_234703 ?auto_234708 ) ) ( TRUCK-AT ?auto_234710 ?auto_234712 ) ( ON ?auto_234700 ?auto_234699 ) ( ON ?auto_234701 ?auto_234700 ) ( ON ?auto_234698 ?auto_234701 ) ( ON ?auto_234702 ?auto_234698 ) ( ON ?auto_234704 ?auto_234702 ) ( ON ?auto_234703 ?auto_234704 ) ( not ( = ?auto_234699 ?auto_234700 ) ) ( not ( = ?auto_234699 ?auto_234701 ) ) ( not ( = ?auto_234699 ?auto_234698 ) ) ( not ( = ?auto_234699 ?auto_234702 ) ) ( not ( = ?auto_234699 ?auto_234704 ) ) ( not ( = ?auto_234699 ?auto_234703 ) ) ( not ( = ?auto_234699 ?auto_234705 ) ) ( not ( = ?auto_234699 ?auto_234706 ) ) ( not ( = ?auto_234699 ?auto_234708 ) ) ( not ( = ?auto_234700 ?auto_234701 ) ) ( not ( = ?auto_234700 ?auto_234698 ) ) ( not ( = ?auto_234700 ?auto_234702 ) ) ( not ( = ?auto_234700 ?auto_234704 ) ) ( not ( = ?auto_234700 ?auto_234703 ) ) ( not ( = ?auto_234700 ?auto_234705 ) ) ( not ( = ?auto_234700 ?auto_234706 ) ) ( not ( = ?auto_234700 ?auto_234708 ) ) ( not ( = ?auto_234701 ?auto_234698 ) ) ( not ( = ?auto_234701 ?auto_234702 ) ) ( not ( = ?auto_234701 ?auto_234704 ) ) ( not ( = ?auto_234701 ?auto_234703 ) ) ( not ( = ?auto_234701 ?auto_234705 ) ) ( not ( = ?auto_234701 ?auto_234706 ) ) ( not ( = ?auto_234701 ?auto_234708 ) ) ( not ( = ?auto_234698 ?auto_234702 ) ) ( not ( = ?auto_234698 ?auto_234704 ) ) ( not ( = ?auto_234698 ?auto_234703 ) ) ( not ( = ?auto_234698 ?auto_234705 ) ) ( not ( = ?auto_234698 ?auto_234706 ) ) ( not ( = ?auto_234698 ?auto_234708 ) ) ( not ( = ?auto_234702 ?auto_234704 ) ) ( not ( = ?auto_234702 ?auto_234703 ) ) ( not ( = ?auto_234702 ?auto_234705 ) ) ( not ( = ?auto_234702 ?auto_234706 ) ) ( not ( = ?auto_234702 ?auto_234708 ) ) ( not ( = ?auto_234704 ?auto_234703 ) ) ( not ( = ?auto_234704 ?auto_234705 ) ) ( not ( = ?auto_234704 ?auto_234706 ) ) ( not ( = ?auto_234704 ?auto_234708 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234703 ?auto_234705 ?auto_234706 )
      ( MAKE-8CRATE-VERIFY ?auto_234699 ?auto_234700 ?auto_234701 ?auto_234698 ?auto_234702 ?auto_234704 ?auto_234703 ?auto_234705 ?auto_234706 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234792 - SURFACE
      ?auto_234793 - SURFACE
      ?auto_234794 - SURFACE
      ?auto_234791 - SURFACE
      ?auto_234795 - SURFACE
      ?auto_234797 - SURFACE
      ?auto_234796 - SURFACE
      ?auto_234798 - SURFACE
      ?auto_234799 - SURFACE
    )
    :vars
    (
      ?auto_234805 - HOIST
      ?auto_234801 - PLACE
      ?auto_234804 - PLACE
      ?auto_234802 - HOIST
      ?auto_234803 - SURFACE
      ?auto_234800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234805 ?auto_234801 ) ( IS-CRATE ?auto_234799 ) ( not ( = ?auto_234798 ?auto_234799 ) ) ( not ( = ?auto_234796 ?auto_234798 ) ) ( not ( = ?auto_234796 ?auto_234799 ) ) ( not ( = ?auto_234804 ?auto_234801 ) ) ( HOIST-AT ?auto_234802 ?auto_234804 ) ( not ( = ?auto_234805 ?auto_234802 ) ) ( AVAILABLE ?auto_234802 ) ( SURFACE-AT ?auto_234799 ?auto_234804 ) ( ON ?auto_234799 ?auto_234803 ) ( CLEAR ?auto_234799 ) ( not ( = ?auto_234798 ?auto_234803 ) ) ( not ( = ?auto_234799 ?auto_234803 ) ) ( not ( = ?auto_234796 ?auto_234803 ) ) ( TRUCK-AT ?auto_234800 ?auto_234801 ) ( SURFACE-AT ?auto_234796 ?auto_234801 ) ( CLEAR ?auto_234796 ) ( LIFTING ?auto_234805 ?auto_234798 ) ( IS-CRATE ?auto_234798 ) ( ON ?auto_234793 ?auto_234792 ) ( ON ?auto_234794 ?auto_234793 ) ( ON ?auto_234791 ?auto_234794 ) ( ON ?auto_234795 ?auto_234791 ) ( ON ?auto_234797 ?auto_234795 ) ( ON ?auto_234796 ?auto_234797 ) ( not ( = ?auto_234792 ?auto_234793 ) ) ( not ( = ?auto_234792 ?auto_234794 ) ) ( not ( = ?auto_234792 ?auto_234791 ) ) ( not ( = ?auto_234792 ?auto_234795 ) ) ( not ( = ?auto_234792 ?auto_234797 ) ) ( not ( = ?auto_234792 ?auto_234796 ) ) ( not ( = ?auto_234792 ?auto_234798 ) ) ( not ( = ?auto_234792 ?auto_234799 ) ) ( not ( = ?auto_234792 ?auto_234803 ) ) ( not ( = ?auto_234793 ?auto_234794 ) ) ( not ( = ?auto_234793 ?auto_234791 ) ) ( not ( = ?auto_234793 ?auto_234795 ) ) ( not ( = ?auto_234793 ?auto_234797 ) ) ( not ( = ?auto_234793 ?auto_234796 ) ) ( not ( = ?auto_234793 ?auto_234798 ) ) ( not ( = ?auto_234793 ?auto_234799 ) ) ( not ( = ?auto_234793 ?auto_234803 ) ) ( not ( = ?auto_234794 ?auto_234791 ) ) ( not ( = ?auto_234794 ?auto_234795 ) ) ( not ( = ?auto_234794 ?auto_234797 ) ) ( not ( = ?auto_234794 ?auto_234796 ) ) ( not ( = ?auto_234794 ?auto_234798 ) ) ( not ( = ?auto_234794 ?auto_234799 ) ) ( not ( = ?auto_234794 ?auto_234803 ) ) ( not ( = ?auto_234791 ?auto_234795 ) ) ( not ( = ?auto_234791 ?auto_234797 ) ) ( not ( = ?auto_234791 ?auto_234796 ) ) ( not ( = ?auto_234791 ?auto_234798 ) ) ( not ( = ?auto_234791 ?auto_234799 ) ) ( not ( = ?auto_234791 ?auto_234803 ) ) ( not ( = ?auto_234795 ?auto_234797 ) ) ( not ( = ?auto_234795 ?auto_234796 ) ) ( not ( = ?auto_234795 ?auto_234798 ) ) ( not ( = ?auto_234795 ?auto_234799 ) ) ( not ( = ?auto_234795 ?auto_234803 ) ) ( not ( = ?auto_234797 ?auto_234796 ) ) ( not ( = ?auto_234797 ?auto_234798 ) ) ( not ( = ?auto_234797 ?auto_234799 ) ) ( not ( = ?auto_234797 ?auto_234803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234796 ?auto_234798 ?auto_234799 )
      ( MAKE-8CRATE-VERIFY ?auto_234792 ?auto_234793 ?auto_234794 ?auto_234791 ?auto_234795 ?auto_234797 ?auto_234796 ?auto_234798 ?auto_234799 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234885 - SURFACE
      ?auto_234886 - SURFACE
      ?auto_234887 - SURFACE
      ?auto_234884 - SURFACE
      ?auto_234888 - SURFACE
      ?auto_234890 - SURFACE
      ?auto_234889 - SURFACE
      ?auto_234891 - SURFACE
      ?auto_234892 - SURFACE
    )
    :vars
    (
      ?auto_234896 - HOIST
      ?auto_234897 - PLACE
      ?auto_234898 - PLACE
      ?auto_234894 - HOIST
      ?auto_234895 - SURFACE
      ?auto_234893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234896 ?auto_234897 ) ( IS-CRATE ?auto_234892 ) ( not ( = ?auto_234891 ?auto_234892 ) ) ( not ( = ?auto_234889 ?auto_234891 ) ) ( not ( = ?auto_234889 ?auto_234892 ) ) ( not ( = ?auto_234898 ?auto_234897 ) ) ( HOIST-AT ?auto_234894 ?auto_234898 ) ( not ( = ?auto_234896 ?auto_234894 ) ) ( AVAILABLE ?auto_234894 ) ( SURFACE-AT ?auto_234892 ?auto_234898 ) ( ON ?auto_234892 ?auto_234895 ) ( CLEAR ?auto_234892 ) ( not ( = ?auto_234891 ?auto_234895 ) ) ( not ( = ?auto_234892 ?auto_234895 ) ) ( not ( = ?auto_234889 ?auto_234895 ) ) ( TRUCK-AT ?auto_234893 ?auto_234897 ) ( SURFACE-AT ?auto_234889 ?auto_234897 ) ( CLEAR ?auto_234889 ) ( IS-CRATE ?auto_234891 ) ( AVAILABLE ?auto_234896 ) ( IN ?auto_234891 ?auto_234893 ) ( ON ?auto_234886 ?auto_234885 ) ( ON ?auto_234887 ?auto_234886 ) ( ON ?auto_234884 ?auto_234887 ) ( ON ?auto_234888 ?auto_234884 ) ( ON ?auto_234890 ?auto_234888 ) ( ON ?auto_234889 ?auto_234890 ) ( not ( = ?auto_234885 ?auto_234886 ) ) ( not ( = ?auto_234885 ?auto_234887 ) ) ( not ( = ?auto_234885 ?auto_234884 ) ) ( not ( = ?auto_234885 ?auto_234888 ) ) ( not ( = ?auto_234885 ?auto_234890 ) ) ( not ( = ?auto_234885 ?auto_234889 ) ) ( not ( = ?auto_234885 ?auto_234891 ) ) ( not ( = ?auto_234885 ?auto_234892 ) ) ( not ( = ?auto_234885 ?auto_234895 ) ) ( not ( = ?auto_234886 ?auto_234887 ) ) ( not ( = ?auto_234886 ?auto_234884 ) ) ( not ( = ?auto_234886 ?auto_234888 ) ) ( not ( = ?auto_234886 ?auto_234890 ) ) ( not ( = ?auto_234886 ?auto_234889 ) ) ( not ( = ?auto_234886 ?auto_234891 ) ) ( not ( = ?auto_234886 ?auto_234892 ) ) ( not ( = ?auto_234886 ?auto_234895 ) ) ( not ( = ?auto_234887 ?auto_234884 ) ) ( not ( = ?auto_234887 ?auto_234888 ) ) ( not ( = ?auto_234887 ?auto_234890 ) ) ( not ( = ?auto_234887 ?auto_234889 ) ) ( not ( = ?auto_234887 ?auto_234891 ) ) ( not ( = ?auto_234887 ?auto_234892 ) ) ( not ( = ?auto_234887 ?auto_234895 ) ) ( not ( = ?auto_234884 ?auto_234888 ) ) ( not ( = ?auto_234884 ?auto_234890 ) ) ( not ( = ?auto_234884 ?auto_234889 ) ) ( not ( = ?auto_234884 ?auto_234891 ) ) ( not ( = ?auto_234884 ?auto_234892 ) ) ( not ( = ?auto_234884 ?auto_234895 ) ) ( not ( = ?auto_234888 ?auto_234890 ) ) ( not ( = ?auto_234888 ?auto_234889 ) ) ( not ( = ?auto_234888 ?auto_234891 ) ) ( not ( = ?auto_234888 ?auto_234892 ) ) ( not ( = ?auto_234888 ?auto_234895 ) ) ( not ( = ?auto_234890 ?auto_234889 ) ) ( not ( = ?auto_234890 ?auto_234891 ) ) ( not ( = ?auto_234890 ?auto_234892 ) ) ( not ( = ?auto_234890 ?auto_234895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234889 ?auto_234891 ?auto_234892 )
      ( MAKE-8CRATE-VERIFY ?auto_234885 ?auto_234886 ?auto_234887 ?auto_234884 ?auto_234888 ?auto_234890 ?auto_234889 ?auto_234891 ?auto_234892 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_238990 - SURFACE
      ?auto_238991 - SURFACE
      ?auto_238992 - SURFACE
      ?auto_238989 - SURFACE
      ?auto_238993 - SURFACE
      ?auto_238995 - SURFACE
      ?auto_238994 - SURFACE
      ?auto_238996 - SURFACE
      ?auto_238997 - SURFACE
      ?auto_238998 - SURFACE
    )
    :vars
    (
      ?auto_238999 - HOIST
      ?auto_239000 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_238999 ?auto_239000 ) ( SURFACE-AT ?auto_238997 ?auto_239000 ) ( CLEAR ?auto_238997 ) ( LIFTING ?auto_238999 ?auto_238998 ) ( IS-CRATE ?auto_238998 ) ( not ( = ?auto_238997 ?auto_238998 ) ) ( ON ?auto_238991 ?auto_238990 ) ( ON ?auto_238992 ?auto_238991 ) ( ON ?auto_238989 ?auto_238992 ) ( ON ?auto_238993 ?auto_238989 ) ( ON ?auto_238995 ?auto_238993 ) ( ON ?auto_238994 ?auto_238995 ) ( ON ?auto_238996 ?auto_238994 ) ( ON ?auto_238997 ?auto_238996 ) ( not ( = ?auto_238990 ?auto_238991 ) ) ( not ( = ?auto_238990 ?auto_238992 ) ) ( not ( = ?auto_238990 ?auto_238989 ) ) ( not ( = ?auto_238990 ?auto_238993 ) ) ( not ( = ?auto_238990 ?auto_238995 ) ) ( not ( = ?auto_238990 ?auto_238994 ) ) ( not ( = ?auto_238990 ?auto_238996 ) ) ( not ( = ?auto_238990 ?auto_238997 ) ) ( not ( = ?auto_238990 ?auto_238998 ) ) ( not ( = ?auto_238991 ?auto_238992 ) ) ( not ( = ?auto_238991 ?auto_238989 ) ) ( not ( = ?auto_238991 ?auto_238993 ) ) ( not ( = ?auto_238991 ?auto_238995 ) ) ( not ( = ?auto_238991 ?auto_238994 ) ) ( not ( = ?auto_238991 ?auto_238996 ) ) ( not ( = ?auto_238991 ?auto_238997 ) ) ( not ( = ?auto_238991 ?auto_238998 ) ) ( not ( = ?auto_238992 ?auto_238989 ) ) ( not ( = ?auto_238992 ?auto_238993 ) ) ( not ( = ?auto_238992 ?auto_238995 ) ) ( not ( = ?auto_238992 ?auto_238994 ) ) ( not ( = ?auto_238992 ?auto_238996 ) ) ( not ( = ?auto_238992 ?auto_238997 ) ) ( not ( = ?auto_238992 ?auto_238998 ) ) ( not ( = ?auto_238989 ?auto_238993 ) ) ( not ( = ?auto_238989 ?auto_238995 ) ) ( not ( = ?auto_238989 ?auto_238994 ) ) ( not ( = ?auto_238989 ?auto_238996 ) ) ( not ( = ?auto_238989 ?auto_238997 ) ) ( not ( = ?auto_238989 ?auto_238998 ) ) ( not ( = ?auto_238993 ?auto_238995 ) ) ( not ( = ?auto_238993 ?auto_238994 ) ) ( not ( = ?auto_238993 ?auto_238996 ) ) ( not ( = ?auto_238993 ?auto_238997 ) ) ( not ( = ?auto_238993 ?auto_238998 ) ) ( not ( = ?auto_238995 ?auto_238994 ) ) ( not ( = ?auto_238995 ?auto_238996 ) ) ( not ( = ?auto_238995 ?auto_238997 ) ) ( not ( = ?auto_238995 ?auto_238998 ) ) ( not ( = ?auto_238994 ?auto_238996 ) ) ( not ( = ?auto_238994 ?auto_238997 ) ) ( not ( = ?auto_238994 ?auto_238998 ) ) ( not ( = ?auto_238996 ?auto_238997 ) ) ( not ( = ?auto_238996 ?auto_238998 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_238997 ?auto_238998 )
      ( MAKE-9CRATE-VERIFY ?auto_238990 ?auto_238991 ?auto_238992 ?auto_238989 ?auto_238993 ?auto_238995 ?auto_238994 ?auto_238996 ?auto_238997 ?auto_238998 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239070 - SURFACE
      ?auto_239071 - SURFACE
      ?auto_239072 - SURFACE
      ?auto_239069 - SURFACE
      ?auto_239073 - SURFACE
      ?auto_239075 - SURFACE
      ?auto_239074 - SURFACE
      ?auto_239076 - SURFACE
      ?auto_239077 - SURFACE
      ?auto_239078 - SURFACE
    )
    :vars
    (
      ?auto_239080 - HOIST
      ?auto_239079 - PLACE
      ?auto_239081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239080 ?auto_239079 ) ( SURFACE-AT ?auto_239077 ?auto_239079 ) ( CLEAR ?auto_239077 ) ( IS-CRATE ?auto_239078 ) ( not ( = ?auto_239077 ?auto_239078 ) ) ( TRUCK-AT ?auto_239081 ?auto_239079 ) ( AVAILABLE ?auto_239080 ) ( IN ?auto_239078 ?auto_239081 ) ( ON ?auto_239077 ?auto_239076 ) ( not ( = ?auto_239076 ?auto_239077 ) ) ( not ( = ?auto_239076 ?auto_239078 ) ) ( ON ?auto_239071 ?auto_239070 ) ( ON ?auto_239072 ?auto_239071 ) ( ON ?auto_239069 ?auto_239072 ) ( ON ?auto_239073 ?auto_239069 ) ( ON ?auto_239075 ?auto_239073 ) ( ON ?auto_239074 ?auto_239075 ) ( ON ?auto_239076 ?auto_239074 ) ( not ( = ?auto_239070 ?auto_239071 ) ) ( not ( = ?auto_239070 ?auto_239072 ) ) ( not ( = ?auto_239070 ?auto_239069 ) ) ( not ( = ?auto_239070 ?auto_239073 ) ) ( not ( = ?auto_239070 ?auto_239075 ) ) ( not ( = ?auto_239070 ?auto_239074 ) ) ( not ( = ?auto_239070 ?auto_239076 ) ) ( not ( = ?auto_239070 ?auto_239077 ) ) ( not ( = ?auto_239070 ?auto_239078 ) ) ( not ( = ?auto_239071 ?auto_239072 ) ) ( not ( = ?auto_239071 ?auto_239069 ) ) ( not ( = ?auto_239071 ?auto_239073 ) ) ( not ( = ?auto_239071 ?auto_239075 ) ) ( not ( = ?auto_239071 ?auto_239074 ) ) ( not ( = ?auto_239071 ?auto_239076 ) ) ( not ( = ?auto_239071 ?auto_239077 ) ) ( not ( = ?auto_239071 ?auto_239078 ) ) ( not ( = ?auto_239072 ?auto_239069 ) ) ( not ( = ?auto_239072 ?auto_239073 ) ) ( not ( = ?auto_239072 ?auto_239075 ) ) ( not ( = ?auto_239072 ?auto_239074 ) ) ( not ( = ?auto_239072 ?auto_239076 ) ) ( not ( = ?auto_239072 ?auto_239077 ) ) ( not ( = ?auto_239072 ?auto_239078 ) ) ( not ( = ?auto_239069 ?auto_239073 ) ) ( not ( = ?auto_239069 ?auto_239075 ) ) ( not ( = ?auto_239069 ?auto_239074 ) ) ( not ( = ?auto_239069 ?auto_239076 ) ) ( not ( = ?auto_239069 ?auto_239077 ) ) ( not ( = ?auto_239069 ?auto_239078 ) ) ( not ( = ?auto_239073 ?auto_239075 ) ) ( not ( = ?auto_239073 ?auto_239074 ) ) ( not ( = ?auto_239073 ?auto_239076 ) ) ( not ( = ?auto_239073 ?auto_239077 ) ) ( not ( = ?auto_239073 ?auto_239078 ) ) ( not ( = ?auto_239075 ?auto_239074 ) ) ( not ( = ?auto_239075 ?auto_239076 ) ) ( not ( = ?auto_239075 ?auto_239077 ) ) ( not ( = ?auto_239075 ?auto_239078 ) ) ( not ( = ?auto_239074 ?auto_239076 ) ) ( not ( = ?auto_239074 ?auto_239077 ) ) ( not ( = ?auto_239074 ?auto_239078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239076 ?auto_239077 ?auto_239078 )
      ( MAKE-9CRATE-VERIFY ?auto_239070 ?auto_239071 ?auto_239072 ?auto_239069 ?auto_239073 ?auto_239075 ?auto_239074 ?auto_239076 ?auto_239077 ?auto_239078 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239160 - SURFACE
      ?auto_239161 - SURFACE
      ?auto_239162 - SURFACE
      ?auto_239159 - SURFACE
      ?auto_239163 - SURFACE
      ?auto_239165 - SURFACE
      ?auto_239164 - SURFACE
      ?auto_239166 - SURFACE
      ?auto_239167 - SURFACE
      ?auto_239168 - SURFACE
    )
    :vars
    (
      ?auto_239171 - HOIST
      ?auto_239169 - PLACE
      ?auto_239170 - TRUCK
      ?auto_239172 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239171 ?auto_239169 ) ( SURFACE-AT ?auto_239167 ?auto_239169 ) ( CLEAR ?auto_239167 ) ( IS-CRATE ?auto_239168 ) ( not ( = ?auto_239167 ?auto_239168 ) ) ( AVAILABLE ?auto_239171 ) ( IN ?auto_239168 ?auto_239170 ) ( ON ?auto_239167 ?auto_239166 ) ( not ( = ?auto_239166 ?auto_239167 ) ) ( not ( = ?auto_239166 ?auto_239168 ) ) ( TRUCK-AT ?auto_239170 ?auto_239172 ) ( not ( = ?auto_239172 ?auto_239169 ) ) ( ON ?auto_239161 ?auto_239160 ) ( ON ?auto_239162 ?auto_239161 ) ( ON ?auto_239159 ?auto_239162 ) ( ON ?auto_239163 ?auto_239159 ) ( ON ?auto_239165 ?auto_239163 ) ( ON ?auto_239164 ?auto_239165 ) ( ON ?auto_239166 ?auto_239164 ) ( not ( = ?auto_239160 ?auto_239161 ) ) ( not ( = ?auto_239160 ?auto_239162 ) ) ( not ( = ?auto_239160 ?auto_239159 ) ) ( not ( = ?auto_239160 ?auto_239163 ) ) ( not ( = ?auto_239160 ?auto_239165 ) ) ( not ( = ?auto_239160 ?auto_239164 ) ) ( not ( = ?auto_239160 ?auto_239166 ) ) ( not ( = ?auto_239160 ?auto_239167 ) ) ( not ( = ?auto_239160 ?auto_239168 ) ) ( not ( = ?auto_239161 ?auto_239162 ) ) ( not ( = ?auto_239161 ?auto_239159 ) ) ( not ( = ?auto_239161 ?auto_239163 ) ) ( not ( = ?auto_239161 ?auto_239165 ) ) ( not ( = ?auto_239161 ?auto_239164 ) ) ( not ( = ?auto_239161 ?auto_239166 ) ) ( not ( = ?auto_239161 ?auto_239167 ) ) ( not ( = ?auto_239161 ?auto_239168 ) ) ( not ( = ?auto_239162 ?auto_239159 ) ) ( not ( = ?auto_239162 ?auto_239163 ) ) ( not ( = ?auto_239162 ?auto_239165 ) ) ( not ( = ?auto_239162 ?auto_239164 ) ) ( not ( = ?auto_239162 ?auto_239166 ) ) ( not ( = ?auto_239162 ?auto_239167 ) ) ( not ( = ?auto_239162 ?auto_239168 ) ) ( not ( = ?auto_239159 ?auto_239163 ) ) ( not ( = ?auto_239159 ?auto_239165 ) ) ( not ( = ?auto_239159 ?auto_239164 ) ) ( not ( = ?auto_239159 ?auto_239166 ) ) ( not ( = ?auto_239159 ?auto_239167 ) ) ( not ( = ?auto_239159 ?auto_239168 ) ) ( not ( = ?auto_239163 ?auto_239165 ) ) ( not ( = ?auto_239163 ?auto_239164 ) ) ( not ( = ?auto_239163 ?auto_239166 ) ) ( not ( = ?auto_239163 ?auto_239167 ) ) ( not ( = ?auto_239163 ?auto_239168 ) ) ( not ( = ?auto_239165 ?auto_239164 ) ) ( not ( = ?auto_239165 ?auto_239166 ) ) ( not ( = ?auto_239165 ?auto_239167 ) ) ( not ( = ?auto_239165 ?auto_239168 ) ) ( not ( = ?auto_239164 ?auto_239166 ) ) ( not ( = ?auto_239164 ?auto_239167 ) ) ( not ( = ?auto_239164 ?auto_239168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239166 ?auto_239167 ?auto_239168 )
      ( MAKE-9CRATE-VERIFY ?auto_239160 ?auto_239161 ?auto_239162 ?auto_239159 ?auto_239163 ?auto_239165 ?auto_239164 ?auto_239166 ?auto_239167 ?auto_239168 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239259 - SURFACE
      ?auto_239260 - SURFACE
      ?auto_239261 - SURFACE
      ?auto_239258 - SURFACE
      ?auto_239262 - SURFACE
      ?auto_239264 - SURFACE
      ?auto_239263 - SURFACE
      ?auto_239265 - SURFACE
      ?auto_239266 - SURFACE
      ?auto_239267 - SURFACE
    )
    :vars
    (
      ?auto_239269 - HOIST
      ?auto_239270 - PLACE
      ?auto_239272 - TRUCK
      ?auto_239271 - PLACE
      ?auto_239268 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_239269 ?auto_239270 ) ( SURFACE-AT ?auto_239266 ?auto_239270 ) ( CLEAR ?auto_239266 ) ( IS-CRATE ?auto_239267 ) ( not ( = ?auto_239266 ?auto_239267 ) ) ( AVAILABLE ?auto_239269 ) ( ON ?auto_239266 ?auto_239265 ) ( not ( = ?auto_239265 ?auto_239266 ) ) ( not ( = ?auto_239265 ?auto_239267 ) ) ( TRUCK-AT ?auto_239272 ?auto_239271 ) ( not ( = ?auto_239271 ?auto_239270 ) ) ( HOIST-AT ?auto_239268 ?auto_239271 ) ( LIFTING ?auto_239268 ?auto_239267 ) ( not ( = ?auto_239269 ?auto_239268 ) ) ( ON ?auto_239260 ?auto_239259 ) ( ON ?auto_239261 ?auto_239260 ) ( ON ?auto_239258 ?auto_239261 ) ( ON ?auto_239262 ?auto_239258 ) ( ON ?auto_239264 ?auto_239262 ) ( ON ?auto_239263 ?auto_239264 ) ( ON ?auto_239265 ?auto_239263 ) ( not ( = ?auto_239259 ?auto_239260 ) ) ( not ( = ?auto_239259 ?auto_239261 ) ) ( not ( = ?auto_239259 ?auto_239258 ) ) ( not ( = ?auto_239259 ?auto_239262 ) ) ( not ( = ?auto_239259 ?auto_239264 ) ) ( not ( = ?auto_239259 ?auto_239263 ) ) ( not ( = ?auto_239259 ?auto_239265 ) ) ( not ( = ?auto_239259 ?auto_239266 ) ) ( not ( = ?auto_239259 ?auto_239267 ) ) ( not ( = ?auto_239260 ?auto_239261 ) ) ( not ( = ?auto_239260 ?auto_239258 ) ) ( not ( = ?auto_239260 ?auto_239262 ) ) ( not ( = ?auto_239260 ?auto_239264 ) ) ( not ( = ?auto_239260 ?auto_239263 ) ) ( not ( = ?auto_239260 ?auto_239265 ) ) ( not ( = ?auto_239260 ?auto_239266 ) ) ( not ( = ?auto_239260 ?auto_239267 ) ) ( not ( = ?auto_239261 ?auto_239258 ) ) ( not ( = ?auto_239261 ?auto_239262 ) ) ( not ( = ?auto_239261 ?auto_239264 ) ) ( not ( = ?auto_239261 ?auto_239263 ) ) ( not ( = ?auto_239261 ?auto_239265 ) ) ( not ( = ?auto_239261 ?auto_239266 ) ) ( not ( = ?auto_239261 ?auto_239267 ) ) ( not ( = ?auto_239258 ?auto_239262 ) ) ( not ( = ?auto_239258 ?auto_239264 ) ) ( not ( = ?auto_239258 ?auto_239263 ) ) ( not ( = ?auto_239258 ?auto_239265 ) ) ( not ( = ?auto_239258 ?auto_239266 ) ) ( not ( = ?auto_239258 ?auto_239267 ) ) ( not ( = ?auto_239262 ?auto_239264 ) ) ( not ( = ?auto_239262 ?auto_239263 ) ) ( not ( = ?auto_239262 ?auto_239265 ) ) ( not ( = ?auto_239262 ?auto_239266 ) ) ( not ( = ?auto_239262 ?auto_239267 ) ) ( not ( = ?auto_239264 ?auto_239263 ) ) ( not ( = ?auto_239264 ?auto_239265 ) ) ( not ( = ?auto_239264 ?auto_239266 ) ) ( not ( = ?auto_239264 ?auto_239267 ) ) ( not ( = ?auto_239263 ?auto_239265 ) ) ( not ( = ?auto_239263 ?auto_239266 ) ) ( not ( = ?auto_239263 ?auto_239267 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239265 ?auto_239266 ?auto_239267 )
      ( MAKE-9CRATE-VERIFY ?auto_239259 ?auto_239260 ?auto_239261 ?auto_239258 ?auto_239262 ?auto_239264 ?auto_239263 ?auto_239265 ?auto_239266 ?auto_239267 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239367 - SURFACE
      ?auto_239368 - SURFACE
      ?auto_239369 - SURFACE
      ?auto_239366 - SURFACE
      ?auto_239370 - SURFACE
      ?auto_239372 - SURFACE
      ?auto_239371 - SURFACE
      ?auto_239373 - SURFACE
      ?auto_239374 - SURFACE
      ?auto_239375 - SURFACE
    )
    :vars
    (
      ?auto_239378 - HOIST
      ?auto_239376 - PLACE
      ?auto_239381 - TRUCK
      ?auto_239380 - PLACE
      ?auto_239377 - HOIST
      ?auto_239379 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239378 ?auto_239376 ) ( SURFACE-AT ?auto_239374 ?auto_239376 ) ( CLEAR ?auto_239374 ) ( IS-CRATE ?auto_239375 ) ( not ( = ?auto_239374 ?auto_239375 ) ) ( AVAILABLE ?auto_239378 ) ( ON ?auto_239374 ?auto_239373 ) ( not ( = ?auto_239373 ?auto_239374 ) ) ( not ( = ?auto_239373 ?auto_239375 ) ) ( TRUCK-AT ?auto_239381 ?auto_239380 ) ( not ( = ?auto_239380 ?auto_239376 ) ) ( HOIST-AT ?auto_239377 ?auto_239380 ) ( not ( = ?auto_239378 ?auto_239377 ) ) ( AVAILABLE ?auto_239377 ) ( SURFACE-AT ?auto_239375 ?auto_239380 ) ( ON ?auto_239375 ?auto_239379 ) ( CLEAR ?auto_239375 ) ( not ( = ?auto_239374 ?auto_239379 ) ) ( not ( = ?auto_239375 ?auto_239379 ) ) ( not ( = ?auto_239373 ?auto_239379 ) ) ( ON ?auto_239368 ?auto_239367 ) ( ON ?auto_239369 ?auto_239368 ) ( ON ?auto_239366 ?auto_239369 ) ( ON ?auto_239370 ?auto_239366 ) ( ON ?auto_239372 ?auto_239370 ) ( ON ?auto_239371 ?auto_239372 ) ( ON ?auto_239373 ?auto_239371 ) ( not ( = ?auto_239367 ?auto_239368 ) ) ( not ( = ?auto_239367 ?auto_239369 ) ) ( not ( = ?auto_239367 ?auto_239366 ) ) ( not ( = ?auto_239367 ?auto_239370 ) ) ( not ( = ?auto_239367 ?auto_239372 ) ) ( not ( = ?auto_239367 ?auto_239371 ) ) ( not ( = ?auto_239367 ?auto_239373 ) ) ( not ( = ?auto_239367 ?auto_239374 ) ) ( not ( = ?auto_239367 ?auto_239375 ) ) ( not ( = ?auto_239367 ?auto_239379 ) ) ( not ( = ?auto_239368 ?auto_239369 ) ) ( not ( = ?auto_239368 ?auto_239366 ) ) ( not ( = ?auto_239368 ?auto_239370 ) ) ( not ( = ?auto_239368 ?auto_239372 ) ) ( not ( = ?auto_239368 ?auto_239371 ) ) ( not ( = ?auto_239368 ?auto_239373 ) ) ( not ( = ?auto_239368 ?auto_239374 ) ) ( not ( = ?auto_239368 ?auto_239375 ) ) ( not ( = ?auto_239368 ?auto_239379 ) ) ( not ( = ?auto_239369 ?auto_239366 ) ) ( not ( = ?auto_239369 ?auto_239370 ) ) ( not ( = ?auto_239369 ?auto_239372 ) ) ( not ( = ?auto_239369 ?auto_239371 ) ) ( not ( = ?auto_239369 ?auto_239373 ) ) ( not ( = ?auto_239369 ?auto_239374 ) ) ( not ( = ?auto_239369 ?auto_239375 ) ) ( not ( = ?auto_239369 ?auto_239379 ) ) ( not ( = ?auto_239366 ?auto_239370 ) ) ( not ( = ?auto_239366 ?auto_239372 ) ) ( not ( = ?auto_239366 ?auto_239371 ) ) ( not ( = ?auto_239366 ?auto_239373 ) ) ( not ( = ?auto_239366 ?auto_239374 ) ) ( not ( = ?auto_239366 ?auto_239375 ) ) ( not ( = ?auto_239366 ?auto_239379 ) ) ( not ( = ?auto_239370 ?auto_239372 ) ) ( not ( = ?auto_239370 ?auto_239371 ) ) ( not ( = ?auto_239370 ?auto_239373 ) ) ( not ( = ?auto_239370 ?auto_239374 ) ) ( not ( = ?auto_239370 ?auto_239375 ) ) ( not ( = ?auto_239370 ?auto_239379 ) ) ( not ( = ?auto_239372 ?auto_239371 ) ) ( not ( = ?auto_239372 ?auto_239373 ) ) ( not ( = ?auto_239372 ?auto_239374 ) ) ( not ( = ?auto_239372 ?auto_239375 ) ) ( not ( = ?auto_239372 ?auto_239379 ) ) ( not ( = ?auto_239371 ?auto_239373 ) ) ( not ( = ?auto_239371 ?auto_239374 ) ) ( not ( = ?auto_239371 ?auto_239375 ) ) ( not ( = ?auto_239371 ?auto_239379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239373 ?auto_239374 ?auto_239375 )
      ( MAKE-9CRATE-VERIFY ?auto_239367 ?auto_239368 ?auto_239369 ?auto_239366 ?auto_239370 ?auto_239372 ?auto_239371 ?auto_239373 ?auto_239374 ?auto_239375 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239476 - SURFACE
      ?auto_239477 - SURFACE
      ?auto_239478 - SURFACE
      ?auto_239475 - SURFACE
      ?auto_239479 - SURFACE
      ?auto_239481 - SURFACE
      ?auto_239480 - SURFACE
      ?auto_239482 - SURFACE
      ?auto_239483 - SURFACE
      ?auto_239484 - SURFACE
    )
    :vars
    (
      ?auto_239487 - HOIST
      ?auto_239485 - PLACE
      ?auto_239488 - PLACE
      ?auto_239489 - HOIST
      ?auto_239486 - SURFACE
      ?auto_239490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239487 ?auto_239485 ) ( SURFACE-AT ?auto_239483 ?auto_239485 ) ( CLEAR ?auto_239483 ) ( IS-CRATE ?auto_239484 ) ( not ( = ?auto_239483 ?auto_239484 ) ) ( AVAILABLE ?auto_239487 ) ( ON ?auto_239483 ?auto_239482 ) ( not ( = ?auto_239482 ?auto_239483 ) ) ( not ( = ?auto_239482 ?auto_239484 ) ) ( not ( = ?auto_239488 ?auto_239485 ) ) ( HOIST-AT ?auto_239489 ?auto_239488 ) ( not ( = ?auto_239487 ?auto_239489 ) ) ( AVAILABLE ?auto_239489 ) ( SURFACE-AT ?auto_239484 ?auto_239488 ) ( ON ?auto_239484 ?auto_239486 ) ( CLEAR ?auto_239484 ) ( not ( = ?auto_239483 ?auto_239486 ) ) ( not ( = ?auto_239484 ?auto_239486 ) ) ( not ( = ?auto_239482 ?auto_239486 ) ) ( TRUCK-AT ?auto_239490 ?auto_239485 ) ( ON ?auto_239477 ?auto_239476 ) ( ON ?auto_239478 ?auto_239477 ) ( ON ?auto_239475 ?auto_239478 ) ( ON ?auto_239479 ?auto_239475 ) ( ON ?auto_239481 ?auto_239479 ) ( ON ?auto_239480 ?auto_239481 ) ( ON ?auto_239482 ?auto_239480 ) ( not ( = ?auto_239476 ?auto_239477 ) ) ( not ( = ?auto_239476 ?auto_239478 ) ) ( not ( = ?auto_239476 ?auto_239475 ) ) ( not ( = ?auto_239476 ?auto_239479 ) ) ( not ( = ?auto_239476 ?auto_239481 ) ) ( not ( = ?auto_239476 ?auto_239480 ) ) ( not ( = ?auto_239476 ?auto_239482 ) ) ( not ( = ?auto_239476 ?auto_239483 ) ) ( not ( = ?auto_239476 ?auto_239484 ) ) ( not ( = ?auto_239476 ?auto_239486 ) ) ( not ( = ?auto_239477 ?auto_239478 ) ) ( not ( = ?auto_239477 ?auto_239475 ) ) ( not ( = ?auto_239477 ?auto_239479 ) ) ( not ( = ?auto_239477 ?auto_239481 ) ) ( not ( = ?auto_239477 ?auto_239480 ) ) ( not ( = ?auto_239477 ?auto_239482 ) ) ( not ( = ?auto_239477 ?auto_239483 ) ) ( not ( = ?auto_239477 ?auto_239484 ) ) ( not ( = ?auto_239477 ?auto_239486 ) ) ( not ( = ?auto_239478 ?auto_239475 ) ) ( not ( = ?auto_239478 ?auto_239479 ) ) ( not ( = ?auto_239478 ?auto_239481 ) ) ( not ( = ?auto_239478 ?auto_239480 ) ) ( not ( = ?auto_239478 ?auto_239482 ) ) ( not ( = ?auto_239478 ?auto_239483 ) ) ( not ( = ?auto_239478 ?auto_239484 ) ) ( not ( = ?auto_239478 ?auto_239486 ) ) ( not ( = ?auto_239475 ?auto_239479 ) ) ( not ( = ?auto_239475 ?auto_239481 ) ) ( not ( = ?auto_239475 ?auto_239480 ) ) ( not ( = ?auto_239475 ?auto_239482 ) ) ( not ( = ?auto_239475 ?auto_239483 ) ) ( not ( = ?auto_239475 ?auto_239484 ) ) ( not ( = ?auto_239475 ?auto_239486 ) ) ( not ( = ?auto_239479 ?auto_239481 ) ) ( not ( = ?auto_239479 ?auto_239480 ) ) ( not ( = ?auto_239479 ?auto_239482 ) ) ( not ( = ?auto_239479 ?auto_239483 ) ) ( not ( = ?auto_239479 ?auto_239484 ) ) ( not ( = ?auto_239479 ?auto_239486 ) ) ( not ( = ?auto_239481 ?auto_239480 ) ) ( not ( = ?auto_239481 ?auto_239482 ) ) ( not ( = ?auto_239481 ?auto_239483 ) ) ( not ( = ?auto_239481 ?auto_239484 ) ) ( not ( = ?auto_239481 ?auto_239486 ) ) ( not ( = ?auto_239480 ?auto_239482 ) ) ( not ( = ?auto_239480 ?auto_239483 ) ) ( not ( = ?auto_239480 ?auto_239484 ) ) ( not ( = ?auto_239480 ?auto_239486 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239482 ?auto_239483 ?auto_239484 )
      ( MAKE-9CRATE-VERIFY ?auto_239476 ?auto_239477 ?auto_239478 ?auto_239475 ?auto_239479 ?auto_239481 ?auto_239480 ?auto_239482 ?auto_239483 ?auto_239484 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239585 - SURFACE
      ?auto_239586 - SURFACE
      ?auto_239587 - SURFACE
      ?auto_239584 - SURFACE
      ?auto_239588 - SURFACE
      ?auto_239590 - SURFACE
      ?auto_239589 - SURFACE
      ?auto_239591 - SURFACE
      ?auto_239592 - SURFACE
      ?auto_239593 - SURFACE
    )
    :vars
    (
      ?auto_239599 - HOIST
      ?auto_239595 - PLACE
      ?auto_239597 - PLACE
      ?auto_239598 - HOIST
      ?auto_239594 - SURFACE
      ?auto_239596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239599 ?auto_239595 ) ( IS-CRATE ?auto_239593 ) ( not ( = ?auto_239592 ?auto_239593 ) ) ( not ( = ?auto_239591 ?auto_239592 ) ) ( not ( = ?auto_239591 ?auto_239593 ) ) ( not ( = ?auto_239597 ?auto_239595 ) ) ( HOIST-AT ?auto_239598 ?auto_239597 ) ( not ( = ?auto_239599 ?auto_239598 ) ) ( AVAILABLE ?auto_239598 ) ( SURFACE-AT ?auto_239593 ?auto_239597 ) ( ON ?auto_239593 ?auto_239594 ) ( CLEAR ?auto_239593 ) ( not ( = ?auto_239592 ?auto_239594 ) ) ( not ( = ?auto_239593 ?auto_239594 ) ) ( not ( = ?auto_239591 ?auto_239594 ) ) ( TRUCK-AT ?auto_239596 ?auto_239595 ) ( SURFACE-AT ?auto_239591 ?auto_239595 ) ( CLEAR ?auto_239591 ) ( LIFTING ?auto_239599 ?auto_239592 ) ( IS-CRATE ?auto_239592 ) ( ON ?auto_239586 ?auto_239585 ) ( ON ?auto_239587 ?auto_239586 ) ( ON ?auto_239584 ?auto_239587 ) ( ON ?auto_239588 ?auto_239584 ) ( ON ?auto_239590 ?auto_239588 ) ( ON ?auto_239589 ?auto_239590 ) ( ON ?auto_239591 ?auto_239589 ) ( not ( = ?auto_239585 ?auto_239586 ) ) ( not ( = ?auto_239585 ?auto_239587 ) ) ( not ( = ?auto_239585 ?auto_239584 ) ) ( not ( = ?auto_239585 ?auto_239588 ) ) ( not ( = ?auto_239585 ?auto_239590 ) ) ( not ( = ?auto_239585 ?auto_239589 ) ) ( not ( = ?auto_239585 ?auto_239591 ) ) ( not ( = ?auto_239585 ?auto_239592 ) ) ( not ( = ?auto_239585 ?auto_239593 ) ) ( not ( = ?auto_239585 ?auto_239594 ) ) ( not ( = ?auto_239586 ?auto_239587 ) ) ( not ( = ?auto_239586 ?auto_239584 ) ) ( not ( = ?auto_239586 ?auto_239588 ) ) ( not ( = ?auto_239586 ?auto_239590 ) ) ( not ( = ?auto_239586 ?auto_239589 ) ) ( not ( = ?auto_239586 ?auto_239591 ) ) ( not ( = ?auto_239586 ?auto_239592 ) ) ( not ( = ?auto_239586 ?auto_239593 ) ) ( not ( = ?auto_239586 ?auto_239594 ) ) ( not ( = ?auto_239587 ?auto_239584 ) ) ( not ( = ?auto_239587 ?auto_239588 ) ) ( not ( = ?auto_239587 ?auto_239590 ) ) ( not ( = ?auto_239587 ?auto_239589 ) ) ( not ( = ?auto_239587 ?auto_239591 ) ) ( not ( = ?auto_239587 ?auto_239592 ) ) ( not ( = ?auto_239587 ?auto_239593 ) ) ( not ( = ?auto_239587 ?auto_239594 ) ) ( not ( = ?auto_239584 ?auto_239588 ) ) ( not ( = ?auto_239584 ?auto_239590 ) ) ( not ( = ?auto_239584 ?auto_239589 ) ) ( not ( = ?auto_239584 ?auto_239591 ) ) ( not ( = ?auto_239584 ?auto_239592 ) ) ( not ( = ?auto_239584 ?auto_239593 ) ) ( not ( = ?auto_239584 ?auto_239594 ) ) ( not ( = ?auto_239588 ?auto_239590 ) ) ( not ( = ?auto_239588 ?auto_239589 ) ) ( not ( = ?auto_239588 ?auto_239591 ) ) ( not ( = ?auto_239588 ?auto_239592 ) ) ( not ( = ?auto_239588 ?auto_239593 ) ) ( not ( = ?auto_239588 ?auto_239594 ) ) ( not ( = ?auto_239590 ?auto_239589 ) ) ( not ( = ?auto_239590 ?auto_239591 ) ) ( not ( = ?auto_239590 ?auto_239592 ) ) ( not ( = ?auto_239590 ?auto_239593 ) ) ( not ( = ?auto_239590 ?auto_239594 ) ) ( not ( = ?auto_239589 ?auto_239591 ) ) ( not ( = ?auto_239589 ?auto_239592 ) ) ( not ( = ?auto_239589 ?auto_239593 ) ) ( not ( = ?auto_239589 ?auto_239594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239591 ?auto_239592 ?auto_239593 )
      ( MAKE-9CRATE-VERIFY ?auto_239585 ?auto_239586 ?auto_239587 ?auto_239584 ?auto_239588 ?auto_239590 ?auto_239589 ?auto_239591 ?auto_239592 ?auto_239593 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239694 - SURFACE
      ?auto_239695 - SURFACE
      ?auto_239696 - SURFACE
      ?auto_239693 - SURFACE
      ?auto_239697 - SURFACE
      ?auto_239699 - SURFACE
      ?auto_239698 - SURFACE
      ?auto_239700 - SURFACE
      ?auto_239701 - SURFACE
      ?auto_239702 - SURFACE
    )
    :vars
    (
      ?auto_239706 - HOIST
      ?auto_239707 - PLACE
      ?auto_239708 - PLACE
      ?auto_239703 - HOIST
      ?auto_239704 - SURFACE
      ?auto_239705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239706 ?auto_239707 ) ( IS-CRATE ?auto_239702 ) ( not ( = ?auto_239701 ?auto_239702 ) ) ( not ( = ?auto_239700 ?auto_239701 ) ) ( not ( = ?auto_239700 ?auto_239702 ) ) ( not ( = ?auto_239708 ?auto_239707 ) ) ( HOIST-AT ?auto_239703 ?auto_239708 ) ( not ( = ?auto_239706 ?auto_239703 ) ) ( AVAILABLE ?auto_239703 ) ( SURFACE-AT ?auto_239702 ?auto_239708 ) ( ON ?auto_239702 ?auto_239704 ) ( CLEAR ?auto_239702 ) ( not ( = ?auto_239701 ?auto_239704 ) ) ( not ( = ?auto_239702 ?auto_239704 ) ) ( not ( = ?auto_239700 ?auto_239704 ) ) ( TRUCK-AT ?auto_239705 ?auto_239707 ) ( SURFACE-AT ?auto_239700 ?auto_239707 ) ( CLEAR ?auto_239700 ) ( IS-CRATE ?auto_239701 ) ( AVAILABLE ?auto_239706 ) ( IN ?auto_239701 ?auto_239705 ) ( ON ?auto_239695 ?auto_239694 ) ( ON ?auto_239696 ?auto_239695 ) ( ON ?auto_239693 ?auto_239696 ) ( ON ?auto_239697 ?auto_239693 ) ( ON ?auto_239699 ?auto_239697 ) ( ON ?auto_239698 ?auto_239699 ) ( ON ?auto_239700 ?auto_239698 ) ( not ( = ?auto_239694 ?auto_239695 ) ) ( not ( = ?auto_239694 ?auto_239696 ) ) ( not ( = ?auto_239694 ?auto_239693 ) ) ( not ( = ?auto_239694 ?auto_239697 ) ) ( not ( = ?auto_239694 ?auto_239699 ) ) ( not ( = ?auto_239694 ?auto_239698 ) ) ( not ( = ?auto_239694 ?auto_239700 ) ) ( not ( = ?auto_239694 ?auto_239701 ) ) ( not ( = ?auto_239694 ?auto_239702 ) ) ( not ( = ?auto_239694 ?auto_239704 ) ) ( not ( = ?auto_239695 ?auto_239696 ) ) ( not ( = ?auto_239695 ?auto_239693 ) ) ( not ( = ?auto_239695 ?auto_239697 ) ) ( not ( = ?auto_239695 ?auto_239699 ) ) ( not ( = ?auto_239695 ?auto_239698 ) ) ( not ( = ?auto_239695 ?auto_239700 ) ) ( not ( = ?auto_239695 ?auto_239701 ) ) ( not ( = ?auto_239695 ?auto_239702 ) ) ( not ( = ?auto_239695 ?auto_239704 ) ) ( not ( = ?auto_239696 ?auto_239693 ) ) ( not ( = ?auto_239696 ?auto_239697 ) ) ( not ( = ?auto_239696 ?auto_239699 ) ) ( not ( = ?auto_239696 ?auto_239698 ) ) ( not ( = ?auto_239696 ?auto_239700 ) ) ( not ( = ?auto_239696 ?auto_239701 ) ) ( not ( = ?auto_239696 ?auto_239702 ) ) ( not ( = ?auto_239696 ?auto_239704 ) ) ( not ( = ?auto_239693 ?auto_239697 ) ) ( not ( = ?auto_239693 ?auto_239699 ) ) ( not ( = ?auto_239693 ?auto_239698 ) ) ( not ( = ?auto_239693 ?auto_239700 ) ) ( not ( = ?auto_239693 ?auto_239701 ) ) ( not ( = ?auto_239693 ?auto_239702 ) ) ( not ( = ?auto_239693 ?auto_239704 ) ) ( not ( = ?auto_239697 ?auto_239699 ) ) ( not ( = ?auto_239697 ?auto_239698 ) ) ( not ( = ?auto_239697 ?auto_239700 ) ) ( not ( = ?auto_239697 ?auto_239701 ) ) ( not ( = ?auto_239697 ?auto_239702 ) ) ( not ( = ?auto_239697 ?auto_239704 ) ) ( not ( = ?auto_239699 ?auto_239698 ) ) ( not ( = ?auto_239699 ?auto_239700 ) ) ( not ( = ?auto_239699 ?auto_239701 ) ) ( not ( = ?auto_239699 ?auto_239702 ) ) ( not ( = ?auto_239699 ?auto_239704 ) ) ( not ( = ?auto_239698 ?auto_239700 ) ) ( not ( = ?auto_239698 ?auto_239701 ) ) ( not ( = ?auto_239698 ?auto_239702 ) ) ( not ( = ?auto_239698 ?auto_239704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239700 ?auto_239701 ?auto_239702 )
      ( MAKE-9CRATE-VERIFY ?auto_239694 ?auto_239695 ?auto_239696 ?auto_239693 ?auto_239697 ?auto_239699 ?auto_239698 ?auto_239700 ?auto_239701 ?auto_239702 ) )
  )

)

