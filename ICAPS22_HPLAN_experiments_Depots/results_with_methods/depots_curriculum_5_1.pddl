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
      ?auto_502 - SURFACE
      ?auto_503 - SURFACE
    )
    :vars
    (
      ?auto_504 - HOIST
      ?auto_505 - PLACE
      ?auto_507 - PLACE
      ?auto_508 - HOIST
      ?auto_509 - SURFACE
      ?auto_506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_504 ?auto_505 ) ( SURFACE-AT ?auto_503 ?auto_505 ) ( CLEAR ?auto_503 ) ( IS-CRATE ?auto_502 ) ( AVAILABLE ?auto_504 ) ( not ( = ?auto_507 ?auto_505 ) ) ( HOIST-AT ?auto_508 ?auto_507 ) ( AVAILABLE ?auto_508 ) ( SURFACE-AT ?auto_502 ?auto_507 ) ( ON ?auto_502 ?auto_509 ) ( CLEAR ?auto_502 ) ( TRUCK-AT ?auto_506 ?auto_505 ) ( not ( = ?auto_502 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_509 ) ) ( not ( = ?auto_503 ?auto_509 ) ) ( not ( = ?auto_504 ?auto_508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_506 ?auto_505 ?auto_507 )
      ( !LIFT ?auto_508 ?auto_502 ?auto_509 ?auto_507 )
      ( !LOAD ?auto_508 ?auto_502 ?auto_506 ?auto_507 )
      ( !DRIVE ?auto_506 ?auto_507 ?auto_505 )
      ( !UNLOAD ?auto_504 ?auto_502 ?auto_506 ?auto_505 )
      ( !DROP ?auto_504 ?auto_502 ?auto_503 ?auto_505 )
      ( MAKE-ON-VERIFY ?auto_502 ?auto_503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_512 - SURFACE
      ?auto_513 - SURFACE
    )
    :vars
    (
      ?auto_514 - HOIST
      ?auto_515 - PLACE
      ?auto_517 - PLACE
      ?auto_518 - HOIST
      ?auto_519 - SURFACE
      ?auto_516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_514 ?auto_515 ) ( SURFACE-AT ?auto_513 ?auto_515 ) ( CLEAR ?auto_513 ) ( IS-CRATE ?auto_512 ) ( AVAILABLE ?auto_514 ) ( not ( = ?auto_517 ?auto_515 ) ) ( HOIST-AT ?auto_518 ?auto_517 ) ( AVAILABLE ?auto_518 ) ( SURFACE-AT ?auto_512 ?auto_517 ) ( ON ?auto_512 ?auto_519 ) ( CLEAR ?auto_512 ) ( TRUCK-AT ?auto_516 ?auto_515 ) ( not ( = ?auto_512 ?auto_513 ) ) ( not ( = ?auto_512 ?auto_519 ) ) ( not ( = ?auto_513 ?auto_519 ) ) ( not ( = ?auto_514 ?auto_518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_516 ?auto_515 ?auto_517 )
      ( !LIFT ?auto_518 ?auto_512 ?auto_519 ?auto_517 )
      ( !LOAD ?auto_518 ?auto_512 ?auto_516 ?auto_517 )
      ( !DRIVE ?auto_516 ?auto_517 ?auto_515 )
      ( !UNLOAD ?auto_514 ?auto_512 ?auto_516 ?auto_515 )
      ( !DROP ?auto_514 ?auto_512 ?auto_513 ?auto_515 )
      ( MAKE-ON-VERIFY ?auto_512 ?auto_513 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_522 - SURFACE
      ?auto_523 - SURFACE
    )
    :vars
    (
      ?auto_524 - HOIST
      ?auto_525 - PLACE
      ?auto_527 - PLACE
      ?auto_528 - HOIST
      ?auto_529 - SURFACE
      ?auto_526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_524 ?auto_525 ) ( SURFACE-AT ?auto_523 ?auto_525 ) ( CLEAR ?auto_523 ) ( IS-CRATE ?auto_522 ) ( AVAILABLE ?auto_524 ) ( not ( = ?auto_527 ?auto_525 ) ) ( HOIST-AT ?auto_528 ?auto_527 ) ( AVAILABLE ?auto_528 ) ( SURFACE-AT ?auto_522 ?auto_527 ) ( ON ?auto_522 ?auto_529 ) ( CLEAR ?auto_522 ) ( TRUCK-AT ?auto_526 ?auto_525 ) ( not ( = ?auto_522 ?auto_523 ) ) ( not ( = ?auto_522 ?auto_529 ) ) ( not ( = ?auto_523 ?auto_529 ) ) ( not ( = ?auto_524 ?auto_528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_526 ?auto_525 ?auto_527 )
      ( !LIFT ?auto_528 ?auto_522 ?auto_529 ?auto_527 )
      ( !LOAD ?auto_528 ?auto_522 ?auto_526 ?auto_527 )
      ( !DRIVE ?auto_526 ?auto_527 ?auto_525 )
      ( !UNLOAD ?auto_524 ?auto_522 ?auto_526 ?auto_525 )
      ( !DROP ?auto_524 ?auto_522 ?auto_523 ?auto_525 )
      ( MAKE-ON-VERIFY ?auto_522 ?auto_523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_532 - SURFACE
      ?auto_533 - SURFACE
    )
    :vars
    (
      ?auto_534 - HOIST
      ?auto_535 - PLACE
      ?auto_537 - PLACE
      ?auto_538 - HOIST
      ?auto_539 - SURFACE
      ?auto_536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_534 ?auto_535 ) ( SURFACE-AT ?auto_533 ?auto_535 ) ( CLEAR ?auto_533 ) ( IS-CRATE ?auto_532 ) ( AVAILABLE ?auto_534 ) ( not ( = ?auto_537 ?auto_535 ) ) ( HOIST-AT ?auto_538 ?auto_537 ) ( AVAILABLE ?auto_538 ) ( SURFACE-AT ?auto_532 ?auto_537 ) ( ON ?auto_532 ?auto_539 ) ( CLEAR ?auto_532 ) ( TRUCK-AT ?auto_536 ?auto_535 ) ( not ( = ?auto_532 ?auto_533 ) ) ( not ( = ?auto_532 ?auto_539 ) ) ( not ( = ?auto_533 ?auto_539 ) ) ( not ( = ?auto_534 ?auto_538 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_536 ?auto_535 ?auto_537 )
      ( !LIFT ?auto_538 ?auto_532 ?auto_539 ?auto_537 )
      ( !LOAD ?auto_538 ?auto_532 ?auto_536 ?auto_537 )
      ( !DRIVE ?auto_536 ?auto_537 ?auto_535 )
      ( !UNLOAD ?auto_534 ?auto_532 ?auto_536 ?auto_535 )
      ( !DROP ?auto_534 ?auto_532 ?auto_533 ?auto_535 )
      ( MAKE-ON-VERIFY ?auto_532 ?auto_533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_542 - SURFACE
      ?auto_543 - SURFACE
    )
    :vars
    (
      ?auto_544 - HOIST
      ?auto_545 - PLACE
      ?auto_547 - PLACE
      ?auto_548 - HOIST
      ?auto_549 - SURFACE
      ?auto_546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_544 ?auto_545 ) ( SURFACE-AT ?auto_543 ?auto_545 ) ( CLEAR ?auto_543 ) ( IS-CRATE ?auto_542 ) ( AVAILABLE ?auto_544 ) ( not ( = ?auto_547 ?auto_545 ) ) ( HOIST-AT ?auto_548 ?auto_547 ) ( AVAILABLE ?auto_548 ) ( SURFACE-AT ?auto_542 ?auto_547 ) ( ON ?auto_542 ?auto_549 ) ( CLEAR ?auto_542 ) ( TRUCK-AT ?auto_546 ?auto_545 ) ( not ( = ?auto_542 ?auto_543 ) ) ( not ( = ?auto_542 ?auto_549 ) ) ( not ( = ?auto_543 ?auto_549 ) ) ( not ( = ?auto_544 ?auto_548 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_546 ?auto_545 ?auto_547 )
      ( !LIFT ?auto_548 ?auto_542 ?auto_549 ?auto_547 )
      ( !LOAD ?auto_548 ?auto_542 ?auto_546 ?auto_547 )
      ( !DRIVE ?auto_546 ?auto_547 ?auto_545 )
      ( !UNLOAD ?auto_544 ?auto_542 ?auto_546 ?auto_545 )
      ( !DROP ?auto_544 ?auto_542 ?auto_543 ?auto_545 )
      ( MAKE-ON-VERIFY ?auto_542 ?auto_543 ) )
  )

)

