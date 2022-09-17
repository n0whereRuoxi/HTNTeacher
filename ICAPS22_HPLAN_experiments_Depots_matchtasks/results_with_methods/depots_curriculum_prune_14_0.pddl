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
      ?auto_16404 - SURFACE
      ?auto_16405 - SURFACE
    )
    :vars
    (
      ?auto_16406 - HOIST
      ?auto_16407 - PLACE
      ?auto_16409 - PLACE
      ?auto_16410 - HOIST
      ?auto_16411 - SURFACE
      ?auto_16408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16406 ?auto_16407 ) ( SURFACE-AT ?auto_16404 ?auto_16407 ) ( CLEAR ?auto_16404 ) ( IS-CRATE ?auto_16405 ) ( AVAILABLE ?auto_16406 ) ( not ( = ?auto_16409 ?auto_16407 ) ) ( HOIST-AT ?auto_16410 ?auto_16409 ) ( AVAILABLE ?auto_16410 ) ( SURFACE-AT ?auto_16405 ?auto_16409 ) ( ON ?auto_16405 ?auto_16411 ) ( CLEAR ?auto_16405 ) ( TRUCK-AT ?auto_16408 ?auto_16407 ) ( not ( = ?auto_16404 ?auto_16405 ) ) ( not ( = ?auto_16404 ?auto_16411 ) ) ( not ( = ?auto_16405 ?auto_16411 ) ) ( not ( = ?auto_16406 ?auto_16410 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16408 ?auto_16407 ?auto_16409 )
      ( !LIFT ?auto_16410 ?auto_16405 ?auto_16411 ?auto_16409 )
      ( !LOAD ?auto_16410 ?auto_16405 ?auto_16408 ?auto_16409 )
      ( !DRIVE ?auto_16408 ?auto_16409 ?auto_16407 )
      ( !UNLOAD ?auto_16406 ?auto_16405 ?auto_16408 ?auto_16407 )
      ( !DROP ?auto_16406 ?auto_16405 ?auto_16404 ?auto_16407 )
      ( MAKE-1CRATE-VERIFY ?auto_16404 ?auto_16405 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_16425 - SURFACE
      ?auto_16426 - SURFACE
      ?auto_16427 - SURFACE
    )
    :vars
    (
      ?auto_16429 - HOIST
      ?auto_16430 - PLACE
      ?auto_16432 - PLACE
      ?auto_16433 - HOIST
      ?auto_16428 - SURFACE
      ?auto_16434 - PLACE
      ?auto_16436 - HOIST
      ?auto_16435 - SURFACE
      ?auto_16431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16429 ?auto_16430 ) ( IS-CRATE ?auto_16427 ) ( not ( = ?auto_16432 ?auto_16430 ) ) ( HOIST-AT ?auto_16433 ?auto_16432 ) ( AVAILABLE ?auto_16433 ) ( SURFACE-AT ?auto_16427 ?auto_16432 ) ( ON ?auto_16427 ?auto_16428 ) ( CLEAR ?auto_16427 ) ( not ( = ?auto_16426 ?auto_16427 ) ) ( not ( = ?auto_16426 ?auto_16428 ) ) ( not ( = ?auto_16427 ?auto_16428 ) ) ( not ( = ?auto_16429 ?auto_16433 ) ) ( SURFACE-AT ?auto_16425 ?auto_16430 ) ( CLEAR ?auto_16425 ) ( IS-CRATE ?auto_16426 ) ( AVAILABLE ?auto_16429 ) ( not ( = ?auto_16434 ?auto_16430 ) ) ( HOIST-AT ?auto_16436 ?auto_16434 ) ( AVAILABLE ?auto_16436 ) ( SURFACE-AT ?auto_16426 ?auto_16434 ) ( ON ?auto_16426 ?auto_16435 ) ( CLEAR ?auto_16426 ) ( TRUCK-AT ?auto_16431 ?auto_16430 ) ( not ( = ?auto_16425 ?auto_16426 ) ) ( not ( = ?auto_16425 ?auto_16435 ) ) ( not ( = ?auto_16426 ?auto_16435 ) ) ( not ( = ?auto_16429 ?auto_16436 ) ) ( not ( = ?auto_16425 ?auto_16427 ) ) ( not ( = ?auto_16425 ?auto_16428 ) ) ( not ( = ?auto_16427 ?auto_16435 ) ) ( not ( = ?auto_16432 ?auto_16434 ) ) ( not ( = ?auto_16433 ?auto_16436 ) ) ( not ( = ?auto_16428 ?auto_16435 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16425 ?auto_16426 )
      ( MAKE-1CRATE ?auto_16426 ?auto_16427 )
      ( MAKE-2CRATE-VERIFY ?auto_16425 ?auto_16426 ?auto_16427 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_16451 - SURFACE
      ?auto_16452 - SURFACE
      ?auto_16453 - SURFACE
      ?auto_16454 - SURFACE
    )
    :vars
    (
      ?auto_16457 - HOIST
      ?auto_16459 - PLACE
      ?auto_16456 - PLACE
      ?auto_16455 - HOIST
      ?auto_16460 - SURFACE
      ?auto_16461 - PLACE
      ?auto_16466 - HOIST
      ?auto_16462 - SURFACE
      ?auto_16463 - PLACE
      ?auto_16465 - HOIST
      ?auto_16464 - SURFACE
      ?auto_16458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16457 ?auto_16459 ) ( IS-CRATE ?auto_16454 ) ( not ( = ?auto_16456 ?auto_16459 ) ) ( HOIST-AT ?auto_16455 ?auto_16456 ) ( AVAILABLE ?auto_16455 ) ( SURFACE-AT ?auto_16454 ?auto_16456 ) ( ON ?auto_16454 ?auto_16460 ) ( CLEAR ?auto_16454 ) ( not ( = ?auto_16453 ?auto_16454 ) ) ( not ( = ?auto_16453 ?auto_16460 ) ) ( not ( = ?auto_16454 ?auto_16460 ) ) ( not ( = ?auto_16457 ?auto_16455 ) ) ( IS-CRATE ?auto_16453 ) ( not ( = ?auto_16461 ?auto_16459 ) ) ( HOIST-AT ?auto_16466 ?auto_16461 ) ( AVAILABLE ?auto_16466 ) ( SURFACE-AT ?auto_16453 ?auto_16461 ) ( ON ?auto_16453 ?auto_16462 ) ( CLEAR ?auto_16453 ) ( not ( = ?auto_16452 ?auto_16453 ) ) ( not ( = ?auto_16452 ?auto_16462 ) ) ( not ( = ?auto_16453 ?auto_16462 ) ) ( not ( = ?auto_16457 ?auto_16466 ) ) ( SURFACE-AT ?auto_16451 ?auto_16459 ) ( CLEAR ?auto_16451 ) ( IS-CRATE ?auto_16452 ) ( AVAILABLE ?auto_16457 ) ( not ( = ?auto_16463 ?auto_16459 ) ) ( HOIST-AT ?auto_16465 ?auto_16463 ) ( AVAILABLE ?auto_16465 ) ( SURFACE-AT ?auto_16452 ?auto_16463 ) ( ON ?auto_16452 ?auto_16464 ) ( CLEAR ?auto_16452 ) ( TRUCK-AT ?auto_16458 ?auto_16459 ) ( not ( = ?auto_16451 ?auto_16452 ) ) ( not ( = ?auto_16451 ?auto_16464 ) ) ( not ( = ?auto_16452 ?auto_16464 ) ) ( not ( = ?auto_16457 ?auto_16465 ) ) ( not ( = ?auto_16451 ?auto_16453 ) ) ( not ( = ?auto_16451 ?auto_16462 ) ) ( not ( = ?auto_16453 ?auto_16464 ) ) ( not ( = ?auto_16461 ?auto_16463 ) ) ( not ( = ?auto_16466 ?auto_16465 ) ) ( not ( = ?auto_16462 ?auto_16464 ) ) ( not ( = ?auto_16451 ?auto_16454 ) ) ( not ( = ?auto_16451 ?auto_16460 ) ) ( not ( = ?auto_16452 ?auto_16454 ) ) ( not ( = ?auto_16452 ?auto_16460 ) ) ( not ( = ?auto_16454 ?auto_16462 ) ) ( not ( = ?auto_16454 ?auto_16464 ) ) ( not ( = ?auto_16456 ?auto_16461 ) ) ( not ( = ?auto_16456 ?auto_16463 ) ) ( not ( = ?auto_16455 ?auto_16466 ) ) ( not ( = ?auto_16455 ?auto_16465 ) ) ( not ( = ?auto_16460 ?auto_16462 ) ) ( not ( = ?auto_16460 ?auto_16464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16451 ?auto_16452 ?auto_16453 )
      ( MAKE-1CRATE ?auto_16453 ?auto_16454 )
      ( MAKE-3CRATE-VERIFY ?auto_16451 ?auto_16452 ?auto_16453 ?auto_16454 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_16482 - SURFACE
      ?auto_16483 - SURFACE
      ?auto_16484 - SURFACE
      ?auto_16485 - SURFACE
      ?auto_16486 - SURFACE
    )
    :vars
    (
      ?auto_16488 - HOIST
      ?auto_16489 - PLACE
      ?auto_16490 - PLACE
      ?auto_16487 - HOIST
      ?auto_16492 - SURFACE
      ?auto_16495 - PLACE
      ?auto_16496 - HOIST
      ?auto_16494 - SURFACE
      ?auto_16497 - PLACE
      ?auto_16500 - HOIST
      ?auto_16498 - SURFACE
      ?auto_16499 - PLACE
      ?auto_16493 - HOIST
      ?auto_16501 - SURFACE
      ?auto_16491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16488 ?auto_16489 ) ( IS-CRATE ?auto_16486 ) ( not ( = ?auto_16490 ?auto_16489 ) ) ( HOIST-AT ?auto_16487 ?auto_16490 ) ( AVAILABLE ?auto_16487 ) ( SURFACE-AT ?auto_16486 ?auto_16490 ) ( ON ?auto_16486 ?auto_16492 ) ( CLEAR ?auto_16486 ) ( not ( = ?auto_16485 ?auto_16486 ) ) ( not ( = ?auto_16485 ?auto_16492 ) ) ( not ( = ?auto_16486 ?auto_16492 ) ) ( not ( = ?auto_16488 ?auto_16487 ) ) ( IS-CRATE ?auto_16485 ) ( not ( = ?auto_16495 ?auto_16489 ) ) ( HOIST-AT ?auto_16496 ?auto_16495 ) ( AVAILABLE ?auto_16496 ) ( SURFACE-AT ?auto_16485 ?auto_16495 ) ( ON ?auto_16485 ?auto_16494 ) ( CLEAR ?auto_16485 ) ( not ( = ?auto_16484 ?auto_16485 ) ) ( not ( = ?auto_16484 ?auto_16494 ) ) ( not ( = ?auto_16485 ?auto_16494 ) ) ( not ( = ?auto_16488 ?auto_16496 ) ) ( IS-CRATE ?auto_16484 ) ( not ( = ?auto_16497 ?auto_16489 ) ) ( HOIST-AT ?auto_16500 ?auto_16497 ) ( AVAILABLE ?auto_16500 ) ( SURFACE-AT ?auto_16484 ?auto_16497 ) ( ON ?auto_16484 ?auto_16498 ) ( CLEAR ?auto_16484 ) ( not ( = ?auto_16483 ?auto_16484 ) ) ( not ( = ?auto_16483 ?auto_16498 ) ) ( not ( = ?auto_16484 ?auto_16498 ) ) ( not ( = ?auto_16488 ?auto_16500 ) ) ( SURFACE-AT ?auto_16482 ?auto_16489 ) ( CLEAR ?auto_16482 ) ( IS-CRATE ?auto_16483 ) ( AVAILABLE ?auto_16488 ) ( not ( = ?auto_16499 ?auto_16489 ) ) ( HOIST-AT ?auto_16493 ?auto_16499 ) ( AVAILABLE ?auto_16493 ) ( SURFACE-AT ?auto_16483 ?auto_16499 ) ( ON ?auto_16483 ?auto_16501 ) ( CLEAR ?auto_16483 ) ( TRUCK-AT ?auto_16491 ?auto_16489 ) ( not ( = ?auto_16482 ?auto_16483 ) ) ( not ( = ?auto_16482 ?auto_16501 ) ) ( not ( = ?auto_16483 ?auto_16501 ) ) ( not ( = ?auto_16488 ?auto_16493 ) ) ( not ( = ?auto_16482 ?auto_16484 ) ) ( not ( = ?auto_16482 ?auto_16498 ) ) ( not ( = ?auto_16484 ?auto_16501 ) ) ( not ( = ?auto_16497 ?auto_16499 ) ) ( not ( = ?auto_16500 ?auto_16493 ) ) ( not ( = ?auto_16498 ?auto_16501 ) ) ( not ( = ?auto_16482 ?auto_16485 ) ) ( not ( = ?auto_16482 ?auto_16494 ) ) ( not ( = ?auto_16483 ?auto_16485 ) ) ( not ( = ?auto_16483 ?auto_16494 ) ) ( not ( = ?auto_16485 ?auto_16498 ) ) ( not ( = ?auto_16485 ?auto_16501 ) ) ( not ( = ?auto_16495 ?auto_16497 ) ) ( not ( = ?auto_16495 ?auto_16499 ) ) ( not ( = ?auto_16496 ?auto_16500 ) ) ( not ( = ?auto_16496 ?auto_16493 ) ) ( not ( = ?auto_16494 ?auto_16498 ) ) ( not ( = ?auto_16494 ?auto_16501 ) ) ( not ( = ?auto_16482 ?auto_16486 ) ) ( not ( = ?auto_16482 ?auto_16492 ) ) ( not ( = ?auto_16483 ?auto_16486 ) ) ( not ( = ?auto_16483 ?auto_16492 ) ) ( not ( = ?auto_16484 ?auto_16486 ) ) ( not ( = ?auto_16484 ?auto_16492 ) ) ( not ( = ?auto_16486 ?auto_16494 ) ) ( not ( = ?auto_16486 ?auto_16498 ) ) ( not ( = ?auto_16486 ?auto_16501 ) ) ( not ( = ?auto_16490 ?auto_16495 ) ) ( not ( = ?auto_16490 ?auto_16497 ) ) ( not ( = ?auto_16490 ?auto_16499 ) ) ( not ( = ?auto_16487 ?auto_16496 ) ) ( not ( = ?auto_16487 ?auto_16500 ) ) ( not ( = ?auto_16487 ?auto_16493 ) ) ( not ( = ?auto_16492 ?auto_16494 ) ) ( not ( = ?auto_16492 ?auto_16498 ) ) ( not ( = ?auto_16492 ?auto_16501 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_16482 ?auto_16483 ?auto_16484 ?auto_16485 )
      ( MAKE-1CRATE ?auto_16485 ?auto_16486 )
      ( MAKE-4CRATE-VERIFY ?auto_16482 ?auto_16483 ?auto_16484 ?auto_16485 ?auto_16486 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_16518 - SURFACE
      ?auto_16519 - SURFACE
      ?auto_16520 - SURFACE
      ?auto_16521 - SURFACE
      ?auto_16522 - SURFACE
      ?auto_16523 - SURFACE
    )
    :vars
    (
      ?auto_16528 - HOIST
      ?auto_16524 - PLACE
      ?auto_16527 - PLACE
      ?auto_16529 - HOIST
      ?auto_16526 - SURFACE
      ?auto_16533 - PLACE
      ?auto_16532 - HOIST
      ?auto_16538 - SURFACE
      ?auto_16535 - PLACE
      ?auto_16531 - HOIST
      ?auto_16534 - SURFACE
      ?auto_16541 - PLACE
      ?auto_16536 - HOIST
      ?auto_16540 - SURFACE
      ?auto_16539 - PLACE
      ?auto_16530 - HOIST
      ?auto_16537 - SURFACE
      ?auto_16525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16528 ?auto_16524 ) ( IS-CRATE ?auto_16523 ) ( not ( = ?auto_16527 ?auto_16524 ) ) ( HOIST-AT ?auto_16529 ?auto_16527 ) ( AVAILABLE ?auto_16529 ) ( SURFACE-AT ?auto_16523 ?auto_16527 ) ( ON ?auto_16523 ?auto_16526 ) ( CLEAR ?auto_16523 ) ( not ( = ?auto_16522 ?auto_16523 ) ) ( not ( = ?auto_16522 ?auto_16526 ) ) ( not ( = ?auto_16523 ?auto_16526 ) ) ( not ( = ?auto_16528 ?auto_16529 ) ) ( IS-CRATE ?auto_16522 ) ( not ( = ?auto_16533 ?auto_16524 ) ) ( HOIST-AT ?auto_16532 ?auto_16533 ) ( AVAILABLE ?auto_16532 ) ( SURFACE-AT ?auto_16522 ?auto_16533 ) ( ON ?auto_16522 ?auto_16538 ) ( CLEAR ?auto_16522 ) ( not ( = ?auto_16521 ?auto_16522 ) ) ( not ( = ?auto_16521 ?auto_16538 ) ) ( not ( = ?auto_16522 ?auto_16538 ) ) ( not ( = ?auto_16528 ?auto_16532 ) ) ( IS-CRATE ?auto_16521 ) ( not ( = ?auto_16535 ?auto_16524 ) ) ( HOIST-AT ?auto_16531 ?auto_16535 ) ( AVAILABLE ?auto_16531 ) ( SURFACE-AT ?auto_16521 ?auto_16535 ) ( ON ?auto_16521 ?auto_16534 ) ( CLEAR ?auto_16521 ) ( not ( = ?auto_16520 ?auto_16521 ) ) ( not ( = ?auto_16520 ?auto_16534 ) ) ( not ( = ?auto_16521 ?auto_16534 ) ) ( not ( = ?auto_16528 ?auto_16531 ) ) ( IS-CRATE ?auto_16520 ) ( not ( = ?auto_16541 ?auto_16524 ) ) ( HOIST-AT ?auto_16536 ?auto_16541 ) ( AVAILABLE ?auto_16536 ) ( SURFACE-AT ?auto_16520 ?auto_16541 ) ( ON ?auto_16520 ?auto_16540 ) ( CLEAR ?auto_16520 ) ( not ( = ?auto_16519 ?auto_16520 ) ) ( not ( = ?auto_16519 ?auto_16540 ) ) ( not ( = ?auto_16520 ?auto_16540 ) ) ( not ( = ?auto_16528 ?auto_16536 ) ) ( SURFACE-AT ?auto_16518 ?auto_16524 ) ( CLEAR ?auto_16518 ) ( IS-CRATE ?auto_16519 ) ( AVAILABLE ?auto_16528 ) ( not ( = ?auto_16539 ?auto_16524 ) ) ( HOIST-AT ?auto_16530 ?auto_16539 ) ( AVAILABLE ?auto_16530 ) ( SURFACE-AT ?auto_16519 ?auto_16539 ) ( ON ?auto_16519 ?auto_16537 ) ( CLEAR ?auto_16519 ) ( TRUCK-AT ?auto_16525 ?auto_16524 ) ( not ( = ?auto_16518 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16537 ) ) ( not ( = ?auto_16519 ?auto_16537 ) ) ( not ( = ?auto_16528 ?auto_16530 ) ) ( not ( = ?auto_16518 ?auto_16520 ) ) ( not ( = ?auto_16518 ?auto_16540 ) ) ( not ( = ?auto_16520 ?auto_16537 ) ) ( not ( = ?auto_16541 ?auto_16539 ) ) ( not ( = ?auto_16536 ?auto_16530 ) ) ( not ( = ?auto_16540 ?auto_16537 ) ) ( not ( = ?auto_16518 ?auto_16521 ) ) ( not ( = ?auto_16518 ?auto_16534 ) ) ( not ( = ?auto_16519 ?auto_16521 ) ) ( not ( = ?auto_16519 ?auto_16534 ) ) ( not ( = ?auto_16521 ?auto_16540 ) ) ( not ( = ?auto_16521 ?auto_16537 ) ) ( not ( = ?auto_16535 ?auto_16541 ) ) ( not ( = ?auto_16535 ?auto_16539 ) ) ( not ( = ?auto_16531 ?auto_16536 ) ) ( not ( = ?auto_16531 ?auto_16530 ) ) ( not ( = ?auto_16534 ?auto_16540 ) ) ( not ( = ?auto_16534 ?auto_16537 ) ) ( not ( = ?auto_16518 ?auto_16522 ) ) ( not ( = ?auto_16518 ?auto_16538 ) ) ( not ( = ?auto_16519 ?auto_16522 ) ) ( not ( = ?auto_16519 ?auto_16538 ) ) ( not ( = ?auto_16520 ?auto_16522 ) ) ( not ( = ?auto_16520 ?auto_16538 ) ) ( not ( = ?auto_16522 ?auto_16534 ) ) ( not ( = ?auto_16522 ?auto_16540 ) ) ( not ( = ?auto_16522 ?auto_16537 ) ) ( not ( = ?auto_16533 ?auto_16535 ) ) ( not ( = ?auto_16533 ?auto_16541 ) ) ( not ( = ?auto_16533 ?auto_16539 ) ) ( not ( = ?auto_16532 ?auto_16531 ) ) ( not ( = ?auto_16532 ?auto_16536 ) ) ( not ( = ?auto_16532 ?auto_16530 ) ) ( not ( = ?auto_16538 ?auto_16534 ) ) ( not ( = ?auto_16538 ?auto_16540 ) ) ( not ( = ?auto_16538 ?auto_16537 ) ) ( not ( = ?auto_16518 ?auto_16523 ) ) ( not ( = ?auto_16518 ?auto_16526 ) ) ( not ( = ?auto_16519 ?auto_16523 ) ) ( not ( = ?auto_16519 ?auto_16526 ) ) ( not ( = ?auto_16520 ?auto_16523 ) ) ( not ( = ?auto_16520 ?auto_16526 ) ) ( not ( = ?auto_16521 ?auto_16523 ) ) ( not ( = ?auto_16521 ?auto_16526 ) ) ( not ( = ?auto_16523 ?auto_16538 ) ) ( not ( = ?auto_16523 ?auto_16534 ) ) ( not ( = ?auto_16523 ?auto_16540 ) ) ( not ( = ?auto_16523 ?auto_16537 ) ) ( not ( = ?auto_16527 ?auto_16533 ) ) ( not ( = ?auto_16527 ?auto_16535 ) ) ( not ( = ?auto_16527 ?auto_16541 ) ) ( not ( = ?auto_16527 ?auto_16539 ) ) ( not ( = ?auto_16529 ?auto_16532 ) ) ( not ( = ?auto_16529 ?auto_16531 ) ) ( not ( = ?auto_16529 ?auto_16536 ) ) ( not ( = ?auto_16529 ?auto_16530 ) ) ( not ( = ?auto_16526 ?auto_16538 ) ) ( not ( = ?auto_16526 ?auto_16534 ) ) ( not ( = ?auto_16526 ?auto_16540 ) ) ( not ( = ?auto_16526 ?auto_16537 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_16518 ?auto_16519 ?auto_16520 ?auto_16521 ?auto_16522 )
      ( MAKE-1CRATE ?auto_16522 ?auto_16523 )
      ( MAKE-5CRATE-VERIFY ?auto_16518 ?auto_16519 ?auto_16520 ?auto_16521 ?auto_16522 ?auto_16523 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_16559 - SURFACE
      ?auto_16560 - SURFACE
      ?auto_16561 - SURFACE
      ?auto_16562 - SURFACE
      ?auto_16563 - SURFACE
      ?auto_16564 - SURFACE
      ?auto_16565 - SURFACE
    )
    :vars
    (
      ?auto_16567 - HOIST
      ?auto_16568 - PLACE
      ?auto_16571 - PLACE
      ?auto_16570 - HOIST
      ?auto_16569 - SURFACE
      ?auto_16582 - PLACE
      ?auto_16583 - HOIST
      ?auto_16575 - SURFACE
      ?auto_16577 - PLACE
      ?auto_16579 - HOIST
      ?auto_16584 - SURFACE
      ?auto_16580 - PLACE
      ?auto_16578 - HOIST
      ?auto_16572 - SURFACE
      ?auto_16574 - PLACE
      ?auto_16581 - HOIST
      ?auto_16585 - SURFACE
      ?auto_16576 - PLACE
      ?auto_16586 - HOIST
      ?auto_16573 - SURFACE
      ?auto_16566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16567 ?auto_16568 ) ( IS-CRATE ?auto_16565 ) ( not ( = ?auto_16571 ?auto_16568 ) ) ( HOIST-AT ?auto_16570 ?auto_16571 ) ( AVAILABLE ?auto_16570 ) ( SURFACE-AT ?auto_16565 ?auto_16571 ) ( ON ?auto_16565 ?auto_16569 ) ( CLEAR ?auto_16565 ) ( not ( = ?auto_16564 ?auto_16565 ) ) ( not ( = ?auto_16564 ?auto_16569 ) ) ( not ( = ?auto_16565 ?auto_16569 ) ) ( not ( = ?auto_16567 ?auto_16570 ) ) ( IS-CRATE ?auto_16564 ) ( not ( = ?auto_16582 ?auto_16568 ) ) ( HOIST-AT ?auto_16583 ?auto_16582 ) ( AVAILABLE ?auto_16583 ) ( SURFACE-AT ?auto_16564 ?auto_16582 ) ( ON ?auto_16564 ?auto_16575 ) ( CLEAR ?auto_16564 ) ( not ( = ?auto_16563 ?auto_16564 ) ) ( not ( = ?auto_16563 ?auto_16575 ) ) ( not ( = ?auto_16564 ?auto_16575 ) ) ( not ( = ?auto_16567 ?auto_16583 ) ) ( IS-CRATE ?auto_16563 ) ( not ( = ?auto_16577 ?auto_16568 ) ) ( HOIST-AT ?auto_16579 ?auto_16577 ) ( AVAILABLE ?auto_16579 ) ( SURFACE-AT ?auto_16563 ?auto_16577 ) ( ON ?auto_16563 ?auto_16584 ) ( CLEAR ?auto_16563 ) ( not ( = ?auto_16562 ?auto_16563 ) ) ( not ( = ?auto_16562 ?auto_16584 ) ) ( not ( = ?auto_16563 ?auto_16584 ) ) ( not ( = ?auto_16567 ?auto_16579 ) ) ( IS-CRATE ?auto_16562 ) ( not ( = ?auto_16580 ?auto_16568 ) ) ( HOIST-AT ?auto_16578 ?auto_16580 ) ( AVAILABLE ?auto_16578 ) ( SURFACE-AT ?auto_16562 ?auto_16580 ) ( ON ?auto_16562 ?auto_16572 ) ( CLEAR ?auto_16562 ) ( not ( = ?auto_16561 ?auto_16562 ) ) ( not ( = ?auto_16561 ?auto_16572 ) ) ( not ( = ?auto_16562 ?auto_16572 ) ) ( not ( = ?auto_16567 ?auto_16578 ) ) ( IS-CRATE ?auto_16561 ) ( not ( = ?auto_16574 ?auto_16568 ) ) ( HOIST-AT ?auto_16581 ?auto_16574 ) ( AVAILABLE ?auto_16581 ) ( SURFACE-AT ?auto_16561 ?auto_16574 ) ( ON ?auto_16561 ?auto_16585 ) ( CLEAR ?auto_16561 ) ( not ( = ?auto_16560 ?auto_16561 ) ) ( not ( = ?auto_16560 ?auto_16585 ) ) ( not ( = ?auto_16561 ?auto_16585 ) ) ( not ( = ?auto_16567 ?auto_16581 ) ) ( SURFACE-AT ?auto_16559 ?auto_16568 ) ( CLEAR ?auto_16559 ) ( IS-CRATE ?auto_16560 ) ( AVAILABLE ?auto_16567 ) ( not ( = ?auto_16576 ?auto_16568 ) ) ( HOIST-AT ?auto_16586 ?auto_16576 ) ( AVAILABLE ?auto_16586 ) ( SURFACE-AT ?auto_16560 ?auto_16576 ) ( ON ?auto_16560 ?auto_16573 ) ( CLEAR ?auto_16560 ) ( TRUCK-AT ?auto_16566 ?auto_16568 ) ( not ( = ?auto_16559 ?auto_16560 ) ) ( not ( = ?auto_16559 ?auto_16573 ) ) ( not ( = ?auto_16560 ?auto_16573 ) ) ( not ( = ?auto_16567 ?auto_16586 ) ) ( not ( = ?auto_16559 ?auto_16561 ) ) ( not ( = ?auto_16559 ?auto_16585 ) ) ( not ( = ?auto_16561 ?auto_16573 ) ) ( not ( = ?auto_16574 ?auto_16576 ) ) ( not ( = ?auto_16581 ?auto_16586 ) ) ( not ( = ?auto_16585 ?auto_16573 ) ) ( not ( = ?auto_16559 ?auto_16562 ) ) ( not ( = ?auto_16559 ?auto_16572 ) ) ( not ( = ?auto_16560 ?auto_16562 ) ) ( not ( = ?auto_16560 ?auto_16572 ) ) ( not ( = ?auto_16562 ?auto_16585 ) ) ( not ( = ?auto_16562 ?auto_16573 ) ) ( not ( = ?auto_16580 ?auto_16574 ) ) ( not ( = ?auto_16580 ?auto_16576 ) ) ( not ( = ?auto_16578 ?auto_16581 ) ) ( not ( = ?auto_16578 ?auto_16586 ) ) ( not ( = ?auto_16572 ?auto_16585 ) ) ( not ( = ?auto_16572 ?auto_16573 ) ) ( not ( = ?auto_16559 ?auto_16563 ) ) ( not ( = ?auto_16559 ?auto_16584 ) ) ( not ( = ?auto_16560 ?auto_16563 ) ) ( not ( = ?auto_16560 ?auto_16584 ) ) ( not ( = ?auto_16561 ?auto_16563 ) ) ( not ( = ?auto_16561 ?auto_16584 ) ) ( not ( = ?auto_16563 ?auto_16572 ) ) ( not ( = ?auto_16563 ?auto_16585 ) ) ( not ( = ?auto_16563 ?auto_16573 ) ) ( not ( = ?auto_16577 ?auto_16580 ) ) ( not ( = ?auto_16577 ?auto_16574 ) ) ( not ( = ?auto_16577 ?auto_16576 ) ) ( not ( = ?auto_16579 ?auto_16578 ) ) ( not ( = ?auto_16579 ?auto_16581 ) ) ( not ( = ?auto_16579 ?auto_16586 ) ) ( not ( = ?auto_16584 ?auto_16572 ) ) ( not ( = ?auto_16584 ?auto_16585 ) ) ( not ( = ?auto_16584 ?auto_16573 ) ) ( not ( = ?auto_16559 ?auto_16564 ) ) ( not ( = ?auto_16559 ?auto_16575 ) ) ( not ( = ?auto_16560 ?auto_16564 ) ) ( not ( = ?auto_16560 ?auto_16575 ) ) ( not ( = ?auto_16561 ?auto_16564 ) ) ( not ( = ?auto_16561 ?auto_16575 ) ) ( not ( = ?auto_16562 ?auto_16564 ) ) ( not ( = ?auto_16562 ?auto_16575 ) ) ( not ( = ?auto_16564 ?auto_16584 ) ) ( not ( = ?auto_16564 ?auto_16572 ) ) ( not ( = ?auto_16564 ?auto_16585 ) ) ( not ( = ?auto_16564 ?auto_16573 ) ) ( not ( = ?auto_16582 ?auto_16577 ) ) ( not ( = ?auto_16582 ?auto_16580 ) ) ( not ( = ?auto_16582 ?auto_16574 ) ) ( not ( = ?auto_16582 ?auto_16576 ) ) ( not ( = ?auto_16583 ?auto_16579 ) ) ( not ( = ?auto_16583 ?auto_16578 ) ) ( not ( = ?auto_16583 ?auto_16581 ) ) ( not ( = ?auto_16583 ?auto_16586 ) ) ( not ( = ?auto_16575 ?auto_16584 ) ) ( not ( = ?auto_16575 ?auto_16572 ) ) ( not ( = ?auto_16575 ?auto_16585 ) ) ( not ( = ?auto_16575 ?auto_16573 ) ) ( not ( = ?auto_16559 ?auto_16565 ) ) ( not ( = ?auto_16559 ?auto_16569 ) ) ( not ( = ?auto_16560 ?auto_16565 ) ) ( not ( = ?auto_16560 ?auto_16569 ) ) ( not ( = ?auto_16561 ?auto_16565 ) ) ( not ( = ?auto_16561 ?auto_16569 ) ) ( not ( = ?auto_16562 ?auto_16565 ) ) ( not ( = ?auto_16562 ?auto_16569 ) ) ( not ( = ?auto_16563 ?auto_16565 ) ) ( not ( = ?auto_16563 ?auto_16569 ) ) ( not ( = ?auto_16565 ?auto_16575 ) ) ( not ( = ?auto_16565 ?auto_16584 ) ) ( not ( = ?auto_16565 ?auto_16572 ) ) ( not ( = ?auto_16565 ?auto_16585 ) ) ( not ( = ?auto_16565 ?auto_16573 ) ) ( not ( = ?auto_16571 ?auto_16582 ) ) ( not ( = ?auto_16571 ?auto_16577 ) ) ( not ( = ?auto_16571 ?auto_16580 ) ) ( not ( = ?auto_16571 ?auto_16574 ) ) ( not ( = ?auto_16571 ?auto_16576 ) ) ( not ( = ?auto_16570 ?auto_16583 ) ) ( not ( = ?auto_16570 ?auto_16579 ) ) ( not ( = ?auto_16570 ?auto_16578 ) ) ( not ( = ?auto_16570 ?auto_16581 ) ) ( not ( = ?auto_16570 ?auto_16586 ) ) ( not ( = ?auto_16569 ?auto_16575 ) ) ( not ( = ?auto_16569 ?auto_16584 ) ) ( not ( = ?auto_16569 ?auto_16572 ) ) ( not ( = ?auto_16569 ?auto_16585 ) ) ( not ( = ?auto_16569 ?auto_16573 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_16559 ?auto_16560 ?auto_16561 ?auto_16562 ?auto_16563 ?auto_16564 )
      ( MAKE-1CRATE ?auto_16564 ?auto_16565 )
      ( MAKE-6CRATE-VERIFY ?auto_16559 ?auto_16560 ?auto_16561 ?auto_16562 ?auto_16563 ?auto_16564 ?auto_16565 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_16605 - SURFACE
      ?auto_16606 - SURFACE
      ?auto_16607 - SURFACE
      ?auto_16608 - SURFACE
      ?auto_16609 - SURFACE
      ?auto_16610 - SURFACE
      ?auto_16611 - SURFACE
      ?auto_16612 - SURFACE
    )
    :vars
    (
      ?auto_16618 - HOIST
      ?auto_16614 - PLACE
      ?auto_16617 - PLACE
      ?auto_16613 - HOIST
      ?auto_16615 - SURFACE
      ?auto_16624 - PLACE
      ?auto_16625 - HOIST
      ?auto_16633 - SURFACE
      ?auto_16629 - PLACE
      ?auto_16620 - HOIST
      ?auto_16634 - SURFACE
      ?auto_16632 - PLACE
      ?auto_16630 - HOIST
      ?auto_16627 - SURFACE
      ?auto_16619 - PLACE
      ?auto_16631 - HOIST
      ?auto_16623 - SURFACE
      ?auto_16622 - PLACE
      ?auto_16621 - HOIST
      ?auto_16628 - SURFACE
      ?auto_16626 - SURFACE
      ?auto_16616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16618 ?auto_16614 ) ( IS-CRATE ?auto_16612 ) ( not ( = ?auto_16617 ?auto_16614 ) ) ( HOIST-AT ?auto_16613 ?auto_16617 ) ( SURFACE-AT ?auto_16612 ?auto_16617 ) ( ON ?auto_16612 ?auto_16615 ) ( CLEAR ?auto_16612 ) ( not ( = ?auto_16611 ?auto_16612 ) ) ( not ( = ?auto_16611 ?auto_16615 ) ) ( not ( = ?auto_16612 ?auto_16615 ) ) ( not ( = ?auto_16618 ?auto_16613 ) ) ( IS-CRATE ?auto_16611 ) ( not ( = ?auto_16624 ?auto_16614 ) ) ( HOIST-AT ?auto_16625 ?auto_16624 ) ( AVAILABLE ?auto_16625 ) ( SURFACE-AT ?auto_16611 ?auto_16624 ) ( ON ?auto_16611 ?auto_16633 ) ( CLEAR ?auto_16611 ) ( not ( = ?auto_16610 ?auto_16611 ) ) ( not ( = ?auto_16610 ?auto_16633 ) ) ( not ( = ?auto_16611 ?auto_16633 ) ) ( not ( = ?auto_16618 ?auto_16625 ) ) ( IS-CRATE ?auto_16610 ) ( not ( = ?auto_16629 ?auto_16614 ) ) ( HOIST-AT ?auto_16620 ?auto_16629 ) ( AVAILABLE ?auto_16620 ) ( SURFACE-AT ?auto_16610 ?auto_16629 ) ( ON ?auto_16610 ?auto_16634 ) ( CLEAR ?auto_16610 ) ( not ( = ?auto_16609 ?auto_16610 ) ) ( not ( = ?auto_16609 ?auto_16634 ) ) ( not ( = ?auto_16610 ?auto_16634 ) ) ( not ( = ?auto_16618 ?auto_16620 ) ) ( IS-CRATE ?auto_16609 ) ( not ( = ?auto_16632 ?auto_16614 ) ) ( HOIST-AT ?auto_16630 ?auto_16632 ) ( AVAILABLE ?auto_16630 ) ( SURFACE-AT ?auto_16609 ?auto_16632 ) ( ON ?auto_16609 ?auto_16627 ) ( CLEAR ?auto_16609 ) ( not ( = ?auto_16608 ?auto_16609 ) ) ( not ( = ?auto_16608 ?auto_16627 ) ) ( not ( = ?auto_16609 ?auto_16627 ) ) ( not ( = ?auto_16618 ?auto_16630 ) ) ( IS-CRATE ?auto_16608 ) ( not ( = ?auto_16619 ?auto_16614 ) ) ( HOIST-AT ?auto_16631 ?auto_16619 ) ( AVAILABLE ?auto_16631 ) ( SURFACE-AT ?auto_16608 ?auto_16619 ) ( ON ?auto_16608 ?auto_16623 ) ( CLEAR ?auto_16608 ) ( not ( = ?auto_16607 ?auto_16608 ) ) ( not ( = ?auto_16607 ?auto_16623 ) ) ( not ( = ?auto_16608 ?auto_16623 ) ) ( not ( = ?auto_16618 ?auto_16631 ) ) ( IS-CRATE ?auto_16607 ) ( not ( = ?auto_16622 ?auto_16614 ) ) ( HOIST-AT ?auto_16621 ?auto_16622 ) ( AVAILABLE ?auto_16621 ) ( SURFACE-AT ?auto_16607 ?auto_16622 ) ( ON ?auto_16607 ?auto_16628 ) ( CLEAR ?auto_16607 ) ( not ( = ?auto_16606 ?auto_16607 ) ) ( not ( = ?auto_16606 ?auto_16628 ) ) ( not ( = ?auto_16607 ?auto_16628 ) ) ( not ( = ?auto_16618 ?auto_16621 ) ) ( SURFACE-AT ?auto_16605 ?auto_16614 ) ( CLEAR ?auto_16605 ) ( IS-CRATE ?auto_16606 ) ( AVAILABLE ?auto_16618 ) ( AVAILABLE ?auto_16613 ) ( SURFACE-AT ?auto_16606 ?auto_16617 ) ( ON ?auto_16606 ?auto_16626 ) ( CLEAR ?auto_16606 ) ( TRUCK-AT ?auto_16616 ?auto_16614 ) ( not ( = ?auto_16605 ?auto_16606 ) ) ( not ( = ?auto_16605 ?auto_16626 ) ) ( not ( = ?auto_16606 ?auto_16626 ) ) ( not ( = ?auto_16605 ?auto_16607 ) ) ( not ( = ?auto_16605 ?auto_16628 ) ) ( not ( = ?auto_16607 ?auto_16626 ) ) ( not ( = ?auto_16622 ?auto_16617 ) ) ( not ( = ?auto_16621 ?auto_16613 ) ) ( not ( = ?auto_16628 ?auto_16626 ) ) ( not ( = ?auto_16605 ?auto_16608 ) ) ( not ( = ?auto_16605 ?auto_16623 ) ) ( not ( = ?auto_16606 ?auto_16608 ) ) ( not ( = ?auto_16606 ?auto_16623 ) ) ( not ( = ?auto_16608 ?auto_16628 ) ) ( not ( = ?auto_16608 ?auto_16626 ) ) ( not ( = ?auto_16619 ?auto_16622 ) ) ( not ( = ?auto_16619 ?auto_16617 ) ) ( not ( = ?auto_16631 ?auto_16621 ) ) ( not ( = ?auto_16631 ?auto_16613 ) ) ( not ( = ?auto_16623 ?auto_16628 ) ) ( not ( = ?auto_16623 ?auto_16626 ) ) ( not ( = ?auto_16605 ?auto_16609 ) ) ( not ( = ?auto_16605 ?auto_16627 ) ) ( not ( = ?auto_16606 ?auto_16609 ) ) ( not ( = ?auto_16606 ?auto_16627 ) ) ( not ( = ?auto_16607 ?auto_16609 ) ) ( not ( = ?auto_16607 ?auto_16627 ) ) ( not ( = ?auto_16609 ?auto_16623 ) ) ( not ( = ?auto_16609 ?auto_16628 ) ) ( not ( = ?auto_16609 ?auto_16626 ) ) ( not ( = ?auto_16632 ?auto_16619 ) ) ( not ( = ?auto_16632 ?auto_16622 ) ) ( not ( = ?auto_16632 ?auto_16617 ) ) ( not ( = ?auto_16630 ?auto_16631 ) ) ( not ( = ?auto_16630 ?auto_16621 ) ) ( not ( = ?auto_16630 ?auto_16613 ) ) ( not ( = ?auto_16627 ?auto_16623 ) ) ( not ( = ?auto_16627 ?auto_16628 ) ) ( not ( = ?auto_16627 ?auto_16626 ) ) ( not ( = ?auto_16605 ?auto_16610 ) ) ( not ( = ?auto_16605 ?auto_16634 ) ) ( not ( = ?auto_16606 ?auto_16610 ) ) ( not ( = ?auto_16606 ?auto_16634 ) ) ( not ( = ?auto_16607 ?auto_16610 ) ) ( not ( = ?auto_16607 ?auto_16634 ) ) ( not ( = ?auto_16608 ?auto_16610 ) ) ( not ( = ?auto_16608 ?auto_16634 ) ) ( not ( = ?auto_16610 ?auto_16627 ) ) ( not ( = ?auto_16610 ?auto_16623 ) ) ( not ( = ?auto_16610 ?auto_16628 ) ) ( not ( = ?auto_16610 ?auto_16626 ) ) ( not ( = ?auto_16629 ?auto_16632 ) ) ( not ( = ?auto_16629 ?auto_16619 ) ) ( not ( = ?auto_16629 ?auto_16622 ) ) ( not ( = ?auto_16629 ?auto_16617 ) ) ( not ( = ?auto_16620 ?auto_16630 ) ) ( not ( = ?auto_16620 ?auto_16631 ) ) ( not ( = ?auto_16620 ?auto_16621 ) ) ( not ( = ?auto_16620 ?auto_16613 ) ) ( not ( = ?auto_16634 ?auto_16627 ) ) ( not ( = ?auto_16634 ?auto_16623 ) ) ( not ( = ?auto_16634 ?auto_16628 ) ) ( not ( = ?auto_16634 ?auto_16626 ) ) ( not ( = ?auto_16605 ?auto_16611 ) ) ( not ( = ?auto_16605 ?auto_16633 ) ) ( not ( = ?auto_16606 ?auto_16611 ) ) ( not ( = ?auto_16606 ?auto_16633 ) ) ( not ( = ?auto_16607 ?auto_16611 ) ) ( not ( = ?auto_16607 ?auto_16633 ) ) ( not ( = ?auto_16608 ?auto_16611 ) ) ( not ( = ?auto_16608 ?auto_16633 ) ) ( not ( = ?auto_16609 ?auto_16611 ) ) ( not ( = ?auto_16609 ?auto_16633 ) ) ( not ( = ?auto_16611 ?auto_16634 ) ) ( not ( = ?auto_16611 ?auto_16627 ) ) ( not ( = ?auto_16611 ?auto_16623 ) ) ( not ( = ?auto_16611 ?auto_16628 ) ) ( not ( = ?auto_16611 ?auto_16626 ) ) ( not ( = ?auto_16624 ?auto_16629 ) ) ( not ( = ?auto_16624 ?auto_16632 ) ) ( not ( = ?auto_16624 ?auto_16619 ) ) ( not ( = ?auto_16624 ?auto_16622 ) ) ( not ( = ?auto_16624 ?auto_16617 ) ) ( not ( = ?auto_16625 ?auto_16620 ) ) ( not ( = ?auto_16625 ?auto_16630 ) ) ( not ( = ?auto_16625 ?auto_16631 ) ) ( not ( = ?auto_16625 ?auto_16621 ) ) ( not ( = ?auto_16625 ?auto_16613 ) ) ( not ( = ?auto_16633 ?auto_16634 ) ) ( not ( = ?auto_16633 ?auto_16627 ) ) ( not ( = ?auto_16633 ?auto_16623 ) ) ( not ( = ?auto_16633 ?auto_16628 ) ) ( not ( = ?auto_16633 ?auto_16626 ) ) ( not ( = ?auto_16605 ?auto_16612 ) ) ( not ( = ?auto_16605 ?auto_16615 ) ) ( not ( = ?auto_16606 ?auto_16612 ) ) ( not ( = ?auto_16606 ?auto_16615 ) ) ( not ( = ?auto_16607 ?auto_16612 ) ) ( not ( = ?auto_16607 ?auto_16615 ) ) ( not ( = ?auto_16608 ?auto_16612 ) ) ( not ( = ?auto_16608 ?auto_16615 ) ) ( not ( = ?auto_16609 ?auto_16612 ) ) ( not ( = ?auto_16609 ?auto_16615 ) ) ( not ( = ?auto_16610 ?auto_16612 ) ) ( not ( = ?auto_16610 ?auto_16615 ) ) ( not ( = ?auto_16612 ?auto_16633 ) ) ( not ( = ?auto_16612 ?auto_16634 ) ) ( not ( = ?auto_16612 ?auto_16627 ) ) ( not ( = ?auto_16612 ?auto_16623 ) ) ( not ( = ?auto_16612 ?auto_16628 ) ) ( not ( = ?auto_16612 ?auto_16626 ) ) ( not ( = ?auto_16615 ?auto_16633 ) ) ( not ( = ?auto_16615 ?auto_16634 ) ) ( not ( = ?auto_16615 ?auto_16627 ) ) ( not ( = ?auto_16615 ?auto_16623 ) ) ( not ( = ?auto_16615 ?auto_16628 ) ) ( not ( = ?auto_16615 ?auto_16626 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16605 ?auto_16606 ?auto_16607 ?auto_16608 ?auto_16609 ?auto_16610 ?auto_16611 )
      ( MAKE-1CRATE ?auto_16611 ?auto_16612 )
      ( MAKE-7CRATE-VERIFY ?auto_16605 ?auto_16606 ?auto_16607 ?auto_16608 ?auto_16609 ?auto_16610 ?auto_16611 ?auto_16612 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_16654 - SURFACE
      ?auto_16655 - SURFACE
      ?auto_16656 - SURFACE
      ?auto_16657 - SURFACE
      ?auto_16658 - SURFACE
      ?auto_16659 - SURFACE
      ?auto_16660 - SURFACE
      ?auto_16661 - SURFACE
      ?auto_16662 - SURFACE
    )
    :vars
    (
      ?auto_16667 - HOIST
      ?auto_16666 - PLACE
      ?auto_16663 - PLACE
      ?auto_16668 - HOIST
      ?auto_16665 - SURFACE
      ?auto_16670 - PLACE
      ?auto_16676 - HOIST
      ?auto_16672 - SURFACE
      ?auto_16675 - PLACE
      ?auto_16687 - HOIST
      ?auto_16674 - SURFACE
      ?auto_16680 - PLACE
      ?auto_16669 - HOIST
      ?auto_16678 - SURFACE
      ?auto_16684 - PLACE
      ?auto_16682 - HOIST
      ?auto_16679 - SURFACE
      ?auto_16677 - PLACE
      ?auto_16683 - HOIST
      ?auto_16686 - SURFACE
      ?auto_16671 - PLACE
      ?auto_16673 - HOIST
      ?auto_16681 - SURFACE
      ?auto_16685 - SURFACE
      ?auto_16664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16667 ?auto_16666 ) ( IS-CRATE ?auto_16662 ) ( not ( = ?auto_16663 ?auto_16666 ) ) ( HOIST-AT ?auto_16668 ?auto_16663 ) ( AVAILABLE ?auto_16668 ) ( SURFACE-AT ?auto_16662 ?auto_16663 ) ( ON ?auto_16662 ?auto_16665 ) ( CLEAR ?auto_16662 ) ( not ( = ?auto_16661 ?auto_16662 ) ) ( not ( = ?auto_16661 ?auto_16665 ) ) ( not ( = ?auto_16662 ?auto_16665 ) ) ( not ( = ?auto_16667 ?auto_16668 ) ) ( IS-CRATE ?auto_16661 ) ( not ( = ?auto_16670 ?auto_16666 ) ) ( HOIST-AT ?auto_16676 ?auto_16670 ) ( SURFACE-AT ?auto_16661 ?auto_16670 ) ( ON ?auto_16661 ?auto_16672 ) ( CLEAR ?auto_16661 ) ( not ( = ?auto_16660 ?auto_16661 ) ) ( not ( = ?auto_16660 ?auto_16672 ) ) ( not ( = ?auto_16661 ?auto_16672 ) ) ( not ( = ?auto_16667 ?auto_16676 ) ) ( IS-CRATE ?auto_16660 ) ( not ( = ?auto_16675 ?auto_16666 ) ) ( HOIST-AT ?auto_16687 ?auto_16675 ) ( AVAILABLE ?auto_16687 ) ( SURFACE-AT ?auto_16660 ?auto_16675 ) ( ON ?auto_16660 ?auto_16674 ) ( CLEAR ?auto_16660 ) ( not ( = ?auto_16659 ?auto_16660 ) ) ( not ( = ?auto_16659 ?auto_16674 ) ) ( not ( = ?auto_16660 ?auto_16674 ) ) ( not ( = ?auto_16667 ?auto_16687 ) ) ( IS-CRATE ?auto_16659 ) ( not ( = ?auto_16680 ?auto_16666 ) ) ( HOIST-AT ?auto_16669 ?auto_16680 ) ( AVAILABLE ?auto_16669 ) ( SURFACE-AT ?auto_16659 ?auto_16680 ) ( ON ?auto_16659 ?auto_16678 ) ( CLEAR ?auto_16659 ) ( not ( = ?auto_16658 ?auto_16659 ) ) ( not ( = ?auto_16658 ?auto_16678 ) ) ( not ( = ?auto_16659 ?auto_16678 ) ) ( not ( = ?auto_16667 ?auto_16669 ) ) ( IS-CRATE ?auto_16658 ) ( not ( = ?auto_16684 ?auto_16666 ) ) ( HOIST-AT ?auto_16682 ?auto_16684 ) ( AVAILABLE ?auto_16682 ) ( SURFACE-AT ?auto_16658 ?auto_16684 ) ( ON ?auto_16658 ?auto_16679 ) ( CLEAR ?auto_16658 ) ( not ( = ?auto_16657 ?auto_16658 ) ) ( not ( = ?auto_16657 ?auto_16679 ) ) ( not ( = ?auto_16658 ?auto_16679 ) ) ( not ( = ?auto_16667 ?auto_16682 ) ) ( IS-CRATE ?auto_16657 ) ( not ( = ?auto_16677 ?auto_16666 ) ) ( HOIST-AT ?auto_16683 ?auto_16677 ) ( AVAILABLE ?auto_16683 ) ( SURFACE-AT ?auto_16657 ?auto_16677 ) ( ON ?auto_16657 ?auto_16686 ) ( CLEAR ?auto_16657 ) ( not ( = ?auto_16656 ?auto_16657 ) ) ( not ( = ?auto_16656 ?auto_16686 ) ) ( not ( = ?auto_16657 ?auto_16686 ) ) ( not ( = ?auto_16667 ?auto_16683 ) ) ( IS-CRATE ?auto_16656 ) ( not ( = ?auto_16671 ?auto_16666 ) ) ( HOIST-AT ?auto_16673 ?auto_16671 ) ( AVAILABLE ?auto_16673 ) ( SURFACE-AT ?auto_16656 ?auto_16671 ) ( ON ?auto_16656 ?auto_16681 ) ( CLEAR ?auto_16656 ) ( not ( = ?auto_16655 ?auto_16656 ) ) ( not ( = ?auto_16655 ?auto_16681 ) ) ( not ( = ?auto_16656 ?auto_16681 ) ) ( not ( = ?auto_16667 ?auto_16673 ) ) ( SURFACE-AT ?auto_16654 ?auto_16666 ) ( CLEAR ?auto_16654 ) ( IS-CRATE ?auto_16655 ) ( AVAILABLE ?auto_16667 ) ( AVAILABLE ?auto_16676 ) ( SURFACE-AT ?auto_16655 ?auto_16670 ) ( ON ?auto_16655 ?auto_16685 ) ( CLEAR ?auto_16655 ) ( TRUCK-AT ?auto_16664 ?auto_16666 ) ( not ( = ?auto_16654 ?auto_16655 ) ) ( not ( = ?auto_16654 ?auto_16685 ) ) ( not ( = ?auto_16655 ?auto_16685 ) ) ( not ( = ?auto_16654 ?auto_16656 ) ) ( not ( = ?auto_16654 ?auto_16681 ) ) ( not ( = ?auto_16656 ?auto_16685 ) ) ( not ( = ?auto_16671 ?auto_16670 ) ) ( not ( = ?auto_16673 ?auto_16676 ) ) ( not ( = ?auto_16681 ?auto_16685 ) ) ( not ( = ?auto_16654 ?auto_16657 ) ) ( not ( = ?auto_16654 ?auto_16686 ) ) ( not ( = ?auto_16655 ?auto_16657 ) ) ( not ( = ?auto_16655 ?auto_16686 ) ) ( not ( = ?auto_16657 ?auto_16681 ) ) ( not ( = ?auto_16657 ?auto_16685 ) ) ( not ( = ?auto_16677 ?auto_16671 ) ) ( not ( = ?auto_16677 ?auto_16670 ) ) ( not ( = ?auto_16683 ?auto_16673 ) ) ( not ( = ?auto_16683 ?auto_16676 ) ) ( not ( = ?auto_16686 ?auto_16681 ) ) ( not ( = ?auto_16686 ?auto_16685 ) ) ( not ( = ?auto_16654 ?auto_16658 ) ) ( not ( = ?auto_16654 ?auto_16679 ) ) ( not ( = ?auto_16655 ?auto_16658 ) ) ( not ( = ?auto_16655 ?auto_16679 ) ) ( not ( = ?auto_16656 ?auto_16658 ) ) ( not ( = ?auto_16656 ?auto_16679 ) ) ( not ( = ?auto_16658 ?auto_16686 ) ) ( not ( = ?auto_16658 ?auto_16681 ) ) ( not ( = ?auto_16658 ?auto_16685 ) ) ( not ( = ?auto_16684 ?auto_16677 ) ) ( not ( = ?auto_16684 ?auto_16671 ) ) ( not ( = ?auto_16684 ?auto_16670 ) ) ( not ( = ?auto_16682 ?auto_16683 ) ) ( not ( = ?auto_16682 ?auto_16673 ) ) ( not ( = ?auto_16682 ?auto_16676 ) ) ( not ( = ?auto_16679 ?auto_16686 ) ) ( not ( = ?auto_16679 ?auto_16681 ) ) ( not ( = ?auto_16679 ?auto_16685 ) ) ( not ( = ?auto_16654 ?auto_16659 ) ) ( not ( = ?auto_16654 ?auto_16678 ) ) ( not ( = ?auto_16655 ?auto_16659 ) ) ( not ( = ?auto_16655 ?auto_16678 ) ) ( not ( = ?auto_16656 ?auto_16659 ) ) ( not ( = ?auto_16656 ?auto_16678 ) ) ( not ( = ?auto_16657 ?auto_16659 ) ) ( not ( = ?auto_16657 ?auto_16678 ) ) ( not ( = ?auto_16659 ?auto_16679 ) ) ( not ( = ?auto_16659 ?auto_16686 ) ) ( not ( = ?auto_16659 ?auto_16681 ) ) ( not ( = ?auto_16659 ?auto_16685 ) ) ( not ( = ?auto_16680 ?auto_16684 ) ) ( not ( = ?auto_16680 ?auto_16677 ) ) ( not ( = ?auto_16680 ?auto_16671 ) ) ( not ( = ?auto_16680 ?auto_16670 ) ) ( not ( = ?auto_16669 ?auto_16682 ) ) ( not ( = ?auto_16669 ?auto_16683 ) ) ( not ( = ?auto_16669 ?auto_16673 ) ) ( not ( = ?auto_16669 ?auto_16676 ) ) ( not ( = ?auto_16678 ?auto_16679 ) ) ( not ( = ?auto_16678 ?auto_16686 ) ) ( not ( = ?auto_16678 ?auto_16681 ) ) ( not ( = ?auto_16678 ?auto_16685 ) ) ( not ( = ?auto_16654 ?auto_16660 ) ) ( not ( = ?auto_16654 ?auto_16674 ) ) ( not ( = ?auto_16655 ?auto_16660 ) ) ( not ( = ?auto_16655 ?auto_16674 ) ) ( not ( = ?auto_16656 ?auto_16660 ) ) ( not ( = ?auto_16656 ?auto_16674 ) ) ( not ( = ?auto_16657 ?auto_16660 ) ) ( not ( = ?auto_16657 ?auto_16674 ) ) ( not ( = ?auto_16658 ?auto_16660 ) ) ( not ( = ?auto_16658 ?auto_16674 ) ) ( not ( = ?auto_16660 ?auto_16678 ) ) ( not ( = ?auto_16660 ?auto_16679 ) ) ( not ( = ?auto_16660 ?auto_16686 ) ) ( not ( = ?auto_16660 ?auto_16681 ) ) ( not ( = ?auto_16660 ?auto_16685 ) ) ( not ( = ?auto_16675 ?auto_16680 ) ) ( not ( = ?auto_16675 ?auto_16684 ) ) ( not ( = ?auto_16675 ?auto_16677 ) ) ( not ( = ?auto_16675 ?auto_16671 ) ) ( not ( = ?auto_16675 ?auto_16670 ) ) ( not ( = ?auto_16687 ?auto_16669 ) ) ( not ( = ?auto_16687 ?auto_16682 ) ) ( not ( = ?auto_16687 ?auto_16683 ) ) ( not ( = ?auto_16687 ?auto_16673 ) ) ( not ( = ?auto_16687 ?auto_16676 ) ) ( not ( = ?auto_16674 ?auto_16678 ) ) ( not ( = ?auto_16674 ?auto_16679 ) ) ( not ( = ?auto_16674 ?auto_16686 ) ) ( not ( = ?auto_16674 ?auto_16681 ) ) ( not ( = ?auto_16674 ?auto_16685 ) ) ( not ( = ?auto_16654 ?auto_16661 ) ) ( not ( = ?auto_16654 ?auto_16672 ) ) ( not ( = ?auto_16655 ?auto_16661 ) ) ( not ( = ?auto_16655 ?auto_16672 ) ) ( not ( = ?auto_16656 ?auto_16661 ) ) ( not ( = ?auto_16656 ?auto_16672 ) ) ( not ( = ?auto_16657 ?auto_16661 ) ) ( not ( = ?auto_16657 ?auto_16672 ) ) ( not ( = ?auto_16658 ?auto_16661 ) ) ( not ( = ?auto_16658 ?auto_16672 ) ) ( not ( = ?auto_16659 ?auto_16661 ) ) ( not ( = ?auto_16659 ?auto_16672 ) ) ( not ( = ?auto_16661 ?auto_16674 ) ) ( not ( = ?auto_16661 ?auto_16678 ) ) ( not ( = ?auto_16661 ?auto_16679 ) ) ( not ( = ?auto_16661 ?auto_16686 ) ) ( not ( = ?auto_16661 ?auto_16681 ) ) ( not ( = ?auto_16661 ?auto_16685 ) ) ( not ( = ?auto_16672 ?auto_16674 ) ) ( not ( = ?auto_16672 ?auto_16678 ) ) ( not ( = ?auto_16672 ?auto_16679 ) ) ( not ( = ?auto_16672 ?auto_16686 ) ) ( not ( = ?auto_16672 ?auto_16681 ) ) ( not ( = ?auto_16672 ?auto_16685 ) ) ( not ( = ?auto_16654 ?auto_16662 ) ) ( not ( = ?auto_16654 ?auto_16665 ) ) ( not ( = ?auto_16655 ?auto_16662 ) ) ( not ( = ?auto_16655 ?auto_16665 ) ) ( not ( = ?auto_16656 ?auto_16662 ) ) ( not ( = ?auto_16656 ?auto_16665 ) ) ( not ( = ?auto_16657 ?auto_16662 ) ) ( not ( = ?auto_16657 ?auto_16665 ) ) ( not ( = ?auto_16658 ?auto_16662 ) ) ( not ( = ?auto_16658 ?auto_16665 ) ) ( not ( = ?auto_16659 ?auto_16662 ) ) ( not ( = ?auto_16659 ?auto_16665 ) ) ( not ( = ?auto_16660 ?auto_16662 ) ) ( not ( = ?auto_16660 ?auto_16665 ) ) ( not ( = ?auto_16662 ?auto_16672 ) ) ( not ( = ?auto_16662 ?auto_16674 ) ) ( not ( = ?auto_16662 ?auto_16678 ) ) ( not ( = ?auto_16662 ?auto_16679 ) ) ( not ( = ?auto_16662 ?auto_16686 ) ) ( not ( = ?auto_16662 ?auto_16681 ) ) ( not ( = ?auto_16662 ?auto_16685 ) ) ( not ( = ?auto_16663 ?auto_16670 ) ) ( not ( = ?auto_16663 ?auto_16675 ) ) ( not ( = ?auto_16663 ?auto_16680 ) ) ( not ( = ?auto_16663 ?auto_16684 ) ) ( not ( = ?auto_16663 ?auto_16677 ) ) ( not ( = ?auto_16663 ?auto_16671 ) ) ( not ( = ?auto_16668 ?auto_16676 ) ) ( not ( = ?auto_16668 ?auto_16687 ) ) ( not ( = ?auto_16668 ?auto_16669 ) ) ( not ( = ?auto_16668 ?auto_16682 ) ) ( not ( = ?auto_16668 ?auto_16683 ) ) ( not ( = ?auto_16668 ?auto_16673 ) ) ( not ( = ?auto_16665 ?auto_16672 ) ) ( not ( = ?auto_16665 ?auto_16674 ) ) ( not ( = ?auto_16665 ?auto_16678 ) ) ( not ( = ?auto_16665 ?auto_16679 ) ) ( not ( = ?auto_16665 ?auto_16686 ) ) ( not ( = ?auto_16665 ?auto_16681 ) ) ( not ( = ?auto_16665 ?auto_16685 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16654 ?auto_16655 ?auto_16656 ?auto_16657 ?auto_16658 ?auto_16659 ?auto_16660 ?auto_16661 )
      ( MAKE-1CRATE ?auto_16661 ?auto_16662 )
      ( MAKE-8CRATE-VERIFY ?auto_16654 ?auto_16655 ?auto_16656 ?auto_16657 ?auto_16658 ?auto_16659 ?auto_16660 ?auto_16661 ?auto_16662 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_16708 - SURFACE
      ?auto_16709 - SURFACE
      ?auto_16710 - SURFACE
      ?auto_16711 - SURFACE
      ?auto_16712 - SURFACE
      ?auto_16713 - SURFACE
      ?auto_16714 - SURFACE
      ?auto_16715 - SURFACE
      ?auto_16716 - SURFACE
      ?auto_16717 - SURFACE
    )
    :vars
    (
      ?auto_16719 - HOIST
      ?auto_16722 - PLACE
      ?auto_16721 - PLACE
      ?auto_16723 - HOIST
      ?auto_16720 - SURFACE
      ?auto_16740 - PLACE
      ?auto_16743 - HOIST
      ?auto_16724 - SURFACE
      ?auto_16738 - PLACE
      ?auto_16727 - HOIST
      ?auto_16739 - SURFACE
      ?auto_16728 - PLACE
      ?auto_16736 - HOIST
      ?auto_16729 - SURFACE
      ?auto_16734 - PLACE
      ?auto_16725 - HOIST
      ?auto_16733 - SURFACE
      ?auto_16731 - PLACE
      ?auto_16726 - HOIST
      ?auto_16732 - SURFACE
      ?auto_16742 - SURFACE
      ?auto_16741 - PLACE
      ?auto_16730 - HOIST
      ?auto_16735 - SURFACE
      ?auto_16737 - SURFACE
      ?auto_16718 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16719 ?auto_16722 ) ( IS-CRATE ?auto_16717 ) ( not ( = ?auto_16721 ?auto_16722 ) ) ( HOIST-AT ?auto_16723 ?auto_16721 ) ( SURFACE-AT ?auto_16717 ?auto_16721 ) ( ON ?auto_16717 ?auto_16720 ) ( CLEAR ?auto_16717 ) ( not ( = ?auto_16716 ?auto_16717 ) ) ( not ( = ?auto_16716 ?auto_16720 ) ) ( not ( = ?auto_16717 ?auto_16720 ) ) ( not ( = ?auto_16719 ?auto_16723 ) ) ( IS-CRATE ?auto_16716 ) ( not ( = ?auto_16740 ?auto_16722 ) ) ( HOIST-AT ?auto_16743 ?auto_16740 ) ( AVAILABLE ?auto_16743 ) ( SURFACE-AT ?auto_16716 ?auto_16740 ) ( ON ?auto_16716 ?auto_16724 ) ( CLEAR ?auto_16716 ) ( not ( = ?auto_16715 ?auto_16716 ) ) ( not ( = ?auto_16715 ?auto_16724 ) ) ( not ( = ?auto_16716 ?auto_16724 ) ) ( not ( = ?auto_16719 ?auto_16743 ) ) ( IS-CRATE ?auto_16715 ) ( not ( = ?auto_16738 ?auto_16722 ) ) ( HOIST-AT ?auto_16727 ?auto_16738 ) ( SURFACE-AT ?auto_16715 ?auto_16738 ) ( ON ?auto_16715 ?auto_16739 ) ( CLEAR ?auto_16715 ) ( not ( = ?auto_16714 ?auto_16715 ) ) ( not ( = ?auto_16714 ?auto_16739 ) ) ( not ( = ?auto_16715 ?auto_16739 ) ) ( not ( = ?auto_16719 ?auto_16727 ) ) ( IS-CRATE ?auto_16714 ) ( not ( = ?auto_16728 ?auto_16722 ) ) ( HOIST-AT ?auto_16736 ?auto_16728 ) ( AVAILABLE ?auto_16736 ) ( SURFACE-AT ?auto_16714 ?auto_16728 ) ( ON ?auto_16714 ?auto_16729 ) ( CLEAR ?auto_16714 ) ( not ( = ?auto_16713 ?auto_16714 ) ) ( not ( = ?auto_16713 ?auto_16729 ) ) ( not ( = ?auto_16714 ?auto_16729 ) ) ( not ( = ?auto_16719 ?auto_16736 ) ) ( IS-CRATE ?auto_16713 ) ( not ( = ?auto_16734 ?auto_16722 ) ) ( HOIST-AT ?auto_16725 ?auto_16734 ) ( AVAILABLE ?auto_16725 ) ( SURFACE-AT ?auto_16713 ?auto_16734 ) ( ON ?auto_16713 ?auto_16733 ) ( CLEAR ?auto_16713 ) ( not ( = ?auto_16712 ?auto_16713 ) ) ( not ( = ?auto_16712 ?auto_16733 ) ) ( not ( = ?auto_16713 ?auto_16733 ) ) ( not ( = ?auto_16719 ?auto_16725 ) ) ( IS-CRATE ?auto_16712 ) ( not ( = ?auto_16731 ?auto_16722 ) ) ( HOIST-AT ?auto_16726 ?auto_16731 ) ( AVAILABLE ?auto_16726 ) ( SURFACE-AT ?auto_16712 ?auto_16731 ) ( ON ?auto_16712 ?auto_16732 ) ( CLEAR ?auto_16712 ) ( not ( = ?auto_16711 ?auto_16712 ) ) ( not ( = ?auto_16711 ?auto_16732 ) ) ( not ( = ?auto_16712 ?auto_16732 ) ) ( not ( = ?auto_16719 ?auto_16726 ) ) ( IS-CRATE ?auto_16711 ) ( AVAILABLE ?auto_16723 ) ( SURFACE-AT ?auto_16711 ?auto_16721 ) ( ON ?auto_16711 ?auto_16742 ) ( CLEAR ?auto_16711 ) ( not ( = ?auto_16710 ?auto_16711 ) ) ( not ( = ?auto_16710 ?auto_16742 ) ) ( not ( = ?auto_16711 ?auto_16742 ) ) ( IS-CRATE ?auto_16710 ) ( not ( = ?auto_16741 ?auto_16722 ) ) ( HOIST-AT ?auto_16730 ?auto_16741 ) ( AVAILABLE ?auto_16730 ) ( SURFACE-AT ?auto_16710 ?auto_16741 ) ( ON ?auto_16710 ?auto_16735 ) ( CLEAR ?auto_16710 ) ( not ( = ?auto_16709 ?auto_16710 ) ) ( not ( = ?auto_16709 ?auto_16735 ) ) ( not ( = ?auto_16710 ?auto_16735 ) ) ( not ( = ?auto_16719 ?auto_16730 ) ) ( SURFACE-AT ?auto_16708 ?auto_16722 ) ( CLEAR ?auto_16708 ) ( IS-CRATE ?auto_16709 ) ( AVAILABLE ?auto_16719 ) ( AVAILABLE ?auto_16727 ) ( SURFACE-AT ?auto_16709 ?auto_16738 ) ( ON ?auto_16709 ?auto_16737 ) ( CLEAR ?auto_16709 ) ( TRUCK-AT ?auto_16718 ?auto_16722 ) ( not ( = ?auto_16708 ?auto_16709 ) ) ( not ( = ?auto_16708 ?auto_16737 ) ) ( not ( = ?auto_16709 ?auto_16737 ) ) ( not ( = ?auto_16708 ?auto_16710 ) ) ( not ( = ?auto_16708 ?auto_16735 ) ) ( not ( = ?auto_16710 ?auto_16737 ) ) ( not ( = ?auto_16741 ?auto_16738 ) ) ( not ( = ?auto_16730 ?auto_16727 ) ) ( not ( = ?auto_16735 ?auto_16737 ) ) ( not ( = ?auto_16708 ?auto_16711 ) ) ( not ( = ?auto_16708 ?auto_16742 ) ) ( not ( = ?auto_16709 ?auto_16711 ) ) ( not ( = ?auto_16709 ?auto_16742 ) ) ( not ( = ?auto_16711 ?auto_16735 ) ) ( not ( = ?auto_16711 ?auto_16737 ) ) ( not ( = ?auto_16721 ?auto_16741 ) ) ( not ( = ?auto_16721 ?auto_16738 ) ) ( not ( = ?auto_16723 ?auto_16730 ) ) ( not ( = ?auto_16723 ?auto_16727 ) ) ( not ( = ?auto_16742 ?auto_16735 ) ) ( not ( = ?auto_16742 ?auto_16737 ) ) ( not ( = ?auto_16708 ?auto_16712 ) ) ( not ( = ?auto_16708 ?auto_16732 ) ) ( not ( = ?auto_16709 ?auto_16712 ) ) ( not ( = ?auto_16709 ?auto_16732 ) ) ( not ( = ?auto_16710 ?auto_16712 ) ) ( not ( = ?auto_16710 ?auto_16732 ) ) ( not ( = ?auto_16712 ?auto_16742 ) ) ( not ( = ?auto_16712 ?auto_16735 ) ) ( not ( = ?auto_16712 ?auto_16737 ) ) ( not ( = ?auto_16731 ?auto_16721 ) ) ( not ( = ?auto_16731 ?auto_16741 ) ) ( not ( = ?auto_16731 ?auto_16738 ) ) ( not ( = ?auto_16726 ?auto_16723 ) ) ( not ( = ?auto_16726 ?auto_16730 ) ) ( not ( = ?auto_16726 ?auto_16727 ) ) ( not ( = ?auto_16732 ?auto_16742 ) ) ( not ( = ?auto_16732 ?auto_16735 ) ) ( not ( = ?auto_16732 ?auto_16737 ) ) ( not ( = ?auto_16708 ?auto_16713 ) ) ( not ( = ?auto_16708 ?auto_16733 ) ) ( not ( = ?auto_16709 ?auto_16713 ) ) ( not ( = ?auto_16709 ?auto_16733 ) ) ( not ( = ?auto_16710 ?auto_16713 ) ) ( not ( = ?auto_16710 ?auto_16733 ) ) ( not ( = ?auto_16711 ?auto_16713 ) ) ( not ( = ?auto_16711 ?auto_16733 ) ) ( not ( = ?auto_16713 ?auto_16732 ) ) ( not ( = ?auto_16713 ?auto_16742 ) ) ( not ( = ?auto_16713 ?auto_16735 ) ) ( not ( = ?auto_16713 ?auto_16737 ) ) ( not ( = ?auto_16734 ?auto_16731 ) ) ( not ( = ?auto_16734 ?auto_16721 ) ) ( not ( = ?auto_16734 ?auto_16741 ) ) ( not ( = ?auto_16734 ?auto_16738 ) ) ( not ( = ?auto_16725 ?auto_16726 ) ) ( not ( = ?auto_16725 ?auto_16723 ) ) ( not ( = ?auto_16725 ?auto_16730 ) ) ( not ( = ?auto_16725 ?auto_16727 ) ) ( not ( = ?auto_16733 ?auto_16732 ) ) ( not ( = ?auto_16733 ?auto_16742 ) ) ( not ( = ?auto_16733 ?auto_16735 ) ) ( not ( = ?auto_16733 ?auto_16737 ) ) ( not ( = ?auto_16708 ?auto_16714 ) ) ( not ( = ?auto_16708 ?auto_16729 ) ) ( not ( = ?auto_16709 ?auto_16714 ) ) ( not ( = ?auto_16709 ?auto_16729 ) ) ( not ( = ?auto_16710 ?auto_16714 ) ) ( not ( = ?auto_16710 ?auto_16729 ) ) ( not ( = ?auto_16711 ?auto_16714 ) ) ( not ( = ?auto_16711 ?auto_16729 ) ) ( not ( = ?auto_16712 ?auto_16714 ) ) ( not ( = ?auto_16712 ?auto_16729 ) ) ( not ( = ?auto_16714 ?auto_16733 ) ) ( not ( = ?auto_16714 ?auto_16732 ) ) ( not ( = ?auto_16714 ?auto_16742 ) ) ( not ( = ?auto_16714 ?auto_16735 ) ) ( not ( = ?auto_16714 ?auto_16737 ) ) ( not ( = ?auto_16728 ?auto_16734 ) ) ( not ( = ?auto_16728 ?auto_16731 ) ) ( not ( = ?auto_16728 ?auto_16721 ) ) ( not ( = ?auto_16728 ?auto_16741 ) ) ( not ( = ?auto_16728 ?auto_16738 ) ) ( not ( = ?auto_16736 ?auto_16725 ) ) ( not ( = ?auto_16736 ?auto_16726 ) ) ( not ( = ?auto_16736 ?auto_16723 ) ) ( not ( = ?auto_16736 ?auto_16730 ) ) ( not ( = ?auto_16736 ?auto_16727 ) ) ( not ( = ?auto_16729 ?auto_16733 ) ) ( not ( = ?auto_16729 ?auto_16732 ) ) ( not ( = ?auto_16729 ?auto_16742 ) ) ( not ( = ?auto_16729 ?auto_16735 ) ) ( not ( = ?auto_16729 ?auto_16737 ) ) ( not ( = ?auto_16708 ?auto_16715 ) ) ( not ( = ?auto_16708 ?auto_16739 ) ) ( not ( = ?auto_16709 ?auto_16715 ) ) ( not ( = ?auto_16709 ?auto_16739 ) ) ( not ( = ?auto_16710 ?auto_16715 ) ) ( not ( = ?auto_16710 ?auto_16739 ) ) ( not ( = ?auto_16711 ?auto_16715 ) ) ( not ( = ?auto_16711 ?auto_16739 ) ) ( not ( = ?auto_16712 ?auto_16715 ) ) ( not ( = ?auto_16712 ?auto_16739 ) ) ( not ( = ?auto_16713 ?auto_16715 ) ) ( not ( = ?auto_16713 ?auto_16739 ) ) ( not ( = ?auto_16715 ?auto_16729 ) ) ( not ( = ?auto_16715 ?auto_16733 ) ) ( not ( = ?auto_16715 ?auto_16732 ) ) ( not ( = ?auto_16715 ?auto_16742 ) ) ( not ( = ?auto_16715 ?auto_16735 ) ) ( not ( = ?auto_16715 ?auto_16737 ) ) ( not ( = ?auto_16739 ?auto_16729 ) ) ( not ( = ?auto_16739 ?auto_16733 ) ) ( not ( = ?auto_16739 ?auto_16732 ) ) ( not ( = ?auto_16739 ?auto_16742 ) ) ( not ( = ?auto_16739 ?auto_16735 ) ) ( not ( = ?auto_16739 ?auto_16737 ) ) ( not ( = ?auto_16708 ?auto_16716 ) ) ( not ( = ?auto_16708 ?auto_16724 ) ) ( not ( = ?auto_16709 ?auto_16716 ) ) ( not ( = ?auto_16709 ?auto_16724 ) ) ( not ( = ?auto_16710 ?auto_16716 ) ) ( not ( = ?auto_16710 ?auto_16724 ) ) ( not ( = ?auto_16711 ?auto_16716 ) ) ( not ( = ?auto_16711 ?auto_16724 ) ) ( not ( = ?auto_16712 ?auto_16716 ) ) ( not ( = ?auto_16712 ?auto_16724 ) ) ( not ( = ?auto_16713 ?auto_16716 ) ) ( not ( = ?auto_16713 ?auto_16724 ) ) ( not ( = ?auto_16714 ?auto_16716 ) ) ( not ( = ?auto_16714 ?auto_16724 ) ) ( not ( = ?auto_16716 ?auto_16739 ) ) ( not ( = ?auto_16716 ?auto_16729 ) ) ( not ( = ?auto_16716 ?auto_16733 ) ) ( not ( = ?auto_16716 ?auto_16732 ) ) ( not ( = ?auto_16716 ?auto_16742 ) ) ( not ( = ?auto_16716 ?auto_16735 ) ) ( not ( = ?auto_16716 ?auto_16737 ) ) ( not ( = ?auto_16740 ?auto_16738 ) ) ( not ( = ?auto_16740 ?auto_16728 ) ) ( not ( = ?auto_16740 ?auto_16734 ) ) ( not ( = ?auto_16740 ?auto_16731 ) ) ( not ( = ?auto_16740 ?auto_16721 ) ) ( not ( = ?auto_16740 ?auto_16741 ) ) ( not ( = ?auto_16743 ?auto_16727 ) ) ( not ( = ?auto_16743 ?auto_16736 ) ) ( not ( = ?auto_16743 ?auto_16725 ) ) ( not ( = ?auto_16743 ?auto_16726 ) ) ( not ( = ?auto_16743 ?auto_16723 ) ) ( not ( = ?auto_16743 ?auto_16730 ) ) ( not ( = ?auto_16724 ?auto_16739 ) ) ( not ( = ?auto_16724 ?auto_16729 ) ) ( not ( = ?auto_16724 ?auto_16733 ) ) ( not ( = ?auto_16724 ?auto_16732 ) ) ( not ( = ?auto_16724 ?auto_16742 ) ) ( not ( = ?auto_16724 ?auto_16735 ) ) ( not ( = ?auto_16724 ?auto_16737 ) ) ( not ( = ?auto_16708 ?auto_16717 ) ) ( not ( = ?auto_16708 ?auto_16720 ) ) ( not ( = ?auto_16709 ?auto_16717 ) ) ( not ( = ?auto_16709 ?auto_16720 ) ) ( not ( = ?auto_16710 ?auto_16717 ) ) ( not ( = ?auto_16710 ?auto_16720 ) ) ( not ( = ?auto_16711 ?auto_16717 ) ) ( not ( = ?auto_16711 ?auto_16720 ) ) ( not ( = ?auto_16712 ?auto_16717 ) ) ( not ( = ?auto_16712 ?auto_16720 ) ) ( not ( = ?auto_16713 ?auto_16717 ) ) ( not ( = ?auto_16713 ?auto_16720 ) ) ( not ( = ?auto_16714 ?auto_16717 ) ) ( not ( = ?auto_16714 ?auto_16720 ) ) ( not ( = ?auto_16715 ?auto_16717 ) ) ( not ( = ?auto_16715 ?auto_16720 ) ) ( not ( = ?auto_16717 ?auto_16724 ) ) ( not ( = ?auto_16717 ?auto_16739 ) ) ( not ( = ?auto_16717 ?auto_16729 ) ) ( not ( = ?auto_16717 ?auto_16733 ) ) ( not ( = ?auto_16717 ?auto_16732 ) ) ( not ( = ?auto_16717 ?auto_16742 ) ) ( not ( = ?auto_16717 ?auto_16735 ) ) ( not ( = ?auto_16717 ?auto_16737 ) ) ( not ( = ?auto_16720 ?auto_16724 ) ) ( not ( = ?auto_16720 ?auto_16739 ) ) ( not ( = ?auto_16720 ?auto_16729 ) ) ( not ( = ?auto_16720 ?auto_16733 ) ) ( not ( = ?auto_16720 ?auto_16732 ) ) ( not ( = ?auto_16720 ?auto_16742 ) ) ( not ( = ?auto_16720 ?auto_16735 ) ) ( not ( = ?auto_16720 ?auto_16737 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16708 ?auto_16709 ?auto_16710 ?auto_16711 ?auto_16712 ?auto_16713 ?auto_16714 ?auto_16715 ?auto_16716 )
      ( MAKE-1CRATE ?auto_16716 ?auto_16717 )
      ( MAKE-9CRATE-VERIFY ?auto_16708 ?auto_16709 ?auto_16710 ?auto_16711 ?auto_16712 ?auto_16713 ?auto_16714 ?auto_16715 ?auto_16716 ?auto_16717 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_16765 - SURFACE
      ?auto_16766 - SURFACE
      ?auto_16767 - SURFACE
      ?auto_16768 - SURFACE
      ?auto_16769 - SURFACE
      ?auto_16770 - SURFACE
      ?auto_16771 - SURFACE
      ?auto_16772 - SURFACE
      ?auto_16773 - SURFACE
      ?auto_16774 - SURFACE
      ?auto_16775 - SURFACE
    )
    :vars
    (
      ?auto_16781 - HOIST
      ?auto_16776 - PLACE
      ?auto_16778 - PLACE
      ?auto_16780 - HOIST
      ?auto_16779 - SURFACE
      ?auto_16787 - PLACE
      ?auto_16794 - HOIST
      ?auto_16795 - SURFACE
      ?auto_16796 - SURFACE
      ?auto_16790 - PLACE
      ?auto_16783 - HOIST
      ?auto_16798 - SURFACE
      ?auto_16801 - PLACE
      ?auto_16782 - HOIST
      ?auto_16800 - SURFACE
      ?auto_16797 - PLACE
      ?auto_16802 - HOIST
      ?auto_16793 - SURFACE
      ?auto_16788 - PLACE
      ?auto_16786 - HOIST
      ?auto_16792 - SURFACE
      ?auto_16789 - SURFACE
      ?auto_16785 - PLACE
      ?auto_16799 - HOIST
      ?auto_16791 - SURFACE
      ?auto_16784 - SURFACE
      ?auto_16777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16781 ?auto_16776 ) ( IS-CRATE ?auto_16775 ) ( not ( = ?auto_16778 ?auto_16776 ) ) ( HOIST-AT ?auto_16780 ?auto_16778 ) ( SURFACE-AT ?auto_16775 ?auto_16778 ) ( ON ?auto_16775 ?auto_16779 ) ( CLEAR ?auto_16775 ) ( not ( = ?auto_16774 ?auto_16775 ) ) ( not ( = ?auto_16774 ?auto_16779 ) ) ( not ( = ?auto_16775 ?auto_16779 ) ) ( not ( = ?auto_16781 ?auto_16780 ) ) ( IS-CRATE ?auto_16774 ) ( not ( = ?auto_16787 ?auto_16776 ) ) ( HOIST-AT ?auto_16794 ?auto_16787 ) ( SURFACE-AT ?auto_16774 ?auto_16787 ) ( ON ?auto_16774 ?auto_16795 ) ( CLEAR ?auto_16774 ) ( not ( = ?auto_16773 ?auto_16774 ) ) ( not ( = ?auto_16773 ?auto_16795 ) ) ( not ( = ?auto_16774 ?auto_16795 ) ) ( not ( = ?auto_16781 ?auto_16794 ) ) ( IS-CRATE ?auto_16773 ) ( AVAILABLE ?auto_16780 ) ( SURFACE-AT ?auto_16773 ?auto_16778 ) ( ON ?auto_16773 ?auto_16796 ) ( CLEAR ?auto_16773 ) ( not ( = ?auto_16772 ?auto_16773 ) ) ( not ( = ?auto_16772 ?auto_16796 ) ) ( not ( = ?auto_16773 ?auto_16796 ) ) ( IS-CRATE ?auto_16772 ) ( not ( = ?auto_16790 ?auto_16776 ) ) ( HOIST-AT ?auto_16783 ?auto_16790 ) ( SURFACE-AT ?auto_16772 ?auto_16790 ) ( ON ?auto_16772 ?auto_16798 ) ( CLEAR ?auto_16772 ) ( not ( = ?auto_16771 ?auto_16772 ) ) ( not ( = ?auto_16771 ?auto_16798 ) ) ( not ( = ?auto_16772 ?auto_16798 ) ) ( not ( = ?auto_16781 ?auto_16783 ) ) ( IS-CRATE ?auto_16771 ) ( not ( = ?auto_16801 ?auto_16776 ) ) ( HOIST-AT ?auto_16782 ?auto_16801 ) ( AVAILABLE ?auto_16782 ) ( SURFACE-AT ?auto_16771 ?auto_16801 ) ( ON ?auto_16771 ?auto_16800 ) ( CLEAR ?auto_16771 ) ( not ( = ?auto_16770 ?auto_16771 ) ) ( not ( = ?auto_16770 ?auto_16800 ) ) ( not ( = ?auto_16771 ?auto_16800 ) ) ( not ( = ?auto_16781 ?auto_16782 ) ) ( IS-CRATE ?auto_16770 ) ( not ( = ?auto_16797 ?auto_16776 ) ) ( HOIST-AT ?auto_16802 ?auto_16797 ) ( AVAILABLE ?auto_16802 ) ( SURFACE-AT ?auto_16770 ?auto_16797 ) ( ON ?auto_16770 ?auto_16793 ) ( CLEAR ?auto_16770 ) ( not ( = ?auto_16769 ?auto_16770 ) ) ( not ( = ?auto_16769 ?auto_16793 ) ) ( not ( = ?auto_16770 ?auto_16793 ) ) ( not ( = ?auto_16781 ?auto_16802 ) ) ( IS-CRATE ?auto_16769 ) ( not ( = ?auto_16788 ?auto_16776 ) ) ( HOIST-AT ?auto_16786 ?auto_16788 ) ( AVAILABLE ?auto_16786 ) ( SURFACE-AT ?auto_16769 ?auto_16788 ) ( ON ?auto_16769 ?auto_16792 ) ( CLEAR ?auto_16769 ) ( not ( = ?auto_16768 ?auto_16769 ) ) ( not ( = ?auto_16768 ?auto_16792 ) ) ( not ( = ?auto_16769 ?auto_16792 ) ) ( not ( = ?auto_16781 ?auto_16786 ) ) ( IS-CRATE ?auto_16768 ) ( AVAILABLE ?auto_16794 ) ( SURFACE-AT ?auto_16768 ?auto_16787 ) ( ON ?auto_16768 ?auto_16789 ) ( CLEAR ?auto_16768 ) ( not ( = ?auto_16767 ?auto_16768 ) ) ( not ( = ?auto_16767 ?auto_16789 ) ) ( not ( = ?auto_16768 ?auto_16789 ) ) ( IS-CRATE ?auto_16767 ) ( not ( = ?auto_16785 ?auto_16776 ) ) ( HOIST-AT ?auto_16799 ?auto_16785 ) ( AVAILABLE ?auto_16799 ) ( SURFACE-AT ?auto_16767 ?auto_16785 ) ( ON ?auto_16767 ?auto_16791 ) ( CLEAR ?auto_16767 ) ( not ( = ?auto_16766 ?auto_16767 ) ) ( not ( = ?auto_16766 ?auto_16791 ) ) ( not ( = ?auto_16767 ?auto_16791 ) ) ( not ( = ?auto_16781 ?auto_16799 ) ) ( SURFACE-AT ?auto_16765 ?auto_16776 ) ( CLEAR ?auto_16765 ) ( IS-CRATE ?auto_16766 ) ( AVAILABLE ?auto_16781 ) ( AVAILABLE ?auto_16783 ) ( SURFACE-AT ?auto_16766 ?auto_16790 ) ( ON ?auto_16766 ?auto_16784 ) ( CLEAR ?auto_16766 ) ( TRUCK-AT ?auto_16777 ?auto_16776 ) ( not ( = ?auto_16765 ?auto_16766 ) ) ( not ( = ?auto_16765 ?auto_16784 ) ) ( not ( = ?auto_16766 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16767 ) ) ( not ( = ?auto_16765 ?auto_16791 ) ) ( not ( = ?auto_16767 ?auto_16784 ) ) ( not ( = ?auto_16785 ?auto_16790 ) ) ( not ( = ?auto_16799 ?auto_16783 ) ) ( not ( = ?auto_16791 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16768 ) ) ( not ( = ?auto_16765 ?auto_16789 ) ) ( not ( = ?auto_16766 ?auto_16768 ) ) ( not ( = ?auto_16766 ?auto_16789 ) ) ( not ( = ?auto_16768 ?auto_16791 ) ) ( not ( = ?auto_16768 ?auto_16784 ) ) ( not ( = ?auto_16787 ?auto_16785 ) ) ( not ( = ?auto_16787 ?auto_16790 ) ) ( not ( = ?auto_16794 ?auto_16799 ) ) ( not ( = ?auto_16794 ?auto_16783 ) ) ( not ( = ?auto_16789 ?auto_16791 ) ) ( not ( = ?auto_16789 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16769 ) ) ( not ( = ?auto_16765 ?auto_16792 ) ) ( not ( = ?auto_16766 ?auto_16769 ) ) ( not ( = ?auto_16766 ?auto_16792 ) ) ( not ( = ?auto_16767 ?auto_16769 ) ) ( not ( = ?auto_16767 ?auto_16792 ) ) ( not ( = ?auto_16769 ?auto_16789 ) ) ( not ( = ?auto_16769 ?auto_16791 ) ) ( not ( = ?auto_16769 ?auto_16784 ) ) ( not ( = ?auto_16788 ?auto_16787 ) ) ( not ( = ?auto_16788 ?auto_16785 ) ) ( not ( = ?auto_16788 ?auto_16790 ) ) ( not ( = ?auto_16786 ?auto_16794 ) ) ( not ( = ?auto_16786 ?auto_16799 ) ) ( not ( = ?auto_16786 ?auto_16783 ) ) ( not ( = ?auto_16792 ?auto_16789 ) ) ( not ( = ?auto_16792 ?auto_16791 ) ) ( not ( = ?auto_16792 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16770 ) ) ( not ( = ?auto_16765 ?auto_16793 ) ) ( not ( = ?auto_16766 ?auto_16770 ) ) ( not ( = ?auto_16766 ?auto_16793 ) ) ( not ( = ?auto_16767 ?auto_16770 ) ) ( not ( = ?auto_16767 ?auto_16793 ) ) ( not ( = ?auto_16768 ?auto_16770 ) ) ( not ( = ?auto_16768 ?auto_16793 ) ) ( not ( = ?auto_16770 ?auto_16792 ) ) ( not ( = ?auto_16770 ?auto_16789 ) ) ( not ( = ?auto_16770 ?auto_16791 ) ) ( not ( = ?auto_16770 ?auto_16784 ) ) ( not ( = ?auto_16797 ?auto_16788 ) ) ( not ( = ?auto_16797 ?auto_16787 ) ) ( not ( = ?auto_16797 ?auto_16785 ) ) ( not ( = ?auto_16797 ?auto_16790 ) ) ( not ( = ?auto_16802 ?auto_16786 ) ) ( not ( = ?auto_16802 ?auto_16794 ) ) ( not ( = ?auto_16802 ?auto_16799 ) ) ( not ( = ?auto_16802 ?auto_16783 ) ) ( not ( = ?auto_16793 ?auto_16792 ) ) ( not ( = ?auto_16793 ?auto_16789 ) ) ( not ( = ?auto_16793 ?auto_16791 ) ) ( not ( = ?auto_16793 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16771 ) ) ( not ( = ?auto_16765 ?auto_16800 ) ) ( not ( = ?auto_16766 ?auto_16771 ) ) ( not ( = ?auto_16766 ?auto_16800 ) ) ( not ( = ?auto_16767 ?auto_16771 ) ) ( not ( = ?auto_16767 ?auto_16800 ) ) ( not ( = ?auto_16768 ?auto_16771 ) ) ( not ( = ?auto_16768 ?auto_16800 ) ) ( not ( = ?auto_16769 ?auto_16771 ) ) ( not ( = ?auto_16769 ?auto_16800 ) ) ( not ( = ?auto_16771 ?auto_16793 ) ) ( not ( = ?auto_16771 ?auto_16792 ) ) ( not ( = ?auto_16771 ?auto_16789 ) ) ( not ( = ?auto_16771 ?auto_16791 ) ) ( not ( = ?auto_16771 ?auto_16784 ) ) ( not ( = ?auto_16801 ?auto_16797 ) ) ( not ( = ?auto_16801 ?auto_16788 ) ) ( not ( = ?auto_16801 ?auto_16787 ) ) ( not ( = ?auto_16801 ?auto_16785 ) ) ( not ( = ?auto_16801 ?auto_16790 ) ) ( not ( = ?auto_16782 ?auto_16802 ) ) ( not ( = ?auto_16782 ?auto_16786 ) ) ( not ( = ?auto_16782 ?auto_16794 ) ) ( not ( = ?auto_16782 ?auto_16799 ) ) ( not ( = ?auto_16782 ?auto_16783 ) ) ( not ( = ?auto_16800 ?auto_16793 ) ) ( not ( = ?auto_16800 ?auto_16792 ) ) ( not ( = ?auto_16800 ?auto_16789 ) ) ( not ( = ?auto_16800 ?auto_16791 ) ) ( not ( = ?auto_16800 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16772 ) ) ( not ( = ?auto_16765 ?auto_16798 ) ) ( not ( = ?auto_16766 ?auto_16772 ) ) ( not ( = ?auto_16766 ?auto_16798 ) ) ( not ( = ?auto_16767 ?auto_16772 ) ) ( not ( = ?auto_16767 ?auto_16798 ) ) ( not ( = ?auto_16768 ?auto_16772 ) ) ( not ( = ?auto_16768 ?auto_16798 ) ) ( not ( = ?auto_16769 ?auto_16772 ) ) ( not ( = ?auto_16769 ?auto_16798 ) ) ( not ( = ?auto_16770 ?auto_16772 ) ) ( not ( = ?auto_16770 ?auto_16798 ) ) ( not ( = ?auto_16772 ?auto_16800 ) ) ( not ( = ?auto_16772 ?auto_16793 ) ) ( not ( = ?auto_16772 ?auto_16792 ) ) ( not ( = ?auto_16772 ?auto_16789 ) ) ( not ( = ?auto_16772 ?auto_16791 ) ) ( not ( = ?auto_16772 ?auto_16784 ) ) ( not ( = ?auto_16798 ?auto_16800 ) ) ( not ( = ?auto_16798 ?auto_16793 ) ) ( not ( = ?auto_16798 ?auto_16792 ) ) ( not ( = ?auto_16798 ?auto_16789 ) ) ( not ( = ?auto_16798 ?auto_16791 ) ) ( not ( = ?auto_16798 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16773 ) ) ( not ( = ?auto_16765 ?auto_16796 ) ) ( not ( = ?auto_16766 ?auto_16773 ) ) ( not ( = ?auto_16766 ?auto_16796 ) ) ( not ( = ?auto_16767 ?auto_16773 ) ) ( not ( = ?auto_16767 ?auto_16796 ) ) ( not ( = ?auto_16768 ?auto_16773 ) ) ( not ( = ?auto_16768 ?auto_16796 ) ) ( not ( = ?auto_16769 ?auto_16773 ) ) ( not ( = ?auto_16769 ?auto_16796 ) ) ( not ( = ?auto_16770 ?auto_16773 ) ) ( not ( = ?auto_16770 ?auto_16796 ) ) ( not ( = ?auto_16771 ?auto_16773 ) ) ( not ( = ?auto_16771 ?auto_16796 ) ) ( not ( = ?auto_16773 ?auto_16798 ) ) ( not ( = ?auto_16773 ?auto_16800 ) ) ( not ( = ?auto_16773 ?auto_16793 ) ) ( not ( = ?auto_16773 ?auto_16792 ) ) ( not ( = ?auto_16773 ?auto_16789 ) ) ( not ( = ?auto_16773 ?auto_16791 ) ) ( not ( = ?auto_16773 ?auto_16784 ) ) ( not ( = ?auto_16778 ?auto_16790 ) ) ( not ( = ?auto_16778 ?auto_16801 ) ) ( not ( = ?auto_16778 ?auto_16797 ) ) ( not ( = ?auto_16778 ?auto_16788 ) ) ( not ( = ?auto_16778 ?auto_16787 ) ) ( not ( = ?auto_16778 ?auto_16785 ) ) ( not ( = ?auto_16780 ?auto_16783 ) ) ( not ( = ?auto_16780 ?auto_16782 ) ) ( not ( = ?auto_16780 ?auto_16802 ) ) ( not ( = ?auto_16780 ?auto_16786 ) ) ( not ( = ?auto_16780 ?auto_16794 ) ) ( not ( = ?auto_16780 ?auto_16799 ) ) ( not ( = ?auto_16796 ?auto_16798 ) ) ( not ( = ?auto_16796 ?auto_16800 ) ) ( not ( = ?auto_16796 ?auto_16793 ) ) ( not ( = ?auto_16796 ?auto_16792 ) ) ( not ( = ?auto_16796 ?auto_16789 ) ) ( not ( = ?auto_16796 ?auto_16791 ) ) ( not ( = ?auto_16796 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16774 ) ) ( not ( = ?auto_16765 ?auto_16795 ) ) ( not ( = ?auto_16766 ?auto_16774 ) ) ( not ( = ?auto_16766 ?auto_16795 ) ) ( not ( = ?auto_16767 ?auto_16774 ) ) ( not ( = ?auto_16767 ?auto_16795 ) ) ( not ( = ?auto_16768 ?auto_16774 ) ) ( not ( = ?auto_16768 ?auto_16795 ) ) ( not ( = ?auto_16769 ?auto_16774 ) ) ( not ( = ?auto_16769 ?auto_16795 ) ) ( not ( = ?auto_16770 ?auto_16774 ) ) ( not ( = ?auto_16770 ?auto_16795 ) ) ( not ( = ?auto_16771 ?auto_16774 ) ) ( not ( = ?auto_16771 ?auto_16795 ) ) ( not ( = ?auto_16772 ?auto_16774 ) ) ( not ( = ?auto_16772 ?auto_16795 ) ) ( not ( = ?auto_16774 ?auto_16796 ) ) ( not ( = ?auto_16774 ?auto_16798 ) ) ( not ( = ?auto_16774 ?auto_16800 ) ) ( not ( = ?auto_16774 ?auto_16793 ) ) ( not ( = ?auto_16774 ?auto_16792 ) ) ( not ( = ?auto_16774 ?auto_16789 ) ) ( not ( = ?auto_16774 ?auto_16791 ) ) ( not ( = ?auto_16774 ?auto_16784 ) ) ( not ( = ?auto_16795 ?auto_16796 ) ) ( not ( = ?auto_16795 ?auto_16798 ) ) ( not ( = ?auto_16795 ?auto_16800 ) ) ( not ( = ?auto_16795 ?auto_16793 ) ) ( not ( = ?auto_16795 ?auto_16792 ) ) ( not ( = ?auto_16795 ?auto_16789 ) ) ( not ( = ?auto_16795 ?auto_16791 ) ) ( not ( = ?auto_16795 ?auto_16784 ) ) ( not ( = ?auto_16765 ?auto_16775 ) ) ( not ( = ?auto_16765 ?auto_16779 ) ) ( not ( = ?auto_16766 ?auto_16775 ) ) ( not ( = ?auto_16766 ?auto_16779 ) ) ( not ( = ?auto_16767 ?auto_16775 ) ) ( not ( = ?auto_16767 ?auto_16779 ) ) ( not ( = ?auto_16768 ?auto_16775 ) ) ( not ( = ?auto_16768 ?auto_16779 ) ) ( not ( = ?auto_16769 ?auto_16775 ) ) ( not ( = ?auto_16769 ?auto_16779 ) ) ( not ( = ?auto_16770 ?auto_16775 ) ) ( not ( = ?auto_16770 ?auto_16779 ) ) ( not ( = ?auto_16771 ?auto_16775 ) ) ( not ( = ?auto_16771 ?auto_16779 ) ) ( not ( = ?auto_16772 ?auto_16775 ) ) ( not ( = ?auto_16772 ?auto_16779 ) ) ( not ( = ?auto_16773 ?auto_16775 ) ) ( not ( = ?auto_16773 ?auto_16779 ) ) ( not ( = ?auto_16775 ?auto_16795 ) ) ( not ( = ?auto_16775 ?auto_16796 ) ) ( not ( = ?auto_16775 ?auto_16798 ) ) ( not ( = ?auto_16775 ?auto_16800 ) ) ( not ( = ?auto_16775 ?auto_16793 ) ) ( not ( = ?auto_16775 ?auto_16792 ) ) ( not ( = ?auto_16775 ?auto_16789 ) ) ( not ( = ?auto_16775 ?auto_16791 ) ) ( not ( = ?auto_16775 ?auto_16784 ) ) ( not ( = ?auto_16779 ?auto_16795 ) ) ( not ( = ?auto_16779 ?auto_16796 ) ) ( not ( = ?auto_16779 ?auto_16798 ) ) ( not ( = ?auto_16779 ?auto_16800 ) ) ( not ( = ?auto_16779 ?auto_16793 ) ) ( not ( = ?auto_16779 ?auto_16792 ) ) ( not ( = ?auto_16779 ?auto_16789 ) ) ( not ( = ?auto_16779 ?auto_16791 ) ) ( not ( = ?auto_16779 ?auto_16784 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16765 ?auto_16766 ?auto_16767 ?auto_16768 ?auto_16769 ?auto_16770 ?auto_16771 ?auto_16772 ?auto_16773 ?auto_16774 )
      ( MAKE-1CRATE ?auto_16774 ?auto_16775 )
      ( MAKE-10CRATE-VERIFY ?auto_16765 ?auto_16766 ?auto_16767 ?auto_16768 ?auto_16769 ?auto_16770 ?auto_16771 ?auto_16772 ?auto_16773 ?auto_16774 ?auto_16775 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_16825 - SURFACE
      ?auto_16826 - SURFACE
      ?auto_16827 - SURFACE
      ?auto_16828 - SURFACE
      ?auto_16829 - SURFACE
      ?auto_16830 - SURFACE
      ?auto_16831 - SURFACE
      ?auto_16832 - SURFACE
      ?auto_16833 - SURFACE
      ?auto_16834 - SURFACE
      ?auto_16835 - SURFACE
      ?auto_16836 - SURFACE
    )
    :vars
    (
      ?auto_16838 - HOIST
      ?auto_16842 - PLACE
      ?auto_16837 - PLACE
      ?auto_16839 - HOIST
      ?auto_16841 - SURFACE
      ?auto_16848 - PLACE
      ?auto_16846 - HOIST
      ?auto_16864 - SURFACE
      ?auto_16865 - PLACE
      ?auto_16862 - HOIST
      ?auto_16863 - SURFACE
      ?auto_16847 - SURFACE
      ?auto_16843 - PLACE
      ?auto_16859 - HOIST
      ?auto_16857 - SURFACE
      ?auto_16854 - PLACE
      ?auto_16866 - HOIST
      ?auto_16855 - SURFACE
      ?auto_16861 - PLACE
      ?auto_16853 - HOIST
      ?auto_16850 - SURFACE
      ?auto_16860 - PLACE
      ?auto_16852 - HOIST
      ?auto_16845 - SURFACE
      ?auto_16849 - SURFACE
      ?auto_16856 - PLACE
      ?auto_16851 - HOIST
      ?auto_16844 - SURFACE
      ?auto_16858 - SURFACE
      ?auto_16840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16838 ?auto_16842 ) ( IS-CRATE ?auto_16836 ) ( not ( = ?auto_16837 ?auto_16842 ) ) ( HOIST-AT ?auto_16839 ?auto_16837 ) ( AVAILABLE ?auto_16839 ) ( SURFACE-AT ?auto_16836 ?auto_16837 ) ( ON ?auto_16836 ?auto_16841 ) ( CLEAR ?auto_16836 ) ( not ( = ?auto_16835 ?auto_16836 ) ) ( not ( = ?auto_16835 ?auto_16841 ) ) ( not ( = ?auto_16836 ?auto_16841 ) ) ( not ( = ?auto_16838 ?auto_16839 ) ) ( IS-CRATE ?auto_16835 ) ( not ( = ?auto_16848 ?auto_16842 ) ) ( HOIST-AT ?auto_16846 ?auto_16848 ) ( SURFACE-AT ?auto_16835 ?auto_16848 ) ( ON ?auto_16835 ?auto_16864 ) ( CLEAR ?auto_16835 ) ( not ( = ?auto_16834 ?auto_16835 ) ) ( not ( = ?auto_16834 ?auto_16864 ) ) ( not ( = ?auto_16835 ?auto_16864 ) ) ( not ( = ?auto_16838 ?auto_16846 ) ) ( IS-CRATE ?auto_16834 ) ( not ( = ?auto_16865 ?auto_16842 ) ) ( HOIST-AT ?auto_16862 ?auto_16865 ) ( SURFACE-AT ?auto_16834 ?auto_16865 ) ( ON ?auto_16834 ?auto_16863 ) ( CLEAR ?auto_16834 ) ( not ( = ?auto_16833 ?auto_16834 ) ) ( not ( = ?auto_16833 ?auto_16863 ) ) ( not ( = ?auto_16834 ?auto_16863 ) ) ( not ( = ?auto_16838 ?auto_16862 ) ) ( IS-CRATE ?auto_16833 ) ( AVAILABLE ?auto_16846 ) ( SURFACE-AT ?auto_16833 ?auto_16848 ) ( ON ?auto_16833 ?auto_16847 ) ( CLEAR ?auto_16833 ) ( not ( = ?auto_16832 ?auto_16833 ) ) ( not ( = ?auto_16832 ?auto_16847 ) ) ( not ( = ?auto_16833 ?auto_16847 ) ) ( IS-CRATE ?auto_16832 ) ( not ( = ?auto_16843 ?auto_16842 ) ) ( HOIST-AT ?auto_16859 ?auto_16843 ) ( SURFACE-AT ?auto_16832 ?auto_16843 ) ( ON ?auto_16832 ?auto_16857 ) ( CLEAR ?auto_16832 ) ( not ( = ?auto_16831 ?auto_16832 ) ) ( not ( = ?auto_16831 ?auto_16857 ) ) ( not ( = ?auto_16832 ?auto_16857 ) ) ( not ( = ?auto_16838 ?auto_16859 ) ) ( IS-CRATE ?auto_16831 ) ( not ( = ?auto_16854 ?auto_16842 ) ) ( HOIST-AT ?auto_16866 ?auto_16854 ) ( AVAILABLE ?auto_16866 ) ( SURFACE-AT ?auto_16831 ?auto_16854 ) ( ON ?auto_16831 ?auto_16855 ) ( CLEAR ?auto_16831 ) ( not ( = ?auto_16830 ?auto_16831 ) ) ( not ( = ?auto_16830 ?auto_16855 ) ) ( not ( = ?auto_16831 ?auto_16855 ) ) ( not ( = ?auto_16838 ?auto_16866 ) ) ( IS-CRATE ?auto_16830 ) ( not ( = ?auto_16861 ?auto_16842 ) ) ( HOIST-AT ?auto_16853 ?auto_16861 ) ( AVAILABLE ?auto_16853 ) ( SURFACE-AT ?auto_16830 ?auto_16861 ) ( ON ?auto_16830 ?auto_16850 ) ( CLEAR ?auto_16830 ) ( not ( = ?auto_16829 ?auto_16830 ) ) ( not ( = ?auto_16829 ?auto_16850 ) ) ( not ( = ?auto_16830 ?auto_16850 ) ) ( not ( = ?auto_16838 ?auto_16853 ) ) ( IS-CRATE ?auto_16829 ) ( not ( = ?auto_16860 ?auto_16842 ) ) ( HOIST-AT ?auto_16852 ?auto_16860 ) ( AVAILABLE ?auto_16852 ) ( SURFACE-AT ?auto_16829 ?auto_16860 ) ( ON ?auto_16829 ?auto_16845 ) ( CLEAR ?auto_16829 ) ( not ( = ?auto_16828 ?auto_16829 ) ) ( not ( = ?auto_16828 ?auto_16845 ) ) ( not ( = ?auto_16829 ?auto_16845 ) ) ( not ( = ?auto_16838 ?auto_16852 ) ) ( IS-CRATE ?auto_16828 ) ( AVAILABLE ?auto_16862 ) ( SURFACE-AT ?auto_16828 ?auto_16865 ) ( ON ?auto_16828 ?auto_16849 ) ( CLEAR ?auto_16828 ) ( not ( = ?auto_16827 ?auto_16828 ) ) ( not ( = ?auto_16827 ?auto_16849 ) ) ( not ( = ?auto_16828 ?auto_16849 ) ) ( IS-CRATE ?auto_16827 ) ( not ( = ?auto_16856 ?auto_16842 ) ) ( HOIST-AT ?auto_16851 ?auto_16856 ) ( AVAILABLE ?auto_16851 ) ( SURFACE-AT ?auto_16827 ?auto_16856 ) ( ON ?auto_16827 ?auto_16844 ) ( CLEAR ?auto_16827 ) ( not ( = ?auto_16826 ?auto_16827 ) ) ( not ( = ?auto_16826 ?auto_16844 ) ) ( not ( = ?auto_16827 ?auto_16844 ) ) ( not ( = ?auto_16838 ?auto_16851 ) ) ( SURFACE-AT ?auto_16825 ?auto_16842 ) ( CLEAR ?auto_16825 ) ( IS-CRATE ?auto_16826 ) ( AVAILABLE ?auto_16838 ) ( AVAILABLE ?auto_16859 ) ( SURFACE-AT ?auto_16826 ?auto_16843 ) ( ON ?auto_16826 ?auto_16858 ) ( CLEAR ?auto_16826 ) ( TRUCK-AT ?auto_16840 ?auto_16842 ) ( not ( = ?auto_16825 ?auto_16826 ) ) ( not ( = ?auto_16825 ?auto_16858 ) ) ( not ( = ?auto_16826 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16827 ) ) ( not ( = ?auto_16825 ?auto_16844 ) ) ( not ( = ?auto_16827 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16843 ) ) ( not ( = ?auto_16851 ?auto_16859 ) ) ( not ( = ?auto_16844 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16828 ) ) ( not ( = ?auto_16825 ?auto_16849 ) ) ( not ( = ?auto_16826 ?auto_16828 ) ) ( not ( = ?auto_16826 ?auto_16849 ) ) ( not ( = ?auto_16828 ?auto_16844 ) ) ( not ( = ?auto_16828 ?auto_16858 ) ) ( not ( = ?auto_16865 ?auto_16856 ) ) ( not ( = ?auto_16865 ?auto_16843 ) ) ( not ( = ?auto_16862 ?auto_16851 ) ) ( not ( = ?auto_16862 ?auto_16859 ) ) ( not ( = ?auto_16849 ?auto_16844 ) ) ( not ( = ?auto_16849 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16829 ) ) ( not ( = ?auto_16825 ?auto_16845 ) ) ( not ( = ?auto_16826 ?auto_16829 ) ) ( not ( = ?auto_16826 ?auto_16845 ) ) ( not ( = ?auto_16827 ?auto_16829 ) ) ( not ( = ?auto_16827 ?auto_16845 ) ) ( not ( = ?auto_16829 ?auto_16849 ) ) ( not ( = ?auto_16829 ?auto_16844 ) ) ( not ( = ?auto_16829 ?auto_16858 ) ) ( not ( = ?auto_16860 ?auto_16865 ) ) ( not ( = ?auto_16860 ?auto_16856 ) ) ( not ( = ?auto_16860 ?auto_16843 ) ) ( not ( = ?auto_16852 ?auto_16862 ) ) ( not ( = ?auto_16852 ?auto_16851 ) ) ( not ( = ?auto_16852 ?auto_16859 ) ) ( not ( = ?auto_16845 ?auto_16849 ) ) ( not ( = ?auto_16845 ?auto_16844 ) ) ( not ( = ?auto_16845 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16830 ) ) ( not ( = ?auto_16825 ?auto_16850 ) ) ( not ( = ?auto_16826 ?auto_16830 ) ) ( not ( = ?auto_16826 ?auto_16850 ) ) ( not ( = ?auto_16827 ?auto_16830 ) ) ( not ( = ?auto_16827 ?auto_16850 ) ) ( not ( = ?auto_16828 ?auto_16830 ) ) ( not ( = ?auto_16828 ?auto_16850 ) ) ( not ( = ?auto_16830 ?auto_16845 ) ) ( not ( = ?auto_16830 ?auto_16849 ) ) ( not ( = ?auto_16830 ?auto_16844 ) ) ( not ( = ?auto_16830 ?auto_16858 ) ) ( not ( = ?auto_16861 ?auto_16860 ) ) ( not ( = ?auto_16861 ?auto_16865 ) ) ( not ( = ?auto_16861 ?auto_16856 ) ) ( not ( = ?auto_16861 ?auto_16843 ) ) ( not ( = ?auto_16853 ?auto_16852 ) ) ( not ( = ?auto_16853 ?auto_16862 ) ) ( not ( = ?auto_16853 ?auto_16851 ) ) ( not ( = ?auto_16853 ?auto_16859 ) ) ( not ( = ?auto_16850 ?auto_16845 ) ) ( not ( = ?auto_16850 ?auto_16849 ) ) ( not ( = ?auto_16850 ?auto_16844 ) ) ( not ( = ?auto_16850 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16831 ) ) ( not ( = ?auto_16825 ?auto_16855 ) ) ( not ( = ?auto_16826 ?auto_16831 ) ) ( not ( = ?auto_16826 ?auto_16855 ) ) ( not ( = ?auto_16827 ?auto_16831 ) ) ( not ( = ?auto_16827 ?auto_16855 ) ) ( not ( = ?auto_16828 ?auto_16831 ) ) ( not ( = ?auto_16828 ?auto_16855 ) ) ( not ( = ?auto_16829 ?auto_16831 ) ) ( not ( = ?auto_16829 ?auto_16855 ) ) ( not ( = ?auto_16831 ?auto_16850 ) ) ( not ( = ?auto_16831 ?auto_16845 ) ) ( not ( = ?auto_16831 ?auto_16849 ) ) ( not ( = ?auto_16831 ?auto_16844 ) ) ( not ( = ?auto_16831 ?auto_16858 ) ) ( not ( = ?auto_16854 ?auto_16861 ) ) ( not ( = ?auto_16854 ?auto_16860 ) ) ( not ( = ?auto_16854 ?auto_16865 ) ) ( not ( = ?auto_16854 ?auto_16856 ) ) ( not ( = ?auto_16854 ?auto_16843 ) ) ( not ( = ?auto_16866 ?auto_16853 ) ) ( not ( = ?auto_16866 ?auto_16852 ) ) ( not ( = ?auto_16866 ?auto_16862 ) ) ( not ( = ?auto_16866 ?auto_16851 ) ) ( not ( = ?auto_16866 ?auto_16859 ) ) ( not ( = ?auto_16855 ?auto_16850 ) ) ( not ( = ?auto_16855 ?auto_16845 ) ) ( not ( = ?auto_16855 ?auto_16849 ) ) ( not ( = ?auto_16855 ?auto_16844 ) ) ( not ( = ?auto_16855 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16832 ) ) ( not ( = ?auto_16825 ?auto_16857 ) ) ( not ( = ?auto_16826 ?auto_16832 ) ) ( not ( = ?auto_16826 ?auto_16857 ) ) ( not ( = ?auto_16827 ?auto_16832 ) ) ( not ( = ?auto_16827 ?auto_16857 ) ) ( not ( = ?auto_16828 ?auto_16832 ) ) ( not ( = ?auto_16828 ?auto_16857 ) ) ( not ( = ?auto_16829 ?auto_16832 ) ) ( not ( = ?auto_16829 ?auto_16857 ) ) ( not ( = ?auto_16830 ?auto_16832 ) ) ( not ( = ?auto_16830 ?auto_16857 ) ) ( not ( = ?auto_16832 ?auto_16855 ) ) ( not ( = ?auto_16832 ?auto_16850 ) ) ( not ( = ?auto_16832 ?auto_16845 ) ) ( not ( = ?auto_16832 ?auto_16849 ) ) ( not ( = ?auto_16832 ?auto_16844 ) ) ( not ( = ?auto_16832 ?auto_16858 ) ) ( not ( = ?auto_16857 ?auto_16855 ) ) ( not ( = ?auto_16857 ?auto_16850 ) ) ( not ( = ?auto_16857 ?auto_16845 ) ) ( not ( = ?auto_16857 ?auto_16849 ) ) ( not ( = ?auto_16857 ?auto_16844 ) ) ( not ( = ?auto_16857 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16833 ) ) ( not ( = ?auto_16825 ?auto_16847 ) ) ( not ( = ?auto_16826 ?auto_16833 ) ) ( not ( = ?auto_16826 ?auto_16847 ) ) ( not ( = ?auto_16827 ?auto_16833 ) ) ( not ( = ?auto_16827 ?auto_16847 ) ) ( not ( = ?auto_16828 ?auto_16833 ) ) ( not ( = ?auto_16828 ?auto_16847 ) ) ( not ( = ?auto_16829 ?auto_16833 ) ) ( not ( = ?auto_16829 ?auto_16847 ) ) ( not ( = ?auto_16830 ?auto_16833 ) ) ( not ( = ?auto_16830 ?auto_16847 ) ) ( not ( = ?auto_16831 ?auto_16833 ) ) ( not ( = ?auto_16831 ?auto_16847 ) ) ( not ( = ?auto_16833 ?auto_16857 ) ) ( not ( = ?auto_16833 ?auto_16855 ) ) ( not ( = ?auto_16833 ?auto_16850 ) ) ( not ( = ?auto_16833 ?auto_16845 ) ) ( not ( = ?auto_16833 ?auto_16849 ) ) ( not ( = ?auto_16833 ?auto_16844 ) ) ( not ( = ?auto_16833 ?auto_16858 ) ) ( not ( = ?auto_16848 ?auto_16843 ) ) ( not ( = ?auto_16848 ?auto_16854 ) ) ( not ( = ?auto_16848 ?auto_16861 ) ) ( not ( = ?auto_16848 ?auto_16860 ) ) ( not ( = ?auto_16848 ?auto_16865 ) ) ( not ( = ?auto_16848 ?auto_16856 ) ) ( not ( = ?auto_16846 ?auto_16859 ) ) ( not ( = ?auto_16846 ?auto_16866 ) ) ( not ( = ?auto_16846 ?auto_16853 ) ) ( not ( = ?auto_16846 ?auto_16852 ) ) ( not ( = ?auto_16846 ?auto_16862 ) ) ( not ( = ?auto_16846 ?auto_16851 ) ) ( not ( = ?auto_16847 ?auto_16857 ) ) ( not ( = ?auto_16847 ?auto_16855 ) ) ( not ( = ?auto_16847 ?auto_16850 ) ) ( not ( = ?auto_16847 ?auto_16845 ) ) ( not ( = ?auto_16847 ?auto_16849 ) ) ( not ( = ?auto_16847 ?auto_16844 ) ) ( not ( = ?auto_16847 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16834 ) ) ( not ( = ?auto_16825 ?auto_16863 ) ) ( not ( = ?auto_16826 ?auto_16834 ) ) ( not ( = ?auto_16826 ?auto_16863 ) ) ( not ( = ?auto_16827 ?auto_16834 ) ) ( not ( = ?auto_16827 ?auto_16863 ) ) ( not ( = ?auto_16828 ?auto_16834 ) ) ( not ( = ?auto_16828 ?auto_16863 ) ) ( not ( = ?auto_16829 ?auto_16834 ) ) ( not ( = ?auto_16829 ?auto_16863 ) ) ( not ( = ?auto_16830 ?auto_16834 ) ) ( not ( = ?auto_16830 ?auto_16863 ) ) ( not ( = ?auto_16831 ?auto_16834 ) ) ( not ( = ?auto_16831 ?auto_16863 ) ) ( not ( = ?auto_16832 ?auto_16834 ) ) ( not ( = ?auto_16832 ?auto_16863 ) ) ( not ( = ?auto_16834 ?auto_16847 ) ) ( not ( = ?auto_16834 ?auto_16857 ) ) ( not ( = ?auto_16834 ?auto_16855 ) ) ( not ( = ?auto_16834 ?auto_16850 ) ) ( not ( = ?auto_16834 ?auto_16845 ) ) ( not ( = ?auto_16834 ?auto_16849 ) ) ( not ( = ?auto_16834 ?auto_16844 ) ) ( not ( = ?auto_16834 ?auto_16858 ) ) ( not ( = ?auto_16863 ?auto_16847 ) ) ( not ( = ?auto_16863 ?auto_16857 ) ) ( not ( = ?auto_16863 ?auto_16855 ) ) ( not ( = ?auto_16863 ?auto_16850 ) ) ( not ( = ?auto_16863 ?auto_16845 ) ) ( not ( = ?auto_16863 ?auto_16849 ) ) ( not ( = ?auto_16863 ?auto_16844 ) ) ( not ( = ?auto_16863 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16835 ) ) ( not ( = ?auto_16825 ?auto_16864 ) ) ( not ( = ?auto_16826 ?auto_16835 ) ) ( not ( = ?auto_16826 ?auto_16864 ) ) ( not ( = ?auto_16827 ?auto_16835 ) ) ( not ( = ?auto_16827 ?auto_16864 ) ) ( not ( = ?auto_16828 ?auto_16835 ) ) ( not ( = ?auto_16828 ?auto_16864 ) ) ( not ( = ?auto_16829 ?auto_16835 ) ) ( not ( = ?auto_16829 ?auto_16864 ) ) ( not ( = ?auto_16830 ?auto_16835 ) ) ( not ( = ?auto_16830 ?auto_16864 ) ) ( not ( = ?auto_16831 ?auto_16835 ) ) ( not ( = ?auto_16831 ?auto_16864 ) ) ( not ( = ?auto_16832 ?auto_16835 ) ) ( not ( = ?auto_16832 ?auto_16864 ) ) ( not ( = ?auto_16833 ?auto_16835 ) ) ( not ( = ?auto_16833 ?auto_16864 ) ) ( not ( = ?auto_16835 ?auto_16863 ) ) ( not ( = ?auto_16835 ?auto_16847 ) ) ( not ( = ?auto_16835 ?auto_16857 ) ) ( not ( = ?auto_16835 ?auto_16855 ) ) ( not ( = ?auto_16835 ?auto_16850 ) ) ( not ( = ?auto_16835 ?auto_16845 ) ) ( not ( = ?auto_16835 ?auto_16849 ) ) ( not ( = ?auto_16835 ?auto_16844 ) ) ( not ( = ?auto_16835 ?auto_16858 ) ) ( not ( = ?auto_16864 ?auto_16863 ) ) ( not ( = ?auto_16864 ?auto_16847 ) ) ( not ( = ?auto_16864 ?auto_16857 ) ) ( not ( = ?auto_16864 ?auto_16855 ) ) ( not ( = ?auto_16864 ?auto_16850 ) ) ( not ( = ?auto_16864 ?auto_16845 ) ) ( not ( = ?auto_16864 ?auto_16849 ) ) ( not ( = ?auto_16864 ?auto_16844 ) ) ( not ( = ?auto_16864 ?auto_16858 ) ) ( not ( = ?auto_16825 ?auto_16836 ) ) ( not ( = ?auto_16825 ?auto_16841 ) ) ( not ( = ?auto_16826 ?auto_16836 ) ) ( not ( = ?auto_16826 ?auto_16841 ) ) ( not ( = ?auto_16827 ?auto_16836 ) ) ( not ( = ?auto_16827 ?auto_16841 ) ) ( not ( = ?auto_16828 ?auto_16836 ) ) ( not ( = ?auto_16828 ?auto_16841 ) ) ( not ( = ?auto_16829 ?auto_16836 ) ) ( not ( = ?auto_16829 ?auto_16841 ) ) ( not ( = ?auto_16830 ?auto_16836 ) ) ( not ( = ?auto_16830 ?auto_16841 ) ) ( not ( = ?auto_16831 ?auto_16836 ) ) ( not ( = ?auto_16831 ?auto_16841 ) ) ( not ( = ?auto_16832 ?auto_16836 ) ) ( not ( = ?auto_16832 ?auto_16841 ) ) ( not ( = ?auto_16833 ?auto_16836 ) ) ( not ( = ?auto_16833 ?auto_16841 ) ) ( not ( = ?auto_16834 ?auto_16836 ) ) ( not ( = ?auto_16834 ?auto_16841 ) ) ( not ( = ?auto_16836 ?auto_16864 ) ) ( not ( = ?auto_16836 ?auto_16863 ) ) ( not ( = ?auto_16836 ?auto_16847 ) ) ( not ( = ?auto_16836 ?auto_16857 ) ) ( not ( = ?auto_16836 ?auto_16855 ) ) ( not ( = ?auto_16836 ?auto_16850 ) ) ( not ( = ?auto_16836 ?auto_16845 ) ) ( not ( = ?auto_16836 ?auto_16849 ) ) ( not ( = ?auto_16836 ?auto_16844 ) ) ( not ( = ?auto_16836 ?auto_16858 ) ) ( not ( = ?auto_16837 ?auto_16848 ) ) ( not ( = ?auto_16837 ?auto_16865 ) ) ( not ( = ?auto_16837 ?auto_16843 ) ) ( not ( = ?auto_16837 ?auto_16854 ) ) ( not ( = ?auto_16837 ?auto_16861 ) ) ( not ( = ?auto_16837 ?auto_16860 ) ) ( not ( = ?auto_16837 ?auto_16856 ) ) ( not ( = ?auto_16839 ?auto_16846 ) ) ( not ( = ?auto_16839 ?auto_16862 ) ) ( not ( = ?auto_16839 ?auto_16859 ) ) ( not ( = ?auto_16839 ?auto_16866 ) ) ( not ( = ?auto_16839 ?auto_16853 ) ) ( not ( = ?auto_16839 ?auto_16852 ) ) ( not ( = ?auto_16839 ?auto_16851 ) ) ( not ( = ?auto_16841 ?auto_16864 ) ) ( not ( = ?auto_16841 ?auto_16863 ) ) ( not ( = ?auto_16841 ?auto_16847 ) ) ( not ( = ?auto_16841 ?auto_16857 ) ) ( not ( = ?auto_16841 ?auto_16855 ) ) ( not ( = ?auto_16841 ?auto_16850 ) ) ( not ( = ?auto_16841 ?auto_16845 ) ) ( not ( = ?auto_16841 ?auto_16849 ) ) ( not ( = ?auto_16841 ?auto_16844 ) ) ( not ( = ?auto_16841 ?auto_16858 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16825 ?auto_16826 ?auto_16827 ?auto_16828 ?auto_16829 ?auto_16830 ?auto_16831 ?auto_16832 ?auto_16833 ?auto_16834 ?auto_16835 )
      ( MAKE-1CRATE ?auto_16835 ?auto_16836 )
      ( MAKE-11CRATE-VERIFY ?auto_16825 ?auto_16826 ?auto_16827 ?auto_16828 ?auto_16829 ?auto_16830 ?auto_16831 ?auto_16832 ?auto_16833 ?auto_16834 ?auto_16835 ?auto_16836 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_16890 - SURFACE
      ?auto_16891 - SURFACE
      ?auto_16892 - SURFACE
      ?auto_16893 - SURFACE
      ?auto_16894 - SURFACE
      ?auto_16895 - SURFACE
      ?auto_16896 - SURFACE
      ?auto_16897 - SURFACE
      ?auto_16898 - SURFACE
      ?auto_16899 - SURFACE
      ?auto_16900 - SURFACE
      ?auto_16901 - SURFACE
      ?auto_16902 - SURFACE
    )
    :vars
    (
      ?auto_16904 - HOIST
      ?auto_16906 - PLACE
      ?auto_16908 - PLACE
      ?auto_16907 - HOIST
      ?auto_16903 - SURFACE
      ?auto_16918 - PLACE
      ?auto_16931 - HOIST
      ?auto_16914 - SURFACE
      ?auto_16910 - PLACE
      ?auto_16926 - HOIST
      ?auto_16934 - SURFACE
      ?auto_16909 - PLACE
      ?auto_16927 - HOIST
      ?auto_16919 - SURFACE
      ?auto_16932 - SURFACE
      ?auto_16913 - PLACE
      ?auto_16929 - HOIST
      ?auto_16912 - SURFACE
      ?auto_16917 - PLACE
      ?auto_16911 - HOIST
      ?auto_16924 - SURFACE
      ?auto_16925 - PLACE
      ?auto_16933 - HOIST
      ?auto_16923 - SURFACE
      ?auto_16930 - PLACE
      ?auto_16916 - HOIST
      ?auto_16928 - SURFACE
      ?auto_16922 - SURFACE
      ?auto_16920 - PLACE
      ?auto_16935 - HOIST
      ?auto_16915 - SURFACE
      ?auto_16921 - SURFACE
      ?auto_16905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16904 ?auto_16906 ) ( IS-CRATE ?auto_16902 ) ( not ( = ?auto_16908 ?auto_16906 ) ) ( HOIST-AT ?auto_16907 ?auto_16908 ) ( AVAILABLE ?auto_16907 ) ( SURFACE-AT ?auto_16902 ?auto_16908 ) ( ON ?auto_16902 ?auto_16903 ) ( CLEAR ?auto_16902 ) ( not ( = ?auto_16901 ?auto_16902 ) ) ( not ( = ?auto_16901 ?auto_16903 ) ) ( not ( = ?auto_16902 ?auto_16903 ) ) ( not ( = ?auto_16904 ?auto_16907 ) ) ( IS-CRATE ?auto_16901 ) ( not ( = ?auto_16918 ?auto_16906 ) ) ( HOIST-AT ?auto_16931 ?auto_16918 ) ( AVAILABLE ?auto_16931 ) ( SURFACE-AT ?auto_16901 ?auto_16918 ) ( ON ?auto_16901 ?auto_16914 ) ( CLEAR ?auto_16901 ) ( not ( = ?auto_16900 ?auto_16901 ) ) ( not ( = ?auto_16900 ?auto_16914 ) ) ( not ( = ?auto_16901 ?auto_16914 ) ) ( not ( = ?auto_16904 ?auto_16931 ) ) ( IS-CRATE ?auto_16900 ) ( not ( = ?auto_16910 ?auto_16906 ) ) ( HOIST-AT ?auto_16926 ?auto_16910 ) ( SURFACE-AT ?auto_16900 ?auto_16910 ) ( ON ?auto_16900 ?auto_16934 ) ( CLEAR ?auto_16900 ) ( not ( = ?auto_16899 ?auto_16900 ) ) ( not ( = ?auto_16899 ?auto_16934 ) ) ( not ( = ?auto_16900 ?auto_16934 ) ) ( not ( = ?auto_16904 ?auto_16926 ) ) ( IS-CRATE ?auto_16899 ) ( not ( = ?auto_16909 ?auto_16906 ) ) ( HOIST-AT ?auto_16927 ?auto_16909 ) ( SURFACE-AT ?auto_16899 ?auto_16909 ) ( ON ?auto_16899 ?auto_16919 ) ( CLEAR ?auto_16899 ) ( not ( = ?auto_16898 ?auto_16899 ) ) ( not ( = ?auto_16898 ?auto_16919 ) ) ( not ( = ?auto_16899 ?auto_16919 ) ) ( not ( = ?auto_16904 ?auto_16927 ) ) ( IS-CRATE ?auto_16898 ) ( AVAILABLE ?auto_16926 ) ( SURFACE-AT ?auto_16898 ?auto_16910 ) ( ON ?auto_16898 ?auto_16932 ) ( CLEAR ?auto_16898 ) ( not ( = ?auto_16897 ?auto_16898 ) ) ( not ( = ?auto_16897 ?auto_16932 ) ) ( not ( = ?auto_16898 ?auto_16932 ) ) ( IS-CRATE ?auto_16897 ) ( not ( = ?auto_16913 ?auto_16906 ) ) ( HOIST-AT ?auto_16929 ?auto_16913 ) ( SURFACE-AT ?auto_16897 ?auto_16913 ) ( ON ?auto_16897 ?auto_16912 ) ( CLEAR ?auto_16897 ) ( not ( = ?auto_16896 ?auto_16897 ) ) ( not ( = ?auto_16896 ?auto_16912 ) ) ( not ( = ?auto_16897 ?auto_16912 ) ) ( not ( = ?auto_16904 ?auto_16929 ) ) ( IS-CRATE ?auto_16896 ) ( not ( = ?auto_16917 ?auto_16906 ) ) ( HOIST-AT ?auto_16911 ?auto_16917 ) ( AVAILABLE ?auto_16911 ) ( SURFACE-AT ?auto_16896 ?auto_16917 ) ( ON ?auto_16896 ?auto_16924 ) ( CLEAR ?auto_16896 ) ( not ( = ?auto_16895 ?auto_16896 ) ) ( not ( = ?auto_16895 ?auto_16924 ) ) ( not ( = ?auto_16896 ?auto_16924 ) ) ( not ( = ?auto_16904 ?auto_16911 ) ) ( IS-CRATE ?auto_16895 ) ( not ( = ?auto_16925 ?auto_16906 ) ) ( HOIST-AT ?auto_16933 ?auto_16925 ) ( AVAILABLE ?auto_16933 ) ( SURFACE-AT ?auto_16895 ?auto_16925 ) ( ON ?auto_16895 ?auto_16923 ) ( CLEAR ?auto_16895 ) ( not ( = ?auto_16894 ?auto_16895 ) ) ( not ( = ?auto_16894 ?auto_16923 ) ) ( not ( = ?auto_16895 ?auto_16923 ) ) ( not ( = ?auto_16904 ?auto_16933 ) ) ( IS-CRATE ?auto_16894 ) ( not ( = ?auto_16930 ?auto_16906 ) ) ( HOIST-AT ?auto_16916 ?auto_16930 ) ( AVAILABLE ?auto_16916 ) ( SURFACE-AT ?auto_16894 ?auto_16930 ) ( ON ?auto_16894 ?auto_16928 ) ( CLEAR ?auto_16894 ) ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16893 ?auto_16928 ) ) ( not ( = ?auto_16894 ?auto_16928 ) ) ( not ( = ?auto_16904 ?auto_16916 ) ) ( IS-CRATE ?auto_16893 ) ( AVAILABLE ?auto_16927 ) ( SURFACE-AT ?auto_16893 ?auto_16909 ) ( ON ?auto_16893 ?auto_16922 ) ( CLEAR ?auto_16893 ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( not ( = ?auto_16892 ?auto_16922 ) ) ( not ( = ?auto_16893 ?auto_16922 ) ) ( IS-CRATE ?auto_16892 ) ( not ( = ?auto_16920 ?auto_16906 ) ) ( HOIST-AT ?auto_16935 ?auto_16920 ) ( AVAILABLE ?auto_16935 ) ( SURFACE-AT ?auto_16892 ?auto_16920 ) ( ON ?auto_16892 ?auto_16915 ) ( CLEAR ?auto_16892 ) ( not ( = ?auto_16891 ?auto_16892 ) ) ( not ( = ?auto_16891 ?auto_16915 ) ) ( not ( = ?auto_16892 ?auto_16915 ) ) ( not ( = ?auto_16904 ?auto_16935 ) ) ( SURFACE-AT ?auto_16890 ?auto_16906 ) ( CLEAR ?auto_16890 ) ( IS-CRATE ?auto_16891 ) ( AVAILABLE ?auto_16904 ) ( AVAILABLE ?auto_16929 ) ( SURFACE-AT ?auto_16891 ?auto_16913 ) ( ON ?auto_16891 ?auto_16921 ) ( CLEAR ?auto_16891 ) ( TRUCK-AT ?auto_16905 ?auto_16906 ) ( not ( = ?auto_16890 ?auto_16891 ) ) ( not ( = ?auto_16890 ?auto_16921 ) ) ( not ( = ?auto_16891 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16892 ) ) ( not ( = ?auto_16890 ?auto_16915 ) ) ( not ( = ?auto_16892 ?auto_16921 ) ) ( not ( = ?auto_16920 ?auto_16913 ) ) ( not ( = ?auto_16935 ?auto_16929 ) ) ( not ( = ?auto_16915 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16893 ) ) ( not ( = ?auto_16890 ?auto_16922 ) ) ( not ( = ?auto_16891 ?auto_16893 ) ) ( not ( = ?auto_16891 ?auto_16922 ) ) ( not ( = ?auto_16893 ?auto_16915 ) ) ( not ( = ?auto_16893 ?auto_16921 ) ) ( not ( = ?auto_16909 ?auto_16920 ) ) ( not ( = ?auto_16909 ?auto_16913 ) ) ( not ( = ?auto_16927 ?auto_16935 ) ) ( not ( = ?auto_16927 ?auto_16929 ) ) ( not ( = ?auto_16922 ?auto_16915 ) ) ( not ( = ?auto_16922 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16894 ) ) ( not ( = ?auto_16890 ?auto_16928 ) ) ( not ( = ?auto_16891 ?auto_16894 ) ) ( not ( = ?auto_16891 ?auto_16928 ) ) ( not ( = ?auto_16892 ?auto_16894 ) ) ( not ( = ?auto_16892 ?auto_16928 ) ) ( not ( = ?auto_16894 ?auto_16922 ) ) ( not ( = ?auto_16894 ?auto_16915 ) ) ( not ( = ?auto_16894 ?auto_16921 ) ) ( not ( = ?auto_16930 ?auto_16909 ) ) ( not ( = ?auto_16930 ?auto_16920 ) ) ( not ( = ?auto_16930 ?auto_16913 ) ) ( not ( = ?auto_16916 ?auto_16927 ) ) ( not ( = ?auto_16916 ?auto_16935 ) ) ( not ( = ?auto_16916 ?auto_16929 ) ) ( not ( = ?auto_16928 ?auto_16922 ) ) ( not ( = ?auto_16928 ?auto_16915 ) ) ( not ( = ?auto_16928 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16895 ) ) ( not ( = ?auto_16890 ?auto_16923 ) ) ( not ( = ?auto_16891 ?auto_16895 ) ) ( not ( = ?auto_16891 ?auto_16923 ) ) ( not ( = ?auto_16892 ?auto_16895 ) ) ( not ( = ?auto_16892 ?auto_16923 ) ) ( not ( = ?auto_16893 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16923 ) ) ( not ( = ?auto_16895 ?auto_16928 ) ) ( not ( = ?auto_16895 ?auto_16922 ) ) ( not ( = ?auto_16895 ?auto_16915 ) ) ( not ( = ?auto_16895 ?auto_16921 ) ) ( not ( = ?auto_16925 ?auto_16930 ) ) ( not ( = ?auto_16925 ?auto_16909 ) ) ( not ( = ?auto_16925 ?auto_16920 ) ) ( not ( = ?auto_16925 ?auto_16913 ) ) ( not ( = ?auto_16933 ?auto_16916 ) ) ( not ( = ?auto_16933 ?auto_16927 ) ) ( not ( = ?auto_16933 ?auto_16935 ) ) ( not ( = ?auto_16933 ?auto_16929 ) ) ( not ( = ?auto_16923 ?auto_16928 ) ) ( not ( = ?auto_16923 ?auto_16922 ) ) ( not ( = ?auto_16923 ?auto_16915 ) ) ( not ( = ?auto_16923 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16896 ) ) ( not ( = ?auto_16890 ?auto_16924 ) ) ( not ( = ?auto_16891 ?auto_16896 ) ) ( not ( = ?auto_16891 ?auto_16924 ) ) ( not ( = ?auto_16892 ?auto_16896 ) ) ( not ( = ?auto_16892 ?auto_16924 ) ) ( not ( = ?auto_16893 ?auto_16896 ) ) ( not ( = ?auto_16893 ?auto_16924 ) ) ( not ( = ?auto_16894 ?auto_16896 ) ) ( not ( = ?auto_16894 ?auto_16924 ) ) ( not ( = ?auto_16896 ?auto_16923 ) ) ( not ( = ?auto_16896 ?auto_16928 ) ) ( not ( = ?auto_16896 ?auto_16922 ) ) ( not ( = ?auto_16896 ?auto_16915 ) ) ( not ( = ?auto_16896 ?auto_16921 ) ) ( not ( = ?auto_16917 ?auto_16925 ) ) ( not ( = ?auto_16917 ?auto_16930 ) ) ( not ( = ?auto_16917 ?auto_16909 ) ) ( not ( = ?auto_16917 ?auto_16920 ) ) ( not ( = ?auto_16917 ?auto_16913 ) ) ( not ( = ?auto_16911 ?auto_16933 ) ) ( not ( = ?auto_16911 ?auto_16916 ) ) ( not ( = ?auto_16911 ?auto_16927 ) ) ( not ( = ?auto_16911 ?auto_16935 ) ) ( not ( = ?auto_16911 ?auto_16929 ) ) ( not ( = ?auto_16924 ?auto_16923 ) ) ( not ( = ?auto_16924 ?auto_16928 ) ) ( not ( = ?auto_16924 ?auto_16922 ) ) ( not ( = ?auto_16924 ?auto_16915 ) ) ( not ( = ?auto_16924 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16897 ) ) ( not ( = ?auto_16890 ?auto_16912 ) ) ( not ( = ?auto_16891 ?auto_16897 ) ) ( not ( = ?auto_16891 ?auto_16912 ) ) ( not ( = ?auto_16892 ?auto_16897 ) ) ( not ( = ?auto_16892 ?auto_16912 ) ) ( not ( = ?auto_16893 ?auto_16897 ) ) ( not ( = ?auto_16893 ?auto_16912 ) ) ( not ( = ?auto_16894 ?auto_16897 ) ) ( not ( = ?auto_16894 ?auto_16912 ) ) ( not ( = ?auto_16895 ?auto_16897 ) ) ( not ( = ?auto_16895 ?auto_16912 ) ) ( not ( = ?auto_16897 ?auto_16924 ) ) ( not ( = ?auto_16897 ?auto_16923 ) ) ( not ( = ?auto_16897 ?auto_16928 ) ) ( not ( = ?auto_16897 ?auto_16922 ) ) ( not ( = ?auto_16897 ?auto_16915 ) ) ( not ( = ?auto_16897 ?auto_16921 ) ) ( not ( = ?auto_16912 ?auto_16924 ) ) ( not ( = ?auto_16912 ?auto_16923 ) ) ( not ( = ?auto_16912 ?auto_16928 ) ) ( not ( = ?auto_16912 ?auto_16922 ) ) ( not ( = ?auto_16912 ?auto_16915 ) ) ( not ( = ?auto_16912 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16898 ) ) ( not ( = ?auto_16890 ?auto_16932 ) ) ( not ( = ?auto_16891 ?auto_16898 ) ) ( not ( = ?auto_16891 ?auto_16932 ) ) ( not ( = ?auto_16892 ?auto_16898 ) ) ( not ( = ?auto_16892 ?auto_16932 ) ) ( not ( = ?auto_16893 ?auto_16898 ) ) ( not ( = ?auto_16893 ?auto_16932 ) ) ( not ( = ?auto_16894 ?auto_16898 ) ) ( not ( = ?auto_16894 ?auto_16932 ) ) ( not ( = ?auto_16895 ?auto_16898 ) ) ( not ( = ?auto_16895 ?auto_16932 ) ) ( not ( = ?auto_16896 ?auto_16898 ) ) ( not ( = ?auto_16896 ?auto_16932 ) ) ( not ( = ?auto_16898 ?auto_16912 ) ) ( not ( = ?auto_16898 ?auto_16924 ) ) ( not ( = ?auto_16898 ?auto_16923 ) ) ( not ( = ?auto_16898 ?auto_16928 ) ) ( not ( = ?auto_16898 ?auto_16922 ) ) ( not ( = ?auto_16898 ?auto_16915 ) ) ( not ( = ?auto_16898 ?auto_16921 ) ) ( not ( = ?auto_16910 ?auto_16913 ) ) ( not ( = ?auto_16910 ?auto_16917 ) ) ( not ( = ?auto_16910 ?auto_16925 ) ) ( not ( = ?auto_16910 ?auto_16930 ) ) ( not ( = ?auto_16910 ?auto_16909 ) ) ( not ( = ?auto_16910 ?auto_16920 ) ) ( not ( = ?auto_16926 ?auto_16929 ) ) ( not ( = ?auto_16926 ?auto_16911 ) ) ( not ( = ?auto_16926 ?auto_16933 ) ) ( not ( = ?auto_16926 ?auto_16916 ) ) ( not ( = ?auto_16926 ?auto_16927 ) ) ( not ( = ?auto_16926 ?auto_16935 ) ) ( not ( = ?auto_16932 ?auto_16912 ) ) ( not ( = ?auto_16932 ?auto_16924 ) ) ( not ( = ?auto_16932 ?auto_16923 ) ) ( not ( = ?auto_16932 ?auto_16928 ) ) ( not ( = ?auto_16932 ?auto_16922 ) ) ( not ( = ?auto_16932 ?auto_16915 ) ) ( not ( = ?auto_16932 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16899 ) ) ( not ( = ?auto_16890 ?auto_16919 ) ) ( not ( = ?auto_16891 ?auto_16899 ) ) ( not ( = ?auto_16891 ?auto_16919 ) ) ( not ( = ?auto_16892 ?auto_16899 ) ) ( not ( = ?auto_16892 ?auto_16919 ) ) ( not ( = ?auto_16893 ?auto_16899 ) ) ( not ( = ?auto_16893 ?auto_16919 ) ) ( not ( = ?auto_16894 ?auto_16899 ) ) ( not ( = ?auto_16894 ?auto_16919 ) ) ( not ( = ?auto_16895 ?auto_16899 ) ) ( not ( = ?auto_16895 ?auto_16919 ) ) ( not ( = ?auto_16896 ?auto_16899 ) ) ( not ( = ?auto_16896 ?auto_16919 ) ) ( not ( = ?auto_16897 ?auto_16899 ) ) ( not ( = ?auto_16897 ?auto_16919 ) ) ( not ( = ?auto_16899 ?auto_16932 ) ) ( not ( = ?auto_16899 ?auto_16912 ) ) ( not ( = ?auto_16899 ?auto_16924 ) ) ( not ( = ?auto_16899 ?auto_16923 ) ) ( not ( = ?auto_16899 ?auto_16928 ) ) ( not ( = ?auto_16899 ?auto_16922 ) ) ( not ( = ?auto_16899 ?auto_16915 ) ) ( not ( = ?auto_16899 ?auto_16921 ) ) ( not ( = ?auto_16919 ?auto_16932 ) ) ( not ( = ?auto_16919 ?auto_16912 ) ) ( not ( = ?auto_16919 ?auto_16924 ) ) ( not ( = ?auto_16919 ?auto_16923 ) ) ( not ( = ?auto_16919 ?auto_16928 ) ) ( not ( = ?auto_16919 ?auto_16922 ) ) ( not ( = ?auto_16919 ?auto_16915 ) ) ( not ( = ?auto_16919 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16900 ) ) ( not ( = ?auto_16890 ?auto_16934 ) ) ( not ( = ?auto_16891 ?auto_16900 ) ) ( not ( = ?auto_16891 ?auto_16934 ) ) ( not ( = ?auto_16892 ?auto_16900 ) ) ( not ( = ?auto_16892 ?auto_16934 ) ) ( not ( = ?auto_16893 ?auto_16900 ) ) ( not ( = ?auto_16893 ?auto_16934 ) ) ( not ( = ?auto_16894 ?auto_16900 ) ) ( not ( = ?auto_16894 ?auto_16934 ) ) ( not ( = ?auto_16895 ?auto_16900 ) ) ( not ( = ?auto_16895 ?auto_16934 ) ) ( not ( = ?auto_16896 ?auto_16900 ) ) ( not ( = ?auto_16896 ?auto_16934 ) ) ( not ( = ?auto_16897 ?auto_16900 ) ) ( not ( = ?auto_16897 ?auto_16934 ) ) ( not ( = ?auto_16898 ?auto_16900 ) ) ( not ( = ?auto_16898 ?auto_16934 ) ) ( not ( = ?auto_16900 ?auto_16919 ) ) ( not ( = ?auto_16900 ?auto_16932 ) ) ( not ( = ?auto_16900 ?auto_16912 ) ) ( not ( = ?auto_16900 ?auto_16924 ) ) ( not ( = ?auto_16900 ?auto_16923 ) ) ( not ( = ?auto_16900 ?auto_16928 ) ) ( not ( = ?auto_16900 ?auto_16922 ) ) ( not ( = ?auto_16900 ?auto_16915 ) ) ( not ( = ?auto_16900 ?auto_16921 ) ) ( not ( = ?auto_16934 ?auto_16919 ) ) ( not ( = ?auto_16934 ?auto_16932 ) ) ( not ( = ?auto_16934 ?auto_16912 ) ) ( not ( = ?auto_16934 ?auto_16924 ) ) ( not ( = ?auto_16934 ?auto_16923 ) ) ( not ( = ?auto_16934 ?auto_16928 ) ) ( not ( = ?auto_16934 ?auto_16922 ) ) ( not ( = ?auto_16934 ?auto_16915 ) ) ( not ( = ?auto_16934 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16901 ) ) ( not ( = ?auto_16890 ?auto_16914 ) ) ( not ( = ?auto_16891 ?auto_16901 ) ) ( not ( = ?auto_16891 ?auto_16914 ) ) ( not ( = ?auto_16892 ?auto_16901 ) ) ( not ( = ?auto_16892 ?auto_16914 ) ) ( not ( = ?auto_16893 ?auto_16901 ) ) ( not ( = ?auto_16893 ?auto_16914 ) ) ( not ( = ?auto_16894 ?auto_16901 ) ) ( not ( = ?auto_16894 ?auto_16914 ) ) ( not ( = ?auto_16895 ?auto_16901 ) ) ( not ( = ?auto_16895 ?auto_16914 ) ) ( not ( = ?auto_16896 ?auto_16901 ) ) ( not ( = ?auto_16896 ?auto_16914 ) ) ( not ( = ?auto_16897 ?auto_16901 ) ) ( not ( = ?auto_16897 ?auto_16914 ) ) ( not ( = ?auto_16898 ?auto_16901 ) ) ( not ( = ?auto_16898 ?auto_16914 ) ) ( not ( = ?auto_16899 ?auto_16901 ) ) ( not ( = ?auto_16899 ?auto_16914 ) ) ( not ( = ?auto_16901 ?auto_16934 ) ) ( not ( = ?auto_16901 ?auto_16919 ) ) ( not ( = ?auto_16901 ?auto_16932 ) ) ( not ( = ?auto_16901 ?auto_16912 ) ) ( not ( = ?auto_16901 ?auto_16924 ) ) ( not ( = ?auto_16901 ?auto_16923 ) ) ( not ( = ?auto_16901 ?auto_16928 ) ) ( not ( = ?auto_16901 ?auto_16922 ) ) ( not ( = ?auto_16901 ?auto_16915 ) ) ( not ( = ?auto_16901 ?auto_16921 ) ) ( not ( = ?auto_16918 ?auto_16910 ) ) ( not ( = ?auto_16918 ?auto_16909 ) ) ( not ( = ?auto_16918 ?auto_16913 ) ) ( not ( = ?auto_16918 ?auto_16917 ) ) ( not ( = ?auto_16918 ?auto_16925 ) ) ( not ( = ?auto_16918 ?auto_16930 ) ) ( not ( = ?auto_16918 ?auto_16920 ) ) ( not ( = ?auto_16931 ?auto_16926 ) ) ( not ( = ?auto_16931 ?auto_16927 ) ) ( not ( = ?auto_16931 ?auto_16929 ) ) ( not ( = ?auto_16931 ?auto_16911 ) ) ( not ( = ?auto_16931 ?auto_16933 ) ) ( not ( = ?auto_16931 ?auto_16916 ) ) ( not ( = ?auto_16931 ?auto_16935 ) ) ( not ( = ?auto_16914 ?auto_16934 ) ) ( not ( = ?auto_16914 ?auto_16919 ) ) ( not ( = ?auto_16914 ?auto_16932 ) ) ( not ( = ?auto_16914 ?auto_16912 ) ) ( not ( = ?auto_16914 ?auto_16924 ) ) ( not ( = ?auto_16914 ?auto_16923 ) ) ( not ( = ?auto_16914 ?auto_16928 ) ) ( not ( = ?auto_16914 ?auto_16922 ) ) ( not ( = ?auto_16914 ?auto_16915 ) ) ( not ( = ?auto_16914 ?auto_16921 ) ) ( not ( = ?auto_16890 ?auto_16902 ) ) ( not ( = ?auto_16890 ?auto_16903 ) ) ( not ( = ?auto_16891 ?auto_16902 ) ) ( not ( = ?auto_16891 ?auto_16903 ) ) ( not ( = ?auto_16892 ?auto_16902 ) ) ( not ( = ?auto_16892 ?auto_16903 ) ) ( not ( = ?auto_16893 ?auto_16902 ) ) ( not ( = ?auto_16893 ?auto_16903 ) ) ( not ( = ?auto_16894 ?auto_16902 ) ) ( not ( = ?auto_16894 ?auto_16903 ) ) ( not ( = ?auto_16895 ?auto_16902 ) ) ( not ( = ?auto_16895 ?auto_16903 ) ) ( not ( = ?auto_16896 ?auto_16902 ) ) ( not ( = ?auto_16896 ?auto_16903 ) ) ( not ( = ?auto_16897 ?auto_16902 ) ) ( not ( = ?auto_16897 ?auto_16903 ) ) ( not ( = ?auto_16898 ?auto_16902 ) ) ( not ( = ?auto_16898 ?auto_16903 ) ) ( not ( = ?auto_16899 ?auto_16902 ) ) ( not ( = ?auto_16899 ?auto_16903 ) ) ( not ( = ?auto_16900 ?auto_16902 ) ) ( not ( = ?auto_16900 ?auto_16903 ) ) ( not ( = ?auto_16902 ?auto_16914 ) ) ( not ( = ?auto_16902 ?auto_16934 ) ) ( not ( = ?auto_16902 ?auto_16919 ) ) ( not ( = ?auto_16902 ?auto_16932 ) ) ( not ( = ?auto_16902 ?auto_16912 ) ) ( not ( = ?auto_16902 ?auto_16924 ) ) ( not ( = ?auto_16902 ?auto_16923 ) ) ( not ( = ?auto_16902 ?auto_16928 ) ) ( not ( = ?auto_16902 ?auto_16922 ) ) ( not ( = ?auto_16902 ?auto_16915 ) ) ( not ( = ?auto_16902 ?auto_16921 ) ) ( not ( = ?auto_16908 ?auto_16918 ) ) ( not ( = ?auto_16908 ?auto_16910 ) ) ( not ( = ?auto_16908 ?auto_16909 ) ) ( not ( = ?auto_16908 ?auto_16913 ) ) ( not ( = ?auto_16908 ?auto_16917 ) ) ( not ( = ?auto_16908 ?auto_16925 ) ) ( not ( = ?auto_16908 ?auto_16930 ) ) ( not ( = ?auto_16908 ?auto_16920 ) ) ( not ( = ?auto_16907 ?auto_16931 ) ) ( not ( = ?auto_16907 ?auto_16926 ) ) ( not ( = ?auto_16907 ?auto_16927 ) ) ( not ( = ?auto_16907 ?auto_16929 ) ) ( not ( = ?auto_16907 ?auto_16911 ) ) ( not ( = ?auto_16907 ?auto_16933 ) ) ( not ( = ?auto_16907 ?auto_16916 ) ) ( not ( = ?auto_16907 ?auto_16935 ) ) ( not ( = ?auto_16903 ?auto_16914 ) ) ( not ( = ?auto_16903 ?auto_16934 ) ) ( not ( = ?auto_16903 ?auto_16919 ) ) ( not ( = ?auto_16903 ?auto_16932 ) ) ( not ( = ?auto_16903 ?auto_16912 ) ) ( not ( = ?auto_16903 ?auto_16924 ) ) ( not ( = ?auto_16903 ?auto_16923 ) ) ( not ( = ?auto_16903 ?auto_16928 ) ) ( not ( = ?auto_16903 ?auto_16922 ) ) ( not ( = ?auto_16903 ?auto_16915 ) ) ( not ( = ?auto_16903 ?auto_16921 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16890 ?auto_16891 ?auto_16892 ?auto_16893 ?auto_16894 ?auto_16895 ?auto_16896 ?auto_16897 ?auto_16898 ?auto_16899 ?auto_16900 ?auto_16901 )
      ( MAKE-1CRATE ?auto_16901 ?auto_16902 )
      ( MAKE-12CRATE-VERIFY ?auto_16890 ?auto_16891 ?auto_16892 ?auto_16893 ?auto_16894 ?auto_16895 ?auto_16896 ?auto_16897 ?auto_16898 ?auto_16899 ?auto_16900 ?auto_16901 ?auto_16902 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_16960 - SURFACE
      ?auto_16961 - SURFACE
      ?auto_16962 - SURFACE
      ?auto_16963 - SURFACE
      ?auto_16964 - SURFACE
      ?auto_16965 - SURFACE
      ?auto_16966 - SURFACE
      ?auto_16967 - SURFACE
      ?auto_16968 - SURFACE
      ?auto_16969 - SURFACE
      ?auto_16970 - SURFACE
      ?auto_16971 - SURFACE
      ?auto_16972 - SURFACE
      ?auto_16973 - SURFACE
    )
    :vars
    (
      ?auto_16975 - HOIST
      ?auto_16976 - PLACE
      ?auto_16978 - PLACE
      ?auto_16977 - HOIST
      ?auto_16979 - SURFACE
      ?auto_16995 - PLACE
      ?auto_16990 - HOIST
      ?auto_16988 - SURFACE
      ?auto_16998 - PLACE
      ?auto_16984 - HOIST
      ?auto_16997 - SURFACE
      ?auto_17008 - PLACE
      ?auto_16980 - HOIST
      ?auto_16982 - SURFACE
      ?auto_17000 - PLACE
      ?auto_17001 - HOIST
      ?auto_16994 - SURFACE
      ?auto_16987 - SURFACE
      ?auto_16985 - PLACE
      ?auto_17005 - HOIST
      ?auto_16981 - SURFACE
      ?auto_17006 - PLACE
      ?auto_17009 - HOIST
      ?auto_17007 - SURFACE
      ?auto_16993 - PLACE
      ?auto_16991 - HOIST
      ?auto_16983 - SURFACE
      ?auto_16999 - PLACE
      ?auto_16996 - HOIST
      ?auto_17002 - SURFACE
      ?auto_17004 - SURFACE
      ?auto_16986 - PLACE
      ?auto_17003 - HOIST
      ?auto_16992 - SURFACE
      ?auto_16989 - SURFACE
      ?auto_16974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16975 ?auto_16976 ) ( IS-CRATE ?auto_16973 ) ( not ( = ?auto_16978 ?auto_16976 ) ) ( HOIST-AT ?auto_16977 ?auto_16978 ) ( AVAILABLE ?auto_16977 ) ( SURFACE-AT ?auto_16973 ?auto_16978 ) ( ON ?auto_16973 ?auto_16979 ) ( CLEAR ?auto_16973 ) ( not ( = ?auto_16972 ?auto_16973 ) ) ( not ( = ?auto_16972 ?auto_16979 ) ) ( not ( = ?auto_16973 ?auto_16979 ) ) ( not ( = ?auto_16975 ?auto_16977 ) ) ( IS-CRATE ?auto_16972 ) ( not ( = ?auto_16995 ?auto_16976 ) ) ( HOIST-AT ?auto_16990 ?auto_16995 ) ( AVAILABLE ?auto_16990 ) ( SURFACE-AT ?auto_16972 ?auto_16995 ) ( ON ?auto_16972 ?auto_16988 ) ( CLEAR ?auto_16972 ) ( not ( = ?auto_16971 ?auto_16972 ) ) ( not ( = ?auto_16971 ?auto_16988 ) ) ( not ( = ?auto_16972 ?auto_16988 ) ) ( not ( = ?auto_16975 ?auto_16990 ) ) ( IS-CRATE ?auto_16971 ) ( not ( = ?auto_16998 ?auto_16976 ) ) ( HOIST-AT ?auto_16984 ?auto_16998 ) ( AVAILABLE ?auto_16984 ) ( SURFACE-AT ?auto_16971 ?auto_16998 ) ( ON ?auto_16971 ?auto_16997 ) ( CLEAR ?auto_16971 ) ( not ( = ?auto_16970 ?auto_16971 ) ) ( not ( = ?auto_16970 ?auto_16997 ) ) ( not ( = ?auto_16971 ?auto_16997 ) ) ( not ( = ?auto_16975 ?auto_16984 ) ) ( IS-CRATE ?auto_16970 ) ( not ( = ?auto_17008 ?auto_16976 ) ) ( HOIST-AT ?auto_16980 ?auto_17008 ) ( SURFACE-AT ?auto_16970 ?auto_17008 ) ( ON ?auto_16970 ?auto_16982 ) ( CLEAR ?auto_16970 ) ( not ( = ?auto_16969 ?auto_16970 ) ) ( not ( = ?auto_16969 ?auto_16982 ) ) ( not ( = ?auto_16970 ?auto_16982 ) ) ( not ( = ?auto_16975 ?auto_16980 ) ) ( IS-CRATE ?auto_16969 ) ( not ( = ?auto_17000 ?auto_16976 ) ) ( HOIST-AT ?auto_17001 ?auto_17000 ) ( SURFACE-AT ?auto_16969 ?auto_17000 ) ( ON ?auto_16969 ?auto_16994 ) ( CLEAR ?auto_16969 ) ( not ( = ?auto_16968 ?auto_16969 ) ) ( not ( = ?auto_16968 ?auto_16994 ) ) ( not ( = ?auto_16969 ?auto_16994 ) ) ( not ( = ?auto_16975 ?auto_17001 ) ) ( IS-CRATE ?auto_16968 ) ( AVAILABLE ?auto_16980 ) ( SURFACE-AT ?auto_16968 ?auto_17008 ) ( ON ?auto_16968 ?auto_16987 ) ( CLEAR ?auto_16968 ) ( not ( = ?auto_16967 ?auto_16968 ) ) ( not ( = ?auto_16967 ?auto_16987 ) ) ( not ( = ?auto_16968 ?auto_16987 ) ) ( IS-CRATE ?auto_16967 ) ( not ( = ?auto_16985 ?auto_16976 ) ) ( HOIST-AT ?auto_17005 ?auto_16985 ) ( SURFACE-AT ?auto_16967 ?auto_16985 ) ( ON ?auto_16967 ?auto_16981 ) ( CLEAR ?auto_16967 ) ( not ( = ?auto_16966 ?auto_16967 ) ) ( not ( = ?auto_16966 ?auto_16981 ) ) ( not ( = ?auto_16967 ?auto_16981 ) ) ( not ( = ?auto_16975 ?auto_17005 ) ) ( IS-CRATE ?auto_16966 ) ( not ( = ?auto_17006 ?auto_16976 ) ) ( HOIST-AT ?auto_17009 ?auto_17006 ) ( AVAILABLE ?auto_17009 ) ( SURFACE-AT ?auto_16966 ?auto_17006 ) ( ON ?auto_16966 ?auto_17007 ) ( CLEAR ?auto_16966 ) ( not ( = ?auto_16965 ?auto_16966 ) ) ( not ( = ?auto_16965 ?auto_17007 ) ) ( not ( = ?auto_16966 ?auto_17007 ) ) ( not ( = ?auto_16975 ?auto_17009 ) ) ( IS-CRATE ?auto_16965 ) ( not ( = ?auto_16993 ?auto_16976 ) ) ( HOIST-AT ?auto_16991 ?auto_16993 ) ( AVAILABLE ?auto_16991 ) ( SURFACE-AT ?auto_16965 ?auto_16993 ) ( ON ?auto_16965 ?auto_16983 ) ( CLEAR ?auto_16965 ) ( not ( = ?auto_16964 ?auto_16965 ) ) ( not ( = ?auto_16964 ?auto_16983 ) ) ( not ( = ?auto_16965 ?auto_16983 ) ) ( not ( = ?auto_16975 ?auto_16991 ) ) ( IS-CRATE ?auto_16964 ) ( not ( = ?auto_16999 ?auto_16976 ) ) ( HOIST-AT ?auto_16996 ?auto_16999 ) ( AVAILABLE ?auto_16996 ) ( SURFACE-AT ?auto_16964 ?auto_16999 ) ( ON ?auto_16964 ?auto_17002 ) ( CLEAR ?auto_16964 ) ( not ( = ?auto_16963 ?auto_16964 ) ) ( not ( = ?auto_16963 ?auto_17002 ) ) ( not ( = ?auto_16964 ?auto_17002 ) ) ( not ( = ?auto_16975 ?auto_16996 ) ) ( IS-CRATE ?auto_16963 ) ( AVAILABLE ?auto_17001 ) ( SURFACE-AT ?auto_16963 ?auto_17000 ) ( ON ?auto_16963 ?auto_17004 ) ( CLEAR ?auto_16963 ) ( not ( = ?auto_16962 ?auto_16963 ) ) ( not ( = ?auto_16962 ?auto_17004 ) ) ( not ( = ?auto_16963 ?auto_17004 ) ) ( IS-CRATE ?auto_16962 ) ( not ( = ?auto_16986 ?auto_16976 ) ) ( HOIST-AT ?auto_17003 ?auto_16986 ) ( AVAILABLE ?auto_17003 ) ( SURFACE-AT ?auto_16962 ?auto_16986 ) ( ON ?auto_16962 ?auto_16992 ) ( CLEAR ?auto_16962 ) ( not ( = ?auto_16961 ?auto_16962 ) ) ( not ( = ?auto_16961 ?auto_16992 ) ) ( not ( = ?auto_16962 ?auto_16992 ) ) ( not ( = ?auto_16975 ?auto_17003 ) ) ( SURFACE-AT ?auto_16960 ?auto_16976 ) ( CLEAR ?auto_16960 ) ( IS-CRATE ?auto_16961 ) ( AVAILABLE ?auto_16975 ) ( AVAILABLE ?auto_17005 ) ( SURFACE-AT ?auto_16961 ?auto_16985 ) ( ON ?auto_16961 ?auto_16989 ) ( CLEAR ?auto_16961 ) ( TRUCK-AT ?auto_16974 ?auto_16976 ) ( not ( = ?auto_16960 ?auto_16961 ) ) ( not ( = ?auto_16960 ?auto_16989 ) ) ( not ( = ?auto_16961 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16962 ) ) ( not ( = ?auto_16960 ?auto_16992 ) ) ( not ( = ?auto_16962 ?auto_16989 ) ) ( not ( = ?auto_16986 ?auto_16985 ) ) ( not ( = ?auto_17003 ?auto_17005 ) ) ( not ( = ?auto_16992 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16963 ) ) ( not ( = ?auto_16960 ?auto_17004 ) ) ( not ( = ?auto_16961 ?auto_16963 ) ) ( not ( = ?auto_16961 ?auto_17004 ) ) ( not ( = ?auto_16963 ?auto_16992 ) ) ( not ( = ?auto_16963 ?auto_16989 ) ) ( not ( = ?auto_17000 ?auto_16986 ) ) ( not ( = ?auto_17000 ?auto_16985 ) ) ( not ( = ?auto_17001 ?auto_17003 ) ) ( not ( = ?auto_17001 ?auto_17005 ) ) ( not ( = ?auto_17004 ?auto_16992 ) ) ( not ( = ?auto_17004 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16964 ) ) ( not ( = ?auto_16960 ?auto_17002 ) ) ( not ( = ?auto_16961 ?auto_16964 ) ) ( not ( = ?auto_16961 ?auto_17002 ) ) ( not ( = ?auto_16962 ?auto_16964 ) ) ( not ( = ?auto_16962 ?auto_17002 ) ) ( not ( = ?auto_16964 ?auto_17004 ) ) ( not ( = ?auto_16964 ?auto_16992 ) ) ( not ( = ?auto_16964 ?auto_16989 ) ) ( not ( = ?auto_16999 ?auto_17000 ) ) ( not ( = ?auto_16999 ?auto_16986 ) ) ( not ( = ?auto_16999 ?auto_16985 ) ) ( not ( = ?auto_16996 ?auto_17001 ) ) ( not ( = ?auto_16996 ?auto_17003 ) ) ( not ( = ?auto_16996 ?auto_17005 ) ) ( not ( = ?auto_17002 ?auto_17004 ) ) ( not ( = ?auto_17002 ?auto_16992 ) ) ( not ( = ?auto_17002 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16965 ) ) ( not ( = ?auto_16960 ?auto_16983 ) ) ( not ( = ?auto_16961 ?auto_16965 ) ) ( not ( = ?auto_16961 ?auto_16983 ) ) ( not ( = ?auto_16962 ?auto_16965 ) ) ( not ( = ?auto_16962 ?auto_16983 ) ) ( not ( = ?auto_16963 ?auto_16965 ) ) ( not ( = ?auto_16963 ?auto_16983 ) ) ( not ( = ?auto_16965 ?auto_17002 ) ) ( not ( = ?auto_16965 ?auto_17004 ) ) ( not ( = ?auto_16965 ?auto_16992 ) ) ( not ( = ?auto_16965 ?auto_16989 ) ) ( not ( = ?auto_16993 ?auto_16999 ) ) ( not ( = ?auto_16993 ?auto_17000 ) ) ( not ( = ?auto_16993 ?auto_16986 ) ) ( not ( = ?auto_16993 ?auto_16985 ) ) ( not ( = ?auto_16991 ?auto_16996 ) ) ( not ( = ?auto_16991 ?auto_17001 ) ) ( not ( = ?auto_16991 ?auto_17003 ) ) ( not ( = ?auto_16991 ?auto_17005 ) ) ( not ( = ?auto_16983 ?auto_17002 ) ) ( not ( = ?auto_16983 ?auto_17004 ) ) ( not ( = ?auto_16983 ?auto_16992 ) ) ( not ( = ?auto_16983 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16966 ) ) ( not ( = ?auto_16960 ?auto_17007 ) ) ( not ( = ?auto_16961 ?auto_16966 ) ) ( not ( = ?auto_16961 ?auto_17007 ) ) ( not ( = ?auto_16962 ?auto_16966 ) ) ( not ( = ?auto_16962 ?auto_17007 ) ) ( not ( = ?auto_16963 ?auto_16966 ) ) ( not ( = ?auto_16963 ?auto_17007 ) ) ( not ( = ?auto_16964 ?auto_16966 ) ) ( not ( = ?auto_16964 ?auto_17007 ) ) ( not ( = ?auto_16966 ?auto_16983 ) ) ( not ( = ?auto_16966 ?auto_17002 ) ) ( not ( = ?auto_16966 ?auto_17004 ) ) ( not ( = ?auto_16966 ?auto_16992 ) ) ( not ( = ?auto_16966 ?auto_16989 ) ) ( not ( = ?auto_17006 ?auto_16993 ) ) ( not ( = ?auto_17006 ?auto_16999 ) ) ( not ( = ?auto_17006 ?auto_17000 ) ) ( not ( = ?auto_17006 ?auto_16986 ) ) ( not ( = ?auto_17006 ?auto_16985 ) ) ( not ( = ?auto_17009 ?auto_16991 ) ) ( not ( = ?auto_17009 ?auto_16996 ) ) ( not ( = ?auto_17009 ?auto_17001 ) ) ( not ( = ?auto_17009 ?auto_17003 ) ) ( not ( = ?auto_17009 ?auto_17005 ) ) ( not ( = ?auto_17007 ?auto_16983 ) ) ( not ( = ?auto_17007 ?auto_17002 ) ) ( not ( = ?auto_17007 ?auto_17004 ) ) ( not ( = ?auto_17007 ?auto_16992 ) ) ( not ( = ?auto_17007 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16967 ) ) ( not ( = ?auto_16960 ?auto_16981 ) ) ( not ( = ?auto_16961 ?auto_16967 ) ) ( not ( = ?auto_16961 ?auto_16981 ) ) ( not ( = ?auto_16962 ?auto_16967 ) ) ( not ( = ?auto_16962 ?auto_16981 ) ) ( not ( = ?auto_16963 ?auto_16967 ) ) ( not ( = ?auto_16963 ?auto_16981 ) ) ( not ( = ?auto_16964 ?auto_16967 ) ) ( not ( = ?auto_16964 ?auto_16981 ) ) ( not ( = ?auto_16965 ?auto_16967 ) ) ( not ( = ?auto_16965 ?auto_16981 ) ) ( not ( = ?auto_16967 ?auto_17007 ) ) ( not ( = ?auto_16967 ?auto_16983 ) ) ( not ( = ?auto_16967 ?auto_17002 ) ) ( not ( = ?auto_16967 ?auto_17004 ) ) ( not ( = ?auto_16967 ?auto_16992 ) ) ( not ( = ?auto_16967 ?auto_16989 ) ) ( not ( = ?auto_16981 ?auto_17007 ) ) ( not ( = ?auto_16981 ?auto_16983 ) ) ( not ( = ?auto_16981 ?auto_17002 ) ) ( not ( = ?auto_16981 ?auto_17004 ) ) ( not ( = ?auto_16981 ?auto_16992 ) ) ( not ( = ?auto_16981 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16968 ) ) ( not ( = ?auto_16960 ?auto_16987 ) ) ( not ( = ?auto_16961 ?auto_16968 ) ) ( not ( = ?auto_16961 ?auto_16987 ) ) ( not ( = ?auto_16962 ?auto_16968 ) ) ( not ( = ?auto_16962 ?auto_16987 ) ) ( not ( = ?auto_16963 ?auto_16968 ) ) ( not ( = ?auto_16963 ?auto_16987 ) ) ( not ( = ?auto_16964 ?auto_16968 ) ) ( not ( = ?auto_16964 ?auto_16987 ) ) ( not ( = ?auto_16965 ?auto_16968 ) ) ( not ( = ?auto_16965 ?auto_16987 ) ) ( not ( = ?auto_16966 ?auto_16968 ) ) ( not ( = ?auto_16966 ?auto_16987 ) ) ( not ( = ?auto_16968 ?auto_16981 ) ) ( not ( = ?auto_16968 ?auto_17007 ) ) ( not ( = ?auto_16968 ?auto_16983 ) ) ( not ( = ?auto_16968 ?auto_17002 ) ) ( not ( = ?auto_16968 ?auto_17004 ) ) ( not ( = ?auto_16968 ?auto_16992 ) ) ( not ( = ?auto_16968 ?auto_16989 ) ) ( not ( = ?auto_17008 ?auto_16985 ) ) ( not ( = ?auto_17008 ?auto_17006 ) ) ( not ( = ?auto_17008 ?auto_16993 ) ) ( not ( = ?auto_17008 ?auto_16999 ) ) ( not ( = ?auto_17008 ?auto_17000 ) ) ( not ( = ?auto_17008 ?auto_16986 ) ) ( not ( = ?auto_16980 ?auto_17005 ) ) ( not ( = ?auto_16980 ?auto_17009 ) ) ( not ( = ?auto_16980 ?auto_16991 ) ) ( not ( = ?auto_16980 ?auto_16996 ) ) ( not ( = ?auto_16980 ?auto_17001 ) ) ( not ( = ?auto_16980 ?auto_17003 ) ) ( not ( = ?auto_16987 ?auto_16981 ) ) ( not ( = ?auto_16987 ?auto_17007 ) ) ( not ( = ?auto_16987 ?auto_16983 ) ) ( not ( = ?auto_16987 ?auto_17002 ) ) ( not ( = ?auto_16987 ?auto_17004 ) ) ( not ( = ?auto_16987 ?auto_16992 ) ) ( not ( = ?auto_16987 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16969 ) ) ( not ( = ?auto_16960 ?auto_16994 ) ) ( not ( = ?auto_16961 ?auto_16969 ) ) ( not ( = ?auto_16961 ?auto_16994 ) ) ( not ( = ?auto_16962 ?auto_16969 ) ) ( not ( = ?auto_16962 ?auto_16994 ) ) ( not ( = ?auto_16963 ?auto_16969 ) ) ( not ( = ?auto_16963 ?auto_16994 ) ) ( not ( = ?auto_16964 ?auto_16969 ) ) ( not ( = ?auto_16964 ?auto_16994 ) ) ( not ( = ?auto_16965 ?auto_16969 ) ) ( not ( = ?auto_16965 ?auto_16994 ) ) ( not ( = ?auto_16966 ?auto_16969 ) ) ( not ( = ?auto_16966 ?auto_16994 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16994 ) ) ( not ( = ?auto_16969 ?auto_16987 ) ) ( not ( = ?auto_16969 ?auto_16981 ) ) ( not ( = ?auto_16969 ?auto_17007 ) ) ( not ( = ?auto_16969 ?auto_16983 ) ) ( not ( = ?auto_16969 ?auto_17002 ) ) ( not ( = ?auto_16969 ?auto_17004 ) ) ( not ( = ?auto_16969 ?auto_16992 ) ) ( not ( = ?auto_16969 ?auto_16989 ) ) ( not ( = ?auto_16994 ?auto_16987 ) ) ( not ( = ?auto_16994 ?auto_16981 ) ) ( not ( = ?auto_16994 ?auto_17007 ) ) ( not ( = ?auto_16994 ?auto_16983 ) ) ( not ( = ?auto_16994 ?auto_17002 ) ) ( not ( = ?auto_16994 ?auto_17004 ) ) ( not ( = ?auto_16994 ?auto_16992 ) ) ( not ( = ?auto_16994 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16970 ) ) ( not ( = ?auto_16960 ?auto_16982 ) ) ( not ( = ?auto_16961 ?auto_16970 ) ) ( not ( = ?auto_16961 ?auto_16982 ) ) ( not ( = ?auto_16962 ?auto_16970 ) ) ( not ( = ?auto_16962 ?auto_16982 ) ) ( not ( = ?auto_16963 ?auto_16970 ) ) ( not ( = ?auto_16963 ?auto_16982 ) ) ( not ( = ?auto_16964 ?auto_16970 ) ) ( not ( = ?auto_16964 ?auto_16982 ) ) ( not ( = ?auto_16965 ?auto_16970 ) ) ( not ( = ?auto_16965 ?auto_16982 ) ) ( not ( = ?auto_16966 ?auto_16970 ) ) ( not ( = ?auto_16966 ?auto_16982 ) ) ( not ( = ?auto_16967 ?auto_16970 ) ) ( not ( = ?auto_16967 ?auto_16982 ) ) ( not ( = ?auto_16968 ?auto_16970 ) ) ( not ( = ?auto_16968 ?auto_16982 ) ) ( not ( = ?auto_16970 ?auto_16994 ) ) ( not ( = ?auto_16970 ?auto_16987 ) ) ( not ( = ?auto_16970 ?auto_16981 ) ) ( not ( = ?auto_16970 ?auto_17007 ) ) ( not ( = ?auto_16970 ?auto_16983 ) ) ( not ( = ?auto_16970 ?auto_17002 ) ) ( not ( = ?auto_16970 ?auto_17004 ) ) ( not ( = ?auto_16970 ?auto_16992 ) ) ( not ( = ?auto_16970 ?auto_16989 ) ) ( not ( = ?auto_16982 ?auto_16994 ) ) ( not ( = ?auto_16982 ?auto_16987 ) ) ( not ( = ?auto_16982 ?auto_16981 ) ) ( not ( = ?auto_16982 ?auto_17007 ) ) ( not ( = ?auto_16982 ?auto_16983 ) ) ( not ( = ?auto_16982 ?auto_17002 ) ) ( not ( = ?auto_16982 ?auto_17004 ) ) ( not ( = ?auto_16982 ?auto_16992 ) ) ( not ( = ?auto_16982 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16971 ) ) ( not ( = ?auto_16960 ?auto_16997 ) ) ( not ( = ?auto_16961 ?auto_16971 ) ) ( not ( = ?auto_16961 ?auto_16997 ) ) ( not ( = ?auto_16962 ?auto_16971 ) ) ( not ( = ?auto_16962 ?auto_16997 ) ) ( not ( = ?auto_16963 ?auto_16971 ) ) ( not ( = ?auto_16963 ?auto_16997 ) ) ( not ( = ?auto_16964 ?auto_16971 ) ) ( not ( = ?auto_16964 ?auto_16997 ) ) ( not ( = ?auto_16965 ?auto_16971 ) ) ( not ( = ?auto_16965 ?auto_16997 ) ) ( not ( = ?auto_16966 ?auto_16971 ) ) ( not ( = ?auto_16966 ?auto_16997 ) ) ( not ( = ?auto_16967 ?auto_16971 ) ) ( not ( = ?auto_16967 ?auto_16997 ) ) ( not ( = ?auto_16968 ?auto_16971 ) ) ( not ( = ?auto_16968 ?auto_16997 ) ) ( not ( = ?auto_16969 ?auto_16971 ) ) ( not ( = ?auto_16969 ?auto_16997 ) ) ( not ( = ?auto_16971 ?auto_16982 ) ) ( not ( = ?auto_16971 ?auto_16994 ) ) ( not ( = ?auto_16971 ?auto_16987 ) ) ( not ( = ?auto_16971 ?auto_16981 ) ) ( not ( = ?auto_16971 ?auto_17007 ) ) ( not ( = ?auto_16971 ?auto_16983 ) ) ( not ( = ?auto_16971 ?auto_17002 ) ) ( not ( = ?auto_16971 ?auto_17004 ) ) ( not ( = ?auto_16971 ?auto_16992 ) ) ( not ( = ?auto_16971 ?auto_16989 ) ) ( not ( = ?auto_16998 ?auto_17008 ) ) ( not ( = ?auto_16998 ?auto_17000 ) ) ( not ( = ?auto_16998 ?auto_16985 ) ) ( not ( = ?auto_16998 ?auto_17006 ) ) ( not ( = ?auto_16998 ?auto_16993 ) ) ( not ( = ?auto_16998 ?auto_16999 ) ) ( not ( = ?auto_16998 ?auto_16986 ) ) ( not ( = ?auto_16984 ?auto_16980 ) ) ( not ( = ?auto_16984 ?auto_17001 ) ) ( not ( = ?auto_16984 ?auto_17005 ) ) ( not ( = ?auto_16984 ?auto_17009 ) ) ( not ( = ?auto_16984 ?auto_16991 ) ) ( not ( = ?auto_16984 ?auto_16996 ) ) ( not ( = ?auto_16984 ?auto_17003 ) ) ( not ( = ?auto_16997 ?auto_16982 ) ) ( not ( = ?auto_16997 ?auto_16994 ) ) ( not ( = ?auto_16997 ?auto_16987 ) ) ( not ( = ?auto_16997 ?auto_16981 ) ) ( not ( = ?auto_16997 ?auto_17007 ) ) ( not ( = ?auto_16997 ?auto_16983 ) ) ( not ( = ?auto_16997 ?auto_17002 ) ) ( not ( = ?auto_16997 ?auto_17004 ) ) ( not ( = ?auto_16997 ?auto_16992 ) ) ( not ( = ?auto_16997 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16972 ) ) ( not ( = ?auto_16960 ?auto_16988 ) ) ( not ( = ?auto_16961 ?auto_16972 ) ) ( not ( = ?auto_16961 ?auto_16988 ) ) ( not ( = ?auto_16962 ?auto_16972 ) ) ( not ( = ?auto_16962 ?auto_16988 ) ) ( not ( = ?auto_16963 ?auto_16972 ) ) ( not ( = ?auto_16963 ?auto_16988 ) ) ( not ( = ?auto_16964 ?auto_16972 ) ) ( not ( = ?auto_16964 ?auto_16988 ) ) ( not ( = ?auto_16965 ?auto_16972 ) ) ( not ( = ?auto_16965 ?auto_16988 ) ) ( not ( = ?auto_16966 ?auto_16972 ) ) ( not ( = ?auto_16966 ?auto_16988 ) ) ( not ( = ?auto_16967 ?auto_16972 ) ) ( not ( = ?auto_16967 ?auto_16988 ) ) ( not ( = ?auto_16968 ?auto_16972 ) ) ( not ( = ?auto_16968 ?auto_16988 ) ) ( not ( = ?auto_16969 ?auto_16972 ) ) ( not ( = ?auto_16969 ?auto_16988 ) ) ( not ( = ?auto_16970 ?auto_16972 ) ) ( not ( = ?auto_16970 ?auto_16988 ) ) ( not ( = ?auto_16972 ?auto_16997 ) ) ( not ( = ?auto_16972 ?auto_16982 ) ) ( not ( = ?auto_16972 ?auto_16994 ) ) ( not ( = ?auto_16972 ?auto_16987 ) ) ( not ( = ?auto_16972 ?auto_16981 ) ) ( not ( = ?auto_16972 ?auto_17007 ) ) ( not ( = ?auto_16972 ?auto_16983 ) ) ( not ( = ?auto_16972 ?auto_17002 ) ) ( not ( = ?auto_16972 ?auto_17004 ) ) ( not ( = ?auto_16972 ?auto_16992 ) ) ( not ( = ?auto_16972 ?auto_16989 ) ) ( not ( = ?auto_16995 ?auto_16998 ) ) ( not ( = ?auto_16995 ?auto_17008 ) ) ( not ( = ?auto_16995 ?auto_17000 ) ) ( not ( = ?auto_16995 ?auto_16985 ) ) ( not ( = ?auto_16995 ?auto_17006 ) ) ( not ( = ?auto_16995 ?auto_16993 ) ) ( not ( = ?auto_16995 ?auto_16999 ) ) ( not ( = ?auto_16995 ?auto_16986 ) ) ( not ( = ?auto_16990 ?auto_16984 ) ) ( not ( = ?auto_16990 ?auto_16980 ) ) ( not ( = ?auto_16990 ?auto_17001 ) ) ( not ( = ?auto_16990 ?auto_17005 ) ) ( not ( = ?auto_16990 ?auto_17009 ) ) ( not ( = ?auto_16990 ?auto_16991 ) ) ( not ( = ?auto_16990 ?auto_16996 ) ) ( not ( = ?auto_16990 ?auto_17003 ) ) ( not ( = ?auto_16988 ?auto_16997 ) ) ( not ( = ?auto_16988 ?auto_16982 ) ) ( not ( = ?auto_16988 ?auto_16994 ) ) ( not ( = ?auto_16988 ?auto_16987 ) ) ( not ( = ?auto_16988 ?auto_16981 ) ) ( not ( = ?auto_16988 ?auto_17007 ) ) ( not ( = ?auto_16988 ?auto_16983 ) ) ( not ( = ?auto_16988 ?auto_17002 ) ) ( not ( = ?auto_16988 ?auto_17004 ) ) ( not ( = ?auto_16988 ?auto_16992 ) ) ( not ( = ?auto_16988 ?auto_16989 ) ) ( not ( = ?auto_16960 ?auto_16973 ) ) ( not ( = ?auto_16960 ?auto_16979 ) ) ( not ( = ?auto_16961 ?auto_16973 ) ) ( not ( = ?auto_16961 ?auto_16979 ) ) ( not ( = ?auto_16962 ?auto_16973 ) ) ( not ( = ?auto_16962 ?auto_16979 ) ) ( not ( = ?auto_16963 ?auto_16973 ) ) ( not ( = ?auto_16963 ?auto_16979 ) ) ( not ( = ?auto_16964 ?auto_16973 ) ) ( not ( = ?auto_16964 ?auto_16979 ) ) ( not ( = ?auto_16965 ?auto_16973 ) ) ( not ( = ?auto_16965 ?auto_16979 ) ) ( not ( = ?auto_16966 ?auto_16973 ) ) ( not ( = ?auto_16966 ?auto_16979 ) ) ( not ( = ?auto_16967 ?auto_16973 ) ) ( not ( = ?auto_16967 ?auto_16979 ) ) ( not ( = ?auto_16968 ?auto_16973 ) ) ( not ( = ?auto_16968 ?auto_16979 ) ) ( not ( = ?auto_16969 ?auto_16973 ) ) ( not ( = ?auto_16969 ?auto_16979 ) ) ( not ( = ?auto_16970 ?auto_16973 ) ) ( not ( = ?auto_16970 ?auto_16979 ) ) ( not ( = ?auto_16971 ?auto_16973 ) ) ( not ( = ?auto_16971 ?auto_16979 ) ) ( not ( = ?auto_16973 ?auto_16988 ) ) ( not ( = ?auto_16973 ?auto_16997 ) ) ( not ( = ?auto_16973 ?auto_16982 ) ) ( not ( = ?auto_16973 ?auto_16994 ) ) ( not ( = ?auto_16973 ?auto_16987 ) ) ( not ( = ?auto_16973 ?auto_16981 ) ) ( not ( = ?auto_16973 ?auto_17007 ) ) ( not ( = ?auto_16973 ?auto_16983 ) ) ( not ( = ?auto_16973 ?auto_17002 ) ) ( not ( = ?auto_16973 ?auto_17004 ) ) ( not ( = ?auto_16973 ?auto_16992 ) ) ( not ( = ?auto_16973 ?auto_16989 ) ) ( not ( = ?auto_16978 ?auto_16995 ) ) ( not ( = ?auto_16978 ?auto_16998 ) ) ( not ( = ?auto_16978 ?auto_17008 ) ) ( not ( = ?auto_16978 ?auto_17000 ) ) ( not ( = ?auto_16978 ?auto_16985 ) ) ( not ( = ?auto_16978 ?auto_17006 ) ) ( not ( = ?auto_16978 ?auto_16993 ) ) ( not ( = ?auto_16978 ?auto_16999 ) ) ( not ( = ?auto_16978 ?auto_16986 ) ) ( not ( = ?auto_16977 ?auto_16990 ) ) ( not ( = ?auto_16977 ?auto_16984 ) ) ( not ( = ?auto_16977 ?auto_16980 ) ) ( not ( = ?auto_16977 ?auto_17001 ) ) ( not ( = ?auto_16977 ?auto_17005 ) ) ( not ( = ?auto_16977 ?auto_17009 ) ) ( not ( = ?auto_16977 ?auto_16991 ) ) ( not ( = ?auto_16977 ?auto_16996 ) ) ( not ( = ?auto_16977 ?auto_17003 ) ) ( not ( = ?auto_16979 ?auto_16988 ) ) ( not ( = ?auto_16979 ?auto_16997 ) ) ( not ( = ?auto_16979 ?auto_16982 ) ) ( not ( = ?auto_16979 ?auto_16994 ) ) ( not ( = ?auto_16979 ?auto_16987 ) ) ( not ( = ?auto_16979 ?auto_16981 ) ) ( not ( = ?auto_16979 ?auto_17007 ) ) ( not ( = ?auto_16979 ?auto_16983 ) ) ( not ( = ?auto_16979 ?auto_17002 ) ) ( not ( = ?auto_16979 ?auto_17004 ) ) ( not ( = ?auto_16979 ?auto_16992 ) ) ( not ( = ?auto_16979 ?auto_16989 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16960 ?auto_16961 ?auto_16962 ?auto_16963 ?auto_16964 ?auto_16965 ?auto_16966 ?auto_16967 ?auto_16968 ?auto_16969 ?auto_16970 ?auto_16971 ?auto_16972 )
      ( MAKE-1CRATE ?auto_16972 ?auto_16973 )
      ( MAKE-13CRATE-VERIFY ?auto_16960 ?auto_16961 ?auto_16962 ?auto_16963 ?auto_16964 ?auto_16965 ?auto_16966 ?auto_16967 ?auto_16968 ?auto_16969 ?auto_16970 ?auto_16971 ?auto_16972 ?auto_16973 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_17035 - SURFACE
      ?auto_17036 - SURFACE
      ?auto_17037 - SURFACE
      ?auto_17038 - SURFACE
      ?auto_17039 - SURFACE
      ?auto_17040 - SURFACE
      ?auto_17041 - SURFACE
      ?auto_17042 - SURFACE
      ?auto_17043 - SURFACE
      ?auto_17044 - SURFACE
      ?auto_17045 - SURFACE
      ?auto_17046 - SURFACE
      ?auto_17047 - SURFACE
      ?auto_17048 - SURFACE
      ?auto_17049 - SURFACE
    )
    :vars
    (
      ?auto_17052 - HOIST
      ?auto_17051 - PLACE
      ?auto_17055 - PLACE
      ?auto_17050 - HOIST
      ?auto_17053 - SURFACE
      ?auto_17084 - PLACE
      ?auto_17082 - HOIST
      ?auto_17072 - SURFACE
      ?auto_17058 - PLACE
      ?auto_17076 - HOIST
      ?auto_17064 - SURFACE
      ?auto_17066 - PLACE
      ?auto_17070 - HOIST
      ?auto_17063 - SURFACE
      ?auto_17067 - PLACE
      ?auto_17074 - HOIST
      ?auto_17078 - SURFACE
      ?auto_17056 - PLACE
      ?auto_17086 - HOIST
      ?auto_17060 - SURFACE
      ?auto_17073 - SURFACE
      ?auto_17061 - PLACE
      ?auto_17077 - HOIST
      ?auto_17068 - SURFACE
      ?auto_17065 - PLACE
      ?auto_17071 - HOIST
      ?auto_17081 - SURFACE
      ?auto_17080 - PLACE
      ?auto_17079 - HOIST
      ?auto_17069 - SURFACE
      ?auto_17083 - SURFACE
      ?auto_17057 - SURFACE
      ?auto_17085 - PLACE
      ?auto_17062 - HOIST
      ?auto_17075 - SURFACE
      ?auto_17059 - SURFACE
      ?auto_17054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17052 ?auto_17051 ) ( IS-CRATE ?auto_17049 ) ( not ( = ?auto_17055 ?auto_17051 ) ) ( HOIST-AT ?auto_17050 ?auto_17055 ) ( SURFACE-AT ?auto_17049 ?auto_17055 ) ( ON ?auto_17049 ?auto_17053 ) ( CLEAR ?auto_17049 ) ( not ( = ?auto_17048 ?auto_17049 ) ) ( not ( = ?auto_17048 ?auto_17053 ) ) ( not ( = ?auto_17049 ?auto_17053 ) ) ( not ( = ?auto_17052 ?auto_17050 ) ) ( IS-CRATE ?auto_17048 ) ( not ( = ?auto_17084 ?auto_17051 ) ) ( HOIST-AT ?auto_17082 ?auto_17084 ) ( AVAILABLE ?auto_17082 ) ( SURFACE-AT ?auto_17048 ?auto_17084 ) ( ON ?auto_17048 ?auto_17072 ) ( CLEAR ?auto_17048 ) ( not ( = ?auto_17047 ?auto_17048 ) ) ( not ( = ?auto_17047 ?auto_17072 ) ) ( not ( = ?auto_17048 ?auto_17072 ) ) ( not ( = ?auto_17052 ?auto_17082 ) ) ( IS-CRATE ?auto_17047 ) ( not ( = ?auto_17058 ?auto_17051 ) ) ( HOIST-AT ?auto_17076 ?auto_17058 ) ( AVAILABLE ?auto_17076 ) ( SURFACE-AT ?auto_17047 ?auto_17058 ) ( ON ?auto_17047 ?auto_17064 ) ( CLEAR ?auto_17047 ) ( not ( = ?auto_17046 ?auto_17047 ) ) ( not ( = ?auto_17046 ?auto_17064 ) ) ( not ( = ?auto_17047 ?auto_17064 ) ) ( not ( = ?auto_17052 ?auto_17076 ) ) ( IS-CRATE ?auto_17046 ) ( not ( = ?auto_17066 ?auto_17051 ) ) ( HOIST-AT ?auto_17070 ?auto_17066 ) ( AVAILABLE ?auto_17070 ) ( SURFACE-AT ?auto_17046 ?auto_17066 ) ( ON ?auto_17046 ?auto_17063 ) ( CLEAR ?auto_17046 ) ( not ( = ?auto_17045 ?auto_17046 ) ) ( not ( = ?auto_17045 ?auto_17063 ) ) ( not ( = ?auto_17046 ?auto_17063 ) ) ( not ( = ?auto_17052 ?auto_17070 ) ) ( IS-CRATE ?auto_17045 ) ( not ( = ?auto_17067 ?auto_17051 ) ) ( HOIST-AT ?auto_17074 ?auto_17067 ) ( SURFACE-AT ?auto_17045 ?auto_17067 ) ( ON ?auto_17045 ?auto_17078 ) ( CLEAR ?auto_17045 ) ( not ( = ?auto_17044 ?auto_17045 ) ) ( not ( = ?auto_17044 ?auto_17078 ) ) ( not ( = ?auto_17045 ?auto_17078 ) ) ( not ( = ?auto_17052 ?auto_17074 ) ) ( IS-CRATE ?auto_17044 ) ( not ( = ?auto_17056 ?auto_17051 ) ) ( HOIST-AT ?auto_17086 ?auto_17056 ) ( SURFACE-AT ?auto_17044 ?auto_17056 ) ( ON ?auto_17044 ?auto_17060 ) ( CLEAR ?auto_17044 ) ( not ( = ?auto_17043 ?auto_17044 ) ) ( not ( = ?auto_17043 ?auto_17060 ) ) ( not ( = ?auto_17044 ?auto_17060 ) ) ( not ( = ?auto_17052 ?auto_17086 ) ) ( IS-CRATE ?auto_17043 ) ( AVAILABLE ?auto_17074 ) ( SURFACE-AT ?auto_17043 ?auto_17067 ) ( ON ?auto_17043 ?auto_17073 ) ( CLEAR ?auto_17043 ) ( not ( = ?auto_17042 ?auto_17043 ) ) ( not ( = ?auto_17042 ?auto_17073 ) ) ( not ( = ?auto_17043 ?auto_17073 ) ) ( IS-CRATE ?auto_17042 ) ( not ( = ?auto_17061 ?auto_17051 ) ) ( HOIST-AT ?auto_17077 ?auto_17061 ) ( SURFACE-AT ?auto_17042 ?auto_17061 ) ( ON ?auto_17042 ?auto_17068 ) ( CLEAR ?auto_17042 ) ( not ( = ?auto_17041 ?auto_17042 ) ) ( not ( = ?auto_17041 ?auto_17068 ) ) ( not ( = ?auto_17042 ?auto_17068 ) ) ( not ( = ?auto_17052 ?auto_17077 ) ) ( IS-CRATE ?auto_17041 ) ( not ( = ?auto_17065 ?auto_17051 ) ) ( HOIST-AT ?auto_17071 ?auto_17065 ) ( AVAILABLE ?auto_17071 ) ( SURFACE-AT ?auto_17041 ?auto_17065 ) ( ON ?auto_17041 ?auto_17081 ) ( CLEAR ?auto_17041 ) ( not ( = ?auto_17040 ?auto_17041 ) ) ( not ( = ?auto_17040 ?auto_17081 ) ) ( not ( = ?auto_17041 ?auto_17081 ) ) ( not ( = ?auto_17052 ?auto_17071 ) ) ( IS-CRATE ?auto_17040 ) ( not ( = ?auto_17080 ?auto_17051 ) ) ( HOIST-AT ?auto_17079 ?auto_17080 ) ( AVAILABLE ?auto_17079 ) ( SURFACE-AT ?auto_17040 ?auto_17080 ) ( ON ?auto_17040 ?auto_17069 ) ( CLEAR ?auto_17040 ) ( not ( = ?auto_17039 ?auto_17040 ) ) ( not ( = ?auto_17039 ?auto_17069 ) ) ( not ( = ?auto_17040 ?auto_17069 ) ) ( not ( = ?auto_17052 ?auto_17079 ) ) ( IS-CRATE ?auto_17039 ) ( AVAILABLE ?auto_17050 ) ( SURFACE-AT ?auto_17039 ?auto_17055 ) ( ON ?auto_17039 ?auto_17083 ) ( CLEAR ?auto_17039 ) ( not ( = ?auto_17038 ?auto_17039 ) ) ( not ( = ?auto_17038 ?auto_17083 ) ) ( not ( = ?auto_17039 ?auto_17083 ) ) ( IS-CRATE ?auto_17038 ) ( AVAILABLE ?auto_17086 ) ( SURFACE-AT ?auto_17038 ?auto_17056 ) ( ON ?auto_17038 ?auto_17057 ) ( CLEAR ?auto_17038 ) ( not ( = ?auto_17037 ?auto_17038 ) ) ( not ( = ?auto_17037 ?auto_17057 ) ) ( not ( = ?auto_17038 ?auto_17057 ) ) ( IS-CRATE ?auto_17037 ) ( not ( = ?auto_17085 ?auto_17051 ) ) ( HOIST-AT ?auto_17062 ?auto_17085 ) ( AVAILABLE ?auto_17062 ) ( SURFACE-AT ?auto_17037 ?auto_17085 ) ( ON ?auto_17037 ?auto_17075 ) ( CLEAR ?auto_17037 ) ( not ( = ?auto_17036 ?auto_17037 ) ) ( not ( = ?auto_17036 ?auto_17075 ) ) ( not ( = ?auto_17037 ?auto_17075 ) ) ( not ( = ?auto_17052 ?auto_17062 ) ) ( SURFACE-AT ?auto_17035 ?auto_17051 ) ( CLEAR ?auto_17035 ) ( IS-CRATE ?auto_17036 ) ( AVAILABLE ?auto_17052 ) ( AVAILABLE ?auto_17077 ) ( SURFACE-AT ?auto_17036 ?auto_17061 ) ( ON ?auto_17036 ?auto_17059 ) ( CLEAR ?auto_17036 ) ( TRUCK-AT ?auto_17054 ?auto_17051 ) ( not ( = ?auto_17035 ?auto_17036 ) ) ( not ( = ?auto_17035 ?auto_17059 ) ) ( not ( = ?auto_17036 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17037 ) ) ( not ( = ?auto_17035 ?auto_17075 ) ) ( not ( = ?auto_17037 ?auto_17059 ) ) ( not ( = ?auto_17085 ?auto_17061 ) ) ( not ( = ?auto_17062 ?auto_17077 ) ) ( not ( = ?auto_17075 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17038 ) ) ( not ( = ?auto_17035 ?auto_17057 ) ) ( not ( = ?auto_17036 ?auto_17038 ) ) ( not ( = ?auto_17036 ?auto_17057 ) ) ( not ( = ?auto_17038 ?auto_17075 ) ) ( not ( = ?auto_17038 ?auto_17059 ) ) ( not ( = ?auto_17056 ?auto_17085 ) ) ( not ( = ?auto_17056 ?auto_17061 ) ) ( not ( = ?auto_17086 ?auto_17062 ) ) ( not ( = ?auto_17086 ?auto_17077 ) ) ( not ( = ?auto_17057 ?auto_17075 ) ) ( not ( = ?auto_17057 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17039 ) ) ( not ( = ?auto_17035 ?auto_17083 ) ) ( not ( = ?auto_17036 ?auto_17039 ) ) ( not ( = ?auto_17036 ?auto_17083 ) ) ( not ( = ?auto_17037 ?auto_17039 ) ) ( not ( = ?auto_17037 ?auto_17083 ) ) ( not ( = ?auto_17039 ?auto_17057 ) ) ( not ( = ?auto_17039 ?auto_17075 ) ) ( not ( = ?auto_17039 ?auto_17059 ) ) ( not ( = ?auto_17055 ?auto_17056 ) ) ( not ( = ?auto_17055 ?auto_17085 ) ) ( not ( = ?auto_17055 ?auto_17061 ) ) ( not ( = ?auto_17050 ?auto_17086 ) ) ( not ( = ?auto_17050 ?auto_17062 ) ) ( not ( = ?auto_17050 ?auto_17077 ) ) ( not ( = ?auto_17083 ?auto_17057 ) ) ( not ( = ?auto_17083 ?auto_17075 ) ) ( not ( = ?auto_17083 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17040 ) ) ( not ( = ?auto_17035 ?auto_17069 ) ) ( not ( = ?auto_17036 ?auto_17040 ) ) ( not ( = ?auto_17036 ?auto_17069 ) ) ( not ( = ?auto_17037 ?auto_17040 ) ) ( not ( = ?auto_17037 ?auto_17069 ) ) ( not ( = ?auto_17038 ?auto_17040 ) ) ( not ( = ?auto_17038 ?auto_17069 ) ) ( not ( = ?auto_17040 ?auto_17083 ) ) ( not ( = ?auto_17040 ?auto_17057 ) ) ( not ( = ?auto_17040 ?auto_17075 ) ) ( not ( = ?auto_17040 ?auto_17059 ) ) ( not ( = ?auto_17080 ?auto_17055 ) ) ( not ( = ?auto_17080 ?auto_17056 ) ) ( not ( = ?auto_17080 ?auto_17085 ) ) ( not ( = ?auto_17080 ?auto_17061 ) ) ( not ( = ?auto_17079 ?auto_17050 ) ) ( not ( = ?auto_17079 ?auto_17086 ) ) ( not ( = ?auto_17079 ?auto_17062 ) ) ( not ( = ?auto_17079 ?auto_17077 ) ) ( not ( = ?auto_17069 ?auto_17083 ) ) ( not ( = ?auto_17069 ?auto_17057 ) ) ( not ( = ?auto_17069 ?auto_17075 ) ) ( not ( = ?auto_17069 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17041 ) ) ( not ( = ?auto_17035 ?auto_17081 ) ) ( not ( = ?auto_17036 ?auto_17041 ) ) ( not ( = ?auto_17036 ?auto_17081 ) ) ( not ( = ?auto_17037 ?auto_17041 ) ) ( not ( = ?auto_17037 ?auto_17081 ) ) ( not ( = ?auto_17038 ?auto_17041 ) ) ( not ( = ?auto_17038 ?auto_17081 ) ) ( not ( = ?auto_17039 ?auto_17041 ) ) ( not ( = ?auto_17039 ?auto_17081 ) ) ( not ( = ?auto_17041 ?auto_17069 ) ) ( not ( = ?auto_17041 ?auto_17083 ) ) ( not ( = ?auto_17041 ?auto_17057 ) ) ( not ( = ?auto_17041 ?auto_17075 ) ) ( not ( = ?auto_17041 ?auto_17059 ) ) ( not ( = ?auto_17065 ?auto_17080 ) ) ( not ( = ?auto_17065 ?auto_17055 ) ) ( not ( = ?auto_17065 ?auto_17056 ) ) ( not ( = ?auto_17065 ?auto_17085 ) ) ( not ( = ?auto_17065 ?auto_17061 ) ) ( not ( = ?auto_17071 ?auto_17079 ) ) ( not ( = ?auto_17071 ?auto_17050 ) ) ( not ( = ?auto_17071 ?auto_17086 ) ) ( not ( = ?auto_17071 ?auto_17062 ) ) ( not ( = ?auto_17071 ?auto_17077 ) ) ( not ( = ?auto_17081 ?auto_17069 ) ) ( not ( = ?auto_17081 ?auto_17083 ) ) ( not ( = ?auto_17081 ?auto_17057 ) ) ( not ( = ?auto_17081 ?auto_17075 ) ) ( not ( = ?auto_17081 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17042 ) ) ( not ( = ?auto_17035 ?auto_17068 ) ) ( not ( = ?auto_17036 ?auto_17042 ) ) ( not ( = ?auto_17036 ?auto_17068 ) ) ( not ( = ?auto_17037 ?auto_17042 ) ) ( not ( = ?auto_17037 ?auto_17068 ) ) ( not ( = ?auto_17038 ?auto_17042 ) ) ( not ( = ?auto_17038 ?auto_17068 ) ) ( not ( = ?auto_17039 ?auto_17042 ) ) ( not ( = ?auto_17039 ?auto_17068 ) ) ( not ( = ?auto_17040 ?auto_17042 ) ) ( not ( = ?auto_17040 ?auto_17068 ) ) ( not ( = ?auto_17042 ?auto_17081 ) ) ( not ( = ?auto_17042 ?auto_17069 ) ) ( not ( = ?auto_17042 ?auto_17083 ) ) ( not ( = ?auto_17042 ?auto_17057 ) ) ( not ( = ?auto_17042 ?auto_17075 ) ) ( not ( = ?auto_17042 ?auto_17059 ) ) ( not ( = ?auto_17068 ?auto_17081 ) ) ( not ( = ?auto_17068 ?auto_17069 ) ) ( not ( = ?auto_17068 ?auto_17083 ) ) ( not ( = ?auto_17068 ?auto_17057 ) ) ( not ( = ?auto_17068 ?auto_17075 ) ) ( not ( = ?auto_17068 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17043 ) ) ( not ( = ?auto_17035 ?auto_17073 ) ) ( not ( = ?auto_17036 ?auto_17043 ) ) ( not ( = ?auto_17036 ?auto_17073 ) ) ( not ( = ?auto_17037 ?auto_17043 ) ) ( not ( = ?auto_17037 ?auto_17073 ) ) ( not ( = ?auto_17038 ?auto_17043 ) ) ( not ( = ?auto_17038 ?auto_17073 ) ) ( not ( = ?auto_17039 ?auto_17043 ) ) ( not ( = ?auto_17039 ?auto_17073 ) ) ( not ( = ?auto_17040 ?auto_17043 ) ) ( not ( = ?auto_17040 ?auto_17073 ) ) ( not ( = ?auto_17041 ?auto_17043 ) ) ( not ( = ?auto_17041 ?auto_17073 ) ) ( not ( = ?auto_17043 ?auto_17068 ) ) ( not ( = ?auto_17043 ?auto_17081 ) ) ( not ( = ?auto_17043 ?auto_17069 ) ) ( not ( = ?auto_17043 ?auto_17083 ) ) ( not ( = ?auto_17043 ?auto_17057 ) ) ( not ( = ?auto_17043 ?auto_17075 ) ) ( not ( = ?auto_17043 ?auto_17059 ) ) ( not ( = ?auto_17067 ?auto_17061 ) ) ( not ( = ?auto_17067 ?auto_17065 ) ) ( not ( = ?auto_17067 ?auto_17080 ) ) ( not ( = ?auto_17067 ?auto_17055 ) ) ( not ( = ?auto_17067 ?auto_17056 ) ) ( not ( = ?auto_17067 ?auto_17085 ) ) ( not ( = ?auto_17074 ?auto_17077 ) ) ( not ( = ?auto_17074 ?auto_17071 ) ) ( not ( = ?auto_17074 ?auto_17079 ) ) ( not ( = ?auto_17074 ?auto_17050 ) ) ( not ( = ?auto_17074 ?auto_17086 ) ) ( not ( = ?auto_17074 ?auto_17062 ) ) ( not ( = ?auto_17073 ?auto_17068 ) ) ( not ( = ?auto_17073 ?auto_17081 ) ) ( not ( = ?auto_17073 ?auto_17069 ) ) ( not ( = ?auto_17073 ?auto_17083 ) ) ( not ( = ?auto_17073 ?auto_17057 ) ) ( not ( = ?auto_17073 ?auto_17075 ) ) ( not ( = ?auto_17073 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17044 ) ) ( not ( = ?auto_17035 ?auto_17060 ) ) ( not ( = ?auto_17036 ?auto_17044 ) ) ( not ( = ?auto_17036 ?auto_17060 ) ) ( not ( = ?auto_17037 ?auto_17044 ) ) ( not ( = ?auto_17037 ?auto_17060 ) ) ( not ( = ?auto_17038 ?auto_17044 ) ) ( not ( = ?auto_17038 ?auto_17060 ) ) ( not ( = ?auto_17039 ?auto_17044 ) ) ( not ( = ?auto_17039 ?auto_17060 ) ) ( not ( = ?auto_17040 ?auto_17044 ) ) ( not ( = ?auto_17040 ?auto_17060 ) ) ( not ( = ?auto_17041 ?auto_17044 ) ) ( not ( = ?auto_17041 ?auto_17060 ) ) ( not ( = ?auto_17042 ?auto_17044 ) ) ( not ( = ?auto_17042 ?auto_17060 ) ) ( not ( = ?auto_17044 ?auto_17073 ) ) ( not ( = ?auto_17044 ?auto_17068 ) ) ( not ( = ?auto_17044 ?auto_17081 ) ) ( not ( = ?auto_17044 ?auto_17069 ) ) ( not ( = ?auto_17044 ?auto_17083 ) ) ( not ( = ?auto_17044 ?auto_17057 ) ) ( not ( = ?auto_17044 ?auto_17075 ) ) ( not ( = ?auto_17044 ?auto_17059 ) ) ( not ( = ?auto_17060 ?auto_17073 ) ) ( not ( = ?auto_17060 ?auto_17068 ) ) ( not ( = ?auto_17060 ?auto_17081 ) ) ( not ( = ?auto_17060 ?auto_17069 ) ) ( not ( = ?auto_17060 ?auto_17083 ) ) ( not ( = ?auto_17060 ?auto_17057 ) ) ( not ( = ?auto_17060 ?auto_17075 ) ) ( not ( = ?auto_17060 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17045 ) ) ( not ( = ?auto_17035 ?auto_17078 ) ) ( not ( = ?auto_17036 ?auto_17045 ) ) ( not ( = ?auto_17036 ?auto_17078 ) ) ( not ( = ?auto_17037 ?auto_17045 ) ) ( not ( = ?auto_17037 ?auto_17078 ) ) ( not ( = ?auto_17038 ?auto_17045 ) ) ( not ( = ?auto_17038 ?auto_17078 ) ) ( not ( = ?auto_17039 ?auto_17045 ) ) ( not ( = ?auto_17039 ?auto_17078 ) ) ( not ( = ?auto_17040 ?auto_17045 ) ) ( not ( = ?auto_17040 ?auto_17078 ) ) ( not ( = ?auto_17041 ?auto_17045 ) ) ( not ( = ?auto_17041 ?auto_17078 ) ) ( not ( = ?auto_17042 ?auto_17045 ) ) ( not ( = ?auto_17042 ?auto_17078 ) ) ( not ( = ?auto_17043 ?auto_17045 ) ) ( not ( = ?auto_17043 ?auto_17078 ) ) ( not ( = ?auto_17045 ?auto_17060 ) ) ( not ( = ?auto_17045 ?auto_17073 ) ) ( not ( = ?auto_17045 ?auto_17068 ) ) ( not ( = ?auto_17045 ?auto_17081 ) ) ( not ( = ?auto_17045 ?auto_17069 ) ) ( not ( = ?auto_17045 ?auto_17083 ) ) ( not ( = ?auto_17045 ?auto_17057 ) ) ( not ( = ?auto_17045 ?auto_17075 ) ) ( not ( = ?auto_17045 ?auto_17059 ) ) ( not ( = ?auto_17078 ?auto_17060 ) ) ( not ( = ?auto_17078 ?auto_17073 ) ) ( not ( = ?auto_17078 ?auto_17068 ) ) ( not ( = ?auto_17078 ?auto_17081 ) ) ( not ( = ?auto_17078 ?auto_17069 ) ) ( not ( = ?auto_17078 ?auto_17083 ) ) ( not ( = ?auto_17078 ?auto_17057 ) ) ( not ( = ?auto_17078 ?auto_17075 ) ) ( not ( = ?auto_17078 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17046 ) ) ( not ( = ?auto_17035 ?auto_17063 ) ) ( not ( = ?auto_17036 ?auto_17046 ) ) ( not ( = ?auto_17036 ?auto_17063 ) ) ( not ( = ?auto_17037 ?auto_17046 ) ) ( not ( = ?auto_17037 ?auto_17063 ) ) ( not ( = ?auto_17038 ?auto_17046 ) ) ( not ( = ?auto_17038 ?auto_17063 ) ) ( not ( = ?auto_17039 ?auto_17046 ) ) ( not ( = ?auto_17039 ?auto_17063 ) ) ( not ( = ?auto_17040 ?auto_17046 ) ) ( not ( = ?auto_17040 ?auto_17063 ) ) ( not ( = ?auto_17041 ?auto_17046 ) ) ( not ( = ?auto_17041 ?auto_17063 ) ) ( not ( = ?auto_17042 ?auto_17046 ) ) ( not ( = ?auto_17042 ?auto_17063 ) ) ( not ( = ?auto_17043 ?auto_17046 ) ) ( not ( = ?auto_17043 ?auto_17063 ) ) ( not ( = ?auto_17044 ?auto_17046 ) ) ( not ( = ?auto_17044 ?auto_17063 ) ) ( not ( = ?auto_17046 ?auto_17078 ) ) ( not ( = ?auto_17046 ?auto_17060 ) ) ( not ( = ?auto_17046 ?auto_17073 ) ) ( not ( = ?auto_17046 ?auto_17068 ) ) ( not ( = ?auto_17046 ?auto_17081 ) ) ( not ( = ?auto_17046 ?auto_17069 ) ) ( not ( = ?auto_17046 ?auto_17083 ) ) ( not ( = ?auto_17046 ?auto_17057 ) ) ( not ( = ?auto_17046 ?auto_17075 ) ) ( not ( = ?auto_17046 ?auto_17059 ) ) ( not ( = ?auto_17066 ?auto_17067 ) ) ( not ( = ?auto_17066 ?auto_17056 ) ) ( not ( = ?auto_17066 ?auto_17061 ) ) ( not ( = ?auto_17066 ?auto_17065 ) ) ( not ( = ?auto_17066 ?auto_17080 ) ) ( not ( = ?auto_17066 ?auto_17055 ) ) ( not ( = ?auto_17066 ?auto_17085 ) ) ( not ( = ?auto_17070 ?auto_17074 ) ) ( not ( = ?auto_17070 ?auto_17086 ) ) ( not ( = ?auto_17070 ?auto_17077 ) ) ( not ( = ?auto_17070 ?auto_17071 ) ) ( not ( = ?auto_17070 ?auto_17079 ) ) ( not ( = ?auto_17070 ?auto_17050 ) ) ( not ( = ?auto_17070 ?auto_17062 ) ) ( not ( = ?auto_17063 ?auto_17078 ) ) ( not ( = ?auto_17063 ?auto_17060 ) ) ( not ( = ?auto_17063 ?auto_17073 ) ) ( not ( = ?auto_17063 ?auto_17068 ) ) ( not ( = ?auto_17063 ?auto_17081 ) ) ( not ( = ?auto_17063 ?auto_17069 ) ) ( not ( = ?auto_17063 ?auto_17083 ) ) ( not ( = ?auto_17063 ?auto_17057 ) ) ( not ( = ?auto_17063 ?auto_17075 ) ) ( not ( = ?auto_17063 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17047 ) ) ( not ( = ?auto_17035 ?auto_17064 ) ) ( not ( = ?auto_17036 ?auto_17047 ) ) ( not ( = ?auto_17036 ?auto_17064 ) ) ( not ( = ?auto_17037 ?auto_17047 ) ) ( not ( = ?auto_17037 ?auto_17064 ) ) ( not ( = ?auto_17038 ?auto_17047 ) ) ( not ( = ?auto_17038 ?auto_17064 ) ) ( not ( = ?auto_17039 ?auto_17047 ) ) ( not ( = ?auto_17039 ?auto_17064 ) ) ( not ( = ?auto_17040 ?auto_17047 ) ) ( not ( = ?auto_17040 ?auto_17064 ) ) ( not ( = ?auto_17041 ?auto_17047 ) ) ( not ( = ?auto_17041 ?auto_17064 ) ) ( not ( = ?auto_17042 ?auto_17047 ) ) ( not ( = ?auto_17042 ?auto_17064 ) ) ( not ( = ?auto_17043 ?auto_17047 ) ) ( not ( = ?auto_17043 ?auto_17064 ) ) ( not ( = ?auto_17044 ?auto_17047 ) ) ( not ( = ?auto_17044 ?auto_17064 ) ) ( not ( = ?auto_17045 ?auto_17047 ) ) ( not ( = ?auto_17045 ?auto_17064 ) ) ( not ( = ?auto_17047 ?auto_17063 ) ) ( not ( = ?auto_17047 ?auto_17078 ) ) ( not ( = ?auto_17047 ?auto_17060 ) ) ( not ( = ?auto_17047 ?auto_17073 ) ) ( not ( = ?auto_17047 ?auto_17068 ) ) ( not ( = ?auto_17047 ?auto_17081 ) ) ( not ( = ?auto_17047 ?auto_17069 ) ) ( not ( = ?auto_17047 ?auto_17083 ) ) ( not ( = ?auto_17047 ?auto_17057 ) ) ( not ( = ?auto_17047 ?auto_17075 ) ) ( not ( = ?auto_17047 ?auto_17059 ) ) ( not ( = ?auto_17058 ?auto_17066 ) ) ( not ( = ?auto_17058 ?auto_17067 ) ) ( not ( = ?auto_17058 ?auto_17056 ) ) ( not ( = ?auto_17058 ?auto_17061 ) ) ( not ( = ?auto_17058 ?auto_17065 ) ) ( not ( = ?auto_17058 ?auto_17080 ) ) ( not ( = ?auto_17058 ?auto_17055 ) ) ( not ( = ?auto_17058 ?auto_17085 ) ) ( not ( = ?auto_17076 ?auto_17070 ) ) ( not ( = ?auto_17076 ?auto_17074 ) ) ( not ( = ?auto_17076 ?auto_17086 ) ) ( not ( = ?auto_17076 ?auto_17077 ) ) ( not ( = ?auto_17076 ?auto_17071 ) ) ( not ( = ?auto_17076 ?auto_17079 ) ) ( not ( = ?auto_17076 ?auto_17050 ) ) ( not ( = ?auto_17076 ?auto_17062 ) ) ( not ( = ?auto_17064 ?auto_17063 ) ) ( not ( = ?auto_17064 ?auto_17078 ) ) ( not ( = ?auto_17064 ?auto_17060 ) ) ( not ( = ?auto_17064 ?auto_17073 ) ) ( not ( = ?auto_17064 ?auto_17068 ) ) ( not ( = ?auto_17064 ?auto_17081 ) ) ( not ( = ?auto_17064 ?auto_17069 ) ) ( not ( = ?auto_17064 ?auto_17083 ) ) ( not ( = ?auto_17064 ?auto_17057 ) ) ( not ( = ?auto_17064 ?auto_17075 ) ) ( not ( = ?auto_17064 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17048 ) ) ( not ( = ?auto_17035 ?auto_17072 ) ) ( not ( = ?auto_17036 ?auto_17048 ) ) ( not ( = ?auto_17036 ?auto_17072 ) ) ( not ( = ?auto_17037 ?auto_17048 ) ) ( not ( = ?auto_17037 ?auto_17072 ) ) ( not ( = ?auto_17038 ?auto_17048 ) ) ( not ( = ?auto_17038 ?auto_17072 ) ) ( not ( = ?auto_17039 ?auto_17048 ) ) ( not ( = ?auto_17039 ?auto_17072 ) ) ( not ( = ?auto_17040 ?auto_17048 ) ) ( not ( = ?auto_17040 ?auto_17072 ) ) ( not ( = ?auto_17041 ?auto_17048 ) ) ( not ( = ?auto_17041 ?auto_17072 ) ) ( not ( = ?auto_17042 ?auto_17048 ) ) ( not ( = ?auto_17042 ?auto_17072 ) ) ( not ( = ?auto_17043 ?auto_17048 ) ) ( not ( = ?auto_17043 ?auto_17072 ) ) ( not ( = ?auto_17044 ?auto_17048 ) ) ( not ( = ?auto_17044 ?auto_17072 ) ) ( not ( = ?auto_17045 ?auto_17048 ) ) ( not ( = ?auto_17045 ?auto_17072 ) ) ( not ( = ?auto_17046 ?auto_17048 ) ) ( not ( = ?auto_17046 ?auto_17072 ) ) ( not ( = ?auto_17048 ?auto_17064 ) ) ( not ( = ?auto_17048 ?auto_17063 ) ) ( not ( = ?auto_17048 ?auto_17078 ) ) ( not ( = ?auto_17048 ?auto_17060 ) ) ( not ( = ?auto_17048 ?auto_17073 ) ) ( not ( = ?auto_17048 ?auto_17068 ) ) ( not ( = ?auto_17048 ?auto_17081 ) ) ( not ( = ?auto_17048 ?auto_17069 ) ) ( not ( = ?auto_17048 ?auto_17083 ) ) ( not ( = ?auto_17048 ?auto_17057 ) ) ( not ( = ?auto_17048 ?auto_17075 ) ) ( not ( = ?auto_17048 ?auto_17059 ) ) ( not ( = ?auto_17084 ?auto_17058 ) ) ( not ( = ?auto_17084 ?auto_17066 ) ) ( not ( = ?auto_17084 ?auto_17067 ) ) ( not ( = ?auto_17084 ?auto_17056 ) ) ( not ( = ?auto_17084 ?auto_17061 ) ) ( not ( = ?auto_17084 ?auto_17065 ) ) ( not ( = ?auto_17084 ?auto_17080 ) ) ( not ( = ?auto_17084 ?auto_17055 ) ) ( not ( = ?auto_17084 ?auto_17085 ) ) ( not ( = ?auto_17082 ?auto_17076 ) ) ( not ( = ?auto_17082 ?auto_17070 ) ) ( not ( = ?auto_17082 ?auto_17074 ) ) ( not ( = ?auto_17082 ?auto_17086 ) ) ( not ( = ?auto_17082 ?auto_17077 ) ) ( not ( = ?auto_17082 ?auto_17071 ) ) ( not ( = ?auto_17082 ?auto_17079 ) ) ( not ( = ?auto_17082 ?auto_17050 ) ) ( not ( = ?auto_17082 ?auto_17062 ) ) ( not ( = ?auto_17072 ?auto_17064 ) ) ( not ( = ?auto_17072 ?auto_17063 ) ) ( not ( = ?auto_17072 ?auto_17078 ) ) ( not ( = ?auto_17072 ?auto_17060 ) ) ( not ( = ?auto_17072 ?auto_17073 ) ) ( not ( = ?auto_17072 ?auto_17068 ) ) ( not ( = ?auto_17072 ?auto_17081 ) ) ( not ( = ?auto_17072 ?auto_17069 ) ) ( not ( = ?auto_17072 ?auto_17083 ) ) ( not ( = ?auto_17072 ?auto_17057 ) ) ( not ( = ?auto_17072 ?auto_17075 ) ) ( not ( = ?auto_17072 ?auto_17059 ) ) ( not ( = ?auto_17035 ?auto_17049 ) ) ( not ( = ?auto_17035 ?auto_17053 ) ) ( not ( = ?auto_17036 ?auto_17049 ) ) ( not ( = ?auto_17036 ?auto_17053 ) ) ( not ( = ?auto_17037 ?auto_17049 ) ) ( not ( = ?auto_17037 ?auto_17053 ) ) ( not ( = ?auto_17038 ?auto_17049 ) ) ( not ( = ?auto_17038 ?auto_17053 ) ) ( not ( = ?auto_17039 ?auto_17049 ) ) ( not ( = ?auto_17039 ?auto_17053 ) ) ( not ( = ?auto_17040 ?auto_17049 ) ) ( not ( = ?auto_17040 ?auto_17053 ) ) ( not ( = ?auto_17041 ?auto_17049 ) ) ( not ( = ?auto_17041 ?auto_17053 ) ) ( not ( = ?auto_17042 ?auto_17049 ) ) ( not ( = ?auto_17042 ?auto_17053 ) ) ( not ( = ?auto_17043 ?auto_17049 ) ) ( not ( = ?auto_17043 ?auto_17053 ) ) ( not ( = ?auto_17044 ?auto_17049 ) ) ( not ( = ?auto_17044 ?auto_17053 ) ) ( not ( = ?auto_17045 ?auto_17049 ) ) ( not ( = ?auto_17045 ?auto_17053 ) ) ( not ( = ?auto_17046 ?auto_17049 ) ) ( not ( = ?auto_17046 ?auto_17053 ) ) ( not ( = ?auto_17047 ?auto_17049 ) ) ( not ( = ?auto_17047 ?auto_17053 ) ) ( not ( = ?auto_17049 ?auto_17072 ) ) ( not ( = ?auto_17049 ?auto_17064 ) ) ( not ( = ?auto_17049 ?auto_17063 ) ) ( not ( = ?auto_17049 ?auto_17078 ) ) ( not ( = ?auto_17049 ?auto_17060 ) ) ( not ( = ?auto_17049 ?auto_17073 ) ) ( not ( = ?auto_17049 ?auto_17068 ) ) ( not ( = ?auto_17049 ?auto_17081 ) ) ( not ( = ?auto_17049 ?auto_17069 ) ) ( not ( = ?auto_17049 ?auto_17083 ) ) ( not ( = ?auto_17049 ?auto_17057 ) ) ( not ( = ?auto_17049 ?auto_17075 ) ) ( not ( = ?auto_17049 ?auto_17059 ) ) ( not ( = ?auto_17053 ?auto_17072 ) ) ( not ( = ?auto_17053 ?auto_17064 ) ) ( not ( = ?auto_17053 ?auto_17063 ) ) ( not ( = ?auto_17053 ?auto_17078 ) ) ( not ( = ?auto_17053 ?auto_17060 ) ) ( not ( = ?auto_17053 ?auto_17073 ) ) ( not ( = ?auto_17053 ?auto_17068 ) ) ( not ( = ?auto_17053 ?auto_17081 ) ) ( not ( = ?auto_17053 ?auto_17069 ) ) ( not ( = ?auto_17053 ?auto_17083 ) ) ( not ( = ?auto_17053 ?auto_17057 ) ) ( not ( = ?auto_17053 ?auto_17075 ) ) ( not ( = ?auto_17053 ?auto_17059 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17039 ?auto_17040 ?auto_17041 ?auto_17042 ?auto_17043 ?auto_17044 ?auto_17045 ?auto_17046 ?auto_17047 ?auto_17048 )
      ( MAKE-1CRATE ?auto_17048 ?auto_17049 )
      ( MAKE-14CRATE-VERIFY ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17039 ?auto_17040 ?auto_17041 ?auto_17042 ?auto_17043 ?auto_17044 ?auto_17045 ?auto_17046 ?auto_17047 ?auto_17048 ?auto_17049 ) )
  )

)

