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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112445 - SURFACE
      ?auto_112446 - SURFACE
    )
    :vars
    (
      ?auto_112447 - HOIST
      ?auto_112448 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112447 ?auto_112448 ) ( SURFACE-AT ?auto_112445 ?auto_112448 ) ( CLEAR ?auto_112445 ) ( LIFTING ?auto_112447 ?auto_112446 ) ( IS-CRATE ?auto_112446 ) ( not ( = ?auto_112445 ?auto_112446 ) ) )
    :subtasks
    ( ( !DROP ?auto_112447 ?auto_112446 ?auto_112445 ?auto_112448 )
      ( MAKE-1CRATE-VERIFY ?auto_112445 ?auto_112446 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112449 - SURFACE
      ?auto_112450 - SURFACE
    )
    :vars
    (
      ?auto_112451 - HOIST
      ?auto_112452 - PLACE
      ?auto_112453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112451 ?auto_112452 ) ( SURFACE-AT ?auto_112449 ?auto_112452 ) ( CLEAR ?auto_112449 ) ( IS-CRATE ?auto_112450 ) ( not ( = ?auto_112449 ?auto_112450 ) ) ( TRUCK-AT ?auto_112453 ?auto_112452 ) ( AVAILABLE ?auto_112451 ) ( IN ?auto_112450 ?auto_112453 ) )
    :subtasks
    ( ( !UNLOAD ?auto_112451 ?auto_112450 ?auto_112453 ?auto_112452 )
      ( MAKE-1CRATE ?auto_112449 ?auto_112450 )
      ( MAKE-1CRATE-VERIFY ?auto_112449 ?auto_112450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112454 - SURFACE
      ?auto_112455 - SURFACE
    )
    :vars
    (
      ?auto_112457 - HOIST
      ?auto_112458 - PLACE
      ?auto_112456 - TRUCK
      ?auto_112459 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112457 ?auto_112458 ) ( SURFACE-AT ?auto_112454 ?auto_112458 ) ( CLEAR ?auto_112454 ) ( IS-CRATE ?auto_112455 ) ( not ( = ?auto_112454 ?auto_112455 ) ) ( AVAILABLE ?auto_112457 ) ( IN ?auto_112455 ?auto_112456 ) ( TRUCK-AT ?auto_112456 ?auto_112459 ) ( not ( = ?auto_112459 ?auto_112458 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_112456 ?auto_112459 ?auto_112458 )
      ( MAKE-1CRATE ?auto_112454 ?auto_112455 )
      ( MAKE-1CRATE-VERIFY ?auto_112454 ?auto_112455 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112460 - SURFACE
      ?auto_112461 - SURFACE
    )
    :vars
    (
      ?auto_112462 - HOIST
      ?auto_112463 - PLACE
      ?auto_112465 - TRUCK
      ?auto_112464 - PLACE
      ?auto_112466 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112462 ?auto_112463 ) ( SURFACE-AT ?auto_112460 ?auto_112463 ) ( CLEAR ?auto_112460 ) ( IS-CRATE ?auto_112461 ) ( not ( = ?auto_112460 ?auto_112461 ) ) ( AVAILABLE ?auto_112462 ) ( TRUCK-AT ?auto_112465 ?auto_112464 ) ( not ( = ?auto_112464 ?auto_112463 ) ) ( HOIST-AT ?auto_112466 ?auto_112464 ) ( LIFTING ?auto_112466 ?auto_112461 ) ( not ( = ?auto_112462 ?auto_112466 ) ) )
    :subtasks
    ( ( !LOAD ?auto_112466 ?auto_112461 ?auto_112465 ?auto_112464 )
      ( MAKE-1CRATE ?auto_112460 ?auto_112461 )
      ( MAKE-1CRATE-VERIFY ?auto_112460 ?auto_112461 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112467 - SURFACE
      ?auto_112468 - SURFACE
    )
    :vars
    (
      ?auto_112473 - HOIST
      ?auto_112472 - PLACE
      ?auto_112471 - TRUCK
      ?auto_112469 - PLACE
      ?auto_112470 - HOIST
      ?auto_112474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112473 ?auto_112472 ) ( SURFACE-AT ?auto_112467 ?auto_112472 ) ( CLEAR ?auto_112467 ) ( IS-CRATE ?auto_112468 ) ( not ( = ?auto_112467 ?auto_112468 ) ) ( AVAILABLE ?auto_112473 ) ( TRUCK-AT ?auto_112471 ?auto_112469 ) ( not ( = ?auto_112469 ?auto_112472 ) ) ( HOIST-AT ?auto_112470 ?auto_112469 ) ( not ( = ?auto_112473 ?auto_112470 ) ) ( AVAILABLE ?auto_112470 ) ( SURFACE-AT ?auto_112468 ?auto_112469 ) ( ON ?auto_112468 ?auto_112474 ) ( CLEAR ?auto_112468 ) ( not ( = ?auto_112467 ?auto_112474 ) ) ( not ( = ?auto_112468 ?auto_112474 ) ) )
    :subtasks
    ( ( !LIFT ?auto_112470 ?auto_112468 ?auto_112474 ?auto_112469 )
      ( MAKE-1CRATE ?auto_112467 ?auto_112468 )
      ( MAKE-1CRATE-VERIFY ?auto_112467 ?auto_112468 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112475 - SURFACE
      ?auto_112476 - SURFACE
    )
    :vars
    (
      ?auto_112477 - HOIST
      ?auto_112479 - PLACE
      ?auto_112480 - PLACE
      ?auto_112481 - HOIST
      ?auto_112478 - SURFACE
      ?auto_112482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112477 ?auto_112479 ) ( SURFACE-AT ?auto_112475 ?auto_112479 ) ( CLEAR ?auto_112475 ) ( IS-CRATE ?auto_112476 ) ( not ( = ?auto_112475 ?auto_112476 ) ) ( AVAILABLE ?auto_112477 ) ( not ( = ?auto_112480 ?auto_112479 ) ) ( HOIST-AT ?auto_112481 ?auto_112480 ) ( not ( = ?auto_112477 ?auto_112481 ) ) ( AVAILABLE ?auto_112481 ) ( SURFACE-AT ?auto_112476 ?auto_112480 ) ( ON ?auto_112476 ?auto_112478 ) ( CLEAR ?auto_112476 ) ( not ( = ?auto_112475 ?auto_112478 ) ) ( not ( = ?auto_112476 ?auto_112478 ) ) ( TRUCK-AT ?auto_112482 ?auto_112479 ) )
    :subtasks
    ( ( !DRIVE ?auto_112482 ?auto_112479 ?auto_112480 )
      ( MAKE-1CRATE ?auto_112475 ?auto_112476 )
      ( MAKE-1CRATE-VERIFY ?auto_112475 ?auto_112476 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112492 - SURFACE
      ?auto_112493 - SURFACE
      ?auto_112494 - SURFACE
    )
    :vars
    (
      ?auto_112496 - HOIST
      ?auto_112495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112496 ?auto_112495 ) ( SURFACE-AT ?auto_112493 ?auto_112495 ) ( CLEAR ?auto_112493 ) ( LIFTING ?auto_112496 ?auto_112494 ) ( IS-CRATE ?auto_112494 ) ( not ( = ?auto_112493 ?auto_112494 ) ) ( ON ?auto_112493 ?auto_112492 ) ( not ( = ?auto_112492 ?auto_112493 ) ) ( not ( = ?auto_112492 ?auto_112494 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112493 ?auto_112494 )
      ( MAKE-2CRATE-VERIFY ?auto_112492 ?auto_112493 ?auto_112494 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112502 - SURFACE
      ?auto_112503 - SURFACE
      ?auto_112504 - SURFACE
    )
    :vars
    (
      ?auto_112507 - HOIST
      ?auto_112505 - PLACE
      ?auto_112506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112507 ?auto_112505 ) ( SURFACE-AT ?auto_112503 ?auto_112505 ) ( CLEAR ?auto_112503 ) ( IS-CRATE ?auto_112504 ) ( not ( = ?auto_112503 ?auto_112504 ) ) ( TRUCK-AT ?auto_112506 ?auto_112505 ) ( AVAILABLE ?auto_112507 ) ( IN ?auto_112504 ?auto_112506 ) ( ON ?auto_112503 ?auto_112502 ) ( not ( = ?auto_112502 ?auto_112503 ) ) ( not ( = ?auto_112502 ?auto_112504 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112503 ?auto_112504 )
      ( MAKE-2CRATE-VERIFY ?auto_112502 ?auto_112503 ?auto_112504 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112508 - SURFACE
      ?auto_112509 - SURFACE
    )
    :vars
    (
      ?auto_112513 - HOIST
      ?auto_112511 - PLACE
      ?auto_112510 - TRUCK
      ?auto_112512 - SURFACE
      ?auto_112514 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112513 ?auto_112511 ) ( SURFACE-AT ?auto_112508 ?auto_112511 ) ( CLEAR ?auto_112508 ) ( IS-CRATE ?auto_112509 ) ( not ( = ?auto_112508 ?auto_112509 ) ) ( AVAILABLE ?auto_112513 ) ( IN ?auto_112509 ?auto_112510 ) ( ON ?auto_112508 ?auto_112512 ) ( not ( = ?auto_112512 ?auto_112508 ) ) ( not ( = ?auto_112512 ?auto_112509 ) ) ( TRUCK-AT ?auto_112510 ?auto_112514 ) ( not ( = ?auto_112514 ?auto_112511 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_112510 ?auto_112514 ?auto_112511 )
      ( MAKE-2CRATE ?auto_112512 ?auto_112508 ?auto_112509 )
      ( MAKE-1CRATE-VERIFY ?auto_112508 ?auto_112509 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112515 - SURFACE
      ?auto_112516 - SURFACE
      ?auto_112517 - SURFACE
    )
    :vars
    (
      ?auto_112521 - HOIST
      ?auto_112518 - PLACE
      ?auto_112519 - TRUCK
      ?auto_112520 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112521 ?auto_112518 ) ( SURFACE-AT ?auto_112516 ?auto_112518 ) ( CLEAR ?auto_112516 ) ( IS-CRATE ?auto_112517 ) ( not ( = ?auto_112516 ?auto_112517 ) ) ( AVAILABLE ?auto_112521 ) ( IN ?auto_112517 ?auto_112519 ) ( ON ?auto_112516 ?auto_112515 ) ( not ( = ?auto_112515 ?auto_112516 ) ) ( not ( = ?auto_112515 ?auto_112517 ) ) ( TRUCK-AT ?auto_112519 ?auto_112520 ) ( not ( = ?auto_112520 ?auto_112518 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112516 ?auto_112517 )
      ( MAKE-2CRATE-VERIFY ?auto_112515 ?auto_112516 ?auto_112517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112522 - SURFACE
      ?auto_112523 - SURFACE
    )
    :vars
    (
      ?auto_112524 - HOIST
      ?auto_112525 - PLACE
      ?auto_112528 - SURFACE
      ?auto_112527 - TRUCK
      ?auto_112526 - PLACE
      ?auto_112529 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112524 ?auto_112525 ) ( SURFACE-AT ?auto_112522 ?auto_112525 ) ( CLEAR ?auto_112522 ) ( IS-CRATE ?auto_112523 ) ( not ( = ?auto_112522 ?auto_112523 ) ) ( AVAILABLE ?auto_112524 ) ( ON ?auto_112522 ?auto_112528 ) ( not ( = ?auto_112528 ?auto_112522 ) ) ( not ( = ?auto_112528 ?auto_112523 ) ) ( TRUCK-AT ?auto_112527 ?auto_112526 ) ( not ( = ?auto_112526 ?auto_112525 ) ) ( HOIST-AT ?auto_112529 ?auto_112526 ) ( LIFTING ?auto_112529 ?auto_112523 ) ( not ( = ?auto_112524 ?auto_112529 ) ) )
    :subtasks
    ( ( !LOAD ?auto_112529 ?auto_112523 ?auto_112527 ?auto_112526 )
      ( MAKE-2CRATE ?auto_112528 ?auto_112522 ?auto_112523 )
      ( MAKE-1CRATE-VERIFY ?auto_112522 ?auto_112523 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112530 - SURFACE
      ?auto_112531 - SURFACE
      ?auto_112532 - SURFACE
    )
    :vars
    (
      ?auto_112534 - HOIST
      ?auto_112535 - PLACE
      ?auto_112533 - TRUCK
      ?auto_112536 - PLACE
      ?auto_112537 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112534 ?auto_112535 ) ( SURFACE-AT ?auto_112531 ?auto_112535 ) ( CLEAR ?auto_112531 ) ( IS-CRATE ?auto_112532 ) ( not ( = ?auto_112531 ?auto_112532 ) ) ( AVAILABLE ?auto_112534 ) ( ON ?auto_112531 ?auto_112530 ) ( not ( = ?auto_112530 ?auto_112531 ) ) ( not ( = ?auto_112530 ?auto_112532 ) ) ( TRUCK-AT ?auto_112533 ?auto_112536 ) ( not ( = ?auto_112536 ?auto_112535 ) ) ( HOIST-AT ?auto_112537 ?auto_112536 ) ( LIFTING ?auto_112537 ?auto_112532 ) ( not ( = ?auto_112534 ?auto_112537 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112531 ?auto_112532 )
      ( MAKE-2CRATE-VERIFY ?auto_112530 ?auto_112531 ?auto_112532 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112538 - SURFACE
      ?auto_112539 - SURFACE
    )
    :vars
    (
      ?auto_112542 - HOIST
      ?auto_112544 - PLACE
      ?auto_112545 - SURFACE
      ?auto_112541 - TRUCK
      ?auto_112543 - PLACE
      ?auto_112540 - HOIST
      ?auto_112546 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112542 ?auto_112544 ) ( SURFACE-AT ?auto_112538 ?auto_112544 ) ( CLEAR ?auto_112538 ) ( IS-CRATE ?auto_112539 ) ( not ( = ?auto_112538 ?auto_112539 ) ) ( AVAILABLE ?auto_112542 ) ( ON ?auto_112538 ?auto_112545 ) ( not ( = ?auto_112545 ?auto_112538 ) ) ( not ( = ?auto_112545 ?auto_112539 ) ) ( TRUCK-AT ?auto_112541 ?auto_112543 ) ( not ( = ?auto_112543 ?auto_112544 ) ) ( HOIST-AT ?auto_112540 ?auto_112543 ) ( not ( = ?auto_112542 ?auto_112540 ) ) ( AVAILABLE ?auto_112540 ) ( SURFACE-AT ?auto_112539 ?auto_112543 ) ( ON ?auto_112539 ?auto_112546 ) ( CLEAR ?auto_112539 ) ( not ( = ?auto_112538 ?auto_112546 ) ) ( not ( = ?auto_112539 ?auto_112546 ) ) ( not ( = ?auto_112545 ?auto_112546 ) ) )
    :subtasks
    ( ( !LIFT ?auto_112540 ?auto_112539 ?auto_112546 ?auto_112543 )
      ( MAKE-2CRATE ?auto_112545 ?auto_112538 ?auto_112539 )
      ( MAKE-1CRATE-VERIFY ?auto_112538 ?auto_112539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112547 - SURFACE
      ?auto_112548 - SURFACE
      ?auto_112549 - SURFACE
    )
    :vars
    (
      ?auto_112552 - HOIST
      ?auto_112551 - PLACE
      ?auto_112553 - TRUCK
      ?auto_112550 - PLACE
      ?auto_112555 - HOIST
      ?auto_112554 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112552 ?auto_112551 ) ( SURFACE-AT ?auto_112548 ?auto_112551 ) ( CLEAR ?auto_112548 ) ( IS-CRATE ?auto_112549 ) ( not ( = ?auto_112548 ?auto_112549 ) ) ( AVAILABLE ?auto_112552 ) ( ON ?auto_112548 ?auto_112547 ) ( not ( = ?auto_112547 ?auto_112548 ) ) ( not ( = ?auto_112547 ?auto_112549 ) ) ( TRUCK-AT ?auto_112553 ?auto_112550 ) ( not ( = ?auto_112550 ?auto_112551 ) ) ( HOIST-AT ?auto_112555 ?auto_112550 ) ( not ( = ?auto_112552 ?auto_112555 ) ) ( AVAILABLE ?auto_112555 ) ( SURFACE-AT ?auto_112549 ?auto_112550 ) ( ON ?auto_112549 ?auto_112554 ) ( CLEAR ?auto_112549 ) ( not ( = ?auto_112548 ?auto_112554 ) ) ( not ( = ?auto_112549 ?auto_112554 ) ) ( not ( = ?auto_112547 ?auto_112554 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112548 ?auto_112549 )
      ( MAKE-2CRATE-VERIFY ?auto_112547 ?auto_112548 ?auto_112549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112556 - SURFACE
      ?auto_112557 - SURFACE
    )
    :vars
    (
      ?auto_112564 - HOIST
      ?auto_112561 - PLACE
      ?auto_112559 - SURFACE
      ?auto_112560 - PLACE
      ?auto_112563 - HOIST
      ?auto_112562 - SURFACE
      ?auto_112558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112564 ?auto_112561 ) ( SURFACE-AT ?auto_112556 ?auto_112561 ) ( CLEAR ?auto_112556 ) ( IS-CRATE ?auto_112557 ) ( not ( = ?auto_112556 ?auto_112557 ) ) ( AVAILABLE ?auto_112564 ) ( ON ?auto_112556 ?auto_112559 ) ( not ( = ?auto_112559 ?auto_112556 ) ) ( not ( = ?auto_112559 ?auto_112557 ) ) ( not ( = ?auto_112560 ?auto_112561 ) ) ( HOIST-AT ?auto_112563 ?auto_112560 ) ( not ( = ?auto_112564 ?auto_112563 ) ) ( AVAILABLE ?auto_112563 ) ( SURFACE-AT ?auto_112557 ?auto_112560 ) ( ON ?auto_112557 ?auto_112562 ) ( CLEAR ?auto_112557 ) ( not ( = ?auto_112556 ?auto_112562 ) ) ( not ( = ?auto_112557 ?auto_112562 ) ) ( not ( = ?auto_112559 ?auto_112562 ) ) ( TRUCK-AT ?auto_112558 ?auto_112561 ) )
    :subtasks
    ( ( !DRIVE ?auto_112558 ?auto_112561 ?auto_112560 )
      ( MAKE-2CRATE ?auto_112559 ?auto_112556 ?auto_112557 )
      ( MAKE-1CRATE-VERIFY ?auto_112556 ?auto_112557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112565 - SURFACE
      ?auto_112566 - SURFACE
      ?auto_112567 - SURFACE
    )
    :vars
    (
      ?auto_112573 - HOIST
      ?auto_112572 - PLACE
      ?auto_112568 - PLACE
      ?auto_112569 - HOIST
      ?auto_112570 - SURFACE
      ?auto_112571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112573 ?auto_112572 ) ( SURFACE-AT ?auto_112566 ?auto_112572 ) ( CLEAR ?auto_112566 ) ( IS-CRATE ?auto_112567 ) ( not ( = ?auto_112566 ?auto_112567 ) ) ( AVAILABLE ?auto_112573 ) ( ON ?auto_112566 ?auto_112565 ) ( not ( = ?auto_112565 ?auto_112566 ) ) ( not ( = ?auto_112565 ?auto_112567 ) ) ( not ( = ?auto_112568 ?auto_112572 ) ) ( HOIST-AT ?auto_112569 ?auto_112568 ) ( not ( = ?auto_112573 ?auto_112569 ) ) ( AVAILABLE ?auto_112569 ) ( SURFACE-AT ?auto_112567 ?auto_112568 ) ( ON ?auto_112567 ?auto_112570 ) ( CLEAR ?auto_112567 ) ( not ( = ?auto_112566 ?auto_112570 ) ) ( not ( = ?auto_112567 ?auto_112570 ) ) ( not ( = ?auto_112565 ?auto_112570 ) ) ( TRUCK-AT ?auto_112571 ?auto_112572 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112566 ?auto_112567 )
      ( MAKE-2CRATE-VERIFY ?auto_112565 ?auto_112566 ?auto_112567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112574 - SURFACE
      ?auto_112575 - SURFACE
    )
    :vars
    (
      ?auto_112577 - HOIST
      ?auto_112578 - PLACE
      ?auto_112582 - SURFACE
      ?auto_112579 - PLACE
      ?auto_112580 - HOIST
      ?auto_112576 - SURFACE
      ?auto_112581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112577 ?auto_112578 ) ( IS-CRATE ?auto_112575 ) ( not ( = ?auto_112574 ?auto_112575 ) ) ( not ( = ?auto_112582 ?auto_112574 ) ) ( not ( = ?auto_112582 ?auto_112575 ) ) ( not ( = ?auto_112579 ?auto_112578 ) ) ( HOIST-AT ?auto_112580 ?auto_112579 ) ( not ( = ?auto_112577 ?auto_112580 ) ) ( AVAILABLE ?auto_112580 ) ( SURFACE-AT ?auto_112575 ?auto_112579 ) ( ON ?auto_112575 ?auto_112576 ) ( CLEAR ?auto_112575 ) ( not ( = ?auto_112574 ?auto_112576 ) ) ( not ( = ?auto_112575 ?auto_112576 ) ) ( not ( = ?auto_112582 ?auto_112576 ) ) ( TRUCK-AT ?auto_112581 ?auto_112578 ) ( SURFACE-AT ?auto_112582 ?auto_112578 ) ( CLEAR ?auto_112582 ) ( LIFTING ?auto_112577 ?auto_112574 ) ( IS-CRATE ?auto_112574 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112582 ?auto_112574 )
      ( MAKE-2CRATE ?auto_112582 ?auto_112574 ?auto_112575 )
      ( MAKE-1CRATE-VERIFY ?auto_112574 ?auto_112575 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112583 - SURFACE
      ?auto_112584 - SURFACE
      ?auto_112585 - SURFACE
    )
    :vars
    (
      ?auto_112591 - HOIST
      ?auto_112587 - PLACE
      ?auto_112589 - PLACE
      ?auto_112586 - HOIST
      ?auto_112590 - SURFACE
      ?auto_112588 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112591 ?auto_112587 ) ( IS-CRATE ?auto_112585 ) ( not ( = ?auto_112584 ?auto_112585 ) ) ( not ( = ?auto_112583 ?auto_112584 ) ) ( not ( = ?auto_112583 ?auto_112585 ) ) ( not ( = ?auto_112589 ?auto_112587 ) ) ( HOIST-AT ?auto_112586 ?auto_112589 ) ( not ( = ?auto_112591 ?auto_112586 ) ) ( AVAILABLE ?auto_112586 ) ( SURFACE-AT ?auto_112585 ?auto_112589 ) ( ON ?auto_112585 ?auto_112590 ) ( CLEAR ?auto_112585 ) ( not ( = ?auto_112584 ?auto_112590 ) ) ( not ( = ?auto_112585 ?auto_112590 ) ) ( not ( = ?auto_112583 ?auto_112590 ) ) ( TRUCK-AT ?auto_112588 ?auto_112587 ) ( SURFACE-AT ?auto_112583 ?auto_112587 ) ( CLEAR ?auto_112583 ) ( LIFTING ?auto_112591 ?auto_112584 ) ( IS-CRATE ?auto_112584 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112584 ?auto_112585 )
      ( MAKE-2CRATE-VERIFY ?auto_112583 ?auto_112584 ?auto_112585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112592 - SURFACE
      ?auto_112593 - SURFACE
    )
    :vars
    (
      ?auto_112597 - HOIST
      ?auto_112595 - PLACE
      ?auto_112600 - SURFACE
      ?auto_112599 - PLACE
      ?auto_112596 - HOIST
      ?auto_112598 - SURFACE
      ?auto_112594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112597 ?auto_112595 ) ( IS-CRATE ?auto_112593 ) ( not ( = ?auto_112592 ?auto_112593 ) ) ( not ( = ?auto_112600 ?auto_112592 ) ) ( not ( = ?auto_112600 ?auto_112593 ) ) ( not ( = ?auto_112599 ?auto_112595 ) ) ( HOIST-AT ?auto_112596 ?auto_112599 ) ( not ( = ?auto_112597 ?auto_112596 ) ) ( AVAILABLE ?auto_112596 ) ( SURFACE-AT ?auto_112593 ?auto_112599 ) ( ON ?auto_112593 ?auto_112598 ) ( CLEAR ?auto_112593 ) ( not ( = ?auto_112592 ?auto_112598 ) ) ( not ( = ?auto_112593 ?auto_112598 ) ) ( not ( = ?auto_112600 ?auto_112598 ) ) ( TRUCK-AT ?auto_112594 ?auto_112595 ) ( SURFACE-AT ?auto_112600 ?auto_112595 ) ( CLEAR ?auto_112600 ) ( IS-CRATE ?auto_112592 ) ( AVAILABLE ?auto_112597 ) ( IN ?auto_112592 ?auto_112594 ) )
    :subtasks
    ( ( !UNLOAD ?auto_112597 ?auto_112592 ?auto_112594 ?auto_112595 )
      ( MAKE-2CRATE ?auto_112600 ?auto_112592 ?auto_112593 )
      ( MAKE-1CRATE-VERIFY ?auto_112592 ?auto_112593 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112601 - SURFACE
      ?auto_112602 - SURFACE
      ?auto_112603 - SURFACE
    )
    :vars
    (
      ?auto_112605 - HOIST
      ?auto_112606 - PLACE
      ?auto_112608 - PLACE
      ?auto_112609 - HOIST
      ?auto_112604 - SURFACE
      ?auto_112607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112605 ?auto_112606 ) ( IS-CRATE ?auto_112603 ) ( not ( = ?auto_112602 ?auto_112603 ) ) ( not ( = ?auto_112601 ?auto_112602 ) ) ( not ( = ?auto_112601 ?auto_112603 ) ) ( not ( = ?auto_112608 ?auto_112606 ) ) ( HOIST-AT ?auto_112609 ?auto_112608 ) ( not ( = ?auto_112605 ?auto_112609 ) ) ( AVAILABLE ?auto_112609 ) ( SURFACE-AT ?auto_112603 ?auto_112608 ) ( ON ?auto_112603 ?auto_112604 ) ( CLEAR ?auto_112603 ) ( not ( = ?auto_112602 ?auto_112604 ) ) ( not ( = ?auto_112603 ?auto_112604 ) ) ( not ( = ?auto_112601 ?auto_112604 ) ) ( TRUCK-AT ?auto_112607 ?auto_112606 ) ( SURFACE-AT ?auto_112601 ?auto_112606 ) ( CLEAR ?auto_112601 ) ( IS-CRATE ?auto_112602 ) ( AVAILABLE ?auto_112605 ) ( IN ?auto_112602 ?auto_112607 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112602 ?auto_112603 )
      ( MAKE-2CRATE-VERIFY ?auto_112601 ?auto_112602 ?auto_112603 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112646 - SURFACE
      ?auto_112647 - SURFACE
    )
    :vars
    (
      ?auto_112653 - HOIST
      ?auto_112654 - PLACE
      ?auto_112652 - SURFACE
      ?auto_112648 - PLACE
      ?auto_112650 - HOIST
      ?auto_112649 - SURFACE
      ?auto_112651 - TRUCK
      ?auto_112655 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112653 ?auto_112654 ) ( SURFACE-AT ?auto_112646 ?auto_112654 ) ( CLEAR ?auto_112646 ) ( IS-CRATE ?auto_112647 ) ( not ( = ?auto_112646 ?auto_112647 ) ) ( AVAILABLE ?auto_112653 ) ( ON ?auto_112646 ?auto_112652 ) ( not ( = ?auto_112652 ?auto_112646 ) ) ( not ( = ?auto_112652 ?auto_112647 ) ) ( not ( = ?auto_112648 ?auto_112654 ) ) ( HOIST-AT ?auto_112650 ?auto_112648 ) ( not ( = ?auto_112653 ?auto_112650 ) ) ( AVAILABLE ?auto_112650 ) ( SURFACE-AT ?auto_112647 ?auto_112648 ) ( ON ?auto_112647 ?auto_112649 ) ( CLEAR ?auto_112647 ) ( not ( = ?auto_112646 ?auto_112649 ) ) ( not ( = ?auto_112647 ?auto_112649 ) ) ( not ( = ?auto_112652 ?auto_112649 ) ) ( TRUCK-AT ?auto_112651 ?auto_112655 ) ( not ( = ?auto_112655 ?auto_112654 ) ) ( not ( = ?auto_112648 ?auto_112655 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_112651 ?auto_112655 ?auto_112654 )
      ( MAKE-1CRATE ?auto_112646 ?auto_112647 )
      ( MAKE-1CRATE-VERIFY ?auto_112646 ?auto_112647 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112686 - SURFACE
      ?auto_112687 - SURFACE
      ?auto_112688 - SURFACE
      ?auto_112685 - SURFACE
    )
    :vars
    (
      ?auto_112690 - HOIST
      ?auto_112689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112690 ?auto_112689 ) ( SURFACE-AT ?auto_112688 ?auto_112689 ) ( CLEAR ?auto_112688 ) ( LIFTING ?auto_112690 ?auto_112685 ) ( IS-CRATE ?auto_112685 ) ( not ( = ?auto_112688 ?auto_112685 ) ) ( ON ?auto_112687 ?auto_112686 ) ( ON ?auto_112688 ?auto_112687 ) ( not ( = ?auto_112686 ?auto_112687 ) ) ( not ( = ?auto_112686 ?auto_112688 ) ) ( not ( = ?auto_112686 ?auto_112685 ) ) ( not ( = ?auto_112687 ?auto_112688 ) ) ( not ( = ?auto_112687 ?auto_112685 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112688 ?auto_112685 )
      ( MAKE-3CRATE-VERIFY ?auto_112686 ?auto_112687 ?auto_112688 ?auto_112685 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112703 - SURFACE
      ?auto_112704 - SURFACE
      ?auto_112705 - SURFACE
      ?auto_112702 - SURFACE
    )
    :vars
    (
      ?auto_112706 - HOIST
      ?auto_112707 - PLACE
      ?auto_112708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112706 ?auto_112707 ) ( SURFACE-AT ?auto_112705 ?auto_112707 ) ( CLEAR ?auto_112705 ) ( IS-CRATE ?auto_112702 ) ( not ( = ?auto_112705 ?auto_112702 ) ) ( TRUCK-AT ?auto_112708 ?auto_112707 ) ( AVAILABLE ?auto_112706 ) ( IN ?auto_112702 ?auto_112708 ) ( ON ?auto_112705 ?auto_112704 ) ( not ( = ?auto_112704 ?auto_112705 ) ) ( not ( = ?auto_112704 ?auto_112702 ) ) ( ON ?auto_112704 ?auto_112703 ) ( not ( = ?auto_112703 ?auto_112704 ) ) ( not ( = ?auto_112703 ?auto_112705 ) ) ( not ( = ?auto_112703 ?auto_112702 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112704 ?auto_112705 ?auto_112702 )
      ( MAKE-3CRATE-VERIFY ?auto_112703 ?auto_112704 ?auto_112705 ?auto_112702 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112724 - SURFACE
      ?auto_112725 - SURFACE
      ?auto_112726 - SURFACE
      ?auto_112723 - SURFACE
    )
    :vars
    (
      ?auto_112729 - HOIST
      ?auto_112727 - PLACE
      ?auto_112728 - TRUCK
      ?auto_112730 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112729 ?auto_112727 ) ( SURFACE-AT ?auto_112726 ?auto_112727 ) ( CLEAR ?auto_112726 ) ( IS-CRATE ?auto_112723 ) ( not ( = ?auto_112726 ?auto_112723 ) ) ( AVAILABLE ?auto_112729 ) ( IN ?auto_112723 ?auto_112728 ) ( ON ?auto_112726 ?auto_112725 ) ( not ( = ?auto_112725 ?auto_112726 ) ) ( not ( = ?auto_112725 ?auto_112723 ) ) ( TRUCK-AT ?auto_112728 ?auto_112730 ) ( not ( = ?auto_112730 ?auto_112727 ) ) ( ON ?auto_112725 ?auto_112724 ) ( not ( = ?auto_112724 ?auto_112725 ) ) ( not ( = ?auto_112724 ?auto_112726 ) ) ( not ( = ?auto_112724 ?auto_112723 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112725 ?auto_112726 ?auto_112723 )
      ( MAKE-3CRATE-VERIFY ?auto_112724 ?auto_112725 ?auto_112726 ?auto_112723 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112748 - SURFACE
      ?auto_112749 - SURFACE
      ?auto_112750 - SURFACE
      ?auto_112747 - SURFACE
    )
    :vars
    (
      ?auto_112752 - HOIST
      ?auto_112755 - PLACE
      ?auto_112751 - TRUCK
      ?auto_112753 - PLACE
      ?auto_112754 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112752 ?auto_112755 ) ( SURFACE-AT ?auto_112750 ?auto_112755 ) ( CLEAR ?auto_112750 ) ( IS-CRATE ?auto_112747 ) ( not ( = ?auto_112750 ?auto_112747 ) ) ( AVAILABLE ?auto_112752 ) ( ON ?auto_112750 ?auto_112749 ) ( not ( = ?auto_112749 ?auto_112750 ) ) ( not ( = ?auto_112749 ?auto_112747 ) ) ( TRUCK-AT ?auto_112751 ?auto_112753 ) ( not ( = ?auto_112753 ?auto_112755 ) ) ( HOIST-AT ?auto_112754 ?auto_112753 ) ( LIFTING ?auto_112754 ?auto_112747 ) ( not ( = ?auto_112752 ?auto_112754 ) ) ( ON ?auto_112749 ?auto_112748 ) ( not ( = ?auto_112748 ?auto_112749 ) ) ( not ( = ?auto_112748 ?auto_112750 ) ) ( not ( = ?auto_112748 ?auto_112747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112749 ?auto_112750 ?auto_112747 )
      ( MAKE-3CRATE-VERIFY ?auto_112748 ?auto_112749 ?auto_112750 ?auto_112747 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112775 - SURFACE
      ?auto_112776 - SURFACE
      ?auto_112777 - SURFACE
      ?auto_112774 - SURFACE
    )
    :vars
    (
      ?auto_112781 - HOIST
      ?auto_112778 - PLACE
      ?auto_112783 - TRUCK
      ?auto_112780 - PLACE
      ?auto_112782 - HOIST
      ?auto_112779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112781 ?auto_112778 ) ( SURFACE-AT ?auto_112777 ?auto_112778 ) ( CLEAR ?auto_112777 ) ( IS-CRATE ?auto_112774 ) ( not ( = ?auto_112777 ?auto_112774 ) ) ( AVAILABLE ?auto_112781 ) ( ON ?auto_112777 ?auto_112776 ) ( not ( = ?auto_112776 ?auto_112777 ) ) ( not ( = ?auto_112776 ?auto_112774 ) ) ( TRUCK-AT ?auto_112783 ?auto_112780 ) ( not ( = ?auto_112780 ?auto_112778 ) ) ( HOIST-AT ?auto_112782 ?auto_112780 ) ( not ( = ?auto_112781 ?auto_112782 ) ) ( AVAILABLE ?auto_112782 ) ( SURFACE-AT ?auto_112774 ?auto_112780 ) ( ON ?auto_112774 ?auto_112779 ) ( CLEAR ?auto_112774 ) ( not ( = ?auto_112777 ?auto_112779 ) ) ( not ( = ?auto_112774 ?auto_112779 ) ) ( not ( = ?auto_112776 ?auto_112779 ) ) ( ON ?auto_112776 ?auto_112775 ) ( not ( = ?auto_112775 ?auto_112776 ) ) ( not ( = ?auto_112775 ?auto_112777 ) ) ( not ( = ?auto_112775 ?auto_112774 ) ) ( not ( = ?auto_112775 ?auto_112779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112776 ?auto_112777 ?auto_112774 )
      ( MAKE-3CRATE-VERIFY ?auto_112775 ?auto_112776 ?auto_112777 ?auto_112774 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112803 - SURFACE
      ?auto_112804 - SURFACE
      ?auto_112805 - SURFACE
      ?auto_112802 - SURFACE
    )
    :vars
    (
      ?auto_112806 - HOIST
      ?auto_112809 - PLACE
      ?auto_112810 - PLACE
      ?auto_112811 - HOIST
      ?auto_112807 - SURFACE
      ?auto_112808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112806 ?auto_112809 ) ( SURFACE-AT ?auto_112805 ?auto_112809 ) ( CLEAR ?auto_112805 ) ( IS-CRATE ?auto_112802 ) ( not ( = ?auto_112805 ?auto_112802 ) ) ( AVAILABLE ?auto_112806 ) ( ON ?auto_112805 ?auto_112804 ) ( not ( = ?auto_112804 ?auto_112805 ) ) ( not ( = ?auto_112804 ?auto_112802 ) ) ( not ( = ?auto_112810 ?auto_112809 ) ) ( HOIST-AT ?auto_112811 ?auto_112810 ) ( not ( = ?auto_112806 ?auto_112811 ) ) ( AVAILABLE ?auto_112811 ) ( SURFACE-AT ?auto_112802 ?auto_112810 ) ( ON ?auto_112802 ?auto_112807 ) ( CLEAR ?auto_112802 ) ( not ( = ?auto_112805 ?auto_112807 ) ) ( not ( = ?auto_112802 ?auto_112807 ) ) ( not ( = ?auto_112804 ?auto_112807 ) ) ( TRUCK-AT ?auto_112808 ?auto_112809 ) ( ON ?auto_112804 ?auto_112803 ) ( not ( = ?auto_112803 ?auto_112804 ) ) ( not ( = ?auto_112803 ?auto_112805 ) ) ( not ( = ?auto_112803 ?auto_112802 ) ) ( not ( = ?auto_112803 ?auto_112807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112804 ?auto_112805 ?auto_112802 )
      ( MAKE-3CRATE-VERIFY ?auto_112803 ?auto_112804 ?auto_112805 ?auto_112802 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112831 - SURFACE
      ?auto_112832 - SURFACE
      ?auto_112833 - SURFACE
      ?auto_112830 - SURFACE
    )
    :vars
    (
      ?auto_112838 - HOIST
      ?auto_112837 - PLACE
      ?auto_112834 - PLACE
      ?auto_112835 - HOIST
      ?auto_112836 - SURFACE
      ?auto_112839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112838 ?auto_112837 ) ( IS-CRATE ?auto_112830 ) ( not ( = ?auto_112833 ?auto_112830 ) ) ( not ( = ?auto_112832 ?auto_112833 ) ) ( not ( = ?auto_112832 ?auto_112830 ) ) ( not ( = ?auto_112834 ?auto_112837 ) ) ( HOIST-AT ?auto_112835 ?auto_112834 ) ( not ( = ?auto_112838 ?auto_112835 ) ) ( AVAILABLE ?auto_112835 ) ( SURFACE-AT ?auto_112830 ?auto_112834 ) ( ON ?auto_112830 ?auto_112836 ) ( CLEAR ?auto_112830 ) ( not ( = ?auto_112833 ?auto_112836 ) ) ( not ( = ?auto_112830 ?auto_112836 ) ) ( not ( = ?auto_112832 ?auto_112836 ) ) ( TRUCK-AT ?auto_112839 ?auto_112837 ) ( SURFACE-AT ?auto_112832 ?auto_112837 ) ( CLEAR ?auto_112832 ) ( LIFTING ?auto_112838 ?auto_112833 ) ( IS-CRATE ?auto_112833 ) ( ON ?auto_112832 ?auto_112831 ) ( not ( = ?auto_112831 ?auto_112832 ) ) ( not ( = ?auto_112831 ?auto_112833 ) ) ( not ( = ?auto_112831 ?auto_112830 ) ) ( not ( = ?auto_112831 ?auto_112836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112832 ?auto_112833 ?auto_112830 )
      ( MAKE-3CRATE-VERIFY ?auto_112831 ?auto_112832 ?auto_112833 ?auto_112830 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112859 - SURFACE
      ?auto_112860 - SURFACE
      ?auto_112861 - SURFACE
      ?auto_112858 - SURFACE
    )
    :vars
    (
      ?auto_112862 - HOIST
      ?auto_112864 - PLACE
      ?auto_112867 - PLACE
      ?auto_112863 - HOIST
      ?auto_112866 - SURFACE
      ?auto_112865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112862 ?auto_112864 ) ( IS-CRATE ?auto_112858 ) ( not ( = ?auto_112861 ?auto_112858 ) ) ( not ( = ?auto_112860 ?auto_112861 ) ) ( not ( = ?auto_112860 ?auto_112858 ) ) ( not ( = ?auto_112867 ?auto_112864 ) ) ( HOIST-AT ?auto_112863 ?auto_112867 ) ( not ( = ?auto_112862 ?auto_112863 ) ) ( AVAILABLE ?auto_112863 ) ( SURFACE-AT ?auto_112858 ?auto_112867 ) ( ON ?auto_112858 ?auto_112866 ) ( CLEAR ?auto_112858 ) ( not ( = ?auto_112861 ?auto_112866 ) ) ( not ( = ?auto_112858 ?auto_112866 ) ) ( not ( = ?auto_112860 ?auto_112866 ) ) ( TRUCK-AT ?auto_112865 ?auto_112864 ) ( SURFACE-AT ?auto_112860 ?auto_112864 ) ( CLEAR ?auto_112860 ) ( IS-CRATE ?auto_112861 ) ( AVAILABLE ?auto_112862 ) ( IN ?auto_112861 ?auto_112865 ) ( ON ?auto_112860 ?auto_112859 ) ( not ( = ?auto_112859 ?auto_112860 ) ) ( not ( = ?auto_112859 ?auto_112861 ) ) ( not ( = ?auto_112859 ?auto_112858 ) ) ( not ( = ?auto_112859 ?auto_112866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112860 ?auto_112861 ?auto_112858 )
      ( MAKE-3CRATE-VERIFY ?auto_112859 ?auto_112860 ?auto_112861 ?auto_112858 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113150 - SURFACE
      ?auto_113151 - SURFACE
      ?auto_113152 - SURFACE
      ?auto_113149 - SURFACE
      ?auto_113153 - SURFACE
    )
    :vars
    (
      ?auto_113155 - HOIST
      ?auto_113154 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113155 ?auto_113154 ) ( SURFACE-AT ?auto_113149 ?auto_113154 ) ( CLEAR ?auto_113149 ) ( LIFTING ?auto_113155 ?auto_113153 ) ( IS-CRATE ?auto_113153 ) ( not ( = ?auto_113149 ?auto_113153 ) ) ( ON ?auto_113151 ?auto_113150 ) ( ON ?auto_113152 ?auto_113151 ) ( ON ?auto_113149 ?auto_113152 ) ( not ( = ?auto_113150 ?auto_113151 ) ) ( not ( = ?auto_113150 ?auto_113152 ) ) ( not ( = ?auto_113150 ?auto_113149 ) ) ( not ( = ?auto_113150 ?auto_113153 ) ) ( not ( = ?auto_113151 ?auto_113152 ) ) ( not ( = ?auto_113151 ?auto_113149 ) ) ( not ( = ?auto_113151 ?auto_113153 ) ) ( not ( = ?auto_113152 ?auto_113149 ) ) ( not ( = ?auto_113152 ?auto_113153 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113149 ?auto_113153 )
      ( MAKE-4CRATE-VERIFY ?auto_113150 ?auto_113151 ?auto_113152 ?auto_113149 ?auto_113153 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113175 - SURFACE
      ?auto_113176 - SURFACE
      ?auto_113177 - SURFACE
      ?auto_113174 - SURFACE
      ?auto_113178 - SURFACE
    )
    :vars
    (
      ?auto_113181 - HOIST
      ?auto_113180 - PLACE
      ?auto_113179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113181 ?auto_113180 ) ( SURFACE-AT ?auto_113174 ?auto_113180 ) ( CLEAR ?auto_113174 ) ( IS-CRATE ?auto_113178 ) ( not ( = ?auto_113174 ?auto_113178 ) ) ( TRUCK-AT ?auto_113179 ?auto_113180 ) ( AVAILABLE ?auto_113181 ) ( IN ?auto_113178 ?auto_113179 ) ( ON ?auto_113174 ?auto_113177 ) ( not ( = ?auto_113177 ?auto_113174 ) ) ( not ( = ?auto_113177 ?auto_113178 ) ) ( ON ?auto_113176 ?auto_113175 ) ( ON ?auto_113177 ?auto_113176 ) ( not ( = ?auto_113175 ?auto_113176 ) ) ( not ( = ?auto_113175 ?auto_113177 ) ) ( not ( = ?auto_113175 ?auto_113174 ) ) ( not ( = ?auto_113175 ?auto_113178 ) ) ( not ( = ?auto_113176 ?auto_113177 ) ) ( not ( = ?auto_113176 ?auto_113174 ) ) ( not ( = ?auto_113176 ?auto_113178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113177 ?auto_113174 ?auto_113178 )
      ( MAKE-4CRATE-VERIFY ?auto_113175 ?auto_113176 ?auto_113177 ?auto_113174 ?auto_113178 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113205 - SURFACE
      ?auto_113206 - SURFACE
      ?auto_113207 - SURFACE
      ?auto_113204 - SURFACE
      ?auto_113208 - SURFACE
    )
    :vars
    (
      ?auto_113211 - HOIST
      ?auto_113210 - PLACE
      ?auto_113212 - TRUCK
      ?auto_113209 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113211 ?auto_113210 ) ( SURFACE-AT ?auto_113204 ?auto_113210 ) ( CLEAR ?auto_113204 ) ( IS-CRATE ?auto_113208 ) ( not ( = ?auto_113204 ?auto_113208 ) ) ( AVAILABLE ?auto_113211 ) ( IN ?auto_113208 ?auto_113212 ) ( ON ?auto_113204 ?auto_113207 ) ( not ( = ?auto_113207 ?auto_113204 ) ) ( not ( = ?auto_113207 ?auto_113208 ) ) ( TRUCK-AT ?auto_113212 ?auto_113209 ) ( not ( = ?auto_113209 ?auto_113210 ) ) ( ON ?auto_113206 ?auto_113205 ) ( ON ?auto_113207 ?auto_113206 ) ( not ( = ?auto_113205 ?auto_113206 ) ) ( not ( = ?auto_113205 ?auto_113207 ) ) ( not ( = ?auto_113205 ?auto_113204 ) ) ( not ( = ?auto_113205 ?auto_113208 ) ) ( not ( = ?auto_113206 ?auto_113207 ) ) ( not ( = ?auto_113206 ?auto_113204 ) ) ( not ( = ?auto_113206 ?auto_113208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113207 ?auto_113204 ?auto_113208 )
      ( MAKE-4CRATE-VERIFY ?auto_113205 ?auto_113206 ?auto_113207 ?auto_113204 ?auto_113208 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113239 - SURFACE
      ?auto_113240 - SURFACE
      ?auto_113241 - SURFACE
      ?auto_113238 - SURFACE
      ?auto_113242 - SURFACE
    )
    :vars
    (
      ?auto_113244 - HOIST
      ?auto_113243 - PLACE
      ?auto_113245 - TRUCK
      ?auto_113246 - PLACE
      ?auto_113247 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_113244 ?auto_113243 ) ( SURFACE-AT ?auto_113238 ?auto_113243 ) ( CLEAR ?auto_113238 ) ( IS-CRATE ?auto_113242 ) ( not ( = ?auto_113238 ?auto_113242 ) ) ( AVAILABLE ?auto_113244 ) ( ON ?auto_113238 ?auto_113241 ) ( not ( = ?auto_113241 ?auto_113238 ) ) ( not ( = ?auto_113241 ?auto_113242 ) ) ( TRUCK-AT ?auto_113245 ?auto_113246 ) ( not ( = ?auto_113246 ?auto_113243 ) ) ( HOIST-AT ?auto_113247 ?auto_113246 ) ( LIFTING ?auto_113247 ?auto_113242 ) ( not ( = ?auto_113244 ?auto_113247 ) ) ( ON ?auto_113240 ?auto_113239 ) ( ON ?auto_113241 ?auto_113240 ) ( not ( = ?auto_113239 ?auto_113240 ) ) ( not ( = ?auto_113239 ?auto_113241 ) ) ( not ( = ?auto_113239 ?auto_113238 ) ) ( not ( = ?auto_113239 ?auto_113242 ) ) ( not ( = ?auto_113240 ?auto_113241 ) ) ( not ( = ?auto_113240 ?auto_113238 ) ) ( not ( = ?auto_113240 ?auto_113242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113241 ?auto_113238 ?auto_113242 )
      ( MAKE-4CRATE-VERIFY ?auto_113239 ?auto_113240 ?auto_113241 ?auto_113238 ?auto_113242 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113277 - SURFACE
      ?auto_113278 - SURFACE
      ?auto_113279 - SURFACE
      ?auto_113276 - SURFACE
      ?auto_113280 - SURFACE
    )
    :vars
    (
      ?auto_113286 - HOIST
      ?auto_113283 - PLACE
      ?auto_113282 - TRUCK
      ?auto_113285 - PLACE
      ?auto_113284 - HOIST
      ?auto_113281 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113286 ?auto_113283 ) ( SURFACE-AT ?auto_113276 ?auto_113283 ) ( CLEAR ?auto_113276 ) ( IS-CRATE ?auto_113280 ) ( not ( = ?auto_113276 ?auto_113280 ) ) ( AVAILABLE ?auto_113286 ) ( ON ?auto_113276 ?auto_113279 ) ( not ( = ?auto_113279 ?auto_113276 ) ) ( not ( = ?auto_113279 ?auto_113280 ) ) ( TRUCK-AT ?auto_113282 ?auto_113285 ) ( not ( = ?auto_113285 ?auto_113283 ) ) ( HOIST-AT ?auto_113284 ?auto_113285 ) ( not ( = ?auto_113286 ?auto_113284 ) ) ( AVAILABLE ?auto_113284 ) ( SURFACE-AT ?auto_113280 ?auto_113285 ) ( ON ?auto_113280 ?auto_113281 ) ( CLEAR ?auto_113280 ) ( not ( = ?auto_113276 ?auto_113281 ) ) ( not ( = ?auto_113280 ?auto_113281 ) ) ( not ( = ?auto_113279 ?auto_113281 ) ) ( ON ?auto_113278 ?auto_113277 ) ( ON ?auto_113279 ?auto_113278 ) ( not ( = ?auto_113277 ?auto_113278 ) ) ( not ( = ?auto_113277 ?auto_113279 ) ) ( not ( = ?auto_113277 ?auto_113276 ) ) ( not ( = ?auto_113277 ?auto_113280 ) ) ( not ( = ?auto_113277 ?auto_113281 ) ) ( not ( = ?auto_113278 ?auto_113279 ) ) ( not ( = ?auto_113278 ?auto_113276 ) ) ( not ( = ?auto_113278 ?auto_113280 ) ) ( not ( = ?auto_113278 ?auto_113281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113279 ?auto_113276 ?auto_113280 )
      ( MAKE-4CRATE-VERIFY ?auto_113277 ?auto_113278 ?auto_113279 ?auto_113276 ?auto_113280 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113316 - SURFACE
      ?auto_113317 - SURFACE
      ?auto_113318 - SURFACE
      ?auto_113315 - SURFACE
      ?auto_113319 - SURFACE
    )
    :vars
    (
      ?auto_113321 - HOIST
      ?auto_113324 - PLACE
      ?auto_113323 - PLACE
      ?auto_113320 - HOIST
      ?auto_113322 - SURFACE
      ?auto_113325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113321 ?auto_113324 ) ( SURFACE-AT ?auto_113315 ?auto_113324 ) ( CLEAR ?auto_113315 ) ( IS-CRATE ?auto_113319 ) ( not ( = ?auto_113315 ?auto_113319 ) ) ( AVAILABLE ?auto_113321 ) ( ON ?auto_113315 ?auto_113318 ) ( not ( = ?auto_113318 ?auto_113315 ) ) ( not ( = ?auto_113318 ?auto_113319 ) ) ( not ( = ?auto_113323 ?auto_113324 ) ) ( HOIST-AT ?auto_113320 ?auto_113323 ) ( not ( = ?auto_113321 ?auto_113320 ) ) ( AVAILABLE ?auto_113320 ) ( SURFACE-AT ?auto_113319 ?auto_113323 ) ( ON ?auto_113319 ?auto_113322 ) ( CLEAR ?auto_113319 ) ( not ( = ?auto_113315 ?auto_113322 ) ) ( not ( = ?auto_113319 ?auto_113322 ) ) ( not ( = ?auto_113318 ?auto_113322 ) ) ( TRUCK-AT ?auto_113325 ?auto_113324 ) ( ON ?auto_113317 ?auto_113316 ) ( ON ?auto_113318 ?auto_113317 ) ( not ( = ?auto_113316 ?auto_113317 ) ) ( not ( = ?auto_113316 ?auto_113318 ) ) ( not ( = ?auto_113316 ?auto_113315 ) ) ( not ( = ?auto_113316 ?auto_113319 ) ) ( not ( = ?auto_113316 ?auto_113322 ) ) ( not ( = ?auto_113317 ?auto_113318 ) ) ( not ( = ?auto_113317 ?auto_113315 ) ) ( not ( = ?auto_113317 ?auto_113319 ) ) ( not ( = ?auto_113317 ?auto_113322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113318 ?auto_113315 ?auto_113319 )
      ( MAKE-4CRATE-VERIFY ?auto_113316 ?auto_113317 ?auto_113318 ?auto_113315 ?auto_113319 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113355 - SURFACE
      ?auto_113356 - SURFACE
      ?auto_113357 - SURFACE
      ?auto_113354 - SURFACE
      ?auto_113358 - SURFACE
    )
    :vars
    (
      ?auto_113362 - HOIST
      ?auto_113363 - PLACE
      ?auto_113361 - PLACE
      ?auto_113359 - HOIST
      ?auto_113364 - SURFACE
      ?auto_113360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113362 ?auto_113363 ) ( IS-CRATE ?auto_113358 ) ( not ( = ?auto_113354 ?auto_113358 ) ) ( not ( = ?auto_113357 ?auto_113354 ) ) ( not ( = ?auto_113357 ?auto_113358 ) ) ( not ( = ?auto_113361 ?auto_113363 ) ) ( HOIST-AT ?auto_113359 ?auto_113361 ) ( not ( = ?auto_113362 ?auto_113359 ) ) ( AVAILABLE ?auto_113359 ) ( SURFACE-AT ?auto_113358 ?auto_113361 ) ( ON ?auto_113358 ?auto_113364 ) ( CLEAR ?auto_113358 ) ( not ( = ?auto_113354 ?auto_113364 ) ) ( not ( = ?auto_113358 ?auto_113364 ) ) ( not ( = ?auto_113357 ?auto_113364 ) ) ( TRUCK-AT ?auto_113360 ?auto_113363 ) ( SURFACE-AT ?auto_113357 ?auto_113363 ) ( CLEAR ?auto_113357 ) ( LIFTING ?auto_113362 ?auto_113354 ) ( IS-CRATE ?auto_113354 ) ( ON ?auto_113356 ?auto_113355 ) ( ON ?auto_113357 ?auto_113356 ) ( not ( = ?auto_113355 ?auto_113356 ) ) ( not ( = ?auto_113355 ?auto_113357 ) ) ( not ( = ?auto_113355 ?auto_113354 ) ) ( not ( = ?auto_113355 ?auto_113358 ) ) ( not ( = ?auto_113355 ?auto_113364 ) ) ( not ( = ?auto_113356 ?auto_113357 ) ) ( not ( = ?auto_113356 ?auto_113354 ) ) ( not ( = ?auto_113356 ?auto_113358 ) ) ( not ( = ?auto_113356 ?auto_113364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113357 ?auto_113354 ?auto_113358 )
      ( MAKE-4CRATE-VERIFY ?auto_113355 ?auto_113356 ?auto_113357 ?auto_113354 ?auto_113358 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113394 - SURFACE
      ?auto_113395 - SURFACE
      ?auto_113396 - SURFACE
      ?auto_113393 - SURFACE
      ?auto_113397 - SURFACE
    )
    :vars
    (
      ?auto_113403 - HOIST
      ?auto_113399 - PLACE
      ?auto_113402 - PLACE
      ?auto_113401 - HOIST
      ?auto_113400 - SURFACE
      ?auto_113398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113403 ?auto_113399 ) ( IS-CRATE ?auto_113397 ) ( not ( = ?auto_113393 ?auto_113397 ) ) ( not ( = ?auto_113396 ?auto_113393 ) ) ( not ( = ?auto_113396 ?auto_113397 ) ) ( not ( = ?auto_113402 ?auto_113399 ) ) ( HOIST-AT ?auto_113401 ?auto_113402 ) ( not ( = ?auto_113403 ?auto_113401 ) ) ( AVAILABLE ?auto_113401 ) ( SURFACE-AT ?auto_113397 ?auto_113402 ) ( ON ?auto_113397 ?auto_113400 ) ( CLEAR ?auto_113397 ) ( not ( = ?auto_113393 ?auto_113400 ) ) ( not ( = ?auto_113397 ?auto_113400 ) ) ( not ( = ?auto_113396 ?auto_113400 ) ) ( TRUCK-AT ?auto_113398 ?auto_113399 ) ( SURFACE-AT ?auto_113396 ?auto_113399 ) ( CLEAR ?auto_113396 ) ( IS-CRATE ?auto_113393 ) ( AVAILABLE ?auto_113403 ) ( IN ?auto_113393 ?auto_113398 ) ( ON ?auto_113395 ?auto_113394 ) ( ON ?auto_113396 ?auto_113395 ) ( not ( = ?auto_113394 ?auto_113395 ) ) ( not ( = ?auto_113394 ?auto_113396 ) ) ( not ( = ?auto_113394 ?auto_113393 ) ) ( not ( = ?auto_113394 ?auto_113397 ) ) ( not ( = ?auto_113394 ?auto_113400 ) ) ( not ( = ?auto_113395 ?auto_113396 ) ) ( not ( = ?auto_113395 ?auto_113393 ) ) ( not ( = ?auto_113395 ?auto_113397 ) ) ( not ( = ?auto_113395 ?auto_113400 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113396 ?auto_113393 ?auto_113397 )
      ( MAKE-4CRATE-VERIFY ?auto_113394 ?auto_113395 ?auto_113396 ?auto_113393 ?auto_113397 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_113404 - SURFACE
      ?auto_113405 - SURFACE
    )
    :vars
    (
      ?auto_113412 - HOIST
      ?auto_113408 - PLACE
      ?auto_113407 - SURFACE
      ?auto_113411 - PLACE
      ?auto_113410 - HOIST
      ?auto_113409 - SURFACE
      ?auto_113406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113412 ?auto_113408 ) ( IS-CRATE ?auto_113405 ) ( not ( = ?auto_113404 ?auto_113405 ) ) ( not ( = ?auto_113407 ?auto_113404 ) ) ( not ( = ?auto_113407 ?auto_113405 ) ) ( not ( = ?auto_113411 ?auto_113408 ) ) ( HOIST-AT ?auto_113410 ?auto_113411 ) ( not ( = ?auto_113412 ?auto_113410 ) ) ( AVAILABLE ?auto_113410 ) ( SURFACE-AT ?auto_113405 ?auto_113411 ) ( ON ?auto_113405 ?auto_113409 ) ( CLEAR ?auto_113405 ) ( not ( = ?auto_113404 ?auto_113409 ) ) ( not ( = ?auto_113405 ?auto_113409 ) ) ( not ( = ?auto_113407 ?auto_113409 ) ) ( SURFACE-AT ?auto_113407 ?auto_113408 ) ( CLEAR ?auto_113407 ) ( IS-CRATE ?auto_113404 ) ( AVAILABLE ?auto_113412 ) ( IN ?auto_113404 ?auto_113406 ) ( TRUCK-AT ?auto_113406 ?auto_113411 ) )
    :subtasks
    ( ( !DRIVE ?auto_113406 ?auto_113411 ?auto_113408 )
      ( MAKE-2CRATE ?auto_113407 ?auto_113404 ?auto_113405 )
      ( MAKE-1CRATE-VERIFY ?auto_113404 ?auto_113405 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_113413 - SURFACE
      ?auto_113414 - SURFACE
      ?auto_113415 - SURFACE
    )
    :vars
    (
      ?auto_113417 - HOIST
      ?auto_113419 - PLACE
      ?auto_113416 - PLACE
      ?auto_113420 - HOIST
      ?auto_113421 - SURFACE
      ?auto_113418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113417 ?auto_113419 ) ( IS-CRATE ?auto_113415 ) ( not ( = ?auto_113414 ?auto_113415 ) ) ( not ( = ?auto_113413 ?auto_113414 ) ) ( not ( = ?auto_113413 ?auto_113415 ) ) ( not ( = ?auto_113416 ?auto_113419 ) ) ( HOIST-AT ?auto_113420 ?auto_113416 ) ( not ( = ?auto_113417 ?auto_113420 ) ) ( AVAILABLE ?auto_113420 ) ( SURFACE-AT ?auto_113415 ?auto_113416 ) ( ON ?auto_113415 ?auto_113421 ) ( CLEAR ?auto_113415 ) ( not ( = ?auto_113414 ?auto_113421 ) ) ( not ( = ?auto_113415 ?auto_113421 ) ) ( not ( = ?auto_113413 ?auto_113421 ) ) ( SURFACE-AT ?auto_113413 ?auto_113419 ) ( CLEAR ?auto_113413 ) ( IS-CRATE ?auto_113414 ) ( AVAILABLE ?auto_113417 ) ( IN ?auto_113414 ?auto_113418 ) ( TRUCK-AT ?auto_113418 ?auto_113416 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113414 ?auto_113415 )
      ( MAKE-2CRATE-VERIFY ?auto_113413 ?auto_113414 ?auto_113415 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_113423 - SURFACE
      ?auto_113424 - SURFACE
      ?auto_113425 - SURFACE
      ?auto_113422 - SURFACE
    )
    :vars
    (
      ?auto_113428 - HOIST
      ?auto_113429 - PLACE
      ?auto_113431 - PLACE
      ?auto_113427 - HOIST
      ?auto_113430 - SURFACE
      ?auto_113426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113428 ?auto_113429 ) ( IS-CRATE ?auto_113422 ) ( not ( = ?auto_113425 ?auto_113422 ) ) ( not ( = ?auto_113424 ?auto_113425 ) ) ( not ( = ?auto_113424 ?auto_113422 ) ) ( not ( = ?auto_113431 ?auto_113429 ) ) ( HOIST-AT ?auto_113427 ?auto_113431 ) ( not ( = ?auto_113428 ?auto_113427 ) ) ( AVAILABLE ?auto_113427 ) ( SURFACE-AT ?auto_113422 ?auto_113431 ) ( ON ?auto_113422 ?auto_113430 ) ( CLEAR ?auto_113422 ) ( not ( = ?auto_113425 ?auto_113430 ) ) ( not ( = ?auto_113422 ?auto_113430 ) ) ( not ( = ?auto_113424 ?auto_113430 ) ) ( SURFACE-AT ?auto_113424 ?auto_113429 ) ( CLEAR ?auto_113424 ) ( IS-CRATE ?auto_113425 ) ( AVAILABLE ?auto_113428 ) ( IN ?auto_113425 ?auto_113426 ) ( TRUCK-AT ?auto_113426 ?auto_113431 ) ( ON ?auto_113424 ?auto_113423 ) ( not ( = ?auto_113423 ?auto_113424 ) ) ( not ( = ?auto_113423 ?auto_113425 ) ) ( not ( = ?auto_113423 ?auto_113422 ) ) ( not ( = ?auto_113423 ?auto_113430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113424 ?auto_113425 ?auto_113422 )
      ( MAKE-3CRATE-VERIFY ?auto_113423 ?auto_113424 ?auto_113425 ?auto_113422 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113433 - SURFACE
      ?auto_113434 - SURFACE
      ?auto_113435 - SURFACE
      ?auto_113432 - SURFACE
      ?auto_113436 - SURFACE
    )
    :vars
    (
      ?auto_113439 - HOIST
      ?auto_113440 - PLACE
      ?auto_113442 - PLACE
      ?auto_113438 - HOIST
      ?auto_113441 - SURFACE
      ?auto_113437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113439 ?auto_113440 ) ( IS-CRATE ?auto_113436 ) ( not ( = ?auto_113432 ?auto_113436 ) ) ( not ( = ?auto_113435 ?auto_113432 ) ) ( not ( = ?auto_113435 ?auto_113436 ) ) ( not ( = ?auto_113442 ?auto_113440 ) ) ( HOIST-AT ?auto_113438 ?auto_113442 ) ( not ( = ?auto_113439 ?auto_113438 ) ) ( AVAILABLE ?auto_113438 ) ( SURFACE-AT ?auto_113436 ?auto_113442 ) ( ON ?auto_113436 ?auto_113441 ) ( CLEAR ?auto_113436 ) ( not ( = ?auto_113432 ?auto_113441 ) ) ( not ( = ?auto_113436 ?auto_113441 ) ) ( not ( = ?auto_113435 ?auto_113441 ) ) ( SURFACE-AT ?auto_113435 ?auto_113440 ) ( CLEAR ?auto_113435 ) ( IS-CRATE ?auto_113432 ) ( AVAILABLE ?auto_113439 ) ( IN ?auto_113432 ?auto_113437 ) ( TRUCK-AT ?auto_113437 ?auto_113442 ) ( ON ?auto_113434 ?auto_113433 ) ( ON ?auto_113435 ?auto_113434 ) ( not ( = ?auto_113433 ?auto_113434 ) ) ( not ( = ?auto_113433 ?auto_113435 ) ) ( not ( = ?auto_113433 ?auto_113432 ) ) ( not ( = ?auto_113433 ?auto_113436 ) ) ( not ( = ?auto_113433 ?auto_113441 ) ) ( not ( = ?auto_113434 ?auto_113435 ) ) ( not ( = ?auto_113434 ?auto_113432 ) ) ( not ( = ?auto_113434 ?auto_113436 ) ) ( not ( = ?auto_113434 ?auto_113441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113435 ?auto_113432 ?auto_113436 )
      ( MAKE-4CRATE-VERIFY ?auto_113433 ?auto_113434 ?auto_113435 ?auto_113432 ?auto_113436 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_113443 - SURFACE
      ?auto_113444 - SURFACE
    )
    :vars
    (
      ?auto_113448 - HOIST
      ?auto_113449 - PLACE
      ?auto_113446 - SURFACE
      ?auto_113451 - PLACE
      ?auto_113447 - HOIST
      ?auto_113450 - SURFACE
      ?auto_113445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113448 ?auto_113449 ) ( IS-CRATE ?auto_113444 ) ( not ( = ?auto_113443 ?auto_113444 ) ) ( not ( = ?auto_113446 ?auto_113443 ) ) ( not ( = ?auto_113446 ?auto_113444 ) ) ( not ( = ?auto_113451 ?auto_113449 ) ) ( HOIST-AT ?auto_113447 ?auto_113451 ) ( not ( = ?auto_113448 ?auto_113447 ) ) ( SURFACE-AT ?auto_113444 ?auto_113451 ) ( ON ?auto_113444 ?auto_113450 ) ( CLEAR ?auto_113444 ) ( not ( = ?auto_113443 ?auto_113450 ) ) ( not ( = ?auto_113444 ?auto_113450 ) ) ( not ( = ?auto_113446 ?auto_113450 ) ) ( SURFACE-AT ?auto_113446 ?auto_113449 ) ( CLEAR ?auto_113446 ) ( IS-CRATE ?auto_113443 ) ( AVAILABLE ?auto_113448 ) ( TRUCK-AT ?auto_113445 ?auto_113451 ) ( LIFTING ?auto_113447 ?auto_113443 ) )
    :subtasks
    ( ( !LOAD ?auto_113447 ?auto_113443 ?auto_113445 ?auto_113451 )
      ( MAKE-2CRATE ?auto_113446 ?auto_113443 ?auto_113444 )
      ( MAKE-1CRATE-VERIFY ?auto_113443 ?auto_113444 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_113452 - SURFACE
      ?auto_113453 - SURFACE
      ?auto_113454 - SURFACE
    )
    :vars
    (
      ?auto_113459 - HOIST
      ?auto_113456 - PLACE
      ?auto_113458 - PLACE
      ?auto_113457 - HOIST
      ?auto_113460 - SURFACE
      ?auto_113455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113459 ?auto_113456 ) ( IS-CRATE ?auto_113454 ) ( not ( = ?auto_113453 ?auto_113454 ) ) ( not ( = ?auto_113452 ?auto_113453 ) ) ( not ( = ?auto_113452 ?auto_113454 ) ) ( not ( = ?auto_113458 ?auto_113456 ) ) ( HOIST-AT ?auto_113457 ?auto_113458 ) ( not ( = ?auto_113459 ?auto_113457 ) ) ( SURFACE-AT ?auto_113454 ?auto_113458 ) ( ON ?auto_113454 ?auto_113460 ) ( CLEAR ?auto_113454 ) ( not ( = ?auto_113453 ?auto_113460 ) ) ( not ( = ?auto_113454 ?auto_113460 ) ) ( not ( = ?auto_113452 ?auto_113460 ) ) ( SURFACE-AT ?auto_113452 ?auto_113456 ) ( CLEAR ?auto_113452 ) ( IS-CRATE ?auto_113453 ) ( AVAILABLE ?auto_113459 ) ( TRUCK-AT ?auto_113455 ?auto_113458 ) ( LIFTING ?auto_113457 ?auto_113453 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113453 ?auto_113454 )
      ( MAKE-2CRATE-VERIFY ?auto_113452 ?auto_113453 ?auto_113454 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_113462 - SURFACE
      ?auto_113463 - SURFACE
      ?auto_113464 - SURFACE
      ?auto_113461 - SURFACE
    )
    :vars
    (
      ?auto_113468 - HOIST
      ?auto_113467 - PLACE
      ?auto_113469 - PLACE
      ?auto_113465 - HOIST
      ?auto_113470 - SURFACE
      ?auto_113466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113468 ?auto_113467 ) ( IS-CRATE ?auto_113461 ) ( not ( = ?auto_113464 ?auto_113461 ) ) ( not ( = ?auto_113463 ?auto_113464 ) ) ( not ( = ?auto_113463 ?auto_113461 ) ) ( not ( = ?auto_113469 ?auto_113467 ) ) ( HOIST-AT ?auto_113465 ?auto_113469 ) ( not ( = ?auto_113468 ?auto_113465 ) ) ( SURFACE-AT ?auto_113461 ?auto_113469 ) ( ON ?auto_113461 ?auto_113470 ) ( CLEAR ?auto_113461 ) ( not ( = ?auto_113464 ?auto_113470 ) ) ( not ( = ?auto_113461 ?auto_113470 ) ) ( not ( = ?auto_113463 ?auto_113470 ) ) ( SURFACE-AT ?auto_113463 ?auto_113467 ) ( CLEAR ?auto_113463 ) ( IS-CRATE ?auto_113464 ) ( AVAILABLE ?auto_113468 ) ( TRUCK-AT ?auto_113466 ?auto_113469 ) ( LIFTING ?auto_113465 ?auto_113464 ) ( ON ?auto_113463 ?auto_113462 ) ( not ( = ?auto_113462 ?auto_113463 ) ) ( not ( = ?auto_113462 ?auto_113464 ) ) ( not ( = ?auto_113462 ?auto_113461 ) ) ( not ( = ?auto_113462 ?auto_113470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113463 ?auto_113464 ?auto_113461 )
      ( MAKE-3CRATE-VERIFY ?auto_113462 ?auto_113463 ?auto_113464 ?auto_113461 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113472 - SURFACE
      ?auto_113473 - SURFACE
      ?auto_113474 - SURFACE
      ?auto_113471 - SURFACE
      ?auto_113475 - SURFACE
    )
    :vars
    (
      ?auto_113479 - HOIST
      ?auto_113478 - PLACE
      ?auto_113480 - PLACE
      ?auto_113476 - HOIST
      ?auto_113481 - SURFACE
      ?auto_113477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113479 ?auto_113478 ) ( IS-CRATE ?auto_113475 ) ( not ( = ?auto_113471 ?auto_113475 ) ) ( not ( = ?auto_113474 ?auto_113471 ) ) ( not ( = ?auto_113474 ?auto_113475 ) ) ( not ( = ?auto_113480 ?auto_113478 ) ) ( HOIST-AT ?auto_113476 ?auto_113480 ) ( not ( = ?auto_113479 ?auto_113476 ) ) ( SURFACE-AT ?auto_113475 ?auto_113480 ) ( ON ?auto_113475 ?auto_113481 ) ( CLEAR ?auto_113475 ) ( not ( = ?auto_113471 ?auto_113481 ) ) ( not ( = ?auto_113475 ?auto_113481 ) ) ( not ( = ?auto_113474 ?auto_113481 ) ) ( SURFACE-AT ?auto_113474 ?auto_113478 ) ( CLEAR ?auto_113474 ) ( IS-CRATE ?auto_113471 ) ( AVAILABLE ?auto_113479 ) ( TRUCK-AT ?auto_113477 ?auto_113480 ) ( LIFTING ?auto_113476 ?auto_113471 ) ( ON ?auto_113473 ?auto_113472 ) ( ON ?auto_113474 ?auto_113473 ) ( not ( = ?auto_113472 ?auto_113473 ) ) ( not ( = ?auto_113472 ?auto_113474 ) ) ( not ( = ?auto_113472 ?auto_113471 ) ) ( not ( = ?auto_113472 ?auto_113475 ) ) ( not ( = ?auto_113472 ?auto_113481 ) ) ( not ( = ?auto_113473 ?auto_113474 ) ) ( not ( = ?auto_113473 ?auto_113471 ) ) ( not ( = ?auto_113473 ?auto_113475 ) ) ( not ( = ?auto_113473 ?auto_113481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113474 ?auto_113471 ?auto_113475 )
      ( MAKE-4CRATE-VERIFY ?auto_113472 ?auto_113473 ?auto_113474 ?auto_113471 ?auto_113475 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_113482 - SURFACE
      ?auto_113483 - SURFACE
    )
    :vars
    (
      ?auto_113488 - HOIST
      ?auto_113487 - PLACE
      ?auto_113486 - SURFACE
      ?auto_113489 - PLACE
      ?auto_113484 - HOIST
      ?auto_113490 - SURFACE
      ?auto_113485 - TRUCK
      ?auto_113491 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113488 ?auto_113487 ) ( IS-CRATE ?auto_113483 ) ( not ( = ?auto_113482 ?auto_113483 ) ) ( not ( = ?auto_113486 ?auto_113482 ) ) ( not ( = ?auto_113486 ?auto_113483 ) ) ( not ( = ?auto_113489 ?auto_113487 ) ) ( HOIST-AT ?auto_113484 ?auto_113489 ) ( not ( = ?auto_113488 ?auto_113484 ) ) ( SURFACE-AT ?auto_113483 ?auto_113489 ) ( ON ?auto_113483 ?auto_113490 ) ( CLEAR ?auto_113483 ) ( not ( = ?auto_113482 ?auto_113490 ) ) ( not ( = ?auto_113483 ?auto_113490 ) ) ( not ( = ?auto_113486 ?auto_113490 ) ) ( SURFACE-AT ?auto_113486 ?auto_113487 ) ( CLEAR ?auto_113486 ) ( IS-CRATE ?auto_113482 ) ( AVAILABLE ?auto_113488 ) ( TRUCK-AT ?auto_113485 ?auto_113489 ) ( AVAILABLE ?auto_113484 ) ( SURFACE-AT ?auto_113482 ?auto_113489 ) ( ON ?auto_113482 ?auto_113491 ) ( CLEAR ?auto_113482 ) ( not ( = ?auto_113482 ?auto_113491 ) ) ( not ( = ?auto_113483 ?auto_113491 ) ) ( not ( = ?auto_113486 ?auto_113491 ) ) ( not ( = ?auto_113490 ?auto_113491 ) ) )
    :subtasks
    ( ( !LIFT ?auto_113484 ?auto_113482 ?auto_113491 ?auto_113489 )
      ( MAKE-2CRATE ?auto_113486 ?auto_113482 ?auto_113483 )
      ( MAKE-1CRATE-VERIFY ?auto_113482 ?auto_113483 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_113492 - SURFACE
      ?auto_113493 - SURFACE
      ?auto_113494 - SURFACE
    )
    :vars
    (
      ?auto_113498 - HOIST
      ?auto_113500 - PLACE
      ?auto_113501 - PLACE
      ?auto_113495 - HOIST
      ?auto_113496 - SURFACE
      ?auto_113499 - TRUCK
      ?auto_113497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113498 ?auto_113500 ) ( IS-CRATE ?auto_113494 ) ( not ( = ?auto_113493 ?auto_113494 ) ) ( not ( = ?auto_113492 ?auto_113493 ) ) ( not ( = ?auto_113492 ?auto_113494 ) ) ( not ( = ?auto_113501 ?auto_113500 ) ) ( HOIST-AT ?auto_113495 ?auto_113501 ) ( not ( = ?auto_113498 ?auto_113495 ) ) ( SURFACE-AT ?auto_113494 ?auto_113501 ) ( ON ?auto_113494 ?auto_113496 ) ( CLEAR ?auto_113494 ) ( not ( = ?auto_113493 ?auto_113496 ) ) ( not ( = ?auto_113494 ?auto_113496 ) ) ( not ( = ?auto_113492 ?auto_113496 ) ) ( SURFACE-AT ?auto_113492 ?auto_113500 ) ( CLEAR ?auto_113492 ) ( IS-CRATE ?auto_113493 ) ( AVAILABLE ?auto_113498 ) ( TRUCK-AT ?auto_113499 ?auto_113501 ) ( AVAILABLE ?auto_113495 ) ( SURFACE-AT ?auto_113493 ?auto_113501 ) ( ON ?auto_113493 ?auto_113497 ) ( CLEAR ?auto_113493 ) ( not ( = ?auto_113493 ?auto_113497 ) ) ( not ( = ?auto_113494 ?auto_113497 ) ) ( not ( = ?auto_113492 ?auto_113497 ) ) ( not ( = ?auto_113496 ?auto_113497 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113493 ?auto_113494 )
      ( MAKE-2CRATE-VERIFY ?auto_113492 ?auto_113493 ?auto_113494 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_113503 - SURFACE
      ?auto_113504 - SURFACE
      ?auto_113505 - SURFACE
      ?auto_113502 - SURFACE
    )
    :vars
    (
      ?auto_113509 - HOIST
      ?auto_113512 - PLACE
      ?auto_113511 - PLACE
      ?auto_113508 - HOIST
      ?auto_113510 - SURFACE
      ?auto_113507 - TRUCK
      ?auto_113506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113509 ?auto_113512 ) ( IS-CRATE ?auto_113502 ) ( not ( = ?auto_113505 ?auto_113502 ) ) ( not ( = ?auto_113504 ?auto_113505 ) ) ( not ( = ?auto_113504 ?auto_113502 ) ) ( not ( = ?auto_113511 ?auto_113512 ) ) ( HOIST-AT ?auto_113508 ?auto_113511 ) ( not ( = ?auto_113509 ?auto_113508 ) ) ( SURFACE-AT ?auto_113502 ?auto_113511 ) ( ON ?auto_113502 ?auto_113510 ) ( CLEAR ?auto_113502 ) ( not ( = ?auto_113505 ?auto_113510 ) ) ( not ( = ?auto_113502 ?auto_113510 ) ) ( not ( = ?auto_113504 ?auto_113510 ) ) ( SURFACE-AT ?auto_113504 ?auto_113512 ) ( CLEAR ?auto_113504 ) ( IS-CRATE ?auto_113505 ) ( AVAILABLE ?auto_113509 ) ( TRUCK-AT ?auto_113507 ?auto_113511 ) ( AVAILABLE ?auto_113508 ) ( SURFACE-AT ?auto_113505 ?auto_113511 ) ( ON ?auto_113505 ?auto_113506 ) ( CLEAR ?auto_113505 ) ( not ( = ?auto_113505 ?auto_113506 ) ) ( not ( = ?auto_113502 ?auto_113506 ) ) ( not ( = ?auto_113504 ?auto_113506 ) ) ( not ( = ?auto_113510 ?auto_113506 ) ) ( ON ?auto_113504 ?auto_113503 ) ( not ( = ?auto_113503 ?auto_113504 ) ) ( not ( = ?auto_113503 ?auto_113505 ) ) ( not ( = ?auto_113503 ?auto_113502 ) ) ( not ( = ?auto_113503 ?auto_113510 ) ) ( not ( = ?auto_113503 ?auto_113506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113504 ?auto_113505 ?auto_113502 )
      ( MAKE-3CRATE-VERIFY ?auto_113503 ?auto_113504 ?auto_113505 ?auto_113502 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113514 - SURFACE
      ?auto_113515 - SURFACE
      ?auto_113516 - SURFACE
      ?auto_113513 - SURFACE
      ?auto_113517 - SURFACE
    )
    :vars
    (
      ?auto_113521 - HOIST
      ?auto_113524 - PLACE
      ?auto_113523 - PLACE
      ?auto_113520 - HOIST
      ?auto_113522 - SURFACE
      ?auto_113519 - TRUCK
      ?auto_113518 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113521 ?auto_113524 ) ( IS-CRATE ?auto_113517 ) ( not ( = ?auto_113513 ?auto_113517 ) ) ( not ( = ?auto_113516 ?auto_113513 ) ) ( not ( = ?auto_113516 ?auto_113517 ) ) ( not ( = ?auto_113523 ?auto_113524 ) ) ( HOIST-AT ?auto_113520 ?auto_113523 ) ( not ( = ?auto_113521 ?auto_113520 ) ) ( SURFACE-AT ?auto_113517 ?auto_113523 ) ( ON ?auto_113517 ?auto_113522 ) ( CLEAR ?auto_113517 ) ( not ( = ?auto_113513 ?auto_113522 ) ) ( not ( = ?auto_113517 ?auto_113522 ) ) ( not ( = ?auto_113516 ?auto_113522 ) ) ( SURFACE-AT ?auto_113516 ?auto_113524 ) ( CLEAR ?auto_113516 ) ( IS-CRATE ?auto_113513 ) ( AVAILABLE ?auto_113521 ) ( TRUCK-AT ?auto_113519 ?auto_113523 ) ( AVAILABLE ?auto_113520 ) ( SURFACE-AT ?auto_113513 ?auto_113523 ) ( ON ?auto_113513 ?auto_113518 ) ( CLEAR ?auto_113513 ) ( not ( = ?auto_113513 ?auto_113518 ) ) ( not ( = ?auto_113517 ?auto_113518 ) ) ( not ( = ?auto_113516 ?auto_113518 ) ) ( not ( = ?auto_113522 ?auto_113518 ) ) ( ON ?auto_113515 ?auto_113514 ) ( ON ?auto_113516 ?auto_113515 ) ( not ( = ?auto_113514 ?auto_113515 ) ) ( not ( = ?auto_113514 ?auto_113516 ) ) ( not ( = ?auto_113514 ?auto_113513 ) ) ( not ( = ?auto_113514 ?auto_113517 ) ) ( not ( = ?auto_113514 ?auto_113522 ) ) ( not ( = ?auto_113514 ?auto_113518 ) ) ( not ( = ?auto_113515 ?auto_113516 ) ) ( not ( = ?auto_113515 ?auto_113513 ) ) ( not ( = ?auto_113515 ?auto_113517 ) ) ( not ( = ?auto_113515 ?auto_113522 ) ) ( not ( = ?auto_113515 ?auto_113518 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113516 ?auto_113513 ?auto_113517 )
      ( MAKE-4CRATE-VERIFY ?auto_113514 ?auto_113515 ?auto_113516 ?auto_113513 ?auto_113517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_113525 - SURFACE
      ?auto_113526 - SURFACE
    )
    :vars
    (
      ?auto_113531 - HOIST
      ?auto_113534 - PLACE
      ?auto_113528 - SURFACE
      ?auto_113533 - PLACE
      ?auto_113530 - HOIST
      ?auto_113532 - SURFACE
      ?auto_113527 - SURFACE
      ?auto_113529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113531 ?auto_113534 ) ( IS-CRATE ?auto_113526 ) ( not ( = ?auto_113525 ?auto_113526 ) ) ( not ( = ?auto_113528 ?auto_113525 ) ) ( not ( = ?auto_113528 ?auto_113526 ) ) ( not ( = ?auto_113533 ?auto_113534 ) ) ( HOIST-AT ?auto_113530 ?auto_113533 ) ( not ( = ?auto_113531 ?auto_113530 ) ) ( SURFACE-AT ?auto_113526 ?auto_113533 ) ( ON ?auto_113526 ?auto_113532 ) ( CLEAR ?auto_113526 ) ( not ( = ?auto_113525 ?auto_113532 ) ) ( not ( = ?auto_113526 ?auto_113532 ) ) ( not ( = ?auto_113528 ?auto_113532 ) ) ( SURFACE-AT ?auto_113528 ?auto_113534 ) ( CLEAR ?auto_113528 ) ( IS-CRATE ?auto_113525 ) ( AVAILABLE ?auto_113531 ) ( AVAILABLE ?auto_113530 ) ( SURFACE-AT ?auto_113525 ?auto_113533 ) ( ON ?auto_113525 ?auto_113527 ) ( CLEAR ?auto_113525 ) ( not ( = ?auto_113525 ?auto_113527 ) ) ( not ( = ?auto_113526 ?auto_113527 ) ) ( not ( = ?auto_113528 ?auto_113527 ) ) ( not ( = ?auto_113532 ?auto_113527 ) ) ( TRUCK-AT ?auto_113529 ?auto_113534 ) )
    :subtasks
    ( ( !DRIVE ?auto_113529 ?auto_113534 ?auto_113533 )
      ( MAKE-2CRATE ?auto_113528 ?auto_113525 ?auto_113526 )
      ( MAKE-1CRATE-VERIFY ?auto_113525 ?auto_113526 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_113535 - SURFACE
      ?auto_113536 - SURFACE
      ?auto_113537 - SURFACE
    )
    :vars
    (
      ?auto_113540 - HOIST
      ?auto_113539 - PLACE
      ?auto_113541 - PLACE
      ?auto_113542 - HOIST
      ?auto_113538 - SURFACE
      ?auto_113543 - SURFACE
      ?auto_113544 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113540 ?auto_113539 ) ( IS-CRATE ?auto_113537 ) ( not ( = ?auto_113536 ?auto_113537 ) ) ( not ( = ?auto_113535 ?auto_113536 ) ) ( not ( = ?auto_113535 ?auto_113537 ) ) ( not ( = ?auto_113541 ?auto_113539 ) ) ( HOIST-AT ?auto_113542 ?auto_113541 ) ( not ( = ?auto_113540 ?auto_113542 ) ) ( SURFACE-AT ?auto_113537 ?auto_113541 ) ( ON ?auto_113537 ?auto_113538 ) ( CLEAR ?auto_113537 ) ( not ( = ?auto_113536 ?auto_113538 ) ) ( not ( = ?auto_113537 ?auto_113538 ) ) ( not ( = ?auto_113535 ?auto_113538 ) ) ( SURFACE-AT ?auto_113535 ?auto_113539 ) ( CLEAR ?auto_113535 ) ( IS-CRATE ?auto_113536 ) ( AVAILABLE ?auto_113540 ) ( AVAILABLE ?auto_113542 ) ( SURFACE-AT ?auto_113536 ?auto_113541 ) ( ON ?auto_113536 ?auto_113543 ) ( CLEAR ?auto_113536 ) ( not ( = ?auto_113536 ?auto_113543 ) ) ( not ( = ?auto_113537 ?auto_113543 ) ) ( not ( = ?auto_113535 ?auto_113543 ) ) ( not ( = ?auto_113538 ?auto_113543 ) ) ( TRUCK-AT ?auto_113544 ?auto_113539 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113536 ?auto_113537 )
      ( MAKE-2CRATE-VERIFY ?auto_113535 ?auto_113536 ?auto_113537 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_113546 - SURFACE
      ?auto_113547 - SURFACE
      ?auto_113548 - SURFACE
      ?auto_113545 - SURFACE
    )
    :vars
    (
      ?auto_113549 - HOIST
      ?auto_113555 - PLACE
      ?auto_113554 - PLACE
      ?auto_113553 - HOIST
      ?auto_113550 - SURFACE
      ?auto_113551 - SURFACE
      ?auto_113552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113549 ?auto_113555 ) ( IS-CRATE ?auto_113545 ) ( not ( = ?auto_113548 ?auto_113545 ) ) ( not ( = ?auto_113547 ?auto_113548 ) ) ( not ( = ?auto_113547 ?auto_113545 ) ) ( not ( = ?auto_113554 ?auto_113555 ) ) ( HOIST-AT ?auto_113553 ?auto_113554 ) ( not ( = ?auto_113549 ?auto_113553 ) ) ( SURFACE-AT ?auto_113545 ?auto_113554 ) ( ON ?auto_113545 ?auto_113550 ) ( CLEAR ?auto_113545 ) ( not ( = ?auto_113548 ?auto_113550 ) ) ( not ( = ?auto_113545 ?auto_113550 ) ) ( not ( = ?auto_113547 ?auto_113550 ) ) ( SURFACE-AT ?auto_113547 ?auto_113555 ) ( CLEAR ?auto_113547 ) ( IS-CRATE ?auto_113548 ) ( AVAILABLE ?auto_113549 ) ( AVAILABLE ?auto_113553 ) ( SURFACE-AT ?auto_113548 ?auto_113554 ) ( ON ?auto_113548 ?auto_113551 ) ( CLEAR ?auto_113548 ) ( not ( = ?auto_113548 ?auto_113551 ) ) ( not ( = ?auto_113545 ?auto_113551 ) ) ( not ( = ?auto_113547 ?auto_113551 ) ) ( not ( = ?auto_113550 ?auto_113551 ) ) ( TRUCK-AT ?auto_113552 ?auto_113555 ) ( ON ?auto_113547 ?auto_113546 ) ( not ( = ?auto_113546 ?auto_113547 ) ) ( not ( = ?auto_113546 ?auto_113548 ) ) ( not ( = ?auto_113546 ?auto_113545 ) ) ( not ( = ?auto_113546 ?auto_113550 ) ) ( not ( = ?auto_113546 ?auto_113551 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113547 ?auto_113548 ?auto_113545 )
      ( MAKE-3CRATE-VERIFY ?auto_113546 ?auto_113547 ?auto_113548 ?auto_113545 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113557 - SURFACE
      ?auto_113558 - SURFACE
      ?auto_113559 - SURFACE
      ?auto_113556 - SURFACE
      ?auto_113560 - SURFACE
    )
    :vars
    (
      ?auto_113561 - HOIST
      ?auto_113567 - PLACE
      ?auto_113566 - PLACE
      ?auto_113565 - HOIST
      ?auto_113562 - SURFACE
      ?auto_113563 - SURFACE
      ?auto_113564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113561 ?auto_113567 ) ( IS-CRATE ?auto_113560 ) ( not ( = ?auto_113556 ?auto_113560 ) ) ( not ( = ?auto_113559 ?auto_113556 ) ) ( not ( = ?auto_113559 ?auto_113560 ) ) ( not ( = ?auto_113566 ?auto_113567 ) ) ( HOIST-AT ?auto_113565 ?auto_113566 ) ( not ( = ?auto_113561 ?auto_113565 ) ) ( SURFACE-AT ?auto_113560 ?auto_113566 ) ( ON ?auto_113560 ?auto_113562 ) ( CLEAR ?auto_113560 ) ( not ( = ?auto_113556 ?auto_113562 ) ) ( not ( = ?auto_113560 ?auto_113562 ) ) ( not ( = ?auto_113559 ?auto_113562 ) ) ( SURFACE-AT ?auto_113559 ?auto_113567 ) ( CLEAR ?auto_113559 ) ( IS-CRATE ?auto_113556 ) ( AVAILABLE ?auto_113561 ) ( AVAILABLE ?auto_113565 ) ( SURFACE-AT ?auto_113556 ?auto_113566 ) ( ON ?auto_113556 ?auto_113563 ) ( CLEAR ?auto_113556 ) ( not ( = ?auto_113556 ?auto_113563 ) ) ( not ( = ?auto_113560 ?auto_113563 ) ) ( not ( = ?auto_113559 ?auto_113563 ) ) ( not ( = ?auto_113562 ?auto_113563 ) ) ( TRUCK-AT ?auto_113564 ?auto_113567 ) ( ON ?auto_113558 ?auto_113557 ) ( ON ?auto_113559 ?auto_113558 ) ( not ( = ?auto_113557 ?auto_113558 ) ) ( not ( = ?auto_113557 ?auto_113559 ) ) ( not ( = ?auto_113557 ?auto_113556 ) ) ( not ( = ?auto_113557 ?auto_113560 ) ) ( not ( = ?auto_113557 ?auto_113562 ) ) ( not ( = ?auto_113557 ?auto_113563 ) ) ( not ( = ?auto_113558 ?auto_113559 ) ) ( not ( = ?auto_113558 ?auto_113556 ) ) ( not ( = ?auto_113558 ?auto_113560 ) ) ( not ( = ?auto_113558 ?auto_113562 ) ) ( not ( = ?auto_113558 ?auto_113563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113559 ?auto_113556 ?auto_113560 )
      ( MAKE-4CRATE-VERIFY ?auto_113557 ?auto_113558 ?auto_113559 ?auto_113556 ?auto_113560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_113568 - SURFACE
      ?auto_113569 - SURFACE
    )
    :vars
    (
      ?auto_113570 - HOIST
      ?auto_113577 - PLACE
      ?auto_113572 - SURFACE
      ?auto_113576 - PLACE
      ?auto_113575 - HOIST
      ?auto_113571 - SURFACE
      ?auto_113573 - SURFACE
      ?auto_113574 - TRUCK
      ?auto_113578 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113570 ?auto_113577 ) ( IS-CRATE ?auto_113569 ) ( not ( = ?auto_113568 ?auto_113569 ) ) ( not ( = ?auto_113572 ?auto_113568 ) ) ( not ( = ?auto_113572 ?auto_113569 ) ) ( not ( = ?auto_113576 ?auto_113577 ) ) ( HOIST-AT ?auto_113575 ?auto_113576 ) ( not ( = ?auto_113570 ?auto_113575 ) ) ( SURFACE-AT ?auto_113569 ?auto_113576 ) ( ON ?auto_113569 ?auto_113571 ) ( CLEAR ?auto_113569 ) ( not ( = ?auto_113568 ?auto_113571 ) ) ( not ( = ?auto_113569 ?auto_113571 ) ) ( not ( = ?auto_113572 ?auto_113571 ) ) ( IS-CRATE ?auto_113568 ) ( AVAILABLE ?auto_113575 ) ( SURFACE-AT ?auto_113568 ?auto_113576 ) ( ON ?auto_113568 ?auto_113573 ) ( CLEAR ?auto_113568 ) ( not ( = ?auto_113568 ?auto_113573 ) ) ( not ( = ?auto_113569 ?auto_113573 ) ) ( not ( = ?auto_113572 ?auto_113573 ) ) ( not ( = ?auto_113571 ?auto_113573 ) ) ( TRUCK-AT ?auto_113574 ?auto_113577 ) ( SURFACE-AT ?auto_113578 ?auto_113577 ) ( CLEAR ?auto_113578 ) ( LIFTING ?auto_113570 ?auto_113572 ) ( IS-CRATE ?auto_113572 ) ( not ( = ?auto_113578 ?auto_113572 ) ) ( not ( = ?auto_113568 ?auto_113578 ) ) ( not ( = ?auto_113569 ?auto_113578 ) ) ( not ( = ?auto_113571 ?auto_113578 ) ) ( not ( = ?auto_113573 ?auto_113578 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113578 ?auto_113572 )
      ( MAKE-2CRATE ?auto_113572 ?auto_113568 ?auto_113569 )
      ( MAKE-1CRATE-VERIFY ?auto_113568 ?auto_113569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_113579 - SURFACE
      ?auto_113580 - SURFACE
      ?auto_113581 - SURFACE
    )
    :vars
    (
      ?auto_113587 - HOIST
      ?auto_113583 - PLACE
      ?auto_113588 - PLACE
      ?auto_113585 - HOIST
      ?auto_113582 - SURFACE
      ?auto_113586 - SURFACE
      ?auto_113589 - TRUCK
      ?auto_113584 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113587 ?auto_113583 ) ( IS-CRATE ?auto_113581 ) ( not ( = ?auto_113580 ?auto_113581 ) ) ( not ( = ?auto_113579 ?auto_113580 ) ) ( not ( = ?auto_113579 ?auto_113581 ) ) ( not ( = ?auto_113588 ?auto_113583 ) ) ( HOIST-AT ?auto_113585 ?auto_113588 ) ( not ( = ?auto_113587 ?auto_113585 ) ) ( SURFACE-AT ?auto_113581 ?auto_113588 ) ( ON ?auto_113581 ?auto_113582 ) ( CLEAR ?auto_113581 ) ( not ( = ?auto_113580 ?auto_113582 ) ) ( not ( = ?auto_113581 ?auto_113582 ) ) ( not ( = ?auto_113579 ?auto_113582 ) ) ( IS-CRATE ?auto_113580 ) ( AVAILABLE ?auto_113585 ) ( SURFACE-AT ?auto_113580 ?auto_113588 ) ( ON ?auto_113580 ?auto_113586 ) ( CLEAR ?auto_113580 ) ( not ( = ?auto_113580 ?auto_113586 ) ) ( not ( = ?auto_113581 ?auto_113586 ) ) ( not ( = ?auto_113579 ?auto_113586 ) ) ( not ( = ?auto_113582 ?auto_113586 ) ) ( TRUCK-AT ?auto_113589 ?auto_113583 ) ( SURFACE-AT ?auto_113584 ?auto_113583 ) ( CLEAR ?auto_113584 ) ( LIFTING ?auto_113587 ?auto_113579 ) ( IS-CRATE ?auto_113579 ) ( not ( = ?auto_113584 ?auto_113579 ) ) ( not ( = ?auto_113580 ?auto_113584 ) ) ( not ( = ?auto_113581 ?auto_113584 ) ) ( not ( = ?auto_113582 ?auto_113584 ) ) ( not ( = ?auto_113586 ?auto_113584 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113580 ?auto_113581 )
      ( MAKE-2CRATE-VERIFY ?auto_113579 ?auto_113580 ?auto_113581 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_113591 - SURFACE
      ?auto_113592 - SURFACE
      ?auto_113593 - SURFACE
      ?auto_113590 - SURFACE
    )
    :vars
    (
      ?auto_113598 - HOIST
      ?auto_113594 - PLACE
      ?auto_113595 - PLACE
      ?auto_113600 - HOIST
      ?auto_113599 - SURFACE
      ?auto_113597 - SURFACE
      ?auto_113596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113598 ?auto_113594 ) ( IS-CRATE ?auto_113590 ) ( not ( = ?auto_113593 ?auto_113590 ) ) ( not ( = ?auto_113592 ?auto_113593 ) ) ( not ( = ?auto_113592 ?auto_113590 ) ) ( not ( = ?auto_113595 ?auto_113594 ) ) ( HOIST-AT ?auto_113600 ?auto_113595 ) ( not ( = ?auto_113598 ?auto_113600 ) ) ( SURFACE-AT ?auto_113590 ?auto_113595 ) ( ON ?auto_113590 ?auto_113599 ) ( CLEAR ?auto_113590 ) ( not ( = ?auto_113593 ?auto_113599 ) ) ( not ( = ?auto_113590 ?auto_113599 ) ) ( not ( = ?auto_113592 ?auto_113599 ) ) ( IS-CRATE ?auto_113593 ) ( AVAILABLE ?auto_113600 ) ( SURFACE-AT ?auto_113593 ?auto_113595 ) ( ON ?auto_113593 ?auto_113597 ) ( CLEAR ?auto_113593 ) ( not ( = ?auto_113593 ?auto_113597 ) ) ( not ( = ?auto_113590 ?auto_113597 ) ) ( not ( = ?auto_113592 ?auto_113597 ) ) ( not ( = ?auto_113599 ?auto_113597 ) ) ( TRUCK-AT ?auto_113596 ?auto_113594 ) ( SURFACE-AT ?auto_113591 ?auto_113594 ) ( CLEAR ?auto_113591 ) ( LIFTING ?auto_113598 ?auto_113592 ) ( IS-CRATE ?auto_113592 ) ( not ( = ?auto_113591 ?auto_113592 ) ) ( not ( = ?auto_113593 ?auto_113591 ) ) ( not ( = ?auto_113590 ?auto_113591 ) ) ( not ( = ?auto_113599 ?auto_113591 ) ) ( not ( = ?auto_113597 ?auto_113591 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113592 ?auto_113593 ?auto_113590 )
      ( MAKE-3CRATE-VERIFY ?auto_113591 ?auto_113592 ?auto_113593 ?auto_113590 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113602 - SURFACE
      ?auto_113603 - SURFACE
      ?auto_113604 - SURFACE
      ?auto_113601 - SURFACE
      ?auto_113605 - SURFACE
    )
    :vars
    (
      ?auto_113610 - HOIST
      ?auto_113606 - PLACE
      ?auto_113607 - PLACE
      ?auto_113612 - HOIST
      ?auto_113611 - SURFACE
      ?auto_113609 - SURFACE
      ?auto_113608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113610 ?auto_113606 ) ( IS-CRATE ?auto_113605 ) ( not ( = ?auto_113601 ?auto_113605 ) ) ( not ( = ?auto_113604 ?auto_113601 ) ) ( not ( = ?auto_113604 ?auto_113605 ) ) ( not ( = ?auto_113607 ?auto_113606 ) ) ( HOIST-AT ?auto_113612 ?auto_113607 ) ( not ( = ?auto_113610 ?auto_113612 ) ) ( SURFACE-AT ?auto_113605 ?auto_113607 ) ( ON ?auto_113605 ?auto_113611 ) ( CLEAR ?auto_113605 ) ( not ( = ?auto_113601 ?auto_113611 ) ) ( not ( = ?auto_113605 ?auto_113611 ) ) ( not ( = ?auto_113604 ?auto_113611 ) ) ( IS-CRATE ?auto_113601 ) ( AVAILABLE ?auto_113612 ) ( SURFACE-AT ?auto_113601 ?auto_113607 ) ( ON ?auto_113601 ?auto_113609 ) ( CLEAR ?auto_113601 ) ( not ( = ?auto_113601 ?auto_113609 ) ) ( not ( = ?auto_113605 ?auto_113609 ) ) ( not ( = ?auto_113604 ?auto_113609 ) ) ( not ( = ?auto_113611 ?auto_113609 ) ) ( TRUCK-AT ?auto_113608 ?auto_113606 ) ( SURFACE-AT ?auto_113603 ?auto_113606 ) ( CLEAR ?auto_113603 ) ( LIFTING ?auto_113610 ?auto_113604 ) ( IS-CRATE ?auto_113604 ) ( not ( = ?auto_113603 ?auto_113604 ) ) ( not ( = ?auto_113601 ?auto_113603 ) ) ( not ( = ?auto_113605 ?auto_113603 ) ) ( not ( = ?auto_113611 ?auto_113603 ) ) ( not ( = ?auto_113609 ?auto_113603 ) ) ( ON ?auto_113603 ?auto_113602 ) ( not ( = ?auto_113602 ?auto_113603 ) ) ( not ( = ?auto_113602 ?auto_113604 ) ) ( not ( = ?auto_113602 ?auto_113601 ) ) ( not ( = ?auto_113602 ?auto_113605 ) ) ( not ( = ?auto_113602 ?auto_113611 ) ) ( not ( = ?auto_113602 ?auto_113609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113604 ?auto_113601 ?auto_113605 )
      ( MAKE-4CRATE-VERIFY ?auto_113602 ?auto_113603 ?auto_113604 ?auto_113601 ?auto_113605 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114049 - SURFACE
      ?auto_114050 - SURFACE
      ?auto_114051 - SURFACE
      ?auto_114048 - SURFACE
      ?auto_114052 - SURFACE
      ?auto_114053 - SURFACE
    )
    :vars
    (
      ?auto_114054 - HOIST
      ?auto_114055 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_114054 ?auto_114055 ) ( SURFACE-AT ?auto_114052 ?auto_114055 ) ( CLEAR ?auto_114052 ) ( LIFTING ?auto_114054 ?auto_114053 ) ( IS-CRATE ?auto_114053 ) ( not ( = ?auto_114052 ?auto_114053 ) ) ( ON ?auto_114050 ?auto_114049 ) ( ON ?auto_114051 ?auto_114050 ) ( ON ?auto_114048 ?auto_114051 ) ( ON ?auto_114052 ?auto_114048 ) ( not ( = ?auto_114049 ?auto_114050 ) ) ( not ( = ?auto_114049 ?auto_114051 ) ) ( not ( = ?auto_114049 ?auto_114048 ) ) ( not ( = ?auto_114049 ?auto_114052 ) ) ( not ( = ?auto_114049 ?auto_114053 ) ) ( not ( = ?auto_114050 ?auto_114051 ) ) ( not ( = ?auto_114050 ?auto_114048 ) ) ( not ( = ?auto_114050 ?auto_114052 ) ) ( not ( = ?auto_114050 ?auto_114053 ) ) ( not ( = ?auto_114051 ?auto_114048 ) ) ( not ( = ?auto_114051 ?auto_114052 ) ) ( not ( = ?auto_114051 ?auto_114053 ) ) ( not ( = ?auto_114048 ?auto_114052 ) ) ( not ( = ?auto_114048 ?auto_114053 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_114052 ?auto_114053 )
      ( MAKE-5CRATE-VERIFY ?auto_114049 ?auto_114050 ?auto_114051 ?auto_114048 ?auto_114052 ?auto_114053 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114083 - SURFACE
      ?auto_114084 - SURFACE
      ?auto_114085 - SURFACE
      ?auto_114082 - SURFACE
      ?auto_114086 - SURFACE
      ?auto_114087 - SURFACE
    )
    :vars
    (
      ?auto_114088 - HOIST
      ?auto_114090 - PLACE
      ?auto_114089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114088 ?auto_114090 ) ( SURFACE-AT ?auto_114086 ?auto_114090 ) ( CLEAR ?auto_114086 ) ( IS-CRATE ?auto_114087 ) ( not ( = ?auto_114086 ?auto_114087 ) ) ( TRUCK-AT ?auto_114089 ?auto_114090 ) ( AVAILABLE ?auto_114088 ) ( IN ?auto_114087 ?auto_114089 ) ( ON ?auto_114086 ?auto_114082 ) ( not ( = ?auto_114082 ?auto_114086 ) ) ( not ( = ?auto_114082 ?auto_114087 ) ) ( ON ?auto_114084 ?auto_114083 ) ( ON ?auto_114085 ?auto_114084 ) ( ON ?auto_114082 ?auto_114085 ) ( not ( = ?auto_114083 ?auto_114084 ) ) ( not ( = ?auto_114083 ?auto_114085 ) ) ( not ( = ?auto_114083 ?auto_114082 ) ) ( not ( = ?auto_114083 ?auto_114086 ) ) ( not ( = ?auto_114083 ?auto_114087 ) ) ( not ( = ?auto_114084 ?auto_114085 ) ) ( not ( = ?auto_114084 ?auto_114082 ) ) ( not ( = ?auto_114084 ?auto_114086 ) ) ( not ( = ?auto_114084 ?auto_114087 ) ) ( not ( = ?auto_114085 ?auto_114082 ) ) ( not ( = ?auto_114085 ?auto_114086 ) ) ( not ( = ?auto_114085 ?auto_114087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114082 ?auto_114086 ?auto_114087 )
      ( MAKE-5CRATE-VERIFY ?auto_114083 ?auto_114084 ?auto_114085 ?auto_114082 ?auto_114086 ?auto_114087 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114123 - SURFACE
      ?auto_114124 - SURFACE
      ?auto_114125 - SURFACE
      ?auto_114122 - SURFACE
      ?auto_114126 - SURFACE
      ?auto_114127 - SURFACE
    )
    :vars
    (
      ?auto_114129 - HOIST
      ?auto_114130 - PLACE
      ?auto_114131 - TRUCK
      ?auto_114128 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_114129 ?auto_114130 ) ( SURFACE-AT ?auto_114126 ?auto_114130 ) ( CLEAR ?auto_114126 ) ( IS-CRATE ?auto_114127 ) ( not ( = ?auto_114126 ?auto_114127 ) ) ( AVAILABLE ?auto_114129 ) ( IN ?auto_114127 ?auto_114131 ) ( ON ?auto_114126 ?auto_114122 ) ( not ( = ?auto_114122 ?auto_114126 ) ) ( not ( = ?auto_114122 ?auto_114127 ) ) ( TRUCK-AT ?auto_114131 ?auto_114128 ) ( not ( = ?auto_114128 ?auto_114130 ) ) ( ON ?auto_114124 ?auto_114123 ) ( ON ?auto_114125 ?auto_114124 ) ( ON ?auto_114122 ?auto_114125 ) ( not ( = ?auto_114123 ?auto_114124 ) ) ( not ( = ?auto_114123 ?auto_114125 ) ) ( not ( = ?auto_114123 ?auto_114122 ) ) ( not ( = ?auto_114123 ?auto_114126 ) ) ( not ( = ?auto_114123 ?auto_114127 ) ) ( not ( = ?auto_114124 ?auto_114125 ) ) ( not ( = ?auto_114124 ?auto_114122 ) ) ( not ( = ?auto_114124 ?auto_114126 ) ) ( not ( = ?auto_114124 ?auto_114127 ) ) ( not ( = ?auto_114125 ?auto_114122 ) ) ( not ( = ?auto_114125 ?auto_114126 ) ) ( not ( = ?auto_114125 ?auto_114127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114122 ?auto_114126 ?auto_114127 )
      ( MAKE-5CRATE-VERIFY ?auto_114123 ?auto_114124 ?auto_114125 ?auto_114122 ?auto_114126 ?auto_114127 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114168 - SURFACE
      ?auto_114169 - SURFACE
      ?auto_114170 - SURFACE
      ?auto_114167 - SURFACE
      ?auto_114171 - SURFACE
      ?auto_114172 - SURFACE
    )
    :vars
    (
      ?auto_114175 - HOIST
      ?auto_114174 - PLACE
      ?auto_114173 - TRUCK
      ?auto_114176 - PLACE
      ?auto_114177 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_114175 ?auto_114174 ) ( SURFACE-AT ?auto_114171 ?auto_114174 ) ( CLEAR ?auto_114171 ) ( IS-CRATE ?auto_114172 ) ( not ( = ?auto_114171 ?auto_114172 ) ) ( AVAILABLE ?auto_114175 ) ( ON ?auto_114171 ?auto_114167 ) ( not ( = ?auto_114167 ?auto_114171 ) ) ( not ( = ?auto_114167 ?auto_114172 ) ) ( TRUCK-AT ?auto_114173 ?auto_114176 ) ( not ( = ?auto_114176 ?auto_114174 ) ) ( HOIST-AT ?auto_114177 ?auto_114176 ) ( LIFTING ?auto_114177 ?auto_114172 ) ( not ( = ?auto_114175 ?auto_114177 ) ) ( ON ?auto_114169 ?auto_114168 ) ( ON ?auto_114170 ?auto_114169 ) ( ON ?auto_114167 ?auto_114170 ) ( not ( = ?auto_114168 ?auto_114169 ) ) ( not ( = ?auto_114168 ?auto_114170 ) ) ( not ( = ?auto_114168 ?auto_114167 ) ) ( not ( = ?auto_114168 ?auto_114171 ) ) ( not ( = ?auto_114168 ?auto_114172 ) ) ( not ( = ?auto_114169 ?auto_114170 ) ) ( not ( = ?auto_114169 ?auto_114167 ) ) ( not ( = ?auto_114169 ?auto_114171 ) ) ( not ( = ?auto_114169 ?auto_114172 ) ) ( not ( = ?auto_114170 ?auto_114167 ) ) ( not ( = ?auto_114170 ?auto_114171 ) ) ( not ( = ?auto_114170 ?auto_114172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114167 ?auto_114171 ?auto_114172 )
      ( MAKE-5CRATE-VERIFY ?auto_114168 ?auto_114169 ?auto_114170 ?auto_114167 ?auto_114171 ?auto_114172 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114218 - SURFACE
      ?auto_114219 - SURFACE
      ?auto_114220 - SURFACE
      ?auto_114217 - SURFACE
      ?auto_114221 - SURFACE
      ?auto_114222 - SURFACE
    )
    :vars
    (
      ?auto_114225 - HOIST
      ?auto_114228 - PLACE
      ?auto_114226 - TRUCK
      ?auto_114224 - PLACE
      ?auto_114227 - HOIST
      ?auto_114223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_114225 ?auto_114228 ) ( SURFACE-AT ?auto_114221 ?auto_114228 ) ( CLEAR ?auto_114221 ) ( IS-CRATE ?auto_114222 ) ( not ( = ?auto_114221 ?auto_114222 ) ) ( AVAILABLE ?auto_114225 ) ( ON ?auto_114221 ?auto_114217 ) ( not ( = ?auto_114217 ?auto_114221 ) ) ( not ( = ?auto_114217 ?auto_114222 ) ) ( TRUCK-AT ?auto_114226 ?auto_114224 ) ( not ( = ?auto_114224 ?auto_114228 ) ) ( HOIST-AT ?auto_114227 ?auto_114224 ) ( not ( = ?auto_114225 ?auto_114227 ) ) ( AVAILABLE ?auto_114227 ) ( SURFACE-AT ?auto_114222 ?auto_114224 ) ( ON ?auto_114222 ?auto_114223 ) ( CLEAR ?auto_114222 ) ( not ( = ?auto_114221 ?auto_114223 ) ) ( not ( = ?auto_114222 ?auto_114223 ) ) ( not ( = ?auto_114217 ?auto_114223 ) ) ( ON ?auto_114219 ?auto_114218 ) ( ON ?auto_114220 ?auto_114219 ) ( ON ?auto_114217 ?auto_114220 ) ( not ( = ?auto_114218 ?auto_114219 ) ) ( not ( = ?auto_114218 ?auto_114220 ) ) ( not ( = ?auto_114218 ?auto_114217 ) ) ( not ( = ?auto_114218 ?auto_114221 ) ) ( not ( = ?auto_114218 ?auto_114222 ) ) ( not ( = ?auto_114218 ?auto_114223 ) ) ( not ( = ?auto_114219 ?auto_114220 ) ) ( not ( = ?auto_114219 ?auto_114217 ) ) ( not ( = ?auto_114219 ?auto_114221 ) ) ( not ( = ?auto_114219 ?auto_114222 ) ) ( not ( = ?auto_114219 ?auto_114223 ) ) ( not ( = ?auto_114220 ?auto_114217 ) ) ( not ( = ?auto_114220 ?auto_114221 ) ) ( not ( = ?auto_114220 ?auto_114222 ) ) ( not ( = ?auto_114220 ?auto_114223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114217 ?auto_114221 ?auto_114222 )
      ( MAKE-5CRATE-VERIFY ?auto_114218 ?auto_114219 ?auto_114220 ?auto_114217 ?auto_114221 ?auto_114222 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114269 - SURFACE
      ?auto_114270 - SURFACE
      ?auto_114271 - SURFACE
      ?auto_114268 - SURFACE
      ?auto_114272 - SURFACE
      ?auto_114273 - SURFACE
    )
    :vars
    (
      ?auto_114276 - HOIST
      ?auto_114279 - PLACE
      ?auto_114278 - PLACE
      ?auto_114277 - HOIST
      ?auto_114275 - SURFACE
      ?auto_114274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114276 ?auto_114279 ) ( SURFACE-AT ?auto_114272 ?auto_114279 ) ( CLEAR ?auto_114272 ) ( IS-CRATE ?auto_114273 ) ( not ( = ?auto_114272 ?auto_114273 ) ) ( AVAILABLE ?auto_114276 ) ( ON ?auto_114272 ?auto_114268 ) ( not ( = ?auto_114268 ?auto_114272 ) ) ( not ( = ?auto_114268 ?auto_114273 ) ) ( not ( = ?auto_114278 ?auto_114279 ) ) ( HOIST-AT ?auto_114277 ?auto_114278 ) ( not ( = ?auto_114276 ?auto_114277 ) ) ( AVAILABLE ?auto_114277 ) ( SURFACE-AT ?auto_114273 ?auto_114278 ) ( ON ?auto_114273 ?auto_114275 ) ( CLEAR ?auto_114273 ) ( not ( = ?auto_114272 ?auto_114275 ) ) ( not ( = ?auto_114273 ?auto_114275 ) ) ( not ( = ?auto_114268 ?auto_114275 ) ) ( TRUCK-AT ?auto_114274 ?auto_114279 ) ( ON ?auto_114270 ?auto_114269 ) ( ON ?auto_114271 ?auto_114270 ) ( ON ?auto_114268 ?auto_114271 ) ( not ( = ?auto_114269 ?auto_114270 ) ) ( not ( = ?auto_114269 ?auto_114271 ) ) ( not ( = ?auto_114269 ?auto_114268 ) ) ( not ( = ?auto_114269 ?auto_114272 ) ) ( not ( = ?auto_114269 ?auto_114273 ) ) ( not ( = ?auto_114269 ?auto_114275 ) ) ( not ( = ?auto_114270 ?auto_114271 ) ) ( not ( = ?auto_114270 ?auto_114268 ) ) ( not ( = ?auto_114270 ?auto_114272 ) ) ( not ( = ?auto_114270 ?auto_114273 ) ) ( not ( = ?auto_114270 ?auto_114275 ) ) ( not ( = ?auto_114271 ?auto_114268 ) ) ( not ( = ?auto_114271 ?auto_114272 ) ) ( not ( = ?auto_114271 ?auto_114273 ) ) ( not ( = ?auto_114271 ?auto_114275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114268 ?auto_114272 ?auto_114273 )
      ( MAKE-5CRATE-VERIFY ?auto_114269 ?auto_114270 ?auto_114271 ?auto_114268 ?auto_114272 ?auto_114273 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114320 - SURFACE
      ?auto_114321 - SURFACE
      ?auto_114322 - SURFACE
      ?auto_114319 - SURFACE
      ?auto_114323 - SURFACE
      ?auto_114324 - SURFACE
    )
    :vars
    (
      ?auto_114329 - HOIST
      ?auto_114330 - PLACE
      ?auto_114325 - PLACE
      ?auto_114327 - HOIST
      ?auto_114326 - SURFACE
      ?auto_114328 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114329 ?auto_114330 ) ( IS-CRATE ?auto_114324 ) ( not ( = ?auto_114323 ?auto_114324 ) ) ( not ( = ?auto_114319 ?auto_114323 ) ) ( not ( = ?auto_114319 ?auto_114324 ) ) ( not ( = ?auto_114325 ?auto_114330 ) ) ( HOIST-AT ?auto_114327 ?auto_114325 ) ( not ( = ?auto_114329 ?auto_114327 ) ) ( AVAILABLE ?auto_114327 ) ( SURFACE-AT ?auto_114324 ?auto_114325 ) ( ON ?auto_114324 ?auto_114326 ) ( CLEAR ?auto_114324 ) ( not ( = ?auto_114323 ?auto_114326 ) ) ( not ( = ?auto_114324 ?auto_114326 ) ) ( not ( = ?auto_114319 ?auto_114326 ) ) ( TRUCK-AT ?auto_114328 ?auto_114330 ) ( SURFACE-AT ?auto_114319 ?auto_114330 ) ( CLEAR ?auto_114319 ) ( LIFTING ?auto_114329 ?auto_114323 ) ( IS-CRATE ?auto_114323 ) ( ON ?auto_114321 ?auto_114320 ) ( ON ?auto_114322 ?auto_114321 ) ( ON ?auto_114319 ?auto_114322 ) ( not ( = ?auto_114320 ?auto_114321 ) ) ( not ( = ?auto_114320 ?auto_114322 ) ) ( not ( = ?auto_114320 ?auto_114319 ) ) ( not ( = ?auto_114320 ?auto_114323 ) ) ( not ( = ?auto_114320 ?auto_114324 ) ) ( not ( = ?auto_114320 ?auto_114326 ) ) ( not ( = ?auto_114321 ?auto_114322 ) ) ( not ( = ?auto_114321 ?auto_114319 ) ) ( not ( = ?auto_114321 ?auto_114323 ) ) ( not ( = ?auto_114321 ?auto_114324 ) ) ( not ( = ?auto_114321 ?auto_114326 ) ) ( not ( = ?auto_114322 ?auto_114319 ) ) ( not ( = ?auto_114322 ?auto_114323 ) ) ( not ( = ?auto_114322 ?auto_114324 ) ) ( not ( = ?auto_114322 ?auto_114326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114319 ?auto_114323 ?auto_114324 )
      ( MAKE-5CRATE-VERIFY ?auto_114320 ?auto_114321 ?auto_114322 ?auto_114319 ?auto_114323 ?auto_114324 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114371 - SURFACE
      ?auto_114372 - SURFACE
      ?auto_114373 - SURFACE
      ?auto_114370 - SURFACE
      ?auto_114374 - SURFACE
      ?auto_114375 - SURFACE
    )
    :vars
    (
      ?auto_114381 - HOIST
      ?auto_114379 - PLACE
      ?auto_114376 - PLACE
      ?auto_114380 - HOIST
      ?auto_114378 - SURFACE
      ?auto_114377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114381 ?auto_114379 ) ( IS-CRATE ?auto_114375 ) ( not ( = ?auto_114374 ?auto_114375 ) ) ( not ( = ?auto_114370 ?auto_114374 ) ) ( not ( = ?auto_114370 ?auto_114375 ) ) ( not ( = ?auto_114376 ?auto_114379 ) ) ( HOIST-AT ?auto_114380 ?auto_114376 ) ( not ( = ?auto_114381 ?auto_114380 ) ) ( AVAILABLE ?auto_114380 ) ( SURFACE-AT ?auto_114375 ?auto_114376 ) ( ON ?auto_114375 ?auto_114378 ) ( CLEAR ?auto_114375 ) ( not ( = ?auto_114374 ?auto_114378 ) ) ( not ( = ?auto_114375 ?auto_114378 ) ) ( not ( = ?auto_114370 ?auto_114378 ) ) ( TRUCK-AT ?auto_114377 ?auto_114379 ) ( SURFACE-AT ?auto_114370 ?auto_114379 ) ( CLEAR ?auto_114370 ) ( IS-CRATE ?auto_114374 ) ( AVAILABLE ?auto_114381 ) ( IN ?auto_114374 ?auto_114377 ) ( ON ?auto_114372 ?auto_114371 ) ( ON ?auto_114373 ?auto_114372 ) ( ON ?auto_114370 ?auto_114373 ) ( not ( = ?auto_114371 ?auto_114372 ) ) ( not ( = ?auto_114371 ?auto_114373 ) ) ( not ( = ?auto_114371 ?auto_114370 ) ) ( not ( = ?auto_114371 ?auto_114374 ) ) ( not ( = ?auto_114371 ?auto_114375 ) ) ( not ( = ?auto_114371 ?auto_114378 ) ) ( not ( = ?auto_114372 ?auto_114373 ) ) ( not ( = ?auto_114372 ?auto_114370 ) ) ( not ( = ?auto_114372 ?auto_114374 ) ) ( not ( = ?auto_114372 ?auto_114375 ) ) ( not ( = ?auto_114372 ?auto_114378 ) ) ( not ( = ?auto_114373 ?auto_114370 ) ) ( not ( = ?auto_114373 ?auto_114374 ) ) ( not ( = ?auto_114373 ?auto_114375 ) ) ( not ( = ?auto_114373 ?auto_114378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114370 ?auto_114374 ?auto_114375 )
      ( MAKE-5CRATE-VERIFY ?auto_114371 ?auto_114372 ?auto_114373 ?auto_114370 ?auto_114374 ?auto_114375 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_114738 - SURFACE
      ?auto_114739 - SURFACE
    )
    :vars
    (
      ?auto_114743 - HOIST
      ?auto_114740 - PLACE
      ?auto_114742 - SURFACE
      ?auto_114741 - PLACE
      ?auto_114746 - HOIST
      ?auto_114744 - SURFACE
      ?auto_114745 - TRUCK
      ?auto_114747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_114743 ?auto_114740 ) ( SURFACE-AT ?auto_114738 ?auto_114740 ) ( CLEAR ?auto_114738 ) ( IS-CRATE ?auto_114739 ) ( not ( = ?auto_114738 ?auto_114739 ) ) ( ON ?auto_114738 ?auto_114742 ) ( not ( = ?auto_114742 ?auto_114738 ) ) ( not ( = ?auto_114742 ?auto_114739 ) ) ( not ( = ?auto_114741 ?auto_114740 ) ) ( HOIST-AT ?auto_114746 ?auto_114741 ) ( not ( = ?auto_114743 ?auto_114746 ) ) ( AVAILABLE ?auto_114746 ) ( SURFACE-AT ?auto_114739 ?auto_114741 ) ( ON ?auto_114739 ?auto_114744 ) ( CLEAR ?auto_114739 ) ( not ( = ?auto_114738 ?auto_114744 ) ) ( not ( = ?auto_114739 ?auto_114744 ) ) ( not ( = ?auto_114742 ?auto_114744 ) ) ( TRUCK-AT ?auto_114745 ?auto_114740 ) ( LIFTING ?auto_114743 ?auto_114747 ) ( IS-CRATE ?auto_114747 ) ( not ( = ?auto_114738 ?auto_114747 ) ) ( not ( = ?auto_114739 ?auto_114747 ) ) ( not ( = ?auto_114742 ?auto_114747 ) ) ( not ( = ?auto_114744 ?auto_114747 ) ) )
    :subtasks
    ( ( !LOAD ?auto_114743 ?auto_114747 ?auto_114745 ?auto_114740 )
      ( MAKE-1CRATE ?auto_114738 ?auto_114739 )
      ( MAKE-1CRATE-VERIFY ?auto_114738 ?auto_114739 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115576 - SURFACE
      ?auto_115577 - SURFACE
      ?auto_115578 - SURFACE
      ?auto_115575 - SURFACE
      ?auto_115579 - SURFACE
      ?auto_115581 - SURFACE
      ?auto_115580 - SURFACE
    )
    :vars
    (
      ?auto_115583 - HOIST
      ?auto_115582 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_115583 ?auto_115582 ) ( SURFACE-AT ?auto_115581 ?auto_115582 ) ( CLEAR ?auto_115581 ) ( LIFTING ?auto_115583 ?auto_115580 ) ( IS-CRATE ?auto_115580 ) ( not ( = ?auto_115581 ?auto_115580 ) ) ( ON ?auto_115577 ?auto_115576 ) ( ON ?auto_115578 ?auto_115577 ) ( ON ?auto_115575 ?auto_115578 ) ( ON ?auto_115579 ?auto_115575 ) ( ON ?auto_115581 ?auto_115579 ) ( not ( = ?auto_115576 ?auto_115577 ) ) ( not ( = ?auto_115576 ?auto_115578 ) ) ( not ( = ?auto_115576 ?auto_115575 ) ) ( not ( = ?auto_115576 ?auto_115579 ) ) ( not ( = ?auto_115576 ?auto_115581 ) ) ( not ( = ?auto_115576 ?auto_115580 ) ) ( not ( = ?auto_115577 ?auto_115578 ) ) ( not ( = ?auto_115577 ?auto_115575 ) ) ( not ( = ?auto_115577 ?auto_115579 ) ) ( not ( = ?auto_115577 ?auto_115581 ) ) ( not ( = ?auto_115577 ?auto_115580 ) ) ( not ( = ?auto_115578 ?auto_115575 ) ) ( not ( = ?auto_115578 ?auto_115579 ) ) ( not ( = ?auto_115578 ?auto_115581 ) ) ( not ( = ?auto_115578 ?auto_115580 ) ) ( not ( = ?auto_115575 ?auto_115579 ) ) ( not ( = ?auto_115575 ?auto_115581 ) ) ( not ( = ?auto_115575 ?auto_115580 ) ) ( not ( = ?auto_115579 ?auto_115581 ) ) ( not ( = ?auto_115579 ?auto_115580 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_115581 ?auto_115580 )
      ( MAKE-6CRATE-VERIFY ?auto_115576 ?auto_115577 ?auto_115578 ?auto_115575 ?auto_115579 ?auto_115581 ?auto_115580 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115620 - SURFACE
      ?auto_115621 - SURFACE
      ?auto_115622 - SURFACE
      ?auto_115619 - SURFACE
      ?auto_115623 - SURFACE
      ?auto_115625 - SURFACE
      ?auto_115624 - SURFACE
    )
    :vars
    (
      ?auto_115628 - HOIST
      ?auto_115626 - PLACE
      ?auto_115627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115628 ?auto_115626 ) ( SURFACE-AT ?auto_115625 ?auto_115626 ) ( CLEAR ?auto_115625 ) ( IS-CRATE ?auto_115624 ) ( not ( = ?auto_115625 ?auto_115624 ) ) ( TRUCK-AT ?auto_115627 ?auto_115626 ) ( AVAILABLE ?auto_115628 ) ( IN ?auto_115624 ?auto_115627 ) ( ON ?auto_115625 ?auto_115623 ) ( not ( = ?auto_115623 ?auto_115625 ) ) ( not ( = ?auto_115623 ?auto_115624 ) ) ( ON ?auto_115621 ?auto_115620 ) ( ON ?auto_115622 ?auto_115621 ) ( ON ?auto_115619 ?auto_115622 ) ( ON ?auto_115623 ?auto_115619 ) ( not ( = ?auto_115620 ?auto_115621 ) ) ( not ( = ?auto_115620 ?auto_115622 ) ) ( not ( = ?auto_115620 ?auto_115619 ) ) ( not ( = ?auto_115620 ?auto_115623 ) ) ( not ( = ?auto_115620 ?auto_115625 ) ) ( not ( = ?auto_115620 ?auto_115624 ) ) ( not ( = ?auto_115621 ?auto_115622 ) ) ( not ( = ?auto_115621 ?auto_115619 ) ) ( not ( = ?auto_115621 ?auto_115623 ) ) ( not ( = ?auto_115621 ?auto_115625 ) ) ( not ( = ?auto_115621 ?auto_115624 ) ) ( not ( = ?auto_115622 ?auto_115619 ) ) ( not ( = ?auto_115622 ?auto_115623 ) ) ( not ( = ?auto_115622 ?auto_115625 ) ) ( not ( = ?auto_115622 ?auto_115624 ) ) ( not ( = ?auto_115619 ?auto_115623 ) ) ( not ( = ?auto_115619 ?auto_115625 ) ) ( not ( = ?auto_115619 ?auto_115624 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115623 ?auto_115625 ?auto_115624 )
      ( MAKE-6CRATE-VERIFY ?auto_115620 ?auto_115621 ?auto_115622 ?auto_115619 ?auto_115623 ?auto_115625 ?auto_115624 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115671 - SURFACE
      ?auto_115672 - SURFACE
      ?auto_115673 - SURFACE
      ?auto_115670 - SURFACE
      ?auto_115674 - SURFACE
      ?auto_115676 - SURFACE
      ?auto_115675 - SURFACE
    )
    :vars
    (
      ?auto_115680 - HOIST
      ?auto_115677 - PLACE
      ?auto_115679 - TRUCK
      ?auto_115678 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_115680 ?auto_115677 ) ( SURFACE-AT ?auto_115676 ?auto_115677 ) ( CLEAR ?auto_115676 ) ( IS-CRATE ?auto_115675 ) ( not ( = ?auto_115676 ?auto_115675 ) ) ( AVAILABLE ?auto_115680 ) ( IN ?auto_115675 ?auto_115679 ) ( ON ?auto_115676 ?auto_115674 ) ( not ( = ?auto_115674 ?auto_115676 ) ) ( not ( = ?auto_115674 ?auto_115675 ) ) ( TRUCK-AT ?auto_115679 ?auto_115678 ) ( not ( = ?auto_115678 ?auto_115677 ) ) ( ON ?auto_115672 ?auto_115671 ) ( ON ?auto_115673 ?auto_115672 ) ( ON ?auto_115670 ?auto_115673 ) ( ON ?auto_115674 ?auto_115670 ) ( not ( = ?auto_115671 ?auto_115672 ) ) ( not ( = ?auto_115671 ?auto_115673 ) ) ( not ( = ?auto_115671 ?auto_115670 ) ) ( not ( = ?auto_115671 ?auto_115674 ) ) ( not ( = ?auto_115671 ?auto_115676 ) ) ( not ( = ?auto_115671 ?auto_115675 ) ) ( not ( = ?auto_115672 ?auto_115673 ) ) ( not ( = ?auto_115672 ?auto_115670 ) ) ( not ( = ?auto_115672 ?auto_115674 ) ) ( not ( = ?auto_115672 ?auto_115676 ) ) ( not ( = ?auto_115672 ?auto_115675 ) ) ( not ( = ?auto_115673 ?auto_115670 ) ) ( not ( = ?auto_115673 ?auto_115674 ) ) ( not ( = ?auto_115673 ?auto_115676 ) ) ( not ( = ?auto_115673 ?auto_115675 ) ) ( not ( = ?auto_115670 ?auto_115674 ) ) ( not ( = ?auto_115670 ?auto_115676 ) ) ( not ( = ?auto_115670 ?auto_115675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115674 ?auto_115676 ?auto_115675 )
      ( MAKE-6CRATE-VERIFY ?auto_115671 ?auto_115672 ?auto_115673 ?auto_115670 ?auto_115674 ?auto_115676 ?auto_115675 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115728 - SURFACE
      ?auto_115729 - SURFACE
      ?auto_115730 - SURFACE
      ?auto_115727 - SURFACE
      ?auto_115731 - SURFACE
      ?auto_115733 - SURFACE
      ?auto_115732 - SURFACE
    )
    :vars
    (
      ?auto_115734 - HOIST
      ?auto_115738 - PLACE
      ?auto_115736 - TRUCK
      ?auto_115735 - PLACE
      ?auto_115737 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_115734 ?auto_115738 ) ( SURFACE-AT ?auto_115733 ?auto_115738 ) ( CLEAR ?auto_115733 ) ( IS-CRATE ?auto_115732 ) ( not ( = ?auto_115733 ?auto_115732 ) ) ( AVAILABLE ?auto_115734 ) ( ON ?auto_115733 ?auto_115731 ) ( not ( = ?auto_115731 ?auto_115733 ) ) ( not ( = ?auto_115731 ?auto_115732 ) ) ( TRUCK-AT ?auto_115736 ?auto_115735 ) ( not ( = ?auto_115735 ?auto_115738 ) ) ( HOIST-AT ?auto_115737 ?auto_115735 ) ( LIFTING ?auto_115737 ?auto_115732 ) ( not ( = ?auto_115734 ?auto_115737 ) ) ( ON ?auto_115729 ?auto_115728 ) ( ON ?auto_115730 ?auto_115729 ) ( ON ?auto_115727 ?auto_115730 ) ( ON ?auto_115731 ?auto_115727 ) ( not ( = ?auto_115728 ?auto_115729 ) ) ( not ( = ?auto_115728 ?auto_115730 ) ) ( not ( = ?auto_115728 ?auto_115727 ) ) ( not ( = ?auto_115728 ?auto_115731 ) ) ( not ( = ?auto_115728 ?auto_115733 ) ) ( not ( = ?auto_115728 ?auto_115732 ) ) ( not ( = ?auto_115729 ?auto_115730 ) ) ( not ( = ?auto_115729 ?auto_115727 ) ) ( not ( = ?auto_115729 ?auto_115731 ) ) ( not ( = ?auto_115729 ?auto_115733 ) ) ( not ( = ?auto_115729 ?auto_115732 ) ) ( not ( = ?auto_115730 ?auto_115727 ) ) ( not ( = ?auto_115730 ?auto_115731 ) ) ( not ( = ?auto_115730 ?auto_115733 ) ) ( not ( = ?auto_115730 ?auto_115732 ) ) ( not ( = ?auto_115727 ?auto_115731 ) ) ( not ( = ?auto_115727 ?auto_115733 ) ) ( not ( = ?auto_115727 ?auto_115732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115731 ?auto_115733 ?auto_115732 )
      ( MAKE-6CRATE-VERIFY ?auto_115728 ?auto_115729 ?auto_115730 ?auto_115727 ?auto_115731 ?auto_115733 ?auto_115732 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115791 - SURFACE
      ?auto_115792 - SURFACE
      ?auto_115793 - SURFACE
      ?auto_115790 - SURFACE
      ?auto_115794 - SURFACE
      ?auto_115796 - SURFACE
      ?auto_115795 - SURFACE
    )
    :vars
    (
      ?auto_115802 - HOIST
      ?auto_115799 - PLACE
      ?auto_115800 - TRUCK
      ?auto_115801 - PLACE
      ?auto_115797 - HOIST
      ?auto_115798 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_115802 ?auto_115799 ) ( SURFACE-AT ?auto_115796 ?auto_115799 ) ( CLEAR ?auto_115796 ) ( IS-CRATE ?auto_115795 ) ( not ( = ?auto_115796 ?auto_115795 ) ) ( AVAILABLE ?auto_115802 ) ( ON ?auto_115796 ?auto_115794 ) ( not ( = ?auto_115794 ?auto_115796 ) ) ( not ( = ?auto_115794 ?auto_115795 ) ) ( TRUCK-AT ?auto_115800 ?auto_115801 ) ( not ( = ?auto_115801 ?auto_115799 ) ) ( HOIST-AT ?auto_115797 ?auto_115801 ) ( not ( = ?auto_115802 ?auto_115797 ) ) ( AVAILABLE ?auto_115797 ) ( SURFACE-AT ?auto_115795 ?auto_115801 ) ( ON ?auto_115795 ?auto_115798 ) ( CLEAR ?auto_115795 ) ( not ( = ?auto_115796 ?auto_115798 ) ) ( not ( = ?auto_115795 ?auto_115798 ) ) ( not ( = ?auto_115794 ?auto_115798 ) ) ( ON ?auto_115792 ?auto_115791 ) ( ON ?auto_115793 ?auto_115792 ) ( ON ?auto_115790 ?auto_115793 ) ( ON ?auto_115794 ?auto_115790 ) ( not ( = ?auto_115791 ?auto_115792 ) ) ( not ( = ?auto_115791 ?auto_115793 ) ) ( not ( = ?auto_115791 ?auto_115790 ) ) ( not ( = ?auto_115791 ?auto_115794 ) ) ( not ( = ?auto_115791 ?auto_115796 ) ) ( not ( = ?auto_115791 ?auto_115795 ) ) ( not ( = ?auto_115791 ?auto_115798 ) ) ( not ( = ?auto_115792 ?auto_115793 ) ) ( not ( = ?auto_115792 ?auto_115790 ) ) ( not ( = ?auto_115792 ?auto_115794 ) ) ( not ( = ?auto_115792 ?auto_115796 ) ) ( not ( = ?auto_115792 ?auto_115795 ) ) ( not ( = ?auto_115792 ?auto_115798 ) ) ( not ( = ?auto_115793 ?auto_115790 ) ) ( not ( = ?auto_115793 ?auto_115794 ) ) ( not ( = ?auto_115793 ?auto_115796 ) ) ( not ( = ?auto_115793 ?auto_115795 ) ) ( not ( = ?auto_115793 ?auto_115798 ) ) ( not ( = ?auto_115790 ?auto_115794 ) ) ( not ( = ?auto_115790 ?auto_115796 ) ) ( not ( = ?auto_115790 ?auto_115795 ) ) ( not ( = ?auto_115790 ?auto_115798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115794 ?auto_115796 ?auto_115795 )
      ( MAKE-6CRATE-VERIFY ?auto_115791 ?auto_115792 ?auto_115793 ?auto_115790 ?auto_115794 ?auto_115796 ?auto_115795 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115855 - SURFACE
      ?auto_115856 - SURFACE
      ?auto_115857 - SURFACE
      ?auto_115854 - SURFACE
      ?auto_115858 - SURFACE
      ?auto_115860 - SURFACE
      ?auto_115859 - SURFACE
    )
    :vars
    (
      ?auto_115865 - HOIST
      ?auto_115863 - PLACE
      ?auto_115866 - PLACE
      ?auto_115861 - HOIST
      ?auto_115864 - SURFACE
      ?auto_115862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115865 ?auto_115863 ) ( SURFACE-AT ?auto_115860 ?auto_115863 ) ( CLEAR ?auto_115860 ) ( IS-CRATE ?auto_115859 ) ( not ( = ?auto_115860 ?auto_115859 ) ) ( AVAILABLE ?auto_115865 ) ( ON ?auto_115860 ?auto_115858 ) ( not ( = ?auto_115858 ?auto_115860 ) ) ( not ( = ?auto_115858 ?auto_115859 ) ) ( not ( = ?auto_115866 ?auto_115863 ) ) ( HOIST-AT ?auto_115861 ?auto_115866 ) ( not ( = ?auto_115865 ?auto_115861 ) ) ( AVAILABLE ?auto_115861 ) ( SURFACE-AT ?auto_115859 ?auto_115866 ) ( ON ?auto_115859 ?auto_115864 ) ( CLEAR ?auto_115859 ) ( not ( = ?auto_115860 ?auto_115864 ) ) ( not ( = ?auto_115859 ?auto_115864 ) ) ( not ( = ?auto_115858 ?auto_115864 ) ) ( TRUCK-AT ?auto_115862 ?auto_115863 ) ( ON ?auto_115856 ?auto_115855 ) ( ON ?auto_115857 ?auto_115856 ) ( ON ?auto_115854 ?auto_115857 ) ( ON ?auto_115858 ?auto_115854 ) ( not ( = ?auto_115855 ?auto_115856 ) ) ( not ( = ?auto_115855 ?auto_115857 ) ) ( not ( = ?auto_115855 ?auto_115854 ) ) ( not ( = ?auto_115855 ?auto_115858 ) ) ( not ( = ?auto_115855 ?auto_115860 ) ) ( not ( = ?auto_115855 ?auto_115859 ) ) ( not ( = ?auto_115855 ?auto_115864 ) ) ( not ( = ?auto_115856 ?auto_115857 ) ) ( not ( = ?auto_115856 ?auto_115854 ) ) ( not ( = ?auto_115856 ?auto_115858 ) ) ( not ( = ?auto_115856 ?auto_115860 ) ) ( not ( = ?auto_115856 ?auto_115859 ) ) ( not ( = ?auto_115856 ?auto_115864 ) ) ( not ( = ?auto_115857 ?auto_115854 ) ) ( not ( = ?auto_115857 ?auto_115858 ) ) ( not ( = ?auto_115857 ?auto_115860 ) ) ( not ( = ?auto_115857 ?auto_115859 ) ) ( not ( = ?auto_115857 ?auto_115864 ) ) ( not ( = ?auto_115854 ?auto_115858 ) ) ( not ( = ?auto_115854 ?auto_115860 ) ) ( not ( = ?auto_115854 ?auto_115859 ) ) ( not ( = ?auto_115854 ?auto_115864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115858 ?auto_115860 ?auto_115859 )
      ( MAKE-6CRATE-VERIFY ?auto_115855 ?auto_115856 ?auto_115857 ?auto_115854 ?auto_115858 ?auto_115860 ?auto_115859 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115919 - SURFACE
      ?auto_115920 - SURFACE
      ?auto_115921 - SURFACE
      ?auto_115918 - SURFACE
      ?auto_115922 - SURFACE
      ?auto_115924 - SURFACE
      ?auto_115923 - SURFACE
    )
    :vars
    (
      ?auto_115928 - HOIST
      ?auto_115925 - PLACE
      ?auto_115930 - PLACE
      ?auto_115927 - HOIST
      ?auto_115926 - SURFACE
      ?auto_115929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115928 ?auto_115925 ) ( IS-CRATE ?auto_115923 ) ( not ( = ?auto_115924 ?auto_115923 ) ) ( not ( = ?auto_115922 ?auto_115924 ) ) ( not ( = ?auto_115922 ?auto_115923 ) ) ( not ( = ?auto_115930 ?auto_115925 ) ) ( HOIST-AT ?auto_115927 ?auto_115930 ) ( not ( = ?auto_115928 ?auto_115927 ) ) ( AVAILABLE ?auto_115927 ) ( SURFACE-AT ?auto_115923 ?auto_115930 ) ( ON ?auto_115923 ?auto_115926 ) ( CLEAR ?auto_115923 ) ( not ( = ?auto_115924 ?auto_115926 ) ) ( not ( = ?auto_115923 ?auto_115926 ) ) ( not ( = ?auto_115922 ?auto_115926 ) ) ( TRUCK-AT ?auto_115929 ?auto_115925 ) ( SURFACE-AT ?auto_115922 ?auto_115925 ) ( CLEAR ?auto_115922 ) ( LIFTING ?auto_115928 ?auto_115924 ) ( IS-CRATE ?auto_115924 ) ( ON ?auto_115920 ?auto_115919 ) ( ON ?auto_115921 ?auto_115920 ) ( ON ?auto_115918 ?auto_115921 ) ( ON ?auto_115922 ?auto_115918 ) ( not ( = ?auto_115919 ?auto_115920 ) ) ( not ( = ?auto_115919 ?auto_115921 ) ) ( not ( = ?auto_115919 ?auto_115918 ) ) ( not ( = ?auto_115919 ?auto_115922 ) ) ( not ( = ?auto_115919 ?auto_115924 ) ) ( not ( = ?auto_115919 ?auto_115923 ) ) ( not ( = ?auto_115919 ?auto_115926 ) ) ( not ( = ?auto_115920 ?auto_115921 ) ) ( not ( = ?auto_115920 ?auto_115918 ) ) ( not ( = ?auto_115920 ?auto_115922 ) ) ( not ( = ?auto_115920 ?auto_115924 ) ) ( not ( = ?auto_115920 ?auto_115923 ) ) ( not ( = ?auto_115920 ?auto_115926 ) ) ( not ( = ?auto_115921 ?auto_115918 ) ) ( not ( = ?auto_115921 ?auto_115922 ) ) ( not ( = ?auto_115921 ?auto_115924 ) ) ( not ( = ?auto_115921 ?auto_115923 ) ) ( not ( = ?auto_115921 ?auto_115926 ) ) ( not ( = ?auto_115918 ?auto_115922 ) ) ( not ( = ?auto_115918 ?auto_115924 ) ) ( not ( = ?auto_115918 ?auto_115923 ) ) ( not ( = ?auto_115918 ?auto_115926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115922 ?auto_115924 ?auto_115923 )
      ( MAKE-6CRATE-VERIFY ?auto_115919 ?auto_115920 ?auto_115921 ?auto_115918 ?auto_115922 ?auto_115924 ?auto_115923 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115983 - SURFACE
      ?auto_115984 - SURFACE
      ?auto_115985 - SURFACE
      ?auto_115982 - SURFACE
      ?auto_115986 - SURFACE
      ?auto_115988 - SURFACE
      ?auto_115987 - SURFACE
    )
    :vars
    (
      ?auto_115992 - HOIST
      ?auto_115991 - PLACE
      ?auto_115993 - PLACE
      ?auto_115989 - HOIST
      ?auto_115994 - SURFACE
      ?auto_115990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115992 ?auto_115991 ) ( IS-CRATE ?auto_115987 ) ( not ( = ?auto_115988 ?auto_115987 ) ) ( not ( = ?auto_115986 ?auto_115988 ) ) ( not ( = ?auto_115986 ?auto_115987 ) ) ( not ( = ?auto_115993 ?auto_115991 ) ) ( HOIST-AT ?auto_115989 ?auto_115993 ) ( not ( = ?auto_115992 ?auto_115989 ) ) ( AVAILABLE ?auto_115989 ) ( SURFACE-AT ?auto_115987 ?auto_115993 ) ( ON ?auto_115987 ?auto_115994 ) ( CLEAR ?auto_115987 ) ( not ( = ?auto_115988 ?auto_115994 ) ) ( not ( = ?auto_115987 ?auto_115994 ) ) ( not ( = ?auto_115986 ?auto_115994 ) ) ( TRUCK-AT ?auto_115990 ?auto_115991 ) ( SURFACE-AT ?auto_115986 ?auto_115991 ) ( CLEAR ?auto_115986 ) ( IS-CRATE ?auto_115988 ) ( AVAILABLE ?auto_115992 ) ( IN ?auto_115988 ?auto_115990 ) ( ON ?auto_115984 ?auto_115983 ) ( ON ?auto_115985 ?auto_115984 ) ( ON ?auto_115982 ?auto_115985 ) ( ON ?auto_115986 ?auto_115982 ) ( not ( = ?auto_115983 ?auto_115984 ) ) ( not ( = ?auto_115983 ?auto_115985 ) ) ( not ( = ?auto_115983 ?auto_115982 ) ) ( not ( = ?auto_115983 ?auto_115986 ) ) ( not ( = ?auto_115983 ?auto_115988 ) ) ( not ( = ?auto_115983 ?auto_115987 ) ) ( not ( = ?auto_115983 ?auto_115994 ) ) ( not ( = ?auto_115984 ?auto_115985 ) ) ( not ( = ?auto_115984 ?auto_115982 ) ) ( not ( = ?auto_115984 ?auto_115986 ) ) ( not ( = ?auto_115984 ?auto_115988 ) ) ( not ( = ?auto_115984 ?auto_115987 ) ) ( not ( = ?auto_115984 ?auto_115994 ) ) ( not ( = ?auto_115985 ?auto_115982 ) ) ( not ( = ?auto_115985 ?auto_115986 ) ) ( not ( = ?auto_115985 ?auto_115988 ) ) ( not ( = ?auto_115985 ?auto_115987 ) ) ( not ( = ?auto_115985 ?auto_115994 ) ) ( not ( = ?auto_115982 ?auto_115986 ) ) ( not ( = ?auto_115982 ?auto_115988 ) ) ( not ( = ?auto_115982 ?auto_115987 ) ) ( not ( = ?auto_115982 ?auto_115994 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115986 ?auto_115988 ?auto_115987 )
      ( MAKE-6CRATE-VERIFY ?auto_115983 ?auto_115984 ?auto_115985 ?auto_115982 ?auto_115986 ?auto_115988 ?auto_115987 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_117658 - SURFACE
      ?auto_117659 - SURFACE
    )
    :vars
    (
      ?auto_117666 - HOIST
      ?auto_117663 - PLACE
      ?auto_117660 - SURFACE
      ?auto_117665 - TRUCK
      ?auto_117661 - PLACE
      ?auto_117662 - HOIST
      ?auto_117664 - SURFACE
      ?auto_117667 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_117666 ?auto_117663 ) ( SURFACE-AT ?auto_117658 ?auto_117663 ) ( CLEAR ?auto_117658 ) ( IS-CRATE ?auto_117659 ) ( not ( = ?auto_117658 ?auto_117659 ) ) ( AVAILABLE ?auto_117666 ) ( ON ?auto_117658 ?auto_117660 ) ( not ( = ?auto_117660 ?auto_117658 ) ) ( not ( = ?auto_117660 ?auto_117659 ) ) ( TRUCK-AT ?auto_117665 ?auto_117661 ) ( not ( = ?auto_117661 ?auto_117663 ) ) ( HOIST-AT ?auto_117662 ?auto_117661 ) ( not ( = ?auto_117666 ?auto_117662 ) ) ( SURFACE-AT ?auto_117659 ?auto_117661 ) ( ON ?auto_117659 ?auto_117664 ) ( CLEAR ?auto_117659 ) ( not ( = ?auto_117658 ?auto_117664 ) ) ( not ( = ?auto_117659 ?auto_117664 ) ) ( not ( = ?auto_117660 ?auto_117664 ) ) ( LIFTING ?auto_117662 ?auto_117667 ) ( IS-CRATE ?auto_117667 ) ( not ( = ?auto_117658 ?auto_117667 ) ) ( not ( = ?auto_117659 ?auto_117667 ) ) ( not ( = ?auto_117660 ?auto_117667 ) ) ( not ( = ?auto_117664 ?auto_117667 ) ) )
    :subtasks
    ( ( !LOAD ?auto_117662 ?auto_117667 ?auto_117665 ?auto_117661 )
      ( MAKE-1CRATE ?auto_117658 ?auto_117659 )
      ( MAKE-1CRATE-VERIFY ?auto_117658 ?auto_117659 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_117935 - SURFACE
      ?auto_117936 - SURFACE
      ?auto_117937 - SURFACE
      ?auto_117934 - SURFACE
      ?auto_117938 - SURFACE
      ?auto_117940 - SURFACE
      ?auto_117939 - SURFACE
      ?auto_117941 - SURFACE
    )
    :vars
    (
      ?auto_117942 - HOIST
      ?auto_117943 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_117942 ?auto_117943 ) ( SURFACE-AT ?auto_117939 ?auto_117943 ) ( CLEAR ?auto_117939 ) ( LIFTING ?auto_117942 ?auto_117941 ) ( IS-CRATE ?auto_117941 ) ( not ( = ?auto_117939 ?auto_117941 ) ) ( ON ?auto_117936 ?auto_117935 ) ( ON ?auto_117937 ?auto_117936 ) ( ON ?auto_117934 ?auto_117937 ) ( ON ?auto_117938 ?auto_117934 ) ( ON ?auto_117940 ?auto_117938 ) ( ON ?auto_117939 ?auto_117940 ) ( not ( = ?auto_117935 ?auto_117936 ) ) ( not ( = ?auto_117935 ?auto_117937 ) ) ( not ( = ?auto_117935 ?auto_117934 ) ) ( not ( = ?auto_117935 ?auto_117938 ) ) ( not ( = ?auto_117935 ?auto_117940 ) ) ( not ( = ?auto_117935 ?auto_117939 ) ) ( not ( = ?auto_117935 ?auto_117941 ) ) ( not ( = ?auto_117936 ?auto_117937 ) ) ( not ( = ?auto_117936 ?auto_117934 ) ) ( not ( = ?auto_117936 ?auto_117938 ) ) ( not ( = ?auto_117936 ?auto_117940 ) ) ( not ( = ?auto_117936 ?auto_117939 ) ) ( not ( = ?auto_117936 ?auto_117941 ) ) ( not ( = ?auto_117937 ?auto_117934 ) ) ( not ( = ?auto_117937 ?auto_117938 ) ) ( not ( = ?auto_117937 ?auto_117940 ) ) ( not ( = ?auto_117937 ?auto_117939 ) ) ( not ( = ?auto_117937 ?auto_117941 ) ) ( not ( = ?auto_117934 ?auto_117938 ) ) ( not ( = ?auto_117934 ?auto_117940 ) ) ( not ( = ?auto_117934 ?auto_117939 ) ) ( not ( = ?auto_117934 ?auto_117941 ) ) ( not ( = ?auto_117938 ?auto_117940 ) ) ( not ( = ?auto_117938 ?auto_117939 ) ) ( not ( = ?auto_117938 ?auto_117941 ) ) ( not ( = ?auto_117940 ?auto_117939 ) ) ( not ( = ?auto_117940 ?auto_117941 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_117939 ?auto_117941 )
      ( MAKE-7CRATE-VERIFY ?auto_117935 ?auto_117936 ?auto_117937 ?auto_117934 ?auto_117938 ?auto_117940 ?auto_117939 ?auto_117941 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_117990 - SURFACE
      ?auto_117991 - SURFACE
      ?auto_117992 - SURFACE
      ?auto_117989 - SURFACE
      ?auto_117993 - SURFACE
      ?auto_117995 - SURFACE
      ?auto_117994 - SURFACE
      ?auto_117996 - SURFACE
    )
    :vars
    (
      ?auto_117998 - HOIST
      ?auto_117997 - PLACE
      ?auto_117999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_117998 ?auto_117997 ) ( SURFACE-AT ?auto_117994 ?auto_117997 ) ( CLEAR ?auto_117994 ) ( IS-CRATE ?auto_117996 ) ( not ( = ?auto_117994 ?auto_117996 ) ) ( TRUCK-AT ?auto_117999 ?auto_117997 ) ( AVAILABLE ?auto_117998 ) ( IN ?auto_117996 ?auto_117999 ) ( ON ?auto_117994 ?auto_117995 ) ( not ( = ?auto_117995 ?auto_117994 ) ) ( not ( = ?auto_117995 ?auto_117996 ) ) ( ON ?auto_117991 ?auto_117990 ) ( ON ?auto_117992 ?auto_117991 ) ( ON ?auto_117989 ?auto_117992 ) ( ON ?auto_117993 ?auto_117989 ) ( ON ?auto_117995 ?auto_117993 ) ( not ( = ?auto_117990 ?auto_117991 ) ) ( not ( = ?auto_117990 ?auto_117992 ) ) ( not ( = ?auto_117990 ?auto_117989 ) ) ( not ( = ?auto_117990 ?auto_117993 ) ) ( not ( = ?auto_117990 ?auto_117995 ) ) ( not ( = ?auto_117990 ?auto_117994 ) ) ( not ( = ?auto_117990 ?auto_117996 ) ) ( not ( = ?auto_117991 ?auto_117992 ) ) ( not ( = ?auto_117991 ?auto_117989 ) ) ( not ( = ?auto_117991 ?auto_117993 ) ) ( not ( = ?auto_117991 ?auto_117995 ) ) ( not ( = ?auto_117991 ?auto_117994 ) ) ( not ( = ?auto_117991 ?auto_117996 ) ) ( not ( = ?auto_117992 ?auto_117989 ) ) ( not ( = ?auto_117992 ?auto_117993 ) ) ( not ( = ?auto_117992 ?auto_117995 ) ) ( not ( = ?auto_117992 ?auto_117994 ) ) ( not ( = ?auto_117992 ?auto_117996 ) ) ( not ( = ?auto_117989 ?auto_117993 ) ) ( not ( = ?auto_117989 ?auto_117995 ) ) ( not ( = ?auto_117989 ?auto_117994 ) ) ( not ( = ?auto_117989 ?auto_117996 ) ) ( not ( = ?auto_117993 ?auto_117995 ) ) ( not ( = ?auto_117993 ?auto_117994 ) ) ( not ( = ?auto_117993 ?auto_117996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_117995 ?auto_117994 ?auto_117996 )
      ( MAKE-7CRATE-VERIFY ?auto_117990 ?auto_117991 ?auto_117992 ?auto_117989 ?auto_117993 ?auto_117995 ?auto_117994 ?auto_117996 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118053 - SURFACE
      ?auto_118054 - SURFACE
      ?auto_118055 - SURFACE
      ?auto_118052 - SURFACE
      ?auto_118056 - SURFACE
      ?auto_118058 - SURFACE
      ?auto_118057 - SURFACE
      ?auto_118059 - SURFACE
    )
    :vars
    (
      ?auto_118060 - HOIST
      ?auto_118063 - PLACE
      ?auto_118062 - TRUCK
      ?auto_118061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_118060 ?auto_118063 ) ( SURFACE-AT ?auto_118057 ?auto_118063 ) ( CLEAR ?auto_118057 ) ( IS-CRATE ?auto_118059 ) ( not ( = ?auto_118057 ?auto_118059 ) ) ( AVAILABLE ?auto_118060 ) ( IN ?auto_118059 ?auto_118062 ) ( ON ?auto_118057 ?auto_118058 ) ( not ( = ?auto_118058 ?auto_118057 ) ) ( not ( = ?auto_118058 ?auto_118059 ) ) ( TRUCK-AT ?auto_118062 ?auto_118061 ) ( not ( = ?auto_118061 ?auto_118063 ) ) ( ON ?auto_118054 ?auto_118053 ) ( ON ?auto_118055 ?auto_118054 ) ( ON ?auto_118052 ?auto_118055 ) ( ON ?auto_118056 ?auto_118052 ) ( ON ?auto_118058 ?auto_118056 ) ( not ( = ?auto_118053 ?auto_118054 ) ) ( not ( = ?auto_118053 ?auto_118055 ) ) ( not ( = ?auto_118053 ?auto_118052 ) ) ( not ( = ?auto_118053 ?auto_118056 ) ) ( not ( = ?auto_118053 ?auto_118058 ) ) ( not ( = ?auto_118053 ?auto_118057 ) ) ( not ( = ?auto_118053 ?auto_118059 ) ) ( not ( = ?auto_118054 ?auto_118055 ) ) ( not ( = ?auto_118054 ?auto_118052 ) ) ( not ( = ?auto_118054 ?auto_118056 ) ) ( not ( = ?auto_118054 ?auto_118058 ) ) ( not ( = ?auto_118054 ?auto_118057 ) ) ( not ( = ?auto_118054 ?auto_118059 ) ) ( not ( = ?auto_118055 ?auto_118052 ) ) ( not ( = ?auto_118055 ?auto_118056 ) ) ( not ( = ?auto_118055 ?auto_118058 ) ) ( not ( = ?auto_118055 ?auto_118057 ) ) ( not ( = ?auto_118055 ?auto_118059 ) ) ( not ( = ?auto_118052 ?auto_118056 ) ) ( not ( = ?auto_118052 ?auto_118058 ) ) ( not ( = ?auto_118052 ?auto_118057 ) ) ( not ( = ?auto_118052 ?auto_118059 ) ) ( not ( = ?auto_118056 ?auto_118058 ) ) ( not ( = ?auto_118056 ?auto_118057 ) ) ( not ( = ?auto_118056 ?auto_118059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118058 ?auto_118057 ?auto_118059 )
      ( MAKE-7CRATE-VERIFY ?auto_118053 ?auto_118054 ?auto_118055 ?auto_118052 ?auto_118056 ?auto_118058 ?auto_118057 ?auto_118059 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118123 - SURFACE
      ?auto_118124 - SURFACE
      ?auto_118125 - SURFACE
      ?auto_118122 - SURFACE
      ?auto_118126 - SURFACE
      ?auto_118128 - SURFACE
      ?auto_118127 - SURFACE
      ?auto_118129 - SURFACE
    )
    :vars
    (
      ?auto_118131 - HOIST
      ?auto_118130 - PLACE
      ?auto_118133 - TRUCK
      ?auto_118134 - PLACE
      ?auto_118132 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_118131 ?auto_118130 ) ( SURFACE-AT ?auto_118127 ?auto_118130 ) ( CLEAR ?auto_118127 ) ( IS-CRATE ?auto_118129 ) ( not ( = ?auto_118127 ?auto_118129 ) ) ( AVAILABLE ?auto_118131 ) ( ON ?auto_118127 ?auto_118128 ) ( not ( = ?auto_118128 ?auto_118127 ) ) ( not ( = ?auto_118128 ?auto_118129 ) ) ( TRUCK-AT ?auto_118133 ?auto_118134 ) ( not ( = ?auto_118134 ?auto_118130 ) ) ( HOIST-AT ?auto_118132 ?auto_118134 ) ( LIFTING ?auto_118132 ?auto_118129 ) ( not ( = ?auto_118131 ?auto_118132 ) ) ( ON ?auto_118124 ?auto_118123 ) ( ON ?auto_118125 ?auto_118124 ) ( ON ?auto_118122 ?auto_118125 ) ( ON ?auto_118126 ?auto_118122 ) ( ON ?auto_118128 ?auto_118126 ) ( not ( = ?auto_118123 ?auto_118124 ) ) ( not ( = ?auto_118123 ?auto_118125 ) ) ( not ( = ?auto_118123 ?auto_118122 ) ) ( not ( = ?auto_118123 ?auto_118126 ) ) ( not ( = ?auto_118123 ?auto_118128 ) ) ( not ( = ?auto_118123 ?auto_118127 ) ) ( not ( = ?auto_118123 ?auto_118129 ) ) ( not ( = ?auto_118124 ?auto_118125 ) ) ( not ( = ?auto_118124 ?auto_118122 ) ) ( not ( = ?auto_118124 ?auto_118126 ) ) ( not ( = ?auto_118124 ?auto_118128 ) ) ( not ( = ?auto_118124 ?auto_118127 ) ) ( not ( = ?auto_118124 ?auto_118129 ) ) ( not ( = ?auto_118125 ?auto_118122 ) ) ( not ( = ?auto_118125 ?auto_118126 ) ) ( not ( = ?auto_118125 ?auto_118128 ) ) ( not ( = ?auto_118125 ?auto_118127 ) ) ( not ( = ?auto_118125 ?auto_118129 ) ) ( not ( = ?auto_118122 ?auto_118126 ) ) ( not ( = ?auto_118122 ?auto_118128 ) ) ( not ( = ?auto_118122 ?auto_118127 ) ) ( not ( = ?auto_118122 ?auto_118129 ) ) ( not ( = ?auto_118126 ?auto_118128 ) ) ( not ( = ?auto_118126 ?auto_118127 ) ) ( not ( = ?auto_118126 ?auto_118129 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118128 ?auto_118127 ?auto_118129 )
      ( MAKE-7CRATE-VERIFY ?auto_118123 ?auto_118124 ?auto_118125 ?auto_118122 ?auto_118126 ?auto_118128 ?auto_118127 ?auto_118129 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118200 - SURFACE
      ?auto_118201 - SURFACE
      ?auto_118202 - SURFACE
      ?auto_118199 - SURFACE
      ?auto_118203 - SURFACE
      ?auto_118205 - SURFACE
      ?auto_118204 - SURFACE
      ?auto_118206 - SURFACE
    )
    :vars
    (
      ?auto_118207 - HOIST
      ?auto_118208 - PLACE
      ?auto_118211 - TRUCK
      ?auto_118209 - PLACE
      ?auto_118212 - HOIST
      ?auto_118210 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_118207 ?auto_118208 ) ( SURFACE-AT ?auto_118204 ?auto_118208 ) ( CLEAR ?auto_118204 ) ( IS-CRATE ?auto_118206 ) ( not ( = ?auto_118204 ?auto_118206 ) ) ( AVAILABLE ?auto_118207 ) ( ON ?auto_118204 ?auto_118205 ) ( not ( = ?auto_118205 ?auto_118204 ) ) ( not ( = ?auto_118205 ?auto_118206 ) ) ( TRUCK-AT ?auto_118211 ?auto_118209 ) ( not ( = ?auto_118209 ?auto_118208 ) ) ( HOIST-AT ?auto_118212 ?auto_118209 ) ( not ( = ?auto_118207 ?auto_118212 ) ) ( AVAILABLE ?auto_118212 ) ( SURFACE-AT ?auto_118206 ?auto_118209 ) ( ON ?auto_118206 ?auto_118210 ) ( CLEAR ?auto_118206 ) ( not ( = ?auto_118204 ?auto_118210 ) ) ( not ( = ?auto_118206 ?auto_118210 ) ) ( not ( = ?auto_118205 ?auto_118210 ) ) ( ON ?auto_118201 ?auto_118200 ) ( ON ?auto_118202 ?auto_118201 ) ( ON ?auto_118199 ?auto_118202 ) ( ON ?auto_118203 ?auto_118199 ) ( ON ?auto_118205 ?auto_118203 ) ( not ( = ?auto_118200 ?auto_118201 ) ) ( not ( = ?auto_118200 ?auto_118202 ) ) ( not ( = ?auto_118200 ?auto_118199 ) ) ( not ( = ?auto_118200 ?auto_118203 ) ) ( not ( = ?auto_118200 ?auto_118205 ) ) ( not ( = ?auto_118200 ?auto_118204 ) ) ( not ( = ?auto_118200 ?auto_118206 ) ) ( not ( = ?auto_118200 ?auto_118210 ) ) ( not ( = ?auto_118201 ?auto_118202 ) ) ( not ( = ?auto_118201 ?auto_118199 ) ) ( not ( = ?auto_118201 ?auto_118203 ) ) ( not ( = ?auto_118201 ?auto_118205 ) ) ( not ( = ?auto_118201 ?auto_118204 ) ) ( not ( = ?auto_118201 ?auto_118206 ) ) ( not ( = ?auto_118201 ?auto_118210 ) ) ( not ( = ?auto_118202 ?auto_118199 ) ) ( not ( = ?auto_118202 ?auto_118203 ) ) ( not ( = ?auto_118202 ?auto_118205 ) ) ( not ( = ?auto_118202 ?auto_118204 ) ) ( not ( = ?auto_118202 ?auto_118206 ) ) ( not ( = ?auto_118202 ?auto_118210 ) ) ( not ( = ?auto_118199 ?auto_118203 ) ) ( not ( = ?auto_118199 ?auto_118205 ) ) ( not ( = ?auto_118199 ?auto_118204 ) ) ( not ( = ?auto_118199 ?auto_118206 ) ) ( not ( = ?auto_118199 ?auto_118210 ) ) ( not ( = ?auto_118203 ?auto_118205 ) ) ( not ( = ?auto_118203 ?auto_118204 ) ) ( not ( = ?auto_118203 ?auto_118206 ) ) ( not ( = ?auto_118203 ?auto_118210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118205 ?auto_118204 ?auto_118206 )
      ( MAKE-7CRATE-VERIFY ?auto_118200 ?auto_118201 ?auto_118202 ?auto_118199 ?auto_118203 ?auto_118205 ?auto_118204 ?auto_118206 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118278 - SURFACE
      ?auto_118279 - SURFACE
      ?auto_118280 - SURFACE
      ?auto_118277 - SURFACE
      ?auto_118281 - SURFACE
      ?auto_118283 - SURFACE
      ?auto_118282 - SURFACE
      ?auto_118284 - SURFACE
    )
    :vars
    (
      ?auto_118288 - HOIST
      ?auto_118286 - PLACE
      ?auto_118285 - PLACE
      ?auto_118290 - HOIST
      ?auto_118289 - SURFACE
      ?auto_118287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118288 ?auto_118286 ) ( SURFACE-AT ?auto_118282 ?auto_118286 ) ( CLEAR ?auto_118282 ) ( IS-CRATE ?auto_118284 ) ( not ( = ?auto_118282 ?auto_118284 ) ) ( AVAILABLE ?auto_118288 ) ( ON ?auto_118282 ?auto_118283 ) ( not ( = ?auto_118283 ?auto_118282 ) ) ( not ( = ?auto_118283 ?auto_118284 ) ) ( not ( = ?auto_118285 ?auto_118286 ) ) ( HOIST-AT ?auto_118290 ?auto_118285 ) ( not ( = ?auto_118288 ?auto_118290 ) ) ( AVAILABLE ?auto_118290 ) ( SURFACE-AT ?auto_118284 ?auto_118285 ) ( ON ?auto_118284 ?auto_118289 ) ( CLEAR ?auto_118284 ) ( not ( = ?auto_118282 ?auto_118289 ) ) ( not ( = ?auto_118284 ?auto_118289 ) ) ( not ( = ?auto_118283 ?auto_118289 ) ) ( TRUCK-AT ?auto_118287 ?auto_118286 ) ( ON ?auto_118279 ?auto_118278 ) ( ON ?auto_118280 ?auto_118279 ) ( ON ?auto_118277 ?auto_118280 ) ( ON ?auto_118281 ?auto_118277 ) ( ON ?auto_118283 ?auto_118281 ) ( not ( = ?auto_118278 ?auto_118279 ) ) ( not ( = ?auto_118278 ?auto_118280 ) ) ( not ( = ?auto_118278 ?auto_118277 ) ) ( not ( = ?auto_118278 ?auto_118281 ) ) ( not ( = ?auto_118278 ?auto_118283 ) ) ( not ( = ?auto_118278 ?auto_118282 ) ) ( not ( = ?auto_118278 ?auto_118284 ) ) ( not ( = ?auto_118278 ?auto_118289 ) ) ( not ( = ?auto_118279 ?auto_118280 ) ) ( not ( = ?auto_118279 ?auto_118277 ) ) ( not ( = ?auto_118279 ?auto_118281 ) ) ( not ( = ?auto_118279 ?auto_118283 ) ) ( not ( = ?auto_118279 ?auto_118282 ) ) ( not ( = ?auto_118279 ?auto_118284 ) ) ( not ( = ?auto_118279 ?auto_118289 ) ) ( not ( = ?auto_118280 ?auto_118277 ) ) ( not ( = ?auto_118280 ?auto_118281 ) ) ( not ( = ?auto_118280 ?auto_118283 ) ) ( not ( = ?auto_118280 ?auto_118282 ) ) ( not ( = ?auto_118280 ?auto_118284 ) ) ( not ( = ?auto_118280 ?auto_118289 ) ) ( not ( = ?auto_118277 ?auto_118281 ) ) ( not ( = ?auto_118277 ?auto_118283 ) ) ( not ( = ?auto_118277 ?auto_118282 ) ) ( not ( = ?auto_118277 ?auto_118284 ) ) ( not ( = ?auto_118277 ?auto_118289 ) ) ( not ( = ?auto_118281 ?auto_118283 ) ) ( not ( = ?auto_118281 ?auto_118282 ) ) ( not ( = ?auto_118281 ?auto_118284 ) ) ( not ( = ?auto_118281 ?auto_118289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118283 ?auto_118282 ?auto_118284 )
      ( MAKE-7CRATE-VERIFY ?auto_118278 ?auto_118279 ?auto_118280 ?auto_118277 ?auto_118281 ?auto_118283 ?auto_118282 ?auto_118284 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118356 - SURFACE
      ?auto_118357 - SURFACE
      ?auto_118358 - SURFACE
      ?auto_118355 - SURFACE
      ?auto_118359 - SURFACE
      ?auto_118361 - SURFACE
      ?auto_118360 - SURFACE
      ?auto_118362 - SURFACE
    )
    :vars
    (
      ?auto_118367 - HOIST
      ?auto_118366 - PLACE
      ?auto_118364 - PLACE
      ?auto_118365 - HOIST
      ?auto_118368 - SURFACE
      ?auto_118363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118367 ?auto_118366 ) ( IS-CRATE ?auto_118362 ) ( not ( = ?auto_118360 ?auto_118362 ) ) ( not ( = ?auto_118361 ?auto_118360 ) ) ( not ( = ?auto_118361 ?auto_118362 ) ) ( not ( = ?auto_118364 ?auto_118366 ) ) ( HOIST-AT ?auto_118365 ?auto_118364 ) ( not ( = ?auto_118367 ?auto_118365 ) ) ( AVAILABLE ?auto_118365 ) ( SURFACE-AT ?auto_118362 ?auto_118364 ) ( ON ?auto_118362 ?auto_118368 ) ( CLEAR ?auto_118362 ) ( not ( = ?auto_118360 ?auto_118368 ) ) ( not ( = ?auto_118362 ?auto_118368 ) ) ( not ( = ?auto_118361 ?auto_118368 ) ) ( TRUCK-AT ?auto_118363 ?auto_118366 ) ( SURFACE-AT ?auto_118361 ?auto_118366 ) ( CLEAR ?auto_118361 ) ( LIFTING ?auto_118367 ?auto_118360 ) ( IS-CRATE ?auto_118360 ) ( ON ?auto_118357 ?auto_118356 ) ( ON ?auto_118358 ?auto_118357 ) ( ON ?auto_118355 ?auto_118358 ) ( ON ?auto_118359 ?auto_118355 ) ( ON ?auto_118361 ?auto_118359 ) ( not ( = ?auto_118356 ?auto_118357 ) ) ( not ( = ?auto_118356 ?auto_118358 ) ) ( not ( = ?auto_118356 ?auto_118355 ) ) ( not ( = ?auto_118356 ?auto_118359 ) ) ( not ( = ?auto_118356 ?auto_118361 ) ) ( not ( = ?auto_118356 ?auto_118360 ) ) ( not ( = ?auto_118356 ?auto_118362 ) ) ( not ( = ?auto_118356 ?auto_118368 ) ) ( not ( = ?auto_118357 ?auto_118358 ) ) ( not ( = ?auto_118357 ?auto_118355 ) ) ( not ( = ?auto_118357 ?auto_118359 ) ) ( not ( = ?auto_118357 ?auto_118361 ) ) ( not ( = ?auto_118357 ?auto_118360 ) ) ( not ( = ?auto_118357 ?auto_118362 ) ) ( not ( = ?auto_118357 ?auto_118368 ) ) ( not ( = ?auto_118358 ?auto_118355 ) ) ( not ( = ?auto_118358 ?auto_118359 ) ) ( not ( = ?auto_118358 ?auto_118361 ) ) ( not ( = ?auto_118358 ?auto_118360 ) ) ( not ( = ?auto_118358 ?auto_118362 ) ) ( not ( = ?auto_118358 ?auto_118368 ) ) ( not ( = ?auto_118355 ?auto_118359 ) ) ( not ( = ?auto_118355 ?auto_118361 ) ) ( not ( = ?auto_118355 ?auto_118360 ) ) ( not ( = ?auto_118355 ?auto_118362 ) ) ( not ( = ?auto_118355 ?auto_118368 ) ) ( not ( = ?auto_118359 ?auto_118361 ) ) ( not ( = ?auto_118359 ?auto_118360 ) ) ( not ( = ?auto_118359 ?auto_118362 ) ) ( not ( = ?auto_118359 ?auto_118368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118361 ?auto_118360 ?auto_118362 )
      ( MAKE-7CRATE-VERIFY ?auto_118356 ?auto_118357 ?auto_118358 ?auto_118355 ?auto_118359 ?auto_118361 ?auto_118360 ?auto_118362 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118434 - SURFACE
      ?auto_118435 - SURFACE
      ?auto_118436 - SURFACE
      ?auto_118433 - SURFACE
      ?auto_118437 - SURFACE
      ?auto_118439 - SURFACE
      ?auto_118438 - SURFACE
      ?auto_118440 - SURFACE
    )
    :vars
    (
      ?auto_118444 - HOIST
      ?auto_118442 - PLACE
      ?auto_118445 - PLACE
      ?auto_118443 - HOIST
      ?auto_118441 - SURFACE
      ?auto_118446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118444 ?auto_118442 ) ( IS-CRATE ?auto_118440 ) ( not ( = ?auto_118438 ?auto_118440 ) ) ( not ( = ?auto_118439 ?auto_118438 ) ) ( not ( = ?auto_118439 ?auto_118440 ) ) ( not ( = ?auto_118445 ?auto_118442 ) ) ( HOIST-AT ?auto_118443 ?auto_118445 ) ( not ( = ?auto_118444 ?auto_118443 ) ) ( AVAILABLE ?auto_118443 ) ( SURFACE-AT ?auto_118440 ?auto_118445 ) ( ON ?auto_118440 ?auto_118441 ) ( CLEAR ?auto_118440 ) ( not ( = ?auto_118438 ?auto_118441 ) ) ( not ( = ?auto_118440 ?auto_118441 ) ) ( not ( = ?auto_118439 ?auto_118441 ) ) ( TRUCK-AT ?auto_118446 ?auto_118442 ) ( SURFACE-AT ?auto_118439 ?auto_118442 ) ( CLEAR ?auto_118439 ) ( IS-CRATE ?auto_118438 ) ( AVAILABLE ?auto_118444 ) ( IN ?auto_118438 ?auto_118446 ) ( ON ?auto_118435 ?auto_118434 ) ( ON ?auto_118436 ?auto_118435 ) ( ON ?auto_118433 ?auto_118436 ) ( ON ?auto_118437 ?auto_118433 ) ( ON ?auto_118439 ?auto_118437 ) ( not ( = ?auto_118434 ?auto_118435 ) ) ( not ( = ?auto_118434 ?auto_118436 ) ) ( not ( = ?auto_118434 ?auto_118433 ) ) ( not ( = ?auto_118434 ?auto_118437 ) ) ( not ( = ?auto_118434 ?auto_118439 ) ) ( not ( = ?auto_118434 ?auto_118438 ) ) ( not ( = ?auto_118434 ?auto_118440 ) ) ( not ( = ?auto_118434 ?auto_118441 ) ) ( not ( = ?auto_118435 ?auto_118436 ) ) ( not ( = ?auto_118435 ?auto_118433 ) ) ( not ( = ?auto_118435 ?auto_118437 ) ) ( not ( = ?auto_118435 ?auto_118439 ) ) ( not ( = ?auto_118435 ?auto_118438 ) ) ( not ( = ?auto_118435 ?auto_118440 ) ) ( not ( = ?auto_118435 ?auto_118441 ) ) ( not ( = ?auto_118436 ?auto_118433 ) ) ( not ( = ?auto_118436 ?auto_118437 ) ) ( not ( = ?auto_118436 ?auto_118439 ) ) ( not ( = ?auto_118436 ?auto_118438 ) ) ( not ( = ?auto_118436 ?auto_118440 ) ) ( not ( = ?auto_118436 ?auto_118441 ) ) ( not ( = ?auto_118433 ?auto_118437 ) ) ( not ( = ?auto_118433 ?auto_118439 ) ) ( not ( = ?auto_118433 ?auto_118438 ) ) ( not ( = ?auto_118433 ?auto_118440 ) ) ( not ( = ?auto_118433 ?auto_118441 ) ) ( not ( = ?auto_118437 ?auto_118439 ) ) ( not ( = ?auto_118437 ?auto_118438 ) ) ( not ( = ?auto_118437 ?auto_118440 ) ) ( not ( = ?auto_118437 ?auto_118441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118439 ?auto_118438 ?auto_118440 )
      ( MAKE-7CRATE-VERIFY ?auto_118434 ?auto_118435 ?auto_118436 ?auto_118433 ?auto_118437 ?auto_118439 ?auto_118438 ?auto_118440 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_118487 - SURFACE
      ?auto_118488 - SURFACE
      ?auto_118489 - SURFACE
      ?auto_118486 - SURFACE
      ?auto_118490 - SURFACE
      ?auto_118491 - SURFACE
    )
    :vars
    (
      ?auto_118493 - HOIST
      ?auto_118497 - PLACE
      ?auto_118494 - PLACE
      ?auto_118492 - HOIST
      ?auto_118496 - SURFACE
      ?auto_118495 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118493 ?auto_118497 ) ( IS-CRATE ?auto_118491 ) ( not ( = ?auto_118490 ?auto_118491 ) ) ( not ( = ?auto_118486 ?auto_118490 ) ) ( not ( = ?auto_118486 ?auto_118491 ) ) ( not ( = ?auto_118494 ?auto_118497 ) ) ( HOIST-AT ?auto_118492 ?auto_118494 ) ( not ( = ?auto_118493 ?auto_118492 ) ) ( AVAILABLE ?auto_118492 ) ( SURFACE-AT ?auto_118491 ?auto_118494 ) ( ON ?auto_118491 ?auto_118496 ) ( CLEAR ?auto_118491 ) ( not ( = ?auto_118490 ?auto_118496 ) ) ( not ( = ?auto_118491 ?auto_118496 ) ) ( not ( = ?auto_118486 ?auto_118496 ) ) ( SURFACE-AT ?auto_118486 ?auto_118497 ) ( CLEAR ?auto_118486 ) ( IS-CRATE ?auto_118490 ) ( AVAILABLE ?auto_118493 ) ( IN ?auto_118490 ?auto_118495 ) ( TRUCK-AT ?auto_118495 ?auto_118494 ) ( ON ?auto_118488 ?auto_118487 ) ( ON ?auto_118489 ?auto_118488 ) ( ON ?auto_118486 ?auto_118489 ) ( not ( = ?auto_118487 ?auto_118488 ) ) ( not ( = ?auto_118487 ?auto_118489 ) ) ( not ( = ?auto_118487 ?auto_118486 ) ) ( not ( = ?auto_118487 ?auto_118490 ) ) ( not ( = ?auto_118487 ?auto_118491 ) ) ( not ( = ?auto_118487 ?auto_118496 ) ) ( not ( = ?auto_118488 ?auto_118489 ) ) ( not ( = ?auto_118488 ?auto_118486 ) ) ( not ( = ?auto_118488 ?auto_118490 ) ) ( not ( = ?auto_118488 ?auto_118491 ) ) ( not ( = ?auto_118488 ?auto_118496 ) ) ( not ( = ?auto_118489 ?auto_118486 ) ) ( not ( = ?auto_118489 ?auto_118490 ) ) ( not ( = ?auto_118489 ?auto_118491 ) ) ( not ( = ?auto_118489 ?auto_118496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118486 ?auto_118490 ?auto_118491 )
      ( MAKE-5CRATE-VERIFY ?auto_118487 ?auto_118488 ?auto_118489 ?auto_118486 ?auto_118490 ?auto_118491 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_118499 - SURFACE
      ?auto_118500 - SURFACE
      ?auto_118501 - SURFACE
      ?auto_118498 - SURFACE
      ?auto_118502 - SURFACE
      ?auto_118504 - SURFACE
      ?auto_118503 - SURFACE
    )
    :vars
    (
      ?auto_118506 - HOIST
      ?auto_118510 - PLACE
      ?auto_118507 - PLACE
      ?auto_118505 - HOIST
      ?auto_118509 - SURFACE
      ?auto_118508 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118506 ?auto_118510 ) ( IS-CRATE ?auto_118503 ) ( not ( = ?auto_118504 ?auto_118503 ) ) ( not ( = ?auto_118502 ?auto_118504 ) ) ( not ( = ?auto_118502 ?auto_118503 ) ) ( not ( = ?auto_118507 ?auto_118510 ) ) ( HOIST-AT ?auto_118505 ?auto_118507 ) ( not ( = ?auto_118506 ?auto_118505 ) ) ( AVAILABLE ?auto_118505 ) ( SURFACE-AT ?auto_118503 ?auto_118507 ) ( ON ?auto_118503 ?auto_118509 ) ( CLEAR ?auto_118503 ) ( not ( = ?auto_118504 ?auto_118509 ) ) ( not ( = ?auto_118503 ?auto_118509 ) ) ( not ( = ?auto_118502 ?auto_118509 ) ) ( SURFACE-AT ?auto_118502 ?auto_118510 ) ( CLEAR ?auto_118502 ) ( IS-CRATE ?auto_118504 ) ( AVAILABLE ?auto_118506 ) ( IN ?auto_118504 ?auto_118508 ) ( TRUCK-AT ?auto_118508 ?auto_118507 ) ( ON ?auto_118500 ?auto_118499 ) ( ON ?auto_118501 ?auto_118500 ) ( ON ?auto_118498 ?auto_118501 ) ( ON ?auto_118502 ?auto_118498 ) ( not ( = ?auto_118499 ?auto_118500 ) ) ( not ( = ?auto_118499 ?auto_118501 ) ) ( not ( = ?auto_118499 ?auto_118498 ) ) ( not ( = ?auto_118499 ?auto_118502 ) ) ( not ( = ?auto_118499 ?auto_118504 ) ) ( not ( = ?auto_118499 ?auto_118503 ) ) ( not ( = ?auto_118499 ?auto_118509 ) ) ( not ( = ?auto_118500 ?auto_118501 ) ) ( not ( = ?auto_118500 ?auto_118498 ) ) ( not ( = ?auto_118500 ?auto_118502 ) ) ( not ( = ?auto_118500 ?auto_118504 ) ) ( not ( = ?auto_118500 ?auto_118503 ) ) ( not ( = ?auto_118500 ?auto_118509 ) ) ( not ( = ?auto_118501 ?auto_118498 ) ) ( not ( = ?auto_118501 ?auto_118502 ) ) ( not ( = ?auto_118501 ?auto_118504 ) ) ( not ( = ?auto_118501 ?auto_118503 ) ) ( not ( = ?auto_118501 ?auto_118509 ) ) ( not ( = ?auto_118498 ?auto_118502 ) ) ( not ( = ?auto_118498 ?auto_118504 ) ) ( not ( = ?auto_118498 ?auto_118503 ) ) ( not ( = ?auto_118498 ?auto_118509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118502 ?auto_118504 ?auto_118503 )
      ( MAKE-6CRATE-VERIFY ?auto_118499 ?auto_118500 ?auto_118501 ?auto_118498 ?auto_118502 ?auto_118504 ?auto_118503 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118512 - SURFACE
      ?auto_118513 - SURFACE
      ?auto_118514 - SURFACE
      ?auto_118511 - SURFACE
      ?auto_118515 - SURFACE
      ?auto_118517 - SURFACE
      ?auto_118516 - SURFACE
      ?auto_118518 - SURFACE
    )
    :vars
    (
      ?auto_118520 - HOIST
      ?auto_118524 - PLACE
      ?auto_118521 - PLACE
      ?auto_118519 - HOIST
      ?auto_118523 - SURFACE
      ?auto_118522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118520 ?auto_118524 ) ( IS-CRATE ?auto_118518 ) ( not ( = ?auto_118516 ?auto_118518 ) ) ( not ( = ?auto_118517 ?auto_118516 ) ) ( not ( = ?auto_118517 ?auto_118518 ) ) ( not ( = ?auto_118521 ?auto_118524 ) ) ( HOIST-AT ?auto_118519 ?auto_118521 ) ( not ( = ?auto_118520 ?auto_118519 ) ) ( AVAILABLE ?auto_118519 ) ( SURFACE-AT ?auto_118518 ?auto_118521 ) ( ON ?auto_118518 ?auto_118523 ) ( CLEAR ?auto_118518 ) ( not ( = ?auto_118516 ?auto_118523 ) ) ( not ( = ?auto_118518 ?auto_118523 ) ) ( not ( = ?auto_118517 ?auto_118523 ) ) ( SURFACE-AT ?auto_118517 ?auto_118524 ) ( CLEAR ?auto_118517 ) ( IS-CRATE ?auto_118516 ) ( AVAILABLE ?auto_118520 ) ( IN ?auto_118516 ?auto_118522 ) ( TRUCK-AT ?auto_118522 ?auto_118521 ) ( ON ?auto_118513 ?auto_118512 ) ( ON ?auto_118514 ?auto_118513 ) ( ON ?auto_118511 ?auto_118514 ) ( ON ?auto_118515 ?auto_118511 ) ( ON ?auto_118517 ?auto_118515 ) ( not ( = ?auto_118512 ?auto_118513 ) ) ( not ( = ?auto_118512 ?auto_118514 ) ) ( not ( = ?auto_118512 ?auto_118511 ) ) ( not ( = ?auto_118512 ?auto_118515 ) ) ( not ( = ?auto_118512 ?auto_118517 ) ) ( not ( = ?auto_118512 ?auto_118516 ) ) ( not ( = ?auto_118512 ?auto_118518 ) ) ( not ( = ?auto_118512 ?auto_118523 ) ) ( not ( = ?auto_118513 ?auto_118514 ) ) ( not ( = ?auto_118513 ?auto_118511 ) ) ( not ( = ?auto_118513 ?auto_118515 ) ) ( not ( = ?auto_118513 ?auto_118517 ) ) ( not ( = ?auto_118513 ?auto_118516 ) ) ( not ( = ?auto_118513 ?auto_118518 ) ) ( not ( = ?auto_118513 ?auto_118523 ) ) ( not ( = ?auto_118514 ?auto_118511 ) ) ( not ( = ?auto_118514 ?auto_118515 ) ) ( not ( = ?auto_118514 ?auto_118517 ) ) ( not ( = ?auto_118514 ?auto_118516 ) ) ( not ( = ?auto_118514 ?auto_118518 ) ) ( not ( = ?auto_118514 ?auto_118523 ) ) ( not ( = ?auto_118511 ?auto_118515 ) ) ( not ( = ?auto_118511 ?auto_118517 ) ) ( not ( = ?auto_118511 ?auto_118516 ) ) ( not ( = ?auto_118511 ?auto_118518 ) ) ( not ( = ?auto_118511 ?auto_118523 ) ) ( not ( = ?auto_118515 ?auto_118517 ) ) ( not ( = ?auto_118515 ?auto_118516 ) ) ( not ( = ?auto_118515 ?auto_118518 ) ) ( not ( = ?auto_118515 ?auto_118523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118517 ?auto_118516 ?auto_118518 )
      ( MAKE-7CRATE-VERIFY ?auto_118512 ?auto_118513 ?auto_118514 ?auto_118511 ?auto_118515 ?auto_118517 ?auto_118516 ?auto_118518 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_118565 - SURFACE
      ?auto_118566 - SURFACE
      ?auto_118567 - SURFACE
      ?auto_118564 - SURFACE
      ?auto_118568 - SURFACE
      ?auto_118569 - SURFACE
    )
    :vars
    (
      ?auto_118574 - HOIST
      ?auto_118575 - PLACE
      ?auto_118573 - PLACE
      ?auto_118572 - HOIST
      ?auto_118571 - SURFACE
      ?auto_118570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118574 ?auto_118575 ) ( IS-CRATE ?auto_118569 ) ( not ( = ?auto_118568 ?auto_118569 ) ) ( not ( = ?auto_118564 ?auto_118568 ) ) ( not ( = ?auto_118564 ?auto_118569 ) ) ( not ( = ?auto_118573 ?auto_118575 ) ) ( HOIST-AT ?auto_118572 ?auto_118573 ) ( not ( = ?auto_118574 ?auto_118572 ) ) ( SURFACE-AT ?auto_118569 ?auto_118573 ) ( ON ?auto_118569 ?auto_118571 ) ( CLEAR ?auto_118569 ) ( not ( = ?auto_118568 ?auto_118571 ) ) ( not ( = ?auto_118569 ?auto_118571 ) ) ( not ( = ?auto_118564 ?auto_118571 ) ) ( SURFACE-AT ?auto_118564 ?auto_118575 ) ( CLEAR ?auto_118564 ) ( IS-CRATE ?auto_118568 ) ( AVAILABLE ?auto_118574 ) ( TRUCK-AT ?auto_118570 ?auto_118573 ) ( LIFTING ?auto_118572 ?auto_118568 ) ( ON ?auto_118566 ?auto_118565 ) ( ON ?auto_118567 ?auto_118566 ) ( ON ?auto_118564 ?auto_118567 ) ( not ( = ?auto_118565 ?auto_118566 ) ) ( not ( = ?auto_118565 ?auto_118567 ) ) ( not ( = ?auto_118565 ?auto_118564 ) ) ( not ( = ?auto_118565 ?auto_118568 ) ) ( not ( = ?auto_118565 ?auto_118569 ) ) ( not ( = ?auto_118565 ?auto_118571 ) ) ( not ( = ?auto_118566 ?auto_118567 ) ) ( not ( = ?auto_118566 ?auto_118564 ) ) ( not ( = ?auto_118566 ?auto_118568 ) ) ( not ( = ?auto_118566 ?auto_118569 ) ) ( not ( = ?auto_118566 ?auto_118571 ) ) ( not ( = ?auto_118567 ?auto_118564 ) ) ( not ( = ?auto_118567 ?auto_118568 ) ) ( not ( = ?auto_118567 ?auto_118569 ) ) ( not ( = ?auto_118567 ?auto_118571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118564 ?auto_118568 ?auto_118569 )
      ( MAKE-5CRATE-VERIFY ?auto_118565 ?auto_118566 ?auto_118567 ?auto_118564 ?auto_118568 ?auto_118569 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_118577 - SURFACE
      ?auto_118578 - SURFACE
      ?auto_118579 - SURFACE
      ?auto_118576 - SURFACE
      ?auto_118580 - SURFACE
      ?auto_118582 - SURFACE
      ?auto_118581 - SURFACE
    )
    :vars
    (
      ?auto_118587 - HOIST
      ?auto_118588 - PLACE
      ?auto_118586 - PLACE
      ?auto_118585 - HOIST
      ?auto_118584 - SURFACE
      ?auto_118583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118587 ?auto_118588 ) ( IS-CRATE ?auto_118581 ) ( not ( = ?auto_118582 ?auto_118581 ) ) ( not ( = ?auto_118580 ?auto_118582 ) ) ( not ( = ?auto_118580 ?auto_118581 ) ) ( not ( = ?auto_118586 ?auto_118588 ) ) ( HOIST-AT ?auto_118585 ?auto_118586 ) ( not ( = ?auto_118587 ?auto_118585 ) ) ( SURFACE-AT ?auto_118581 ?auto_118586 ) ( ON ?auto_118581 ?auto_118584 ) ( CLEAR ?auto_118581 ) ( not ( = ?auto_118582 ?auto_118584 ) ) ( not ( = ?auto_118581 ?auto_118584 ) ) ( not ( = ?auto_118580 ?auto_118584 ) ) ( SURFACE-AT ?auto_118580 ?auto_118588 ) ( CLEAR ?auto_118580 ) ( IS-CRATE ?auto_118582 ) ( AVAILABLE ?auto_118587 ) ( TRUCK-AT ?auto_118583 ?auto_118586 ) ( LIFTING ?auto_118585 ?auto_118582 ) ( ON ?auto_118578 ?auto_118577 ) ( ON ?auto_118579 ?auto_118578 ) ( ON ?auto_118576 ?auto_118579 ) ( ON ?auto_118580 ?auto_118576 ) ( not ( = ?auto_118577 ?auto_118578 ) ) ( not ( = ?auto_118577 ?auto_118579 ) ) ( not ( = ?auto_118577 ?auto_118576 ) ) ( not ( = ?auto_118577 ?auto_118580 ) ) ( not ( = ?auto_118577 ?auto_118582 ) ) ( not ( = ?auto_118577 ?auto_118581 ) ) ( not ( = ?auto_118577 ?auto_118584 ) ) ( not ( = ?auto_118578 ?auto_118579 ) ) ( not ( = ?auto_118578 ?auto_118576 ) ) ( not ( = ?auto_118578 ?auto_118580 ) ) ( not ( = ?auto_118578 ?auto_118582 ) ) ( not ( = ?auto_118578 ?auto_118581 ) ) ( not ( = ?auto_118578 ?auto_118584 ) ) ( not ( = ?auto_118579 ?auto_118576 ) ) ( not ( = ?auto_118579 ?auto_118580 ) ) ( not ( = ?auto_118579 ?auto_118582 ) ) ( not ( = ?auto_118579 ?auto_118581 ) ) ( not ( = ?auto_118579 ?auto_118584 ) ) ( not ( = ?auto_118576 ?auto_118580 ) ) ( not ( = ?auto_118576 ?auto_118582 ) ) ( not ( = ?auto_118576 ?auto_118581 ) ) ( not ( = ?auto_118576 ?auto_118584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118580 ?auto_118582 ?auto_118581 )
      ( MAKE-6CRATE-VERIFY ?auto_118577 ?auto_118578 ?auto_118579 ?auto_118576 ?auto_118580 ?auto_118582 ?auto_118581 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118590 - SURFACE
      ?auto_118591 - SURFACE
      ?auto_118592 - SURFACE
      ?auto_118589 - SURFACE
      ?auto_118593 - SURFACE
      ?auto_118595 - SURFACE
      ?auto_118594 - SURFACE
      ?auto_118596 - SURFACE
    )
    :vars
    (
      ?auto_118601 - HOIST
      ?auto_118602 - PLACE
      ?auto_118600 - PLACE
      ?auto_118599 - HOIST
      ?auto_118598 - SURFACE
      ?auto_118597 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118601 ?auto_118602 ) ( IS-CRATE ?auto_118596 ) ( not ( = ?auto_118594 ?auto_118596 ) ) ( not ( = ?auto_118595 ?auto_118594 ) ) ( not ( = ?auto_118595 ?auto_118596 ) ) ( not ( = ?auto_118600 ?auto_118602 ) ) ( HOIST-AT ?auto_118599 ?auto_118600 ) ( not ( = ?auto_118601 ?auto_118599 ) ) ( SURFACE-AT ?auto_118596 ?auto_118600 ) ( ON ?auto_118596 ?auto_118598 ) ( CLEAR ?auto_118596 ) ( not ( = ?auto_118594 ?auto_118598 ) ) ( not ( = ?auto_118596 ?auto_118598 ) ) ( not ( = ?auto_118595 ?auto_118598 ) ) ( SURFACE-AT ?auto_118595 ?auto_118602 ) ( CLEAR ?auto_118595 ) ( IS-CRATE ?auto_118594 ) ( AVAILABLE ?auto_118601 ) ( TRUCK-AT ?auto_118597 ?auto_118600 ) ( LIFTING ?auto_118599 ?auto_118594 ) ( ON ?auto_118591 ?auto_118590 ) ( ON ?auto_118592 ?auto_118591 ) ( ON ?auto_118589 ?auto_118592 ) ( ON ?auto_118593 ?auto_118589 ) ( ON ?auto_118595 ?auto_118593 ) ( not ( = ?auto_118590 ?auto_118591 ) ) ( not ( = ?auto_118590 ?auto_118592 ) ) ( not ( = ?auto_118590 ?auto_118589 ) ) ( not ( = ?auto_118590 ?auto_118593 ) ) ( not ( = ?auto_118590 ?auto_118595 ) ) ( not ( = ?auto_118590 ?auto_118594 ) ) ( not ( = ?auto_118590 ?auto_118596 ) ) ( not ( = ?auto_118590 ?auto_118598 ) ) ( not ( = ?auto_118591 ?auto_118592 ) ) ( not ( = ?auto_118591 ?auto_118589 ) ) ( not ( = ?auto_118591 ?auto_118593 ) ) ( not ( = ?auto_118591 ?auto_118595 ) ) ( not ( = ?auto_118591 ?auto_118594 ) ) ( not ( = ?auto_118591 ?auto_118596 ) ) ( not ( = ?auto_118591 ?auto_118598 ) ) ( not ( = ?auto_118592 ?auto_118589 ) ) ( not ( = ?auto_118592 ?auto_118593 ) ) ( not ( = ?auto_118592 ?auto_118595 ) ) ( not ( = ?auto_118592 ?auto_118594 ) ) ( not ( = ?auto_118592 ?auto_118596 ) ) ( not ( = ?auto_118592 ?auto_118598 ) ) ( not ( = ?auto_118589 ?auto_118593 ) ) ( not ( = ?auto_118589 ?auto_118595 ) ) ( not ( = ?auto_118589 ?auto_118594 ) ) ( not ( = ?auto_118589 ?auto_118596 ) ) ( not ( = ?auto_118589 ?auto_118598 ) ) ( not ( = ?auto_118593 ?auto_118595 ) ) ( not ( = ?auto_118593 ?auto_118594 ) ) ( not ( = ?auto_118593 ?auto_118596 ) ) ( not ( = ?auto_118593 ?auto_118598 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118595 ?auto_118594 ?auto_118596 )
      ( MAKE-7CRATE-VERIFY ?auto_118590 ?auto_118591 ?auto_118592 ?auto_118589 ?auto_118593 ?auto_118595 ?auto_118594 ?auto_118596 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_118647 - SURFACE
      ?auto_118648 - SURFACE
      ?auto_118649 - SURFACE
      ?auto_118646 - SURFACE
      ?auto_118650 - SURFACE
      ?auto_118651 - SURFACE
    )
    :vars
    (
      ?auto_118658 - HOIST
      ?auto_118656 - PLACE
      ?auto_118654 - PLACE
      ?auto_118657 - HOIST
      ?auto_118653 - SURFACE
      ?auto_118652 - TRUCK
      ?auto_118655 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_118658 ?auto_118656 ) ( IS-CRATE ?auto_118651 ) ( not ( = ?auto_118650 ?auto_118651 ) ) ( not ( = ?auto_118646 ?auto_118650 ) ) ( not ( = ?auto_118646 ?auto_118651 ) ) ( not ( = ?auto_118654 ?auto_118656 ) ) ( HOIST-AT ?auto_118657 ?auto_118654 ) ( not ( = ?auto_118658 ?auto_118657 ) ) ( SURFACE-AT ?auto_118651 ?auto_118654 ) ( ON ?auto_118651 ?auto_118653 ) ( CLEAR ?auto_118651 ) ( not ( = ?auto_118650 ?auto_118653 ) ) ( not ( = ?auto_118651 ?auto_118653 ) ) ( not ( = ?auto_118646 ?auto_118653 ) ) ( SURFACE-AT ?auto_118646 ?auto_118656 ) ( CLEAR ?auto_118646 ) ( IS-CRATE ?auto_118650 ) ( AVAILABLE ?auto_118658 ) ( TRUCK-AT ?auto_118652 ?auto_118654 ) ( AVAILABLE ?auto_118657 ) ( SURFACE-AT ?auto_118650 ?auto_118654 ) ( ON ?auto_118650 ?auto_118655 ) ( CLEAR ?auto_118650 ) ( not ( = ?auto_118650 ?auto_118655 ) ) ( not ( = ?auto_118651 ?auto_118655 ) ) ( not ( = ?auto_118646 ?auto_118655 ) ) ( not ( = ?auto_118653 ?auto_118655 ) ) ( ON ?auto_118648 ?auto_118647 ) ( ON ?auto_118649 ?auto_118648 ) ( ON ?auto_118646 ?auto_118649 ) ( not ( = ?auto_118647 ?auto_118648 ) ) ( not ( = ?auto_118647 ?auto_118649 ) ) ( not ( = ?auto_118647 ?auto_118646 ) ) ( not ( = ?auto_118647 ?auto_118650 ) ) ( not ( = ?auto_118647 ?auto_118651 ) ) ( not ( = ?auto_118647 ?auto_118653 ) ) ( not ( = ?auto_118647 ?auto_118655 ) ) ( not ( = ?auto_118648 ?auto_118649 ) ) ( not ( = ?auto_118648 ?auto_118646 ) ) ( not ( = ?auto_118648 ?auto_118650 ) ) ( not ( = ?auto_118648 ?auto_118651 ) ) ( not ( = ?auto_118648 ?auto_118653 ) ) ( not ( = ?auto_118648 ?auto_118655 ) ) ( not ( = ?auto_118649 ?auto_118646 ) ) ( not ( = ?auto_118649 ?auto_118650 ) ) ( not ( = ?auto_118649 ?auto_118651 ) ) ( not ( = ?auto_118649 ?auto_118653 ) ) ( not ( = ?auto_118649 ?auto_118655 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118646 ?auto_118650 ?auto_118651 )
      ( MAKE-5CRATE-VERIFY ?auto_118647 ?auto_118648 ?auto_118649 ?auto_118646 ?auto_118650 ?auto_118651 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_118660 - SURFACE
      ?auto_118661 - SURFACE
      ?auto_118662 - SURFACE
      ?auto_118659 - SURFACE
      ?auto_118663 - SURFACE
      ?auto_118665 - SURFACE
      ?auto_118664 - SURFACE
    )
    :vars
    (
      ?auto_118672 - HOIST
      ?auto_118670 - PLACE
      ?auto_118668 - PLACE
      ?auto_118671 - HOIST
      ?auto_118667 - SURFACE
      ?auto_118666 - TRUCK
      ?auto_118669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_118672 ?auto_118670 ) ( IS-CRATE ?auto_118664 ) ( not ( = ?auto_118665 ?auto_118664 ) ) ( not ( = ?auto_118663 ?auto_118665 ) ) ( not ( = ?auto_118663 ?auto_118664 ) ) ( not ( = ?auto_118668 ?auto_118670 ) ) ( HOIST-AT ?auto_118671 ?auto_118668 ) ( not ( = ?auto_118672 ?auto_118671 ) ) ( SURFACE-AT ?auto_118664 ?auto_118668 ) ( ON ?auto_118664 ?auto_118667 ) ( CLEAR ?auto_118664 ) ( not ( = ?auto_118665 ?auto_118667 ) ) ( not ( = ?auto_118664 ?auto_118667 ) ) ( not ( = ?auto_118663 ?auto_118667 ) ) ( SURFACE-AT ?auto_118663 ?auto_118670 ) ( CLEAR ?auto_118663 ) ( IS-CRATE ?auto_118665 ) ( AVAILABLE ?auto_118672 ) ( TRUCK-AT ?auto_118666 ?auto_118668 ) ( AVAILABLE ?auto_118671 ) ( SURFACE-AT ?auto_118665 ?auto_118668 ) ( ON ?auto_118665 ?auto_118669 ) ( CLEAR ?auto_118665 ) ( not ( = ?auto_118665 ?auto_118669 ) ) ( not ( = ?auto_118664 ?auto_118669 ) ) ( not ( = ?auto_118663 ?auto_118669 ) ) ( not ( = ?auto_118667 ?auto_118669 ) ) ( ON ?auto_118661 ?auto_118660 ) ( ON ?auto_118662 ?auto_118661 ) ( ON ?auto_118659 ?auto_118662 ) ( ON ?auto_118663 ?auto_118659 ) ( not ( = ?auto_118660 ?auto_118661 ) ) ( not ( = ?auto_118660 ?auto_118662 ) ) ( not ( = ?auto_118660 ?auto_118659 ) ) ( not ( = ?auto_118660 ?auto_118663 ) ) ( not ( = ?auto_118660 ?auto_118665 ) ) ( not ( = ?auto_118660 ?auto_118664 ) ) ( not ( = ?auto_118660 ?auto_118667 ) ) ( not ( = ?auto_118660 ?auto_118669 ) ) ( not ( = ?auto_118661 ?auto_118662 ) ) ( not ( = ?auto_118661 ?auto_118659 ) ) ( not ( = ?auto_118661 ?auto_118663 ) ) ( not ( = ?auto_118661 ?auto_118665 ) ) ( not ( = ?auto_118661 ?auto_118664 ) ) ( not ( = ?auto_118661 ?auto_118667 ) ) ( not ( = ?auto_118661 ?auto_118669 ) ) ( not ( = ?auto_118662 ?auto_118659 ) ) ( not ( = ?auto_118662 ?auto_118663 ) ) ( not ( = ?auto_118662 ?auto_118665 ) ) ( not ( = ?auto_118662 ?auto_118664 ) ) ( not ( = ?auto_118662 ?auto_118667 ) ) ( not ( = ?auto_118662 ?auto_118669 ) ) ( not ( = ?auto_118659 ?auto_118663 ) ) ( not ( = ?auto_118659 ?auto_118665 ) ) ( not ( = ?auto_118659 ?auto_118664 ) ) ( not ( = ?auto_118659 ?auto_118667 ) ) ( not ( = ?auto_118659 ?auto_118669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118663 ?auto_118665 ?auto_118664 )
      ( MAKE-6CRATE-VERIFY ?auto_118660 ?auto_118661 ?auto_118662 ?auto_118659 ?auto_118663 ?auto_118665 ?auto_118664 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118674 - SURFACE
      ?auto_118675 - SURFACE
      ?auto_118676 - SURFACE
      ?auto_118673 - SURFACE
      ?auto_118677 - SURFACE
      ?auto_118679 - SURFACE
      ?auto_118678 - SURFACE
      ?auto_118680 - SURFACE
    )
    :vars
    (
      ?auto_118687 - HOIST
      ?auto_118685 - PLACE
      ?auto_118683 - PLACE
      ?auto_118686 - HOIST
      ?auto_118682 - SURFACE
      ?auto_118681 - TRUCK
      ?auto_118684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_118687 ?auto_118685 ) ( IS-CRATE ?auto_118680 ) ( not ( = ?auto_118678 ?auto_118680 ) ) ( not ( = ?auto_118679 ?auto_118678 ) ) ( not ( = ?auto_118679 ?auto_118680 ) ) ( not ( = ?auto_118683 ?auto_118685 ) ) ( HOIST-AT ?auto_118686 ?auto_118683 ) ( not ( = ?auto_118687 ?auto_118686 ) ) ( SURFACE-AT ?auto_118680 ?auto_118683 ) ( ON ?auto_118680 ?auto_118682 ) ( CLEAR ?auto_118680 ) ( not ( = ?auto_118678 ?auto_118682 ) ) ( not ( = ?auto_118680 ?auto_118682 ) ) ( not ( = ?auto_118679 ?auto_118682 ) ) ( SURFACE-AT ?auto_118679 ?auto_118685 ) ( CLEAR ?auto_118679 ) ( IS-CRATE ?auto_118678 ) ( AVAILABLE ?auto_118687 ) ( TRUCK-AT ?auto_118681 ?auto_118683 ) ( AVAILABLE ?auto_118686 ) ( SURFACE-AT ?auto_118678 ?auto_118683 ) ( ON ?auto_118678 ?auto_118684 ) ( CLEAR ?auto_118678 ) ( not ( = ?auto_118678 ?auto_118684 ) ) ( not ( = ?auto_118680 ?auto_118684 ) ) ( not ( = ?auto_118679 ?auto_118684 ) ) ( not ( = ?auto_118682 ?auto_118684 ) ) ( ON ?auto_118675 ?auto_118674 ) ( ON ?auto_118676 ?auto_118675 ) ( ON ?auto_118673 ?auto_118676 ) ( ON ?auto_118677 ?auto_118673 ) ( ON ?auto_118679 ?auto_118677 ) ( not ( = ?auto_118674 ?auto_118675 ) ) ( not ( = ?auto_118674 ?auto_118676 ) ) ( not ( = ?auto_118674 ?auto_118673 ) ) ( not ( = ?auto_118674 ?auto_118677 ) ) ( not ( = ?auto_118674 ?auto_118679 ) ) ( not ( = ?auto_118674 ?auto_118678 ) ) ( not ( = ?auto_118674 ?auto_118680 ) ) ( not ( = ?auto_118674 ?auto_118682 ) ) ( not ( = ?auto_118674 ?auto_118684 ) ) ( not ( = ?auto_118675 ?auto_118676 ) ) ( not ( = ?auto_118675 ?auto_118673 ) ) ( not ( = ?auto_118675 ?auto_118677 ) ) ( not ( = ?auto_118675 ?auto_118679 ) ) ( not ( = ?auto_118675 ?auto_118678 ) ) ( not ( = ?auto_118675 ?auto_118680 ) ) ( not ( = ?auto_118675 ?auto_118682 ) ) ( not ( = ?auto_118675 ?auto_118684 ) ) ( not ( = ?auto_118676 ?auto_118673 ) ) ( not ( = ?auto_118676 ?auto_118677 ) ) ( not ( = ?auto_118676 ?auto_118679 ) ) ( not ( = ?auto_118676 ?auto_118678 ) ) ( not ( = ?auto_118676 ?auto_118680 ) ) ( not ( = ?auto_118676 ?auto_118682 ) ) ( not ( = ?auto_118676 ?auto_118684 ) ) ( not ( = ?auto_118673 ?auto_118677 ) ) ( not ( = ?auto_118673 ?auto_118679 ) ) ( not ( = ?auto_118673 ?auto_118678 ) ) ( not ( = ?auto_118673 ?auto_118680 ) ) ( not ( = ?auto_118673 ?auto_118682 ) ) ( not ( = ?auto_118673 ?auto_118684 ) ) ( not ( = ?auto_118677 ?auto_118679 ) ) ( not ( = ?auto_118677 ?auto_118678 ) ) ( not ( = ?auto_118677 ?auto_118680 ) ) ( not ( = ?auto_118677 ?auto_118682 ) ) ( not ( = ?auto_118677 ?auto_118684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118679 ?auto_118678 ?auto_118680 )
      ( MAKE-7CRATE-VERIFY ?auto_118674 ?auto_118675 ?auto_118676 ?auto_118673 ?auto_118677 ?auto_118679 ?auto_118678 ?auto_118680 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_118732 - SURFACE
      ?auto_118733 - SURFACE
      ?auto_118734 - SURFACE
      ?auto_118731 - SURFACE
      ?auto_118735 - SURFACE
      ?auto_118736 - SURFACE
    )
    :vars
    (
      ?auto_118737 - HOIST
      ?auto_118741 - PLACE
      ?auto_118739 - PLACE
      ?auto_118742 - HOIST
      ?auto_118740 - SURFACE
      ?auto_118738 - SURFACE
      ?auto_118743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118737 ?auto_118741 ) ( IS-CRATE ?auto_118736 ) ( not ( = ?auto_118735 ?auto_118736 ) ) ( not ( = ?auto_118731 ?auto_118735 ) ) ( not ( = ?auto_118731 ?auto_118736 ) ) ( not ( = ?auto_118739 ?auto_118741 ) ) ( HOIST-AT ?auto_118742 ?auto_118739 ) ( not ( = ?auto_118737 ?auto_118742 ) ) ( SURFACE-AT ?auto_118736 ?auto_118739 ) ( ON ?auto_118736 ?auto_118740 ) ( CLEAR ?auto_118736 ) ( not ( = ?auto_118735 ?auto_118740 ) ) ( not ( = ?auto_118736 ?auto_118740 ) ) ( not ( = ?auto_118731 ?auto_118740 ) ) ( SURFACE-AT ?auto_118731 ?auto_118741 ) ( CLEAR ?auto_118731 ) ( IS-CRATE ?auto_118735 ) ( AVAILABLE ?auto_118737 ) ( AVAILABLE ?auto_118742 ) ( SURFACE-AT ?auto_118735 ?auto_118739 ) ( ON ?auto_118735 ?auto_118738 ) ( CLEAR ?auto_118735 ) ( not ( = ?auto_118735 ?auto_118738 ) ) ( not ( = ?auto_118736 ?auto_118738 ) ) ( not ( = ?auto_118731 ?auto_118738 ) ) ( not ( = ?auto_118740 ?auto_118738 ) ) ( TRUCK-AT ?auto_118743 ?auto_118741 ) ( ON ?auto_118733 ?auto_118732 ) ( ON ?auto_118734 ?auto_118733 ) ( ON ?auto_118731 ?auto_118734 ) ( not ( = ?auto_118732 ?auto_118733 ) ) ( not ( = ?auto_118732 ?auto_118734 ) ) ( not ( = ?auto_118732 ?auto_118731 ) ) ( not ( = ?auto_118732 ?auto_118735 ) ) ( not ( = ?auto_118732 ?auto_118736 ) ) ( not ( = ?auto_118732 ?auto_118740 ) ) ( not ( = ?auto_118732 ?auto_118738 ) ) ( not ( = ?auto_118733 ?auto_118734 ) ) ( not ( = ?auto_118733 ?auto_118731 ) ) ( not ( = ?auto_118733 ?auto_118735 ) ) ( not ( = ?auto_118733 ?auto_118736 ) ) ( not ( = ?auto_118733 ?auto_118740 ) ) ( not ( = ?auto_118733 ?auto_118738 ) ) ( not ( = ?auto_118734 ?auto_118731 ) ) ( not ( = ?auto_118734 ?auto_118735 ) ) ( not ( = ?auto_118734 ?auto_118736 ) ) ( not ( = ?auto_118734 ?auto_118740 ) ) ( not ( = ?auto_118734 ?auto_118738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118731 ?auto_118735 ?auto_118736 )
      ( MAKE-5CRATE-VERIFY ?auto_118732 ?auto_118733 ?auto_118734 ?auto_118731 ?auto_118735 ?auto_118736 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_118745 - SURFACE
      ?auto_118746 - SURFACE
      ?auto_118747 - SURFACE
      ?auto_118744 - SURFACE
      ?auto_118748 - SURFACE
      ?auto_118750 - SURFACE
      ?auto_118749 - SURFACE
    )
    :vars
    (
      ?auto_118751 - HOIST
      ?auto_118755 - PLACE
      ?auto_118753 - PLACE
      ?auto_118756 - HOIST
      ?auto_118754 - SURFACE
      ?auto_118752 - SURFACE
      ?auto_118757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118751 ?auto_118755 ) ( IS-CRATE ?auto_118749 ) ( not ( = ?auto_118750 ?auto_118749 ) ) ( not ( = ?auto_118748 ?auto_118750 ) ) ( not ( = ?auto_118748 ?auto_118749 ) ) ( not ( = ?auto_118753 ?auto_118755 ) ) ( HOIST-AT ?auto_118756 ?auto_118753 ) ( not ( = ?auto_118751 ?auto_118756 ) ) ( SURFACE-AT ?auto_118749 ?auto_118753 ) ( ON ?auto_118749 ?auto_118754 ) ( CLEAR ?auto_118749 ) ( not ( = ?auto_118750 ?auto_118754 ) ) ( not ( = ?auto_118749 ?auto_118754 ) ) ( not ( = ?auto_118748 ?auto_118754 ) ) ( SURFACE-AT ?auto_118748 ?auto_118755 ) ( CLEAR ?auto_118748 ) ( IS-CRATE ?auto_118750 ) ( AVAILABLE ?auto_118751 ) ( AVAILABLE ?auto_118756 ) ( SURFACE-AT ?auto_118750 ?auto_118753 ) ( ON ?auto_118750 ?auto_118752 ) ( CLEAR ?auto_118750 ) ( not ( = ?auto_118750 ?auto_118752 ) ) ( not ( = ?auto_118749 ?auto_118752 ) ) ( not ( = ?auto_118748 ?auto_118752 ) ) ( not ( = ?auto_118754 ?auto_118752 ) ) ( TRUCK-AT ?auto_118757 ?auto_118755 ) ( ON ?auto_118746 ?auto_118745 ) ( ON ?auto_118747 ?auto_118746 ) ( ON ?auto_118744 ?auto_118747 ) ( ON ?auto_118748 ?auto_118744 ) ( not ( = ?auto_118745 ?auto_118746 ) ) ( not ( = ?auto_118745 ?auto_118747 ) ) ( not ( = ?auto_118745 ?auto_118744 ) ) ( not ( = ?auto_118745 ?auto_118748 ) ) ( not ( = ?auto_118745 ?auto_118750 ) ) ( not ( = ?auto_118745 ?auto_118749 ) ) ( not ( = ?auto_118745 ?auto_118754 ) ) ( not ( = ?auto_118745 ?auto_118752 ) ) ( not ( = ?auto_118746 ?auto_118747 ) ) ( not ( = ?auto_118746 ?auto_118744 ) ) ( not ( = ?auto_118746 ?auto_118748 ) ) ( not ( = ?auto_118746 ?auto_118750 ) ) ( not ( = ?auto_118746 ?auto_118749 ) ) ( not ( = ?auto_118746 ?auto_118754 ) ) ( not ( = ?auto_118746 ?auto_118752 ) ) ( not ( = ?auto_118747 ?auto_118744 ) ) ( not ( = ?auto_118747 ?auto_118748 ) ) ( not ( = ?auto_118747 ?auto_118750 ) ) ( not ( = ?auto_118747 ?auto_118749 ) ) ( not ( = ?auto_118747 ?auto_118754 ) ) ( not ( = ?auto_118747 ?auto_118752 ) ) ( not ( = ?auto_118744 ?auto_118748 ) ) ( not ( = ?auto_118744 ?auto_118750 ) ) ( not ( = ?auto_118744 ?auto_118749 ) ) ( not ( = ?auto_118744 ?auto_118754 ) ) ( not ( = ?auto_118744 ?auto_118752 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118748 ?auto_118750 ?auto_118749 )
      ( MAKE-6CRATE-VERIFY ?auto_118745 ?auto_118746 ?auto_118747 ?auto_118744 ?auto_118748 ?auto_118750 ?auto_118749 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118759 - SURFACE
      ?auto_118760 - SURFACE
      ?auto_118761 - SURFACE
      ?auto_118758 - SURFACE
      ?auto_118762 - SURFACE
      ?auto_118764 - SURFACE
      ?auto_118763 - SURFACE
      ?auto_118765 - SURFACE
    )
    :vars
    (
      ?auto_118766 - HOIST
      ?auto_118770 - PLACE
      ?auto_118768 - PLACE
      ?auto_118771 - HOIST
      ?auto_118769 - SURFACE
      ?auto_118767 - SURFACE
      ?auto_118772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118766 ?auto_118770 ) ( IS-CRATE ?auto_118765 ) ( not ( = ?auto_118763 ?auto_118765 ) ) ( not ( = ?auto_118764 ?auto_118763 ) ) ( not ( = ?auto_118764 ?auto_118765 ) ) ( not ( = ?auto_118768 ?auto_118770 ) ) ( HOIST-AT ?auto_118771 ?auto_118768 ) ( not ( = ?auto_118766 ?auto_118771 ) ) ( SURFACE-AT ?auto_118765 ?auto_118768 ) ( ON ?auto_118765 ?auto_118769 ) ( CLEAR ?auto_118765 ) ( not ( = ?auto_118763 ?auto_118769 ) ) ( not ( = ?auto_118765 ?auto_118769 ) ) ( not ( = ?auto_118764 ?auto_118769 ) ) ( SURFACE-AT ?auto_118764 ?auto_118770 ) ( CLEAR ?auto_118764 ) ( IS-CRATE ?auto_118763 ) ( AVAILABLE ?auto_118766 ) ( AVAILABLE ?auto_118771 ) ( SURFACE-AT ?auto_118763 ?auto_118768 ) ( ON ?auto_118763 ?auto_118767 ) ( CLEAR ?auto_118763 ) ( not ( = ?auto_118763 ?auto_118767 ) ) ( not ( = ?auto_118765 ?auto_118767 ) ) ( not ( = ?auto_118764 ?auto_118767 ) ) ( not ( = ?auto_118769 ?auto_118767 ) ) ( TRUCK-AT ?auto_118772 ?auto_118770 ) ( ON ?auto_118760 ?auto_118759 ) ( ON ?auto_118761 ?auto_118760 ) ( ON ?auto_118758 ?auto_118761 ) ( ON ?auto_118762 ?auto_118758 ) ( ON ?auto_118764 ?auto_118762 ) ( not ( = ?auto_118759 ?auto_118760 ) ) ( not ( = ?auto_118759 ?auto_118761 ) ) ( not ( = ?auto_118759 ?auto_118758 ) ) ( not ( = ?auto_118759 ?auto_118762 ) ) ( not ( = ?auto_118759 ?auto_118764 ) ) ( not ( = ?auto_118759 ?auto_118763 ) ) ( not ( = ?auto_118759 ?auto_118765 ) ) ( not ( = ?auto_118759 ?auto_118769 ) ) ( not ( = ?auto_118759 ?auto_118767 ) ) ( not ( = ?auto_118760 ?auto_118761 ) ) ( not ( = ?auto_118760 ?auto_118758 ) ) ( not ( = ?auto_118760 ?auto_118762 ) ) ( not ( = ?auto_118760 ?auto_118764 ) ) ( not ( = ?auto_118760 ?auto_118763 ) ) ( not ( = ?auto_118760 ?auto_118765 ) ) ( not ( = ?auto_118760 ?auto_118769 ) ) ( not ( = ?auto_118760 ?auto_118767 ) ) ( not ( = ?auto_118761 ?auto_118758 ) ) ( not ( = ?auto_118761 ?auto_118762 ) ) ( not ( = ?auto_118761 ?auto_118764 ) ) ( not ( = ?auto_118761 ?auto_118763 ) ) ( not ( = ?auto_118761 ?auto_118765 ) ) ( not ( = ?auto_118761 ?auto_118769 ) ) ( not ( = ?auto_118761 ?auto_118767 ) ) ( not ( = ?auto_118758 ?auto_118762 ) ) ( not ( = ?auto_118758 ?auto_118764 ) ) ( not ( = ?auto_118758 ?auto_118763 ) ) ( not ( = ?auto_118758 ?auto_118765 ) ) ( not ( = ?auto_118758 ?auto_118769 ) ) ( not ( = ?auto_118758 ?auto_118767 ) ) ( not ( = ?auto_118762 ?auto_118764 ) ) ( not ( = ?auto_118762 ?auto_118763 ) ) ( not ( = ?auto_118762 ?auto_118765 ) ) ( not ( = ?auto_118762 ?auto_118769 ) ) ( not ( = ?auto_118762 ?auto_118767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118764 ?auto_118763 ?auto_118765 )
      ( MAKE-7CRATE-VERIFY ?auto_118759 ?auto_118760 ?auto_118761 ?auto_118758 ?auto_118762 ?auto_118764 ?auto_118763 ?auto_118765 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_118819 - SURFACE
      ?auto_118820 - SURFACE
      ?auto_118821 - SURFACE
      ?auto_118818 - SURFACE
      ?auto_118822 - SURFACE
      ?auto_118823 - SURFACE
    )
    :vars
    (
      ?auto_118825 - HOIST
      ?auto_118824 - PLACE
      ?auto_118826 - PLACE
      ?auto_118828 - HOIST
      ?auto_118827 - SURFACE
      ?auto_118830 - SURFACE
      ?auto_118829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118825 ?auto_118824 ) ( IS-CRATE ?auto_118823 ) ( not ( = ?auto_118822 ?auto_118823 ) ) ( not ( = ?auto_118818 ?auto_118822 ) ) ( not ( = ?auto_118818 ?auto_118823 ) ) ( not ( = ?auto_118826 ?auto_118824 ) ) ( HOIST-AT ?auto_118828 ?auto_118826 ) ( not ( = ?auto_118825 ?auto_118828 ) ) ( SURFACE-AT ?auto_118823 ?auto_118826 ) ( ON ?auto_118823 ?auto_118827 ) ( CLEAR ?auto_118823 ) ( not ( = ?auto_118822 ?auto_118827 ) ) ( not ( = ?auto_118823 ?auto_118827 ) ) ( not ( = ?auto_118818 ?auto_118827 ) ) ( IS-CRATE ?auto_118822 ) ( AVAILABLE ?auto_118828 ) ( SURFACE-AT ?auto_118822 ?auto_118826 ) ( ON ?auto_118822 ?auto_118830 ) ( CLEAR ?auto_118822 ) ( not ( = ?auto_118822 ?auto_118830 ) ) ( not ( = ?auto_118823 ?auto_118830 ) ) ( not ( = ?auto_118818 ?auto_118830 ) ) ( not ( = ?auto_118827 ?auto_118830 ) ) ( TRUCK-AT ?auto_118829 ?auto_118824 ) ( SURFACE-AT ?auto_118821 ?auto_118824 ) ( CLEAR ?auto_118821 ) ( LIFTING ?auto_118825 ?auto_118818 ) ( IS-CRATE ?auto_118818 ) ( not ( = ?auto_118821 ?auto_118818 ) ) ( not ( = ?auto_118822 ?auto_118821 ) ) ( not ( = ?auto_118823 ?auto_118821 ) ) ( not ( = ?auto_118827 ?auto_118821 ) ) ( not ( = ?auto_118830 ?auto_118821 ) ) ( ON ?auto_118820 ?auto_118819 ) ( ON ?auto_118821 ?auto_118820 ) ( not ( = ?auto_118819 ?auto_118820 ) ) ( not ( = ?auto_118819 ?auto_118821 ) ) ( not ( = ?auto_118819 ?auto_118818 ) ) ( not ( = ?auto_118819 ?auto_118822 ) ) ( not ( = ?auto_118819 ?auto_118823 ) ) ( not ( = ?auto_118819 ?auto_118827 ) ) ( not ( = ?auto_118819 ?auto_118830 ) ) ( not ( = ?auto_118820 ?auto_118821 ) ) ( not ( = ?auto_118820 ?auto_118818 ) ) ( not ( = ?auto_118820 ?auto_118822 ) ) ( not ( = ?auto_118820 ?auto_118823 ) ) ( not ( = ?auto_118820 ?auto_118827 ) ) ( not ( = ?auto_118820 ?auto_118830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118818 ?auto_118822 ?auto_118823 )
      ( MAKE-5CRATE-VERIFY ?auto_118819 ?auto_118820 ?auto_118821 ?auto_118818 ?auto_118822 ?auto_118823 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_118832 - SURFACE
      ?auto_118833 - SURFACE
      ?auto_118834 - SURFACE
      ?auto_118831 - SURFACE
      ?auto_118835 - SURFACE
      ?auto_118837 - SURFACE
      ?auto_118836 - SURFACE
    )
    :vars
    (
      ?auto_118839 - HOIST
      ?auto_118838 - PLACE
      ?auto_118840 - PLACE
      ?auto_118842 - HOIST
      ?auto_118841 - SURFACE
      ?auto_118844 - SURFACE
      ?auto_118843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118839 ?auto_118838 ) ( IS-CRATE ?auto_118836 ) ( not ( = ?auto_118837 ?auto_118836 ) ) ( not ( = ?auto_118835 ?auto_118837 ) ) ( not ( = ?auto_118835 ?auto_118836 ) ) ( not ( = ?auto_118840 ?auto_118838 ) ) ( HOIST-AT ?auto_118842 ?auto_118840 ) ( not ( = ?auto_118839 ?auto_118842 ) ) ( SURFACE-AT ?auto_118836 ?auto_118840 ) ( ON ?auto_118836 ?auto_118841 ) ( CLEAR ?auto_118836 ) ( not ( = ?auto_118837 ?auto_118841 ) ) ( not ( = ?auto_118836 ?auto_118841 ) ) ( not ( = ?auto_118835 ?auto_118841 ) ) ( IS-CRATE ?auto_118837 ) ( AVAILABLE ?auto_118842 ) ( SURFACE-AT ?auto_118837 ?auto_118840 ) ( ON ?auto_118837 ?auto_118844 ) ( CLEAR ?auto_118837 ) ( not ( = ?auto_118837 ?auto_118844 ) ) ( not ( = ?auto_118836 ?auto_118844 ) ) ( not ( = ?auto_118835 ?auto_118844 ) ) ( not ( = ?auto_118841 ?auto_118844 ) ) ( TRUCK-AT ?auto_118843 ?auto_118838 ) ( SURFACE-AT ?auto_118831 ?auto_118838 ) ( CLEAR ?auto_118831 ) ( LIFTING ?auto_118839 ?auto_118835 ) ( IS-CRATE ?auto_118835 ) ( not ( = ?auto_118831 ?auto_118835 ) ) ( not ( = ?auto_118837 ?auto_118831 ) ) ( not ( = ?auto_118836 ?auto_118831 ) ) ( not ( = ?auto_118841 ?auto_118831 ) ) ( not ( = ?auto_118844 ?auto_118831 ) ) ( ON ?auto_118833 ?auto_118832 ) ( ON ?auto_118834 ?auto_118833 ) ( ON ?auto_118831 ?auto_118834 ) ( not ( = ?auto_118832 ?auto_118833 ) ) ( not ( = ?auto_118832 ?auto_118834 ) ) ( not ( = ?auto_118832 ?auto_118831 ) ) ( not ( = ?auto_118832 ?auto_118835 ) ) ( not ( = ?auto_118832 ?auto_118837 ) ) ( not ( = ?auto_118832 ?auto_118836 ) ) ( not ( = ?auto_118832 ?auto_118841 ) ) ( not ( = ?auto_118832 ?auto_118844 ) ) ( not ( = ?auto_118833 ?auto_118834 ) ) ( not ( = ?auto_118833 ?auto_118831 ) ) ( not ( = ?auto_118833 ?auto_118835 ) ) ( not ( = ?auto_118833 ?auto_118837 ) ) ( not ( = ?auto_118833 ?auto_118836 ) ) ( not ( = ?auto_118833 ?auto_118841 ) ) ( not ( = ?auto_118833 ?auto_118844 ) ) ( not ( = ?auto_118834 ?auto_118831 ) ) ( not ( = ?auto_118834 ?auto_118835 ) ) ( not ( = ?auto_118834 ?auto_118837 ) ) ( not ( = ?auto_118834 ?auto_118836 ) ) ( not ( = ?auto_118834 ?auto_118841 ) ) ( not ( = ?auto_118834 ?auto_118844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118835 ?auto_118837 ?auto_118836 )
      ( MAKE-6CRATE-VERIFY ?auto_118832 ?auto_118833 ?auto_118834 ?auto_118831 ?auto_118835 ?auto_118837 ?auto_118836 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118846 - SURFACE
      ?auto_118847 - SURFACE
      ?auto_118848 - SURFACE
      ?auto_118845 - SURFACE
      ?auto_118849 - SURFACE
      ?auto_118851 - SURFACE
      ?auto_118850 - SURFACE
      ?auto_118852 - SURFACE
    )
    :vars
    (
      ?auto_118854 - HOIST
      ?auto_118853 - PLACE
      ?auto_118855 - PLACE
      ?auto_118857 - HOIST
      ?auto_118856 - SURFACE
      ?auto_118859 - SURFACE
      ?auto_118858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118854 ?auto_118853 ) ( IS-CRATE ?auto_118852 ) ( not ( = ?auto_118850 ?auto_118852 ) ) ( not ( = ?auto_118851 ?auto_118850 ) ) ( not ( = ?auto_118851 ?auto_118852 ) ) ( not ( = ?auto_118855 ?auto_118853 ) ) ( HOIST-AT ?auto_118857 ?auto_118855 ) ( not ( = ?auto_118854 ?auto_118857 ) ) ( SURFACE-AT ?auto_118852 ?auto_118855 ) ( ON ?auto_118852 ?auto_118856 ) ( CLEAR ?auto_118852 ) ( not ( = ?auto_118850 ?auto_118856 ) ) ( not ( = ?auto_118852 ?auto_118856 ) ) ( not ( = ?auto_118851 ?auto_118856 ) ) ( IS-CRATE ?auto_118850 ) ( AVAILABLE ?auto_118857 ) ( SURFACE-AT ?auto_118850 ?auto_118855 ) ( ON ?auto_118850 ?auto_118859 ) ( CLEAR ?auto_118850 ) ( not ( = ?auto_118850 ?auto_118859 ) ) ( not ( = ?auto_118852 ?auto_118859 ) ) ( not ( = ?auto_118851 ?auto_118859 ) ) ( not ( = ?auto_118856 ?auto_118859 ) ) ( TRUCK-AT ?auto_118858 ?auto_118853 ) ( SURFACE-AT ?auto_118849 ?auto_118853 ) ( CLEAR ?auto_118849 ) ( LIFTING ?auto_118854 ?auto_118851 ) ( IS-CRATE ?auto_118851 ) ( not ( = ?auto_118849 ?auto_118851 ) ) ( not ( = ?auto_118850 ?auto_118849 ) ) ( not ( = ?auto_118852 ?auto_118849 ) ) ( not ( = ?auto_118856 ?auto_118849 ) ) ( not ( = ?auto_118859 ?auto_118849 ) ) ( ON ?auto_118847 ?auto_118846 ) ( ON ?auto_118848 ?auto_118847 ) ( ON ?auto_118845 ?auto_118848 ) ( ON ?auto_118849 ?auto_118845 ) ( not ( = ?auto_118846 ?auto_118847 ) ) ( not ( = ?auto_118846 ?auto_118848 ) ) ( not ( = ?auto_118846 ?auto_118845 ) ) ( not ( = ?auto_118846 ?auto_118849 ) ) ( not ( = ?auto_118846 ?auto_118851 ) ) ( not ( = ?auto_118846 ?auto_118850 ) ) ( not ( = ?auto_118846 ?auto_118852 ) ) ( not ( = ?auto_118846 ?auto_118856 ) ) ( not ( = ?auto_118846 ?auto_118859 ) ) ( not ( = ?auto_118847 ?auto_118848 ) ) ( not ( = ?auto_118847 ?auto_118845 ) ) ( not ( = ?auto_118847 ?auto_118849 ) ) ( not ( = ?auto_118847 ?auto_118851 ) ) ( not ( = ?auto_118847 ?auto_118850 ) ) ( not ( = ?auto_118847 ?auto_118852 ) ) ( not ( = ?auto_118847 ?auto_118856 ) ) ( not ( = ?auto_118847 ?auto_118859 ) ) ( not ( = ?auto_118848 ?auto_118845 ) ) ( not ( = ?auto_118848 ?auto_118849 ) ) ( not ( = ?auto_118848 ?auto_118851 ) ) ( not ( = ?auto_118848 ?auto_118850 ) ) ( not ( = ?auto_118848 ?auto_118852 ) ) ( not ( = ?auto_118848 ?auto_118856 ) ) ( not ( = ?auto_118848 ?auto_118859 ) ) ( not ( = ?auto_118845 ?auto_118849 ) ) ( not ( = ?auto_118845 ?auto_118851 ) ) ( not ( = ?auto_118845 ?auto_118850 ) ) ( not ( = ?auto_118845 ?auto_118852 ) ) ( not ( = ?auto_118845 ?auto_118856 ) ) ( not ( = ?auto_118845 ?auto_118859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118851 ?auto_118850 ?auto_118852 )
      ( MAKE-7CRATE-VERIFY ?auto_118846 ?auto_118847 ?auto_118848 ?auto_118845 ?auto_118849 ?auto_118851 ?auto_118850 ?auto_118852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_120954 - SURFACE
      ?auto_120955 - SURFACE
    )
    :vars
    (
      ?auto_120957 - HOIST
      ?auto_120963 - PLACE
      ?auto_120962 - SURFACE
      ?auto_120960 - PLACE
      ?auto_120956 - HOIST
      ?auto_120959 - SURFACE
      ?auto_120961 - TRUCK
      ?auto_120958 - SURFACE
      ?auto_120964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_120957 ?auto_120963 ) ( IS-CRATE ?auto_120955 ) ( not ( = ?auto_120954 ?auto_120955 ) ) ( not ( = ?auto_120962 ?auto_120954 ) ) ( not ( = ?auto_120962 ?auto_120955 ) ) ( not ( = ?auto_120960 ?auto_120963 ) ) ( HOIST-AT ?auto_120956 ?auto_120960 ) ( not ( = ?auto_120957 ?auto_120956 ) ) ( SURFACE-AT ?auto_120955 ?auto_120960 ) ( ON ?auto_120955 ?auto_120959 ) ( CLEAR ?auto_120955 ) ( not ( = ?auto_120954 ?auto_120959 ) ) ( not ( = ?auto_120955 ?auto_120959 ) ) ( not ( = ?auto_120962 ?auto_120959 ) ) ( SURFACE-AT ?auto_120962 ?auto_120963 ) ( CLEAR ?auto_120962 ) ( IS-CRATE ?auto_120954 ) ( AVAILABLE ?auto_120957 ) ( TRUCK-AT ?auto_120961 ?auto_120960 ) ( SURFACE-AT ?auto_120954 ?auto_120960 ) ( ON ?auto_120954 ?auto_120958 ) ( CLEAR ?auto_120954 ) ( not ( = ?auto_120954 ?auto_120958 ) ) ( not ( = ?auto_120955 ?auto_120958 ) ) ( not ( = ?auto_120962 ?auto_120958 ) ) ( not ( = ?auto_120959 ?auto_120958 ) ) ( LIFTING ?auto_120956 ?auto_120964 ) ( IS-CRATE ?auto_120964 ) ( not ( = ?auto_120954 ?auto_120964 ) ) ( not ( = ?auto_120955 ?auto_120964 ) ) ( not ( = ?auto_120962 ?auto_120964 ) ) ( not ( = ?auto_120959 ?auto_120964 ) ) ( not ( = ?auto_120958 ?auto_120964 ) ) )
    :subtasks
    ( ( !LOAD ?auto_120956 ?auto_120964 ?auto_120961 ?auto_120960 )
      ( MAKE-2CRATE ?auto_120962 ?auto_120954 ?auto_120955 )
      ( MAKE-1CRATE-VERIFY ?auto_120954 ?auto_120955 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_120965 - SURFACE
      ?auto_120966 - SURFACE
      ?auto_120967 - SURFACE
    )
    :vars
    (
      ?auto_120971 - HOIST
      ?auto_120969 - PLACE
      ?auto_120968 - PLACE
      ?auto_120973 - HOIST
      ?auto_120974 - SURFACE
      ?auto_120975 - TRUCK
      ?auto_120972 - SURFACE
      ?auto_120970 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_120971 ?auto_120969 ) ( IS-CRATE ?auto_120967 ) ( not ( = ?auto_120966 ?auto_120967 ) ) ( not ( = ?auto_120965 ?auto_120966 ) ) ( not ( = ?auto_120965 ?auto_120967 ) ) ( not ( = ?auto_120968 ?auto_120969 ) ) ( HOIST-AT ?auto_120973 ?auto_120968 ) ( not ( = ?auto_120971 ?auto_120973 ) ) ( SURFACE-AT ?auto_120967 ?auto_120968 ) ( ON ?auto_120967 ?auto_120974 ) ( CLEAR ?auto_120967 ) ( not ( = ?auto_120966 ?auto_120974 ) ) ( not ( = ?auto_120967 ?auto_120974 ) ) ( not ( = ?auto_120965 ?auto_120974 ) ) ( SURFACE-AT ?auto_120965 ?auto_120969 ) ( CLEAR ?auto_120965 ) ( IS-CRATE ?auto_120966 ) ( AVAILABLE ?auto_120971 ) ( TRUCK-AT ?auto_120975 ?auto_120968 ) ( SURFACE-AT ?auto_120966 ?auto_120968 ) ( ON ?auto_120966 ?auto_120972 ) ( CLEAR ?auto_120966 ) ( not ( = ?auto_120966 ?auto_120972 ) ) ( not ( = ?auto_120967 ?auto_120972 ) ) ( not ( = ?auto_120965 ?auto_120972 ) ) ( not ( = ?auto_120974 ?auto_120972 ) ) ( LIFTING ?auto_120973 ?auto_120970 ) ( IS-CRATE ?auto_120970 ) ( not ( = ?auto_120966 ?auto_120970 ) ) ( not ( = ?auto_120967 ?auto_120970 ) ) ( not ( = ?auto_120965 ?auto_120970 ) ) ( not ( = ?auto_120974 ?auto_120970 ) ) ( not ( = ?auto_120972 ?auto_120970 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_120966 ?auto_120967 )
      ( MAKE-2CRATE-VERIFY ?auto_120965 ?auto_120966 ?auto_120967 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121290 - SURFACE
      ?auto_121291 - SURFACE
      ?auto_121292 - SURFACE
      ?auto_121289 - SURFACE
      ?auto_121293 - SURFACE
      ?auto_121295 - SURFACE
      ?auto_121294 - SURFACE
      ?auto_121296 - SURFACE
      ?auto_121297 - SURFACE
    )
    :vars
    (
      ?auto_121299 - HOIST
      ?auto_121298 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121299 ?auto_121298 ) ( SURFACE-AT ?auto_121296 ?auto_121298 ) ( CLEAR ?auto_121296 ) ( LIFTING ?auto_121299 ?auto_121297 ) ( IS-CRATE ?auto_121297 ) ( not ( = ?auto_121296 ?auto_121297 ) ) ( ON ?auto_121291 ?auto_121290 ) ( ON ?auto_121292 ?auto_121291 ) ( ON ?auto_121289 ?auto_121292 ) ( ON ?auto_121293 ?auto_121289 ) ( ON ?auto_121295 ?auto_121293 ) ( ON ?auto_121294 ?auto_121295 ) ( ON ?auto_121296 ?auto_121294 ) ( not ( = ?auto_121290 ?auto_121291 ) ) ( not ( = ?auto_121290 ?auto_121292 ) ) ( not ( = ?auto_121290 ?auto_121289 ) ) ( not ( = ?auto_121290 ?auto_121293 ) ) ( not ( = ?auto_121290 ?auto_121295 ) ) ( not ( = ?auto_121290 ?auto_121294 ) ) ( not ( = ?auto_121290 ?auto_121296 ) ) ( not ( = ?auto_121290 ?auto_121297 ) ) ( not ( = ?auto_121291 ?auto_121292 ) ) ( not ( = ?auto_121291 ?auto_121289 ) ) ( not ( = ?auto_121291 ?auto_121293 ) ) ( not ( = ?auto_121291 ?auto_121295 ) ) ( not ( = ?auto_121291 ?auto_121294 ) ) ( not ( = ?auto_121291 ?auto_121296 ) ) ( not ( = ?auto_121291 ?auto_121297 ) ) ( not ( = ?auto_121292 ?auto_121289 ) ) ( not ( = ?auto_121292 ?auto_121293 ) ) ( not ( = ?auto_121292 ?auto_121295 ) ) ( not ( = ?auto_121292 ?auto_121294 ) ) ( not ( = ?auto_121292 ?auto_121296 ) ) ( not ( = ?auto_121292 ?auto_121297 ) ) ( not ( = ?auto_121289 ?auto_121293 ) ) ( not ( = ?auto_121289 ?auto_121295 ) ) ( not ( = ?auto_121289 ?auto_121294 ) ) ( not ( = ?auto_121289 ?auto_121296 ) ) ( not ( = ?auto_121289 ?auto_121297 ) ) ( not ( = ?auto_121293 ?auto_121295 ) ) ( not ( = ?auto_121293 ?auto_121294 ) ) ( not ( = ?auto_121293 ?auto_121296 ) ) ( not ( = ?auto_121293 ?auto_121297 ) ) ( not ( = ?auto_121295 ?auto_121294 ) ) ( not ( = ?auto_121295 ?auto_121296 ) ) ( not ( = ?auto_121295 ?auto_121297 ) ) ( not ( = ?auto_121294 ?auto_121296 ) ) ( not ( = ?auto_121294 ?auto_121297 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_121296 ?auto_121297 )
      ( MAKE-8CRATE-VERIFY ?auto_121290 ?auto_121291 ?auto_121292 ?auto_121289 ?auto_121293 ?auto_121295 ?auto_121294 ?auto_121296 ?auto_121297 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121357 - SURFACE
      ?auto_121358 - SURFACE
      ?auto_121359 - SURFACE
      ?auto_121356 - SURFACE
      ?auto_121360 - SURFACE
      ?auto_121362 - SURFACE
      ?auto_121361 - SURFACE
      ?auto_121363 - SURFACE
      ?auto_121364 - SURFACE
    )
    :vars
    (
      ?auto_121366 - HOIST
      ?auto_121365 - PLACE
      ?auto_121367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121366 ?auto_121365 ) ( SURFACE-AT ?auto_121363 ?auto_121365 ) ( CLEAR ?auto_121363 ) ( IS-CRATE ?auto_121364 ) ( not ( = ?auto_121363 ?auto_121364 ) ) ( TRUCK-AT ?auto_121367 ?auto_121365 ) ( AVAILABLE ?auto_121366 ) ( IN ?auto_121364 ?auto_121367 ) ( ON ?auto_121363 ?auto_121361 ) ( not ( = ?auto_121361 ?auto_121363 ) ) ( not ( = ?auto_121361 ?auto_121364 ) ) ( ON ?auto_121358 ?auto_121357 ) ( ON ?auto_121359 ?auto_121358 ) ( ON ?auto_121356 ?auto_121359 ) ( ON ?auto_121360 ?auto_121356 ) ( ON ?auto_121362 ?auto_121360 ) ( ON ?auto_121361 ?auto_121362 ) ( not ( = ?auto_121357 ?auto_121358 ) ) ( not ( = ?auto_121357 ?auto_121359 ) ) ( not ( = ?auto_121357 ?auto_121356 ) ) ( not ( = ?auto_121357 ?auto_121360 ) ) ( not ( = ?auto_121357 ?auto_121362 ) ) ( not ( = ?auto_121357 ?auto_121361 ) ) ( not ( = ?auto_121357 ?auto_121363 ) ) ( not ( = ?auto_121357 ?auto_121364 ) ) ( not ( = ?auto_121358 ?auto_121359 ) ) ( not ( = ?auto_121358 ?auto_121356 ) ) ( not ( = ?auto_121358 ?auto_121360 ) ) ( not ( = ?auto_121358 ?auto_121362 ) ) ( not ( = ?auto_121358 ?auto_121361 ) ) ( not ( = ?auto_121358 ?auto_121363 ) ) ( not ( = ?auto_121358 ?auto_121364 ) ) ( not ( = ?auto_121359 ?auto_121356 ) ) ( not ( = ?auto_121359 ?auto_121360 ) ) ( not ( = ?auto_121359 ?auto_121362 ) ) ( not ( = ?auto_121359 ?auto_121361 ) ) ( not ( = ?auto_121359 ?auto_121363 ) ) ( not ( = ?auto_121359 ?auto_121364 ) ) ( not ( = ?auto_121356 ?auto_121360 ) ) ( not ( = ?auto_121356 ?auto_121362 ) ) ( not ( = ?auto_121356 ?auto_121361 ) ) ( not ( = ?auto_121356 ?auto_121363 ) ) ( not ( = ?auto_121356 ?auto_121364 ) ) ( not ( = ?auto_121360 ?auto_121362 ) ) ( not ( = ?auto_121360 ?auto_121361 ) ) ( not ( = ?auto_121360 ?auto_121363 ) ) ( not ( = ?auto_121360 ?auto_121364 ) ) ( not ( = ?auto_121362 ?auto_121361 ) ) ( not ( = ?auto_121362 ?auto_121363 ) ) ( not ( = ?auto_121362 ?auto_121364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121361 ?auto_121363 ?auto_121364 )
      ( MAKE-8CRATE-VERIFY ?auto_121357 ?auto_121358 ?auto_121359 ?auto_121356 ?auto_121360 ?auto_121362 ?auto_121361 ?auto_121363 ?auto_121364 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121433 - SURFACE
      ?auto_121434 - SURFACE
      ?auto_121435 - SURFACE
      ?auto_121432 - SURFACE
      ?auto_121436 - SURFACE
      ?auto_121438 - SURFACE
      ?auto_121437 - SURFACE
      ?auto_121439 - SURFACE
      ?auto_121440 - SURFACE
    )
    :vars
    (
      ?auto_121441 - HOIST
      ?auto_121443 - PLACE
      ?auto_121442 - TRUCK
      ?auto_121444 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121441 ?auto_121443 ) ( SURFACE-AT ?auto_121439 ?auto_121443 ) ( CLEAR ?auto_121439 ) ( IS-CRATE ?auto_121440 ) ( not ( = ?auto_121439 ?auto_121440 ) ) ( AVAILABLE ?auto_121441 ) ( IN ?auto_121440 ?auto_121442 ) ( ON ?auto_121439 ?auto_121437 ) ( not ( = ?auto_121437 ?auto_121439 ) ) ( not ( = ?auto_121437 ?auto_121440 ) ) ( TRUCK-AT ?auto_121442 ?auto_121444 ) ( not ( = ?auto_121444 ?auto_121443 ) ) ( ON ?auto_121434 ?auto_121433 ) ( ON ?auto_121435 ?auto_121434 ) ( ON ?auto_121432 ?auto_121435 ) ( ON ?auto_121436 ?auto_121432 ) ( ON ?auto_121438 ?auto_121436 ) ( ON ?auto_121437 ?auto_121438 ) ( not ( = ?auto_121433 ?auto_121434 ) ) ( not ( = ?auto_121433 ?auto_121435 ) ) ( not ( = ?auto_121433 ?auto_121432 ) ) ( not ( = ?auto_121433 ?auto_121436 ) ) ( not ( = ?auto_121433 ?auto_121438 ) ) ( not ( = ?auto_121433 ?auto_121437 ) ) ( not ( = ?auto_121433 ?auto_121439 ) ) ( not ( = ?auto_121433 ?auto_121440 ) ) ( not ( = ?auto_121434 ?auto_121435 ) ) ( not ( = ?auto_121434 ?auto_121432 ) ) ( not ( = ?auto_121434 ?auto_121436 ) ) ( not ( = ?auto_121434 ?auto_121438 ) ) ( not ( = ?auto_121434 ?auto_121437 ) ) ( not ( = ?auto_121434 ?auto_121439 ) ) ( not ( = ?auto_121434 ?auto_121440 ) ) ( not ( = ?auto_121435 ?auto_121432 ) ) ( not ( = ?auto_121435 ?auto_121436 ) ) ( not ( = ?auto_121435 ?auto_121438 ) ) ( not ( = ?auto_121435 ?auto_121437 ) ) ( not ( = ?auto_121435 ?auto_121439 ) ) ( not ( = ?auto_121435 ?auto_121440 ) ) ( not ( = ?auto_121432 ?auto_121436 ) ) ( not ( = ?auto_121432 ?auto_121438 ) ) ( not ( = ?auto_121432 ?auto_121437 ) ) ( not ( = ?auto_121432 ?auto_121439 ) ) ( not ( = ?auto_121432 ?auto_121440 ) ) ( not ( = ?auto_121436 ?auto_121438 ) ) ( not ( = ?auto_121436 ?auto_121437 ) ) ( not ( = ?auto_121436 ?auto_121439 ) ) ( not ( = ?auto_121436 ?auto_121440 ) ) ( not ( = ?auto_121438 ?auto_121437 ) ) ( not ( = ?auto_121438 ?auto_121439 ) ) ( not ( = ?auto_121438 ?auto_121440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121437 ?auto_121439 ?auto_121440 )
      ( MAKE-8CRATE-VERIFY ?auto_121433 ?auto_121434 ?auto_121435 ?auto_121432 ?auto_121436 ?auto_121438 ?auto_121437 ?auto_121439 ?auto_121440 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121517 - SURFACE
      ?auto_121518 - SURFACE
      ?auto_121519 - SURFACE
      ?auto_121516 - SURFACE
      ?auto_121520 - SURFACE
      ?auto_121522 - SURFACE
      ?auto_121521 - SURFACE
      ?auto_121523 - SURFACE
      ?auto_121524 - SURFACE
    )
    :vars
    (
      ?auto_121529 - HOIST
      ?auto_121526 - PLACE
      ?auto_121528 - TRUCK
      ?auto_121525 - PLACE
      ?auto_121527 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_121529 ?auto_121526 ) ( SURFACE-AT ?auto_121523 ?auto_121526 ) ( CLEAR ?auto_121523 ) ( IS-CRATE ?auto_121524 ) ( not ( = ?auto_121523 ?auto_121524 ) ) ( AVAILABLE ?auto_121529 ) ( ON ?auto_121523 ?auto_121521 ) ( not ( = ?auto_121521 ?auto_121523 ) ) ( not ( = ?auto_121521 ?auto_121524 ) ) ( TRUCK-AT ?auto_121528 ?auto_121525 ) ( not ( = ?auto_121525 ?auto_121526 ) ) ( HOIST-AT ?auto_121527 ?auto_121525 ) ( LIFTING ?auto_121527 ?auto_121524 ) ( not ( = ?auto_121529 ?auto_121527 ) ) ( ON ?auto_121518 ?auto_121517 ) ( ON ?auto_121519 ?auto_121518 ) ( ON ?auto_121516 ?auto_121519 ) ( ON ?auto_121520 ?auto_121516 ) ( ON ?auto_121522 ?auto_121520 ) ( ON ?auto_121521 ?auto_121522 ) ( not ( = ?auto_121517 ?auto_121518 ) ) ( not ( = ?auto_121517 ?auto_121519 ) ) ( not ( = ?auto_121517 ?auto_121516 ) ) ( not ( = ?auto_121517 ?auto_121520 ) ) ( not ( = ?auto_121517 ?auto_121522 ) ) ( not ( = ?auto_121517 ?auto_121521 ) ) ( not ( = ?auto_121517 ?auto_121523 ) ) ( not ( = ?auto_121517 ?auto_121524 ) ) ( not ( = ?auto_121518 ?auto_121519 ) ) ( not ( = ?auto_121518 ?auto_121516 ) ) ( not ( = ?auto_121518 ?auto_121520 ) ) ( not ( = ?auto_121518 ?auto_121522 ) ) ( not ( = ?auto_121518 ?auto_121521 ) ) ( not ( = ?auto_121518 ?auto_121523 ) ) ( not ( = ?auto_121518 ?auto_121524 ) ) ( not ( = ?auto_121519 ?auto_121516 ) ) ( not ( = ?auto_121519 ?auto_121520 ) ) ( not ( = ?auto_121519 ?auto_121522 ) ) ( not ( = ?auto_121519 ?auto_121521 ) ) ( not ( = ?auto_121519 ?auto_121523 ) ) ( not ( = ?auto_121519 ?auto_121524 ) ) ( not ( = ?auto_121516 ?auto_121520 ) ) ( not ( = ?auto_121516 ?auto_121522 ) ) ( not ( = ?auto_121516 ?auto_121521 ) ) ( not ( = ?auto_121516 ?auto_121523 ) ) ( not ( = ?auto_121516 ?auto_121524 ) ) ( not ( = ?auto_121520 ?auto_121522 ) ) ( not ( = ?auto_121520 ?auto_121521 ) ) ( not ( = ?auto_121520 ?auto_121523 ) ) ( not ( = ?auto_121520 ?auto_121524 ) ) ( not ( = ?auto_121522 ?auto_121521 ) ) ( not ( = ?auto_121522 ?auto_121523 ) ) ( not ( = ?auto_121522 ?auto_121524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121521 ?auto_121523 ?auto_121524 )
      ( MAKE-8CRATE-VERIFY ?auto_121517 ?auto_121518 ?auto_121519 ?auto_121516 ?auto_121520 ?auto_121522 ?auto_121521 ?auto_121523 ?auto_121524 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121609 - SURFACE
      ?auto_121610 - SURFACE
      ?auto_121611 - SURFACE
      ?auto_121608 - SURFACE
      ?auto_121612 - SURFACE
      ?auto_121614 - SURFACE
      ?auto_121613 - SURFACE
      ?auto_121615 - SURFACE
      ?auto_121616 - SURFACE
    )
    :vars
    (
      ?auto_121619 - HOIST
      ?auto_121618 - PLACE
      ?auto_121622 - TRUCK
      ?auto_121620 - PLACE
      ?auto_121621 - HOIST
      ?auto_121617 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121619 ?auto_121618 ) ( SURFACE-AT ?auto_121615 ?auto_121618 ) ( CLEAR ?auto_121615 ) ( IS-CRATE ?auto_121616 ) ( not ( = ?auto_121615 ?auto_121616 ) ) ( AVAILABLE ?auto_121619 ) ( ON ?auto_121615 ?auto_121613 ) ( not ( = ?auto_121613 ?auto_121615 ) ) ( not ( = ?auto_121613 ?auto_121616 ) ) ( TRUCK-AT ?auto_121622 ?auto_121620 ) ( not ( = ?auto_121620 ?auto_121618 ) ) ( HOIST-AT ?auto_121621 ?auto_121620 ) ( not ( = ?auto_121619 ?auto_121621 ) ) ( AVAILABLE ?auto_121621 ) ( SURFACE-AT ?auto_121616 ?auto_121620 ) ( ON ?auto_121616 ?auto_121617 ) ( CLEAR ?auto_121616 ) ( not ( = ?auto_121615 ?auto_121617 ) ) ( not ( = ?auto_121616 ?auto_121617 ) ) ( not ( = ?auto_121613 ?auto_121617 ) ) ( ON ?auto_121610 ?auto_121609 ) ( ON ?auto_121611 ?auto_121610 ) ( ON ?auto_121608 ?auto_121611 ) ( ON ?auto_121612 ?auto_121608 ) ( ON ?auto_121614 ?auto_121612 ) ( ON ?auto_121613 ?auto_121614 ) ( not ( = ?auto_121609 ?auto_121610 ) ) ( not ( = ?auto_121609 ?auto_121611 ) ) ( not ( = ?auto_121609 ?auto_121608 ) ) ( not ( = ?auto_121609 ?auto_121612 ) ) ( not ( = ?auto_121609 ?auto_121614 ) ) ( not ( = ?auto_121609 ?auto_121613 ) ) ( not ( = ?auto_121609 ?auto_121615 ) ) ( not ( = ?auto_121609 ?auto_121616 ) ) ( not ( = ?auto_121609 ?auto_121617 ) ) ( not ( = ?auto_121610 ?auto_121611 ) ) ( not ( = ?auto_121610 ?auto_121608 ) ) ( not ( = ?auto_121610 ?auto_121612 ) ) ( not ( = ?auto_121610 ?auto_121614 ) ) ( not ( = ?auto_121610 ?auto_121613 ) ) ( not ( = ?auto_121610 ?auto_121615 ) ) ( not ( = ?auto_121610 ?auto_121616 ) ) ( not ( = ?auto_121610 ?auto_121617 ) ) ( not ( = ?auto_121611 ?auto_121608 ) ) ( not ( = ?auto_121611 ?auto_121612 ) ) ( not ( = ?auto_121611 ?auto_121614 ) ) ( not ( = ?auto_121611 ?auto_121613 ) ) ( not ( = ?auto_121611 ?auto_121615 ) ) ( not ( = ?auto_121611 ?auto_121616 ) ) ( not ( = ?auto_121611 ?auto_121617 ) ) ( not ( = ?auto_121608 ?auto_121612 ) ) ( not ( = ?auto_121608 ?auto_121614 ) ) ( not ( = ?auto_121608 ?auto_121613 ) ) ( not ( = ?auto_121608 ?auto_121615 ) ) ( not ( = ?auto_121608 ?auto_121616 ) ) ( not ( = ?auto_121608 ?auto_121617 ) ) ( not ( = ?auto_121612 ?auto_121614 ) ) ( not ( = ?auto_121612 ?auto_121613 ) ) ( not ( = ?auto_121612 ?auto_121615 ) ) ( not ( = ?auto_121612 ?auto_121616 ) ) ( not ( = ?auto_121612 ?auto_121617 ) ) ( not ( = ?auto_121614 ?auto_121613 ) ) ( not ( = ?auto_121614 ?auto_121615 ) ) ( not ( = ?auto_121614 ?auto_121616 ) ) ( not ( = ?auto_121614 ?auto_121617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121613 ?auto_121615 ?auto_121616 )
      ( MAKE-8CRATE-VERIFY ?auto_121609 ?auto_121610 ?auto_121611 ?auto_121608 ?auto_121612 ?auto_121614 ?auto_121613 ?auto_121615 ?auto_121616 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121702 - SURFACE
      ?auto_121703 - SURFACE
      ?auto_121704 - SURFACE
      ?auto_121701 - SURFACE
      ?auto_121705 - SURFACE
      ?auto_121707 - SURFACE
      ?auto_121706 - SURFACE
      ?auto_121708 - SURFACE
      ?auto_121709 - SURFACE
    )
    :vars
    (
      ?auto_121715 - HOIST
      ?auto_121712 - PLACE
      ?auto_121711 - PLACE
      ?auto_121714 - HOIST
      ?auto_121710 - SURFACE
      ?auto_121713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121715 ?auto_121712 ) ( SURFACE-AT ?auto_121708 ?auto_121712 ) ( CLEAR ?auto_121708 ) ( IS-CRATE ?auto_121709 ) ( not ( = ?auto_121708 ?auto_121709 ) ) ( AVAILABLE ?auto_121715 ) ( ON ?auto_121708 ?auto_121706 ) ( not ( = ?auto_121706 ?auto_121708 ) ) ( not ( = ?auto_121706 ?auto_121709 ) ) ( not ( = ?auto_121711 ?auto_121712 ) ) ( HOIST-AT ?auto_121714 ?auto_121711 ) ( not ( = ?auto_121715 ?auto_121714 ) ) ( AVAILABLE ?auto_121714 ) ( SURFACE-AT ?auto_121709 ?auto_121711 ) ( ON ?auto_121709 ?auto_121710 ) ( CLEAR ?auto_121709 ) ( not ( = ?auto_121708 ?auto_121710 ) ) ( not ( = ?auto_121709 ?auto_121710 ) ) ( not ( = ?auto_121706 ?auto_121710 ) ) ( TRUCK-AT ?auto_121713 ?auto_121712 ) ( ON ?auto_121703 ?auto_121702 ) ( ON ?auto_121704 ?auto_121703 ) ( ON ?auto_121701 ?auto_121704 ) ( ON ?auto_121705 ?auto_121701 ) ( ON ?auto_121707 ?auto_121705 ) ( ON ?auto_121706 ?auto_121707 ) ( not ( = ?auto_121702 ?auto_121703 ) ) ( not ( = ?auto_121702 ?auto_121704 ) ) ( not ( = ?auto_121702 ?auto_121701 ) ) ( not ( = ?auto_121702 ?auto_121705 ) ) ( not ( = ?auto_121702 ?auto_121707 ) ) ( not ( = ?auto_121702 ?auto_121706 ) ) ( not ( = ?auto_121702 ?auto_121708 ) ) ( not ( = ?auto_121702 ?auto_121709 ) ) ( not ( = ?auto_121702 ?auto_121710 ) ) ( not ( = ?auto_121703 ?auto_121704 ) ) ( not ( = ?auto_121703 ?auto_121701 ) ) ( not ( = ?auto_121703 ?auto_121705 ) ) ( not ( = ?auto_121703 ?auto_121707 ) ) ( not ( = ?auto_121703 ?auto_121706 ) ) ( not ( = ?auto_121703 ?auto_121708 ) ) ( not ( = ?auto_121703 ?auto_121709 ) ) ( not ( = ?auto_121703 ?auto_121710 ) ) ( not ( = ?auto_121704 ?auto_121701 ) ) ( not ( = ?auto_121704 ?auto_121705 ) ) ( not ( = ?auto_121704 ?auto_121707 ) ) ( not ( = ?auto_121704 ?auto_121706 ) ) ( not ( = ?auto_121704 ?auto_121708 ) ) ( not ( = ?auto_121704 ?auto_121709 ) ) ( not ( = ?auto_121704 ?auto_121710 ) ) ( not ( = ?auto_121701 ?auto_121705 ) ) ( not ( = ?auto_121701 ?auto_121707 ) ) ( not ( = ?auto_121701 ?auto_121706 ) ) ( not ( = ?auto_121701 ?auto_121708 ) ) ( not ( = ?auto_121701 ?auto_121709 ) ) ( not ( = ?auto_121701 ?auto_121710 ) ) ( not ( = ?auto_121705 ?auto_121707 ) ) ( not ( = ?auto_121705 ?auto_121706 ) ) ( not ( = ?auto_121705 ?auto_121708 ) ) ( not ( = ?auto_121705 ?auto_121709 ) ) ( not ( = ?auto_121705 ?auto_121710 ) ) ( not ( = ?auto_121707 ?auto_121706 ) ) ( not ( = ?auto_121707 ?auto_121708 ) ) ( not ( = ?auto_121707 ?auto_121709 ) ) ( not ( = ?auto_121707 ?auto_121710 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121706 ?auto_121708 ?auto_121709 )
      ( MAKE-8CRATE-VERIFY ?auto_121702 ?auto_121703 ?auto_121704 ?auto_121701 ?auto_121705 ?auto_121707 ?auto_121706 ?auto_121708 ?auto_121709 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121795 - SURFACE
      ?auto_121796 - SURFACE
      ?auto_121797 - SURFACE
      ?auto_121794 - SURFACE
      ?auto_121798 - SURFACE
      ?auto_121800 - SURFACE
      ?auto_121799 - SURFACE
      ?auto_121801 - SURFACE
      ?auto_121802 - SURFACE
    )
    :vars
    (
      ?auto_121807 - HOIST
      ?auto_121803 - PLACE
      ?auto_121804 - PLACE
      ?auto_121805 - HOIST
      ?auto_121808 - SURFACE
      ?auto_121806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121807 ?auto_121803 ) ( IS-CRATE ?auto_121802 ) ( not ( = ?auto_121801 ?auto_121802 ) ) ( not ( = ?auto_121799 ?auto_121801 ) ) ( not ( = ?auto_121799 ?auto_121802 ) ) ( not ( = ?auto_121804 ?auto_121803 ) ) ( HOIST-AT ?auto_121805 ?auto_121804 ) ( not ( = ?auto_121807 ?auto_121805 ) ) ( AVAILABLE ?auto_121805 ) ( SURFACE-AT ?auto_121802 ?auto_121804 ) ( ON ?auto_121802 ?auto_121808 ) ( CLEAR ?auto_121802 ) ( not ( = ?auto_121801 ?auto_121808 ) ) ( not ( = ?auto_121802 ?auto_121808 ) ) ( not ( = ?auto_121799 ?auto_121808 ) ) ( TRUCK-AT ?auto_121806 ?auto_121803 ) ( SURFACE-AT ?auto_121799 ?auto_121803 ) ( CLEAR ?auto_121799 ) ( LIFTING ?auto_121807 ?auto_121801 ) ( IS-CRATE ?auto_121801 ) ( ON ?auto_121796 ?auto_121795 ) ( ON ?auto_121797 ?auto_121796 ) ( ON ?auto_121794 ?auto_121797 ) ( ON ?auto_121798 ?auto_121794 ) ( ON ?auto_121800 ?auto_121798 ) ( ON ?auto_121799 ?auto_121800 ) ( not ( = ?auto_121795 ?auto_121796 ) ) ( not ( = ?auto_121795 ?auto_121797 ) ) ( not ( = ?auto_121795 ?auto_121794 ) ) ( not ( = ?auto_121795 ?auto_121798 ) ) ( not ( = ?auto_121795 ?auto_121800 ) ) ( not ( = ?auto_121795 ?auto_121799 ) ) ( not ( = ?auto_121795 ?auto_121801 ) ) ( not ( = ?auto_121795 ?auto_121802 ) ) ( not ( = ?auto_121795 ?auto_121808 ) ) ( not ( = ?auto_121796 ?auto_121797 ) ) ( not ( = ?auto_121796 ?auto_121794 ) ) ( not ( = ?auto_121796 ?auto_121798 ) ) ( not ( = ?auto_121796 ?auto_121800 ) ) ( not ( = ?auto_121796 ?auto_121799 ) ) ( not ( = ?auto_121796 ?auto_121801 ) ) ( not ( = ?auto_121796 ?auto_121802 ) ) ( not ( = ?auto_121796 ?auto_121808 ) ) ( not ( = ?auto_121797 ?auto_121794 ) ) ( not ( = ?auto_121797 ?auto_121798 ) ) ( not ( = ?auto_121797 ?auto_121800 ) ) ( not ( = ?auto_121797 ?auto_121799 ) ) ( not ( = ?auto_121797 ?auto_121801 ) ) ( not ( = ?auto_121797 ?auto_121802 ) ) ( not ( = ?auto_121797 ?auto_121808 ) ) ( not ( = ?auto_121794 ?auto_121798 ) ) ( not ( = ?auto_121794 ?auto_121800 ) ) ( not ( = ?auto_121794 ?auto_121799 ) ) ( not ( = ?auto_121794 ?auto_121801 ) ) ( not ( = ?auto_121794 ?auto_121802 ) ) ( not ( = ?auto_121794 ?auto_121808 ) ) ( not ( = ?auto_121798 ?auto_121800 ) ) ( not ( = ?auto_121798 ?auto_121799 ) ) ( not ( = ?auto_121798 ?auto_121801 ) ) ( not ( = ?auto_121798 ?auto_121802 ) ) ( not ( = ?auto_121798 ?auto_121808 ) ) ( not ( = ?auto_121800 ?auto_121799 ) ) ( not ( = ?auto_121800 ?auto_121801 ) ) ( not ( = ?auto_121800 ?auto_121802 ) ) ( not ( = ?auto_121800 ?auto_121808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121799 ?auto_121801 ?auto_121802 )
      ( MAKE-8CRATE-VERIFY ?auto_121795 ?auto_121796 ?auto_121797 ?auto_121794 ?auto_121798 ?auto_121800 ?auto_121799 ?auto_121801 ?auto_121802 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121888 - SURFACE
      ?auto_121889 - SURFACE
      ?auto_121890 - SURFACE
      ?auto_121887 - SURFACE
      ?auto_121891 - SURFACE
      ?auto_121893 - SURFACE
      ?auto_121892 - SURFACE
      ?auto_121894 - SURFACE
      ?auto_121895 - SURFACE
    )
    :vars
    (
      ?auto_121901 - HOIST
      ?auto_121896 - PLACE
      ?auto_121899 - PLACE
      ?auto_121897 - HOIST
      ?auto_121898 - SURFACE
      ?auto_121900 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121901 ?auto_121896 ) ( IS-CRATE ?auto_121895 ) ( not ( = ?auto_121894 ?auto_121895 ) ) ( not ( = ?auto_121892 ?auto_121894 ) ) ( not ( = ?auto_121892 ?auto_121895 ) ) ( not ( = ?auto_121899 ?auto_121896 ) ) ( HOIST-AT ?auto_121897 ?auto_121899 ) ( not ( = ?auto_121901 ?auto_121897 ) ) ( AVAILABLE ?auto_121897 ) ( SURFACE-AT ?auto_121895 ?auto_121899 ) ( ON ?auto_121895 ?auto_121898 ) ( CLEAR ?auto_121895 ) ( not ( = ?auto_121894 ?auto_121898 ) ) ( not ( = ?auto_121895 ?auto_121898 ) ) ( not ( = ?auto_121892 ?auto_121898 ) ) ( TRUCK-AT ?auto_121900 ?auto_121896 ) ( SURFACE-AT ?auto_121892 ?auto_121896 ) ( CLEAR ?auto_121892 ) ( IS-CRATE ?auto_121894 ) ( AVAILABLE ?auto_121901 ) ( IN ?auto_121894 ?auto_121900 ) ( ON ?auto_121889 ?auto_121888 ) ( ON ?auto_121890 ?auto_121889 ) ( ON ?auto_121887 ?auto_121890 ) ( ON ?auto_121891 ?auto_121887 ) ( ON ?auto_121893 ?auto_121891 ) ( ON ?auto_121892 ?auto_121893 ) ( not ( = ?auto_121888 ?auto_121889 ) ) ( not ( = ?auto_121888 ?auto_121890 ) ) ( not ( = ?auto_121888 ?auto_121887 ) ) ( not ( = ?auto_121888 ?auto_121891 ) ) ( not ( = ?auto_121888 ?auto_121893 ) ) ( not ( = ?auto_121888 ?auto_121892 ) ) ( not ( = ?auto_121888 ?auto_121894 ) ) ( not ( = ?auto_121888 ?auto_121895 ) ) ( not ( = ?auto_121888 ?auto_121898 ) ) ( not ( = ?auto_121889 ?auto_121890 ) ) ( not ( = ?auto_121889 ?auto_121887 ) ) ( not ( = ?auto_121889 ?auto_121891 ) ) ( not ( = ?auto_121889 ?auto_121893 ) ) ( not ( = ?auto_121889 ?auto_121892 ) ) ( not ( = ?auto_121889 ?auto_121894 ) ) ( not ( = ?auto_121889 ?auto_121895 ) ) ( not ( = ?auto_121889 ?auto_121898 ) ) ( not ( = ?auto_121890 ?auto_121887 ) ) ( not ( = ?auto_121890 ?auto_121891 ) ) ( not ( = ?auto_121890 ?auto_121893 ) ) ( not ( = ?auto_121890 ?auto_121892 ) ) ( not ( = ?auto_121890 ?auto_121894 ) ) ( not ( = ?auto_121890 ?auto_121895 ) ) ( not ( = ?auto_121890 ?auto_121898 ) ) ( not ( = ?auto_121887 ?auto_121891 ) ) ( not ( = ?auto_121887 ?auto_121893 ) ) ( not ( = ?auto_121887 ?auto_121892 ) ) ( not ( = ?auto_121887 ?auto_121894 ) ) ( not ( = ?auto_121887 ?auto_121895 ) ) ( not ( = ?auto_121887 ?auto_121898 ) ) ( not ( = ?auto_121891 ?auto_121893 ) ) ( not ( = ?auto_121891 ?auto_121892 ) ) ( not ( = ?auto_121891 ?auto_121894 ) ) ( not ( = ?auto_121891 ?auto_121895 ) ) ( not ( = ?auto_121891 ?auto_121898 ) ) ( not ( = ?auto_121893 ?auto_121892 ) ) ( not ( = ?auto_121893 ?auto_121894 ) ) ( not ( = ?auto_121893 ?auto_121895 ) ) ( not ( = ?auto_121893 ?auto_121898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121892 ?auto_121894 ?auto_121895 )
      ( MAKE-8CRATE-VERIFY ?auto_121888 ?auto_121889 ?auto_121890 ?auto_121887 ?auto_121891 ?auto_121893 ?auto_121892 ?auto_121894 ?auto_121895 ) )
  )

)

