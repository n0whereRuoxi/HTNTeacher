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

  ( :method MAKE-15CRATE-VERIFY
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
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915440 - SURFACE
      ?auto_1915441 - SURFACE
    )
    :vars
    (
      ?auto_1915442 - HOIST
      ?auto_1915443 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915442 ?auto_1915443 ) ( SURFACE-AT ?auto_1915440 ?auto_1915443 ) ( CLEAR ?auto_1915440 ) ( LIFTING ?auto_1915442 ?auto_1915441 ) ( IS-CRATE ?auto_1915441 ) ( not ( = ?auto_1915440 ?auto_1915441 ) ) )
    :subtasks
    ( ( !DROP ?auto_1915442 ?auto_1915441 ?auto_1915440 ?auto_1915443 )
      ( MAKE-1CRATE-VERIFY ?auto_1915440 ?auto_1915441 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915444 - SURFACE
      ?auto_1915445 - SURFACE
    )
    :vars
    (
      ?auto_1915447 - HOIST
      ?auto_1915446 - PLACE
      ?auto_1915448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915447 ?auto_1915446 ) ( SURFACE-AT ?auto_1915444 ?auto_1915446 ) ( CLEAR ?auto_1915444 ) ( IS-CRATE ?auto_1915445 ) ( not ( = ?auto_1915444 ?auto_1915445 ) ) ( TRUCK-AT ?auto_1915448 ?auto_1915446 ) ( AVAILABLE ?auto_1915447 ) ( IN ?auto_1915445 ?auto_1915448 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1915447 ?auto_1915445 ?auto_1915448 ?auto_1915446 )
      ( MAKE-1CRATE ?auto_1915444 ?auto_1915445 )
      ( MAKE-1CRATE-VERIFY ?auto_1915444 ?auto_1915445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915449 - SURFACE
      ?auto_1915450 - SURFACE
    )
    :vars
    (
      ?auto_1915452 - HOIST
      ?auto_1915451 - PLACE
      ?auto_1915453 - TRUCK
      ?auto_1915454 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915452 ?auto_1915451 ) ( SURFACE-AT ?auto_1915449 ?auto_1915451 ) ( CLEAR ?auto_1915449 ) ( IS-CRATE ?auto_1915450 ) ( not ( = ?auto_1915449 ?auto_1915450 ) ) ( AVAILABLE ?auto_1915452 ) ( IN ?auto_1915450 ?auto_1915453 ) ( TRUCK-AT ?auto_1915453 ?auto_1915454 ) ( not ( = ?auto_1915454 ?auto_1915451 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1915453 ?auto_1915454 ?auto_1915451 )
      ( MAKE-1CRATE ?auto_1915449 ?auto_1915450 )
      ( MAKE-1CRATE-VERIFY ?auto_1915449 ?auto_1915450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915455 - SURFACE
      ?auto_1915456 - SURFACE
    )
    :vars
    (
      ?auto_1915457 - HOIST
      ?auto_1915459 - PLACE
      ?auto_1915458 - TRUCK
      ?auto_1915460 - PLACE
      ?auto_1915461 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915457 ?auto_1915459 ) ( SURFACE-AT ?auto_1915455 ?auto_1915459 ) ( CLEAR ?auto_1915455 ) ( IS-CRATE ?auto_1915456 ) ( not ( = ?auto_1915455 ?auto_1915456 ) ) ( AVAILABLE ?auto_1915457 ) ( TRUCK-AT ?auto_1915458 ?auto_1915460 ) ( not ( = ?auto_1915460 ?auto_1915459 ) ) ( HOIST-AT ?auto_1915461 ?auto_1915460 ) ( LIFTING ?auto_1915461 ?auto_1915456 ) ( not ( = ?auto_1915457 ?auto_1915461 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1915461 ?auto_1915456 ?auto_1915458 ?auto_1915460 )
      ( MAKE-1CRATE ?auto_1915455 ?auto_1915456 )
      ( MAKE-1CRATE-VERIFY ?auto_1915455 ?auto_1915456 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915462 - SURFACE
      ?auto_1915463 - SURFACE
    )
    :vars
    (
      ?auto_1915466 - HOIST
      ?auto_1915467 - PLACE
      ?auto_1915468 - TRUCK
      ?auto_1915465 - PLACE
      ?auto_1915464 - HOIST
      ?auto_1915469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915466 ?auto_1915467 ) ( SURFACE-AT ?auto_1915462 ?auto_1915467 ) ( CLEAR ?auto_1915462 ) ( IS-CRATE ?auto_1915463 ) ( not ( = ?auto_1915462 ?auto_1915463 ) ) ( AVAILABLE ?auto_1915466 ) ( TRUCK-AT ?auto_1915468 ?auto_1915465 ) ( not ( = ?auto_1915465 ?auto_1915467 ) ) ( HOIST-AT ?auto_1915464 ?auto_1915465 ) ( not ( = ?auto_1915466 ?auto_1915464 ) ) ( AVAILABLE ?auto_1915464 ) ( SURFACE-AT ?auto_1915463 ?auto_1915465 ) ( ON ?auto_1915463 ?auto_1915469 ) ( CLEAR ?auto_1915463 ) ( not ( = ?auto_1915462 ?auto_1915469 ) ) ( not ( = ?auto_1915463 ?auto_1915469 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1915464 ?auto_1915463 ?auto_1915469 ?auto_1915465 )
      ( MAKE-1CRATE ?auto_1915462 ?auto_1915463 )
      ( MAKE-1CRATE-VERIFY ?auto_1915462 ?auto_1915463 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915470 - SURFACE
      ?auto_1915471 - SURFACE
    )
    :vars
    (
      ?auto_1915475 - HOIST
      ?auto_1915473 - PLACE
      ?auto_1915474 - PLACE
      ?auto_1915476 - HOIST
      ?auto_1915477 - SURFACE
      ?auto_1915472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915475 ?auto_1915473 ) ( SURFACE-AT ?auto_1915470 ?auto_1915473 ) ( CLEAR ?auto_1915470 ) ( IS-CRATE ?auto_1915471 ) ( not ( = ?auto_1915470 ?auto_1915471 ) ) ( AVAILABLE ?auto_1915475 ) ( not ( = ?auto_1915474 ?auto_1915473 ) ) ( HOIST-AT ?auto_1915476 ?auto_1915474 ) ( not ( = ?auto_1915475 ?auto_1915476 ) ) ( AVAILABLE ?auto_1915476 ) ( SURFACE-AT ?auto_1915471 ?auto_1915474 ) ( ON ?auto_1915471 ?auto_1915477 ) ( CLEAR ?auto_1915471 ) ( not ( = ?auto_1915470 ?auto_1915477 ) ) ( not ( = ?auto_1915471 ?auto_1915477 ) ) ( TRUCK-AT ?auto_1915472 ?auto_1915473 ) )
    :subtasks
    ( ( !DRIVE ?auto_1915472 ?auto_1915473 ?auto_1915474 )
      ( MAKE-1CRATE ?auto_1915470 ?auto_1915471 )
      ( MAKE-1CRATE-VERIFY ?auto_1915470 ?auto_1915471 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915487 - SURFACE
      ?auto_1915488 - SURFACE
      ?auto_1915489 - SURFACE
    )
    :vars
    (
      ?auto_1915491 - HOIST
      ?auto_1915490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915491 ?auto_1915490 ) ( SURFACE-AT ?auto_1915488 ?auto_1915490 ) ( CLEAR ?auto_1915488 ) ( LIFTING ?auto_1915491 ?auto_1915489 ) ( IS-CRATE ?auto_1915489 ) ( not ( = ?auto_1915488 ?auto_1915489 ) ) ( ON ?auto_1915488 ?auto_1915487 ) ( not ( = ?auto_1915487 ?auto_1915488 ) ) ( not ( = ?auto_1915487 ?auto_1915489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915488 ?auto_1915489 )
      ( MAKE-2CRATE-VERIFY ?auto_1915487 ?auto_1915488 ?auto_1915489 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915497 - SURFACE
      ?auto_1915498 - SURFACE
      ?auto_1915499 - SURFACE
    )
    :vars
    (
      ?auto_1915502 - HOIST
      ?auto_1915501 - PLACE
      ?auto_1915500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915502 ?auto_1915501 ) ( SURFACE-AT ?auto_1915498 ?auto_1915501 ) ( CLEAR ?auto_1915498 ) ( IS-CRATE ?auto_1915499 ) ( not ( = ?auto_1915498 ?auto_1915499 ) ) ( TRUCK-AT ?auto_1915500 ?auto_1915501 ) ( AVAILABLE ?auto_1915502 ) ( IN ?auto_1915499 ?auto_1915500 ) ( ON ?auto_1915498 ?auto_1915497 ) ( not ( = ?auto_1915497 ?auto_1915498 ) ) ( not ( = ?auto_1915497 ?auto_1915499 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915498 ?auto_1915499 )
      ( MAKE-2CRATE-VERIFY ?auto_1915497 ?auto_1915498 ?auto_1915499 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915503 - SURFACE
      ?auto_1915504 - SURFACE
    )
    :vars
    (
      ?auto_1915508 - HOIST
      ?auto_1915505 - PLACE
      ?auto_1915507 - TRUCK
      ?auto_1915506 - SURFACE
      ?auto_1915509 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915508 ?auto_1915505 ) ( SURFACE-AT ?auto_1915503 ?auto_1915505 ) ( CLEAR ?auto_1915503 ) ( IS-CRATE ?auto_1915504 ) ( not ( = ?auto_1915503 ?auto_1915504 ) ) ( AVAILABLE ?auto_1915508 ) ( IN ?auto_1915504 ?auto_1915507 ) ( ON ?auto_1915503 ?auto_1915506 ) ( not ( = ?auto_1915506 ?auto_1915503 ) ) ( not ( = ?auto_1915506 ?auto_1915504 ) ) ( TRUCK-AT ?auto_1915507 ?auto_1915509 ) ( not ( = ?auto_1915509 ?auto_1915505 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1915507 ?auto_1915509 ?auto_1915505 )
      ( MAKE-2CRATE ?auto_1915506 ?auto_1915503 ?auto_1915504 )
      ( MAKE-1CRATE-VERIFY ?auto_1915503 ?auto_1915504 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915510 - SURFACE
      ?auto_1915511 - SURFACE
      ?auto_1915512 - SURFACE
    )
    :vars
    (
      ?auto_1915513 - HOIST
      ?auto_1915516 - PLACE
      ?auto_1915514 - TRUCK
      ?auto_1915515 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915513 ?auto_1915516 ) ( SURFACE-AT ?auto_1915511 ?auto_1915516 ) ( CLEAR ?auto_1915511 ) ( IS-CRATE ?auto_1915512 ) ( not ( = ?auto_1915511 ?auto_1915512 ) ) ( AVAILABLE ?auto_1915513 ) ( IN ?auto_1915512 ?auto_1915514 ) ( ON ?auto_1915511 ?auto_1915510 ) ( not ( = ?auto_1915510 ?auto_1915511 ) ) ( not ( = ?auto_1915510 ?auto_1915512 ) ) ( TRUCK-AT ?auto_1915514 ?auto_1915515 ) ( not ( = ?auto_1915515 ?auto_1915516 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915511 ?auto_1915512 )
      ( MAKE-2CRATE-VERIFY ?auto_1915510 ?auto_1915511 ?auto_1915512 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915517 - SURFACE
      ?auto_1915518 - SURFACE
    )
    :vars
    (
      ?auto_1915520 - HOIST
      ?auto_1915521 - PLACE
      ?auto_1915523 - SURFACE
      ?auto_1915522 - TRUCK
      ?auto_1915519 - PLACE
      ?auto_1915524 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915520 ?auto_1915521 ) ( SURFACE-AT ?auto_1915517 ?auto_1915521 ) ( CLEAR ?auto_1915517 ) ( IS-CRATE ?auto_1915518 ) ( not ( = ?auto_1915517 ?auto_1915518 ) ) ( AVAILABLE ?auto_1915520 ) ( ON ?auto_1915517 ?auto_1915523 ) ( not ( = ?auto_1915523 ?auto_1915517 ) ) ( not ( = ?auto_1915523 ?auto_1915518 ) ) ( TRUCK-AT ?auto_1915522 ?auto_1915519 ) ( not ( = ?auto_1915519 ?auto_1915521 ) ) ( HOIST-AT ?auto_1915524 ?auto_1915519 ) ( LIFTING ?auto_1915524 ?auto_1915518 ) ( not ( = ?auto_1915520 ?auto_1915524 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1915524 ?auto_1915518 ?auto_1915522 ?auto_1915519 )
      ( MAKE-2CRATE ?auto_1915523 ?auto_1915517 ?auto_1915518 )
      ( MAKE-1CRATE-VERIFY ?auto_1915517 ?auto_1915518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915525 - SURFACE
      ?auto_1915526 - SURFACE
      ?auto_1915527 - SURFACE
    )
    :vars
    (
      ?auto_1915530 - HOIST
      ?auto_1915528 - PLACE
      ?auto_1915531 - TRUCK
      ?auto_1915532 - PLACE
      ?auto_1915529 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915530 ?auto_1915528 ) ( SURFACE-AT ?auto_1915526 ?auto_1915528 ) ( CLEAR ?auto_1915526 ) ( IS-CRATE ?auto_1915527 ) ( not ( = ?auto_1915526 ?auto_1915527 ) ) ( AVAILABLE ?auto_1915530 ) ( ON ?auto_1915526 ?auto_1915525 ) ( not ( = ?auto_1915525 ?auto_1915526 ) ) ( not ( = ?auto_1915525 ?auto_1915527 ) ) ( TRUCK-AT ?auto_1915531 ?auto_1915532 ) ( not ( = ?auto_1915532 ?auto_1915528 ) ) ( HOIST-AT ?auto_1915529 ?auto_1915532 ) ( LIFTING ?auto_1915529 ?auto_1915527 ) ( not ( = ?auto_1915530 ?auto_1915529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915526 ?auto_1915527 )
      ( MAKE-2CRATE-VERIFY ?auto_1915525 ?auto_1915526 ?auto_1915527 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915533 - SURFACE
      ?auto_1915534 - SURFACE
    )
    :vars
    (
      ?auto_1915539 - HOIST
      ?auto_1915540 - PLACE
      ?auto_1915538 - SURFACE
      ?auto_1915535 - TRUCK
      ?auto_1915537 - PLACE
      ?auto_1915536 - HOIST
      ?auto_1915541 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915539 ?auto_1915540 ) ( SURFACE-AT ?auto_1915533 ?auto_1915540 ) ( CLEAR ?auto_1915533 ) ( IS-CRATE ?auto_1915534 ) ( not ( = ?auto_1915533 ?auto_1915534 ) ) ( AVAILABLE ?auto_1915539 ) ( ON ?auto_1915533 ?auto_1915538 ) ( not ( = ?auto_1915538 ?auto_1915533 ) ) ( not ( = ?auto_1915538 ?auto_1915534 ) ) ( TRUCK-AT ?auto_1915535 ?auto_1915537 ) ( not ( = ?auto_1915537 ?auto_1915540 ) ) ( HOIST-AT ?auto_1915536 ?auto_1915537 ) ( not ( = ?auto_1915539 ?auto_1915536 ) ) ( AVAILABLE ?auto_1915536 ) ( SURFACE-AT ?auto_1915534 ?auto_1915537 ) ( ON ?auto_1915534 ?auto_1915541 ) ( CLEAR ?auto_1915534 ) ( not ( = ?auto_1915533 ?auto_1915541 ) ) ( not ( = ?auto_1915534 ?auto_1915541 ) ) ( not ( = ?auto_1915538 ?auto_1915541 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1915536 ?auto_1915534 ?auto_1915541 ?auto_1915537 )
      ( MAKE-2CRATE ?auto_1915538 ?auto_1915533 ?auto_1915534 )
      ( MAKE-1CRATE-VERIFY ?auto_1915533 ?auto_1915534 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915542 - SURFACE
      ?auto_1915543 - SURFACE
      ?auto_1915544 - SURFACE
    )
    :vars
    (
      ?auto_1915547 - HOIST
      ?auto_1915545 - PLACE
      ?auto_1915549 - TRUCK
      ?auto_1915548 - PLACE
      ?auto_1915550 - HOIST
      ?auto_1915546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915547 ?auto_1915545 ) ( SURFACE-AT ?auto_1915543 ?auto_1915545 ) ( CLEAR ?auto_1915543 ) ( IS-CRATE ?auto_1915544 ) ( not ( = ?auto_1915543 ?auto_1915544 ) ) ( AVAILABLE ?auto_1915547 ) ( ON ?auto_1915543 ?auto_1915542 ) ( not ( = ?auto_1915542 ?auto_1915543 ) ) ( not ( = ?auto_1915542 ?auto_1915544 ) ) ( TRUCK-AT ?auto_1915549 ?auto_1915548 ) ( not ( = ?auto_1915548 ?auto_1915545 ) ) ( HOIST-AT ?auto_1915550 ?auto_1915548 ) ( not ( = ?auto_1915547 ?auto_1915550 ) ) ( AVAILABLE ?auto_1915550 ) ( SURFACE-AT ?auto_1915544 ?auto_1915548 ) ( ON ?auto_1915544 ?auto_1915546 ) ( CLEAR ?auto_1915544 ) ( not ( = ?auto_1915543 ?auto_1915546 ) ) ( not ( = ?auto_1915544 ?auto_1915546 ) ) ( not ( = ?auto_1915542 ?auto_1915546 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915543 ?auto_1915544 )
      ( MAKE-2CRATE-VERIFY ?auto_1915542 ?auto_1915543 ?auto_1915544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915551 - SURFACE
      ?auto_1915552 - SURFACE
    )
    :vars
    (
      ?auto_1915556 - HOIST
      ?auto_1915559 - PLACE
      ?auto_1915555 - SURFACE
      ?auto_1915557 - PLACE
      ?auto_1915558 - HOIST
      ?auto_1915553 - SURFACE
      ?auto_1915554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915556 ?auto_1915559 ) ( SURFACE-AT ?auto_1915551 ?auto_1915559 ) ( CLEAR ?auto_1915551 ) ( IS-CRATE ?auto_1915552 ) ( not ( = ?auto_1915551 ?auto_1915552 ) ) ( AVAILABLE ?auto_1915556 ) ( ON ?auto_1915551 ?auto_1915555 ) ( not ( = ?auto_1915555 ?auto_1915551 ) ) ( not ( = ?auto_1915555 ?auto_1915552 ) ) ( not ( = ?auto_1915557 ?auto_1915559 ) ) ( HOIST-AT ?auto_1915558 ?auto_1915557 ) ( not ( = ?auto_1915556 ?auto_1915558 ) ) ( AVAILABLE ?auto_1915558 ) ( SURFACE-AT ?auto_1915552 ?auto_1915557 ) ( ON ?auto_1915552 ?auto_1915553 ) ( CLEAR ?auto_1915552 ) ( not ( = ?auto_1915551 ?auto_1915553 ) ) ( not ( = ?auto_1915552 ?auto_1915553 ) ) ( not ( = ?auto_1915555 ?auto_1915553 ) ) ( TRUCK-AT ?auto_1915554 ?auto_1915559 ) )
    :subtasks
    ( ( !DRIVE ?auto_1915554 ?auto_1915559 ?auto_1915557 )
      ( MAKE-2CRATE ?auto_1915555 ?auto_1915551 ?auto_1915552 )
      ( MAKE-1CRATE-VERIFY ?auto_1915551 ?auto_1915552 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915560 - SURFACE
      ?auto_1915561 - SURFACE
      ?auto_1915562 - SURFACE
    )
    :vars
    (
      ?auto_1915567 - HOIST
      ?auto_1915564 - PLACE
      ?auto_1915565 - PLACE
      ?auto_1915563 - HOIST
      ?auto_1915568 - SURFACE
      ?auto_1915566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915567 ?auto_1915564 ) ( SURFACE-AT ?auto_1915561 ?auto_1915564 ) ( CLEAR ?auto_1915561 ) ( IS-CRATE ?auto_1915562 ) ( not ( = ?auto_1915561 ?auto_1915562 ) ) ( AVAILABLE ?auto_1915567 ) ( ON ?auto_1915561 ?auto_1915560 ) ( not ( = ?auto_1915560 ?auto_1915561 ) ) ( not ( = ?auto_1915560 ?auto_1915562 ) ) ( not ( = ?auto_1915565 ?auto_1915564 ) ) ( HOIST-AT ?auto_1915563 ?auto_1915565 ) ( not ( = ?auto_1915567 ?auto_1915563 ) ) ( AVAILABLE ?auto_1915563 ) ( SURFACE-AT ?auto_1915562 ?auto_1915565 ) ( ON ?auto_1915562 ?auto_1915568 ) ( CLEAR ?auto_1915562 ) ( not ( = ?auto_1915561 ?auto_1915568 ) ) ( not ( = ?auto_1915562 ?auto_1915568 ) ) ( not ( = ?auto_1915560 ?auto_1915568 ) ) ( TRUCK-AT ?auto_1915566 ?auto_1915564 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915561 ?auto_1915562 )
      ( MAKE-2CRATE-VERIFY ?auto_1915560 ?auto_1915561 ?auto_1915562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915569 - SURFACE
      ?auto_1915570 - SURFACE
    )
    :vars
    (
      ?auto_1915573 - HOIST
      ?auto_1915574 - PLACE
      ?auto_1915571 - SURFACE
      ?auto_1915577 - PLACE
      ?auto_1915575 - HOIST
      ?auto_1915576 - SURFACE
      ?auto_1915572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915573 ?auto_1915574 ) ( IS-CRATE ?auto_1915570 ) ( not ( = ?auto_1915569 ?auto_1915570 ) ) ( not ( = ?auto_1915571 ?auto_1915569 ) ) ( not ( = ?auto_1915571 ?auto_1915570 ) ) ( not ( = ?auto_1915577 ?auto_1915574 ) ) ( HOIST-AT ?auto_1915575 ?auto_1915577 ) ( not ( = ?auto_1915573 ?auto_1915575 ) ) ( AVAILABLE ?auto_1915575 ) ( SURFACE-AT ?auto_1915570 ?auto_1915577 ) ( ON ?auto_1915570 ?auto_1915576 ) ( CLEAR ?auto_1915570 ) ( not ( = ?auto_1915569 ?auto_1915576 ) ) ( not ( = ?auto_1915570 ?auto_1915576 ) ) ( not ( = ?auto_1915571 ?auto_1915576 ) ) ( TRUCK-AT ?auto_1915572 ?auto_1915574 ) ( SURFACE-AT ?auto_1915571 ?auto_1915574 ) ( CLEAR ?auto_1915571 ) ( LIFTING ?auto_1915573 ?auto_1915569 ) ( IS-CRATE ?auto_1915569 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915571 ?auto_1915569 )
      ( MAKE-2CRATE ?auto_1915571 ?auto_1915569 ?auto_1915570 )
      ( MAKE-1CRATE-VERIFY ?auto_1915569 ?auto_1915570 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915578 - SURFACE
      ?auto_1915579 - SURFACE
      ?auto_1915580 - SURFACE
    )
    :vars
    (
      ?auto_1915585 - HOIST
      ?auto_1915584 - PLACE
      ?auto_1915581 - PLACE
      ?auto_1915582 - HOIST
      ?auto_1915583 - SURFACE
      ?auto_1915586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915585 ?auto_1915584 ) ( IS-CRATE ?auto_1915580 ) ( not ( = ?auto_1915579 ?auto_1915580 ) ) ( not ( = ?auto_1915578 ?auto_1915579 ) ) ( not ( = ?auto_1915578 ?auto_1915580 ) ) ( not ( = ?auto_1915581 ?auto_1915584 ) ) ( HOIST-AT ?auto_1915582 ?auto_1915581 ) ( not ( = ?auto_1915585 ?auto_1915582 ) ) ( AVAILABLE ?auto_1915582 ) ( SURFACE-AT ?auto_1915580 ?auto_1915581 ) ( ON ?auto_1915580 ?auto_1915583 ) ( CLEAR ?auto_1915580 ) ( not ( = ?auto_1915579 ?auto_1915583 ) ) ( not ( = ?auto_1915580 ?auto_1915583 ) ) ( not ( = ?auto_1915578 ?auto_1915583 ) ) ( TRUCK-AT ?auto_1915586 ?auto_1915584 ) ( SURFACE-AT ?auto_1915578 ?auto_1915584 ) ( CLEAR ?auto_1915578 ) ( LIFTING ?auto_1915585 ?auto_1915579 ) ( IS-CRATE ?auto_1915579 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915579 ?auto_1915580 )
      ( MAKE-2CRATE-VERIFY ?auto_1915578 ?auto_1915579 ?auto_1915580 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915587 - SURFACE
      ?auto_1915588 - SURFACE
    )
    :vars
    (
      ?auto_1915591 - HOIST
      ?auto_1915589 - PLACE
      ?auto_1915594 - SURFACE
      ?auto_1915590 - PLACE
      ?auto_1915595 - HOIST
      ?auto_1915593 - SURFACE
      ?auto_1915592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915591 ?auto_1915589 ) ( IS-CRATE ?auto_1915588 ) ( not ( = ?auto_1915587 ?auto_1915588 ) ) ( not ( = ?auto_1915594 ?auto_1915587 ) ) ( not ( = ?auto_1915594 ?auto_1915588 ) ) ( not ( = ?auto_1915590 ?auto_1915589 ) ) ( HOIST-AT ?auto_1915595 ?auto_1915590 ) ( not ( = ?auto_1915591 ?auto_1915595 ) ) ( AVAILABLE ?auto_1915595 ) ( SURFACE-AT ?auto_1915588 ?auto_1915590 ) ( ON ?auto_1915588 ?auto_1915593 ) ( CLEAR ?auto_1915588 ) ( not ( = ?auto_1915587 ?auto_1915593 ) ) ( not ( = ?auto_1915588 ?auto_1915593 ) ) ( not ( = ?auto_1915594 ?auto_1915593 ) ) ( TRUCK-AT ?auto_1915592 ?auto_1915589 ) ( SURFACE-AT ?auto_1915594 ?auto_1915589 ) ( CLEAR ?auto_1915594 ) ( IS-CRATE ?auto_1915587 ) ( AVAILABLE ?auto_1915591 ) ( IN ?auto_1915587 ?auto_1915592 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1915591 ?auto_1915587 ?auto_1915592 ?auto_1915589 )
      ( MAKE-2CRATE ?auto_1915594 ?auto_1915587 ?auto_1915588 )
      ( MAKE-1CRATE-VERIFY ?auto_1915587 ?auto_1915588 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1915596 - SURFACE
      ?auto_1915597 - SURFACE
      ?auto_1915598 - SURFACE
    )
    :vars
    (
      ?auto_1915603 - HOIST
      ?auto_1915601 - PLACE
      ?auto_1915604 - PLACE
      ?auto_1915602 - HOIST
      ?auto_1915599 - SURFACE
      ?auto_1915600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915603 ?auto_1915601 ) ( IS-CRATE ?auto_1915598 ) ( not ( = ?auto_1915597 ?auto_1915598 ) ) ( not ( = ?auto_1915596 ?auto_1915597 ) ) ( not ( = ?auto_1915596 ?auto_1915598 ) ) ( not ( = ?auto_1915604 ?auto_1915601 ) ) ( HOIST-AT ?auto_1915602 ?auto_1915604 ) ( not ( = ?auto_1915603 ?auto_1915602 ) ) ( AVAILABLE ?auto_1915602 ) ( SURFACE-AT ?auto_1915598 ?auto_1915604 ) ( ON ?auto_1915598 ?auto_1915599 ) ( CLEAR ?auto_1915598 ) ( not ( = ?auto_1915597 ?auto_1915599 ) ) ( not ( = ?auto_1915598 ?auto_1915599 ) ) ( not ( = ?auto_1915596 ?auto_1915599 ) ) ( TRUCK-AT ?auto_1915600 ?auto_1915601 ) ( SURFACE-AT ?auto_1915596 ?auto_1915601 ) ( CLEAR ?auto_1915596 ) ( IS-CRATE ?auto_1915597 ) ( AVAILABLE ?auto_1915603 ) ( IN ?auto_1915597 ?auto_1915600 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915597 ?auto_1915598 )
      ( MAKE-2CRATE-VERIFY ?auto_1915596 ?auto_1915597 ?auto_1915598 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1915641 - SURFACE
      ?auto_1915642 - SURFACE
    )
    :vars
    (
      ?auto_1915644 - HOIST
      ?auto_1915648 - PLACE
      ?auto_1915645 - SURFACE
      ?auto_1915647 - PLACE
      ?auto_1915649 - HOIST
      ?auto_1915643 - SURFACE
      ?auto_1915646 - TRUCK
      ?auto_1915650 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915644 ?auto_1915648 ) ( SURFACE-AT ?auto_1915641 ?auto_1915648 ) ( CLEAR ?auto_1915641 ) ( IS-CRATE ?auto_1915642 ) ( not ( = ?auto_1915641 ?auto_1915642 ) ) ( AVAILABLE ?auto_1915644 ) ( ON ?auto_1915641 ?auto_1915645 ) ( not ( = ?auto_1915645 ?auto_1915641 ) ) ( not ( = ?auto_1915645 ?auto_1915642 ) ) ( not ( = ?auto_1915647 ?auto_1915648 ) ) ( HOIST-AT ?auto_1915649 ?auto_1915647 ) ( not ( = ?auto_1915644 ?auto_1915649 ) ) ( AVAILABLE ?auto_1915649 ) ( SURFACE-AT ?auto_1915642 ?auto_1915647 ) ( ON ?auto_1915642 ?auto_1915643 ) ( CLEAR ?auto_1915642 ) ( not ( = ?auto_1915641 ?auto_1915643 ) ) ( not ( = ?auto_1915642 ?auto_1915643 ) ) ( not ( = ?auto_1915645 ?auto_1915643 ) ) ( TRUCK-AT ?auto_1915646 ?auto_1915650 ) ( not ( = ?auto_1915650 ?auto_1915648 ) ) ( not ( = ?auto_1915647 ?auto_1915650 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1915646 ?auto_1915650 ?auto_1915648 )
      ( MAKE-1CRATE ?auto_1915641 ?auto_1915642 )
      ( MAKE-1CRATE-VERIFY ?auto_1915641 ?auto_1915642 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915681 - SURFACE
      ?auto_1915682 - SURFACE
      ?auto_1915683 - SURFACE
      ?auto_1915680 - SURFACE
    )
    :vars
    (
      ?auto_1915685 - HOIST
      ?auto_1915684 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915685 ?auto_1915684 ) ( SURFACE-AT ?auto_1915683 ?auto_1915684 ) ( CLEAR ?auto_1915683 ) ( LIFTING ?auto_1915685 ?auto_1915680 ) ( IS-CRATE ?auto_1915680 ) ( not ( = ?auto_1915683 ?auto_1915680 ) ) ( ON ?auto_1915682 ?auto_1915681 ) ( ON ?auto_1915683 ?auto_1915682 ) ( not ( = ?auto_1915681 ?auto_1915682 ) ) ( not ( = ?auto_1915681 ?auto_1915683 ) ) ( not ( = ?auto_1915681 ?auto_1915680 ) ) ( not ( = ?auto_1915682 ?auto_1915683 ) ) ( not ( = ?auto_1915682 ?auto_1915680 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1915683 ?auto_1915680 )
      ( MAKE-3CRATE-VERIFY ?auto_1915681 ?auto_1915682 ?auto_1915683 ?auto_1915680 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915698 - SURFACE
      ?auto_1915699 - SURFACE
      ?auto_1915700 - SURFACE
      ?auto_1915697 - SURFACE
    )
    :vars
    (
      ?auto_1915703 - HOIST
      ?auto_1915701 - PLACE
      ?auto_1915702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915703 ?auto_1915701 ) ( SURFACE-AT ?auto_1915700 ?auto_1915701 ) ( CLEAR ?auto_1915700 ) ( IS-CRATE ?auto_1915697 ) ( not ( = ?auto_1915700 ?auto_1915697 ) ) ( TRUCK-AT ?auto_1915702 ?auto_1915701 ) ( AVAILABLE ?auto_1915703 ) ( IN ?auto_1915697 ?auto_1915702 ) ( ON ?auto_1915700 ?auto_1915699 ) ( not ( = ?auto_1915699 ?auto_1915700 ) ) ( not ( = ?auto_1915699 ?auto_1915697 ) ) ( ON ?auto_1915699 ?auto_1915698 ) ( not ( = ?auto_1915698 ?auto_1915699 ) ) ( not ( = ?auto_1915698 ?auto_1915700 ) ) ( not ( = ?auto_1915698 ?auto_1915697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915699 ?auto_1915700 ?auto_1915697 )
      ( MAKE-3CRATE-VERIFY ?auto_1915698 ?auto_1915699 ?auto_1915700 ?auto_1915697 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915719 - SURFACE
      ?auto_1915720 - SURFACE
      ?auto_1915721 - SURFACE
      ?auto_1915718 - SURFACE
    )
    :vars
    (
      ?auto_1915722 - HOIST
      ?auto_1915725 - PLACE
      ?auto_1915723 - TRUCK
      ?auto_1915724 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915722 ?auto_1915725 ) ( SURFACE-AT ?auto_1915721 ?auto_1915725 ) ( CLEAR ?auto_1915721 ) ( IS-CRATE ?auto_1915718 ) ( not ( = ?auto_1915721 ?auto_1915718 ) ) ( AVAILABLE ?auto_1915722 ) ( IN ?auto_1915718 ?auto_1915723 ) ( ON ?auto_1915721 ?auto_1915720 ) ( not ( = ?auto_1915720 ?auto_1915721 ) ) ( not ( = ?auto_1915720 ?auto_1915718 ) ) ( TRUCK-AT ?auto_1915723 ?auto_1915724 ) ( not ( = ?auto_1915724 ?auto_1915725 ) ) ( ON ?auto_1915720 ?auto_1915719 ) ( not ( = ?auto_1915719 ?auto_1915720 ) ) ( not ( = ?auto_1915719 ?auto_1915721 ) ) ( not ( = ?auto_1915719 ?auto_1915718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915720 ?auto_1915721 ?auto_1915718 )
      ( MAKE-3CRATE-VERIFY ?auto_1915719 ?auto_1915720 ?auto_1915721 ?auto_1915718 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915743 - SURFACE
      ?auto_1915744 - SURFACE
      ?auto_1915745 - SURFACE
      ?auto_1915742 - SURFACE
    )
    :vars
    (
      ?auto_1915746 - HOIST
      ?auto_1915750 - PLACE
      ?auto_1915747 - TRUCK
      ?auto_1915748 - PLACE
      ?auto_1915749 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915746 ?auto_1915750 ) ( SURFACE-AT ?auto_1915745 ?auto_1915750 ) ( CLEAR ?auto_1915745 ) ( IS-CRATE ?auto_1915742 ) ( not ( = ?auto_1915745 ?auto_1915742 ) ) ( AVAILABLE ?auto_1915746 ) ( ON ?auto_1915745 ?auto_1915744 ) ( not ( = ?auto_1915744 ?auto_1915745 ) ) ( not ( = ?auto_1915744 ?auto_1915742 ) ) ( TRUCK-AT ?auto_1915747 ?auto_1915748 ) ( not ( = ?auto_1915748 ?auto_1915750 ) ) ( HOIST-AT ?auto_1915749 ?auto_1915748 ) ( LIFTING ?auto_1915749 ?auto_1915742 ) ( not ( = ?auto_1915746 ?auto_1915749 ) ) ( ON ?auto_1915744 ?auto_1915743 ) ( not ( = ?auto_1915743 ?auto_1915744 ) ) ( not ( = ?auto_1915743 ?auto_1915745 ) ) ( not ( = ?auto_1915743 ?auto_1915742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915744 ?auto_1915745 ?auto_1915742 )
      ( MAKE-3CRATE-VERIFY ?auto_1915743 ?auto_1915744 ?auto_1915745 ?auto_1915742 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915770 - SURFACE
      ?auto_1915771 - SURFACE
      ?auto_1915772 - SURFACE
      ?auto_1915769 - SURFACE
    )
    :vars
    (
      ?auto_1915774 - HOIST
      ?auto_1915778 - PLACE
      ?auto_1915773 - TRUCK
      ?auto_1915777 - PLACE
      ?auto_1915776 - HOIST
      ?auto_1915775 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915774 ?auto_1915778 ) ( SURFACE-AT ?auto_1915772 ?auto_1915778 ) ( CLEAR ?auto_1915772 ) ( IS-CRATE ?auto_1915769 ) ( not ( = ?auto_1915772 ?auto_1915769 ) ) ( AVAILABLE ?auto_1915774 ) ( ON ?auto_1915772 ?auto_1915771 ) ( not ( = ?auto_1915771 ?auto_1915772 ) ) ( not ( = ?auto_1915771 ?auto_1915769 ) ) ( TRUCK-AT ?auto_1915773 ?auto_1915777 ) ( not ( = ?auto_1915777 ?auto_1915778 ) ) ( HOIST-AT ?auto_1915776 ?auto_1915777 ) ( not ( = ?auto_1915774 ?auto_1915776 ) ) ( AVAILABLE ?auto_1915776 ) ( SURFACE-AT ?auto_1915769 ?auto_1915777 ) ( ON ?auto_1915769 ?auto_1915775 ) ( CLEAR ?auto_1915769 ) ( not ( = ?auto_1915772 ?auto_1915775 ) ) ( not ( = ?auto_1915769 ?auto_1915775 ) ) ( not ( = ?auto_1915771 ?auto_1915775 ) ) ( ON ?auto_1915771 ?auto_1915770 ) ( not ( = ?auto_1915770 ?auto_1915771 ) ) ( not ( = ?auto_1915770 ?auto_1915772 ) ) ( not ( = ?auto_1915770 ?auto_1915769 ) ) ( not ( = ?auto_1915770 ?auto_1915775 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915771 ?auto_1915772 ?auto_1915769 )
      ( MAKE-3CRATE-VERIFY ?auto_1915770 ?auto_1915771 ?auto_1915772 ?auto_1915769 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915798 - SURFACE
      ?auto_1915799 - SURFACE
      ?auto_1915800 - SURFACE
      ?auto_1915797 - SURFACE
    )
    :vars
    (
      ?auto_1915804 - HOIST
      ?auto_1915806 - PLACE
      ?auto_1915801 - PLACE
      ?auto_1915803 - HOIST
      ?auto_1915802 - SURFACE
      ?auto_1915805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915804 ?auto_1915806 ) ( SURFACE-AT ?auto_1915800 ?auto_1915806 ) ( CLEAR ?auto_1915800 ) ( IS-CRATE ?auto_1915797 ) ( not ( = ?auto_1915800 ?auto_1915797 ) ) ( AVAILABLE ?auto_1915804 ) ( ON ?auto_1915800 ?auto_1915799 ) ( not ( = ?auto_1915799 ?auto_1915800 ) ) ( not ( = ?auto_1915799 ?auto_1915797 ) ) ( not ( = ?auto_1915801 ?auto_1915806 ) ) ( HOIST-AT ?auto_1915803 ?auto_1915801 ) ( not ( = ?auto_1915804 ?auto_1915803 ) ) ( AVAILABLE ?auto_1915803 ) ( SURFACE-AT ?auto_1915797 ?auto_1915801 ) ( ON ?auto_1915797 ?auto_1915802 ) ( CLEAR ?auto_1915797 ) ( not ( = ?auto_1915800 ?auto_1915802 ) ) ( not ( = ?auto_1915797 ?auto_1915802 ) ) ( not ( = ?auto_1915799 ?auto_1915802 ) ) ( TRUCK-AT ?auto_1915805 ?auto_1915806 ) ( ON ?auto_1915799 ?auto_1915798 ) ( not ( = ?auto_1915798 ?auto_1915799 ) ) ( not ( = ?auto_1915798 ?auto_1915800 ) ) ( not ( = ?auto_1915798 ?auto_1915797 ) ) ( not ( = ?auto_1915798 ?auto_1915802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915799 ?auto_1915800 ?auto_1915797 )
      ( MAKE-3CRATE-VERIFY ?auto_1915798 ?auto_1915799 ?auto_1915800 ?auto_1915797 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915826 - SURFACE
      ?auto_1915827 - SURFACE
      ?auto_1915828 - SURFACE
      ?auto_1915825 - SURFACE
    )
    :vars
    (
      ?auto_1915829 - HOIST
      ?auto_1915833 - PLACE
      ?auto_1915832 - PLACE
      ?auto_1915831 - HOIST
      ?auto_1915830 - SURFACE
      ?auto_1915834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915829 ?auto_1915833 ) ( IS-CRATE ?auto_1915825 ) ( not ( = ?auto_1915828 ?auto_1915825 ) ) ( not ( = ?auto_1915827 ?auto_1915828 ) ) ( not ( = ?auto_1915827 ?auto_1915825 ) ) ( not ( = ?auto_1915832 ?auto_1915833 ) ) ( HOIST-AT ?auto_1915831 ?auto_1915832 ) ( not ( = ?auto_1915829 ?auto_1915831 ) ) ( AVAILABLE ?auto_1915831 ) ( SURFACE-AT ?auto_1915825 ?auto_1915832 ) ( ON ?auto_1915825 ?auto_1915830 ) ( CLEAR ?auto_1915825 ) ( not ( = ?auto_1915828 ?auto_1915830 ) ) ( not ( = ?auto_1915825 ?auto_1915830 ) ) ( not ( = ?auto_1915827 ?auto_1915830 ) ) ( TRUCK-AT ?auto_1915834 ?auto_1915833 ) ( SURFACE-AT ?auto_1915827 ?auto_1915833 ) ( CLEAR ?auto_1915827 ) ( LIFTING ?auto_1915829 ?auto_1915828 ) ( IS-CRATE ?auto_1915828 ) ( ON ?auto_1915827 ?auto_1915826 ) ( not ( = ?auto_1915826 ?auto_1915827 ) ) ( not ( = ?auto_1915826 ?auto_1915828 ) ) ( not ( = ?auto_1915826 ?auto_1915825 ) ) ( not ( = ?auto_1915826 ?auto_1915830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915827 ?auto_1915828 ?auto_1915825 )
      ( MAKE-3CRATE-VERIFY ?auto_1915826 ?auto_1915827 ?auto_1915828 ?auto_1915825 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1915854 - SURFACE
      ?auto_1915855 - SURFACE
      ?auto_1915856 - SURFACE
      ?auto_1915853 - SURFACE
    )
    :vars
    (
      ?auto_1915861 - HOIST
      ?auto_1915857 - PLACE
      ?auto_1915858 - PLACE
      ?auto_1915860 - HOIST
      ?auto_1915862 - SURFACE
      ?auto_1915859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1915861 ?auto_1915857 ) ( IS-CRATE ?auto_1915853 ) ( not ( = ?auto_1915856 ?auto_1915853 ) ) ( not ( = ?auto_1915855 ?auto_1915856 ) ) ( not ( = ?auto_1915855 ?auto_1915853 ) ) ( not ( = ?auto_1915858 ?auto_1915857 ) ) ( HOIST-AT ?auto_1915860 ?auto_1915858 ) ( not ( = ?auto_1915861 ?auto_1915860 ) ) ( AVAILABLE ?auto_1915860 ) ( SURFACE-AT ?auto_1915853 ?auto_1915858 ) ( ON ?auto_1915853 ?auto_1915862 ) ( CLEAR ?auto_1915853 ) ( not ( = ?auto_1915856 ?auto_1915862 ) ) ( not ( = ?auto_1915853 ?auto_1915862 ) ) ( not ( = ?auto_1915855 ?auto_1915862 ) ) ( TRUCK-AT ?auto_1915859 ?auto_1915857 ) ( SURFACE-AT ?auto_1915855 ?auto_1915857 ) ( CLEAR ?auto_1915855 ) ( IS-CRATE ?auto_1915856 ) ( AVAILABLE ?auto_1915861 ) ( IN ?auto_1915856 ?auto_1915859 ) ( ON ?auto_1915855 ?auto_1915854 ) ( not ( = ?auto_1915854 ?auto_1915855 ) ) ( not ( = ?auto_1915854 ?auto_1915856 ) ) ( not ( = ?auto_1915854 ?auto_1915853 ) ) ( not ( = ?auto_1915854 ?auto_1915862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1915855 ?auto_1915856 ?auto_1915853 )
      ( MAKE-3CRATE-VERIFY ?auto_1915854 ?auto_1915855 ?auto_1915856 ?auto_1915853 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916145 - SURFACE
      ?auto_1916146 - SURFACE
      ?auto_1916147 - SURFACE
      ?auto_1916144 - SURFACE
      ?auto_1916148 - SURFACE
    )
    :vars
    (
      ?auto_1916150 - HOIST
      ?auto_1916149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916150 ?auto_1916149 ) ( SURFACE-AT ?auto_1916144 ?auto_1916149 ) ( CLEAR ?auto_1916144 ) ( LIFTING ?auto_1916150 ?auto_1916148 ) ( IS-CRATE ?auto_1916148 ) ( not ( = ?auto_1916144 ?auto_1916148 ) ) ( ON ?auto_1916146 ?auto_1916145 ) ( ON ?auto_1916147 ?auto_1916146 ) ( ON ?auto_1916144 ?auto_1916147 ) ( not ( = ?auto_1916145 ?auto_1916146 ) ) ( not ( = ?auto_1916145 ?auto_1916147 ) ) ( not ( = ?auto_1916145 ?auto_1916144 ) ) ( not ( = ?auto_1916145 ?auto_1916148 ) ) ( not ( = ?auto_1916146 ?auto_1916147 ) ) ( not ( = ?auto_1916146 ?auto_1916144 ) ) ( not ( = ?auto_1916146 ?auto_1916148 ) ) ( not ( = ?auto_1916147 ?auto_1916144 ) ) ( not ( = ?auto_1916147 ?auto_1916148 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1916144 ?auto_1916148 )
      ( MAKE-4CRATE-VERIFY ?auto_1916145 ?auto_1916146 ?auto_1916147 ?auto_1916144 ?auto_1916148 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916170 - SURFACE
      ?auto_1916171 - SURFACE
      ?auto_1916172 - SURFACE
      ?auto_1916169 - SURFACE
      ?auto_1916173 - SURFACE
    )
    :vars
    (
      ?auto_1916176 - HOIST
      ?auto_1916175 - PLACE
      ?auto_1916174 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916176 ?auto_1916175 ) ( SURFACE-AT ?auto_1916169 ?auto_1916175 ) ( CLEAR ?auto_1916169 ) ( IS-CRATE ?auto_1916173 ) ( not ( = ?auto_1916169 ?auto_1916173 ) ) ( TRUCK-AT ?auto_1916174 ?auto_1916175 ) ( AVAILABLE ?auto_1916176 ) ( IN ?auto_1916173 ?auto_1916174 ) ( ON ?auto_1916169 ?auto_1916172 ) ( not ( = ?auto_1916172 ?auto_1916169 ) ) ( not ( = ?auto_1916172 ?auto_1916173 ) ) ( ON ?auto_1916171 ?auto_1916170 ) ( ON ?auto_1916172 ?auto_1916171 ) ( not ( = ?auto_1916170 ?auto_1916171 ) ) ( not ( = ?auto_1916170 ?auto_1916172 ) ) ( not ( = ?auto_1916170 ?auto_1916169 ) ) ( not ( = ?auto_1916170 ?auto_1916173 ) ) ( not ( = ?auto_1916171 ?auto_1916172 ) ) ( not ( = ?auto_1916171 ?auto_1916169 ) ) ( not ( = ?auto_1916171 ?auto_1916173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916172 ?auto_1916169 ?auto_1916173 )
      ( MAKE-4CRATE-VERIFY ?auto_1916170 ?auto_1916171 ?auto_1916172 ?auto_1916169 ?auto_1916173 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916200 - SURFACE
      ?auto_1916201 - SURFACE
      ?auto_1916202 - SURFACE
      ?auto_1916199 - SURFACE
      ?auto_1916203 - SURFACE
    )
    :vars
    (
      ?auto_1916204 - HOIST
      ?auto_1916207 - PLACE
      ?auto_1916206 - TRUCK
      ?auto_1916205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916204 ?auto_1916207 ) ( SURFACE-AT ?auto_1916199 ?auto_1916207 ) ( CLEAR ?auto_1916199 ) ( IS-CRATE ?auto_1916203 ) ( not ( = ?auto_1916199 ?auto_1916203 ) ) ( AVAILABLE ?auto_1916204 ) ( IN ?auto_1916203 ?auto_1916206 ) ( ON ?auto_1916199 ?auto_1916202 ) ( not ( = ?auto_1916202 ?auto_1916199 ) ) ( not ( = ?auto_1916202 ?auto_1916203 ) ) ( TRUCK-AT ?auto_1916206 ?auto_1916205 ) ( not ( = ?auto_1916205 ?auto_1916207 ) ) ( ON ?auto_1916201 ?auto_1916200 ) ( ON ?auto_1916202 ?auto_1916201 ) ( not ( = ?auto_1916200 ?auto_1916201 ) ) ( not ( = ?auto_1916200 ?auto_1916202 ) ) ( not ( = ?auto_1916200 ?auto_1916199 ) ) ( not ( = ?auto_1916200 ?auto_1916203 ) ) ( not ( = ?auto_1916201 ?auto_1916202 ) ) ( not ( = ?auto_1916201 ?auto_1916199 ) ) ( not ( = ?auto_1916201 ?auto_1916203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916202 ?auto_1916199 ?auto_1916203 )
      ( MAKE-4CRATE-VERIFY ?auto_1916200 ?auto_1916201 ?auto_1916202 ?auto_1916199 ?auto_1916203 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916234 - SURFACE
      ?auto_1916235 - SURFACE
      ?auto_1916236 - SURFACE
      ?auto_1916233 - SURFACE
      ?auto_1916237 - SURFACE
    )
    :vars
    (
      ?auto_1916239 - HOIST
      ?auto_1916240 - PLACE
      ?auto_1916238 - TRUCK
      ?auto_1916241 - PLACE
      ?auto_1916242 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916239 ?auto_1916240 ) ( SURFACE-AT ?auto_1916233 ?auto_1916240 ) ( CLEAR ?auto_1916233 ) ( IS-CRATE ?auto_1916237 ) ( not ( = ?auto_1916233 ?auto_1916237 ) ) ( AVAILABLE ?auto_1916239 ) ( ON ?auto_1916233 ?auto_1916236 ) ( not ( = ?auto_1916236 ?auto_1916233 ) ) ( not ( = ?auto_1916236 ?auto_1916237 ) ) ( TRUCK-AT ?auto_1916238 ?auto_1916241 ) ( not ( = ?auto_1916241 ?auto_1916240 ) ) ( HOIST-AT ?auto_1916242 ?auto_1916241 ) ( LIFTING ?auto_1916242 ?auto_1916237 ) ( not ( = ?auto_1916239 ?auto_1916242 ) ) ( ON ?auto_1916235 ?auto_1916234 ) ( ON ?auto_1916236 ?auto_1916235 ) ( not ( = ?auto_1916234 ?auto_1916235 ) ) ( not ( = ?auto_1916234 ?auto_1916236 ) ) ( not ( = ?auto_1916234 ?auto_1916233 ) ) ( not ( = ?auto_1916234 ?auto_1916237 ) ) ( not ( = ?auto_1916235 ?auto_1916236 ) ) ( not ( = ?auto_1916235 ?auto_1916233 ) ) ( not ( = ?auto_1916235 ?auto_1916237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916236 ?auto_1916233 ?auto_1916237 )
      ( MAKE-4CRATE-VERIFY ?auto_1916234 ?auto_1916235 ?auto_1916236 ?auto_1916233 ?auto_1916237 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916272 - SURFACE
      ?auto_1916273 - SURFACE
      ?auto_1916274 - SURFACE
      ?auto_1916271 - SURFACE
      ?auto_1916275 - SURFACE
    )
    :vars
    (
      ?auto_1916281 - HOIST
      ?auto_1916278 - PLACE
      ?auto_1916276 - TRUCK
      ?auto_1916280 - PLACE
      ?auto_1916277 - HOIST
      ?auto_1916279 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916281 ?auto_1916278 ) ( SURFACE-AT ?auto_1916271 ?auto_1916278 ) ( CLEAR ?auto_1916271 ) ( IS-CRATE ?auto_1916275 ) ( not ( = ?auto_1916271 ?auto_1916275 ) ) ( AVAILABLE ?auto_1916281 ) ( ON ?auto_1916271 ?auto_1916274 ) ( not ( = ?auto_1916274 ?auto_1916271 ) ) ( not ( = ?auto_1916274 ?auto_1916275 ) ) ( TRUCK-AT ?auto_1916276 ?auto_1916280 ) ( not ( = ?auto_1916280 ?auto_1916278 ) ) ( HOIST-AT ?auto_1916277 ?auto_1916280 ) ( not ( = ?auto_1916281 ?auto_1916277 ) ) ( AVAILABLE ?auto_1916277 ) ( SURFACE-AT ?auto_1916275 ?auto_1916280 ) ( ON ?auto_1916275 ?auto_1916279 ) ( CLEAR ?auto_1916275 ) ( not ( = ?auto_1916271 ?auto_1916279 ) ) ( not ( = ?auto_1916275 ?auto_1916279 ) ) ( not ( = ?auto_1916274 ?auto_1916279 ) ) ( ON ?auto_1916273 ?auto_1916272 ) ( ON ?auto_1916274 ?auto_1916273 ) ( not ( = ?auto_1916272 ?auto_1916273 ) ) ( not ( = ?auto_1916272 ?auto_1916274 ) ) ( not ( = ?auto_1916272 ?auto_1916271 ) ) ( not ( = ?auto_1916272 ?auto_1916275 ) ) ( not ( = ?auto_1916272 ?auto_1916279 ) ) ( not ( = ?auto_1916273 ?auto_1916274 ) ) ( not ( = ?auto_1916273 ?auto_1916271 ) ) ( not ( = ?auto_1916273 ?auto_1916275 ) ) ( not ( = ?auto_1916273 ?auto_1916279 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916274 ?auto_1916271 ?auto_1916275 )
      ( MAKE-4CRATE-VERIFY ?auto_1916272 ?auto_1916273 ?auto_1916274 ?auto_1916271 ?auto_1916275 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916311 - SURFACE
      ?auto_1916312 - SURFACE
      ?auto_1916313 - SURFACE
      ?auto_1916310 - SURFACE
      ?auto_1916314 - SURFACE
    )
    :vars
    (
      ?auto_1916318 - HOIST
      ?auto_1916317 - PLACE
      ?auto_1916315 - PLACE
      ?auto_1916316 - HOIST
      ?auto_1916320 - SURFACE
      ?auto_1916319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916318 ?auto_1916317 ) ( SURFACE-AT ?auto_1916310 ?auto_1916317 ) ( CLEAR ?auto_1916310 ) ( IS-CRATE ?auto_1916314 ) ( not ( = ?auto_1916310 ?auto_1916314 ) ) ( AVAILABLE ?auto_1916318 ) ( ON ?auto_1916310 ?auto_1916313 ) ( not ( = ?auto_1916313 ?auto_1916310 ) ) ( not ( = ?auto_1916313 ?auto_1916314 ) ) ( not ( = ?auto_1916315 ?auto_1916317 ) ) ( HOIST-AT ?auto_1916316 ?auto_1916315 ) ( not ( = ?auto_1916318 ?auto_1916316 ) ) ( AVAILABLE ?auto_1916316 ) ( SURFACE-AT ?auto_1916314 ?auto_1916315 ) ( ON ?auto_1916314 ?auto_1916320 ) ( CLEAR ?auto_1916314 ) ( not ( = ?auto_1916310 ?auto_1916320 ) ) ( not ( = ?auto_1916314 ?auto_1916320 ) ) ( not ( = ?auto_1916313 ?auto_1916320 ) ) ( TRUCK-AT ?auto_1916319 ?auto_1916317 ) ( ON ?auto_1916312 ?auto_1916311 ) ( ON ?auto_1916313 ?auto_1916312 ) ( not ( = ?auto_1916311 ?auto_1916312 ) ) ( not ( = ?auto_1916311 ?auto_1916313 ) ) ( not ( = ?auto_1916311 ?auto_1916310 ) ) ( not ( = ?auto_1916311 ?auto_1916314 ) ) ( not ( = ?auto_1916311 ?auto_1916320 ) ) ( not ( = ?auto_1916312 ?auto_1916313 ) ) ( not ( = ?auto_1916312 ?auto_1916310 ) ) ( not ( = ?auto_1916312 ?auto_1916314 ) ) ( not ( = ?auto_1916312 ?auto_1916320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916313 ?auto_1916310 ?auto_1916314 )
      ( MAKE-4CRATE-VERIFY ?auto_1916311 ?auto_1916312 ?auto_1916313 ?auto_1916310 ?auto_1916314 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916350 - SURFACE
      ?auto_1916351 - SURFACE
      ?auto_1916352 - SURFACE
      ?auto_1916349 - SURFACE
      ?auto_1916353 - SURFACE
    )
    :vars
    (
      ?auto_1916358 - HOIST
      ?auto_1916354 - PLACE
      ?auto_1916357 - PLACE
      ?auto_1916359 - HOIST
      ?auto_1916355 - SURFACE
      ?auto_1916356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916358 ?auto_1916354 ) ( IS-CRATE ?auto_1916353 ) ( not ( = ?auto_1916349 ?auto_1916353 ) ) ( not ( = ?auto_1916352 ?auto_1916349 ) ) ( not ( = ?auto_1916352 ?auto_1916353 ) ) ( not ( = ?auto_1916357 ?auto_1916354 ) ) ( HOIST-AT ?auto_1916359 ?auto_1916357 ) ( not ( = ?auto_1916358 ?auto_1916359 ) ) ( AVAILABLE ?auto_1916359 ) ( SURFACE-AT ?auto_1916353 ?auto_1916357 ) ( ON ?auto_1916353 ?auto_1916355 ) ( CLEAR ?auto_1916353 ) ( not ( = ?auto_1916349 ?auto_1916355 ) ) ( not ( = ?auto_1916353 ?auto_1916355 ) ) ( not ( = ?auto_1916352 ?auto_1916355 ) ) ( TRUCK-AT ?auto_1916356 ?auto_1916354 ) ( SURFACE-AT ?auto_1916352 ?auto_1916354 ) ( CLEAR ?auto_1916352 ) ( LIFTING ?auto_1916358 ?auto_1916349 ) ( IS-CRATE ?auto_1916349 ) ( ON ?auto_1916351 ?auto_1916350 ) ( ON ?auto_1916352 ?auto_1916351 ) ( not ( = ?auto_1916350 ?auto_1916351 ) ) ( not ( = ?auto_1916350 ?auto_1916352 ) ) ( not ( = ?auto_1916350 ?auto_1916349 ) ) ( not ( = ?auto_1916350 ?auto_1916353 ) ) ( not ( = ?auto_1916350 ?auto_1916355 ) ) ( not ( = ?auto_1916351 ?auto_1916352 ) ) ( not ( = ?auto_1916351 ?auto_1916349 ) ) ( not ( = ?auto_1916351 ?auto_1916353 ) ) ( not ( = ?auto_1916351 ?auto_1916355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916352 ?auto_1916349 ?auto_1916353 )
      ( MAKE-4CRATE-VERIFY ?auto_1916350 ?auto_1916351 ?auto_1916352 ?auto_1916349 ?auto_1916353 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1916389 - SURFACE
      ?auto_1916390 - SURFACE
      ?auto_1916391 - SURFACE
      ?auto_1916388 - SURFACE
      ?auto_1916392 - SURFACE
    )
    :vars
    (
      ?auto_1916394 - HOIST
      ?auto_1916393 - PLACE
      ?auto_1916395 - PLACE
      ?auto_1916396 - HOIST
      ?auto_1916397 - SURFACE
      ?auto_1916398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1916394 ?auto_1916393 ) ( IS-CRATE ?auto_1916392 ) ( not ( = ?auto_1916388 ?auto_1916392 ) ) ( not ( = ?auto_1916391 ?auto_1916388 ) ) ( not ( = ?auto_1916391 ?auto_1916392 ) ) ( not ( = ?auto_1916395 ?auto_1916393 ) ) ( HOIST-AT ?auto_1916396 ?auto_1916395 ) ( not ( = ?auto_1916394 ?auto_1916396 ) ) ( AVAILABLE ?auto_1916396 ) ( SURFACE-AT ?auto_1916392 ?auto_1916395 ) ( ON ?auto_1916392 ?auto_1916397 ) ( CLEAR ?auto_1916392 ) ( not ( = ?auto_1916388 ?auto_1916397 ) ) ( not ( = ?auto_1916392 ?auto_1916397 ) ) ( not ( = ?auto_1916391 ?auto_1916397 ) ) ( TRUCK-AT ?auto_1916398 ?auto_1916393 ) ( SURFACE-AT ?auto_1916391 ?auto_1916393 ) ( CLEAR ?auto_1916391 ) ( IS-CRATE ?auto_1916388 ) ( AVAILABLE ?auto_1916394 ) ( IN ?auto_1916388 ?auto_1916398 ) ( ON ?auto_1916390 ?auto_1916389 ) ( ON ?auto_1916391 ?auto_1916390 ) ( not ( = ?auto_1916389 ?auto_1916390 ) ) ( not ( = ?auto_1916389 ?auto_1916391 ) ) ( not ( = ?auto_1916389 ?auto_1916388 ) ) ( not ( = ?auto_1916389 ?auto_1916392 ) ) ( not ( = ?auto_1916389 ?auto_1916397 ) ) ( not ( = ?auto_1916390 ?auto_1916391 ) ) ( not ( = ?auto_1916390 ?auto_1916388 ) ) ( not ( = ?auto_1916390 ?auto_1916392 ) ) ( not ( = ?auto_1916390 ?auto_1916397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1916391 ?auto_1916388 ?auto_1916392 )
      ( MAKE-4CRATE-VERIFY ?auto_1916389 ?auto_1916390 ?auto_1916391 ?auto_1916388 ?auto_1916392 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917049 - SURFACE
      ?auto_1917050 - SURFACE
      ?auto_1917051 - SURFACE
      ?auto_1917048 - SURFACE
      ?auto_1917052 - SURFACE
      ?auto_1917053 - SURFACE
    )
    :vars
    (
      ?auto_1917055 - HOIST
      ?auto_1917054 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917055 ?auto_1917054 ) ( SURFACE-AT ?auto_1917052 ?auto_1917054 ) ( CLEAR ?auto_1917052 ) ( LIFTING ?auto_1917055 ?auto_1917053 ) ( IS-CRATE ?auto_1917053 ) ( not ( = ?auto_1917052 ?auto_1917053 ) ) ( ON ?auto_1917050 ?auto_1917049 ) ( ON ?auto_1917051 ?auto_1917050 ) ( ON ?auto_1917048 ?auto_1917051 ) ( ON ?auto_1917052 ?auto_1917048 ) ( not ( = ?auto_1917049 ?auto_1917050 ) ) ( not ( = ?auto_1917049 ?auto_1917051 ) ) ( not ( = ?auto_1917049 ?auto_1917048 ) ) ( not ( = ?auto_1917049 ?auto_1917052 ) ) ( not ( = ?auto_1917049 ?auto_1917053 ) ) ( not ( = ?auto_1917050 ?auto_1917051 ) ) ( not ( = ?auto_1917050 ?auto_1917048 ) ) ( not ( = ?auto_1917050 ?auto_1917052 ) ) ( not ( = ?auto_1917050 ?auto_1917053 ) ) ( not ( = ?auto_1917051 ?auto_1917048 ) ) ( not ( = ?auto_1917051 ?auto_1917052 ) ) ( not ( = ?auto_1917051 ?auto_1917053 ) ) ( not ( = ?auto_1917048 ?auto_1917052 ) ) ( not ( = ?auto_1917048 ?auto_1917053 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1917052 ?auto_1917053 )
      ( MAKE-5CRATE-VERIFY ?auto_1917049 ?auto_1917050 ?auto_1917051 ?auto_1917048 ?auto_1917052 ?auto_1917053 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917083 - SURFACE
      ?auto_1917084 - SURFACE
      ?auto_1917085 - SURFACE
      ?auto_1917082 - SURFACE
      ?auto_1917086 - SURFACE
      ?auto_1917087 - SURFACE
    )
    :vars
    (
      ?auto_1917090 - HOIST
      ?auto_1917088 - PLACE
      ?auto_1917089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917090 ?auto_1917088 ) ( SURFACE-AT ?auto_1917086 ?auto_1917088 ) ( CLEAR ?auto_1917086 ) ( IS-CRATE ?auto_1917087 ) ( not ( = ?auto_1917086 ?auto_1917087 ) ) ( TRUCK-AT ?auto_1917089 ?auto_1917088 ) ( AVAILABLE ?auto_1917090 ) ( IN ?auto_1917087 ?auto_1917089 ) ( ON ?auto_1917086 ?auto_1917082 ) ( not ( = ?auto_1917082 ?auto_1917086 ) ) ( not ( = ?auto_1917082 ?auto_1917087 ) ) ( ON ?auto_1917084 ?auto_1917083 ) ( ON ?auto_1917085 ?auto_1917084 ) ( ON ?auto_1917082 ?auto_1917085 ) ( not ( = ?auto_1917083 ?auto_1917084 ) ) ( not ( = ?auto_1917083 ?auto_1917085 ) ) ( not ( = ?auto_1917083 ?auto_1917082 ) ) ( not ( = ?auto_1917083 ?auto_1917086 ) ) ( not ( = ?auto_1917083 ?auto_1917087 ) ) ( not ( = ?auto_1917084 ?auto_1917085 ) ) ( not ( = ?auto_1917084 ?auto_1917082 ) ) ( not ( = ?auto_1917084 ?auto_1917086 ) ) ( not ( = ?auto_1917084 ?auto_1917087 ) ) ( not ( = ?auto_1917085 ?auto_1917082 ) ) ( not ( = ?auto_1917085 ?auto_1917086 ) ) ( not ( = ?auto_1917085 ?auto_1917087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917082 ?auto_1917086 ?auto_1917087 )
      ( MAKE-5CRATE-VERIFY ?auto_1917083 ?auto_1917084 ?auto_1917085 ?auto_1917082 ?auto_1917086 ?auto_1917087 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917123 - SURFACE
      ?auto_1917124 - SURFACE
      ?auto_1917125 - SURFACE
      ?auto_1917122 - SURFACE
      ?auto_1917126 - SURFACE
      ?auto_1917127 - SURFACE
    )
    :vars
    (
      ?auto_1917131 - HOIST
      ?auto_1917130 - PLACE
      ?auto_1917128 - TRUCK
      ?auto_1917129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917131 ?auto_1917130 ) ( SURFACE-AT ?auto_1917126 ?auto_1917130 ) ( CLEAR ?auto_1917126 ) ( IS-CRATE ?auto_1917127 ) ( not ( = ?auto_1917126 ?auto_1917127 ) ) ( AVAILABLE ?auto_1917131 ) ( IN ?auto_1917127 ?auto_1917128 ) ( ON ?auto_1917126 ?auto_1917122 ) ( not ( = ?auto_1917122 ?auto_1917126 ) ) ( not ( = ?auto_1917122 ?auto_1917127 ) ) ( TRUCK-AT ?auto_1917128 ?auto_1917129 ) ( not ( = ?auto_1917129 ?auto_1917130 ) ) ( ON ?auto_1917124 ?auto_1917123 ) ( ON ?auto_1917125 ?auto_1917124 ) ( ON ?auto_1917122 ?auto_1917125 ) ( not ( = ?auto_1917123 ?auto_1917124 ) ) ( not ( = ?auto_1917123 ?auto_1917125 ) ) ( not ( = ?auto_1917123 ?auto_1917122 ) ) ( not ( = ?auto_1917123 ?auto_1917126 ) ) ( not ( = ?auto_1917123 ?auto_1917127 ) ) ( not ( = ?auto_1917124 ?auto_1917125 ) ) ( not ( = ?auto_1917124 ?auto_1917122 ) ) ( not ( = ?auto_1917124 ?auto_1917126 ) ) ( not ( = ?auto_1917124 ?auto_1917127 ) ) ( not ( = ?auto_1917125 ?auto_1917122 ) ) ( not ( = ?auto_1917125 ?auto_1917126 ) ) ( not ( = ?auto_1917125 ?auto_1917127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917122 ?auto_1917126 ?auto_1917127 )
      ( MAKE-5CRATE-VERIFY ?auto_1917123 ?auto_1917124 ?auto_1917125 ?auto_1917122 ?auto_1917126 ?auto_1917127 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917168 - SURFACE
      ?auto_1917169 - SURFACE
      ?auto_1917170 - SURFACE
      ?auto_1917167 - SURFACE
      ?auto_1917171 - SURFACE
      ?auto_1917172 - SURFACE
    )
    :vars
    (
      ?auto_1917175 - HOIST
      ?auto_1917174 - PLACE
      ?auto_1917176 - TRUCK
      ?auto_1917173 - PLACE
      ?auto_1917177 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917175 ?auto_1917174 ) ( SURFACE-AT ?auto_1917171 ?auto_1917174 ) ( CLEAR ?auto_1917171 ) ( IS-CRATE ?auto_1917172 ) ( not ( = ?auto_1917171 ?auto_1917172 ) ) ( AVAILABLE ?auto_1917175 ) ( ON ?auto_1917171 ?auto_1917167 ) ( not ( = ?auto_1917167 ?auto_1917171 ) ) ( not ( = ?auto_1917167 ?auto_1917172 ) ) ( TRUCK-AT ?auto_1917176 ?auto_1917173 ) ( not ( = ?auto_1917173 ?auto_1917174 ) ) ( HOIST-AT ?auto_1917177 ?auto_1917173 ) ( LIFTING ?auto_1917177 ?auto_1917172 ) ( not ( = ?auto_1917175 ?auto_1917177 ) ) ( ON ?auto_1917169 ?auto_1917168 ) ( ON ?auto_1917170 ?auto_1917169 ) ( ON ?auto_1917167 ?auto_1917170 ) ( not ( = ?auto_1917168 ?auto_1917169 ) ) ( not ( = ?auto_1917168 ?auto_1917170 ) ) ( not ( = ?auto_1917168 ?auto_1917167 ) ) ( not ( = ?auto_1917168 ?auto_1917171 ) ) ( not ( = ?auto_1917168 ?auto_1917172 ) ) ( not ( = ?auto_1917169 ?auto_1917170 ) ) ( not ( = ?auto_1917169 ?auto_1917167 ) ) ( not ( = ?auto_1917169 ?auto_1917171 ) ) ( not ( = ?auto_1917169 ?auto_1917172 ) ) ( not ( = ?auto_1917170 ?auto_1917167 ) ) ( not ( = ?auto_1917170 ?auto_1917171 ) ) ( not ( = ?auto_1917170 ?auto_1917172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917167 ?auto_1917171 ?auto_1917172 )
      ( MAKE-5CRATE-VERIFY ?auto_1917168 ?auto_1917169 ?auto_1917170 ?auto_1917167 ?auto_1917171 ?auto_1917172 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917218 - SURFACE
      ?auto_1917219 - SURFACE
      ?auto_1917220 - SURFACE
      ?auto_1917217 - SURFACE
      ?auto_1917221 - SURFACE
      ?auto_1917222 - SURFACE
    )
    :vars
    (
      ?auto_1917227 - HOIST
      ?auto_1917226 - PLACE
      ?auto_1917228 - TRUCK
      ?auto_1917223 - PLACE
      ?auto_1917225 - HOIST
      ?auto_1917224 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917227 ?auto_1917226 ) ( SURFACE-AT ?auto_1917221 ?auto_1917226 ) ( CLEAR ?auto_1917221 ) ( IS-CRATE ?auto_1917222 ) ( not ( = ?auto_1917221 ?auto_1917222 ) ) ( AVAILABLE ?auto_1917227 ) ( ON ?auto_1917221 ?auto_1917217 ) ( not ( = ?auto_1917217 ?auto_1917221 ) ) ( not ( = ?auto_1917217 ?auto_1917222 ) ) ( TRUCK-AT ?auto_1917228 ?auto_1917223 ) ( not ( = ?auto_1917223 ?auto_1917226 ) ) ( HOIST-AT ?auto_1917225 ?auto_1917223 ) ( not ( = ?auto_1917227 ?auto_1917225 ) ) ( AVAILABLE ?auto_1917225 ) ( SURFACE-AT ?auto_1917222 ?auto_1917223 ) ( ON ?auto_1917222 ?auto_1917224 ) ( CLEAR ?auto_1917222 ) ( not ( = ?auto_1917221 ?auto_1917224 ) ) ( not ( = ?auto_1917222 ?auto_1917224 ) ) ( not ( = ?auto_1917217 ?auto_1917224 ) ) ( ON ?auto_1917219 ?auto_1917218 ) ( ON ?auto_1917220 ?auto_1917219 ) ( ON ?auto_1917217 ?auto_1917220 ) ( not ( = ?auto_1917218 ?auto_1917219 ) ) ( not ( = ?auto_1917218 ?auto_1917220 ) ) ( not ( = ?auto_1917218 ?auto_1917217 ) ) ( not ( = ?auto_1917218 ?auto_1917221 ) ) ( not ( = ?auto_1917218 ?auto_1917222 ) ) ( not ( = ?auto_1917218 ?auto_1917224 ) ) ( not ( = ?auto_1917219 ?auto_1917220 ) ) ( not ( = ?auto_1917219 ?auto_1917217 ) ) ( not ( = ?auto_1917219 ?auto_1917221 ) ) ( not ( = ?auto_1917219 ?auto_1917222 ) ) ( not ( = ?auto_1917219 ?auto_1917224 ) ) ( not ( = ?auto_1917220 ?auto_1917217 ) ) ( not ( = ?auto_1917220 ?auto_1917221 ) ) ( not ( = ?auto_1917220 ?auto_1917222 ) ) ( not ( = ?auto_1917220 ?auto_1917224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917217 ?auto_1917221 ?auto_1917222 )
      ( MAKE-5CRATE-VERIFY ?auto_1917218 ?auto_1917219 ?auto_1917220 ?auto_1917217 ?auto_1917221 ?auto_1917222 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917269 - SURFACE
      ?auto_1917270 - SURFACE
      ?auto_1917271 - SURFACE
      ?auto_1917268 - SURFACE
      ?auto_1917272 - SURFACE
      ?auto_1917273 - SURFACE
    )
    :vars
    (
      ?auto_1917275 - HOIST
      ?auto_1917278 - PLACE
      ?auto_1917277 - PLACE
      ?auto_1917274 - HOIST
      ?auto_1917276 - SURFACE
      ?auto_1917279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917275 ?auto_1917278 ) ( SURFACE-AT ?auto_1917272 ?auto_1917278 ) ( CLEAR ?auto_1917272 ) ( IS-CRATE ?auto_1917273 ) ( not ( = ?auto_1917272 ?auto_1917273 ) ) ( AVAILABLE ?auto_1917275 ) ( ON ?auto_1917272 ?auto_1917268 ) ( not ( = ?auto_1917268 ?auto_1917272 ) ) ( not ( = ?auto_1917268 ?auto_1917273 ) ) ( not ( = ?auto_1917277 ?auto_1917278 ) ) ( HOIST-AT ?auto_1917274 ?auto_1917277 ) ( not ( = ?auto_1917275 ?auto_1917274 ) ) ( AVAILABLE ?auto_1917274 ) ( SURFACE-AT ?auto_1917273 ?auto_1917277 ) ( ON ?auto_1917273 ?auto_1917276 ) ( CLEAR ?auto_1917273 ) ( not ( = ?auto_1917272 ?auto_1917276 ) ) ( not ( = ?auto_1917273 ?auto_1917276 ) ) ( not ( = ?auto_1917268 ?auto_1917276 ) ) ( TRUCK-AT ?auto_1917279 ?auto_1917278 ) ( ON ?auto_1917270 ?auto_1917269 ) ( ON ?auto_1917271 ?auto_1917270 ) ( ON ?auto_1917268 ?auto_1917271 ) ( not ( = ?auto_1917269 ?auto_1917270 ) ) ( not ( = ?auto_1917269 ?auto_1917271 ) ) ( not ( = ?auto_1917269 ?auto_1917268 ) ) ( not ( = ?auto_1917269 ?auto_1917272 ) ) ( not ( = ?auto_1917269 ?auto_1917273 ) ) ( not ( = ?auto_1917269 ?auto_1917276 ) ) ( not ( = ?auto_1917270 ?auto_1917271 ) ) ( not ( = ?auto_1917270 ?auto_1917268 ) ) ( not ( = ?auto_1917270 ?auto_1917272 ) ) ( not ( = ?auto_1917270 ?auto_1917273 ) ) ( not ( = ?auto_1917270 ?auto_1917276 ) ) ( not ( = ?auto_1917271 ?auto_1917268 ) ) ( not ( = ?auto_1917271 ?auto_1917272 ) ) ( not ( = ?auto_1917271 ?auto_1917273 ) ) ( not ( = ?auto_1917271 ?auto_1917276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917268 ?auto_1917272 ?auto_1917273 )
      ( MAKE-5CRATE-VERIFY ?auto_1917269 ?auto_1917270 ?auto_1917271 ?auto_1917268 ?auto_1917272 ?auto_1917273 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917320 - SURFACE
      ?auto_1917321 - SURFACE
      ?auto_1917322 - SURFACE
      ?auto_1917319 - SURFACE
      ?auto_1917323 - SURFACE
      ?auto_1917324 - SURFACE
    )
    :vars
    (
      ?auto_1917329 - HOIST
      ?auto_1917325 - PLACE
      ?auto_1917327 - PLACE
      ?auto_1917328 - HOIST
      ?auto_1917326 - SURFACE
      ?auto_1917330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917329 ?auto_1917325 ) ( IS-CRATE ?auto_1917324 ) ( not ( = ?auto_1917323 ?auto_1917324 ) ) ( not ( = ?auto_1917319 ?auto_1917323 ) ) ( not ( = ?auto_1917319 ?auto_1917324 ) ) ( not ( = ?auto_1917327 ?auto_1917325 ) ) ( HOIST-AT ?auto_1917328 ?auto_1917327 ) ( not ( = ?auto_1917329 ?auto_1917328 ) ) ( AVAILABLE ?auto_1917328 ) ( SURFACE-AT ?auto_1917324 ?auto_1917327 ) ( ON ?auto_1917324 ?auto_1917326 ) ( CLEAR ?auto_1917324 ) ( not ( = ?auto_1917323 ?auto_1917326 ) ) ( not ( = ?auto_1917324 ?auto_1917326 ) ) ( not ( = ?auto_1917319 ?auto_1917326 ) ) ( TRUCK-AT ?auto_1917330 ?auto_1917325 ) ( SURFACE-AT ?auto_1917319 ?auto_1917325 ) ( CLEAR ?auto_1917319 ) ( LIFTING ?auto_1917329 ?auto_1917323 ) ( IS-CRATE ?auto_1917323 ) ( ON ?auto_1917321 ?auto_1917320 ) ( ON ?auto_1917322 ?auto_1917321 ) ( ON ?auto_1917319 ?auto_1917322 ) ( not ( = ?auto_1917320 ?auto_1917321 ) ) ( not ( = ?auto_1917320 ?auto_1917322 ) ) ( not ( = ?auto_1917320 ?auto_1917319 ) ) ( not ( = ?auto_1917320 ?auto_1917323 ) ) ( not ( = ?auto_1917320 ?auto_1917324 ) ) ( not ( = ?auto_1917320 ?auto_1917326 ) ) ( not ( = ?auto_1917321 ?auto_1917322 ) ) ( not ( = ?auto_1917321 ?auto_1917319 ) ) ( not ( = ?auto_1917321 ?auto_1917323 ) ) ( not ( = ?auto_1917321 ?auto_1917324 ) ) ( not ( = ?auto_1917321 ?auto_1917326 ) ) ( not ( = ?auto_1917322 ?auto_1917319 ) ) ( not ( = ?auto_1917322 ?auto_1917323 ) ) ( not ( = ?auto_1917322 ?auto_1917324 ) ) ( not ( = ?auto_1917322 ?auto_1917326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917319 ?auto_1917323 ?auto_1917324 )
      ( MAKE-5CRATE-VERIFY ?auto_1917320 ?auto_1917321 ?auto_1917322 ?auto_1917319 ?auto_1917323 ?auto_1917324 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1917371 - SURFACE
      ?auto_1917372 - SURFACE
      ?auto_1917373 - SURFACE
      ?auto_1917370 - SURFACE
      ?auto_1917374 - SURFACE
      ?auto_1917375 - SURFACE
    )
    :vars
    (
      ?auto_1917378 - HOIST
      ?auto_1917376 - PLACE
      ?auto_1917379 - PLACE
      ?auto_1917377 - HOIST
      ?auto_1917381 - SURFACE
      ?auto_1917380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917378 ?auto_1917376 ) ( IS-CRATE ?auto_1917375 ) ( not ( = ?auto_1917374 ?auto_1917375 ) ) ( not ( = ?auto_1917370 ?auto_1917374 ) ) ( not ( = ?auto_1917370 ?auto_1917375 ) ) ( not ( = ?auto_1917379 ?auto_1917376 ) ) ( HOIST-AT ?auto_1917377 ?auto_1917379 ) ( not ( = ?auto_1917378 ?auto_1917377 ) ) ( AVAILABLE ?auto_1917377 ) ( SURFACE-AT ?auto_1917375 ?auto_1917379 ) ( ON ?auto_1917375 ?auto_1917381 ) ( CLEAR ?auto_1917375 ) ( not ( = ?auto_1917374 ?auto_1917381 ) ) ( not ( = ?auto_1917375 ?auto_1917381 ) ) ( not ( = ?auto_1917370 ?auto_1917381 ) ) ( TRUCK-AT ?auto_1917380 ?auto_1917376 ) ( SURFACE-AT ?auto_1917370 ?auto_1917376 ) ( CLEAR ?auto_1917370 ) ( IS-CRATE ?auto_1917374 ) ( AVAILABLE ?auto_1917378 ) ( IN ?auto_1917374 ?auto_1917380 ) ( ON ?auto_1917372 ?auto_1917371 ) ( ON ?auto_1917373 ?auto_1917372 ) ( ON ?auto_1917370 ?auto_1917373 ) ( not ( = ?auto_1917371 ?auto_1917372 ) ) ( not ( = ?auto_1917371 ?auto_1917373 ) ) ( not ( = ?auto_1917371 ?auto_1917370 ) ) ( not ( = ?auto_1917371 ?auto_1917374 ) ) ( not ( = ?auto_1917371 ?auto_1917375 ) ) ( not ( = ?auto_1917371 ?auto_1917381 ) ) ( not ( = ?auto_1917372 ?auto_1917373 ) ) ( not ( = ?auto_1917372 ?auto_1917370 ) ) ( not ( = ?auto_1917372 ?auto_1917374 ) ) ( not ( = ?auto_1917372 ?auto_1917375 ) ) ( not ( = ?auto_1917372 ?auto_1917381 ) ) ( not ( = ?auto_1917373 ?auto_1917370 ) ) ( not ( = ?auto_1917373 ?auto_1917374 ) ) ( not ( = ?auto_1917373 ?auto_1917375 ) ) ( not ( = ?auto_1917373 ?auto_1917381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1917370 ?auto_1917374 ?auto_1917375 )
      ( MAKE-5CRATE-VERIFY ?auto_1917371 ?auto_1917372 ?auto_1917373 ?auto_1917370 ?auto_1917374 ?auto_1917375 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1918050 - SURFACE
      ?auto_1918051 - SURFACE
    )
    :vars
    (
      ?auto_1918055 - HOIST
      ?auto_1918056 - PLACE
      ?auto_1918054 - SURFACE
      ?auto_1918058 - TRUCK
      ?auto_1918053 - PLACE
      ?auto_1918052 - HOIST
      ?auto_1918057 - SURFACE
      ?auto_1918059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918055 ?auto_1918056 ) ( SURFACE-AT ?auto_1918050 ?auto_1918056 ) ( CLEAR ?auto_1918050 ) ( IS-CRATE ?auto_1918051 ) ( not ( = ?auto_1918050 ?auto_1918051 ) ) ( AVAILABLE ?auto_1918055 ) ( ON ?auto_1918050 ?auto_1918054 ) ( not ( = ?auto_1918054 ?auto_1918050 ) ) ( not ( = ?auto_1918054 ?auto_1918051 ) ) ( TRUCK-AT ?auto_1918058 ?auto_1918053 ) ( not ( = ?auto_1918053 ?auto_1918056 ) ) ( HOIST-AT ?auto_1918052 ?auto_1918053 ) ( not ( = ?auto_1918055 ?auto_1918052 ) ) ( SURFACE-AT ?auto_1918051 ?auto_1918053 ) ( ON ?auto_1918051 ?auto_1918057 ) ( CLEAR ?auto_1918051 ) ( not ( = ?auto_1918050 ?auto_1918057 ) ) ( not ( = ?auto_1918051 ?auto_1918057 ) ) ( not ( = ?auto_1918054 ?auto_1918057 ) ) ( LIFTING ?auto_1918052 ?auto_1918059 ) ( IS-CRATE ?auto_1918059 ) ( not ( = ?auto_1918050 ?auto_1918059 ) ) ( not ( = ?auto_1918051 ?auto_1918059 ) ) ( not ( = ?auto_1918054 ?auto_1918059 ) ) ( not ( = ?auto_1918057 ?auto_1918059 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1918052 ?auto_1918059 ?auto_1918058 ?auto_1918053 )
      ( MAKE-1CRATE ?auto_1918050 ?auto_1918051 )
      ( MAKE-1CRATE-VERIFY ?auto_1918050 ?auto_1918051 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918577 - SURFACE
      ?auto_1918578 - SURFACE
      ?auto_1918579 - SURFACE
      ?auto_1918576 - SURFACE
      ?auto_1918580 - SURFACE
      ?auto_1918582 - SURFACE
      ?auto_1918581 - SURFACE
    )
    :vars
    (
      ?auto_1918584 - HOIST
      ?auto_1918583 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918584 ?auto_1918583 ) ( SURFACE-AT ?auto_1918582 ?auto_1918583 ) ( CLEAR ?auto_1918582 ) ( LIFTING ?auto_1918584 ?auto_1918581 ) ( IS-CRATE ?auto_1918581 ) ( not ( = ?auto_1918582 ?auto_1918581 ) ) ( ON ?auto_1918578 ?auto_1918577 ) ( ON ?auto_1918579 ?auto_1918578 ) ( ON ?auto_1918576 ?auto_1918579 ) ( ON ?auto_1918580 ?auto_1918576 ) ( ON ?auto_1918582 ?auto_1918580 ) ( not ( = ?auto_1918577 ?auto_1918578 ) ) ( not ( = ?auto_1918577 ?auto_1918579 ) ) ( not ( = ?auto_1918577 ?auto_1918576 ) ) ( not ( = ?auto_1918577 ?auto_1918580 ) ) ( not ( = ?auto_1918577 ?auto_1918582 ) ) ( not ( = ?auto_1918577 ?auto_1918581 ) ) ( not ( = ?auto_1918578 ?auto_1918579 ) ) ( not ( = ?auto_1918578 ?auto_1918576 ) ) ( not ( = ?auto_1918578 ?auto_1918580 ) ) ( not ( = ?auto_1918578 ?auto_1918582 ) ) ( not ( = ?auto_1918578 ?auto_1918581 ) ) ( not ( = ?auto_1918579 ?auto_1918576 ) ) ( not ( = ?auto_1918579 ?auto_1918580 ) ) ( not ( = ?auto_1918579 ?auto_1918582 ) ) ( not ( = ?auto_1918579 ?auto_1918581 ) ) ( not ( = ?auto_1918576 ?auto_1918580 ) ) ( not ( = ?auto_1918576 ?auto_1918582 ) ) ( not ( = ?auto_1918576 ?auto_1918581 ) ) ( not ( = ?auto_1918580 ?auto_1918582 ) ) ( not ( = ?auto_1918580 ?auto_1918581 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1918582 ?auto_1918581 )
      ( MAKE-6CRATE-VERIFY ?auto_1918577 ?auto_1918578 ?auto_1918579 ?auto_1918576 ?auto_1918580 ?auto_1918582 ?auto_1918581 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918621 - SURFACE
      ?auto_1918622 - SURFACE
      ?auto_1918623 - SURFACE
      ?auto_1918620 - SURFACE
      ?auto_1918624 - SURFACE
      ?auto_1918626 - SURFACE
      ?auto_1918625 - SURFACE
    )
    :vars
    (
      ?auto_1918628 - HOIST
      ?auto_1918629 - PLACE
      ?auto_1918627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918628 ?auto_1918629 ) ( SURFACE-AT ?auto_1918626 ?auto_1918629 ) ( CLEAR ?auto_1918626 ) ( IS-CRATE ?auto_1918625 ) ( not ( = ?auto_1918626 ?auto_1918625 ) ) ( TRUCK-AT ?auto_1918627 ?auto_1918629 ) ( AVAILABLE ?auto_1918628 ) ( IN ?auto_1918625 ?auto_1918627 ) ( ON ?auto_1918626 ?auto_1918624 ) ( not ( = ?auto_1918624 ?auto_1918626 ) ) ( not ( = ?auto_1918624 ?auto_1918625 ) ) ( ON ?auto_1918622 ?auto_1918621 ) ( ON ?auto_1918623 ?auto_1918622 ) ( ON ?auto_1918620 ?auto_1918623 ) ( ON ?auto_1918624 ?auto_1918620 ) ( not ( = ?auto_1918621 ?auto_1918622 ) ) ( not ( = ?auto_1918621 ?auto_1918623 ) ) ( not ( = ?auto_1918621 ?auto_1918620 ) ) ( not ( = ?auto_1918621 ?auto_1918624 ) ) ( not ( = ?auto_1918621 ?auto_1918626 ) ) ( not ( = ?auto_1918621 ?auto_1918625 ) ) ( not ( = ?auto_1918622 ?auto_1918623 ) ) ( not ( = ?auto_1918622 ?auto_1918620 ) ) ( not ( = ?auto_1918622 ?auto_1918624 ) ) ( not ( = ?auto_1918622 ?auto_1918626 ) ) ( not ( = ?auto_1918622 ?auto_1918625 ) ) ( not ( = ?auto_1918623 ?auto_1918620 ) ) ( not ( = ?auto_1918623 ?auto_1918624 ) ) ( not ( = ?auto_1918623 ?auto_1918626 ) ) ( not ( = ?auto_1918623 ?auto_1918625 ) ) ( not ( = ?auto_1918620 ?auto_1918624 ) ) ( not ( = ?auto_1918620 ?auto_1918626 ) ) ( not ( = ?auto_1918620 ?auto_1918625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918624 ?auto_1918626 ?auto_1918625 )
      ( MAKE-6CRATE-VERIFY ?auto_1918621 ?auto_1918622 ?auto_1918623 ?auto_1918620 ?auto_1918624 ?auto_1918626 ?auto_1918625 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918672 - SURFACE
      ?auto_1918673 - SURFACE
      ?auto_1918674 - SURFACE
      ?auto_1918671 - SURFACE
      ?auto_1918675 - SURFACE
      ?auto_1918677 - SURFACE
      ?auto_1918676 - SURFACE
    )
    :vars
    (
      ?auto_1918678 - HOIST
      ?auto_1918681 - PLACE
      ?auto_1918680 - TRUCK
      ?auto_1918679 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918678 ?auto_1918681 ) ( SURFACE-AT ?auto_1918677 ?auto_1918681 ) ( CLEAR ?auto_1918677 ) ( IS-CRATE ?auto_1918676 ) ( not ( = ?auto_1918677 ?auto_1918676 ) ) ( AVAILABLE ?auto_1918678 ) ( IN ?auto_1918676 ?auto_1918680 ) ( ON ?auto_1918677 ?auto_1918675 ) ( not ( = ?auto_1918675 ?auto_1918677 ) ) ( not ( = ?auto_1918675 ?auto_1918676 ) ) ( TRUCK-AT ?auto_1918680 ?auto_1918679 ) ( not ( = ?auto_1918679 ?auto_1918681 ) ) ( ON ?auto_1918673 ?auto_1918672 ) ( ON ?auto_1918674 ?auto_1918673 ) ( ON ?auto_1918671 ?auto_1918674 ) ( ON ?auto_1918675 ?auto_1918671 ) ( not ( = ?auto_1918672 ?auto_1918673 ) ) ( not ( = ?auto_1918672 ?auto_1918674 ) ) ( not ( = ?auto_1918672 ?auto_1918671 ) ) ( not ( = ?auto_1918672 ?auto_1918675 ) ) ( not ( = ?auto_1918672 ?auto_1918677 ) ) ( not ( = ?auto_1918672 ?auto_1918676 ) ) ( not ( = ?auto_1918673 ?auto_1918674 ) ) ( not ( = ?auto_1918673 ?auto_1918671 ) ) ( not ( = ?auto_1918673 ?auto_1918675 ) ) ( not ( = ?auto_1918673 ?auto_1918677 ) ) ( not ( = ?auto_1918673 ?auto_1918676 ) ) ( not ( = ?auto_1918674 ?auto_1918671 ) ) ( not ( = ?auto_1918674 ?auto_1918675 ) ) ( not ( = ?auto_1918674 ?auto_1918677 ) ) ( not ( = ?auto_1918674 ?auto_1918676 ) ) ( not ( = ?auto_1918671 ?auto_1918675 ) ) ( not ( = ?auto_1918671 ?auto_1918677 ) ) ( not ( = ?auto_1918671 ?auto_1918676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918675 ?auto_1918677 ?auto_1918676 )
      ( MAKE-6CRATE-VERIFY ?auto_1918672 ?auto_1918673 ?auto_1918674 ?auto_1918671 ?auto_1918675 ?auto_1918677 ?auto_1918676 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918729 - SURFACE
      ?auto_1918730 - SURFACE
      ?auto_1918731 - SURFACE
      ?auto_1918728 - SURFACE
      ?auto_1918732 - SURFACE
      ?auto_1918734 - SURFACE
      ?auto_1918733 - SURFACE
    )
    :vars
    (
      ?auto_1918737 - HOIST
      ?auto_1918736 - PLACE
      ?auto_1918739 - TRUCK
      ?auto_1918738 - PLACE
      ?auto_1918735 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918737 ?auto_1918736 ) ( SURFACE-AT ?auto_1918734 ?auto_1918736 ) ( CLEAR ?auto_1918734 ) ( IS-CRATE ?auto_1918733 ) ( not ( = ?auto_1918734 ?auto_1918733 ) ) ( AVAILABLE ?auto_1918737 ) ( ON ?auto_1918734 ?auto_1918732 ) ( not ( = ?auto_1918732 ?auto_1918734 ) ) ( not ( = ?auto_1918732 ?auto_1918733 ) ) ( TRUCK-AT ?auto_1918739 ?auto_1918738 ) ( not ( = ?auto_1918738 ?auto_1918736 ) ) ( HOIST-AT ?auto_1918735 ?auto_1918738 ) ( LIFTING ?auto_1918735 ?auto_1918733 ) ( not ( = ?auto_1918737 ?auto_1918735 ) ) ( ON ?auto_1918730 ?auto_1918729 ) ( ON ?auto_1918731 ?auto_1918730 ) ( ON ?auto_1918728 ?auto_1918731 ) ( ON ?auto_1918732 ?auto_1918728 ) ( not ( = ?auto_1918729 ?auto_1918730 ) ) ( not ( = ?auto_1918729 ?auto_1918731 ) ) ( not ( = ?auto_1918729 ?auto_1918728 ) ) ( not ( = ?auto_1918729 ?auto_1918732 ) ) ( not ( = ?auto_1918729 ?auto_1918734 ) ) ( not ( = ?auto_1918729 ?auto_1918733 ) ) ( not ( = ?auto_1918730 ?auto_1918731 ) ) ( not ( = ?auto_1918730 ?auto_1918728 ) ) ( not ( = ?auto_1918730 ?auto_1918732 ) ) ( not ( = ?auto_1918730 ?auto_1918734 ) ) ( not ( = ?auto_1918730 ?auto_1918733 ) ) ( not ( = ?auto_1918731 ?auto_1918728 ) ) ( not ( = ?auto_1918731 ?auto_1918732 ) ) ( not ( = ?auto_1918731 ?auto_1918734 ) ) ( not ( = ?auto_1918731 ?auto_1918733 ) ) ( not ( = ?auto_1918728 ?auto_1918732 ) ) ( not ( = ?auto_1918728 ?auto_1918734 ) ) ( not ( = ?auto_1918728 ?auto_1918733 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918732 ?auto_1918734 ?auto_1918733 )
      ( MAKE-6CRATE-VERIFY ?auto_1918729 ?auto_1918730 ?auto_1918731 ?auto_1918728 ?auto_1918732 ?auto_1918734 ?auto_1918733 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918792 - SURFACE
      ?auto_1918793 - SURFACE
      ?auto_1918794 - SURFACE
      ?auto_1918791 - SURFACE
      ?auto_1918795 - SURFACE
      ?auto_1918797 - SURFACE
      ?auto_1918796 - SURFACE
    )
    :vars
    (
      ?auto_1918802 - HOIST
      ?auto_1918799 - PLACE
      ?auto_1918801 - TRUCK
      ?auto_1918803 - PLACE
      ?auto_1918798 - HOIST
      ?auto_1918800 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918802 ?auto_1918799 ) ( SURFACE-AT ?auto_1918797 ?auto_1918799 ) ( CLEAR ?auto_1918797 ) ( IS-CRATE ?auto_1918796 ) ( not ( = ?auto_1918797 ?auto_1918796 ) ) ( AVAILABLE ?auto_1918802 ) ( ON ?auto_1918797 ?auto_1918795 ) ( not ( = ?auto_1918795 ?auto_1918797 ) ) ( not ( = ?auto_1918795 ?auto_1918796 ) ) ( TRUCK-AT ?auto_1918801 ?auto_1918803 ) ( not ( = ?auto_1918803 ?auto_1918799 ) ) ( HOIST-AT ?auto_1918798 ?auto_1918803 ) ( not ( = ?auto_1918802 ?auto_1918798 ) ) ( AVAILABLE ?auto_1918798 ) ( SURFACE-AT ?auto_1918796 ?auto_1918803 ) ( ON ?auto_1918796 ?auto_1918800 ) ( CLEAR ?auto_1918796 ) ( not ( = ?auto_1918797 ?auto_1918800 ) ) ( not ( = ?auto_1918796 ?auto_1918800 ) ) ( not ( = ?auto_1918795 ?auto_1918800 ) ) ( ON ?auto_1918793 ?auto_1918792 ) ( ON ?auto_1918794 ?auto_1918793 ) ( ON ?auto_1918791 ?auto_1918794 ) ( ON ?auto_1918795 ?auto_1918791 ) ( not ( = ?auto_1918792 ?auto_1918793 ) ) ( not ( = ?auto_1918792 ?auto_1918794 ) ) ( not ( = ?auto_1918792 ?auto_1918791 ) ) ( not ( = ?auto_1918792 ?auto_1918795 ) ) ( not ( = ?auto_1918792 ?auto_1918797 ) ) ( not ( = ?auto_1918792 ?auto_1918796 ) ) ( not ( = ?auto_1918792 ?auto_1918800 ) ) ( not ( = ?auto_1918793 ?auto_1918794 ) ) ( not ( = ?auto_1918793 ?auto_1918791 ) ) ( not ( = ?auto_1918793 ?auto_1918795 ) ) ( not ( = ?auto_1918793 ?auto_1918797 ) ) ( not ( = ?auto_1918793 ?auto_1918796 ) ) ( not ( = ?auto_1918793 ?auto_1918800 ) ) ( not ( = ?auto_1918794 ?auto_1918791 ) ) ( not ( = ?auto_1918794 ?auto_1918795 ) ) ( not ( = ?auto_1918794 ?auto_1918797 ) ) ( not ( = ?auto_1918794 ?auto_1918796 ) ) ( not ( = ?auto_1918794 ?auto_1918800 ) ) ( not ( = ?auto_1918791 ?auto_1918795 ) ) ( not ( = ?auto_1918791 ?auto_1918797 ) ) ( not ( = ?auto_1918791 ?auto_1918796 ) ) ( not ( = ?auto_1918791 ?auto_1918800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918795 ?auto_1918797 ?auto_1918796 )
      ( MAKE-6CRATE-VERIFY ?auto_1918792 ?auto_1918793 ?auto_1918794 ?auto_1918791 ?auto_1918795 ?auto_1918797 ?auto_1918796 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918856 - SURFACE
      ?auto_1918857 - SURFACE
      ?auto_1918858 - SURFACE
      ?auto_1918855 - SURFACE
      ?auto_1918859 - SURFACE
      ?auto_1918861 - SURFACE
      ?auto_1918860 - SURFACE
    )
    :vars
    (
      ?auto_1918865 - HOIST
      ?auto_1918867 - PLACE
      ?auto_1918863 - PLACE
      ?auto_1918862 - HOIST
      ?auto_1918866 - SURFACE
      ?auto_1918864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918865 ?auto_1918867 ) ( SURFACE-AT ?auto_1918861 ?auto_1918867 ) ( CLEAR ?auto_1918861 ) ( IS-CRATE ?auto_1918860 ) ( not ( = ?auto_1918861 ?auto_1918860 ) ) ( AVAILABLE ?auto_1918865 ) ( ON ?auto_1918861 ?auto_1918859 ) ( not ( = ?auto_1918859 ?auto_1918861 ) ) ( not ( = ?auto_1918859 ?auto_1918860 ) ) ( not ( = ?auto_1918863 ?auto_1918867 ) ) ( HOIST-AT ?auto_1918862 ?auto_1918863 ) ( not ( = ?auto_1918865 ?auto_1918862 ) ) ( AVAILABLE ?auto_1918862 ) ( SURFACE-AT ?auto_1918860 ?auto_1918863 ) ( ON ?auto_1918860 ?auto_1918866 ) ( CLEAR ?auto_1918860 ) ( not ( = ?auto_1918861 ?auto_1918866 ) ) ( not ( = ?auto_1918860 ?auto_1918866 ) ) ( not ( = ?auto_1918859 ?auto_1918866 ) ) ( TRUCK-AT ?auto_1918864 ?auto_1918867 ) ( ON ?auto_1918857 ?auto_1918856 ) ( ON ?auto_1918858 ?auto_1918857 ) ( ON ?auto_1918855 ?auto_1918858 ) ( ON ?auto_1918859 ?auto_1918855 ) ( not ( = ?auto_1918856 ?auto_1918857 ) ) ( not ( = ?auto_1918856 ?auto_1918858 ) ) ( not ( = ?auto_1918856 ?auto_1918855 ) ) ( not ( = ?auto_1918856 ?auto_1918859 ) ) ( not ( = ?auto_1918856 ?auto_1918861 ) ) ( not ( = ?auto_1918856 ?auto_1918860 ) ) ( not ( = ?auto_1918856 ?auto_1918866 ) ) ( not ( = ?auto_1918857 ?auto_1918858 ) ) ( not ( = ?auto_1918857 ?auto_1918855 ) ) ( not ( = ?auto_1918857 ?auto_1918859 ) ) ( not ( = ?auto_1918857 ?auto_1918861 ) ) ( not ( = ?auto_1918857 ?auto_1918860 ) ) ( not ( = ?auto_1918857 ?auto_1918866 ) ) ( not ( = ?auto_1918858 ?auto_1918855 ) ) ( not ( = ?auto_1918858 ?auto_1918859 ) ) ( not ( = ?auto_1918858 ?auto_1918861 ) ) ( not ( = ?auto_1918858 ?auto_1918860 ) ) ( not ( = ?auto_1918858 ?auto_1918866 ) ) ( not ( = ?auto_1918855 ?auto_1918859 ) ) ( not ( = ?auto_1918855 ?auto_1918861 ) ) ( not ( = ?auto_1918855 ?auto_1918860 ) ) ( not ( = ?auto_1918855 ?auto_1918866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918859 ?auto_1918861 ?auto_1918860 )
      ( MAKE-6CRATE-VERIFY ?auto_1918856 ?auto_1918857 ?auto_1918858 ?auto_1918855 ?auto_1918859 ?auto_1918861 ?auto_1918860 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918920 - SURFACE
      ?auto_1918921 - SURFACE
      ?auto_1918922 - SURFACE
      ?auto_1918919 - SURFACE
      ?auto_1918923 - SURFACE
      ?auto_1918925 - SURFACE
      ?auto_1918924 - SURFACE
    )
    :vars
    (
      ?auto_1918929 - HOIST
      ?auto_1918931 - PLACE
      ?auto_1918926 - PLACE
      ?auto_1918928 - HOIST
      ?auto_1918927 - SURFACE
      ?auto_1918930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918929 ?auto_1918931 ) ( IS-CRATE ?auto_1918924 ) ( not ( = ?auto_1918925 ?auto_1918924 ) ) ( not ( = ?auto_1918923 ?auto_1918925 ) ) ( not ( = ?auto_1918923 ?auto_1918924 ) ) ( not ( = ?auto_1918926 ?auto_1918931 ) ) ( HOIST-AT ?auto_1918928 ?auto_1918926 ) ( not ( = ?auto_1918929 ?auto_1918928 ) ) ( AVAILABLE ?auto_1918928 ) ( SURFACE-AT ?auto_1918924 ?auto_1918926 ) ( ON ?auto_1918924 ?auto_1918927 ) ( CLEAR ?auto_1918924 ) ( not ( = ?auto_1918925 ?auto_1918927 ) ) ( not ( = ?auto_1918924 ?auto_1918927 ) ) ( not ( = ?auto_1918923 ?auto_1918927 ) ) ( TRUCK-AT ?auto_1918930 ?auto_1918931 ) ( SURFACE-AT ?auto_1918923 ?auto_1918931 ) ( CLEAR ?auto_1918923 ) ( LIFTING ?auto_1918929 ?auto_1918925 ) ( IS-CRATE ?auto_1918925 ) ( ON ?auto_1918921 ?auto_1918920 ) ( ON ?auto_1918922 ?auto_1918921 ) ( ON ?auto_1918919 ?auto_1918922 ) ( ON ?auto_1918923 ?auto_1918919 ) ( not ( = ?auto_1918920 ?auto_1918921 ) ) ( not ( = ?auto_1918920 ?auto_1918922 ) ) ( not ( = ?auto_1918920 ?auto_1918919 ) ) ( not ( = ?auto_1918920 ?auto_1918923 ) ) ( not ( = ?auto_1918920 ?auto_1918925 ) ) ( not ( = ?auto_1918920 ?auto_1918924 ) ) ( not ( = ?auto_1918920 ?auto_1918927 ) ) ( not ( = ?auto_1918921 ?auto_1918922 ) ) ( not ( = ?auto_1918921 ?auto_1918919 ) ) ( not ( = ?auto_1918921 ?auto_1918923 ) ) ( not ( = ?auto_1918921 ?auto_1918925 ) ) ( not ( = ?auto_1918921 ?auto_1918924 ) ) ( not ( = ?auto_1918921 ?auto_1918927 ) ) ( not ( = ?auto_1918922 ?auto_1918919 ) ) ( not ( = ?auto_1918922 ?auto_1918923 ) ) ( not ( = ?auto_1918922 ?auto_1918925 ) ) ( not ( = ?auto_1918922 ?auto_1918924 ) ) ( not ( = ?auto_1918922 ?auto_1918927 ) ) ( not ( = ?auto_1918919 ?auto_1918923 ) ) ( not ( = ?auto_1918919 ?auto_1918925 ) ) ( not ( = ?auto_1918919 ?auto_1918924 ) ) ( not ( = ?auto_1918919 ?auto_1918927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918923 ?auto_1918925 ?auto_1918924 )
      ( MAKE-6CRATE-VERIFY ?auto_1918920 ?auto_1918921 ?auto_1918922 ?auto_1918919 ?auto_1918923 ?auto_1918925 ?auto_1918924 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1918984 - SURFACE
      ?auto_1918985 - SURFACE
      ?auto_1918986 - SURFACE
      ?auto_1918983 - SURFACE
      ?auto_1918987 - SURFACE
      ?auto_1918989 - SURFACE
      ?auto_1918988 - SURFACE
    )
    :vars
    (
      ?auto_1918991 - HOIST
      ?auto_1918990 - PLACE
      ?auto_1918995 - PLACE
      ?auto_1918992 - HOIST
      ?auto_1918994 - SURFACE
      ?auto_1918993 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1918991 ?auto_1918990 ) ( IS-CRATE ?auto_1918988 ) ( not ( = ?auto_1918989 ?auto_1918988 ) ) ( not ( = ?auto_1918987 ?auto_1918989 ) ) ( not ( = ?auto_1918987 ?auto_1918988 ) ) ( not ( = ?auto_1918995 ?auto_1918990 ) ) ( HOIST-AT ?auto_1918992 ?auto_1918995 ) ( not ( = ?auto_1918991 ?auto_1918992 ) ) ( AVAILABLE ?auto_1918992 ) ( SURFACE-AT ?auto_1918988 ?auto_1918995 ) ( ON ?auto_1918988 ?auto_1918994 ) ( CLEAR ?auto_1918988 ) ( not ( = ?auto_1918989 ?auto_1918994 ) ) ( not ( = ?auto_1918988 ?auto_1918994 ) ) ( not ( = ?auto_1918987 ?auto_1918994 ) ) ( TRUCK-AT ?auto_1918993 ?auto_1918990 ) ( SURFACE-AT ?auto_1918987 ?auto_1918990 ) ( CLEAR ?auto_1918987 ) ( IS-CRATE ?auto_1918989 ) ( AVAILABLE ?auto_1918991 ) ( IN ?auto_1918989 ?auto_1918993 ) ( ON ?auto_1918985 ?auto_1918984 ) ( ON ?auto_1918986 ?auto_1918985 ) ( ON ?auto_1918983 ?auto_1918986 ) ( ON ?auto_1918987 ?auto_1918983 ) ( not ( = ?auto_1918984 ?auto_1918985 ) ) ( not ( = ?auto_1918984 ?auto_1918986 ) ) ( not ( = ?auto_1918984 ?auto_1918983 ) ) ( not ( = ?auto_1918984 ?auto_1918987 ) ) ( not ( = ?auto_1918984 ?auto_1918989 ) ) ( not ( = ?auto_1918984 ?auto_1918988 ) ) ( not ( = ?auto_1918984 ?auto_1918994 ) ) ( not ( = ?auto_1918985 ?auto_1918986 ) ) ( not ( = ?auto_1918985 ?auto_1918983 ) ) ( not ( = ?auto_1918985 ?auto_1918987 ) ) ( not ( = ?auto_1918985 ?auto_1918989 ) ) ( not ( = ?auto_1918985 ?auto_1918988 ) ) ( not ( = ?auto_1918985 ?auto_1918994 ) ) ( not ( = ?auto_1918986 ?auto_1918983 ) ) ( not ( = ?auto_1918986 ?auto_1918987 ) ) ( not ( = ?auto_1918986 ?auto_1918989 ) ) ( not ( = ?auto_1918986 ?auto_1918988 ) ) ( not ( = ?auto_1918986 ?auto_1918994 ) ) ( not ( = ?auto_1918983 ?auto_1918987 ) ) ( not ( = ?auto_1918983 ?auto_1918989 ) ) ( not ( = ?auto_1918983 ?auto_1918988 ) ) ( not ( = ?auto_1918983 ?auto_1918994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1918987 ?auto_1918989 ?auto_1918988 )
      ( MAKE-6CRATE-VERIFY ?auto_1918984 ?auto_1918985 ?auto_1918986 ?auto_1918983 ?auto_1918987 ?auto_1918989 ?auto_1918988 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1920257 - SURFACE
      ?auto_1920258 - SURFACE
    )
    :vars
    (
      ?auto_1920259 - HOIST
      ?auto_1920264 - PLACE
      ?auto_1920260 - SURFACE
      ?auto_1920263 - PLACE
      ?auto_1920262 - HOIST
      ?auto_1920265 - SURFACE
      ?auto_1920261 - TRUCK
      ?auto_1920266 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920259 ?auto_1920264 ) ( SURFACE-AT ?auto_1920257 ?auto_1920264 ) ( CLEAR ?auto_1920257 ) ( IS-CRATE ?auto_1920258 ) ( not ( = ?auto_1920257 ?auto_1920258 ) ) ( ON ?auto_1920257 ?auto_1920260 ) ( not ( = ?auto_1920260 ?auto_1920257 ) ) ( not ( = ?auto_1920260 ?auto_1920258 ) ) ( not ( = ?auto_1920263 ?auto_1920264 ) ) ( HOIST-AT ?auto_1920262 ?auto_1920263 ) ( not ( = ?auto_1920259 ?auto_1920262 ) ) ( AVAILABLE ?auto_1920262 ) ( SURFACE-AT ?auto_1920258 ?auto_1920263 ) ( ON ?auto_1920258 ?auto_1920265 ) ( CLEAR ?auto_1920258 ) ( not ( = ?auto_1920257 ?auto_1920265 ) ) ( not ( = ?auto_1920258 ?auto_1920265 ) ) ( not ( = ?auto_1920260 ?auto_1920265 ) ) ( TRUCK-AT ?auto_1920261 ?auto_1920264 ) ( LIFTING ?auto_1920259 ?auto_1920266 ) ( IS-CRATE ?auto_1920266 ) ( not ( = ?auto_1920257 ?auto_1920266 ) ) ( not ( = ?auto_1920258 ?auto_1920266 ) ) ( not ( = ?auto_1920260 ?auto_1920266 ) ) ( not ( = ?auto_1920265 ?auto_1920266 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1920259 ?auto_1920266 ?auto_1920261 ?auto_1920264 )
      ( MAKE-1CRATE ?auto_1920257 ?auto_1920258 )
      ( MAKE-1CRATE-VERIFY ?auto_1920257 ?auto_1920258 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920935 - SURFACE
      ?auto_1920936 - SURFACE
      ?auto_1920937 - SURFACE
      ?auto_1920934 - SURFACE
      ?auto_1920938 - SURFACE
      ?auto_1920940 - SURFACE
      ?auto_1920939 - SURFACE
      ?auto_1920941 - SURFACE
    )
    :vars
    (
      ?auto_1920943 - HOIST
      ?auto_1920942 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920943 ?auto_1920942 ) ( SURFACE-AT ?auto_1920939 ?auto_1920942 ) ( CLEAR ?auto_1920939 ) ( LIFTING ?auto_1920943 ?auto_1920941 ) ( IS-CRATE ?auto_1920941 ) ( not ( = ?auto_1920939 ?auto_1920941 ) ) ( ON ?auto_1920936 ?auto_1920935 ) ( ON ?auto_1920937 ?auto_1920936 ) ( ON ?auto_1920934 ?auto_1920937 ) ( ON ?auto_1920938 ?auto_1920934 ) ( ON ?auto_1920940 ?auto_1920938 ) ( ON ?auto_1920939 ?auto_1920940 ) ( not ( = ?auto_1920935 ?auto_1920936 ) ) ( not ( = ?auto_1920935 ?auto_1920937 ) ) ( not ( = ?auto_1920935 ?auto_1920934 ) ) ( not ( = ?auto_1920935 ?auto_1920938 ) ) ( not ( = ?auto_1920935 ?auto_1920940 ) ) ( not ( = ?auto_1920935 ?auto_1920939 ) ) ( not ( = ?auto_1920935 ?auto_1920941 ) ) ( not ( = ?auto_1920936 ?auto_1920937 ) ) ( not ( = ?auto_1920936 ?auto_1920934 ) ) ( not ( = ?auto_1920936 ?auto_1920938 ) ) ( not ( = ?auto_1920936 ?auto_1920940 ) ) ( not ( = ?auto_1920936 ?auto_1920939 ) ) ( not ( = ?auto_1920936 ?auto_1920941 ) ) ( not ( = ?auto_1920937 ?auto_1920934 ) ) ( not ( = ?auto_1920937 ?auto_1920938 ) ) ( not ( = ?auto_1920937 ?auto_1920940 ) ) ( not ( = ?auto_1920937 ?auto_1920939 ) ) ( not ( = ?auto_1920937 ?auto_1920941 ) ) ( not ( = ?auto_1920934 ?auto_1920938 ) ) ( not ( = ?auto_1920934 ?auto_1920940 ) ) ( not ( = ?auto_1920934 ?auto_1920939 ) ) ( not ( = ?auto_1920934 ?auto_1920941 ) ) ( not ( = ?auto_1920938 ?auto_1920940 ) ) ( not ( = ?auto_1920938 ?auto_1920939 ) ) ( not ( = ?auto_1920938 ?auto_1920941 ) ) ( not ( = ?auto_1920940 ?auto_1920939 ) ) ( not ( = ?auto_1920940 ?auto_1920941 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1920939 ?auto_1920941 )
      ( MAKE-7CRATE-VERIFY ?auto_1920935 ?auto_1920936 ?auto_1920937 ?auto_1920934 ?auto_1920938 ?auto_1920940 ?auto_1920939 ?auto_1920941 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1920990 - SURFACE
      ?auto_1920991 - SURFACE
      ?auto_1920992 - SURFACE
      ?auto_1920989 - SURFACE
      ?auto_1920993 - SURFACE
      ?auto_1920995 - SURFACE
      ?auto_1920994 - SURFACE
      ?auto_1920996 - SURFACE
    )
    :vars
    (
      ?auto_1920997 - HOIST
      ?auto_1920998 - PLACE
      ?auto_1920999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1920997 ?auto_1920998 ) ( SURFACE-AT ?auto_1920994 ?auto_1920998 ) ( CLEAR ?auto_1920994 ) ( IS-CRATE ?auto_1920996 ) ( not ( = ?auto_1920994 ?auto_1920996 ) ) ( TRUCK-AT ?auto_1920999 ?auto_1920998 ) ( AVAILABLE ?auto_1920997 ) ( IN ?auto_1920996 ?auto_1920999 ) ( ON ?auto_1920994 ?auto_1920995 ) ( not ( = ?auto_1920995 ?auto_1920994 ) ) ( not ( = ?auto_1920995 ?auto_1920996 ) ) ( ON ?auto_1920991 ?auto_1920990 ) ( ON ?auto_1920992 ?auto_1920991 ) ( ON ?auto_1920989 ?auto_1920992 ) ( ON ?auto_1920993 ?auto_1920989 ) ( ON ?auto_1920995 ?auto_1920993 ) ( not ( = ?auto_1920990 ?auto_1920991 ) ) ( not ( = ?auto_1920990 ?auto_1920992 ) ) ( not ( = ?auto_1920990 ?auto_1920989 ) ) ( not ( = ?auto_1920990 ?auto_1920993 ) ) ( not ( = ?auto_1920990 ?auto_1920995 ) ) ( not ( = ?auto_1920990 ?auto_1920994 ) ) ( not ( = ?auto_1920990 ?auto_1920996 ) ) ( not ( = ?auto_1920991 ?auto_1920992 ) ) ( not ( = ?auto_1920991 ?auto_1920989 ) ) ( not ( = ?auto_1920991 ?auto_1920993 ) ) ( not ( = ?auto_1920991 ?auto_1920995 ) ) ( not ( = ?auto_1920991 ?auto_1920994 ) ) ( not ( = ?auto_1920991 ?auto_1920996 ) ) ( not ( = ?auto_1920992 ?auto_1920989 ) ) ( not ( = ?auto_1920992 ?auto_1920993 ) ) ( not ( = ?auto_1920992 ?auto_1920995 ) ) ( not ( = ?auto_1920992 ?auto_1920994 ) ) ( not ( = ?auto_1920992 ?auto_1920996 ) ) ( not ( = ?auto_1920989 ?auto_1920993 ) ) ( not ( = ?auto_1920989 ?auto_1920995 ) ) ( not ( = ?auto_1920989 ?auto_1920994 ) ) ( not ( = ?auto_1920989 ?auto_1920996 ) ) ( not ( = ?auto_1920993 ?auto_1920995 ) ) ( not ( = ?auto_1920993 ?auto_1920994 ) ) ( not ( = ?auto_1920993 ?auto_1920996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1920995 ?auto_1920994 ?auto_1920996 )
      ( MAKE-7CRATE-VERIFY ?auto_1920990 ?auto_1920991 ?auto_1920992 ?auto_1920989 ?auto_1920993 ?auto_1920995 ?auto_1920994 ?auto_1920996 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921053 - SURFACE
      ?auto_1921054 - SURFACE
      ?auto_1921055 - SURFACE
      ?auto_1921052 - SURFACE
      ?auto_1921056 - SURFACE
      ?auto_1921058 - SURFACE
      ?auto_1921057 - SURFACE
      ?auto_1921059 - SURFACE
    )
    :vars
    (
      ?auto_1921060 - HOIST
      ?auto_1921063 - PLACE
      ?auto_1921062 - TRUCK
      ?auto_1921061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921060 ?auto_1921063 ) ( SURFACE-AT ?auto_1921057 ?auto_1921063 ) ( CLEAR ?auto_1921057 ) ( IS-CRATE ?auto_1921059 ) ( not ( = ?auto_1921057 ?auto_1921059 ) ) ( AVAILABLE ?auto_1921060 ) ( IN ?auto_1921059 ?auto_1921062 ) ( ON ?auto_1921057 ?auto_1921058 ) ( not ( = ?auto_1921058 ?auto_1921057 ) ) ( not ( = ?auto_1921058 ?auto_1921059 ) ) ( TRUCK-AT ?auto_1921062 ?auto_1921061 ) ( not ( = ?auto_1921061 ?auto_1921063 ) ) ( ON ?auto_1921054 ?auto_1921053 ) ( ON ?auto_1921055 ?auto_1921054 ) ( ON ?auto_1921052 ?auto_1921055 ) ( ON ?auto_1921056 ?auto_1921052 ) ( ON ?auto_1921058 ?auto_1921056 ) ( not ( = ?auto_1921053 ?auto_1921054 ) ) ( not ( = ?auto_1921053 ?auto_1921055 ) ) ( not ( = ?auto_1921053 ?auto_1921052 ) ) ( not ( = ?auto_1921053 ?auto_1921056 ) ) ( not ( = ?auto_1921053 ?auto_1921058 ) ) ( not ( = ?auto_1921053 ?auto_1921057 ) ) ( not ( = ?auto_1921053 ?auto_1921059 ) ) ( not ( = ?auto_1921054 ?auto_1921055 ) ) ( not ( = ?auto_1921054 ?auto_1921052 ) ) ( not ( = ?auto_1921054 ?auto_1921056 ) ) ( not ( = ?auto_1921054 ?auto_1921058 ) ) ( not ( = ?auto_1921054 ?auto_1921057 ) ) ( not ( = ?auto_1921054 ?auto_1921059 ) ) ( not ( = ?auto_1921055 ?auto_1921052 ) ) ( not ( = ?auto_1921055 ?auto_1921056 ) ) ( not ( = ?auto_1921055 ?auto_1921058 ) ) ( not ( = ?auto_1921055 ?auto_1921057 ) ) ( not ( = ?auto_1921055 ?auto_1921059 ) ) ( not ( = ?auto_1921052 ?auto_1921056 ) ) ( not ( = ?auto_1921052 ?auto_1921058 ) ) ( not ( = ?auto_1921052 ?auto_1921057 ) ) ( not ( = ?auto_1921052 ?auto_1921059 ) ) ( not ( = ?auto_1921056 ?auto_1921058 ) ) ( not ( = ?auto_1921056 ?auto_1921057 ) ) ( not ( = ?auto_1921056 ?auto_1921059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921058 ?auto_1921057 ?auto_1921059 )
      ( MAKE-7CRATE-VERIFY ?auto_1921053 ?auto_1921054 ?auto_1921055 ?auto_1921052 ?auto_1921056 ?auto_1921058 ?auto_1921057 ?auto_1921059 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921123 - SURFACE
      ?auto_1921124 - SURFACE
      ?auto_1921125 - SURFACE
      ?auto_1921122 - SURFACE
      ?auto_1921126 - SURFACE
      ?auto_1921128 - SURFACE
      ?auto_1921127 - SURFACE
      ?auto_1921129 - SURFACE
    )
    :vars
    (
      ?auto_1921132 - HOIST
      ?auto_1921133 - PLACE
      ?auto_1921131 - TRUCK
      ?auto_1921134 - PLACE
      ?auto_1921130 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921132 ?auto_1921133 ) ( SURFACE-AT ?auto_1921127 ?auto_1921133 ) ( CLEAR ?auto_1921127 ) ( IS-CRATE ?auto_1921129 ) ( not ( = ?auto_1921127 ?auto_1921129 ) ) ( AVAILABLE ?auto_1921132 ) ( ON ?auto_1921127 ?auto_1921128 ) ( not ( = ?auto_1921128 ?auto_1921127 ) ) ( not ( = ?auto_1921128 ?auto_1921129 ) ) ( TRUCK-AT ?auto_1921131 ?auto_1921134 ) ( not ( = ?auto_1921134 ?auto_1921133 ) ) ( HOIST-AT ?auto_1921130 ?auto_1921134 ) ( LIFTING ?auto_1921130 ?auto_1921129 ) ( not ( = ?auto_1921132 ?auto_1921130 ) ) ( ON ?auto_1921124 ?auto_1921123 ) ( ON ?auto_1921125 ?auto_1921124 ) ( ON ?auto_1921122 ?auto_1921125 ) ( ON ?auto_1921126 ?auto_1921122 ) ( ON ?auto_1921128 ?auto_1921126 ) ( not ( = ?auto_1921123 ?auto_1921124 ) ) ( not ( = ?auto_1921123 ?auto_1921125 ) ) ( not ( = ?auto_1921123 ?auto_1921122 ) ) ( not ( = ?auto_1921123 ?auto_1921126 ) ) ( not ( = ?auto_1921123 ?auto_1921128 ) ) ( not ( = ?auto_1921123 ?auto_1921127 ) ) ( not ( = ?auto_1921123 ?auto_1921129 ) ) ( not ( = ?auto_1921124 ?auto_1921125 ) ) ( not ( = ?auto_1921124 ?auto_1921122 ) ) ( not ( = ?auto_1921124 ?auto_1921126 ) ) ( not ( = ?auto_1921124 ?auto_1921128 ) ) ( not ( = ?auto_1921124 ?auto_1921127 ) ) ( not ( = ?auto_1921124 ?auto_1921129 ) ) ( not ( = ?auto_1921125 ?auto_1921122 ) ) ( not ( = ?auto_1921125 ?auto_1921126 ) ) ( not ( = ?auto_1921125 ?auto_1921128 ) ) ( not ( = ?auto_1921125 ?auto_1921127 ) ) ( not ( = ?auto_1921125 ?auto_1921129 ) ) ( not ( = ?auto_1921122 ?auto_1921126 ) ) ( not ( = ?auto_1921122 ?auto_1921128 ) ) ( not ( = ?auto_1921122 ?auto_1921127 ) ) ( not ( = ?auto_1921122 ?auto_1921129 ) ) ( not ( = ?auto_1921126 ?auto_1921128 ) ) ( not ( = ?auto_1921126 ?auto_1921127 ) ) ( not ( = ?auto_1921126 ?auto_1921129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921128 ?auto_1921127 ?auto_1921129 )
      ( MAKE-7CRATE-VERIFY ?auto_1921123 ?auto_1921124 ?auto_1921125 ?auto_1921122 ?auto_1921126 ?auto_1921128 ?auto_1921127 ?auto_1921129 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921200 - SURFACE
      ?auto_1921201 - SURFACE
      ?auto_1921202 - SURFACE
      ?auto_1921199 - SURFACE
      ?auto_1921203 - SURFACE
      ?auto_1921205 - SURFACE
      ?auto_1921204 - SURFACE
      ?auto_1921206 - SURFACE
    )
    :vars
    (
      ?auto_1921208 - HOIST
      ?auto_1921211 - PLACE
      ?auto_1921210 - TRUCK
      ?auto_1921212 - PLACE
      ?auto_1921209 - HOIST
      ?auto_1921207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921208 ?auto_1921211 ) ( SURFACE-AT ?auto_1921204 ?auto_1921211 ) ( CLEAR ?auto_1921204 ) ( IS-CRATE ?auto_1921206 ) ( not ( = ?auto_1921204 ?auto_1921206 ) ) ( AVAILABLE ?auto_1921208 ) ( ON ?auto_1921204 ?auto_1921205 ) ( not ( = ?auto_1921205 ?auto_1921204 ) ) ( not ( = ?auto_1921205 ?auto_1921206 ) ) ( TRUCK-AT ?auto_1921210 ?auto_1921212 ) ( not ( = ?auto_1921212 ?auto_1921211 ) ) ( HOIST-AT ?auto_1921209 ?auto_1921212 ) ( not ( = ?auto_1921208 ?auto_1921209 ) ) ( AVAILABLE ?auto_1921209 ) ( SURFACE-AT ?auto_1921206 ?auto_1921212 ) ( ON ?auto_1921206 ?auto_1921207 ) ( CLEAR ?auto_1921206 ) ( not ( = ?auto_1921204 ?auto_1921207 ) ) ( not ( = ?auto_1921206 ?auto_1921207 ) ) ( not ( = ?auto_1921205 ?auto_1921207 ) ) ( ON ?auto_1921201 ?auto_1921200 ) ( ON ?auto_1921202 ?auto_1921201 ) ( ON ?auto_1921199 ?auto_1921202 ) ( ON ?auto_1921203 ?auto_1921199 ) ( ON ?auto_1921205 ?auto_1921203 ) ( not ( = ?auto_1921200 ?auto_1921201 ) ) ( not ( = ?auto_1921200 ?auto_1921202 ) ) ( not ( = ?auto_1921200 ?auto_1921199 ) ) ( not ( = ?auto_1921200 ?auto_1921203 ) ) ( not ( = ?auto_1921200 ?auto_1921205 ) ) ( not ( = ?auto_1921200 ?auto_1921204 ) ) ( not ( = ?auto_1921200 ?auto_1921206 ) ) ( not ( = ?auto_1921200 ?auto_1921207 ) ) ( not ( = ?auto_1921201 ?auto_1921202 ) ) ( not ( = ?auto_1921201 ?auto_1921199 ) ) ( not ( = ?auto_1921201 ?auto_1921203 ) ) ( not ( = ?auto_1921201 ?auto_1921205 ) ) ( not ( = ?auto_1921201 ?auto_1921204 ) ) ( not ( = ?auto_1921201 ?auto_1921206 ) ) ( not ( = ?auto_1921201 ?auto_1921207 ) ) ( not ( = ?auto_1921202 ?auto_1921199 ) ) ( not ( = ?auto_1921202 ?auto_1921203 ) ) ( not ( = ?auto_1921202 ?auto_1921205 ) ) ( not ( = ?auto_1921202 ?auto_1921204 ) ) ( not ( = ?auto_1921202 ?auto_1921206 ) ) ( not ( = ?auto_1921202 ?auto_1921207 ) ) ( not ( = ?auto_1921199 ?auto_1921203 ) ) ( not ( = ?auto_1921199 ?auto_1921205 ) ) ( not ( = ?auto_1921199 ?auto_1921204 ) ) ( not ( = ?auto_1921199 ?auto_1921206 ) ) ( not ( = ?auto_1921199 ?auto_1921207 ) ) ( not ( = ?auto_1921203 ?auto_1921205 ) ) ( not ( = ?auto_1921203 ?auto_1921204 ) ) ( not ( = ?auto_1921203 ?auto_1921206 ) ) ( not ( = ?auto_1921203 ?auto_1921207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921205 ?auto_1921204 ?auto_1921206 )
      ( MAKE-7CRATE-VERIFY ?auto_1921200 ?auto_1921201 ?auto_1921202 ?auto_1921199 ?auto_1921203 ?auto_1921205 ?auto_1921204 ?auto_1921206 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921278 - SURFACE
      ?auto_1921279 - SURFACE
      ?auto_1921280 - SURFACE
      ?auto_1921277 - SURFACE
      ?auto_1921281 - SURFACE
      ?auto_1921283 - SURFACE
      ?auto_1921282 - SURFACE
      ?auto_1921284 - SURFACE
    )
    :vars
    (
      ?auto_1921285 - HOIST
      ?auto_1921288 - PLACE
      ?auto_1921290 - PLACE
      ?auto_1921286 - HOIST
      ?auto_1921287 - SURFACE
      ?auto_1921289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921285 ?auto_1921288 ) ( SURFACE-AT ?auto_1921282 ?auto_1921288 ) ( CLEAR ?auto_1921282 ) ( IS-CRATE ?auto_1921284 ) ( not ( = ?auto_1921282 ?auto_1921284 ) ) ( AVAILABLE ?auto_1921285 ) ( ON ?auto_1921282 ?auto_1921283 ) ( not ( = ?auto_1921283 ?auto_1921282 ) ) ( not ( = ?auto_1921283 ?auto_1921284 ) ) ( not ( = ?auto_1921290 ?auto_1921288 ) ) ( HOIST-AT ?auto_1921286 ?auto_1921290 ) ( not ( = ?auto_1921285 ?auto_1921286 ) ) ( AVAILABLE ?auto_1921286 ) ( SURFACE-AT ?auto_1921284 ?auto_1921290 ) ( ON ?auto_1921284 ?auto_1921287 ) ( CLEAR ?auto_1921284 ) ( not ( = ?auto_1921282 ?auto_1921287 ) ) ( not ( = ?auto_1921284 ?auto_1921287 ) ) ( not ( = ?auto_1921283 ?auto_1921287 ) ) ( TRUCK-AT ?auto_1921289 ?auto_1921288 ) ( ON ?auto_1921279 ?auto_1921278 ) ( ON ?auto_1921280 ?auto_1921279 ) ( ON ?auto_1921277 ?auto_1921280 ) ( ON ?auto_1921281 ?auto_1921277 ) ( ON ?auto_1921283 ?auto_1921281 ) ( not ( = ?auto_1921278 ?auto_1921279 ) ) ( not ( = ?auto_1921278 ?auto_1921280 ) ) ( not ( = ?auto_1921278 ?auto_1921277 ) ) ( not ( = ?auto_1921278 ?auto_1921281 ) ) ( not ( = ?auto_1921278 ?auto_1921283 ) ) ( not ( = ?auto_1921278 ?auto_1921282 ) ) ( not ( = ?auto_1921278 ?auto_1921284 ) ) ( not ( = ?auto_1921278 ?auto_1921287 ) ) ( not ( = ?auto_1921279 ?auto_1921280 ) ) ( not ( = ?auto_1921279 ?auto_1921277 ) ) ( not ( = ?auto_1921279 ?auto_1921281 ) ) ( not ( = ?auto_1921279 ?auto_1921283 ) ) ( not ( = ?auto_1921279 ?auto_1921282 ) ) ( not ( = ?auto_1921279 ?auto_1921284 ) ) ( not ( = ?auto_1921279 ?auto_1921287 ) ) ( not ( = ?auto_1921280 ?auto_1921277 ) ) ( not ( = ?auto_1921280 ?auto_1921281 ) ) ( not ( = ?auto_1921280 ?auto_1921283 ) ) ( not ( = ?auto_1921280 ?auto_1921282 ) ) ( not ( = ?auto_1921280 ?auto_1921284 ) ) ( not ( = ?auto_1921280 ?auto_1921287 ) ) ( not ( = ?auto_1921277 ?auto_1921281 ) ) ( not ( = ?auto_1921277 ?auto_1921283 ) ) ( not ( = ?auto_1921277 ?auto_1921282 ) ) ( not ( = ?auto_1921277 ?auto_1921284 ) ) ( not ( = ?auto_1921277 ?auto_1921287 ) ) ( not ( = ?auto_1921281 ?auto_1921283 ) ) ( not ( = ?auto_1921281 ?auto_1921282 ) ) ( not ( = ?auto_1921281 ?auto_1921284 ) ) ( not ( = ?auto_1921281 ?auto_1921287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921283 ?auto_1921282 ?auto_1921284 )
      ( MAKE-7CRATE-VERIFY ?auto_1921278 ?auto_1921279 ?auto_1921280 ?auto_1921277 ?auto_1921281 ?auto_1921283 ?auto_1921282 ?auto_1921284 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921356 - SURFACE
      ?auto_1921357 - SURFACE
      ?auto_1921358 - SURFACE
      ?auto_1921355 - SURFACE
      ?auto_1921359 - SURFACE
      ?auto_1921361 - SURFACE
      ?auto_1921360 - SURFACE
      ?auto_1921362 - SURFACE
    )
    :vars
    (
      ?auto_1921365 - HOIST
      ?auto_1921368 - PLACE
      ?auto_1921364 - PLACE
      ?auto_1921366 - HOIST
      ?auto_1921367 - SURFACE
      ?auto_1921363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921365 ?auto_1921368 ) ( IS-CRATE ?auto_1921362 ) ( not ( = ?auto_1921360 ?auto_1921362 ) ) ( not ( = ?auto_1921361 ?auto_1921360 ) ) ( not ( = ?auto_1921361 ?auto_1921362 ) ) ( not ( = ?auto_1921364 ?auto_1921368 ) ) ( HOIST-AT ?auto_1921366 ?auto_1921364 ) ( not ( = ?auto_1921365 ?auto_1921366 ) ) ( AVAILABLE ?auto_1921366 ) ( SURFACE-AT ?auto_1921362 ?auto_1921364 ) ( ON ?auto_1921362 ?auto_1921367 ) ( CLEAR ?auto_1921362 ) ( not ( = ?auto_1921360 ?auto_1921367 ) ) ( not ( = ?auto_1921362 ?auto_1921367 ) ) ( not ( = ?auto_1921361 ?auto_1921367 ) ) ( TRUCK-AT ?auto_1921363 ?auto_1921368 ) ( SURFACE-AT ?auto_1921361 ?auto_1921368 ) ( CLEAR ?auto_1921361 ) ( LIFTING ?auto_1921365 ?auto_1921360 ) ( IS-CRATE ?auto_1921360 ) ( ON ?auto_1921357 ?auto_1921356 ) ( ON ?auto_1921358 ?auto_1921357 ) ( ON ?auto_1921355 ?auto_1921358 ) ( ON ?auto_1921359 ?auto_1921355 ) ( ON ?auto_1921361 ?auto_1921359 ) ( not ( = ?auto_1921356 ?auto_1921357 ) ) ( not ( = ?auto_1921356 ?auto_1921358 ) ) ( not ( = ?auto_1921356 ?auto_1921355 ) ) ( not ( = ?auto_1921356 ?auto_1921359 ) ) ( not ( = ?auto_1921356 ?auto_1921361 ) ) ( not ( = ?auto_1921356 ?auto_1921360 ) ) ( not ( = ?auto_1921356 ?auto_1921362 ) ) ( not ( = ?auto_1921356 ?auto_1921367 ) ) ( not ( = ?auto_1921357 ?auto_1921358 ) ) ( not ( = ?auto_1921357 ?auto_1921355 ) ) ( not ( = ?auto_1921357 ?auto_1921359 ) ) ( not ( = ?auto_1921357 ?auto_1921361 ) ) ( not ( = ?auto_1921357 ?auto_1921360 ) ) ( not ( = ?auto_1921357 ?auto_1921362 ) ) ( not ( = ?auto_1921357 ?auto_1921367 ) ) ( not ( = ?auto_1921358 ?auto_1921355 ) ) ( not ( = ?auto_1921358 ?auto_1921359 ) ) ( not ( = ?auto_1921358 ?auto_1921361 ) ) ( not ( = ?auto_1921358 ?auto_1921360 ) ) ( not ( = ?auto_1921358 ?auto_1921362 ) ) ( not ( = ?auto_1921358 ?auto_1921367 ) ) ( not ( = ?auto_1921355 ?auto_1921359 ) ) ( not ( = ?auto_1921355 ?auto_1921361 ) ) ( not ( = ?auto_1921355 ?auto_1921360 ) ) ( not ( = ?auto_1921355 ?auto_1921362 ) ) ( not ( = ?auto_1921355 ?auto_1921367 ) ) ( not ( = ?auto_1921359 ?auto_1921361 ) ) ( not ( = ?auto_1921359 ?auto_1921360 ) ) ( not ( = ?auto_1921359 ?auto_1921362 ) ) ( not ( = ?auto_1921359 ?auto_1921367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921361 ?auto_1921360 ?auto_1921362 )
      ( MAKE-7CRATE-VERIFY ?auto_1921356 ?auto_1921357 ?auto_1921358 ?auto_1921355 ?auto_1921359 ?auto_1921361 ?auto_1921360 ?auto_1921362 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1921434 - SURFACE
      ?auto_1921435 - SURFACE
      ?auto_1921436 - SURFACE
      ?auto_1921433 - SURFACE
      ?auto_1921437 - SURFACE
      ?auto_1921439 - SURFACE
      ?auto_1921438 - SURFACE
      ?auto_1921440 - SURFACE
    )
    :vars
    (
      ?auto_1921444 - HOIST
      ?auto_1921441 - PLACE
      ?auto_1921442 - PLACE
      ?auto_1921443 - HOIST
      ?auto_1921446 - SURFACE
      ?auto_1921445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1921444 ?auto_1921441 ) ( IS-CRATE ?auto_1921440 ) ( not ( = ?auto_1921438 ?auto_1921440 ) ) ( not ( = ?auto_1921439 ?auto_1921438 ) ) ( not ( = ?auto_1921439 ?auto_1921440 ) ) ( not ( = ?auto_1921442 ?auto_1921441 ) ) ( HOIST-AT ?auto_1921443 ?auto_1921442 ) ( not ( = ?auto_1921444 ?auto_1921443 ) ) ( AVAILABLE ?auto_1921443 ) ( SURFACE-AT ?auto_1921440 ?auto_1921442 ) ( ON ?auto_1921440 ?auto_1921446 ) ( CLEAR ?auto_1921440 ) ( not ( = ?auto_1921438 ?auto_1921446 ) ) ( not ( = ?auto_1921440 ?auto_1921446 ) ) ( not ( = ?auto_1921439 ?auto_1921446 ) ) ( TRUCK-AT ?auto_1921445 ?auto_1921441 ) ( SURFACE-AT ?auto_1921439 ?auto_1921441 ) ( CLEAR ?auto_1921439 ) ( IS-CRATE ?auto_1921438 ) ( AVAILABLE ?auto_1921444 ) ( IN ?auto_1921438 ?auto_1921445 ) ( ON ?auto_1921435 ?auto_1921434 ) ( ON ?auto_1921436 ?auto_1921435 ) ( ON ?auto_1921433 ?auto_1921436 ) ( ON ?auto_1921437 ?auto_1921433 ) ( ON ?auto_1921439 ?auto_1921437 ) ( not ( = ?auto_1921434 ?auto_1921435 ) ) ( not ( = ?auto_1921434 ?auto_1921436 ) ) ( not ( = ?auto_1921434 ?auto_1921433 ) ) ( not ( = ?auto_1921434 ?auto_1921437 ) ) ( not ( = ?auto_1921434 ?auto_1921439 ) ) ( not ( = ?auto_1921434 ?auto_1921438 ) ) ( not ( = ?auto_1921434 ?auto_1921440 ) ) ( not ( = ?auto_1921434 ?auto_1921446 ) ) ( not ( = ?auto_1921435 ?auto_1921436 ) ) ( not ( = ?auto_1921435 ?auto_1921433 ) ) ( not ( = ?auto_1921435 ?auto_1921437 ) ) ( not ( = ?auto_1921435 ?auto_1921439 ) ) ( not ( = ?auto_1921435 ?auto_1921438 ) ) ( not ( = ?auto_1921435 ?auto_1921440 ) ) ( not ( = ?auto_1921435 ?auto_1921446 ) ) ( not ( = ?auto_1921436 ?auto_1921433 ) ) ( not ( = ?auto_1921436 ?auto_1921437 ) ) ( not ( = ?auto_1921436 ?auto_1921439 ) ) ( not ( = ?auto_1921436 ?auto_1921438 ) ) ( not ( = ?auto_1921436 ?auto_1921440 ) ) ( not ( = ?auto_1921436 ?auto_1921446 ) ) ( not ( = ?auto_1921433 ?auto_1921437 ) ) ( not ( = ?auto_1921433 ?auto_1921439 ) ) ( not ( = ?auto_1921433 ?auto_1921438 ) ) ( not ( = ?auto_1921433 ?auto_1921440 ) ) ( not ( = ?auto_1921433 ?auto_1921446 ) ) ( not ( = ?auto_1921437 ?auto_1921439 ) ) ( not ( = ?auto_1921437 ?auto_1921438 ) ) ( not ( = ?auto_1921437 ?auto_1921440 ) ) ( not ( = ?auto_1921437 ?auto_1921446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1921439 ?auto_1921438 ?auto_1921440 )
      ( MAKE-7CRATE-VERIFY ?auto_1921434 ?auto_1921435 ?auto_1921436 ?auto_1921433 ?auto_1921437 ?auto_1921439 ?auto_1921438 ?auto_1921440 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924353 - SURFACE
      ?auto_1924354 - SURFACE
      ?auto_1924355 - SURFACE
      ?auto_1924352 - SURFACE
      ?auto_1924356 - SURFACE
      ?auto_1924358 - SURFACE
      ?auto_1924357 - SURFACE
      ?auto_1924359 - SURFACE
      ?auto_1924360 - SURFACE
    )
    :vars
    (
      ?auto_1924361 - HOIST
      ?auto_1924362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924361 ?auto_1924362 ) ( SURFACE-AT ?auto_1924359 ?auto_1924362 ) ( CLEAR ?auto_1924359 ) ( LIFTING ?auto_1924361 ?auto_1924360 ) ( IS-CRATE ?auto_1924360 ) ( not ( = ?auto_1924359 ?auto_1924360 ) ) ( ON ?auto_1924354 ?auto_1924353 ) ( ON ?auto_1924355 ?auto_1924354 ) ( ON ?auto_1924352 ?auto_1924355 ) ( ON ?auto_1924356 ?auto_1924352 ) ( ON ?auto_1924358 ?auto_1924356 ) ( ON ?auto_1924357 ?auto_1924358 ) ( ON ?auto_1924359 ?auto_1924357 ) ( not ( = ?auto_1924353 ?auto_1924354 ) ) ( not ( = ?auto_1924353 ?auto_1924355 ) ) ( not ( = ?auto_1924353 ?auto_1924352 ) ) ( not ( = ?auto_1924353 ?auto_1924356 ) ) ( not ( = ?auto_1924353 ?auto_1924358 ) ) ( not ( = ?auto_1924353 ?auto_1924357 ) ) ( not ( = ?auto_1924353 ?auto_1924359 ) ) ( not ( = ?auto_1924353 ?auto_1924360 ) ) ( not ( = ?auto_1924354 ?auto_1924355 ) ) ( not ( = ?auto_1924354 ?auto_1924352 ) ) ( not ( = ?auto_1924354 ?auto_1924356 ) ) ( not ( = ?auto_1924354 ?auto_1924358 ) ) ( not ( = ?auto_1924354 ?auto_1924357 ) ) ( not ( = ?auto_1924354 ?auto_1924359 ) ) ( not ( = ?auto_1924354 ?auto_1924360 ) ) ( not ( = ?auto_1924355 ?auto_1924352 ) ) ( not ( = ?auto_1924355 ?auto_1924356 ) ) ( not ( = ?auto_1924355 ?auto_1924358 ) ) ( not ( = ?auto_1924355 ?auto_1924357 ) ) ( not ( = ?auto_1924355 ?auto_1924359 ) ) ( not ( = ?auto_1924355 ?auto_1924360 ) ) ( not ( = ?auto_1924352 ?auto_1924356 ) ) ( not ( = ?auto_1924352 ?auto_1924358 ) ) ( not ( = ?auto_1924352 ?auto_1924357 ) ) ( not ( = ?auto_1924352 ?auto_1924359 ) ) ( not ( = ?auto_1924352 ?auto_1924360 ) ) ( not ( = ?auto_1924356 ?auto_1924358 ) ) ( not ( = ?auto_1924356 ?auto_1924357 ) ) ( not ( = ?auto_1924356 ?auto_1924359 ) ) ( not ( = ?auto_1924356 ?auto_1924360 ) ) ( not ( = ?auto_1924358 ?auto_1924357 ) ) ( not ( = ?auto_1924358 ?auto_1924359 ) ) ( not ( = ?auto_1924358 ?auto_1924360 ) ) ( not ( = ?auto_1924357 ?auto_1924359 ) ) ( not ( = ?auto_1924357 ?auto_1924360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1924359 ?auto_1924360 )
      ( MAKE-8CRATE-VERIFY ?auto_1924353 ?auto_1924354 ?auto_1924355 ?auto_1924352 ?auto_1924356 ?auto_1924358 ?auto_1924357 ?auto_1924359 ?auto_1924360 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924420 - SURFACE
      ?auto_1924421 - SURFACE
      ?auto_1924422 - SURFACE
      ?auto_1924419 - SURFACE
      ?auto_1924423 - SURFACE
      ?auto_1924425 - SURFACE
      ?auto_1924424 - SURFACE
      ?auto_1924426 - SURFACE
      ?auto_1924427 - SURFACE
    )
    :vars
    (
      ?auto_1924428 - HOIST
      ?auto_1924430 - PLACE
      ?auto_1924429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924428 ?auto_1924430 ) ( SURFACE-AT ?auto_1924426 ?auto_1924430 ) ( CLEAR ?auto_1924426 ) ( IS-CRATE ?auto_1924427 ) ( not ( = ?auto_1924426 ?auto_1924427 ) ) ( TRUCK-AT ?auto_1924429 ?auto_1924430 ) ( AVAILABLE ?auto_1924428 ) ( IN ?auto_1924427 ?auto_1924429 ) ( ON ?auto_1924426 ?auto_1924424 ) ( not ( = ?auto_1924424 ?auto_1924426 ) ) ( not ( = ?auto_1924424 ?auto_1924427 ) ) ( ON ?auto_1924421 ?auto_1924420 ) ( ON ?auto_1924422 ?auto_1924421 ) ( ON ?auto_1924419 ?auto_1924422 ) ( ON ?auto_1924423 ?auto_1924419 ) ( ON ?auto_1924425 ?auto_1924423 ) ( ON ?auto_1924424 ?auto_1924425 ) ( not ( = ?auto_1924420 ?auto_1924421 ) ) ( not ( = ?auto_1924420 ?auto_1924422 ) ) ( not ( = ?auto_1924420 ?auto_1924419 ) ) ( not ( = ?auto_1924420 ?auto_1924423 ) ) ( not ( = ?auto_1924420 ?auto_1924425 ) ) ( not ( = ?auto_1924420 ?auto_1924424 ) ) ( not ( = ?auto_1924420 ?auto_1924426 ) ) ( not ( = ?auto_1924420 ?auto_1924427 ) ) ( not ( = ?auto_1924421 ?auto_1924422 ) ) ( not ( = ?auto_1924421 ?auto_1924419 ) ) ( not ( = ?auto_1924421 ?auto_1924423 ) ) ( not ( = ?auto_1924421 ?auto_1924425 ) ) ( not ( = ?auto_1924421 ?auto_1924424 ) ) ( not ( = ?auto_1924421 ?auto_1924426 ) ) ( not ( = ?auto_1924421 ?auto_1924427 ) ) ( not ( = ?auto_1924422 ?auto_1924419 ) ) ( not ( = ?auto_1924422 ?auto_1924423 ) ) ( not ( = ?auto_1924422 ?auto_1924425 ) ) ( not ( = ?auto_1924422 ?auto_1924424 ) ) ( not ( = ?auto_1924422 ?auto_1924426 ) ) ( not ( = ?auto_1924422 ?auto_1924427 ) ) ( not ( = ?auto_1924419 ?auto_1924423 ) ) ( not ( = ?auto_1924419 ?auto_1924425 ) ) ( not ( = ?auto_1924419 ?auto_1924424 ) ) ( not ( = ?auto_1924419 ?auto_1924426 ) ) ( not ( = ?auto_1924419 ?auto_1924427 ) ) ( not ( = ?auto_1924423 ?auto_1924425 ) ) ( not ( = ?auto_1924423 ?auto_1924424 ) ) ( not ( = ?auto_1924423 ?auto_1924426 ) ) ( not ( = ?auto_1924423 ?auto_1924427 ) ) ( not ( = ?auto_1924425 ?auto_1924424 ) ) ( not ( = ?auto_1924425 ?auto_1924426 ) ) ( not ( = ?auto_1924425 ?auto_1924427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924424 ?auto_1924426 ?auto_1924427 )
      ( MAKE-8CRATE-VERIFY ?auto_1924420 ?auto_1924421 ?auto_1924422 ?auto_1924419 ?auto_1924423 ?auto_1924425 ?auto_1924424 ?auto_1924426 ?auto_1924427 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924496 - SURFACE
      ?auto_1924497 - SURFACE
      ?auto_1924498 - SURFACE
      ?auto_1924495 - SURFACE
      ?auto_1924499 - SURFACE
      ?auto_1924501 - SURFACE
      ?auto_1924500 - SURFACE
      ?auto_1924502 - SURFACE
      ?auto_1924503 - SURFACE
    )
    :vars
    (
      ?auto_1924506 - HOIST
      ?auto_1924504 - PLACE
      ?auto_1924505 - TRUCK
      ?auto_1924507 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924506 ?auto_1924504 ) ( SURFACE-AT ?auto_1924502 ?auto_1924504 ) ( CLEAR ?auto_1924502 ) ( IS-CRATE ?auto_1924503 ) ( not ( = ?auto_1924502 ?auto_1924503 ) ) ( AVAILABLE ?auto_1924506 ) ( IN ?auto_1924503 ?auto_1924505 ) ( ON ?auto_1924502 ?auto_1924500 ) ( not ( = ?auto_1924500 ?auto_1924502 ) ) ( not ( = ?auto_1924500 ?auto_1924503 ) ) ( TRUCK-AT ?auto_1924505 ?auto_1924507 ) ( not ( = ?auto_1924507 ?auto_1924504 ) ) ( ON ?auto_1924497 ?auto_1924496 ) ( ON ?auto_1924498 ?auto_1924497 ) ( ON ?auto_1924495 ?auto_1924498 ) ( ON ?auto_1924499 ?auto_1924495 ) ( ON ?auto_1924501 ?auto_1924499 ) ( ON ?auto_1924500 ?auto_1924501 ) ( not ( = ?auto_1924496 ?auto_1924497 ) ) ( not ( = ?auto_1924496 ?auto_1924498 ) ) ( not ( = ?auto_1924496 ?auto_1924495 ) ) ( not ( = ?auto_1924496 ?auto_1924499 ) ) ( not ( = ?auto_1924496 ?auto_1924501 ) ) ( not ( = ?auto_1924496 ?auto_1924500 ) ) ( not ( = ?auto_1924496 ?auto_1924502 ) ) ( not ( = ?auto_1924496 ?auto_1924503 ) ) ( not ( = ?auto_1924497 ?auto_1924498 ) ) ( not ( = ?auto_1924497 ?auto_1924495 ) ) ( not ( = ?auto_1924497 ?auto_1924499 ) ) ( not ( = ?auto_1924497 ?auto_1924501 ) ) ( not ( = ?auto_1924497 ?auto_1924500 ) ) ( not ( = ?auto_1924497 ?auto_1924502 ) ) ( not ( = ?auto_1924497 ?auto_1924503 ) ) ( not ( = ?auto_1924498 ?auto_1924495 ) ) ( not ( = ?auto_1924498 ?auto_1924499 ) ) ( not ( = ?auto_1924498 ?auto_1924501 ) ) ( not ( = ?auto_1924498 ?auto_1924500 ) ) ( not ( = ?auto_1924498 ?auto_1924502 ) ) ( not ( = ?auto_1924498 ?auto_1924503 ) ) ( not ( = ?auto_1924495 ?auto_1924499 ) ) ( not ( = ?auto_1924495 ?auto_1924501 ) ) ( not ( = ?auto_1924495 ?auto_1924500 ) ) ( not ( = ?auto_1924495 ?auto_1924502 ) ) ( not ( = ?auto_1924495 ?auto_1924503 ) ) ( not ( = ?auto_1924499 ?auto_1924501 ) ) ( not ( = ?auto_1924499 ?auto_1924500 ) ) ( not ( = ?auto_1924499 ?auto_1924502 ) ) ( not ( = ?auto_1924499 ?auto_1924503 ) ) ( not ( = ?auto_1924501 ?auto_1924500 ) ) ( not ( = ?auto_1924501 ?auto_1924502 ) ) ( not ( = ?auto_1924501 ?auto_1924503 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924500 ?auto_1924502 ?auto_1924503 )
      ( MAKE-8CRATE-VERIFY ?auto_1924496 ?auto_1924497 ?auto_1924498 ?auto_1924495 ?auto_1924499 ?auto_1924501 ?auto_1924500 ?auto_1924502 ?auto_1924503 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924580 - SURFACE
      ?auto_1924581 - SURFACE
      ?auto_1924582 - SURFACE
      ?auto_1924579 - SURFACE
      ?auto_1924583 - SURFACE
      ?auto_1924585 - SURFACE
      ?auto_1924584 - SURFACE
      ?auto_1924586 - SURFACE
      ?auto_1924587 - SURFACE
    )
    :vars
    (
      ?auto_1924592 - HOIST
      ?auto_1924590 - PLACE
      ?auto_1924588 - TRUCK
      ?auto_1924589 - PLACE
      ?auto_1924591 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924592 ?auto_1924590 ) ( SURFACE-AT ?auto_1924586 ?auto_1924590 ) ( CLEAR ?auto_1924586 ) ( IS-CRATE ?auto_1924587 ) ( not ( = ?auto_1924586 ?auto_1924587 ) ) ( AVAILABLE ?auto_1924592 ) ( ON ?auto_1924586 ?auto_1924584 ) ( not ( = ?auto_1924584 ?auto_1924586 ) ) ( not ( = ?auto_1924584 ?auto_1924587 ) ) ( TRUCK-AT ?auto_1924588 ?auto_1924589 ) ( not ( = ?auto_1924589 ?auto_1924590 ) ) ( HOIST-AT ?auto_1924591 ?auto_1924589 ) ( LIFTING ?auto_1924591 ?auto_1924587 ) ( not ( = ?auto_1924592 ?auto_1924591 ) ) ( ON ?auto_1924581 ?auto_1924580 ) ( ON ?auto_1924582 ?auto_1924581 ) ( ON ?auto_1924579 ?auto_1924582 ) ( ON ?auto_1924583 ?auto_1924579 ) ( ON ?auto_1924585 ?auto_1924583 ) ( ON ?auto_1924584 ?auto_1924585 ) ( not ( = ?auto_1924580 ?auto_1924581 ) ) ( not ( = ?auto_1924580 ?auto_1924582 ) ) ( not ( = ?auto_1924580 ?auto_1924579 ) ) ( not ( = ?auto_1924580 ?auto_1924583 ) ) ( not ( = ?auto_1924580 ?auto_1924585 ) ) ( not ( = ?auto_1924580 ?auto_1924584 ) ) ( not ( = ?auto_1924580 ?auto_1924586 ) ) ( not ( = ?auto_1924580 ?auto_1924587 ) ) ( not ( = ?auto_1924581 ?auto_1924582 ) ) ( not ( = ?auto_1924581 ?auto_1924579 ) ) ( not ( = ?auto_1924581 ?auto_1924583 ) ) ( not ( = ?auto_1924581 ?auto_1924585 ) ) ( not ( = ?auto_1924581 ?auto_1924584 ) ) ( not ( = ?auto_1924581 ?auto_1924586 ) ) ( not ( = ?auto_1924581 ?auto_1924587 ) ) ( not ( = ?auto_1924582 ?auto_1924579 ) ) ( not ( = ?auto_1924582 ?auto_1924583 ) ) ( not ( = ?auto_1924582 ?auto_1924585 ) ) ( not ( = ?auto_1924582 ?auto_1924584 ) ) ( not ( = ?auto_1924582 ?auto_1924586 ) ) ( not ( = ?auto_1924582 ?auto_1924587 ) ) ( not ( = ?auto_1924579 ?auto_1924583 ) ) ( not ( = ?auto_1924579 ?auto_1924585 ) ) ( not ( = ?auto_1924579 ?auto_1924584 ) ) ( not ( = ?auto_1924579 ?auto_1924586 ) ) ( not ( = ?auto_1924579 ?auto_1924587 ) ) ( not ( = ?auto_1924583 ?auto_1924585 ) ) ( not ( = ?auto_1924583 ?auto_1924584 ) ) ( not ( = ?auto_1924583 ?auto_1924586 ) ) ( not ( = ?auto_1924583 ?auto_1924587 ) ) ( not ( = ?auto_1924585 ?auto_1924584 ) ) ( not ( = ?auto_1924585 ?auto_1924586 ) ) ( not ( = ?auto_1924585 ?auto_1924587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924584 ?auto_1924586 ?auto_1924587 )
      ( MAKE-8CRATE-VERIFY ?auto_1924580 ?auto_1924581 ?auto_1924582 ?auto_1924579 ?auto_1924583 ?auto_1924585 ?auto_1924584 ?auto_1924586 ?auto_1924587 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924672 - SURFACE
      ?auto_1924673 - SURFACE
      ?auto_1924674 - SURFACE
      ?auto_1924671 - SURFACE
      ?auto_1924675 - SURFACE
      ?auto_1924677 - SURFACE
      ?auto_1924676 - SURFACE
      ?auto_1924678 - SURFACE
      ?auto_1924679 - SURFACE
    )
    :vars
    (
      ?auto_1924683 - HOIST
      ?auto_1924685 - PLACE
      ?auto_1924681 - TRUCK
      ?auto_1924680 - PLACE
      ?auto_1924684 - HOIST
      ?auto_1924682 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924683 ?auto_1924685 ) ( SURFACE-AT ?auto_1924678 ?auto_1924685 ) ( CLEAR ?auto_1924678 ) ( IS-CRATE ?auto_1924679 ) ( not ( = ?auto_1924678 ?auto_1924679 ) ) ( AVAILABLE ?auto_1924683 ) ( ON ?auto_1924678 ?auto_1924676 ) ( not ( = ?auto_1924676 ?auto_1924678 ) ) ( not ( = ?auto_1924676 ?auto_1924679 ) ) ( TRUCK-AT ?auto_1924681 ?auto_1924680 ) ( not ( = ?auto_1924680 ?auto_1924685 ) ) ( HOIST-AT ?auto_1924684 ?auto_1924680 ) ( not ( = ?auto_1924683 ?auto_1924684 ) ) ( AVAILABLE ?auto_1924684 ) ( SURFACE-AT ?auto_1924679 ?auto_1924680 ) ( ON ?auto_1924679 ?auto_1924682 ) ( CLEAR ?auto_1924679 ) ( not ( = ?auto_1924678 ?auto_1924682 ) ) ( not ( = ?auto_1924679 ?auto_1924682 ) ) ( not ( = ?auto_1924676 ?auto_1924682 ) ) ( ON ?auto_1924673 ?auto_1924672 ) ( ON ?auto_1924674 ?auto_1924673 ) ( ON ?auto_1924671 ?auto_1924674 ) ( ON ?auto_1924675 ?auto_1924671 ) ( ON ?auto_1924677 ?auto_1924675 ) ( ON ?auto_1924676 ?auto_1924677 ) ( not ( = ?auto_1924672 ?auto_1924673 ) ) ( not ( = ?auto_1924672 ?auto_1924674 ) ) ( not ( = ?auto_1924672 ?auto_1924671 ) ) ( not ( = ?auto_1924672 ?auto_1924675 ) ) ( not ( = ?auto_1924672 ?auto_1924677 ) ) ( not ( = ?auto_1924672 ?auto_1924676 ) ) ( not ( = ?auto_1924672 ?auto_1924678 ) ) ( not ( = ?auto_1924672 ?auto_1924679 ) ) ( not ( = ?auto_1924672 ?auto_1924682 ) ) ( not ( = ?auto_1924673 ?auto_1924674 ) ) ( not ( = ?auto_1924673 ?auto_1924671 ) ) ( not ( = ?auto_1924673 ?auto_1924675 ) ) ( not ( = ?auto_1924673 ?auto_1924677 ) ) ( not ( = ?auto_1924673 ?auto_1924676 ) ) ( not ( = ?auto_1924673 ?auto_1924678 ) ) ( not ( = ?auto_1924673 ?auto_1924679 ) ) ( not ( = ?auto_1924673 ?auto_1924682 ) ) ( not ( = ?auto_1924674 ?auto_1924671 ) ) ( not ( = ?auto_1924674 ?auto_1924675 ) ) ( not ( = ?auto_1924674 ?auto_1924677 ) ) ( not ( = ?auto_1924674 ?auto_1924676 ) ) ( not ( = ?auto_1924674 ?auto_1924678 ) ) ( not ( = ?auto_1924674 ?auto_1924679 ) ) ( not ( = ?auto_1924674 ?auto_1924682 ) ) ( not ( = ?auto_1924671 ?auto_1924675 ) ) ( not ( = ?auto_1924671 ?auto_1924677 ) ) ( not ( = ?auto_1924671 ?auto_1924676 ) ) ( not ( = ?auto_1924671 ?auto_1924678 ) ) ( not ( = ?auto_1924671 ?auto_1924679 ) ) ( not ( = ?auto_1924671 ?auto_1924682 ) ) ( not ( = ?auto_1924675 ?auto_1924677 ) ) ( not ( = ?auto_1924675 ?auto_1924676 ) ) ( not ( = ?auto_1924675 ?auto_1924678 ) ) ( not ( = ?auto_1924675 ?auto_1924679 ) ) ( not ( = ?auto_1924675 ?auto_1924682 ) ) ( not ( = ?auto_1924677 ?auto_1924676 ) ) ( not ( = ?auto_1924677 ?auto_1924678 ) ) ( not ( = ?auto_1924677 ?auto_1924679 ) ) ( not ( = ?auto_1924677 ?auto_1924682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924676 ?auto_1924678 ?auto_1924679 )
      ( MAKE-8CRATE-VERIFY ?auto_1924672 ?auto_1924673 ?auto_1924674 ?auto_1924671 ?auto_1924675 ?auto_1924677 ?auto_1924676 ?auto_1924678 ?auto_1924679 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924765 - SURFACE
      ?auto_1924766 - SURFACE
      ?auto_1924767 - SURFACE
      ?auto_1924764 - SURFACE
      ?auto_1924768 - SURFACE
      ?auto_1924770 - SURFACE
      ?auto_1924769 - SURFACE
      ?auto_1924771 - SURFACE
      ?auto_1924772 - SURFACE
    )
    :vars
    (
      ?auto_1924774 - HOIST
      ?auto_1924775 - PLACE
      ?auto_1924773 - PLACE
      ?auto_1924776 - HOIST
      ?auto_1924778 - SURFACE
      ?auto_1924777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924774 ?auto_1924775 ) ( SURFACE-AT ?auto_1924771 ?auto_1924775 ) ( CLEAR ?auto_1924771 ) ( IS-CRATE ?auto_1924772 ) ( not ( = ?auto_1924771 ?auto_1924772 ) ) ( AVAILABLE ?auto_1924774 ) ( ON ?auto_1924771 ?auto_1924769 ) ( not ( = ?auto_1924769 ?auto_1924771 ) ) ( not ( = ?auto_1924769 ?auto_1924772 ) ) ( not ( = ?auto_1924773 ?auto_1924775 ) ) ( HOIST-AT ?auto_1924776 ?auto_1924773 ) ( not ( = ?auto_1924774 ?auto_1924776 ) ) ( AVAILABLE ?auto_1924776 ) ( SURFACE-AT ?auto_1924772 ?auto_1924773 ) ( ON ?auto_1924772 ?auto_1924778 ) ( CLEAR ?auto_1924772 ) ( not ( = ?auto_1924771 ?auto_1924778 ) ) ( not ( = ?auto_1924772 ?auto_1924778 ) ) ( not ( = ?auto_1924769 ?auto_1924778 ) ) ( TRUCK-AT ?auto_1924777 ?auto_1924775 ) ( ON ?auto_1924766 ?auto_1924765 ) ( ON ?auto_1924767 ?auto_1924766 ) ( ON ?auto_1924764 ?auto_1924767 ) ( ON ?auto_1924768 ?auto_1924764 ) ( ON ?auto_1924770 ?auto_1924768 ) ( ON ?auto_1924769 ?auto_1924770 ) ( not ( = ?auto_1924765 ?auto_1924766 ) ) ( not ( = ?auto_1924765 ?auto_1924767 ) ) ( not ( = ?auto_1924765 ?auto_1924764 ) ) ( not ( = ?auto_1924765 ?auto_1924768 ) ) ( not ( = ?auto_1924765 ?auto_1924770 ) ) ( not ( = ?auto_1924765 ?auto_1924769 ) ) ( not ( = ?auto_1924765 ?auto_1924771 ) ) ( not ( = ?auto_1924765 ?auto_1924772 ) ) ( not ( = ?auto_1924765 ?auto_1924778 ) ) ( not ( = ?auto_1924766 ?auto_1924767 ) ) ( not ( = ?auto_1924766 ?auto_1924764 ) ) ( not ( = ?auto_1924766 ?auto_1924768 ) ) ( not ( = ?auto_1924766 ?auto_1924770 ) ) ( not ( = ?auto_1924766 ?auto_1924769 ) ) ( not ( = ?auto_1924766 ?auto_1924771 ) ) ( not ( = ?auto_1924766 ?auto_1924772 ) ) ( not ( = ?auto_1924766 ?auto_1924778 ) ) ( not ( = ?auto_1924767 ?auto_1924764 ) ) ( not ( = ?auto_1924767 ?auto_1924768 ) ) ( not ( = ?auto_1924767 ?auto_1924770 ) ) ( not ( = ?auto_1924767 ?auto_1924769 ) ) ( not ( = ?auto_1924767 ?auto_1924771 ) ) ( not ( = ?auto_1924767 ?auto_1924772 ) ) ( not ( = ?auto_1924767 ?auto_1924778 ) ) ( not ( = ?auto_1924764 ?auto_1924768 ) ) ( not ( = ?auto_1924764 ?auto_1924770 ) ) ( not ( = ?auto_1924764 ?auto_1924769 ) ) ( not ( = ?auto_1924764 ?auto_1924771 ) ) ( not ( = ?auto_1924764 ?auto_1924772 ) ) ( not ( = ?auto_1924764 ?auto_1924778 ) ) ( not ( = ?auto_1924768 ?auto_1924770 ) ) ( not ( = ?auto_1924768 ?auto_1924769 ) ) ( not ( = ?auto_1924768 ?auto_1924771 ) ) ( not ( = ?auto_1924768 ?auto_1924772 ) ) ( not ( = ?auto_1924768 ?auto_1924778 ) ) ( not ( = ?auto_1924770 ?auto_1924769 ) ) ( not ( = ?auto_1924770 ?auto_1924771 ) ) ( not ( = ?auto_1924770 ?auto_1924772 ) ) ( not ( = ?auto_1924770 ?auto_1924778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924769 ?auto_1924771 ?auto_1924772 )
      ( MAKE-8CRATE-VERIFY ?auto_1924765 ?auto_1924766 ?auto_1924767 ?auto_1924764 ?auto_1924768 ?auto_1924770 ?auto_1924769 ?auto_1924771 ?auto_1924772 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924858 - SURFACE
      ?auto_1924859 - SURFACE
      ?auto_1924860 - SURFACE
      ?auto_1924857 - SURFACE
      ?auto_1924861 - SURFACE
      ?auto_1924863 - SURFACE
      ?auto_1924862 - SURFACE
      ?auto_1924864 - SURFACE
      ?auto_1924865 - SURFACE
    )
    :vars
    (
      ?auto_1924870 - HOIST
      ?auto_1924869 - PLACE
      ?auto_1924871 - PLACE
      ?auto_1924866 - HOIST
      ?auto_1924868 - SURFACE
      ?auto_1924867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924870 ?auto_1924869 ) ( IS-CRATE ?auto_1924865 ) ( not ( = ?auto_1924864 ?auto_1924865 ) ) ( not ( = ?auto_1924862 ?auto_1924864 ) ) ( not ( = ?auto_1924862 ?auto_1924865 ) ) ( not ( = ?auto_1924871 ?auto_1924869 ) ) ( HOIST-AT ?auto_1924866 ?auto_1924871 ) ( not ( = ?auto_1924870 ?auto_1924866 ) ) ( AVAILABLE ?auto_1924866 ) ( SURFACE-AT ?auto_1924865 ?auto_1924871 ) ( ON ?auto_1924865 ?auto_1924868 ) ( CLEAR ?auto_1924865 ) ( not ( = ?auto_1924864 ?auto_1924868 ) ) ( not ( = ?auto_1924865 ?auto_1924868 ) ) ( not ( = ?auto_1924862 ?auto_1924868 ) ) ( TRUCK-AT ?auto_1924867 ?auto_1924869 ) ( SURFACE-AT ?auto_1924862 ?auto_1924869 ) ( CLEAR ?auto_1924862 ) ( LIFTING ?auto_1924870 ?auto_1924864 ) ( IS-CRATE ?auto_1924864 ) ( ON ?auto_1924859 ?auto_1924858 ) ( ON ?auto_1924860 ?auto_1924859 ) ( ON ?auto_1924857 ?auto_1924860 ) ( ON ?auto_1924861 ?auto_1924857 ) ( ON ?auto_1924863 ?auto_1924861 ) ( ON ?auto_1924862 ?auto_1924863 ) ( not ( = ?auto_1924858 ?auto_1924859 ) ) ( not ( = ?auto_1924858 ?auto_1924860 ) ) ( not ( = ?auto_1924858 ?auto_1924857 ) ) ( not ( = ?auto_1924858 ?auto_1924861 ) ) ( not ( = ?auto_1924858 ?auto_1924863 ) ) ( not ( = ?auto_1924858 ?auto_1924862 ) ) ( not ( = ?auto_1924858 ?auto_1924864 ) ) ( not ( = ?auto_1924858 ?auto_1924865 ) ) ( not ( = ?auto_1924858 ?auto_1924868 ) ) ( not ( = ?auto_1924859 ?auto_1924860 ) ) ( not ( = ?auto_1924859 ?auto_1924857 ) ) ( not ( = ?auto_1924859 ?auto_1924861 ) ) ( not ( = ?auto_1924859 ?auto_1924863 ) ) ( not ( = ?auto_1924859 ?auto_1924862 ) ) ( not ( = ?auto_1924859 ?auto_1924864 ) ) ( not ( = ?auto_1924859 ?auto_1924865 ) ) ( not ( = ?auto_1924859 ?auto_1924868 ) ) ( not ( = ?auto_1924860 ?auto_1924857 ) ) ( not ( = ?auto_1924860 ?auto_1924861 ) ) ( not ( = ?auto_1924860 ?auto_1924863 ) ) ( not ( = ?auto_1924860 ?auto_1924862 ) ) ( not ( = ?auto_1924860 ?auto_1924864 ) ) ( not ( = ?auto_1924860 ?auto_1924865 ) ) ( not ( = ?auto_1924860 ?auto_1924868 ) ) ( not ( = ?auto_1924857 ?auto_1924861 ) ) ( not ( = ?auto_1924857 ?auto_1924863 ) ) ( not ( = ?auto_1924857 ?auto_1924862 ) ) ( not ( = ?auto_1924857 ?auto_1924864 ) ) ( not ( = ?auto_1924857 ?auto_1924865 ) ) ( not ( = ?auto_1924857 ?auto_1924868 ) ) ( not ( = ?auto_1924861 ?auto_1924863 ) ) ( not ( = ?auto_1924861 ?auto_1924862 ) ) ( not ( = ?auto_1924861 ?auto_1924864 ) ) ( not ( = ?auto_1924861 ?auto_1924865 ) ) ( not ( = ?auto_1924861 ?auto_1924868 ) ) ( not ( = ?auto_1924863 ?auto_1924862 ) ) ( not ( = ?auto_1924863 ?auto_1924864 ) ) ( not ( = ?auto_1924863 ?auto_1924865 ) ) ( not ( = ?auto_1924863 ?auto_1924868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924862 ?auto_1924864 ?auto_1924865 )
      ( MAKE-8CRATE-VERIFY ?auto_1924858 ?auto_1924859 ?auto_1924860 ?auto_1924857 ?auto_1924861 ?auto_1924863 ?auto_1924862 ?auto_1924864 ?auto_1924865 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1924951 - SURFACE
      ?auto_1924952 - SURFACE
      ?auto_1924953 - SURFACE
      ?auto_1924950 - SURFACE
      ?auto_1924954 - SURFACE
      ?auto_1924956 - SURFACE
      ?auto_1924955 - SURFACE
      ?auto_1924957 - SURFACE
      ?auto_1924958 - SURFACE
    )
    :vars
    (
      ?auto_1924963 - HOIST
      ?auto_1924964 - PLACE
      ?auto_1924961 - PLACE
      ?auto_1924962 - HOIST
      ?auto_1924959 - SURFACE
      ?auto_1924960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1924963 ?auto_1924964 ) ( IS-CRATE ?auto_1924958 ) ( not ( = ?auto_1924957 ?auto_1924958 ) ) ( not ( = ?auto_1924955 ?auto_1924957 ) ) ( not ( = ?auto_1924955 ?auto_1924958 ) ) ( not ( = ?auto_1924961 ?auto_1924964 ) ) ( HOIST-AT ?auto_1924962 ?auto_1924961 ) ( not ( = ?auto_1924963 ?auto_1924962 ) ) ( AVAILABLE ?auto_1924962 ) ( SURFACE-AT ?auto_1924958 ?auto_1924961 ) ( ON ?auto_1924958 ?auto_1924959 ) ( CLEAR ?auto_1924958 ) ( not ( = ?auto_1924957 ?auto_1924959 ) ) ( not ( = ?auto_1924958 ?auto_1924959 ) ) ( not ( = ?auto_1924955 ?auto_1924959 ) ) ( TRUCK-AT ?auto_1924960 ?auto_1924964 ) ( SURFACE-AT ?auto_1924955 ?auto_1924964 ) ( CLEAR ?auto_1924955 ) ( IS-CRATE ?auto_1924957 ) ( AVAILABLE ?auto_1924963 ) ( IN ?auto_1924957 ?auto_1924960 ) ( ON ?auto_1924952 ?auto_1924951 ) ( ON ?auto_1924953 ?auto_1924952 ) ( ON ?auto_1924950 ?auto_1924953 ) ( ON ?auto_1924954 ?auto_1924950 ) ( ON ?auto_1924956 ?auto_1924954 ) ( ON ?auto_1924955 ?auto_1924956 ) ( not ( = ?auto_1924951 ?auto_1924952 ) ) ( not ( = ?auto_1924951 ?auto_1924953 ) ) ( not ( = ?auto_1924951 ?auto_1924950 ) ) ( not ( = ?auto_1924951 ?auto_1924954 ) ) ( not ( = ?auto_1924951 ?auto_1924956 ) ) ( not ( = ?auto_1924951 ?auto_1924955 ) ) ( not ( = ?auto_1924951 ?auto_1924957 ) ) ( not ( = ?auto_1924951 ?auto_1924958 ) ) ( not ( = ?auto_1924951 ?auto_1924959 ) ) ( not ( = ?auto_1924952 ?auto_1924953 ) ) ( not ( = ?auto_1924952 ?auto_1924950 ) ) ( not ( = ?auto_1924952 ?auto_1924954 ) ) ( not ( = ?auto_1924952 ?auto_1924956 ) ) ( not ( = ?auto_1924952 ?auto_1924955 ) ) ( not ( = ?auto_1924952 ?auto_1924957 ) ) ( not ( = ?auto_1924952 ?auto_1924958 ) ) ( not ( = ?auto_1924952 ?auto_1924959 ) ) ( not ( = ?auto_1924953 ?auto_1924950 ) ) ( not ( = ?auto_1924953 ?auto_1924954 ) ) ( not ( = ?auto_1924953 ?auto_1924956 ) ) ( not ( = ?auto_1924953 ?auto_1924955 ) ) ( not ( = ?auto_1924953 ?auto_1924957 ) ) ( not ( = ?auto_1924953 ?auto_1924958 ) ) ( not ( = ?auto_1924953 ?auto_1924959 ) ) ( not ( = ?auto_1924950 ?auto_1924954 ) ) ( not ( = ?auto_1924950 ?auto_1924956 ) ) ( not ( = ?auto_1924950 ?auto_1924955 ) ) ( not ( = ?auto_1924950 ?auto_1924957 ) ) ( not ( = ?auto_1924950 ?auto_1924958 ) ) ( not ( = ?auto_1924950 ?auto_1924959 ) ) ( not ( = ?auto_1924954 ?auto_1924956 ) ) ( not ( = ?auto_1924954 ?auto_1924955 ) ) ( not ( = ?auto_1924954 ?auto_1924957 ) ) ( not ( = ?auto_1924954 ?auto_1924958 ) ) ( not ( = ?auto_1924954 ?auto_1924959 ) ) ( not ( = ?auto_1924956 ?auto_1924955 ) ) ( not ( = ?auto_1924956 ?auto_1924957 ) ) ( not ( = ?auto_1924956 ?auto_1924958 ) ) ( not ( = ?auto_1924956 ?auto_1924959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1924955 ?auto_1924957 ?auto_1924958 )
      ( MAKE-8CRATE-VERIFY ?auto_1924951 ?auto_1924952 ?auto_1924953 ?auto_1924950 ?auto_1924954 ?auto_1924956 ?auto_1924955 ?auto_1924957 ?auto_1924958 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929067 - SURFACE
      ?auto_1929068 - SURFACE
      ?auto_1929069 - SURFACE
      ?auto_1929066 - SURFACE
      ?auto_1929070 - SURFACE
      ?auto_1929072 - SURFACE
      ?auto_1929071 - SURFACE
      ?auto_1929073 - SURFACE
      ?auto_1929074 - SURFACE
      ?auto_1929075 - SURFACE
    )
    :vars
    (
      ?auto_1929077 - HOIST
      ?auto_1929076 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929077 ?auto_1929076 ) ( SURFACE-AT ?auto_1929074 ?auto_1929076 ) ( CLEAR ?auto_1929074 ) ( LIFTING ?auto_1929077 ?auto_1929075 ) ( IS-CRATE ?auto_1929075 ) ( not ( = ?auto_1929074 ?auto_1929075 ) ) ( ON ?auto_1929068 ?auto_1929067 ) ( ON ?auto_1929069 ?auto_1929068 ) ( ON ?auto_1929066 ?auto_1929069 ) ( ON ?auto_1929070 ?auto_1929066 ) ( ON ?auto_1929072 ?auto_1929070 ) ( ON ?auto_1929071 ?auto_1929072 ) ( ON ?auto_1929073 ?auto_1929071 ) ( ON ?auto_1929074 ?auto_1929073 ) ( not ( = ?auto_1929067 ?auto_1929068 ) ) ( not ( = ?auto_1929067 ?auto_1929069 ) ) ( not ( = ?auto_1929067 ?auto_1929066 ) ) ( not ( = ?auto_1929067 ?auto_1929070 ) ) ( not ( = ?auto_1929067 ?auto_1929072 ) ) ( not ( = ?auto_1929067 ?auto_1929071 ) ) ( not ( = ?auto_1929067 ?auto_1929073 ) ) ( not ( = ?auto_1929067 ?auto_1929074 ) ) ( not ( = ?auto_1929067 ?auto_1929075 ) ) ( not ( = ?auto_1929068 ?auto_1929069 ) ) ( not ( = ?auto_1929068 ?auto_1929066 ) ) ( not ( = ?auto_1929068 ?auto_1929070 ) ) ( not ( = ?auto_1929068 ?auto_1929072 ) ) ( not ( = ?auto_1929068 ?auto_1929071 ) ) ( not ( = ?auto_1929068 ?auto_1929073 ) ) ( not ( = ?auto_1929068 ?auto_1929074 ) ) ( not ( = ?auto_1929068 ?auto_1929075 ) ) ( not ( = ?auto_1929069 ?auto_1929066 ) ) ( not ( = ?auto_1929069 ?auto_1929070 ) ) ( not ( = ?auto_1929069 ?auto_1929072 ) ) ( not ( = ?auto_1929069 ?auto_1929071 ) ) ( not ( = ?auto_1929069 ?auto_1929073 ) ) ( not ( = ?auto_1929069 ?auto_1929074 ) ) ( not ( = ?auto_1929069 ?auto_1929075 ) ) ( not ( = ?auto_1929066 ?auto_1929070 ) ) ( not ( = ?auto_1929066 ?auto_1929072 ) ) ( not ( = ?auto_1929066 ?auto_1929071 ) ) ( not ( = ?auto_1929066 ?auto_1929073 ) ) ( not ( = ?auto_1929066 ?auto_1929074 ) ) ( not ( = ?auto_1929066 ?auto_1929075 ) ) ( not ( = ?auto_1929070 ?auto_1929072 ) ) ( not ( = ?auto_1929070 ?auto_1929071 ) ) ( not ( = ?auto_1929070 ?auto_1929073 ) ) ( not ( = ?auto_1929070 ?auto_1929074 ) ) ( not ( = ?auto_1929070 ?auto_1929075 ) ) ( not ( = ?auto_1929072 ?auto_1929071 ) ) ( not ( = ?auto_1929072 ?auto_1929073 ) ) ( not ( = ?auto_1929072 ?auto_1929074 ) ) ( not ( = ?auto_1929072 ?auto_1929075 ) ) ( not ( = ?auto_1929071 ?auto_1929073 ) ) ( not ( = ?auto_1929071 ?auto_1929074 ) ) ( not ( = ?auto_1929071 ?auto_1929075 ) ) ( not ( = ?auto_1929073 ?auto_1929074 ) ) ( not ( = ?auto_1929073 ?auto_1929075 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1929074 ?auto_1929075 )
      ( MAKE-9CRATE-VERIFY ?auto_1929067 ?auto_1929068 ?auto_1929069 ?auto_1929066 ?auto_1929070 ?auto_1929072 ?auto_1929071 ?auto_1929073 ?auto_1929074 ?auto_1929075 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929147 - SURFACE
      ?auto_1929148 - SURFACE
      ?auto_1929149 - SURFACE
      ?auto_1929146 - SURFACE
      ?auto_1929150 - SURFACE
      ?auto_1929152 - SURFACE
      ?auto_1929151 - SURFACE
      ?auto_1929153 - SURFACE
      ?auto_1929154 - SURFACE
      ?auto_1929155 - SURFACE
    )
    :vars
    (
      ?auto_1929156 - HOIST
      ?auto_1929157 - PLACE
      ?auto_1929158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929156 ?auto_1929157 ) ( SURFACE-AT ?auto_1929154 ?auto_1929157 ) ( CLEAR ?auto_1929154 ) ( IS-CRATE ?auto_1929155 ) ( not ( = ?auto_1929154 ?auto_1929155 ) ) ( TRUCK-AT ?auto_1929158 ?auto_1929157 ) ( AVAILABLE ?auto_1929156 ) ( IN ?auto_1929155 ?auto_1929158 ) ( ON ?auto_1929154 ?auto_1929153 ) ( not ( = ?auto_1929153 ?auto_1929154 ) ) ( not ( = ?auto_1929153 ?auto_1929155 ) ) ( ON ?auto_1929148 ?auto_1929147 ) ( ON ?auto_1929149 ?auto_1929148 ) ( ON ?auto_1929146 ?auto_1929149 ) ( ON ?auto_1929150 ?auto_1929146 ) ( ON ?auto_1929152 ?auto_1929150 ) ( ON ?auto_1929151 ?auto_1929152 ) ( ON ?auto_1929153 ?auto_1929151 ) ( not ( = ?auto_1929147 ?auto_1929148 ) ) ( not ( = ?auto_1929147 ?auto_1929149 ) ) ( not ( = ?auto_1929147 ?auto_1929146 ) ) ( not ( = ?auto_1929147 ?auto_1929150 ) ) ( not ( = ?auto_1929147 ?auto_1929152 ) ) ( not ( = ?auto_1929147 ?auto_1929151 ) ) ( not ( = ?auto_1929147 ?auto_1929153 ) ) ( not ( = ?auto_1929147 ?auto_1929154 ) ) ( not ( = ?auto_1929147 ?auto_1929155 ) ) ( not ( = ?auto_1929148 ?auto_1929149 ) ) ( not ( = ?auto_1929148 ?auto_1929146 ) ) ( not ( = ?auto_1929148 ?auto_1929150 ) ) ( not ( = ?auto_1929148 ?auto_1929152 ) ) ( not ( = ?auto_1929148 ?auto_1929151 ) ) ( not ( = ?auto_1929148 ?auto_1929153 ) ) ( not ( = ?auto_1929148 ?auto_1929154 ) ) ( not ( = ?auto_1929148 ?auto_1929155 ) ) ( not ( = ?auto_1929149 ?auto_1929146 ) ) ( not ( = ?auto_1929149 ?auto_1929150 ) ) ( not ( = ?auto_1929149 ?auto_1929152 ) ) ( not ( = ?auto_1929149 ?auto_1929151 ) ) ( not ( = ?auto_1929149 ?auto_1929153 ) ) ( not ( = ?auto_1929149 ?auto_1929154 ) ) ( not ( = ?auto_1929149 ?auto_1929155 ) ) ( not ( = ?auto_1929146 ?auto_1929150 ) ) ( not ( = ?auto_1929146 ?auto_1929152 ) ) ( not ( = ?auto_1929146 ?auto_1929151 ) ) ( not ( = ?auto_1929146 ?auto_1929153 ) ) ( not ( = ?auto_1929146 ?auto_1929154 ) ) ( not ( = ?auto_1929146 ?auto_1929155 ) ) ( not ( = ?auto_1929150 ?auto_1929152 ) ) ( not ( = ?auto_1929150 ?auto_1929151 ) ) ( not ( = ?auto_1929150 ?auto_1929153 ) ) ( not ( = ?auto_1929150 ?auto_1929154 ) ) ( not ( = ?auto_1929150 ?auto_1929155 ) ) ( not ( = ?auto_1929152 ?auto_1929151 ) ) ( not ( = ?auto_1929152 ?auto_1929153 ) ) ( not ( = ?auto_1929152 ?auto_1929154 ) ) ( not ( = ?auto_1929152 ?auto_1929155 ) ) ( not ( = ?auto_1929151 ?auto_1929153 ) ) ( not ( = ?auto_1929151 ?auto_1929154 ) ) ( not ( = ?auto_1929151 ?auto_1929155 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929153 ?auto_1929154 ?auto_1929155 )
      ( MAKE-9CRATE-VERIFY ?auto_1929147 ?auto_1929148 ?auto_1929149 ?auto_1929146 ?auto_1929150 ?auto_1929152 ?auto_1929151 ?auto_1929153 ?auto_1929154 ?auto_1929155 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929237 - SURFACE
      ?auto_1929238 - SURFACE
      ?auto_1929239 - SURFACE
      ?auto_1929236 - SURFACE
      ?auto_1929240 - SURFACE
      ?auto_1929242 - SURFACE
      ?auto_1929241 - SURFACE
      ?auto_1929243 - SURFACE
      ?auto_1929244 - SURFACE
      ?auto_1929245 - SURFACE
    )
    :vars
    (
      ?auto_1929249 - HOIST
      ?auto_1929247 - PLACE
      ?auto_1929248 - TRUCK
      ?auto_1929246 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929249 ?auto_1929247 ) ( SURFACE-AT ?auto_1929244 ?auto_1929247 ) ( CLEAR ?auto_1929244 ) ( IS-CRATE ?auto_1929245 ) ( not ( = ?auto_1929244 ?auto_1929245 ) ) ( AVAILABLE ?auto_1929249 ) ( IN ?auto_1929245 ?auto_1929248 ) ( ON ?auto_1929244 ?auto_1929243 ) ( not ( = ?auto_1929243 ?auto_1929244 ) ) ( not ( = ?auto_1929243 ?auto_1929245 ) ) ( TRUCK-AT ?auto_1929248 ?auto_1929246 ) ( not ( = ?auto_1929246 ?auto_1929247 ) ) ( ON ?auto_1929238 ?auto_1929237 ) ( ON ?auto_1929239 ?auto_1929238 ) ( ON ?auto_1929236 ?auto_1929239 ) ( ON ?auto_1929240 ?auto_1929236 ) ( ON ?auto_1929242 ?auto_1929240 ) ( ON ?auto_1929241 ?auto_1929242 ) ( ON ?auto_1929243 ?auto_1929241 ) ( not ( = ?auto_1929237 ?auto_1929238 ) ) ( not ( = ?auto_1929237 ?auto_1929239 ) ) ( not ( = ?auto_1929237 ?auto_1929236 ) ) ( not ( = ?auto_1929237 ?auto_1929240 ) ) ( not ( = ?auto_1929237 ?auto_1929242 ) ) ( not ( = ?auto_1929237 ?auto_1929241 ) ) ( not ( = ?auto_1929237 ?auto_1929243 ) ) ( not ( = ?auto_1929237 ?auto_1929244 ) ) ( not ( = ?auto_1929237 ?auto_1929245 ) ) ( not ( = ?auto_1929238 ?auto_1929239 ) ) ( not ( = ?auto_1929238 ?auto_1929236 ) ) ( not ( = ?auto_1929238 ?auto_1929240 ) ) ( not ( = ?auto_1929238 ?auto_1929242 ) ) ( not ( = ?auto_1929238 ?auto_1929241 ) ) ( not ( = ?auto_1929238 ?auto_1929243 ) ) ( not ( = ?auto_1929238 ?auto_1929244 ) ) ( not ( = ?auto_1929238 ?auto_1929245 ) ) ( not ( = ?auto_1929239 ?auto_1929236 ) ) ( not ( = ?auto_1929239 ?auto_1929240 ) ) ( not ( = ?auto_1929239 ?auto_1929242 ) ) ( not ( = ?auto_1929239 ?auto_1929241 ) ) ( not ( = ?auto_1929239 ?auto_1929243 ) ) ( not ( = ?auto_1929239 ?auto_1929244 ) ) ( not ( = ?auto_1929239 ?auto_1929245 ) ) ( not ( = ?auto_1929236 ?auto_1929240 ) ) ( not ( = ?auto_1929236 ?auto_1929242 ) ) ( not ( = ?auto_1929236 ?auto_1929241 ) ) ( not ( = ?auto_1929236 ?auto_1929243 ) ) ( not ( = ?auto_1929236 ?auto_1929244 ) ) ( not ( = ?auto_1929236 ?auto_1929245 ) ) ( not ( = ?auto_1929240 ?auto_1929242 ) ) ( not ( = ?auto_1929240 ?auto_1929241 ) ) ( not ( = ?auto_1929240 ?auto_1929243 ) ) ( not ( = ?auto_1929240 ?auto_1929244 ) ) ( not ( = ?auto_1929240 ?auto_1929245 ) ) ( not ( = ?auto_1929242 ?auto_1929241 ) ) ( not ( = ?auto_1929242 ?auto_1929243 ) ) ( not ( = ?auto_1929242 ?auto_1929244 ) ) ( not ( = ?auto_1929242 ?auto_1929245 ) ) ( not ( = ?auto_1929241 ?auto_1929243 ) ) ( not ( = ?auto_1929241 ?auto_1929244 ) ) ( not ( = ?auto_1929241 ?auto_1929245 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929243 ?auto_1929244 ?auto_1929245 )
      ( MAKE-9CRATE-VERIFY ?auto_1929237 ?auto_1929238 ?auto_1929239 ?auto_1929236 ?auto_1929240 ?auto_1929242 ?auto_1929241 ?auto_1929243 ?auto_1929244 ?auto_1929245 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929336 - SURFACE
      ?auto_1929337 - SURFACE
      ?auto_1929338 - SURFACE
      ?auto_1929335 - SURFACE
      ?auto_1929339 - SURFACE
      ?auto_1929341 - SURFACE
      ?auto_1929340 - SURFACE
      ?auto_1929342 - SURFACE
      ?auto_1929343 - SURFACE
      ?auto_1929344 - SURFACE
    )
    :vars
    (
      ?auto_1929346 - HOIST
      ?auto_1929347 - PLACE
      ?auto_1929345 - TRUCK
      ?auto_1929348 - PLACE
      ?auto_1929349 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929346 ?auto_1929347 ) ( SURFACE-AT ?auto_1929343 ?auto_1929347 ) ( CLEAR ?auto_1929343 ) ( IS-CRATE ?auto_1929344 ) ( not ( = ?auto_1929343 ?auto_1929344 ) ) ( AVAILABLE ?auto_1929346 ) ( ON ?auto_1929343 ?auto_1929342 ) ( not ( = ?auto_1929342 ?auto_1929343 ) ) ( not ( = ?auto_1929342 ?auto_1929344 ) ) ( TRUCK-AT ?auto_1929345 ?auto_1929348 ) ( not ( = ?auto_1929348 ?auto_1929347 ) ) ( HOIST-AT ?auto_1929349 ?auto_1929348 ) ( LIFTING ?auto_1929349 ?auto_1929344 ) ( not ( = ?auto_1929346 ?auto_1929349 ) ) ( ON ?auto_1929337 ?auto_1929336 ) ( ON ?auto_1929338 ?auto_1929337 ) ( ON ?auto_1929335 ?auto_1929338 ) ( ON ?auto_1929339 ?auto_1929335 ) ( ON ?auto_1929341 ?auto_1929339 ) ( ON ?auto_1929340 ?auto_1929341 ) ( ON ?auto_1929342 ?auto_1929340 ) ( not ( = ?auto_1929336 ?auto_1929337 ) ) ( not ( = ?auto_1929336 ?auto_1929338 ) ) ( not ( = ?auto_1929336 ?auto_1929335 ) ) ( not ( = ?auto_1929336 ?auto_1929339 ) ) ( not ( = ?auto_1929336 ?auto_1929341 ) ) ( not ( = ?auto_1929336 ?auto_1929340 ) ) ( not ( = ?auto_1929336 ?auto_1929342 ) ) ( not ( = ?auto_1929336 ?auto_1929343 ) ) ( not ( = ?auto_1929336 ?auto_1929344 ) ) ( not ( = ?auto_1929337 ?auto_1929338 ) ) ( not ( = ?auto_1929337 ?auto_1929335 ) ) ( not ( = ?auto_1929337 ?auto_1929339 ) ) ( not ( = ?auto_1929337 ?auto_1929341 ) ) ( not ( = ?auto_1929337 ?auto_1929340 ) ) ( not ( = ?auto_1929337 ?auto_1929342 ) ) ( not ( = ?auto_1929337 ?auto_1929343 ) ) ( not ( = ?auto_1929337 ?auto_1929344 ) ) ( not ( = ?auto_1929338 ?auto_1929335 ) ) ( not ( = ?auto_1929338 ?auto_1929339 ) ) ( not ( = ?auto_1929338 ?auto_1929341 ) ) ( not ( = ?auto_1929338 ?auto_1929340 ) ) ( not ( = ?auto_1929338 ?auto_1929342 ) ) ( not ( = ?auto_1929338 ?auto_1929343 ) ) ( not ( = ?auto_1929338 ?auto_1929344 ) ) ( not ( = ?auto_1929335 ?auto_1929339 ) ) ( not ( = ?auto_1929335 ?auto_1929341 ) ) ( not ( = ?auto_1929335 ?auto_1929340 ) ) ( not ( = ?auto_1929335 ?auto_1929342 ) ) ( not ( = ?auto_1929335 ?auto_1929343 ) ) ( not ( = ?auto_1929335 ?auto_1929344 ) ) ( not ( = ?auto_1929339 ?auto_1929341 ) ) ( not ( = ?auto_1929339 ?auto_1929340 ) ) ( not ( = ?auto_1929339 ?auto_1929342 ) ) ( not ( = ?auto_1929339 ?auto_1929343 ) ) ( not ( = ?auto_1929339 ?auto_1929344 ) ) ( not ( = ?auto_1929341 ?auto_1929340 ) ) ( not ( = ?auto_1929341 ?auto_1929342 ) ) ( not ( = ?auto_1929341 ?auto_1929343 ) ) ( not ( = ?auto_1929341 ?auto_1929344 ) ) ( not ( = ?auto_1929340 ?auto_1929342 ) ) ( not ( = ?auto_1929340 ?auto_1929343 ) ) ( not ( = ?auto_1929340 ?auto_1929344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929342 ?auto_1929343 ?auto_1929344 )
      ( MAKE-9CRATE-VERIFY ?auto_1929336 ?auto_1929337 ?auto_1929338 ?auto_1929335 ?auto_1929339 ?auto_1929341 ?auto_1929340 ?auto_1929342 ?auto_1929343 ?auto_1929344 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929444 - SURFACE
      ?auto_1929445 - SURFACE
      ?auto_1929446 - SURFACE
      ?auto_1929443 - SURFACE
      ?auto_1929447 - SURFACE
      ?auto_1929449 - SURFACE
      ?auto_1929448 - SURFACE
      ?auto_1929450 - SURFACE
      ?auto_1929451 - SURFACE
      ?auto_1929452 - SURFACE
    )
    :vars
    (
      ?auto_1929453 - HOIST
      ?auto_1929454 - PLACE
      ?auto_1929455 - TRUCK
      ?auto_1929457 - PLACE
      ?auto_1929456 - HOIST
      ?auto_1929458 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929453 ?auto_1929454 ) ( SURFACE-AT ?auto_1929451 ?auto_1929454 ) ( CLEAR ?auto_1929451 ) ( IS-CRATE ?auto_1929452 ) ( not ( = ?auto_1929451 ?auto_1929452 ) ) ( AVAILABLE ?auto_1929453 ) ( ON ?auto_1929451 ?auto_1929450 ) ( not ( = ?auto_1929450 ?auto_1929451 ) ) ( not ( = ?auto_1929450 ?auto_1929452 ) ) ( TRUCK-AT ?auto_1929455 ?auto_1929457 ) ( not ( = ?auto_1929457 ?auto_1929454 ) ) ( HOIST-AT ?auto_1929456 ?auto_1929457 ) ( not ( = ?auto_1929453 ?auto_1929456 ) ) ( AVAILABLE ?auto_1929456 ) ( SURFACE-AT ?auto_1929452 ?auto_1929457 ) ( ON ?auto_1929452 ?auto_1929458 ) ( CLEAR ?auto_1929452 ) ( not ( = ?auto_1929451 ?auto_1929458 ) ) ( not ( = ?auto_1929452 ?auto_1929458 ) ) ( not ( = ?auto_1929450 ?auto_1929458 ) ) ( ON ?auto_1929445 ?auto_1929444 ) ( ON ?auto_1929446 ?auto_1929445 ) ( ON ?auto_1929443 ?auto_1929446 ) ( ON ?auto_1929447 ?auto_1929443 ) ( ON ?auto_1929449 ?auto_1929447 ) ( ON ?auto_1929448 ?auto_1929449 ) ( ON ?auto_1929450 ?auto_1929448 ) ( not ( = ?auto_1929444 ?auto_1929445 ) ) ( not ( = ?auto_1929444 ?auto_1929446 ) ) ( not ( = ?auto_1929444 ?auto_1929443 ) ) ( not ( = ?auto_1929444 ?auto_1929447 ) ) ( not ( = ?auto_1929444 ?auto_1929449 ) ) ( not ( = ?auto_1929444 ?auto_1929448 ) ) ( not ( = ?auto_1929444 ?auto_1929450 ) ) ( not ( = ?auto_1929444 ?auto_1929451 ) ) ( not ( = ?auto_1929444 ?auto_1929452 ) ) ( not ( = ?auto_1929444 ?auto_1929458 ) ) ( not ( = ?auto_1929445 ?auto_1929446 ) ) ( not ( = ?auto_1929445 ?auto_1929443 ) ) ( not ( = ?auto_1929445 ?auto_1929447 ) ) ( not ( = ?auto_1929445 ?auto_1929449 ) ) ( not ( = ?auto_1929445 ?auto_1929448 ) ) ( not ( = ?auto_1929445 ?auto_1929450 ) ) ( not ( = ?auto_1929445 ?auto_1929451 ) ) ( not ( = ?auto_1929445 ?auto_1929452 ) ) ( not ( = ?auto_1929445 ?auto_1929458 ) ) ( not ( = ?auto_1929446 ?auto_1929443 ) ) ( not ( = ?auto_1929446 ?auto_1929447 ) ) ( not ( = ?auto_1929446 ?auto_1929449 ) ) ( not ( = ?auto_1929446 ?auto_1929448 ) ) ( not ( = ?auto_1929446 ?auto_1929450 ) ) ( not ( = ?auto_1929446 ?auto_1929451 ) ) ( not ( = ?auto_1929446 ?auto_1929452 ) ) ( not ( = ?auto_1929446 ?auto_1929458 ) ) ( not ( = ?auto_1929443 ?auto_1929447 ) ) ( not ( = ?auto_1929443 ?auto_1929449 ) ) ( not ( = ?auto_1929443 ?auto_1929448 ) ) ( not ( = ?auto_1929443 ?auto_1929450 ) ) ( not ( = ?auto_1929443 ?auto_1929451 ) ) ( not ( = ?auto_1929443 ?auto_1929452 ) ) ( not ( = ?auto_1929443 ?auto_1929458 ) ) ( not ( = ?auto_1929447 ?auto_1929449 ) ) ( not ( = ?auto_1929447 ?auto_1929448 ) ) ( not ( = ?auto_1929447 ?auto_1929450 ) ) ( not ( = ?auto_1929447 ?auto_1929451 ) ) ( not ( = ?auto_1929447 ?auto_1929452 ) ) ( not ( = ?auto_1929447 ?auto_1929458 ) ) ( not ( = ?auto_1929449 ?auto_1929448 ) ) ( not ( = ?auto_1929449 ?auto_1929450 ) ) ( not ( = ?auto_1929449 ?auto_1929451 ) ) ( not ( = ?auto_1929449 ?auto_1929452 ) ) ( not ( = ?auto_1929449 ?auto_1929458 ) ) ( not ( = ?auto_1929448 ?auto_1929450 ) ) ( not ( = ?auto_1929448 ?auto_1929451 ) ) ( not ( = ?auto_1929448 ?auto_1929452 ) ) ( not ( = ?auto_1929448 ?auto_1929458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929450 ?auto_1929451 ?auto_1929452 )
      ( MAKE-9CRATE-VERIFY ?auto_1929444 ?auto_1929445 ?auto_1929446 ?auto_1929443 ?auto_1929447 ?auto_1929449 ?auto_1929448 ?auto_1929450 ?auto_1929451 ?auto_1929452 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929553 - SURFACE
      ?auto_1929554 - SURFACE
      ?auto_1929555 - SURFACE
      ?auto_1929552 - SURFACE
      ?auto_1929556 - SURFACE
      ?auto_1929558 - SURFACE
      ?auto_1929557 - SURFACE
      ?auto_1929559 - SURFACE
      ?auto_1929560 - SURFACE
      ?auto_1929561 - SURFACE
    )
    :vars
    (
      ?auto_1929567 - HOIST
      ?auto_1929563 - PLACE
      ?auto_1929562 - PLACE
      ?auto_1929565 - HOIST
      ?auto_1929566 - SURFACE
      ?auto_1929564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929567 ?auto_1929563 ) ( SURFACE-AT ?auto_1929560 ?auto_1929563 ) ( CLEAR ?auto_1929560 ) ( IS-CRATE ?auto_1929561 ) ( not ( = ?auto_1929560 ?auto_1929561 ) ) ( AVAILABLE ?auto_1929567 ) ( ON ?auto_1929560 ?auto_1929559 ) ( not ( = ?auto_1929559 ?auto_1929560 ) ) ( not ( = ?auto_1929559 ?auto_1929561 ) ) ( not ( = ?auto_1929562 ?auto_1929563 ) ) ( HOIST-AT ?auto_1929565 ?auto_1929562 ) ( not ( = ?auto_1929567 ?auto_1929565 ) ) ( AVAILABLE ?auto_1929565 ) ( SURFACE-AT ?auto_1929561 ?auto_1929562 ) ( ON ?auto_1929561 ?auto_1929566 ) ( CLEAR ?auto_1929561 ) ( not ( = ?auto_1929560 ?auto_1929566 ) ) ( not ( = ?auto_1929561 ?auto_1929566 ) ) ( not ( = ?auto_1929559 ?auto_1929566 ) ) ( TRUCK-AT ?auto_1929564 ?auto_1929563 ) ( ON ?auto_1929554 ?auto_1929553 ) ( ON ?auto_1929555 ?auto_1929554 ) ( ON ?auto_1929552 ?auto_1929555 ) ( ON ?auto_1929556 ?auto_1929552 ) ( ON ?auto_1929558 ?auto_1929556 ) ( ON ?auto_1929557 ?auto_1929558 ) ( ON ?auto_1929559 ?auto_1929557 ) ( not ( = ?auto_1929553 ?auto_1929554 ) ) ( not ( = ?auto_1929553 ?auto_1929555 ) ) ( not ( = ?auto_1929553 ?auto_1929552 ) ) ( not ( = ?auto_1929553 ?auto_1929556 ) ) ( not ( = ?auto_1929553 ?auto_1929558 ) ) ( not ( = ?auto_1929553 ?auto_1929557 ) ) ( not ( = ?auto_1929553 ?auto_1929559 ) ) ( not ( = ?auto_1929553 ?auto_1929560 ) ) ( not ( = ?auto_1929553 ?auto_1929561 ) ) ( not ( = ?auto_1929553 ?auto_1929566 ) ) ( not ( = ?auto_1929554 ?auto_1929555 ) ) ( not ( = ?auto_1929554 ?auto_1929552 ) ) ( not ( = ?auto_1929554 ?auto_1929556 ) ) ( not ( = ?auto_1929554 ?auto_1929558 ) ) ( not ( = ?auto_1929554 ?auto_1929557 ) ) ( not ( = ?auto_1929554 ?auto_1929559 ) ) ( not ( = ?auto_1929554 ?auto_1929560 ) ) ( not ( = ?auto_1929554 ?auto_1929561 ) ) ( not ( = ?auto_1929554 ?auto_1929566 ) ) ( not ( = ?auto_1929555 ?auto_1929552 ) ) ( not ( = ?auto_1929555 ?auto_1929556 ) ) ( not ( = ?auto_1929555 ?auto_1929558 ) ) ( not ( = ?auto_1929555 ?auto_1929557 ) ) ( not ( = ?auto_1929555 ?auto_1929559 ) ) ( not ( = ?auto_1929555 ?auto_1929560 ) ) ( not ( = ?auto_1929555 ?auto_1929561 ) ) ( not ( = ?auto_1929555 ?auto_1929566 ) ) ( not ( = ?auto_1929552 ?auto_1929556 ) ) ( not ( = ?auto_1929552 ?auto_1929558 ) ) ( not ( = ?auto_1929552 ?auto_1929557 ) ) ( not ( = ?auto_1929552 ?auto_1929559 ) ) ( not ( = ?auto_1929552 ?auto_1929560 ) ) ( not ( = ?auto_1929552 ?auto_1929561 ) ) ( not ( = ?auto_1929552 ?auto_1929566 ) ) ( not ( = ?auto_1929556 ?auto_1929558 ) ) ( not ( = ?auto_1929556 ?auto_1929557 ) ) ( not ( = ?auto_1929556 ?auto_1929559 ) ) ( not ( = ?auto_1929556 ?auto_1929560 ) ) ( not ( = ?auto_1929556 ?auto_1929561 ) ) ( not ( = ?auto_1929556 ?auto_1929566 ) ) ( not ( = ?auto_1929558 ?auto_1929557 ) ) ( not ( = ?auto_1929558 ?auto_1929559 ) ) ( not ( = ?auto_1929558 ?auto_1929560 ) ) ( not ( = ?auto_1929558 ?auto_1929561 ) ) ( not ( = ?auto_1929558 ?auto_1929566 ) ) ( not ( = ?auto_1929557 ?auto_1929559 ) ) ( not ( = ?auto_1929557 ?auto_1929560 ) ) ( not ( = ?auto_1929557 ?auto_1929561 ) ) ( not ( = ?auto_1929557 ?auto_1929566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929559 ?auto_1929560 ?auto_1929561 )
      ( MAKE-9CRATE-VERIFY ?auto_1929553 ?auto_1929554 ?auto_1929555 ?auto_1929552 ?auto_1929556 ?auto_1929558 ?auto_1929557 ?auto_1929559 ?auto_1929560 ?auto_1929561 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929662 - SURFACE
      ?auto_1929663 - SURFACE
      ?auto_1929664 - SURFACE
      ?auto_1929661 - SURFACE
      ?auto_1929665 - SURFACE
      ?auto_1929667 - SURFACE
      ?auto_1929666 - SURFACE
      ?auto_1929668 - SURFACE
      ?auto_1929669 - SURFACE
      ?auto_1929670 - SURFACE
    )
    :vars
    (
      ?auto_1929672 - HOIST
      ?auto_1929675 - PLACE
      ?auto_1929676 - PLACE
      ?auto_1929671 - HOIST
      ?auto_1929674 - SURFACE
      ?auto_1929673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929672 ?auto_1929675 ) ( IS-CRATE ?auto_1929670 ) ( not ( = ?auto_1929669 ?auto_1929670 ) ) ( not ( = ?auto_1929668 ?auto_1929669 ) ) ( not ( = ?auto_1929668 ?auto_1929670 ) ) ( not ( = ?auto_1929676 ?auto_1929675 ) ) ( HOIST-AT ?auto_1929671 ?auto_1929676 ) ( not ( = ?auto_1929672 ?auto_1929671 ) ) ( AVAILABLE ?auto_1929671 ) ( SURFACE-AT ?auto_1929670 ?auto_1929676 ) ( ON ?auto_1929670 ?auto_1929674 ) ( CLEAR ?auto_1929670 ) ( not ( = ?auto_1929669 ?auto_1929674 ) ) ( not ( = ?auto_1929670 ?auto_1929674 ) ) ( not ( = ?auto_1929668 ?auto_1929674 ) ) ( TRUCK-AT ?auto_1929673 ?auto_1929675 ) ( SURFACE-AT ?auto_1929668 ?auto_1929675 ) ( CLEAR ?auto_1929668 ) ( LIFTING ?auto_1929672 ?auto_1929669 ) ( IS-CRATE ?auto_1929669 ) ( ON ?auto_1929663 ?auto_1929662 ) ( ON ?auto_1929664 ?auto_1929663 ) ( ON ?auto_1929661 ?auto_1929664 ) ( ON ?auto_1929665 ?auto_1929661 ) ( ON ?auto_1929667 ?auto_1929665 ) ( ON ?auto_1929666 ?auto_1929667 ) ( ON ?auto_1929668 ?auto_1929666 ) ( not ( = ?auto_1929662 ?auto_1929663 ) ) ( not ( = ?auto_1929662 ?auto_1929664 ) ) ( not ( = ?auto_1929662 ?auto_1929661 ) ) ( not ( = ?auto_1929662 ?auto_1929665 ) ) ( not ( = ?auto_1929662 ?auto_1929667 ) ) ( not ( = ?auto_1929662 ?auto_1929666 ) ) ( not ( = ?auto_1929662 ?auto_1929668 ) ) ( not ( = ?auto_1929662 ?auto_1929669 ) ) ( not ( = ?auto_1929662 ?auto_1929670 ) ) ( not ( = ?auto_1929662 ?auto_1929674 ) ) ( not ( = ?auto_1929663 ?auto_1929664 ) ) ( not ( = ?auto_1929663 ?auto_1929661 ) ) ( not ( = ?auto_1929663 ?auto_1929665 ) ) ( not ( = ?auto_1929663 ?auto_1929667 ) ) ( not ( = ?auto_1929663 ?auto_1929666 ) ) ( not ( = ?auto_1929663 ?auto_1929668 ) ) ( not ( = ?auto_1929663 ?auto_1929669 ) ) ( not ( = ?auto_1929663 ?auto_1929670 ) ) ( not ( = ?auto_1929663 ?auto_1929674 ) ) ( not ( = ?auto_1929664 ?auto_1929661 ) ) ( not ( = ?auto_1929664 ?auto_1929665 ) ) ( not ( = ?auto_1929664 ?auto_1929667 ) ) ( not ( = ?auto_1929664 ?auto_1929666 ) ) ( not ( = ?auto_1929664 ?auto_1929668 ) ) ( not ( = ?auto_1929664 ?auto_1929669 ) ) ( not ( = ?auto_1929664 ?auto_1929670 ) ) ( not ( = ?auto_1929664 ?auto_1929674 ) ) ( not ( = ?auto_1929661 ?auto_1929665 ) ) ( not ( = ?auto_1929661 ?auto_1929667 ) ) ( not ( = ?auto_1929661 ?auto_1929666 ) ) ( not ( = ?auto_1929661 ?auto_1929668 ) ) ( not ( = ?auto_1929661 ?auto_1929669 ) ) ( not ( = ?auto_1929661 ?auto_1929670 ) ) ( not ( = ?auto_1929661 ?auto_1929674 ) ) ( not ( = ?auto_1929665 ?auto_1929667 ) ) ( not ( = ?auto_1929665 ?auto_1929666 ) ) ( not ( = ?auto_1929665 ?auto_1929668 ) ) ( not ( = ?auto_1929665 ?auto_1929669 ) ) ( not ( = ?auto_1929665 ?auto_1929670 ) ) ( not ( = ?auto_1929665 ?auto_1929674 ) ) ( not ( = ?auto_1929667 ?auto_1929666 ) ) ( not ( = ?auto_1929667 ?auto_1929668 ) ) ( not ( = ?auto_1929667 ?auto_1929669 ) ) ( not ( = ?auto_1929667 ?auto_1929670 ) ) ( not ( = ?auto_1929667 ?auto_1929674 ) ) ( not ( = ?auto_1929666 ?auto_1929668 ) ) ( not ( = ?auto_1929666 ?auto_1929669 ) ) ( not ( = ?auto_1929666 ?auto_1929670 ) ) ( not ( = ?auto_1929666 ?auto_1929674 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929668 ?auto_1929669 ?auto_1929670 )
      ( MAKE-9CRATE-VERIFY ?auto_1929662 ?auto_1929663 ?auto_1929664 ?auto_1929661 ?auto_1929665 ?auto_1929667 ?auto_1929666 ?auto_1929668 ?auto_1929669 ?auto_1929670 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1929771 - SURFACE
      ?auto_1929772 - SURFACE
      ?auto_1929773 - SURFACE
      ?auto_1929770 - SURFACE
      ?auto_1929774 - SURFACE
      ?auto_1929776 - SURFACE
      ?auto_1929775 - SURFACE
      ?auto_1929777 - SURFACE
      ?auto_1929778 - SURFACE
      ?auto_1929779 - SURFACE
    )
    :vars
    (
      ?auto_1929781 - HOIST
      ?auto_1929784 - PLACE
      ?auto_1929783 - PLACE
      ?auto_1929782 - HOIST
      ?auto_1929780 - SURFACE
      ?auto_1929785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1929781 ?auto_1929784 ) ( IS-CRATE ?auto_1929779 ) ( not ( = ?auto_1929778 ?auto_1929779 ) ) ( not ( = ?auto_1929777 ?auto_1929778 ) ) ( not ( = ?auto_1929777 ?auto_1929779 ) ) ( not ( = ?auto_1929783 ?auto_1929784 ) ) ( HOIST-AT ?auto_1929782 ?auto_1929783 ) ( not ( = ?auto_1929781 ?auto_1929782 ) ) ( AVAILABLE ?auto_1929782 ) ( SURFACE-AT ?auto_1929779 ?auto_1929783 ) ( ON ?auto_1929779 ?auto_1929780 ) ( CLEAR ?auto_1929779 ) ( not ( = ?auto_1929778 ?auto_1929780 ) ) ( not ( = ?auto_1929779 ?auto_1929780 ) ) ( not ( = ?auto_1929777 ?auto_1929780 ) ) ( TRUCK-AT ?auto_1929785 ?auto_1929784 ) ( SURFACE-AT ?auto_1929777 ?auto_1929784 ) ( CLEAR ?auto_1929777 ) ( IS-CRATE ?auto_1929778 ) ( AVAILABLE ?auto_1929781 ) ( IN ?auto_1929778 ?auto_1929785 ) ( ON ?auto_1929772 ?auto_1929771 ) ( ON ?auto_1929773 ?auto_1929772 ) ( ON ?auto_1929770 ?auto_1929773 ) ( ON ?auto_1929774 ?auto_1929770 ) ( ON ?auto_1929776 ?auto_1929774 ) ( ON ?auto_1929775 ?auto_1929776 ) ( ON ?auto_1929777 ?auto_1929775 ) ( not ( = ?auto_1929771 ?auto_1929772 ) ) ( not ( = ?auto_1929771 ?auto_1929773 ) ) ( not ( = ?auto_1929771 ?auto_1929770 ) ) ( not ( = ?auto_1929771 ?auto_1929774 ) ) ( not ( = ?auto_1929771 ?auto_1929776 ) ) ( not ( = ?auto_1929771 ?auto_1929775 ) ) ( not ( = ?auto_1929771 ?auto_1929777 ) ) ( not ( = ?auto_1929771 ?auto_1929778 ) ) ( not ( = ?auto_1929771 ?auto_1929779 ) ) ( not ( = ?auto_1929771 ?auto_1929780 ) ) ( not ( = ?auto_1929772 ?auto_1929773 ) ) ( not ( = ?auto_1929772 ?auto_1929770 ) ) ( not ( = ?auto_1929772 ?auto_1929774 ) ) ( not ( = ?auto_1929772 ?auto_1929776 ) ) ( not ( = ?auto_1929772 ?auto_1929775 ) ) ( not ( = ?auto_1929772 ?auto_1929777 ) ) ( not ( = ?auto_1929772 ?auto_1929778 ) ) ( not ( = ?auto_1929772 ?auto_1929779 ) ) ( not ( = ?auto_1929772 ?auto_1929780 ) ) ( not ( = ?auto_1929773 ?auto_1929770 ) ) ( not ( = ?auto_1929773 ?auto_1929774 ) ) ( not ( = ?auto_1929773 ?auto_1929776 ) ) ( not ( = ?auto_1929773 ?auto_1929775 ) ) ( not ( = ?auto_1929773 ?auto_1929777 ) ) ( not ( = ?auto_1929773 ?auto_1929778 ) ) ( not ( = ?auto_1929773 ?auto_1929779 ) ) ( not ( = ?auto_1929773 ?auto_1929780 ) ) ( not ( = ?auto_1929770 ?auto_1929774 ) ) ( not ( = ?auto_1929770 ?auto_1929776 ) ) ( not ( = ?auto_1929770 ?auto_1929775 ) ) ( not ( = ?auto_1929770 ?auto_1929777 ) ) ( not ( = ?auto_1929770 ?auto_1929778 ) ) ( not ( = ?auto_1929770 ?auto_1929779 ) ) ( not ( = ?auto_1929770 ?auto_1929780 ) ) ( not ( = ?auto_1929774 ?auto_1929776 ) ) ( not ( = ?auto_1929774 ?auto_1929775 ) ) ( not ( = ?auto_1929774 ?auto_1929777 ) ) ( not ( = ?auto_1929774 ?auto_1929778 ) ) ( not ( = ?auto_1929774 ?auto_1929779 ) ) ( not ( = ?auto_1929774 ?auto_1929780 ) ) ( not ( = ?auto_1929776 ?auto_1929775 ) ) ( not ( = ?auto_1929776 ?auto_1929777 ) ) ( not ( = ?auto_1929776 ?auto_1929778 ) ) ( not ( = ?auto_1929776 ?auto_1929779 ) ) ( not ( = ?auto_1929776 ?auto_1929780 ) ) ( not ( = ?auto_1929775 ?auto_1929777 ) ) ( not ( = ?auto_1929775 ?auto_1929778 ) ) ( not ( = ?auto_1929775 ?auto_1929779 ) ) ( not ( = ?auto_1929775 ?auto_1929780 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1929777 ?auto_1929778 ?auto_1929779 )
      ( MAKE-9CRATE-VERIFY ?auto_1929771 ?auto_1929772 ?auto_1929773 ?auto_1929770 ?auto_1929774 ?auto_1929776 ?auto_1929775 ?auto_1929777 ?auto_1929778 ?auto_1929779 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935318 - SURFACE
      ?auto_1935319 - SURFACE
      ?auto_1935320 - SURFACE
      ?auto_1935317 - SURFACE
      ?auto_1935321 - SURFACE
      ?auto_1935323 - SURFACE
      ?auto_1935322 - SURFACE
      ?auto_1935324 - SURFACE
      ?auto_1935325 - SURFACE
      ?auto_1935326 - SURFACE
      ?auto_1935327 - SURFACE
    )
    :vars
    (
      ?auto_1935328 - HOIST
      ?auto_1935329 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935328 ?auto_1935329 ) ( SURFACE-AT ?auto_1935326 ?auto_1935329 ) ( CLEAR ?auto_1935326 ) ( LIFTING ?auto_1935328 ?auto_1935327 ) ( IS-CRATE ?auto_1935327 ) ( not ( = ?auto_1935326 ?auto_1935327 ) ) ( ON ?auto_1935319 ?auto_1935318 ) ( ON ?auto_1935320 ?auto_1935319 ) ( ON ?auto_1935317 ?auto_1935320 ) ( ON ?auto_1935321 ?auto_1935317 ) ( ON ?auto_1935323 ?auto_1935321 ) ( ON ?auto_1935322 ?auto_1935323 ) ( ON ?auto_1935324 ?auto_1935322 ) ( ON ?auto_1935325 ?auto_1935324 ) ( ON ?auto_1935326 ?auto_1935325 ) ( not ( = ?auto_1935318 ?auto_1935319 ) ) ( not ( = ?auto_1935318 ?auto_1935320 ) ) ( not ( = ?auto_1935318 ?auto_1935317 ) ) ( not ( = ?auto_1935318 ?auto_1935321 ) ) ( not ( = ?auto_1935318 ?auto_1935323 ) ) ( not ( = ?auto_1935318 ?auto_1935322 ) ) ( not ( = ?auto_1935318 ?auto_1935324 ) ) ( not ( = ?auto_1935318 ?auto_1935325 ) ) ( not ( = ?auto_1935318 ?auto_1935326 ) ) ( not ( = ?auto_1935318 ?auto_1935327 ) ) ( not ( = ?auto_1935319 ?auto_1935320 ) ) ( not ( = ?auto_1935319 ?auto_1935317 ) ) ( not ( = ?auto_1935319 ?auto_1935321 ) ) ( not ( = ?auto_1935319 ?auto_1935323 ) ) ( not ( = ?auto_1935319 ?auto_1935322 ) ) ( not ( = ?auto_1935319 ?auto_1935324 ) ) ( not ( = ?auto_1935319 ?auto_1935325 ) ) ( not ( = ?auto_1935319 ?auto_1935326 ) ) ( not ( = ?auto_1935319 ?auto_1935327 ) ) ( not ( = ?auto_1935320 ?auto_1935317 ) ) ( not ( = ?auto_1935320 ?auto_1935321 ) ) ( not ( = ?auto_1935320 ?auto_1935323 ) ) ( not ( = ?auto_1935320 ?auto_1935322 ) ) ( not ( = ?auto_1935320 ?auto_1935324 ) ) ( not ( = ?auto_1935320 ?auto_1935325 ) ) ( not ( = ?auto_1935320 ?auto_1935326 ) ) ( not ( = ?auto_1935320 ?auto_1935327 ) ) ( not ( = ?auto_1935317 ?auto_1935321 ) ) ( not ( = ?auto_1935317 ?auto_1935323 ) ) ( not ( = ?auto_1935317 ?auto_1935322 ) ) ( not ( = ?auto_1935317 ?auto_1935324 ) ) ( not ( = ?auto_1935317 ?auto_1935325 ) ) ( not ( = ?auto_1935317 ?auto_1935326 ) ) ( not ( = ?auto_1935317 ?auto_1935327 ) ) ( not ( = ?auto_1935321 ?auto_1935323 ) ) ( not ( = ?auto_1935321 ?auto_1935322 ) ) ( not ( = ?auto_1935321 ?auto_1935324 ) ) ( not ( = ?auto_1935321 ?auto_1935325 ) ) ( not ( = ?auto_1935321 ?auto_1935326 ) ) ( not ( = ?auto_1935321 ?auto_1935327 ) ) ( not ( = ?auto_1935323 ?auto_1935322 ) ) ( not ( = ?auto_1935323 ?auto_1935324 ) ) ( not ( = ?auto_1935323 ?auto_1935325 ) ) ( not ( = ?auto_1935323 ?auto_1935326 ) ) ( not ( = ?auto_1935323 ?auto_1935327 ) ) ( not ( = ?auto_1935322 ?auto_1935324 ) ) ( not ( = ?auto_1935322 ?auto_1935325 ) ) ( not ( = ?auto_1935322 ?auto_1935326 ) ) ( not ( = ?auto_1935322 ?auto_1935327 ) ) ( not ( = ?auto_1935324 ?auto_1935325 ) ) ( not ( = ?auto_1935324 ?auto_1935326 ) ) ( not ( = ?auto_1935324 ?auto_1935327 ) ) ( not ( = ?auto_1935325 ?auto_1935326 ) ) ( not ( = ?auto_1935325 ?auto_1935327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1935326 ?auto_1935327 )
      ( MAKE-10CRATE-VERIFY ?auto_1935318 ?auto_1935319 ?auto_1935320 ?auto_1935317 ?auto_1935321 ?auto_1935323 ?auto_1935322 ?auto_1935324 ?auto_1935325 ?auto_1935326 ?auto_1935327 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935412 - SURFACE
      ?auto_1935413 - SURFACE
      ?auto_1935414 - SURFACE
      ?auto_1935411 - SURFACE
      ?auto_1935415 - SURFACE
      ?auto_1935417 - SURFACE
      ?auto_1935416 - SURFACE
      ?auto_1935418 - SURFACE
      ?auto_1935419 - SURFACE
      ?auto_1935420 - SURFACE
      ?auto_1935421 - SURFACE
    )
    :vars
    (
      ?auto_1935423 - HOIST
      ?auto_1935424 - PLACE
      ?auto_1935422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935423 ?auto_1935424 ) ( SURFACE-AT ?auto_1935420 ?auto_1935424 ) ( CLEAR ?auto_1935420 ) ( IS-CRATE ?auto_1935421 ) ( not ( = ?auto_1935420 ?auto_1935421 ) ) ( TRUCK-AT ?auto_1935422 ?auto_1935424 ) ( AVAILABLE ?auto_1935423 ) ( IN ?auto_1935421 ?auto_1935422 ) ( ON ?auto_1935420 ?auto_1935419 ) ( not ( = ?auto_1935419 ?auto_1935420 ) ) ( not ( = ?auto_1935419 ?auto_1935421 ) ) ( ON ?auto_1935413 ?auto_1935412 ) ( ON ?auto_1935414 ?auto_1935413 ) ( ON ?auto_1935411 ?auto_1935414 ) ( ON ?auto_1935415 ?auto_1935411 ) ( ON ?auto_1935417 ?auto_1935415 ) ( ON ?auto_1935416 ?auto_1935417 ) ( ON ?auto_1935418 ?auto_1935416 ) ( ON ?auto_1935419 ?auto_1935418 ) ( not ( = ?auto_1935412 ?auto_1935413 ) ) ( not ( = ?auto_1935412 ?auto_1935414 ) ) ( not ( = ?auto_1935412 ?auto_1935411 ) ) ( not ( = ?auto_1935412 ?auto_1935415 ) ) ( not ( = ?auto_1935412 ?auto_1935417 ) ) ( not ( = ?auto_1935412 ?auto_1935416 ) ) ( not ( = ?auto_1935412 ?auto_1935418 ) ) ( not ( = ?auto_1935412 ?auto_1935419 ) ) ( not ( = ?auto_1935412 ?auto_1935420 ) ) ( not ( = ?auto_1935412 ?auto_1935421 ) ) ( not ( = ?auto_1935413 ?auto_1935414 ) ) ( not ( = ?auto_1935413 ?auto_1935411 ) ) ( not ( = ?auto_1935413 ?auto_1935415 ) ) ( not ( = ?auto_1935413 ?auto_1935417 ) ) ( not ( = ?auto_1935413 ?auto_1935416 ) ) ( not ( = ?auto_1935413 ?auto_1935418 ) ) ( not ( = ?auto_1935413 ?auto_1935419 ) ) ( not ( = ?auto_1935413 ?auto_1935420 ) ) ( not ( = ?auto_1935413 ?auto_1935421 ) ) ( not ( = ?auto_1935414 ?auto_1935411 ) ) ( not ( = ?auto_1935414 ?auto_1935415 ) ) ( not ( = ?auto_1935414 ?auto_1935417 ) ) ( not ( = ?auto_1935414 ?auto_1935416 ) ) ( not ( = ?auto_1935414 ?auto_1935418 ) ) ( not ( = ?auto_1935414 ?auto_1935419 ) ) ( not ( = ?auto_1935414 ?auto_1935420 ) ) ( not ( = ?auto_1935414 ?auto_1935421 ) ) ( not ( = ?auto_1935411 ?auto_1935415 ) ) ( not ( = ?auto_1935411 ?auto_1935417 ) ) ( not ( = ?auto_1935411 ?auto_1935416 ) ) ( not ( = ?auto_1935411 ?auto_1935418 ) ) ( not ( = ?auto_1935411 ?auto_1935419 ) ) ( not ( = ?auto_1935411 ?auto_1935420 ) ) ( not ( = ?auto_1935411 ?auto_1935421 ) ) ( not ( = ?auto_1935415 ?auto_1935417 ) ) ( not ( = ?auto_1935415 ?auto_1935416 ) ) ( not ( = ?auto_1935415 ?auto_1935418 ) ) ( not ( = ?auto_1935415 ?auto_1935419 ) ) ( not ( = ?auto_1935415 ?auto_1935420 ) ) ( not ( = ?auto_1935415 ?auto_1935421 ) ) ( not ( = ?auto_1935417 ?auto_1935416 ) ) ( not ( = ?auto_1935417 ?auto_1935418 ) ) ( not ( = ?auto_1935417 ?auto_1935419 ) ) ( not ( = ?auto_1935417 ?auto_1935420 ) ) ( not ( = ?auto_1935417 ?auto_1935421 ) ) ( not ( = ?auto_1935416 ?auto_1935418 ) ) ( not ( = ?auto_1935416 ?auto_1935419 ) ) ( not ( = ?auto_1935416 ?auto_1935420 ) ) ( not ( = ?auto_1935416 ?auto_1935421 ) ) ( not ( = ?auto_1935418 ?auto_1935419 ) ) ( not ( = ?auto_1935418 ?auto_1935420 ) ) ( not ( = ?auto_1935418 ?auto_1935421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935419 ?auto_1935420 ?auto_1935421 )
      ( MAKE-10CRATE-VERIFY ?auto_1935412 ?auto_1935413 ?auto_1935414 ?auto_1935411 ?auto_1935415 ?auto_1935417 ?auto_1935416 ?auto_1935418 ?auto_1935419 ?auto_1935420 ?auto_1935421 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935517 - SURFACE
      ?auto_1935518 - SURFACE
      ?auto_1935519 - SURFACE
      ?auto_1935516 - SURFACE
      ?auto_1935520 - SURFACE
      ?auto_1935522 - SURFACE
      ?auto_1935521 - SURFACE
      ?auto_1935523 - SURFACE
      ?auto_1935524 - SURFACE
      ?auto_1935525 - SURFACE
      ?auto_1935526 - SURFACE
    )
    :vars
    (
      ?auto_1935528 - HOIST
      ?auto_1935529 - PLACE
      ?auto_1935530 - TRUCK
      ?auto_1935527 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935528 ?auto_1935529 ) ( SURFACE-AT ?auto_1935525 ?auto_1935529 ) ( CLEAR ?auto_1935525 ) ( IS-CRATE ?auto_1935526 ) ( not ( = ?auto_1935525 ?auto_1935526 ) ) ( AVAILABLE ?auto_1935528 ) ( IN ?auto_1935526 ?auto_1935530 ) ( ON ?auto_1935525 ?auto_1935524 ) ( not ( = ?auto_1935524 ?auto_1935525 ) ) ( not ( = ?auto_1935524 ?auto_1935526 ) ) ( TRUCK-AT ?auto_1935530 ?auto_1935527 ) ( not ( = ?auto_1935527 ?auto_1935529 ) ) ( ON ?auto_1935518 ?auto_1935517 ) ( ON ?auto_1935519 ?auto_1935518 ) ( ON ?auto_1935516 ?auto_1935519 ) ( ON ?auto_1935520 ?auto_1935516 ) ( ON ?auto_1935522 ?auto_1935520 ) ( ON ?auto_1935521 ?auto_1935522 ) ( ON ?auto_1935523 ?auto_1935521 ) ( ON ?auto_1935524 ?auto_1935523 ) ( not ( = ?auto_1935517 ?auto_1935518 ) ) ( not ( = ?auto_1935517 ?auto_1935519 ) ) ( not ( = ?auto_1935517 ?auto_1935516 ) ) ( not ( = ?auto_1935517 ?auto_1935520 ) ) ( not ( = ?auto_1935517 ?auto_1935522 ) ) ( not ( = ?auto_1935517 ?auto_1935521 ) ) ( not ( = ?auto_1935517 ?auto_1935523 ) ) ( not ( = ?auto_1935517 ?auto_1935524 ) ) ( not ( = ?auto_1935517 ?auto_1935525 ) ) ( not ( = ?auto_1935517 ?auto_1935526 ) ) ( not ( = ?auto_1935518 ?auto_1935519 ) ) ( not ( = ?auto_1935518 ?auto_1935516 ) ) ( not ( = ?auto_1935518 ?auto_1935520 ) ) ( not ( = ?auto_1935518 ?auto_1935522 ) ) ( not ( = ?auto_1935518 ?auto_1935521 ) ) ( not ( = ?auto_1935518 ?auto_1935523 ) ) ( not ( = ?auto_1935518 ?auto_1935524 ) ) ( not ( = ?auto_1935518 ?auto_1935525 ) ) ( not ( = ?auto_1935518 ?auto_1935526 ) ) ( not ( = ?auto_1935519 ?auto_1935516 ) ) ( not ( = ?auto_1935519 ?auto_1935520 ) ) ( not ( = ?auto_1935519 ?auto_1935522 ) ) ( not ( = ?auto_1935519 ?auto_1935521 ) ) ( not ( = ?auto_1935519 ?auto_1935523 ) ) ( not ( = ?auto_1935519 ?auto_1935524 ) ) ( not ( = ?auto_1935519 ?auto_1935525 ) ) ( not ( = ?auto_1935519 ?auto_1935526 ) ) ( not ( = ?auto_1935516 ?auto_1935520 ) ) ( not ( = ?auto_1935516 ?auto_1935522 ) ) ( not ( = ?auto_1935516 ?auto_1935521 ) ) ( not ( = ?auto_1935516 ?auto_1935523 ) ) ( not ( = ?auto_1935516 ?auto_1935524 ) ) ( not ( = ?auto_1935516 ?auto_1935525 ) ) ( not ( = ?auto_1935516 ?auto_1935526 ) ) ( not ( = ?auto_1935520 ?auto_1935522 ) ) ( not ( = ?auto_1935520 ?auto_1935521 ) ) ( not ( = ?auto_1935520 ?auto_1935523 ) ) ( not ( = ?auto_1935520 ?auto_1935524 ) ) ( not ( = ?auto_1935520 ?auto_1935525 ) ) ( not ( = ?auto_1935520 ?auto_1935526 ) ) ( not ( = ?auto_1935522 ?auto_1935521 ) ) ( not ( = ?auto_1935522 ?auto_1935523 ) ) ( not ( = ?auto_1935522 ?auto_1935524 ) ) ( not ( = ?auto_1935522 ?auto_1935525 ) ) ( not ( = ?auto_1935522 ?auto_1935526 ) ) ( not ( = ?auto_1935521 ?auto_1935523 ) ) ( not ( = ?auto_1935521 ?auto_1935524 ) ) ( not ( = ?auto_1935521 ?auto_1935525 ) ) ( not ( = ?auto_1935521 ?auto_1935526 ) ) ( not ( = ?auto_1935523 ?auto_1935524 ) ) ( not ( = ?auto_1935523 ?auto_1935525 ) ) ( not ( = ?auto_1935523 ?auto_1935526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935524 ?auto_1935525 ?auto_1935526 )
      ( MAKE-10CRATE-VERIFY ?auto_1935517 ?auto_1935518 ?auto_1935519 ?auto_1935516 ?auto_1935520 ?auto_1935522 ?auto_1935521 ?auto_1935523 ?auto_1935524 ?auto_1935525 ?auto_1935526 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935632 - SURFACE
      ?auto_1935633 - SURFACE
      ?auto_1935634 - SURFACE
      ?auto_1935631 - SURFACE
      ?auto_1935635 - SURFACE
      ?auto_1935637 - SURFACE
      ?auto_1935636 - SURFACE
      ?auto_1935638 - SURFACE
      ?auto_1935639 - SURFACE
      ?auto_1935640 - SURFACE
      ?auto_1935641 - SURFACE
    )
    :vars
    (
      ?auto_1935643 - HOIST
      ?auto_1935646 - PLACE
      ?auto_1935642 - TRUCK
      ?auto_1935644 - PLACE
      ?auto_1935645 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935643 ?auto_1935646 ) ( SURFACE-AT ?auto_1935640 ?auto_1935646 ) ( CLEAR ?auto_1935640 ) ( IS-CRATE ?auto_1935641 ) ( not ( = ?auto_1935640 ?auto_1935641 ) ) ( AVAILABLE ?auto_1935643 ) ( ON ?auto_1935640 ?auto_1935639 ) ( not ( = ?auto_1935639 ?auto_1935640 ) ) ( not ( = ?auto_1935639 ?auto_1935641 ) ) ( TRUCK-AT ?auto_1935642 ?auto_1935644 ) ( not ( = ?auto_1935644 ?auto_1935646 ) ) ( HOIST-AT ?auto_1935645 ?auto_1935644 ) ( LIFTING ?auto_1935645 ?auto_1935641 ) ( not ( = ?auto_1935643 ?auto_1935645 ) ) ( ON ?auto_1935633 ?auto_1935632 ) ( ON ?auto_1935634 ?auto_1935633 ) ( ON ?auto_1935631 ?auto_1935634 ) ( ON ?auto_1935635 ?auto_1935631 ) ( ON ?auto_1935637 ?auto_1935635 ) ( ON ?auto_1935636 ?auto_1935637 ) ( ON ?auto_1935638 ?auto_1935636 ) ( ON ?auto_1935639 ?auto_1935638 ) ( not ( = ?auto_1935632 ?auto_1935633 ) ) ( not ( = ?auto_1935632 ?auto_1935634 ) ) ( not ( = ?auto_1935632 ?auto_1935631 ) ) ( not ( = ?auto_1935632 ?auto_1935635 ) ) ( not ( = ?auto_1935632 ?auto_1935637 ) ) ( not ( = ?auto_1935632 ?auto_1935636 ) ) ( not ( = ?auto_1935632 ?auto_1935638 ) ) ( not ( = ?auto_1935632 ?auto_1935639 ) ) ( not ( = ?auto_1935632 ?auto_1935640 ) ) ( not ( = ?auto_1935632 ?auto_1935641 ) ) ( not ( = ?auto_1935633 ?auto_1935634 ) ) ( not ( = ?auto_1935633 ?auto_1935631 ) ) ( not ( = ?auto_1935633 ?auto_1935635 ) ) ( not ( = ?auto_1935633 ?auto_1935637 ) ) ( not ( = ?auto_1935633 ?auto_1935636 ) ) ( not ( = ?auto_1935633 ?auto_1935638 ) ) ( not ( = ?auto_1935633 ?auto_1935639 ) ) ( not ( = ?auto_1935633 ?auto_1935640 ) ) ( not ( = ?auto_1935633 ?auto_1935641 ) ) ( not ( = ?auto_1935634 ?auto_1935631 ) ) ( not ( = ?auto_1935634 ?auto_1935635 ) ) ( not ( = ?auto_1935634 ?auto_1935637 ) ) ( not ( = ?auto_1935634 ?auto_1935636 ) ) ( not ( = ?auto_1935634 ?auto_1935638 ) ) ( not ( = ?auto_1935634 ?auto_1935639 ) ) ( not ( = ?auto_1935634 ?auto_1935640 ) ) ( not ( = ?auto_1935634 ?auto_1935641 ) ) ( not ( = ?auto_1935631 ?auto_1935635 ) ) ( not ( = ?auto_1935631 ?auto_1935637 ) ) ( not ( = ?auto_1935631 ?auto_1935636 ) ) ( not ( = ?auto_1935631 ?auto_1935638 ) ) ( not ( = ?auto_1935631 ?auto_1935639 ) ) ( not ( = ?auto_1935631 ?auto_1935640 ) ) ( not ( = ?auto_1935631 ?auto_1935641 ) ) ( not ( = ?auto_1935635 ?auto_1935637 ) ) ( not ( = ?auto_1935635 ?auto_1935636 ) ) ( not ( = ?auto_1935635 ?auto_1935638 ) ) ( not ( = ?auto_1935635 ?auto_1935639 ) ) ( not ( = ?auto_1935635 ?auto_1935640 ) ) ( not ( = ?auto_1935635 ?auto_1935641 ) ) ( not ( = ?auto_1935637 ?auto_1935636 ) ) ( not ( = ?auto_1935637 ?auto_1935638 ) ) ( not ( = ?auto_1935637 ?auto_1935639 ) ) ( not ( = ?auto_1935637 ?auto_1935640 ) ) ( not ( = ?auto_1935637 ?auto_1935641 ) ) ( not ( = ?auto_1935636 ?auto_1935638 ) ) ( not ( = ?auto_1935636 ?auto_1935639 ) ) ( not ( = ?auto_1935636 ?auto_1935640 ) ) ( not ( = ?auto_1935636 ?auto_1935641 ) ) ( not ( = ?auto_1935638 ?auto_1935639 ) ) ( not ( = ?auto_1935638 ?auto_1935640 ) ) ( not ( = ?auto_1935638 ?auto_1935641 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935639 ?auto_1935640 ?auto_1935641 )
      ( MAKE-10CRATE-VERIFY ?auto_1935632 ?auto_1935633 ?auto_1935634 ?auto_1935631 ?auto_1935635 ?auto_1935637 ?auto_1935636 ?auto_1935638 ?auto_1935639 ?auto_1935640 ?auto_1935641 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935757 - SURFACE
      ?auto_1935758 - SURFACE
      ?auto_1935759 - SURFACE
      ?auto_1935756 - SURFACE
      ?auto_1935760 - SURFACE
      ?auto_1935762 - SURFACE
      ?auto_1935761 - SURFACE
      ?auto_1935763 - SURFACE
      ?auto_1935764 - SURFACE
      ?auto_1935765 - SURFACE
      ?auto_1935766 - SURFACE
    )
    :vars
    (
      ?auto_1935772 - HOIST
      ?auto_1935770 - PLACE
      ?auto_1935767 - TRUCK
      ?auto_1935771 - PLACE
      ?auto_1935769 - HOIST
      ?auto_1935768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935772 ?auto_1935770 ) ( SURFACE-AT ?auto_1935765 ?auto_1935770 ) ( CLEAR ?auto_1935765 ) ( IS-CRATE ?auto_1935766 ) ( not ( = ?auto_1935765 ?auto_1935766 ) ) ( AVAILABLE ?auto_1935772 ) ( ON ?auto_1935765 ?auto_1935764 ) ( not ( = ?auto_1935764 ?auto_1935765 ) ) ( not ( = ?auto_1935764 ?auto_1935766 ) ) ( TRUCK-AT ?auto_1935767 ?auto_1935771 ) ( not ( = ?auto_1935771 ?auto_1935770 ) ) ( HOIST-AT ?auto_1935769 ?auto_1935771 ) ( not ( = ?auto_1935772 ?auto_1935769 ) ) ( AVAILABLE ?auto_1935769 ) ( SURFACE-AT ?auto_1935766 ?auto_1935771 ) ( ON ?auto_1935766 ?auto_1935768 ) ( CLEAR ?auto_1935766 ) ( not ( = ?auto_1935765 ?auto_1935768 ) ) ( not ( = ?auto_1935766 ?auto_1935768 ) ) ( not ( = ?auto_1935764 ?auto_1935768 ) ) ( ON ?auto_1935758 ?auto_1935757 ) ( ON ?auto_1935759 ?auto_1935758 ) ( ON ?auto_1935756 ?auto_1935759 ) ( ON ?auto_1935760 ?auto_1935756 ) ( ON ?auto_1935762 ?auto_1935760 ) ( ON ?auto_1935761 ?auto_1935762 ) ( ON ?auto_1935763 ?auto_1935761 ) ( ON ?auto_1935764 ?auto_1935763 ) ( not ( = ?auto_1935757 ?auto_1935758 ) ) ( not ( = ?auto_1935757 ?auto_1935759 ) ) ( not ( = ?auto_1935757 ?auto_1935756 ) ) ( not ( = ?auto_1935757 ?auto_1935760 ) ) ( not ( = ?auto_1935757 ?auto_1935762 ) ) ( not ( = ?auto_1935757 ?auto_1935761 ) ) ( not ( = ?auto_1935757 ?auto_1935763 ) ) ( not ( = ?auto_1935757 ?auto_1935764 ) ) ( not ( = ?auto_1935757 ?auto_1935765 ) ) ( not ( = ?auto_1935757 ?auto_1935766 ) ) ( not ( = ?auto_1935757 ?auto_1935768 ) ) ( not ( = ?auto_1935758 ?auto_1935759 ) ) ( not ( = ?auto_1935758 ?auto_1935756 ) ) ( not ( = ?auto_1935758 ?auto_1935760 ) ) ( not ( = ?auto_1935758 ?auto_1935762 ) ) ( not ( = ?auto_1935758 ?auto_1935761 ) ) ( not ( = ?auto_1935758 ?auto_1935763 ) ) ( not ( = ?auto_1935758 ?auto_1935764 ) ) ( not ( = ?auto_1935758 ?auto_1935765 ) ) ( not ( = ?auto_1935758 ?auto_1935766 ) ) ( not ( = ?auto_1935758 ?auto_1935768 ) ) ( not ( = ?auto_1935759 ?auto_1935756 ) ) ( not ( = ?auto_1935759 ?auto_1935760 ) ) ( not ( = ?auto_1935759 ?auto_1935762 ) ) ( not ( = ?auto_1935759 ?auto_1935761 ) ) ( not ( = ?auto_1935759 ?auto_1935763 ) ) ( not ( = ?auto_1935759 ?auto_1935764 ) ) ( not ( = ?auto_1935759 ?auto_1935765 ) ) ( not ( = ?auto_1935759 ?auto_1935766 ) ) ( not ( = ?auto_1935759 ?auto_1935768 ) ) ( not ( = ?auto_1935756 ?auto_1935760 ) ) ( not ( = ?auto_1935756 ?auto_1935762 ) ) ( not ( = ?auto_1935756 ?auto_1935761 ) ) ( not ( = ?auto_1935756 ?auto_1935763 ) ) ( not ( = ?auto_1935756 ?auto_1935764 ) ) ( not ( = ?auto_1935756 ?auto_1935765 ) ) ( not ( = ?auto_1935756 ?auto_1935766 ) ) ( not ( = ?auto_1935756 ?auto_1935768 ) ) ( not ( = ?auto_1935760 ?auto_1935762 ) ) ( not ( = ?auto_1935760 ?auto_1935761 ) ) ( not ( = ?auto_1935760 ?auto_1935763 ) ) ( not ( = ?auto_1935760 ?auto_1935764 ) ) ( not ( = ?auto_1935760 ?auto_1935765 ) ) ( not ( = ?auto_1935760 ?auto_1935766 ) ) ( not ( = ?auto_1935760 ?auto_1935768 ) ) ( not ( = ?auto_1935762 ?auto_1935761 ) ) ( not ( = ?auto_1935762 ?auto_1935763 ) ) ( not ( = ?auto_1935762 ?auto_1935764 ) ) ( not ( = ?auto_1935762 ?auto_1935765 ) ) ( not ( = ?auto_1935762 ?auto_1935766 ) ) ( not ( = ?auto_1935762 ?auto_1935768 ) ) ( not ( = ?auto_1935761 ?auto_1935763 ) ) ( not ( = ?auto_1935761 ?auto_1935764 ) ) ( not ( = ?auto_1935761 ?auto_1935765 ) ) ( not ( = ?auto_1935761 ?auto_1935766 ) ) ( not ( = ?auto_1935761 ?auto_1935768 ) ) ( not ( = ?auto_1935763 ?auto_1935764 ) ) ( not ( = ?auto_1935763 ?auto_1935765 ) ) ( not ( = ?auto_1935763 ?auto_1935766 ) ) ( not ( = ?auto_1935763 ?auto_1935768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935764 ?auto_1935765 ?auto_1935766 )
      ( MAKE-10CRATE-VERIFY ?auto_1935757 ?auto_1935758 ?auto_1935759 ?auto_1935756 ?auto_1935760 ?auto_1935762 ?auto_1935761 ?auto_1935763 ?auto_1935764 ?auto_1935765 ?auto_1935766 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1935883 - SURFACE
      ?auto_1935884 - SURFACE
      ?auto_1935885 - SURFACE
      ?auto_1935882 - SURFACE
      ?auto_1935886 - SURFACE
      ?auto_1935888 - SURFACE
      ?auto_1935887 - SURFACE
      ?auto_1935889 - SURFACE
      ?auto_1935890 - SURFACE
      ?auto_1935891 - SURFACE
      ?auto_1935892 - SURFACE
    )
    :vars
    (
      ?auto_1935895 - HOIST
      ?auto_1935896 - PLACE
      ?auto_1935893 - PLACE
      ?auto_1935894 - HOIST
      ?auto_1935897 - SURFACE
      ?auto_1935898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1935895 ?auto_1935896 ) ( SURFACE-AT ?auto_1935891 ?auto_1935896 ) ( CLEAR ?auto_1935891 ) ( IS-CRATE ?auto_1935892 ) ( not ( = ?auto_1935891 ?auto_1935892 ) ) ( AVAILABLE ?auto_1935895 ) ( ON ?auto_1935891 ?auto_1935890 ) ( not ( = ?auto_1935890 ?auto_1935891 ) ) ( not ( = ?auto_1935890 ?auto_1935892 ) ) ( not ( = ?auto_1935893 ?auto_1935896 ) ) ( HOIST-AT ?auto_1935894 ?auto_1935893 ) ( not ( = ?auto_1935895 ?auto_1935894 ) ) ( AVAILABLE ?auto_1935894 ) ( SURFACE-AT ?auto_1935892 ?auto_1935893 ) ( ON ?auto_1935892 ?auto_1935897 ) ( CLEAR ?auto_1935892 ) ( not ( = ?auto_1935891 ?auto_1935897 ) ) ( not ( = ?auto_1935892 ?auto_1935897 ) ) ( not ( = ?auto_1935890 ?auto_1935897 ) ) ( TRUCK-AT ?auto_1935898 ?auto_1935896 ) ( ON ?auto_1935884 ?auto_1935883 ) ( ON ?auto_1935885 ?auto_1935884 ) ( ON ?auto_1935882 ?auto_1935885 ) ( ON ?auto_1935886 ?auto_1935882 ) ( ON ?auto_1935888 ?auto_1935886 ) ( ON ?auto_1935887 ?auto_1935888 ) ( ON ?auto_1935889 ?auto_1935887 ) ( ON ?auto_1935890 ?auto_1935889 ) ( not ( = ?auto_1935883 ?auto_1935884 ) ) ( not ( = ?auto_1935883 ?auto_1935885 ) ) ( not ( = ?auto_1935883 ?auto_1935882 ) ) ( not ( = ?auto_1935883 ?auto_1935886 ) ) ( not ( = ?auto_1935883 ?auto_1935888 ) ) ( not ( = ?auto_1935883 ?auto_1935887 ) ) ( not ( = ?auto_1935883 ?auto_1935889 ) ) ( not ( = ?auto_1935883 ?auto_1935890 ) ) ( not ( = ?auto_1935883 ?auto_1935891 ) ) ( not ( = ?auto_1935883 ?auto_1935892 ) ) ( not ( = ?auto_1935883 ?auto_1935897 ) ) ( not ( = ?auto_1935884 ?auto_1935885 ) ) ( not ( = ?auto_1935884 ?auto_1935882 ) ) ( not ( = ?auto_1935884 ?auto_1935886 ) ) ( not ( = ?auto_1935884 ?auto_1935888 ) ) ( not ( = ?auto_1935884 ?auto_1935887 ) ) ( not ( = ?auto_1935884 ?auto_1935889 ) ) ( not ( = ?auto_1935884 ?auto_1935890 ) ) ( not ( = ?auto_1935884 ?auto_1935891 ) ) ( not ( = ?auto_1935884 ?auto_1935892 ) ) ( not ( = ?auto_1935884 ?auto_1935897 ) ) ( not ( = ?auto_1935885 ?auto_1935882 ) ) ( not ( = ?auto_1935885 ?auto_1935886 ) ) ( not ( = ?auto_1935885 ?auto_1935888 ) ) ( not ( = ?auto_1935885 ?auto_1935887 ) ) ( not ( = ?auto_1935885 ?auto_1935889 ) ) ( not ( = ?auto_1935885 ?auto_1935890 ) ) ( not ( = ?auto_1935885 ?auto_1935891 ) ) ( not ( = ?auto_1935885 ?auto_1935892 ) ) ( not ( = ?auto_1935885 ?auto_1935897 ) ) ( not ( = ?auto_1935882 ?auto_1935886 ) ) ( not ( = ?auto_1935882 ?auto_1935888 ) ) ( not ( = ?auto_1935882 ?auto_1935887 ) ) ( not ( = ?auto_1935882 ?auto_1935889 ) ) ( not ( = ?auto_1935882 ?auto_1935890 ) ) ( not ( = ?auto_1935882 ?auto_1935891 ) ) ( not ( = ?auto_1935882 ?auto_1935892 ) ) ( not ( = ?auto_1935882 ?auto_1935897 ) ) ( not ( = ?auto_1935886 ?auto_1935888 ) ) ( not ( = ?auto_1935886 ?auto_1935887 ) ) ( not ( = ?auto_1935886 ?auto_1935889 ) ) ( not ( = ?auto_1935886 ?auto_1935890 ) ) ( not ( = ?auto_1935886 ?auto_1935891 ) ) ( not ( = ?auto_1935886 ?auto_1935892 ) ) ( not ( = ?auto_1935886 ?auto_1935897 ) ) ( not ( = ?auto_1935888 ?auto_1935887 ) ) ( not ( = ?auto_1935888 ?auto_1935889 ) ) ( not ( = ?auto_1935888 ?auto_1935890 ) ) ( not ( = ?auto_1935888 ?auto_1935891 ) ) ( not ( = ?auto_1935888 ?auto_1935892 ) ) ( not ( = ?auto_1935888 ?auto_1935897 ) ) ( not ( = ?auto_1935887 ?auto_1935889 ) ) ( not ( = ?auto_1935887 ?auto_1935890 ) ) ( not ( = ?auto_1935887 ?auto_1935891 ) ) ( not ( = ?auto_1935887 ?auto_1935892 ) ) ( not ( = ?auto_1935887 ?auto_1935897 ) ) ( not ( = ?auto_1935889 ?auto_1935890 ) ) ( not ( = ?auto_1935889 ?auto_1935891 ) ) ( not ( = ?auto_1935889 ?auto_1935892 ) ) ( not ( = ?auto_1935889 ?auto_1935897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1935890 ?auto_1935891 ?auto_1935892 )
      ( MAKE-10CRATE-VERIFY ?auto_1935883 ?auto_1935884 ?auto_1935885 ?auto_1935882 ?auto_1935886 ?auto_1935888 ?auto_1935887 ?auto_1935889 ?auto_1935890 ?auto_1935891 ?auto_1935892 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1936009 - SURFACE
      ?auto_1936010 - SURFACE
      ?auto_1936011 - SURFACE
      ?auto_1936008 - SURFACE
      ?auto_1936012 - SURFACE
      ?auto_1936014 - SURFACE
      ?auto_1936013 - SURFACE
      ?auto_1936015 - SURFACE
      ?auto_1936016 - SURFACE
      ?auto_1936017 - SURFACE
      ?auto_1936018 - SURFACE
    )
    :vars
    (
      ?auto_1936019 - HOIST
      ?auto_1936020 - PLACE
      ?auto_1936022 - PLACE
      ?auto_1936024 - HOIST
      ?auto_1936021 - SURFACE
      ?auto_1936023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1936019 ?auto_1936020 ) ( IS-CRATE ?auto_1936018 ) ( not ( = ?auto_1936017 ?auto_1936018 ) ) ( not ( = ?auto_1936016 ?auto_1936017 ) ) ( not ( = ?auto_1936016 ?auto_1936018 ) ) ( not ( = ?auto_1936022 ?auto_1936020 ) ) ( HOIST-AT ?auto_1936024 ?auto_1936022 ) ( not ( = ?auto_1936019 ?auto_1936024 ) ) ( AVAILABLE ?auto_1936024 ) ( SURFACE-AT ?auto_1936018 ?auto_1936022 ) ( ON ?auto_1936018 ?auto_1936021 ) ( CLEAR ?auto_1936018 ) ( not ( = ?auto_1936017 ?auto_1936021 ) ) ( not ( = ?auto_1936018 ?auto_1936021 ) ) ( not ( = ?auto_1936016 ?auto_1936021 ) ) ( TRUCK-AT ?auto_1936023 ?auto_1936020 ) ( SURFACE-AT ?auto_1936016 ?auto_1936020 ) ( CLEAR ?auto_1936016 ) ( LIFTING ?auto_1936019 ?auto_1936017 ) ( IS-CRATE ?auto_1936017 ) ( ON ?auto_1936010 ?auto_1936009 ) ( ON ?auto_1936011 ?auto_1936010 ) ( ON ?auto_1936008 ?auto_1936011 ) ( ON ?auto_1936012 ?auto_1936008 ) ( ON ?auto_1936014 ?auto_1936012 ) ( ON ?auto_1936013 ?auto_1936014 ) ( ON ?auto_1936015 ?auto_1936013 ) ( ON ?auto_1936016 ?auto_1936015 ) ( not ( = ?auto_1936009 ?auto_1936010 ) ) ( not ( = ?auto_1936009 ?auto_1936011 ) ) ( not ( = ?auto_1936009 ?auto_1936008 ) ) ( not ( = ?auto_1936009 ?auto_1936012 ) ) ( not ( = ?auto_1936009 ?auto_1936014 ) ) ( not ( = ?auto_1936009 ?auto_1936013 ) ) ( not ( = ?auto_1936009 ?auto_1936015 ) ) ( not ( = ?auto_1936009 ?auto_1936016 ) ) ( not ( = ?auto_1936009 ?auto_1936017 ) ) ( not ( = ?auto_1936009 ?auto_1936018 ) ) ( not ( = ?auto_1936009 ?auto_1936021 ) ) ( not ( = ?auto_1936010 ?auto_1936011 ) ) ( not ( = ?auto_1936010 ?auto_1936008 ) ) ( not ( = ?auto_1936010 ?auto_1936012 ) ) ( not ( = ?auto_1936010 ?auto_1936014 ) ) ( not ( = ?auto_1936010 ?auto_1936013 ) ) ( not ( = ?auto_1936010 ?auto_1936015 ) ) ( not ( = ?auto_1936010 ?auto_1936016 ) ) ( not ( = ?auto_1936010 ?auto_1936017 ) ) ( not ( = ?auto_1936010 ?auto_1936018 ) ) ( not ( = ?auto_1936010 ?auto_1936021 ) ) ( not ( = ?auto_1936011 ?auto_1936008 ) ) ( not ( = ?auto_1936011 ?auto_1936012 ) ) ( not ( = ?auto_1936011 ?auto_1936014 ) ) ( not ( = ?auto_1936011 ?auto_1936013 ) ) ( not ( = ?auto_1936011 ?auto_1936015 ) ) ( not ( = ?auto_1936011 ?auto_1936016 ) ) ( not ( = ?auto_1936011 ?auto_1936017 ) ) ( not ( = ?auto_1936011 ?auto_1936018 ) ) ( not ( = ?auto_1936011 ?auto_1936021 ) ) ( not ( = ?auto_1936008 ?auto_1936012 ) ) ( not ( = ?auto_1936008 ?auto_1936014 ) ) ( not ( = ?auto_1936008 ?auto_1936013 ) ) ( not ( = ?auto_1936008 ?auto_1936015 ) ) ( not ( = ?auto_1936008 ?auto_1936016 ) ) ( not ( = ?auto_1936008 ?auto_1936017 ) ) ( not ( = ?auto_1936008 ?auto_1936018 ) ) ( not ( = ?auto_1936008 ?auto_1936021 ) ) ( not ( = ?auto_1936012 ?auto_1936014 ) ) ( not ( = ?auto_1936012 ?auto_1936013 ) ) ( not ( = ?auto_1936012 ?auto_1936015 ) ) ( not ( = ?auto_1936012 ?auto_1936016 ) ) ( not ( = ?auto_1936012 ?auto_1936017 ) ) ( not ( = ?auto_1936012 ?auto_1936018 ) ) ( not ( = ?auto_1936012 ?auto_1936021 ) ) ( not ( = ?auto_1936014 ?auto_1936013 ) ) ( not ( = ?auto_1936014 ?auto_1936015 ) ) ( not ( = ?auto_1936014 ?auto_1936016 ) ) ( not ( = ?auto_1936014 ?auto_1936017 ) ) ( not ( = ?auto_1936014 ?auto_1936018 ) ) ( not ( = ?auto_1936014 ?auto_1936021 ) ) ( not ( = ?auto_1936013 ?auto_1936015 ) ) ( not ( = ?auto_1936013 ?auto_1936016 ) ) ( not ( = ?auto_1936013 ?auto_1936017 ) ) ( not ( = ?auto_1936013 ?auto_1936018 ) ) ( not ( = ?auto_1936013 ?auto_1936021 ) ) ( not ( = ?auto_1936015 ?auto_1936016 ) ) ( not ( = ?auto_1936015 ?auto_1936017 ) ) ( not ( = ?auto_1936015 ?auto_1936018 ) ) ( not ( = ?auto_1936015 ?auto_1936021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1936016 ?auto_1936017 ?auto_1936018 )
      ( MAKE-10CRATE-VERIFY ?auto_1936009 ?auto_1936010 ?auto_1936011 ?auto_1936008 ?auto_1936012 ?auto_1936014 ?auto_1936013 ?auto_1936015 ?auto_1936016 ?auto_1936017 ?auto_1936018 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1936135 - SURFACE
      ?auto_1936136 - SURFACE
      ?auto_1936137 - SURFACE
      ?auto_1936134 - SURFACE
      ?auto_1936138 - SURFACE
      ?auto_1936140 - SURFACE
      ?auto_1936139 - SURFACE
      ?auto_1936141 - SURFACE
      ?auto_1936142 - SURFACE
      ?auto_1936143 - SURFACE
      ?auto_1936144 - SURFACE
    )
    :vars
    (
      ?auto_1936148 - HOIST
      ?auto_1936149 - PLACE
      ?auto_1936150 - PLACE
      ?auto_1936145 - HOIST
      ?auto_1936147 - SURFACE
      ?auto_1936146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1936148 ?auto_1936149 ) ( IS-CRATE ?auto_1936144 ) ( not ( = ?auto_1936143 ?auto_1936144 ) ) ( not ( = ?auto_1936142 ?auto_1936143 ) ) ( not ( = ?auto_1936142 ?auto_1936144 ) ) ( not ( = ?auto_1936150 ?auto_1936149 ) ) ( HOIST-AT ?auto_1936145 ?auto_1936150 ) ( not ( = ?auto_1936148 ?auto_1936145 ) ) ( AVAILABLE ?auto_1936145 ) ( SURFACE-AT ?auto_1936144 ?auto_1936150 ) ( ON ?auto_1936144 ?auto_1936147 ) ( CLEAR ?auto_1936144 ) ( not ( = ?auto_1936143 ?auto_1936147 ) ) ( not ( = ?auto_1936144 ?auto_1936147 ) ) ( not ( = ?auto_1936142 ?auto_1936147 ) ) ( TRUCK-AT ?auto_1936146 ?auto_1936149 ) ( SURFACE-AT ?auto_1936142 ?auto_1936149 ) ( CLEAR ?auto_1936142 ) ( IS-CRATE ?auto_1936143 ) ( AVAILABLE ?auto_1936148 ) ( IN ?auto_1936143 ?auto_1936146 ) ( ON ?auto_1936136 ?auto_1936135 ) ( ON ?auto_1936137 ?auto_1936136 ) ( ON ?auto_1936134 ?auto_1936137 ) ( ON ?auto_1936138 ?auto_1936134 ) ( ON ?auto_1936140 ?auto_1936138 ) ( ON ?auto_1936139 ?auto_1936140 ) ( ON ?auto_1936141 ?auto_1936139 ) ( ON ?auto_1936142 ?auto_1936141 ) ( not ( = ?auto_1936135 ?auto_1936136 ) ) ( not ( = ?auto_1936135 ?auto_1936137 ) ) ( not ( = ?auto_1936135 ?auto_1936134 ) ) ( not ( = ?auto_1936135 ?auto_1936138 ) ) ( not ( = ?auto_1936135 ?auto_1936140 ) ) ( not ( = ?auto_1936135 ?auto_1936139 ) ) ( not ( = ?auto_1936135 ?auto_1936141 ) ) ( not ( = ?auto_1936135 ?auto_1936142 ) ) ( not ( = ?auto_1936135 ?auto_1936143 ) ) ( not ( = ?auto_1936135 ?auto_1936144 ) ) ( not ( = ?auto_1936135 ?auto_1936147 ) ) ( not ( = ?auto_1936136 ?auto_1936137 ) ) ( not ( = ?auto_1936136 ?auto_1936134 ) ) ( not ( = ?auto_1936136 ?auto_1936138 ) ) ( not ( = ?auto_1936136 ?auto_1936140 ) ) ( not ( = ?auto_1936136 ?auto_1936139 ) ) ( not ( = ?auto_1936136 ?auto_1936141 ) ) ( not ( = ?auto_1936136 ?auto_1936142 ) ) ( not ( = ?auto_1936136 ?auto_1936143 ) ) ( not ( = ?auto_1936136 ?auto_1936144 ) ) ( not ( = ?auto_1936136 ?auto_1936147 ) ) ( not ( = ?auto_1936137 ?auto_1936134 ) ) ( not ( = ?auto_1936137 ?auto_1936138 ) ) ( not ( = ?auto_1936137 ?auto_1936140 ) ) ( not ( = ?auto_1936137 ?auto_1936139 ) ) ( not ( = ?auto_1936137 ?auto_1936141 ) ) ( not ( = ?auto_1936137 ?auto_1936142 ) ) ( not ( = ?auto_1936137 ?auto_1936143 ) ) ( not ( = ?auto_1936137 ?auto_1936144 ) ) ( not ( = ?auto_1936137 ?auto_1936147 ) ) ( not ( = ?auto_1936134 ?auto_1936138 ) ) ( not ( = ?auto_1936134 ?auto_1936140 ) ) ( not ( = ?auto_1936134 ?auto_1936139 ) ) ( not ( = ?auto_1936134 ?auto_1936141 ) ) ( not ( = ?auto_1936134 ?auto_1936142 ) ) ( not ( = ?auto_1936134 ?auto_1936143 ) ) ( not ( = ?auto_1936134 ?auto_1936144 ) ) ( not ( = ?auto_1936134 ?auto_1936147 ) ) ( not ( = ?auto_1936138 ?auto_1936140 ) ) ( not ( = ?auto_1936138 ?auto_1936139 ) ) ( not ( = ?auto_1936138 ?auto_1936141 ) ) ( not ( = ?auto_1936138 ?auto_1936142 ) ) ( not ( = ?auto_1936138 ?auto_1936143 ) ) ( not ( = ?auto_1936138 ?auto_1936144 ) ) ( not ( = ?auto_1936138 ?auto_1936147 ) ) ( not ( = ?auto_1936140 ?auto_1936139 ) ) ( not ( = ?auto_1936140 ?auto_1936141 ) ) ( not ( = ?auto_1936140 ?auto_1936142 ) ) ( not ( = ?auto_1936140 ?auto_1936143 ) ) ( not ( = ?auto_1936140 ?auto_1936144 ) ) ( not ( = ?auto_1936140 ?auto_1936147 ) ) ( not ( = ?auto_1936139 ?auto_1936141 ) ) ( not ( = ?auto_1936139 ?auto_1936142 ) ) ( not ( = ?auto_1936139 ?auto_1936143 ) ) ( not ( = ?auto_1936139 ?auto_1936144 ) ) ( not ( = ?auto_1936139 ?auto_1936147 ) ) ( not ( = ?auto_1936141 ?auto_1936142 ) ) ( not ( = ?auto_1936141 ?auto_1936143 ) ) ( not ( = ?auto_1936141 ?auto_1936144 ) ) ( not ( = ?auto_1936141 ?auto_1936147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1936142 ?auto_1936143 ?auto_1936144 )
      ( MAKE-10CRATE-VERIFY ?auto_1936135 ?auto_1936136 ?auto_1936137 ?auto_1936134 ?auto_1936138 ?auto_1936140 ?auto_1936139 ?auto_1936141 ?auto_1936142 ?auto_1936143 ?auto_1936144 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943382 - SURFACE
      ?auto_1943383 - SURFACE
      ?auto_1943384 - SURFACE
      ?auto_1943381 - SURFACE
      ?auto_1943385 - SURFACE
      ?auto_1943387 - SURFACE
      ?auto_1943386 - SURFACE
      ?auto_1943388 - SURFACE
      ?auto_1943389 - SURFACE
      ?auto_1943390 - SURFACE
      ?auto_1943391 - SURFACE
      ?auto_1943392 - SURFACE
    )
    :vars
    (
      ?auto_1943393 - HOIST
      ?auto_1943394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943393 ?auto_1943394 ) ( SURFACE-AT ?auto_1943391 ?auto_1943394 ) ( CLEAR ?auto_1943391 ) ( LIFTING ?auto_1943393 ?auto_1943392 ) ( IS-CRATE ?auto_1943392 ) ( not ( = ?auto_1943391 ?auto_1943392 ) ) ( ON ?auto_1943383 ?auto_1943382 ) ( ON ?auto_1943384 ?auto_1943383 ) ( ON ?auto_1943381 ?auto_1943384 ) ( ON ?auto_1943385 ?auto_1943381 ) ( ON ?auto_1943387 ?auto_1943385 ) ( ON ?auto_1943386 ?auto_1943387 ) ( ON ?auto_1943388 ?auto_1943386 ) ( ON ?auto_1943389 ?auto_1943388 ) ( ON ?auto_1943390 ?auto_1943389 ) ( ON ?auto_1943391 ?auto_1943390 ) ( not ( = ?auto_1943382 ?auto_1943383 ) ) ( not ( = ?auto_1943382 ?auto_1943384 ) ) ( not ( = ?auto_1943382 ?auto_1943381 ) ) ( not ( = ?auto_1943382 ?auto_1943385 ) ) ( not ( = ?auto_1943382 ?auto_1943387 ) ) ( not ( = ?auto_1943382 ?auto_1943386 ) ) ( not ( = ?auto_1943382 ?auto_1943388 ) ) ( not ( = ?auto_1943382 ?auto_1943389 ) ) ( not ( = ?auto_1943382 ?auto_1943390 ) ) ( not ( = ?auto_1943382 ?auto_1943391 ) ) ( not ( = ?auto_1943382 ?auto_1943392 ) ) ( not ( = ?auto_1943383 ?auto_1943384 ) ) ( not ( = ?auto_1943383 ?auto_1943381 ) ) ( not ( = ?auto_1943383 ?auto_1943385 ) ) ( not ( = ?auto_1943383 ?auto_1943387 ) ) ( not ( = ?auto_1943383 ?auto_1943386 ) ) ( not ( = ?auto_1943383 ?auto_1943388 ) ) ( not ( = ?auto_1943383 ?auto_1943389 ) ) ( not ( = ?auto_1943383 ?auto_1943390 ) ) ( not ( = ?auto_1943383 ?auto_1943391 ) ) ( not ( = ?auto_1943383 ?auto_1943392 ) ) ( not ( = ?auto_1943384 ?auto_1943381 ) ) ( not ( = ?auto_1943384 ?auto_1943385 ) ) ( not ( = ?auto_1943384 ?auto_1943387 ) ) ( not ( = ?auto_1943384 ?auto_1943386 ) ) ( not ( = ?auto_1943384 ?auto_1943388 ) ) ( not ( = ?auto_1943384 ?auto_1943389 ) ) ( not ( = ?auto_1943384 ?auto_1943390 ) ) ( not ( = ?auto_1943384 ?auto_1943391 ) ) ( not ( = ?auto_1943384 ?auto_1943392 ) ) ( not ( = ?auto_1943381 ?auto_1943385 ) ) ( not ( = ?auto_1943381 ?auto_1943387 ) ) ( not ( = ?auto_1943381 ?auto_1943386 ) ) ( not ( = ?auto_1943381 ?auto_1943388 ) ) ( not ( = ?auto_1943381 ?auto_1943389 ) ) ( not ( = ?auto_1943381 ?auto_1943390 ) ) ( not ( = ?auto_1943381 ?auto_1943391 ) ) ( not ( = ?auto_1943381 ?auto_1943392 ) ) ( not ( = ?auto_1943385 ?auto_1943387 ) ) ( not ( = ?auto_1943385 ?auto_1943386 ) ) ( not ( = ?auto_1943385 ?auto_1943388 ) ) ( not ( = ?auto_1943385 ?auto_1943389 ) ) ( not ( = ?auto_1943385 ?auto_1943390 ) ) ( not ( = ?auto_1943385 ?auto_1943391 ) ) ( not ( = ?auto_1943385 ?auto_1943392 ) ) ( not ( = ?auto_1943387 ?auto_1943386 ) ) ( not ( = ?auto_1943387 ?auto_1943388 ) ) ( not ( = ?auto_1943387 ?auto_1943389 ) ) ( not ( = ?auto_1943387 ?auto_1943390 ) ) ( not ( = ?auto_1943387 ?auto_1943391 ) ) ( not ( = ?auto_1943387 ?auto_1943392 ) ) ( not ( = ?auto_1943386 ?auto_1943388 ) ) ( not ( = ?auto_1943386 ?auto_1943389 ) ) ( not ( = ?auto_1943386 ?auto_1943390 ) ) ( not ( = ?auto_1943386 ?auto_1943391 ) ) ( not ( = ?auto_1943386 ?auto_1943392 ) ) ( not ( = ?auto_1943388 ?auto_1943389 ) ) ( not ( = ?auto_1943388 ?auto_1943390 ) ) ( not ( = ?auto_1943388 ?auto_1943391 ) ) ( not ( = ?auto_1943388 ?auto_1943392 ) ) ( not ( = ?auto_1943389 ?auto_1943390 ) ) ( not ( = ?auto_1943389 ?auto_1943391 ) ) ( not ( = ?auto_1943389 ?auto_1943392 ) ) ( not ( = ?auto_1943390 ?auto_1943391 ) ) ( not ( = ?auto_1943390 ?auto_1943392 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1943391 ?auto_1943392 )
      ( MAKE-11CRATE-VERIFY ?auto_1943382 ?auto_1943383 ?auto_1943384 ?auto_1943381 ?auto_1943385 ?auto_1943387 ?auto_1943386 ?auto_1943388 ?auto_1943389 ?auto_1943390 ?auto_1943391 ?auto_1943392 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943491 - SURFACE
      ?auto_1943492 - SURFACE
      ?auto_1943493 - SURFACE
      ?auto_1943490 - SURFACE
      ?auto_1943494 - SURFACE
      ?auto_1943496 - SURFACE
      ?auto_1943495 - SURFACE
      ?auto_1943497 - SURFACE
      ?auto_1943498 - SURFACE
      ?auto_1943499 - SURFACE
      ?auto_1943500 - SURFACE
      ?auto_1943501 - SURFACE
    )
    :vars
    (
      ?auto_1943504 - HOIST
      ?auto_1943502 - PLACE
      ?auto_1943503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943504 ?auto_1943502 ) ( SURFACE-AT ?auto_1943500 ?auto_1943502 ) ( CLEAR ?auto_1943500 ) ( IS-CRATE ?auto_1943501 ) ( not ( = ?auto_1943500 ?auto_1943501 ) ) ( TRUCK-AT ?auto_1943503 ?auto_1943502 ) ( AVAILABLE ?auto_1943504 ) ( IN ?auto_1943501 ?auto_1943503 ) ( ON ?auto_1943500 ?auto_1943499 ) ( not ( = ?auto_1943499 ?auto_1943500 ) ) ( not ( = ?auto_1943499 ?auto_1943501 ) ) ( ON ?auto_1943492 ?auto_1943491 ) ( ON ?auto_1943493 ?auto_1943492 ) ( ON ?auto_1943490 ?auto_1943493 ) ( ON ?auto_1943494 ?auto_1943490 ) ( ON ?auto_1943496 ?auto_1943494 ) ( ON ?auto_1943495 ?auto_1943496 ) ( ON ?auto_1943497 ?auto_1943495 ) ( ON ?auto_1943498 ?auto_1943497 ) ( ON ?auto_1943499 ?auto_1943498 ) ( not ( = ?auto_1943491 ?auto_1943492 ) ) ( not ( = ?auto_1943491 ?auto_1943493 ) ) ( not ( = ?auto_1943491 ?auto_1943490 ) ) ( not ( = ?auto_1943491 ?auto_1943494 ) ) ( not ( = ?auto_1943491 ?auto_1943496 ) ) ( not ( = ?auto_1943491 ?auto_1943495 ) ) ( not ( = ?auto_1943491 ?auto_1943497 ) ) ( not ( = ?auto_1943491 ?auto_1943498 ) ) ( not ( = ?auto_1943491 ?auto_1943499 ) ) ( not ( = ?auto_1943491 ?auto_1943500 ) ) ( not ( = ?auto_1943491 ?auto_1943501 ) ) ( not ( = ?auto_1943492 ?auto_1943493 ) ) ( not ( = ?auto_1943492 ?auto_1943490 ) ) ( not ( = ?auto_1943492 ?auto_1943494 ) ) ( not ( = ?auto_1943492 ?auto_1943496 ) ) ( not ( = ?auto_1943492 ?auto_1943495 ) ) ( not ( = ?auto_1943492 ?auto_1943497 ) ) ( not ( = ?auto_1943492 ?auto_1943498 ) ) ( not ( = ?auto_1943492 ?auto_1943499 ) ) ( not ( = ?auto_1943492 ?auto_1943500 ) ) ( not ( = ?auto_1943492 ?auto_1943501 ) ) ( not ( = ?auto_1943493 ?auto_1943490 ) ) ( not ( = ?auto_1943493 ?auto_1943494 ) ) ( not ( = ?auto_1943493 ?auto_1943496 ) ) ( not ( = ?auto_1943493 ?auto_1943495 ) ) ( not ( = ?auto_1943493 ?auto_1943497 ) ) ( not ( = ?auto_1943493 ?auto_1943498 ) ) ( not ( = ?auto_1943493 ?auto_1943499 ) ) ( not ( = ?auto_1943493 ?auto_1943500 ) ) ( not ( = ?auto_1943493 ?auto_1943501 ) ) ( not ( = ?auto_1943490 ?auto_1943494 ) ) ( not ( = ?auto_1943490 ?auto_1943496 ) ) ( not ( = ?auto_1943490 ?auto_1943495 ) ) ( not ( = ?auto_1943490 ?auto_1943497 ) ) ( not ( = ?auto_1943490 ?auto_1943498 ) ) ( not ( = ?auto_1943490 ?auto_1943499 ) ) ( not ( = ?auto_1943490 ?auto_1943500 ) ) ( not ( = ?auto_1943490 ?auto_1943501 ) ) ( not ( = ?auto_1943494 ?auto_1943496 ) ) ( not ( = ?auto_1943494 ?auto_1943495 ) ) ( not ( = ?auto_1943494 ?auto_1943497 ) ) ( not ( = ?auto_1943494 ?auto_1943498 ) ) ( not ( = ?auto_1943494 ?auto_1943499 ) ) ( not ( = ?auto_1943494 ?auto_1943500 ) ) ( not ( = ?auto_1943494 ?auto_1943501 ) ) ( not ( = ?auto_1943496 ?auto_1943495 ) ) ( not ( = ?auto_1943496 ?auto_1943497 ) ) ( not ( = ?auto_1943496 ?auto_1943498 ) ) ( not ( = ?auto_1943496 ?auto_1943499 ) ) ( not ( = ?auto_1943496 ?auto_1943500 ) ) ( not ( = ?auto_1943496 ?auto_1943501 ) ) ( not ( = ?auto_1943495 ?auto_1943497 ) ) ( not ( = ?auto_1943495 ?auto_1943498 ) ) ( not ( = ?auto_1943495 ?auto_1943499 ) ) ( not ( = ?auto_1943495 ?auto_1943500 ) ) ( not ( = ?auto_1943495 ?auto_1943501 ) ) ( not ( = ?auto_1943497 ?auto_1943498 ) ) ( not ( = ?auto_1943497 ?auto_1943499 ) ) ( not ( = ?auto_1943497 ?auto_1943500 ) ) ( not ( = ?auto_1943497 ?auto_1943501 ) ) ( not ( = ?auto_1943498 ?auto_1943499 ) ) ( not ( = ?auto_1943498 ?auto_1943500 ) ) ( not ( = ?auto_1943498 ?auto_1943501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943499 ?auto_1943500 ?auto_1943501 )
      ( MAKE-11CRATE-VERIFY ?auto_1943491 ?auto_1943492 ?auto_1943493 ?auto_1943490 ?auto_1943494 ?auto_1943496 ?auto_1943495 ?auto_1943497 ?auto_1943498 ?auto_1943499 ?auto_1943500 ?auto_1943501 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943612 - SURFACE
      ?auto_1943613 - SURFACE
      ?auto_1943614 - SURFACE
      ?auto_1943611 - SURFACE
      ?auto_1943615 - SURFACE
      ?auto_1943617 - SURFACE
      ?auto_1943616 - SURFACE
      ?auto_1943618 - SURFACE
      ?auto_1943619 - SURFACE
      ?auto_1943620 - SURFACE
      ?auto_1943621 - SURFACE
      ?auto_1943622 - SURFACE
    )
    :vars
    (
      ?auto_1943624 - HOIST
      ?auto_1943623 - PLACE
      ?auto_1943626 - TRUCK
      ?auto_1943625 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943624 ?auto_1943623 ) ( SURFACE-AT ?auto_1943621 ?auto_1943623 ) ( CLEAR ?auto_1943621 ) ( IS-CRATE ?auto_1943622 ) ( not ( = ?auto_1943621 ?auto_1943622 ) ) ( AVAILABLE ?auto_1943624 ) ( IN ?auto_1943622 ?auto_1943626 ) ( ON ?auto_1943621 ?auto_1943620 ) ( not ( = ?auto_1943620 ?auto_1943621 ) ) ( not ( = ?auto_1943620 ?auto_1943622 ) ) ( TRUCK-AT ?auto_1943626 ?auto_1943625 ) ( not ( = ?auto_1943625 ?auto_1943623 ) ) ( ON ?auto_1943613 ?auto_1943612 ) ( ON ?auto_1943614 ?auto_1943613 ) ( ON ?auto_1943611 ?auto_1943614 ) ( ON ?auto_1943615 ?auto_1943611 ) ( ON ?auto_1943617 ?auto_1943615 ) ( ON ?auto_1943616 ?auto_1943617 ) ( ON ?auto_1943618 ?auto_1943616 ) ( ON ?auto_1943619 ?auto_1943618 ) ( ON ?auto_1943620 ?auto_1943619 ) ( not ( = ?auto_1943612 ?auto_1943613 ) ) ( not ( = ?auto_1943612 ?auto_1943614 ) ) ( not ( = ?auto_1943612 ?auto_1943611 ) ) ( not ( = ?auto_1943612 ?auto_1943615 ) ) ( not ( = ?auto_1943612 ?auto_1943617 ) ) ( not ( = ?auto_1943612 ?auto_1943616 ) ) ( not ( = ?auto_1943612 ?auto_1943618 ) ) ( not ( = ?auto_1943612 ?auto_1943619 ) ) ( not ( = ?auto_1943612 ?auto_1943620 ) ) ( not ( = ?auto_1943612 ?auto_1943621 ) ) ( not ( = ?auto_1943612 ?auto_1943622 ) ) ( not ( = ?auto_1943613 ?auto_1943614 ) ) ( not ( = ?auto_1943613 ?auto_1943611 ) ) ( not ( = ?auto_1943613 ?auto_1943615 ) ) ( not ( = ?auto_1943613 ?auto_1943617 ) ) ( not ( = ?auto_1943613 ?auto_1943616 ) ) ( not ( = ?auto_1943613 ?auto_1943618 ) ) ( not ( = ?auto_1943613 ?auto_1943619 ) ) ( not ( = ?auto_1943613 ?auto_1943620 ) ) ( not ( = ?auto_1943613 ?auto_1943621 ) ) ( not ( = ?auto_1943613 ?auto_1943622 ) ) ( not ( = ?auto_1943614 ?auto_1943611 ) ) ( not ( = ?auto_1943614 ?auto_1943615 ) ) ( not ( = ?auto_1943614 ?auto_1943617 ) ) ( not ( = ?auto_1943614 ?auto_1943616 ) ) ( not ( = ?auto_1943614 ?auto_1943618 ) ) ( not ( = ?auto_1943614 ?auto_1943619 ) ) ( not ( = ?auto_1943614 ?auto_1943620 ) ) ( not ( = ?auto_1943614 ?auto_1943621 ) ) ( not ( = ?auto_1943614 ?auto_1943622 ) ) ( not ( = ?auto_1943611 ?auto_1943615 ) ) ( not ( = ?auto_1943611 ?auto_1943617 ) ) ( not ( = ?auto_1943611 ?auto_1943616 ) ) ( not ( = ?auto_1943611 ?auto_1943618 ) ) ( not ( = ?auto_1943611 ?auto_1943619 ) ) ( not ( = ?auto_1943611 ?auto_1943620 ) ) ( not ( = ?auto_1943611 ?auto_1943621 ) ) ( not ( = ?auto_1943611 ?auto_1943622 ) ) ( not ( = ?auto_1943615 ?auto_1943617 ) ) ( not ( = ?auto_1943615 ?auto_1943616 ) ) ( not ( = ?auto_1943615 ?auto_1943618 ) ) ( not ( = ?auto_1943615 ?auto_1943619 ) ) ( not ( = ?auto_1943615 ?auto_1943620 ) ) ( not ( = ?auto_1943615 ?auto_1943621 ) ) ( not ( = ?auto_1943615 ?auto_1943622 ) ) ( not ( = ?auto_1943617 ?auto_1943616 ) ) ( not ( = ?auto_1943617 ?auto_1943618 ) ) ( not ( = ?auto_1943617 ?auto_1943619 ) ) ( not ( = ?auto_1943617 ?auto_1943620 ) ) ( not ( = ?auto_1943617 ?auto_1943621 ) ) ( not ( = ?auto_1943617 ?auto_1943622 ) ) ( not ( = ?auto_1943616 ?auto_1943618 ) ) ( not ( = ?auto_1943616 ?auto_1943619 ) ) ( not ( = ?auto_1943616 ?auto_1943620 ) ) ( not ( = ?auto_1943616 ?auto_1943621 ) ) ( not ( = ?auto_1943616 ?auto_1943622 ) ) ( not ( = ?auto_1943618 ?auto_1943619 ) ) ( not ( = ?auto_1943618 ?auto_1943620 ) ) ( not ( = ?auto_1943618 ?auto_1943621 ) ) ( not ( = ?auto_1943618 ?auto_1943622 ) ) ( not ( = ?auto_1943619 ?auto_1943620 ) ) ( not ( = ?auto_1943619 ?auto_1943621 ) ) ( not ( = ?auto_1943619 ?auto_1943622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943620 ?auto_1943621 ?auto_1943622 )
      ( MAKE-11CRATE-VERIFY ?auto_1943612 ?auto_1943613 ?auto_1943614 ?auto_1943611 ?auto_1943615 ?auto_1943617 ?auto_1943616 ?auto_1943618 ?auto_1943619 ?auto_1943620 ?auto_1943621 ?auto_1943622 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943744 - SURFACE
      ?auto_1943745 - SURFACE
      ?auto_1943746 - SURFACE
      ?auto_1943743 - SURFACE
      ?auto_1943747 - SURFACE
      ?auto_1943749 - SURFACE
      ?auto_1943748 - SURFACE
      ?auto_1943750 - SURFACE
      ?auto_1943751 - SURFACE
      ?auto_1943752 - SURFACE
      ?auto_1943753 - SURFACE
      ?auto_1943754 - SURFACE
    )
    :vars
    (
      ?auto_1943757 - HOIST
      ?auto_1943756 - PLACE
      ?auto_1943759 - TRUCK
      ?auto_1943755 - PLACE
      ?auto_1943758 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943757 ?auto_1943756 ) ( SURFACE-AT ?auto_1943753 ?auto_1943756 ) ( CLEAR ?auto_1943753 ) ( IS-CRATE ?auto_1943754 ) ( not ( = ?auto_1943753 ?auto_1943754 ) ) ( AVAILABLE ?auto_1943757 ) ( ON ?auto_1943753 ?auto_1943752 ) ( not ( = ?auto_1943752 ?auto_1943753 ) ) ( not ( = ?auto_1943752 ?auto_1943754 ) ) ( TRUCK-AT ?auto_1943759 ?auto_1943755 ) ( not ( = ?auto_1943755 ?auto_1943756 ) ) ( HOIST-AT ?auto_1943758 ?auto_1943755 ) ( LIFTING ?auto_1943758 ?auto_1943754 ) ( not ( = ?auto_1943757 ?auto_1943758 ) ) ( ON ?auto_1943745 ?auto_1943744 ) ( ON ?auto_1943746 ?auto_1943745 ) ( ON ?auto_1943743 ?auto_1943746 ) ( ON ?auto_1943747 ?auto_1943743 ) ( ON ?auto_1943749 ?auto_1943747 ) ( ON ?auto_1943748 ?auto_1943749 ) ( ON ?auto_1943750 ?auto_1943748 ) ( ON ?auto_1943751 ?auto_1943750 ) ( ON ?auto_1943752 ?auto_1943751 ) ( not ( = ?auto_1943744 ?auto_1943745 ) ) ( not ( = ?auto_1943744 ?auto_1943746 ) ) ( not ( = ?auto_1943744 ?auto_1943743 ) ) ( not ( = ?auto_1943744 ?auto_1943747 ) ) ( not ( = ?auto_1943744 ?auto_1943749 ) ) ( not ( = ?auto_1943744 ?auto_1943748 ) ) ( not ( = ?auto_1943744 ?auto_1943750 ) ) ( not ( = ?auto_1943744 ?auto_1943751 ) ) ( not ( = ?auto_1943744 ?auto_1943752 ) ) ( not ( = ?auto_1943744 ?auto_1943753 ) ) ( not ( = ?auto_1943744 ?auto_1943754 ) ) ( not ( = ?auto_1943745 ?auto_1943746 ) ) ( not ( = ?auto_1943745 ?auto_1943743 ) ) ( not ( = ?auto_1943745 ?auto_1943747 ) ) ( not ( = ?auto_1943745 ?auto_1943749 ) ) ( not ( = ?auto_1943745 ?auto_1943748 ) ) ( not ( = ?auto_1943745 ?auto_1943750 ) ) ( not ( = ?auto_1943745 ?auto_1943751 ) ) ( not ( = ?auto_1943745 ?auto_1943752 ) ) ( not ( = ?auto_1943745 ?auto_1943753 ) ) ( not ( = ?auto_1943745 ?auto_1943754 ) ) ( not ( = ?auto_1943746 ?auto_1943743 ) ) ( not ( = ?auto_1943746 ?auto_1943747 ) ) ( not ( = ?auto_1943746 ?auto_1943749 ) ) ( not ( = ?auto_1943746 ?auto_1943748 ) ) ( not ( = ?auto_1943746 ?auto_1943750 ) ) ( not ( = ?auto_1943746 ?auto_1943751 ) ) ( not ( = ?auto_1943746 ?auto_1943752 ) ) ( not ( = ?auto_1943746 ?auto_1943753 ) ) ( not ( = ?auto_1943746 ?auto_1943754 ) ) ( not ( = ?auto_1943743 ?auto_1943747 ) ) ( not ( = ?auto_1943743 ?auto_1943749 ) ) ( not ( = ?auto_1943743 ?auto_1943748 ) ) ( not ( = ?auto_1943743 ?auto_1943750 ) ) ( not ( = ?auto_1943743 ?auto_1943751 ) ) ( not ( = ?auto_1943743 ?auto_1943752 ) ) ( not ( = ?auto_1943743 ?auto_1943753 ) ) ( not ( = ?auto_1943743 ?auto_1943754 ) ) ( not ( = ?auto_1943747 ?auto_1943749 ) ) ( not ( = ?auto_1943747 ?auto_1943748 ) ) ( not ( = ?auto_1943747 ?auto_1943750 ) ) ( not ( = ?auto_1943747 ?auto_1943751 ) ) ( not ( = ?auto_1943747 ?auto_1943752 ) ) ( not ( = ?auto_1943747 ?auto_1943753 ) ) ( not ( = ?auto_1943747 ?auto_1943754 ) ) ( not ( = ?auto_1943749 ?auto_1943748 ) ) ( not ( = ?auto_1943749 ?auto_1943750 ) ) ( not ( = ?auto_1943749 ?auto_1943751 ) ) ( not ( = ?auto_1943749 ?auto_1943752 ) ) ( not ( = ?auto_1943749 ?auto_1943753 ) ) ( not ( = ?auto_1943749 ?auto_1943754 ) ) ( not ( = ?auto_1943748 ?auto_1943750 ) ) ( not ( = ?auto_1943748 ?auto_1943751 ) ) ( not ( = ?auto_1943748 ?auto_1943752 ) ) ( not ( = ?auto_1943748 ?auto_1943753 ) ) ( not ( = ?auto_1943748 ?auto_1943754 ) ) ( not ( = ?auto_1943750 ?auto_1943751 ) ) ( not ( = ?auto_1943750 ?auto_1943752 ) ) ( not ( = ?auto_1943750 ?auto_1943753 ) ) ( not ( = ?auto_1943750 ?auto_1943754 ) ) ( not ( = ?auto_1943751 ?auto_1943752 ) ) ( not ( = ?auto_1943751 ?auto_1943753 ) ) ( not ( = ?auto_1943751 ?auto_1943754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943752 ?auto_1943753 ?auto_1943754 )
      ( MAKE-11CRATE-VERIFY ?auto_1943744 ?auto_1943745 ?auto_1943746 ?auto_1943743 ?auto_1943747 ?auto_1943749 ?auto_1943748 ?auto_1943750 ?auto_1943751 ?auto_1943752 ?auto_1943753 ?auto_1943754 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1943887 - SURFACE
      ?auto_1943888 - SURFACE
      ?auto_1943889 - SURFACE
      ?auto_1943886 - SURFACE
      ?auto_1943890 - SURFACE
      ?auto_1943892 - SURFACE
      ?auto_1943891 - SURFACE
      ?auto_1943893 - SURFACE
      ?auto_1943894 - SURFACE
      ?auto_1943895 - SURFACE
      ?auto_1943896 - SURFACE
      ?auto_1943897 - SURFACE
    )
    :vars
    (
      ?auto_1943899 - HOIST
      ?auto_1943902 - PLACE
      ?auto_1943901 - TRUCK
      ?auto_1943900 - PLACE
      ?auto_1943903 - HOIST
      ?auto_1943898 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943899 ?auto_1943902 ) ( SURFACE-AT ?auto_1943896 ?auto_1943902 ) ( CLEAR ?auto_1943896 ) ( IS-CRATE ?auto_1943897 ) ( not ( = ?auto_1943896 ?auto_1943897 ) ) ( AVAILABLE ?auto_1943899 ) ( ON ?auto_1943896 ?auto_1943895 ) ( not ( = ?auto_1943895 ?auto_1943896 ) ) ( not ( = ?auto_1943895 ?auto_1943897 ) ) ( TRUCK-AT ?auto_1943901 ?auto_1943900 ) ( not ( = ?auto_1943900 ?auto_1943902 ) ) ( HOIST-AT ?auto_1943903 ?auto_1943900 ) ( not ( = ?auto_1943899 ?auto_1943903 ) ) ( AVAILABLE ?auto_1943903 ) ( SURFACE-AT ?auto_1943897 ?auto_1943900 ) ( ON ?auto_1943897 ?auto_1943898 ) ( CLEAR ?auto_1943897 ) ( not ( = ?auto_1943896 ?auto_1943898 ) ) ( not ( = ?auto_1943897 ?auto_1943898 ) ) ( not ( = ?auto_1943895 ?auto_1943898 ) ) ( ON ?auto_1943888 ?auto_1943887 ) ( ON ?auto_1943889 ?auto_1943888 ) ( ON ?auto_1943886 ?auto_1943889 ) ( ON ?auto_1943890 ?auto_1943886 ) ( ON ?auto_1943892 ?auto_1943890 ) ( ON ?auto_1943891 ?auto_1943892 ) ( ON ?auto_1943893 ?auto_1943891 ) ( ON ?auto_1943894 ?auto_1943893 ) ( ON ?auto_1943895 ?auto_1943894 ) ( not ( = ?auto_1943887 ?auto_1943888 ) ) ( not ( = ?auto_1943887 ?auto_1943889 ) ) ( not ( = ?auto_1943887 ?auto_1943886 ) ) ( not ( = ?auto_1943887 ?auto_1943890 ) ) ( not ( = ?auto_1943887 ?auto_1943892 ) ) ( not ( = ?auto_1943887 ?auto_1943891 ) ) ( not ( = ?auto_1943887 ?auto_1943893 ) ) ( not ( = ?auto_1943887 ?auto_1943894 ) ) ( not ( = ?auto_1943887 ?auto_1943895 ) ) ( not ( = ?auto_1943887 ?auto_1943896 ) ) ( not ( = ?auto_1943887 ?auto_1943897 ) ) ( not ( = ?auto_1943887 ?auto_1943898 ) ) ( not ( = ?auto_1943888 ?auto_1943889 ) ) ( not ( = ?auto_1943888 ?auto_1943886 ) ) ( not ( = ?auto_1943888 ?auto_1943890 ) ) ( not ( = ?auto_1943888 ?auto_1943892 ) ) ( not ( = ?auto_1943888 ?auto_1943891 ) ) ( not ( = ?auto_1943888 ?auto_1943893 ) ) ( not ( = ?auto_1943888 ?auto_1943894 ) ) ( not ( = ?auto_1943888 ?auto_1943895 ) ) ( not ( = ?auto_1943888 ?auto_1943896 ) ) ( not ( = ?auto_1943888 ?auto_1943897 ) ) ( not ( = ?auto_1943888 ?auto_1943898 ) ) ( not ( = ?auto_1943889 ?auto_1943886 ) ) ( not ( = ?auto_1943889 ?auto_1943890 ) ) ( not ( = ?auto_1943889 ?auto_1943892 ) ) ( not ( = ?auto_1943889 ?auto_1943891 ) ) ( not ( = ?auto_1943889 ?auto_1943893 ) ) ( not ( = ?auto_1943889 ?auto_1943894 ) ) ( not ( = ?auto_1943889 ?auto_1943895 ) ) ( not ( = ?auto_1943889 ?auto_1943896 ) ) ( not ( = ?auto_1943889 ?auto_1943897 ) ) ( not ( = ?auto_1943889 ?auto_1943898 ) ) ( not ( = ?auto_1943886 ?auto_1943890 ) ) ( not ( = ?auto_1943886 ?auto_1943892 ) ) ( not ( = ?auto_1943886 ?auto_1943891 ) ) ( not ( = ?auto_1943886 ?auto_1943893 ) ) ( not ( = ?auto_1943886 ?auto_1943894 ) ) ( not ( = ?auto_1943886 ?auto_1943895 ) ) ( not ( = ?auto_1943886 ?auto_1943896 ) ) ( not ( = ?auto_1943886 ?auto_1943897 ) ) ( not ( = ?auto_1943886 ?auto_1943898 ) ) ( not ( = ?auto_1943890 ?auto_1943892 ) ) ( not ( = ?auto_1943890 ?auto_1943891 ) ) ( not ( = ?auto_1943890 ?auto_1943893 ) ) ( not ( = ?auto_1943890 ?auto_1943894 ) ) ( not ( = ?auto_1943890 ?auto_1943895 ) ) ( not ( = ?auto_1943890 ?auto_1943896 ) ) ( not ( = ?auto_1943890 ?auto_1943897 ) ) ( not ( = ?auto_1943890 ?auto_1943898 ) ) ( not ( = ?auto_1943892 ?auto_1943891 ) ) ( not ( = ?auto_1943892 ?auto_1943893 ) ) ( not ( = ?auto_1943892 ?auto_1943894 ) ) ( not ( = ?auto_1943892 ?auto_1943895 ) ) ( not ( = ?auto_1943892 ?auto_1943896 ) ) ( not ( = ?auto_1943892 ?auto_1943897 ) ) ( not ( = ?auto_1943892 ?auto_1943898 ) ) ( not ( = ?auto_1943891 ?auto_1943893 ) ) ( not ( = ?auto_1943891 ?auto_1943894 ) ) ( not ( = ?auto_1943891 ?auto_1943895 ) ) ( not ( = ?auto_1943891 ?auto_1943896 ) ) ( not ( = ?auto_1943891 ?auto_1943897 ) ) ( not ( = ?auto_1943891 ?auto_1943898 ) ) ( not ( = ?auto_1943893 ?auto_1943894 ) ) ( not ( = ?auto_1943893 ?auto_1943895 ) ) ( not ( = ?auto_1943893 ?auto_1943896 ) ) ( not ( = ?auto_1943893 ?auto_1943897 ) ) ( not ( = ?auto_1943893 ?auto_1943898 ) ) ( not ( = ?auto_1943894 ?auto_1943895 ) ) ( not ( = ?auto_1943894 ?auto_1943896 ) ) ( not ( = ?auto_1943894 ?auto_1943897 ) ) ( not ( = ?auto_1943894 ?auto_1943898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1943895 ?auto_1943896 ?auto_1943897 )
      ( MAKE-11CRATE-VERIFY ?auto_1943887 ?auto_1943888 ?auto_1943889 ?auto_1943886 ?auto_1943890 ?auto_1943892 ?auto_1943891 ?auto_1943893 ?auto_1943894 ?auto_1943895 ?auto_1943896 ?auto_1943897 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1944031 - SURFACE
      ?auto_1944032 - SURFACE
      ?auto_1944033 - SURFACE
      ?auto_1944030 - SURFACE
      ?auto_1944034 - SURFACE
      ?auto_1944036 - SURFACE
      ?auto_1944035 - SURFACE
      ?auto_1944037 - SURFACE
      ?auto_1944038 - SURFACE
      ?auto_1944039 - SURFACE
      ?auto_1944040 - SURFACE
      ?auto_1944041 - SURFACE
    )
    :vars
    (
      ?auto_1944046 - HOIST
      ?auto_1944042 - PLACE
      ?auto_1944045 - PLACE
      ?auto_1944044 - HOIST
      ?auto_1944043 - SURFACE
      ?auto_1944047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1944046 ?auto_1944042 ) ( SURFACE-AT ?auto_1944040 ?auto_1944042 ) ( CLEAR ?auto_1944040 ) ( IS-CRATE ?auto_1944041 ) ( not ( = ?auto_1944040 ?auto_1944041 ) ) ( AVAILABLE ?auto_1944046 ) ( ON ?auto_1944040 ?auto_1944039 ) ( not ( = ?auto_1944039 ?auto_1944040 ) ) ( not ( = ?auto_1944039 ?auto_1944041 ) ) ( not ( = ?auto_1944045 ?auto_1944042 ) ) ( HOIST-AT ?auto_1944044 ?auto_1944045 ) ( not ( = ?auto_1944046 ?auto_1944044 ) ) ( AVAILABLE ?auto_1944044 ) ( SURFACE-AT ?auto_1944041 ?auto_1944045 ) ( ON ?auto_1944041 ?auto_1944043 ) ( CLEAR ?auto_1944041 ) ( not ( = ?auto_1944040 ?auto_1944043 ) ) ( not ( = ?auto_1944041 ?auto_1944043 ) ) ( not ( = ?auto_1944039 ?auto_1944043 ) ) ( TRUCK-AT ?auto_1944047 ?auto_1944042 ) ( ON ?auto_1944032 ?auto_1944031 ) ( ON ?auto_1944033 ?auto_1944032 ) ( ON ?auto_1944030 ?auto_1944033 ) ( ON ?auto_1944034 ?auto_1944030 ) ( ON ?auto_1944036 ?auto_1944034 ) ( ON ?auto_1944035 ?auto_1944036 ) ( ON ?auto_1944037 ?auto_1944035 ) ( ON ?auto_1944038 ?auto_1944037 ) ( ON ?auto_1944039 ?auto_1944038 ) ( not ( = ?auto_1944031 ?auto_1944032 ) ) ( not ( = ?auto_1944031 ?auto_1944033 ) ) ( not ( = ?auto_1944031 ?auto_1944030 ) ) ( not ( = ?auto_1944031 ?auto_1944034 ) ) ( not ( = ?auto_1944031 ?auto_1944036 ) ) ( not ( = ?auto_1944031 ?auto_1944035 ) ) ( not ( = ?auto_1944031 ?auto_1944037 ) ) ( not ( = ?auto_1944031 ?auto_1944038 ) ) ( not ( = ?auto_1944031 ?auto_1944039 ) ) ( not ( = ?auto_1944031 ?auto_1944040 ) ) ( not ( = ?auto_1944031 ?auto_1944041 ) ) ( not ( = ?auto_1944031 ?auto_1944043 ) ) ( not ( = ?auto_1944032 ?auto_1944033 ) ) ( not ( = ?auto_1944032 ?auto_1944030 ) ) ( not ( = ?auto_1944032 ?auto_1944034 ) ) ( not ( = ?auto_1944032 ?auto_1944036 ) ) ( not ( = ?auto_1944032 ?auto_1944035 ) ) ( not ( = ?auto_1944032 ?auto_1944037 ) ) ( not ( = ?auto_1944032 ?auto_1944038 ) ) ( not ( = ?auto_1944032 ?auto_1944039 ) ) ( not ( = ?auto_1944032 ?auto_1944040 ) ) ( not ( = ?auto_1944032 ?auto_1944041 ) ) ( not ( = ?auto_1944032 ?auto_1944043 ) ) ( not ( = ?auto_1944033 ?auto_1944030 ) ) ( not ( = ?auto_1944033 ?auto_1944034 ) ) ( not ( = ?auto_1944033 ?auto_1944036 ) ) ( not ( = ?auto_1944033 ?auto_1944035 ) ) ( not ( = ?auto_1944033 ?auto_1944037 ) ) ( not ( = ?auto_1944033 ?auto_1944038 ) ) ( not ( = ?auto_1944033 ?auto_1944039 ) ) ( not ( = ?auto_1944033 ?auto_1944040 ) ) ( not ( = ?auto_1944033 ?auto_1944041 ) ) ( not ( = ?auto_1944033 ?auto_1944043 ) ) ( not ( = ?auto_1944030 ?auto_1944034 ) ) ( not ( = ?auto_1944030 ?auto_1944036 ) ) ( not ( = ?auto_1944030 ?auto_1944035 ) ) ( not ( = ?auto_1944030 ?auto_1944037 ) ) ( not ( = ?auto_1944030 ?auto_1944038 ) ) ( not ( = ?auto_1944030 ?auto_1944039 ) ) ( not ( = ?auto_1944030 ?auto_1944040 ) ) ( not ( = ?auto_1944030 ?auto_1944041 ) ) ( not ( = ?auto_1944030 ?auto_1944043 ) ) ( not ( = ?auto_1944034 ?auto_1944036 ) ) ( not ( = ?auto_1944034 ?auto_1944035 ) ) ( not ( = ?auto_1944034 ?auto_1944037 ) ) ( not ( = ?auto_1944034 ?auto_1944038 ) ) ( not ( = ?auto_1944034 ?auto_1944039 ) ) ( not ( = ?auto_1944034 ?auto_1944040 ) ) ( not ( = ?auto_1944034 ?auto_1944041 ) ) ( not ( = ?auto_1944034 ?auto_1944043 ) ) ( not ( = ?auto_1944036 ?auto_1944035 ) ) ( not ( = ?auto_1944036 ?auto_1944037 ) ) ( not ( = ?auto_1944036 ?auto_1944038 ) ) ( not ( = ?auto_1944036 ?auto_1944039 ) ) ( not ( = ?auto_1944036 ?auto_1944040 ) ) ( not ( = ?auto_1944036 ?auto_1944041 ) ) ( not ( = ?auto_1944036 ?auto_1944043 ) ) ( not ( = ?auto_1944035 ?auto_1944037 ) ) ( not ( = ?auto_1944035 ?auto_1944038 ) ) ( not ( = ?auto_1944035 ?auto_1944039 ) ) ( not ( = ?auto_1944035 ?auto_1944040 ) ) ( not ( = ?auto_1944035 ?auto_1944041 ) ) ( not ( = ?auto_1944035 ?auto_1944043 ) ) ( not ( = ?auto_1944037 ?auto_1944038 ) ) ( not ( = ?auto_1944037 ?auto_1944039 ) ) ( not ( = ?auto_1944037 ?auto_1944040 ) ) ( not ( = ?auto_1944037 ?auto_1944041 ) ) ( not ( = ?auto_1944037 ?auto_1944043 ) ) ( not ( = ?auto_1944038 ?auto_1944039 ) ) ( not ( = ?auto_1944038 ?auto_1944040 ) ) ( not ( = ?auto_1944038 ?auto_1944041 ) ) ( not ( = ?auto_1944038 ?auto_1944043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1944039 ?auto_1944040 ?auto_1944041 )
      ( MAKE-11CRATE-VERIFY ?auto_1944031 ?auto_1944032 ?auto_1944033 ?auto_1944030 ?auto_1944034 ?auto_1944036 ?auto_1944035 ?auto_1944037 ?auto_1944038 ?auto_1944039 ?auto_1944040 ?auto_1944041 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1944175 - SURFACE
      ?auto_1944176 - SURFACE
      ?auto_1944177 - SURFACE
      ?auto_1944174 - SURFACE
      ?auto_1944178 - SURFACE
      ?auto_1944180 - SURFACE
      ?auto_1944179 - SURFACE
      ?auto_1944181 - SURFACE
      ?auto_1944182 - SURFACE
      ?auto_1944183 - SURFACE
      ?auto_1944184 - SURFACE
      ?auto_1944185 - SURFACE
    )
    :vars
    (
      ?auto_1944191 - HOIST
      ?auto_1944190 - PLACE
      ?auto_1944187 - PLACE
      ?auto_1944189 - HOIST
      ?auto_1944186 - SURFACE
      ?auto_1944188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1944191 ?auto_1944190 ) ( IS-CRATE ?auto_1944185 ) ( not ( = ?auto_1944184 ?auto_1944185 ) ) ( not ( = ?auto_1944183 ?auto_1944184 ) ) ( not ( = ?auto_1944183 ?auto_1944185 ) ) ( not ( = ?auto_1944187 ?auto_1944190 ) ) ( HOIST-AT ?auto_1944189 ?auto_1944187 ) ( not ( = ?auto_1944191 ?auto_1944189 ) ) ( AVAILABLE ?auto_1944189 ) ( SURFACE-AT ?auto_1944185 ?auto_1944187 ) ( ON ?auto_1944185 ?auto_1944186 ) ( CLEAR ?auto_1944185 ) ( not ( = ?auto_1944184 ?auto_1944186 ) ) ( not ( = ?auto_1944185 ?auto_1944186 ) ) ( not ( = ?auto_1944183 ?auto_1944186 ) ) ( TRUCK-AT ?auto_1944188 ?auto_1944190 ) ( SURFACE-AT ?auto_1944183 ?auto_1944190 ) ( CLEAR ?auto_1944183 ) ( LIFTING ?auto_1944191 ?auto_1944184 ) ( IS-CRATE ?auto_1944184 ) ( ON ?auto_1944176 ?auto_1944175 ) ( ON ?auto_1944177 ?auto_1944176 ) ( ON ?auto_1944174 ?auto_1944177 ) ( ON ?auto_1944178 ?auto_1944174 ) ( ON ?auto_1944180 ?auto_1944178 ) ( ON ?auto_1944179 ?auto_1944180 ) ( ON ?auto_1944181 ?auto_1944179 ) ( ON ?auto_1944182 ?auto_1944181 ) ( ON ?auto_1944183 ?auto_1944182 ) ( not ( = ?auto_1944175 ?auto_1944176 ) ) ( not ( = ?auto_1944175 ?auto_1944177 ) ) ( not ( = ?auto_1944175 ?auto_1944174 ) ) ( not ( = ?auto_1944175 ?auto_1944178 ) ) ( not ( = ?auto_1944175 ?auto_1944180 ) ) ( not ( = ?auto_1944175 ?auto_1944179 ) ) ( not ( = ?auto_1944175 ?auto_1944181 ) ) ( not ( = ?auto_1944175 ?auto_1944182 ) ) ( not ( = ?auto_1944175 ?auto_1944183 ) ) ( not ( = ?auto_1944175 ?auto_1944184 ) ) ( not ( = ?auto_1944175 ?auto_1944185 ) ) ( not ( = ?auto_1944175 ?auto_1944186 ) ) ( not ( = ?auto_1944176 ?auto_1944177 ) ) ( not ( = ?auto_1944176 ?auto_1944174 ) ) ( not ( = ?auto_1944176 ?auto_1944178 ) ) ( not ( = ?auto_1944176 ?auto_1944180 ) ) ( not ( = ?auto_1944176 ?auto_1944179 ) ) ( not ( = ?auto_1944176 ?auto_1944181 ) ) ( not ( = ?auto_1944176 ?auto_1944182 ) ) ( not ( = ?auto_1944176 ?auto_1944183 ) ) ( not ( = ?auto_1944176 ?auto_1944184 ) ) ( not ( = ?auto_1944176 ?auto_1944185 ) ) ( not ( = ?auto_1944176 ?auto_1944186 ) ) ( not ( = ?auto_1944177 ?auto_1944174 ) ) ( not ( = ?auto_1944177 ?auto_1944178 ) ) ( not ( = ?auto_1944177 ?auto_1944180 ) ) ( not ( = ?auto_1944177 ?auto_1944179 ) ) ( not ( = ?auto_1944177 ?auto_1944181 ) ) ( not ( = ?auto_1944177 ?auto_1944182 ) ) ( not ( = ?auto_1944177 ?auto_1944183 ) ) ( not ( = ?auto_1944177 ?auto_1944184 ) ) ( not ( = ?auto_1944177 ?auto_1944185 ) ) ( not ( = ?auto_1944177 ?auto_1944186 ) ) ( not ( = ?auto_1944174 ?auto_1944178 ) ) ( not ( = ?auto_1944174 ?auto_1944180 ) ) ( not ( = ?auto_1944174 ?auto_1944179 ) ) ( not ( = ?auto_1944174 ?auto_1944181 ) ) ( not ( = ?auto_1944174 ?auto_1944182 ) ) ( not ( = ?auto_1944174 ?auto_1944183 ) ) ( not ( = ?auto_1944174 ?auto_1944184 ) ) ( not ( = ?auto_1944174 ?auto_1944185 ) ) ( not ( = ?auto_1944174 ?auto_1944186 ) ) ( not ( = ?auto_1944178 ?auto_1944180 ) ) ( not ( = ?auto_1944178 ?auto_1944179 ) ) ( not ( = ?auto_1944178 ?auto_1944181 ) ) ( not ( = ?auto_1944178 ?auto_1944182 ) ) ( not ( = ?auto_1944178 ?auto_1944183 ) ) ( not ( = ?auto_1944178 ?auto_1944184 ) ) ( not ( = ?auto_1944178 ?auto_1944185 ) ) ( not ( = ?auto_1944178 ?auto_1944186 ) ) ( not ( = ?auto_1944180 ?auto_1944179 ) ) ( not ( = ?auto_1944180 ?auto_1944181 ) ) ( not ( = ?auto_1944180 ?auto_1944182 ) ) ( not ( = ?auto_1944180 ?auto_1944183 ) ) ( not ( = ?auto_1944180 ?auto_1944184 ) ) ( not ( = ?auto_1944180 ?auto_1944185 ) ) ( not ( = ?auto_1944180 ?auto_1944186 ) ) ( not ( = ?auto_1944179 ?auto_1944181 ) ) ( not ( = ?auto_1944179 ?auto_1944182 ) ) ( not ( = ?auto_1944179 ?auto_1944183 ) ) ( not ( = ?auto_1944179 ?auto_1944184 ) ) ( not ( = ?auto_1944179 ?auto_1944185 ) ) ( not ( = ?auto_1944179 ?auto_1944186 ) ) ( not ( = ?auto_1944181 ?auto_1944182 ) ) ( not ( = ?auto_1944181 ?auto_1944183 ) ) ( not ( = ?auto_1944181 ?auto_1944184 ) ) ( not ( = ?auto_1944181 ?auto_1944185 ) ) ( not ( = ?auto_1944181 ?auto_1944186 ) ) ( not ( = ?auto_1944182 ?auto_1944183 ) ) ( not ( = ?auto_1944182 ?auto_1944184 ) ) ( not ( = ?auto_1944182 ?auto_1944185 ) ) ( not ( = ?auto_1944182 ?auto_1944186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1944183 ?auto_1944184 ?auto_1944185 )
      ( MAKE-11CRATE-VERIFY ?auto_1944175 ?auto_1944176 ?auto_1944177 ?auto_1944174 ?auto_1944178 ?auto_1944180 ?auto_1944179 ?auto_1944181 ?auto_1944182 ?auto_1944183 ?auto_1944184 ?auto_1944185 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1944319 - SURFACE
      ?auto_1944320 - SURFACE
      ?auto_1944321 - SURFACE
      ?auto_1944318 - SURFACE
      ?auto_1944322 - SURFACE
      ?auto_1944324 - SURFACE
      ?auto_1944323 - SURFACE
      ?auto_1944325 - SURFACE
      ?auto_1944326 - SURFACE
      ?auto_1944327 - SURFACE
      ?auto_1944328 - SURFACE
      ?auto_1944329 - SURFACE
    )
    :vars
    (
      ?auto_1944330 - HOIST
      ?auto_1944332 - PLACE
      ?auto_1944334 - PLACE
      ?auto_1944331 - HOIST
      ?auto_1944333 - SURFACE
      ?auto_1944335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1944330 ?auto_1944332 ) ( IS-CRATE ?auto_1944329 ) ( not ( = ?auto_1944328 ?auto_1944329 ) ) ( not ( = ?auto_1944327 ?auto_1944328 ) ) ( not ( = ?auto_1944327 ?auto_1944329 ) ) ( not ( = ?auto_1944334 ?auto_1944332 ) ) ( HOIST-AT ?auto_1944331 ?auto_1944334 ) ( not ( = ?auto_1944330 ?auto_1944331 ) ) ( AVAILABLE ?auto_1944331 ) ( SURFACE-AT ?auto_1944329 ?auto_1944334 ) ( ON ?auto_1944329 ?auto_1944333 ) ( CLEAR ?auto_1944329 ) ( not ( = ?auto_1944328 ?auto_1944333 ) ) ( not ( = ?auto_1944329 ?auto_1944333 ) ) ( not ( = ?auto_1944327 ?auto_1944333 ) ) ( TRUCK-AT ?auto_1944335 ?auto_1944332 ) ( SURFACE-AT ?auto_1944327 ?auto_1944332 ) ( CLEAR ?auto_1944327 ) ( IS-CRATE ?auto_1944328 ) ( AVAILABLE ?auto_1944330 ) ( IN ?auto_1944328 ?auto_1944335 ) ( ON ?auto_1944320 ?auto_1944319 ) ( ON ?auto_1944321 ?auto_1944320 ) ( ON ?auto_1944318 ?auto_1944321 ) ( ON ?auto_1944322 ?auto_1944318 ) ( ON ?auto_1944324 ?auto_1944322 ) ( ON ?auto_1944323 ?auto_1944324 ) ( ON ?auto_1944325 ?auto_1944323 ) ( ON ?auto_1944326 ?auto_1944325 ) ( ON ?auto_1944327 ?auto_1944326 ) ( not ( = ?auto_1944319 ?auto_1944320 ) ) ( not ( = ?auto_1944319 ?auto_1944321 ) ) ( not ( = ?auto_1944319 ?auto_1944318 ) ) ( not ( = ?auto_1944319 ?auto_1944322 ) ) ( not ( = ?auto_1944319 ?auto_1944324 ) ) ( not ( = ?auto_1944319 ?auto_1944323 ) ) ( not ( = ?auto_1944319 ?auto_1944325 ) ) ( not ( = ?auto_1944319 ?auto_1944326 ) ) ( not ( = ?auto_1944319 ?auto_1944327 ) ) ( not ( = ?auto_1944319 ?auto_1944328 ) ) ( not ( = ?auto_1944319 ?auto_1944329 ) ) ( not ( = ?auto_1944319 ?auto_1944333 ) ) ( not ( = ?auto_1944320 ?auto_1944321 ) ) ( not ( = ?auto_1944320 ?auto_1944318 ) ) ( not ( = ?auto_1944320 ?auto_1944322 ) ) ( not ( = ?auto_1944320 ?auto_1944324 ) ) ( not ( = ?auto_1944320 ?auto_1944323 ) ) ( not ( = ?auto_1944320 ?auto_1944325 ) ) ( not ( = ?auto_1944320 ?auto_1944326 ) ) ( not ( = ?auto_1944320 ?auto_1944327 ) ) ( not ( = ?auto_1944320 ?auto_1944328 ) ) ( not ( = ?auto_1944320 ?auto_1944329 ) ) ( not ( = ?auto_1944320 ?auto_1944333 ) ) ( not ( = ?auto_1944321 ?auto_1944318 ) ) ( not ( = ?auto_1944321 ?auto_1944322 ) ) ( not ( = ?auto_1944321 ?auto_1944324 ) ) ( not ( = ?auto_1944321 ?auto_1944323 ) ) ( not ( = ?auto_1944321 ?auto_1944325 ) ) ( not ( = ?auto_1944321 ?auto_1944326 ) ) ( not ( = ?auto_1944321 ?auto_1944327 ) ) ( not ( = ?auto_1944321 ?auto_1944328 ) ) ( not ( = ?auto_1944321 ?auto_1944329 ) ) ( not ( = ?auto_1944321 ?auto_1944333 ) ) ( not ( = ?auto_1944318 ?auto_1944322 ) ) ( not ( = ?auto_1944318 ?auto_1944324 ) ) ( not ( = ?auto_1944318 ?auto_1944323 ) ) ( not ( = ?auto_1944318 ?auto_1944325 ) ) ( not ( = ?auto_1944318 ?auto_1944326 ) ) ( not ( = ?auto_1944318 ?auto_1944327 ) ) ( not ( = ?auto_1944318 ?auto_1944328 ) ) ( not ( = ?auto_1944318 ?auto_1944329 ) ) ( not ( = ?auto_1944318 ?auto_1944333 ) ) ( not ( = ?auto_1944322 ?auto_1944324 ) ) ( not ( = ?auto_1944322 ?auto_1944323 ) ) ( not ( = ?auto_1944322 ?auto_1944325 ) ) ( not ( = ?auto_1944322 ?auto_1944326 ) ) ( not ( = ?auto_1944322 ?auto_1944327 ) ) ( not ( = ?auto_1944322 ?auto_1944328 ) ) ( not ( = ?auto_1944322 ?auto_1944329 ) ) ( not ( = ?auto_1944322 ?auto_1944333 ) ) ( not ( = ?auto_1944324 ?auto_1944323 ) ) ( not ( = ?auto_1944324 ?auto_1944325 ) ) ( not ( = ?auto_1944324 ?auto_1944326 ) ) ( not ( = ?auto_1944324 ?auto_1944327 ) ) ( not ( = ?auto_1944324 ?auto_1944328 ) ) ( not ( = ?auto_1944324 ?auto_1944329 ) ) ( not ( = ?auto_1944324 ?auto_1944333 ) ) ( not ( = ?auto_1944323 ?auto_1944325 ) ) ( not ( = ?auto_1944323 ?auto_1944326 ) ) ( not ( = ?auto_1944323 ?auto_1944327 ) ) ( not ( = ?auto_1944323 ?auto_1944328 ) ) ( not ( = ?auto_1944323 ?auto_1944329 ) ) ( not ( = ?auto_1944323 ?auto_1944333 ) ) ( not ( = ?auto_1944325 ?auto_1944326 ) ) ( not ( = ?auto_1944325 ?auto_1944327 ) ) ( not ( = ?auto_1944325 ?auto_1944328 ) ) ( not ( = ?auto_1944325 ?auto_1944329 ) ) ( not ( = ?auto_1944325 ?auto_1944333 ) ) ( not ( = ?auto_1944326 ?auto_1944327 ) ) ( not ( = ?auto_1944326 ?auto_1944328 ) ) ( not ( = ?auto_1944326 ?auto_1944329 ) ) ( not ( = ?auto_1944326 ?auto_1944333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1944327 ?auto_1944328 ?auto_1944329 )
      ( MAKE-11CRATE-VERIFY ?auto_1944319 ?auto_1944320 ?auto_1944321 ?auto_1944318 ?auto_1944322 ?auto_1944324 ?auto_1944323 ?auto_1944325 ?auto_1944326 ?auto_1944327 ?auto_1944328 ?auto_1944329 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953567 - SURFACE
      ?auto_1953568 - SURFACE
      ?auto_1953569 - SURFACE
      ?auto_1953566 - SURFACE
      ?auto_1953570 - SURFACE
      ?auto_1953572 - SURFACE
      ?auto_1953571 - SURFACE
      ?auto_1953573 - SURFACE
      ?auto_1953574 - SURFACE
      ?auto_1953575 - SURFACE
      ?auto_1953576 - SURFACE
      ?auto_1953577 - SURFACE
      ?auto_1953578 - SURFACE
    )
    :vars
    (
      ?auto_1953579 - HOIST
      ?auto_1953580 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953579 ?auto_1953580 ) ( SURFACE-AT ?auto_1953577 ?auto_1953580 ) ( CLEAR ?auto_1953577 ) ( LIFTING ?auto_1953579 ?auto_1953578 ) ( IS-CRATE ?auto_1953578 ) ( not ( = ?auto_1953577 ?auto_1953578 ) ) ( ON ?auto_1953568 ?auto_1953567 ) ( ON ?auto_1953569 ?auto_1953568 ) ( ON ?auto_1953566 ?auto_1953569 ) ( ON ?auto_1953570 ?auto_1953566 ) ( ON ?auto_1953572 ?auto_1953570 ) ( ON ?auto_1953571 ?auto_1953572 ) ( ON ?auto_1953573 ?auto_1953571 ) ( ON ?auto_1953574 ?auto_1953573 ) ( ON ?auto_1953575 ?auto_1953574 ) ( ON ?auto_1953576 ?auto_1953575 ) ( ON ?auto_1953577 ?auto_1953576 ) ( not ( = ?auto_1953567 ?auto_1953568 ) ) ( not ( = ?auto_1953567 ?auto_1953569 ) ) ( not ( = ?auto_1953567 ?auto_1953566 ) ) ( not ( = ?auto_1953567 ?auto_1953570 ) ) ( not ( = ?auto_1953567 ?auto_1953572 ) ) ( not ( = ?auto_1953567 ?auto_1953571 ) ) ( not ( = ?auto_1953567 ?auto_1953573 ) ) ( not ( = ?auto_1953567 ?auto_1953574 ) ) ( not ( = ?auto_1953567 ?auto_1953575 ) ) ( not ( = ?auto_1953567 ?auto_1953576 ) ) ( not ( = ?auto_1953567 ?auto_1953577 ) ) ( not ( = ?auto_1953567 ?auto_1953578 ) ) ( not ( = ?auto_1953568 ?auto_1953569 ) ) ( not ( = ?auto_1953568 ?auto_1953566 ) ) ( not ( = ?auto_1953568 ?auto_1953570 ) ) ( not ( = ?auto_1953568 ?auto_1953572 ) ) ( not ( = ?auto_1953568 ?auto_1953571 ) ) ( not ( = ?auto_1953568 ?auto_1953573 ) ) ( not ( = ?auto_1953568 ?auto_1953574 ) ) ( not ( = ?auto_1953568 ?auto_1953575 ) ) ( not ( = ?auto_1953568 ?auto_1953576 ) ) ( not ( = ?auto_1953568 ?auto_1953577 ) ) ( not ( = ?auto_1953568 ?auto_1953578 ) ) ( not ( = ?auto_1953569 ?auto_1953566 ) ) ( not ( = ?auto_1953569 ?auto_1953570 ) ) ( not ( = ?auto_1953569 ?auto_1953572 ) ) ( not ( = ?auto_1953569 ?auto_1953571 ) ) ( not ( = ?auto_1953569 ?auto_1953573 ) ) ( not ( = ?auto_1953569 ?auto_1953574 ) ) ( not ( = ?auto_1953569 ?auto_1953575 ) ) ( not ( = ?auto_1953569 ?auto_1953576 ) ) ( not ( = ?auto_1953569 ?auto_1953577 ) ) ( not ( = ?auto_1953569 ?auto_1953578 ) ) ( not ( = ?auto_1953566 ?auto_1953570 ) ) ( not ( = ?auto_1953566 ?auto_1953572 ) ) ( not ( = ?auto_1953566 ?auto_1953571 ) ) ( not ( = ?auto_1953566 ?auto_1953573 ) ) ( not ( = ?auto_1953566 ?auto_1953574 ) ) ( not ( = ?auto_1953566 ?auto_1953575 ) ) ( not ( = ?auto_1953566 ?auto_1953576 ) ) ( not ( = ?auto_1953566 ?auto_1953577 ) ) ( not ( = ?auto_1953566 ?auto_1953578 ) ) ( not ( = ?auto_1953570 ?auto_1953572 ) ) ( not ( = ?auto_1953570 ?auto_1953571 ) ) ( not ( = ?auto_1953570 ?auto_1953573 ) ) ( not ( = ?auto_1953570 ?auto_1953574 ) ) ( not ( = ?auto_1953570 ?auto_1953575 ) ) ( not ( = ?auto_1953570 ?auto_1953576 ) ) ( not ( = ?auto_1953570 ?auto_1953577 ) ) ( not ( = ?auto_1953570 ?auto_1953578 ) ) ( not ( = ?auto_1953572 ?auto_1953571 ) ) ( not ( = ?auto_1953572 ?auto_1953573 ) ) ( not ( = ?auto_1953572 ?auto_1953574 ) ) ( not ( = ?auto_1953572 ?auto_1953575 ) ) ( not ( = ?auto_1953572 ?auto_1953576 ) ) ( not ( = ?auto_1953572 ?auto_1953577 ) ) ( not ( = ?auto_1953572 ?auto_1953578 ) ) ( not ( = ?auto_1953571 ?auto_1953573 ) ) ( not ( = ?auto_1953571 ?auto_1953574 ) ) ( not ( = ?auto_1953571 ?auto_1953575 ) ) ( not ( = ?auto_1953571 ?auto_1953576 ) ) ( not ( = ?auto_1953571 ?auto_1953577 ) ) ( not ( = ?auto_1953571 ?auto_1953578 ) ) ( not ( = ?auto_1953573 ?auto_1953574 ) ) ( not ( = ?auto_1953573 ?auto_1953575 ) ) ( not ( = ?auto_1953573 ?auto_1953576 ) ) ( not ( = ?auto_1953573 ?auto_1953577 ) ) ( not ( = ?auto_1953573 ?auto_1953578 ) ) ( not ( = ?auto_1953574 ?auto_1953575 ) ) ( not ( = ?auto_1953574 ?auto_1953576 ) ) ( not ( = ?auto_1953574 ?auto_1953577 ) ) ( not ( = ?auto_1953574 ?auto_1953578 ) ) ( not ( = ?auto_1953575 ?auto_1953576 ) ) ( not ( = ?auto_1953575 ?auto_1953577 ) ) ( not ( = ?auto_1953575 ?auto_1953578 ) ) ( not ( = ?auto_1953576 ?auto_1953577 ) ) ( not ( = ?auto_1953576 ?auto_1953578 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1953577 ?auto_1953578 )
      ( MAKE-12CRATE-VERIFY ?auto_1953567 ?auto_1953568 ?auto_1953569 ?auto_1953566 ?auto_1953570 ?auto_1953572 ?auto_1953571 ?auto_1953573 ?auto_1953574 ?auto_1953575 ?auto_1953576 ?auto_1953577 ?auto_1953578 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953692 - SURFACE
      ?auto_1953693 - SURFACE
      ?auto_1953694 - SURFACE
      ?auto_1953691 - SURFACE
      ?auto_1953695 - SURFACE
      ?auto_1953697 - SURFACE
      ?auto_1953696 - SURFACE
      ?auto_1953698 - SURFACE
      ?auto_1953699 - SURFACE
      ?auto_1953700 - SURFACE
      ?auto_1953701 - SURFACE
      ?auto_1953702 - SURFACE
      ?auto_1953703 - SURFACE
    )
    :vars
    (
      ?auto_1953704 - HOIST
      ?auto_1953706 - PLACE
      ?auto_1953705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953704 ?auto_1953706 ) ( SURFACE-AT ?auto_1953702 ?auto_1953706 ) ( CLEAR ?auto_1953702 ) ( IS-CRATE ?auto_1953703 ) ( not ( = ?auto_1953702 ?auto_1953703 ) ) ( TRUCK-AT ?auto_1953705 ?auto_1953706 ) ( AVAILABLE ?auto_1953704 ) ( IN ?auto_1953703 ?auto_1953705 ) ( ON ?auto_1953702 ?auto_1953701 ) ( not ( = ?auto_1953701 ?auto_1953702 ) ) ( not ( = ?auto_1953701 ?auto_1953703 ) ) ( ON ?auto_1953693 ?auto_1953692 ) ( ON ?auto_1953694 ?auto_1953693 ) ( ON ?auto_1953691 ?auto_1953694 ) ( ON ?auto_1953695 ?auto_1953691 ) ( ON ?auto_1953697 ?auto_1953695 ) ( ON ?auto_1953696 ?auto_1953697 ) ( ON ?auto_1953698 ?auto_1953696 ) ( ON ?auto_1953699 ?auto_1953698 ) ( ON ?auto_1953700 ?auto_1953699 ) ( ON ?auto_1953701 ?auto_1953700 ) ( not ( = ?auto_1953692 ?auto_1953693 ) ) ( not ( = ?auto_1953692 ?auto_1953694 ) ) ( not ( = ?auto_1953692 ?auto_1953691 ) ) ( not ( = ?auto_1953692 ?auto_1953695 ) ) ( not ( = ?auto_1953692 ?auto_1953697 ) ) ( not ( = ?auto_1953692 ?auto_1953696 ) ) ( not ( = ?auto_1953692 ?auto_1953698 ) ) ( not ( = ?auto_1953692 ?auto_1953699 ) ) ( not ( = ?auto_1953692 ?auto_1953700 ) ) ( not ( = ?auto_1953692 ?auto_1953701 ) ) ( not ( = ?auto_1953692 ?auto_1953702 ) ) ( not ( = ?auto_1953692 ?auto_1953703 ) ) ( not ( = ?auto_1953693 ?auto_1953694 ) ) ( not ( = ?auto_1953693 ?auto_1953691 ) ) ( not ( = ?auto_1953693 ?auto_1953695 ) ) ( not ( = ?auto_1953693 ?auto_1953697 ) ) ( not ( = ?auto_1953693 ?auto_1953696 ) ) ( not ( = ?auto_1953693 ?auto_1953698 ) ) ( not ( = ?auto_1953693 ?auto_1953699 ) ) ( not ( = ?auto_1953693 ?auto_1953700 ) ) ( not ( = ?auto_1953693 ?auto_1953701 ) ) ( not ( = ?auto_1953693 ?auto_1953702 ) ) ( not ( = ?auto_1953693 ?auto_1953703 ) ) ( not ( = ?auto_1953694 ?auto_1953691 ) ) ( not ( = ?auto_1953694 ?auto_1953695 ) ) ( not ( = ?auto_1953694 ?auto_1953697 ) ) ( not ( = ?auto_1953694 ?auto_1953696 ) ) ( not ( = ?auto_1953694 ?auto_1953698 ) ) ( not ( = ?auto_1953694 ?auto_1953699 ) ) ( not ( = ?auto_1953694 ?auto_1953700 ) ) ( not ( = ?auto_1953694 ?auto_1953701 ) ) ( not ( = ?auto_1953694 ?auto_1953702 ) ) ( not ( = ?auto_1953694 ?auto_1953703 ) ) ( not ( = ?auto_1953691 ?auto_1953695 ) ) ( not ( = ?auto_1953691 ?auto_1953697 ) ) ( not ( = ?auto_1953691 ?auto_1953696 ) ) ( not ( = ?auto_1953691 ?auto_1953698 ) ) ( not ( = ?auto_1953691 ?auto_1953699 ) ) ( not ( = ?auto_1953691 ?auto_1953700 ) ) ( not ( = ?auto_1953691 ?auto_1953701 ) ) ( not ( = ?auto_1953691 ?auto_1953702 ) ) ( not ( = ?auto_1953691 ?auto_1953703 ) ) ( not ( = ?auto_1953695 ?auto_1953697 ) ) ( not ( = ?auto_1953695 ?auto_1953696 ) ) ( not ( = ?auto_1953695 ?auto_1953698 ) ) ( not ( = ?auto_1953695 ?auto_1953699 ) ) ( not ( = ?auto_1953695 ?auto_1953700 ) ) ( not ( = ?auto_1953695 ?auto_1953701 ) ) ( not ( = ?auto_1953695 ?auto_1953702 ) ) ( not ( = ?auto_1953695 ?auto_1953703 ) ) ( not ( = ?auto_1953697 ?auto_1953696 ) ) ( not ( = ?auto_1953697 ?auto_1953698 ) ) ( not ( = ?auto_1953697 ?auto_1953699 ) ) ( not ( = ?auto_1953697 ?auto_1953700 ) ) ( not ( = ?auto_1953697 ?auto_1953701 ) ) ( not ( = ?auto_1953697 ?auto_1953702 ) ) ( not ( = ?auto_1953697 ?auto_1953703 ) ) ( not ( = ?auto_1953696 ?auto_1953698 ) ) ( not ( = ?auto_1953696 ?auto_1953699 ) ) ( not ( = ?auto_1953696 ?auto_1953700 ) ) ( not ( = ?auto_1953696 ?auto_1953701 ) ) ( not ( = ?auto_1953696 ?auto_1953702 ) ) ( not ( = ?auto_1953696 ?auto_1953703 ) ) ( not ( = ?auto_1953698 ?auto_1953699 ) ) ( not ( = ?auto_1953698 ?auto_1953700 ) ) ( not ( = ?auto_1953698 ?auto_1953701 ) ) ( not ( = ?auto_1953698 ?auto_1953702 ) ) ( not ( = ?auto_1953698 ?auto_1953703 ) ) ( not ( = ?auto_1953699 ?auto_1953700 ) ) ( not ( = ?auto_1953699 ?auto_1953701 ) ) ( not ( = ?auto_1953699 ?auto_1953702 ) ) ( not ( = ?auto_1953699 ?auto_1953703 ) ) ( not ( = ?auto_1953700 ?auto_1953701 ) ) ( not ( = ?auto_1953700 ?auto_1953702 ) ) ( not ( = ?auto_1953700 ?auto_1953703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953701 ?auto_1953702 ?auto_1953703 )
      ( MAKE-12CRATE-VERIFY ?auto_1953692 ?auto_1953693 ?auto_1953694 ?auto_1953691 ?auto_1953695 ?auto_1953697 ?auto_1953696 ?auto_1953698 ?auto_1953699 ?auto_1953700 ?auto_1953701 ?auto_1953702 ?auto_1953703 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953830 - SURFACE
      ?auto_1953831 - SURFACE
      ?auto_1953832 - SURFACE
      ?auto_1953829 - SURFACE
      ?auto_1953833 - SURFACE
      ?auto_1953835 - SURFACE
      ?auto_1953834 - SURFACE
      ?auto_1953836 - SURFACE
      ?auto_1953837 - SURFACE
      ?auto_1953838 - SURFACE
      ?auto_1953839 - SURFACE
      ?auto_1953840 - SURFACE
      ?auto_1953841 - SURFACE
    )
    :vars
    (
      ?auto_1953845 - HOIST
      ?auto_1953844 - PLACE
      ?auto_1953843 - TRUCK
      ?auto_1953842 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953845 ?auto_1953844 ) ( SURFACE-AT ?auto_1953840 ?auto_1953844 ) ( CLEAR ?auto_1953840 ) ( IS-CRATE ?auto_1953841 ) ( not ( = ?auto_1953840 ?auto_1953841 ) ) ( AVAILABLE ?auto_1953845 ) ( IN ?auto_1953841 ?auto_1953843 ) ( ON ?auto_1953840 ?auto_1953839 ) ( not ( = ?auto_1953839 ?auto_1953840 ) ) ( not ( = ?auto_1953839 ?auto_1953841 ) ) ( TRUCK-AT ?auto_1953843 ?auto_1953842 ) ( not ( = ?auto_1953842 ?auto_1953844 ) ) ( ON ?auto_1953831 ?auto_1953830 ) ( ON ?auto_1953832 ?auto_1953831 ) ( ON ?auto_1953829 ?auto_1953832 ) ( ON ?auto_1953833 ?auto_1953829 ) ( ON ?auto_1953835 ?auto_1953833 ) ( ON ?auto_1953834 ?auto_1953835 ) ( ON ?auto_1953836 ?auto_1953834 ) ( ON ?auto_1953837 ?auto_1953836 ) ( ON ?auto_1953838 ?auto_1953837 ) ( ON ?auto_1953839 ?auto_1953838 ) ( not ( = ?auto_1953830 ?auto_1953831 ) ) ( not ( = ?auto_1953830 ?auto_1953832 ) ) ( not ( = ?auto_1953830 ?auto_1953829 ) ) ( not ( = ?auto_1953830 ?auto_1953833 ) ) ( not ( = ?auto_1953830 ?auto_1953835 ) ) ( not ( = ?auto_1953830 ?auto_1953834 ) ) ( not ( = ?auto_1953830 ?auto_1953836 ) ) ( not ( = ?auto_1953830 ?auto_1953837 ) ) ( not ( = ?auto_1953830 ?auto_1953838 ) ) ( not ( = ?auto_1953830 ?auto_1953839 ) ) ( not ( = ?auto_1953830 ?auto_1953840 ) ) ( not ( = ?auto_1953830 ?auto_1953841 ) ) ( not ( = ?auto_1953831 ?auto_1953832 ) ) ( not ( = ?auto_1953831 ?auto_1953829 ) ) ( not ( = ?auto_1953831 ?auto_1953833 ) ) ( not ( = ?auto_1953831 ?auto_1953835 ) ) ( not ( = ?auto_1953831 ?auto_1953834 ) ) ( not ( = ?auto_1953831 ?auto_1953836 ) ) ( not ( = ?auto_1953831 ?auto_1953837 ) ) ( not ( = ?auto_1953831 ?auto_1953838 ) ) ( not ( = ?auto_1953831 ?auto_1953839 ) ) ( not ( = ?auto_1953831 ?auto_1953840 ) ) ( not ( = ?auto_1953831 ?auto_1953841 ) ) ( not ( = ?auto_1953832 ?auto_1953829 ) ) ( not ( = ?auto_1953832 ?auto_1953833 ) ) ( not ( = ?auto_1953832 ?auto_1953835 ) ) ( not ( = ?auto_1953832 ?auto_1953834 ) ) ( not ( = ?auto_1953832 ?auto_1953836 ) ) ( not ( = ?auto_1953832 ?auto_1953837 ) ) ( not ( = ?auto_1953832 ?auto_1953838 ) ) ( not ( = ?auto_1953832 ?auto_1953839 ) ) ( not ( = ?auto_1953832 ?auto_1953840 ) ) ( not ( = ?auto_1953832 ?auto_1953841 ) ) ( not ( = ?auto_1953829 ?auto_1953833 ) ) ( not ( = ?auto_1953829 ?auto_1953835 ) ) ( not ( = ?auto_1953829 ?auto_1953834 ) ) ( not ( = ?auto_1953829 ?auto_1953836 ) ) ( not ( = ?auto_1953829 ?auto_1953837 ) ) ( not ( = ?auto_1953829 ?auto_1953838 ) ) ( not ( = ?auto_1953829 ?auto_1953839 ) ) ( not ( = ?auto_1953829 ?auto_1953840 ) ) ( not ( = ?auto_1953829 ?auto_1953841 ) ) ( not ( = ?auto_1953833 ?auto_1953835 ) ) ( not ( = ?auto_1953833 ?auto_1953834 ) ) ( not ( = ?auto_1953833 ?auto_1953836 ) ) ( not ( = ?auto_1953833 ?auto_1953837 ) ) ( not ( = ?auto_1953833 ?auto_1953838 ) ) ( not ( = ?auto_1953833 ?auto_1953839 ) ) ( not ( = ?auto_1953833 ?auto_1953840 ) ) ( not ( = ?auto_1953833 ?auto_1953841 ) ) ( not ( = ?auto_1953835 ?auto_1953834 ) ) ( not ( = ?auto_1953835 ?auto_1953836 ) ) ( not ( = ?auto_1953835 ?auto_1953837 ) ) ( not ( = ?auto_1953835 ?auto_1953838 ) ) ( not ( = ?auto_1953835 ?auto_1953839 ) ) ( not ( = ?auto_1953835 ?auto_1953840 ) ) ( not ( = ?auto_1953835 ?auto_1953841 ) ) ( not ( = ?auto_1953834 ?auto_1953836 ) ) ( not ( = ?auto_1953834 ?auto_1953837 ) ) ( not ( = ?auto_1953834 ?auto_1953838 ) ) ( not ( = ?auto_1953834 ?auto_1953839 ) ) ( not ( = ?auto_1953834 ?auto_1953840 ) ) ( not ( = ?auto_1953834 ?auto_1953841 ) ) ( not ( = ?auto_1953836 ?auto_1953837 ) ) ( not ( = ?auto_1953836 ?auto_1953838 ) ) ( not ( = ?auto_1953836 ?auto_1953839 ) ) ( not ( = ?auto_1953836 ?auto_1953840 ) ) ( not ( = ?auto_1953836 ?auto_1953841 ) ) ( not ( = ?auto_1953837 ?auto_1953838 ) ) ( not ( = ?auto_1953837 ?auto_1953839 ) ) ( not ( = ?auto_1953837 ?auto_1953840 ) ) ( not ( = ?auto_1953837 ?auto_1953841 ) ) ( not ( = ?auto_1953838 ?auto_1953839 ) ) ( not ( = ?auto_1953838 ?auto_1953840 ) ) ( not ( = ?auto_1953838 ?auto_1953841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953839 ?auto_1953840 ?auto_1953841 )
      ( MAKE-12CRATE-VERIFY ?auto_1953830 ?auto_1953831 ?auto_1953832 ?auto_1953829 ?auto_1953833 ?auto_1953835 ?auto_1953834 ?auto_1953836 ?auto_1953837 ?auto_1953838 ?auto_1953839 ?auto_1953840 ?auto_1953841 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1953980 - SURFACE
      ?auto_1953981 - SURFACE
      ?auto_1953982 - SURFACE
      ?auto_1953979 - SURFACE
      ?auto_1953983 - SURFACE
      ?auto_1953985 - SURFACE
      ?auto_1953984 - SURFACE
      ?auto_1953986 - SURFACE
      ?auto_1953987 - SURFACE
      ?auto_1953988 - SURFACE
      ?auto_1953989 - SURFACE
      ?auto_1953990 - SURFACE
      ?auto_1953991 - SURFACE
    )
    :vars
    (
      ?auto_1953993 - HOIST
      ?auto_1953994 - PLACE
      ?auto_1953995 - TRUCK
      ?auto_1953996 - PLACE
      ?auto_1953992 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1953993 ?auto_1953994 ) ( SURFACE-AT ?auto_1953990 ?auto_1953994 ) ( CLEAR ?auto_1953990 ) ( IS-CRATE ?auto_1953991 ) ( not ( = ?auto_1953990 ?auto_1953991 ) ) ( AVAILABLE ?auto_1953993 ) ( ON ?auto_1953990 ?auto_1953989 ) ( not ( = ?auto_1953989 ?auto_1953990 ) ) ( not ( = ?auto_1953989 ?auto_1953991 ) ) ( TRUCK-AT ?auto_1953995 ?auto_1953996 ) ( not ( = ?auto_1953996 ?auto_1953994 ) ) ( HOIST-AT ?auto_1953992 ?auto_1953996 ) ( LIFTING ?auto_1953992 ?auto_1953991 ) ( not ( = ?auto_1953993 ?auto_1953992 ) ) ( ON ?auto_1953981 ?auto_1953980 ) ( ON ?auto_1953982 ?auto_1953981 ) ( ON ?auto_1953979 ?auto_1953982 ) ( ON ?auto_1953983 ?auto_1953979 ) ( ON ?auto_1953985 ?auto_1953983 ) ( ON ?auto_1953984 ?auto_1953985 ) ( ON ?auto_1953986 ?auto_1953984 ) ( ON ?auto_1953987 ?auto_1953986 ) ( ON ?auto_1953988 ?auto_1953987 ) ( ON ?auto_1953989 ?auto_1953988 ) ( not ( = ?auto_1953980 ?auto_1953981 ) ) ( not ( = ?auto_1953980 ?auto_1953982 ) ) ( not ( = ?auto_1953980 ?auto_1953979 ) ) ( not ( = ?auto_1953980 ?auto_1953983 ) ) ( not ( = ?auto_1953980 ?auto_1953985 ) ) ( not ( = ?auto_1953980 ?auto_1953984 ) ) ( not ( = ?auto_1953980 ?auto_1953986 ) ) ( not ( = ?auto_1953980 ?auto_1953987 ) ) ( not ( = ?auto_1953980 ?auto_1953988 ) ) ( not ( = ?auto_1953980 ?auto_1953989 ) ) ( not ( = ?auto_1953980 ?auto_1953990 ) ) ( not ( = ?auto_1953980 ?auto_1953991 ) ) ( not ( = ?auto_1953981 ?auto_1953982 ) ) ( not ( = ?auto_1953981 ?auto_1953979 ) ) ( not ( = ?auto_1953981 ?auto_1953983 ) ) ( not ( = ?auto_1953981 ?auto_1953985 ) ) ( not ( = ?auto_1953981 ?auto_1953984 ) ) ( not ( = ?auto_1953981 ?auto_1953986 ) ) ( not ( = ?auto_1953981 ?auto_1953987 ) ) ( not ( = ?auto_1953981 ?auto_1953988 ) ) ( not ( = ?auto_1953981 ?auto_1953989 ) ) ( not ( = ?auto_1953981 ?auto_1953990 ) ) ( not ( = ?auto_1953981 ?auto_1953991 ) ) ( not ( = ?auto_1953982 ?auto_1953979 ) ) ( not ( = ?auto_1953982 ?auto_1953983 ) ) ( not ( = ?auto_1953982 ?auto_1953985 ) ) ( not ( = ?auto_1953982 ?auto_1953984 ) ) ( not ( = ?auto_1953982 ?auto_1953986 ) ) ( not ( = ?auto_1953982 ?auto_1953987 ) ) ( not ( = ?auto_1953982 ?auto_1953988 ) ) ( not ( = ?auto_1953982 ?auto_1953989 ) ) ( not ( = ?auto_1953982 ?auto_1953990 ) ) ( not ( = ?auto_1953982 ?auto_1953991 ) ) ( not ( = ?auto_1953979 ?auto_1953983 ) ) ( not ( = ?auto_1953979 ?auto_1953985 ) ) ( not ( = ?auto_1953979 ?auto_1953984 ) ) ( not ( = ?auto_1953979 ?auto_1953986 ) ) ( not ( = ?auto_1953979 ?auto_1953987 ) ) ( not ( = ?auto_1953979 ?auto_1953988 ) ) ( not ( = ?auto_1953979 ?auto_1953989 ) ) ( not ( = ?auto_1953979 ?auto_1953990 ) ) ( not ( = ?auto_1953979 ?auto_1953991 ) ) ( not ( = ?auto_1953983 ?auto_1953985 ) ) ( not ( = ?auto_1953983 ?auto_1953984 ) ) ( not ( = ?auto_1953983 ?auto_1953986 ) ) ( not ( = ?auto_1953983 ?auto_1953987 ) ) ( not ( = ?auto_1953983 ?auto_1953988 ) ) ( not ( = ?auto_1953983 ?auto_1953989 ) ) ( not ( = ?auto_1953983 ?auto_1953990 ) ) ( not ( = ?auto_1953983 ?auto_1953991 ) ) ( not ( = ?auto_1953985 ?auto_1953984 ) ) ( not ( = ?auto_1953985 ?auto_1953986 ) ) ( not ( = ?auto_1953985 ?auto_1953987 ) ) ( not ( = ?auto_1953985 ?auto_1953988 ) ) ( not ( = ?auto_1953985 ?auto_1953989 ) ) ( not ( = ?auto_1953985 ?auto_1953990 ) ) ( not ( = ?auto_1953985 ?auto_1953991 ) ) ( not ( = ?auto_1953984 ?auto_1953986 ) ) ( not ( = ?auto_1953984 ?auto_1953987 ) ) ( not ( = ?auto_1953984 ?auto_1953988 ) ) ( not ( = ?auto_1953984 ?auto_1953989 ) ) ( not ( = ?auto_1953984 ?auto_1953990 ) ) ( not ( = ?auto_1953984 ?auto_1953991 ) ) ( not ( = ?auto_1953986 ?auto_1953987 ) ) ( not ( = ?auto_1953986 ?auto_1953988 ) ) ( not ( = ?auto_1953986 ?auto_1953989 ) ) ( not ( = ?auto_1953986 ?auto_1953990 ) ) ( not ( = ?auto_1953986 ?auto_1953991 ) ) ( not ( = ?auto_1953987 ?auto_1953988 ) ) ( not ( = ?auto_1953987 ?auto_1953989 ) ) ( not ( = ?auto_1953987 ?auto_1953990 ) ) ( not ( = ?auto_1953987 ?auto_1953991 ) ) ( not ( = ?auto_1953988 ?auto_1953989 ) ) ( not ( = ?auto_1953988 ?auto_1953990 ) ) ( not ( = ?auto_1953988 ?auto_1953991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1953989 ?auto_1953990 ?auto_1953991 )
      ( MAKE-12CRATE-VERIFY ?auto_1953980 ?auto_1953981 ?auto_1953982 ?auto_1953979 ?auto_1953983 ?auto_1953985 ?auto_1953984 ?auto_1953986 ?auto_1953987 ?auto_1953988 ?auto_1953989 ?auto_1953990 ?auto_1953991 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1954142 - SURFACE
      ?auto_1954143 - SURFACE
      ?auto_1954144 - SURFACE
      ?auto_1954141 - SURFACE
      ?auto_1954145 - SURFACE
      ?auto_1954147 - SURFACE
      ?auto_1954146 - SURFACE
      ?auto_1954148 - SURFACE
      ?auto_1954149 - SURFACE
      ?auto_1954150 - SURFACE
      ?auto_1954151 - SURFACE
      ?auto_1954152 - SURFACE
      ?auto_1954153 - SURFACE
    )
    :vars
    (
      ?auto_1954158 - HOIST
      ?auto_1954155 - PLACE
      ?auto_1954154 - TRUCK
      ?auto_1954159 - PLACE
      ?auto_1954156 - HOIST
      ?auto_1954157 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954158 ?auto_1954155 ) ( SURFACE-AT ?auto_1954152 ?auto_1954155 ) ( CLEAR ?auto_1954152 ) ( IS-CRATE ?auto_1954153 ) ( not ( = ?auto_1954152 ?auto_1954153 ) ) ( AVAILABLE ?auto_1954158 ) ( ON ?auto_1954152 ?auto_1954151 ) ( not ( = ?auto_1954151 ?auto_1954152 ) ) ( not ( = ?auto_1954151 ?auto_1954153 ) ) ( TRUCK-AT ?auto_1954154 ?auto_1954159 ) ( not ( = ?auto_1954159 ?auto_1954155 ) ) ( HOIST-AT ?auto_1954156 ?auto_1954159 ) ( not ( = ?auto_1954158 ?auto_1954156 ) ) ( AVAILABLE ?auto_1954156 ) ( SURFACE-AT ?auto_1954153 ?auto_1954159 ) ( ON ?auto_1954153 ?auto_1954157 ) ( CLEAR ?auto_1954153 ) ( not ( = ?auto_1954152 ?auto_1954157 ) ) ( not ( = ?auto_1954153 ?auto_1954157 ) ) ( not ( = ?auto_1954151 ?auto_1954157 ) ) ( ON ?auto_1954143 ?auto_1954142 ) ( ON ?auto_1954144 ?auto_1954143 ) ( ON ?auto_1954141 ?auto_1954144 ) ( ON ?auto_1954145 ?auto_1954141 ) ( ON ?auto_1954147 ?auto_1954145 ) ( ON ?auto_1954146 ?auto_1954147 ) ( ON ?auto_1954148 ?auto_1954146 ) ( ON ?auto_1954149 ?auto_1954148 ) ( ON ?auto_1954150 ?auto_1954149 ) ( ON ?auto_1954151 ?auto_1954150 ) ( not ( = ?auto_1954142 ?auto_1954143 ) ) ( not ( = ?auto_1954142 ?auto_1954144 ) ) ( not ( = ?auto_1954142 ?auto_1954141 ) ) ( not ( = ?auto_1954142 ?auto_1954145 ) ) ( not ( = ?auto_1954142 ?auto_1954147 ) ) ( not ( = ?auto_1954142 ?auto_1954146 ) ) ( not ( = ?auto_1954142 ?auto_1954148 ) ) ( not ( = ?auto_1954142 ?auto_1954149 ) ) ( not ( = ?auto_1954142 ?auto_1954150 ) ) ( not ( = ?auto_1954142 ?auto_1954151 ) ) ( not ( = ?auto_1954142 ?auto_1954152 ) ) ( not ( = ?auto_1954142 ?auto_1954153 ) ) ( not ( = ?auto_1954142 ?auto_1954157 ) ) ( not ( = ?auto_1954143 ?auto_1954144 ) ) ( not ( = ?auto_1954143 ?auto_1954141 ) ) ( not ( = ?auto_1954143 ?auto_1954145 ) ) ( not ( = ?auto_1954143 ?auto_1954147 ) ) ( not ( = ?auto_1954143 ?auto_1954146 ) ) ( not ( = ?auto_1954143 ?auto_1954148 ) ) ( not ( = ?auto_1954143 ?auto_1954149 ) ) ( not ( = ?auto_1954143 ?auto_1954150 ) ) ( not ( = ?auto_1954143 ?auto_1954151 ) ) ( not ( = ?auto_1954143 ?auto_1954152 ) ) ( not ( = ?auto_1954143 ?auto_1954153 ) ) ( not ( = ?auto_1954143 ?auto_1954157 ) ) ( not ( = ?auto_1954144 ?auto_1954141 ) ) ( not ( = ?auto_1954144 ?auto_1954145 ) ) ( not ( = ?auto_1954144 ?auto_1954147 ) ) ( not ( = ?auto_1954144 ?auto_1954146 ) ) ( not ( = ?auto_1954144 ?auto_1954148 ) ) ( not ( = ?auto_1954144 ?auto_1954149 ) ) ( not ( = ?auto_1954144 ?auto_1954150 ) ) ( not ( = ?auto_1954144 ?auto_1954151 ) ) ( not ( = ?auto_1954144 ?auto_1954152 ) ) ( not ( = ?auto_1954144 ?auto_1954153 ) ) ( not ( = ?auto_1954144 ?auto_1954157 ) ) ( not ( = ?auto_1954141 ?auto_1954145 ) ) ( not ( = ?auto_1954141 ?auto_1954147 ) ) ( not ( = ?auto_1954141 ?auto_1954146 ) ) ( not ( = ?auto_1954141 ?auto_1954148 ) ) ( not ( = ?auto_1954141 ?auto_1954149 ) ) ( not ( = ?auto_1954141 ?auto_1954150 ) ) ( not ( = ?auto_1954141 ?auto_1954151 ) ) ( not ( = ?auto_1954141 ?auto_1954152 ) ) ( not ( = ?auto_1954141 ?auto_1954153 ) ) ( not ( = ?auto_1954141 ?auto_1954157 ) ) ( not ( = ?auto_1954145 ?auto_1954147 ) ) ( not ( = ?auto_1954145 ?auto_1954146 ) ) ( not ( = ?auto_1954145 ?auto_1954148 ) ) ( not ( = ?auto_1954145 ?auto_1954149 ) ) ( not ( = ?auto_1954145 ?auto_1954150 ) ) ( not ( = ?auto_1954145 ?auto_1954151 ) ) ( not ( = ?auto_1954145 ?auto_1954152 ) ) ( not ( = ?auto_1954145 ?auto_1954153 ) ) ( not ( = ?auto_1954145 ?auto_1954157 ) ) ( not ( = ?auto_1954147 ?auto_1954146 ) ) ( not ( = ?auto_1954147 ?auto_1954148 ) ) ( not ( = ?auto_1954147 ?auto_1954149 ) ) ( not ( = ?auto_1954147 ?auto_1954150 ) ) ( not ( = ?auto_1954147 ?auto_1954151 ) ) ( not ( = ?auto_1954147 ?auto_1954152 ) ) ( not ( = ?auto_1954147 ?auto_1954153 ) ) ( not ( = ?auto_1954147 ?auto_1954157 ) ) ( not ( = ?auto_1954146 ?auto_1954148 ) ) ( not ( = ?auto_1954146 ?auto_1954149 ) ) ( not ( = ?auto_1954146 ?auto_1954150 ) ) ( not ( = ?auto_1954146 ?auto_1954151 ) ) ( not ( = ?auto_1954146 ?auto_1954152 ) ) ( not ( = ?auto_1954146 ?auto_1954153 ) ) ( not ( = ?auto_1954146 ?auto_1954157 ) ) ( not ( = ?auto_1954148 ?auto_1954149 ) ) ( not ( = ?auto_1954148 ?auto_1954150 ) ) ( not ( = ?auto_1954148 ?auto_1954151 ) ) ( not ( = ?auto_1954148 ?auto_1954152 ) ) ( not ( = ?auto_1954148 ?auto_1954153 ) ) ( not ( = ?auto_1954148 ?auto_1954157 ) ) ( not ( = ?auto_1954149 ?auto_1954150 ) ) ( not ( = ?auto_1954149 ?auto_1954151 ) ) ( not ( = ?auto_1954149 ?auto_1954152 ) ) ( not ( = ?auto_1954149 ?auto_1954153 ) ) ( not ( = ?auto_1954149 ?auto_1954157 ) ) ( not ( = ?auto_1954150 ?auto_1954151 ) ) ( not ( = ?auto_1954150 ?auto_1954152 ) ) ( not ( = ?auto_1954150 ?auto_1954153 ) ) ( not ( = ?auto_1954150 ?auto_1954157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1954151 ?auto_1954152 ?auto_1954153 )
      ( MAKE-12CRATE-VERIFY ?auto_1954142 ?auto_1954143 ?auto_1954144 ?auto_1954141 ?auto_1954145 ?auto_1954147 ?auto_1954146 ?auto_1954148 ?auto_1954149 ?auto_1954150 ?auto_1954151 ?auto_1954152 ?auto_1954153 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1954305 - SURFACE
      ?auto_1954306 - SURFACE
      ?auto_1954307 - SURFACE
      ?auto_1954304 - SURFACE
      ?auto_1954308 - SURFACE
      ?auto_1954310 - SURFACE
      ?auto_1954309 - SURFACE
      ?auto_1954311 - SURFACE
      ?auto_1954312 - SURFACE
      ?auto_1954313 - SURFACE
      ?auto_1954314 - SURFACE
      ?auto_1954315 - SURFACE
      ?auto_1954316 - SURFACE
    )
    :vars
    (
      ?auto_1954320 - HOIST
      ?auto_1954317 - PLACE
      ?auto_1954319 - PLACE
      ?auto_1954322 - HOIST
      ?auto_1954321 - SURFACE
      ?auto_1954318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954320 ?auto_1954317 ) ( SURFACE-AT ?auto_1954315 ?auto_1954317 ) ( CLEAR ?auto_1954315 ) ( IS-CRATE ?auto_1954316 ) ( not ( = ?auto_1954315 ?auto_1954316 ) ) ( AVAILABLE ?auto_1954320 ) ( ON ?auto_1954315 ?auto_1954314 ) ( not ( = ?auto_1954314 ?auto_1954315 ) ) ( not ( = ?auto_1954314 ?auto_1954316 ) ) ( not ( = ?auto_1954319 ?auto_1954317 ) ) ( HOIST-AT ?auto_1954322 ?auto_1954319 ) ( not ( = ?auto_1954320 ?auto_1954322 ) ) ( AVAILABLE ?auto_1954322 ) ( SURFACE-AT ?auto_1954316 ?auto_1954319 ) ( ON ?auto_1954316 ?auto_1954321 ) ( CLEAR ?auto_1954316 ) ( not ( = ?auto_1954315 ?auto_1954321 ) ) ( not ( = ?auto_1954316 ?auto_1954321 ) ) ( not ( = ?auto_1954314 ?auto_1954321 ) ) ( TRUCK-AT ?auto_1954318 ?auto_1954317 ) ( ON ?auto_1954306 ?auto_1954305 ) ( ON ?auto_1954307 ?auto_1954306 ) ( ON ?auto_1954304 ?auto_1954307 ) ( ON ?auto_1954308 ?auto_1954304 ) ( ON ?auto_1954310 ?auto_1954308 ) ( ON ?auto_1954309 ?auto_1954310 ) ( ON ?auto_1954311 ?auto_1954309 ) ( ON ?auto_1954312 ?auto_1954311 ) ( ON ?auto_1954313 ?auto_1954312 ) ( ON ?auto_1954314 ?auto_1954313 ) ( not ( = ?auto_1954305 ?auto_1954306 ) ) ( not ( = ?auto_1954305 ?auto_1954307 ) ) ( not ( = ?auto_1954305 ?auto_1954304 ) ) ( not ( = ?auto_1954305 ?auto_1954308 ) ) ( not ( = ?auto_1954305 ?auto_1954310 ) ) ( not ( = ?auto_1954305 ?auto_1954309 ) ) ( not ( = ?auto_1954305 ?auto_1954311 ) ) ( not ( = ?auto_1954305 ?auto_1954312 ) ) ( not ( = ?auto_1954305 ?auto_1954313 ) ) ( not ( = ?auto_1954305 ?auto_1954314 ) ) ( not ( = ?auto_1954305 ?auto_1954315 ) ) ( not ( = ?auto_1954305 ?auto_1954316 ) ) ( not ( = ?auto_1954305 ?auto_1954321 ) ) ( not ( = ?auto_1954306 ?auto_1954307 ) ) ( not ( = ?auto_1954306 ?auto_1954304 ) ) ( not ( = ?auto_1954306 ?auto_1954308 ) ) ( not ( = ?auto_1954306 ?auto_1954310 ) ) ( not ( = ?auto_1954306 ?auto_1954309 ) ) ( not ( = ?auto_1954306 ?auto_1954311 ) ) ( not ( = ?auto_1954306 ?auto_1954312 ) ) ( not ( = ?auto_1954306 ?auto_1954313 ) ) ( not ( = ?auto_1954306 ?auto_1954314 ) ) ( not ( = ?auto_1954306 ?auto_1954315 ) ) ( not ( = ?auto_1954306 ?auto_1954316 ) ) ( not ( = ?auto_1954306 ?auto_1954321 ) ) ( not ( = ?auto_1954307 ?auto_1954304 ) ) ( not ( = ?auto_1954307 ?auto_1954308 ) ) ( not ( = ?auto_1954307 ?auto_1954310 ) ) ( not ( = ?auto_1954307 ?auto_1954309 ) ) ( not ( = ?auto_1954307 ?auto_1954311 ) ) ( not ( = ?auto_1954307 ?auto_1954312 ) ) ( not ( = ?auto_1954307 ?auto_1954313 ) ) ( not ( = ?auto_1954307 ?auto_1954314 ) ) ( not ( = ?auto_1954307 ?auto_1954315 ) ) ( not ( = ?auto_1954307 ?auto_1954316 ) ) ( not ( = ?auto_1954307 ?auto_1954321 ) ) ( not ( = ?auto_1954304 ?auto_1954308 ) ) ( not ( = ?auto_1954304 ?auto_1954310 ) ) ( not ( = ?auto_1954304 ?auto_1954309 ) ) ( not ( = ?auto_1954304 ?auto_1954311 ) ) ( not ( = ?auto_1954304 ?auto_1954312 ) ) ( not ( = ?auto_1954304 ?auto_1954313 ) ) ( not ( = ?auto_1954304 ?auto_1954314 ) ) ( not ( = ?auto_1954304 ?auto_1954315 ) ) ( not ( = ?auto_1954304 ?auto_1954316 ) ) ( not ( = ?auto_1954304 ?auto_1954321 ) ) ( not ( = ?auto_1954308 ?auto_1954310 ) ) ( not ( = ?auto_1954308 ?auto_1954309 ) ) ( not ( = ?auto_1954308 ?auto_1954311 ) ) ( not ( = ?auto_1954308 ?auto_1954312 ) ) ( not ( = ?auto_1954308 ?auto_1954313 ) ) ( not ( = ?auto_1954308 ?auto_1954314 ) ) ( not ( = ?auto_1954308 ?auto_1954315 ) ) ( not ( = ?auto_1954308 ?auto_1954316 ) ) ( not ( = ?auto_1954308 ?auto_1954321 ) ) ( not ( = ?auto_1954310 ?auto_1954309 ) ) ( not ( = ?auto_1954310 ?auto_1954311 ) ) ( not ( = ?auto_1954310 ?auto_1954312 ) ) ( not ( = ?auto_1954310 ?auto_1954313 ) ) ( not ( = ?auto_1954310 ?auto_1954314 ) ) ( not ( = ?auto_1954310 ?auto_1954315 ) ) ( not ( = ?auto_1954310 ?auto_1954316 ) ) ( not ( = ?auto_1954310 ?auto_1954321 ) ) ( not ( = ?auto_1954309 ?auto_1954311 ) ) ( not ( = ?auto_1954309 ?auto_1954312 ) ) ( not ( = ?auto_1954309 ?auto_1954313 ) ) ( not ( = ?auto_1954309 ?auto_1954314 ) ) ( not ( = ?auto_1954309 ?auto_1954315 ) ) ( not ( = ?auto_1954309 ?auto_1954316 ) ) ( not ( = ?auto_1954309 ?auto_1954321 ) ) ( not ( = ?auto_1954311 ?auto_1954312 ) ) ( not ( = ?auto_1954311 ?auto_1954313 ) ) ( not ( = ?auto_1954311 ?auto_1954314 ) ) ( not ( = ?auto_1954311 ?auto_1954315 ) ) ( not ( = ?auto_1954311 ?auto_1954316 ) ) ( not ( = ?auto_1954311 ?auto_1954321 ) ) ( not ( = ?auto_1954312 ?auto_1954313 ) ) ( not ( = ?auto_1954312 ?auto_1954314 ) ) ( not ( = ?auto_1954312 ?auto_1954315 ) ) ( not ( = ?auto_1954312 ?auto_1954316 ) ) ( not ( = ?auto_1954312 ?auto_1954321 ) ) ( not ( = ?auto_1954313 ?auto_1954314 ) ) ( not ( = ?auto_1954313 ?auto_1954315 ) ) ( not ( = ?auto_1954313 ?auto_1954316 ) ) ( not ( = ?auto_1954313 ?auto_1954321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1954314 ?auto_1954315 ?auto_1954316 )
      ( MAKE-12CRATE-VERIFY ?auto_1954305 ?auto_1954306 ?auto_1954307 ?auto_1954304 ?auto_1954308 ?auto_1954310 ?auto_1954309 ?auto_1954311 ?auto_1954312 ?auto_1954313 ?auto_1954314 ?auto_1954315 ?auto_1954316 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1954468 - SURFACE
      ?auto_1954469 - SURFACE
      ?auto_1954470 - SURFACE
      ?auto_1954467 - SURFACE
      ?auto_1954471 - SURFACE
      ?auto_1954473 - SURFACE
      ?auto_1954472 - SURFACE
      ?auto_1954474 - SURFACE
      ?auto_1954475 - SURFACE
      ?auto_1954476 - SURFACE
      ?auto_1954477 - SURFACE
      ?auto_1954478 - SURFACE
      ?auto_1954479 - SURFACE
    )
    :vars
    (
      ?auto_1954482 - HOIST
      ?auto_1954485 - PLACE
      ?auto_1954484 - PLACE
      ?auto_1954483 - HOIST
      ?auto_1954481 - SURFACE
      ?auto_1954480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954482 ?auto_1954485 ) ( IS-CRATE ?auto_1954479 ) ( not ( = ?auto_1954478 ?auto_1954479 ) ) ( not ( = ?auto_1954477 ?auto_1954478 ) ) ( not ( = ?auto_1954477 ?auto_1954479 ) ) ( not ( = ?auto_1954484 ?auto_1954485 ) ) ( HOIST-AT ?auto_1954483 ?auto_1954484 ) ( not ( = ?auto_1954482 ?auto_1954483 ) ) ( AVAILABLE ?auto_1954483 ) ( SURFACE-AT ?auto_1954479 ?auto_1954484 ) ( ON ?auto_1954479 ?auto_1954481 ) ( CLEAR ?auto_1954479 ) ( not ( = ?auto_1954478 ?auto_1954481 ) ) ( not ( = ?auto_1954479 ?auto_1954481 ) ) ( not ( = ?auto_1954477 ?auto_1954481 ) ) ( TRUCK-AT ?auto_1954480 ?auto_1954485 ) ( SURFACE-AT ?auto_1954477 ?auto_1954485 ) ( CLEAR ?auto_1954477 ) ( LIFTING ?auto_1954482 ?auto_1954478 ) ( IS-CRATE ?auto_1954478 ) ( ON ?auto_1954469 ?auto_1954468 ) ( ON ?auto_1954470 ?auto_1954469 ) ( ON ?auto_1954467 ?auto_1954470 ) ( ON ?auto_1954471 ?auto_1954467 ) ( ON ?auto_1954473 ?auto_1954471 ) ( ON ?auto_1954472 ?auto_1954473 ) ( ON ?auto_1954474 ?auto_1954472 ) ( ON ?auto_1954475 ?auto_1954474 ) ( ON ?auto_1954476 ?auto_1954475 ) ( ON ?auto_1954477 ?auto_1954476 ) ( not ( = ?auto_1954468 ?auto_1954469 ) ) ( not ( = ?auto_1954468 ?auto_1954470 ) ) ( not ( = ?auto_1954468 ?auto_1954467 ) ) ( not ( = ?auto_1954468 ?auto_1954471 ) ) ( not ( = ?auto_1954468 ?auto_1954473 ) ) ( not ( = ?auto_1954468 ?auto_1954472 ) ) ( not ( = ?auto_1954468 ?auto_1954474 ) ) ( not ( = ?auto_1954468 ?auto_1954475 ) ) ( not ( = ?auto_1954468 ?auto_1954476 ) ) ( not ( = ?auto_1954468 ?auto_1954477 ) ) ( not ( = ?auto_1954468 ?auto_1954478 ) ) ( not ( = ?auto_1954468 ?auto_1954479 ) ) ( not ( = ?auto_1954468 ?auto_1954481 ) ) ( not ( = ?auto_1954469 ?auto_1954470 ) ) ( not ( = ?auto_1954469 ?auto_1954467 ) ) ( not ( = ?auto_1954469 ?auto_1954471 ) ) ( not ( = ?auto_1954469 ?auto_1954473 ) ) ( not ( = ?auto_1954469 ?auto_1954472 ) ) ( not ( = ?auto_1954469 ?auto_1954474 ) ) ( not ( = ?auto_1954469 ?auto_1954475 ) ) ( not ( = ?auto_1954469 ?auto_1954476 ) ) ( not ( = ?auto_1954469 ?auto_1954477 ) ) ( not ( = ?auto_1954469 ?auto_1954478 ) ) ( not ( = ?auto_1954469 ?auto_1954479 ) ) ( not ( = ?auto_1954469 ?auto_1954481 ) ) ( not ( = ?auto_1954470 ?auto_1954467 ) ) ( not ( = ?auto_1954470 ?auto_1954471 ) ) ( not ( = ?auto_1954470 ?auto_1954473 ) ) ( not ( = ?auto_1954470 ?auto_1954472 ) ) ( not ( = ?auto_1954470 ?auto_1954474 ) ) ( not ( = ?auto_1954470 ?auto_1954475 ) ) ( not ( = ?auto_1954470 ?auto_1954476 ) ) ( not ( = ?auto_1954470 ?auto_1954477 ) ) ( not ( = ?auto_1954470 ?auto_1954478 ) ) ( not ( = ?auto_1954470 ?auto_1954479 ) ) ( not ( = ?auto_1954470 ?auto_1954481 ) ) ( not ( = ?auto_1954467 ?auto_1954471 ) ) ( not ( = ?auto_1954467 ?auto_1954473 ) ) ( not ( = ?auto_1954467 ?auto_1954472 ) ) ( not ( = ?auto_1954467 ?auto_1954474 ) ) ( not ( = ?auto_1954467 ?auto_1954475 ) ) ( not ( = ?auto_1954467 ?auto_1954476 ) ) ( not ( = ?auto_1954467 ?auto_1954477 ) ) ( not ( = ?auto_1954467 ?auto_1954478 ) ) ( not ( = ?auto_1954467 ?auto_1954479 ) ) ( not ( = ?auto_1954467 ?auto_1954481 ) ) ( not ( = ?auto_1954471 ?auto_1954473 ) ) ( not ( = ?auto_1954471 ?auto_1954472 ) ) ( not ( = ?auto_1954471 ?auto_1954474 ) ) ( not ( = ?auto_1954471 ?auto_1954475 ) ) ( not ( = ?auto_1954471 ?auto_1954476 ) ) ( not ( = ?auto_1954471 ?auto_1954477 ) ) ( not ( = ?auto_1954471 ?auto_1954478 ) ) ( not ( = ?auto_1954471 ?auto_1954479 ) ) ( not ( = ?auto_1954471 ?auto_1954481 ) ) ( not ( = ?auto_1954473 ?auto_1954472 ) ) ( not ( = ?auto_1954473 ?auto_1954474 ) ) ( not ( = ?auto_1954473 ?auto_1954475 ) ) ( not ( = ?auto_1954473 ?auto_1954476 ) ) ( not ( = ?auto_1954473 ?auto_1954477 ) ) ( not ( = ?auto_1954473 ?auto_1954478 ) ) ( not ( = ?auto_1954473 ?auto_1954479 ) ) ( not ( = ?auto_1954473 ?auto_1954481 ) ) ( not ( = ?auto_1954472 ?auto_1954474 ) ) ( not ( = ?auto_1954472 ?auto_1954475 ) ) ( not ( = ?auto_1954472 ?auto_1954476 ) ) ( not ( = ?auto_1954472 ?auto_1954477 ) ) ( not ( = ?auto_1954472 ?auto_1954478 ) ) ( not ( = ?auto_1954472 ?auto_1954479 ) ) ( not ( = ?auto_1954472 ?auto_1954481 ) ) ( not ( = ?auto_1954474 ?auto_1954475 ) ) ( not ( = ?auto_1954474 ?auto_1954476 ) ) ( not ( = ?auto_1954474 ?auto_1954477 ) ) ( not ( = ?auto_1954474 ?auto_1954478 ) ) ( not ( = ?auto_1954474 ?auto_1954479 ) ) ( not ( = ?auto_1954474 ?auto_1954481 ) ) ( not ( = ?auto_1954475 ?auto_1954476 ) ) ( not ( = ?auto_1954475 ?auto_1954477 ) ) ( not ( = ?auto_1954475 ?auto_1954478 ) ) ( not ( = ?auto_1954475 ?auto_1954479 ) ) ( not ( = ?auto_1954475 ?auto_1954481 ) ) ( not ( = ?auto_1954476 ?auto_1954477 ) ) ( not ( = ?auto_1954476 ?auto_1954478 ) ) ( not ( = ?auto_1954476 ?auto_1954479 ) ) ( not ( = ?auto_1954476 ?auto_1954481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1954477 ?auto_1954478 ?auto_1954479 )
      ( MAKE-12CRATE-VERIFY ?auto_1954468 ?auto_1954469 ?auto_1954470 ?auto_1954467 ?auto_1954471 ?auto_1954473 ?auto_1954472 ?auto_1954474 ?auto_1954475 ?auto_1954476 ?auto_1954477 ?auto_1954478 ?auto_1954479 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1954631 - SURFACE
      ?auto_1954632 - SURFACE
      ?auto_1954633 - SURFACE
      ?auto_1954630 - SURFACE
      ?auto_1954634 - SURFACE
      ?auto_1954636 - SURFACE
      ?auto_1954635 - SURFACE
      ?auto_1954637 - SURFACE
      ?auto_1954638 - SURFACE
      ?auto_1954639 - SURFACE
      ?auto_1954640 - SURFACE
      ?auto_1954641 - SURFACE
      ?auto_1954642 - SURFACE
    )
    :vars
    (
      ?auto_1954646 - HOIST
      ?auto_1954643 - PLACE
      ?auto_1954648 - PLACE
      ?auto_1954647 - HOIST
      ?auto_1954645 - SURFACE
      ?auto_1954644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954646 ?auto_1954643 ) ( IS-CRATE ?auto_1954642 ) ( not ( = ?auto_1954641 ?auto_1954642 ) ) ( not ( = ?auto_1954640 ?auto_1954641 ) ) ( not ( = ?auto_1954640 ?auto_1954642 ) ) ( not ( = ?auto_1954648 ?auto_1954643 ) ) ( HOIST-AT ?auto_1954647 ?auto_1954648 ) ( not ( = ?auto_1954646 ?auto_1954647 ) ) ( AVAILABLE ?auto_1954647 ) ( SURFACE-AT ?auto_1954642 ?auto_1954648 ) ( ON ?auto_1954642 ?auto_1954645 ) ( CLEAR ?auto_1954642 ) ( not ( = ?auto_1954641 ?auto_1954645 ) ) ( not ( = ?auto_1954642 ?auto_1954645 ) ) ( not ( = ?auto_1954640 ?auto_1954645 ) ) ( TRUCK-AT ?auto_1954644 ?auto_1954643 ) ( SURFACE-AT ?auto_1954640 ?auto_1954643 ) ( CLEAR ?auto_1954640 ) ( IS-CRATE ?auto_1954641 ) ( AVAILABLE ?auto_1954646 ) ( IN ?auto_1954641 ?auto_1954644 ) ( ON ?auto_1954632 ?auto_1954631 ) ( ON ?auto_1954633 ?auto_1954632 ) ( ON ?auto_1954630 ?auto_1954633 ) ( ON ?auto_1954634 ?auto_1954630 ) ( ON ?auto_1954636 ?auto_1954634 ) ( ON ?auto_1954635 ?auto_1954636 ) ( ON ?auto_1954637 ?auto_1954635 ) ( ON ?auto_1954638 ?auto_1954637 ) ( ON ?auto_1954639 ?auto_1954638 ) ( ON ?auto_1954640 ?auto_1954639 ) ( not ( = ?auto_1954631 ?auto_1954632 ) ) ( not ( = ?auto_1954631 ?auto_1954633 ) ) ( not ( = ?auto_1954631 ?auto_1954630 ) ) ( not ( = ?auto_1954631 ?auto_1954634 ) ) ( not ( = ?auto_1954631 ?auto_1954636 ) ) ( not ( = ?auto_1954631 ?auto_1954635 ) ) ( not ( = ?auto_1954631 ?auto_1954637 ) ) ( not ( = ?auto_1954631 ?auto_1954638 ) ) ( not ( = ?auto_1954631 ?auto_1954639 ) ) ( not ( = ?auto_1954631 ?auto_1954640 ) ) ( not ( = ?auto_1954631 ?auto_1954641 ) ) ( not ( = ?auto_1954631 ?auto_1954642 ) ) ( not ( = ?auto_1954631 ?auto_1954645 ) ) ( not ( = ?auto_1954632 ?auto_1954633 ) ) ( not ( = ?auto_1954632 ?auto_1954630 ) ) ( not ( = ?auto_1954632 ?auto_1954634 ) ) ( not ( = ?auto_1954632 ?auto_1954636 ) ) ( not ( = ?auto_1954632 ?auto_1954635 ) ) ( not ( = ?auto_1954632 ?auto_1954637 ) ) ( not ( = ?auto_1954632 ?auto_1954638 ) ) ( not ( = ?auto_1954632 ?auto_1954639 ) ) ( not ( = ?auto_1954632 ?auto_1954640 ) ) ( not ( = ?auto_1954632 ?auto_1954641 ) ) ( not ( = ?auto_1954632 ?auto_1954642 ) ) ( not ( = ?auto_1954632 ?auto_1954645 ) ) ( not ( = ?auto_1954633 ?auto_1954630 ) ) ( not ( = ?auto_1954633 ?auto_1954634 ) ) ( not ( = ?auto_1954633 ?auto_1954636 ) ) ( not ( = ?auto_1954633 ?auto_1954635 ) ) ( not ( = ?auto_1954633 ?auto_1954637 ) ) ( not ( = ?auto_1954633 ?auto_1954638 ) ) ( not ( = ?auto_1954633 ?auto_1954639 ) ) ( not ( = ?auto_1954633 ?auto_1954640 ) ) ( not ( = ?auto_1954633 ?auto_1954641 ) ) ( not ( = ?auto_1954633 ?auto_1954642 ) ) ( not ( = ?auto_1954633 ?auto_1954645 ) ) ( not ( = ?auto_1954630 ?auto_1954634 ) ) ( not ( = ?auto_1954630 ?auto_1954636 ) ) ( not ( = ?auto_1954630 ?auto_1954635 ) ) ( not ( = ?auto_1954630 ?auto_1954637 ) ) ( not ( = ?auto_1954630 ?auto_1954638 ) ) ( not ( = ?auto_1954630 ?auto_1954639 ) ) ( not ( = ?auto_1954630 ?auto_1954640 ) ) ( not ( = ?auto_1954630 ?auto_1954641 ) ) ( not ( = ?auto_1954630 ?auto_1954642 ) ) ( not ( = ?auto_1954630 ?auto_1954645 ) ) ( not ( = ?auto_1954634 ?auto_1954636 ) ) ( not ( = ?auto_1954634 ?auto_1954635 ) ) ( not ( = ?auto_1954634 ?auto_1954637 ) ) ( not ( = ?auto_1954634 ?auto_1954638 ) ) ( not ( = ?auto_1954634 ?auto_1954639 ) ) ( not ( = ?auto_1954634 ?auto_1954640 ) ) ( not ( = ?auto_1954634 ?auto_1954641 ) ) ( not ( = ?auto_1954634 ?auto_1954642 ) ) ( not ( = ?auto_1954634 ?auto_1954645 ) ) ( not ( = ?auto_1954636 ?auto_1954635 ) ) ( not ( = ?auto_1954636 ?auto_1954637 ) ) ( not ( = ?auto_1954636 ?auto_1954638 ) ) ( not ( = ?auto_1954636 ?auto_1954639 ) ) ( not ( = ?auto_1954636 ?auto_1954640 ) ) ( not ( = ?auto_1954636 ?auto_1954641 ) ) ( not ( = ?auto_1954636 ?auto_1954642 ) ) ( not ( = ?auto_1954636 ?auto_1954645 ) ) ( not ( = ?auto_1954635 ?auto_1954637 ) ) ( not ( = ?auto_1954635 ?auto_1954638 ) ) ( not ( = ?auto_1954635 ?auto_1954639 ) ) ( not ( = ?auto_1954635 ?auto_1954640 ) ) ( not ( = ?auto_1954635 ?auto_1954641 ) ) ( not ( = ?auto_1954635 ?auto_1954642 ) ) ( not ( = ?auto_1954635 ?auto_1954645 ) ) ( not ( = ?auto_1954637 ?auto_1954638 ) ) ( not ( = ?auto_1954637 ?auto_1954639 ) ) ( not ( = ?auto_1954637 ?auto_1954640 ) ) ( not ( = ?auto_1954637 ?auto_1954641 ) ) ( not ( = ?auto_1954637 ?auto_1954642 ) ) ( not ( = ?auto_1954637 ?auto_1954645 ) ) ( not ( = ?auto_1954638 ?auto_1954639 ) ) ( not ( = ?auto_1954638 ?auto_1954640 ) ) ( not ( = ?auto_1954638 ?auto_1954641 ) ) ( not ( = ?auto_1954638 ?auto_1954642 ) ) ( not ( = ?auto_1954638 ?auto_1954645 ) ) ( not ( = ?auto_1954639 ?auto_1954640 ) ) ( not ( = ?auto_1954639 ?auto_1954641 ) ) ( not ( = ?auto_1954639 ?auto_1954642 ) ) ( not ( = ?auto_1954639 ?auto_1954645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1954640 ?auto_1954641 ?auto_1954642 )
      ( MAKE-12CRATE-VERIFY ?auto_1954631 ?auto_1954632 ?auto_1954633 ?auto_1954630 ?auto_1954634 ?auto_1954636 ?auto_1954635 ?auto_1954637 ?auto_1954638 ?auto_1954639 ?auto_1954640 ?auto_1954641 ?auto_1954642 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966182 - SURFACE
      ?auto_1966183 - SURFACE
      ?auto_1966184 - SURFACE
      ?auto_1966181 - SURFACE
      ?auto_1966185 - SURFACE
      ?auto_1966187 - SURFACE
      ?auto_1966186 - SURFACE
      ?auto_1966188 - SURFACE
      ?auto_1966189 - SURFACE
      ?auto_1966190 - SURFACE
      ?auto_1966191 - SURFACE
      ?auto_1966192 - SURFACE
      ?auto_1966193 - SURFACE
      ?auto_1966194 - SURFACE
    )
    :vars
    (
      ?auto_1966195 - HOIST
      ?auto_1966196 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966195 ?auto_1966196 ) ( SURFACE-AT ?auto_1966193 ?auto_1966196 ) ( CLEAR ?auto_1966193 ) ( LIFTING ?auto_1966195 ?auto_1966194 ) ( IS-CRATE ?auto_1966194 ) ( not ( = ?auto_1966193 ?auto_1966194 ) ) ( ON ?auto_1966183 ?auto_1966182 ) ( ON ?auto_1966184 ?auto_1966183 ) ( ON ?auto_1966181 ?auto_1966184 ) ( ON ?auto_1966185 ?auto_1966181 ) ( ON ?auto_1966187 ?auto_1966185 ) ( ON ?auto_1966186 ?auto_1966187 ) ( ON ?auto_1966188 ?auto_1966186 ) ( ON ?auto_1966189 ?auto_1966188 ) ( ON ?auto_1966190 ?auto_1966189 ) ( ON ?auto_1966191 ?auto_1966190 ) ( ON ?auto_1966192 ?auto_1966191 ) ( ON ?auto_1966193 ?auto_1966192 ) ( not ( = ?auto_1966182 ?auto_1966183 ) ) ( not ( = ?auto_1966182 ?auto_1966184 ) ) ( not ( = ?auto_1966182 ?auto_1966181 ) ) ( not ( = ?auto_1966182 ?auto_1966185 ) ) ( not ( = ?auto_1966182 ?auto_1966187 ) ) ( not ( = ?auto_1966182 ?auto_1966186 ) ) ( not ( = ?auto_1966182 ?auto_1966188 ) ) ( not ( = ?auto_1966182 ?auto_1966189 ) ) ( not ( = ?auto_1966182 ?auto_1966190 ) ) ( not ( = ?auto_1966182 ?auto_1966191 ) ) ( not ( = ?auto_1966182 ?auto_1966192 ) ) ( not ( = ?auto_1966182 ?auto_1966193 ) ) ( not ( = ?auto_1966182 ?auto_1966194 ) ) ( not ( = ?auto_1966183 ?auto_1966184 ) ) ( not ( = ?auto_1966183 ?auto_1966181 ) ) ( not ( = ?auto_1966183 ?auto_1966185 ) ) ( not ( = ?auto_1966183 ?auto_1966187 ) ) ( not ( = ?auto_1966183 ?auto_1966186 ) ) ( not ( = ?auto_1966183 ?auto_1966188 ) ) ( not ( = ?auto_1966183 ?auto_1966189 ) ) ( not ( = ?auto_1966183 ?auto_1966190 ) ) ( not ( = ?auto_1966183 ?auto_1966191 ) ) ( not ( = ?auto_1966183 ?auto_1966192 ) ) ( not ( = ?auto_1966183 ?auto_1966193 ) ) ( not ( = ?auto_1966183 ?auto_1966194 ) ) ( not ( = ?auto_1966184 ?auto_1966181 ) ) ( not ( = ?auto_1966184 ?auto_1966185 ) ) ( not ( = ?auto_1966184 ?auto_1966187 ) ) ( not ( = ?auto_1966184 ?auto_1966186 ) ) ( not ( = ?auto_1966184 ?auto_1966188 ) ) ( not ( = ?auto_1966184 ?auto_1966189 ) ) ( not ( = ?auto_1966184 ?auto_1966190 ) ) ( not ( = ?auto_1966184 ?auto_1966191 ) ) ( not ( = ?auto_1966184 ?auto_1966192 ) ) ( not ( = ?auto_1966184 ?auto_1966193 ) ) ( not ( = ?auto_1966184 ?auto_1966194 ) ) ( not ( = ?auto_1966181 ?auto_1966185 ) ) ( not ( = ?auto_1966181 ?auto_1966187 ) ) ( not ( = ?auto_1966181 ?auto_1966186 ) ) ( not ( = ?auto_1966181 ?auto_1966188 ) ) ( not ( = ?auto_1966181 ?auto_1966189 ) ) ( not ( = ?auto_1966181 ?auto_1966190 ) ) ( not ( = ?auto_1966181 ?auto_1966191 ) ) ( not ( = ?auto_1966181 ?auto_1966192 ) ) ( not ( = ?auto_1966181 ?auto_1966193 ) ) ( not ( = ?auto_1966181 ?auto_1966194 ) ) ( not ( = ?auto_1966185 ?auto_1966187 ) ) ( not ( = ?auto_1966185 ?auto_1966186 ) ) ( not ( = ?auto_1966185 ?auto_1966188 ) ) ( not ( = ?auto_1966185 ?auto_1966189 ) ) ( not ( = ?auto_1966185 ?auto_1966190 ) ) ( not ( = ?auto_1966185 ?auto_1966191 ) ) ( not ( = ?auto_1966185 ?auto_1966192 ) ) ( not ( = ?auto_1966185 ?auto_1966193 ) ) ( not ( = ?auto_1966185 ?auto_1966194 ) ) ( not ( = ?auto_1966187 ?auto_1966186 ) ) ( not ( = ?auto_1966187 ?auto_1966188 ) ) ( not ( = ?auto_1966187 ?auto_1966189 ) ) ( not ( = ?auto_1966187 ?auto_1966190 ) ) ( not ( = ?auto_1966187 ?auto_1966191 ) ) ( not ( = ?auto_1966187 ?auto_1966192 ) ) ( not ( = ?auto_1966187 ?auto_1966193 ) ) ( not ( = ?auto_1966187 ?auto_1966194 ) ) ( not ( = ?auto_1966186 ?auto_1966188 ) ) ( not ( = ?auto_1966186 ?auto_1966189 ) ) ( not ( = ?auto_1966186 ?auto_1966190 ) ) ( not ( = ?auto_1966186 ?auto_1966191 ) ) ( not ( = ?auto_1966186 ?auto_1966192 ) ) ( not ( = ?auto_1966186 ?auto_1966193 ) ) ( not ( = ?auto_1966186 ?auto_1966194 ) ) ( not ( = ?auto_1966188 ?auto_1966189 ) ) ( not ( = ?auto_1966188 ?auto_1966190 ) ) ( not ( = ?auto_1966188 ?auto_1966191 ) ) ( not ( = ?auto_1966188 ?auto_1966192 ) ) ( not ( = ?auto_1966188 ?auto_1966193 ) ) ( not ( = ?auto_1966188 ?auto_1966194 ) ) ( not ( = ?auto_1966189 ?auto_1966190 ) ) ( not ( = ?auto_1966189 ?auto_1966191 ) ) ( not ( = ?auto_1966189 ?auto_1966192 ) ) ( not ( = ?auto_1966189 ?auto_1966193 ) ) ( not ( = ?auto_1966189 ?auto_1966194 ) ) ( not ( = ?auto_1966190 ?auto_1966191 ) ) ( not ( = ?auto_1966190 ?auto_1966192 ) ) ( not ( = ?auto_1966190 ?auto_1966193 ) ) ( not ( = ?auto_1966190 ?auto_1966194 ) ) ( not ( = ?auto_1966191 ?auto_1966192 ) ) ( not ( = ?auto_1966191 ?auto_1966193 ) ) ( not ( = ?auto_1966191 ?auto_1966194 ) ) ( not ( = ?auto_1966192 ?auto_1966193 ) ) ( not ( = ?auto_1966192 ?auto_1966194 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1966193 ?auto_1966194 )
      ( MAKE-13CRATE-VERIFY ?auto_1966182 ?auto_1966183 ?auto_1966184 ?auto_1966181 ?auto_1966185 ?auto_1966187 ?auto_1966186 ?auto_1966188 ?auto_1966189 ?auto_1966190 ?auto_1966191 ?auto_1966192 ?auto_1966193 ?auto_1966194 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966324 - SURFACE
      ?auto_1966325 - SURFACE
      ?auto_1966326 - SURFACE
      ?auto_1966323 - SURFACE
      ?auto_1966327 - SURFACE
      ?auto_1966329 - SURFACE
      ?auto_1966328 - SURFACE
      ?auto_1966330 - SURFACE
      ?auto_1966331 - SURFACE
      ?auto_1966332 - SURFACE
      ?auto_1966333 - SURFACE
      ?auto_1966334 - SURFACE
      ?auto_1966335 - SURFACE
      ?auto_1966336 - SURFACE
    )
    :vars
    (
      ?auto_1966337 - HOIST
      ?auto_1966338 - PLACE
      ?auto_1966339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966337 ?auto_1966338 ) ( SURFACE-AT ?auto_1966335 ?auto_1966338 ) ( CLEAR ?auto_1966335 ) ( IS-CRATE ?auto_1966336 ) ( not ( = ?auto_1966335 ?auto_1966336 ) ) ( TRUCK-AT ?auto_1966339 ?auto_1966338 ) ( AVAILABLE ?auto_1966337 ) ( IN ?auto_1966336 ?auto_1966339 ) ( ON ?auto_1966335 ?auto_1966334 ) ( not ( = ?auto_1966334 ?auto_1966335 ) ) ( not ( = ?auto_1966334 ?auto_1966336 ) ) ( ON ?auto_1966325 ?auto_1966324 ) ( ON ?auto_1966326 ?auto_1966325 ) ( ON ?auto_1966323 ?auto_1966326 ) ( ON ?auto_1966327 ?auto_1966323 ) ( ON ?auto_1966329 ?auto_1966327 ) ( ON ?auto_1966328 ?auto_1966329 ) ( ON ?auto_1966330 ?auto_1966328 ) ( ON ?auto_1966331 ?auto_1966330 ) ( ON ?auto_1966332 ?auto_1966331 ) ( ON ?auto_1966333 ?auto_1966332 ) ( ON ?auto_1966334 ?auto_1966333 ) ( not ( = ?auto_1966324 ?auto_1966325 ) ) ( not ( = ?auto_1966324 ?auto_1966326 ) ) ( not ( = ?auto_1966324 ?auto_1966323 ) ) ( not ( = ?auto_1966324 ?auto_1966327 ) ) ( not ( = ?auto_1966324 ?auto_1966329 ) ) ( not ( = ?auto_1966324 ?auto_1966328 ) ) ( not ( = ?auto_1966324 ?auto_1966330 ) ) ( not ( = ?auto_1966324 ?auto_1966331 ) ) ( not ( = ?auto_1966324 ?auto_1966332 ) ) ( not ( = ?auto_1966324 ?auto_1966333 ) ) ( not ( = ?auto_1966324 ?auto_1966334 ) ) ( not ( = ?auto_1966324 ?auto_1966335 ) ) ( not ( = ?auto_1966324 ?auto_1966336 ) ) ( not ( = ?auto_1966325 ?auto_1966326 ) ) ( not ( = ?auto_1966325 ?auto_1966323 ) ) ( not ( = ?auto_1966325 ?auto_1966327 ) ) ( not ( = ?auto_1966325 ?auto_1966329 ) ) ( not ( = ?auto_1966325 ?auto_1966328 ) ) ( not ( = ?auto_1966325 ?auto_1966330 ) ) ( not ( = ?auto_1966325 ?auto_1966331 ) ) ( not ( = ?auto_1966325 ?auto_1966332 ) ) ( not ( = ?auto_1966325 ?auto_1966333 ) ) ( not ( = ?auto_1966325 ?auto_1966334 ) ) ( not ( = ?auto_1966325 ?auto_1966335 ) ) ( not ( = ?auto_1966325 ?auto_1966336 ) ) ( not ( = ?auto_1966326 ?auto_1966323 ) ) ( not ( = ?auto_1966326 ?auto_1966327 ) ) ( not ( = ?auto_1966326 ?auto_1966329 ) ) ( not ( = ?auto_1966326 ?auto_1966328 ) ) ( not ( = ?auto_1966326 ?auto_1966330 ) ) ( not ( = ?auto_1966326 ?auto_1966331 ) ) ( not ( = ?auto_1966326 ?auto_1966332 ) ) ( not ( = ?auto_1966326 ?auto_1966333 ) ) ( not ( = ?auto_1966326 ?auto_1966334 ) ) ( not ( = ?auto_1966326 ?auto_1966335 ) ) ( not ( = ?auto_1966326 ?auto_1966336 ) ) ( not ( = ?auto_1966323 ?auto_1966327 ) ) ( not ( = ?auto_1966323 ?auto_1966329 ) ) ( not ( = ?auto_1966323 ?auto_1966328 ) ) ( not ( = ?auto_1966323 ?auto_1966330 ) ) ( not ( = ?auto_1966323 ?auto_1966331 ) ) ( not ( = ?auto_1966323 ?auto_1966332 ) ) ( not ( = ?auto_1966323 ?auto_1966333 ) ) ( not ( = ?auto_1966323 ?auto_1966334 ) ) ( not ( = ?auto_1966323 ?auto_1966335 ) ) ( not ( = ?auto_1966323 ?auto_1966336 ) ) ( not ( = ?auto_1966327 ?auto_1966329 ) ) ( not ( = ?auto_1966327 ?auto_1966328 ) ) ( not ( = ?auto_1966327 ?auto_1966330 ) ) ( not ( = ?auto_1966327 ?auto_1966331 ) ) ( not ( = ?auto_1966327 ?auto_1966332 ) ) ( not ( = ?auto_1966327 ?auto_1966333 ) ) ( not ( = ?auto_1966327 ?auto_1966334 ) ) ( not ( = ?auto_1966327 ?auto_1966335 ) ) ( not ( = ?auto_1966327 ?auto_1966336 ) ) ( not ( = ?auto_1966329 ?auto_1966328 ) ) ( not ( = ?auto_1966329 ?auto_1966330 ) ) ( not ( = ?auto_1966329 ?auto_1966331 ) ) ( not ( = ?auto_1966329 ?auto_1966332 ) ) ( not ( = ?auto_1966329 ?auto_1966333 ) ) ( not ( = ?auto_1966329 ?auto_1966334 ) ) ( not ( = ?auto_1966329 ?auto_1966335 ) ) ( not ( = ?auto_1966329 ?auto_1966336 ) ) ( not ( = ?auto_1966328 ?auto_1966330 ) ) ( not ( = ?auto_1966328 ?auto_1966331 ) ) ( not ( = ?auto_1966328 ?auto_1966332 ) ) ( not ( = ?auto_1966328 ?auto_1966333 ) ) ( not ( = ?auto_1966328 ?auto_1966334 ) ) ( not ( = ?auto_1966328 ?auto_1966335 ) ) ( not ( = ?auto_1966328 ?auto_1966336 ) ) ( not ( = ?auto_1966330 ?auto_1966331 ) ) ( not ( = ?auto_1966330 ?auto_1966332 ) ) ( not ( = ?auto_1966330 ?auto_1966333 ) ) ( not ( = ?auto_1966330 ?auto_1966334 ) ) ( not ( = ?auto_1966330 ?auto_1966335 ) ) ( not ( = ?auto_1966330 ?auto_1966336 ) ) ( not ( = ?auto_1966331 ?auto_1966332 ) ) ( not ( = ?auto_1966331 ?auto_1966333 ) ) ( not ( = ?auto_1966331 ?auto_1966334 ) ) ( not ( = ?auto_1966331 ?auto_1966335 ) ) ( not ( = ?auto_1966331 ?auto_1966336 ) ) ( not ( = ?auto_1966332 ?auto_1966333 ) ) ( not ( = ?auto_1966332 ?auto_1966334 ) ) ( not ( = ?auto_1966332 ?auto_1966335 ) ) ( not ( = ?auto_1966332 ?auto_1966336 ) ) ( not ( = ?auto_1966333 ?auto_1966334 ) ) ( not ( = ?auto_1966333 ?auto_1966335 ) ) ( not ( = ?auto_1966333 ?auto_1966336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966334 ?auto_1966335 ?auto_1966336 )
      ( MAKE-13CRATE-VERIFY ?auto_1966324 ?auto_1966325 ?auto_1966326 ?auto_1966323 ?auto_1966327 ?auto_1966329 ?auto_1966328 ?auto_1966330 ?auto_1966331 ?auto_1966332 ?auto_1966333 ?auto_1966334 ?auto_1966335 ?auto_1966336 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966480 - SURFACE
      ?auto_1966481 - SURFACE
      ?auto_1966482 - SURFACE
      ?auto_1966479 - SURFACE
      ?auto_1966483 - SURFACE
      ?auto_1966485 - SURFACE
      ?auto_1966484 - SURFACE
      ?auto_1966486 - SURFACE
      ?auto_1966487 - SURFACE
      ?auto_1966488 - SURFACE
      ?auto_1966489 - SURFACE
      ?auto_1966490 - SURFACE
      ?auto_1966491 - SURFACE
      ?auto_1966492 - SURFACE
    )
    :vars
    (
      ?auto_1966495 - HOIST
      ?auto_1966496 - PLACE
      ?auto_1966494 - TRUCK
      ?auto_1966493 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966495 ?auto_1966496 ) ( SURFACE-AT ?auto_1966491 ?auto_1966496 ) ( CLEAR ?auto_1966491 ) ( IS-CRATE ?auto_1966492 ) ( not ( = ?auto_1966491 ?auto_1966492 ) ) ( AVAILABLE ?auto_1966495 ) ( IN ?auto_1966492 ?auto_1966494 ) ( ON ?auto_1966491 ?auto_1966490 ) ( not ( = ?auto_1966490 ?auto_1966491 ) ) ( not ( = ?auto_1966490 ?auto_1966492 ) ) ( TRUCK-AT ?auto_1966494 ?auto_1966493 ) ( not ( = ?auto_1966493 ?auto_1966496 ) ) ( ON ?auto_1966481 ?auto_1966480 ) ( ON ?auto_1966482 ?auto_1966481 ) ( ON ?auto_1966479 ?auto_1966482 ) ( ON ?auto_1966483 ?auto_1966479 ) ( ON ?auto_1966485 ?auto_1966483 ) ( ON ?auto_1966484 ?auto_1966485 ) ( ON ?auto_1966486 ?auto_1966484 ) ( ON ?auto_1966487 ?auto_1966486 ) ( ON ?auto_1966488 ?auto_1966487 ) ( ON ?auto_1966489 ?auto_1966488 ) ( ON ?auto_1966490 ?auto_1966489 ) ( not ( = ?auto_1966480 ?auto_1966481 ) ) ( not ( = ?auto_1966480 ?auto_1966482 ) ) ( not ( = ?auto_1966480 ?auto_1966479 ) ) ( not ( = ?auto_1966480 ?auto_1966483 ) ) ( not ( = ?auto_1966480 ?auto_1966485 ) ) ( not ( = ?auto_1966480 ?auto_1966484 ) ) ( not ( = ?auto_1966480 ?auto_1966486 ) ) ( not ( = ?auto_1966480 ?auto_1966487 ) ) ( not ( = ?auto_1966480 ?auto_1966488 ) ) ( not ( = ?auto_1966480 ?auto_1966489 ) ) ( not ( = ?auto_1966480 ?auto_1966490 ) ) ( not ( = ?auto_1966480 ?auto_1966491 ) ) ( not ( = ?auto_1966480 ?auto_1966492 ) ) ( not ( = ?auto_1966481 ?auto_1966482 ) ) ( not ( = ?auto_1966481 ?auto_1966479 ) ) ( not ( = ?auto_1966481 ?auto_1966483 ) ) ( not ( = ?auto_1966481 ?auto_1966485 ) ) ( not ( = ?auto_1966481 ?auto_1966484 ) ) ( not ( = ?auto_1966481 ?auto_1966486 ) ) ( not ( = ?auto_1966481 ?auto_1966487 ) ) ( not ( = ?auto_1966481 ?auto_1966488 ) ) ( not ( = ?auto_1966481 ?auto_1966489 ) ) ( not ( = ?auto_1966481 ?auto_1966490 ) ) ( not ( = ?auto_1966481 ?auto_1966491 ) ) ( not ( = ?auto_1966481 ?auto_1966492 ) ) ( not ( = ?auto_1966482 ?auto_1966479 ) ) ( not ( = ?auto_1966482 ?auto_1966483 ) ) ( not ( = ?auto_1966482 ?auto_1966485 ) ) ( not ( = ?auto_1966482 ?auto_1966484 ) ) ( not ( = ?auto_1966482 ?auto_1966486 ) ) ( not ( = ?auto_1966482 ?auto_1966487 ) ) ( not ( = ?auto_1966482 ?auto_1966488 ) ) ( not ( = ?auto_1966482 ?auto_1966489 ) ) ( not ( = ?auto_1966482 ?auto_1966490 ) ) ( not ( = ?auto_1966482 ?auto_1966491 ) ) ( not ( = ?auto_1966482 ?auto_1966492 ) ) ( not ( = ?auto_1966479 ?auto_1966483 ) ) ( not ( = ?auto_1966479 ?auto_1966485 ) ) ( not ( = ?auto_1966479 ?auto_1966484 ) ) ( not ( = ?auto_1966479 ?auto_1966486 ) ) ( not ( = ?auto_1966479 ?auto_1966487 ) ) ( not ( = ?auto_1966479 ?auto_1966488 ) ) ( not ( = ?auto_1966479 ?auto_1966489 ) ) ( not ( = ?auto_1966479 ?auto_1966490 ) ) ( not ( = ?auto_1966479 ?auto_1966491 ) ) ( not ( = ?auto_1966479 ?auto_1966492 ) ) ( not ( = ?auto_1966483 ?auto_1966485 ) ) ( not ( = ?auto_1966483 ?auto_1966484 ) ) ( not ( = ?auto_1966483 ?auto_1966486 ) ) ( not ( = ?auto_1966483 ?auto_1966487 ) ) ( not ( = ?auto_1966483 ?auto_1966488 ) ) ( not ( = ?auto_1966483 ?auto_1966489 ) ) ( not ( = ?auto_1966483 ?auto_1966490 ) ) ( not ( = ?auto_1966483 ?auto_1966491 ) ) ( not ( = ?auto_1966483 ?auto_1966492 ) ) ( not ( = ?auto_1966485 ?auto_1966484 ) ) ( not ( = ?auto_1966485 ?auto_1966486 ) ) ( not ( = ?auto_1966485 ?auto_1966487 ) ) ( not ( = ?auto_1966485 ?auto_1966488 ) ) ( not ( = ?auto_1966485 ?auto_1966489 ) ) ( not ( = ?auto_1966485 ?auto_1966490 ) ) ( not ( = ?auto_1966485 ?auto_1966491 ) ) ( not ( = ?auto_1966485 ?auto_1966492 ) ) ( not ( = ?auto_1966484 ?auto_1966486 ) ) ( not ( = ?auto_1966484 ?auto_1966487 ) ) ( not ( = ?auto_1966484 ?auto_1966488 ) ) ( not ( = ?auto_1966484 ?auto_1966489 ) ) ( not ( = ?auto_1966484 ?auto_1966490 ) ) ( not ( = ?auto_1966484 ?auto_1966491 ) ) ( not ( = ?auto_1966484 ?auto_1966492 ) ) ( not ( = ?auto_1966486 ?auto_1966487 ) ) ( not ( = ?auto_1966486 ?auto_1966488 ) ) ( not ( = ?auto_1966486 ?auto_1966489 ) ) ( not ( = ?auto_1966486 ?auto_1966490 ) ) ( not ( = ?auto_1966486 ?auto_1966491 ) ) ( not ( = ?auto_1966486 ?auto_1966492 ) ) ( not ( = ?auto_1966487 ?auto_1966488 ) ) ( not ( = ?auto_1966487 ?auto_1966489 ) ) ( not ( = ?auto_1966487 ?auto_1966490 ) ) ( not ( = ?auto_1966487 ?auto_1966491 ) ) ( not ( = ?auto_1966487 ?auto_1966492 ) ) ( not ( = ?auto_1966488 ?auto_1966489 ) ) ( not ( = ?auto_1966488 ?auto_1966490 ) ) ( not ( = ?auto_1966488 ?auto_1966491 ) ) ( not ( = ?auto_1966488 ?auto_1966492 ) ) ( not ( = ?auto_1966489 ?auto_1966490 ) ) ( not ( = ?auto_1966489 ?auto_1966491 ) ) ( not ( = ?auto_1966489 ?auto_1966492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966490 ?auto_1966491 ?auto_1966492 )
      ( MAKE-13CRATE-VERIFY ?auto_1966480 ?auto_1966481 ?auto_1966482 ?auto_1966479 ?auto_1966483 ?auto_1966485 ?auto_1966484 ?auto_1966486 ?auto_1966487 ?auto_1966488 ?auto_1966489 ?auto_1966490 ?auto_1966491 ?auto_1966492 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966649 - SURFACE
      ?auto_1966650 - SURFACE
      ?auto_1966651 - SURFACE
      ?auto_1966648 - SURFACE
      ?auto_1966652 - SURFACE
      ?auto_1966654 - SURFACE
      ?auto_1966653 - SURFACE
      ?auto_1966655 - SURFACE
      ?auto_1966656 - SURFACE
      ?auto_1966657 - SURFACE
      ?auto_1966658 - SURFACE
      ?auto_1966659 - SURFACE
      ?auto_1966660 - SURFACE
      ?auto_1966661 - SURFACE
    )
    :vars
    (
      ?auto_1966664 - HOIST
      ?auto_1966665 - PLACE
      ?auto_1966666 - TRUCK
      ?auto_1966663 - PLACE
      ?auto_1966662 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966664 ?auto_1966665 ) ( SURFACE-AT ?auto_1966660 ?auto_1966665 ) ( CLEAR ?auto_1966660 ) ( IS-CRATE ?auto_1966661 ) ( not ( = ?auto_1966660 ?auto_1966661 ) ) ( AVAILABLE ?auto_1966664 ) ( ON ?auto_1966660 ?auto_1966659 ) ( not ( = ?auto_1966659 ?auto_1966660 ) ) ( not ( = ?auto_1966659 ?auto_1966661 ) ) ( TRUCK-AT ?auto_1966666 ?auto_1966663 ) ( not ( = ?auto_1966663 ?auto_1966665 ) ) ( HOIST-AT ?auto_1966662 ?auto_1966663 ) ( LIFTING ?auto_1966662 ?auto_1966661 ) ( not ( = ?auto_1966664 ?auto_1966662 ) ) ( ON ?auto_1966650 ?auto_1966649 ) ( ON ?auto_1966651 ?auto_1966650 ) ( ON ?auto_1966648 ?auto_1966651 ) ( ON ?auto_1966652 ?auto_1966648 ) ( ON ?auto_1966654 ?auto_1966652 ) ( ON ?auto_1966653 ?auto_1966654 ) ( ON ?auto_1966655 ?auto_1966653 ) ( ON ?auto_1966656 ?auto_1966655 ) ( ON ?auto_1966657 ?auto_1966656 ) ( ON ?auto_1966658 ?auto_1966657 ) ( ON ?auto_1966659 ?auto_1966658 ) ( not ( = ?auto_1966649 ?auto_1966650 ) ) ( not ( = ?auto_1966649 ?auto_1966651 ) ) ( not ( = ?auto_1966649 ?auto_1966648 ) ) ( not ( = ?auto_1966649 ?auto_1966652 ) ) ( not ( = ?auto_1966649 ?auto_1966654 ) ) ( not ( = ?auto_1966649 ?auto_1966653 ) ) ( not ( = ?auto_1966649 ?auto_1966655 ) ) ( not ( = ?auto_1966649 ?auto_1966656 ) ) ( not ( = ?auto_1966649 ?auto_1966657 ) ) ( not ( = ?auto_1966649 ?auto_1966658 ) ) ( not ( = ?auto_1966649 ?auto_1966659 ) ) ( not ( = ?auto_1966649 ?auto_1966660 ) ) ( not ( = ?auto_1966649 ?auto_1966661 ) ) ( not ( = ?auto_1966650 ?auto_1966651 ) ) ( not ( = ?auto_1966650 ?auto_1966648 ) ) ( not ( = ?auto_1966650 ?auto_1966652 ) ) ( not ( = ?auto_1966650 ?auto_1966654 ) ) ( not ( = ?auto_1966650 ?auto_1966653 ) ) ( not ( = ?auto_1966650 ?auto_1966655 ) ) ( not ( = ?auto_1966650 ?auto_1966656 ) ) ( not ( = ?auto_1966650 ?auto_1966657 ) ) ( not ( = ?auto_1966650 ?auto_1966658 ) ) ( not ( = ?auto_1966650 ?auto_1966659 ) ) ( not ( = ?auto_1966650 ?auto_1966660 ) ) ( not ( = ?auto_1966650 ?auto_1966661 ) ) ( not ( = ?auto_1966651 ?auto_1966648 ) ) ( not ( = ?auto_1966651 ?auto_1966652 ) ) ( not ( = ?auto_1966651 ?auto_1966654 ) ) ( not ( = ?auto_1966651 ?auto_1966653 ) ) ( not ( = ?auto_1966651 ?auto_1966655 ) ) ( not ( = ?auto_1966651 ?auto_1966656 ) ) ( not ( = ?auto_1966651 ?auto_1966657 ) ) ( not ( = ?auto_1966651 ?auto_1966658 ) ) ( not ( = ?auto_1966651 ?auto_1966659 ) ) ( not ( = ?auto_1966651 ?auto_1966660 ) ) ( not ( = ?auto_1966651 ?auto_1966661 ) ) ( not ( = ?auto_1966648 ?auto_1966652 ) ) ( not ( = ?auto_1966648 ?auto_1966654 ) ) ( not ( = ?auto_1966648 ?auto_1966653 ) ) ( not ( = ?auto_1966648 ?auto_1966655 ) ) ( not ( = ?auto_1966648 ?auto_1966656 ) ) ( not ( = ?auto_1966648 ?auto_1966657 ) ) ( not ( = ?auto_1966648 ?auto_1966658 ) ) ( not ( = ?auto_1966648 ?auto_1966659 ) ) ( not ( = ?auto_1966648 ?auto_1966660 ) ) ( not ( = ?auto_1966648 ?auto_1966661 ) ) ( not ( = ?auto_1966652 ?auto_1966654 ) ) ( not ( = ?auto_1966652 ?auto_1966653 ) ) ( not ( = ?auto_1966652 ?auto_1966655 ) ) ( not ( = ?auto_1966652 ?auto_1966656 ) ) ( not ( = ?auto_1966652 ?auto_1966657 ) ) ( not ( = ?auto_1966652 ?auto_1966658 ) ) ( not ( = ?auto_1966652 ?auto_1966659 ) ) ( not ( = ?auto_1966652 ?auto_1966660 ) ) ( not ( = ?auto_1966652 ?auto_1966661 ) ) ( not ( = ?auto_1966654 ?auto_1966653 ) ) ( not ( = ?auto_1966654 ?auto_1966655 ) ) ( not ( = ?auto_1966654 ?auto_1966656 ) ) ( not ( = ?auto_1966654 ?auto_1966657 ) ) ( not ( = ?auto_1966654 ?auto_1966658 ) ) ( not ( = ?auto_1966654 ?auto_1966659 ) ) ( not ( = ?auto_1966654 ?auto_1966660 ) ) ( not ( = ?auto_1966654 ?auto_1966661 ) ) ( not ( = ?auto_1966653 ?auto_1966655 ) ) ( not ( = ?auto_1966653 ?auto_1966656 ) ) ( not ( = ?auto_1966653 ?auto_1966657 ) ) ( not ( = ?auto_1966653 ?auto_1966658 ) ) ( not ( = ?auto_1966653 ?auto_1966659 ) ) ( not ( = ?auto_1966653 ?auto_1966660 ) ) ( not ( = ?auto_1966653 ?auto_1966661 ) ) ( not ( = ?auto_1966655 ?auto_1966656 ) ) ( not ( = ?auto_1966655 ?auto_1966657 ) ) ( not ( = ?auto_1966655 ?auto_1966658 ) ) ( not ( = ?auto_1966655 ?auto_1966659 ) ) ( not ( = ?auto_1966655 ?auto_1966660 ) ) ( not ( = ?auto_1966655 ?auto_1966661 ) ) ( not ( = ?auto_1966656 ?auto_1966657 ) ) ( not ( = ?auto_1966656 ?auto_1966658 ) ) ( not ( = ?auto_1966656 ?auto_1966659 ) ) ( not ( = ?auto_1966656 ?auto_1966660 ) ) ( not ( = ?auto_1966656 ?auto_1966661 ) ) ( not ( = ?auto_1966657 ?auto_1966658 ) ) ( not ( = ?auto_1966657 ?auto_1966659 ) ) ( not ( = ?auto_1966657 ?auto_1966660 ) ) ( not ( = ?auto_1966657 ?auto_1966661 ) ) ( not ( = ?auto_1966658 ?auto_1966659 ) ) ( not ( = ?auto_1966658 ?auto_1966660 ) ) ( not ( = ?auto_1966658 ?auto_1966661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966659 ?auto_1966660 ?auto_1966661 )
      ( MAKE-13CRATE-VERIFY ?auto_1966649 ?auto_1966650 ?auto_1966651 ?auto_1966648 ?auto_1966652 ?auto_1966654 ?auto_1966653 ?auto_1966655 ?auto_1966656 ?auto_1966657 ?auto_1966658 ?auto_1966659 ?auto_1966660 ?auto_1966661 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1966831 - SURFACE
      ?auto_1966832 - SURFACE
      ?auto_1966833 - SURFACE
      ?auto_1966830 - SURFACE
      ?auto_1966834 - SURFACE
      ?auto_1966836 - SURFACE
      ?auto_1966835 - SURFACE
      ?auto_1966837 - SURFACE
      ?auto_1966838 - SURFACE
      ?auto_1966839 - SURFACE
      ?auto_1966840 - SURFACE
      ?auto_1966841 - SURFACE
      ?auto_1966842 - SURFACE
      ?auto_1966843 - SURFACE
    )
    :vars
    (
      ?auto_1966846 - HOIST
      ?auto_1966845 - PLACE
      ?auto_1966849 - TRUCK
      ?auto_1966847 - PLACE
      ?auto_1966848 - HOIST
      ?auto_1966844 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1966846 ?auto_1966845 ) ( SURFACE-AT ?auto_1966842 ?auto_1966845 ) ( CLEAR ?auto_1966842 ) ( IS-CRATE ?auto_1966843 ) ( not ( = ?auto_1966842 ?auto_1966843 ) ) ( AVAILABLE ?auto_1966846 ) ( ON ?auto_1966842 ?auto_1966841 ) ( not ( = ?auto_1966841 ?auto_1966842 ) ) ( not ( = ?auto_1966841 ?auto_1966843 ) ) ( TRUCK-AT ?auto_1966849 ?auto_1966847 ) ( not ( = ?auto_1966847 ?auto_1966845 ) ) ( HOIST-AT ?auto_1966848 ?auto_1966847 ) ( not ( = ?auto_1966846 ?auto_1966848 ) ) ( AVAILABLE ?auto_1966848 ) ( SURFACE-AT ?auto_1966843 ?auto_1966847 ) ( ON ?auto_1966843 ?auto_1966844 ) ( CLEAR ?auto_1966843 ) ( not ( = ?auto_1966842 ?auto_1966844 ) ) ( not ( = ?auto_1966843 ?auto_1966844 ) ) ( not ( = ?auto_1966841 ?auto_1966844 ) ) ( ON ?auto_1966832 ?auto_1966831 ) ( ON ?auto_1966833 ?auto_1966832 ) ( ON ?auto_1966830 ?auto_1966833 ) ( ON ?auto_1966834 ?auto_1966830 ) ( ON ?auto_1966836 ?auto_1966834 ) ( ON ?auto_1966835 ?auto_1966836 ) ( ON ?auto_1966837 ?auto_1966835 ) ( ON ?auto_1966838 ?auto_1966837 ) ( ON ?auto_1966839 ?auto_1966838 ) ( ON ?auto_1966840 ?auto_1966839 ) ( ON ?auto_1966841 ?auto_1966840 ) ( not ( = ?auto_1966831 ?auto_1966832 ) ) ( not ( = ?auto_1966831 ?auto_1966833 ) ) ( not ( = ?auto_1966831 ?auto_1966830 ) ) ( not ( = ?auto_1966831 ?auto_1966834 ) ) ( not ( = ?auto_1966831 ?auto_1966836 ) ) ( not ( = ?auto_1966831 ?auto_1966835 ) ) ( not ( = ?auto_1966831 ?auto_1966837 ) ) ( not ( = ?auto_1966831 ?auto_1966838 ) ) ( not ( = ?auto_1966831 ?auto_1966839 ) ) ( not ( = ?auto_1966831 ?auto_1966840 ) ) ( not ( = ?auto_1966831 ?auto_1966841 ) ) ( not ( = ?auto_1966831 ?auto_1966842 ) ) ( not ( = ?auto_1966831 ?auto_1966843 ) ) ( not ( = ?auto_1966831 ?auto_1966844 ) ) ( not ( = ?auto_1966832 ?auto_1966833 ) ) ( not ( = ?auto_1966832 ?auto_1966830 ) ) ( not ( = ?auto_1966832 ?auto_1966834 ) ) ( not ( = ?auto_1966832 ?auto_1966836 ) ) ( not ( = ?auto_1966832 ?auto_1966835 ) ) ( not ( = ?auto_1966832 ?auto_1966837 ) ) ( not ( = ?auto_1966832 ?auto_1966838 ) ) ( not ( = ?auto_1966832 ?auto_1966839 ) ) ( not ( = ?auto_1966832 ?auto_1966840 ) ) ( not ( = ?auto_1966832 ?auto_1966841 ) ) ( not ( = ?auto_1966832 ?auto_1966842 ) ) ( not ( = ?auto_1966832 ?auto_1966843 ) ) ( not ( = ?auto_1966832 ?auto_1966844 ) ) ( not ( = ?auto_1966833 ?auto_1966830 ) ) ( not ( = ?auto_1966833 ?auto_1966834 ) ) ( not ( = ?auto_1966833 ?auto_1966836 ) ) ( not ( = ?auto_1966833 ?auto_1966835 ) ) ( not ( = ?auto_1966833 ?auto_1966837 ) ) ( not ( = ?auto_1966833 ?auto_1966838 ) ) ( not ( = ?auto_1966833 ?auto_1966839 ) ) ( not ( = ?auto_1966833 ?auto_1966840 ) ) ( not ( = ?auto_1966833 ?auto_1966841 ) ) ( not ( = ?auto_1966833 ?auto_1966842 ) ) ( not ( = ?auto_1966833 ?auto_1966843 ) ) ( not ( = ?auto_1966833 ?auto_1966844 ) ) ( not ( = ?auto_1966830 ?auto_1966834 ) ) ( not ( = ?auto_1966830 ?auto_1966836 ) ) ( not ( = ?auto_1966830 ?auto_1966835 ) ) ( not ( = ?auto_1966830 ?auto_1966837 ) ) ( not ( = ?auto_1966830 ?auto_1966838 ) ) ( not ( = ?auto_1966830 ?auto_1966839 ) ) ( not ( = ?auto_1966830 ?auto_1966840 ) ) ( not ( = ?auto_1966830 ?auto_1966841 ) ) ( not ( = ?auto_1966830 ?auto_1966842 ) ) ( not ( = ?auto_1966830 ?auto_1966843 ) ) ( not ( = ?auto_1966830 ?auto_1966844 ) ) ( not ( = ?auto_1966834 ?auto_1966836 ) ) ( not ( = ?auto_1966834 ?auto_1966835 ) ) ( not ( = ?auto_1966834 ?auto_1966837 ) ) ( not ( = ?auto_1966834 ?auto_1966838 ) ) ( not ( = ?auto_1966834 ?auto_1966839 ) ) ( not ( = ?auto_1966834 ?auto_1966840 ) ) ( not ( = ?auto_1966834 ?auto_1966841 ) ) ( not ( = ?auto_1966834 ?auto_1966842 ) ) ( not ( = ?auto_1966834 ?auto_1966843 ) ) ( not ( = ?auto_1966834 ?auto_1966844 ) ) ( not ( = ?auto_1966836 ?auto_1966835 ) ) ( not ( = ?auto_1966836 ?auto_1966837 ) ) ( not ( = ?auto_1966836 ?auto_1966838 ) ) ( not ( = ?auto_1966836 ?auto_1966839 ) ) ( not ( = ?auto_1966836 ?auto_1966840 ) ) ( not ( = ?auto_1966836 ?auto_1966841 ) ) ( not ( = ?auto_1966836 ?auto_1966842 ) ) ( not ( = ?auto_1966836 ?auto_1966843 ) ) ( not ( = ?auto_1966836 ?auto_1966844 ) ) ( not ( = ?auto_1966835 ?auto_1966837 ) ) ( not ( = ?auto_1966835 ?auto_1966838 ) ) ( not ( = ?auto_1966835 ?auto_1966839 ) ) ( not ( = ?auto_1966835 ?auto_1966840 ) ) ( not ( = ?auto_1966835 ?auto_1966841 ) ) ( not ( = ?auto_1966835 ?auto_1966842 ) ) ( not ( = ?auto_1966835 ?auto_1966843 ) ) ( not ( = ?auto_1966835 ?auto_1966844 ) ) ( not ( = ?auto_1966837 ?auto_1966838 ) ) ( not ( = ?auto_1966837 ?auto_1966839 ) ) ( not ( = ?auto_1966837 ?auto_1966840 ) ) ( not ( = ?auto_1966837 ?auto_1966841 ) ) ( not ( = ?auto_1966837 ?auto_1966842 ) ) ( not ( = ?auto_1966837 ?auto_1966843 ) ) ( not ( = ?auto_1966837 ?auto_1966844 ) ) ( not ( = ?auto_1966838 ?auto_1966839 ) ) ( not ( = ?auto_1966838 ?auto_1966840 ) ) ( not ( = ?auto_1966838 ?auto_1966841 ) ) ( not ( = ?auto_1966838 ?auto_1966842 ) ) ( not ( = ?auto_1966838 ?auto_1966843 ) ) ( not ( = ?auto_1966838 ?auto_1966844 ) ) ( not ( = ?auto_1966839 ?auto_1966840 ) ) ( not ( = ?auto_1966839 ?auto_1966841 ) ) ( not ( = ?auto_1966839 ?auto_1966842 ) ) ( not ( = ?auto_1966839 ?auto_1966843 ) ) ( not ( = ?auto_1966839 ?auto_1966844 ) ) ( not ( = ?auto_1966840 ?auto_1966841 ) ) ( not ( = ?auto_1966840 ?auto_1966842 ) ) ( not ( = ?auto_1966840 ?auto_1966843 ) ) ( not ( = ?auto_1966840 ?auto_1966844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966841 ?auto_1966842 ?auto_1966843 )
      ( MAKE-13CRATE-VERIFY ?auto_1966831 ?auto_1966832 ?auto_1966833 ?auto_1966830 ?auto_1966834 ?auto_1966836 ?auto_1966835 ?auto_1966837 ?auto_1966838 ?auto_1966839 ?auto_1966840 ?auto_1966841 ?auto_1966842 ?auto_1966843 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1967014 - SURFACE
      ?auto_1967015 - SURFACE
      ?auto_1967016 - SURFACE
      ?auto_1967013 - SURFACE
      ?auto_1967017 - SURFACE
      ?auto_1967019 - SURFACE
      ?auto_1967018 - SURFACE
      ?auto_1967020 - SURFACE
      ?auto_1967021 - SURFACE
      ?auto_1967022 - SURFACE
      ?auto_1967023 - SURFACE
      ?auto_1967024 - SURFACE
      ?auto_1967025 - SURFACE
      ?auto_1967026 - SURFACE
    )
    :vars
    (
      ?auto_1967027 - HOIST
      ?auto_1967032 - PLACE
      ?auto_1967029 - PLACE
      ?auto_1967028 - HOIST
      ?auto_1967031 - SURFACE
      ?auto_1967030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1967027 ?auto_1967032 ) ( SURFACE-AT ?auto_1967025 ?auto_1967032 ) ( CLEAR ?auto_1967025 ) ( IS-CRATE ?auto_1967026 ) ( not ( = ?auto_1967025 ?auto_1967026 ) ) ( AVAILABLE ?auto_1967027 ) ( ON ?auto_1967025 ?auto_1967024 ) ( not ( = ?auto_1967024 ?auto_1967025 ) ) ( not ( = ?auto_1967024 ?auto_1967026 ) ) ( not ( = ?auto_1967029 ?auto_1967032 ) ) ( HOIST-AT ?auto_1967028 ?auto_1967029 ) ( not ( = ?auto_1967027 ?auto_1967028 ) ) ( AVAILABLE ?auto_1967028 ) ( SURFACE-AT ?auto_1967026 ?auto_1967029 ) ( ON ?auto_1967026 ?auto_1967031 ) ( CLEAR ?auto_1967026 ) ( not ( = ?auto_1967025 ?auto_1967031 ) ) ( not ( = ?auto_1967026 ?auto_1967031 ) ) ( not ( = ?auto_1967024 ?auto_1967031 ) ) ( TRUCK-AT ?auto_1967030 ?auto_1967032 ) ( ON ?auto_1967015 ?auto_1967014 ) ( ON ?auto_1967016 ?auto_1967015 ) ( ON ?auto_1967013 ?auto_1967016 ) ( ON ?auto_1967017 ?auto_1967013 ) ( ON ?auto_1967019 ?auto_1967017 ) ( ON ?auto_1967018 ?auto_1967019 ) ( ON ?auto_1967020 ?auto_1967018 ) ( ON ?auto_1967021 ?auto_1967020 ) ( ON ?auto_1967022 ?auto_1967021 ) ( ON ?auto_1967023 ?auto_1967022 ) ( ON ?auto_1967024 ?auto_1967023 ) ( not ( = ?auto_1967014 ?auto_1967015 ) ) ( not ( = ?auto_1967014 ?auto_1967016 ) ) ( not ( = ?auto_1967014 ?auto_1967013 ) ) ( not ( = ?auto_1967014 ?auto_1967017 ) ) ( not ( = ?auto_1967014 ?auto_1967019 ) ) ( not ( = ?auto_1967014 ?auto_1967018 ) ) ( not ( = ?auto_1967014 ?auto_1967020 ) ) ( not ( = ?auto_1967014 ?auto_1967021 ) ) ( not ( = ?auto_1967014 ?auto_1967022 ) ) ( not ( = ?auto_1967014 ?auto_1967023 ) ) ( not ( = ?auto_1967014 ?auto_1967024 ) ) ( not ( = ?auto_1967014 ?auto_1967025 ) ) ( not ( = ?auto_1967014 ?auto_1967026 ) ) ( not ( = ?auto_1967014 ?auto_1967031 ) ) ( not ( = ?auto_1967015 ?auto_1967016 ) ) ( not ( = ?auto_1967015 ?auto_1967013 ) ) ( not ( = ?auto_1967015 ?auto_1967017 ) ) ( not ( = ?auto_1967015 ?auto_1967019 ) ) ( not ( = ?auto_1967015 ?auto_1967018 ) ) ( not ( = ?auto_1967015 ?auto_1967020 ) ) ( not ( = ?auto_1967015 ?auto_1967021 ) ) ( not ( = ?auto_1967015 ?auto_1967022 ) ) ( not ( = ?auto_1967015 ?auto_1967023 ) ) ( not ( = ?auto_1967015 ?auto_1967024 ) ) ( not ( = ?auto_1967015 ?auto_1967025 ) ) ( not ( = ?auto_1967015 ?auto_1967026 ) ) ( not ( = ?auto_1967015 ?auto_1967031 ) ) ( not ( = ?auto_1967016 ?auto_1967013 ) ) ( not ( = ?auto_1967016 ?auto_1967017 ) ) ( not ( = ?auto_1967016 ?auto_1967019 ) ) ( not ( = ?auto_1967016 ?auto_1967018 ) ) ( not ( = ?auto_1967016 ?auto_1967020 ) ) ( not ( = ?auto_1967016 ?auto_1967021 ) ) ( not ( = ?auto_1967016 ?auto_1967022 ) ) ( not ( = ?auto_1967016 ?auto_1967023 ) ) ( not ( = ?auto_1967016 ?auto_1967024 ) ) ( not ( = ?auto_1967016 ?auto_1967025 ) ) ( not ( = ?auto_1967016 ?auto_1967026 ) ) ( not ( = ?auto_1967016 ?auto_1967031 ) ) ( not ( = ?auto_1967013 ?auto_1967017 ) ) ( not ( = ?auto_1967013 ?auto_1967019 ) ) ( not ( = ?auto_1967013 ?auto_1967018 ) ) ( not ( = ?auto_1967013 ?auto_1967020 ) ) ( not ( = ?auto_1967013 ?auto_1967021 ) ) ( not ( = ?auto_1967013 ?auto_1967022 ) ) ( not ( = ?auto_1967013 ?auto_1967023 ) ) ( not ( = ?auto_1967013 ?auto_1967024 ) ) ( not ( = ?auto_1967013 ?auto_1967025 ) ) ( not ( = ?auto_1967013 ?auto_1967026 ) ) ( not ( = ?auto_1967013 ?auto_1967031 ) ) ( not ( = ?auto_1967017 ?auto_1967019 ) ) ( not ( = ?auto_1967017 ?auto_1967018 ) ) ( not ( = ?auto_1967017 ?auto_1967020 ) ) ( not ( = ?auto_1967017 ?auto_1967021 ) ) ( not ( = ?auto_1967017 ?auto_1967022 ) ) ( not ( = ?auto_1967017 ?auto_1967023 ) ) ( not ( = ?auto_1967017 ?auto_1967024 ) ) ( not ( = ?auto_1967017 ?auto_1967025 ) ) ( not ( = ?auto_1967017 ?auto_1967026 ) ) ( not ( = ?auto_1967017 ?auto_1967031 ) ) ( not ( = ?auto_1967019 ?auto_1967018 ) ) ( not ( = ?auto_1967019 ?auto_1967020 ) ) ( not ( = ?auto_1967019 ?auto_1967021 ) ) ( not ( = ?auto_1967019 ?auto_1967022 ) ) ( not ( = ?auto_1967019 ?auto_1967023 ) ) ( not ( = ?auto_1967019 ?auto_1967024 ) ) ( not ( = ?auto_1967019 ?auto_1967025 ) ) ( not ( = ?auto_1967019 ?auto_1967026 ) ) ( not ( = ?auto_1967019 ?auto_1967031 ) ) ( not ( = ?auto_1967018 ?auto_1967020 ) ) ( not ( = ?auto_1967018 ?auto_1967021 ) ) ( not ( = ?auto_1967018 ?auto_1967022 ) ) ( not ( = ?auto_1967018 ?auto_1967023 ) ) ( not ( = ?auto_1967018 ?auto_1967024 ) ) ( not ( = ?auto_1967018 ?auto_1967025 ) ) ( not ( = ?auto_1967018 ?auto_1967026 ) ) ( not ( = ?auto_1967018 ?auto_1967031 ) ) ( not ( = ?auto_1967020 ?auto_1967021 ) ) ( not ( = ?auto_1967020 ?auto_1967022 ) ) ( not ( = ?auto_1967020 ?auto_1967023 ) ) ( not ( = ?auto_1967020 ?auto_1967024 ) ) ( not ( = ?auto_1967020 ?auto_1967025 ) ) ( not ( = ?auto_1967020 ?auto_1967026 ) ) ( not ( = ?auto_1967020 ?auto_1967031 ) ) ( not ( = ?auto_1967021 ?auto_1967022 ) ) ( not ( = ?auto_1967021 ?auto_1967023 ) ) ( not ( = ?auto_1967021 ?auto_1967024 ) ) ( not ( = ?auto_1967021 ?auto_1967025 ) ) ( not ( = ?auto_1967021 ?auto_1967026 ) ) ( not ( = ?auto_1967021 ?auto_1967031 ) ) ( not ( = ?auto_1967022 ?auto_1967023 ) ) ( not ( = ?auto_1967022 ?auto_1967024 ) ) ( not ( = ?auto_1967022 ?auto_1967025 ) ) ( not ( = ?auto_1967022 ?auto_1967026 ) ) ( not ( = ?auto_1967022 ?auto_1967031 ) ) ( not ( = ?auto_1967023 ?auto_1967024 ) ) ( not ( = ?auto_1967023 ?auto_1967025 ) ) ( not ( = ?auto_1967023 ?auto_1967026 ) ) ( not ( = ?auto_1967023 ?auto_1967031 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1967024 ?auto_1967025 ?auto_1967026 )
      ( MAKE-13CRATE-VERIFY ?auto_1967014 ?auto_1967015 ?auto_1967016 ?auto_1967013 ?auto_1967017 ?auto_1967019 ?auto_1967018 ?auto_1967020 ?auto_1967021 ?auto_1967022 ?auto_1967023 ?auto_1967024 ?auto_1967025 ?auto_1967026 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1967197 - SURFACE
      ?auto_1967198 - SURFACE
      ?auto_1967199 - SURFACE
      ?auto_1967196 - SURFACE
      ?auto_1967200 - SURFACE
      ?auto_1967202 - SURFACE
      ?auto_1967201 - SURFACE
      ?auto_1967203 - SURFACE
      ?auto_1967204 - SURFACE
      ?auto_1967205 - SURFACE
      ?auto_1967206 - SURFACE
      ?auto_1967207 - SURFACE
      ?auto_1967208 - SURFACE
      ?auto_1967209 - SURFACE
    )
    :vars
    (
      ?auto_1967212 - HOIST
      ?auto_1967211 - PLACE
      ?auto_1967210 - PLACE
      ?auto_1967215 - HOIST
      ?auto_1967213 - SURFACE
      ?auto_1967214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1967212 ?auto_1967211 ) ( IS-CRATE ?auto_1967209 ) ( not ( = ?auto_1967208 ?auto_1967209 ) ) ( not ( = ?auto_1967207 ?auto_1967208 ) ) ( not ( = ?auto_1967207 ?auto_1967209 ) ) ( not ( = ?auto_1967210 ?auto_1967211 ) ) ( HOIST-AT ?auto_1967215 ?auto_1967210 ) ( not ( = ?auto_1967212 ?auto_1967215 ) ) ( AVAILABLE ?auto_1967215 ) ( SURFACE-AT ?auto_1967209 ?auto_1967210 ) ( ON ?auto_1967209 ?auto_1967213 ) ( CLEAR ?auto_1967209 ) ( not ( = ?auto_1967208 ?auto_1967213 ) ) ( not ( = ?auto_1967209 ?auto_1967213 ) ) ( not ( = ?auto_1967207 ?auto_1967213 ) ) ( TRUCK-AT ?auto_1967214 ?auto_1967211 ) ( SURFACE-AT ?auto_1967207 ?auto_1967211 ) ( CLEAR ?auto_1967207 ) ( LIFTING ?auto_1967212 ?auto_1967208 ) ( IS-CRATE ?auto_1967208 ) ( ON ?auto_1967198 ?auto_1967197 ) ( ON ?auto_1967199 ?auto_1967198 ) ( ON ?auto_1967196 ?auto_1967199 ) ( ON ?auto_1967200 ?auto_1967196 ) ( ON ?auto_1967202 ?auto_1967200 ) ( ON ?auto_1967201 ?auto_1967202 ) ( ON ?auto_1967203 ?auto_1967201 ) ( ON ?auto_1967204 ?auto_1967203 ) ( ON ?auto_1967205 ?auto_1967204 ) ( ON ?auto_1967206 ?auto_1967205 ) ( ON ?auto_1967207 ?auto_1967206 ) ( not ( = ?auto_1967197 ?auto_1967198 ) ) ( not ( = ?auto_1967197 ?auto_1967199 ) ) ( not ( = ?auto_1967197 ?auto_1967196 ) ) ( not ( = ?auto_1967197 ?auto_1967200 ) ) ( not ( = ?auto_1967197 ?auto_1967202 ) ) ( not ( = ?auto_1967197 ?auto_1967201 ) ) ( not ( = ?auto_1967197 ?auto_1967203 ) ) ( not ( = ?auto_1967197 ?auto_1967204 ) ) ( not ( = ?auto_1967197 ?auto_1967205 ) ) ( not ( = ?auto_1967197 ?auto_1967206 ) ) ( not ( = ?auto_1967197 ?auto_1967207 ) ) ( not ( = ?auto_1967197 ?auto_1967208 ) ) ( not ( = ?auto_1967197 ?auto_1967209 ) ) ( not ( = ?auto_1967197 ?auto_1967213 ) ) ( not ( = ?auto_1967198 ?auto_1967199 ) ) ( not ( = ?auto_1967198 ?auto_1967196 ) ) ( not ( = ?auto_1967198 ?auto_1967200 ) ) ( not ( = ?auto_1967198 ?auto_1967202 ) ) ( not ( = ?auto_1967198 ?auto_1967201 ) ) ( not ( = ?auto_1967198 ?auto_1967203 ) ) ( not ( = ?auto_1967198 ?auto_1967204 ) ) ( not ( = ?auto_1967198 ?auto_1967205 ) ) ( not ( = ?auto_1967198 ?auto_1967206 ) ) ( not ( = ?auto_1967198 ?auto_1967207 ) ) ( not ( = ?auto_1967198 ?auto_1967208 ) ) ( not ( = ?auto_1967198 ?auto_1967209 ) ) ( not ( = ?auto_1967198 ?auto_1967213 ) ) ( not ( = ?auto_1967199 ?auto_1967196 ) ) ( not ( = ?auto_1967199 ?auto_1967200 ) ) ( not ( = ?auto_1967199 ?auto_1967202 ) ) ( not ( = ?auto_1967199 ?auto_1967201 ) ) ( not ( = ?auto_1967199 ?auto_1967203 ) ) ( not ( = ?auto_1967199 ?auto_1967204 ) ) ( not ( = ?auto_1967199 ?auto_1967205 ) ) ( not ( = ?auto_1967199 ?auto_1967206 ) ) ( not ( = ?auto_1967199 ?auto_1967207 ) ) ( not ( = ?auto_1967199 ?auto_1967208 ) ) ( not ( = ?auto_1967199 ?auto_1967209 ) ) ( not ( = ?auto_1967199 ?auto_1967213 ) ) ( not ( = ?auto_1967196 ?auto_1967200 ) ) ( not ( = ?auto_1967196 ?auto_1967202 ) ) ( not ( = ?auto_1967196 ?auto_1967201 ) ) ( not ( = ?auto_1967196 ?auto_1967203 ) ) ( not ( = ?auto_1967196 ?auto_1967204 ) ) ( not ( = ?auto_1967196 ?auto_1967205 ) ) ( not ( = ?auto_1967196 ?auto_1967206 ) ) ( not ( = ?auto_1967196 ?auto_1967207 ) ) ( not ( = ?auto_1967196 ?auto_1967208 ) ) ( not ( = ?auto_1967196 ?auto_1967209 ) ) ( not ( = ?auto_1967196 ?auto_1967213 ) ) ( not ( = ?auto_1967200 ?auto_1967202 ) ) ( not ( = ?auto_1967200 ?auto_1967201 ) ) ( not ( = ?auto_1967200 ?auto_1967203 ) ) ( not ( = ?auto_1967200 ?auto_1967204 ) ) ( not ( = ?auto_1967200 ?auto_1967205 ) ) ( not ( = ?auto_1967200 ?auto_1967206 ) ) ( not ( = ?auto_1967200 ?auto_1967207 ) ) ( not ( = ?auto_1967200 ?auto_1967208 ) ) ( not ( = ?auto_1967200 ?auto_1967209 ) ) ( not ( = ?auto_1967200 ?auto_1967213 ) ) ( not ( = ?auto_1967202 ?auto_1967201 ) ) ( not ( = ?auto_1967202 ?auto_1967203 ) ) ( not ( = ?auto_1967202 ?auto_1967204 ) ) ( not ( = ?auto_1967202 ?auto_1967205 ) ) ( not ( = ?auto_1967202 ?auto_1967206 ) ) ( not ( = ?auto_1967202 ?auto_1967207 ) ) ( not ( = ?auto_1967202 ?auto_1967208 ) ) ( not ( = ?auto_1967202 ?auto_1967209 ) ) ( not ( = ?auto_1967202 ?auto_1967213 ) ) ( not ( = ?auto_1967201 ?auto_1967203 ) ) ( not ( = ?auto_1967201 ?auto_1967204 ) ) ( not ( = ?auto_1967201 ?auto_1967205 ) ) ( not ( = ?auto_1967201 ?auto_1967206 ) ) ( not ( = ?auto_1967201 ?auto_1967207 ) ) ( not ( = ?auto_1967201 ?auto_1967208 ) ) ( not ( = ?auto_1967201 ?auto_1967209 ) ) ( not ( = ?auto_1967201 ?auto_1967213 ) ) ( not ( = ?auto_1967203 ?auto_1967204 ) ) ( not ( = ?auto_1967203 ?auto_1967205 ) ) ( not ( = ?auto_1967203 ?auto_1967206 ) ) ( not ( = ?auto_1967203 ?auto_1967207 ) ) ( not ( = ?auto_1967203 ?auto_1967208 ) ) ( not ( = ?auto_1967203 ?auto_1967209 ) ) ( not ( = ?auto_1967203 ?auto_1967213 ) ) ( not ( = ?auto_1967204 ?auto_1967205 ) ) ( not ( = ?auto_1967204 ?auto_1967206 ) ) ( not ( = ?auto_1967204 ?auto_1967207 ) ) ( not ( = ?auto_1967204 ?auto_1967208 ) ) ( not ( = ?auto_1967204 ?auto_1967209 ) ) ( not ( = ?auto_1967204 ?auto_1967213 ) ) ( not ( = ?auto_1967205 ?auto_1967206 ) ) ( not ( = ?auto_1967205 ?auto_1967207 ) ) ( not ( = ?auto_1967205 ?auto_1967208 ) ) ( not ( = ?auto_1967205 ?auto_1967209 ) ) ( not ( = ?auto_1967205 ?auto_1967213 ) ) ( not ( = ?auto_1967206 ?auto_1967207 ) ) ( not ( = ?auto_1967206 ?auto_1967208 ) ) ( not ( = ?auto_1967206 ?auto_1967209 ) ) ( not ( = ?auto_1967206 ?auto_1967213 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1967207 ?auto_1967208 ?auto_1967209 )
      ( MAKE-13CRATE-VERIFY ?auto_1967197 ?auto_1967198 ?auto_1967199 ?auto_1967196 ?auto_1967200 ?auto_1967202 ?auto_1967201 ?auto_1967203 ?auto_1967204 ?auto_1967205 ?auto_1967206 ?auto_1967207 ?auto_1967208 ?auto_1967209 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1967380 - SURFACE
      ?auto_1967381 - SURFACE
      ?auto_1967382 - SURFACE
      ?auto_1967379 - SURFACE
      ?auto_1967383 - SURFACE
      ?auto_1967385 - SURFACE
      ?auto_1967384 - SURFACE
      ?auto_1967386 - SURFACE
      ?auto_1967387 - SURFACE
      ?auto_1967388 - SURFACE
      ?auto_1967389 - SURFACE
      ?auto_1967390 - SURFACE
      ?auto_1967391 - SURFACE
      ?auto_1967392 - SURFACE
    )
    :vars
    (
      ?auto_1967395 - HOIST
      ?auto_1967397 - PLACE
      ?auto_1967398 - PLACE
      ?auto_1967396 - HOIST
      ?auto_1967393 - SURFACE
      ?auto_1967394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1967395 ?auto_1967397 ) ( IS-CRATE ?auto_1967392 ) ( not ( = ?auto_1967391 ?auto_1967392 ) ) ( not ( = ?auto_1967390 ?auto_1967391 ) ) ( not ( = ?auto_1967390 ?auto_1967392 ) ) ( not ( = ?auto_1967398 ?auto_1967397 ) ) ( HOIST-AT ?auto_1967396 ?auto_1967398 ) ( not ( = ?auto_1967395 ?auto_1967396 ) ) ( AVAILABLE ?auto_1967396 ) ( SURFACE-AT ?auto_1967392 ?auto_1967398 ) ( ON ?auto_1967392 ?auto_1967393 ) ( CLEAR ?auto_1967392 ) ( not ( = ?auto_1967391 ?auto_1967393 ) ) ( not ( = ?auto_1967392 ?auto_1967393 ) ) ( not ( = ?auto_1967390 ?auto_1967393 ) ) ( TRUCK-AT ?auto_1967394 ?auto_1967397 ) ( SURFACE-AT ?auto_1967390 ?auto_1967397 ) ( CLEAR ?auto_1967390 ) ( IS-CRATE ?auto_1967391 ) ( AVAILABLE ?auto_1967395 ) ( IN ?auto_1967391 ?auto_1967394 ) ( ON ?auto_1967381 ?auto_1967380 ) ( ON ?auto_1967382 ?auto_1967381 ) ( ON ?auto_1967379 ?auto_1967382 ) ( ON ?auto_1967383 ?auto_1967379 ) ( ON ?auto_1967385 ?auto_1967383 ) ( ON ?auto_1967384 ?auto_1967385 ) ( ON ?auto_1967386 ?auto_1967384 ) ( ON ?auto_1967387 ?auto_1967386 ) ( ON ?auto_1967388 ?auto_1967387 ) ( ON ?auto_1967389 ?auto_1967388 ) ( ON ?auto_1967390 ?auto_1967389 ) ( not ( = ?auto_1967380 ?auto_1967381 ) ) ( not ( = ?auto_1967380 ?auto_1967382 ) ) ( not ( = ?auto_1967380 ?auto_1967379 ) ) ( not ( = ?auto_1967380 ?auto_1967383 ) ) ( not ( = ?auto_1967380 ?auto_1967385 ) ) ( not ( = ?auto_1967380 ?auto_1967384 ) ) ( not ( = ?auto_1967380 ?auto_1967386 ) ) ( not ( = ?auto_1967380 ?auto_1967387 ) ) ( not ( = ?auto_1967380 ?auto_1967388 ) ) ( not ( = ?auto_1967380 ?auto_1967389 ) ) ( not ( = ?auto_1967380 ?auto_1967390 ) ) ( not ( = ?auto_1967380 ?auto_1967391 ) ) ( not ( = ?auto_1967380 ?auto_1967392 ) ) ( not ( = ?auto_1967380 ?auto_1967393 ) ) ( not ( = ?auto_1967381 ?auto_1967382 ) ) ( not ( = ?auto_1967381 ?auto_1967379 ) ) ( not ( = ?auto_1967381 ?auto_1967383 ) ) ( not ( = ?auto_1967381 ?auto_1967385 ) ) ( not ( = ?auto_1967381 ?auto_1967384 ) ) ( not ( = ?auto_1967381 ?auto_1967386 ) ) ( not ( = ?auto_1967381 ?auto_1967387 ) ) ( not ( = ?auto_1967381 ?auto_1967388 ) ) ( not ( = ?auto_1967381 ?auto_1967389 ) ) ( not ( = ?auto_1967381 ?auto_1967390 ) ) ( not ( = ?auto_1967381 ?auto_1967391 ) ) ( not ( = ?auto_1967381 ?auto_1967392 ) ) ( not ( = ?auto_1967381 ?auto_1967393 ) ) ( not ( = ?auto_1967382 ?auto_1967379 ) ) ( not ( = ?auto_1967382 ?auto_1967383 ) ) ( not ( = ?auto_1967382 ?auto_1967385 ) ) ( not ( = ?auto_1967382 ?auto_1967384 ) ) ( not ( = ?auto_1967382 ?auto_1967386 ) ) ( not ( = ?auto_1967382 ?auto_1967387 ) ) ( not ( = ?auto_1967382 ?auto_1967388 ) ) ( not ( = ?auto_1967382 ?auto_1967389 ) ) ( not ( = ?auto_1967382 ?auto_1967390 ) ) ( not ( = ?auto_1967382 ?auto_1967391 ) ) ( not ( = ?auto_1967382 ?auto_1967392 ) ) ( not ( = ?auto_1967382 ?auto_1967393 ) ) ( not ( = ?auto_1967379 ?auto_1967383 ) ) ( not ( = ?auto_1967379 ?auto_1967385 ) ) ( not ( = ?auto_1967379 ?auto_1967384 ) ) ( not ( = ?auto_1967379 ?auto_1967386 ) ) ( not ( = ?auto_1967379 ?auto_1967387 ) ) ( not ( = ?auto_1967379 ?auto_1967388 ) ) ( not ( = ?auto_1967379 ?auto_1967389 ) ) ( not ( = ?auto_1967379 ?auto_1967390 ) ) ( not ( = ?auto_1967379 ?auto_1967391 ) ) ( not ( = ?auto_1967379 ?auto_1967392 ) ) ( not ( = ?auto_1967379 ?auto_1967393 ) ) ( not ( = ?auto_1967383 ?auto_1967385 ) ) ( not ( = ?auto_1967383 ?auto_1967384 ) ) ( not ( = ?auto_1967383 ?auto_1967386 ) ) ( not ( = ?auto_1967383 ?auto_1967387 ) ) ( not ( = ?auto_1967383 ?auto_1967388 ) ) ( not ( = ?auto_1967383 ?auto_1967389 ) ) ( not ( = ?auto_1967383 ?auto_1967390 ) ) ( not ( = ?auto_1967383 ?auto_1967391 ) ) ( not ( = ?auto_1967383 ?auto_1967392 ) ) ( not ( = ?auto_1967383 ?auto_1967393 ) ) ( not ( = ?auto_1967385 ?auto_1967384 ) ) ( not ( = ?auto_1967385 ?auto_1967386 ) ) ( not ( = ?auto_1967385 ?auto_1967387 ) ) ( not ( = ?auto_1967385 ?auto_1967388 ) ) ( not ( = ?auto_1967385 ?auto_1967389 ) ) ( not ( = ?auto_1967385 ?auto_1967390 ) ) ( not ( = ?auto_1967385 ?auto_1967391 ) ) ( not ( = ?auto_1967385 ?auto_1967392 ) ) ( not ( = ?auto_1967385 ?auto_1967393 ) ) ( not ( = ?auto_1967384 ?auto_1967386 ) ) ( not ( = ?auto_1967384 ?auto_1967387 ) ) ( not ( = ?auto_1967384 ?auto_1967388 ) ) ( not ( = ?auto_1967384 ?auto_1967389 ) ) ( not ( = ?auto_1967384 ?auto_1967390 ) ) ( not ( = ?auto_1967384 ?auto_1967391 ) ) ( not ( = ?auto_1967384 ?auto_1967392 ) ) ( not ( = ?auto_1967384 ?auto_1967393 ) ) ( not ( = ?auto_1967386 ?auto_1967387 ) ) ( not ( = ?auto_1967386 ?auto_1967388 ) ) ( not ( = ?auto_1967386 ?auto_1967389 ) ) ( not ( = ?auto_1967386 ?auto_1967390 ) ) ( not ( = ?auto_1967386 ?auto_1967391 ) ) ( not ( = ?auto_1967386 ?auto_1967392 ) ) ( not ( = ?auto_1967386 ?auto_1967393 ) ) ( not ( = ?auto_1967387 ?auto_1967388 ) ) ( not ( = ?auto_1967387 ?auto_1967389 ) ) ( not ( = ?auto_1967387 ?auto_1967390 ) ) ( not ( = ?auto_1967387 ?auto_1967391 ) ) ( not ( = ?auto_1967387 ?auto_1967392 ) ) ( not ( = ?auto_1967387 ?auto_1967393 ) ) ( not ( = ?auto_1967388 ?auto_1967389 ) ) ( not ( = ?auto_1967388 ?auto_1967390 ) ) ( not ( = ?auto_1967388 ?auto_1967391 ) ) ( not ( = ?auto_1967388 ?auto_1967392 ) ) ( not ( = ?auto_1967388 ?auto_1967393 ) ) ( not ( = ?auto_1967389 ?auto_1967390 ) ) ( not ( = ?auto_1967389 ?auto_1967391 ) ) ( not ( = ?auto_1967389 ?auto_1967392 ) ) ( not ( = ?auto_1967389 ?auto_1967393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1967390 ?auto_1967391 ?auto_1967392 )
      ( MAKE-13CRATE-VERIFY ?auto_1967380 ?auto_1967381 ?auto_1967382 ?auto_1967379 ?auto_1967383 ?auto_1967385 ?auto_1967384 ?auto_1967386 ?auto_1967387 ?auto_1967388 ?auto_1967389 ?auto_1967390 ?auto_1967391 ?auto_1967392 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981592 - SURFACE
      ?auto_1981593 - SURFACE
      ?auto_1981594 - SURFACE
      ?auto_1981591 - SURFACE
      ?auto_1981595 - SURFACE
      ?auto_1981597 - SURFACE
      ?auto_1981596 - SURFACE
      ?auto_1981598 - SURFACE
      ?auto_1981599 - SURFACE
      ?auto_1981600 - SURFACE
      ?auto_1981601 - SURFACE
      ?auto_1981602 - SURFACE
      ?auto_1981603 - SURFACE
      ?auto_1981604 - SURFACE
      ?auto_1981605 - SURFACE
    )
    :vars
    (
      ?auto_1981606 - HOIST
      ?auto_1981607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981606 ?auto_1981607 ) ( SURFACE-AT ?auto_1981604 ?auto_1981607 ) ( CLEAR ?auto_1981604 ) ( LIFTING ?auto_1981606 ?auto_1981605 ) ( IS-CRATE ?auto_1981605 ) ( not ( = ?auto_1981604 ?auto_1981605 ) ) ( ON ?auto_1981593 ?auto_1981592 ) ( ON ?auto_1981594 ?auto_1981593 ) ( ON ?auto_1981591 ?auto_1981594 ) ( ON ?auto_1981595 ?auto_1981591 ) ( ON ?auto_1981597 ?auto_1981595 ) ( ON ?auto_1981596 ?auto_1981597 ) ( ON ?auto_1981598 ?auto_1981596 ) ( ON ?auto_1981599 ?auto_1981598 ) ( ON ?auto_1981600 ?auto_1981599 ) ( ON ?auto_1981601 ?auto_1981600 ) ( ON ?auto_1981602 ?auto_1981601 ) ( ON ?auto_1981603 ?auto_1981602 ) ( ON ?auto_1981604 ?auto_1981603 ) ( not ( = ?auto_1981592 ?auto_1981593 ) ) ( not ( = ?auto_1981592 ?auto_1981594 ) ) ( not ( = ?auto_1981592 ?auto_1981591 ) ) ( not ( = ?auto_1981592 ?auto_1981595 ) ) ( not ( = ?auto_1981592 ?auto_1981597 ) ) ( not ( = ?auto_1981592 ?auto_1981596 ) ) ( not ( = ?auto_1981592 ?auto_1981598 ) ) ( not ( = ?auto_1981592 ?auto_1981599 ) ) ( not ( = ?auto_1981592 ?auto_1981600 ) ) ( not ( = ?auto_1981592 ?auto_1981601 ) ) ( not ( = ?auto_1981592 ?auto_1981602 ) ) ( not ( = ?auto_1981592 ?auto_1981603 ) ) ( not ( = ?auto_1981592 ?auto_1981604 ) ) ( not ( = ?auto_1981592 ?auto_1981605 ) ) ( not ( = ?auto_1981593 ?auto_1981594 ) ) ( not ( = ?auto_1981593 ?auto_1981591 ) ) ( not ( = ?auto_1981593 ?auto_1981595 ) ) ( not ( = ?auto_1981593 ?auto_1981597 ) ) ( not ( = ?auto_1981593 ?auto_1981596 ) ) ( not ( = ?auto_1981593 ?auto_1981598 ) ) ( not ( = ?auto_1981593 ?auto_1981599 ) ) ( not ( = ?auto_1981593 ?auto_1981600 ) ) ( not ( = ?auto_1981593 ?auto_1981601 ) ) ( not ( = ?auto_1981593 ?auto_1981602 ) ) ( not ( = ?auto_1981593 ?auto_1981603 ) ) ( not ( = ?auto_1981593 ?auto_1981604 ) ) ( not ( = ?auto_1981593 ?auto_1981605 ) ) ( not ( = ?auto_1981594 ?auto_1981591 ) ) ( not ( = ?auto_1981594 ?auto_1981595 ) ) ( not ( = ?auto_1981594 ?auto_1981597 ) ) ( not ( = ?auto_1981594 ?auto_1981596 ) ) ( not ( = ?auto_1981594 ?auto_1981598 ) ) ( not ( = ?auto_1981594 ?auto_1981599 ) ) ( not ( = ?auto_1981594 ?auto_1981600 ) ) ( not ( = ?auto_1981594 ?auto_1981601 ) ) ( not ( = ?auto_1981594 ?auto_1981602 ) ) ( not ( = ?auto_1981594 ?auto_1981603 ) ) ( not ( = ?auto_1981594 ?auto_1981604 ) ) ( not ( = ?auto_1981594 ?auto_1981605 ) ) ( not ( = ?auto_1981591 ?auto_1981595 ) ) ( not ( = ?auto_1981591 ?auto_1981597 ) ) ( not ( = ?auto_1981591 ?auto_1981596 ) ) ( not ( = ?auto_1981591 ?auto_1981598 ) ) ( not ( = ?auto_1981591 ?auto_1981599 ) ) ( not ( = ?auto_1981591 ?auto_1981600 ) ) ( not ( = ?auto_1981591 ?auto_1981601 ) ) ( not ( = ?auto_1981591 ?auto_1981602 ) ) ( not ( = ?auto_1981591 ?auto_1981603 ) ) ( not ( = ?auto_1981591 ?auto_1981604 ) ) ( not ( = ?auto_1981591 ?auto_1981605 ) ) ( not ( = ?auto_1981595 ?auto_1981597 ) ) ( not ( = ?auto_1981595 ?auto_1981596 ) ) ( not ( = ?auto_1981595 ?auto_1981598 ) ) ( not ( = ?auto_1981595 ?auto_1981599 ) ) ( not ( = ?auto_1981595 ?auto_1981600 ) ) ( not ( = ?auto_1981595 ?auto_1981601 ) ) ( not ( = ?auto_1981595 ?auto_1981602 ) ) ( not ( = ?auto_1981595 ?auto_1981603 ) ) ( not ( = ?auto_1981595 ?auto_1981604 ) ) ( not ( = ?auto_1981595 ?auto_1981605 ) ) ( not ( = ?auto_1981597 ?auto_1981596 ) ) ( not ( = ?auto_1981597 ?auto_1981598 ) ) ( not ( = ?auto_1981597 ?auto_1981599 ) ) ( not ( = ?auto_1981597 ?auto_1981600 ) ) ( not ( = ?auto_1981597 ?auto_1981601 ) ) ( not ( = ?auto_1981597 ?auto_1981602 ) ) ( not ( = ?auto_1981597 ?auto_1981603 ) ) ( not ( = ?auto_1981597 ?auto_1981604 ) ) ( not ( = ?auto_1981597 ?auto_1981605 ) ) ( not ( = ?auto_1981596 ?auto_1981598 ) ) ( not ( = ?auto_1981596 ?auto_1981599 ) ) ( not ( = ?auto_1981596 ?auto_1981600 ) ) ( not ( = ?auto_1981596 ?auto_1981601 ) ) ( not ( = ?auto_1981596 ?auto_1981602 ) ) ( not ( = ?auto_1981596 ?auto_1981603 ) ) ( not ( = ?auto_1981596 ?auto_1981604 ) ) ( not ( = ?auto_1981596 ?auto_1981605 ) ) ( not ( = ?auto_1981598 ?auto_1981599 ) ) ( not ( = ?auto_1981598 ?auto_1981600 ) ) ( not ( = ?auto_1981598 ?auto_1981601 ) ) ( not ( = ?auto_1981598 ?auto_1981602 ) ) ( not ( = ?auto_1981598 ?auto_1981603 ) ) ( not ( = ?auto_1981598 ?auto_1981604 ) ) ( not ( = ?auto_1981598 ?auto_1981605 ) ) ( not ( = ?auto_1981599 ?auto_1981600 ) ) ( not ( = ?auto_1981599 ?auto_1981601 ) ) ( not ( = ?auto_1981599 ?auto_1981602 ) ) ( not ( = ?auto_1981599 ?auto_1981603 ) ) ( not ( = ?auto_1981599 ?auto_1981604 ) ) ( not ( = ?auto_1981599 ?auto_1981605 ) ) ( not ( = ?auto_1981600 ?auto_1981601 ) ) ( not ( = ?auto_1981600 ?auto_1981602 ) ) ( not ( = ?auto_1981600 ?auto_1981603 ) ) ( not ( = ?auto_1981600 ?auto_1981604 ) ) ( not ( = ?auto_1981600 ?auto_1981605 ) ) ( not ( = ?auto_1981601 ?auto_1981602 ) ) ( not ( = ?auto_1981601 ?auto_1981603 ) ) ( not ( = ?auto_1981601 ?auto_1981604 ) ) ( not ( = ?auto_1981601 ?auto_1981605 ) ) ( not ( = ?auto_1981602 ?auto_1981603 ) ) ( not ( = ?auto_1981602 ?auto_1981604 ) ) ( not ( = ?auto_1981602 ?auto_1981605 ) ) ( not ( = ?auto_1981603 ?auto_1981604 ) ) ( not ( = ?auto_1981603 ?auto_1981605 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1981604 ?auto_1981605 )
      ( MAKE-14CRATE-VERIFY ?auto_1981592 ?auto_1981593 ?auto_1981594 ?auto_1981591 ?auto_1981595 ?auto_1981597 ?auto_1981596 ?auto_1981598 ?auto_1981599 ?auto_1981600 ?auto_1981601 ?auto_1981602 ?auto_1981603 ?auto_1981604 ?auto_1981605 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981752 - SURFACE
      ?auto_1981753 - SURFACE
      ?auto_1981754 - SURFACE
      ?auto_1981751 - SURFACE
      ?auto_1981755 - SURFACE
      ?auto_1981757 - SURFACE
      ?auto_1981756 - SURFACE
      ?auto_1981758 - SURFACE
      ?auto_1981759 - SURFACE
      ?auto_1981760 - SURFACE
      ?auto_1981761 - SURFACE
      ?auto_1981762 - SURFACE
      ?auto_1981763 - SURFACE
      ?auto_1981764 - SURFACE
      ?auto_1981765 - SURFACE
    )
    :vars
    (
      ?auto_1981766 - HOIST
      ?auto_1981768 - PLACE
      ?auto_1981767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981766 ?auto_1981768 ) ( SURFACE-AT ?auto_1981764 ?auto_1981768 ) ( CLEAR ?auto_1981764 ) ( IS-CRATE ?auto_1981765 ) ( not ( = ?auto_1981764 ?auto_1981765 ) ) ( TRUCK-AT ?auto_1981767 ?auto_1981768 ) ( AVAILABLE ?auto_1981766 ) ( IN ?auto_1981765 ?auto_1981767 ) ( ON ?auto_1981764 ?auto_1981763 ) ( not ( = ?auto_1981763 ?auto_1981764 ) ) ( not ( = ?auto_1981763 ?auto_1981765 ) ) ( ON ?auto_1981753 ?auto_1981752 ) ( ON ?auto_1981754 ?auto_1981753 ) ( ON ?auto_1981751 ?auto_1981754 ) ( ON ?auto_1981755 ?auto_1981751 ) ( ON ?auto_1981757 ?auto_1981755 ) ( ON ?auto_1981756 ?auto_1981757 ) ( ON ?auto_1981758 ?auto_1981756 ) ( ON ?auto_1981759 ?auto_1981758 ) ( ON ?auto_1981760 ?auto_1981759 ) ( ON ?auto_1981761 ?auto_1981760 ) ( ON ?auto_1981762 ?auto_1981761 ) ( ON ?auto_1981763 ?auto_1981762 ) ( not ( = ?auto_1981752 ?auto_1981753 ) ) ( not ( = ?auto_1981752 ?auto_1981754 ) ) ( not ( = ?auto_1981752 ?auto_1981751 ) ) ( not ( = ?auto_1981752 ?auto_1981755 ) ) ( not ( = ?auto_1981752 ?auto_1981757 ) ) ( not ( = ?auto_1981752 ?auto_1981756 ) ) ( not ( = ?auto_1981752 ?auto_1981758 ) ) ( not ( = ?auto_1981752 ?auto_1981759 ) ) ( not ( = ?auto_1981752 ?auto_1981760 ) ) ( not ( = ?auto_1981752 ?auto_1981761 ) ) ( not ( = ?auto_1981752 ?auto_1981762 ) ) ( not ( = ?auto_1981752 ?auto_1981763 ) ) ( not ( = ?auto_1981752 ?auto_1981764 ) ) ( not ( = ?auto_1981752 ?auto_1981765 ) ) ( not ( = ?auto_1981753 ?auto_1981754 ) ) ( not ( = ?auto_1981753 ?auto_1981751 ) ) ( not ( = ?auto_1981753 ?auto_1981755 ) ) ( not ( = ?auto_1981753 ?auto_1981757 ) ) ( not ( = ?auto_1981753 ?auto_1981756 ) ) ( not ( = ?auto_1981753 ?auto_1981758 ) ) ( not ( = ?auto_1981753 ?auto_1981759 ) ) ( not ( = ?auto_1981753 ?auto_1981760 ) ) ( not ( = ?auto_1981753 ?auto_1981761 ) ) ( not ( = ?auto_1981753 ?auto_1981762 ) ) ( not ( = ?auto_1981753 ?auto_1981763 ) ) ( not ( = ?auto_1981753 ?auto_1981764 ) ) ( not ( = ?auto_1981753 ?auto_1981765 ) ) ( not ( = ?auto_1981754 ?auto_1981751 ) ) ( not ( = ?auto_1981754 ?auto_1981755 ) ) ( not ( = ?auto_1981754 ?auto_1981757 ) ) ( not ( = ?auto_1981754 ?auto_1981756 ) ) ( not ( = ?auto_1981754 ?auto_1981758 ) ) ( not ( = ?auto_1981754 ?auto_1981759 ) ) ( not ( = ?auto_1981754 ?auto_1981760 ) ) ( not ( = ?auto_1981754 ?auto_1981761 ) ) ( not ( = ?auto_1981754 ?auto_1981762 ) ) ( not ( = ?auto_1981754 ?auto_1981763 ) ) ( not ( = ?auto_1981754 ?auto_1981764 ) ) ( not ( = ?auto_1981754 ?auto_1981765 ) ) ( not ( = ?auto_1981751 ?auto_1981755 ) ) ( not ( = ?auto_1981751 ?auto_1981757 ) ) ( not ( = ?auto_1981751 ?auto_1981756 ) ) ( not ( = ?auto_1981751 ?auto_1981758 ) ) ( not ( = ?auto_1981751 ?auto_1981759 ) ) ( not ( = ?auto_1981751 ?auto_1981760 ) ) ( not ( = ?auto_1981751 ?auto_1981761 ) ) ( not ( = ?auto_1981751 ?auto_1981762 ) ) ( not ( = ?auto_1981751 ?auto_1981763 ) ) ( not ( = ?auto_1981751 ?auto_1981764 ) ) ( not ( = ?auto_1981751 ?auto_1981765 ) ) ( not ( = ?auto_1981755 ?auto_1981757 ) ) ( not ( = ?auto_1981755 ?auto_1981756 ) ) ( not ( = ?auto_1981755 ?auto_1981758 ) ) ( not ( = ?auto_1981755 ?auto_1981759 ) ) ( not ( = ?auto_1981755 ?auto_1981760 ) ) ( not ( = ?auto_1981755 ?auto_1981761 ) ) ( not ( = ?auto_1981755 ?auto_1981762 ) ) ( not ( = ?auto_1981755 ?auto_1981763 ) ) ( not ( = ?auto_1981755 ?auto_1981764 ) ) ( not ( = ?auto_1981755 ?auto_1981765 ) ) ( not ( = ?auto_1981757 ?auto_1981756 ) ) ( not ( = ?auto_1981757 ?auto_1981758 ) ) ( not ( = ?auto_1981757 ?auto_1981759 ) ) ( not ( = ?auto_1981757 ?auto_1981760 ) ) ( not ( = ?auto_1981757 ?auto_1981761 ) ) ( not ( = ?auto_1981757 ?auto_1981762 ) ) ( not ( = ?auto_1981757 ?auto_1981763 ) ) ( not ( = ?auto_1981757 ?auto_1981764 ) ) ( not ( = ?auto_1981757 ?auto_1981765 ) ) ( not ( = ?auto_1981756 ?auto_1981758 ) ) ( not ( = ?auto_1981756 ?auto_1981759 ) ) ( not ( = ?auto_1981756 ?auto_1981760 ) ) ( not ( = ?auto_1981756 ?auto_1981761 ) ) ( not ( = ?auto_1981756 ?auto_1981762 ) ) ( not ( = ?auto_1981756 ?auto_1981763 ) ) ( not ( = ?auto_1981756 ?auto_1981764 ) ) ( not ( = ?auto_1981756 ?auto_1981765 ) ) ( not ( = ?auto_1981758 ?auto_1981759 ) ) ( not ( = ?auto_1981758 ?auto_1981760 ) ) ( not ( = ?auto_1981758 ?auto_1981761 ) ) ( not ( = ?auto_1981758 ?auto_1981762 ) ) ( not ( = ?auto_1981758 ?auto_1981763 ) ) ( not ( = ?auto_1981758 ?auto_1981764 ) ) ( not ( = ?auto_1981758 ?auto_1981765 ) ) ( not ( = ?auto_1981759 ?auto_1981760 ) ) ( not ( = ?auto_1981759 ?auto_1981761 ) ) ( not ( = ?auto_1981759 ?auto_1981762 ) ) ( not ( = ?auto_1981759 ?auto_1981763 ) ) ( not ( = ?auto_1981759 ?auto_1981764 ) ) ( not ( = ?auto_1981759 ?auto_1981765 ) ) ( not ( = ?auto_1981760 ?auto_1981761 ) ) ( not ( = ?auto_1981760 ?auto_1981762 ) ) ( not ( = ?auto_1981760 ?auto_1981763 ) ) ( not ( = ?auto_1981760 ?auto_1981764 ) ) ( not ( = ?auto_1981760 ?auto_1981765 ) ) ( not ( = ?auto_1981761 ?auto_1981762 ) ) ( not ( = ?auto_1981761 ?auto_1981763 ) ) ( not ( = ?auto_1981761 ?auto_1981764 ) ) ( not ( = ?auto_1981761 ?auto_1981765 ) ) ( not ( = ?auto_1981762 ?auto_1981763 ) ) ( not ( = ?auto_1981762 ?auto_1981764 ) ) ( not ( = ?auto_1981762 ?auto_1981765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1981763 ?auto_1981764 ?auto_1981765 )
      ( MAKE-14CRATE-VERIFY ?auto_1981752 ?auto_1981753 ?auto_1981754 ?auto_1981751 ?auto_1981755 ?auto_1981757 ?auto_1981756 ?auto_1981758 ?auto_1981759 ?auto_1981760 ?auto_1981761 ?auto_1981762 ?auto_1981763 ?auto_1981764 ?auto_1981765 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1981927 - SURFACE
      ?auto_1981928 - SURFACE
      ?auto_1981929 - SURFACE
      ?auto_1981926 - SURFACE
      ?auto_1981930 - SURFACE
      ?auto_1981932 - SURFACE
      ?auto_1981931 - SURFACE
      ?auto_1981933 - SURFACE
      ?auto_1981934 - SURFACE
      ?auto_1981935 - SURFACE
      ?auto_1981936 - SURFACE
      ?auto_1981937 - SURFACE
      ?auto_1981938 - SURFACE
      ?auto_1981939 - SURFACE
      ?auto_1981940 - SURFACE
    )
    :vars
    (
      ?auto_1981943 - HOIST
      ?auto_1981941 - PLACE
      ?auto_1981942 - TRUCK
      ?auto_1981944 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1981943 ?auto_1981941 ) ( SURFACE-AT ?auto_1981939 ?auto_1981941 ) ( CLEAR ?auto_1981939 ) ( IS-CRATE ?auto_1981940 ) ( not ( = ?auto_1981939 ?auto_1981940 ) ) ( AVAILABLE ?auto_1981943 ) ( IN ?auto_1981940 ?auto_1981942 ) ( ON ?auto_1981939 ?auto_1981938 ) ( not ( = ?auto_1981938 ?auto_1981939 ) ) ( not ( = ?auto_1981938 ?auto_1981940 ) ) ( TRUCK-AT ?auto_1981942 ?auto_1981944 ) ( not ( = ?auto_1981944 ?auto_1981941 ) ) ( ON ?auto_1981928 ?auto_1981927 ) ( ON ?auto_1981929 ?auto_1981928 ) ( ON ?auto_1981926 ?auto_1981929 ) ( ON ?auto_1981930 ?auto_1981926 ) ( ON ?auto_1981932 ?auto_1981930 ) ( ON ?auto_1981931 ?auto_1981932 ) ( ON ?auto_1981933 ?auto_1981931 ) ( ON ?auto_1981934 ?auto_1981933 ) ( ON ?auto_1981935 ?auto_1981934 ) ( ON ?auto_1981936 ?auto_1981935 ) ( ON ?auto_1981937 ?auto_1981936 ) ( ON ?auto_1981938 ?auto_1981937 ) ( not ( = ?auto_1981927 ?auto_1981928 ) ) ( not ( = ?auto_1981927 ?auto_1981929 ) ) ( not ( = ?auto_1981927 ?auto_1981926 ) ) ( not ( = ?auto_1981927 ?auto_1981930 ) ) ( not ( = ?auto_1981927 ?auto_1981932 ) ) ( not ( = ?auto_1981927 ?auto_1981931 ) ) ( not ( = ?auto_1981927 ?auto_1981933 ) ) ( not ( = ?auto_1981927 ?auto_1981934 ) ) ( not ( = ?auto_1981927 ?auto_1981935 ) ) ( not ( = ?auto_1981927 ?auto_1981936 ) ) ( not ( = ?auto_1981927 ?auto_1981937 ) ) ( not ( = ?auto_1981927 ?auto_1981938 ) ) ( not ( = ?auto_1981927 ?auto_1981939 ) ) ( not ( = ?auto_1981927 ?auto_1981940 ) ) ( not ( = ?auto_1981928 ?auto_1981929 ) ) ( not ( = ?auto_1981928 ?auto_1981926 ) ) ( not ( = ?auto_1981928 ?auto_1981930 ) ) ( not ( = ?auto_1981928 ?auto_1981932 ) ) ( not ( = ?auto_1981928 ?auto_1981931 ) ) ( not ( = ?auto_1981928 ?auto_1981933 ) ) ( not ( = ?auto_1981928 ?auto_1981934 ) ) ( not ( = ?auto_1981928 ?auto_1981935 ) ) ( not ( = ?auto_1981928 ?auto_1981936 ) ) ( not ( = ?auto_1981928 ?auto_1981937 ) ) ( not ( = ?auto_1981928 ?auto_1981938 ) ) ( not ( = ?auto_1981928 ?auto_1981939 ) ) ( not ( = ?auto_1981928 ?auto_1981940 ) ) ( not ( = ?auto_1981929 ?auto_1981926 ) ) ( not ( = ?auto_1981929 ?auto_1981930 ) ) ( not ( = ?auto_1981929 ?auto_1981932 ) ) ( not ( = ?auto_1981929 ?auto_1981931 ) ) ( not ( = ?auto_1981929 ?auto_1981933 ) ) ( not ( = ?auto_1981929 ?auto_1981934 ) ) ( not ( = ?auto_1981929 ?auto_1981935 ) ) ( not ( = ?auto_1981929 ?auto_1981936 ) ) ( not ( = ?auto_1981929 ?auto_1981937 ) ) ( not ( = ?auto_1981929 ?auto_1981938 ) ) ( not ( = ?auto_1981929 ?auto_1981939 ) ) ( not ( = ?auto_1981929 ?auto_1981940 ) ) ( not ( = ?auto_1981926 ?auto_1981930 ) ) ( not ( = ?auto_1981926 ?auto_1981932 ) ) ( not ( = ?auto_1981926 ?auto_1981931 ) ) ( not ( = ?auto_1981926 ?auto_1981933 ) ) ( not ( = ?auto_1981926 ?auto_1981934 ) ) ( not ( = ?auto_1981926 ?auto_1981935 ) ) ( not ( = ?auto_1981926 ?auto_1981936 ) ) ( not ( = ?auto_1981926 ?auto_1981937 ) ) ( not ( = ?auto_1981926 ?auto_1981938 ) ) ( not ( = ?auto_1981926 ?auto_1981939 ) ) ( not ( = ?auto_1981926 ?auto_1981940 ) ) ( not ( = ?auto_1981930 ?auto_1981932 ) ) ( not ( = ?auto_1981930 ?auto_1981931 ) ) ( not ( = ?auto_1981930 ?auto_1981933 ) ) ( not ( = ?auto_1981930 ?auto_1981934 ) ) ( not ( = ?auto_1981930 ?auto_1981935 ) ) ( not ( = ?auto_1981930 ?auto_1981936 ) ) ( not ( = ?auto_1981930 ?auto_1981937 ) ) ( not ( = ?auto_1981930 ?auto_1981938 ) ) ( not ( = ?auto_1981930 ?auto_1981939 ) ) ( not ( = ?auto_1981930 ?auto_1981940 ) ) ( not ( = ?auto_1981932 ?auto_1981931 ) ) ( not ( = ?auto_1981932 ?auto_1981933 ) ) ( not ( = ?auto_1981932 ?auto_1981934 ) ) ( not ( = ?auto_1981932 ?auto_1981935 ) ) ( not ( = ?auto_1981932 ?auto_1981936 ) ) ( not ( = ?auto_1981932 ?auto_1981937 ) ) ( not ( = ?auto_1981932 ?auto_1981938 ) ) ( not ( = ?auto_1981932 ?auto_1981939 ) ) ( not ( = ?auto_1981932 ?auto_1981940 ) ) ( not ( = ?auto_1981931 ?auto_1981933 ) ) ( not ( = ?auto_1981931 ?auto_1981934 ) ) ( not ( = ?auto_1981931 ?auto_1981935 ) ) ( not ( = ?auto_1981931 ?auto_1981936 ) ) ( not ( = ?auto_1981931 ?auto_1981937 ) ) ( not ( = ?auto_1981931 ?auto_1981938 ) ) ( not ( = ?auto_1981931 ?auto_1981939 ) ) ( not ( = ?auto_1981931 ?auto_1981940 ) ) ( not ( = ?auto_1981933 ?auto_1981934 ) ) ( not ( = ?auto_1981933 ?auto_1981935 ) ) ( not ( = ?auto_1981933 ?auto_1981936 ) ) ( not ( = ?auto_1981933 ?auto_1981937 ) ) ( not ( = ?auto_1981933 ?auto_1981938 ) ) ( not ( = ?auto_1981933 ?auto_1981939 ) ) ( not ( = ?auto_1981933 ?auto_1981940 ) ) ( not ( = ?auto_1981934 ?auto_1981935 ) ) ( not ( = ?auto_1981934 ?auto_1981936 ) ) ( not ( = ?auto_1981934 ?auto_1981937 ) ) ( not ( = ?auto_1981934 ?auto_1981938 ) ) ( not ( = ?auto_1981934 ?auto_1981939 ) ) ( not ( = ?auto_1981934 ?auto_1981940 ) ) ( not ( = ?auto_1981935 ?auto_1981936 ) ) ( not ( = ?auto_1981935 ?auto_1981937 ) ) ( not ( = ?auto_1981935 ?auto_1981938 ) ) ( not ( = ?auto_1981935 ?auto_1981939 ) ) ( not ( = ?auto_1981935 ?auto_1981940 ) ) ( not ( = ?auto_1981936 ?auto_1981937 ) ) ( not ( = ?auto_1981936 ?auto_1981938 ) ) ( not ( = ?auto_1981936 ?auto_1981939 ) ) ( not ( = ?auto_1981936 ?auto_1981940 ) ) ( not ( = ?auto_1981937 ?auto_1981938 ) ) ( not ( = ?auto_1981937 ?auto_1981939 ) ) ( not ( = ?auto_1981937 ?auto_1981940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1981938 ?auto_1981939 ?auto_1981940 )
      ( MAKE-14CRATE-VERIFY ?auto_1981927 ?auto_1981928 ?auto_1981929 ?auto_1981926 ?auto_1981930 ?auto_1981932 ?auto_1981931 ?auto_1981933 ?auto_1981934 ?auto_1981935 ?auto_1981936 ?auto_1981937 ?auto_1981938 ?auto_1981939 ?auto_1981940 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982116 - SURFACE
      ?auto_1982117 - SURFACE
      ?auto_1982118 - SURFACE
      ?auto_1982115 - SURFACE
      ?auto_1982119 - SURFACE
      ?auto_1982121 - SURFACE
      ?auto_1982120 - SURFACE
      ?auto_1982122 - SURFACE
      ?auto_1982123 - SURFACE
      ?auto_1982124 - SURFACE
      ?auto_1982125 - SURFACE
      ?auto_1982126 - SURFACE
      ?auto_1982127 - SURFACE
      ?auto_1982128 - SURFACE
      ?auto_1982129 - SURFACE
    )
    :vars
    (
      ?auto_1982133 - HOIST
      ?auto_1982132 - PLACE
      ?auto_1982131 - TRUCK
      ?auto_1982134 - PLACE
      ?auto_1982130 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982133 ?auto_1982132 ) ( SURFACE-AT ?auto_1982128 ?auto_1982132 ) ( CLEAR ?auto_1982128 ) ( IS-CRATE ?auto_1982129 ) ( not ( = ?auto_1982128 ?auto_1982129 ) ) ( AVAILABLE ?auto_1982133 ) ( ON ?auto_1982128 ?auto_1982127 ) ( not ( = ?auto_1982127 ?auto_1982128 ) ) ( not ( = ?auto_1982127 ?auto_1982129 ) ) ( TRUCK-AT ?auto_1982131 ?auto_1982134 ) ( not ( = ?auto_1982134 ?auto_1982132 ) ) ( HOIST-AT ?auto_1982130 ?auto_1982134 ) ( LIFTING ?auto_1982130 ?auto_1982129 ) ( not ( = ?auto_1982133 ?auto_1982130 ) ) ( ON ?auto_1982117 ?auto_1982116 ) ( ON ?auto_1982118 ?auto_1982117 ) ( ON ?auto_1982115 ?auto_1982118 ) ( ON ?auto_1982119 ?auto_1982115 ) ( ON ?auto_1982121 ?auto_1982119 ) ( ON ?auto_1982120 ?auto_1982121 ) ( ON ?auto_1982122 ?auto_1982120 ) ( ON ?auto_1982123 ?auto_1982122 ) ( ON ?auto_1982124 ?auto_1982123 ) ( ON ?auto_1982125 ?auto_1982124 ) ( ON ?auto_1982126 ?auto_1982125 ) ( ON ?auto_1982127 ?auto_1982126 ) ( not ( = ?auto_1982116 ?auto_1982117 ) ) ( not ( = ?auto_1982116 ?auto_1982118 ) ) ( not ( = ?auto_1982116 ?auto_1982115 ) ) ( not ( = ?auto_1982116 ?auto_1982119 ) ) ( not ( = ?auto_1982116 ?auto_1982121 ) ) ( not ( = ?auto_1982116 ?auto_1982120 ) ) ( not ( = ?auto_1982116 ?auto_1982122 ) ) ( not ( = ?auto_1982116 ?auto_1982123 ) ) ( not ( = ?auto_1982116 ?auto_1982124 ) ) ( not ( = ?auto_1982116 ?auto_1982125 ) ) ( not ( = ?auto_1982116 ?auto_1982126 ) ) ( not ( = ?auto_1982116 ?auto_1982127 ) ) ( not ( = ?auto_1982116 ?auto_1982128 ) ) ( not ( = ?auto_1982116 ?auto_1982129 ) ) ( not ( = ?auto_1982117 ?auto_1982118 ) ) ( not ( = ?auto_1982117 ?auto_1982115 ) ) ( not ( = ?auto_1982117 ?auto_1982119 ) ) ( not ( = ?auto_1982117 ?auto_1982121 ) ) ( not ( = ?auto_1982117 ?auto_1982120 ) ) ( not ( = ?auto_1982117 ?auto_1982122 ) ) ( not ( = ?auto_1982117 ?auto_1982123 ) ) ( not ( = ?auto_1982117 ?auto_1982124 ) ) ( not ( = ?auto_1982117 ?auto_1982125 ) ) ( not ( = ?auto_1982117 ?auto_1982126 ) ) ( not ( = ?auto_1982117 ?auto_1982127 ) ) ( not ( = ?auto_1982117 ?auto_1982128 ) ) ( not ( = ?auto_1982117 ?auto_1982129 ) ) ( not ( = ?auto_1982118 ?auto_1982115 ) ) ( not ( = ?auto_1982118 ?auto_1982119 ) ) ( not ( = ?auto_1982118 ?auto_1982121 ) ) ( not ( = ?auto_1982118 ?auto_1982120 ) ) ( not ( = ?auto_1982118 ?auto_1982122 ) ) ( not ( = ?auto_1982118 ?auto_1982123 ) ) ( not ( = ?auto_1982118 ?auto_1982124 ) ) ( not ( = ?auto_1982118 ?auto_1982125 ) ) ( not ( = ?auto_1982118 ?auto_1982126 ) ) ( not ( = ?auto_1982118 ?auto_1982127 ) ) ( not ( = ?auto_1982118 ?auto_1982128 ) ) ( not ( = ?auto_1982118 ?auto_1982129 ) ) ( not ( = ?auto_1982115 ?auto_1982119 ) ) ( not ( = ?auto_1982115 ?auto_1982121 ) ) ( not ( = ?auto_1982115 ?auto_1982120 ) ) ( not ( = ?auto_1982115 ?auto_1982122 ) ) ( not ( = ?auto_1982115 ?auto_1982123 ) ) ( not ( = ?auto_1982115 ?auto_1982124 ) ) ( not ( = ?auto_1982115 ?auto_1982125 ) ) ( not ( = ?auto_1982115 ?auto_1982126 ) ) ( not ( = ?auto_1982115 ?auto_1982127 ) ) ( not ( = ?auto_1982115 ?auto_1982128 ) ) ( not ( = ?auto_1982115 ?auto_1982129 ) ) ( not ( = ?auto_1982119 ?auto_1982121 ) ) ( not ( = ?auto_1982119 ?auto_1982120 ) ) ( not ( = ?auto_1982119 ?auto_1982122 ) ) ( not ( = ?auto_1982119 ?auto_1982123 ) ) ( not ( = ?auto_1982119 ?auto_1982124 ) ) ( not ( = ?auto_1982119 ?auto_1982125 ) ) ( not ( = ?auto_1982119 ?auto_1982126 ) ) ( not ( = ?auto_1982119 ?auto_1982127 ) ) ( not ( = ?auto_1982119 ?auto_1982128 ) ) ( not ( = ?auto_1982119 ?auto_1982129 ) ) ( not ( = ?auto_1982121 ?auto_1982120 ) ) ( not ( = ?auto_1982121 ?auto_1982122 ) ) ( not ( = ?auto_1982121 ?auto_1982123 ) ) ( not ( = ?auto_1982121 ?auto_1982124 ) ) ( not ( = ?auto_1982121 ?auto_1982125 ) ) ( not ( = ?auto_1982121 ?auto_1982126 ) ) ( not ( = ?auto_1982121 ?auto_1982127 ) ) ( not ( = ?auto_1982121 ?auto_1982128 ) ) ( not ( = ?auto_1982121 ?auto_1982129 ) ) ( not ( = ?auto_1982120 ?auto_1982122 ) ) ( not ( = ?auto_1982120 ?auto_1982123 ) ) ( not ( = ?auto_1982120 ?auto_1982124 ) ) ( not ( = ?auto_1982120 ?auto_1982125 ) ) ( not ( = ?auto_1982120 ?auto_1982126 ) ) ( not ( = ?auto_1982120 ?auto_1982127 ) ) ( not ( = ?auto_1982120 ?auto_1982128 ) ) ( not ( = ?auto_1982120 ?auto_1982129 ) ) ( not ( = ?auto_1982122 ?auto_1982123 ) ) ( not ( = ?auto_1982122 ?auto_1982124 ) ) ( not ( = ?auto_1982122 ?auto_1982125 ) ) ( not ( = ?auto_1982122 ?auto_1982126 ) ) ( not ( = ?auto_1982122 ?auto_1982127 ) ) ( not ( = ?auto_1982122 ?auto_1982128 ) ) ( not ( = ?auto_1982122 ?auto_1982129 ) ) ( not ( = ?auto_1982123 ?auto_1982124 ) ) ( not ( = ?auto_1982123 ?auto_1982125 ) ) ( not ( = ?auto_1982123 ?auto_1982126 ) ) ( not ( = ?auto_1982123 ?auto_1982127 ) ) ( not ( = ?auto_1982123 ?auto_1982128 ) ) ( not ( = ?auto_1982123 ?auto_1982129 ) ) ( not ( = ?auto_1982124 ?auto_1982125 ) ) ( not ( = ?auto_1982124 ?auto_1982126 ) ) ( not ( = ?auto_1982124 ?auto_1982127 ) ) ( not ( = ?auto_1982124 ?auto_1982128 ) ) ( not ( = ?auto_1982124 ?auto_1982129 ) ) ( not ( = ?auto_1982125 ?auto_1982126 ) ) ( not ( = ?auto_1982125 ?auto_1982127 ) ) ( not ( = ?auto_1982125 ?auto_1982128 ) ) ( not ( = ?auto_1982125 ?auto_1982129 ) ) ( not ( = ?auto_1982126 ?auto_1982127 ) ) ( not ( = ?auto_1982126 ?auto_1982128 ) ) ( not ( = ?auto_1982126 ?auto_1982129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982127 ?auto_1982128 ?auto_1982129 )
      ( MAKE-14CRATE-VERIFY ?auto_1982116 ?auto_1982117 ?auto_1982118 ?auto_1982115 ?auto_1982119 ?auto_1982121 ?auto_1982120 ?auto_1982122 ?auto_1982123 ?auto_1982124 ?auto_1982125 ?auto_1982126 ?auto_1982127 ?auto_1982128 ?auto_1982129 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982319 - SURFACE
      ?auto_1982320 - SURFACE
      ?auto_1982321 - SURFACE
      ?auto_1982318 - SURFACE
      ?auto_1982322 - SURFACE
      ?auto_1982324 - SURFACE
      ?auto_1982323 - SURFACE
      ?auto_1982325 - SURFACE
      ?auto_1982326 - SURFACE
      ?auto_1982327 - SURFACE
      ?auto_1982328 - SURFACE
      ?auto_1982329 - SURFACE
      ?auto_1982330 - SURFACE
      ?auto_1982331 - SURFACE
      ?auto_1982332 - SURFACE
    )
    :vars
    (
      ?auto_1982338 - HOIST
      ?auto_1982334 - PLACE
      ?auto_1982335 - TRUCK
      ?auto_1982336 - PLACE
      ?auto_1982337 - HOIST
      ?auto_1982333 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982338 ?auto_1982334 ) ( SURFACE-AT ?auto_1982331 ?auto_1982334 ) ( CLEAR ?auto_1982331 ) ( IS-CRATE ?auto_1982332 ) ( not ( = ?auto_1982331 ?auto_1982332 ) ) ( AVAILABLE ?auto_1982338 ) ( ON ?auto_1982331 ?auto_1982330 ) ( not ( = ?auto_1982330 ?auto_1982331 ) ) ( not ( = ?auto_1982330 ?auto_1982332 ) ) ( TRUCK-AT ?auto_1982335 ?auto_1982336 ) ( not ( = ?auto_1982336 ?auto_1982334 ) ) ( HOIST-AT ?auto_1982337 ?auto_1982336 ) ( not ( = ?auto_1982338 ?auto_1982337 ) ) ( AVAILABLE ?auto_1982337 ) ( SURFACE-AT ?auto_1982332 ?auto_1982336 ) ( ON ?auto_1982332 ?auto_1982333 ) ( CLEAR ?auto_1982332 ) ( not ( = ?auto_1982331 ?auto_1982333 ) ) ( not ( = ?auto_1982332 ?auto_1982333 ) ) ( not ( = ?auto_1982330 ?auto_1982333 ) ) ( ON ?auto_1982320 ?auto_1982319 ) ( ON ?auto_1982321 ?auto_1982320 ) ( ON ?auto_1982318 ?auto_1982321 ) ( ON ?auto_1982322 ?auto_1982318 ) ( ON ?auto_1982324 ?auto_1982322 ) ( ON ?auto_1982323 ?auto_1982324 ) ( ON ?auto_1982325 ?auto_1982323 ) ( ON ?auto_1982326 ?auto_1982325 ) ( ON ?auto_1982327 ?auto_1982326 ) ( ON ?auto_1982328 ?auto_1982327 ) ( ON ?auto_1982329 ?auto_1982328 ) ( ON ?auto_1982330 ?auto_1982329 ) ( not ( = ?auto_1982319 ?auto_1982320 ) ) ( not ( = ?auto_1982319 ?auto_1982321 ) ) ( not ( = ?auto_1982319 ?auto_1982318 ) ) ( not ( = ?auto_1982319 ?auto_1982322 ) ) ( not ( = ?auto_1982319 ?auto_1982324 ) ) ( not ( = ?auto_1982319 ?auto_1982323 ) ) ( not ( = ?auto_1982319 ?auto_1982325 ) ) ( not ( = ?auto_1982319 ?auto_1982326 ) ) ( not ( = ?auto_1982319 ?auto_1982327 ) ) ( not ( = ?auto_1982319 ?auto_1982328 ) ) ( not ( = ?auto_1982319 ?auto_1982329 ) ) ( not ( = ?auto_1982319 ?auto_1982330 ) ) ( not ( = ?auto_1982319 ?auto_1982331 ) ) ( not ( = ?auto_1982319 ?auto_1982332 ) ) ( not ( = ?auto_1982319 ?auto_1982333 ) ) ( not ( = ?auto_1982320 ?auto_1982321 ) ) ( not ( = ?auto_1982320 ?auto_1982318 ) ) ( not ( = ?auto_1982320 ?auto_1982322 ) ) ( not ( = ?auto_1982320 ?auto_1982324 ) ) ( not ( = ?auto_1982320 ?auto_1982323 ) ) ( not ( = ?auto_1982320 ?auto_1982325 ) ) ( not ( = ?auto_1982320 ?auto_1982326 ) ) ( not ( = ?auto_1982320 ?auto_1982327 ) ) ( not ( = ?auto_1982320 ?auto_1982328 ) ) ( not ( = ?auto_1982320 ?auto_1982329 ) ) ( not ( = ?auto_1982320 ?auto_1982330 ) ) ( not ( = ?auto_1982320 ?auto_1982331 ) ) ( not ( = ?auto_1982320 ?auto_1982332 ) ) ( not ( = ?auto_1982320 ?auto_1982333 ) ) ( not ( = ?auto_1982321 ?auto_1982318 ) ) ( not ( = ?auto_1982321 ?auto_1982322 ) ) ( not ( = ?auto_1982321 ?auto_1982324 ) ) ( not ( = ?auto_1982321 ?auto_1982323 ) ) ( not ( = ?auto_1982321 ?auto_1982325 ) ) ( not ( = ?auto_1982321 ?auto_1982326 ) ) ( not ( = ?auto_1982321 ?auto_1982327 ) ) ( not ( = ?auto_1982321 ?auto_1982328 ) ) ( not ( = ?auto_1982321 ?auto_1982329 ) ) ( not ( = ?auto_1982321 ?auto_1982330 ) ) ( not ( = ?auto_1982321 ?auto_1982331 ) ) ( not ( = ?auto_1982321 ?auto_1982332 ) ) ( not ( = ?auto_1982321 ?auto_1982333 ) ) ( not ( = ?auto_1982318 ?auto_1982322 ) ) ( not ( = ?auto_1982318 ?auto_1982324 ) ) ( not ( = ?auto_1982318 ?auto_1982323 ) ) ( not ( = ?auto_1982318 ?auto_1982325 ) ) ( not ( = ?auto_1982318 ?auto_1982326 ) ) ( not ( = ?auto_1982318 ?auto_1982327 ) ) ( not ( = ?auto_1982318 ?auto_1982328 ) ) ( not ( = ?auto_1982318 ?auto_1982329 ) ) ( not ( = ?auto_1982318 ?auto_1982330 ) ) ( not ( = ?auto_1982318 ?auto_1982331 ) ) ( not ( = ?auto_1982318 ?auto_1982332 ) ) ( not ( = ?auto_1982318 ?auto_1982333 ) ) ( not ( = ?auto_1982322 ?auto_1982324 ) ) ( not ( = ?auto_1982322 ?auto_1982323 ) ) ( not ( = ?auto_1982322 ?auto_1982325 ) ) ( not ( = ?auto_1982322 ?auto_1982326 ) ) ( not ( = ?auto_1982322 ?auto_1982327 ) ) ( not ( = ?auto_1982322 ?auto_1982328 ) ) ( not ( = ?auto_1982322 ?auto_1982329 ) ) ( not ( = ?auto_1982322 ?auto_1982330 ) ) ( not ( = ?auto_1982322 ?auto_1982331 ) ) ( not ( = ?auto_1982322 ?auto_1982332 ) ) ( not ( = ?auto_1982322 ?auto_1982333 ) ) ( not ( = ?auto_1982324 ?auto_1982323 ) ) ( not ( = ?auto_1982324 ?auto_1982325 ) ) ( not ( = ?auto_1982324 ?auto_1982326 ) ) ( not ( = ?auto_1982324 ?auto_1982327 ) ) ( not ( = ?auto_1982324 ?auto_1982328 ) ) ( not ( = ?auto_1982324 ?auto_1982329 ) ) ( not ( = ?auto_1982324 ?auto_1982330 ) ) ( not ( = ?auto_1982324 ?auto_1982331 ) ) ( not ( = ?auto_1982324 ?auto_1982332 ) ) ( not ( = ?auto_1982324 ?auto_1982333 ) ) ( not ( = ?auto_1982323 ?auto_1982325 ) ) ( not ( = ?auto_1982323 ?auto_1982326 ) ) ( not ( = ?auto_1982323 ?auto_1982327 ) ) ( not ( = ?auto_1982323 ?auto_1982328 ) ) ( not ( = ?auto_1982323 ?auto_1982329 ) ) ( not ( = ?auto_1982323 ?auto_1982330 ) ) ( not ( = ?auto_1982323 ?auto_1982331 ) ) ( not ( = ?auto_1982323 ?auto_1982332 ) ) ( not ( = ?auto_1982323 ?auto_1982333 ) ) ( not ( = ?auto_1982325 ?auto_1982326 ) ) ( not ( = ?auto_1982325 ?auto_1982327 ) ) ( not ( = ?auto_1982325 ?auto_1982328 ) ) ( not ( = ?auto_1982325 ?auto_1982329 ) ) ( not ( = ?auto_1982325 ?auto_1982330 ) ) ( not ( = ?auto_1982325 ?auto_1982331 ) ) ( not ( = ?auto_1982325 ?auto_1982332 ) ) ( not ( = ?auto_1982325 ?auto_1982333 ) ) ( not ( = ?auto_1982326 ?auto_1982327 ) ) ( not ( = ?auto_1982326 ?auto_1982328 ) ) ( not ( = ?auto_1982326 ?auto_1982329 ) ) ( not ( = ?auto_1982326 ?auto_1982330 ) ) ( not ( = ?auto_1982326 ?auto_1982331 ) ) ( not ( = ?auto_1982326 ?auto_1982332 ) ) ( not ( = ?auto_1982326 ?auto_1982333 ) ) ( not ( = ?auto_1982327 ?auto_1982328 ) ) ( not ( = ?auto_1982327 ?auto_1982329 ) ) ( not ( = ?auto_1982327 ?auto_1982330 ) ) ( not ( = ?auto_1982327 ?auto_1982331 ) ) ( not ( = ?auto_1982327 ?auto_1982332 ) ) ( not ( = ?auto_1982327 ?auto_1982333 ) ) ( not ( = ?auto_1982328 ?auto_1982329 ) ) ( not ( = ?auto_1982328 ?auto_1982330 ) ) ( not ( = ?auto_1982328 ?auto_1982331 ) ) ( not ( = ?auto_1982328 ?auto_1982332 ) ) ( not ( = ?auto_1982328 ?auto_1982333 ) ) ( not ( = ?auto_1982329 ?auto_1982330 ) ) ( not ( = ?auto_1982329 ?auto_1982331 ) ) ( not ( = ?auto_1982329 ?auto_1982332 ) ) ( not ( = ?auto_1982329 ?auto_1982333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982330 ?auto_1982331 ?auto_1982332 )
      ( MAKE-14CRATE-VERIFY ?auto_1982319 ?auto_1982320 ?auto_1982321 ?auto_1982318 ?auto_1982322 ?auto_1982324 ?auto_1982323 ?auto_1982325 ?auto_1982326 ?auto_1982327 ?auto_1982328 ?auto_1982329 ?auto_1982330 ?auto_1982331 ?auto_1982332 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982523 - SURFACE
      ?auto_1982524 - SURFACE
      ?auto_1982525 - SURFACE
      ?auto_1982522 - SURFACE
      ?auto_1982526 - SURFACE
      ?auto_1982528 - SURFACE
      ?auto_1982527 - SURFACE
      ?auto_1982529 - SURFACE
      ?auto_1982530 - SURFACE
      ?auto_1982531 - SURFACE
      ?auto_1982532 - SURFACE
      ?auto_1982533 - SURFACE
      ?auto_1982534 - SURFACE
      ?auto_1982535 - SURFACE
      ?auto_1982536 - SURFACE
    )
    :vars
    (
      ?auto_1982542 - HOIST
      ?auto_1982539 - PLACE
      ?auto_1982541 - PLACE
      ?auto_1982540 - HOIST
      ?auto_1982537 - SURFACE
      ?auto_1982538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982542 ?auto_1982539 ) ( SURFACE-AT ?auto_1982535 ?auto_1982539 ) ( CLEAR ?auto_1982535 ) ( IS-CRATE ?auto_1982536 ) ( not ( = ?auto_1982535 ?auto_1982536 ) ) ( AVAILABLE ?auto_1982542 ) ( ON ?auto_1982535 ?auto_1982534 ) ( not ( = ?auto_1982534 ?auto_1982535 ) ) ( not ( = ?auto_1982534 ?auto_1982536 ) ) ( not ( = ?auto_1982541 ?auto_1982539 ) ) ( HOIST-AT ?auto_1982540 ?auto_1982541 ) ( not ( = ?auto_1982542 ?auto_1982540 ) ) ( AVAILABLE ?auto_1982540 ) ( SURFACE-AT ?auto_1982536 ?auto_1982541 ) ( ON ?auto_1982536 ?auto_1982537 ) ( CLEAR ?auto_1982536 ) ( not ( = ?auto_1982535 ?auto_1982537 ) ) ( not ( = ?auto_1982536 ?auto_1982537 ) ) ( not ( = ?auto_1982534 ?auto_1982537 ) ) ( TRUCK-AT ?auto_1982538 ?auto_1982539 ) ( ON ?auto_1982524 ?auto_1982523 ) ( ON ?auto_1982525 ?auto_1982524 ) ( ON ?auto_1982522 ?auto_1982525 ) ( ON ?auto_1982526 ?auto_1982522 ) ( ON ?auto_1982528 ?auto_1982526 ) ( ON ?auto_1982527 ?auto_1982528 ) ( ON ?auto_1982529 ?auto_1982527 ) ( ON ?auto_1982530 ?auto_1982529 ) ( ON ?auto_1982531 ?auto_1982530 ) ( ON ?auto_1982532 ?auto_1982531 ) ( ON ?auto_1982533 ?auto_1982532 ) ( ON ?auto_1982534 ?auto_1982533 ) ( not ( = ?auto_1982523 ?auto_1982524 ) ) ( not ( = ?auto_1982523 ?auto_1982525 ) ) ( not ( = ?auto_1982523 ?auto_1982522 ) ) ( not ( = ?auto_1982523 ?auto_1982526 ) ) ( not ( = ?auto_1982523 ?auto_1982528 ) ) ( not ( = ?auto_1982523 ?auto_1982527 ) ) ( not ( = ?auto_1982523 ?auto_1982529 ) ) ( not ( = ?auto_1982523 ?auto_1982530 ) ) ( not ( = ?auto_1982523 ?auto_1982531 ) ) ( not ( = ?auto_1982523 ?auto_1982532 ) ) ( not ( = ?auto_1982523 ?auto_1982533 ) ) ( not ( = ?auto_1982523 ?auto_1982534 ) ) ( not ( = ?auto_1982523 ?auto_1982535 ) ) ( not ( = ?auto_1982523 ?auto_1982536 ) ) ( not ( = ?auto_1982523 ?auto_1982537 ) ) ( not ( = ?auto_1982524 ?auto_1982525 ) ) ( not ( = ?auto_1982524 ?auto_1982522 ) ) ( not ( = ?auto_1982524 ?auto_1982526 ) ) ( not ( = ?auto_1982524 ?auto_1982528 ) ) ( not ( = ?auto_1982524 ?auto_1982527 ) ) ( not ( = ?auto_1982524 ?auto_1982529 ) ) ( not ( = ?auto_1982524 ?auto_1982530 ) ) ( not ( = ?auto_1982524 ?auto_1982531 ) ) ( not ( = ?auto_1982524 ?auto_1982532 ) ) ( not ( = ?auto_1982524 ?auto_1982533 ) ) ( not ( = ?auto_1982524 ?auto_1982534 ) ) ( not ( = ?auto_1982524 ?auto_1982535 ) ) ( not ( = ?auto_1982524 ?auto_1982536 ) ) ( not ( = ?auto_1982524 ?auto_1982537 ) ) ( not ( = ?auto_1982525 ?auto_1982522 ) ) ( not ( = ?auto_1982525 ?auto_1982526 ) ) ( not ( = ?auto_1982525 ?auto_1982528 ) ) ( not ( = ?auto_1982525 ?auto_1982527 ) ) ( not ( = ?auto_1982525 ?auto_1982529 ) ) ( not ( = ?auto_1982525 ?auto_1982530 ) ) ( not ( = ?auto_1982525 ?auto_1982531 ) ) ( not ( = ?auto_1982525 ?auto_1982532 ) ) ( not ( = ?auto_1982525 ?auto_1982533 ) ) ( not ( = ?auto_1982525 ?auto_1982534 ) ) ( not ( = ?auto_1982525 ?auto_1982535 ) ) ( not ( = ?auto_1982525 ?auto_1982536 ) ) ( not ( = ?auto_1982525 ?auto_1982537 ) ) ( not ( = ?auto_1982522 ?auto_1982526 ) ) ( not ( = ?auto_1982522 ?auto_1982528 ) ) ( not ( = ?auto_1982522 ?auto_1982527 ) ) ( not ( = ?auto_1982522 ?auto_1982529 ) ) ( not ( = ?auto_1982522 ?auto_1982530 ) ) ( not ( = ?auto_1982522 ?auto_1982531 ) ) ( not ( = ?auto_1982522 ?auto_1982532 ) ) ( not ( = ?auto_1982522 ?auto_1982533 ) ) ( not ( = ?auto_1982522 ?auto_1982534 ) ) ( not ( = ?auto_1982522 ?auto_1982535 ) ) ( not ( = ?auto_1982522 ?auto_1982536 ) ) ( not ( = ?auto_1982522 ?auto_1982537 ) ) ( not ( = ?auto_1982526 ?auto_1982528 ) ) ( not ( = ?auto_1982526 ?auto_1982527 ) ) ( not ( = ?auto_1982526 ?auto_1982529 ) ) ( not ( = ?auto_1982526 ?auto_1982530 ) ) ( not ( = ?auto_1982526 ?auto_1982531 ) ) ( not ( = ?auto_1982526 ?auto_1982532 ) ) ( not ( = ?auto_1982526 ?auto_1982533 ) ) ( not ( = ?auto_1982526 ?auto_1982534 ) ) ( not ( = ?auto_1982526 ?auto_1982535 ) ) ( not ( = ?auto_1982526 ?auto_1982536 ) ) ( not ( = ?auto_1982526 ?auto_1982537 ) ) ( not ( = ?auto_1982528 ?auto_1982527 ) ) ( not ( = ?auto_1982528 ?auto_1982529 ) ) ( not ( = ?auto_1982528 ?auto_1982530 ) ) ( not ( = ?auto_1982528 ?auto_1982531 ) ) ( not ( = ?auto_1982528 ?auto_1982532 ) ) ( not ( = ?auto_1982528 ?auto_1982533 ) ) ( not ( = ?auto_1982528 ?auto_1982534 ) ) ( not ( = ?auto_1982528 ?auto_1982535 ) ) ( not ( = ?auto_1982528 ?auto_1982536 ) ) ( not ( = ?auto_1982528 ?auto_1982537 ) ) ( not ( = ?auto_1982527 ?auto_1982529 ) ) ( not ( = ?auto_1982527 ?auto_1982530 ) ) ( not ( = ?auto_1982527 ?auto_1982531 ) ) ( not ( = ?auto_1982527 ?auto_1982532 ) ) ( not ( = ?auto_1982527 ?auto_1982533 ) ) ( not ( = ?auto_1982527 ?auto_1982534 ) ) ( not ( = ?auto_1982527 ?auto_1982535 ) ) ( not ( = ?auto_1982527 ?auto_1982536 ) ) ( not ( = ?auto_1982527 ?auto_1982537 ) ) ( not ( = ?auto_1982529 ?auto_1982530 ) ) ( not ( = ?auto_1982529 ?auto_1982531 ) ) ( not ( = ?auto_1982529 ?auto_1982532 ) ) ( not ( = ?auto_1982529 ?auto_1982533 ) ) ( not ( = ?auto_1982529 ?auto_1982534 ) ) ( not ( = ?auto_1982529 ?auto_1982535 ) ) ( not ( = ?auto_1982529 ?auto_1982536 ) ) ( not ( = ?auto_1982529 ?auto_1982537 ) ) ( not ( = ?auto_1982530 ?auto_1982531 ) ) ( not ( = ?auto_1982530 ?auto_1982532 ) ) ( not ( = ?auto_1982530 ?auto_1982533 ) ) ( not ( = ?auto_1982530 ?auto_1982534 ) ) ( not ( = ?auto_1982530 ?auto_1982535 ) ) ( not ( = ?auto_1982530 ?auto_1982536 ) ) ( not ( = ?auto_1982530 ?auto_1982537 ) ) ( not ( = ?auto_1982531 ?auto_1982532 ) ) ( not ( = ?auto_1982531 ?auto_1982533 ) ) ( not ( = ?auto_1982531 ?auto_1982534 ) ) ( not ( = ?auto_1982531 ?auto_1982535 ) ) ( not ( = ?auto_1982531 ?auto_1982536 ) ) ( not ( = ?auto_1982531 ?auto_1982537 ) ) ( not ( = ?auto_1982532 ?auto_1982533 ) ) ( not ( = ?auto_1982532 ?auto_1982534 ) ) ( not ( = ?auto_1982532 ?auto_1982535 ) ) ( not ( = ?auto_1982532 ?auto_1982536 ) ) ( not ( = ?auto_1982532 ?auto_1982537 ) ) ( not ( = ?auto_1982533 ?auto_1982534 ) ) ( not ( = ?auto_1982533 ?auto_1982535 ) ) ( not ( = ?auto_1982533 ?auto_1982536 ) ) ( not ( = ?auto_1982533 ?auto_1982537 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982534 ?auto_1982535 ?auto_1982536 )
      ( MAKE-14CRATE-VERIFY ?auto_1982523 ?auto_1982524 ?auto_1982525 ?auto_1982522 ?auto_1982526 ?auto_1982528 ?auto_1982527 ?auto_1982529 ?auto_1982530 ?auto_1982531 ?auto_1982532 ?auto_1982533 ?auto_1982534 ?auto_1982535 ?auto_1982536 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982727 - SURFACE
      ?auto_1982728 - SURFACE
      ?auto_1982729 - SURFACE
      ?auto_1982726 - SURFACE
      ?auto_1982730 - SURFACE
      ?auto_1982732 - SURFACE
      ?auto_1982731 - SURFACE
      ?auto_1982733 - SURFACE
      ?auto_1982734 - SURFACE
      ?auto_1982735 - SURFACE
      ?auto_1982736 - SURFACE
      ?auto_1982737 - SURFACE
      ?auto_1982738 - SURFACE
      ?auto_1982739 - SURFACE
      ?auto_1982740 - SURFACE
    )
    :vars
    (
      ?auto_1982742 - HOIST
      ?auto_1982745 - PLACE
      ?auto_1982744 - PLACE
      ?auto_1982743 - HOIST
      ?auto_1982746 - SURFACE
      ?auto_1982741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982742 ?auto_1982745 ) ( IS-CRATE ?auto_1982740 ) ( not ( = ?auto_1982739 ?auto_1982740 ) ) ( not ( = ?auto_1982738 ?auto_1982739 ) ) ( not ( = ?auto_1982738 ?auto_1982740 ) ) ( not ( = ?auto_1982744 ?auto_1982745 ) ) ( HOIST-AT ?auto_1982743 ?auto_1982744 ) ( not ( = ?auto_1982742 ?auto_1982743 ) ) ( AVAILABLE ?auto_1982743 ) ( SURFACE-AT ?auto_1982740 ?auto_1982744 ) ( ON ?auto_1982740 ?auto_1982746 ) ( CLEAR ?auto_1982740 ) ( not ( = ?auto_1982739 ?auto_1982746 ) ) ( not ( = ?auto_1982740 ?auto_1982746 ) ) ( not ( = ?auto_1982738 ?auto_1982746 ) ) ( TRUCK-AT ?auto_1982741 ?auto_1982745 ) ( SURFACE-AT ?auto_1982738 ?auto_1982745 ) ( CLEAR ?auto_1982738 ) ( LIFTING ?auto_1982742 ?auto_1982739 ) ( IS-CRATE ?auto_1982739 ) ( ON ?auto_1982728 ?auto_1982727 ) ( ON ?auto_1982729 ?auto_1982728 ) ( ON ?auto_1982726 ?auto_1982729 ) ( ON ?auto_1982730 ?auto_1982726 ) ( ON ?auto_1982732 ?auto_1982730 ) ( ON ?auto_1982731 ?auto_1982732 ) ( ON ?auto_1982733 ?auto_1982731 ) ( ON ?auto_1982734 ?auto_1982733 ) ( ON ?auto_1982735 ?auto_1982734 ) ( ON ?auto_1982736 ?auto_1982735 ) ( ON ?auto_1982737 ?auto_1982736 ) ( ON ?auto_1982738 ?auto_1982737 ) ( not ( = ?auto_1982727 ?auto_1982728 ) ) ( not ( = ?auto_1982727 ?auto_1982729 ) ) ( not ( = ?auto_1982727 ?auto_1982726 ) ) ( not ( = ?auto_1982727 ?auto_1982730 ) ) ( not ( = ?auto_1982727 ?auto_1982732 ) ) ( not ( = ?auto_1982727 ?auto_1982731 ) ) ( not ( = ?auto_1982727 ?auto_1982733 ) ) ( not ( = ?auto_1982727 ?auto_1982734 ) ) ( not ( = ?auto_1982727 ?auto_1982735 ) ) ( not ( = ?auto_1982727 ?auto_1982736 ) ) ( not ( = ?auto_1982727 ?auto_1982737 ) ) ( not ( = ?auto_1982727 ?auto_1982738 ) ) ( not ( = ?auto_1982727 ?auto_1982739 ) ) ( not ( = ?auto_1982727 ?auto_1982740 ) ) ( not ( = ?auto_1982727 ?auto_1982746 ) ) ( not ( = ?auto_1982728 ?auto_1982729 ) ) ( not ( = ?auto_1982728 ?auto_1982726 ) ) ( not ( = ?auto_1982728 ?auto_1982730 ) ) ( not ( = ?auto_1982728 ?auto_1982732 ) ) ( not ( = ?auto_1982728 ?auto_1982731 ) ) ( not ( = ?auto_1982728 ?auto_1982733 ) ) ( not ( = ?auto_1982728 ?auto_1982734 ) ) ( not ( = ?auto_1982728 ?auto_1982735 ) ) ( not ( = ?auto_1982728 ?auto_1982736 ) ) ( not ( = ?auto_1982728 ?auto_1982737 ) ) ( not ( = ?auto_1982728 ?auto_1982738 ) ) ( not ( = ?auto_1982728 ?auto_1982739 ) ) ( not ( = ?auto_1982728 ?auto_1982740 ) ) ( not ( = ?auto_1982728 ?auto_1982746 ) ) ( not ( = ?auto_1982729 ?auto_1982726 ) ) ( not ( = ?auto_1982729 ?auto_1982730 ) ) ( not ( = ?auto_1982729 ?auto_1982732 ) ) ( not ( = ?auto_1982729 ?auto_1982731 ) ) ( not ( = ?auto_1982729 ?auto_1982733 ) ) ( not ( = ?auto_1982729 ?auto_1982734 ) ) ( not ( = ?auto_1982729 ?auto_1982735 ) ) ( not ( = ?auto_1982729 ?auto_1982736 ) ) ( not ( = ?auto_1982729 ?auto_1982737 ) ) ( not ( = ?auto_1982729 ?auto_1982738 ) ) ( not ( = ?auto_1982729 ?auto_1982739 ) ) ( not ( = ?auto_1982729 ?auto_1982740 ) ) ( not ( = ?auto_1982729 ?auto_1982746 ) ) ( not ( = ?auto_1982726 ?auto_1982730 ) ) ( not ( = ?auto_1982726 ?auto_1982732 ) ) ( not ( = ?auto_1982726 ?auto_1982731 ) ) ( not ( = ?auto_1982726 ?auto_1982733 ) ) ( not ( = ?auto_1982726 ?auto_1982734 ) ) ( not ( = ?auto_1982726 ?auto_1982735 ) ) ( not ( = ?auto_1982726 ?auto_1982736 ) ) ( not ( = ?auto_1982726 ?auto_1982737 ) ) ( not ( = ?auto_1982726 ?auto_1982738 ) ) ( not ( = ?auto_1982726 ?auto_1982739 ) ) ( not ( = ?auto_1982726 ?auto_1982740 ) ) ( not ( = ?auto_1982726 ?auto_1982746 ) ) ( not ( = ?auto_1982730 ?auto_1982732 ) ) ( not ( = ?auto_1982730 ?auto_1982731 ) ) ( not ( = ?auto_1982730 ?auto_1982733 ) ) ( not ( = ?auto_1982730 ?auto_1982734 ) ) ( not ( = ?auto_1982730 ?auto_1982735 ) ) ( not ( = ?auto_1982730 ?auto_1982736 ) ) ( not ( = ?auto_1982730 ?auto_1982737 ) ) ( not ( = ?auto_1982730 ?auto_1982738 ) ) ( not ( = ?auto_1982730 ?auto_1982739 ) ) ( not ( = ?auto_1982730 ?auto_1982740 ) ) ( not ( = ?auto_1982730 ?auto_1982746 ) ) ( not ( = ?auto_1982732 ?auto_1982731 ) ) ( not ( = ?auto_1982732 ?auto_1982733 ) ) ( not ( = ?auto_1982732 ?auto_1982734 ) ) ( not ( = ?auto_1982732 ?auto_1982735 ) ) ( not ( = ?auto_1982732 ?auto_1982736 ) ) ( not ( = ?auto_1982732 ?auto_1982737 ) ) ( not ( = ?auto_1982732 ?auto_1982738 ) ) ( not ( = ?auto_1982732 ?auto_1982739 ) ) ( not ( = ?auto_1982732 ?auto_1982740 ) ) ( not ( = ?auto_1982732 ?auto_1982746 ) ) ( not ( = ?auto_1982731 ?auto_1982733 ) ) ( not ( = ?auto_1982731 ?auto_1982734 ) ) ( not ( = ?auto_1982731 ?auto_1982735 ) ) ( not ( = ?auto_1982731 ?auto_1982736 ) ) ( not ( = ?auto_1982731 ?auto_1982737 ) ) ( not ( = ?auto_1982731 ?auto_1982738 ) ) ( not ( = ?auto_1982731 ?auto_1982739 ) ) ( not ( = ?auto_1982731 ?auto_1982740 ) ) ( not ( = ?auto_1982731 ?auto_1982746 ) ) ( not ( = ?auto_1982733 ?auto_1982734 ) ) ( not ( = ?auto_1982733 ?auto_1982735 ) ) ( not ( = ?auto_1982733 ?auto_1982736 ) ) ( not ( = ?auto_1982733 ?auto_1982737 ) ) ( not ( = ?auto_1982733 ?auto_1982738 ) ) ( not ( = ?auto_1982733 ?auto_1982739 ) ) ( not ( = ?auto_1982733 ?auto_1982740 ) ) ( not ( = ?auto_1982733 ?auto_1982746 ) ) ( not ( = ?auto_1982734 ?auto_1982735 ) ) ( not ( = ?auto_1982734 ?auto_1982736 ) ) ( not ( = ?auto_1982734 ?auto_1982737 ) ) ( not ( = ?auto_1982734 ?auto_1982738 ) ) ( not ( = ?auto_1982734 ?auto_1982739 ) ) ( not ( = ?auto_1982734 ?auto_1982740 ) ) ( not ( = ?auto_1982734 ?auto_1982746 ) ) ( not ( = ?auto_1982735 ?auto_1982736 ) ) ( not ( = ?auto_1982735 ?auto_1982737 ) ) ( not ( = ?auto_1982735 ?auto_1982738 ) ) ( not ( = ?auto_1982735 ?auto_1982739 ) ) ( not ( = ?auto_1982735 ?auto_1982740 ) ) ( not ( = ?auto_1982735 ?auto_1982746 ) ) ( not ( = ?auto_1982736 ?auto_1982737 ) ) ( not ( = ?auto_1982736 ?auto_1982738 ) ) ( not ( = ?auto_1982736 ?auto_1982739 ) ) ( not ( = ?auto_1982736 ?auto_1982740 ) ) ( not ( = ?auto_1982736 ?auto_1982746 ) ) ( not ( = ?auto_1982737 ?auto_1982738 ) ) ( not ( = ?auto_1982737 ?auto_1982739 ) ) ( not ( = ?auto_1982737 ?auto_1982740 ) ) ( not ( = ?auto_1982737 ?auto_1982746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982738 ?auto_1982739 ?auto_1982740 )
      ( MAKE-14CRATE-VERIFY ?auto_1982727 ?auto_1982728 ?auto_1982729 ?auto_1982726 ?auto_1982730 ?auto_1982732 ?auto_1982731 ?auto_1982733 ?auto_1982734 ?auto_1982735 ?auto_1982736 ?auto_1982737 ?auto_1982738 ?auto_1982739 ?auto_1982740 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1982931 - SURFACE
      ?auto_1982932 - SURFACE
      ?auto_1982933 - SURFACE
      ?auto_1982930 - SURFACE
      ?auto_1982934 - SURFACE
      ?auto_1982936 - SURFACE
      ?auto_1982935 - SURFACE
      ?auto_1982937 - SURFACE
      ?auto_1982938 - SURFACE
      ?auto_1982939 - SURFACE
      ?auto_1982940 - SURFACE
      ?auto_1982941 - SURFACE
      ?auto_1982942 - SURFACE
      ?auto_1982943 - SURFACE
      ?auto_1982944 - SURFACE
    )
    :vars
    (
      ?auto_1982950 - HOIST
      ?auto_1982949 - PLACE
      ?auto_1982947 - PLACE
      ?auto_1982945 - HOIST
      ?auto_1982948 - SURFACE
      ?auto_1982946 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982950 ?auto_1982949 ) ( IS-CRATE ?auto_1982944 ) ( not ( = ?auto_1982943 ?auto_1982944 ) ) ( not ( = ?auto_1982942 ?auto_1982943 ) ) ( not ( = ?auto_1982942 ?auto_1982944 ) ) ( not ( = ?auto_1982947 ?auto_1982949 ) ) ( HOIST-AT ?auto_1982945 ?auto_1982947 ) ( not ( = ?auto_1982950 ?auto_1982945 ) ) ( AVAILABLE ?auto_1982945 ) ( SURFACE-AT ?auto_1982944 ?auto_1982947 ) ( ON ?auto_1982944 ?auto_1982948 ) ( CLEAR ?auto_1982944 ) ( not ( = ?auto_1982943 ?auto_1982948 ) ) ( not ( = ?auto_1982944 ?auto_1982948 ) ) ( not ( = ?auto_1982942 ?auto_1982948 ) ) ( TRUCK-AT ?auto_1982946 ?auto_1982949 ) ( SURFACE-AT ?auto_1982942 ?auto_1982949 ) ( CLEAR ?auto_1982942 ) ( IS-CRATE ?auto_1982943 ) ( AVAILABLE ?auto_1982950 ) ( IN ?auto_1982943 ?auto_1982946 ) ( ON ?auto_1982932 ?auto_1982931 ) ( ON ?auto_1982933 ?auto_1982932 ) ( ON ?auto_1982930 ?auto_1982933 ) ( ON ?auto_1982934 ?auto_1982930 ) ( ON ?auto_1982936 ?auto_1982934 ) ( ON ?auto_1982935 ?auto_1982936 ) ( ON ?auto_1982937 ?auto_1982935 ) ( ON ?auto_1982938 ?auto_1982937 ) ( ON ?auto_1982939 ?auto_1982938 ) ( ON ?auto_1982940 ?auto_1982939 ) ( ON ?auto_1982941 ?auto_1982940 ) ( ON ?auto_1982942 ?auto_1982941 ) ( not ( = ?auto_1982931 ?auto_1982932 ) ) ( not ( = ?auto_1982931 ?auto_1982933 ) ) ( not ( = ?auto_1982931 ?auto_1982930 ) ) ( not ( = ?auto_1982931 ?auto_1982934 ) ) ( not ( = ?auto_1982931 ?auto_1982936 ) ) ( not ( = ?auto_1982931 ?auto_1982935 ) ) ( not ( = ?auto_1982931 ?auto_1982937 ) ) ( not ( = ?auto_1982931 ?auto_1982938 ) ) ( not ( = ?auto_1982931 ?auto_1982939 ) ) ( not ( = ?auto_1982931 ?auto_1982940 ) ) ( not ( = ?auto_1982931 ?auto_1982941 ) ) ( not ( = ?auto_1982931 ?auto_1982942 ) ) ( not ( = ?auto_1982931 ?auto_1982943 ) ) ( not ( = ?auto_1982931 ?auto_1982944 ) ) ( not ( = ?auto_1982931 ?auto_1982948 ) ) ( not ( = ?auto_1982932 ?auto_1982933 ) ) ( not ( = ?auto_1982932 ?auto_1982930 ) ) ( not ( = ?auto_1982932 ?auto_1982934 ) ) ( not ( = ?auto_1982932 ?auto_1982936 ) ) ( not ( = ?auto_1982932 ?auto_1982935 ) ) ( not ( = ?auto_1982932 ?auto_1982937 ) ) ( not ( = ?auto_1982932 ?auto_1982938 ) ) ( not ( = ?auto_1982932 ?auto_1982939 ) ) ( not ( = ?auto_1982932 ?auto_1982940 ) ) ( not ( = ?auto_1982932 ?auto_1982941 ) ) ( not ( = ?auto_1982932 ?auto_1982942 ) ) ( not ( = ?auto_1982932 ?auto_1982943 ) ) ( not ( = ?auto_1982932 ?auto_1982944 ) ) ( not ( = ?auto_1982932 ?auto_1982948 ) ) ( not ( = ?auto_1982933 ?auto_1982930 ) ) ( not ( = ?auto_1982933 ?auto_1982934 ) ) ( not ( = ?auto_1982933 ?auto_1982936 ) ) ( not ( = ?auto_1982933 ?auto_1982935 ) ) ( not ( = ?auto_1982933 ?auto_1982937 ) ) ( not ( = ?auto_1982933 ?auto_1982938 ) ) ( not ( = ?auto_1982933 ?auto_1982939 ) ) ( not ( = ?auto_1982933 ?auto_1982940 ) ) ( not ( = ?auto_1982933 ?auto_1982941 ) ) ( not ( = ?auto_1982933 ?auto_1982942 ) ) ( not ( = ?auto_1982933 ?auto_1982943 ) ) ( not ( = ?auto_1982933 ?auto_1982944 ) ) ( not ( = ?auto_1982933 ?auto_1982948 ) ) ( not ( = ?auto_1982930 ?auto_1982934 ) ) ( not ( = ?auto_1982930 ?auto_1982936 ) ) ( not ( = ?auto_1982930 ?auto_1982935 ) ) ( not ( = ?auto_1982930 ?auto_1982937 ) ) ( not ( = ?auto_1982930 ?auto_1982938 ) ) ( not ( = ?auto_1982930 ?auto_1982939 ) ) ( not ( = ?auto_1982930 ?auto_1982940 ) ) ( not ( = ?auto_1982930 ?auto_1982941 ) ) ( not ( = ?auto_1982930 ?auto_1982942 ) ) ( not ( = ?auto_1982930 ?auto_1982943 ) ) ( not ( = ?auto_1982930 ?auto_1982944 ) ) ( not ( = ?auto_1982930 ?auto_1982948 ) ) ( not ( = ?auto_1982934 ?auto_1982936 ) ) ( not ( = ?auto_1982934 ?auto_1982935 ) ) ( not ( = ?auto_1982934 ?auto_1982937 ) ) ( not ( = ?auto_1982934 ?auto_1982938 ) ) ( not ( = ?auto_1982934 ?auto_1982939 ) ) ( not ( = ?auto_1982934 ?auto_1982940 ) ) ( not ( = ?auto_1982934 ?auto_1982941 ) ) ( not ( = ?auto_1982934 ?auto_1982942 ) ) ( not ( = ?auto_1982934 ?auto_1982943 ) ) ( not ( = ?auto_1982934 ?auto_1982944 ) ) ( not ( = ?auto_1982934 ?auto_1982948 ) ) ( not ( = ?auto_1982936 ?auto_1982935 ) ) ( not ( = ?auto_1982936 ?auto_1982937 ) ) ( not ( = ?auto_1982936 ?auto_1982938 ) ) ( not ( = ?auto_1982936 ?auto_1982939 ) ) ( not ( = ?auto_1982936 ?auto_1982940 ) ) ( not ( = ?auto_1982936 ?auto_1982941 ) ) ( not ( = ?auto_1982936 ?auto_1982942 ) ) ( not ( = ?auto_1982936 ?auto_1982943 ) ) ( not ( = ?auto_1982936 ?auto_1982944 ) ) ( not ( = ?auto_1982936 ?auto_1982948 ) ) ( not ( = ?auto_1982935 ?auto_1982937 ) ) ( not ( = ?auto_1982935 ?auto_1982938 ) ) ( not ( = ?auto_1982935 ?auto_1982939 ) ) ( not ( = ?auto_1982935 ?auto_1982940 ) ) ( not ( = ?auto_1982935 ?auto_1982941 ) ) ( not ( = ?auto_1982935 ?auto_1982942 ) ) ( not ( = ?auto_1982935 ?auto_1982943 ) ) ( not ( = ?auto_1982935 ?auto_1982944 ) ) ( not ( = ?auto_1982935 ?auto_1982948 ) ) ( not ( = ?auto_1982937 ?auto_1982938 ) ) ( not ( = ?auto_1982937 ?auto_1982939 ) ) ( not ( = ?auto_1982937 ?auto_1982940 ) ) ( not ( = ?auto_1982937 ?auto_1982941 ) ) ( not ( = ?auto_1982937 ?auto_1982942 ) ) ( not ( = ?auto_1982937 ?auto_1982943 ) ) ( not ( = ?auto_1982937 ?auto_1982944 ) ) ( not ( = ?auto_1982937 ?auto_1982948 ) ) ( not ( = ?auto_1982938 ?auto_1982939 ) ) ( not ( = ?auto_1982938 ?auto_1982940 ) ) ( not ( = ?auto_1982938 ?auto_1982941 ) ) ( not ( = ?auto_1982938 ?auto_1982942 ) ) ( not ( = ?auto_1982938 ?auto_1982943 ) ) ( not ( = ?auto_1982938 ?auto_1982944 ) ) ( not ( = ?auto_1982938 ?auto_1982948 ) ) ( not ( = ?auto_1982939 ?auto_1982940 ) ) ( not ( = ?auto_1982939 ?auto_1982941 ) ) ( not ( = ?auto_1982939 ?auto_1982942 ) ) ( not ( = ?auto_1982939 ?auto_1982943 ) ) ( not ( = ?auto_1982939 ?auto_1982944 ) ) ( not ( = ?auto_1982939 ?auto_1982948 ) ) ( not ( = ?auto_1982940 ?auto_1982941 ) ) ( not ( = ?auto_1982940 ?auto_1982942 ) ) ( not ( = ?auto_1982940 ?auto_1982943 ) ) ( not ( = ?auto_1982940 ?auto_1982944 ) ) ( not ( = ?auto_1982940 ?auto_1982948 ) ) ( not ( = ?auto_1982941 ?auto_1982942 ) ) ( not ( = ?auto_1982941 ?auto_1982943 ) ) ( not ( = ?auto_1982941 ?auto_1982944 ) ) ( not ( = ?auto_1982941 ?auto_1982948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1982942 ?auto_1982943 ?auto_1982944 )
      ( MAKE-14CRATE-VERIFY ?auto_1982931 ?auto_1982932 ?auto_1982933 ?auto_1982930 ?auto_1982934 ?auto_1982936 ?auto_1982935 ?auto_1982937 ?auto_1982938 ?auto_1982939 ?auto_1982940 ?auto_1982941 ?auto_1982942 ?auto_1982943 ?auto_1982944 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000151 - SURFACE
      ?auto_2000152 - SURFACE
      ?auto_2000153 - SURFACE
      ?auto_2000150 - SURFACE
      ?auto_2000154 - SURFACE
      ?auto_2000156 - SURFACE
      ?auto_2000155 - SURFACE
      ?auto_2000157 - SURFACE
      ?auto_2000158 - SURFACE
      ?auto_2000159 - SURFACE
      ?auto_2000160 - SURFACE
      ?auto_2000161 - SURFACE
      ?auto_2000162 - SURFACE
      ?auto_2000163 - SURFACE
      ?auto_2000164 - SURFACE
      ?auto_2000165 - SURFACE
    )
    :vars
    (
      ?auto_2000167 - HOIST
      ?auto_2000166 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000167 ?auto_2000166 ) ( SURFACE-AT ?auto_2000164 ?auto_2000166 ) ( CLEAR ?auto_2000164 ) ( LIFTING ?auto_2000167 ?auto_2000165 ) ( IS-CRATE ?auto_2000165 ) ( not ( = ?auto_2000164 ?auto_2000165 ) ) ( ON ?auto_2000152 ?auto_2000151 ) ( ON ?auto_2000153 ?auto_2000152 ) ( ON ?auto_2000150 ?auto_2000153 ) ( ON ?auto_2000154 ?auto_2000150 ) ( ON ?auto_2000156 ?auto_2000154 ) ( ON ?auto_2000155 ?auto_2000156 ) ( ON ?auto_2000157 ?auto_2000155 ) ( ON ?auto_2000158 ?auto_2000157 ) ( ON ?auto_2000159 ?auto_2000158 ) ( ON ?auto_2000160 ?auto_2000159 ) ( ON ?auto_2000161 ?auto_2000160 ) ( ON ?auto_2000162 ?auto_2000161 ) ( ON ?auto_2000163 ?auto_2000162 ) ( ON ?auto_2000164 ?auto_2000163 ) ( not ( = ?auto_2000151 ?auto_2000152 ) ) ( not ( = ?auto_2000151 ?auto_2000153 ) ) ( not ( = ?auto_2000151 ?auto_2000150 ) ) ( not ( = ?auto_2000151 ?auto_2000154 ) ) ( not ( = ?auto_2000151 ?auto_2000156 ) ) ( not ( = ?auto_2000151 ?auto_2000155 ) ) ( not ( = ?auto_2000151 ?auto_2000157 ) ) ( not ( = ?auto_2000151 ?auto_2000158 ) ) ( not ( = ?auto_2000151 ?auto_2000159 ) ) ( not ( = ?auto_2000151 ?auto_2000160 ) ) ( not ( = ?auto_2000151 ?auto_2000161 ) ) ( not ( = ?auto_2000151 ?auto_2000162 ) ) ( not ( = ?auto_2000151 ?auto_2000163 ) ) ( not ( = ?auto_2000151 ?auto_2000164 ) ) ( not ( = ?auto_2000151 ?auto_2000165 ) ) ( not ( = ?auto_2000152 ?auto_2000153 ) ) ( not ( = ?auto_2000152 ?auto_2000150 ) ) ( not ( = ?auto_2000152 ?auto_2000154 ) ) ( not ( = ?auto_2000152 ?auto_2000156 ) ) ( not ( = ?auto_2000152 ?auto_2000155 ) ) ( not ( = ?auto_2000152 ?auto_2000157 ) ) ( not ( = ?auto_2000152 ?auto_2000158 ) ) ( not ( = ?auto_2000152 ?auto_2000159 ) ) ( not ( = ?auto_2000152 ?auto_2000160 ) ) ( not ( = ?auto_2000152 ?auto_2000161 ) ) ( not ( = ?auto_2000152 ?auto_2000162 ) ) ( not ( = ?auto_2000152 ?auto_2000163 ) ) ( not ( = ?auto_2000152 ?auto_2000164 ) ) ( not ( = ?auto_2000152 ?auto_2000165 ) ) ( not ( = ?auto_2000153 ?auto_2000150 ) ) ( not ( = ?auto_2000153 ?auto_2000154 ) ) ( not ( = ?auto_2000153 ?auto_2000156 ) ) ( not ( = ?auto_2000153 ?auto_2000155 ) ) ( not ( = ?auto_2000153 ?auto_2000157 ) ) ( not ( = ?auto_2000153 ?auto_2000158 ) ) ( not ( = ?auto_2000153 ?auto_2000159 ) ) ( not ( = ?auto_2000153 ?auto_2000160 ) ) ( not ( = ?auto_2000153 ?auto_2000161 ) ) ( not ( = ?auto_2000153 ?auto_2000162 ) ) ( not ( = ?auto_2000153 ?auto_2000163 ) ) ( not ( = ?auto_2000153 ?auto_2000164 ) ) ( not ( = ?auto_2000153 ?auto_2000165 ) ) ( not ( = ?auto_2000150 ?auto_2000154 ) ) ( not ( = ?auto_2000150 ?auto_2000156 ) ) ( not ( = ?auto_2000150 ?auto_2000155 ) ) ( not ( = ?auto_2000150 ?auto_2000157 ) ) ( not ( = ?auto_2000150 ?auto_2000158 ) ) ( not ( = ?auto_2000150 ?auto_2000159 ) ) ( not ( = ?auto_2000150 ?auto_2000160 ) ) ( not ( = ?auto_2000150 ?auto_2000161 ) ) ( not ( = ?auto_2000150 ?auto_2000162 ) ) ( not ( = ?auto_2000150 ?auto_2000163 ) ) ( not ( = ?auto_2000150 ?auto_2000164 ) ) ( not ( = ?auto_2000150 ?auto_2000165 ) ) ( not ( = ?auto_2000154 ?auto_2000156 ) ) ( not ( = ?auto_2000154 ?auto_2000155 ) ) ( not ( = ?auto_2000154 ?auto_2000157 ) ) ( not ( = ?auto_2000154 ?auto_2000158 ) ) ( not ( = ?auto_2000154 ?auto_2000159 ) ) ( not ( = ?auto_2000154 ?auto_2000160 ) ) ( not ( = ?auto_2000154 ?auto_2000161 ) ) ( not ( = ?auto_2000154 ?auto_2000162 ) ) ( not ( = ?auto_2000154 ?auto_2000163 ) ) ( not ( = ?auto_2000154 ?auto_2000164 ) ) ( not ( = ?auto_2000154 ?auto_2000165 ) ) ( not ( = ?auto_2000156 ?auto_2000155 ) ) ( not ( = ?auto_2000156 ?auto_2000157 ) ) ( not ( = ?auto_2000156 ?auto_2000158 ) ) ( not ( = ?auto_2000156 ?auto_2000159 ) ) ( not ( = ?auto_2000156 ?auto_2000160 ) ) ( not ( = ?auto_2000156 ?auto_2000161 ) ) ( not ( = ?auto_2000156 ?auto_2000162 ) ) ( not ( = ?auto_2000156 ?auto_2000163 ) ) ( not ( = ?auto_2000156 ?auto_2000164 ) ) ( not ( = ?auto_2000156 ?auto_2000165 ) ) ( not ( = ?auto_2000155 ?auto_2000157 ) ) ( not ( = ?auto_2000155 ?auto_2000158 ) ) ( not ( = ?auto_2000155 ?auto_2000159 ) ) ( not ( = ?auto_2000155 ?auto_2000160 ) ) ( not ( = ?auto_2000155 ?auto_2000161 ) ) ( not ( = ?auto_2000155 ?auto_2000162 ) ) ( not ( = ?auto_2000155 ?auto_2000163 ) ) ( not ( = ?auto_2000155 ?auto_2000164 ) ) ( not ( = ?auto_2000155 ?auto_2000165 ) ) ( not ( = ?auto_2000157 ?auto_2000158 ) ) ( not ( = ?auto_2000157 ?auto_2000159 ) ) ( not ( = ?auto_2000157 ?auto_2000160 ) ) ( not ( = ?auto_2000157 ?auto_2000161 ) ) ( not ( = ?auto_2000157 ?auto_2000162 ) ) ( not ( = ?auto_2000157 ?auto_2000163 ) ) ( not ( = ?auto_2000157 ?auto_2000164 ) ) ( not ( = ?auto_2000157 ?auto_2000165 ) ) ( not ( = ?auto_2000158 ?auto_2000159 ) ) ( not ( = ?auto_2000158 ?auto_2000160 ) ) ( not ( = ?auto_2000158 ?auto_2000161 ) ) ( not ( = ?auto_2000158 ?auto_2000162 ) ) ( not ( = ?auto_2000158 ?auto_2000163 ) ) ( not ( = ?auto_2000158 ?auto_2000164 ) ) ( not ( = ?auto_2000158 ?auto_2000165 ) ) ( not ( = ?auto_2000159 ?auto_2000160 ) ) ( not ( = ?auto_2000159 ?auto_2000161 ) ) ( not ( = ?auto_2000159 ?auto_2000162 ) ) ( not ( = ?auto_2000159 ?auto_2000163 ) ) ( not ( = ?auto_2000159 ?auto_2000164 ) ) ( not ( = ?auto_2000159 ?auto_2000165 ) ) ( not ( = ?auto_2000160 ?auto_2000161 ) ) ( not ( = ?auto_2000160 ?auto_2000162 ) ) ( not ( = ?auto_2000160 ?auto_2000163 ) ) ( not ( = ?auto_2000160 ?auto_2000164 ) ) ( not ( = ?auto_2000160 ?auto_2000165 ) ) ( not ( = ?auto_2000161 ?auto_2000162 ) ) ( not ( = ?auto_2000161 ?auto_2000163 ) ) ( not ( = ?auto_2000161 ?auto_2000164 ) ) ( not ( = ?auto_2000161 ?auto_2000165 ) ) ( not ( = ?auto_2000162 ?auto_2000163 ) ) ( not ( = ?auto_2000162 ?auto_2000164 ) ) ( not ( = ?auto_2000162 ?auto_2000165 ) ) ( not ( = ?auto_2000163 ?auto_2000164 ) ) ( not ( = ?auto_2000163 ?auto_2000165 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2000164 ?auto_2000165 )
      ( MAKE-15CRATE-VERIFY ?auto_2000151 ?auto_2000152 ?auto_2000153 ?auto_2000150 ?auto_2000154 ?auto_2000156 ?auto_2000155 ?auto_2000157 ?auto_2000158 ?auto_2000159 ?auto_2000160 ?auto_2000161 ?auto_2000162 ?auto_2000163 ?auto_2000164 ?auto_2000165 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000330 - SURFACE
      ?auto_2000331 - SURFACE
      ?auto_2000332 - SURFACE
      ?auto_2000329 - SURFACE
      ?auto_2000333 - SURFACE
      ?auto_2000335 - SURFACE
      ?auto_2000334 - SURFACE
      ?auto_2000336 - SURFACE
      ?auto_2000337 - SURFACE
      ?auto_2000338 - SURFACE
      ?auto_2000339 - SURFACE
      ?auto_2000340 - SURFACE
      ?auto_2000341 - SURFACE
      ?auto_2000342 - SURFACE
      ?auto_2000343 - SURFACE
      ?auto_2000344 - SURFACE
    )
    :vars
    (
      ?auto_2000346 - HOIST
      ?auto_2000347 - PLACE
      ?auto_2000345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000346 ?auto_2000347 ) ( SURFACE-AT ?auto_2000343 ?auto_2000347 ) ( CLEAR ?auto_2000343 ) ( IS-CRATE ?auto_2000344 ) ( not ( = ?auto_2000343 ?auto_2000344 ) ) ( TRUCK-AT ?auto_2000345 ?auto_2000347 ) ( AVAILABLE ?auto_2000346 ) ( IN ?auto_2000344 ?auto_2000345 ) ( ON ?auto_2000343 ?auto_2000342 ) ( not ( = ?auto_2000342 ?auto_2000343 ) ) ( not ( = ?auto_2000342 ?auto_2000344 ) ) ( ON ?auto_2000331 ?auto_2000330 ) ( ON ?auto_2000332 ?auto_2000331 ) ( ON ?auto_2000329 ?auto_2000332 ) ( ON ?auto_2000333 ?auto_2000329 ) ( ON ?auto_2000335 ?auto_2000333 ) ( ON ?auto_2000334 ?auto_2000335 ) ( ON ?auto_2000336 ?auto_2000334 ) ( ON ?auto_2000337 ?auto_2000336 ) ( ON ?auto_2000338 ?auto_2000337 ) ( ON ?auto_2000339 ?auto_2000338 ) ( ON ?auto_2000340 ?auto_2000339 ) ( ON ?auto_2000341 ?auto_2000340 ) ( ON ?auto_2000342 ?auto_2000341 ) ( not ( = ?auto_2000330 ?auto_2000331 ) ) ( not ( = ?auto_2000330 ?auto_2000332 ) ) ( not ( = ?auto_2000330 ?auto_2000329 ) ) ( not ( = ?auto_2000330 ?auto_2000333 ) ) ( not ( = ?auto_2000330 ?auto_2000335 ) ) ( not ( = ?auto_2000330 ?auto_2000334 ) ) ( not ( = ?auto_2000330 ?auto_2000336 ) ) ( not ( = ?auto_2000330 ?auto_2000337 ) ) ( not ( = ?auto_2000330 ?auto_2000338 ) ) ( not ( = ?auto_2000330 ?auto_2000339 ) ) ( not ( = ?auto_2000330 ?auto_2000340 ) ) ( not ( = ?auto_2000330 ?auto_2000341 ) ) ( not ( = ?auto_2000330 ?auto_2000342 ) ) ( not ( = ?auto_2000330 ?auto_2000343 ) ) ( not ( = ?auto_2000330 ?auto_2000344 ) ) ( not ( = ?auto_2000331 ?auto_2000332 ) ) ( not ( = ?auto_2000331 ?auto_2000329 ) ) ( not ( = ?auto_2000331 ?auto_2000333 ) ) ( not ( = ?auto_2000331 ?auto_2000335 ) ) ( not ( = ?auto_2000331 ?auto_2000334 ) ) ( not ( = ?auto_2000331 ?auto_2000336 ) ) ( not ( = ?auto_2000331 ?auto_2000337 ) ) ( not ( = ?auto_2000331 ?auto_2000338 ) ) ( not ( = ?auto_2000331 ?auto_2000339 ) ) ( not ( = ?auto_2000331 ?auto_2000340 ) ) ( not ( = ?auto_2000331 ?auto_2000341 ) ) ( not ( = ?auto_2000331 ?auto_2000342 ) ) ( not ( = ?auto_2000331 ?auto_2000343 ) ) ( not ( = ?auto_2000331 ?auto_2000344 ) ) ( not ( = ?auto_2000332 ?auto_2000329 ) ) ( not ( = ?auto_2000332 ?auto_2000333 ) ) ( not ( = ?auto_2000332 ?auto_2000335 ) ) ( not ( = ?auto_2000332 ?auto_2000334 ) ) ( not ( = ?auto_2000332 ?auto_2000336 ) ) ( not ( = ?auto_2000332 ?auto_2000337 ) ) ( not ( = ?auto_2000332 ?auto_2000338 ) ) ( not ( = ?auto_2000332 ?auto_2000339 ) ) ( not ( = ?auto_2000332 ?auto_2000340 ) ) ( not ( = ?auto_2000332 ?auto_2000341 ) ) ( not ( = ?auto_2000332 ?auto_2000342 ) ) ( not ( = ?auto_2000332 ?auto_2000343 ) ) ( not ( = ?auto_2000332 ?auto_2000344 ) ) ( not ( = ?auto_2000329 ?auto_2000333 ) ) ( not ( = ?auto_2000329 ?auto_2000335 ) ) ( not ( = ?auto_2000329 ?auto_2000334 ) ) ( not ( = ?auto_2000329 ?auto_2000336 ) ) ( not ( = ?auto_2000329 ?auto_2000337 ) ) ( not ( = ?auto_2000329 ?auto_2000338 ) ) ( not ( = ?auto_2000329 ?auto_2000339 ) ) ( not ( = ?auto_2000329 ?auto_2000340 ) ) ( not ( = ?auto_2000329 ?auto_2000341 ) ) ( not ( = ?auto_2000329 ?auto_2000342 ) ) ( not ( = ?auto_2000329 ?auto_2000343 ) ) ( not ( = ?auto_2000329 ?auto_2000344 ) ) ( not ( = ?auto_2000333 ?auto_2000335 ) ) ( not ( = ?auto_2000333 ?auto_2000334 ) ) ( not ( = ?auto_2000333 ?auto_2000336 ) ) ( not ( = ?auto_2000333 ?auto_2000337 ) ) ( not ( = ?auto_2000333 ?auto_2000338 ) ) ( not ( = ?auto_2000333 ?auto_2000339 ) ) ( not ( = ?auto_2000333 ?auto_2000340 ) ) ( not ( = ?auto_2000333 ?auto_2000341 ) ) ( not ( = ?auto_2000333 ?auto_2000342 ) ) ( not ( = ?auto_2000333 ?auto_2000343 ) ) ( not ( = ?auto_2000333 ?auto_2000344 ) ) ( not ( = ?auto_2000335 ?auto_2000334 ) ) ( not ( = ?auto_2000335 ?auto_2000336 ) ) ( not ( = ?auto_2000335 ?auto_2000337 ) ) ( not ( = ?auto_2000335 ?auto_2000338 ) ) ( not ( = ?auto_2000335 ?auto_2000339 ) ) ( not ( = ?auto_2000335 ?auto_2000340 ) ) ( not ( = ?auto_2000335 ?auto_2000341 ) ) ( not ( = ?auto_2000335 ?auto_2000342 ) ) ( not ( = ?auto_2000335 ?auto_2000343 ) ) ( not ( = ?auto_2000335 ?auto_2000344 ) ) ( not ( = ?auto_2000334 ?auto_2000336 ) ) ( not ( = ?auto_2000334 ?auto_2000337 ) ) ( not ( = ?auto_2000334 ?auto_2000338 ) ) ( not ( = ?auto_2000334 ?auto_2000339 ) ) ( not ( = ?auto_2000334 ?auto_2000340 ) ) ( not ( = ?auto_2000334 ?auto_2000341 ) ) ( not ( = ?auto_2000334 ?auto_2000342 ) ) ( not ( = ?auto_2000334 ?auto_2000343 ) ) ( not ( = ?auto_2000334 ?auto_2000344 ) ) ( not ( = ?auto_2000336 ?auto_2000337 ) ) ( not ( = ?auto_2000336 ?auto_2000338 ) ) ( not ( = ?auto_2000336 ?auto_2000339 ) ) ( not ( = ?auto_2000336 ?auto_2000340 ) ) ( not ( = ?auto_2000336 ?auto_2000341 ) ) ( not ( = ?auto_2000336 ?auto_2000342 ) ) ( not ( = ?auto_2000336 ?auto_2000343 ) ) ( not ( = ?auto_2000336 ?auto_2000344 ) ) ( not ( = ?auto_2000337 ?auto_2000338 ) ) ( not ( = ?auto_2000337 ?auto_2000339 ) ) ( not ( = ?auto_2000337 ?auto_2000340 ) ) ( not ( = ?auto_2000337 ?auto_2000341 ) ) ( not ( = ?auto_2000337 ?auto_2000342 ) ) ( not ( = ?auto_2000337 ?auto_2000343 ) ) ( not ( = ?auto_2000337 ?auto_2000344 ) ) ( not ( = ?auto_2000338 ?auto_2000339 ) ) ( not ( = ?auto_2000338 ?auto_2000340 ) ) ( not ( = ?auto_2000338 ?auto_2000341 ) ) ( not ( = ?auto_2000338 ?auto_2000342 ) ) ( not ( = ?auto_2000338 ?auto_2000343 ) ) ( not ( = ?auto_2000338 ?auto_2000344 ) ) ( not ( = ?auto_2000339 ?auto_2000340 ) ) ( not ( = ?auto_2000339 ?auto_2000341 ) ) ( not ( = ?auto_2000339 ?auto_2000342 ) ) ( not ( = ?auto_2000339 ?auto_2000343 ) ) ( not ( = ?auto_2000339 ?auto_2000344 ) ) ( not ( = ?auto_2000340 ?auto_2000341 ) ) ( not ( = ?auto_2000340 ?auto_2000342 ) ) ( not ( = ?auto_2000340 ?auto_2000343 ) ) ( not ( = ?auto_2000340 ?auto_2000344 ) ) ( not ( = ?auto_2000341 ?auto_2000342 ) ) ( not ( = ?auto_2000341 ?auto_2000343 ) ) ( not ( = ?auto_2000341 ?auto_2000344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000342 ?auto_2000343 ?auto_2000344 )
      ( MAKE-15CRATE-VERIFY ?auto_2000330 ?auto_2000331 ?auto_2000332 ?auto_2000329 ?auto_2000333 ?auto_2000335 ?auto_2000334 ?auto_2000336 ?auto_2000337 ?auto_2000338 ?auto_2000339 ?auto_2000340 ?auto_2000341 ?auto_2000342 ?auto_2000343 ?auto_2000344 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000525 - SURFACE
      ?auto_2000526 - SURFACE
      ?auto_2000527 - SURFACE
      ?auto_2000524 - SURFACE
      ?auto_2000528 - SURFACE
      ?auto_2000530 - SURFACE
      ?auto_2000529 - SURFACE
      ?auto_2000531 - SURFACE
      ?auto_2000532 - SURFACE
      ?auto_2000533 - SURFACE
      ?auto_2000534 - SURFACE
      ?auto_2000535 - SURFACE
      ?auto_2000536 - SURFACE
      ?auto_2000537 - SURFACE
      ?auto_2000538 - SURFACE
      ?auto_2000539 - SURFACE
    )
    :vars
    (
      ?auto_2000543 - HOIST
      ?auto_2000541 - PLACE
      ?auto_2000540 - TRUCK
      ?auto_2000542 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000543 ?auto_2000541 ) ( SURFACE-AT ?auto_2000538 ?auto_2000541 ) ( CLEAR ?auto_2000538 ) ( IS-CRATE ?auto_2000539 ) ( not ( = ?auto_2000538 ?auto_2000539 ) ) ( AVAILABLE ?auto_2000543 ) ( IN ?auto_2000539 ?auto_2000540 ) ( ON ?auto_2000538 ?auto_2000537 ) ( not ( = ?auto_2000537 ?auto_2000538 ) ) ( not ( = ?auto_2000537 ?auto_2000539 ) ) ( TRUCK-AT ?auto_2000540 ?auto_2000542 ) ( not ( = ?auto_2000542 ?auto_2000541 ) ) ( ON ?auto_2000526 ?auto_2000525 ) ( ON ?auto_2000527 ?auto_2000526 ) ( ON ?auto_2000524 ?auto_2000527 ) ( ON ?auto_2000528 ?auto_2000524 ) ( ON ?auto_2000530 ?auto_2000528 ) ( ON ?auto_2000529 ?auto_2000530 ) ( ON ?auto_2000531 ?auto_2000529 ) ( ON ?auto_2000532 ?auto_2000531 ) ( ON ?auto_2000533 ?auto_2000532 ) ( ON ?auto_2000534 ?auto_2000533 ) ( ON ?auto_2000535 ?auto_2000534 ) ( ON ?auto_2000536 ?auto_2000535 ) ( ON ?auto_2000537 ?auto_2000536 ) ( not ( = ?auto_2000525 ?auto_2000526 ) ) ( not ( = ?auto_2000525 ?auto_2000527 ) ) ( not ( = ?auto_2000525 ?auto_2000524 ) ) ( not ( = ?auto_2000525 ?auto_2000528 ) ) ( not ( = ?auto_2000525 ?auto_2000530 ) ) ( not ( = ?auto_2000525 ?auto_2000529 ) ) ( not ( = ?auto_2000525 ?auto_2000531 ) ) ( not ( = ?auto_2000525 ?auto_2000532 ) ) ( not ( = ?auto_2000525 ?auto_2000533 ) ) ( not ( = ?auto_2000525 ?auto_2000534 ) ) ( not ( = ?auto_2000525 ?auto_2000535 ) ) ( not ( = ?auto_2000525 ?auto_2000536 ) ) ( not ( = ?auto_2000525 ?auto_2000537 ) ) ( not ( = ?auto_2000525 ?auto_2000538 ) ) ( not ( = ?auto_2000525 ?auto_2000539 ) ) ( not ( = ?auto_2000526 ?auto_2000527 ) ) ( not ( = ?auto_2000526 ?auto_2000524 ) ) ( not ( = ?auto_2000526 ?auto_2000528 ) ) ( not ( = ?auto_2000526 ?auto_2000530 ) ) ( not ( = ?auto_2000526 ?auto_2000529 ) ) ( not ( = ?auto_2000526 ?auto_2000531 ) ) ( not ( = ?auto_2000526 ?auto_2000532 ) ) ( not ( = ?auto_2000526 ?auto_2000533 ) ) ( not ( = ?auto_2000526 ?auto_2000534 ) ) ( not ( = ?auto_2000526 ?auto_2000535 ) ) ( not ( = ?auto_2000526 ?auto_2000536 ) ) ( not ( = ?auto_2000526 ?auto_2000537 ) ) ( not ( = ?auto_2000526 ?auto_2000538 ) ) ( not ( = ?auto_2000526 ?auto_2000539 ) ) ( not ( = ?auto_2000527 ?auto_2000524 ) ) ( not ( = ?auto_2000527 ?auto_2000528 ) ) ( not ( = ?auto_2000527 ?auto_2000530 ) ) ( not ( = ?auto_2000527 ?auto_2000529 ) ) ( not ( = ?auto_2000527 ?auto_2000531 ) ) ( not ( = ?auto_2000527 ?auto_2000532 ) ) ( not ( = ?auto_2000527 ?auto_2000533 ) ) ( not ( = ?auto_2000527 ?auto_2000534 ) ) ( not ( = ?auto_2000527 ?auto_2000535 ) ) ( not ( = ?auto_2000527 ?auto_2000536 ) ) ( not ( = ?auto_2000527 ?auto_2000537 ) ) ( not ( = ?auto_2000527 ?auto_2000538 ) ) ( not ( = ?auto_2000527 ?auto_2000539 ) ) ( not ( = ?auto_2000524 ?auto_2000528 ) ) ( not ( = ?auto_2000524 ?auto_2000530 ) ) ( not ( = ?auto_2000524 ?auto_2000529 ) ) ( not ( = ?auto_2000524 ?auto_2000531 ) ) ( not ( = ?auto_2000524 ?auto_2000532 ) ) ( not ( = ?auto_2000524 ?auto_2000533 ) ) ( not ( = ?auto_2000524 ?auto_2000534 ) ) ( not ( = ?auto_2000524 ?auto_2000535 ) ) ( not ( = ?auto_2000524 ?auto_2000536 ) ) ( not ( = ?auto_2000524 ?auto_2000537 ) ) ( not ( = ?auto_2000524 ?auto_2000538 ) ) ( not ( = ?auto_2000524 ?auto_2000539 ) ) ( not ( = ?auto_2000528 ?auto_2000530 ) ) ( not ( = ?auto_2000528 ?auto_2000529 ) ) ( not ( = ?auto_2000528 ?auto_2000531 ) ) ( not ( = ?auto_2000528 ?auto_2000532 ) ) ( not ( = ?auto_2000528 ?auto_2000533 ) ) ( not ( = ?auto_2000528 ?auto_2000534 ) ) ( not ( = ?auto_2000528 ?auto_2000535 ) ) ( not ( = ?auto_2000528 ?auto_2000536 ) ) ( not ( = ?auto_2000528 ?auto_2000537 ) ) ( not ( = ?auto_2000528 ?auto_2000538 ) ) ( not ( = ?auto_2000528 ?auto_2000539 ) ) ( not ( = ?auto_2000530 ?auto_2000529 ) ) ( not ( = ?auto_2000530 ?auto_2000531 ) ) ( not ( = ?auto_2000530 ?auto_2000532 ) ) ( not ( = ?auto_2000530 ?auto_2000533 ) ) ( not ( = ?auto_2000530 ?auto_2000534 ) ) ( not ( = ?auto_2000530 ?auto_2000535 ) ) ( not ( = ?auto_2000530 ?auto_2000536 ) ) ( not ( = ?auto_2000530 ?auto_2000537 ) ) ( not ( = ?auto_2000530 ?auto_2000538 ) ) ( not ( = ?auto_2000530 ?auto_2000539 ) ) ( not ( = ?auto_2000529 ?auto_2000531 ) ) ( not ( = ?auto_2000529 ?auto_2000532 ) ) ( not ( = ?auto_2000529 ?auto_2000533 ) ) ( not ( = ?auto_2000529 ?auto_2000534 ) ) ( not ( = ?auto_2000529 ?auto_2000535 ) ) ( not ( = ?auto_2000529 ?auto_2000536 ) ) ( not ( = ?auto_2000529 ?auto_2000537 ) ) ( not ( = ?auto_2000529 ?auto_2000538 ) ) ( not ( = ?auto_2000529 ?auto_2000539 ) ) ( not ( = ?auto_2000531 ?auto_2000532 ) ) ( not ( = ?auto_2000531 ?auto_2000533 ) ) ( not ( = ?auto_2000531 ?auto_2000534 ) ) ( not ( = ?auto_2000531 ?auto_2000535 ) ) ( not ( = ?auto_2000531 ?auto_2000536 ) ) ( not ( = ?auto_2000531 ?auto_2000537 ) ) ( not ( = ?auto_2000531 ?auto_2000538 ) ) ( not ( = ?auto_2000531 ?auto_2000539 ) ) ( not ( = ?auto_2000532 ?auto_2000533 ) ) ( not ( = ?auto_2000532 ?auto_2000534 ) ) ( not ( = ?auto_2000532 ?auto_2000535 ) ) ( not ( = ?auto_2000532 ?auto_2000536 ) ) ( not ( = ?auto_2000532 ?auto_2000537 ) ) ( not ( = ?auto_2000532 ?auto_2000538 ) ) ( not ( = ?auto_2000532 ?auto_2000539 ) ) ( not ( = ?auto_2000533 ?auto_2000534 ) ) ( not ( = ?auto_2000533 ?auto_2000535 ) ) ( not ( = ?auto_2000533 ?auto_2000536 ) ) ( not ( = ?auto_2000533 ?auto_2000537 ) ) ( not ( = ?auto_2000533 ?auto_2000538 ) ) ( not ( = ?auto_2000533 ?auto_2000539 ) ) ( not ( = ?auto_2000534 ?auto_2000535 ) ) ( not ( = ?auto_2000534 ?auto_2000536 ) ) ( not ( = ?auto_2000534 ?auto_2000537 ) ) ( not ( = ?auto_2000534 ?auto_2000538 ) ) ( not ( = ?auto_2000534 ?auto_2000539 ) ) ( not ( = ?auto_2000535 ?auto_2000536 ) ) ( not ( = ?auto_2000535 ?auto_2000537 ) ) ( not ( = ?auto_2000535 ?auto_2000538 ) ) ( not ( = ?auto_2000535 ?auto_2000539 ) ) ( not ( = ?auto_2000536 ?auto_2000537 ) ) ( not ( = ?auto_2000536 ?auto_2000538 ) ) ( not ( = ?auto_2000536 ?auto_2000539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000537 ?auto_2000538 ?auto_2000539 )
      ( MAKE-15CRATE-VERIFY ?auto_2000525 ?auto_2000526 ?auto_2000527 ?auto_2000524 ?auto_2000528 ?auto_2000530 ?auto_2000529 ?auto_2000531 ?auto_2000532 ?auto_2000533 ?auto_2000534 ?auto_2000535 ?auto_2000536 ?auto_2000537 ?auto_2000538 ?auto_2000539 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000735 - SURFACE
      ?auto_2000736 - SURFACE
      ?auto_2000737 - SURFACE
      ?auto_2000734 - SURFACE
      ?auto_2000738 - SURFACE
      ?auto_2000740 - SURFACE
      ?auto_2000739 - SURFACE
      ?auto_2000741 - SURFACE
      ?auto_2000742 - SURFACE
      ?auto_2000743 - SURFACE
      ?auto_2000744 - SURFACE
      ?auto_2000745 - SURFACE
      ?auto_2000746 - SURFACE
      ?auto_2000747 - SURFACE
      ?auto_2000748 - SURFACE
      ?auto_2000749 - SURFACE
    )
    :vars
    (
      ?auto_2000750 - HOIST
      ?auto_2000752 - PLACE
      ?auto_2000751 - TRUCK
      ?auto_2000754 - PLACE
      ?auto_2000753 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000750 ?auto_2000752 ) ( SURFACE-AT ?auto_2000748 ?auto_2000752 ) ( CLEAR ?auto_2000748 ) ( IS-CRATE ?auto_2000749 ) ( not ( = ?auto_2000748 ?auto_2000749 ) ) ( AVAILABLE ?auto_2000750 ) ( ON ?auto_2000748 ?auto_2000747 ) ( not ( = ?auto_2000747 ?auto_2000748 ) ) ( not ( = ?auto_2000747 ?auto_2000749 ) ) ( TRUCK-AT ?auto_2000751 ?auto_2000754 ) ( not ( = ?auto_2000754 ?auto_2000752 ) ) ( HOIST-AT ?auto_2000753 ?auto_2000754 ) ( LIFTING ?auto_2000753 ?auto_2000749 ) ( not ( = ?auto_2000750 ?auto_2000753 ) ) ( ON ?auto_2000736 ?auto_2000735 ) ( ON ?auto_2000737 ?auto_2000736 ) ( ON ?auto_2000734 ?auto_2000737 ) ( ON ?auto_2000738 ?auto_2000734 ) ( ON ?auto_2000740 ?auto_2000738 ) ( ON ?auto_2000739 ?auto_2000740 ) ( ON ?auto_2000741 ?auto_2000739 ) ( ON ?auto_2000742 ?auto_2000741 ) ( ON ?auto_2000743 ?auto_2000742 ) ( ON ?auto_2000744 ?auto_2000743 ) ( ON ?auto_2000745 ?auto_2000744 ) ( ON ?auto_2000746 ?auto_2000745 ) ( ON ?auto_2000747 ?auto_2000746 ) ( not ( = ?auto_2000735 ?auto_2000736 ) ) ( not ( = ?auto_2000735 ?auto_2000737 ) ) ( not ( = ?auto_2000735 ?auto_2000734 ) ) ( not ( = ?auto_2000735 ?auto_2000738 ) ) ( not ( = ?auto_2000735 ?auto_2000740 ) ) ( not ( = ?auto_2000735 ?auto_2000739 ) ) ( not ( = ?auto_2000735 ?auto_2000741 ) ) ( not ( = ?auto_2000735 ?auto_2000742 ) ) ( not ( = ?auto_2000735 ?auto_2000743 ) ) ( not ( = ?auto_2000735 ?auto_2000744 ) ) ( not ( = ?auto_2000735 ?auto_2000745 ) ) ( not ( = ?auto_2000735 ?auto_2000746 ) ) ( not ( = ?auto_2000735 ?auto_2000747 ) ) ( not ( = ?auto_2000735 ?auto_2000748 ) ) ( not ( = ?auto_2000735 ?auto_2000749 ) ) ( not ( = ?auto_2000736 ?auto_2000737 ) ) ( not ( = ?auto_2000736 ?auto_2000734 ) ) ( not ( = ?auto_2000736 ?auto_2000738 ) ) ( not ( = ?auto_2000736 ?auto_2000740 ) ) ( not ( = ?auto_2000736 ?auto_2000739 ) ) ( not ( = ?auto_2000736 ?auto_2000741 ) ) ( not ( = ?auto_2000736 ?auto_2000742 ) ) ( not ( = ?auto_2000736 ?auto_2000743 ) ) ( not ( = ?auto_2000736 ?auto_2000744 ) ) ( not ( = ?auto_2000736 ?auto_2000745 ) ) ( not ( = ?auto_2000736 ?auto_2000746 ) ) ( not ( = ?auto_2000736 ?auto_2000747 ) ) ( not ( = ?auto_2000736 ?auto_2000748 ) ) ( not ( = ?auto_2000736 ?auto_2000749 ) ) ( not ( = ?auto_2000737 ?auto_2000734 ) ) ( not ( = ?auto_2000737 ?auto_2000738 ) ) ( not ( = ?auto_2000737 ?auto_2000740 ) ) ( not ( = ?auto_2000737 ?auto_2000739 ) ) ( not ( = ?auto_2000737 ?auto_2000741 ) ) ( not ( = ?auto_2000737 ?auto_2000742 ) ) ( not ( = ?auto_2000737 ?auto_2000743 ) ) ( not ( = ?auto_2000737 ?auto_2000744 ) ) ( not ( = ?auto_2000737 ?auto_2000745 ) ) ( not ( = ?auto_2000737 ?auto_2000746 ) ) ( not ( = ?auto_2000737 ?auto_2000747 ) ) ( not ( = ?auto_2000737 ?auto_2000748 ) ) ( not ( = ?auto_2000737 ?auto_2000749 ) ) ( not ( = ?auto_2000734 ?auto_2000738 ) ) ( not ( = ?auto_2000734 ?auto_2000740 ) ) ( not ( = ?auto_2000734 ?auto_2000739 ) ) ( not ( = ?auto_2000734 ?auto_2000741 ) ) ( not ( = ?auto_2000734 ?auto_2000742 ) ) ( not ( = ?auto_2000734 ?auto_2000743 ) ) ( not ( = ?auto_2000734 ?auto_2000744 ) ) ( not ( = ?auto_2000734 ?auto_2000745 ) ) ( not ( = ?auto_2000734 ?auto_2000746 ) ) ( not ( = ?auto_2000734 ?auto_2000747 ) ) ( not ( = ?auto_2000734 ?auto_2000748 ) ) ( not ( = ?auto_2000734 ?auto_2000749 ) ) ( not ( = ?auto_2000738 ?auto_2000740 ) ) ( not ( = ?auto_2000738 ?auto_2000739 ) ) ( not ( = ?auto_2000738 ?auto_2000741 ) ) ( not ( = ?auto_2000738 ?auto_2000742 ) ) ( not ( = ?auto_2000738 ?auto_2000743 ) ) ( not ( = ?auto_2000738 ?auto_2000744 ) ) ( not ( = ?auto_2000738 ?auto_2000745 ) ) ( not ( = ?auto_2000738 ?auto_2000746 ) ) ( not ( = ?auto_2000738 ?auto_2000747 ) ) ( not ( = ?auto_2000738 ?auto_2000748 ) ) ( not ( = ?auto_2000738 ?auto_2000749 ) ) ( not ( = ?auto_2000740 ?auto_2000739 ) ) ( not ( = ?auto_2000740 ?auto_2000741 ) ) ( not ( = ?auto_2000740 ?auto_2000742 ) ) ( not ( = ?auto_2000740 ?auto_2000743 ) ) ( not ( = ?auto_2000740 ?auto_2000744 ) ) ( not ( = ?auto_2000740 ?auto_2000745 ) ) ( not ( = ?auto_2000740 ?auto_2000746 ) ) ( not ( = ?auto_2000740 ?auto_2000747 ) ) ( not ( = ?auto_2000740 ?auto_2000748 ) ) ( not ( = ?auto_2000740 ?auto_2000749 ) ) ( not ( = ?auto_2000739 ?auto_2000741 ) ) ( not ( = ?auto_2000739 ?auto_2000742 ) ) ( not ( = ?auto_2000739 ?auto_2000743 ) ) ( not ( = ?auto_2000739 ?auto_2000744 ) ) ( not ( = ?auto_2000739 ?auto_2000745 ) ) ( not ( = ?auto_2000739 ?auto_2000746 ) ) ( not ( = ?auto_2000739 ?auto_2000747 ) ) ( not ( = ?auto_2000739 ?auto_2000748 ) ) ( not ( = ?auto_2000739 ?auto_2000749 ) ) ( not ( = ?auto_2000741 ?auto_2000742 ) ) ( not ( = ?auto_2000741 ?auto_2000743 ) ) ( not ( = ?auto_2000741 ?auto_2000744 ) ) ( not ( = ?auto_2000741 ?auto_2000745 ) ) ( not ( = ?auto_2000741 ?auto_2000746 ) ) ( not ( = ?auto_2000741 ?auto_2000747 ) ) ( not ( = ?auto_2000741 ?auto_2000748 ) ) ( not ( = ?auto_2000741 ?auto_2000749 ) ) ( not ( = ?auto_2000742 ?auto_2000743 ) ) ( not ( = ?auto_2000742 ?auto_2000744 ) ) ( not ( = ?auto_2000742 ?auto_2000745 ) ) ( not ( = ?auto_2000742 ?auto_2000746 ) ) ( not ( = ?auto_2000742 ?auto_2000747 ) ) ( not ( = ?auto_2000742 ?auto_2000748 ) ) ( not ( = ?auto_2000742 ?auto_2000749 ) ) ( not ( = ?auto_2000743 ?auto_2000744 ) ) ( not ( = ?auto_2000743 ?auto_2000745 ) ) ( not ( = ?auto_2000743 ?auto_2000746 ) ) ( not ( = ?auto_2000743 ?auto_2000747 ) ) ( not ( = ?auto_2000743 ?auto_2000748 ) ) ( not ( = ?auto_2000743 ?auto_2000749 ) ) ( not ( = ?auto_2000744 ?auto_2000745 ) ) ( not ( = ?auto_2000744 ?auto_2000746 ) ) ( not ( = ?auto_2000744 ?auto_2000747 ) ) ( not ( = ?auto_2000744 ?auto_2000748 ) ) ( not ( = ?auto_2000744 ?auto_2000749 ) ) ( not ( = ?auto_2000745 ?auto_2000746 ) ) ( not ( = ?auto_2000745 ?auto_2000747 ) ) ( not ( = ?auto_2000745 ?auto_2000748 ) ) ( not ( = ?auto_2000745 ?auto_2000749 ) ) ( not ( = ?auto_2000746 ?auto_2000747 ) ) ( not ( = ?auto_2000746 ?auto_2000748 ) ) ( not ( = ?auto_2000746 ?auto_2000749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000747 ?auto_2000748 ?auto_2000749 )
      ( MAKE-15CRATE-VERIFY ?auto_2000735 ?auto_2000736 ?auto_2000737 ?auto_2000734 ?auto_2000738 ?auto_2000740 ?auto_2000739 ?auto_2000741 ?auto_2000742 ?auto_2000743 ?auto_2000744 ?auto_2000745 ?auto_2000746 ?auto_2000747 ?auto_2000748 ?auto_2000749 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2000960 - SURFACE
      ?auto_2000961 - SURFACE
      ?auto_2000962 - SURFACE
      ?auto_2000959 - SURFACE
      ?auto_2000963 - SURFACE
      ?auto_2000965 - SURFACE
      ?auto_2000964 - SURFACE
      ?auto_2000966 - SURFACE
      ?auto_2000967 - SURFACE
      ?auto_2000968 - SURFACE
      ?auto_2000969 - SURFACE
      ?auto_2000970 - SURFACE
      ?auto_2000971 - SURFACE
      ?auto_2000972 - SURFACE
      ?auto_2000973 - SURFACE
      ?auto_2000974 - SURFACE
    )
    :vars
    (
      ?auto_2000980 - HOIST
      ?auto_2000979 - PLACE
      ?auto_2000977 - TRUCK
      ?auto_2000978 - PLACE
      ?auto_2000975 - HOIST
      ?auto_2000976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2000980 ?auto_2000979 ) ( SURFACE-AT ?auto_2000973 ?auto_2000979 ) ( CLEAR ?auto_2000973 ) ( IS-CRATE ?auto_2000974 ) ( not ( = ?auto_2000973 ?auto_2000974 ) ) ( AVAILABLE ?auto_2000980 ) ( ON ?auto_2000973 ?auto_2000972 ) ( not ( = ?auto_2000972 ?auto_2000973 ) ) ( not ( = ?auto_2000972 ?auto_2000974 ) ) ( TRUCK-AT ?auto_2000977 ?auto_2000978 ) ( not ( = ?auto_2000978 ?auto_2000979 ) ) ( HOIST-AT ?auto_2000975 ?auto_2000978 ) ( not ( = ?auto_2000980 ?auto_2000975 ) ) ( AVAILABLE ?auto_2000975 ) ( SURFACE-AT ?auto_2000974 ?auto_2000978 ) ( ON ?auto_2000974 ?auto_2000976 ) ( CLEAR ?auto_2000974 ) ( not ( = ?auto_2000973 ?auto_2000976 ) ) ( not ( = ?auto_2000974 ?auto_2000976 ) ) ( not ( = ?auto_2000972 ?auto_2000976 ) ) ( ON ?auto_2000961 ?auto_2000960 ) ( ON ?auto_2000962 ?auto_2000961 ) ( ON ?auto_2000959 ?auto_2000962 ) ( ON ?auto_2000963 ?auto_2000959 ) ( ON ?auto_2000965 ?auto_2000963 ) ( ON ?auto_2000964 ?auto_2000965 ) ( ON ?auto_2000966 ?auto_2000964 ) ( ON ?auto_2000967 ?auto_2000966 ) ( ON ?auto_2000968 ?auto_2000967 ) ( ON ?auto_2000969 ?auto_2000968 ) ( ON ?auto_2000970 ?auto_2000969 ) ( ON ?auto_2000971 ?auto_2000970 ) ( ON ?auto_2000972 ?auto_2000971 ) ( not ( = ?auto_2000960 ?auto_2000961 ) ) ( not ( = ?auto_2000960 ?auto_2000962 ) ) ( not ( = ?auto_2000960 ?auto_2000959 ) ) ( not ( = ?auto_2000960 ?auto_2000963 ) ) ( not ( = ?auto_2000960 ?auto_2000965 ) ) ( not ( = ?auto_2000960 ?auto_2000964 ) ) ( not ( = ?auto_2000960 ?auto_2000966 ) ) ( not ( = ?auto_2000960 ?auto_2000967 ) ) ( not ( = ?auto_2000960 ?auto_2000968 ) ) ( not ( = ?auto_2000960 ?auto_2000969 ) ) ( not ( = ?auto_2000960 ?auto_2000970 ) ) ( not ( = ?auto_2000960 ?auto_2000971 ) ) ( not ( = ?auto_2000960 ?auto_2000972 ) ) ( not ( = ?auto_2000960 ?auto_2000973 ) ) ( not ( = ?auto_2000960 ?auto_2000974 ) ) ( not ( = ?auto_2000960 ?auto_2000976 ) ) ( not ( = ?auto_2000961 ?auto_2000962 ) ) ( not ( = ?auto_2000961 ?auto_2000959 ) ) ( not ( = ?auto_2000961 ?auto_2000963 ) ) ( not ( = ?auto_2000961 ?auto_2000965 ) ) ( not ( = ?auto_2000961 ?auto_2000964 ) ) ( not ( = ?auto_2000961 ?auto_2000966 ) ) ( not ( = ?auto_2000961 ?auto_2000967 ) ) ( not ( = ?auto_2000961 ?auto_2000968 ) ) ( not ( = ?auto_2000961 ?auto_2000969 ) ) ( not ( = ?auto_2000961 ?auto_2000970 ) ) ( not ( = ?auto_2000961 ?auto_2000971 ) ) ( not ( = ?auto_2000961 ?auto_2000972 ) ) ( not ( = ?auto_2000961 ?auto_2000973 ) ) ( not ( = ?auto_2000961 ?auto_2000974 ) ) ( not ( = ?auto_2000961 ?auto_2000976 ) ) ( not ( = ?auto_2000962 ?auto_2000959 ) ) ( not ( = ?auto_2000962 ?auto_2000963 ) ) ( not ( = ?auto_2000962 ?auto_2000965 ) ) ( not ( = ?auto_2000962 ?auto_2000964 ) ) ( not ( = ?auto_2000962 ?auto_2000966 ) ) ( not ( = ?auto_2000962 ?auto_2000967 ) ) ( not ( = ?auto_2000962 ?auto_2000968 ) ) ( not ( = ?auto_2000962 ?auto_2000969 ) ) ( not ( = ?auto_2000962 ?auto_2000970 ) ) ( not ( = ?auto_2000962 ?auto_2000971 ) ) ( not ( = ?auto_2000962 ?auto_2000972 ) ) ( not ( = ?auto_2000962 ?auto_2000973 ) ) ( not ( = ?auto_2000962 ?auto_2000974 ) ) ( not ( = ?auto_2000962 ?auto_2000976 ) ) ( not ( = ?auto_2000959 ?auto_2000963 ) ) ( not ( = ?auto_2000959 ?auto_2000965 ) ) ( not ( = ?auto_2000959 ?auto_2000964 ) ) ( not ( = ?auto_2000959 ?auto_2000966 ) ) ( not ( = ?auto_2000959 ?auto_2000967 ) ) ( not ( = ?auto_2000959 ?auto_2000968 ) ) ( not ( = ?auto_2000959 ?auto_2000969 ) ) ( not ( = ?auto_2000959 ?auto_2000970 ) ) ( not ( = ?auto_2000959 ?auto_2000971 ) ) ( not ( = ?auto_2000959 ?auto_2000972 ) ) ( not ( = ?auto_2000959 ?auto_2000973 ) ) ( not ( = ?auto_2000959 ?auto_2000974 ) ) ( not ( = ?auto_2000959 ?auto_2000976 ) ) ( not ( = ?auto_2000963 ?auto_2000965 ) ) ( not ( = ?auto_2000963 ?auto_2000964 ) ) ( not ( = ?auto_2000963 ?auto_2000966 ) ) ( not ( = ?auto_2000963 ?auto_2000967 ) ) ( not ( = ?auto_2000963 ?auto_2000968 ) ) ( not ( = ?auto_2000963 ?auto_2000969 ) ) ( not ( = ?auto_2000963 ?auto_2000970 ) ) ( not ( = ?auto_2000963 ?auto_2000971 ) ) ( not ( = ?auto_2000963 ?auto_2000972 ) ) ( not ( = ?auto_2000963 ?auto_2000973 ) ) ( not ( = ?auto_2000963 ?auto_2000974 ) ) ( not ( = ?auto_2000963 ?auto_2000976 ) ) ( not ( = ?auto_2000965 ?auto_2000964 ) ) ( not ( = ?auto_2000965 ?auto_2000966 ) ) ( not ( = ?auto_2000965 ?auto_2000967 ) ) ( not ( = ?auto_2000965 ?auto_2000968 ) ) ( not ( = ?auto_2000965 ?auto_2000969 ) ) ( not ( = ?auto_2000965 ?auto_2000970 ) ) ( not ( = ?auto_2000965 ?auto_2000971 ) ) ( not ( = ?auto_2000965 ?auto_2000972 ) ) ( not ( = ?auto_2000965 ?auto_2000973 ) ) ( not ( = ?auto_2000965 ?auto_2000974 ) ) ( not ( = ?auto_2000965 ?auto_2000976 ) ) ( not ( = ?auto_2000964 ?auto_2000966 ) ) ( not ( = ?auto_2000964 ?auto_2000967 ) ) ( not ( = ?auto_2000964 ?auto_2000968 ) ) ( not ( = ?auto_2000964 ?auto_2000969 ) ) ( not ( = ?auto_2000964 ?auto_2000970 ) ) ( not ( = ?auto_2000964 ?auto_2000971 ) ) ( not ( = ?auto_2000964 ?auto_2000972 ) ) ( not ( = ?auto_2000964 ?auto_2000973 ) ) ( not ( = ?auto_2000964 ?auto_2000974 ) ) ( not ( = ?auto_2000964 ?auto_2000976 ) ) ( not ( = ?auto_2000966 ?auto_2000967 ) ) ( not ( = ?auto_2000966 ?auto_2000968 ) ) ( not ( = ?auto_2000966 ?auto_2000969 ) ) ( not ( = ?auto_2000966 ?auto_2000970 ) ) ( not ( = ?auto_2000966 ?auto_2000971 ) ) ( not ( = ?auto_2000966 ?auto_2000972 ) ) ( not ( = ?auto_2000966 ?auto_2000973 ) ) ( not ( = ?auto_2000966 ?auto_2000974 ) ) ( not ( = ?auto_2000966 ?auto_2000976 ) ) ( not ( = ?auto_2000967 ?auto_2000968 ) ) ( not ( = ?auto_2000967 ?auto_2000969 ) ) ( not ( = ?auto_2000967 ?auto_2000970 ) ) ( not ( = ?auto_2000967 ?auto_2000971 ) ) ( not ( = ?auto_2000967 ?auto_2000972 ) ) ( not ( = ?auto_2000967 ?auto_2000973 ) ) ( not ( = ?auto_2000967 ?auto_2000974 ) ) ( not ( = ?auto_2000967 ?auto_2000976 ) ) ( not ( = ?auto_2000968 ?auto_2000969 ) ) ( not ( = ?auto_2000968 ?auto_2000970 ) ) ( not ( = ?auto_2000968 ?auto_2000971 ) ) ( not ( = ?auto_2000968 ?auto_2000972 ) ) ( not ( = ?auto_2000968 ?auto_2000973 ) ) ( not ( = ?auto_2000968 ?auto_2000974 ) ) ( not ( = ?auto_2000968 ?auto_2000976 ) ) ( not ( = ?auto_2000969 ?auto_2000970 ) ) ( not ( = ?auto_2000969 ?auto_2000971 ) ) ( not ( = ?auto_2000969 ?auto_2000972 ) ) ( not ( = ?auto_2000969 ?auto_2000973 ) ) ( not ( = ?auto_2000969 ?auto_2000974 ) ) ( not ( = ?auto_2000969 ?auto_2000976 ) ) ( not ( = ?auto_2000970 ?auto_2000971 ) ) ( not ( = ?auto_2000970 ?auto_2000972 ) ) ( not ( = ?auto_2000970 ?auto_2000973 ) ) ( not ( = ?auto_2000970 ?auto_2000974 ) ) ( not ( = ?auto_2000970 ?auto_2000976 ) ) ( not ( = ?auto_2000971 ?auto_2000972 ) ) ( not ( = ?auto_2000971 ?auto_2000973 ) ) ( not ( = ?auto_2000971 ?auto_2000974 ) ) ( not ( = ?auto_2000971 ?auto_2000976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2000972 ?auto_2000973 ?auto_2000974 )
      ( MAKE-15CRATE-VERIFY ?auto_2000960 ?auto_2000961 ?auto_2000962 ?auto_2000959 ?auto_2000963 ?auto_2000965 ?auto_2000964 ?auto_2000966 ?auto_2000967 ?auto_2000968 ?auto_2000969 ?auto_2000970 ?auto_2000971 ?auto_2000972 ?auto_2000973 ?auto_2000974 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001186 - SURFACE
      ?auto_2001187 - SURFACE
      ?auto_2001188 - SURFACE
      ?auto_2001185 - SURFACE
      ?auto_2001189 - SURFACE
      ?auto_2001191 - SURFACE
      ?auto_2001190 - SURFACE
      ?auto_2001192 - SURFACE
      ?auto_2001193 - SURFACE
      ?auto_2001194 - SURFACE
      ?auto_2001195 - SURFACE
      ?auto_2001196 - SURFACE
      ?auto_2001197 - SURFACE
      ?auto_2001198 - SURFACE
      ?auto_2001199 - SURFACE
      ?auto_2001200 - SURFACE
    )
    :vars
    (
      ?auto_2001204 - HOIST
      ?auto_2001203 - PLACE
      ?auto_2001205 - PLACE
      ?auto_2001202 - HOIST
      ?auto_2001201 - SURFACE
      ?auto_2001206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001204 ?auto_2001203 ) ( SURFACE-AT ?auto_2001199 ?auto_2001203 ) ( CLEAR ?auto_2001199 ) ( IS-CRATE ?auto_2001200 ) ( not ( = ?auto_2001199 ?auto_2001200 ) ) ( AVAILABLE ?auto_2001204 ) ( ON ?auto_2001199 ?auto_2001198 ) ( not ( = ?auto_2001198 ?auto_2001199 ) ) ( not ( = ?auto_2001198 ?auto_2001200 ) ) ( not ( = ?auto_2001205 ?auto_2001203 ) ) ( HOIST-AT ?auto_2001202 ?auto_2001205 ) ( not ( = ?auto_2001204 ?auto_2001202 ) ) ( AVAILABLE ?auto_2001202 ) ( SURFACE-AT ?auto_2001200 ?auto_2001205 ) ( ON ?auto_2001200 ?auto_2001201 ) ( CLEAR ?auto_2001200 ) ( not ( = ?auto_2001199 ?auto_2001201 ) ) ( not ( = ?auto_2001200 ?auto_2001201 ) ) ( not ( = ?auto_2001198 ?auto_2001201 ) ) ( TRUCK-AT ?auto_2001206 ?auto_2001203 ) ( ON ?auto_2001187 ?auto_2001186 ) ( ON ?auto_2001188 ?auto_2001187 ) ( ON ?auto_2001185 ?auto_2001188 ) ( ON ?auto_2001189 ?auto_2001185 ) ( ON ?auto_2001191 ?auto_2001189 ) ( ON ?auto_2001190 ?auto_2001191 ) ( ON ?auto_2001192 ?auto_2001190 ) ( ON ?auto_2001193 ?auto_2001192 ) ( ON ?auto_2001194 ?auto_2001193 ) ( ON ?auto_2001195 ?auto_2001194 ) ( ON ?auto_2001196 ?auto_2001195 ) ( ON ?auto_2001197 ?auto_2001196 ) ( ON ?auto_2001198 ?auto_2001197 ) ( not ( = ?auto_2001186 ?auto_2001187 ) ) ( not ( = ?auto_2001186 ?auto_2001188 ) ) ( not ( = ?auto_2001186 ?auto_2001185 ) ) ( not ( = ?auto_2001186 ?auto_2001189 ) ) ( not ( = ?auto_2001186 ?auto_2001191 ) ) ( not ( = ?auto_2001186 ?auto_2001190 ) ) ( not ( = ?auto_2001186 ?auto_2001192 ) ) ( not ( = ?auto_2001186 ?auto_2001193 ) ) ( not ( = ?auto_2001186 ?auto_2001194 ) ) ( not ( = ?auto_2001186 ?auto_2001195 ) ) ( not ( = ?auto_2001186 ?auto_2001196 ) ) ( not ( = ?auto_2001186 ?auto_2001197 ) ) ( not ( = ?auto_2001186 ?auto_2001198 ) ) ( not ( = ?auto_2001186 ?auto_2001199 ) ) ( not ( = ?auto_2001186 ?auto_2001200 ) ) ( not ( = ?auto_2001186 ?auto_2001201 ) ) ( not ( = ?auto_2001187 ?auto_2001188 ) ) ( not ( = ?auto_2001187 ?auto_2001185 ) ) ( not ( = ?auto_2001187 ?auto_2001189 ) ) ( not ( = ?auto_2001187 ?auto_2001191 ) ) ( not ( = ?auto_2001187 ?auto_2001190 ) ) ( not ( = ?auto_2001187 ?auto_2001192 ) ) ( not ( = ?auto_2001187 ?auto_2001193 ) ) ( not ( = ?auto_2001187 ?auto_2001194 ) ) ( not ( = ?auto_2001187 ?auto_2001195 ) ) ( not ( = ?auto_2001187 ?auto_2001196 ) ) ( not ( = ?auto_2001187 ?auto_2001197 ) ) ( not ( = ?auto_2001187 ?auto_2001198 ) ) ( not ( = ?auto_2001187 ?auto_2001199 ) ) ( not ( = ?auto_2001187 ?auto_2001200 ) ) ( not ( = ?auto_2001187 ?auto_2001201 ) ) ( not ( = ?auto_2001188 ?auto_2001185 ) ) ( not ( = ?auto_2001188 ?auto_2001189 ) ) ( not ( = ?auto_2001188 ?auto_2001191 ) ) ( not ( = ?auto_2001188 ?auto_2001190 ) ) ( not ( = ?auto_2001188 ?auto_2001192 ) ) ( not ( = ?auto_2001188 ?auto_2001193 ) ) ( not ( = ?auto_2001188 ?auto_2001194 ) ) ( not ( = ?auto_2001188 ?auto_2001195 ) ) ( not ( = ?auto_2001188 ?auto_2001196 ) ) ( not ( = ?auto_2001188 ?auto_2001197 ) ) ( not ( = ?auto_2001188 ?auto_2001198 ) ) ( not ( = ?auto_2001188 ?auto_2001199 ) ) ( not ( = ?auto_2001188 ?auto_2001200 ) ) ( not ( = ?auto_2001188 ?auto_2001201 ) ) ( not ( = ?auto_2001185 ?auto_2001189 ) ) ( not ( = ?auto_2001185 ?auto_2001191 ) ) ( not ( = ?auto_2001185 ?auto_2001190 ) ) ( not ( = ?auto_2001185 ?auto_2001192 ) ) ( not ( = ?auto_2001185 ?auto_2001193 ) ) ( not ( = ?auto_2001185 ?auto_2001194 ) ) ( not ( = ?auto_2001185 ?auto_2001195 ) ) ( not ( = ?auto_2001185 ?auto_2001196 ) ) ( not ( = ?auto_2001185 ?auto_2001197 ) ) ( not ( = ?auto_2001185 ?auto_2001198 ) ) ( not ( = ?auto_2001185 ?auto_2001199 ) ) ( not ( = ?auto_2001185 ?auto_2001200 ) ) ( not ( = ?auto_2001185 ?auto_2001201 ) ) ( not ( = ?auto_2001189 ?auto_2001191 ) ) ( not ( = ?auto_2001189 ?auto_2001190 ) ) ( not ( = ?auto_2001189 ?auto_2001192 ) ) ( not ( = ?auto_2001189 ?auto_2001193 ) ) ( not ( = ?auto_2001189 ?auto_2001194 ) ) ( not ( = ?auto_2001189 ?auto_2001195 ) ) ( not ( = ?auto_2001189 ?auto_2001196 ) ) ( not ( = ?auto_2001189 ?auto_2001197 ) ) ( not ( = ?auto_2001189 ?auto_2001198 ) ) ( not ( = ?auto_2001189 ?auto_2001199 ) ) ( not ( = ?auto_2001189 ?auto_2001200 ) ) ( not ( = ?auto_2001189 ?auto_2001201 ) ) ( not ( = ?auto_2001191 ?auto_2001190 ) ) ( not ( = ?auto_2001191 ?auto_2001192 ) ) ( not ( = ?auto_2001191 ?auto_2001193 ) ) ( not ( = ?auto_2001191 ?auto_2001194 ) ) ( not ( = ?auto_2001191 ?auto_2001195 ) ) ( not ( = ?auto_2001191 ?auto_2001196 ) ) ( not ( = ?auto_2001191 ?auto_2001197 ) ) ( not ( = ?auto_2001191 ?auto_2001198 ) ) ( not ( = ?auto_2001191 ?auto_2001199 ) ) ( not ( = ?auto_2001191 ?auto_2001200 ) ) ( not ( = ?auto_2001191 ?auto_2001201 ) ) ( not ( = ?auto_2001190 ?auto_2001192 ) ) ( not ( = ?auto_2001190 ?auto_2001193 ) ) ( not ( = ?auto_2001190 ?auto_2001194 ) ) ( not ( = ?auto_2001190 ?auto_2001195 ) ) ( not ( = ?auto_2001190 ?auto_2001196 ) ) ( not ( = ?auto_2001190 ?auto_2001197 ) ) ( not ( = ?auto_2001190 ?auto_2001198 ) ) ( not ( = ?auto_2001190 ?auto_2001199 ) ) ( not ( = ?auto_2001190 ?auto_2001200 ) ) ( not ( = ?auto_2001190 ?auto_2001201 ) ) ( not ( = ?auto_2001192 ?auto_2001193 ) ) ( not ( = ?auto_2001192 ?auto_2001194 ) ) ( not ( = ?auto_2001192 ?auto_2001195 ) ) ( not ( = ?auto_2001192 ?auto_2001196 ) ) ( not ( = ?auto_2001192 ?auto_2001197 ) ) ( not ( = ?auto_2001192 ?auto_2001198 ) ) ( not ( = ?auto_2001192 ?auto_2001199 ) ) ( not ( = ?auto_2001192 ?auto_2001200 ) ) ( not ( = ?auto_2001192 ?auto_2001201 ) ) ( not ( = ?auto_2001193 ?auto_2001194 ) ) ( not ( = ?auto_2001193 ?auto_2001195 ) ) ( not ( = ?auto_2001193 ?auto_2001196 ) ) ( not ( = ?auto_2001193 ?auto_2001197 ) ) ( not ( = ?auto_2001193 ?auto_2001198 ) ) ( not ( = ?auto_2001193 ?auto_2001199 ) ) ( not ( = ?auto_2001193 ?auto_2001200 ) ) ( not ( = ?auto_2001193 ?auto_2001201 ) ) ( not ( = ?auto_2001194 ?auto_2001195 ) ) ( not ( = ?auto_2001194 ?auto_2001196 ) ) ( not ( = ?auto_2001194 ?auto_2001197 ) ) ( not ( = ?auto_2001194 ?auto_2001198 ) ) ( not ( = ?auto_2001194 ?auto_2001199 ) ) ( not ( = ?auto_2001194 ?auto_2001200 ) ) ( not ( = ?auto_2001194 ?auto_2001201 ) ) ( not ( = ?auto_2001195 ?auto_2001196 ) ) ( not ( = ?auto_2001195 ?auto_2001197 ) ) ( not ( = ?auto_2001195 ?auto_2001198 ) ) ( not ( = ?auto_2001195 ?auto_2001199 ) ) ( not ( = ?auto_2001195 ?auto_2001200 ) ) ( not ( = ?auto_2001195 ?auto_2001201 ) ) ( not ( = ?auto_2001196 ?auto_2001197 ) ) ( not ( = ?auto_2001196 ?auto_2001198 ) ) ( not ( = ?auto_2001196 ?auto_2001199 ) ) ( not ( = ?auto_2001196 ?auto_2001200 ) ) ( not ( = ?auto_2001196 ?auto_2001201 ) ) ( not ( = ?auto_2001197 ?auto_2001198 ) ) ( not ( = ?auto_2001197 ?auto_2001199 ) ) ( not ( = ?auto_2001197 ?auto_2001200 ) ) ( not ( = ?auto_2001197 ?auto_2001201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001198 ?auto_2001199 ?auto_2001200 )
      ( MAKE-15CRATE-VERIFY ?auto_2001186 ?auto_2001187 ?auto_2001188 ?auto_2001185 ?auto_2001189 ?auto_2001191 ?auto_2001190 ?auto_2001192 ?auto_2001193 ?auto_2001194 ?auto_2001195 ?auto_2001196 ?auto_2001197 ?auto_2001198 ?auto_2001199 ?auto_2001200 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001412 - SURFACE
      ?auto_2001413 - SURFACE
      ?auto_2001414 - SURFACE
      ?auto_2001411 - SURFACE
      ?auto_2001415 - SURFACE
      ?auto_2001417 - SURFACE
      ?auto_2001416 - SURFACE
      ?auto_2001418 - SURFACE
      ?auto_2001419 - SURFACE
      ?auto_2001420 - SURFACE
      ?auto_2001421 - SURFACE
      ?auto_2001422 - SURFACE
      ?auto_2001423 - SURFACE
      ?auto_2001424 - SURFACE
      ?auto_2001425 - SURFACE
      ?auto_2001426 - SURFACE
    )
    :vars
    (
      ?auto_2001430 - HOIST
      ?auto_2001431 - PLACE
      ?auto_2001428 - PLACE
      ?auto_2001429 - HOIST
      ?auto_2001432 - SURFACE
      ?auto_2001427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001430 ?auto_2001431 ) ( IS-CRATE ?auto_2001426 ) ( not ( = ?auto_2001425 ?auto_2001426 ) ) ( not ( = ?auto_2001424 ?auto_2001425 ) ) ( not ( = ?auto_2001424 ?auto_2001426 ) ) ( not ( = ?auto_2001428 ?auto_2001431 ) ) ( HOIST-AT ?auto_2001429 ?auto_2001428 ) ( not ( = ?auto_2001430 ?auto_2001429 ) ) ( AVAILABLE ?auto_2001429 ) ( SURFACE-AT ?auto_2001426 ?auto_2001428 ) ( ON ?auto_2001426 ?auto_2001432 ) ( CLEAR ?auto_2001426 ) ( not ( = ?auto_2001425 ?auto_2001432 ) ) ( not ( = ?auto_2001426 ?auto_2001432 ) ) ( not ( = ?auto_2001424 ?auto_2001432 ) ) ( TRUCK-AT ?auto_2001427 ?auto_2001431 ) ( SURFACE-AT ?auto_2001424 ?auto_2001431 ) ( CLEAR ?auto_2001424 ) ( LIFTING ?auto_2001430 ?auto_2001425 ) ( IS-CRATE ?auto_2001425 ) ( ON ?auto_2001413 ?auto_2001412 ) ( ON ?auto_2001414 ?auto_2001413 ) ( ON ?auto_2001411 ?auto_2001414 ) ( ON ?auto_2001415 ?auto_2001411 ) ( ON ?auto_2001417 ?auto_2001415 ) ( ON ?auto_2001416 ?auto_2001417 ) ( ON ?auto_2001418 ?auto_2001416 ) ( ON ?auto_2001419 ?auto_2001418 ) ( ON ?auto_2001420 ?auto_2001419 ) ( ON ?auto_2001421 ?auto_2001420 ) ( ON ?auto_2001422 ?auto_2001421 ) ( ON ?auto_2001423 ?auto_2001422 ) ( ON ?auto_2001424 ?auto_2001423 ) ( not ( = ?auto_2001412 ?auto_2001413 ) ) ( not ( = ?auto_2001412 ?auto_2001414 ) ) ( not ( = ?auto_2001412 ?auto_2001411 ) ) ( not ( = ?auto_2001412 ?auto_2001415 ) ) ( not ( = ?auto_2001412 ?auto_2001417 ) ) ( not ( = ?auto_2001412 ?auto_2001416 ) ) ( not ( = ?auto_2001412 ?auto_2001418 ) ) ( not ( = ?auto_2001412 ?auto_2001419 ) ) ( not ( = ?auto_2001412 ?auto_2001420 ) ) ( not ( = ?auto_2001412 ?auto_2001421 ) ) ( not ( = ?auto_2001412 ?auto_2001422 ) ) ( not ( = ?auto_2001412 ?auto_2001423 ) ) ( not ( = ?auto_2001412 ?auto_2001424 ) ) ( not ( = ?auto_2001412 ?auto_2001425 ) ) ( not ( = ?auto_2001412 ?auto_2001426 ) ) ( not ( = ?auto_2001412 ?auto_2001432 ) ) ( not ( = ?auto_2001413 ?auto_2001414 ) ) ( not ( = ?auto_2001413 ?auto_2001411 ) ) ( not ( = ?auto_2001413 ?auto_2001415 ) ) ( not ( = ?auto_2001413 ?auto_2001417 ) ) ( not ( = ?auto_2001413 ?auto_2001416 ) ) ( not ( = ?auto_2001413 ?auto_2001418 ) ) ( not ( = ?auto_2001413 ?auto_2001419 ) ) ( not ( = ?auto_2001413 ?auto_2001420 ) ) ( not ( = ?auto_2001413 ?auto_2001421 ) ) ( not ( = ?auto_2001413 ?auto_2001422 ) ) ( not ( = ?auto_2001413 ?auto_2001423 ) ) ( not ( = ?auto_2001413 ?auto_2001424 ) ) ( not ( = ?auto_2001413 ?auto_2001425 ) ) ( not ( = ?auto_2001413 ?auto_2001426 ) ) ( not ( = ?auto_2001413 ?auto_2001432 ) ) ( not ( = ?auto_2001414 ?auto_2001411 ) ) ( not ( = ?auto_2001414 ?auto_2001415 ) ) ( not ( = ?auto_2001414 ?auto_2001417 ) ) ( not ( = ?auto_2001414 ?auto_2001416 ) ) ( not ( = ?auto_2001414 ?auto_2001418 ) ) ( not ( = ?auto_2001414 ?auto_2001419 ) ) ( not ( = ?auto_2001414 ?auto_2001420 ) ) ( not ( = ?auto_2001414 ?auto_2001421 ) ) ( not ( = ?auto_2001414 ?auto_2001422 ) ) ( not ( = ?auto_2001414 ?auto_2001423 ) ) ( not ( = ?auto_2001414 ?auto_2001424 ) ) ( not ( = ?auto_2001414 ?auto_2001425 ) ) ( not ( = ?auto_2001414 ?auto_2001426 ) ) ( not ( = ?auto_2001414 ?auto_2001432 ) ) ( not ( = ?auto_2001411 ?auto_2001415 ) ) ( not ( = ?auto_2001411 ?auto_2001417 ) ) ( not ( = ?auto_2001411 ?auto_2001416 ) ) ( not ( = ?auto_2001411 ?auto_2001418 ) ) ( not ( = ?auto_2001411 ?auto_2001419 ) ) ( not ( = ?auto_2001411 ?auto_2001420 ) ) ( not ( = ?auto_2001411 ?auto_2001421 ) ) ( not ( = ?auto_2001411 ?auto_2001422 ) ) ( not ( = ?auto_2001411 ?auto_2001423 ) ) ( not ( = ?auto_2001411 ?auto_2001424 ) ) ( not ( = ?auto_2001411 ?auto_2001425 ) ) ( not ( = ?auto_2001411 ?auto_2001426 ) ) ( not ( = ?auto_2001411 ?auto_2001432 ) ) ( not ( = ?auto_2001415 ?auto_2001417 ) ) ( not ( = ?auto_2001415 ?auto_2001416 ) ) ( not ( = ?auto_2001415 ?auto_2001418 ) ) ( not ( = ?auto_2001415 ?auto_2001419 ) ) ( not ( = ?auto_2001415 ?auto_2001420 ) ) ( not ( = ?auto_2001415 ?auto_2001421 ) ) ( not ( = ?auto_2001415 ?auto_2001422 ) ) ( not ( = ?auto_2001415 ?auto_2001423 ) ) ( not ( = ?auto_2001415 ?auto_2001424 ) ) ( not ( = ?auto_2001415 ?auto_2001425 ) ) ( not ( = ?auto_2001415 ?auto_2001426 ) ) ( not ( = ?auto_2001415 ?auto_2001432 ) ) ( not ( = ?auto_2001417 ?auto_2001416 ) ) ( not ( = ?auto_2001417 ?auto_2001418 ) ) ( not ( = ?auto_2001417 ?auto_2001419 ) ) ( not ( = ?auto_2001417 ?auto_2001420 ) ) ( not ( = ?auto_2001417 ?auto_2001421 ) ) ( not ( = ?auto_2001417 ?auto_2001422 ) ) ( not ( = ?auto_2001417 ?auto_2001423 ) ) ( not ( = ?auto_2001417 ?auto_2001424 ) ) ( not ( = ?auto_2001417 ?auto_2001425 ) ) ( not ( = ?auto_2001417 ?auto_2001426 ) ) ( not ( = ?auto_2001417 ?auto_2001432 ) ) ( not ( = ?auto_2001416 ?auto_2001418 ) ) ( not ( = ?auto_2001416 ?auto_2001419 ) ) ( not ( = ?auto_2001416 ?auto_2001420 ) ) ( not ( = ?auto_2001416 ?auto_2001421 ) ) ( not ( = ?auto_2001416 ?auto_2001422 ) ) ( not ( = ?auto_2001416 ?auto_2001423 ) ) ( not ( = ?auto_2001416 ?auto_2001424 ) ) ( not ( = ?auto_2001416 ?auto_2001425 ) ) ( not ( = ?auto_2001416 ?auto_2001426 ) ) ( not ( = ?auto_2001416 ?auto_2001432 ) ) ( not ( = ?auto_2001418 ?auto_2001419 ) ) ( not ( = ?auto_2001418 ?auto_2001420 ) ) ( not ( = ?auto_2001418 ?auto_2001421 ) ) ( not ( = ?auto_2001418 ?auto_2001422 ) ) ( not ( = ?auto_2001418 ?auto_2001423 ) ) ( not ( = ?auto_2001418 ?auto_2001424 ) ) ( not ( = ?auto_2001418 ?auto_2001425 ) ) ( not ( = ?auto_2001418 ?auto_2001426 ) ) ( not ( = ?auto_2001418 ?auto_2001432 ) ) ( not ( = ?auto_2001419 ?auto_2001420 ) ) ( not ( = ?auto_2001419 ?auto_2001421 ) ) ( not ( = ?auto_2001419 ?auto_2001422 ) ) ( not ( = ?auto_2001419 ?auto_2001423 ) ) ( not ( = ?auto_2001419 ?auto_2001424 ) ) ( not ( = ?auto_2001419 ?auto_2001425 ) ) ( not ( = ?auto_2001419 ?auto_2001426 ) ) ( not ( = ?auto_2001419 ?auto_2001432 ) ) ( not ( = ?auto_2001420 ?auto_2001421 ) ) ( not ( = ?auto_2001420 ?auto_2001422 ) ) ( not ( = ?auto_2001420 ?auto_2001423 ) ) ( not ( = ?auto_2001420 ?auto_2001424 ) ) ( not ( = ?auto_2001420 ?auto_2001425 ) ) ( not ( = ?auto_2001420 ?auto_2001426 ) ) ( not ( = ?auto_2001420 ?auto_2001432 ) ) ( not ( = ?auto_2001421 ?auto_2001422 ) ) ( not ( = ?auto_2001421 ?auto_2001423 ) ) ( not ( = ?auto_2001421 ?auto_2001424 ) ) ( not ( = ?auto_2001421 ?auto_2001425 ) ) ( not ( = ?auto_2001421 ?auto_2001426 ) ) ( not ( = ?auto_2001421 ?auto_2001432 ) ) ( not ( = ?auto_2001422 ?auto_2001423 ) ) ( not ( = ?auto_2001422 ?auto_2001424 ) ) ( not ( = ?auto_2001422 ?auto_2001425 ) ) ( not ( = ?auto_2001422 ?auto_2001426 ) ) ( not ( = ?auto_2001422 ?auto_2001432 ) ) ( not ( = ?auto_2001423 ?auto_2001424 ) ) ( not ( = ?auto_2001423 ?auto_2001425 ) ) ( not ( = ?auto_2001423 ?auto_2001426 ) ) ( not ( = ?auto_2001423 ?auto_2001432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001424 ?auto_2001425 ?auto_2001426 )
      ( MAKE-15CRATE-VERIFY ?auto_2001412 ?auto_2001413 ?auto_2001414 ?auto_2001411 ?auto_2001415 ?auto_2001417 ?auto_2001416 ?auto_2001418 ?auto_2001419 ?auto_2001420 ?auto_2001421 ?auto_2001422 ?auto_2001423 ?auto_2001424 ?auto_2001425 ?auto_2001426 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2001638 - SURFACE
      ?auto_2001639 - SURFACE
      ?auto_2001640 - SURFACE
      ?auto_2001637 - SURFACE
      ?auto_2001641 - SURFACE
      ?auto_2001643 - SURFACE
      ?auto_2001642 - SURFACE
      ?auto_2001644 - SURFACE
      ?auto_2001645 - SURFACE
      ?auto_2001646 - SURFACE
      ?auto_2001647 - SURFACE
      ?auto_2001648 - SURFACE
      ?auto_2001649 - SURFACE
      ?auto_2001650 - SURFACE
      ?auto_2001651 - SURFACE
      ?auto_2001652 - SURFACE
    )
    :vars
    (
      ?auto_2001655 - HOIST
      ?auto_2001656 - PLACE
      ?auto_2001657 - PLACE
      ?auto_2001654 - HOIST
      ?auto_2001653 - SURFACE
      ?auto_2001658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2001655 ?auto_2001656 ) ( IS-CRATE ?auto_2001652 ) ( not ( = ?auto_2001651 ?auto_2001652 ) ) ( not ( = ?auto_2001650 ?auto_2001651 ) ) ( not ( = ?auto_2001650 ?auto_2001652 ) ) ( not ( = ?auto_2001657 ?auto_2001656 ) ) ( HOIST-AT ?auto_2001654 ?auto_2001657 ) ( not ( = ?auto_2001655 ?auto_2001654 ) ) ( AVAILABLE ?auto_2001654 ) ( SURFACE-AT ?auto_2001652 ?auto_2001657 ) ( ON ?auto_2001652 ?auto_2001653 ) ( CLEAR ?auto_2001652 ) ( not ( = ?auto_2001651 ?auto_2001653 ) ) ( not ( = ?auto_2001652 ?auto_2001653 ) ) ( not ( = ?auto_2001650 ?auto_2001653 ) ) ( TRUCK-AT ?auto_2001658 ?auto_2001656 ) ( SURFACE-AT ?auto_2001650 ?auto_2001656 ) ( CLEAR ?auto_2001650 ) ( IS-CRATE ?auto_2001651 ) ( AVAILABLE ?auto_2001655 ) ( IN ?auto_2001651 ?auto_2001658 ) ( ON ?auto_2001639 ?auto_2001638 ) ( ON ?auto_2001640 ?auto_2001639 ) ( ON ?auto_2001637 ?auto_2001640 ) ( ON ?auto_2001641 ?auto_2001637 ) ( ON ?auto_2001643 ?auto_2001641 ) ( ON ?auto_2001642 ?auto_2001643 ) ( ON ?auto_2001644 ?auto_2001642 ) ( ON ?auto_2001645 ?auto_2001644 ) ( ON ?auto_2001646 ?auto_2001645 ) ( ON ?auto_2001647 ?auto_2001646 ) ( ON ?auto_2001648 ?auto_2001647 ) ( ON ?auto_2001649 ?auto_2001648 ) ( ON ?auto_2001650 ?auto_2001649 ) ( not ( = ?auto_2001638 ?auto_2001639 ) ) ( not ( = ?auto_2001638 ?auto_2001640 ) ) ( not ( = ?auto_2001638 ?auto_2001637 ) ) ( not ( = ?auto_2001638 ?auto_2001641 ) ) ( not ( = ?auto_2001638 ?auto_2001643 ) ) ( not ( = ?auto_2001638 ?auto_2001642 ) ) ( not ( = ?auto_2001638 ?auto_2001644 ) ) ( not ( = ?auto_2001638 ?auto_2001645 ) ) ( not ( = ?auto_2001638 ?auto_2001646 ) ) ( not ( = ?auto_2001638 ?auto_2001647 ) ) ( not ( = ?auto_2001638 ?auto_2001648 ) ) ( not ( = ?auto_2001638 ?auto_2001649 ) ) ( not ( = ?auto_2001638 ?auto_2001650 ) ) ( not ( = ?auto_2001638 ?auto_2001651 ) ) ( not ( = ?auto_2001638 ?auto_2001652 ) ) ( not ( = ?auto_2001638 ?auto_2001653 ) ) ( not ( = ?auto_2001639 ?auto_2001640 ) ) ( not ( = ?auto_2001639 ?auto_2001637 ) ) ( not ( = ?auto_2001639 ?auto_2001641 ) ) ( not ( = ?auto_2001639 ?auto_2001643 ) ) ( not ( = ?auto_2001639 ?auto_2001642 ) ) ( not ( = ?auto_2001639 ?auto_2001644 ) ) ( not ( = ?auto_2001639 ?auto_2001645 ) ) ( not ( = ?auto_2001639 ?auto_2001646 ) ) ( not ( = ?auto_2001639 ?auto_2001647 ) ) ( not ( = ?auto_2001639 ?auto_2001648 ) ) ( not ( = ?auto_2001639 ?auto_2001649 ) ) ( not ( = ?auto_2001639 ?auto_2001650 ) ) ( not ( = ?auto_2001639 ?auto_2001651 ) ) ( not ( = ?auto_2001639 ?auto_2001652 ) ) ( not ( = ?auto_2001639 ?auto_2001653 ) ) ( not ( = ?auto_2001640 ?auto_2001637 ) ) ( not ( = ?auto_2001640 ?auto_2001641 ) ) ( not ( = ?auto_2001640 ?auto_2001643 ) ) ( not ( = ?auto_2001640 ?auto_2001642 ) ) ( not ( = ?auto_2001640 ?auto_2001644 ) ) ( not ( = ?auto_2001640 ?auto_2001645 ) ) ( not ( = ?auto_2001640 ?auto_2001646 ) ) ( not ( = ?auto_2001640 ?auto_2001647 ) ) ( not ( = ?auto_2001640 ?auto_2001648 ) ) ( not ( = ?auto_2001640 ?auto_2001649 ) ) ( not ( = ?auto_2001640 ?auto_2001650 ) ) ( not ( = ?auto_2001640 ?auto_2001651 ) ) ( not ( = ?auto_2001640 ?auto_2001652 ) ) ( not ( = ?auto_2001640 ?auto_2001653 ) ) ( not ( = ?auto_2001637 ?auto_2001641 ) ) ( not ( = ?auto_2001637 ?auto_2001643 ) ) ( not ( = ?auto_2001637 ?auto_2001642 ) ) ( not ( = ?auto_2001637 ?auto_2001644 ) ) ( not ( = ?auto_2001637 ?auto_2001645 ) ) ( not ( = ?auto_2001637 ?auto_2001646 ) ) ( not ( = ?auto_2001637 ?auto_2001647 ) ) ( not ( = ?auto_2001637 ?auto_2001648 ) ) ( not ( = ?auto_2001637 ?auto_2001649 ) ) ( not ( = ?auto_2001637 ?auto_2001650 ) ) ( not ( = ?auto_2001637 ?auto_2001651 ) ) ( not ( = ?auto_2001637 ?auto_2001652 ) ) ( not ( = ?auto_2001637 ?auto_2001653 ) ) ( not ( = ?auto_2001641 ?auto_2001643 ) ) ( not ( = ?auto_2001641 ?auto_2001642 ) ) ( not ( = ?auto_2001641 ?auto_2001644 ) ) ( not ( = ?auto_2001641 ?auto_2001645 ) ) ( not ( = ?auto_2001641 ?auto_2001646 ) ) ( not ( = ?auto_2001641 ?auto_2001647 ) ) ( not ( = ?auto_2001641 ?auto_2001648 ) ) ( not ( = ?auto_2001641 ?auto_2001649 ) ) ( not ( = ?auto_2001641 ?auto_2001650 ) ) ( not ( = ?auto_2001641 ?auto_2001651 ) ) ( not ( = ?auto_2001641 ?auto_2001652 ) ) ( not ( = ?auto_2001641 ?auto_2001653 ) ) ( not ( = ?auto_2001643 ?auto_2001642 ) ) ( not ( = ?auto_2001643 ?auto_2001644 ) ) ( not ( = ?auto_2001643 ?auto_2001645 ) ) ( not ( = ?auto_2001643 ?auto_2001646 ) ) ( not ( = ?auto_2001643 ?auto_2001647 ) ) ( not ( = ?auto_2001643 ?auto_2001648 ) ) ( not ( = ?auto_2001643 ?auto_2001649 ) ) ( not ( = ?auto_2001643 ?auto_2001650 ) ) ( not ( = ?auto_2001643 ?auto_2001651 ) ) ( not ( = ?auto_2001643 ?auto_2001652 ) ) ( not ( = ?auto_2001643 ?auto_2001653 ) ) ( not ( = ?auto_2001642 ?auto_2001644 ) ) ( not ( = ?auto_2001642 ?auto_2001645 ) ) ( not ( = ?auto_2001642 ?auto_2001646 ) ) ( not ( = ?auto_2001642 ?auto_2001647 ) ) ( not ( = ?auto_2001642 ?auto_2001648 ) ) ( not ( = ?auto_2001642 ?auto_2001649 ) ) ( not ( = ?auto_2001642 ?auto_2001650 ) ) ( not ( = ?auto_2001642 ?auto_2001651 ) ) ( not ( = ?auto_2001642 ?auto_2001652 ) ) ( not ( = ?auto_2001642 ?auto_2001653 ) ) ( not ( = ?auto_2001644 ?auto_2001645 ) ) ( not ( = ?auto_2001644 ?auto_2001646 ) ) ( not ( = ?auto_2001644 ?auto_2001647 ) ) ( not ( = ?auto_2001644 ?auto_2001648 ) ) ( not ( = ?auto_2001644 ?auto_2001649 ) ) ( not ( = ?auto_2001644 ?auto_2001650 ) ) ( not ( = ?auto_2001644 ?auto_2001651 ) ) ( not ( = ?auto_2001644 ?auto_2001652 ) ) ( not ( = ?auto_2001644 ?auto_2001653 ) ) ( not ( = ?auto_2001645 ?auto_2001646 ) ) ( not ( = ?auto_2001645 ?auto_2001647 ) ) ( not ( = ?auto_2001645 ?auto_2001648 ) ) ( not ( = ?auto_2001645 ?auto_2001649 ) ) ( not ( = ?auto_2001645 ?auto_2001650 ) ) ( not ( = ?auto_2001645 ?auto_2001651 ) ) ( not ( = ?auto_2001645 ?auto_2001652 ) ) ( not ( = ?auto_2001645 ?auto_2001653 ) ) ( not ( = ?auto_2001646 ?auto_2001647 ) ) ( not ( = ?auto_2001646 ?auto_2001648 ) ) ( not ( = ?auto_2001646 ?auto_2001649 ) ) ( not ( = ?auto_2001646 ?auto_2001650 ) ) ( not ( = ?auto_2001646 ?auto_2001651 ) ) ( not ( = ?auto_2001646 ?auto_2001652 ) ) ( not ( = ?auto_2001646 ?auto_2001653 ) ) ( not ( = ?auto_2001647 ?auto_2001648 ) ) ( not ( = ?auto_2001647 ?auto_2001649 ) ) ( not ( = ?auto_2001647 ?auto_2001650 ) ) ( not ( = ?auto_2001647 ?auto_2001651 ) ) ( not ( = ?auto_2001647 ?auto_2001652 ) ) ( not ( = ?auto_2001647 ?auto_2001653 ) ) ( not ( = ?auto_2001648 ?auto_2001649 ) ) ( not ( = ?auto_2001648 ?auto_2001650 ) ) ( not ( = ?auto_2001648 ?auto_2001651 ) ) ( not ( = ?auto_2001648 ?auto_2001652 ) ) ( not ( = ?auto_2001648 ?auto_2001653 ) ) ( not ( = ?auto_2001649 ?auto_2001650 ) ) ( not ( = ?auto_2001649 ?auto_2001651 ) ) ( not ( = ?auto_2001649 ?auto_2001652 ) ) ( not ( = ?auto_2001649 ?auto_2001653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2001650 ?auto_2001651 ?auto_2001652 )
      ( MAKE-15CRATE-VERIFY ?auto_2001638 ?auto_2001639 ?auto_2001640 ?auto_2001637 ?auto_2001641 ?auto_2001643 ?auto_2001642 ?auto_2001644 ?auto_2001645 ?auto_2001646 ?auto_2001647 ?auto_2001648 ?auto_2001649 ?auto_2001650 ?auto_2001651 ?auto_2001652 ) )
  )

)

