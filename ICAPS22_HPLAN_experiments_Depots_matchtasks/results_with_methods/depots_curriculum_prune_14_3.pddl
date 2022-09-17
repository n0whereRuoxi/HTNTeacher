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

  ( :method MAKE-11CRATE-VERIFY
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
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18449 - SURFACE
      ?auto_18450 - SURFACE
    )
    :vars
    (
      ?auto_18451 - HOIST
      ?auto_18452 - PLACE
      ?auto_18454 - PLACE
      ?auto_18455 - HOIST
      ?auto_18456 - SURFACE
      ?auto_18453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18451 ?auto_18452 ) ( SURFACE-AT ?auto_18449 ?auto_18452 ) ( CLEAR ?auto_18449 ) ( IS-CRATE ?auto_18450 ) ( AVAILABLE ?auto_18451 ) ( not ( = ?auto_18454 ?auto_18452 ) ) ( HOIST-AT ?auto_18455 ?auto_18454 ) ( AVAILABLE ?auto_18455 ) ( SURFACE-AT ?auto_18450 ?auto_18454 ) ( ON ?auto_18450 ?auto_18456 ) ( CLEAR ?auto_18450 ) ( TRUCK-AT ?auto_18453 ?auto_18452 ) ( not ( = ?auto_18449 ?auto_18450 ) ) ( not ( = ?auto_18449 ?auto_18456 ) ) ( not ( = ?auto_18450 ?auto_18456 ) ) ( not ( = ?auto_18451 ?auto_18455 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18453 ?auto_18452 ?auto_18454 )
      ( !LIFT ?auto_18455 ?auto_18450 ?auto_18456 ?auto_18454 )
      ( !LOAD ?auto_18455 ?auto_18450 ?auto_18453 ?auto_18454 )
      ( !DRIVE ?auto_18453 ?auto_18454 ?auto_18452 )
      ( !UNLOAD ?auto_18451 ?auto_18450 ?auto_18453 ?auto_18452 )
      ( !DROP ?auto_18451 ?auto_18450 ?auto_18449 ?auto_18452 )
      ( MAKE-1CRATE-VERIFY ?auto_18449 ?auto_18450 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18470 - SURFACE
      ?auto_18471 - SURFACE
      ?auto_18472 - SURFACE
    )
    :vars
    (
      ?auto_18473 - HOIST
      ?auto_18477 - PLACE
      ?auto_18475 - PLACE
      ?auto_18478 - HOIST
      ?auto_18476 - SURFACE
      ?auto_18481 - PLACE
      ?auto_18480 - HOIST
      ?auto_18479 - SURFACE
      ?auto_18474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18473 ?auto_18477 ) ( IS-CRATE ?auto_18472 ) ( not ( = ?auto_18475 ?auto_18477 ) ) ( HOIST-AT ?auto_18478 ?auto_18475 ) ( AVAILABLE ?auto_18478 ) ( SURFACE-AT ?auto_18472 ?auto_18475 ) ( ON ?auto_18472 ?auto_18476 ) ( CLEAR ?auto_18472 ) ( not ( = ?auto_18471 ?auto_18472 ) ) ( not ( = ?auto_18471 ?auto_18476 ) ) ( not ( = ?auto_18472 ?auto_18476 ) ) ( not ( = ?auto_18473 ?auto_18478 ) ) ( SURFACE-AT ?auto_18470 ?auto_18477 ) ( CLEAR ?auto_18470 ) ( IS-CRATE ?auto_18471 ) ( AVAILABLE ?auto_18473 ) ( not ( = ?auto_18481 ?auto_18477 ) ) ( HOIST-AT ?auto_18480 ?auto_18481 ) ( AVAILABLE ?auto_18480 ) ( SURFACE-AT ?auto_18471 ?auto_18481 ) ( ON ?auto_18471 ?auto_18479 ) ( CLEAR ?auto_18471 ) ( TRUCK-AT ?auto_18474 ?auto_18477 ) ( not ( = ?auto_18470 ?auto_18471 ) ) ( not ( = ?auto_18470 ?auto_18479 ) ) ( not ( = ?auto_18471 ?auto_18479 ) ) ( not ( = ?auto_18473 ?auto_18480 ) ) ( not ( = ?auto_18470 ?auto_18472 ) ) ( not ( = ?auto_18470 ?auto_18476 ) ) ( not ( = ?auto_18472 ?auto_18479 ) ) ( not ( = ?auto_18475 ?auto_18481 ) ) ( not ( = ?auto_18478 ?auto_18480 ) ) ( not ( = ?auto_18476 ?auto_18479 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18470 ?auto_18471 )
      ( MAKE-1CRATE ?auto_18471 ?auto_18472 )
      ( MAKE-2CRATE-VERIFY ?auto_18470 ?auto_18471 ?auto_18472 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18496 - SURFACE
      ?auto_18497 - SURFACE
      ?auto_18498 - SURFACE
      ?auto_18499 - SURFACE
    )
    :vars
    (
      ?auto_18500 - HOIST
      ?auto_18504 - PLACE
      ?auto_18505 - PLACE
      ?auto_18503 - HOIST
      ?auto_18501 - SURFACE
      ?auto_18508 - PLACE
      ?auto_18507 - HOIST
      ?auto_18506 - SURFACE
      ?auto_18509 - PLACE
      ?auto_18511 - HOIST
      ?auto_18510 - SURFACE
      ?auto_18502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18500 ?auto_18504 ) ( IS-CRATE ?auto_18499 ) ( not ( = ?auto_18505 ?auto_18504 ) ) ( HOIST-AT ?auto_18503 ?auto_18505 ) ( AVAILABLE ?auto_18503 ) ( SURFACE-AT ?auto_18499 ?auto_18505 ) ( ON ?auto_18499 ?auto_18501 ) ( CLEAR ?auto_18499 ) ( not ( = ?auto_18498 ?auto_18499 ) ) ( not ( = ?auto_18498 ?auto_18501 ) ) ( not ( = ?auto_18499 ?auto_18501 ) ) ( not ( = ?auto_18500 ?auto_18503 ) ) ( IS-CRATE ?auto_18498 ) ( not ( = ?auto_18508 ?auto_18504 ) ) ( HOIST-AT ?auto_18507 ?auto_18508 ) ( AVAILABLE ?auto_18507 ) ( SURFACE-AT ?auto_18498 ?auto_18508 ) ( ON ?auto_18498 ?auto_18506 ) ( CLEAR ?auto_18498 ) ( not ( = ?auto_18497 ?auto_18498 ) ) ( not ( = ?auto_18497 ?auto_18506 ) ) ( not ( = ?auto_18498 ?auto_18506 ) ) ( not ( = ?auto_18500 ?auto_18507 ) ) ( SURFACE-AT ?auto_18496 ?auto_18504 ) ( CLEAR ?auto_18496 ) ( IS-CRATE ?auto_18497 ) ( AVAILABLE ?auto_18500 ) ( not ( = ?auto_18509 ?auto_18504 ) ) ( HOIST-AT ?auto_18511 ?auto_18509 ) ( AVAILABLE ?auto_18511 ) ( SURFACE-AT ?auto_18497 ?auto_18509 ) ( ON ?auto_18497 ?auto_18510 ) ( CLEAR ?auto_18497 ) ( TRUCK-AT ?auto_18502 ?auto_18504 ) ( not ( = ?auto_18496 ?auto_18497 ) ) ( not ( = ?auto_18496 ?auto_18510 ) ) ( not ( = ?auto_18497 ?auto_18510 ) ) ( not ( = ?auto_18500 ?auto_18511 ) ) ( not ( = ?auto_18496 ?auto_18498 ) ) ( not ( = ?auto_18496 ?auto_18506 ) ) ( not ( = ?auto_18498 ?auto_18510 ) ) ( not ( = ?auto_18508 ?auto_18509 ) ) ( not ( = ?auto_18507 ?auto_18511 ) ) ( not ( = ?auto_18506 ?auto_18510 ) ) ( not ( = ?auto_18496 ?auto_18499 ) ) ( not ( = ?auto_18496 ?auto_18501 ) ) ( not ( = ?auto_18497 ?auto_18499 ) ) ( not ( = ?auto_18497 ?auto_18501 ) ) ( not ( = ?auto_18499 ?auto_18506 ) ) ( not ( = ?auto_18499 ?auto_18510 ) ) ( not ( = ?auto_18505 ?auto_18508 ) ) ( not ( = ?auto_18505 ?auto_18509 ) ) ( not ( = ?auto_18503 ?auto_18507 ) ) ( not ( = ?auto_18503 ?auto_18511 ) ) ( not ( = ?auto_18501 ?auto_18506 ) ) ( not ( = ?auto_18501 ?auto_18510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18496 ?auto_18497 ?auto_18498 )
      ( MAKE-1CRATE ?auto_18498 ?auto_18499 )
      ( MAKE-3CRATE-VERIFY ?auto_18496 ?auto_18497 ?auto_18498 ?auto_18499 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_18527 - SURFACE
      ?auto_18528 - SURFACE
      ?auto_18529 - SURFACE
      ?auto_18530 - SURFACE
      ?auto_18531 - SURFACE
    )
    :vars
    (
      ?auto_18535 - HOIST
      ?auto_18537 - PLACE
      ?auto_18532 - PLACE
      ?auto_18533 - HOIST
      ?auto_18536 - SURFACE
      ?auto_18543 - PLACE
      ?auto_18538 - HOIST
      ?auto_18542 - SURFACE
      ?auto_18539 - SURFACE
      ?auto_18544 - PLACE
      ?auto_18541 - HOIST
      ?auto_18540 - SURFACE
      ?auto_18534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18535 ?auto_18537 ) ( IS-CRATE ?auto_18531 ) ( not ( = ?auto_18532 ?auto_18537 ) ) ( HOIST-AT ?auto_18533 ?auto_18532 ) ( SURFACE-AT ?auto_18531 ?auto_18532 ) ( ON ?auto_18531 ?auto_18536 ) ( CLEAR ?auto_18531 ) ( not ( = ?auto_18530 ?auto_18531 ) ) ( not ( = ?auto_18530 ?auto_18536 ) ) ( not ( = ?auto_18531 ?auto_18536 ) ) ( not ( = ?auto_18535 ?auto_18533 ) ) ( IS-CRATE ?auto_18530 ) ( not ( = ?auto_18543 ?auto_18537 ) ) ( HOIST-AT ?auto_18538 ?auto_18543 ) ( AVAILABLE ?auto_18538 ) ( SURFACE-AT ?auto_18530 ?auto_18543 ) ( ON ?auto_18530 ?auto_18542 ) ( CLEAR ?auto_18530 ) ( not ( = ?auto_18529 ?auto_18530 ) ) ( not ( = ?auto_18529 ?auto_18542 ) ) ( not ( = ?auto_18530 ?auto_18542 ) ) ( not ( = ?auto_18535 ?auto_18538 ) ) ( IS-CRATE ?auto_18529 ) ( AVAILABLE ?auto_18533 ) ( SURFACE-AT ?auto_18529 ?auto_18532 ) ( ON ?auto_18529 ?auto_18539 ) ( CLEAR ?auto_18529 ) ( not ( = ?auto_18528 ?auto_18529 ) ) ( not ( = ?auto_18528 ?auto_18539 ) ) ( not ( = ?auto_18529 ?auto_18539 ) ) ( SURFACE-AT ?auto_18527 ?auto_18537 ) ( CLEAR ?auto_18527 ) ( IS-CRATE ?auto_18528 ) ( AVAILABLE ?auto_18535 ) ( not ( = ?auto_18544 ?auto_18537 ) ) ( HOIST-AT ?auto_18541 ?auto_18544 ) ( AVAILABLE ?auto_18541 ) ( SURFACE-AT ?auto_18528 ?auto_18544 ) ( ON ?auto_18528 ?auto_18540 ) ( CLEAR ?auto_18528 ) ( TRUCK-AT ?auto_18534 ?auto_18537 ) ( not ( = ?auto_18527 ?auto_18528 ) ) ( not ( = ?auto_18527 ?auto_18540 ) ) ( not ( = ?auto_18528 ?auto_18540 ) ) ( not ( = ?auto_18535 ?auto_18541 ) ) ( not ( = ?auto_18527 ?auto_18529 ) ) ( not ( = ?auto_18527 ?auto_18539 ) ) ( not ( = ?auto_18529 ?auto_18540 ) ) ( not ( = ?auto_18532 ?auto_18544 ) ) ( not ( = ?auto_18533 ?auto_18541 ) ) ( not ( = ?auto_18539 ?auto_18540 ) ) ( not ( = ?auto_18527 ?auto_18530 ) ) ( not ( = ?auto_18527 ?auto_18542 ) ) ( not ( = ?auto_18528 ?auto_18530 ) ) ( not ( = ?auto_18528 ?auto_18542 ) ) ( not ( = ?auto_18530 ?auto_18539 ) ) ( not ( = ?auto_18530 ?auto_18540 ) ) ( not ( = ?auto_18543 ?auto_18532 ) ) ( not ( = ?auto_18543 ?auto_18544 ) ) ( not ( = ?auto_18538 ?auto_18533 ) ) ( not ( = ?auto_18538 ?auto_18541 ) ) ( not ( = ?auto_18542 ?auto_18539 ) ) ( not ( = ?auto_18542 ?auto_18540 ) ) ( not ( = ?auto_18527 ?auto_18531 ) ) ( not ( = ?auto_18527 ?auto_18536 ) ) ( not ( = ?auto_18528 ?auto_18531 ) ) ( not ( = ?auto_18528 ?auto_18536 ) ) ( not ( = ?auto_18529 ?auto_18531 ) ) ( not ( = ?auto_18529 ?auto_18536 ) ) ( not ( = ?auto_18531 ?auto_18542 ) ) ( not ( = ?auto_18531 ?auto_18539 ) ) ( not ( = ?auto_18531 ?auto_18540 ) ) ( not ( = ?auto_18536 ?auto_18542 ) ) ( not ( = ?auto_18536 ?auto_18539 ) ) ( not ( = ?auto_18536 ?auto_18540 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_18527 ?auto_18528 ?auto_18529 ?auto_18530 )
      ( MAKE-1CRATE ?auto_18530 ?auto_18531 )
      ( MAKE-4CRATE-VERIFY ?auto_18527 ?auto_18528 ?auto_18529 ?auto_18530 ?auto_18531 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_18561 - SURFACE
      ?auto_18562 - SURFACE
      ?auto_18563 - SURFACE
      ?auto_18564 - SURFACE
      ?auto_18565 - SURFACE
      ?auto_18566 - SURFACE
    )
    :vars
    (
      ?auto_18570 - HOIST
      ?auto_18572 - PLACE
      ?auto_18571 - PLACE
      ?auto_18567 - HOIST
      ?auto_18569 - SURFACE
      ?auto_18582 - PLACE
      ?auto_18581 - HOIST
      ?auto_18574 - SURFACE
      ?auto_18573 - PLACE
      ?auto_18576 - HOIST
      ?auto_18580 - SURFACE
      ?auto_18578 - SURFACE
      ?auto_18575 - PLACE
      ?auto_18579 - HOIST
      ?auto_18577 - SURFACE
      ?auto_18568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18570 ?auto_18572 ) ( IS-CRATE ?auto_18566 ) ( not ( = ?auto_18571 ?auto_18572 ) ) ( HOIST-AT ?auto_18567 ?auto_18571 ) ( AVAILABLE ?auto_18567 ) ( SURFACE-AT ?auto_18566 ?auto_18571 ) ( ON ?auto_18566 ?auto_18569 ) ( CLEAR ?auto_18566 ) ( not ( = ?auto_18565 ?auto_18566 ) ) ( not ( = ?auto_18565 ?auto_18569 ) ) ( not ( = ?auto_18566 ?auto_18569 ) ) ( not ( = ?auto_18570 ?auto_18567 ) ) ( IS-CRATE ?auto_18565 ) ( not ( = ?auto_18582 ?auto_18572 ) ) ( HOIST-AT ?auto_18581 ?auto_18582 ) ( SURFACE-AT ?auto_18565 ?auto_18582 ) ( ON ?auto_18565 ?auto_18574 ) ( CLEAR ?auto_18565 ) ( not ( = ?auto_18564 ?auto_18565 ) ) ( not ( = ?auto_18564 ?auto_18574 ) ) ( not ( = ?auto_18565 ?auto_18574 ) ) ( not ( = ?auto_18570 ?auto_18581 ) ) ( IS-CRATE ?auto_18564 ) ( not ( = ?auto_18573 ?auto_18572 ) ) ( HOIST-AT ?auto_18576 ?auto_18573 ) ( AVAILABLE ?auto_18576 ) ( SURFACE-AT ?auto_18564 ?auto_18573 ) ( ON ?auto_18564 ?auto_18580 ) ( CLEAR ?auto_18564 ) ( not ( = ?auto_18563 ?auto_18564 ) ) ( not ( = ?auto_18563 ?auto_18580 ) ) ( not ( = ?auto_18564 ?auto_18580 ) ) ( not ( = ?auto_18570 ?auto_18576 ) ) ( IS-CRATE ?auto_18563 ) ( AVAILABLE ?auto_18581 ) ( SURFACE-AT ?auto_18563 ?auto_18582 ) ( ON ?auto_18563 ?auto_18578 ) ( CLEAR ?auto_18563 ) ( not ( = ?auto_18562 ?auto_18563 ) ) ( not ( = ?auto_18562 ?auto_18578 ) ) ( not ( = ?auto_18563 ?auto_18578 ) ) ( SURFACE-AT ?auto_18561 ?auto_18572 ) ( CLEAR ?auto_18561 ) ( IS-CRATE ?auto_18562 ) ( AVAILABLE ?auto_18570 ) ( not ( = ?auto_18575 ?auto_18572 ) ) ( HOIST-AT ?auto_18579 ?auto_18575 ) ( AVAILABLE ?auto_18579 ) ( SURFACE-AT ?auto_18562 ?auto_18575 ) ( ON ?auto_18562 ?auto_18577 ) ( CLEAR ?auto_18562 ) ( TRUCK-AT ?auto_18568 ?auto_18572 ) ( not ( = ?auto_18561 ?auto_18562 ) ) ( not ( = ?auto_18561 ?auto_18577 ) ) ( not ( = ?auto_18562 ?auto_18577 ) ) ( not ( = ?auto_18570 ?auto_18579 ) ) ( not ( = ?auto_18561 ?auto_18563 ) ) ( not ( = ?auto_18561 ?auto_18578 ) ) ( not ( = ?auto_18563 ?auto_18577 ) ) ( not ( = ?auto_18582 ?auto_18575 ) ) ( not ( = ?auto_18581 ?auto_18579 ) ) ( not ( = ?auto_18578 ?auto_18577 ) ) ( not ( = ?auto_18561 ?auto_18564 ) ) ( not ( = ?auto_18561 ?auto_18580 ) ) ( not ( = ?auto_18562 ?auto_18564 ) ) ( not ( = ?auto_18562 ?auto_18580 ) ) ( not ( = ?auto_18564 ?auto_18578 ) ) ( not ( = ?auto_18564 ?auto_18577 ) ) ( not ( = ?auto_18573 ?auto_18582 ) ) ( not ( = ?auto_18573 ?auto_18575 ) ) ( not ( = ?auto_18576 ?auto_18581 ) ) ( not ( = ?auto_18576 ?auto_18579 ) ) ( not ( = ?auto_18580 ?auto_18578 ) ) ( not ( = ?auto_18580 ?auto_18577 ) ) ( not ( = ?auto_18561 ?auto_18565 ) ) ( not ( = ?auto_18561 ?auto_18574 ) ) ( not ( = ?auto_18562 ?auto_18565 ) ) ( not ( = ?auto_18562 ?auto_18574 ) ) ( not ( = ?auto_18563 ?auto_18565 ) ) ( not ( = ?auto_18563 ?auto_18574 ) ) ( not ( = ?auto_18565 ?auto_18580 ) ) ( not ( = ?auto_18565 ?auto_18578 ) ) ( not ( = ?auto_18565 ?auto_18577 ) ) ( not ( = ?auto_18574 ?auto_18580 ) ) ( not ( = ?auto_18574 ?auto_18578 ) ) ( not ( = ?auto_18574 ?auto_18577 ) ) ( not ( = ?auto_18561 ?auto_18566 ) ) ( not ( = ?auto_18561 ?auto_18569 ) ) ( not ( = ?auto_18562 ?auto_18566 ) ) ( not ( = ?auto_18562 ?auto_18569 ) ) ( not ( = ?auto_18563 ?auto_18566 ) ) ( not ( = ?auto_18563 ?auto_18569 ) ) ( not ( = ?auto_18564 ?auto_18566 ) ) ( not ( = ?auto_18564 ?auto_18569 ) ) ( not ( = ?auto_18566 ?auto_18574 ) ) ( not ( = ?auto_18566 ?auto_18580 ) ) ( not ( = ?auto_18566 ?auto_18578 ) ) ( not ( = ?auto_18566 ?auto_18577 ) ) ( not ( = ?auto_18571 ?auto_18582 ) ) ( not ( = ?auto_18571 ?auto_18573 ) ) ( not ( = ?auto_18571 ?auto_18575 ) ) ( not ( = ?auto_18567 ?auto_18581 ) ) ( not ( = ?auto_18567 ?auto_18576 ) ) ( not ( = ?auto_18567 ?auto_18579 ) ) ( not ( = ?auto_18569 ?auto_18574 ) ) ( not ( = ?auto_18569 ?auto_18580 ) ) ( not ( = ?auto_18569 ?auto_18578 ) ) ( not ( = ?auto_18569 ?auto_18577 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_18561 ?auto_18562 ?auto_18563 ?auto_18564 ?auto_18565 )
      ( MAKE-1CRATE ?auto_18565 ?auto_18566 )
      ( MAKE-5CRATE-VERIFY ?auto_18561 ?auto_18562 ?auto_18563 ?auto_18564 ?auto_18565 ?auto_18566 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_18600 - SURFACE
      ?auto_18601 - SURFACE
      ?auto_18602 - SURFACE
      ?auto_18603 - SURFACE
      ?auto_18604 - SURFACE
      ?auto_18605 - SURFACE
      ?auto_18606 - SURFACE
    )
    :vars
    (
      ?auto_18609 - HOIST
      ?auto_18610 - PLACE
      ?auto_18611 - PLACE
      ?auto_18608 - HOIST
      ?auto_18607 - SURFACE
      ?auto_18619 - PLACE
      ?auto_18618 - HOIST
      ?auto_18620 - SURFACE
      ?auto_18623 - PLACE
      ?auto_18621 - HOIST
      ?auto_18622 - SURFACE
      ?auto_18614 - PLACE
      ?auto_18613 - HOIST
      ?auto_18617 - SURFACE
      ?auto_18616 - SURFACE
      ?auto_18615 - SURFACE
      ?auto_18612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18609 ?auto_18610 ) ( IS-CRATE ?auto_18606 ) ( not ( = ?auto_18611 ?auto_18610 ) ) ( HOIST-AT ?auto_18608 ?auto_18611 ) ( SURFACE-AT ?auto_18606 ?auto_18611 ) ( ON ?auto_18606 ?auto_18607 ) ( CLEAR ?auto_18606 ) ( not ( = ?auto_18605 ?auto_18606 ) ) ( not ( = ?auto_18605 ?auto_18607 ) ) ( not ( = ?auto_18606 ?auto_18607 ) ) ( not ( = ?auto_18609 ?auto_18608 ) ) ( IS-CRATE ?auto_18605 ) ( not ( = ?auto_18619 ?auto_18610 ) ) ( HOIST-AT ?auto_18618 ?auto_18619 ) ( AVAILABLE ?auto_18618 ) ( SURFACE-AT ?auto_18605 ?auto_18619 ) ( ON ?auto_18605 ?auto_18620 ) ( CLEAR ?auto_18605 ) ( not ( = ?auto_18604 ?auto_18605 ) ) ( not ( = ?auto_18604 ?auto_18620 ) ) ( not ( = ?auto_18605 ?auto_18620 ) ) ( not ( = ?auto_18609 ?auto_18618 ) ) ( IS-CRATE ?auto_18604 ) ( not ( = ?auto_18623 ?auto_18610 ) ) ( HOIST-AT ?auto_18621 ?auto_18623 ) ( SURFACE-AT ?auto_18604 ?auto_18623 ) ( ON ?auto_18604 ?auto_18622 ) ( CLEAR ?auto_18604 ) ( not ( = ?auto_18603 ?auto_18604 ) ) ( not ( = ?auto_18603 ?auto_18622 ) ) ( not ( = ?auto_18604 ?auto_18622 ) ) ( not ( = ?auto_18609 ?auto_18621 ) ) ( IS-CRATE ?auto_18603 ) ( not ( = ?auto_18614 ?auto_18610 ) ) ( HOIST-AT ?auto_18613 ?auto_18614 ) ( AVAILABLE ?auto_18613 ) ( SURFACE-AT ?auto_18603 ?auto_18614 ) ( ON ?auto_18603 ?auto_18617 ) ( CLEAR ?auto_18603 ) ( not ( = ?auto_18602 ?auto_18603 ) ) ( not ( = ?auto_18602 ?auto_18617 ) ) ( not ( = ?auto_18603 ?auto_18617 ) ) ( not ( = ?auto_18609 ?auto_18613 ) ) ( IS-CRATE ?auto_18602 ) ( AVAILABLE ?auto_18621 ) ( SURFACE-AT ?auto_18602 ?auto_18623 ) ( ON ?auto_18602 ?auto_18616 ) ( CLEAR ?auto_18602 ) ( not ( = ?auto_18601 ?auto_18602 ) ) ( not ( = ?auto_18601 ?auto_18616 ) ) ( not ( = ?auto_18602 ?auto_18616 ) ) ( SURFACE-AT ?auto_18600 ?auto_18610 ) ( CLEAR ?auto_18600 ) ( IS-CRATE ?auto_18601 ) ( AVAILABLE ?auto_18609 ) ( AVAILABLE ?auto_18608 ) ( SURFACE-AT ?auto_18601 ?auto_18611 ) ( ON ?auto_18601 ?auto_18615 ) ( CLEAR ?auto_18601 ) ( TRUCK-AT ?auto_18612 ?auto_18610 ) ( not ( = ?auto_18600 ?auto_18601 ) ) ( not ( = ?auto_18600 ?auto_18615 ) ) ( not ( = ?auto_18601 ?auto_18615 ) ) ( not ( = ?auto_18600 ?auto_18602 ) ) ( not ( = ?auto_18600 ?auto_18616 ) ) ( not ( = ?auto_18602 ?auto_18615 ) ) ( not ( = ?auto_18623 ?auto_18611 ) ) ( not ( = ?auto_18621 ?auto_18608 ) ) ( not ( = ?auto_18616 ?auto_18615 ) ) ( not ( = ?auto_18600 ?auto_18603 ) ) ( not ( = ?auto_18600 ?auto_18617 ) ) ( not ( = ?auto_18601 ?auto_18603 ) ) ( not ( = ?auto_18601 ?auto_18617 ) ) ( not ( = ?auto_18603 ?auto_18616 ) ) ( not ( = ?auto_18603 ?auto_18615 ) ) ( not ( = ?auto_18614 ?auto_18623 ) ) ( not ( = ?auto_18614 ?auto_18611 ) ) ( not ( = ?auto_18613 ?auto_18621 ) ) ( not ( = ?auto_18613 ?auto_18608 ) ) ( not ( = ?auto_18617 ?auto_18616 ) ) ( not ( = ?auto_18617 ?auto_18615 ) ) ( not ( = ?auto_18600 ?auto_18604 ) ) ( not ( = ?auto_18600 ?auto_18622 ) ) ( not ( = ?auto_18601 ?auto_18604 ) ) ( not ( = ?auto_18601 ?auto_18622 ) ) ( not ( = ?auto_18602 ?auto_18604 ) ) ( not ( = ?auto_18602 ?auto_18622 ) ) ( not ( = ?auto_18604 ?auto_18617 ) ) ( not ( = ?auto_18604 ?auto_18616 ) ) ( not ( = ?auto_18604 ?auto_18615 ) ) ( not ( = ?auto_18622 ?auto_18617 ) ) ( not ( = ?auto_18622 ?auto_18616 ) ) ( not ( = ?auto_18622 ?auto_18615 ) ) ( not ( = ?auto_18600 ?auto_18605 ) ) ( not ( = ?auto_18600 ?auto_18620 ) ) ( not ( = ?auto_18601 ?auto_18605 ) ) ( not ( = ?auto_18601 ?auto_18620 ) ) ( not ( = ?auto_18602 ?auto_18605 ) ) ( not ( = ?auto_18602 ?auto_18620 ) ) ( not ( = ?auto_18603 ?auto_18605 ) ) ( not ( = ?auto_18603 ?auto_18620 ) ) ( not ( = ?auto_18605 ?auto_18622 ) ) ( not ( = ?auto_18605 ?auto_18617 ) ) ( not ( = ?auto_18605 ?auto_18616 ) ) ( not ( = ?auto_18605 ?auto_18615 ) ) ( not ( = ?auto_18619 ?auto_18623 ) ) ( not ( = ?auto_18619 ?auto_18614 ) ) ( not ( = ?auto_18619 ?auto_18611 ) ) ( not ( = ?auto_18618 ?auto_18621 ) ) ( not ( = ?auto_18618 ?auto_18613 ) ) ( not ( = ?auto_18618 ?auto_18608 ) ) ( not ( = ?auto_18620 ?auto_18622 ) ) ( not ( = ?auto_18620 ?auto_18617 ) ) ( not ( = ?auto_18620 ?auto_18616 ) ) ( not ( = ?auto_18620 ?auto_18615 ) ) ( not ( = ?auto_18600 ?auto_18606 ) ) ( not ( = ?auto_18600 ?auto_18607 ) ) ( not ( = ?auto_18601 ?auto_18606 ) ) ( not ( = ?auto_18601 ?auto_18607 ) ) ( not ( = ?auto_18602 ?auto_18606 ) ) ( not ( = ?auto_18602 ?auto_18607 ) ) ( not ( = ?auto_18603 ?auto_18606 ) ) ( not ( = ?auto_18603 ?auto_18607 ) ) ( not ( = ?auto_18604 ?auto_18606 ) ) ( not ( = ?auto_18604 ?auto_18607 ) ) ( not ( = ?auto_18606 ?auto_18620 ) ) ( not ( = ?auto_18606 ?auto_18622 ) ) ( not ( = ?auto_18606 ?auto_18617 ) ) ( not ( = ?auto_18606 ?auto_18616 ) ) ( not ( = ?auto_18606 ?auto_18615 ) ) ( not ( = ?auto_18607 ?auto_18620 ) ) ( not ( = ?auto_18607 ?auto_18622 ) ) ( not ( = ?auto_18607 ?auto_18617 ) ) ( not ( = ?auto_18607 ?auto_18616 ) ) ( not ( = ?auto_18607 ?auto_18615 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_18600 ?auto_18601 ?auto_18602 ?auto_18603 ?auto_18604 ?auto_18605 )
      ( MAKE-1CRATE ?auto_18605 ?auto_18606 )
      ( MAKE-6CRATE-VERIFY ?auto_18600 ?auto_18601 ?auto_18602 ?auto_18603 ?auto_18604 ?auto_18605 ?auto_18606 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_18642 - SURFACE
      ?auto_18643 - SURFACE
      ?auto_18644 - SURFACE
      ?auto_18645 - SURFACE
      ?auto_18646 - SURFACE
      ?auto_18647 - SURFACE
      ?auto_18648 - SURFACE
      ?auto_18649 - SURFACE
    )
    :vars
    (
      ?auto_18652 - HOIST
      ?auto_18653 - PLACE
      ?auto_18651 - PLACE
      ?auto_18650 - HOIST
      ?auto_18655 - SURFACE
      ?auto_18657 - PLACE
      ?auto_18658 - HOIST
      ?auto_18662 - SURFACE
      ?auto_18656 - PLACE
      ?auto_18663 - HOIST
      ?auto_18659 - SURFACE
      ?auto_18665 - PLACE
      ?auto_18666 - HOIST
      ?auto_18660 - SURFACE
      ?auto_18664 - PLACE
      ?auto_18661 - HOIST
      ?auto_18668 - SURFACE
      ?auto_18667 - SURFACE
      ?auto_18669 - SURFACE
      ?auto_18654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18652 ?auto_18653 ) ( IS-CRATE ?auto_18649 ) ( not ( = ?auto_18651 ?auto_18653 ) ) ( HOIST-AT ?auto_18650 ?auto_18651 ) ( AVAILABLE ?auto_18650 ) ( SURFACE-AT ?auto_18649 ?auto_18651 ) ( ON ?auto_18649 ?auto_18655 ) ( CLEAR ?auto_18649 ) ( not ( = ?auto_18648 ?auto_18649 ) ) ( not ( = ?auto_18648 ?auto_18655 ) ) ( not ( = ?auto_18649 ?auto_18655 ) ) ( not ( = ?auto_18652 ?auto_18650 ) ) ( IS-CRATE ?auto_18648 ) ( not ( = ?auto_18657 ?auto_18653 ) ) ( HOIST-AT ?auto_18658 ?auto_18657 ) ( SURFACE-AT ?auto_18648 ?auto_18657 ) ( ON ?auto_18648 ?auto_18662 ) ( CLEAR ?auto_18648 ) ( not ( = ?auto_18647 ?auto_18648 ) ) ( not ( = ?auto_18647 ?auto_18662 ) ) ( not ( = ?auto_18648 ?auto_18662 ) ) ( not ( = ?auto_18652 ?auto_18658 ) ) ( IS-CRATE ?auto_18647 ) ( not ( = ?auto_18656 ?auto_18653 ) ) ( HOIST-AT ?auto_18663 ?auto_18656 ) ( AVAILABLE ?auto_18663 ) ( SURFACE-AT ?auto_18647 ?auto_18656 ) ( ON ?auto_18647 ?auto_18659 ) ( CLEAR ?auto_18647 ) ( not ( = ?auto_18646 ?auto_18647 ) ) ( not ( = ?auto_18646 ?auto_18659 ) ) ( not ( = ?auto_18647 ?auto_18659 ) ) ( not ( = ?auto_18652 ?auto_18663 ) ) ( IS-CRATE ?auto_18646 ) ( not ( = ?auto_18665 ?auto_18653 ) ) ( HOIST-AT ?auto_18666 ?auto_18665 ) ( SURFACE-AT ?auto_18646 ?auto_18665 ) ( ON ?auto_18646 ?auto_18660 ) ( CLEAR ?auto_18646 ) ( not ( = ?auto_18645 ?auto_18646 ) ) ( not ( = ?auto_18645 ?auto_18660 ) ) ( not ( = ?auto_18646 ?auto_18660 ) ) ( not ( = ?auto_18652 ?auto_18666 ) ) ( IS-CRATE ?auto_18645 ) ( not ( = ?auto_18664 ?auto_18653 ) ) ( HOIST-AT ?auto_18661 ?auto_18664 ) ( AVAILABLE ?auto_18661 ) ( SURFACE-AT ?auto_18645 ?auto_18664 ) ( ON ?auto_18645 ?auto_18668 ) ( CLEAR ?auto_18645 ) ( not ( = ?auto_18644 ?auto_18645 ) ) ( not ( = ?auto_18644 ?auto_18668 ) ) ( not ( = ?auto_18645 ?auto_18668 ) ) ( not ( = ?auto_18652 ?auto_18661 ) ) ( IS-CRATE ?auto_18644 ) ( AVAILABLE ?auto_18666 ) ( SURFACE-AT ?auto_18644 ?auto_18665 ) ( ON ?auto_18644 ?auto_18667 ) ( CLEAR ?auto_18644 ) ( not ( = ?auto_18643 ?auto_18644 ) ) ( not ( = ?auto_18643 ?auto_18667 ) ) ( not ( = ?auto_18644 ?auto_18667 ) ) ( SURFACE-AT ?auto_18642 ?auto_18653 ) ( CLEAR ?auto_18642 ) ( IS-CRATE ?auto_18643 ) ( AVAILABLE ?auto_18652 ) ( AVAILABLE ?auto_18658 ) ( SURFACE-AT ?auto_18643 ?auto_18657 ) ( ON ?auto_18643 ?auto_18669 ) ( CLEAR ?auto_18643 ) ( TRUCK-AT ?auto_18654 ?auto_18653 ) ( not ( = ?auto_18642 ?auto_18643 ) ) ( not ( = ?auto_18642 ?auto_18669 ) ) ( not ( = ?auto_18643 ?auto_18669 ) ) ( not ( = ?auto_18642 ?auto_18644 ) ) ( not ( = ?auto_18642 ?auto_18667 ) ) ( not ( = ?auto_18644 ?auto_18669 ) ) ( not ( = ?auto_18665 ?auto_18657 ) ) ( not ( = ?auto_18666 ?auto_18658 ) ) ( not ( = ?auto_18667 ?auto_18669 ) ) ( not ( = ?auto_18642 ?auto_18645 ) ) ( not ( = ?auto_18642 ?auto_18668 ) ) ( not ( = ?auto_18643 ?auto_18645 ) ) ( not ( = ?auto_18643 ?auto_18668 ) ) ( not ( = ?auto_18645 ?auto_18667 ) ) ( not ( = ?auto_18645 ?auto_18669 ) ) ( not ( = ?auto_18664 ?auto_18665 ) ) ( not ( = ?auto_18664 ?auto_18657 ) ) ( not ( = ?auto_18661 ?auto_18666 ) ) ( not ( = ?auto_18661 ?auto_18658 ) ) ( not ( = ?auto_18668 ?auto_18667 ) ) ( not ( = ?auto_18668 ?auto_18669 ) ) ( not ( = ?auto_18642 ?auto_18646 ) ) ( not ( = ?auto_18642 ?auto_18660 ) ) ( not ( = ?auto_18643 ?auto_18646 ) ) ( not ( = ?auto_18643 ?auto_18660 ) ) ( not ( = ?auto_18644 ?auto_18646 ) ) ( not ( = ?auto_18644 ?auto_18660 ) ) ( not ( = ?auto_18646 ?auto_18668 ) ) ( not ( = ?auto_18646 ?auto_18667 ) ) ( not ( = ?auto_18646 ?auto_18669 ) ) ( not ( = ?auto_18660 ?auto_18668 ) ) ( not ( = ?auto_18660 ?auto_18667 ) ) ( not ( = ?auto_18660 ?auto_18669 ) ) ( not ( = ?auto_18642 ?auto_18647 ) ) ( not ( = ?auto_18642 ?auto_18659 ) ) ( not ( = ?auto_18643 ?auto_18647 ) ) ( not ( = ?auto_18643 ?auto_18659 ) ) ( not ( = ?auto_18644 ?auto_18647 ) ) ( not ( = ?auto_18644 ?auto_18659 ) ) ( not ( = ?auto_18645 ?auto_18647 ) ) ( not ( = ?auto_18645 ?auto_18659 ) ) ( not ( = ?auto_18647 ?auto_18660 ) ) ( not ( = ?auto_18647 ?auto_18668 ) ) ( not ( = ?auto_18647 ?auto_18667 ) ) ( not ( = ?auto_18647 ?auto_18669 ) ) ( not ( = ?auto_18656 ?auto_18665 ) ) ( not ( = ?auto_18656 ?auto_18664 ) ) ( not ( = ?auto_18656 ?auto_18657 ) ) ( not ( = ?auto_18663 ?auto_18666 ) ) ( not ( = ?auto_18663 ?auto_18661 ) ) ( not ( = ?auto_18663 ?auto_18658 ) ) ( not ( = ?auto_18659 ?auto_18660 ) ) ( not ( = ?auto_18659 ?auto_18668 ) ) ( not ( = ?auto_18659 ?auto_18667 ) ) ( not ( = ?auto_18659 ?auto_18669 ) ) ( not ( = ?auto_18642 ?auto_18648 ) ) ( not ( = ?auto_18642 ?auto_18662 ) ) ( not ( = ?auto_18643 ?auto_18648 ) ) ( not ( = ?auto_18643 ?auto_18662 ) ) ( not ( = ?auto_18644 ?auto_18648 ) ) ( not ( = ?auto_18644 ?auto_18662 ) ) ( not ( = ?auto_18645 ?auto_18648 ) ) ( not ( = ?auto_18645 ?auto_18662 ) ) ( not ( = ?auto_18646 ?auto_18648 ) ) ( not ( = ?auto_18646 ?auto_18662 ) ) ( not ( = ?auto_18648 ?auto_18659 ) ) ( not ( = ?auto_18648 ?auto_18660 ) ) ( not ( = ?auto_18648 ?auto_18668 ) ) ( not ( = ?auto_18648 ?auto_18667 ) ) ( not ( = ?auto_18648 ?auto_18669 ) ) ( not ( = ?auto_18662 ?auto_18659 ) ) ( not ( = ?auto_18662 ?auto_18660 ) ) ( not ( = ?auto_18662 ?auto_18668 ) ) ( not ( = ?auto_18662 ?auto_18667 ) ) ( not ( = ?auto_18662 ?auto_18669 ) ) ( not ( = ?auto_18642 ?auto_18649 ) ) ( not ( = ?auto_18642 ?auto_18655 ) ) ( not ( = ?auto_18643 ?auto_18649 ) ) ( not ( = ?auto_18643 ?auto_18655 ) ) ( not ( = ?auto_18644 ?auto_18649 ) ) ( not ( = ?auto_18644 ?auto_18655 ) ) ( not ( = ?auto_18645 ?auto_18649 ) ) ( not ( = ?auto_18645 ?auto_18655 ) ) ( not ( = ?auto_18646 ?auto_18649 ) ) ( not ( = ?auto_18646 ?auto_18655 ) ) ( not ( = ?auto_18647 ?auto_18649 ) ) ( not ( = ?auto_18647 ?auto_18655 ) ) ( not ( = ?auto_18649 ?auto_18662 ) ) ( not ( = ?auto_18649 ?auto_18659 ) ) ( not ( = ?auto_18649 ?auto_18660 ) ) ( not ( = ?auto_18649 ?auto_18668 ) ) ( not ( = ?auto_18649 ?auto_18667 ) ) ( not ( = ?auto_18649 ?auto_18669 ) ) ( not ( = ?auto_18651 ?auto_18657 ) ) ( not ( = ?auto_18651 ?auto_18656 ) ) ( not ( = ?auto_18651 ?auto_18665 ) ) ( not ( = ?auto_18651 ?auto_18664 ) ) ( not ( = ?auto_18650 ?auto_18658 ) ) ( not ( = ?auto_18650 ?auto_18663 ) ) ( not ( = ?auto_18650 ?auto_18666 ) ) ( not ( = ?auto_18650 ?auto_18661 ) ) ( not ( = ?auto_18655 ?auto_18662 ) ) ( not ( = ?auto_18655 ?auto_18659 ) ) ( not ( = ?auto_18655 ?auto_18660 ) ) ( not ( = ?auto_18655 ?auto_18668 ) ) ( not ( = ?auto_18655 ?auto_18667 ) ) ( not ( = ?auto_18655 ?auto_18669 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_18642 ?auto_18643 ?auto_18644 ?auto_18645 ?auto_18646 ?auto_18647 ?auto_18648 )
      ( MAKE-1CRATE ?auto_18648 ?auto_18649 )
      ( MAKE-7CRATE-VERIFY ?auto_18642 ?auto_18643 ?auto_18644 ?auto_18645 ?auto_18646 ?auto_18647 ?auto_18648 ?auto_18649 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_18689 - SURFACE
      ?auto_18690 - SURFACE
      ?auto_18691 - SURFACE
      ?auto_18692 - SURFACE
      ?auto_18693 - SURFACE
      ?auto_18694 - SURFACE
      ?auto_18695 - SURFACE
      ?auto_18696 - SURFACE
      ?auto_18697 - SURFACE
    )
    :vars
    (
      ?auto_18703 - HOIST
      ?auto_18702 - PLACE
      ?auto_18699 - PLACE
      ?auto_18700 - HOIST
      ?auto_18698 - SURFACE
      ?auto_18717 - PLACE
      ?auto_18708 - HOIST
      ?auto_18709 - SURFACE
      ?auto_18707 - PLACE
      ?auto_18704 - HOIST
      ?auto_18712 - SURFACE
      ?auto_18713 - PLACE
      ?auto_18705 - HOIST
      ?auto_18716 - SURFACE
      ?auto_18714 - PLACE
      ?auto_18706 - HOIST
      ?auto_18715 - SURFACE
      ?auto_18711 - SURFACE
      ?auto_18718 - SURFACE
      ?auto_18710 - SURFACE
      ?auto_18701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18703 ?auto_18702 ) ( IS-CRATE ?auto_18697 ) ( not ( = ?auto_18699 ?auto_18702 ) ) ( HOIST-AT ?auto_18700 ?auto_18699 ) ( SURFACE-AT ?auto_18697 ?auto_18699 ) ( ON ?auto_18697 ?auto_18698 ) ( CLEAR ?auto_18697 ) ( not ( = ?auto_18696 ?auto_18697 ) ) ( not ( = ?auto_18696 ?auto_18698 ) ) ( not ( = ?auto_18697 ?auto_18698 ) ) ( not ( = ?auto_18703 ?auto_18700 ) ) ( IS-CRATE ?auto_18696 ) ( not ( = ?auto_18717 ?auto_18702 ) ) ( HOIST-AT ?auto_18708 ?auto_18717 ) ( AVAILABLE ?auto_18708 ) ( SURFACE-AT ?auto_18696 ?auto_18717 ) ( ON ?auto_18696 ?auto_18709 ) ( CLEAR ?auto_18696 ) ( not ( = ?auto_18695 ?auto_18696 ) ) ( not ( = ?auto_18695 ?auto_18709 ) ) ( not ( = ?auto_18696 ?auto_18709 ) ) ( not ( = ?auto_18703 ?auto_18708 ) ) ( IS-CRATE ?auto_18695 ) ( not ( = ?auto_18707 ?auto_18702 ) ) ( HOIST-AT ?auto_18704 ?auto_18707 ) ( SURFACE-AT ?auto_18695 ?auto_18707 ) ( ON ?auto_18695 ?auto_18712 ) ( CLEAR ?auto_18695 ) ( not ( = ?auto_18694 ?auto_18695 ) ) ( not ( = ?auto_18694 ?auto_18712 ) ) ( not ( = ?auto_18695 ?auto_18712 ) ) ( not ( = ?auto_18703 ?auto_18704 ) ) ( IS-CRATE ?auto_18694 ) ( not ( = ?auto_18713 ?auto_18702 ) ) ( HOIST-AT ?auto_18705 ?auto_18713 ) ( AVAILABLE ?auto_18705 ) ( SURFACE-AT ?auto_18694 ?auto_18713 ) ( ON ?auto_18694 ?auto_18716 ) ( CLEAR ?auto_18694 ) ( not ( = ?auto_18693 ?auto_18694 ) ) ( not ( = ?auto_18693 ?auto_18716 ) ) ( not ( = ?auto_18694 ?auto_18716 ) ) ( not ( = ?auto_18703 ?auto_18705 ) ) ( IS-CRATE ?auto_18693 ) ( not ( = ?auto_18714 ?auto_18702 ) ) ( HOIST-AT ?auto_18706 ?auto_18714 ) ( SURFACE-AT ?auto_18693 ?auto_18714 ) ( ON ?auto_18693 ?auto_18715 ) ( CLEAR ?auto_18693 ) ( not ( = ?auto_18692 ?auto_18693 ) ) ( not ( = ?auto_18692 ?auto_18715 ) ) ( not ( = ?auto_18693 ?auto_18715 ) ) ( not ( = ?auto_18703 ?auto_18706 ) ) ( IS-CRATE ?auto_18692 ) ( AVAILABLE ?auto_18700 ) ( SURFACE-AT ?auto_18692 ?auto_18699 ) ( ON ?auto_18692 ?auto_18711 ) ( CLEAR ?auto_18692 ) ( not ( = ?auto_18691 ?auto_18692 ) ) ( not ( = ?auto_18691 ?auto_18711 ) ) ( not ( = ?auto_18692 ?auto_18711 ) ) ( IS-CRATE ?auto_18691 ) ( AVAILABLE ?auto_18706 ) ( SURFACE-AT ?auto_18691 ?auto_18714 ) ( ON ?auto_18691 ?auto_18718 ) ( CLEAR ?auto_18691 ) ( not ( = ?auto_18690 ?auto_18691 ) ) ( not ( = ?auto_18690 ?auto_18718 ) ) ( not ( = ?auto_18691 ?auto_18718 ) ) ( SURFACE-AT ?auto_18689 ?auto_18702 ) ( CLEAR ?auto_18689 ) ( IS-CRATE ?auto_18690 ) ( AVAILABLE ?auto_18703 ) ( AVAILABLE ?auto_18704 ) ( SURFACE-AT ?auto_18690 ?auto_18707 ) ( ON ?auto_18690 ?auto_18710 ) ( CLEAR ?auto_18690 ) ( TRUCK-AT ?auto_18701 ?auto_18702 ) ( not ( = ?auto_18689 ?auto_18690 ) ) ( not ( = ?auto_18689 ?auto_18710 ) ) ( not ( = ?auto_18690 ?auto_18710 ) ) ( not ( = ?auto_18689 ?auto_18691 ) ) ( not ( = ?auto_18689 ?auto_18718 ) ) ( not ( = ?auto_18691 ?auto_18710 ) ) ( not ( = ?auto_18714 ?auto_18707 ) ) ( not ( = ?auto_18706 ?auto_18704 ) ) ( not ( = ?auto_18718 ?auto_18710 ) ) ( not ( = ?auto_18689 ?auto_18692 ) ) ( not ( = ?auto_18689 ?auto_18711 ) ) ( not ( = ?auto_18690 ?auto_18692 ) ) ( not ( = ?auto_18690 ?auto_18711 ) ) ( not ( = ?auto_18692 ?auto_18718 ) ) ( not ( = ?auto_18692 ?auto_18710 ) ) ( not ( = ?auto_18699 ?auto_18714 ) ) ( not ( = ?auto_18699 ?auto_18707 ) ) ( not ( = ?auto_18700 ?auto_18706 ) ) ( not ( = ?auto_18700 ?auto_18704 ) ) ( not ( = ?auto_18711 ?auto_18718 ) ) ( not ( = ?auto_18711 ?auto_18710 ) ) ( not ( = ?auto_18689 ?auto_18693 ) ) ( not ( = ?auto_18689 ?auto_18715 ) ) ( not ( = ?auto_18690 ?auto_18693 ) ) ( not ( = ?auto_18690 ?auto_18715 ) ) ( not ( = ?auto_18691 ?auto_18693 ) ) ( not ( = ?auto_18691 ?auto_18715 ) ) ( not ( = ?auto_18693 ?auto_18711 ) ) ( not ( = ?auto_18693 ?auto_18718 ) ) ( not ( = ?auto_18693 ?auto_18710 ) ) ( not ( = ?auto_18715 ?auto_18711 ) ) ( not ( = ?auto_18715 ?auto_18718 ) ) ( not ( = ?auto_18715 ?auto_18710 ) ) ( not ( = ?auto_18689 ?auto_18694 ) ) ( not ( = ?auto_18689 ?auto_18716 ) ) ( not ( = ?auto_18690 ?auto_18694 ) ) ( not ( = ?auto_18690 ?auto_18716 ) ) ( not ( = ?auto_18691 ?auto_18694 ) ) ( not ( = ?auto_18691 ?auto_18716 ) ) ( not ( = ?auto_18692 ?auto_18694 ) ) ( not ( = ?auto_18692 ?auto_18716 ) ) ( not ( = ?auto_18694 ?auto_18715 ) ) ( not ( = ?auto_18694 ?auto_18711 ) ) ( not ( = ?auto_18694 ?auto_18718 ) ) ( not ( = ?auto_18694 ?auto_18710 ) ) ( not ( = ?auto_18713 ?auto_18714 ) ) ( not ( = ?auto_18713 ?auto_18699 ) ) ( not ( = ?auto_18713 ?auto_18707 ) ) ( not ( = ?auto_18705 ?auto_18706 ) ) ( not ( = ?auto_18705 ?auto_18700 ) ) ( not ( = ?auto_18705 ?auto_18704 ) ) ( not ( = ?auto_18716 ?auto_18715 ) ) ( not ( = ?auto_18716 ?auto_18711 ) ) ( not ( = ?auto_18716 ?auto_18718 ) ) ( not ( = ?auto_18716 ?auto_18710 ) ) ( not ( = ?auto_18689 ?auto_18695 ) ) ( not ( = ?auto_18689 ?auto_18712 ) ) ( not ( = ?auto_18690 ?auto_18695 ) ) ( not ( = ?auto_18690 ?auto_18712 ) ) ( not ( = ?auto_18691 ?auto_18695 ) ) ( not ( = ?auto_18691 ?auto_18712 ) ) ( not ( = ?auto_18692 ?auto_18695 ) ) ( not ( = ?auto_18692 ?auto_18712 ) ) ( not ( = ?auto_18693 ?auto_18695 ) ) ( not ( = ?auto_18693 ?auto_18712 ) ) ( not ( = ?auto_18695 ?auto_18716 ) ) ( not ( = ?auto_18695 ?auto_18715 ) ) ( not ( = ?auto_18695 ?auto_18711 ) ) ( not ( = ?auto_18695 ?auto_18718 ) ) ( not ( = ?auto_18695 ?auto_18710 ) ) ( not ( = ?auto_18712 ?auto_18716 ) ) ( not ( = ?auto_18712 ?auto_18715 ) ) ( not ( = ?auto_18712 ?auto_18711 ) ) ( not ( = ?auto_18712 ?auto_18718 ) ) ( not ( = ?auto_18712 ?auto_18710 ) ) ( not ( = ?auto_18689 ?auto_18696 ) ) ( not ( = ?auto_18689 ?auto_18709 ) ) ( not ( = ?auto_18690 ?auto_18696 ) ) ( not ( = ?auto_18690 ?auto_18709 ) ) ( not ( = ?auto_18691 ?auto_18696 ) ) ( not ( = ?auto_18691 ?auto_18709 ) ) ( not ( = ?auto_18692 ?auto_18696 ) ) ( not ( = ?auto_18692 ?auto_18709 ) ) ( not ( = ?auto_18693 ?auto_18696 ) ) ( not ( = ?auto_18693 ?auto_18709 ) ) ( not ( = ?auto_18694 ?auto_18696 ) ) ( not ( = ?auto_18694 ?auto_18709 ) ) ( not ( = ?auto_18696 ?auto_18712 ) ) ( not ( = ?auto_18696 ?auto_18716 ) ) ( not ( = ?auto_18696 ?auto_18715 ) ) ( not ( = ?auto_18696 ?auto_18711 ) ) ( not ( = ?auto_18696 ?auto_18718 ) ) ( not ( = ?auto_18696 ?auto_18710 ) ) ( not ( = ?auto_18717 ?auto_18707 ) ) ( not ( = ?auto_18717 ?auto_18713 ) ) ( not ( = ?auto_18717 ?auto_18714 ) ) ( not ( = ?auto_18717 ?auto_18699 ) ) ( not ( = ?auto_18708 ?auto_18704 ) ) ( not ( = ?auto_18708 ?auto_18705 ) ) ( not ( = ?auto_18708 ?auto_18706 ) ) ( not ( = ?auto_18708 ?auto_18700 ) ) ( not ( = ?auto_18709 ?auto_18712 ) ) ( not ( = ?auto_18709 ?auto_18716 ) ) ( not ( = ?auto_18709 ?auto_18715 ) ) ( not ( = ?auto_18709 ?auto_18711 ) ) ( not ( = ?auto_18709 ?auto_18718 ) ) ( not ( = ?auto_18709 ?auto_18710 ) ) ( not ( = ?auto_18689 ?auto_18697 ) ) ( not ( = ?auto_18689 ?auto_18698 ) ) ( not ( = ?auto_18690 ?auto_18697 ) ) ( not ( = ?auto_18690 ?auto_18698 ) ) ( not ( = ?auto_18691 ?auto_18697 ) ) ( not ( = ?auto_18691 ?auto_18698 ) ) ( not ( = ?auto_18692 ?auto_18697 ) ) ( not ( = ?auto_18692 ?auto_18698 ) ) ( not ( = ?auto_18693 ?auto_18697 ) ) ( not ( = ?auto_18693 ?auto_18698 ) ) ( not ( = ?auto_18694 ?auto_18697 ) ) ( not ( = ?auto_18694 ?auto_18698 ) ) ( not ( = ?auto_18695 ?auto_18697 ) ) ( not ( = ?auto_18695 ?auto_18698 ) ) ( not ( = ?auto_18697 ?auto_18709 ) ) ( not ( = ?auto_18697 ?auto_18712 ) ) ( not ( = ?auto_18697 ?auto_18716 ) ) ( not ( = ?auto_18697 ?auto_18715 ) ) ( not ( = ?auto_18697 ?auto_18711 ) ) ( not ( = ?auto_18697 ?auto_18718 ) ) ( not ( = ?auto_18697 ?auto_18710 ) ) ( not ( = ?auto_18698 ?auto_18709 ) ) ( not ( = ?auto_18698 ?auto_18712 ) ) ( not ( = ?auto_18698 ?auto_18716 ) ) ( not ( = ?auto_18698 ?auto_18715 ) ) ( not ( = ?auto_18698 ?auto_18711 ) ) ( not ( = ?auto_18698 ?auto_18718 ) ) ( not ( = ?auto_18698 ?auto_18710 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18689 ?auto_18690 ?auto_18691 ?auto_18692 ?auto_18693 ?auto_18694 ?auto_18695 ?auto_18696 )
      ( MAKE-1CRATE ?auto_18696 ?auto_18697 )
      ( MAKE-8CRATE-VERIFY ?auto_18689 ?auto_18690 ?auto_18691 ?auto_18692 ?auto_18693 ?auto_18694 ?auto_18695 ?auto_18696 ?auto_18697 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_18739 - SURFACE
      ?auto_18740 - SURFACE
      ?auto_18741 - SURFACE
      ?auto_18742 - SURFACE
      ?auto_18743 - SURFACE
      ?auto_18744 - SURFACE
      ?auto_18745 - SURFACE
      ?auto_18746 - SURFACE
      ?auto_18747 - SURFACE
      ?auto_18748 - SURFACE
    )
    :vars
    (
      ?auto_18754 - HOIST
      ?auto_18753 - PLACE
      ?auto_18750 - PLACE
      ?auto_18751 - HOIST
      ?auto_18752 - SURFACE
      ?auto_18763 - PLACE
      ?auto_18768 - HOIST
      ?auto_18770 - SURFACE
      ?auto_18764 - PLACE
      ?auto_18766 - HOIST
      ?auto_18765 - SURFACE
      ?auto_18769 - PLACE
      ?auto_18762 - HOIST
      ?auto_18760 - SURFACE
      ?auto_18759 - PLACE
      ?auto_18767 - HOIST
      ?auto_18761 - SURFACE
      ?auto_18757 - SURFACE
      ?auto_18758 - SURFACE
      ?auto_18756 - SURFACE
      ?auto_18755 - SURFACE
      ?auto_18749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18754 ?auto_18753 ) ( IS-CRATE ?auto_18748 ) ( not ( = ?auto_18750 ?auto_18753 ) ) ( HOIST-AT ?auto_18751 ?auto_18750 ) ( SURFACE-AT ?auto_18748 ?auto_18750 ) ( ON ?auto_18748 ?auto_18752 ) ( CLEAR ?auto_18748 ) ( not ( = ?auto_18747 ?auto_18748 ) ) ( not ( = ?auto_18747 ?auto_18752 ) ) ( not ( = ?auto_18748 ?auto_18752 ) ) ( not ( = ?auto_18754 ?auto_18751 ) ) ( IS-CRATE ?auto_18747 ) ( not ( = ?auto_18763 ?auto_18753 ) ) ( HOIST-AT ?auto_18768 ?auto_18763 ) ( SURFACE-AT ?auto_18747 ?auto_18763 ) ( ON ?auto_18747 ?auto_18770 ) ( CLEAR ?auto_18747 ) ( not ( = ?auto_18746 ?auto_18747 ) ) ( not ( = ?auto_18746 ?auto_18770 ) ) ( not ( = ?auto_18747 ?auto_18770 ) ) ( not ( = ?auto_18754 ?auto_18768 ) ) ( IS-CRATE ?auto_18746 ) ( not ( = ?auto_18764 ?auto_18753 ) ) ( HOIST-AT ?auto_18766 ?auto_18764 ) ( AVAILABLE ?auto_18766 ) ( SURFACE-AT ?auto_18746 ?auto_18764 ) ( ON ?auto_18746 ?auto_18765 ) ( CLEAR ?auto_18746 ) ( not ( = ?auto_18745 ?auto_18746 ) ) ( not ( = ?auto_18745 ?auto_18765 ) ) ( not ( = ?auto_18746 ?auto_18765 ) ) ( not ( = ?auto_18754 ?auto_18766 ) ) ( IS-CRATE ?auto_18745 ) ( not ( = ?auto_18769 ?auto_18753 ) ) ( HOIST-AT ?auto_18762 ?auto_18769 ) ( SURFACE-AT ?auto_18745 ?auto_18769 ) ( ON ?auto_18745 ?auto_18760 ) ( CLEAR ?auto_18745 ) ( not ( = ?auto_18744 ?auto_18745 ) ) ( not ( = ?auto_18744 ?auto_18760 ) ) ( not ( = ?auto_18745 ?auto_18760 ) ) ( not ( = ?auto_18754 ?auto_18762 ) ) ( IS-CRATE ?auto_18744 ) ( not ( = ?auto_18759 ?auto_18753 ) ) ( HOIST-AT ?auto_18767 ?auto_18759 ) ( AVAILABLE ?auto_18767 ) ( SURFACE-AT ?auto_18744 ?auto_18759 ) ( ON ?auto_18744 ?auto_18761 ) ( CLEAR ?auto_18744 ) ( not ( = ?auto_18743 ?auto_18744 ) ) ( not ( = ?auto_18743 ?auto_18761 ) ) ( not ( = ?auto_18744 ?auto_18761 ) ) ( not ( = ?auto_18754 ?auto_18767 ) ) ( IS-CRATE ?auto_18743 ) ( SURFACE-AT ?auto_18743 ?auto_18750 ) ( ON ?auto_18743 ?auto_18757 ) ( CLEAR ?auto_18743 ) ( not ( = ?auto_18742 ?auto_18743 ) ) ( not ( = ?auto_18742 ?auto_18757 ) ) ( not ( = ?auto_18743 ?auto_18757 ) ) ( IS-CRATE ?auto_18742 ) ( AVAILABLE ?auto_18768 ) ( SURFACE-AT ?auto_18742 ?auto_18763 ) ( ON ?auto_18742 ?auto_18758 ) ( CLEAR ?auto_18742 ) ( not ( = ?auto_18741 ?auto_18742 ) ) ( not ( = ?auto_18741 ?auto_18758 ) ) ( not ( = ?auto_18742 ?auto_18758 ) ) ( IS-CRATE ?auto_18741 ) ( AVAILABLE ?auto_18751 ) ( SURFACE-AT ?auto_18741 ?auto_18750 ) ( ON ?auto_18741 ?auto_18756 ) ( CLEAR ?auto_18741 ) ( not ( = ?auto_18740 ?auto_18741 ) ) ( not ( = ?auto_18740 ?auto_18756 ) ) ( not ( = ?auto_18741 ?auto_18756 ) ) ( SURFACE-AT ?auto_18739 ?auto_18753 ) ( CLEAR ?auto_18739 ) ( IS-CRATE ?auto_18740 ) ( AVAILABLE ?auto_18754 ) ( AVAILABLE ?auto_18762 ) ( SURFACE-AT ?auto_18740 ?auto_18769 ) ( ON ?auto_18740 ?auto_18755 ) ( CLEAR ?auto_18740 ) ( TRUCK-AT ?auto_18749 ?auto_18753 ) ( not ( = ?auto_18739 ?auto_18740 ) ) ( not ( = ?auto_18739 ?auto_18755 ) ) ( not ( = ?auto_18740 ?auto_18755 ) ) ( not ( = ?auto_18739 ?auto_18741 ) ) ( not ( = ?auto_18739 ?auto_18756 ) ) ( not ( = ?auto_18741 ?auto_18755 ) ) ( not ( = ?auto_18750 ?auto_18769 ) ) ( not ( = ?auto_18751 ?auto_18762 ) ) ( not ( = ?auto_18756 ?auto_18755 ) ) ( not ( = ?auto_18739 ?auto_18742 ) ) ( not ( = ?auto_18739 ?auto_18758 ) ) ( not ( = ?auto_18740 ?auto_18742 ) ) ( not ( = ?auto_18740 ?auto_18758 ) ) ( not ( = ?auto_18742 ?auto_18756 ) ) ( not ( = ?auto_18742 ?auto_18755 ) ) ( not ( = ?auto_18763 ?auto_18750 ) ) ( not ( = ?auto_18763 ?auto_18769 ) ) ( not ( = ?auto_18768 ?auto_18751 ) ) ( not ( = ?auto_18768 ?auto_18762 ) ) ( not ( = ?auto_18758 ?auto_18756 ) ) ( not ( = ?auto_18758 ?auto_18755 ) ) ( not ( = ?auto_18739 ?auto_18743 ) ) ( not ( = ?auto_18739 ?auto_18757 ) ) ( not ( = ?auto_18740 ?auto_18743 ) ) ( not ( = ?auto_18740 ?auto_18757 ) ) ( not ( = ?auto_18741 ?auto_18743 ) ) ( not ( = ?auto_18741 ?auto_18757 ) ) ( not ( = ?auto_18743 ?auto_18758 ) ) ( not ( = ?auto_18743 ?auto_18756 ) ) ( not ( = ?auto_18743 ?auto_18755 ) ) ( not ( = ?auto_18757 ?auto_18758 ) ) ( not ( = ?auto_18757 ?auto_18756 ) ) ( not ( = ?auto_18757 ?auto_18755 ) ) ( not ( = ?auto_18739 ?auto_18744 ) ) ( not ( = ?auto_18739 ?auto_18761 ) ) ( not ( = ?auto_18740 ?auto_18744 ) ) ( not ( = ?auto_18740 ?auto_18761 ) ) ( not ( = ?auto_18741 ?auto_18744 ) ) ( not ( = ?auto_18741 ?auto_18761 ) ) ( not ( = ?auto_18742 ?auto_18744 ) ) ( not ( = ?auto_18742 ?auto_18761 ) ) ( not ( = ?auto_18744 ?auto_18757 ) ) ( not ( = ?auto_18744 ?auto_18758 ) ) ( not ( = ?auto_18744 ?auto_18756 ) ) ( not ( = ?auto_18744 ?auto_18755 ) ) ( not ( = ?auto_18759 ?auto_18750 ) ) ( not ( = ?auto_18759 ?auto_18763 ) ) ( not ( = ?auto_18759 ?auto_18769 ) ) ( not ( = ?auto_18767 ?auto_18751 ) ) ( not ( = ?auto_18767 ?auto_18768 ) ) ( not ( = ?auto_18767 ?auto_18762 ) ) ( not ( = ?auto_18761 ?auto_18757 ) ) ( not ( = ?auto_18761 ?auto_18758 ) ) ( not ( = ?auto_18761 ?auto_18756 ) ) ( not ( = ?auto_18761 ?auto_18755 ) ) ( not ( = ?auto_18739 ?auto_18745 ) ) ( not ( = ?auto_18739 ?auto_18760 ) ) ( not ( = ?auto_18740 ?auto_18745 ) ) ( not ( = ?auto_18740 ?auto_18760 ) ) ( not ( = ?auto_18741 ?auto_18745 ) ) ( not ( = ?auto_18741 ?auto_18760 ) ) ( not ( = ?auto_18742 ?auto_18745 ) ) ( not ( = ?auto_18742 ?auto_18760 ) ) ( not ( = ?auto_18743 ?auto_18745 ) ) ( not ( = ?auto_18743 ?auto_18760 ) ) ( not ( = ?auto_18745 ?auto_18761 ) ) ( not ( = ?auto_18745 ?auto_18757 ) ) ( not ( = ?auto_18745 ?auto_18758 ) ) ( not ( = ?auto_18745 ?auto_18756 ) ) ( not ( = ?auto_18745 ?auto_18755 ) ) ( not ( = ?auto_18760 ?auto_18761 ) ) ( not ( = ?auto_18760 ?auto_18757 ) ) ( not ( = ?auto_18760 ?auto_18758 ) ) ( not ( = ?auto_18760 ?auto_18756 ) ) ( not ( = ?auto_18760 ?auto_18755 ) ) ( not ( = ?auto_18739 ?auto_18746 ) ) ( not ( = ?auto_18739 ?auto_18765 ) ) ( not ( = ?auto_18740 ?auto_18746 ) ) ( not ( = ?auto_18740 ?auto_18765 ) ) ( not ( = ?auto_18741 ?auto_18746 ) ) ( not ( = ?auto_18741 ?auto_18765 ) ) ( not ( = ?auto_18742 ?auto_18746 ) ) ( not ( = ?auto_18742 ?auto_18765 ) ) ( not ( = ?auto_18743 ?auto_18746 ) ) ( not ( = ?auto_18743 ?auto_18765 ) ) ( not ( = ?auto_18744 ?auto_18746 ) ) ( not ( = ?auto_18744 ?auto_18765 ) ) ( not ( = ?auto_18746 ?auto_18760 ) ) ( not ( = ?auto_18746 ?auto_18761 ) ) ( not ( = ?auto_18746 ?auto_18757 ) ) ( not ( = ?auto_18746 ?auto_18758 ) ) ( not ( = ?auto_18746 ?auto_18756 ) ) ( not ( = ?auto_18746 ?auto_18755 ) ) ( not ( = ?auto_18764 ?auto_18769 ) ) ( not ( = ?auto_18764 ?auto_18759 ) ) ( not ( = ?auto_18764 ?auto_18750 ) ) ( not ( = ?auto_18764 ?auto_18763 ) ) ( not ( = ?auto_18766 ?auto_18762 ) ) ( not ( = ?auto_18766 ?auto_18767 ) ) ( not ( = ?auto_18766 ?auto_18751 ) ) ( not ( = ?auto_18766 ?auto_18768 ) ) ( not ( = ?auto_18765 ?auto_18760 ) ) ( not ( = ?auto_18765 ?auto_18761 ) ) ( not ( = ?auto_18765 ?auto_18757 ) ) ( not ( = ?auto_18765 ?auto_18758 ) ) ( not ( = ?auto_18765 ?auto_18756 ) ) ( not ( = ?auto_18765 ?auto_18755 ) ) ( not ( = ?auto_18739 ?auto_18747 ) ) ( not ( = ?auto_18739 ?auto_18770 ) ) ( not ( = ?auto_18740 ?auto_18747 ) ) ( not ( = ?auto_18740 ?auto_18770 ) ) ( not ( = ?auto_18741 ?auto_18747 ) ) ( not ( = ?auto_18741 ?auto_18770 ) ) ( not ( = ?auto_18742 ?auto_18747 ) ) ( not ( = ?auto_18742 ?auto_18770 ) ) ( not ( = ?auto_18743 ?auto_18747 ) ) ( not ( = ?auto_18743 ?auto_18770 ) ) ( not ( = ?auto_18744 ?auto_18747 ) ) ( not ( = ?auto_18744 ?auto_18770 ) ) ( not ( = ?auto_18745 ?auto_18747 ) ) ( not ( = ?auto_18745 ?auto_18770 ) ) ( not ( = ?auto_18747 ?auto_18765 ) ) ( not ( = ?auto_18747 ?auto_18760 ) ) ( not ( = ?auto_18747 ?auto_18761 ) ) ( not ( = ?auto_18747 ?auto_18757 ) ) ( not ( = ?auto_18747 ?auto_18758 ) ) ( not ( = ?auto_18747 ?auto_18756 ) ) ( not ( = ?auto_18747 ?auto_18755 ) ) ( not ( = ?auto_18770 ?auto_18765 ) ) ( not ( = ?auto_18770 ?auto_18760 ) ) ( not ( = ?auto_18770 ?auto_18761 ) ) ( not ( = ?auto_18770 ?auto_18757 ) ) ( not ( = ?auto_18770 ?auto_18758 ) ) ( not ( = ?auto_18770 ?auto_18756 ) ) ( not ( = ?auto_18770 ?auto_18755 ) ) ( not ( = ?auto_18739 ?auto_18748 ) ) ( not ( = ?auto_18739 ?auto_18752 ) ) ( not ( = ?auto_18740 ?auto_18748 ) ) ( not ( = ?auto_18740 ?auto_18752 ) ) ( not ( = ?auto_18741 ?auto_18748 ) ) ( not ( = ?auto_18741 ?auto_18752 ) ) ( not ( = ?auto_18742 ?auto_18748 ) ) ( not ( = ?auto_18742 ?auto_18752 ) ) ( not ( = ?auto_18743 ?auto_18748 ) ) ( not ( = ?auto_18743 ?auto_18752 ) ) ( not ( = ?auto_18744 ?auto_18748 ) ) ( not ( = ?auto_18744 ?auto_18752 ) ) ( not ( = ?auto_18745 ?auto_18748 ) ) ( not ( = ?auto_18745 ?auto_18752 ) ) ( not ( = ?auto_18746 ?auto_18748 ) ) ( not ( = ?auto_18746 ?auto_18752 ) ) ( not ( = ?auto_18748 ?auto_18770 ) ) ( not ( = ?auto_18748 ?auto_18765 ) ) ( not ( = ?auto_18748 ?auto_18760 ) ) ( not ( = ?auto_18748 ?auto_18761 ) ) ( not ( = ?auto_18748 ?auto_18757 ) ) ( not ( = ?auto_18748 ?auto_18758 ) ) ( not ( = ?auto_18748 ?auto_18756 ) ) ( not ( = ?auto_18748 ?auto_18755 ) ) ( not ( = ?auto_18752 ?auto_18770 ) ) ( not ( = ?auto_18752 ?auto_18765 ) ) ( not ( = ?auto_18752 ?auto_18760 ) ) ( not ( = ?auto_18752 ?auto_18761 ) ) ( not ( = ?auto_18752 ?auto_18757 ) ) ( not ( = ?auto_18752 ?auto_18758 ) ) ( not ( = ?auto_18752 ?auto_18756 ) ) ( not ( = ?auto_18752 ?auto_18755 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18739 ?auto_18740 ?auto_18741 ?auto_18742 ?auto_18743 ?auto_18744 ?auto_18745 ?auto_18746 ?auto_18747 )
      ( MAKE-1CRATE ?auto_18747 ?auto_18748 )
      ( MAKE-9CRATE-VERIFY ?auto_18739 ?auto_18740 ?auto_18741 ?auto_18742 ?auto_18743 ?auto_18744 ?auto_18745 ?auto_18746 ?auto_18747 ?auto_18748 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_18792 - SURFACE
      ?auto_18793 - SURFACE
      ?auto_18794 - SURFACE
      ?auto_18795 - SURFACE
      ?auto_18796 - SURFACE
      ?auto_18797 - SURFACE
      ?auto_18798 - SURFACE
      ?auto_18799 - SURFACE
      ?auto_18800 - SURFACE
      ?auto_18801 - SURFACE
      ?auto_18802 - SURFACE
    )
    :vars
    (
      ?auto_18805 - HOIST
      ?auto_18807 - PLACE
      ?auto_18804 - PLACE
      ?auto_18808 - HOIST
      ?auto_18806 - SURFACE
      ?auto_18817 - SURFACE
      ?auto_18820 - PLACE
      ?auto_18822 - HOIST
      ?auto_18812 - SURFACE
      ?auto_18809 - PLACE
      ?auto_18811 - HOIST
      ?auto_18824 - SURFACE
      ?auto_18816 - PLACE
      ?auto_18815 - HOIST
      ?auto_18819 - SURFACE
      ?auto_18813 - PLACE
      ?auto_18810 - HOIST
      ?auto_18823 - SURFACE
      ?auto_18825 - SURFACE
      ?auto_18821 - SURFACE
      ?auto_18818 - SURFACE
      ?auto_18814 - SURFACE
      ?auto_18803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18805 ?auto_18807 ) ( IS-CRATE ?auto_18802 ) ( not ( = ?auto_18804 ?auto_18807 ) ) ( HOIST-AT ?auto_18808 ?auto_18804 ) ( SURFACE-AT ?auto_18802 ?auto_18804 ) ( ON ?auto_18802 ?auto_18806 ) ( CLEAR ?auto_18802 ) ( not ( = ?auto_18801 ?auto_18802 ) ) ( not ( = ?auto_18801 ?auto_18806 ) ) ( not ( = ?auto_18802 ?auto_18806 ) ) ( not ( = ?auto_18805 ?auto_18808 ) ) ( IS-CRATE ?auto_18801 ) ( SURFACE-AT ?auto_18801 ?auto_18804 ) ( ON ?auto_18801 ?auto_18817 ) ( CLEAR ?auto_18801 ) ( not ( = ?auto_18800 ?auto_18801 ) ) ( not ( = ?auto_18800 ?auto_18817 ) ) ( not ( = ?auto_18801 ?auto_18817 ) ) ( IS-CRATE ?auto_18800 ) ( not ( = ?auto_18820 ?auto_18807 ) ) ( HOIST-AT ?auto_18822 ?auto_18820 ) ( SURFACE-AT ?auto_18800 ?auto_18820 ) ( ON ?auto_18800 ?auto_18812 ) ( CLEAR ?auto_18800 ) ( not ( = ?auto_18799 ?auto_18800 ) ) ( not ( = ?auto_18799 ?auto_18812 ) ) ( not ( = ?auto_18800 ?auto_18812 ) ) ( not ( = ?auto_18805 ?auto_18822 ) ) ( IS-CRATE ?auto_18799 ) ( not ( = ?auto_18809 ?auto_18807 ) ) ( HOIST-AT ?auto_18811 ?auto_18809 ) ( AVAILABLE ?auto_18811 ) ( SURFACE-AT ?auto_18799 ?auto_18809 ) ( ON ?auto_18799 ?auto_18824 ) ( CLEAR ?auto_18799 ) ( not ( = ?auto_18798 ?auto_18799 ) ) ( not ( = ?auto_18798 ?auto_18824 ) ) ( not ( = ?auto_18799 ?auto_18824 ) ) ( not ( = ?auto_18805 ?auto_18811 ) ) ( IS-CRATE ?auto_18798 ) ( not ( = ?auto_18816 ?auto_18807 ) ) ( HOIST-AT ?auto_18815 ?auto_18816 ) ( SURFACE-AT ?auto_18798 ?auto_18816 ) ( ON ?auto_18798 ?auto_18819 ) ( CLEAR ?auto_18798 ) ( not ( = ?auto_18797 ?auto_18798 ) ) ( not ( = ?auto_18797 ?auto_18819 ) ) ( not ( = ?auto_18798 ?auto_18819 ) ) ( not ( = ?auto_18805 ?auto_18815 ) ) ( IS-CRATE ?auto_18797 ) ( not ( = ?auto_18813 ?auto_18807 ) ) ( HOIST-AT ?auto_18810 ?auto_18813 ) ( AVAILABLE ?auto_18810 ) ( SURFACE-AT ?auto_18797 ?auto_18813 ) ( ON ?auto_18797 ?auto_18823 ) ( CLEAR ?auto_18797 ) ( not ( = ?auto_18796 ?auto_18797 ) ) ( not ( = ?auto_18796 ?auto_18823 ) ) ( not ( = ?auto_18797 ?auto_18823 ) ) ( not ( = ?auto_18805 ?auto_18810 ) ) ( IS-CRATE ?auto_18796 ) ( SURFACE-AT ?auto_18796 ?auto_18804 ) ( ON ?auto_18796 ?auto_18825 ) ( CLEAR ?auto_18796 ) ( not ( = ?auto_18795 ?auto_18796 ) ) ( not ( = ?auto_18795 ?auto_18825 ) ) ( not ( = ?auto_18796 ?auto_18825 ) ) ( IS-CRATE ?auto_18795 ) ( AVAILABLE ?auto_18822 ) ( SURFACE-AT ?auto_18795 ?auto_18820 ) ( ON ?auto_18795 ?auto_18821 ) ( CLEAR ?auto_18795 ) ( not ( = ?auto_18794 ?auto_18795 ) ) ( not ( = ?auto_18794 ?auto_18821 ) ) ( not ( = ?auto_18795 ?auto_18821 ) ) ( IS-CRATE ?auto_18794 ) ( AVAILABLE ?auto_18808 ) ( SURFACE-AT ?auto_18794 ?auto_18804 ) ( ON ?auto_18794 ?auto_18818 ) ( CLEAR ?auto_18794 ) ( not ( = ?auto_18793 ?auto_18794 ) ) ( not ( = ?auto_18793 ?auto_18818 ) ) ( not ( = ?auto_18794 ?auto_18818 ) ) ( SURFACE-AT ?auto_18792 ?auto_18807 ) ( CLEAR ?auto_18792 ) ( IS-CRATE ?auto_18793 ) ( AVAILABLE ?auto_18805 ) ( AVAILABLE ?auto_18815 ) ( SURFACE-AT ?auto_18793 ?auto_18816 ) ( ON ?auto_18793 ?auto_18814 ) ( CLEAR ?auto_18793 ) ( TRUCK-AT ?auto_18803 ?auto_18807 ) ( not ( = ?auto_18792 ?auto_18793 ) ) ( not ( = ?auto_18792 ?auto_18814 ) ) ( not ( = ?auto_18793 ?auto_18814 ) ) ( not ( = ?auto_18792 ?auto_18794 ) ) ( not ( = ?auto_18792 ?auto_18818 ) ) ( not ( = ?auto_18794 ?auto_18814 ) ) ( not ( = ?auto_18804 ?auto_18816 ) ) ( not ( = ?auto_18808 ?auto_18815 ) ) ( not ( = ?auto_18818 ?auto_18814 ) ) ( not ( = ?auto_18792 ?auto_18795 ) ) ( not ( = ?auto_18792 ?auto_18821 ) ) ( not ( = ?auto_18793 ?auto_18795 ) ) ( not ( = ?auto_18793 ?auto_18821 ) ) ( not ( = ?auto_18795 ?auto_18818 ) ) ( not ( = ?auto_18795 ?auto_18814 ) ) ( not ( = ?auto_18820 ?auto_18804 ) ) ( not ( = ?auto_18820 ?auto_18816 ) ) ( not ( = ?auto_18822 ?auto_18808 ) ) ( not ( = ?auto_18822 ?auto_18815 ) ) ( not ( = ?auto_18821 ?auto_18818 ) ) ( not ( = ?auto_18821 ?auto_18814 ) ) ( not ( = ?auto_18792 ?auto_18796 ) ) ( not ( = ?auto_18792 ?auto_18825 ) ) ( not ( = ?auto_18793 ?auto_18796 ) ) ( not ( = ?auto_18793 ?auto_18825 ) ) ( not ( = ?auto_18794 ?auto_18796 ) ) ( not ( = ?auto_18794 ?auto_18825 ) ) ( not ( = ?auto_18796 ?auto_18821 ) ) ( not ( = ?auto_18796 ?auto_18818 ) ) ( not ( = ?auto_18796 ?auto_18814 ) ) ( not ( = ?auto_18825 ?auto_18821 ) ) ( not ( = ?auto_18825 ?auto_18818 ) ) ( not ( = ?auto_18825 ?auto_18814 ) ) ( not ( = ?auto_18792 ?auto_18797 ) ) ( not ( = ?auto_18792 ?auto_18823 ) ) ( not ( = ?auto_18793 ?auto_18797 ) ) ( not ( = ?auto_18793 ?auto_18823 ) ) ( not ( = ?auto_18794 ?auto_18797 ) ) ( not ( = ?auto_18794 ?auto_18823 ) ) ( not ( = ?auto_18795 ?auto_18797 ) ) ( not ( = ?auto_18795 ?auto_18823 ) ) ( not ( = ?auto_18797 ?auto_18825 ) ) ( not ( = ?auto_18797 ?auto_18821 ) ) ( not ( = ?auto_18797 ?auto_18818 ) ) ( not ( = ?auto_18797 ?auto_18814 ) ) ( not ( = ?auto_18813 ?auto_18804 ) ) ( not ( = ?auto_18813 ?auto_18820 ) ) ( not ( = ?auto_18813 ?auto_18816 ) ) ( not ( = ?auto_18810 ?auto_18808 ) ) ( not ( = ?auto_18810 ?auto_18822 ) ) ( not ( = ?auto_18810 ?auto_18815 ) ) ( not ( = ?auto_18823 ?auto_18825 ) ) ( not ( = ?auto_18823 ?auto_18821 ) ) ( not ( = ?auto_18823 ?auto_18818 ) ) ( not ( = ?auto_18823 ?auto_18814 ) ) ( not ( = ?auto_18792 ?auto_18798 ) ) ( not ( = ?auto_18792 ?auto_18819 ) ) ( not ( = ?auto_18793 ?auto_18798 ) ) ( not ( = ?auto_18793 ?auto_18819 ) ) ( not ( = ?auto_18794 ?auto_18798 ) ) ( not ( = ?auto_18794 ?auto_18819 ) ) ( not ( = ?auto_18795 ?auto_18798 ) ) ( not ( = ?auto_18795 ?auto_18819 ) ) ( not ( = ?auto_18796 ?auto_18798 ) ) ( not ( = ?auto_18796 ?auto_18819 ) ) ( not ( = ?auto_18798 ?auto_18823 ) ) ( not ( = ?auto_18798 ?auto_18825 ) ) ( not ( = ?auto_18798 ?auto_18821 ) ) ( not ( = ?auto_18798 ?auto_18818 ) ) ( not ( = ?auto_18798 ?auto_18814 ) ) ( not ( = ?auto_18819 ?auto_18823 ) ) ( not ( = ?auto_18819 ?auto_18825 ) ) ( not ( = ?auto_18819 ?auto_18821 ) ) ( not ( = ?auto_18819 ?auto_18818 ) ) ( not ( = ?auto_18819 ?auto_18814 ) ) ( not ( = ?auto_18792 ?auto_18799 ) ) ( not ( = ?auto_18792 ?auto_18824 ) ) ( not ( = ?auto_18793 ?auto_18799 ) ) ( not ( = ?auto_18793 ?auto_18824 ) ) ( not ( = ?auto_18794 ?auto_18799 ) ) ( not ( = ?auto_18794 ?auto_18824 ) ) ( not ( = ?auto_18795 ?auto_18799 ) ) ( not ( = ?auto_18795 ?auto_18824 ) ) ( not ( = ?auto_18796 ?auto_18799 ) ) ( not ( = ?auto_18796 ?auto_18824 ) ) ( not ( = ?auto_18797 ?auto_18799 ) ) ( not ( = ?auto_18797 ?auto_18824 ) ) ( not ( = ?auto_18799 ?auto_18819 ) ) ( not ( = ?auto_18799 ?auto_18823 ) ) ( not ( = ?auto_18799 ?auto_18825 ) ) ( not ( = ?auto_18799 ?auto_18821 ) ) ( not ( = ?auto_18799 ?auto_18818 ) ) ( not ( = ?auto_18799 ?auto_18814 ) ) ( not ( = ?auto_18809 ?auto_18816 ) ) ( not ( = ?auto_18809 ?auto_18813 ) ) ( not ( = ?auto_18809 ?auto_18804 ) ) ( not ( = ?auto_18809 ?auto_18820 ) ) ( not ( = ?auto_18811 ?auto_18815 ) ) ( not ( = ?auto_18811 ?auto_18810 ) ) ( not ( = ?auto_18811 ?auto_18808 ) ) ( not ( = ?auto_18811 ?auto_18822 ) ) ( not ( = ?auto_18824 ?auto_18819 ) ) ( not ( = ?auto_18824 ?auto_18823 ) ) ( not ( = ?auto_18824 ?auto_18825 ) ) ( not ( = ?auto_18824 ?auto_18821 ) ) ( not ( = ?auto_18824 ?auto_18818 ) ) ( not ( = ?auto_18824 ?auto_18814 ) ) ( not ( = ?auto_18792 ?auto_18800 ) ) ( not ( = ?auto_18792 ?auto_18812 ) ) ( not ( = ?auto_18793 ?auto_18800 ) ) ( not ( = ?auto_18793 ?auto_18812 ) ) ( not ( = ?auto_18794 ?auto_18800 ) ) ( not ( = ?auto_18794 ?auto_18812 ) ) ( not ( = ?auto_18795 ?auto_18800 ) ) ( not ( = ?auto_18795 ?auto_18812 ) ) ( not ( = ?auto_18796 ?auto_18800 ) ) ( not ( = ?auto_18796 ?auto_18812 ) ) ( not ( = ?auto_18797 ?auto_18800 ) ) ( not ( = ?auto_18797 ?auto_18812 ) ) ( not ( = ?auto_18798 ?auto_18800 ) ) ( not ( = ?auto_18798 ?auto_18812 ) ) ( not ( = ?auto_18800 ?auto_18824 ) ) ( not ( = ?auto_18800 ?auto_18819 ) ) ( not ( = ?auto_18800 ?auto_18823 ) ) ( not ( = ?auto_18800 ?auto_18825 ) ) ( not ( = ?auto_18800 ?auto_18821 ) ) ( not ( = ?auto_18800 ?auto_18818 ) ) ( not ( = ?auto_18800 ?auto_18814 ) ) ( not ( = ?auto_18812 ?auto_18824 ) ) ( not ( = ?auto_18812 ?auto_18819 ) ) ( not ( = ?auto_18812 ?auto_18823 ) ) ( not ( = ?auto_18812 ?auto_18825 ) ) ( not ( = ?auto_18812 ?auto_18821 ) ) ( not ( = ?auto_18812 ?auto_18818 ) ) ( not ( = ?auto_18812 ?auto_18814 ) ) ( not ( = ?auto_18792 ?auto_18801 ) ) ( not ( = ?auto_18792 ?auto_18817 ) ) ( not ( = ?auto_18793 ?auto_18801 ) ) ( not ( = ?auto_18793 ?auto_18817 ) ) ( not ( = ?auto_18794 ?auto_18801 ) ) ( not ( = ?auto_18794 ?auto_18817 ) ) ( not ( = ?auto_18795 ?auto_18801 ) ) ( not ( = ?auto_18795 ?auto_18817 ) ) ( not ( = ?auto_18796 ?auto_18801 ) ) ( not ( = ?auto_18796 ?auto_18817 ) ) ( not ( = ?auto_18797 ?auto_18801 ) ) ( not ( = ?auto_18797 ?auto_18817 ) ) ( not ( = ?auto_18798 ?auto_18801 ) ) ( not ( = ?auto_18798 ?auto_18817 ) ) ( not ( = ?auto_18799 ?auto_18801 ) ) ( not ( = ?auto_18799 ?auto_18817 ) ) ( not ( = ?auto_18801 ?auto_18812 ) ) ( not ( = ?auto_18801 ?auto_18824 ) ) ( not ( = ?auto_18801 ?auto_18819 ) ) ( not ( = ?auto_18801 ?auto_18823 ) ) ( not ( = ?auto_18801 ?auto_18825 ) ) ( not ( = ?auto_18801 ?auto_18821 ) ) ( not ( = ?auto_18801 ?auto_18818 ) ) ( not ( = ?auto_18801 ?auto_18814 ) ) ( not ( = ?auto_18817 ?auto_18812 ) ) ( not ( = ?auto_18817 ?auto_18824 ) ) ( not ( = ?auto_18817 ?auto_18819 ) ) ( not ( = ?auto_18817 ?auto_18823 ) ) ( not ( = ?auto_18817 ?auto_18825 ) ) ( not ( = ?auto_18817 ?auto_18821 ) ) ( not ( = ?auto_18817 ?auto_18818 ) ) ( not ( = ?auto_18817 ?auto_18814 ) ) ( not ( = ?auto_18792 ?auto_18802 ) ) ( not ( = ?auto_18792 ?auto_18806 ) ) ( not ( = ?auto_18793 ?auto_18802 ) ) ( not ( = ?auto_18793 ?auto_18806 ) ) ( not ( = ?auto_18794 ?auto_18802 ) ) ( not ( = ?auto_18794 ?auto_18806 ) ) ( not ( = ?auto_18795 ?auto_18802 ) ) ( not ( = ?auto_18795 ?auto_18806 ) ) ( not ( = ?auto_18796 ?auto_18802 ) ) ( not ( = ?auto_18796 ?auto_18806 ) ) ( not ( = ?auto_18797 ?auto_18802 ) ) ( not ( = ?auto_18797 ?auto_18806 ) ) ( not ( = ?auto_18798 ?auto_18802 ) ) ( not ( = ?auto_18798 ?auto_18806 ) ) ( not ( = ?auto_18799 ?auto_18802 ) ) ( not ( = ?auto_18799 ?auto_18806 ) ) ( not ( = ?auto_18800 ?auto_18802 ) ) ( not ( = ?auto_18800 ?auto_18806 ) ) ( not ( = ?auto_18802 ?auto_18817 ) ) ( not ( = ?auto_18802 ?auto_18812 ) ) ( not ( = ?auto_18802 ?auto_18824 ) ) ( not ( = ?auto_18802 ?auto_18819 ) ) ( not ( = ?auto_18802 ?auto_18823 ) ) ( not ( = ?auto_18802 ?auto_18825 ) ) ( not ( = ?auto_18802 ?auto_18821 ) ) ( not ( = ?auto_18802 ?auto_18818 ) ) ( not ( = ?auto_18802 ?auto_18814 ) ) ( not ( = ?auto_18806 ?auto_18817 ) ) ( not ( = ?auto_18806 ?auto_18812 ) ) ( not ( = ?auto_18806 ?auto_18824 ) ) ( not ( = ?auto_18806 ?auto_18819 ) ) ( not ( = ?auto_18806 ?auto_18823 ) ) ( not ( = ?auto_18806 ?auto_18825 ) ) ( not ( = ?auto_18806 ?auto_18821 ) ) ( not ( = ?auto_18806 ?auto_18818 ) ) ( not ( = ?auto_18806 ?auto_18814 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18792 ?auto_18793 ?auto_18794 ?auto_18795 ?auto_18796 ?auto_18797 ?auto_18798 ?auto_18799 ?auto_18800 ?auto_18801 )
      ( MAKE-1CRATE ?auto_18801 ?auto_18802 )
      ( MAKE-10CRATE-VERIFY ?auto_18792 ?auto_18793 ?auto_18794 ?auto_18795 ?auto_18796 ?auto_18797 ?auto_18798 ?auto_18799 ?auto_18800 ?auto_18801 ?auto_18802 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_18848 - SURFACE
      ?auto_18849 - SURFACE
      ?auto_18850 - SURFACE
      ?auto_18851 - SURFACE
      ?auto_18852 - SURFACE
      ?auto_18853 - SURFACE
      ?auto_18854 - SURFACE
      ?auto_18855 - SURFACE
      ?auto_18856 - SURFACE
      ?auto_18857 - SURFACE
      ?auto_18858 - SURFACE
      ?auto_18859 - SURFACE
    )
    :vars
    (
      ?auto_18860 - HOIST
      ?auto_18864 - PLACE
      ?auto_18865 - PLACE
      ?auto_18861 - HOIST
      ?auto_18862 - SURFACE
      ?auto_18880 - PLACE
      ?auto_18877 - HOIST
      ?auto_18878 - SURFACE
      ?auto_18867 - SURFACE
      ?auto_18868 - PLACE
      ?auto_18872 - HOIST
      ?auto_18879 - SURFACE
      ?auto_18869 - PLACE
      ?auto_18881 - HOIST
      ?auto_18873 - SURFACE
      ?auto_18874 - SURFACE
      ?auto_18882 - PLACE
      ?auto_18883 - HOIST
      ?auto_18871 - SURFACE
      ?auto_18866 - SURFACE
      ?auto_18875 - SURFACE
      ?auto_18870 - SURFACE
      ?auto_18876 - SURFACE
      ?auto_18863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18860 ?auto_18864 ) ( IS-CRATE ?auto_18859 ) ( not ( = ?auto_18865 ?auto_18864 ) ) ( HOIST-AT ?auto_18861 ?auto_18865 ) ( SURFACE-AT ?auto_18859 ?auto_18865 ) ( ON ?auto_18859 ?auto_18862 ) ( CLEAR ?auto_18859 ) ( not ( = ?auto_18858 ?auto_18859 ) ) ( not ( = ?auto_18858 ?auto_18862 ) ) ( not ( = ?auto_18859 ?auto_18862 ) ) ( not ( = ?auto_18860 ?auto_18861 ) ) ( IS-CRATE ?auto_18858 ) ( not ( = ?auto_18880 ?auto_18864 ) ) ( HOIST-AT ?auto_18877 ?auto_18880 ) ( SURFACE-AT ?auto_18858 ?auto_18880 ) ( ON ?auto_18858 ?auto_18878 ) ( CLEAR ?auto_18858 ) ( not ( = ?auto_18857 ?auto_18858 ) ) ( not ( = ?auto_18857 ?auto_18878 ) ) ( not ( = ?auto_18858 ?auto_18878 ) ) ( not ( = ?auto_18860 ?auto_18877 ) ) ( IS-CRATE ?auto_18857 ) ( SURFACE-AT ?auto_18857 ?auto_18880 ) ( ON ?auto_18857 ?auto_18867 ) ( CLEAR ?auto_18857 ) ( not ( = ?auto_18856 ?auto_18857 ) ) ( not ( = ?auto_18856 ?auto_18867 ) ) ( not ( = ?auto_18857 ?auto_18867 ) ) ( IS-CRATE ?auto_18856 ) ( not ( = ?auto_18868 ?auto_18864 ) ) ( HOIST-AT ?auto_18872 ?auto_18868 ) ( SURFACE-AT ?auto_18856 ?auto_18868 ) ( ON ?auto_18856 ?auto_18879 ) ( CLEAR ?auto_18856 ) ( not ( = ?auto_18855 ?auto_18856 ) ) ( not ( = ?auto_18855 ?auto_18879 ) ) ( not ( = ?auto_18856 ?auto_18879 ) ) ( not ( = ?auto_18860 ?auto_18872 ) ) ( IS-CRATE ?auto_18855 ) ( not ( = ?auto_18869 ?auto_18864 ) ) ( HOIST-AT ?auto_18881 ?auto_18869 ) ( AVAILABLE ?auto_18881 ) ( SURFACE-AT ?auto_18855 ?auto_18869 ) ( ON ?auto_18855 ?auto_18873 ) ( CLEAR ?auto_18855 ) ( not ( = ?auto_18854 ?auto_18855 ) ) ( not ( = ?auto_18854 ?auto_18873 ) ) ( not ( = ?auto_18855 ?auto_18873 ) ) ( not ( = ?auto_18860 ?auto_18881 ) ) ( IS-CRATE ?auto_18854 ) ( SURFACE-AT ?auto_18854 ?auto_18865 ) ( ON ?auto_18854 ?auto_18874 ) ( CLEAR ?auto_18854 ) ( not ( = ?auto_18853 ?auto_18854 ) ) ( not ( = ?auto_18853 ?auto_18874 ) ) ( not ( = ?auto_18854 ?auto_18874 ) ) ( IS-CRATE ?auto_18853 ) ( not ( = ?auto_18882 ?auto_18864 ) ) ( HOIST-AT ?auto_18883 ?auto_18882 ) ( AVAILABLE ?auto_18883 ) ( SURFACE-AT ?auto_18853 ?auto_18882 ) ( ON ?auto_18853 ?auto_18871 ) ( CLEAR ?auto_18853 ) ( not ( = ?auto_18852 ?auto_18853 ) ) ( not ( = ?auto_18852 ?auto_18871 ) ) ( not ( = ?auto_18853 ?auto_18871 ) ) ( not ( = ?auto_18860 ?auto_18883 ) ) ( IS-CRATE ?auto_18852 ) ( SURFACE-AT ?auto_18852 ?auto_18880 ) ( ON ?auto_18852 ?auto_18866 ) ( CLEAR ?auto_18852 ) ( not ( = ?auto_18851 ?auto_18852 ) ) ( not ( = ?auto_18851 ?auto_18866 ) ) ( not ( = ?auto_18852 ?auto_18866 ) ) ( IS-CRATE ?auto_18851 ) ( AVAILABLE ?auto_18872 ) ( SURFACE-AT ?auto_18851 ?auto_18868 ) ( ON ?auto_18851 ?auto_18875 ) ( CLEAR ?auto_18851 ) ( not ( = ?auto_18850 ?auto_18851 ) ) ( not ( = ?auto_18850 ?auto_18875 ) ) ( not ( = ?auto_18851 ?auto_18875 ) ) ( IS-CRATE ?auto_18850 ) ( AVAILABLE ?auto_18877 ) ( SURFACE-AT ?auto_18850 ?auto_18880 ) ( ON ?auto_18850 ?auto_18870 ) ( CLEAR ?auto_18850 ) ( not ( = ?auto_18849 ?auto_18850 ) ) ( not ( = ?auto_18849 ?auto_18870 ) ) ( not ( = ?auto_18850 ?auto_18870 ) ) ( SURFACE-AT ?auto_18848 ?auto_18864 ) ( CLEAR ?auto_18848 ) ( IS-CRATE ?auto_18849 ) ( AVAILABLE ?auto_18860 ) ( AVAILABLE ?auto_18861 ) ( SURFACE-AT ?auto_18849 ?auto_18865 ) ( ON ?auto_18849 ?auto_18876 ) ( CLEAR ?auto_18849 ) ( TRUCK-AT ?auto_18863 ?auto_18864 ) ( not ( = ?auto_18848 ?auto_18849 ) ) ( not ( = ?auto_18848 ?auto_18876 ) ) ( not ( = ?auto_18849 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18850 ) ) ( not ( = ?auto_18848 ?auto_18870 ) ) ( not ( = ?auto_18850 ?auto_18876 ) ) ( not ( = ?auto_18880 ?auto_18865 ) ) ( not ( = ?auto_18877 ?auto_18861 ) ) ( not ( = ?auto_18870 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18851 ) ) ( not ( = ?auto_18848 ?auto_18875 ) ) ( not ( = ?auto_18849 ?auto_18851 ) ) ( not ( = ?auto_18849 ?auto_18875 ) ) ( not ( = ?auto_18851 ?auto_18870 ) ) ( not ( = ?auto_18851 ?auto_18876 ) ) ( not ( = ?auto_18868 ?auto_18880 ) ) ( not ( = ?auto_18868 ?auto_18865 ) ) ( not ( = ?auto_18872 ?auto_18877 ) ) ( not ( = ?auto_18872 ?auto_18861 ) ) ( not ( = ?auto_18875 ?auto_18870 ) ) ( not ( = ?auto_18875 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18852 ) ) ( not ( = ?auto_18848 ?auto_18866 ) ) ( not ( = ?auto_18849 ?auto_18852 ) ) ( not ( = ?auto_18849 ?auto_18866 ) ) ( not ( = ?auto_18850 ?auto_18852 ) ) ( not ( = ?auto_18850 ?auto_18866 ) ) ( not ( = ?auto_18852 ?auto_18875 ) ) ( not ( = ?auto_18852 ?auto_18870 ) ) ( not ( = ?auto_18852 ?auto_18876 ) ) ( not ( = ?auto_18866 ?auto_18875 ) ) ( not ( = ?auto_18866 ?auto_18870 ) ) ( not ( = ?auto_18866 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18853 ) ) ( not ( = ?auto_18848 ?auto_18871 ) ) ( not ( = ?auto_18849 ?auto_18853 ) ) ( not ( = ?auto_18849 ?auto_18871 ) ) ( not ( = ?auto_18850 ?auto_18853 ) ) ( not ( = ?auto_18850 ?auto_18871 ) ) ( not ( = ?auto_18851 ?auto_18853 ) ) ( not ( = ?auto_18851 ?auto_18871 ) ) ( not ( = ?auto_18853 ?auto_18866 ) ) ( not ( = ?auto_18853 ?auto_18875 ) ) ( not ( = ?auto_18853 ?auto_18870 ) ) ( not ( = ?auto_18853 ?auto_18876 ) ) ( not ( = ?auto_18882 ?auto_18880 ) ) ( not ( = ?auto_18882 ?auto_18868 ) ) ( not ( = ?auto_18882 ?auto_18865 ) ) ( not ( = ?auto_18883 ?auto_18877 ) ) ( not ( = ?auto_18883 ?auto_18872 ) ) ( not ( = ?auto_18883 ?auto_18861 ) ) ( not ( = ?auto_18871 ?auto_18866 ) ) ( not ( = ?auto_18871 ?auto_18875 ) ) ( not ( = ?auto_18871 ?auto_18870 ) ) ( not ( = ?auto_18871 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18854 ) ) ( not ( = ?auto_18848 ?auto_18874 ) ) ( not ( = ?auto_18849 ?auto_18854 ) ) ( not ( = ?auto_18849 ?auto_18874 ) ) ( not ( = ?auto_18850 ?auto_18854 ) ) ( not ( = ?auto_18850 ?auto_18874 ) ) ( not ( = ?auto_18851 ?auto_18854 ) ) ( not ( = ?auto_18851 ?auto_18874 ) ) ( not ( = ?auto_18852 ?auto_18854 ) ) ( not ( = ?auto_18852 ?auto_18874 ) ) ( not ( = ?auto_18854 ?auto_18871 ) ) ( not ( = ?auto_18854 ?auto_18866 ) ) ( not ( = ?auto_18854 ?auto_18875 ) ) ( not ( = ?auto_18854 ?auto_18870 ) ) ( not ( = ?auto_18854 ?auto_18876 ) ) ( not ( = ?auto_18874 ?auto_18871 ) ) ( not ( = ?auto_18874 ?auto_18866 ) ) ( not ( = ?auto_18874 ?auto_18875 ) ) ( not ( = ?auto_18874 ?auto_18870 ) ) ( not ( = ?auto_18874 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18855 ) ) ( not ( = ?auto_18848 ?auto_18873 ) ) ( not ( = ?auto_18849 ?auto_18855 ) ) ( not ( = ?auto_18849 ?auto_18873 ) ) ( not ( = ?auto_18850 ?auto_18855 ) ) ( not ( = ?auto_18850 ?auto_18873 ) ) ( not ( = ?auto_18851 ?auto_18855 ) ) ( not ( = ?auto_18851 ?auto_18873 ) ) ( not ( = ?auto_18852 ?auto_18855 ) ) ( not ( = ?auto_18852 ?auto_18873 ) ) ( not ( = ?auto_18853 ?auto_18855 ) ) ( not ( = ?auto_18853 ?auto_18873 ) ) ( not ( = ?auto_18855 ?auto_18874 ) ) ( not ( = ?auto_18855 ?auto_18871 ) ) ( not ( = ?auto_18855 ?auto_18866 ) ) ( not ( = ?auto_18855 ?auto_18875 ) ) ( not ( = ?auto_18855 ?auto_18870 ) ) ( not ( = ?auto_18855 ?auto_18876 ) ) ( not ( = ?auto_18869 ?auto_18865 ) ) ( not ( = ?auto_18869 ?auto_18882 ) ) ( not ( = ?auto_18869 ?auto_18880 ) ) ( not ( = ?auto_18869 ?auto_18868 ) ) ( not ( = ?auto_18881 ?auto_18861 ) ) ( not ( = ?auto_18881 ?auto_18883 ) ) ( not ( = ?auto_18881 ?auto_18877 ) ) ( not ( = ?auto_18881 ?auto_18872 ) ) ( not ( = ?auto_18873 ?auto_18874 ) ) ( not ( = ?auto_18873 ?auto_18871 ) ) ( not ( = ?auto_18873 ?auto_18866 ) ) ( not ( = ?auto_18873 ?auto_18875 ) ) ( not ( = ?auto_18873 ?auto_18870 ) ) ( not ( = ?auto_18873 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18856 ) ) ( not ( = ?auto_18848 ?auto_18879 ) ) ( not ( = ?auto_18849 ?auto_18856 ) ) ( not ( = ?auto_18849 ?auto_18879 ) ) ( not ( = ?auto_18850 ?auto_18856 ) ) ( not ( = ?auto_18850 ?auto_18879 ) ) ( not ( = ?auto_18851 ?auto_18856 ) ) ( not ( = ?auto_18851 ?auto_18879 ) ) ( not ( = ?auto_18852 ?auto_18856 ) ) ( not ( = ?auto_18852 ?auto_18879 ) ) ( not ( = ?auto_18853 ?auto_18856 ) ) ( not ( = ?auto_18853 ?auto_18879 ) ) ( not ( = ?auto_18854 ?auto_18856 ) ) ( not ( = ?auto_18854 ?auto_18879 ) ) ( not ( = ?auto_18856 ?auto_18873 ) ) ( not ( = ?auto_18856 ?auto_18874 ) ) ( not ( = ?auto_18856 ?auto_18871 ) ) ( not ( = ?auto_18856 ?auto_18866 ) ) ( not ( = ?auto_18856 ?auto_18875 ) ) ( not ( = ?auto_18856 ?auto_18870 ) ) ( not ( = ?auto_18856 ?auto_18876 ) ) ( not ( = ?auto_18879 ?auto_18873 ) ) ( not ( = ?auto_18879 ?auto_18874 ) ) ( not ( = ?auto_18879 ?auto_18871 ) ) ( not ( = ?auto_18879 ?auto_18866 ) ) ( not ( = ?auto_18879 ?auto_18875 ) ) ( not ( = ?auto_18879 ?auto_18870 ) ) ( not ( = ?auto_18879 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18857 ) ) ( not ( = ?auto_18848 ?auto_18867 ) ) ( not ( = ?auto_18849 ?auto_18857 ) ) ( not ( = ?auto_18849 ?auto_18867 ) ) ( not ( = ?auto_18850 ?auto_18857 ) ) ( not ( = ?auto_18850 ?auto_18867 ) ) ( not ( = ?auto_18851 ?auto_18857 ) ) ( not ( = ?auto_18851 ?auto_18867 ) ) ( not ( = ?auto_18852 ?auto_18857 ) ) ( not ( = ?auto_18852 ?auto_18867 ) ) ( not ( = ?auto_18853 ?auto_18857 ) ) ( not ( = ?auto_18853 ?auto_18867 ) ) ( not ( = ?auto_18854 ?auto_18857 ) ) ( not ( = ?auto_18854 ?auto_18867 ) ) ( not ( = ?auto_18855 ?auto_18857 ) ) ( not ( = ?auto_18855 ?auto_18867 ) ) ( not ( = ?auto_18857 ?auto_18879 ) ) ( not ( = ?auto_18857 ?auto_18873 ) ) ( not ( = ?auto_18857 ?auto_18874 ) ) ( not ( = ?auto_18857 ?auto_18871 ) ) ( not ( = ?auto_18857 ?auto_18866 ) ) ( not ( = ?auto_18857 ?auto_18875 ) ) ( not ( = ?auto_18857 ?auto_18870 ) ) ( not ( = ?auto_18857 ?auto_18876 ) ) ( not ( = ?auto_18867 ?auto_18879 ) ) ( not ( = ?auto_18867 ?auto_18873 ) ) ( not ( = ?auto_18867 ?auto_18874 ) ) ( not ( = ?auto_18867 ?auto_18871 ) ) ( not ( = ?auto_18867 ?auto_18866 ) ) ( not ( = ?auto_18867 ?auto_18875 ) ) ( not ( = ?auto_18867 ?auto_18870 ) ) ( not ( = ?auto_18867 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18858 ) ) ( not ( = ?auto_18848 ?auto_18878 ) ) ( not ( = ?auto_18849 ?auto_18858 ) ) ( not ( = ?auto_18849 ?auto_18878 ) ) ( not ( = ?auto_18850 ?auto_18858 ) ) ( not ( = ?auto_18850 ?auto_18878 ) ) ( not ( = ?auto_18851 ?auto_18858 ) ) ( not ( = ?auto_18851 ?auto_18878 ) ) ( not ( = ?auto_18852 ?auto_18858 ) ) ( not ( = ?auto_18852 ?auto_18878 ) ) ( not ( = ?auto_18853 ?auto_18858 ) ) ( not ( = ?auto_18853 ?auto_18878 ) ) ( not ( = ?auto_18854 ?auto_18858 ) ) ( not ( = ?auto_18854 ?auto_18878 ) ) ( not ( = ?auto_18855 ?auto_18858 ) ) ( not ( = ?auto_18855 ?auto_18878 ) ) ( not ( = ?auto_18856 ?auto_18858 ) ) ( not ( = ?auto_18856 ?auto_18878 ) ) ( not ( = ?auto_18858 ?auto_18867 ) ) ( not ( = ?auto_18858 ?auto_18879 ) ) ( not ( = ?auto_18858 ?auto_18873 ) ) ( not ( = ?auto_18858 ?auto_18874 ) ) ( not ( = ?auto_18858 ?auto_18871 ) ) ( not ( = ?auto_18858 ?auto_18866 ) ) ( not ( = ?auto_18858 ?auto_18875 ) ) ( not ( = ?auto_18858 ?auto_18870 ) ) ( not ( = ?auto_18858 ?auto_18876 ) ) ( not ( = ?auto_18878 ?auto_18867 ) ) ( not ( = ?auto_18878 ?auto_18879 ) ) ( not ( = ?auto_18878 ?auto_18873 ) ) ( not ( = ?auto_18878 ?auto_18874 ) ) ( not ( = ?auto_18878 ?auto_18871 ) ) ( not ( = ?auto_18878 ?auto_18866 ) ) ( not ( = ?auto_18878 ?auto_18875 ) ) ( not ( = ?auto_18878 ?auto_18870 ) ) ( not ( = ?auto_18878 ?auto_18876 ) ) ( not ( = ?auto_18848 ?auto_18859 ) ) ( not ( = ?auto_18848 ?auto_18862 ) ) ( not ( = ?auto_18849 ?auto_18859 ) ) ( not ( = ?auto_18849 ?auto_18862 ) ) ( not ( = ?auto_18850 ?auto_18859 ) ) ( not ( = ?auto_18850 ?auto_18862 ) ) ( not ( = ?auto_18851 ?auto_18859 ) ) ( not ( = ?auto_18851 ?auto_18862 ) ) ( not ( = ?auto_18852 ?auto_18859 ) ) ( not ( = ?auto_18852 ?auto_18862 ) ) ( not ( = ?auto_18853 ?auto_18859 ) ) ( not ( = ?auto_18853 ?auto_18862 ) ) ( not ( = ?auto_18854 ?auto_18859 ) ) ( not ( = ?auto_18854 ?auto_18862 ) ) ( not ( = ?auto_18855 ?auto_18859 ) ) ( not ( = ?auto_18855 ?auto_18862 ) ) ( not ( = ?auto_18856 ?auto_18859 ) ) ( not ( = ?auto_18856 ?auto_18862 ) ) ( not ( = ?auto_18857 ?auto_18859 ) ) ( not ( = ?auto_18857 ?auto_18862 ) ) ( not ( = ?auto_18859 ?auto_18878 ) ) ( not ( = ?auto_18859 ?auto_18867 ) ) ( not ( = ?auto_18859 ?auto_18879 ) ) ( not ( = ?auto_18859 ?auto_18873 ) ) ( not ( = ?auto_18859 ?auto_18874 ) ) ( not ( = ?auto_18859 ?auto_18871 ) ) ( not ( = ?auto_18859 ?auto_18866 ) ) ( not ( = ?auto_18859 ?auto_18875 ) ) ( not ( = ?auto_18859 ?auto_18870 ) ) ( not ( = ?auto_18859 ?auto_18876 ) ) ( not ( = ?auto_18862 ?auto_18878 ) ) ( not ( = ?auto_18862 ?auto_18867 ) ) ( not ( = ?auto_18862 ?auto_18879 ) ) ( not ( = ?auto_18862 ?auto_18873 ) ) ( not ( = ?auto_18862 ?auto_18874 ) ) ( not ( = ?auto_18862 ?auto_18871 ) ) ( not ( = ?auto_18862 ?auto_18866 ) ) ( not ( = ?auto_18862 ?auto_18875 ) ) ( not ( = ?auto_18862 ?auto_18870 ) ) ( not ( = ?auto_18862 ?auto_18876 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_18848 ?auto_18849 ?auto_18850 ?auto_18851 ?auto_18852 ?auto_18853 ?auto_18854 ?auto_18855 ?auto_18856 ?auto_18857 ?auto_18858 )
      ( MAKE-1CRATE ?auto_18858 ?auto_18859 )
      ( MAKE-11CRATE-VERIFY ?auto_18848 ?auto_18849 ?auto_18850 ?auto_18851 ?auto_18852 ?auto_18853 ?auto_18854 ?auto_18855 ?auto_18856 ?auto_18857 ?auto_18858 ?auto_18859 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_18907 - SURFACE
      ?auto_18908 - SURFACE
      ?auto_18909 - SURFACE
      ?auto_18910 - SURFACE
      ?auto_18911 - SURFACE
      ?auto_18912 - SURFACE
      ?auto_18913 - SURFACE
      ?auto_18914 - SURFACE
      ?auto_18915 - SURFACE
      ?auto_18916 - SURFACE
      ?auto_18917 - SURFACE
      ?auto_18918 - SURFACE
      ?auto_18919 - SURFACE
    )
    :vars
    (
      ?auto_18921 - HOIST
      ?auto_18922 - PLACE
      ?auto_18920 - PLACE
      ?auto_18924 - HOIST
      ?auto_18923 - SURFACE
      ?auto_18933 - PLACE
      ?auto_18944 - HOIST
      ?auto_18939 - SURFACE
      ?auto_18940 - PLACE
      ?auto_18935 - HOIST
      ?auto_18934 - SURFACE
      ?auto_18926 - SURFACE
      ?auto_18929 - PLACE
      ?auto_18932 - HOIST
      ?auto_18945 - SURFACE
      ?auto_18936 - PLACE
      ?auto_18937 - HOIST
      ?auto_18930 - SURFACE
      ?auto_18941 - SURFACE
      ?auto_18938 - PLACE
      ?auto_18942 - HOIST
      ?auto_18943 - SURFACE
      ?auto_18931 - SURFACE
      ?auto_18927 - SURFACE
      ?auto_18946 - SURFACE
      ?auto_18928 - SURFACE
      ?auto_18925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18921 ?auto_18922 ) ( IS-CRATE ?auto_18919 ) ( not ( = ?auto_18920 ?auto_18922 ) ) ( HOIST-AT ?auto_18924 ?auto_18920 ) ( AVAILABLE ?auto_18924 ) ( SURFACE-AT ?auto_18919 ?auto_18920 ) ( ON ?auto_18919 ?auto_18923 ) ( CLEAR ?auto_18919 ) ( not ( = ?auto_18918 ?auto_18919 ) ) ( not ( = ?auto_18918 ?auto_18923 ) ) ( not ( = ?auto_18919 ?auto_18923 ) ) ( not ( = ?auto_18921 ?auto_18924 ) ) ( IS-CRATE ?auto_18918 ) ( not ( = ?auto_18933 ?auto_18922 ) ) ( HOIST-AT ?auto_18944 ?auto_18933 ) ( SURFACE-AT ?auto_18918 ?auto_18933 ) ( ON ?auto_18918 ?auto_18939 ) ( CLEAR ?auto_18918 ) ( not ( = ?auto_18917 ?auto_18918 ) ) ( not ( = ?auto_18917 ?auto_18939 ) ) ( not ( = ?auto_18918 ?auto_18939 ) ) ( not ( = ?auto_18921 ?auto_18944 ) ) ( IS-CRATE ?auto_18917 ) ( not ( = ?auto_18940 ?auto_18922 ) ) ( HOIST-AT ?auto_18935 ?auto_18940 ) ( SURFACE-AT ?auto_18917 ?auto_18940 ) ( ON ?auto_18917 ?auto_18934 ) ( CLEAR ?auto_18917 ) ( not ( = ?auto_18916 ?auto_18917 ) ) ( not ( = ?auto_18916 ?auto_18934 ) ) ( not ( = ?auto_18917 ?auto_18934 ) ) ( not ( = ?auto_18921 ?auto_18935 ) ) ( IS-CRATE ?auto_18916 ) ( SURFACE-AT ?auto_18916 ?auto_18940 ) ( ON ?auto_18916 ?auto_18926 ) ( CLEAR ?auto_18916 ) ( not ( = ?auto_18915 ?auto_18916 ) ) ( not ( = ?auto_18915 ?auto_18926 ) ) ( not ( = ?auto_18916 ?auto_18926 ) ) ( IS-CRATE ?auto_18915 ) ( not ( = ?auto_18929 ?auto_18922 ) ) ( HOIST-AT ?auto_18932 ?auto_18929 ) ( SURFACE-AT ?auto_18915 ?auto_18929 ) ( ON ?auto_18915 ?auto_18945 ) ( CLEAR ?auto_18915 ) ( not ( = ?auto_18914 ?auto_18915 ) ) ( not ( = ?auto_18914 ?auto_18945 ) ) ( not ( = ?auto_18915 ?auto_18945 ) ) ( not ( = ?auto_18921 ?auto_18932 ) ) ( IS-CRATE ?auto_18914 ) ( not ( = ?auto_18936 ?auto_18922 ) ) ( HOIST-AT ?auto_18937 ?auto_18936 ) ( AVAILABLE ?auto_18937 ) ( SURFACE-AT ?auto_18914 ?auto_18936 ) ( ON ?auto_18914 ?auto_18930 ) ( CLEAR ?auto_18914 ) ( not ( = ?auto_18913 ?auto_18914 ) ) ( not ( = ?auto_18913 ?auto_18930 ) ) ( not ( = ?auto_18914 ?auto_18930 ) ) ( not ( = ?auto_18921 ?auto_18937 ) ) ( IS-CRATE ?auto_18913 ) ( SURFACE-AT ?auto_18913 ?auto_18933 ) ( ON ?auto_18913 ?auto_18941 ) ( CLEAR ?auto_18913 ) ( not ( = ?auto_18912 ?auto_18913 ) ) ( not ( = ?auto_18912 ?auto_18941 ) ) ( not ( = ?auto_18913 ?auto_18941 ) ) ( IS-CRATE ?auto_18912 ) ( not ( = ?auto_18938 ?auto_18922 ) ) ( HOIST-AT ?auto_18942 ?auto_18938 ) ( AVAILABLE ?auto_18942 ) ( SURFACE-AT ?auto_18912 ?auto_18938 ) ( ON ?auto_18912 ?auto_18943 ) ( CLEAR ?auto_18912 ) ( not ( = ?auto_18911 ?auto_18912 ) ) ( not ( = ?auto_18911 ?auto_18943 ) ) ( not ( = ?auto_18912 ?auto_18943 ) ) ( not ( = ?auto_18921 ?auto_18942 ) ) ( IS-CRATE ?auto_18911 ) ( SURFACE-AT ?auto_18911 ?auto_18940 ) ( ON ?auto_18911 ?auto_18931 ) ( CLEAR ?auto_18911 ) ( not ( = ?auto_18910 ?auto_18911 ) ) ( not ( = ?auto_18910 ?auto_18931 ) ) ( not ( = ?auto_18911 ?auto_18931 ) ) ( IS-CRATE ?auto_18910 ) ( AVAILABLE ?auto_18932 ) ( SURFACE-AT ?auto_18910 ?auto_18929 ) ( ON ?auto_18910 ?auto_18927 ) ( CLEAR ?auto_18910 ) ( not ( = ?auto_18909 ?auto_18910 ) ) ( not ( = ?auto_18909 ?auto_18927 ) ) ( not ( = ?auto_18910 ?auto_18927 ) ) ( IS-CRATE ?auto_18909 ) ( AVAILABLE ?auto_18935 ) ( SURFACE-AT ?auto_18909 ?auto_18940 ) ( ON ?auto_18909 ?auto_18946 ) ( CLEAR ?auto_18909 ) ( not ( = ?auto_18908 ?auto_18909 ) ) ( not ( = ?auto_18908 ?auto_18946 ) ) ( not ( = ?auto_18909 ?auto_18946 ) ) ( SURFACE-AT ?auto_18907 ?auto_18922 ) ( CLEAR ?auto_18907 ) ( IS-CRATE ?auto_18908 ) ( AVAILABLE ?auto_18921 ) ( AVAILABLE ?auto_18944 ) ( SURFACE-AT ?auto_18908 ?auto_18933 ) ( ON ?auto_18908 ?auto_18928 ) ( CLEAR ?auto_18908 ) ( TRUCK-AT ?auto_18925 ?auto_18922 ) ( not ( = ?auto_18907 ?auto_18908 ) ) ( not ( = ?auto_18907 ?auto_18928 ) ) ( not ( = ?auto_18908 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18909 ) ) ( not ( = ?auto_18907 ?auto_18946 ) ) ( not ( = ?auto_18909 ?auto_18928 ) ) ( not ( = ?auto_18940 ?auto_18933 ) ) ( not ( = ?auto_18935 ?auto_18944 ) ) ( not ( = ?auto_18946 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18910 ) ) ( not ( = ?auto_18907 ?auto_18927 ) ) ( not ( = ?auto_18908 ?auto_18910 ) ) ( not ( = ?auto_18908 ?auto_18927 ) ) ( not ( = ?auto_18910 ?auto_18946 ) ) ( not ( = ?auto_18910 ?auto_18928 ) ) ( not ( = ?auto_18929 ?auto_18940 ) ) ( not ( = ?auto_18929 ?auto_18933 ) ) ( not ( = ?auto_18932 ?auto_18935 ) ) ( not ( = ?auto_18932 ?auto_18944 ) ) ( not ( = ?auto_18927 ?auto_18946 ) ) ( not ( = ?auto_18927 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18911 ) ) ( not ( = ?auto_18907 ?auto_18931 ) ) ( not ( = ?auto_18908 ?auto_18911 ) ) ( not ( = ?auto_18908 ?auto_18931 ) ) ( not ( = ?auto_18909 ?auto_18911 ) ) ( not ( = ?auto_18909 ?auto_18931 ) ) ( not ( = ?auto_18911 ?auto_18927 ) ) ( not ( = ?auto_18911 ?auto_18946 ) ) ( not ( = ?auto_18911 ?auto_18928 ) ) ( not ( = ?auto_18931 ?auto_18927 ) ) ( not ( = ?auto_18931 ?auto_18946 ) ) ( not ( = ?auto_18931 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18912 ) ) ( not ( = ?auto_18907 ?auto_18943 ) ) ( not ( = ?auto_18908 ?auto_18912 ) ) ( not ( = ?auto_18908 ?auto_18943 ) ) ( not ( = ?auto_18909 ?auto_18912 ) ) ( not ( = ?auto_18909 ?auto_18943 ) ) ( not ( = ?auto_18910 ?auto_18912 ) ) ( not ( = ?auto_18910 ?auto_18943 ) ) ( not ( = ?auto_18912 ?auto_18931 ) ) ( not ( = ?auto_18912 ?auto_18927 ) ) ( not ( = ?auto_18912 ?auto_18946 ) ) ( not ( = ?auto_18912 ?auto_18928 ) ) ( not ( = ?auto_18938 ?auto_18940 ) ) ( not ( = ?auto_18938 ?auto_18929 ) ) ( not ( = ?auto_18938 ?auto_18933 ) ) ( not ( = ?auto_18942 ?auto_18935 ) ) ( not ( = ?auto_18942 ?auto_18932 ) ) ( not ( = ?auto_18942 ?auto_18944 ) ) ( not ( = ?auto_18943 ?auto_18931 ) ) ( not ( = ?auto_18943 ?auto_18927 ) ) ( not ( = ?auto_18943 ?auto_18946 ) ) ( not ( = ?auto_18943 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18913 ) ) ( not ( = ?auto_18907 ?auto_18941 ) ) ( not ( = ?auto_18908 ?auto_18913 ) ) ( not ( = ?auto_18908 ?auto_18941 ) ) ( not ( = ?auto_18909 ?auto_18913 ) ) ( not ( = ?auto_18909 ?auto_18941 ) ) ( not ( = ?auto_18910 ?auto_18913 ) ) ( not ( = ?auto_18910 ?auto_18941 ) ) ( not ( = ?auto_18911 ?auto_18913 ) ) ( not ( = ?auto_18911 ?auto_18941 ) ) ( not ( = ?auto_18913 ?auto_18943 ) ) ( not ( = ?auto_18913 ?auto_18931 ) ) ( not ( = ?auto_18913 ?auto_18927 ) ) ( not ( = ?auto_18913 ?auto_18946 ) ) ( not ( = ?auto_18913 ?auto_18928 ) ) ( not ( = ?auto_18941 ?auto_18943 ) ) ( not ( = ?auto_18941 ?auto_18931 ) ) ( not ( = ?auto_18941 ?auto_18927 ) ) ( not ( = ?auto_18941 ?auto_18946 ) ) ( not ( = ?auto_18941 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18914 ) ) ( not ( = ?auto_18907 ?auto_18930 ) ) ( not ( = ?auto_18908 ?auto_18914 ) ) ( not ( = ?auto_18908 ?auto_18930 ) ) ( not ( = ?auto_18909 ?auto_18914 ) ) ( not ( = ?auto_18909 ?auto_18930 ) ) ( not ( = ?auto_18910 ?auto_18914 ) ) ( not ( = ?auto_18910 ?auto_18930 ) ) ( not ( = ?auto_18911 ?auto_18914 ) ) ( not ( = ?auto_18911 ?auto_18930 ) ) ( not ( = ?auto_18912 ?auto_18914 ) ) ( not ( = ?auto_18912 ?auto_18930 ) ) ( not ( = ?auto_18914 ?auto_18941 ) ) ( not ( = ?auto_18914 ?auto_18943 ) ) ( not ( = ?auto_18914 ?auto_18931 ) ) ( not ( = ?auto_18914 ?auto_18927 ) ) ( not ( = ?auto_18914 ?auto_18946 ) ) ( not ( = ?auto_18914 ?auto_18928 ) ) ( not ( = ?auto_18936 ?auto_18933 ) ) ( not ( = ?auto_18936 ?auto_18938 ) ) ( not ( = ?auto_18936 ?auto_18940 ) ) ( not ( = ?auto_18936 ?auto_18929 ) ) ( not ( = ?auto_18937 ?auto_18944 ) ) ( not ( = ?auto_18937 ?auto_18942 ) ) ( not ( = ?auto_18937 ?auto_18935 ) ) ( not ( = ?auto_18937 ?auto_18932 ) ) ( not ( = ?auto_18930 ?auto_18941 ) ) ( not ( = ?auto_18930 ?auto_18943 ) ) ( not ( = ?auto_18930 ?auto_18931 ) ) ( not ( = ?auto_18930 ?auto_18927 ) ) ( not ( = ?auto_18930 ?auto_18946 ) ) ( not ( = ?auto_18930 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18915 ) ) ( not ( = ?auto_18907 ?auto_18945 ) ) ( not ( = ?auto_18908 ?auto_18915 ) ) ( not ( = ?auto_18908 ?auto_18945 ) ) ( not ( = ?auto_18909 ?auto_18915 ) ) ( not ( = ?auto_18909 ?auto_18945 ) ) ( not ( = ?auto_18910 ?auto_18915 ) ) ( not ( = ?auto_18910 ?auto_18945 ) ) ( not ( = ?auto_18911 ?auto_18915 ) ) ( not ( = ?auto_18911 ?auto_18945 ) ) ( not ( = ?auto_18912 ?auto_18915 ) ) ( not ( = ?auto_18912 ?auto_18945 ) ) ( not ( = ?auto_18913 ?auto_18915 ) ) ( not ( = ?auto_18913 ?auto_18945 ) ) ( not ( = ?auto_18915 ?auto_18930 ) ) ( not ( = ?auto_18915 ?auto_18941 ) ) ( not ( = ?auto_18915 ?auto_18943 ) ) ( not ( = ?auto_18915 ?auto_18931 ) ) ( not ( = ?auto_18915 ?auto_18927 ) ) ( not ( = ?auto_18915 ?auto_18946 ) ) ( not ( = ?auto_18915 ?auto_18928 ) ) ( not ( = ?auto_18945 ?auto_18930 ) ) ( not ( = ?auto_18945 ?auto_18941 ) ) ( not ( = ?auto_18945 ?auto_18943 ) ) ( not ( = ?auto_18945 ?auto_18931 ) ) ( not ( = ?auto_18945 ?auto_18927 ) ) ( not ( = ?auto_18945 ?auto_18946 ) ) ( not ( = ?auto_18945 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18916 ) ) ( not ( = ?auto_18907 ?auto_18926 ) ) ( not ( = ?auto_18908 ?auto_18916 ) ) ( not ( = ?auto_18908 ?auto_18926 ) ) ( not ( = ?auto_18909 ?auto_18916 ) ) ( not ( = ?auto_18909 ?auto_18926 ) ) ( not ( = ?auto_18910 ?auto_18916 ) ) ( not ( = ?auto_18910 ?auto_18926 ) ) ( not ( = ?auto_18911 ?auto_18916 ) ) ( not ( = ?auto_18911 ?auto_18926 ) ) ( not ( = ?auto_18912 ?auto_18916 ) ) ( not ( = ?auto_18912 ?auto_18926 ) ) ( not ( = ?auto_18913 ?auto_18916 ) ) ( not ( = ?auto_18913 ?auto_18926 ) ) ( not ( = ?auto_18914 ?auto_18916 ) ) ( not ( = ?auto_18914 ?auto_18926 ) ) ( not ( = ?auto_18916 ?auto_18945 ) ) ( not ( = ?auto_18916 ?auto_18930 ) ) ( not ( = ?auto_18916 ?auto_18941 ) ) ( not ( = ?auto_18916 ?auto_18943 ) ) ( not ( = ?auto_18916 ?auto_18931 ) ) ( not ( = ?auto_18916 ?auto_18927 ) ) ( not ( = ?auto_18916 ?auto_18946 ) ) ( not ( = ?auto_18916 ?auto_18928 ) ) ( not ( = ?auto_18926 ?auto_18945 ) ) ( not ( = ?auto_18926 ?auto_18930 ) ) ( not ( = ?auto_18926 ?auto_18941 ) ) ( not ( = ?auto_18926 ?auto_18943 ) ) ( not ( = ?auto_18926 ?auto_18931 ) ) ( not ( = ?auto_18926 ?auto_18927 ) ) ( not ( = ?auto_18926 ?auto_18946 ) ) ( not ( = ?auto_18926 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18917 ) ) ( not ( = ?auto_18907 ?auto_18934 ) ) ( not ( = ?auto_18908 ?auto_18917 ) ) ( not ( = ?auto_18908 ?auto_18934 ) ) ( not ( = ?auto_18909 ?auto_18917 ) ) ( not ( = ?auto_18909 ?auto_18934 ) ) ( not ( = ?auto_18910 ?auto_18917 ) ) ( not ( = ?auto_18910 ?auto_18934 ) ) ( not ( = ?auto_18911 ?auto_18917 ) ) ( not ( = ?auto_18911 ?auto_18934 ) ) ( not ( = ?auto_18912 ?auto_18917 ) ) ( not ( = ?auto_18912 ?auto_18934 ) ) ( not ( = ?auto_18913 ?auto_18917 ) ) ( not ( = ?auto_18913 ?auto_18934 ) ) ( not ( = ?auto_18914 ?auto_18917 ) ) ( not ( = ?auto_18914 ?auto_18934 ) ) ( not ( = ?auto_18915 ?auto_18917 ) ) ( not ( = ?auto_18915 ?auto_18934 ) ) ( not ( = ?auto_18917 ?auto_18926 ) ) ( not ( = ?auto_18917 ?auto_18945 ) ) ( not ( = ?auto_18917 ?auto_18930 ) ) ( not ( = ?auto_18917 ?auto_18941 ) ) ( not ( = ?auto_18917 ?auto_18943 ) ) ( not ( = ?auto_18917 ?auto_18931 ) ) ( not ( = ?auto_18917 ?auto_18927 ) ) ( not ( = ?auto_18917 ?auto_18946 ) ) ( not ( = ?auto_18917 ?auto_18928 ) ) ( not ( = ?auto_18934 ?auto_18926 ) ) ( not ( = ?auto_18934 ?auto_18945 ) ) ( not ( = ?auto_18934 ?auto_18930 ) ) ( not ( = ?auto_18934 ?auto_18941 ) ) ( not ( = ?auto_18934 ?auto_18943 ) ) ( not ( = ?auto_18934 ?auto_18931 ) ) ( not ( = ?auto_18934 ?auto_18927 ) ) ( not ( = ?auto_18934 ?auto_18946 ) ) ( not ( = ?auto_18934 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18918 ) ) ( not ( = ?auto_18907 ?auto_18939 ) ) ( not ( = ?auto_18908 ?auto_18918 ) ) ( not ( = ?auto_18908 ?auto_18939 ) ) ( not ( = ?auto_18909 ?auto_18918 ) ) ( not ( = ?auto_18909 ?auto_18939 ) ) ( not ( = ?auto_18910 ?auto_18918 ) ) ( not ( = ?auto_18910 ?auto_18939 ) ) ( not ( = ?auto_18911 ?auto_18918 ) ) ( not ( = ?auto_18911 ?auto_18939 ) ) ( not ( = ?auto_18912 ?auto_18918 ) ) ( not ( = ?auto_18912 ?auto_18939 ) ) ( not ( = ?auto_18913 ?auto_18918 ) ) ( not ( = ?auto_18913 ?auto_18939 ) ) ( not ( = ?auto_18914 ?auto_18918 ) ) ( not ( = ?auto_18914 ?auto_18939 ) ) ( not ( = ?auto_18915 ?auto_18918 ) ) ( not ( = ?auto_18915 ?auto_18939 ) ) ( not ( = ?auto_18916 ?auto_18918 ) ) ( not ( = ?auto_18916 ?auto_18939 ) ) ( not ( = ?auto_18918 ?auto_18934 ) ) ( not ( = ?auto_18918 ?auto_18926 ) ) ( not ( = ?auto_18918 ?auto_18945 ) ) ( not ( = ?auto_18918 ?auto_18930 ) ) ( not ( = ?auto_18918 ?auto_18941 ) ) ( not ( = ?auto_18918 ?auto_18943 ) ) ( not ( = ?auto_18918 ?auto_18931 ) ) ( not ( = ?auto_18918 ?auto_18927 ) ) ( not ( = ?auto_18918 ?auto_18946 ) ) ( not ( = ?auto_18918 ?auto_18928 ) ) ( not ( = ?auto_18939 ?auto_18934 ) ) ( not ( = ?auto_18939 ?auto_18926 ) ) ( not ( = ?auto_18939 ?auto_18945 ) ) ( not ( = ?auto_18939 ?auto_18930 ) ) ( not ( = ?auto_18939 ?auto_18941 ) ) ( not ( = ?auto_18939 ?auto_18943 ) ) ( not ( = ?auto_18939 ?auto_18931 ) ) ( not ( = ?auto_18939 ?auto_18927 ) ) ( not ( = ?auto_18939 ?auto_18946 ) ) ( not ( = ?auto_18939 ?auto_18928 ) ) ( not ( = ?auto_18907 ?auto_18919 ) ) ( not ( = ?auto_18907 ?auto_18923 ) ) ( not ( = ?auto_18908 ?auto_18919 ) ) ( not ( = ?auto_18908 ?auto_18923 ) ) ( not ( = ?auto_18909 ?auto_18919 ) ) ( not ( = ?auto_18909 ?auto_18923 ) ) ( not ( = ?auto_18910 ?auto_18919 ) ) ( not ( = ?auto_18910 ?auto_18923 ) ) ( not ( = ?auto_18911 ?auto_18919 ) ) ( not ( = ?auto_18911 ?auto_18923 ) ) ( not ( = ?auto_18912 ?auto_18919 ) ) ( not ( = ?auto_18912 ?auto_18923 ) ) ( not ( = ?auto_18913 ?auto_18919 ) ) ( not ( = ?auto_18913 ?auto_18923 ) ) ( not ( = ?auto_18914 ?auto_18919 ) ) ( not ( = ?auto_18914 ?auto_18923 ) ) ( not ( = ?auto_18915 ?auto_18919 ) ) ( not ( = ?auto_18915 ?auto_18923 ) ) ( not ( = ?auto_18916 ?auto_18919 ) ) ( not ( = ?auto_18916 ?auto_18923 ) ) ( not ( = ?auto_18917 ?auto_18919 ) ) ( not ( = ?auto_18917 ?auto_18923 ) ) ( not ( = ?auto_18919 ?auto_18939 ) ) ( not ( = ?auto_18919 ?auto_18934 ) ) ( not ( = ?auto_18919 ?auto_18926 ) ) ( not ( = ?auto_18919 ?auto_18945 ) ) ( not ( = ?auto_18919 ?auto_18930 ) ) ( not ( = ?auto_18919 ?auto_18941 ) ) ( not ( = ?auto_18919 ?auto_18943 ) ) ( not ( = ?auto_18919 ?auto_18931 ) ) ( not ( = ?auto_18919 ?auto_18927 ) ) ( not ( = ?auto_18919 ?auto_18946 ) ) ( not ( = ?auto_18919 ?auto_18928 ) ) ( not ( = ?auto_18920 ?auto_18933 ) ) ( not ( = ?auto_18920 ?auto_18940 ) ) ( not ( = ?auto_18920 ?auto_18929 ) ) ( not ( = ?auto_18920 ?auto_18936 ) ) ( not ( = ?auto_18920 ?auto_18938 ) ) ( not ( = ?auto_18924 ?auto_18944 ) ) ( not ( = ?auto_18924 ?auto_18935 ) ) ( not ( = ?auto_18924 ?auto_18932 ) ) ( not ( = ?auto_18924 ?auto_18937 ) ) ( not ( = ?auto_18924 ?auto_18942 ) ) ( not ( = ?auto_18923 ?auto_18939 ) ) ( not ( = ?auto_18923 ?auto_18934 ) ) ( not ( = ?auto_18923 ?auto_18926 ) ) ( not ( = ?auto_18923 ?auto_18945 ) ) ( not ( = ?auto_18923 ?auto_18930 ) ) ( not ( = ?auto_18923 ?auto_18941 ) ) ( not ( = ?auto_18923 ?auto_18943 ) ) ( not ( = ?auto_18923 ?auto_18931 ) ) ( not ( = ?auto_18923 ?auto_18927 ) ) ( not ( = ?auto_18923 ?auto_18946 ) ) ( not ( = ?auto_18923 ?auto_18928 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_18907 ?auto_18908 ?auto_18909 ?auto_18910 ?auto_18911 ?auto_18912 ?auto_18913 ?auto_18914 ?auto_18915 ?auto_18916 ?auto_18917 ?auto_18918 )
      ( MAKE-1CRATE ?auto_18918 ?auto_18919 )
      ( MAKE-12CRATE-VERIFY ?auto_18907 ?auto_18908 ?auto_18909 ?auto_18910 ?auto_18911 ?auto_18912 ?auto_18913 ?auto_18914 ?auto_18915 ?auto_18916 ?auto_18917 ?auto_18918 ?auto_18919 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_18971 - SURFACE
      ?auto_18972 - SURFACE
      ?auto_18973 - SURFACE
      ?auto_18974 - SURFACE
      ?auto_18975 - SURFACE
      ?auto_18976 - SURFACE
      ?auto_18977 - SURFACE
      ?auto_18978 - SURFACE
      ?auto_18979 - SURFACE
      ?auto_18980 - SURFACE
      ?auto_18981 - SURFACE
      ?auto_18982 - SURFACE
      ?auto_18983 - SURFACE
      ?auto_18984 - SURFACE
    )
    :vars
    (
      ?auto_18985 - HOIST
      ?auto_18990 - PLACE
      ?auto_18987 - PLACE
      ?auto_18988 - HOIST
      ?auto_18986 - SURFACE
      ?auto_19012 - PLACE
      ?auto_19004 - HOIST
      ?auto_19005 - SURFACE
      ?auto_19006 - PLACE
      ?auto_18994 - HOIST
      ?auto_19007 - SURFACE
      ?auto_18992 - PLACE
      ?auto_19001 - HOIST
      ?auto_18991 - SURFACE
      ?auto_18996 - SURFACE
      ?auto_19002 - PLACE
      ?auto_19011 - HOIST
      ?auto_18998 - SURFACE
      ?auto_19003 - PLACE
      ?auto_19010 - HOIST
      ?auto_19009 - SURFACE
      ?auto_18993 - SURFACE
      ?auto_18997 - SURFACE
      ?auto_18999 - SURFACE
      ?auto_18995 - SURFACE
      ?auto_19008 - SURFACE
      ?auto_19000 - SURFACE
      ?auto_18989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18985 ?auto_18990 ) ( IS-CRATE ?auto_18984 ) ( not ( = ?auto_18987 ?auto_18990 ) ) ( HOIST-AT ?auto_18988 ?auto_18987 ) ( SURFACE-AT ?auto_18984 ?auto_18987 ) ( ON ?auto_18984 ?auto_18986 ) ( CLEAR ?auto_18984 ) ( not ( = ?auto_18983 ?auto_18984 ) ) ( not ( = ?auto_18983 ?auto_18986 ) ) ( not ( = ?auto_18984 ?auto_18986 ) ) ( not ( = ?auto_18985 ?auto_18988 ) ) ( IS-CRATE ?auto_18983 ) ( not ( = ?auto_19012 ?auto_18990 ) ) ( HOIST-AT ?auto_19004 ?auto_19012 ) ( AVAILABLE ?auto_19004 ) ( SURFACE-AT ?auto_18983 ?auto_19012 ) ( ON ?auto_18983 ?auto_19005 ) ( CLEAR ?auto_18983 ) ( not ( = ?auto_18982 ?auto_18983 ) ) ( not ( = ?auto_18982 ?auto_19005 ) ) ( not ( = ?auto_18983 ?auto_19005 ) ) ( not ( = ?auto_18985 ?auto_19004 ) ) ( IS-CRATE ?auto_18982 ) ( not ( = ?auto_19006 ?auto_18990 ) ) ( HOIST-AT ?auto_18994 ?auto_19006 ) ( SURFACE-AT ?auto_18982 ?auto_19006 ) ( ON ?auto_18982 ?auto_19007 ) ( CLEAR ?auto_18982 ) ( not ( = ?auto_18981 ?auto_18982 ) ) ( not ( = ?auto_18981 ?auto_19007 ) ) ( not ( = ?auto_18982 ?auto_19007 ) ) ( not ( = ?auto_18985 ?auto_18994 ) ) ( IS-CRATE ?auto_18981 ) ( not ( = ?auto_18992 ?auto_18990 ) ) ( HOIST-AT ?auto_19001 ?auto_18992 ) ( SURFACE-AT ?auto_18981 ?auto_18992 ) ( ON ?auto_18981 ?auto_18991 ) ( CLEAR ?auto_18981 ) ( not ( = ?auto_18980 ?auto_18981 ) ) ( not ( = ?auto_18980 ?auto_18991 ) ) ( not ( = ?auto_18981 ?auto_18991 ) ) ( not ( = ?auto_18985 ?auto_19001 ) ) ( IS-CRATE ?auto_18980 ) ( SURFACE-AT ?auto_18980 ?auto_18992 ) ( ON ?auto_18980 ?auto_18996 ) ( CLEAR ?auto_18980 ) ( not ( = ?auto_18979 ?auto_18980 ) ) ( not ( = ?auto_18979 ?auto_18996 ) ) ( not ( = ?auto_18980 ?auto_18996 ) ) ( IS-CRATE ?auto_18979 ) ( not ( = ?auto_19002 ?auto_18990 ) ) ( HOIST-AT ?auto_19011 ?auto_19002 ) ( SURFACE-AT ?auto_18979 ?auto_19002 ) ( ON ?auto_18979 ?auto_18998 ) ( CLEAR ?auto_18979 ) ( not ( = ?auto_18978 ?auto_18979 ) ) ( not ( = ?auto_18978 ?auto_18998 ) ) ( not ( = ?auto_18979 ?auto_18998 ) ) ( not ( = ?auto_18985 ?auto_19011 ) ) ( IS-CRATE ?auto_18978 ) ( not ( = ?auto_19003 ?auto_18990 ) ) ( HOIST-AT ?auto_19010 ?auto_19003 ) ( AVAILABLE ?auto_19010 ) ( SURFACE-AT ?auto_18978 ?auto_19003 ) ( ON ?auto_18978 ?auto_19009 ) ( CLEAR ?auto_18978 ) ( not ( = ?auto_18977 ?auto_18978 ) ) ( not ( = ?auto_18977 ?auto_19009 ) ) ( not ( = ?auto_18978 ?auto_19009 ) ) ( not ( = ?auto_18985 ?auto_19010 ) ) ( IS-CRATE ?auto_18977 ) ( SURFACE-AT ?auto_18977 ?auto_19006 ) ( ON ?auto_18977 ?auto_18993 ) ( CLEAR ?auto_18977 ) ( not ( = ?auto_18976 ?auto_18977 ) ) ( not ( = ?auto_18976 ?auto_18993 ) ) ( not ( = ?auto_18977 ?auto_18993 ) ) ( IS-CRATE ?auto_18976 ) ( AVAILABLE ?auto_18988 ) ( SURFACE-AT ?auto_18976 ?auto_18987 ) ( ON ?auto_18976 ?auto_18997 ) ( CLEAR ?auto_18976 ) ( not ( = ?auto_18975 ?auto_18976 ) ) ( not ( = ?auto_18975 ?auto_18997 ) ) ( not ( = ?auto_18976 ?auto_18997 ) ) ( IS-CRATE ?auto_18975 ) ( SURFACE-AT ?auto_18975 ?auto_18992 ) ( ON ?auto_18975 ?auto_18999 ) ( CLEAR ?auto_18975 ) ( not ( = ?auto_18974 ?auto_18975 ) ) ( not ( = ?auto_18974 ?auto_18999 ) ) ( not ( = ?auto_18975 ?auto_18999 ) ) ( IS-CRATE ?auto_18974 ) ( AVAILABLE ?auto_19011 ) ( SURFACE-AT ?auto_18974 ?auto_19002 ) ( ON ?auto_18974 ?auto_18995 ) ( CLEAR ?auto_18974 ) ( not ( = ?auto_18973 ?auto_18974 ) ) ( not ( = ?auto_18973 ?auto_18995 ) ) ( not ( = ?auto_18974 ?auto_18995 ) ) ( IS-CRATE ?auto_18973 ) ( AVAILABLE ?auto_19001 ) ( SURFACE-AT ?auto_18973 ?auto_18992 ) ( ON ?auto_18973 ?auto_19008 ) ( CLEAR ?auto_18973 ) ( not ( = ?auto_18972 ?auto_18973 ) ) ( not ( = ?auto_18972 ?auto_19008 ) ) ( not ( = ?auto_18973 ?auto_19008 ) ) ( SURFACE-AT ?auto_18971 ?auto_18990 ) ( CLEAR ?auto_18971 ) ( IS-CRATE ?auto_18972 ) ( AVAILABLE ?auto_18985 ) ( AVAILABLE ?auto_18994 ) ( SURFACE-AT ?auto_18972 ?auto_19006 ) ( ON ?auto_18972 ?auto_19000 ) ( CLEAR ?auto_18972 ) ( TRUCK-AT ?auto_18989 ?auto_18990 ) ( not ( = ?auto_18971 ?auto_18972 ) ) ( not ( = ?auto_18971 ?auto_19000 ) ) ( not ( = ?auto_18972 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18973 ) ) ( not ( = ?auto_18971 ?auto_19008 ) ) ( not ( = ?auto_18973 ?auto_19000 ) ) ( not ( = ?auto_18992 ?auto_19006 ) ) ( not ( = ?auto_19001 ?auto_18994 ) ) ( not ( = ?auto_19008 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18974 ) ) ( not ( = ?auto_18971 ?auto_18995 ) ) ( not ( = ?auto_18972 ?auto_18974 ) ) ( not ( = ?auto_18972 ?auto_18995 ) ) ( not ( = ?auto_18974 ?auto_19008 ) ) ( not ( = ?auto_18974 ?auto_19000 ) ) ( not ( = ?auto_19002 ?auto_18992 ) ) ( not ( = ?auto_19002 ?auto_19006 ) ) ( not ( = ?auto_19011 ?auto_19001 ) ) ( not ( = ?auto_19011 ?auto_18994 ) ) ( not ( = ?auto_18995 ?auto_19008 ) ) ( not ( = ?auto_18995 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18975 ) ) ( not ( = ?auto_18971 ?auto_18999 ) ) ( not ( = ?auto_18972 ?auto_18975 ) ) ( not ( = ?auto_18972 ?auto_18999 ) ) ( not ( = ?auto_18973 ?auto_18975 ) ) ( not ( = ?auto_18973 ?auto_18999 ) ) ( not ( = ?auto_18975 ?auto_18995 ) ) ( not ( = ?auto_18975 ?auto_19008 ) ) ( not ( = ?auto_18975 ?auto_19000 ) ) ( not ( = ?auto_18999 ?auto_18995 ) ) ( not ( = ?auto_18999 ?auto_19008 ) ) ( not ( = ?auto_18999 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18976 ) ) ( not ( = ?auto_18971 ?auto_18997 ) ) ( not ( = ?auto_18972 ?auto_18976 ) ) ( not ( = ?auto_18972 ?auto_18997 ) ) ( not ( = ?auto_18973 ?auto_18976 ) ) ( not ( = ?auto_18973 ?auto_18997 ) ) ( not ( = ?auto_18974 ?auto_18976 ) ) ( not ( = ?auto_18974 ?auto_18997 ) ) ( not ( = ?auto_18976 ?auto_18999 ) ) ( not ( = ?auto_18976 ?auto_18995 ) ) ( not ( = ?auto_18976 ?auto_19008 ) ) ( not ( = ?auto_18976 ?auto_19000 ) ) ( not ( = ?auto_18987 ?auto_18992 ) ) ( not ( = ?auto_18987 ?auto_19002 ) ) ( not ( = ?auto_18987 ?auto_19006 ) ) ( not ( = ?auto_18988 ?auto_19001 ) ) ( not ( = ?auto_18988 ?auto_19011 ) ) ( not ( = ?auto_18988 ?auto_18994 ) ) ( not ( = ?auto_18997 ?auto_18999 ) ) ( not ( = ?auto_18997 ?auto_18995 ) ) ( not ( = ?auto_18997 ?auto_19008 ) ) ( not ( = ?auto_18997 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18977 ) ) ( not ( = ?auto_18971 ?auto_18993 ) ) ( not ( = ?auto_18972 ?auto_18977 ) ) ( not ( = ?auto_18972 ?auto_18993 ) ) ( not ( = ?auto_18973 ?auto_18977 ) ) ( not ( = ?auto_18973 ?auto_18993 ) ) ( not ( = ?auto_18974 ?auto_18977 ) ) ( not ( = ?auto_18974 ?auto_18993 ) ) ( not ( = ?auto_18975 ?auto_18977 ) ) ( not ( = ?auto_18975 ?auto_18993 ) ) ( not ( = ?auto_18977 ?auto_18997 ) ) ( not ( = ?auto_18977 ?auto_18999 ) ) ( not ( = ?auto_18977 ?auto_18995 ) ) ( not ( = ?auto_18977 ?auto_19008 ) ) ( not ( = ?auto_18977 ?auto_19000 ) ) ( not ( = ?auto_18993 ?auto_18997 ) ) ( not ( = ?auto_18993 ?auto_18999 ) ) ( not ( = ?auto_18993 ?auto_18995 ) ) ( not ( = ?auto_18993 ?auto_19008 ) ) ( not ( = ?auto_18993 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18978 ) ) ( not ( = ?auto_18971 ?auto_19009 ) ) ( not ( = ?auto_18972 ?auto_18978 ) ) ( not ( = ?auto_18972 ?auto_19009 ) ) ( not ( = ?auto_18973 ?auto_18978 ) ) ( not ( = ?auto_18973 ?auto_19009 ) ) ( not ( = ?auto_18974 ?auto_18978 ) ) ( not ( = ?auto_18974 ?auto_19009 ) ) ( not ( = ?auto_18975 ?auto_18978 ) ) ( not ( = ?auto_18975 ?auto_19009 ) ) ( not ( = ?auto_18976 ?auto_18978 ) ) ( not ( = ?auto_18976 ?auto_19009 ) ) ( not ( = ?auto_18978 ?auto_18993 ) ) ( not ( = ?auto_18978 ?auto_18997 ) ) ( not ( = ?auto_18978 ?auto_18999 ) ) ( not ( = ?auto_18978 ?auto_18995 ) ) ( not ( = ?auto_18978 ?auto_19008 ) ) ( not ( = ?auto_18978 ?auto_19000 ) ) ( not ( = ?auto_19003 ?auto_19006 ) ) ( not ( = ?auto_19003 ?auto_18987 ) ) ( not ( = ?auto_19003 ?auto_18992 ) ) ( not ( = ?auto_19003 ?auto_19002 ) ) ( not ( = ?auto_19010 ?auto_18994 ) ) ( not ( = ?auto_19010 ?auto_18988 ) ) ( not ( = ?auto_19010 ?auto_19001 ) ) ( not ( = ?auto_19010 ?auto_19011 ) ) ( not ( = ?auto_19009 ?auto_18993 ) ) ( not ( = ?auto_19009 ?auto_18997 ) ) ( not ( = ?auto_19009 ?auto_18999 ) ) ( not ( = ?auto_19009 ?auto_18995 ) ) ( not ( = ?auto_19009 ?auto_19008 ) ) ( not ( = ?auto_19009 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18979 ) ) ( not ( = ?auto_18971 ?auto_18998 ) ) ( not ( = ?auto_18972 ?auto_18979 ) ) ( not ( = ?auto_18972 ?auto_18998 ) ) ( not ( = ?auto_18973 ?auto_18979 ) ) ( not ( = ?auto_18973 ?auto_18998 ) ) ( not ( = ?auto_18974 ?auto_18979 ) ) ( not ( = ?auto_18974 ?auto_18998 ) ) ( not ( = ?auto_18975 ?auto_18979 ) ) ( not ( = ?auto_18975 ?auto_18998 ) ) ( not ( = ?auto_18976 ?auto_18979 ) ) ( not ( = ?auto_18976 ?auto_18998 ) ) ( not ( = ?auto_18977 ?auto_18979 ) ) ( not ( = ?auto_18977 ?auto_18998 ) ) ( not ( = ?auto_18979 ?auto_19009 ) ) ( not ( = ?auto_18979 ?auto_18993 ) ) ( not ( = ?auto_18979 ?auto_18997 ) ) ( not ( = ?auto_18979 ?auto_18999 ) ) ( not ( = ?auto_18979 ?auto_18995 ) ) ( not ( = ?auto_18979 ?auto_19008 ) ) ( not ( = ?auto_18979 ?auto_19000 ) ) ( not ( = ?auto_18998 ?auto_19009 ) ) ( not ( = ?auto_18998 ?auto_18993 ) ) ( not ( = ?auto_18998 ?auto_18997 ) ) ( not ( = ?auto_18998 ?auto_18999 ) ) ( not ( = ?auto_18998 ?auto_18995 ) ) ( not ( = ?auto_18998 ?auto_19008 ) ) ( not ( = ?auto_18998 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18980 ) ) ( not ( = ?auto_18971 ?auto_18996 ) ) ( not ( = ?auto_18972 ?auto_18980 ) ) ( not ( = ?auto_18972 ?auto_18996 ) ) ( not ( = ?auto_18973 ?auto_18980 ) ) ( not ( = ?auto_18973 ?auto_18996 ) ) ( not ( = ?auto_18974 ?auto_18980 ) ) ( not ( = ?auto_18974 ?auto_18996 ) ) ( not ( = ?auto_18975 ?auto_18980 ) ) ( not ( = ?auto_18975 ?auto_18996 ) ) ( not ( = ?auto_18976 ?auto_18980 ) ) ( not ( = ?auto_18976 ?auto_18996 ) ) ( not ( = ?auto_18977 ?auto_18980 ) ) ( not ( = ?auto_18977 ?auto_18996 ) ) ( not ( = ?auto_18978 ?auto_18980 ) ) ( not ( = ?auto_18978 ?auto_18996 ) ) ( not ( = ?auto_18980 ?auto_18998 ) ) ( not ( = ?auto_18980 ?auto_19009 ) ) ( not ( = ?auto_18980 ?auto_18993 ) ) ( not ( = ?auto_18980 ?auto_18997 ) ) ( not ( = ?auto_18980 ?auto_18999 ) ) ( not ( = ?auto_18980 ?auto_18995 ) ) ( not ( = ?auto_18980 ?auto_19008 ) ) ( not ( = ?auto_18980 ?auto_19000 ) ) ( not ( = ?auto_18996 ?auto_18998 ) ) ( not ( = ?auto_18996 ?auto_19009 ) ) ( not ( = ?auto_18996 ?auto_18993 ) ) ( not ( = ?auto_18996 ?auto_18997 ) ) ( not ( = ?auto_18996 ?auto_18999 ) ) ( not ( = ?auto_18996 ?auto_18995 ) ) ( not ( = ?auto_18996 ?auto_19008 ) ) ( not ( = ?auto_18996 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18981 ) ) ( not ( = ?auto_18971 ?auto_18991 ) ) ( not ( = ?auto_18972 ?auto_18981 ) ) ( not ( = ?auto_18972 ?auto_18991 ) ) ( not ( = ?auto_18973 ?auto_18981 ) ) ( not ( = ?auto_18973 ?auto_18991 ) ) ( not ( = ?auto_18974 ?auto_18981 ) ) ( not ( = ?auto_18974 ?auto_18991 ) ) ( not ( = ?auto_18975 ?auto_18981 ) ) ( not ( = ?auto_18975 ?auto_18991 ) ) ( not ( = ?auto_18976 ?auto_18981 ) ) ( not ( = ?auto_18976 ?auto_18991 ) ) ( not ( = ?auto_18977 ?auto_18981 ) ) ( not ( = ?auto_18977 ?auto_18991 ) ) ( not ( = ?auto_18978 ?auto_18981 ) ) ( not ( = ?auto_18978 ?auto_18991 ) ) ( not ( = ?auto_18979 ?auto_18981 ) ) ( not ( = ?auto_18979 ?auto_18991 ) ) ( not ( = ?auto_18981 ?auto_18996 ) ) ( not ( = ?auto_18981 ?auto_18998 ) ) ( not ( = ?auto_18981 ?auto_19009 ) ) ( not ( = ?auto_18981 ?auto_18993 ) ) ( not ( = ?auto_18981 ?auto_18997 ) ) ( not ( = ?auto_18981 ?auto_18999 ) ) ( not ( = ?auto_18981 ?auto_18995 ) ) ( not ( = ?auto_18981 ?auto_19008 ) ) ( not ( = ?auto_18981 ?auto_19000 ) ) ( not ( = ?auto_18991 ?auto_18996 ) ) ( not ( = ?auto_18991 ?auto_18998 ) ) ( not ( = ?auto_18991 ?auto_19009 ) ) ( not ( = ?auto_18991 ?auto_18993 ) ) ( not ( = ?auto_18991 ?auto_18997 ) ) ( not ( = ?auto_18991 ?auto_18999 ) ) ( not ( = ?auto_18991 ?auto_18995 ) ) ( not ( = ?auto_18991 ?auto_19008 ) ) ( not ( = ?auto_18991 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18982 ) ) ( not ( = ?auto_18971 ?auto_19007 ) ) ( not ( = ?auto_18972 ?auto_18982 ) ) ( not ( = ?auto_18972 ?auto_19007 ) ) ( not ( = ?auto_18973 ?auto_18982 ) ) ( not ( = ?auto_18973 ?auto_19007 ) ) ( not ( = ?auto_18974 ?auto_18982 ) ) ( not ( = ?auto_18974 ?auto_19007 ) ) ( not ( = ?auto_18975 ?auto_18982 ) ) ( not ( = ?auto_18975 ?auto_19007 ) ) ( not ( = ?auto_18976 ?auto_18982 ) ) ( not ( = ?auto_18976 ?auto_19007 ) ) ( not ( = ?auto_18977 ?auto_18982 ) ) ( not ( = ?auto_18977 ?auto_19007 ) ) ( not ( = ?auto_18978 ?auto_18982 ) ) ( not ( = ?auto_18978 ?auto_19007 ) ) ( not ( = ?auto_18979 ?auto_18982 ) ) ( not ( = ?auto_18979 ?auto_19007 ) ) ( not ( = ?auto_18980 ?auto_18982 ) ) ( not ( = ?auto_18980 ?auto_19007 ) ) ( not ( = ?auto_18982 ?auto_18991 ) ) ( not ( = ?auto_18982 ?auto_18996 ) ) ( not ( = ?auto_18982 ?auto_18998 ) ) ( not ( = ?auto_18982 ?auto_19009 ) ) ( not ( = ?auto_18982 ?auto_18993 ) ) ( not ( = ?auto_18982 ?auto_18997 ) ) ( not ( = ?auto_18982 ?auto_18999 ) ) ( not ( = ?auto_18982 ?auto_18995 ) ) ( not ( = ?auto_18982 ?auto_19008 ) ) ( not ( = ?auto_18982 ?auto_19000 ) ) ( not ( = ?auto_19007 ?auto_18991 ) ) ( not ( = ?auto_19007 ?auto_18996 ) ) ( not ( = ?auto_19007 ?auto_18998 ) ) ( not ( = ?auto_19007 ?auto_19009 ) ) ( not ( = ?auto_19007 ?auto_18993 ) ) ( not ( = ?auto_19007 ?auto_18997 ) ) ( not ( = ?auto_19007 ?auto_18999 ) ) ( not ( = ?auto_19007 ?auto_18995 ) ) ( not ( = ?auto_19007 ?auto_19008 ) ) ( not ( = ?auto_19007 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18983 ) ) ( not ( = ?auto_18971 ?auto_19005 ) ) ( not ( = ?auto_18972 ?auto_18983 ) ) ( not ( = ?auto_18972 ?auto_19005 ) ) ( not ( = ?auto_18973 ?auto_18983 ) ) ( not ( = ?auto_18973 ?auto_19005 ) ) ( not ( = ?auto_18974 ?auto_18983 ) ) ( not ( = ?auto_18974 ?auto_19005 ) ) ( not ( = ?auto_18975 ?auto_18983 ) ) ( not ( = ?auto_18975 ?auto_19005 ) ) ( not ( = ?auto_18976 ?auto_18983 ) ) ( not ( = ?auto_18976 ?auto_19005 ) ) ( not ( = ?auto_18977 ?auto_18983 ) ) ( not ( = ?auto_18977 ?auto_19005 ) ) ( not ( = ?auto_18978 ?auto_18983 ) ) ( not ( = ?auto_18978 ?auto_19005 ) ) ( not ( = ?auto_18979 ?auto_18983 ) ) ( not ( = ?auto_18979 ?auto_19005 ) ) ( not ( = ?auto_18980 ?auto_18983 ) ) ( not ( = ?auto_18980 ?auto_19005 ) ) ( not ( = ?auto_18981 ?auto_18983 ) ) ( not ( = ?auto_18981 ?auto_19005 ) ) ( not ( = ?auto_18983 ?auto_19007 ) ) ( not ( = ?auto_18983 ?auto_18991 ) ) ( not ( = ?auto_18983 ?auto_18996 ) ) ( not ( = ?auto_18983 ?auto_18998 ) ) ( not ( = ?auto_18983 ?auto_19009 ) ) ( not ( = ?auto_18983 ?auto_18993 ) ) ( not ( = ?auto_18983 ?auto_18997 ) ) ( not ( = ?auto_18983 ?auto_18999 ) ) ( not ( = ?auto_18983 ?auto_18995 ) ) ( not ( = ?auto_18983 ?auto_19008 ) ) ( not ( = ?auto_18983 ?auto_19000 ) ) ( not ( = ?auto_19012 ?auto_19006 ) ) ( not ( = ?auto_19012 ?auto_18992 ) ) ( not ( = ?auto_19012 ?auto_19002 ) ) ( not ( = ?auto_19012 ?auto_19003 ) ) ( not ( = ?auto_19012 ?auto_18987 ) ) ( not ( = ?auto_19004 ?auto_18994 ) ) ( not ( = ?auto_19004 ?auto_19001 ) ) ( not ( = ?auto_19004 ?auto_19011 ) ) ( not ( = ?auto_19004 ?auto_19010 ) ) ( not ( = ?auto_19004 ?auto_18988 ) ) ( not ( = ?auto_19005 ?auto_19007 ) ) ( not ( = ?auto_19005 ?auto_18991 ) ) ( not ( = ?auto_19005 ?auto_18996 ) ) ( not ( = ?auto_19005 ?auto_18998 ) ) ( not ( = ?auto_19005 ?auto_19009 ) ) ( not ( = ?auto_19005 ?auto_18993 ) ) ( not ( = ?auto_19005 ?auto_18997 ) ) ( not ( = ?auto_19005 ?auto_18999 ) ) ( not ( = ?auto_19005 ?auto_18995 ) ) ( not ( = ?auto_19005 ?auto_19008 ) ) ( not ( = ?auto_19005 ?auto_19000 ) ) ( not ( = ?auto_18971 ?auto_18984 ) ) ( not ( = ?auto_18971 ?auto_18986 ) ) ( not ( = ?auto_18972 ?auto_18984 ) ) ( not ( = ?auto_18972 ?auto_18986 ) ) ( not ( = ?auto_18973 ?auto_18984 ) ) ( not ( = ?auto_18973 ?auto_18986 ) ) ( not ( = ?auto_18974 ?auto_18984 ) ) ( not ( = ?auto_18974 ?auto_18986 ) ) ( not ( = ?auto_18975 ?auto_18984 ) ) ( not ( = ?auto_18975 ?auto_18986 ) ) ( not ( = ?auto_18976 ?auto_18984 ) ) ( not ( = ?auto_18976 ?auto_18986 ) ) ( not ( = ?auto_18977 ?auto_18984 ) ) ( not ( = ?auto_18977 ?auto_18986 ) ) ( not ( = ?auto_18978 ?auto_18984 ) ) ( not ( = ?auto_18978 ?auto_18986 ) ) ( not ( = ?auto_18979 ?auto_18984 ) ) ( not ( = ?auto_18979 ?auto_18986 ) ) ( not ( = ?auto_18980 ?auto_18984 ) ) ( not ( = ?auto_18980 ?auto_18986 ) ) ( not ( = ?auto_18981 ?auto_18984 ) ) ( not ( = ?auto_18981 ?auto_18986 ) ) ( not ( = ?auto_18982 ?auto_18984 ) ) ( not ( = ?auto_18982 ?auto_18986 ) ) ( not ( = ?auto_18984 ?auto_19005 ) ) ( not ( = ?auto_18984 ?auto_19007 ) ) ( not ( = ?auto_18984 ?auto_18991 ) ) ( not ( = ?auto_18984 ?auto_18996 ) ) ( not ( = ?auto_18984 ?auto_18998 ) ) ( not ( = ?auto_18984 ?auto_19009 ) ) ( not ( = ?auto_18984 ?auto_18993 ) ) ( not ( = ?auto_18984 ?auto_18997 ) ) ( not ( = ?auto_18984 ?auto_18999 ) ) ( not ( = ?auto_18984 ?auto_18995 ) ) ( not ( = ?auto_18984 ?auto_19008 ) ) ( not ( = ?auto_18984 ?auto_19000 ) ) ( not ( = ?auto_18986 ?auto_19005 ) ) ( not ( = ?auto_18986 ?auto_19007 ) ) ( not ( = ?auto_18986 ?auto_18991 ) ) ( not ( = ?auto_18986 ?auto_18996 ) ) ( not ( = ?auto_18986 ?auto_18998 ) ) ( not ( = ?auto_18986 ?auto_19009 ) ) ( not ( = ?auto_18986 ?auto_18993 ) ) ( not ( = ?auto_18986 ?auto_18997 ) ) ( not ( = ?auto_18986 ?auto_18999 ) ) ( not ( = ?auto_18986 ?auto_18995 ) ) ( not ( = ?auto_18986 ?auto_19008 ) ) ( not ( = ?auto_18986 ?auto_19000 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_18971 ?auto_18972 ?auto_18973 ?auto_18974 ?auto_18975 ?auto_18976 ?auto_18977 ?auto_18978 ?auto_18979 ?auto_18980 ?auto_18981 ?auto_18982 ?auto_18983 )
      ( MAKE-1CRATE ?auto_18983 ?auto_18984 )
      ( MAKE-13CRATE-VERIFY ?auto_18971 ?auto_18972 ?auto_18973 ?auto_18974 ?auto_18975 ?auto_18976 ?auto_18977 ?auto_18978 ?auto_18979 ?auto_18980 ?auto_18981 ?auto_18982 ?auto_18983 ?auto_18984 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_19038 - SURFACE
      ?auto_19039 - SURFACE
      ?auto_19040 - SURFACE
      ?auto_19041 - SURFACE
      ?auto_19042 - SURFACE
      ?auto_19043 - SURFACE
      ?auto_19044 - SURFACE
      ?auto_19045 - SURFACE
      ?auto_19046 - SURFACE
      ?auto_19047 - SURFACE
      ?auto_19048 - SURFACE
      ?auto_19049 - SURFACE
      ?auto_19050 - SURFACE
      ?auto_19051 - SURFACE
      ?auto_19052 - SURFACE
    )
    :vars
    (
      ?auto_19055 - HOIST
      ?auto_19056 - PLACE
      ?auto_19057 - PLACE
      ?auto_19053 - HOIST
      ?auto_19058 - SURFACE
      ?auto_19062 - PLACE
      ?auto_19067 - HOIST
      ?auto_19071 - SURFACE
      ?auto_19077 - PLACE
      ?auto_19075 - HOIST
      ?auto_19073 - SURFACE
      ?auto_19059 - SURFACE
      ?auto_19079 - PLACE
      ?auto_19072 - HOIST
      ?auto_19060 - SURFACE
      ?auto_19065 - SURFACE
      ?auto_19076 - PLACE
      ?auto_19074 - HOIST
      ?auto_19068 - SURFACE
      ?auto_19078 - PLACE
      ?auto_19064 - HOIST
      ?auto_19070 - SURFACE
      ?auto_19069 - SURFACE
      ?auto_19081 - SURFACE
      ?auto_19061 - SURFACE
      ?auto_19080 - SURFACE
      ?auto_19063 - SURFACE
      ?auto_19066 - SURFACE
      ?auto_19054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19055 ?auto_19056 ) ( IS-CRATE ?auto_19052 ) ( not ( = ?auto_19057 ?auto_19056 ) ) ( HOIST-AT ?auto_19053 ?auto_19057 ) ( SURFACE-AT ?auto_19052 ?auto_19057 ) ( ON ?auto_19052 ?auto_19058 ) ( CLEAR ?auto_19052 ) ( not ( = ?auto_19051 ?auto_19052 ) ) ( not ( = ?auto_19051 ?auto_19058 ) ) ( not ( = ?auto_19052 ?auto_19058 ) ) ( not ( = ?auto_19055 ?auto_19053 ) ) ( IS-CRATE ?auto_19051 ) ( not ( = ?auto_19062 ?auto_19056 ) ) ( HOIST-AT ?auto_19067 ?auto_19062 ) ( SURFACE-AT ?auto_19051 ?auto_19062 ) ( ON ?auto_19051 ?auto_19071 ) ( CLEAR ?auto_19051 ) ( not ( = ?auto_19050 ?auto_19051 ) ) ( not ( = ?auto_19050 ?auto_19071 ) ) ( not ( = ?auto_19051 ?auto_19071 ) ) ( not ( = ?auto_19055 ?auto_19067 ) ) ( IS-CRATE ?auto_19050 ) ( not ( = ?auto_19077 ?auto_19056 ) ) ( HOIST-AT ?auto_19075 ?auto_19077 ) ( AVAILABLE ?auto_19075 ) ( SURFACE-AT ?auto_19050 ?auto_19077 ) ( ON ?auto_19050 ?auto_19073 ) ( CLEAR ?auto_19050 ) ( not ( = ?auto_19049 ?auto_19050 ) ) ( not ( = ?auto_19049 ?auto_19073 ) ) ( not ( = ?auto_19050 ?auto_19073 ) ) ( not ( = ?auto_19055 ?auto_19075 ) ) ( IS-CRATE ?auto_19049 ) ( SURFACE-AT ?auto_19049 ?auto_19057 ) ( ON ?auto_19049 ?auto_19059 ) ( CLEAR ?auto_19049 ) ( not ( = ?auto_19048 ?auto_19049 ) ) ( not ( = ?auto_19048 ?auto_19059 ) ) ( not ( = ?auto_19049 ?auto_19059 ) ) ( IS-CRATE ?auto_19048 ) ( not ( = ?auto_19079 ?auto_19056 ) ) ( HOIST-AT ?auto_19072 ?auto_19079 ) ( SURFACE-AT ?auto_19048 ?auto_19079 ) ( ON ?auto_19048 ?auto_19060 ) ( CLEAR ?auto_19048 ) ( not ( = ?auto_19047 ?auto_19048 ) ) ( not ( = ?auto_19047 ?auto_19060 ) ) ( not ( = ?auto_19048 ?auto_19060 ) ) ( not ( = ?auto_19055 ?auto_19072 ) ) ( IS-CRATE ?auto_19047 ) ( SURFACE-AT ?auto_19047 ?auto_19079 ) ( ON ?auto_19047 ?auto_19065 ) ( CLEAR ?auto_19047 ) ( not ( = ?auto_19046 ?auto_19047 ) ) ( not ( = ?auto_19046 ?auto_19065 ) ) ( not ( = ?auto_19047 ?auto_19065 ) ) ( IS-CRATE ?auto_19046 ) ( not ( = ?auto_19076 ?auto_19056 ) ) ( HOIST-AT ?auto_19074 ?auto_19076 ) ( SURFACE-AT ?auto_19046 ?auto_19076 ) ( ON ?auto_19046 ?auto_19068 ) ( CLEAR ?auto_19046 ) ( not ( = ?auto_19045 ?auto_19046 ) ) ( not ( = ?auto_19045 ?auto_19068 ) ) ( not ( = ?auto_19046 ?auto_19068 ) ) ( not ( = ?auto_19055 ?auto_19074 ) ) ( IS-CRATE ?auto_19045 ) ( not ( = ?auto_19078 ?auto_19056 ) ) ( HOIST-AT ?auto_19064 ?auto_19078 ) ( AVAILABLE ?auto_19064 ) ( SURFACE-AT ?auto_19045 ?auto_19078 ) ( ON ?auto_19045 ?auto_19070 ) ( CLEAR ?auto_19045 ) ( not ( = ?auto_19044 ?auto_19045 ) ) ( not ( = ?auto_19044 ?auto_19070 ) ) ( not ( = ?auto_19045 ?auto_19070 ) ) ( not ( = ?auto_19055 ?auto_19064 ) ) ( IS-CRATE ?auto_19044 ) ( SURFACE-AT ?auto_19044 ?auto_19057 ) ( ON ?auto_19044 ?auto_19069 ) ( CLEAR ?auto_19044 ) ( not ( = ?auto_19043 ?auto_19044 ) ) ( not ( = ?auto_19043 ?auto_19069 ) ) ( not ( = ?auto_19044 ?auto_19069 ) ) ( IS-CRATE ?auto_19043 ) ( AVAILABLE ?auto_19067 ) ( SURFACE-AT ?auto_19043 ?auto_19062 ) ( ON ?auto_19043 ?auto_19081 ) ( CLEAR ?auto_19043 ) ( not ( = ?auto_19042 ?auto_19043 ) ) ( not ( = ?auto_19042 ?auto_19081 ) ) ( not ( = ?auto_19043 ?auto_19081 ) ) ( IS-CRATE ?auto_19042 ) ( SURFACE-AT ?auto_19042 ?auto_19079 ) ( ON ?auto_19042 ?auto_19061 ) ( CLEAR ?auto_19042 ) ( not ( = ?auto_19041 ?auto_19042 ) ) ( not ( = ?auto_19041 ?auto_19061 ) ) ( not ( = ?auto_19042 ?auto_19061 ) ) ( IS-CRATE ?auto_19041 ) ( AVAILABLE ?auto_19074 ) ( SURFACE-AT ?auto_19041 ?auto_19076 ) ( ON ?auto_19041 ?auto_19080 ) ( CLEAR ?auto_19041 ) ( not ( = ?auto_19040 ?auto_19041 ) ) ( not ( = ?auto_19040 ?auto_19080 ) ) ( not ( = ?auto_19041 ?auto_19080 ) ) ( IS-CRATE ?auto_19040 ) ( AVAILABLE ?auto_19072 ) ( SURFACE-AT ?auto_19040 ?auto_19079 ) ( ON ?auto_19040 ?auto_19063 ) ( CLEAR ?auto_19040 ) ( not ( = ?auto_19039 ?auto_19040 ) ) ( not ( = ?auto_19039 ?auto_19063 ) ) ( not ( = ?auto_19040 ?auto_19063 ) ) ( SURFACE-AT ?auto_19038 ?auto_19056 ) ( CLEAR ?auto_19038 ) ( IS-CRATE ?auto_19039 ) ( AVAILABLE ?auto_19055 ) ( AVAILABLE ?auto_19053 ) ( SURFACE-AT ?auto_19039 ?auto_19057 ) ( ON ?auto_19039 ?auto_19066 ) ( CLEAR ?auto_19039 ) ( TRUCK-AT ?auto_19054 ?auto_19056 ) ( not ( = ?auto_19038 ?auto_19039 ) ) ( not ( = ?auto_19038 ?auto_19066 ) ) ( not ( = ?auto_19039 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19040 ) ) ( not ( = ?auto_19038 ?auto_19063 ) ) ( not ( = ?auto_19040 ?auto_19066 ) ) ( not ( = ?auto_19079 ?auto_19057 ) ) ( not ( = ?auto_19072 ?auto_19053 ) ) ( not ( = ?auto_19063 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19041 ) ) ( not ( = ?auto_19038 ?auto_19080 ) ) ( not ( = ?auto_19039 ?auto_19041 ) ) ( not ( = ?auto_19039 ?auto_19080 ) ) ( not ( = ?auto_19041 ?auto_19063 ) ) ( not ( = ?auto_19041 ?auto_19066 ) ) ( not ( = ?auto_19076 ?auto_19079 ) ) ( not ( = ?auto_19076 ?auto_19057 ) ) ( not ( = ?auto_19074 ?auto_19072 ) ) ( not ( = ?auto_19074 ?auto_19053 ) ) ( not ( = ?auto_19080 ?auto_19063 ) ) ( not ( = ?auto_19080 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19042 ) ) ( not ( = ?auto_19038 ?auto_19061 ) ) ( not ( = ?auto_19039 ?auto_19042 ) ) ( not ( = ?auto_19039 ?auto_19061 ) ) ( not ( = ?auto_19040 ?auto_19042 ) ) ( not ( = ?auto_19040 ?auto_19061 ) ) ( not ( = ?auto_19042 ?auto_19080 ) ) ( not ( = ?auto_19042 ?auto_19063 ) ) ( not ( = ?auto_19042 ?auto_19066 ) ) ( not ( = ?auto_19061 ?auto_19080 ) ) ( not ( = ?auto_19061 ?auto_19063 ) ) ( not ( = ?auto_19061 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19043 ) ) ( not ( = ?auto_19038 ?auto_19081 ) ) ( not ( = ?auto_19039 ?auto_19043 ) ) ( not ( = ?auto_19039 ?auto_19081 ) ) ( not ( = ?auto_19040 ?auto_19043 ) ) ( not ( = ?auto_19040 ?auto_19081 ) ) ( not ( = ?auto_19041 ?auto_19043 ) ) ( not ( = ?auto_19041 ?auto_19081 ) ) ( not ( = ?auto_19043 ?auto_19061 ) ) ( not ( = ?auto_19043 ?auto_19080 ) ) ( not ( = ?auto_19043 ?auto_19063 ) ) ( not ( = ?auto_19043 ?auto_19066 ) ) ( not ( = ?auto_19062 ?auto_19079 ) ) ( not ( = ?auto_19062 ?auto_19076 ) ) ( not ( = ?auto_19062 ?auto_19057 ) ) ( not ( = ?auto_19067 ?auto_19072 ) ) ( not ( = ?auto_19067 ?auto_19074 ) ) ( not ( = ?auto_19067 ?auto_19053 ) ) ( not ( = ?auto_19081 ?auto_19061 ) ) ( not ( = ?auto_19081 ?auto_19080 ) ) ( not ( = ?auto_19081 ?auto_19063 ) ) ( not ( = ?auto_19081 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19044 ) ) ( not ( = ?auto_19038 ?auto_19069 ) ) ( not ( = ?auto_19039 ?auto_19044 ) ) ( not ( = ?auto_19039 ?auto_19069 ) ) ( not ( = ?auto_19040 ?auto_19044 ) ) ( not ( = ?auto_19040 ?auto_19069 ) ) ( not ( = ?auto_19041 ?auto_19044 ) ) ( not ( = ?auto_19041 ?auto_19069 ) ) ( not ( = ?auto_19042 ?auto_19044 ) ) ( not ( = ?auto_19042 ?auto_19069 ) ) ( not ( = ?auto_19044 ?auto_19081 ) ) ( not ( = ?auto_19044 ?auto_19061 ) ) ( not ( = ?auto_19044 ?auto_19080 ) ) ( not ( = ?auto_19044 ?auto_19063 ) ) ( not ( = ?auto_19044 ?auto_19066 ) ) ( not ( = ?auto_19069 ?auto_19081 ) ) ( not ( = ?auto_19069 ?auto_19061 ) ) ( not ( = ?auto_19069 ?auto_19080 ) ) ( not ( = ?auto_19069 ?auto_19063 ) ) ( not ( = ?auto_19069 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19045 ) ) ( not ( = ?auto_19038 ?auto_19070 ) ) ( not ( = ?auto_19039 ?auto_19045 ) ) ( not ( = ?auto_19039 ?auto_19070 ) ) ( not ( = ?auto_19040 ?auto_19045 ) ) ( not ( = ?auto_19040 ?auto_19070 ) ) ( not ( = ?auto_19041 ?auto_19045 ) ) ( not ( = ?auto_19041 ?auto_19070 ) ) ( not ( = ?auto_19042 ?auto_19045 ) ) ( not ( = ?auto_19042 ?auto_19070 ) ) ( not ( = ?auto_19043 ?auto_19045 ) ) ( not ( = ?auto_19043 ?auto_19070 ) ) ( not ( = ?auto_19045 ?auto_19069 ) ) ( not ( = ?auto_19045 ?auto_19081 ) ) ( not ( = ?auto_19045 ?auto_19061 ) ) ( not ( = ?auto_19045 ?auto_19080 ) ) ( not ( = ?auto_19045 ?auto_19063 ) ) ( not ( = ?auto_19045 ?auto_19066 ) ) ( not ( = ?auto_19078 ?auto_19057 ) ) ( not ( = ?auto_19078 ?auto_19062 ) ) ( not ( = ?auto_19078 ?auto_19079 ) ) ( not ( = ?auto_19078 ?auto_19076 ) ) ( not ( = ?auto_19064 ?auto_19053 ) ) ( not ( = ?auto_19064 ?auto_19067 ) ) ( not ( = ?auto_19064 ?auto_19072 ) ) ( not ( = ?auto_19064 ?auto_19074 ) ) ( not ( = ?auto_19070 ?auto_19069 ) ) ( not ( = ?auto_19070 ?auto_19081 ) ) ( not ( = ?auto_19070 ?auto_19061 ) ) ( not ( = ?auto_19070 ?auto_19080 ) ) ( not ( = ?auto_19070 ?auto_19063 ) ) ( not ( = ?auto_19070 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19046 ) ) ( not ( = ?auto_19038 ?auto_19068 ) ) ( not ( = ?auto_19039 ?auto_19046 ) ) ( not ( = ?auto_19039 ?auto_19068 ) ) ( not ( = ?auto_19040 ?auto_19046 ) ) ( not ( = ?auto_19040 ?auto_19068 ) ) ( not ( = ?auto_19041 ?auto_19046 ) ) ( not ( = ?auto_19041 ?auto_19068 ) ) ( not ( = ?auto_19042 ?auto_19046 ) ) ( not ( = ?auto_19042 ?auto_19068 ) ) ( not ( = ?auto_19043 ?auto_19046 ) ) ( not ( = ?auto_19043 ?auto_19068 ) ) ( not ( = ?auto_19044 ?auto_19046 ) ) ( not ( = ?auto_19044 ?auto_19068 ) ) ( not ( = ?auto_19046 ?auto_19070 ) ) ( not ( = ?auto_19046 ?auto_19069 ) ) ( not ( = ?auto_19046 ?auto_19081 ) ) ( not ( = ?auto_19046 ?auto_19061 ) ) ( not ( = ?auto_19046 ?auto_19080 ) ) ( not ( = ?auto_19046 ?auto_19063 ) ) ( not ( = ?auto_19046 ?auto_19066 ) ) ( not ( = ?auto_19068 ?auto_19070 ) ) ( not ( = ?auto_19068 ?auto_19069 ) ) ( not ( = ?auto_19068 ?auto_19081 ) ) ( not ( = ?auto_19068 ?auto_19061 ) ) ( not ( = ?auto_19068 ?auto_19080 ) ) ( not ( = ?auto_19068 ?auto_19063 ) ) ( not ( = ?auto_19068 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19047 ) ) ( not ( = ?auto_19038 ?auto_19065 ) ) ( not ( = ?auto_19039 ?auto_19047 ) ) ( not ( = ?auto_19039 ?auto_19065 ) ) ( not ( = ?auto_19040 ?auto_19047 ) ) ( not ( = ?auto_19040 ?auto_19065 ) ) ( not ( = ?auto_19041 ?auto_19047 ) ) ( not ( = ?auto_19041 ?auto_19065 ) ) ( not ( = ?auto_19042 ?auto_19047 ) ) ( not ( = ?auto_19042 ?auto_19065 ) ) ( not ( = ?auto_19043 ?auto_19047 ) ) ( not ( = ?auto_19043 ?auto_19065 ) ) ( not ( = ?auto_19044 ?auto_19047 ) ) ( not ( = ?auto_19044 ?auto_19065 ) ) ( not ( = ?auto_19045 ?auto_19047 ) ) ( not ( = ?auto_19045 ?auto_19065 ) ) ( not ( = ?auto_19047 ?auto_19068 ) ) ( not ( = ?auto_19047 ?auto_19070 ) ) ( not ( = ?auto_19047 ?auto_19069 ) ) ( not ( = ?auto_19047 ?auto_19081 ) ) ( not ( = ?auto_19047 ?auto_19061 ) ) ( not ( = ?auto_19047 ?auto_19080 ) ) ( not ( = ?auto_19047 ?auto_19063 ) ) ( not ( = ?auto_19047 ?auto_19066 ) ) ( not ( = ?auto_19065 ?auto_19068 ) ) ( not ( = ?auto_19065 ?auto_19070 ) ) ( not ( = ?auto_19065 ?auto_19069 ) ) ( not ( = ?auto_19065 ?auto_19081 ) ) ( not ( = ?auto_19065 ?auto_19061 ) ) ( not ( = ?auto_19065 ?auto_19080 ) ) ( not ( = ?auto_19065 ?auto_19063 ) ) ( not ( = ?auto_19065 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19048 ) ) ( not ( = ?auto_19038 ?auto_19060 ) ) ( not ( = ?auto_19039 ?auto_19048 ) ) ( not ( = ?auto_19039 ?auto_19060 ) ) ( not ( = ?auto_19040 ?auto_19048 ) ) ( not ( = ?auto_19040 ?auto_19060 ) ) ( not ( = ?auto_19041 ?auto_19048 ) ) ( not ( = ?auto_19041 ?auto_19060 ) ) ( not ( = ?auto_19042 ?auto_19048 ) ) ( not ( = ?auto_19042 ?auto_19060 ) ) ( not ( = ?auto_19043 ?auto_19048 ) ) ( not ( = ?auto_19043 ?auto_19060 ) ) ( not ( = ?auto_19044 ?auto_19048 ) ) ( not ( = ?auto_19044 ?auto_19060 ) ) ( not ( = ?auto_19045 ?auto_19048 ) ) ( not ( = ?auto_19045 ?auto_19060 ) ) ( not ( = ?auto_19046 ?auto_19048 ) ) ( not ( = ?auto_19046 ?auto_19060 ) ) ( not ( = ?auto_19048 ?auto_19065 ) ) ( not ( = ?auto_19048 ?auto_19068 ) ) ( not ( = ?auto_19048 ?auto_19070 ) ) ( not ( = ?auto_19048 ?auto_19069 ) ) ( not ( = ?auto_19048 ?auto_19081 ) ) ( not ( = ?auto_19048 ?auto_19061 ) ) ( not ( = ?auto_19048 ?auto_19080 ) ) ( not ( = ?auto_19048 ?auto_19063 ) ) ( not ( = ?auto_19048 ?auto_19066 ) ) ( not ( = ?auto_19060 ?auto_19065 ) ) ( not ( = ?auto_19060 ?auto_19068 ) ) ( not ( = ?auto_19060 ?auto_19070 ) ) ( not ( = ?auto_19060 ?auto_19069 ) ) ( not ( = ?auto_19060 ?auto_19081 ) ) ( not ( = ?auto_19060 ?auto_19061 ) ) ( not ( = ?auto_19060 ?auto_19080 ) ) ( not ( = ?auto_19060 ?auto_19063 ) ) ( not ( = ?auto_19060 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19049 ) ) ( not ( = ?auto_19038 ?auto_19059 ) ) ( not ( = ?auto_19039 ?auto_19049 ) ) ( not ( = ?auto_19039 ?auto_19059 ) ) ( not ( = ?auto_19040 ?auto_19049 ) ) ( not ( = ?auto_19040 ?auto_19059 ) ) ( not ( = ?auto_19041 ?auto_19049 ) ) ( not ( = ?auto_19041 ?auto_19059 ) ) ( not ( = ?auto_19042 ?auto_19049 ) ) ( not ( = ?auto_19042 ?auto_19059 ) ) ( not ( = ?auto_19043 ?auto_19049 ) ) ( not ( = ?auto_19043 ?auto_19059 ) ) ( not ( = ?auto_19044 ?auto_19049 ) ) ( not ( = ?auto_19044 ?auto_19059 ) ) ( not ( = ?auto_19045 ?auto_19049 ) ) ( not ( = ?auto_19045 ?auto_19059 ) ) ( not ( = ?auto_19046 ?auto_19049 ) ) ( not ( = ?auto_19046 ?auto_19059 ) ) ( not ( = ?auto_19047 ?auto_19049 ) ) ( not ( = ?auto_19047 ?auto_19059 ) ) ( not ( = ?auto_19049 ?auto_19060 ) ) ( not ( = ?auto_19049 ?auto_19065 ) ) ( not ( = ?auto_19049 ?auto_19068 ) ) ( not ( = ?auto_19049 ?auto_19070 ) ) ( not ( = ?auto_19049 ?auto_19069 ) ) ( not ( = ?auto_19049 ?auto_19081 ) ) ( not ( = ?auto_19049 ?auto_19061 ) ) ( not ( = ?auto_19049 ?auto_19080 ) ) ( not ( = ?auto_19049 ?auto_19063 ) ) ( not ( = ?auto_19049 ?auto_19066 ) ) ( not ( = ?auto_19059 ?auto_19060 ) ) ( not ( = ?auto_19059 ?auto_19065 ) ) ( not ( = ?auto_19059 ?auto_19068 ) ) ( not ( = ?auto_19059 ?auto_19070 ) ) ( not ( = ?auto_19059 ?auto_19069 ) ) ( not ( = ?auto_19059 ?auto_19081 ) ) ( not ( = ?auto_19059 ?auto_19061 ) ) ( not ( = ?auto_19059 ?auto_19080 ) ) ( not ( = ?auto_19059 ?auto_19063 ) ) ( not ( = ?auto_19059 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19050 ) ) ( not ( = ?auto_19038 ?auto_19073 ) ) ( not ( = ?auto_19039 ?auto_19050 ) ) ( not ( = ?auto_19039 ?auto_19073 ) ) ( not ( = ?auto_19040 ?auto_19050 ) ) ( not ( = ?auto_19040 ?auto_19073 ) ) ( not ( = ?auto_19041 ?auto_19050 ) ) ( not ( = ?auto_19041 ?auto_19073 ) ) ( not ( = ?auto_19042 ?auto_19050 ) ) ( not ( = ?auto_19042 ?auto_19073 ) ) ( not ( = ?auto_19043 ?auto_19050 ) ) ( not ( = ?auto_19043 ?auto_19073 ) ) ( not ( = ?auto_19044 ?auto_19050 ) ) ( not ( = ?auto_19044 ?auto_19073 ) ) ( not ( = ?auto_19045 ?auto_19050 ) ) ( not ( = ?auto_19045 ?auto_19073 ) ) ( not ( = ?auto_19046 ?auto_19050 ) ) ( not ( = ?auto_19046 ?auto_19073 ) ) ( not ( = ?auto_19047 ?auto_19050 ) ) ( not ( = ?auto_19047 ?auto_19073 ) ) ( not ( = ?auto_19048 ?auto_19050 ) ) ( not ( = ?auto_19048 ?auto_19073 ) ) ( not ( = ?auto_19050 ?auto_19059 ) ) ( not ( = ?auto_19050 ?auto_19060 ) ) ( not ( = ?auto_19050 ?auto_19065 ) ) ( not ( = ?auto_19050 ?auto_19068 ) ) ( not ( = ?auto_19050 ?auto_19070 ) ) ( not ( = ?auto_19050 ?auto_19069 ) ) ( not ( = ?auto_19050 ?auto_19081 ) ) ( not ( = ?auto_19050 ?auto_19061 ) ) ( not ( = ?auto_19050 ?auto_19080 ) ) ( not ( = ?auto_19050 ?auto_19063 ) ) ( not ( = ?auto_19050 ?auto_19066 ) ) ( not ( = ?auto_19077 ?auto_19057 ) ) ( not ( = ?auto_19077 ?auto_19079 ) ) ( not ( = ?auto_19077 ?auto_19076 ) ) ( not ( = ?auto_19077 ?auto_19078 ) ) ( not ( = ?auto_19077 ?auto_19062 ) ) ( not ( = ?auto_19075 ?auto_19053 ) ) ( not ( = ?auto_19075 ?auto_19072 ) ) ( not ( = ?auto_19075 ?auto_19074 ) ) ( not ( = ?auto_19075 ?auto_19064 ) ) ( not ( = ?auto_19075 ?auto_19067 ) ) ( not ( = ?auto_19073 ?auto_19059 ) ) ( not ( = ?auto_19073 ?auto_19060 ) ) ( not ( = ?auto_19073 ?auto_19065 ) ) ( not ( = ?auto_19073 ?auto_19068 ) ) ( not ( = ?auto_19073 ?auto_19070 ) ) ( not ( = ?auto_19073 ?auto_19069 ) ) ( not ( = ?auto_19073 ?auto_19081 ) ) ( not ( = ?auto_19073 ?auto_19061 ) ) ( not ( = ?auto_19073 ?auto_19080 ) ) ( not ( = ?auto_19073 ?auto_19063 ) ) ( not ( = ?auto_19073 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19051 ) ) ( not ( = ?auto_19038 ?auto_19071 ) ) ( not ( = ?auto_19039 ?auto_19051 ) ) ( not ( = ?auto_19039 ?auto_19071 ) ) ( not ( = ?auto_19040 ?auto_19051 ) ) ( not ( = ?auto_19040 ?auto_19071 ) ) ( not ( = ?auto_19041 ?auto_19051 ) ) ( not ( = ?auto_19041 ?auto_19071 ) ) ( not ( = ?auto_19042 ?auto_19051 ) ) ( not ( = ?auto_19042 ?auto_19071 ) ) ( not ( = ?auto_19043 ?auto_19051 ) ) ( not ( = ?auto_19043 ?auto_19071 ) ) ( not ( = ?auto_19044 ?auto_19051 ) ) ( not ( = ?auto_19044 ?auto_19071 ) ) ( not ( = ?auto_19045 ?auto_19051 ) ) ( not ( = ?auto_19045 ?auto_19071 ) ) ( not ( = ?auto_19046 ?auto_19051 ) ) ( not ( = ?auto_19046 ?auto_19071 ) ) ( not ( = ?auto_19047 ?auto_19051 ) ) ( not ( = ?auto_19047 ?auto_19071 ) ) ( not ( = ?auto_19048 ?auto_19051 ) ) ( not ( = ?auto_19048 ?auto_19071 ) ) ( not ( = ?auto_19049 ?auto_19051 ) ) ( not ( = ?auto_19049 ?auto_19071 ) ) ( not ( = ?auto_19051 ?auto_19073 ) ) ( not ( = ?auto_19051 ?auto_19059 ) ) ( not ( = ?auto_19051 ?auto_19060 ) ) ( not ( = ?auto_19051 ?auto_19065 ) ) ( not ( = ?auto_19051 ?auto_19068 ) ) ( not ( = ?auto_19051 ?auto_19070 ) ) ( not ( = ?auto_19051 ?auto_19069 ) ) ( not ( = ?auto_19051 ?auto_19081 ) ) ( not ( = ?auto_19051 ?auto_19061 ) ) ( not ( = ?auto_19051 ?auto_19080 ) ) ( not ( = ?auto_19051 ?auto_19063 ) ) ( not ( = ?auto_19051 ?auto_19066 ) ) ( not ( = ?auto_19071 ?auto_19073 ) ) ( not ( = ?auto_19071 ?auto_19059 ) ) ( not ( = ?auto_19071 ?auto_19060 ) ) ( not ( = ?auto_19071 ?auto_19065 ) ) ( not ( = ?auto_19071 ?auto_19068 ) ) ( not ( = ?auto_19071 ?auto_19070 ) ) ( not ( = ?auto_19071 ?auto_19069 ) ) ( not ( = ?auto_19071 ?auto_19081 ) ) ( not ( = ?auto_19071 ?auto_19061 ) ) ( not ( = ?auto_19071 ?auto_19080 ) ) ( not ( = ?auto_19071 ?auto_19063 ) ) ( not ( = ?auto_19071 ?auto_19066 ) ) ( not ( = ?auto_19038 ?auto_19052 ) ) ( not ( = ?auto_19038 ?auto_19058 ) ) ( not ( = ?auto_19039 ?auto_19052 ) ) ( not ( = ?auto_19039 ?auto_19058 ) ) ( not ( = ?auto_19040 ?auto_19052 ) ) ( not ( = ?auto_19040 ?auto_19058 ) ) ( not ( = ?auto_19041 ?auto_19052 ) ) ( not ( = ?auto_19041 ?auto_19058 ) ) ( not ( = ?auto_19042 ?auto_19052 ) ) ( not ( = ?auto_19042 ?auto_19058 ) ) ( not ( = ?auto_19043 ?auto_19052 ) ) ( not ( = ?auto_19043 ?auto_19058 ) ) ( not ( = ?auto_19044 ?auto_19052 ) ) ( not ( = ?auto_19044 ?auto_19058 ) ) ( not ( = ?auto_19045 ?auto_19052 ) ) ( not ( = ?auto_19045 ?auto_19058 ) ) ( not ( = ?auto_19046 ?auto_19052 ) ) ( not ( = ?auto_19046 ?auto_19058 ) ) ( not ( = ?auto_19047 ?auto_19052 ) ) ( not ( = ?auto_19047 ?auto_19058 ) ) ( not ( = ?auto_19048 ?auto_19052 ) ) ( not ( = ?auto_19048 ?auto_19058 ) ) ( not ( = ?auto_19049 ?auto_19052 ) ) ( not ( = ?auto_19049 ?auto_19058 ) ) ( not ( = ?auto_19050 ?auto_19052 ) ) ( not ( = ?auto_19050 ?auto_19058 ) ) ( not ( = ?auto_19052 ?auto_19071 ) ) ( not ( = ?auto_19052 ?auto_19073 ) ) ( not ( = ?auto_19052 ?auto_19059 ) ) ( not ( = ?auto_19052 ?auto_19060 ) ) ( not ( = ?auto_19052 ?auto_19065 ) ) ( not ( = ?auto_19052 ?auto_19068 ) ) ( not ( = ?auto_19052 ?auto_19070 ) ) ( not ( = ?auto_19052 ?auto_19069 ) ) ( not ( = ?auto_19052 ?auto_19081 ) ) ( not ( = ?auto_19052 ?auto_19061 ) ) ( not ( = ?auto_19052 ?auto_19080 ) ) ( not ( = ?auto_19052 ?auto_19063 ) ) ( not ( = ?auto_19052 ?auto_19066 ) ) ( not ( = ?auto_19058 ?auto_19071 ) ) ( not ( = ?auto_19058 ?auto_19073 ) ) ( not ( = ?auto_19058 ?auto_19059 ) ) ( not ( = ?auto_19058 ?auto_19060 ) ) ( not ( = ?auto_19058 ?auto_19065 ) ) ( not ( = ?auto_19058 ?auto_19068 ) ) ( not ( = ?auto_19058 ?auto_19070 ) ) ( not ( = ?auto_19058 ?auto_19069 ) ) ( not ( = ?auto_19058 ?auto_19081 ) ) ( not ( = ?auto_19058 ?auto_19061 ) ) ( not ( = ?auto_19058 ?auto_19080 ) ) ( not ( = ?auto_19058 ?auto_19063 ) ) ( not ( = ?auto_19058 ?auto_19066 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_19038 ?auto_19039 ?auto_19040 ?auto_19041 ?auto_19042 ?auto_19043 ?auto_19044 ?auto_19045 ?auto_19046 ?auto_19047 ?auto_19048 ?auto_19049 ?auto_19050 ?auto_19051 )
      ( MAKE-1CRATE ?auto_19051 ?auto_19052 )
      ( MAKE-14CRATE-VERIFY ?auto_19038 ?auto_19039 ?auto_19040 ?auto_19041 ?auto_19042 ?auto_19043 ?auto_19044 ?auto_19045 ?auto_19046 ?auto_19047 ?auto_19048 ?auto_19049 ?auto_19050 ?auto_19051 ?auto_19052 ) )
  )

)

