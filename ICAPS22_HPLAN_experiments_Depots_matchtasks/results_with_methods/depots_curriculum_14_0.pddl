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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16414 - SURFACE
      ?auto_16415 - SURFACE
    )
    :vars
    (
      ?auto_16416 - HOIST
      ?auto_16417 - PLACE
      ?auto_16419 - PLACE
      ?auto_16420 - HOIST
      ?auto_16421 - SURFACE
      ?auto_16418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16416 ?auto_16417 ) ( SURFACE-AT ?auto_16414 ?auto_16417 ) ( CLEAR ?auto_16414 ) ( IS-CRATE ?auto_16415 ) ( AVAILABLE ?auto_16416 ) ( not ( = ?auto_16419 ?auto_16417 ) ) ( HOIST-AT ?auto_16420 ?auto_16419 ) ( AVAILABLE ?auto_16420 ) ( SURFACE-AT ?auto_16415 ?auto_16419 ) ( ON ?auto_16415 ?auto_16421 ) ( CLEAR ?auto_16415 ) ( TRUCK-AT ?auto_16418 ?auto_16417 ) ( not ( = ?auto_16414 ?auto_16415 ) ) ( not ( = ?auto_16414 ?auto_16421 ) ) ( not ( = ?auto_16415 ?auto_16421 ) ) ( not ( = ?auto_16416 ?auto_16420 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16418 ?auto_16417 ?auto_16419 )
      ( !LIFT ?auto_16420 ?auto_16415 ?auto_16421 ?auto_16419 )
      ( !LOAD ?auto_16420 ?auto_16415 ?auto_16418 ?auto_16419 )
      ( !DRIVE ?auto_16418 ?auto_16419 ?auto_16417 )
      ( !UNLOAD ?auto_16416 ?auto_16415 ?auto_16418 ?auto_16417 )
      ( !DROP ?auto_16416 ?auto_16415 ?auto_16414 ?auto_16417 )
      ( MAKE-1CRATE-VERIFY ?auto_16414 ?auto_16415 ) )
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
      ?auto_16431 - HOIST
      ?auto_16433 - PLACE
      ?auto_16428 - PLACE
      ?auto_16432 - HOIST
      ?auto_16429 - SURFACE
      ?auto_16436 - PLACE
      ?auto_16434 - HOIST
      ?auto_16435 - SURFACE
      ?auto_16430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16431 ?auto_16433 ) ( IS-CRATE ?auto_16427 ) ( not ( = ?auto_16428 ?auto_16433 ) ) ( HOIST-AT ?auto_16432 ?auto_16428 ) ( AVAILABLE ?auto_16432 ) ( SURFACE-AT ?auto_16427 ?auto_16428 ) ( ON ?auto_16427 ?auto_16429 ) ( CLEAR ?auto_16427 ) ( not ( = ?auto_16426 ?auto_16427 ) ) ( not ( = ?auto_16426 ?auto_16429 ) ) ( not ( = ?auto_16427 ?auto_16429 ) ) ( not ( = ?auto_16431 ?auto_16432 ) ) ( SURFACE-AT ?auto_16425 ?auto_16433 ) ( CLEAR ?auto_16425 ) ( IS-CRATE ?auto_16426 ) ( AVAILABLE ?auto_16431 ) ( not ( = ?auto_16436 ?auto_16433 ) ) ( HOIST-AT ?auto_16434 ?auto_16436 ) ( AVAILABLE ?auto_16434 ) ( SURFACE-AT ?auto_16426 ?auto_16436 ) ( ON ?auto_16426 ?auto_16435 ) ( CLEAR ?auto_16426 ) ( TRUCK-AT ?auto_16430 ?auto_16433 ) ( not ( = ?auto_16425 ?auto_16426 ) ) ( not ( = ?auto_16425 ?auto_16435 ) ) ( not ( = ?auto_16426 ?auto_16435 ) ) ( not ( = ?auto_16431 ?auto_16434 ) ) ( not ( = ?auto_16425 ?auto_16427 ) ) ( not ( = ?auto_16425 ?auto_16429 ) ) ( not ( = ?auto_16427 ?auto_16435 ) ) ( not ( = ?auto_16428 ?auto_16436 ) ) ( not ( = ?auto_16432 ?auto_16434 ) ) ( not ( = ?auto_16429 ?auto_16435 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_16425 ?auto_16426 )
      ( MAKE-1CRATE ?auto_16426 ?auto_16427 )
      ( MAKE-2CRATE-VERIFY ?auto_16425 ?auto_16426 ?auto_16427 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16439 - SURFACE
      ?auto_16440 - SURFACE
    )
    :vars
    (
      ?auto_16441 - HOIST
      ?auto_16442 - PLACE
      ?auto_16444 - PLACE
      ?auto_16445 - HOIST
      ?auto_16446 - SURFACE
      ?auto_16443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16441 ?auto_16442 ) ( SURFACE-AT ?auto_16439 ?auto_16442 ) ( CLEAR ?auto_16439 ) ( IS-CRATE ?auto_16440 ) ( AVAILABLE ?auto_16441 ) ( not ( = ?auto_16444 ?auto_16442 ) ) ( HOIST-AT ?auto_16445 ?auto_16444 ) ( AVAILABLE ?auto_16445 ) ( SURFACE-AT ?auto_16440 ?auto_16444 ) ( ON ?auto_16440 ?auto_16446 ) ( CLEAR ?auto_16440 ) ( TRUCK-AT ?auto_16443 ?auto_16442 ) ( not ( = ?auto_16439 ?auto_16440 ) ) ( not ( = ?auto_16439 ?auto_16446 ) ) ( not ( = ?auto_16440 ?auto_16446 ) ) ( not ( = ?auto_16441 ?auto_16445 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16443 ?auto_16442 ?auto_16444 )
      ( !LIFT ?auto_16445 ?auto_16440 ?auto_16446 ?auto_16444 )
      ( !LOAD ?auto_16445 ?auto_16440 ?auto_16443 ?auto_16444 )
      ( !DRIVE ?auto_16443 ?auto_16444 ?auto_16442 )
      ( !UNLOAD ?auto_16441 ?auto_16440 ?auto_16443 ?auto_16442 )
      ( !DROP ?auto_16441 ?auto_16440 ?auto_16439 ?auto_16442 )
      ( MAKE-1CRATE-VERIFY ?auto_16439 ?auto_16440 ) )
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
      ?auto_16458 - HOIST
      ?auto_16455 - PLACE
      ?auto_16456 - PLACE
      ?auto_16459 - HOIST
      ?auto_16457 - SURFACE
      ?auto_16463 - PLACE
      ?auto_16462 - HOIST
      ?auto_16466 - SURFACE
      ?auto_16461 - PLACE
      ?auto_16465 - HOIST
      ?auto_16464 - SURFACE
      ?auto_16460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16458 ?auto_16455 ) ( IS-CRATE ?auto_16454 ) ( not ( = ?auto_16456 ?auto_16455 ) ) ( HOIST-AT ?auto_16459 ?auto_16456 ) ( AVAILABLE ?auto_16459 ) ( SURFACE-AT ?auto_16454 ?auto_16456 ) ( ON ?auto_16454 ?auto_16457 ) ( CLEAR ?auto_16454 ) ( not ( = ?auto_16453 ?auto_16454 ) ) ( not ( = ?auto_16453 ?auto_16457 ) ) ( not ( = ?auto_16454 ?auto_16457 ) ) ( not ( = ?auto_16458 ?auto_16459 ) ) ( IS-CRATE ?auto_16453 ) ( not ( = ?auto_16463 ?auto_16455 ) ) ( HOIST-AT ?auto_16462 ?auto_16463 ) ( AVAILABLE ?auto_16462 ) ( SURFACE-AT ?auto_16453 ?auto_16463 ) ( ON ?auto_16453 ?auto_16466 ) ( CLEAR ?auto_16453 ) ( not ( = ?auto_16452 ?auto_16453 ) ) ( not ( = ?auto_16452 ?auto_16466 ) ) ( not ( = ?auto_16453 ?auto_16466 ) ) ( not ( = ?auto_16458 ?auto_16462 ) ) ( SURFACE-AT ?auto_16451 ?auto_16455 ) ( CLEAR ?auto_16451 ) ( IS-CRATE ?auto_16452 ) ( AVAILABLE ?auto_16458 ) ( not ( = ?auto_16461 ?auto_16455 ) ) ( HOIST-AT ?auto_16465 ?auto_16461 ) ( AVAILABLE ?auto_16465 ) ( SURFACE-AT ?auto_16452 ?auto_16461 ) ( ON ?auto_16452 ?auto_16464 ) ( CLEAR ?auto_16452 ) ( TRUCK-AT ?auto_16460 ?auto_16455 ) ( not ( = ?auto_16451 ?auto_16452 ) ) ( not ( = ?auto_16451 ?auto_16464 ) ) ( not ( = ?auto_16452 ?auto_16464 ) ) ( not ( = ?auto_16458 ?auto_16465 ) ) ( not ( = ?auto_16451 ?auto_16453 ) ) ( not ( = ?auto_16451 ?auto_16466 ) ) ( not ( = ?auto_16453 ?auto_16464 ) ) ( not ( = ?auto_16463 ?auto_16461 ) ) ( not ( = ?auto_16462 ?auto_16465 ) ) ( not ( = ?auto_16466 ?auto_16464 ) ) ( not ( = ?auto_16451 ?auto_16454 ) ) ( not ( = ?auto_16451 ?auto_16457 ) ) ( not ( = ?auto_16452 ?auto_16454 ) ) ( not ( = ?auto_16452 ?auto_16457 ) ) ( not ( = ?auto_16454 ?auto_16466 ) ) ( not ( = ?auto_16454 ?auto_16464 ) ) ( not ( = ?auto_16456 ?auto_16463 ) ) ( not ( = ?auto_16456 ?auto_16461 ) ) ( not ( = ?auto_16459 ?auto_16462 ) ) ( not ( = ?auto_16459 ?auto_16465 ) ) ( not ( = ?auto_16457 ?auto_16466 ) ) ( not ( = ?auto_16457 ?auto_16464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_16451 ?auto_16452 ?auto_16453 )
      ( MAKE-1CRATE ?auto_16453 ?auto_16454 )
      ( MAKE-3CRATE-VERIFY ?auto_16451 ?auto_16452 ?auto_16453 ?auto_16454 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16469 - SURFACE
      ?auto_16470 - SURFACE
    )
    :vars
    (
      ?auto_16471 - HOIST
      ?auto_16472 - PLACE
      ?auto_16474 - PLACE
      ?auto_16475 - HOIST
      ?auto_16476 - SURFACE
      ?auto_16473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16471 ?auto_16472 ) ( SURFACE-AT ?auto_16469 ?auto_16472 ) ( CLEAR ?auto_16469 ) ( IS-CRATE ?auto_16470 ) ( AVAILABLE ?auto_16471 ) ( not ( = ?auto_16474 ?auto_16472 ) ) ( HOIST-AT ?auto_16475 ?auto_16474 ) ( AVAILABLE ?auto_16475 ) ( SURFACE-AT ?auto_16470 ?auto_16474 ) ( ON ?auto_16470 ?auto_16476 ) ( CLEAR ?auto_16470 ) ( TRUCK-AT ?auto_16473 ?auto_16472 ) ( not ( = ?auto_16469 ?auto_16470 ) ) ( not ( = ?auto_16469 ?auto_16476 ) ) ( not ( = ?auto_16470 ?auto_16476 ) ) ( not ( = ?auto_16471 ?auto_16475 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16473 ?auto_16472 ?auto_16474 )
      ( !LIFT ?auto_16475 ?auto_16470 ?auto_16476 ?auto_16474 )
      ( !LOAD ?auto_16475 ?auto_16470 ?auto_16473 ?auto_16474 )
      ( !DRIVE ?auto_16473 ?auto_16474 ?auto_16472 )
      ( !UNLOAD ?auto_16471 ?auto_16470 ?auto_16473 ?auto_16472 )
      ( !DROP ?auto_16471 ?auto_16470 ?auto_16469 ?auto_16472 )
      ( MAKE-1CRATE-VERIFY ?auto_16469 ?auto_16470 ) )
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
      ?auto_16487 - HOIST
      ?auto_16489 - PLACE
      ?auto_16488 - PLACE
      ?auto_16491 - HOIST
      ?auto_16492 - SURFACE
      ?auto_16501 - PLACE
      ?auto_16499 - HOIST
      ?auto_16494 - SURFACE
      ?auto_16500 - PLACE
      ?auto_16495 - HOIST
      ?auto_16497 - SURFACE
      ?auto_16493 - PLACE
      ?auto_16496 - HOIST
      ?auto_16498 - SURFACE
      ?auto_16490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16487 ?auto_16489 ) ( IS-CRATE ?auto_16486 ) ( not ( = ?auto_16488 ?auto_16489 ) ) ( HOIST-AT ?auto_16491 ?auto_16488 ) ( AVAILABLE ?auto_16491 ) ( SURFACE-AT ?auto_16486 ?auto_16488 ) ( ON ?auto_16486 ?auto_16492 ) ( CLEAR ?auto_16486 ) ( not ( = ?auto_16485 ?auto_16486 ) ) ( not ( = ?auto_16485 ?auto_16492 ) ) ( not ( = ?auto_16486 ?auto_16492 ) ) ( not ( = ?auto_16487 ?auto_16491 ) ) ( IS-CRATE ?auto_16485 ) ( not ( = ?auto_16501 ?auto_16489 ) ) ( HOIST-AT ?auto_16499 ?auto_16501 ) ( AVAILABLE ?auto_16499 ) ( SURFACE-AT ?auto_16485 ?auto_16501 ) ( ON ?auto_16485 ?auto_16494 ) ( CLEAR ?auto_16485 ) ( not ( = ?auto_16484 ?auto_16485 ) ) ( not ( = ?auto_16484 ?auto_16494 ) ) ( not ( = ?auto_16485 ?auto_16494 ) ) ( not ( = ?auto_16487 ?auto_16499 ) ) ( IS-CRATE ?auto_16484 ) ( not ( = ?auto_16500 ?auto_16489 ) ) ( HOIST-AT ?auto_16495 ?auto_16500 ) ( AVAILABLE ?auto_16495 ) ( SURFACE-AT ?auto_16484 ?auto_16500 ) ( ON ?auto_16484 ?auto_16497 ) ( CLEAR ?auto_16484 ) ( not ( = ?auto_16483 ?auto_16484 ) ) ( not ( = ?auto_16483 ?auto_16497 ) ) ( not ( = ?auto_16484 ?auto_16497 ) ) ( not ( = ?auto_16487 ?auto_16495 ) ) ( SURFACE-AT ?auto_16482 ?auto_16489 ) ( CLEAR ?auto_16482 ) ( IS-CRATE ?auto_16483 ) ( AVAILABLE ?auto_16487 ) ( not ( = ?auto_16493 ?auto_16489 ) ) ( HOIST-AT ?auto_16496 ?auto_16493 ) ( AVAILABLE ?auto_16496 ) ( SURFACE-AT ?auto_16483 ?auto_16493 ) ( ON ?auto_16483 ?auto_16498 ) ( CLEAR ?auto_16483 ) ( TRUCK-AT ?auto_16490 ?auto_16489 ) ( not ( = ?auto_16482 ?auto_16483 ) ) ( not ( = ?auto_16482 ?auto_16498 ) ) ( not ( = ?auto_16483 ?auto_16498 ) ) ( not ( = ?auto_16487 ?auto_16496 ) ) ( not ( = ?auto_16482 ?auto_16484 ) ) ( not ( = ?auto_16482 ?auto_16497 ) ) ( not ( = ?auto_16484 ?auto_16498 ) ) ( not ( = ?auto_16500 ?auto_16493 ) ) ( not ( = ?auto_16495 ?auto_16496 ) ) ( not ( = ?auto_16497 ?auto_16498 ) ) ( not ( = ?auto_16482 ?auto_16485 ) ) ( not ( = ?auto_16482 ?auto_16494 ) ) ( not ( = ?auto_16483 ?auto_16485 ) ) ( not ( = ?auto_16483 ?auto_16494 ) ) ( not ( = ?auto_16485 ?auto_16497 ) ) ( not ( = ?auto_16485 ?auto_16498 ) ) ( not ( = ?auto_16501 ?auto_16500 ) ) ( not ( = ?auto_16501 ?auto_16493 ) ) ( not ( = ?auto_16499 ?auto_16495 ) ) ( not ( = ?auto_16499 ?auto_16496 ) ) ( not ( = ?auto_16494 ?auto_16497 ) ) ( not ( = ?auto_16494 ?auto_16498 ) ) ( not ( = ?auto_16482 ?auto_16486 ) ) ( not ( = ?auto_16482 ?auto_16492 ) ) ( not ( = ?auto_16483 ?auto_16486 ) ) ( not ( = ?auto_16483 ?auto_16492 ) ) ( not ( = ?auto_16484 ?auto_16486 ) ) ( not ( = ?auto_16484 ?auto_16492 ) ) ( not ( = ?auto_16486 ?auto_16494 ) ) ( not ( = ?auto_16486 ?auto_16497 ) ) ( not ( = ?auto_16486 ?auto_16498 ) ) ( not ( = ?auto_16488 ?auto_16501 ) ) ( not ( = ?auto_16488 ?auto_16500 ) ) ( not ( = ?auto_16488 ?auto_16493 ) ) ( not ( = ?auto_16491 ?auto_16499 ) ) ( not ( = ?auto_16491 ?auto_16495 ) ) ( not ( = ?auto_16491 ?auto_16496 ) ) ( not ( = ?auto_16492 ?auto_16494 ) ) ( not ( = ?auto_16492 ?auto_16497 ) ) ( not ( = ?auto_16492 ?auto_16498 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_16482 ?auto_16483 ?auto_16484 ?auto_16485 )
      ( MAKE-1CRATE ?auto_16485 ?auto_16486 )
      ( MAKE-4CRATE-VERIFY ?auto_16482 ?auto_16483 ?auto_16484 ?auto_16485 ?auto_16486 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16504 - SURFACE
      ?auto_16505 - SURFACE
    )
    :vars
    (
      ?auto_16506 - HOIST
      ?auto_16507 - PLACE
      ?auto_16509 - PLACE
      ?auto_16510 - HOIST
      ?auto_16511 - SURFACE
      ?auto_16508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16506 ?auto_16507 ) ( SURFACE-AT ?auto_16504 ?auto_16507 ) ( CLEAR ?auto_16504 ) ( IS-CRATE ?auto_16505 ) ( AVAILABLE ?auto_16506 ) ( not ( = ?auto_16509 ?auto_16507 ) ) ( HOIST-AT ?auto_16510 ?auto_16509 ) ( AVAILABLE ?auto_16510 ) ( SURFACE-AT ?auto_16505 ?auto_16509 ) ( ON ?auto_16505 ?auto_16511 ) ( CLEAR ?auto_16505 ) ( TRUCK-AT ?auto_16508 ?auto_16507 ) ( not ( = ?auto_16504 ?auto_16505 ) ) ( not ( = ?auto_16504 ?auto_16511 ) ) ( not ( = ?auto_16505 ?auto_16511 ) ) ( not ( = ?auto_16506 ?auto_16510 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16508 ?auto_16507 ?auto_16509 )
      ( !LIFT ?auto_16510 ?auto_16505 ?auto_16511 ?auto_16509 )
      ( !LOAD ?auto_16510 ?auto_16505 ?auto_16508 ?auto_16509 )
      ( !DRIVE ?auto_16508 ?auto_16509 ?auto_16507 )
      ( !UNLOAD ?auto_16506 ?auto_16505 ?auto_16508 ?auto_16507 )
      ( !DROP ?auto_16506 ?auto_16505 ?auto_16504 ?auto_16507 )
      ( MAKE-1CRATE-VERIFY ?auto_16504 ?auto_16505 ) )
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
      ?auto_16529 - HOIST
      ?auto_16525 - PLACE
      ?auto_16527 - PLACE
      ?auto_16524 - HOIST
      ?auto_16528 - SURFACE
      ?auto_16532 - PLACE
      ?auto_16530 - HOIST
      ?auto_16539 - SURFACE
      ?auto_16535 - PLACE
      ?auto_16538 - HOIST
      ?auto_16541 - SURFACE
      ?auto_16537 - PLACE
      ?auto_16534 - HOIST
      ?auto_16540 - SURFACE
      ?auto_16536 - PLACE
      ?auto_16533 - HOIST
      ?auto_16531 - SURFACE
      ?auto_16526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16529 ?auto_16525 ) ( IS-CRATE ?auto_16523 ) ( not ( = ?auto_16527 ?auto_16525 ) ) ( HOIST-AT ?auto_16524 ?auto_16527 ) ( AVAILABLE ?auto_16524 ) ( SURFACE-AT ?auto_16523 ?auto_16527 ) ( ON ?auto_16523 ?auto_16528 ) ( CLEAR ?auto_16523 ) ( not ( = ?auto_16522 ?auto_16523 ) ) ( not ( = ?auto_16522 ?auto_16528 ) ) ( not ( = ?auto_16523 ?auto_16528 ) ) ( not ( = ?auto_16529 ?auto_16524 ) ) ( IS-CRATE ?auto_16522 ) ( not ( = ?auto_16532 ?auto_16525 ) ) ( HOIST-AT ?auto_16530 ?auto_16532 ) ( AVAILABLE ?auto_16530 ) ( SURFACE-AT ?auto_16522 ?auto_16532 ) ( ON ?auto_16522 ?auto_16539 ) ( CLEAR ?auto_16522 ) ( not ( = ?auto_16521 ?auto_16522 ) ) ( not ( = ?auto_16521 ?auto_16539 ) ) ( not ( = ?auto_16522 ?auto_16539 ) ) ( not ( = ?auto_16529 ?auto_16530 ) ) ( IS-CRATE ?auto_16521 ) ( not ( = ?auto_16535 ?auto_16525 ) ) ( HOIST-AT ?auto_16538 ?auto_16535 ) ( AVAILABLE ?auto_16538 ) ( SURFACE-AT ?auto_16521 ?auto_16535 ) ( ON ?auto_16521 ?auto_16541 ) ( CLEAR ?auto_16521 ) ( not ( = ?auto_16520 ?auto_16521 ) ) ( not ( = ?auto_16520 ?auto_16541 ) ) ( not ( = ?auto_16521 ?auto_16541 ) ) ( not ( = ?auto_16529 ?auto_16538 ) ) ( IS-CRATE ?auto_16520 ) ( not ( = ?auto_16537 ?auto_16525 ) ) ( HOIST-AT ?auto_16534 ?auto_16537 ) ( AVAILABLE ?auto_16534 ) ( SURFACE-AT ?auto_16520 ?auto_16537 ) ( ON ?auto_16520 ?auto_16540 ) ( CLEAR ?auto_16520 ) ( not ( = ?auto_16519 ?auto_16520 ) ) ( not ( = ?auto_16519 ?auto_16540 ) ) ( not ( = ?auto_16520 ?auto_16540 ) ) ( not ( = ?auto_16529 ?auto_16534 ) ) ( SURFACE-AT ?auto_16518 ?auto_16525 ) ( CLEAR ?auto_16518 ) ( IS-CRATE ?auto_16519 ) ( AVAILABLE ?auto_16529 ) ( not ( = ?auto_16536 ?auto_16525 ) ) ( HOIST-AT ?auto_16533 ?auto_16536 ) ( AVAILABLE ?auto_16533 ) ( SURFACE-AT ?auto_16519 ?auto_16536 ) ( ON ?auto_16519 ?auto_16531 ) ( CLEAR ?auto_16519 ) ( TRUCK-AT ?auto_16526 ?auto_16525 ) ( not ( = ?auto_16518 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16531 ) ) ( not ( = ?auto_16519 ?auto_16531 ) ) ( not ( = ?auto_16529 ?auto_16533 ) ) ( not ( = ?auto_16518 ?auto_16520 ) ) ( not ( = ?auto_16518 ?auto_16540 ) ) ( not ( = ?auto_16520 ?auto_16531 ) ) ( not ( = ?auto_16537 ?auto_16536 ) ) ( not ( = ?auto_16534 ?auto_16533 ) ) ( not ( = ?auto_16540 ?auto_16531 ) ) ( not ( = ?auto_16518 ?auto_16521 ) ) ( not ( = ?auto_16518 ?auto_16541 ) ) ( not ( = ?auto_16519 ?auto_16521 ) ) ( not ( = ?auto_16519 ?auto_16541 ) ) ( not ( = ?auto_16521 ?auto_16540 ) ) ( not ( = ?auto_16521 ?auto_16531 ) ) ( not ( = ?auto_16535 ?auto_16537 ) ) ( not ( = ?auto_16535 ?auto_16536 ) ) ( not ( = ?auto_16538 ?auto_16534 ) ) ( not ( = ?auto_16538 ?auto_16533 ) ) ( not ( = ?auto_16541 ?auto_16540 ) ) ( not ( = ?auto_16541 ?auto_16531 ) ) ( not ( = ?auto_16518 ?auto_16522 ) ) ( not ( = ?auto_16518 ?auto_16539 ) ) ( not ( = ?auto_16519 ?auto_16522 ) ) ( not ( = ?auto_16519 ?auto_16539 ) ) ( not ( = ?auto_16520 ?auto_16522 ) ) ( not ( = ?auto_16520 ?auto_16539 ) ) ( not ( = ?auto_16522 ?auto_16541 ) ) ( not ( = ?auto_16522 ?auto_16540 ) ) ( not ( = ?auto_16522 ?auto_16531 ) ) ( not ( = ?auto_16532 ?auto_16535 ) ) ( not ( = ?auto_16532 ?auto_16537 ) ) ( not ( = ?auto_16532 ?auto_16536 ) ) ( not ( = ?auto_16530 ?auto_16538 ) ) ( not ( = ?auto_16530 ?auto_16534 ) ) ( not ( = ?auto_16530 ?auto_16533 ) ) ( not ( = ?auto_16539 ?auto_16541 ) ) ( not ( = ?auto_16539 ?auto_16540 ) ) ( not ( = ?auto_16539 ?auto_16531 ) ) ( not ( = ?auto_16518 ?auto_16523 ) ) ( not ( = ?auto_16518 ?auto_16528 ) ) ( not ( = ?auto_16519 ?auto_16523 ) ) ( not ( = ?auto_16519 ?auto_16528 ) ) ( not ( = ?auto_16520 ?auto_16523 ) ) ( not ( = ?auto_16520 ?auto_16528 ) ) ( not ( = ?auto_16521 ?auto_16523 ) ) ( not ( = ?auto_16521 ?auto_16528 ) ) ( not ( = ?auto_16523 ?auto_16539 ) ) ( not ( = ?auto_16523 ?auto_16541 ) ) ( not ( = ?auto_16523 ?auto_16540 ) ) ( not ( = ?auto_16523 ?auto_16531 ) ) ( not ( = ?auto_16527 ?auto_16532 ) ) ( not ( = ?auto_16527 ?auto_16535 ) ) ( not ( = ?auto_16527 ?auto_16537 ) ) ( not ( = ?auto_16527 ?auto_16536 ) ) ( not ( = ?auto_16524 ?auto_16530 ) ) ( not ( = ?auto_16524 ?auto_16538 ) ) ( not ( = ?auto_16524 ?auto_16534 ) ) ( not ( = ?auto_16524 ?auto_16533 ) ) ( not ( = ?auto_16528 ?auto_16539 ) ) ( not ( = ?auto_16528 ?auto_16541 ) ) ( not ( = ?auto_16528 ?auto_16540 ) ) ( not ( = ?auto_16528 ?auto_16531 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_16518 ?auto_16519 ?auto_16520 ?auto_16521 ?auto_16522 )
      ( MAKE-1CRATE ?auto_16522 ?auto_16523 )
      ( MAKE-5CRATE-VERIFY ?auto_16518 ?auto_16519 ?auto_16520 ?auto_16521 ?auto_16522 ?auto_16523 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16544 - SURFACE
      ?auto_16545 - SURFACE
    )
    :vars
    (
      ?auto_16546 - HOIST
      ?auto_16547 - PLACE
      ?auto_16549 - PLACE
      ?auto_16550 - HOIST
      ?auto_16551 - SURFACE
      ?auto_16548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16546 ?auto_16547 ) ( SURFACE-AT ?auto_16544 ?auto_16547 ) ( CLEAR ?auto_16544 ) ( IS-CRATE ?auto_16545 ) ( AVAILABLE ?auto_16546 ) ( not ( = ?auto_16549 ?auto_16547 ) ) ( HOIST-AT ?auto_16550 ?auto_16549 ) ( AVAILABLE ?auto_16550 ) ( SURFACE-AT ?auto_16545 ?auto_16549 ) ( ON ?auto_16545 ?auto_16551 ) ( CLEAR ?auto_16545 ) ( TRUCK-AT ?auto_16548 ?auto_16547 ) ( not ( = ?auto_16544 ?auto_16545 ) ) ( not ( = ?auto_16544 ?auto_16551 ) ) ( not ( = ?auto_16545 ?auto_16551 ) ) ( not ( = ?auto_16546 ?auto_16550 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16548 ?auto_16547 ?auto_16549 )
      ( !LIFT ?auto_16550 ?auto_16545 ?auto_16551 ?auto_16549 )
      ( !LOAD ?auto_16550 ?auto_16545 ?auto_16548 ?auto_16549 )
      ( !DRIVE ?auto_16548 ?auto_16549 ?auto_16547 )
      ( !UNLOAD ?auto_16546 ?auto_16545 ?auto_16548 ?auto_16547 )
      ( !DROP ?auto_16546 ?auto_16545 ?auto_16544 ?auto_16547 )
      ( MAKE-1CRATE-VERIFY ?auto_16544 ?auto_16545 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_16559 - SURFACE
      ?auto_16560 - SURFACE
      ?auto_16561 - SURFACE
      ?auto_16562 - SURFACE
      ?auto_16563 - SURFACE
      ?auto_16565 - SURFACE
      ?auto_16564 - SURFACE
    )
    :vars
    (
      ?auto_16568 - HOIST
      ?auto_16567 - PLACE
      ?auto_16569 - PLACE
      ?auto_16566 - HOIST
      ?auto_16570 - SURFACE
      ?auto_16578 - PLACE
      ?auto_16576 - HOIST
      ?auto_16580 - SURFACE
      ?auto_16581 - PLACE
      ?auto_16583 - HOIST
      ?auto_16584 - SURFACE
      ?auto_16573 - PLACE
      ?auto_16577 - HOIST
      ?auto_16585 - SURFACE
      ?auto_16586 - PLACE
      ?auto_16574 - HOIST
      ?auto_16582 - SURFACE
      ?auto_16572 - PLACE
      ?auto_16579 - HOIST
      ?auto_16575 - SURFACE
      ?auto_16571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16568 ?auto_16567 ) ( IS-CRATE ?auto_16564 ) ( not ( = ?auto_16569 ?auto_16567 ) ) ( HOIST-AT ?auto_16566 ?auto_16569 ) ( AVAILABLE ?auto_16566 ) ( SURFACE-AT ?auto_16564 ?auto_16569 ) ( ON ?auto_16564 ?auto_16570 ) ( CLEAR ?auto_16564 ) ( not ( = ?auto_16565 ?auto_16564 ) ) ( not ( = ?auto_16565 ?auto_16570 ) ) ( not ( = ?auto_16564 ?auto_16570 ) ) ( not ( = ?auto_16568 ?auto_16566 ) ) ( IS-CRATE ?auto_16565 ) ( not ( = ?auto_16578 ?auto_16567 ) ) ( HOIST-AT ?auto_16576 ?auto_16578 ) ( AVAILABLE ?auto_16576 ) ( SURFACE-AT ?auto_16565 ?auto_16578 ) ( ON ?auto_16565 ?auto_16580 ) ( CLEAR ?auto_16565 ) ( not ( = ?auto_16563 ?auto_16565 ) ) ( not ( = ?auto_16563 ?auto_16580 ) ) ( not ( = ?auto_16565 ?auto_16580 ) ) ( not ( = ?auto_16568 ?auto_16576 ) ) ( IS-CRATE ?auto_16563 ) ( not ( = ?auto_16581 ?auto_16567 ) ) ( HOIST-AT ?auto_16583 ?auto_16581 ) ( AVAILABLE ?auto_16583 ) ( SURFACE-AT ?auto_16563 ?auto_16581 ) ( ON ?auto_16563 ?auto_16584 ) ( CLEAR ?auto_16563 ) ( not ( = ?auto_16562 ?auto_16563 ) ) ( not ( = ?auto_16562 ?auto_16584 ) ) ( not ( = ?auto_16563 ?auto_16584 ) ) ( not ( = ?auto_16568 ?auto_16583 ) ) ( IS-CRATE ?auto_16562 ) ( not ( = ?auto_16573 ?auto_16567 ) ) ( HOIST-AT ?auto_16577 ?auto_16573 ) ( AVAILABLE ?auto_16577 ) ( SURFACE-AT ?auto_16562 ?auto_16573 ) ( ON ?auto_16562 ?auto_16585 ) ( CLEAR ?auto_16562 ) ( not ( = ?auto_16561 ?auto_16562 ) ) ( not ( = ?auto_16561 ?auto_16585 ) ) ( not ( = ?auto_16562 ?auto_16585 ) ) ( not ( = ?auto_16568 ?auto_16577 ) ) ( IS-CRATE ?auto_16561 ) ( not ( = ?auto_16586 ?auto_16567 ) ) ( HOIST-AT ?auto_16574 ?auto_16586 ) ( AVAILABLE ?auto_16574 ) ( SURFACE-AT ?auto_16561 ?auto_16586 ) ( ON ?auto_16561 ?auto_16582 ) ( CLEAR ?auto_16561 ) ( not ( = ?auto_16560 ?auto_16561 ) ) ( not ( = ?auto_16560 ?auto_16582 ) ) ( not ( = ?auto_16561 ?auto_16582 ) ) ( not ( = ?auto_16568 ?auto_16574 ) ) ( SURFACE-AT ?auto_16559 ?auto_16567 ) ( CLEAR ?auto_16559 ) ( IS-CRATE ?auto_16560 ) ( AVAILABLE ?auto_16568 ) ( not ( = ?auto_16572 ?auto_16567 ) ) ( HOIST-AT ?auto_16579 ?auto_16572 ) ( AVAILABLE ?auto_16579 ) ( SURFACE-AT ?auto_16560 ?auto_16572 ) ( ON ?auto_16560 ?auto_16575 ) ( CLEAR ?auto_16560 ) ( TRUCK-AT ?auto_16571 ?auto_16567 ) ( not ( = ?auto_16559 ?auto_16560 ) ) ( not ( = ?auto_16559 ?auto_16575 ) ) ( not ( = ?auto_16560 ?auto_16575 ) ) ( not ( = ?auto_16568 ?auto_16579 ) ) ( not ( = ?auto_16559 ?auto_16561 ) ) ( not ( = ?auto_16559 ?auto_16582 ) ) ( not ( = ?auto_16561 ?auto_16575 ) ) ( not ( = ?auto_16586 ?auto_16572 ) ) ( not ( = ?auto_16574 ?auto_16579 ) ) ( not ( = ?auto_16582 ?auto_16575 ) ) ( not ( = ?auto_16559 ?auto_16562 ) ) ( not ( = ?auto_16559 ?auto_16585 ) ) ( not ( = ?auto_16560 ?auto_16562 ) ) ( not ( = ?auto_16560 ?auto_16585 ) ) ( not ( = ?auto_16562 ?auto_16582 ) ) ( not ( = ?auto_16562 ?auto_16575 ) ) ( not ( = ?auto_16573 ?auto_16586 ) ) ( not ( = ?auto_16573 ?auto_16572 ) ) ( not ( = ?auto_16577 ?auto_16574 ) ) ( not ( = ?auto_16577 ?auto_16579 ) ) ( not ( = ?auto_16585 ?auto_16582 ) ) ( not ( = ?auto_16585 ?auto_16575 ) ) ( not ( = ?auto_16559 ?auto_16563 ) ) ( not ( = ?auto_16559 ?auto_16584 ) ) ( not ( = ?auto_16560 ?auto_16563 ) ) ( not ( = ?auto_16560 ?auto_16584 ) ) ( not ( = ?auto_16561 ?auto_16563 ) ) ( not ( = ?auto_16561 ?auto_16584 ) ) ( not ( = ?auto_16563 ?auto_16585 ) ) ( not ( = ?auto_16563 ?auto_16582 ) ) ( not ( = ?auto_16563 ?auto_16575 ) ) ( not ( = ?auto_16581 ?auto_16573 ) ) ( not ( = ?auto_16581 ?auto_16586 ) ) ( not ( = ?auto_16581 ?auto_16572 ) ) ( not ( = ?auto_16583 ?auto_16577 ) ) ( not ( = ?auto_16583 ?auto_16574 ) ) ( not ( = ?auto_16583 ?auto_16579 ) ) ( not ( = ?auto_16584 ?auto_16585 ) ) ( not ( = ?auto_16584 ?auto_16582 ) ) ( not ( = ?auto_16584 ?auto_16575 ) ) ( not ( = ?auto_16559 ?auto_16565 ) ) ( not ( = ?auto_16559 ?auto_16580 ) ) ( not ( = ?auto_16560 ?auto_16565 ) ) ( not ( = ?auto_16560 ?auto_16580 ) ) ( not ( = ?auto_16561 ?auto_16565 ) ) ( not ( = ?auto_16561 ?auto_16580 ) ) ( not ( = ?auto_16562 ?auto_16565 ) ) ( not ( = ?auto_16562 ?auto_16580 ) ) ( not ( = ?auto_16565 ?auto_16584 ) ) ( not ( = ?auto_16565 ?auto_16585 ) ) ( not ( = ?auto_16565 ?auto_16582 ) ) ( not ( = ?auto_16565 ?auto_16575 ) ) ( not ( = ?auto_16578 ?auto_16581 ) ) ( not ( = ?auto_16578 ?auto_16573 ) ) ( not ( = ?auto_16578 ?auto_16586 ) ) ( not ( = ?auto_16578 ?auto_16572 ) ) ( not ( = ?auto_16576 ?auto_16583 ) ) ( not ( = ?auto_16576 ?auto_16577 ) ) ( not ( = ?auto_16576 ?auto_16574 ) ) ( not ( = ?auto_16576 ?auto_16579 ) ) ( not ( = ?auto_16580 ?auto_16584 ) ) ( not ( = ?auto_16580 ?auto_16585 ) ) ( not ( = ?auto_16580 ?auto_16582 ) ) ( not ( = ?auto_16580 ?auto_16575 ) ) ( not ( = ?auto_16559 ?auto_16564 ) ) ( not ( = ?auto_16559 ?auto_16570 ) ) ( not ( = ?auto_16560 ?auto_16564 ) ) ( not ( = ?auto_16560 ?auto_16570 ) ) ( not ( = ?auto_16561 ?auto_16564 ) ) ( not ( = ?auto_16561 ?auto_16570 ) ) ( not ( = ?auto_16562 ?auto_16564 ) ) ( not ( = ?auto_16562 ?auto_16570 ) ) ( not ( = ?auto_16563 ?auto_16564 ) ) ( not ( = ?auto_16563 ?auto_16570 ) ) ( not ( = ?auto_16564 ?auto_16580 ) ) ( not ( = ?auto_16564 ?auto_16584 ) ) ( not ( = ?auto_16564 ?auto_16585 ) ) ( not ( = ?auto_16564 ?auto_16582 ) ) ( not ( = ?auto_16564 ?auto_16575 ) ) ( not ( = ?auto_16569 ?auto_16578 ) ) ( not ( = ?auto_16569 ?auto_16581 ) ) ( not ( = ?auto_16569 ?auto_16573 ) ) ( not ( = ?auto_16569 ?auto_16586 ) ) ( not ( = ?auto_16569 ?auto_16572 ) ) ( not ( = ?auto_16566 ?auto_16576 ) ) ( not ( = ?auto_16566 ?auto_16583 ) ) ( not ( = ?auto_16566 ?auto_16577 ) ) ( not ( = ?auto_16566 ?auto_16574 ) ) ( not ( = ?auto_16566 ?auto_16579 ) ) ( not ( = ?auto_16570 ?auto_16580 ) ) ( not ( = ?auto_16570 ?auto_16584 ) ) ( not ( = ?auto_16570 ?auto_16585 ) ) ( not ( = ?auto_16570 ?auto_16582 ) ) ( not ( = ?auto_16570 ?auto_16575 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_16559 ?auto_16560 ?auto_16561 ?auto_16562 ?auto_16563 ?auto_16565 )
      ( MAKE-1CRATE ?auto_16565 ?auto_16564 )
      ( MAKE-6CRATE-VERIFY ?auto_16559 ?auto_16560 ?auto_16561 ?auto_16562 ?auto_16563 ?auto_16565 ?auto_16564 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16589 - SURFACE
      ?auto_16590 - SURFACE
    )
    :vars
    (
      ?auto_16591 - HOIST
      ?auto_16592 - PLACE
      ?auto_16594 - PLACE
      ?auto_16595 - HOIST
      ?auto_16596 - SURFACE
      ?auto_16593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16591 ?auto_16592 ) ( SURFACE-AT ?auto_16589 ?auto_16592 ) ( CLEAR ?auto_16589 ) ( IS-CRATE ?auto_16590 ) ( AVAILABLE ?auto_16591 ) ( not ( = ?auto_16594 ?auto_16592 ) ) ( HOIST-AT ?auto_16595 ?auto_16594 ) ( AVAILABLE ?auto_16595 ) ( SURFACE-AT ?auto_16590 ?auto_16594 ) ( ON ?auto_16590 ?auto_16596 ) ( CLEAR ?auto_16590 ) ( TRUCK-AT ?auto_16593 ?auto_16592 ) ( not ( = ?auto_16589 ?auto_16590 ) ) ( not ( = ?auto_16589 ?auto_16596 ) ) ( not ( = ?auto_16590 ?auto_16596 ) ) ( not ( = ?auto_16591 ?auto_16595 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16593 ?auto_16592 ?auto_16594 )
      ( !LIFT ?auto_16595 ?auto_16590 ?auto_16596 ?auto_16594 )
      ( !LOAD ?auto_16595 ?auto_16590 ?auto_16593 ?auto_16594 )
      ( !DRIVE ?auto_16593 ?auto_16594 ?auto_16592 )
      ( !UNLOAD ?auto_16591 ?auto_16590 ?auto_16593 ?auto_16592 )
      ( !DROP ?auto_16591 ?auto_16590 ?auto_16589 ?auto_16592 )
      ( MAKE-1CRATE-VERIFY ?auto_16589 ?auto_16590 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_16605 - SURFACE
      ?auto_16606 - SURFACE
      ?auto_16607 - SURFACE
      ?auto_16608 - SURFACE
      ?auto_16609 - SURFACE
      ?auto_16611 - SURFACE
      ?auto_16610 - SURFACE
      ?auto_16612 - SURFACE
    )
    :vars
    (
      ?auto_16618 - HOIST
      ?auto_16616 - PLACE
      ?auto_16617 - PLACE
      ?auto_16613 - HOIST
      ?auto_16614 - SURFACE
      ?auto_16634 - PLACE
      ?auto_16620 - HOIST
      ?auto_16621 - SURFACE
      ?auto_16632 - PLACE
      ?auto_16619 - HOIST
      ?auto_16626 - SURFACE
      ?auto_16628 - PLACE
      ?auto_16629 - HOIST
      ?auto_16630 - SURFACE
      ?auto_16623 - PLACE
      ?auto_16633 - HOIST
      ?auto_16631 - SURFACE
      ?auto_16625 - PLACE
      ?auto_16624 - HOIST
      ?auto_16627 - SURFACE
      ?auto_16622 - SURFACE
      ?auto_16615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16618 ?auto_16616 ) ( IS-CRATE ?auto_16612 ) ( not ( = ?auto_16617 ?auto_16616 ) ) ( HOIST-AT ?auto_16613 ?auto_16617 ) ( SURFACE-AT ?auto_16612 ?auto_16617 ) ( ON ?auto_16612 ?auto_16614 ) ( CLEAR ?auto_16612 ) ( not ( = ?auto_16610 ?auto_16612 ) ) ( not ( = ?auto_16610 ?auto_16614 ) ) ( not ( = ?auto_16612 ?auto_16614 ) ) ( not ( = ?auto_16618 ?auto_16613 ) ) ( IS-CRATE ?auto_16610 ) ( not ( = ?auto_16634 ?auto_16616 ) ) ( HOIST-AT ?auto_16620 ?auto_16634 ) ( AVAILABLE ?auto_16620 ) ( SURFACE-AT ?auto_16610 ?auto_16634 ) ( ON ?auto_16610 ?auto_16621 ) ( CLEAR ?auto_16610 ) ( not ( = ?auto_16611 ?auto_16610 ) ) ( not ( = ?auto_16611 ?auto_16621 ) ) ( not ( = ?auto_16610 ?auto_16621 ) ) ( not ( = ?auto_16618 ?auto_16620 ) ) ( IS-CRATE ?auto_16611 ) ( not ( = ?auto_16632 ?auto_16616 ) ) ( HOIST-AT ?auto_16619 ?auto_16632 ) ( AVAILABLE ?auto_16619 ) ( SURFACE-AT ?auto_16611 ?auto_16632 ) ( ON ?auto_16611 ?auto_16626 ) ( CLEAR ?auto_16611 ) ( not ( = ?auto_16609 ?auto_16611 ) ) ( not ( = ?auto_16609 ?auto_16626 ) ) ( not ( = ?auto_16611 ?auto_16626 ) ) ( not ( = ?auto_16618 ?auto_16619 ) ) ( IS-CRATE ?auto_16609 ) ( not ( = ?auto_16628 ?auto_16616 ) ) ( HOIST-AT ?auto_16629 ?auto_16628 ) ( AVAILABLE ?auto_16629 ) ( SURFACE-AT ?auto_16609 ?auto_16628 ) ( ON ?auto_16609 ?auto_16630 ) ( CLEAR ?auto_16609 ) ( not ( = ?auto_16608 ?auto_16609 ) ) ( not ( = ?auto_16608 ?auto_16630 ) ) ( not ( = ?auto_16609 ?auto_16630 ) ) ( not ( = ?auto_16618 ?auto_16629 ) ) ( IS-CRATE ?auto_16608 ) ( not ( = ?auto_16623 ?auto_16616 ) ) ( HOIST-AT ?auto_16633 ?auto_16623 ) ( AVAILABLE ?auto_16633 ) ( SURFACE-AT ?auto_16608 ?auto_16623 ) ( ON ?auto_16608 ?auto_16631 ) ( CLEAR ?auto_16608 ) ( not ( = ?auto_16607 ?auto_16608 ) ) ( not ( = ?auto_16607 ?auto_16631 ) ) ( not ( = ?auto_16608 ?auto_16631 ) ) ( not ( = ?auto_16618 ?auto_16633 ) ) ( IS-CRATE ?auto_16607 ) ( not ( = ?auto_16625 ?auto_16616 ) ) ( HOIST-AT ?auto_16624 ?auto_16625 ) ( AVAILABLE ?auto_16624 ) ( SURFACE-AT ?auto_16607 ?auto_16625 ) ( ON ?auto_16607 ?auto_16627 ) ( CLEAR ?auto_16607 ) ( not ( = ?auto_16606 ?auto_16607 ) ) ( not ( = ?auto_16606 ?auto_16627 ) ) ( not ( = ?auto_16607 ?auto_16627 ) ) ( not ( = ?auto_16618 ?auto_16624 ) ) ( SURFACE-AT ?auto_16605 ?auto_16616 ) ( CLEAR ?auto_16605 ) ( IS-CRATE ?auto_16606 ) ( AVAILABLE ?auto_16618 ) ( AVAILABLE ?auto_16613 ) ( SURFACE-AT ?auto_16606 ?auto_16617 ) ( ON ?auto_16606 ?auto_16622 ) ( CLEAR ?auto_16606 ) ( TRUCK-AT ?auto_16615 ?auto_16616 ) ( not ( = ?auto_16605 ?auto_16606 ) ) ( not ( = ?auto_16605 ?auto_16622 ) ) ( not ( = ?auto_16606 ?auto_16622 ) ) ( not ( = ?auto_16605 ?auto_16607 ) ) ( not ( = ?auto_16605 ?auto_16627 ) ) ( not ( = ?auto_16607 ?auto_16622 ) ) ( not ( = ?auto_16625 ?auto_16617 ) ) ( not ( = ?auto_16624 ?auto_16613 ) ) ( not ( = ?auto_16627 ?auto_16622 ) ) ( not ( = ?auto_16605 ?auto_16608 ) ) ( not ( = ?auto_16605 ?auto_16631 ) ) ( not ( = ?auto_16606 ?auto_16608 ) ) ( not ( = ?auto_16606 ?auto_16631 ) ) ( not ( = ?auto_16608 ?auto_16627 ) ) ( not ( = ?auto_16608 ?auto_16622 ) ) ( not ( = ?auto_16623 ?auto_16625 ) ) ( not ( = ?auto_16623 ?auto_16617 ) ) ( not ( = ?auto_16633 ?auto_16624 ) ) ( not ( = ?auto_16633 ?auto_16613 ) ) ( not ( = ?auto_16631 ?auto_16627 ) ) ( not ( = ?auto_16631 ?auto_16622 ) ) ( not ( = ?auto_16605 ?auto_16609 ) ) ( not ( = ?auto_16605 ?auto_16630 ) ) ( not ( = ?auto_16606 ?auto_16609 ) ) ( not ( = ?auto_16606 ?auto_16630 ) ) ( not ( = ?auto_16607 ?auto_16609 ) ) ( not ( = ?auto_16607 ?auto_16630 ) ) ( not ( = ?auto_16609 ?auto_16631 ) ) ( not ( = ?auto_16609 ?auto_16627 ) ) ( not ( = ?auto_16609 ?auto_16622 ) ) ( not ( = ?auto_16628 ?auto_16623 ) ) ( not ( = ?auto_16628 ?auto_16625 ) ) ( not ( = ?auto_16628 ?auto_16617 ) ) ( not ( = ?auto_16629 ?auto_16633 ) ) ( not ( = ?auto_16629 ?auto_16624 ) ) ( not ( = ?auto_16629 ?auto_16613 ) ) ( not ( = ?auto_16630 ?auto_16631 ) ) ( not ( = ?auto_16630 ?auto_16627 ) ) ( not ( = ?auto_16630 ?auto_16622 ) ) ( not ( = ?auto_16605 ?auto_16611 ) ) ( not ( = ?auto_16605 ?auto_16626 ) ) ( not ( = ?auto_16606 ?auto_16611 ) ) ( not ( = ?auto_16606 ?auto_16626 ) ) ( not ( = ?auto_16607 ?auto_16611 ) ) ( not ( = ?auto_16607 ?auto_16626 ) ) ( not ( = ?auto_16608 ?auto_16611 ) ) ( not ( = ?auto_16608 ?auto_16626 ) ) ( not ( = ?auto_16611 ?auto_16630 ) ) ( not ( = ?auto_16611 ?auto_16631 ) ) ( not ( = ?auto_16611 ?auto_16627 ) ) ( not ( = ?auto_16611 ?auto_16622 ) ) ( not ( = ?auto_16632 ?auto_16628 ) ) ( not ( = ?auto_16632 ?auto_16623 ) ) ( not ( = ?auto_16632 ?auto_16625 ) ) ( not ( = ?auto_16632 ?auto_16617 ) ) ( not ( = ?auto_16619 ?auto_16629 ) ) ( not ( = ?auto_16619 ?auto_16633 ) ) ( not ( = ?auto_16619 ?auto_16624 ) ) ( not ( = ?auto_16619 ?auto_16613 ) ) ( not ( = ?auto_16626 ?auto_16630 ) ) ( not ( = ?auto_16626 ?auto_16631 ) ) ( not ( = ?auto_16626 ?auto_16627 ) ) ( not ( = ?auto_16626 ?auto_16622 ) ) ( not ( = ?auto_16605 ?auto_16610 ) ) ( not ( = ?auto_16605 ?auto_16621 ) ) ( not ( = ?auto_16606 ?auto_16610 ) ) ( not ( = ?auto_16606 ?auto_16621 ) ) ( not ( = ?auto_16607 ?auto_16610 ) ) ( not ( = ?auto_16607 ?auto_16621 ) ) ( not ( = ?auto_16608 ?auto_16610 ) ) ( not ( = ?auto_16608 ?auto_16621 ) ) ( not ( = ?auto_16609 ?auto_16610 ) ) ( not ( = ?auto_16609 ?auto_16621 ) ) ( not ( = ?auto_16610 ?auto_16626 ) ) ( not ( = ?auto_16610 ?auto_16630 ) ) ( not ( = ?auto_16610 ?auto_16631 ) ) ( not ( = ?auto_16610 ?auto_16627 ) ) ( not ( = ?auto_16610 ?auto_16622 ) ) ( not ( = ?auto_16634 ?auto_16632 ) ) ( not ( = ?auto_16634 ?auto_16628 ) ) ( not ( = ?auto_16634 ?auto_16623 ) ) ( not ( = ?auto_16634 ?auto_16625 ) ) ( not ( = ?auto_16634 ?auto_16617 ) ) ( not ( = ?auto_16620 ?auto_16619 ) ) ( not ( = ?auto_16620 ?auto_16629 ) ) ( not ( = ?auto_16620 ?auto_16633 ) ) ( not ( = ?auto_16620 ?auto_16624 ) ) ( not ( = ?auto_16620 ?auto_16613 ) ) ( not ( = ?auto_16621 ?auto_16626 ) ) ( not ( = ?auto_16621 ?auto_16630 ) ) ( not ( = ?auto_16621 ?auto_16631 ) ) ( not ( = ?auto_16621 ?auto_16627 ) ) ( not ( = ?auto_16621 ?auto_16622 ) ) ( not ( = ?auto_16605 ?auto_16612 ) ) ( not ( = ?auto_16605 ?auto_16614 ) ) ( not ( = ?auto_16606 ?auto_16612 ) ) ( not ( = ?auto_16606 ?auto_16614 ) ) ( not ( = ?auto_16607 ?auto_16612 ) ) ( not ( = ?auto_16607 ?auto_16614 ) ) ( not ( = ?auto_16608 ?auto_16612 ) ) ( not ( = ?auto_16608 ?auto_16614 ) ) ( not ( = ?auto_16609 ?auto_16612 ) ) ( not ( = ?auto_16609 ?auto_16614 ) ) ( not ( = ?auto_16611 ?auto_16612 ) ) ( not ( = ?auto_16611 ?auto_16614 ) ) ( not ( = ?auto_16612 ?auto_16621 ) ) ( not ( = ?auto_16612 ?auto_16626 ) ) ( not ( = ?auto_16612 ?auto_16630 ) ) ( not ( = ?auto_16612 ?auto_16631 ) ) ( not ( = ?auto_16612 ?auto_16627 ) ) ( not ( = ?auto_16612 ?auto_16622 ) ) ( not ( = ?auto_16614 ?auto_16621 ) ) ( not ( = ?auto_16614 ?auto_16626 ) ) ( not ( = ?auto_16614 ?auto_16630 ) ) ( not ( = ?auto_16614 ?auto_16631 ) ) ( not ( = ?auto_16614 ?auto_16627 ) ) ( not ( = ?auto_16614 ?auto_16622 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16605 ?auto_16606 ?auto_16607 ?auto_16608 ?auto_16609 ?auto_16611 ?auto_16610 )
      ( MAKE-1CRATE ?auto_16610 ?auto_16612 )
      ( MAKE-7CRATE-VERIFY ?auto_16605 ?auto_16606 ?auto_16607 ?auto_16608 ?auto_16609 ?auto_16611 ?auto_16610 ?auto_16612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16637 - SURFACE
      ?auto_16638 - SURFACE
    )
    :vars
    (
      ?auto_16639 - HOIST
      ?auto_16640 - PLACE
      ?auto_16642 - PLACE
      ?auto_16643 - HOIST
      ?auto_16644 - SURFACE
      ?auto_16641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16639 ?auto_16640 ) ( SURFACE-AT ?auto_16637 ?auto_16640 ) ( CLEAR ?auto_16637 ) ( IS-CRATE ?auto_16638 ) ( AVAILABLE ?auto_16639 ) ( not ( = ?auto_16642 ?auto_16640 ) ) ( HOIST-AT ?auto_16643 ?auto_16642 ) ( AVAILABLE ?auto_16643 ) ( SURFACE-AT ?auto_16638 ?auto_16642 ) ( ON ?auto_16638 ?auto_16644 ) ( CLEAR ?auto_16638 ) ( TRUCK-AT ?auto_16641 ?auto_16640 ) ( not ( = ?auto_16637 ?auto_16638 ) ) ( not ( = ?auto_16637 ?auto_16644 ) ) ( not ( = ?auto_16638 ?auto_16644 ) ) ( not ( = ?auto_16639 ?auto_16643 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16641 ?auto_16640 ?auto_16642 )
      ( !LIFT ?auto_16643 ?auto_16638 ?auto_16644 ?auto_16642 )
      ( !LOAD ?auto_16643 ?auto_16638 ?auto_16641 ?auto_16642 )
      ( !DRIVE ?auto_16641 ?auto_16642 ?auto_16640 )
      ( !UNLOAD ?auto_16639 ?auto_16638 ?auto_16641 ?auto_16640 )
      ( !DROP ?auto_16639 ?auto_16638 ?auto_16637 ?auto_16640 )
      ( MAKE-1CRATE-VERIFY ?auto_16637 ?auto_16638 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_16654 - SURFACE
      ?auto_16655 - SURFACE
      ?auto_16656 - SURFACE
      ?auto_16657 - SURFACE
      ?auto_16658 - SURFACE
      ?auto_16660 - SURFACE
      ?auto_16659 - SURFACE
      ?auto_16662 - SURFACE
      ?auto_16661 - SURFACE
    )
    :vars
    (
      ?auto_16666 - HOIST
      ?auto_16665 - PLACE
      ?auto_16664 - PLACE
      ?auto_16663 - HOIST
      ?auto_16668 - SURFACE
      ?auto_16671 - PLACE
      ?auto_16670 - HOIST
      ?auto_16669 - SURFACE
      ?auto_16676 - PLACE
      ?auto_16672 - HOIST
      ?auto_16673 - SURFACE
      ?auto_16682 - PLACE
      ?auto_16675 - HOIST
      ?auto_16683 - SURFACE
      ?auto_16679 - PLACE
      ?auto_16678 - HOIST
      ?auto_16680 - SURFACE
      ?auto_16686 - PLACE
      ?auto_16674 - HOIST
      ?auto_16681 - SURFACE
      ?auto_16684 - PLACE
      ?auto_16685 - HOIST
      ?auto_16677 - SURFACE
      ?auto_16687 - SURFACE
      ?auto_16667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16666 ?auto_16665 ) ( IS-CRATE ?auto_16661 ) ( not ( = ?auto_16664 ?auto_16665 ) ) ( HOIST-AT ?auto_16663 ?auto_16664 ) ( AVAILABLE ?auto_16663 ) ( SURFACE-AT ?auto_16661 ?auto_16664 ) ( ON ?auto_16661 ?auto_16668 ) ( CLEAR ?auto_16661 ) ( not ( = ?auto_16662 ?auto_16661 ) ) ( not ( = ?auto_16662 ?auto_16668 ) ) ( not ( = ?auto_16661 ?auto_16668 ) ) ( not ( = ?auto_16666 ?auto_16663 ) ) ( IS-CRATE ?auto_16662 ) ( not ( = ?auto_16671 ?auto_16665 ) ) ( HOIST-AT ?auto_16670 ?auto_16671 ) ( SURFACE-AT ?auto_16662 ?auto_16671 ) ( ON ?auto_16662 ?auto_16669 ) ( CLEAR ?auto_16662 ) ( not ( = ?auto_16659 ?auto_16662 ) ) ( not ( = ?auto_16659 ?auto_16669 ) ) ( not ( = ?auto_16662 ?auto_16669 ) ) ( not ( = ?auto_16666 ?auto_16670 ) ) ( IS-CRATE ?auto_16659 ) ( not ( = ?auto_16676 ?auto_16665 ) ) ( HOIST-AT ?auto_16672 ?auto_16676 ) ( AVAILABLE ?auto_16672 ) ( SURFACE-AT ?auto_16659 ?auto_16676 ) ( ON ?auto_16659 ?auto_16673 ) ( CLEAR ?auto_16659 ) ( not ( = ?auto_16660 ?auto_16659 ) ) ( not ( = ?auto_16660 ?auto_16673 ) ) ( not ( = ?auto_16659 ?auto_16673 ) ) ( not ( = ?auto_16666 ?auto_16672 ) ) ( IS-CRATE ?auto_16660 ) ( not ( = ?auto_16682 ?auto_16665 ) ) ( HOIST-AT ?auto_16675 ?auto_16682 ) ( AVAILABLE ?auto_16675 ) ( SURFACE-AT ?auto_16660 ?auto_16682 ) ( ON ?auto_16660 ?auto_16683 ) ( CLEAR ?auto_16660 ) ( not ( = ?auto_16658 ?auto_16660 ) ) ( not ( = ?auto_16658 ?auto_16683 ) ) ( not ( = ?auto_16660 ?auto_16683 ) ) ( not ( = ?auto_16666 ?auto_16675 ) ) ( IS-CRATE ?auto_16658 ) ( not ( = ?auto_16679 ?auto_16665 ) ) ( HOIST-AT ?auto_16678 ?auto_16679 ) ( AVAILABLE ?auto_16678 ) ( SURFACE-AT ?auto_16658 ?auto_16679 ) ( ON ?auto_16658 ?auto_16680 ) ( CLEAR ?auto_16658 ) ( not ( = ?auto_16657 ?auto_16658 ) ) ( not ( = ?auto_16657 ?auto_16680 ) ) ( not ( = ?auto_16658 ?auto_16680 ) ) ( not ( = ?auto_16666 ?auto_16678 ) ) ( IS-CRATE ?auto_16657 ) ( not ( = ?auto_16686 ?auto_16665 ) ) ( HOIST-AT ?auto_16674 ?auto_16686 ) ( AVAILABLE ?auto_16674 ) ( SURFACE-AT ?auto_16657 ?auto_16686 ) ( ON ?auto_16657 ?auto_16681 ) ( CLEAR ?auto_16657 ) ( not ( = ?auto_16656 ?auto_16657 ) ) ( not ( = ?auto_16656 ?auto_16681 ) ) ( not ( = ?auto_16657 ?auto_16681 ) ) ( not ( = ?auto_16666 ?auto_16674 ) ) ( IS-CRATE ?auto_16656 ) ( not ( = ?auto_16684 ?auto_16665 ) ) ( HOIST-AT ?auto_16685 ?auto_16684 ) ( AVAILABLE ?auto_16685 ) ( SURFACE-AT ?auto_16656 ?auto_16684 ) ( ON ?auto_16656 ?auto_16677 ) ( CLEAR ?auto_16656 ) ( not ( = ?auto_16655 ?auto_16656 ) ) ( not ( = ?auto_16655 ?auto_16677 ) ) ( not ( = ?auto_16656 ?auto_16677 ) ) ( not ( = ?auto_16666 ?auto_16685 ) ) ( SURFACE-AT ?auto_16654 ?auto_16665 ) ( CLEAR ?auto_16654 ) ( IS-CRATE ?auto_16655 ) ( AVAILABLE ?auto_16666 ) ( AVAILABLE ?auto_16670 ) ( SURFACE-AT ?auto_16655 ?auto_16671 ) ( ON ?auto_16655 ?auto_16687 ) ( CLEAR ?auto_16655 ) ( TRUCK-AT ?auto_16667 ?auto_16665 ) ( not ( = ?auto_16654 ?auto_16655 ) ) ( not ( = ?auto_16654 ?auto_16687 ) ) ( not ( = ?auto_16655 ?auto_16687 ) ) ( not ( = ?auto_16654 ?auto_16656 ) ) ( not ( = ?auto_16654 ?auto_16677 ) ) ( not ( = ?auto_16656 ?auto_16687 ) ) ( not ( = ?auto_16684 ?auto_16671 ) ) ( not ( = ?auto_16685 ?auto_16670 ) ) ( not ( = ?auto_16677 ?auto_16687 ) ) ( not ( = ?auto_16654 ?auto_16657 ) ) ( not ( = ?auto_16654 ?auto_16681 ) ) ( not ( = ?auto_16655 ?auto_16657 ) ) ( not ( = ?auto_16655 ?auto_16681 ) ) ( not ( = ?auto_16657 ?auto_16677 ) ) ( not ( = ?auto_16657 ?auto_16687 ) ) ( not ( = ?auto_16686 ?auto_16684 ) ) ( not ( = ?auto_16686 ?auto_16671 ) ) ( not ( = ?auto_16674 ?auto_16685 ) ) ( not ( = ?auto_16674 ?auto_16670 ) ) ( not ( = ?auto_16681 ?auto_16677 ) ) ( not ( = ?auto_16681 ?auto_16687 ) ) ( not ( = ?auto_16654 ?auto_16658 ) ) ( not ( = ?auto_16654 ?auto_16680 ) ) ( not ( = ?auto_16655 ?auto_16658 ) ) ( not ( = ?auto_16655 ?auto_16680 ) ) ( not ( = ?auto_16656 ?auto_16658 ) ) ( not ( = ?auto_16656 ?auto_16680 ) ) ( not ( = ?auto_16658 ?auto_16681 ) ) ( not ( = ?auto_16658 ?auto_16677 ) ) ( not ( = ?auto_16658 ?auto_16687 ) ) ( not ( = ?auto_16679 ?auto_16686 ) ) ( not ( = ?auto_16679 ?auto_16684 ) ) ( not ( = ?auto_16679 ?auto_16671 ) ) ( not ( = ?auto_16678 ?auto_16674 ) ) ( not ( = ?auto_16678 ?auto_16685 ) ) ( not ( = ?auto_16678 ?auto_16670 ) ) ( not ( = ?auto_16680 ?auto_16681 ) ) ( not ( = ?auto_16680 ?auto_16677 ) ) ( not ( = ?auto_16680 ?auto_16687 ) ) ( not ( = ?auto_16654 ?auto_16660 ) ) ( not ( = ?auto_16654 ?auto_16683 ) ) ( not ( = ?auto_16655 ?auto_16660 ) ) ( not ( = ?auto_16655 ?auto_16683 ) ) ( not ( = ?auto_16656 ?auto_16660 ) ) ( not ( = ?auto_16656 ?auto_16683 ) ) ( not ( = ?auto_16657 ?auto_16660 ) ) ( not ( = ?auto_16657 ?auto_16683 ) ) ( not ( = ?auto_16660 ?auto_16680 ) ) ( not ( = ?auto_16660 ?auto_16681 ) ) ( not ( = ?auto_16660 ?auto_16677 ) ) ( not ( = ?auto_16660 ?auto_16687 ) ) ( not ( = ?auto_16682 ?auto_16679 ) ) ( not ( = ?auto_16682 ?auto_16686 ) ) ( not ( = ?auto_16682 ?auto_16684 ) ) ( not ( = ?auto_16682 ?auto_16671 ) ) ( not ( = ?auto_16675 ?auto_16678 ) ) ( not ( = ?auto_16675 ?auto_16674 ) ) ( not ( = ?auto_16675 ?auto_16685 ) ) ( not ( = ?auto_16675 ?auto_16670 ) ) ( not ( = ?auto_16683 ?auto_16680 ) ) ( not ( = ?auto_16683 ?auto_16681 ) ) ( not ( = ?auto_16683 ?auto_16677 ) ) ( not ( = ?auto_16683 ?auto_16687 ) ) ( not ( = ?auto_16654 ?auto_16659 ) ) ( not ( = ?auto_16654 ?auto_16673 ) ) ( not ( = ?auto_16655 ?auto_16659 ) ) ( not ( = ?auto_16655 ?auto_16673 ) ) ( not ( = ?auto_16656 ?auto_16659 ) ) ( not ( = ?auto_16656 ?auto_16673 ) ) ( not ( = ?auto_16657 ?auto_16659 ) ) ( not ( = ?auto_16657 ?auto_16673 ) ) ( not ( = ?auto_16658 ?auto_16659 ) ) ( not ( = ?auto_16658 ?auto_16673 ) ) ( not ( = ?auto_16659 ?auto_16683 ) ) ( not ( = ?auto_16659 ?auto_16680 ) ) ( not ( = ?auto_16659 ?auto_16681 ) ) ( not ( = ?auto_16659 ?auto_16677 ) ) ( not ( = ?auto_16659 ?auto_16687 ) ) ( not ( = ?auto_16676 ?auto_16682 ) ) ( not ( = ?auto_16676 ?auto_16679 ) ) ( not ( = ?auto_16676 ?auto_16686 ) ) ( not ( = ?auto_16676 ?auto_16684 ) ) ( not ( = ?auto_16676 ?auto_16671 ) ) ( not ( = ?auto_16672 ?auto_16675 ) ) ( not ( = ?auto_16672 ?auto_16678 ) ) ( not ( = ?auto_16672 ?auto_16674 ) ) ( not ( = ?auto_16672 ?auto_16685 ) ) ( not ( = ?auto_16672 ?auto_16670 ) ) ( not ( = ?auto_16673 ?auto_16683 ) ) ( not ( = ?auto_16673 ?auto_16680 ) ) ( not ( = ?auto_16673 ?auto_16681 ) ) ( not ( = ?auto_16673 ?auto_16677 ) ) ( not ( = ?auto_16673 ?auto_16687 ) ) ( not ( = ?auto_16654 ?auto_16662 ) ) ( not ( = ?auto_16654 ?auto_16669 ) ) ( not ( = ?auto_16655 ?auto_16662 ) ) ( not ( = ?auto_16655 ?auto_16669 ) ) ( not ( = ?auto_16656 ?auto_16662 ) ) ( not ( = ?auto_16656 ?auto_16669 ) ) ( not ( = ?auto_16657 ?auto_16662 ) ) ( not ( = ?auto_16657 ?auto_16669 ) ) ( not ( = ?auto_16658 ?auto_16662 ) ) ( not ( = ?auto_16658 ?auto_16669 ) ) ( not ( = ?auto_16660 ?auto_16662 ) ) ( not ( = ?auto_16660 ?auto_16669 ) ) ( not ( = ?auto_16662 ?auto_16673 ) ) ( not ( = ?auto_16662 ?auto_16683 ) ) ( not ( = ?auto_16662 ?auto_16680 ) ) ( not ( = ?auto_16662 ?auto_16681 ) ) ( not ( = ?auto_16662 ?auto_16677 ) ) ( not ( = ?auto_16662 ?auto_16687 ) ) ( not ( = ?auto_16669 ?auto_16673 ) ) ( not ( = ?auto_16669 ?auto_16683 ) ) ( not ( = ?auto_16669 ?auto_16680 ) ) ( not ( = ?auto_16669 ?auto_16681 ) ) ( not ( = ?auto_16669 ?auto_16677 ) ) ( not ( = ?auto_16669 ?auto_16687 ) ) ( not ( = ?auto_16654 ?auto_16661 ) ) ( not ( = ?auto_16654 ?auto_16668 ) ) ( not ( = ?auto_16655 ?auto_16661 ) ) ( not ( = ?auto_16655 ?auto_16668 ) ) ( not ( = ?auto_16656 ?auto_16661 ) ) ( not ( = ?auto_16656 ?auto_16668 ) ) ( not ( = ?auto_16657 ?auto_16661 ) ) ( not ( = ?auto_16657 ?auto_16668 ) ) ( not ( = ?auto_16658 ?auto_16661 ) ) ( not ( = ?auto_16658 ?auto_16668 ) ) ( not ( = ?auto_16660 ?auto_16661 ) ) ( not ( = ?auto_16660 ?auto_16668 ) ) ( not ( = ?auto_16659 ?auto_16661 ) ) ( not ( = ?auto_16659 ?auto_16668 ) ) ( not ( = ?auto_16661 ?auto_16669 ) ) ( not ( = ?auto_16661 ?auto_16673 ) ) ( not ( = ?auto_16661 ?auto_16683 ) ) ( not ( = ?auto_16661 ?auto_16680 ) ) ( not ( = ?auto_16661 ?auto_16681 ) ) ( not ( = ?auto_16661 ?auto_16677 ) ) ( not ( = ?auto_16661 ?auto_16687 ) ) ( not ( = ?auto_16664 ?auto_16671 ) ) ( not ( = ?auto_16664 ?auto_16676 ) ) ( not ( = ?auto_16664 ?auto_16682 ) ) ( not ( = ?auto_16664 ?auto_16679 ) ) ( not ( = ?auto_16664 ?auto_16686 ) ) ( not ( = ?auto_16664 ?auto_16684 ) ) ( not ( = ?auto_16663 ?auto_16670 ) ) ( not ( = ?auto_16663 ?auto_16672 ) ) ( not ( = ?auto_16663 ?auto_16675 ) ) ( not ( = ?auto_16663 ?auto_16678 ) ) ( not ( = ?auto_16663 ?auto_16674 ) ) ( not ( = ?auto_16663 ?auto_16685 ) ) ( not ( = ?auto_16668 ?auto_16669 ) ) ( not ( = ?auto_16668 ?auto_16673 ) ) ( not ( = ?auto_16668 ?auto_16683 ) ) ( not ( = ?auto_16668 ?auto_16680 ) ) ( not ( = ?auto_16668 ?auto_16681 ) ) ( not ( = ?auto_16668 ?auto_16677 ) ) ( not ( = ?auto_16668 ?auto_16687 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16654 ?auto_16655 ?auto_16656 ?auto_16657 ?auto_16658 ?auto_16660 ?auto_16659 ?auto_16662 )
      ( MAKE-1CRATE ?auto_16662 ?auto_16661 )
      ( MAKE-8CRATE-VERIFY ?auto_16654 ?auto_16655 ?auto_16656 ?auto_16657 ?auto_16658 ?auto_16660 ?auto_16659 ?auto_16662 ?auto_16661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16690 - SURFACE
      ?auto_16691 - SURFACE
    )
    :vars
    (
      ?auto_16692 - HOIST
      ?auto_16693 - PLACE
      ?auto_16695 - PLACE
      ?auto_16696 - HOIST
      ?auto_16697 - SURFACE
      ?auto_16694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16692 ?auto_16693 ) ( SURFACE-AT ?auto_16690 ?auto_16693 ) ( CLEAR ?auto_16690 ) ( IS-CRATE ?auto_16691 ) ( AVAILABLE ?auto_16692 ) ( not ( = ?auto_16695 ?auto_16693 ) ) ( HOIST-AT ?auto_16696 ?auto_16695 ) ( AVAILABLE ?auto_16696 ) ( SURFACE-AT ?auto_16691 ?auto_16695 ) ( ON ?auto_16691 ?auto_16697 ) ( CLEAR ?auto_16691 ) ( TRUCK-AT ?auto_16694 ?auto_16693 ) ( not ( = ?auto_16690 ?auto_16691 ) ) ( not ( = ?auto_16690 ?auto_16697 ) ) ( not ( = ?auto_16691 ?auto_16697 ) ) ( not ( = ?auto_16692 ?auto_16696 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16694 ?auto_16693 ?auto_16695 )
      ( !LIFT ?auto_16696 ?auto_16691 ?auto_16697 ?auto_16695 )
      ( !LOAD ?auto_16696 ?auto_16691 ?auto_16694 ?auto_16695 )
      ( !DRIVE ?auto_16694 ?auto_16695 ?auto_16693 )
      ( !UNLOAD ?auto_16692 ?auto_16691 ?auto_16694 ?auto_16693 )
      ( !DROP ?auto_16692 ?auto_16691 ?auto_16690 ?auto_16693 )
      ( MAKE-1CRATE-VERIFY ?auto_16690 ?auto_16691 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_16708 - SURFACE
      ?auto_16709 - SURFACE
      ?auto_16710 - SURFACE
      ?auto_16711 - SURFACE
      ?auto_16712 - SURFACE
      ?auto_16715 - SURFACE
      ?auto_16713 - SURFACE
      ?auto_16717 - SURFACE
      ?auto_16716 - SURFACE
      ?auto_16714 - SURFACE
    )
    :vars
    (
      ?auto_16718 - HOIST
      ?auto_16719 - PLACE
      ?auto_16721 - PLACE
      ?auto_16723 - HOIST
      ?auto_16720 - SURFACE
      ?auto_16724 - PLACE
      ?auto_16726 - HOIST
      ?auto_16728 - SURFACE
      ?auto_16730 - PLACE
      ?auto_16725 - HOIST
      ?auto_16731 - SURFACE
      ?auto_16741 - PLACE
      ?auto_16729 - HOIST
      ?auto_16743 - SURFACE
      ?auto_16740 - PLACE
      ?auto_16742 - HOIST
      ?auto_16727 - SURFACE
      ?auto_16736 - PLACE
      ?auto_16737 - HOIST
      ?auto_16738 - SURFACE
      ?auto_16739 - SURFACE
      ?auto_16734 - PLACE
      ?auto_16732 - HOIST
      ?auto_16735 - SURFACE
      ?auto_16733 - SURFACE
      ?auto_16722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16718 ?auto_16719 ) ( IS-CRATE ?auto_16714 ) ( not ( = ?auto_16721 ?auto_16719 ) ) ( HOIST-AT ?auto_16723 ?auto_16721 ) ( SURFACE-AT ?auto_16714 ?auto_16721 ) ( ON ?auto_16714 ?auto_16720 ) ( CLEAR ?auto_16714 ) ( not ( = ?auto_16716 ?auto_16714 ) ) ( not ( = ?auto_16716 ?auto_16720 ) ) ( not ( = ?auto_16714 ?auto_16720 ) ) ( not ( = ?auto_16718 ?auto_16723 ) ) ( IS-CRATE ?auto_16716 ) ( not ( = ?auto_16724 ?auto_16719 ) ) ( HOIST-AT ?auto_16726 ?auto_16724 ) ( AVAILABLE ?auto_16726 ) ( SURFACE-AT ?auto_16716 ?auto_16724 ) ( ON ?auto_16716 ?auto_16728 ) ( CLEAR ?auto_16716 ) ( not ( = ?auto_16717 ?auto_16716 ) ) ( not ( = ?auto_16717 ?auto_16728 ) ) ( not ( = ?auto_16716 ?auto_16728 ) ) ( not ( = ?auto_16718 ?auto_16726 ) ) ( IS-CRATE ?auto_16717 ) ( not ( = ?auto_16730 ?auto_16719 ) ) ( HOIST-AT ?auto_16725 ?auto_16730 ) ( SURFACE-AT ?auto_16717 ?auto_16730 ) ( ON ?auto_16717 ?auto_16731 ) ( CLEAR ?auto_16717 ) ( not ( = ?auto_16713 ?auto_16717 ) ) ( not ( = ?auto_16713 ?auto_16731 ) ) ( not ( = ?auto_16717 ?auto_16731 ) ) ( not ( = ?auto_16718 ?auto_16725 ) ) ( IS-CRATE ?auto_16713 ) ( not ( = ?auto_16741 ?auto_16719 ) ) ( HOIST-AT ?auto_16729 ?auto_16741 ) ( AVAILABLE ?auto_16729 ) ( SURFACE-AT ?auto_16713 ?auto_16741 ) ( ON ?auto_16713 ?auto_16743 ) ( CLEAR ?auto_16713 ) ( not ( = ?auto_16715 ?auto_16713 ) ) ( not ( = ?auto_16715 ?auto_16743 ) ) ( not ( = ?auto_16713 ?auto_16743 ) ) ( not ( = ?auto_16718 ?auto_16729 ) ) ( IS-CRATE ?auto_16715 ) ( not ( = ?auto_16740 ?auto_16719 ) ) ( HOIST-AT ?auto_16742 ?auto_16740 ) ( AVAILABLE ?auto_16742 ) ( SURFACE-AT ?auto_16715 ?auto_16740 ) ( ON ?auto_16715 ?auto_16727 ) ( CLEAR ?auto_16715 ) ( not ( = ?auto_16712 ?auto_16715 ) ) ( not ( = ?auto_16712 ?auto_16727 ) ) ( not ( = ?auto_16715 ?auto_16727 ) ) ( not ( = ?auto_16718 ?auto_16742 ) ) ( IS-CRATE ?auto_16712 ) ( not ( = ?auto_16736 ?auto_16719 ) ) ( HOIST-AT ?auto_16737 ?auto_16736 ) ( AVAILABLE ?auto_16737 ) ( SURFACE-AT ?auto_16712 ?auto_16736 ) ( ON ?auto_16712 ?auto_16738 ) ( CLEAR ?auto_16712 ) ( not ( = ?auto_16711 ?auto_16712 ) ) ( not ( = ?auto_16711 ?auto_16738 ) ) ( not ( = ?auto_16712 ?auto_16738 ) ) ( not ( = ?auto_16718 ?auto_16737 ) ) ( IS-CRATE ?auto_16711 ) ( AVAILABLE ?auto_16723 ) ( SURFACE-AT ?auto_16711 ?auto_16721 ) ( ON ?auto_16711 ?auto_16739 ) ( CLEAR ?auto_16711 ) ( not ( = ?auto_16710 ?auto_16711 ) ) ( not ( = ?auto_16710 ?auto_16739 ) ) ( not ( = ?auto_16711 ?auto_16739 ) ) ( IS-CRATE ?auto_16710 ) ( not ( = ?auto_16734 ?auto_16719 ) ) ( HOIST-AT ?auto_16732 ?auto_16734 ) ( AVAILABLE ?auto_16732 ) ( SURFACE-AT ?auto_16710 ?auto_16734 ) ( ON ?auto_16710 ?auto_16735 ) ( CLEAR ?auto_16710 ) ( not ( = ?auto_16709 ?auto_16710 ) ) ( not ( = ?auto_16709 ?auto_16735 ) ) ( not ( = ?auto_16710 ?auto_16735 ) ) ( not ( = ?auto_16718 ?auto_16732 ) ) ( SURFACE-AT ?auto_16708 ?auto_16719 ) ( CLEAR ?auto_16708 ) ( IS-CRATE ?auto_16709 ) ( AVAILABLE ?auto_16718 ) ( AVAILABLE ?auto_16725 ) ( SURFACE-AT ?auto_16709 ?auto_16730 ) ( ON ?auto_16709 ?auto_16733 ) ( CLEAR ?auto_16709 ) ( TRUCK-AT ?auto_16722 ?auto_16719 ) ( not ( = ?auto_16708 ?auto_16709 ) ) ( not ( = ?auto_16708 ?auto_16733 ) ) ( not ( = ?auto_16709 ?auto_16733 ) ) ( not ( = ?auto_16708 ?auto_16710 ) ) ( not ( = ?auto_16708 ?auto_16735 ) ) ( not ( = ?auto_16710 ?auto_16733 ) ) ( not ( = ?auto_16734 ?auto_16730 ) ) ( not ( = ?auto_16732 ?auto_16725 ) ) ( not ( = ?auto_16735 ?auto_16733 ) ) ( not ( = ?auto_16708 ?auto_16711 ) ) ( not ( = ?auto_16708 ?auto_16739 ) ) ( not ( = ?auto_16709 ?auto_16711 ) ) ( not ( = ?auto_16709 ?auto_16739 ) ) ( not ( = ?auto_16711 ?auto_16735 ) ) ( not ( = ?auto_16711 ?auto_16733 ) ) ( not ( = ?auto_16721 ?auto_16734 ) ) ( not ( = ?auto_16721 ?auto_16730 ) ) ( not ( = ?auto_16723 ?auto_16732 ) ) ( not ( = ?auto_16723 ?auto_16725 ) ) ( not ( = ?auto_16739 ?auto_16735 ) ) ( not ( = ?auto_16739 ?auto_16733 ) ) ( not ( = ?auto_16708 ?auto_16712 ) ) ( not ( = ?auto_16708 ?auto_16738 ) ) ( not ( = ?auto_16709 ?auto_16712 ) ) ( not ( = ?auto_16709 ?auto_16738 ) ) ( not ( = ?auto_16710 ?auto_16712 ) ) ( not ( = ?auto_16710 ?auto_16738 ) ) ( not ( = ?auto_16712 ?auto_16739 ) ) ( not ( = ?auto_16712 ?auto_16735 ) ) ( not ( = ?auto_16712 ?auto_16733 ) ) ( not ( = ?auto_16736 ?auto_16721 ) ) ( not ( = ?auto_16736 ?auto_16734 ) ) ( not ( = ?auto_16736 ?auto_16730 ) ) ( not ( = ?auto_16737 ?auto_16723 ) ) ( not ( = ?auto_16737 ?auto_16732 ) ) ( not ( = ?auto_16737 ?auto_16725 ) ) ( not ( = ?auto_16738 ?auto_16739 ) ) ( not ( = ?auto_16738 ?auto_16735 ) ) ( not ( = ?auto_16738 ?auto_16733 ) ) ( not ( = ?auto_16708 ?auto_16715 ) ) ( not ( = ?auto_16708 ?auto_16727 ) ) ( not ( = ?auto_16709 ?auto_16715 ) ) ( not ( = ?auto_16709 ?auto_16727 ) ) ( not ( = ?auto_16710 ?auto_16715 ) ) ( not ( = ?auto_16710 ?auto_16727 ) ) ( not ( = ?auto_16711 ?auto_16715 ) ) ( not ( = ?auto_16711 ?auto_16727 ) ) ( not ( = ?auto_16715 ?auto_16738 ) ) ( not ( = ?auto_16715 ?auto_16739 ) ) ( not ( = ?auto_16715 ?auto_16735 ) ) ( not ( = ?auto_16715 ?auto_16733 ) ) ( not ( = ?auto_16740 ?auto_16736 ) ) ( not ( = ?auto_16740 ?auto_16721 ) ) ( not ( = ?auto_16740 ?auto_16734 ) ) ( not ( = ?auto_16740 ?auto_16730 ) ) ( not ( = ?auto_16742 ?auto_16737 ) ) ( not ( = ?auto_16742 ?auto_16723 ) ) ( not ( = ?auto_16742 ?auto_16732 ) ) ( not ( = ?auto_16742 ?auto_16725 ) ) ( not ( = ?auto_16727 ?auto_16738 ) ) ( not ( = ?auto_16727 ?auto_16739 ) ) ( not ( = ?auto_16727 ?auto_16735 ) ) ( not ( = ?auto_16727 ?auto_16733 ) ) ( not ( = ?auto_16708 ?auto_16713 ) ) ( not ( = ?auto_16708 ?auto_16743 ) ) ( not ( = ?auto_16709 ?auto_16713 ) ) ( not ( = ?auto_16709 ?auto_16743 ) ) ( not ( = ?auto_16710 ?auto_16713 ) ) ( not ( = ?auto_16710 ?auto_16743 ) ) ( not ( = ?auto_16711 ?auto_16713 ) ) ( not ( = ?auto_16711 ?auto_16743 ) ) ( not ( = ?auto_16712 ?auto_16713 ) ) ( not ( = ?auto_16712 ?auto_16743 ) ) ( not ( = ?auto_16713 ?auto_16727 ) ) ( not ( = ?auto_16713 ?auto_16738 ) ) ( not ( = ?auto_16713 ?auto_16739 ) ) ( not ( = ?auto_16713 ?auto_16735 ) ) ( not ( = ?auto_16713 ?auto_16733 ) ) ( not ( = ?auto_16741 ?auto_16740 ) ) ( not ( = ?auto_16741 ?auto_16736 ) ) ( not ( = ?auto_16741 ?auto_16721 ) ) ( not ( = ?auto_16741 ?auto_16734 ) ) ( not ( = ?auto_16741 ?auto_16730 ) ) ( not ( = ?auto_16729 ?auto_16742 ) ) ( not ( = ?auto_16729 ?auto_16737 ) ) ( not ( = ?auto_16729 ?auto_16723 ) ) ( not ( = ?auto_16729 ?auto_16732 ) ) ( not ( = ?auto_16729 ?auto_16725 ) ) ( not ( = ?auto_16743 ?auto_16727 ) ) ( not ( = ?auto_16743 ?auto_16738 ) ) ( not ( = ?auto_16743 ?auto_16739 ) ) ( not ( = ?auto_16743 ?auto_16735 ) ) ( not ( = ?auto_16743 ?auto_16733 ) ) ( not ( = ?auto_16708 ?auto_16717 ) ) ( not ( = ?auto_16708 ?auto_16731 ) ) ( not ( = ?auto_16709 ?auto_16717 ) ) ( not ( = ?auto_16709 ?auto_16731 ) ) ( not ( = ?auto_16710 ?auto_16717 ) ) ( not ( = ?auto_16710 ?auto_16731 ) ) ( not ( = ?auto_16711 ?auto_16717 ) ) ( not ( = ?auto_16711 ?auto_16731 ) ) ( not ( = ?auto_16712 ?auto_16717 ) ) ( not ( = ?auto_16712 ?auto_16731 ) ) ( not ( = ?auto_16715 ?auto_16717 ) ) ( not ( = ?auto_16715 ?auto_16731 ) ) ( not ( = ?auto_16717 ?auto_16743 ) ) ( not ( = ?auto_16717 ?auto_16727 ) ) ( not ( = ?auto_16717 ?auto_16738 ) ) ( not ( = ?auto_16717 ?auto_16739 ) ) ( not ( = ?auto_16717 ?auto_16735 ) ) ( not ( = ?auto_16717 ?auto_16733 ) ) ( not ( = ?auto_16731 ?auto_16743 ) ) ( not ( = ?auto_16731 ?auto_16727 ) ) ( not ( = ?auto_16731 ?auto_16738 ) ) ( not ( = ?auto_16731 ?auto_16739 ) ) ( not ( = ?auto_16731 ?auto_16735 ) ) ( not ( = ?auto_16731 ?auto_16733 ) ) ( not ( = ?auto_16708 ?auto_16716 ) ) ( not ( = ?auto_16708 ?auto_16728 ) ) ( not ( = ?auto_16709 ?auto_16716 ) ) ( not ( = ?auto_16709 ?auto_16728 ) ) ( not ( = ?auto_16710 ?auto_16716 ) ) ( not ( = ?auto_16710 ?auto_16728 ) ) ( not ( = ?auto_16711 ?auto_16716 ) ) ( not ( = ?auto_16711 ?auto_16728 ) ) ( not ( = ?auto_16712 ?auto_16716 ) ) ( not ( = ?auto_16712 ?auto_16728 ) ) ( not ( = ?auto_16715 ?auto_16716 ) ) ( not ( = ?auto_16715 ?auto_16728 ) ) ( not ( = ?auto_16713 ?auto_16716 ) ) ( not ( = ?auto_16713 ?auto_16728 ) ) ( not ( = ?auto_16716 ?auto_16731 ) ) ( not ( = ?auto_16716 ?auto_16743 ) ) ( not ( = ?auto_16716 ?auto_16727 ) ) ( not ( = ?auto_16716 ?auto_16738 ) ) ( not ( = ?auto_16716 ?auto_16739 ) ) ( not ( = ?auto_16716 ?auto_16735 ) ) ( not ( = ?auto_16716 ?auto_16733 ) ) ( not ( = ?auto_16724 ?auto_16730 ) ) ( not ( = ?auto_16724 ?auto_16741 ) ) ( not ( = ?auto_16724 ?auto_16740 ) ) ( not ( = ?auto_16724 ?auto_16736 ) ) ( not ( = ?auto_16724 ?auto_16721 ) ) ( not ( = ?auto_16724 ?auto_16734 ) ) ( not ( = ?auto_16726 ?auto_16725 ) ) ( not ( = ?auto_16726 ?auto_16729 ) ) ( not ( = ?auto_16726 ?auto_16742 ) ) ( not ( = ?auto_16726 ?auto_16737 ) ) ( not ( = ?auto_16726 ?auto_16723 ) ) ( not ( = ?auto_16726 ?auto_16732 ) ) ( not ( = ?auto_16728 ?auto_16731 ) ) ( not ( = ?auto_16728 ?auto_16743 ) ) ( not ( = ?auto_16728 ?auto_16727 ) ) ( not ( = ?auto_16728 ?auto_16738 ) ) ( not ( = ?auto_16728 ?auto_16739 ) ) ( not ( = ?auto_16728 ?auto_16735 ) ) ( not ( = ?auto_16728 ?auto_16733 ) ) ( not ( = ?auto_16708 ?auto_16714 ) ) ( not ( = ?auto_16708 ?auto_16720 ) ) ( not ( = ?auto_16709 ?auto_16714 ) ) ( not ( = ?auto_16709 ?auto_16720 ) ) ( not ( = ?auto_16710 ?auto_16714 ) ) ( not ( = ?auto_16710 ?auto_16720 ) ) ( not ( = ?auto_16711 ?auto_16714 ) ) ( not ( = ?auto_16711 ?auto_16720 ) ) ( not ( = ?auto_16712 ?auto_16714 ) ) ( not ( = ?auto_16712 ?auto_16720 ) ) ( not ( = ?auto_16715 ?auto_16714 ) ) ( not ( = ?auto_16715 ?auto_16720 ) ) ( not ( = ?auto_16713 ?auto_16714 ) ) ( not ( = ?auto_16713 ?auto_16720 ) ) ( not ( = ?auto_16717 ?auto_16714 ) ) ( not ( = ?auto_16717 ?auto_16720 ) ) ( not ( = ?auto_16714 ?auto_16728 ) ) ( not ( = ?auto_16714 ?auto_16731 ) ) ( not ( = ?auto_16714 ?auto_16743 ) ) ( not ( = ?auto_16714 ?auto_16727 ) ) ( not ( = ?auto_16714 ?auto_16738 ) ) ( not ( = ?auto_16714 ?auto_16739 ) ) ( not ( = ?auto_16714 ?auto_16735 ) ) ( not ( = ?auto_16714 ?auto_16733 ) ) ( not ( = ?auto_16720 ?auto_16728 ) ) ( not ( = ?auto_16720 ?auto_16731 ) ) ( not ( = ?auto_16720 ?auto_16743 ) ) ( not ( = ?auto_16720 ?auto_16727 ) ) ( not ( = ?auto_16720 ?auto_16738 ) ) ( not ( = ?auto_16720 ?auto_16739 ) ) ( not ( = ?auto_16720 ?auto_16735 ) ) ( not ( = ?auto_16720 ?auto_16733 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16708 ?auto_16709 ?auto_16710 ?auto_16711 ?auto_16712 ?auto_16715 ?auto_16713 ?auto_16717 ?auto_16716 )
      ( MAKE-1CRATE ?auto_16716 ?auto_16714 )
      ( MAKE-9CRATE-VERIFY ?auto_16708 ?auto_16709 ?auto_16710 ?auto_16711 ?auto_16712 ?auto_16715 ?auto_16713 ?auto_16717 ?auto_16716 ?auto_16714 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16746 - SURFACE
      ?auto_16747 - SURFACE
    )
    :vars
    (
      ?auto_16748 - HOIST
      ?auto_16749 - PLACE
      ?auto_16751 - PLACE
      ?auto_16752 - HOIST
      ?auto_16753 - SURFACE
      ?auto_16750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16748 ?auto_16749 ) ( SURFACE-AT ?auto_16746 ?auto_16749 ) ( CLEAR ?auto_16746 ) ( IS-CRATE ?auto_16747 ) ( AVAILABLE ?auto_16748 ) ( not ( = ?auto_16751 ?auto_16749 ) ) ( HOIST-AT ?auto_16752 ?auto_16751 ) ( AVAILABLE ?auto_16752 ) ( SURFACE-AT ?auto_16747 ?auto_16751 ) ( ON ?auto_16747 ?auto_16753 ) ( CLEAR ?auto_16747 ) ( TRUCK-AT ?auto_16750 ?auto_16749 ) ( not ( = ?auto_16746 ?auto_16747 ) ) ( not ( = ?auto_16746 ?auto_16753 ) ) ( not ( = ?auto_16747 ?auto_16753 ) ) ( not ( = ?auto_16748 ?auto_16752 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16750 ?auto_16749 ?auto_16751 )
      ( !LIFT ?auto_16752 ?auto_16747 ?auto_16753 ?auto_16751 )
      ( !LOAD ?auto_16752 ?auto_16747 ?auto_16750 ?auto_16751 )
      ( !DRIVE ?auto_16750 ?auto_16751 ?auto_16749 )
      ( !UNLOAD ?auto_16748 ?auto_16747 ?auto_16750 ?auto_16749 )
      ( !DROP ?auto_16748 ?auto_16747 ?auto_16746 ?auto_16749 )
      ( MAKE-1CRATE-VERIFY ?auto_16746 ?auto_16747 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_16765 - SURFACE
      ?auto_16766 - SURFACE
      ?auto_16767 - SURFACE
      ?auto_16768 - SURFACE
      ?auto_16769 - SURFACE
      ?auto_16772 - SURFACE
      ?auto_16770 - SURFACE
      ?auto_16774 - SURFACE
      ?auto_16773 - SURFACE
      ?auto_16771 - SURFACE
      ?auto_16775 - SURFACE
    )
    :vars
    (
      ?auto_16781 - HOIST
      ?auto_16779 - PLACE
      ?auto_16780 - PLACE
      ?auto_16777 - HOIST
      ?auto_16776 - SURFACE
      ?auto_16798 - PLACE
      ?auto_16783 - HOIST
      ?auto_16796 - SURFACE
      ?auto_16792 - SURFACE
      ?auto_16797 - PLACE
      ?auto_16789 - HOIST
      ?auto_16785 - SURFACE
      ?auto_16787 - PLACE
      ?auto_16791 - HOIST
      ?auto_16794 - SURFACE
      ?auto_16795 - PLACE
      ?auto_16790 - HOIST
      ?auto_16786 - SURFACE
      ?auto_16801 - PLACE
      ?auto_16800 - HOIST
      ?auto_16788 - SURFACE
      ?auto_16782 - SURFACE
      ?auto_16793 - PLACE
      ?auto_16799 - HOIST
      ?auto_16784 - SURFACE
      ?auto_16802 - SURFACE
      ?auto_16778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16781 ?auto_16779 ) ( IS-CRATE ?auto_16775 ) ( not ( = ?auto_16780 ?auto_16779 ) ) ( HOIST-AT ?auto_16777 ?auto_16780 ) ( SURFACE-AT ?auto_16775 ?auto_16780 ) ( ON ?auto_16775 ?auto_16776 ) ( CLEAR ?auto_16775 ) ( not ( = ?auto_16771 ?auto_16775 ) ) ( not ( = ?auto_16771 ?auto_16776 ) ) ( not ( = ?auto_16775 ?auto_16776 ) ) ( not ( = ?auto_16781 ?auto_16777 ) ) ( IS-CRATE ?auto_16771 ) ( not ( = ?auto_16798 ?auto_16779 ) ) ( HOIST-AT ?auto_16783 ?auto_16798 ) ( SURFACE-AT ?auto_16771 ?auto_16798 ) ( ON ?auto_16771 ?auto_16796 ) ( CLEAR ?auto_16771 ) ( not ( = ?auto_16773 ?auto_16771 ) ) ( not ( = ?auto_16773 ?auto_16796 ) ) ( not ( = ?auto_16771 ?auto_16796 ) ) ( not ( = ?auto_16781 ?auto_16783 ) ) ( IS-CRATE ?auto_16773 ) ( AVAILABLE ?auto_16777 ) ( SURFACE-AT ?auto_16773 ?auto_16780 ) ( ON ?auto_16773 ?auto_16792 ) ( CLEAR ?auto_16773 ) ( not ( = ?auto_16774 ?auto_16773 ) ) ( not ( = ?auto_16774 ?auto_16792 ) ) ( not ( = ?auto_16773 ?auto_16792 ) ) ( IS-CRATE ?auto_16774 ) ( not ( = ?auto_16797 ?auto_16779 ) ) ( HOIST-AT ?auto_16789 ?auto_16797 ) ( SURFACE-AT ?auto_16774 ?auto_16797 ) ( ON ?auto_16774 ?auto_16785 ) ( CLEAR ?auto_16774 ) ( not ( = ?auto_16770 ?auto_16774 ) ) ( not ( = ?auto_16770 ?auto_16785 ) ) ( not ( = ?auto_16774 ?auto_16785 ) ) ( not ( = ?auto_16781 ?auto_16789 ) ) ( IS-CRATE ?auto_16770 ) ( not ( = ?auto_16787 ?auto_16779 ) ) ( HOIST-AT ?auto_16791 ?auto_16787 ) ( AVAILABLE ?auto_16791 ) ( SURFACE-AT ?auto_16770 ?auto_16787 ) ( ON ?auto_16770 ?auto_16794 ) ( CLEAR ?auto_16770 ) ( not ( = ?auto_16772 ?auto_16770 ) ) ( not ( = ?auto_16772 ?auto_16794 ) ) ( not ( = ?auto_16770 ?auto_16794 ) ) ( not ( = ?auto_16781 ?auto_16791 ) ) ( IS-CRATE ?auto_16772 ) ( not ( = ?auto_16795 ?auto_16779 ) ) ( HOIST-AT ?auto_16790 ?auto_16795 ) ( AVAILABLE ?auto_16790 ) ( SURFACE-AT ?auto_16772 ?auto_16795 ) ( ON ?auto_16772 ?auto_16786 ) ( CLEAR ?auto_16772 ) ( not ( = ?auto_16769 ?auto_16772 ) ) ( not ( = ?auto_16769 ?auto_16786 ) ) ( not ( = ?auto_16772 ?auto_16786 ) ) ( not ( = ?auto_16781 ?auto_16790 ) ) ( IS-CRATE ?auto_16769 ) ( not ( = ?auto_16801 ?auto_16779 ) ) ( HOIST-AT ?auto_16800 ?auto_16801 ) ( AVAILABLE ?auto_16800 ) ( SURFACE-AT ?auto_16769 ?auto_16801 ) ( ON ?auto_16769 ?auto_16788 ) ( CLEAR ?auto_16769 ) ( not ( = ?auto_16768 ?auto_16769 ) ) ( not ( = ?auto_16768 ?auto_16788 ) ) ( not ( = ?auto_16769 ?auto_16788 ) ) ( not ( = ?auto_16781 ?auto_16800 ) ) ( IS-CRATE ?auto_16768 ) ( AVAILABLE ?auto_16783 ) ( SURFACE-AT ?auto_16768 ?auto_16798 ) ( ON ?auto_16768 ?auto_16782 ) ( CLEAR ?auto_16768 ) ( not ( = ?auto_16767 ?auto_16768 ) ) ( not ( = ?auto_16767 ?auto_16782 ) ) ( not ( = ?auto_16768 ?auto_16782 ) ) ( IS-CRATE ?auto_16767 ) ( not ( = ?auto_16793 ?auto_16779 ) ) ( HOIST-AT ?auto_16799 ?auto_16793 ) ( AVAILABLE ?auto_16799 ) ( SURFACE-AT ?auto_16767 ?auto_16793 ) ( ON ?auto_16767 ?auto_16784 ) ( CLEAR ?auto_16767 ) ( not ( = ?auto_16766 ?auto_16767 ) ) ( not ( = ?auto_16766 ?auto_16784 ) ) ( not ( = ?auto_16767 ?auto_16784 ) ) ( not ( = ?auto_16781 ?auto_16799 ) ) ( SURFACE-AT ?auto_16765 ?auto_16779 ) ( CLEAR ?auto_16765 ) ( IS-CRATE ?auto_16766 ) ( AVAILABLE ?auto_16781 ) ( AVAILABLE ?auto_16789 ) ( SURFACE-AT ?auto_16766 ?auto_16797 ) ( ON ?auto_16766 ?auto_16802 ) ( CLEAR ?auto_16766 ) ( TRUCK-AT ?auto_16778 ?auto_16779 ) ( not ( = ?auto_16765 ?auto_16766 ) ) ( not ( = ?auto_16765 ?auto_16802 ) ) ( not ( = ?auto_16766 ?auto_16802 ) ) ( not ( = ?auto_16765 ?auto_16767 ) ) ( not ( = ?auto_16765 ?auto_16784 ) ) ( not ( = ?auto_16767 ?auto_16802 ) ) ( not ( = ?auto_16793 ?auto_16797 ) ) ( not ( = ?auto_16799 ?auto_16789 ) ) ( not ( = ?auto_16784 ?auto_16802 ) ) ( not ( = ?auto_16765 ?auto_16768 ) ) ( not ( = ?auto_16765 ?auto_16782 ) ) ( not ( = ?auto_16766 ?auto_16768 ) ) ( not ( = ?auto_16766 ?auto_16782 ) ) ( not ( = ?auto_16768 ?auto_16784 ) ) ( not ( = ?auto_16768 ?auto_16802 ) ) ( not ( = ?auto_16798 ?auto_16793 ) ) ( not ( = ?auto_16798 ?auto_16797 ) ) ( not ( = ?auto_16783 ?auto_16799 ) ) ( not ( = ?auto_16783 ?auto_16789 ) ) ( not ( = ?auto_16782 ?auto_16784 ) ) ( not ( = ?auto_16782 ?auto_16802 ) ) ( not ( = ?auto_16765 ?auto_16769 ) ) ( not ( = ?auto_16765 ?auto_16788 ) ) ( not ( = ?auto_16766 ?auto_16769 ) ) ( not ( = ?auto_16766 ?auto_16788 ) ) ( not ( = ?auto_16767 ?auto_16769 ) ) ( not ( = ?auto_16767 ?auto_16788 ) ) ( not ( = ?auto_16769 ?auto_16782 ) ) ( not ( = ?auto_16769 ?auto_16784 ) ) ( not ( = ?auto_16769 ?auto_16802 ) ) ( not ( = ?auto_16801 ?auto_16798 ) ) ( not ( = ?auto_16801 ?auto_16793 ) ) ( not ( = ?auto_16801 ?auto_16797 ) ) ( not ( = ?auto_16800 ?auto_16783 ) ) ( not ( = ?auto_16800 ?auto_16799 ) ) ( not ( = ?auto_16800 ?auto_16789 ) ) ( not ( = ?auto_16788 ?auto_16782 ) ) ( not ( = ?auto_16788 ?auto_16784 ) ) ( not ( = ?auto_16788 ?auto_16802 ) ) ( not ( = ?auto_16765 ?auto_16772 ) ) ( not ( = ?auto_16765 ?auto_16786 ) ) ( not ( = ?auto_16766 ?auto_16772 ) ) ( not ( = ?auto_16766 ?auto_16786 ) ) ( not ( = ?auto_16767 ?auto_16772 ) ) ( not ( = ?auto_16767 ?auto_16786 ) ) ( not ( = ?auto_16768 ?auto_16772 ) ) ( not ( = ?auto_16768 ?auto_16786 ) ) ( not ( = ?auto_16772 ?auto_16788 ) ) ( not ( = ?auto_16772 ?auto_16782 ) ) ( not ( = ?auto_16772 ?auto_16784 ) ) ( not ( = ?auto_16772 ?auto_16802 ) ) ( not ( = ?auto_16795 ?auto_16801 ) ) ( not ( = ?auto_16795 ?auto_16798 ) ) ( not ( = ?auto_16795 ?auto_16793 ) ) ( not ( = ?auto_16795 ?auto_16797 ) ) ( not ( = ?auto_16790 ?auto_16800 ) ) ( not ( = ?auto_16790 ?auto_16783 ) ) ( not ( = ?auto_16790 ?auto_16799 ) ) ( not ( = ?auto_16790 ?auto_16789 ) ) ( not ( = ?auto_16786 ?auto_16788 ) ) ( not ( = ?auto_16786 ?auto_16782 ) ) ( not ( = ?auto_16786 ?auto_16784 ) ) ( not ( = ?auto_16786 ?auto_16802 ) ) ( not ( = ?auto_16765 ?auto_16770 ) ) ( not ( = ?auto_16765 ?auto_16794 ) ) ( not ( = ?auto_16766 ?auto_16770 ) ) ( not ( = ?auto_16766 ?auto_16794 ) ) ( not ( = ?auto_16767 ?auto_16770 ) ) ( not ( = ?auto_16767 ?auto_16794 ) ) ( not ( = ?auto_16768 ?auto_16770 ) ) ( not ( = ?auto_16768 ?auto_16794 ) ) ( not ( = ?auto_16769 ?auto_16770 ) ) ( not ( = ?auto_16769 ?auto_16794 ) ) ( not ( = ?auto_16770 ?auto_16786 ) ) ( not ( = ?auto_16770 ?auto_16788 ) ) ( not ( = ?auto_16770 ?auto_16782 ) ) ( not ( = ?auto_16770 ?auto_16784 ) ) ( not ( = ?auto_16770 ?auto_16802 ) ) ( not ( = ?auto_16787 ?auto_16795 ) ) ( not ( = ?auto_16787 ?auto_16801 ) ) ( not ( = ?auto_16787 ?auto_16798 ) ) ( not ( = ?auto_16787 ?auto_16793 ) ) ( not ( = ?auto_16787 ?auto_16797 ) ) ( not ( = ?auto_16791 ?auto_16790 ) ) ( not ( = ?auto_16791 ?auto_16800 ) ) ( not ( = ?auto_16791 ?auto_16783 ) ) ( not ( = ?auto_16791 ?auto_16799 ) ) ( not ( = ?auto_16791 ?auto_16789 ) ) ( not ( = ?auto_16794 ?auto_16786 ) ) ( not ( = ?auto_16794 ?auto_16788 ) ) ( not ( = ?auto_16794 ?auto_16782 ) ) ( not ( = ?auto_16794 ?auto_16784 ) ) ( not ( = ?auto_16794 ?auto_16802 ) ) ( not ( = ?auto_16765 ?auto_16774 ) ) ( not ( = ?auto_16765 ?auto_16785 ) ) ( not ( = ?auto_16766 ?auto_16774 ) ) ( not ( = ?auto_16766 ?auto_16785 ) ) ( not ( = ?auto_16767 ?auto_16774 ) ) ( not ( = ?auto_16767 ?auto_16785 ) ) ( not ( = ?auto_16768 ?auto_16774 ) ) ( not ( = ?auto_16768 ?auto_16785 ) ) ( not ( = ?auto_16769 ?auto_16774 ) ) ( not ( = ?auto_16769 ?auto_16785 ) ) ( not ( = ?auto_16772 ?auto_16774 ) ) ( not ( = ?auto_16772 ?auto_16785 ) ) ( not ( = ?auto_16774 ?auto_16794 ) ) ( not ( = ?auto_16774 ?auto_16786 ) ) ( not ( = ?auto_16774 ?auto_16788 ) ) ( not ( = ?auto_16774 ?auto_16782 ) ) ( not ( = ?auto_16774 ?auto_16784 ) ) ( not ( = ?auto_16774 ?auto_16802 ) ) ( not ( = ?auto_16785 ?auto_16794 ) ) ( not ( = ?auto_16785 ?auto_16786 ) ) ( not ( = ?auto_16785 ?auto_16788 ) ) ( not ( = ?auto_16785 ?auto_16782 ) ) ( not ( = ?auto_16785 ?auto_16784 ) ) ( not ( = ?auto_16785 ?auto_16802 ) ) ( not ( = ?auto_16765 ?auto_16773 ) ) ( not ( = ?auto_16765 ?auto_16792 ) ) ( not ( = ?auto_16766 ?auto_16773 ) ) ( not ( = ?auto_16766 ?auto_16792 ) ) ( not ( = ?auto_16767 ?auto_16773 ) ) ( not ( = ?auto_16767 ?auto_16792 ) ) ( not ( = ?auto_16768 ?auto_16773 ) ) ( not ( = ?auto_16768 ?auto_16792 ) ) ( not ( = ?auto_16769 ?auto_16773 ) ) ( not ( = ?auto_16769 ?auto_16792 ) ) ( not ( = ?auto_16772 ?auto_16773 ) ) ( not ( = ?auto_16772 ?auto_16792 ) ) ( not ( = ?auto_16770 ?auto_16773 ) ) ( not ( = ?auto_16770 ?auto_16792 ) ) ( not ( = ?auto_16773 ?auto_16785 ) ) ( not ( = ?auto_16773 ?auto_16794 ) ) ( not ( = ?auto_16773 ?auto_16786 ) ) ( not ( = ?auto_16773 ?auto_16788 ) ) ( not ( = ?auto_16773 ?auto_16782 ) ) ( not ( = ?auto_16773 ?auto_16784 ) ) ( not ( = ?auto_16773 ?auto_16802 ) ) ( not ( = ?auto_16780 ?auto_16797 ) ) ( not ( = ?auto_16780 ?auto_16787 ) ) ( not ( = ?auto_16780 ?auto_16795 ) ) ( not ( = ?auto_16780 ?auto_16801 ) ) ( not ( = ?auto_16780 ?auto_16798 ) ) ( not ( = ?auto_16780 ?auto_16793 ) ) ( not ( = ?auto_16777 ?auto_16789 ) ) ( not ( = ?auto_16777 ?auto_16791 ) ) ( not ( = ?auto_16777 ?auto_16790 ) ) ( not ( = ?auto_16777 ?auto_16800 ) ) ( not ( = ?auto_16777 ?auto_16783 ) ) ( not ( = ?auto_16777 ?auto_16799 ) ) ( not ( = ?auto_16792 ?auto_16785 ) ) ( not ( = ?auto_16792 ?auto_16794 ) ) ( not ( = ?auto_16792 ?auto_16786 ) ) ( not ( = ?auto_16792 ?auto_16788 ) ) ( not ( = ?auto_16792 ?auto_16782 ) ) ( not ( = ?auto_16792 ?auto_16784 ) ) ( not ( = ?auto_16792 ?auto_16802 ) ) ( not ( = ?auto_16765 ?auto_16771 ) ) ( not ( = ?auto_16765 ?auto_16796 ) ) ( not ( = ?auto_16766 ?auto_16771 ) ) ( not ( = ?auto_16766 ?auto_16796 ) ) ( not ( = ?auto_16767 ?auto_16771 ) ) ( not ( = ?auto_16767 ?auto_16796 ) ) ( not ( = ?auto_16768 ?auto_16771 ) ) ( not ( = ?auto_16768 ?auto_16796 ) ) ( not ( = ?auto_16769 ?auto_16771 ) ) ( not ( = ?auto_16769 ?auto_16796 ) ) ( not ( = ?auto_16772 ?auto_16771 ) ) ( not ( = ?auto_16772 ?auto_16796 ) ) ( not ( = ?auto_16770 ?auto_16771 ) ) ( not ( = ?auto_16770 ?auto_16796 ) ) ( not ( = ?auto_16774 ?auto_16771 ) ) ( not ( = ?auto_16774 ?auto_16796 ) ) ( not ( = ?auto_16771 ?auto_16792 ) ) ( not ( = ?auto_16771 ?auto_16785 ) ) ( not ( = ?auto_16771 ?auto_16794 ) ) ( not ( = ?auto_16771 ?auto_16786 ) ) ( not ( = ?auto_16771 ?auto_16788 ) ) ( not ( = ?auto_16771 ?auto_16782 ) ) ( not ( = ?auto_16771 ?auto_16784 ) ) ( not ( = ?auto_16771 ?auto_16802 ) ) ( not ( = ?auto_16796 ?auto_16792 ) ) ( not ( = ?auto_16796 ?auto_16785 ) ) ( not ( = ?auto_16796 ?auto_16794 ) ) ( not ( = ?auto_16796 ?auto_16786 ) ) ( not ( = ?auto_16796 ?auto_16788 ) ) ( not ( = ?auto_16796 ?auto_16782 ) ) ( not ( = ?auto_16796 ?auto_16784 ) ) ( not ( = ?auto_16796 ?auto_16802 ) ) ( not ( = ?auto_16765 ?auto_16775 ) ) ( not ( = ?auto_16765 ?auto_16776 ) ) ( not ( = ?auto_16766 ?auto_16775 ) ) ( not ( = ?auto_16766 ?auto_16776 ) ) ( not ( = ?auto_16767 ?auto_16775 ) ) ( not ( = ?auto_16767 ?auto_16776 ) ) ( not ( = ?auto_16768 ?auto_16775 ) ) ( not ( = ?auto_16768 ?auto_16776 ) ) ( not ( = ?auto_16769 ?auto_16775 ) ) ( not ( = ?auto_16769 ?auto_16776 ) ) ( not ( = ?auto_16772 ?auto_16775 ) ) ( not ( = ?auto_16772 ?auto_16776 ) ) ( not ( = ?auto_16770 ?auto_16775 ) ) ( not ( = ?auto_16770 ?auto_16776 ) ) ( not ( = ?auto_16774 ?auto_16775 ) ) ( not ( = ?auto_16774 ?auto_16776 ) ) ( not ( = ?auto_16773 ?auto_16775 ) ) ( not ( = ?auto_16773 ?auto_16776 ) ) ( not ( = ?auto_16775 ?auto_16796 ) ) ( not ( = ?auto_16775 ?auto_16792 ) ) ( not ( = ?auto_16775 ?auto_16785 ) ) ( not ( = ?auto_16775 ?auto_16794 ) ) ( not ( = ?auto_16775 ?auto_16786 ) ) ( not ( = ?auto_16775 ?auto_16788 ) ) ( not ( = ?auto_16775 ?auto_16782 ) ) ( not ( = ?auto_16775 ?auto_16784 ) ) ( not ( = ?auto_16775 ?auto_16802 ) ) ( not ( = ?auto_16776 ?auto_16796 ) ) ( not ( = ?auto_16776 ?auto_16792 ) ) ( not ( = ?auto_16776 ?auto_16785 ) ) ( not ( = ?auto_16776 ?auto_16794 ) ) ( not ( = ?auto_16776 ?auto_16786 ) ) ( not ( = ?auto_16776 ?auto_16788 ) ) ( not ( = ?auto_16776 ?auto_16782 ) ) ( not ( = ?auto_16776 ?auto_16784 ) ) ( not ( = ?auto_16776 ?auto_16802 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16765 ?auto_16766 ?auto_16767 ?auto_16768 ?auto_16769 ?auto_16772 ?auto_16770 ?auto_16774 ?auto_16773 ?auto_16771 )
      ( MAKE-1CRATE ?auto_16771 ?auto_16775 )
      ( MAKE-10CRATE-VERIFY ?auto_16765 ?auto_16766 ?auto_16767 ?auto_16768 ?auto_16769 ?auto_16772 ?auto_16770 ?auto_16774 ?auto_16773 ?auto_16771 ?auto_16775 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16805 - SURFACE
      ?auto_16806 - SURFACE
    )
    :vars
    (
      ?auto_16807 - HOIST
      ?auto_16808 - PLACE
      ?auto_16810 - PLACE
      ?auto_16811 - HOIST
      ?auto_16812 - SURFACE
      ?auto_16809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16807 ?auto_16808 ) ( SURFACE-AT ?auto_16805 ?auto_16808 ) ( CLEAR ?auto_16805 ) ( IS-CRATE ?auto_16806 ) ( AVAILABLE ?auto_16807 ) ( not ( = ?auto_16810 ?auto_16808 ) ) ( HOIST-AT ?auto_16811 ?auto_16810 ) ( AVAILABLE ?auto_16811 ) ( SURFACE-AT ?auto_16806 ?auto_16810 ) ( ON ?auto_16806 ?auto_16812 ) ( CLEAR ?auto_16806 ) ( TRUCK-AT ?auto_16809 ?auto_16808 ) ( not ( = ?auto_16805 ?auto_16806 ) ) ( not ( = ?auto_16805 ?auto_16812 ) ) ( not ( = ?auto_16806 ?auto_16812 ) ) ( not ( = ?auto_16807 ?auto_16811 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16809 ?auto_16808 ?auto_16810 )
      ( !LIFT ?auto_16811 ?auto_16806 ?auto_16812 ?auto_16810 )
      ( !LOAD ?auto_16811 ?auto_16806 ?auto_16809 ?auto_16810 )
      ( !DRIVE ?auto_16809 ?auto_16810 ?auto_16808 )
      ( !UNLOAD ?auto_16807 ?auto_16806 ?auto_16809 ?auto_16808 )
      ( !DROP ?auto_16807 ?auto_16806 ?auto_16805 ?auto_16808 )
      ( MAKE-1CRATE-VERIFY ?auto_16805 ?auto_16806 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_16825 - SURFACE
      ?auto_16826 - SURFACE
      ?auto_16827 - SURFACE
      ?auto_16828 - SURFACE
      ?auto_16829 - SURFACE
      ?auto_16832 - SURFACE
      ?auto_16830 - SURFACE
      ?auto_16834 - SURFACE
      ?auto_16833 - SURFACE
      ?auto_16831 - SURFACE
      ?auto_16836 - SURFACE
      ?auto_16835 - SURFACE
    )
    :vars
    (
      ?auto_16838 - HOIST
      ?auto_16842 - PLACE
      ?auto_16837 - PLACE
      ?auto_16841 - HOIST
      ?auto_16839 - SURFACE
      ?auto_16847 - PLACE
      ?auto_16856 - HOIST
      ?auto_16851 - SURFACE
      ?auto_16846 - PLACE
      ?auto_16848 - HOIST
      ?auto_16843 - SURFACE
      ?auto_16866 - SURFACE
      ?auto_16849 - PLACE
      ?auto_16858 - HOIST
      ?auto_16844 - SURFACE
      ?auto_16861 - PLACE
      ?auto_16864 - HOIST
      ?auto_16855 - SURFACE
      ?auto_16865 - PLACE
      ?auto_16860 - HOIST
      ?auto_16862 - SURFACE
      ?auto_16859 - PLACE
      ?auto_16854 - HOIST
      ?auto_16850 - SURFACE
      ?auto_16845 - SURFACE
      ?auto_16853 - PLACE
      ?auto_16863 - HOIST
      ?auto_16852 - SURFACE
      ?auto_16857 - SURFACE
      ?auto_16840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16838 ?auto_16842 ) ( IS-CRATE ?auto_16835 ) ( not ( = ?auto_16837 ?auto_16842 ) ) ( HOIST-AT ?auto_16841 ?auto_16837 ) ( AVAILABLE ?auto_16841 ) ( SURFACE-AT ?auto_16835 ?auto_16837 ) ( ON ?auto_16835 ?auto_16839 ) ( CLEAR ?auto_16835 ) ( not ( = ?auto_16836 ?auto_16835 ) ) ( not ( = ?auto_16836 ?auto_16839 ) ) ( not ( = ?auto_16835 ?auto_16839 ) ) ( not ( = ?auto_16838 ?auto_16841 ) ) ( IS-CRATE ?auto_16836 ) ( not ( = ?auto_16847 ?auto_16842 ) ) ( HOIST-AT ?auto_16856 ?auto_16847 ) ( SURFACE-AT ?auto_16836 ?auto_16847 ) ( ON ?auto_16836 ?auto_16851 ) ( CLEAR ?auto_16836 ) ( not ( = ?auto_16831 ?auto_16836 ) ) ( not ( = ?auto_16831 ?auto_16851 ) ) ( not ( = ?auto_16836 ?auto_16851 ) ) ( not ( = ?auto_16838 ?auto_16856 ) ) ( IS-CRATE ?auto_16831 ) ( not ( = ?auto_16846 ?auto_16842 ) ) ( HOIST-AT ?auto_16848 ?auto_16846 ) ( SURFACE-AT ?auto_16831 ?auto_16846 ) ( ON ?auto_16831 ?auto_16843 ) ( CLEAR ?auto_16831 ) ( not ( = ?auto_16833 ?auto_16831 ) ) ( not ( = ?auto_16833 ?auto_16843 ) ) ( not ( = ?auto_16831 ?auto_16843 ) ) ( not ( = ?auto_16838 ?auto_16848 ) ) ( IS-CRATE ?auto_16833 ) ( AVAILABLE ?auto_16856 ) ( SURFACE-AT ?auto_16833 ?auto_16847 ) ( ON ?auto_16833 ?auto_16866 ) ( CLEAR ?auto_16833 ) ( not ( = ?auto_16834 ?auto_16833 ) ) ( not ( = ?auto_16834 ?auto_16866 ) ) ( not ( = ?auto_16833 ?auto_16866 ) ) ( IS-CRATE ?auto_16834 ) ( not ( = ?auto_16849 ?auto_16842 ) ) ( HOIST-AT ?auto_16858 ?auto_16849 ) ( SURFACE-AT ?auto_16834 ?auto_16849 ) ( ON ?auto_16834 ?auto_16844 ) ( CLEAR ?auto_16834 ) ( not ( = ?auto_16830 ?auto_16834 ) ) ( not ( = ?auto_16830 ?auto_16844 ) ) ( not ( = ?auto_16834 ?auto_16844 ) ) ( not ( = ?auto_16838 ?auto_16858 ) ) ( IS-CRATE ?auto_16830 ) ( not ( = ?auto_16861 ?auto_16842 ) ) ( HOIST-AT ?auto_16864 ?auto_16861 ) ( AVAILABLE ?auto_16864 ) ( SURFACE-AT ?auto_16830 ?auto_16861 ) ( ON ?auto_16830 ?auto_16855 ) ( CLEAR ?auto_16830 ) ( not ( = ?auto_16832 ?auto_16830 ) ) ( not ( = ?auto_16832 ?auto_16855 ) ) ( not ( = ?auto_16830 ?auto_16855 ) ) ( not ( = ?auto_16838 ?auto_16864 ) ) ( IS-CRATE ?auto_16832 ) ( not ( = ?auto_16865 ?auto_16842 ) ) ( HOIST-AT ?auto_16860 ?auto_16865 ) ( AVAILABLE ?auto_16860 ) ( SURFACE-AT ?auto_16832 ?auto_16865 ) ( ON ?auto_16832 ?auto_16862 ) ( CLEAR ?auto_16832 ) ( not ( = ?auto_16829 ?auto_16832 ) ) ( not ( = ?auto_16829 ?auto_16862 ) ) ( not ( = ?auto_16832 ?auto_16862 ) ) ( not ( = ?auto_16838 ?auto_16860 ) ) ( IS-CRATE ?auto_16829 ) ( not ( = ?auto_16859 ?auto_16842 ) ) ( HOIST-AT ?auto_16854 ?auto_16859 ) ( AVAILABLE ?auto_16854 ) ( SURFACE-AT ?auto_16829 ?auto_16859 ) ( ON ?auto_16829 ?auto_16850 ) ( CLEAR ?auto_16829 ) ( not ( = ?auto_16828 ?auto_16829 ) ) ( not ( = ?auto_16828 ?auto_16850 ) ) ( not ( = ?auto_16829 ?auto_16850 ) ) ( not ( = ?auto_16838 ?auto_16854 ) ) ( IS-CRATE ?auto_16828 ) ( AVAILABLE ?auto_16848 ) ( SURFACE-AT ?auto_16828 ?auto_16846 ) ( ON ?auto_16828 ?auto_16845 ) ( CLEAR ?auto_16828 ) ( not ( = ?auto_16827 ?auto_16828 ) ) ( not ( = ?auto_16827 ?auto_16845 ) ) ( not ( = ?auto_16828 ?auto_16845 ) ) ( IS-CRATE ?auto_16827 ) ( not ( = ?auto_16853 ?auto_16842 ) ) ( HOIST-AT ?auto_16863 ?auto_16853 ) ( AVAILABLE ?auto_16863 ) ( SURFACE-AT ?auto_16827 ?auto_16853 ) ( ON ?auto_16827 ?auto_16852 ) ( CLEAR ?auto_16827 ) ( not ( = ?auto_16826 ?auto_16827 ) ) ( not ( = ?auto_16826 ?auto_16852 ) ) ( not ( = ?auto_16827 ?auto_16852 ) ) ( not ( = ?auto_16838 ?auto_16863 ) ) ( SURFACE-AT ?auto_16825 ?auto_16842 ) ( CLEAR ?auto_16825 ) ( IS-CRATE ?auto_16826 ) ( AVAILABLE ?auto_16838 ) ( AVAILABLE ?auto_16858 ) ( SURFACE-AT ?auto_16826 ?auto_16849 ) ( ON ?auto_16826 ?auto_16857 ) ( CLEAR ?auto_16826 ) ( TRUCK-AT ?auto_16840 ?auto_16842 ) ( not ( = ?auto_16825 ?auto_16826 ) ) ( not ( = ?auto_16825 ?auto_16857 ) ) ( not ( = ?auto_16826 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16827 ) ) ( not ( = ?auto_16825 ?auto_16852 ) ) ( not ( = ?auto_16827 ?auto_16857 ) ) ( not ( = ?auto_16853 ?auto_16849 ) ) ( not ( = ?auto_16863 ?auto_16858 ) ) ( not ( = ?auto_16852 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16828 ) ) ( not ( = ?auto_16825 ?auto_16845 ) ) ( not ( = ?auto_16826 ?auto_16828 ) ) ( not ( = ?auto_16826 ?auto_16845 ) ) ( not ( = ?auto_16828 ?auto_16852 ) ) ( not ( = ?auto_16828 ?auto_16857 ) ) ( not ( = ?auto_16846 ?auto_16853 ) ) ( not ( = ?auto_16846 ?auto_16849 ) ) ( not ( = ?auto_16848 ?auto_16863 ) ) ( not ( = ?auto_16848 ?auto_16858 ) ) ( not ( = ?auto_16845 ?auto_16852 ) ) ( not ( = ?auto_16845 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16829 ) ) ( not ( = ?auto_16825 ?auto_16850 ) ) ( not ( = ?auto_16826 ?auto_16829 ) ) ( not ( = ?auto_16826 ?auto_16850 ) ) ( not ( = ?auto_16827 ?auto_16829 ) ) ( not ( = ?auto_16827 ?auto_16850 ) ) ( not ( = ?auto_16829 ?auto_16845 ) ) ( not ( = ?auto_16829 ?auto_16852 ) ) ( not ( = ?auto_16829 ?auto_16857 ) ) ( not ( = ?auto_16859 ?auto_16846 ) ) ( not ( = ?auto_16859 ?auto_16853 ) ) ( not ( = ?auto_16859 ?auto_16849 ) ) ( not ( = ?auto_16854 ?auto_16848 ) ) ( not ( = ?auto_16854 ?auto_16863 ) ) ( not ( = ?auto_16854 ?auto_16858 ) ) ( not ( = ?auto_16850 ?auto_16845 ) ) ( not ( = ?auto_16850 ?auto_16852 ) ) ( not ( = ?auto_16850 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16832 ) ) ( not ( = ?auto_16825 ?auto_16862 ) ) ( not ( = ?auto_16826 ?auto_16832 ) ) ( not ( = ?auto_16826 ?auto_16862 ) ) ( not ( = ?auto_16827 ?auto_16832 ) ) ( not ( = ?auto_16827 ?auto_16862 ) ) ( not ( = ?auto_16828 ?auto_16832 ) ) ( not ( = ?auto_16828 ?auto_16862 ) ) ( not ( = ?auto_16832 ?auto_16850 ) ) ( not ( = ?auto_16832 ?auto_16845 ) ) ( not ( = ?auto_16832 ?auto_16852 ) ) ( not ( = ?auto_16832 ?auto_16857 ) ) ( not ( = ?auto_16865 ?auto_16859 ) ) ( not ( = ?auto_16865 ?auto_16846 ) ) ( not ( = ?auto_16865 ?auto_16853 ) ) ( not ( = ?auto_16865 ?auto_16849 ) ) ( not ( = ?auto_16860 ?auto_16854 ) ) ( not ( = ?auto_16860 ?auto_16848 ) ) ( not ( = ?auto_16860 ?auto_16863 ) ) ( not ( = ?auto_16860 ?auto_16858 ) ) ( not ( = ?auto_16862 ?auto_16850 ) ) ( not ( = ?auto_16862 ?auto_16845 ) ) ( not ( = ?auto_16862 ?auto_16852 ) ) ( not ( = ?auto_16862 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16830 ) ) ( not ( = ?auto_16825 ?auto_16855 ) ) ( not ( = ?auto_16826 ?auto_16830 ) ) ( not ( = ?auto_16826 ?auto_16855 ) ) ( not ( = ?auto_16827 ?auto_16830 ) ) ( not ( = ?auto_16827 ?auto_16855 ) ) ( not ( = ?auto_16828 ?auto_16830 ) ) ( not ( = ?auto_16828 ?auto_16855 ) ) ( not ( = ?auto_16829 ?auto_16830 ) ) ( not ( = ?auto_16829 ?auto_16855 ) ) ( not ( = ?auto_16830 ?auto_16862 ) ) ( not ( = ?auto_16830 ?auto_16850 ) ) ( not ( = ?auto_16830 ?auto_16845 ) ) ( not ( = ?auto_16830 ?auto_16852 ) ) ( not ( = ?auto_16830 ?auto_16857 ) ) ( not ( = ?auto_16861 ?auto_16865 ) ) ( not ( = ?auto_16861 ?auto_16859 ) ) ( not ( = ?auto_16861 ?auto_16846 ) ) ( not ( = ?auto_16861 ?auto_16853 ) ) ( not ( = ?auto_16861 ?auto_16849 ) ) ( not ( = ?auto_16864 ?auto_16860 ) ) ( not ( = ?auto_16864 ?auto_16854 ) ) ( not ( = ?auto_16864 ?auto_16848 ) ) ( not ( = ?auto_16864 ?auto_16863 ) ) ( not ( = ?auto_16864 ?auto_16858 ) ) ( not ( = ?auto_16855 ?auto_16862 ) ) ( not ( = ?auto_16855 ?auto_16850 ) ) ( not ( = ?auto_16855 ?auto_16845 ) ) ( not ( = ?auto_16855 ?auto_16852 ) ) ( not ( = ?auto_16855 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16834 ) ) ( not ( = ?auto_16825 ?auto_16844 ) ) ( not ( = ?auto_16826 ?auto_16834 ) ) ( not ( = ?auto_16826 ?auto_16844 ) ) ( not ( = ?auto_16827 ?auto_16834 ) ) ( not ( = ?auto_16827 ?auto_16844 ) ) ( not ( = ?auto_16828 ?auto_16834 ) ) ( not ( = ?auto_16828 ?auto_16844 ) ) ( not ( = ?auto_16829 ?auto_16834 ) ) ( not ( = ?auto_16829 ?auto_16844 ) ) ( not ( = ?auto_16832 ?auto_16834 ) ) ( not ( = ?auto_16832 ?auto_16844 ) ) ( not ( = ?auto_16834 ?auto_16855 ) ) ( not ( = ?auto_16834 ?auto_16862 ) ) ( not ( = ?auto_16834 ?auto_16850 ) ) ( not ( = ?auto_16834 ?auto_16845 ) ) ( not ( = ?auto_16834 ?auto_16852 ) ) ( not ( = ?auto_16834 ?auto_16857 ) ) ( not ( = ?auto_16844 ?auto_16855 ) ) ( not ( = ?auto_16844 ?auto_16862 ) ) ( not ( = ?auto_16844 ?auto_16850 ) ) ( not ( = ?auto_16844 ?auto_16845 ) ) ( not ( = ?auto_16844 ?auto_16852 ) ) ( not ( = ?auto_16844 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16833 ) ) ( not ( = ?auto_16825 ?auto_16866 ) ) ( not ( = ?auto_16826 ?auto_16833 ) ) ( not ( = ?auto_16826 ?auto_16866 ) ) ( not ( = ?auto_16827 ?auto_16833 ) ) ( not ( = ?auto_16827 ?auto_16866 ) ) ( not ( = ?auto_16828 ?auto_16833 ) ) ( not ( = ?auto_16828 ?auto_16866 ) ) ( not ( = ?auto_16829 ?auto_16833 ) ) ( not ( = ?auto_16829 ?auto_16866 ) ) ( not ( = ?auto_16832 ?auto_16833 ) ) ( not ( = ?auto_16832 ?auto_16866 ) ) ( not ( = ?auto_16830 ?auto_16833 ) ) ( not ( = ?auto_16830 ?auto_16866 ) ) ( not ( = ?auto_16833 ?auto_16844 ) ) ( not ( = ?auto_16833 ?auto_16855 ) ) ( not ( = ?auto_16833 ?auto_16862 ) ) ( not ( = ?auto_16833 ?auto_16850 ) ) ( not ( = ?auto_16833 ?auto_16845 ) ) ( not ( = ?auto_16833 ?auto_16852 ) ) ( not ( = ?auto_16833 ?auto_16857 ) ) ( not ( = ?auto_16847 ?auto_16849 ) ) ( not ( = ?auto_16847 ?auto_16861 ) ) ( not ( = ?auto_16847 ?auto_16865 ) ) ( not ( = ?auto_16847 ?auto_16859 ) ) ( not ( = ?auto_16847 ?auto_16846 ) ) ( not ( = ?auto_16847 ?auto_16853 ) ) ( not ( = ?auto_16856 ?auto_16858 ) ) ( not ( = ?auto_16856 ?auto_16864 ) ) ( not ( = ?auto_16856 ?auto_16860 ) ) ( not ( = ?auto_16856 ?auto_16854 ) ) ( not ( = ?auto_16856 ?auto_16848 ) ) ( not ( = ?auto_16856 ?auto_16863 ) ) ( not ( = ?auto_16866 ?auto_16844 ) ) ( not ( = ?auto_16866 ?auto_16855 ) ) ( not ( = ?auto_16866 ?auto_16862 ) ) ( not ( = ?auto_16866 ?auto_16850 ) ) ( not ( = ?auto_16866 ?auto_16845 ) ) ( not ( = ?auto_16866 ?auto_16852 ) ) ( not ( = ?auto_16866 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16831 ) ) ( not ( = ?auto_16825 ?auto_16843 ) ) ( not ( = ?auto_16826 ?auto_16831 ) ) ( not ( = ?auto_16826 ?auto_16843 ) ) ( not ( = ?auto_16827 ?auto_16831 ) ) ( not ( = ?auto_16827 ?auto_16843 ) ) ( not ( = ?auto_16828 ?auto_16831 ) ) ( not ( = ?auto_16828 ?auto_16843 ) ) ( not ( = ?auto_16829 ?auto_16831 ) ) ( not ( = ?auto_16829 ?auto_16843 ) ) ( not ( = ?auto_16832 ?auto_16831 ) ) ( not ( = ?auto_16832 ?auto_16843 ) ) ( not ( = ?auto_16830 ?auto_16831 ) ) ( not ( = ?auto_16830 ?auto_16843 ) ) ( not ( = ?auto_16834 ?auto_16831 ) ) ( not ( = ?auto_16834 ?auto_16843 ) ) ( not ( = ?auto_16831 ?auto_16866 ) ) ( not ( = ?auto_16831 ?auto_16844 ) ) ( not ( = ?auto_16831 ?auto_16855 ) ) ( not ( = ?auto_16831 ?auto_16862 ) ) ( not ( = ?auto_16831 ?auto_16850 ) ) ( not ( = ?auto_16831 ?auto_16845 ) ) ( not ( = ?auto_16831 ?auto_16852 ) ) ( not ( = ?auto_16831 ?auto_16857 ) ) ( not ( = ?auto_16843 ?auto_16866 ) ) ( not ( = ?auto_16843 ?auto_16844 ) ) ( not ( = ?auto_16843 ?auto_16855 ) ) ( not ( = ?auto_16843 ?auto_16862 ) ) ( not ( = ?auto_16843 ?auto_16850 ) ) ( not ( = ?auto_16843 ?auto_16845 ) ) ( not ( = ?auto_16843 ?auto_16852 ) ) ( not ( = ?auto_16843 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16836 ) ) ( not ( = ?auto_16825 ?auto_16851 ) ) ( not ( = ?auto_16826 ?auto_16836 ) ) ( not ( = ?auto_16826 ?auto_16851 ) ) ( not ( = ?auto_16827 ?auto_16836 ) ) ( not ( = ?auto_16827 ?auto_16851 ) ) ( not ( = ?auto_16828 ?auto_16836 ) ) ( not ( = ?auto_16828 ?auto_16851 ) ) ( not ( = ?auto_16829 ?auto_16836 ) ) ( not ( = ?auto_16829 ?auto_16851 ) ) ( not ( = ?auto_16832 ?auto_16836 ) ) ( not ( = ?auto_16832 ?auto_16851 ) ) ( not ( = ?auto_16830 ?auto_16836 ) ) ( not ( = ?auto_16830 ?auto_16851 ) ) ( not ( = ?auto_16834 ?auto_16836 ) ) ( not ( = ?auto_16834 ?auto_16851 ) ) ( not ( = ?auto_16833 ?auto_16836 ) ) ( not ( = ?auto_16833 ?auto_16851 ) ) ( not ( = ?auto_16836 ?auto_16843 ) ) ( not ( = ?auto_16836 ?auto_16866 ) ) ( not ( = ?auto_16836 ?auto_16844 ) ) ( not ( = ?auto_16836 ?auto_16855 ) ) ( not ( = ?auto_16836 ?auto_16862 ) ) ( not ( = ?auto_16836 ?auto_16850 ) ) ( not ( = ?auto_16836 ?auto_16845 ) ) ( not ( = ?auto_16836 ?auto_16852 ) ) ( not ( = ?auto_16836 ?auto_16857 ) ) ( not ( = ?auto_16851 ?auto_16843 ) ) ( not ( = ?auto_16851 ?auto_16866 ) ) ( not ( = ?auto_16851 ?auto_16844 ) ) ( not ( = ?auto_16851 ?auto_16855 ) ) ( not ( = ?auto_16851 ?auto_16862 ) ) ( not ( = ?auto_16851 ?auto_16850 ) ) ( not ( = ?auto_16851 ?auto_16845 ) ) ( not ( = ?auto_16851 ?auto_16852 ) ) ( not ( = ?auto_16851 ?auto_16857 ) ) ( not ( = ?auto_16825 ?auto_16835 ) ) ( not ( = ?auto_16825 ?auto_16839 ) ) ( not ( = ?auto_16826 ?auto_16835 ) ) ( not ( = ?auto_16826 ?auto_16839 ) ) ( not ( = ?auto_16827 ?auto_16835 ) ) ( not ( = ?auto_16827 ?auto_16839 ) ) ( not ( = ?auto_16828 ?auto_16835 ) ) ( not ( = ?auto_16828 ?auto_16839 ) ) ( not ( = ?auto_16829 ?auto_16835 ) ) ( not ( = ?auto_16829 ?auto_16839 ) ) ( not ( = ?auto_16832 ?auto_16835 ) ) ( not ( = ?auto_16832 ?auto_16839 ) ) ( not ( = ?auto_16830 ?auto_16835 ) ) ( not ( = ?auto_16830 ?auto_16839 ) ) ( not ( = ?auto_16834 ?auto_16835 ) ) ( not ( = ?auto_16834 ?auto_16839 ) ) ( not ( = ?auto_16833 ?auto_16835 ) ) ( not ( = ?auto_16833 ?auto_16839 ) ) ( not ( = ?auto_16831 ?auto_16835 ) ) ( not ( = ?auto_16831 ?auto_16839 ) ) ( not ( = ?auto_16835 ?auto_16851 ) ) ( not ( = ?auto_16835 ?auto_16843 ) ) ( not ( = ?auto_16835 ?auto_16866 ) ) ( not ( = ?auto_16835 ?auto_16844 ) ) ( not ( = ?auto_16835 ?auto_16855 ) ) ( not ( = ?auto_16835 ?auto_16862 ) ) ( not ( = ?auto_16835 ?auto_16850 ) ) ( not ( = ?auto_16835 ?auto_16845 ) ) ( not ( = ?auto_16835 ?auto_16852 ) ) ( not ( = ?auto_16835 ?auto_16857 ) ) ( not ( = ?auto_16837 ?auto_16847 ) ) ( not ( = ?auto_16837 ?auto_16846 ) ) ( not ( = ?auto_16837 ?auto_16849 ) ) ( not ( = ?auto_16837 ?auto_16861 ) ) ( not ( = ?auto_16837 ?auto_16865 ) ) ( not ( = ?auto_16837 ?auto_16859 ) ) ( not ( = ?auto_16837 ?auto_16853 ) ) ( not ( = ?auto_16841 ?auto_16856 ) ) ( not ( = ?auto_16841 ?auto_16848 ) ) ( not ( = ?auto_16841 ?auto_16858 ) ) ( not ( = ?auto_16841 ?auto_16864 ) ) ( not ( = ?auto_16841 ?auto_16860 ) ) ( not ( = ?auto_16841 ?auto_16854 ) ) ( not ( = ?auto_16841 ?auto_16863 ) ) ( not ( = ?auto_16839 ?auto_16851 ) ) ( not ( = ?auto_16839 ?auto_16843 ) ) ( not ( = ?auto_16839 ?auto_16866 ) ) ( not ( = ?auto_16839 ?auto_16844 ) ) ( not ( = ?auto_16839 ?auto_16855 ) ) ( not ( = ?auto_16839 ?auto_16862 ) ) ( not ( = ?auto_16839 ?auto_16850 ) ) ( not ( = ?auto_16839 ?auto_16845 ) ) ( not ( = ?auto_16839 ?auto_16852 ) ) ( not ( = ?auto_16839 ?auto_16857 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16825 ?auto_16826 ?auto_16827 ?auto_16828 ?auto_16829 ?auto_16832 ?auto_16830 ?auto_16834 ?auto_16833 ?auto_16831 ?auto_16836 )
      ( MAKE-1CRATE ?auto_16836 ?auto_16835 )
      ( MAKE-11CRATE-VERIFY ?auto_16825 ?auto_16826 ?auto_16827 ?auto_16828 ?auto_16829 ?auto_16832 ?auto_16830 ?auto_16834 ?auto_16833 ?auto_16831 ?auto_16836 ?auto_16835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16869 - SURFACE
      ?auto_16870 - SURFACE
    )
    :vars
    (
      ?auto_16871 - HOIST
      ?auto_16872 - PLACE
      ?auto_16874 - PLACE
      ?auto_16875 - HOIST
      ?auto_16876 - SURFACE
      ?auto_16873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16871 ?auto_16872 ) ( SURFACE-AT ?auto_16869 ?auto_16872 ) ( CLEAR ?auto_16869 ) ( IS-CRATE ?auto_16870 ) ( AVAILABLE ?auto_16871 ) ( not ( = ?auto_16874 ?auto_16872 ) ) ( HOIST-AT ?auto_16875 ?auto_16874 ) ( AVAILABLE ?auto_16875 ) ( SURFACE-AT ?auto_16870 ?auto_16874 ) ( ON ?auto_16870 ?auto_16876 ) ( CLEAR ?auto_16870 ) ( TRUCK-AT ?auto_16873 ?auto_16872 ) ( not ( = ?auto_16869 ?auto_16870 ) ) ( not ( = ?auto_16869 ?auto_16876 ) ) ( not ( = ?auto_16870 ?auto_16876 ) ) ( not ( = ?auto_16871 ?auto_16875 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16873 ?auto_16872 ?auto_16874 )
      ( !LIFT ?auto_16875 ?auto_16870 ?auto_16876 ?auto_16874 )
      ( !LOAD ?auto_16875 ?auto_16870 ?auto_16873 ?auto_16874 )
      ( !DRIVE ?auto_16873 ?auto_16874 ?auto_16872 )
      ( !UNLOAD ?auto_16871 ?auto_16870 ?auto_16873 ?auto_16872 )
      ( !DROP ?auto_16871 ?auto_16870 ?auto_16869 ?auto_16872 )
      ( MAKE-1CRATE-VERIFY ?auto_16869 ?auto_16870 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_16890 - SURFACE
      ?auto_16891 - SURFACE
      ?auto_16892 - SURFACE
      ?auto_16893 - SURFACE
      ?auto_16894 - SURFACE
      ?auto_16897 - SURFACE
      ?auto_16895 - SURFACE
      ?auto_16899 - SURFACE
      ?auto_16898 - SURFACE
      ?auto_16896 - SURFACE
      ?auto_16901 - SURFACE
      ?auto_16900 - SURFACE
      ?auto_16902 - SURFACE
    )
    :vars
    (
      ?auto_16904 - HOIST
      ?auto_16905 - PLACE
      ?auto_16903 - PLACE
      ?auto_16907 - HOIST
      ?auto_16906 - SURFACE
      ?auto_16913 - PLACE
      ?auto_16920 - HOIST
      ?auto_16933 - SURFACE
      ?auto_16911 - PLACE
      ?auto_16910 - HOIST
      ?auto_16916 - SURFACE
      ?auto_16931 - PLACE
      ?auto_16935 - HOIST
      ?auto_16932 - SURFACE
      ?auto_16917 - SURFACE
      ?auto_16922 - PLACE
      ?auto_16909 - HOIST
      ?auto_16921 - SURFACE
      ?auto_16930 - PLACE
      ?auto_16929 - HOIST
      ?auto_16924 - SURFACE
      ?auto_16934 - PLACE
      ?auto_16923 - HOIST
      ?auto_16928 - SURFACE
      ?auto_16919 - PLACE
      ?auto_16927 - HOIST
      ?auto_16925 - SURFACE
      ?auto_16918 - SURFACE
      ?auto_16914 - PLACE
      ?auto_16912 - HOIST
      ?auto_16915 - SURFACE
      ?auto_16926 - SURFACE
      ?auto_16908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16904 ?auto_16905 ) ( IS-CRATE ?auto_16902 ) ( not ( = ?auto_16903 ?auto_16905 ) ) ( HOIST-AT ?auto_16907 ?auto_16903 ) ( AVAILABLE ?auto_16907 ) ( SURFACE-AT ?auto_16902 ?auto_16903 ) ( ON ?auto_16902 ?auto_16906 ) ( CLEAR ?auto_16902 ) ( not ( = ?auto_16900 ?auto_16902 ) ) ( not ( = ?auto_16900 ?auto_16906 ) ) ( not ( = ?auto_16902 ?auto_16906 ) ) ( not ( = ?auto_16904 ?auto_16907 ) ) ( IS-CRATE ?auto_16900 ) ( not ( = ?auto_16913 ?auto_16905 ) ) ( HOIST-AT ?auto_16920 ?auto_16913 ) ( AVAILABLE ?auto_16920 ) ( SURFACE-AT ?auto_16900 ?auto_16913 ) ( ON ?auto_16900 ?auto_16933 ) ( CLEAR ?auto_16900 ) ( not ( = ?auto_16901 ?auto_16900 ) ) ( not ( = ?auto_16901 ?auto_16933 ) ) ( not ( = ?auto_16900 ?auto_16933 ) ) ( not ( = ?auto_16904 ?auto_16920 ) ) ( IS-CRATE ?auto_16901 ) ( not ( = ?auto_16911 ?auto_16905 ) ) ( HOIST-AT ?auto_16910 ?auto_16911 ) ( SURFACE-AT ?auto_16901 ?auto_16911 ) ( ON ?auto_16901 ?auto_16916 ) ( CLEAR ?auto_16901 ) ( not ( = ?auto_16896 ?auto_16901 ) ) ( not ( = ?auto_16896 ?auto_16916 ) ) ( not ( = ?auto_16901 ?auto_16916 ) ) ( not ( = ?auto_16904 ?auto_16910 ) ) ( IS-CRATE ?auto_16896 ) ( not ( = ?auto_16931 ?auto_16905 ) ) ( HOIST-AT ?auto_16935 ?auto_16931 ) ( SURFACE-AT ?auto_16896 ?auto_16931 ) ( ON ?auto_16896 ?auto_16932 ) ( CLEAR ?auto_16896 ) ( not ( = ?auto_16898 ?auto_16896 ) ) ( not ( = ?auto_16898 ?auto_16932 ) ) ( not ( = ?auto_16896 ?auto_16932 ) ) ( not ( = ?auto_16904 ?auto_16935 ) ) ( IS-CRATE ?auto_16898 ) ( AVAILABLE ?auto_16910 ) ( SURFACE-AT ?auto_16898 ?auto_16911 ) ( ON ?auto_16898 ?auto_16917 ) ( CLEAR ?auto_16898 ) ( not ( = ?auto_16899 ?auto_16898 ) ) ( not ( = ?auto_16899 ?auto_16917 ) ) ( not ( = ?auto_16898 ?auto_16917 ) ) ( IS-CRATE ?auto_16899 ) ( not ( = ?auto_16922 ?auto_16905 ) ) ( HOIST-AT ?auto_16909 ?auto_16922 ) ( SURFACE-AT ?auto_16899 ?auto_16922 ) ( ON ?auto_16899 ?auto_16921 ) ( CLEAR ?auto_16899 ) ( not ( = ?auto_16895 ?auto_16899 ) ) ( not ( = ?auto_16895 ?auto_16921 ) ) ( not ( = ?auto_16899 ?auto_16921 ) ) ( not ( = ?auto_16904 ?auto_16909 ) ) ( IS-CRATE ?auto_16895 ) ( not ( = ?auto_16930 ?auto_16905 ) ) ( HOIST-AT ?auto_16929 ?auto_16930 ) ( AVAILABLE ?auto_16929 ) ( SURFACE-AT ?auto_16895 ?auto_16930 ) ( ON ?auto_16895 ?auto_16924 ) ( CLEAR ?auto_16895 ) ( not ( = ?auto_16897 ?auto_16895 ) ) ( not ( = ?auto_16897 ?auto_16924 ) ) ( not ( = ?auto_16895 ?auto_16924 ) ) ( not ( = ?auto_16904 ?auto_16929 ) ) ( IS-CRATE ?auto_16897 ) ( not ( = ?auto_16934 ?auto_16905 ) ) ( HOIST-AT ?auto_16923 ?auto_16934 ) ( AVAILABLE ?auto_16923 ) ( SURFACE-AT ?auto_16897 ?auto_16934 ) ( ON ?auto_16897 ?auto_16928 ) ( CLEAR ?auto_16897 ) ( not ( = ?auto_16894 ?auto_16897 ) ) ( not ( = ?auto_16894 ?auto_16928 ) ) ( not ( = ?auto_16897 ?auto_16928 ) ) ( not ( = ?auto_16904 ?auto_16923 ) ) ( IS-CRATE ?auto_16894 ) ( not ( = ?auto_16919 ?auto_16905 ) ) ( HOIST-AT ?auto_16927 ?auto_16919 ) ( AVAILABLE ?auto_16927 ) ( SURFACE-AT ?auto_16894 ?auto_16919 ) ( ON ?auto_16894 ?auto_16925 ) ( CLEAR ?auto_16894 ) ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16893 ?auto_16925 ) ) ( not ( = ?auto_16894 ?auto_16925 ) ) ( not ( = ?auto_16904 ?auto_16927 ) ) ( IS-CRATE ?auto_16893 ) ( AVAILABLE ?auto_16935 ) ( SURFACE-AT ?auto_16893 ?auto_16931 ) ( ON ?auto_16893 ?auto_16918 ) ( CLEAR ?auto_16893 ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( not ( = ?auto_16892 ?auto_16918 ) ) ( not ( = ?auto_16893 ?auto_16918 ) ) ( IS-CRATE ?auto_16892 ) ( not ( = ?auto_16914 ?auto_16905 ) ) ( HOIST-AT ?auto_16912 ?auto_16914 ) ( AVAILABLE ?auto_16912 ) ( SURFACE-AT ?auto_16892 ?auto_16914 ) ( ON ?auto_16892 ?auto_16915 ) ( CLEAR ?auto_16892 ) ( not ( = ?auto_16891 ?auto_16892 ) ) ( not ( = ?auto_16891 ?auto_16915 ) ) ( not ( = ?auto_16892 ?auto_16915 ) ) ( not ( = ?auto_16904 ?auto_16912 ) ) ( SURFACE-AT ?auto_16890 ?auto_16905 ) ( CLEAR ?auto_16890 ) ( IS-CRATE ?auto_16891 ) ( AVAILABLE ?auto_16904 ) ( AVAILABLE ?auto_16909 ) ( SURFACE-AT ?auto_16891 ?auto_16922 ) ( ON ?auto_16891 ?auto_16926 ) ( CLEAR ?auto_16891 ) ( TRUCK-AT ?auto_16908 ?auto_16905 ) ( not ( = ?auto_16890 ?auto_16891 ) ) ( not ( = ?auto_16890 ?auto_16926 ) ) ( not ( = ?auto_16891 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16892 ) ) ( not ( = ?auto_16890 ?auto_16915 ) ) ( not ( = ?auto_16892 ?auto_16926 ) ) ( not ( = ?auto_16914 ?auto_16922 ) ) ( not ( = ?auto_16912 ?auto_16909 ) ) ( not ( = ?auto_16915 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16893 ) ) ( not ( = ?auto_16890 ?auto_16918 ) ) ( not ( = ?auto_16891 ?auto_16893 ) ) ( not ( = ?auto_16891 ?auto_16918 ) ) ( not ( = ?auto_16893 ?auto_16915 ) ) ( not ( = ?auto_16893 ?auto_16926 ) ) ( not ( = ?auto_16931 ?auto_16914 ) ) ( not ( = ?auto_16931 ?auto_16922 ) ) ( not ( = ?auto_16935 ?auto_16912 ) ) ( not ( = ?auto_16935 ?auto_16909 ) ) ( not ( = ?auto_16918 ?auto_16915 ) ) ( not ( = ?auto_16918 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16894 ) ) ( not ( = ?auto_16890 ?auto_16925 ) ) ( not ( = ?auto_16891 ?auto_16894 ) ) ( not ( = ?auto_16891 ?auto_16925 ) ) ( not ( = ?auto_16892 ?auto_16894 ) ) ( not ( = ?auto_16892 ?auto_16925 ) ) ( not ( = ?auto_16894 ?auto_16918 ) ) ( not ( = ?auto_16894 ?auto_16915 ) ) ( not ( = ?auto_16894 ?auto_16926 ) ) ( not ( = ?auto_16919 ?auto_16931 ) ) ( not ( = ?auto_16919 ?auto_16914 ) ) ( not ( = ?auto_16919 ?auto_16922 ) ) ( not ( = ?auto_16927 ?auto_16935 ) ) ( not ( = ?auto_16927 ?auto_16912 ) ) ( not ( = ?auto_16927 ?auto_16909 ) ) ( not ( = ?auto_16925 ?auto_16918 ) ) ( not ( = ?auto_16925 ?auto_16915 ) ) ( not ( = ?auto_16925 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16897 ) ) ( not ( = ?auto_16890 ?auto_16928 ) ) ( not ( = ?auto_16891 ?auto_16897 ) ) ( not ( = ?auto_16891 ?auto_16928 ) ) ( not ( = ?auto_16892 ?auto_16897 ) ) ( not ( = ?auto_16892 ?auto_16928 ) ) ( not ( = ?auto_16893 ?auto_16897 ) ) ( not ( = ?auto_16893 ?auto_16928 ) ) ( not ( = ?auto_16897 ?auto_16925 ) ) ( not ( = ?auto_16897 ?auto_16918 ) ) ( not ( = ?auto_16897 ?auto_16915 ) ) ( not ( = ?auto_16897 ?auto_16926 ) ) ( not ( = ?auto_16934 ?auto_16919 ) ) ( not ( = ?auto_16934 ?auto_16931 ) ) ( not ( = ?auto_16934 ?auto_16914 ) ) ( not ( = ?auto_16934 ?auto_16922 ) ) ( not ( = ?auto_16923 ?auto_16927 ) ) ( not ( = ?auto_16923 ?auto_16935 ) ) ( not ( = ?auto_16923 ?auto_16912 ) ) ( not ( = ?auto_16923 ?auto_16909 ) ) ( not ( = ?auto_16928 ?auto_16925 ) ) ( not ( = ?auto_16928 ?auto_16918 ) ) ( not ( = ?auto_16928 ?auto_16915 ) ) ( not ( = ?auto_16928 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16895 ) ) ( not ( = ?auto_16890 ?auto_16924 ) ) ( not ( = ?auto_16891 ?auto_16895 ) ) ( not ( = ?auto_16891 ?auto_16924 ) ) ( not ( = ?auto_16892 ?auto_16895 ) ) ( not ( = ?auto_16892 ?auto_16924 ) ) ( not ( = ?auto_16893 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16924 ) ) ( not ( = ?auto_16894 ?auto_16895 ) ) ( not ( = ?auto_16894 ?auto_16924 ) ) ( not ( = ?auto_16895 ?auto_16928 ) ) ( not ( = ?auto_16895 ?auto_16925 ) ) ( not ( = ?auto_16895 ?auto_16918 ) ) ( not ( = ?auto_16895 ?auto_16915 ) ) ( not ( = ?auto_16895 ?auto_16926 ) ) ( not ( = ?auto_16930 ?auto_16934 ) ) ( not ( = ?auto_16930 ?auto_16919 ) ) ( not ( = ?auto_16930 ?auto_16931 ) ) ( not ( = ?auto_16930 ?auto_16914 ) ) ( not ( = ?auto_16930 ?auto_16922 ) ) ( not ( = ?auto_16929 ?auto_16923 ) ) ( not ( = ?auto_16929 ?auto_16927 ) ) ( not ( = ?auto_16929 ?auto_16935 ) ) ( not ( = ?auto_16929 ?auto_16912 ) ) ( not ( = ?auto_16929 ?auto_16909 ) ) ( not ( = ?auto_16924 ?auto_16928 ) ) ( not ( = ?auto_16924 ?auto_16925 ) ) ( not ( = ?auto_16924 ?auto_16918 ) ) ( not ( = ?auto_16924 ?auto_16915 ) ) ( not ( = ?auto_16924 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16899 ) ) ( not ( = ?auto_16890 ?auto_16921 ) ) ( not ( = ?auto_16891 ?auto_16899 ) ) ( not ( = ?auto_16891 ?auto_16921 ) ) ( not ( = ?auto_16892 ?auto_16899 ) ) ( not ( = ?auto_16892 ?auto_16921 ) ) ( not ( = ?auto_16893 ?auto_16899 ) ) ( not ( = ?auto_16893 ?auto_16921 ) ) ( not ( = ?auto_16894 ?auto_16899 ) ) ( not ( = ?auto_16894 ?auto_16921 ) ) ( not ( = ?auto_16897 ?auto_16899 ) ) ( not ( = ?auto_16897 ?auto_16921 ) ) ( not ( = ?auto_16899 ?auto_16924 ) ) ( not ( = ?auto_16899 ?auto_16928 ) ) ( not ( = ?auto_16899 ?auto_16925 ) ) ( not ( = ?auto_16899 ?auto_16918 ) ) ( not ( = ?auto_16899 ?auto_16915 ) ) ( not ( = ?auto_16899 ?auto_16926 ) ) ( not ( = ?auto_16921 ?auto_16924 ) ) ( not ( = ?auto_16921 ?auto_16928 ) ) ( not ( = ?auto_16921 ?auto_16925 ) ) ( not ( = ?auto_16921 ?auto_16918 ) ) ( not ( = ?auto_16921 ?auto_16915 ) ) ( not ( = ?auto_16921 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16898 ) ) ( not ( = ?auto_16890 ?auto_16917 ) ) ( not ( = ?auto_16891 ?auto_16898 ) ) ( not ( = ?auto_16891 ?auto_16917 ) ) ( not ( = ?auto_16892 ?auto_16898 ) ) ( not ( = ?auto_16892 ?auto_16917 ) ) ( not ( = ?auto_16893 ?auto_16898 ) ) ( not ( = ?auto_16893 ?auto_16917 ) ) ( not ( = ?auto_16894 ?auto_16898 ) ) ( not ( = ?auto_16894 ?auto_16917 ) ) ( not ( = ?auto_16897 ?auto_16898 ) ) ( not ( = ?auto_16897 ?auto_16917 ) ) ( not ( = ?auto_16895 ?auto_16898 ) ) ( not ( = ?auto_16895 ?auto_16917 ) ) ( not ( = ?auto_16898 ?auto_16921 ) ) ( not ( = ?auto_16898 ?auto_16924 ) ) ( not ( = ?auto_16898 ?auto_16928 ) ) ( not ( = ?auto_16898 ?auto_16925 ) ) ( not ( = ?auto_16898 ?auto_16918 ) ) ( not ( = ?auto_16898 ?auto_16915 ) ) ( not ( = ?auto_16898 ?auto_16926 ) ) ( not ( = ?auto_16911 ?auto_16922 ) ) ( not ( = ?auto_16911 ?auto_16930 ) ) ( not ( = ?auto_16911 ?auto_16934 ) ) ( not ( = ?auto_16911 ?auto_16919 ) ) ( not ( = ?auto_16911 ?auto_16931 ) ) ( not ( = ?auto_16911 ?auto_16914 ) ) ( not ( = ?auto_16910 ?auto_16909 ) ) ( not ( = ?auto_16910 ?auto_16929 ) ) ( not ( = ?auto_16910 ?auto_16923 ) ) ( not ( = ?auto_16910 ?auto_16927 ) ) ( not ( = ?auto_16910 ?auto_16935 ) ) ( not ( = ?auto_16910 ?auto_16912 ) ) ( not ( = ?auto_16917 ?auto_16921 ) ) ( not ( = ?auto_16917 ?auto_16924 ) ) ( not ( = ?auto_16917 ?auto_16928 ) ) ( not ( = ?auto_16917 ?auto_16925 ) ) ( not ( = ?auto_16917 ?auto_16918 ) ) ( not ( = ?auto_16917 ?auto_16915 ) ) ( not ( = ?auto_16917 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16896 ) ) ( not ( = ?auto_16890 ?auto_16932 ) ) ( not ( = ?auto_16891 ?auto_16896 ) ) ( not ( = ?auto_16891 ?auto_16932 ) ) ( not ( = ?auto_16892 ?auto_16896 ) ) ( not ( = ?auto_16892 ?auto_16932 ) ) ( not ( = ?auto_16893 ?auto_16896 ) ) ( not ( = ?auto_16893 ?auto_16932 ) ) ( not ( = ?auto_16894 ?auto_16896 ) ) ( not ( = ?auto_16894 ?auto_16932 ) ) ( not ( = ?auto_16897 ?auto_16896 ) ) ( not ( = ?auto_16897 ?auto_16932 ) ) ( not ( = ?auto_16895 ?auto_16896 ) ) ( not ( = ?auto_16895 ?auto_16932 ) ) ( not ( = ?auto_16899 ?auto_16896 ) ) ( not ( = ?auto_16899 ?auto_16932 ) ) ( not ( = ?auto_16896 ?auto_16917 ) ) ( not ( = ?auto_16896 ?auto_16921 ) ) ( not ( = ?auto_16896 ?auto_16924 ) ) ( not ( = ?auto_16896 ?auto_16928 ) ) ( not ( = ?auto_16896 ?auto_16925 ) ) ( not ( = ?auto_16896 ?auto_16918 ) ) ( not ( = ?auto_16896 ?auto_16915 ) ) ( not ( = ?auto_16896 ?auto_16926 ) ) ( not ( = ?auto_16932 ?auto_16917 ) ) ( not ( = ?auto_16932 ?auto_16921 ) ) ( not ( = ?auto_16932 ?auto_16924 ) ) ( not ( = ?auto_16932 ?auto_16928 ) ) ( not ( = ?auto_16932 ?auto_16925 ) ) ( not ( = ?auto_16932 ?auto_16918 ) ) ( not ( = ?auto_16932 ?auto_16915 ) ) ( not ( = ?auto_16932 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16901 ) ) ( not ( = ?auto_16890 ?auto_16916 ) ) ( not ( = ?auto_16891 ?auto_16901 ) ) ( not ( = ?auto_16891 ?auto_16916 ) ) ( not ( = ?auto_16892 ?auto_16901 ) ) ( not ( = ?auto_16892 ?auto_16916 ) ) ( not ( = ?auto_16893 ?auto_16901 ) ) ( not ( = ?auto_16893 ?auto_16916 ) ) ( not ( = ?auto_16894 ?auto_16901 ) ) ( not ( = ?auto_16894 ?auto_16916 ) ) ( not ( = ?auto_16897 ?auto_16901 ) ) ( not ( = ?auto_16897 ?auto_16916 ) ) ( not ( = ?auto_16895 ?auto_16901 ) ) ( not ( = ?auto_16895 ?auto_16916 ) ) ( not ( = ?auto_16899 ?auto_16901 ) ) ( not ( = ?auto_16899 ?auto_16916 ) ) ( not ( = ?auto_16898 ?auto_16901 ) ) ( not ( = ?auto_16898 ?auto_16916 ) ) ( not ( = ?auto_16901 ?auto_16932 ) ) ( not ( = ?auto_16901 ?auto_16917 ) ) ( not ( = ?auto_16901 ?auto_16921 ) ) ( not ( = ?auto_16901 ?auto_16924 ) ) ( not ( = ?auto_16901 ?auto_16928 ) ) ( not ( = ?auto_16901 ?auto_16925 ) ) ( not ( = ?auto_16901 ?auto_16918 ) ) ( not ( = ?auto_16901 ?auto_16915 ) ) ( not ( = ?auto_16901 ?auto_16926 ) ) ( not ( = ?auto_16916 ?auto_16932 ) ) ( not ( = ?auto_16916 ?auto_16917 ) ) ( not ( = ?auto_16916 ?auto_16921 ) ) ( not ( = ?auto_16916 ?auto_16924 ) ) ( not ( = ?auto_16916 ?auto_16928 ) ) ( not ( = ?auto_16916 ?auto_16925 ) ) ( not ( = ?auto_16916 ?auto_16918 ) ) ( not ( = ?auto_16916 ?auto_16915 ) ) ( not ( = ?auto_16916 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16900 ) ) ( not ( = ?auto_16890 ?auto_16933 ) ) ( not ( = ?auto_16891 ?auto_16900 ) ) ( not ( = ?auto_16891 ?auto_16933 ) ) ( not ( = ?auto_16892 ?auto_16900 ) ) ( not ( = ?auto_16892 ?auto_16933 ) ) ( not ( = ?auto_16893 ?auto_16900 ) ) ( not ( = ?auto_16893 ?auto_16933 ) ) ( not ( = ?auto_16894 ?auto_16900 ) ) ( not ( = ?auto_16894 ?auto_16933 ) ) ( not ( = ?auto_16897 ?auto_16900 ) ) ( not ( = ?auto_16897 ?auto_16933 ) ) ( not ( = ?auto_16895 ?auto_16900 ) ) ( not ( = ?auto_16895 ?auto_16933 ) ) ( not ( = ?auto_16899 ?auto_16900 ) ) ( not ( = ?auto_16899 ?auto_16933 ) ) ( not ( = ?auto_16898 ?auto_16900 ) ) ( not ( = ?auto_16898 ?auto_16933 ) ) ( not ( = ?auto_16896 ?auto_16900 ) ) ( not ( = ?auto_16896 ?auto_16933 ) ) ( not ( = ?auto_16900 ?auto_16916 ) ) ( not ( = ?auto_16900 ?auto_16932 ) ) ( not ( = ?auto_16900 ?auto_16917 ) ) ( not ( = ?auto_16900 ?auto_16921 ) ) ( not ( = ?auto_16900 ?auto_16924 ) ) ( not ( = ?auto_16900 ?auto_16928 ) ) ( not ( = ?auto_16900 ?auto_16925 ) ) ( not ( = ?auto_16900 ?auto_16918 ) ) ( not ( = ?auto_16900 ?auto_16915 ) ) ( not ( = ?auto_16900 ?auto_16926 ) ) ( not ( = ?auto_16913 ?auto_16911 ) ) ( not ( = ?auto_16913 ?auto_16931 ) ) ( not ( = ?auto_16913 ?auto_16922 ) ) ( not ( = ?auto_16913 ?auto_16930 ) ) ( not ( = ?auto_16913 ?auto_16934 ) ) ( not ( = ?auto_16913 ?auto_16919 ) ) ( not ( = ?auto_16913 ?auto_16914 ) ) ( not ( = ?auto_16920 ?auto_16910 ) ) ( not ( = ?auto_16920 ?auto_16935 ) ) ( not ( = ?auto_16920 ?auto_16909 ) ) ( not ( = ?auto_16920 ?auto_16929 ) ) ( not ( = ?auto_16920 ?auto_16923 ) ) ( not ( = ?auto_16920 ?auto_16927 ) ) ( not ( = ?auto_16920 ?auto_16912 ) ) ( not ( = ?auto_16933 ?auto_16916 ) ) ( not ( = ?auto_16933 ?auto_16932 ) ) ( not ( = ?auto_16933 ?auto_16917 ) ) ( not ( = ?auto_16933 ?auto_16921 ) ) ( not ( = ?auto_16933 ?auto_16924 ) ) ( not ( = ?auto_16933 ?auto_16928 ) ) ( not ( = ?auto_16933 ?auto_16925 ) ) ( not ( = ?auto_16933 ?auto_16918 ) ) ( not ( = ?auto_16933 ?auto_16915 ) ) ( not ( = ?auto_16933 ?auto_16926 ) ) ( not ( = ?auto_16890 ?auto_16902 ) ) ( not ( = ?auto_16890 ?auto_16906 ) ) ( not ( = ?auto_16891 ?auto_16902 ) ) ( not ( = ?auto_16891 ?auto_16906 ) ) ( not ( = ?auto_16892 ?auto_16902 ) ) ( not ( = ?auto_16892 ?auto_16906 ) ) ( not ( = ?auto_16893 ?auto_16902 ) ) ( not ( = ?auto_16893 ?auto_16906 ) ) ( not ( = ?auto_16894 ?auto_16902 ) ) ( not ( = ?auto_16894 ?auto_16906 ) ) ( not ( = ?auto_16897 ?auto_16902 ) ) ( not ( = ?auto_16897 ?auto_16906 ) ) ( not ( = ?auto_16895 ?auto_16902 ) ) ( not ( = ?auto_16895 ?auto_16906 ) ) ( not ( = ?auto_16899 ?auto_16902 ) ) ( not ( = ?auto_16899 ?auto_16906 ) ) ( not ( = ?auto_16898 ?auto_16902 ) ) ( not ( = ?auto_16898 ?auto_16906 ) ) ( not ( = ?auto_16896 ?auto_16902 ) ) ( not ( = ?auto_16896 ?auto_16906 ) ) ( not ( = ?auto_16901 ?auto_16902 ) ) ( not ( = ?auto_16901 ?auto_16906 ) ) ( not ( = ?auto_16902 ?auto_16933 ) ) ( not ( = ?auto_16902 ?auto_16916 ) ) ( not ( = ?auto_16902 ?auto_16932 ) ) ( not ( = ?auto_16902 ?auto_16917 ) ) ( not ( = ?auto_16902 ?auto_16921 ) ) ( not ( = ?auto_16902 ?auto_16924 ) ) ( not ( = ?auto_16902 ?auto_16928 ) ) ( not ( = ?auto_16902 ?auto_16925 ) ) ( not ( = ?auto_16902 ?auto_16918 ) ) ( not ( = ?auto_16902 ?auto_16915 ) ) ( not ( = ?auto_16902 ?auto_16926 ) ) ( not ( = ?auto_16903 ?auto_16913 ) ) ( not ( = ?auto_16903 ?auto_16911 ) ) ( not ( = ?auto_16903 ?auto_16931 ) ) ( not ( = ?auto_16903 ?auto_16922 ) ) ( not ( = ?auto_16903 ?auto_16930 ) ) ( not ( = ?auto_16903 ?auto_16934 ) ) ( not ( = ?auto_16903 ?auto_16919 ) ) ( not ( = ?auto_16903 ?auto_16914 ) ) ( not ( = ?auto_16907 ?auto_16920 ) ) ( not ( = ?auto_16907 ?auto_16910 ) ) ( not ( = ?auto_16907 ?auto_16935 ) ) ( not ( = ?auto_16907 ?auto_16909 ) ) ( not ( = ?auto_16907 ?auto_16929 ) ) ( not ( = ?auto_16907 ?auto_16923 ) ) ( not ( = ?auto_16907 ?auto_16927 ) ) ( not ( = ?auto_16907 ?auto_16912 ) ) ( not ( = ?auto_16906 ?auto_16933 ) ) ( not ( = ?auto_16906 ?auto_16916 ) ) ( not ( = ?auto_16906 ?auto_16932 ) ) ( not ( = ?auto_16906 ?auto_16917 ) ) ( not ( = ?auto_16906 ?auto_16921 ) ) ( not ( = ?auto_16906 ?auto_16924 ) ) ( not ( = ?auto_16906 ?auto_16928 ) ) ( not ( = ?auto_16906 ?auto_16925 ) ) ( not ( = ?auto_16906 ?auto_16918 ) ) ( not ( = ?auto_16906 ?auto_16915 ) ) ( not ( = ?auto_16906 ?auto_16926 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16890 ?auto_16891 ?auto_16892 ?auto_16893 ?auto_16894 ?auto_16897 ?auto_16895 ?auto_16899 ?auto_16898 ?auto_16896 ?auto_16901 ?auto_16900 )
      ( MAKE-1CRATE ?auto_16900 ?auto_16902 )
      ( MAKE-12CRATE-VERIFY ?auto_16890 ?auto_16891 ?auto_16892 ?auto_16893 ?auto_16894 ?auto_16897 ?auto_16895 ?auto_16899 ?auto_16898 ?auto_16896 ?auto_16901 ?auto_16900 ?auto_16902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16938 - SURFACE
      ?auto_16939 - SURFACE
    )
    :vars
    (
      ?auto_16940 - HOIST
      ?auto_16941 - PLACE
      ?auto_16943 - PLACE
      ?auto_16944 - HOIST
      ?auto_16945 - SURFACE
      ?auto_16942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16940 ?auto_16941 ) ( SURFACE-AT ?auto_16938 ?auto_16941 ) ( CLEAR ?auto_16938 ) ( IS-CRATE ?auto_16939 ) ( AVAILABLE ?auto_16940 ) ( not ( = ?auto_16943 ?auto_16941 ) ) ( HOIST-AT ?auto_16944 ?auto_16943 ) ( AVAILABLE ?auto_16944 ) ( SURFACE-AT ?auto_16939 ?auto_16943 ) ( ON ?auto_16939 ?auto_16945 ) ( CLEAR ?auto_16939 ) ( TRUCK-AT ?auto_16942 ?auto_16941 ) ( not ( = ?auto_16938 ?auto_16939 ) ) ( not ( = ?auto_16938 ?auto_16945 ) ) ( not ( = ?auto_16939 ?auto_16945 ) ) ( not ( = ?auto_16940 ?auto_16944 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16942 ?auto_16941 ?auto_16943 )
      ( !LIFT ?auto_16944 ?auto_16939 ?auto_16945 ?auto_16943 )
      ( !LOAD ?auto_16944 ?auto_16939 ?auto_16942 ?auto_16943 )
      ( !DRIVE ?auto_16942 ?auto_16943 ?auto_16941 )
      ( !UNLOAD ?auto_16940 ?auto_16939 ?auto_16942 ?auto_16941 )
      ( !DROP ?auto_16940 ?auto_16939 ?auto_16938 ?auto_16941 )
      ( MAKE-1CRATE-VERIFY ?auto_16938 ?auto_16939 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_16960 - SURFACE
      ?auto_16961 - SURFACE
      ?auto_16962 - SURFACE
      ?auto_16963 - SURFACE
      ?auto_16964 - SURFACE
      ?auto_16967 - SURFACE
      ?auto_16965 - SURFACE
      ?auto_16969 - SURFACE
      ?auto_16968 - SURFACE
      ?auto_16966 - SURFACE
      ?auto_16971 - SURFACE
      ?auto_16970 - SURFACE
      ?auto_16972 - SURFACE
      ?auto_16973 - SURFACE
    )
    :vars
    (
      ?auto_16978 - HOIST
      ?auto_16976 - PLACE
      ?auto_16979 - PLACE
      ?auto_16975 - HOIST
      ?auto_16974 - SURFACE
      ?auto_16995 - PLACE
      ?auto_16994 - HOIST
      ?auto_17002 - SURFACE
      ?auto_17009 - PLACE
      ?auto_16986 - HOIST
      ?auto_16981 - SURFACE
      ?auto_16991 - PLACE
      ?auto_16988 - HOIST
      ?auto_17003 - SURFACE
      ?auto_16998 - PLACE
      ?auto_16996 - HOIST
      ?auto_17006 - SURFACE
      ?auto_16989 - SURFACE
      ?auto_16993 - PLACE
      ?auto_17005 - HOIST
      ?auto_16982 - SURFACE
      ?auto_16984 - PLACE
      ?auto_16985 - HOIST
      ?auto_16987 - SURFACE
      ?auto_17001 - PLACE
      ?auto_16999 - HOIST
      ?auto_17000 - SURFACE
      ?auto_16980 - PLACE
      ?auto_17007 - HOIST
      ?auto_17004 - SURFACE
      ?auto_16983 - SURFACE
      ?auto_16992 - PLACE
      ?auto_16990 - HOIST
      ?auto_17008 - SURFACE
      ?auto_16997 - SURFACE
      ?auto_16977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16978 ?auto_16976 ) ( IS-CRATE ?auto_16973 ) ( not ( = ?auto_16979 ?auto_16976 ) ) ( HOIST-AT ?auto_16975 ?auto_16979 ) ( AVAILABLE ?auto_16975 ) ( SURFACE-AT ?auto_16973 ?auto_16979 ) ( ON ?auto_16973 ?auto_16974 ) ( CLEAR ?auto_16973 ) ( not ( = ?auto_16972 ?auto_16973 ) ) ( not ( = ?auto_16972 ?auto_16974 ) ) ( not ( = ?auto_16973 ?auto_16974 ) ) ( not ( = ?auto_16978 ?auto_16975 ) ) ( IS-CRATE ?auto_16972 ) ( not ( = ?auto_16995 ?auto_16976 ) ) ( HOIST-AT ?auto_16994 ?auto_16995 ) ( AVAILABLE ?auto_16994 ) ( SURFACE-AT ?auto_16972 ?auto_16995 ) ( ON ?auto_16972 ?auto_17002 ) ( CLEAR ?auto_16972 ) ( not ( = ?auto_16970 ?auto_16972 ) ) ( not ( = ?auto_16970 ?auto_17002 ) ) ( not ( = ?auto_16972 ?auto_17002 ) ) ( not ( = ?auto_16978 ?auto_16994 ) ) ( IS-CRATE ?auto_16970 ) ( not ( = ?auto_17009 ?auto_16976 ) ) ( HOIST-AT ?auto_16986 ?auto_17009 ) ( AVAILABLE ?auto_16986 ) ( SURFACE-AT ?auto_16970 ?auto_17009 ) ( ON ?auto_16970 ?auto_16981 ) ( CLEAR ?auto_16970 ) ( not ( = ?auto_16971 ?auto_16970 ) ) ( not ( = ?auto_16971 ?auto_16981 ) ) ( not ( = ?auto_16970 ?auto_16981 ) ) ( not ( = ?auto_16978 ?auto_16986 ) ) ( IS-CRATE ?auto_16971 ) ( not ( = ?auto_16991 ?auto_16976 ) ) ( HOIST-AT ?auto_16988 ?auto_16991 ) ( SURFACE-AT ?auto_16971 ?auto_16991 ) ( ON ?auto_16971 ?auto_17003 ) ( CLEAR ?auto_16971 ) ( not ( = ?auto_16966 ?auto_16971 ) ) ( not ( = ?auto_16966 ?auto_17003 ) ) ( not ( = ?auto_16971 ?auto_17003 ) ) ( not ( = ?auto_16978 ?auto_16988 ) ) ( IS-CRATE ?auto_16966 ) ( not ( = ?auto_16998 ?auto_16976 ) ) ( HOIST-AT ?auto_16996 ?auto_16998 ) ( SURFACE-AT ?auto_16966 ?auto_16998 ) ( ON ?auto_16966 ?auto_17006 ) ( CLEAR ?auto_16966 ) ( not ( = ?auto_16968 ?auto_16966 ) ) ( not ( = ?auto_16968 ?auto_17006 ) ) ( not ( = ?auto_16966 ?auto_17006 ) ) ( not ( = ?auto_16978 ?auto_16996 ) ) ( IS-CRATE ?auto_16968 ) ( AVAILABLE ?auto_16988 ) ( SURFACE-AT ?auto_16968 ?auto_16991 ) ( ON ?auto_16968 ?auto_16989 ) ( CLEAR ?auto_16968 ) ( not ( = ?auto_16969 ?auto_16968 ) ) ( not ( = ?auto_16969 ?auto_16989 ) ) ( not ( = ?auto_16968 ?auto_16989 ) ) ( IS-CRATE ?auto_16969 ) ( not ( = ?auto_16993 ?auto_16976 ) ) ( HOIST-AT ?auto_17005 ?auto_16993 ) ( SURFACE-AT ?auto_16969 ?auto_16993 ) ( ON ?auto_16969 ?auto_16982 ) ( CLEAR ?auto_16969 ) ( not ( = ?auto_16965 ?auto_16969 ) ) ( not ( = ?auto_16965 ?auto_16982 ) ) ( not ( = ?auto_16969 ?auto_16982 ) ) ( not ( = ?auto_16978 ?auto_17005 ) ) ( IS-CRATE ?auto_16965 ) ( not ( = ?auto_16984 ?auto_16976 ) ) ( HOIST-AT ?auto_16985 ?auto_16984 ) ( AVAILABLE ?auto_16985 ) ( SURFACE-AT ?auto_16965 ?auto_16984 ) ( ON ?auto_16965 ?auto_16987 ) ( CLEAR ?auto_16965 ) ( not ( = ?auto_16967 ?auto_16965 ) ) ( not ( = ?auto_16967 ?auto_16987 ) ) ( not ( = ?auto_16965 ?auto_16987 ) ) ( not ( = ?auto_16978 ?auto_16985 ) ) ( IS-CRATE ?auto_16967 ) ( not ( = ?auto_17001 ?auto_16976 ) ) ( HOIST-AT ?auto_16999 ?auto_17001 ) ( AVAILABLE ?auto_16999 ) ( SURFACE-AT ?auto_16967 ?auto_17001 ) ( ON ?auto_16967 ?auto_17000 ) ( CLEAR ?auto_16967 ) ( not ( = ?auto_16964 ?auto_16967 ) ) ( not ( = ?auto_16964 ?auto_17000 ) ) ( not ( = ?auto_16967 ?auto_17000 ) ) ( not ( = ?auto_16978 ?auto_16999 ) ) ( IS-CRATE ?auto_16964 ) ( not ( = ?auto_16980 ?auto_16976 ) ) ( HOIST-AT ?auto_17007 ?auto_16980 ) ( AVAILABLE ?auto_17007 ) ( SURFACE-AT ?auto_16964 ?auto_16980 ) ( ON ?auto_16964 ?auto_17004 ) ( CLEAR ?auto_16964 ) ( not ( = ?auto_16963 ?auto_16964 ) ) ( not ( = ?auto_16963 ?auto_17004 ) ) ( not ( = ?auto_16964 ?auto_17004 ) ) ( not ( = ?auto_16978 ?auto_17007 ) ) ( IS-CRATE ?auto_16963 ) ( AVAILABLE ?auto_16996 ) ( SURFACE-AT ?auto_16963 ?auto_16998 ) ( ON ?auto_16963 ?auto_16983 ) ( CLEAR ?auto_16963 ) ( not ( = ?auto_16962 ?auto_16963 ) ) ( not ( = ?auto_16962 ?auto_16983 ) ) ( not ( = ?auto_16963 ?auto_16983 ) ) ( IS-CRATE ?auto_16962 ) ( not ( = ?auto_16992 ?auto_16976 ) ) ( HOIST-AT ?auto_16990 ?auto_16992 ) ( AVAILABLE ?auto_16990 ) ( SURFACE-AT ?auto_16962 ?auto_16992 ) ( ON ?auto_16962 ?auto_17008 ) ( CLEAR ?auto_16962 ) ( not ( = ?auto_16961 ?auto_16962 ) ) ( not ( = ?auto_16961 ?auto_17008 ) ) ( not ( = ?auto_16962 ?auto_17008 ) ) ( not ( = ?auto_16978 ?auto_16990 ) ) ( SURFACE-AT ?auto_16960 ?auto_16976 ) ( CLEAR ?auto_16960 ) ( IS-CRATE ?auto_16961 ) ( AVAILABLE ?auto_16978 ) ( AVAILABLE ?auto_17005 ) ( SURFACE-AT ?auto_16961 ?auto_16993 ) ( ON ?auto_16961 ?auto_16997 ) ( CLEAR ?auto_16961 ) ( TRUCK-AT ?auto_16977 ?auto_16976 ) ( not ( = ?auto_16960 ?auto_16961 ) ) ( not ( = ?auto_16960 ?auto_16997 ) ) ( not ( = ?auto_16961 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16962 ) ) ( not ( = ?auto_16960 ?auto_17008 ) ) ( not ( = ?auto_16962 ?auto_16997 ) ) ( not ( = ?auto_16992 ?auto_16993 ) ) ( not ( = ?auto_16990 ?auto_17005 ) ) ( not ( = ?auto_17008 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16963 ) ) ( not ( = ?auto_16960 ?auto_16983 ) ) ( not ( = ?auto_16961 ?auto_16963 ) ) ( not ( = ?auto_16961 ?auto_16983 ) ) ( not ( = ?auto_16963 ?auto_17008 ) ) ( not ( = ?auto_16963 ?auto_16997 ) ) ( not ( = ?auto_16998 ?auto_16992 ) ) ( not ( = ?auto_16998 ?auto_16993 ) ) ( not ( = ?auto_16996 ?auto_16990 ) ) ( not ( = ?auto_16996 ?auto_17005 ) ) ( not ( = ?auto_16983 ?auto_17008 ) ) ( not ( = ?auto_16983 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16964 ) ) ( not ( = ?auto_16960 ?auto_17004 ) ) ( not ( = ?auto_16961 ?auto_16964 ) ) ( not ( = ?auto_16961 ?auto_17004 ) ) ( not ( = ?auto_16962 ?auto_16964 ) ) ( not ( = ?auto_16962 ?auto_17004 ) ) ( not ( = ?auto_16964 ?auto_16983 ) ) ( not ( = ?auto_16964 ?auto_17008 ) ) ( not ( = ?auto_16964 ?auto_16997 ) ) ( not ( = ?auto_16980 ?auto_16998 ) ) ( not ( = ?auto_16980 ?auto_16992 ) ) ( not ( = ?auto_16980 ?auto_16993 ) ) ( not ( = ?auto_17007 ?auto_16996 ) ) ( not ( = ?auto_17007 ?auto_16990 ) ) ( not ( = ?auto_17007 ?auto_17005 ) ) ( not ( = ?auto_17004 ?auto_16983 ) ) ( not ( = ?auto_17004 ?auto_17008 ) ) ( not ( = ?auto_17004 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16967 ) ) ( not ( = ?auto_16960 ?auto_17000 ) ) ( not ( = ?auto_16961 ?auto_16967 ) ) ( not ( = ?auto_16961 ?auto_17000 ) ) ( not ( = ?auto_16962 ?auto_16967 ) ) ( not ( = ?auto_16962 ?auto_17000 ) ) ( not ( = ?auto_16963 ?auto_16967 ) ) ( not ( = ?auto_16963 ?auto_17000 ) ) ( not ( = ?auto_16967 ?auto_17004 ) ) ( not ( = ?auto_16967 ?auto_16983 ) ) ( not ( = ?auto_16967 ?auto_17008 ) ) ( not ( = ?auto_16967 ?auto_16997 ) ) ( not ( = ?auto_17001 ?auto_16980 ) ) ( not ( = ?auto_17001 ?auto_16998 ) ) ( not ( = ?auto_17001 ?auto_16992 ) ) ( not ( = ?auto_17001 ?auto_16993 ) ) ( not ( = ?auto_16999 ?auto_17007 ) ) ( not ( = ?auto_16999 ?auto_16996 ) ) ( not ( = ?auto_16999 ?auto_16990 ) ) ( not ( = ?auto_16999 ?auto_17005 ) ) ( not ( = ?auto_17000 ?auto_17004 ) ) ( not ( = ?auto_17000 ?auto_16983 ) ) ( not ( = ?auto_17000 ?auto_17008 ) ) ( not ( = ?auto_17000 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16965 ) ) ( not ( = ?auto_16960 ?auto_16987 ) ) ( not ( = ?auto_16961 ?auto_16965 ) ) ( not ( = ?auto_16961 ?auto_16987 ) ) ( not ( = ?auto_16962 ?auto_16965 ) ) ( not ( = ?auto_16962 ?auto_16987 ) ) ( not ( = ?auto_16963 ?auto_16965 ) ) ( not ( = ?auto_16963 ?auto_16987 ) ) ( not ( = ?auto_16964 ?auto_16965 ) ) ( not ( = ?auto_16964 ?auto_16987 ) ) ( not ( = ?auto_16965 ?auto_17000 ) ) ( not ( = ?auto_16965 ?auto_17004 ) ) ( not ( = ?auto_16965 ?auto_16983 ) ) ( not ( = ?auto_16965 ?auto_17008 ) ) ( not ( = ?auto_16965 ?auto_16997 ) ) ( not ( = ?auto_16984 ?auto_17001 ) ) ( not ( = ?auto_16984 ?auto_16980 ) ) ( not ( = ?auto_16984 ?auto_16998 ) ) ( not ( = ?auto_16984 ?auto_16992 ) ) ( not ( = ?auto_16984 ?auto_16993 ) ) ( not ( = ?auto_16985 ?auto_16999 ) ) ( not ( = ?auto_16985 ?auto_17007 ) ) ( not ( = ?auto_16985 ?auto_16996 ) ) ( not ( = ?auto_16985 ?auto_16990 ) ) ( not ( = ?auto_16985 ?auto_17005 ) ) ( not ( = ?auto_16987 ?auto_17000 ) ) ( not ( = ?auto_16987 ?auto_17004 ) ) ( not ( = ?auto_16987 ?auto_16983 ) ) ( not ( = ?auto_16987 ?auto_17008 ) ) ( not ( = ?auto_16987 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16969 ) ) ( not ( = ?auto_16960 ?auto_16982 ) ) ( not ( = ?auto_16961 ?auto_16969 ) ) ( not ( = ?auto_16961 ?auto_16982 ) ) ( not ( = ?auto_16962 ?auto_16969 ) ) ( not ( = ?auto_16962 ?auto_16982 ) ) ( not ( = ?auto_16963 ?auto_16969 ) ) ( not ( = ?auto_16963 ?auto_16982 ) ) ( not ( = ?auto_16964 ?auto_16969 ) ) ( not ( = ?auto_16964 ?auto_16982 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16982 ) ) ( not ( = ?auto_16969 ?auto_16987 ) ) ( not ( = ?auto_16969 ?auto_17000 ) ) ( not ( = ?auto_16969 ?auto_17004 ) ) ( not ( = ?auto_16969 ?auto_16983 ) ) ( not ( = ?auto_16969 ?auto_17008 ) ) ( not ( = ?auto_16969 ?auto_16997 ) ) ( not ( = ?auto_16982 ?auto_16987 ) ) ( not ( = ?auto_16982 ?auto_17000 ) ) ( not ( = ?auto_16982 ?auto_17004 ) ) ( not ( = ?auto_16982 ?auto_16983 ) ) ( not ( = ?auto_16982 ?auto_17008 ) ) ( not ( = ?auto_16982 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16968 ) ) ( not ( = ?auto_16960 ?auto_16989 ) ) ( not ( = ?auto_16961 ?auto_16968 ) ) ( not ( = ?auto_16961 ?auto_16989 ) ) ( not ( = ?auto_16962 ?auto_16968 ) ) ( not ( = ?auto_16962 ?auto_16989 ) ) ( not ( = ?auto_16963 ?auto_16968 ) ) ( not ( = ?auto_16963 ?auto_16989 ) ) ( not ( = ?auto_16964 ?auto_16968 ) ) ( not ( = ?auto_16964 ?auto_16989 ) ) ( not ( = ?auto_16967 ?auto_16968 ) ) ( not ( = ?auto_16967 ?auto_16989 ) ) ( not ( = ?auto_16965 ?auto_16968 ) ) ( not ( = ?auto_16965 ?auto_16989 ) ) ( not ( = ?auto_16968 ?auto_16982 ) ) ( not ( = ?auto_16968 ?auto_16987 ) ) ( not ( = ?auto_16968 ?auto_17000 ) ) ( not ( = ?auto_16968 ?auto_17004 ) ) ( not ( = ?auto_16968 ?auto_16983 ) ) ( not ( = ?auto_16968 ?auto_17008 ) ) ( not ( = ?auto_16968 ?auto_16997 ) ) ( not ( = ?auto_16991 ?auto_16993 ) ) ( not ( = ?auto_16991 ?auto_16984 ) ) ( not ( = ?auto_16991 ?auto_17001 ) ) ( not ( = ?auto_16991 ?auto_16980 ) ) ( not ( = ?auto_16991 ?auto_16998 ) ) ( not ( = ?auto_16991 ?auto_16992 ) ) ( not ( = ?auto_16988 ?auto_17005 ) ) ( not ( = ?auto_16988 ?auto_16985 ) ) ( not ( = ?auto_16988 ?auto_16999 ) ) ( not ( = ?auto_16988 ?auto_17007 ) ) ( not ( = ?auto_16988 ?auto_16996 ) ) ( not ( = ?auto_16988 ?auto_16990 ) ) ( not ( = ?auto_16989 ?auto_16982 ) ) ( not ( = ?auto_16989 ?auto_16987 ) ) ( not ( = ?auto_16989 ?auto_17000 ) ) ( not ( = ?auto_16989 ?auto_17004 ) ) ( not ( = ?auto_16989 ?auto_16983 ) ) ( not ( = ?auto_16989 ?auto_17008 ) ) ( not ( = ?auto_16989 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16966 ) ) ( not ( = ?auto_16960 ?auto_17006 ) ) ( not ( = ?auto_16961 ?auto_16966 ) ) ( not ( = ?auto_16961 ?auto_17006 ) ) ( not ( = ?auto_16962 ?auto_16966 ) ) ( not ( = ?auto_16962 ?auto_17006 ) ) ( not ( = ?auto_16963 ?auto_16966 ) ) ( not ( = ?auto_16963 ?auto_17006 ) ) ( not ( = ?auto_16964 ?auto_16966 ) ) ( not ( = ?auto_16964 ?auto_17006 ) ) ( not ( = ?auto_16967 ?auto_16966 ) ) ( not ( = ?auto_16967 ?auto_17006 ) ) ( not ( = ?auto_16965 ?auto_16966 ) ) ( not ( = ?auto_16965 ?auto_17006 ) ) ( not ( = ?auto_16969 ?auto_16966 ) ) ( not ( = ?auto_16969 ?auto_17006 ) ) ( not ( = ?auto_16966 ?auto_16989 ) ) ( not ( = ?auto_16966 ?auto_16982 ) ) ( not ( = ?auto_16966 ?auto_16987 ) ) ( not ( = ?auto_16966 ?auto_17000 ) ) ( not ( = ?auto_16966 ?auto_17004 ) ) ( not ( = ?auto_16966 ?auto_16983 ) ) ( not ( = ?auto_16966 ?auto_17008 ) ) ( not ( = ?auto_16966 ?auto_16997 ) ) ( not ( = ?auto_17006 ?auto_16989 ) ) ( not ( = ?auto_17006 ?auto_16982 ) ) ( not ( = ?auto_17006 ?auto_16987 ) ) ( not ( = ?auto_17006 ?auto_17000 ) ) ( not ( = ?auto_17006 ?auto_17004 ) ) ( not ( = ?auto_17006 ?auto_16983 ) ) ( not ( = ?auto_17006 ?auto_17008 ) ) ( not ( = ?auto_17006 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16971 ) ) ( not ( = ?auto_16960 ?auto_17003 ) ) ( not ( = ?auto_16961 ?auto_16971 ) ) ( not ( = ?auto_16961 ?auto_17003 ) ) ( not ( = ?auto_16962 ?auto_16971 ) ) ( not ( = ?auto_16962 ?auto_17003 ) ) ( not ( = ?auto_16963 ?auto_16971 ) ) ( not ( = ?auto_16963 ?auto_17003 ) ) ( not ( = ?auto_16964 ?auto_16971 ) ) ( not ( = ?auto_16964 ?auto_17003 ) ) ( not ( = ?auto_16967 ?auto_16971 ) ) ( not ( = ?auto_16967 ?auto_17003 ) ) ( not ( = ?auto_16965 ?auto_16971 ) ) ( not ( = ?auto_16965 ?auto_17003 ) ) ( not ( = ?auto_16969 ?auto_16971 ) ) ( not ( = ?auto_16969 ?auto_17003 ) ) ( not ( = ?auto_16968 ?auto_16971 ) ) ( not ( = ?auto_16968 ?auto_17003 ) ) ( not ( = ?auto_16971 ?auto_17006 ) ) ( not ( = ?auto_16971 ?auto_16989 ) ) ( not ( = ?auto_16971 ?auto_16982 ) ) ( not ( = ?auto_16971 ?auto_16987 ) ) ( not ( = ?auto_16971 ?auto_17000 ) ) ( not ( = ?auto_16971 ?auto_17004 ) ) ( not ( = ?auto_16971 ?auto_16983 ) ) ( not ( = ?auto_16971 ?auto_17008 ) ) ( not ( = ?auto_16971 ?auto_16997 ) ) ( not ( = ?auto_17003 ?auto_17006 ) ) ( not ( = ?auto_17003 ?auto_16989 ) ) ( not ( = ?auto_17003 ?auto_16982 ) ) ( not ( = ?auto_17003 ?auto_16987 ) ) ( not ( = ?auto_17003 ?auto_17000 ) ) ( not ( = ?auto_17003 ?auto_17004 ) ) ( not ( = ?auto_17003 ?auto_16983 ) ) ( not ( = ?auto_17003 ?auto_17008 ) ) ( not ( = ?auto_17003 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16970 ) ) ( not ( = ?auto_16960 ?auto_16981 ) ) ( not ( = ?auto_16961 ?auto_16970 ) ) ( not ( = ?auto_16961 ?auto_16981 ) ) ( not ( = ?auto_16962 ?auto_16970 ) ) ( not ( = ?auto_16962 ?auto_16981 ) ) ( not ( = ?auto_16963 ?auto_16970 ) ) ( not ( = ?auto_16963 ?auto_16981 ) ) ( not ( = ?auto_16964 ?auto_16970 ) ) ( not ( = ?auto_16964 ?auto_16981 ) ) ( not ( = ?auto_16967 ?auto_16970 ) ) ( not ( = ?auto_16967 ?auto_16981 ) ) ( not ( = ?auto_16965 ?auto_16970 ) ) ( not ( = ?auto_16965 ?auto_16981 ) ) ( not ( = ?auto_16969 ?auto_16970 ) ) ( not ( = ?auto_16969 ?auto_16981 ) ) ( not ( = ?auto_16968 ?auto_16970 ) ) ( not ( = ?auto_16968 ?auto_16981 ) ) ( not ( = ?auto_16966 ?auto_16970 ) ) ( not ( = ?auto_16966 ?auto_16981 ) ) ( not ( = ?auto_16970 ?auto_17003 ) ) ( not ( = ?auto_16970 ?auto_17006 ) ) ( not ( = ?auto_16970 ?auto_16989 ) ) ( not ( = ?auto_16970 ?auto_16982 ) ) ( not ( = ?auto_16970 ?auto_16987 ) ) ( not ( = ?auto_16970 ?auto_17000 ) ) ( not ( = ?auto_16970 ?auto_17004 ) ) ( not ( = ?auto_16970 ?auto_16983 ) ) ( not ( = ?auto_16970 ?auto_17008 ) ) ( not ( = ?auto_16970 ?auto_16997 ) ) ( not ( = ?auto_17009 ?auto_16991 ) ) ( not ( = ?auto_17009 ?auto_16998 ) ) ( not ( = ?auto_17009 ?auto_16993 ) ) ( not ( = ?auto_17009 ?auto_16984 ) ) ( not ( = ?auto_17009 ?auto_17001 ) ) ( not ( = ?auto_17009 ?auto_16980 ) ) ( not ( = ?auto_17009 ?auto_16992 ) ) ( not ( = ?auto_16986 ?auto_16988 ) ) ( not ( = ?auto_16986 ?auto_16996 ) ) ( not ( = ?auto_16986 ?auto_17005 ) ) ( not ( = ?auto_16986 ?auto_16985 ) ) ( not ( = ?auto_16986 ?auto_16999 ) ) ( not ( = ?auto_16986 ?auto_17007 ) ) ( not ( = ?auto_16986 ?auto_16990 ) ) ( not ( = ?auto_16981 ?auto_17003 ) ) ( not ( = ?auto_16981 ?auto_17006 ) ) ( not ( = ?auto_16981 ?auto_16989 ) ) ( not ( = ?auto_16981 ?auto_16982 ) ) ( not ( = ?auto_16981 ?auto_16987 ) ) ( not ( = ?auto_16981 ?auto_17000 ) ) ( not ( = ?auto_16981 ?auto_17004 ) ) ( not ( = ?auto_16981 ?auto_16983 ) ) ( not ( = ?auto_16981 ?auto_17008 ) ) ( not ( = ?auto_16981 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16972 ) ) ( not ( = ?auto_16960 ?auto_17002 ) ) ( not ( = ?auto_16961 ?auto_16972 ) ) ( not ( = ?auto_16961 ?auto_17002 ) ) ( not ( = ?auto_16962 ?auto_16972 ) ) ( not ( = ?auto_16962 ?auto_17002 ) ) ( not ( = ?auto_16963 ?auto_16972 ) ) ( not ( = ?auto_16963 ?auto_17002 ) ) ( not ( = ?auto_16964 ?auto_16972 ) ) ( not ( = ?auto_16964 ?auto_17002 ) ) ( not ( = ?auto_16967 ?auto_16972 ) ) ( not ( = ?auto_16967 ?auto_17002 ) ) ( not ( = ?auto_16965 ?auto_16972 ) ) ( not ( = ?auto_16965 ?auto_17002 ) ) ( not ( = ?auto_16969 ?auto_16972 ) ) ( not ( = ?auto_16969 ?auto_17002 ) ) ( not ( = ?auto_16968 ?auto_16972 ) ) ( not ( = ?auto_16968 ?auto_17002 ) ) ( not ( = ?auto_16966 ?auto_16972 ) ) ( not ( = ?auto_16966 ?auto_17002 ) ) ( not ( = ?auto_16971 ?auto_16972 ) ) ( not ( = ?auto_16971 ?auto_17002 ) ) ( not ( = ?auto_16972 ?auto_16981 ) ) ( not ( = ?auto_16972 ?auto_17003 ) ) ( not ( = ?auto_16972 ?auto_17006 ) ) ( not ( = ?auto_16972 ?auto_16989 ) ) ( not ( = ?auto_16972 ?auto_16982 ) ) ( not ( = ?auto_16972 ?auto_16987 ) ) ( not ( = ?auto_16972 ?auto_17000 ) ) ( not ( = ?auto_16972 ?auto_17004 ) ) ( not ( = ?auto_16972 ?auto_16983 ) ) ( not ( = ?auto_16972 ?auto_17008 ) ) ( not ( = ?auto_16972 ?auto_16997 ) ) ( not ( = ?auto_16995 ?auto_17009 ) ) ( not ( = ?auto_16995 ?auto_16991 ) ) ( not ( = ?auto_16995 ?auto_16998 ) ) ( not ( = ?auto_16995 ?auto_16993 ) ) ( not ( = ?auto_16995 ?auto_16984 ) ) ( not ( = ?auto_16995 ?auto_17001 ) ) ( not ( = ?auto_16995 ?auto_16980 ) ) ( not ( = ?auto_16995 ?auto_16992 ) ) ( not ( = ?auto_16994 ?auto_16986 ) ) ( not ( = ?auto_16994 ?auto_16988 ) ) ( not ( = ?auto_16994 ?auto_16996 ) ) ( not ( = ?auto_16994 ?auto_17005 ) ) ( not ( = ?auto_16994 ?auto_16985 ) ) ( not ( = ?auto_16994 ?auto_16999 ) ) ( not ( = ?auto_16994 ?auto_17007 ) ) ( not ( = ?auto_16994 ?auto_16990 ) ) ( not ( = ?auto_17002 ?auto_16981 ) ) ( not ( = ?auto_17002 ?auto_17003 ) ) ( not ( = ?auto_17002 ?auto_17006 ) ) ( not ( = ?auto_17002 ?auto_16989 ) ) ( not ( = ?auto_17002 ?auto_16982 ) ) ( not ( = ?auto_17002 ?auto_16987 ) ) ( not ( = ?auto_17002 ?auto_17000 ) ) ( not ( = ?auto_17002 ?auto_17004 ) ) ( not ( = ?auto_17002 ?auto_16983 ) ) ( not ( = ?auto_17002 ?auto_17008 ) ) ( not ( = ?auto_17002 ?auto_16997 ) ) ( not ( = ?auto_16960 ?auto_16973 ) ) ( not ( = ?auto_16960 ?auto_16974 ) ) ( not ( = ?auto_16961 ?auto_16973 ) ) ( not ( = ?auto_16961 ?auto_16974 ) ) ( not ( = ?auto_16962 ?auto_16973 ) ) ( not ( = ?auto_16962 ?auto_16974 ) ) ( not ( = ?auto_16963 ?auto_16973 ) ) ( not ( = ?auto_16963 ?auto_16974 ) ) ( not ( = ?auto_16964 ?auto_16973 ) ) ( not ( = ?auto_16964 ?auto_16974 ) ) ( not ( = ?auto_16967 ?auto_16973 ) ) ( not ( = ?auto_16967 ?auto_16974 ) ) ( not ( = ?auto_16965 ?auto_16973 ) ) ( not ( = ?auto_16965 ?auto_16974 ) ) ( not ( = ?auto_16969 ?auto_16973 ) ) ( not ( = ?auto_16969 ?auto_16974 ) ) ( not ( = ?auto_16968 ?auto_16973 ) ) ( not ( = ?auto_16968 ?auto_16974 ) ) ( not ( = ?auto_16966 ?auto_16973 ) ) ( not ( = ?auto_16966 ?auto_16974 ) ) ( not ( = ?auto_16971 ?auto_16973 ) ) ( not ( = ?auto_16971 ?auto_16974 ) ) ( not ( = ?auto_16970 ?auto_16973 ) ) ( not ( = ?auto_16970 ?auto_16974 ) ) ( not ( = ?auto_16973 ?auto_17002 ) ) ( not ( = ?auto_16973 ?auto_16981 ) ) ( not ( = ?auto_16973 ?auto_17003 ) ) ( not ( = ?auto_16973 ?auto_17006 ) ) ( not ( = ?auto_16973 ?auto_16989 ) ) ( not ( = ?auto_16973 ?auto_16982 ) ) ( not ( = ?auto_16973 ?auto_16987 ) ) ( not ( = ?auto_16973 ?auto_17000 ) ) ( not ( = ?auto_16973 ?auto_17004 ) ) ( not ( = ?auto_16973 ?auto_16983 ) ) ( not ( = ?auto_16973 ?auto_17008 ) ) ( not ( = ?auto_16973 ?auto_16997 ) ) ( not ( = ?auto_16979 ?auto_16995 ) ) ( not ( = ?auto_16979 ?auto_17009 ) ) ( not ( = ?auto_16979 ?auto_16991 ) ) ( not ( = ?auto_16979 ?auto_16998 ) ) ( not ( = ?auto_16979 ?auto_16993 ) ) ( not ( = ?auto_16979 ?auto_16984 ) ) ( not ( = ?auto_16979 ?auto_17001 ) ) ( not ( = ?auto_16979 ?auto_16980 ) ) ( not ( = ?auto_16979 ?auto_16992 ) ) ( not ( = ?auto_16975 ?auto_16994 ) ) ( not ( = ?auto_16975 ?auto_16986 ) ) ( not ( = ?auto_16975 ?auto_16988 ) ) ( not ( = ?auto_16975 ?auto_16996 ) ) ( not ( = ?auto_16975 ?auto_17005 ) ) ( not ( = ?auto_16975 ?auto_16985 ) ) ( not ( = ?auto_16975 ?auto_16999 ) ) ( not ( = ?auto_16975 ?auto_17007 ) ) ( not ( = ?auto_16975 ?auto_16990 ) ) ( not ( = ?auto_16974 ?auto_17002 ) ) ( not ( = ?auto_16974 ?auto_16981 ) ) ( not ( = ?auto_16974 ?auto_17003 ) ) ( not ( = ?auto_16974 ?auto_17006 ) ) ( not ( = ?auto_16974 ?auto_16989 ) ) ( not ( = ?auto_16974 ?auto_16982 ) ) ( not ( = ?auto_16974 ?auto_16987 ) ) ( not ( = ?auto_16974 ?auto_17000 ) ) ( not ( = ?auto_16974 ?auto_17004 ) ) ( not ( = ?auto_16974 ?auto_16983 ) ) ( not ( = ?auto_16974 ?auto_17008 ) ) ( not ( = ?auto_16974 ?auto_16997 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16960 ?auto_16961 ?auto_16962 ?auto_16963 ?auto_16964 ?auto_16967 ?auto_16965 ?auto_16969 ?auto_16968 ?auto_16966 ?auto_16971 ?auto_16970 ?auto_16972 )
      ( MAKE-1CRATE ?auto_16972 ?auto_16973 )
      ( MAKE-13CRATE-VERIFY ?auto_16960 ?auto_16961 ?auto_16962 ?auto_16963 ?auto_16964 ?auto_16967 ?auto_16965 ?auto_16969 ?auto_16968 ?auto_16966 ?auto_16971 ?auto_16970 ?auto_16972 ?auto_16973 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17012 - SURFACE
      ?auto_17013 - SURFACE
    )
    :vars
    (
      ?auto_17014 - HOIST
      ?auto_17015 - PLACE
      ?auto_17017 - PLACE
      ?auto_17018 - HOIST
      ?auto_17019 - SURFACE
      ?auto_17016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17014 ?auto_17015 ) ( SURFACE-AT ?auto_17012 ?auto_17015 ) ( CLEAR ?auto_17012 ) ( IS-CRATE ?auto_17013 ) ( AVAILABLE ?auto_17014 ) ( not ( = ?auto_17017 ?auto_17015 ) ) ( HOIST-AT ?auto_17018 ?auto_17017 ) ( AVAILABLE ?auto_17018 ) ( SURFACE-AT ?auto_17013 ?auto_17017 ) ( ON ?auto_17013 ?auto_17019 ) ( CLEAR ?auto_17013 ) ( TRUCK-AT ?auto_17016 ?auto_17015 ) ( not ( = ?auto_17012 ?auto_17013 ) ) ( not ( = ?auto_17012 ?auto_17019 ) ) ( not ( = ?auto_17013 ?auto_17019 ) ) ( not ( = ?auto_17014 ?auto_17018 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17016 ?auto_17015 ?auto_17017 )
      ( !LIFT ?auto_17018 ?auto_17013 ?auto_17019 ?auto_17017 )
      ( !LOAD ?auto_17018 ?auto_17013 ?auto_17016 ?auto_17017 )
      ( !DRIVE ?auto_17016 ?auto_17017 ?auto_17015 )
      ( !UNLOAD ?auto_17014 ?auto_17013 ?auto_17016 ?auto_17015 )
      ( !DROP ?auto_17014 ?auto_17013 ?auto_17012 ?auto_17015 )
      ( MAKE-1CRATE-VERIFY ?auto_17012 ?auto_17013 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_17035 - SURFACE
      ?auto_17036 - SURFACE
      ?auto_17037 - SURFACE
      ?auto_17038 - SURFACE
      ?auto_17039 - SURFACE
      ?auto_17042 - SURFACE
      ?auto_17040 - SURFACE
      ?auto_17044 - SURFACE
      ?auto_17043 - SURFACE
      ?auto_17041 - SURFACE
      ?auto_17046 - SURFACE
      ?auto_17045 - SURFACE
      ?auto_17047 - SURFACE
      ?auto_17048 - SURFACE
      ?auto_17049 - SURFACE
    )
    :vars
    (
      ?auto_17055 - HOIST
      ?auto_17053 - PLACE
      ?auto_17051 - PLACE
      ?auto_17050 - HOIST
      ?auto_17054 - SURFACE
      ?auto_17067 - PLACE
      ?auto_17085 - HOIST
      ?auto_17080 - SURFACE
      ?auto_17076 - PLACE
      ?auto_17068 - HOIST
      ?auto_17073 - SURFACE
      ?auto_17060 - PLACE
      ?auto_17063 - HOIST
      ?auto_17074 - SURFACE
      ?auto_17083 - PLACE
      ?auto_17079 - HOIST
      ?auto_17064 - SURFACE
      ?auto_17066 - PLACE
      ?auto_17075 - HOIST
      ?auto_17086 - SURFACE
      ?auto_17069 - SURFACE
      ?auto_17081 - PLACE
      ?auto_17057 - HOIST
      ?auto_17058 - SURFACE
      ?auto_17072 - PLACE
      ?auto_17082 - HOIST
      ?auto_17059 - SURFACE
      ?auto_17062 - PLACE
      ?auto_17056 - HOIST
      ?auto_17084 - SURFACE
      ?auto_17078 - SURFACE
      ?auto_17071 - SURFACE
      ?auto_17061 - PLACE
      ?auto_17077 - HOIST
      ?auto_17070 - SURFACE
      ?auto_17065 - SURFACE
      ?auto_17052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17055 ?auto_17053 ) ( IS-CRATE ?auto_17049 ) ( not ( = ?auto_17051 ?auto_17053 ) ) ( HOIST-AT ?auto_17050 ?auto_17051 ) ( SURFACE-AT ?auto_17049 ?auto_17051 ) ( ON ?auto_17049 ?auto_17054 ) ( CLEAR ?auto_17049 ) ( not ( = ?auto_17048 ?auto_17049 ) ) ( not ( = ?auto_17048 ?auto_17054 ) ) ( not ( = ?auto_17049 ?auto_17054 ) ) ( not ( = ?auto_17055 ?auto_17050 ) ) ( IS-CRATE ?auto_17048 ) ( not ( = ?auto_17067 ?auto_17053 ) ) ( HOIST-AT ?auto_17085 ?auto_17067 ) ( AVAILABLE ?auto_17085 ) ( SURFACE-AT ?auto_17048 ?auto_17067 ) ( ON ?auto_17048 ?auto_17080 ) ( CLEAR ?auto_17048 ) ( not ( = ?auto_17047 ?auto_17048 ) ) ( not ( = ?auto_17047 ?auto_17080 ) ) ( not ( = ?auto_17048 ?auto_17080 ) ) ( not ( = ?auto_17055 ?auto_17085 ) ) ( IS-CRATE ?auto_17047 ) ( not ( = ?auto_17076 ?auto_17053 ) ) ( HOIST-AT ?auto_17068 ?auto_17076 ) ( AVAILABLE ?auto_17068 ) ( SURFACE-AT ?auto_17047 ?auto_17076 ) ( ON ?auto_17047 ?auto_17073 ) ( CLEAR ?auto_17047 ) ( not ( = ?auto_17045 ?auto_17047 ) ) ( not ( = ?auto_17045 ?auto_17073 ) ) ( not ( = ?auto_17047 ?auto_17073 ) ) ( not ( = ?auto_17055 ?auto_17068 ) ) ( IS-CRATE ?auto_17045 ) ( not ( = ?auto_17060 ?auto_17053 ) ) ( HOIST-AT ?auto_17063 ?auto_17060 ) ( AVAILABLE ?auto_17063 ) ( SURFACE-AT ?auto_17045 ?auto_17060 ) ( ON ?auto_17045 ?auto_17074 ) ( CLEAR ?auto_17045 ) ( not ( = ?auto_17046 ?auto_17045 ) ) ( not ( = ?auto_17046 ?auto_17074 ) ) ( not ( = ?auto_17045 ?auto_17074 ) ) ( not ( = ?auto_17055 ?auto_17063 ) ) ( IS-CRATE ?auto_17046 ) ( not ( = ?auto_17083 ?auto_17053 ) ) ( HOIST-AT ?auto_17079 ?auto_17083 ) ( SURFACE-AT ?auto_17046 ?auto_17083 ) ( ON ?auto_17046 ?auto_17064 ) ( CLEAR ?auto_17046 ) ( not ( = ?auto_17041 ?auto_17046 ) ) ( not ( = ?auto_17041 ?auto_17064 ) ) ( not ( = ?auto_17046 ?auto_17064 ) ) ( not ( = ?auto_17055 ?auto_17079 ) ) ( IS-CRATE ?auto_17041 ) ( not ( = ?auto_17066 ?auto_17053 ) ) ( HOIST-AT ?auto_17075 ?auto_17066 ) ( SURFACE-AT ?auto_17041 ?auto_17066 ) ( ON ?auto_17041 ?auto_17086 ) ( CLEAR ?auto_17041 ) ( not ( = ?auto_17043 ?auto_17041 ) ) ( not ( = ?auto_17043 ?auto_17086 ) ) ( not ( = ?auto_17041 ?auto_17086 ) ) ( not ( = ?auto_17055 ?auto_17075 ) ) ( IS-CRATE ?auto_17043 ) ( AVAILABLE ?auto_17079 ) ( SURFACE-AT ?auto_17043 ?auto_17083 ) ( ON ?auto_17043 ?auto_17069 ) ( CLEAR ?auto_17043 ) ( not ( = ?auto_17044 ?auto_17043 ) ) ( not ( = ?auto_17044 ?auto_17069 ) ) ( not ( = ?auto_17043 ?auto_17069 ) ) ( IS-CRATE ?auto_17044 ) ( not ( = ?auto_17081 ?auto_17053 ) ) ( HOIST-AT ?auto_17057 ?auto_17081 ) ( SURFACE-AT ?auto_17044 ?auto_17081 ) ( ON ?auto_17044 ?auto_17058 ) ( CLEAR ?auto_17044 ) ( not ( = ?auto_17040 ?auto_17044 ) ) ( not ( = ?auto_17040 ?auto_17058 ) ) ( not ( = ?auto_17044 ?auto_17058 ) ) ( not ( = ?auto_17055 ?auto_17057 ) ) ( IS-CRATE ?auto_17040 ) ( not ( = ?auto_17072 ?auto_17053 ) ) ( HOIST-AT ?auto_17082 ?auto_17072 ) ( AVAILABLE ?auto_17082 ) ( SURFACE-AT ?auto_17040 ?auto_17072 ) ( ON ?auto_17040 ?auto_17059 ) ( CLEAR ?auto_17040 ) ( not ( = ?auto_17042 ?auto_17040 ) ) ( not ( = ?auto_17042 ?auto_17059 ) ) ( not ( = ?auto_17040 ?auto_17059 ) ) ( not ( = ?auto_17055 ?auto_17082 ) ) ( IS-CRATE ?auto_17042 ) ( not ( = ?auto_17062 ?auto_17053 ) ) ( HOIST-AT ?auto_17056 ?auto_17062 ) ( AVAILABLE ?auto_17056 ) ( SURFACE-AT ?auto_17042 ?auto_17062 ) ( ON ?auto_17042 ?auto_17084 ) ( CLEAR ?auto_17042 ) ( not ( = ?auto_17039 ?auto_17042 ) ) ( not ( = ?auto_17039 ?auto_17084 ) ) ( not ( = ?auto_17042 ?auto_17084 ) ) ( not ( = ?auto_17055 ?auto_17056 ) ) ( IS-CRATE ?auto_17039 ) ( AVAILABLE ?auto_17050 ) ( SURFACE-AT ?auto_17039 ?auto_17051 ) ( ON ?auto_17039 ?auto_17078 ) ( CLEAR ?auto_17039 ) ( not ( = ?auto_17038 ?auto_17039 ) ) ( not ( = ?auto_17038 ?auto_17078 ) ) ( not ( = ?auto_17039 ?auto_17078 ) ) ( IS-CRATE ?auto_17038 ) ( AVAILABLE ?auto_17075 ) ( SURFACE-AT ?auto_17038 ?auto_17066 ) ( ON ?auto_17038 ?auto_17071 ) ( CLEAR ?auto_17038 ) ( not ( = ?auto_17037 ?auto_17038 ) ) ( not ( = ?auto_17037 ?auto_17071 ) ) ( not ( = ?auto_17038 ?auto_17071 ) ) ( IS-CRATE ?auto_17037 ) ( not ( = ?auto_17061 ?auto_17053 ) ) ( HOIST-AT ?auto_17077 ?auto_17061 ) ( AVAILABLE ?auto_17077 ) ( SURFACE-AT ?auto_17037 ?auto_17061 ) ( ON ?auto_17037 ?auto_17070 ) ( CLEAR ?auto_17037 ) ( not ( = ?auto_17036 ?auto_17037 ) ) ( not ( = ?auto_17036 ?auto_17070 ) ) ( not ( = ?auto_17037 ?auto_17070 ) ) ( not ( = ?auto_17055 ?auto_17077 ) ) ( SURFACE-AT ?auto_17035 ?auto_17053 ) ( CLEAR ?auto_17035 ) ( IS-CRATE ?auto_17036 ) ( AVAILABLE ?auto_17055 ) ( AVAILABLE ?auto_17057 ) ( SURFACE-AT ?auto_17036 ?auto_17081 ) ( ON ?auto_17036 ?auto_17065 ) ( CLEAR ?auto_17036 ) ( TRUCK-AT ?auto_17052 ?auto_17053 ) ( not ( = ?auto_17035 ?auto_17036 ) ) ( not ( = ?auto_17035 ?auto_17065 ) ) ( not ( = ?auto_17036 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17037 ) ) ( not ( = ?auto_17035 ?auto_17070 ) ) ( not ( = ?auto_17037 ?auto_17065 ) ) ( not ( = ?auto_17061 ?auto_17081 ) ) ( not ( = ?auto_17077 ?auto_17057 ) ) ( not ( = ?auto_17070 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17038 ) ) ( not ( = ?auto_17035 ?auto_17071 ) ) ( not ( = ?auto_17036 ?auto_17038 ) ) ( not ( = ?auto_17036 ?auto_17071 ) ) ( not ( = ?auto_17038 ?auto_17070 ) ) ( not ( = ?auto_17038 ?auto_17065 ) ) ( not ( = ?auto_17066 ?auto_17061 ) ) ( not ( = ?auto_17066 ?auto_17081 ) ) ( not ( = ?auto_17075 ?auto_17077 ) ) ( not ( = ?auto_17075 ?auto_17057 ) ) ( not ( = ?auto_17071 ?auto_17070 ) ) ( not ( = ?auto_17071 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17039 ) ) ( not ( = ?auto_17035 ?auto_17078 ) ) ( not ( = ?auto_17036 ?auto_17039 ) ) ( not ( = ?auto_17036 ?auto_17078 ) ) ( not ( = ?auto_17037 ?auto_17039 ) ) ( not ( = ?auto_17037 ?auto_17078 ) ) ( not ( = ?auto_17039 ?auto_17071 ) ) ( not ( = ?auto_17039 ?auto_17070 ) ) ( not ( = ?auto_17039 ?auto_17065 ) ) ( not ( = ?auto_17051 ?auto_17066 ) ) ( not ( = ?auto_17051 ?auto_17061 ) ) ( not ( = ?auto_17051 ?auto_17081 ) ) ( not ( = ?auto_17050 ?auto_17075 ) ) ( not ( = ?auto_17050 ?auto_17077 ) ) ( not ( = ?auto_17050 ?auto_17057 ) ) ( not ( = ?auto_17078 ?auto_17071 ) ) ( not ( = ?auto_17078 ?auto_17070 ) ) ( not ( = ?auto_17078 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17042 ) ) ( not ( = ?auto_17035 ?auto_17084 ) ) ( not ( = ?auto_17036 ?auto_17042 ) ) ( not ( = ?auto_17036 ?auto_17084 ) ) ( not ( = ?auto_17037 ?auto_17042 ) ) ( not ( = ?auto_17037 ?auto_17084 ) ) ( not ( = ?auto_17038 ?auto_17042 ) ) ( not ( = ?auto_17038 ?auto_17084 ) ) ( not ( = ?auto_17042 ?auto_17078 ) ) ( not ( = ?auto_17042 ?auto_17071 ) ) ( not ( = ?auto_17042 ?auto_17070 ) ) ( not ( = ?auto_17042 ?auto_17065 ) ) ( not ( = ?auto_17062 ?auto_17051 ) ) ( not ( = ?auto_17062 ?auto_17066 ) ) ( not ( = ?auto_17062 ?auto_17061 ) ) ( not ( = ?auto_17062 ?auto_17081 ) ) ( not ( = ?auto_17056 ?auto_17050 ) ) ( not ( = ?auto_17056 ?auto_17075 ) ) ( not ( = ?auto_17056 ?auto_17077 ) ) ( not ( = ?auto_17056 ?auto_17057 ) ) ( not ( = ?auto_17084 ?auto_17078 ) ) ( not ( = ?auto_17084 ?auto_17071 ) ) ( not ( = ?auto_17084 ?auto_17070 ) ) ( not ( = ?auto_17084 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17040 ) ) ( not ( = ?auto_17035 ?auto_17059 ) ) ( not ( = ?auto_17036 ?auto_17040 ) ) ( not ( = ?auto_17036 ?auto_17059 ) ) ( not ( = ?auto_17037 ?auto_17040 ) ) ( not ( = ?auto_17037 ?auto_17059 ) ) ( not ( = ?auto_17038 ?auto_17040 ) ) ( not ( = ?auto_17038 ?auto_17059 ) ) ( not ( = ?auto_17039 ?auto_17040 ) ) ( not ( = ?auto_17039 ?auto_17059 ) ) ( not ( = ?auto_17040 ?auto_17084 ) ) ( not ( = ?auto_17040 ?auto_17078 ) ) ( not ( = ?auto_17040 ?auto_17071 ) ) ( not ( = ?auto_17040 ?auto_17070 ) ) ( not ( = ?auto_17040 ?auto_17065 ) ) ( not ( = ?auto_17072 ?auto_17062 ) ) ( not ( = ?auto_17072 ?auto_17051 ) ) ( not ( = ?auto_17072 ?auto_17066 ) ) ( not ( = ?auto_17072 ?auto_17061 ) ) ( not ( = ?auto_17072 ?auto_17081 ) ) ( not ( = ?auto_17082 ?auto_17056 ) ) ( not ( = ?auto_17082 ?auto_17050 ) ) ( not ( = ?auto_17082 ?auto_17075 ) ) ( not ( = ?auto_17082 ?auto_17077 ) ) ( not ( = ?auto_17082 ?auto_17057 ) ) ( not ( = ?auto_17059 ?auto_17084 ) ) ( not ( = ?auto_17059 ?auto_17078 ) ) ( not ( = ?auto_17059 ?auto_17071 ) ) ( not ( = ?auto_17059 ?auto_17070 ) ) ( not ( = ?auto_17059 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17044 ) ) ( not ( = ?auto_17035 ?auto_17058 ) ) ( not ( = ?auto_17036 ?auto_17044 ) ) ( not ( = ?auto_17036 ?auto_17058 ) ) ( not ( = ?auto_17037 ?auto_17044 ) ) ( not ( = ?auto_17037 ?auto_17058 ) ) ( not ( = ?auto_17038 ?auto_17044 ) ) ( not ( = ?auto_17038 ?auto_17058 ) ) ( not ( = ?auto_17039 ?auto_17044 ) ) ( not ( = ?auto_17039 ?auto_17058 ) ) ( not ( = ?auto_17042 ?auto_17044 ) ) ( not ( = ?auto_17042 ?auto_17058 ) ) ( not ( = ?auto_17044 ?auto_17059 ) ) ( not ( = ?auto_17044 ?auto_17084 ) ) ( not ( = ?auto_17044 ?auto_17078 ) ) ( not ( = ?auto_17044 ?auto_17071 ) ) ( not ( = ?auto_17044 ?auto_17070 ) ) ( not ( = ?auto_17044 ?auto_17065 ) ) ( not ( = ?auto_17058 ?auto_17059 ) ) ( not ( = ?auto_17058 ?auto_17084 ) ) ( not ( = ?auto_17058 ?auto_17078 ) ) ( not ( = ?auto_17058 ?auto_17071 ) ) ( not ( = ?auto_17058 ?auto_17070 ) ) ( not ( = ?auto_17058 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17043 ) ) ( not ( = ?auto_17035 ?auto_17069 ) ) ( not ( = ?auto_17036 ?auto_17043 ) ) ( not ( = ?auto_17036 ?auto_17069 ) ) ( not ( = ?auto_17037 ?auto_17043 ) ) ( not ( = ?auto_17037 ?auto_17069 ) ) ( not ( = ?auto_17038 ?auto_17043 ) ) ( not ( = ?auto_17038 ?auto_17069 ) ) ( not ( = ?auto_17039 ?auto_17043 ) ) ( not ( = ?auto_17039 ?auto_17069 ) ) ( not ( = ?auto_17042 ?auto_17043 ) ) ( not ( = ?auto_17042 ?auto_17069 ) ) ( not ( = ?auto_17040 ?auto_17043 ) ) ( not ( = ?auto_17040 ?auto_17069 ) ) ( not ( = ?auto_17043 ?auto_17058 ) ) ( not ( = ?auto_17043 ?auto_17059 ) ) ( not ( = ?auto_17043 ?auto_17084 ) ) ( not ( = ?auto_17043 ?auto_17078 ) ) ( not ( = ?auto_17043 ?auto_17071 ) ) ( not ( = ?auto_17043 ?auto_17070 ) ) ( not ( = ?auto_17043 ?auto_17065 ) ) ( not ( = ?auto_17083 ?auto_17081 ) ) ( not ( = ?auto_17083 ?auto_17072 ) ) ( not ( = ?auto_17083 ?auto_17062 ) ) ( not ( = ?auto_17083 ?auto_17051 ) ) ( not ( = ?auto_17083 ?auto_17066 ) ) ( not ( = ?auto_17083 ?auto_17061 ) ) ( not ( = ?auto_17079 ?auto_17057 ) ) ( not ( = ?auto_17079 ?auto_17082 ) ) ( not ( = ?auto_17079 ?auto_17056 ) ) ( not ( = ?auto_17079 ?auto_17050 ) ) ( not ( = ?auto_17079 ?auto_17075 ) ) ( not ( = ?auto_17079 ?auto_17077 ) ) ( not ( = ?auto_17069 ?auto_17058 ) ) ( not ( = ?auto_17069 ?auto_17059 ) ) ( not ( = ?auto_17069 ?auto_17084 ) ) ( not ( = ?auto_17069 ?auto_17078 ) ) ( not ( = ?auto_17069 ?auto_17071 ) ) ( not ( = ?auto_17069 ?auto_17070 ) ) ( not ( = ?auto_17069 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17041 ) ) ( not ( = ?auto_17035 ?auto_17086 ) ) ( not ( = ?auto_17036 ?auto_17041 ) ) ( not ( = ?auto_17036 ?auto_17086 ) ) ( not ( = ?auto_17037 ?auto_17041 ) ) ( not ( = ?auto_17037 ?auto_17086 ) ) ( not ( = ?auto_17038 ?auto_17041 ) ) ( not ( = ?auto_17038 ?auto_17086 ) ) ( not ( = ?auto_17039 ?auto_17041 ) ) ( not ( = ?auto_17039 ?auto_17086 ) ) ( not ( = ?auto_17042 ?auto_17041 ) ) ( not ( = ?auto_17042 ?auto_17086 ) ) ( not ( = ?auto_17040 ?auto_17041 ) ) ( not ( = ?auto_17040 ?auto_17086 ) ) ( not ( = ?auto_17044 ?auto_17041 ) ) ( not ( = ?auto_17044 ?auto_17086 ) ) ( not ( = ?auto_17041 ?auto_17069 ) ) ( not ( = ?auto_17041 ?auto_17058 ) ) ( not ( = ?auto_17041 ?auto_17059 ) ) ( not ( = ?auto_17041 ?auto_17084 ) ) ( not ( = ?auto_17041 ?auto_17078 ) ) ( not ( = ?auto_17041 ?auto_17071 ) ) ( not ( = ?auto_17041 ?auto_17070 ) ) ( not ( = ?auto_17041 ?auto_17065 ) ) ( not ( = ?auto_17086 ?auto_17069 ) ) ( not ( = ?auto_17086 ?auto_17058 ) ) ( not ( = ?auto_17086 ?auto_17059 ) ) ( not ( = ?auto_17086 ?auto_17084 ) ) ( not ( = ?auto_17086 ?auto_17078 ) ) ( not ( = ?auto_17086 ?auto_17071 ) ) ( not ( = ?auto_17086 ?auto_17070 ) ) ( not ( = ?auto_17086 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17046 ) ) ( not ( = ?auto_17035 ?auto_17064 ) ) ( not ( = ?auto_17036 ?auto_17046 ) ) ( not ( = ?auto_17036 ?auto_17064 ) ) ( not ( = ?auto_17037 ?auto_17046 ) ) ( not ( = ?auto_17037 ?auto_17064 ) ) ( not ( = ?auto_17038 ?auto_17046 ) ) ( not ( = ?auto_17038 ?auto_17064 ) ) ( not ( = ?auto_17039 ?auto_17046 ) ) ( not ( = ?auto_17039 ?auto_17064 ) ) ( not ( = ?auto_17042 ?auto_17046 ) ) ( not ( = ?auto_17042 ?auto_17064 ) ) ( not ( = ?auto_17040 ?auto_17046 ) ) ( not ( = ?auto_17040 ?auto_17064 ) ) ( not ( = ?auto_17044 ?auto_17046 ) ) ( not ( = ?auto_17044 ?auto_17064 ) ) ( not ( = ?auto_17043 ?auto_17046 ) ) ( not ( = ?auto_17043 ?auto_17064 ) ) ( not ( = ?auto_17046 ?auto_17086 ) ) ( not ( = ?auto_17046 ?auto_17069 ) ) ( not ( = ?auto_17046 ?auto_17058 ) ) ( not ( = ?auto_17046 ?auto_17059 ) ) ( not ( = ?auto_17046 ?auto_17084 ) ) ( not ( = ?auto_17046 ?auto_17078 ) ) ( not ( = ?auto_17046 ?auto_17071 ) ) ( not ( = ?auto_17046 ?auto_17070 ) ) ( not ( = ?auto_17046 ?auto_17065 ) ) ( not ( = ?auto_17064 ?auto_17086 ) ) ( not ( = ?auto_17064 ?auto_17069 ) ) ( not ( = ?auto_17064 ?auto_17058 ) ) ( not ( = ?auto_17064 ?auto_17059 ) ) ( not ( = ?auto_17064 ?auto_17084 ) ) ( not ( = ?auto_17064 ?auto_17078 ) ) ( not ( = ?auto_17064 ?auto_17071 ) ) ( not ( = ?auto_17064 ?auto_17070 ) ) ( not ( = ?auto_17064 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17045 ) ) ( not ( = ?auto_17035 ?auto_17074 ) ) ( not ( = ?auto_17036 ?auto_17045 ) ) ( not ( = ?auto_17036 ?auto_17074 ) ) ( not ( = ?auto_17037 ?auto_17045 ) ) ( not ( = ?auto_17037 ?auto_17074 ) ) ( not ( = ?auto_17038 ?auto_17045 ) ) ( not ( = ?auto_17038 ?auto_17074 ) ) ( not ( = ?auto_17039 ?auto_17045 ) ) ( not ( = ?auto_17039 ?auto_17074 ) ) ( not ( = ?auto_17042 ?auto_17045 ) ) ( not ( = ?auto_17042 ?auto_17074 ) ) ( not ( = ?auto_17040 ?auto_17045 ) ) ( not ( = ?auto_17040 ?auto_17074 ) ) ( not ( = ?auto_17044 ?auto_17045 ) ) ( not ( = ?auto_17044 ?auto_17074 ) ) ( not ( = ?auto_17043 ?auto_17045 ) ) ( not ( = ?auto_17043 ?auto_17074 ) ) ( not ( = ?auto_17041 ?auto_17045 ) ) ( not ( = ?auto_17041 ?auto_17074 ) ) ( not ( = ?auto_17045 ?auto_17064 ) ) ( not ( = ?auto_17045 ?auto_17086 ) ) ( not ( = ?auto_17045 ?auto_17069 ) ) ( not ( = ?auto_17045 ?auto_17058 ) ) ( not ( = ?auto_17045 ?auto_17059 ) ) ( not ( = ?auto_17045 ?auto_17084 ) ) ( not ( = ?auto_17045 ?auto_17078 ) ) ( not ( = ?auto_17045 ?auto_17071 ) ) ( not ( = ?auto_17045 ?auto_17070 ) ) ( not ( = ?auto_17045 ?auto_17065 ) ) ( not ( = ?auto_17060 ?auto_17083 ) ) ( not ( = ?auto_17060 ?auto_17066 ) ) ( not ( = ?auto_17060 ?auto_17081 ) ) ( not ( = ?auto_17060 ?auto_17072 ) ) ( not ( = ?auto_17060 ?auto_17062 ) ) ( not ( = ?auto_17060 ?auto_17051 ) ) ( not ( = ?auto_17060 ?auto_17061 ) ) ( not ( = ?auto_17063 ?auto_17079 ) ) ( not ( = ?auto_17063 ?auto_17075 ) ) ( not ( = ?auto_17063 ?auto_17057 ) ) ( not ( = ?auto_17063 ?auto_17082 ) ) ( not ( = ?auto_17063 ?auto_17056 ) ) ( not ( = ?auto_17063 ?auto_17050 ) ) ( not ( = ?auto_17063 ?auto_17077 ) ) ( not ( = ?auto_17074 ?auto_17064 ) ) ( not ( = ?auto_17074 ?auto_17086 ) ) ( not ( = ?auto_17074 ?auto_17069 ) ) ( not ( = ?auto_17074 ?auto_17058 ) ) ( not ( = ?auto_17074 ?auto_17059 ) ) ( not ( = ?auto_17074 ?auto_17084 ) ) ( not ( = ?auto_17074 ?auto_17078 ) ) ( not ( = ?auto_17074 ?auto_17071 ) ) ( not ( = ?auto_17074 ?auto_17070 ) ) ( not ( = ?auto_17074 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17047 ) ) ( not ( = ?auto_17035 ?auto_17073 ) ) ( not ( = ?auto_17036 ?auto_17047 ) ) ( not ( = ?auto_17036 ?auto_17073 ) ) ( not ( = ?auto_17037 ?auto_17047 ) ) ( not ( = ?auto_17037 ?auto_17073 ) ) ( not ( = ?auto_17038 ?auto_17047 ) ) ( not ( = ?auto_17038 ?auto_17073 ) ) ( not ( = ?auto_17039 ?auto_17047 ) ) ( not ( = ?auto_17039 ?auto_17073 ) ) ( not ( = ?auto_17042 ?auto_17047 ) ) ( not ( = ?auto_17042 ?auto_17073 ) ) ( not ( = ?auto_17040 ?auto_17047 ) ) ( not ( = ?auto_17040 ?auto_17073 ) ) ( not ( = ?auto_17044 ?auto_17047 ) ) ( not ( = ?auto_17044 ?auto_17073 ) ) ( not ( = ?auto_17043 ?auto_17047 ) ) ( not ( = ?auto_17043 ?auto_17073 ) ) ( not ( = ?auto_17041 ?auto_17047 ) ) ( not ( = ?auto_17041 ?auto_17073 ) ) ( not ( = ?auto_17046 ?auto_17047 ) ) ( not ( = ?auto_17046 ?auto_17073 ) ) ( not ( = ?auto_17047 ?auto_17074 ) ) ( not ( = ?auto_17047 ?auto_17064 ) ) ( not ( = ?auto_17047 ?auto_17086 ) ) ( not ( = ?auto_17047 ?auto_17069 ) ) ( not ( = ?auto_17047 ?auto_17058 ) ) ( not ( = ?auto_17047 ?auto_17059 ) ) ( not ( = ?auto_17047 ?auto_17084 ) ) ( not ( = ?auto_17047 ?auto_17078 ) ) ( not ( = ?auto_17047 ?auto_17071 ) ) ( not ( = ?auto_17047 ?auto_17070 ) ) ( not ( = ?auto_17047 ?auto_17065 ) ) ( not ( = ?auto_17076 ?auto_17060 ) ) ( not ( = ?auto_17076 ?auto_17083 ) ) ( not ( = ?auto_17076 ?auto_17066 ) ) ( not ( = ?auto_17076 ?auto_17081 ) ) ( not ( = ?auto_17076 ?auto_17072 ) ) ( not ( = ?auto_17076 ?auto_17062 ) ) ( not ( = ?auto_17076 ?auto_17051 ) ) ( not ( = ?auto_17076 ?auto_17061 ) ) ( not ( = ?auto_17068 ?auto_17063 ) ) ( not ( = ?auto_17068 ?auto_17079 ) ) ( not ( = ?auto_17068 ?auto_17075 ) ) ( not ( = ?auto_17068 ?auto_17057 ) ) ( not ( = ?auto_17068 ?auto_17082 ) ) ( not ( = ?auto_17068 ?auto_17056 ) ) ( not ( = ?auto_17068 ?auto_17050 ) ) ( not ( = ?auto_17068 ?auto_17077 ) ) ( not ( = ?auto_17073 ?auto_17074 ) ) ( not ( = ?auto_17073 ?auto_17064 ) ) ( not ( = ?auto_17073 ?auto_17086 ) ) ( not ( = ?auto_17073 ?auto_17069 ) ) ( not ( = ?auto_17073 ?auto_17058 ) ) ( not ( = ?auto_17073 ?auto_17059 ) ) ( not ( = ?auto_17073 ?auto_17084 ) ) ( not ( = ?auto_17073 ?auto_17078 ) ) ( not ( = ?auto_17073 ?auto_17071 ) ) ( not ( = ?auto_17073 ?auto_17070 ) ) ( not ( = ?auto_17073 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17048 ) ) ( not ( = ?auto_17035 ?auto_17080 ) ) ( not ( = ?auto_17036 ?auto_17048 ) ) ( not ( = ?auto_17036 ?auto_17080 ) ) ( not ( = ?auto_17037 ?auto_17048 ) ) ( not ( = ?auto_17037 ?auto_17080 ) ) ( not ( = ?auto_17038 ?auto_17048 ) ) ( not ( = ?auto_17038 ?auto_17080 ) ) ( not ( = ?auto_17039 ?auto_17048 ) ) ( not ( = ?auto_17039 ?auto_17080 ) ) ( not ( = ?auto_17042 ?auto_17048 ) ) ( not ( = ?auto_17042 ?auto_17080 ) ) ( not ( = ?auto_17040 ?auto_17048 ) ) ( not ( = ?auto_17040 ?auto_17080 ) ) ( not ( = ?auto_17044 ?auto_17048 ) ) ( not ( = ?auto_17044 ?auto_17080 ) ) ( not ( = ?auto_17043 ?auto_17048 ) ) ( not ( = ?auto_17043 ?auto_17080 ) ) ( not ( = ?auto_17041 ?auto_17048 ) ) ( not ( = ?auto_17041 ?auto_17080 ) ) ( not ( = ?auto_17046 ?auto_17048 ) ) ( not ( = ?auto_17046 ?auto_17080 ) ) ( not ( = ?auto_17045 ?auto_17048 ) ) ( not ( = ?auto_17045 ?auto_17080 ) ) ( not ( = ?auto_17048 ?auto_17073 ) ) ( not ( = ?auto_17048 ?auto_17074 ) ) ( not ( = ?auto_17048 ?auto_17064 ) ) ( not ( = ?auto_17048 ?auto_17086 ) ) ( not ( = ?auto_17048 ?auto_17069 ) ) ( not ( = ?auto_17048 ?auto_17058 ) ) ( not ( = ?auto_17048 ?auto_17059 ) ) ( not ( = ?auto_17048 ?auto_17084 ) ) ( not ( = ?auto_17048 ?auto_17078 ) ) ( not ( = ?auto_17048 ?auto_17071 ) ) ( not ( = ?auto_17048 ?auto_17070 ) ) ( not ( = ?auto_17048 ?auto_17065 ) ) ( not ( = ?auto_17067 ?auto_17076 ) ) ( not ( = ?auto_17067 ?auto_17060 ) ) ( not ( = ?auto_17067 ?auto_17083 ) ) ( not ( = ?auto_17067 ?auto_17066 ) ) ( not ( = ?auto_17067 ?auto_17081 ) ) ( not ( = ?auto_17067 ?auto_17072 ) ) ( not ( = ?auto_17067 ?auto_17062 ) ) ( not ( = ?auto_17067 ?auto_17051 ) ) ( not ( = ?auto_17067 ?auto_17061 ) ) ( not ( = ?auto_17085 ?auto_17068 ) ) ( not ( = ?auto_17085 ?auto_17063 ) ) ( not ( = ?auto_17085 ?auto_17079 ) ) ( not ( = ?auto_17085 ?auto_17075 ) ) ( not ( = ?auto_17085 ?auto_17057 ) ) ( not ( = ?auto_17085 ?auto_17082 ) ) ( not ( = ?auto_17085 ?auto_17056 ) ) ( not ( = ?auto_17085 ?auto_17050 ) ) ( not ( = ?auto_17085 ?auto_17077 ) ) ( not ( = ?auto_17080 ?auto_17073 ) ) ( not ( = ?auto_17080 ?auto_17074 ) ) ( not ( = ?auto_17080 ?auto_17064 ) ) ( not ( = ?auto_17080 ?auto_17086 ) ) ( not ( = ?auto_17080 ?auto_17069 ) ) ( not ( = ?auto_17080 ?auto_17058 ) ) ( not ( = ?auto_17080 ?auto_17059 ) ) ( not ( = ?auto_17080 ?auto_17084 ) ) ( not ( = ?auto_17080 ?auto_17078 ) ) ( not ( = ?auto_17080 ?auto_17071 ) ) ( not ( = ?auto_17080 ?auto_17070 ) ) ( not ( = ?auto_17080 ?auto_17065 ) ) ( not ( = ?auto_17035 ?auto_17049 ) ) ( not ( = ?auto_17035 ?auto_17054 ) ) ( not ( = ?auto_17036 ?auto_17049 ) ) ( not ( = ?auto_17036 ?auto_17054 ) ) ( not ( = ?auto_17037 ?auto_17049 ) ) ( not ( = ?auto_17037 ?auto_17054 ) ) ( not ( = ?auto_17038 ?auto_17049 ) ) ( not ( = ?auto_17038 ?auto_17054 ) ) ( not ( = ?auto_17039 ?auto_17049 ) ) ( not ( = ?auto_17039 ?auto_17054 ) ) ( not ( = ?auto_17042 ?auto_17049 ) ) ( not ( = ?auto_17042 ?auto_17054 ) ) ( not ( = ?auto_17040 ?auto_17049 ) ) ( not ( = ?auto_17040 ?auto_17054 ) ) ( not ( = ?auto_17044 ?auto_17049 ) ) ( not ( = ?auto_17044 ?auto_17054 ) ) ( not ( = ?auto_17043 ?auto_17049 ) ) ( not ( = ?auto_17043 ?auto_17054 ) ) ( not ( = ?auto_17041 ?auto_17049 ) ) ( not ( = ?auto_17041 ?auto_17054 ) ) ( not ( = ?auto_17046 ?auto_17049 ) ) ( not ( = ?auto_17046 ?auto_17054 ) ) ( not ( = ?auto_17045 ?auto_17049 ) ) ( not ( = ?auto_17045 ?auto_17054 ) ) ( not ( = ?auto_17047 ?auto_17049 ) ) ( not ( = ?auto_17047 ?auto_17054 ) ) ( not ( = ?auto_17049 ?auto_17080 ) ) ( not ( = ?auto_17049 ?auto_17073 ) ) ( not ( = ?auto_17049 ?auto_17074 ) ) ( not ( = ?auto_17049 ?auto_17064 ) ) ( not ( = ?auto_17049 ?auto_17086 ) ) ( not ( = ?auto_17049 ?auto_17069 ) ) ( not ( = ?auto_17049 ?auto_17058 ) ) ( not ( = ?auto_17049 ?auto_17059 ) ) ( not ( = ?auto_17049 ?auto_17084 ) ) ( not ( = ?auto_17049 ?auto_17078 ) ) ( not ( = ?auto_17049 ?auto_17071 ) ) ( not ( = ?auto_17049 ?auto_17070 ) ) ( not ( = ?auto_17049 ?auto_17065 ) ) ( not ( = ?auto_17054 ?auto_17080 ) ) ( not ( = ?auto_17054 ?auto_17073 ) ) ( not ( = ?auto_17054 ?auto_17074 ) ) ( not ( = ?auto_17054 ?auto_17064 ) ) ( not ( = ?auto_17054 ?auto_17086 ) ) ( not ( = ?auto_17054 ?auto_17069 ) ) ( not ( = ?auto_17054 ?auto_17058 ) ) ( not ( = ?auto_17054 ?auto_17059 ) ) ( not ( = ?auto_17054 ?auto_17084 ) ) ( not ( = ?auto_17054 ?auto_17078 ) ) ( not ( = ?auto_17054 ?auto_17071 ) ) ( not ( = ?auto_17054 ?auto_17070 ) ) ( not ( = ?auto_17054 ?auto_17065 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17039 ?auto_17042 ?auto_17040 ?auto_17044 ?auto_17043 ?auto_17041 ?auto_17046 ?auto_17045 ?auto_17047 ?auto_17048 )
      ( MAKE-1CRATE ?auto_17048 ?auto_17049 )
      ( MAKE-14CRATE-VERIFY ?auto_17035 ?auto_17036 ?auto_17037 ?auto_17038 ?auto_17039 ?auto_17042 ?auto_17040 ?auto_17044 ?auto_17043 ?auto_17041 ?auto_17046 ?auto_17045 ?auto_17047 ?auto_17048 ?auto_17049 ) )
  )

)

