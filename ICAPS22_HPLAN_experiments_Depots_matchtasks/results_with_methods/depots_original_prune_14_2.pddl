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
      ?auto_1343509 - SURFACE
      ?auto_1343510 - SURFACE
    )
    :vars
    (
      ?auto_1343511 - HOIST
      ?auto_1343512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343511 ?auto_1343512 ) ( SURFACE-AT ?auto_1343509 ?auto_1343512 ) ( CLEAR ?auto_1343509 ) ( LIFTING ?auto_1343511 ?auto_1343510 ) ( IS-CRATE ?auto_1343510 ) ( not ( = ?auto_1343509 ?auto_1343510 ) ) )
    :subtasks
    ( ( !DROP ?auto_1343511 ?auto_1343510 ?auto_1343509 ?auto_1343512 )
      ( MAKE-1CRATE-VERIFY ?auto_1343509 ?auto_1343510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343513 - SURFACE
      ?auto_1343514 - SURFACE
    )
    :vars
    (
      ?auto_1343515 - HOIST
      ?auto_1343516 - PLACE
      ?auto_1343517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343515 ?auto_1343516 ) ( SURFACE-AT ?auto_1343513 ?auto_1343516 ) ( CLEAR ?auto_1343513 ) ( IS-CRATE ?auto_1343514 ) ( not ( = ?auto_1343513 ?auto_1343514 ) ) ( TRUCK-AT ?auto_1343517 ?auto_1343516 ) ( AVAILABLE ?auto_1343515 ) ( IN ?auto_1343514 ?auto_1343517 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1343515 ?auto_1343514 ?auto_1343517 ?auto_1343516 )
      ( MAKE-1CRATE ?auto_1343513 ?auto_1343514 )
      ( MAKE-1CRATE-VERIFY ?auto_1343513 ?auto_1343514 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343518 - SURFACE
      ?auto_1343519 - SURFACE
    )
    :vars
    (
      ?auto_1343520 - HOIST
      ?auto_1343522 - PLACE
      ?auto_1343521 - TRUCK
      ?auto_1343523 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343520 ?auto_1343522 ) ( SURFACE-AT ?auto_1343518 ?auto_1343522 ) ( CLEAR ?auto_1343518 ) ( IS-CRATE ?auto_1343519 ) ( not ( = ?auto_1343518 ?auto_1343519 ) ) ( AVAILABLE ?auto_1343520 ) ( IN ?auto_1343519 ?auto_1343521 ) ( TRUCK-AT ?auto_1343521 ?auto_1343523 ) ( not ( = ?auto_1343523 ?auto_1343522 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1343521 ?auto_1343523 ?auto_1343522 )
      ( MAKE-1CRATE ?auto_1343518 ?auto_1343519 )
      ( MAKE-1CRATE-VERIFY ?auto_1343518 ?auto_1343519 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343524 - SURFACE
      ?auto_1343525 - SURFACE
    )
    :vars
    (
      ?auto_1343528 - HOIST
      ?auto_1343527 - PLACE
      ?auto_1343526 - TRUCK
      ?auto_1343529 - PLACE
      ?auto_1343530 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343528 ?auto_1343527 ) ( SURFACE-AT ?auto_1343524 ?auto_1343527 ) ( CLEAR ?auto_1343524 ) ( IS-CRATE ?auto_1343525 ) ( not ( = ?auto_1343524 ?auto_1343525 ) ) ( AVAILABLE ?auto_1343528 ) ( TRUCK-AT ?auto_1343526 ?auto_1343529 ) ( not ( = ?auto_1343529 ?auto_1343527 ) ) ( HOIST-AT ?auto_1343530 ?auto_1343529 ) ( LIFTING ?auto_1343530 ?auto_1343525 ) ( not ( = ?auto_1343528 ?auto_1343530 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1343530 ?auto_1343525 ?auto_1343526 ?auto_1343529 )
      ( MAKE-1CRATE ?auto_1343524 ?auto_1343525 )
      ( MAKE-1CRATE-VERIFY ?auto_1343524 ?auto_1343525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343531 - SURFACE
      ?auto_1343532 - SURFACE
    )
    :vars
    (
      ?auto_1343536 - HOIST
      ?auto_1343533 - PLACE
      ?auto_1343534 - TRUCK
      ?auto_1343537 - PLACE
      ?auto_1343535 - HOIST
      ?auto_1343538 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343536 ?auto_1343533 ) ( SURFACE-AT ?auto_1343531 ?auto_1343533 ) ( CLEAR ?auto_1343531 ) ( IS-CRATE ?auto_1343532 ) ( not ( = ?auto_1343531 ?auto_1343532 ) ) ( AVAILABLE ?auto_1343536 ) ( TRUCK-AT ?auto_1343534 ?auto_1343537 ) ( not ( = ?auto_1343537 ?auto_1343533 ) ) ( HOIST-AT ?auto_1343535 ?auto_1343537 ) ( not ( = ?auto_1343536 ?auto_1343535 ) ) ( AVAILABLE ?auto_1343535 ) ( SURFACE-AT ?auto_1343532 ?auto_1343537 ) ( ON ?auto_1343532 ?auto_1343538 ) ( CLEAR ?auto_1343532 ) ( not ( = ?auto_1343531 ?auto_1343538 ) ) ( not ( = ?auto_1343532 ?auto_1343538 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1343535 ?auto_1343532 ?auto_1343538 ?auto_1343537 )
      ( MAKE-1CRATE ?auto_1343531 ?auto_1343532 )
      ( MAKE-1CRATE-VERIFY ?auto_1343531 ?auto_1343532 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343539 - SURFACE
      ?auto_1343540 - SURFACE
    )
    :vars
    (
      ?auto_1343543 - HOIST
      ?auto_1343545 - PLACE
      ?auto_1343544 - PLACE
      ?auto_1343546 - HOIST
      ?auto_1343542 - SURFACE
      ?auto_1343541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343543 ?auto_1343545 ) ( SURFACE-AT ?auto_1343539 ?auto_1343545 ) ( CLEAR ?auto_1343539 ) ( IS-CRATE ?auto_1343540 ) ( not ( = ?auto_1343539 ?auto_1343540 ) ) ( AVAILABLE ?auto_1343543 ) ( not ( = ?auto_1343544 ?auto_1343545 ) ) ( HOIST-AT ?auto_1343546 ?auto_1343544 ) ( not ( = ?auto_1343543 ?auto_1343546 ) ) ( AVAILABLE ?auto_1343546 ) ( SURFACE-AT ?auto_1343540 ?auto_1343544 ) ( ON ?auto_1343540 ?auto_1343542 ) ( CLEAR ?auto_1343540 ) ( not ( = ?auto_1343539 ?auto_1343542 ) ) ( not ( = ?auto_1343540 ?auto_1343542 ) ) ( TRUCK-AT ?auto_1343541 ?auto_1343545 ) )
    :subtasks
    ( ( !DRIVE ?auto_1343541 ?auto_1343545 ?auto_1343544 )
      ( MAKE-1CRATE ?auto_1343539 ?auto_1343540 )
      ( MAKE-1CRATE-VERIFY ?auto_1343539 ?auto_1343540 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343556 - SURFACE
      ?auto_1343557 - SURFACE
      ?auto_1343558 - SURFACE
    )
    :vars
    (
      ?auto_1343559 - HOIST
      ?auto_1343560 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343559 ?auto_1343560 ) ( SURFACE-AT ?auto_1343557 ?auto_1343560 ) ( CLEAR ?auto_1343557 ) ( LIFTING ?auto_1343559 ?auto_1343558 ) ( IS-CRATE ?auto_1343558 ) ( not ( = ?auto_1343557 ?auto_1343558 ) ) ( ON ?auto_1343557 ?auto_1343556 ) ( not ( = ?auto_1343556 ?auto_1343557 ) ) ( not ( = ?auto_1343556 ?auto_1343558 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343557 ?auto_1343558 )
      ( MAKE-2CRATE-VERIFY ?auto_1343556 ?auto_1343557 ?auto_1343558 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343566 - SURFACE
      ?auto_1343567 - SURFACE
      ?auto_1343568 - SURFACE
    )
    :vars
    (
      ?auto_1343570 - HOIST
      ?auto_1343571 - PLACE
      ?auto_1343569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343570 ?auto_1343571 ) ( SURFACE-AT ?auto_1343567 ?auto_1343571 ) ( CLEAR ?auto_1343567 ) ( IS-CRATE ?auto_1343568 ) ( not ( = ?auto_1343567 ?auto_1343568 ) ) ( TRUCK-AT ?auto_1343569 ?auto_1343571 ) ( AVAILABLE ?auto_1343570 ) ( IN ?auto_1343568 ?auto_1343569 ) ( ON ?auto_1343567 ?auto_1343566 ) ( not ( = ?auto_1343566 ?auto_1343567 ) ) ( not ( = ?auto_1343566 ?auto_1343568 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343567 ?auto_1343568 )
      ( MAKE-2CRATE-VERIFY ?auto_1343566 ?auto_1343567 ?auto_1343568 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343572 - SURFACE
      ?auto_1343573 - SURFACE
    )
    :vars
    (
      ?auto_1343574 - HOIST
      ?auto_1343577 - PLACE
      ?auto_1343575 - TRUCK
      ?auto_1343576 - SURFACE
      ?auto_1343578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343574 ?auto_1343577 ) ( SURFACE-AT ?auto_1343572 ?auto_1343577 ) ( CLEAR ?auto_1343572 ) ( IS-CRATE ?auto_1343573 ) ( not ( = ?auto_1343572 ?auto_1343573 ) ) ( AVAILABLE ?auto_1343574 ) ( IN ?auto_1343573 ?auto_1343575 ) ( ON ?auto_1343572 ?auto_1343576 ) ( not ( = ?auto_1343576 ?auto_1343572 ) ) ( not ( = ?auto_1343576 ?auto_1343573 ) ) ( TRUCK-AT ?auto_1343575 ?auto_1343578 ) ( not ( = ?auto_1343578 ?auto_1343577 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1343575 ?auto_1343578 ?auto_1343577 )
      ( MAKE-2CRATE ?auto_1343576 ?auto_1343572 ?auto_1343573 )
      ( MAKE-1CRATE-VERIFY ?auto_1343572 ?auto_1343573 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343579 - SURFACE
      ?auto_1343580 - SURFACE
      ?auto_1343581 - SURFACE
    )
    :vars
    (
      ?auto_1343585 - HOIST
      ?auto_1343583 - PLACE
      ?auto_1343582 - TRUCK
      ?auto_1343584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343585 ?auto_1343583 ) ( SURFACE-AT ?auto_1343580 ?auto_1343583 ) ( CLEAR ?auto_1343580 ) ( IS-CRATE ?auto_1343581 ) ( not ( = ?auto_1343580 ?auto_1343581 ) ) ( AVAILABLE ?auto_1343585 ) ( IN ?auto_1343581 ?auto_1343582 ) ( ON ?auto_1343580 ?auto_1343579 ) ( not ( = ?auto_1343579 ?auto_1343580 ) ) ( not ( = ?auto_1343579 ?auto_1343581 ) ) ( TRUCK-AT ?auto_1343582 ?auto_1343584 ) ( not ( = ?auto_1343584 ?auto_1343583 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343580 ?auto_1343581 )
      ( MAKE-2CRATE-VERIFY ?auto_1343579 ?auto_1343580 ?auto_1343581 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343586 - SURFACE
      ?auto_1343587 - SURFACE
    )
    :vars
    (
      ?auto_1343591 - HOIST
      ?auto_1343589 - PLACE
      ?auto_1343592 - SURFACE
      ?auto_1343588 - TRUCK
      ?auto_1343590 - PLACE
      ?auto_1343593 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343591 ?auto_1343589 ) ( SURFACE-AT ?auto_1343586 ?auto_1343589 ) ( CLEAR ?auto_1343586 ) ( IS-CRATE ?auto_1343587 ) ( not ( = ?auto_1343586 ?auto_1343587 ) ) ( AVAILABLE ?auto_1343591 ) ( ON ?auto_1343586 ?auto_1343592 ) ( not ( = ?auto_1343592 ?auto_1343586 ) ) ( not ( = ?auto_1343592 ?auto_1343587 ) ) ( TRUCK-AT ?auto_1343588 ?auto_1343590 ) ( not ( = ?auto_1343590 ?auto_1343589 ) ) ( HOIST-AT ?auto_1343593 ?auto_1343590 ) ( LIFTING ?auto_1343593 ?auto_1343587 ) ( not ( = ?auto_1343591 ?auto_1343593 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1343593 ?auto_1343587 ?auto_1343588 ?auto_1343590 )
      ( MAKE-2CRATE ?auto_1343592 ?auto_1343586 ?auto_1343587 )
      ( MAKE-1CRATE-VERIFY ?auto_1343586 ?auto_1343587 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343594 - SURFACE
      ?auto_1343595 - SURFACE
      ?auto_1343596 - SURFACE
    )
    :vars
    (
      ?auto_1343601 - HOIST
      ?auto_1343600 - PLACE
      ?auto_1343599 - TRUCK
      ?auto_1343598 - PLACE
      ?auto_1343597 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343601 ?auto_1343600 ) ( SURFACE-AT ?auto_1343595 ?auto_1343600 ) ( CLEAR ?auto_1343595 ) ( IS-CRATE ?auto_1343596 ) ( not ( = ?auto_1343595 ?auto_1343596 ) ) ( AVAILABLE ?auto_1343601 ) ( ON ?auto_1343595 ?auto_1343594 ) ( not ( = ?auto_1343594 ?auto_1343595 ) ) ( not ( = ?auto_1343594 ?auto_1343596 ) ) ( TRUCK-AT ?auto_1343599 ?auto_1343598 ) ( not ( = ?auto_1343598 ?auto_1343600 ) ) ( HOIST-AT ?auto_1343597 ?auto_1343598 ) ( LIFTING ?auto_1343597 ?auto_1343596 ) ( not ( = ?auto_1343601 ?auto_1343597 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343595 ?auto_1343596 )
      ( MAKE-2CRATE-VERIFY ?auto_1343594 ?auto_1343595 ?auto_1343596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343602 - SURFACE
      ?auto_1343603 - SURFACE
    )
    :vars
    (
      ?auto_1343606 - HOIST
      ?auto_1343609 - PLACE
      ?auto_1343605 - SURFACE
      ?auto_1343607 - TRUCK
      ?auto_1343608 - PLACE
      ?auto_1343604 - HOIST
      ?auto_1343610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343606 ?auto_1343609 ) ( SURFACE-AT ?auto_1343602 ?auto_1343609 ) ( CLEAR ?auto_1343602 ) ( IS-CRATE ?auto_1343603 ) ( not ( = ?auto_1343602 ?auto_1343603 ) ) ( AVAILABLE ?auto_1343606 ) ( ON ?auto_1343602 ?auto_1343605 ) ( not ( = ?auto_1343605 ?auto_1343602 ) ) ( not ( = ?auto_1343605 ?auto_1343603 ) ) ( TRUCK-AT ?auto_1343607 ?auto_1343608 ) ( not ( = ?auto_1343608 ?auto_1343609 ) ) ( HOIST-AT ?auto_1343604 ?auto_1343608 ) ( not ( = ?auto_1343606 ?auto_1343604 ) ) ( AVAILABLE ?auto_1343604 ) ( SURFACE-AT ?auto_1343603 ?auto_1343608 ) ( ON ?auto_1343603 ?auto_1343610 ) ( CLEAR ?auto_1343603 ) ( not ( = ?auto_1343602 ?auto_1343610 ) ) ( not ( = ?auto_1343603 ?auto_1343610 ) ) ( not ( = ?auto_1343605 ?auto_1343610 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1343604 ?auto_1343603 ?auto_1343610 ?auto_1343608 )
      ( MAKE-2CRATE ?auto_1343605 ?auto_1343602 ?auto_1343603 )
      ( MAKE-1CRATE-VERIFY ?auto_1343602 ?auto_1343603 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343611 - SURFACE
      ?auto_1343612 - SURFACE
      ?auto_1343613 - SURFACE
    )
    :vars
    (
      ?auto_1343616 - HOIST
      ?auto_1343615 - PLACE
      ?auto_1343618 - TRUCK
      ?auto_1343619 - PLACE
      ?auto_1343617 - HOIST
      ?auto_1343614 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343616 ?auto_1343615 ) ( SURFACE-AT ?auto_1343612 ?auto_1343615 ) ( CLEAR ?auto_1343612 ) ( IS-CRATE ?auto_1343613 ) ( not ( = ?auto_1343612 ?auto_1343613 ) ) ( AVAILABLE ?auto_1343616 ) ( ON ?auto_1343612 ?auto_1343611 ) ( not ( = ?auto_1343611 ?auto_1343612 ) ) ( not ( = ?auto_1343611 ?auto_1343613 ) ) ( TRUCK-AT ?auto_1343618 ?auto_1343619 ) ( not ( = ?auto_1343619 ?auto_1343615 ) ) ( HOIST-AT ?auto_1343617 ?auto_1343619 ) ( not ( = ?auto_1343616 ?auto_1343617 ) ) ( AVAILABLE ?auto_1343617 ) ( SURFACE-AT ?auto_1343613 ?auto_1343619 ) ( ON ?auto_1343613 ?auto_1343614 ) ( CLEAR ?auto_1343613 ) ( not ( = ?auto_1343612 ?auto_1343614 ) ) ( not ( = ?auto_1343613 ?auto_1343614 ) ) ( not ( = ?auto_1343611 ?auto_1343614 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343612 ?auto_1343613 )
      ( MAKE-2CRATE-VERIFY ?auto_1343611 ?auto_1343612 ?auto_1343613 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343620 - SURFACE
      ?auto_1343621 - SURFACE
    )
    :vars
    (
      ?auto_1343628 - HOIST
      ?auto_1343624 - PLACE
      ?auto_1343623 - SURFACE
      ?auto_1343626 - PLACE
      ?auto_1343627 - HOIST
      ?auto_1343622 - SURFACE
      ?auto_1343625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343628 ?auto_1343624 ) ( SURFACE-AT ?auto_1343620 ?auto_1343624 ) ( CLEAR ?auto_1343620 ) ( IS-CRATE ?auto_1343621 ) ( not ( = ?auto_1343620 ?auto_1343621 ) ) ( AVAILABLE ?auto_1343628 ) ( ON ?auto_1343620 ?auto_1343623 ) ( not ( = ?auto_1343623 ?auto_1343620 ) ) ( not ( = ?auto_1343623 ?auto_1343621 ) ) ( not ( = ?auto_1343626 ?auto_1343624 ) ) ( HOIST-AT ?auto_1343627 ?auto_1343626 ) ( not ( = ?auto_1343628 ?auto_1343627 ) ) ( AVAILABLE ?auto_1343627 ) ( SURFACE-AT ?auto_1343621 ?auto_1343626 ) ( ON ?auto_1343621 ?auto_1343622 ) ( CLEAR ?auto_1343621 ) ( not ( = ?auto_1343620 ?auto_1343622 ) ) ( not ( = ?auto_1343621 ?auto_1343622 ) ) ( not ( = ?auto_1343623 ?auto_1343622 ) ) ( TRUCK-AT ?auto_1343625 ?auto_1343624 ) )
    :subtasks
    ( ( !DRIVE ?auto_1343625 ?auto_1343624 ?auto_1343626 )
      ( MAKE-2CRATE ?auto_1343623 ?auto_1343620 ?auto_1343621 )
      ( MAKE-1CRATE-VERIFY ?auto_1343620 ?auto_1343621 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343629 - SURFACE
      ?auto_1343630 - SURFACE
      ?auto_1343631 - SURFACE
    )
    :vars
    (
      ?auto_1343632 - HOIST
      ?auto_1343635 - PLACE
      ?auto_1343633 - PLACE
      ?auto_1343637 - HOIST
      ?auto_1343634 - SURFACE
      ?auto_1343636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343632 ?auto_1343635 ) ( SURFACE-AT ?auto_1343630 ?auto_1343635 ) ( CLEAR ?auto_1343630 ) ( IS-CRATE ?auto_1343631 ) ( not ( = ?auto_1343630 ?auto_1343631 ) ) ( AVAILABLE ?auto_1343632 ) ( ON ?auto_1343630 ?auto_1343629 ) ( not ( = ?auto_1343629 ?auto_1343630 ) ) ( not ( = ?auto_1343629 ?auto_1343631 ) ) ( not ( = ?auto_1343633 ?auto_1343635 ) ) ( HOIST-AT ?auto_1343637 ?auto_1343633 ) ( not ( = ?auto_1343632 ?auto_1343637 ) ) ( AVAILABLE ?auto_1343637 ) ( SURFACE-AT ?auto_1343631 ?auto_1343633 ) ( ON ?auto_1343631 ?auto_1343634 ) ( CLEAR ?auto_1343631 ) ( not ( = ?auto_1343630 ?auto_1343634 ) ) ( not ( = ?auto_1343631 ?auto_1343634 ) ) ( not ( = ?auto_1343629 ?auto_1343634 ) ) ( TRUCK-AT ?auto_1343636 ?auto_1343635 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343630 ?auto_1343631 )
      ( MAKE-2CRATE-VERIFY ?auto_1343629 ?auto_1343630 ?auto_1343631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343638 - SURFACE
      ?auto_1343639 - SURFACE
    )
    :vars
    (
      ?auto_1343646 - HOIST
      ?auto_1343645 - PLACE
      ?auto_1343644 - SURFACE
      ?auto_1343642 - PLACE
      ?auto_1343643 - HOIST
      ?auto_1343640 - SURFACE
      ?auto_1343641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343646 ?auto_1343645 ) ( IS-CRATE ?auto_1343639 ) ( not ( = ?auto_1343638 ?auto_1343639 ) ) ( not ( = ?auto_1343644 ?auto_1343638 ) ) ( not ( = ?auto_1343644 ?auto_1343639 ) ) ( not ( = ?auto_1343642 ?auto_1343645 ) ) ( HOIST-AT ?auto_1343643 ?auto_1343642 ) ( not ( = ?auto_1343646 ?auto_1343643 ) ) ( AVAILABLE ?auto_1343643 ) ( SURFACE-AT ?auto_1343639 ?auto_1343642 ) ( ON ?auto_1343639 ?auto_1343640 ) ( CLEAR ?auto_1343639 ) ( not ( = ?auto_1343638 ?auto_1343640 ) ) ( not ( = ?auto_1343639 ?auto_1343640 ) ) ( not ( = ?auto_1343644 ?auto_1343640 ) ) ( TRUCK-AT ?auto_1343641 ?auto_1343645 ) ( SURFACE-AT ?auto_1343644 ?auto_1343645 ) ( CLEAR ?auto_1343644 ) ( LIFTING ?auto_1343646 ?auto_1343638 ) ( IS-CRATE ?auto_1343638 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343644 ?auto_1343638 )
      ( MAKE-2CRATE ?auto_1343644 ?auto_1343638 ?auto_1343639 )
      ( MAKE-1CRATE-VERIFY ?auto_1343638 ?auto_1343639 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343647 - SURFACE
      ?auto_1343648 - SURFACE
      ?auto_1343649 - SURFACE
    )
    :vars
    (
      ?auto_1343652 - HOIST
      ?auto_1343651 - PLACE
      ?auto_1343655 - PLACE
      ?auto_1343650 - HOIST
      ?auto_1343654 - SURFACE
      ?auto_1343653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343652 ?auto_1343651 ) ( IS-CRATE ?auto_1343649 ) ( not ( = ?auto_1343648 ?auto_1343649 ) ) ( not ( = ?auto_1343647 ?auto_1343648 ) ) ( not ( = ?auto_1343647 ?auto_1343649 ) ) ( not ( = ?auto_1343655 ?auto_1343651 ) ) ( HOIST-AT ?auto_1343650 ?auto_1343655 ) ( not ( = ?auto_1343652 ?auto_1343650 ) ) ( AVAILABLE ?auto_1343650 ) ( SURFACE-AT ?auto_1343649 ?auto_1343655 ) ( ON ?auto_1343649 ?auto_1343654 ) ( CLEAR ?auto_1343649 ) ( not ( = ?auto_1343648 ?auto_1343654 ) ) ( not ( = ?auto_1343649 ?auto_1343654 ) ) ( not ( = ?auto_1343647 ?auto_1343654 ) ) ( TRUCK-AT ?auto_1343653 ?auto_1343651 ) ( SURFACE-AT ?auto_1343647 ?auto_1343651 ) ( CLEAR ?auto_1343647 ) ( LIFTING ?auto_1343652 ?auto_1343648 ) ( IS-CRATE ?auto_1343648 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343648 ?auto_1343649 )
      ( MAKE-2CRATE-VERIFY ?auto_1343647 ?auto_1343648 ?auto_1343649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343656 - SURFACE
      ?auto_1343657 - SURFACE
    )
    :vars
    (
      ?auto_1343663 - HOIST
      ?auto_1343660 - PLACE
      ?auto_1343659 - SURFACE
      ?auto_1343658 - PLACE
      ?auto_1343662 - HOIST
      ?auto_1343661 - SURFACE
      ?auto_1343664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343663 ?auto_1343660 ) ( IS-CRATE ?auto_1343657 ) ( not ( = ?auto_1343656 ?auto_1343657 ) ) ( not ( = ?auto_1343659 ?auto_1343656 ) ) ( not ( = ?auto_1343659 ?auto_1343657 ) ) ( not ( = ?auto_1343658 ?auto_1343660 ) ) ( HOIST-AT ?auto_1343662 ?auto_1343658 ) ( not ( = ?auto_1343663 ?auto_1343662 ) ) ( AVAILABLE ?auto_1343662 ) ( SURFACE-AT ?auto_1343657 ?auto_1343658 ) ( ON ?auto_1343657 ?auto_1343661 ) ( CLEAR ?auto_1343657 ) ( not ( = ?auto_1343656 ?auto_1343661 ) ) ( not ( = ?auto_1343657 ?auto_1343661 ) ) ( not ( = ?auto_1343659 ?auto_1343661 ) ) ( TRUCK-AT ?auto_1343664 ?auto_1343660 ) ( SURFACE-AT ?auto_1343659 ?auto_1343660 ) ( CLEAR ?auto_1343659 ) ( IS-CRATE ?auto_1343656 ) ( AVAILABLE ?auto_1343663 ) ( IN ?auto_1343656 ?auto_1343664 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1343663 ?auto_1343656 ?auto_1343664 ?auto_1343660 )
      ( MAKE-2CRATE ?auto_1343659 ?auto_1343656 ?auto_1343657 )
      ( MAKE-1CRATE-VERIFY ?auto_1343656 ?auto_1343657 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1343665 - SURFACE
      ?auto_1343666 - SURFACE
      ?auto_1343667 - SURFACE
    )
    :vars
    (
      ?auto_1343673 - HOIST
      ?auto_1343670 - PLACE
      ?auto_1343671 - PLACE
      ?auto_1343672 - HOIST
      ?auto_1343669 - SURFACE
      ?auto_1343668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343673 ?auto_1343670 ) ( IS-CRATE ?auto_1343667 ) ( not ( = ?auto_1343666 ?auto_1343667 ) ) ( not ( = ?auto_1343665 ?auto_1343666 ) ) ( not ( = ?auto_1343665 ?auto_1343667 ) ) ( not ( = ?auto_1343671 ?auto_1343670 ) ) ( HOIST-AT ?auto_1343672 ?auto_1343671 ) ( not ( = ?auto_1343673 ?auto_1343672 ) ) ( AVAILABLE ?auto_1343672 ) ( SURFACE-AT ?auto_1343667 ?auto_1343671 ) ( ON ?auto_1343667 ?auto_1343669 ) ( CLEAR ?auto_1343667 ) ( not ( = ?auto_1343666 ?auto_1343669 ) ) ( not ( = ?auto_1343667 ?auto_1343669 ) ) ( not ( = ?auto_1343665 ?auto_1343669 ) ) ( TRUCK-AT ?auto_1343668 ?auto_1343670 ) ( SURFACE-AT ?auto_1343665 ?auto_1343670 ) ( CLEAR ?auto_1343665 ) ( IS-CRATE ?auto_1343666 ) ( AVAILABLE ?auto_1343673 ) ( IN ?auto_1343666 ?auto_1343668 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343666 ?auto_1343667 )
      ( MAKE-2CRATE-VERIFY ?auto_1343665 ?auto_1343666 ?auto_1343667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1343710 - SURFACE
      ?auto_1343711 - SURFACE
    )
    :vars
    (
      ?auto_1343718 - HOIST
      ?auto_1343717 - PLACE
      ?auto_1343713 - SURFACE
      ?auto_1343716 - PLACE
      ?auto_1343715 - HOIST
      ?auto_1343714 - SURFACE
      ?auto_1343712 - TRUCK
      ?auto_1343719 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343718 ?auto_1343717 ) ( SURFACE-AT ?auto_1343710 ?auto_1343717 ) ( CLEAR ?auto_1343710 ) ( IS-CRATE ?auto_1343711 ) ( not ( = ?auto_1343710 ?auto_1343711 ) ) ( AVAILABLE ?auto_1343718 ) ( ON ?auto_1343710 ?auto_1343713 ) ( not ( = ?auto_1343713 ?auto_1343710 ) ) ( not ( = ?auto_1343713 ?auto_1343711 ) ) ( not ( = ?auto_1343716 ?auto_1343717 ) ) ( HOIST-AT ?auto_1343715 ?auto_1343716 ) ( not ( = ?auto_1343718 ?auto_1343715 ) ) ( AVAILABLE ?auto_1343715 ) ( SURFACE-AT ?auto_1343711 ?auto_1343716 ) ( ON ?auto_1343711 ?auto_1343714 ) ( CLEAR ?auto_1343711 ) ( not ( = ?auto_1343710 ?auto_1343714 ) ) ( not ( = ?auto_1343711 ?auto_1343714 ) ) ( not ( = ?auto_1343713 ?auto_1343714 ) ) ( TRUCK-AT ?auto_1343712 ?auto_1343719 ) ( not ( = ?auto_1343719 ?auto_1343717 ) ) ( not ( = ?auto_1343716 ?auto_1343719 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1343712 ?auto_1343719 ?auto_1343717 )
      ( MAKE-1CRATE ?auto_1343710 ?auto_1343711 )
      ( MAKE-1CRATE-VERIFY ?auto_1343710 ?auto_1343711 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343750 - SURFACE
      ?auto_1343751 - SURFACE
      ?auto_1343752 - SURFACE
      ?auto_1343749 - SURFACE
    )
    :vars
    (
      ?auto_1343754 - HOIST
      ?auto_1343753 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343754 ?auto_1343753 ) ( SURFACE-AT ?auto_1343752 ?auto_1343753 ) ( CLEAR ?auto_1343752 ) ( LIFTING ?auto_1343754 ?auto_1343749 ) ( IS-CRATE ?auto_1343749 ) ( not ( = ?auto_1343752 ?auto_1343749 ) ) ( ON ?auto_1343751 ?auto_1343750 ) ( ON ?auto_1343752 ?auto_1343751 ) ( not ( = ?auto_1343750 ?auto_1343751 ) ) ( not ( = ?auto_1343750 ?auto_1343752 ) ) ( not ( = ?auto_1343750 ?auto_1343749 ) ) ( not ( = ?auto_1343751 ?auto_1343752 ) ) ( not ( = ?auto_1343751 ?auto_1343749 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1343752 ?auto_1343749 )
      ( MAKE-3CRATE-VERIFY ?auto_1343750 ?auto_1343751 ?auto_1343752 ?auto_1343749 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343767 - SURFACE
      ?auto_1343768 - SURFACE
      ?auto_1343769 - SURFACE
      ?auto_1343766 - SURFACE
    )
    :vars
    (
      ?auto_1343770 - HOIST
      ?auto_1343771 - PLACE
      ?auto_1343772 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343770 ?auto_1343771 ) ( SURFACE-AT ?auto_1343769 ?auto_1343771 ) ( CLEAR ?auto_1343769 ) ( IS-CRATE ?auto_1343766 ) ( not ( = ?auto_1343769 ?auto_1343766 ) ) ( TRUCK-AT ?auto_1343772 ?auto_1343771 ) ( AVAILABLE ?auto_1343770 ) ( IN ?auto_1343766 ?auto_1343772 ) ( ON ?auto_1343769 ?auto_1343768 ) ( not ( = ?auto_1343768 ?auto_1343769 ) ) ( not ( = ?auto_1343768 ?auto_1343766 ) ) ( ON ?auto_1343768 ?auto_1343767 ) ( not ( = ?auto_1343767 ?auto_1343768 ) ) ( not ( = ?auto_1343767 ?auto_1343769 ) ) ( not ( = ?auto_1343767 ?auto_1343766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343768 ?auto_1343769 ?auto_1343766 )
      ( MAKE-3CRATE-VERIFY ?auto_1343767 ?auto_1343768 ?auto_1343769 ?auto_1343766 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343788 - SURFACE
      ?auto_1343789 - SURFACE
      ?auto_1343790 - SURFACE
      ?auto_1343787 - SURFACE
    )
    :vars
    (
      ?auto_1343794 - HOIST
      ?auto_1343792 - PLACE
      ?auto_1343793 - TRUCK
      ?auto_1343791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343794 ?auto_1343792 ) ( SURFACE-AT ?auto_1343790 ?auto_1343792 ) ( CLEAR ?auto_1343790 ) ( IS-CRATE ?auto_1343787 ) ( not ( = ?auto_1343790 ?auto_1343787 ) ) ( AVAILABLE ?auto_1343794 ) ( IN ?auto_1343787 ?auto_1343793 ) ( ON ?auto_1343790 ?auto_1343789 ) ( not ( = ?auto_1343789 ?auto_1343790 ) ) ( not ( = ?auto_1343789 ?auto_1343787 ) ) ( TRUCK-AT ?auto_1343793 ?auto_1343791 ) ( not ( = ?auto_1343791 ?auto_1343792 ) ) ( ON ?auto_1343789 ?auto_1343788 ) ( not ( = ?auto_1343788 ?auto_1343789 ) ) ( not ( = ?auto_1343788 ?auto_1343790 ) ) ( not ( = ?auto_1343788 ?auto_1343787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343789 ?auto_1343790 ?auto_1343787 )
      ( MAKE-3CRATE-VERIFY ?auto_1343788 ?auto_1343789 ?auto_1343790 ?auto_1343787 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343812 - SURFACE
      ?auto_1343813 - SURFACE
      ?auto_1343814 - SURFACE
      ?auto_1343811 - SURFACE
    )
    :vars
    (
      ?auto_1343815 - HOIST
      ?auto_1343817 - PLACE
      ?auto_1343818 - TRUCK
      ?auto_1343816 - PLACE
      ?auto_1343819 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343815 ?auto_1343817 ) ( SURFACE-AT ?auto_1343814 ?auto_1343817 ) ( CLEAR ?auto_1343814 ) ( IS-CRATE ?auto_1343811 ) ( not ( = ?auto_1343814 ?auto_1343811 ) ) ( AVAILABLE ?auto_1343815 ) ( ON ?auto_1343814 ?auto_1343813 ) ( not ( = ?auto_1343813 ?auto_1343814 ) ) ( not ( = ?auto_1343813 ?auto_1343811 ) ) ( TRUCK-AT ?auto_1343818 ?auto_1343816 ) ( not ( = ?auto_1343816 ?auto_1343817 ) ) ( HOIST-AT ?auto_1343819 ?auto_1343816 ) ( LIFTING ?auto_1343819 ?auto_1343811 ) ( not ( = ?auto_1343815 ?auto_1343819 ) ) ( ON ?auto_1343813 ?auto_1343812 ) ( not ( = ?auto_1343812 ?auto_1343813 ) ) ( not ( = ?auto_1343812 ?auto_1343814 ) ) ( not ( = ?auto_1343812 ?auto_1343811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343813 ?auto_1343814 ?auto_1343811 )
      ( MAKE-3CRATE-VERIFY ?auto_1343812 ?auto_1343813 ?auto_1343814 ?auto_1343811 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343839 - SURFACE
      ?auto_1343840 - SURFACE
      ?auto_1343841 - SURFACE
      ?auto_1343838 - SURFACE
    )
    :vars
    (
      ?auto_1343843 - HOIST
      ?auto_1343847 - PLACE
      ?auto_1343846 - TRUCK
      ?auto_1343845 - PLACE
      ?auto_1343844 - HOIST
      ?auto_1343842 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343843 ?auto_1343847 ) ( SURFACE-AT ?auto_1343841 ?auto_1343847 ) ( CLEAR ?auto_1343841 ) ( IS-CRATE ?auto_1343838 ) ( not ( = ?auto_1343841 ?auto_1343838 ) ) ( AVAILABLE ?auto_1343843 ) ( ON ?auto_1343841 ?auto_1343840 ) ( not ( = ?auto_1343840 ?auto_1343841 ) ) ( not ( = ?auto_1343840 ?auto_1343838 ) ) ( TRUCK-AT ?auto_1343846 ?auto_1343845 ) ( not ( = ?auto_1343845 ?auto_1343847 ) ) ( HOIST-AT ?auto_1343844 ?auto_1343845 ) ( not ( = ?auto_1343843 ?auto_1343844 ) ) ( AVAILABLE ?auto_1343844 ) ( SURFACE-AT ?auto_1343838 ?auto_1343845 ) ( ON ?auto_1343838 ?auto_1343842 ) ( CLEAR ?auto_1343838 ) ( not ( = ?auto_1343841 ?auto_1343842 ) ) ( not ( = ?auto_1343838 ?auto_1343842 ) ) ( not ( = ?auto_1343840 ?auto_1343842 ) ) ( ON ?auto_1343840 ?auto_1343839 ) ( not ( = ?auto_1343839 ?auto_1343840 ) ) ( not ( = ?auto_1343839 ?auto_1343841 ) ) ( not ( = ?auto_1343839 ?auto_1343838 ) ) ( not ( = ?auto_1343839 ?auto_1343842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343840 ?auto_1343841 ?auto_1343838 )
      ( MAKE-3CRATE-VERIFY ?auto_1343839 ?auto_1343840 ?auto_1343841 ?auto_1343838 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343867 - SURFACE
      ?auto_1343868 - SURFACE
      ?auto_1343869 - SURFACE
      ?auto_1343866 - SURFACE
    )
    :vars
    (
      ?auto_1343871 - HOIST
      ?auto_1343873 - PLACE
      ?auto_1343870 - PLACE
      ?auto_1343875 - HOIST
      ?auto_1343874 - SURFACE
      ?auto_1343872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343871 ?auto_1343873 ) ( SURFACE-AT ?auto_1343869 ?auto_1343873 ) ( CLEAR ?auto_1343869 ) ( IS-CRATE ?auto_1343866 ) ( not ( = ?auto_1343869 ?auto_1343866 ) ) ( AVAILABLE ?auto_1343871 ) ( ON ?auto_1343869 ?auto_1343868 ) ( not ( = ?auto_1343868 ?auto_1343869 ) ) ( not ( = ?auto_1343868 ?auto_1343866 ) ) ( not ( = ?auto_1343870 ?auto_1343873 ) ) ( HOIST-AT ?auto_1343875 ?auto_1343870 ) ( not ( = ?auto_1343871 ?auto_1343875 ) ) ( AVAILABLE ?auto_1343875 ) ( SURFACE-AT ?auto_1343866 ?auto_1343870 ) ( ON ?auto_1343866 ?auto_1343874 ) ( CLEAR ?auto_1343866 ) ( not ( = ?auto_1343869 ?auto_1343874 ) ) ( not ( = ?auto_1343866 ?auto_1343874 ) ) ( not ( = ?auto_1343868 ?auto_1343874 ) ) ( TRUCK-AT ?auto_1343872 ?auto_1343873 ) ( ON ?auto_1343868 ?auto_1343867 ) ( not ( = ?auto_1343867 ?auto_1343868 ) ) ( not ( = ?auto_1343867 ?auto_1343869 ) ) ( not ( = ?auto_1343867 ?auto_1343866 ) ) ( not ( = ?auto_1343867 ?auto_1343874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343868 ?auto_1343869 ?auto_1343866 )
      ( MAKE-3CRATE-VERIFY ?auto_1343867 ?auto_1343868 ?auto_1343869 ?auto_1343866 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343895 - SURFACE
      ?auto_1343896 - SURFACE
      ?auto_1343897 - SURFACE
      ?auto_1343894 - SURFACE
    )
    :vars
    (
      ?auto_1343900 - HOIST
      ?auto_1343902 - PLACE
      ?auto_1343903 - PLACE
      ?auto_1343899 - HOIST
      ?auto_1343898 - SURFACE
      ?auto_1343901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343900 ?auto_1343902 ) ( IS-CRATE ?auto_1343894 ) ( not ( = ?auto_1343897 ?auto_1343894 ) ) ( not ( = ?auto_1343896 ?auto_1343897 ) ) ( not ( = ?auto_1343896 ?auto_1343894 ) ) ( not ( = ?auto_1343903 ?auto_1343902 ) ) ( HOIST-AT ?auto_1343899 ?auto_1343903 ) ( not ( = ?auto_1343900 ?auto_1343899 ) ) ( AVAILABLE ?auto_1343899 ) ( SURFACE-AT ?auto_1343894 ?auto_1343903 ) ( ON ?auto_1343894 ?auto_1343898 ) ( CLEAR ?auto_1343894 ) ( not ( = ?auto_1343897 ?auto_1343898 ) ) ( not ( = ?auto_1343894 ?auto_1343898 ) ) ( not ( = ?auto_1343896 ?auto_1343898 ) ) ( TRUCK-AT ?auto_1343901 ?auto_1343902 ) ( SURFACE-AT ?auto_1343896 ?auto_1343902 ) ( CLEAR ?auto_1343896 ) ( LIFTING ?auto_1343900 ?auto_1343897 ) ( IS-CRATE ?auto_1343897 ) ( ON ?auto_1343896 ?auto_1343895 ) ( not ( = ?auto_1343895 ?auto_1343896 ) ) ( not ( = ?auto_1343895 ?auto_1343897 ) ) ( not ( = ?auto_1343895 ?auto_1343894 ) ) ( not ( = ?auto_1343895 ?auto_1343898 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343896 ?auto_1343897 ?auto_1343894 )
      ( MAKE-3CRATE-VERIFY ?auto_1343895 ?auto_1343896 ?auto_1343897 ?auto_1343894 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1343923 - SURFACE
      ?auto_1343924 - SURFACE
      ?auto_1343925 - SURFACE
      ?auto_1343922 - SURFACE
    )
    :vars
    (
      ?auto_1343927 - HOIST
      ?auto_1343928 - PLACE
      ?auto_1343931 - PLACE
      ?auto_1343929 - HOIST
      ?auto_1343926 - SURFACE
      ?auto_1343930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1343927 ?auto_1343928 ) ( IS-CRATE ?auto_1343922 ) ( not ( = ?auto_1343925 ?auto_1343922 ) ) ( not ( = ?auto_1343924 ?auto_1343925 ) ) ( not ( = ?auto_1343924 ?auto_1343922 ) ) ( not ( = ?auto_1343931 ?auto_1343928 ) ) ( HOIST-AT ?auto_1343929 ?auto_1343931 ) ( not ( = ?auto_1343927 ?auto_1343929 ) ) ( AVAILABLE ?auto_1343929 ) ( SURFACE-AT ?auto_1343922 ?auto_1343931 ) ( ON ?auto_1343922 ?auto_1343926 ) ( CLEAR ?auto_1343922 ) ( not ( = ?auto_1343925 ?auto_1343926 ) ) ( not ( = ?auto_1343922 ?auto_1343926 ) ) ( not ( = ?auto_1343924 ?auto_1343926 ) ) ( TRUCK-AT ?auto_1343930 ?auto_1343928 ) ( SURFACE-AT ?auto_1343924 ?auto_1343928 ) ( CLEAR ?auto_1343924 ) ( IS-CRATE ?auto_1343925 ) ( AVAILABLE ?auto_1343927 ) ( IN ?auto_1343925 ?auto_1343930 ) ( ON ?auto_1343924 ?auto_1343923 ) ( not ( = ?auto_1343923 ?auto_1343924 ) ) ( not ( = ?auto_1343923 ?auto_1343925 ) ) ( not ( = ?auto_1343923 ?auto_1343922 ) ) ( not ( = ?auto_1343923 ?auto_1343926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1343924 ?auto_1343925 ?auto_1343922 )
      ( MAKE-3CRATE-VERIFY ?auto_1343923 ?auto_1343924 ?auto_1343925 ?auto_1343922 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344214 - SURFACE
      ?auto_1344215 - SURFACE
      ?auto_1344216 - SURFACE
      ?auto_1344213 - SURFACE
      ?auto_1344217 - SURFACE
    )
    :vars
    (
      ?auto_1344218 - HOIST
      ?auto_1344219 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344218 ?auto_1344219 ) ( SURFACE-AT ?auto_1344213 ?auto_1344219 ) ( CLEAR ?auto_1344213 ) ( LIFTING ?auto_1344218 ?auto_1344217 ) ( IS-CRATE ?auto_1344217 ) ( not ( = ?auto_1344213 ?auto_1344217 ) ) ( ON ?auto_1344215 ?auto_1344214 ) ( ON ?auto_1344216 ?auto_1344215 ) ( ON ?auto_1344213 ?auto_1344216 ) ( not ( = ?auto_1344214 ?auto_1344215 ) ) ( not ( = ?auto_1344214 ?auto_1344216 ) ) ( not ( = ?auto_1344214 ?auto_1344213 ) ) ( not ( = ?auto_1344214 ?auto_1344217 ) ) ( not ( = ?auto_1344215 ?auto_1344216 ) ) ( not ( = ?auto_1344215 ?auto_1344213 ) ) ( not ( = ?auto_1344215 ?auto_1344217 ) ) ( not ( = ?auto_1344216 ?auto_1344213 ) ) ( not ( = ?auto_1344216 ?auto_1344217 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1344213 ?auto_1344217 )
      ( MAKE-4CRATE-VERIFY ?auto_1344214 ?auto_1344215 ?auto_1344216 ?auto_1344213 ?auto_1344217 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344239 - SURFACE
      ?auto_1344240 - SURFACE
      ?auto_1344241 - SURFACE
      ?auto_1344238 - SURFACE
      ?auto_1344242 - SURFACE
    )
    :vars
    (
      ?auto_1344244 - HOIST
      ?auto_1344245 - PLACE
      ?auto_1344243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344244 ?auto_1344245 ) ( SURFACE-AT ?auto_1344238 ?auto_1344245 ) ( CLEAR ?auto_1344238 ) ( IS-CRATE ?auto_1344242 ) ( not ( = ?auto_1344238 ?auto_1344242 ) ) ( TRUCK-AT ?auto_1344243 ?auto_1344245 ) ( AVAILABLE ?auto_1344244 ) ( IN ?auto_1344242 ?auto_1344243 ) ( ON ?auto_1344238 ?auto_1344241 ) ( not ( = ?auto_1344241 ?auto_1344238 ) ) ( not ( = ?auto_1344241 ?auto_1344242 ) ) ( ON ?auto_1344240 ?auto_1344239 ) ( ON ?auto_1344241 ?auto_1344240 ) ( not ( = ?auto_1344239 ?auto_1344240 ) ) ( not ( = ?auto_1344239 ?auto_1344241 ) ) ( not ( = ?auto_1344239 ?auto_1344238 ) ) ( not ( = ?auto_1344239 ?auto_1344242 ) ) ( not ( = ?auto_1344240 ?auto_1344241 ) ) ( not ( = ?auto_1344240 ?auto_1344238 ) ) ( not ( = ?auto_1344240 ?auto_1344242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344241 ?auto_1344238 ?auto_1344242 )
      ( MAKE-4CRATE-VERIFY ?auto_1344239 ?auto_1344240 ?auto_1344241 ?auto_1344238 ?auto_1344242 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344269 - SURFACE
      ?auto_1344270 - SURFACE
      ?auto_1344271 - SURFACE
      ?auto_1344268 - SURFACE
      ?auto_1344272 - SURFACE
    )
    :vars
    (
      ?auto_1344274 - HOIST
      ?auto_1344276 - PLACE
      ?auto_1344273 - TRUCK
      ?auto_1344275 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344274 ?auto_1344276 ) ( SURFACE-AT ?auto_1344268 ?auto_1344276 ) ( CLEAR ?auto_1344268 ) ( IS-CRATE ?auto_1344272 ) ( not ( = ?auto_1344268 ?auto_1344272 ) ) ( AVAILABLE ?auto_1344274 ) ( IN ?auto_1344272 ?auto_1344273 ) ( ON ?auto_1344268 ?auto_1344271 ) ( not ( = ?auto_1344271 ?auto_1344268 ) ) ( not ( = ?auto_1344271 ?auto_1344272 ) ) ( TRUCK-AT ?auto_1344273 ?auto_1344275 ) ( not ( = ?auto_1344275 ?auto_1344276 ) ) ( ON ?auto_1344270 ?auto_1344269 ) ( ON ?auto_1344271 ?auto_1344270 ) ( not ( = ?auto_1344269 ?auto_1344270 ) ) ( not ( = ?auto_1344269 ?auto_1344271 ) ) ( not ( = ?auto_1344269 ?auto_1344268 ) ) ( not ( = ?auto_1344269 ?auto_1344272 ) ) ( not ( = ?auto_1344270 ?auto_1344271 ) ) ( not ( = ?auto_1344270 ?auto_1344268 ) ) ( not ( = ?auto_1344270 ?auto_1344272 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344271 ?auto_1344268 ?auto_1344272 )
      ( MAKE-4CRATE-VERIFY ?auto_1344269 ?auto_1344270 ?auto_1344271 ?auto_1344268 ?auto_1344272 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344303 - SURFACE
      ?auto_1344304 - SURFACE
      ?auto_1344305 - SURFACE
      ?auto_1344302 - SURFACE
      ?auto_1344306 - SURFACE
    )
    :vars
    (
      ?auto_1344309 - HOIST
      ?auto_1344311 - PLACE
      ?auto_1344307 - TRUCK
      ?auto_1344308 - PLACE
      ?auto_1344310 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344309 ?auto_1344311 ) ( SURFACE-AT ?auto_1344302 ?auto_1344311 ) ( CLEAR ?auto_1344302 ) ( IS-CRATE ?auto_1344306 ) ( not ( = ?auto_1344302 ?auto_1344306 ) ) ( AVAILABLE ?auto_1344309 ) ( ON ?auto_1344302 ?auto_1344305 ) ( not ( = ?auto_1344305 ?auto_1344302 ) ) ( not ( = ?auto_1344305 ?auto_1344306 ) ) ( TRUCK-AT ?auto_1344307 ?auto_1344308 ) ( not ( = ?auto_1344308 ?auto_1344311 ) ) ( HOIST-AT ?auto_1344310 ?auto_1344308 ) ( LIFTING ?auto_1344310 ?auto_1344306 ) ( not ( = ?auto_1344309 ?auto_1344310 ) ) ( ON ?auto_1344304 ?auto_1344303 ) ( ON ?auto_1344305 ?auto_1344304 ) ( not ( = ?auto_1344303 ?auto_1344304 ) ) ( not ( = ?auto_1344303 ?auto_1344305 ) ) ( not ( = ?auto_1344303 ?auto_1344302 ) ) ( not ( = ?auto_1344303 ?auto_1344306 ) ) ( not ( = ?auto_1344304 ?auto_1344305 ) ) ( not ( = ?auto_1344304 ?auto_1344302 ) ) ( not ( = ?auto_1344304 ?auto_1344306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344305 ?auto_1344302 ?auto_1344306 )
      ( MAKE-4CRATE-VERIFY ?auto_1344303 ?auto_1344304 ?auto_1344305 ?auto_1344302 ?auto_1344306 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344341 - SURFACE
      ?auto_1344342 - SURFACE
      ?auto_1344343 - SURFACE
      ?auto_1344340 - SURFACE
      ?auto_1344344 - SURFACE
    )
    :vars
    (
      ?auto_1344345 - HOIST
      ?auto_1344348 - PLACE
      ?auto_1344346 - TRUCK
      ?auto_1344347 - PLACE
      ?auto_1344350 - HOIST
      ?auto_1344349 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344345 ?auto_1344348 ) ( SURFACE-AT ?auto_1344340 ?auto_1344348 ) ( CLEAR ?auto_1344340 ) ( IS-CRATE ?auto_1344344 ) ( not ( = ?auto_1344340 ?auto_1344344 ) ) ( AVAILABLE ?auto_1344345 ) ( ON ?auto_1344340 ?auto_1344343 ) ( not ( = ?auto_1344343 ?auto_1344340 ) ) ( not ( = ?auto_1344343 ?auto_1344344 ) ) ( TRUCK-AT ?auto_1344346 ?auto_1344347 ) ( not ( = ?auto_1344347 ?auto_1344348 ) ) ( HOIST-AT ?auto_1344350 ?auto_1344347 ) ( not ( = ?auto_1344345 ?auto_1344350 ) ) ( AVAILABLE ?auto_1344350 ) ( SURFACE-AT ?auto_1344344 ?auto_1344347 ) ( ON ?auto_1344344 ?auto_1344349 ) ( CLEAR ?auto_1344344 ) ( not ( = ?auto_1344340 ?auto_1344349 ) ) ( not ( = ?auto_1344344 ?auto_1344349 ) ) ( not ( = ?auto_1344343 ?auto_1344349 ) ) ( ON ?auto_1344342 ?auto_1344341 ) ( ON ?auto_1344343 ?auto_1344342 ) ( not ( = ?auto_1344341 ?auto_1344342 ) ) ( not ( = ?auto_1344341 ?auto_1344343 ) ) ( not ( = ?auto_1344341 ?auto_1344340 ) ) ( not ( = ?auto_1344341 ?auto_1344344 ) ) ( not ( = ?auto_1344341 ?auto_1344349 ) ) ( not ( = ?auto_1344342 ?auto_1344343 ) ) ( not ( = ?auto_1344342 ?auto_1344340 ) ) ( not ( = ?auto_1344342 ?auto_1344344 ) ) ( not ( = ?auto_1344342 ?auto_1344349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344343 ?auto_1344340 ?auto_1344344 )
      ( MAKE-4CRATE-VERIFY ?auto_1344341 ?auto_1344342 ?auto_1344343 ?auto_1344340 ?auto_1344344 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344380 - SURFACE
      ?auto_1344381 - SURFACE
      ?auto_1344382 - SURFACE
      ?auto_1344379 - SURFACE
      ?auto_1344383 - SURFACE
    )
    :vars
    (
      ?auto_1344387 - HOIST
      ?auto_1344386 - PLACE
      ?auto_1344388 - PLACE
      ?auto_1344389 - HOIST
      ?auto_1344385 - SURFACE
      ?auto_1344384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344387 ?auto_1344386 ) ( SURFACE-AT ?auto_1344379 ?auto_1344386 ) ( CLEAR ?auto_1344379 ) ( IS-CRATE ?auto_1344383 ) ( not ( = ?auto_1344379 ?auto_1344383 ) ) ( AVAILABLE ?auto_1344387 ) ( ON ?auto_1344379 ?auto_1344382 ) ( not ( = ?auto_1344382 ?auto_1344379 ) ) ( not ( = ?auto_1344382 ?auto_1344383 ) ) ( not ( = ?auto_1344388 ?auto_1344386 ) ) ( HOIST-AT ?auto_1344389 ?auto_1344388 ) ( not ( = ?auto_1344387 ?auto_1344389 ) ) ( AVAILABLE ?auto_1344389 ) ( SURFACE-AT ?auto_1344383 ?auto_1344388 ) ( ON ?auto_1344383 ?auto_1344385 ) ( CLEAR ?auto_1344383 ) ( not ( = ?auto_1344379 ?auto_1344385 ) ) ( not ( = ?auto_1344383 ?auto_1344385 ) ) ( not ( = ?auto_1344382 ?auto_1344385 ) ) ( TRUCK-AT ?auto_1344384 ?auto_1344386 ) ( ON ?auto_1344381 ?auto_1344380 ) ( ON ?auto_1344382 ?auto_1344381 ) ( not ( = ?auto_1344380 ?auto_1344381 ) ) ( not ( = ?auto_1344380 ?auto_1344382 ) ) ( not ( = ?auto_1344380 ?auto_1344379 ) ) ( not ( = ?auto_1344380 ?auto_1344383 ) ) ( not ( = ?auto_1344380 ?auto_1344385 ) ) ( not ( = ?auto_1344381 ?auto_1344382 ) ) ( not ( = ?auto_1344381 ?auto_1344379 ) ) ( not ( = ?auto_1344381 ?auto_1344383 ) ) ( not ( = ?auto_1344381 ?auto_1344385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344382 ?auto_1344379 ?auto_1344383 )
      ( MAKE-4CRATE-VERIFY ?auto_1344380 ?auto_1344381 ?auto_1344382 ?auto_1344379 ?auto_1344383 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344419 - SURFACE
      ?auto_1344420 - SURFACE
      ?auto_1344421 - SURFACE
      ?auto_1344418 - SURFACE
      ?auto_1344422 - SURFACE
    )
    :vars
    (
      ?auto_1344424 - HOIST
      ?auto_1344428 - PLACE
      ?auto_1344426 - PLACE
      ?auto_1344425 - HOIST
      ?auto_1344423 - SURFACE
      ?auto_1344427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344424 ?auto_1344428 ) ( IS-CRATE ?auto_1344422 ) ( not ( = ?auto_1344418 ?auto_1344422 ) ) ( not ( = ?auto_1344421 ?auto_1344418 ) ) ( not ( = ?auto_1344421 ?auto_1344422 ) ) ( not ( = ?auto_1344426 ?auto_1344428 ) ) ( HOIST-AT ?auto_1344425 ?auto_1344426 ) ( not ( = ?auto_1344424 ?auto_1344425 ) ) ( AVAILABLE ?auto_1344425 ) ( SURFACE-AT ?auto_1344422 ?auto_1344426 ) ( ON ?auto_1344422 ?auto_1344423 ) ( CLEAR ?auto_1344422 ) ( not ( = ?auto_1344418 ?auto_1344423 ) ) ( not ( = ?auto_1344422 ?auto_1344423 ) ) ( not ( = ?auto_1344421 ?auto_1344423 ) ) ( TRUCK-AT ?auto_1344427 ?auto_1344428 ) ( SURFACE-AT ?auto_1344421 ?auto_1344428 ) ( CLEAR ?auto_1344421 ) ( LIFTING ?auto_1344424 ?auto_1344418 ) ( IS-CRATE ?auto_1344418 ) ( ON ?auto_1344420 ?auto_1344419 ) ( ON ?auto_1344421 ?auto_1344420 ) ( not ( = ?auto_1344419 ?auto_1344420 ) ) ( not ( = ?auto_1344419 ?auto_1344421 ) ) ( not ( = ?auto_1344419 ?auto_1344418 ) ) ( not ( = ?auto_1344419 ?auto_1344422 ) ) ( not ( = ?auto_1344419 ?auto_1344423 ) ) ( not ( = ?auto_1344420 ?auto_1344421 ) ) ( not ( = ?auto_1344420 ?auto_1344418 ) ) ( not ( = ?auto_1344420 ?auto_1344422 ) ) ( not ( = ?auto_1344420 ?auto_1344423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344421 ?auto_1344418 ?auto_1344422 )
      ( MAKE-4CRATE-VERIFY ?auto_1344419 ?auto_1344420 ?auto_1344421 ?auto_1344418 ?auto_1344422 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1344458 - SURFACE
      ?auto_1344459 - SURFACE
      ?auto_1344460 - SURFACE
      ?auto_1344457 - SURFACE
      ?auto_1344461 - SURFACE
    )
    :vars
    (
      ?auto_1344466 - HOIST
      ?auto_1344465 - PLACE
      ?auto_1344467 - PLACE
      ?auto_1344462 - HOIST
      ?auto_1344463 - SURFACE
      ?auto_1344464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1344466 ?auto_1344465 ) ( IS-CRATE ?auto_1344461 ) ( not ( = ?auto_1344457 ?auto_1344461 ) ) ( not ( = ?auto_1344460 ?auto_1344457 ) ) ( not ( = ?auto_1344460 ?auto_1344461 ) ) ( not ( = ?auto_1344467 ?auto_1344465 ) ) ( HOIST-AT ?auto_1344462 ?auto_1344467 ) ( not ( = ?auto_1344466 ?auto_1344462 ) ) ( AVAILABLE ?auto_1344462 ) ( SURFACE-AT ?auto_1344461 ?auto_1344467 ) ( ON ?auto_1344461 ?auto_1344463 ) ( CLEAR ?auto_1344461 ) ( not ( = ?auto_1344457 ?auto_1344463 ) ) ( not ( = ?auto_1344461 ?auto_1344463 ) ) ( not ( = ?auto_1344460 ?auto_1344463 ) ) ( TRUCK-AT ?auto_1344464 ?auto_1344465 ) ( SURFACE-AT ?auto_1344460 ?auto_1344465 ) ( CLEAR ?auto_1344460 ) ( IS-CRATE ?auto_1344457 ) ( AVAILABLE ?auto_1344466 ) ( IN ?auto_1344457 ?auto_1344464 ) ( ON ?auto_1344459 ?auto_1344458 ) ( ON ?auto_1344460 ?auto_1344459 ) ( not ( = ?auto_1344458 ?auto_1344459 ) ) ( not ( = ?auto_1344458 ?auto_1344460 ) ) ( not ( = ?auto_1344458 ?auto_1344457 ) ) ( not ( = ?auto_1344458 ?auto_1344461 ) ) ( not ( = ?auto_1344458 ?auto_1344463 ) ) ( not ( = ?auto_1344459 ?auto_1344460 ) ) ( not ( = ?auto_1344459 ?auto_1344457 ) ) ( not ( = ?auto_1344459 ?auto_1344461 ) ) ( not ( = ?auto_1344459 ?auto_1344463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1344460 ?auto_1344457 ?auto_1344461 )
      ( MAKE-4CRATE-VERIFY ?auto_1344458 ?auto_1344459 ?auto_1344460 ?auto_1344457 ?auto_1344461 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345118 - SURFACE
      ?auto_1345119 - SURFACE
      ?auto_1345120 - SURFACE
      ?auto_1345117 - SURFACE
      ?auto_1345121 - SURFACE
      ?auto_1345122 - SURFACE
    )
    :vars
    (
      ?auto_1345123 - HOIST
      ?auto_1345124 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345123 ?auto_1345124 ) ( SURFACE-AT ?auto_1345121 ?auto_1345124 ) ( CLEAR ?auto_1345121 ) ( LIFTING ?auto_1345123 ?auto_1345122 ) ( IS-CRATE ?auto_1345122 ) ( not ( = ?auto_1345121 ?auto_1345122 ) ) ( ON ?auto_1345119 ?auto_1345118 ) ( ON ?auto_1345120 ?auto_1345119 ) ( ON ?auto_1345117 ?auto_1345120 ) ( ON ?auto_1345121 ?auto_1345117 ) ( not ( = ?auto_1345118 ?auto_1345119 ) ) ( not ( = ?auto_1345118 ?auto_1345120 ) ) ( not ( = ?auto_1345118 ?auto_1345117 ) ) ( not ( = ?auto_1345118 ?auto_1345121 ) ) ( not ( = ?auto_1345118 ?auto_1345122 ) ) ( not ( = ?auto_1345119 ?auto_1345120 ) ) ( not ( = ?auto_1345119 ?auto_1345117 ) ) ( not ( = ?auto_1345119 ?auto_1345121 ) ) ( not ( = ?auto_1345119 ?auto_1345122 ) ) ( not ( = ?auto_1345120 ?auto_1345117 ) ) ( not ( = ?auto_1345120 ?auto_1345121 ) ) ( not ( = ?auto_1345120 ?auto_1345122 ) ) ( not ( = ?auto_1345117 ?auto_1345121 ) ) ( not ( = ?auto_1345117 ?auto_1345122 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1345121 ?auto_1345122 )
      ( MAKE-5CRATE-VERIFY ?auto_1345118 ?auto_1345119 ?auto_1345120 ?auto_1345117 ?auto_1345121 ?auto_1345122 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345152 - SURFACE
      ?auto_1345153 - SURFACE
      ?auto_1345154 - SURFACE
      ?auto_1345151 - SURFACE
      ?auto_1345155 - SURFACE
      ?auto_1345156 - SURFACE
    )
    :vars
    (
      ?auto_1345159 - HOIST
      ?auto_1345157 - PLACE
      ?auto_1345158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345159 ?auto_1345157 ) ( SURFACE-AT ?auto_1345155 ?auto_1345157 ) ( CLEAR ?auto_1345155 ) ( IS-CRATE ?auto_1345156 ) ( not ( = ?auto_1345155 ?auto_1345156 ) ) ( TRUCK-AT ?auto_1345158 ?auto_1345157 ) ( AVAILABLE ?auto_1345159 ) ( IN ?auto_1345156 ?auto_1345158 ) ( ON ?auto_1345155 ?auto_1345151 ) ( not ( = ?auto_1345151 ?auto_1345155 ) ) ( not ( = ?auto_1345151 ?auto_1345156 ) ) ( ON ?auto_1345153 ?auto_1345152 ) ( ON ?auto_1345154 ?auto_1345153 ) ( ON ?auto_1345151 ?auto_1345154 ) ( not ( = ?auto_1345152 ?auto_1345153 ) ) ( not ( = ?auto_1345152 ?auto_1345154 ) ) ( not ( = ?auto_1345152 ?auto_1345151 ) ) ( not ( = ?auto_1345152 ?auto_1345155 ) ) ( not ( = ?auto_1345152 ?auto_1345156 ) ) ( not ( = ?auto_1345153 ?auto_1345154 ) ) ( not ( = ?auto_1345153 ?auto_1345151 ) ) ( not ( = ?auto_1345153 ?auto_1345155 ) ) ( not ( = ?auto_1345153 ?auto_1345156 ) ) ( not ( = ?auto_1345154 ?auto_1345151 ) ) ( not ( = ?auto_1345154 ?auto_1345155 ) ) ( not ( = ?auto_1345154 ?auto_1345156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345151 ?auto_1345155 ?auto_1345156 )
      ( MAKE-5CRATE-VERIFY ?auto_1345152 ?auto_1345153 ?auto_1345154 ?auto_1345151 ?auto_1345155 ?auto_1345156 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345192 - SURFACE
      ?auto_1345193 - SURFACE
      ?auto_1345194 - SURFACE
      ?auto_1345191 - SURFACE
      ?auto_1345195 - SURFACE
      ?auto_1345196 - SURFACE
    )
    :vars
    (
      ?auto_1345199 - HOIST
      ?auto_1345200 - PLACE
      ?auto_1345198 - TRUCK
      ?auto_1345197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345199 ?auto_1345200 ) ( SURFACE-AT ?auto_1345195 ?auto_1345200 ) ( CLEAR ?auto_1345195 ) ( IS-CRATE ?auto_1345196 ) ( not ( = ?auto_1345195 ?auto_1345196 ) ) ( AVAILABLE ?auto_1345199 ) ( IN ?auto_1345196 ?auto_1345198 ) ( ON ?auto_1345195 ?auto_1345191 ) ( not ( = ?auto_1345191 ?auto_1345195 ) ) ( not ( = ?auto_1345191 ?auto_1345196 ) ) ( TRUCK-AT ?auto_1345198 ?auto_1345197 ) ( not ( = ?auto_1345197 ?auto_1345200 ) ) ( ON ?auto_1345193 ?auto_1345192 ) ( ON ?auto_1345194 ?auto_1345193 ) ( ON ?auto_1345191 ?auto_1345194 ) ( not ( = ?auto_1345192 ?auto_1345193 ) ) ( not ( = ?auto_1345192 ?auto_1345194 ) ) ( not ( = ?auto_1345192 ?auto_1345191 ) ) ( not ( = ?auto_1345192 ?auto_1345195 ) ) ( not ( = ?auto_1345192 ?auto_1345196 ) ) ( not ( = ?auto_1345193 ?auto_1345194 ) ) ( not ( = ?auto_1345193 ?auto_1345191 ) ) ( not ( = ?auto_1345193 ?auto_1345195 ) ) ( not ( = ?auto_1345193 ?auto_1345196 ) ) ( not ( = ?auto_1345194 ?auto_1345191 ) ) ( not ( = ?auto_1345194 ?auto_1345195 ) ) ( not ( = ?auto_1345194 ?auto_1345196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345191 ?auto_1345195 ?auto_1345196 )
      ( MAKE-5CRATE-VERIFY ?auto_1345192 ?auto_1345193 ?auto_1345194 ?auto_1345191 ?auto_1345195 ?auto_1345196 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345237 - SURFACE
      ?auto_1345238 - SURFACE
      ?auto_1345239 - SURFACE
      ?auto_1345236 - SURFACE
      ?auto_1345240 - SURFACE
      ?auto_1345241 - SURFACE
    )
    :vars
    (
      ?auto_1345245 - HOIST
      ?auto_1345243 - PLACE
      ?auto_1345242 - TRUCK
      ?auto_1345246 - PLACE
      ?auto_1345244 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345245 ?auto_1345243 ) ( SURFACE-AT ?auto_1345240 ?auto_1345243 ) ( CLEAR ?auto_1345240 ) ( IS-CRATE ?auto_1345241 ) ( not ( = ?auto_1345240 ?auto_1345241 ) ) ( AVAILABLE ?auto_1345245 ) ( ON ?auto_1345240 ?auto_1345236 ) ( not ( = ?auto_1345236 ?auto_1345240 ) ) ( not ( = ?auto_1345236 ?auto_1345241 ) ) ( TRUCK-AT ?auto_1345242 ?auto_1345246 ) ( not ( = ?auto_1345246 ?auto_1345243 ) ) ( HOIST-AT ?auto_1345244 ?auto_1345246 ) ( LIFTING ?auto_1345244 ?auto_1345241 ) ( not ( = ?auto_1345245 ?auto_1345244 ) ) ( ON ?auto_1345238 ?auto_1345237 ) ( ON ?auto_1345239 ?auto_1345238 ) ( ON ?auto_1345236 ?auto_1345239 ) ( not ( = ?auto_1345237 ?auto_1345238 ) ) ( not ( = ?auto_1345237 ?auto_1345239 ) ) ( not ( = ?auto_1345237 ?auto_1345236 ) ) ( not ( = ?auto_1345237 ?auto_1345240 ) ) ( not ( = ?auto_1345237 ?auto_1345241 ) ) ( not ( = ?auto_1345238 ?auto_1345239 ) ) ( not ( = ?auto_1345238 ?auto_1345236 ) ) ( not ( = ?auto_1345238 ?auto_1345240 ) ) ( not ( = ?auto_1345238 ?auto_1345241 ) ) ( not ( = ?auto_1345239 ?auto_1345236 ) ) ( not ( = ?auto_1345239 ?auto_1345240 ) ) ( not ( = ?auto_1345239 ?auto_1345241 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345236 ?auto_1345240 ?auto_1345241 )
      ( MAKE-5CRATE-VERIFY ?auto_1345237 ?auto_1345238 ?auto_1345239 ?auto_1345236 ?auto_1345240 ?auto_1345241 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345287 - SURFACE
      ?auto_1345288 - SURFACE
      ?auto_1345289 - SURFACE
      ?auto_1345286 - SURFACE
      ?auto_1345290 - SURFACE
      ?auto_1345291 - SURFACE
    )
    :vars
    (
      ?auto_1345296 - HOIST
      ?auto_1345295 - PLACE
      ?auto_1345292 - TRUCK
      ?auto_1345293 - PLACE
      ?auto_1345294 - HOIST
      ?auto_1345297 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345296 ?auto_1345295 ) ( SURFACE-AT ?auto_1345290 ?auto_1345295 ) ( CLEAR ?auto_1345290 ) ( IS-CRATE ?auto_1345291 ) ( not ( = ?auto_1345290 ?auto_1345291 ) ) ( AVAILABLE ?auto_1345296 ) ( ON ?auto_1345290 ?auto_1345286 ) ( not ( = ?auto_1345286 ?auto_1345290 ) ) ( not ( = ?auto_1345286 ?auto_1345291 ) ) ( TRUCK-AT ?auto_1345292 ?auto_1345293 ) ( not ( = ?auto_1345293 ?auto_1345295 ) ) ( HOIST-AT ?auto_1345294 ?auto_1345293 ) ( not ( = ?auto_1345296 ?auto_1345294 ) ) ( AVAILABLE ?auto_1345294 ) ( SURFACE-AT ?auto_1345291 ?auto_1345293 ) ( ON ?auto_1345291 ?auto_1345297 ) ( CLEAR ?auto_1345291 ) ( not ( = ?auto_1345290 ?auto_1345297 ) ) ( not ( = ?auto_1345291 ?auto_1345297 ) ) ( not ( = ?auto_1345286 ?auto_1345297 ) ) ( ON ?auto_1345288 ?auto_1345287 ) ( ON ?auto_1345289 ?auto_1345288 ) ( ON ?auto_1345286 ?auto_1345289 ) ( not ( = ?auto_1345287 ?auto_1345288 ) ) ( not ( = ?auto_1345287 ?auto_1345289 ) ) ( not ( = ?auto_1345287 ?auto_1345286 ) ) ( not ( = ?auto_1345287 ?auto_1345290 ) ) ( not ( = ?auto_1345287 ?auto_1345291 ) ) ( not ( = ?auto_1345287 ?auto_1345297 ) ) ( not ( = ?auto_1345288 ?auto_1345289 ) ) ( not ( = ?auto_1345288 ?auto_1345286 ) ) ( not ( = ?auto_1345288 ?auto_1345290 ) ) ( not ( = ?auto_1345288 ?auto_1345291 ) ) ( not ( = ?auto_1345288 ?auto_1345297 ) ) ( not ( = ?auto_1345289 ?auto_1345286 ) ) ( not ( = ?auto_1345289 ?auto_1345290 ) ) ( not ( = ?auto_1345289 ?auto_1345291 ) ) ( not ( = ?auto_1345289 ?auto_1345297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345286 ?auto_1345290 ?auto_1345291 )
      ( MAKE-5CRATE-VERIFY ?auto_1345287 ?auto_1345288 ?auto_1345289 ?auto_1345286 ?auto_1345290 ?auto_1345291 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345338 - SURFACE
      ?auto_1345339 - SURFACE
      ?auto_1345340 - SURFACE
      ?auto_1345337 - SURFACE
      ?auto_1345341 - SURFACE
      ?auto_1345342 - SURFACE
    )
    :vars
    (
      ?auto_1345344 - HOIST
      ?auto_1345347 - PLACE
      ?auto_1345343 - PLACE
      ?auto_1345346 - HOIST
      ?auto_1345348 - SURFACE
      ?auto_1345345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345344 ?auto_1345347 ) ( SURFACE-AT ?auto_1345341 ?auto_1345347 ) ( CLEAR ?auto_1345341 ) ( IS-CRATE ?auto_1345342 ) ( not ( = ?auto_1345341 ?auto_1345342 ) ) ( AVAILABLE ?auto_1345344 ) ( ON ?auto_1345341 ?auto_1345337 ) ( not ( = ?auto_1345337 ?auto_1345341 ) ) ( not ( = ?auto_1345337 ?auto_1345342 ) ) ( not ( = ?auto_1345343 ?auto_1345347 ) ) ( HOIST-AT ?auto_1345346 ?auto_1345343 ) ( not ( = ?auto_1345344 ?auto_1345346 ) ) ( AVAILABLE ?auto_1345346 ) ( SURFACE-AT ?auto_1345342 ?auto_1345343 ) ( ON ?auto_1345342 ?auto_1345348 ) ( CLEAR ?auto_1345342 ) ( not ( = ?auto_1345341 ?auto_1345348 ) ) ( not ( = ?auto_1345342 ?auto_1345348 ) ) ( not ( = ?auto_1345337 ?auto_1345348 ) ) ( TRUCK-AT ?auto_1345345 ?auto_1345347 ) ( ON ?auto_1345339 ?auto_1345338 ) ( ON ?auto_1345340 ?auto_1345339 ) ( ON ?auto_1345337 ?auto_1345340 ) ( not ( = ?auto_1345338 ?auto_1345339 ) ) ( not ( = ?auto_1345338 ?auto_1345340 ) ) ( not ( = ?auto_1345338 ?auto_1345337 ) ) ( not ( = ?auto_1345338 ?auto_1345341 ) ) ( not ( = ?auto_1345338 ?auto_1345342 ) ) ( not ( = ?auto_1345338 ?auto_1345348 ) ) ( not ( = ?auto_1345339 ?auto_1345340 ) ) ( not ( = ?auto_1345339 ?auto_1345337 ) ) ( not ( = ?auto_1345339 ?auto_1345341 ) ) ( not ( = ?auto_1345339 ?auto_1345342 ) ) ( not ( = ?auto_1345339 ?auto_1345348 ) ) ( not ( = ?auto_1345340 ?auto_1345337 ) ) ( not ( = ?auto_1345340 ?auto_1345341 ) ) ( not ( = ?auto_1345340 ?auto_1345342 ) ) ( not ( = ?auto_1345340 ?auto_1345348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345337 ?auto_1345341 ?auto_1345342 )
      ( MAKE-5CRATE-VERIFY ?auto_1345338 ?auto_1345339 ?auto_1345340 ?auto_1345337 ?auto_1345341 ?auto_1345342 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345389 - SURFACE
      ?auto_1345390 - SURFACE
      ?auto_1345391 - SURFACE
      ?auto_1345388 - SURFACE
      ?auto_1345392 - SURFACE
      ?auto_1345393 - SURFACE
    )
    :vars
    (
      ?auto_1345396 - HOIST
      ?auto_1345394 - PLACE
      ?auto_1345399 - PLACE
      ?auto_1345395 - HOIST
      ?auto_1345398 - SURFACE
      ?auto_1345397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345396 ?auto_1345394 ) ( IS-CRATE ?auto_1345393 ) ( not ( = ?auto_1345392 ?auto_1345393 ) ) ( not ( = ?auto_1345388 ?auto_1345392 ) ) ( not ( = ?auto_1345388 ?auto_1345393 ) ) ( not ( = ?auto_1345399 ?auto_1345394 ) ) ( HOIST-AT ?auto_1345395 ?auto_1345399 ) ( not ( = ?auto_1345396 ?auto_1345395 ) ) ( AVAILABLE ?auto_1345395 ) ( SURFACE-AT ?auto_1345393 ?auto_1345399 ) ( ON ?auto_1345393 ?auto_1345398 ) ( CLEAR ?auto_1345393 ) ( not ( = ?auto_1345392 ?auto_1345398 ) ) ( not ( = ?auto_1345393 ?auto_1345398 ) ) ( not ( = ?auto_1345388 ?auto_1345398 ) ) ( TRUCK-AT ?auto_1345397 ?auto_1345394 ) ( SURFACE-AT ?auto_1345388 ?auto_1345394 ) ( CLEAR ?auto_1345388 ) ( LIFTING ?auto_1345396 ?auto_1345392 ) ( IS-CRATE ?auto_1345392 ) ( ON ?auto_1345390 ?auto_1345389 ) ( ON ?auto_1345391 ?auto_1345390 ) ( ON ?auto_1345388 ?auto_1345391 ) ( not ( = ?auto_1345389 ?auto_1345390 ) ) ( not ( = ?auto_1345389 ?auto_1345391 ) ) ( not ( = ?auto_1345389 ?auto_1345388 ) ) ( not ( = ?auto_1345389 ?auto_1345392 ) ) ( not ( = ?auto_1345389 ?auto_1345393 ) ) ( not ( = ?auto_1345389 ?auto_1345398 ) ) ( not ( = ?auto_1345390 ?auto_1345391 ) ) ( not ( = ?auto_1345390 ?auto_1345388 ) ) ( not ( = ?auto_1345390 ?auto_1345392 ) ) ( not ( = ?auto_1345390 ?auto_1345393 ) ) ( not ( = ?auto_1345390 ?auto_1345398 ) ) ( not ( = ?auto_1345391 ?auto_1345388 ) ) ( not ( = ?auto_1345391 ?auto_1345392 ) ) ( not ( = ?auto_1345391 ?auto_1345393 ) ) ( not ( = ?auto_1345391 ?auto_1345398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345388 ?auto_1345392 ?auto_1345393 )
      ( MAKE-5CRATE-VERIFY ?auto_1345389 ?auto_1345390 ?auto_1345391 ?auto_1345388 ?auto_1345392 ?auto_1345393 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1345440 - SURFACE
      ?auto_1345441 - SURFACE
      ?auto_1345442 - SURFACE
      ?auto_1345439 - SURFACE
      ?auto_1345443 - SURFACE
      ?auto_1345444 - SURFACE
    )
    :vars
    (
      ?auto_1345449 - HOIST
      ?auto_1345450 - PLACE
      ?auto_1345445 - PLACE
      ?auto_1345447 - HOIST
      ?auto_1345446 - SURFACE
      ?auto_1345448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1345449 ?auto_1345450 ) ( IS-CRATE ?auto_1345444 ) ( not ( = ?auto_1345443 ?auto_1345444 ) ) ( not ( = ?auto_1345439 ?auto_1345443 ) ) ( not ( = ?auto_1345439 ?auto_1345444 ) ) ( not ( = ?auto_1345445 ?auto_1345450 ) ) ( HOIST-AT ?auto_1345447 ?auto_1345445 ) ( not ( = ?auto_1345449 ?auto_1345447 ) ) ( AVAILABLE ?auto_1345447 ) ( SURFACE-AT ?auto_1345444 ?auto_1345445 ) ( ON ?auto_1345444 ?auto_1345446 ) ( CLEAR ?auto_1345444 ) ( not ( = ?auto_1345443 ?auto_1345446 ) ) ( not ( = ?auto_1345444 ?auto_1345446 ) ) ( not ( = ?auto_1345439 ?auto_1345446 ) ) ( TRUCK-AT ?auto_1345448 ?auto_1345450 ) ( SURFACE-AT ?auto_1345439 ?auto_1345450 ) ( CLEAR ?auto_1345439 ) ( IS-CRATE ?auto_1345443 ) ( AVAILABLE ?auto_1345449 ) ( IN ?auto_1345443 ?auto_1345448 ) ( ON ?auto_1345441 ?auto_1345440 ) ( ON ?auto_1345442 ?auto_1345441 ) ( ON ?auto_1345439 ?auto_1345442 ) ( not ( = ?auto_1345440 ?auto_1345441 ) ) ( not ( = ?auto_1345440 ?auto_1345442 ) ) ( not ( = ?auto_1345440 ?auto_1345439 ) ) ( not ( = ?auto_1345440 ?auto_1345443 ) ) ( not ( = ?auto_1345440 ?auto_1345444 ) ) ( not ( = ?auto_1345440 ?auto_1345446 ) ) ( not ( = ?auto_1345441 ?auto_1345442 ) ) ( not ( = ?auto_1345441 ?auto_1345439 ) ) ( not ( = ?auto_1345441 ?auto_1345443 ) ) ( not ( = ?auto_1345441 ?auto_1345444 ) ) ( not ( = ?auto_1345441 ?auto_1345446 ) ) ( not ( = ?auto_1345442 ?auto_1345439 ) ) ( not ( = ?auto_1345442 ?auto_1345443 ) ) ( not ( = ?auto_1345442 ?auto_1345444 ) ) ( not ( = ?auto_1345442 ?auto_1345446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1345439 ?auto_1345443 ?auto_1345444 )
      ( MAKE-5CRATE-VERIFY ?auto_1345440 ?auto_1345441 ?auto_1345442 ?auto_1345439 ?auto_1345443 ?auto_1345444 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346649 - SURFACE
      ?auto_1346650 - SURFACE
      ?auto_1346651 - SURFACE
      ?auto_1346648 - SURFACE
      ?auto_1346652 - SURFACE
      ?auto_1346654 - SURFACE
      ?auto_1346653 - SURFACE
    )
    :vars
    (
      ?auto_1346655 - HOIST
      ?auto_1346656 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346655 ?auto_1346656 ) ( SURFACE-AT ?auto_1346654 ?auto_1346656 ) ( CLEAR ?auto_1346654 ) ( LIFTING ?auto_1346655 ?auto_1346653 ) ( IS-CRATE ?auto_1346653 ) ( not ( = ?auto_1346654 ?auto_1346653 ) ) ( ON ?auto_1346650 ?auto_1346649 ) ( ON ?auto_1346651 ?auto_1346650 ) ( ON ?auto_1346648 ?auto_1346651 ) ( ON ?auto_1346652 ?auto_1346648 ) ( ON ?auto_1346654 ?auto_1346652 ) ( not ( = ?auto_1346649 ?auto_1346650 ) ) ( not ( = ?auto_1346649 ?auto_1346651 ) ) ( not ( = ?auto_1346649 ?auto_1346648 ) ) ( not ( = ?auto_1346649 ?auto_1346652 ) ) ( not ( = ?auto_1346649 ?auto_1346654 ) ) ( not ( = ?auto_1346649 ?auto_1346653 ) ) ( not ( = ?auto_1346650 ?auto_1346651 ) ) ( not ( = ?auto_1346650 ?auto_1346648 ) ) ( not ( = ?auto_1346650 ?auto_1346652 ) ) ( not ( = ?auto_1346650 ?auto_1346654 ) ) ( not ( = ?auto_1346650 ?auto_1346653 ) ) ( not ( = ?auto_1346651 ?auto_1346648 ) ) ( not ( = ?auto_1346651 ?auto_1346652 ) ) ( not ( = ?auto_1346651 ?auto_1346654 ) ) ( not ( = ?auto_1346651 ?auto_1346653 ) ) ( not ( = ?auto_1346648 ?auto_1346652 ) ) ( not ( = ?auto_1346648 ?auto_1346654 ) ) ( not ( = ?auto_1346648 ?auto_1346653 ) ) ( not ( = ?auto_1346652 ?auto_1346654 ) ) ( not ( = ?auto_1346652 ?auto_1346653 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1346654 ?auto_1346653 )
      ( MAKE-6CRATE-VERIFY ?auto_1346649 ?auto_1346650 ?auto_1346651 ?auto_1346648 ?auto_1346652 ?auto_1346654 ?auto_1346653 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346693 - SURFACE
      ?auto_1346694 - SURFACE
      ?auto_1346695 - SURFACE
      ?auto_1346692 - SURFACE
      ?auto_1346696 - SURFACE
      ?auto_1346698 - SURFACE
      ?auto_1346697 - SURFACE
    )
    :vars
    (
      ?auto_1346699 - HOIST
      ?auto_1346700 - PLACE
      ?auto_1346701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346699 ?auto_1346700 ) ( SURFACE-AT ?auto_1346698 ?auto_1346700 ) ( CLEAR ?auto_1346698 ) ( IS-CRATE ?auto_1346697 ) ( not ( = ?auto_1346698 ?auto_1346697 ) ) ( TRUCK-AT ?auto_1346701 ?auto_1346700 ) ( AVAILABLE ?auto_1346699 ) ( IN ?auto_1346697 ?auto_1346701 ) ( ON ?auto_1346698 ?auto_1346696 ) ( not ( = ?auto_1346696 ?auto_1346698 ) ) ( not ( = ?auto_1346696 ?auto_1346697 ) ) ( ON ?auto_1346694 ?auto_1346693 ) ( ON ?auto_1346695 ?auto_1346694 ) ( ON ?auto_1346692 ?auto_1346695 ) ( ON ?auto_1346696 ?auto_1346692 ) ( not ( = ?auto_1346693 ?auto_1346694 ) ) ( not ( = ?auto_1346693 ?auto_1346695 ) ) ( not ( = ?auto_1346693 ?auto_1346692 ) ) ( not ( = ?auto_1346693 ?auto_1346696 ) ) ( not ( = ?auto_1346693 ?auto_1346698 ) ) ( not ( = ?auto_1346693 ?auto_1346697 ) ) ( not ( = ?auto_1346694 ?auto_1346695 ) ) ( not ( = ?auto_1346694 ?auto_1346692 ) ) ( not ( = ?auto_1346694 ?auto_1346696 ) ) ( not ( = ?auto_1346694 ?auto_1346698 ) ) ( not ( = ?auto_1346694 ?auto_1346697 ) ) ( not ( = ?auto_1346695 ?auto_1346692 ) ) ( not ( = ?auto_1346695 ?auto_1346696 ) ) ( not ( = ?auto_1346695 ?auto_1346698 ) ) ( not ( = ?auto_1346695 ?auto_1346697 ) ) ( not ( = ?auto_1346692 ?auto_1346696 ) ) ( not ( = ?auto_1346692 ?auto_1346698 ) ) ( not ( = ?auto_1346692 ?auto_1346697 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346696 ?auto_1346698 ?auto_1346697 )
      ( MAKE-6CRATE-VERIFY ?auto_1346693 ?auto_1346694 ?auto_1346695 ?auto_1346692 ?auto_1346696 ?auto_1346698 ?auto_1346697 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346744 - SURFACE
      ?auto_1346745 - SURFACE
      ?auto_1346746 - SURFACE
      ?auto_1346743 - SURFACE
      ?auto_1346747 - SURFACE
      ?auto_1346749 - SURFACE
      ?auto_1346748 - SURFACE
    )
    :vars
    (
      ?auto_1346753 - HOIST
      ?auto_1346750 - PLACE
      ?auto_1346752 - TRUCK
      ?auto_1346751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346753 ?auto_1346750 ) ( SURFACE-AT ?auto_1346749 ?auto_1346750 ) ( CLEAR ?auto_1346749 ) ( IS-CRATE ?auto_1346748 ) ( not ( = ?auto_1346749 ?auto_1346748 ) ) ( AVAILABLE ?auto_1346753 ) ( IN ?auto_1346748 ?auto_1346752 ) ( ON ?auto_1346749 ?auto_1346747 ) ( not ( = ?auto_1346747 ?auto_1346749 ) ) ( not ( = ?auto_1346747 ?auto_1346748 ) ) ( TRUCK-AT ?auto_1346752 ?auto_1346751 ) ( not ( = ?auto_1346751 ?auto_1346750 ) ) ( ON ?auto_1346745 ?auto_1346744 ) ( ON ?auto_1346746 ?auto_1346745 ) ( ON ?auto_1346743 ?auto_1346746 ) ( ON ?auto_1346747 ?auto_1346743 ) ( not ( = ?auto_1346744 ?auto_1346745 ) ) ( not ( = ?auto_1346744 ?auto_1346746 ) ) ( not ( = ?auto_1346744 ?auto_1346743 ) ) ( not ( = ?auto_1346744 ?auto_1346747 ) ) ( not ( = ?auto_1346744 ?auto_1346749 ) ) ( not ( = ?auto_1346744 ?auto_1346748 ) ) ( not ( = ?auto_1346745 ?auto_1346746 ) ) ( not ( = ?auto_1346745 ?auto_1346743 ) ) ( not ( = ?auto_1346745 ?auto_1346747 ) ) ( not ( = ?auto_1346745 ?auto_1346749 ) ) ( not ( = ?auto_1346745 ?auto_1346748 ) ) ( not ( = ?auto_1346746 ?auto_1346743 ) ) ( not ( = ?auto_1346746 ?auto_1346747 ) ) ( not ( = ?auto_1346746 ?auto_1346749 ) ) ( not ( = ?auto_1346746 ?auto_1346748 ) ) ( not ( = ?auto_1346743 ?auto_1346747 ) ) ( not ( = ?auto_1346743 ?auto_1346749 ) ) ( not ( = ?auto_1346743 ?auto_1346748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346747 ?auto_1346749 ?auto_1346748 )
      ( MAKE-6CRATE-VERIFY ?auto_1346744 ?auto_1346745 ?auto_1346746 ?auto_1346743 ?auto_1346747 ?auto_1346749 ?auto_1346748 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346801 - SURFACE
      ?auto_1346802 - SURFACE
      ?auto_1346803 - SURFACE
      ?auto_1346800 - SURFACE
      ?auto_1346804 - SURFACE
      ?auto_1346806 - SURFACE
      ?auto_1346805 - SURFACE
    )
    :vars
    (
      ?auto_1346807 - HOIST
      ?auto_1346811 - PLACE
      ?auto_1346810 - TRUCK
      ?auto_1346808 - PLACE
      ?auto_1346809 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346807 ?auto_1346811 ) ( SURFACE-AT ?auto_1346806 ?auto_1346811 ) ( CLEAR ?auto_1346806 ) ( IS-CRATE ?auto_1346805 ) ( not ( = ?auto_1346806 ?auto_1346805 ) ) ( AVAILABLE ?auto_1346807 ) ( ON ?auto_1346806 ?auto_1346804 ) ( not ( = ?auto_1346804 ?auto_1346806 ) ) ( not ( = ?auto_1346804 ?auto_1346805 ) ) ( TRUCK-AT ?auto_1346810 ?auto_1346808 ) ( not ( = ?auto_1346808 ?auto_1346811 ) ) ( HOIST-AT ?auto_1346809 ?auto_1346808 ) ( LIFTING ?auto_1346809 ?auto_1346805 ) ( not ( = ?auto_1346807 ?auto_1346809 ) ) ( ON ?auto_1346802 ?auto_1346801 ) ( ON ?auto_1346803 ?auto_1346802 ) ( ON ?auto_1346800 ?auto_1346803 ) ( ON ?auto_1346804 ?auto_1346800 ) ( not ( = ?auto_1346801 ?auto_1346802 ) ) ( not ( = ?auto_1346801 ?auto_1346803 ) ) ( not ( = ?auto_1346801 ?auto_1346800 ) ) ( not ( = ?auto_1346801 ?auto_1346804 ) ) ( not ( = ?auto_1346801 ?auto_1346806 ) ) ( not ( = ?auto_1346801 ?auto_1346805 ) ) ( not ( = ?auto_1346802 ?auto_1346803 ) ) ( not ( = ?auto_1346802 ?auto_1346800 ) ) ( not ( = ?auto_1346802 ?auto_1346804 ) ) ( not ( = ?auto_1346802 ?auto_1346806 ) ) ( not ( = ?auto_1346802 ?auto_1346805 ) ) ( not ( = ?auto_1346803 ?auto_1346800 ) ) ( not ( = ?auto_1346803 ?auto_1346804 ) ) ( not ( = ?auto_1346803 ?auto_1346806 ) ) ( not ( = ?auto_1346803 ?auto_1346805 ) ) ( not ( = ?auto_1346800 ?auto_1346804 ) ) ( not ( = ?auto_1346800 ?auto_1346806 ) ) ( not ( = ?auto_1346800 ?auto_1346805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346804 ?auto_1346806 ?auto_1346805 )
      ( MAKE-6CRATE-VERIFY ?auto_1346801 ?auto_1346802 ?auto_1346803 ?auto_1346800 ?auto_1346804 ?auto_1346806 ?auto_1346805 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346864 - SURFACE
      ?auto_1346865 - SURFACE
      ?auto_1346866 - SURFACE
      ?auto_1346863 - SURFACE
      ?auto_1346867 - SURFACE
      ?auto_1346869 - SURFACE
      ?auto_1346868 - SURFACE
    )
    :vars
    (
      ?auto_1346872 - HOIST
      ?auto_1346871 - PLACE
      ?auto_1346874 - TRUCK
      ?auto_1346873 - PLACE
      ?auto_1346870 - HOIST
      ?auto_1346875 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346872 ?auto_1346871 ) ( SURFACE-AT ?auto_1346869 ?auto_1346871 ) ( CLEAR ?auto_1346869 ) ( IS-CRATE ?auto_1346868 ) ( not ( = ?auto_1346869 ?auto_1346868 ) ) ( AVAILABLE ?auto_1346872 ) ( ON ?auto_1346869 ?auto_1346867 ) ( not ( = ?auto_1346867 ?auto_1346869 ) ) ( not ( = ?auto_1346867 ?auto_1346868 ) ) ( TRUCK-AT ?auto_1346874 ?auto_1346873 ) ( not ( = ?auto_1346873 ?auto_1346871 ) ) ( HOIST-AT ?auto_1346870 ?auto_1346873 ) ( not ( = ?auto_1346872 ?auto_1346870 ) ) ( AVAILABLE ?auto_1346870 ) ( SURFACE-AT ?auto_1346868 ?auto_1346873 ) ( ON ?auto_1346868 ?auto_1346875 ) ( CLEAR ?auto_1346868 ) ( not ( = ?auto_1346869 ?auto_1346875 ) ) ( not ( = ?auto_1346868 ?auto_1346875 ) ) ( not ( = ?auto_1346867 ?auto_1346875 ) ) ( ON ?auto_1346865 ?auto_1346864 ) ( ON ?auto_1346866 ?auto_1346865 ) ( ON ?auto_1346863 ?auto_1346866 ) ( ON ?auto_1346867 ?auto_1346863 ) ( not ( = ?auto_1346864 ?auto_1346865 ) ) ( not ( = ?auto_1346864 ?auto_1346866 ) ) ( not ( = ?auto_1346864 ?auto_1346863 ) ) ( not ( = ?auto_1346864 ?auto_1346867 ) ) ( not ( = ?auto_1346864 ?auto_1346869 ) ) ( not ( = ?auto_1346864 ?auto_1346868 ) ) ( not ( = ?auto_1346864 ?auto_1346875 ) ) ( not ( = ?auto_1346865 ?auto_1346866 ) ) ( not ( = ?auto_1346865 ?auto_1346863 ) ) ( not ( = ?auto_1346865 ?auto_1346867 ) ) ( not ( = ?auto_1346865 ?auto_1346869 ) ) ( not ( = ?auto_1346865 ?auto_1346868 ) ) ( not ( = ?auto_1346865 ?auto_1346875 ) ) ( not ( = ?auto_1346866 ?auto_1346863 ) ) ( not ( = ?auto_1346866 ?auto_1346867 ) ) ( not ( = ?auto_1346866 ?auto_1346869 ) ) ( not ( = ?auto_1346866 ?auto_1346868 ) ) ( not ( = ?auto_1346866 ?auto_1346875 ) ) ( not ( = ?auto_1346863 ?auto_1346867 ) ) ( not ( = ?auto_1346863 ?auto_1346869 ) ) ( not ( = ?auto_1346863 ?auto_1346868 ) ) ( not ( = ?auto_1346863 ?auto_1346875 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346867 ?auto_1346869 ?auto_1346868 )
      ( MAKE-6CRATE-VERIFY ?auto_1346864 ?auto_1346865 ?auto_1346866 ?auto_1346863 ?auto_1346867 ?auto_1346869 ?auto_1346868 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346928 - SURFACE
      ?auto_1346929 - SURFACE
      ?auto_1346930 - SURFACE
      ?auto_1346927 - SURFACE
      ?auto_1346931 - SURFACE
      ?auto_1346933 - SURFACE
      ?auto_1346932 - SURFACE
    )
    :vars
    (
      ?auto_1346935 - HOIST
      ?auto_1346934 - PLACE
      ?auto_1346936 - PLACE
      ?auto_1346938 - HOIST
      ?auto_1346939 - SURFACE
      ?auto_1346937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346935 ?auto_1346934 ) ( SURFACE-AT ?auto_1346933 ?auto_1346934 ) ( CLEAR ?auto_1346933 ) ( IS-CRATE ?auto_1346932 ) ( not ( = ?auto_1346933 ?auto_1346932 ) ) ( AVAILABLE ?auto_1346935 ) ( ON ?auto_1346933 ?auto_1346931 ) ( not ( = ?auto_1346931 ?auto_1346933 ) ) ( not ( = ?auto_1346931 ?auto_1346932 ) ) ( not ( = ?auto_1346936 ?auto_1346934 ) ) ( HOIST-AT ?auto_1346938 ?auto_1346936 ) ( not ( = ?auto_1346935 ?auto_1346938 ) ) ( AVAILABLE ?auto_1346938 ) ( SURFACE-AT ?auto_1346932 ?auto_1346936 ) ( ON ?auto_1346932 ?auto_1346939 ) ( CLEAR ?auto_1346932 ) ( not ( = ?auto_1346933 ?auto_1346939 ) ) ( not ( = ?auto_1346932 ?auto_1346939 ) ) ( not ( = ?auto_1346931 ?auto_1346939 ) ) ( TRUCK-AT ?auto_1346937 ?auto_1346934 ) ( ON ?auto_1346929 ?auto_1346928 ) ( ON ?auto_1346930 ?auto_1346929 ) ( ON ?auto_1346927 ?auto_1346930 ) ( ON ?auto_1346931 ?auto_1346927 ) ( not ( = ?auto_1346928 ?auto_1346929 ) ) ( not ( = ?auto_1346928 ?auto_1346930 ) ) ( not ( = ?auto_1346928 ?auto_1346927 ) ) ( not ( = ?auto_1346928 ?auto_1346931 ) ) ( not ( = ?auto_1346928 ?auto_1346933 ) ) ( not ( = ?auto_1346928 ?auto_1346932 ) ) ( not ( = ?auto_1346928 ?auto_1346939 ) ) ( not ( = ?auto_1346929 ?auto_1346930 ) ) ( not ( = ?auto_1346929 ?auto_1346927 ) ) ( not ( = ?auto_1346929 ?auto_1346931 ) ) ( not ( = ?auto_1346929 ?auto_1346933 ) ) ( not ( = ?auto_1346929 ?auto_1346932 ) ) ( not ( = ?auto_1346929 ?auto_1346939 ) ) ( not ( = ?auto_1346930 ?auto_1346927 ) ) ( not ( = ?auto_1346930 ?auto_1346931 ) ) ( not ( = ?auto_1346930 ?auto_1346933 ) ) ( not ( = ?auto_1346930 ?auto_1346932 ) ) ( not ( = ?auto_1346930 ?auto_1346939 ) ) ( not ( = ?auto_1346927 ?auto_1346931 ) ) ( not ( = ?auto_1346927 ?auto_1346933 ) ) ( not ( = ?auto_1346927 ?auto_1346932 ) ) ( not ( = ?auto_1346927 ?auto_1346939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346931 ?auto_1346933 ?auto_1346932 )
      ( MAKE-6CRATE-VERIFY ?auto_1346928 ?auto_1346929 ?auto_1346930 ?auto_1346927 ?auto_1346931 ?auto_1346933 ?auto_1346932 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1346992 - SURFACE
      ?auto_1346993 - SURFACE
      ?auto_1346994 - SURFACE
      ?auto_1346991 - SURFACE
      ?auto_1346995 - SURFACE
      ?auto_1346997 - SURFACE
      ?auto_1346996 - SURFACE
    )
    :vars
    (
      ?auto_1347000 - HOIST
      ?auto_1346999 - PLACE
      ?auto_1347003 - PLACE
      ?auto_1347002 - HOIST
      ?auto_1347001 - SURFACE
      ?auto_1346998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347000 ?auto_1346999 ) ( IS-CRATE ?auto_1346996 ) ( not ( = ?auto_1346997 ?auto_1346996 ) ) ( not ( = ?auto_1346995 ?auto_1346997 ) ) ( not ( = ?auto_1346995 ?auto_1346996 ) ) ( not ( = ?auto_1347003 ?auto_1346999 ) ) ( HOIST-AT ?auto_1347002 ?auto_1347003 ) ( not ( = ?auto_1347000 ?auto_1347002 ) ) ( AVAILABLE ?auto_1347002 ) ( SURFACE-AT ?auto_1346996 ?auto_1347003 ) ( ON ?auto_1346996 ?auto_1347001 ) ( CLEAR ?auto_1346996 ) ( not ( = ?auto_1346997 ?auto_1347001 ) ) ( not ( = ?auto_1346996 ?auto_1347001 ) ) ( not ( = ?auto_1346995 ?auto_1347001 ) ) ( TRUCK-AT ?auto_1346998 ?auto_1346999 ) ( SURFACE-AT ?auto_1346995 ?auto_1346999 ) ( CLEAR ?auto_1346995 ) ( LIFTING ?auto_1347000 ?auto_1346997 ) ( IS-CRATE ?auto_1346997 ) ( ON ?auto_1346993 ?auto_1346992 ) ( ON ?auto_1346994 ?auto_1346993 ) ( ON ?auto_1346991 ?auto_1346994 ) ( ON ?auto_1346995 ?auto_1346991 ) ( not ( = ?auto_1346992 ?auto_1346993 ) ) ( not ( = ?auto_1346992 ?auto_1346994 ) ) ( not ( = ?auto_1346992 ?auto_1346991 ) ) ( not ( = ?auto_1346992 ?auto_1346995 ) ) ( not ( = ?auto_1346992 ?auto_1346997 ) ) ( not ( = ?auto_1346992 ?auto_1346996 ) ) ( not ( = ?auto_1346992 ?auto_1347001 ) ) ( not ( = ?auto_1346993 ?auto_1346994 ) ) ( not ( = ?auto_1346993 ?auto_1346991 ) ) ( not ( = ?auto_1346993 ?auto_1346995 ) ) ( not ( = ?auto_1346993 ?auto_1346997 ) ) ( not ( = ?auto_1346993 ?auto_1346996 ) ) ( not ( = ?auto_1346993 ?auto_1347001 ) ) ( not ( = ?auto_1346994 ?auto_1346991 ) ) ( not ( = ?auto_1346994 ?auto_1346995 ) ) ( not ( = ?auto_1346994 ?auto_1346997 ) ) ( not ( = ?auto_1346994 ?auto_1346996 ) ) ( not ( = ?auto_1346994 ?auto_1347001 ) ) ( not ( = ?auto_1346991 ?auto_1346995 ) ) ( not ( = ?auto_1346991 ?auto_1346997 ) ) ( not ( = ?auto_1346991 ?auto_1346996 ) ) ( not ( = ?auto_1346991 ?auto_1347001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1346995 ?auto_1346997 ?auto_1346996 )
      ( MAKE-6CRATE-VERIFY ?auto_1346992 ?auto_1346993 ?auto_1346994 ?auto_1346991 ?auto_1346995 ?auto_1346997 ?auto_1346996 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1347056 - SURFACE
      ?auto_1347057 - SURFACE
      ?auto_1347058 - SURFACE
      ?auto_1347055 - SURFACE
      ?auto_1347059 - SURFACE
      ?auto_1347061 - SURFACE
      ?auto_1347060 - SURFACE
    )
    :vars
    (
      ?auto_1347063 - HOIST
      ?auto_1347067 - PLACE
      ?auto_1347062 - PLACE
      ?auto_1347064 - HOIST
      ?auto_1347066 - SURFACE
      ?auto_1347065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347063 ?auto_1347067 ) ( IS-CRATE ?auto_1347060 ) ( not ( = ?auto_1347061 ?auto_1347060 ) ) ( not ( = ?auto_1347059 ?auto_1347061 ) ) ( not ( = ?auto_1347059 ?auto_1347060 ) ) ( not ( = ?auto_1347062 ?auto_1347067 ) ) ( HOIST-AT ?auto_1347064 ?auto_1347062 ) ( not ( = ?auto_1347063 ?auto_1347064 ) ) ( AVAILABLE ?auto_1347064 ) ( SURFACE-AT ?auto_1347060 ?auto_1347062 ) ( ON ?auto_1347060 ?auto_1347066 ) ( CLEAR ?auto_1347060 ) ( not ( = ?auto_1347061 ?auto_1347066 ) ) ( not ( = ?auto_1347060 ?auto_1347066 ) ) ( not ( = ?auto_1347059 ?auto_1347066 ) ) ( TRUCK-AT ?auto_1347065 ?auto_1347067 ) ( SURFACE-AT ?auto_1347059 ?auto_1347067 ) ( CLEAR ?auto_1347059 ) ( IS-CRATE ?auto_1347061 ) ( AVAILABLE ?auto_1347063 ) ( IN ?auto_1347061 ?auto_1347065 ) ( ON ?auto_1347057 ?auto_1347056 ) ( ON ?auto_1347058 ?auto_1347057 ) ( ON ?auto_1347055 ?auto_1347058 ) ( ON ?auto_1347059 ?auto_1347055 ) ( not ( = ?auto_1347056 ?auto_1347057 ) ) ( not ( = ?auto_1347056 ?auto_1347058 ) ) ( not ( = ?auto_1347056 ?auto_1347055 ) ) ( not ( = ?auto_1347056 ?auto_1347059 ) ) ( not ( = ?auto_1347056 ?auto_1347061 ) ) ( not ( = ?auto_1347056 ?auto_1347060 ) ) ( not ( = ?auto_1347056 ?auto_1347066 ) ) ( not ( = ?auto_1347057 ?auto_1347058 ) ) ( not ( = ?auto_1347057 ?auto_1347055 ) ) ( not ( = ?auto_1347057 ?auto_1347059 ) ) ( not ( = ?auto_1347057 ?auto_1347061 ) ) ( not ( = ?auto_1347057 ?auto_1347060 ) ) ( not ( = ?auto_1347057 ?auto_1347066 ) ) ( not ( = ?auto_1347058 ?auto_1347055 ) ) ( not ( = ?auto_1347058 ?auto_1347059 ) ) ( not ( = ?auto_1347058 ?auto_1347061 ) ) ( not ( = ?auto_1347058 ?auto_1347060 ) ) ( not ( = ?auto_1347058 ?auto_1347066 ) ) ( not ( = ?auto_1347055 ?auto_1347059 ) ) ( not ( = ?auto_1347055 ?auto_1347061 ) ) ( not ( = ?auto_1347055 ?auto_1347060 ) ) ( not ( = ?auto_1347055 ?auto_1347066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1347059 ?auto_1347061 ?auto_1347060 )
      ( MAKE-6CRATE-VERIFY ?auto_1347056 ?auto_1347057 ?auto_1347058 ?auto_1347055 ?auto_1347059 ?auto_1347061 ?auto_1347060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1347927 - SURFACE
      ?auto_1347928 - SURFACE
    )
    :vars
    (
      ?auto_1347930 - HOIST
      ?auto_1347932 - PLACE
      ?auto_1347934 - SURFACE
      ?auto_1347933 - TRUCK
      ?auto_1347929 - PLACE
      ?auto_1347935 - HOIST
      ?auto_1347931 - SURFACE
      ?auto_1347936 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347930 ?auto_1347932 ) ( SURFACE-AT ?auto_1347927 ?auto_1347932 ) ( CLEAR ?auto_1347927 ) ( IS-CRATE ?auto_1347928 ) ( not ( = ?auto_1347927 ?auto_1347928 ) ) ( AVAILABLE ?auto_1347930 ) ( ON ?auto_1347927 ?auto_1347934 ) ( not ( = ?auto_1347934 ?auto_1347927 ) ) ( not ( = ?auto_1347934 ?auto_1347928 ) ) ( TRUCK-AT ?auto_1347933 ?auto_1347929 ) ( not ( = ?auto_1347929 ?auto_1347932 ) ) ( HOIST-AT ?auto_1347935 ?auto_1347929 ) ( not ( = ?auto_1347930 ?auto_1347935 ) ) ( SURFACE-AT ?auto_1347928 ?auto_1347929 ) ( ON ?auto_1347928 ?auto_1347931 ) ( CLEAR ?auto_1347928 ) ( not ( = ?auto_1347927 ?auto_1347931 ) ) ( not ( = ?auto_1347928 ?auto_1347931 ) ) ( not ( = ?auto_1347934 ?auto_1347931 ) ) ( LIFTING ?auto_1347935 ?auto_1347936 ) ( IS-CRATE ?auto_1347936 ) ( not ( = ?auto_1347927 ?auto_1347936 ) ) ( not ( = ?auto_1347928 ?auto_1347936 ) ) ( not ( = ?auto_1347934 ?auto_1347936 ) ) ( not ( = ?auto_1347931 ?auto_1347936 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1347935 ?auto_1347936 ?auto_1347933 ?auto_1347929 )
      ( MAKE-1CRATE ?auto_1347927 ?auto_1347928 )
      ( MAKE-1CRATE-VERIFY ?auto_1347927 ?auto_1347928 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349006 - SURFACE
      ?auto_1349007 - SURFACE
      ?auto_1349008 - SURFACE
      ?auto_1349005 - SURFACE
      ?auto_1349009 - SURFACE
      ?auto_1349011 - SURFACE
      ?auto_1349010 - SURFACE
      ?auto_1349012 - SURFACE
    )
    :vars
    (
      ?auto_1349014 - HOIST
      ?auto_1349013 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349014 ?auto_1349013 ) ( SURFACE-AT ?auto_1349010 ?auto_1349013 ) ( CLEAR ?auto_1349010 ) ( LIFTING ?auto_1349014 ?auto_1349012 ) ( IS-CRATE ?auto_1349012 ) ( not ( = ?auto_1349010 ?auto_1349012 ) ) ( ON ?auto_1349007 ?auto_1349006 ) ( ON ?auto_1349008 ?auto_1349007 ) ( ON ?auto_1349005 ?auto_1349008 ) ( ON ?auto_1349009 ?auto_1349005 ) ( ON ?auto_1349011 ?auto_1349009 ) ( ON ?auto_1349010 ?auto_1349011 ) ( not ( = ?auto_1349006 ?auto_1349007 ) ) ( not ( = ?auto_1349006 ?auto_1349008 ) ) ( not ( = ?auto_1349006 ?auto_1349005 ) ) ( not ( = ?auto_1349006 ?auto_1349009 ) ) ( not ( = ?auto_1349006 ?auto_1349011 ) ) ( not ( = ?auto_1349006 ?auto_1349010 ) ) ( not ( = ?auto_1349006 ?auto_1349012 ) ) ( not ( = ?auto_1349007 ?auto_1349008 ) ) ( not ( = ?auto_1349007 ?auto_1349005 ) ) ( not ( = ?auto_1349007 ?auto_1349009 ) ) ( not ( = ?auto_1349007 ?auto_1349011 ) ) ( not ( = ?auto_1349007 ?auto_1349010 ) ) ( not ( = ?auto_1349007 ?auto_1349012 ) ) ( not ( = ?auto_1349008 ?auto_1349005 ) ) ( not ( = ?auto_1349008 ?auto_1349009 ) ) ( not ( = ?auto_1349008 ?auto_1349011 ) ) ( not ( = ?auto_1349008 ?auto_1349010 ) ) ( not ( = ?auto_1349008 ?auto_1349012 ) ) ( not ( = ?auto_1349005 ?auto_1349009 ) ) ( not ( = ?auto_1349005 ?auto_1349011 ) ) ( not ( = ?auto_1349005 ?auto_1349010 ) ) ( not ( = ?auto_1349005 ?auto_1349012 ) ) ( not ( = ?auto_1349009 ?auto_1349011 ) ) ( not ( = ?auto_1349009 ?auto_1349010 ) ) ( not ( = ?auto_1349009 ?auto_1349012 ) ) ( not ( = ?auto_1349011 ?auto_1349010 ) ) ( not ( = ?auto_1349011 ?auto_1349012 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1349010 ?auto_1349012 )
      ( MAKE-7CRATE-VERIFY ?auto_1349006 ?auto_1349007 ?auto_1349008 ?auto_1349005 ?auto_1349009 ?auto_1349011 ?auto_1349010 ?auto_1349012 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349061 - SURFACE
      ?auto_1349062 - SURFACE
      ?auto_1349063 - SURFACE
      ?auto_1349060 - SURFACE
      ?auto_1349064 - SURFACE
      ?auto_1349066 - SURFACE
      ?auto_1349065 - SURFACE
      ?auto_1349067 - SURFACE
    )
    :vars
    (
      ?auto_1349069 - HOIST
      ?auto_1349070 - PLACE
      ?auto_1349068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349069 ?auto_1349070 ) ( SURFACE-AT ?auto_1349065 ?auto_1349070 ) ( CLEAR ?auto_1349065 ) ( IS-CRATE ?auto_1349067 ) ( not ( = ?auto_1349065 ?auto_1349067 ) ) ( TRUCK-AT ?auto_1349068 ?auto_1349070 ) ( AVAILABLE ?auto_1349069 ) ( IN ?auto_1349067 ?auto_1349068 ) ( ON ?auto_1349065 ?auto_1349066 ) ( not ( = ?auto_1349066 ?auto_1349065 ) ) ( not ( = ?auto_1349066 ?auto_1349067 ) ) ( ON ?auto_1349062 ?auto_1349061 ) ( ON ?auto_1349063 ?auto_1349062 ) ( ON ?auto_1349060 ?auto_1349063 ) ( ON ?auto_1349064 ?auto_1349060 ) ( ON ?auto_1349066 ?auto_1349064 ) ( not ( = ?auto_1349061 ?auto_1349062 ) ) ( not ( = ?auto_1349061 ?auto_1349063 ) ) ( not ( = ?auto_1349061 ?auto_1349060 ) ) ( not ( = ?auto_1349061 ?auto_1349064 ) ) ( not ( = ?auto_1349061 ?auto_1349066 ) ) ( not ( = ?auto_1349061 ?auto_1349065 ) ) ( not ( = ?auto_1349061 ?auto_1349067 ) ) ( not ( = ?auto_1349062 ?auto_1349063 ) ) ( not ( = ?auto_1349062 ?auto_1349060 ) ) ( not ( = ?auto_1349062 ?auto_1349064 ) ) ( not ( = ?auto_1349062 ?auto_1349066 ) ) ( not ( = ?auto_1349062 ?auto_1349065 ) ) ( not ( = ?auto_1349062 ?auto_1349067 ) ) ( not ( = ?auto_1349063 ?auto_1349060 ) ) ( not ( = ?auto_1349063 ?auto_1349064 ) ) ( not ( = ?auto_1349063 ?auto_1349066 ) ) ( not ( = ?auto_1349063 ?auto_1349065 ) ) ( not ( = ?auto_1349063 ?auto_1349067 ) ) ( not ( = ?auto_1349060 ?auto_1349064 ) ) ( not ( = ?auto_1349060 ?auto_1349066 ) ) ( not ( = ?auto_1349060 ?auto_1349065 ) ) ( not ( = ?auto_1349060 ?auto_1349067 ) ) ( not ( = ?auto_1349064 ?auto_1349066 ) ) ( not ( = ?auto_1349064 ?auto_1349065 ) ) ( not ( = ?auto_1349064 ?auto_1349067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349066 ?auto_1349065 ?auto_1349067 )
      ( MAKE-7CRATE-VERIFY ?auto_1349061 ?auto_1349062 ?auto_1349063 ?auto_1349060 ?auto_1349064 ?auto_1349066 ?auto_1349065 ?auto_1349067 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349124 - SURFACE
      ?auto_1349125 - SURFACE
      ?auto_1349126 - SURFACE
      ?auto_1349123 - SURFACE
      ?auto_1349127 - SURFACE
      ?auto_1349129 - SURFACE
      ?auto_1349128 - SURFACE
      ?auto_1349130 - SURFACE
    )
    :vars
    (
      ?auto_1349133 - HOIST
      ?auto_1349131 - PLACE
      ?auto_1349134 - TRUCK
      ?auto_1349132 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349133 ?auto_1349131 ) ( SURFACE-AT ?auto_1349128 ?auto_1349131 ) ( CLEAR ?auto_1349128 ) ( IS-CRATE ?auto_1349130 ) ( not ( = ?auto_1349128 ?auto_1349130 ) ) ( AVAILABLE ?auto_1349133 ) ( IN ?auto_1349130 ?auto_1349134 ) ( ON ?auto_1349128 ?auto_1349129 ) ( not ( = ?auto_1349129 ?auto_1349128 ) ) ( not ( = ?auto_1349129 ?auto_1349130 ) ) ( TRUCK-AT ?auto_1349134 ?auto_1349132 ) ( not ( = ?auto_1349132 ?auto_1349131 ) ) ( ON ?auto_1349125 ?auto_1349124 ) ( ON ?auto_1349126 ?auto_1349125 ) ( ON ?auto_1349123 ?auto_1349126 ) ( ON ?auto_1349127 ?auto_1349123 ) ( ON ?auto_1349129 ?auto_1349127 ) ( not ( = ?auto_1349124 ?auto_1349125 ) ) ( not ( = ?auto_1349124 ?auto_1349126 ) ) ( not ( = ?auto_1349124 ?auto_1349123 ) ) ( not ( = ?auto_1349124 ?auto_1349127 ) ) ( not ( = ?auto_1349124 ?auto_1349129 ) ) ( not ( = ?auto_1349124 ?auto_1349128 ) ) ( not ( = ?auto_1349124 ?auto_1349130 ) ) ( not ( = ?auto_1349125 ?auto_1349126 ) ) ( not ( = ?auto_1349125 ?auto_1349123 ) ) ( not ( = ?auto_1349125 ?auto_1349127 ) ) ( not ( = ?auto_1349125 ?auto_1349129 ) ) ( not ( = ?auto_1349125 ?auto_1349128 ) ) ( not ( = ?auto_1349125 ?auto_1349130 ) ) ( not ( = ?auto_1349126 ?auto_1349123 ) ) ( not ( = ?auto_1349126 ?auto_1349127 ) ) ( not ( = ?auto_1349126 ?auto_1349129 ) ) ( not ( = ?auto_1349126 ?auto_1349128 ) ) ( not ( = ?auto_1349126 ?auto_1349130 ) ) ( not ( = ?auto_1349123 ?auto_1349127 ) ) ( not ( = ?auto_1349123 ?auto_1349129 ) ) ( not ( = ?auto_1349123 ?auto_1349128 ) ) ( not ( = ?auto_1349123 ?auto_1349130 ) ) ( not ( = ?auto_1349127 ?auto_1349129 ) ) ( not ( = ?auto_1349127 ?auto_1349128 ) ) ( not ( = ?auto_1349127 ?auto_1349130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349129 ?auto_1349128 ?auto_1349130 )
      ( MAKE-7CRATE-VERIFY ?auto_1349124 ?auto_1349125 ?auto_1349126 ?auto_1349123 ?auto_1349127 ?auto_1349129 ?auto_1349128 ?auto_1349130 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349194 - SURFACE
      ?auto_1349195 - SURFACE
      ?auto_1349196 - SURFACE
      ?auto_1349193 - SURFACE
      ?auto_1349197 - SURFACE
      ?auto_1349199 - SURFACE
      ?auto_1349198 - SURFACE
      ?auto_1349200 - SURFACE
    )
    :vars
    (
      ?auto_1349205 - HOIST
      ?auto_1349202 - PLACE
      ?auto_1349201 - TRUCK
      ?auto_1349204 - PLACE
      ?auto_1349203 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349205 ?auto_1349202 ) ( SURFACE-AT ?auto_1349198 ?auto_1349202 ) ( CLEAR ?auto_1349198 ) ( IS-CRATE ?auto_1349200 ) ( not ( = ?auto_1349198 ?auto_1349200 ) ) ( AVAILABLE ?auto_1349205 ) ( ON ?auto_1349198 ?auto_1349199 ) ( not ( = ?auto_1349199 ?auto_1349198 ) ) ( not ( = ?auto_1349199 ?auto_1349200 ) ) ( TRUCK-AT ?auto_1349201 ?auto_1349204 ) ( not ( = ?auto_1349204 ?auto_1349202 ) ) ( HOIST-AT ?auto_1349203 ?auto_1349204 ) ( LIFTING ?auto_1349203 ?auto_1349200 ) ( not ( = ?auto_1349205 ?auto_1349203 ) ) ( ON ?auto_1349195 ?auto_1349194 ) ( ON ?auto_1349196 ?auto_1349195 ) ( ON ?auto_1349193 ?auto_1349196 ) ( ON ?auto_1349197 ?auto_1349193 ) ( ON ?auto_1349199 ?auto_1349197 ) ( not ( = ?auto_1349194 ?auto_1349195 ) ) ( not ( = ?auto_1349194 ?auto_1349196 ) ) ( not ( = ?auto_1349194 ?auto_1349193 ) ) ( not ( = ?auto_1349194 ?auto_1349197 ) ) ( not ( = ?auto_1349194 ?auto_1349199 ) ) ( not ( = ?auto_1349194 ?auto_1349198 ) ) ( not ( = ?auto_1349194 ?auto_1349200 ) ) ( not ( = ?auto_1349195 ?auto_1349196 ) ) ( not ( = ?auto_1349195 ?auto_1349193 ) ) ( not ( = ?auto_1349195 ?auto_1349197 ) ) ( not ( = ?auto_1349195 ?auto_1349199 ) ) ( not ( = ?auto_1349195 ?auto_1349198 ) ) ( not ( = ?auto_1349195 ?auto_1349200 ) ) ( not ( = ?auto_1349196 ?auto_1349193 ) ) ( not ( = ?auto_1349196 ?auto_1349197 ) ) ( not ( = ?auto_1349196 ?auto_1349199 ) ) ( not ( = ?auto_1349196 ?auto_1349198 ) ) ( not ( = ?auto_1349196 ?auto_1349200 ) ) ( not ( = ?auto_1349193 ?auto_1349197 ) ) ( not ( = ?auto_1349193 ?auto_1349199 ) ) ( not ( = ?auto_1349193 ?auto_1349198 ) ) ( not ( = ?auto_1349193 ?auto_1349200 ) ) ( not ( = ?auto_1349197 ?auto_1349199 ) ) ( not ( = ?auto_1349197 ?auto_1349198 ) ) ( not ( = ?auto_1349197 ?auto_1349200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349199 ?auto_1349198 ?auto_1349200 )
      ( MAKE-7CRATE-VERIFY ?auto_1349194 ?auto_1349195 ?auto_1349196 ?auto_1349193 ?auto_1349197 ?auto_1349199 ?auto_1349198 ?auto_1349200 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349271 - SURFACE
      ?auto_1349272 - SURFACE
      ?auto_1349273 - SURFACE
      ?auto_1349270 - SURFACE
      ?auto_1349274 - SURFACE
      ?auto_1349276 - SURFACE
      ?auto_1349275 - SURFACE
      ?auto_1349277 - SURFACE
    )
    :vars
    (
      ?auto_1349280 - HOIST
      ?auto_1349279 - PLACE
      ?auto_1349278 - TRUCK
      ?auto_1349281 - PLACE
      ?auto_1349283 - HOIST
      ?auto_1349282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349280 ?auto_1349279 ) ( SURFACE-AT ?auto_1349275 ?auto_1349279 ) ( CLEAR ?auto_1349275 ) ( IS-CRATE ?auto_1349277 ) ( not ( = ?auto_1349275 ?auto_1349277 ) ) ( AVAILABLE ?auto_1349280 ) ( ON ?auto_1349275 ?auto_1349276 ) ( not ( = ?auto_1349276 ?auto_1349275 ) ) ( not ( = ?auto_1349276 ?auto_1349277 ) ) ( TRUCK-AT ?auto_1349278 ?auto_1349281 ) ( not ( = ?auto_1349281 ?auto_1349279 ) ) ( HOIST-AT ?auto_1349283 ?auto_1349281 ) ( not ( = ?auto_1349280 ?auto_1349283 ) ) ( AVAILABLE ?auto_1349283 ) ( SURFACE-AT ?auto_1349277 ?auto_1349281 ) ( ON ?auto_1349277 ?auto_1349282 ) ( CLEAR ?auto_1349277 ) ( not ( = ?auto_1349275 ?auto_1349282 ) ) ( not ( = ?auto_1349277 ?auto_1349282 ) ) ( not ( = ?auto_1349276 ?auto_1349282 ) ) ( ON ?auto_1349272 ?auto_1349271 ) ( ON ?auto_1349273 ?auto_1349272 ) ( ON ?auto_1349270 ?auto_1349273 ) ( ON ?auto_1349274 ?auto_1349270 ) ( ON ?auto_1349276 ?auto_1349274 ) ( not ( = ?auto_1349271 ?auto_1349272 ) ) ( not ( = ?auto_1349271 ?auto_1349273 ) ) ( not ( = ?auto_1349271 ?auto_1349270 ) ) ( not ( = ?auto_1349271 ?auto_1349274 ) ) ( not ( = ?auto_1349271 ?auto_1349276 ) ) ( not ( = ?auto_1349271 ?auto_1349275 ) ) ( not ( = ?auto_1349271 ?auto_1349277 ) ) ( not ( = ?auto_1349271 ?auto_1349282 ) ) ( not ( = ?auto_1349272 ?auto_1349273 ) ) ( not ( = ?auto_1349272 ?auto_1349270 ) ) ( not ( = ?auto_1349272 ?auto_1349274 ) ) ( not ( = ?auto_1349272 ?auto_1349276 ) ) ( not ( = ?auto_1349272 ?auto_1349275 ) ) ( not ( = ?auto_1349272 ?auto_1349277 ) ) ( not ( = ?auto_1349272 ?auto_1349282 ) ) ( not ( = ?auto_1349273 ?auto_1349270 ) ) ( not ( = ?auto_1349273 ?auto_1349274 ) ) ( not ( = ?auto_1349273 ?auto_1349276 ) ) ( not ( = ?auto_1349273 ?auto_1349275 ) ) ( not ( = ?auto_1349273 ?auto_1349277 ) ) ( not ( = ?auto_1349273 ?auto_1349282 ) ) ( not ( = ?auto_1349270 ?auto_1349274 ) ) ( not ( = ?auto_1349270 ?auto_1349276 ) ) ( not ( = ?auto_1349270 ?auto_1349275 ) ) ( not ( = ?auto_1349270 ?auto_1349277 ) ) ( not ( = ?auto_1349270 ?auto_1349282 ) ) ( not ( = ?auto_1349274 ?auto_1349276 ) ) ( not ( = ?auto_1349274 ?auto_1349275 ) ) ( not ( = ?auto_1349274 ?auto_1349277 ) ) ( not ( = ?auto_1349274 ?auto_1349282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349276 ?auto_1349275 ?auto_1349277 )
      ( MAKE-7CRATE-VERIFY ?auto_1349271 ?auto_1349272 ?auto_1349273 ?auto_1349270 ?auto_1349274 ?auto_1349276 ?auto_1349275 ?auto_1349277 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349349 - SURFACE
      ?auto_1349350 - SURFACE
      ?auto_1349351 - SURFACE
      ?auto_1349348 - SURFACE
      ?auto_1349352 - SURFACE
      ?auto_1349354 - SURFACE
      ?auto_1349353 - SURFACE
      ?auto_1349355 - SURFACE
    )
    :vars
    (
      ?auto_1349356 - HOIST
      ?auto_1349360 - PLACE
      ?auto_1349357 - PLACE
      ?auto_1349361 - HOIST
      ?auto_1349359 - SURFACE
      ?auto_1349358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349356 ?auto_1349360 ) ( SURFACE-AT ?auto_1349353 ?auto_1349360 ) ( CLEAR ?auto_1349353 ) ( IS-CRATE ?auto_1349355 ) ( not ( = ?auto_1349353 ?auto_1349355 ) ) ( AVAILABLE ?auto_1349356 ) ( ON ?auto_1349353 ?auto_1349354 ) ( not ( = ?auto_1349354 ?auto_1349353 ) ) ( not ( = ?auto_1349354 ?auto_1349355 ) ) ( not ( = ?auto_1349357 ?auto_1349360 ) ) ( HOIST-AT ?auto_1349361 ?auto_1349357 ) ( not ( = ?auto_1349356 ?auto_1349361 ) ) ( AVAILABLE ?auto_1349361 ) ( SURFACE-AT ?auto_1349355 ?auto_1349357 ) ( ON ?auto_1349355 ?auto_1349359 ) ( CLEAR ?auto_1349355 ) ( not ( = ?auto_1349353 ?auto_1349359 ) ) ( not ( = ?auto_1349355 ?auto_1349359 ) ) ( not ( = ?auto_1349354 ?auto_1349359 ) ) ( TRUCK-AT ?auto_1349358 ?auto_1349360 ) ( ON ?auto_1349350 ?auto_1349349 ) ( ON ?auto_1349351 ?auto_1349350 ) ( ON ?auto_1349348 ?auto_1349351 ) ( ON ?auto_1349352 ?auto_1349348 ) ( ON ?auto_1349354 ?auto_1349352 ) ( not ( = ?auto_1349349 ?auto_1349350 ) ) ( not ( = ?auto_1349349 ?auto_1349351 ) ) ( not ( = ?auto_1349349 ?auto_1349348 ) ) ( not ( = ?auto_1349349 ?auto_1349352 ) ) ( not ( = ?auto_1349349 ?auto_1349354 ) ) ( not ( = ?auto_1349349 ?auto_1349353 ) ) ( not ( = ?auto_1349349 ?auto_1349355 ) ) ( not ( = ?auto_1349349 ?auto_1349359 ) ) ( not ( = ?auto_1349350 ?auto_1349351 ) ) ( not ( = ?auto_1349350 ?auto_1349348 ) ) ( not ( = ?auto_1349350 ?auto_1349352 ) ) ( not ( = ?auto_1349350 ?auto_1349354 ) ) ( not ( = ?auto_1349350 ?auto_1349353 ) ) ( not ( = ?auto_1349350 ?auto_1349355 ) ) ( not ( = ?auto_1349350 ?auto_1349359 ) ) ( not ( = ?auto_1349351 ?auto_1349348 ) ) ( not ( = ?auto_1349351 ?auto_1349352 ) ) ( not ( = ?auto_1349351 ?auto_1349354 ) ) ( not ( = ?auto_1349351 ?auto_1349353 ) ) ( not ( = ?auto_1349351 ?auto_1349355 ) ) ( not ( = ?auto_1349351 ?auto_1349359 ) ) ( not ( = ?auto_1349348 ?auto_1349352 ) ) ( not ( = ?auto_1349348 ?auto_1349354 ) ) ( not ( = ?auto_1349348 ?auto_1349353 ) ) ( not ( = ?auto_1349348 ?auto_1349355 ) ) ( not ( = ?auto_1349348 ?auto_1349359 ) ) ( not ( = ?auto_1349352 ?auto_1349354 ) ) ( not ( = ?auto_1349352 ?auto_1349353 ) ) ( not ( = ?auto_1349352 ?auto_1349355 ) ) ( not ( = ?auto_1349352 ?auto_1349359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349354 ?auto_1349353 ?auto_1349355 )
      ( MAKE-7CRATE-VERIFY ?auto_1349349 ?auto_1349350 ?auto_1349351 ?auto_1349348 ?auto_1349352 ?auto_1349354 ?auto_1349353 ?auto_1349355 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349427 - SURFACE
      ?auto_1349428 - SURFACE
      ?auto_1349429 - SURFACE
      ?auto_1349426 - SURFACE
      ?auto_1349430 - SURFACE
      ?auto_1349432 - SURFACE
      ?auto_1349431 - SURFACE
      ?auto_1349433 - SURFACE
    )
    :vars
    (
      ?auto_1349436 - HOIST
      ?auto_1349435 - PLACE
      ?auto_1349437 - PLACE
      ?auto_1349439 - HOIST
      ?auto_1349438 - SURFACE
      ?auto_1349434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349436 ?auto_1349435 ) ( IS-CRATE ?auto_1349433 ) ( not ( = ?auto_1349431 ?auto_1349433 ) ) ( not ( = ?auto_1349432 ?auto_1349431 ) ) ( not ( = ?auto_1349432 ?auto_1349433 ) ) ( not ( = ?auto_1349437 ?auto_1349435 ) ) ( HOIST-AT ?auto_1349439 ?auto_1349437 ) ( not ( = ?auto_1349436 ?auto_1349439 ) ) ( AVAILABLE ?auto_1349439 ) ( SURFACE-AT ?auto_1349433 ?auto_1349437 ) ( ON ?auto_1349433 ?auto_1349438 ) ( CLEAR ?auto_1349433 ) ( not ( = ?auto_1349431 ?auto_1349438 ) ) ( not ( = ?auto_1349433 ?auto_1349438 ) ) ( not ( = ?auto_1349432 ?auto_1349438 ) ) ( TRUCK-AT ?auto_1349434 ?auto_1349435 ) ( SURFACE-AT ?auto_1349432 ?auto_1349435 ) ( CLEAR ?auto_1349432 ) ( LIFTING ?auto_1349436 ?auto_1349431 ) ( IS-CRATE ?auto_1349431 ) ( ON ?auto_1349428 ?auto_1349427 ) ( ON ?auto_1349429 ?auto_1349428 ) ( ON ?auto_1349426 ?auto_1349429 ) ( ON ?auto_1349430 ?auto_1349426 ) ( ON ?auto_1349432 ?auto_1349430 ) ( not ( = ?auto_1349427 ?auto_1349428 ) ) ( not ( = ?auto_1349427 ?auto_1349429 ) ) ( not ( = ?auto_1349427 ?auto_1349426 ) ) ( not ( = ?auto_1349427 ?auto_1349430 ) ) ( not ( = ?auto_1349427 ?auto_1349432 ) ) ( not ( = ?auto_1349427 ?auto_1349431 ) ) ( not ( = ?auto_1349427 ?auto_1349433 ) ) ( not ( = ?auto_1349427 ?auto_1349438 ) ) ( not ( = ?auto_1349428 ?auto_1349429 ) ) ( not ( = ?auto_1349428 ?auto_1349426 ) ) ( not ( = ?auto_1349428 ?auto_1349430 ) ) ( not ( = ?auto_1349428 ?auto_1349432 ) ) ( not ( = ?auto_1349428 ?auto_1349431 ) ) ( not ( = ?auto_1349428 ?auto_1349433 ) ) ( not ( = ?auto_1349428 ?auto_1349438 ) ) ( not ( = ?auto_1349429 ?auto_1349426 ) ) ( not ( = ?auto_1349429 ?auto_1349430 ) ) ( not ( = ?auto_1349429 ?auto_1349432 ) ) ( not ( = ?auto_1349429 ?auto_1349431 ) ) ( not ( = ?auto_1349429 ?auto_1349433 ) ) ( not ( = ?auto_1349429 ?auto_1349438 ) ) ( not ( = ?auto_1349426 ?auto_1349430 ) ) ( not ( = ?auto_1349426 ?auto_1349432 ) ) ( not ( = ?auto_1349426 ?auto_1349431 ) ) ( not ( = ?auto_1349426 ?auto_1349433 ) ) ( not ( = ?auto_1349426 ?auto_1349438 ) ) ( not ( = ?auto_1349430 ?auto_1349432 ) ) ( not ( = ?auto_1349430 ?auto_1349431 ) ) ( not ( = ?auto_1349430 ?auto_1349433 ) ) ( not ( = ?auto_1349430 ?auto_1349438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349432 ?auto_1349431 ?auto_1349433 )
      ( MAKE-7CRATE-VERIFY ?auto_1349427 ?auto_1349428 ?auto_1349429 ?auto_1349426 ?auto_1349430 ?auto_1349432 ?auto_1349431 ?auto_1349433 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1349505 - SURFACE
      ?auto_1349506 - SURFACE
      ?auto_1349507 - SURFACE
      ?auto_1349504 - SURFACE
      ?auto_1349508 - SURFACE
      ?auto_1349510 - SURFACE
      ?auto_1349509 - SURFACE
      ?auto_1349511 - SURFACE
    )
    :vars
    (
      ?auto_1349512 - HOIST
      ?auto_1349514 - PLACE
      ?auto_1349516 - PLACE
      ?auto_1349515 - HOIST
      ?auto_1349513 - SURFACE
      ?auto_1349517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1349512 ?auto_1349514 ) ( IS-CRATE ?auto_1349511 ) ( not ( = ?auto_1349509 ?auto_1349511 ) ) ( not ( = ?auto_1349510 ?auto_1349509 ) ) ( not ( = ?auto_1349510 ?auto_1349511 ) ) ( not ( = ?auto_1349516 ?auto_1349514 ) ) ( HOIST-AT ?auto_1349515 ?auto_1349516 ) ( not ( = ?auto_1349512 ?auto_1349515 ) ) ( AVAILABLE ?auto_1349515 ) ( SURFACE-AT ?auto_1349511 ?auto_1349516 ) ( ON ?auto_1349511 ?auto_1349513 ) ( CLEAR ?auto_1349511 ) ( not ( = ?auto_1349509 ?auto_1349513 ) ) ( not ( = ?auto_1349511 ?auto_1349513 ) ) ( not ( = ?auto_1349510 ?auto_1349513 ) ) ( TRUCK-AT ?auto_1349517 ?auto_1349514 ) ( SURFACE-AT ?auto_1349510 ?auto_1349514 ) ( CLEAR ?auto_1349510 ) ( IS-CRATE ?auto_1349509 ) ( AVAILABLE ?auto_1349512 ) ( IN ?auto_1349509 ?auto_1349517 ) ( ON ?auto_1349506 ?auto_1349505 ) ( ON ?auto_1349507 ?auto_1349506 ) ( ON ?auto_1349504 ?auto_1349507 ) ( ON ?auto_1349508 ?auto_1349504 ) ( ON ?auto_1349510 ?auto_1349508 ) ( not ( = ?auto_1349505 ?auto_1349506 ) ) ( not ( = ?auto_1349505 ?auto_1349507 ) ) ( not ( = ?auto_1349505 ?auto_1349504 ) ) ( not ( = ?auto_1349505 ?auto_1349508 ) ) ( not ( = ?auto_1349505 ?auto_1349510 ) ) ( not ( = ?auto_1349505 ?auto_1349509 ) ) ( not ( = ?auto_1349505 ?auto_1349511 ) ) ( not ( = ?auto_1349505 ?auto_1349513 ) ) ( not ( = ?auto_1349506 ?auto_1349507 ) ) ( not ( = ?auto_1349506 ?auto_1349504 ) ) ( not ( = ?auto_1349506 ?auto_1349508 ) ) ( not ( = ?auto_1349506 ?auto_1349510 ) ) ( not ( = ?auto_1349506 ?auto_1349509 ) ) ( not ( = ?auto_1349506 ?auto_1349511 ) ) ( not ( = ?auto_1349506 ?auto_1349513 ) ) ( not ( = ?auto_1349507 ?auto_1349504 ) ) ( not ( = ?auto_1349507 ?auto_1349508 ) ) ( not ( = ?auto_1349507 ?auto_1349510 ) ) ( not ( = ?auto_1349507 ?auto_1349509 ) ) ( not ( = ?auto_1349507 ?auto_1349511 ) ) ( not ( = ?auto_1349507 ?auto_1349513 ) ) ( not ( = ?auto_1349504 ?auto_1349508 ) ) ( not ( = ?auto_1349504 ?auto_1349510 ) ) ( not ( = ?auto_1349504 ?auto_1349509 ) ) ( not ( = ?auto_1349504 ?auto_1349511 ) ) ( not ( = ?auto_1349504 ?auto_1349513 ) ) ( not ( = ?auto_1349508 ?auto_1349510 ) ) ( not ( = ?auto_1349508 ?auto_1349509 ) ) ( not ( = ?auto_1349508 ?auto_1349511 ) ) ( not ( = ?auto_1349508 ?auto_1349513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1349510 ?auto_1349509 ?auto_1349511 )
      ( MAKE-7CRATE-VERIFY ?auto_1349505 ?auto_1349506 ?auto_1349507 ?auto_1349504 ?auto_1349508 ?auto_1349510 ?auto_1349509 ?auto_1349511 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1351079 - SURFACE
      ?auto_1351080 - SURFACE
    )
    :vars
    (
      ?auto_1351086 - HOIST
      ?auto_1351084 - PLACE
      ?auto_1351087 - SURFACE
      ?auto_1351081 - PLACE
      ?auto_1351083 - HOIST
      ?auto_1351085 - SURFACE
      ?auto_1351082 - TRUCK
      ?auto_1351088 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1351086 ?auto_1351084 ) ( SURFACE-AT ?auto_1351079 ?auto_1351084 ) ( CLEAR ?auto_1351079 ) ( IS-CRATE ?auto_1351080 ) ( not ( = ?auto_1351079 ?auto_1351080 ) ) ( ON ?auto_1351079 ?auto_1351087 ) ( not ( = ?auto_1351087 ?auto_1351079 ) ) ( not ( = ?auto_1351087 ?auto_1351080 ) ) ( not ( = ?auto_1351081 ?auto_1351084 ) ) ( HOIST-AT ?auto_1351083 ?auto_1351081 ) ( not ( = ?auto_1351086 ?auto_1351083 ) ) ( AVAILABLE ?auto_1351083 ) ( SURFACE-AT ?auto_1351080 ?auto_1351081 ) ( ON ?auto_1351080 ?auto_1351085 ) ( CLEAR ?auto_1351080 ) ( not ( = ?auto_1351079 ?auto_1351085 ) ) ( not ( = ?auto_1351080 ?auto_1351085 ) ) ( not ( = ?auto_1351087 ?auto_1351085 ) ) ( TRUCK-AT ?auto_1351082 ?auto_1351084 ) ( LIFTING ?auto_1351086 ?auto_1351088 ) ( IS-CRATE ?auto_1351088 ) ( not ( = ?auto_1351079 ?auto_1351088 ) ) ( not ( = ?auto_1351080 ?auto_1351088 ) ) ( not ( = ?auto_1351087 ?auto_1351088 ) ) ( not ( = ?auto_1351085 ?auto_1351088 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1351086 ?auto_1351088 ?auto_1351082 ?auto_1351084 )
      ( MAKE-1CRATE ?auto_1351079 ?auto_1351080 )
      ( MAKE-1CRATE-VERIFY ?auto_1351079 ?auto_1351080 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352416 - SURFACE
      ?auto_1352417 - SURFACE
      ?auto_1352418 - SURFACE
      ?auto_1352415 - SURFACE
      ?auto_1352419 - SURFACE
      ?auto_1352421 - SURFACE
      ?auto_1352420 - SURFACE
      ?auto_1352422 - SURFACE
      ?auto_1352423 - SURFACE
    )
    :vars
    (
      ?auto_1352424 - HOIST
      ?auto_1352425 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352424 ?auto_1352425 ) ( SURFACE-AT ?auto_1352422 ?auto_1352425 ) ( CLEAR ?auto_1352422 ) ( LIFTING ?auto_1352424 ?auto_1352423 ) ( IS-CRATE ?auto_1352423 ) ( not ( = ?auto_1352422 ?auto_1352423 ) ) ( ON ?auto_1352417 ?auto_1352416 ) ( ON ?auto_1352418 ?auto_1352417 ) ( ON ?auto_1352415 ?auto_1352418 ) ( ON ?auto_1352419 ?auto_1352415 ) ( ON ?auto_1352421 ?auto_1352419 ) ( ON ?auto_1352420 ?auto_1352421 ) ( ON ?auto_1352422 ?auto_1352420 ) ( not ( = ?auto_1352416 ?auto_1352417 ) ) ( not ( = ?auto_1352416 ?auto_1352418 ) ) ( not ( = ?auto_1352416 ?auto_1352415 ) ) ( not ( = ?auto_1352416 ?auto_1352419 ) ) ( not ( = ?auto_1352416 ?auto_1352421 ) ) ( not ( = ?auto_1352416 ?auto_1352420 ) ) ( not ( = ?auto_1352416 ?auto_1352422 ) ) ( not ( = ?auto_1352416 ?auto_1352423 ) ) ( not ( = ?auto_1352417 ?auto_1352418 ) ) ( not ( = ?auto_1352417 ?auto_1352415 ) ) ( not ( = ?auto_1352417 ?auto_1352419 ) ) ( not ( = ?auto_1352417 ?auto_1352421 ) ) ( not ( = ?auto_1352417 ?auto_1352420 ) ) ( not ( = ?auto_1352417 ?auto_1352422 ) ) ( not ( = ?auto_1352417 ?auto_1352423 ) ) ( not ( = ?auto_1352418 ?auto_1352415 ) ) ( not ( = ?auto_1352418 ?auto_1352419 ) ) ( not ( = ?auto_1352418 ?auto_1352421 ) ) ( not ( = ?auto_1352418 ?auto_1352420 ) ) ( not ( = ?auto_1352418 ?auto_1352422 ) ) ( not ( = ?auto_1352418 ?auto_1352423 ) ) ( not ( = ?auto_1352415 ?auto_1352419 ) ) ( not ( = ?auto_1352415 ?auto_1352421 ) ) ( not ( = ?auto_1352415 ?auto_1352420 ) ) ( not ( = ?auto_1352415 ?auto_1352422 ) ) ( not ( = ?auto_1352415 ?auto_1352423 ) ) ( not ( = ?auto_1352419 ?auto_1352421 ) ) ( not ( = ?auto_1352419 ?auto_1352420 ) ) ( not ( = ?auto_1352419 ?auto_1352422 ) ) ( not ( = ?auto_1352419 ?auto_1352423 ) ) ( not ( = ?auto_1352421 ?auto_1352420 ) ) ( not ( = ?auto_1352421 ?auto_1352422 ) ) ( not ( = ?auto_1352421 ?auto_1352423 ) ) ( not ( = ?auto_1352420 ?auto_1352422 ) ) ( not ( = ?auto_1352420 ?auto_1352423 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352422 ?auto_1352423 )
      ( MAKE-8CRATE-VERIFY ?auto_1352416 ?auto_1352417 ?auto_1352418 ?auto_1352415 ?auto_1352419 ?auto_1352421 ?auto_1352420 ?auto_1352422 ?auto_1352423 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352483 - SURFACE
      ?auto_1352484 - SURFACE
      ?auto_1352485 - SURFACE
      ?auto_1352482 - SURFACE
      ?auto_1352486 - SURFACE
      ?auto_1352488 - SURFACE
      ?auto_1352487 - SURFACE
      ?auto_1352489 - SURFACE
      ?auto_1352490 - SURFACE
    )
    :vars
    (
      ?auto_1352493 - HOIST
      ?auto_1352492 - PLACE
      ?auto_1352491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352493 ?auto_1352492 ) ( SURFACE-AT ?auto_1352489 ?auto_1352492 ) ( CLEAR ?auto_1352489 ) ( IS-CRATE ?auto_1352490 ) ( not ( = ?auto_1352489 ?auto_1352490 ) ) ( TRUCK-AT ?auto_1352491 ?auto_1352492 ) ( AVAILABLE ?auto_1352493 ) ( IN ?auto_1352490 ?auto_1352491 ) ( ON ?auto_1352489 ?auto_1352487 ) ( not ( = ?auto_1352487 ?auto_1352489 ) ) ( not ( = ?auto_1352487 ?auto_1352490 ) ) ( ON ?auto_1352484 ?auto_1352483 ) ( ON ?auto_1352485 ?auto_1352484 ) ( ON ?auto_1352482 ?auto_1352485 ) ( ON ?auto_1352486 ?auto_1352482 ) ( ON ?auto_1352488 ?auto_1352486 ) ( ON ?auto_1352487 ?auto_1352488 ) ( not ( = ?auto_1352483 ?auto_1352484 ) ) ( not ( = ?auto_1352483 ?auto_1352485 ) ) ( not ( = ?auto_1352483 ?auto_1352482 ) ) ( not ( = ?auto_1352483 ?auto_1352486 ) ) ( not ( = ?auto_1352483 ?auto_1352488 ) ) ( not ( = ?auto_1352483 ?auto_1352487 ) ) ( not ( = ?auto_1352483 ?auto_1352489 ) ) ( not ( = ?auto_1352483 ?auto_1352490 ) ) ( not ( = ?auto_1352484 ?auto_1352485 ) ) ( not ( = ?auto_1352484 ?auto_1352482 ) ) ( not ( = ?auto_1352484 ?auto_1352486 ) ) ( not ( = ?auto_1352484 ?auto_1352488 ) ) ( not ( = ?auto_1352484 ?auto_1352487 ) ) ( not ( = ?auto_1352484 ?auto_1352489 ) ) ( not ( = ?auto_1352484 ?auto_1352490 ) ) ( not ( = ?auto_1352485 ?auto_1352482 ) ) ( not ( = ?auto_1352485 ?auto_1352486 ) ) ( not ( = ?auto_1352485 ?auto_1352488 ) ) ( not ( = ?auto_1352485 ?auto_1352487 ) ) ( not ( = ?auto_1352485 ?auto_1352489 ) ) ( not ( = ?auto_1352485 ?auto_1352490 ) ) ( not ( = ?auto_1352482 ?auto_1352486 ) ) ( not ( = ?auto_1352482 ?auto_1352488 ) ) ( not ( = ?auto_1352482 ?auto_1352487 ) ) ( not ( = ?auto_1352482 ?auto_1352489 ) ) ( not ( = ?auto_1352482 ?auto_1352490 ) ) ( not ( = ?auto_1352486 ?auto_1352488 ) ) ( not ( = ?auto_1352486 ?auto_1352487 ) ) ( not ( = ?auto_1352486 ?auto_1352489 ) ) ( not ( = ?auto_1352486 ?auto_1352490 ) ) ( not ( = ?auto_1352488 ?auto_1352487 ) ) ( not ( = ?auto_1352488 ?auto_1352489 ) ) ( not ( = ?auto_1352488 ?auto_1352490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352487 ?auto_1352489 ?auto_1352490 )
      ( MAKE-8CRATE-VERIFY ?auto_1352483 ?auto_1352484 ?auto_1352485 ?auto_1352482 ?auto_1352486 ?auto_1352488 ?auto_1352487 ?auto_1352489 ?auto_1352490 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352559 - SURFACE
      ?auto_1352560 - SURFACE
      ?auto_1352561 - SURFACE
      ?auto_1352558 - SURFACE
      ?auto_1352562 - SURFACE
      ?auto_1352564 - SURFACE
      ?auto_1352563 - SURFACE
      ?auto_1352565 - SURFACE
      ?auto_1352566 - SURFACE
    )
    :vars
    (
      ?auto_1352569 - HOIST
      ?auto_1352568 - PLACE
      ?auto_1352570 - TRUCK
      ?auto_1352567 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352569 ?auto_1352568 ) ( SURFACE-AT ?auto_1352565 ?auto_1352568 ) ( CLEAR ?auto_1352565 ) ( IS-CRATE ?auto_1352566 ) ( not ( = ?auto_1352565 ?auto_1352566 ) ) ( AVAILABLE ?auto_1352569 ) ( IN ?auto_1352566 ?auto_1352570 ) ( ON ?auto_1352565 ?auto_1352563 ) ( not ( = ?auto_1352563 ?auto_1352565 ) ) ( not ( = ?auto_1352563 ?auto_1352566 ) ) ( TRUCK-AT ?auto_1352570 ?auto_1352567 ) ( not ( = ?auto_1352567 ?auto_1352568 ) ) ( ON ?auto_1352560 ?auto_1352559 ) ( ON ?auto_1352561 ?auto_1352560 ) ( ON ?auto_1352558 ?auto_1352561 ) ( ON ?auto_1352562 ?auto_1352558 ) ( ON ?auto_1352564 ?auto_1352562 ) ( ON ?auto_1352563 ?auto_1352564 ) ( not ( = ?auto_1352559 ?auto_1352560 ) ) ( not ( = ?auto_1352559 ?auto_1352561 ) ) ( not ( = ?auto_1352559 ?auto_1352558 ) ) ( not ( = ?auto_1352559 ?auto_1352562 ) ) ( not ( = ?auto_1352559 ?auto_1352564 ) ) ( not ( = ?auto_1352559 ?auto_1352563 ) ) ( not ( = ?auto_1352559 ?auto_1352565 ) ) ( not ( = ?auto_1352559 ?auto_1352566 ) ) ( not ( = ?auto_1352560 ?auto_1352561 ) ) ( not ( = ?auto_1352560 ?auto_1352558 ) ) ( not ( = ?auto_1352560 ?auto_1352562 ) ) ( not ( = ?auto_1352560 ?auto_1352564 ) ) ( not ( = ?auto_1352560 ?auto_1352563 ) ) ( not ( = ?auto_1352560 ?auto_1352565 ) ) ( not ( = ?auto_1352560 ?auto_1352566 ) ) ( not ( = ?auto_1352561 ?auto_1352558 ) ) ( not ( = ?auto_1352561 ?auto_1352562 ) ) ( not ( = ?auto_1352561 ?auto_1352564 ) ) ( not ( = ?auto_1352561 ?auto_1352563 ) ) ( not ( = ?auto_1352561 ?auto_1352565 ) ) ( not ( = ?auto_1352561 ?auto_1352566 ) ) ( not ( = ?auto_1352558 ?auto_1352562 ) ) ( not ( = ?auto_1352558 ?auto_1352564 ) ) ( not ( = ?auto_1352558 ?auto_1352563 ) ) ( not ( = ?auto_1352558 ?auto_1352565 ) ) ( not ( = ?auto_1352558 ?auto_1352566 ) ) ( not ( = ?auto_1352562 ?auto_1352564 ) ) ( not ( = ?auto_1352562 ?auto_1352563 ) ) ( not ( = ?auto_1352562 ?auto_1352565 ) ) ( not ( = ?auto_1352562 ?auto_1352566 ) ) ( not ( = ?auto_1352564 ?auto_1352563 ) ) ( not ( = ?auto_1352564 ?auto_1352565 ) ) ( not ( = ?auto_1352564 ?auto_1352566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352563 ?auto_1352565 ?auto_1352566 )
      ( MAKE-8CRATE-VERIFY ?auto_1352559 ?auto_1352560 ?auto_1352561 ?auto_1352558 ?auto_1352562 ?auto_1352564 ?auto_1352563 ?auto_1352565 ?auto_1352566 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352643 - SURFACE
      ?auto_1352644 - SURFACE
      ?auto_1352645 - SURFACE
      ?auto_1352642 - SURFACE
      ?auto_1352646 - SURFACE
      ?auto_1352648 - SURFACE
      ?auto_1352647 - SURFACE
      ?auto_1352649 - SURFACE
      ?auto_1352650 - SURFACE
    )
    :vars
    (
      ?auto_1352655 - HOIST
      ?auto_1352654 - PLACE
      ?auto_1352651 - TRUCK
      ?auto_1352653 - PLACE
      ?auto_1352652 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352655 ?auto_1352654 ) ( SURFACE-AT ?auto_1352649 ?auto_1352654 ) ( CLEAR ?auto_1352649 ) ( IS-CRATE ?auto_1352650 ) ( not ( = ?auto_1352649 ?auto_1352650 ) ) ( AVAILABLE ?auto_1352655 ) ( ON ?auto_1352649 ?auto_1352647 ) ( not ( = ?auto_1352647 ?auto_1352649 ) ) ( not ( = ?auto_1352647 ?auto_1352650 ) ) ( TRUCK-AT ?auto_1352651 ?auto_1352653 ) ( not ( = ?auto_1352653 ?auto_1352654 ) ) ( HOIST-AT ?auto_1352652 ?auto_1352653 ) ( LIFTING ?auto_1352652 ?auto_1352650 ) ( not ( = ?auto_1352655 ?auto_1352652 ) ) ( ON ?auto_1352644 ?auto_1352643 ) ( ON ?auto_1352645 ?auto_1352644 ) ( ON ?auto_1352642 ?auto_1352645 ) ( ON ?auto_1352646 ?auto_1352642 ) ( ON ?auto_1352648 ?auto_1352646 ) ( ON ?auto_1352647 ?auto_1352648 ) ( not ( = ?auto_1352643 ?auto_1352644 ) ) ( not ( = ?auto_1352643 ?auto_1352645 ) ) ( not ( = ?auto_1352643 ?auto_1352642 ) ) ( not ( = ?auto_1352643 ?auto_1352646 ) ) ( not ( = ?auto_1352643 ?auto_1352648 ) ) ( not ( = ?auto_1352643 ?auto_1352647 ) ) ( not ( = ?auto_1352643 ?auto_1352649 ) ) ( not ( = ?auto_1352643 ?auto_1352650 ) ) ( not ( = ?auto_1352644 ?auto_1352645 ) ) ( not ( = ?auto_1352644 ?auto_1352642 ) ) ( not ( = ?auto_1352644 ?auto_1352646 ) ) ( not ( = ?auto_1352644 ?auto_1352648 ) ) ( not ( = ?auto_1352644 ?auto_1352647 ) ) ( not ( = ?auto_1352644 ?auto_1352649 ) ) ( not ( = ?auto_1352644 ?auto_1352650 ) ) ( not ( = ?auto_1352645 ?auto_1352642 ) ) ( not ( = ?auto_1352645 ?auto_1352646 ) ) ( not ( = ?auto_1352645 ?auto_1352648 ) ) ( not ( = ?auto_1352645 ?auto_1352647 ) ) ( not ( = ?auto_1352645 ?auto_1352649 ) ) ( not ( = ?auto_1352645 ?auto_1352650 ) ) ( not ( = ?auto_1352642 ?auto_1352646 ) ) ( not ( = ?auto_1352642 ?auto_1352648 ) ) ( not ( = ?auto_1352642 ?auto_1352647 ) ) ( not ( = ?auto_1352642 ?auto_1352649 ) ) ( not ( = ?auto_1352642 ?auto_1352650 ) ) ( not ( = ?auto_1352646 ?auto_1352648 ) ) ( not ( = ?auto_1352646 ?auto_1352647 ) ) ( not ( = ?auto_1352646 ?auto_1352649 ) ) ( not ( = ?auto_1352646 ?auto_1352650 ) ) ( not ( = ?auto_1352648 ?auto_1352647 ) ) ( not ( = ?auto_1352648 ?auto_1352649 ) ) ( not ( = ?auto_1352648 ?auto_1352650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352647 ?auto_1352649 ?auto_1352650 )
      ( MAKE-8CRATE-VERIFY ?auto_1352643 ?auto_1352644 ?auto_1352645 ?auto_1352642 ?auto_1352646 ?auto_1352648 ?auto_1352647 ?auto_1352649 ?auto_1352650 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352735 - SURFACE
      ?auto_1352736 - SURFACE
      ?auto_1352737 - SURFACE
      ?auto_1352734 - SURFACE
      ?auto_1352738 - SURFACE
      ?auto_1352740 - SURFACE
      ?auto_1352739 - SURFACE
      ?auto_1352741 - SURFACE
      ?auto_1352742 - SURFACE
    )
    :vars
    (
      ?auto_1352745 - HOIST
      ?auto_1352748 - PLACE
      ?auto_1352743 - TRUCK
      ?auto_1352746 - PLACE
      ?auto_1352744 - HOIST
      ?auto_1352747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352745 ?auto_1352748 ) ( SURFACE-AT ?auto_1352741 ?auto_1352748 ) ( CLEAR ?auto_1352741 ) ( IS-CRATE ?auto_1352742 ) ( not ( = ?auto_1352741 ?auto_1352742 ) ) ( AVAILABLE ?auto_1352745 ) ( ON ?auto_1352741 ?auto_1352739 ) ( not ( = ?auto_1352739 ?auto_1352741 ) ) ( not ( = ?auto_1352739 ?auto_1352742 ) ) ( TRUCK-AT ?auto_1352743 ?auto_1352746 ) ( not ( = ?auto_1352746 ?auto_1352748 ) ) ( HOIST-AT ?auto_1352744 ?auto_1352746 ) ( not ( = ?auto_1352745 ?auto_1352744 ) ) ( AVAILABLE ?auto_1352744 ) ( SURFACE-AT ?auto_1352742 ?auto_1352746 ) ( ON ?auto_1352742 ?auto_1352747 ) ( CLEAR ?auto_1352742 ) ( not ( = ?auto_1352741 ?auto_1352747 ) ) ( not ( = ?auto_1352742 ?auto_1352747 ) ) ( not ( = ?auto_1352739 ?auto_1352747 ) ) ( ON ?auto_1352736 ?auto_1352735 ) ( ON ?auto_1352737 ?auto_1352736 ) ( ON ?auto_1352734 ?auto_1352737 ) ( ON ?auto_1352738 ?auto_1352734 ) ( ON ?auto_1352740 ?auto_1352738 ) ( ON ?auto_1352739 ?auto_1352740 ) ( not ( = ?auto_1352735 ?auto_1352736 ) ) ( not ( = ?auto_1352735 ?auto_1352737 ) ) ( not ( = ?auto_1352735 ?auto_1352734 ) ) ( not ( = ?auto_1352735 ?auto_1352738 ) ) ( not ( = ?auto_1352735 ?auto_1352740 ) ) ( not ( = ?auto_1352735 ?auto_1352739 ) ) ( not ( = ?auto_1352735 ?auto_1352741 ) ) ( not ( = ?auto_1352735 ?auto_1352742 ) ) ( not ( = ?auto_1352735 ?auto_1352747 ) ) ( not ( = ?auto_1352736 ?auto_1352737 ) ) ( not ( = ?auto_1352736 ?auto_1352734 ) ) ( not ( = ?auto_1352736 ?auto_1352738 ) ) ( not ( = ?auto_1352736 ?auto_1352740 ) ) ( not ( = ?auto_1352736 ?auto_1352739 ) ) ( not ( = ?auto_1352736 ?auto_1352741 ) ) ( not ( = ?auto_1352736 ?auto_1352742 ) ) ( not ( = ?auto_1352736 ?auto_1352747 ) ) ( not ( = ?auto_1352737 ?auto_1352734 ) ) ( not ( = ?auto_1352737 ?auto_1352738 ) ) ( not ( = ?auto_1352737 ?auto_1352740 ) ) ( not ( = ?auto_1352737 ?auto_1352739 ) ) ( not ( = ?auto_1352737 ?auto_1352741 ) ) ( not ( = ?auto_1352737 ?auto_1352742 ) ) ( not ( = ?auto_1352737 ?auto_1352747 ) ) ( not ( = ?auto_1352734 ?auto_1352738 ) ) ( not ( = ?auto_1352734 ?auto_1352740 ) ) ( not ( = ?auto_1352734 ?auto_1352739 ) ) ( not ( = ?auto_1352734 ?auto_1352741 ) ) ( not ( = ?auto_1352734 ?auto_1352742 ) ) ( not ( = ?auto_1352734 ?auto_1352747 ) ) ( not ( = ?auto_1352738 ?auto_1352740 ) ) ( not ( = ?auto_1352738 ?auto_1352739 ) ) ( not ( = ?auto_1352738 ?auto_1352741 ) ) ( not ( = ?auto_1352738 ?auto_1352742 ) ) ( not ( = ?auto_1352738 ?auto_1352747 ) ) ( not ( = ?auto_1352740 ?auto_1352739 ) ) ( not ( = ?auto_1352740 ?auto_1352741 ) ) ( not ( = ?auto_1352740 ?auto_1352742 ) ) ( not ( = ?auto_1352740 ?auto_1352747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352739 ?auto_1352741 ?auto_1352742 )
      ( MAKE-8CRATE-VERIFY ?auto_1352735 ?auto_1352736 ?auto_1352737 ?auto_1352734 ?auto_1352738 ?auto_1352740 ?auto_1352739 ?auto_1352741 ?auto_1352742 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352828 - SURFACE
      ?auto_1352829 - SURFACE
      ?auto_1352830 - SURFACE
      ?auto_1352827 - SURFACE
      ?auto_1352831 - SURFACE
      ?auto_1352833 - SURFACE
      ?auto_1352832 - SURFACE
      ?auto_1352834 - SURFACE
      ?auto_1352835 - SURFACE
    )
    :vars
    (
      ?auto_1352836 - HOIST
      ?auto_1352837 - PLACE
      ?auto_1352839 - PLACE
      ?auto_1352841 - HOIST
      ?auto_1352840 - SURFACE
      ?auto_1352838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352836 ?auto_1352837 ) ( SURFACE-AT ?auto_1352834 ?auto_1352837 ) ( CLEAR ?auto_1352834 ) ( IS-CRATE ?auto_1352835 ) ( not ( = ?auto_1352834 ?auto_1352835 ) ) ( AVAILABLE ?auto_1352836 ) ( ON ?auto_1352834 ?auto_1352832 ) ( not ( = ?auto_1352832 ?auto_1352834 ) ) ( not ( = ?auto_1352832 ?auto_1352835 ) ) ( not ( = ?auto_1352839 ?auto_1352837 ) ) ( HOIST-AT ?auto_1352841 ?auto_1352839 ) ( not ( = ?auto_1352836 ?auto_1352841 ) ) ( AVAILABLE ?auto_1352841 ) ( SURFACE-AT ?auto_1352835 ?auto_1352839 ) ( ON ?auto_1352835 ?auto_1352840 ) ( CLEAR ?auto_1352835 ) ( not ( = ?auto_1352834 ?auto_1352840 ) ) ( not ( = ?auto_1352835 ?auto_1352840 ) ) ( not ( = ?auto_1352832 ?auto_1352840 ) ) ( TRUCK-AT ?auto_1352838 ?auto_1352837 ) ( ON ?auto_1352829 ?auto_1352828 ) ( ON ?auto_1352830 ?auto_1352829 ) ( ON ?auto_1352827 ?auto_1352830 ) ( ON ?auto_1352831 ?auto_1352827 ) ( ON ?auto_1352833 ?auto_1352831 ) ( ON ?auto_1352832 ?auto_1352833 ) ( not ( = ?auto_1352828 ?auto_1352829 ) ) ( not ( = ?auto_1352828 ?auto_1352830 ) ) ( not ( = ?auto_1352828 ?auto_1352827 ) ) ( not ( = ?auto_1352828 ?auto_1352831 ) ) ( not ( = ?auto_1352828 ?auto_1352833 ) ) ( not ( = ?auto_1352828 ?auto_1352832 ) ) ( not ( = ?auto_1352828 ?auto_1352834 ) ) ( not ( = ?auto_1352828 ?auto_1352835 ) ) ( not ( = ?auto_1352828 ?auto_1352840 ) ) ( not ( = ?auto_1352829 ?auto_1352830 ) ) ( not ( = ?auto_1352829 ?auto_1352827 ) ) ( not ( = ?auto_1352829 ?auto_1352831 ) ) ( not ( = ?auto_1352829 ?auto_1352833 ) ) ( not ( = ?auto_1352829 ?auto_1352832 ) ) ( not ( = ?auto_1352829 ?auto_1352834 ) ) ( not ( = ?auto_1352829 ?auto_1352835 ) ) ( not ( = ?auto_1352829 ?auto_1352840 ) ) ( not ( = ?auto_1352830 ?auto_1352827 ) ) ( not ( = ?auto_1352830 ?auto_1352831 ) ) ( not ( = ?auto_1352830 ?auto_1352833 ) ) ( not ( = ?auto_1352830 ?auto_1352832 ) ) ( not ( = ?auto_1352830 ?auto_1352834 ) ) ( not ( = ?auto_1352830 ?auto_1352835 ) ) ( not ( = ?auto_1352830 ?auto_1352840 ) ) ( not ( = ?auto_1352827 ?auto_1352831 ) ) ( not ( = ?auto_1352827 ?auto_1352833 ) ) ( not ( = ?auto_1352827 ?auto_1352832 ) ) ( not ( = ?auto_1352827 ?auto_1352834 ) ) ( not ( = ?auto_1352827 ?auto_1352835 ) ) ( not ( = ?auto_1352827 ?auto_1352840 ) ) ( not ( = ?auto_1352831 ?auto_1352833 ) ) ( not ( = ?auto_1352831 ?auto_1352832 ) ) ( not ( = ?auto_1352831 ?auto_1352834 ) ) ( not ( = ?auto_1352831 ?auto_1352835 ) ) ( not ( = ?auto_1352831 ?auto_1352840 ) ) ( not ( = ?auto_1352833 ?auto_1352832 ) ) ( not ( = ?auto_1352833 ?auto_1352834 ) ) ( not ( = ?auto_1352833 ?auto_1352835 ) ) ( not ( = ?auto_1352833 ?auto_1352840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352832 ?auto_1352834 ?auto_1352835 )
      ( MAKE-8CRATE-VERIFY ?auto_1352828 ?auto_1352829 ?auto_1352830 ?auto_1352827 ?auto_1352831 ?auto_1352833 ?auto_1352832 ?auto_1352834 ?auto_1352835 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1352921 - SURFACE
      ?auto_1352922 - SURFACE
      ?auto_1352923 - SURFACE
      ?auto_1352920 - SURFACE
      ?auto_1352924 - SURFACE
      ?auto_1352926 - SURFACE
      ?auto_1352925 - SURFACE
      ?auto_1352927 - SURFACE
      ?auto_1352928 - SURFACE
    )
    :vars
    (
      ?auto_1352929 - HOIST
      ?auto_1352933 - PLACE
      ?auto_1352932 - PLACE
      ?auto_1352931 - HOIST
      ?auto_1352930 - SURFACE
      ?auto_1352934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1352929 ?auto_1352933 ) ( IS-CRATE ?auto_1352928 ) ( not ( = ?auto_1352927 ?auto_1352928 ) ) ( not ( = ?auto_1352925 ?auto_1352927 ) ) ( not ( = ?auto_1352925 ?auto_1352928 ) ) ( not ( = ?auto_1352932 ?auto_1352933 ) ) ( HOIST-AT ?auto_1352931 ?auto_1352932 ) ( not ( = ?auto_1352929 ?auto_1352931 ) ) ( AVAILABLE ?auto_1352931 ) ( SURFACE-AT ?auto_1352928 ?auto_1352932 ) ( ON ?auto_1352928 ?auto_1352930 ) ( CLEAR ?auto_1352928 ) ( not ( = ?auto_1352927 ?auto_1352930 ) ) ( not ( = ?auto_1352928 ?auto_1352930 ) ) ( not ( = ?auto_1352925 ?auto_1352930 ) ) ( TRUCK-AT ?auto_1352934 ?auto_1352933 ) ( SURFACE-AT ?auto_1352925 ?auto_1352933 ) ( CLEAR ?auto_1352925 ) ( LIFTING ?auto_1352929 ?auto_1352927 ) ( IS-CRATE ?auto_1352927 ) ( ON ?auto_1352922 ?auto_1352921 ) ( ON ?auto_1352923 ?auto_1352922 ) ( ON ?auto_1352920 ?auto_1352923 ) ( ON ?auto_1352924 ?auto_1352920 ) ( ON ?auto_1352926 ?auto_1352924 ) ( ON ?auto_1352925 ?auto_1352926 ) ( not ( = ?auto_1352921 ?auto_1352922 ) ) ( not ( = ?auto_1352921 ?auto_1352923 ) ) ( not ( = ?auto_1352921 ?auto_1352920 ) ) ( not ( = ?auto_1352921 ?auto_1352924 ) ) ( not ( = ?auto_1352921 ?auto_1352926 ) ) ( not ( = ?auto_1352921 ?auto_1352925 ) ) ( not ( = ?auto_1352921 ?auto_1352927 ) ) ( not ( = ?auto_1352921 ?auto_1352928 ) ) ( not ( = ?auto_1352921 ?auto_1352930 ) ) ( not ( = ?auto_1352922 ?auto_1352923 ) ) ( not ( = ?auto_1352922 ?auto_1352920 ) ) ( not ( = ?auto_1352922 ?auto_1352924 ) ) ( not ( = ?auto_1352922 ?auto_1352926 ) ) ( not ( = ?auto_1352922 ?auto_1352925 ) ) ( not ( = ?auto_1352922 ?auto_1352927 ) ) ( not ( = ?auto_1352922 ?auto_1352928 ) ) ( not ( = ?auto_1352922 ?auto_1352930 ) ) ( not ( = ?auto_1352923 ?auto_1352920 ) ) ( not ( = ?auto_1352923 ?auto_1352924 ) ) ( not ( = ?auto_1352923 ?auto_1352926 ) ) ( not ( = ?auto_1352923 ?auto_1352925 ) ) ( not ( = ?auto_1352923 ?auto_1352927 ) ) ( not ( = ?auto_1352923 ?auto_1352928 ) ) ( not ( = ?auto_1352923 ?auto_1352930 ) ) ( not ( = ?auto_1352920 ?auto_1352924 ) ) ( not ( = ?auto_1352920 ?auto_1352926 ) ) ( not ( = ?auto_1352920 ?auto_1352925 ) ) ( not ( = ?auto_1352920 ?auto_1352927 ) ) ( not ( = ?auto_1352920 ?auto_1352928 ) ) ( not ( = ?auto_1352920 ?auto_1352930 ) ) ( not ( = ?auto_1352924 ?auto_1352926 ) ) ( not ( = ?auto_1352924 ?auto_1352925 ) ) ( not ( = ?auto_1352924 ?auto_1352927 ) ) ( not ( = ?auto_1352924 ?auto_1352928 ) ) ( not ( = ?auto_1352924 ?auto_1352930 ) ) ( not ( = ?auto_1352926 ?auto_1352925 ) ) ( not ( = ?auto_1352926 ?auto_1352927 ) ) ( not ( = ?auto_1352926 ?auto_1352928 ) ) ( not ( = ?auto_1352926 ?auto_1352930 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1352925 ?auto_1352927 ?auto_1352928 )
      ( MAKE-8CRATE-VERIFY ?auto_1352921 ?auto_1352922 ?auto_1352923 ?auto_1352920 ?auto_1352924 ?auto_1352926 ?auto_1352925 ?auto_1352927 ?auto_1352928 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1353014 - SURFACE
      ?auto_1353015 - SURFACE
      ?auto_1353016 - SURFACE
      ?auto_1353013 - SURFACE
      ?auto_1353017 - SURFACE
      ?auto_1353019 - SURFACE
      ?auto_1353018 - SURFACE
      ?auto_1353020 - SURFACE
      ?auto_1353021 - SURFACE
    )
    :vars
    (
      ?auto_1353023 - HOIST
      ?auto_1353025 - PLACE
      ?auto_1353024 - PLACE
      ?auto_1353027 - HOIST
      ?auto_1353026 - SURFACE
      ?auto_1353022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1353023 ?auto_1353025 ) ( IS-CRATE ?auto_1353021 ) ( not ( = ?auto_1353020 ?auto_1353021 ) ) ( not ( = ?auto_1353018 ?auto_1353020 ) ) ( not ( = ?auto_1353018 ?auto_1353021 ) ) ( not ( = ?auto_1353024 ?auto_1353025 ) ) ( HOIST-AT ?auto_1353027 ?auto_1353024 ) ( not ( = ?auto_1353023 ?auto_1353027 ) ) ( AVAILABLE ?auto_1353027 ) ( SURFACE-AT ?auto_1353021 ?auto_1353024 ) ( ON ?auto_1353021 ?auto_1353026 ) ( CLEAR ?auto_1353021 ) ( not ( = ?auto_1353020 ?auto_1353026 ) ) ( not ( = ?auto_1353021 ?auto_1353026 ) ) ( not ( = ?auto_1353018 ?auto_1353026 ) ) ( TRUCK-AT ?auto_1353022 ?auto_1353025 ) ( SURFACE-AT ?auto_1353018 ?auto_1353025 ) ( CLEAR ?auto_1353018 ) ( IS-CRATE ?auto_1353020 ) ( AVAILABLE ?auto_1353023 ) ( IN ?auto_1353020 ?auto_1353022 ) ( ON ?auto_1353015 ?auto_1353014 ) ( ON ?auto_1353016 ?auto_1353015 ) ( ON ?auto_1353013 ?auto_1353016 ) ( ON ?auto_1353017 ?auto_1353013 ) ( ON ?auto_1353019 ?auto_1353017 ) ( ON ?auto_1353018 ?auto_1353019 ) ( not ( = ?auto_1353014 ?auto_1353015 ) ) ( not ( = ?auto_1353014 ?auto_1353016 ) ) ( not ( = ?auto_1353014 ?auto_1353013 ) ) ( not ( = ?auto_1353014 ?auto_1353017 ) ) ( not ( = ?auto_1353014 ?auto_1353019 ) ) ( not ( = ?auto_1353014 ?auto_1353018 ) ) ( not ( = ?auto_1353014 ?auto_1353020 ) ) ( not ( = ?auto_1353014 ?auto_1353021 ) ) ( not ( = ?auto_1353014 ?auto_1353026 ) ) ( not ( = ?auto_1353015 ?auto_1353016 ) ) ( not ( = ?auto_1353015 ?auto_1353013 ) ) ( not ( = ?auto_1353015 ?auto_1353017 ) ) ( not ( = ?auto_1353015 ?auto_1353019 ) ) ( not ( = ?auto_1353015 ?auto_1353018 ) ) ( not ( = ?auto_1353015 ?auto_1353020 ) ) ( not ( = ?auto_1353015 ?auto_1353021 ) ) ( not ( = ?auto_1353015 ?auto_1353026 ) ) ( not ( = ?auto_1353016 ?auto_1353013 ) ) ( not ( = ?auto_1353016 ?auto_1353017 ) ) ( not ( = ?auto_1353016 ?auto_1353019 ) ) ( not ( = ?auto_1353016 ?auto_1353018 ) ) ( not ( = ?auto_1353016 ?auto_1353020 ) ) ( not ( = ?auto_1353016 ?auto_1353021 ) ) ( not ( = ?auto_1353016 ?auto_1353026 ) ) ( not ( = ?auto_1353013 ?auto_1353017 ) ) ( not ( = ?auto_1353013 ?auto_1353019 ) ) ( not ( = ?auto_1353013 ?auto_1353018 ) ) ( not ( = ?auto_1353013 ?auto_1353020 ) ) ( not ( = ?auto_1353013 ?auto_1353021 ) ) ( not ( = ?auto_1353013 ?auto_1353026 ) ) ( not ( = ?auto_1353017 ?auto_1353019 ) ) ( not ( = ?auto_1353017 ?auto_1353018 ) ) ( not ( = ?auto_1353017 ?auto_1353020 ) ) ( not ( = ?auto_1353017 ?auto_1353021 ) ) ( not ( = ?auto_1353017 ?auto_1353026 ) ) ( not ( = ?auto_1353019 ?auto_1353018 ) ) ( not ( = ?auto_1353019 ?auto_1353020 ) ) ( not ( = ?auto_1353019 ?auto_1353021 ) ) ( not ( = ?auto_1353019 ?auto_1353026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1353018 ?auto_1353020 ?auto_1353021 )
      ( MAKE-8CRATE-VERIFY ?auto_1353014 ?auto_1353015 ?auto_1353016 ?auto_1353013 ?auto_1353017 ?auto_1353019 ?auto_1353018 ?auto_1353020 ?auto_1353021 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357130 - SURFACE
      ?auto_1357131 - SURFACE
      ?auto_1357132 - SURFACE
      ?auto_1357129 - SURFACE
      ?auto_1357133 - SURFACE
      ?auto_1357135 - SURFACE
      ?auto_1357134 - SURFACE
      ?auto_1357136 - SURFACE
      ?auto_1357137 - SURFACE
      ?auto_1357138 - SURFACE
    )
    :vars
    (
      ?auto_1357140 - HOIST
      ?auto_1357139 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357140 ?auto_1357139 ) ( SURFACE-AT ?auto_1357137 ?auto_1357139 ) ( CLEAR ?auto_1357137 ) ( LIFTING ?auto_1357140 ?auto_1357138 ) ( IS-CRATE ?auto_1357138 ) ( not ( = ?auto_1357137 ?auto_1357138 ) ) ( ON ?auto_1357131 ?auto_1357130 ) ( ON ?auto_1357132 ?auto_1357131 ) ( ON ?auto_1357129 ?auto_1357132 ) ( ON ?auto_1357133 ?auto_1357129 ) ( ON ?auto_1357135 ?auto_1357133 ) ( ON ?auto_1357134 ?auto_1357135 ) ( ON ?auto_1357136 ?auto_1357134 ) ( ON ?auto_1357137 ?auto_1357136 ) ( not ( = ?auto_1357130 ?auto_1357131 ) ) ( not ( = ?auto_1357130 ?auto_1357132 ) ) ( not ( = ?auto_1357130 ?auto_1357129 ) ) ( not ( = ?auto_1357130 ?auto_1357133 ) ) ( not ( = ?auto_1357130 ?auto_1357135 ) ) ( not ( = ?auto_1357130 ?auto_1357134 ) ) ( not ( = ?auto_1357130 ?auto_1357136 ) ) ( not ( = ?auto_1357130 ?auto_1357137 ) ) ( not ( = ?auto_1357130 ?auto_1357138 ) ) ( not ( = ?auto_1357131 ?auto_1357132 ) ) ( not ( = ?auto_1357131 ?auto_1357129 ) ) ( not ( = ?auto_1357131 ?auto_1357133 ) ) ( not ( = ?auto_1357131 ?auto_1357135 ) ) ( not ( = ?auto_1357131 ?auto_1357134 ) ) ( not ( = ?auto_1357131 ?auto_1357136 ) ) ( not ( = ?auto_1357131 ?auto_1357137 ) ) ( not ( = ?auto_1357131 ?auto_1357138 ) ) ( not ( = ?auto_1357132 ?auto_1357129 ) ) ( not ( = ?auto_1357132 ?auto_1357133 ) ) ( not ( = ?auto_1357132 ?auto_1357135 ) ) ( not ( = ?auto_1357132 ?auto_1357134 ) ) ( not ( = ?auto_1357132 ?auto_1357136 ) ) ( not ( = ?auto_1357132 ?auto_1357137 ) ) ( not ( = ?auto_1357132 ?auto_1357138 ) ) ( not ( = ?auto_1357129 ?auto_1357133 ) ) ( not ( = ?auto_1357129 ?auto_1357135 ) ) ( not ( = ?auto_1357129 ?auto_1357134 ) ) ( not ( = ?auto_1357129 ?auto_1357136 ) ) ( not ( = ?auto_1357129 ?auto_1357137 ) ) ( not ( = ?auto_1357129 ?auto_1357138 ) ) ( not ( = ?auto_1357133 ?auto_1357135 ) ) ( not ( = ?auto_1357133 ?auto_1357134 ) ) ( not ( = ?auto_1357133 ?auto_1357136 ) ) ( not ( = ?auto_1357133 ?auto_1357137 ) ) ( not ( = ?auto_1357133 ?auto_1357138 ) ) ( not ( = ?auto_1357135 ?auto_1357134 ) ) ( not ( = ?auto_1357135 ?auto_1357136 ) ) ( not ( = ?auto_1357135 ?auto_1357137 ) ) ( not ( = ?auto_1357135 ?auto_1357138 ) ) ( not ( = ?auto_1357134 ?auto_1357136 ) ) ( not ( = ?auto_1357134 ?auto_1357137 ) ) ( not ( = ?auto_1357134 ?auto_1357138 ) ) ( not ( = ?auto_1357136 ?auto_1357137 ) ) ( not ( = ?auto_1357136 ?auto_1357138 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1357137 ?auto_1357138 )
      ( MAKE-9CRATE-VERIFY ?auto_1357130 ?auto_1357131 ?auto_1357132 ?auto_1357129 ?auto_1357133 ?auto_1357135 ?auto_1357134 ?auto_1357136 ?auto_1357137 ?auto_1357138 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357210 - SURFACE
      ?auto_1357211 - SURFACE
      ?auto_1357212 - SURFACE
      ?auto_1357209 - SURFACE
      ?auto_1357213 - SURFACE
      ?auto_1357215 - SURFACE
      ?auto_1357214 - SURFACE
      ?auto_1357216 - SURFACE
      ?auto_1357217 - SURFACE
      ?auto_1357218 - SURFACE
    )
    :vars
    (
      ?auto_1357221 - HOIST
      ?auto_1357219 - PLACE
      ?auto_1357220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357221 ?auto_1357219 ) ( SURFACE-AT ?auto_1357217 ?auto_1357219 ) ( CLEAR ?auto_1357217 ) ( IS-CRATE ?auto_1357218 ) ( not ( = ?auto_1357217 ?auto_1357218 ) ) ( TRUCK-AT ?auto_1357220 ?auto_1357219 ) ( AVAILABLE ?auto_1357221 ) ( IN ?auto_1357218 ?auto_1357220 ) ( ON ?auto_1357217 ?auto_1357216 ) ( not ( = ?auto_1357216 ?auto_1357217 ) ) ( not ( = ?auto_1357216 ?auto_1357218 ) ) ( ON ?auto_1357211 ?auto_1357210 ) ( ON ?auto_1357212 ?auto_1357211 ) ( ON ?auto_1357209 ?auto_1357212 ) ( ON ?auto_1357213 ?auto_1357209 ) ( ON ?auto_1357215 ?auto_1357213 ) ( ON ?auto_1357214 ?auto_1357215 ) ( ON ?auto_1357216 ?auto_1357214 ) ( not ( = ?auto_1357210 ?auto_1357211 ) ) ( not ( = ?auto_1357210 ?auto_1357212 ) ) ( not ( = ?auto_1357210 ?auto_1357209 ) ) ( not ( = ?auto_1357210 ?auto_1357213 ) ) ( not ( = ?auto_1357210 ?auto_1357215 ) ) ( not ( = ?auto_1357210 ?auto_1357214 ) ) ( not ( = ?auto_1357210 ?auto_1357216 ) ) ( not ( = ?auto_1357210 ?auto_1357217 ) ) ( not ( = ?auto_1357210 ?auto_1357218 ) ) ( not ( = ?auto_1357211 ?auto_1357212 ) ) ( not ( = ?auto_1357211 ?auto_1357209 ) ) ( not ( = ?auto_1357211 ?auto_1357213 ) ) ( not ( = ?auto_1357211 ?auto_1357215 ) ) ( not ( = ?auto_1357211 ?auto_1357214 ) ) ( not ( = ?auto_1357211 ?auto_1357216 ) ) ( not ( = ?auto_1357211 ?auto_1357217 ) ) ( not ( = ?auto_1357211 ?auto_1357218 ) ) ( not ( = ?auto_1357212 ?auto_1357209 ) ) ( not ( = ?auto_1357212 ?auto_1357213 ) ) ( not ( = ?auto_1357212 ?auto_1357215 ) ) ( not ( = ?auto_1357212 ?auto_1357214 ) ) ( not ( = ?auto_1357212 ?auto_1357216 ) ) ( not ( = ?auto_1357212 ?auto_1357217 ) ) ( not ( = ?auto_1357212 ?auto_1357218 ) ) ( not ( = ?auto_1357209 ?auto_1357213 ) ) ( not ( = ?auto_1357209 ?auto_1357215 ) ) ( not ( = ?auto_1357209 ?auto_1357214 ) ) ( not ( = ?auto_1357209 ?auto_1357216 ) ) ( not ( = ?auto_1357209 ?auto_1357217 ) ) ( not ( = ?auto_1357209 ?auto_1357218 ) ) ( not ( = ?auto_1357213 ?auto_1357215 ) ) ( not ( = ?auto_1357213 ?auto_1357214 ) ) ( not ( = ?auto_1357213 ?auto_1357216 ) ) ( not ( = ?auto_1357213 ?auto_1357217 ) ) ( not ( = ?auto_1357213 ?auto_1357218 ) ) ( not ( = ?auto_1357215 ?auto_1357214 ) ) ( not ( = ?auto_1357215 ?auto_1357216 ) ) ( not ( = ?auto_1357215 ?auto_1357217 ) ) ( not ( = ?auto_1357215 ?auto_1357218 ) ) ( not ( = ?auto_1357214 ?auto_1357216 ) ) ( not ( = ?auto_1357214 ?auto_1357217 ) ) ( not ( = ?auto_1357214 ?auto_1357218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357216 ?auto_1357217 ?auto_1357218 )
      ( MAKE-9CRATE-VERIFY ?auto_1357210 ?auto_1357211 ?auto_1357212 ?auto_1357209 ?auto_1357213 ?auto_1357215 ?auto_1357214 ?auto_1357216 ?auto_1357217 ?auto_1357218 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357300 - SURFACE
      ?auto_1357301 - SURFACE
      ?auto_1357302 - SURFACE
      ?auto_1357299 - SURFACE
      ?auto_1357303 - SURFACE
      ?auto_1357305 - SURFACE
      ?auto_1357304 - SURFACE
      ?auto_1357306 - SURFACE
      ?auto_1357307 - SURFACE
      ?auto_1357308 - SURFACE
    )
    :vars
    (
      ?auto_1357309 - HOIST
      ?auto_1357312 - PLACE
      ?auto_1357311 - TRUCK
      ?auto_1357310 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357309 ?auto_1357312 ) ( SURFACE-AT ?auto_1357307 ?auto_1357312 ) ( CLEAR ?auto_1357307 ) ( IS-CRATE ?auto_1357308 ) ( not ( = ?auto_1357307 ?auto_1357308 ) ) ( AVAILABLE ?auto_1357309 ) ( IN ?auto_1357308 ?auto_1357311 ) ( ON ?auto_1357307 ?auto_1357306 ) ( not ( = ?auto_1357306 ?auto_1357307 ) ) ( not ( = ?auto_1357306 ?auto_1357308 ) ) ( TRUCK-AT ?auto_1357311 ?auto_1357310 ) ( not ( = ?auto_1357310 ?auto_1357312 ) ) ( ON ?auto_1357301 ?auto_1357300 ) ( ON ?auto_1357302 ?auto_1357301 ) ( ON ?auto_1357299 ?auto_1357302 ) ( ON ?auto_1357303 ?auto_1357299 ) ( ON ?auto_1357305 ?auto_1357303 ) ( ON ?auto_1357304 ?auto_1357305 ) ( ON ?auto_1357306 ?auto_1357304 ) ( not ( = ?auto_1357300 ?auto_1357301 ) ) ( not ( = ?auto_1357300 ?auto_1357302 ) ) ( not ( = ?auto_1357300 ?auto_1357299 ) ) ( not ( = ?auto_1357300 ?auto_1357303 ) ) ( not ( = ?auto_1357300 ?auto_1357305 ) ) ( not ( = ?auto_1357300 ?auto_1357304 ) ) ( not ( = ?auto_1357300 ?auto_1357306 ) ) ( not ( = ?auto_1357300 ?auto_1357307 ) ) ( not ( = ?auto_1357300 ?auto_1357308 ) ) ( not ( = ?auto_1357301 ?auto_1357302 ) ) ( not ( = ?auto_1357301 ?auto_1357299 ) ) ( not ( = ?auto_1357301 ?auto_1357303 ) ) ( not ( = ?auto_1357301 ?auto_1357305 ) ) ( not ( = ?auto_1357301 ?auto_1357304 ) ) ( not ( = ?auto_1357301 ?auto_1357306 ) ) ( not ( = ?auto_1357301 ?auto_1357307 ) ) ( not ( = ?auto_1357301 ?auto_1357308 ) ) ( not ( = ?auto_1357302 ?auto_1357299 ) ) ( not ( = ?auto_1357302 ?auto_1357303 ) ) ( not ( = ?auto_1357302 ?auto_1357305 ) ) ( not ( = ?auto_1357302 ?auto_1357304 ) ) ( not ( = ?auto_1357302 ?auto_1357306 ) ) ( not ( = ?auto_1357302 ?auto_1357307 ) ) ( not ( = ?auto_1357302 ?auto_1357308 ) ) ( not ( = ?auto_1357299 ?auto_1357303 ) ) ( not ( = ?auto_1357299 ?auto_1357305 ) ) ( not ( = ?auto_1357299 ?auto_1357304 ) ) ( not ( = ?auto_1357299 ?auto_1357306 ) ) ( not ( = ?auto_1357299 ?auto_1357307 ) ) ( not ( = ?auto_1357299 ?auto_1357308 ) ) ( not ( = ?auto_1357303 ?auto_1357305 ) ) ( not ( = ?auto_1357303 ?auto_1357304 ) ) ( not ( = ?auto_1357303 ?auto_1357306 ) ) ( not ( = ?auto_1357303 ?auto_1357307 ) ) ( not ( = ?auto_1357303 ?auto_1357308 ) ) ( not ( = ?auto_1357305 ?auto_1357304 ) ) ( not ( = ?auto_1357305 ?auto_1357306 ) ) ( not ( = ?auto_1357305 ?auto_1357307 ) ) ( not ( = ?auto_1357305 ?auto_1357308 ) ) ( not ( = ?auto_1357304 ?auto_1357306 ) ) ( not ( = ?auto_1357304 ?auto_1357307 ) ) ( not ( = ?auto_1357304 ?auto_1357308 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357306 ?auto_1357307 ?auto_1357308 )
      ( MAKE-9CRATE-VERIFY ?auto_1357300 ?auto_1357301 ?auto_1357302 ?auto_1357299 ?auto_1357303 ?auto_1357305 ?auto_1357304 ?auto_1357306 ?auto_1357307 ?auto_1357308 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357399 - SURFACE
      ?auto_1357400 - SURFACE
      ?auto_1357401 - SURFACE
      ?auto_1357398 - SURFACE
      ?auto_1357402 - SURFACE
      ?auto_1357404 - SURFACE
      ?auto_1357403 - SURFACE
      ?auto_1357405 - SURFACE
      ?auto_1357406 - SURFACE
      ?auto_1357407 - SURFACE
    )
    :vars
    (
      ?auto_1357408 - HOIST
      ?auto_1357409 - PLACE
      ?auto_1357412 - TRUCK
      ?auto_1357411 - PLACE
      ?auto_1357410 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357408 ?auto_1357409 ) ( SURFACE-AT ?auto_1357406 ?auto_1357409 ) ( CLEAR ?auto_1357406 ) ( IS-CRATE ?auto_1357407 ) ( not ( = ?auto_1357406 ?auto_1357407 ) ) ( AVAILABLE ?auto_1357408 ) ( ON ?auto_1357406 ?auto_1357405 ) ( not ( = ?auto_1357405 ?auto_1357406 ) ) ( not ( = ?auto_1357405 ?auto_1357407 ) ) ( TRUCK-AT ?auto_1357412 ?auto_1357411 ) ( not ( = ?auto_1357411 ?auto_1357409 ) ) ( HOIST-AT ?auto_1357410 ?auto_1357411 ) ( LIFTING ?auto_1357410 ?auto_1357407 ) ( not ( = ?auto_1357408 ?auto_1357410 ) ) ( ON ?auto_1357400 ?auto_1357399 ) ( ON ?auto_1357401 ?auto_1357400 ) ( ON ?auto_1357398 ?auto_1357401 ) ( ON ?auto_1357402 ?auto_1357398 ) ( ON ?auto_1357404 ?auto_1357402 ) ( ON ?auto_1357403 ?auto_1357404 ) ( ON ?auto_1357405 ?auto_1357403 ) ( not ( = ?auto_1357399 ?auto_1357400 ) ) ( not ( = ?auto_1357399 ?auto_1357401 ) ) ( not ( = ?auto_1357399 ?auto_1357398 ) ) ( not ( = ?auto_1357399 ?auto_1357402 ) ) ( not ( = ?auto_1357399 ?auto_1357404 ) ) ( not ( = ?auto_1357399 ?auto_1357403 ) ) ( not ( = ?auto_1357399 ?auto_1357405 ) ) ( not ( = ?auto_1357399 ?auto_1357406 ) ) ( not ( = ?auto_1357399 ?auto_1357407 ) ) ( not ( = ?auto_1357400 ?auto_1357401 ) ) ( not ( = ?auto_1357400 ?auto_1357398 ) ) ( not ( = ?auto_1357400 ?auto_1357402 ) ) ( not ( = ?auto_1357400 ?auto_1357404 ) ) ( not ( = ?auto_1357400 ?auto_1357403 ) ) ( not ( = ?auto_1357400 ?auto_1357405 ) ) ( not ( = ?auto_1357400 ?auto_1357406 ) ) ( not ( = ?auto_1357400 ?auto_1357407 ) ) ( not ( = ?auto_1357401 ?auto_1357398 ) ) ( not ( = ?auto_1357401 ?auto_1357402 ) ) ( not ( = ?auto_1357401 ?auto_1357404 ) ) ( not ( = ?auto_1357401 ?auto_1357403 ) ) ( not ( = ?auto_1357401 ?auto_1357405 ) ) ( not ( = ?auto_1357401 ?auto_1357406 ) ) ( not ( = ?auto_1357401 ?auto_1357407 ) ) ( not ( = ?auto_1357398 ?auto_1357402 ) ) ( not ( = ?auto_1357398 ?auto_1357404 ) ) ( not ( = ?auto_1357398 ?auto_1357403 ) ) ( not ( = ?auto_1357398 ?auto_1357405 ) ) ( not ( = ?auto_1357398 ?auto_1357406 ) ) ( not ( = ?auto_1357398 ?auto_1357407 ) ) ( not ( = ?auto_1357402 ?auto_1357404 ) ) ( not ( = ?auto_1357402 ?auto_1357403 ) ) ( not ( = ?auto_1357402 ?auto_1357405 ) ) ( not ( = ?auto_1357402 ?auto_1357406 ) ) ( not ( = ?auto_1357402 ?auto_1357407 ) ) ( not ( = ?auto_1357404 ?auto_1357403 ) ) ( not ( = ?auto_1357404 ?auto_1357405 ) ) ( not ( = ?auto_1357404 ?auto_1357406 ) ) ( not ( = ?auto_1357404 ?auto_1357407 ) ) ( not ( = ?auto_1357403 ?auto_1357405 ) ) ( not ( = ?auto_1357403 ?auto_1357406 ) ) ( not ( = ?auto_1357403 ?auto_1357407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357405 ?auto_1357406 ?auto_1357407 )
      ( MAKE-9CRATE-VERIFY ?auto_1357399 ?auto_1357400 ?auto_1357401 ?auto_1357398 ?auto_1357402 ?auto_1357404 ?auto_1357403 ?auto_1357405 ?auto_1357406 ?auto_1357407 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357507 - SURFACE
      ?auto_1357508 - SURFACE
      ?auto_1357509 - SURFACE
      ?auto_1357506 - SURFACE
      ?auto_1357510 - SURFACE
      ?auto_1357512 - SURFACE
      ?auto_1357511 - SURFACE
      ?auto_1357513 - SURFACE
      ?auto_1357514 - SURFACE
      ?auto_1357515 - SURFACE
    )
    :vars
    (
      ?auto_1357519 - HOIST
      ?auto_1357520 - PLACE
      ?auto_1357517 - TRUCK
      ?auto_1357521 - PLACE
      ?auto_1357518 - HOIST
      ?auto_1357516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357519 ?auto_1357520 ) ( SURFACE-AT ?auto_1357514 ?auto_1357520 ) ( CLEAR ?auto_1357514 ) ( IS-CRATE ?auto_1357515 ) ( not ( = ?auto_1357514 ?auto_1357515 ) ) ( AVAILABLE ?auto_1357519 ) ( ON ?auto_1357514 ?auto_1357513 ) ( not ( = ?auto_1357513 ?auto_1357514 ) ) ( not ( = ?auto_1357513 ?auto_1357515 ) ) ( TRUCK-AT ?auto_1357517 ?auto_1357521 ) ( not ( = ?auto_1357521 ?auto_1357520 ) ) ( HOIST-AT ?auto_1357518 ?auto_1357521 ) ( not ( = ?auto_1357519 ?auto_1357518 ) ) ( AVAILABLE ?auto_1357518 ) ( SURFACE-AT ?auto_1357515 ?auto_1357521 ) ( ON ?auto_1357515 ?auto_1357516 ) ( CLEAR ?auto_1357515 ) ( not ( = ?auto_1357514 ?auto_1357516 ) ) ( not ( = ?auto_1357515 ?auto_1357516 ) ) ( not ( = ?auto_1357513 ?auto_1357516 ) ) ( ON ?auto_1357508 ?auto_1357507 ) ( ON ?auto_1357509 ?auto_1357508 ) ( ON ?auto_1357506 ?auto_1357509 ) ( ON ?auto_1357510 ?auto_1357506 ) ( ON ?auto_1357512 ?auto_1357510 ) ( ON ?auto_1357511 ?auto_1357512 ) ( ON ?auto_1357513 ?auto_1357511 ) ( not ( = ?auto_1357507 ?auto_1357508 ) ) ( not ( = ?auto_1357507 ?auto_1357509 ) ) ( not ( = ?auto_1357507 ?auto_1357506 ) ) ( not ( = ?auto_1357507 ?auto_1357510 ) ) ( not ( = ?auto_1357507 ?auto_1357512 ) ) ( not ( = ?auto_1357507 ?auto_1357511 ) ) ( not ( = ?auto_1357507 ?auto_1357513 ) ) ( not ( = ?auto_1357507 ?auto_1357514 ) ) ( not ( = ?auto_1357507 ?auto_1357515 ) ) ( not ( = ?auto_1357507 ?auto_1357516 ) ) ( not ( = ?auto_1357508 ?auto_1357509 ) ) ( not ( = ?auto_1357508 ?auto_1357506 ) ) ( not ( = ?auto_1357508 ?auto_1357510 ) ) ( not ( = ?auto_1357508 ?auto_1357512 ) ) ( not ( = ?auto_1357508 ?auto_1357511 ) ) ( not ( = ?auto_1357508 ?auto_1357513 ) ) ( not ( = ?auto_1357508 ?auto_1357514 ) ) ( not ( = ?auto_1357508 ?auto_1357515 ) ) ( not ( = ?auto_1357508 ?auto_1357516 ) ) ( not ( = ?auto_1357509 ?auto_1357506 ) ) ( not ( = ?auto_1357509 ?auto_1357510 ) ) ( not ( = ?auto_1357509 ?auto_1357512 ) ) ( not ( = ?auto_1357509 ?auto_1357511 ) ) ( not ( = ?auto_1357509 ?auto_1357513 ) ) ( not ( = ?auto_1357509 ?auto_1357514 ) ) ( not ( = ?auto_1357509 ?auto_1357515 ) ) ( not ( = ?auto_1357509 ?auto_1357516 ) ) ( not ( = ?auto_1357506 ?auto_1357510 ) ) ( not ( = ?auto_1357506 ?auto_1357512 ) ) ( not ( = ?auto_1357506 ?auto_1357511 ) ) ( not ( = ?auto_1357506 ?auto_1357513 ) ) ( not ( = ?auto_1357506 ?auto_1357514 ) ) ( not ( = ?auto_1357506 ?auto_1357515 ) ) ( not ( = ?auto_1357506 ?auto_1357516 ) ) ( not ( = ?auto_1357510 ?auto_1357512 ) ) ( not ( = ?auto_1357510 ?auto_1357511 ) ) ( not ( = ?auto_1357510 ?auto_1357513 ) ) ( not ( = ?auto_1357510 ?auto_1357514 ) ) ( not ( = ?auto_1357510 ?auto_1357515 ) ) ( not ( = ?auto_1357510 ?auto_1357516 ) ) ( not ( = ?auto_1357512 ?auto_1357511 ) ) ( not ( = ?auto_1357512 ?auto_1357513 ) ) ( not ( = ?auto_1357512 ?auto_1357514 ) ) ( not ( = ?auto_1357512 ?auto_1357515 ) ) ( not ( = ?auto_1357512 ?auto_1357516 ) ) ( not ( = ?auto_1357511 ?auto_1357513 ) ) ( not ( = ?auto_1357511 ?auto_1357514 ) ) ( not ( = ?auto_1357511 ?auto_1357515 ) ) ( not ( = ?auto_1357511 ?auto_1357516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357513 ?auto_1357514 ?auto_1357515 )
      ( MAKE-9CRATE-VERIFY ?auto_1357507 ?auto_1357508 ?auto_1357509 ?auto_1357506 ?auto_1357510 ?auto_1357512 ?auto_1357511 ?auto_1357513 ?auto_1357514 ?auto_1357515 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357616 - SURFACE
      ?auto_1357617 - SURFACE
      ?auto_1357618 - SURFACE
      ?auto_1357615 - SURFACE
      ?auto_1357619 - SURFACE
      ?auto_1357621 - SURFACE
      ?auto_1357620 - SURFACE
      ?auto_1357622 - SURFACE
      ?auto_1357623 - SURFACE
      ?auto_1357624 - SURFACE
    )
    :vars
    (
      ?auto_1357626 - HOIST
      ?auto_1357628 - PLACE
      ?auto_1357629 - PLACE
      ?auto_1357630 - HOIST
      ?auto_1357625 - SURFACE
      ?auto_1357627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357626 ?auto_1357628 ) ( SURFACE-AT ?auto_1357623 ?auto_1357628 ) ( CLEAR ?auto_1357623 ) ( IS-CRATE ?auto_1357624 ) ( not ( = ?auto_1357623 ?auto_1357624 ) ) ( AVAILABLE ?auto_1357626 ) ( ON ?auto_1357623 ?auto_1357622 ) ( not ( = ?auto_1357622 ?auto_1357623 ) ) ( not ( = ?auto_1357622 ?auto_1357624 ) ) ( not ( = ?auto_1357629 ?auto_1357628 ) ) ( HOIST-AT ?auto_1357630 ?auto_1357629 ) ( not ( = ?auto_1357626 ?auto_1357630 ) ) ( AVAILABLE ?auto_1357630 ) ( SURFACE-AT ?auto_1357624 ?auto_1357629 ) ( ON ?auto_1357624 ?auto_1357625 ) ( CLEAR ?auto_1357624 ) ( not ( = ?auto_1357623 ?auto_1357625 ) ) ( not ( = ?auto_1357624 ?auto_1357625 ) ) ( not ( = ?auto_1357622 ?auto_1357625 ) ) ( TRUCK-AT ?auto_1357627 ?auto_1357628 ) ( ON ?auto_1357617 ?auto_1357616 ) ( ON ?auto_1357618 ?auto_1357617 ) ( ON ?auto_1357615 ?auto_1357618 ) ( ON ?auto_1357619 ?auto_1357615 ) ( ON ?auto_1357621 ?auto_1357619 ) ( ON ?auto_1357620 ?auto_1357621 ) ( ON ?auto_1357622 ?auto_1357620 ) ( not ( = ?auto_1357616 ?auto_1357617 ) ) ( not ( = ?auto_1357616 ?auto_1357618 ) ) ( not ( = ?auto_1357616 ?auto_1357615 ) ) ( not ( = ?auto_1357616 ?auto_1357619 ) ) ( not ( = ?auto_1357616 ?auto_1357621 ) ) ( not ( = ?auto_1357616 ?auto_1357620 ) ) ( not ( = ?auto_1357616 ?auto_1357622 ) ) ( not ( = ?auto_1357616 ?auto_1357623 ) ) ( not ( = ?auto_1357616 ?auto_1357624 ) ) ( not ( = ?auto_1357616 ?auto_1357625 ) ) ( not ( = ?auto_1357617 ?auto_1357618 ) ) ( not ( = ?auto_1357617 ?auto_1357615 ) ) ( not ( = ?auto_1357617 ?auto_1357619 ) ) ( not ( = ?auto_1357617 ?auto_1357621 ) ) ( not ( = ?auto_1357617 ?auto_1357620 ) ) ( not ( = ?auto_1357617 ?auto_1357622 ) ) ( not ( = ?auto_1357617 ?auto_1357623 ) ) ( not ( = ?auto_1357617 ?auto_1357624 ) ) ( not ( = ?auto_1357617 ?auto_1357625 ) ) ( not ( = ?auto_1357618 ?auto_1357615 ) ) ( not ( = ?auto_1357618 ?auto_1357619 ) ) ( not ( = ?auto_1357618 ?auto_1357621 ) ) ( not ( = ?auto_1357618 ?auto_1357620 ) ) ( not ( = ?auto_1357618 ?auto_1357622 ) ) ( not ( = ?auto_1357618 ?auto_1357623 ) ) ( not ( = ?auto_1357618 ?auto_1357624 ) ) ( not ( = ?auto_1357618 ?auto_1357625 ) ) ( not ( = ?auto_1357615 ?auto_1357619 ) ) ( not ( = ?auto_1357615 ?auto_1357621 ) ) ( not ( = ?auto_1357615 ?auto_1357620 ) ) ( not ( = ?auto_1357615 ?auto_1357622 ) ) ( not ( = ?auto_1357615 ?auto_1357623 ) ) ( not ( = ?auto_1357615 ?auto_1357624 ) ) ( not ( = ?auto_1357615 ?auto_1357625 ) ) ( not ( = ?auto_1357619 ?auto_1357621 ) ) ( not ( = ?auto_1357619 ?auto_1357620 ) ) ( not ( = ?auto_1357619 ?auto_1357622 ) ) ( not ( = ?auto_1357619 ?auto_1357623 ) ) ( not ( = ?auto_1357619 ?auto_1357624 ) ) ( not ( = ?auto_1357619 ?auto_1357625 ) ) ( not ( = ?auto_1357621 ?auto_1357620 ) ) ( not ( = ?auto_1357621 ?auto_1357622 ) ) ( not ( = ?auto_1357621 ?auto_1357623 ) ) ( not ( = ?auto_1357621 ?auto_1357624 ) ) ( not ( = ?auto_1357621 ?auto_1357625 ) ) ( not ( = ?auto_1357620 ?auto_1357622 ) ) ( not ( = ?auto_1357620 ?auto_1357623 ) ) ( not ( = ?auto_1357620 ?auto_1357624 ) ) ( not ( = ?auto_1357620 ?auto_1357625 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357622 ?auto_1357623 ?auto_1357624 )
      ( MAKE-9CRATE-VERIFY ?auto_1357616 ?auto_1357617 ?auto_1357618 ?auto_1357615 ?auto_1357619 ?auto_1357621 ?auto_1357620 ?auto_1357622 ?auto_1357623 ?auto_1357624 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357725 - SURFACE
      ?auto_1357726 - SURFACE
      ?auto_1357727 - SURFACE
      ?auto_1357724 - SURFACE
      ?auto_1357728 - SURFACE
      ?auto_1357730 - SURFACE
      ?auto_1357729 - SURFACE
      ?auto_1357731 - SURFACE
      ?auto_1357732 - SURFACE
      ?auto_1357733 - SURFACE
    )
    :vars
    (
      ?auto_1357738 - HOIST
      ?auto_1357736 - PLACE
      ?auto_1357734 - PLACE
      ?auto_1357735 - HOIST
      ?auto_1357739 - SURFACE
      ?auto_1357737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357738 ?auto_1357736 ) ( IS-CRATE ?auto_1357733 ) ( not ( = ?auto_1357732 ?auto_1357733 ) ) ( not ( = ?auto_1357731 ?auto_1357732 ) ) ( not ( = ?auto_1357731 ?auto_1357733 ) ) ( not ( = ?auto_1357734 ?auto_1357736 ) ) ( HOIST-AT ?auto_1357735 ?auto_1357734 ) ( not ( = ?auto_1357738 ?auto_1357735 ) ) ( AVAILABLE ?auto_1357735 ) ( SURFACE-AT ?auto_1357733 ?auto_1357734 ) ( ON ?auto_1357733 ?auto_1357739 ) ( CLEAR ?auto_1357733 ) ( not ( = ?auto_1357732 ?auto_1357739 ) ) ( not ( = ?auto_1357733 ?auto_1357739 ) ) ( not ( = ?auto_1357731 ?auto_1357739 ) ) ( TRUCK-AT ?auto_1357737 ?auto_1357736 ) ( SURFACE-AT ?auto_1357731 ?auto_1357736 ) ( CLEAR ?auto_1357731 ) ( LIFTING ?auto_1357738 ?auto_1357732 ) ( IS-CRATE ?auto_1357732 ) ( ON ?auto_1357726 ?auto_1357725 ) ( ON ?auto_1357727 ?auto_1357726 ) ( ON ?auto_1357724 ?auto_1357727 ) ( ON ?auto_1357728 ?auto_1357724 ) ( ON ?auto_1357730 ?auto_1357728 ) ( ON ?auto_1357729 ?auto_1357730 ) ( ON ?auto_1357731 ?auto_1357729 ) ( not ( = ?auto_1357725 ?auto_1357726 ) ) ( not ( = ?auto_1357725 ?auto_1357727 ) ) ( not ( = ?auto_1357725 ?auto_1357724 ) ) ( not ( = ?auto_1357725 ?auto_1357728 ) ) ( not ( = ?auto_1357725 ?auto_1357730 ) ) ( not ( = ?auto_1357725 ?auto_1357729 ) ) ( not ( = ?auto_1357725 ?auto_1357731 ) ) ( not ( = ?auto_1357725 ?auto_1357732 ) ) ( not ( = ?auto_1357725 ?auto_1357733 ) ) ( not ( = ?auto_1357725 ?auto_1357739 ) ) ( not ( = ?auto_1357726 ?auto_1357727 ) ) ( not ( = ?auto_1357726 ?auto_1357724 ) ) ( not ( = ?auto_1357726 ?auto_1357728 ) ) ( not ( = ?auto_1357726 ?auto_1357730 ) ) ( not ( = ?auto_1357726 ?auto_1357729 ) ) ( not ( = ?auto_1357726 ?auto_1357731 ) ) ( not ( = ?auto_1357726 ?auto_1357732 ) ) ( not ( = ?auto_1357726 ?auto_1357733 ) ) ( not ( = ?auto_1357726 ?auto_1357739 ) ) ( not ( = ?auto_1357727 ?auto_1357724 ) ) ( not ( = ?auto_1357727 ?auto_1357728 ) ) ( not ( = ?auto_1357727 ?auto_1357730 ) ) ( not ( = ?auto_1357727 ?auto_1357729 ) ) ( not ( = ?auto_1357727 ?auto_1357731 ) ) ( not ( = ?auto_1357727 ?auto_1357732 ) ) ( not ( = ?auto_1357727 ?auto_1357733 ) ) ( not ( = ?auto_1357727 ?auto_1357739 ) ) ( not ( = ?auto_1357724 ?auto_1357728 ) ) ( not ( = ?auto_1357724 ?auto_1357730 ) ) ( not ( = ?auto_1357724 ?auto_1357729 ) ) ( not ( = ?auto_1357724 ?auto_1357731 ) ) ( not ( = ?auto_1357724 ?auto_1357732 ) ) ( not ( = ?auto_1357724 ?auto_1357733 ) ) ( not ( = ?auto_1357724 ?auto_1357739 ) ) ( not ( = ?auto_1357728 ?auto_1357730 ) ) ( not ( = ?auto_1357728 ?auto_1357729 ) ) ( not ( = ?auto_1357728 ?auto_1357731 ) ) ( not ( = ?auto_1357728 ?auto_1357732 ) ) ( not ( = ?auto_1357728 ?auto_1357733 ) ) ( not ( = ?auto_1357728 ?auto_1357739 ) ) ( not ( = ?auto_1357730 ?auto_1357729 ) ) ( not ( = ?auto_1357730 ?auto_1357731 ) ) ( not ( = ?auto_1357730 ?auto_1357732 ) ) ( not ( = ?auto_1357730 ?auto_1357733 ) ) ( not ( = ?auto_1357730 ?auto_1357739 ) ) ( not ( = ?auto_1357729 ?auto_1357731 ) ) ( not ( = ?auto_1357729 ?auto_1357732 ) ) ( not ( = ?auto_1357729 ?auto_1357733 ) ) ( not ( = ?auto_1357729 ?auto_1357739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357731 ?auto_1357732 ?auto_1357733 )
      ( MAKE-9CRATE-VERIFY ?auto_1357725 ?auto_1357726 ?auto_1357727 ?auto_1357724 ?auto_1357728 ?auto_1357730 ?auto_1357729 ?auto_1357731 ?auto_1357732 ?auto_1357733 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1357834 - SURFACE
      ?auto_1357835 - SURFACE
      ?auto_1357836 - SURFACE
      ?auto_1357833 - SURFACE
      ?auto_1357837 - SURFACE
      ?auto_1357839 - SURFACE
      ?auto_1357838 - SURFACE
      ?auto_1357840 - SURFACE
      ?auto_1357841 - SURFACE
      ?auto_1357842 - SURFACE
    )
    :vars
    (
      ?auto_1357848 - HOIST
      ?auto_1357843 - PLACE
      ?auto_1357846 - PLACE
      ?auto_1357845 - HOIST
      ?auto_1357844 - SURFACE
      ?auto_1357847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1357848 ?auto_1357843 ) ( IS-CRATE ?auto_1357842 ) ( not ( = ?auto_1357841 ?auto_1357842 ) ) ( not ( = ?auto_1357840 ?auto_1357841 ) ) ( not ( = ?auto_1357840 ?auto_1357842 ) ) ( not ( = ?auto_1357846 ?auto_1357843 ) ) ( HOIST-AT ?auto_1357845 ?auto_1357846 ) ( not ( = ?auto_1357848 ?auto_1357845 ) ) ( AVAILABLE ?auto_1357845 ) ( SURFACE-AT ?auto_1357842 ?auto_1357846 ) ( ON ?auto_1357842 ?auto_1357844 ) ( CLEAR ?auto_1357842 ) ( not ( = ?auto_1357841 ?auto_1357844 ) ) ( not ( = ?auto_1357842 ?auto_1357844 ) ) ( not ( = ?auto_1357840 ?auto_1357844 ) ) ( TRUCK-AT ?auto_1357847 ?auto_1357843 ) ( SURFACE-AT ?auto_1357840 ?auto_1357843 ) ( CLEAR ?auto_1357840 ) ( IS-CRATE ?auto_1357841 ) ( AVAILABLE ?auto_1357848 ) ( IN ?auto_1357841 ?auto_1357847 ) ( ON ?auto_1357835 ?auto_1357834 ) ( ON ?auto_1357836 ?auto_1357835 ) ( ON ?auto_1357833 ?auto_1357836 ) ( ON ?auto_1357837 ?auto_1357833 ) ( ON ?auto_1357839 ?auto_1357837 ) ( ON ?auto_1357838 ?auto_1357839 ) ( ON ?auto_1357840 ?auto_1357838 ) ( not ( = ?auto_1357834 ?auto_1357835 ) ) ( not ( = ?auto_1357834 ?auto_1357836 ) ) ( not ( = ?auto_1357834 ?auto_1357833 ) ) ( not ( = ?auto_1357834 ?auto_1357837 ) ) ( not ( = ?auto_1357834 ?auto_1357839 ) ) ( not ( = ?auto_1357834 ?auto_1357838 ) ) ( not ( = ?auto_1357834 ?auto_1357840 ) ) ( not ( = ?auto_1357834 ?auto_1357841 ) ) ( not ( = ?auto_1357834 ?auto_1357842 ) ) ( not ( = ?auto_1357834 ?auto_1357844 ) ) ( not ( = ?auto_1357835 ?auto_1357836 ) ) ( not ( = ?auto_1357835 ?auto_1357833 ) ) ( not ( = ?auto_1357835 ?auto_1357837 ) ) ( not ( = ?auto_1357835 ?auto_1357839 ) ) ( not ( = ?auto_1357835 ?auto_1357838 ) ) ( not ( = ?auto_1357835 ?auto_1357840 ) ) ( not ( = ?auto_1357835 ?auto_1357841 ) ) ( not ( = ?auto_1357835 ?auto_1357842 ) ) ( not ( = ?auto_1357835 ?auto_1357844 ) ) ( not ( = ?auto_1357836 ?auto_1357833 ) ) ( not ( = ?auto_1357836 ?auto_1357837 ) ) ( not ( = ?auto_1357836 ?auto_1357839 ) ) ( not ( = ?auto_1357836 ?auto_1357838 ) ) ( not ( = ?auto_1357836 ?auto_1357840 ) ) ( not ( = ?auto_1357836 ?auto_1357841 ) ) ( not ( = ?auto_1357836 ?auto_1357842 ) ) ( not ( = ?auto_1357836 ?auto_1357844 ) ) ( not ( = ?auto_1357833 ?auto_1357837 ) ) ( not ( = ?auto_1357833 ?auto_1357839 ) ) ( not ( = ?auto_1357833 ?auto_1357838 ) ) ( not ( = ?auto_1357833 ?auto_1357840 ) ) ( not ( = ?auto_1357833 ?auto_1357841 ) ) ( not ( = ?auto_1357833 ?auto_1357842 ) ) ( not ( = ?auto_1357833 ?auto_1357844 ) ) ( not ( = ?auto_1357837 ?auto_1357839 ) ) ( not ( = ?auto_1357837 ?auto_1357838 ) ) ( not ( = ?auto_1357837 ?auto_1357840 ) ) ( not ( = ?auto_1357837 ?auto_1357841 ) ) ( not ( = ?auto_1357837 ?auto_1357842 ) ) ( not ( = ?auto_1357837 ?auto_1357844 ) ) ( not ( = ?auto_1357839 ?auto_1357838 ) ) ( not ( = ?auto_1357839 ?auto_1357840 ) ) ( not ( = ?auto_1357839 ?auto_1357841 ) ) ( not ( = ?auto_1357839 ?auto_1357842 ) ) ( not ( = ?auto_1357839 ?auto_1357844 ) ) ( not ( = ?auto_1357838 ?auto_1357840 ) ) ( not ( = ?auto_1357838 ?auto_1357841 ) ) ( not ( = ?auto_1357838 ?auto_1357842 ) ) ( not ( = ?auto_1357838 ?auto_1357844 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1357840 ?auto_1357841 ?auto_1357842 )
      ( MAKE-9CRATE-VERIFY ?auto_1357834 ?auto_1357835 ?auto_1357836 ?auto_1357833 ?auto_1357837 ?auto_1357839 ?auto_1357838 ?auto_1357840 ?auto_1357841 ?auto_1357842 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363399 - SURFACE
      ?auto_1363400 - SURFACE
      ?auto_1363401 - SURFACE
      ?auto_1363398 - SURFACE
      ?auto_1363402 - SURFACE
      ?auto_1363404 - SURFACE
      ?auto_1363403 - SURFACE
      ?auto_1363405 - SURFACE
      ?auto_1363406 - SURFACE
      ?auto_1363407 - SURFACE
      ?auto_1363408 - SURFACE
    )
    :vars
    (
      ?auto_1363409 - HOIST
      ?auto_1363410 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363409 ?auto_1363410 ) ( SURFACE-AT ?auto_1363407 ?auto_1363410 ) ( CLEAR ?auto_1363407 ) ( LIFTING ?auto_1363409 ?auto_1363408 ) ( IS-CRATE ?auto_1363408 ) ( not ( = ?auto_1363407 ?auto_1363408 ) ) ( ON ?auto_1363400 ?auto_1363399 ) ( ON ?auto_1363401 ?auto_1363400 ) ( ON ?auto_1363398 ?auto_1363401 ) ( ON ?auto_1363402 ?auto_1363398 ) ( ON ?auto_1363404 ?auto_1363402 ) ( ON ?auto_1363403 ?auto_1363404 ) ( ON ?auto_1363405 ?auto_1363403 ) ( ON ?auto_1363406 ?auto_1363405 ) ( ON ?auto_1363407 ?auto_1363406 ) ( not ( = ?auto_1363399 ?auto_1363400 ) ) ( not ( = ?auto_1363399 ?auto_1363401 ) ) ( not ( = ?auto_1363399 ?auto_1363398 ) ) ( not ( = ?auto_1363399 ?auto_1363402 ) ) ( not ( = ?auto_1363399 ?auto_1363404 ) ) ( not ( = ?auto_1363399 ?auto_1363403 ) ) ( not ( = ?auto_1363399 ?auto_1363405 ) ) ( not ( = ?auto_1363399 ?auto_1363406 ) ) ( not ( = ?auto_1363399 ?auto_1363407 ) ) ( not ( = ?auto_1363399 ?auto_1363408 ) ) ( not ( = ?auto_1363400 ?auto_1363401 ) ) ( not ( = ?auto_1363400 ?auto_1363398 ) ) ( not ( = ?auto_1363400 ?auto_1363402 ) ) ( not ( = ?auto_1363400 ?auto_1363404 ) ) ( not ( = ?auto_1363400 ?auto_1363403 ) ) ( not ( = ?auto_1363400 ?auto_1363405 ) ) ( not ( = ?auto_1363400 ?auto_1363406 ) ) ( not ( = ?auto_1363400 ?auto_1363407 ) ) ( not ( = ?auto_1363400 ?auto_1363408 ) ) ( not ( = ?auto_1363401 ?auto_1363398 ) ) ( not ( = ?auto_1363401 ?auto_1363402 ) ) ( not ( = ?auto_1363401 ?auto_1363404 ) ) ( not ( = ?auto_1363401 ?auto_1363403 ) ) ( not ( = ?auto_1363401 ?auto_1363405 ) ) ( not ( = ?auto_1363401 ?auto_1363406 ) ) ( not ( = ?auto_1363401 ?auto_1363407 ) ) ( not ( = ?auto_1363401 ?auto_1363408 ) ) ( not ( = ?auto_1363398 ?auto_1363402 ) ) ( not ( = ?auto_1363398 ?auto_1363404 ) ) ( not ( = ?auto_1363398 ?auto_1363403 ) ) ( not ( = ?auto_1363398 ?auto_1363405 ) ) ( not ( = ?auto_1363398 ?auto_1363406 ) ) ( not ( = ?auto_1363398 ?auto_1363407 ) ) ( not ( = ?auto_1363398 ?auto_1363408 ) ) ( not ( = ?auto_1363402 ?auto_1363404 ) ) ( not ( = ?auto_1363402 ?auto_1363403 ) ) ( not ( = ?auto_1363402 ?auto_1363405 ) ) ( not ( = ?auto_1363402 ?auto_1363406 ) ) ( not ( = ?auto_1363402 ?auto_1363407 ) ) ( not ( = ?auto_1363402 ?auto_1363408 ) ) ( not ( = ?auto_1363404 ?auto_1363403 ) ) ( not ( = ?auto_1363404 ?auto_1363405 ) ) ( not ( = ?auto_1363404 ?auto_1363406 ) ) ( not ( = ?auto_1363404 ?auto_1363407 ) ) ( not ( = ?auto_1363404 ?auto_1363408 ) ) ( not ( = ?auto_1363403 ?auto_1363405 ) ) ( not ( = ?auto_1363403 ?auto_1363406 ) ) ( not ( = ?auto_1363403 ?auto_1363407 ) ) ( not ( = ?auto_1363403 ?auto_1363408 ) ) ( not ( = ?auto_1363405 ?auto_1363406 ) ) ( not ( = ?auto_1363405 ?auto_1363407 ) ) ( not ( = ?auto_1363405 ?auto_1363408 ) ) ( not ( = ?auto_1363406 ?auto_1363407 ) ) ( not ( = ?auto_1363406 ?auto_1363408 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1363407 ?auto_1363408 )
      ( MAKE-10CRATE-VERIFY ?auto_1363399 ?auto_1363400 ?auto_1363401 ?auto_1363398 ?auto_1363402 ?auto_1363404 ?auto_1363403 ?auto_1363405 ?auto_1363406 ?auto_1363407 ?auto_1363408 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363493 - SURFACE
      ?auto_1363494 - SURFACE
      ?auto_1363495 - SURFACE
      ?auto_1363492 - SURFACE
      ?auto_1363496 - SURFACE
      ?auto_1363498 - SURFACE
      ?auto_1363497 - SURFACE
      ?auto_1363499 - SURFACE
      ?auto_1363500 - SURFACE
      ?auto_1363501 - SURFACE
      ?auto_1363502 - SURFACE
    )
    :vars
    (
      ?auto_1363503 - HOIST
      ?auto_1363504 - PLACE
      ?auto_1363505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363503 ?auto_1363504 ) ( SURFACE-AT ?auto_1363501 ?auto_1363504 ) ( CLEAR ?auto_1363501 ) ( IS-CRATE ?auto_1363502 ) ( not ( = ?auto_1363501 ?auto_1363502 ) ) ( TRUCK-AT ?auto_1363505 ?auto_1363504 ) ( AVAILABLE ?auto_1363503 ) ( IN ?auto_1363502 ?auto_1363505 ) ( ON ?auto_1363501 ?auto_1363500 ) ( not ( = ?auto_1363500 ?auto_1363501 ) ) ( not ( = ?auto_1363500 ?auto_1363502 ) ) ( ON ?auto_1363494 ?auto_1363493 ) ( ON ?auto_1363495 ?auto_1363494 ) ( ON ?auto_1363492 ?auto_1363495 ) ( ON ?auto_1363496 ?auto_1363492 ) ( ON ?auto_1363498 ?auto_1363496 ) ( ON ?auto_1363497 ?auto_1363498 ) ( ON ?auto_1363499 ?auto_1363497 ) ( ON ?auto_1363500 ?auto_1363499 ) ( not ( = ?auto_1363493 ?auto_1363494 ) ) ( not ( = ?auto_1363493 ?auto_1363495 ) ) ( not ( = ?auto_1363493 ?auto_1363492 ) ) ( not ( = ?auto_1363493 ?auto_1363496 ) ) ( not ( = ?auto_1363493 ?auto_1363498 ) ) ( not ( = ?auto_1363493 ?auto_1363497 ) ) ( not ( = ?auto_1363493 ?auto_1363499 ) ) ( not ( = ?auto_1363493 ?auto_1363500 ) ) ( not ( = ?auto_1363493 ?auto_1363501 ) ) ( not ( = ?auto_1363493 ?auto_1363502 ) ) ( not ( = ?auto_1363494 ?auto_1363495 ) ) ( not ( = ?auto_1363494 ?auto_1363492 ) ) ( not ( = ?auto_1363494 ?auto_1363496 ) ) ( not ( = ?auto_1363494 ?auto_1363498 ) ) ( not ( = ?auto_1363494 ?auto_1363497 ) ) ( not ( = ?auto_1363494 ?auto_1363499 ) ) ( not ( = ?auto_1363494 ?auto_1363500 ) ) ( not ( = ?auto_1363494 ?auto_1363501 ) ) ( not ( = ?auto_1363494 ?auto_1363502 ) ) ( not ( = ?auto_1363495 ?auto_1363492 ) ) ( not ( = ?auto_1363495 ?auto_1363496 ) ) ( not ( = ?auto_1363495 ?auto_1363498 ) ) ( not ( = ?auto_1363495 ?auto_1363497 ) ) ( not ( = ?auto_1363495 ?auto_1363499 ) ) ( not ( = ?auto_1363495 ?auto_1363500 ) ) ( not ( = ?auto_1363495 ?auto_1363501 ) ) ( not ( = ?auto_1363495 ?auto_1363502 ) ) ( not ( = ?auto_1363492 ?auto_1363496 ) ) ( not ( = ?auto_1363492 ?auto_1363498 ) ) ( not ( = ?auto_1363492 ?auto_1363497 ) ) ( not ( = ?auto_1363492 ?auto_1363499 ) ) ( not ( = ?auto_1363492 ?auto_1363500 ) ) ( not ( = ?auto_1363492 ?auto_1363501 ) ) ( not ( = ?auto_1363492 ?auto_1363502 ) ) ( not ( = ?auto_1363496 ?auto_1363498 ) ) ( not ( = ?auto_1363496 ?auto_1363497 ) ) ( not ( = ?auto_1363496 ?auto_1363499 ) ) ( not ( = ?auto_1363496 ?auto_1363500 ) ) ( not ( = ?auto_1363496 ?auto_1363501 ) ) ( not ( = ?auto_1363496 ?auto_1363502 ) ) ( not ( = ?auto_1363498 ?auto_1363497 ) ) ( not ( = ?auto_1363498 ?auto_1363499 ) ) ( not ( = ?auto_1363498 ?auto_1363500 ) ) ( not ( = ?auto_1363498 ?auto_1363501 ) ) ( not ( = ?auto_1363498 ?auto_1363502 ) ) ( not ( = ?auto_1363497 ?auto_1363499 ) ) ( not ( = ?auto_1363497 ?auto_1363500 ) ) ( not ( = ?auto_1363497 ?auto_1363501 ) ) ( not ( = ?auto_1363497 ?auto_1363502 ) ) ( not ( = ?auto_1363499 ?auto_1363500 ) ) ( not ( = ?auto_1363499 ?auto_1363501 ) ) ( not ( = ?auto_1363499 ?auto_1363502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363500 ?auto_1363501 ?auto_1363502 )
      ( MAKE-10CRATE-VERIFY ?auto_1363493 ?auto_1363494 ?auto_1363495 ?auto_1363492 ?auto_1363496 ?auto_1363498 ?auto_1363497 ?auto_1363499 ?auto_1363500 ?auto_1363501 ?auto_1363502 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363598 - SURFACE
      ?auto_1363599 - SURFACE
      ?auto_1363600 - SURFACE
      ?auto_1363597 - SURFACE
      ?auto_1363601 - SURFACE
      ?auto_1363603 - SURFACE
      ?auto_1363602 - SURFACE
      ?auto_1363604 - SURFACE
      ?auto_1363605 - SURFACE
      ?auto_1363606 - SURFACE
      ?auto_1363607 - SURFACE
    )
    :vars
    (
      ?auto_1363610 - HOIST
      ?auto_1363608 - PLACE
      ?auto_1363609 - TRUCK
      ?auto_1363611 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363610 ?auto_1363608 ) ( SURFACE-AT ?auto_1363606 ?auto_1363608 ) ( CLEAR ?auto_1363606 ) ( IS-CRATE ?auto_1363607 ) ( not ( = ?auto_1363606 ?auto_1363607 ) ) ( AVAILABLE ?auto_1363610 ) ( IN ?auto_1363607 ?auto_1363609 ) ( ON ?auto_1363606 ?auto_1363605 ) ( not ( = ?auto_1363605 ?auto_1363606 ) ) ( not ( = ?auto_1363605 ?auto_1363607 ) ) ( TRUCK-AT ?auto_1363609 ?auto_1363611 ) ( not ( = ?auto_1363611 ?auto_1363608 ) ) ( ON ?auto_1363599 ?auto_1363598 ) ( ON ?auto_1363600 ?auto_1363599 ) ( ON ?auto_1363597 ?auto_1363600 ) ( ON ?auto_1363601 ?auto_1363597 ) ( ON ?auto_1363603 ?auto_1363601 ) ( ON ?auto_1363602 ?auto_1363603 ) ( ON ?auto_1363604 ?auto_1363602 ) ( ON ?auto_1363605 ?auto_1363604 ) ( not ( = ?auto_1363598 ?auto_1363599 ) ) ( not ( = ?auto_1363598 ?auto_1363600 ) ) ( not ( = ?auto_1363598 ?auto_1363597 ) ) ( not ( = ?auto_1363598 ?auto_1363601 ) ) ( not ( = ?auto_1363598 ?auto_1363603 ) ) ( not ( = ?auto_1363598 ?auto_1363602 ) ) ( not ( = ?auto_1363598 ?auto_1363604 ) ) ( not ( = ?auto_1363598 ?auto_1363605 ) ) ( not ( = ?auto_1363598 ?auto_1363606 ) ) ( not ( = ?auto_1363598 ?auto_1363607 ) ) ( not ( = ?auto_1363599 ?auto_1363600 ) ) ( not ( = ?auto_1363599 ?auto_1363597 ) ) ( not ( = ?auto_1363599 ?auto_1363601 ) ) ( not ( = ?auto_1363599 ?auto_1363603 ) ) ( not ( = ?auto_1363599 ?auto_1363602 ) ) ( not ( = ?auto_1363599 ?auto_1363604 ) ) ( not ( = ?auto_1363599 ?auto_1363605 ) ) ( not ( = ?auto_1363599 ?auto_1363606 ) ) ( not ( = ?auto_1363599 ?auto_1363607 ) ) ( not ( = ?auto_1363600 ?auto_1363597 ) ) ( not ( = ?auto_1363600 ?auto_1363601 ) ) ( not ( = ?auto_1363600 ?auto_1363603 ) ) ( not ( = ?auto_1363600 ?auto_1363602 ) ) ( not ( = ?auto_1363600 ?auto_1363604 ) ) ( not ( = ?auto_1363600 ?auto_1363605 ) ) ( not ( = ?auto_1363600 ?auto_1363606 ) ) ( not ( = ?auto_1363600 ?auto_1363607 ) ) ( not ( = ?auto_1363597 ?auto_1363601 ) ) ( not ( = ?auto_1363597 ?auto_1363603 ) ) ( not ( = ?auto_1363597 ?auto_1363602 ) ) ( not ( = ?auto_1363597 ?auto_1363604 ) ) ( not ( = ?auto_1363597 ?auto_1363605 ) ) ( not ( = ?auto_1363597 ?auto_1363606 ) ) ( not ( = ?auto_1363597 ?auto_1363607 ) ) ( not ( = ?auto_1363601 ?auto_1363603 ) ) ( not ( = ?auto_1363601 ?auto_1363602 ) ) ( not ( = ?auto_1363601 ?auto_1363604 ) ) ( not ( = ?auto_1363601 ?auto_1363605 ) ) ( not ( = ?auto_1363601 ?auto_1363606 ) ) ( not ( = ?auto_1363601 ?auto_1363607 ) ) ( not ( = ?auto_1363603 ?auto_1363602 ) ) ( not ( = ?auto_1363603 ?auto_1363604 ) ) ( not ( = ?auto_1363603 ?auto_1363605 ) ) ( not ( = ?auto_1363603 ?auto_1363606 ) ) ( not ( = ?auto_1363603 ?auto_1363607 ) ) ( not ( = ?auto_1363602 ?auto_1363604 ) ) ( not ( = ?auto_1363602 ?auto_1363605 ) ) ( not ( = ?auto_1363602 ?auto_1363606 ) ) ( not ( = ?auto_1363602 ?auto_1363607 ) ) ( not ( = ?auto_1363604 ?auto_1363605 ) ) ( not ( = ?auto_1363604 ?auto_1363606 ) ) ( not ( = ?auto_1363604 ?auto_1363607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363605 ?auto_1363606 ?auto_1363607 )
      ( MAKE-10CRATE-VERIFY ?auto_1363598 ?auto_1363599 ?auto_1363600 ?auto_1363597 ?auto_1363601 ?auto_1363603 ?auto_1363602 ?auto_1363604 ?auto_1363605 ?auto_1363606 ?auto_1363607 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363713 - SURFACE
      ?auto_1363714 - SURFACE
      ?auto_1363715 - SURFACE
      ?auto_1363712 - SURFACE
      ?auto_1363716 - SURFACE
      ?auto_1363718 - SURFACE
      ?auto_1363717 - SURFACE
      ?auto_1363719 - SURFACE
      ?auto_1363720 - SURFACE
      ?auto_1363721 - SURFACE
      ?auto_1363722 - SURFACE
    )
    :vars
    (
      ?auto_1363727 - HOIST
      ?auto_1363723 - PLACE
      ?auto_1363725 - TRUCK
      ?auto_1363724 - PLACE
      ?auto_1363726 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363727 ?auto_1363723 ) ( SURFACE-AT ?auto_1363721 ?auto_1363723 ) ( CLEAR ?auto_1363721 ) ( IS-CRATE ?auto_1363722 ) ( not ( = ?auto_1363721 ?auto_1363722 ) ) ( AVAILABLE ?auto_1363727 ) ( ON ?auto_1363721 ?auto_1363720 ) ( not ( = ?auto_1363720 ?auto_1363721 ) ) ( not ( = ?auto_1363720 ?auto_1363722 ) ) ( TRUCK-AT ?auto_1363725 ?auto_1363724 ) ( not ( = ?auto_1363724 ?auto_1363723 ) ) ( HOIST-AT ?auto_1363726 ?auto_1363724 ) ( LIFTING ?auto_1363726 ?auto_1363722 ) ( not ( = ?auto_1363727 ?auto_1363726 ) ) ( ON ?auto_1363714 ?auto_1363713 ) ( ON ?auto_1363715 ?auto_1363714 ) ( ON ?auto_1363712 ?auto_1363715 ) ( ON ?auto_1363716 ?auto_1363712 ) ( ON ?auto_1363718 ?auto_1363716 ) ( ON ?auto_1363717 ?auto_1363718 ) ( ON ?auto_1363719 ?auto_1363717 ) ( ON ?auto_1363720 ?auto_1363719 ) ( not ( = ?auto_1363713 ?auto_1363714 ) ) ( not ( = ?auto_1363713 ?auto_1363715 ) ) ( not ( = ?auto_1363713 ?auto_1363712 ) ) ( not ( = ?auto_1363713 ?auto_1363716 ) ) ( not ( = ?auto_1363713 ?auto_1363718 ) ) ( not ( = ?auto_1363713 ?auto_1363717 ) ) ( not ( = ?auto_1363713 ?auto_1363719 ) ) ( not ( = ?auto_1363713 ?auto_1363720 ) ) ( not ( = ?auto_1363713 ?auto_1363721 ) ) ( not ( = ?auto_1363713 ?auto_1363722 ) ) ( not ( = ?auto_1363714 ?auto_1363715 ) ) ( not ( = ?auto_1363714 ?auto_1363712 ) ) ( not ( = ?auto_1363714 ?auto_1363716 ) ) ( not ( = ?auto_1363714 ?auto_1363718 ) ) ( not ( = ?auto_1363714 ?auto_1363717 ) ) ( not ( = ?auto_1363714 ?auto_1363719 ) ) ( not ( = ?auto_1363714 ?auto_1363720 ) ) ( not ( = ?auto_1363714 ?auto_1363721 ) ) ( not ( = ?auto_1363714 ?auto_1363722 ) ) ( not ( = ?auto_1363715 ?auto_1363712 ) ) ( not ( = ?auto_1363715 ?auto_1363716 ) ) ( not ( = ?auto_1363715 ?auto_1363718 ) ) ( not ( = ?auto_1363715 ?auto_1363717 ) ) ( not ( = ?auto_1363715 ?auto_1363719 ) ) ( not ( = ?auto_1363715 ?auto_1363720 ) ) ( not ( = ?auto_1363715 ?auto_1363721 ) ) ( not ( = ?auto_1363715 ?auto_1363722 ) ) ( not ( = ?auto_1363712 ?auto_1363716 ) ) ( not ( = ?auto_1363712 ?auto_1363718 ) ) ( not ( = ?auto_1363712 ?auto_1363717 ) ) ( not ( = ?auto_1363712 ?auto_1363719 ) ) ( not ( = ?auto_1363712 ?auto_1363720 ) ) ( not ( = ?auto_1363712 ?auto_1363721 ) ) ( not ( = ?auto_1363712 ?auto_1363722 ) ) ( not ( = ?auto_1363716 ?auto_1363718 ) ) ( not ( = ?auto_1363716 ?auto_1363717 ) ) ( not ( = ?auto_1363716 ?auto_1363719 ) ) ( not ( = ?auto_1363716 ?auto_1363720 ) ) ( not ( = ?auto_1363716 ?auto_1363721 ) ) ( not ( = ?auto_1363716 ?auto_1363722 ) ) ( not ( = ?auto_1363718 ?auto_1363717 ) ) ( not ( = ?auto_1363718 ?auto_1363719 ) ) ( not ( = ?auto_1363718 ?auto_1363720 ) ) ( not ( = ?auto_1363718 ?auto_1363721 ) ) ( not ( = ?auto_1363718 ?auto_1363722 ) ) ( not ( = ?auto_1363717 ?auto_1363719 ) ) ( not ( = ?auto_1363717 ?auto_1363720 ) ) ( not ( = ?auto_1363717 ?auto_1363721 ) ) ( not ( = ?auto_1363717 ?auto_1363722 ) ) ( not ( = ?auto_1363719 ?auto_1363720 ) ) ( not ( = ?auto_1363719 ?auto_1363721 ) ) ( not ( = ?auto_1363719 ?auto_1363722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363720 ?auto_1363721 ?auto_1363722 )
      ( MAKE-10CRATE-VERIFY ?auto_1363713 ?auto_1363714 ?auto_1363715 ?auto_1363712 ?auto_1363716 ?auto_1363718 ?auto_1363717 ?auto_1363719 ?auto_1363720 ?auto_1363721 ?auto_1363722 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363838 - SURFACE
      ?auto_1363839 - SURFACE
      ?auto_1363840 - SURFACE
      ?auto_1363837 - SURFACE
      ?auto_1363841 - SURFACE
      ?auto_1363843 - SURFACE
      ?auto_1363842 - SURFACE
      ?auto_1363844 - SURFACE
      ?auto_1363845 - SURFACE
      ?auto_1363846 - SURFACE
      ?auto_1363847 - SURFACE
    )
    :vars
    (
      ?auto_1363853 - HOIST
      ?auto_1363851 - PLACE
      ?auto_1363849 - TRUCK
      ?auto_1363848 - PLACE
      ?auto_1363850 - HOIST
      ?auto_1363852 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363853 ?auto_1363851 ) ( SURFACE-AT ?auto_1363846 ?auto_1363851 ) ( CLEAR ?auto_1363846 ) ( IS-CRATE ?auto_1363847 ) ( not ( = ?auto_1363846 ?auto_1363847 ) ) ( AVAILABLE ?auto_1363853 ) ( ON ?auto_1363846 ?auto_1363845 ) ( not ( = ?auto_1363845 ?auto_1363846 ) ) ( not ( = ?auto_1363845 ?auto_1363847 ) ) ( TRUCK-AT ?auto_1363849 ?auto_1363848 ) ( not ( = ?auto_1363848 ?auto_1363851 ) ) ( HOIST-AT ?auto_1363850 ?auto_1363848 ) ( not ( = ?auto_1363853 ?auto_1363850 ) ) ( AVAILABLE ?auto_1363850 ) ( SURFACE-AT ?auto_1363847 ?auto_1363848 ) ( ON ?auto_1363847 ?auto_1363852 ) ( CLEAR ?auto_1363847 ) ( not ( = ?auto_1363846 ?auto_1363852 ) ) ( not ( = ?auto_1363847 ?auto_1363852 ) ) ( not ( = ?auto_1363845 ?auto_1363852 ) ) ( ON ?auto_1363839 ?auto_1363838 ) ( ON ?auto_1363840 ?auto_1363839 ) ( ON ?auto_1363837 ?auto_1363840 ) ( ON ?auto_1363841 ?auto_1363837 ) ( ON ?auto_1363843 ?auto_1363841 ) ( ON ?auto_1363842 ?auto_1363843 ) ( ON ?auto_1363844 ?auto_1363842 ) ( ON ?auto_1363845 ?auto_1363844 ) ( not ( = ?auto_1363838 ?auto_1363839 ) ) ( not ( = ?auto_1363838 ?auto_1363840 ) ) ( not ( = ?auto_1363838 ?auto_1363837 ) ) ( not ( = ?auto_1363838 ?auto_1363841 ) ) ( not ( = ?auto_1363838 ?auto_1363843 ) ) ( not ( = ?auto_1363838 ?auto_1363842 ) ) ( not ( = ?auto_1363838 ?auto_1363844 ) ) ( not ( = ?auto_1363838 ?auto_1363845 ) ) ( not ( = ?auto_1363838 ?auto_1363846 ) ) ( not ( = ?auto_1363838 ?auto_1363847 ) ) ( not ( = ?auto_1363838 ?auto_1363852 ) ) ( not ( = ?auto_1363839 ?auto_1363840 ) ) ( not ( = ?auto_1363839 ?auto_1363837 ) ) ( not ( = ?auto_1363839 ?auto_1363841 ) ) ( not ( = ?auto_1363839 ?auto_1363843 ) ) ( not ( = ?auto_1363839 ?auto_1363842 ) ) ( not ( = ?auto_1363839 ?auto_1363844 ) ) ( not ( = ?auto_1363839 ?auto_1363845 ) ) ( not ( = ?auto_1363839 ?auto_1363846 ) ) ( not ( = ?auto_1363839 ?auto_1363847 ) ) ( not ( = ?auto_1363839 ?auto_1363852 ) ) ( not ( = ?auto_1363840 ?auto_1363837 ) ) ( not ( = ?auto_1363840 ?auto_1363841 ) ) ( not ( = ?auto_1363840 ?auto_1363843 ) ) ( not ( = ?auto_1363840 ?auto_1363842 ) ) ( not ( = ?auto_1363840 ?auto_1363844 ) ) ( not ( = ?auto_1363840 ?auto_1363845 ) ) ( not ( = ?auto_1363840 ?auto_1363846 ) ) ( not ( = ?auto_1363840 ?auto_1363847 ) ) ( not ( = ?auto_1363840 ?auto_1363852 ) ) ( not ( = ?auto_1363837 ?auto_1363841 ) ) ( not ( = ?auto_1363837 ?auto_1363843 ) ) ( not ( = ?auto_1363837 ?auto_1363842 ) ) ( not ( = ?auto_1363837 ?auto_1363844 ) ) ( not ( = ?auto_1363837 ?auto_1363845 ) ) ( not ( = ?auto_1363837 ?auto_1363846 ) ) ( not ( = ?auto_1363837 ?auto_1363847 ) ) ( not ( = ?auto_1363837 ?auto_1363852 ) ) ( not ( = ?auto_1363841 ?auto_1363843 ) ) ( not ( = ?auto_1363841 ?auto_1363842 ) ) ( not ( = ?auto_1363841 ?auto_1363844 ) ) ( not ( = ?auto_1363841 ?auto_1363845 ) ) ( not ( = ?auto_1363841 ?auto_1363846 ) ) ( not ( = ?auto_1363841 ?auto_1363847 ) ) ( not ( = ?auto_1363841 ?auto_1363852 ) ) ( not ( = ?auto_1363843 ?auto_1363842 ) ) ( not ( = ?auto_1363843 ?auto_1363844 ) ) ( not ( = ?auto_1363843 ?auto_1363845 ) ) ( not ( = ?auto_1363843 ?auto_1363846 ) ) ( not ( = ?auto_1363843 ?auto_1363847 ) ) ( not ( = ?auto_1363843 ?auto_1363852 ) ) ( not ( = ?auto_1363842 ?auto_1363844 ) ) ( not ( = ?auto_1363842 ?auto_1363845 ) ) ( not ( = ?auto_1363842 ?auto_1363846 ) ) ( not ( = ?auto_1363842 ?auto_1363847 ) ) ( not ( = ?auto_1363842 ?auto_1363852 ) ) ( not ( = ?auto_1363844 ?auto_1363845 ) ) ( not ( = ?auto_1363844 ?auto_1363846 ) ) ( not ( = ?auto_1363844 ?auto_1363847 ) ) ( not ( = ?auto_1363844 ?auto_1363852 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363845 ?auto_1363846 ?auto_1363847 )
      ( MAKE-10CRATE-VERIFY ?auto_1363838 ?auto_1363839 ?auto_1363840 ?auto_1363837 ?auto_1363841 ?auto_1363843 ?auto_1363842 ?auto_1363844 ?auto_1363845 ?auto_1363846 ?auto_1363847 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1363964 - SURFACE
      ?auto_1363965 - SURFACE
      ?auto_1363966 - SURFACE
      ?auto_1363963 - SURFACE
      ?auto_1363967 - SURFACE
      ?auto_1363969 - SURFACE
      ?auto_1363968 - SURFACE
      ?auto_1363970 - SURFACE
      ?auto_1363971 - SURFACE
      ?auto_1363972 - SURFACE
      ?auto_1363973 - SURFACE
    )
    :vars
    (
      ?auto_1363978 - HOIST
      ?auto_1363977 - PLACE
      ?auto_1363979 - PLACE
      ?auto_1363975 - HOIST
      ?auto_1363976 - SURFACE
      ?auto_1363974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363978 ?auto_1363977 ) ( SURFACE-AT ?auto_1363972 ?auto_1363977 ) ( CLEAR ?auto_1363972 ) ( IS-CRATE ?auto_1363973 ) ( not ( = ?auto_1363972 ?auto_1363973 ) ) ( AVAILABLE ?auto_1363978 ) ( ON ?auto_1363972 ?auto_1363971 ) ( not ( = ?auto_1363971 ?auto_1363972 ) ) ( not ( = ?auto_1363971 ?auto_1363973 ) ) ( not ( = ?auto_1363979 ?auto_1363977 ) ) ( HOIST-AT ?auto_1363975 ?auto_1363979 ) ( not ( = ?auto_1363978 ?auto_1363975 ) ) ( AVAILABLE ?auto_1363975 ) ( SURFACE-AT ?auto_1363973 ?auto_1363979 ) ( ON ?auto_1363973 ?auto_1363976 ) ( CLEAR ?auto_1363973 ) ( not ( = ?auto_1363972 ?auto_1363976 ) ) ( not ( = ?auto_1363973 ?auto_1363976 ) ) ( not ( = ?auto_1363971 ?auto_1363976 ) ) ( TRUCK-AT ?auto_1363974 ?auto_1363977 ) ( ON ?auto_1363965 ?auto_1363964 ) ( ON ?auto_1363966 ?auto_1363965 ) ( ON ?auto_1363963 ?auto_1363966 ) ( ON ?auto_1363967 ?auto_1363963 ) ( ON ?auto_1363969 ?auto_1363967 ) ( ON ?auto_1363968 ?auto_1363969 ) ( ON ?auto_1363970 ?auto_1363968 ) ( ON ?auto_1363971 ?auto_1363970 ) ( not ( = ?auto_1363964 ?auto_1363965 ) ) ( not ( = ?auto_1363964 ?auto_1363966 ) ) ( not ( = ?auto_1363964 ?auto_1363963 ) ) ( not ( = ?auto_1363964 ?auto_1363967 ) ) ( not ( = ?auto_1363964 ?auto_1363969 ) ) ( not ( = ?auto_1363964 ?auto_1363968 ) ) ( not ( = ?auto_1363964 ?auto_1363970 ) ) ( not ( = ?auto_1363964 ?auto_1363971 ) ) ( not ( = ?auto_1363964 ?auto_1363972 ) ) ( not ( = ?auto_1363964 ?auto_1363973 ) ) ( not ( = ?auto_1363964 ?auto_1363976 ) ) ( not ( = ?auto_1363965 ?auto_1363966 ) ) ( not ( = ?auto_1363965 ?auto_1363963 ) ) ( not ( = ?auto_1363965 ?auto_1363967 ) ) ( not ( = ?auto_1363965 ?auto_1363969 ) ) ( not ( = ?auto_1363965 ?auto_1363968 ) ) ( not ( = ?auto_1363965 ?auto_1363970 ) ) ( not ( = ?auto_1363965 ?auto_1363971 ) ) ( not ( = ?auto_1363965 ?auto_1363972 ) ) ( not ( = ?auto_1363965 ?auto_1363973 ) ) ( not ( = ?auto_1363965 ?auto_1363976 ) ) ( not ( = ?auto_1363966 ?auto_1363963 ) ) ( not ( = ?auto_1363966 ?auto_1363967 ) ) ( not ( = ?auto_1363966 ?auto_1363969 ) ) ( not ( = ?auto_1363966 ?auto_1363968 ) ) ( not ( = ?auto_1363966 ?auto_1363970 ) ) ( not ( = ?auto_1363966 ?auto_1363971 ) ) ( not ( = ?auto_1363966 ?auto_1363972 ) ) ( not ( = ?auto_1363966 ?auto_1363973 ) ) ( not ( = ?auto_1363966 ?auto_1363976 ) ) ( not ( = ?auto_1363963 ?auto_1363967 ) ) ( not ( = ?auto_1363963 ?auto_1363969 ) ) ( not ( = ?auto_1363963 ?auto_1363968 ) ) ( not ( = ?auto_1363963 ?auto_1363970 ) ) ( not ( = ?auto_1363963 ?auto_1363971 ) ) ( not ( = ?auto_1363963 ?auto_1363972 ) ) ( not ( = ?auto_1363963 ?auto_1363973 ) ) ( not ( = ?auto_1363963 ?auto_1363976 ) ) ( not ( = ?auto_1363967 ?auto_1363969 ) ) ( not ( = ?auto_1363967 ?auto_1363968 ) ) ( not ( = ?auto_1363967 ?auto_1363970 ) ) ( not ( = ?auto_1363967 ?auto_1363971 ) ) ( not ( = ?auto_1363967 ?auto_1363972 ) ) ( not ( = ?auto_1363967 ?auto_1363973 ) ) ( not ( = ?auto_1363967 ?auto_1363976 ) ) ( not ( = ?auto_1363969 ?auto_1363968 ) ) ( not ( = ?auto_1363969 ?auto_1363970 ) ) ( not ( = ?auto_1363969 ?auto_1363971 ) ) ( not ( = ?auto_1363969 ?auto_1363972 ) ) ( not ( = ?auto_1363969 ?auto_1363973 ) ) ( not ( = ?auto_1363969 ?auto_1363976 ) ) ( not ( = ?auto_1363968 ?auto_1363970 ) ) ( not ( = ?auto_1363968 ?auto_1363971 ) ) ( not ( = ?auto_1363968 ?auto_1363972 ) ) ( not ( = ?auto_1363968 ?auto_1363973 ) ) ( not ( = ?auto_1363968 ?auto_1363976 ) ) ( not ( = ?auto_1363970 ?auto_1363971 ) ) ( not ( = ?auto_1363970 ?auto_1363972 ) ) ( not ( = ?auto_1363970 ?auto_1363973 ) ) ( not ( = ?auto_1363970 ?auto_1363976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1363971 ?auto_1363972 ?auto_1363973 )
      ( MAKE-10CRATE-VERIFY ?auto_1363964 ?auto_1363965 ?auto_1363966 ?auto_1363963 ?auto_1363967 ?auto_1363969 ?auto_1363968 ?auto_1363970 ?auto_1363971 ?auto_1363972 ?auto_1363973 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1364090 - SURFACE
      ?auto_1364091 - SURFACE
      ?auto_1364092 - SURFACE
      ?auto_1364089 - SURFACE
      ?auto_1364093 - SURFACE
      ?auto_1364095 - SURFACE
      ?auto_1364094 - SURFACE
      ?auto_1364096 - SURFACE
      ?auto_1364097 - SURFACE
      ?auto_1364098 - SURFACE
      ?auto_1364099 - SURFACE
    )
    :vars
    (
      ?auto_1364101 - HOIST
      ?auto_1364100 - PLACE
      ?auto_1364103 - PLACE
      ?auto_1364102 - HOIST
      ?auto_1364105 - SURFACE
      ?auto_1364104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1364101 ?auto_1364100 ) ( IS-CRATE ?auto_1364099 ) ( not ( = ?auto_1364098 ?auto_1364099 ) ) ( not ( = ?auto_1364097 ?auto_1364098 ) ) ( not ( = ?auto_1364097 ?auto_1364099 ) ) ( not ( = ?auto_1364103 ?auto_1364100 ) ) ( HOIST-AT ?auto_1364102 ?auto_1364103 ) ( not ( = ?auto_1364101 ?auto_1364102 ) ) ( AVAILABLE ?auto_1364102 ) ( SURFACE-AT ?auto_1364099 ?auto_1364103 ) ( ON ?auto_1364099 ?auto_1364105 ) ( CLEAR ?auto_1364099 ) ( not ( = ?auto_1364098 ?auto_1364105 ) ) ( not ( = ?auto_1364099 ?auto_1364105 ) ) ( not ( = ?auto_1364097 ?auto_1364105 ) ) ( TRUCK-AT ?auto_1364104 ?auto_1364100 ) ( SURFACE-AT ?auto_1364097 ?auto_1364100 ) ( CLEAR ?auto_1364097 ) ( LIFTING ?auto_1364101 ?auto_1364098 ) ( IS-CRATE ?auto_1364098 ) ( ON ?auto_1364091 ?auto_1364090 ) ( ON ?auto_1364092 ?auto_1364091 ) ( ON ?auto_1364089 ?auto_1364092 ) ( ON ?auto_1364093 ?auto_1364089 ) ( ON ?auto_1364095 ?auto_1364093 ) ( ON ?auto_1364094 ?auto_1364095 ) ( ON ?auto_1364096 ?auto_1364094 ) ( ON ?auto_1364097 ?auto_1364096 ) ( not ( = ?auto_1364090 ?auto_1364091 ) ) ( not ( = ?auto_1364090 ?auto_1364092 ) ) ( not ( = ?auto_1364090 ?auto_1364089 ) ) ( not ( = ?auto_1364090 ?auto_1364093 ) ) ( not ( = ?auto_1364090 ?auto_1364095 ) ) ( not ( = ?auto_1364090 ?auto_1364094 ) ) ( not ( = ?auto_1364090 ?auto_1364096 ) ) ( not ( = ?auto_1364090 ?auto_1364097 ) ) ( not ( = ?auto_1364090 ?auto_1364098 ) ) ( not ( = ?auto_1364090 ?auto_1364099 ) ) ( not ( = ?auto_1364090 ?auto_1364105 ) ) ( not ( = ?auto_1364091 ?auto_1364092 ) ) ( not ( = ?auto_1364091 ?auto_1364089 ) ) ( not ( = ?auto_1364091 ?auto_1364093 ) ) ( not ( = ?auto_1364091 ?auto_1364095 ) ) ( not ( = ?auto_1364091 ?auto_1364094 ) ) ( not ( = ?auto_1364091 ?auto_1364096 ) ) ( not ( = ?auto_1364091 ?auto_1364097 ) ) ( not ( = ?auto_1364091 ?auto_1364098 ) ) ( not ( = ?auto_1364091 ?auto_1364099 ) ) ( not ( = ?auto_1364091 ?auto_1364105 ) ) ( not ( = ?auto_1364092 ?auto_1364089 ) ) ( not ( = ?auto_1364092 ?auto_1364093 ) ) ( not ( = ?auto_1364092 ?auto_1364095 ) ) ( not ( = ?auto_1364092 ?auto_1364094 ) ) ( not ( = ?auto_1364092 ?auto_1364096 ) ) ( not ( = ?auto_1364092 ?auto_1364097 ) ) ( not ( = ?auto_1364092 ?auto_1364098 ) ) ( not ( = ?auto_1364092 ?auto_1364099 ) ) ( not ( = ?auto_1364092 ?auto_1364105 ) ) ( not ( = ?auto_1364089 ?auto_1364093 ) ) ( not ( = ?auto_1364089 ?auto_1364095 ) ) ( not ( = ?auto_1364089 ?auto_1364094 ) ) ( not ( = ?auto_1364089 ?auto_1364096 ) ) ( not ( = ?auto_1364089 ?auto_1364097 ) ) ( not ( = ?auto_1364089 ?auto_1364098 ) ) ( not ( = ?auto_1364089 ?auto_1364099 ) ) ( not ( = ?auto_1364089 ?auto_1364105 ) ) ( not ( = ?auto_1364093 ?auto_1364095 ) ) ( not ( = ?auto_1364093 ?auto_1364094 ) ) ( not ( = ?auto_1364093 ?auto_1364096 ) ) ( not ( = ?auto_1364093 ?auto_1364097 ) ) ( not ( = ?auto_1364093 ?auto_1364098 ) ) ( not ( = ?auto_1364093 ?auto_1364099 ) ) ( not ( = ?auto_1364093 ?auto_1364105 ) ) ( not ( = ?auto_1364095 ?auto_1364094 ) ) ( not ( = ?auto_1364095 ?auto_1364096 ) ) ( not ( = ?auto_1364095 ?auto_1364097 ) ) ( not ( = ?auto_1364095 ?auto_1364098 ) ) ( not ( = ?auto_1364095 ?auto_1364099 ) ) ( not ( = ?auto_1364095 ?auto_1364105 ) ) ( not ( = ?auto_1364094 ?auto_1364096 ) ) ( not ( = ?auto_1364094 ?auto_1364097 ) ) ( not ( = ?auto_1364094 ?auto_1364098 ) ) ( not ( = ?auto_1364094 ?auto_1364099 ) ) ( not ( = ?auto_1364094 ?auto_1364105 ) ) ( not ( = ?auto_1364096 ?auto_1364097 ) ) ( not ( = ?auto_1364096 ?auto_1364098 ) ) ( not ( = ?auto_1364096 ?auto_1364099 ) ) ( not ( = ?auto_1364096 ?auto_1364105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1364097 ?auto_1364098 ?auto_1364099 )
      ( MAKE-10CRATE-VERIFY ?auto_1364090 ?auto_1364091 ?auto_1364092 ?auto_1364089 ?auto_1364093 ?auto_1364095 ?auto_1364094 ?auto_1364096 ?auto_1364097 ?auto_1364098 ?auto_1364099 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1364216 - SURFACE
      ?auto_1364217 - SURFACE
      ?auto_1364218 - SURFACE
      ?auto_1364215 - SURFACE
      ?auto_1364219 - SURFACE
      ?auto_1364221 - SURFACE
      ?auto_1364220 - SURFACE
      ?auto_1364222 - SURFACE
      ?auto_1364223 - SURFACE
      ?auto_1364224 - SURFACE
      ?auto_1364225 - SURFACE
    )
    :vars
    (
      ?auto_1364230 - HOIST
      ?auto_1364228 - PLACE
      ?auto_1364231 - PLACE
      ?auto_1364229 - HOIST
      ?auto_1364227 - SURFACE
      ?auto_1364226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1364230 ?auto_1364228 ) ( IS-CRATE ?auto_1364225 ) ( not ( = ?auto_1364224 ?auto_1364225 ) ) ( not ( = ?auto_1364223 ?auto_1364224 ) ) ( not ( = ?auto_1364223 ?auto_1364225 ) ) ( not ( = ?auto_1364231 ?auto_1364228 ) ) ( HOIST-AT ?auto_1364229 ?auto_1364231 ) ( not ( = ?auto_1364230 ?auto_1364229 ) ) ( AVAILABLE ?auto_1364229 ) ( SURFACE-AT ?auto_1364225 ?auto_1364231 ) ( ON ?auto_1364225 ?auto_1364227 ) ( CLEAR ?auto_1364225 ) ( not ( = ?auto_1364224 ?auto_1364227 ) ) ( not ( = ?auto_1364225 ?auto_1364227 ) ) ( not ( = ?auto_1364223 ?auto_1364227 ) ) ( TRUCK-AT ?auto_1364226 ?auto_1364228 ) ( SURFACE-AT ?auto_1364223 ?auto_1364228 ) ( CLEAR ?auto_1364223 ) ( IS-CRATE ?auto_1364224 ) ( AVAILABLE ?auto_1364230 ) ( IN ?auto_1364224 ?auto_1364226 ) ( ON ?auto_1364217 ?auto_1364216 ) ( ON ?auto_1364218 ?auto_1364217 ) ( ON ?auto_1364215 ?auto_1364218 ) ( ON ?auto_1364219 ?auto_1364215 ) ( ON ?auto_1364221 ?auto_1364219 ) ( ON ?auto_1364220 ?auto_1364221 ) ( ON ?auto_1364222 ?auto_1364220 ) ( ON ?auto_1364223 ?auto_1364222 ) ( not ( = ?auto_1364216 ?auto_1364217 ) ) ( not ( = ?auto_1364216 ?auto_1364218 ) ) ( not ( = ?auto_1364216 ?auto_1364215 ) ) ( not ( = ?auto_1364216 ?auto_1364219 ) ) ( not ( = ?auto_1364216 ?auto_1364221 ) ) ( not ( = ?auto_1364216 ?auto_1364220 ) ) ( not ( = ?auto_1364216 ?auto_1364222 ) ) ( not ( = ?auto_1364216 ?auto_1364223 ) ) ( not ( = ?auto_1364216 ?auto_1364224 ) ) ( not ( = ?auto_1364216 ?auto_1364225 ) ) ( not ( = ?auto_1364216 ?auto_1364227 ) ) ( not ( = ?auto_1364217 ?auto_1364218 ) ) ( not ( = ?auto_1364217 ?auto_1364215 ) ) ( not ( = ?auto_1364217 ?auto_1364219 ) ) ( not ( = ?auto_1364217 ?auto_1364221 ) ) ( not ( = ?auto_1364217 ?auto_1364220 ) ) ( not ( = ?auto_1364217 ?auto_1364222 ) ) ( not ( = ?auto_1364217 ?auto_1364223 ) ) ( not ( = ?auto_1364217 ?auto_1364224 ) ) ( not ( = ?auto_1364217 ?auto_1364225 ) ) ( not ( = ?auto_1364217 ?auto_1364227 ) ) ( not ( = ?auto_1364218 ?auto_1364215 ) ) ( not ( = ?auto_1364218 ?auto_1364219 ) ) ( not ( = ?auto_1364218 ?auto_1364221 ) ) ( not ( = ?auto_1364218 ?auto_1364220 ) ) ( not ( = ?auto_1364218 ?auto_1364222 ) ) ( not ( = ?auto_1364218 ?auto_1364223 ) ) ( not ( = ?auto_1364218 ?auto_1364224 ) ) ( not ( = ?auto_1364218 ?auto_1364225 ) ) ( not ( = ?auto_1364218 ?auto_1364227 ) ) ( not ( = ?auto_1364215 ?auto_1364219 ) ) ( not ( = ?auto_1364215 ?auto_1364221 ) ) ( not ( = ?auto_1364215 ?auto_1364220 ) ) ( not ( = ?auto_1364215 ?auto_1364222 ) ) ( not ( = ?auto_1364215 ?auto_1364223 ) ) ( not ( = ?auto_1364215 ?auto_1364224 ) ) ( not ( = ?auto_1364215 ?auto_1364225 ) ) ( not ( = ?auto_1364215 ?auto_1364227 ) ) ( not ( = ?auto_1364219 ?auto_1364221 ) ) ( not ( = ?auto_1364219 ?auto_1364220 ) ) ( not ( = ?auto_1364219 ?auto_1364222 ) ) ( not ( = ?auto_1364219 ?auto_1364223 ) ) ( not ( = ?auto_1364219 ?auto_1364224 ) ) ( not ( = ?auto_1364219 ?auto_1364225 ) ) ( not ( = ?auto_1364219 ?auto_1364227 ) ) ( not ( = ?auto_1364221 ?auto_1364220 ) ) ( not ( = ?auto_1364221 ?auto_1364222 ) ) ( not ( = ?auto_1364221 ?auto_1364223 ) ) ( not ( = ?auto_1364221 ?auto_1364224 ) ) ( not ( = ?auto_1364221 ?auto_1364225 ) ) ( not ( = ?auto_1364221 ?auto_1364227 ) ) ( not ( = ?auto_1364220 ?auto_1364222 ) ) ( not ( = ?auto_1364220 ?auto_1364223 ) ) ( not ( = ?auto_1364220 ?auto_1364224 ) ) ( not ( = ?auto_1364220 ?auto_1364225 ) ) ( not ( = ?auto_1364220 ?auto_1364227 ) ) ( not ( = ?auto_1364222 ?auto_1364223 ) ) ( not ( = ?auto_1364222 ?auto_1364224 ) ) ( not ( = ?auto_1364222 ?auto_1364225 ) ) ( not ( = ?auto_1364222 ?auto_1364227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1364223 ?auto_1364224 ?auto_1364225 )
      ( MAKE-10CRATE-VERIFY ?auto_1364216 ?auto_1364217 ?auto_1364218 ?auto_1364215 ?auto_1364219 ?auto_1364221 ?auto_1364220 ?auto_1364222 ?auto_1364223 ?auto_1364224 ?auto_1364225 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371482 - SURFACE
      ?auto_1371483 - SURFACE
      ?auto_1371484 - SURFACE
      ?auto_1371481 - SURFACE
      ?auto_1371485 - SURFACE
      ?auto_1371487 - SURFACE
      ?auto_1371486 - SURFACE
      ?auto_1371488 - SURFACE
      ?auto_1371489 - SURFACE
      ?auto_1371490 - SURFACE
      ?auto_1371491 - SURFACE
      ?auto_1371492 - SURFACE
    )
    :vars
    (
      ?auto_1371493 - HOIST
      ?auto_1371494 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371493 ?auto_1371494 ) ( SURFACE-AT ?auto_1371491 ?auto_1371494 ) ( CLEAR ?auto_1371491 ) ( LIFTING ?auto_1371493 ?auto_1371492 ) ( IS-CRATE ?auto_1371492 ) ( not ( = ?auto_1371491 ?auto_1371492 ) ) ( ON ?auto_1371483 ?auto_1371482 ) ( ON ?auto_1371484 ?auto_1371483 ) ( ON ?auto_1371481 ?auto_1371484 ) ( ON ?auto_1371485 ?auto_1371481 ) ( ON ?auto_1371487 ?auto_1371485 ) ( ON ?auto_1371486 ?auto_1371487 ) ( ON ?auto_1371488 ?auto_1371486 ) ( ON ?auto_1371489 ?auto_1371488 ) ( ON ?auto_1371490 ?auto_1371489 ) ( ON ?auto_1371491 ?auto_1371490 ) ( not ( = ?auto_1371482 ?auto_1371483 ) ) ( not ( = ?auto_1371482 ?auto_1371484 ) ) ( not ( = ?auto_1371482 ?auto_1371481 ) ) ( not ( = ?auto_1371482 ?auto_1371485 ) ) ( not ( = ?auto_1371482 ?auto_1371487 ) ) ( not ( = ?auto_1371482 ?auto_1371486 ) ) ( not ( = ?auto_1371482 ?auto_1371488 ) ) ( not ( = ?auto_1371482 ?auto_1371489 ) ) ( not ( = ?auto_1371482 ?auto_1371490 ) ) ( not ( = ?auto_1371482 ?auto_1371491 ) ) ( not ( = ?auto_1371482 ?auto_1371492 ) ) ( not ( = ?auto_1371483 ?auto_1371484 ) ) ( not ( = ?auto_1371483 ?auto_1371481 ) ) ( not ( = ?auto_1371483 ?auto_1371485 ) ) ( not ( = ?auto_1371483 ?auto_1371487 ) ) ( not ( = ?auto_1371483 ?auto_1371486 ) ) ( not ( = ?auto_1371483 ?auto_1371488 ) ) ( not ( = ?auto_1371483 ?auto_1371489 ) ) ( not ( = ?auto_1371483 ?auto_1371490 ) ) ( not ( = ?auto_1371483 ?auto_1371491 ) ) ( not ( = ?auto_1371483 ?auto_1371492 ) ) ( not ( = ?auto_1371484 ?auto_1371481 ) ) ( not ( = ?auto_1371484 ?auto_1371485 ) ) ( not ( = ?auto_1371484 ?auto_1371487 ) ) ( not ( = ?auto_1371484 ?auto_1371486 ) ) ( not ( = ?auto_1371484 ?auto_1371488 ) ) ( not ( = ?auto_1371484 ?auto_1371489 ) ) ( not ( = ?auto_1371484 ?auto_1371490 ) ) ( not ( = ?auto_1371484 ?auto_1371491 ) ) ( not ( = ?auto_1371484 ?auto_1371492 ) ) ( not ( = ?auto_1371481 ?auto_1371485 ) ) ( not ( = ?auto_1371481 ?auto_1371487 ) ) ( not ( = ?auto_1371481 ?auto_1371486 ) ) ( not ( = ?auto_1371481 ?auto_1371488 ) ) ( not ( = ?auto_1371481 ?auto_1371489 ) ) ( not ( = ?auto_1371481 ?auto_1371490 ) ) ( not ( = ?auto_1371481 ?auto_1371491 ) ) ( not ( = ?auto_1371481 ?auto_1371492 ) ) ( not ( = ?auto_1371485 ?auto_1371487 ) ) ( not ( = ?auto_1371485 ?auto_1371486 ) ) ( not ( = ?auto_1371485 ?auto_1371488 ) ) ( not ( = ?auto_1371485 ?auto_1371489 ) ) ( not ( = ?auto_1371485 ?auto_1371490 ) ) ( not ( = ?auto_1371485 ?auto_1371491 ) ) ( not ( = ?auto_1371485 ?auto_1371492 ) ) ( not ( = ?auto_1371487 ?auto_1371486 ) ) ( not ( = ?auto_1371487 ?auto_1371488 ) ) ( not ( = ?auto_1371487 ?auto_1371489 ) ) ( not ( = ?auto_1371487 ?auto_1371490 ) ) ( not ( = ?auto_1371487 ?auto_1371491 ) ) ( not ( = ?auto_1371487 ?auto_1371492 ) ) ( not ( = ?auto_1371486 ?auto_1371488 ) ) ( not ( = ?auto_1371486 ?auto_1371489 ) ) ( not ( = ?auto_1371486 ?auto_1371490 ) ) ( not ( = ?auto_1371486 ?auto_1371491 ) ) ( not ( = ?auto_1371486 ?auto_1371492 ) ) ( not ( = ?auto_1371488 ?auto_1371489 ) ) ( not ( = ?auto_1371488 ?auto_1371490 ) ) ( not ( = ?auto_1371488 ?auto_1371491 ) ) ( not ( = ?auto_1371488 ?auto_1371492 ) ) ( not ( = ?auto_1371489 ?auto_1371490 ) ) ( not ( = ?auto_1371489 ?auto_1371491 ) ) ( not ( = ?auto_1371489 ?auto_1371492 ) ) ( not ( = ?auto_1371490 ?auto_1371491 ) ) ( not ( = ?auto_1371490 ?auto_1371492 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1371491 ?auto_1371492 )
      ( MAKE-11CRATE-VERIFY ?auto_1371482 ?auto_1371483 ?auto_1371484 ?auto_1371481 ?auto_1371485 ?auto_1371487 ?auto_1371486 ?auto_1371488 ?auto_1371489 ?auto_1371490 ?auto_1371491 ?auto_1371492 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371591 - SURFACE
      ?auto_1371592 - SURFACE
      ?auto_1371593 - SURFACE
      ?auto_1371590 - SURFACE
      ?auto_1371594 - SURFACE
      ?auto_1371596 - SURFACE
      ?auto_1371595 - SURFACE
      ?auto_1371597 - SURFACE
      ?auto_1371598 - SURFACE
      ?auto_1371599 - SURFACE
      ?auto_1371600 - SURFACE
      ?auto_1371601 - SURFACE
    )
    :vars
    (
      ?auto_1371602 - HOIST
      ?auto_1371604 - PLACE
      ?auto_1371603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371602 ?auto_1371604 ) ( SURFACE-AT ?auto_1371600 ?auto_1371604 ) ( CLEAR ?auto_1371600 ) ( IS-CRATE ?auto_1371601 ) ( not ( = ?auto_1371600 ?auto_1371601 ) ) ( TRUCK-AT ?auto_1371603 ?auto_1371604 ) ( AVAILABLE ?auto_1371602 ) ( IN ?auto_1371601 ?auto_1371603 ) ( ON ?auto_1371600 ?auto_1371599 ) ( not ( = ?auto_1371599 ?auto_1371600 ) ) ( not ( = ?auto_1371599 ?auto_1371601 ) ) ( ON ?auto_1371592 ?auto_1371591 ) ( ON ?auto_1371593 ?auto_1371592 ) ( ON ?auto_1371590 ?auto_1371593 ) ( ON ?auto_1371594 ?auto_1371590 ) ( ON ?auto_1371596 ?auto_1371594 ) ( ON ?auto_1371595 ?auto_1371596 ) ( ON ?auto_1371597 ?auto_1371595 ) ( ON ?auto_1371598 ?auto_1371597 ) ( ON ?auto_1371599 ?auto_1371598 ) ( not ( = ?auto_1371591 ?auto_1371592 ) ) ( not ( = ?auto_1371591 ?auto_1371593 ) ) ( not ( = ?auto_1371591 ?auto_1371590 ) ) ( not ( = ?auto_1371591 ?auto_1371594 ) ) ( not ( = ?auto_1371591 ?auto_1371596 ) ) ( not ( = ?auto_1371591 ?auto_1371595 ) ) ( not ( = ?auto_1371591 ?auto_1371597 ) ) ( not ( = ?auto_1371591 ?auto_1371598 ) ) ( not ( = ?auto_1371591 ?auto_1371599 ) ) ( not ( = ?auto_1371591 ?auto_1371600 ) ) ( not ( = ?auto_1371591 ?auto_1371601 ) ) ( not ( = ?auto_1371592 ?auto_1371593 ) ) ( not ( = ?auto_1371592 ?auto_1371590 ) ) ( not ( = ?auto_1371592 ?auto_1371594 ) ) ( not ( = ?auto_1371592 ?auto_1371596 ) ) ( not ( = ?auto_1371592 ?auto_1371595 ) ) ( not ( = ?auto_1371592 ?auto_1371597 ) ) ( not ( = ?auto_1371592 ?auto_1371598 ) ) ( not ( = ?auto_1371592 ?auto_1371599 ) ) ( not ( = ?auto_1371592 ?auto_1371600 ) ) ( not ( = ?auto_1371592 ?auto_1371601 ) ) ( not ( = ?auto_1371593 ?auto_1371590 ) ) ( not ( = ?auto_1371593 ?auto_1371594 ) ) ( not ( = ?auto_1371593 ?auto_1371596 ) ) ( not ( = ?auto_1371593 ?auto_1371595 ) ) ( not ( = ?auto_1371593 ?auto_1371597 ) ) ( not ( = ?auto_1371593 ?auto_1371598 ) ) ( not ( = ?auto_1371593 ?auto_1371599 ) ) ( not ( = ?auto_1371593 ?auto_1371600 ) ) ( not ( = ?auto_1371593 ?auto_1371601 ) ) ( not ( = ?auto_1371590 ?auto_1371594 ) ) ( not ( = ?auto_1371590 ?auto_1371596 ) ) ( not ( = ?auto_1371590 ?auto_1371595 ) ) ( not ( = ?auto_1371590 ?auto_1371597 ) ) ( not ( = ?auto_1371590 ?auto_1371598 ) ) ( not ( = ?auto_1371590 ?auto_1371599 ) ) ( not ( = ?auto_1371590 ?auto_1371600 ) ) ( not ( = ?auto_1371590 ?auto_1371601 ) ) ( not ( = ?auto_1371594 ?auto_1371596 ) ) ( not ( = ?auto_1371594 ?auto_1371595 ) ) ( not ( = ?auto_1371594 ?auto_1371597 ) ) ( not ( = ?auto_1371594 ?auto_1371598 ) ) ( not ( = ?auto_1371594 ?auto_1371599 ) ) ( not ( = ?auto_1371594 ?auto_1371600 ) ) ( not ( = ?auto_1371594 ?auto_1371601 ) ) ( not ( = ?auto_1371596 ?auto_1371595 ) ) ( not ( = ?auto_1371596 ?auto_1371597 ) ) ( not ( = ?auto_1371596 ?auto_1371598 ) ) ( not ( = ?auto_1371596 ?auto_1371599 ) ) ( not ( = ?auto_1371596 ?auto_1371600 ) ) ( not ( = ?auto_1371596 ?auto_1371601 ) ) ( not ( = ?auto_1371595 ?auto_1371597 ) ) ( not ( = ?auto_1371595 ?auto_1371598 ) ) ( not ( = ?auto_1371595 ?auto_1371599 ) ) ( not ( = ?auto_1371595 ?auto_1371600 ) ) ( not ( = ?auto_1371595 ?auto_1371601 ) ) ( not ( = ?auto_1371597 ?auto_1371598 ) ) ( not ( = ?auto_1371597 ?auto_1371599 ) ) ( not ( = ?auto_1371597 ?auto_1371600 ) ) ( not ( = ?auto_1371597 ?auto_1371601 ) ) ( not ( = ?auto_1371598 ?auto_1371599 ) ) ( not ( = ?auto_1371598 ?auto_1371600 ) ) ( not ( = ?auto_1371598 ?auto_1371601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1371599 ?auto_1371600 ?auto_1371601 )
      ( MAKE-11CRATE-VERIFY ?auto_1371591 ?auto_1371592 ?auto_1371593 ?auto_1371590 ?auto_1371594 ?auto_1371596 ?auto_1371595 ?auto_1371597 ?auto_1371598 ?auto_1371599 ?auto_1371600 ?auto_1371601 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371712 - SURFACE
      ?auto_1371713 - SURFACE
      ?auto_1371714 - SURFACE
      ?auto_1371711 - SURFACE
      ?auto_1371715 - SURFACE
      ?auto_1371717 - SURFACE
      ?auto_1371716 - SURFACE
      ?auto_1371718 - SURFACE
      ?auto_1371719 - SURFACE
      ?auto_1371720 - SURFACE
      ?auto_1371721 - SURFACE
      ?auto_1371722 - SURFACE
    )
    :vars
    (
      ?auto_1371724 - HOIST
      ?auto_1371723 - PLACE
      ?auto_1371725 - TRUCK
      ?auto_1371726 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371724 ?auto_1371723 ) ( SURFACE-AT ?auto_1371721 ?auto_1371723 ) ( CLEAR ?auto_1371721 ) ( IS-CRATE ?auto_1371722 ) ( not ( = ?auto_1371721 ?auto_1371722 ) ) ( AVAILABLE ?auto_1371724 ) ( IN ?auto_1371722 ?auto_1371725 ) ( ON ?auto_1371721 ?auto_1371720 ) ( not ( = ?auto_1371720 ?auto_1371721 ) ) ( not ( = ?auto_1371720 ?auto_1371722 ) ) ( TRUCK-AT ?auto_1371725 ?auto_1371726 ) ( not ( = ?auto_1371726 ?auto_1371723 ) ) ( ON ?auto_1371713 ?auto_1371712 ) ( ON ?auto_1371714 ?auto_1371713 ) ( ON ?auto_1371711 ?auto_1371714 ) ( ON ?auto_1371715 ?auto_1371711 ) ( ON ?auto_1371717 ?auto_1371715 ) ( ON ?auto_1371716 ?auto_1371717 ) ( ON ?auto_1371718 ?auto_1371716 ) ( ON ?auto_1371719 ?auto_1371718 ) ( ON ?auto_1371720 ?auto_1371719 ) ( not ( = ?auto_1371712 ?auto_1371713 ) ) ( not ( = ?auto_1371712 ?auto_1371714 ) ) ( not ( = ?auto_1371712 ?auto_1371711 ) ) ( not ( = ?auto_1371712 ?auto_1371715 ) ) ( not ( = ?auto_1371712 ?auto_1371717 ) ) ( not ( = ?auto_1371712 ?auto_1371716 ) ) ( not ( = ?auto_1371712 ?auto_1371718 ) ) ( not ( = ?auto_1371712 ?auto_1371719 ) ) ( not ( = ?auto_1371712 ?auto_1371720 ) ) ( not ( = ?auto_1371712 ?auto_1371721 ) ) ( not ( = ?auto_1371712 ?auto_1371722 ) ) ( not ( = ?auto_1371713 ?auto_1371714 ) ) ( not ( = ?auto_1371713 ?auto_1371711 ) ) ( not ( = ?auto_1371713 ?auto_1371715 ) ) ( not ( = ?auto_1371713 ?auto_1371717 ) ) ( not ( = ?auto_1371713 ?auto_1371716 ) ) ( not ( = ?auto_1371713 ?auto_1371718 ) ) ( not ( = ?auto_1371713 ?auto_1371719 ) ) ( not ( = ?auto_1371713 ?auto_1371720 ) ) ( not ( = ?auto_1371713 ?auto_1371721 ) ) ( not ( = ?auto_1371713 ?auto_1371722 ) ) ( not ( = ?auto_1371714 ?auto_1371711 ) ) ( not ( = ?auto_1371714 ?auto_1371715 ) ) ( not ( = ?auto_1371714 ?auto_1371717 ) ) ( not ( = ?auto_1371714 ?auto_1371716 ) ) ( not ( = ?auto_1371714 ?auto_1371718 ) ) ( not ( = ?auto_1371714 ?auto_1371719 ) ) ( not ( = ?auto_1371714 ?auto_1371720 ) ) ( not ( = ?auto_1371714 ?auto_1371721 ) ) ( not ( = ?auto_1371714 ?auto_1371722 ) ) ( not ( = ?auto_1371711 ?auto_1371715 ) ) ( not ( = ?auto_1371711 ?auto_1371717 ) ) ( not ( = ?auto_1371711 ?auto_1371716 ) ) ( not ( = ?auto_1371711 ?auto_1371718 ) ) ( not ( = ?auto_1371711 ?auto_1371719 ) ) ( not ( = ?auto_1371711 ?auto_1371720 ) ) ( not ( = ?auto_1371711 ?auto_1371721 ) ) ( not ( = ?auto_1371711 ?auto_1371722 ) ) ( not ( = ?auto_1371715 ?auto_1371717 ) ) ( not ( = ?auto_1371715 ?auto_1371716 ) ) ( not ( = ?auto_1371715 ?auto_1371718 ) ) ( not ( = ?auto_1371715 ?auto_1371719 ) ) ( not ( = ?auto_1371715 ?auto_1371720 ) ) ( not ( = ?auto_1371715 ?auto_1371721 ) ) ( not ( = ?auto_1371715 ?auto_1371722 ) ) ( not ( = ?auto_1371717 ?auto_1371716 ) ) ( not ( = ?auto_1371717 ?auto_1371718 ) ) ( not ( = ?auto_1371717 ?auto_1371719 ) ) ( not ( = ?auto_1371717 ?auto_1371720 ) ) ( not ( = ?auto_1371717 ?auto_1371721 ) ) ( not ( = ?auto_1371717 ?auto_1371722 ) ) ( not ( = ?auto_1371716 ?auto_1371718 ) ) ( not ( = ?auto_1371716 ?auto_1371719 ) ) ( not ( = ?auto_1371716 ?auto_1371720 ) ) ( not ( = ?auto_1371716 ?auto_1371721 ) ) ( not ( = ?auto_1371716 ?auto_1371722 ) ) ( not ( = ?auto_1371718 ?auto_1371719 ) ) ( not ( = ?auto_1371718 ?auto_1371720 ) ) ( not ( = ?auto_1371718 ?auto_1371721 ) ) ( not ( = ?auto_1371718 ?auto_1371722 ) ) ( not ( = ?auto_1371719 ?auto_1371720 ) ) ( not ( = ?auto_1371719 ?auto_1371721 ) ) ( not ( = ?auto_1371719 ?auto_1371722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1371720 ?auto_1371721 ?auto_1371722 )
      ( MAKE-11CRATE-VERIFY ?auto_1371712 ?auto_1371713 ?auto_1371714 ?auto_1371711 ?auto_1371715 ?auto_1371717 ?auto_1371716 ?auto_1371718 ?auto_1371719 ?auto_1371720 ?auto_1371721 ?auto_1371722 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371844 - SURFACE
      ?auto_1371845 - SURFACE
      ?auto_1371846 - SURFACE
      ?auto_1371843 - SURFACE
      ?auto_1371847 - SURFACE
      ?auto_1371849 - SURFACE
      ?auto_1371848 - SURFACE
      ?auto_1371850 - SURFACE
      ?auto_1371851 - SURFACE
      ?auto_1371852 - SURFACE
      ?auto_1371853 - SURFACE
      ?auto_1371854 - SURFACE
    )
    :vars
    (
      ?auto_1371855 - HOIST
      ?auto_1371857 - PLACE
      ?auto_1371859 - TRUCK
      ?auto_1371858 - PLACE
      ?auto_1371856 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1371855 ?auto_1371857 ) ( SURFACE-AT ?auto_1371853 ?auto_1371857 ) ( CLEAR ?auto_1371853 ) ( IS-CRATE ?auto_1371854 ) ( not ( = ?auto_1371853 ?auto_1371854 ) ) ( AVAILABLE ?auto_1371855 ) ( ON ?auto_1371853 ?auto_1371852 ) ( not ( = ?auto_1371852 ?auto_1371853 ) ) ( not ( = ?auto_1371852 ?auto_1371854 ) ) ( TRUCK-AT ?auto_1371859 ?auto_1371858 ) ( not ( = ?auto_1371858 ?auto_1371857 ) ) ( HOIST-AT ?auto_1371856 ?auto_1371858 ) ( LIFTING ?auto_1371856 ?auto_1371854 ) ( not ( = ?auto_1371855 ?auto_1371856 ) ) ( ON ?auto_1371845 ?auto_1371844 ) ( ON ?auto_1371846 ?auto_1371845 ) ( ON ?auto_1371843 ?auto_1371846 ) ( ON ?auto_1371847 ?auto_1371843 ) ( ON ?auto_1371849 ?auto_1371847 ) ( ON ?auto_1371848 ?auto_1371849 ) ( ON ?auto_1371850 ?auto_1371848 ) ( ON ?auto_1371851 ?auto_1371850 ) ( ON ?auto_1371852 ?auto_1371851 ) ( not ( = ?auto_1371844 ?auto_1371845 ) ) ( not ( = ?auto_1371844 ?auto_1371846 ) ) ( not ( = ?auto_1371844 ?auto_1371843 ) ) ( not ( = ?auto_1371844 ?auto_1371847 ) ) ( not ( = ?auto_1371844 ?auto_1371849 ) ) ( not ( = ?auto_1371844 ?auto_1371848 ) ) ( not ( = ?auto_1371844 ?auto_1371850 ) ) ( not ( = ?auto_1371844 ?auto_1371851 ) ) ( not ( = ?auto_1371844 ?auto_1371852 ) ) ( not ( = ?auto_1371844 ?auto_1371853 ) ) ( not ( = ?auto_1371844 ?auto_1371854 ) ) ( not ( = ?auto_1371845 ?auto_1371846 ) ) ( not ( = ?auto_1371845 ?auto_1371843 ) ) ( not ( = ?auto_1371845 ?auto_1371847 ) ) ( not ( = ?auto_1371845 ?auto_1371849 ) ) ( not ( = ?auto_1371845 ?auto_1371848 ) ) ( not ( = ?auto_1371845 ?auto_1371850 ) ) ( not ( = ?auto_1371845 ?auto_1371851 ) ) ( not ( = ?auto_1371845 ?auto_1371852 ) ) ( not ( = ?auto_1371845 ?auto_1371853 ) ) ( not ( = ?auto_1371845 ?auto_1371854 ) ) ( not ( = ?auto_1371846 ?auto_1371843 ) ) ( not ( = ?auto_1371846 ?auto_1371847 ) ) ( not ( = ?auto_1371846 ?auto_1371849 ) ) ( not ( = ?auto_1371846 ?auto_1371848 ) ) ( not ( = ?auto_1371846 ?auto_1371850 ) ) ( not ( = ?auto_1371846 ?auto_1371851 ) ) ( not ( = ?auto_1371846 ?auto_1371852 ) ) ( not ( = ?auto_1371846 ?auto_1371853 ) ) ( not ( = ?auto_1371846 ?auto_1371854 ) ) ( not ( = ?auto_1371843 ?auto_1371847 ) ) ( not ( = ?auto_1371843 ?auto_1371849 ) ) ( not ( = ?auto_1371843 ?auto_1371848 ) ) ( not ( = ?auto_1371843 ?auto_1371850 ) ) ( not ( = ?auto_1371843 ?auto_1371851 ) ) ( not ( = ?auto_1371843 ?auto_1371852 ) ) ( not ( = ?auto_1371843 ?auto_1371853 ) ) ( not ( = ?auto_1371843 ?auto_1371854 ) ) ( not ( = ?auto_1371847 ?auto_1371849 ) ) ( not ( = ?auto_1371847 ?auto_1371848 ) ) ( not ( = ?auto_1371847 ?auto_1371850 ) ) ( not ( = ?auto_1371847 ?auto_1371851 ) ) ( not ( = ?auto_1371847 ?auto_1371852 ) ) ( not ( = ?auto_1371847 ?auto_1371853 ) ) ( not ( = ?auto_1371847 ?auto_1371854 ) ) ( not ( = ?auto_1371849 ?auto_1371848 ) ) ( not ( = ?auto_1371849 ?auto_1371850 ) ) ( not ( = ?auto_1371849 ?auto_1371851 ) ) ( not ( = ?auto_1371849 ?auto_1371852 ) ) ( not ( = ?auto_1371849 ?auto_1371853 ) ) ( not ( = ?auto_1371849 ?auto_1371854 ) ) ( not ( = ?auto_1371848 ?auto_1371850 ) ) ( not ( = ?auto_1371848 ?auto_1371851 ) ) ( not ( = ?auto_1371848 ?auto_1371852 ) ) ( not ( = ?auto_1371848 ?auto_1371853 ) ) ( not ( = ?auto_1371848 ?auto_1371854 ) ) ( not ( = ?auto_1371850 ?auto_1371851 ) ) ( not ( = ?auto_1371850 ?auto_1371852 ) ) ( not ( = ?auto_1371850 ?auto_1371853 ) ) ( not ( = ?auto_1371850 ?auto_1371854 ) ) ( not ( = ?auto_1371851 ?auto_1371852 ) ) ( not ( = ?auto_1371851 ?auto_1371853 ) ) ( not ( = ?auto_1371851 ?auto_1371854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1371852 ?auto_1371853 ?auto_1371854 )
      ( MAKE-11CRATE-VERIFY ?auto_1371844 ?auto_1371845 ?auto_1371846 ?auto_1371843 ?auto_1371847 ?auto_1371849 ?auto_1371848 ?auto_1371850 ?auto_1371851 ?auto_1371852 ?auto_1371853 ?auto_1371854 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1371987 - SURFACE
      ?auto_1371988 - SURFACE
      ?auto_1371989 - SURFACE
      ?auto_1371986 - SURFACE
      ?auto_1371990 - SURFACE
      ?auto_1371992 - SURFACE
      ?auto_1371991 - SURFACE
      ?auto_1371993 - SURFACE
      ?auto_1371994 - SURFACE
      ?auto_1371995 - SURFACE
      ?auto_1371996 - SURFACE
      ?auto_1371997 - SURFACE
    )
    :vars
    (
      ?auto_1372002 - HOIST
      ?auto_1372001 - PLACE
      ?auto_1372000 - TRUCK
      ?auto_1372003 - PLACE
      ?auto_1371999 - HOIST
      ?auto_1371998 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372002 ?auto_1372001 ) ( SURFACE-AT ?auto_1371996 ?auto_1372001 ) ( CLEAR ?auto_1371996 ) ( IS-CRATE ?auto_1371997 ) ( not ( = ?auto_1371996 ?auto_1371997 ) ) ( AVAILABLE ?auto_1372002 ) ( ON ?auto_1371996 ?auto_1371995 ) ( not ( = ?auto_1371995 ?auto_1371996 ) ) ( not ( = ?auto_1371995 ?auto_1371997 ) ) ( TRUCK-AT ?auto_1372000 ?auto_1372003 ) ( not ( = ?auto_1372003 ?auto_1372001 ) ) ( HOIST-AT ?auto_1371999 ?auto_1372003 ) ( not ( = ?auto_1372002 ?auto_1371999 ) ) ( AVAILABLE ?auto_1371999 ) ( SURFACE-AT ?auto_1371997 ?auto_1372003 ) ( ON ?auto_1371997 ?auto_1371998 ) ( CLEAR ?auto_1371997 ) ( not ( = ?auto_1371996 ?auto_1371998 ) ) ( not ( = ?auto_1371997 ?auto_1371998 ) ) ( not ( = ?auto_1371995 ?auto_1371998 ) ) ( ON ?auto_1371988 ?auto_1371987 ) ( ON ?auto_1371989 ?auto_1371988 ) ( ON ?auto_1371986 ?auto_1371989 ) ( ON ?auto_1371990 ?auto_1371986 ) ( ON ?auto_1371992 ?auto_1371990 ) ( ON ?auto_1371991 ?auto_1371992 ) ( ON ?auto_1371993 ?auto_1371991 ) ( ON ?auto_1371994 ?auto_1371993 ) ( ON ?auto_1371995 ?auto_1371994 ) ( not ( = ?auto_1371987 ?auto_1371988 ) ) ( not ( = ?auto_1371987 ?auto_1371989 ) ) ( not ( = ?auto_1371987 ?auto_1371986 ) ) ( not ( = ?auto_1371987 ?auto_1371990 ) ) ( not ( = ?auto_1371987 ?auto_1371992 ) ) ( not ( = ?auto_1371987 ?auto_1371991 ) ) ( not ( = ?auto_1371987 ?auto_1371993 ) ) ( not ( = ?auto_1371987 ?auto_1371994 ) ) ( not ( = ?auto_1371987 ?auto_1371995 ) ) ( not ( = ?auto_1371987 ?auto_1371996 ) ) ( not ( = ?auto_1371987 ?auto_1371997 ) ) ( not ( = ?auto_1371987 ?auto_1371998 ) ) ( not ( = ?auto_1371988 ?auto_1371989 ) ) ( not ( = ?auto_1371988 ?auto_1371986 ) ) ( not ( = ?auto_1371988 ?auto_1371990 ) ) ( not ( = ?auto_1371988 ?auto_1371992 ) ) ( not ( = ?auto_1371988 ?auto_1371991 ) ) ( not ( = ?auto_1371988 ?auto_1371993 ) ) ( not ( = ?auto_1371988 ?auto_1371994 ) ) ( not ( = ?auto_1371988 ?auto_1371995 ) ) ( not ( = ?auto_1371988 ?auto_1371996 ) ) ( not ( = ?auto_1371988 ?auto_1371997 ) ) ( not ( = ?auto_1371988 ?auto_1371998 ) ) ( not ( = ?auto_1371989 ?auto_1371986 ) ) ( not ( = ?auto_1371989 ?auto_1371990 ) ) ( not ( = ?auto_1371989 ?auto_1371992 ) ) ( not ( = ?auto_1371989 ?auto_1371991 ) ) ( not ( = ?auto_1371989 ?auto_1371993 ) ) ( not ( = ?auto_1371989 ?auto_1371994 ) ) ( not ( = ?auto_1371989 ?auto_1371995 ) ) ( not ( = ?auto_1371989 ?auto_1371996 ) ) ( not ( = ?auto_1371989 ?auto_1371997 ) ) ( not ( = ?auto_1371989 ?auto_1371998 ) ) ( not ( = ?auto_1371986 ?auto_1371990 ) ) ( not ( = ?auto_1371986 ?auto_1371992 ) ) ( not ( = ?auto_1371986 ?auto_1371991 ) ) ( not ( = ?auto_1371986 ?auto_1371993 ) ) ( not ( = ?auto_1371986 ?auto_1371994 ) ) ( not ( = ?auto_1371986 ?auto_1371995 ) ) ( not ( = ?auto_1371986 ?auto_1371996 ) ) ( not ( = ?auto_1371986 ?auto_1371997 ) ) ( not ( = ?auto_1371986 ?auto_1371998 ) ) ( not ( = ?auto_1371990 ?auto_1371992 ) ) ( not ( = ?auto_1371990 ?auto_1371991 ) ) ( not ( = ?auto_1371990 ?auto_1371993 ) ) ( not ( = ?auto_1371990 ?auto_1371994 ) ) ( not ( = ?auto_1371990 ?auto_1371995 ) ) ( not ( = ?auto_1371990 ?auto_1371996 ) ) ( not ( = ?auto_1371990 ?auto_1371997 ) ) ( not ( = ?auto_1371990 ?auto_1371998 ) ) ( not ( = ?auto_1371992 ?auto_1371991 ) ) ( not ( = ?auto_1371992 ?auto_1371993 ) ) ( not ( = ?auto_1371992 ?auto_1371994 ) ) ( not ( = ?auto_1371992 ?auto_1371995 ) ) ( not ( = ?auto_1371992 ?auto_1371996 ) ) ( not ( = ?auto_1371992 ?auto_1371997 ) ) ( not ( = ?auto_1371992 ?auto_1371998 ) ) ( not ( = ?auto_1371991 ?auto_1371993 ) ) ( not ( = ?auto_1371991 ?auto_1371994 ) ) ( not ( = ?auto_1371991 ?auto_1371995 ) ) ( not ( = ?auto_1371991 ?auto_1371996 ) ) ( not ( = ?auto_1371991 ?auto_1371997 ) ) ( not ( = ?auto_1371991 ?auto_1371998 ) ) ( not ( = ?auto_1371993 ?auto_1371994 ) ) ( not ( = ?auto_1371993 ?auto_1371995 ) ) ( not ( = ?auto_1371993 ?auto_1371996 ) ) ( not ( = ?auto_1371993 ?auto_1371997 ) ) ( not ( = ?auto_1371993 ?auto_1371998 ) ) ( not ( = ?auto_1371994 ?auto_1371995 ) ) ( not ( = ?auto_1371994 ?auto_1371996 ) ) ( not ( = ?auto_1371994 ?auto_1371997 ) ) ( not ( = ?auto_1371994 ?auto_1371998 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1371995 ?auto_1371996 ?auto_1371997 )
      ( MAKE-11CRATE-VERIFY ?auto_1371987 ?auto_1371988 ?auto_1371989 ?auto_1371986 ?auto_1371990 ?auto_1371992 ?auto_1371991 ?auto_1371993 ?auto_1371994 ?auto_1371995 ?auto_1371996 ?auto_1371997 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1372131 - SURFACE
      ?auto_1372132 - SURFACE
      ?auto_1372133 - SURFACE
      ?auto_1372130 - SURFACE
      ?auto_1372134 - SURFACE
      ?auto_1372136 - SURFACE
      ?auto_1372135 - SURFACE
      ?auto_1372137 - SURFACE
      ?auto_1372138 - SURFACE
      ?auto_1372139 - SURFACE
      ?auto_1372140 - SURFACE
      ?auto_1372141 - SURFACE
    )
    :vars
    (
      ?auto_1372143 - HOIST
      ?auto_1372146 - PLACE
      ?auto_1372144 - PLACE
      ?auto_1372147 - HOIST
      ?auto_1372145 - SURFACE
      ?auto_1372142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372143 ?auto_1372146 ) ( SURFACE-AT ?auto_1372140 ?auto_1372146 ) ( CLEAR ?auto_1372140 ) ( IS-CRATE ?auto_1372141 ) ( not ( = ?auto_1372140 ?auto_1372141 ) ) ( AVAILABLE ?auto_1372143 ) ( ON ?auto_1372140 ?auto_1372139 ) ( not ( = ?auto_1372139 ?auto_1372140 ) ) ( not ( = ?auto_1372139 ?auto_1372141 ) ) ( not ( = ?auto_1372144 ?auto_1372146 ) ) ( HOIST-AT ?auto_1372147 ?auto_1372144 ) ( not ( = ?auto_1372143 ?auto_1372147 ) ) ( AVAILABLE ?auto_1372147 ) ( SURFACE-AT ?auto_1372141 ?auto_1372144 ) ( ON ?auto_1372141 ?auto_1372145 ) ( CLEAR ?auto_1372141 ) ( not ( = ?auto_1372140 ?auto_1372145 ) ) ( not ( = ?auto_1372141 ?auto_1372145 ) ) ( not ( = ?auto_1372139 ?auto_1372145 ) ) ( TRUCK-AT ?auto_1372142 ?auto_1372146 ) ( ON ?auto_1372132 ?auto_1372131 ) ( ON ?auto_1372133 ?auto_1372132 ) ( ON ?auto_1372130 ?auto_1372133 ) ( ON ?auto_1372134 ?auto_1372130 ) ( ON ?auto_1372136 ?auto_1372134 ) ( ON ?auto_1372135 ?auto_1372136 ) ( ON ?auto_1372137 ?auto_1372135 ) ( ON ?auto_1372138 ?auto_1372137 ) ( ON ?auto_1372139 ?auto_1372138 ) ( not ( = ?auto_1372131 ?auto_1372132 ) ) ( not ( = ?auto_1372131 ?auto_1372133 ) ) ( not ( = ?auto_1372131 ?auto_1372130 ) ) ( not ( = ?auto_1372131 ?auto_1372134 ) ) ( not ( = ?auto_1372131 ?auto_1372136 ) ) ( not ( = ?auto_1372131 ?auto_1372135 ) ) ( not ( = ?auto_1372131 ?auto_1372137 ) ) ( not ( = ?auto_1372131 ?auto_1372138 ) ) ( not ( = ?auto_1372131 ?auto_1372139 ) ) ( not ( = ?auto_1372131 ?auto_1372140 ) ) ( not ( = ?auto_1372131 ?auto_1372141 ) ) ( not ( = ?auto_1372131 ?auto_1372145 ) ) ( not ( = ?auto_1372132 ?auto_1372133 ) ) ( not ( = ?auto_1372132 ?auto_1372130 ) ) ( not ( = ?auto_1372132 ?auto_1372134 ) ) ( not ( = ?auto_1372132 ?auto_1372136 ) ) ( not ( = ?auto_1372132 ?auto_1372135 ) ) ( not ( = ?auto_1372132 ?auto_1372137 ) ) ( not ( = ?auto_1372132 ?auto_1372138 ) ) ( not ( = ?auto_1372132 ?auto_1372139 ) ) ( not ( = ?auto_1372132 ?auto_1372140 ) ) ( not ( = ?auto_1372132 ?auto_1372141 ) ) ( not ( = ?auto_1372132 ?auto_1372145 ) ) ( not ( = ?auto_1372133 ?auto_1372130 ) ) ( not ( = ?auto_1372133 ?auto_1372134 ) ) ( not ( = ?auto_1372133 ?auto_1372136 ) ) ( not ( = ?auto_1372133 ?auto_1372135 ) ) ( not ( = ?auto_1372133 ?auto_1372137 ) ) ( not ( = ?auto_1372133 ?auto_1372138 ) ) ( not ( = ?auto_1372133 ?auto_1372139 ) ) ( not ( = ?auto_1372133 ?auto_1372140 ) ) ( not ( = ?auto_1372133 ?auto_1372141 ) ) ( not ( = ?auto_1372133 ?auto_1372145 ) ) ( not ( = ?auto_1372130 ?auto_1372134 ) ) ( not ( = ?auto_1372130 ?auto_1372136 ) ) ( not ( = ?auto_1372130 ?auto_1372135 ) ) ( not ( = ?auto_1372130 ?auto_1372137 ) ) ( not ( = ?auto_1372130 ?auto_1372138 ) ) ( not ( = ?auto_1372130 ?auto_1372139 ) ) ( not ( = ?auto_1372130 ?auto_1372140 ) ) ( not ( = ?auto_1372130 ?auto_1372141 ) ) ( not ( = ?auto_1372130 ?auto_1372145 ) ) ( not ( = ?auto_1372134 ?auto_1372136 ) ) ( not ( = ?auto_1372134 ?auto_1372135 ) ) ( not ( = ?auto_1372134 ?auto_1372137 ) ) ( not ( = ?auto_1372134 ?auto_1372138 ) ) ( not ( = ?auto_1372134 ?auto_1372139 ) ) ( not ( = ?auto_1372134 ?auto_1372140 ) ) ( not ( = ?auto_1372134 ?auto_1372141 ) ) ( not ( = ?auto_1372134 ?auto_1372145 ) ) ( not ( = ?auto_1372136 ?auto_1372135 ) ) ( not ( = ?auto_1372136 ?auto_1372137 ) ) ( not ( = ?auto_1372136 ?auto_1372138 ) ) ( not ( = ?auto_1372136 ?auto_1372139 ) ) ( not ( = ?auto_1372136 ?auto_1372140 ) ) ( not ( = ?auto_1372136 ?auto_1372141 ) ) ( not ( = ?auto_1372136 ?auto_1372145 ) ) ( not ( = ?auto_1372135 ?auto_1372137 ) ) ( not ( = ?auto_1372135 ?auto_1372138 ) ) ( not ( = ?auto_1372135 ?auto_1372139 ) ) ( not ( = ?auto_1372135 ?auto_1372140 ) ) ( not ( = ?auto_1372135 ?auto_1372141 ) ) ( not ( = ?auto_1372135 ?auto_1372145 ) ) ( not ( = ?auto_1372137 ?auto_1372138 ) ) ( not ( = ?auto_1372137 ?auto_1372139 ) ) ( not ( = ?auto_1372137 ?auto_1372140 ) ) ( not ( = ?auto_1372137 ?auto_1372141 ) ) ( not ( = ?auto_1372137 ?auto_1372145 ) ) ( not ( = ?auto_1372138 ?auto_1372139 ) ) ( not ( = ?auto_1372138 ?auto_1372140 ) ) ( not ( = ?auto_1372138 ?auto_1372141 ) ) ( not ( = ?auto_1372138 ?auto_1372145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1372139 ?auto_1372140 ?auto_1372141 )
      ( MAKE-11CRATE-VERIFY ?auto_1372131 ?auto_1372132 ?auto_1372133 ?auto_1372130 ?auto_1372134 ?auto_1372136 ?auto_1372135 ?auto_1372137 ?auto_1372138 ?auto_1372139 ?auto_1372140 ?auto_1372141 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1372275 - SURFACE
      ?auto_1372276 - SURFACE
      ?auto_1372277 - SURFACE
      ?auto_1372274 - SURFACE
      ?auto_1372278 - SURFACE
      ?auto_1372280 - SURFACE
      ?auto_1372279 - SURFACE
      ?auto_1372281 - SURFACE
      ?auto_1372282 - SURFACE
      ?auto_1372283 - SURFACE
      ?auto_1372284 - SURFACE
      ?auto_1372285 - SURFACE
    )
    :vars
    (
      ?auto_1372286 - HOIST
      ?auto_1372289 - PLACE
      ?auto_1372288 - PLACE
      ?auto_1372290 - HOIST
      ?auto_1372287 - SURFACE
      ?auto_1372291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372286 ?auto_1372289 ) ( IS-CRATE ?auto_1372285 ) ( not ( = ?auto_1372284 ?auto_1372285 ) ) ( not ( = ?auto_1372283 ?auto_1372284 ) ) ( not ( = ?auto_1372283 ?auto_1372285 ) ) ( not ( = ?auto_1372288 ?auto_1372289 ) ) ( HOIST-AT ?auto_1372290 ?auto_1372288 ) ( not ( = ?auto_1372286 ?auto_1372290 ) ) ( AVAILABLE ?auto_1372290 ) ( SURFACE-AT ?auto_1372285 ?auto_1372288 ) ( ON ?auto_1372285 ?auto_1372287 ) ( CLEAR ?auto_1372285 ) ( not ( = ?auto_1372284 ?auto_1372287 ) ) ( not ( = ?auto_1372285 ?auto_1372287 ) ) ( not ( = ?auto_1372283 ?auto_1372287 ) ) ( TRUCK-AT ?auto_1372291 ?auto_1372289 ) ( SURFACE-AT ?auto_1372283 ?auto_1372289 ) ( CLEAR ?auto_1372283 ) ( LIFTING ?auto_1372286 ?auto_1372284 ) ( IS-CRATE ?auto_1372284 ) ( ON ?auto_1372276 ?auto_1372275 ) ( ON ?auto_1372277 ?auto_1372276 ) ( ON ?auto_1372274 ?auto_1372277 ) ( ON ?auto_1372278 ?auto_1372274 ) ( ON ?auto_1372280 ?auto_1372278 ) ( ON ?auto_1372279 ?auto_1372280 ) ( ON ?auto_1372281 ?auto_1372279 ) ( ON ?auto_1372282 ?auto_1372281 ) ( ON ?auto_1372283 ?auto_1372282 ) ( not ( = ?auto_1372275 ?auto_1372276 ) ) ( not ( = ?auto_1372275 ?auto_1372277 ) ) ( not ( = ?auto_1372275 ?auto_1372274 ) ) ( not ( = ?auto_1372275 ?auto_1372278 ) ) ( not ( = ?auto_1372275 ?auto_1372280 ) ) ( not ( = ?auto_1372275 ?auto_1372279 ) ) ( not ( = ?auto_1372275 ?auto_1372281 ) ) ( not ( = ?auto_1372275 ?auto_1372282 ) ) ( not ( = ?auto_1372275 ?auto_1372283 ) ) ( not ( = ?auto_1372275 ?auto_1372284 ) ) ( not ( = ?auto_1372275 ?auto_1372285 ) ) ( not ( = ?auto_1372275 ?auto_1372287 ) ) ( not ( = ?auto_1372276 ?auto_1372277 ) ) ( not ( = ?auto_1372276 ?auto_1372274 ) ) ( not ( = ?auto_1372276 ?auto_1372278 ) ) ( not ( = ?auto_1372276 ?auto_1372280 ) ) ( not ( = ?auto_1372276 ?auto_1372279 ) ) ( not ( = ?auto_1372276 ?auto_1372281 ) ) ( not ( = ?auto_1372276 ?auto_1372282 ) ) ( not ( = ?auto_1372276 ?auto_1372283 ) ) ( not ( = ?auto_1372276 ?auto_1372284 ) ) ( not ( = ?auto_1372276 ?auto_1372285 ) ) ( not ( = ?auto_1372276 ?auto_1372287 ) ) ( not ( = ?auto_1372277 ?auto_1372274 ) ) ( not ( = ?auto_1372277 ?auto_1372278 ) ) ( not ( = ?auto_1372277 ?auto_1372280 ) ) ( not ( = ?auto_1372277 ?auto_1372279 ) ) ( not ( = ?auto_1372277 ?auto_1372281 ) ) ( not ( = ?auto_1372277 ?auto_1372282 ) ) ( not ( = ?auto_1372277 ?auto_1372283 ) ) ( not ( = ?auto_1372277 ?auto_1372284 ) ) ( not ( = ?auto_1372277 ?auto_1372285 ) ) ( not ( = ?auto_1372277 ?auto_1372287 ) ) ( not ( = ?auto_1372274 ?auto_1372278 ) ) ( not ( = ?auto_1372274 ?auto_1372280 ) ) ( not ( = ?auto_1372274 ?auto_1372279 ) ) ( not ( = ?auto_1372274 ?auto_1372281 ) ) ( not ( = ?auto_1372274 ?auto_1372282 ) ) ( not ( = ?auto_1372274 ?auto_1372283 ) ) ( not ( = ?auto_1372274 ?auto_1372284 ) ) ( not ( = ?auto_1372274 ?auto_1372285 ) ) ( not ( = ?auto_1372274 ?auto_1372287 ) ) ( not ( = ?auto_1372278 ?auto_1372280 ) ) ( not ( = ?auto_1372278 ?auto_1372279 ) ) ( not ( = ?auto_1372278 ?auto_1372281 ) ) ( not ( = ?auto_1372278 ?auto_1372282 ) ) ( not ( = ?auto_1372278 ?auto_1372283 ) ) ( not ( = ?auto_1372278 ?auto_1372284 ) ) ( not ( = ?auto_1372278 ?auto_1372285 ) ) ( not ( = ?auto_1372278 ?auto_1372287 ) ) ( not ( = ?auto_1372280 ?auto_1372279 ) ) ( not ( = ?auto_1372280 ?auto_1372281 ) ) ( not ( = ?auto_1372280 ?auto_1372282 ) ) ( not ( = ?auto_1372280 ?auto_1372283 ) ) ( not ( = ?auto_1372280 ?auto_1372284 ) ) ( not ( = ?auto_1372280 ?auto_1372285 ) ) ( not ( = ?auto_1372280 ?auto_1372287 ) ) ( not ( = ?auto_1372279 ?auto_1372281 ) ) ( not ( = ?auto_1372279 ?auto_1372282 ) ) ( not ( = ?auto_1372279 ?auto_1372283 ) ) ( not ( = ?auto_1372279 ?auto_1372284 ) ) ( not ( = ?auto_1372279 ?auto_1372285 ) ) ( not ( = ?auto_1372279 ?auto_1372287 ) ) ( not ( = ?auto_1372281 ?auto_1372282 ) ) ( not ( = ?auto_1372281 ?auto_1372283 ) ) ( not ( = ?auto_1372281 ?auto_1372284 ) ) ( not ( = ?auto_1372281 ?auto_1372285 ) ) ( not ( = ?auto_1372281 ?auto_1372287 ) ) ( not ( = ?auto_1372282 ?auto_1372283 ) ) ( not ( = ?auto_1372282 ?auto_1372284 ) ) ( not ( = ?auto_1372282 ?auto_1372285 ) ) ( not ( = ?auto_1372282 ?auto_1372287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1372283 ?auto_1372284 ?auto_1372285 )
      ( MAKE-11CRATE-VERIFY ?auto_1372275 ?auto_1372276 ?auto_1372277 ?auto_1372274 ?auto_1372278 ?auto_1372280 ?auto_1372279 ?auto_1372281 ?auto_1372282 ?auto_1372283 ?auto_1372284 ?auto_1372285 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1372419 - SURFACE
      ?auto_1372420 - SURFACE
      ?auto_1372421 - SURFACE
      ?auto_1372418 - SURFACE
      ?auto_1372422 - SURFACE
      ?auto_1372424 - SURFACE
      ?auto_1372423 - SURFACE
      ?auto_1372425 - SURFACE
      ?auto_1372426 - SURFACE
      ?auto_1372427 - SURFACE
      ?auto_1372428 - SURFACE
      ?auto_1372429 - SURFACE
    )
    :vars
    (
      ?auto_1372431 - HOIST
      ?auto_1372433 - PLACE
      ?auto_1372435 - PLACE
      ?auto_1372432 - HOIST
      ?auto_1372434 - SURFACE
      ?auto_1372430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1372431 ?auto_1372433 ) ( IS-CRATE ?auto_1372429 ) ( not ( = ?auto_1372428 ?auto_1372429 ) ) ( not ( = ?auto_1372427 ?auto_1372428 ) ) ( not ( = ?auto_1372427 ?auto_1372429 ) ) ( not ( = ?auto_1372435 ?auto_1372433 ) ) ( HOIST-AT ?auto_1372432 ?auto_1372435 ) ( not ( = ?auto_1372431 ?auto_1372432 ) ) ( AVAILABLE ?auto_1372432 ) ( SURFACE-AT ?auto_1372429 ?auto_1372435 ) ( ON ?auto_1372429 ?auto_1372434 ) ( CLEAR ?auto_1372429 ) ( not ( = ?auto_1372428 ?auto_1372434 ) ) ( not ( = ?auto_1372429 ?auto_1372434 ) ) ( not ( = ?auto_1372427 ?auto_1372434 ) ) ( TRUCK-AT ?auto_1372430 ?auto_1372433 ) ( SURFACE-AT ?auto_1372427 ?auto_1372433 ) ( CLEAR ?auto_1372427 ) ( IS-CRATE ?auto_1372428 ) ( AVAILABLE ?auto_1372431 ) ( IN ?auto_1372428 ?auto_1372430 ) ( ON ?auto_1372420 ?auto_1372419 ) ( ON ?auto_1372421 ?auto_1372420 ) ( ON ?auto_1372418 ?auto_1372421 ) ( ON ?auto_1372422 ?auto_1372418 ) ( ON ?auto_1372424 ?auto_1372422 ) ( ON ?auto_1372423 ?auto_1372424 ) ( ON ?auto_1372425 ?auto_1372423 ) ( ON ?auto_1372426 ?auto_1372425 ) ( ON ?auto_1372427 ?auto_1372426 ) ( not ( = ?auto_1372419 ?auto_1372420 ) ) ( not ( = ?auto_1372419 ?auto_1372421 ) ) ( not ( = ?auto_1372419 ?auto_1372418 ) ) ( not ( = ?auto_1372419 ?auto_1372422 ) ) ( not ( = ?auto_1372419 ?auto_1372424 ) ) ( not ( = ?auto_1372419 ?auto_1372423 ) ) ( not ( = ?auto_1372419 ?auto_1372425 ) ) ( not ( = ?auto_1372419 ?auto_1372426 ) ) ( not ( = ?auto_1372419 ?auto_1372427 ) ) ( not ( = ?auto_1372419 ?auto_1372428 ) ) ( not ( = ?auto_1372419 ?auto_1372429 ) ) ( not ( = ?auto_1372419 ?auto_1372434 ) ) ( not ( = ?auto_1372420 ?auto_1372421 ) ) ( not ( = ?auto_1372420 ?auto_1372418 ) ) ( not ( = ?auto_1372420 ?auto_1372422 ) ) ( not ( = ?auto_1372420 ?auto_1372424 ) ) ( not ( = ?auto_1372420 ?auto_1372423 ) ) ( not ( = ?auto_1372420 ?auto_1372425 ) ) ( not ( = ?auto_1372420 ?auto_1372426 ) ) ( not ( = ?auto_1372420 ?auto_1372427 ) ) ( not ( = ?auto_1372420 ?auto_1372428 ) ) ( not ( = ?auto_1372420 ?auto_1372429 ) ) ( not ( = ?auto_1372420 ?auto_1372434 ) ) ( not ( = ?auto_1372421 ?auto_1372418 ) ) ( not ( = ?auto_1372421 ?auto_1372422 ) ) ( not ( = ?auto_1372421 ?auto_1372424 ) ) ( not ( = ?auto_1372421 ?auto_1372423 ) ) ( not ( = ?auto_1372421 ?auto_1372425 ) ) ( not ( = ?auto_1372421 ?auto_1372426 ) ) ( not ( = ?auto_1372421 ?auto_1372427 ) ) ( not ( = ?auto_1372421 ?auto_1372428 ) ) ( not ( = ?auto_1372421 ?auto_1372429 ) ) ( not ( = ?auto_1372421 ?auto_1372434 ) ) ( not ( = ?auto_1372418 ?auto_1372422 ) ) ( not ( = ?auto_1372418 ?auto_1372424 ) ) ( not ( = ?auto_1372418 ?auto_1372423 ) ) ( not ( = ?auto_1372418 ?auto_1372425 ) ) ( not ( = ?auto_1372418 ?auto_1372426 ) ) ( not ( = ?auto_1372418 ?auto_1372427 ) ) ( not ( = ?auto_1372418 ?auto_1372428 ) ) ( not ( = ?auto_1372418 ?auto_1372429 ) ) ( not ( = ?auto_1372418 ?auto_1372434 ) ) ( not ( = ?auto_1372422 ?auto_1372424 ) ) ( not ( = ?auto_1372422 ?auto_1372423 ) ) ( not ( = ?auto_1372422 ?auto_1372425 ) ) ( not ( = ?auto_1372422 ?auto_1372426 ) ) ( not ( = ?auto_1372422 ?auto_1372427 ) ) ( not ( = ?auto_1372422 ?auto_1372428 ) ) ( not ( = ?auto_1372422 ?auto_1372429 ) ) ( not ( = ?auto_1372422 ?auto_1372434 ) ) ( not ( = ?auto_1372424 ?auto_1372423 ) ) ( not ( = ?auto_1372424 ?auto_1372425 ) ) ( not ( = ?auto_1372424 ?auto_1372426 ) ) ( not ( = ?auto_1372424 ?auto_1372427 ) ) ( not ( = ?auto_1372424 ?auto_1372428 ) ) ( not ( = ?auto_1372424 ?auto_1372429 ) ) ( not ( = ?auto_1372424 ?auto_1372434 ) ) ( not ( = ?auto_1372423 ?auto_1372425 ) ) ( not ( = ?auto_1372423 ?auto_1372426 ) ) ( not ( = ?auto_1372423 ?auto_1372427 ) ) ( not ( = ?auto_1372423 ?auto_1372428 ) ) ( not ( = ?auto_1372423 ?auto_1372429 ) ) ( not ( = ?auto_1372423 ?auto_1372434 ) ) ( not ( = ?auto_1372425 ?auto_1372426 ) ) ( not ( = ?auto_1372425 ?auto_1372427 ) ) ( not ( = ?auto_1372425 ?auto_1372428 ) ) ( not ( = ?auto_1372425 ?auto_1372429 ) ) ( not ( = ?auto_1372425 ?auto_1372434 ) ) ( not ( = ?auto_1372426 ?auto_1372427 ) ) ( not ( = ?auto_1372426 ?auto_1372428 ) ) ( not ( = ?auto_1372426 ?auto_1372429 ) ) ( not ( = ?auto_1372426 ?auto_1372434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1372427 ?auto_1372428 ?auto_1372429 )
      ( MAKE-11CRATE-VERIFY ?auto_1372419 ?auto_1372420 ?auto_1372421 ?auto_1372418 ?auto_1372422 ?auto_1372424 ?auto_1372423 ?auto_1372425 ?auto_1372426 ?auto_1372427 ?auto_1372428 ?auto_1372429 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381690 - SURFACE
      ?auto_1381691 - SURFACE
      ?auto_1381692 - SURFACE
      ?auto_1381689 - SURFACE
      ?auto_1381693 - SURFACE
      ?auto_1381695 - SURFACE
      ?auto_1381694 - SURFACE
      ?auto_1381696 - SURFACE
      ?auto_1381697 - SURFACE
      ?auto_1381698 - SURFACE
      ?auto_1381699 - SURFACE
      ?auto_1381700 - SURFACE
      ?auto_1381701 - SURFACE
    )
    :vars
    (
      ?auto_1381703 - HOIST
      ?auto_1381702 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381703 ?auto_1381702 ) ( SURFACE-AT ?auto_1381700 ?auto_1381702 ) ( CLEAR ?auto_1381700 ) ( LIFTING ?auto_1381703 ?auto_1381701 ) ( IS-CRATE ?auto_1381701 ) ( not ( = ?auto_1381700 ?auto_1381701 ) ) ( ON ?auto_1381691 ?auto_1381690 ) ( ON ?auto_1381692 ?auto_1381691 ) ( ON ?auto_1381689 ?auto_1381692 ) ( ON ?auto_1381693 ?auto_1381689 ) ( ON ?auto_1381695 ?auto_1381693 ) ( ON ?auto_1381694 ?auto_1381695 ) ( ON ?auto_1381696 ?auto_1381694 ) ( ON ?auto_1381697 ?auto_1381696 ) ( ON ?auto_1381698 ?auto_1381697 ) ( ON ?auto_1381699 ?auto_1381698 ) ( ON ?auto_1381700 ?auto_1381699 ) ( not ( = ?auto_1381690 ?auto_1381691 ) ) ( not ( = ?auto_1381690 ?auto_1381692 ) ) ( not ( = ?auto_1381690 ?auto_1381689 ) ) ( not ( = ?auto_1381690 ?auto_1381693 ) ) ( not ( = ?auto_1381690 ?auto_1381695 ) ) ( not ( = ?auto_1381690 ?auto_1381694 ) ) ( not ( = ?auto_1381690 ?auto_1381696 ) ) ( not ( = ?auto_1381690 ?auto_1381697 ) ) ( not ( = ?auto_1381690 ?auto_1381698 ) ) ( not ( = ?auto_1381690 ?auto_1381699 ) ) ( not ( = ?auto_1381690 ?auto_1381700 ) ) ( not ( = ?auto_1381690 ?auto_1381701 ) ) ( not ( = ?auto_1381691 ?auto_1381692 ) ) ( not ( = ?auto_1381691 ?auto_1381689 ) ) ( not ( = ?auto_1381691 ?auto_1381693 ) ) ( not ( = ?auto_1381691 ?auto_1381695 ) ) ( not ( = ?auto_1381691 ?auto_1381694 ) ) ( not ( = ?auto_1381691 ?auto_1381696 ) ) ( not ( = ?auto_1381691 ?auto_1381697 ) ) ( not ( = ?auto_1381691 ?auto_1381698 ) ) ( not ( = ?auto_1381691 ?auto_1381699 ) ) ( not ( = ?auto_1381691 ?auto_1381700 ) ) ( not ( = ?auto_1381691 ?auto_1381701 ) ) ( not ( = ?auto_1381692 ?auto_1381689 ) ) ( not ( = ?auto_1381692 ?auto_1381693 ) ) ( not ( = ?auto_1381692 ?auto_1381695 ) ) ( not ( = ?auto_1381692 ?auto_1381694 ) ) ( not ( = ?auto_1381692 ?auto_1381696 ) ) ( not ( = ?auto_1381692 ?auto_1381697 ) ) ( not ( = ?auto_1381692 ?auto_1381698 ) ) ( not ( = ?auto_1381692 ?auto_1381699 ) ) ( not ( = ?auto_1381692 ?auto_1381700 ) ) ( not ( = ?auto_1381692 ?auto_1381701 ) ) ( not ( = ?auto_1381689 ?auto_1381693 ) ) ( not ( = ?auto_1381689 ?auto_1381695 ) ) ( not ( = ?auto_1381689 ?auto_1381694 ) ) ( not ( = ?auto_1381689 ?auto_1381696 ) ) ( not ( = ?auto_1381689 ?auto_1381697 ) ) ( not ( = ?auto_1381689 ?auto_1381698 ) ) ( not ( = ?auto_1381689 ?auto_1381699 ) ) ( not ( = ?auto_1381689 ?auto_1381700 ) ) ( not ( = ?auto_1381689 ?auto_1381701 ) ) ( not ( = ?auto_1381693 ?auto_1381695 ) ) ( not ( = ?auto_1381693 ?auto_1381694 ) ) ( not ( = ?auto_1381693 ?auto_1381696 ) ) ( not ( = ?auto_1381693 ?auto_1381697 ) ) ( not ( = ?auto_1381693 ?auto_1381698 ) ) ( not ( = ?auto_1381693 ?auto_1381699 ) ) ( not ( = ?auto_1381693 ?auto_1381700 ) ) ( not ( = ?auto_1381693 ?auto_1381701 ) ) ( not ( = ?auto_1381695 ?auto_1381694 ) ) ( not ( = ?auto_1381695 ?auto_1381696 ) ) ( not ( = ?auto_1381695 ?auto_1381697 ) ) ( not ( = ?auto_1381695 ?auto_1381698 ) ) ( not ( = ?auto_1381695 ?auto_1381699 ) ) ( not ( = ?auto_1381695 ?auto_1381700 ) ) ( not ( = ?auto_1381695 ?auto_1381701 ) ) ( not ( = ?auto_1381694 ?auto_1381696 ) ) ( not ( = ?auto_1381694 ?auto_1381697 ) ) ( not ( = ?auto_1381694 ?auto_1381698 ) ) ( not ( = ?auto_1381694 ?auto_1381699 ) ) ( not ( = ?auto_1381694 ?auto_1381700 ) ) ( not ( = ?auto_1381694 ?auto_1381701 ) ) ( not ( = ?auto_1381696 ?auto_1381697 ) ) ( not ( = ?auto_1381696 ?auto_1381698 ) ) ( not ( = ?auto_1381696 ?auto_1381699 ) ) ( not ( = ?auto_1381696 ?auto_1381700 ) ) ( not ( = ?auto_1381696 ?auto_1381701 ) ) ( not ( = ?auto_1381697 ?auto_1381698 ) ) ( not ( = ?auto_1381697 ?auto_1381699 ) ) ( not ( = ?auto_1381697 ?auto_1381700 ) ) ( not ( = ?auto_1381697 ?auto_1381701 ) ) ( not ( = ?auto_1381698 ?auto_1381699 ) ) ( not ( = ?auto_1381698 ?auto_1381700 ) ) ( not ( = ?auto_1381698 ?auto_1381701 ) ) ( not ( = ?auto_1381699 ?auto_1381700 ) ) ( not ( = ?auto_1381699 ?auto_1381701 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1381700 ?auto_1381701 )
      ( MAKE-12CRATE-VERIFY ?auto_1381690 ?auto_1381691 ?auto_1381692 ?auto_1381689 ?auto_1381693 ?auto_1381695 ?auto_1381694 ?auto_1381696 ?auto_1381697 ?auto_1381698 ?auto_1381699 ?auto_1381700 ?auto_1381701 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381815 - SURFACE
      ?auto_1381816 - SURFACE
      ?auto_1381817 - SURFACE
      ?auto_1381814 - SURFACE
      ?auto_1381818 - SURFACE
      ?auto_1381820 - SURFACE
      ?auto_1381819 - SURFACE
      ?auto_1381821 - SURFACE
      ?auto_1381822 - SURFACE
      ?auto_1381823 - SURFACE
      ?auto_1381824 - SURFACE
      ?auto_1381825 - SURFACE
      ?auto_1381826 - SURFACE
    )
    :vars
    (
      ?auto_1381827 - HOIST
      ?auto_1381829 - PLACE
      ?auto_1381828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381827 ?auto_1381829 ) ( SURFACE-AT ?auto_1381825 ?auto_1381829 ) ( CLEAR ?auto_1381825 ) ( IS-CRATE ?auto_1381826 ) ( not ( = ?auto_1381825 ?auto_1381826 ) ) ( TRUCK-AT ?auto_1381828 ?auto_1381829 ) ( AVAILABLE ?auto_1381827 ) ( IN ?auto_1381826 ?auto_1381828 ) ( ON ?auto_1381825 ?auto_1381824 ) ( not ( = ?auto_1381824 ?auto_1381825 ) ) ( not ( = ?auto_1381824 ?auto_1381826 ) ) ( ON ?auto_1381816 ?auto_1381815 ) ( ON ?auto_1381817 ?auto_1381816 ) ( ON ?auto_1381814 ?auto_1381817 ) ( ON ?auto_1381818 ?auto_1381814 ) ( ON ?auto_1381820 ?auto_1381818 ) ( ON ?auto_1381819 ?auto_1381820 ) ( ON ?auto_1381821 ?auto_1381819 ) ( ON ?auto_1381822 ?auto_1381821 ) ( ON ?auto_1381823 ?auto_1381822 ) ( ON ?auto_1381824 ?auto_1381823 ) ( not ( = ?auto_1381815 ?auto_1381816 ) ) ( not ( = ?auto_1381815 ?auto_1381817 ) ) ( not ( = ?auto_1381815 ?auto_1381814 ) ) ( not ( = ?auto_1381815 ?auto_1381818 ) ) ( not ( = ?auto_1381815 ?auto_1381820 ) ) ( not ( = ?auto_1381815 ?auto_1381819 ) ) ( not ( = ?auto_1381815 ?auto_1381821 ) ) ( not ( = ?auto_1381815 ?auto_1381822 ) ) ( not ( = ?auto_1381815 ?auto_1381823 ) ) ( not ( = ?auto_1381815 ?auto_1381824 ) ) ( not ( = ?auto_1381815 ?auto_1381825 ) ) ( not ( = ?auto_1381815 ?auto_1381826 ) ) ( not ( = ?auto_1381816 ?auto_1381817 ) ) ( not ( = ?auto_1381816 ?auto_1381814 ) ) ( not ( = ?auto_1381816 ?auto_1381818 ) ) ( not ( = ?auto_1381816 ?auto_1381820 ) ) ( not ( = ?auto_1381816 ?auto_1381819 ) ) ( not ( = ?auto_1381816 ?auto_1381821 ) ) ( not ( = ?auto_1381816 ?auto_1381822 ) ) ( not ( = ?auto_1381816 ?auto_1381823 ) ) ( not ( = ?auto_1381816 ?auto_1381824 ) ) ( not ( = ?auto_1381816 ?auto_1381825 ) ) ( not ( = ?auto_1381816 ?auto_1381826 ) ) ( not ( = ?auto_1381817 ?auto_1381814 ) ) ( not ( = ?auto_1381817 ?auto_1381818 ) ) ( not ( = ?auto_1381817 ?auto_1381820 ) ) ( not ( = ?auto_1381817 ?auto_1381819 ) ) ( not ( = ?auto_1381817 ?auto_1381821 ) ) ( not ( = ?auto_1381817 ?auto_1381822 ) ) ( not ( = ?auto_1381817 ?auto_1381823 ) ) ( not ( = ?auto_1381817 ?auto_1381824 ) ) ( not ( = ?auto_1381817 ?auto_1381825 ) ) ( not ( = ?auto_1381817 ?auto_1381826 ) ) ( not ( = ?auto_1381814 ?auto_1381818 ) ) ( not ( = ?auto_1381814 ?auto_1381820 ) ) ( not ( = ?auto_1381814 ?auto_1381819 ) ) ( not ( = ?auto_1381814 ?auto_1381821 ) ) ( not ( = ?auto_1381814 ?auto_1381822 ) ) ( not ( = ?auto_1381814 ?auto_1381823 ) ) ( not ( = ?auto_1381814 ?auto_1381824 ) ) ( not ( = ?auto_1381814 ?auto_1381825 ) ) ( not ( = ?auto_1381814 ?auto_1381826 ) ) ( not ( = ?auto_1381818 ?auto_1381820 ) ) ( not ( = ?auto_1381818 ?auto_1381819 ) ) ( not ( = ?auto_1381818 ?auto_1381821 ) ) ( not ( = ?auto_1381818 ?auto_1381822 ) ) ( not ( = ?auto_1381818 ?auto_1381823 ) ) ( not ( = ?auto_1381818 ?auto_1381824 ) ) ( not ( = ?auto_1381818 ?auto_1381825 ) ) ( not ( = ?auto_1381818 ?auto_1381826 ) ) ( not ( = ?auto_1381820 ?auto_1381819 ) ) ( not ( = ?auto_1381820 ?auto_1381821 ) ) ( not ( = ?auto_1381820 ?auto_1381822 ) ) ( not ( = ?auto_1381820 ?auto_1381823 ) ) ( not ( = ?auto_1381820 ?auto_1381824 ) ) ( not ( = ?auto_1381820 ?auto_1381825 ) ) ( not ( = ?auto_1381820 ?auto_1381826 ) ) ( not ( = ?auto_1381819 ?auto_1381821 ) ) ( not ( = ?auto_1381819 ?auto_1381822 ) ) ( not ( = ?auto_1381819 ?auto_1381823 ) ) ( not ( = ?auto_1381819 ?auto_1381824 ) ) ( not ( = ?auto_1381819 ?auto_1381825 ) ) ( not ( = ?auto_1381819 ?auto_1381826 ) ) ( not ( = ?auto_1381821 ?auto_1381822 ) ) ( not ( = ?auto_1381821 ?auto_1381823 ) ) ( not ( = ?auto_1381821 ?auto_1381824 ) ) ( not ( = ?auto_1381821 ?auto_1381825 ) ) ( not ( = ?auto_1381821 ?auto_1381826 ) ) ( not ( = ?auto_1381822 ?auto_1381823 ) ) ( not ( = ?auto_1381822 ?auto_1381824 ) ) ( not ( = ?auto_1381822 ?auto_1381825 ) ) ( not ( = ?auto_1381822 ?auto_1381826 ) ) ( not ( = ?auto_1381823 ?auto_1381824 ) ) ( not ( = ?auto_1381823 ?auto_1381825 ) ) ( not ( = ?auto_1381823 ?auto_1381826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1381824 ?auto_1381825 ?auto_1381826 )
      ( MAKE-12CRATE-VERIFY ?auto_1381815 ?auto_1381816 ?auto_1381817 ?auto_1381814 ?auto_1381818 ?auto_1381820 ?auto_1381819 ?auto_1381821 ?auto_1381822 ?auto_1381823 ?auto_1381824 ?auto_1381825 ?auto_1381826 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1381953 - SURFACE
      ?auto_1381954 - SURFACE
      ?auto_1381955 - SURFACE
      ?auto_1381952 - SURFACE
      ?auto_1381956 - SURFACE
      ?auto_1381958 - SURFACE
      ?auto_1381957 - SURFACE
      ?auto_1381959 - SURFACE
      ?auto_1381960 - SURFACE
      ?auto_1381961 - SURFACE
      ?auto_1381962 - SURFACE
      ?auto_1381963 - SURFACE
      ?auto_1381964 - SURFACE
    )
    :vars
    (
      ?auto_1381968 - HOIST
      ?auto_1381967 - PLACE
      ?auto_1381966 - TRUCK
      ?auto_1381965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1381968 ?auto_1381967 ) ( SURFACE-AT ?auto_1381963 ?auto_1381967 ) ( CLEAR ?auto_1381963 ) ( IS-CRATE ?auto_1381964 ) ( not ( = ?auto_1381963 ?auto_1381964 ) ) ( AVAILABLE ?auto_1381968 ) ( IN ?auto_1381964 ?auto_1381966 ) ( ON ?auto_1381963 ?auto_1381962 ) ( not ( = ?auto_1381962 ?auto_1381963 ) ) ( not ( = ?auto_1381962 ?auto_1381964 ) ) ( TRUCK-AT ?auto_1381966 ?auto_1381965 ) ( not ( = ?auto_1381965 ?auto_1381967 ) ) ( ON ?auto_1381954 ?auto_1381953 ) ( ON ?auto_1381955 ?auto_1381954 ) ( ON ?auto_1381952 ?auto_1381955 ) ( ON ?auto_1381956 ?auto_1381952 ) ( ON ?auto_1381958 ?auto_1381956 ) ( ON ?auto_1381957 ?auto_1381958 ) ( ON ?auto_1381959 ?auto_1381957 ) ( ON ?auto_1381960 ?auto_1381959 ) ( ON ?auto_1381961 ?auto_1381960 ) ( ON ?auto_1381962 ?auto_1381961 ) ( not ( = ?auto_1381953 ?auto_1381954 ) ) ( not ( = ?auto_1381953 ?auto_1381955 ) ) ( not ( = ?auto_1381953 ?auto_1381952 ) ) ( not ( = ?auto_1381953 ?auto_1381956 ) ) ( not ( = ?auto_1381953 ?auto_1381958 ) ) ( not ( = ?auto_1381953 ?auto_1381957 ) ) ( not ( = ?auto_1381953 ?auto_1381959 ) ) ( not ( = ?auto_1381953 ?auto_1381960 ) ) ( not ( = ?auto_1381953 ?auto_1381961 ) ) ( not ( = ?auto_1381953 ?auto_1381962 ) ) ( not ( = ?auto_1381953 ?auto_1381963 ) ) ( not ( = ?auto_1381953 ?auto_1381964 ) ) ( not ( = ?auto_1381954 ?auto_1381955 ) ) ( not ( = ?auto_1381954 ?auto_1381952 ) ) ( not ( = ?auto_1381954 ?auto_1381956 ) ) ( not ( = ?auto_1381954 ?auto_1381958 ) ) ( not ( = ?auto_1381954 ?auto_1381957 ) ) ( not ( = ?auto_1381954 ?auto_1381959 ) ) ( not ( = ?auto_1381954 ?auto_1381960 ) ) ( not ( = ?auto_1381954 ?auto_1381961 ) ) ( not ( = ?auto_1381954 ?auto_1381962 ) ) ( not ( = ?auto_1381954 ?auto_1381963 ) ) ( not ( = ?auto_1381954 ?auto_1381964 ) ) ( not ( = ?auto_1381955 ?auto_1381952 ) ) ( not ( = ?auto_1381955 ?auto_1381956 ) ) ( not ( = ?auto_1381955 ?auto_1381958 ) ) ( not ( = ?auto_1381955 ?auto_1381957 ) ) ( not ( = ?auto_1381955 ?auto_1381959 ) ) ( not ( = ?auto_1381955 ?auto_1381960 ) ) ( not ( = ?auto_1381955 ?auto_1381961 ) ) ( not ( = ?auto_1381955 ?auto_1381962 ) ) ( not ( = ?auto_1381955 ?auto_1381963 ) ) ( not ( = ?auto_1381955 ?auto_1381964 ) ) ( not ( = ?auto_1381952 ?auto_1381956 ) ) ( not ( = ?auto_1381952 ?auto_1381958 ) ) ( not ( = ?auto_1381952 ?auto_1381957 ) ) ( not ( = ?auto_1381952 ?auto_1381959 ) ) ( not ( = ?auto_1381952 ?auto_1381960 ) ) ( not ( = ?auto_1381952 ?auto_1381961 ) ) ( not ( = ?auto_1381952 ?auto_1381962 ) ) ( not ( = ?auto_1381952 ?auto_1381963 ) ) ( not ( = ?auto_1381952 ?auto_1381964 ) ) ( not ( = ?auto_1381956 ?auto_1381958 ) ) ( not ( = ?auto_1381956 ?auto_1381957 ) ) ( not ( = ?auto_1381956 ?auto_1381959 ) ) ( not ( = ?auto_1381956 ?auto_1381960 ) ) ( not ( = ?auto_1381956 ?auto_1381961 ) ) ( not ( = ?auto_1381956 ?auto_1381962 ) ) ( not ( = ?auto_1381956 ?auto_1381963 ) ) ( not ( = ?auto_1381956 ?auto_1381964 ) ) ( not ( = ?auto_1381958 ?auto_1381957 ) ) ( not ( = ?auto_1381958 ?auto_1381959 ) ) ( not ( = ?auto_1381958 ?auto_1381960 ) ) ( not ( = ?auto_1381958 ?auto_1381961 ) ) ( not ( = ?auto_1381958 ?auto_1381962 ) ) ( not ( = ?auto_1381958 ?auto_1381963 ) ) ( not ( = ?auto_1381958 ?auto_1381964 ) ) ( not ( = ?auto_1381957 ?auto_1381959 ) ) ( not ( = ?auto_1381957 ?auto_1381960 ) ) ( not ( = ?auto_1381957 ?auto_1381961 ) ) ( not ( = ?auto_1381957 ?auto_1381962 ) ) ( not ( = ?auto_1381957 ?auto_1381963 ) ) ( not ( = ?auto_1381957 ?auto_1381964 ) ) ( not ( = ?auto_1381959 ?auto_1381960 ) ) ( not ( = ?auto_1381959 ?auto_1381961 ) ) ( not ( = ?auto_1381959 ?auto_1381962 ) ) ( not ( = ?auto_1381959 ?auto_1381963 ) ) ( not ( = ?auto_1381959 ?auto_1381964 ) ) ( not ( = ?auto_1381960 ?auto_1381961 ) ) ( not ( = ?auto_1381960 ?auto_1381962 ) ) ( not ( = ?auto_1381960 ?auto_1381963 ) ) ( not ( = ?auto_1381960 ?auto_1381964 ) ) ( not ( = ?auto_1381961 ?auto_1381962 ) ) ( not ( = ?auto_1381961 ?auto_1381963 ) ) ( not ( = ?auto_1381961 ?auto_1381964 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1381962 ?auto_1381963 ?auto_1381964 )
      ( MAKE-12CRATE-VERIFY ?auto_1381953 ?auto_1381954 ?auto_1381955 ?auto_1381952 ?auto_1381956 ?auto_1381958 ?auto_1381957 ?auto_1381959 ?auto_1381960 ?auto_1381961 ?auto_1381962 ?auto_1381963 ?auto_1381964 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382103 - SURFACE
      ?auto_1382104 - SURFACE
      ?auto_1382105 - SURFACE
      ?auto_1382102 - SURFACE
      ?auto_1382106 - SURFACE
      ?auto_1382108 - SURFACE
      ?auto_1382107 - SURFACE
      ?auto_1382109 - SURFACE
      ?auto_1382110 - SURFACE
      ?auto_1382111 - SURFACE
      ?auto_1382112 - SURFACE
      ?auto_1382113 - SURFACE
      ?auto_1382114 - SURFACE
    )
    :vars
    (
      ?auto_1382116 - HOIST
      ?auto_1382119 - PLACE
      ?auto_1382117 - TRUCK
      ?auto_1382118 - PLACE
      ?auto_1382115 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382116 ?auto_1382119 ) ( SURFACE-AT ?auto_1382113 ?auto_1382119 ) ( CLEAR ?auto_1382113 ) ( IS-CRATE ?auto_1382114 ) ( not ( = ?auto_1382113 ?auto_1382114 ) ) ( AVAILABLE ?auto_1382116 ) ( ON ?auto_1382113 ?auto_1382112 ) ( not ( = ?auto_1382112 ?auto_1382113 ) ) ( not ( = ?auto_1382112 ?auto_1382114 ) ) ( TRUCK-AT ?auto_1382117 ?auto_1382118 ) ( not ( = ?auto_1382118 ?auto_1382119 ) ) ( HOIST-AT ?auto_1382115 ?auto_1382118 ) ( LIFTING ?auto_1382115 ?auto_1382114 ) ( not ( = ?auto_1382116 ?auto_1382115 ) ) ( ON ?auto_1382104 ?auto_1382103 ) ( ON ?auto_1382105 ?auto_1382104 ) ( ON ?auto_1382102 ?auto_1382105 ) ( ON ?auto_1382106 ?auto_1382102 ) ( ON ?auto_1382108 ?auto_1382106 ) ( ON ?auto_1382107 ?auto_1382108 ) ( ON ?auto_1382109 ?auto_1382107 ) ( ON ?auto_1382110 ?auto_1382109 ) ( ON ?auto_1382111 ?auto_1382110 ) ( ON ?auto_1382112 ?auto_1382111 ) ( not ( = ?auto_1382103 ?auto_1382104 ) ) ( not ( = ?auto_1382103 ?auto_1382105 ) ) ( not ( = ?auto_1382103 ?auto_1382102 ) ) ( not ( = ?auto_1382103 ?auto_1382106 ) ) ( not ( = ?auto_1382103 ?auto_1382108 ) ) ( not ( = ?auto_1382103 ?auto_1382107 ) ) ( not ( = ?auto_1382103 ?auto_1382109 ) ) ( not ( = ?auto_1382103 ?auto_1382110 ) ) ( not ( = ?auto_1382103 ?auto_1382111 ) ) ( not ( = ?auto_1382103 ?auto_1382112 ) ) ( not ( = ?auto_1382103 ?auto_1382113 ) ) ( not ( = ?auto_1382103 ?auto_1382114 ) ) ( not ( = ?auto_1382104 ?auto_1382105 ) ) ( not ( = ?auto_1382104 ?auto_1382102 ) ) ( not ( = ?auto_1382104 ?auto_1382106 ) ) ( not ( = ?auto_1382104 ?auto_1382108 ) ) ( not ( = ?auto_1382104 ?auto_1382107 ) ) ( not ( = ?auto_1382104 ?auto_1382109 ) ) ( not ( = ?auto_1382104 ?auto_1382110 ) ) ( not ( = ?auto_1382104 ?auto_1382111 ) ) ( not ( = ?auto_1382104 ?auto_1382112 ) ) ( not ( = ?auto_1382104 ?auto_1382113 ) ) ( not ( = ?auto_1382104 ?auto_1382114 ) ) ( not ( = ?auto_1382105 ?auto_1382102 ) ) ( not ( = ?auto_1382105 ?auto_1382106 ) ) ( not ( = ?auto_1382105 ?auto_1382108 ) ) ( not ( = ?auto_1382105 ?auto_1382107 ) ) ( not ( = ?auto_1382105 ?auto_1382109 ) ) ( not ( = ?auto_1382105 ?auto_1382110 ) ) ( not ( = ?auto_1382105 ?auto_1382111 ) ) ( not ( = ?auto_1382105 ?auto_1382112 ) ) ( not ( = ?auto_1382105 ?auto_1382113 ) ) ( not ( = ?auto_1382105 ?auto_1382114 ) ) ( not ( = ?auto_1382102 ?auto_1382106 ) ) ( not ( = ?auto_1382102 ?auto_1382108 ) ) ( not ( = ?auto_1382102 ?auto_1382107 ) ) ( not ( = ?auto_1382102 ?auto_1382109 ) ) ( not ( = ?auto_1382102 ?auto_1382110 ) ) ( not ( = ?auto_1382102 ?auto_1382111 ) ) ( not ( = ?auto_1382102 ?auto_1382112 ) ) ( not ( = ?auto_1382102 ?auto_1382113 ) ) ( not ( = ?auto_1382102 ?auto_1382114 ) ) ( not ( = ?auto_1382106 ?auto_1382108 ) ) ( not ( = ?auto_1382106 ?auto_1382107 ) ) ( not ( = ?auto_1382106 ?auto_1382109 ) ) ( not ( = ?auto_1382106 ?auto_1382110 ) ) ( not ( = ?auto_1382106 ?auto_1382111 ) ) ( not ( = ?auto_1382106 ?auto_1382112 ) ) ( not ( = ?auto_1382106 ?auto_1382113 ) ) ( not ( = ?auto_1382106 ?auto_1382114 ) ) ( not ( = ?auto_1382108 ?auto_1382107 ) ) ( not ( = ?auto_1382108 ?auto_1382109 ) ) ( not ( = ?auto_1382108 ?auto_1382110 ) ) ( not ( = ?auto_1382108 ?auto_1382111 ) ) ( not ( = ?auto_1382108 ?auto_1382112 ) ) ( not ( = ?auto_1382108 ?auto_1382113 ) ) ( not ( = ?auto_1382108 ?auto_1382114 ) ) ( not ( = ?auto_1382107 ?auto_1382109 ) ) ( not ( = ?auto_1382107 ?auto_1382110 ) ) ( not ( = ?auto_1382107 ?auto_1382111 ) ) ( not ( = ?auto_1382107 ?auto_1382112 ) ) ( not ( = ?auto_1382107 ?auto_1382113 ) ) ( not ( = ?auto_1382107 ?auto_1382114 ) ) ( not ( = ?auto_1382109 ?auto_1382110 ) ) ( not ( = ?auto_1382109 ?auto_1382111 ) ) ( not ( = ?auto_1382109 ?auto_1382112 ) ) ( not ( = ?auto_1382109 ?auto_1382113 ) ) ( not ( = ?auto_1382109 ?auto_1382114 ) ) ( not ( = ?auto_1382110 ?auto_1382111 ) ) ( not ( = ?auto_1382110 ?auto_1382112 ) ) ( not ( = ?auto_1382110 ?auto_1382113 ) ) ( not ( = ?auto_1382110 ?auto_1382114 ) ) ( not ( = ?auto_1382111 ?auto_1382112 ) ) ( not ( = ?auto_1382111 ?auto_1382113 ) ) ( not ( = ?auto_1382111 ?auto_1382114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382112 ?auto_1382113 ?auto_1382114 )
      ( MAKE-12CRATE-VERIFY ?auto_1382103 ?auto_1382104 ?auto_1382105 ?auto_1382102 ?auto_1382106 ?auto_1382108 ?auto_1382107 ?auto_1382109 ?auto_1382110 ?auto_1382111 ?auto_1382112 ?auto_1382113 ?auto_1382114 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382265 - SURFACE
      ?auto_1382266 - SURFACE
      ?auto_1382267 - SURFACE
      ?auto_1382264 - SURFACE
      ?auto_1382268 - SURFACE
      ?auto_1382270 - SURFACE
      ?auto_1382269 - SURFACE
      ?auto_1382271 - SURFACE
      ?auto_1382272 - SURFACE
      ?auto_1382273 - SURFACE
      ?auto_1382274 - SURFACE
      ?auto_1382275 - SURFACE
      ?auto_1382276 - SURFACE
    )
    :vars
    (
      ?auto_1382278 - HOIST
      ?auto_1382279 - PLACE
      ?auto_1382282 - TRUCK
      ?auto_1382277 - PLACE
      ?auto_1382280 - HOIST
      ?auto_1382281 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382278 ?auto_1382279 ) ( SURFACE-AT ?auto_1382275 ?auto_1382279 ) ( CLEAR ?auto_1382275 ) ( IS-CRATE ?auto_1382276 ) ( not ( = ?auto_1382275 ?auto_1382276 ) ) ( AVAILABLE ?auto_1382278 ) ( ON ?auto_1382275 ?auto_1382274 ) ( not ( = ?auto_1382274 ?auto_1382275 ) ) ( not ( = ?auto_1382274 ?auto_1382276 ) ) ( TRUCK-AT ?auto_1382282 ?auto_1382277 ) ( not ( = ?auto_1382277 ?auto_1382279 ) ) ( HOIST-AT ?auto_1382280 ?auto_1382277 ) ( not ( = ?auto_1382278 ?auto_1382280 ) ) ( AVAILABLE ?auto_1382280 ) ( SURFACE-AT ?auto_1382276 ?auto_1382277 ) ( ON ?auto_1382276 ?auto_1382281 ) ( CLEAR ?auto_1382276 ) ( not ( = ?auto_1382275 ?auto_1382281 ) ) ( not ( = ?auto_1382276 ?auto_1382281 ) ) ( not ( = ?auto_1382274 ?auto_1382281 ) ) ( ON ?auto_1382266 ?auto_1382265 ) ( ON ?auto_1382267 ?auto_1382266 ) ( ON ?auto_1382264 ?auto_1382267 ) ( ON ?auto_1382268 ?auto_1382264 ) ( ON ?auto_1382270 ?auto_1382268 ) ( ON ?auto_1382269 ?auto_1382270 ) ( ON ?auto_1382271 ?auto_1382269 ) ( ON ?auto_1382272 ?auto_1382271 ) ( ON ?auto_1382273 ?auto_1382272 ) ( ON ?auto_1382274 ?auto_1382273 ) ( not ( = ?auto_1382265 ?auto_1382266 ) ) ( not ( = ?auto_1382265 ?auto_1382267 ) ) ( not ( = ?auto_1382265 ?auto_1382264 ) ) ( not ( = ?auto_1382265 ?auto_1382268 ) ) ( not ( = ?auto_1382265 ?auto_1382270 ) ) ( not ( = ?auto_1382265 ?auto_1382269 ) ) ( not ( = ?auto_1382265 ?auto_1382271 ) ) ( not ( = ?auto_1382265 ?auto_1382272 ) ) ( not ( = ?auto_1382265 ?auto_1382273 ) ) ( not ( = ?auto_1382265 ?auto_1382274 ) ) ( not ( = ?auto_1382265 ?auto_1382275 ) ) ( not ( = ?auto_1382265 ?auto_1382276 ) ) ( not ( = ?auto_1382265 ?auto_1382281 ) ) ( not ( = ?auto_1382266 ?auto_1382267 ) ) ( not ( = ?auto_1382266 ?auto_1382264 ) ) ( not ( = ?auto_1382266 ?auto_1382268 ) ) ( not ( = ?auto_1382266 ?auto_1382270 ) ) ( not ( = ?auto_1382266 ?auto_1382269 ) ) ( not ( = ?auto_1382266 ?auto_1382271 ) ) ( not ( = ?auto_1382266 ?auto_1382272 ) ) ( not ( = ?auto_1382266 ?auto_1382273 ) ) ( not ( = ?auto_1382266 ?auto_1382274 ) ) ( not ( = ?auto_1382266 ?auto_1382275 ) ) ( not ( = ?auto_1382266 ?auto_1382276 ) ) ( not ( = ?auto_1382266 ?auto_1382281 ) ) ( not ( = ?auto_1382267 ?auto_1382264 ) ) ( not ( = ?auto_1382267 ?auto_1382268 ) ) ( not ( = ?auto_1382267 ?auto_1382270 ) ) ( not ( = ?auto_1382267 ?auto_1382269 ) ) ( not ( = ?auto_1382267 ?auto_1382271 ) ) ( not ( = ?auto_1382267 ?auto_1382272 ) ) ( not ( = ?auto_1382267 ?auto_1382273 ) ) ( not ( = ?auto_1382267 ?auto_1382274 ) ) ( not ( = ?auto_1382267 ?auto_1382275 ) ) ( not ( = ?auto_1382267 ?auto_1382276 ) ) ( not ( = ?auto_1382267 ?auto_1382281 ) ) ( not ( = ?auto_1382264 ?auto_1382268 ) ) ( not ( = ?auto_1382264 ?auto_1382270 ) ) ( not ( = ?auto_1382264 ?auto_1382269 ) ) ( not ( = ?auto_1382264 ?auto_1382271 ) ) ( not ( = ?auto_1382264 ?auto_1382272 ) ) ( not ( = ?auto_1382264 ?auto_1382273 ) ) ( not ( = ?auto_1382264 ?auto_1382274 ) ) ( not ( = ?auto_1382264 ?auto_1382275 ) ) ( not ( = ?auto_1382264 ?auto_1382276 ) ) ( not ( = ?auto_1382264 ?auto_1382281 ) ) ( not ( = ?auto_1382268 ?auto_1382270 ) ) ( not ( = ?auto_1382268 ?auto_1382269 ) ) ( not ( = ?auto_1382268 ?auto_1382271 ) ) ( not ( = ?auto_1382268 ?auto_1382272 ) ) ( not ( = ?auto_1382268 ?auto_1382273 ) ) ( not ( = ?auto_1382268 ?auto_1382274 ) ) ( not ( = ?auto_1382268 ?auto_1382275 ) ) ( not ( = ?auto_1382268 ?auto_1382276 ) ) ( not ( = ?auto_1382268 ?auto_1382281 ) ) ( not ( = ?auto_1382270 ?auto_1382269 ) ) ( not ( = ?auto_1382270 ?auto_1382271 ) ) ( not ( = ?auto_1382270 ?auto_1382272 ) ) ( not ( = ?auto_1382270 ?auto_1382273 ) ) ( not ( = ?auto_1382270 ?auto_1382274 ) ) ( not ( = ?auto_1382270 ?auto_1382275 ) ) ( not ( = ?auto_1382270 ?auto_1382276 ) ) ( not ( = ?auto_1382270 ?auto_1382281 ) ) ( not ( = ?auto_1382269 ?auto_1382271 ) ) ( not ( = ?auto_1382269 ?auto_1382272 ) ) ( not ( = ?auto_1382269 ?auto_1382273 ) ) ( not ( = ?auto_1382269 ?auto_1382274 ) ) ( not ( = ?auto_1382269 ?auto_1382275 ) ) ( not ( = ?auto_1382269 ?auto_1382276 ) ) ( not ( = ?auto_1382269 ?auto_1382281 ) ) ( not ( = ?auto_1382271 ?auto_1382272 ) ) ( not ( = ?auto_1382271 ?auto_1382273 ) ) ( not ( = ?auto_1382271 ?auto_1382274 ) ) ( not ( = ?auto_1382271 ?auto_1382275 ) ) ( not ( = ?auto_1382271 ?auto_1382276 ) ) ( not ( = ?auto_1382271 ?auto_1382281 ) ) ( not ( = ?auto_1382272 ?auto_1382273 ) ) ( not ( = ?auto_1382272 ?auto_1382274 ) ) ( not ( = ?auto_1382272 ?auto_1382275 ) ) ( not ( = ?auto_1382272 ?auto_1382276 ) ) ( not ( = ?auto_1382272 ?auto_1382281 ) ) ( not ( = ?auto_1382273 ?auto_1382274 ) ) ( not ( = ?auto_1382273 ?auto_1382275 ) ) ( not ( = ?auto_1382273 ?auto_1382276 ) ) ( not ( = ?auto_1382273 ?auto_1382281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382274 ?auto_1382275 ?auto_1382276 )
      ( MAKE-12CRATE-VERIFY ?auto_1382265 ?auto_1382266 ?auto_1382267 ?auto_1382264 ?auto_1382268 ?auto_1382270 ?auto_1382269 ?auto_1382271 ?auto_1382272 ?auto_1382273 ?auto_1382274 ?auto_1382275 ?auto_1382276 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382428 - SURFACE
      ?auto_1382429 - SURFACE
      ?auto_1382430 - SURFACE
      ?auto_1382427 - SURFACE
      ?auto_1382431 - SURFACE
      ?auto_1382433 - SURFACE
      ?auto_1382432 - SURFACE
      ?auto_1382434 - SURFACE
      ?auto_1382435 - SURFACE
      ?auto_1382436 - SURFACE
      ?auto_1382437 - SURFACE
      ?auto_1382438 - SURFACE
      ?auto_1382439 - SURFACE
    )
    :vars
    (
      ?auto_1382440 - HOIST
      ?auto_1382441 - PLACE
      ?auto_1382445 - PLACE
      ?auto_1382442 - HOIST
      ?auto_1382443 - SURFACE
      ?auto_1382444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382440 ?auto_1382441 ) ( SURFACE-AT ?auto_1382438 ?auto_1382441 ) ( CLEAR ?auto_1382438 ) ( IS-CRATE ?auto_1382439 ) ( not ( = ?auto_1382438 ?auto_1382439 ) ) ( AVAILABLE ?auto_1382440 ) ( ON ?auto_1382438 ?auto_1382437 ) ( not ( = ?auto_1382437 ?auto_1382438 ) ) ( not ( = ?auto_1382437 ?auto_1382439 ) ) ( not ( = ?auto_1382445 ?auto_1382441 ) ) ( HOIST-AT ?auto_1382442 ?auto_1382445 ) ( not ( = ?auto_1382440 ?auto_1382442 ) ) ( AVAILABLE ?auto_1382442 ) ( SURFACE-AT ?auto_1382439 ?auto_1382445 ) ( ON ?auto_1382439 ?auto_1382443 ) ( CLEAR ?auto_1382439 ) ( not ( = ?auto_1382438 ?auto_1382443 ) ) ( not ( = ?auto_1382439 ?auto_1382443 ) ) ( not ( = ?auto_1382437 ?auto_1382443 ) ) ( TRUCK-AT ?auto_1382444 ?auto_1382441 ) ( ON ?auto_1382429 ?auto_1382428 ) ( ON ?auto_1382430 ?auto_1382429 ) ( ON ?auto_1382427 ?auto_1382430 ) ( ON ?auto_1382431 ?auto_1382427 ) ( ON ?auto_1382433 ?auto_1382431 ) ( ON ?auto_1382432 ?auto_1382433 ) ( ON ?auto_1382434 ?auto_1382432 ) ( ON ?auto_1382435 ?auto_1382434 ) ( ON ?auto_1382436 ?auto_1382435 ) ( ON ?auto_1382437 ?auto_1382436 ) ( not ( = ?auto_1382428 ?auto_1382429 ) ) ( not ( = ?auto_1382428 ?auto_1382430 ) ) ( not ( = ?auto_1382428 ?auto_1382427 ) ) ( not ( = ?auto_1382428 ?auto_1382431 ) ) ( not ( = ?auto_1382428 ?auto_1382433 ) ) ( not ( = ?auto_1382428 ?auto_1382432 ) ) ( not ( = ?auto_1382428 ?auto_1382434 ) ) ( not ( = ?auto_1382428 ?auto_1382435 ) ) ( not ( = ?auto_1382428 ?auto_1382436 ) ) ( not ( = ?auto_1382428 ?auto_1382437 ) ) ( not ( = ?auto_1382428 ?auto_1382438 ) ) ( not ( = ?auto_1382428 ?auto_1382439 ) ) ( not ( = ?auto_1382428 ?auto_1382443 ) ) ( not ( = ?auto_1382429 ?auto_1382430 ) ) ( not ( = ?auto_1382429 ?auto_1382427 ) ) ( not ( = ?auto_1382429 ?auto_1382431 ) ) ( not ( = ?auto_1382429 ?auto_1382433 ) ) ( not ( = ?auto_1382429 ?auto_1382432 ) ) ( not ( = ?auto_1382429 ?auto_1382434 ) ) ( not ( = ?auto_1382429 ?auto_1382435 ) ) ( not ( = ?auto_1382429 ?auto_1382436 ) ) ( not ( = ?auto_1382429 ?auto_1382437 ) ) ( not ( = ?auto_1382429 ?auto_1382438 ) ) ( not ( = ?auto_1382429 ?auto_1382439 ) ) ( not ( = ?auto_1382429 ?auto_1382443 ) ) ( not ( = ?auto_1382430 ?auto_1382427 ) ) ( not ( = ?auto_1382430 ?auto_1382431 ) ) ( not ( = ?auto_1382430 ?auto_1382433 ) ) ( not ( = ?auto_1382430 ?auto_1382432 ) ) ( not ( = ?auto_1382430 ?auto_1382434 ) ) ( not ( = ?auto_1382430 ?auto_1382435 ) ) ( not ( = ?auto_1382430 ?auto_1382436 ) ) ( not ( = ?auto_1382430 ?auto_1382437 ) ) ( not ( = ?auto_1382430 ?auto_1382438 ) ) ( not ( = ?auto_1382430 ?auto_1382439 ) ) ( not ( = ?auto_1382430 ?auto_1382443 ) ) ( not ( = ?auto_1382427 ?auto_1382431 ) ) ( not ( = ?auto_1382427 ?auto_1382433 ) ) ( not ( = ?auto_1382427 ?auto_1382432 ) ) ( not ( = ?auto_1382427 ?auto_1382434 ) ) ( not ( = ?auto_1382427 ?auto_1382435 ) ) ( not ( = ?auto_1382427 ?auto_1382436 ) ) ( not ( = ?auto_1382427 ?auto_1382437 ) ) ( not ( = ?auto_1382427 ?auto_1382438 ) ) ( not ( = ?auto_1382427 ?auto_1382439 ) ) ( not ( = ?auto_1382427 ?auto_1382443 ) ) ( not ( = ?auto_1382431 ?auto_1382433 ) ) ( not ( = ?auto_1382431 ?auto_1382432 ) ) ( not ( = ?auto_1382431 ?auto_1382434 ) ) ( not ( = ?auto_1382431 ?auto_1382435 ) ) ( not ( = ?auto_1382431 ?auto_1382436 ) ) ( not ( = ?auto_1382431 ?auto_1382437 ) ) ( not ( = ?auto_1382431 ?auto_1382438 ) ) ( not ( = ?auto_1382431 ?auto_1382439 ) ) ( not ( = ?auto_1382431 ?auto_1382443 ) ) ( not ( = ?auto_1382433 ?auto_1382432 ) ) ( not ( = ?auto_1382433 ?auto_1382434 ) ) ( not ( = ?auto_1382433 ?auto_1382435 ) ) ( not ( = ?auto_1382433 ?auto_1382436 ) ) ( not ( = ?auto_1382433 ?auto_1382437 ) ) ( not ( = ?auto_1382433 ?auto_1382438 ) ) ( not ( = ?auto_1382433 ?auto_1382439 ) ) ( not ( = ?auto_1382433 ?auto_1382443 ) ) ( not ( = ?auto_1382432 ?auto_1382434 ) ) ( not ( = ?auto_1382432 ?auto_1382435 ) ) ( not ( = ?auto_1382432 ?auto_1382436 ) ) ( not ( = ?auto_1382432 ?auto_1382437 ) ) ( not ( = ?auto_1382432 ?auto_1382438 ) ) ( not ( = ?auto_1382432 ?auto_1382439 ) ) ( not ( = ?auto_1382432 ?auto_1382443 ) ) ( not ( = ?auto_1382434 ?auto_1382435 ) ) ( not ( = ?auto_1382434 ?auto_1382436 ) ) ( not ( = ?auto_1382434 ?auto_1382437 ) ) ( not ( = ?auto_1382434 ?auto_1382438 ) ) ( not ( = ?auto_1382434 ?auto_1382439 ) ) ( not ( = ?auto_1382434 ?auto_1382443 ) ) ( not ( = ?auto_1382435 ?auto_1382436 ) ) ( not ( = ?auto_1382435 ?auto_1382437 ) ) ( not ( = ?auto_1382435 ?auto_1382438 ) ) ( not ( = ?auto_1382435 ?auto_1382439 ) ) ( not ( = ?auto_1382435 ?auto_1382443 ) ) ( not ( = ?auto_1382436 ?auto_1382437 ) ) ( not ( = ?auto_1382436 ?auto_1382438 ) ) ( not ( = ?auto_1382436 ?auto_1382439 ) ) ( not ( = ?auto_1382436 ?auto_1382443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382437 ?auto_1382438 ?auto_1382439 )
      ( MAKE-12CRATE-VERIFY ?auto_1382428 ?auto_1382429 ?auto_1382430 ?auto_1382427 ?auto_1382431 ?auto_1382433 ?auto_1382432 ?auto_1382434 ?auto_1382435 ?auto_1382436 ?auto_1382437 ?auto_1382438 ?auto_1382439 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382591 - SURFACE
      ?auto_1382592 - SURFACE
      ?auto_1382593 - SURFACE
      ?auto_1382590 - SURFACE
      ?auto_1382594 - SURFACE
      ?auto_1382596 - SURFACE
      ?auto_1382595 - SURFACE
      ?auto_1382597 - SURFACE
      ?auto_1382598 - SURFACE
      ?auto_1382599 - SURFACE
      ?auto_1382600 - SURFACE
      ?auto_1382601 - SURFACE
      ?auto_1382602 - SURFACE
    )
    :vars
    (
      ?auto_1382608 - HOIST
      ?auto_1382605 - PLACE
      ?auto_1382603 - PLACE
      ?auto_1382607 - HOIST
      ?auto_1382604 - SURFACE
      ?auto_1382606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382608 ?auto_1382605 ) ( IS-CRATE ?auto_1382602 ) ( not ( = ?auto_1382601 ?auto_1382602 ) ) ( not ( = ?auto_1382600 ?auto_1382601 ) ) ( not ( = ?auto_1382600 ?auto_1382602 ) ) ( not ( = ?auto_1382603 ?auto_1382605 ) ) ( HOIST-AT ?auto_1382607 ?auto_1382603 ) ( not ( = ?auto_1382608 ?auto_1382607 ) ) ( AVAILABLE ?auto_1382607 ) ( SURFACE-AT ?auto_1382602 ?auto_1382603 ) ( ON ?auto_1382602 ?auto_1382604 ) ( CLEAR ?auto_1382602 ) ( not ( = ?auto_1382601 ?auto_1382604 ) ) ( not ( = ?auto_1382602 ?auto_1382604 ) ) ( not ( = ?auto_1382600 ?auto_1382604 ) ) ( TRUCK-AT ?auto_1382606 ?auto_1382605 ) ( SURFACE-AT ?auto_1382600 ?auto_1382605 ) ( CLEAR ?auto_1382600 ) ( LIFTING ?auto_1382608 ?auto_1382601 ) ( IS-CRATE ?auto_1382601 ) ( ON ?auto_1382592 ?auto_1382591 ) ( ON ?auto_1382593 ?auto_1382592 ) ( ON ?auto_1382590 ?auto_1382593 ) ( ON ?auto_1382594 ?auto_1382590 ) ( ON ?auto_1382596 ?auto_1382594 ) ( ON ?auto_1382595 ?auto_1382596 ) ( ON ?auto_1382597 ?auto_1382595 ) ( ON ?auto_1382598 ?auto_1382597 ) ( ON ?auto_1382599 ?auto_1382598 ) ( ON ?auto_1382600 ?auto_1382599 ) ( not ( = ?auto_1382591 ?auto_1382592 ) ) ( not ( = ?auto_1382591 ?auto_1382593 ) ) ( not ( = ?auto_1382591 ?auto_1382590 ) ) ( not ( = ?auto_1382591 ?auto_1382594 ) ) ( not ( = ?auto_1382591 ?auto_1382596 ) ) ( not ( = ?auto_1382591 ?auto_1382595 ) ) ( not ( = ?auto_1382591 ?auto_1382597 ) ) ( not ( = ?auto_1382591 ?auto_1382598 ) ) ( not ( = ?auto_1382591 ?auto_1382599 ) ) ( not ( = ?auto_1382591 ?auto_1382600 ) ) ( not ( = ?auto_1382591 ?auto_1382601 ) ) ( not ( = ?auto_1382591 ?auto_1382602 ) ) ( not ( = ?auto_1382591 ?auto_1382604 ) ) ( not ( = ?auto_1382592 ?auto_1382593 ) ) ( not ( = ?auto_1382592 ?auto_1382590 ) ) ( not ( = ?auto_1382592 ?auto_1382594 ) ) ( not ( = ?auto_1382592 ?auto_1382596 ) ) ( not ( = ?auto_1382592 ?auto_1382595 ) ) ( not ( = ?auto_1382592 ?auto_1382597 ) ) ( not ( = ?auto_1382592 ?auto_1382598 ) ) ( not ( = ?auto_1382592 ?auto_1382599 ) ) ( not ( = ?auto_1382592 ?auto_1382600 ) ) ( not ( = ?auto_1382592 ?auto_1382601 ) ) ( not ( = ?auto_1382592 ?auto_1382602 ) ) ( not ( = ?auto_1382592 ?auto_1382604 ) ) ( not ( = ?auto_1382593 ?auto_1382590 ) ) ( not ( = ?auto_1382593 ?auto_1382594 ) ) ( not ( = ?auto_1382593 ?auto_1382596 ) ) ( not ( = ?auto_1382593 ?auto_1382595 ) ) ( not ( = ?auto_1382593 ?auto_1382597 ) ) ( not ( = ?auto_1382593 ?auto_1382598 ) ) ( not ( = ?auto_1382593 ?auto_1382599 ) ) ( not ( = ?auto_1382593 ?auto_1382600 ) ) ( not ( = ?auto_1382593 ?auto_1382601 ) ) ( not ( = ?auto_1382593 ?auto_1382602 ) ) ( not ( = ?auto_1382593 ?auto_1382604 ) ) ( not ( = ?auto_1382590 ?auto_1382594 ) ) ( not ( = ?auto_1382590 ?auto_1382596 ) ) ( not ( = ?auto_1382590 ?auto_1382595 ) ) ( not ( = ?auto_1382590 ?auto_1382597 ) ) ( not ( = ?auto_1382590 ?auto_1382598 ) ) ( not ( = ?auto_1382590 ?auto_1382599 ) ) ( not ( = ?auto_1382590 ?auto_1382600 ) ) ( not ( = ?auto_1382590 ?auto_1382601 ) ) ( not ( = ?auto_1382590 ?auto_1382602 ) ) ( not ( = ?auto_1382590 ?auto_1382604 ) ) ( not ( = ?auto_1382594 ?auto_1382596 ) ) ( not ( = ?auto_1382594 ?auto_1382595 ) ) ( not ( = ?auto_1382594 ?auto_1382597 ) ) ( not ( = ?auto_1382594 ?auto_1382598 ) ) ( not ( = ?auto_1382594 ?auto_1382599 ) ) ( not ( = ?auto_1382594 ?auto_1382600 ) ) ( not ( = ?auto_1382594 ?auto_1382601 ) ) ( not ( = ?auto_1382594 ?auto_1382602 ) ) ( not ( = ?auto_1382594 ?auto_1382604 ) ) ( not ( = ?auto_1382596 ?auto_1382595 ) ) ( not ( = ?auto_1382596 ?auto_1382597 ) ) ( not ( = ?auto_1382596 ?auto_1382598 ) ) ( not ( = ?auto_1382596 ?auto_1382599 ) ) ( not ( = ?auto_1382596 ?auto_1382600 ) ) ( not ( = ?auto_1382596 ?auto_1382601 ) ) ( not ( = ?auto_1382596 ?auto_1382602 ) ) ( not ( = ?auto_1382596 ?auto_1382604 ) ) ( not ( = ?auto_1382595 ?auto_1382597 ) ) ( not ( = ?auto_1382595 ?auto_1382598 ) ) ( not ( = ?auto_1382595 ?auto_1382599 ) ) ( not ( = ?auto_1382595 ?auto_1382600 ) ) ( not ( = ?auto_1382595 ?auto_1382601 ) ) ( not ( = ?auto_1382595 ?auto_1382602 ) ) ( not ( = ?auto_1382595 ?auto_1382604 ) ) ( not ( = ?auto_1382597 ?auto_1382598 ) ) ( not ( = ?auto_1382597 ?auto_1382599 ) ) ( not ( = ?auto_1382597 ?auto_1382600 ) ) ( not ( = ?auto_1382597 ?auto_1382601 ) ) ( not ( = ?auto_1382597 ?auto_1382602 ) ) ( not ( = ?auto_1382597 ?auto_1382604 ) ) ( not ( = ?auto_1382598 ?auto_1382599 ) ) ( not ( = ?auto_1382598 ?auto_1382600 ) ) ( not ( = ?auto_1382598 ?auto_1382601 ) ) ( not ( = ?auto_1382598 ?auto_1382602 ) ) ( not ( = ?auto_1382598 ?auto_1382604 ) ) ( not ( = ?auto_1382599 ?auto_1382600 ) ) ( not ( = ?auto_1382599 ?auto_1382601 ) ) ( not ( = ?auto_1382599 ?auto_1382602 ) ) ( not ( = ?auto_1382599 ?auto_1382604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382600 ?auto_1382601 ?auto_1382602 )
      ( MAKE-12CRATE-VERIFY ?auto_1382591 ?auto_1382592 ?auto_1382593 ?auto_1382590 ?auto_1382594 ?auto_1382596 ?auto_1382595 ?auto_1382597 ?auto_1382598 ?auto_1382599 ?auto_1382600 ?auto_1382601 ?auto_1382602 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1382754 - SURFACE
      ?auto_1382755 - SURFACE
      ?auto_1382756 - SURFACE
      ?auto_1382753 - SURFACE
      ?auto_1382757 - SURFACE
      ?auto_1382759 - SURFACE
      ?auto_1382758 - SURFACE
      ?auto_1382760 - SURFACE
      ?auto_1382761 - SURFACE
      ?auto_1382762 - SURFACE
      ?auto_1382763 - SURFACE
      ?auto_1382764 - SURFACE
      ?auto_1382765 - SURFACE
    )
    :vars
    (
      ?auto_1382766 - HOIST
      ?auto_1382771 - PLACE
      ?auto_1382768 - PLACE
      ?auto_1382770 - HOIST
      ?auto_1382767 - SURFACE
      ?auto_1382769 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1382766 ?auto_1382771 ) ( IS-CRATE ?auto_1382765 ) ( not ( = ?auto_1382764 ?auto_1382765 ) ) ( not ( = ?auto_1382763 ?auto_1382764 ) ) ( not ( = ?auto_1382763 ?auto_1382765 ) ) ( not ( = ?auto_1382768 ?auto_1382771 ) ) ( HOIST-AT ?auto_1382770 ?auto_1382768 ) ( not ( = ?auto_1382766 ?auto_1382770 ) ) ( AVAILABLE ?auto_1382770 ) ( SURFACE-AT ?auto_1382765 ?auto_1382768 ) ( ON ?auto_1382765 ?auto_1382767 ) ( CLEAR ?auto_1382765 ) ( not ( = ?auto_1382764 ?auto_1382767 ) ) ( not ( = ?auto_1382765 ?auto_1382767 ) ) ( not ( = ?auto_1382763 ?auto_1382767 ) ) ( TRUCK-AT ?auto_1382769 ?auto_1382771 ) ( SURFACE-AT ?auto_1382763 ?auto_1382771 ) ( CLEAR ?auto_1382763 ) ( IS-CRATE ?auto_1382764 ) ( AVAILABLE ?auto_1382766 ) ( IN ?auto_1382764 ?auto_1382769 ) ( ON ?auto_1382755 ?auto_1382754 ) ( ON ?auto_1382756 ?auto_1382755 ) ( ON ?auto_1382753 ?auto_1382756 ) ( ON ?auto_1382757 ?auto_1382753 ) ( ON ?auto_1382759 ?auto_1382757 ) ( ON ?auto_1382758 ?auto_1382759 ) ( ON ?auto_1382760 ?auto_1382758 ) ( ON ?auto_1382761 ?auto_1382760 ) ( ON ?auto_1382762 ?auto_1382761 ) ( ON ?auto_1382763 ?auto_1382762 ) ( not ( = ?auto_1382754 ?auto_1382755 ) ) ( not ( = ?auto_1382754 ?auto_1382756 ) ) ( not ( = ?auto_1382754 ?auto_1382753 ) ) ( not ( = ?auto_1382754 ?auto_1382757 ) ) ( not ( = ?auto_1382754 ?auto_1382759 ) ) ( not ( = ?auto_1382754 ?auto_1382758 ) ) ( not ( = ?auto_1382754 ?auto_1382760 ) ) ( not ( = ?auto_1382754 ?auto_1382761 ) ) ( not ( = ?auto_1382754 ?auto_1382762 ) ) ( not ( = ?auto_1382754 ?auto_1382763 ) ) ( not ( = ?auto_1382754 ?auto_1382764 ) ) ( not ( = ?auto_1382754 ?auto_1382765 ) ) ( not ( = ?auto_1382754 ?auto_1382767 ) ) ( not ( = ?auto_1382755 ?auto_1382756 ) ) ( not ( = ?auto_1382755 ?auto_1382753 ) ) ( not ( = ?auto_1382755 ?auto_1382757 ) ) ( not ( = ?auto_1382755 ?auto_1382759 ) ) ( not ( = ?auto_1382755 ?auto_1382758 ) ) ( not ( = ?auto_1382755 ?auto_1382760 ) ) ( not ( = ?auto_1382755 ?auto_1382761 ) ) ( not ( = ?auto_1382755 ?auto_1382762 ) ) ( not ( = ?auto_1382755 ?auto_1382763 ) ) ( not ( = ?auto_1382755 ?auto_1382764 ) ) ( not ( = ?auto_1382755 ?auto_1382765 ) ) ( not ( = ?auto_1382755 ?auto_1382767 ) ) ( not ( = ?auto_1382756 ?auto_1382753 ) ) ( not ( = ?auto_1382756 ?auto_1382757 ) ) ( not ( = ?auto_1382756 ?auto_1382759 ) ) ( not ( = ?auto_1382756 ?auto_1382758 ) ) ( not ( = ?auto_1382756 ?auto_1382760 ) ) ( not ( = ?auto_1382756 ?auto_1382761 ) ) ( not ( = ?auto_1382756 ?auto_1382762 ) ) ( not ( = ?auto_1382756 ?auto_1382763 ) ) ( not ( = ?auto_1382756 ?auto_1382764 ) ) ( not ( = ?auto_1382756 ?auto_1382765 ) ) ( not ( = ?auto_1382756 ?auto_1382767 ) ) ( not ( = ?auto_1382753 ?auto_1382757 ) ) ( not ( = ?auto_1382753 ?auto_1382759 ) ) ( not ( = ?auto_1382753 ?auto_1382758 ) ) ( not ( = ?auto_1382753 ?auto_1382760 ) ) ( not ( = ?auto_1382753 ?auto_1382761 ) ) ( not ( = ?auto_1382753 ?auto_1382762 ) ) ( not ( = ?auto_1382753 ?auto_1382763 ) ) ( not ( = ?auto_1382753 ?auto_1382764 ) ) ( not ( = ?auto_1382753 ?auto_1382765 ) ) ( not ( = ?auto_1382753 ?auto_1382767 ) ) ( not ( = ?auto_1382757 ?auto_1382759 ) ) ( not ( = ?auto_1382757 ?auto_1382758 ) ) ( not ( = ?auto_1382757 ?auto_1382760 ) ) ( not ( = ?auto_1382757 ?auto_1382761 ) ) ( not ( = ?auto_1382757 ?auto_1382762 ) ) ( not ( = ?auto_1382757 ?auto_1382763 ) ) ( not ( = ?auto_1382757 ?auto_1382764 ) ) ( not ( = ?auto_1382757 ?auto_1382765 ) ) ( not ( = ?auto_1382757 ?auto_1382767 ) ) ( not ( = ?auto_1382759 ?auto_1382758 ) ) ( not ( = ?auto_1382759 ?auto_1382760 ) ) ( not ( = ?auto_1382759 ?auto_1382761 ) ) ( not ( = ?auto_1382759 ?auto_1382762 ) ) ( not ( = ?auto_1382759 ?auto_1382763 ) ) ( not ( = ?auto_1382759 ?auto_1382764 ) ) ( not ( = ?auto_1382759 ?auto_1382765 ) ) ( not ( = ?auto_1382759 ?auto_1382767 ) ) ( not ( = ?auto_1382758 ?auto_1382760 ) ) ( not ( = ?auto_1382758 ?auto_1382761 ) ) ( not ( = ?auto_1382758 ?auto_1382762 ) ) ( not ( = ?auto_1382758 ?auto_1382763 ) ) ( not ( = ?auto_1382758 ?auto_1382764 ) ) ( not ( = ?auto_1382758 ?auto_1382765 ) ) ( not ( = ?auto_1382758 ?auto_1382767 ) ) ( not ( = ?auto_1382760 ?auto_1382761 ) ) ( not ( = ?auto_1382760 ?auto_1382762 ) ) ( not ( = ?auto_1382760 ?auto_1382763 ) ) ( not ( = ?auto_1382760 ?auto_1382764 ) ) ( not ( = ?auto_1382760 ?auto_1382765 ) ) ( not ( = ?auto_1382760 ?auto_1382767 ) ) ( not ( = ?auto_1382761 ?auto_1382762 ) ) ( not ( = ?auto_1382761 ?auto_1382763 ) ) ( not ( = ?auto_1382761 ?auto_1382764 ) ) ( not ( = ?auto_1382761 ?auto_1382765 ) ) ( not ( = ?auto_1382761 ?auto_1382767 ) ) ( not ( = ?auto_1382762 ?auto_1382763 ) ) ( not ( = ?auto_1382762 ?auto_1382764 ) ) ( not ( = ?auto_1382762 ?auto_1382765 ) ) ( not ( = ?auto_1382762 ?auto_1382767 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1382763 ?auto_1382764 ?auto_1382765 )
      ( MAKE-12CRATE-VERIFY ?auto_1382754 ?auto_1382755 ?auto_1382756 ?auto_1382753 ?auto_1382757 ?auto_1382759 ?auto_1382758 ?auto_1382760 ?auto_1382761 ?auto_1382762 ?auto_1382763 ?auto_1382764 ?auto_1382765 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394335 - SURFACE
      ?auto_1394336 - SURFACE
      ?auto_1394337 - SURFACE
      ?auto_1394334 - SURFACE
      ?auto_1394338 - SURFACE
      ?auto_1394340 - SURFACE
      ?auto_1394339 - SURFACE
      ?auto_1394341 - SURFACE
      ?auto_1394342 - SURFACE
      ?auto_1394343 - SURFACE
      ?auto_1394344 - SURFACE
      ?auto_1394345 - SURFACE
      ?auto_1394346 - SURFACE
      ?auto_1394347 - SURFACE
    )
    :vars
    (
      ?auto_1394348 - HOIST
      ?auto_1394349 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394348 ?auto_1394349 ) ( SURFACE-AT ?auto_1394346 ?auto_1394349 ) ( CLEAR ?auto_1394346 ) ( LIFTING ?auto_1394348 ?auto_1394347 ) ( IS-CRATE ?auto_1394347 ) ( not ( = ?auto_1394346 ?auto_1394347 ) ) ( ON ?auto_1394336 ?auto_1394335 ) ( ON ?auto_1394337 ?auto_1394336 ) ( ON ?auto_1394334 ?auto_1394337 ) ( ON ?auto_1394338 ?auto_1394334 ) ( ON ?auto_1394340 ?auto_1394338 ) ( ON ?auto_1394339 ?auto_1394340 ) ( ON ?auto_1394341 ?auto_1394339 ) ( ON ?auto_1394342 ?auto_1394341 ) ( ON ?auto_1394343 ?auto_1394342 ) ( ON ?auto_1394344 ?auto_1394343 ) ( ON ?auto_1394345 ?auto_1394344 ) ( ON ?auto_1394346 ?auto_1394345 ) ( not ( = ?auto_1394335 ?auto_1394336 ) ) ( not ( = ?auto_1394335 ?auto_1394337 ) ) ( not ( = ?auto_1394335 ?auto_1394334 ) ) ( not ( = ?auto_1394335 ?auto_1394338 ) ) ( not ( = ?auto_1394335 ?auto_1394340 ) ) ( not ( = ?auto_1394335 ?auto_1394339 ) ) ( not ( = ?auto_1394335 ?auto_1394341 ) ) ( not ( = ?auto_1394335 ?auto_1394342 ) ) ( not ( = ?auto_1394335 ?auto_1394343 ) ) ( not ( = ?auto_1394335 ?auto_1394344 ) ) ( not ( = ?auto_1394335 ?auto_1394345 ) ) ( not ( = ?auto_1394335 ?auto_1394346 ) ) ( not ( = ?auto_1394335 ?auto_1394347 ) ) ( not ( = ?auto_1394336 ?auto_1394337 ) ) ( not ( = ?auto_1394336 ?auto_1394334 ) ) ( not ( = ?auto_1394336 ?auto_1394338 ) ) ( not ( = ?auto_1394336 ?auto_1394340 ) ) ( not ( = ?auto_1394336 ?auto_1394339 ) ) ( not ( = ?auto_1394336 ?auto_1394341 ) ) ( not ( = ?auto_1394336 ?auto_1394342 ) ) ( not ( = ?auto_1394336 ?auto_1394343 ) ) ( not ( = ?auto_1394336 ?auto_1394344 ) ) ( not ( = ?auto_1394336 ?auto_1394345 ) ) ( not ( = ?auto_1394336 ?auto_1394346 ) ) ( not ( = ?auto_1394336 ?auto_1394347 ) ) ( not ( = ?auto_1394337 ?auto_1394334 ) ) ( not ( = ?auto_1394337 ?auto_1394338 ) ) ( not ( = ?auto_1394337 ?auto_1394340 ) ) ( not ( = ?auto_1394337 ?auto_1394339 ) ) ( not ( = ?auto_1394337 ?auto_1394341 ) ) ( not ( = ?auto_1394337 ?auto_1394342 ) ) ( not ( = ?auto_1394337 ?auto_1394343 ) ) ( not ( = ?auto_1394337 ?auto_1394344 ) ) ( not ( = ?auto_1394337 ?auto_1394345 ) ) ( not ( = ?auto_1394337 ?auto_1394346 ) ) ( not ( = ?auto_1394337 ?auto_1394347 ) ) ( not ( = ?auto_1394334 ?auto_1394338 ) ) ( not ( = ?auto_1394334 ?auto_1394340 ) ) ( not ( = ?auto_1394334 ?auto_1394339 ) ) ( not ( = ?auto_1394334 ?auto_1394341 ) ) ( not ( = ?auto_1394334 ?auto_1394342 ) ) ( not ( = ?auto_1394334 ?auto_1394343 ) ) ( not ( = ?auto_1394334 ?auto_1394344 ) ) ( not ( = ?auto_1394334 ?auto_1394345 ) ) ( not ( = ?auto_1394334 ?auto_1394346 ) ) ( not ( = ?auto_1394334 ?auto_1394347 ) ) ( not ( = ?auto_1394338 ?auto_1394340 ) ) ( not ( = ?auto_1394338 ?auto_1394339 ) ) ( not ( = ?auto_1394338 ?auto_1394341 ) ) ( not ( = ?auto_1394338 ?auto_1394342 ) ) ( not ( = ?auto_1394338 ?auto_1394343 ) ) ( not ( = ?auto_1394338 ?auto_1394344 ) ) ( not ( = ?auto_1394338 ?auto_1394345 ) ) ( not ( = ?auto_1394338 ?auto_1394346 ) ) ( not ( = ?auto_1394338 ?auto_1394347 ) ) ( not ( = ?auto_1394340 ?auto_1394339 ) ) ( not ( = ?auto_1394340 ?auto_1394341 ) ) ( not ( = ?auto_1394340 ?auto_1394342 ) ) ( not ( = ?auto_1394340 ?auto_1394343 ) ) ( not ( = ?auto_1394340 ?auto_1394344 ) ) ( not ( = ?auto_1394340 ?auto_1394345 ) ) ( not ( = ?auto_1394340 ?auto_1394346 ) ) ( not ( = ?auto_1394340 ?auto_1394347 ) ) ( not ( = ?auto_1394339 ?auto_1394341 ) ) ( not ( = ?auto_1394339 ?auto_1394342 ) ) ( not ( = ?auto_1394339 ?auto_1394343 ) ) ( not ( = ?auto_1394339 ?auto_1394344 ) ) ( not ( = ?auto_1394339 ?auto_1394345 ) ) ( not ( = ?auto_1394339 ?auto_1394346 ) ) ( not ( = ?auto_1394339 ?auto_1394347 ) ) ( not ( = ?auto_1394341 ?auto_1394342 ) ) ( not ( = ?auto_1394341 ?auto_1394343 ) ) ( not ( = ?auto_1394341 ?auto_1394344 ) ) ( not ( = ?auto_1394341 ?auto_1394345 ) ) ( not ( = ?auto_1394341 ?auto_1394346 ) ) ( not ( = ?auto_1394341 ?auto_1394347 ) ) ( not ( = ?auto_1394342 ?auto_1394343 ) ) ( not ( = ?auto_1394342 ?auto_1394344 ) ) ( not ( = ?auto_1394342 ?auto_1394345 ) ) ( not ( = ?auto_1394342 ?auto_1394346 ) ) ( not ( = ?auto_1394342 ?auto_1394347 ) ) ( not ( = ?auto_1394343 ?auto_1394344 ) ) ( not ( = ?auto_1394343 ?auto_1394345 ) ) ( not ( = ?auto_1394343 ?auto_1394346 ) ) ( not ( = ?auto_1394343 ?auto_1394347 ) ) ( not ( = ?auto_1394344 ?auto_1394345 ) ) ( not ( = ?auto_1394344 ?auto_1394346 ) ) ( not ( = ?auto_1394344 ?auto_1394347 ) ) ( not ( = ?auto_1394345 ?auto_1394346 ) ) ( not ( = ?auto_1394345 ?auto_1394347 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1394346 ?auto_1394347 )
      ( MAKE-13CRATE-VERIFY ?auto_1394335 ?auto_1394336 ?auto_1394337 ?auto_1394334 ?auto_1394338 ?auto_1394340 ?auto_1394339 ?auto_1394341 ?auto_1394342 ?auto_1394343 ?auto_1394344 ?auto_1394345 ?auto_1394346 ?auto_1394347 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394477 - SURFACE
      ?auto_1394478 - SURFACE
      ?auto_1394479 - SURFACE
      ?auto_1394476 - SURFACE
      ?auto_1394480 - SURFACE
      ?auto_1394482 - SURFACE
      ?auto_1394481 - SURFACE
      ?auto_1394483 - SURFACE
      ?auto_1394484 - SURFACE
      ?auto_1394485 - SURFACE
      ?auto_1394486 - SURFACE
      ?auto_1394487 - SURFACE
      ?auto_1394488 - SURFACE
      ?auto_1394489 - SURFACE
    )
    :vars
    (
      ?auto_1394491 - HOIST
      ?auto_1394492 - PLACE
      ?auto_1394490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394491 ?auto_1394492 ) ( SURFACE-AT ?auto_1394488 ?auto_1394492 ) ( CLEAR ?auto_1394488 ) ( IS-CRATE ?auto_1394489 ) ( not ( = ?auto_1394488 ?auto_1394489 ) ) ( TRUCK-AT ?auto_1394490 ?auto_1394492 ) ( AVAILABLE ?auto_1394491 ) ( IN ?auto_1394489 ?auto_1394490 ) ( ON ?auto_1394488 ?auto_1394487 ) ( not ( = ?auto_1394487 ?auto_1394488 ) ) ( not ( = ?auto_1394487 ?auto_1394489 ) ) ( ON ?auto_1394478 ?auto_1394477 ) ( ON ?auto_1394479 ?auto_1394478 ) ( ON ?auto_1394476 ?auto_1394479 ) ( ON ?auto_1394480 ?auto_1394476 ) ( ON ?auto_1394482 ?auto_1394480 ) ( ON ?auto_1394481 ?auto_1394482 ) ( ON ?auto_1394483 ?auto_1394481 ) ( ON ?auto_1394484 ?auto_1394483 ) ( ON ?auto_1394485 ?auto_1394484 ) ( ON ?auto_1394486 ?auto_1394485 ) ( ON ?auto_1394487 ?auto_1394486 ) ( not ( = ?auto_1394477 ?auto_1394478 ) ) ( not ( = ?auto_1394477 ?auto_1394479 ) ) ( not ( = ?auto_1394477 ?auto_1394476 ) ) ( not ( = ?auto_1394477 ?auto_1394480 ) ) ( not ( = ?auto_1394477 ?auto_1394482 ) ) ( not ( = ?auto_1394477 ?auto_1394481 ) ) ( not ( = ?auto_1394477 ?auto_1394483 ) ) ( not ( = ?auto_1394477 ?auto_1394484 ) ) ( not ( = ?auto_1394477 ?auto_1394485 ) ) ( not ( = ?auto_1394477 ?auto_1394486 ) ) ( not ( = ?auto_1394477 ?auto_1394487 ) ) ( not ( = ?auto_1394477 ?auto_1394488 ) ) ( not ( = ?auto_1394477 ?auto_1394489 ) ) ( not ( = ?auto_1394478 ?auto_1394479 ) ) ( not ( = ?auto_1394478 ?auto_1394476 ) ) ( not ( = ?auto_1394478 ?auto_1394480 ) ) ( not ( = ?auto_1394478 ?auto_1394482 ) ) ( not ( = ?auto_1394478 ?auto_1394481 ) ) ( not ( = ?auto_1394478 ?auto_1394483 ) ) ( not ( = ?auto_1394478 ?auto_1394484 ) ) ( not ( = ?auto_1394478 ?auto_1394485 ) ) ( not ( = ?auto_1394478 ?auto_1394486 ) ) ( not ( = ?auto_1394478 ?auto_1394487 ) ) ( not ( = ?auto_1394478 ?auto_1394488 ) ) ( not ( = ?auto_1394478 ?auto_1394489 ) ) ( not ( = ?auto_1394479 ?auto_1394476 ) ) ( not ( = ?auto_1394479 ?auto_1394480 ) ) ( not ( = ?auto_1394479 ?auto_1394482 ) ) ( not ( = ?auto_1394479 ?auto_1394481 ) ) ( not ( = ?auto_1394479 ?auto_1394483 ) ) ( not ( = ?auto_1394479 ?auto_1394484 ) ) ( not ( = ?auto_1394479 ?auto_1394485 ) ) ( not ( = ?auto_1394479 ?auto_1394486 ) ) ( not ( = ?auto_1394479 ?auto_1394487 ) ) ( not ( = ?auto_1394479 ?auto_1394488 ) ) ( not ( = ?auto_1394479 ?auto_1394489 ) ) ( not ( = ?auto_1394476 ?auto_1394480 ) ) ( not ( = ?auto_1394476 ?auto_1394482 ) ) ( not ( = ?auto_1394476 ?auto_1394481 ) ) ( not ( = ?auto_1394476 ?auto_1394483 ) ) ( not ( = ?auto_1394476 ?auto_1394484 ) ) ( not ( = ?auto_1394476 ?auto_1394485 ) ) ( not ( = ?auto_1394476 ?auto_1394486 ) ) ( not ( = ?auto_1394476 ?auto_1394487 ) ) ( not ( = ?auto_1394476 ?auto_1394488 ) ) ( not ( = ?auto_1394476 ?auto_1394489 ) ) ( not ( = ?auto_1394480 ?auto_1394482 ) ) ( not ( = ?auto_1394480 ?auto_1394481 ) ) ( not ( = ?auto_1394480 ?auto_1394483 ) ) ( not ( = ?auto_1394480 ?auto_1394484 ) ) ( not ( = ?auto_1394480 ?auto_1394485 ) ) ( not ( = ?auto_1394480 ?auto_1394486 ) ) ( not ( = ?auto_1394480 ?auto_1394487 ) ) ( not ( = ?auto_1394480 ?auto_1394488 ) ) ( not ( = ?auto_1394480 ?auto_1394489 ) ) ( not ( = ?auto_1394482 ?auto_1394481 ) ) ( not ( = ?auto_1394482 ?auto_1394483 ) ) ( not ( = ?auto_1394482 ?auto_1394484 ) ) ( not ( = ?auto_1394482 ?auto_1394485 ) ) ( not ( = ?auto_1394482 ?auto_1394486 ) ) ( not ( = ?auto_1394482 ?auto_1394487 ) ) ( not ( = ?auto_1394482 ?auto_1394488 ) ) ( not ( = ?auto_1394482 ?auto_1394489 ) ) ( not ( = ?auto_1394481 ?auto_1394483 ) ) ( not ( = ?auto_1394481 ?auto_1394484 ) ) ( not ( = ?auto_1394481 ?auto_1394485 ) ) ( not ( = ?auto_1394481 ?auto_1394486 ) ) ( not ( = ?auto_1394481 ?auto_1394487 ) ) ( not ( = ?auto_1394481 ?auto_1394488 ) ) ( not ( = ?auto_1394481 ?auto_1394489 ) ) ( not ( = ?auto_1394483 ?auto_1394484 ) ) ( not ( = ?auto_1394483 ?auto_1394485 ) ) ( not ( = ?auto_1394483 ?auto_1394486 ) ) ( not ( = ?auto_1394483 ?auto_1394487 ) ) ( not ( = ?auto_1394483 ?auto_1394488 ) ) ( not ( = ?auto_1394483 ?auto_1394489 ) ) ( not ( = ?auto_1394484 ?auto_1394485 ) ) ( not ( = ?auto_1394484 ?auto_1394486 ) ) ( not ( = ?auto_1394484 ?auto_1394487 ) ) ( not ( = ?auto_1394484 ?auto_1394488 ) ) ( not ( = ?auto_1394484 ?auto_1394489 ) ) ( not ( = ?auto_1394485 ?auto_1394486 ) ) ( not ( = ?auto_1394485 ?auto_1394487 ) ) ( not ( = ?auto_1394485 ?auto_1394488 ) ) ( not ( = ?auto_1394485 ?auto_1394489 ) ) ( not ( = ?auto_1394486 ?auto_1394487 ) ) ( not ( = ?auto_1394486 ?auto_1394488 ) ) ( not ( = ?auto_1394486 ?auto_1394489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394487 ?auto_1394488 ?auto_1394489 )
      ( MAKE-13CRATE-VERIFY ?auto_1394477 ?auto_1394478 ?auto_1394479 ?auto_1394476 ?auto_1394480 ?auto_1394482 ?auto_1394481 ?auto_1394483 ?auto_1394484 ?auto_1394485 ?auto_1394486 ?auto_1394487 ?auto_1394488 ?auto_1394489 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394633 - SURFACE
      ?auto_1394634 - SURFACE
      ?auto_1394635 - SURFACE
      ?auto_1394632 - SURFACE
      ?auto_1394636 - SURFACE
      ?auto_1394638 - SURFACE
      ?auto_1394637 - SURFACE
      ?auto_1394639 - SURFACE
      ?auto_1394640 - SURFACE
      ?auto_1394641 - SURFACE
      ?auto_1394642 - SURFACE
      ?auto_1394643 - SURFACE
      ?auto_1394644 - SURFACE
      ?auto_1394645 - SURFACE
    )
    :vars
    (
      ?auto_1394649 - HOIST
      ?auto_1394647 - PLACE
      ?auto_1394646 - TRUCK
      ?auto_1394648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394649 ?auto_1394647 ) ( SURFACE-AT ?auto_1394644 ?auto_1394647 ) ( CLEAR ?auto_1394644 ) ( IS-CRATE ?auto_1394645 ) ( not ( = ?auto_1394644 ?auto_1394645 ) ) ( AVAILABLE ?auto_1394649 ) ( IN ?auto_1394645 ?auto_1394646 ) ( ON ?auto_1394644 ?auto_1394643 ) ( not ( = ?auto_1394643 ?auto_1394644 ) ) ( not ( = ?auto_1394643 ?auto_1394645 ) ) ( TRUCK-AT ?auto_1394646 ?auto_1394648 ) ( not ( = ?auto_1394648 ?auto_1394647 ) ) ( ON ?auto_1394634 ?auto_1394633 ) ( ON ?auto_1394635 ?auto_1394634 ) ( ON ?auto_1394632 ?auto_1394635 ) ( ON ?auto_1394636 ?auto_1394632 ) ( ON ?auto_1394638 ?auto_1394636 ) ( ON ?auto_1394637 ?auto_1394638 ) ( ON ?auto_1394639 ?auto_1394637 ) ( ON ?auto_1394640 ?auto_1394639 ) ( ON ?auto_1394641 ?auto_1394640 ) ( ON ?auto_1394642 ?auto_1394641 ) ( ON ?auto_1394643 ?auto_1394642 ) ( not ( = ?auto_1394633 ?auto_1394634 ) ) ( not ( = ?auto_1394633 ?auto_1394635 ) ) ( not ( = ?auto_1394633 ?auto_1394632 ) ) ( not ( = ?auto_1394633 ?auto_1394636 ) ) ( not ( = ?auto_1394633 ?auto_1394638 ) ) ( not ( = ?auto_1394633 ?auto_1394637 ) ) ( not ( = ?auto_1394633 ?auto_1394639 ) ) ( not ( = ?auto_1394633 ?auto_1394640 ) ) ( not ( = ?auto_1394633 ?auto_1394641 ) ) ( not ( = ?auto_1394633 ?auto_1394642 ) ) ( not ( = ?auto_1394633 ?auto_1394643 ) ) ( not ( = ?auto_1394633 ?auto_1394644 ) ) ( not ( = ?auto_1394633 ?auto_1394645 ) ) ( not ( = ?auto_1394634 ?auto_1394635 ) ) ( not ( = ?auto_1394634 ?auto_1394632 ) ) ( not ( = ?auto_1394634 ?auto_1394636 ) ) ( not ( = ?auto_1394634 ?auto_1394638 ) ) ( not ( = ?auto_1394634 ?auto_1394637 ) ) ( not ( = ?auto_1394634 ?auto_1394639 ) ) ( not ( = ?auto_1394634 ?auto_1394640 ) ) ( not ( = ?auto_1394634 ?auto_1394641 ) ) ( not ( = ?auto_1394634 ?auto_1394642 ) ) ( not ( = ?auto_1394634 ?auto_1394643 ) ) ( not ( = ?auto_1394634 ?auto_1394644 ) ) ( not ( = ?auto_1394634 ?auto_1394645 ) ) ( not ( = ?auto_1394635 ?auto_1394632 ) ) ( not ( = ?auto_1394635 ?auto_1394636 ) ) ( not ( = ?auto_1394635 ?auto_1394638 ) ) ( not ( = ?auto_1394635 ?auto_1394637 ) ) ( not ( = ?auto_1394635 ?auto_1394639 ) ) ( not ( = ?auto_1394635 ?auto_1394640 ) ) ( not ( = ?auto_1394635 ?auto_1394641 ) ) ( not ( = ?auto_1394635 ?auto_1394642 ) ) ( not ( = ?auto_1394635 ?auto_1394643 ) ) ( not ( = ?auto_1394635 ?auto_1394644 ) ) ( not ( = ?auto_1394635 ?auto_1394645 ) ) ( not ( = ?auto_1394632 ?auto_1394636 ) ) ( not ( = ?auto_1394632 ?auto_1394638 ) ) ( not ( = ?auto_1394632 ?auto_1394637 ) ) ( not ( = ?auto_1394632 ?auto_1394639 ) ) ( not ( = ?auto_1394632 ?auto_1394640 ) ) ( not ( = ?auto_1394632 ?auto_1394641 ) ) ( not ( = ?auto_1394632 ?auto_1394642 ) ) ( not ( = ?auto_1394632 ?auto_1394643 ) ) ( not ( = ?auto_1394632 ?auto_1394644 ) ) ( not ( = ?auto_1394632 ?auto_1394645 ) ) ( not ( = ?auto_1394636 ?auto_1394638 ) ) ( not ( = ?auto_1394636 ?auto_1394637 ) ) ( not ( = ?auto_1394636 ?auto_1394639 ) ) ( not ( = ?auto_1394636 ?auto_1394640 ) ) ( not ( = ?auto_1394636 ?auto_1394641 ) ) ( not ( = ?auto_1394636 ?auto_1394642 ) ) ( not ( = ?auto_1394636 ?auto_1394643 ) ) ( not ( = ?auto_1394636 ?auto_1394644 ) ) ( not ( = ?auto_1394636 ?auto_1394645 ) ) ( not ( = ?auto_1394638 ?auto_1394637 ) ) ( not ( = ?auto_1394638 ?auto_1394639 ) ) ( not ( = ?auto_1394638 ?auto_1394640 ) ) ( not ( = ?auto_1394638 ?auto_1394641 ) ) ( not ( = ?auto_1394638 ?auto_1394642 ) ) ( not ( = ?auto_1394638 ?auto_1394643 ) ) ( not ( = ?auto_1394638 ?auto_1394644 ) ) ( not ( = ?auto_1394638 ?auto_1394645 ) ) ( not ( = ?auto_1394637 ?auto_1394639 ) ) ( not ( = ?auto_1394637 ?auto_1394640 ) ) ( not ( = ?auto_1394637 ?auto_1394641 ) ) ( not ( = ?auto_1394637 ?auto_1394642 ) ) ( not ( = ?auto_1394637 ?auto_1394643 ) ) ( not ( = ?auto_1394637 ?auto_1394644 ) ) ( not ( = ?auto_1394637 ?auto_1394645 ) ) ( not ( = ?auto_1394639 ?auto_1394640 ) ) ( not ( = ?auto_1394639 ?auto_1394641 ) ) ( not ( = ?auto_1394639 ?auto_1394642 ) ) ( not ( = ?auto_1394639 ?auto_1394643 ) ) ( not ( = ?auto_1394639 ?auto_1394644 ) ) ( not ( = ?auto_1394639 ?auto_1394645 ) ) ( not ( = ?auto_1394640 ?auto_1394641 ) ) ( not ( = ?auto_1394640 ?auto_1394642 ) ) ( not ( = ?auto_1394640 ?auto_1394643 ) ) ( not ( = ?auto_1394640 ?auto_1394644 ) ) ( not ( = ?auto_1394640 ?auto_1394645 ) ) ( not ( = ?auto_1394641 ?auto_1394642 ) ) ( not ( = ?auto_1394641 ?auto_1394643 ) ) ( not ( = ?auto_1394641 ?auto_1394644 ) ) ( not ( = ?auto_1394641 ?auto_1394645 ) ) ( not ( = ?auto_1394642 ?auto_1394643 ) ) ( not ( = ?auto_1394642 ?auto_1394644 ) ) ( not ( = ?auto_1394642 ?auto_1394645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394643 ?auto_1394644 ?auto_1394645 )
      ( MAKE-13CRATE-VERIFY ?auto_1394633 ?auto_1394634 ?auto_1394635 ?auto_1394632 ?auto_1394636 ?auto_1394638 ?auto_1394637 ?auto_1394639 ?auto_1394640 ?auto_1394641 ?auto_1394642 ?auto_1394643 ?auto_1394644 ?auto_1394645 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394802 - SURFACE
      ?auto_1394803 - SURFACE
      ?auto_1394804 - SURFACE
      ?auto_1394801 - SURFACE
      ?auto_1394805 - SURFACE
      ?auto_1394807 - SURFACE
      ?auto_1394806 - SURFACE
      ?auto_1394808 - SURFACE
      ?auto_1394809 - SURFACE
      ?auto_1394810 - SURFACE
      ?auto_1394811 - SURFACE
      ?auto_1394812 - SURFACE
      ?auto_1394813 - SURFACE
      ?auto_1394814 - SURFACE
    )
    :vars
    (
      ?auto_1394819 - HOIST
      ?auto_1394816 - PLACE
      ?auto_1394817 - TRUCK
      ?auto_1394815 - PLACE
      ?auto_1394818 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1394819 ?auto_1394816 ) ( SURFACE-AT ?auto_1394813 ?auto_1394816 ) ( CLEAR ?auto_1394813 ) ( IS-CRATE ?auto_1394814 ) ( not ( = ?auto_1394813 ?auto_1394814 ) ) ( AVAILABLE ?auto_1394819 ) ( ON ?auto_1394813 ?auto_1394812 ) ( not ( = ?auto_1394812 ?auto_1394813 ) ) ( not ( = ?auto_1394812 ?auto_1394814 ) ) ( TRUCK-AT ?auto_1394817 ?auto_1394815 ) ( not ( = ?auto_1394815 ?auto_1394816 ) ) ( HOIST-AT ?auto_1394818 ?auto_1394815 ) ( LIFTING ?auto_1394818 ?auto_1394814 ) ( not ( = ?auto_1394819 ?auto_1394818 ) ) ( ON ?auto_1394803 ?auto_1394802 ) ( ON ?auto_1394804 ?auto_1394803 ) ( ON ?auto_1394801 ?auto_1394804 ) ( ON ?auto_1394805 ?auto_1394801 ) ( ON ?auto_1394807 ?auto_1394805 ) ( ON ?auto_1394806 ?auto_1394807 ) ( ON ?auto_1394808 ?auto_1394806 ) ( ON ?auto_1394809 ?auto_1394808 ) ( ON ?auto_1394810 ?auto_1394809 ) ( ON ?auto_1394811 ?auto_1394810 ) ( ON ?auto_1394812 ?auto_1394811 ) ( not ( = ?auto_1394802 ?auto_1394803 ) ) ( not ( = ?auto_1394802 ?auto_1394804 ) ) ( not ( = ?auto_1394802 ?auto_1394801 ) ) ( not ( = ?auto_1394802 ?auto_1394805 ) ) ( not ( = ?auto_1394802 ?auto_1394807 ) ) ( not ( = ?auto_1394802 ?auto_1394806 ) ) ( not ( = ?auto_1394802 ?auto_1394808 ) ) ( not ( = ?auto_1394802 ?auto_1394809 ) ) ( not ( = ?auto_1394802 ?auto_1394810 ) ) ( not ( = ?auto_1394802 ?auto_1394811 ) ) ( not ( = ?auto_1394802 ?auto_1394812 ) ) ( not ( = ?auto_1394802 ?auto_1394813 ) ) ( not ( = ?auto_1394802 ?auto_1394814 ) ) ( not ( = ?auto_1394803 ?auto_1394804 ) ) ( not ( = ?auto_1394803 ?auto_1394801 ) ) ( not ( = ?auto_1394803 ?auto_1394805 ) ) ( not ( = ?auto_1394803 ?auto_1394807 ) ) ( not ( = ?auto_1394803 ?auto_1394806 ) ) ( not ( = ?auto_1394803 ?auto_1394808 ) ) ( not ( = ?auto_1394803 ?auto_1394809 ) ) ( not ( = ?auto_1394803 ?auto_1394810 ) ) ( not ( = ?auto_1394803 ?auto_1394811 ) ) ( not ( = ?auto_1394803 ?auto_1394812 ) ) ( not ( = ?auto_1394803 ?auto_1394813 ) ) ( not ( = ?auto_1394803 ?auto_1394814 ) ) ( not ( = ?auto_1394804 ?auto_1394801 ) ) ( not ( = ?auto_1394804 ?auto_1394805 ) ) ( not ( = ?auto_1394804 ?auto_1394807 ) ) ( not ( = ?auto_1394804 ?auto_1394806 ) ) ( not ( = ?auto_1394804 ?auto_1394808 ) ) ( not ( = ?auto_1394804 ?auto_1394809 ) ) ( not ( = ?auto_1394804 ?auto_1394810 ) ) ( not ( = ?auto_1394804 ?auto_1394811 ) ) ( not ( = ?auto_1394804 ?auto_1394812 ) ) ( not ( = ?auto_1394804 ?auto_1394813 ) ) ( not ( = ?auto_1394804 ?auto_1394814 ) ) ( not ( = ?auto_1394801 ?auto_1394805 ) ) ( not ( = ?auto_1394801 ?auto_1394807 ) ) ( not ( = ?auto_1394801 ?auto_1394806 ) ) ( not ( = ?auto_1394801 ?auto_1394808 ) ) ( not ( = ?auto_1394801 ?auto_1394809 ) ) ( not ( = ?auto_1394801 ?auto_1394810 ) ) ( not ( = ?auto_1394801 ?auto_1394811 ) ) ( not ( = ?auto_1394801 ?auto_1394812 ) ) ( not ( = ?auto_1394801 ?auto_1394813 ) ) ( not ( = ?auto_1394801 ?auto_1394814 ) ) ( not ( = ?auto_1394805 ?auto_1394807 ) ) ( not ( = ?auto_1394805 ?auto_1394806 ) ) ( not ( = ?auto_1394805 ?auto_1394808 ) ) ( not ( = ?auto_1394805 ?auto_1394809 ) ) ( not ( = ?auto_1394805 ?auto_1394810 ) ) ( not ( = ?auto_1394805 ?auto_1394811 ) ) ( not ( = ?auto_1394805 ?auto_1394812 ) ) ( not ( = ?auto_1394805 ?auto_1394813 ) ) ( not ( = ?auto_1394805 ?auto_1394814 ) ) ( not ( = ?auto_1394807 ?auto_1394806 ) ) ( not ( = ?auto_1394807 ?auto_1394808 ) ) ( not ( = ?auto_1394807 ?auto_1394809 ) ) ( not ( = ?auto_1394807 ?auto_1394810 ) ) ( not ( = ?auto_1394807 ?auto_1394811 ) ) ( not ( = ?auto_1394807 ?auto_1394812 ) ) ( not ( = ?auto_1394807 ?auto_1394813 ) ) ( not ( = ?auto_1394807 ?auto_1394814 ) ) ( not ( = ?auto_1394806 ?auto_1394808 ) ) ( not ( = ?auto_1394806 ?auto_1394809 ) ) ( not ( = ?auto_1394806 ?auto_1394810 ) ) ( not ( = ?auto_1394806 ?auto_1394811 ) ) ( not ( = ?auto_1394806 ?auto_1394812 ) ) ( not ( = ?auto_1394806 ?auto_1394813 ) ) ( not ( = ?auto_1394806 ?auto_1394814 ) ) ( not ( = ?auto_1394808 ?auto_1394809 ) ) ( not ( = ?auto_1394808 ?auto_1394810 ) ) ( not ( = ?auto_1394808 ?auto_1394811 ) ) ( not ( = ?auto_1394808 ?auto_1394812 ) ) ( not ( = ?auto_1394808 ?auto_1394813 ) ) ( not ( = ?auto_1394808 ?auto_1394814 ) ) ( not ( = ?auto_1394809 ?auto_1394810 ) ) ( not ( = ?auto_1394809 ?auto_1394811 ) ) ( not ( = ?auto_1394809 ?auto_1394812 ) ) ( not ( = ?auto_1394809 ?auto_1394813 ) ) ( not ( = ?auto_1394809 ?auto_1394814 ) ) ( not ( = ?auto_1394810 ?auto_1394811 ) ) ( not ( = ?auto_1394810 ?auto_1394812 ) ) ( not ( = ?auto_1394810 ?auto_1394813 ) ) ( not ( = ?auto_1394810 ?auto_1394814 ) ) ( not ( = ?auto_1394811 ?auto_1394812 ) ) ( not ( = ?auto_1394811 ?auto_1394813 ) ) ( not ( = ?auto_1394811 ?auto_1394814 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394812 ?auto_1394813 ?auto_1394814 )
      ( MAKE-13CRATE-VERIFY ?auto_1394802 ?auto_1394803 ?auto_1394804 ?auto_1394801 ?auto_1394805 ?auto_1394807 ?auto_1394806 ?auto_1394808 ?auto_1394809 ?auto_1394810 ?auto_1394811 ?auto_1394812 ?auto_1394813 ?auto_1394814 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1394984 - SURFACE
      ?auto_1394985 - SURFACE
      ?auto_1394986 - SURFACE
      ?auto_1394983 - SURFACE
      ?auto_1394987 - SURFACE
      ?auto_1394989 - SURFACE
      ?auto_1394988 - SURFACE
      ?auto_1394990 - SURFACE
      ?auto_1394991 - SURFACE
      ?auto_1394992 - SURFACE
      ?auto_1394993 - SURFACE
      ?auto_1394994 - SURFACE
      ?auto_1394995 - SURFACE
      ?auto_1394996 - SURFACE
    )
    :vars
    (
      ?auto_1395002 - HOIST
      ?auto_1395000 - PLACE
      ?auto_1394998 - TRUCK
      ?auto_1395001 - PLACE
      ?auto_1394997 - HOIST
      ?auto_1394999 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395002 ?auto_1395000 ) ( SURFACE-AT ?auto_1394995 ?auto_1395000 ) ( CLEAR ?auto_1394995 ) ( IS-CRATE ?auto_1394996 ) ( not ( = ?auto_1394995 ?auto_1394996 ) ) ( AVAILABLE ?auto_1395002 ) ( ON ?auto_1394995 ?auto_1394994 ) ( not ( = ?auto_1394994 ?auto_1394995 ) ) ( not ( = ?auto_1394994 ?auto_1394996 ) ) ( TRUCK-AT ?auto_1394998 ?auto_1395001 ) ( not ( = ?auto_1395001 ?auto_1395000 ) ) ( HOIST-AT ?auto_1394997 ?auto_1395001 ) ( not ( = ?auto_1395002 ?auto_1394997 ) ) ( AVAILABLE ?auto_1394997 ) ( SURFACE-AT ?auto_1394996 ?auto_1395001 ) ( ON ?auto_1394996 ?auto_1394999 ) ( CLEAR ?auto_1394996 ) ( not ( = ?auto_1394995 ?auto_1394999 ) ) ( not ( = ?auto_1394996 ?auto_1394999 ) ) ( not ( = ?auto_1394994 ?auto_1394999 ) ) ( ON ?auto_1394985 ?auto_1394984 ) ( ON ?auto_1394986 ?auto_1394985 ) ( ON ?auto_1394983 ?auto_1394986 ) ( ON ?auto_1394987 ?auto_1394983 ) ( ON ?auto_1394989 ?auto_1394987 ) ( ON ?auto_1394988 ?auto_1394989 ) ( ON ?auto_1394990 ?auto_1394988 ) ( ON ?auto_1394991 ?auto_1394990 ) ( ON ?auto_1394992 ?auto_1394991 ) ( ON ?auto_1394993 ?auto_1394992 ) ( ON ?auto_1394994 ?auto_1394993 ) ( not ( = ?auto_1394984 ?auto_1394985 ) ) ( not ( = ?auto_1394984 ?auto_1394986 ) ) ( not ( = ?auto_1394984 ?auto_1394983 ) ) ( not ( = ?auto_1394984 ?auto_1394987 ) ) ( not ( = ?auto_1394984 ?auto_1394989 ) ) ( not ( = ?auto_1394984 ?auto_1394988 ) ) ( not ( = ?auto_1394984 ?auto_1394990 ) ) ( not ( = ?auto_1394984 ?auto_1394991 ) ) ( not ( = ?auto_1394984 ?auto_1394992 ) ) ( not ( = ?auto_1394984 ?auto_1394993 ) ) ( not ( = ?auto_1394984 ?auto_1394994 ) ) ( not ( = ?auto_1394984 ?auto_1394995 ) ) ( not ( = ?auto_1394984 ?auto_1394996 ) ) ( not ( = ?auto_1394984 ?auto_1394999 ) ) ( not ( = ?auto_1394985 ?auto_1394986 ) ) ( not ( = ?auto_1394985 ?auto_1394983 ) ) ( not ( = ?auto_1394985 ?auto_1394987 ) ) ( not ( = ?auto_1394985 ?auto_1394989 ) ) ( not ( = ?auto_1394985 ?auto_1394988 ) ) ( not ( = ?auto_1394985 ?auto_1394990 ) ) ( not ( = ?auto_1394985 ?auto_1394991 ) ) ( not ( = ?auto_1394985 ?auto_1394992 ) ) ( not ( = ?auto_1394985 ?auto_1394993 ) ) ( not ( = ?auto_1394985 ?auto_1394994 ) ) ( not ( = ?auto_1394985 ?auto_1394995 ) ) ( not ( = ?auto_1394985 ?auto_1394996 ) ) ( not ( = ?auto_1394985 ?auto_1394999 ) ) ( not ( = ?auto_1394986 ?auto_1394983 ) ) ( not ( = ?auto_1394986 ?auto_1394987 ) ) ( not ( = ?auto_1394986 ?auto_1394989 ) ) ( not ( = ?auto_1394986 ?auto_1394988 ) ) ( not ( = ?auto_1394986 ?auto_1394990 ) ) ( not ( = ?auto_1394986 ?auto_1394991 ) ) ( not ( = ?auto_1394986 ?auto_1394992 ) ) ( not ( = ?auto_1394986 ?auto_1394993 ) ) ( not ( = ?auto_1394986 ?auto_1394994 ) ) ( not ( = ?auto_1394986 ?auto_1394995 ) ) ( not ( = ?auto_1394986 ?auto_1394996 ) ) ( not ( = ?auto_1394986 ?auto_1394999 ) ) ( not ( = ?auto_1394983 ?auto_1394987 ) ) ( not ( = ?auto_1394983 ?auto_1394989 ) ) ( not ( = ?auto_1394983 ?auto_1394988 ) ) ( not ( = ?auto_1394983 ?auto_1394990 ) ) ( not ( = ?auto_1394983 ?auto_1394991 ) ) ( not ( = ?auto_1394983 ?auto_1394992 ) ) ( not ( = ?auto_1394983 ?auto_1394993 ) ) ( not ( = ?auto_1394983 ?auto_1394994 ) ) ( not ( = ?auto_1394983 ?auto_1394995 ) ) ( not ( = ?auto_1394983 ?auto_1394996 ) ) ( not ( = ?auto_1394983 ?auto_1394999 ) ) ( not ( = ?auto_1394987 ?auto_1394989 ) ) ( not ( = ?auto_1394987 ?auto_1394988 ) ) ( not ( = ?auto_1394987 ?auto_1394990 ) ) ( not ( = ?auto_1394987 ?auto_1394991 ) ) ( not ( = ?auto_1394987 ?auto_1394992 ) ) ( not ( = ?auto_1394987 ?auto_1394993 ) ) ( not ( = ?auto_1394987 ?auto_1394994 ) ) ( not ( = ?auto_1394987 ?auto_1394995 ) ) ( not ( = ?auto_1394987 ?auto_1394996 ) ) ( not ( = ?auto_1394987 ?auto_1394999 ) ) ( not ( = ?auto_1394989 ?auto_1394988 ) ) ( not ( = ?auto_1394989 ?auto_1394990 ) ) ( not ( = ?auto_1394989 ?auto_1394991 ) ) ( not ( = ?auto_1394989 ?auto_1394992 ) ) ( not ( = ?auto_1394989 ?auto_1394993 ) ) ( not ( = ?auto_1394989 ?auto_1394994 ) ) ( not ( = ?auto_1394989 ?auto_1394995 ) ) ( not ( = ?auto_1394989 ?auto_1394996 ) ) ( not ( = ?auto_1394989 ?auto_1394999 ) ) ( not ( = ?auto_1394988 ?auto_1394990 ) ) ( not ( = ?auto_1394988 ?auto_1394991 ) ) ( not ( = ?auto_1394988 ?auto_1394992 ) ) ( not ( = ?auto_1394988 ?auto_1394993 ) ) ( not ( = ?auto_1394988 ?auto_1394994 ) ) ( not ( = ?auto_1394988 ?auto_1394995 ) ) ( not ( = ?auto_1394988 ?auto_1394996 ) ) ( not ( = ?auto_1394988 ?auto_1394999 ) ) ( not ( = ?auto_1394990 ?auto_1394991 ) ) ( not ( = ?auto_1394990 ?auto_1394992 ) ) ( not ( = ?auto_1394990 ?auto_1394993 ) ) ( not ( = ?auto_1394990 ?auto_1394994 ) ) ( not ( = ?auto_1394990 ?auto_1394995 ) ) ( not ( = ?auto_1394990 ?auto_1394996 ) ) ( not ( = ?auto_1394990 ?auto_1394999 ) ) ( not ( = ?auto_1394991 ?auto_1394992 ) ) ( not ( = ?auto_1394991 ?auto_1394993 ) ) ( not ( = ?auto_1394991 ?auto_1394994 ) ) ( not ( = ?auto_1394991 ?auto_1394995 ) ) ( not ( = ?auto_1394991 ?auto_1394996 ) ) ( not ( = ?auto_1394991 ?auto_1394999 ) ) ( not ( = ?auto_1394992 ?auto_1394993 ) ) ( not ( = ?auto_1394992 ?auto_1394994 ) ) ( not ( = ?auto_1394992 ?auto_1394995 ) ) ( not ( = ?auto_1394992 ?auto_1394996 ) ) ( not ( = ?auto_1394992 ?auto_1394999 ) ) ( not ( = ?auto_1394993 ?auto_1394994 ) ) ( not ( = ?auto_1394993 ?auto_1394995 ) ) ( not ( = ?auto_1394993 ?auto_1394996 ) ) ( not ( = ?auto_1394993 ?auto_1394999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1394994 ?auto_1394995 ?auto_1394996 )
      ( MAKE-13CRATE-VERIFY ?auto_1394984 ?auto_1394985 ?auto_1394986 ?auto_1394983 ?auto_1394987 ?auto_1394989 ?auto_1394988 ?auto_1394990 ?auto_1394991 ?auto_1394992 ?auto_1394993 ?auto_1394994 ?auto_1394995 ?auto_1394996 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395167 - SURFACE
      ?auto_1395168 - SURFACE
      ?auto_1395169 - SURFACE
      ?auto_1395166 - SURFACE
      ?auto_1395170 - SURFACE
      ?auto_1395172 - SURFACE
      ?auto_1395171 - SURFACE
      ?auto_1395173 - SURFACE
      ?auto_1395174 - SURFACE
      ?auto_1395175 - SURFACE
      ?auto_1395176 - SURFACE
      ?auto_1395177 - SURFACE
      ?auto_1395178 - SURFACE
      ?auto_1395179 - SURFACE
    )
    :vars
    (
      ?auto_1395185 - HOIST
      ?auto_1395182 - PLACE
      ?auto_1395181 - PLACE
      ?auto_1395180 - HOIST
      ?auto_1395183 - SURFACE
      ?auto_1395184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395185 ?auto_1395182 ) ( SURFACE-AT ?auto_1395178 ?auto_1395182 ) ( CLEAR ?auto_1395178 ) ( IS-CRATE ?auto_1395179 ) ( not ( = ?auto_1395178 ?auto_1395179 ) ) ( AVAILABLE ?auto_1395185 ) ( ON ?auto_1395178 ?auto_1395177 ) ( not ( = ?auto_1395177 ?auto_1395178 ) ) ( not ( = ?auto_1395177 ?auto_1395179 ) ) ( not ( = ?auto_1395181 ?auto_1395182 ) ) ( HOIST-AT ?auto_1395180 ?auto_1395181 ) ( not ( = ?auto_1395185 ?auto_1395180 ) ) ( AVAILABLE ?auto_1395180 ) ( SURFACE-AT ?auto_1395179 ?auto_1395181 ) ( ON ?auto_1395179 ?auto_1395183 ) ( CLEAR ?auto_1395179 ) ( not ( = ?auto_1395178 ?auto_1395183 ) ) ( not ( = ?auto_1395179 ?auto_1395183 ) ) ( not ( = ?auto_1395177 ?auto_1395183 ) ) ( TRUCK-AT ?auto_1395184 ?auto_1395182 ) ( ON ?auto_1395168 ?auto_1395167 ) ( ON ?auto_1395169 ?auto_1395168 ) ( ON ?auto_1395166 ?auto_1395169 ) ( ON ?auto_1395170 ?auto_1395166 ) ( ON ?auto_1395172 ?auto_1395170 ) ( ON ?auto_1395171 ?auto_1395172 ) ( ON ?auto_1395173 ?auto_1395171 ) ( ON ?auto_1395174 ?auto_1395173 ) ( ON ?auto_1395175 ?auto_1395174 ) ( ON ?auto_1395176 ?auto_1395175 ) ( ON ?auto_1395177 ?auto_1395176 ) ( not ( = ?auto_1395167 ?auto_1395168 ) ) ( not ( = ?auto_1395167 ?auto_1395169 ) ) ( not ( = ?auto_1395167 ?auto_1395166 ) ) ( not ( = ?auto_1395167 ?auto_1395170 ) ) ( not ( = ?auto_1395167 ?auto_1395172 ) ) ( not ( = ?auto_1395167 ?auto_1395171 ) ) ( not ( = ?auto_1395167 ?auto_1395173 ) ) ( not ( = ?auto_1395167 ?auto_1395174 ) ) ( not ( = ?auto_1395167 ?auto_1395175 ) ) ( not ( = ?auto_1395167 ?auto_1395176 ) ) ( not ( = ?auto_1395167 ?auto_1395177 ) ) ( not ( = ?auto_1395167 ?auto_1395178 ) ) ( not ( = ?auto_1395167 ?auto_1395179 ) ) ( not ( = ?auto_1395167 ?auto_1395183 ) ) ( not ( = ?auto_1395168 ?auto_1395169 ) ) ( not ( = ?auto_1395168 ?auto_1395166 ) ) ( not ( = ?auto_1395168 ?auto_1395170 ) ) ( not ( = ?auto_1395168 ?auto_1395172 ) ) ( not ( = ?auto_1395168 ?auto_1395171 ) ) ( not ( = ?auto_1395168 ?auto_1395173 ) ) ( not ( = ?auto_1395168 ?auto_1395174 ) ) ( not ( = ?auto_1395168 ?auto_1395175 ) ) ( not ( = ?auto_1395168 ?auto_1395176 ) ) ( not ( = ?auto_1395168 ?auto_1395177 ) ) ( not ( = ?auto_1395168 ?auto_1395178 ) ) ( not ( = ?auto_1395168 ?auto_1395179 ) ) ( not ( = ?auto_1395168 ?auto_1395183 ) ) ( not ( = ?auto_1395169 ?auto_1395166 ) ) ( not ( = ?auto_1395169 ?auto_1395170 ) ) ( not ( = ?auto_1395169 ?auto_1395172 ) ) ( not ( = ?auto_1395169 ?auto_1395171 ) ) ( not ( = ?auto_1395169 ?auto_1395173 ) ) ( not ( = ?auto_1395169 ?auto_1395174 ) ) ( not ( = ?auto_1395169 ?auto_1395175 ) ) ( not ( = ?auto_1395169 ?auto_1395176 ) ) ( not ( = ?auto_1395169 ?auto_1395177 ) ) ( not ( = ?auto_1395169 ?auto_1395178 ) ) ( not ( = ?auto_1395169 ?auto_1395179 ) ) ( not ( = ?auto_1395169 ?auto_1395183 ) ) ( not ( = ?auto_1395166 ?auto_1395170 ) ) ( not ( = ?auto_1395166 ?auto_1395172 ) ) ( not ( = ?auto_1395166 ?auto_1395171 ) ) ( not ( = ?auto_1395166 ?auto_1395173 ) ) ( not ( = ?auto_1395166 ?auto_1395174 ) ) ( not ( = ?auto_1395166 ?auto_1395175 ) ) ( not ( = ?auto_1395166 ?auto_1395176 ) ) ( not ( = ?auto_1395166 ?auto_1395177 ) ) ( not ( = ?auto_1395166 ?auto_1395178 ) ) ( not ( = ?auto_1395166 ?auto_1395179 ) ) ( not ( = ?auto_1395166 ?auto_1395183 ) ) ( not ( = ?auto_1395170 ?auto_1395172 ) ) ( not ( = ?auto_1395170 ?auto_1395171 ) ) ( not ( = ?auto_1395170 ?auto_1395173 ) ) ( not ( = ?auto_1395170 ?auto_1395174 ) ) ( not ( = ?auto_1395170 ?auto_1395175 ) ) ( not ( = ?auto_1395170 ?auto_1395176 ) ) ( not ( = ?auto_1395170 ?auto_1395177 ) ) ( not ( = ?auto_1395170 ?auto_1395178 ) ) ( not ( = ?auto_1395170 ?auto_1395179 ) ) ( not ( = ?auto_1395170 ?auto_1395183 ) ) ( not ( = ?auto_1395172 ?auto_1395171 ) ) ( not ( = ?auto_1395172 ?auto_1395173 ) ) ( not ( = ?auto_1395172 ?auto_1395174 ) ) ( not ( = ?auto_1395172 ?auto_1395175 ) ) ( not ( = ?auto_1395172 ?auto_1395176 ) ) ( not ( = ?auto_1395172 ?auto_1395177 ) ) ( not ( = ?auto_1395172 ?auto_1395178 ) ) ( not ( = ?auto_1395172 ?auto_1395179 ) ) ( not ( = ?auto_1395172 ?auto_1395183 ) ) ( not ( = ?auto_1395171 ?auto_1395173 ) ) ( not ( = ?auto_1395171 ?auto_1395174 ) ) ( not ( = ?auto_1395171 ?auto_1395175 ) ) ( not ( = ?auto_1395171 ?auto_1395176 ) ) ( not ( = ?auto_1395171 ?auto_1395177 ) ) ( not ( = ?auto_1395171 ?auto_1395178 ) ) ( not ( = ?auto_1395171 ?auto_1395179 ) ) ( not ( = ?auto_1395171 ?auto_1395183 ) ) ( not ( = ?auto_1395173 ?auto_1395174 ) ) ( not ( = ?auto_1395173 ?auto_1395175 ) ) ( not ( = ?auto_1395173 ?auto_1395176 ) ) ( not ( = ?auto_1395173 ?auto_1395177 ) ) ( not ( = ?auto_1395173 ?auto_1395178 ) ) ( not ( = ?auto_1395173 ?auto_1395179 ) ) ( not ( = ?auto_1395173 ?auto_1395183 ) ) ( not ( = ?auto_1395174 ?auto_1395175 ) ) ( not ( = ?auto_1395174 ?auto_1395176 ) ) ( not ( = ?auto_1395174 ?auto_1395177 ) ) ( not ( = ?auto_1395174 ?auto_1395178 ) ) ( not ( = ?auto_1395174 ?auto_1395179 ) ) ( not ( = ?auto_1395174 ?auto_1395183 ) ) ( not ( = ?auto_1395175 ?auto_1395176 ) ) ( not ( = ?auto_1395175 ?auto_1395177 ) ) ( not ( = ?auto_1395175 ?auto_1395178 ) ) ( not ( = ?auto_1395175 ?auto_1395179 ) ) ( not ( = ?auto_1395175 ?auto_1395183 ) ) ( not ( = ?auto_1395176 ?auto_1395177 ) ) ( not ( = ?auto_1395176 ?auto_1395178 ) ) ( not ( = ?auto_1395176 ?auto_1395179 ) ) ( not ( = ?auto_1395176 ?auto_1395183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395177 ?auto_1395178 ?auto_1395179 )
      ( MAKE-13CRATE-VERIFY ?auto_1395167 ?auto_1395168 ?auto_1395169 ?auto_1395166 ?auto_1395170 ?auto_1395172 ?auto_1395171 ?auto_1395173 ?auto_1395174 ?auto_1395175 ?auto_1395176 ?auto_1395177 ?auto_1395178 ?auto_1395179 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395350 - SURFACE
      ?auto_1395351 - SURFACE
      ?auto_1395352 - SURFACE
      ?auto_1395349 - SURFACE
      ?auto_1395353 - SURFACE
      ?auto_1395355 - SURFACE
      ?auto_1395354 - SURFACE
      ?auto_1395356 - SURFACE
      ?auto_1395357 - SURFACE
      ?auto_1395358 - SURFACE
      ?auto_1395359 - SURFACE
      ?auto_1395360 - SURFACE
      ?auto_1395361 - SURFACE
      ?auto_1395362 - SURFACE
    )
    :vars
    (
      ?auto_1395368 - HOIST
      ?auto_1395363 - PLACE
      ?auto_1395364 - PLACE
      ?auto_1395366 - HOIST
      ?auto_1395365 - SURFACE
      ?auto_1395367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395368 ?auto_1395363 ) ( IS-CRATE ?auto_1395362 ) ( not ( = ?auto_1395361 ?auto_1395362 ) ) ( not ( = ?auto_1395360 ?auto_1395361 ) ) ( not ( = ?auto_1395360 ?auto_1395362 ) ) ( not ( = ?auto_1395364 ?auto_1395363 ) ) ( HOIST-AT ?auto_1395366 ?auto_1395364 ) ( not ( = ?auto_1395368 ?auto_1395366 ) ) ( AVAILABLE ?auto_1395366 ) ( SURFACE-AT ?auto_1395362 ?auto_1395364 ) ( ON ?auto_1395362 ?auto_1395365 ) ( CLEAR ?auto_1395362 ) ( not ( = ?auto_1395361 ?auto_1395365 ) ) ( not ( = ?auto_1395362 ?auto_1395365 ) ) ( not ( = ?auto_1395360 ?auto_1395365 ) ) ( TRUCK-AT ?auto_1395367 ?auto_1395363 ) ( SURFACE-AT ?auto_1395360 ?auto_1395363 ) ( CLEAR ?auto_1395360 ) ( LIFTING ?auto_1395368 ?auto_1395361 ) ( IS-CRATE ?auto_1395361 ) ( ON ?auto_1395351 ?auto_1395350 ) ( ON ?auto_1395352 ?auto_1395351 ) ( ON ?auto_1395349 ?auto_1395352 ) ( ON ?auto_1395353 ?auto_1395349 ) ( ON ?auto_1395355 ?auto_1395353 ) ( ON ?auto_1395354 ?auto_1395355 ) ( ON ?auto_1395356 ?auto_1395354 ) ( ON ?auto_1395357 ?auto_1395356 ) ( ON ?auto_1395358 ?auto_1395357 ) ( ON ?auto_1395359 ?auto_1395358 ) ( ON ?auto_1395360 ?auto_1395359 ) ( not ( = ?auto_1395350 ?auto_1395351 ) ) ( not ( = ?auto_1395350 ?auto_1395352 ) ) ( not ( = ?auto_1395350 ?auto_1395349 ) ) ( not ( = ?auto_1395350 ?auto_1395353 ) ) ( not ( = ?auto_1395350 ?auto_1395355 ) ) ( not ( = ?auto_1395350 ?auto_1395354 ) ) ( not ( = ?auto_1395350 ?auto_1395356 ) ) ( not ( = ?auto_1395350 ?auto_1395357 ) ) ( not ( = ?auto_1395350 ?auto_1395358 ) ) ( not ( = ?auto_1395350 ?auto_1395359 ) ) ( not ( = ?auto_1395350 ?auto_1395360 ) ) ( not ( = ?auto_1395350 ?auto_1395361 ) ) ( not ( = ?auto_1395350 ?auto_1395362 ) ) ( not ( = ?auto_1395350 ?auto_1395365 ) ) ( not ( = ?auto_1395351 ?auto_1395352 ) ) ( not ( = ?auto_1395351 ?auto_1395349 ) ) ( not ( = ?auto_1395351 ?auto_1395353 ) ) ( not ( = ?auto_1395351 ?auto_1395355 ) ) ( not ( = ?auto_1395351 ?auto_1395354 ) ) ( not ( = ?auto_1395351 ?auto_1395356 ) ) ( not ( = ?auto_1395351 ?auto_1395357 ) ) ( not ( = ?auto_1395351 ?auto_1395358 ) ) ( not ( = ?auto_1395351 ?auto_1395359 ) ) ( not ( = ?auto_1395351 ?auto_1395360 ) ) ( not ( = ?auto_1395351 ?auto_1395361 ) ) ( not ( = ?auto_1395351 ?auto_1395362 ) ) ( not ( = ?auto_1395351 ?auto_1395365 ) ) ( not ( = ?auto_1395352 ?auto_1395349 ) ) ( not ( = ?auto_1395352 ?auto_1395353 ) ) ( not ( = ?auto_1395352 ?auto_1395355 ) ) ( not ( = ?auto_1395352 ?auto_1395354 ) ) ( not ( = ?auto_1395352 ?auto_1395356 ) ) ( not ( = ?auto_1395352 ?auto_1395357 ) ) ( not ( = ?auto_1395352 ?auto_1395358 ) ) ( not ( = ?auto_1395352 ?auto_1395359 ) ) ( not ( = ?auto_1395352 ?auto_1395360 ) ) ( not ( = ?auto_1395352 ?auto_1395361 ) ) ( not ( = ?auto_1395352 ?auto_1395362 ) ) ( not ( = ?auto_1395352 ?auto_1395365 ) ) ( not ( = ?auto_1395349 ?auto_1395353 ) ) ( not ( = ?auto_1395349 ?auto_1395355 ) ) ( not ( = ?auto_1395349 ?auto_1395354 ) ) ( not ( = ?auto_1395349 ?auto_1395356 ) ) ( not ( = ?auto_1395349 ?auto_1395357 ) ) ( not ( = ?auto_1395349 ?auto_1395358 ) ) ( not ( = ?auto_1395349 ?auto_1395359 ) ) ( not ( = ?auto_1395349 ?auto_1395360 ) ) ( not ( = ?auto_1395349 ?auto_1395361 ) ) ( not ( = ?auto_1395349 ?auto_1395362 ) ) ( not ( = ?auto_1395349 ?auto_1395365 ) ) ( not ( = ?auto_1395353 ?auto_1395355 ) ) ( not ( = ?auto_1395353 ?auto_1395354 ) ) ( not ( = ?auto_1395353 ?auto_1395356 ) ) ( not ( = ?auto_1395353 ?auto_1395357 ) ) ( not ( = ?auto_1395353 ?auto_1395358 ) ) ( not ( = ?auto_1395353 ?auto_1395359 ) ) ( not ( = ?auto_1395353 ?auto_1395360 ) ) ( not ( = ?auto_1395353 ?auto_1395361 ) ) ( not ( = ?auto_1395353 ?auto_1395362 ) ) ( not ( = ?auto_1395353 ?auto_1395365 ) ) ( not ( = ?auto_1395355 ?auto_1395354 ) ) ( not ( = ?auto_1395355 ?auto_1395356 ) ) ( not ( = ?auto_1395355 ?auto_1395357 ) ) ( not ( = ?auto_1395355 ?auto_1395358 ) ) ( not ( = ?auto_1395355 ?auto_1395359 ) ) ( not ( = ?auto_1395355 ?auto_1395360 ) ) ( not ( = ?auto_1395355 ?auto_1395361 ) ) ( not ( = ?auto_1395355 ?auto_1395362 ) ) ( not ( = ?auto_1395355 ?auto_1395365 ) ) ( not ( = ?auto_1395354 ?auto_1395356 ) ) ( not ( = ?auto_1395354 ?auto_1395357 ) ) ( not ( = ?auto_1395354 ?auto_1395358 ) ) ( not ( = ?auto_1395354 ?auto_1395359 ) ) ( not ( = ?auto_1395354 ?auto_1395360 ) ) ( not ( = ?auto_1395354 ?auto_1395361 ) ) ( not ( = ?auto_1395354 ?auto_1395362 ) ) ( not ( = ?auto_1395354 ?auto_1395365 ) ) ( not ( = ?auto_1395356 ?auto_1395357 ) ) ( not ( = ?auto_1395356 ?auto_1395358 ) ) ( not ( = ?auto_1395356 ?auto_1395359 ) ) ( not ( = ?auto_1395356 ?auto_1395360 ) ) ( not ( = ?auto_1395356 ?auto_1395361 ) ) ( not ( = ?auto_1395356 ?auto_1395362 ) ) ( not ( = ?auto_1395356 ?auto_1395365 ) ) ( not ( = ?auto_1395357 ?auto_1395358 ) ) ( not ( = ?auto_1395357 ?auto_1395359 ) ) ( not ( = ?auto_1395357 ?auto_1395360 ) ) ( not ( = ?auto_1395357 ?auto_1395361 ) ) ( not ( = ?auto_1395357 ?auto_1395362 ) ) ( not ( = ?auto_1395357 ?auto_1395365 ) ) ( not ( = ?auto_1395358 ?auto_1395359 ) ) ( not ( = ?auto_1395358 ?auto_1395360 ) ) ( not ( = ?auto_1395358 ?auto_1395361 ) ) ( not ( = ?auto_1395358 ?auto_1395362 ) ) ( not ( = ?auto_1395358 ?auto_1395365 ) ) ( not ( = ?auto_1395359 ?auto_1395360 ) ) ( not ( = ?auto_1395359 ?auto_1395361 ) ) ( not ( = ?auto_1395359 ?auto_1395362 ) ) ( not ( = ?auto_1395359 ?auto_1395365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395360 ?auto_1395361 ?auto_1395362 )
      ( MAKE-13CRATE-VERIFY ?auto_1395350 ?auto_1395351 ?auto_1395352 ?auto_1395349 ?auto_1395353 ?auto_1395355 ?auto_1395354 ?auto_1395356 ?auto_1395357 ?auto_1395358 ?auto_1395359 ?auto_1395360 ?auto_1395361 ?auto_1395362 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1395533 - SURFACE
      ?auto_1395534 - SURFACE
      ?auto_1395535 - SURFACE
      ?auto_1395532 - SURFACE
      ?auto_1395536 - SURFACE
      ?auto_1395538 - SURFACE
      ?auto_1395537 - SURFACE
      ?auto_1395539 - SURFACE
      ?auto_1395540 - SURFACE
      ?auto_1395541 - SURFACE
      ?auto_1395542 - SURFACE
      ?auto_1395543 - SURFACE
      ?auto_1395544 - SURFACE
      ?auto_1395545 - SURFACE
    )
    :vars
    (
      ?auto_1395549 - HOIST
      ?auto_1395548 - PLACE
      ?auto_1395551 - PLACE
      ?auto_1395550 - HOIST
      ?auto_1395547 - SURFACE
      ?auto_1395546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395549 ?auto_1395548 ) ( IS-CRATE ?auto_1395545 ) ( not ( = ?auto_1395544 ?auto_1395545 ) ) ( not ( = ?auto_1395543 ?auto_1395544 ) ) ( not ( = ?auto_1395543 ?auto_1395545 ) ) ( not ( = ?auto_1395551 ?auto_1395548 ) ) ( HOIST-AT ?auto_1395550 ?auto_1395551 ) ( not ( = ?auto_1395549 ?auto_1395550 ) ) ( AVAILABLE ?auto_1395550 ) ( SURFACE-AT ?auto_1395545 ?auto_1395551 ) ( ON ?auto_1395545 ?auto_1395547 ) ( CLEAR ?auto_1395545 ) ( not ( = ?auto_1395544 ?auto_1395547 ) ) ( not ( = ?auto_1395545 ?auto_1395547 ) ) ( not ( = ?auto_1395543 ?auto_1395547 ) ) ( TRUCK-AT ?auto_1395546 ?auto_1395548 ) ( SURFACE-AT ?auto_1395543 ?auto_1395548 ) ( CLEAR ?auto_1395543 ) ( IS-CRATE ?auto_1395544 ) ( AVAILABLE ?auto_1395549 ) ( IN ?auto_1395544 ?auto_1395546 ) ( ON ?auto_1395534 ?auto_1395533 ) ( ON ?auto_1395535 ?auto_1395534 ) ( ON ?auto_1395532 ?auto_1395535 ) ( ON ?auto_1395536 ?auto_1395532 ) ( ON ?auto_1395538 ?auto_1395536 ) ( ON ?auto_1395537 ?auto_1395538 ) ( ON ?auto_1395539 ?auto_1395537 ) ( ON ?auto_1395540 ?auto_1395539 ) ( ON ?auto_1395541 ?auto_1395540 ) ( ON ?auto_1395542 ?auto_1395541 ) ( ON ?auto_1395543 ?auto_1395542 ) ( not ( = ?auto_1395533 ?auto_1395534 ) ) ( not ( = ?auto_1395533 ?auto_1395535 ) ) ( not ( = ?auto_1395533 ?auto_1395532 ) ) ( not ( = ?auto_1395533 ?auto_1395536 ) ) ( not ( = ?auto_1395533 ?auto_1395538 ) ) ( not ( = ?auto_1395533 ?auto_1395537 ) ) ( not ( = ?auto_1395533 ?auto_1395539 ) ) ( not ( = ?auto_1395533 ?auto_1395540 ) ) ( not ( = ?auto_1395533 ?auto_1395541 ) ) ( not ( = ?auto_1395533 ?auto_1395542 ) ) ( not ( = ?auto_1395533 ?auto_1395543 ) ) ( not ( = ?auto_1395533 ?auto_1395544 ) ) ( not ( = ?auto_1395533 ?auto_1395545 ) ) ( not ( = ?auto_1395533 ?auto_1395547 ) ) ( not ( = ?auto_1395534 ?auto_1395535 ) ) ( not ( = ?auto_1395534 ?auto_1395532 ) ) ( not ( = ?auto_1395534 ?auto_1395536 ) ) ( not ( = ?auto_1395534 ?auto_1395538 ) ) ( not ( = ?auto_1395534 ?auto_1395537 ) ) ( not ( = ?auto_1395534 ?auto_1395539 ) ) ( not ( = ?auto_1395534 ?auto_1395540 ) ) ( not ( = ?auto_1395534 ?auto_1395541 ) ) ( not ( = ?auto_1395534 ?auto_1395542 ) ) ( not ( = ?auto_1395534 ?auto_1395543 ) ) ( not ( = ?auto_1395534 ?auto_1395544 ) ) ( not ( = ?auto_1395534 ?auto_1395545 ) ) ( not ( = ?auto_1395534 ?auto_1395547 ) ) ( not ( = ?auto_1395535 ?auto_1395532 ) ) ( not ( = ?auto_1395535 ?auto_1395536 ) ) ( not ( = ?auto_1395535 ?auto_1395538 ) ) ( not ( = ?auto_1395535 ?auto_1395537 ) ) ( not ( = ?auto_1395535 ?auto_1395539 ) ) ( not ( = ?auto_1395535 ?auto_1395540 ) ) ( not ( = ?auto_1395535 ?auto_1395541 ) ) ( not ( = ?auto_1395535 ?auto_1395542 ) ) ( not ( = ?auto_1395535 ?auto_1395543 ) ) ( not ( = ?auto_1395535 ?auto_1395544 ) ) ( not ( = ?auto_1395535 ?auto_1395545 ) ) ( not ( = ?auto_1395535 ?auto_1395547 ) ) ( not ( = ?auto_1395532 ?auto_1395536 ) ) ( not ( = ?auto_1395532 ?auto_1395538 ) ) ( not ( = ?auto_1395532 ?auto_1395537 ) ) ( not ( = ?auto_1395532 ?auto_1395539 ) ) ( not ( = ?auto_1395532 ?auto_1395540 ) ) ( not ( = ?auto_1395532 ?auto_1395541 ) ) ( not ( = ?auto_1395532 ?auto_1395542 ) ) ( not ( = ?auto_1395532 ?auto_1395543 ) ) ( not ( = ?auto_1395532 ?auto_1395544 ) ) ( not ( = ?auto_1395532 ?auto_1395545 ) ) ( not ( = ?auto_1395532 ?auto_1395547 ) ) ( not ( = ?auto_1395536 ?auto_1395538 ) ) ( not ( = ?auto_1395536 ?auto_1395537 ) ) ( not ( = ?auto_1395536 ?auto_1395539 ) ) ( not ( = ?auto_1395536 ?auto_1395540 ) ) ( not ( = ?auto_1395536 ?auto_1395541 ) ) ( not ( = ?auto_1395536 ?auto_1395542 ) ) ( not ( = ?auto_1395536 ?auto_1395543 ) ) ( not ( = ?auto_1395536 ?auto_1395544 ) ) ( not ( = ?auto_1395536 ?auto_1395545 ) ) ( not ( = ?auto_1395536 ?auto_1395547 ) ) ( not ( = ?auto_1395538 ?auto_1395537 ) ) ( not ( = ?auto_1395538 ?auto_1395539 ) ) ( not ( = ?auto_1395538 ?auto_1395540 ) ) ( not ( = ?auto_1395538 ?auto_1395541 ) ) ( not ( = ?auto_1395538 ?auto_1395542 ) ) ( not ( = ?auto_1395538 ?auto_1395543 ) ) ( not ( = ?auto_1395538 ?auto_1395544 ) ) ( not ( = ?auto_1395538 ?auto_1395545 ) ) ( not ( = ?auto_1395538 ?auto_1395547 ) ) ( not ( = ?auto_1395537 ?auto_1395539 ) ) ( not ( = ?auto_1395537 ?auto_1395540 ) ) ( not ( = ?auto_1395537 ?auto_1395541 ) ) ( not ( = ?auto_1395537 ?auto_1395542 ) ) ( not ( = ?auto_1395537 ?auto_1395543 ) ) ( not ( = ?auto_1395537 ?auto_1395544 ) ) ( not ( = ?auto_1395537 ?auto_1395545 ) ) ( not ( = ?auto_1395537 ?auto_1395547 ) ) ( not ( = ?auto_1395539 ?auto_1395540 ) ) ( not ( = ?auto_1395539 ?auto_1395541 ) ) ( not ( = ?auto_1395539 ?auto_1395542 ) ) ( not ( = ?auto_1395539 ?auto_1395543 ) ) ( not ( = ?auto_1395539 ?auto_1395544 ) ) ( not ( = ?auto_1395539 ?auto_1395545 ) ) ( not ( = ?auto_1395539 ?auto_1395547 ) ) ( not ( = ?auto_1395540 ?auto_1395541 ) ) ( not ( = ?auto_1395540 ?auto_1395542 ) ) ( not ( = ?auto_1395540 ?auto_1395543 ) ) ( not ( = ?auto_1395540 ?auto_1395544 ) ) ( not ( = ?auto_1395540 ?auto_1395545 ) ) ( not ( = ?auto_1395540 ?auto_1395547 ) ) ( not ( = ?auto_1395541 ?auto_1395542 ) ) ( not ( = ?auto_1395541 ?auto_1395543 ) ) ( not ( = ?auto_1395541 ?auto_1395544 ) ) ( not ( = ?auto_1395541 ?auto_1395545 ) ) ( not ( = ?auto_1395541 ?auto_1395547 ) ) ( not ( = ?auto_1395542 ?auto_1395543 ) ) ( not ( = ?auto_1395542 ?auto_1395544 ) ) ( not ( = ?auto_1395542 ?auto_1395545 ) ) ( not ( = ?auto_1395542 ?auto_1395547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1395543 ?auto_1395544 ?auto_1395545 )
      ( MAKE-13CRATE-VERIFY ?auto_1395533 ?auto_1395534 ?auto_1395535 ?auto_1395532 ?auto_1395536 ?auto_1395538 ?auto_1395537 ?auto_1395539 ?auto_1395540 ?auto_1395541 ?auto_1395542 ?auto_1395543 ?auto_1395544 ?auto_1395545 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1409721 - SURFACE
      ?auto_1409722 - SURFACE
      ?auto_1409723 - SURFACE
      ?auto_1409720 - SURFACE
      ?auto_1409724 - SURFACE
      ?auto_1409726 - SURFACE
      ?auto_1409725 - SURFACE
      ?auto_1409727 - SURFACE
      ?auto_1409728 - SURFACE
      ?auto_1409729 - SURFACE
      ?auto_1409730 - SURFACE
      ?auto_1409731 - SURFACE
      ?auto_1409732 - SURFACE
      ?auto_1409733 - SURFACE
      ?auto_1409734 - SURFACE
    )
    :vars
    (
      ?auto_1409735 - HOIST
      ?auto_1409736 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1409735 ?auto_1409736 ) ( SURFACE-AT ?auto_1409733 ?auto_1409736 ) ( CLEAR ?auto_1409733 ) ( LIFTING ?auto_1409735 ?auto_1409734 ) ( IS-CRATE ?auto_1409734 ) ( not ( = ?auto_1409733 ?auto_1409734 ) ) ( ON ?auto_1409722 ?auto_1409721 ) ( ON ?auto_1409723 ?auto_1409722 ) ( ON ?auto_1409720 ?auto_1409723 ) ( ON ?auto_1409724 ?auto_1409720 ) ( ON ?auto_1409726 ?auto_1409724 ) ( ON ?auto_1409725 ?auto_1409726 ) ( ON ?auto_1409727 ?auto_1409725 ) ( ON ?auto_1409728 ?auto_1409727 ) ( ON ?auto_1409729 ?auto_1409728 ) ( ON ?auto_1409730 ?auto_1409729 ) ( ON ?auto_1409731 ?auto_1409730 ) ( ON ?auto_1409732 ?auto_1409731 ) ( ON ?auto_1409733 ?auto_1409732 ) ( not ( = ?auto_1409721 ?auto_1409722 ) ) ( not ( = ?auto_1409721 ?auto_1409723 ) ) ( not ( = ?auto_1409721 ?auto_1409720 ) ) ( not ( = ?auto_1409721 ?auto_1409724 ) ) ( not ( = ?auto_1409721 ?auto_1409726 ) ) ( not ( = ?auto_1409721 ?auto_1409725 ) ) ( not ( = ?auto_1409721 ?auto_1409727 ) ) ( not ( = ?auto_1409721 ?auto_1409728 ) ) ( not ( = ?auto_1409721 ?auto_1409729 ) ) ( not ( = ?auto_1409721 ?auto_1409730 ) ) ( not ( = ?auto_1409721 ?auto_1409731 ) ) ( not ( = ?auto_1409721 ?auto_1409732 ) ) ( not ( = ?auto_1409721 ?auto_1409733 ) ) ( not ( = ?auto_1409721 ?auto_1409734 ) ) ( not ( = ?auto_1409722 ?auto_1409723 ) ) ( not ( = ?auto_1409722 ?auto_1409720 ) ) ( not ( = ?auto_1409722 ?auto_1409724 ) ) ( not ( = ?auto_1409722 ?auto_1409726 ) ) ( not ( = ?auto_1409722 ?auto_1409725 ) ) ( not ( = ?auto_1409722 ?auto_1409727 ) ) ( not ( = ?auto_1409722 ?auto_1409728 ) ) ( not ( = ?auto_1409722 ?auto_1409729 ) ) ( not ( = ?auto_1409722 ?auto_1409730 ) ) ( not ( = ?auto_1409722 ?auto_1409731 ) ) ( not ( = ?auto_1409722 ?auto_1409732 ) ) ( not ( = ?auto_1409722 ?auto_1409733 ) ) ( not ( = ?auto_1409722 ?auto_1409734 ) ) ( not ( = ?auto_1409723 ?auto_1409720 ) ) ( not ( = ?auto_1409723 ?auto_1409724 ) ) ( not ( = ?auto_1409723 ?auto_1409726 ) ) ( not ( = ?auto_1409723 ?auto_1409725 ) ) ( not ( = ?auto_1409723 ?auto_1409727 ) ) ( not ( = ?auto_1409723 ?auto_1409728 ) ) ( not ( = ?auto_1409723 ?auto_1409729 ) ) ( not ( = ?auto_1409723 ?auto_1409730 ) ) ( not ( = ?auto_1409723 ?auto_1409731 ) ) ( not ( = ?auto_1409723 ?auto_1409732 ) ) ( not ( = ?auto_1409723 ?auto_1409733 ) ) ( not ( = ?auto_1409723 ?auto_1409734 ) ) ( not ( = ?auto_1409720 ?auto_1409724 ) ) ( not ( = ?auto_1409720 ?auto_1409726 ) ) ( not ( = ?auto_1409720 ?auto_1409725 ) ) ( not ( = ?auto_1409720 ?auto_1409727 ) ) ( not ( = ?auto_1409720 ?auto_1409728 ) ) ( not ( = ?auto_1409720 ?auto_1409729 ) ) ( not ( = ?auto_1409720 ?auto_1409730 ) ) ( not ( = ?auto_1409720 ?auto_1409731 ) ) ( not ( = ?auto_1409720 ?auto_1409732 ) ) ( not ( = ?auto_1409720 ?auto_1409733 ) ) ( not ( = ?auto_1409720 ?auto_1409734 ) ) ( not ( = ?auto_1409724 ?auto_1409726 ) ) ( not ( = ?auto_1409724 ?auto_1409725 ) ) ( not ( = ?auto_1409724 ?auto_1409727 ) ) ( not ( = ?auto_1409724 ?auto_1409728 ) ) ( not ( = ?auto_1409724 ?auto_1409729 ) ) ( not ( = ?auto_1409724 ?auto_1409730 ) ) ( not ( = ?auto_1409724 ?auto_1409731 ) ) ( not ( = ?auto_1409724 ?auto_1409732 ) ) ( not ( = ?auto_1409724 ?auto_1409733 ) ) ( not ( = ?auto_1409724 ?auto_1409734 ) ) ( not ( = ?auto_1409726 ?auto_1409725 ) ) ( not ( = ?auto_1409726 ?auto_1409727 ) ) ( not ( = ?auto_1409726 ?auto_1409728 ) ) ( not ( = ?auto_1409726 ?auto_1409729 ) ) ( not ( = ?auto_1409726 ?auto_1409730 ) ) ( not ( = ?auto_1409726 ?auto_1409731 ) ) ( not ( = ?auto_1409726 ?auto_1409732 ) ) ( not ( = ?auto_1409726 ?auto_1409733 ) ) ( not ( = ?auto_1409726 ?auto_1409734 ) ) ( not ( = ?auto_1409725 ?auto_1409727 ) ) ( not ( = ?auto_1409725 ?auto_1409728 ) ) ( not ( = ?auto_1409725 ?auto_1409729 ) ) ( not ( = ?auto_1409725 ?auto_1409730 ) ) ( not ( = ?auto_1409725 ?auto_1409731 ) ) ( not ( = ?auto_1409725 ?auto_1409732 ) ) ( not ( = ?auto_1409725 ?auto_1409733 ) ) ( not ( = ?auto_1409725 ?auto_1409734 ) ) ( not ( = ?auto_1409727 ?auto_1409728 ) ) ( not ( = ?auto_1409727 ?auto_1409729 ) ) ( not ( = ?auto_1409727 ?auto_1409730 ) ) ( not ( = ?auto_1409727 ?auto_1409731 ) ) ( not ( = ?auto_1409727 ?auto_1409732 ) ) ( not ( = ?auto_1409727 ?auto_1409733 ) ) ( not ( = ?auto_1409727 ?auto_1409734 ) ) ( not ( = ?auto_1409728 ?auto_1409729 ) ) ( not ( = ?auto_1409728 ?auto_1409730 ) ) ( not ( = ?auto_1409728 ?auto_1409731 ) ) ( not ( = ?auto_1409728 ?auto_1409732 ) ) ( not ( = ?auto_1409728 ?auto_1409733 ) ) ( not ( = ?auto_1409728 ?auto_1409734 ) ) ( not ( = ?auto_1409729 ?auto_1409730 ) ) ( not ( = ?auto_1409729 ?auto_1409731 ) ) ( not ( = ?auto_1409729 ?auto_1409732 ) ) ( not ( = ?auto_1409729 ?auto_1409733 ) ) ( not ( = ?auto_1409729 ?auto_1409734 ) ) ( not ( = ?auto_1409730 ?auto_1409731 ) ) ( not ( = ?auto_1409730 ?auto_1409732 ) ) ( not ( = ?auto_1409730 ?auto_1409733 ) ) ( not ( = ?auto_1409730 ?auto_1409734 ) ) ( not ( = ?auto_1409731 ?auto_1409732 ) ) ( not ( = ?auto_1409731 ?auto_1409733 ) ) ( not ( = ?auto_1409731 ?auto_1409734 ) ) ( not ( = ?auto_1409732 ?auto_1409733 ) ) ( not ( = ?auto_1409732 ?auto_1409734 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1409733 ?auto_1409734 )
      ( MAKE-14CRATE-VERIFY ?auto_1409721 ?auto_1409722 ?auto_1409723 ?auto_1409720 ?auto_1409724 ?auto_1409726 ?auto_1409725 ?auto_1409727 ?auto_1409728 ?auto_1409729 ?auto_1409730 ?auto_1409731 ?auto_1409732 ?auto_1409733 ?auto_1409734 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1409881 - SURFACE
      ?auto_1409882 - SURFACE
      ?auto_1409883 - SURFACE
      ?auto_1409880 - SURFACE
      ?auto_1409884 - SURFACE
      ?auto_1409886 - SURFACE
      ?auto_1409885 - SURFACE
      ?auto_1409887 - SURFACE
      ?auto_1409888 - SURFACE
      ?auto_1409889 - SURFACE
      ?auto_1409890 - SURFACE
      ?auto_1409891 - SURFACE
      ?auto_1409892 - SURFACE
      ?auto_1409893 - SURFACE
      ?auto_1409894 - SURFACE
    )
    :vars
    (
      ?auto_1409896 - HOIST
      ?auto_1409895 - PLACE
      ?auto_1409897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1409896 ?auto_1409895 ) ( SURFACE-AT ?auto_1409893 ?auto_1409895 ) ( CLEAR ?auto_1409893 ) ( IS-CRATE ?auto_1409894 ) ( not ( = ?auto_1409893 ?auto_1409894 ) ) ( TRUCK-AT ?auto_1409897 ?auto_1409895 ) ( AVAILABLE ?auto_1409896 ) ( IN ?auto_1409894 ?auto_1409897 ) ( ON ?auto_1409893 ?auto_1409892 ) ( not ( = ?auto_1409892 ?auto_1409893 ) ) ( not ( = ?auto_1409892 ?auto_1409894 ) ) ( ON ?auto_1409882 ?auto_1409881 ) ( ON ?auto_1409883 ?auto_1409882 ) ( ON ?auto_1409880 ?auto_1409883 ) ( ON ?auto_1409884 ?auto_1409880 ) ( ON ?auto_1409886 ?auto_1409884 ) ( ON ?auto_1409885 ?auto_1409886 ) ( ON ?auto_1409887 ?auto_1409885 ) ( ON ?auto_1409888 ?auto_1409887 ) ( ON ?auto_1409889 ?auto_1409888 ) ( ON ?auto_1409890 ?auto_1409889 ) ( ON ?auto_1409891 ?auto_1409890 ) ( ON ?auto_1409892 ?auto_1409891 ) ( not ( = ?auto_1409881 ?auto_1409882 ) ) ( not ( = ?auto_1409881 ?auto_1409883 ) ) ( not ( = ?auto_1409881 ?auto_1409880 ) ) ( not ( = ?auto_1409881 ?auto_1409884 ) ) ( not ( = ?auto_1409881 ?auto_1409886 ) ) ( not ( = ?auto_1409881 ?auto_1409885 ) ) ( not ( = ?auto_1409881 ?auto_1409887 ) ) ( not ( = ?auto_1409881 ?auto_1409888 ) ) ( not ( = ?auto_1409881 ?auto_1409889 ) ) ( not ( = ?auto_1409881 ?auto_1409890 ) ) ( not ( = ?auto_1409881 ?auto_1409891 ) ) ( not ( = ?auto_1409881 ?auto_1409892 ) ) ( not ( = ?auto_1409881 ?auto_1409893 ) ) ( not ( = ?auto_1409881 ?auto_1409894 ) ) ( not ( = ?auto_1409882 ?auto_1409883 ) ) ( not ( = ?auto_1409882 ?auto_1409880 ) ) ( not ( = ?auto_1409882 ?auto_1409884 ) ) ( not ( = ?auto_1409882 ?auto_1409886 ) ) ( not ( = ?auto_1409882 ?auto_1409885 ) ) ( not ( = ?auto_1409882 ?auto_1409887 ) ) ( not ( = ?auto_1409882 ?auto_1409888 ) ) ( not ( = ?auto_1409882 ?auto_1409889 ) ) ( not ( = ?auto_1409882 ?auto_1409890 ) ) ( not ( = ?auto_1409882 ?auto_1409891 ) ) ( not ( = ?auto_1409882 ?auto_1409892 ) ) ( not ( = ?auto_1409882 ?auto_1409893 ) ) ( not ( = ?auto_1409882 ?auto_1409894 ) ) ( not ( = ?auto_1409883 ?auto_1409880 ) ) ( not ( = ?auto_1409883 ?auto_1409884 ) ) ( not ( = ?auto_1409883 ?auto_1409886 ) ) ( not ( = ?auto_1409883 ?auto_1409885 ) ) ( not ( = ?auto_1409883 ?auto_1409887 ) ) ( not ( = ?auto_1409883 ?auto_1409888 ) ) ( not ( = ?auto_1409883 ?auto_1409889 ) ) ( not ( = ?auto_1409883 ?auto_1409890 ) ) ( not ( = ?auto_1409883 ?auto_1409891 ) ) ( not ( = ?auto_1409883 ?auto_1409892 ) ) ( not ( = ?auto_1409883 ?auto_1409893 ) ) ( not ( = ?auto_1409883 ?auto_1409894 ) ) ( not ( = ?auto_1409880 ?auto_1409884 ) ) ( not ( = ?auto_1409880 ?auto_1409886 ) ) ( not ( = ?auto_1409880 ?auto_1409885 ) ) ( not ( = ?auto_1409880 ?auto_1409887 ) ) ( not ( = ?auto_1409880 ?auto_1409888 ) ) ( not ( = ?auto_1409880 ?auto_1409889 ) ) ( not ( = ?auto_1409880 ?auto_1409890 ) ) ( not ( = ?auto_1409880 ?auto_1409891 ) ) ( not ( = ?auto_1409880 ?auto_1409892 ) ) ( not ( = ?auto_1409880 ?auto_1409893 ) ) ( not ( = ?auto_1409880 ?auto_1409894 ) ) ( not ( = ?auto_1409884 ?auto_1409886 ) ) ( not ( = ?auto_1409884 ?auto_1409885 ) ) ( not ( = ?auto_1409884 ?auto_1409887 ) ) ( not ( = ?auto_1409884 ?auto_1409888 ) ) ( not ( = ?auto_1409884 ?auto_1409889 ) ) ( not ( = ?auto_1409884 ?auto_1409890 ) ) ( not ( = ?auto_1409884 ?auto_1409891 ) ) ( not ( = ?auto_1409884 ?auto_1409892 ) ) ( not ( = ?auto_1409884 ?auto_1409893 ) ) ( not ( = ?auto_1409884 ?auto_1409894 ) ) ( not ( = ?auto_1409886 ?auto_1409885 ) ) ( not ( = ?auto_1409886 ?auto_1409887 ) ) ( not ( = ?auto_1409886 ?auto_1409888 ) ) ( not ( = ?auto_1409886 ?auto_1409889 ) ) ( not ( = ?auto_1409886 ?auto_1409890 ) ) ( not ( = ?auto_1409886 ?auto_1409891 ) ) ( not ( = ?auto_1409886 ?auto_1409892 ) ) ( not ( = ?auto_1409886 ?auto_1409893 ) ) ( not ( = ?auto_1409886 ?auto_1409894 ) ) ( not ( = ?auto_1409885 ?auto_1409887 ) ) ( not ( = ?auto_1409885 ?auto_1409888 ) ) ( not ( = ?auto_1409885 ?auto_1409889 ) ) ( not ( = ?auto_1409885 ?auto_1409890 ) ) ( not ( = ?auto_1409885 ?auto_1409891 ) ) ( not ( = ?auto_1409885 ?auto_1409892 ) ) ( not ( = ?auto_1409885 ?auto_1409893 ) ) ( not ( = ?auto_1409885 ?auto_1409894 ) ) ( not ( = ?auto_1409887 ?auto_1409888 ) ) ( not ( = ?auto_1409887 ?auto_1409889 ) ) ( not ( = ?auto_1409887 ?auto_1409890 ) ) ( not ( = ?auto_1409887 ?auto_1409891 ) ) ( not ( = ?auto_1409887 ?auto_1409892 ) ) ( not ( = ?auto_1409887 ?auto_1409893 ) ) ( not ( = ?auto_1409887 ?auto_1409894 ) ) ( not ( = ?auto_1409888 ?auto_1409889 ) ) ( not ( = ?auto_1409888 ?auto_1409890 ) ) ( not ( = ?auto_1409888 ?auto_1409891 ) ) ( not ( = ?auto_1409888 ?auto_1409892 ) ) ( not ( = ?auto_1409888 ?auto_1409893 ) ) ( not ( = ?auto_1409888 ?auto_1409894 ) ) ( not ( = ?auto_1409889 ?auto_1409890 ) ) ( not ( = ?auto_1409889 ?auto_1409891 ) ) ( not ( = ?auto_1409889 ?auto_1409892 ) ) ( not ( = ?auto_1409889 ?auto_1409893 ) ) ( not ( = ?auto_1409889 ?auto_1409894 ) ) ( not ( = ?auto_1409890 ?auto_1409891 ) ) ( not ( = ?auto_1409890 ?auto_1409892 ) ) ( not ( = ?auto_1409890 ?auto_1409893 ) ) ( not ( = ?auto_1409890 ?auto_1409894 ) ) ( not ( = ?auto_1409891 ?auto_1409892 ) ) ( not ( = ?auto_1409891 ?auto_1409893 ) ) ( not ( = ?auto_1409891 ?auto_1409894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1409892 ?auto_1409893 ?auto_1409894 )
      ( MAKE-14CRATE-VERIFY ?auto_1409881 ?auto_1409882 ?auto_1409883 ?auto_1409880 ?auto_1409884 ?auto_1409886 ?auto_1409885 ?auto_1409887 ?auto_1409888 ?auto_1409889 ?auto_1409890 ?auto_1409891 ?auto_1409892 ?auto_1409893 ?auto_1409894 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410056 - SURFACE
      ?auto_1410057 - SURFACE
      ?auto_1410058 - SURFACE
      ?auto_1410055 - SURFACE
      ?auto_1410059 - SURFACE
      ?auto_1410061 - SURFACE
      ?auto_1410060 - SURFACE
      ?auto_1410062 - SURFACE
      ?auto_1410063 - SURFACE
      ?auto_1410064 - SURFACE
      ?auto_1410065 - SURFACE
      ?auto_1410066 - SURFACE
      ?auto_1410067 - SURFACE
      ?auto_1410068 - SURFACE
      ?auto_1410069 - SURFACE
    )
    :vars
    (
      ?auto_1410072 - HOIST
      ?auto_1410073 - PLACE
      ?auto_1410071 - TRUCK
      ?auto_1410070 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410072 ?auto_1410073 ) ( SURFACE-AT ?auto_1410068 ?auto_1410073 ) ( CLEAR ?auto_1410068 ) ( IS-CRATE ?auto_1410069 ) ( not ( = ?auto_1410068 ?auto_1410069 ) ) ( AVAILABLE ?auto_1410072 ) ( IN ?auto_1410069 ?auto_1410071 ) ( ON ?auto_1410068 ?auto_1410067 ) ( not ( = ?auto_1410067 ?auto_1410068 ) ) ( not ( = ?auto_1410067 ?auto_1410069 ) ) ( TRUCK-AT ?auto_1410071 ?auto_1410070 ) ( not ( = ?auto_1410070 ?auto_1410073 ) ) ( ON ?auto_1410057 ?auto_1410056 ) ( ON ?auto_1410058 ?auto_1410057 ) ( ON ?auto_1410055 ?auto_1410058 ) ( ON ?auto_1410059 ?auto_1410055 ) ( ON ?auto_1410061 ?auto_1410059 ) ( ON ?auto_1410060 ?auto_1410061 ) ( ON ?auto_1410062 ?auto_1410060 ) ( ON ?auto_1410063 ?auto_1410062 ) ( ON ?auto_1410064 ?auto_1410063 ) ( ON ?auto_1410065 ?auto_1410064 ) ( ON ?auto_1410066 ?auto_1410065 ) ( ON ?auto_1410067 ?auto_1410066 ) ( not ( = ?auto_1410056 ?auto_1410057 ) ) ( not ( = ?auto_1410056 ?auto_1410058 ) ) ( not ( = ?auto_1410056 ?auto_1410055 ) ) ( not ( = ?auto_1410056 ?auto_1410059 ) ) ( not ( = ?auto_1410056 ?auto_1410061 ) ) ( not ( = ?auto_1410056 ?auto_1410060 ) ) ( not ( = ?auto_1410056 ?auto_1410062 ) ) ( not ( = ?auto_1410056 ?auto_1410063 ) ) ( not ( = ?auto_1410056 ?auto_1410064 ) ) ( not ( = ?auto_1410056 ?auto_1410065 ) ) ( not ( = ?auto_1410056 ?auto_1410066 ) ) ( not ( = ?auto_1410056 ?auto_1410067 ) ) ( not ( = ?auto_1410056 ?auto_1410068 ) ) ( not ( = ?auto_1410056 ?auto_1410069 ) ) ( not ( = ?auto_1410057 ?auto_1410058 ) ) ( not ( = ?auto_1410057 ?auto_1410055 ) ) ( not ( = ?auto_1410057 ?auto_1410059 ) ) ( not ( = ?auto_1410057 ?auto_1410061 ) ) ( not ( = ?auto_1410057 ?auto_1410060 ) ) ( not ( = ?auto_1410057 ?auto_1410062 ) ) ( not ( = ?auto_1410057 ?auto_1410063 ) ) ( not ( = ?auto_1410057 ?auto_1410064 ) ) ( not ( = ?auto_1410057 ?auto_1410065 ) ) ( not ( = ?auto_1410057 ?auto_1410066 ) ) ( not ( = ?auto_1410057 ?auto_1410067 ) ) ( not ( = ?auto_1410057 ?auto_1410068 ) ) ( not ( = ?auto_1410057 ?auto_1410069 ) ) ( not ( = ?auto_1410058 ?auto_1410055 ) ) ( not ( = ?auto_1410058 ?auto_1410059 ) ) ( not ( = ?auto_1410058 ?auto_1410061 ) ) ( not ( = ?auto_1410058 ?auto_1410060 ) ) ( not ( = ?auto_1410058 ?auto_1410062 ) ) ( not ( = ?auto_1410058 ?auto_1410063 ) ) ( not ( = ?auto_1410058 ?auto_1410064 ) ) ( not ( = ?auto_1410058 ?auto_1410065 ) ) ( not ( = ?auto_1410058 ?auto_1410066 ) ) ( not ( = ?auto_1410058 ?auto_1410067 ) ) ( not ( = ?auto_1410058 ?auto_1410068 ) ) ( not ( = ?auto_1410058 ?auto_1410069 ) ) ( not ( = ?auto_1410055 ?auto_1410059 ) ) ( not ( = ?auto_1410055 ?auto_1410061 ) ) ( not ( = ?auto_1410055 ?auto_1410060 ) ) ( not ( = ?auto_1410055 ?auto_1410062 ) ) ( not ( = ?auto_1410055 ?auto_1410063 ) ) ( not ( = ?auto_1410055 ?auto_1410064 ) ) ( not ( = ?auto_1410055 ?auto_1410065 ) ) ( not ( = ?auto_1410055 ?auto_1410066 ) ) ( not ( = ?auto_1410055 ?auto_1410067 ) ) ( not ( = ?auto_1410055 ?auto_1410068 ) ) ( not ( = ?auto_1410055 ?auto_1410069 ) ) ( not ( = ?auto_1410059 ?auto_1410061 ) ) ( not ( = ?auto_1410059 ?auto_1410060 ) ) ( not ( = ?auto_1410059 ?auto_1410062 ) ) ( not ( = ?auto_1410059 ?auto_1410063 ) ) ( not ( = ?auto_1410059 ?auto_1410064 ) ) ( not ( = ?auto_1410059 ?auto_1410065 ) ) ( not ( = ?auto_1410059 ?auto_1410066 ) ) ( not ( = ?auto_1410059 ?auto_1410067 ) ) ( not ( = ?auto_1410059 ?auto_1410068 ) ) ( not ( = ?auto_1410059 ?auto_1410069 ) ) ( not ( = ?auto_1410061 ?auto_1410060 ) ) ( not ( = ?auto_1410061 ?auto_1410062 ) ) ( not ( = ?auto_1410061 ?auto_1410063 ) ) ( not ( = ?auto_1410061 ?auto_1410064 ) ) ( not ( = ?auto_1410061 ?auto_1410065 ) ) ( not ( = ?auto_1410061 ?auto_1410066 ) ) ( not ( = ?auto_1410061 ?auto_1410067 ) ) ( not ( = ?auto_1410061 ?auto_1410068 ) ) ( not ( = ?auto_1410061 ?auto_1410069 ) ) ( not ( = ?auto_1410060 ?auto_1410062 ) ) ( not ( = ?auto_1410060 ?auto_1410063 ) ) ( not ( = ?auto_1410060 ?auto_1410064 ) ) ( not ( = ?auto_1410060 ?auto_1410065 ) ) ( not ( = ?auto_1410060 ?auto_1410066 ) ) ( not ( = ?auto_1410060 ?auto_1410067 ) ) ( not ( = ?auto_1410060 ?auto_1410068 ) ) ( not ( = ?auto_1410060 ?auto_1410069 ) ) ( not ( = ?auto_1410062 ?auto_1410063 ) ) ( not ( = ?auto_1410062 ?auto_1410064 ) ) ( not ( = ?auto_1410062 ?auto_1410065 ) ) ( not ( = ?auto_1410062 ?auto_1410066 ) ) ( not ( = ?auto_1410062 ?auto_1410067 ) ) ( not ( = ?auto_1410062 ?auto_1410068 ) ) ( not ( = ?auto_1410062 ?auto_1410069 ) ) ( not ( = ?auto_1410063 ?auto_1410064 ) ) ( not ( = ?auto_1410063 ?auto_1410065 ) ) ( not ( = ?auto_1410063 ?auto_1410066 ) ) ( not ( = ?auto_1410063 ?auto_1410067 ) ) ( not ( = ?auto_1410063 ?auto_1410068 ) ) ( not ( = ?auto_1410063 ?auto_1410069 ) ) ( not ( = ?auto_1410064 ?auto_1410065 ) ) ( not ( = ?auto_1410064 ?auto_1410066 ) ) ( not ( = ?auto_1410064 ?auto_1410067 ) ) ( not ( = ?auto_1410064 ?auto_1410068 ) ) ( not ( = ?auto_1410064 ?auto_1410069 ) ) ( not ( = ?auto_1410065 ?auto_1410066 ) ) ( not ( = ?auto_1410065 ?auto_1410067 ) ) ( not ( = ?auto_1410065 ?auto_1410068 ) ) ( not ( = ?auto_1410065 ?auto_1410069 ) ) ( not ( = ?auto_1410066 ?auto_1410067 ) ) ( not ( = ?auto_1410066 ?auto_1410068 ) ) ( not ( = ?auto_1410066 ?auto_1410069 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410067 ?auto_1410068 ?auto_1410069 )
      ( MAKE-14CRATE-VERIFY ?auto_1410056 ?auto_1410057 ?auto_1410058 ?auto_1410055 ?auto_1410059 ?auto_1410061 ?auto_1410060 ?auto_1410062 ?auto_1410063 ?auto_1410064 ?auto_1410065 ?auto_1410066 ?auto_1410067 ?auto_1410068 ?auto_1410069 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410245 - SURFACE
      ?auto_1410246 - SURFACE
      ?auto_1410247 - SURFACE
      ?auto_1410244 - SURFACE
      ?auto_1410248 - SURFACE
      ?auto_1410250 - SURFACE
      ?auto_1410249 - SURFACE
      ?auto_1410251 - SURFACE
      ?auto_1410252 - SURFACE
      ?auto_1410253 - SURFACE
      ?auto_1410254 - SURFACE
      ?auto_1410255 - SURFACE
      ?auto_1410256 - SURFACE
      ?auto_1410257 - SURFACE
      ?auto_1410258 - SURFACE
    )
    :vars
    (
      ?auto_1410260 - HOIST
      ?auto_1410263 - PLACE
      ?auto_1410259 - TRUCK
      ?auto_1410261 - PLACE
      ?auto_1410262 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410260 ?auto_1410263 ) ( SURFACE-AT ?auto_1410257 ?auto_1410263 ) ( CLEAR ?auto_1410257 ) ( IS-CRATE ?auto_1410258 ) ( not ( = ?auto_1410257 ?auto_1410258 ) ) ( AVAILABLE ?auto_1410260 ) ( ON ?auto_1410257 ?auto_1410256 ) ( not ( = ?auto_1410256 ?auto_1410257 ) ) ( not ( = ?auto_1410256 ?auto_1410258 ) ) ( TRUCK-AT ?auto_1410259 ?auto_1410261 ) ( not ( = ?auto_1410261 ?auto_1410263 ) ) ( HOIST-AT ?auto_1410262 ?auto_1410261 ) ( LIFTING ?auto_1410262 ?auto_1410258 ) ( not ( = ?auto_1410260 ?auto_1410262 ) ) ( ON ?auto_1410246 ?auto_1410245 ) ( ON ?auto_1410247 ?auto_1410246 ) ( ON ?auto_1410244 ?auto_1410247 ) ( ON ?auto_1410248 ?auto_1410244 ) ( ON ?auto_1410250 ?auto_1410248 ) ( ON ?auto_1410249 ?auto_1410250 ) ( ON ?auto_1410251 ?auto_1410249 ) ( ON ?auto_1410252 ?auto_1410251 ) ( ON ?auto_1410253 ?auto_1410252 ) ( ON ?auto_1410254 ?auto_1410253 ) ( ON ?auto_1410255 ?auto_1410254 ) ( ON ?auto_1410256 ?auto_1410255 ) ( not ( = ?auto_1410245 ?auto_1410246 ) ) ( not ( = ?auto_1410245 ?auto_1410247 ) ) ( not ( = ?auto_1410245 ?auto_1410244 ) ) ( not ( = ?auto_1410245 ?auto_1410248 ) ) ( not ( = ?auto_1410245 ?auto_1410250 ) ) ( not ( = ?auto_1410245 ?auto_1410249 ) ) ( not ( = ?auto_1410245 ?auto_1410251 ) ) ( not ( = ?auto_1410245 ?auto_1410252 ) ) ( not ( = ?auto_1410245 ?auto_1410253 ) ) ( not ( = ?auto_1410245 ?auto_1410254 ) ) ( not ( = ?auto_1410245 ?auto_1410255 ) ) ( not ( = ?auto_1410245 ?auto_1410256 ) ) ( not ( = ?auto_1410245 ?auto_1410257 ) ) ( not ( = ?auto_1410245 ?auto_1410258 ) ) ( not ( = ?auto_1410246 ?auto_1410247 ) ) ( not ( = ?auto_1410246 ?auto_1410244 ) ) ( not ( = ?auto_1410246 ?auto_1410248 ) ) ( not ( = ?auto_1410246 ?auto_1410250 ) ) ( not ( = ?auto_1410246 ?auto_1410249 ) ) ( not ( = ?auto_1410246 ?auto_1410251 ) ) ( not ( = ?auto_1410246 ?auto_1410252 ) ) ( not ( = ?auto_1410246 ?auto_1410253 ) ) ( not ( = ?auto_1410246 ?auto_1410254 ) ) ( not ( = ?auto_1410246 ?auto_1410255 ) ) ( not ( = ?auto_1410246 ?auto_1410256 ) ) ( not ( = ?auto_1410246 ?auto_1410257 ) ) ( not ( = ?auto_1410246 ?auto_1410258 ) ) ( not ( = ?auto_1410247 ?auto_1410244 ) ) ( not ( = ?auto_1410247 ?auto_1410248 ) ) ( not ( = ?auto_1410247 ?auto_1410250 ) ) ( not ( = ?auto_1410247 ?auto_1410249 ) ) ( not ( = ?auto_1410247 ?auto_1410251 ) ) ( not ( = ?auto_1410247 ?auto_1410252 ) ) ( not ( = ?auto_1410247 ?auto_1410253 ) ) ( not ( = ?auto_1410247 ?auto_1410254 ) ) ( not ( = ?auto_1410247 ?auto_1410255 ) ) ( not ( = ?auto_1410247 ?auto_1410256 ) ) ( not ( = ?auto_1410247 ?auto_1410257 ) ) ( not ( = ?auto_1410247 ?auto_1410258 ) ) ( not ( = ?auto_1410244 ?auto_1410248 ) ) ( not ( = ?auto_1410244 ?auto_1410250 ) ) ( not ( = ?auto_1410244 ?auto_1410249 ) ) ( not ( = ?auto_1410244 ?auto_1410251 ) ) ( not ( = ?auto_1410244 ?auto_1410252 ) ) ( not ( = ?auto_1410244 ?auto_1410253 ) ) ( not ( = ?auto_1410244 ?auto_1410254 ) ) ( not ( = ?auto_1410244 ?auto_1410255 ) ) ( not ( = ?auto_1410244 ?auto_1410256 ) ) ( not ( = ?auto_1410244 ?auto_1410257 ) ) ( not ( = ?auto_1410244 ?auto_1410258 ) ) ( not ( = ?auto_1410248 ?auto_1410250 ) ) ( not ( = ?auto_1410248 ?auto_1410249 ) ) ( not ( = ?auto_1410248 ?auto_1410251 ) ) ( not ( = ?auto_1410248 ?auto_1410252 ) ) ( not ( = ?auto_1410248 ?auto_1410253 ) ) ( not ( = ?auto_1410248 ?auto_1410254 ) ) ( not ( = ?auto_1410248 ?auto_1410255 ) ) ( not ( = ?auto_1410248 ?auto_1410256 ) ) ( not ( = ?auto_1410248 ?auto_1410257 ) ) ( not ( = ?auto_1410248 ?auto_1410258 ) ) ( not ( = ?auto_1410250 ?auto_1410249 ) ) ( not ( = ?auto_1410250 ?auto_1410251 ) ) ( not ( = ?auto_1410250 ?auto_1410252 ) ) ( not ( = ?auto_1410250 ?auto_1410253 ) ) ( not ( = ?auto_1410250 ?auto_1410254 ) ) ( not ( = ?auto_1410250 ?auto_1410255 ) ) ( not ( = ?auto_1410250 ?auto_1410256 ) ) ( not ( = ?auto_1410250 ?auto_1410257 ) ) ( not ( = ?auto_1410250 ?auto_1410258 ) ) ( not ( = ?auto_1410249 ?auto_1410251 ) ) ( not ( = ?auto_1410249 ?auto_1410252 ) ) ( not ( = ?auto_1410249 ?auto_1410253 ) ) ( not ( = ?auto_1410249 ?auto_1410254 ) ) ( not ( = ?auto_1410249 ?auto_1410255 ) ) ( not ( = ?auto_1410249 ?auto_1410256 ) ) ( not ( = ?auto_1410249 ?auto_1410257 ) ) ( not ( = ?auto_1410249 ?auto_1410258 ) ) ( not ( = ?auto_1410251 ?auto_1410252 ) ) ( not ( = ?auto_1410251 ?auto_1410253 ) ) ( not ( = ?auto_1410251 ?auto_1410254 ) ) ( not ( = ?auto_1410251 ?auto_1410255 ) ) ( not ( = ?auto_1410251 ?auto_1410256 ) ) ( not ( = ?auto_1410251 ?auto_1410257 ) ) ( not ( = ?auto_1410251 ?auto_1410258 ) ) ( not ( = ?auto_1410252 ?auto_1410253 ) ) ( not ( = ?auto_1410252 ?auto_1410254 ) ) ( not ( = ?auto_1410252 ?auto_1410255 ) ) ( not ( = ?auto_1410252 ?auto_1410256 ) ) ( not ( = ?auto_1410252 ?auto_1410257 ) ) ( not ( = ?auto_1410252 ?auto_1410258 ) ) ( not ( = ?auto_1410253 ?auto_1410254 ) ) ( not ( = ?auto_1410253 ?auto_1410255 ) ) ( not ( = ?auto_1410253 ?auto_1410256 ) ) ( not ( = ?auto_1410253 ?auto_1410257 ) ) ( not ( = ?auto_1410253 ?auto_1410258 ) ) ( not ( = ?auto_1410254 ?auto_1410255 ) ) ( not ( = ?auto_1410254 ?auto_1410256 ) ) ( not ( = ?auto_1410254 ?auto_1410257 ) ) ( not ( = ?auto_1410254 ?auto_1410258 ) ) ( not ( = ?auto_1410255 ?auto_1410256 ) ) ( not ( = ?auto_1410255 ?auto_1410257 ) ) ( not ( = ?auto_1410255 ?auto_1410258 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410256 ?auto_1410257 ?auto_1410258 )
      ( MAKE-14CRATE-VERIFY ?auto_1410245 ?auto_1410246 ?auto_1410247 ?auto_1410244 ?auto_1410248 ?auto_1410250 ?auto_1410249 ?auto_1410251 ?auto_1410252 ?auto_1410253 ?auto_1410254 ?auto_1410255 ?auto_1410256 ?auto_1410257 ?auto_1410258 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410448 - SURFACE
      ?auto_1410449 - SURFACE
      ?auto_1410450 - SURFACE
      ?auto_1410447 - SURFACE
      ?auto_1410451 - SURFACE
      ?auto_1410453 - SURFACE
      ?auto_1410452 - SURFACE
      ?auto_1410454 - SURFACE
      ?auto_1410455 - SURFACE
      ?auto_1410456 - SURFACE
      ?auto_1410457 - SURFACE
      ?auto_1410458 - SURFACE
      ?auto_1410459 - SURFACE
      ?auto_1410460 - SURFACE
      ?auto_1410461 - SURFACE
    )
    :vars
    (
      ?auto_1410462 - HOIST
      ?auto_1410466 - PLACE
      ?auto_1410464 - TRUCK
      ?auto_1410467 - PLACE
      ?auto_1410463 - HOIST
      ?auto_1410465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410462 ?auto_1410466 ) ( SURFACE-AT ?auto_1410460 ?auto_1410466 ) ( CLEAR ?auto_1410460 ) ( IS-CRATE ?auto_1410461 ) ( not ( = ?auto_1410460 ?auto_1410461 ) ) ( AVAILABLE ?auto_1410462 ) ( ON ?auto_1410460 ?auto_1410459 ) ( not ( = ?auto_1410459 ?auto_1410460 ) ) ( not ( = ?auto_1410459 ?auto_1410461 ) ) ( TRUCK-AT ?auto_1410464 ?auto_1410467 ) ( not ( = ?auto_1410467 ?auto_1410466 ) ) ( HOIST-AT ?auto_1410463 ?auto_1410467 ) ( not ( = ?auto_1410462 ?auto_1410463 ) ) ( AVAILABLE ?auto_1410463 ) ( SURFACE-AT ?auto_1410461 ?auto_1410467 ) ( ON ?auto_1410461 ?auto_1410465 ) ( CLEAR ?auto_1410461 ) ( not ( = ?auto_1410460 ?auto_1410465 ) ) ( not ( = ?auto_1410461 ?auto_1410465 ) ) ( not ( = ?auto_1410459 ?auto_1410465 ) ) ( ON ?auto_1410449 ?auto_1410448 ) ( ON ?auto_1410450 ?auto_1410449 ) ( ON ?auto_1410447 ?auto_1410450 ) ( ON ?auto_1410451 ?auto_1410447 ) ( ON ?auto_1410453 ?auto_1410451 ) ( ON ?auto_1410452 ?auto_1410453 ) ( ON ?auto_1410454 ?auto_1410452 ) ( ON ?auto_1410455 ?auto_1410454 ) ( ON ?auto_1410456 ?auto_1410455 ) ( ON ?auto_1410457 ?auto_1410456 ) ( ON ?auto_1410458 ?auto_1410457 ) ( ON ?auto_1410459 ?auto_1410458 ) ( not ( = ?auto_1410448 ?auto_1410449 ) ) ( not ( = ?auto_1410448 ?auto_1410450 ) ) ( not ( = ?auto_1410448 ?auto_1410447 ) ) ( not ( = ?auto_1410448 ?auto_1410451 ) ) ( not ( = ?auto_1410448 ?auto_1410453 ) ) ( not ( = ?auto_1410448 ?auto_1410452 ) ) ( not ( = ?auto_1410448 ?auto_1410454 ) ) ( not ( = ?auto_1410448 ?auto_1410455 ) ) ( not ( = ?auto_1410448 ?auto_1410456 ) ) ( not ( = ?auto_1410448 ?auto_1410457 ) ) ( not ( = ?auto_1410448 ?auto_1410458 ) ) ( not ( = ?auto_1410448 ?auto_1410459 ) ) ( not ( = ?auto_1410448 ?auto_1410460 ) ) ( not ( = ?auto_1410448 ?auto_1410461 ) ) ( not ( = ?auto_1410448 ?auto_1410465 ) ) ( not ( = ?auto_1410449 ?auto_1410450 ) ) ( not ( = ?auto_1410449 ?auto_1410447 ) ) ( not ( = ?auto_1410449 ?auto_1410451 ) ) ( not ( = ?auto_1410449 ?auto_1410453 ) ) ( not ( = ?auto_1410449 ?auto_1410452 ) ) ( not ( = ?auto_1410449 ?auto_1410454 ) ) ( not ( = ?auto_1410449 ?auto_1410455 ) ) ( not ( = ?auto_1410449 ?auto_1410456 ) ) ( not ( = ?auto_1410449 ?auto_1410457 ) ) ( not ( = ?auto_1410449 ?auto_1410458 ) ) ( not ( = ?auto_1410449 ?auto_1410459 ) ) ( not ( = ?auto_1410449 ?auto_1410460 ) ) ( not ( = ?auto_1410449 ?auto_1410461 ) ) ( not ( = ?auto_1410449 ?auto_1410465 ) ) ( not ( = ?auto_1410450 ?auto_1410447 ) ) ( not ( = ?auto_1410450 ?auto_1410451 ) ) ( not ( = ?auto_1410450 ?auto_1410453 ) ) ( not ( = ?auto_1410450 ?auto_1410452 ) ) ( not ( = ?auto_1410450 ?auto_1410454 ) ) ( not ( = ?auto_1410450 ?auto_1410455 ) ) ( not ( = ?auto_1410450 ?auto_1410456 ) ) ( not ( = ?auto_1410450 ?auto_1410457 ) ) ( not ( = ?auto_1410450 ?auto_1410458 ) ) ( not ( = ?auto_1410450 ?auto_1410459 ) ) ( not ( = ?auto_1410450 ?auto_1410460 ) ) ( not ( = ?auto_1410450 ?auto_1410461 ) ) ( not ( = ?auto_1410450 ?auto_1410465 ) ) ( not ( = ?auto_1410447 ?auto_1410451 ) ) ( not ( = ?auto_1410447 ?auto_1410453 ) ) ( not ( = ?auto_1410447 ?auto_1410452 ) ) ( not ( = ?auto_1410447 ?auto_1410454 ) ) ( not ( = ?auto_1410447 ?auto_1410455 ) ) ( not ( = ?auto_1410447 ?auto_1410456 ) ) ( not ( = ?auto_1410447 ?auto_1410457 ) ) ( not ( = ?auto_1410447 ?auto_1410458 ) ) ( not ( = ?auto_1410447 ?auto_1410459 ) ) ( not ( = ?auto_1410447 ?auto_1410460 ) ) ( not ( = ?auto_1410447 ?auto_1410461 ) ) ( not ( = ?auto_1410447 ?auto_1410465 ) ) ( not ( = ?auto_1410451 ?auto_1410453 ) ) ( not ( = ?auto_1410451 ?auto_1410452 ) ) ( not ( = ?auto_1410451 ?auto_1410454 ) ) ( not ( = ?auto_1410451 ?auto_1410455 ) ) ( not ( = ?auto_1410451 ?auto_1410456 ) ) ( not ( = ?auto_1410451 ?auto_1410457 ) ) ( not ( = ?auto_1410451 ?auto_1410458 ) ) ( not ( = ?auto_1410451 ?auto_1410459 ) ) ( not ( = ?auto_1410451 ?auto_1410460 ) ) ( not ( = ?auto_1410451 ?auto_1410461 ) ) ( not ( = ?auto_1410451 ?auto_1410465 ) ) ( not ( = ?auto_1410453 ?auto_1410452 ) ) ( not ( = ?auto_1410453 ?auto_1410454 ) ) ( not ( = ?auto_1410453 ?auto_1410455 ) ) ( not ( = ?auto_1410453 ?auto_1410456 ) ) ( not ( = ?auto_1410453 ?auto_1410457 ) ) ( not ( = ?auto_1410453 ?auto_1410458 ) ) ( not ( = ?auto_1410453 ?auto_1410459 ) ) ( not ( = ?auto_1410453 ?auto_1410460 ) ) ( not ( = ?auto_1410453 ?auto_1410461 ) ) ( not ( = ?auto_1410453 ?auto_1410465 ) ) ( not ( = ?auto_1410452 ?auto_1410454 ) ) ( not ( = ?auto_1410452 ?auto_1410455 ) ) ( not ( = ?auto_1410452 ?auto_1410456 ) ) ( not ( = ?auto_1410452 ?auto_1410457 ) ) ( not ( = ?auto_1410452 ?auto_1410458 ) ) ( not ( = ?auto_1410452 ?auto_1410459 ) ) ( not ( = ?auto_1410452 ?auto_1410460 ) ) ( not ( = ?auto_1410452 ?auto_1410461 ) ) ( not ( = ?auto_1410452 ?auto_1410465 ) ) ( not ( = ?auto_1410454 ?auto_1410455 ) ) ( not ( = ?auto_1410454 ?auto_1410456 ) ) ( not ( = ?auto_1410454 ?auto_1410457 ) ) ( not ( = ?auto_1410454 ?auto_1410458 ) ) ( not ( = ?auto_1410454 ?auto_1410459 ) ) ( not ( = ?auto_1410454 ?auto_1410460 ) ) ( not ( = ?auto_1410454 ?auto_1410461 ) ) ( not ( = ?auto_1410454 ?auto_1410465 ) ) ( not ( = ?auto_1410455 ?auto_1410456 ) ) ( not ( = ?auto_1410455 ?auto_1410457 ) ) ( not ( = ?auto_1410455 ?auto_1410458 ) ) ( not ( = ?auto_1410455 ?auto_1410459 ) ) ( not ( = ?auto_1410455 ?auto_1410460 ) ) ( not ( = ?auto_1410455 ?auto_1410461 ) ) ( not ( = ?auto_1410455 ?auto_1410465 ) ) ( not ( = ?auto_1410456 ?auto_1410457 ) ) ( not ( = ?auto_1410456 ?auto_1410458 ) ) ( not ( = ?auto_1410456 ?auto_1410459 ) ) ( not ( = ?auto_1410456 ?auto_1410460 ) ) ( not ( = ?auto_1410456 ?auto_1410461 ) ) ( not ( = ?auto_1410456 ?auto_1410465 ) ) ( not ( = ?auto_1410457 ?auto_1410458 ) ) ( not ( = ?auto_1410457 ?auto_1410459 ) ) ( not ( = ?auto_1410457 ?auto_1410460 ) ) ( not ( = ?auto_1410457 ?auto_1410461 ) ) ( not ( = ?auto_1410457 ?auto_1410465 ) ) ( not ( = ?auto_1410458 ?auto_1410459 ) ) ( not ( = ?auto_1410458 ?auto_1410460 ) ) ( not ( = ?auto_1410458 ?auto_1410461 ) ) ( not ( = ?auto_1410458 ?auto_1410465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410459 ?auto_1410460 ?auto_1410461 )
      ( MAKE-14CRATE-VERIFY ?auto_1410448 ?auto_1410449 ?auto_1410450 ?auto_1410447 ?auto_1410451 ?auto_1410453 ?auto_1410452 ?auto_1410454 ?auto_1410455 ?auto_1410456 ?auto_1410457 ?auto_1410458 ?auto_1410459 ?auto_1410460 ?auto_1410461 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410652 - SURFACE
      ?auto_1410653 - SURFACE
      ?auto_1410654 - SURFACE
      ?auto_1410651 - SURFACE
      ?auto_1410655 - SURFACE
      ?auto_1410657 - SURFACE
      ?auto_1410656 - SURFACE
      ?auto_1410658 - SURFACE
      ?auto_1410659 - SURFACE
      ?auto_1410660 - SURFACE
      ?auto_1410661 - SURFACE
      ?auto_1410662 - SURFACE
      ?auto_1410663 - SURFACE
      ?auto_1410664 - SURFACE
      ?auto_1410665 - SURFACE
    )
    :vars
    (
      ?auto_1410669 - HOIST
      ?auto_1410667 - PLACE
      ?auto_1410670 - PLACE
      ?auto_1410666 - HOIST
      ?auto_1410668 - SURFACE
      ?auto_1410671 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410669 ?auto_1410667 ) ( SURFACE-AT ?auto_1410664 ?auto_1410667 ) ( CLEAR ?auto_1410664 ) ( IS-CRATE ?auto_1410665 ) ( not ( = ?auto_1410664 ?auto_1410665 ) ) ( AVAILABLE ?auto_1410669 ) ( ON ?auto_1410664 ?auto_1410663 ) ( not ( = ?auto_1410663 ?auto_1410664 ) ) ( not ( = ?auto_1410663 ?auto_1410665 ) ) ( not ( = ?auto_1410670 ?auto_1410667 ) ) ( HOIST-AT ?auto_1410666 ?auto_1410670 ) ( not ( = ?auto_1410669 ?auto_1410666 ) ) ( AVAILABLE ?auto_1410666 ) ( SURFACE-AT ?auto_1410665 ?auto_1410670 ) ( ON ?auto_1410665 ?auto_1410668 ) ( CLEAR ?auto_1410665 ) ( not ( = ?auto_1410664 ?auto_1410668 ) ) ( not ( = ?auto_1410665 ?auto_1410668 ) ) ( not ( = ?auto_1410663 ?auto_1410668 ) ) ( TRUCK-AT ?auto_1410671 ?auto_1410667 ) ( ON ?auto_1410653 ?auto_1410652 ) ( ON ?auto_1410654 ?auto_1410653 ) ( ON ?auto_1410651 ?auto_1410654 ) ( ON ?auto_1410655 ?auto_1410651 ) ( ON ?auto_1410657 ?auto_1410655 ) ( ON ?auto_1410656 ?auto_1410657 ) ( ON ?auto_1410658 ?auto_1410656 ) ( ON ?auto_1410659 ?auto_1410658 ) ( ON ?auto_1410660 ?auto_1410659 ) ( ON ?auto_1410661 ?auto_1410660 ) ( ON ?auto_1410662 ?auto_1410661 ) ( ON ?auto_1410663 ?auto_1410662 ) ( not ( = ?auto_1410652 ?auto_1410653 ) ) ( not ( = ?auto_1410652 ?auto_1410654 ) ) ( not ( = ?auto_1410652 ?auto_1410651 ) ) ( not ( = ?auto_1410652 ?auto_1410655 ) ) ( not ( = ?auto_1410652 ?auto_1410657 ) ) ( not ( = ?auto_1410652 ?auto_1410656 ) ) ( not ( = ?auto_1410652 ?auto_1410658 ) ) ( not ( = ?auto_1410652 ?auto_1410659 ) ) ( not ( = ?auto_1410652 ?auto_1410660 ) ) ( not ( = ?auto_1410652 ?auto_1410661 ) ) ( not ( = ?auto_1410652 ?auto_1410662 ) ) ( not ( = ?auto_1410652 ?auto_1410663 ) ) ( not ( = ?auto_1410652 ?auto_1410664 ) ) ( not ( = ?auto_1410652 ?auto_1410665 ) ) ( not ( = ?auto_1410652 ?auto_1410668 ) ) ( not ( = ?auto_1410653 ?auto_1410654 ) ) ( not ( = ?auto_1410653 ?auto_1410651 ) ) ( not ( = ?auto_1410653 ?auto_1410655 ) ) ( not ( = ?auto_1410653 ?auto_1410657 ) ) ( not ( = ?auto_1410653 ?auto_1410656 ) ) ( not ( = ?auto_1410653 ?auto_1410658 ) ) ( not ( = ?auto_1410653 ?auto_1410659 ) ) ( not ( = ?auto_1410653 ?auto_1410660 ) ) ( not ( = ?auto_1410653 ?auto_1410661 ) ) ( not ( = ?auto_1410653 ?auto_1410662 ) ) ( not ( = ?auto_1410653 ?auto_1410663 ) ) ( not ( = ?auto_1410653 ?auto_1410664 ) ) ( not ( = ?auto_1410653 ?auto_1410665 ) ) ( not ( = ?auto_1410653 ?auto_1410668 ) ) ( not ( = ?auto_1410654 ?auto_1410651 ) ) ( not ( = ?auto_1410654 ?auto_1410655 ) ) ( not ( = ?auto_1410654 ?auto_1410657 ) ) ( not ( = ?auto_1410654 ?auto_1410656 ) ) ( not ( = ?auto_1410654 ?auto_1410658 ) ) ( not ( = ?auto_1410654 ?auto_1410659 ) ) ( not ( = ?auto_1410654 ?auto_1410660 ) ) ( not ( = ?auto_1410654 ?auto_1410661 ) ) ( not ( = ?auto_1410654 ?auto_1410662 ) ) ( not ( = ?auto_1410654 ?auto_1410663 ) ) ( not ( = ?auto_1410654 ?auto_1410664 ) ) ( not ( = ?auto_1410654 ?auto_1410665 ) ) ( not ( = ?auto_1410654 ?auto_1410668 ) ) ( not ( = ?auto_1410651 ?auto_1410655 ) ) ( not ( = ?auto_1410651 ?auto_1410657 ) ) ( not ( = ?auto_1410651 ?auto_1410656 ) ) ( not ( = ?auto_1410651 ?auto_1410658 ) ) ( not ( = ?auto_1410651 ?auto_1410659 ) ) ( not ( = ?auto_1410651 ?auto_1410660 ) ) ( not ( = ?auto_1410651 ?auto_1410661 ) ) ( not ( = ?auto_1410651 ?auto_1410662 ) ) ( not ( = ?auto_1410651 ?auto_1410663 ) ) ( not ( = ?auto_1410651 ?auto_1410664 ) ) ( not ( = ?auto_1410651 ?auto_1410665 ) ) ( not ( = ?auto_1410651 ?auto_1410668 ) ) ( not ( = ?auto_1410655 ?auto_1410657 ) ) ( not ( = ?auto_1410655 ?auto_1410656 ) ) ( not ( = ?auto_1410655 ?auto_1410658 ) ) ( not ( = ?auto_1410655 ?auto_1410659 ) ) ( not ( = ?auto_1410655 ?auto_1410660 ) ) ( not ( = ?auto_1410655 ?auto_1410661 ) ) ( not ( = ?auto_1410655 ?auto_1410662 ) ) ( not ( = ?auto_1410655 ?auto_1410663 ) ) ( not ( = ?auto_1410655 ?auto_1410664 ) ) ( not ( = ?auto_1410655 ?auto_1410665 ) ) ( not ( = ?auto_1410655 ?auto_1410668 ) ) ( not ( = ?auto_1410657 ?auto_1410656 ) ) ( not ( = ?auto_1410657 ?auto_1410658 ) ) ( not ( = ?auto_1410657 ?auto_1410659 ) ) ( not ( = ?auto_1410657 ?auto_1410660 ) ) ( not ( = ?auto_1410657 ?auto_1410661 ) ) ( not ( = ?auto_1410657 ?auto_1410662 ) ) ( not ( = ?auto_1410657 ?auto_1410663 ) ) ( not ( = ?auto_1410657 ?auto_1410664 ) ) ( not ( = ?auto_1410657 ?auto_1410665 ) ) ( not ( = ?auto_1410657 ?auto_1410668 ) ) ( not ( = ?auto_1410656 ?auto_1410658 ) ) ( not ( = ?auto_1410656 ?auto_1410659 ) ) ( not ( = ?auto_1410656 ?auto_1410660 ) ) ( not ( = ?auto_1410656 ?auto_1410661 ) ) ( not ( = ?auto_1410656 ?auto_1410662 ) ) ( not ( = ?auto_1410656 ?auto_1410663 ) ) ( not ( = ?auto_1410656 ?auto_1410664 ) ) ( not ( = ?auto_1410656 ?auto_1410665 ) ) ( not ( = ?auto_1410656 ?auto_1410668 ) ) ( not ( = ?auto_1410658 ?auto_1410659 ) ) ( not ( = ?auto_1410658 ?auto_1410660 ) ) ( not ( = ?auto_1410658 ?auto_1410661 ) ) ( not ( = ?auto_1410658 ?auto_1410662 ) ) ( not ( = ?auto_1410658 ?auto_1410663 ) ) ( not ( = ?auto_1410658 ?auto_1410664 ) ) ( not ( = ?auto_1410658 ?auto_1410665 ) ) ( not ( = ?auto_1410658 ?auto_1410668 ) ) ( not ( = ?auto_1410659 ?auto_1410660 ) ) ( not ( = ?auto_1410659 ?auto_1410661 ) ) ( not ( = ?auto_1410659 ?auto_1410662 ) ) ( not ( = ?auto_1410659 ?auto_1410663 ) ) ( not ( = ?auto_1410659 ?auto_1410664 ) ) ( not ( = ?auto_1410659 ?auto_1410665 ) ) ( not ( = ?auto_1410659 ?auto_1410668 ) ) ( not ( = ?auto_1410660 ?auto_1410661 ) ) ( not ( = ?auto_1410660 ?auto_1410662 ) ) ( not ( = ?auto_1410660 ?auto_1410663 ) ) ( not ( = ?auto_1410660 ?auto_1410664 ) ) ( not ( = ?auto_1410660 ?auto_1410665 ) ) ( not ( = ?auto_1410660 ?auto_1410668 ) ) ( not ( = ?auto_1410661 ?auto_1410662 ) ) ( not ( = ?auto_1410661 ?auto_1410663 ) ) ( not ( = ?auto_1410661 ?auto_1410664 ) ) ( not ( = ?auto_1410661 ?auto_1410665 ) ) ( not ( = ?auto_1410661 ?auto_1410668 ) ) ( not ( = ?auto_1410662 ?auto_1410663 ) ) ( not ( = ?auto_1410662 ?auto_1410664 ) ) ( not ( = ?auto_1410662 ?auto_1410665 ) ) ( not ( = ?auto_1410662 ?auto_1410668 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410663 ?auto_1410664 ?auto_1410665 )
      ( MAKE-14CRATE-VERIFY ?auto_1410652 ?auto_1410653 ?auto_1410654 ?auto_1410651 ?auto_1410655 ?auto_1410657 ?auto_1410656 ?auto_1410658 ?auto_1410659 ?auto_1410660 ?auto_1410661 ?auto_1410662 ?auto_1410663 ?auto_1410664 ?auto_1410665 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1410856 - SURFACE
      ?auto_1410857 - SURFACE
      ?auto_1410858 - SURFACE
      ?auto_1410855 - SURFACE
      ?auto_1410859 - SURFACE
      ?auto_1410861 - SURFACE
      ?auto_1410860 - SURFACE
      ?auto_1410862 - SURFACE
      ?auto_1410863 - SURFACE
      ?auto_1410864 - SURFACE
      ?auto_1410865 - SURFACE
      ?auto_1410866 - SURFACE
      ?auto_1410867 - SURFACE
      ?auto_1410868 - SURFACE
      ?auto_1410869 - SURFACE
    )
    :vars
    (
      ?auto_1410873 - HOIST
      ?auto_1410872 - PLACE
      ?auto_1410871 - PLACE
      ?auto_1410874 - HOIST
      ?auto_1410870 - SURFACE
      ?auto_1410875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1410873 ?auto_1410872 ) ( IS-CRATE ?auto_1410869 ) ( not ( = ?auto_1410868 ?auto_1410869 ) ) ( not ( = ?auto_1410867 ?auto_1410868 ) ) ( not ( = ?auto_1410867 ?auto_1410869 ) ) ( not ( = ?auto_1410871 ?auto_1410872 ) ) ( HOIST-AT ?auto_1410874 ?auto_1410871 ) ( not ( = ?auto_1410873 ?auto_1410874 ) ) ( AVAILABLE ?auto_1410874 ) ( SURFACE-AT ?auto_1410869 ?auto_1410871 ) ( ON ?auto_1410869 ?auto_1410870 ) ( CLEAR ?auto_1410869 ) ( not ( = ?auto_1410868 ?auto_1410870 ) ) ( not ( = ?auto_1410869 ?auto_1410870 ) ) ( not ( = ?auto_1410867 ?auto_1410870 ) ) ( TRUCK-AT ?auto_1410875 ?auto_1410872 ) ( SURFACE-AT ?auto_1410867 ?auto_1410872 ) ( CLEAR ?auto_1410867 ) ( LIFTING ?auto_1410873 ?auto_1410868 ) ( IS-CRATE ?auto_1410868 ) ( ON ?auto_1410857 ?auto_1410856 ) ( ON ?auto_1410858 ?auto_1410857 ) ( ON ?auto_1410855 ?auto_1410858 ) ( ON ?auto_1410859 ?auto_1410855 ) ( ON ?auto_1410861 ?auto_1410859 ) ( ON ?auto_1410860 ?auto_1410861 ) ( ON ?auto_1410862 ?auto_1410860 ) ( ON ?auto_1410863 ?auto_1410862 ) ( ON ?auto_1410864 ?auto_1410863 ) ( ON ?auto_1410865 ?auto_1410864 ) ( ON ?auto_1410866 ?auto_1410865 ) ( ON ?auto_1410867 ?auto_1410866 ) ( not ( = ?auto_1410856 ?auto_1410857 ) ) ( not ( = ?auto_1410856 ?auto_1410858 ) ) ( not ( = ?auto_1410856 ?auto_1410855 ) ) ( not ( = ?auto_1410856 ?auto_1410859 ) ) ( not ( = ?auto_1410856 ?auto_1410861 ) ) ( not ( = ?auto_1410856 ?auto_1410860 ) ) ( not ( = ?auto_1410856 ?auto_1410862 ) ) ( not ( = ?auto_1410856 ?auto_1410863 ) ) ( not ( = ?auto_1410856 ?auto_1410864 ) ) ( not ( = ?auto_1410856 ?auto_1410865 ) ) ( not ( = ?auto_1410856 ?auto_1410866 ) ) ( not ( = ?auto_1410856 ?auto_1410867 ) ) ( not ( = ?auto_1410856 ?auto_1410868 ) ) ( not ( = ?auto_1410856 ?auto_1410869 ) ) ( not ( = ?auto_1410856 ?auto_1410870 ) ) ( not ( = ?auto_1410857 ?auto_1410858 ) ) ( not ( = ?auto_1410857 ?auto_1410855 ) ) ( not ( = ?auto_1410857 ?auto_1410859 ) ) ( not ( = ?auto_1410857 ?auto_1410861 ) ) ( not ( = ?auto_1410857 ?auto_1410860 ) ) ( not ( = ?auto_1410857 ?auto_1410862 ) ) ( not ( = ?auto_1410857 ?auto_1410863 ) ) ( not ( = ?auto_1410857 ?auto_1410864 ) ) ( not ( = ?auto_1410857 ?auto_1410865 ) ) ( not ( = ?auto_1410857 ?auto_1410866 ) ) ( not ( = ?auto_1410857 ?auto_1410867 ) ) ( not ( = ?auto_1410857 ?auto_1410868 ) ) ( not ( = ?auto_1410857 ?auto_1410869 ) ) ( not ( = ?auto_1410857 ?auto_1410870 ) ) ( not ( = ?auto_1410858 ?auto_1410855 ) ) ( not ( = ?auto_1410858 ?auto_1410859 ) ) ( not ( = ?auto_1410858 ?auto_1410861 ) ) ( not ( = ?auto_1410858 ?auto_1410860 ) ) ( not ( = ?auto_1410858 ?auto_1410862 ) ) ( not ( = ?auto_1410858 ?auto_1410863 ) ) ( not ( = ?auto_1410858 ?auto_1410864 ) ) ( not ( = ?auto_1410858 ?auto_1410865 ) ) ( not ( = ?auto_1410858 ?auto_1410866 ) ) ( not ( = ?auto_1410858 ?auto_1410867 ) ) ( not ( = ?auto_1410858 ?auto_1410868 ) ) ( not ( = ?auto_1410858 ?auto_1410869 ) ) ( not ( = ?auto_1410858 ?auto_1410870 ) ) ( not ( = ?auto_1410855 ?auto_1410859 ) ) ( not ( = ?auto_1410855 ?auto_1410861 ) ) ( not ( = ?auto_1410855 ?auto_1410860 ) ) ( not ( = ?auto_1410855 ?auto_1410862 ) ) ( not ( = ?auto_1410855 ?auto_1410863 ) ) ( not ( = ?auto_1410855 ?auto_1410864 ) ) ( not ( = ?auto_1410855 ?auto_1410865 ) ) ( not ( = ?auto_1410855 ?auto_1410866 ) ) ( not ( = ?auto_1410855 ?auto_1410867 ) ) ( not ( = ?auto_1410855 ?auto_1410868 ) ) ( not ( = ?auto_1410855 ?auto_1410869 ) ) ( not ( = ?auto_1410855 ?auto_1410870 ) ) ( not ( = ?auto_1410859 ?auto_1410861 ) ) ( not ( = ?auto_1410859 ?auto_1410860 ) ) ( not ( = ?auto_1410859 ?auto_1410862 ) ) ( not ( = ?auto_1410859 ?auto_1410863 ) ) ( not ( = ?auto_1410859 ?auto_1410864 ) ) ( not ( = ?auto_1410859 ?auto_1410865 ) ) ( not ( = ?auto_1410859 ?auto_1410866 ) ) ( not ( = ?auto_1410859 ?auto_1410867 ) ) ( not ( = ?auto_1410859 ?auto_1410868 ) ) ( not ( = ?auto_1410859 ?auto_1410869 ) ) ( not ( = ?auto_1410859 ?auto_1410870 ) ) ( not ( = ?auto_1410861 ?auto_1410860 ) ) ( not ( = ?auto_1410861 ?auto_1410862 ) ) ( not ( = ?auto_1410861 ?auto_1410863 ) ) ( not ( = ?auto_1410861 ?auto_1410864 ) ) ( not ( = ?auto_1410861 ?auto_1410865 ) ) ( not ( = ?auto_1410861 ?auto_1410866 ) ) ( not ( = ?auto_1410861 ?auto_1410867 ) ) ( not ( = ?auto_1410861 ?auto_1410868 ) ) ( not ( = ?auto_1410861 ?auto_1410869 ) ) ( not ( = ?auto_1410861 ?auto_1410870 ) ) ( not ( = ?auto_1410860 ?auto_1410862 ) ) ( not ( = ?auto_1410860 ?auto_1410863 ) ) ( not ( = ?auto_1410860 ?auto_1410864 ) ) ( not ( = ?auto_1410860 ?auto_1410865 ) ) ( not ( = ?auto_1410860 ?auto_1410866 ) ) ( not ( = ?auto_1410860 ?auto_1410867 ) ) ( not ( = ?auto_1410860 ?auto_1410868 ) ) ( not ( = ?auto_1410860 ?auto_1410869 ) ) ( not ( = ?auto_1410860 ?auto_1410870 ) ) ( not ( = ?auto_1410862 ?auto_1410863 ) ) ( not ( = ?auto_1410862 ?auto_1410864 ) ) ( not ( = ?auto_1410862 ?auto_1410865 ) ) ( not ( = ?auto_1410862 ?auto_1410866 ) ) ( not ( = ?auto_1410862 ?auto_1410867 ) ) ( not ( = ?auto_1410862 ?auto_1410868 ) ) ( not ( = ?auto_1410862 ?auto_1410869 ) ) ( not ( = ?auto_1410862 ?auto_1410870 ) ) ( not ( = ?auto_1410863 ?auto_1410864 ) ) ( not ( = ?auto_1410863 ?auto_1410865 ) ) ( not ( = ?auto_1410863 ?auto_1410866 ) ) ( not ( = ?auto_1410863 ?auto_1410867 ) ) ( not ( = ?auto_1410863 ?auto_1410868 ) ) ( not ( = ?auto_1410863 ?auto_1410869 ) ) ( not ( = ?auto_1410863 ?auto_1410870 ) ) ( not ( = ?auto_1410864 ?auto_1410865 ) ) ( not ( = ?auto_1410864 ?auto_1410866 ) ) ( not ( = ?auto_1410864 ?auto_1410867 ) ) ( not ( = ?auto_1410864 ?auto_1410868 ) ) ( not ( = ?auto_1410864 ?auto_1410869 ) ) ( not ( = ?auto_1410864 ?auto_1410870 ) ) ( not ( = ?auto_1410865 ?auto_1410866 ) ) ( not ( = ?auto_1410865 ?auto_1410867 ) ) ( not ( = ?auto_1410865 ?auto_1410868 ) ) ( not ( = ?auto_1410865 ?auto_1410869 ) ) ( not ( = ?auto_1410865 ?auto_1410870 ) ) ( not ( = ?auto_1410866 ?auto_1410867 ) ) ( not ( = ?auto_1410866 ?auto_1410868 ) ) ( not ( = ?auto_1410866 ?auto_1410869 ) ) ( not ( = ?auto_1410866 ?auto_1410870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1410867 ?auto_1410868 ?auto_1410869 )
      ( MAKE-14CRATE-VERIFY ?auto_1410856 ?auto_1410857 ?auto_1410858 ?auto_1410855 ?auto_1410859 ?auto_1410861 ?auto_1410860 ?auto_1410862 ?auto_1410863 ?auto_1410864 ?auto_1410865 ?auto_1410866 ?auto_1410867 ?auto_1410868 ?auto_1410869 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1411060 - SURFACE
      ?auto_1411061 - SURFACE
      ?auto_1411062 - SURFACE
      ?auto_1411059 - SURFACE
      ?auto_1411063 - SURFACE
      ?auto_1411065 - SURFACE
      ?auto_1411064 - SURFACE
      ?auto_1411066 - SURFACE
      ?auto_1411067 - SURFACE
      ?auto_1411068 - SURFACE
      ?auto_1411069 - SURFACE
      ?auto_1411070 - SURFACE
      ?auto_1411071 - SURFACE
      ?auto_1411072 - SURFACE
      ?auto_1411073 - SURFACE
    )
    :vars
    (
      ?auto_1411075 - HOIST
      ?auto_1411074 - PLACE
      ?auto_1411078 - PLACE
      ?auto_1411076 - HOIST
      ?auto_1411079 - SURFACE
      ?auto_1411077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411075 ?auto_1411074 ) ( IS-CRATE ?auto_1411073 ) ( not ( = ?auto_1411072 ?auto_1411073 ) ) ( not ( = ?auto_1411071 ?auto_1411072 ) ) ( not ( = ?auto_1411071 ?auto_1411073 ) ) ( not ( = ?auto_1411078 ?auto_1411074 ) ) ( HOIST-AT ?auto_1411076 ?auto_1411078 ) ( not ( = ?auto_1411075 ?auto_1411076 ) ) ( AVAILABLE ?auto_1411076 ) ( SURFACE-AT ?auto_1411073 ?auto_1411078 ) ( ON ?auto_1411073 ?auto_1411079 ) ( CLEAR ?auto_1411073 ) ( not ( = ?auto_1411072 ?auto_1411079 ) ) ( not ( = ?auto_1411073 ?auto_1411079 ) ) ( not ( = ?auto_1411071 ?auto_1411079 ) ) ( TRUCK-AT ?auto_1411077 ?auto_1411074 ) ( SURFACE-AT ?auto_1411071 ?auto_1411074 ) ( CLEAR ?auto_1411071 ) ( IS-CRATE ?auto_1411072 ) ( AVAILABLE ?auto_1411075 ) ( IN ?auto_1411072 ?auto_1411077 ) ( ON ?auto_1411061 ?auto_1411060 ) ( ON ?auto_1411062 ?auto_1411061 ) ( ON ?auto_1411059 ?auto_1411062 ) ( ON ?auto_1411063 ?auto_1411059 ) ( ON ?auto_1411065 ?auto_1411063 ) ( ON ?auto_1411064 ?auto_1411065 ) ( ON ?auto_1411066 ?auto_1411064 ) ( ON ?auto_1411067 ?auto_1411066 ) ( ON ?auto_1411068 ?auto_1411067 ) ( ON ?auto_1411069 ?auto_1411068 ) ( ON ?auto_1411070 ?auto_1411069 ) ( ON ?auto_1411071 ?auto_1411070 ) ( not ( = ?auto_1411060 ?auto_1411061 ) ) ( not ( = ?auto_1411060 ?auto_1411062 ) ) ( not ( = ?auto_1411060 ?auto_1411059 ) ) ( not ( = ?auto_1411060 ?auto_1411063 ) ) ( not ( = ?auto_1411060 ?auto_1411065 ) ) ( not ( = ?auto_1411060 ?auto_1411064 ) ) ( not ( = ?auto_1411060 ?auto_1411066 ) ) ( not ( = ?auto_1411060 ?auto_1411067 ) ) ( not ( = ?auto_1411060 ?auto_1411068 ) ) ( not ( = ?auto_1411060 ?auto_1411069 ) ) ( not ( = ?auto_1411060 ?auto_1411070 ) ) ( not ( = ?auto_1411060 ?auto_1411071 ) ) ( not ( = ?auto_1411060 ?auto_1411072 ) ) ( not ( = ?auto_1411060 ?auto_1411073 ) ) ( not ( = ?auto_1411060 ?auto_1411079 ) ) ( not ( = ?auto_1411061 ?auto_1411062 ) ) ( not ( = ?auto_1411061 ?auto_1411059 ) ) ( not ( = ?auto_1411061 ?auto_1411063 ) ) ( not ( = ?auto_1411061 ?auto_1411065 ) ) ( not ( = ?auto_1411061 ?auto_1411064 ) ) ( not ( = ?auto_1411061 ?auto_1411066 ) ) ( not ( = ?auto_1411061 ?auto_1411067 ) ) ( not ( = ?auto_1411061 ?auto_1411068 ) ) ( not ( = ?auto_1411061 ?auto_1411069 ) ) ( not ( = ?auto_1411061 ?auto_1411070 ) ) ( not ( = ?auto_1411061 ?auto_1411071 ) ) ( not ( = ?auto_1411061 ?auto_1411072 ) ) ( not ( = ?auto_1411061 ?auto_1411073 ) ) ( not ( = ?auto_1411061 ?auto_1411079 ) ) ( not ( = ?auto_1411062 ?auto_1411059 ) ) ( not ( = ?auto_1411062 ?auto_1411063 ) ) ( not ( = ?auto_1411062 ?auto_1411065 ) ) ( not ( = ?auto_1411062 ?auto_1411064 ) ) ( not ( = ?auto_1411062 ?auto_1411066 ) ) ( not ( = ?auto_1411062 ?auto_1411067 ) ) ( not ( = ?auto_1411062 ?auto_1411068 ) ) ( not ( = ?auto_1411062 ?auto_1411069 ) ) ( not ( = ?auto_1411062 ?auto_1411070 ) ) ( not ( = ?auto_1411062 ?auto_1411071 ) ) ( not ( = ?auto_1411062 ?auto_1411072 ) ) ( not ( = ?auto_1411062 ?auto_1411073 ) ) ( not ( = ?auto_1411062 ?auto_1411079 ) ) ( not ( = ?auto_1411059 ?auto_1411063 ) ) ( not ( = ?auto_1411059 ?auto_1411065 ) ) ( not ( = ?auto_1411059 ?auto_1411064 ) ) ( not ( = ?auto_1411059 ?auto_1411066 ) ) ( not ( = ?auto_1411059 ?auto_1411067 ) ) ( not ( = ?auto_1411059 ?auto_1411068 ) ) ( not ( = ?auto_1411059 ?auto_1411069 ) ) ( not ( = ?auto_1411059 ?auto_1411070 ) ) ( not ( = ?auto_1411059 ?auto_1411071 ) ) ( not ( = ?auto_1411059 ?auto_1411072 ) ) ( not ( = ?auto_1411059 ?auto_1411073 ) ) ( not ( = ?auto_1411059 ?auto_1411079 ) ) ( not ( = ?auto_1411063 ?auto_1411065 ) ) ( not ( = ?auto_1411063 ?auto_1411064 ) ) ( not ( = ?auto_1411063 ?auto_1411066 ) ) ( not ( = ?auto_1411063 ?auto_1411067 ) ) ( not ( = ?auto_1411063 ?auto_1411068 ) ) ( not ( = ?auto_1411063 ?auto_1411069 ) ) ( not ( = ?auto_1411063 ?auto_1411070 ) ) ( not ( = ?auto_1411063 ?auto_1411071 ) ) ( not ( = ?auto_1411063 ?auto_1411072 ) ) ( not ( = ?auto_1411063 ?auto_1411073 ) ) ( not ( = ?auto_1411063 ?auto_1411079 ) ) ( not ( = ?auto_1411065 ?auto_1411064 ) ) ( not ( = ?auto_1411065 ?auto_1411066 ) ) ( not ( = ?auto_1411065 ?auto_1411067 ) ) ( not ( = ?auto_1411065 ?auto_1411068 ) ) ( not ( = ?auto_1411065 ?auto_1411069 ) ) ( not ( = ?auto_1411065 ?auto_1411070 ) ) ( not ( = ?auto_1411065 ?auto_1411071 ) ) ( not ( = ?auto_1411065 ?auto_1411072 ) ) ( not ( = ?auto_1411065 ?auto_1411073 ) ) ( not ( = ?auto_1411065 ?auto_1411079 ) ) ( not ( = ?auto_1411064 ?auto_1411066 ) ) ( not ( = ?auto_1411064 ?auto_1411067 ) ) ( not ( = ?auto_1411064 ?auto_1411068 ) ) ( not ( = ?auto_1411064 ?auto_1411069 ) ) ( not ( = ?auto_1411064 ?auto_1411070 ) ) ( not ( = ?auto_1411064 ?auto_1411071 ) ) ( not ( = ?auto_1411064 ?auto_1411072 ) ) ( not ( = ?auto_1411064 ?auto_1411073 ) ) ( not ( = ?auto_1411064 ?auto_1411079 ) ) ( not ( = ?auto_1411066 ?auto_1411067 ) ) ( not ( = ?auto_1411066 ?auto_1411068 ) ) ( not ( = ?auto_1411066 ?auto_1411069 ) ) ( not ( = ?auto_1411066 ?auto_1411070 ) ) ( not ( = ?auto_1411066 ?auto_1411071 ) ) ( not ( = ?auto_1411066 ?auto_1411072 ) ) ( not ( = ?auto_1411066 ?auto_1411073 ) ) ( not ( = ?auto_1411066 ?auto_1411079 ) ) ( not ( = ?auto_1411067 ?auto_1411068 ) ) ( not ( = ?auto_1411067 ?auto_1411069 ) ) ( not ( = ?auto_1411067 ?auto_1411070 ) ) ( not ( = ?auto_1411067 ?auto_1411071 ) ) ( not ( = ?auto_1411067 ?auto_1411072 ) ) ( not ( = ?auto_1411067 ?auto_1411073 ) ) ( not ( = ?auto_1411067 ?auto_1411079 ) ) ( not ( = ?auto_1411068 ?auto_1411069 ) ) ( not ( = ?auto_1411068 ?auto_1411070 ) ) ( not ( = ?auto_1411068 ?auto_1411071 ) ) ( not ( = ?auto_1411068 ?auto_1411072 ) ) ( not ( = ?auto_1411068 ?auto_1411073 ) ) ( not ( = ?auto_1411068 ?auto_1411079 ) ) ( not ( = ?auto_1411069 ?auto_1411070 ) ) ( not ( = ?auto_1411069 ?auto_1411071 ) ) ( not ( = ?auto_1411069 ?auto_1411072 ) ) ( not ( = ?auto_1411069 ?auto_1411073 ) ) ( not ( = ?auto_1411069 ?auto_1411079 ) ) ( not ( = ?auto_1411070 ?auto_1411071 ) ) ( not ( = ?auto_1411070 ?auto_1411072 ) ) ( not ( = ?auto_1411070 ?auto_1411073 ) ) ( not ( = ?auto_1411070 ?auto_1411079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411071 ?auto_1411072 ?auto_1411073 )
      ( MAKE-14CRATE-VERIFY ?auto_1411060 ?auto_1411061 ?auto_1411062 ?auto_1411059 ?auto_1411063 ?auto_1411065 ?auto_1411064 ?auto_1411066 ?auto_1411067 ?auto_1411068 ?auto_1411069 ?auto_1411070 ?auto_1411071 ?auto_1411072 ?auto_1411073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1411080 - SURFACE
      ?auto_1411081 - SURFACE
    )
    :vars
    (
      ?auto_1411083 - HOIST
      ?auto_1411082 - PLACE
      ?auto_1411084 - SURFACE
      ?auto_1411087 - PLACE
      ?auto_1411085 - HOIST
      ?auto_1411088 - SURFACE
      ?auto_1411086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411083 ?auto_1411082 ) ( IS-CRATE ?auto_1411081 ) ( not ( = ?auto_1411080 ?auto_1411081 ) ) ( not ( = ?auto_1411084 ?auto_1411080 ) ) ( not ( = ?auto_1411084 ?auto_1411081 ) ) ( not ( = ?auto_1411087 ?auto_1411082 ) ) ( HOIST-AT ?auto_1411085 ?auto_1411087 ) ( not ( = ?auto_1411083 ?auto_1411085 ) ) ( AVAILABLE ?auto_1411085 ) ( SURFACE-AT ?auto_1411081 ?auto_1411087 ) ( ON ?auto_1411081 ?auto_1411088 ) ( CLEAR ?auto_1411081 ) ( not ( = ?auto_1411080 ?auto_1411088 ) ) ( not ( = ?auto_1411081 ?auto_1411088 ) ) ( not ( = ?auto_1411084 ?auto_1411088 ) ) ( SURFACE-AT ?auto_1411084 ?auto_1411082 ) ( CLEAR ?auto_1411084 ) ( IS-CRATE ?auto_1411080 ) ( AVAILABLE ?auto_1411083 ) ( IN ?auto_1411080 ?auto_1411086 ) ( TRUCK-AT ?auto_1411086 ?auto_1411087 ) )
    :subtasks
    ( ( !DRIVE ?auto_1411086 ?auto_1411087 ?auto_1411082 )
      ( MAKE-2CRATE ?auto_1411084 ?auto_1411080 ?auto_1411081 )
      ( MAKE-1CRATE-VERIFY ?auto_1411080 ?auto_1411081 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1411089 - SURFACE
      ?auto_1411090 - SURFACE
      ?auto_1411091 - SURFACE
    )
    :vars
    (
      ?auto_1411096 - HOIST
      ?auto_1411092 - PLACE
      ?auto_1411097 - PLACE
      ?auto_1411094 - HOIST
      ?auto_1411093 - SURFACE
      ?auto_1411095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411096 ?auto_1411092 ) ( IS-CRATE ?auto_1411091 ) ( not ( = ?auto_1411090 ?auto_1411091 ) ) ( not ( = ?auto_1411089 ?auto_1411090 ) ) ( not ( = ?auto_1411089 ?auto_1411091 ) ) ( not ( = ?auto_1411097 ?auto_1411092 ) ) ( HOIST-AT ?auto_1411094 ?auto_1411097 ) ( not ( = ?auto_1411096 ?auto_1411094 ) ) ( AVAILABLE ?auto_1411094 ) ( SURFACE-AT ?auto_1411091 ?auto_1411097 ) ( ON ?auto_1411091 ?auto_1411093 ) ( CLEAR ?auto_1411091 ) ( not ( = ?auto_1411090 ?auto_1411093 ) ) ( not ( = ?auto_1411091 ?auto_1411093 ) ) ( not ( = ?auto_1411089 ?auto_1411093 ) ) ( SURFACE-AT ?auto_1411089 ?auto_1411092 ) ( CLEAR ?auto_1411089 ) ( IS-CRATE ?auto_1411090 ) ( AVAILABLE ?auto_1411096 ) ( IN ?auto_1411090 ?auto_1411095 ) ( TRUCK-AT ?auto_1411095 ?auto_1411097 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1411090 ?auto_1411091 )
      ( MAKE-2CRATE-VERIFY ?auto_1411089 ?auto_1411090 ?auto_1411091 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1411099 - SURFACE
      ?auto_1411100 - SURFACE
      ?auto_1411101 - SURFACE
      ?auto_1411098 - SURFACE
    )
    :vars
    (
      ?auto_1411106 - HOIST
      ?auto_1411103 - PLACE
      ?auto_1411107 - PLACE
      ?auto_1411105 - HOIST
      ?auto_1411102 - SURFACE
      ?auto_1411104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411106 ?auto_1411103 ) ( IS-CRATE ?auto_1411098 ) ( not ( = ?auto_1411101 ?auto_1411098 ) ) ( not ( = ?auto_1411100 ?auto_1411101 ) ) ( not ( = ?auto_1411100 ?auto_1411098 ) ) ( not ( = ?auto_1411107 ?auto_1411103 ) ) ( HOIST-AT ?auto_1411105 ?auto_1411107 ) ( not ( = ?auto_1411106 ?auto_1411105 ) ) ( AVAILABLE ?auto_1411105 ) ( SURFACE-AT ?auto_1411098 ?auto_1411107 ) ( ON ?auto_1411098 ?auto_1411102 ) ( CLEAR ?auto_1411098 ) ( not ( = ?auto_1411101 ?auto_1411102 ) ) ( not ( = ?auto_1411098 ?auto_1411102 ) ) ( not ( = ?auto_1411100 ?auto_1411102 ) ) ( SURFACE-AT ?auto_1411100 ?auto_1411103 ) ( CLEAR ?auto_1411100 ) ( IS-CRATE ?auto_1411101 ) ( AVAILABLE ?auto_1411106 ) ( IN ?auto_1411101 ?auto_1411104 ) ( TRUCK-AT ?auto_1411104 ?auto_1411107 ) ( ON ?auto_1411100 ?auto_1411099 ) ( not ( = ?auto_1411099 ?auto_1411100 ) ) ( not ( = ?auto_1411099 ?auto_1411101 ) ) ( not ( = ?auto_1411099 ?auto_1411098 ) ) ( not ( = ?auto_1411099 ?auto_1411102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411100 ?auto_1411101 ?auto_1411098 )
      ( MAKE-3CRATE-VERIFY ?auto_1411099 ?auto_1411100 ?auto_1411101 ?auto_1411098 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1411109 - SURFACE
      ?auto_1411110 - SURFACE
      ?auto_1411111 - SURFACE
      ?auto_1411108 - SURFACE
      ?auto_1411112 - SURFACE
    )
    :vars
    (
      ?auto_1411117 - HOIST
      ?auto_1411114 - PLACE
      ?auto_1411118 - PLACE
      ?auto_1411116 - HOIST
      ?auto_1411113 - SURFACE
      ?auto_1411115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411117 ?auto_1411114 ) ( IS-CRATE ?auto_1411112 ) ( not ( = ?auto_1411108 ?auto_1411112 ) ) ( not ( = ?auto_1411111 ?auto_1411108 ) ) ( not ( = ?auto_1411111 ?auto_1411112 ) ) ( not ( = ?auto_1411118 ?auto_1411114 ) ) ( HOIST-AT ?auto_1411116 ?auto_1411118 ) ( not ( = ?auto_1411117 ?auto_1411116 ) ) ( AVAILABLE ?auto_1411116 ) ( SURFACE-AT ?auto_1411112 ?auto_1411118 ) ( ON ?auto_1411112 ?auto_1411113 ) ( CLEAR ?auto_1411112 ) ( not ( = ?auto_1411108 ?auto_1411113 ) ) ( not ( = ?auto_1411112 ?auto_1411113 ) ) ( not ( = ?auto_1411111 ?auto_1411113 ) ) ( SURFACE-AT ?auto_1411111 ?auto_1411114 ) ( CLEAR ?auto_1411111 ) ( IS-CRATE ?auto_1411108 ) ( AVAILABLE ?auto_1411117 ) ( IN ?auto_1411108 ?auto_1411115 ) ( TRUCK-AT ?auto_1411115 ?auto_1411118 ) ( ON ?auto_1411110 ?auto_1411109 ) ( ON ?auto_1411111 ?auto_1411110 ) ( not ( = ?auto_1411109 ?auto_1411110 ) ) ( not ( = ?auto_1411109 ?auto_1411111 ) ) ( not ( = ?auto_1411109 ?auto_1411108 ) ) ( not ( = ?auto_1411109 ?auto_1411112 ) ) ( not ( = ?auto_1411109 ?auto_1411113 ) ) ( not ( = ?auto_1411110 ?auto_1411111 ) ) ( not ( = ?auto_1411110 ?auto_1411108 ) ) ( not ( = ?auto_1411110 ?auto_1411112 ) ) ( not ( = ?auto_1411110 ?auto_1411113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411111 ?auto_1411108 ?auto_1411112 )
      ( MAKE-4CRATE-VERIFY ?auto_1411109 ?auto_1411110 ?auto_1411111 ?auto_1411108 ?auto_1411112 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1411120 - SURFACE
      ?auto_1411121 - SURFACE
      ?auto_1411122 - SURFACE
      ?auto_1411119 - SURFACE
      ?auto_1411123 - SURFACE
      ?auto_1411124 - SURFACE
    )
    :vars
    (
      ?auto_1411129 - HOIST
      ?auto_1411126 - PLACE
      ?auto_1411130 - PLACE
      ?auto_1411128 - HOIST
      ?auto_1411125 - SURFACE
      ?auto_1411127 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411129 ?auto_1411126 ) ( IS-CRATE ?auto_1411124 ) ( not ( = ?auto_1411123 ?auto_1411124 ) ) ( not ( = ?auto_1411119 ?auto_1411123 ) ) ( not ( = ?auto_1411119 ?auto_1411124 ) ) ( not ( = ?auto_1411130 ?auto_1411126 ) ) ( HOIST-AT ?auto_1411128 ?auto_1411130 ) ( not ( = ?auto_1411129 ?auto_1411128 ) ) ( AVAILABLE ?auto_1411128 ) ( SURFACE-AT ?auto_1411124 ?auto_1411130 ) ( ON ?auto_1411124 ?auto_1411125 ) ( CLEAR ?auto_1411124 ) ( not ( = ?auto_1411123 ?auto_1411125 ) ) ( not ( = ?auto_1411124 ?auto_1411125 ) ) ( not ( = ?auto_1411119 ?auto_1411125 ) ) ( SURFACE-AT ?auto_1411119 ?auto_1411126 ) ( CLEAR ?auto_1411119 ) ( IS-CRATE ?auto_1411123 ) ( AVAILABLE ?auto_1411129 ) ( IN ?auto_1411123 ?auto_1411127 ) ( TRUCK-AT ?auto_1411127 ?auto_1411130 ) ( ON ?auto_1411121 ?auto_1411120 ) ( ON ?auto_1411122 ?auto_1411121 ) ( ON ?auto_1411119 ?auto_1411122 ) ( not ( = ?auto_1411120 ?auto_1411121 ) ) ( not ( = ?auto_1411120 ?auto_1411122 ) ) ( not ( = ?auto_1411120 ?auto_1411119 ) ) ( not ( = ?auto_1411120 ?auto_1411123 ) ) ( not ( = ?auto_1411120 ?auto_1411124 ) ) ( not ( = ?auto_1411120 ?auto_1411125 ) ) ( not ( = ?auto_1411121 ?auto_1411122 ) ) ( not ( = ?auto_1411121 ?auto_1411119 ) ) ( not ( = ?auto_1411121 ?auto_1411123 ) ) ( not ( = ?auto_1411121 ?auto_1411124 ) ) ( not ( = ?auto_1411121 ?auto_1411125 ) ) ( not ( = ?auto_1411122 ?auto_1411119 ) ) ( not ( = ?auto_1411122 ?auto_1411123 ) ) ( not ( = ?auto_1411122 ?auto_1411124 ) ) ( not ( = ?auto_1411122 ?auto_1411125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411119 ?auto_1411123 ?auto_1411124 )
      ( MAKE-5CRATE-VERIFY ?auto_1411120 ?auto_1411121 ?auto_1411122 ?auto_1411119 ?auto_1411123 ?auto_1411124 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1411132 - SURFACE
      ?auto_1411133 - SURFACE
      ?auto_1411134 - SURFACE
      ?auto_1411131 - SURFACE
      ?auto_1411135 - SURFACE
      ?auto_1411137 - SURFACE
      ?auto_1411136 - SURFACE
    )
    :vars
    (
      ?auto_1411142 - HOIST
      ?auto_1411139 - PLACE
      ?auto_1411143 - PLACE
      ?auto_1411141 - HOIST
      ?auto_1411138 - SURFACE
      ?auto_1411140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411142 ?auto_1411139 ) ( IS-CRATE ?auto_1411136 ) ( not ( = ?auto_1411137 ?auto_1411136 ) ) ( not ( = ?auto_1411135 ?auto_1411137 ) ) ( not ( = ?auto_1411135 ?auto_1411136 ) ) ( not ( = ?auto_1411143 ?auto_1411139 ) ) ( HOIST-AT ?auto_1411141 ?auto_1411143 ) ( not ( = ?auto_1411142 ?auto_1411141 ) ) ( AVAILABLE ?auto_1411141 ) ( SURFACE-AT ?auto_1411136 ?auto_1411143 ) ( ON ?auto_1411136 ?auto_1411138 ) ( CLEAR ?auto_1411136 ) ( not ( = ?auto_1411137 ?auto_1411138 ) ) ( not ( = ?auto_1411136 ?auto_1411138 ) ) ( not ( = ?auto_1411135 ?auto_1411138 ) ) ( SURFACE-AT ?auto_1411135 ?auto_1411139 ) ( CLEAR ?auto_1411135 ) ( IS-CRATE ?auto_1411137 ) ( AVAILABLE ?auto_1411142 ) ( IN ?auto_1411137 ?auto_1411140 ) ( TRUCK-AT ?auto_1411140 ?auto_1411143 ) ( ON ?auto_1411133 ?auto_1411132 ) ( ON ?auto_1411134 ?auto_1411133 ) ( ON ?auto_1411131 ?auto_1411134 ) ( ON ?auto_1411135 ?auto_1411131 ) ( not ( = ?auto_1411132 ?auto_1411133 ) ) ( not ( = ?auto_1411132 ?auto_1411134 ) ) ( not ( = ?auto_1411132 ?auto_1411131 ) ) ( not ( = ?auto_1411132 ?auto_1411135 ) ) ( not ( = ?auto_1411132 ?auto_1411137 ) ) ( not ( = ?auto_1411132 ?auto_1411136 ) ) ( not ( = ?auto_1411132 ?auto_1411138 ) ) ( not ( = ?auto_1411133 ?auto_1411134 ) ) ( not ( = ?auto_1411133 ?auto_1411131 ) ) ( not ( = ?auto_1411133 ?auto_1411135 ) ) ( not ( = ?auto_1411133 ?auto_1411137 ) ) ( not ( = ?auto_1411133 ?auto_1411136 ) ) ( not ( = ?auto_1411133 ?auto_1411138 ) ) ( not ( = ?auto_1411134 ?auto_1411131 ) ) ( not ( = ?auto_1411134 ?auto_1411135 ) ) ( not ( = ?auto_1411134 ?auto_1411137 ) ) ( not ( = ?auto_1411134 ?auto_1411136 ) ) ( not ( = ?auto_1411134 ?auto_1411138 ) ) ( not ( = ?auto_1411131 ?auto_1411135 ) ) ( not ( = ?auto_1411131 ?auto_1411137 ) ) ( not ( = ?auto_1411131 ?auto_1411136 ) ) ( not ( = ?auto_1411131 ?auto_1411138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411135 ?auto_1411137 ?auto_1411136 )
      ( MAKE-6CRATE-VERIFY ?auto_1411132 ?auto_1411133 ?auto_1411134 ?auto_1411131 ?auto_1411135 ?auto_1411137 ?auto_1411136 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1411145 - SURFACE
      ?auto_1411146 - SURFACE
      ?auto_1411147 - SURFACE
      ?auto_1411144 - SURFACE
      ?auto_1411148 - SURFACE
      ?auto_1411150 - SURFACE
      ?auto_1411149 - SURFACE
      ?auto_1411151 - SURFACE
    )
    :vars
    (
      ?auto_1411156 - HOIST
      ?auto_1411153 - PLACE
      ?auto_1411157 - PLACE
      ?auto_1411155 - HOIST
      ?auto_1411152 - SURFACE
      ?auto_1411154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411156 ?auto_1411153 ) ( IS-CRATE ?auto_1411151 ) ( not ( = ?auto_1411149 ?auto_1411151 ) ) ( not ( = ?auto_1411150 ?auto_1411149 ) ) ( not ( = ?auto_1411150 ?auto_1411151 ) ) ( not ( = ?auto_1411157 ?auto_1411153 ) ) ( HOIST-AT ?auto_1411155 ?auto_1411157 ) ( not ( = ?auto_1411156 ?auto_1411155 ) ) ( AVAILABLE ?auto_1411155 ) ( SURFACE-AT ?auto_1411151 ?auto_1411157 ) ( ON ?auto_1411151 ?auto_1411152 ) ( CLEAR ?auto_1411151 ) ( not ( = ?auto_1411149 ?auto_1411152 ) ) ( not ( = ?auto_1411151 ?auto_1411152 ) ) ( not ( = ?auto_1411150 ?auto_1411152 ) ) ( SURFACE-AT ?auto_1411150 ?auto_1411153 ) ( CLEAR ?auto_1411150 ) ( IS-CRATE ?auto_1411149 ) ( AVAILABLE ?auto_1411156 ) ( IN ?auto_1411149 ?auto_1411154 ) ( TRUCK-AT ?auto_1411154 ?auto_1411157 ) ( ON ?auto_1411146 ?auto_1411145 ) ( ON ?auto_1411147 ?auto_1411146 ) ( ON ?auto_1411144 ?auto_1411147 ) ( ON ?auto_1411148 ?auto_1411144 ) ( ON ?auto_1411150 ?auto_1411148 ) ( not ( = ?auto_1411145 ?auto_1411146 ) ) ( not ( = ?auto_1411145 ?auto_1411147 ) ) ( not ( = ?auto_1411145 ?auto_1411144 ) ) ( not ( = ?auto_1411145 ?auto_1411148 ) ) ( not ( = ?auto_1411145 ?auto_1411150 ) ) ( not ( = ?auto_1411145 ?auto_1411149 ) ) ( not ( = ?auto_1411145 ?auto_1411151 ) ) ( not ( = ?auto_1411145 ?auto_1411152 ) ) ( not ( = ?auto_1411146 ?auto_1411147 ) ) ( not ( = ?auto_1411146 ?auto_1411144 ) ) ( not ( = ?auto_1411146 ?auto_1411148 ) ) ( not ( = ?auto_1411146 ?auto_1411150 ) ) ( not ( = ?auto_1411146 ?auto_1411149 ) ) ( not ( = ?auto_1411146 ?auto_1411151 ) ) ( not ( = ?auto_1411146 ?auto_1411152 ) ) ( not ( = ?auto_1411147 ?auto_1411144 ) ) ( not ( = ?auto_1411147 ?auto_1411148 ) ) ( not ( = ?auto_1411147 ?auto_1411150 ) ) ( not ( = ?auto_1411147 ?auto_1411149 ) ) ( not ( = ?auto_1411147 ?auto_1411151 ) ) ( not ( = ?auto_1411147 ?auto_1411152 ) ) ( not ( = ?auto_1411144 ?auto_1411148 ) ) ( not ( = ?auto_1411144 ?auto_1411150 ) ) ( not ( = ?auto_1411144 ?auto_1411149 ) ) ( not ( = ?auto_1411144 ?auto_1411151 ) ) ( not ( = ?auto_1411144 ?auto_1411152 ) ) ( not ( = ?auto_1411148 ?auto_1411150 ) ) ( not ( = ?auto_1411148 ?auto_1411149 ) ) ( not ( = ?auto_1411148 ?auto_1411151 ) ) ( not ( = ?auto_1411148 ?auto_1411152 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411150 ?auto_1411149 ?auto_1411151 )
      ( MAKE-7CRATE-VERIFY ?auto_1411145 ?auto_1411146 ?auto_1411147 ?auto_1411144 ?auto_1411148 ?auto_1411150 ?auto_1411149 ?auto_1411151 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1411159 - SURFACE
      ?auto_1411160 - SURFACE
      ?auto_1411161 - SURFACE
      ?auto_1411158 - SURFACE
      ?auto_1411162 - SURFACE
      ?auto_1411164 - SURFACE
      ?auto_1411163 - SURFACE
      ?auto_1411165 - SURFACE
      ?auto_1411166 - SURFACE
    )
    :vars
    (
      ?auto_1411171 - HOIST
      ?auto_1411168 - PLACE
      ?auto_1411172 - PLACE
      ?auto_1411170 - HOIST
      ?auto_1411167 - SURFACE
      ?auto_1411169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411171 ?auto_1411168 ) ( IS-CRATE ?auto_1411166 ) ( not ( = ?auto_1411165 ?auto_1411166 ) ) ( not ( = ?auto_1411163 ?auto_1411165 ) ) ( not ( = ?auto_1411163 ?auto_1411166 ) ) ( not ( = ?auto_1411172 ?auto_1411168 ) ) ( HOIST-AT ?auto_1411170 ?auto_1411172 ) ( not ( = ?auto_1411171 ?auto_1411170 ) ) ( AVAILABLE ?auto_1411170 ) ( SURFACE-AT ?auto_1411166 ?auto_1411172 ) ( ON ?auto_1411166 ?auto_1411167 ) ( CLEAR ?auto_1411166 ) ( not ( = ?auto_1411165 ?auto_1411167 ) ) ( not ( = ?auto_1411166 ?auto_1411167 ) ) ( not ( = ?auto_1411163 ?auto_1411167 ) ) ( SURFACE-AT ?auto_1411163 ?auto_1411168 ) ( CLEAR ?auto_1411163 ) ( IS-CRATE ?auto_1411165 ) ( AVAILABLE ?auto_1411171 ) ( IN ?auto_1411165 ?auto_1411169 ) ( TRUCK-AT ?auto_1411169 ?auto_1411172 ) ( ON ?auto_1411160 ?auto_1411159 ) ( ON ?auto_1411161 ?auto_1411160 ) ( ON ?auto_1411158 ?auto_1411161 ) ( ON ?auto_1411162 ?auto_1411158 ) ( ON ?auto_1411164 ?auto_1411162 ) ( ON ?auto_1411163 ?auto_1411164 ) ( not ( = ?auto_1411159 ?auto_1411160 ) ) ( not ( = ?auto_1411159 ?auto_1411161 ) ) ( not ( = ?auto_1411159 ?auto_1411158 ) ) ( not ( = ?auto_1411159 ?auto_1411162 ) ) ( not ( = ?auto_1411159 ?auto_1411164 ) ) ( not ( = ?auto_1411159 ?auto_1411163 ) ) ( not ( = ?auto_1411159 ?auto_1411165 ) ) ( not ( = ?auto_1411159 ?auto_1411166 ) ) ( not ( = ?auto_1411159 ?auto_1411167 ) ) ( not ( = ?auto_1411160 ?auto_1411161 ) ) ( not ( = ?auto_1411160 ?auto_1411158 ) ) ( not ( = ?auto_1411160 ?auto_1411162 ) ) ( not ( = ?auto_1411160 ?auto_1411164 ) ) ( not ( = ?auto_1411160 ?auto_1411163 ) ) ( not ( = ?auto_1411160 ?auto_1411165 ) ) ( not ( = ?auto_1411160 ?auto_1411166 ) ) ( not ( = ?auto_1411160 ?auto_1411167 ) ) ( not ( = ?auto_1411161 ?auto_1411158 ) ) ( not ( = ?auto_1411161 ?auto_1411162 ) ) ( not ( = ?auto_1411161 ?auto_1411164 ) ) ( not ( = ?auto_1411161 ?auto_1411163 ) ) ( not ( = ?auto_1411161 ?auto_1411165 ) ) ( not ( = ?auto_1411161 ?auto_1411166 ) ) ( not ( = ?auto_1411161 ?auto_1411167 ) ) ( not ( = ?auto_1411158 ?auto_1411162 ) ) ( not ( = ?auto_1411158 ?auto_1411164 ) ) ( not ( = ?auto_1411158 ?auto_1411163 ) ) ( not ( = ?auto_1411158 ?auto_1411165 ) ) ( not ( = ?auto_1411158 ?auto_1411166 ) ) ( not ( = ?auto_1411158 ?auto_1411167 ) ) ( not ( = ?auto_1411162 ?auto_1411164 ) ) ( not ( = ?auto_1411162 ?auto_1411163 ) ) ( not ( = ?auto_1411162 ?auto_1411165 ) ) ( not ( = ?auto_1411162 ?auto_1411166 ) ) ( not ( = ?auto_1411162 ?auto_1411167 ) ) ( not ( = ?auto_1411164 ?auto_1411163 ) ) ( not ( = ?auto_1411164 ?auto_1411165 ) ) ( not ( = ?auto_1411164 ?auto_1411166 ) ) ( not ( = ?auto_1411164 ?auto_1411167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411163 ?auto_1411165 ?auto_1411166 )
      ( MAKE-8CRATE-VERIFY ?auto_1411159 ?auto_1411160 ?auto_1411161 ?auto_1411158 ?auto_1411162 ?auto_1411164 ?auto_1411163 ?auto_1411165 ?auto_1411166 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1411174 - SURFACE
      ?auto_1411175 - SURFACE
      ?auto_1411176 - SURFACE
      ?auto_1411173 - SURFACE
      ?auto_1411177 - SURFACE
      ?auto_1411179 - SURFACE
      ?auto_1411178 - SURFACE
      ?auto_1411180 - SURFACE
      ?auto_1411181 - SURFACE
      ?auto_1411182 - SURFACE
    )
    :vars
    (
      ?auto_1411187 - HOIST
      ?auto_1411184 - PLACE
      ?auto_1411188 - PLACE
      ?auto_1411186 - HOIST
      ?auto_1411183 - SURFACE
      ?auto_1411185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411187 ?auto_1411184 ) ( IS-CRATE ?auto_1411182 ) ( not ( = ?auto_1411181 ?auto_1411182 ) ) ( not ( = ?auto_1411180 ?auto_1411181 ) ) ( not ( = ?auto_1411180 ?auto_1411182 ) ) ( not ( = ?auto_1411188 ?auto_1411184 ) ) ( HOIST-AT ?auto_1411186 ?auto_1411188 ) ( not ( = ?auto_1411187 ?auto_1411186 ) ) ( AVAILABLE ?auto_1411186 ) ( SURFACE-AT ?auto_1411182 ?auto_1411188 ) ( ON ?auto_1411182 ?auto_1411183 ) ( CLEAR ?auto_1411182 ) ( not ( = ?auto_1411181 ?auto_1411183 ) ) ( not ( = ?auto_1411182 ?auto_1411183 ) ) ( not ( = ?auto_1411180 ?auto_1411183 ) ) ( SURFACE-AT ?auto_1411180 ?auto_1411184 ) ( CLEAR ?auto_1411180 ) ( IS-CRATE ?auto_1411181 ) ( AVAILABLE ?auto_1411187 ) ( IN ?auto_1411181 ?auto_1411185 ) ( TRUCK-AT ?auto_1411185 ?auto_1411188 ) ( ON ?auto_1411175 ?auto_1411174 ) ( ON ?auto_1411176 ?auto_1411175 ) ( ON ?auto_1411173 ?auto_1411176 ) ( ON ?auto_1411177 ?auto_1411173 ) ( ON ?auto_1411179 ?auto_1411177 ) ( ON ?auto_1411178 ?auto_1411179 ) ( ON ?auto_1411180 ?auto_1411178 ) ( not ( = ?auto_1411174 ?auto_1411175 ) ) ( not ( = ?auto_1411174 ?auto_1411176 ) ) ( not ( = ?auto_1411174 ?auto_1411173 ) ) ( not ( = ?auto_1411174 ?auto_1411177 ) ) ( not ( = ?auto_1411174 ?auto_1411179 ) ) ( not ( = ?auto_1411174 ?auto_1411178 ) ) ( not ( = ?auto_1411174 ?auto_1411180 ) ) ( not ( = ?auto_1411174 ?auto_1411181 ) ) ( not ( = ?auto_1411174 ?auto_1411182 ) ) ( not ( = ?auto_1411174 ?auto_1411183 ) ) ( not ( = ?auto_1411175 ?auto_1411176 ) ) ( not ( = ?auto_1411175 ?auto_1411173 ) ) ( not ( = ?auto_1411175 ?auto_1411177 ) ) ( not ( = ?auto_1411175 ?auto_1411179 ) ) ( not ( = ?auto_1411175 ?auto_1411178 ) ) ( not ( = ?auto_1411175 ?auto_1411180 ) ) ( not ( = ?auto_1411175 ?auto_1411181 ) ) ( not ( = ?auto_1411175 ?auto_1411182 ) ) ( not ( = ?auto_1411175 ?auto_1411183 ) ) ( not ( = ?auto_1411176 ?auto_1411173 ) ) ( not ( = ?auto_1411176 ?auto_1411177 ) ) ( not ( = ?auto_1411176 ?auto_1411179 ) ) ( not ( = ?auto_1411176 ?auto_1411178 ) ) ( not ( = ?auto_1411176 ?auto_1411180 ) ) ( not ( = ?auto_1411176 ?auto_1411181 ) ) ( not ( = ?auto_1411176 ?auto_1411182 ) ) ( not ( = ?auto_1411176 ?auto_1411183 ) ) ( not ( = ?auto_1411173 ?auto_1411177 ) ) ( not ( = ?auto_1411173 ?auto_1411179 ) ) ( not ( = ?auto_1411173 ?auto_1411178 ) ) ( not ( = ?auto_1411173 ?auto_1411180 ) ) ( not ( = ?auto_1411173 ?auto_1411181 ) ) ( not ( = ?auto_1411173 ?auto_1411182 ) ) ( not ( = ?auto_1411173 ?auto_1411183 ) ) ( not ( = ?auto_1411177 ?auto_1411179 ) ) ( not ( = ?auto_1411177 ?auto_1411178 ) ) ( not ( = ?auto_1411177 ?auto_1411180 ) ) ( not ( = ?auto_1411177 ?auto_1411181 ) ) ( not ( = ?auto_1411177 ?auto_1411182 ) ) ( not ( = ?auto_1411177 ?auto_1411183 ) ) ( not ( = ?auto_1411179 ?auto_1411178 ) ) ( not ( = ?auto_1411179 ?auto_1411180 ) ) ( not ( = ?auto_1411179 ?auto_1411181 ) ) ( not ( = ?auto_1411179 ?auto_1411182 ) ) ( not ( = ?auto_1411179 ?auto_1411183 ) ) ( not ( = ?auto_1411178 ?auto_1411180 ) ) ( not ( = ?auto_1411178 ?auto_1411181 ) ) ( not ( = ?auto_1411178 ?auto_1411182 ) ) ( not ( = ?auto_1411178 ?auto_1411183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411180 ?auto_1411181 ?auto_1411182 )
      ( MAKE-9CRATE-VERIFY ?auto_1411174 ?auto_1411175 ?auto_1411176 ?auto_1411173 ?auto_1411177 ?auto_1411179 ?auto_1411178 ?auto_1411180 ?auto_1411181 ?auto_1411182 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1411190 - SURFACE
      ?auto_1411191 - SURFACE
      ?auto_1411192 - SURFACE
      ?auto_1411189 - SURFACE
      ?auto_1411193 - SURFACE
      ?auto_1411195 - SURFACE
      ?auto_1411194 - SURFACE
      ?auto_1411196 - SURFACE
      ?auto_1411197 - SURFACE
      ?auto_1411198 - SURFACE
      ?auto_1411199 - SURFACE
    )
    :vars
    (
      ?auto_1411204 - HOIST
      ?auto_1411201 - PLACE
      ?auto_1411205 - PLACE
      ?auto_1411203 - HOIST
      ?auto_1411200 - SURFACE
      ?auto_1411202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411204 ?auto_1411201 ) ( IS-CRATE ?auto_1411199 ) ( not ( = ?auto_1411198 ?auto_1411199 ) ) ( not ( = ?auto_1411197 ?auto_1411198 ) ) ( not ( = ?auto_1411197 ?auto_1411199 ) ) ( not ( = ?auto_1411205 ?auto_1411201 ) ) ( HOIST-AT ?auto_1411203 ?auto_1411205 ) ( not ( = ?auto_1411204 ?auto_1411203 ) ) ( AVAILABLE ?auto_1411203 ) ( SURFACE-AT ?auto_1411199 ?auto_1411205 ) ( ON ?auto_1411199 ?auto_1411200 ) ( CLEAR ?auto_1411199 ) ( not ( = ?auto_1411198 ?auto_1411200 ) ) ( not ( = ?auto_1411199 ?auto_1411200 ) ) ( not ( = ?auto_1411197 ?auto_1411200 ) ) ( SURFACE-AT ?auto_1411197 ?auto_1411201 ) ( CLEAR ?auto_1411197 ) ( IS-CRATE ?auto_1411198 ) ( AVAILABLE ?auto_1411204 ) ( IN ?auto_1411198 ?auto_1411202 ) ( TRUCK-AT ?auto_1411202 ?auto_1411205 ) ( ON ?auto_1411191 ?auto_1411190 ) ( ON ?auto_1411192 ?auto_1411191 ) ( ON ?auto_1411189 ?auto_1411192 ) ( ON ?auto_1411193 ?auto_1411189 ) ( ON ?auto_1411195 ?auto_1411193 ) ( ON ?auto_1411194 ?auto_1411195 ) ( ON ?auto_1411196 ?auto_1411194 ) ( ON ?auto_1411197 ?auto_1411196 ) ( not ( = ?auto_1411190 ?auto_1411191 ) ) ( not ( = ?auto_1411190 ?auto_1411192 ) ) ( not ( = ?auto_1411190 ?auto_1411189 ) ) ( not ( = ?auto_1411190 ?auto_1411193 ) ) ( not ( = ?auto_1411190 ?auto_1411195 ) ) ( not ( = ?auto_1411190 ?auto_1411194 ) ) ( not ( = ?auto_1411190 ?auto_1411196 ) ) ( not ( = ?auto_1411190 ?auto_1411197 ) ) ( not ( = ?auto_1411190 ?auto_1411198 ) ) ( not ( = ?auto_1411190 ?auto_1411199 ) ) ( not ( = ?auto_1411190 ?auto_1411200 ) ) ( not ( = ?auto_1411191 ?auto_1411192 ) ) ( not ( = ?auto_1411191 ?auto_1411189 ) ) ( not ( = ?auto_1411191 ?auto_1411193 ) ) ( not ( = ?auto_1411191 ?auto_1411195 ) ) ( not ( = ?auto_1411191 ?auto_1411194 ) ) ( not ( = ?auto_1411191 ?auto_1411196 ) ) ( not ( = ?auto_1411191 ?auto_1411197 ) ) ( not ( = ?auto_1411191 ?auto_1411198 ) ) ( not ( = ?auto_1411191 ?auto_1411199 ) ) ( not ( = ?auto_1411191 ?auto_1411200 ) ) ( not ( = ?auto_1411192 ?auto_1411189 ) ) ( not ( = ?auto_1411192 ?auto_1411193 ) ) ( not ( = ?auto_1411192 ?auto_1411195 ) ) ( not ( = ?auto_1411192 ?auto_1411194 ) ) ( not ( = ?auto_1411192 ?auto_1411196 ) ) ( not ( = ?auto_1411192 ?auto_1411197 ) ) ( not ( = ?auto_1411192 ?auto_1411198 ) ) ( not ( = ?auto_1411192 ?auto_1411199 ) ) ( not ( = ?auto_1411192 ?auto_1411200 ) ) ( not ( = ?auto_1411189 ?auto_1411193 ) ) ( not ( = ?auto_1411189 ?auto_1411195 ) ) ( not ( = ?auto_1411189 ?auto_1411194 ) ) ( not ( = ?auto_1411189 ?auto_1411196 ) ) ( not ( = ?auto_1411189 ?auto_1411197 ) ) ( not ( = ?auto_1411189 ?auto_1411198 ) ) ( not ( = ?auto_1411189 ?auto_1411199 ) ) ( not ( = ?auto_1411189 ?auto_1411200 ) ) ( not ( = ?auto_1411193 ?auto_1411195 ) ) ( not ( = ?auto_1411193 ?auto_1411194 ) ) ( not ( = ?auto_1411193 ?auto_1411196 ) ) ( not ( = ?auto_1411193 ?auto_1411197 ) ) ( not ( = ?auto_1411193 ?auto_1411198 ) ) ( not ( = ?auto_1411193 ?auto_1411199 ) ) ( not ( = ?auto_1411193 ?auto_1411200 ) ) ( not ( = ?auto_1411195 ?auto_1411194 ) ) ( not ( = ?auto_1411195 ?auto_1411196 ) ) ( not ( = ?auto_1411195 ?auto_1411197 ) ) ( not ( = ?auto_1411195 ?auto_1411198 ) ) ( not ( = ?auto_1411195 ?auto_1411199 ) ) ( not ( = ?auto_1411195 ?auto_1411200 ) ) ( not ( = ?auto_1411194 ?auto_1411196 ) ) ( not ( = ?auto_1411194 ?auto_1411197 ) ) ( not ( = ?auto_1411194 ?auto_1411198 ) ) ( not ( = ?auto_1411194 ?auto_1411199 ) ) ( not ( = ?auto_1411194 ?auto_1411200 ) ) ( not ( = ?auto_1411196 ?auto_1411197 ) ) ( not ( = ?auto_1411196 ?auto_1411198 ) ) ( not ( = ?auto_1411196 ?auto_1411199 ) ) ( not ( = ?auto_1411196 ?auto_1411200 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411197 ?auto_1411198 ?auto_1411199 )
      ( MAKE-10CRATE-VERIFY ?auto_1411190 ?auto_1411191 ?auto_1411192 ?auto_1411189 ?auto_1411193 ?auto_1411195 ?auto_1411194 ?auto_1411196 ?auto_1411197 ?auto_1411198 ?auto_1411199 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1411207 - SURFACE
      ?auto_1411208 - SURFACE
      ?auto_1411209 - SURFACE
      ?auto_1411206 - SURFACE
      ?auto_1411210 - SURFACE
      ?auto_1411212 - SURFACE
      ?auto_1411211 - SURFACE
      ?auto_1411213 - SURFACE
      ?auto_1411214 - SURFACE
      ?auto_1411215 - SURFACE
      ?auto_1411216 - SURFACE
      ?auto_1411217 - SURFACE
    )
    :vars
    (
      ?auto_1411222 - HOIST
      ?auto_1411219 - PLACE
      ?auto_1411223 - PLACE
      ?auto_1411221 - HOIST
      ?auto_1411218 - SURFACE
      ?auto_1411220 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411222 ?auto_1411219 ) ( IS-CRATE ?auto_1411217 ) ( not ( = ?auto_1411216 ?auto_1411217 ) ) ( not ( = ?auto_1411215 ?auto_1411216 ) ) ( not ( = ?auto_1411215 ?auto_1411217 ) ) ( not ( = ?auto_1411223 ?auto_1411219 ) ) ( HOIST-AT ?auto_1411221 ?auto_1411223 ) ( not ( = ?auto_1411222 ?auto_1411221 ) ) ( AVAILABLE ?auto_1411221 ) ( SURFACE-AT ?auto_1411217 ?auto_1411223 ) ( ON ?auto_1411217 ?auto_1411218 ) ( CLEAR ?auto_1411217 ) ( not ( = ?auto_1411216 ?auto_1411218 ) ) ( not ( = ?auto_1411217 ?auto_1411218 ) ) ( not ( = ?auto_1411215 ?auto_1411218 ) ) ( SURFACE-AT ?auto_1411215 ?auto_1411219 ) ( CLEAR ?auto_1411215 ) ( IS-CRATE ?auto_1411216 ) ( AVAILABLE ?auto_1411222 ) ( IN ?auto_1411216 ?auto_1411220 ) ( TRUCK-AT ?auto_1411220 ?auto_1411223 ) ( ON ?auto_1411208 ?auto_1411207 ) ( ON ?auto_1411209 ?auto_1411208 ) ( ON ?auto_1411206 ?auto_1411209 ) ( ON ?auto_1411210 ?auto_1411206 ) ( ON ?auto_1411212 ?auto_1411210 ) ( ON ?auto_1411211 ?auto_1411212 ) ( ON ?auto_1411213 ?auto_1411211 ) ( ON ?auto_1411214 ?auto_1411213 ) ( ON ?auto_1411215 ?auto_1411214 ) ( not ( = ?auto_1411207 ?auto_1411208 ) ) ( not ( = ?auto_1411207 ?auto_1411209 ) ) ( not ( = ?auto_1411207 ?auto_1411206 ) ) ( not ( = ?auto_1411207 ?auto_1411210 ) ) ( not ( = ?auto_1411207 ?auto_1411212 ) ) ( not ( = ?auto_1411207 ?auto_1411211 ) ) ( not ( = ?auto_1411207 ?auto_1411213 ) ) ( not ( = ?auto_1411207 ?auto_1411214 ) ) ( not ( = ?auto_1411207 ?auto_1411215 ) ) ( not ( = ?auto_1411207 ?auto_1411216 ) ) ( not ( = ?auto_1411207 ?auto_1411217 ) ) ( not ( = ?auto_1411207 ?auto_1411218 ) ) ( not ( = ?auto_1411208 ?auto_1411209 ) ) ( not ( = ?auto_1411208 ?auto_1411206 ) ) ( not ( = ?auto_1411208 ?auto_1411210 ) ) ( not ( = ?auto_1411208 ?auto_1411212 ) ) ( not ( = ?auto_1411208 ?auto_1411211 ) ) ( not ( = ?auto_1411208 ?auto_1411213 ) ) ( not ( = ?auto_1411208 ?auto_1411214 ) ) ( not ( = ?auto_1411208 ?auto_1411215 ) ) ( not ( = ?auto_1411208 ?auto_1411216 ) ) ( not ( = ?auto_1411208 ?auto_1411217 ) ) ( not ( = ?auto_1411208 ?auto_1411218 ) ) ( not ( = ?auto_1411209 ?auto_1411206 ) ) ( not ( = ?auto_1411209 ?auto_1411210 ) ) ( not ( = ?auto_1411209 ?auto_1411212 ) ) ( not ( = ?auto_1411209 ?auto_1411211 ) ) ( not ( = ?auto_1411209 ?auto_1411213 ) ) ( not ( = ?auto_1411209 ?auto_1411214 ) ) ( not ( = ?auto_1411209 ?auto_1411215 ) ) ( not ( = ?auto_1411209 ?auto_1411216 ) ) ( not ( = ?auto_1411209 ?auto_1411217 ) ) ( not ( = ?auto_1411209 ?auto_1411218 ) ) ( not ( = ?auto_1411206 ?auto_1411210 ) ) ( not ( = ?auto_1411206 ?auto_1411212 ) ) ( not ( = ?auto_1411206 ?auto_1411211 ) ) ( not ( = ?auto_1411206 ?auto_1411213 ) ) ( not ( = ?auto_1411206 ?auto_1411214 ) ) ( not ( = ?auto_1411206 ?auto_1411215 ) ) ( not ( = ?auto_1411206 ?auto_1411216 ) ) ( not ( = ?auto_1411206 ?auto_1411217 ) ) ( not ( = ?auto_1411206 ?auto_1411218 ) ) ( not ( = ?auto_1411210 ?auto_1411212 ) ) ( not ( = ?auto_1411210 ?auto_1411211 ) ) ( not ( = ?auto_1411210 ?auto_1411213 ) ) ( not ( = ?auto_1411210 ?auto_1411214 ) ) ( not ( = ?auto_1411210 ?auto_1411215 ) ) ( not ( = ?auto_1411210 ?auto_1411216 ) ) ( not ( = ?auto_1411210 ?auto_1411217 ) ) ( not ( = ?auto_1411210 ?auto_1411218 ) ) ( not ( = ?auto_1411212 ?auto_1411211 ) ) ( not ( = ?auto_1411212 ?auto_1411213 ) ) ( not ( = ?auto_1411212 ?auto_1411214 ) ) ( not ( = ?auto_1411212 ?auto_1411215 ) ) ( not ( = ?auto_1411212 ?auto_1411216 ) ) ( not ( = ?auto_1411212 ?auto_1411217 ) ) ( not ( = ?auto_1411212 ?auto_1411218 ) ) ( not ( = ?auto_1411211 ?auto_1411213 ) ) ( not ( = ?auto_1411211 ?auto_1411214 ) ) ( not ( = ?auto_1411211 ?auto_1411215 ) ) ( not ( = ?auto_1411211 ?auto_1411216 ) ) ( not ( = ?auto_1411211 ?auto_1411217 ) ) ( not ( = ?auto_1411211 ?auto_1411218 ) ) ( not ( = ?auto_1411213 ?auto_1411214 ) ) ( not ( = ?auto_1411213 ?auto_1411215 ) ) ( not ( = ?auto_1411213 ?auto_1411216 ) ) ( not ( = ?auto_1411213 ?auto_1411217 ) ) ( not ( = ?auto_1411213 ?auto_1411218 ) ) ( not ( = ?auto_1411214 ?auto_1411215 ) ) ( not ( = ?auto_1411214 ?auto_1411216 ) ) ( not ( = ?auto_1411214 ?auto_1411217 ) ) ( not ( = ?auto_1411214 ?auto_1411218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411215 ?auto_1411216 ?auto_1411217 )
      ( MAKE-11CRATE-VERIFY ?auto_1411207 ?auto_1411208 ?auto_1411209 ?auto_1411206 ?auto_1411210 ?auto_1411212 ?auto_1411211 ?auto_1411213 ?auto_1411214 ?auto_1411215 ?auto_1411216 ?auto_1411217 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1411225 - SURFACE
      ?auto_1411226 - SURFACE
      ?auto_1411227 - SURFACE
      ?auto_1411224 - SURFACE
      ?auto_1411228 - SURFACE
      ?auto_1411230 - SURFACE
      ?auto_1411229 - SURFACE
      ?auto_1411231 - SURFACE
      ?auto_1411232 - SURFACE
      ?auto_1411233 - SURFACE
      ?auto_1411234 - SURFACE
      ?auto_1411235 - SURFACE
      ?auto_1411236 - SURFACE
    )
    :vars
    (
      ?auto_1411241 - HOIST
      ?auto_1411238 - PLACE
      ?auto_1411242 - PLACE
      ?auto_1411240 - HOIST
      ?auto_1411237 - SURFACE
      ?auto_1411239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411241 ?auto_1411238 ) ( IS-CRATE ?auto_1411236 ) ( not ( = ?auto_1411235 ?auto_1411236 ) ) ( not ( = ?auto_1411234 ?auto_1411235 ) ) ( not ( = ?auto_1411234 ?auto_1411236 ) ) ( not ( = ?auto_1411242 ?auto_1411238 ) ) ( HOIST-AT ?auto_1411240 ?auto_1411242 ) ( not ( = ?auto_1411241 ?auto_1411240 ) ) ( AVAILABLE ?auto_1411240 ) ( SURFACE-AT ?auto_1411236 ?auto_1411242 ) ( ON ?auto_1411236 ?auto_1411237 ) ( CLEAR ?auto_1411236 ) ( not ( = ?auto_1411235 ?auto_1411237 ) ) ( not ( = ?auto_1411236 ?auto_1411237 ) ) ( not ( = ?auto_1411234 ?auto_1411237 ) ) ( SURFACE-AT ?auto_1411234 ?auto_1411238 ) ( CLEAR ?auto_1411234 ) ( IS-CRATE ?auto_1411235 ) ( AVAILABLE ?auto_1411241 ) ( IN ?auto_1411235 ?auto_1411239 ) ( TRUCK-AT ?auto_1411239 ?auto_1411242 ) ( ON ?auto_1411226 ?auto_1411225 ) ( ON ?auto_1411227 ?auto_1411226 ) ( ON ?auto_1411224 ?auto_1411227 ) ( ON ?auto_1411228 ?auto_1411224 ) ( ON ?auto_1411230 ?auto_1411228 ) ( ON ?auto_1411229 ?auto_1411230 ) ( ON ?auto_1411231 ?auto_1411229 ) ( ON ?auto_1411232 ?auto_1411231 ) ( ON ?auto_1411233 ?auto_1411232 ) ( ON ?auto_1411234 ?auto_1411233 ) ( not ( = ?auto_1411225 ?auto_1411226 ) ) ( not ( = ?auto_1411225 ?auto_1411227 ) ) ( not ( = ?auto_1411225 ?auto_1411224 ) ) ( not ( = ?auto_1411225 ?auto_1411228 ) ) ( not ( = ?auto_1411225 ?auto_1411230 ) ) ( not ( = ?auto_1411225 ?auto_1411229 ) ) ( not ( = ?auto_1411225 ?auto_1411231 ) ) ( not ( = ?auto_1411225 ?auto_1411232 ) ) ( not ( = ?auto_1411225 ?auto_1411233 ) ) ( not ( = ?auto_1411225 ?auto_1411234 ) ) ( not ( = ?auto_1411225 ?auto_1411235 ) ) ( not ( = ?auto_1411225 ?auto_1411236 ) ) ( not ( = ?auto_1411225 ?auto_1411237 ) ) ( not ( = ?auto_1411226 ?auto_1411227 ) ) ( not ( = ?auto_1411226 ?auto_1411224 ) ) ( not ( = ?auto_1411226 ?auto_1411228 ) ) ( not ( = ?auto_1411226 ?auto_1411230 ) ) ( not ( = ?auto_1411226 ?auto_1411229 ) ) ( not ( = ?auto_1411226 ?auto_1411231 ) ) ( not ( = ?auto_1411226 ?auto_1411232 ) ) ( not ( = ?auto_1411226 ?auto_1411233 ) ) ( not ( = ?auto_1411226 ?auto_1411234 ) ) ( not ( = ?auto_1411226 ?auto_1411235 ) ) ( not ( = ?auto_1411226 ?auto_1411236 ) ) ( not ( = ?auto_1411226 ?auto_1411237 ) ) ( not ( = ?auto_1411227 ?auto_1411224 ) ) ( not ( = ?auto_1411227 ?auto_1411228 ) ) ( not ( = ?auto_1411227 ?auto_1411230 ) ) ( not ( = ?auto_1411227 ?auto_1411229 ) ) ( not ( = ?auto_1411227 ?auto_1411231 ) ) ( not ( = ?auto_1411227 ?auto_1411232 ) ) ( not ( = ?auto_1411227 ?auto_1411233 ) ) ( not ( = ?auto_1411227 ?auto_1411234 ) ) ( not ( = ?auto_1411227 ?auto_1411235 ) ) ( not ( = ?auto_1411227 ?auto_1411236 ) ) ( not ( = ?auto_1411227 ?auto_1411237 ) ) ( not ( = ?auto_1411224 ?auto_1411228 ) ) ( not ( = ?auto_1411224 ?auto_1411230 ) ) ( not ( = ?auto_1411224 ?auto_1411229 ) ) ( not ( = ?auto_1411224 ?auto_1411231 ) ) ( not ( = ?auto_1411224 ?auto_1411232 ) ) ( not ( = ?auto_1411224 ?auto_1411233 ) ) ( not ( = ?auto_1411224 ?auto_1411234 ) ) ( not ( = ?auto_1411224 ?auto_1411235 ) ) ( not ( = ?auto_1411224 ?auto_1411236 ) ) ( not ( = ?auto_1411224 ?auto_1411237 ) ) ( not ( = ?auto_1411228 ?auto_1411230 ) ) ( not ( = ?auto_1411228 ?auto_1411229 ) ) ( not ( = ?auto_1411228 ?auto_1411231 ) ) ( not ( = ?auto_1411228 ?auto_1411232 ) ) ( not ( = ?auto_1411228 ?auto_1411233 ) ) ( not ( = ?auto_1411228 ?auto_1411234 ) ) ( not ( = ?auto_1411228 ?auto_1411235 ) ) ( not ( = ?auto_1411228 ?auto_1411236 ) ) ( not ( = ?auto_1411228 ?auto_1411237 ) ) ( not ( = ?auto_1411230 ?auto_1411229 ) ) ( not ( = ?auto_1411230 ?auto_1411231 ) ) ( not ( = ?auto_1411230 ?auto_1411232 ) ) ( not ( = ?auto_1411230 ?auto_1411233 ) ) ( not ( = ?auto_1411230 ?auto_1411234 ) ) ( not ( = ?auto_1411230 ?auto_1411235 ) ) ( not ( = ?auto_1411230 ?auto_1411236 ) ) ( not ( = ?auto_1411230 ?auto_1411237 ) ) ( not ( = ?auto_1411229 ?auto_1411231 ) ) ( not ( = ?auto_1411229 ?auto_1411232 ) ) ( not ( = ?auto_1411229 ?auto_1411233 ) ) ( not ( = ?auto_1411229 ?auto_1411234 ) ) ( not ( = ?auto_1411229 ?auto_1411235 ) ) ( not ( = ?auto_1411229 ?auto_1411236 ) ) ( not ( = ?auto_1411229 ?auto_1411237 ) ) ( not ( = ?auto_1411231 ?auto_1411232 ) ) ( not ( = ?auto_1411231 ?auto_1411233 ) ) ( not ( = ?auto_1411231 ?auto_1411234 ) ) ( not ( = ?auto_1411231 ?auto_1411235 ) ) ( not ( = ?auto_1411231 ?auto_1411236 ) ) ( not ( = ?auto_1411231 ?auto_1411237 ) ) ( not ( = ?auto_1411232 ?auto_1411233 ) ) ( not ( = ?auto_1411232 ?auto_1411234 ) ) ( not ( = ?auto_1411232 ?auto_1411235 ) ) ( not ( = ?auto_1411232 ?auto_1411236 ) ) ( not ( = ?auto_1411232 ?auto_1411237 ) ) ( not ( = ?auto_1411233 ?auto_1411234 ) ) ( not ( = ?auto_1411233 ?auto_1411235 ) ) ( not ( = ?auto_1411233 ?auto_1411236 ) ) ( not ( = ?auto_1411233 ?auto_1411237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411234 ?auto_1411235 ?auto_1411236 )
      ( MAKE-12CRATE-VERIFY ?auto_1411225 ?auto_1411226 ?auto_1411227 ?auto_1411224 ?auto_1411228 ?auto_1411230 ?auto_1411229 ?auto_1411231 ?auto_1411232 ?auto_1411233 ?auto_1411234 ?auto_1411235 ?auto_1411236 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1411244 - SURFACE
      ?auto_1411245 - SURFACE
      ?auto_1411246 - SURFACE
      ?auto_1411243 - SURFACE
      ?auto_1411247 - SURFACE
      ?auto_1411249 - SURFACE
      ?auto_1411248 - SURFACE
      ?auto_1411250 - SURFACE
      ?auto_1411251 - SURFACE
      ?auto_1411252 - SURFACE
      ?auto_1411253 - SURFACE
      ?auto_1411254 - SURFACE
      ?auto_1411255 - SURFACE
      ?auto_1411256 - SURFACE
    )
    :vars
    (
      ?auto_1411261 - HOIST
      ?auto_1411258 - PLACE
      ?auto_1411262 - PLACE
      ?auto_1411260 - HOIST
      ?auto_1411257 - SURFACE
      ?auto_1411259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411261 ?auto_1411258 ) ( IS-CRATE ?auto_1411256 ) ( not ( = ?auto_1411255 ?auto_1411256 ) ) ( not ( = ?auto_1411254 ?auto_1411255 ) ) ( not ( = ?auto_1411254 ?auto_1411256 ) ) ( not ( = ?auto_1411262 ?auto_1411258 ) ) ( HOIST-AT ?auto_1411260 ?auto_1411262 ) ( not ( = ?auto_1411261 ?auto_1411260 ) ) ( AVAILABLE ?auto_1411260 ) ( SURFACE-AT ?auto_1411256 ?auto_1411262 ) ( ON ?auto_1411256 ?auto_1411257 ) ( CLEAR ?auto_1411256 ) ( not ( = ?auto_1411255 ?auto_1411257 ) ) ( not ( = ?auto_1411256 ?auto_1411257 ) ) ( not ( = ?auto_1411254 ?auto_1411257 ) ) ( SURFACE-AT ?auto_1411254 ?auto_1411258 ) ( CLEAR ?auto_1411254 ) ( IS-CRATE ?auto_1411255 ) ( AVAILABLE ?auto_1411261 ) ( IN ?auto_1411255 ?auto_1411259 ) ( TRUCK-AT ?auto_1411259 ?auto_1411262 ) ( ON ?auto_1411245 ?auto_1411244 ) ( ON ?auto_1411246 ?auto_1411245 ) ( ON ?auto_1411243 ?auto_1411246 ) ( ON ?auto_1411247 ?auto_1411243 ) ( ON ?auto_1411249 ?auto_1411247 ) ( ON ?auto_1411248 ?auto_1411249 ) ( ON ?auto_1411250 ?auto_1411248 ) ( ON ?auto_1411251 ?auto_1411250 ) ( ON ?auto_1411252 ?auto_1411251 ) ( ON ?auto_1411253 ?auto_1411252 ) ( ON ?auto_1411254 ?auto_1411253 ) ( not ( = ?auto_1411244 ?auto_1411245 ) ) ( not ( = ?auto_1411244 ?auto_1411246 ) ) ( not ( = ?auto_1411244 ?auto_1411243 ) ) ( not ( = ?auto_1411244 ?auto_1411247 ) ) ( not ( = ?auto_1411244 ?auto_1411249 ) ) ( not ( = ?auto_1411244 ?auto_1411248 ) ) ( not ( = ?auto_1411244 ?auto_1411250 ) ) ( not ( = ?auto_1411244 ?auto_1411251 ) ) ( not ( = ?auto_1411244 ?auto_1411252 ) ) ( not ( = ?auto_1411244 ?auto_1411253 ) ) ( not ( = ?auto_1411244 ?auto_1411254 ) ) ( not ( = ?auto_1411244 ?auto_1411255 ) ) ( not ( = ?auto_1411244 ?auto_1411256 ) ) ( not ( = ?auto_1411244 ?auto_1411257 ) ) ( not ( = ?auto_1411245 ?auto_1411246 ) ) ( not ( = ?auto_1411245 ?auto_1411243 ) ) ( not ( = ?auto_1411245 ?auto_1411247 ) ) ( not ( = ?auto_1411245 ?auto_1411249 ) ) ( not ( = ?auto_1411245 ?auto_1411248 ) ) ( not ( = ?auto_1411245 ?auto_1411250 ) ) ( not ( = ?auto_1411245 ?auto_1411251 ) ) ( not ( = ?auto_1411245 ?auto_1411252 ) ) ( not ( = ?auto_1411245 ?auto_1411253 ) ) ( not ( = ?auto_1411245 ?auto_1411254 ) ) ( not ( = ?auto_1411245 ?auto_1411255 ) ) ( not ( = ?auto_1411245 ?auto_1411256 ) ) ( not ( = ?auto_1411245 ?auto_1411257 ) ) ( not ( = ?auto_1411246 ?auto_1411243 ) ) ( not ( = ?auto_1411246 ?auto_1411247 ) ) ( not ( = ?auto_1411246 ?auto_1411249 ) ) ( not ( = ?auto_1411246 ?auto_1411248 ) ) ( not ( = ?auto_1411246 ?auto_1411250 ) ) ( not ( = ?auto_1411246 ?auto_1411251 ) ) ( not ( = ?auto_1411246 ?auto_1411252 ) ) ( not ( = ?auto_1411246 ?auto_1411253 ) ) ( not ( = ?auto_1411246 ?auto_1411254 ) ) ( not ( = ?auto_1411246 ?auto_1411255 ) ) ( not ( = ?auto_1411246 ?auto_1411256 ) ) ( not ( = ?auto_1411246 ?auto_1411257 ) ) ( not ( = ?auto_1411243 ?auto_1411247 ) ) ( not ( = ?auto_1411243 ?auto_1411249 ) ) ( not ( = ?auto_1411243 ?auto_1411248 ) ) ( not ( = ?auto_1411243 ?auto_1411250 ) ) ( not ( = ?auto_1411243 ?auto_1411251 ) ) ( not ( = ?auto_1411243 ?auto_1411252 ) ) ( not ( = ?auto_1411243 ?auto_1411253 ) ) ( not ( = ?auto_1411243 ?auto_1411254 ) ) ( not ( = ?auto_1411243 ?auto_1411255 ) ) ( not ( = ?auto_1411243 ?auto_1411256 ) ) ( not ( = ?auto_1411243 ?auto_1411257 ) ) ( not ( = ?auto_1411247 ?auto_1411249 ) ) ( not ( = ?auto_1411247 ?auto_1411248 ) ) ( not ( = ?auto_1411247 ?auto_1411250 ) ) ( not ( = ?auto_1411247 ?auto_1411251 ) ) ( not ( = ?auto_1411247 ?auto_1411252 ) ) ( not ( = ?auto_1411247 ?auto_1411253 ) ) ( not ( = ?auto_1411247 ?auto_1411254 ) ) ( not ( = ?auto_1411247 ?auto_1411255 ) ) ( not ( = ?auto_1411247 ?auto_1411256 ) ) ( not ( = ?auto_1411247 ?auto_1411257 ) ) ( not ( = ?auto_1411249 ?auto_1411248 ) ) ( not ( = ?auto_1411249 ?auto_1411250 ) ) ( not ( = ?auto_1411249 ?auto_1411251 ) ) ( not ( = ?auto_1411249 ?auto_1411252 ) ) ( not ( = ?auto_1411249 ?auto_1411253 ) ) ( not ( = ?auto_1411249 ?auto_1411254 ) ) ( not ( = ?auto_1411249 ?auto_1411255 ) ) ( not ( = ?auto_1411249 ?auto_1411256 ) ) ( not ( = ?auto_1411249 ?auto_1411257 ) ) ( not ( = ?auto_1411248 ?auto_1411250 ) ) ( not ( = ?auto_1411248 ?auto_1411251 ) ) ( not ( = ?auto_1411248 ?auto_1411252 ) ) ( not ( = ?auto_1411248 ?auto_1411253 ) ) ( not ( = ?auto_1411248 ?auto_1411254 ) ) ( not ( = ?auto_1411248 ?auto_1411255 ) ) ( not ( = ?auto_1411248 ?auto_1411256 ) ) ( not ( = ?auto_1411248 ?auto_1411257 ) ) ( not ( = ?auto_1411250 ?auto_1411251 ) ) ( not ( = ?auto_1411250 ?auto_1411252 ) ) ( not ( = ?auto_1411250 ?auto_1411253 ) ) ( not ( = ?auto_1411250 ?auto_1411254 ) ) ( not ( = ?auto_1411250 ?auto_1411255 ) ) ( not ( = ?auto_1411250 ?auto_1411256 ) ) ( not ( = ?auto_1411250 ?auto_1411257 ) ) ( not ( = ?auto_1411251 ?auto_1411252 ) ) ( not ( = ?auto_1411251 ?auto_1411253 ) ) ( not ( = ?auto_1411251 ?auto_1411254 ) ) ( not ( = ?auto_1411251 ?auto_1411255 ) ) ( not ( = ?auto_1411251 ?auto_1411256 ) ) ( not ( = ?auto_1411251 ?auto_1411257 ) ) ( not ( = ?auto_1411252 ?auto_1411253 ) ) ( not ( = ?auto_1411252 ?auto_1411254 ) ) ( not ( = ?auto_1411252 ?auto_1411255 ) ) ( not ( = ?auto_1411252 ?auto_1411256 ) ) ( not ( = ?auto_1411252 ?auto_1411257 ) ) ( not ( = ?auto_1411253 ?auto_1411254 ) ) ( not ( = ?auto_1411253 ?auto_1411255 ) ) ( not ( = ?auto_1411253 ?auto_1411256 ) ) ( not ( = ?auto_1411253 ?auto_1411257 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411254 ?auto_1411255 ?auto_1411256 )
      ( MAKE-13CRATE-VERIFY ?auto_1411244 ?auto_1411245 ?auto_1411246 ?auto_1411243 ?auto_1411247 ?auto_1411249 ?auto_1411248 ?auto_1411250 ?auto_1411251 ?auto_1411252 ?auto_1411253 ?auto_1411254 ?auto_1411255 ?auto_1411256 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1411264 - SURFACE
      ?auto_1411265 - SURFACE
      ?auto_1411266 - SURFACE
      ?auto_1411263 - SURFACE
      ?auto_1411267 - SURFACE
      ?auto_1411269 - SURFACE
      ?auto_1411268 - SURFACE
      ?auto_1411270 - SURFACE
      ?auto_1411271 - SURFACE
      ?auto_1411272 - SURFACE
      ?auto_1411273 - SURFACE
      ?auto_1411274 - SURFACE
      ?auto_1411275 - SURFACE
      ?auto_1411276 - SURFACE
      ?auto_1411277 - SURFACE
    )
    :vars
    (
      ?auto_1411282 - HOIST
      ?auto_1411279 - PLACE
      ?auto_1411283 - PLACE
      ?auto_1411281 - HOIST
      ?auto_1411278 - SURFACE
      ?auto_1411280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411282 ?auto_1411279 ) ( IS-CRATE ?auto_1411277 ) ( not ( = ?auto_1411276 ?auto_1411277 ) ) ( not ( = ?auto_1411275 ?auto_1411276 ) ) ( not ( = ?auto_1411275 ?auto_1411277 ) ) ( not ( = ?auto_1411283 ?auto_1411279 ) ) ( HOIST-AT ?auto_1411281 ?auto_1411283 ) ( not ( = ?auto_1411282 ?auto_1411281 ) ) ( AVAILABLE ?auto_1411281 ) ( SURFACE-AT ?auto_1411277 ?auto_1411283 ) ( ON ?auto_1411277 ?auto_1411278 ) ( CLEAR ?auto_1411277 ) ( not ( = ?auto_1411276 ?auto_1411278 ) ) ( not ( = ?auto_1411277 ?auto_1411278 ) ) ( not ( = ?auto_1411275 ?auto_1411278 ) ) ( SURFACE-AT ?auto_1411275 ?auto_1411279 ) ( CLEAR ?auto_1411275 ) ( IS-CRATE ?auto_1411276 ) ( AVAILABLE ?auto_1411282 ) ( IN ?auto_1411276 ?auto_1411280 ) ( TRUCK-AT ?auto_1411280 ?auto_1411283 ) ( ON ?auto_1411265 ?auto_1411264 ) ( ON ?auto_1411266 ?auto_1411265 ) ( ON ?auto_1411263 ?auto_1411266 ) ( ON ?auto_1411267 ?auto_1411263 ) ( ON ?auto_1411269 ?auto_1411267 ) ( ON ?auto_1411268 ?auto_1411269 ) ( ON ?auto_1411270 ?auto_1411268 ) ( ON ?auto_1411271 ?auto_1411270 ) ( ON ?auto_1411272 ?auto_1411271 ) ( ON ?auto_1411273 ?auto_1411272 ) ( ON ?auto_1411274 ?auto_1411273 ) ( ON ?auto_1411275 ?auto_1411274 ) ( not ( = ?auto_1411264 ?auto_1411265 ) ) ( not ( = ?auto_1411264 ?auto_1411266 ) ) ( not ( = ?auto_1411264 ?auto_1411263 ) ) ( not ( = ?auto_1411264 ?auto_1411267 ) ) ( not ( = ?auto_1411264 ?auto_1411269 ) ) ( not ( = ?auto_1411264 ?auto_1411268 ) ) ( not ( = ?auto_1411264 ?auto_1411270 ) ) ( not ( = ?auto_1411264 ?auto_1411271 ) ) ( not ( = ?auto_1411264 ?auto_1411272 ) ) ( not ( = ?auto_1411264 ?auto_1411273 ) ) ( not ( = ?auto_1411264 ?auto_1411274 ) ) ( not ( = ?auto_1411264 ?auto_1411275 ) ) ( not ( = ?auto_1411264 ?auto_1411276 ) ) ( not ( = ?auto_1411264 ?auto_1411277 ) ) ( not ( = ?auto_1411264 ?auto_1411278 ) ) ( not ( = ?auto_1411265 ?auto_1411266 ) ) ( not ( = ?auto_1411265 ?auto_1411263 ) ) ( not ( = ?auto_1411265 ?auto_1411267 ) ) ( not ( = ?auto_1411265 ?auto_1411269 ) ) ( not ( = ?auto_1411265 ?auto_1411268 ) ) ( not ( = ?auto_1411265 ?auto_1411270 ) ) ( not ( = ?auto_1411265 ?auto_1411271 ) ) ( not ( = ?auto_1411265 ?auto_1411272 ) ) ( not ( = ?auto_1411265 ?auto_1411273 ) ) ( not ( = ?auto_1411265 ?auto_1411274 ) ) ( not ( = ?auto_1411265 ?auto_1411275 ) ) ( not ( = ?auto_1411265 ?auto_1411276 ) ) ( not ( = ?auto_1411265 ?auto_1411277 ) ) ( not ( = ?auto_1411265 ?auto_1411278 ) ) ( not ( = ?auto_1411266 ?auto_1411263 ) ) ( not ( = ?auto_1411266 ?auto_1411267 ) ) ( not ( = ?auto_1411266 ?auto_1411269 ) ) ( not ( = ?auto_1411266 ?auto_1411268 ) ) ( not ( = ?auto_1411266 ?auto_1411270 ) ) ( not ( = ?auto_1411266 ?auto_1411271 ) ) ( not ( = ?auto_1411266 ?auto_1411272 ) ) ( not ( = ?auto_1411266 ?auto_1411273 ) ) ( not ( = ?auto_1411266 ?auto_1411274 ) ) ( not ( = ?auto_1411266 ?auto_1411275 ) ) ( not ( = ?auto_1411266 ?auto_1411276 ) ) ( not ( = ?auto_1411266 ?auto_1411277 ) ) ( not ( = ?auto_1411266 ?auto_1411278 ) ) ( not ( = ?auto_1411263 ?auto_1411267 ) ) ( not ( = ?auto_1411263 ?auto_1411269 ) ) ( not ( = ?auto_1411263 ?auto_1411268 ) ) ( not ( = ?auto_1411263 ?auto_1411270 ) ) ( not ( = ?auto_1411263 ?auto_1411271 ) ) ( not ( = ?auto_1411263 ?auto_1411272 ) ) ( not ( = ?auto_1411263 ?auto_1411273 ) ) ( not ( = ?auto_1411263 ?auto_1411274 ) ) ( not ( = ?auto_1411263 ?auto_1411275 ) ) ( not ( = ?auto_1411263 ?auto_1411276 ) ) ( not ( = ?auto_1411263 ?auto_1411277 ) ) ( not ( = ?auto_1411263 ?auto_1411278 ) ) ( not ( = ?auto_1411267 ?auto_1411269 ) ) ( not ( = ?auto_1411267 ?auto_1411268 ) ) ( not ( = ?auto_1411267 ?auto_1411270 ) ) ( not ( = ?auto_1411267 ?auto_1411271 ) ) ( not ( = ?auto_1411267 ?auto_1411272 ) ) ( not ( = ?auto_1411267 ?auto_1411273 ) ) ( not ( = ?auto_1411267 ?auto_1411274 ) ) ( not ( = ?auto_1411267 ?auto_1411275 ) ) ( not ( = ?auto_1411267 ?auto_1411276 ) ) ( not ( = ?auto_1411267 ?auto_1411277 ) ) ( not ( = ?auto_1411267 ?auto_1411278 ) ) ( not ( = ?auto_1411269 ?auto_1411268 ) ) ( not ( = ?auto_1411269 ?auto_1411270 ) ) ( not ( = ?auto_1411269 ?auto_1411271 ) ) ( not ( = ?auto_1411269 ?auto_1411272 ) ) ( not ( = ?auto_1411269 ?auto_1411273 ) ) ( not ( = ?auto_1411269 ?auto_1411274 ) ) ( not ( = ?auto_1411269 ?auto_1411275 ) ) ( not ( = ?auto_1411269 ?auto_1411276 ) ) ( not ( = ?auto_1411269 ?auto_1411277 ) ) ( not ( = ?auto_1411269 ?auto_1411278 ) ) ( not ( = ?auto_1411268 ?auto_1411270 ) ) ( not ( = ?auto_1411268 ?auto_1411271 ) ) ( not ( = ?auto_1411268 ?auto_1411272 ) ) ( not ( = ?auto_1411268 ?auto_1411273 ) ) ( not ( = ?auto_1411268 ?auto_1411274 ) ) ( not ( = ?auto_1411268 ?auto_1411275 ) ) ( not ( = ?auto_1411268 ?auto_1411276 ) ) ( not ( = ?auto_1411268 ?auto_1411277 ) ) ( not ( = ?auto_1411268 ?auto_1411278 ) ) ( not ( = ?auto_1411270 ?auto_1411271 ) ) ( not ( = ?auto_1411270 ?auto_1411272 ) ) ( not ( = ?auto_1411270 ?auto_1411273 ) ) ( not ( = ?auto_1411270 ?auto_1411274 ) ) ( not ( = ?auto_1411270 ?auto_1411275 ) ) ( not ( = ?auto_1411270 ?auto_1411276 ) ) ( not ( = ?auto_1411270 ?auto_1411277 ) ) ( not ( = ?auto_1411270 ?auto_1411278 ) ) ( not ( = ?auto_1411271 ?auto_1411272 ) ) ( not ( = ?auto_1411271 ?auto_1411273 ) ) ( not ( = ?auto_1411271 ?auto_1411274 ) ) ( not ( = ?auto_1411271 ?auto_1411275 ) ) ( not ( = ?auto_1411271 ?auto_1411276 ) ) ( not ( = ?auto_1411271 ?auto_1411277 ) ) ( not ( = ?auto_1411271 ?auto_1411278 ) ) ( not ( = ?auto_1411272 ?auto_1411273 ) ) ( not ( = ?auto_1411272 ?auto_1411274 ) ) ( not ( = ?auto_1411272 ?auto_1411275 ) ) ( not ( = ?auto_1411272 ?auto_1411276 ) ) ( not ( = ?auto_1411272 ?auto_1411277 ) ) ( not ( = ?auto_1411272 ?auto_1411278 ) ) ( not ( = ?auto_1411273 ?auto_1411274 ) ) ( not ( = ?auto_1411273 ?auto_1411275 ) ) ( not ( = ?auto_1411273 ?auto_1411276 ) ) ( not ( = ?auto_1411273 ?auto_1411277 ) ) ( not ( = ?auto_1411273 ?auto_1411278 ) ) ( not ( = ?auto_1411274 ?auto_1411275 ) ) ( not ( = ?auto_1411274 ?auto_1411276 ) ) ( not ( = ?auto_1411274 ?auto_1411277 ) ) ( not ( = ?auto_1411274 ?auto_1411278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411275 ?auto_1411276 ?auto_1411277 )
      ( MAKE-14CRATE-VERIFY ?auto_1411264 ?auto_1411265 ?auto_1411266 ?auto_1411263 ?auto_1411267 ?auto_1411269 ?auto_1411268 ?auto_1411270 ?auto_1411271 ?auto_1411272 ?auto_1411273 ?auto_1411274 ?auto_1411275 ?auto_1411276 ?auto_1411277 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1411284 - SURFACE
      ?auto_1411285 - SURFACE
    )
    :vars
    (
      ?auto_1411291 - HOIST
      ?auto_1411288 - PLACE
      ?auto_1411286 - SURFACE
      ?auto_1411292 - PLACE
      ?auto_1411290 - HOIST
      ?auto_1411287 - SURFACE
      ?auto_1411289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411291 ?auto_1411288 ) ( IS-CRATE ?auto_1411285 ) ( not ( = ?auto_1411284 ?auto_1411285 ) ) ( not ( = ?auto_1411286 ?auto_1411284 ) ) ( not ( = ?auto_1411286 ?auto_1411285 ) ) ( not ( = ?auto_1411292 ?auto_1411288 ) ) ( HOIST-AT ?auto_1411290 ?auto_1411292 ) ( not ( = ?auto_1411291 ?auto_1411290 ) ) ( SURFACE-AT ?auto_1411285 ?auto_1411292 ) ( ON ?auto_1411285 ?auto_1411287 ) ( CLEAR ?auto_1411285 ) ( not ( = ?auto_1411284 ?auto_1411287 ) ) ( not ( = ?auto_1411285 ?auto_1411287 ) ) ( not ( = ?auto_1411286 ?auto_1411287 ) ) ( SURFACE-AT ?auto_1411286 ?auto_1411288 ) ( CLEAR ?auto_1411286 ) ( IS-CRATE ?auto_1411284 ) ( AVAILABLE ?auto_1411291 ) ( TRUCK-AT ?auto_1411289 ?auto_1411292 ) ( LIFTING ?auto_1411290 ?auto_1411284 ) )
    :subtasks
    ( ( !LOAD ?auto_1411290 ?auto_1411284 ?auto_1411289 ?auto_1411292 )
      ( MAKE-2CRATE ?auto_1411286 ?auto_1411284 ?auto_1411285 )
      ( MAKE-1CRATE-VERIFY ?auto_1411284 ?auto_1411285 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1411293 - SURFACE
      ?auto_1411294 - SURFACE
      ?auto_1411295 - SURFACE
    )
    :vars
    (
      ?auto_1411301 - HOIST
      ?auto_1411299 - PLACE
      ?auto_1411300 - PLACE
      ?auto_1411296 - HOIST
      ?auto_1411298 - SURFACE
      ?auto_1411297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411301 ?auto_1411299 ) ( IS-CRATE ?auto_1411295 ) ( not ( = ?auto_1411294 ?auto_1411295 ) ) ( not ( = ?auto_1411293 ?auto_1411294 ) ) ( not ( = ?auto_1411293 ?auto_1411295 ) ) ( not ( = ?auto_1411300 ?auto_1411299 ) ) ( HOIST-AT ?auto_1411296 ?auto_1411300 ) ( not ( = ?auto_1411301 ?auto_1411296 ) ) ( SURFACE-AT ?auto_1411295 ?auto_1411300 ) ( ON ?auto_1411295 ?auto_1411298 ) ( CLEAR ?auto_1411295 ) ( not ( = ?auto_1411294 ?auto_1411298 ) ) ( not ( = ?auto_1411295 ?auto_1411298 ) ) ( not ( = ?auto_1411293 ?auto_1411298 ) ) ( SURFACE-AT ?auto_1411293 ?auto_1411299 ) ( CLEAR ?auto_1411293 ) ( IS-CRATE ?auto_1411294 ) ( AVAILABLE ?auto_1411301 ) ( TRUCK-AT ?auto_1411297 ?auto_1411300 ) ( LIFTING ?auto_1411296 ?auto_1411294 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1411294 ?auto_1411295 )
      ( MAKE-2CRATE-VERIFY ?auto_1411293 ?auto_1411294 ?auto_1411295 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1411303 - SURFACE
      ?auto_1411304 - SURFACE
      ?auto_1411305 - SURFACE
      ?auto_1411302 - SURFACE
    )
    :vars
    (
      ?auto_1411308 - HOIST
      ?auto_1411307 - PLACE
      ?auto_1411309 - PLACE
      ?auto_1411310 - HOIST
      ?auto_1411311 - SURFACE
      ?auto_1411306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411308 ?auto_1411307 ) ( IS-CRATE ?auto_1411302 ) ( not ( = ?auto_1411305 ?auto_1411302 ) ) ( not ( = ?auto_1411304 ?auto_1411305 ) ) ( not ( = ?auto_1411304 ?auto_1411302 ) ) ( not ( = ?auto_1411309 ?auto_1411307 ) ) ( HOIST-AT ?auto_1411310 ?auto_1411309 ) ( not ( = ?auto_1411308 ?auto_1411310 ) ) ( SURFACE-AT ?auto_1411302 ?auto_1411309 ) ( ON ?auto_1411302 ?auto_1411311 ) ( CLEAR ?auto_1411302 ) ( not ( = ?auto_1411305 ?auto_1411311 ) ) ( not ( = ?auto_1411302 ?auto_1411311 ) ) ( not ( = ?auto_1411304 ?auto_1411311 ) ) ( SURFACE-AT ?auto_1411304 ?auto_1411307 ) ( CLEAR ?auto_1411304 ) ( IS-CRATE ?auto_1411305 ) ( AVAILABLE ?auto_1411308 ) ( TRUCK-AT ?auto_1411306 ?auto_1411309 ) ( LIFTING ?auto_1411310 ?auto_1411305 ) ( ON ?auto_1411304 ?auto_1411303 ) ( not ( = ?auto_1411303 ?auto_1411304 ) ) ( not ( = ?auto_1411303 ?auto_1411305 ) ) ( not ( = ?auto_1411303 ?auto_1411302 ) ) ( not ( = ?auto_1411303 ?auto_1411311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411304 ?auto_1411305 ?auto_1411302 )
      ( MAKE-3CRATE-VERIFY ?auto_1411303 ?auto_1411304 ?auto_1411305 ?auto_1411302 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1411313 - SURFACE
      ?auto_1411314 - SURFACE
      ?auto_1411315 - SURFACE
      ?auto_1411312 - SURFACE
      ?auto_1411316 - SURFACE
    )
    :vars
    (
      ?auto_1411319 - HOIST
      ?auto_1411318 - PLACE
      ?auto_1411320 - PLACE
      ?auto_1411321 - HOIST
      ?auto_1411322 - SURFACE
      ?auto_1411317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411319 ?auto_1411318 ) ( IS-CRATE ?auto_1411316 ) ( not ( = ?auto_1411312 ?auto_1411316 ) ) ( not ( = ?auto_1411315 ?auto_1411312 ) ) ( not ( = ?auto_1411315 ?auto_1411316 ) ) ( not ( = ?auto_1411320 ?auto_1411318 ) ) ( HOIST-AT ?auto_1411321 ?auto_1411320 ) ( not ( = ?auto_1411319 ?auto_1411321 ) ) ( SURFACE-AT ?auto_1411316 ?auto_1411320 ) ( ON ?auto_1411316 ?auto_1411322 ) ( CLEAR ?auto_1411316 ) ( not ( = ?auto_1411312 ?auto_1411322 ) ) ( not ( = ?auto_1411316 ?auto_1411322 ) ) ( not ( = ?auto_1411315 ?auto_1411322 ) ) ( SURFACE-AT ?auto_1411315 ?auto_1411318 ) ( CLEAR ?auto_1411315 ) ( IS-CRATE ?auto_1411312 ) ( AVAILABLE ?auto_1411319 ) ( TRUCK-AT ?auto_1411317 ?auto_1411320 ) ( LIFTING ?auto_1411321 ?auto_1411312 ) ( ON ?auto_1411314 ?auto_1411313 ) ( ON ?auto_1411315 ?auto_1411314 ) ( not ( = ?auto_1411313 ?auto_1411314 ) ) ( not ( = ?auto_1411313 ?auto_1411315 ) ) ( not ( = ?auto_1411313 ?auto_1411312 ) ) ( not ( = ?auto_1411313 ?auto_1411316 ) ) ( not ( = ?auto_1411313 ?auto_1411322 ) ) ( not ( = ?auto_1411314 ?auto_1411315 ) ) ( not ( = ?auto_1411314 ?auto_1411312 ) ) ( not ( = ?auto_1411314 ?auto_1411316 ) ) ( not ( = ?auto_1411314 ?auto_1411322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411315 ?auto_1411312 ?auto_1411316 )
      ( MAKE-4CRATE-VERIFY ?auto_1411313 ?auto_1411314 ?auto_1411315 ?auto_1411312 ?auto_1411316 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1411324 - SURFACE
      ?auto_1411325 - SURFACE
      ?auto_1411326 - SURFACE
      ?auto_1411323 - SURFACE
      ?auto_1411327 - SURFACE
      ?auto_1411328 - SURFACE
    )
    :vars
    (
      ?auto_1411331 - HOIST
      ?auto_1411330 - PLACE
      ?auto_1411332 - PLACE
      ?auto_1411333 - HOIST
      ?auto_1411334 - SURFACE
      ?auto_1411329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411331 ?auto_1411330 ) ( IS-CRATE ?auto_1411328 ) ( not ( = ?auto_1411327 ?auto_1411328 ) ) ( not ( = ?auto_1411323 ?auto_1411327 ) ) ( not ( = ?auto_1411323 ?auto_1411328 ) ) ( not ( = ?auto_1411332 ?auto_1411330 ) ) ( HOIST-AT ?auto_1411333 ?auto_1411332 ) ( not ( = ?auto_1411331 ?auto_1411333 ) ) ( SURFACE-AT ?auto_1411328 ?auto_1411332 ) ( ON ?auto_1411328 ?auto_1411334 ) ( CLEAR ?auto_1411328 ) ( not ( = ?auto_1411327 ?auto_1411334 ) ) ( not ( = ?auto_1411328 ?auto_1411334 ) ) ( not ( = ?auto_1411323 ?auto_1411334 ) ) ( SURFACE-AT ?auto_1411323 ?auto_1411330 ) ( CLEAR ?auto_1411323 ) ( IS-CRATE ?auto_1411327 ) ( AVAILABLE ?auto_1411331 ) ( TRUCK-AT ?auto_1411329 ?auto_1411332 ) ( LIFTING ?auto_1411333 ?auto_1411327 ) ( ON ?auto_1411325 ?auto_1411324 ) ( ON ?auto_1411326 ?auto_1411325 ) ( ON ?auto_1411323 ?auto_1411326 ) ( not ( = ?auto_1411324 ?auto_1411325 ) ) ( not ( = ?auto_1411324 ?auto_1411326 ) ) ( not ( = ?auto_1411324 ?auto_1411323 ) ) ( not ( = ?auto_1411324 ?auto_1411327 ) ) ( not ( = ?auto_1411324 ?auto_1411328 ) ) ( not ( = ?auto_1411324 ?auto_1411334 ) ) ( not ( = ?auto_1411325 ?auto_1411326 ) ) ( not ( = ?auto_1411325 ?auto_1411323 ) ) ( not ( = ?auto_1411325 ?auto_1411327 ) ) ( not ( = ?auto_1411325 ?auto_1411328 ) ) ( not ( = ?auto_1411325 ?auto_1411334 ) ) ( not ( = ?auto_1411326 ?auto_1411323 ) ) ( not ( = ?auto_1411326 ?auto_1411327 ) ) ( not ( = ?auto_1411326 ?auto_1411328 ) ) ( not ( = ?auto_1411326 ?auto_1411334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411323 ?auto_1411327 ?auto_1411328 )
      ( MAKE-5CRATE-VERIFY ?auto_1411324 ?auto_1411325 ?auto_1411326 ?auto_1411323 ?auto_1411327 ?auto_1411328 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1411336 - SURFACE
      ?auto_1411337 - SURFACE
      ?auto_1411338 - SURFACE
      ?auto_1411335 - SURFACE
      ?auto_1411339 - SURFACE
      ?auto_1411341 - SURFACE
      ?auto_1411340 - SURFACE
    )
    :vars
    (
      ?auto_1411344 - HOIST
      ?auto_1411343 - PLACE
      ?auto_1411345 - PLACE
      ?auto_1411346 - HOIST
      ?auto_1411347 - SURFACE
      ?auto_1411342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411344 ?auto_1411343 ) ( IS-CRATE ?auto_1411340 ) ( not ( = ?auto_1411341 ?auto_1411340 ) ) ( not ( = ?auto_1411339 ?auto_1411341 ) ) ( not ( = ?auto_1411339 ?auto_1411340 ) ) ( not ( = ?auto_1411345 ?auto_1411343 ) ) ( HOIST-AT ?auto_1411346 ?auto_1411345 ) ( not ( = ?auto_1411344 ?auto_1411346 ) ) ( SURFACE-AT ?auto_1411340 ?auto_1411345 ) ( ON ?auto_1411340 ?auto_1411347 ) ( CLEAR ?auto_1411340 ) ( not ( = ?auto_1411341 ?auto_1411347 ) ) ( not ( = ?auto_1411340 ?auto_1411347 ) ) ( not ( = ?auto_1411339 ?auto_1411347 ) ) ( SURFACE-AT ?auto_1411339 ?auto_1411343 ) ( CLEAR ?auto_1411339 ) ( IS-CRATE ?auto_1411341 ) ( AVAILABLE ?auto_1411344 ) ( TRUCK-AT ?auto_1411342 ?auto_1411345 ) ( LIFTING ?auto_1411346 ?auto_1411341 ) ( ON ?auto_1411337 ?auto_1411336 ) ( ON ?auto_1411338 ?auto_1411337 ) ( ON ?auto_1411335 ?auto_1411338 ) ( ON ?auto_1411339 ?auto_1411335 ) ( not ( = ?auto_1411336 ?auto_1411337 ) ) ( not ( = ?auto_1411336 ?auto_1411338 ) ) ( not ( = ?auto_1411336 ?auto_1411335 ) ) ( not ( = ?auto_1411336 ?auto_1411339 ) ) ( not ( = ?auto_1411336 ?auto_1411341 ) ) ( not ( = ?auto_1411336 ?auto_1411340 ) ) ( not ( = ?auto_1411336 ?auto_1411347 ) ) ( not ( = ?auto_1411337 ?auto_1411338 ) ) ( not ( = ?auto_1411337 ?auto_1411335 ) ) ( not ( = ?auto_1411337 ?auto_1411339 ) ) ( not ( = ?auto_1411337 ?auto_1411341 ) ) ( not ( = ?auto_1411337 ?auto_1411340 ) ) ( not ( = ?auto_1411337 ?auto_1411347 ) ) ( not ( = ?auto_1411338 ?auto_1411335 ) ) ( not ( = ?auto_1411338 ?auto_1411339 ) ) ( not ( = ?auto_1411338 ?auto_1411341 ) ) ( not ( = ?auto_1411338 ?auto_1411340 ) ) ( not ( = ?auto_1411338 ?auto_1411347 ) ) ( not ( = ?auto_1411335 ?auto_1411339 ) ) ( not ( = ?auto_1411335 ?auto_1411341 ) ) ( not ( = ?auto_1411335 ?auto_1411340 ) ) ( not ( = ?auto_1411335 ?auto_1411347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411339 ?auto_1411341 ?auto_1411340 )
      ( MAKE-6CRATE-VERIFY ?auto_1411336 ?auto_1411337 ?auto_1411338 ?auto_1411335 ?auto_1411339 ?auto_1411341 ?auto_1411340 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1411349 - SURFACE
      ?auto_1411350 - SURFACE
      ?auto_1411351 - SURFACE
      ?auto_1411348 - SURFACE
      ?auto_1411352 - SURFACE
      ?auto_1411354 - SURFACE
      ?auto_1411353 - SURFACE
      ?auto_1411355 - SURFACE
    )
    :vars
    (
      ?auto_1411358 - HOIST
      ?auto_1411357 - PLACE
      ?auto_1411359 - PLACE
      ?auto_1411360 - HOIST
      ?auto_1411361 - SURFACE
      ?auto_1411356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411358 ?auto_1411357 ) ( IS-CRATE ?auto_1411355 ) ( not ( = ?auto_1411353 ?auto_1411355 ) ) ( not ( = ?auto_1411354 ?auto_1411353 ) ) ( not ( = ?auto_1411354 ?auto_1411355 ) ) ( not ( = ?auto_1411359 ?auto_1411357 ) ) ( HOIST-AT ?auto_1411360 ?auto_1411359 ) ( not ( = ?auto_1411358 ?auto_1411360 ) ) ( SURFACE-AT ?auto_1411355 ?auto_1411359 ) ( ON ?auto_1411355 ?auto_1411361 ) ( CLEAR ?auto_1411355 ) ( not ( = ?auto_1411353 ?auto_1411361 ) ) ( not ( = ?auto_1411355 ?auto_1411361 ) ) ( not ( = ?auto_1411354 ?auto_1411361 ) ) ( SURFACE-AT ?auto_1411354 ?auto_1411357 ) ( CLEAR ?auto_1411354 ) ( IS-CRATE ?auto_1411353 ) ( AVAILABLE ?auto_1411358 ) ( TRUCK-AT ?auto_1411356 ?auto_1411359 ) ( LIFTING ?auto_1411360 ?auto_1411353 ) ( ON ?auto_1411350 ?auto_1411349 ) ( ON ?auto_1411351 ?auto_1411350 ) ( ON ?auto_1411348 ?auto_1411351 ) ( ON ?auto_1411352 ?auto_1411348 ) ( ON ?auto_1411354 ?auto_1411352 ) ( not ( = ?auto_1411349 ?auto_1411350 ) ) ( not ( = ?auto_1411349 ?auto_1411351 ) ) ( not ( = ?auto_1411349 ?auto_1411348 ) ) ( not ( = ?auto_1411349 ?auto_1411352 ) ) ( not ( = ?auto_1411349 ?auto_1411354 ) ) ( not ( = ?auto_1411349 ?auto_1411353 ) ) ( not ( = ?auto_1411349 ?auto_1411355 ) ) ( not ( = ?auto_1411349 ?auto_1411361 ) ) ( not ( = ?auto_1411350 ?auto_1411351 ) ) ( not ( = ?auto_1411350 ?auto_1411348 ) ) ( not ( = ?auto_1411350 ?auto_1411352 ) ) ( not ( = ?auto_1411350 ?auto_1411354 ) ) ( not ( = ?auto_1411350 ?auto_1411353 ) ) ( not ( = ?auto_1411350 ?auto_1411355 ) ) ( not ( = ?auto_1411350 ?auto_1411361 ) ) ( not ( = ?auto_1411351 ?auto_1411348 ) ) ( not ( = ?auto_1411351 ?auto_1411352 ) ) ( not ( = ?auto_1411351 ?auto_1411354 ) ) ( not ( = ?auto_1411351 ?auto_1411353 ) ) ( not ( = ?auto_1411351 ?auto_1411355 ) ) ( not ( = ?auto_1411351 ?auto_1411361 ) ) ( not ( = ?auto_1411348 ?auto_1411352 ) ) ( not ( = ?auto_1411348 ?auto_1411354 ) ) ( not ( = ?auto_1411348 ?auto_1411353 ) ) ( not ( = ?auto_1411348 ?auto_1411355 ) ) ( not ( = ?auto_1411348 ?auto_1411361 ) ) ( not ( = ?auto_1411352 ?auto_1411354 ) ) ( not ( = ?auto_1411352 ?auto_1411353 ) ) ( not ( = ?auto_1411352 ?auto_1411355 ) ) ( not ( = ?auto_1411352 ?auto_1411361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411354 ?auto_1411353 ?auto_1411355 )
      ( MAKE-7CRATE-VERIFY ?auto_1411349 ?auto_1411350 ?auto_1411351 ?auto_1411348 ?auto_1411352 ?auto_1411354 ?auto_1411353 ?auto_1411355 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1411363 - SURFACE
      ?auto_1411364 - SURFACE
      ?auto_1411365 - SURFACE
      ?auto_1411362 - SURFACE
      ?auto_1411366 - SURFACE
      ?auto_1411368 - SURFACE
      ?auto_1411367 - SURFACE
      ?auto_1411369 - SURFACE
      ?auto_1411370 - SURFACE
    )
    :vars
    (
      ?auto_1411373 - HOIST
      ?auto_1411372 - PLACE
      ?auto_1411374 - PLACE
      ?auto_1411375 - HOIST
      ?auto_1411376 - SURFACE
      ?auto_1411371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411373 ?auto_1411372 ) ( IS-CRATE ?auto_1411370 ) ( not ( = ?auto_1411369 ?auto_1411370 ) ) ( not ( = ?auto_1411367 ?auto_1411369 ) ) ( not ( = ?auto_1411367 ?auto_1411370 ) ) ( not ( = ?auto_1411374 ?auto_1411372 ) ) ( HOIST-AT ?auto_1411375 ?auto_1411374 ) ( not ( = ?auto_1411373 ?auto_1411375 ) ) ( SURFACE-AT ?auto_1411370 ?auto_1411374 ) ( ON ?auto_1411370 ?auto_1411376 ) ( CLEAR ?auto_1411370 ) ( not ( = ?auto_1411369 ?auto_1411376 ) ) ( not ( = ?auto_1411370 ?auto_1411376 ) ) ( not ( = ?auto_1411367 ?auto_1411376 ) ) ( SURFACE-AT ?auto_1411367 ?auto_1411372 ) ( CLEAR ?auto_1411367 ) ( IS-CRATE ?auto_1411369 ) ( AVAILABLE ?auto_1411373 ) ( TRUCK-AT ?auto_1411371 ?auto_1411374 ) ( LIFTING ?auto_1411375 ?auto_1411369 ) ( ON ?auto_1411364 ?auto_1411363 ) ( ON ?auto_1411365 ?auto_1411364 ) ( ON ?auto_1411362 ?auto_1411365 ) ( ON ?auto_1411366 ?auto_1411362 ) ( ON ?auto_1411368 ?auto_1411366 ) ( ON ?auto_1411367 ?auto_1411368 ) ( not ( = ?auto_1411363 ?auto_1411364 ) ) ( not ( = ?auto_1411363 ?auto_1411365 ) ) ( not ( = ?auto_1411363 ?auto_1411362 ) ) ( not ( = ?auto_1411363 ?auto_1411366 ) ) ( not ( = ?auto_1411363 ?auto_1411368 ) ) ( not ( = ?auto_1411363 ?auto_1411367 ) ) ( not ( = ?auto_1411363 ?auto_1411369 ) ) ( not ( = ?auto_1411363 ?auto_1411370 ) ) ( not ( = ?auto_1411363 ?auto_1411376 ) ) ( not ( = ?auto_1411364 ?auto_1411365 ) ) ( not ( = ?auto_1411364 ?auto_1411362 ) ) ( not ( = ?auto_1411364 ?auto_1411366 ) ) ( not ( = ?auto_1411364 ?auto_1411368 ) ) ( not ( = ?auto_1411364 ?auto_1411367 ) ) ( not ( = ?auto_1411364 ?auto_1411369 ) ) ( not ( = ?auto_1411364 ?auto_1411370 ) ) ( not ( = ?auto_1411364 ?auto_1411376 ) ) ( not ( = ?auto_1411365 ?auto_1411362 ) ) ( not ( = ?auto_1411365 ?auto_1411366 ) ) ( not ( = ?auto_1411365 ?auto_1411368 ) ) ( not ( = ?auto_1411365 ?auto_1411367 ) ) ( not ( = ?auto_1411365 ?auto_1411369 ) ) ( not ( = ?auto_1411365 ?auto_1411370 ) ) ( not ( = ?auto_1411365 ?auto_1411376 ) ) ( not ( = ?auto_1411362 ?auto_1411366 ) ) ( not ( = ?auto_1411362 ?auto_1411368 ) ) ( not ( = ?auto_1411362 ?auto_1411367 ) ) ( not ( = ?auto_1411362 ?auto_1411369 ) ) ( not ( = ?auto_1411362 ?auto_1411370 ) ) ( not ( = ?auto_1411362 ?auto_1411376 ) ) ( not ( = ?auto_1411366 ?auto_1411368 ) ) ( not ( = ?auto_1411366 ?auto_1411367 ) ) ( not ( = ?auto_1411366 ?auto_1411369 ) ) ( not ( = ?auto_1411366 ?auto_1411370 ) ) ( not ( = ?auto_1411366 ?auto_1411376 ) ) ( not ( = ?auto_1411368 ?auto_1411367 ) ) ( not ( = ?auto_1411368 ?auto_1411369 ) ) ( not ( = ?auto_1411368 ?auto_1411370 ) ) ( not ( = ?auto_1411368 ?auto_1411376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411367 ?auto_1411369 ?auto_1411370 )
      ( MAKE-8CRATE-VERIFY ?auto_1411363 ?auto_1411364 ?auto_1411365 ?auto_1411362 ?auto_1411366 ?auto_1411368 ?auto_1411367 ?auto_1411369 ?auto_1411370 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1411378 - SURFACE
      ?auto_1411379 - SURFACE
      ?auto_1411380 - SURFACE
      ?auto_1411377 - SURFACE
      ?auto_1411381 - SURFACE
      ?auto_1411383 - SURFACE
      ?auto_1411382 - SURFACE
      ?auto_1411384 - SURFACE
      ?auto_1411385 - SURFACE
      ?auto_1411386 - SURFACE
    )
    :vars
    (
      ?auto_1411389 - HOIST
      ?auto_1411388 - PLACE
      ?auto_1411390 - PLACE
      ?auto_1411391 - HOIST
      ?auto_1411392 - SURFACE
      ?auto_1411387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411389 ?auto_1411388 ) ( IS-CRATE ?auto_1411386 ) ( not ( = ?auto_1411385 ?auto_1411386 ) ) ( not ( = ?auto_1411384 ?auto_1411385 ) ) ( not ( = ?auto_1411384 ?auto_1411386 ) ) ( not ( = ?auto_1411390 ?auto_1411388 ) ) ( HOIST-AT ?auto_1411391 ?auto_1411390 ) ( not ( = ?auto_1411389 ?auto_1411391 ) ) ( SURFACE-AT ?auto_1411386 ?auto_1411390 ) ( ON ?auto_1411386 ?auto_1411392 ) ( CLEAR ?auto_1411386 ) ( not ( = ?auto_1411385 ?auto_1411392 ) ) ( not ( = ?auto_1411386 ?auto_1411392 ) ) ( not ( = ?auto_1411384 ?auto_1411392 ) ) ( SURFACE-AT ?auto_1411384 ?auto_1411388 ) ( CLEAR ?auto_1411384 ) ( IS-CRATE ?auto_1411385 ) ( AVAILABLE ?auto_1411389 ) ( TRUCK-AT ?auto_1411387 ?auto_1411390 ) ( LIFTING ?auto_1411391 ?auto_1411385 ) ( ON ?auto_1411379 ?auto_1411378 ) ( ON ?auto_1411380 ?auto_1411379 ) ( ON ?auto_1411377 ?auto_1411380 ) ( ON ?auto_1411381 ?auto_1411377 ) ( ON ?auto_1411383 ?auto_1411381 ) ( ON ?auto_1411382 ?auto_1411383 ) ( ON ?auto_1411384 ?auto_1411382 ) ( not ( = ?auto_1411378 ?auto_1411379 ) ) ( not ( = ?auto_1411378 ?auto_1411380 ) ) ( not ( = ?auto_1411378 ?auto_1411377 ) ) ( not ( = ?auto_1411378 ?auto_1411381 ) ) ( not ( = ?auto_1411378 ?auto_1411383 ) ) ( not ( = ?auto_1411378 ?auto_1411382 ) ) ( not ( = ?auto_1411378 ?auto_1411384 ) ) ( not ( = ?auto_1411378 ?auto_1411385 ) ) ( not ( = ?auto_1411378 ?auto_1411386 ) ) ( not ( = ?auto_1411378 ?auto_1411392 ) ) ( not ( = ?auto_1411379 ?auto_1411380 ) ) ( not ( = ?auto_1411379 ?auto_1411377 ) ) ( not ( = ?auto_1411379 ?auto_1411381 ) ) ( not ( = ?auto_1411379 ?auto_1411383 ) ) ( not ( = ?auto_1411379 ?auto_1411382 ) ) ( not ( = ?auto_1411379 ?auto_1411384 ) ) ( not ( = ?auto_1411379 ?auto_1411385 ) ) ( not ( = ?auto_1411379 ?auto_1411386 ) ) ( not ( = ?auto_1411379 ?auto_1411392 ) ) ( not ( = ?auto_1411380 ?auto_1411377 ) ) ( not ( = ?auto_1411380 ?auto_1411381 ) ) ( not ( = ?auto_1411380 ?auto_1411383 ) ) ( not ( = ?auto_1411380 ?auto_1411382 ) ) ( not ( = ?auto_1411380 ?auto_1411384 ) ) ( not ( = ?auto_1411380 ?auto_1411385 ) ) ( not ( = ?auto_1411380 ?auto_1411386 ) ) ( not ( = ?auto_1411380 ?auto_1411392 ) ) ( not ( = ?auto_1411377 ?auto_1411381 ) ) ( not ( = ?auto_1411377 ?auto_1411383 ) ) ( not ( = ?auto_1411377 ?auto_1411382 ) ) ( not ( = ?auto_1411377 ?auto_1411384 ) ) ( not ( = ?auto_1411377 ?auto_1411385 ) ) ( not ( = ?auto_1411377 ?auto_1411386 ) ) ( not ( = ?auto_1411377 ?auto_1411392 ) ) ( not ( = ?auto_1411381 ?auto_1411383 ) ) ( not ( = ?auto_1411381 ?auto_1411382 ) ) ( not ( = ?auto_1411381 ?auto_1411384 ) ) ( not ( = ?auto_1411381 ?auto_1411385 ) ) ( not ( = ?auto_1411381 ?auto_1411386 ) ) ( not ( = ?auto_1411381 ?auto_1411392 ) ) ( not ( = ?auto_1411383 ?auto_1411382 ) ) ( not ( = ?auto_1411383 ?auto_1411384 ) ) ( not ( = ?auto_1411383 ?auto_1411385 ) ) ( not ( = ?auto_1411383 ?auto_1411386 ) ) ( not ( = ?auto_1411383 ?auto_1411392 ) ) ( not ( = ?auto_1411382 ?auto_1411384 ) ) ( not ( = ?auto_1411382 ?auto_1411385 ) ) ( not ( = ?auto_1411382 ?auto_1411386 ) ) ( not ( = ?auto_1411382 ?auto_1411392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411384 ?auto_1411385 ?auto_1411386 )
      ( MAKE-9CRATE-VERIFY ?auto_1411378 ?auto_1411379 ?auto_1411380 ?auto_1411377 ?auto_1411381 ?auto_1411383 ?auto_1411382 ?auto_1411384 ?auto_1411385 ?auto_1411386 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1411394 - SURFACE
      ?auto_1411395 - SURFACE
      ?auto_1411396 - SURFACE
      ?auto_1411393 - SURFACE
      ?auto_1411397 - SURFACE
      ?auto_1411399 - SURFACE
      ?auto_1411398 - SURFACE
      ?auto_1411400 - SURFACE
      ?auto_1411401 - SURFACE
      ?auto_1411402 - SURFACE
      ?auto_1411403 - SURFACE
    )
    :vars
    (
      ?auto_1411406 - HOIST
      ?auto_1411405 - PLACE
      ?auto_1411407 - PLACE
      ?auto_1411408 - HOIST
      ?auto_1411409 - SURFACE
      ?auto_1411404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411406 ?auto_1411405 ) ( IS-CRATE ?auto_1411403 ) ( not ( = ?auto_1411402 ?auto_1411403 ) ) ( not ( = ?auto_1411401 ?auto_1411402 ) ) ( not ( = ?auto_1411401 ?auto_1411403 ) ) ( not ( = ?auto_1411407 ?auto_1411405 ) ) ( HOIST-AT ?auto_1411408 ?auto_1411407 ) ( not ( = ?auto_1411406 ?auto_1411408 ) ) ( SURFACE-AT ?auto_1411403 ?auto_1411407 ) ( ON ?auto_1411403 ?auto_1411409 ) ( CLEAR ?auto_1411403 ) ( not ( = ?auto_1411402 ?auto_1411409 ) ) ( not ( = ?auto_1411403 ?auto_1411409 ) ) ( not ( = ?auto_1411401 ?auto_1411409 ) ) ( SURFACE-AT ?auto_1411401 ?auto_1411405 ) ( CLEAR ?auto_1411401 ) ( IS-CRATE ?auto_1411402 ) ( AVAILABLE ?auto_1411406 ) ( TRUCK-AT ?auto_1411404 ?auto_1411407 ) ( LIFTING ?auto_1411408 ?auto_1411402 ) ( ON ?auto_1411395 ?auto_1411394 ) ( ON ?auto_1411396 ?auto_1411395 ) ( ON ?auto_1411393 ?auto_1411396 ) ( ON ?auto_1411397 ?auto_1411393 ) ( ON ?auto_1411399 ?auto_1411397 ) ( ON ?auto_1411398 ?auto_1411399 ) ( ON ?auto_1411400 ?auto_1411398 ) ( ON ?auto_1411401 ?auto_1411400 ) ( not ( = ?auto_1411394 ?auto_1411395 ) ) ( not ( = ?auto_1411394 ?auto_1411396 ) ) ( not ( = ?auto_1411394 ?auto_1411393 ) ) ( not ( = ?auto_1411394 ?auto_1411397 ) ) ( not ( = ?auto_1411394 ?auto_1411399 ) ) ( not ( = ?auto_1411394 ?auto_1411398 ) ) ( not ( = ?auto_1411394 ?auto_1411400 ) ) ( not ( = ?auto_1411394 ?auto_1411401 ) ) ( not ( = ?auto_1411394 ?auto_1411402 ) ) ( not ( = ?auto_1411394 ?auto_1411403 ) ) ( not ( = ?auto_1411394 ?auto_1411409 ) ) ( not ( = ?auto_1411395 ?auto_1411396 ) ) ( not ( = ?auto_1411395 ?auto_1411393 ) ) ( not ( = ?auto_1411395 ?auto_1411397 ) ) ( not ( = ?auto_1411395 ?auto_1411399 ) ) ( not ( = ?auto_1411395 ?auto_1411398 ) ) ( not ( = ?auto_1411395 ?auto_1411400 ) ) ( not ( = ?auto_1411395 ?auto_1411401 ) ) ( not ( = ?auto_1411395 ?auto_1411402 ) ) ( not ( = ?auto_1411395 ?auto_1411403 ) ) ( not ( = ?auto_1411395 ?auto_1411409 ) ) ( not ( = ?auto_1411396 ?auto_1411393 ) ) ( not ( = ?auto_1411396 ?auto_1411397 ) ) ( not ( = ?auto_1411396 ?auto_1411399 ) ) ( not ( = ?auto_1411396 ?auto_1411398 ) ) ( not ( = ?auto_1411396 ?auto_1411400 ) ) ( not ( = ?auto_1411396 ?auto_1411401 ) ) ( not ( = ?auto_1411396 ?auto_1411402 ) ) ( not ( = ?auto_1411396 ?auto_1411403 ) ) ( not ( = ?auto_1411396 ?auto_1411409 ) ) ( not ( = ?auto_1411393 ?auto_1411397 ) ) ( not ( = ?auto_1411393 ?auto_1411399 ) ) ( not ( = ?auto_1411393 ?auto_1411398 ) ) ( not ( = ?auto_1411393 ?auto_1411400 ) ) ( not ( = ?auto_1411393 ?auto_1411401 ) ) ( not ( = ?auto_1411393 ?auto_1411402 ) ) ( not ( = ?auto_1411393 ?auto_1411403 ) ) ( not ( = ?auto_1411393 ?auto_1411409 ) ) ( not ( = ?auto_1411397 ?auto_1411399 ) ) ( not ( = ?auto_1411397 ?auto_1411398 ) ) ( not ( = ?auto_1411397 ?auto_1411400 ) ) ( not ( = ?auto_1411397 ?auto_1411401 ) ) ( not ( = ?auto_1411397 ?auto_1411402 ) ) ( not ( = ?auto_1411397 ?auto_1411403 ) ) ( not ( = ?auto_1411397 ?auto_1411409 ) ) ( not ( = ?auto_1411399 ?auto_1411398 ) ) ( not ( = ?auto_1411399 ?auto_1411400 ) ) ( not ( = ?auto_1411399 ?auto_1411401 ) ) ( not ( = ?auto_1411399 ?auto_1411402 ) ) ( not ( = ?auto_1411399 ?auto_1411403 ) ) ( not ( = ?auto_1411399 ?auto_1411409 ) ) ( not ( = ?auto_1411398 ?auto_1411400 ) ) ( not ( = ?auto_1411398 ?auto_1411401 ) ) ( not ( = ?auto_1411398 ?auto_1411402 ) ) ( not ( = ?auto_1411398 ?auto_1411403 ) ) ( not ( = ?auto_1411398 ?auto_1411409 ) ) ( not ( = ?auto_1411400 ?auto_1411401 ) ) ( not ( = ?auto_1411400 ?auto_1411402 ) ) ( not ( = ?auto_1411400 ?auto_1411403 ) ) ( not ( = ?auto_1411400 ?auto_1411409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411401 ?auto_1411402 ?auto_1411403 )
      ( MAKE-10CRATE-VERIFY ?auto_1411394 ?auto_1411395 ?auto_1411396 ?auto_1411393 ?auto_1411397 ?auto_1411399 ?auto_1411398 ?auto_1411400 ?auto_1411401 ?auto_1411402 ?auto_1411403 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1411411 - SURFACE
      ?auto_1411412 - SURFACE
      ?auto_1411413 - SURFACE
      ?auto_1411410 - SURFACE
      ?auto_1411414 - SURFACE
      ?auto_1411416 - SURFACE
      ?auto_1411415 - SURFACE
      ?auto_1411417 - SURFACE
      ?auto_1411418 - SURFACE
      ?auto_1411419 - SURFACE
      ?auto_1411420 - SURFACE
      ?auto_1411421 - SURFACE
    )
    :vars
    (
      ?auto_1411424 - HOIST
      ?auto_1411423 - PLACE
      ?auto_1411425 - PLACE
      ?auto_1411426 - HOIST
      ?auto_1411427 - SURFACE
      ?auto_1411422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411424 ?auto_1411423 ) ( IS-CRATE ?auto_1411421 ) ( not ( = ?auto_1411420 ?auto_1411421 ) ) ( not ( = ?auto_1411419 ?auto_1411420 ) ) ( not ( = ?auto_1411419 ?auto_1411421 ) ) ( not ( = ?auto_1411425 ?auto_1411423 ) ) ( HOIST-AT ?auto_1411426 ?auto_1411425 ) ( not ( = ?auto_1411424 ?auto_1411426 ) ) ( SURFACE-AT ?auto_1411421 ?auto_1411425 ) ( ON ?auto_1411421 ?auto_1411427 ) ( CLEAR ?auto_1411421 ) ( not ( = ?auto_1411420 ?auto_1411427 ) ) ( not ( = ?auto_1411421 ?auto_1411427 ) ) ( not ( = ?auto_1411419 ?auto_1411427 ) ) ( SURFACE-AT ?auto_1411419 ?auto_1411423 ) ( CLEAR ?auto_1411419 ) ( IS-CRATE ?auto_1411420 ) ( AVAILABLE ?auto_1411424 ) ( TRUCK-AT ?auto_1411422 ?auto_1411425 ) ( LIFTING ?auto_1411426 ?auto_1411420 ) ( ON ?auto_1411412 ?auto_1411411 ) ( ON ?auto_1411413 ?auto_1411412 ) ( ON ?auto_1411410 ?auto_1411413 ) ( ON ?auto_1411414 ?auto_1411410 ) ( ON ?auto_1411416 ?auto_1411414 ) ( ON ?auto_1411415 ?auto_1411416 ) ( ON ?auto_1411417 ?auto_1411415 ) ( ON ?auto_1411418 ?auto_1411417 ) ( ON ?auto_1411419 ?auto_1411418 ) ( not ( = ?auto_1411411 ?auto_1411412 ) ) ( not ( = ?auto_1411411 ?auto_1411413 ) ) ( not ( = ?auto_1411411 ?auto_1411410 ) ) ( not ( = ?auto_1411411 ?auto_1411414 ) ) ( not ( = ?auto_1411411 ?auto_1411416 ) ) ( not ( = ?auto_1411411 ?auto_1411415 ) ) ( not ( = ?auto_1411411 ?auto_1411417 ) ) ( not ( = ?auto_1411411 ?auto_1411418 ) ) ( not ( = ?auto_1411411 ?auto_1411419 ) ) ( not ( = ?auto_1411411 ?auto_1411420 ) ) ( not ( = ?auto_1411411 ?auto_1411421 ) ) ( not ( = ?auto_1411411 ?auto_1411427 ) ) ( not ( = ?auto_1411412 ?auto_1411413 ) ) ( not ( = ?auto_1411412 ?auto_1411410 ) ) ( not ( = ?auto_1411412 ?auto_1411414 ) ) ( not ( = ?auto_1411412 ?auto_1411416 ) ) ( not ( = ?auto_1411412 ?auto_1411415 ) ) ( not ( = ?auto_1411412 ?auto_1411417 ) ) ( not ( = ?auto_1411412 ?auto_1411418 ) ) ( not ( = ?auto_1411412 ?auto_1411419 ) ) ( not ( = ?auto_1411412 ?auto_1411420 ) ) ( not ( = ?auto_1411412 ?auto_1411421 ) ) ( not ( = ?auto_1411412 ?auto_1411427 ) ) ( not ( = ?auto_1411413 ?auto_1411410 ) ) ( not ( = ?auto_1411413 ?auto_1411414 ) ) ( not ( = ?auto_1411413 ?auto_1411416 ) ) ( not ( = ?auto_1411413 ?auto_1411415 ) ) ( not ( = ?auto_1411413 ?auto_1411417 ) ) ( not ( = ?auto_1411413 ?auto_1411418 ) ) ( not ( = ?auto_1411413 ?auto_1411419 ) ) ( not ( = ?auto_1411413 ?auto_1411420 ) ) ( not ( = ?auto_1411413 ?auto_1411421 ) ) ( not ( = ?auto_1411413 ?auto_1411427 ) ) ( not ( = ?auto_1411410 ?auto_1411414 ) ) ( not ( = ?auto_1411410 ?auto_1411416 ) ) ( not ( = ?auto_1411410 ?auto_1411415 ) ) ( not ( = ?auto_1411410 ?auto_1411417 ) ) ( not ( = ?auto_1411410 ?auto_1411418 ) ) ( not ( = ?auto_1411410 ?auto_1411419 ) ) ( not ( = ?auto_1411410 ?auto_1411420 ) ) ( not ( = ?auto_1411410 ?auto_1411421 ) ) ( not ( = ?auto_1411410 ?auto_1411427 ) ) ( not ( = ?auto_1411414 ?auto_1411416 ) ) ( not ( = ?auto_1411414 ?auto_1411415 ) ) ( not ( = ?auto_1411414 ?auto_1411417 ) ) ( not ( = ?auto_1411414 ?auto_1411418 ) ) ( not ( = ?auto_1411414 ?auto_1411419 ) ) ( not ( = ?auto_1411414 ?auto_1411420 ) ) ( not ( = ?auto_1411414 ?auto_1411421 ) ) ( not ( = ?auto_1411414 ?auto_1411427 ) ) ( not ( = ?auto_1411416 ?auto_1411415 ) ) ( not ( = ?auto_1411416 ?auto_1411417 ) ) ( not ( = ?auto_1411416 ?auto_1411418 ) ) ( not ( = ?auto_1411416 ?auto_1411419 ) ) ( not ( = ?auto_1411416 ?auto_1411420 ) ) ( not ( = ?auto_1411416 ?auto_1411421 ) ) ( not ( = ?auto_1411416 ?auto_1411427 ) ) ( not ( = ?auto_1411415 ?auto_1411417 ) ) ( not ( = ?auto_1411415 ?auto_1411418 ) ) ( not ( = ?auto_1411415 ?auto_1411419 ) ) ( not ( = ?auto_1411415 ?auto_1411420 ) ) ( not ( = ?auto_1411415 ?auto_1411421 ) ) ( not ( = ?auto_1411415 ?auto_1411427 ) ) ( not ( = ?auto_1411417 ?auto_1411418 ) ) ( not ( = ?auto_1411417 ?auto_1411419 ) ) ( not ( = ?auto_1411417 ?auto_1411420 ) ) ( not ( = ?auto_1411417 ?auto_1411421 ) ) ( not ( = ?auto_1411417 ?auto_1411427 ) ) ( not ( = ?auto_1411418 ?auto_1411419 ) ) ( not ( = ?auto_1411418 ?auto_1411420 ) ) ( not ( = ?auto_1411418 ?auto_1411421 ) ) ( not ( = ?auto_1411418 ?auto_1411427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411419 ?auto_1411420 ?auto_1411421 )
      ( MAKE-11CRATE-VERIFY ?auto_1411411 ?auto_1411412 ?auto_1411413 ?auto_1411410 ?auto_1411414 ?auto_1411416 ?auto_1411415 ?auto_1411417 ?auto_1411418 ?auto_1411419 ?auto_1411420 ?auto_1411421 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1411429 - SURFACE
      ?auto_1411430 - SURFACE
      ?auto_1411431 - SURFACE
      ?auto_1411428 - SURFACE
      ?auto_1411432 - SURFACE
      ?auto_1411434 - SURFACE
      ?auto_1411433 - SURFACE
      ?auto_1411435 - SURFACE
      ?auto_1411436 - SURFACE
      ?auto_1411437 - SURFACE
      ?auto_1411438 - SURFACE
      ?auto_1411439 - SURFACE
      ?auto_1411440 - SURFACE
    )
    :vars
    (
      ?auto_1411443 - HOIST
      ?auto_1411442 - PLACE
      ?auto_1411444 - PLACE
      ?auto_1411445 - HOIST
      ?auto_1411446 - SURFACE
      ?auto_1411441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411443 ?auto_1411442 ) ( IS-CRATE ?auto_1411440 ) ( not ( = ?auto_1411439 ?auto_1411440 ) ) ( not ( = ?auto_1411438 ?auto_1411439 ) ) ( not ( = ?auto_1411438 ?auto_1411440 ) ) ( not ( = ?auto_1411444 ?auto_1411442 ) ) ( HOIST-AT ?auto_1411445 ?auto_1411444 ) ( not ( = ?auto_1411443 ?auto_1411445 ) ) ( SURFACE-AT ?auto_1411440 ?auto_1411444 ) ( ON ?auto_1411440 ?auto_1411446 ) ( CLEAR ?auto_1411440 ) ( not ( = ?auto_1411439 ?auto_1411446 ) ) ( not ( = ?auto_1411440 ?auto_1411446 ) ) ( not ( = ?auto_1411438 ?auto_1411446 ) ) ( SURFACE-AT ?auto_1411438 ?auto_1411442 ) ( CLEAR ?auto_1411438 ) ( IS-CRATE ?auto_1411439 ) ( AVAILABLE ?auto_1411443 ) ( TRUCK-AT ?auto_1411441 ?auto_1411444 ) ( LIFTING ?auto_1411445 ?auto_1411439 ) ( ON ?auto_1411430 ?auto_1411429 ) ( ON ?auto_1411431 ?auto_1411430 ) ( ON ?auto_1411428 ?auto_1411431 ) ( ON ?auto_1411432 ?auto_1411428 ) ( ON ?auto_1411434 ?auto_1411432 ) ( ON ?auto_1411433 ?auto_1411434 ) ( ON ?auto_1411435 ?auto_1411433 ) ( ON ?auto_1411436 ?auto_1411435 ) ( ON ?auto_1411437 ?auto_1411436 ) ( ON ?auto_1411438 ?auto_1411437 ) ( not ( = ?auto_1411429 ?auto_1411430 ) ) ( not ( = ?auto_1411429 ?auto_1411431 ) ) ( not ( = ?auto_1411429 ?auto_1411428 ) ) ( not ( = ?auto_1411429 ?auto_1411432 ) ) ( not ( = ?auto_1411429 ?auto_1411434 ) ) ( not ( = ?auto_1411429 ?auto_1411433 ) ) ( not ( = ?auto_1411429 ?auto_1411435 ) ) ( not ( = ?auto_1411429 ?auto_1411436 ) ) ( not ( = ?auto_1411429 ?auto_1411437 ) ) ( not ( = ?auto_1411429 ?auto_1411438 ) ) ( not ( = ?auto_1411429 ?auto_1411439 ) ) ( not ( = ?auto_1411429 ?auto_1411440 ) ) ( not ( = ?auto_1411429 ?auto_1411446 ) ) ( not ( = ?auto_1411430 ?auto_1411431 ) ) ( not ( = ?auto_1411430 ?auto_1411428 ) ) ( not ( = ?auto_1411430 ?auto_1411432 ) ) ( not ( = ?auto_1411430 ?auto_1411434 ) ) ( not ( = ?auto_1411430 ?auto_1411433 ) ) ( not ( = ?auto_1411430 ?auto_1411435 ) ) ( not ( = ?auto_1411430 ?auto_1411436 ) ) ( not ( = ?auto_1411430 ?auto_1411437 ) ) ( not ( = ?auto_1411430 ?auto_1411438 ) ) ( not ( = ?auto_1411430 ?auto_1411439 ) ) ( not ( = ?auto_1411430 ?auto_1411440 ) ) ( not ( = ?auto_1411430 ?auto_1411446 ) ) ( not ( = ?auto_1411431 ?auto_1411428 ) ) ( not ( = ?auto_1411431 ?auto_1411432 ) ) ( not ( = ?auto_1411431 ?auto_1411434 ) ) ( not ( = ?auto_1411431 ?auto_1411433 ) ) ( not ( = ?auto_1411431 ?auto_1411435 ) ) ( not ( = ?auto_1411431 ?auto_1411436 ) ) ( not ( = ?auto_1411431 ?auto_1411437 ) ) ( not ( = ?auto_1411431 ?auto_1411438 ) ) ( not ( = ?auto_1411431 ?auto_1411439 ) ) ( not ( = ?auto_1411431 ?auto_1411440 ) ) ( not ( = ?auto_1411431 ?auto_1411446 ) ) ( not ( = ?auto_1411428 ?auto_1411432 ) ) ( not ( = ?auto_1411428 ?auto_1411434 ) ) ( not ( = ?auto_1411428 ?auto_1411433 ) ) ( not ( = ?auto_1411428 ?auto_1411435 ) ) ( not ( = ?auto_1411428 ?auto_1411436 ) ) ( not ( = ?auto_1411428 ?auto_1411437 ) ) ( not ( = ?auto_1411428 ?auto_1411438 ) ) ( not ( = ?auto_1411428 ?auto_1411439 ) ) ( not ( = ?auto_1411428 ?auto_1411440 ) ) ( not ( = ?auto_1411428 ?auto_1411446 ) ) ( not ( = ?auto_1411432 ?auto_1411434 ) ) ( not ( = ?auto_1411432 ?auto_1411433 ) ) ( not ( = ?auto_1411432 ?auto_1411435 ) ) ( not ( = ?auto_1411432 ?auto_1411436 ) ) ( not ( = ?auto_1411432 ?auto_1411437 ) ) ( not ( = ?auto_1411432 ?auto_1411438 ) ) ( not ( = ?auto_1411432 ?auto_1411439 ) ) ( not ( = ?auto_1411432 ?auto_1411440 ) ) ( not ( = ?auto_1411432 ?auto_1411446 ) ) ( not ( = ?auto_1411434 ?auto_1411433 ) ) ( not ( = ?auto_1411434 ?auto_1411435 ) ) ( not ( = ?auto_1411434 ?auto_1411436 ) ) ( not ( = ?auto_1411434 ?auto_1411437 ) ) ( not ( = ?auto_1411434 ?auto_1411438 ) ) ( not ( = ?auto_1411434 ?auto_1411439 ) ) ( not ( = ?auto_1411434 ?auto_1411440 ) ) ( not ( = ?auto_1411434 ?auto_1411446 ) ) ( not ( = ?auto_1411433 ?auto_1411435 ) ) ( not ( = ?auto_1411433 ?auto_1411436 ) ) ( not ( = ?auto_1411433 ?auto_1411437 ) ) ( not ( = ?auto_1411433 ?auto_1411438 ) ) ( not ( = ?auto_1411433 ?auto_1411439 ) ) ( not ( = ?auto_1411433 ?auto_1411440 ) ) ( not ( = ?auto_1411433 ?auto_1411446 ) ) ( not ( = ?auto_1411435 ?auto_1411436 ) ) ( not ( = ?auto_1411435 ?auto_1411437 ) ) ( not ( = ?auto_1411435 ?auto_1411438 ) ) ( not ( = ?auto_1411435 ?auto_1411439 ) ) ( not ( = ?auto_1411435 ?auto_1411440 ) ) ( not ( = ?auto_1411435 ?auto_1411446 ) ) ( not ( = ?auto_1411436 ?auto_1411437 ) ) ( not ( = ?auto_1411436 ?auto_1411438 ) ) ( not ( = ?auto_1411436 ?auto_1411439 ) ) ( not ( = ?auto_1411436 ?auto_1411440 ) ) ( not ( = ?auto_1411436 ?auto_1411446 ) ) ( not ( = ?auto_1411437 ?auto_1411438 ) ) ( not ( = ?auto_1411437 ?auto_1411439 ) ) ( not ( = ?auto_1411437 ?auto_1411440 ) ) ( not ( = ?auto_1411437 ?auto_1411446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411438 ?auto_1411439 ?auto_1411440 )
      ( MAKE-12CRATE-VERIFY ?auto_1411429 ?auto_1411430 ?auto_1411431 ?auto_1411428 ?auto_1411432 ?auto_1411434 ?auto_1411433 ?auto_1411435 ?auto_1411436 ?auto_1411437 ?auto_1411438 ?auto_1411439 ?auto_1411440 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1411448 - SURFACE
      ?auto_1411449 - SURFACE
      ?auto_1411450 - SURFACE
      ?auto_1411447 - SURFACE
      ?auto_1411451 - SURFACE
      ?auto_1411453 - SURFACE
      ?auto_1411452 - SURFACE
      ?auto_1411454 - SURFACE
      ?auto_1411455 - SURFACE
      ?auto_1411456 - SURFACE
      ?auto_1411457 - SURFACE
      ?auto_1411458 - SURFACE
      ?auto_1411459 - SURFACE
      ?auto_1411460 - SURFACE
    )
    :vars
    (
      ?auto_1411463 - HOIST
      ?auto_1411462 - PLACE
      ?auto_1411464 - PLACE
      ?auto_1411465 - HOIST
      ?auto_1411466 - SURFACE
      ?auto_1411461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411463 ?auto_1411462 ) ( IS-CRATE ?auto_1411460 ) ( not ( = ?auto_1411459 ?auto_1411460 ) ) ( not ( = ?auto_1411458 ?auto_1411459 ) ) ( not ( = ?auto_1411458 ?auto_1411460 ) ) ( not ( = ?auto_1411464 ?auto_1411462 ) ) ( HOIST-AT ?auto_1411465 ?auto_1411464 ) ( not ( = ?auto_1411463 ?auto_1411465 ) ) ( SURFACE-AT ?auto_1411460 ?auto_1411464 ) ( ON ?auto_1411460 ?auto_1411466 ) ( CLEAR ?auto_1411460 ) ( not ( = ?auto_1411459 ?auto_1411466 ) ) ( not ( = ?auto_1411460 ?auto_1411466 ) ) ( not ( = ?auto_1411458 ?auto_1411466 ) ) ( SURFACE-AT ?auto_1411458 ?auto_1411462 ) ( CLEAR ?auto_1411458 ) ( IS-CRATE ?auto_1411459 ) ( AVAILABLE ?auto_1411463 ) ( TRUCK-AT ?auto_1411461 ?auto_1411464 ) ( LIFTING ?auto_1411465 ?auto_1411459 ) ( ON ?auto_1411449 ?auto_1411448 ) ( ON ?auto_1411450 ?auto_1411449 ) ( ON ?auto_1411447 ?auto_1411450 ) ( ON ?auto_1411451 ?auto_1411447 ) ( ON ?auto_1411453 ?auto_1411451 ) ( ON ?auto_1411452 ?auto_1411453 ) ( ON ?auto_1411454 ?auto_1411452 ) ( ON ?auto_1411455 ?auto_1411454 ) ( ON ?auto_1411456 ?auto_1411455 ) ( ON ?auto_1411457 ?auto_1411456 ) ( ON ?auto_1411458 ?auto_1411457 ) ( not ( = ?auto_1411448 ?auto_1411449 ) ) ( not ( = ?auto_1411448 ?auto_1411450 ) ) ( not ( = ?auto_1411448 ?auto_1411447 ) ) ( not ( = ?auto_1411448 ?auto_1411451 ) ) ( not ( = ?auto_1411448 ?auto_1411453 ) ) ( not ( = ?auto_1411448 ?auto_1411452 ) ) ( not ( = ?auto_1411448 ?auto_1411454 ) ) ( not ( = ?auto_1411448 ?auto_1411455 ) ) ( not ( = ?auto_1411448 ?auto_1411456 ) ) ( not ( = ?auto_1411448 ?auto_1411457 ) ) ( not ( = ?auto_1411448 ?auto_1411458 ) ) ( not ( = ?auto_1411448 ?auto_1411459 ) ) ( not ( = ?auto_1411448 ?auto_1411460 ) ) ( not ( = ?auto_1411448 ?auto_1411466 ) ) ( not ( = ?auto_1411449 ?auto_1411450 ) ) ( not ( = ?auto_1411449 ?auto_1411447 ) ) ( not ( = ?auto_1411449 ?auto_1411451 ) ) ( not ( = ?auto_1411449 ?auto_1411453 ) ) ( not ( = ?auto_1411449 ?auto_1411452 ) ) ( not ( = ?auto_1411449 ?auto_1411454 ) ) ( not ( = ?auto_1411449 ?auto_1411455 ) ) ( not ( = ?auto_1411449 ?auto_1411456 ) ) ( not ( = ?auto_1411449 ?auto_1411457 ) ) ( not ( = ?auto_1411449 ?auto_1411458 ) ) ( not ( = ?auto_1411449 ?auto_1411459 ) ) ( not ( = ?auto_1411449 ?auto_1411460 ) ) ( not ( = ?auto_1411449 ?auto_1411466 ) ) ( not ( = ?auto_1411450 ?auto_1411447 ) ) ( not ( = ?auto_1411450 ?auto_1411451 ) ) ( not ( = ?auto_1411450 ?auto_1411453 ) ) ( not ( = ?auto_1411450 ?auto_1411452 ) ) ( not ( = ?auto_1411450 ?auto_1411454 ) ) ( not ( = ?auto_1411450 ?auto_1411455 ) ) ( not ( = ?auto_1411450 ?auto_1411456 ) ) ( not ( = ?auto_1411450 ?auto_1411457 ) ) ( not ( = ?auto_1411450 ?auto_1411458 ) ) ( not ( = ?auto_1411450 ?auto_1411459 ) ) ( not ( = ?auto_1411450 ?auto_1411460 ) ) ( not ( = ?auto_1411450 ?auto_1411466 ) ) ( not ( = ?auto_1411447 ?auto_1411451 ) ) ( not ( = ?auto_1411447 ?auto_1411453 ) ) ( not ( = ?auto_1411447 ?auto_1411452 ) ) ( not ( = ?auto_1411447 ?auto_1411454 ) ) ( not ( = ?auto_1411447 ?auto_1411455 ) ) ( not ( = ?auto_1411447 ?auto_1411456 ) ) ( not ( = ?auto_1411447 ?auto_1411457 ) ) ( not ( = ?auto_1411447 ?auto_1411458 ) ) ( not ( = ?auto_1411447 ?auto_1411459 ) ) ( not ( = ?auto_1411447 ?auto_1411460 ) ) ( not ( = ?auto_1411447 ?auto_1411466 ) ) ( not ( = ?auto_1411451 ?auto_1411453 ) ) ( not ( = ?auto_1411451 ?auto_1411452 ) ) ( not ( = ?auto_1411451 ?auto_1411454 ) ) ( not ( = ?auto_1411451 ?auto_1411455 ) ) ( not ( = ?auto_1411451 ?auto_1411456 ) ) ( not ( = ?auto_1411451 ?auto_1411457 ) ) ( not ( = ?auto_1411451 ?auto_1411458 ) ) ( not ( = ?auto_1411451 ?auto_1411459 ) ) ( not ( = ?auto_1411451 ?auto_1411460 ) ) ( not ( = ?auto_1411451 ?auto_1411466 ) ) ( not ( = ?auto_1411453 ?auto_1411452 ) ) ( not ( = ?auto_1411453 ?auto_1411454 ) ) ( not ( = ?auto_1411453 ?auto_1411455 ) ) ( not ( = ?auto_1411453 ?auto_1411456 ) ) ( not ( = ?auto_1411453 ?auto_1411457 ) ) ( not ( = ?auto_1411453 ?auto_1411458 ) ) ( not ( = ?auto_1411453 ?auto_1411459 ) ) ( not ( = ?auto_1411453 ?auto_1411460 ) ) ( not ( = ?auto_1411453 ?auto_1411466 ) ) ( not ( = ?auto_1411452 ?auto_1411454 ) ) ( not ( = ?auto_1411452 ?auto_1411455 ) ) ( not ( = ?auto_1411452 ?auto_1411456 ) ) ( not ( = ?auto_1411452 ?auto_1411457 ) ) ( not ( = ?auto_1411452 ?auto_1411458 ) ) ( not ( = ?auto_1411452 ?auto_1411459 ) ) ( not ( = ?auto_1411452 ?auto_1411460 ) ) ( not ( = ?auto_1411452 ?auto_1411466 ) ) ( not ( = ?auto_1411454 ?auto_1411455 ) ) ( not ( = ?auto_1411454 ?auto_1411456 ) ) ( not ( = ?auto_1411454 ?auto_1411457 ) ) ( not ( = ?auto_1411454 ?auto_1411458 ) ) ( not ( = ?auto_1411454 ?auto_1411459 ) ) ( not ( = ?auto_1411454 ?auto_1411460 ) ) ( not ( = ?auto_1411454 ?auto_1411466 ) ) ( not ( = ?auto_1411455 ?auto_1411456 ) ) ( not ( = ?auto_1411455 ?auto_1411457 ) ) ( not ( = ?auto_1411455 ?auto_1411458 ) ) ( not ( = ?auto_1411455 ?auto_1411459 ) ) ( not ( = ?auto_1411455 ?auto_1411460 ) ) ( not ( = ?auto_1411455 ?auto_1411466 ) ) ( not ( = ?auto_1411456 ?auto_1411457 ) ) ( not ( = ?auto_1411456 ?auto_1411458 ) ) ( not ( = ?auto_1411456 ?auto_1411459 ) ) ( not ( = ?auto_1411456 ?auto_1411460 ) ) ( not ( = ?auto_1411456 ?auto_1411466 ) ) ( not ( = ?auto_1411457 ?auto_1411458 ) ) ( not ( = ?auto_1411457 ?auto_1411459 ) ) ( not ( = ?auto_1411457 ?auto_1411460 ) ) ( not ( = ?auto_1411457 ?auto_1411466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411458 ?auto_1411459 ?auto_1411460 )
      ( MAKE-13CRATE-VERIFY ?auto_1411448 ?auto_1411449 ?auto_1411450 ?auto_1411447 ?auto_1411451 ?auto_1411453 ?auto_1411452 ?auto_1411454 ?auto_1411455 ?auto_1411456 ?auto_1411457 ?auto_1411458 ?auto_1411459 ?auto_1411460 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1411468 - SURFACE
      ?auto_1411469 - SURFACE
      ?auto_1411470 - SURFACE
      ?auto_1411467 - SURFACE
      ?auto_1411471 - SURFACE
      ?auto_1411473 - SURFACE
      ?auto_1411472 - SURFACE
      ?auto_1411474 - SURFACE
      ?auto_1411475 - SURFACE
      ?auto_1411476 - SURFACE
      ?auto_1411477 - SURFACE
      ?auto_1411478 - SURFACE
      ?auto_1411479 - SURFACE
      ?auto_1411480 - SURFACE
      ?auto_1411481 - SURFACE
    )
    :vars
    (
      ?auto_1411484 - HOIST
      ?auto_1411483 - PLACE
      ?auto_1411485 - PLACE
      ?auto_1411486 - HOIST
      ?auto_1411487 - SURFACE
      ?auto_1411482 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411484 ?auto_1411483 ) ( IS-CRATE ?auto_1411481 ) ( not ( = ?auto_1411480 ?auto_1411481 ) ) ( not ( = ?auto_1411479 ?auto_1411480 ) ) ( not ( = ?auto_1411479 ?auto_1411481 ) ) ( not ( = ?auto_1411485 ?auto_1411483 ) ) ( HOIST-AT ?auto_1411486 ?auto_1411485 ) ( not ( = ?auto_1411484 ?auto_1411486 ) ) ( SURFACE-AT ?auto_1411481 ?auto_1411485 ) ( ON ?auto_1411481 ?auto_1411487 ) ( CLEAR ?auto_1411481 ) ( not ( = ?auto_1411480 ?auto_1411487 ) ) ( not ( = ?auto_1411481 ?auto_1411487 ) ) ( not ( = ?auto_1411479 ?auto_1411487 ) ) ( SURFACE-AT ?auto_1411479 ?auto_1411483 ) ( CLEAR ?auto_1411479 ) ( IS-CRATE ?auto_1411480 ) ( AVAILABLE ?auto_1411484 ) ( TRUCK-AT ?auto_1411482 ?auto_1411485 ) ( LIFTING ?auto_1411486 ?auto_1411480 ) ( ON ?auto_1411469 ?auto_1411468 ) ( ON ?auto_1411470 ?auto_1411469 ) ( ON ?auto_1411467 ?auto_1411470 ) ( ON ?auto_1411471 ?auto_1411467 ) ( ON ?auto_1411473 ?auto_1411471 ) ( ON ?auto_1411472 ?auto_1411473 ) ( ON ?auto_1411474 ?auto_1411472 ) ( ON ?auto_1411475 ?auto_1411474 ) ( ON ?auto_1411476 ?auto_1411475 ) ( ON ?auto_1411477 ?auto_1411476 ) ( ON ?auto_1411478 ?auto_1411477 ) ( ON ?auto_1411479 ?auto_1411478 ) ( not ( = ?auto_1411468 ?auto_1411469 ) ) ( not ( = ?auto_1411468 ?auto_1411470 ) ) ( not ( = ?auto_1411468 ?auto_1411467 ) ) ( not ( = ?auto_1411468 ?auto_1411471 ) ) ( not ( = ?auto_1411468 ?auto_1411473 ) ) ( not ( = ?auto_1411468 ?auto_1411472 ) ) ( not ( = ?auto_1411468 ?auto_1411474 ) ) ( not ( = ?auto_1411468 ?auto_1411475 ) ) ( not ( = ?auto_1411468 ?auto_1411476 ) ) ( not ( = ?auto_1411468 ?auto_1411477 ) ) ( not ( = ?auto_1411468 ?auto_1411478 ) ) ( not ( = ?auto_1411468 ?auto_1411479 ) ) ( not ( = ?auto_1411468 ?auto_1411480 ) ) ( not ( = ?auto_1411468 ?auto_1411481 ) ) ( not ( = ?auto_1411468 ?auto_1411487 ) ) ( not ( = ?auto_1411469 ?auto_1411470 ) ) ( not ( = ?auto_1411469 ?auto_1411467 ) ) ( not ( = ?auto_1411469 ?auto_1411471 ) ) ( not ( = ?auto_1411469 ?auto_1411473 ) ) ( not ( = ?auto_1411469 ?auto_1411472 ) ) ( not ( = ?auto_1411469 ?auto_1411474 ) ) ( not ( = ?auto_1411469 ?auto_1411475 ) ) ( not ( = ?auto_1411469 ?auto_1411476 ) ) ( not ( = ?auto_1411469 ?auto_1411477 ) ) ( not ( = ?auto_1411469 ?auto_1411478 ) ) ( not ( = ?auto_1411469 ?auto_1411479 ) ) ( not ( = ?auto_1411469 ?auto_1411480 ) ) ( not ( = ?auto_1411469 ?auto_1411481 ) ) ( not ( = ?auto_1411469 ?auto_1411487 ) ) ( not ( = ?auto_1411470 ?auto_1411467 ) ) ( not ( = ?auto_1411470 ?auto_1411471 ) ) ( not ( = ?auto_1411470 ?auto_1411473 ) ) ( not ( = ?auto_1411470 ?auto_1411472 ) ) ( not ( = ?auto_1411470 ?auto_1411474 ) ) ( not ( = ?auto_1411470 ?auto_1411475 ) ) ( not ( = ?auto_1411470 ?auto_1411476 ) ) ( not ( = ?auto_1411470 ?auto_1411477 ) ) ( not ( = ?auto_1411470 ?auto_1411478 ) ) ( not ( = ?auto_1411470 ?auto_1411479 ) ) ( not ( = ?auto_1411470 ?auto_1411480 ) ) ( not ( = ?auto_1411470 ?auto_1411481 ) ) ( not ( = ?auto_1411470 ?auto_1411487 ) ) ( not ( = ?auto_1411467 ?auto_1411471 ) ) ( not ( = ?auto_1411467 ?auto_1411473 ) ) ( not ( = ?auto_1411467 ?auto_1411472 ) ) ( not ( = ?auto_1411467 ?auto_1411474 ) ) ( not ( = ?auto_1411467 ?auto_1411475 ) ) ( not ( = ?auto_1411467 ?auto_1411476 ) ) ( not ( = ?auto_1411467 ?auto_1411477 ) ) ( not ( = ?auto_1411467 ?auto_1411478 ) ) ( not ( = ?auto_1411467 ?auto_1411479 ) ) ( not ( = ?auto_1411467 ?auto_1411480 ) ) ( not ( = ?auto_1411467 ?auto_1411481 ) ) ( not ( = ?auto_1411467 ?auto_1411487 ) ) ( not ( = ?auto_1411471 ?auto_1411473 ) ) ( not ( = ?auto_1411471 ?auto_1411472 ) ) ( not ( = ?auto_1411471 ?auto_1411474 ) ) ( not ( = ?auto_1411471 ?auto_1411475 ) ) ( not ( = ?auto_1411471 ?auto_1411476 ) ) ( not ( = ?auto_1411471 ?auto_1411477 ) ) ( not ( = ?auto_1411471 ?auto_1411478 ) ) ( not ( = ?auto_1411471 ?auto_1411479 ) ) ( not ( = ?auto_1411471 ?auto_1411480 ) ) ( not ( = ?auto_1411471 ?auto_1411481 ) ) ( not ( = ?auto_1411471 ?auto_1411487 ) ) ( not ( = ?auto_1411473 ?auto_1411472 ) ) ( not ( = ?auto_1411473 ?auto_1411474 ) ) ( not ( = ?auto_1411473 ?auto_1411475 ) ) ( not ( = ?auto_1411473 ?auto_1411476 ) ) ( not ( = ?auto_1411473 ?auto_1411477 ) ) ( not ( = ?auto_1411473 ?auto_1411478 ) ) ( not ( = ?auto_1411473 ?auto_1411479 ) ) ( not ( = ?auto_1411473 ?auto_1411480 ) ) ( not ( = ?auto_1411473 ?auto_1411481 ) ) ( not ( = ?auto_1411473 ?auto_1411487 ) ) ( not ( = ?auto_1411472 ?auto_1411474 ) ) ( not ( = ?auto_1411472 ?auto_1411475 ) ) ( not ( = ?auto_1411472 ?auto_1411476 ) ) ( not ( = ?auto_1411472 ?auto_1411477 ) ) ( not ( = ?auto_1411472 ?auto_1411478 ) ) ( not ( = ?auto_1411472 ?auto_1411479 ) ) ( not ( = ?auto_1411472 ?auto_1411480 ) ) ( not ( = ?auto_1411472 ?auto_1411481 ) ) ( not ( = ?auto_1411472 ?auto_1411487 ) ) ( not ( = ?auto_1411474 ?auto_1411475 ) ) ( not ( = ?auto_1411474 ?auto_1411476 ) ) ( not ( = ?auto_1411474 ?auto_1411477 ) ) ( not ( = ?auto_1411474 ?auto_1411478 ) ) ( not ( = ?auto_1411474 ?auto_1411479 ) ) ( not ( = ?auto_1411474 ?auto_1411480 ) ) ( not ( = ?auto_1411474 ?auto_1411481 ) ) ( not ( = ?auto_1411474 ?auto_1411487 ) ) ( not ( = ?auto_1411475 ?auto_1411476 ) ) ( not ( = ?auto_1411475 ?auto_1411477 ) ) ( not ( = ?auto_1411475 ?auto_1411478 ) ) ( not ( = ?auto_1411475 ?auto_1411479 ) ) ( not ( = ?auto_1411475 ?auto_1411480 ) ) ( not ( = ?auto_1411475 ?auto_1411481 ) ) ( not ( = ?auto_1411475 ?auto_1411487 ) ) ( not ( = ?auto_1411476 ?auto_1411477 ) ) ( not ( = ?auto_1411476 ?auto_1411478 ) ) ( not ( = ?auto_1411476 ?auto_1411479 ) ) ( not ( = ?auto_1411476 ?auto_1411480 ) ) ( not ( = ?auto_1411476 ?auto_1411481 ) ) ( not ( = ?auto_1411476 ?auto_1411487 ) ) ( not ( = ?auto_1411477 ?auto_1411478 ) ) ( not ( = ?auto_1411477 ?auto_1411479 ) ) ( not ( = ?auto_1411477 ?auto_1411480 ) ) ( not ( = ?auto_1411477 ?auto_1411481 ) ) ( not ( = ?auto_1411477 ?auto_1411487 ) ) ( not ( = ?auto_1411478 ?auto_1411479 ) ) ( not ( = ?auto_1411478 ?auto_1411480 ) ) ( not ( = ?auto_1411478 ?auto_1411481 ) ) ( not ( = ?auto_1411478 ?auto_1411487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411479 ?auto_1411480 ?auto_1411481 )
      ( MAKE-14CRATE-VERIFY ?auto_1411468 ?auto_1411469 ?auto_1411470 ?auto_1411467 ?auto_1411471 ?auto_1411473 ?auto_1411472 ?auto_1411474 ?auto_1411475 ?auto_1411476 ?auto_1411477 ?auto_1411478 ?auto_1411479 ?auto_1411480 ?auto_1411481 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1411488 - SURFACE
      ?auto_1411489 - SURFACE
    )
    :vars
    (
      ?auto_1411493 - HOIST
      ?auto_1411492 - PLACE
      ?auto_1411490 - SURFACE
      ?auto_1411494 - PLACE
      ?auto_1411495 - HOIST
      ?auto_1411496 - SURFACE
      ?auto_1411491 - TRUCK
      ?auto_1411497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411493 ?auto_1411492 ) ( IS-CRATE ?auto_1411489 ) ( not ( = ?auto_1411488 ?auto_1411489 ) ) ( not ( = ?auto_1411490 ?auto_1411488 ) ) ( not ( = ?auto_1411490 ?auto_1411489 ) ) ( not ( = ?auto_1411494 ?auto_1411492 ) ) ( HOIST-AT ?auto_1411495 ?auto_1411494 ) ( not ( = ?auto_1411493 ?auto_1411495 ) ) ( SURFACE-AT ?auto_1411489 ?auto_1411494 ) ( ON ?auto_1411489 ?auto_1411496 ) ( CLEAR ?auto_1411489 ) ( not ( = ?auto_1411488 ?auto_1411496 ) ) ( not ( = ?auto_1411489 ?auto_1411496 ) ) ( not ( = ?auto_1411490 ?auto_1411496 ) ) ( SURFACE-AT ?auto_1411490 ?auto_1411492 ) ( CLEAR ?auto_1411490 ) ( IS-CRATE ?auto_1411488 ) ( AVAILABLE ?auto_1411493 ) ( TRUCK-AT ?auto_1411491 ?auto_1411494 ) ( AVAILABLE ?auto_1411495 ) ( SURFACE-AT ?auto_1411488 ?auto_1411494 ) ( ON ?auto_1411488 ?auto_1411497 ) ( CLEAR ?auto_1411488 ) ( not ( = ?auto_1411488 ?auto_1411497 ) ) ( not ( = ?auto_1411489 ?auto_1411497 ) ) ( not ( = ?auto_1411490 ?auto_1411497 ) ) ( not ( = ?auto_1411496 ?auto_1411497 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1411495 ?auto_1411488 ?auto_1411497 ?auto_1411494 )
      ( MAKE-2CRATE ?auto_1411490 ?auto_1411488 ?auto_1411489 )
      ( MAKE-1CRATE-VERIFY ?auto_1411488 ?auto_1411489 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1411498 - SURFACE
      ?auto_1411499 - SURFACE
      ?auto_1411500 - SURFACE
    )
    :vars
    (
      ?auto_1411502 - HOIST
      ?auto_1411503 - PLACE
      ?auto_1411504 - PLACE
      ?auto_1411505 - HOIST
      ?auto_1411506 - SURFACE
      ?auto_1411507 - TRUCK
      ?auto_1411501 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411502 ?auto_1411503 ) ( IS-CRATE ?auto_1411500 ) ( not ( = ?auto_1411499 ?auto_1411500 ) ) ( not ( = ?auto_1411498 ?auto_1411499 ) ) ( not ( = ?auto_1411498 ?auto_1411500 ) ) ( not ( = ?auto_1411504 ?auto_1411503 ) ) ( HOIST-AT ?auto_1411505 ?auto_1411504 ) ( not ( = ?auto_1411502 ?auto_1411505 ) ) ( SURFACE-AT ?auto_1411500 ?auto_1411504 ) ( ON ?auto_1411500 ?auto_1411506 ) ( CLEAR ?auto_1411500 ) ( not ( = ?auto_1411499 ?auto_1411506 ) ) ( not ( = ?auto_1411500 ?auto_1411506 ) ) ( not ( = ?auto_1411498 ?auto_1411506 ) ) ( SURFACE-AT ?auto_1411498 ?auto_1411503 ) ( CLEAR ?auto_1411498 ) ( IS-CRATE ?auto_1411499 ) ( AVAILABLE ?auto_1411502 ) ( TRUCK-AT ?auto_1411507 ?auto_1411504 ) ( AVAILABLE ?auto_1411505 ) ( SURFACE-AT ?auto_1411499 ?auto_1411504 ) ( ON ?auto_1411499 ?auto_1411501 ) ( CLEAR ?auto_1411499 ) ( not ( = ?auto_1411499 ?auto_1411501 ) ) ( not ( = ?auto_1411500 ?auto_1411501 ) ) ( not ( = ?auto_1411498 ?auto_1411501 ) ) ( not ( = ?auto_1411506 ?auto_1411501 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1411499 ?auto_1411500 )
      ( MAKE-2CRATE-VERIFY ?auto_1411498 ?auto_1411499 ?auto_1411500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1411509 - SURFACE
      ?auto_1411510 - SURFACE
      ?auto_1411511 - SURFACE
      ?auto_1411508 - SURFACE
    )
    :vars
    (
      ?auto_1411515 - HOIST
      ?auto_1411512 - PLACE
      ?auto_1411514 - PLACE
      ?auto_1411518 - HOIST
      ?auto_1411513 - SURFACE
      ?auto_1411517 - TRUCK
      ?auto_1411516 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411515 ?auto_1411512 ) ( IS-CRATE ?auto_1411508 ) ( not ( = ?auto_1411511 ?auto_1411508 ) ) ( not ( = ?auto_1411510 ?auto_1411511 ) ) ( not ( = ?auto_1411510 ?auto_1411508 ) ) ( not ( = ?auto_1411514 ?auto_1411512 ) ) ( HOIST-AT ?auto_1411518 ?auto_1411514 ) ( not ( = ?auto_1411515 ?auto_1411518 ) ) ( SURFACE-AT ?auto_1411508 ?auto_1411514 ) ( ON ?auto_1411508 ?auto_1411513 ) ( CLEAR ?auto_1411508 ) ( not ( = ?auto_1411511 ?auto_1411513 ) ) ( not ( = ?auto_1411508 ?auto_1411513 ) ) ( not ( = ?auto_1411510 ?auto_1411513 ) ) ( SURFACE-AT ?auto_1411510 ?auto_1411512 ) ( CLEAR ?auto_1411510 ) ( IS-CRATE ?auto_1411511 ) ( AVAILABLE ?auto_1411515 ) ( TRUCK-AT ?auto_1411517 ?auto_1411514 ) ( AVAILABLE ?auto_1411518 ) ( SURFACE-AT ?auto_1411511 ?auto_1411514 ) ( ON ?auto_1411511 ?auto_1411516 ) ( CLEAR ?auto_1411511 ) ( not ( = ?auto_1411511 ?auto_1411516 ) ) ( not ( = ?auto_1411508 ?auto_1411516 ) ) ( not ( = ?auto_1411510 ?auto_1411516 ) ) ( not ( = ?auto_1411513 ?auto_1411516 ) ) ( ON ?auto_1411510 ?auto_1411509 ) ( not ( = ?auto_1411509 ?auto_1411510 ) ) ( not ( = ?auto_1411509 ?auto_1411511 ) ) ( not ( = ?auto_1411509 ?auto_1411508 ) ) ( not ( = ?auto_1411509 ?auto_1411513 ) ) ( not ( = ?auto_1411509 ?auto_1411516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411510 ?auto_1411511 ?auto_1411508 )
      ( MAKE-3CRATE-VERIFY ?auto_1411509 ?auto_1411510 ?auto_1411511 ?auto_1411508 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1411520 - SURFACE
      ?auto_1411521 - SURFACE
      ?auto_1411522 - SURFACE
      ?auto_1411519 - SURFACE
      ?auto_1411523 - SURFACE
    )
    :vars
    (
      ?auto_1411527 - HOIST
      ?auto_1411524 - PLACE
      ?auto_1411526 - PLACE
      ?auto_1411530 - HOIST
      ?auto_1411525 - SURFACE
      ?auto_1411529 - TRUCK
      ?auto_1411528 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411527 ?auto_1411524 ) ( IS-CRATE ?auto_1411523 ) ( not ( = ?auto_1411519 ?auto_1411523 ) ) ( not ( = ?auto_1411522 ?auto_1411519 ) ) ( not ( = ?auto_1411522 ?auto_1411523 ) ) ( not ( = ?auto_1411526 ?auto_1411524 ) ) ( HOIST-AT ?auto_1411530 ?auto_1411526 ) ( not ( = ?auto_1411527 ?auto_1411530 ) ) ( SURFACE-AT ?auto_1411523 ?auto_1411526 ) ( ON ?auto_1411523 ?auto_1411525 ) ( CLEAR ?auto_1411523 ) ( not ( = ?auto_1411519 ?auto_1411525 ) ) ( not ( = ?auto_1411523 ?auto_1411525 ) ) ( not ( = ?auto_1411522 ?auto_1411525 ) ) ( SURFACE-AT ?auto_1411522 ?auto_1411524 ) ( CLEAR ?auto_1411522 ) ( IS-CRATE ?auto_1411519 ) ( AVAILABLE ?auto_1411527 ) ( TRUCK-AT ?auto_1411529 ?auto_1411526 ) ( AVAILABLE ?auto_1411530 ) ( SURFACE-AT ?auto_1411519 ?auto_1411526 ) ( ON ?auto_1411519 ?auto_1411528 ) ( CLEAR ?auto_1411519 ) ( not ( = ?auto_1411519 ?auto_1411528 ) ) ( not ( = ?auto_1411523 ?auto_1411528 ) ) ( not ( = ?auto_1411522 ?auto_1411528 ) ) ( not ( = ?auto_1411525 ?auto_1411528 ) ) ( ON ?auto_1411521 ?auto_1411520 ) ( ON ?auto_1411522 ?auto_1411521 ) ( not ( = ?auto_1411520 ?auto_1411521 ) ) ( not ( = ?auto_1411520 ?auto_1411522 ) ) ( not ( = ?auto_1411520 ?auto_1411519 ) ) ( not ( = ?auto_1411520 ?auto_1411523 ) ) ( not ( = ?auto_1411520 ?auto_1411525 ) ) ( not ( = ?auto_1411520 ?auto_1411528 ) ) ( not ( = ?auto_1411521 ?auto_1411522 ) ) ( not ( = ?auto_1411521 ?auto_1411519 ) ) ( not ( = ?auto_1411521 ?auto_1411523 ) ) ( not ( = ?auto_1411521 ?auto_1411525 ) ) ( not ( = ?auto_1411521 ?auto_1411528 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411522 ?auto_1411519 ?auto_1411523 )
      ( MAKE-4CRATE-VERIFY ?auto_1411520 ?auto_1411521 ?auto_1411522 ?auto_1411519 ?auto_1411523 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1411532 - SURFACE
      ?auto_1411533 - SURFACE
      ?auto_1411534 - SURFACE
      ?auto_1411531 - SURFACE
      ?auto_1411535 - SURFACE
      ?auto_1411536 - SURFACE
    )
    :vars
    (
      ?auto_1411540 - HOIST
      ?auto_1411537 - PLACE
      ?auto_1411539 - PLACE
      ?auto_1411543 - HOIST
      ?auto_1411538 - SURFACE
      ?auto_1411542 - TRUCK
      ?auto_1411541 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411540 ?auto_1411537 ) ( IS-CRATE ?auto_1411536 ) ( not ( = ?auto_1411535 ?auto_1411536 ) ) ( not ( = ?auto_1411531 ?auto_1411535 ) ) ( not ( = ?auto_1411531 ?auto_1411536 ) ) ( not ( = ?auto_1411539 ?auto_1411537 ) ) ( HOIST-AT ?auto_1411543 ?auto_1411539 ) ( not ( = ?auto_1411540 ?auto_1411543 ) ) ( SURFACE-AT ?auto_1411536 ?auto_1411539 ) ( ON ?auto_1411536 ?auto_1411538 ) ( CLEAR ?auto_1411536 ) ( not ( = ?auto_1411535 ?auto_1411538 ) ) ( not ( = ?auto_1411536 ?auto_1411538 ) ) ( not ( = ?auto_1411531 ?auto_1411538 ) ) ( SURFACE-AT ?auto_1411531 ?auto_1411537 ) ( CLEAR ?auto_1411531 ) ( IS-CRATE ?auto_1411535 ) ( AVAILABLE ?auto_1411540 ) ( TRUCK-AT ?auto_1411542 ?auto_1411539 ) ( AVAILABLE ?auto_1411543 ) ( SURFACE-AT ?auto_1411535 ?auto_1411539 ) ( ON ?auto_1411535 ?auto_1411541 ) ( CLEAR ?auto_1411535 ) ( not ( = ?auto_1411535 ?auto_1411541 ) ) ( not ( = ?auto_1411536 ?auto_1411541 ) ) ( not ( = ?auto_1411531 ?auto_1411541 ) ) ( not ( = ?auto_1411538 ?auto_1411541 ) ) ( ON ?auto_1411533 ?auto_1411532 ) ( ON ?auto_1411534 ?auto_1411533 ) ( ON ?auto_1411531 ?auto_1411534 ) ( not ( = ?auto_1411532 ?auto_1411533 ) ) ( not ( = ?auto_1411532 ?auto_1411534 ) ) ( not ( = ?auto_1411532 ?auto_1411531 ) ) ( not ( = ?auto_1411532 ?auto_1411535 ) ) ( not ( = ?auto_1411532 ?auto_1411536 ) ) ( not ( = ?auto_1411532 ?auto_1411538 ) ) ( not ( = ?auto_1411532 ?auto_1411541 ) ) ( not ( = ?auto_1411533 ?auto_1411534 ) ) ( not ( = ?auto_1411533 ?auto_1411531 ) ) ( not ( = ?auto_1411533 ?auto_1411535 ) ) ( not ( = ?auto_1411533 ?auto_1411536 ) ) ( not ( = ?auto_1411533 ?auto_1411538 ) ) ( not ( = ?auto_1411533 ?auto_1411541 ) ) ( not ( = ?auto_1411534 ?auto_1411531 ) ) ( not ( = ?auto_1411534 ?auto_1411535 ) ) ( not ( = ?auto_1411534 ?auto_1411536 ) ) ( not ( = ?auto_1411534 ?auto_1411538 ) ) ( not ( = ?auto_1411534 ?auto_1411541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411531 ?auto_1411535 ?auto_1411536 )
      ( MAKE-5CRATE-VERIFY ?auto_1411532 ?auto_1411533 ?auto_1411534 ?auto_1411531 ?auto_1411535 ?auto_1411536 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1411545 - SURFACE
      ?auto_1411546 - SURFACE
      ?auto_1411547 - SURFACE
      ?auto_1411544 - SURFACE
      ?auto_1411548 - SURFACE
      ?auto_1411550 - SURFACE
      ?auto_1411549 - SURFACE
    )
    :vars
    (
      ?auto_1411554 - HOIST
      ?auto_1411551 - PLACE
      ?auto_1411553 - PLACE
      ?auto_1411557 - HOIST
      ?auto_1411552 - SURFACE
      ?auto_1411556 - TRUCK
      ?auto_1411555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411554 ?auto_1411551 ) ( IS-CRATE ?auto_1411549 ) ( not ( = ?auto_1411550 ?auto_1411549 ) ) ( not ( = ?auto_1411548 ?auto_1411550 ) ) ( not ( = ?auto_1411548 ?auto_1411549 ) ) ( not ( = ?auto_1411553 ?auto_1411551 ) ) ( HOIST-AT ?auto_1411557 ?auto_1411553 ) ( not ( = ?auto_1411554 ?auto_1411557 ) ) ( SURFACE-AT ?auto_1411549 ?auto_1411553 ) ( ON ?auto_1411549 ?auto_1411552 ) ( CLEAR ?auto_1411549 ) ( not ( = ?auto_1411550 ?auto_1411552 ) ) ( not ( = ?auto_1411549 ?auto_1411552 ) ) ( not ( = ?auto_1411548 ?auto_1411552 ) ) ( SURFACE-AT ?auto_1411548 ?auto_1411551 ) ( CLEAR ?auto_1411548 ) ( IS-CRATE ?auto_1411550 ) ( AVAILABLE ?auto_1411554 ) ( TRUCK-AT ?auto_1411556 ?auto_1411553 ) ( AVAILABLE ?auto_1411557 ) ( SURFACE-AT ?auto_1411550 ?auto_1411553 ) ( ON ?auto_1411550 ?auto_1411555 ) ( CLEAR ?auto_1411550 ) ( not ( = ?auto_1411550 ?auto_1411555 ) ) ( not ( = ?auto_1411549 ?auto_1411555 ) ) ( not ( = ?auto_1411548 ?auto_1411555 ) ) ( not ( = ?auto_1411552 ?auto_1411555 ) ) ( ON ?auto_1411546 ?auto_1411545 ) ( ON ?auto_1411547 ?auto_1411546 ) ( ON ?auto_1411544 ?auto_1411547 ) ( ON ?auto_1411548 ?auto_1411544 ) ( not ( = ?auto_1411545 ?auto_1411546 ) ) ( not ( = ?auto_1411545 ?auto_1411547 ) ) ( not ( = ?auto_1411545 ?auto_1411544 ) ) ( not ( = ?auto_1411545 ?auto_1411548 ) ) ( not ( = ?auto_1411545 ?auto_1411550 ) ) ( not ( = ?auto_1411545 ?auto_1411549 ) ) ( not ( = ?auto_1411545 ?auto_1411552 ) ) ( not ( = ?auto_1411545 ?auto_1411555 ) ) ( not ( = ?auto_1411546 ?auto_1411547 ) ) ( not ( = ?auto_1411546 ?auto_1411544 ) ) ( not ( = ?auto_1411546 ?auto_1411548 ) ) ( not ( = ?auto_1411546 ?auto_1411550 ) ) ( not ( = ?auto_1411546 ?auto_1411549 ) ) ( not ( = ?auto_1411546 ?auto_1411552 ) ) ( not ( = ?auto_1411546 ?auto_1411555 ) ) ( not ( = ?auto_1411547 ?auto_1411544 ) ) ( not ( = ?auto_1411547 ?auto_1411548 ) ) ( not ( = ?auto_1411547 ?auto_1411550 ) ) ( not ( = ?auto_1411547 ?auto_1411549 ) ) ( not ( = ?auto_1411547 ?auto_1411552 ) ) ( not ( = ?auto_1411547 ?auto_1411555 ) ) ( not ( = ?auto_1411544 ?auto_1411548 ) ) ( not ( = ?auto_1411544 ?auto_1411550 ) ) ( not ( = ?auto_1411544 ?auto_1411549 ) ) ( not ( = ?auto_1411544 ?auto_1411552 ) ) ( not ( = ?auto_1411544 ?auto_1411555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411548 ?auto_1411550 ?auto_1411549 )
      ( MAKE-6CRATE-VERIFY ?auto_1411545 ?auto_1411546 ?auto_1411547 ?auto_1411544 ?auto_1411548 ?auto_1411550 ?auto_1411549 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1411559 - SURFACE
      ?auto_1411560 - SURFACE
      ?auto_1411561 - SURFACE
      ?auto_1411558 - SURFACE
      ?auto_1411562 - SURFACE
      ?auto_1411564 - SURFACE
      ?auto_1411563 - SURFACE
      ?auto_1411565 - SURFACE
    )
    :vars
    (
      ?auto_1411569 - HOIST
      ?auto_1411566 - PLACE
      ?auto_1411568 - PLACE
      ?auto_1411572 - HOIST
      ?auto_1411567 - SURFACE
      ?auto_1411571 - TRUCK
      ?auto_1411570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411569 ?auto_1411566 ) ( IS-CRATE ?auto_1411565 ) ( not ( = ?auto_1411563 ?auto_1411565 ) ) ( not ( = ?auto_1411564 ?auto_1411563 ) ) ( not ( = ?auto_1411564 ?auto_1411565 ) ) ( not ( = ?auto_1411568 ?auto_1411566 ) ) ( HOIST-AT ?auto_1411572 ?auto_1411568 ) ( not ( = ?auto_1411569 ?auto_1411572 ) ) ( SURFACE-AT ?auto_1411565 ?auto_1411568 ) ( ON ?auto_1411565 ?auto_1411567 ) ( CLEAR ?auto_1411565 ) ( not ( = ?auto_1411563 ?auto_1411567 ) ) ( not ( = ?auto_1411565 ?auto_1411567 ) ) ( not ( = ?auto_1411564 ?auto_1411567 ) ) ( SURFACE-AT ?auto_1411564 ?auto_1411566 ) ( CLEAR ?auto_1411564 ) ( IS-CRATE ?auto_1411563 ) ( AVAILABLE ?auto_1411569 ) ( TRUCK-AT ?auto_1411571 ?auto_1411568 ) ( AVAILABLE ?auto_1411572 ) ( SURFACE-AT ?auto_1411563 ?auto_1411568 ) ( ON ?auto_1411563 ?auto_1411570 ) ( CLEAR ?auto_1411563 ) ( not ( = ?auto_1411563 ?auto_1411570 ) ) ( not ( = ?auto_1411565 ?auto_1411570 ) ) ( not ( = ?auto_1411564 ?auto_1411570 ) ) ( not ( = ?auto_1411567 ?auto_1411570 ) ) ( ON ?auto_1411560 ?auto_1411559 ) ( ON ?auto_1411561 ?auto_1411560 ) ( ON ?auto_1411558 ?auto_1411561 ) ( ON ?auto_1411562 ?auto_1411558 ) ( ON ?auto_1411564 ?auto_1411562 ) ( not ( = ?auto_1411559 ?auto_1411560 ) ) ( not ( = ?auto_1411559 ?auto_1411561 ) ) ( not ( = ?auto_1411559 ?auto_1411558 ) ) ( not ( = ?auto_1411559 ?auto_1411562 ) ) ( not ( = ?auto_1411559 ?auto_1411564 ) ) ( not ( = ?auto_1411559 ?auto_1411563 ) ) ( not ( = ?auto_1411559 ?auto_1411565 ) ) ( not ( = ?auto_1411559 ?auto_1411567 ) ) ( not ( = ?auto_1411559 ?auto_1411570 ) ) ( not ( = ?auto_1411560 ?auto_1411561 ) ) ( not ( = ?auto_1411560 ?auto_1411558 ) ) ( not ( = ?auto_1411560 ?auto_1411562 ) ) ( not ( = ?auto_1411560 ?auto_1411564 ) ) ( not ( = ?auto_1411560 ?auto_1411563 ) ) ( not ( = ?auto_1411560 ?auto_1411565 ) ) ( not ( = ?auto_1411560 ?auto_1411567 ) ) ( not ( = ?auto_1411560 ?auto_1411570 ) ) ( not ( = ?auto_1411561 ?auto_1411558 ) ) ( not ( = ?auto_1411561 ?auto_1411562 ) ) ( not ( = ?auto_1411561 ?auto_1411564 ) ) ( not ( = ?auto_1411561 ?auto_1411563 ) ) ( not ( = ?auto_1411561 ?auto_1411565 ) ) ( not ( = ?auto_1411561 ?auto_1411567 ) ) ( not ( = ?auto_1411561 ?auto_1411570 ) ) ( not ( = ?auto_1411558 ?auto_1411562 ) ) ( not ( = ?auto_1411558 ?auto_1411564 ) ) ( not ( = ?auto_1411558 ?auto_1411563 ) ) ( not ( = ?auto_1411558 ?auto_1411565 ) ) ( not ( = ?auto_1411558 ?auto_1411567 ) ) ( not ( = ?auto_1411558 ?auto_1411570 ) ) ( not ( = ?auto_1411562 ?auto_1411564 ) ) ( not ( = ?auto_1411562 ?auto_1411563 ) ) ( not ( = ?auto_1411562 ?auto_1411565 ) ) ( not ( = ?auto_1411562 ?auto_1411567 ) ) ( not ( = ?auto_1411562 ?auto_1411570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411564 ?auto_1411563 ?auto_1411565 )
      ( MAKE-7CRATE-VERIFY ?auto_1411559 ?auto_1411560 ?auto_1411561 ?auto_1411558 ?auto_1411562 ?auto_1411564 ?auto_1411563 ?auto_1411565 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1411574 - SURFACE
      ?auto_1411575 - SURFACE
      ?auto_1411576 - SURFACE
      ?auto_1411573 - SURFACE
      ?auto_1411577 - SURFACE
      ?auto_1411579 - SURFACE
      ?auto_1411578 - SURFACE
      ?auto_1411580 - SURFACE
      ?auto_1411581 - SURFACE
    )
    :vars
    (
      ?auto_1411585 - HOIST
      ?auto_1411582 - PLACE
      ?auto_1411584 - PLACE
      ?auto_1411588 - HOIST
      ?auto_1411583 - SURFACE
      ?auto_1411587 - TRUCK
      ?auto_1411586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411585 ?auto_1411582 ) ( IS-CRATE ?auto_1411581 ) ( not ( = ?auto_1411580 ?auto_1411581 ) ) ( not ( = ?auto_1411578 ?auto_1411580 ) ) ( not ( = ?auto_1411578 ?auto_1411581 ) ) ( not ( = ?auto_1411584 ?auto_1411582 ) ) ( HOIST-AT ?auto_1411588 ?auto_1411584 ) ( not ( = ?auto_1411585 ?auto_1411588 ) ) ( SURFACE-AT ?auto_1411581 ?auto_1411584 ) ( ON ?auto_1411581 ?auto_1411583 ) ( CLEAR ?auto_1411581 ) ( not ( = ?auto_1411580 ?auto_1411583 ) ) ( not ( = ?auto_1411581 ?auto_1411583 ) ) ( not ( = ?auto_1411578 ?auto_1411583 ) ) ( SURFACE-AT ?auto_1411578 ?auto_1411582 ) ( CLEAR ?auto_1411578 ) ( IS-CRATE ?auto_1411580 ) ( AVAILABLE ?auto_1411585 ) ( TRUCK-AT ?auto_1411587 ?auto_1411584 ) ( AVAILABLE ?auto_1411588 ) ( SURFACE-AT ?auto_1411580 ?auto_1411584 ) ( ON ?auto_1411580 ?auto_1411586 ) ( CLEAR ?auto_1411580 ) ( not ( = ?auto_1411580 ?auto_1411586 ) ) ( not ( = ?auto_1411581 ?auto_1411586 ) ) ( not ( = ?auto_1411578 ?auto_1411586 ) ) ( not ( = ?auto_1411583 ?auto_1411586 ) ) ( ON ?auto_1411575 ?auto_1411574 ) ( ON ?auto_1411576 ?auto_1411575 ) ( ON ?auto_1411573 ?auto_1411576 ) ( ON ?auto_1411577 ?auto_1411573 ) ( ON ?auto_1411579 ?auto_1411577 ) ( ON ?auto_1411578 ?auto_1411579 ) ( not ( = ?auto_1411574 ?auto_1411575 ) ) ( not ( = ?auto_1411574 ?auto_1411576 ) ) ( not ( = ?auto_1411574 ?auto_1411573 ) ) ( not ( = ?auto_1411574 ?auto_1411577 ) ) ( not ( = ?auto_1411574 ?auto_1411579 ) ) ( not ( = ?auto_1411574 ?auto_1411578 ) ) ( not ( = ?auto_1411574 ?auto_1411580 ) ) ( not ( = ?auto_1411574 ?auto_1411581 ) ) ( not ( = ?auto_1411574 ?auto_1411583 ) ) ( not ( = ?auto_1411574 ?auto_1411586 ) ) ( not ( = ?auto_1411575 ?auto_1411576 ) ) ( not ( = ?auto_1411575 ?auto_1411573 ) ) ( not ( = ?auto_1411575 ?auto_1411577 ) ) ( not ( = ?auto_1411575 ?auto_1411579 ) ) ( not ( = ?auto_1411575 ?auto_1411578 ) ) ( not ( = ?auto_1411575 ?auto_1411580 ) ) ( not ( = ?auto_1411575 ?auto_1411581 ) ) ( not ( = ?auto_1411575 ?auto_1411583 ) ) ( not ( = ?auto_1411575 ?auto_1411586 ) ) ( not ( = ?auto_1411576 ?auto_1411573 ) ) ( not ( = ?auto_1411576 ?auto_1411577 ) ) ( not ( = ?auto_1411576 ?auto_1411579 ) ) ( not ( = ?auto_1411576 ?auto_1411578 ) ) ( not ( = ?auto_1411576 ?auto_1411580 ) ) ( not ( = ?auto_1411576 ?auto_1411581 ) ) ( not ( = ?auto_1411576 ?auto_1411583 ) ) ( not ( = ?auto_1411576 ?auto_1411586 ) ) ( not ( = ?auto_1411573 ?auto_1411577 ) ) ( not ( = ?auto_1411573 ?auto_1411579 ) ) ( not ( = ?auto_1411573 ?auto_1411578 ) ) ( not ( = ?auto_1411573 ?auto_1411580 ) ) ( not ( = ?auto_1411573 ?auto_1411581 ) ) ( not ( = ?auto_1411573 ?auto_1411583 ) ) ( not ( = ?auto_1411573 ?auto_1411586 ) ) ( not ( = ?auto_1411577 ?auto_1411579 ) ) ( not ( = ?auto_1411577 ?auto_1411578 ) ) ( not ( = ?auto_1411577 ?auto_1411580 ) ) ( not ( = ?auto_1411577 ?auto_1411581 ) ) ( not ( = ?auto_1411577 ?auto_1411583 ) ) ( not ( = ?auto_1411577 ?auto_1411586 ) ) ( not ( = ?auto_1411579 ?auto_1411578 ) ) ( not ( = ?auto_1411579 ?auto_1411580 ) ) ( not ( = ?auto_1411579 ?auto_1411581 ) ) ( not ( = ?auto_1411579 ?auto_1411583 ) ) ( not ( = ?auto_1411579 ?auto_1411586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411578 ?auto_1411580 ?auto_1411581 )
      ( MAKE-8CRATE-VERIFY ?auto_1411574 ?auto_1411575 ?auto_1411576 ?auto_1411573 ?auto_1411577 ?auto_1411579 ?auto_1411578 ?auto_1411580 ?auto_1411581 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1411590 - SURFACE
      ?auto_1411591 - SURFACE
      ?auto_1411592 - SURFACE
      ?auto_1411589 - SURFACE
      ?auto_1411593 - SURFACE
      ?auto_1411595 - SURFACE
      ?auto_1411594 - SURFACE
      ?auto_1411596 - SURFACE
      ?auto_1411597 - SURFACE
      ?auto_1411598 - SURFACE
    )
    :vars
    (
      ?auto_1411602 - HOIST
      ?auto_1411599 - PLACE
      ?auto_1411601 - PLACE
      ?auto_1411605 - HOIST
      ?auto_1411600 - SURFACE
      ?auto_1411604 - TRUCK
      ?auto_1411603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411602 ?auto_1411599 ) ( IS-CRATE ?auto_1411598 ) ( not ( = ?auto_1411597 ?auto_1411598 ) ) ( not ( = ?auto_1411596 ?auto_1411597 ) ) ( not ( = ?auto_1411596 ?auto_1411598 ) ) ( not ( = ?auto_1411601 ?auto_1411599 ) ) ( HOIST-AT ?auto_1411605 ?auto_1411601 ) ( not ( = ?auto_1411602 ?auto_1411605 ) ) ( SURFACE-AT ?auto_1411598 ?auto_1411601 ) ( ON ?auto_1411598 ?auto_1411600 ) ( CLEAR ?auto_1411598 ) ( not ( = ?auto_1411597 ?auto_1411600 ) ) ( not ( = ?auto_1411598 ?auto_1411600 ) ) ( not ( = ?auto_1411596 ?auto_1411600 ) ) ( SURFACE-AT ?auto_1411596 ?auto_1411599 ) ( CLEAR ?auto_1411596 ) ( IS-CRATE ?auto_1411597 ) ( AVAILABLE ?auto_1411602 ) ( TRUCK-AT ?auto_1411604 ?auto_1411601 ) ( AVAILABLE ?auto_1411605 ) ( SURFACE-AT ?auto_1411597 ?auto_1411601 ) ( ON ?auto_1411597 ?auto_1411603 ) ( CLEAR ?auto_1411597 ) ( not ( = ?auto_1411597 ?auto_1411603 ) ) ( not ( = ?auto_1411598 ?auto_1411603 ) ) ( not ( = ?auto_1411596 ?auto_1411603 ) ) ( not ( = ?auto_1411600 ?auto_1411603 ) ) ( ON ?auto_1411591 ?auto_1411590 ) ( ON ?auto_1411592 ?auto_1411591 ) ( ON ?auto_1411589 ?auto_1411592 ) ( ON ?auto_1411593 ?auto_1411589 ) ( ON ?auto_1411595 ?auto_1411593 ) ( ON ?auto_1411594 ?auto_1411595 ) ( ON ?auto_1411596 ?auto_1411594 ) ( not ( = ?auto_1411590 ?auto_1411591 ) ) ( not ( = ?auto_1411590 ?auto_1411592 ) ) ( not ( = ?auto_1411590 ?auto_1411589 ) ) ( not ( = ?auto_1411590 ?auto_1411593 ) ) ( not ( = ?auto_1411590 ?auto_1411595 ) ) ( not ( = ?auto_1411590 ?auto_1411594 ) ) ( not ( = ?auto_1411590 ?auto_1411596 ) ) ( not ( = ?auto_1411590 ?auto_1411597 ) ) ( not ( = ?auto_1411590 ?auto_1411598 ) ) ( not ( = ?auto_1411590 ?auto_1411600 ) ) ( not ( = ?auto_1411590 ?auto_1411603 ) ) ( not ( = ?auto_1411591 ?auto_1411592 ) ) ( not ( = ?auto_1411591 ?auto_1411589 ) ) ( not ( = ?auto_1411591 ?auto_1411593 ) ) ( not ( = ?auto_1411591 ?auto_1411595 ) ) ( not ( = ?auto_1411591 ?auto_1411594 ) ) ( not ( = ?auto_1411591 ?auto_1411596 ) ) ( not ( = ?auto_1411591 ?auto_1411597 ) ) ( not ( = ?auto_1411591 ?auto_1411598 ) ) ( not ( = ?auto_1411591 ?auto_1411600 ) ) ( not ( = ?auto_1411591 ?auto_1411603 ) ) ( not ( = ?auto_1411592 ?auto_1411589 ) ) ( not ( = ?auto_1411592 ?auto_1411593 ) ) ( not ( = ?auto_1411592 ?auto_1411595 ) ) ( not ( = ?auto_1411592 ?auto_1411594 ) ) ( not ( = ?auto_1411592 ?auto_1411596 ) ) ( not ( = ?auto_1411592 ?auto_1411597 ) ) ( not ( = ?auto_1411592 ?auto_1411598 ) ) ( not ( = ?auto_1411592 ?auto_1411600 ) ) ( not ( = ?auto_1411592 ?auto_1411603 ) ) ( not ( = ?auto_1411589 ?auto_1411593 ) ) ( not ( = ?auto_1411589 ?auto_1411595 ) ) ( not ( = ?auto_1411589 ?auto_1411594 ) ) ( not ( = ?auto_1411589 ?auto_1411596 ) ) ( not ( = ?auto_1411589 ?auto_1411597 ) ) ( not ( = ?auto_1411589 ?auto_1411598 ) ) ( not ( = ?auto_1411589 ?auto_1411600 ) ) ( not ( = ?auto_1411589 ?auto_1411603 ) ) ( not ( = ?auto_1411593 ?auto_1411595 ) ) ( not ( = ?auto_1411593 ?auto_1411594 ) ) ( not ( = ?auto_1411593 ?auto_1411596 ) ) ( not ( = ?auto_1411593 ?auto_1411597 ) ) ( not ( = ?auto_1411593 ?auto_1411598 ) ) ( not ( = ?auto_1411593 ?auto_1411600 ) ) ( not ( = ?auto_1411593 ?auto_1411603 ) ) ( not ( = ?auto_1411595 ?auto_1411594 ) ) ( not ( = ?auto_1411595 ?auto_1411596 ) ) ( not ( = ?auto_1411595 ?auto_1411597 ) ) ( not ( = ?auto_1411595 ?auto_1411598 ) ) ( not ( = ?auto_1411595 ?auto_1411600 ) ) ( not ( = ?auto_1411595 ?auto_1411603 ) ) ( not ( = ?auto_1411594 ?auto_1411596 ) ) ( not ( = ?auto_1411594 ?auto_1411597 ) ) ( not ( = ?auto_1411594 ?auto_1411598 ) ) ( not ( = ?auto_1411594 ?auto_1411600 ) ) ( not ( = ?auto_1411594 ?auto_1411603 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411596 ?auto_1411597 ?auto_1411598 )
      ( MAKE-9CRATE-VERIFY ?auto_1411590 ?auto_1411591 ?auto_1411592 ?auto_1411589 ?auto_1411593 ?auto_1411595 ?auto_1411594 ?auto_1411596 ?auto_1411597 ?auto_1411598 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1411607 - SURFACE
      ?auto_1411608 - SURFACE
      ?auto_1411609 - SURFACE
      ?auto_1411606 - SURFACE
      ?auto_1411610 - SURFACE
      ?auto_1411612 - SURFACE
      ?auto_1411611 - SURFACE
      ?auto_1411613 - SURFACE
      ?auto_1411614 - SURFACE
      ?auto_1411615 - SURFACE
      ?auto_1411616 - SURFACE
    )
    :vars
    (
      ?auto_1411620 - HOIST
      ?auto_1411617 - PLACE
      ?auto_1411619 - PLACE
      ?auto_1411623 - HOIST
      ?auto_1411618 - SURFACE
      ?auto_1411622 - TRUCK
      ?auto_1411621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411620 ?auto_1411617 ) ( IS-CRATE ?auto_1411616 ) ( not ( = ?auto_1411615 ?auto_1411616 ) ) ( not ( = ?auto_1411614 ?auto_1411615 ) ) ( not ( = ?auto_1411614 ?auto_1411616 ) ) ( not ( = ?auto_1411619 ?auto_1411617 ) ) ( HOIST-AT ?auto_1411623 ?auto_1411619 ) ( not ( = ?auto_1411620 ?auto_1411623 ) ) ( SURFACE-AT ?auto_1411616 ?auto_1411619 ) ( ON ?auto_1411616 ?auto_1411618 ) ( CLEAR ?auto_1411616 ) ( not ( = ?auto_1411615 ?auto_1411618 ) ) ( not ( = ?auto_1411616 ?auto_1411618 ) ) ( not ( = ?auto_1411614 ?auto_1411618 ) ) ( SURFACE-AT ?auto_1411614 ?auto_1411617 ) ( CLEAR ?auto_1411614 ) ( IS-CRATE ?auto_1411615 ) ( AVAILABLE ?auto_1411620 ) ( TRUCK-AT ?auto_1411622 ?auto_1411619 ) ( AVAILABLE ?auto_1411623 ) ( SURFACE-AT ?auto_1411615 ?auto_1411619 ) ( ON ?auto_1411615 ?auto_1411621 ) ( CLEAR ?auto_1411615 ) ( not ( = ?auto_1411615 ?auto_1411621 ) ) ( not ( = ?auto_1411616 ?auto_1411621 ) ) ( not ( = ?auto_1411614 ?auto_1411621 ) ) ( not ( = ?auto_1411618 ?auto_1411621 ) ) ( ON ?auto_1411608 ?auto_1411607 ) ( ON ?auto_1411609 ?auto_1411608 ) ( ON ?auto_1411606 ?auto_1411609 ) ( ON ?auto_1411610 ?auto_1411606 ) ( ON ?auto_1411612 ?auto_1411610 ) ( ON ?auto_1411611 ?auto_1411612 ) ( ON ?auto_1411613 ?auto_1411611 ) ( ON ?auto_1411614 ?auto_1411613 ) ( not ( = ?auto_1411607 ?auto_1411608 ) ) ( not ( = ?auto_1411607 ?auto_1411609 ) ) ( not ( = ?auto_1411607 ?auto_1411606 ) ) ( not ( = ?auto_1411607 ?auto_1411610 ) ) ( not ( = ?auto_1411607 ?auto_1411612 ) ) ( not ( = ?auto_1411607 ?auto_1411611 ) ) ( not ( = ?auto_1411607 ?auto_1411613 ) ) ( not ( = ?auto_1411607 ?auto_1411614 ) ) ( not ( = ?auto_1411607 ?auto_1411615 ) ) ( not ( = ?auto_1411607 ?auto_1411616 ) ) ( not ( = ?auto_1411607 ?auto_1411618 ) ) ( not ( = ?auto_1411607 ?auto_1411621 ) ) ( not ( = ?auto_1411608 ?auto_1411609 ) ) ( not ( = ?auto_1411608 ?auto_1411606 ) ) ( not ( = ?auto_1411608 ?auto_1411610 ) ) ( not ( = ?auto_1411608 ?auto_1411612 ) ) ( not ( = ?auto_1411608 ?auto_1411611 ) ) ( not ( = ?auto_1411608 ?auto_1411613 ) ) ( not ( = ?auto_1411608 ?auto_1411614 ) ) ( not ( = ?auto_1411608 ?auto_1411615 ) ) ( not ( = ?auto_1411608 ?auto_1411616 ) ) ( not ( = ?auto_1411608 ?auto_1411618 ) ) ( not ( = ?auto_1411608 ?auto_1411621 ) ) ( not ( = ?auto_1411609 ?auto_1411606 ) ) ( not ( = ?auto_1411609 ?auto_1411610 ) ) ( not ( = ?auto_1411609 ?auto_1411612 ) ) ( not ( = ?auto_1411609 ?auto_1411611 ) ) ( not ( = ?auto_1411609 ?auto_1411613 ) ) ( not ( = ?auto_1411609 ?auto_1411614 ) ) ( not ( = ?auto_1411609 ?auto_1411615 ) ) ( not ( = ?auto_1411609 ?auto_1411616 ) ) ( not ( = ?auto_1411609 ?auto_1411618 ) ) ( not ( = ?auto_1411609 ?auto_1411621 ) ) ( not ( = ?auto_1411606 ?auto_1411610 ) ) ( not ( = ?auto_1411606 ?auto_1411612 ) ) ( not ( = ?auto_1411606 ?auto_1411611 ) ) ( not ( = ?auto_1411606 ?auto_1411613 ) ) ( not ( = ?auto_1411606 ?auto_1411614 ) ) ( not ( = ?auto_1411606 ?auto_1411615 ) ) ( not ( = ?auto_1411606 ?auto_1411616 ) ) ( not ( = ?auto_1411606 ?auto_1411618 ) ) ( not ( = ?auto_1411606 ?auto_1411621 ) ) ( not ( = ?auto_1411610 ?auto_1411612 ) ) ( not ( = ?auto_1411610 ?auto_1411611 ) ) ( not ( = ?auto_1411610 ?auto_1411613 ) ) ( not ( = ?auto_1411610 ?auto_1411614 ) ) ( not ( = ?auto_1411610 ?auto_1411615 ) ) ( not ( = ?auto_1411610 ?auto_1411616 ) ) ( not ( = ?auto_1411610 ?auto_1411618 ) ) ( not ( = ?auto_1411610 ?auto_1411621 ) ) ( not ( = ?auto_1411612 ?auto_1411611 ) ) ( not ( = ?auto_1411612 ?auto_1411613 ) ) ( not ( = ?auto_1411612 ?auto_1411614 ) ) ( not ( = ?auto_1411612 ?auto_1411615 ) ) ( not ( = ?auto_1411612 ?auto_1411616 ) ) ( not ( = ?auto_1411612 ?auto_1411618 ) ) ( not ( = ?auto_1411612 ?auto_1411621 ) ) ( not ( = ?auto_1411611 ?auto_1411613 ) ) ( not ( = ?auto_1411611 ?auto_1411614 ) ) ( not ( = ?auto_1411611 ?auto_1411615 ) ) ( not ( = ?auto_1411611 ?auto_1411616 ) ) ( not ( = ?auto_1411611 ?auto_1411618 ) ) ( not ( = ?auto_1411611 ?auto_1411621 ) ) ( not ( = ?auto_1411613 ?auto_1411614 ) ) ( not ( = ?auto_1411613 ?auto_1411615 ) ) ( not ( = ?auto_1411613 ?auto_1411616 ) ) ( not ( = ?auto_1411613 ?auto_1411618 ) ) ( not ( = ?auto_1411613 ?auto_1411621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411614 ?auto_1411615 ?auto_1411616 )
      ( MAKE-10CRATE-VERIFY ?auto_1411607 ?auto_1411608 ?auto_1411609 ?auto_1411606 ?auto_1411610 ?auto_1411612 ?auto_1411611 ?auto_1411613 ?auto_1411614 ?auto_1411615 ?auto_1411616 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1411625 - SURFACE
      ?auto_1411626 - SURFACE
      ?auto_1411627 - SURFACE
      ?auto_1411624 - SURFACE
      ?auto_1411628 - SURFACE
      ?auto_1411630 - SURFACE
      ?auto_1411629 - SURFACE
      ?auto_1411631 - SURFACE
      ?auto_1411632 - SURFACE
      ?auto_1411633 - SURFACE
      ?auto_1411634 - SURFACE
      ?auto_1411635 - SURFACE
    )
    :vars
    (
      ?auto_1411639 - HOIST
      ?auto_1411636 - PLACE
      ?auto_1411638 - PLACE
      ?auto_1411642 - HOIST
      ?auto_1411637 - SURFACE
      ?auto_1411641 - TRUCK
      ?auto_1411640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411639 ?auto_1411636 ) ( IS-CRATE ?auto_1411635 ) ( not ( = ?auto_1411634 ?auto_1411635 ) ) ( not ( = ?auto_1411633 ?auto_1411634 ) ) ( not ( = ?auto_1411633 ?auto_1411635 ) ) ( not ( = ?auto_1411638 ?auto_1411636 ) ) ( HOIST-AT ?auto_1411642 ?auto_1411638 ) ( not ( = ?auto_1411639 ?auto_1411642 ) ) ( SURFACE-AT ?auto_1411635 ?auto_1411638 ) ( ON ?auto_1411635 ?auto_1411637 ) ( CLEAR ?auto_1411635 ) ( not ( = ?auto_1411634 ?auto_1411637 ) ) ( not ( = ?auto_1411635 ?auto_1411637 ) ) ( not ( = ?auto_1411633 ?auto_1411637 ) ) ( SURFACE-AT ?auto_1411633 ?auto_1411636 ) ( CLEAR ?auto_1411633 ) ( IS-CRATE ?auto_1411634 ) ( AVAILABLE ?auto_1411639 ) ( TRUCK-AT ?auto_1411641 ?auto_1411638 ) ( AVAILABLE ?auto_1411642 ) ( SURFACE-AT ?auto_1411634 ?auto_1411638 ) ( ON ?auto_1411634 ?auto_1411640 ) ( CLEAR ?auto_1411634 ) ( not ( = ?auto_1411634 ?auto_1411640 ) ) ( not ( = ?auto_1411635 ?auto_1411640 ) ) ( not ( = ?auto_1411633 ?auto_1411640 ) ) ( not ( = ?auto_1411637 ?auto_1411640 ) ) ( ON ?auto_1411626 ?auto_1411625 ) ( ON ?auto_1411627 ?auto_1411626 ) ( ON ?auto_1411624 ?auto_1411627 ) ( ON ?auto_1411628 ?auto_1411624 ) ( ON ?auto_1411630 ?auto_1411628 ) ( ON ?auto_1411629 ?auto_1411630 ) ( ON ?auto_1411631 ?auto_1411629 ) ( ON ?auto_1411632 ?auto_1411631 ) ( ON ?auto_1411633 ?auto_1411632 ) ( not ( = ?auto_1411625 ?auto_1411626 ) ) ( not ( = ?auto_1411625 ?auto_1411627 ) ) ( not ( = ?auto_1411625 ?auto_1411624 ) ) ( not ( = ?auto_1411625 ?auto_1411628 ) ) ( not ( = ?auto_1411625 ?auto_1411630 ) ) ( not ( = ?auto_1411625 ?auto_1411629 ) ) ( not ( = ?auto_1411625 ?auto_1411631 ) ) ( not ( = ?auto_1411625 ?auto_1411632 ) ) ( not ( = ?auto_1411625 ?auto_1411633 ) ) ( not ( = ?auto_1411625 ?auto_1411634 ) ) ( not ( = ?auto_1411625 ?auto_1411635 ) ) ( not ( = ?auto_1411625 ?auto_1411637 ) ) ( not ( = ?auto_1411625 ?auto_1411640 ) ) ( not ( = ?auto_1411626 ?auto_1411627 ) ) ( not ( = ?auto_1411626 ?auto_1411624 ) ) ( not ( = ?auto_1411626 ?auto_1411628 ) ) ( not ( = ?auto_1411626 ?auto_1411630 ) ) ( not ( = ?auto_1411626 ?auto_1411629 ) ) ( not ( = ?auto_1411626 ?auto_1411631 ) ) ( not ( = ?auto_1411626 ?auto_1411632 ) ) ( not ( = ?auto_1411626 ?auto_1411633 ) ) ( not ( = ?auto_1411626 ?auto_1411634 ) ) ( not ( = ?auto_1411626 ?auto_1411635 ) ) ( not ( = ?auto_1411626 ?auto_1411637 ) ) ( not ( = ?auto_1411626 ?auto_1411640 ) ) ( not ( = ?auto_1411627 ?auto_1411624 ) ) ( not ( = ?auto_1411627 ?auto_1411628 ) ) ( not ( = ?auto_1411627 ?auto_1411630 ) ) ( not ( = ?auto_1411627 ?auto_1411629 ) ) ( not ( = ?auto_1411627 ?auto_1411631 ) ) ( not ( = ?auto_1411627 ?auto_1411632 ) ) ( not ( = ?auto_1411627 ?auto_1411633 ) ) ( not ( = ?auto_1411627 ?auto_1411634 ) ) ( not ( = ?auto_1411627 ?auto_1411635 ) ) ( not ( = ?auto_1411627 ?auto_1411637 ) ) ( not ( = ?auto_1411627 ?auto_1411640 ) ) ( not ( = ?auto_1411624 ?auto_1411628 ) ) ( not ( = ?auto_1411624 ?auto_1411630 ) ) ( not ( = ?auto_1411624 ?auto_1411629 ) ) ( not ( = ?auto_1411624 ?auto_1411631 ) ) ( not ( = ?auto_1411624 ?auto_1411632 ) ) ( not ( = ?auto_1411624 ?auto_1411633 ) ) ( not ( = ?auto_1411624 ?auto_1411634 ) ) ( not ( = ?auto_1411624 ?auto_1411635 ) ) ( not ( = ?auto_1411624 ?auto_1411637 ) ) ( not ( = ?auto_1411624 ?auto_1411640 ) ) ( not ( = ?auto_1411628 ?auto_1411630 ) ) ( not ( = ?auto_1411628 ?auto_1411629 ) ) ( not ( = ?auto_1411628 ?auto_1411631 ) ) ( not ( = ?auto_1411628 ?auto_1411632 ) ) ( not ( = ?auto_1411628 ?auto_1411633 ) ) ( not ( = ?auto_1411628 ?auto_1411634 ) ) ( not ( = ?auto_1411628 ?auto_1411635 ) ) ( not ( = ?auto_1411628 ?auto_1411637 ) ) ( not ( = ?auto_1411628 ?auto_1411640 ) ) ( not ( = ?auto_1411630 ?auto_1411629 ) ) ( not ( = ?auto_1411630 ?auto_1411631 ) ) ( not ( = ?auto_1411630 ?auto_1411632 ) ) ( not ( = ?auto_1411630 ?auto_1411633 ) ) ( not ( = ?auto_1411630 ?auto_1411634 ) ) ( not ( = ?auto_1411630 ?auto_1411635 ) ) ( not ( = ?auto_1411630 ?auto_1411637 ) ) ( not ( = ?auto_1411630 ?auto_1411640 ) ) ( not ( = ?auto_1411629 ?auto_1411631 ) ) ( not ( = ?auto_1411629 ?auto_1411632 ) ) ( not ( = ?auto_1411629 ?auto_1411633 ) ) ( not ( = ?auto_1411629 ?auto_1411634 ) ) ( not ( = ?auto_1411629 ?auto_1411635 ) ) ( not ( = ?auto_1411629 ?auto_1411637 ) ) ( not ( = ?auto_1411629 ?auto_1411640 ) ) ( not ( = ?auto_1411631 ?auto_1411632 ) ) ( not ( = ?auto_1411631 ?auto_1411633 ) ) ( not ( = ?auto_1411631 ?auto_1411634 ) ) ( not ( = ?auto_1411631 ?auto_1411635 ) ) ( not ( = ?auto_1411631 ?auto_1411637 ) ) ( not ( = ?auto_1411631 ?auto_1411640 ) ) ( not ( = ?auto_1411632 ?auto_1411633 ) ) ( not ( = ?auto_1411632 ?auto_1411634 ) ) ( not ( = ?auto_1411632 ?auto_1411635 ) ) ( not ( = ?auto_1411632 ?auto_1411637 ) ) ( not ( = ?auto_1411632 ?auto_1411640 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411633 ?auto_1411634 ?auto_1411635 )
      ( MAKE-11CRATE-VERIFY ?auto_1411625 ?auto_1411626 ?auto_1411627 ?auto_1411624 ?auto_1411628 ?auto_1411630 ?auto_1411629 ?auto_1411631 ?auto_1411632 ?auto_1411633 ?auto_1411634 ?auto_1411635 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1411644 - SURFACE
      ?auto_1411645 - SURFACE
      ?auto_1411646 - SURFACE
      ?auto_1411643 - SURFACE
      ?auto_1411647 - SURFACE
      ?auto_1411649 - SURFACE
      ?auto_1411648 - SURFACE
      ?auto_1411650 - SURFACE
      ?auto_1411651 - SURFACE
      ?auto_1411652 - SURFACE
      ?auto_1411653 - SURFACE
      ?auto_1411654 - SURFACE
      ?auto_1411655 - SURFACE
    )
    :vars
    (
      ?auto_1411659 - HOIST
      ?auto_1411656 - PLACE
      ?auto_1411658 - PLACE
      ?auto_1411662 - HOIST
      ?auto_1411657 - SURFACE
      ?auto_1411661 - TRUCK
      ?auto_1411660 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411659 ?auto_1411656 ) ( IS-CRATE ?auto_1411655 ) ( not ( = ?auto_1411654 ?auto_1411655 ) ) ( not ( = ?auto_1411653 ?auto_1411654 ) ) ( not ( = ?auto_1411653 ?auto_1411655 ) ) ( not ( = ?auto_1411658 ?auto_1411656 ) ) ( HOIST-AT ?auto_1411662 ?auto_1411658 ) ( not ( = ?auto_1411659 ?auto_1411662 ) ) ( SURFACE-AT ?auto_1411655 ?auto_1411658 ) ( ON ?auto_1411655 ?auto_1411657 ) ( CLEAR ?auto_1411655 ) ( not ( = ?auto_1411654 ?auto_1411657 ) ) ( not ( = ?auto_1411655 ?auto_1411657 ) ) ( not ( = ?auto_1411653 ?auto_1411657 ) ) ( SURFACE-AT ?auto_1411653 ?auto_1411656 ) ( CLEAR ?auto_1411653 ) ( IS-CRATE ?auto_1411654 ) ( AVAILABLE ?auto_1411659 ) ( TRUCK-AT ?auto_1411661 ?auto_1411658 ) ( AVAILABLE ?auto_1411662 ) ( SURFACE-AT ?auto_1411654 ?auto_1411658 ) ( ON ?auto_1411654 ?auto_1411660 ) ( CLEAR ?auto_1411654 ) ( not ( = ?auto_1411654 ?auto_1411660 ) ) ( not ( = ?auto_1411655 ?auto_1411660 ) ) ( not ( = ?auto_1411653 ?auto_1411660 ) ) ( not ( = ?auto_1411657 ?auto_1411660 ) ) ( ON ?auto_1411645 ?auto_1411644 ) ( ON ?auto_1411646 ?auto_1411645 ) ( ON ?auto_1411643 ?auto_1411646 ) ( ON ?auto_1411647 ?auto_1411643 ) ( ON ?auto_1411649 ?auto_1411647 ) ( ON ?auto_1411648 ?auto_1411649 ) ( ON ?auto_1411650 ?auto_1411648 ) ( ON ?auto_1411651 ?auto_1411650 ) ( ON ?auto_1411652 ?auto_1411651 ) ( ON ?auto_1411653 ?auto_1411652 ) ( not ( = ?auto_1411644 ?auto_1411645 ) ) ( not ( = ?auto_1411644 ?auto_1411646 ) ) ( not ( = ?auto_1411644 ?auto_1411643 ) ) ( not ( = ?auto_1411644 ?auto_1411647 ) ) ( not ( = ?auto_1411644 ?auto_1411649 ) ) ( not ( = ?auto_1411644 ?auto_1411648 ) ) ( not ( = ?auto_1411644 ?auto_1411650 ) ) ( not ( = ?auto_1411644 ?auto_1411651 ) ) ( not ( = ?auto_1411644 ?auto_1411652 ) ) ( not ( = ?auto_1411644 ?auto_1411653 ) ) ( not ( = ?auto_1411644 ?auto_1411654 ) ) ( not ( = ?auto_1411644 ?auto_1411655 ) ) ( not ( = ?auto_1411644 ?auto_1411657 ) ) ( not ( = ?auto_1411644 ?auto_1411660 ) ) ( not ( = ?auto_1411645 ?auto_1411646 ) ) ( not ( = ?auto_1411645 ?auto_1411643 ) ) ( not ( = ?auto_1411645 ?auto_1411647 ) ) ( not ( = ?auto_1411645 ?auto_1411649 ) ) ( not ( = ?auto_1411645 ?auto_1411648 ) ) ( not ( = ?auto_1411645 ?auto_1411650 ) ) ( not ( = ?auto_1411645 ?auto_1411651 ) ) ( not ( = ?auto_1411645 ?auto_1411652 ) ) ( not ( = ?auto_1411645 ?auto_1411653 ) ) ( not ( = ?auto_1411645 ?auto_1411654 ) ) ( not ( = ?auto_1411645 ?auto_1411655 ) ) ( not ( = ?auto_1411645 ?auto_1411657 ) ) ( not ( = ?auto_1411645 ?auto_1411660 ) ) ( not ( = ?auto_1411646 ?auto_1411643 ) ) ( not ( = ?auto_1411646 ?auto_1411647 ) ) ( not ( = ?auto_1411646 ?auto_1411649 ) ) ( not ( = ?auto_1411646 ?auto_1411648 ) ) ( not ( = ?auto_1411646 ?auto_1411650 ) ) ( not ( = ?auto_1411646 ?auto_1411651 ) ) ( not ( = ?auto_1411646 ?auto_1411652 ) ) ( not ( = ?auto_1411646 ?auto_1411653 ) ) ( not ( = ?auto_1411646 ?auto_1411654 ) ) ( not ( = ?auto_1411646 ?auto_1411655 ) ) ( not ( = ?auto_1411646 ?auto_1411657 ) ) ( not ( = ?auto_1411646 ?auto_1411660 ) ) ( not ( = ?auto_1411643 ?auto_1411647 ) ) ( not ( = ?auto_1411643 ?auto_1411649 ) ) ( not ( = ?auto_1411643 ?auto_1411648 ) ) ( not ( = ?auto_1411643 ?auto_1411650 ) ) ( not ( = ?auto_1411643 ?auto_1411651 ) ) ( not ( = ?auto_1411643 ?auto_1411652 ) ) ( not ( = ?auto_1411643 ?auto_1411653 ) ) ( not ( = ?auto_1411643 ?auto_1411654 ) ) ( not ( = ?auto_1411643 ?auto_1411655 ) ) ( not ( = ?auto_1411643 ?auto_1411657 ) ) ( not ( = ?auto_1411643 ?auto_1411660 ) ) ( not ( = ?auto_1411647 ?auto_1411649 ) ) ( not ( = ?auto_1411647 ?auto_1411648 ) ) ( not ( = ?auto_1411647 ?auto_1411650 ) ) ( not ( = ?auto_1411647 ?auto_1411651 ) ) ( not ( = ?auto_1411647 ?auto_1411652 ) ) ( not ( = ?auto_1411647 ?auto_1411653 ) ) ( not ( = ?auto_1411647 ?auto_1411654 ) ) ( not ( = ?auto_1411647 ?auto_1411655 ) ) ( not ( = ?auto_1411647 ?auto_1411657 ) ) ( not ( = ?auto_1411647 ?auto_1411660 ) ) ( not ( = ?auto_1411649 ?auto_1411648 ) ) ( not ( = ?auto_1411649 ?auto_1411650 ) ) ( not ( = ?auto_1411649 ?auto_1411651 ) ) ( not ( = ?auto_1411649 ?auto_1411652 ) ) ( not ( = ?auto_1411649 ?auto_1411653 ) ) ( not ( = ?auto_1411649 ?auto_1411654 ) ) ( not ( = ?auto_1411649 ?auto_1411655 ) ) ( not ( = ?auto_1411649 ?auto_1411657 ) ) ( not ( = ?auto_1411649 ?auto_1411660 ) ) ( not ( = ?auto_1411648 ?auto_1411650 ) ) ( not ( = ?auto_1411648 ?auto_1411651 ) ) ( not ( = ?auto_1411648 ?auto_1411652 ) ) ( not ( = ?auto_1411648 ?auto_1411653 ) ) ( not ( = ?auto_1411648 ?auto_1411654 ) ) ( not ( = ?auto_1411648 ?auto_1411655 ) ) ( not ( = ?auto_1411648 ?auto_1411657 ) ) ( not ( = ?auto_1411648 ?auto_1411660 ) ) ( not ( = ?auto_1411650 ?auto_1411651 ) ) ( not ( = ?auto_1411650 ?auto_1411652 ) ) ( not ( = ?auto_1411650 ?auto_1411653 ) ) ( not ( = ?auto_1411650 ?auto_1411654 ) ) ( not ( = ?auto_1411650 ?auto_1411655 ) ) ( not ( = ?auto_1411650 ?auto_1411657 ) ) ( not ( = ?auto_1411650 ?auto_1411660 ) ) ( not ( = ?auto_1411651 ?auto_1411652 ) ) ( not ( = ?auto_1411651 ?auto_1411653 ) ) ( not ( = ?auto_1411651 ?auto_1411654 ) ) ( not ( = ?auto_1411651 ?auto_1411655 ) ) ( not ( = ?auto_1411651 ?auto_1411657 ) ) ( not ( = ?auto_1411651 ?auto_1411660 ) ) ( not ( = ?auto_1411652 ?auto_1411653 ) ) ( not ( = ?auto_1411652 ?auto_1411654 ) ) ( not ( = ?auto_1411652 ?auto_1411655 ) ) ( not ( = ?auto_1411652 ?auto_1411657 ) ) ( not ( = ?auto_1411652 ?auto_1411660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411653 ?auto_1411654 ?auto_1411655 )
      ( MAKE-12CRATE-VERIFY ?auto_1411644 ?auto_1411645 ?auto_1411646 ?auto_1411643 ?auto_1411647 ?auto_1411649 ?auto_1411648 ?auto_1411650 ?auto_1411651 ?auto_1411652 ?auto_1411653 ?auto_1411654 ?auto_1411655 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1411664 - SURFACE
      ?auto_1411665 - SURFACE
      ?auto_1411666 - SURFACE
      ?auto_1411663 - SURFACE
      ?auto_1411667 - SURFACE
      ?auto_1411669 - SURFACE
      ?auto_1411668 - SURFACE
      ?auto_1411670 - SURFACE
      ?auto_1411671 - SURFACE
      ?auto_1411672 - SURFACE
      ?auto_1411673 - SURFACE
      ?auto_1411674 - SURFACE
      ?auto_1411675 - SURFACE
      ?auto_1411676 - SURFACE
    )
    :vars
    (
      ?auto_1411680 - HOIST
      ?auto_1411677 - PLACE
      ?auto_1411679 - PLACE
      ?auto_1411683 - HOIST
      ?auto_1411678 - SURFACE
      ?auto_1411682 - TRUCK
      ?auto_1411681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411680 ?auto_1411677 ) ( IS-CRATE ?auto_1411676 ) ( not ( = ?auto_1411675 ?auto_1411676 ) ) ( not ( = ?auto_1411674 ?auto_1411675 ) ) ( not ( = ?auto_1411674 ?auto_1411676 ) ) ( not ( = ?auto_1411679 ?auto_1411677 ) ) ( HOIST-AT ?auto_1411683 ?auto_1411679 ) ( not ( = ?auto_1411680 ?auto_1411683 ) ) ( SURFACE-AT ?auto_1411676 ?auto_1411679 ) ( ON ?auto_1411676 ?auto_1411678 ) ( CLEAR ?auto_1411676 ) ( not ( = ?auto_1411675 ?auto_1411678 ) ) ( not ( = ?auto_1411676 ?auto_1411678 ) ) ( not ( = ?auto_1411674 ?auto_1411678 ) ) ( SURFACE-AT ?auto_1411674 ?auto_1411677 ) ( CLEAR ?auto_1411674 ) ( IS-CRATE ?auto_1411675 ) ( AVAILABLE ?auto_1411680 ) ( TRUCK-AT ?auto_1411682 ?auto_1411679 ) ( AVAILABLE ?auto_1411683 ) ( SURFACE-AT ?auto_1411675 ?auto_1411679 ) ( ON ?auto_1411675 ?auto_1411681 ) ( CLEAR ?auto_1411675 ) ( not ( = ?auto_1411675 ?auto_1411681 ) ) ( not ( = ?auto_1411676 ?auto_1411681 ) ) ( not ( = ?auto_1411674 ?auto_1411681 ) ) ( not ( = ?auto_1411678 ?auto_1411681 ) ) ( ON ?auto_1411665 ?auto_1411664 ) ( ON ?auto_1411666 ?auto_1411665 ) ( ON ?auto_1411663 ?auto_1411666 ) ( ON ?auto_1411667 ?auto_1411663 ) ( ON ?auto_1411669 ?auto_1411667 ) ( ON ?auto_1411668 ?auto_1411669 ) ( ON ?auto_1411670 ?auto_1411668 ) ( ON ?auto_1411671 ?auto_1411670 ) ( ON ?auto_1411672 ?auto_1411671 ) ( ON ?auto_1411673 ?auto_1411672 ) ( ON ?auto_1411674 ?auto_1411673 ) ( not ( = ?auto_1411664 ?auto_1411665 ) ) ( not ( = ?auto_1411664 ?auto_1411666 ) ) ( not ( = ?auto_1411664 ?auto_1411663 ) ) ( not ( = ?auto_1411664 ?auto_1411667 ) ) ( not ( = ?auto_1411664 ?auto_1411669 ) ) ( not ( = ?auto_1411664 ?auto_1411668 ) ) ( not ( = ?auto_1411664 ?auto_1411670 ) ) ( not ( = ?auto_1411664 ?auto_1411671 ) ) ( not ( = ?auto_1411664 ?auto_1411672 ) ) ( not ( = ?auto_1411664 ?auto_1411673 ) ) ( not ( = ?auto_1411664 ?auto_1411674 ) ) ( not ( = ?auto_1411664 ?auto_1411675 ) ) ( not ( = ?auto_1411664 ?auto_1411676 ) ) ( not ( = ?auto_1411664 ?auto_1411678 ) ) ( not ( = ?auto_1411664 ?auto_1411681 ) ) ( not ( = ?auto_1411665 ?auto_1411666 ) ) ( not ( = ?auto_1411665 ?auto_1411663 ) ) ( not ( = ?auto_1411665 ?auto_1411667 ) ) ( not ( = ?auto_1411665 ?auto_1411669 ) ) ( not ( = ?auto_1411665 ?auto_1411668 ) ) ( not ( = ?auto_1411665 ?auto_1411670 ) ) ( not ( = ?auto_1411665 ?auto_1411671 ) ) ( not ( = ?auto_1411665 ?auto_1411672 ) ) ( not ( = ?auto_1411665 ?auto_1411673 ) ) ( not ( = ?auto_1411665 ?auto_1411674 ) ) ( not ( = ?auto_1411665 ?auto_1411675 ) ) ( not ( = ?auto_1411665 ?auto_1411676 ) ) ( not ( = ?auto_1411665 ?auto_1411678 ) ) ( not ( = ?auto_1411665 ?auto_1411681 ) ) ( not ( = ?auto_1411666 ?auto_1411663 ) ) ( not ( = ?auto_1411666 ?auto_1411667 ) ) ( not ( = ?auto_1411666 ?auto_1411669 ) ) ( not ( = ?auto_1411666 ?auto_1411668 ) ) ( not ( = ?auto_1411666 ?auto_1411670 ) ) ( not ( = ?auto_1411666 ?auto_1411671 ) ) ( not ( = ?auto_1411666 ?auto_1411672 ) ) ( not ( = ?auto_1411666 ?auto_1411673 ) ) ( not ( = ?auto_1411666 ?auto_1411674 ) ) ( not ( = ?auto_1411666 ?auto_1411675 ) ) ( not ( = ?auto_1411666 ?auto_1411676 ) ) ( not ( = ?auto_1411666 ?auto_1411678 ) ) ( not ( = ?auto_1411666 ?auto_1411681 ) ) ( not ( = ?auto_1411663 ?auto_1411667 ) ) ( not ( = ?auto_1411663 ?auto_1411669 ) ) ( not ( = ?auto_1411663 ?auto_1411668 ) ) ( not ( = ?auto_1411663 ?auto_1411670 ) ) ( not ( = ?auto_1411663 ?auto_1411671 ) ) ( not ( = ?auto_1411663 ?auto_1411672 ) ) ( not ( = ?auto_1411663 ?auto_1411673 ) ) ( not ( = ?auto_1411663 ?auto_1411674 ) ) ( not ( = ?auto_1411663 ?auto_1411675 ) ) ( not ( = ?auto_1411663 ?auto_1411676 ) ) ( not ( = ?auto_1411663 ?auto_1411678 ) ) ( not ( = ?auto_1411663 ?auto_1411681 ) ) ( not ( = ?auto_1411667 ?auto_1411669 ) ) ( not ( = ?auto_1411667 ?auto_1411668 ) ) ( not ( = ?auto_1411667 ?auto_1411670 ) ) ( not ( = ?auto_1411667 ?auto_1411671 ) ) ( not ( = ?auto_1411667 ?auto_1411672 ) ) ( not ( = ?auto_1411667 ?auto_1411673 ) ) ( not ( = ?auto_1411667 ?auto_1411674 ) ) ( not ( = ?auto_1411667 ?auto_1411675 ) ) ( not ( = ?auto_1411667 ?auto_1411676 ) ) ( not ( = ?auto_1411667 ?auto_1411678 ) ) ( not ( = ?auto_1411667 ?auto_1411681 ) ) ( not ( = ?auto_1411669 ?auto_1411668 ) ) ( not ( = ?auto_1411669 ?auto_1411670 ) ) ( not ( = ?auto_1411669 ?auto_1411671 ) ) ( not ( = ?auto_1411669 ?auto_1411672 ) ) ( not ( = ?auto_1411669 ?auto_1411673 ) ) ( not ( = ?auto_1411669 ?auto_1411674 ) ) ( not ( = ?auto_1411669 ?auto_1411675 ) ) ( not ( = ?auto_1411669 ?auto_1411676 ) ) ( not ( = ?auto_1411669 ?auto_1411678 ) ) ( not ( = ?auto_1411669 ?auto_1411681 ) ) ( not ( = ?auto_1411668 ?auto_1411670 ) ) ( not ( = ?auto_1411668 ?auto_1411671 ) ) ( not ( = ?auto_1411668 ?auto_1411672 ) ) ( not ( = ?auto_1411668 ?auto_1411673 ) ) ( not ( = ?auto_1411668 ?auto_1411674 ) ) ( not ( = ?auto_1411668 ?auto_1411675 ) ) ( not ( = ?auto_1411668 ?auto_1411676 ) ) ( not ( = ?auto_1411668 ?auto_1411678 ) ) ( not ( = ?auto_1411668 ?auto_1411681 ) ) ( not ( = ?auto_1411670 ?auto_1411671 ) ) ( not ( = ?auto_1411670 ?auto_1411672 ) ) ( not ( = ?auto_1411670 ?auto_1411673 ) ) ( not ( = ?auto_1411670 ?auto_1411674 ) ) ( not ( = ?auto_1411670 ?auto_1411675 ) ) ( not ( = ?auto_1411670 ?auto_1411676 ) ) ( not ( = ?auto_1411670 ?auto_1411678 ) ) ( not ( = ?auto_1411670 ?auto_1411681 ) ) ( not ( = ?auto_1411671 ?auto_1411672 ) ) ( not ( = ?auto_1411671 ?auto_1411673 ) ) ( not ( = ?auto_1411671 ?auto_1411674 ) ) ( not ( = ?auto_1411671 ?auto_1411675 ) ) ( not ( = ?auto_1411671 ?auto_1411676 ) ) ( not ( = ?auto_1411671 ?auto_1411678 ) ) ( not ( = ?auto_1411671 ?auto_1411681 ) ) ( not ( = ?auto_1411672 ?auto_1411673 ) ) ( not ( = ?auto_1411672 ?auto_1411674 ) ) ( not ( = ?auto_1411672 ?auto_1411675 ) ) ( not ( = ?auto_1411672 ?auto_1411676 ) ) ( not ( = ?auto_1411672 ?auto_1411678 ) ) ( not ( = ?auto_1411672 ?auto_1411681 ) ) ( not ( = ?auto_1411673 ?auto_1411674 ) ) ( not ( = ?auto_1411673 ?auto_1411675 ) ) ( not ( = ?auto_1411673 ?auto_1411676 ) ) ( not ( = ?auto_1411673 ?auto_1411678 ) ) ( not ( = ?auto_1411673 ?auto_1411681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411674 ?auto_1411675 ?auto_1411676 )
      ( MAKE-13CRATE-VERIFY ?auto_1411664 ?auto_1411665 ?auto_1411666 ?auto_1411663 ?auto_1411667 ?auto_1411669 ?auto_1411668 ?auto_1411670 ?auto_1411671 ?auto_1411672 ?auto_1411673 ?auto_1411674 ?auto_1411675 ?auto_1411676 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1411685 - SURFACE
      ?auto_1411686 - SURFACE
      ?auto_1411687 - SURFACE
      ?auto_1411684 - SURFACE
      ?auto_1411688 - SURFACE
      ?auto_1411690 - SURFACE
      ?auto_1411689 - SURFACE
      ?auto_1411691 - SURFACE
      ?auto_1411692 - SURFACE
      ?auto_1411693 - SURFACE
      ?auto_1411694 - SURFACE
      ?auto_1411695 - SURFACE
      ?auto_1411696 - SURFACE
      ?auto_1411697 - SURFACE
      ?auto_1411698 - SURFACE
    )
    :vars
    (
      ?auto_1411702 - HOIST
      ?auto_1411699 - PLACE
      ?auto_1411701 - PLACE
      ?auto_1411705 - HOIST
      ?auto_1411700 - SURFACE
      ?auto_1411704 - TRUCK
      ?auto_1411703 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411702 ?auto_1411699 ) ( IS-CRATE ?auto_1411698 ) ( not ( = ?auto_1411697 ?auto_1411698 ) ) ( not ( = ?auto_1411696 ?auto_1411697 ) ) ( not ( = ?auto_1411696 ?auto_1411698 ) ) ( not ( = ?auto_1411701 ?auto_1411699 ) ) ( HOIST-AT ?auto_1411705 ?auto_1411701 ) ( not ( = ?auto_1411702 ?auto_1411705 ) ) ( SURFACE-AT ?auto_1411698 ?auto_1411701 ) ( ON ?auto_1411698 ?auto_1411700 ) ( CLEAR ?auto_1411698 ) ( not ( = ?auto_1411697 ?auto_1411700 ) ) ( not ( = ?auto_1411698 ?auto_1411700 ) ) ( not ( = ?auto_1411696 ?auto_1411700 ) ) ( SURFACE-AT ?auto_1411696 ?auto_1411699 ) ( CLEAR ?auto_1411696 ) ( IS-CRATE ?auto_1411697 ) ( AVAILABLE ?auto_1411702 ) ( TRUCK-AT ?auto_1411704 ?auto_1411701 ) ( AVAILABLE ?auto_1411705 ) ( SURFACE-AT ?auto_1411697 ?auto_1411701 ) ( ON ?auto_1411697 ?auto_1411703 ) ( CLEAR ?auto_1411697 ) ( not ( = ?auto_1411697 ?auto_1411703 ) ) ( not ( = ?auto_1411698 ?auto_1411703 ) ) ( not ( = ?auto_1411696 ?auto_1411703 ) ) ( not ( = ?auto_1411700 ?auto_1411703 ) ) ( ON ?auto_1411686 ?auto_1411685 ) ( ON ?auto_1411687 ?auto_1411686 ) ( ON ?auto_1411684 ?auto_1411687 ) ( ON ?auto_1411688 ?auto_1411684 ) ( ON ?auto_1411690 ?auto_1411688 ) ( ON ?auto_1411689 ?auto_1411690 ) ( ON ?auto_1411691 ?auto_1411689 ) ( ON ?auto_1411692 ?auto_1411691 ) ( ON ?auto_1411693 ?auto_1411692 ) ( ON ?auto_1411694 ?auto_1411693 ) ( ON ?auto_1411695 ?auto_1411694 ) ( ON ?auto_1411696 ?auto_1411695 ) ( not ( = ?auto_1411685 ?auto_1411686 ) ) ( not ( = ?auto_1411685 ?auto_1411687 ) ) ( not ( = ?auto_1411685 ?auto_1411684 ) ) ( not ( = ?auto_1411685 ?auto_1411688 ) ) ( not ( = ?auto_1411685 ?auto_1411690 ) ) ( not ( = ?auto_1411685 ?auto_1411689 ) ) ( not ( = ?auto_1411685 ?auto_1411691 ) ) ( not ( = ?auto_1411685 ?auto_1411692 ) ) ( not ( = ?auto_1411685 ?auto_1411693 ) ) ( not ( = ?auto_1411685 ?auto_1411694 ) ) ( not ( = ?auto_1411685 ?auto_1411695 ) ) ( not ( = ?auto_1411685 ?auto_1411696 ) ) ( not ( = ?auto_1411685 ?auto_1411697 ) ) ( not ( = ?auto_1411685 ?auto_1411698 ) ) ( not ( = ?auto_1411685 ?auto_1411700 ) ) ( not ( = ?auto_1411685 ?auto_1411703 ) ) ( not ( = ?auto_1411686 ?auto_1411687 ) ) ( not ( = ?auto_1411686 ?auto_1411684 ) ) ( not ( = ?auto_1411686 ?auto_1411688 ) ) ( not ( = ?auto_1411686 ?auto_1411690 ) ) ( not ( = ?auto_1411686 ?auto_1411689 ) ) ( not ( = ?auto_1411686 ?auto_1411691 ) ) ( not ( = ?auto_1411686 ?auto_1411692 ) ) ( not ( = ?auto_1411686 ?auto_1411693 ) ) ( not ( = ?auto_1411686 ?auto_1411694 ) ) ( not ( = ?auto_1411686 ?auto_1411695 ) ) ( not ( = ?auto_1411686 ?auto_1411696 ) ) ( not ( = ?auto_1411686 ?auto_1411697 ) ) ( not ( = ?auto_1411686 ?auto_1411698 ) ) ( not ( = ?auto_1411686 ?auto_1411700 ) ) ( not ( = ?auto_1411686 ?auto_1411703 ) ) ( not ( = ?auto_1411687 ?auto_1411684 ) ) ( not ( = ?auto_1411687 ?auto_1411688 ) ) ( not ( = ?auto_1411687 ?auto_1411690 ) ) ( not ( = ?auto_1411687 ?auto_1411689 ) ) ( not ( = ?auto_1411687 ?auto_1411691 ) ) ( not ( = ?auto_1411687 ?auto_1411692 ) ) ( not ( = ?auto_1411687 ?auto_1411693 ) ) ( not ( = ?auto_1411687 ?auto_1411694 ) ) ( not ( = ?auto_1411687 ?auto_1411695 ) ) ( not ( = ?auto_1411687 ?auto_1411696 ) ) ( not ( = ?auto_1411687 ?auto_1411697 ) ) ( not ( = ?auto_1411687 ?auto_1411698 ) ) ( not ( = ?auto_1411687 ?auto_1411700 ) ) ( not ( = ?auto_1411687 ?auto_1411703 ) ) ( not ( = ?auto_1411684 ?auto_1411688 ) ) ( not ( = ?auto_1411684 ?auto_1411690 ) ) ( not ( = ?auto_1411684 ?auto_1411689 ) ) ( not ( = ?auto_1411684 ?auto_1411691 ) ) ( not ( = ?auto_1411684 ?auto_1411692 ) ) ( not ( = ?auto_1411684 ?auto_1411693 ) ) ( not ( = ?auto_1411684 ?auto_1411694 ) ) ( not ( = ?auto_1411684 ?auto_1411695 ) ) ( not ( = ?auto_1411684 ?auto_1411696 ) ) ( not ( = ?auto_1411684 ?auto_1411697 ) ) ( not ( = ?auto_1411684 ?auto_1411698 ) ) ( not ( = ?auto_1411684 ?auto_1411700 ) ) ( not ( = ?auto_1411684 ?auto_1411703 ) ) ( not ( = ?auto_1411688 ?auto_1411690 ) ) ( not ( = ?auto_1411688 ?auto_1411689 ) ) ( not ( = ?auto_1411688 ?auto_1411691 ) ) ( not ( = ?auto_1411688 ?auto_1411692 ) ) ( not ( = ?auto_1411688 ?auto_1411693 ) ) ( not ( = ?auto_1411688 ?auto_1411694 ) ) ( not ( = ?auto_1411688 ?auto_1411695 ) ) ( not ( = ?auto_1411688 ?auto_1411696 ) ) ( not ( = ?auto_1411688 ?auto_1411697 ) ) ( not ( = ?auto_1411688 ?auto_1411698 ) ) ( not ( = ?auto_1411688 ?auto_1411700 ) ) ( not ( = ?auto_1411688 ?auto_1411703 ) ) ( not ( = ?auto_1411690 ?auto_1411689 ) ) ( not ( = ?auto_1411690 ?auto_1411691 ) ) ( not ( = ?auto_1411690 ?auto_1411692 ) ) ( not ( = ?auto_1411690 ?auto_1411693 ) ) ( not ( = ?auto_1411690 ?auto_1411694 ) ) ( not ( = ?auto_1411690 ?auto_1411695 ) ) ( not ( = ?auto_1411690 ?auto_1411696 ) ) ( not ( = ?auto_1411690 ?auto_1411697 ) ) ( not ( = ?auto_1411690 ?auto_1411698 ) ) ( not ( = ?auto_1411690 ?auto_1411700 ) ) ( not ( = ?auto_1411690 ?auto_1411703 ) ) ( not ( = ?auto_1411689 ?auto_1411691 ) ) ( not ( = ?auto_1411689 ?auto_1411692 ) ) ( not ( = ?auto_1411689 ?auto_1411693 ) ) ( not ( = ?auto_1411689 ?auto_1411694 ) ) ( not ( = ?auto_1411689 ?auto_1411695 ) ) ( not ( = ?auto_1411689 ?auto_1411696 ) ) ( not ( = ?auto_1411689 ?auto_1411697 ) ) ( not ( = ?auto_1411689 ?auto_1411698 ) ) ( not ( = ?auto_1411689 ?auto_1411700 ) ) ( not ( = ?auto_1411689 ?auto_1411703 ) ) ( not ( = ?auto_1411691 ?auto_1411692 ) ) ( not ( = ?auto_1411691 ?auto_1411693 ) ) ( not ( = ?auto_1411691 ?auto_1411694 ) ) ( not ( = ?auto_1411691 ?auto_1411695 ) ) ( not ( = ?auto_1411691 ?auto_1411696 ) ) ( not ( = ?auto_1411691 ?auto_1411697 ) ) ( not ( = ?auto_1411691 ?auto_1411698 ) ) ( not ( = ?auto_1411691 ?auto_1411700 ) ) ( not ( = ?auto_1411691 ?auto_1411703 ) ) ( not ( = ?auto_1411692 ?auto_1411693 ) ) ( not ( = ?auto_1411692 ?auto_1411694 ) ) ( not ( = ?auto_1411692 ?auto_1411695 ) ) ( not ( = ?auto_1411692 ?auto_1411696 ) ) ( not ( = ?auto_1411692 ?auto_1411697 ) ) ( not ( = ?auto_1411692 ?auto_1411698 ) ) ( not ( = ?auto_1411692 ?auto_1411700 ) ) ( not ( = ?auto_1411692 ?auto_1411703 ) ) ( not ( = ?auto_1411693 ?auto_1411694 ) ) ( not ( = ?auto_1411693 ?auto_1411695 ) ) ( not ( = ?auto_1411693 ?auto_1411696 ) ) ( not ( = ?auto_1411693 ?auto_1411697 ) ) ( not ( = ?auto_1411693 ?auto_1411698 ) ) ( not ( = ?auto_1411693 ?auto_1411700 ) ) ( not ( = ?auto_1411693 ?auto_1411703 ) ) ( not ( = ?auto_1411694 ?auto_1411695 ) ) ( not ( = ?auto_1411694 ?auto_1411696 ) ) ( not ( = ?auto_1411694 ?auto_1411697 ) ) ( not ( = ?auto_1411694 ?auto_1411698 ) ) ( not ( = ?auto_1411694 ?auto_1411700 ) ) ( not ( = ?auto_1411694 ?auto_1411703 ) ) ( not ( = ?auto_1411695 ?auto_1411696 ) ) ( not ( = ?auto_1411695 ?auto_1411697 ) ) ( not ( = ?auto_1411695 ?auto_1411698 ) ) ( not ( = ?auto_1411695 ?auto_1411700 ) ) ( not ( = ?auto_1411695 ?auto_1411703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411696 ?auto_1411697 ?auto_1411698 )
      ( MAKE-14CRATE-VERIFY ?auto_1411685 ?auto_1411686 ?auto_1411687 ?auto_1411684 ?auto_1411688 ?auto_1411690 ?auto_1411689 ?auto_1411691 ?auto_1411692 ?auto_1411693 ?auto_1411694 ?auto_1411695 ?auto_1411696 ?auto_1411697 ?auto_1411698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1411706 - SURFACE
      ?auto_1411707 - SURFACE
    )
    :vars
    (
      ?auto_1411712 - HOIST
      ?auto_1411708 - PLACE
      ?auto_1411711 - SURFACE
      ?auto_1411710 - PLACE
      ?auto_1411715 - HOIST
      ?auto_1411709 - SURFACE
      ?auto_1411713 - SURFACE
      ?auto_1411714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411712 ?auto_1411708 ) ( IS-CRATE ?auto_1411707 ) ( not ( = ?auto_1411706 ?auto_1411707 ) ) ( not ( = ?auto_1411711 ?auto_1411706 ) ) ( not ( = ?auto_1411711 ?auto_1411707 ) ) ( not ( = ?auto_1411710 ?auto_1411708 ) ) ( HOIST-AT ?auto_1411715 ?auto_1411710 ) ( not ( = ?auto_1411712 ?auto_1411715 ) ) ( SURFACE-AT ?auto_1411707 ?auto_1411710 ) ( ON ?auto_1411707 ?auto_1411709 ) ( CLEAR ?auto_1411707 ) ( not ( = ?auto_1411706 ?auto_1411709 ) ) ( not ( = ?auto_1411707 ?auto_1411709 ) ) ( not ( = ?auto_1411711 ?auto_1411709 ) ) ( SURFACE-AT ?auto_1411711 ?auto_1411708 ) ( CLEAR ?auto_1411711 ) ( IS-CRATE ?auto_1411706 ) ( AVAILABLE ?auto_1411712 ) ( AVAILABLE ?auto_1411715 ) ( SURFACE-AT ?auto_1411706 ?auto_1411710 ) ( ON ?auto_1411706 ?auto_1411713 ) ( CLEAR ?auto_1411706 ) ( not ( = ?auto_1411706 ?auto_1411713 ) ) ( not ( = ?auto_1411707 ?auto_1411713 ) ) ( not ( = ?auto_1411711 ?auto_1411713 ) ) ( not ( = ?auto_1411709 ?auto_1411713 ) ) ( TRUCK-AT ?auto_1411714 ?auto_1411708 ) )
    :subtasks
    ( ( !DRIVE ?auto_1411714 ?auto_1411708 ?auto_1411710 )
      ( MAKE-2CRATE ?auto_1411711 ?auto_1411706 ?auto_1411707 )
      ( MAKE-1CRATE-VERIFY ?auto_1411706 ?auto_1411707 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1411716 - SURFACE
      ?auto_1411717 - SURFACE
      ?auto_1411718 - SURFACE
    )
    :vars
    (
      ?auto_1411725 - HOIST
      ?auto_1411724 - PLACE
      ?auto_1411722 - PLACE
      ?auto_1411721 - HOIST
      ?auto_1411720 - SURFACE
      ?auto_1411723 - SURFACE
      ?auto_1411719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411725 ?auto_1411724 ) ( IS-CRATE ?auto_1411718 ) ( not ( = ?auto_1411717 ?auto_1411718 ) ) ( not ( = ?auto_1411716 ?auto_1411717 ) ) ( not ( = ?auto_1411716 ?auto_1411718 ) ) ( not ( = ?auto_1411722 ?auto_1411724 ) ) ( HOIST-AT ?auto_1411721 ?auto_1411722 ) ( not ( = ?auto_1411725 ?auto_1411721 ) ) ( SURFACE-AT ?auto_1411718 ?auto_1411722 ) ( ON ?auto_1411718 ?auto_1411720 ) ( CLEAR ?auto_1411718 ) ( not ( = ?auto_1411717 ?auto_1411720 ) ) ( not ( = ?auto_1411718 ?auto_1411720 ) ) ( not ( = ?auto_1411716 ?auto_1411720 ) ) ( SURFACE-AT ?auto_1411716 ?auto_1411724 ) ( CLEAR ?auto_1411716 ) ( IS-CRATE ?auto_1411717 ) ( AVAILABLE ?auto_1411725 ) ( AVAILABLE ?auto_1411721 ) ( SURFACE-AT ?auto_1411717 ?auto_1411722 ) ( ON ?auto_1411717 ?auto_1411723 ) ( CLEAR ?auto_1411717 ) ( not ( = ?auto_1411717 ?auto_1411723 ) ) ( not ( = ?auto_1411718 ?auto_1411723 ) ) ( not ( = ?auto_1411716 ?auto_1411723 ) ) ( not ( = ?auto_1411720 ?auto_1411723 ) ) ( TRUCK-AT ?auto_1411719 ?auto_1411724 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1411717 ?auto_1411718 )
      ( MAKE-2CRATE-VERIFY ?auto_1411716 ?auto_1411717 ?auto_1411718 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1411727 - SURFACE
      ?auto_1411728 - SURFACE
      ?auto_1411729 - SURFACE
      ?auto_1411726 - SURFACE
    )
    :vars
    (
      ?auto_1411735 - HOIST
      ?auto_1411730 - PLACE
      ?auto_1411736 - PLACE
      ?auto_1411731 - HOIST
      ?auto_1411733 - SURFACE
      ?auto_1411732 - SURFACE
      ?auto_1411734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411735 ?auto_1411730 ) ( IS-CRATE ?auto_1411726 ) ( not ( = ?auto_1411729 ?auto_1411726 ) ) ( not ( = ?auto_1411728 ?auto_1411729 ) ) ( not ( = ?auto_1411728 ?auto_1411726 ) ) ( not ( = ?auto_1411736 ?auto_1411730 ) ) ( HOIST-AT ?auto_1411731 ?auto_1411736 ) ( not ( = ?auto_1411735 ?auto_1411731 ) ) ( SURFACE-AT ?auto_1411726 ?auto_1411736 ) ( ON ?auto_1411726 ?auto_1411733 ) ( CLEAR ?auto_1411726 ) ( not ( = ?auto_1411729 ?auto_1411733 ) ) ( not ( = ?auto_1411726 ?auto_1411733 ) ) ( not ( = ?auto_1411728 ?auto_1411733 ) ) ( SURFACE-AT ?auto_1411728 ?auto_1411730 ) ( CLEAR ?auto_1411728 ) ( IS-CRATE ?auto_1411729 ) ( AVAILABLE ?auto_1411735 ) ( AVAILABLE ?auto_1411731 ) ( SURFACE-AT ?auto_1411729 ?auto_1411736 ) ( ON ?auto_1411729 ?auto_1411732 ) ( CLEAR ?auto_1411729 ) ( not ( = ?auto_1411729 ?auto_1411732 ) ) ( not ( = ?auto_1411726 ?auto_1411732 ) ) ( not ( = ?auto_1411728 ?auto_1411732 ) ) ( not ( = ?auto_1411733 ?auto_1411732 ) ) ( TRUCK-AT ?auto_1411734 ?auto_1411730 ) ( ON ?auto_1411728 ?auto_1411727 ) ( not ( = ?auto_1411727 ?auto_1411728 ) ) ( not ( = ?auto_1411727 ?auto_1411729 ) ) ( not ( = ?auto_1411727 ?auto_1411726 ) ) ( not ( = ?auto_1411727 ?auto_1411733 ) ) ( not ( = ?auto_1411727 ?auto_1411732 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411728 ?auto_1411729 ?auto_1411726 )
      ( MAKE-3CRATE-VERIFY ?auto_1411727 ?auto_1411728 ?auto_1411729 ?auto_1411726 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1411738 - SURFACE
      ?auto_1411739 - SURFACE
      ?auto_1411740 - SURFACE
      ?auto_1411737 - SURFACE
      ?auto_1411741 - SURFACE
    )
    :vars
    (
      ?auto_1411747 - HOIST
      ?auto_1411742 - PLACE
      ?auto_1411748 - PLACE
      ?auto_1411743 - HOIST
      ?auto_1411745 - SURFACE
      ?auto_1411744 - SURFACE
      ?auto_1411746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411747 ?auto_1411742 ) ( IS-CRATE ?auto_1411741 ) ( not ( = ?auto_1411737 ?auto_1411741 ) ) ( not ( = ?auto_1411740 ?auto_1411737 ) ) ( not ( = ?auto_1411740 ?auto_1411741 ) ) ( not ( = ?auto_1411748 ?auto_1411742 ) ) ( HOIST-AT ?auto_1411743 ?auto_1411748 ) ( not ( = ?auto_1411747 ?auto_1411743 ) ) ( SURFACE-AT ?auto_1411741 ?auto_1411748 ) ( ON ?auto_1411741 ?auto_1411745 ) ( CLEAR ?auto_1411741 ) ( not ( = ?auto_1411737 ?auto_1411745 ) ) ( not ( = ?auto_1411741 ?auto_1411745 ) ) ( not ( = ?auto_1411740 ?auto_1411745 ) ) ( SURFACE-AT ?auto_1411740 ?auto_1411742 ) ( CLEAR ?auto_1411740 ) ( IS-CRATE ?auto_1411737 ) ( AVAILABLE ?auto_1411747 ) ( AVAILABLE ?auto_1411743 ) ( SURFACE-AT ?auto_1411737 ?auto_1411748 ) ( ON ?auto_1411737 ?auto_1411744 ) ( CLEAR ?auto_1411737 ) ( not ( = ?auto_1411737 ?auto_1411744 ) ) ( not ( = ?auto_1411741 ?auto_1411744 ) ) ( not ( = ?auto_1411740 ?auto_1411744 ) ) ( not ( = ?auto_1411745 ?auto_1411744 ) ) ( TRUCK-AT ?auto_1411746 ?auto_1411742 ) ( ON ?auto_1411739 ?auto_1411738 ) ( ON ?auto_1411740 ?auto_1411739 ) ( not ( = ?auto_1411738 ?auto_1411739 ) ) ( not ( = ?auto_1411738 ?auto_1411740 ) ) ( not ( = ?auto_1411738 ?auto_1411737 ) ) ( not ( = ?auto_1411738 ?auto_1411741 ) ) ( not ( = ?auto_1411738 ?auto_1411745 ) ) ( not ( = ?auto_1411738 ?auto_1411744 ) ) ( not ( = ?auto_1411739 ?auto_1411740 ) ) ( not ( = ?auto_1411739 ?auto_1411737 ) ) ( not ( = ?auto_1411739 ?auto_1411741 ) ) ( not ( = ?auto_1411739 ?auto_1411745 ) ) ( not ( = ?auto_1411739 ?auto_1411744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411740 ?auto_1411737 ?auto_1411741 )
      ( MAKE-4CRATE-VERIFY ?auto_1411738 ?auto_1411739 ?auto_1411740 ?auto_1411737 ?auto_1411741 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1411750 - SURFACE
      ?auto_1411751 - SURFACE
      ?auto_1411752 - SURFACE
      ?auto_1411749 - SURFACE
      ?auto_1411753 - SURFACE
      ?auto_1411754 - SURFACE
    )
    :vars
    (
      ?auto_1411760 - HOIST
      ?auto_1411755 - PLACE
      ?auto_1411761 - PLACE
      ?auto_1411756 - HOIST
      ?auto_1411758 - SURFACE
      ?auto_1411757 - SURFACE
      ?auto_1411759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411760 ?auto_1411755 ) ( IS-CRATE ?auto_1411754 ) ( not ( = ?auto_1411753 ?auto_1411754 ) ) ( not ( = ?auto_1411749 ?auto_1411753 ) ) ( not ( = ?auto_1411749 ?auto_1411754 ) ) ( not ( = ?auto_1411761 ?auto_1411755 ) ) ( HOIST-AT ?auto_1411756 ?auto_1411761 ) ( not ( = ?auto_1411760 ?auto_1411756 ) ) ( SURFACE-AT ?auto_1411754 ?auto_1411761 ) ( ON ?auto_1411754 ?auto_1411758 ) ( CLEAR ?auto_1411754 ) ( not ( = ?auto_1411753 ?auto_1411758 ) ) ( not ( = ?auto_1411754 ?auto_1411758 ) ) ( not ( = ?auto_1411749 ?auto_1411758 ) ) ( SURFACE-AT ?auto_1411749 ?auto_1411755 ) ( CLEAR ?auto_1411749 ) ( IS-CRATE ?auto_1411753 ) ( AVAILABLE ?auto_1411760 ) ( AVAILABLE ?auto_1411756 ) ( SURFACE-AT ?auto_1411753 ?auto_1411761 ) ( ON ?auto_1411753 ?auto_1411757 ) ( CLEAR ?auto_1411753 ) ( not ( = ?auto_1411753 ?auto_1411757 ) ) ( not ( = ?auto_1411754 ?auto_1411757 ) ) ( not ( = ?auto_1411749 ?auto_1411757 ) ) ( not ( = ?auto_1411758 ?auto_1411757 ) ) ( TRUCK-AT ?auto_1411759 ?auto_1411755 ) ( ON ?auto_1411751 ?auto_1411750 ) ( ON ?auto_1411752 ?auto_1411751 ) ( ON ?auto_1411749 ?auto_1411752 ) ( not ( = ?auto_1411750 ?auto_1411751 ) ) ( not ( = ?auto_1411750 ?auto_1411752 ) ) ( not ( = ?auto_1411750 ?auto_1411749 ) ) ( not ( = ?auto_1411750 ?auto_1411753 ) ) ( not ( = ?auto_1411750 ?auto_1411754 ) ) ( not ( = ?auto_1411750 ?auto_1411758 ) ) ( not ( = ?auto_1411750 ?auto_1411757 ) ) ( not ( = ?auto_1411751 ?auto_1411752 ) ) ( not ( = ?auto_1411751 ?auto_1411749 ) ) ( not ( = ?auto_1411751 ?auto_1411753 ) ) ( not ( = ?auto_1411751 ?auto_1411754 ) ) ( not ( = ?auto_1411751 ?auto_1411758 ) ) ( not ( = ?auto_1411751 ?auto_1411757 ) ) ( not ( = ?auto_1411752 ?auto_1411749 ) ) ( not ( = ?auto_1411752 ?auto_1411753 ) ) ( not ( = ?auto_1411752 ?auto_1411754 ) ) ( not ( = ?auto_1411752 ?auto_1411758 ) ) ( not ( = ?auto_1411752 ?auto_1411757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411749 ?auto_1411753 ?auto_1411754 )
      ( MAKE-5CRATE-VERIFY ?auto_1411750 ?auto_1411751 ?auto_1411752 ?auto_1411749 ?auto_1411753 ?auto_1411754 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1411763 - SURFACE
      ?auto_1411764 - SURFACE
      ?auto_1411765 - SURFACE
      ?auto_1411762 - SURFACE
      ?auto_1411766 - SURFACE
      ?auto_1411768 - SURFACE
      ?auto_1411767 - SURFACE
    )
    :vars
    (
      ?auto_1411774 - HOIST
      ?auto_1411769 - PLACE
      ?auto_1411775 - PLACE
      ?auto_1411770 - HOIST
      ?auto_1411772 - SURFACE
      ?auto_1411771 - SURFACE
      ?auto_1411773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411774 ?auto_1411769 ) ( IS-CRATE ?auto_1411767 ) ( not ( = ?auto_1411768 ?auto_1411767 ) ) ( not ( = ?auto_1411766 ?auto_1411768 ) ) ( not ( = ?auto_1411766 ?auto_1411767 ) ) ( not ( = ?auto_1411775 ?auto_1411769 ) ) ( HOIST-AT ?auto_1411770 ?auto_1411775 ) ( not ( = ?auto_1411774 ?auto_1411770 ) ) ( SURFACE-AT ?auto_1411767 ?auto_1411775 ) ( ON ?auto_1411767 ?auto_1411772 ) ( CLEAR ?auto_1411767 ) ( not ( = ?auto_1411768 ?auto_1411772 ) ) ( not ( = ?auto_1411767 ?auto_1411772 ) ) ( not ( = ?auto_1411766 ?auto_1411772 ) ) ( SURFACE-AT ?auto_1411766 ?auto_1411769 ) ( CLEAR ?auto_1411766 ) ( IS-CRATE ?auto_1411768 ) ( AVAILABLE ?auto_1411774 ) ( AVAILABLE ?auto_1411770 ) ( SURFACE-AT ?auto_1411768 ?auto_1411775 ) ( ON ?auto_1411768 ?auto_1411771 ) ( CLEAR ?auto_1411768 ) ( not ( = ?auto_1411768 ?auto_1411771 ) ) ( not ( = ?auto_1411767 ?auto_1411771 ) ) ( not ( = ?auto_1411766 ?auto_1411771 ) ) ( not ( = ?auto_1411772 ?auto_1411771 ) ) ( TRUCK-AT ?auto_1411773 ?auto_1411769 ) ( ON ?auto_1411764 ?auto_1411763 ) ( ON ?auto_1411765 ?auto_1411764 ) ( ON ?auto_1411762 ?auto_1411765 ) ( ON ?auto_1411766 ?auto_1411762 ) ( not ( = ?auto_1411763 ?auto_1411764 ) ) ( not ( = ?auto_1411763 ?auto_1411765 ) ) ( not ( = ?auto_1411763 ?auto_1411762 ) ) ( not ( = ?auto_1411763 ?auto_1411766 ) ) ( not ( = ?auto_1411763 ?auto_1411768 ) ) ( not ( = ?auto_1411763 ?auto_1411767 ) ) ( not ( = ?auto_1411763 ?auto_1411772 ) ) ( not ( = ?auto_1411763 ?auto_1411771 ) ) ( not ( = ?auto_1411764 ?auto_1411765 ) ) ( not ( = ?auto_1411764 ?auto_1411762 ) ) ( not ( = ?auto_1411764 ?auto_1411766 ) ) ( not ( = ?auto_1411764 ?auto_1411768 ) ) ( not ( = ?auto_1411764 ?auto_1411767 ) ) ( not ( = ?auto_1411764 ?auto_1411772 ) ) ( not ( = ?auto_1411764 ?auto_1411771 ) ) ( not ( = ?auto_1411765 ?auto_1411762 ) ) ( not ( = ?auto_1411765 ?auto_1411766 ) ) ( not ( = ?auto_1411765 ?auto_1411768 ) ) ( not ( = ?auto_1411765 ?auto_1411767 ) ) ( not ( = ?auto_1411765 ?auto_1411772 ) ) ( not ( = ?auto_1411765 ?auto_1411771 ) ) ( not ( = ?auto_1411762 ?auto_1411766 ) ) ( not ( = ?auto_1411762 ?auto_1411768 ) ) ( not ( = ?auto_1411762 ?auto_1411767 ) ) ( not ( = ?auto_1411762 ?auto_1411772 ) ) ( not ( = ?auto_1411762 ?auto_1411771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411766 ?auto_1411768 ?auto_1411767 )
      ( MAKE-6CRATE-VERIFY ?auto_1411763 ?auto_1411764 ?auto_1411765 ?auto_1411762 ?auto_1411766 ?auto_1411768 ?auto_1411767 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1411777 - SURFACE
      ?auto_1411778 - SURFACE
      ?auto_1411779 - SURFACE
      ?auto_1411776 - SURFACE
      ?auto_1411780 - SURFACE
      ?auto_1411782 - SURFACE
      ?auto_1411781 - SURFACE
      ?auto_1411783 - SURFACE
    )
    :vars
    (
      ?auto_1411789 - HOIST
      ?auto_1411784 - PLACE
      ?auto_1411790 - PLACE
      ?auto_1411785 - HOIST
      ?auto_1411787 - SURFACE
      ?auto_1411786 - SURFACE
      ?auto_1411788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411789 ?auto_1411784 ) ( IS-CRATE ?auto_1411783 ) ( not ( = ?auto_1411781 ?auto_1411783 ) ) ( not ( = ?auto_1411782 ?auto_1411781 ) ) ( not ( = ?auto_1411782 ?auto_1411783 ) ) ( not ( = ?auto_1411790 ?auto_1411784 ) ) ( HOIST-AT ?auto_1411785 ?auto_1411790 ) ( not ( = ?auto_1411789 ?auto_1411785 ) ) ( SURFACE-AT ?auto_1411783 ?auto_1411790 ) ( ON ?auto_1411783 ?auto_1411787 ) ( CLEAR ?auto_1411783 ) ( not ( = ?auto_1411781 ?auto_1411787 ) ) ( not ( = ?auto_1411783 ?auto_1411787 ) ) ( not ( = ?auto_1411782 ?auto_1411787 ) ) ( SURFACE-AT ?auto_1411782 ?auto_1411784 ) ( CLEAR ?auto_1411782 ) ( IS-CRATE ?auto_1411781 ) ( AVAILABLE ?auto_1411789 ) ( AVAILABLE ?auto_1411785 ) ( SURFACE-AT ?auto_1411781 ?auto_1411790 ) ( ON ?auto_1411781 ?auto_1411786 ) ( CLEAR ?auto_1411781 ) ( not ( = ?auto_1411781 ?auto_1411786 ) ) ( not ( = ?auto_1411783 ?auto_1411786 ) ) ( not ( = ?auto_1411782 ?auto_1411786 ) ) ( not ( = ?auto_1411787 ?auto_1411786 ) ) ( TRUCK-AT ?auto_1411788 ?auto_1411784 ) ( ON ?auto_1411778 ?auto_1411777 ) ( ON ?auto_1411779 ?auto_1411778 ) ( ON ?auto_1411776 ?auto_1411779 ) ( ON ?auto_1411780 ?auto_1411776 ) ( ON ?auto_1411782 ?auto_1411780 ) ( not ( = ?auto_1411777 ?auto_1411778 ) ) ( not ( = ?auto_1411777 ?auto_1411779 ) ) ( not ( = ?auto_1411777 ?auto_1411776 ) ) ( not ( = ?auto_1411777 ?auto_1411780 ) ) ( not ( = ?auto_1411777 ?auto_1411782 ) ) ( not ( = ?auto_1411777 ?auto_1411781 ) ) ( not ( = ?auto_1411777 ?auto_1411783 ) ) ( not ( = ?auto_1411777 ?auto_1411787 ) ) ( not ( = ?auto_1411777 ?auto_1411786 ) ) ( not ( = ?auto_1411778 ?auto_1411779 ) ) ( not ( = ?auto_1411778 ?auto_1411776 ) ) ( not ( = ?auto_1411778 ?auto_1411780 ) ) ( not ( = ?auto_1411778 ?auto_1411782 ) ) ( not ( = ?auto_1411778 ?auto_1411781 ) ) ( not ( = ?auto_1411778 ?auto_1411783 ) ) ( not ( = ?auto_1411778 ?auto_1411787 ) ) ( not ( = ?auto_1411778 ?auto_1411786 ) ) ( not ( = ?auto_1411779 ?auto_1411776 ) ) ( not ( = ?auto_1411779 ?auto_1411780 ) ) ( not ( = ?auto_1411779 ?auto_1411782 ) ) ( not ( = ?auto_1411779 ?auto_1411781 ) ) ( not ( = ?auto_1411779 ?auto_1411783 ) ) ( not ( = ?auto_1411779 ?auto_1411787 ) ) ( not ( = ?auto_1411779 ?auto_1411786 ) ) ( not ( = ?auto_1411776 ?auto_1411780 ) ) ( not ( = ?auto_1411776 ?auto_1411782 ) ) ( not ( = ?auto_1411776 ?auto_1411781 ) ) ( not ( = ?auto_1411776 ?auto_1411783 ) ) ( not ( = ?auto_1411776 ?auto_1411787 ) ) ( not ( = ?auto_1411776 ?auto_1411786 ) ) ( not ( = ?auto_1411780 ?auto_1411782 ) ) ( not ( = ?auto_1411780 ?auto_1411781 ) ) ( not ( = ?auto_1411780 ?auto_1411783 ) ) ( not ( = ?auto_1411780 ?auto_1411787 ) ) ( not ( = ?auto_1411780 ?auto_1411786 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411782 ?auto_1411781 ?auto_1411783 )
      ( MAKE-7CRATE-VERIFY ?auto_1411777 ?auto_1411778 ?auto_1411779 ?auto_1411776 ?auto_1411780 ?auto_1411782 ?auto_1411781 ?auto_1411783 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1411792 - SURFACE
      ?auto_1411793 - SURFACE
      ?auto_1411794 - SURFACE
      ?auto_1411791 - SURFACE
      ?auto_1411795 - SURFACE
      ?auto_1411797 - SURFACE
      ?auto_1411796 - SURFACE
      ?auto_1411798 - SURFACE
      ?auto_1411799 - SURFACE
    )
    :vars
    (
      ?auto_1411805 - HOIST
      ?auto_1411800 - PLACE
      ?auto_1411806 - PLACE
      ?auto_1411801 - HOIST
      ?auto_1411803 - SURFACE
      ?auto_1411802 - SURFACE
      ?auto_1411804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411805 ?auto_1411800 ) ( IS-CRATE ?auto_1411799 ) ( not ( = ?auto_1411798 ?auto_1411799 ) ) ( not ( = ?auto_1411796 ?auto_1411798 ) ) ( not ( = ?auto_1411796 ?auto_1411799 ) ) ( not ( = ?auto_1411806 ?auto_1411800 ) ) ( HOIST-AT ?auto_1411801 ?auto_1411806 ) ( not ( = ?auto_1411805 ?auto_1411801 ) ) ( SURFACE-AT ?auto_1411799 ?auto_1411806 ) ( ON ?auto_1411799 ?auto_1411803 ) ( CLEAR ?auto_1411799 ) ( not ( = ?auto_1411798 ?auto_1411803 ) ) ( not ( = ?auto_1411799 ?auto_1411803 ) ) ( not ( = ?auto_1411796 ?auto_1411803 ) ) ( SURFACE-AT ?auto_1411796 ?auto_1411800 ) ( CLEAR ?auto_1411796 ) ( IS-CRATE ?auto_1411798 ) ( AVAILABLE ?auto_1411805 ) ( AVAILABLE ?auto_1411801 ) ( SURFACE-AT ?auto_1411798 ?auto_1411806 ) ( ON ?auto_1411798 ?auto_1411802 ) ( CLEAR ?auto_1411798 ) ( not ( = ?auto_1411798 ?auto_1411802 ) ) ( not ( = ?auto_1411799 ?auto_1411802 ) ) ( not ( = ?auto_1411796 ?auto_1411802 ) ) ( not ( = ?auto_1411803 ?auto_1411802 ) ) ( TRUCK-AT ?auto_1411804 ?auto_1411800 ) ( ON ?auto_1411793 ?auto_1411792 ) ( ON ?auto_1411794 ?auto_1411793 ) ( ON ?auto_1411791 ?auto_1411794 ) ( ON ?auto_1411795 ?auto_1411791 ) ( ON ?auto_1411797 ?auto_1411795 ) ( ON ?auto_1411796 ?auto_1411797 ) ( not ( = ?auto_1411792 ?auto_1411793 ) ) ( not ( = ?auto_1411792 ?auto_1411794 ) ) ( not ( = ?auto_1411792 ?auto_1411791 ) ) ( not ( = ?auto_1411792 ?auto_1411795 ) ) ( not ( = ?auto_1411792 ?auto_1411797 ) ) ( not ( = ?auto_1411792 ?auto_1411796 ) ) ( not ( = ?auto_1411792 ?auto_1411798 ) ) ( not ( = ?auto_1411792 ?auto_1411799 ) ) ( not ( = ?auto_1411792 ?auto_1411803 ) ) ( not ( = ?auto_1411792 ?auto_1411802 ) ) ( not ( = ?auto_1411793 ?auto_1411794 ) ) ( not ( = ?auto_1411793 ?auto_1411791 ) ) ( not ( = ?auto_1411793 ?auto_1411795 ) ) ( not ( = ?auto_1411793 ?auto_1411797 ) ) ( not ( = ?auto_1411793 ?auto_1411796 ) ) ( not ( = ?auto_1411793 ?auto_1411798 ) ) ( not ( = ?auto_1411793 ?auto_1411799 ) ) ( not ( = ?auto_1411793 ?auto_1411803 ) ) ( not ( = ?auto_1411793 ?auto_1411802 ) ) ( not ( = ?auto_1411794 ?auto_1411791 ) ) ( not ( = ?auto_1411794 ?auto_1411795 ) ) ( not ( = ?auto_1411794 ?auto_1411797 ) ) ( not ( = ?auto_1411794 ?auto_1411796 ) ) ( not ( = ?auto_1411794 ?auto_1411798 ) ) ( not ( = ?auto_1411794 ?auto_1411799 ) ) ( not ( = ?auto_1411794 ?auto_1411803 ) ) ( not ( = ?auto_1411794 ?auto_1411802 ) ) ( not ( = ?auto_1411791 ?auto_1411795 ) ) ( not ( = ?auto_1411791 ?auto_1411797 ) ) ( not ( = ?auto_1411791 ?auto_1411796 ) ) ( not ( = ?auto_1411791 ?auto_1411798 ) ) ( not ( = ?auto_1411791 ?auto_1411799 ) ) ( not ( = ?auto_1411791 ?auto_1411803 ) ) ( not ( = ?auto_1411791 ?auto_1411802 ) ) ( not ( = ?auto_1411795 ?auto_1411797 ) ) ( not ( = ?auto_1411795 ?auto_1411796 ) ) ( not ( = ?auto_1411795 ?auto_1411798 ) ) ( not ( = ?auto_1411795 ?auto_1411799 ) ) ( not ( = ?auto_1411795 ?auto_1411803 ) ) ( not ( = ?auto_1411795 ?auto_1411802 ) ) ( not ( = ?auto_1411797 ?auto_1411796 ) ) ( not ( = ?auto_1411797 ?auto_1411798 ) ) ( not ( = ?auto_1411797 ?auto_1411799 ) ) ( not ( = ?auto_1411797 ?auto_1411803 ) ) ( not ( = ?auto_1411797 ?auto_1411802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411796 ?auto_1411798 ?auto_1411799 )
      ( MAKE-8CRATE-VERIFY ?auto_1411792 ?auto_1411793 ?auto_1411794 ?auto_1411791 ?auto_1411795 ?auto_1411797 ?auto_1411796 ?auto_1411798 ?auto_1411799 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1411808 - SURFACE
      ?auto_1411809 - SURFACE
      ?auto_1411810 - SURFACE
      ?auto_1411807 - SURFACE
      ?auto_1411811 - SURFACE
      ?auto_1411813 - SURFACE
      ?auto_1411812 - SURFACE
      ?auto_1411814 - SURFACE
      ?auto_1411815 - SURFACE
      ?auto_1411816 - SURFACE
    )
    :vars
    (
      ?auto_1411822 - HOIST
      ?auto_1411817 - PLACE
      ?auto_1411823 - PLACE
      ?auto_1411818 - HOIST
      ?auto_1411820 - SURFACE
      ?auto_1411819 - SURFACE
      ?auto_1411821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411822 ?auto_1411817 ) ( IS-CRATE ?auto_1411816 ) ( not ( = ?auto_1411815 ?auto_1411816 ) ) ( not ( = ?auto_1411814 ?auto_1411815 ) ) ( not ( = ?auto_1411814 ?auto_1411816 ) ) ( not ( = ?auto_1411823 ?auto_1411817 ) ) ( HOIST-AT ?auto_1411818 ?auto_1411823 ) ( not ( = ?auto_1411822 ?auto_1411818 ) ) ( SURFACE-AT ?auto_1411816 ?auto_1411823 ) ( ON ?auto_1411816 ?auto_1411820 ) ( CLEAR ?auto_1411816 ) ( not ( = ?auto_1411815 ?auto_1411820 ) ) ( not ( = ?auto_1411816 ?auto_1411820 ) ) ( not ( = ?auto_1411814 ?auto_1411820 ) ) ( SURFACE-AT ?auto_1411814 ?auto_1411817 ) ( CLEAR ?auto_1411814 ) ( IS-CRATE ?auto_1411815 ) ( AVAILABLE ?auto_1411822 ) ( AVAILABLE ?auto_1411818 ) ( SURFACE-AT ?auto_1411815 ?auto_1411823 ) ( ON ?auto_1411815 ?auto_1411819 ) ( CLEAR ?auto_1411815 ) ( not ( = ?auto_1411815 ?auto_1411819 ) ) ( not ( = ?auto_1411816 ?auto_1411819 ) ) ( not ( = ?auto_1411814 ?auto_1411819 ) ) ( not ( = ?auto_1411820 ?auto_1411819 ) ) ( TRUCK-AT ?auto_1411821 ?auto_1411817 ) ( ON ?auto_1411809 ?auto_1411808 ) ( ON ?auto_1411810 ?auto_1411809 ) ( ON ?auto_1411807 ?auto_1411810 ) ( ON ?auto_1411811 ?auto_1411807 ) ( ON ?auto_1411813 ?auto_1411811 ) ( ON ?auto_1411812 ?auto_1411813 ) ( ON ?auto_1411814 ?auto_1411812 ) ( not ( = ?auto_1411808 ?auto_1411809 ) ) ( not ( = ?auto_1411808 ?auto_1411810 ) ) ( not ( = ?auto_1411808 ?auto_1411807 ) ) ( not ( = ?auto_1411808 ?auto_1411811 ) ) ( not ( = ?auto_1411808 ?auto_1411813 ) ) ( not ( = ?auto_1411808 ?auto_1411812 ) ) ( not ( = ?auto_1411808 ?auto_1411814 ) ) ( not ( = ?auto_1411808 ?auto_1411815 ) ) ( not ( = ?auto_1411808 ?auto_1411816 ) ) ( not ( = ?auto_1411808 ?auto_1411820 ) ) ( not ( = ?auto_1411808 ?auto_1411819 ) ) ( not ( = ?auto_1411809 ?auto_1411810 ) ) ( not ( = ?auto_1411809 ?auto_1411807 ) ) ( not ( = ?auto_1411809 ?auto_1411811 ) ) ( not ( = ?auto_1411809 ?auto_1411813 ) ) ( not ( = ?auto_1411809 ?auto_1411812 ) ) ( not ( = ?auto_1411809 ?auto_1411814 ) ) ( not ( = ?auto_1411809 ?auto_1411815 ) ) ( not ( = ?auto_1411809 ?auto_1411816 ) ) ( not ( = ?auto_1411809 ?auto_1411820 ) ) ( not ( = ?auto_1411809 ?auto_1411819 ) ) ( not ( = ?auto_1411810 ?auto_1411807 ) ) ( not ( = ?auto_1411810 ?auto_1411811 ) ) ( not ( = ?auto_1411810 ?auto_1411813 ) ) ( not ( = ?auto_1411810 ?auto_1411812 ) ) ( not ( = ?auto_1411810 ?auto_1411814 ) ) ( not ( = ?auto_1411810 ?auto_1411815 ) ) ( not ( = ?auto_1411810 ?auto_1411816 ) ) ( not ( = ?auto_1411810 ?auto_1411820 ) ) ( not ( = ?auto_1411810 ?auto_1411819 ) ) ( not ( = ?auto_1411807 ?auto_1411811 ) ) ( not ( = ?auto_1411807 ?auto_1411813 ) ) ( not ( = ?auto_1411807 ?auto_1411812 ) ) ( not ( = ?auto_1411807 ?auto_1411814 ) ) ( not ( = ?auto_1411807 ?auto_1411815 ) ) ( not ( = ?auto_1411807 ?auto_1411816 ) ) ( not ( = ?auto_1411807 ?auto_1411820 ) ) ( not ( = ?auto_1411807 ?auto_1411819 ) ) ( not ( = ?auto_1411811 ?auto_1411813 ) ) ( not ( = ?auto_1411811 ?auto_1411812 ) ) ( not ( = ?auto_1411811 ?auto_1411814 ) ) ( not ( = ?auto_1411811 ?auto_1411815 ) ) ( not ( = ?auto_1411811 ?auto_1411816 ) ) ( not ( = ?auto_1411811 ?auto_1411820 ) ) ( not ( = ?auto_1411811 ?auto_1411819 ) ) ( not ( = ?auto_1411813 ?auto_1411812 ) ) ( not ( = ?auto_1411813 ?auto_1411814 ) ) ( not ( = ?auto_1411813 ?auto_1411815 ) ) ( not ( = ?auto_1411813 ?auto_1411816 ) ) ( not ( = ?auto_1411813 ?auto_1411820 ) ) ( not ( = ?auto_1411813 ?auto_1411819 ) ) ( not ( = ?auto_1411812 ?auto_1411814 ) ) ( not ( = ?auto_1411812 ?auto_1411815 ) ) ( not ( = ?auto_1411812 ?auto_1411816 ) ) ( not ( = ?auto_1411812 ?auto_1411820 ) ) ( not ( = ?auto_1411812 ?auto_1411819 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411814 ?auto_1411815 ?auto_1411816 )
      ( MAKE-9CRATE-VERIFY ?auto_1411808 ?auto_1411809 ?auto_1411810 ?auto_1411807 ?auto_1411811 ?auto_1411813 ?auto_1411812 ?auto_1411814 ?auto_1411815 ?auto_1411816 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1411825 - SURFACE
      ?auto_1411826 - SURFACE
      ?auto_1411827 - SURFACE
      ?auto_1411824 - SURFACE
      ?auto_1411828 - SURFACE
      ?auto_1411830 - SURFACE
      ?auto_1411829 - SURFACE
      ?auto_1411831 - SURFACE
      ?auto_1411832 - SURFACE
      ?auto_1411833 - SURFACE
      ?auto_1411834 - SURFACE
    )
    :vars
    (
      ?auto_1411840 - HOIST
      ?auto_1411835 - PLACE
      ?auto_1411841 - PLACE
      ?auto_1411836 - HOIST
      ?auto_1411838 - SURFACE
      ?auto_1411837 - SURFACE
      ?auto_1411839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411840 ?auto_1411835 ) ( IS-CRATE ?auto_1411834 ) ( not ( = ?auto_1411833 ?auto_1411834 ) ) ( not ( = ?auto_1411832 ?auto_1411833 ) ) ( not ( = ?auto_1411832 ?auto_1411834 ) ) ( not ( = ?auto_1411841 ?auto_1411835 ) ) ( HOIST-AT ?auto_1411836 ?auto_1411841 ) ( not ( = ?auto_1411840 ?auto_1411836 ) ) ( SURFACE-AT ?auto_1411834 ?auto_1411841 ) ( ON ?auto_1411834 ?auto_1411838 ) ( CLEAR ?auto_1411834 ) ( not ( = ?auto_1411833 ?auto_1411838 ) ) ( not ( = ?auto_1411834 ?auto_1411838 ) ) ( not ( = ?auto_1411832 ?auto_1411838 ) ) ( SURFACE-AT ?auto_1411832 ?auto_1411835 ) ( CLEAR ?auto_1411832 ) ( IS-CRATE ?auto_1411833 ) ( AVAILABLE ?auto_1411840 ) ( AVAILABLE ?auto_1411836 ) ( SURFACE-AT ?auto_1411833 ?auto_1411841 ) ( ON ?auto_1411833 ?auto_1411837 ) ( CLEAR ?auto_1411833 ) ( not ( = ?auto_1411833 ?auto_1411837 ) ) ( not ( = ?auto_1411834 ?auto_1411837 ) ) ( not ( = ?auto_1411832 ?auto_1411837 ) ) ( not ( = ?auto_1411838 ?auto_1411837 ) ) ( TRUCK-AT ?auto_1411839 ?auto_1411835 ) ( ON ?auto_1411826 ?auto_1411825 ) ( ON ?auto_1411827 ?auto_1411826 ) ( ON ?auto_1411824 ?auto_1411827 ) ( ON ?auto_1411828 ?auto_1411824 ) ( ON ?auto_1411830 ?auto_1411828 ) ( ON ?auto_1411829 ?auto_1411830 ) ( ON ?auto_1411831 ?auto_1411829 ) ( ON ?auto_1411832 ?auto_1411831 ) ( not ( = ?auto_1411825 ?auto_1411826 ) ) ( not ( = ?auto_1411825 ?auto_1411827 ) ) ( not ( = ?auto_1411825 ?auto_1411824 ) ) ( not ( = ?auto_1411825 ?auto_1411828 ) ) ( not ( = ?auto_1411825 ?auto_1411830 ) ) ( not ( = ?auto_1411825 ?auto_1411829 ) ) ( not ( = ?auto_1411825 ?auto_1411831 ) ) ( not ( = ?auto_1411825 ?auto_1411832 ) ) ( not ( = ?auto_1411825 ?auto_1411833 ) ) ( not ( = ?auto_1411825 ?auto_1411834 ) ) ( not ( = ?auto_1411825 ?auto_1411838 ) ) ( not ( = ?auto_1411825 ?auto_1411837 ) ) ( not ( = ?auto_1411826 ?auto_1411827 ) ) ( not ( = ?auto_1411826 ?auto_1411824 ) ) ( not ( = ?auto_1411826 ?auto_1411828 ) ) ( not ( = ?auto_1411826 ?auto_1411830 ) ) ( not ( = ?auto_1411826 ?auto_1411829 ) ) ( not ( = ?auto_1411826 ?auto_1411831 ) ) ( not ( = ?auto_1411826 ?auto_1411832 ) ) ( not ( = ?auto_1411826 ?auto_1411833 ) ) ( not ( = ?auto_1411826 ?auto_1411834 ) ) ( not ( = ?auto_1411826 ?auto_1411838 ) ) ( not ( = ?auto_1411826 ?auto_1411837 ) ) ( not ( = ?auto_1411827 ?auto_1411824 ) ) ( not ( = ?auto_1411827 ?auto_1411828 ) ) ( not ( = ?auto_1411827 ?auto_1411830 ) ) ( not ( = ?auto_1411827 ?auto_1411829 ) ) ( not ( = ?auto_1411827 ?auto_1411831 ) ) ( not ( = ?auto_1411827 ?auto_1411832 ) ) ( not ( = ?auto_1411827 ?auto_1411833 ) ) ( not ( = ?auto_1411827 ?auto_1411834 ) ) ( not ( = ?auto_1411827 ?auto_1411838 ) ) ( not ( = ?auto_1411827 ?auto_1411837 ) ) ( not ( = ?auto_1411824 ?auto_1411828 ) ) ( not ( = ?auto_1411824 ?auto_1411830 ) ) ( not ( = ?auto_1411824 ?auto_1411829 ) ) ( not ( = ?auto_1411824 ?auto_1411831 ) ) ( not ( = ?auto_1411824 ?auto_1411832 ) ) ( not ( = ?auto_1411824 ?auto_1411833 ) ) ( not ( = ?auto_1411824 ?auto_1411834 ) ) ( not ( = ?auto_1411824 ?auto_1411838 ) ) ( not ( = ?auto_1411824 ?auto_1411837 ) ) ( not ( = ?auto_1411828 ?auto_1411830 ) ) ( not ( = ?auto_1411828 ?auto_1411829 ) ) ( not ( = ?auto_1411828 ?auto_1411831 ) ) ( not ( = ?auto_1411828 ?auto_1411832 ) ) ( not ( = ?auto_1411828 ?auto_1411833 ) ) ( not ( = ?auto_1411828 ?auto_1411834 ) ) ( not ( = ?auto_1411828 ?auto_1411838 ) ) ( not ( = ?auto_1411828 ?auto_1411837 ) ) ( not ( = ?auto_1411830 ?auto_1411829 ) ) ( not ( = ?auto_1411830 ?auto_1411831 ) ) ( not ( = ?auto_1411830 ?auto_1411832 ) ) ( not ( = ?auto_1411830 ?auto_1411833 ) ) ( not ( = ?auto_1411830 ?auto_1411834 ) ) ( not ( = ?auto_1411830 ?auto_1411838 ) ) ( not ( = ?auto_1411830 ?auto_1411837 ) ) ( not ( = ?auto_1411829 ?auto_1411831 ) ) ( not ( = ?auto_1411829 ?auto_1411832 ) ) ( not ( = ?auto_1411829 ?auto_1411833 ) ) ( not ( = ?auto_1411829 ?auto_1411834 ) ) ( not ( = ?auto_1411829 ?auto_1411838 ) ) ( not ( = ?auto_1411829 ?auto_1411837 ) ) ( not ( = ?auto_1411831 ?auto_1411832 ) ) ( not ( = ?auto_1411831 ?auto_1411833 ) ) ( not ( = ?auto_1411831 ?auto_1411834 ) ) ( not ( = ?auto_1411831 ?auto_1411838 ) ) ( not ( = ?auto_1411831 ?auto_1411837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411832 ?auto_1411833 ?auto_1411834 )
      ( MAKE-10CRATE-VERIFY ?auto_1411825 ?auto_1411826 ?auto_1411827 ?auto_1411824 ?auto_1411828 ?auto_1411830 ?auto_1411829 ?auto_1411831 ?auto_1411832 ?auto_1411833 ?auto_1411834 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1411843 - SURFACE
      ?auto_1411844 - SURFACE
      ?auto_1411845 - SURFACE
      ?auto_1411842 - SURFACE
      ?auto_1411846 - SURFACE
      ?auto_1411848 - SURFACE
      ?auto_1411847 - SURFACE
      ?auto_1411849 - SURFACE
      ?auto_1411850 - SURFACE
      ?auto_1411851 - SURFACE
      ?auto_1411852 - SURFACE
      ?auto_1411853 - SURFACE
    )
    :vars
    (
      ?auto_1411859 - HOIST
      ?auto_1411854 - PLACE
      ?auto_1411860 - PLACE
      ?auto_1411855 - HOIST
      ?auto_1411857 - SURFACE
      ?auto_1411856 - SURFACE
      ?auto_1411858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411859 ?auto_1411854 ) ( IS-CRATE ?auto_1411853 ) ( not ( = ?auto_1411852 ?auto_1411853 ) ) ( not ( = ?auto_1411851 ?auto_1411852 ) ) ( not ( = ?auto_1411851 ?auto_1411853 ) ) ( not ( = ?auto_1411860 ?auto_1411854 ) ) ( HOIST-AT ?auto_1411855 ?auto_1411860 ) ( not ( = ?auto_1411859 ?auto_1411855 ) ) ( SURFACE-AT ?auto_1411853 ?auto_1411860 ) ( ON ?auto_1411853 ?auto_1411857 ) ( CLEAR ?auto_1411853 ) ( not ( = ?auto_1411852 ?auto_1411857 ) ) ( not ( = ?auto_1411853 ?auto_1411857 ) ) ( not ( = ?auto_1411851 ?auto_1411857 ) ) ( SURFACE-AT ?auto_1411851 ?auto_1411854 ) ( CLEAR ?auto_1411851 ) ( IS-CRATE ?auto_1411852 ) ( AVAILABLE ?auto_1411859 ) ( AVAILABLE ?auto_1411855 ) ( SURFACE-AT ?auto_1411852 ?auto_1411860 ) ( ON ?auto_1411852 ?auto_1411856 ) ( CLEAR ?auto_1411852 ) ( not ( = ?auto_1411852 ?auto_1411856 ) ) ( not ( = ?auto_1411853 ?auto_1411856 ) ) ( not ( = ?auto_1411851 ?auto_1411856 ) ) ( not ( = ?auto_1411857 ?auto_1411856 ) ) ( TRUCK-AT ?auto_1411858 ?auto_1411854 ) ( ON ?auto_1411844 ?auto_1411843 ) ( ON ?auto_1411845 ?auto_1411844 ) ( ON ?auto_1411842 ?auto_1411845 ) ( ON ?auto_1411846 ?auto_1411842 ) ( ON ?auto_1411848 ?auto_1411846 ) ( ON ?auto_1411847 ?auto_1411848 ) ( ON ?auto_1411849 ?auto_1411847 ) ( ON ?auto_1411850 ?auto_1411849 ) ( ON ?auto_1411851 ?auto_1411850 ) ( not ( = ?auto_1411843 ?auto_1411844 ) ) ( not ( = ?auto_1411843 ?auto_1411845 ) ) ( not ( = ?auto_1411843 ?auto_1411842 ) ) ( not ( = ?auto_1411843 ?auto_1411846 ) ) ( not ( = ?auto_1411843 ?auto_1411848 ) ) ( not ( = ?auto_1411843 ?auto_1411847 ) ) ( not ( = ?auto_1411843 ?auto_1411849 ) ) ( not ( = ?auto_1411843 ?auto_1411850 ) ) ( not ( = ?auto_1411843 ?auto_1411851 ) ) ( not ( = ?auto_1411843 ?auto_1411852 ) ) ( not ( = ?auto_1411843 ?auto_1411853 ) ) ( not ( = ?auto_1411843 ?auto_1411857 ) ) ( not ( = ?auto_1411843 ?auto_1411856 ) ) ( not ( = ?auto_1411844 ?auto_1411845 ) ) ( not ( = ?auto_1411844 ?auto_1411842 ) ) ( not ( = ?auto_1411844 ?auto_1411846 ) ) ( not ( = ?auto_1411844 ?auto_1411848 ) ) ( not ( = ?auto_1411844 ?auto_1411847 ) ) ( not ( = ?auto_1411844 ?auto_1411849 ) ) ( not ( = ?auto_1411844 ?auto_1411850 ) ) ( not ( = ?auto_1411844 ?auto_1411851 ) ) ( not ( = ?auto_1411844 ?auto_1411852 ) ) ( not ( = ?auto_1411844 ?auto_1411853 ) ) ( not ( = ?auto_1411844 ?auto_1411857 ) ) ( not ( = ?auto_1411844 ?auto_1411856 ) ) ( not ( = ?auto_1411845 ?auto_1411842 ) ) ( not ( = ?auto_1411845 ?auto_1411846 ) ) ( not ( = ?auto_1411845 ?auto_1411848 ) ) ( not ( = ?auto_1411845 ?auto_1411847 ) ) ( not ( = ?auto_1411845 ?auto_1411849 ) ) ( not ( = ?auto_1411845 ?auto_1411850 ) ) ( not ( = ?auto_1411845 ?auto_1411851 ) ) ( not ( = ?auto_1411845 ?auto_1411852 ) ) ( not ( = ?auto_1411845 ?auto_1411853 ) ) ( not ( = ?auto_1411845 ?auto_1411857 ) ) ( not ( = ?auto_1411845 ?auto_1411856 ) ) ( not ( = ?auto_1411842 ?auto_1411846 ) ) ( not ( = ?auto_1411842 ?auto_1411848 ) ) ( not ( = ?auto_1411842 ?auto_1411847 ) ) ( not ( = ?auto_1411842 ?auto_1411849 ) ) ( not ( = ?auto_1411842 ?auto_1411850 ) ) ( not ( = ?auto_1411842 ?auto_1411851 ) ) ( not ( = ?auto_1411842 ?auto_1411852 ) ) ( not ( = ?auto_1411842 ?auto_1411853 ) ) ( not ( = ?auto_1411842 ?auto_1411857 ) ) ( not ( = ?auto_1411842 ?auto_1411856 ) ) ( not ( = ?auto_1411846 ?auto_1411848 ) ) ( not ( = ?auto_1411846 ?auto_1411847 ) ) ( not ( = ?auto_1411846 ?auto_1411849 ) ) ( not ( = ?auto_1411846 ?auto_1411850 ) ) ( not ( = ?auto_1411846 ?auto_1411851 ) ) ( not ( = ?auto_1411846 ?auto_1411852 ) ) ( not ( = ?auto_1411846 ?auto_1411853 ) ) ( not ( = ?auto_1411846 ?auto_1411857 ) ) ( not ( = ?auto_1411846 ?auto_1411856 ) ) ( not ( = ?auto_1411848 ?auto_1411847 ) ) ( not ( = ?auto_1411848 ?auto_1411849 ) ) ( not ( = ?auto_1411848 ?auto_1411850 ) ) ( not ( = ?auto_1411848 ?auto_1411851 ) ) ( not ( = ?auto_1411848 ?auto_1411852 ) ) ( not ( = ?auto_1411848 ?auto_1411853 ) ) ( not ( = ?auto_1411848 ?auto_1411857 ) ) ( not ( = ?auto_1411848 ?auto_1411856 ) ) ( not ( = ?auto_1411847 ?auto_1411849 ) ) ( not ( = ?auto_1411847 ?auto_1411850 ) ) ( not ( = ?auto_1411847 ?auto_1411851 ) ) ( not ( = ?auto_1411847 ?auto_1411852 ) ) ( not ( = ?auto_1411847 ?auto_1411853 ) ) ( not ( = ?auto_1411847 ?auto_1411857 ) ) ( not ( = ?auto_1411847 ?auto_1411856 ) ) ( not ( = ?auto_1411849 ?auto_1411850 ) ) ( not ( = ?auto_1411849 ?auto_1411851 ) ) ( not ( = ?auto_1411849 ?auto_1411852 ) ) ( not ( = ?auto_1411849 ?auto_1411853 ) ) ( not ( = ?auto_1411849 ?auto_1411857 ) ) ( not ( = ?auto_1411849 ?auto_1411856 ) ) ( not ( = ?auto_1411850 ?auto_1411851 ) ) ( not ( = ?auto_1411850 ?auto_1411852 ) ) ( not ( = ?auto_1411850 ?auto_1411853 ) ) ( not ( = ?auto_1411850 ?auto_1411857 ) ) ( not ( = ?auto_1411850 ?auto_1411856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411851 ?auto_1411852 ?auto_1411853 )
      ( MAKE-11CRATE-VERIFY ?auto_1411843 ?auto_1411844 ?auto_1411845 ?auto_1411842 ?auto_1411846 ?auto_1411848 ?auto_1411847 ?auto_1411849 ?auto_1411850 ?auto_1411851 ?auto_1411852 ?auto_1411853 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1411862 - SURFACE
      ?auto_1411863 - SURFACE
      ?auto_1411864 - SURFACE
      ?auto_1411861 - SURFACE
      ?auto_1411865 - SURFACE
      ?auto_1411867 - SURFACE
      ?auto_1411866 - SURFACE
      ?auto_1411868 - SURFACE
      ?auto_1411869 - SURFACE
      ?auto_1411870 - SURFACE
      ?auto_1411871 - SURFACE
      ?auto_1411872 - SURFACE
      ?auto_1411873 - SURFACE
    )
    :vars
    (
      ?auto_1411879 - HOIST
      ?auto_1411874 - PLACE
      ?auto_1411880 - PLACE
      ?auto_1411875 - HOIST
      ?auto_1411877 - SURFACE
      ?auto_1411876 - SURFACE
      ?auto_1411878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411879 ?auto_1411874 ) ( IS-CRATE ?auto_1411873 ) ( not ( = ?auto_1411872 ?auto_1411873 ) ) ( not ( = ?auto_1411871 ?auto_1411872 ) ) ( not ( = ?auto_1411871 ?auto_1411873 ) ) ( not ( = ?auto_1411880 ?auto_1411874 ) ) ( HOIST-AT ?auto_1411875 ?auto_1411880 ) ( not ( = ?auto_1411879 ?auto_1411875 ) ) ( SURFACE-AT ?auto_1411873 ?auto_1411880 ) ( ON ?auto_1411873 ?auto_1411877 ) ( CLEAR ?auto_1411873 ) ( not ( = ?auto_1411872 ?auto_1411877 ) ) ( not ( = ?auto_1411873 ?auto_1411877 ) ) ( not ( = ?auto_1411871 ?auto_1411877 ) ) ( SURFACE-AT ?auto_1411871 ?auto_1411874 ) ( CLEAR ?auto_1411871 ) ( IS-CRATE ?auto_1411872 ) ( AVAILABLE ?auto_1411879 ) ( AVAILABLE ?auto_1411875 ) ( SURFACE-AT ?auto_1411872 ?auto_1411880 ) ( ON ?auto_1411872 ?auto_1411876 ) ( CLEAR ?auto_1411872 ) ( not ( = ?auto_1411872 ?auto_1411876 ) ) ( not ( = ?auto_1411873 ?auto_1411876 ) ) ( not ( = ?auto_1411871 ?auto_1411876 ) ) ( not ( = ?auto_1411877 ?auto_1411876 ) ) ( TRUCK-AT ?auto_1411878 ?auto_1411874 ) ( ON ?auto_1411863 ?auto_1411862 ) ( ON ?auto_1411864 ?auto_1411863 ) ( ON ?auto_1411861 ?auto_1411864 ) ( ON ?auto_1411865 ?auto_1411861 ) ( ON ?auto_1411867 ?auto_1411865 ) ( ON ?auto_1411866 ?auto_1411867 ) ( ON ?auto_1411868 ?auto_1411866 ) ( ON ?auto_1411869 ?auto_1411868 ) ( ON ?auto_1411870 ?auto_1411869 ) ( ON ?auto_1411871 ?auto_1411870 ) ( not ( = ?auto_1411862 ?auto_1411863 ) ) ( not ( = ?auto_1411862 ?auto_1411864 ) ) ( not ( = ?auto_1411862 ?auto_1411861 ) ) ( not ( = ?auto_1411862 ?auto_1411865 ) ) ( not ( = ?auto_1411862 ?auto_1411867 ) ) ( not ( = ?auto_1411862 ?auto_1411866 ) ) ( not ( = ?auto_1411862 ?auto_1411868 ) ) ( not ( = ?auto_1411862 ?auto_1411869 ) ) ( not ( = ?auto_1411862 ?auto_1411870 ) ) ( not ( = ?auto_1411862 ?auto_1411871 ) ) ( not ( = ?auto_1411862 ?auto_1411872 ) ) ( not ( = ?auto_1411862 ?auto_1411873 ) ) ( not ( = ?auto_1411862 ?auto_1411877 ) ) ( not ( = ?auto_1411862 ?auto_1411876 ) ) ( not ( = ?auto_1411863 ?auto_1411864 ) ) ( not ( = ?auto_1411863 ?auto_1411861 ) ) ( not ( = ?auto_1411863 ?auto_1411865 ) ) ( not ( = ?auto_1411863 ?auto_1411867 ) ) ( not ( = ?auto_1411863 ?auto_1411866 ) ) ( not ( = ?auto_1411863 ?auto_1411868 ) ) ( not ( = ?auto_1411863 ?auto_1411869 ) ) ( not ( = ?auto_1411863 ?auto_1411870 ) ) ( not ( = ?auto_1411863 ?auto_1411871 ) ) ( not ( = ?auto_1411863 ?auto_1411872 ) ) ( not ( = ?auto_1411863 ?auto_1411873 ) ) ( not ( = ?auto_1411863 ?auto_1411877 ) ) ( not ( = ?auto_1411863 ?auto_1411876 ) ) ( not ( = ?auto_1411864 ?auto_1411861 ) ) ( not ( = ?auto_1411864 ?auto_1411865 ) ) ( not ( = ?auto_1411864 ?auto_1411867 ) ) ( not ( = ?auto_1411864 ?auto_1411866 ) ) ( not ( = ?auto_1411864 ?auto_1411868 ) ) ( not ( = ?auto_1411864 ?auto_1411869 ) ) ( not ( = ?auto_1411864 ?auto_1411870 ) ) ( not ( = ?auto_1411864 ?auto_1411871 ) ) ( not ( = ?auto_1411864 ?auto_1411872 ) ) ( not ( = ?auto_1411864 ?auto_1411873 ) ) ( not ( = ?auto_1411864 ?auto_1411877 ) ) ( not ( = ?auto_1411864 ?auto_1411876 ) ) ( not ( = ?auto_1411861 ?auto_1411865 ) ) ( not ( = ?auto_1411861 ?auto_1411867 ) ) ( not ( = ?auto_1411861 ?auto_1411866 ) ) ( not ( = ?auto_1411861 ?auto_1411868 ) ) ( not ( = ?auto_1411861 ?auto_1411869 ) ) ( not ( = ?auto_1411861 ?auto_1411870 ) ) ( not ( = ?auto_1411861 ?auto_1411871 ) ) ( not ( = ?auto_1411861 ?auto_1411872 ) ) ( not ( = ?auto_1411861 ?auto_1411873 ) ) ( not ( = ?auto_1411861 ?auto_1411877 ) ) ( not ( = ?auto_1411861 ?auto_1411876 ) ) ( not ( = ?auto_1411865 ?auto_1411867 ) ) ( not ( = ?auto_1411865 ?auto_1411866 ) ) ( not ( = ?auto_1411865 ?auto_1411868 ) ) ( not ( = ?auto_1411865 ?auto_1411869 ) ) ( not ( = ?auto_1411865 ?auto_1411870 ) ) ( not ( = ?auto_1411865 ?auto_1411871 ) ) ( not ( = ?auto_1411865 ?auto_1411872 ) ) ( not ( = ?auto_1411865 ?auto_1411873 ) ) ( not ( = ?auto_1411865 ?auto_1411877 ) ) ( not ( = ?auto_1411865 ?auto_1411876 ) ) ( not ( = ?auto_1411867 ?auto_1411866 ) ) ( not ( = ?auto_1411867 ?auto_1411868 ) ) ( not ( = ?auto_1411867 ?auto_1411869 ) ) ( not ( = ?auto_1411867 ?auto_1411870 ) ) ( not ( = ?auto_1411867 ?auto_1411871 ) ) ( not ( = ?auto_1411867 ?auto_1411872 ) ) ( not ( = ?auto_1411867 ?auto_1411873 ) ) ( not ( = ?auto_1411867 ?auto_1411877 ) ) ( not ( = ?auto_1411867 ?auto_1411876 ) ) ( not ( = ?auto_1411866 ?auto_1411868 ) ) ( not ( = ?auto_1411866 ?auto_1411869 ) ) ( not ( = ?auto_1411866 ?auto_1411870 ) ) ( not ( = ?auto_1411866 ?auto_1411871 ) ) ( not ( = ?auto_1411866 ?auto_1411872 ) ) ( not ( = ?auto_1411866 ?auto_1411873 ) ) ( not ( = ?auto_1411866 ?auto_1411877 ) ) ( not ( = ?auto_1411866 ?auto_1411876 ) ) ( not ( = ?auto_1411868 ?auto_1411869 ) ) ( not ( = ?auto_1411868 ?auto_1411870 ) ) ( not ( = ?auto_1411868 ?auto_1411871 ) ) ( not ( = ?auto_1411868 ?auto_1411872 ) ) ( not ( = ?auto_1411868 ?auto_1411873 ) ) ( not ( = ?auto_1411868 ?auto_1411877 ) ) ( not ( = ?auto_1411868 ?auto_1411876 ) ) ( not ( = ?auto_1411869 ?auto_1411870 ) ) ( not ( = ?auto_1411869 ?auto_1411871 ) ) ( not ( = ?auto_1411869 ?auto_1411872 ) ) ( not ( = ?auto_1411869 ?auto_1411873 ) ) ( not ( = ?auto_1411869 ?auto_1411877 ) ) ( not ( = ?auto_1411869 ?auto_1411876 ) ) ( not ( = ?auto_1411870 ?auto_1411871 ) ) ( not ( = ?auto_1411870 ?auto_1411872 ) ) ( not ( = ?auto_1411870 ?auto_1411873 ) ) ( not ( = ?auto_1411870 ?auto_1411877 ) ) ( not ( = ?auto_1411870 ?auto_1411876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411871 ?auto_1411872 ?auto_1411873 )
      ( MAKE-12CRATE-VERIFY ?auto_1411862 ?auto_1411863 ?auto_1411864 ?auto_1411861 ?auto_1411865 ?auto_1411867 ?auto_1411866 ?auto_1411868 ?auto_1411869 ?auto_1411870 ?auto_1411871 ?auto_1411872 ?auto_1411873 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1411882 - SURFACE
      ?auto_1411883 - SURFACE
      ?auto_1411884 - SURFACE
      ?auto_1411881 - SURFACE
      ?auto_1411885 - SURFACE
      ?auto_1411887 - SURFACE
      ?auto_1411886 - SURFACE
      ?auto_1411888 - SURFACE
      ?auto_1411889 - SURFACE
      ?auto_1411890 - SURFACE
      ?auto_1411891 - SURFACE
      ?auto_1411892 - SURFACE
      ?auto_1411893 - SURFACE
      ?auto_1411894 - SURFACE
    )
    :vars
    (
      ?auto_1411900 - HOIST
      ?auto_1411895 - PLACE
      ?auto_1411901 - PLACE
      ?auto_1411896 - HOIST
      ?auto_1411898 - SURFACE
      ?auto_1411897 - SURFACE
      ?auto_1411899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411900 ?auto_1411895 ) ( IS-CRATE ?auto_1411894 ) ( not ( = ?auto_1411893 ?auto_1411894 ) ) ( not ( = ?auto_1411892 ?auto_1411893 ) ) ( not ( = ?auto_1411892 ?auto_1411894 ) ) ( not ( = ?auto_1411901 ?auto_1411895 ) ) ( HOIST-AT ?auto_1411896 ?auto_1411901 ) ( not ( = ?auto_1411900 ?auto_1411896 ) ) ( SURFACE-AT ?auto_1411894 ?auto_1411901 ) ( ON ?auto_1411894 ?auto_1411898 ) ( CLEAR ?auto_1411894 ) ( not ( = ?auto_1411893 ?auto_1411898 ) ) ( not ( = ?auto_1411894 ?auto_1411898 ) ) ( not ( = ?auto_1411892 ?auto_1411898 ) ) ( SURFACE-AT ?auto_1411892 ?auto_1411895 ) ( CLEAR ?auto_1411892 ) ( IS-CRATE ?auto_1411893 ) ( AVAILABLE ?auto_1411900 ) ( AVAILABLE ?auto_1411896 ) ( SURFACE-AT ?auto_1411893 ?auto_1411901 ) ( ON ?auto_1411893 ?auto_1411897 ) ( CLEAR ?auto_1411893 ) ( not ( = ?auto_1411893 ?auto_1411897 ) ) ( not ( = ?auto_1411894 ?auto_1411897 ) ) ( not ( = ?auto_1411892 ?auto_1411897 ) ) ( not ( = ?auto_1411898 ?auto_1411897 ) ) ( TRUCK-AT ?auto_1411899 ?auto_1411895 ) ( ON ?auto_1411883 ?auto_1411882 ) ( ON ?auto_1411884 ?auto_1411883 ) ( ON ?auto_1411881 ?auto_1411884 ) ( ON ?auto_1411885 ?auto_1411881 ) ( ON ?auto_1411887 ?auto_1411885 ) ( ON ?auto_1411886 ?auto_1411887 ) ( ON ?auto_1411888 ?auto_1411886 ) ( ON ?auto_1411889 ?auto_1411888 ) ( ON ?auto_1411890 ?auto_1411889 ) ( ON ?auto_1411891 ?auto_1411890 ) ( ON ?auto_1411892 ?auto_1411891 ) ( not ( = ?auto_1411882 ?auto_1411883 ) ) ( not ( = ?auto_1411882 ?auto_1411884 ) ) ( not ( = ?auto_1411882 ?auto_1411881 ) ) ( not ( = ?auto_1411882 ?auto_1411885 ) ) ( not ( = ?auto_1411882 ?auto_1411887 ) ) ( not ( = ?auto_1411882 ?auto_1411886 ) ) ( not ( = ?auto_1411882 ?auto_1411888 ) ) ( not ( = ?auto_1411882 ?auto_1411889 ) ) ( not ( = ?auto_1411882 ?auto_1411890 ) ) ( not ( = ?auto_1411882 ?auto_1411891 ) ) ( not ( = ?auto_1411882 ?auto_1411892 ) ) ( not ( = ?auto_1411882 ?auto_1411893 ) ) ( not ( = ?auto_1411882 ?auto_1411894 ) ) ( not ( = ?auto_1411882 ?auto_1411898 ) ) ( not ( = ?auto_1411882 ?auto_1411897 ) ) ( not ( = ?auto_1411883 ?auto_1411884 ) ) ( not ( = ?auto_1411883 ?auto_1411881 ) ) ( not ( = ?auto_1411883 ?auto_1411885 ) ) ( not ( = ?auto_1411883 ?auto_1411887 ) ) ( not ( = ?auto_1411883 ?auto_1411886 ) ) ( not ( = ?auto_1411883 ?auto_1411888 ) ) ( not ( = ?auto_1411883 ?auto_1411889 ) ) ( not ( = ?auto_1411883 ?auto_1411890 ) ) ( not ( = ?auto_1411883 ?auto_1411891 ) ) ( not ( = ?auto_1411883 ?auto_1411892 ) ) ( not ( = ?auto_1411883 ?auto_1411893 ) ) ( not ( = ?auto_1411883 ?auto_1411894 ) ) ( not ( = ?auto_1411883 ?auto_1411898 ) ) ( not ( = ?auto_1411883 ?auto_1411897 ) ) ( not ( = ?auto_1411884 ?auto_1411881 ) ) ( not ( = ?auto_1411884 ?auto_1411885 ) ) ( not ( = ?auto_1411884 ?auto_1411887 ) ) ( not ( = ?auto_1411884 ?auto_1411886 ) ) ( not ( = ?auto_1411884 ?auto_1411888 ) ) ( not ( = ?auto_1411884 ?auto_1411889 ) ) ( not ( = ?auto_1411884 ?auto_1411890 ) ) ( not ( = ?auto_1411884 ?auto_1411891 ) ) ( not ( = ?auto_1411884 ?auto_1411892 ) ) ( not ( = ?auto_1411884 ?auto_1411893 ) ) ( not ( = ?auto_1411884 ?auto_1411894 ) ) ( not ( = ?auto_1411884 ?auto_1411898 ) ) ( not ( = ?auto_1411884 ?auto_1411897 ) ) ( not ( = ?auto_1411881 ?auto_1411885 ) ) ( not ( = ?auto_1411881 ?auto_1411887 ) ) ( not ( = ?auto_1411881 ?auto_1411886 ) ) ( not ( = ?auto_1411881 ?auto_1411888 ) ) ( not ( = ?auto_1411881 ?auto_1411889 ) ) ( not ( = ?auto_1411881 ?auto_1411890 ) ) ( not ( = ?auto_1411881 ?auto_1411891 ) ) ( not ( = ?auto_1411881 ?auto_1411892 ) ) ( not ( = ?auto_1411881 ?auto_1411893 ) ) ( not ( = ?auto_1411881 ?auto_1411894 ) ) ( not ( = ?auto_1411881 ?auto_1411898 ) ) ( not ( = ?auto_1411881 ?auto_1411897 ) ) ( not ( = ?auto_1411885 ?auto_1411887 ) ) ( not ( = ?auto_1411885 ?auto_1411886 ) ) ( not ( = ?auto_1411885 ?auto_1411888 ) ) ( not ( = ?auto_1411885 ?auto_1411889 ) ) ( not ( = ?auto_1411885 ?auto_1411890 ) ) ( not ( = ?auto_1411885 ?auto_1411891 ) ) ( not ( = ?auto_1411885 ?auto_1411892 ) ) ( not ( = ?auto_1411885 ?auto_1411893 ) ) ( not ( = ?auto_1411885 ?auto_1411894 ) ) ( not ( = ?auto_1411885 ?auto_1411898 ) ) ( not ( = ?auto_1411885 ?auto_1411897 ) ) ( not ( = ?auto_1411887 ?auto_1411886 ) ) ( not ( = ?auto_1411887 ?auto_1411888 ) ) ( not ( = ?auto_1411887 ?auto_1411889 ) ) ( not ( = ?auto_1411887 ?auto_1411890 ) ) ( not ( = ?auto_1411887 ?auto_1411891 ) ) ( not ( = ?auto_1411887 ?auto_1411892 ) ) ( not ( = ?auto_1411887 ?auto_1411893 ) ) ( not ( = ?auto_1411887 ?auto_1411894 ) ) ( not ( = ?auto_1411887 ?auto_1411898 ) ) ( not ( = ?auto_1411887 ?auto_1411897 ) ) ( not ( = ?auto_1411886 ?auto_1411888 ) ) ( not ( = ?auto_1411886 ?auto_1411889 ) ) ( not ( = ?auto_1411886 ?auto_1411890 ) ) ( not ( = ?auto_1411886 ?auto_1411891 ) ) ( not ( = ?auto_1411886 ?auto_1411892 ) ) ( not ( = ?auto_1411886 ?auto_1411893 ) ) ( not ( = ?auto_1411886 ?auto_1411894 ) ) ( not ( = ?auto_1411886 ?auto_1411898 ) ) ( not ( = ?auto_1411886 ?auto_1411897 ) ) ( not ( = ?auto_1411888 ?auto_1411889 ) ) ( not ( = ?auto_1411888 ?auto_1411890 ) ) ( not ( = ?auto_1411888 ?auto_1411891 ) ) ( not ( = ?auto_1411888 ?auto_1411892 ) ) ( not ( = ?auto_1411888 ?auto_1411893 ) ) ( not ( = ?auto_1411888 ?auto_1411894 ) ) ( not ( = ?auto_1411888 ?auto_1411898 ) ) ( not ( = ?auto_1411888 ?auto_1411897 ) ) ( not ( = ?auto_1411889 ?auto_1411890 ) ) ( not ( = ?auto_1411889 ?auto_1411891 ) ) ( not ( = ?auto_1411889 ?auto_1411892 ) ) ( not ( = ?auto_1411889 ?auto_1411893 ) ) ( not ( = ?auto_1411889 ?auto_1411894 ) ) ( not ( = ?auto_1411889 ?auto_1411898 ) ) ( not ( = ?auto_1411889 ?auto_1411897 ) ) ( not ( = ?auto_1411890 ?auto_1411891 ) ) ( not ( = ?auto_1411890 ?auto_1411892 ) ) ( not ( = ?auto_1411890 ?auto_1411893 ) ) ( not ( = ?auto_1411890 ?auto_1411894 ) ) ( not ( = ?auto_1411890 ?auto_1411898 ) ) ( not ( = ?auto_1411890 ?auto_1411897 ) ) ( not ( = ?auto_1411891 ?auto_1411892 ) ) ( not ( = ?auto_1411891 ?auto_1411893 ) ) ( not ( = ?auto_1411891 ?auto_1411894 ) ) ( not ( = ?auto_1411891 ?auto_1411898 ) ) ( not ( = ?auto_1411891 ?auto_1411897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411892 ?auto_1411893 ?auto_1411894 )
      ( MAKE-13CRATE-VERIFY ?auto_1411882 ?auto_1411883 ?auto_1411884 ?auto_1411881 ?auto_1411885 ?auto_1411887 ?auto_1411886 ?auto_1411888 ?auto_1411889 ?auto_1411890 ?auto_1411891 ?auto_1411892 ?auto_1411893 ?auto_1411894 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1411903 - SURFACE
      ?auto_1411904 - SURFACE
      ?auto_1411905 - SURFACE
      ?auto_1411902 - SURFACE
      ?auto_1411906 - SURFACE
      ?auto_1411908 - SURFACE
      ?auto_1411907 - SURFACE
      ?auto_1411909 - SURFACE
      ?auto_1411910 - SURFACE
      ?auto_1411911 - SURFACE
      ?auto_1411912 - SURFACE
      ?auto_1411913 - SURFACE
      ?auto_1411914 - SURFACE
      ?auto_1411915 - SURFACE
      ?auto_1411916 - SURFACE
    )
    :vars
    (
      ?auto_1411922 - HOIST
      ?auto_1411917 - PLACE
      ?auto_1411923 - PLACE
      ?auto_1411918 - HOIST
      ?auto_1411920 - SURFACE
      ?auto_1411919 - SURFACE
      ?auto_1411921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411922 ?auto_1411917 ) ( IS-CRATE ?auto_1411916 ) ( not ( = ?auto_1411915 ?auto_1411916 ) ) ( not ( = ?auto_1411914 ?auto_1411915 ) ) ( not ( = ?auto_1411914 ?auto_1411916 ) ) ( not ( = ?auto_1411923 ?auto_1411917 ) ) ( HOIST-AT ?auto_1411918 ?auto_1411923 ) ( not ( = ?auto_1411922 ?auto_1411918 ) ) ( SURFACE-AT ?auto_1411916 ?auto_1411923 ) ( ON ?auto_1411916 ?auto_1411920 ) ( CLEAR ?auto_1411916 ) ( not ( = ?auto_1411915 ?auto_1411920 ) ) ( not ( = ?auto_1411916 ?auto_1411920 ) ) ( not ( = ?auto_1411914 ?auto_1411920 ) ) ( SURFACE-AT ?auto_1411914 ?auto_1411917 ) ( CLEAR ?auto_1411914 ) ( IS-CRATE ?auto_1411915 ) ( AVAILABLE ?auto_1411922 ) ( AVAILABLE ?auto_1411918 ) ( SURFACE-AT ?auto_1411915 ?auto_1411923 ) ( ON ?auto_1411915 ?auto_1411919 ) ( CLEAR ?auto_1411915 ) ( not ( = ?auto_1411915 ?auto_1411919 ) ) ( not ( = ?auto_1411916 ?auto_1411919 ) ) ( not ( = ?auto_1411914 ?auto_1411919 ) ) ( not ( = ?auto_1411920 ?auto_1411919 ) ) ( TRUCK-AT ?auto_1411921 ?auto_1411917 ) ( ON ?auto_1411904 ?auto_1411903 ) ( ON ?auto_1411905 ?auto_1411904 ) ( ON ?auto_1411902 ?auto_1411905 ) ( ON ?auto_1411906 ?auto_1411902 ) ( ON ?auto_1411908 ?auto_1411906 ) ( ON ?auto_1411907 ?auto_1411908 ) ( ON ?auto_1411909 ?auto_1411907 ) ( ON ?auto_1411910 ?auto_1411909 ) ( ON ?auto_1411911 ?auto_1411910 ) ( ON ?auto_1411912 ?auto_1411911 ) ( ON ?auto_1411913 ?auto_1411912 ) ( ON ?auto_1411914 ?auto_1411913 ) ( not ( = ?auto_1411903 ?auto_1411904 ) ) ( not ( = ?auto_1411903 ?auto_1411905 ) ) ( not ( = ?auto_1411903 ?auto_1411902 ) ) ( not ( = ?auto_1411903 ?auto_1411906 ) ) ( not ( = ?auto_1411903 ?auto_1411908 ) ) ( not ( = ?auto_1411903 ?auto_1411907 ) ) ( not ( = ?auto_1411903 ?auto_1411909 ) ) ( not ( = ?auto_1411903 ?auto_1411910 ) ) ( not ( = ?auto_1411903 ?auto_1411911 ) ) ( not ( = ?auto_1411903 ?auto_1411912 ) ) ( not ( = ?auto_1411903 ?auto_1411913 ) ) ( not ( = ?auto_1411903 ?auto_1411914 ) ) ( not ( = ?auto_1411903 ?auto_1411915 ) ) ( not ( = ?auto_1411903 ?auto_1411916 ) ) ( not ( = ?auto_1411903 ?auto_1411920 ) ) ( not ( = ?auto_1411903 ?auto_1411919 ) ) ( not ( = ?auto_1411904 ?auto_1411905 ) ) ( not ( = ?auto_1411904 ?auto_1411902 ) ) ( not ( = ?auto_1411904 ?auto_1411906 ) ) ( not ( = ?auto_1411904 ?auto_1411908 ) ) ( not ( = ?auto_1411904 ?auto_1411907 ) ) ( not ( = ?auto_1411904 ?auto_1411909 ) ) ( not ( = ?auto_1411904 ?auto_1411910 ) ) ( not ( = ?auto_1411904 ?auto_1411911 ) ) ( not ( = ?auto_1411904 ?auto_1411912 ) ) ( not ( = ?auto_1411904 ?auto_1411913 ) ) ( not ( = ?auto_1411904 ?auto_1411914 ) ) ( not ( = ?auto_1411904 ?auto_1411915 ) ) ( not ( = ?auto_1411904 ?auto_1411916 ) ) ( not ( = ?auto_1411904 ?auto_1411920 ) ) ( not ( = ?auto_1411904 ?auto_1411919 ) ) ( not ( = ?auto_1411905 ?auto_1411902 ) ) ( not ( = ?auto_1411905 ?auto_1411906 ) ) ( not ( = ?auto_1411905 ?auto_1411908 ) ) ( not ( = ?auto_1411905 ?auto_1411907 ) ) ( not ( = ?auto_1411905 ?auto_1411909 ) ) ( not ( = ?auto_1411905 ?auto_1411910 ) ) ( not ( = ?auto_1411905 ?auto_1411911 ) ) ( not ( = ?auto_1411905 ?auto_1411912 ) ) ( not ( = ?auto_1411905 ?auto_1411913 ) ) ( not ( = ?auto_1411905 ?auto_1411914 ) ) ( not ( = ?auto_1411905 ?auto_1411915 ) ) ( not ( = ?auto_1411905 ?auto_1411916 ) ) ( not ( = ?auto_1411905 ?auto_1411920 ) ) ( not ( = ?auto_1411905 ?auto_1411919 ) ) ( not ( = ?auto_1411902 ?auto_1411906 ) ) ( not ( = ?auto_1411902 ?auto_1411908 ) ) ( not ( = ?auto_1411902 ?auto_1411907 ) ) ( not ( = ?auto_1411902 ?auto_1411909 ) ) ( not ( = ?auto_1411902 ?auto_1411910 ) ) ( not ( = ?auto_1411902 ?auto_1411911 ) ) ( not ( = ?auto_1411902 ?auto_1411912 ) ) ( not ( = ?auto_1411902 ?auto_1411913 ) ) ( not ( = ?auto_1411902 ?auto_1411914 ) ) ( not ( = ?auto_1411902 ?auto_1411915 ) ) ( not ( = ?auto_1411902 ?auto_1411916 ) ) ( not ( = ?auto_1411902 ?auto_1411920 ) ) ( not ( = ?auto_1411902 ?auto_1411919 ) ) ( not ( = ?auto_1411906 ?auto_1411908 ) ) ( not ( = ?auto_1411906 ?auto_1411907 ) ) ( not ( = ?auto_1411906 ?auto_1411909 ) ) ( not ( = ?auto_1411906 ?auto_1411910 ) ) ( not ( = ?auto_1411906 ?auto_1411911 ) ) ( not ( = ?auto_1411906 ?auto_1411912 ) ) ( not ( = ?auto_1411906 ?auto_1411913 ) ) ( not ( = ?auto_1411906 ?auto_1411914 ) ) ( not ( = ?auto_1411906 ?auto_1411915 ) ) ( not ( = ?auto_1411906 ?auto_1411916 ) ) ( not ( = ?auto_1411906 ?auto_1411920 ) ) ( not ( = ?auto_1411906 ?auto_1411919 ) ) ( not ( = ?auto_1411908 ?auto_1411907 ) ) ( not ( = ?auto_1411908 ?auto_1411909 ) ) ( not ( = ?auto_1411908 ?auto_1411910 ) ) ( not ( = ?auto_1411908 ?auto_1411911 ) ) ( not ( = ?auto_1411908 ?auto_1411912 ) ) ( not ( = ?auto_1411908 ?auto_1411913 ) ) ( not ( = ?auto_1411908 ?auto_1411914 ) ) ( not ( = ?auto_1411908 ?auto_1411915 ) ) ( not ( = ?auto_1411908 ?auto_1411916 ) ) ( not ( = ?auto_1411908 ?auto_1411920 ) ) ( not ( = ?auto_1411908 ?auto_1411919 ) ) ( not ( = ?auto_1411907 ?auto_1411909 ) ) ( not ( = ?auto_1411907 ?auto_1411910 ) ) ( not ( = ?auto_1411907 ?auto_1411911 ) ) ( not ( = ?auto_1411907 ?auto_1411912 ) ) ( not ( = ?auto_1411907 ?auto_1411913 ) ) ( not ( = ?auto_1411907 ?auto_1411914 ) ) ( not ( = ?auto_1411907 ?auto_1411915 ) ) ( not ( = ?auto_1411907 ?auto_1411916 ) ) ( not ( = ?auto_1411907 ?auto_1411920 ) ) ( not ( = ?auto_1411907 ?auto_1411919 ) ) ( not ( = ?auto_1411909 ?auto_1411910 ) ) ( not ( = ?auto_1411909 ?auto_1411911 ) ) ( not ( = ?auto_1411909 ?auto_1411912 ) ) ( not ( = ?auto_1411909 ?auto_1411913 ) ) ( not ( = ?auto_1411909 ?auto_1411914 ) ) ( not ( = ?auto_1411909 ?auto_1411915 ) ) ( not ( = ?auto_1411909 ?auto_1411916 ) ) ( not ( = ?auto_1411909 ?auto_1411920 ) ) ( not ( = ?auto_1411909 ?auto_1411919 ) ) ( not ( = ?auto_1411910 ?auto_1411911 ) ) ( not ( = ?auto_1411910 ?auto_1411912 ) ) ( not ( = ?auto_1411910 ?auto_1411913 ) ) ( not ( = ?auto_1411910 ?auto_1411914 ) ) ( not ( = ?auto_1411910 ?auto_1411915 ) ) ( not ( = ?auto_1411910 ?auto_1411916 ) ) ( not ( = ?auto_1411910 ?auto_1411920 ) ) ( not ( = ?auto_1411910 ?auto_1411919 ) ) ( not ( = ?auto_1411911 ?auto_1411912 ) ) ( not ( = ?auto_1411911 ?auto_1411913 ) ) ( not ( = ?auto_1411911 ?auto_1411914 ) ) ( not ( = ?auto_1411911 ?auto_1411915 ) ) ( not ( = ?auto_1411911 ?auto_1411916 ) ) ( not ( = ?auto_1411911 ?auto_1411920 ) ) ( not ( = ?auto_1411911 ?auto_1411919 ) ) ( not ( = ?auto_1411912 ?auto_1411913 ) ) ( not ( = ?auto_1411912 ?auto_1411914 ) ) ( not ( = ?auto_1411912 ?auto_1411915 ) ) ( not ( = ?auto_1411912 ?auto_1411916 ) ) ( not ( = ?auto_1411912 ?auto_1411920 ) ) ( not ( = ?auto_1411912 ?auto_1411919 ) ) ( not ( = ?auto_1411913 ?auto_1411914 ) ) ( not ( = ?auto_1411913 ?auto_1411915 ) ) ( not ( = ?auto_1411913 ?auto_1411916 ) ) ( not ( = ?auto_1411913 ?auto_1411920 ) ) ( not ( = ?auto_1411913 ?auto_1411919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411914 ?auto_1411915 ?auto_1411916 )
      ( MAKE-14CRATE-VERIFY ?auto_1411903 ?auto_1411904 ?auto_1411905 ?auto_1411902 ?auto_1411906 ?auto_1411908 ?auto_1411907 ?auto_1411909 ?auto_1411910 ?auto_1411911 ?auto_1411912 ?auto_1411913 ?auto_1411914 ?auto_1411915 ?auto_1411916 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1411924 - SURFACE
      ?auto_1411925 - SURFACE
    )
    :vars
    (
      ?auto_1411932 - HOIST
      ?auto_1411926 - PLACE
      ?auto_1411928 - SURFACE
      ?auto_1411933 - PLACE
      ?auto_1411927 - HOIST
      ?auto_1411930 - SURFACE
      ?auto_1411929 - SURFACE
      ?auto_1411931 - TRUCK
      ?auto_1411934 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411932 ?auto_1411926 ) ( IS-CRATE ?auto_1411925 ) ( not ( = ?auto_1411924 ?auto_1411925 ) ) ( not ( = ?auto_1411928 ?auto_1411924 ) ) ( not ( = ?auto_1411928 ?auto_1411925 ) ) ( not ( = ?auto_1411933 ?auto_1411926 ) ) ( HOIST-AT ?auto_1411927 ?auto_1411933 ) ( not ( = ?auto_1411932 ?auto_1411927 ) ) ( SURFACE-AT ?auto_1411925 ?auto_1411933 ) ( ON ?auto_1411925 ?auto_1411930 ) ( CLEAR ?auto_1411925 ) ( not ( = ?auto_1411924 ?auto_1411930 ) ) ( not ( = ?auto_1411925 ?auto_1411930 ) ) ( not ( = ?auto_1411928 ?auto_1411930 ) ) ( IS-CRATE ?auto_1411924 ) ( AVAILABLE ?auto_1411927 ) ( SURFACE-AT ?auto_1411924 ?auto_1411933 ) ( ON ?auto_1411924 ?auto_1411929 ) ( CLEAR ?auto_1411924 ) ( not ( = ?auto_1411924 ?auto_1411929 ) ) ( not ( = ?auto_1411925 ?auto_1411929 ) ) ( not ( = ?auto_1411928 ?auto_1411929 ) ) ( not ( = ?auto_1411930 ?auto_1411929 ) ) ( TRUCK-AT ?auto_1411931 ?auto_1411926 ) ( SURFACE-AT ?auto_1411934 ?auto_1411926 ) ( CLEAR ?auto_1411934 ) ( LIFTING ?auto_1411932 ?auto_1411928 ) ( IS-CRATE ?auto_1411928 ) ( not ( = ?auto_1411934 ?auto_1411928 ) ) ( not ( = ?auto_1411924 ?auto_1411934 ) ) ( not ( = ?auto_1411925 ?auto_1411934 ) ) ( not ( = ?auto_1411930 ?auto_1411934 ) ) ( not ( = ?auto_1411929 ?auto_1411934 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1411934 ?auto_1411928 )
      ( MAKE-2CRATE ?auto_1411928 ?auto_1411924 ?auto_1411925 )
      ( MAKE-1CRATE-VERIFY ?auto_1411924 ?auto_1411925 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1411935 - SURFACE
      ?auto_1411936 - SURFACE
      ?auto_1411937 - SURFACE
    )
    :vars
    (
      ?auto_1411945 - HOIST
      ?auto_1411942 - PLACE
      ?auto_1411941 - PLACE
      ?auto_1411938 - HOIST
      ?auto_1411940 - SURFACE
      ?auto_1411939 - SURFACE
      ?auto_1411944 - TRUCK
      ?auto_1411943 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411945 ?auto_1411942 ) ( IS-CRATE ?auto_1411937 ) ( not ( = ?auto_1411936 ?auto_1411937 ) ) ( not ( = ?auto_1411935 ?auto_1411936 ) ) ( not ( = ?auto_1411935 ?auto_1411937 ) ) ( not ( = ?auto_1411941 ?auto_1411942 ) ) ( HOIST-AT ?auto_1411938 ?auto_1411941 ) ( not ( = ?auto_1411945 ?auto_1411938 ) ) ( SURFACE-AT ?auto_1411937 ?auto_1411941 ) ( ON ?auto_1411937 ?auto_1411940 ) ( CLEAR ?auto_1411937 ) ( not ( = ?auto_1411936 ?auto_1411940 ) ) ( not ( = ?auto_1411937 ?auto_1411940 ) ) ( not ( = ?auto_1411935 ?auto_1411940 ) ) ( IS-CRATE ?auto_1411936 ) ( AVAILABLE ?auto_1411938 ) ( SURFACE-AT ?auto_1411936 ?auto_1411941 ) ( ON ?auto_1411936 ?auto_1411939 ) ( CLEAR ?auto_1411936 ) ( not ( = ?auto_1411936 ?auto_1411939 ) ) ( not ( = ?auto_1411937 ?auto_1411939 ) ) ( not ( = ?auto_1411935 ?auto_1411939 ) ) ( not ( = ?auto_1411940 ?auto_1411939 ) ) ( TRUCK-AT ?auto_1411944 ?auto_1411942 ) ( SURFACE-AT ?auto_1411943 ?auto_1411942 ) ( CLEAR ?auto_1411943 ) ( LIFTING ?auto_1411945 ?auto_1411935 ) ( IS-CRATE ?auto_1411935 ) ( not ( = ?auto_1411943 ?auto_1411935 ) ) ( not ( = ?auto_1411936 ?auto_1411943 ) ) ( not ( = ?auto_1411937 ?auto_1411943 ) ) ( not ( = ?auto_1411940 ?auto_1411943 ) ) ( not ( = ?auto_1411939 ?auto_1411943 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1411936 ?auto_1411937 )
      ( MAKE-2CRATE-VERIFY ?auto_1411935 ?auto_1411936 ?auto_1411937 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1411947 - SURFACE
      ?auto_1411948 - SURFACE
      ?auto_1411949 - SURFACE
      ?auto_1411946 - SURFACE
    )
    :vars
    (
      ?auto_1411955 - HOIST
      ?auto_1411954 - PLACE
      ?auto_1411951 - PLACE
      ?auto_1411952 - HOIST
      ?auto_1411950 - SURFACE
      ?auto_1411956 - SURFACE
      ?auto_1411953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411955 ?auto_1411954 ) ( IS-CRATE ?auto_1411946 ) ( not ( = ?auto_1411949 ?auto_1411946 ) ) ( not ( = ?auto_1411948 ?auto_1411949 ) ) ( not ( = ?auto_1411948 ?auto_1411946 ) ) ( not ( = ?auto_1411951 ?auto_1411954 ) ) ( HOIST-AT ?auto_1411952 ?auto_1411951 ) ( not ( = ?auto_1411955 ?auto_1411952 ) ) ( SURFACE-AT ?auto_1411946 ?auto_1411951 ) ( ON ?auto_1411946 ?auto_1411950 ) ( CLEAR ?auto_1411946 ) ( not ( = ?auto_1411949 ?auto_1411950 ) ) ( not ( = ?auto_1411946 ?auto_1411950 ) ) ( not ( = ?auto_1411948 ?auto_1411950 ) ) ( IS-CRATE ?auto_1411949 ) ( AVAILABLE ?auto_1411952 ) ( SURFACE-AT ?auto_1411949 ?auto_1411951 ) ( ON ?auto_1411949 ?auto_1411956 ) ( CLEAR ?auto_1411949 ) ( not ( = ?auto_1411949 ?auto_1411956 ) ) ( not ( = ?auto_1411946 ?auto_1411956 ) ) ( not ( = ?auto_1411948 ?auto_1411956 ) ) ( not ( = ?auto_1411950 ?auto_1411956 ) ) ( TRUCK-AT ?auto_1411953 ?auto_1411954 ) ( SURFACE-AT ?auto_1411947 ?auto_1411954 ) ( CLEAR ?auto_1411947 ) ( LIFTING ?auto_1411955 ?auto_1411948 ) ( IS-CRATE ?auto_1411948 ) ( not ( = ?auto_1411947 ?auto_1411948 ) ) ( not ( = ?auto_1411949 ?auto_1411947 ) ) ( not ( = ?auto_1411946 ?auto_1411947 ) ) ( not ( = ?auto_1411950 ?auto_1411947 ) ) ( not ( = ?auto_1411956 ?auto_1411947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411948 ?auto_1411949 ?auto_1411946 )
      ( MAKE-3CRATE-VERIFY ?auto_1411947 ?auto_1411948 ?auto_1411949 ?auto_1411946 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1411958 - SURFACE
      ?auto_1411959 - SURFACE
      ?auto_1411960 - SURFACE
      ?auto_1411957 - SURFACE
      ?auto_1411961 - SURFACE
    )
    :vars
    (
      ?auto_1411967 - HOIST
      ?auto_1411966 - PLACE
      ?auto_1411963 - PLACE
      ?auto_1411964 - HOIST
      ?auto_1411962 - SURFACE
      ?auto_1411968 - SURFACE
      ?auto_1411965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411967 ?auto_1411966 ) ( IS-CRATE ?auto_1411961 ) ( not ( = ?auto_1411957 ?auto_1411961 ) ) ( not ( = ?auto_1411960 ?auto_1411957 ) ) ( not ( = ?auto_1411960 ?auto_1411961 ) ) ( not ( = ?auto_1411963 ?auto_1411966 ) ) ( HOIST-AT ?auto_1411964 ?auto_1411963 ) ( not ( = ?auto_1411967 ?auto_1411964 ) ) ( SURFACE-AT ?auto_1411961 ?auto_1411963 ) ( ON ?auto_1411961 ?auto_1411962 ) ( CLEAR ?auto_1411961 ) ( not ( = ?auto_1411957 ?auto_1411962 ) ) ( not ( = ?auto_1411961 ?auto_1411962 ) ) ( not ( = ?auto_1411960 ?auto_1411962 ) ) ( IS-CRATE ?auto_1411957 ) ( AVAILABLE ?auto_1411964 ) ( SURFACE-AT ?auto_1411957 ?auto_1411963 ) ( ON ?auto_1411957 ?auto_1411968 ) ( CLEAR ?auto_1411957 ) ( not ( = ?auto_1411957 ?auto_1411968 ) ) ( not ( = ?auto_1411961 ?auto_1411968 ) ) ( not ( = ?auto_1411960 ?auto_1411968 ) ) ( not ( = ?auto_1411962 ?auto_1411968 ) ) ( TRUCK-AT ?auto_1411965 ?auto_1411966 ) ( SURFACE-AT ?auto_1411959 ?auto_1411966 ) ( CLEAR ?auto_1411959 ) ( LIFTING ?auto_1411967 ?auto_1411960 ) ( IS-CRATE ?auto_1411960 ) ( not ( = ?auto_1411959 ?auto_1411960 ) ) ( not ( = ?auto_1411957 ?auto_1411959 ) ) ( not ( = ?auto_1411961 ?auto_1411959 ) ) ( not ( = ?auto_1411962 ?auto_1411959 ) ) ( not ( = ?auto_1411968 ?auto_1411959 ) ) ( ON ?auto_1411959 ?auto_1411958 ) ( not ( = ?auto_1411958 ?auto_1411959 ) ) ( not ( = ?auto_1411958 ?auto_1411960 ) ) ( not ( = ?auto_1411958 ?auto_1411957 ) ) ( not ( = ?auto_1411958 ?auto_1411961 ) ) ( not ( = ?auto_1411958 ?auto_1411962 ) ) ( not ( = ?auto_1411958 ?auto_1411968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411960 ?auto_1411957 ?auto_1411961 )
      ( MAKE-4CRATE-VERIFY ?auto_1411958 ?auto_1411959 ?auto_1411960 ?auto_1411957 ?auto_1411961 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1411970 - SURFACE
      ?auto_1411971 - SURFACE
      ?auto_1411972 - SURFACE
      ?auto_1411969 - SURFACE
      ?auto_1411973 - SURFACE
      ?auto_1411974 - SURFACE
    )
    :vars
    (
      ?auto_1411980 - HOIST
      ?auto_1411979 - PLACE
      ?auto_1411976 - PLACE
      ?auto_1411977 - HOIST
      ?auto_1411975 - SURFACE
      ?auto_1411981 - SURFACE
      ?auto_1411978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411980 ?auto_1411979 ) ( IS-CRATE ?auto_1411974 ) ( not ( = ?auto_1411973 ?auto_1411974 ) ) ( not ( = ?auto_1411969 ?auto_1411973 ) ) ( not ( = ?auto_1411969 ?auto_1411974 ) ) ( not ( = ?auto_1411976 ?auto_1411979 ) ) ( HOIST-AT ?auto_1411977 ?auto_1411976 ) ( not ( = ?auto_1411980 ?auto_1411977 ) ) ( SURFACE-AT ?auto_1411974 ?auto_1411976 ) ( ON ?auto_1411974 ?auto_1411975 ) ( CLEAR ?auto_1411974 ) ( not ( = ?auto_1411973 ?auto_1411975 ) ) ( not ( = ?auto_1411974 ?auto_1411975 ) ) ( not ( = ?auto_1411969 ?auto_1411975 ) ) ( IS-CRATE ?auto_1411973 ) ( AVAILABLE ?auto_1411977 ) ( SURFACE-AT ?auto_1411973 ?auto_1411976 ) ( ON ?auto_1411973 ?auto_1411981 ) ( CLEAR ?auto_1411973 ) ( not ( = ?auto_1411973 ?auto_1411981 ) ) ( not ( = ?auto_1411974 ?auto_1411981 ) ) ( not ( = ?auto_1411969 ?auto_1411981 ) ) ( not ( = ?auto_1411975 ?auto_1411981 ) ) ( TRUCK-AT ?auto_1411978 ?auto_1411979 ) ( SURFACE-AT ?auto_1411972 ?auto_1411979 ) ( CLEAR ?auto_1411972 ) ( LIFTING ?auto_1411980 ?auto_1411969 ) ( IS-CRATE ?auto_1411969 ) ( not ( = ?auto_1411972 ?auto_1411969 ) ) ( not ( = ?auto_1411973 ?auto_1411972 ) ) ( not ( = ?auto_1411974 ?auto_1411972 ) ) ( not ( = ?auto_1411975 ?auto_1411972 ) ) ( not ( = ?auto_1411981 ?auto_1411972 ) ) ( ON ?auto_1411971 ?auto_1411970 ) ( ON ?auto_1411972 ?auto_1411971 ) ( not ( = ?auto_1411970 ?auto_1411971 ) ) ( not ( = ?auto_1411970 ?auto_1411972 ) ) ( not ( = ?auto_1411970 ?auto_1411969 ) ) ( not ( = ?auto_1411970 ?auto_1411973 ) ) ( not ( = ?auto_1411970 ?auto_1411974 ) ) ( not ( = ?auto_1411970 ?auto_1411975 ) ) ( not ( = ?auto_1411970 ?auto_1411981 ) ) ( not ( = ?auto_1411971 ?auto_1411972 ) ) ( not ( = ?auto_1411971 ?auto_1411969 ) ) ( not ( = ?auto_1411971 ?auto_1411973 ) ) ( not ( = ?auto_1411971 ?auto_1411974 ) ) ( not ( = ?auto_1411971 ?auto_1411975 ) ) ( not ( = ?auto_1411971 ?auto_1411981 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411969 ?auto_1411973 ?auto_1411974 )
      ( MAKE-5CRATE-VERIFY ?auto_1411970 ?auto_1411971 ?auto_1411972 ?auto_1411969 ?auto_1411973 ?auto_1411974 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1411983 - SURFACE
      ?auto_1411984 - SURFACE
      ?auto_1411985 - SURFACE
      ?auto_1411982 - SURFACE
      ?auto_1411986 - SURFACE
      ?auto_1411988 - SURFACE
      ?auto_1411987 - SURFACE
    )
    :vars
    (
      ?auto_1411994 - HOIST
      ?auto_1411993 - PLACE
      ?auto_1411990 - PLACE
      ?auto_1411991 - HOIST
      ?auto_1411989 - SURFACE
      ?auto_1411995 - SURFACE
      ?auto_1411992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411994 ?auto_1411993 ) ( IS-CRATE ?auto_1411987 ) ( not ( = ?auto_1411988 ?auto_1411987 ) ) ( not ( = ?auto_1411986 ?auto_1411988 ) ) ( not ( = ?auto_1411986 ?auto_1411987 ) ) ( not ( = ?auto_1411990 ?auto_1411993 ) ) ( HOIST-AT ?auto_1411991 ?auto_1411990 ) ( not ( = ?auto_1411994 ?auto_1411991 ) ) ( SURFACE-AT ?auto_1411987 ?auto_1411990 ) ( ON ?auto_1411987 ?auto_1411989 ) ( CLEAR ?auto_1411987 ) ( not ( = ?auto_1411988 ?auto_1411989 ) ) ( not ( = ?auto_1411987 ?auto_1411989 ) ) ( not ( = ?auto_1411986 ?auto_1411989 ) ) ( IS-CRATE ?auto_1411988 ) ( AVAILABLE ?auto_1411991 ) ( SURFACE-AT ?auto_1411988 ?auto_1411990 ) ( ON ?auto_1411988 ?auto_1411995 ) ( CLEAR ?auto_1411988 ) ( not ( = ?auto_1411988 ?auto_1411995 ) ) ( not ( = ?auto_1411987 ?auto_1411995 ) ) ( not ( = ?auto_1411986 ?auto_1411995 ) ) ( not ( = ?auto_1411989 ?auto_1411995 ) ) ( TRUCK-AT ?auto_1411992 ?auto_1411993 ) ( SURFACE-AT ?auto_1411982 ?auto_1411993 ) ( CLEAR ?auto_1411982 ) ( LIFTING ?auto_1411994 ?auto_1411986 ) ( IS-CRATE ?auto_1411986 ) ( not ( = ?auto_1411982 ?auto_1411986 ) ) ( not ( = ?auto_1411988 ?auto_1411982 ) ) ( not ( = ?auto_1411987 ?auto_1411982 ) ) ( not ( = ?auto_1411989 ?auto_1411982 ) ) ( not ( = ?auto_1411995 ?auto_1411982 ) ) ( ON ?auto_1411984 ?auto_1411983 ) ( ON ?auto_1411985 ?auto_1411984 ) ( ON ?auto_1411982 ?auto_1411985 ) ( not ( = ?auto_1411983 ?auto_1411984 ) ) ( not ( = ?auto_1411983 ?auto_1411985 ) ) ( not ( = ?auto_1411983 ?auto_1411982 ) ) ( not ( = ?auto_1411983 ?auto_1411986 ) ) ( not ( = ?auto_1411983 ?auto_1411988 ) ) ( not ( = ?auto_1411983 ?auto_1411987 ) ) ( not ( = ?auto_1411983 ?auto_1411989 ) ) ( not ( = ?auto_1411983 ?auto_1411995 ) ) ( not ( = ?auto_1411984 ?auto_1411985 ) ) ( not ( = ?auto_1411984 ?auto_1411982 ) ) ( not ( = ?auto_1411984 ?auto_1411986 ) ) ( not ( = ?auto_1411984 ?auto_1411988 ) ) ( not ( = ?auto_1411984 ?auto_1411987 ) ) ( not ( = ?auto_1411984 ?auto_1411989 ) ) ( not ( = ?auto_1411984 ?auto_1411995 ) ) ( not ( = ?auto_1411985 ?auto_1411982 ) ) ( not ( = ?auto_1411985 ?auto_1411986 ) ) ( not ( = ?auto_1411985 ?auto_1411988 ) ) ( not ( = ?auto_1411985 ?auto_1411987 ) ) ( not ( = ?auto_1411985 ?auto_1411989 ) ) ( not ( = ?auto_1411985 ?auto_1411995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411986 ?auto_1411988 ?auto_1411987 )
      ( MAKE-6CRATE-VERIFY ?auto_1411983 ?auto_1411984 ?auto_1411985 ?auto_1411982 ?auto_1411986 ?auto_1411988 ?auto_1411987 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1411997 - SURFACE
      ?auto_1411998 - SURFACE
      ?auto_1411999 - SURFACE
      ?auto_1411996 - SURFACE
      ?auto_1412000 - SURFACE
      ?auto_1412002 - SURFACE
      ?auto_1412001 - SURFACE
      ?auto_1412003 - SURFACE
    )
    :vars
    (
      ?auto_1412009 - HOIST
      ?auto_1412008 - PLACE
      ?auto_1412005 - PLACE
      ?auto_1412006 - HOIST
      ?auto_1412004 - SURFACE
      ?auto_1412010 - SURFACE
      ?auto_1412007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1412009 ?auto_1412008 ) ( IS-CRATE ?auto_1412003 ) ( not ( = ?auto_1412001 ?auto_1412003 ) ) ( not ( = ?auto_1412002 ?auto_1412001 ) ) ( not ( = ?auto_1412002 ?auto_1412003 ) ) ( not ( = ?auto_1412005 ?auto_1412008 ) ) ( HOIST-AT ?auto_1412006 ?auto_1412005 ) ( not ( = ?auto_1412009 ?auto_1412006 ) ) ( SURFACE-AT ?auto_1412003 ?auto_1412005 ) ( ON ?auto_1412003 ?auto_1412004 ) ( CLEAR ?auto_1412003 ) ( not ( = ?auto_1412001 ?auto_1412004 ) ) ( not ( = ?auto_1412003 ?auto_1412004 ) ) ( not ( = ?auto_1412002 ?auto_1412004 ) ) ( IS-CRATE ?auto_1412001 ) ( AVAILABLE ?auto_1412006 ) ( SURFACE-AT ?auto_1412001 ?auto_1412005 ) ( ON ?auto_1412001 ?auto_1412010 ) ( CLEAR ?auto_1412001 ) ( not ( = ?auto_1412001 ?auto_1412010 ) ) ( not ( = ?auto_1412003 ?auto_1412010 ) ) ( not ( = ?auto_1412002 ?auto_1412010 ) ) ( not ( = ?auto_1412004 ?auto_1412010 ) ) ( TRUCK-AT ?auto_1412007 ?auto_1412008 ) ( SURFACE-AT ?auto_1412000 ?auto_1412008 ) ( CLEAR ?auto_1412000 ) ( LIFTING ?auto_1412009 ?auto_1412002 ) ( IS-CRATE ?auto_1412002 ) ( not ( = ?auto_1412000 ?auto_1412002 ) ) ( not ( = ?auto_1412001 ?auto_1412000 ) ) ( not ( = ?auto_1412003 ?auto_1412000 ) ) ( not ( = ?auto_1412004 ?auto_1412000 ) ) ( not ( = ?auto_1412010 ?auto_1412000 ) ) ( ON ?auto_1411998 ?auto_1411997 ) ( ON ?auto_1411999 ?auto_1411998 ) ( ON ?auto_1411996 ?auto_1411999 ) ( ON ?auto_1412000 ?auto_1411996 ) ( not ( = ?auto_1411997 ?auto_1411998 ) ) ( not ( = ?auto_1411997 ?auto_1411999 ) ) ( not ( = ?auto_1411997 ?auto_1411996 ) ) ( not ( = ?auto_1411997 ?auto_1412000 ) ) ( not ( = ?auto_1411997 ?auto_1412002 ) ) ( not ( = ?auto_1411997 ?auto_1412001 ) ) ( not ( = ?auto_1411997 ?auto_1412003 ) ) ( not ( = ?auto_1411997 ?auto_1412004 ) ) ( not ( = ?auto_1411997 ?auto_1412010 ) ) ( not ( = ?auto_1411998 ?auto_1411999 ) ) ( not ( = ?auto_1411998 ?auto_1411996 ) ) ( not ( = ?auto_1411998 ?auto_1412000 ) ) ( not ( = ?auto_1411998 ?auto_1412002 ) ) ( not ( = ?auto_1411998 ?auto_1412001 ) ) ( not ( = ?auto_1411998 ?auto_1412003 ) ) ( not ( = ?auto_1411998 ?auto_1412004 ) ) ( not ( = ?auto_1411998 ?auto_1412010 ) ) ( not ( = ?auto_1411999 ?auto_1411996 ) ) ( not ( = ?auto_1411999 ?auto_1412000 ) ) ( not ( = ?auto_1411999 ?auto_1412002 ) ) ( not ( = ?auto_1411999 ?auto_1412001 ) ) ( not ( = ?auto_1411999 ?auto_1412003 ) ) ( not ( = ?auto_1411999 ?auto_1412004 ) ) ( not ( = ?auto_1411999 ?auto_1412010 ) ) ( not ( = ?auto_1411996 ?auto_1412000 ) ) ( not ( = ?auto_1411996 ?auto_1412002 ) ) ( not ( = ?auto_1411996 ?auto_1412001 ) ) ( not ( = ?auto_1411996 ?auto_1412003 ) ) ( not ( = ?auto_1411996 ?auto_1412004 ) ) ( not ( = ?auto_1411996 ?auto_1412010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1412002 ?auto_1412001 ?auto_1412003 )
      ( MAKE-7CRATE-VERIFY ?auto_1411997 ?auto_1411998 ?auto_1411999 ?auto_1411996 ?auto_1412000 ?auto_1412002 ?auto_1412001 ?auto_1412003 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1412012 - SURFACE
      ?auto_1412013 - SURFACE
      ?auto_1412014 - SURFACE
      ?auto_1412011 - SURFACE
      ?auto_1412015 - SURFACE
      ?auto_1412017 - SURFACE
      ?auto_1412016 - SURFACE
      ?auto_1412018 - SURFACE
      ?auto_1412019 - SURFACE
    )
    :vars
    (
      ?auto_1412025 - HOIST
      ?auto_1412024 - PLACE
      ?auto_1412021 - PLACE
      ?auto_1412022 - HOIST
      ?auto_1412020 - SURFACE
      ?auto_1412026 - SURFACE
      ?auto_1412023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1412025 ?auto_1412024 ) ( IS-CRATE ?auto_1412019 ) ( not ( = ?auto_1412018 ?auto_1412019 ) ) ( not ( = ?auto_1412016 ?auto_1412018 ) ) ( not ( = ?auto_1412016 ?auto_1412019 ) ) ( not ( = ?auto_1412021 ?auto_1412024 ) ) ( HOIST-AT ?auto_1412022 ?auto_1412021 ) ( not ( = ?auto_1412025 ?auto_1412022 ) ) ( SURFACE-AT ?auto_1412019 ?auto_1412021 ) ( ON ?auto_1412019 ?auto_1412020 ) ( CLEAR ?auto_1412019 ) ( not ( = ?auto_1412018 ?auto_1412020 ) ) ( not ( = ?auto_1412019 ?auto_1412020 ) ) ( not ( = ?auto_1412016 ?auto_1412020 ) ) ( IS-CRATE ?auto_1412018 ) ( AVAILABLE ?auto_1412022 ) ( SURFACE-AT ?auto_1412018 ?auto_1412021 ) ( ON ?auto_1412018 ?auto_1412026 ) ( CLEAR ?auto_1412018 ) ( not ( = ?auto_1412018 ?auto_1412026 ) ) ( not ( = ?auto_1412019 ?auto_1412026 ) ) ( not ( = ?auto_1412016 ?auto_1412026 ) ) ( not ( = ?auto_1412020 ?auto_1412026 ) ) ( TRUCK-AT ?auto_1412023 ?auto_1412024 ) ( SURFACE-AT ?auto_1412017 ?auto_1412024 ) ( CLEAR ?auto_1412017 ) ( LIFTING ?auto_1412025 ?auto_1412016 ) ( IS-CRATE ?auto_1412016 ) ( not ( = ?auto_1412017 ?auto_1412016 ) ) ( not ( = ?auto_1412018 ?auto_1412017 ) ) ( not ( = ?auto_1412019 ?auto_1412017 ) ) ( not ( = ?auto_1412020 ?auto_1412017 ) ) ( not ( = ?auto_1412026 ?auto_1412017 ) ) ( ON ?auto_1412013 ?auto_1412012 ) ( ON ?auto_1412014 ?auto_1412013 ) ( ON ?auto_1412011 ?auto_1412014 ) ( ON ?auto_1412015 ?auto_1412011 ) ( ON ?auto_1412017 ?auto_1412015 ) ( not ( = ?auto_1412012 ?auto_1412013 ) ) ( not ( = ?auto_1412012 ?auto_1412014 ) ) ( not ( = ?auto_1412012 ?auto_1412011 ) ) ( not ( = ?auto_1412012 ?auto_1412015 ) ) ( not ( = ?auto_1412012 ?auto_1412017 ) ) ( not ( = ?auto_1412012 ?auto_1412016 ) ) ( not ( = ?auto_1412012 ?auto_1412018 ) ) ( not ( = ?auto_1412012 ?auto_1412019 ) ) ( not ( = ?auto_1412012 ?auto_1412020 ) ) ( not ( = ?auto_1412012 ?auto_1412026 ) ) ( not ( = ?auto_1412013 ?auto_1412014 ) ) ( not ( = ?auto_1412013 ?auto_1412011 ) ) ( not ( = ?auto_1412013 ?auto_1412015 ) ) ( not ( = ?auto_1412013 ?auto_1412017 ) ) ( not ( = ?auto_1412013 ?auto_1412016 ) ) ( not ( = ?auto_1412013 ?auto_1412018 ) ) ( not ( = ?auto_1412013 ?auto_1412019 ) ) ( not ( = ?auto_1412013 ?auto_1412020 ) ) ( not ( = ?auto_1412013 ?auto_1412026 ) ) ( not ( = ?auto_1412014 ?auto_1412011 ) ) ( not ( = ?auto_1412014 ?auto_1412015 ) ) ( not ( = ?auto_1412014 ?auto_1412017 ) ) ( not ( = ?auto_1412014 ?auto_1412016 ) ) ( not ( = ?auto_1412014 ?auto_1412018 ) ) ( not ( = ?auto_1412014 ?auto_1412019 ) ) ( not ( = ?auto_1412014 ?auto_1412020 ) ) ( not ( = ?auto_1412014 ?auto_1412026 ) ) ( not ( = ?auto_1412011 ?auto_1412015 ) ) ( not ( = ?auto_1412011 ?auto_1412017 ) ) ( not ( = ?auto_1412011 ?auto_1412016 ) ) ( not ( = ?auto_1412011 ?auto_1412018 ) ) ( not ( = ?auto_1412011 ?auto_1412019 ) ) ( not ( = ?auto_1412011 ?auto_1412020 ) ) ( not ( = ?auto_1412011 ?auto_1412026 ) ) ( not ( = ?auto_1412015 ?auto_1412017 ) ) ( not ( = ?auto_1412015 ?auto_1412016 ) ) ( not ( = ?auto_1412015 ?auto_1412018 ) ) ( not ( = ?auto_1412015 ?auto_1412019 ) ) ( not ( = ?auto_1412015 ?auto_1412020 ) ) ( not ( = ?auto_1412015 ?auto_1412026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1412016 ?auto_1412018 ?auto_1412019 )
      ( MAKE-8CRATE-VERIFY ?auto_1412012 ?auto_1412013 ?auto_1412014 ?auto_1412011 ?auto_1412015 ?auto_1412017 ?auto_1412016 ?auto_1412018 ?auto_1412019 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1412028 - SURFACE
      ?auto_1412029 - SURFACE
      ?auto_1412030 - SURFACE
      ?auto_1412027 - SURFACE
      ?auto_1412031 - SURFACE
      ?auto_1412033 - SURFACE
      ?auto_1412032 - SURFACE
      ?auto_1412034 - SURFACE
      ?auto_1412035 - SURFACE
      ?auto_1412036 - SURFACE
    )
    :vars
    (
      ?auto_1412042 - HOIST
      ?auto_1412041 - PLACE
      ?auto_1412038 - PLACE
      ?auto_1412039 - HOIST
      ?auto_1412037 - SURFACE
      ?auto_1412043 - SURFACE
      ?auto_1412040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1412042 ?auto_1412041 ) ( IS-CRATE ?auto_1412036 ) ( not ( = ?auto_1412035 ?auto_1412036 ) ) ( not ( = ?auto_1412034 ?auto_1412035 ) ) ( not ( = ?auto_1412034 ?auto_1412036 ) ) ( not ( = ?auto_1412038 ?auto_1412041 ) ) ( HOIST-AT ?auto_1412039 ?auto_1412038 ) ( not ( = ?auto_1412042 ?auto_1412039 ) ) ( SURFACE-AT ?auto_1412036 ?auto_1412038 ) ( ON ?auto_1412036 ?auto_1412037 ) ( CLEAR ?auto_1412036 ) ( not ( = ?auto_1412035 ?auto_1412037 ) ) ( not ( = ?auto_1412036 ?auto_1412037 ) ) ( not ( = ?auto_1412034 ?auto_1412037 ) ) ( IS-CRATE ?auto_1412035 ) ( AVAILABLE ?auto_1412039 ) ( SURFACE-AT ?auto_1412035 ?auto_1412038 ) ( ON ?auto_1412035 ?auto_1412043 ) ( CLEAR ?auto_1412035 ) ( not ( = ?auto_1412035 ?auto_1412043 ) ) ( not ( = ?auto_1412036 ?auto_1412043 ) ) ( not ( = ?auto_1412034 ?auto_1412043 ) ) ( not ( = ?auto_1412037 ?auto_1412043 ) ) ( TRUCK-AT ?auto_1412040 ?auto_1412041 ) ( SURFACE-AT ?auto_1412032 ?auto_1412041 ) ( CLEAR ?auto_1412032 ) ( LIFTING ?auto_1412042 ?auto_1412034 ) ( IS-CRATE ?auto_1412034 ) ( not ( = ?auto_1412032 ?auto_1412034 ) ) ( not ( = ?auto_1412035 ?auto_1412032 ) ) ( not ( = ?auto_1412036 ?auto_1412032 ) ) ( not ( = ?auto_1412037 ?auto_1412032 ) ) ( not ( = ?auto_1412043 ?auto_1412032 ) ) ( ON ?auto_1412029 ?auto_1412028 ) ( ON ?auto_1412030 ?auto_1412029 ) ( ON ?auto_1412027 ?auto_1412030 ) ( ON ?auto_1412031 ?auto_1412027 ) ( ON ?auto_1412033 ?auto_1412031 ) ( ON ?auto_1412032 ?auto_1412033 ) ( not ( = ?auto_1412028 ?auto_1412029 ) ) ( not ( = ?auto_1412028 ?auto_1412030 ) ) ( not ( = ?auto_1412028 ?auto_1412027 ) ) ( not ( = ?auto_1412028 ?auto_1412031 ) ) ( not ( = ?auto_1412028 ?auto_1412033 ) ) ( not ( = ?auto_1412028 ?auto_1412032 ) ) ( not ( = ?auto_1412028 ?auto_1412034 ) ) ( not ( = ?auto_1412028 ?auto_1412035 ) ) ( not ( = ?auto_1412028 ?auto_1412036 ) ) ( not ( = ?auto_1412028 ?auto_1412037 ) ) ( not ( = ?auto_1412028 ?auto_1412043 ) ) ( not ( = ?auto_1412029 ?auto_1412030 ) ) ( not ( = ?auto_1412029 ?auto_1412027 ) ) ( not ( = ?auto_1412029 ?auto_1412031 ) ) ( not ( = ?auto_1412029 ?auto_1412033 ) ) ( not ( = ?auto_1412029 ?auto_1412032 ) ) ( not ( = ?auto_1412029 ?auto_1412034 ) ) ( not ( = ?auto_1412029 ?auto_1412035 ) ) ( not ( = ?auto_1412029 ?auto_1412036 ) ) ( not ( = ?auto_1412029 ?auto_1412037 ) ) ( not ( = ?auto_1412029 ?auto_1412043 ) ) ( not ( = ?auto_1412030 ?auto_1412027 ) ) ( not ( = ?auto_1412030 ?auto_1412031 ) ) ( not ( = ?auto_1412030 ?auto_1412033 ) ) ( not ( = ?auto_1412030 ?auto_1412032 ) ) ( not ( = ?auto_1412030 ?auto_1412034 ) ) ( not ( = ?auto_1412030 ?auto_1412035 ) ) ( not ( = ?auto_1412030 ?auto_1412036 ) ) ( not ( = ?auto_1412030 ?auto_1412037 ) ) ( not ( = ?auto_1412030 ?auto_1412043 ) ) ( not ( = ?auto_1412027 ?auto_1412031 ) ) ( not ( = ?auto_1412027 ?auto_1412033 ) ) ( not ( = ?auto_1412027 ?auto_1412032 ) ) ( not ( = ?auto_1412027 ?auto_1412034 ) ) ( not ( = ?auto_1412027 ?auto_1412035 ) ) ( not ( = ?auto_1412027 ?auto_1412036 ) ) ( not ( = ?auto_1412027 ?auto_1412037 ) ) ( not ( = ?auto_1412027 ?auto_1412043 ) ) ( not ( = ?auto_1412031 ?auto_1412033 ) ) ( not ( = ?auto_1412031 ?auto_1412032 ) ) ( not ( = ?auto_1412031 ?auto_1412034 ) ) ( not ( = ?auto_1412031 ?auto_1412035 ) ) ( not ( = ?auto_1412031 ?auto_1412036 ) ) ( not ( = ?auto_1412031 ?auto_1412037 ) ) ( not ( = ?auto_1412031 ?auto_1412043 ) ) ( not ( = ?auto_1412033 ?auto_1412032 ) ) ( not ( = ?auto_1412033 ?auto_1412034 ) ) ( not ( = ?auto_1412033 ?auto_1412035 ) ) ( not ( = ?auto_1412033 ?auto_1412036 ) ) ( not ( = ?auto_1412033 ?auto_1412037 ) ) ( not ( = ?auto_1412033 ?auto_1412043 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1412034 ?auto_1412035 ?auto_1412036 )
      ( MAKE-9CRATE-VERIFY ?auto_1412028 ?auto_1412029 ?auto_1412030 ?auto_1412027 ?auto_1412031 ?auto_1412033 ?auto_1412032 ?auto_1412034 ?auto_1412035 ?auto_1412036 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1412045 - SURFACE
      ?auto_1412046 - SURFACE
      ?auto_1412047 - SURFACE
      ?auto_1412044 - SURFACE
      ?auto_1412048 - SURFACE
      ?auto_1412050 - SURFACE
      ?auto_1412049 - SURFACE
      ?auto_1412051 - SURFACE
      ?auto_1412052 - SURFACE
      ?auto_1412053 - SURFACE
      ?auto_1412054 - SURFACE
    )
    :vars
    (
      ?auto_1412060 - HOIST
      ?auto_1412059 - PLACE
      ?auto_1412056 - PLACE
      ?auto_1412057 - HOIST
      ?auto_1412055 - SURFACE
      ?auto_1412061 - SURFACE
      ?auto_1412058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1412060 ?auto_1412059 ) ( IS-CRATE ?auto_1412054 ) ( not ( = ?auto_1412053 ?auto_1412054 ) ) ( not ( = ?auto_1412052 ?auto_1412053 ) ) ( not ( = ?auto_1412052 ?auto_1412054 ) ) ( not ( = ?auto_1412056 ?auto_1412059 ) ) ( HOIST-AT ?auto_1412057 ?auto_1412056 ) ( not ( = ?auto_1412060 ?auto_1412057 ) ) ( SURFACE-AT ?auto_1412054 ?auto_1412056 ) ( ON ?auto_1412054 ?auto_1412055 ) ( CLEAR ?auto_1412054 ) ( not ( = ?auto_1412053 ?auto_1412055 ) ) ( not ( = ?auto_1412054 ?auto_1412055 ) ) ( not ( = ?auto_1412052 ?auto_1412055 ) ) ( IS-CRATE ?auto_1412053 ) ( AVAILABLE ?auto_1412057 ) ( SURFACE-AT ?auto_1412053 ?auto_1412056 ) ( ON ?auto_1412053 ?auto_1412061 ) ( CLEAR ?auto_1412053 ) ( not ( = ?auto_1412053 ?auto_1412061 ) ) ( not ( = ?auto_1412054 ?auto_1412061 ) ) ( not ( = ?auto_1412052 ?auto_1412061 ) ) ( not ( = ?auto_1412055 ?auto_1412061 ) ) ( TRUCK-AT ?auto_1412058 ?auto_1412059 ) ( SURFACE-AT ?auto_1412051 ?auto_1412059 ) ( CLEAR ?auto_1412051 ) ( LIFTING ?auto_1412060 ?auto_1412052 ) ( IS-CRATE ?auto_1412052 ) ( not ( = ?auto_1412051 ?auto_1412052 ) ) ( not ( = ?auto_1412053 ?auto_1412051 ) ) ( not ( = ?auto_1412054 ?auto_1412051 ) ) ( not ( = ?auto_1412055 ?auto_1412051 ) ) ( not ( = ?auto_1412061 ?auto_1412051 ) ) ( ON ?auto_1412046 ?auto_1412045 ) ( ON ?auto_1412047 ?auto_1412046 ) ( ON ?auto_1412044 ?auto_1412047 ) ( ON ?auto_1412048 ?auto_1412044 ) ( ON ?auto_1412050 ?auto_1412048 ) ( ON ?auto_1412049 ?auto_1412050 ) ( ON ?auto_1412051 ?auto_1412049 ) ( not ( = ?auto_1412045 ?auto_1412046 ) ) ( not ( = ?auto_1412045 ?auto_1412047 ) ) ( not ( = ?auto_1412045 ?auto_1412044 ) ) ( not ( = ?auto_1412045 ?auto_1412048 ) ) ( not ( = ?auto_1412045 ?auto_1412050 ) ) ( not ( = ?auto_1412045 ?auto_1412049 ) ) ( not ( = ?auto_1412045 ?auto_1412051 ) ) ( not ( = ?auto_1412045 ?auto_1412052 ) ) ( not ( = ?auto_1412045 ?auto_1412053 ) ) ( not ( = ?auto_1412045 ?auto_1412054 ) ) ( not ( = ?auto_1412045 ?auto_1412055 ) ) ( not ( = ?auto_1412045 ?auto_1412061 ) ) ( not ( = ?auto_1412046 ?auto_1412047 ) ) ( not ( = ?auto_1412046 ?auto_1412044 ) ) ( not ( = ?auto_1412046 ?auto_1412048 ) ) ( not ( = ?auto_1412046 ?auto_1412050 ) ) ( not ( = ?auto_1412046 ?auto_1412049 ) ) ( not ( = ?auto_1412046 ?auto_1412051 ) ) ( not ( = ?auto_1412046 ?auto_1412052 ) ) ( not ( = ?auto_1412046 ?auto_1412053 ) ) ( not ( = ?auto_1412046 ?auto_1412054 ) ) ( not ( = ?auto_1412046 ?auto_1412055 ) ) ( not ( = ?auto_1412046 ?auto_1412061 ) ) ( not ( = ?auto_1412047 ?auto_1412044 ) ) ( not ( = ?auto_1412047 ?auto_1412048 ) ) ( not ( = ?auto_1412047 ?auto_1412050 ) ) ( not ( = ?auto_1412047 ?auto_1412049 ) ) ( not ( = ?auto_1412047 ?auto_1412051 ) ) ( not ( = ?auto_1412047 ?auto_1412052 ) ) ( not ( = ?auto_1412047 ?auto_1412053 ) ) ( not ( = ?auto_1412047 ?auto_1412054 ) ) ( not ( = ?auto_1412047 ?auto_1412055 ) ) ( not ( = ?auto_1412047 ?auto_1412061 ) ) ( not ( = ?auto_1412044 ?auto_1412048 ) ) ( not ( = ?auto_1412044 ?auto_1412050 ) ) ( not ( = ?auto_1412044 ?auto_1412049 ) ) ( not ( = ?auto_1412044 ?auto_1412051 ) ) ( not ( = ?auto_1412044 ?auto_1412052 ) ) ( not ( = ?auto_1412044 ?auto_1412053 ) ) ( not ( = ?auto_1412044 ?auto_1412054 ) ) ( not ( = ?auto_1412044 ?auto_1412055 ) ) ( not ( = ?auto_1412044 ?auto_1412061 ) ) ( not ( = ?auto_1412048 ?auto_1412050 ) ) ( not ( = ?auto_1412048 ?auto_1412049 ) ) ( not ( = ?auto_1412048 ?auto_1412051 ) ) ( not ( = ?auto_1412048 ?auto_1412052 ) ) ( not ( = ?auto_1412048 ?auto_1412053 ) ) ( not ( = ?auto_1412048 ?auto_1412054 ) ) ( not ( = ?auto_1412048 ?auto_1412055 ) ) ( not ( = ?auto_1412048 ?auto_1412061 ) ) ( not ( = ?auto_1412050 ?auto_1412049 ) ) ( not ( = ?auto_1412050 ?auto_1412051 ) ) ( not ( = ?auto_1412050 ?auto_1412052 ) ) ( not ( = ?auto_1412050 ?auto_1412053 ) ) ( not ( = ?auto_1412050 ?auto_1412054 ) ) ( not ( = ?auto_1412050 ?auto_1412055 ) ) ( not ( = ?auto_1412050 ?auto_1412061 ) ) ( not ( = ?auto_1412049 ?auto_1412051 ) ) ( not ( = ?auto_1412049 ?auto_1412052 ) ) ( not ( = ?auto_1412049 ?auto_1412053 ) ) ( not ( = ?auto_1412049 ?auto_1412054 ) ) ( not ( = ?auto_1412049 ?auto_1412055 ) ) ( not ( = ?auto_1412049 ?auto_1412061 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1412052 ?auto_1412053 ?auto_1412054 )
      ( MAKE-10CRATE-VERIFY ?auto_1412045 ?auto_1412046 ?auto_1412047 ?auto_1412044 ?auto_1412048 ?auto_1412050 ?auto_1412049 ?auto_1412051 ?auto_1412052 ?auto_1412053 ?auto_1412054 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1412063 - SURFACE
      ?auto_1412064 - SURFACE
      ?auto_1412065 - SURFACE
      ?auto_1412062 - SURFACE
      ?auto_1412066 - SURFACE
      ?auto_1412068 - SURFACE
      ?auto_1412067 - SURFACE
      ?auto_1412069 - SURFACE
      ?auto_1412070 - SURFACE
      ?auto_1412071 - SURFACE
      ?auto_1412072 - SURFACE
      ?auto_1412073 - SURFACE
    )
    :vars
    (
      ?auto_1412079 - HOIST
      ?auto_1412078 - PLACE
      ?auto_1412075 - PLACE
      ?auto_1412076 - HOIST
      ?auto_1412074 - SURFACE
      ?auto_1412080 - SURFACE
      ?auto_1412077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1412079 ?auto_1412078 ) ( IS-CRATE ?auto_1412073 ) ( not ( = ?auto_1412072 ?auto_1412073 ) ) ( not ( = ?auto_1412071 ?auto_1412072 ) ) ( not ( = ?auto_1412071 ?auto_1412073 ) ) ( not ( = ?auto_1412075 ?auto_1412078 ) ) ( HOIST-AT ?auto_1412076 ?auto_1412075 ) ( not ( = ?auto_1412079 ?auto_1412076 ) ) ( SURFACE-AT ?auto_1412073 ?auto_1412075 ) ( ON ?auto_1412073 ?auto_1412074 ) ( CLEAR ?auto_1412073 ) ( not ( = ?auto_1412072 ?auto_1412074 ) ) ( not ( = ?auto_1412073 ?auto_1412074 ) ) ( not ( = ?auto_1412071 ?auto_1412074 ) ) ( IS-CRATE ?auto_1412072 ) ( AVAILABLE ?auto_1412076 ) ( SURFACE-AT ?auto_1412072 ?auto_1412075 ) ( ON ?auto_1412072 ?auto_1412080 ) ( CLEAR ?auto_1412072 ) ( not ( = ?auto_1412072 ?auto_1412080 ) ) ( not ( = ?auto_1412073 ?auto_1412080 ) ) ( not ( = ?auto_1412071 ?auto_1412080 ) ) ( not ( = ?auto_1412074 ?auto_1412080 ) ) ( TRUCK-AT ?auto_1412077 ?auto_1412078 ) ( SURFACE-AT ?auto_1412070 ?auto_1412078 ) ( CLEAR ?auto_1412070 ) ( LIFTING ?auto_1412079 ?auto_1412071 ) ( IS-CRATE ?auto_1412071 ) ( not ( = ?auto_1412070 ?auto_1412071 ) ) ( not ( = ?auto_1412072 ?auto_1412070 ) ) ( not ( = ?auto_1412073 ?auto_1412070 ) ) ( not ( = ?auto_1412074 ?auto_1412070 ) ) ( not ( = ?auto_1412080 ?auto_1412070 ) ) ( ON ?auto_1412064 ?auto_1412063 ) ( ON ?auto_1412065 ?auto_1412064 ) ( ON ?auto_1412062 ?auto_1412065 ) ( ON ?auto_1412066 ?auto_1412062 ) ( ON ?auto_1412068 ?auto_1412066 ) ( ON ?auto_1412067 ?auto_1412068 ) ( ON ?auto_1412069 ?auto_1412067 ) ( ON ?auto_1412070 ?auto_1412069 ) ( not ( = ?auto_1412063 ?auto_1412064 ) ) ( not ( = ?auto_1412063 ?auto_1412065 ) ) ( not ( = ?auto_1412063 ?auto_1412062 ) ) ( not ( = ?auto_1412063 ?auto_1412066 ) ) ( not ( = ?auto_1412063 ?auto_1412068 ) ) ( not ( = ?auto_1412063 ?auto_1412067 ) ) ( not ( = ?auto_1412063 ?auto_1412069 ) ) ( not ( = ?auto_1412063 ?auto_1412070 ) ) ( not ( = ?auto_1412063 ?auto_1412071 ) ) ( not ( = ?auto_1412063 ?auto_1412072 ) ) ( not ( = ?auto_1412063 ?auto_1412073 ) ) ( not ( = ?auto_1412063 ?auto_1412074 ) ) ( not ( = ?auto_1412063 ?auto_1412080 ) ) ( not ( = ?auto_1412064 ?auto_1412065 ) ) ( not ( = ?auto_1412064 ?auto_1412062 ) ) ( not ( = ?auto_1412064 ?auto_1412066 ) ) ( not ( = ?auto_1412064 ?auto_1412068 ) ) ( not ( = ?auto_1412064 ?auto_1412067 ) ) ( not ( = ?auto_1412064 ?auto_1412069 ) ) ( not ( = ?auto_1412064 ?auto_1412070 ) ) ( not ( = ?auto_1412064 ?auto_1412071 ) ) ( not ( = ?auto_1412064 ?auto_1412072 ) ) ( not ( = ?auto_1412064 ?auto_1412073 ) ) ( not ( = ?auto_1412064 ?auto_1412074 ) ) ( not ( = ?auto_1412064 ?auto_1412080 ) ) ( not ( = ?auto_1412065 ?auto_1412062 ) ) ( not ( = ?auto_1412065 ?auto_1412066 ) ) ( not ( = ?auto_1412065 ?auto_1412068 ) ) ( not ( = ?auto_1412065 ?auto_1412067 ) ) ( not ( = ?auto_1412065 ?auto_1412069 ) ) ( not ( = ?auto_1412065 ?auto_1412070 ) ) ( not ( = ?auto_1412065 ?auto_1412071 ) ) ( not ( = ?auto_1412065 ?auto_1412072 ) ) ( not ( = ?auto_1412065 ?auto_1412073 ) ) ( not ( = ?auto_1412065 ?auto_1412074 ) ) ( not ( = ?auto_1412065 ?auto_1412080 ) ) ( not ( = ?auto_1412062 ?auto_1412066 ) ) ( not ( = ?auto_1412062 ?auto_1412068 ) ) ( not ( = ?auto_1412062 ?auto_1412067 ) ) ( not ( = ?auto_1412062 ?auto_1412069 ) ) ( not ( = ?auto_1412062 ?auto_1412070 ) ) ( not ( = ?auto_1412062 ?auto_1412071 ) ) ( not ( = ?auto_1412062 ?auto_1412072 ) ) ( not ( = ?auto_1412062 ?auto_1412073 ) ) ( not ( = ?auto_1412062 ?auto_1412074 ) ) ( not ( = ?auto_1412062 ?auto_1412080 ) ) ( not ( = ?auto_1412066 ?auto_1412068 ) ) ( not ( = ?auto_1412066 ?auto_1412067 ) ) ( not ( = ?auto_1412066 ?auto_1412069 ) ) ( not ( = ?auto_1412066 ?auto_1412070 ) ) ( not ( = ?auto_1412066 ?auto_1412071 ) ) ( not ( = ?auto_1412066 ?auto_1412072 ) ) ( not ( = ?auto_1412066 ?auto_1412073 ) ) ( not ( = ?auto_1412066 ?auto_1412074 ) ) ( not ( = ?auto_1412066 ?auto_1412080 ) ) ( not ( = ?auto_1412068 ?auto_1412067 ) ) ( not ( = ?auto_1412068 ?auto_1412069 ) ) ( not ( = ?auto_1412068 ?auto_1412070 ) ) ( not ( = ?auto_1412068 ?auto_1412071 ) ) ( not ( = ?auto_1412068 ?auto_1412072 ) ) ( not ( = ?auto_1412068 ?auto_1412073 ) ) ( not ( = ?auto_1412068 ?auto_1412074 ) ) ( not ( = ?auto_1412068 ?auto_1412080 ) ) ( not ( = ?auto_1412067 ?auto_1412069 ) ) ( not ( = ?auto_1412067 ?auto_1412070 ) ) ( not ( = ?auto_1412067 ?auto_1412071 ) ) ( not ( = ?auto_1412067 ?auto_1412072 ) ) ( not ( = ?auto_1412067 ?auto_1412073 ) ) ( not ( = ?auto_1412067 ?auto_1412074 ) ) ( not ( = ?auto_1412067 ?auto_1412080 ) ) ( not ( = ?auto_1412069 ?auto_1412070 ) ) ( not ( = ?auto_1412069 ?auto_1412071 ) ) ( not ( = ?auto_1412069 ?auto_1412072 ) ) ( not ( = ?auto_1412069 ?auto_1412073 ) ) ( not ( = ?auto_1412069 ?auto_1412074 ) ) ( not ( = ?auto_1412069 ?auto_1412080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1412071 ?auto_1412072 ?auto_1412073 )
      ( MAKE-11CRATE-VERIFY ?auto_1412063 ?auto_1412064 ?auto_1412065 ?auto_1412062 ?auto_1412066 ?auto_1412068 ?auto_1412067 ?auto_1412069 ?auto_1412070 ?auto_1412071 ?auto_1412072 ?auto_1412073 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1412082 - SURFACE
      ?auto_1412083 - SURFACE
      ?auto_1412084 - SURFACE
      ?auto_1412081 - SURFACE
      ?auto_1412085 - SURFACE
      ?auto_1412087 - SURFACE
      ?auto_1412086 - SURFACE
      ?auto_1412088 - SURFACE
      ?auto_1412089 - SURFACE
      ?auto_1412090 - SURFACE
      ?auto_1412091 - SURFACE
      ?auto_1412092 - SURFACE
      ?auto_1412093 - SURFACE
    )
    :vars
    (
      ?auto_1412099 - HOIST
      ?auto_1412098 - PLACE
      ?auto_1412095 - PLACE
      ?auto_1412096 - HOIST
      ?auto_1412094 - SURFACE
      ?auto_1412100 - SURFACE
      ?auto_1412097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1412099 ?auto_1412098 ) ( IS-CRATE ?auto_1412093 ) ( not ( = ?auto_1412092 ?auto_1412093 ) ) ( not ( = ?auto_1412091 ?auto_1412092 ) ) ( not ( = ?auto_1412091 ?auto_1412093 ) ) ( not ( = ?auto_1412095 ?auto_1412098 ) ) ( HOIST-AT ?auto_1412096 ?auto_1412095 ) ( not ( = ?auto_1412099 ?auto_1412096 ) ) ( SURFACE-AT ?auto_1412093 ?auto_1412095 ) ( ON ?auto_1412093 ?auto_1412094 ) ( CLEAR ?auto_1412093 ) ( not ( = ?auto_1412092 ?auto_1412094 ) ) ( not ( = ?auto_1412093 ?auto_1412094 ) ) ( not ( = ?auto_1412091 ?auto_1412094 ) ) ( IS-CRATE ?auto_1412092 ) ( AVAILABLE ?auto_1412096 ) ( SURFACE-AT ?auto_1412092 ?auto_1412095 ) ( ON ?auto_1412092 ?auto_1412100 ) ( CLEAR ?auto_1412092 ) ( not ( = ?auto_1412092 ?auto_1412100 ) ) ( not ( = ?auto_1412093 ?auto_1412100 ) ) ( not ( = ?auto_1412091 ?auto_1412100 ) ) ( not ( = ?auto_1412094 ?auto_1412100 ) ) ( TRUCK-AT ?auto_1412097 ?auto_1412098 ) ( SURFACE-AT ?auto_1412090 ?auto_1412098 ) ( CLEAR ?auto_1412090 ) ( LIFTING ?auto_1412099 ?auto_1412091 ) ( IS-CRATE ?auto_1412091 ) ( not ( = ?auto_1412090 ?auto_1412091 ) ) ( not ( = ?auto_1412092 ?auto_1412090 ) ) ( not ( = ?auto_1412093 ?auto_1412090 ) ) ( not ( = ?auto_1412094 ?auto_1412090 ) ) ( not ( = ?auto_1412100 ?auto_1412090 ) ) ( ON ?auto_1412083 ?auto_1412082 ) ( ON ?auto_1412084 ?auto_1412083 ) ( ON ?auto_1412081 ?auto_1412084 ) ( ON ?auto_1412085 ?auto_1412081 ) ( ON ?auto_1412087 ?auto_1412085 ) ( ON ?auto_1412086 ?auto_1412087 ) ( ON ?auto_1412088 ?auto_1412086 ) ( ON ?auto_1412089 ?auto_1412088 ) ( ON ?auto_1412090 ?auto_1412089 ) ( not ( = ?auto_1412082 ?auto_1412083 ) ) ( not ( = ?auto_1412082 ?auto_1412084 ) ) ( not ( = ?auto_1412082 ?auto_1412081 ) ) ( not ( = ?auto_1412082 ?auto_1412085 ) ) ( not ( = ?auto_1412082 ?auto_1412087 ) ) ( not ( = ?auto_1412082 ?auto_1412086 ) ) ( not ( = ?auto_1412082 ?auto_1412088 ) ) ( not ( = ?auto_1412082 ?auto_1412089 ) ) ( not ( = ?auto_1412082 ?auto_1412090 ) ) ( not ( = ?auto_1412082 ?auto_1412091 ) ) ( not ( = ?auto_1412082 ?auto_1412092 ) ) ( not ( = ?auto_1412082 ?auto_1412093 ) ) ( not ( = ?auto_1412082 ?auto_1412094 ) ) ( not ( = ?auto_1412082 ?auto_1412100 ) ) ( not ( = ?auto_1412083 ?auto_1412084 ) ) ( not ( = ?auto_1412083 ?auto_1412081 ) ) ( not ( = ?auto_1412083 ?auto_1412085 ) ) ( not ( = ?auto_1412083 ?auto_1412087 ) ) ( not ( = ?auto_1412083 ?auto_1412086 ) ) ( not ( = ?auto_1412083 ?auto_1412088 ) ) ( not ( = ?auto_1412083 ?auto_1412089 ) ) ( not ( = ?auto_1412083 ?auto_1412090 ) ) ( not ( = ?auto_1412083 ?auto_1412091 ) ) ( not ( = ?auto_1412083 ?auto_1412092 ) ) ( not ( = ?auto_1412083 ?auto_1412093 ) ) ( not ( = ?auto_1412083 ?auto_1412094 ) ) ( not ( = ?auto_1412083 ?auto_1412100 ) ) ( not ( = ?auto_1412084 ?auto_1412081 ) ) ( not ( = ?auto_1412084 ?auto_1412085 ) ) ( not ( = ?auto_1412084 ?auto_1412087 ) ) ( not ( = ?auto_1412084 ?auto_1412086 ) ) ( not ( = ?auto_1412084 ?auto_1412088 ) ) ( not ( = ?auto_1412084 ?auto_1412089 ) ) ( not ( = ?auto_1412084 ?auto_1412090 ) ) ( not ( = ?auto_1412084 ?auto_1412091 ) ) ( not ( = ?auto_1412084 ?auto_1412092 ) ) ( not ( = ?auto_1412084 ?auto_1412093 ) ) ( not ( = ?auto_1412084 ?auto_1412094 ) ) ( not ( = ?auto_1412084 ?auto_1412100 ) ) ( not ( = ?auto_1412081 ?auto_1412085 ) ) ( not ( = ?auto_1412081 ?auto_1412087 ) ) ( not ( = ?auto_1412081 ?auto_1412086 ) ) ( not ( = ?auto_1412081 ?auto_1412088 ) ) ( not ( = ?auto_1412081 ?auto_1412089 ) ) ( not ( = ?auto_1412081 ?auto_1412090 ) ) ( not ( = ?auto_1412081 ?auto_1412091 ) ) ( not ( = ?auto_1412081 ?auto_1412092 ) ) ( not ( = ?auto_1412081 ?auto_1412093 ) ) ( not ( = ?auto_1412081 ?auto_1412094 ) ) ( not ( = ?auto_1412081 ?auto_1412100 ) ) ( not ( = ?auto_1412085 ?auto_1412087 ) ) ( not ( = ?auto_1412085 ?auto_1412086 ) ) ( not ( = ?auto_1412085 ?auto_1412088 ) ) ( not ( = ?auto_1412085 ?auto_1412089 ) ) ( not ( = ?auto_1412085 ?auto_1412090 ) ) ( not ( = ?auto_1412085 ?auto_1412091 ) ) ( not ( = ?auto_1412085 ?auto_1412092 ) ) ( not ( = ?auto_1412085 ?auto_1412093 ) ) ( not ( = ?auto_1412085 ?auto_1412094 ) ) ( not ( = ?auto_1412085 ?auto_1412100 ) ) ( not ( = ?auto_1412087 ?auto_1412086 ) ) ( not ( = ?auto_1412087 ?auto_1412088 ) ) ( not ( = ?auto_1412087 ?auto_1412089 ) ) ( not ( = ?auto_1412087 ?auto_1412090 ) ) ( not ( = ?auto_1412087 ?auto_1412091 ) ) ( not ( = ?auto_1412087 ?auto_1412092 ) ) ( not ( = ?auto_1412087 ?auto_1412093 ) ) ( not ( = ?auto_1412087 ?auto_1412094 ) ) ( not ( = ?auto_1412087 ?auto_1412100 ) ) ( not ( = ?auto_1412086 ?auto_1412088 ) ) ( not ( = ?auto_1412086 ?auto_1412089 ) ) ( not ( = ?auto_1412086 ?auto_1412090 ) ) ( not ( = ?auto_1412086 ?auto_1412091 ) ) ( not ( = ?auto_1412086 ?auto_1412092 ) ) ( not ( = ?auto_1412086 ?auto_1412093 ) ) ( not ( = ?auto_1412086 ?auto_1412094 ) ) ( not ( = ?auto_1412086 ?auto_1412100 ) ) ( not ( = ?auto_1412088 ?auto_1412089 ) ) ( not ( = ?auto_1412088 ?auto_1412090 ) ) ( not ( = ?auto_1412088 ?auto_1412091 ) ) ( not ( = ?auto_1412088 ?auto_1412092 ) ) ( not ( = ?auto_1412088 ?auto_1412093 ) ) ( not ( = ?auto_1412088 ?auto_1412094 ) ) ( not ( = ?auto_1412088 ?auto_1412100 ) ) ( not ( = ?auto_1412089 ?auto_1412090 ) ) ( not ( = ?auto_1412089 ?auto_1412091 ) ) ( not ( = ?auto_1412089 ?auto_1412092 ) ) ( not ( = ?auto_1412089 ?auto_1412093 ) ) ( not ( = ?auto_1412089 ?auto_1412094 ) ) ( not ( = ?auto_1412089 ?auto_1412100 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1412091 ?auto_1412092 ?auto_1412093 )
      ( MAKE-12CRATE-VERIFY ?auto_1412082 ?auto_1412083 ?auto_1412084 ?auto_1412081 ?auto_1412085 ?auto_1412087 ?auto_1412086 ?auto_1412088 ?auto_1412089 ?auto_1412090 ?auto_1412091 ?auto_1412092 ?auto_1412093 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1412102 - SURFACE
      ?auto_1412103 - SURFACE
      ?auto_1412104 - SURFACE
      ?auto_1412101 - SURFACE
      ?auto_1412105 - SURFACE
      ?auto_1412107 - SURFACE
      ?auto_1412106 - SURFACE
      ?auto_1412108 - SURFACE
      ?auto_1412109 - SURFACE
      ?auto_1412110 - SURFACE
      ?auto_1412111 - SURFACE
      ?auto_1412112 - SURFACE
      ?auto_1412113 - SURFACE
      ?auto_1412114 - SURFACE
    )
    :vars
    (
      ?auto_1412120 - HOIST
      ?auto_1412119 - PLACE
      ?auto_1412116 - PLACE
      ?auto_1412117 - HOIST
      ?auto_1412115 - SURFACE
      ?auto_1412121 - SURFACE
      ?auto_1412118 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1412120 ?auto_1412119 ) ( IS-CRATE ?auto_1412114 ) ( not ( = ?auto_1412113 ?auto_1412114 ) ) ( not ( = ?auto_1412112 ?auto_1412113 ) ) ( not ( = ?auto_1412112 ?auto_1412114 ) ) ( not ( = ?auto_1412116 ?auto_1412119 ) ) ( HOIST-AT ?auto_1412117 ?auto_1412116 ) ( not ( = ?auto_1412120 ?auto_1412117 ) ) ( SURFACE-AT ?auto_1412114 ?auto_1412116 ) ( ON ?auto_1412114 ?auto_1412115 ) ( CLEAR ?auto_1412114 ) ( not ( = ?auto_1412113 ?auto_1412115 ) ) ( not ( = ?auto_1412114 ?auto_1412115 ) ) ( not ( = ?auto_1412112 ?auto_1412115 ) ) ( IS-CRATE ?auto_1412113 ) ( AVAILABLE ?auto_1412117 ) ( SURFACE-AT ?auto_1412113 ?auto_1412116 ) ( ON ?auto_1412113 ?auto_1412121 ) ( CLEAR ?auto_1412113 ) ( not ( = ?auto_1412113 ?auto_1412121 ) ) ( not ( = ?auto_1412114 ?auto_1412121 ) ) ( not ( = ?auto_1412112 ?auto_1412121 ) ) ( not ( = ?auto_1412115 ?auto_1412121 ) ) ( TRUCK-AT ?auto_1412118 ?auto_1412119 ) ( SURFACE-AT ?auto_1412111 ?auto_1412119 ) ( CLEAR ?auto_1412111 ) ( LIFTING ?auto_1412120 ?auto_1412112 ) ( IS-CRATE ?auto_1412112 ) ( not ( = ?auto_1412111 ?auto_1412112 ) ) ( not ( = ?auto_1412113 ?auto_1412111 ) ) ( not ( = ?auto_1412114 ?auto_1412111 ) ) ( not ( = ?auto_1412115 ?auto_1412111 ) ) ( not ( = ?auto_1412121 ?auto_1412111 ) ) ( ON ?auto_1412103 ?auto_1412102 ) ( ON ?auto_1412104 ?auto_1412103 ) ( ON ?auto_1412101 ?auto_1412104 ) ( ON ?auto_1412105 ?auto_1412101 ) ( ON ?auto_1412107 ?auto_1412105 ) ( ON ?auto_1412106 ?auto_1412107 ) ( ON ?auto_1412108 ?auto_1412106 ) ( ON ?auto_1412109 ?auto_1412108 ) ( ON ?auto_1412110 ?auto_1412109 ) ( ON ?auto_1412111 ?auto_1412110 ) ( not ( = ?auto_1412102 ?auto_1412103 ) ) ( not ( = ?auto_1412102 ?auto_1412104 ) ) ( not ( = ?auto_1412102 ?auto_1412101 ) ) ( not ( = ?auto_1412102 ?auto_1412105 ) ) ( not ( = ?auto_1412102 ?auto_1412107 ) ) ( not ( = ?auto_1412102 ?auto_1412106 ) ) ( not ( = ?auto_1412102 ?auto_1412108 ) ) ( not ( = ?auto_1412102 ?auto_1412109 ) ) ( not ( = ?auto_1412102 ?auto_1412110 ) ) ( not ( = ?auto_1412102 ?auto_1412111 ) ) ( not ( = ?auto_1412102 ?auto_1412112 ) ) ( not ( = ?auto_1412102 ?auto_1412113 ) ) ( not ( = ?auto_1412102 ?auto_1412114 ) ) ( not ( = ?auto_1412102 ?auto_1412115 ) ) ( not ( = ?auto_1412102 ?auto_1412121 ) ) ( not ( = ?auto_1412103 ?auto_1412104 ) ) ( not ( = ?auto_1412103 ?auto_1412101 ) ) ( not ( = ?auto_1412103 ?auto_1412105 ) ) ( not ( = ?auto_1412103 ?auto_1412107 ) ) ( not ( = ?auto_1412103 ?auto_1412106 ) ) ( not ( = ?auto_1412103 ?auto_1412108 ) ) ( not ( = ?auto_1412103 ?auto_1412109 ) ) ( not ( = ?auto_1412103 ?auto_1412110 ) ) ( not ( = ?auto_1412103 ?auto_1412111 ) ) ( not ( = ?auto_1412103 ?auto_1412112 ) ) ( not ( = ?auto_1412103 ?auto_1412113 ) ) ( not ( = ?auto_1412103 ?auto_1412114 ) ) ( not ( = ?auto_1412103 ?auto_1412115 ) ) ( not ( = ?auto_1412103 ?auto_1412121 ) ) ( not ( = ?auto_1412104 ?auto_1412101 ) ) ( not ( = ?auto_1412104 ?auto_1412105 ) ) ( not ( = ?auto_1412104 ?auto_1412107 ) ) ( not ( = ?auto_1412104 ?auto_1412106 ) ) ( not ( = ?auto_1412104 ?auto_1412108 ) ) ( not ( = ?auto_1412104 ?auto_1412109 ) ) ( not ( = ?auto_1412104 ?auto_1412110 ) ) ( not ( = ?auto_1412104 ?auto_1412111 ) ) ( not ( = ?auto_1412104 ?auto_1412112 ) ) ( not ( = ?auto_1412104 ?auto_1412113 ) ) ( not ( = ?auto_1412104 ?auto_1412114 ) ) ( not ( = ?auto_1412104 ?auto_1412115 ) ) ( not ( = ?auto_1412104 ?auto_1412121 ) ) ( not ( = ?auto_1412101 ?auto_1412105 ) ) ( not ( = ?auto_1412101 ?auto_1412107 ) ) ( not ( = ?auto_1412101 ?auto_1412106 ) ) ( not ( = ?auto_1412101 ?auto_1412108 ) ) ( not ( = ?auto_1412101 ?auto_1412109 ) ) ( not ( = ?auto_1412101 ?auto_1412110 ) ) ( not ( = ?auto_1412101 ?auto_1412111 ) ) ( not ( = ?auto_1412101 ?auto_1412112 ) ) ( not ( = ?auto_1412101 ?auto_1412113 ) ) ( not ( = ?auto_1412101 ?auto_1412114 ) ) ( not ( = ?auto_1412101 ?auto_1412115 ) ) ( not ( = ?auto_1412101 ?auto_1412121 ) ) ( not ( = ?auto_1412105 ?auto_1412107 ) ) ( not ( = ?auto_1412105 ?auto_1412106 ) ) ( not ( = ?auto_1412105 ?auto_1412108 ) ) ( not ( = ?auto_1412105 ?auto_1412109 ) ) ( not ( = ?auto_1412105 ?auto_1412110 ) ) ( not ( = ?auto_1412105 ?auto_1412111 ) ) ( not ( = ?auto_1412105 ?auto_1412112 ) ) ( not ( = ?auto_1412105 ?auto_1412113 ) ) ( not ( = ?auto_1412105 ?auto_1412114 ) ) ( not ( = ?auto_1412105 ?auto_1412115 ) ) ( not ( = ?auto_1412105 ?auto_1412121 ) ) ( not ( = ?auto_1412107 ?auto_1412106 ) ) ( not ( = ?auto_1412107 ?auto_1412108 ) ) ( not ( = ?auto_1412107 ?auto_1412109 ) ) ( not ( = ?auto_1412107 ?auto_1412110 ) ) ( not ( = ?auto_1412107 ?auto_1412111 ) ) ( not ( = ?auto_1412107 ?auto_1412112 ) ) ( not ( = ?auto_1412107 ?auto_1412113 ) ) ( not ( = ?auto_1412107 ?auto_1412114 ) ) ( not ( = ?auto_1412107 ?auto_1412115 ) ) ( not ( = ?auto_1412107 ?auto_1412121 ) ) ( not ( = ?auto_1412106 ?auto_1412108 ) ) ( not ( = ?auto_1412106 ?auto_1412109 ) ) ( not ( = ?auto_1412106 ?auto_1412110 ) ) ( not ( = ?auto_1412106 ?auto_1412111 ) ) ( not ( = ?auto_1412106 ?auto_1412112 ) ) ( not ( = ?auto_1412106 ?auto_1412113 ) ) ( not ( = ?auto_1412106 ?auto_1412114 ) ) ( not ( = ?auto_1412106 ?auto_1412115 ) ) ( not ( = ?auto_1412106 ?auto_1412121 ) ) ( not ( = ?auto_1412108 ?auto_1412109 ) ) ( not ( = ?auto_1412108 ?auto_1412110 ) ) ( not ( = ?auto_1412108 ?auto_1412111 ) ) ( not ( = ?auto_1412108 ?auto_1412112 ) ) ( not ( = ?auto_1412108 ?auto_1412113 ) ) ( not ( = ?auto_1412108 ?auto_1412114 ) ) ( not ( = ?auto_1412108 ?auto_1412115 ) ) ( not ( = ?auto_1412108 ?auto_1412121 ) ) ( not ( = ?auto_1412109 ?auto_1412110 ) ) ( not ( = ?auto_1412109 ?auto_1412111 ) ) ( not ( = ?auto_1412109 ?auto_1412112 ) ) ( not ( = ?auto_1412109 ?auto_1412113 ) ) ( not ( = ?auto_1412109 ?auto_1412114 ) ) ( not ( = ?auto_1412109 ?auto_1412115 ) ) ( not ( = ?auto_1412109 ?auto_1412121 ) ) ( not ( = ?auto_1412110 ?auto_1412111 ) ) ( not ( = ?auto_1412110 ?auto_1412112 ) ) ( not ( = ?auto_1412110 ?auto_1412113 ) ) ( not ( = ?auto_1412110 ?auto_1412114 ) ) ( not ( = ?auto_1412110 ?auto_1412115 ) ) ( not ( = ?auto_1412110 ?auto_1412121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1412112 ?auto_1412113 ?auto_1412114 )
      ( MAKE-13CRATE-VERIFY ?auto_1412102 ?auto_1412103 ?auto_1412104 ?auto_1412101 ?auto_1412105 ?auto_1412107 ?auto_1412106 ?auto_1412108 ?auto_1412109 ?auto_1412110 ?auto_1412111 ?auto_1412112 ?auto_1412113 ?auto_1412114 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1412123 - SURFACE
      ?auto_1412124 - SURFACE
      ?auto_1412125 - SURFACE
      ?auto_1412122 - SURFACE
      ?auto_1412126 - SURFACE
      ?auto_1412128 - SURFACE
      ?auto_1412127 - SURFACE
      ?auto_1412129 - SURFACE
      ?auto_1412130 - SURFACE
      ?auto_1412131 - SURFACE
      ?auto_1412132 - SURFACE
      ?auto_1412133 - SURFACE
      ?auto_1412134 - SURFACE
      ?auto_1412135 - SURFACE
      ?auto_1412136 - SURFACE
    )
    :vars
    (
      ?auto_1412142 - HOIST
      ?auto_1412141 - PLACE
      ?auto_1412138 - PLACE
      ?auto_1412139 - HOIST
      ?auto_1412137 - SURFACE
      ?auto_1412143 - SURFACE
      ?auto_1412140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1412142 ?auto_1412141 ) ( IS-CRATE ?auto_1412136 ) ( not ( = ?auto_1412135 ?auto_1412136 ) ) ( not ( = ?auto_1412134 ?auto_1412135 ) ) ( not ( = ?auto_1412134 ?auto_1412136 ) ) ( not ( = ?auto_1412138 ?auto_1412141 ) ) ( HOIST-AT ?auto_1412139 ?auto_1412138 ) ( not ( = ?auto_1412142 ?auto_1412139 ) ) ( SURFACE-AT ?auto_1412136 ?auto_1412138 ) ( ON ?auto_1412136 ?auto_1412137 ) ( CLEAR ?auto_1412136 ) ( not ( = ?auto_1412135 ?auto_1412137 ) ) ( not ( = ?auto_1412136 ?auto_1412137 ) ) ( not ( = ?auto_1412134 ?auto_1412137 ) ) ( IS-CRATE ?auto_1412135 ) ( AVAILABLE ?auto_1412139 ) ( SURFACE-AT ?auto_1412135 ?auto_1412138 ) ( ON ?auto_1412135 ?auto_1412143 ) ( CLEAR ?auto_1412135 ) ( not ( = ?auto_1412135 ?auto_1412143 ) ) ( not ( = ?auto_1412136 ?auto_1412143 ) ) ( not ( = ?auto_1412134 ?auto_1412143 ) ) ( not ( = ?auto_1412137 ?auto_1412143 ) ) ( TRUCK-AT ?auto_1412140 ?auto_1412141 ) ( SURFACE-AT ?auto_1412133 ?auto_1412141 ) ( CLEAR ?auto_1412133 ) ( LIFTING ?auto_1412142 ?auto_1412134 ) ( IS-CRATE ?auto_1412134 ) ( not ( = ?auto_1412133 ?auto_1412134 ) ) ( not ( = ?auto_1412135 ?auto_1412133 ) ) ( not ( = ?auto_1412136 ?auto_1412133 ) ) ( not ( = ?auto_1412137 ?auto_1412133 ) ) ( not ( = ?auto_1412143 ?auto_1412133 ) ) ( ON ?auto_1412124 ?auto_1412123 ) ( ON ?auto_1412125 ?auto_1412124 ) ( ON ?auto_1412122 ?auto_1412125 ) ( ON ?auto_1412126 ?auto_1412122 ) ( ON ?auto_1412128 ?auto_1412126 ) ( ON ?auto_1412127 ?auto_1412128 ) ( ON ?auto_1412129 ?auto_1412127 ) ( ON ?auto_1412130 ?auto_1412129 ) ( ON ?auto_1412131 ?auto_1412130 ) ( ON ?auto_1412132 ?auto_1412131 ) ( ON ?auto_1412133 ?auto_1412132 ) ( not ( = ?auto_1412123 ?auto_1412124 ) ) ( not ( = ?auto_1412123 ?auto_1412125 ) ) ( not ( = ?auto_1412123 ?auto_1412122 ) ) ( not ( = ?auto_1412123 ?auto_1412126 ) ) ( not ( = ?auto_1412123 ?auto_1412128 ) ) ( not ( = ?auto_1412123 ?auto_1412127 ) ) ( not ( = ?auto_1412123 ?auto_1412129 ) ) ( not ( = ?auto_1412123 ?auto_1412130 ) ) ( not ( = ?auto_1412123 ?auto_1412131 ) ) ( not ( = ?auto_1412123 ?auto_1412132 ) ) ( not ( = ?auto_1412123 ?auto_1412133 ) ) ( not ( = ?auto_1412123 ?auto_1412134 ) ) ( not ( = ?auto_1412123 ?auto_1412135 ) ) ( not ( = ?auto_1412123 ?auto_1412136 ) ) ( not ( = ?auto_1412123 ?auto_1412137 ) ) ( not ( = ?auto_1412123 ?auto_1412143 ) ) ( not ( = ?auto_1412124 ?auto_1412125 ) ) ( not ( = ?auto_1412124 ?auto_1412122 ) ) ( not ( = ?auto_1412124 ?auto_1412126 ) ) ( not ( = ?auto_1412124 ?auto_1412128 ) ) ( not ( = ?auto_1412124 ?auto_1412127 ) ) ( not ( = ?auto_1412124 ?auto_1412129 ) ) ( not ( = ?auto_1412124 ?auto_1412130 ) ) ( not ( = ?auto_1412124 ?auto_1412131 ) ) ( not ( = ?auto_1412124 ?auto_1412132 ) ) ( not ( = ?auto_1412124 ?auto_1412133 ) ) ( not ( = ?auto_1412124 ?auto_1412134 ) ) ( not ( = ?auto_1412124 ?auto_1412135 ) ) ( not ( = ?auto_1412124 ?auto_1412136 ) ) ( not ( = ?auto_1412124 ?auto_1412137 ) ) ( not ( = ?auto_1412124 ?auto_1412143 ) ) ( not ( = ?auto_1412125 ?auto_1412122 ) ) ( not ( = ?auto_1412125 ?auto_1412126 ) ) ( not ( = ?auto_1412125 ?auto_1412128 ) ) ( not ( = ?auto_1412125 ?auto_1412127 ) ) ( not ( = ?auto_1412125 ?auto_1412129 ) ) ( not ( = ?auto_1412125 ?auto_1412130 ) ) ( not ( = ?auto_1412125 ?auto_1412131 ) ) ( not ( = ?auto_1412125 ?auto_1412132 ) ) ( not ( = ?auto_1412125 ?auto_1412133 ) ) ( not ( = ?auto_1412125 ?auto_1412134 ) ) ( not ( = ?auto_1412125 ?auto_1412135 ) ) ( not ( = ?auto_1412125 ?auto_1412136 ) ) ( not ( = ?auto_1412125 ?auto_1412137 ) ) ( not ( = ?auto_1412125 ?auto_1412143 ) ) ( not ( = ?auto_1412122 ?auto_1412126 ) ) ( not ( = ?auto_1412122 ?auto_1412128 ) ) ( not ( = ?auto_1412122 ?auto_1412127 ) ) ( not ( = ?auto_1412122 ?auto_1412129 ) ) ( not ( = ?auto_1412122 ?auto_1412130 ) ) ( not ( = ?auto_1412122 ?auto_1412131 ) ) ( not ( = ?auto_1412122 ?auto_1412132 ) ) ( not ( = ?auto_1412122 ?auto_1412133 ) ) ( not ( = ?auto_1412122 ?auto_1412134 ) ) ( not ( = ?auto_1412122 ?auto_1412135 ) ) ( not ( = ?auto_1412122 ?auto_1412136 ) ) ( not ( = ?auto_1412122 ?auto_1412137 ) ) ( not ( = ?auto_1412122 ?auto_1412143 ) ) ( not ( = ?auto_1412126 ?auto_1412128 ) ) ( not ( = ?auto_1412126 ?auto_1412127 ) ) ( not ( = ?auto_1412126 ?auto_1412129 ) ) ( not ( = ?auto_1412126 ?auto_1412130 ) ) ( not ( = ?auto_1412126 ?auto_1412131 ) ) ( not ( = ?auto_1412126 ?auto_1412132 ) ) ( not ( = ?auto_1412126 ?auto_1412133 ) ) ( not ( = ?auto_1412126 ?auto_1412134 ) ) ( not ( = ?auto_1412126 ?auto_1412135 ) ) ( not ( = ?auto_1412126 ?auto_1412136 ) ) ( not ( = ?auto_1412126 ?auto_1412137 ) ) ( not ( = ?auto_1412126 ?auto_1412143 ) ) ( not ( = ?auto_1412128 ?auto_1412127 ) ) ( not ( = ?auto_1412128 ?auto_1412129 ) ) ( not ( = ?auto_1412128 ?auto_1412130 ) ) ( not ( = ?auto_1412128 ?auto_1412131 ) ) ( not ( = ?auto_1412128 ?auto_1412132 ) ) ( not ( = ?auto_1412128 ?auto_1412133 ) ) ( not ( = ?auto_1412128 ?auto_1412134 ) ) ( not ( = ?auto_1412128 ?auto_1412135 ) ) ( not ( = ?auto_1412128 ?auto_1412136 ) ) ( not ( = ?auto_1412128 ?auto_1412137 ) ) ( not ( = ?auto_1412128 ?auto_1412143 ) ) ( not ( = ?auto_1412127 ?auto_1412129 ) ) ( not ( = ?auto_1412127 ?auto_1412130 ) ) ( not ( = ?auto_1412127 ?auto_1412131 ) ) ( not ( = ?auto_1412127 ?auto_1412132 ) ) ( not ( = ?auto_1412127 ?auto_1412133 ) ) ( not ( = ?auto_1412127 ?auto_1412134 ) ) ( not ( = ?auto_1412127 ?auto_1412135 ) ) ( not ( = ?auto_1412127 ?auto_1412136 ) ) ( not ( = ?auto_1412127 ?auto_1412137 ) ) ( not ( = ?auto_1412127 ?auto_1412143 ) ) ( not ( = ?auto_1412129 ?auto_1412130 ) ) ( not ( = ?auto_1412129 ?auto_1412131 ) ) ( not ( = ?auto_1412129 ?auto_1412132 ) ) ( not ( = ?auto_1412129 ?auto_1412133 ) ) ( not ( = ?auto_1412129 ?auto_1412134 ) ) ( not ( = ?auto_1412129 ?auto_1412135 ) ) ( not ( = ?auto_1412129 ?auto_1412136 ) ) ( not ( = ?auto_1412129 ?auto_1412137 ) ) ( not ( = ?auto_1412129 ?auto_1412143 ) ) ( not ( = ?auto_1412130 ?auto_1412131 ) ) ( not ( = ?auto_1412130 ?auto_1412132 ) ) ( not ( = ?auto_1412130 ?auto_1412133 ) ) ( not ( = ?auto_1412130 ?auto_1412134 ) ) ( not ( = ?auto_1412130 ?auto_1412135 ) ) ( not ( = ?auto_1412130 ?auto_1412136 ) ) ( not ( = ?auto_1412130 ?auto_1412137 ) ) ( not ( = ?auto_1412130 ?auto_1412143 ) ) ( not ( = ?auto_1412131 ?auto_1412132 ) ) ( not ( = ?auto_1412131 ?auto_1412133 ) ) ( not ( = ?auto_1412131 ?auto_1412134 ) ) ( not ( = ?auto_1412131 ?auto_1412135 ) ) ( not ( = ?auto_1412131 ?auto_1412136 ) ) ( not ( = ?auto_1412131 ?auto_1412137 ) ) ( not ( = ?auto_1412131 ?auto_1412143 ) ) ( not ( = ?auto_1412132 ?auto_1412133 ) ) ( not ( = ?auto_1412132 ?auto_1412134 ) ) ( not ( = ?auto_1412132 ?auto_1412135 ) ) ( not ( = ?auto_1412132 ?auto_1412136 ) ) ( not ( = ?auto_1412132 ?auto_1412137 ) ) ( not ( = ?auto_1412132 ?auto_1412143 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1412134 ?auto_1412135 ?auto_1412136 )
      ( MAKE-14CRATE-VERIFY ?auto_1412123 ?auto_1412124 ?auto_1412125 ?auto_1412122 ?auto_1412126 ?auto_1412128 ?auto_1412127 ?auto_1412129 ?auto_1412130 ?auto_1412131 ?auto_1412132 ?auto_1412133 ?auto_1412134 ?auto_1412135 ?auto_1412136 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1413835 - SURFACE
      ?auto_1413836 - SURFACE
    )
    :vars
    (
      ?auto_1413844 - HOIST
      ?auto_1413843 - PLACE
      ?auto_1413840 - SURFACE
      ?auto_1413842 - PLACE
      ?auto_1413839 - HOIST
      ?auto_1413841 - SURFACE
      ?auto_1413837 - TRUCK
      ?auto_1413838 - SURFACE
      ?auto_1413845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1413844 ?auto_1413843 ) ( IS-CRATE ?auto_1413836 ) ( not ( = ?auto_1413835 ?auto_1413836 ) ) ( not ( = ?auto_1413840 ?auto_1413835 ) ) ( not ( = ?auto_1413840 ?auto_1413836 ) ) ( not ( = ?auto_1413842 ?auto_1413843 ) ) ( HOIST-AT ?auto_1413839 ?auto_1413842 ) ( not ( = ?auto_1413844 ?auto_1413839 ) ) ( SURFACE-AT ?auto_1413836 ?auto_1413842 ) ( ON ?auto_1413836 ?auto_1413841 ) ( CLEAR ?auto_1413836 ) ( not ( = ?auto_1413835 ?auto_1413841 ) ) ( not ( = ?auto_1413836 ?auto_1413841 ) ) ( not ( = ?auto_1413840 ?auto_1413841 ) ) ( SURFACE-AT ?auto_1413840 ?auto_1413843 ) ( CLEAR ?auto_1413840 ) ( IS-CRATE ?auto_1413835 ) ( AVAILABLE ?auto_1413844 ) ( TRUCK-AT ?auto_1413837 ?auto_1413842 ) ( SURFACE-AT ?auto_1413835 ?auto_1413842 ) ( ON ?auto_1413835 ?auto_1413838 ) ( CLEAR ?auto_1413835 ) ( not ( = ?auto_1413835 ?auto_1413838 ) ) ( not ( = ?auto_1413836 ?auto_1413838 ) ) ( not ( = ?auto_1413840 ?auto_1413838 ) ) ( not ( = ?auto_1413841 ?auto_1413838 ) ) ( LIFTING ?auto_1413839 ?auto_1413845 ) ( IS-CRATE ?auto_1413845 ) ( not ( = ?auto_1413835 ?auto_1413845 ) ) ( not ( = ?auto_1413836 ?auto_1413845 ) ) ( not ( = ?auto_1413840 ?auto_1413845 ) ) ( not ( = ?auto_1413841 ?auto_1413845 ) ) ( not ( = ?auto_1413838 ?auto_1413845 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1413839 ?auto_1413845 ?auto_1413837 ?auto_1413842 )
      ( MAKE-2CRATE ?auto_1413840 ?auto_1413835 ?auto_1413836 )
      ( MAKE-1CRATE-VERIFY ?auto_1413835 ?auto_1413836 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1413846 - SURFACE
      ?auto_1413847 - SURFACE
      ?auto_1413848 - SURFACE
    )
    :vars
    (
      ?auto_1413849 - HOIST
      ?auto_1413852 - PLACE
      ?auto_1413850 - PLACE
      ?auto_1413856 - HOIST
      ?auto_1413853 - SURFACE
      ?auto_1413854 - TRUCK
      ?auto_1413855 - SURFACE
      ?auto_1413851 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1413849 ?auto_1413852 ) ( IS-CRATE ?auto_1413848 ) ( not ( = ?auto_1413847 ?auto_1413848 ) ) ( not ( = ?auto_1413846 ?auto_1413847 ) ) ( not ( = ?auto_1413846 ?auto_1413848 ) ) ( not ( = ?auto_1413850 ?auto_1413852 ) ) ( HOIST-AT ?auto_1413856 ?auto_1413850 ) ( not ( = ?auto_1413849 ?auto_1413856 ) ) ( SURFACE-AT ?auto_1413848 ?auto_1413850 ) ( ON ?auto_1413848 ?auto_1413853 ) ( CLEAR ?auto_1413848 ) ( not ( = ?auto_1413847 ?auto_1413853 ) ) ( not ( = ?auto_1413848 ?auto_1413853 ) ) ( not ( = ?auto_1413846 ?auto_1413853 ) ) ( SURFACE-AT ?auto_1413846 ?auto_1413852 ) ( CLEAR ?auto_1413846 ) ( IS-CRATE ?auto_1413847 ) ( AVAILABLE ?auto_1413849 ) ( TRUCK-AT ?auto_1413854 ?auto_1413850 ) ( SURFACE-AT ?auto_1413847 ?auto_1413850 ) ( ON ?auto_1413847 ?auto_1413855 ) ( CLEAR ?auto_1413847 ) ( not ( = ?auto_1413847 ?auto_1413855 ) ) ( not ( = ?auto_1413848 ?auto_1413855 ) ) ( not ( = ?auto_1413846 ?auto_1413855 ) ) ( not ( = ?auto_1413853 ?auto_1413855 ) ) ( LIFTING ?auto_1413856 ?auto_1413851 ) ( IS-CRATE ?auto_1413851 ) ( not ( = ?auto_1413847 ?auto_1413851 ) ) ( not ( = ?auto_1413848 ?auto_1413851 ) ) ( not ( = ?auto_1413846 ?auto_1413851 ) ) ( not ( = ?auto_1413853 ?auto_1413851 ) ) ( not ( = ?auto_1413855 ?auto_1413851 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1413847 ?auto_1413848 )
      ( MAKE-2CRATE-VERIFY ?auto_1413846 ?auto_1413847 ?auto_1413848 ) )
  )

)

