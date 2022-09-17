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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911537 - SURFACE
      ?auto_911538 - SURFACE
    )
    :vars
    (
      ?auto_911539 - HOIST
      ?auto_911540 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911539 ?auto_911540 ) ( SURFACE-AT ?auto_911537 ?auto_911540 ) ( CLEAR ?auto_911537 ) ( LIFTING ?auto_911539 ?auto_911538 ) ( IS-CRATE ?auto_911538 ) ( not ( = ?auto_911537 ?auto_911538 ) ) )
    :subtasks
    ( ( !DROP ?auto_911539 ?auto_911538 ?auto_911537 ?auto_911540 )
      ( MAKE-1CRATE-VERIFY ?auto_911537 ?auto_911538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911541 - SURFACE
      ?auto_911542 - SURFACE
    )
    :vars
    (
      ?auto_911544 - HOIST
      ?auto_911543 - PLACE
      ?auto_911545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911544 ?auto_911543 ) ( SURFACE-AT ?auto_911541 ?auto_911543 ) ( CLEAR ?auto_911541 ) ( IS-CRATE ?auto_911542 ) ( not ( = ?auto_911541 ?auto_911542 ) ) ( TRUCK-AT ?auto_911545 ?auto_911543 ) ( AVAILABLE ?auto_911544 ) ( IN ?auto_911542 ?auto_911545 ) )
    :subtasks
    ( ( !UNLOAD ?auto_911544 ?auto_911542 ?auto_911545 ?auto_911543 )
      ( MAKE-1CRATE ?auto_911541 ?auto_911542 )
      ( MAKE-1CRATE-VERIFY ?auto_911541 ?auto_911542 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911546 - SURFACE
      ?auto_911547 - SURFACE
    )
    :vars
    (
      ?auto_911548 - HOIST
      ?auto_911549 - PLACE
      ?auto_911550 - TRUCK
      ?auto_911551 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911548 ?auto_911549 ) ( SURFACE-AT ?auto_911546 ?auto_911549 ) ( CLEAR ?auto_911546 ) ( IS-CRATE ?auto_911547 ) ( not ( = ?auto_911546 ?auto_911547 ) ) ( AVAILABLE ?auto_911548 ) ( IN ?auto_911547 ?auto_911550 ) ( TRUCK-AT ?auto_911550 ?auto_911551 ) ( not ( = ?auto_911551 ?auto_911549 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_911550 ?auto_911551 ?auto_911549 )
      ( MAKE-1CRATE ?auto_911546 ?auto_911547 )
      ( MAKE-1CRATE-VERIFY ?auto_911546 ?auto_911547 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911552 - SURFACE
      ?auto_911553 - SURFACE
    )
    :vars
    (
      ?auto_911557 - HOIST
      ?auto_911554 - PLACE
      ?auto_911556 - TRUCK
      ?auto_911555 - PLACE
      ?auto_911558 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_911557 ?auto_911554 ) ( SURFACE-AT ?auto_911552 ?auto_911554 ) ( CLEAR ?auto_911552 ) ( IS-CRATE ?auto_911553 ) ( not ( = ?auto_911552 ?auto_911553 ) ) ( AVAILABLE ?auto_911557 ) ( TRUCK-AT ?auto_911556 ?auto_911555 ) ( not ( = ?auto_911555 ?auto_911554 ) ) ( HOIST-AT ?auto_911558 ?auto_911555 ) ( LIFTING ?auto_911558 ?auto_911553 ) ( not ( = ?auto_911557 ?auto_911558 ) ) )
    :subtasks
    ( ( !LOAD ?auto_911558 ?auto_911553 ?auto_911556 ?auto_911555 )
      ( MAKE-1CRATE ?auto_911552 ?auto_911553 )
      ( MAKE-1CRATE-VERIFY ?auto_911552 ?auto_911553 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911559 - SURFACE
      ?auto_911560 - SURFACE
    )
    :vars
    (
      ?auto_911565 - HOIST
      ?auto_911563 - PLACE
      ?auto_911564 - TRUCK
      ?auto_911561 - PLACE
      ?auto_911562 - HOIST
      ?auto_911566 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911565 ?auto_911563 ) ( SURFACE-AT ?auto_911559 ?auto_911563 ) ( CLEAR ?auto_911559 ) ( IS-CRATE ?auto_911560 ) ( not ( = ?auto_911559 ?auto_911560 ) ) ( AVAILABLE ?auto_911565 ) ( TRUCK-AT ?auto_911564 ?auto_911561 ) ( not ( = ?auto_911561 ?auto_911563 ) ) ( HOIST-AT ?auto_911562 ?auto_911561 ) ( not ( = ?auto_911565 ?auto_911562 ) ) ( AVAILABLE ?auto_911562 ) ( SURFACE-AT ?auto_911560 ?auto_911561 ) ( ON ?auto_911560 ?auto_911566 ) ( CLEAR ?auto_911560 ) ( not ( = ?auto_911559 ?auto_911566 ) ) ( not ( = ?auto_911560 ?auto_911566 ) ) )
    :subtasks
    ( ( !LIFT ?auto_911562 ?auto_911560 ?auto_911566 ?auto_911561 )
      ( MAKE-1CRATE ?auto_911559 ?auto_911560 )
      ( MAKE-1CRATE-VERIFY ?auto_911559 ?auto_911560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911567 - SURFACE
      ?auto_911568 - SURFACE
    )
    :vars
    (
      ?auto_911569 - HOIST
      ?auto_911573 - PLACE
      ?auto_911572 - PLACE
      ?auto_911574 - HOIST
      ?auto_911570 - SURFACE
      ?auto_911571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911569 ?auto_911573 ) ( SURFACE-AT ?auto_911567 ?auto_911573 ) ( CLEAR ?auto_911567 ) ( IS-CRATE ?auto_911568 ) ( not ( = ?auto_911567 ?auto_911568 ) ) ( AVAILABLE ?auto_911569 ) ( not ( = ?auto_911572 ?auto_911573 ) ) ( HOIST-AT ?auto_911574 ?auto_911572 ) ( not ( = ?auto_911569 ?auto_911574 ) ) ( AVAILABLE ?auto_911574 ) ( SURFACE-AT ?auto_911568 ?auto_911572 ) ( ON ?auto_911568 ?auto_911570 ) ( CLEAR ?auto_911568 ) ( not ( = ?auto_911567 ?auto_911570 ) ) ( not ( = ?auto_911568 ?auto_911570 ) ) ( TRUCK-AT ?auto_911571 ?auto_911573 ) )
    :subtasks
    ( ( !DRIVE ?auto_911571 ?auto_911573 ?auto_911572 )
      ( MAKE-1CRATE ?auto_911567 ?auto_911568 )
      ( MAKE-1CRATE-VERIFY ?auto_911567 ?auto_911568 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911584 - SURFACE
      ?auto_911585 - SURFACE
      ?auto_911586 - SURFACE
    )
    :vars
    (
      ?auto_911588 - HOIST
      ?auto_911587 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911588 ?auto_911587 ) ( SURFACE-AT ?auto_911585 ?auto_911587 ) ( CLEAR ?auto_911585 ) ( LIFTING ?auto_911588 ?auto_911586 ) ( IS-CRATE ?auto_911586 ) ( not ( = ?auto_911585 ?auto_911586 ) ) ( ON ?auto_911585 ?auto_911584 ) ( not ( = ?auto_911584 ?auto_911585 ) ) ( not ( = ?auto_911584 ?auto_911586 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911585 ?auto_911586 )
      ( MAKE-2CRATE-VERIFY ?auto_911584 ?auto_911585 ?auto_911586 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911594 - SURFACE
      ?auto_911595 - SURFACE
      ?auto_911596 - SURFACE
    )
    :vars
    (
      ?auto_911598 - HOIST
      ?auto_911597 - PLACE
      ?auto_911599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911598 ?auto_911597 ) ( SURFACE-AT ?auto_911595 ?auto_911597 ) ( CLEAR ?auto_911595 ) ( IS-CRATE ?auto_911596 ) ( not ( = ?auto_911595 ?auto_911596 ) ) ( TRUCK-AT ?auto_911599 ?auto_911597 ) ( AVAILABLE ?auto_911598 ) ( IN ?auto_911596 ?auto_911599 ) ( ON ?auto_911595 ?auto_911594 ) ( not ( = ?auto_911594 ?auto_911595 ) ) ( not ( = ?auto_911594 ?auto_911596 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911595 ?auto_911596 )
      ( MAKE-2CRATE-VERIFY ?auto_911594 ?auto_911595 ?auto_911596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911600 - SURFACE
      ?auto_911601 - SURFACE
    )
    :vars
    (
      ?auto_911604 - HOIST
      ?auto_911603 - PLACE
      ?auto_911605 - TRUCK
      ?auto_911602 - SURFACE
      ?auto_911606 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911604 ?auto_911603 ) ( SURFACE-AT ?auto_911600 ?auto_911603 ) ( CLEAR ?auto_911600 ) ( IS-CRATE ?auto_911601 ) ( not ( = ?auto_911600 ?auto_911601 ) ) ( AVAILABLE ?auto_911604 ) ( IN ?auto_911601 ?auto_911605 ) ( ON ?auto_911600 ?auto_911602 ) ( not ( = ?auto_911602 ?auto_911600 ) ) ( not ( = ?auto_911602 ?auto_911601 ) ) ( TRUCK-AT ?auto_911605 ?auto_911606 ) ( not ( = ?auto_911606 ?auto_911603 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_911605 ?auto_911606 ?auto_911603 )
      ( MAKE-2CRATE ?auto_911602 ?auto_911600 ?auto_911601 )
      ( MAKE-1CRATE-VERIFY ?auto_911600 ?auto_911601 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911607 - SURFACE
      ?auto_911608 - SURFACE
      ?auto_911609 - SURFACE
    )
    :vars
    (
      ?auto_911613 - HOIST
      ?auto_911610 - PLACE
      ?auto_911612 - TRUCK
      ?auto_911611 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911613 ?auto_911610 ) ( SURFACE-AT ?auto_911608 ?auto_911610 ) ( CLEAR ?auto_911608 ) ( IS-CRATE ?auto_911609 ) ( not ( = ?auto_911608 ?auto_911609 ) ) ( AVAILABLE ?auto_911613 ) ( IN ?auto_911609 ?auto_911612 ) ( ON ?auto_911608 ?auto_911607 ) ( not ( = ?auto_911607 ?auto_911608 ) ) ( not ( = ?auto_911607 ?auto_911609 ) ) ( TRUCK-AT ?auto_911612 ?auto_911611 ) ( not ( = ?auto_911611 ?auto_911610 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911608 ?auto_911609 )
      ( MAKE-2CRATE-VERIFY ?auto_911607 ?auto_911608 ?auto_911609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911614 - SURFACE
      ?auto_911615 - SURFACE
    )
    :vars
    (
      ?auto_911619 - HOIST
      ?auto_911618 - PLACE
      ?auto_911616 - SURFACE
      ?auto_911617 - TRUCK
      ?auto_911620 - PLACE
      ?auto_911621 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_911619 ?auto_911618 ) ( SURFACE-AT ?auto_911614 ?auto_911618 ) ( CLEAR ?auto_911614 ) ( IS-CRATE ?auto_911615 ) ( not ( = ?auto_911614 ?auto_911615 ) ) ( AVAILABLE ?auto_911619 ) ( ON ?auto_911614 ?auto_911616 ) ( not ( = ?auto_911616 ?auto_911614 ) ) ( not ( = ?auto_911616 ?auto_911615 ) ) ( TRUCK-AT ?auto_911617 ?auto_911620 ) ( not ( = ?auto_911620 ?auto_911618 ) ) ( HOIST-AT ?auto_911621 ?auto_911620 ) ( LIFTING ?auto_911621 ?auto_911615 ) ( not ( = ?auto_911619 ?auto_911621 ) ) )
    :subtasks
    ( ( !LOAD ?auto_911621 ?auto_911615 ?auto_911617 ?auto_911620 )
      ( MAKE-2CRATE ?auto_911616 ?auto_911614 ?auto_911615 )
      ( MAKE-1CRATE-VERIFY ?auto_911614 ?auto_911615 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911622 - SURFACE
      ?auto_911623 - SURFACE
      ?auto_911624 - SURFACE
    )
    :vars
    (
      ?auto_911626 - HOIST
      ?auto_911628 - PLACE
      ?auto_911629 - TRUCK
      ?auto_911627 - PLACE
      ?auto_911625 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_911626 ?auto_911628 ) ( SURFACE-AT ?auto_911623 ?auto_911628 ) ( CLEAR ?auto_911623 ) ( IS-CRATE ?auto_911624 ) ( not ( = ?auto_911623 ?auto_911624 ) ) ( AVAILABLE ?auto_911626 ) ( ON ?auto_911623 ?auto_911622 ) ( not ( = ?auto_911622 ?auto_911623 ) ) ( not ( = ?auto_911622 ?auto_911624 ) ) ( TRUCK-AT ?auto_911629 ?auto_911627 ) ( not ( = ?auto_911627 ?auto_911628 ) ) ( HOIST-AT ?auto_911625 ?auto_911627 ) ( LIFTING ?auto_911625 ?auto_911624 ) ( not ( = ?auto_911626 ?auto_911625 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911623 ?auto_911624 )
      ( MAKE-2CRATE-VERIFY ?auto_911622 ?auto_911623 ?auto_911624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911630 - SURFACE
      ?auto_911631 - SURFACE
    )
    :vars
    (
      ?auto_911632 - HOIST
      ?auto_911637 - PLACE
      ?auto_911633 - SURFACE
      ?auto_911636 - TRUCK
      ?auto_911635 - PLACE
      ?auto_911634 - HOIST
      ?auto_911638 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911632 ?auto_911637 ) ( SURFACE-AT ?auto_911630 ?auto_911637 ) ( CLEAR ?auto_911630 ) ( IS-CRATE ?auto_911631 ) ( not ( = ?auto_911630 ?auto_911631 ) ) ( AVAILABLE ?auto_911632 ) ( ON ?auto_911630 ?auto_911633 ) ( not ( = ?auto_911633 ?auto_911630 ) ) ( not ( = ?auto_911633 ?auto_911631 ) ) ( TRUCK-AT ?auto_911636 ?auto_911635 ) ( not ( = ?auto_911635 ?auto_911637 ) ) ( HOIST-AT ?auto_911634 ?auto_911635 ) ( not ( = ?auto_911632 ?auto_911634 ) ) ( AVAILABLE ?auto_911634 ) ( SURFACE-AT ?auto_911631 ?auto_911635 ) ( ON ?auto_911631 ?auto_911638 ) ( CLEAR ?auto_911631 ) ( not ( = ?auto_911630 ?auto_911638 ) ) ( not ( = ?auto_911631 ?auto_911638 ) ) ( not ( = ?auto_911633 ?auto_911638 ) ) )
    :subtasks
    ( ( !LIFT ?auto_911634 ?auto_911631 ?auto_911638 ?auto_911635 )
      ( MAKE-2CRATE ?auto_911633 ?auto_911630 ?auto_911631 )
      ( MAKE-1CRATE-VERIFY ?auto_911630 ?auto_911631 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911639 - SURFACE
      ?auto_911640 - SURFACE
      ?auto_911641 - SURFACE
    )
    :vars
    (
      ?auto_911643 - HOIST
      ?auto_911644 - PLACE
      ?auto_911645 - TRUCK
      ?auto_911642 - PLACE
      ?auto_911647 - HOIST
      ?auto_911646 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911643 ?auto_911644 ) ( SURFACE-AT ?auto_911640 ?auto_911644 ) ( CLEAR ?auto_911640 ) ( IS-CRATE ?auto_911641 ) ( not ( = ?auto_911640 ?auto_911641 ) ) ( AVAILABLE ?auto_911643 ) ( ON ?auto_911640 ?auto_911639 ) ( not ( = ?auto_911639 ?auto_911640 ) ) ( not ( = ?auto_911639 ?auto_911641 ) ) ( TRUCK-AT ?auto_911645 ?auto_911642 ) ( not ( = ?auto_911642 ?auto_911644 ) ) ( HOIST-AT ?auto_911647 ?auto_911642 ) ( not ( = ?auto_911643 ?auto_911647 ) ) ( AVAILABLE ?auto_911647 ) ( SURFACE-AT ?auto_911641 ?auto_911642 ) ( ON ?auto_911641 ?auto_911646 ) ( CLEAR ?auto_911641 ) ( not ( = ?auto_911640 ?auto_911646 ) ) ( not ( = ?auto_911641 ?auto_911646 ) ) ( not ( = ?auto_911639 ?auto_911646 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911640 ?auto_911641 )
      ( MAKE-2CRATE-VERIFY ?auto_911639 ?auto_911640 ?auto_911641 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911648 - SURFACE
      ?auto_911649 - SURFACE
    )
    :vars
    (
      ?auto_911650 - HOIST
      ?auto_911653 - PLACE
      ?auto_911652 - SURFACE
      ?auto_911655 - PLACE
      ?auto_911654 - HOIST
      ?auto_911651 - SURFACE
      ?auto_911656 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911650 ?auto_911653 ) ( SURFACE-AT ?auto_911648 ?auto_911653 ) ( CLEAR ?auto_911648 ) ( IS-CRATE ?auto_911649 ) ( not ( = ?auto_911648 ?auto_911649 ) ) ( AVAILABLE ?auto_911650 ) ( ON ?auto_911648 ?auto_911652 ) ( not ( = ?auto_911652 ?auto_911648 ) ) ( not ( = ?auto_911652 ?auto_911649 ) ) ( not ( = ?auto_911655 ?auto_911653 ) ) ( HOIST-AT ?auto_911654 ?auto_911655 ) ( not ( = ?auto_911650 ?auto_911654 ) ) ( AVAILABLE ?auto_911654 ) ( SURFACE-AT ?auto_911649 ?auto_911655 ) ( ON ?auto_911649 ?auto_911651 ) ( CLEAR ?auto_911649 ) ( not ( = ?auto_911648 ?auto_911651 ) ) ( not ( = ?auto_911649 ?auto_911651 ) ) ( not ( = ?auto_911652 ?auto_911651 ) ) ( TRUCK-AT ?auto_911656 ?auto_911653 ) )
    :subtasks
    ( ( !DRIVE ?auto_911656 ?auto_911653 ?auto_911655 )
      ( MAKE-2CRATE ?auto_911652 ?auto_911648 ?auto_911649 )
      ( MAKE-1CRATE-VERIFY ?auto_911648 ?auto_911649 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911657 - SURFACE
      ?auto_911658 - SURFACE
      ?auto_911659 - SURFACE
    )
    :vars
    (
      ?auto_911664 - HOIST
      ?auto_911661 - PLACE
      ?auto_911665 - PLACE
      ?auto_911662 - HOIST
      ?auto_911660 - SURFACE
      ?auto_911663 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911664 ?auto_911661 ) ( SURFACE-AT ?auto_911658 ?auto_911661 ) ( CLEAR ?auto_911658 ) ( IS-CRATE ?auto_911659 ) ( not ( = ?auto_911658 ?auto_911659 ) ) ( AVAILABLE ?auto_911664 ) ( ON ?auto_911658 ?auto_911657 ) ( not ( = ?auto_911657 ?auto_911658 ) ) ( not ( = ?auto_911657 ?auto_911659 ) ) ( not ( = ?auto_911665 ?auto_911661 ) ) ( HOIST-AT ?auto_911662 ?auto_911665 ) ( not ( = ?auto_911664 ?auto_911662 ) ) ( AVAILABLE ?auto_911662 ) ( SURFACE-AT ?auto_911659 ?auto_911665 ) ( ON ?auto_911659 ?auto_911660 ) ( CLEAR ?auto_911659 ) ( not ( = ?auto_911658 ?auto_911660 ) ) ( not ( = ?auto_911659 ?auto_911660 ) ) ( not ( = ?auto_911657 ?auto_911660 ) ) ( TRUCK-AT ?auto_911663 ?auto_911661 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911658 ?auto_911659 )
      ( MAKE-2CRATE-VERIFY ?auto_911657 ?auto_911658 ?auto_911659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911666 - SURFACE
      ?auto_911667 - SURFACE
    )
    :vars
    (
      ?auto_911671 - HOIST
      ?auto_911669 - PLACE
      ?auto_911674 - SURFACE
      ?auto_911673 - PLACE
      ?auto_911668 - HOIST
      ?auto_911670 - SURFACE
      ?auto_911672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911671 ?auto_911669 ) ( IS-CRATE ?auto_911667 ) ( not ( = ?auto_911666 ?auto_911667 ) ) ( not ( = ?auto_911674 ?auto_911666 ) ) ( not ( = ?auto_911674 ?auto_911667 ) ) ( not ( = ?auto_911673 ?auto_911669 ) ) ( HOIST-AT ?auto_911668 ?auto_911673 ) ( not ( = ?auto_911671 ?auto_911668 ) ) ( AVAILABLE ?auto_911668 ) ( SURFACE-AT ?auto_911667 ?auto_911673 ) ( ON ?auto_911667 ?auto_911670 ) ( CLEAR ?auto_911667 ) ( not ( = ?auto_911666 ?auto_911670 ) ) ( not ( = ?auto_911667 ?auto_911670 ) ) ( not ( = ?auto_911674 ?auto_911670 ) ) ( TRUCK-AT ?auto_911672 ?auto_911669 ) ( SURFACE-AT ?auto_911674 ?auto_911669 ) ( CLEAR ?auto_911674 ) ( LIFTING ?auto_911671 ?auto_911666 ) ( IS-CRATE ?auto_911666 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911674 ?auto_911666 )
      ( MAKE-2CRATE ?auto_911674 ?auto_911666 ?auto_911667 )
      ( MAKE-1CRATE-VERIFY ?auto_911666 ?auto_911667 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911675 - SURFACE
      ?auto_911676 - SURFACE
      ?auto_911677 - SURFACE
    )
    :vars
    (
      ?auto_911682 - HOIST
      ?auto_911681 - PLACE
      ?auto_911680 - PLACE
      ?auto_911679 - HOIST
      ?auto_911678 - SURFACE
      ?auto_911683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911682 ?auto_911681 ) ( IS-CRATE ?auto_911677 ) ( not ( = ?auto_911676 ?auto_911677 ) ) ( not ( = ?auto_911675 ?auto_911676 ) ) ( not ( = ?auto_911675 ?auto_911677 ) ) ( not ( = ?auto_911680 ?auto_911681 ) ) ( HOIST-AT ?auto_911679 ?auto_911680 ) ( not ( = ?auto_911682 ?auto_911679 ) ) ( AVAILABLE ?auto_911679 ) ( SURFACE-AT ?auto_911677 ?auto_911680 ) ( ON ?auto_911677 ?auto_911678 ) ( CLEAR ?auto_911677 ) ( not ( = ?auto_911676 ?auto_911678 ) ) ( not ( = ?auto_911677 ?auto_911678 ) ) ( not ( = ?auto_911675 ?auto_911678 ) ) ( TRUCK-AT ?auto_911683 ?auto_911681 ) ( SURFACE-AT ?auto_911675 ?auto_911681 ) ( CLEAR ?auto_911675 ) ( LIFTING ?auto_911682 ?auto_911676 ) ( IS-CRATE ?auto_911676 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911676 ?auto_911677 )
      ( MAKE-2CRATE-VERIFY ?auto_911675 ?auto_911676 ?auto_911677 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911684 - SURFACE
      ?auto_911685 - SURFACE
    )
    :vars
    (
      ?auto_911686 - HOIST
      ?auto_911690 - PLACE
      ?auto_911688 - SURFACE
      ?auto_911689 - PLACE
      ?auto_911691 - HOIST
      ?auto_911692 - SURFACE
      ?auto_911687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911686 ?auto_911690 ) ( IS-CRATE ?auto_911685 ) ( not ( = ?auto_911684 ?auto_911685 ) ) ( not ( = ?auto_911688 ?auto_911684 ) ) ( not ( = ?auto_911688 ?auto_911685 ) ) ( not ( = ?auto_911689 ?auto_911690 ) ) ( HOIST-AT ?auto_911691 ?auto_911689 ) ( not ( = ?auto_911686 ?auto_911691 ) ) ( AVAILABLE ?auto_911691 ) ( SURFACE-AT ?auto_911685 ?auto_911689 ) ( ON ?auto_911685 ?auto_911692 ) ( CLEAR ?auto_911685 ) ( not ( = ?auto_911684 ?auto_911692 ) ) ( not ( = ?auto_911685 ?auto_911692 ) ) ( not ( = ?auto_911688 ?auto_911692 ) ) ( TRUCK-AT ?auto_911687 ?auto_911690 ) ( SURFACE-AT ?auto_911688 ?auto_911690 ) ( CLEAR ?auto_911688 ) ( IS-CRATE ?auto_911684 ) ( AVAILABLE ?auto_911686 ) ( IN ?auto_911684 ?auto_911687 ) )
    :subtasks
    ( ( !UNLOAD ?auto_911686 ?auto_911684 ?auto_911687 ?auto_911690 )
      ( MAKE-2CRATE ?auto_911688 ?auto_911684 ?auto_911685 )
      ( MAKE-1CRATE-VERIFY ?auto_911684 ?auto_911685 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_911693 - SURFACE
      ?auto_911694 - SURFACE
      ?auto_911695 - SURFACE
    )
    :vars
    (
      ?auto_911696 - HOIST
      ?auto_911697 - PLACE
      ?auto_911701 - PLACE
      ?auto_911698 - HOIST
      ?auto_911700 - SURFACE
      ?auto_911699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911696 ?auto_911697 ) ( IS-CRATE ?auto_911695 ) ( not ( = ?auto_911694 ?auto_911695 ) ) ( not ( = ?auto_911693 ?auto_911694 ) ) ( not ( = ?auto_911693 ?auto_911695 ) ) ( not ( = ?auto_911701 ?auto_911697 ) ) ( HOIST-AT ?auto_911698 ?auto_911701 ) ( not ( = ?auto_911696 ?auto_911698 ) ) ( AVAILABLE ?auto_911698 ) ( SURFACE-AT ?auto_911695 ?auto_911701 ) ( ON ?auto_911695 ?auto_911700 ) ( CLEAR ?auto_911695 ) ( not ( = ?auto_911694 ?auto_911700 ) ) ( not ( = ?auto_911695 ?auto_911700 ) ) ( not ( = ?auto_911693 ?auto_911700 ) ) ( TRUCK-AT ?auto_911699 ?auto_911697 ) ( SURFACE-AT ?auto_911693 ?auto_911697 ) ( CLEAR ?auto_911693 ) ( IS-CRATE ?auto_911694 ) ( AVAILABLE ?auto_911696 ) ( IN ?auto_911694 ?auto_911699 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911694 ?auto_911695 )
      ( MAKE-2CRATE-VERIFY ?auto_911693 ?auto_911694 ?auto_911695 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_911738 - SURFACE
      ?auto_911739 - SURFACE
    )
    :vars
    (
      ?auto_911745 - HOIST
      ?auto_911744 - PLACE
      ?auto_911742 - SURFACE
      ?auto_911746 - PLACE
      ?auto_911740 - HOIST
      ?auto_911741 - SURFACE
      ?auto_911743 - TRUCK
      ?auto_911747 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911745 ?auto_911744 ) ( SURFACE-AT ?auto_911738 ?auto_911744 ) ( CLEAR ?auto_911738 ) ( IS-CRATE ?auto_911739 ) ( not ( = ?auto_911738 ?auto_911739 ) ) ( AVAILABLE ?auto_911745 ) ( ON ?auto_911738 ?auto_911742 ) ( not ( = ?auto_911742 ?auto_911738 ) ) ( not ( = ?auto_911742 ?auto_911739 ) ) ( not ( = ?auto_911746 ?auto_911744 ) ) ( HOIST-AT ?auto_911740 ?auto_911746 ) ( not ( = ?auto_911745 ?auto_911740 ) ) ( AVAILABLE ?auto_911740 ) ( SURFACE-AT ?auto_911739 ?auto_911746 ) ( ON ?auto_911739 ?auto_911741 ) ( CLEAR ?auto_911739 ) ( not ( = ?auto_911738 ?auto_911741 ) ) ( not ( = ?auto_911739 ?auto_911741 ) ) ( not ( = ?auto_911742 ?auto_911741 ) ) ( TRUCK-AT ?auto_911743 ?auto_911747 ) ( not ( = ?auto_911747 ?auto_911744 ) ) ( not ( = ?auto_911746 ?auto_911747 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_911743 ?auto_911747 ?auto_911744 )
      ( MAKE-1CRATE ?auto_911738 ?auto_911739 )
      ( MAKE-1CRATE-VERIFY ?auto_911738 ?auto_911739 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911778 - SURFACE
      ?auto_911779 - SURFACE
      ?auto_911780 - SURFACE
      ?auto_911777 - SURFACE
    )
    :vars
    (
      ?auto_911782 - HOIST
      ?auto_911781 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911782 ?auto_911781 ) ( SURFACE-AT ?auto_911780 ?auto_911781 ) ( CLEAR ?auto_911780 ) ( LIFTING ?auto_911782 ?auto_911777 ) ( IS-CRATE ?auto_911777 ) ( not ( = ?auto_911780 ?auto_911777 ) ) ( ON ?auto_911779 ?auto_911778 ) ( ON ?auto_911780 ?auto_911779 ) ( not ( = ?auto_911778 ?auto_911779 ) ) ( not ( = ?auto_911778 ?auto_911780 ) ) ( not ( = ?auto_911778 ?auto_911777 ) ) ( not ( = ?auto_911779 ?auto_911780 ) ) ( not ( = ?auto_911779 ?auto_911777 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_911780 ?auto_911777 )
      ( MAKE-3CRATE-VERIFY ?auto_911778 ?auto_911779 ?auto_911780 ?auto_911777 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911795 - SURFACE
      ?auto_911796 - SURFACE
      ?auto_911797 - SURFACE
      ?auto_911794 - SURFACE
    )
    :vars
    (
      ?auto_911798 - HOIST
      ?auto_911800 - PLACE
      ?auto_911799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911798 ?auto_911800 ) ( SURFACE-AT ?auto_911797 ?auto_911800 ) ( CLEAR ?auto_911797 ) ( IS-CRATE ?auto_911794 ) ( not ( = ?auto_911797 ?auto_911794 ) ) ( TRUCK-AT ?auto_911799 ?auto_911800 ) ( AVAILABLE ?auto_911798 ) ( IN ?auto_911794 ?auto_911799 ) ( ON ?auto_911797 ?auto_911796 ) ( not ( = ?auto_911796 ?auto_911797 ) ) ( not ( = ?auto_911796 ?auto_911794 ) ) ( ON ?auto_911796 ?auto_911795 ) ( not ( = ?auto_911795 ?auto_911796 ) ) ( not ( = ?auto_911795 ?auto_911797 ) ) ( not ( = ?auto_911795 ?auto_911794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911796 ?auto_911797 ?auto_911794 )
      ( MAKE-3CRATE-VERIFY ?auto_911795 ?auto_911796 ?auto_911797 ?auto_911794 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911816 - SURFACE
      ?auto_911817 - SURFACE
      ?auto_911818 - SURFACE
      ?auto_911815 - SURFACE
    )
    :vars
    (
      ?auto_911820 - HOIST
      ?auto_911822 - PLACE
      ?auto_911819 - TRUCK
      ?auto_911821 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911820 ?auto_911822 ) ( SURFACE-AT ?auto_911818 ?auto_911822 ) ( CLEAR ?auto_911818 ) ( IS-CRATE ?auto_911815 ) ( not ( = ?auto_911818 ?auto_911815 ) ) ( AVAILABLE ?auto_911820 ) ( IN ?auto_911815 ?auto_911819 ) ( ON ?auto_911818 ?auto_911817 ) ( not ( = ?auto_911817 ?auto_911818 ) ) ( not ( = ?auto_911817 ?auto_911815 ) ) ( TRUCK-AT ?auto_911819 ?auto_911821 ) ( not ( = ?auto_911821 ?auto_911822 ) ) ( ON ?auto_911817 ?auto_911816 ) ( not ( = ?auto_911816 ?auto_911817 ) ) ( not ( = ?auto_911816 ?auto_911818 ) ) ( not ( = ?auto_911816 ?auto_911815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911817 ?auto_911818 ?auto_911815 )
      ( MAKE-3CRATE-VERIFY ?auto_911816 ?auto_911817 ?auto_911818 ?auto_911815 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911840 - SURFACE
      ?auto_911841 - SURFACE
      ?auto_911842 - SURFACE
      ?auto_911839 - SURFACE
    )
    :vars
    (
      ?auto_911844 - HOIST
      ?auto_911845 - PLACE
      ?auto_911843 - TRUCK
      ?auto_911846 - PLACE
      ?auto_911847 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_911844 ?auto_911845 ) ( SURFACE-AT ?auto_911842 ?auto_911845 ) ( CLEAR ?auto_911842 ) ( IS-CRATE ?auto_911839 ) ( not ( = ?auto_911842 ?auto_911839 ) ) ( AVAILABLE ?auto_911844 ) ( ON ?auto_911842 ?auto_911841 ) ( not ( = ?auto_911841 ?auto_911842 ) ) ( not ( = ?auto_911841 ?auto_911839 ) ) ( TRUCK-AT ?auto_911843 ?auto_911846 ) ( not ( = ?auto_911846 ?auto_911845 ) ) ( HOIST-AT ?auto_911847 ?auto_911846 ) ( LIFTING ?auto_911847 ?auto_911839 ) ( not ( = ?auto_911844 ?auto_911847 ) ) ( ON ?auto_911841 ?auto_911840 ) ( not ( = ?auto_911840 ?auto_911841 ) ) ( not ( = ?auto_911840 ?auto_911842 ) ) ( not ( = ?auto_911840 ?auto_911839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911841 ?auto_911842 ?auto_911839 )
      ( MAKE-3CRATE-VERIFY ?auto_911840 ?auto_911841 ?auto_911842 ?auto_911839 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911867 - SURFACE
      ?auto_911868 - SURFACE
      ?auto_911869 - SURFACE
      ?auto_911866 - SURFACE
    )
    :vars
    (
      ?auto_911872 - HOIST
      ?auto_911873 - PLACE
      ?auto_911875 - TRUCK
      ?auto_911871 - PLACE
      ?auto_911874 - HOIST
      ?auto_911870 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_911872 ?auto_911873 ) ( SURFACE-AT ?auto_911869 ?auto_911873 ) ( CLEAR ?auto_911869 ) ( IS-CRATE ?auto_911866 ) ( not ( = ?auto_911869 ?auto_911866 ) ) ( AVAILABLE ?auto_911872 ) ( ON ?auto_911869 ?auto_911868 ) ( not ( = ?auto_911868 ?auto_911869 ) ) ( not ( = ?auto_911868 ?auto_911866 ) ) ( TRUCK-AT ?auto_911875 ?auto_911871 ) ( not ( = ?auto_911871 ?auto_911873 ) ) ( HOIST-AT ?auto_911874 ?auto_911871 ) ( not ( = ?auto_911872 ?auto_911874 ) ) ( AVAILABLE ?auto_911874 ) ( SURFACE-AT ?auto_911866 ?auto_911871 ) ( ON ?auto_911866 ?auto_911870 ) ( CLEAR ?auto_911866 ) ( not ( = ?auto_911869 ?auto_911870 ) ) ( not ( = ?auto_911866 ?auto_911870 ) ) ( not ( = ?auto_911868 ?auto_911870 ) ) ( ON ?auto_911868 ?auto_911867 ) ( not ( = ?auto_911867 ?auto_911868 ) ) ( not ( = ?auto_911867 ?auto_911869 ) ) ( not ( = ?auto_911867 ?auto_911866 ) ) ( not ( = ?auto_911867 ?auto_911870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911868 ?auto_911869 ?auto_911866 )
      ( MAKE-3CRATE-VERIFY ?auto_911867 ?auto_911868 ?auto_911869 ?auto_911866 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911895 - SURFACE
      ?auto_911896 - SURFACE
      ?auto_911897 - SURFACE
      ?auto_911894 - SURFACE
    )
    :vars
    (
      ?auto_911901 - HOIST
      ?auto_911899 - PLACE
      ?auto_911900 - PLACE
      ?auto_911902 - HOIST
      ?auto_911903 - SURFACE
      ?auto_911898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911901 ?auto_911899 ) ( SURFACE-AT ?auto_911897 ?auto_911899 ) ( CLEAR ?auto_911897 ) ( IS-CRATE ?auto_911894 ) ( not ( = ?auto_911897 ?auto_911894 ) ) ( AVAILABLE ?auto_911901 ) ( ON ?auto_911897 ?auto_911896 ) ( not ( = ?auto_911896 ?auto_911897 ) ) ( not ( = ?auto_911896 ?auto_911894 ) ) ( not ( = ?auto_911900 ?auto_911899 ) ) ( HOIST-AT ?auto_911902 ?auto_911900 ) ( not ( = ?auto_911901 ?auto_911902 ) ) ( AVAILABLE ?auto_911902 ) ( SURFACE-AT ?auto_911894 ?auto_911900 ) ( ON ?auto_911894 ?auto_911903 ) ( CLEAR ?auto_911894 ) ( not ( = ?auto_911897 ?auto_911903 ) ) ( not ( = ?auto_911894 ?auto_911903 ) ) ( not ( = ?auto_911896 ?auto_911903 ) ) ( TRUCK-AT ?auto_911898 ?auto_911899 ) ( ON ?auto_911896 ?auto_911895 ) ( not ( = ?auto_911895 ?auto_911896 ) ) ( not ( = ?auto_911895 ?auto_911897 ) ) ( not ( = ?auto_911895 ?auto_911894 ) ) ( not ( = ?auto_911895 ?auto_911903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911896 ?auto_911897 ?auto_911894 )
      ( MAKE-3CRATE-VERIFY ?auto_911895 ?auto_911896 ?auto_911897 ?auto_911894 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911923 - SURFACE
      ?auto_911924 - SURFACE
      ?auto_911925 - SURFACE
      ?auto_911922 - SURFACE
    )
    :vars
    (
      ?auto_911929 - HOIST
      ?auto_911926 - PLACE
      ?auto_911927 - PLACE
      ?auto_911931 - HOIST
      ?auto_911928 - SURFACE
      ?auto_911930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911929 ?auto_911926 ) ( IS-CRATE ?auto_911922 ) ( not ( = ?auto_911925 ?auto_911922 ) ) ( not ( = ?auto_911924 ?auto_911925 ) ) ( not ( = ?auto_911924 ?auto_911922 ) ) ( not ( = ?auto_911927 ?auto_911926 ) ) ( HOIST-AT ?auto_911931 ?auto_911927 ) ( not ( = ?auto_911929 ?auto_911931 ) ) ( AVAILABLE ?auto_911931 ) ( SURFACE-AT ?auto_911922 ?auto_911927 ) ( ON ?auto_911922 ?auto_911928 ) ( CLEAR ?auto_911922 ) ( not ( = ?auto_911925 ?auto_911928 ) ) ( not ( = ?auto_911922 ?auto_911928 ) ) ( not ( = ?auto_911924 ?auto_911928 ) ) ( TRUCK-AT ?auto_911930 ?auto_911926 ) ( SURFACE-AT ?auto_911924 ?auto_911926 ) ( CLEAR ?auto_911924 ) ( LIFTING ?auto_911929 ?auto_911925 ) ( IS-CRATE ?auto_911925 ) ( ON ?auto_911924 ?auto_911923 ) ( not ( = ?auto_911923 ?auto_911924 ) ) ( not ( = ?auto_911923 ?auto_911925 ) ) ( not ( = ?auto_911923 ?auto_911922 ) ) ( not ( = ?auto_911923 ?auto_911928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911924 ?auto_911925 ?auto_911922 )
      ( MAKE-3CRATE-VERIFY ?auto_911923 ?auto_911924 ?auto_911925 ?auto_911922 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_911951 - SURFACE
      ?auto_911952 - SURFACE
      ?auto_911953 - SURFACE
      ?auto_911950 - SURFACE
    )
    :vars
    (
      ?auto_911955 - HOIST
      ?auto_911958 - PLACE
      ?auto_911954 - PLACE
      ?auto_911957 - HOIST
      ?auto_911956 - SURFACE
      ?auto_911959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911955 ?auto_911958 ) ( IS-CRATE ?auto_911950 ) ( not ( = ?auto_911953 ?auto_911950 ) ) ( not ( = ?auto_911952 ?auto_911953 ) ) ( not ( = ?auto_911952 ?auto_911950 ) ) ( not ( = ?auto_911954 ?auto_911958 ) ) ( HOIST-AT ?auto_911957 ?auto_911954 ) ( not ( = ?auto_911955 ?auto_911957 ) ) ( AVAILABLE ?auto_911957 ) ( SURFACE-AT ?auto_911950 ?auto_911954 ) ( ON ?auto_911950 ?auto_911956 ) ( CLEAR ?auto_911950 ) ( not ( = ?auto_911953 ?auto_911956 ) ) ( not ( = ?auto_911950 ?auto_911956 ) ) ( not ( = ?auto_911952 ?auto_911956 ) ) ( TRUCK-AT ?auto_911959 ?auto_911958 ) ( SURFACE-AT ?auto_911952 ?auto_911958 ) ( CLEAR ?auto_911952 ) ( IS-CRATE ?auto_911953 ) ( AVAILABLE ?auto_911955 ) ( IN ?auto_911953 ?auto_911959 ) ( ON ?auto_911952 ?auto_911951 ) ( not ( = ?auto_911951 ?auto_911952 ) ) ( not ( = ?auto_911951 ?auto_911953 ) ) ( not ( = ?auto_911951 ?auto_911950 ) ) ( not ( = ?auto_911951 ?auto_911956 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_911952 ?auto_911953 ?auto_911950 )
      ( MAKE-3CRATE-VERIFY ?auto_911951 ?auto_911952 ?auto_911953 ?auto_911950 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912242 - SURFACE
      ?auto_912243 - SURFACE
      ?auto_912244 - SURFACE
      ?auto_912241 - SURFACE
      ?auto_912245 - SURFACE
    )
    :vars
    (
      ?auto_912247 - HOIST
      ?auto_912246 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912247 ?auto_912246 ) ( SURFACE-AT ?auto_912241 ?auto_912246 ) ( CLEAR ?auto_912241 ) ( LIFTING ?auto_912247 ?auto_912245 ) ( IS-CRATE ?auto_912245 ) ( not ( = ?auto_912241 ?auto_912245 ) ) ( ON ?auto_912243 ?auto_912242 ) ( ON ?auto_912244 ?auto_912243 ) ( ON ?auto_912241 ?auto_912244 ) ( not ( = ?auto_912242 ?auto_912243 ) ) ( not ( = ?auto_912242 ?auto_912244 ) ) ( not ( = ?auto_912242 ?auto_912241 ) ) ( not ( = ?auto_912242 ?auto_912245 ) ) ( not ( = ?auto_912243 ?auto_912244 ) ) ( not ( = ?auto_912243 ?auto_912241 ) ) ( not ( = ?auto_912243 ?auto_912245 ) ) ( not ( = ?auto_912244 ?auto_912241 ) ) ( not ( = ?auto_912244 ?auto_912245 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_912241 ?auto_912245 )
      ( MAKE-4CRATE-VERIFY ?auto_912242 ?auto_912243 ?auto_912244 ?auto_912241 ?auto_912245 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912267 - SURFACE
      ?auto_912268 - SURFACE
      ?auto_912269 - SURFACE
      ?auto_912266 - SURFACE
      ?auto_912270 - SURFACE
    )
    :vars
    (
      ?auto_912272 - HOIST
      ?auto_912273 - PLACE
      ?auto_912271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912272 ?auto_912273 ) ( SURFACE-AT ?auto_912266 ?auto_912273 ) ( CLEAR ?auto_912266 ) ( IS-CRATE ?auto_912270 ) ( not ( = ?auto_912266 ?auto_912270 ) ) ( TRUCK-AT ?auto_912271 ?auto_912273 ) ( AVAILABLE ?auto_912272 ) ( IN ?auto_912270 ?auto_912271 ) ( ON ?auto_912266 ?auto_912269 ) ( not ( = ?auto_912269 ?auto_912266 ) ) ( not ( = ?auto_912269 ?auto_912270 ) ) ( ON ?auto_912268 ?auto_912267 ) ( ON ?auto_912269 ?auto_912268 ) ( not ( = ?auto_912267 ?auto_912268 ) ) ( not ( = ?auto_912267 ?auto_912269 ) ) ( not ( = ?auto_912267 ?auto_912266 ) ) ( not ( = ?auto_912267 ?auto_912270 ) ) ( not ( = ?auto_912268 ?auto_912269 ) ) ( not ( = ?auto_912268 ?auto_912266 ) ) ( not ( = ?auto_912268 ?auto_912270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912269 ?auto_912266 ?auto_912270 )
      ( MAKE-4CRATE-VERIFY ?auto_912267 ?auto_912268 ?auto_912269 ?auto_912266 ?auto_912270 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912297 - SURFACE
      ?auto_912298 - SURFACE
      ?auto_912299 - SURFACE
      ?auto_912296 - SURFACE
      ?auto_912300 - SURFACE
    )
    :vars
    (
      ?auto_912301 - HOIST
      ?auto_912302 - PLACE
      ?auto_912303 - TRUCK
      ?auto_912304 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912301 ?auto_912302 ) ( SURFACE-AT ?auto_912296 ?auto_912302 ) ( CLEAR ?auto_912296 ) ( IS-CRATE ?auto_912300 ) ( not ( = ?auto_912296 ?auto_912300 ) ) ( AVAILABLE ?auto_912301 ) ( IN ?auto_912300 ?auto_912303 ) ( ON ?auto_912296 ?auto_912299 ) ( not ( = ?auto_912299 ?auto_912296 ) ) ( not ( = ?auto_912299 ?auto_912300 ) ) ( TRUCK-AT ?auto_912303 ?auto_912304 ) ( not ( = ?auto_912304 ?auto_912302 ) ) ( ON ?auto_912298 ?auto_912297 ) ( ON ?auto_912299 ?auto_912298 ) ( not ( = ?auto_912297 ?auto_912298 ) ) ( not ( = ?auto_912297 ?auto_912299 ) ) ( not ( = ?auto_912297 ?auto_912296 ) ) ( not ( = ?auto_912297 ?auto_912300 ) ) ( not ( = ?auto_912298 ?auto_912299 ) ) ( not ( = ?auto_912298 ?auto_912296 ) ) ( not ( = ?auto_912298 ?auto_912300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912299 ?auto_912296 ?auto_912300 )
      ( MAKE-4CRATE-VERIFY ?auto_912297 ?auto_912298 ?auto_912299 ?auto_912296 ?auto_912300 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912331 - SURFACE
      ?auto_912332 - SURFACE
      ?auto_912333 - SURFACE
      ?auto_912330 - SURFACE
      ?auto_912334 - SURFACE
    )
    :vars
    (
      ?auto_912339 - HOIST
      ?auto_912336 - PLACE
      ?auto_912338 - TRUCK
      ?auto_912337 - PLACE
      ?auto_912335 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_912339 ?auto_912336 ) ( SURFACE-AT ?auto_912330 ?auto_912336 ) ( CLEAR ?auto_912330 ) ( IS-CRATE ?auto_912334 ) ( not ( = ?auto_912330 ?auto_912334 ) ) ( AVAILABLE ?auto_912339 ) ( ON ?auto_912330 ?auto_912333 ) ( not ( = ?auto_912333 ?auto_912330 ) ) ( not ( = ?auto_912333 ?auto_912334 ) ) ( TRUCK-AT ?auto_912338 ?auto_912337 ) ( not ( = ?auto_912337 ?auto_912336 ) ) ( HOIST-AT ?auto_912335 ?auto_912337 ) ( LIFTING ?auto_912335 ?auto_912334 ) ( not ( = ?auto_912339 ?auto_912335 ) ) ( ON ?auto_912332 ?auto_912331 ) ( ON ?auto_912333 ?auto_912332 ) ( not ( = ?auto_912331 ?auto_912332 ) ) ( not ( = ?auto_912331 ?auto_912333 ) ) ( not ( = ?auto_912331 ?auto_912330 ) ) ( not ( = ?auto_912331 ?auto_912334 ) ) ( not ( = ?auto_912332 ?auto_912333 ) ) ( not ( = ?auto_912332 ?auto_912330 ) ) ( not ( = ?auto_912332 ?auto_912334 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912333 ?auto_912330 ?auto_912334 )
      ( MAKE-4CRATE-VERIFY ?auto_912331 ?auto_912332 ?auto_912333 ?auto_912330 ?auto_912334 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912369 - SURFACE
      ?auto_912370 - SURFACE
      ?auto_912371 - SURFACE
      ?auto_912368 - SURFACE
      ?auto_912372 - SURFACE
    )
    :vars
    (
      ?auto_912375 - HOIST
      ?auto_912376 - PLACE
      ?auto_912378 - TRUCK
      ?auto_912377 - PLACE
      ?auto_912373 - HOIST
      ?auto_912374 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_912375 ?auto_912376 ) ( SURFACE-AT ?auto_912368 ?auto_912376 ) ( CLEAR ?auto_912368 ) ( IS-CRATE ?auto_912372 ) ( not ( = ?auto_912368 ?auto_912372 ) ) ( AVAILABLE ?auto_912375 ) ( ON ?auto_912368 ?auto_912371 ) ( not ( = ?auto_912371 ?auto_912368 ) ) ( not ( = ?auto_912371 ?auto_912372 ) ) ( TRUCK-AT ?auto_912378 ?auto_912377 ) ( not ( = ?auto_912377 ?auto_912376 ) ) ( HOIST-AT ?auto_912373 ?auto_912377 ) ( not ( = ?auto_912375 ?auto_912373 ) ) ( AVAILABLE ?auto_912373 ) ( SURFACE-AT ?auto_912372 ?auto_912377 ) ( ON ?auto_912372 ?auto_912374 ) ( CLEAR ?auto_912372 ) ( not ( = ?auto_912368 ?auto_912374 ) ) ( not ( = ?auto_912372 ?auto_912374 ) ) ( not ( = ?auto_912371 ?auto_912374 ) ) ( ON ?auto_912370 ?auto_912369 ) ( ON ?auto_912371 ?auto_912370 ) ( not ( = ?auto_912369 ?auto_912370 ) ) ( not ( = ?auto_912369 ?auto_912371 ) ) ( not ( = ?auto_912369 ?auto_912368 ) ) ( not ( = ?auto_912369 ?auto_912372 ) ) ( not ( = ?auto_912369 ?auto_912374 ) ) ( not ( = ?auto_912370 ?auto_912371 ) ) ( not ( = ?auto_912370 ?auto_912368 ) ) ( not ( = ?auto_912370 ?auto_912372 ) ) ( not ( = ?auto_912370 ?auto_912374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912371 ?auto_912368 ?auto_912372 )
      ( MAKE-4CRATE-VERIFY ?auto_912369 ?auto_912370 ?auto_912371 ?auto_912368 ?auto_912372 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912408 - SURFACE
      ?auto_912409 - SURFACE
      ?auto_912410 - SURFACE
      ?auto_912407 - SURFACE
      ?auto_912411 - SURFACE
    )
    :vars
    (
      ?auto_912417 - HOIST
      ?auto_912414 - PLACE
      ?auto_912412 - PLACE
      ?auto_912413 - HOIST
      ?auto_912416 - SURFACE
      ?auto_912415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912417 ?auto_912414 ) ( SURFACE-AT ?auto_912407 ?auto_912414 ) ( CLEAR ?auto_912407 ) ( IS-CRATE ?auto_912411 ) ( not ( = ?auto_912407 ?auto_912411 ) ) ( AVAILABLE ?auto_912417 ) ( ON ?auto_912407 ?auto_912410 ) ( not ( = ?auto_912410 ?auto_912407 ) ) ( not ( = ?auto_912410 ?auto_912411 ) ) ( not ( = ?auto_912412 ?auto_912414 ) ) ( HOIST-AT ?auto_912413 ?auto_912412 ) ( not ( = ?auto_912417 ?auto_912413 ) ) ( AVAILABLE ?auto_912413 ) ( SURFACE-AT ?auto_912411 ?auto_912412 ) ( ON ?auto_912411 ?auto_912416 ) ( CLEAR ?auto_912411 ) ( not ( = ?auto_912407 ?auto_912416 ) ) ( not ( = ?auto_912411 ?auto_912416 ) ) ( not ( = ?auto_912410 ?auto_912416 ) ) ( TRUCK-AT ?auto_912415 ?auto_912414 ) ( ON ?auto_912409 ?auto_912408 ) ( ON ?auto_912410 ?auto_912409 ) ( not ( = ?auto_912408 ?auto_912409 ) ) ( not ( = ?auto_912408 ?auto_912410 ) ) ( not ( = ?auto_912408 ?auto_912407 ) ) ( not ( = ?auto_912408 ?auto_912411 ) ) ( not ( = ?auto_912408 ?auto_912416 ) ) ( not ( = ?auto_912409 ?auto_912410 ) ) ( not ( = ?auto_912409 ?auto_912407 ) ) ( not ( = ?auto_912409 ?auto_912411 ) ) ( not ( = ?auto_912409 ?auto_912416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912410 ?auto_912407 ?auto_912411 )
      ( MAKE-4CRATE-VERIFY ?auto_912408 ?auto_912409 ?auto_912410 ?auto_912407 ?auto_912411 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912447 - SURFACE
      ?auto_912448 - SURFACE
      ?auto_912449 - SURFACE
      ?auto_912446 - SURFACE
      ?auto_912450 - SURFACE
    )
    :vars
    (
      ?auto_912452 - HOIST
      ?auto_912455 - PLACE
      ?auto_912456 - PLACE
      ?auto_912451 - HOIST
      ?auto_912453 - SURFACE
      ?auto_912454 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912452 ?auto_912455 ) ( IS-CRATE ?auto_912450 ) ( not ( = ?auto_912446 ?auto_912450 ) ) ( not ( = ?auto_912449 ?auto_912446 ) ) ( not ( = ?auto_912449 ?auto_912450 ) ) ( not ( = ?auto_912456 ?auto_912455 ) ) ( HOIST-AT ?auto_912451 ?auto_912456 ) ( not ( = ?auto_912452 ?auto_912451 ) ) ( AVAILABLE ?auto_912451 ) ( SURFACE-AT ?auto_912450 ?auto_912456 ) ( ON ?auto_912450 ?auto_912453 ) ( CLEAR ?auto_912450 ) ( not ( = ?auto_912446 ?auto_912453 ) ) ( not ( = ?auto_912450 ?auto_912453 ) ) ( not ( = ?auto_912449 ?auto_912453 ) ) ( TRUCK-AT ?auto_912454 ?auto_912455 ) ( SURFACE-AT ?auto_912449 ?auto_912455 ) ( CLEAR ?auto_912449 ) ( LIFTING ?auto_912452 ?auto_912446 ) ( IS-CRATE ?auto_912446 ) ( ON ?auto_912448 ?auto_912447 ) ( ON ?auto_912449 ?auto_912448 ) ( not ( = ?auto_912447 ?auto_912448 ) ) ( not ( = ?auto_912447 ?auto_912449 ) ) ( not ( = ?auto_912447 ?auto_912446 ) ) ( not ( = ?auto_912447 ?auto_912450 ) ) ( not ( = ?auto_912447 ?auto_912453 ) ) ( not ( = ?auto_912448 ?auto_912449 ) ) ( not ( = ?auto_912448 ?auto_912446 ) ) ( not ( = ?auto_912448 ?auto_912450 ) ) ( not ( = ?auto_912448 ?auto_912453 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912449 ?auto_912446 ?auto_912450 )
      ( MAKE-4CRATE-VERIFY ?auto_912447 ?auto_912448 ?auto_912449 ?auto_912446 ?auto_912450 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_912486 - SURFACE
      ?auto_912487 - SURFACE
      ?auto_912488 - SURFACE
      ?auto_912485 - SURFACE
      ?auto_912489 - SURFACE
    )
    :vars
    (
      ?auto_912494 - HOIST
      ?auto_912492 - PLACE
      ?auto_912490 - PLACE
      ?auto_912491 - HOIST
      ?auto_912495 - SURFACE
      ?auto_912493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_912494 ?auto_912492 ) ( IS-CRATE ?auto_912489 ) ( not ( = ?auto_912485 ?auto_912489 ) ) ( not ( = ?auto_912488 ?auto_912485 ) ) ( not ( = ?auto_912488 ?auto_912489 ) ) ( not ( = ?auto_912490 ?auto_912492 ) ) ( HOIST-AT ?auto_912491 ?auto_912490 ) ( not ( = ?auto_912494 ?auto_912491 ) ) ( AVAILABLE ?auto_912491 ) ( SURFACE-AT ?auto_912489 ?auto_912490 ) ( ON ?auto_912489 ?auto_912495 ) ( CLEAR ?auto_912489 ) ( not ( = ?auto_912485 ?auto_912495 ) ) ( not ( = ?auto_912489 ?auto_912495 ) ) ( not ( = ?auto_912488 ?auto_912495 ) ) ( TRUCK-AT ?auto_912493 ?auto_912492 ) ( SURFACE-AT ?auto_912488 ?auto_912492 ) ( CLEAR ?auto_912488 ) ( IS-CRATE ?auto_912485 ) ( AVAILABLE ?auto_912494 ) ( IN ?auto_912485 ?auto_912493 ) ( ON ?auto_912487 ?auto_912486 ) ( ON ?auto_912488 ?auto_912487 ) ( not ( = ?auto_912486 ?auto_912487 ) ) ( not ( = ?auto_912486 ?auto_912488 ) ) ( not ( = ?auto_912486 ?auto_912485 ) ) ( not ( = ?auto_912486 ?auto_912489 ) ) ( not ( = ?auto_912486 ?auto_912495 ) ) ( not ( = ?auto_912487 ?auto_912488 ) ) ( not ( = ?auto_912487 ?auto_912485 ) ) ( not ( = ?auto_912487 ?auto_912489 ) ) ( not ( = ?auto_912487 ?auto_912495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_912488 ?auto_912485 ?auto_912489 )
      ( MAKE-4CRATE-VERIFY ?auto_912486 ?auto_912487 ?auto_912488 ?auto_912485 ?auto_912489 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913146 - SURFACE
      ?auto_913147 - SURFACE
      ?auto_913148 - SURFACE
      ?auto_913145 - SURFACE
      ?auto_913149 - SURFACE
      ?auto_913150 - SURFACE
    )
    :vars
    (
      ?auto_913152 - HOIST
      ?auto_913151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_913152 ?auto_913151 ) ( SURFACE-AT ?auto_913149 ?auto_913151 ) ( CLEAR ?auto_913149 ) ( LIFTING ?auto_913152 ?auto_913150 ) ( IS-CRATE ?auto_913150 ) ( not ( = ?auto_913149 ?auto_913150 ) ) ( ON ?auto_913147 ?auto_913146 ) ( ON ?auto_913148 ?auto_913147 ) ( ON ?auto_913145 ?auto_913148 ) ( ON ?auto_913149 ?auto_913145 ) ( not ( = ?auto_913146 ?auto_913147 ) ) ( not ( = ?auto_913146 ?auto_913148 ) ) ( not ( = ?auto_913146 ?auto_913145 ) ) ( not ( = ?auto_913146 ?auto_913149 ) ) ( not ( = ?auto_913146 ?auto_913150 ) ) ( not ( = ?auto_913147 ?auto_913148 ) ) ( not ( = ?auto_913147 ?auto_913145 ) ) ( not ( = ?auto_913147 ?auto_913149 ) ) ( not ( = ?auto_913147 ?auto_913150 ) ) ( not ( = ?auto_913148 ?auto_913145 ) ) ( not ( = ?auto_913148 ?auto_913149 ) ) ( not ( = ?auto_913148 ?auto_913150 ) ) ( not ( = ?auto_913145 ?auto_913149 ) ) ( not ( = ?auto_913145 ?auto_913150 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_913149 ?auto_913150 )
      ( MAKE-5CRATE-VERIFY ?auto_913146 ?auto_913147 ?auto_913148 ?auto_913145 ?auto_913149 ?auto_913150 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913180 - SURFACE
      ?auto_913181 - SURFACE
      ?auto_913182 - SURFACE
      ?auto_913179 - SURFACE
      ?auto_913183 - SURFACE
      ?auto_913184 - SURFACE
    )
    :vars
    (
      ?auto_913185 - HOIST
      ?auto_913187 - PLACE
      ?auto_913186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913185 ?auto_913187 ) ( SURFACE-AT ?auto_913183 ?auto_913187 ) ( CLEAR ?auto_913183 ) ( IS-CRATE ?auto_913184 ) ( not ( = ?auto_913183 ?auto_913184 ) ) ( TRUCK-AT ?auto_913186 ?auto_913187 ) ( AVAILABLE ?auto_913185 ) ( IN ?auto_913184 ?auto_913186 ) ( ON ?auto_913183 ?auto_913179 ) ( not ( = ?auto_913179 ?auto_913183 ) ) ( not ( = ?auto_913179 ?auto_913184 ) ) ( ON ?auto_913181 ?auto_913180 ) ( ON ?auto_913182 ?auto_913181 ) ( ON ?auto_913179 ?auto_913182 ) ( not ( = ?auto_913180 ?auto_913181 ) ) ( not ( = ?auto_913180 ?auto_913182 ) ) ( not ( = ?auto_913180 ?auto_913179 ) ) ( not ( = ?auto_913180 ?auto_913183 ) ) ( not ( = ?auto_913180 ?auto_913184 ) ) ( not ( = ?auto_913181 ?auto_913182 ) ) ( not ( = ?auto_913181 ?auto_913179 ) ) ( not ( = ?auto_913181 ?auto_913183 ) ) ( not ( = ?auto_913181 ?auto_913184 ) ) ( not ( = ?auto_913182 ?auto_913179 ) ) ( not ( = ?auto_913182 ?auto_913183 ) ) ( not ( = ?auto_913182 ?auto_913184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913179 ?auto_913183 ?auto_913184 )
      ( MAKE-5CRATE-VERIFY ?auto_913180 ?auto_913181 ?auto_913182 ?auto_913179 ?auto_913183 ?auto_913184 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913220 - SURFACE
      ?auto_913221 - SURFACE
      ?auto_913222 - SURFACE
      ?auto_913219 - SURFACE
      ?auto_913223 - SURFACE
      ?auto_913224 - SURFACE
    )
    :vars
    (
      ?auto_913227 - HOIST
      ?auto_913225 - PLACE
      ?auto_913228 - TRUCK
      ?auto_913226 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_913227 ?auto_913225 ) ( SURFACE-AT ?auto_913223 ?auto_913225 ) ( CLEAR ?auto_913223 ) ( IS-CRATE ?auto_913224 ) ( not ( = ?auto_913223 ?auto_913224 ) ) ( AVAILABLE ?auto_913227 ) ( IN ?auto_913224 ?auto_913228 ) ( ON ?auto_913223 ?auto_913219 ) ( not ( = ?auto_913219 ?auto_913223 ) ) ( not ( = ?auto_913219 ?auto_913224 ) ) ( TRUCK-AT ?auto_913228 ?auto_913226 ) ( not ( = ?auto_913226 ?auto_913225 ) ) ( ON ?auto_913221 ?auto_913220 ) ( ON ?auto_913222 ?auto_913221 ) ( ON ?auto_913219 ?auto_913222 ) ( not ( = ?auto_913220 ?auto_913221 ) ) ( not ( = ?auto_913220 ?auto_913222 ) ) ( not ( = ?auto_913220 ?auto_913219 ) ) ( not ( = ?auto_913220 ?auto_913223 ) ) ( not ( = ?auto_913220 ?auto_913224 ) ) ( not ( = ?auto_913221 ?auto_913222 ) ) ( not ( = ?auto_913221 ?auto_913219 ) ) ( not ( = ?auto_913221 ?auto_913223 ) ) ( not ( = ?auto_913221 ?auto_913224 ) ) ( not ( = ?auto_913222 ?auto_913219 ) ) ( not ( = ?auto_913222 ?auto_913223 ) ) ( not ( = ?auto_913222 ?auto_913224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913219 ?auto_913223 ?auto_913224 )
      ( MAKE-5CRATE-VERIFY ?auto_913220 ?auto_913221 ?auto_913222 ?auto_913219 ?auto_913223 ?auto_913224 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913265 - SURFACE
      ?auto_913266 - SURFACE
      ?auto_913267 - SURFACE
      ?auto_913264 - SURFACE
      ?auto_913268 - SURFACE
      ?auto_913269 - SURFACE
    )
    :vars
    (
      ?auto_913271 - HOIST
      ?auto_913272 - PLACE
      ?auto_913273 - TRUCK
      ?auto_913274 - PLACE
      ?auto_913270 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_913271 ?auto_913272 ) ( SURFACE-AT ?auto_913268 ?auto_913272 ) ( CLEAR ?auto_913268 ) ( IS-CRATE ?auto_913269 ) ( not ( = ?auto_913268 ?auto_913269 ) ) ( AVAILABLE ?auto_913271 ) ( ON ?auto_913268 ?auto_913264 ) ( not ( = ?auto_913264 ?auto_913268 ) ) ( not ( = ?auto_913264 ?auto_913269 ) ) ( TRUCK-AT ?auto_913273 ?auto_913274 ) ( not ( = ?auto_913274 ?auto_913272 ) ) ( HOIST-AT ?auto_913270 ?auto_913274 ) ( LIFTING ?auto_913270 ?auto_913269 ) ( not ( = ?auto_913271 ?auto_913270 ) ) ( ON ?auto_913266 ?auto_913265 ) ( ON ?auto_913267 ?auto_913266 ) ( ON ?auto_913264 ?auto_913267 ) ( not ( = ?auto_913265 ?auto_913266 ) ) ( not ( = ?auto_913265 ?auto_913267 ) ) ( not ( = ?auto_913265 ?auto_913264 ) ) ( not ( = ?auto_913265 ?auto_913268 ) ) ( not ( = ?auto_913265 ?auto_913269 ) ) ( not ( = ?auto_913266 ?auto_913267 ) ) ( not ( = ?auto_913266 ?auto_913264 ) ) ( not ( = ?auto_913266 ?auto_913268 ) ) ( not ( = ?auto_913266 ?auto_913269 ) ) ( not ( = ?auto_913267 ?auto_913264 ) ) ( not ( = ?auto_913267 ?auto_913268 ) ) ( not ( = ?auto_913267 ?auto_913269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913264 ?auto_913268 ?auto_913269 )
      ( MAKE-5CRATE-VERIFY ?auto_913265 ?auto_913266 ?auto_913267 ?auto_913264 ?auto_913268 ?auto_913269 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913315 - SURFACE
      ?auto_913316 - SURFACE
      ?auto_913317 - SURFACE
      ?auto_913314 - SURFACE
      ?auto_913318 - SURFACE
      ?auto_913319 - SURFACE
    )
    :vars
    (
      ?auto_913323 - HOIST
      ?auto_913324 - PLACE
      ?auto_913322 - TRUCK
      ?auto_913321 - PLACE
      ?auto_913320 - HOIST
      ?auto_913325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_913323 ?auto_913324 ) ( SURFACE-AT ?auto_913318 ?auto_913324 ) ( CLEAR ?auto_913318 ) ( IS-CRATE ?auto_913319 ) ( not ( = ?auto_913318 ?auto_913319 ) ) ( AVAILABLE ?auto_913323 ) ( ON ?auto_913318 ?auto_913314 ) ( not ( = ?auto_913314 ?auto_913318 ) ) ( not ( = ?auto_913314 ?auto_913319 ) ) ( TRUCK-AT ?auto_913322 ?auto_913321 ) ( not ( = ?auto_913321 ?auto_913324 ) ) ( HOIST-AT ?auto_913320 ?auto_913321 ) ( not ( = ?auto_913323 ?auto_913320 ) ) ( AVAILABLE ?auto_913320 ) ( SURFACE-AT ?auto_913319 ?auto_913321 ) ( ON ?auto_913319 ?auto_913325 ) ( CLEAR ?auto_913319 ) ( not ( = ?auto_913318 ?auto_913325 ) ) ( not ( = ?auto_913319 ?auto_913325 ) ) ( not ( = ?auto_913314 ?auto_913325 ) ) ( ON ?auto_913316 ?auto_913315 ) ( ON ?auto_913317 ?auto_913316 ) ( ON ?auto_913314 ?auto_913317 ) ( not ( = ?auto_913315 ?auto_913316 ) ) ( not ( = ?auto_913315 ?auto_913317 ) ) ( not ( = ?auto_913315 ?auto_913314 ) ) ( not ( = ?auto_913315 ?auto_913318 ) ) ( not ( = ?auto_913315 ?auto_913319 ) ) ( not ( = ?auto_913315 ?auto_913325 ) ) ( not ( = ?auto_913316 ?auto_913317 ) ) ( not ( = ?auto_913316 ?auto_913314 ) ) ( not ( = ?auto_913316 ?auto_913318 ) ) ( not ( = ?auto_913316 ?auto_913319 ) ) ( not ( = ?auto_913316 ?auto_913325 ) ) ( not ( = ?auto_913317 ?auto_913314 ) ) ( not ( = ?auto_913317 ?auto_913318 ) ) ( not ( = ?auto_913317 ?auto_913319 ) ) ( not ( = ?auto_913317 ?auto_913325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913314 ?auto_913318 ?auto_913319 )
      ( MAKE-5CRATE-VERIFY ?auto_913315 ?auto_913316 ?auto_913317 ?auto_913314 ?auto_913318 ?auto_913319 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913366 - SURFACE
      ?auto_913367 - SURFACE
      ?auto_913368 - SURFACE
      ?auto_913365 - SURFACE
      ?auto_913369 - SURFACE
      ?auto_913370 - SURFACE
    )
    :vars
    (
      ?auto_913375 - HOIST
      ?auto_913376 - PLACE
      ?auto_913374 - PLACE
      ?auto_913372 - HOIST
      ?auto_913371 - SURFACE
      ?auto_913373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913375 ?auto_913376 ) ( SURFACE-AT ?auto_913369 ?auto_913376 ) ( CLEAR ?auto_913369 ) ( IS-CRATE ?auto_913370 ) ( not ( = ?auto_913369 ?auto_913370 ) ) ( AVAILABLE ?auto_913375 ) ( ON ?auto_913369 ?auto_913365 ) ( not ( = ?auto_913365 ?auto_913369 ) ) ( not ( = ?auto_913365 ?auto_913370 ) ) ( not ( = ?auto_913374 ?auto_913376 ) ) ( HOIST-AT ?auto_913372 ?auto_913374 ) ( not ( = ?auto_913375 ?auto_913372 ) ) ( AVAILABLE ?auto_913372 ) ( SURFACE-AT ?auto_913370 ?auto_913374 ) ( ON ?auto_913370 ?auto_913371 ) ( CLEAR ?auto_913370 ) ( not ( = ?auto_913369 ?auto_913371 ) ) ( not ( = ?auto_913370 ?auto_913371 ) ) ( not ( = ?auto_913365 ?auto_913371 ) ) ( TRUCK-AT ?auto_913373 ?auto_913376 ) ( ON ?auto_913367 ?auto_913366 ) ( ON ?auto_913368 ?auto_913367 ) ( ON ?auto_913365 ?auto_913368 ) ( not ( = ?auto_913366 ?auto_913367 ) ) ( not ( = ?auto_913366 ?auto_913368 ) ) ( not ( = ?auto_913366 ?auto_913365 ) ) ( not ( = ?auto_913366 ?auto_913369 ) ) ( not ( = ?auto_913366 ?auto_913370 ) ) ( not ( = ?auto_913366 ?auto_913371 ) ) ( not ( = ?auto_913367 ?auto_913368 ) ) ( not ( = ?auto_913367 ?auto_913365 ) ) ( not ( = ?auto_913367 ?auto_913369 ) ) ( not ( = ?auto_913367 ?auto_913370 ) ) ( not ( = ?auto_913367 ?auto_913371 ) ) ( not ( = ?auto_913368 ?auto_913365 ) ) ( not ( = ?auto_913368 ?auto_913369 ) ) ( not ( = ?auto_913368 ?auto_913370 ) ) ( not ( = ?auto_913368 ?auto_913371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913365 ?auto_913369 ?auto_913370 )
      ( MAKE-5CRATE-VERIFY ?auto_913366 ?auto_913367 ?auto_913368 ?auto_913365 ?auto_913369 ?auto_913370 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913417 - SURFACE
      ?auto_913418 - SURFACE
      ?auto_913419 - SURFACE
      ?auto_913416 - SURFACE
      ?auto_913420 - SURFACE
      ?auto_913421 - SURFACE
    )
    :vars
    (
      ?auto_913426 - HOIST
      ?auto_913423 - PLACE
      ?auto_913422 - PLACE
      ?auto_913427 - HOIST
      ?auto_913424 - SURFACE
      ?auto_913425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913426 ?auto_913423 ) ( IS-CRATE ?auto_913421 ) ( not ( = ?auto_913420 ?auto_913421 ) ) ( not ( = ?auto_913416 ?auto_913420 ) ) ( not ( = ?auto_913416 ?auto_913421 ) ) ( not ( = ?auto_913422 ?auto_913423 ) ) ( HOIST-AT ?auto_913427 ?auto_913422 ) ( not ( = ?auto_913426 ?auto_913427 ) ) ( AVAILABLE ?auto_913427 ) ( SURFACE-AT ?auto_913421 ?auto_913422 ) ( ON ?auto_913421 ?auto_913424 ) ( CLEAR ?auto_913421 ) ( not ( = ?auto_913420 ?auto_913424 ) ) ( not ( = ?auto_913421 ?auto_913424 ) ) ( not ( = ?auto_913416 ?auto_913424 ) ) ( TRUCK-AT ?auto_913425 ?auto_913423 ) ( SURFACE-AT ?auto_913416 ?auto_913423 ) ( CLEAR ?auto_913416 ) ( LIFTING ?auto_913426 ?auto_913420 ) ( IS-CRATE ?auto_913420 ) ( ON ?auto_913418 ?auto_913417 ) ( ON ?auto_913419 ?auto_913418 ) ( ON ?auto_913416 ?auto_913419 ) ( not ( = ?auto_913417 ?auto_913418 ) ) ( not ( = ?auto_913417 ?auto_913419 ) ) ( not ( = ?auto_913417 ?auto_913416 ) ) ( not ( = ?auto_913417 ?auto_913420 ) ) ( not ( = ?auto_913417 ?auto_913421 ) ) ( not ( = ?auto_913417 ?auto_913424 ) ) ( not ( = ?auto_913418 ?auto_913419 ) ) ( not ( = ?auto_913418 ?auto_913416 ) ) ( not ( = ?auto_913418 ?auto_913420 ) ) ( not ( = ?auto_913418 ?auto_913421 ) ) ( not ( = ?auto_913418 ?auto_913424 ) ) ( not ( = ?auto_913419 ?auto_913416 ) ) ( not ( = ?auto_913419 ?auto_913420 ) ) ( not ( = ?auto_913419 ?auto_913421 ) ) ( not ( = ?auto_913419 ?auto_913424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913416 ?auto_913420 ?auto_913421 )
      ( MAKE-5CRATE-VERIFY ?auto_913417 ?auto_913418 ?auto_913419 ?auto_913416 ?auto_913420 ?auto_913421 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_913468 - SURFACE
      ?auto_913469 - SURFACE
      ?auto_913470 - SURFACE
      ?auto_913467 - SURFACE
      ?auto_913471 - SURFACE
      ?auto_913472 - SURFACE
    )
    :vars
    (
      ?auto_913475 - HOIST
      ?auto_913473 - PLACE
      ?auto_913477 - PLACE
      ?auto_913478 - HOIST
      ?auto_913474 - SURFACE
      ?auto_913476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913475 ?auto_913473 ) ( IS-CRATE ?auto_913472 ) ( not ( = ?auto_913471 ?auto_913472 ) ) ( not ( = ?auto_913467 ?auto_913471 ) ) ( not ( = ?auto_913467 ?auto_913472 ) ) ( not ( = ?auto_913477 ?auto_913473 ) ) ( HOIST-AT ?auto_913478 ?auto_913477 ) ( not ( = ?auto_913475 ?auto_913478 ) ) ( AVAILABLE ?auto_913478 ) ( SURFACE-AT ?auto_913472 ?auto_913477 ) ( ON ?auto_913472 ?auto_913474 ) ( CLEAR ?auto_913472 ) ( not ( = ?auto_913471 ?auto_913474 ) ) ( not ( = ?auto_913472 ?auto_913474 ) ) ( not ( = ?auto_913467 ?auto_913474 ) ) ( TRUCK-AT ?auto_913476 ?auto_913473 ) ( SURFACE-AT ?auto_913467 ?auto_913473 ) ( CLEAR ?auto_913467 ) ( IS-CRATE ?auto_913471 ) ( AVAILABLE ?auto_913475 ) ( IN ?auto_913471 ?auto_913476 ) ( ON ?auto_913469 ?auto_913468 ) ( ON ?auto_913470 ?auto_913469 ) ( ON ?auto_913467 ?auto_913470 ) ( not ( = ?auto_913468 ?auto_913469 ) ) ( not ( = ?auto_913468 ?auto_913470 ) ) ( not ( = ?auto_913468 ?auto_913467 ) ) ( not ( = ?auto_913468 ?auto_913471 ) ) ( not ( = ?auto_913468 ?auto_913472 ) ) ( not ( = ?auto_913468 ?auto_913474 ) ) ( not ( = ?auto_913469 ?auto_913470 ) ) ( not ( = ?auto_913469 ?auto_913467 ) ) ( not ( = ?auto_913469 ?auto_913471 ) ) ( not ( = ?auto_913469 ?auto_913472 ) ) ( not ( = ?auto_913469 ?auto_913474 ) ) ( not ( = ?auto_913470 ?auto_913467 ) ) ( not ( = ?auto_913470 ?auto_913471 ) ) ( not ( = ?auto_913470 ?auto_913472 ) ) ( not ( = ?auto_913470 ?auto_913474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_913467 ?auto_913471 ?auto_913472 )
      ( MAKE-5CRATE-VERIFY ?auto_913468 ?auto_913469 ?auto_913470 ?auto_913467 ?auto_913471 ?auto_913472 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914677 - SURFACE
      ?auto_914678 - SURFACE
      ?auto_914679 - SURFACE
      ?auto_914676 - SURFACE
      ?auto_914680 - SURFACE
      ?auto_914682 - SURFACE
      ?auto_914681 - SURFACE
    )
    :vars
    (
      ?auto_914684 - HOIST
      ?auto_914683 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_914684 ?auto_914683 ) ( SURFACE-AT ?auto_914682 ?auto_914683 ) ( CLEAR ?auto_914682 ) ( LIFTING ?auto_914684 ?auto_914681 ) ( IS-CRATE ?auto_914681 ) ( not ( = ?auto_914682 ?auto_914681 ) ) ( ON ?auto_914678 ?auto_914677 ) ( ON ?auto_914679 ?auto_914678 ) ( ON ?auto_914676 ?auto_914679 ) ( ON ?auto_914680 ?auto_914676 ) ( ON ?auto_914682 ?auto_914680 ) ( not ( = ?auto_914677 ?auto_914678 ) ) ( not ( = ?auto_914677 ?auto_914679 ) ) ( not ( = ?auto_914677 ?auto_914676 ) ) ( not ( = ?auto_914677 ?auto_914680 ) ) ( not ( = ?auto_914677 ?auto_914682 ) ) ( not ( = ?auto_914677 ?auto_914681 ) ) ( not ( = ?auto_914678 ?auto_914679 ) ) ( not ( = ?auto_914678 ?auto_914676 ) ) ( not ( = ?auto_914678 ?auto_914680 ) ) ( not ( = ?auto_914678 ?auto_914682 ) ) ( not ( = ?auto_914678 ?auto_914681 ) ) ( not ( = ?auto_914679 ?auto_914676 ) ) ( not ( = ?auto_914679 ?auto_914680 ) ) ( not ( = ?auto_914679 ?auto_914682 ) ) ( not ( = ?auto_914679 ?auto_914681 ) ) ( not ( = ?auto_914676 ?auto_914680 ) ) ( not ( = ?auto_914676 ?auto_914682 ) ) ( not ( = ?auto_914676 ?auto_914681 ) ) ( not ( = ?auto_914680 ?auto_914682 ) ) ( not ( = ?auto_914680 ?auto_914681 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_914682 ?auto_914681 )
      ( MAKE-6CRATE-VERIFY ?auto_914677 ?auto_914678 ?auto_914679 ?auto_914676 ?auto_914680 ?auto_914682 ?auto_914681 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914721 - SURFACE
      ?auto_914722 - SURFACE
      ?auto_914723 - SURFACE
      ?auto_914720 - SURFACE
      ?auto_914724 - SURFACE
      ?auto_914726 - SURFACE
      ?auto_914725 - SURFACE
    )
    :vars
    (
      ?auto_914729 - HOIST
      ?auto_914727 - PLACE
      ?auto_914728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914729 ?auto_914727 ) ( SURFACE-AT ?auto_914726 ?auto_914727 ) ( CLEAR ?auto_914726 ) ( IS-CRATE ?auto_914725 ) ( not ( = ?auto_914726 ?auto_914725 ) ) ( TRUCK-AT ?auto_914728 ?auto_914727 ) ( AVAILABLE ?auto_914729 ) ( IN ?auto_914725 ?auto_914728 ) ( ON ?auto_914726 ?auto_914724 ) ( not ( = ?auto_914724 ?auto_914726 ) ) ( not ( = ?auto_914724 ?auto_914725 ) ) ( ON ?auto_914722 ?auto_914721 ) ( ON ?auto_914723 ?auto_914722 ) ( ON ?auto_914720 ?auto_914723 ) ( ON ?auto_914724 ?auto_914720 ) ( not ( = ?auto_914721 ?auto_914722 ) ) ( not ( = ?auto_914721 ?auto_914723 ) ) ( not ( = ?auto_914721 ?auto_914720 ) ) ( not ( = ?auto_914721 ?auto_914724 ) ) ( not ( = ?auto_914721 ?auto_914726 ) ) ( not ( = ?auto_914721 ?auto_914725 ) ) ( not ( = ?auto_914722 ?auto_914723 ) ) ( not ( = ?auto_914722 ?auto_914720 ) ) ( not ( = ?auto_914722 ?auto_914724 ) ) ( not ( = ?auto_914722 ?auto_914726 ) ) ( not ( = ?auto_914722 ?auto_914725 ) ) ( not ( = ?auto_914723 ?auto_914720 ) ) ( not ( = ?auto_914723 ?auto_914724 ) ) ( not ( = ?auto_914723 ?auto_914726 ) ) ( not ( = ?auto_914723 ?auto_914725 ) ) ( not ( = ?auto_914720 ?auto_914724 ) ) ( not ( = ?auto_914720 ?auto_914726 ) ) ( not ( = ?auto_914720 ?auto_914725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914724 ?auto_914726 ?auto_914725 )
      ( MAKE-6CRATE-VERIFY ?auto_914721 ?auto_914722 ?auto_914723 ?auto_914720 ?auto_914724 ?auto_914726 ?auto_914725 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914772 - SURFACE
      ?auto_914773 - SURFACE
      ?auto_914774 - SURFACE
      ?auto_914771 - SURFACE
      ?auto_914775 - SURFACE
      ?auto_914777 - SURFACE
      ?auto_914776 - SURFACE
    )
    :vars
    (
      ?auto_914781 - HOIST
      ?auto_914780 - PLACE
      ?auto_914779 - TRUCK
      ?auto_914778 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_914781 ?auto_914780 ) ( SURFACE-AT ?auto_914777 ?auto_914780 ) ( CLEAR ?auto_914777 ) ( IS-CRATE ?auto_914776 ) ( not ( = ?auto_914777 ?auto_914776 ) ) ( AVAILABLE ?auto_914781 ) ( IN ?auto_914776 ?auto_914779 ) ( ON ?auto_914777 ?auto_914775 ) ( not ( = ?auto_914775 ?auto_914777 ) ) ( not ( = ?auto_914775 ?auto_914776 ) ) ( TRUCK-AT ?auto_914779 ?auto_914778 ) ( not ( = ?auto_914778 ?auto_914780 ) ) ( ON ?auto_914773 ?auto_914772 ) ( ON ?auto_914774 ?auto_914773 ) ( ON ?auto_914771 ?auto_914774 ) ( ON ?auto_914775 ?auto_914771 ) ( not ( = ?auto_914772 ?auto_914773 ) ) ( not ( = ?auto_914772 ?auto_914774 ) ) ( not ( = ?auto_914772 ?auto_914771 ) ) ( not ( = ?auto_914772 ?auto_914775 ) ) ( not ( = ?auto_914772 ?auto_914777 ) ) ( not ( = ?auto_914772 ?auto_914776 ) ) ( not ( = ?auto_914773 ?auto_914774 ) ) ( not ( = ?auto_914773 ?auto_914771 ) ) ( not ( = ?auto_914773 ?auto_914775 ) ) ( not ( = ?auto_914773 ?auto_914777 ) ) ( not ( = ?auto_914773 ?auto_914776 ) ) ( not ( = ?auto_914774 ?auto_914771 ) ) ( not ( = ?auto_914774 ?auto_914775 ) ) ( not ( = ?auto_914774 ?auto_914777 ) ) ( not ( = ?auto_914774 ?auto_914776 ) ) ( not ( = ?auto_914771 ?auto_914775 ) ) ( not ( = ?auto_914771 ?auto_914777 ) ) ( not ( = ?auto_914771 ?auto_914776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914775 ?auto_914777 ?auto_914776 )
      ( MAKE-6CRATE-VERIFY ?auto_914772 ?auto_914773 ?auto_914774 ?auto_914771 ?auto_914775 ?auto_914777 ?auto_914776 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914829 - SURFACE
      ?auto_914830 - SURFACE
      ?auto_914831 - SURFACE
      ?auto_914828 - SURFACE
      ?auto_914832 - SURFACE
      ?auto_914834 - SURFACE
      ?auto_914833 - SURFACE
    )
    :vars
    (
      ?auto_914838 - HOIST
      ?auto_914839 - PLACE
      ?auto_914836 - TRUCK
      ?auto_914837 - PLACE
      ?auto_914835 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_914838 ?auto_914839 ) ( SURFACE-AT ?auto_914834 ?auto_914839 ) ( CLEAR ?auto_914834 ) ( IS-CRATE ?auto_914833 ) ( not ( = ?auto_914834 ?auto_914833 ) ) ( AVAILABLE ?auto_914838 ) ( ON ?auto_914834 ?auto_914832 ) ( not ( = ?auto_914832 ?auto_914834 ) ) ( not ( = ?auto_914832 ?auto_914833 ) ) ( TRUCK-AT ?auto_914836 ?auto_914837 ) ( not ( = ?auto_914837 ?auto_914839 ) ) ( HOIST-AT ?auto_914835 ?auto_914837 ) ( LIFTING ?auto_914835 ?auto_914833 ) ( not ( = ?auto_914838 ?auto_914835 ) ) ( ON ?auto_914830 ?auto_914829 ) ( ON ?auto_914831 ?auto_914830 ) ( ON ?auto_914828 ?auto_914831 ) ( ON ?auto_914832 ?auto_914828 ) ( not ( = ?auto_914829 ?auto_914830 ) ) ( not ( = ?auto_914829 ?auto_914831 ) ) ( not ( = ?auto_914829 ?auto_914828 ) ) ( not ( = ?auto_914829 ?auto_914832 ) ) ( not ( = ?auto_914829 ?auto_914834 ) ) ( not ( = ?auto_914829 ?auto_914833 ) ) ( not ( = ?auto_914830 ?auto_914831 ) ) ( not ( = ?auto_914830 ?auto_914828 ) ) ( not ( = ?auto_914830 ?auto_914832 ) ) ( not ( = ?auto_914830 ?auto_914834 ) ) ( not ( = ?auto_914830 ?auto_914833 ) ) ( not ( = ?auto_914831 ?auto_914828 ) ) ( not ( = ?auto_914831 ?auto_914832 ) ) ( not ( = ?auto_914831 ?auto_914834 ) ) ( not ( = ?auto_914831 ?auto_914833 ) ) ( not ( = ?auto_914828 ?auto_914832 ) ) ( not ( = ?auto_914828 ?auto_914834 ) ) ( not ( = ?auto_914828 ?auto_914833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914832 ?auto_914834 ?auto_914833 )
      ( MAKE-6CRATE-VERIFY ?auto_914829 ?auto_914830 ?auto_914831 ?auto_914828 ?auto_914832 ?auto_914834 ?auto_914833 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914892 - SURFACE
      ?auto_914893 - SURFACE
      ?auto_914894 - SURFACE
      ?auto_914891 - SURFACE
      ?auto_914895 - SURFACE
      ?auto_914897 - SURFACE
      ?auto_914896 - SURFACE
    )
    :vars
    (
      ?auto_914899 - HOIST
      ?auto_914898 - PLACE
      ?auto_914902 - TRUCK
      ?auto_914901 - PLACE
      ?auto_914900 - HOIST
      ?auto_914903 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_914899 ?auto_914898 ) ( SURFACE-AT ?auto_914897 ?auto_914898 ) ( CLEAR ?auto_914897 ) ( IS-CRATE ?auto_914896 ) ( not ( = ?auto_914897 ?auto_914896 ) ) ( AVAILABLE ?auto_914899 ) ( ON ?auto_914897 ?auto_914895 ) ( not ( = ?auto_914895 ?auto_914897 ) ) ( not ( = ?auto_914895 ?auto_914896 ) ) ( TRUCK-AT ?auto_914902 ?auto_914901 ) ( not ( = ?auto_914901 ?auto_914898 ) ) ( HOIST-AT ?auto_914900 ?auto_914901 ) ( not ( = ?auto_914899 ?auto_914900 ) ) ( AVAILABLE ?auto_914900 ) ( SURFACE-AT ?auto_914896 ?auto_914901 ) ( ON ?auto_914896 ?auto_914903 ) ( CLEAR ?auto_914896 ) ( not ( = ?auto_914897 ?auto_914903 ) ) ( not ( = ?auto_914896 ?auto_914903 ) ) ( not ( = ?auto_914895 ?auto_914903 ) ) ( ON ?auto_914893 ?auto_914892 ) ( ON ?auto_914894 ?auto_914893 ) ( ON ?auto_914891 ?auto_914894 ) ( ON ?auto_914895 ?auto_914891 ) ( not ( = ?auto_914892 ?auto_914893 ) ) ( not ( = ?auto_914892 ?auto_914894 ) ) ( not ( = ?auto_914892 ?auto_914891 ) ) ( not ( = ?auto_914892 ?auto_914895 ) ) ( not ( = ?auto_914892 ?auto_914897 ) ) ( not ( = ?auto_914892 ?auto_914896 ) ) ( not ( = ?auto_914892 ?auto_914903 ) ) ( not ( = ?auto_914893 ?auto_914894 ) ) ( not ( = ?auto_914893 ?auto_914891 ) ) ( not ( = ?auto_914893 ?auto_914895 ) ) ( not ( = ?auto_914893 ?auto_914897 ) ) ( not ( = ?auto_914893 ?auto_914896 ) ) ( not ( = ?auto_914893 ?auto_914903 ) ) ( not ( = ?auto_914894 ?auto_914891 ) ) ( not ( = ?auto_914894 ?auto_914895 ) ) ( not ( = ?auto_914894 ?auto_914897 ) ) ( not ( = ?auto_914894 ?auto_914896 ) ) ( not ( = ?auto_914894 ?auto_914903 ) ) ( not ( = ?auto_914891 ?auto_914895 ) ) ( not ( = ?auto_914891 ?auto_914897 ) ) ( not ( = ?auto_914891 ?auto_914896 ) ) ( not ( = ?auto_914891 ?auto_914903 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914895 ?auto_914897 ?auto_914896 )
      ( MAKE-6CRATE-VERIFY ?auto_914892 ?auto_914893 ?auto_914894 ?auto_914891 ?auto_914895 ?auto_914897 ?auto_914896 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_914956 - SURFACE
      ?auto_914957 - SURFACE
      ?auto_914958 - SURFACE
      ?auto_914955 - SURFACE
      ?auto_914959 - SURFACE
      ?auto_914961 - SURFACE
      ?auto_914960 - SURFACE
    )
    :vars
    (
      ?auto_914964 - HOIST
      ?auto_914965 - PLACE
      ?auto_914967 - PLACE
      ?auto_914963 - HOIST
      ?auto_914966 - SURFACE
      ?auto_914962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_914964 ?auto_914965 ) ( SURFACE-AT ?auto_914961 ?auto_914965 ) ( CLEAR ?auto_914961 ) ( IS-CRATE ?auto_914960 ) ( not ( = ?auto_914961 ?auto_914960 ) ) ( AVAILABLE ?auto_914964 ) ( ON ?auto_914961 ?auto_914959 ) ( not ( = ?auto_914959 ?auto_914961 ) ) ( not ( = ?auto_914959 ?auto_914960 ) ) ( not ( = ?auto_914967 ?auto_914965 ) ) ( HOIST-AT ?auto_914963 ?auto_914967 ) ( not ( = ?auto_914964 ?auto_914963 ) ) ( AVAILABLE ?auto_914963 ) ( SURFACE-AT ?auto_914960 ?auto_914967 ) ( ON ?auto_914960 ?auto_914966 ) ( CLEAR ?auto_914960 ) ( not ( = ?auto_914961 ?auto_914966 ) ) ( not ( = ?auto_914960 ?auto_914966 ) ) ( not ( = ?auto_914959 ?auto_914966 ) ) ( TRUCK-AT ?auto_914962 ?auto_914965 ) ( ON ?auto_914957 ?auto_914956 ) ( ON ?auto_914958 ?auto_914957 ) ( ON ?auto_914955 ?auto_914958 ) ( ON ?auto_914959 ?auto_914955 ) ( not ( = ?auto_914956 ?auto_914957 ) ) ( not ( = ?auto_914956 ?auto_914958 ) ) ( not ( = ?auto_914956 ?auto_914955 ) ) ( not ( = ?auto_914956 ?auto_914959 ) ) ( not ( = ?auto_914956 ?auto_914961 ) ) ( not ( = ?auto_914956 ?auto_914960 ) ) ( not ( = ?auto_914956 ?auto_914966 ) ) ( not ( = ?auto_914957 ?auto_914958 ) ) ( not ( = ?auto_914957 ?auto_914955 ) ) ( not ( = ?auto_914957 ?auto_914959 ) ) ( not ( = ?auto_914957 ?auto_914961 ) ) ( not ( = ?auto_914957 ?auto_914960 ) ) ( not ( = ?auto_914957 ?auto_914966 ) ) ( not ( = ?auto_914958 ?auto_914955 ) ) ( not ( = ?auto_914958 ?auto_914959 ) ) ( not ( = ?auto_914958 ?auto_914961 ) ) ( not ( = ?auto_914958 ?auto_914960 ) ) ( not ( = ?auto_914958 ?auto_914966 ) ) ( not ( = ?auto_914955 ?auto_914959 ) ) ( not ( = ?auto_914955 ?auto_914961 ) ) ( not ( = ?auto_914955 ?auto_914960 ) ) ( not ( = ?auto_914955 ?auto_914966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_914959 ?auto_914961 ?auto_914960 )
      ( MAKE-6CRATE-VERIFY ?auto_914956 ?auto_914957 ?auto_914958 ?auto_914955 ?auto_914959 ?auto_914961 ?auto_914960 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_915020 - SURFACE
      ?auto_915021 - SURFACE
      ?auto_915022 - SURFACE
      ?auto_915019 - SURFACE
      ?auto_915023 - SURFACE
      ?auto_915025 - SURFACE
      ?auto_915024 - SURFACE
    )
    :vars
    (
      ?auto_915028 - HOIST
      ?auto_915026 - PLACE
      ?auto_915029 - PLACE
      ?auto_915031 - HOIST
      ?auto_915027 - SURFACE
      ?auto_915030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_915028 ?auto_915026 ) ( IS-CRATE ?auto_915024 ) ( not ( = ?auto_915025 ?auto_915024 ) ) ( not ( = ?auto_915023 ?auto_915025 ) ) ( not ( = ?auto_915023 ?auto_915024 ) ) ( not ( = ?auto_915029 ?auto_915026 ) ) ( HOIST-AT ?auto_915031 ?auto_915029 ) ( not ( = ?auto_915028 ?auto_915031 ) ) ( AVAILABLE ?auto_915031 ) ( SURFACE-AT ?auto_915024 ?auto_915029 ) ( ON ?auto_915024 ?auto_915027 ) ( CLEAR ?auto_915024 ) ( not ( = ?auto_915025 ?auto_915027 ) ) ( not ( = ?auto_915024 ?auto_915027 ) ) ( not ( = ?auto_915023 ?auto_915027 ) ) ( TRUCK-AT ?auto_915030 ?auto_915026 ) ( SURFACE-AT ?auto_915023 ?auto_915026 ) ( CLEAR ?auto_915023 ) ( LIFTING ?auto_915028 ?auto_915025 ) ( IS-CRATE ?auto_915025 ) ( ON ?auto_915021 ?auto_915020 ) ( ON ?auto_915022 ?auto_915021 ) ( ON ?auto_915019 ?auto_915022 ) ( ON ?auto_915023 ?auto_915019 ) ( not ( = ?auto_915020 ?auto_915021 ) ) ( not ( = ?auto_915020 ?auto_915022 ) ) ( not ( = ?auto_915020 ?auto_915019 ) ) ( not ( = ?auto_915020 ?auto_915023 ) ) ( not ( = ?auto_915020 ?auto_915025 ) ) ( not ( = ?auto_915020 ?auto_915024 ) ) ( not ( = ?auto_915020 ?auto_915027 ) ) ( not ( = ?auto_915021 ?auto_915022 ) ) ( not ( = ?auto_915021 ?auto_915019 ) ) ( not ( = ?auto_915021 ?auto_915023 ) ) ( not ( = ?auto_915021 ?auto_915025 ) ) ( not ( = ?auto_915021 ?auto_915024 ) ) ( not ( = ?auto_915021 ?auto_915027 ) ) ( not ( = ?auto_915022 ?auto_915019 ) ) ( not ( = ?auto_915022 ?auto_915023 ) ) ( not ( = ?auto_915022 ?auto_915025 ) ) ( not ( = ?auto_915022 ?auto_915024 ) ) ( not ( = ?auto_915022 ?auto_915027 ) ) ( not ( = ?auto_915019 ?auto_915023 ) ) ( not ( = ?auto_915019 ?auto_915025 ) ) ( not ( = ?auto_915019 ?auto_915024 ) ) ( not ( = ?auto_915019 ?auto_915027 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_915023 ?auto_915025 ?auto_915024 )
      ( MAKE-6CRATE-VERIFY ?auto_915020 ?auto_915021 ?auto_915022 ?auto_915019 ?auto_915023 ?auto_915025 ?auto_915024 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_915084 - SURFACE
      ?auto_915085 - SURFACE
      ?auto_915086 - SURFACE
      ?auto_915083 - SURFACE
      ?auto_915087 - SURFACE
      ?auto_915089 - SURFACE
      ?auto_915088 - SURFACE
    )
    :vars
    (
      ?auto_915091 - HOIST
      ?auto_915092 - PLACE
      ?auto_915094 - PLACE
      ?auto_915093 - HOIST
      ?auto_915095 - SURFACE
      ?auto_915090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_915091 ?auto_915092 ) ( IS-CRATE ?auto_915088 ) ( not ( = ?auto_915089 ?auto_915088 ) ) ( not ( = ?auto_915087 ?auto_915089 ) ) ( not ( = ?auto_915087 ?auto_915088 ) ) ( not ( = ?auto_915094 ?auto_915092 ) ) ( HOIST-AT ?auto_915093 ?auto_915094 ) ( not ( = ?auto_915091 ?auto_915093 ) ) ( AVAILABLE ?auto_915093 ) ( SURFACE-AT ?auto_915088 ?auto_915094 ) ( ON ?auto_915088 ?auto_915095 ) ( CLEAR ?auto_915088 ) ( not ( = ?auto_915089 ?auto_915095 ) ) ( not ( = ?auto_915088 ?auto_915095 ) ) ( not ( = ?auto_915087 ?auto_915095 ) ) ( TRUCK-AT ?auto_915090 ?auto_915092 ) ( SURFACE-AT ?auto_915087 ?auto_915092 ) ( CLEAR ?auto_915087 ) ( IS-CRATE ?auto_915089 ) ( AVAILABLE ?auto_915091 ) ( IN ?auto_915089 ?auto_915090 ) ( ON ?auto_915085 ?auto_915084 ) ( ON ?auto_915086 ?auto_915085 ) ( ON ?auto_915083 ?auto_915086 ) ( ON ?auto_915087 ?auto_915083 ) ( not ( = ?auto_915084 ?auto_915085 ) ) ( not ( = ?auto_915084 ?auto_915086 ) ) ( not ( = ?auto_915084 ?auto_915083 ) ) ( not ( = ?auto_915084 ?auto_915087 ) ) ( not ( = ?auto_915084 ?auto_915089 ) ) ( not ( = ?auto_915084 ?auto_915088 ) ) ( not ( = ?auto_915084 ?auto_915095 ) ) ( not ( = ?auto_915085 ?auto_915086 ) ) ( not ( = ?auto_915085 ?auto_915083 ) ) ( not ( = ?auto_915085 ?auto_915087 ) ) ( not ( = ?auto_915085 ?auto_915089 ) ) ( not ( = ?auto_915085 ?auto_915088 ) ) ( not ( = ?auto_915085 ?auto_915095 ) ) ( not ( = ?auto_915086 ?auto_915083 ) ) ( not ( = ?auto_915086 ?auto_915087 ) ) ( not ( = ?auto_915086 ?auto_915089 ) ) ( not ( = ?auto_915086 ?auto_915088 ) ) ( not ( = ?auto_915086 ?auto_915095 ) ) ( not ( = ?auto_915083 ?auto_915087 ) ) ( not ( = ?auto_915083 ?auto_915089 ) ) ( not ( = ?auto_915083 ?auto_915088 ) ) ( not ( = ?auto_915083 ?auto_915095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_915087 ?auto_915089 ?auto_915088 )
      ( MAKE-6CRATE-VERIFY ?auto_915084 ?auto_915085 ?auto_915086 ?auto_915083 ?auto_915087 ?auto_915089 ?auto_915088 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917040 - SURFACE
      ?auto_917041 - SURFACE
      ?auto_917042 - SURFACE
      ?auto_917039 - SURFACE
      ?auto_917043 - SURFACE
      ?auto_917045 - SURFACE
      ?auto_917044 - SURFACE
      ?auto_917046 - SURFACE
    )
    :vars
    (
      ?auto_917048 - HOIST
      ?auto_917047 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_917048 ?auto_917047 ) ( SURFACE-AT ?auto_917044 ?auto_917047 ) ( CLEAR ?auto_917044 ) ( LIFTING ?auto_917048 ?auto_917046 ) ( IS-CRATE ?auto_917046 ) ( not ( = ?auto_917044 ?auto_917046 ) ) ( ON ?auto_917041 ?auto_917040 ) ( ON ?auto_917042 ?auto_917041 ) ( ON ?auto_917039 ?auto_917042 ) ( ON ?auto_917043 ?auto_917039 ) ( ON ?auto_917045 ?auto_917043 ) ( ON ?auto_917044 ?auto_917045 ) ( not ( = ?auto_917040 ?auto_917041 ) ) ( not ( = ?auto_917040 ?auto_917042 ) ) ( not ( = ?auto_917040 ?auto_917039 ) ) ( not ( = ?auto_917040 ?auto_917043 ) ) ( not ( = ?auto_917040 ?auto_917045 ) ) ( not ( = ?auto_917040 ?auto_917044 ) ) ( not ( = ?auto_917040 ?auto_917046 ) ) ( not ( = ?auto_917041 ?auto_917042 ) ) ( not ( = ?auto_917041 ?auto_917039 ) ) ( not ( = ?auto_917041 ?auto_917043 ) ) ( not ( = ?auto_917041 ?auto_917045 ) ) ( not ( = ?auto_917041 ?auto_917044 ) ) ( not ( = ?auto_917041 ?auto_917046 ) ) ( not ( = ?auto_917042 ?auto_917039 ) ) ( not ( = ?auto_917042 ?auto_917043 ) ) ( not ( = ?auto_917042 ?auto_917045 ) ) ( not ( = ?auto_917042 ?auto_917044 ) ) ( not ( = ?auto_917042 ?auto_917046 ) ) ( not ( = ?auto_917039 ?auto_917043 ) ) ( not ( = ?auto_917039 ?auto_917045 ) ) ( not ( = ?auto_917039 ?auto_917044 ) ) ( not ( = ?auto_917039 ?auto_917046 ) ) ( not ( = ?auto_917043 ?auto_917045 ) ) ( not ( = ?auto_917043 ?auto_917044 ) ) ( not ( = ?auto_917043 ?auto_917046 ) ) ( not ( = ?auto_917045 ?auto_917044 ) ) ( not ( = ?auto_917045 ?auto_917046 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_917044 ?auto_917046 )
      ( MAKE-7CRATE-VERIFY ?auto_917040 ?auto_917041 ?auto_917042 ?auto_917039 ?auto_917043 ?auto_917045 ?auto_917044 ?auto_917046 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917095 - SURFACE
      ?auto_917096 - SURFACE
      ?auto_917097 - SURFACE
      ?auto_917094 - SURFACE
      ?auto_917098 - SURFACE
      ?auto_917100 - SURFACE
      ?auto_917099 - SURFACE
      ?auto_917101 - SURFACE
    )
    :vars
    (
      ?auto_917102 - HOIST
      ?auto_917103 - PLACE
      ?auto_917104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_917102 ?auto_917103 ) ( SURFACE-AT ?auto_917099 ?auto_917103 ) ( CLEAR ?auto_917099 ) ( IS-CRATE ?auto_917101 ) ( not ( = ?auto_917099 ?auto_917101 ) ) ( TRUCK-AT ?auto_917104 ?auto_917103 ) ( AVAILABLE ?auto_917102 ) ( IN ?auto_917101 ?auto_917104 ) ( ON ?auto_917099 ?auto_917100 ) ( not ( = ?auto_917100 ?auto_917099 ) ) ( not ( = ?auto_917100 ?auto_917101 ) ) ( ON ?auto_917096 ?auto_917095 ) ( ON ?auto_917097 ?auto_917096 ) ( ON ?auto_917094 ?auto_917097 ) ( ON ?auto_917098 ?auto_917094 ) ( ON ?auto_917100 ?auto_917098 ) ( not ( = ?auto_917095 ?auto_917096 ) ) ( not ( = ?auto_917095 ?auto_917097 ) ) ( not ( = ?auto_917095 ?auto_917094 ) ) ( not ( = ?auto_917095 ?auto_917098 ) ) ( not ( = ?auto_917095 ?auto_917100 ) ) ( not ( = ?auto_917095 ?auto_917099 ) ) ( not ( = ?auto_917095 ?auto_917101 ) ) ( not ( = ?auto_917096 ?auto_917097 ) ) ( not ( = ?auto_917096 ?auto_917094 ) ) ( not ( = ?auto_917096 ?auto_917098 ) ) ( not ( = ?auto_917096 ?auto_917100 ) ) ( not ( = ?auto_917096 ?auto_917099 ) ) ( not ( = ?auto_917096 ?auto_917101 ) ) ( not ( = ?auto_917097 ?auto_917094 ) ) ( not ( = ?auto_917097 ?auto_917098 ) ) ( not ( = ?auto_917097 ?auto_917100 ) ) ( not ( = ?auto_917097 ?auto_917099 ) ) ( not ( = ?auto_917097 ?auto_917101 ) ) ( not ( = ?auto_917094 ?auto_917098 ) ) ( not ( = ?auto_917094 ?auto_917100 ) ) ( not ( = ?auto_917094 ?auto_917099 ) ) ( not ( = ?auto_917094 ?auto_917101 ) ) ( not ( = ?auto_917098 ?auto_917100 ) ) ( not ( = ?auto_917098 ?auto_917099 ) ) ( not ( = ?auto_917098 ?auto_917101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917100 ?auto_917099 ?auto_917101 )
      ( MAKE-7CRATE-VERIFY ?auto_917095 ?auto_917096 ?auto_917097 ?auto_917094 ?auto_917098 ?auto_917100 ?auto_917099 ?auto_917101 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917158 - SURFACE
      ?auto_917159 - SURFACE
      ?auto_917160 - SURFACE
      ?auto_917157 - SURFACE
      ?auto_917161 - SURFACE
      ?auto_917163 - SURFACE
      ?auto_917162 - SURFACE
      ?auto_917164 - SURFACE
    )
    :vars
    (
      ?auto_917165 - HOIST
      ?auto_917167 - PLACE
      ?auto_917166 - TRUCK
      ?auto_917168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_917165 ?auto_917167 ) ( SURFACE-AT ?auto_917162 ?auto_917167 ) ( CLEAR ?auto_917162 ) ( IS-CRATE ?auto_917164 ) ( not ( = ?auto_917162 ?auto_917164 ) ) ( AVAILABLE ?auto_917165 ) ( IN ?auto_917164 ?auto_917166 ) ( ON ?auto_917162 ?auto_917163 ) ( not ( = ?auto_917163 ?auto_917162 ) ) ( not ( = ?auto_917163 ?auto_917164 ) ) ( TRUCK-AT ?auto_917166 ?auto_917168 ) ( not ( = ?auto_917168 ?auto_917167 ) ) ( ON ?auto_917159 ?auto_917158 ) ( ON ?auto_917160 ?auto_917159 ) ( ON ?auto_917157 ?auto_917160 ) ( ON ?auto_917161 ?auto_917157 ) ( ON ?auto_917163 ?auto_917161 ) ( not ( = ?auto_917158 ?auto_917159 ) ) ( not ( = ?auto_917158 ?auto_917160 ) ) ( not ( = ?auto_917158 ?auto_917157 ) ) ( not ( = ?auto_917158 ?auto_917161 ) ) ( not ( = ?auto_917158 ?auto_917163 ) ) ( not ( = ?auto_917158 ?auto_917162 ) ) ( not ( = ?auto_917158 ?auto_917164 ) ) ( not ( = ?auto_917159 ?auto_917160 ) ) ( not ( = ?auto_917159 ?auto_917157 ) ) ( not ( = ?auto_917159 ?auto_917161 ) ) ( not ( = ?auto_917159 ?auto_917163 ) ) ( not ( = ?auto_917159 ?auto_917162 ) ) ( not ( = ?auto_917159 ?auto_917164 ) ) ( not ( = ?auto_917160 ?auto_917157 ) ) ( not ( = ?auto_917160 ?auto_917161 ) ) ( not ( = ?auto_917160 ?auto_917163 ) ) ( not ( = ?auto_917160 ?auto_917162 ) ) ( not ( = ?auto_917160 ?auto_917164 ) ) ( not ( = ?auto_917157 ?auto_917161 ) ) ( not ( = ?auto_917157 ?auto_917163 ) ) ( not ( = ?auto_917157 ?auto_917162 ) ) ( not ( = ?auto_917157 ?auto_917164 ) ) ( not ( = ?auto_917161 ?auto_917163 ) ) ( not ( = ?auto_917161 ?auto_917162 ) ) ( not ( = ?auto_917161 ?auto_917164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917163 ?auto_917162 ?auto_917164 )
      ( MAKE-7CRATE-VERIFY ?auto_917158 ?auto_917159 ?auto_917160 ?auto_917157 ?auto_917161 ?auto_917163 ?auto_917162 ?auto_917164 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917228 - SURFACE
      ?auto_917229 - SURFACE
      ?auto_917230 - SURFACE
      ?auto_917227 - SURFACE
      ?auto_917231 - SURFACE
      ?auto_917233 - SURFACE
      ?auto_917232 - SURFACE
      ?auto_917234 - SURFACE
    )
    :vars
    (
      ?auto_917237 - HOIST
      ?auto_917239 - PLACE
      ?auto_917236 - TRUCK
      ?auto_917235 - PLACE
      ?auto_917238 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_917237 ?auto_917239 ) ( SURFACE-AT ?auto_917232 ?auto_917239 ) ( CLEAR ?auto_917232 ) ( IS-CRATE ?auto_917234 ) ( not ( = ?auto_917232 ?auto_917234 ) ) ( AVAILABLE ?auto_917237 ) ( ON ?auto_917232 ?auto_917233 ) ( not ( = ?auto_917233 ?auto_917232 ) ) ( not ( = ?auto_917233 ?auto_917234 ) ) ( TRUCK-AT ?auto_917236 ?auto_917235 ) ( not ( = ?auto_917235 ?auto_917239 ) ) ( HOIST-AT ?auto_917238 ?auto_917235 ) ( LIFTING ?auto_917238 ?auto_917234 ) ( not ( = ?auto_917237 ?auto_917238 ) ) ( ON ?auto_917229 ?auto_917228 ) ( ON ?auto_917230 ?auto_917229 ) ( ON ?auto_917227 ?auto_917230 ) ( ON ?auto_917231 ?auto_917227 ) ( ON ?auto_917233 ?auto_917231 ) ( not ( = ?auto_917228 ?auto_917229 ) ) ( not ( = ?auto_917228 ?auto_917230 ) ) ( not ( = ?auto_917228 ?auto_917227 ) ) ( not ( = ?auto_917228 ?auto_917231 ) ) ( not ( = ?auto_917228 ?auto_917233 ) ) ( not ( = ?auto_917228 ?auto_917232 ) ) ( not ( = ?auto_917228 ?auto_917234 ) ) ( not ( = ?auto_917229 ?auto_917230 ) ) ( not ( = ?auto_917229 ?auto_917227 ) ) ( not ( = ?auto_917229 ?auto_917231 ) ) ( not ( = ?auto_917229 ?auto_917233 ) ) ( not ( = ?auto_917229 ?auto_917232 ) ) ( not ( = ?auto_917229 ?auto_917234 ) ) ( not ( = ?auto_917230 ?auto_917227 ) ) ( not ( = ?auto_917230 ?auto_917231 ) ) ( not ( = ?auto_917230 ?auto_917233 ) ) ( not ( = ?auto_917230 ?auto_917232 ) ) ( not ( = ?auto_917230 ?auto_917234 ) ) ( not ( = ?auto_917227 ?auto_917231 ) ) ( not ( = ?auto_917227 ?auto_917233 ) ) ( not ( = ?auto_917227 ?auto_917232 ) ) ( not ( = ?auto_917227 ?auto_917234 ) ) ( not ( = ?auto_917231 ?auto_917233 ) ) ( not ( = ?auto_917231 ?auto_917232 ) ) ( not ( = ?auto_917231 ?auto_917234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917233 ?auto_917232 ?auto_917234 )
      ( MAKE-7CRATE-VERIFY ?auto_917228 ?auto_917229 ?auto_917230 ?auto_917227 ?auto_917231 ?auto_917233 ?auto_917232 ?auto_917234 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917305 - SURFACE
      ?auto_917306 - SURFACE
      ?auto_917307 - SURFACE
      ?auto_917304 - SURFACE
      ?auto_917308 - SURFACE
      ?auto_917310 - SURFACE
      ?auto_917309 - SURFACE
      ?auto_917311 - SURFACE
    )
    :vars
    (
      ?auto_917316 - HOIST
      ?auto_917312 - PLACE
      ?auto_917317 - TRUCK
      ?auto_917314 - PLACE
      ?auto_917313 - HOIST
      ?auto_917315 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_917316 ?auto_917312 ) ( SURFACE-AT ?auto_917309 ?auto_917312 ) ( CLEAR ?auto_917309 ) ( IS-CRATE ?auto_917311 ) ( not ( = ?auto_917309 ?auto_917311 ) ) ( AVAILABLE ?auto_917316 ) ( ON ?auto_917309 ?auto_917310 ) ( not ( = ?auto_917310 ?auto_917309 ) ) ( not ( = ?auto_917310 ?auto_917311 ) ) ( TRUCK-AT ?auto_917317 ?auto_917314 ) ( not ( = ?auto_917314 ?auto_917312 ) ) ( HOIST-AT ?auto_917313 ?auto_917314 ) ( not ( = ?auto_917316 ?auto_917313 ) ) ( AVAILABLE ?auto_917313 ) ( SURFACE-AT ?auto_917311 ?auto_917314 ) ( ON ?auto_917311 ?auto_917315 ) ( CLEAR ?auto_917311 ) ( not ( = ?auto_917309 ?auto_917315 ) ) ( not ( = ?auto_917311 ?auto_917315 ) ) ( not ( = ?auto_917310 ?auto_917315 ) ) ( ON ?auto_917306 ?auto_917305 ) ( ON ?auto_917307 ?auto_917306 ) ( ON ?auto_917304 ?auto_917307 ) ( ON ?auto_917308 ?auto_917304 ) ( ON ?auto_917310 ?auto_917308 ) ( not ( = ?auto_917305 ?auto_917306 ) ) ( not ( = ?auto_917305 ?auto_917307 ) ) ( not ( = ?auto_917305 ?auto_917304 ) ) ( not ( = ?auto_917305 ?auto_917308 ) ) ( not ( = ?auto_917305 ?auto_917310 ) ) ( not ( = ?auto_917305 ?auto_917309 ) ) ( not ( = ?auto_917305 ?auto_917311 ) ) ( not ( = ?auto_917305 ?auto_917315 ) ) ( not ( = ?auto_917306 ?auto_917307 ) ) ( not ( = ?auto_917306 ?auto_917304 ) ) ( not ( = ?auto_917306 ?auto_917308 ) ) ( not ( = ?auto_917306 ?auto_917310 ) ) ( not ( = ?auto_917306 ?auto_917309 ) ) ( not ( = ?auto_917306 ?auto_917311 ) ) ( not ( = ?auto_917306 ?auto_917315 ) ) ( not ( = ?auto_917307 ?auto_917304 ) ) ( not ( = ?auto_917307 ?auto_917308 ) ) ( not ( = ?auto_917307 ?auto_917310 ) ) ( not ( = ?auto_917307 ?auto_917309 ) ) ( not ( = ?auto_917307 ?auto_917311 ) ) ( not ( = ?auto_917307 ?auto_917315 ) ) ( not ( = ?auto_917304 ?auto_917308 ) ) ( not ( = ?auto_917304 ?auto_917310 ) ) ( not ( = ?auto_917304 ?auto_917309 ) ) ( not ( = ?auto_917304 ?auto_917311 ) ) ( not ( = ?auto_917304 ?auto_917315 ) ) ( not ( = ?auto_917308 ?auto_917310 ) ) ( not ( = ?auto_917308 ?auto_917309 ) ) ( not ( = ?auto_917308 ?auto_917311 ) ) ( not ( = ?auto_917308 ?auto_917315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917310 ?auto_917309 ?auto_917311 )
      ( MAKE-7CRATE-VERIFY ?auto_917305 ?auto_917306 ?auto_917307 ?auto_917304 ?auto_917308 ?auto_917310 ?auto_917309 ?auto_917311 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917383 - SURFACE
      ?auto_917384 - SURFACE
      ?auto_917385 - SURFACE
      ?auto_917382 - SURFACE
      ?auto_917386 - SURFACE
      ?auto_917388 - SURFACE
      ?auto_917387 - SURFACE
      ?auto_917389 - SURFACE
    )
    :vars
    (
      ?auto_917391 - HOIST
      ?auto_917393 - PLACE
      ?auto_917395 - PLACE
      ?auto_917390 - HOIST
      ?auto_917394 - SURFACE
      ?auto_917392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_917391 ?auto_917393 ) ( SURFACE-AT ?auto_917387 ?auto_917393 ) ( CLEAR ?auto_917387 ) ( IS-CRATE ?auto_917389 ) ( not ( = ?auto_917387 ?auto_917389 ) ) ( AVAILABLE ?auto_917391 ) ( ON ?auto_917387 ?auto_917388 ) ( not ( = ?auto_917388 ?auto_917387 ) ) ( not ( = ?auto_917388 ?auto_917389 ) ) ( not ( = ?auto_917395 ?auto_917393 ) ) ( HOIST-AT ?auto_917390 ?auto_917395 ) ( not ( = ?auto_917391 ?auto_917390 ) ) ( AVAILABLE ?auto_917390 ) ( SURFACE-AT ?auto_917389 ?auto_917395 ) ( ON ?auto_917389 ?auto_917394 ) ( CLEAR ?auto_917389 ) ( not ( = ?auto_917387 ?auto_917394 ) ) ( not ( = ?auto_917389 ?auto_917394 ) ) ( not ( = ?auto_917388 ?auto_917394 ) ) ( TRUCK-AT ?auto_917392 ?auto_917393 ) ( ON ?auto_917384 ?auto_917383 ) ( ON ?auto_917385 ?auto_917384 ) ( ON ?auto_917382 ?auto_917385 ) ( ON ?auto_917386 ?auto_917382 ) ( ON ?auto_917388 ?auto_917386 ) ( not ( = ?auto_917383 ?auto_917384 ) ) ( not ( = ?auto_917383 ?auto_917385 ) ) ( not ( = ?auto_917383 ?auto_917382 ) ) ( not ( = ?auto_917383 ?auto_917386 ) ) ( not ( = ?auto_917383 ?auto_917388 ) ) ( not ( = ?auto_917383 ?auto_917387 ) ) ( not ( = ?auto_917383 ?auto_917389 ) ) ( not ( = ?auto_917383 ?auto_917394 ) ) ( not ( = ?auto_917384 ?auto_917385 ) ) ( not ( = ?auto_917384 ?auto_917382 ) ) ( not ( = ?auto_917384 ?auto_917386 ) ) ( not ( = ?auto_917384 ?auto_917388 ) ) ( not ( = ?auto_917384 ?auto_917387 ) ) ( not ( = ?auto_917384 ?auto_917389 ) ) ( not ( = ?auto_917384 ?auto_917394 ) ) ( not ( = ?auto_917385 ?auto_917382 ) ) ( not ( = ?auto_917385 ?auto_917386 ) ) ( not ( = ?auto_917385 ?auto_917388 ) ) ( not ( = ?auto_917385 ?auto_917387 ) ) ( not ( = ?auto_917385 ?auto_917389 ) ) ( not ( = ?auto_917385 ?auto_917394 ) ) ( not ( = ?auto_917382 ?auto_917386 ) ) ( not ( = ?auto_917382 ?auto_917388 ) ) ( not ( = ?auto_917382 ?auto_917387 ) ) ( not ( = ?auto_917382 ?auto_917389 ) ) ( not ( = ?auto_917382 ?auto_917394 ) ) ( not ( = ?auto_917386 ?auto_917388 ) ) ( not ( = ?auto_917386 ?auto_917387 ) ) ( not ( = ?auto_917386 ?auto_917389 ) ) ( not ( = ?auto_917386 ?auto_917394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917388 ?auto_917387 ?auto_917389 )
      ( MAKE-7CRATE-VERIFY ?auto_917383 ?auto_917384 ?auto_917385 ?auto_917382 ?auto_917386 ?auto_917388 ?auto_917387 ?auto_917389 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917461 - SURFACE
      ?auto_917462 - SURFACE
      ?auto_917463 - SURFACE
      ?auto_917460 - SURFACE
      ?auto_917464 - SURFACE
      ?auto_917466 - SURFACE
      ?auto_917465 - SURFACE
      ?auto_917467 - SURFACE
    )
    :vars
    (
      ?auto_917469 - HOIST
      ?auto_917470 - PLACE
      ?auto_917473 - PLACE
      ?auto_917468 - HOIST
      ?auto_917471 - SURFACE
      ?auto_917472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_917469 ?auto_917470 ) ( IS-CRATE ?auto_917467 ) ( not ( = ?auto_917465 ?auto_917467 ) ) ( not ( = ?auto_917466 ?auto_917465 ) ) ( not ( = ?auto_917466 ?auto_917467 ) ) ( not ( = ?auto_917473 ?auto_917470 ) ) ( HOIST-AT ?auto_917468 ?auto_917473 ) ( not ( = ?auto_917469 ?auto_917468 ) ) ( AVAILABLE ?auto_917468 ) ( SURFACE-AT ?auto_917467 ?auto_917473 ) ( ON ?auto_917467 ?auto_917471 ) ( CLEAR ?auto_917467 ) ( not ( = ?auto_917465 ?auto_917471 ) ) ( not ( = ?auto_917467 ?auto_917471 ) ) ( not ( = ?auto_917466 ?auto_917471 ) ) ( TRUCK-AT ?auto_917472 ?auto_917470 ) ( SURFACE-AT ?auto_917466 ?auto_917470 ) ( CLEAR ?auto_917466 ) ( LIFTING ?auto_917469 ?auto_917465 ) ( IS-CRATE ?auto_917465 ) ( ON ?auto_917462 ?auto_917461 ) ( ON ?auto_917463 ?auto_917462 ) ( ON ?auto_917460 ?auto_917463 ) ( ON ?auto_917464 ?auto_917460 ) ( ON ?auto_917466 ?auto_917464 ) ( not ( = ?auto_917461 ?auto_917462 ) ) ( not ( = ?auto_917461 ?auto_917463 ) ) ( not ( = ?auto_917461 ?auto_917460 ) ) ( not ( = ?auto_917461 ?auto_917464 ) ) ( not ( = ?auto_917461 ?auto_917466 ) ) ( not ( = ?auto_917461 ?auto_917465 ) ) ( not ( = ?auto_917461 ?auto_917467 ) ) ( not ( = ?auto_917461 ?auto_917471 ) ) ( not ( = ?auto_917462 ?auto_917463 ) ) ( not ( = ?auto_917462 ?auto_917460 ) ) ( not ( = ?auto_917462 ?auto_917464 ) ) ( not ( = ?auto_917462 ?auto_917466 ) ) ( not ( = ?auto_917462 ?auto_917465 ) ) ( not ( = ?auto_917462 ?auto_917467 ) ) ( not ( = ?auto_917462 ?auto_917471 ) ) ( not ( = ?auto_917463 ?auto_917460 ) ) ( not ( = ?auto_917463 ?auto_917464 ) ) ( not ( = ?auto_917463 ?auto_917466 ) ) ( not ( = ?auto_917463 ?auto_917465 ) ) ( not ( = ?auto_917463 ?auto_917467 ) ) ( not ( = ?auto_917463 ?auto_917471 ) ) ( not ( = ?auto_917460 ?auto_917464 ) ) ( not ( = ?auto_917460 ?auto_917466 ) ) ( not ( = ?auto_917460 ?auto_917465 ) ) ( not ( = ?auto_917460 ?auto_917467 ) ) ( not ( = ?auto_917460 ?auto_917471 ) ) ( not ( = ?auto_917464 ?auto_917466 ) ) ( not ( = ?auto_917464 ?auto_917465 ) ) ( not ( = ?auto_917464 ?auto_917467 ) ) ( not ( = ?auto_917464 ?auto_917471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917466 ?auto_917465 ?auto_917467 )
      ( MAKE-7CRATE-VERIFY ?auto_917461 ?auto_917462 ?auto_917463 ?auto_917460 ?auto_917464 ?auto_917466 ?auto_917465 ?auto_917467 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_917539 - SURFACE
      ?auto_917540 - SURFACE
      ?auto_917541 - SURFACE
      ?auto_917538 - SURFACE
      ?auto_917542 - SURFACE
      ?auto_917544 - SURFACE
      ?auto_917543 - SURFACE
      ?auto_917545 - SURFACE
    )
    :vars
    (
      ?auto_917551 - HOIST
      ?auto_917546 - PLACE
      ?auto_917549 - PLACE
      ?auto_917550 - HOIST
      ?auto_917548 - SURFACE
      ?auto_917547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_917551 ?auto_917546 ) ( IS-CRATE ?auto_917545 ) ( not ( = ?auto_917543 ?auto_917545 ) ) ( not ( = ?auto_917544 ?auto_917543 ) ) ( not ( = ?auto_917544 ?auto_917545 ) ) ( not ( = ?auto_917549 ?auto_917546 ) ) ( HOIST-AT ?auto_917550 ?auto_917549 ) ( not ( = ?auto_917551 ?auto_917550 ) ) ( AVAILABLE ?auto_917550 ) ( SURFACE-AT ?auto_917545 ?auto_917549 ) ( ON ?auto_917545 ?auto_917548 ) ( CLEAR ?auto_917545 ) ( not ( = ?auto_917543 ?auto_917548 ) ) ( not ( = ?auto_917545 ?auto_917548 ) ) ( not ( = ?auto_917544 ?auto_917548 ) ) ( TRUCK-AT ?auto_917547 ?auto_917546 ) ( SURFACE-AT ?auto_917544 ?auto_917546 ) ( CLEAR ?auto_917544 ) ( IS-CRATE ?auto_917543 ) ( AVAILABLE ?auto_917551 ) ( IN ?auto_917543 ?auto_917547 ) ( ON ?auto_917540 ?auto_917539 ) ( ON ?auto_917541 ?auto_917540 ) ( ON ?auto_917538 ?auto_917541 ) ( ON ?auto_917542 ?auto_917538 ) ( ON ?auto_917544 ?auto_917542 ) ( not ( = ?auto_917539 ?auto_917540 ) ) ( not ( = ?auto_917539 ?auto_917541 ) ) ( not ( = ?auto_917539 ?auto_917538 ) ) ( not ( = ?auto_917539 ?auto_917542 ) ) ( not ( = ?auto_917539 ?auto_917544 ) ) ( not ( = ?auto_917539 ?auto_917543 ) ) ( not ( = ?auto_917539 ?auto_917545 ) ) ( not ( = ?auto_917539 ?auto_917548 ) ) ( not ( = ?auto_917540 ?auto_917541 ) ) ( not ( = ?auto_917540 ?auto_917538 ) ) ( not ( = ?auto_917540 ?auto_917542 ) ) ( not ( = ?auto_917540 ?auto_917544 ) ) ( not ( = ?auto_917540 ?auto_917543 ) ) ( not ( = ?auto_917540 ?auto_917545 ) ) ( not ( = ?auto_917540 ?auto_917548 ) ) ( not ( = ?auto_917541 ?auto_917538 ) ) ( not ( = ?auto_917541 ?auto_917542 ) ) ( not ( = ?auto_917541 ?auto_917544 ) ) ( not ( = ?auto_917541 ?auto_917543 ) ) ( not ( = ?auto_917541 ?auto_917545 ) ) ( not ( = ?auto_917541 ?auto_917548 ) ) ( not ( = ?auto_917538 ?auto_917542 ) ) ( not ( = ?auto_917538 ?auto_917544 ) ) ( not ( = ?auto_917538 ?auto_917543 ) ) ( not ( = ?auto_917538 ?auto_917545 ) ) ( not ( = ?auto_917538 ?auto_917548 ) ) ( not ( = ?auto_917542 ?auto_917544 ) ) ( not ( = ?auto_917542 ?auto_917543 ) ) ( not ( = ?auto_917542 ?auto_917545 ) ) ( not ( = ?auto_917542 ?auto_917548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_917544 ?auto_917543 ?auto_917545 )
      ( MAKE-7CRATE-VERIFY ?auto_917539 ?auto_917540 ?auto_917541 ?auto_917538 ?auto_917542 ?auto_917544 ?auto_917543 ?auto_917545 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920458 - SURFACE
      ?auto_920459 - SURFACE
      ?auto_920460 - SURFACE
      ?auto_920457 - SURFACE
      ?auto_920461 - SURFACE
      ?auto_920463 - SURFACE
      ?auto_920462 - SURFACE
      ?auto_920464 - SURFACE
      ?auto_920465 - SURFACE
    )
    :vars
    (
      ?auto_920467 - HOIST
      ?auto_920466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_920467 ?auto_920466 ) ( SURFACE-AT ?auto_920464 ?auto_920466 ) ( CLEAR ?auto_920464 ) ( LIFTING ?auto_920467 ?auto_920465 ) ( IS-CRATE ?auto_920465 ) ( not ( = ?auto_920464 ?auto_920465 ) ) ( ON ?auto_920459 ?auto_920458 ) ( ON ?auto_920460 ?auto_920459 ) ( ON ?auto_920457 ?auto_920460 ) ( ON ?auto_920461 ?auto_920457 ) ( ON ?auto_920463 ?auto_920461 ) ( ON ?auto_920462 ?auto_920463 ) ( ON ?auto_920464 ?auto_920462 ) ( not ( = ?auto_920458 ?auto_920459 ) ) ( not ( = ?auto_920458 ?auto_920460 ) ) ( not ( = ?auto_920458 ?auto_920457 ) ) ( not ( = ?auto_920458 ?auto_920461 ) ) ( not ( = ?auto_920458 ?auto_920463 ) ) ( not ( = ?auto_920458 ?auto_920462 ) ) ( not ( = ?auto_920458 ?auto_920464 ) ) ( not ( = ?auto_920458 ?auto_920465 ) ) ( not ( = ?auto_920459 ?auto_920460 ) ) ( not ( = ?auto_920459 ?auto_920457 ) ) ( not ( = ?auto_920459 ?auto_920461 ) ) ( not ( = ?auto_920459 ?auto_920463 ) ) ( not ( = ?auto_920459 ?auto_920462 ) ) ( not ( = ?auto_920459 ?auto_920464 ) ) ( not ( = ?auto_920459 ?auto_920465 ) ) ( not ( = ?auto_920460 ?auto_920457 ) ) ( not ( = ?auto_920460 ?auto_920461 ) ) ( not ( = ?auto_920460 ?auto_920463 ) ) ( not ( = ?auto_920460 ?auto_920462 ) ) ( not ( = ?auto_920460 ?auto_920464 ) ) ( not ( = ?auto_920460 ?auto_920465 ) ) ( not ( = ?auto_920457 ?auto_920461 ) ) ( not ( = ?auto_920457 ?auto_920463 ) ) ( not ( = ?auto_920457 ?auto_920462 ) ) ( not ( = ?auto_920457 ?auto_920464 ) ) ( not ( = ?auto_920457 ?auto_920465 ) ) ( not ( = ?auto_920461 ?auto_920463 ) ) ( not ( = ?auto_920461 ?auto_920462 ) ) ( not ( = ?auto_920461 ?auto_920464 ) ) ( not ( = ?auto_920461 ?auto_920465 ) ) ( not ( = ?auto_920463 ?auto_920462 ) ) ( not ( = ?auto_920463 ?auto_920464 ) ) ( not ( = ?auto_920463 ?auto_920465 ) ) ( not ( = ?auto_920462 ?auto_920464 ) ) ( not ( = ?auto_920462 ?auto_920465 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_920464 ?auto_920465 )
      ( MAKE-8CRATE-VERIFY ?auto_920458 ?auto_920459 ?auto_920460 ?auto_920457 ?auto_920461 ?auto_920463 ?auto_920462 ?auto_920464 ?auto_920465 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920525 - SURFACE
      ?auto_920526 - SURFACE
      ?auto_920527 - SURFACE
      ?auto_920524 - SURFACE
      ?auto_920528 - SURFACE
      ?auto_920530 - SURFACE
      ?auto_920529 - SURFACE
      ?auto_920531 - SURFACE
      ?auto_920532 - SURFACE
    )
    :vars
    (
      ?auto_920535 - HOIST
      ?auto_920534 - PLACE
      ?auto_920533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_920535 ?auto_920534 ) ( SURFACE-AT ?auto_920531 ?auto_920534 ) ( CLEAR ?auto_920531 ) ( IS-CRATE ?auto_920532 ) ( not ( = ?auto_920531 ?auto_920532 ) ) ( TRUCK-AT ?auto_920533 ?auto_920534 ) ( AVAILABLE ?auto_920535 ) ( IN ?auto_920532 ?auto_920533 ) ( ON ?auto_920531 ?auto_920529 ) ( not ( = ?auto_920529 ?auto_920531 ) ) ( not ( = ?auto_920529 ?auto_920532 ) ) ( ON ?auto_920526 ?auto_920525 ) ( ON ?auto_920527 ?auto_920526 ) ( ON ?auto_920524 ?auto_920527 ) ( ON ?auto_920528 ?auto_920524 ) ( ON ?auto_920530 ?auto_920528 ) ( ON ?auto_920529 ?auto_920530 ) ( not ( = ?auto_920525 ?auto_920526 ) ) ( not ( = ?auto_920525 ?auto_920527 ) ) ( not ( = ?auto_920525 ?auto_920524 ) ) ( not ( = ?auto_920525 ?auto_920528 ) ) ( not ( = ?auto_920525 ?auto_920530 ) ) ( not ( = ?auto_920525 ?auto_920529 ) ) ( not ( = ?auto_920525 ?auto_920531 ) ) ( not ( = ?auto_920525 ?auto_920532 ) ) ( not ( = ?auto_920526 ?auto_920527 ) ) ( not ( = ?auto_920526 ?auto_920524 ) ) ( not ( = ?auto_920526 ?auto_920528 ) ) ( not ( = ?auto_920526 ?auto_920530 ) ) ( not ( = ?auto_920526 ?auto_920529 ) ) ( not ( = ?auto_920526 ?auto_920531 ) ) ( not ( = ?auto_920526 ?auto_920532 ) ) ( not ( = ?auto_920527 ?auto_920524 ) ) ( not ( = ?auto_920527 ?auto_920528 ) ) ( not ( = ?auto_920527 ?auto_920530 ) ) ( not ( = ?auto_920527 ?auto_920529 ) ) ( not ( = ?auto_920527 ?auto_920531 ) ) ( not ( = ?auto_920527 ?auto_920532 ) ) ( not ( = ?auto_920524 ?auto_920528 ) ) ( not ( = ?auto_920524 ?auto_920530 ) ) ( not ( = ?auto_920524 ?auto_920529 ) ) ( not ( = ?auto_920524 ?auto_920531 ) ) ( not ( = ?auto_920524 ?auto_920532 ) ) ( not ( = ?auto_920528 ?auto_920530 ) ) ( not ( = ?auto_920528 ?auto_920529 ) ) ( not ( = ?auto_920528 ?auto_920531 ) ) ( not ( = ?auto_920528 ?auto_920532 ) ) ( not ( = ?auto_920530 ?auto_920529 ) ) ( not ( = ?auto_920530 ?auto_920531 ) ) ( not ( = ?auto_920530 ?auto_920532 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920529 ?auto_920531 ?auto_920532 )
      ( MAKE-8CRATE-VERIFY ?auto_920525 ?auto_920526 ?auto_920527 ?auto_920524 ?auto_920528 ?auto_920530 ?auto_920529 ?auto_920531 ?auto_920532 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920601 - SURFACE
      ?auto_920602 - SURFACE
      ?auto_920603 - SURFACE
      ?auto_920600 - SURFACE
      ?auto_920604 - SURFACE
      ?auto_920606 - SURFACE
      ?auto_920605 - SURFACE
      ?auto_920607 - SURFACE
      ?auto_920608 - SURFACE
    )
    :vars
    (
      ?auto_920610 - HOIST
      ?auto_920612 - PLACE
      ?auto_920609 - TRUCK
      ?auto_920611 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_920610 ?auto_920612 ) ( SURFACE-AT ?auto_920607 ?auto_920612 ) ( CLEAR ?auto_920607 ) ( IS-CRATE ?auto_920608 ) ( not ( = ?auto_920607 ?auto_920608 ) ) ( AVAILABLE ?auto_920610 ) ( IN ?auto_920608 ?auto_920609 ) ( ON ?auto_920607 ?auto_920605 ) ( not ( = ?auto_920605 ?auto_920607 ) ) ( not ( = ?auto_920605 ?auto_920608 ) ) ( TRUCK-AT ?auto_920609 ?auto_920611 ) ( not ( = ?auto_920611 ?auto_920612 ) ) ( ON ?auto_920602 ?auto_920601 ) ( ON ?auto_920603 ?auto_920602 ) ( ON ?auto_920600 ?auto_920603 ) ( ON ?auto_920604 ?auto_920600 ) ( ON ?auto_920606 ?auto_920604 ) ( ON ?auto_920605 ?auto_920606 ) ( not ( = ?auto_920601 ?auto_920602 ) ) ( not ( = ?auto_920601 ?auto_920603 ) ) ( not ( = ?auto_920601 ?auto_920600 ) ) ( not ( = ?auto_920601 ?auto_920604 ) ) ( not ( = ?auto_920601 ?auto_920606 ) ) ( not ( = ?auto_920601 ?auto_920605 ) ) ( not ( = ?auto_920601 ?auto_920607 ) ) ( not ( = ?auto_920601 ?auto_920608 ) ) ( not ( = ?auto_920602 ?auto_920603 ) ) ( not ( = ?auto_920602 ?auto_920600 ) ) ( not ( = ?auto_920602 ?auto_920604 ) ) ( not ( = ?auto_920602 ?auto_920606 ) ) ( not ( = ?auto_920602 ?auto_920605 ) ) ( not ( = ?auto_920602 ?auto_920607 ) ) ( not ( = ?auto_920602 ?auto_920608 ) ) ( not ( = ?auto_920603 ?auto_920600 ) ) ( not ( = ?auto_920603 ?auto_920604 ) ) ( not ( = ?auto_920603 ?auto_920606 ) ) ( not ( = ?auto_920603 ?auto_920605 ) ) ( not ( = ?auto_920603 ?auto_920607 ) ) ( not ( = ?auto_920603 ?auto_920608 ) ) ( not ( = ?auto_920600 ?auto_920604 ) ) ( not ( = ?auto_920600 ?auto_920606 ) ) ( not ( = ?auto_920600 ?auto_920605 ) ) ( not ( = ?auto_920600 ?auto_920607 ) ) ( not ( = ?auto_920600 ?auto_920608 ) ) ( not ( = ?auto_920604 ?auto_920606 ) ) ( not ( = ?auto_920604 ?auto_920605 ) ) ( not ( = ?auto_920604 ?auto_920607 ) ) ( not ( = ?auto_920604 ?auto_920608 ) ) ( not ( = ?auto_920606 ?auto_920605 ) ) ( not ( = ?auto_920606 ?auto_920607 ) ) ( not ( = ?auto_920606 ?auto_920608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920605 ?auto_920607 ?auto_920608 )
      ( MAKE-8CRATE-VERIFY ?auto_920601 ?auto_920602 ?auto_920603 ?auto_920600 ?auto_920604 ?auto_920606 ?auto_920605 ?auto_920607 ?auto_920608 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920685 - SURFACE
      ?auto_920686 - SURFACE
      ?auto_920687 - SURFACE
      ?auto_920684 - SURFACE
      ?auto_920688 - SURFACE
      ?auto_920690 - SURFACE
      ?auto_920689 - SURFACE
      ?auto_920691 - SURFACE
      ?auto_920692 - SURFACE
    )
    :vars
    (
      ?auto_920694 - HOIST
      ?auto_920696 - PLACE
      ?auto_920697 - TRUCK
      ?auto_920693 - PLACE
      ?auto_920695 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_920694 ?auto_920696 ) ( SURFACE-AT ?auto_920691 ?auto_920696 ) ( CLEAR ?auto_920691 ) ( IS-CRATE ?auto_920692 ) ( not ( = ?auto_920691 ?auto_920692 ) ) ( AVAILABLE ?auto_920694 ) ( ON ?auto_920691 ?auto_920689 ) ( not ( = ?auto_920689 ?auto_920691 ) ) ( not ( = ?auto_920689 ?auto_920692 ) ) ( TRUCK-AT ?auto_920697 ?auto_920693 ) ( not ( = ?auto_920693 ?auto_920696 ) ) ( HOIST-AT ?auto_920695 ?auto_920693 ) ( LIFTING ?auto_920695 ?auto_920692 ) ( not ( = ?auto_920694 ?auto_920695 ) ) ( ON ?auto_920686 ?auto_920685 ) ( ON ?auto_920687 ?auto_920686 ) ( ON ?auto_920684 ?auto_920687 ) ( ON ?auto_920688 ?auto_920684 ) ( ON ?auto_920690 ?auto_920688 ) ( ON ?auto_920689 ?auto_920690 ) ( not ( = ?auto_920685 ?auto_920686 ) ) ( not ( = ?auto_920685 ?auto_920687 ) ) ( not ( = ?auto_920685 ?auto_920684 ) ) ( not ( = ?auto_920685 ?auto_920688 ) ) ( not ( = ?auto_920685 ?auto_920690 ) ) ( not ( = ?auto_920685 ?auto_920689 ) ) ( not ( = ?auto_920685 ?auto_920691 ) ) ( not ( = ?auto_920685 ?auto_920692 ) ) ( not ( = ?auto_920686 ?auto_920687 ) ) ( not ( = ?auto_920686 ?auto_920684 ) ) ( not ( = ?auto_920686 ?auto_920688 ) ) ( not ( = ?auto_920686 ?auto_920690 ) ) ( not ( = ?auto_920686 ?auto_920689 ) ) ( not ( = ?auto_920686 ?auto_920691 ) ) ( not ( = ?auto_920686 ?auto_920692 ) ) ( not ( = ?auto_920687 ?auto_920684 ) ) ( not ( = ?auto_920687 ?auto_920688 ) ) ( not ( = ?auto_920687 ?auto_920690 ) ) ( not ( = ?auto_920687 ?auto_920689 ) ) ( not ( = ?auto_920687 ?auto_920691 ) ) ( not ( = ?auto_920687 ?auto_920692 ) ) ( not ( = ?auto_920684 ?auto_920688 ) ) ( not ( = ?auto_920684 ?auto_920690 ) ) ( not ( = ?auto_920684 ?auto_920689 ) ) ( not ( = ?auto_920684 ?auto_920691 ) ) ( not ( = ?auto_920684 ?auto_920692 ) ) ( not ( = ?auto_920688 ?auto_920690 ) ) ( not ( = ?auto_920688 ?auto_920689 ) ) ( not ( = ?auto_920688 ?auto_920691 ) ) ( not ( = ?auto_920688 ?auto_920692 ) ) ( not ( = ?auto_920690 ?auto_920689 ) ) ( not ( = ?auto_920690 ?auto_920691 ) ) ( not ( = ?auto_920690 ?auto_920692 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920689 ?auto_920691 ?auto_920692 )
      ( MAKE-8CRATE-VERIFY ?auto_920685 ?auto_920686 ?auto_920687 ?auto_920684 ?auto_920688 ?auto_920690 ?auto_920689 ?auto_920691 ?auto_920692 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920777 - SURFACE
      ?auto_920778 - SURFACE
      ?auto_920779 - SURFACE
      ?auto_920776 - SURFACE
      ?auto_920780 - SURFACE
      ?auto_920782 - SURFACE
      ?auto_920781 - SURFACE
      ?auto_920783 - SURFACE
      ?auto_920784 - SURFACE
    )
    :vars
    (
      ?auto_920786 - HOIST
      ?auto_920789 - PLACE
      ?auto_920788 - TRUCK
      ?auto_920790 - PLACE
      ?auto_920787 - HOIST
      ?auto_920785 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_920786 ?auto_920789 ) ( SURFACE-AT ?auto_920783 ?auto_920789 ) ( CLEAR ?auto_920783 ) ( IS-CRATE ?auto_920784 ) ( not ( = ?auto_920783 ?auto_920784 ) ) ( AVAILABLE ?auto_920786 ) ( ON ?auto_920783 ?auto_920781 ) ( not ( = ?auto_920781 ?auto_920783 ) ) ( not ( = ?auto_920781 ?auto_920784 ) ) ( TRUCK-AT ?auto_920788 ?auto_920790 ) ( not ( = ?auto_920790 ?auto_920789 ) ) ( HOIST-AT ?auto_920787 ?auto_920790 ) ( not ( = ?auto_920786 ?auto_920787 ) ) ( AVAILABLE ?auto_920787 ) ( SURFACE-AT ?auto_920784 ?auto_920790 ) ( ON ?auto_920784 ?auto_920785 ) ( CLEAR ?auto_920784 ) ( not ( = ?auto_920783 ?auto_920785 ) ) ( not ( = ?auto_920784 ?auto_920785 ) ) ( not ( = ?auto_920781 ?auto_920785 ) ) ( ON ?auto_920778 ?auto_920777 ) ( ON ?auto_920779 ?auto_920778 ) ( ON ?auto_920776 ?auto_920779 ) ( ON ?auto_920780 ?auto_920776 ) ( ON ?auto_920782 ?auto_920780 ) ( ON ?auto_920781 ?auto_920782 ) ( not ( = ?auto_920777 ?auto_920778 ) ) ( not ( = ?auto_920777 ?auto_920779 ) ) ( not ( = ?auto_920777 ?auto_920776 ) ) ( not ( = ?auto_920777 ?auto_920780 ) ) ( not ( = ?auto_920777 ?auto_920782 ) ) ( not ( = ?auto_920777 ?auto_920781 ) ) ( not ( = ?auto_920777 ?auto_920783 ) ) ( not ( = ?auto_920777 ?auto_920784 ) ) ( not ( = ?auto_920777 ?auto_920785 ) ) ( not ( = ?auto_920778 ?auto_920779 ) ) ( not ( = ?auto_920778 ?auto_920776 ) ) ( not ( = ?auto_920778 ?auto_920780 ) ) ( not ( = ?auto_920778 ?auto_920782 ) ) ( not ( = ?auto_920778 ?auto_920781 ) ) ( not ( = ?auto_920778 ?auto_920783 ) ) ( not ( = ?auto_920778 ?auto_920784 ) ) ( not ( = ?auto_920778 ?auto_920785 ) ) ( not ( = ?auto_920779 ?auto_920776 ) ) ( not ( = ?auto_920779 ?auto_920780 ) ) ( not ( = ?auto_920779 ?auto_920782 ) ) ( not ( = ?auto_920779 ?auto_920781 ) ) ( not ( = ?auto_920779 ?auto_920783 ) ) ( not ( = ?auto_920779 ?auto_920784 ) ) ( not ( = ?auto_920779 ?auto_920785 ) ) ( not ( = ?auto_920776 ?auto_920780 ) ) ( not ( = ?auto_920776 ?auto_920782 ) ) ( not ( = ?auto_920776 ?auto_920781 ) ) ( not ( = ?auto_920776 ?auto_920783 ) ) ( not ( = ?auto_920776 ?auto_920784 ) ) ( not ( = ?auto_920776 ?auto_920785 ) ) ( not ( = ?auto_920780 ?auto_920782 ) ) ( not ( = ?auto_920780 ?auto_920781 ) ) ( not ( = ?auto_920780 ?auto_920783 ) ) ( not ( = ?auto_920780 ?auto_920784 ) ) ( not ( = ?auto_920780 ?auto_920785 ) ) ( not ( = ?auto_920782 ?auto_920781 ) ) ( not ( = ?auto_920782 ?auto_920783 ) ) ( not ( = ?auto_920782 ?auto_920784 ) ) ( not ( = ?auto_920782 ?auto_920785 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920781 ?auto_920783 ?auto_920784 )
      ( MAKE-8CRATE-VERIFY ?auto_920777 ?auto_920778 ?auto_920779 ?auto_920776 ?auto_920780 ?auto_920782 ?auto_920781 ?auto_920783 ?auto_920784 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920870 - SURFACE
      ?auto_920871 - SURFACE
      ?auto_920872 - SURFACE
      ?auto_920869 - SURFACE
      ?auto_920873 - SURFACE
      ?auto_920875 - SURFACE
      ?auto_920874 - SURFACE
      ?auto_920876 - SURFACE
      ?auto_920877 - SURFACE
    )
    :vars
    (
      ?auto_920880 - HOIST
      ?auto_920881 - PLACE
      ?auto_920882 - PLACE
      ?auto_920879 - HOIST
      ?auto_920883 - SURFACE
      ?auto_920878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_920880 ?auto_920881 ) ( SURFACE-AT ?auto_920876 ?auto_920881 ) ( CLEAR ?auto_920876 ) ( IS-CRATE ?auto_920877 ) ( not ( = ?auto_920876 ?auto_920877 ) ) ( AVAILABLE ?auto_920880 ) ( ON ?auto_920876 ?auto_920874 ) ( not ( = ?auto_920874 ?auto_920876 ) ) ( not ( = ?auto_920874 ?auto_920877 ) ) ( not ( = ?auto_920882 ?auto_920881 ) ) ( HOIST-AT ?auto_920879 ?auto_920882 ) ( not ( = ?auto_920880 ?auto_920879 ) ) ( AVAILABLE ?auto_920879 ) ( SURFACE-AT ?auto_920877 ?auto_920882 ) ( ON ?auto_920877 ?auto_920883 ) ( CLEAR ?auto_920877 ) ( not ( = ?auto_920876 ?auto_920883 ) ) ( not ( = ?auto_920877 ?auto_920883 ) ) ( not ( = ?auto_920874 ?auto_920883 ) ) ( TRUCK-AT ?auto_920878 ?auto_920881 ) ( ON ?auto_920871 ?auto_920870 ) ( ON ?auto_920872 ?auto_920871 ) ( ON ?auto_920869 ?auto_920872 ) ( ON ?auto_920873 ?auto_920869 ) ( ON ?auto_920875 ?auto_920873 ) ( ON ?auto_920874 ?auto_920875 ) ( not ( = ?auto_920870 ?auto_920871 ) ) ( not ( = ?auto_920870 ?auto_920872 ) ) ( not ( = ?auto_920870 ?auto_920869 ) ) ( not ( = ?auto_920870 ?auto_920873 ) ) ( not ( = ?auto_920870 ?auto_920875 ) ) ( not ( = ?auto_920870 ?auto_920874 ) ) ( not ( = ?auto_920870 ?auto_920876 ) ) ( not ( = ?auto_920870 ?auto_920877 ) ) ( not ( = ?auto_920870 ?auto_920883 ) ) ( not ( = ?auto_920871 ?auto_920872 ) ) ( not ( = ?auto_920871 ?auto_920869 ) ) ( not ( = ?auto_920871 ?auto_920873 ) ) ( not ( = ?auto_920871 ?auto_920875 ) ) ( not ( = ?auto_920871 ?auto_920874 ) ) ( not ( = ?auto_920871 ?auto_920876 ) ) ( not ( = ?auto_920871 ?auto_920877 ) ) ( not ( = ?auto_920871 ?auto_920883 ) ) ( not ( = ?auto_920872 ?auto_920869 ) ) ( not ( = ?auto_920872 ?auto_920873 ) ) ( not ( = ?auto_920872 ?auto_920875 ) ) ( not ( = ?auto_920872 ?auto_920874 ) ) ( not ( = ?auto_920872 ?auto_920876 ) ) ( not ( = ?auto_920872 ?auto_920877 ) ) ( not ( = ?auto_920872 ?auto_920883 ) ) ( not ( = ?auto_920869 ?auto_920873 ) ) ( not ( = ?auto_920869 ?auto_920875 ) ) ( not ( = ?auto_920869 ?auto_920874 ) ) ( not ( = ?auto_920869 ?auto_920876 ) ) ( not ( = ?auto_920869 ?auto_920877 ) ) ( not ( = ?auto_920869 ?auto_920883 ) ) ( not ( = ?auto_920873 ?auto_920875 ) ) ( not ( = ?auto_920873 ?auto_920874 ) ) ( not ( = ?auto_920873 ?auto_920876 ) ) ( not ( = ?auto_920873 ?auto_920877 ) ) ( not ( = ?auto_920873 ?auto_920883 ) ) ( not ( = ?auto_920875 ?auto_920874 ) ) ( not ( = ?auto_920875 ?auto_920876 ) ) ( not ( = ?auto_920875 ?auto_920877 ) ) ( not ( = ?auto_920875 ?auto_920883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920874 ?auto_920876 ?auto_920877 )
      ( MAKE-8CRATE-VERIFY ?auto_920870 ?auto_920871 ?auto_920872 ?auto_920869 ?auto_920873 ?auto_920875 ?auto_920874 ?auto_920876 ?auto_920877 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_920963 - SURFACE
      ?auto_920964 - SURFACE
      ?auto_920965 - SURFACE
      ?auto_920962 - SURFACE
      ?auto_920966 - SURFACE
      ?auto_920968 - SURFACE
      ?auto_920967 - SURFACE
      ?auto_920969 - SURFACE
      ?auto_920970 - SURFACE
    )
    :vars
    (
      ?auto_920974 - HOIST
      ?auto_920971 - PLACE
      ?auto_920972 - PLACE
      ?auto_920973 - HOIST
      ?auto_920976 - SURFACE
      ?auto_920975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_920974 ?auto_920971 ) ( IS-CRATE ?auto_920970 ) ( not ( = ?auto_920969 ?auto_920970 ) ) ( not ( = ?auto_920967 ?auto_920969 ) ) ( not ( = ?auto_920967 ?auto_920970 ) ) ( not ( = ?auto_920972 ?auto_920971 ) ) ( HOIST-AT ?auto_920973 ?auto_920972 ) ( not ( = ?auto_920974 ?auto_920973 ) ) ( AVAILABLE ?auto_920973 ) ( SURFACE-AT ?auto_920970 ?auto_920972 ) ( ON ?auto_920970 ?auto_920976 ) ( CLEAR ?auto_920970 ) ( not ( = ?auto_920969 ?auto_920976 ) ) ( not ( = ?auto_920970 ?auto_920976 ) ) ( not ( = ?auto_920967 ?auto_920976 ) ) ( TRUCK-AT ?auto_920975 ?auto_920971 ) ( SURFACE-AT ?auto_920967 ?auto_920971 ) ( CLEAR ?auto_920967 ) ( LIFTING ?auto_920974 ?auto_920969 ) ( IS-CRATE ?auto_920969 ) ( ON ?auto_920964 ?auto_920963 ) ( ON ?auto_920965 ?auto_920964 ) ( ON ?auto_920962 ?auto_920965 ) ( ON ?auto_920966 ?auto_920962 ) ( ON ?auto_920968 ?auto_920966 ) ( ON ?auto_920967 ?auto_920968 ) ( not ( = ?auto_920963 ?auto_920964 ) ) ( not ( = ?auto_920963 ?auto_920965 ) ) ( not ( = ?auto_920963 ?auto_920962 ) ) ( not ( = ?auto_920963 ?auto_920966 ) ) ( not ( = ?auto_920963 ?auto_920968 ) ) ( not ( = ?auto_920963 ?auto_920967 ) ) ( not ( = ?auto_920963 ?auto_920969 ) ) ( not ( = ?auto_920963 ?auto_920970 ) ) ( not ( = ?auto_920963 ?auto_920976 ) ) ( not ( = ?auto_920964 ?auto_920965 ) ) ( not ( = ?auto_920964 ?auto_920962 ) ) ( not ( = ?auto_920964 ?auto_920966 ) ) ( not ( = ?auto_920964 ?auto_920968 ) ) ( not ( = ?auto_920964 ?auto_920967 ) ) ( not ( = ?auto_920964 ?auto_920969 ) ) ( not ( = ?auto_920964 ?auto_920970 ) ) ( not ( = ?auto_920964 ?auto_920976 ) ) ( not ( = ?auto_920965 ?auto_920962 ) ) ( not ( = ?auto_920965 ?auto_920966 ) ) ( not ( = ?auto_920965 ?auto_920968 ) ) ( not ( = ?auto_920965 ?auto_920967 ) ) ( not ( = ?auto_920965 ?auto_920969 ) ) ( not ( = ?auto_920965 ?auto_920970 ) ) ( not ( = ?auto_920965 ?auto_920976 ) ) ( not ( = ?auto_920962 ?auto_920966 ) ) ( not ( = ?auto_920962 ?auto_920968 ) ) ( not ( = ?auto_920962 ?auto_920967 ) ) ( not ( = ?auto_920962 ?auto_920969 ) ) ( not ( = ?auto_920962 ?auto_920970 ) ) ( not ( = ?auto_920962 ?auto_920976 ) ) ( not ( = ?auto_920966 ?auto_920968 ) ) ( not ( = ?auto_920966 ?auto_920967 ) ) ( not ( = ?auto_920966 ?auto_920969 ) ) ( not ( = ?auto_920966 ?auto_920970 ) ) ( not ( = ?auto_920966 ?auto_920976 ) ) ( not ( = ?auto_920968 ?auto_920967 ) ) ( not ( = ?auto_920968 ?auto_920969 ) ) ( not ( = ?auto_920968 ?auto_920970 ) ) ( not ( = ?auto_920968 ?auto_920976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_920967 ?auto_920969 ?auto_920970 )
      ( MAKE-8CRATE-VERIFY ?auto_920963 ?auto_920964 ?auto_920965 ?auto_920962 ?auto_920966 ?auto_920968 ?auto_920967 ?auto_920969 ?auto_920970 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_921056 - SURFACE
      ?auto_921057 - SURFACE
      ?auto_921058 - SURFACE
      ?auto_921055 - SURFACE
      ?auto_921059 - SURFACE
      ?auto_921061 - SURFACE
      ?auto_921060 - SURFACE
      ?auto_921062 - SURFACE
      ?auto_921063 - SURFACE
    )
    :vars
    (
      ?auto_921069 - HOIST
      ?auto_921066 - PLACE
      ?auto_921067 - PLACE
      ?auto_921068 - HOIST
      ?auto_921064 - SURFACE
      ?auto_921065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_921069 ?auto_921066 ) ( IS-CRATE ?auto_921063 ) ( not ( = ?auto_921062 ?auto_921063 ) ) ( not ( = ?auto_921060 ?auto_921062 ) ) ( not ( = ?auto_921060 ?auto_921063 ) ) ( not ( = ?auto_921067 ?auto_921066 ) ) ( HOIST-AT ?auto_921068 ?auto_921067 ) ( not ( = ?auto_921069 ?auto_921068 ) ) ( AVAILABLE ?auto_921068 ) ( SURFACE-AT ?auto_921063 ?auto_921067 ) ( ON ?auto_921063 ?auto_921064 ) ( CLEAR ?auto_921063 ) ( not ( = ?auto_921062 ?auto_921064 ) ) ( not ( = ?auto_921063 ?auto_921064 ) ) ( not ( = ?auto_921060 ?auto_921064 ) ) ( TRUCK-AT ?auto_921065 ?auto_921066 ) ( SURFACE-AT ?auto_921060 ?auto_921066 ) ( CLEAR ?auto_921060 ) ( IS-CRATE ?auto_921062 ) ( AVAILABLE ?auto_921069 ) ( IN ?auto_921062 ?auto_921065 ) ( ON ?auto_921057 ?auto_921056 ) ( ON ?auto_921058 ?auto_921057 ) ( ON ?auto_921055 ?auto_921058 ) ( ON ?auto_921059 ?auto_921055 ) ( ON ?auto_921061 ?auto_921059 ) ( ON ?auto_921060 ?auto_921061 ) ( not ( = ?auto_921056 ?auto_921057 ) ) ( not ( = ?auto_921056 ?auto_921058 ) ) ( not ( = ?auto_921056 ?auto_921055 ) ) ( not ( = ?auto_921056 ?auto_921059 ) ) ( not ( = ?auto_921056 ?auto_921061 ) ) ( not ( = ?auto_921056 ?auto_921060 ) ) ( not ( = ?auto_921056 ?auto_921062 ) ) ( not ( = ?auto_921056 ?auto_921063 ) ) ( not ( = ?auto_921056 ?auto_921064 ) ) ( not ( = ?auto_921057 ?auto_921058 ) ) ( not ( = ?auto_921057 ?auto_921055 ) ) ( not ( = ?auto_921057 ?auto_921059 ) ) ( not ( = ?auto_921057 ?auto_921061 ) ) ( not ( = ?auto_921057 ?auto_921060 ) ) ( not ( = ?auto_921057 ?auto_921062 ) ) ( not ( = ?auto_921057 ?auto_921063 ) ) ( not ( = ?auto_921057 ?auto_921064 ) ) ( not ( = ?auto_921058 ?auto_921055 ) ) ( not ( = ?auto_921058 ?auto_921059 ) ) ( not ( = ?auto_921058 ?auto_921061 ) ) ( not ( = ?auto_921058 ?auto_921060 ) ) ( not ( = ?auto_921058 ?auto_921062 ) ) ( not ( = ?auto_921058 ?auto_921063 ) ) ( not ( = ?auto_921058 ?auto_921064 ) ) ( not ( = ?auto_921055 ?auto_921059 ) ) ( not ( = ?auto_921055 ?auto_921061 ) ) ( not ( = ?auto_921055 ?auto_921060 ) ) ( not ( = ?auto_921055 ?auto_921062 ) ) ( not ( = ?auto_921055 ?auto_921063 ) ) ( not ( = ?auto_921055 ?auto_921064 ) ) ( not ( = ?auto_921059 ?auto_921061 ) ) ( not ( = ?auto_921059 ?auto_921060 ) ) ( not ( = ?auto_921059 ?auto_921062 ) ) ( not ( = ?auto_921059 ?auto_921063 ) ) ( not ( = ?auto_921059 ?auto_921064 ) ) ( not ( = ?auto_921061 ?auto_921060 ) ) ( not ( = ?auto_921061 ?auto_921062 ) ) ( not ( = ?auto_921061 ?auto_921063 ) ) ( not ( = ?auto_921061 ?auto_921064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_921060 ?auto_921062 ?auto_921063 )
      ( MAKE-8CRATE-VERIFY ?auto_921056 ?auto_921057 ?auto_921058 ?auto_921055 ?auto_921059 ?auto_921061 ?auto_921060 ?auto_921062 ?auto_921063 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_924750 - SURFACE
      ?auto_924751 - SURFACE
    )
    :vars
    (
      ?auto_924754 - HOIST
      ?auto_924753 - PLACE
      ?auto_924752 - SURFACE
      ?auto_924755 - TRUCK
      ?auto_924756 - PLACE
      ?auto_924757 - HOIST
      ?auto_924758 - SURFACE
      ?auto_924759 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_924754 ?auto_924753 ) ( SURFACE-AT ?auto_924750 ?auto_924753 ) ( CLEAR ?auto_924750 ) ( IS-CRATE ?auto_924751 ) ( not ( = ?auto_924750 ?auto_924751 ) ) ( AVAILABLE ?auto_924754 ) ( ON ?auto_924750 ?auto_924752 ) ( not ( = ?auto_924752 ?auto_924750 ) ) ( not ( = ?auto_924752 ?auto_924751 ) ) ( TRUCK-AT ?auto_924755 ?auto_924756 ) ( not ( = ?auto_924756 ?auto_924753 ) ) ( HOIST-AT ?auto_924757 ?auto_924756 ) ( not ( = ?auto_924754 ?auto_924757 ) ) ( SURFACE-AT ?auto_924751 ?auto_924756 ) ( ON ?auto_924751 ?auto_924758 ) ( CLEAR ?auto_924751 ) ( not ( = ?auto_924750 ?auto_924758 ) ) ( not ( = ?auto_924751 ?auto_924758 ) ) ( not ( = ?auto_924752 ?auto_924758 ) ) ( LIFTING ?auto_924757 ?auto_924759 ) ( IS-CRATE ?auto_924759 ) ( not ( = ?auto_924750 ?auto_924759 ) ) ( not ( = ?auto_924751 ?auto_924759 ) ) ( not ( = ?auto_924752 ?auto_924759 ) ) ( not ( = ?auto_924758 ?auto_924759 ) ) )
    :subtasks
    ( ( !LOAD ?auto_924757 ?auto_924759 ?auto_924755 ?auto_924756 )
      ( MAKE-1CRATE ?auto_924750 ?auto_924751 )
      ( MAKE-1CRATE-VERIFY ?auto_924750 ?auto_924751 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925164 - SURFACE
      ?auto_925165 - SURFACE
      ?auto_925166 - SURFACE
      ?auto_925163 - SURFACE
      ?auto_925167 - SURFACE
      ?auto_925169 - SURFACE
      ?auto_925168 - SURFACE
      ?auto_925170 - SURFACE
      ?auto_925171 - SURFACE
      ?auto_925172 - SURFACE
    )
    :vars
    (
      ?auto_925173 - HOIST
      ?auto_925174 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_925173 ?auto_925174 ) ( SURFACE-AT ?auto_925171 ?auto_925174 ) ( CLEAR ?auto_925171 ) ( LIFTING ?auto_925173 ?auto_925172 ) ( IS-CRATE ?auto_925172 ) ( not ( = ?auto_925171 ?auto_925172 ) ) ( ON ?auto_925165 ?auto_925164 ) ( ON ?auto_925166 ?auto_925165 ) ( ON ?auto_925163 ?auto_925166 ) ( ON ?auto_925167 ?auto_925163 ) ( ON ?auto_925169 ?auto_925167 ) ( ON ?auto_925168 ?auto_925169 ) ( ON ?auto_925170 ?auto_925168 ) ( ON ?auto_925171 ?auto_925170 ) ( not ( = ?auto_925164 ?auto_925165 ) ) ( not ( = ?auto_925164 ?auto_925166 ) ) ( not ( = ?auto_925164 ?auto_925163 ) ) ( not ( = ?auto_925164 ?auto_925167 ) ) ( not ( = ?auto_925164 ?auto_925169 ) ) ( not ( = ?auto_925164 ?auto_925168 ) ) ( not ( = ?auto_925164 ?auto_925170 ) ) ( not ( = ?auto_925164 ?auto_925171 ) ) ( not ( = ?auto_925164 ?auto_925172 ) ) ( not ( = ?auto_925165 ?auto_925166 ) ) ( not ( = ?auto_925165 ?auto_925163 ) ) ( not ( = ?auto_925165 ?auto_925167 ) ) ( not ( = ?auto_925165 ?auto_925169 ) ) ( not ( = ?auto_925165 ?auto_925168 ) ) ( not ( = ?auto_925165 ?auto_925170 ) ) ( not ( = ?auto_925165 ?auto_925171 ) ) ( not ( = ?auto_925165 ?auto_925172 ) ) ( not ( = ?auto_925166 ?auto_925163 ) ) ( not ( = ?auto_925166 ?auto_925167 ) ) ( not ( = ?auto_925166 ?auto_925169 ) ) ( not ( = ?auto_925166 ?auto_925168 ) ) ( not ( = ?auto_925166 ?auto_925170 ) ) ( not ( = ?auto_925166 ?auto_925171 ) ) ( not ( = ?auto_925166 ?auto_925172 ) ) ( not ( = ?auto_925163 ?auto_925167 ) ) ( not ( = ?auto_925163 ?auto_925169 ) ) ( not ( = ?auto_925163 ?auto_925168 ) ) ( not ( = ?auto_925163 ?auto_925170 ) ) ( not ( = ?auto_925163 ?auto_925171 ) ) ( not ( = ?auto_925163 ?auto_925172 ) ) ( not ( = ?auto_925167 ?auto_925169 ) ) ( not ( = ?auto_925167 ?auto_925168 ) ) ( not ( = ?auto_925167 ?auto_925170 ) ) ( not ( = ?auto_925167 ?auto_925171 ) ) ( not ( = ?auto_925167 ?auto_925172 ) ) ( not ( = ?auto_925169 ?auto_925168 ) ) ( not ( = ?auto_925169 ?auto_925170 ) ) ( not ( = ?auto_925169 ?auto_925171 ) ) ( not ( = ?auto_925169 ?auto_925172 ) ) ( not ( = ?auto_925168 ?auto_925170 ) ) ( not ( = ?auto_925168 ?auto_925171 ) ) ( not ( = ?auto_925168 ?auto_925172 ) ) ( not ( = ?auto_925170 ?auto_925171 ) ) ( not ( = ?auto_925170 ?auto_925172 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_925171 ?auto_925172 )
      ( MAKE-9CRATE-VERIFY ?auto_925164 ?auto_925165 ?auto_925166 ?auto_925163 ?auto_925167 ?auto_925169 ?auto_925168 ?auto_925170 ?auto_925171 ?auto_925172 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925244 - SURFACE
      ?auto_925245 - SURFACE
      ?auto_925246 - SURFACE
      ?auto_925243 - SURFACE
      ?auto_925247 - SURFACE
      ?auto_925249 - SURFACE
      ?auto_925248 - SURFACE
      ?auto_925250 - SURFACE
      ?auto_925251 - SURFACE
      ?auto_925252 - SURFACE
    )
    :vars
    (
      ?auto_925253 - HOIST
      ?auto_925254 - PLACE
      ?auto_925255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925253 ?auto_925254 ) ( SURFACE-AT ?auto_925251 ?auto_925254 ) ( CLEAR ?auto_925251 ) ( IS-CRATE ?auto_925252 ) ( not ( = ?auto_925251 ?auto_925252 ) ) ( TRUCK-AT ?auto_925255 ?auto_925254 ) ( AVAILABLE ?auto_925253 ) ( IN ?auto_925252 ?auto_925255 ) ( ON ?auto_925251 ?auto_925250 ) ( not ( = ?auto_925250 ?auto_925251 ) ) ( not ( = ?auto_925250 ?auto_925252 ) ) ( ON ?auto_925245 ?auto_925244 ) ( ON ?auto_925246 ?auto_925245 ) ( ON ?auto_925243 ?auto_925246 ) ( ON ?auto_925247 ?auto_925243 ) ( ON ?auto_925249 ?auto_925247 ) ( ON ?auto_925248 ?auto_925249 ) ( ON ?auto_925250 ?auto_925248 ) ( not ( = ?auto_925244 ?auto_925245 ) ) ( not ( = ?auto_925244 ?auto_925246 ) ) ( not ( = ?auto_925244 ?auto_925243 ) ) ( not ( = ?auto_925244 ?auto_925247 ) ) ( not ( = ?auto_925244 ?auto_925249 ) ) ( not ( = ?auto_925244 ?auto_925248 ) ) ( not ( = ?auto_925244 ?auto_925250 ) ) ( not ( = ?auto_925244 ?auto_925251 ) ) ( not ( = ?auto_925244 ?auto_925252 ) ) ( not ( = ?auto_925245 ?auto_925246 ) ) ( not ( = ?auto_925245 ?auto_925243 ) ) ( not ( = ?auto_925245 ?auto_925247 ) ) ( not ( = ?auto_925245 ?auto_925249 ) ) ( not ( = ?auto_925245 ?auto_925248 ) ) ( not ( = ?auto_925245 ?auto_925250 ) ) ( not ( = ?auto_925245 ?auto_925251 ) ) ( not ( = ?auto_925245 ?auto_925252 ) ) ( not ( = ?auto_925246 ?auto_925243 ) ) ( not ( = ?auto_925246 ?auto_925247 ) ) ( not ( = ?auto_925246 ?auto_925249 ) ) ( not ( = ?auto_925246 ?auto_925248 ) ) ( not ( = ?auto_925246 ?auto_925250 ) ) ( not ( = ?auto_925246 ?auto_925251 ) ) ( not ( = ?auto_925246 ?auto_925252 ) ) ( not ( = ?auto_925243 ?auto_925247 ) ) ( not ( = ?auto_925243 ?auto_925249 ) ) ( not ( = ?auto_925243 ?auto_925248 ) ) ( not ( = ?auto_925243 ?auto_925250 ) ) ( not ( = ?auto_925243 ?auto_925251 ) ) ( not ( = ?auto_925243 ?auto_925252 ) ) ( not ( = ?auto_925247 ?auto_925249 ) ) ( not ( = ?auto_925247 ?auto_925248 ) ) ( not ( = ?auto_925247 ?auto_925250 ) ) ( not ( = ?auto_925247 ?auto_925251 ) ) ( not ( = ?auto_925247 ?auto_925252 ) ) ( not ( = ?auto_925249 ?auto_925248 ) ) ( not ( = ?auto_925249 ?auto_925250 ) ) ( not ( = ?auto_925249 ?auto_925251 ) ) ( not ( = ?auto_925249 ?auto_925252 ) ) ( not ( = ?auto_925248 ?auto_925250 ) ) ( not ( = ?auto_925248 ?auto_925251 ) ) ( not ( = ?auto_925248 ?auto_925252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925250 ?auto_925251 ?auto_925252 )
      ( MAKE-9CRATE-VERIFY ?auto_925244 ?auto_925245 ?auto_925246 ?auto_925243 ?auto_925247 ?auto_925249 ?auto_925248 ?auto_925250 ?auto_925251 ?auto_925252 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925334 - SURFACE
      ?auto_925335 - SURFACE
      ?auto_925336 - SURFACE
      ?auto_925333 - SURFACE
      ?auto_925337 - SURFACE
      ?auto_925339 - SURFACE
      ?auto_925338 - SURFACE
      ?auto_925340 - SURFACE
      ?auto_925341 - SURFACE
      ?auto_925342 - SURFACE
    )
    :vars
    (
      ?auto_925345 - HOIST
      ?auto_925343 - PLACE
      ?auto_925344 - TRUCK
      ?auto_925346 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_925345 ?auto_925343 ) ( SURFACE-AT ?auto_925341 ?auto_925343 ) ( CLEAR ?auto_925341 ) ( IS-CRATE ?auto_925342 ) ( not ( = ?auto_925341 ?auto_925342 ) ) ( AVAILABLE ?auto_925345 ) ( IN ?auto_925342 ?auto_925344 ) ( ON ?auto_925341 ?auto_925340 ) ( not ( = ?auto_925340 ?auto_925341 ) ) ( not ( = ?auto_925340 ?auto_925342 ) ) ( TRUCK-AT ?auto_925344 ?auto_925346 ) ( not ( = ?auto_925346 ?auto_925343 ) ) ( ON ?auto_925335 ?auto_925334 ) ( ON ?auto_925336 ?auto_925335 ) ( ON ?auto_925333 ?auto_925336 ) ( ON ?auto_925337 ?auto_925333 ) ( ON ?auto_925339 ?auto_925337 ) ( ON ?auto_925338 ?auto_925339 ) ( ON ?auto_925340 ?auto_925338 ) ( not ( = ?auto_925334 ?auto_925335 ) ) ( not ( = ?auto_925334 ?auto_925336 ) ) ( not ( = ?auto_925334 ?auto_925333 ) ) ( not ( = ?auto_925334 ?auto_925337 ) ) ( not ( = ?auto_925334 ?auto_925339 ) ) ( not ( = ?auto_925334 ?auto_925338 ) ) ( not ( = ?auto_925334 ?auto_925340 ) ) ( not ( = ?auto_925334 ?auto_925341 ) ) ( not ( = ?auto_925334 ?auto_925342 ) ) ( not ( = ?auto_925335 ?auto_925336 ) ) ( not ( = ?auto_925335 ?auto_925333 ) ) ( not ( = ?auto_925335 ?auto_925337 ) ) ( not ( = ?auto_925335 ?auto_925339 ) ) ( not ( = ?auto_925335 ?auto_925338 ) ) ( not ( = ?auto_925335 ?auto_925340 ) ) ( not ( = ?auto_925335 ?auto_925341 ) ) ( not ( = ?auto_925335 ?auto_925342 ) ) ( not ( = ?auto_925336 ?auto_925333 ) ) ( not ( = ?auto_925336 ?auto_925337 ) ) ( not ( = ?auto_925336 ?auto_925339 ) ) ( not ( = ?auto_925336 ?auto_925338 ) ) ( not ( = ?auto_925336 ?auto_925340 ) ) ( not ( = ?auto_925336 ?auto_925341 ) ) ( not ( = ?auto_925336 ?auto_925342 ) ) ( not ( = ?auto_925333 ?auto_925337 ) ) ( not ( = ?auto_925333 ?auto_925339 ) ) ( not ( = ?auto_925333 ?auto_925338 ) ) ( not ( = ?auto_925333 ?auto_925340 ) ) ( not ( = ?auto_925333 ?auto_925341 ) ) ( not ( = ?auto_925333 ?auto_925342 ) ) ( not ( = ?auto_925337 ?auto_925339 ) ) ( not ( = ?auto_925337 ?auto_925338 ) ) ( not ( = ?auto_925337 ?auto_925340 ) ) ( not ( = ?auto_925337 ?auto_925341 ) ) ( not ( = ?auto_925337 ?auto_925342 ) ) ( not ( = ?auto_925339 ?auto_925338 ) ) ( not ( = ?auto_925339 ?auto_925340 ) ) ( not ( = ?auto_925339 ?auto_925341 ) ) ( not ( = ?auto_925339 ?auto_925342 ) ) ( not ( = ?auto_925338 ?auto_925340 ) ) ( not ( = ?auto_925338 ?auto_925341 ) ) ( not ( = ?auto_925338 ?auto_925342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925340 ?auto_925341 ?auto_925342 )
      ( MAKE-9CRATE-VERIFY ?auto_925334 ?auto_925335 ?auto_925336 ?auto_925333 ?auto_925337 ?auto_925339 ?auto_925338 ?auto_925340 ?auto_925341 ?auto_925342 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925433 - SURFACE
      ?auto_925434 - SURFACE
      ?auto_925435 - SURFACE
      ?auto_925432 - SURFACE
      ?auto_925436 - SURFACE
      ?auto_925438 - SURFACE
      ?auto_925437 - SURFACE
      ?auto_925439 - SURFACE
      ?auto_925440 - SURFACE
      ?auto_925441 - SURFACE
    )
    :vars
    (
      ?auto_925444 - HOIST
      ?auto_925443 - PLACE
      ?auto_925445 - TRUCK
      ?auto_925442 - PLACE
      ?auto_925446 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_925444 ?auto_925443 ) ( SURFACE-AT ?auto_925440 ?auto_925443 ) ( CLEAR ?auto_925440 ) ( IS-CRATE ?auto_925441 ) ( not ( = ?auto_925440 ?auto_925441 ) ) ( AVAILABLE ?auto_925444 ) ( ON ?auto_925440 ?auto_925439 ) ( not ( = ?auto_925439 ?auto_925440 ) ) ( not ( = ?auto_925439 ?auto_925441 ) ) ( TRUCK-AT ?auto_925445 ?auto_925442 ) ( not ( = ?auto_925442 ?auto_925443 ) ) ( HOIST-AT ?auto_925446 ?auto_925442 ) ( LIFTING ?auto_925446 ?auto_925441 ) ( not ( = ?auto_925444 ?auto_925446 ) ) ( ON ?auto_925434 ?auto_925433 ) ( ON ?auto_925435 ?auto_925434 ) ( ON ?auto_925432 ?auto_925435 ) ( ON ?auto_925436 ?auto_925432 ) ( ON ?auto_925438 ?auto_925436 ) ( ON ?auto_925437 ?auto_925438 ) ( ON ?auto_925439 ?auto_925437 ) ( not ( = ?auto_925433 ?auto_925434 ) ) ( not ( = ?auto_925433 ?auto_925435 ) ) ( not ( = ?auto_925433 ?auto_925432 ) ) ( not ( = ?auto_925433 ?auto_925436 ) ) ( not ( = ?auto_925433 ?auto_925438 ) ) ( not ( = ?auto_925433 ?auto_925437 ) ) ( not ( = ?auto_925433 ?auto_925439 ) ) ( not ( = ?auto_925433 ?auto_925440 ) ) ( not ( = ?auto_925433 ?auto_925441 ) ) ( not ( = ?auto_925434 ?auto_925435 ) ) ( not ( = ?auto_925434 ?auto_925432 ) ) ( not ( = ?auto_925434 ?auto_925436 ) ) ( not ( = ?auto_925434 ?auto_925438 ) ) ( not ( = ?auto_925434 ?auto_925437 ) ) ( not ( = ?auto_925434 ?auto_925439 ) ) ( not ( = ?auto_925434 ?auto_925440 ) ) ( not ( = ?auto_925434 ?auto_925441 ) ) ( not ( = ?auto_925435 ?auto_925432 ) ) ( not ( = ?auto_925435 ?auto_925436 ) ) ( not ( = ?auto_925435 ?auto_925438 ) ) ( not ( = ?auto_925435 ?auto_925437 ) ) ( not ( = ?auto_925435 ?auto_925439 ) ) ( not ( = ?auto_925435 ?auto_925440 ) ) ( not ( = ?auto_925435 ?auto_925441 ) ) ( not ( = ?auto_925432 ?auto_925436 ) ) ( not ( = ?auto_925432 ?auto_925438 ) ) ( not ( = ?auto_925432 ?auto_925437 ) ) ( not ( = ?auto_925432 ?auto_925439 ) ) ( not ( = ?auto_925432 ?auto_925440 ) ) ( not ( = ?auto_925432 ?auto_925441 ) ) ( not ( = ?auto_925436 ?auto_925438 ) ) ( not ( = ?auto_925436 ?auto_925437 ) ) ( not ( = ?auto_925436 ?auto_925439 ) ) ( not ( = ?auto_925436 ?auto_925440 ) ) ( not ( = ?auto_925436 ?auto_925441 ) ) ( not ( = ?auto_925438 ?auto_925437 ) ) ( not ( = ?auto_925438 ?auto_925439 ) ) ( not ( = ?auto_925438 ?auto_925440 ) ) ( not ( = ?auto_925438 ?auto_925441 ) ) ( not ( = ?auto_925437 ?auto_925439 ) ) ( not ( = ?auto_925437 ?auto_925440 ) ) ( not ( = ?auto_925437 ?auto_925441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925439 ?auto_925440 ?auto_925441 )
      ( MAKE-9CRATE-VERIFY ?auto_925433 ?auto_925434 ?auto_925435 ?auto_925432 ?auto_925436 ?auto_925438 ?auto_925437 ?auto_925439 ?auto_925440 ?auto_925441 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925541 - SURFACE
      ?auto_925542 - SURFACE
      ?auto_925543 - SURFACE
      ?auto_925540 - SURFACE
      ?auto_925544 - SURFACE
      ?auto_925546 - SURFACE
      ?auto_925545 - SURFACE
      ?auto_925547 - SURFACE
      ?auto_925548 - SURFACE
      ?auto_925549 - SURFACE
    )
    :vars
    (
      ?auto_925553 - HOIST
      ?auto_925554 - PLACE
      ?auto_925550 - TRUCK
      ?auto_925552 - PLACE
      ?auto_925551 - HOIST
      ?auto_925555 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_925553 ?auto_925554 ) ( SURFACE-AT ?auto_925548 ?auto_925554 ) ( CLEAR ?auto_925548 ) ( IS-CRATE ?auto_925549 ) ( not ( = ?auto_925548 ?auto_925549 ) ) ( AVAILABLE ?auto_925553 ) ( ON ?auto_925548 ?auto_925547 ) ( not ( = ?auto_925547 ?auto_925548 ) ) ( not ( = ?auto_925547 ?auto_925549 ) ) ( TRUCK-AT ?auto_925550 ?auto_925552 ) ( not ( = ?auto_925552 ?auto_925554 ) ) ( HOIST-AT ?auto_925551 ?auto_925552 ) ( not ( = ?auto_925553 ?auto_925551 ) ) ( AVAILABLE ?auto_925551 ) ( SURFACE-AT ?auto_925549 ?auto_925552 ) ( ON ?auto_925549 ?auto_925555 ) ( CLEAR ?auto_925549 ) ( not ( = ?auto_925548 ?auto_925555 ) ) ( not ( = ?auto_925549 ?auto_925555 ) ) ( not ( = ?auto_925547 ?auto_925555 ) ) ( ON ?auto_925542 ?auto_925541 ) ( ON ?auto_925543 ?auto_925542 ) ( ON ?auto_925540 ?auto_925543 ) ( ON ?auto_925544 ?auto_925540 ) ( ON ?auto_925546 ?auto_925544 ) ( ON ?auto_925545 ?auto_925546 ) ( ON ?auto_925547 ?auto_925545 ) ( not ( = ?auto_925541 ?auto_925542 ) ) ( not ( = ?auto_925541 ?auto_925543 ) ) ( not ( = ?auto_925541 ?auto_925540 ) ) ( not ( = ?auto_925541 ?auto_925544 ) ) ( not ( = ?auto_925541 ?auto_925546 ) ) ( not ( = ?auto_925541 ?auto_925545 ) ) ( not ( = ?auto_925541 ?auto_925547 ) ) ( not ( = ?auto_925541 ?auto_925548 ) ) ( not ( = ?auto_925541 ?auto_925549 ) ) ( not ( = ?auto_925541 ?auto_925555 ) ) ( not ( = ?auto_925542 ?auto_925543 ) ) ( not ( = ?auto_925542 ?auto_925540 ) ) ( not ( = ?auto_925542 ?auto_925544 ) ) ( not ( = ?auto_925542 ?auto_925546 ) ) ( not ( = ?auto_925542 ?auto_925545 ) ) ( not ( = ?auto_925542 ?auto_925547 ) ) ( not ( = ?auto_925542 ?auto_925548 ) ) ( not ( = ?auto_925542 ?auto_925549 ) ) ( not ( = ?auto_925542 ?auto_925555 ) ) ( not ( = ?auto_925543 ?auto_925540 ) ) ( not ( = ?auto_925543 ?auto_925544 ) ) ( not ( = ?auto_925543 ?auto_925546 ) ) ( not ( = ?auto_925543 ?auto_925545 ) ) ( not ( = ?auto_925543 ?auto_925547 ) ) ( not ( = ?auto_925543 ?auto_925548 ) ) ( not ( = ?auto_925543 ?auto_925549 ) ) ( not ( = ?auto_925543 ?auto_925555 ) ) ( not ( = ?auto_925540 ?auto_925544 ) ) ( not ( = ?auto_925540 ?auto_925546 ) ) ( not ( = ?auto_925540 ?auto_925545 ) ) ( not ( = ?auto_925540 ?auto_925547 ) ) ( not ( = ?auto_925540 ?auto_925548 ) ) ( not ( = ?auto_925540 ?auto_925549 ) ) ( not ( = ?auto_925540 ?auto_925555 ) ) ( not ( = ?auto_925544 ?auto_925546 ) ) ( not ( = ?auto_925544 ?auto_925545 ) ) ( not ( = ?auto_925544 ?auto_925547 ) ) ( not ( = ?auto_925544 ?auto_925548 ) ) ( not ( = ?auto_925544 ?auto_925549 ) ) ( not ( = ?auto_925544 ?auto_925555 ) ) ( not ( = ?auto_925546 ?auto_925545 ) ) ( not ( = ?auto_925546 ?auto_925547 ) ) ( not ( = ?auto_925546 ?auto_925548 ) ) ( not ( = ?auto_925546 ?auto_925549 ) ) ( not ( = ?auto_925546 ?auto_925555 ) ) ( not ( = ?auto_925545 ?auto_925547 ) ) ( not ( = ?auto_925545 ?auto_925548 ) ) ( not ( = ?auto_925545 ?auto_925549 ) ) ( not ( = ?auto_925545 ?auto_925555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925547 ?auto_925548 ?auto_925549 )
      ( MAKE-9CRATE-VERIFY ?auto_925541 ?auto_925542 ?auto_925543 ?auto_925540 ?auto_925544 ?auto_925546 ?auto_925545 ?auto_925547 ?auto_925548 ?auto_925549 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925650 - SURFACE
      ?auto_925651 - SURFACE
      ?auto_925652 - SURFACE
      ?auto_925649 - SURFACE
      ?auto_925653 - SURFACE
      ?auto_925655 - SURFACE
      ?auto_925654 - SURFACE
      ?auto_925656 - SURFACE
      ?auto_925657 - SURFACE
      ?auto_925658 - SURFACE
    )
    :vars
    (
      ?auto_925660 - HOIST
      ?auto_925664 - PLACE
      ?auto_925659 - PLACE
      ?auto_925663 - HOIST
      ?auto_925662 - SURFACE
      ?auto_925661 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925660 ?auto_925664 ) ( SURFACE-AT ?auto_925657 ?auto_925664 ) ( CLEAR ?auto_925657 ) ( IS-CRATE ?auto_925658 ) ( not ( = ?auto_925657 ?auto_925658 ) ) ( AVAILABLE ?auto_925660 ) ( ON ?auto_925657 ?auto_925656 ) ( not ( = ?auto_925656 ?auto_925657 ) ) ( not ( = ?auto_925656 ?auto_925658 ) ) ( not ( = ?auto_925659 ?auto_925664 ) ) ( HOIST-AT ?auto_925663 ?auto_925659 ) ( not ( = ?auto_925660 ?auto_925663 ) ) ( AVAILABLE ?auto_925663 ) ( SURFACE-AT ?auto_925658 ?auto_925659 ) ( ON ?auto_925658 ?auto_925662 ) ( CLEAR ?auto_925658 ) ( not ( = ?auto_925657 ?auto_925662 ) ) ( not ( = ?auto_925658 ?auto_925662 ) ) ( not ( = ?auto_925656 ?auto_925662 ) ) ( TRUCK-AT ?auto_925661 ?auto_925664 ) ( ON ?auto_925651 ?auto_925650 ) ( ON ?auto_925652 ?auto_925651 ) ( ON ?auto_925649 ?auto_925652 ) ( ON ?auto_925653 ?auto_925649 ) ( ON ?auto_925655 ?auto_925653 ) ( ON ?auto_925654 ?auto_925655 ) ( ON ?auto_925656 ?auto_925654 ) ( not ( = ?auto_925650 ?auto_925651 ) ) ( not ( = ?auto_925650 ?auto_925652 ) ) ( not ( = ?auto_925650 ?auto_925649 ) ) ( not ( = ?auto_925650 ?auto_925653 ) ) ( not ( = ?auto_925650 ?auto_925655 ) ) ( not ( = ?auto_925650 ?auto_925654 ) ) ( not ( = ?auto_925650 ?auto_925656 ) ) ( not ( = ?auto_925650 ?auto_925657 ) ) ( not ( = ?auto_925650 ?auto_925658 ) ) ( not ( = ?auto_925650 ?auto_925662 ) ) ( not ( = ?auto_925651 ?auto_925652 ) ) ( not ( = ?auto_925651 ?auto_925649 ) ) ( not ( = ?auto_925651 ?auto_925653 ) ) ( not ( = ?auto_925651 ?auto_925655 ) ) ( not ( = ?auto_925651 ?auto_925654 ) ) ( not ( = ?auto_925651 ?auto_925656 ) ) ( not ( = ?auto_925651 ?auto_925657 ) ) ( not ( = ?auto_925651 ?auto_925658 ) ) ( not ( = ?auto_925651 ?auto_925662 ) ) ( not ( = ?auto_925652 ?auto_925649 ) ) ( not ( = ?auto_925652 ?auto_925653 ) ) ( not ( = ?auto_925652 ?auto_925655 ) ) ( not ( = ?auto_925652 ?auto_925654 ) ) ( not ( = ?auto_925652 ?auto_925656 ) ) ( not ( = ?auto_925652 ?auto_925657 ) ) ( not ( = ?auto_925652 ?auto_925658 ) ) ( not ( = ?auto_925652 ?auto_925662 ) ) ( not ( = ?auto_925649 ?auto_925653 ) ) ( not ( = ?auto_925649 ?auto_925655 ) ) ( not ( = ?auto_925649 ?auto_925654 ) ) ( not ( = ?auto_925649 ?auto_925656 ) ) ( not ( = ?auto_925649 ?auto_925657 ) ) ( not ( = ?auto_925649 ?auto_925658 ) ) ( not ( = ?auto_925649 ?auto_925662 ) ) ( not ( = ?auto_925653 ?auto_925655 ) ) ( not ( = ?auto_925653 ?auto_925654 ) ) ( not ( = ?auto_925653 ?auto_925656 ) ) ( not ( = ?auto_925653 ?auto_925657 ) ) ( not ( = ?auto_925653 ?auto_925658 ) ) ( not ( = ?auto_925653 ?auto_925662 ) ) ( not ( = ?auto_925655 ?auto_925654 ) ) ( not ( = ?auto_925655 ?auto_925656 ) ) ( not ( = ?auto_925655 ?auto_925657 ) ) ( not ( = ?auto_925655 ?auto_925658 ) ) ( not ( = ?auto_925655 ?auto_925662 ) ) ( not ( = ?auto_925654 ?auto_925656 ) ) ( not ( = ?auto_925654 ?auto_925657 ) ) ( not ( = ?auto_925654 ?auto_925658 ) ) ( not ( = ?auto_925654 ?auto_925662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925656 ?auto_925657 ?auto_925658 )
      ( MAKE-9CRATE-VERIFY ?auto_925650 ?auto_925651 ?auto_925652 ?auto_925649 ?auto_925653 ?auto_925655 ?auto_925654 ?auto_925656 ?auto_925657 ?auto_925658 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925759 - SURFACE
      ?auto_925760 - SURFACE
      ?auto_925761 - SURFACE
      ?auto_925758 - SURFACE
      ?auto_925762 - SURFACE
      ?auto_925764 - SURFACE
      ?auto_925763 - SURFACE
      ?auto_925765 - SURFACE
      ?auto_925766 - SURFACE
      ?auto_925767 - SURFACE
    )
    :vars
    (
      ?auto_925771 - HOIST
      ?auto_925772 - PLACE
      ?auto_925769 - PLACE
      ?auto_925768 - HOIST
      ?auto_925770 - SURFACE
      ?auto_925773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925771 ?auto_925772 ) ( IS-CRATE ?auto_925767 ) ( not ( = ?auto_925766 ?auto_925767 ) ) ( not ( = ?auto_925765 ?auto_925766 ) ) ( not ( = ?auto_925765 ?auto_925767 ) ) ( not ( = ?auto_925769 ?auto_925772 ) ) ( HOIST-AT ?auto_925768 ?auto_925769 ) ( not ( = ?auto_925771 ?auto_925768 ) ) ( AVAILABLE ?auto_925768 ) ( SURFACE-AT ?auto_925767 ?auto_925769 ) ( ON ?auto_925767 ?auto_925770 ) ( CLEAR ?auto_925767 ) ( not ( = ?auto_925766 ?auto_925770 ) ) ( not ( = ?auto_925767 ?auto_925770 ) ) ( not ( = ?auto_925765 ?auto_925770 ) ) ( TRUCK-AT ?auto_925773 ?auto_925772 ) ( SURFACE-AT ?auto_925765 ?auto_925772 ) ( CLEAR ?auto_925765 ) ( LIFTING ?auto_925771 ?auto_925766 ) ( IS-CRATE ?auto_925766 ) ( ON ?auto_925760 ?auto_925759 ) ( ON ?auto_925761 ?auto_925760 ) ( ON ?auto_925758 ?auto_925761 ) ( ON ?auto_925762 ?auto_925758 ) ( ON ?auto_925764 ?auto_925762 ) ( ON ?auto_925763 ?auto_925764 ) ( ON ?auto_925765 ?auto_925763 ) ( not ( = ?auto_925759 ?auto_925760 ) ) ( not ( = ?auto_925759 ?auto_925761 ) ) ( not ( = ?auto_925759 ?auto_925758 ) ) ( not ( = ?auto_925759 ?auto_925762 ) ) ( not ( = ?auto_925759 ?auto_925764 ) ) ( not ( = ?auto_925759 ?auto_925763 ) ) ( not ( = ?auto_925759 ?auto_925765 ) ) ( not ( = ?auto_925759 ?auto_925766 ) ) ( not ( = ?auto_925759 ?auto_925767 ) ) ( not ( = ?auto_925759 ?auto_925770 ) ) ( not ( = ?auto_925760 ?auto_925761 ) ) ( not ( = ?auto_925760 ?auto_925758 ) ) ( not ( = ?auto_925760 ?auto_925762 ) ) ( not ( = ?auto_925760 ?auto_925764 ) ) ( not ( = ?auto_925760 ?auto_925763 ) ) ( not ( = ?auto_925760 ?auto_925765 ) ) ( not ( = ?auto_925760 ?auto_925766 ) ) ( not ( = ?auto_925760 ?auto_925767 ) ) ( not ( = ?auto_925760 ?auto_925770 ) ) ( not ( = ?auto_925761 ?auto_925758 ) ) ( not ( = ?auto_925761 ?auto_925762 ) ) ( not ( = ?auto_925761 ?auto_925764 ) ) ( not ( = ?auto_925761 ?auto_925763 ) ) ( not ( = ?auto_925761 ?auto_925765 ) ) ( not ( = ?auto_925761 ?auto_925766 ) ) ( not ( = ?auto_925761 ?auto_925767 ) ) ( not ( = ?auto_925761 ?auto_925770 ) ) ( not ( = ?auto_925758 ?auto_925762 ) ) ( not ( = ?auto_925758 ?auto_925764 ) ) ( not ( = ?auto_925758 ?auto_925763 ) ) ( not ( = ?auto_925758 ?auto_925765 ) ) ( not ( = ?auto_925758 ?auto_925766 ) ) ( not ( = ?auto_925758 ?auto_925767 ) ) ( not ( = ?auto_925758 ?auto_925770 ) ) ( not ( = ?auto_925762 ?auto_925764 ) ) ( not ( = ?auto_925762 ?auto_925763 ) ) ( not ( = ?auto_925762 ?auto_925765 ) ) ( not ( = ?auto_925762 ?auto_925766 ) ) ( not ( = ?auto_925762 ?auto_925767 ) ) ( not ( = ?auto_925762 ?auto_925770 ) ) ( not ( = ?auto_925764 ?auto_925763 ) ) ( not ( = ?auto_925764 ?auto_925765 ) ) ( not ( = ?auto_925764 ?auto_925766 ) ) ( not ( = ?auto_925764 ?auto_925767 ) ) ( not ( = ?auto_925764 ?auto_925770 ) ) ( not ( = ?auto_925763 ?auto_925765 ) ) ( not ( = ?auto_925763 ?auto_925766 ) ) ( not ( = ?auto_925763 ?auto_925767 ) ) ( not ( = ?auto_925763 ?auto_925770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925765 ?auto_925766 ?auto_925767 )
      ( MAKE-9CRATE-VERIFY ?auto_925759 ?auto_925760 ?auto_925761 ?auto_925758 ?auto_925762 ?auto_925764 ?auto_925763 ?auto_925765 ?auto_925766 ?auto_925767 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_925868 - SURFACE
      ?auto_925869 - SURFACE
      ?auto_925870 - SURFACE
      ?auto_925867 - SURFACE
      ?auto_925871 - SURFACE
      ?auto_925873 - SURFACE
      ?auto_925872 - SURFACE
      ?auto_925874 - SURFACE
      ?auto_925875 - SURFACE
      ?auto_925876 - SURFACE
    )
    :vars
    (
      ?auto_925880 - HOIST
      ?auto_925879 - PLACE
      ?auto_925882 - PLACE
      ?auto_925878 - HOIST
      ?auto_925877 - SURFACE
      ?auto_925881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925880 ?auto_925879 ) ( IS-CRATE ?auto_925876 ) ( not ( = ?auto_925875 ?auto_925876 ) ) ( not ( = ?auto_925874 ?auto_925875 ) ) ( not ( = ?auto_925874 ?auto_925876 ) ) ( not ( = ?auto_925882 ?auto_925879 ) ) ( HOIST-AT ?auto_925878 ?auto_925882 ) ( not ( = ?auto_925880 ?auto_925878 ) ) ( AVAILABLE ?auto_925878 ) ( SURFACE-AT ?auto_925876 ?auto_925882 ) ( ON ?auto_925876 ?auto_925877 ) ( CLEAR ?auto_925876 ) ( not ( = ?auto_925875 ?auto_925877 ) ) ( not ( = ?auto_925876 ?auto_925877 ) ) ( not ( = ?auto_925874 ?auto_925877 ) ) ( TRUCK-AT ?auto_925881 ?auto_925879 ) ( SURFACE-AT ?auto_925874 ?auto_925879 ) ( CLEAR ?auto_925874 ) ( IS-CRATE ?auto_925875 ) ( AVAILABLE ?auto_925880 ) ( IN ?auto_925875 ?auto_925881 ) ( ON ?auto_925869 ?auto_925868 ) ( ON ?auto_925870 ?auto_925869 ) ( ON ?auto_925867 ?auto_925870 ) ( ON ?auto_925871 ?auto_925867 ) ( ON ?auto_925873 ?auto_925871 ) ( ON ?auto_925872 ?auto_925873 ) ( ON ?auto_925874 ?auto_925872 ) ( not ( = ?auto_925868 ?auto_925869 ) ) ( not ( = ?auto_925868 ?auto_925870 ) ) ( not ( = ?auto_925868 ?auto_925867 ) ) ( not ( = ?auto_925868 ?auto_925871 ) ) ( not ( = ?auto_925868 ?auto_925873 ) ) ( not ( = ?auto_925868 ?auto_925872 ) ) ( not ( = ?auto_925868 ?auto_925874 ) ) ( not ( = ?auto_925868 ?auto_925875 ) ) ( not ( = ?auto_925868 ?auto_925876 ) ) ( not ( = ?auto_925868 ?auto_925877 ) ) ( not ( = ?auto_925869 ?auto_925870 ) ) ( not ( = ?auto_925869 ?auto_925867 ) ) ( not ( = ?auto_925869 ?auto_925871 ) ) ( not ( = ?auto_925869 ?auto_925873 ) ) ( not ( = ?auto_925869 ?auto_925872 ) ) ( not ( = ?auto_925869 ?auto_925874 ) ) ( not ( = ?auto_925869 ?auto_925875 ) ) ( not ( = ?auto_925869 ?auto_925876 ) ) ( not ( = ?auto_925869 ?auto_925877 ) ) ( not ( = ?auto_925870 ?auto_925867 ) ) ( not ( = ?auto_925870 ?auto_925871 ) ) ( not ( = ?auto_925870 ?auto_925873 ) ) ( not ( = ?auto_925870 ?auto_925872 ) ) ( not ( = ?auto_925870 ?auto_925874 ) ) ( not ( = ?auto_925870 ?auto_925875 ) ) ( not ( = ?auto_925870 ?auto_925876 ) ) ( not ( = ?auto_925870 ?auto_925877 ) ) ( not ( = ?auto_925867 ?auto_925871 ) ) ( not ( = ?auto_925867 ?auto_925873 ) ) ( not ( = ?auto_925867 ?auto_925872 ) ) ( not ( = ?auto_925867 ?auto_925874 ) ) ( not ( = ?auto_925867 ?auto_925875 ) ) ( not ( = ?auto_925867 ?auto_925876 ) ) ( not ( = ?auto_925867 ?auto_925877 ) ) ( not ( = ?auto_925871 ?auto_925873 ) ) ( not ( = ?auto_925871 ?auto_925872 ) ) ( not ( = ?auto_925871 ?auto_925874 ) ) ( not ( = ?auto_925871 ?auto_925875 ) ) ( not ( = ?auto_925871 ?auto_925876 ) ) ( not ( = ?auto_925871 ?auto_925877 ) ) ( not ( = ?auto_925873 ?auto_925872 ) ) ( not ( = ?auto_925873 ?auto_925874 ) ) ( not ( = ?auto_925873 ?auto_925875 ) ) ( not ( = ?auto_925873 ?auto_925876 ) ) ( not ( = ?auto_925873 ?auto_925877 ) ) ( not ( = ?auto_925872 ?auto_925874 ) ) ( not ( = ?auto_925872 ?auto_925875 ) ) ( not ( = ?auto_925872 ?auto_925876 ) ) ( not ( = ?auto_925872 ?auto_925877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_925874 ?auto_925875 ?auto_925876 )
      ( MAKE-9CRATE-VERIFY ?auto_925868 ?auto_925869 ?auto_925870 ?auto_925867 ?auto_925871 ?auto_925873 ?auto_925872 ?auto_925874 ?auto_925875 ?auto_925876 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_930917 - SURFACE
      ?auto_930918 - SURFACE
    )
    :vars
    (
      ?auto_930924 - HOIST
      ?auto_930925 - PLACE
      ?auto_930920 - SURFACE
      ?auto_930921 - PLACE
      ?auto_930922 - HOIST
      ?auto_930919 - SURFACE
      ?auto_930923 - TRUCK
      ?auto_930926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_930924 ?auto_930925 ) ( SURFACE-AT ?auto_930917 ?auto_930925 ) ( CLEAR ?auto_930917 ) ( IS-CRATE ?auto_930918 ) ( not ( = ?auto_930917 ?auto_930918 ) ) ( ON ?auto_930917 ?auto_930920 ) ( not ( = ?auto_930920 ?auto_930917 ) ) ( not ( = ?auto_930920 ?auto_930918 ) ) ( not ( = ?auto_930921 ?auto_930925 ) ) ( HOIST-AT ?auto_930922 ?auto_930921 ) ( not ( = ?auto_930924 ?auto_930922 ) ) ( AVAILABLE ?auto_930922 ) ( SURFACE-AT ?auto_930918 ?auto_930921 ) ( ON ?auto_930918 ?auto_930919 ) ( CLEAR ?auto_930918 ) ( not ( = ?auto_930917 ?auto_930919 ) ) ( not ( = ?auto_930918 ?auto_930919 ) ) ( not ( = ?auto_930920 ?auto_930919 ) ) ( TRUCK-AT ?auto_930923 ?auto_930925 ) ( LIFTING ?auto_930924 ?auto_930926 ) ( IS-CRATE ?auto_930926 ) ( not ( = ?auto_930917 ?auto_930926 ) ) ( not ( = ?auto_930918 ?auto_930926 ) ) ( not ( = ?auto_930920 ?auto_930926 ) ) ( not ( = ?auto_930919 ?auto_930926 ) ) )
    :subtasks
    ( ( !LOAD ?auto_930924 ?auto_930926 ?auto_930923 ?auto_930925 )
      ( MAKE-1CRATE ?auto_930917 ?auto_930918 )
      ( MAKE-1CRATE-VERIFY ?auto_930917 ?auto_930918 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931407 - SURFACE
      ?auto_931408 - SURFACE
      ?auto_931409 - SURFACE
      ?auto_931406 - SURFACE
      ?auto_931410 - SURFACE
      ?auto_931412 - SURFACE
      ?auto_931411 - SURFACE
      ?auto_931413 - SURFACE
      ?auto_931414 - SURFACE
      ?auto_931415 - SURFACE
      ?auto_931416 - SURFACE
    )
    :vars
    (
      ?auto_931418 - HOIST
      ?auto_931417 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_931418 ?auto_931417 ) ( SURFACE-AT ?auto_931415 ?auto_931417 ) ( CLEAR ?auto_931415 ) ( LIFTING ?auto_931418 ?auto_931416 ) ( IS-CRATE ?auto_931416 ) ( not ( = ?auto_931415 ?auto_931416 ) ) ( ON ?auto_931408 ?auto_931407 ) ( ON ?auto_931409 ?auto_931408 ) ( ON ?auto_931406 ?auto_931409 ) ( ON ?auto_931410 ?auto_931406 ) ( ON ?auto_931412 ?auto_931410 ) ( ON ?auto_931411 ?auto_931412 ) ( ON ?auto_931413 ?auto_931411 ) ( ON ?auto_931414 ?auto_931413 ) ( ON ?auto_931415 ?auto_931414 ) ( not ( = ?auto_931407 ?auto_931408 ) ) ( not ( = ?auto_931407 ?auto_931409 ) ) ( not ( = ?auto_931407 ?auto_931406 ) ) ( not ( = ?auto_931407 ?auto_931410 ) ) ( not ( = ?auto_931407 ?auto_931412 ) ) ( not ( = ?auto_931407 ?auto_931411 ) ) ( not ( = ?auto_931407 ?auto_931413 ) ) ( not ( = ?auto_931407 ?auto_931414 ) ) ( not ( = ?auto_931407 ?auto_931415 ) ) ( not ( = ?auto_931407 ?auto_931416 ) ) ( not ( = ?auto_931408 ?auto_931409 ) ) ( not ( = ?auto_931408 ?auto_931406 ) ) ( not ( = ?auto_931408 ?auto_931410 ) ) ( not ( = ?auto_931408 ?auto_931412 ) ) ( not ( = ?auto_931408 ?auto_931411 ) ) ( not ( = ?auto_931408 ?auto_931413 ) ) ( not ( = ?auto_931408 ?auto_931414 ) ) ( not ( = ?auto_931408 ?auto_931415 ) ) ( not ( = ?auto_931408 ?auto_931416 ) ) ( not ( = ?auto_931409 ?auto_931406 ) ) ( not ( = ?auto_931409 ?auto_931410 ) ) ( not ( = ?auto_931409 ?auto_931412 ) ) ( not ( = ?auto_931409 ?auto_931411 ) ) ( not ( = ?auto_931409 ?auto_931413 ) ) ( not ( = ?auto_931409 ?auto_931414 ) ) ( not ( = ?auto_931409 ?auto_931415 ) ) ( not ( = ?auto_931409 ?auto_931416 ) ) ( not ( = ?auto_931406 ?auto_931410 ) ) ( not ( = ?auto_931406 ?auto_931412 ) ) ( not ( = ?auto_931406 ?auto_931411 ) ) ( not ( = ?auto_931406 ?auto_931413 ) ) ( not ( = ?auto_931406 ?auto_931414 ) ) ( not ( = ?auto_931406 ?auto_931415 ) ) ( not ( = ?auto_931406 ?auto_931416 ) ) ( not ( = ?auto_931410 ?auto_931412 ) ) ( not ( = ?auto_931410 ?auto_931411 ) ) ( not ( = ?auto_931410 ?auto_931413 ) ) ( not ( = ?auto_931410 ?auto_931414 ) ) ( not ( = ?auto_931410 ?auto_931415 ) ) ( not ( = ?auto_931410 ?auto_931416 ) ) ( not ( = ?auto_931412 ?auto_931411 ) ) ( not ( = ?auto_931412 ?auto_931413 ) ) ( not ( = ?auto_931412 ?auto_931414 ) ) ( not ( = ?auto_931412 ?auto_931415 ) ) ( not ( = ?auto_931412 ?auto_931416 ) ) ( not ( = ?auto_931411 ?auto_931413 ) ) ( not ( = ?auto_931411 ?auto_931414 ) ) ( not ( = ?auto_931411 ?auto_931415 ) ) ( not ( = ?auto_931411 ?auto_931416 ) ) ( not ( = ?auto_931413 ?auto_931414 ) ) ( not ( = ?auto_931413 ?auto_931415 ) ) ( not ( = ?auto_931413 ?auto_931416 ) ) ( not ( = ?auto_931414 ?auto_931415 ) ) ( not ( = ?auto_931414 ?auto_931416 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_931415 ?auto_931416 )
      ( MAKE-10CRATE-VERIFY ?auto_931407 ?auto_931408 ?auto_931409 ?auto_931406 ?auto_931410 ?auto_931412 ?auto_931411 ?auto_931413 ?auto_931414 ?auto_931415 ?auto_931416 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931501 - SURFACE
      ?auto_931502 - SURFACE
      ?auto_931503 - SURFACE
      ?auto_931500 - SURFACE
      ?auto_931504 - SURFACE
      ?auto_931506 - SURFACE
      ?auto_931505 - SURFACE
      ?auto_931507 - SURFACE
      ?auto_931508 - SURFACE
      ?auto_931509 - SURFACE
      ?auto_931510 - SURFACE
    )
    :vars
    (
      ?auto_931511 - HOIST
      ?auto_931513 - PLACE
      ?auto_931512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_931511 ?auto_931513 ) ( SURFACE-AT ?auto_931509 ?auto_931513 ) ( CLEAR ?auto_931509 ) ( IS-CRATE ?auto_931510 ) ( not ( = ?auto_931509 ?auto_931510 ) ) ( TRUCK-AT ?auto_931512 ?auto_931513 ) ( AVAILABLE ?auto_931511 ) ( IN ?auto_931510 ?auto_931512 ) ( ON ?auto_931509 ?auto_931508 ) ( not ( = ?auto_931508 ?auto_931509 ) ) ( not ( = ?auto_931508 ?auto_931510 ) ) ( ON ?auto_931502 ?auto_931501 ) ( ON ?auto_931503 ?auto_931502 ) ( ON ?auto_931500 ?auto_931503 ) ( ON ?auto_931504 ?auto_931500 ) ( ON ?auto_931506 ?auto_931504 ) ( ON ?auto_931505 ?auto_931506 ) ( ON ?auto_931507 ?auto_931505 ) ( ON ?auto_931508 ?auto_931507 ) ( not ( = ?auto_931501 ?auto_931502 ) ) ( not ( = ?auto_931501 ?auto_931503 ) ) ( not ( = ?auto_931501 ?auto_931500 ) ) ( not ( = ?auto_931501 ?auto_931504 ) ) ( not ( = ?auto_931501 ?auto_931506 ) ) ( not ( = ?auto_931501 ?auto_931505 ) ) ( not ( = ?auto_931501 ?auto_931507 ) ) ( not ( = ?auto_931501 ?auto_931508 ) ) ( not ( = ?auto_931501 ?auto_931509 ) ) ( not ( = ?auto_931501 ?auto_931510 ) ) ( not ( = ?auto_931502 ?auto_931503 ) ) ( not ( = ?auto_931502 ?auto_931500 ) ) ( not ( = ?auto_931502 ?auto_931504 ) ) ( not ( = ?auto_931502 ?auto_931506 ) ) ( not ( = ?auto_931502 ?auto_931505 ) ) ( not ( = ?auto_931502 ?auto_931507 ) ) ( not ( = ?auto_931502 ?auto_931508 ) ) ( not ( = ?auto_931502 ?auto_931509 ) ) ( not ( = ?auto_931502 ?auto_931510 ) ) ( not ( = ?auto_931503 ?auto_931500 ) ) ( not ( = ?auto_931503 ?auto_931504 ) ) ( not ( = ?auto_931503 ?auto_931506 ) ) ( not ( = ?auto_931503 ?auto_931505 ) ) ( not ( = ?auto_931503 ?auto_931507 ) ) ( not ( = ?auto_931503 ?auto_931508 ) ) ( not ( = ?auto_931503 ?auto_931509 ) ) ( not ( = ?auto_931503 ?auto_931510 ) ) ( not ( = ?auto_931500 ?auto_931504 ) ) ( not ( = ?auto_931500 ?auto_931506 ) ) ( not ( = ?auto_931500 ?auto_931505 ) ) ( not ( = ?auto_931500 ?auto_931507 ) ) ( not ( = ?auto_931500 ?auto_931508 ) ) ( not ( = ?auto_931500 ?auto_931509 ) ) ( not ( = ?auto_931500 ?auto_931510 ) ) ( not ( = ?auto_931504 ?auto_931506 ) ) ( not ( = ?auto_931504 ?auto_931505 ) ) ( not ( = ?auto_931504 ?auto_931507 ) ) ( not ( = ?auto_931504 ?auto_931508 ) ) ( not ( = ?auto_931504 ?auto_931509 ) ) ( not ( = ?auto_931504 ?auto_931510 ) ) ( not ( = ?auto_931506 ?auto_931505 ) ) ( not ( = ?auto_931506 ?auto_931507 ) ) ( not ( = ?auto_931506 ?auto_931508 ) ) ( not ( = ?auto_931506 ?auto_931509 ) ) ( not ( = ?auto_931506 ?auto_931510 ) ) ( not ( = ?auto_931505 ?auto_931507 ) ) ( not ( = ?auto_931505 ?auto_931508 ) ) ( not ( = ?auto_931505 ?auto_931509 ) ) ( not ( = ?auto_931505 ?auto_931510 ) ) ( not ( = ?auto_931507 ?auto_931508 ) ) ( not ( = ?auto_931507 ?auto_931509 ) ) ( not ( = ?auto_931507 ?auto_931510 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931508 ?auto_931509 ?auto_931510 )
      ( MAKE-10CRATE-VERIFY ?auto_931501 ?auto_931502 ?auto_931503 ?auto_931500 ?auto_931504 ?auto_931506 ?auto_931505 ?auto_931507 ?auto_931508 ?auto_931509 ?auto_931510 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931606 - SURFACE
      ?auto_931607 - SURFACE
      ?auto_931608 - SURFACE
      ?auto_931605 - SURFACE
      ?auto_931609 - SURFACE
      ?auto_931611 - SURFACE
      ?auto_931610 - SURFACE
      ?auto_931612 - SURFACE
      ?auto_931613 - SURFACE
      ?auto_931614 - SURFACE
      ?auto_931615 - SURFACE
    )
    :vars
    (
      ?auto_931619 - HOIST
      ?auto_931618 - PLACE
      ?auto_931617 - TRUCK
      ?auto_931616 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_931619 ?auto_931618 ) ( SURFACE-AT ?auto_931614 ?auto_931618 ) ( CLEAR ?auto_931614 ) ( IS-CRATE ?auto_931615 ) ( not ( = ?auto_931614 ?auto_931615 ) ) ( AVAILABLE ?auto_931619 ) ( IN ?auto_931615 ?auto_931617 ) ( ON ?auto_931614 ?auto_931613 ) ( not ( = ?auto_931613 ?auto_931614 ) ) ( not ( = ?auto_931613 ?auto_931615 ) ) ( TRUCK-AT ?auto_931617 ?auto_931616 ) ( not ( = ?auto_931616 ?auto_931618 ) ) ( ON ?auto_931607 ?auto_931606 ) ( ON ?auto_931608 ?auto_931607 ) ( ON ?auto_931605 ?auto_931608 ) ( ON ?auto_931609 ?auto_931605 ) ( ON ?auto_931611 ?auto_931609 ) ( ON ?auto_931610 ?auto_931611 ) ( ON ?auto_931612 ?auto_931610 ) ( ON ?auto_931613 ?auto_931612 ) ( not ( = ?auto_931606 ?auto_931607 ) ) ( not ( = ?auto_931606 ?auto_931608 ) ) ( not ( = ?auto_931606 ?auto_931605 ) ) ( not ( = ?auto_931606 ?auto_931609 ) ) ( not ( = ?auto_931606 ?auto_931611 ) ) ( not ( = ?auto_931606 ?auto_931610 ) ) ( not ( = ?auto_931606 ?auto_931612 ) ) ( not ( = ?auto_931606 ?auto_931613 ) ) ( not ( = ?auto_931606 ?auto_931614 ) ) ( not ( = ?auto_931606 ?auto_931615 ) ) ( not ( = ?auto_931607 ?auto_931608 ) ) ( not ( = ?auto_931607 ?auto_931605 ) ) ( not ( = ?auto_931607 ?auto_931609 ) ) ( not ( = ?auto_931607 ?auto_931611 ) ) ( not ( = ?auto_931607 ?auto_931610 ) ) ( not ( = ?auto_931607 ?auto_931612 ) ) ( not ( = ?auto_931607 ?auto_931613 ) ) ( not ( = ?auto_931607 ?auto_931614 ) ) ( not ( = ?auto_931607 ?auto_931615 ) ) ( not ( = ?auto_931608 ?auto_931605 ) ) ( not ( = ?auto_931608 ?auto_931609 ) ) ( not ( = ?auto_931608 ?auto_931611 ) ) ( not ( = ?auto_931608 ?auto_931610 ) ) ( not ( = ?auto_931608 ?auto_931612 ) ) ( not ( = ?auto_931608 ?auto_931613 ) ) ( not ( = ?auto_931608 ?auto_931614 ) ) ( not ( = ?auto_931608 ?auto_931615 ) ) ( not ( = ?auto_931605 ?auto_931609 ) ) ( not ( = ?auto_931605 ?auto_931611 ) ) ( not ( = ?auto_931605 ?auto_931610 ) ) ( not ( = ?auto_931605 ?auto_931612 ) ) ( not ( = ?auto_931605 ?auto_931613 ) ) ( not ( = ?auto_931605 ?auto_931614 ) ) ( not ( = ?auto_931605 ?auto_931615 ) ) ( not ( = ?auto_931609 ?auto_931611 ) ) ( not ( = ?auto_931609 ?auto_931610 ) ) ( not ( = ?auto_931609 ?auto_931612 ) ) ( not ( = ?auto_931609 ?auto_931613 ) ) ( not ( = ?auto_931609 ?auto_931614 ) ) ( not ( = ?auto_931609 ?auto_931615 ) ) ( not ( = ?auto_931611 ?auto_931610 ) ) ( not ( = ?auto_931611 ?auto_931612 ) ) ( not ( = ?auto_931611 ?auto_931613 ) ) ( not ( = ?auto_931611 ?auto_931614 ) ) ( not ( = ?auto_931611 ?auto_931615 ) ) ( not ( = ?auto_931610 ?auto_931612 ) ) ( not ( = ?auto_931610 ?auto_931613 ) ) ( not ( = ?auto_931610 ?auto_931614 ) ) ( not ( = ?auto_931610 ?auto_931615 ) ) ( not ( = ?auto_931612 ?auto_931613 ) ) ( not ( = ?auto_931612 ?auto_931614 ) ) ( not ( = ?auto_931612 ?auto_931615 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931613 ?auto_931614 ?auto_931615 )
      ( MAKE-10CRATE-VERIFY ?auto_931606 ?auto_931607 ?auto_931608 ?auto_931605 ?auto_931609 ?auto_931611 ?auto_931610 ?auto_931612 ?auto_931613 ?auto_931614 ?auto_931615 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931721 - SURFACE
      ?auto_931722 - SURFACE
      ?auto_931723 - SURFACE
      ?auto_931720 - SURFACE
      ?auto_931724 - SURFACE
      ?auto_931726 - SURFACE
      ?auto_931725 - SURFACE
      ?auto_931727 - SURFACE
      ?auto_931728 - SURFACE
      ?auto_931729 - SURFACE
      ?auto_931730 - SURFACE
    )
    :vars
    (
      ?auto_931732 - HOIST
      ?auto_931733 - PLACE
      ?auto_931731 - TRUCK
      ?auto_931735 - PLACE
      ?auto_931734 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_931732 ?auto_931733 ) ( SURFACE-AT ?auto_931729 ?auto_931733 ) ( CLEAR ?auto_931729 ) ( IS-CRATE ?auto_931730 ) ( not ( = ?auto_931729 ?auto_931730 ) ) ( AVAILABLE ?auto_931732 ) ( ON ?auto_931729 ?auto_931728 ) ( not ( = ?auto_931728 ?auto_931729 ) ) ( not ( = ?auto_931728 ?auto_931730 ) ) ( TRUCK-AT ?auto_931731 ?auto_931735 ) ( not ( = ?auto_931735 ?auto_931733 ) ) ( HOIST-AT ?auto_931734 ?auto_931735 ) ( LIFTING ?auto_931734 ?auto_931730 ) ( not ( = ?auto_931732 ?auto_931734 ) ) ( ON ?auto_931722 ?auto_931721 ) ( ON ?auto_931723 ?auto_931722 ) ( ON ?auto_931720 ?auto_931723 ) ( ON ?auto_931724 ?auto_931720 ) ( ON ?auto_931726 ?auto_931724 ) ( ON ?auto_931725 ?auto_931726 ) ( ON ?auto_931727 ?auto_931725 ) ( ON ?auto_931728 ?auto_931727 ) ( not ( = ?auto_931721 ?auto_931722 ) ) ( not ( = ?auto_931721 ?auto_931723 ) ) ( not ( = ?auto_931721 ?auto_931720 ) ) ( not ( = ?auto_931721 ?auto_931724 ) ) ( not ( = ?auto_931721 ?auto_931726 ) ) ( not ( = ?auto_931721 ?auto_931725 ) ) ( not ( = ?auto_931721 ?auto_931727 ) ) ( not ( = ?auto_931721 ?auto_931728 ) ) ( not ( = ?auto_931721 ?auto_931729 ) ) ( not ( = ?auto_931721 ?auto_931730 ) ) ( not ( = ?auto_931722 ?auto_931723 ) ) ( not ( = ?auto_931722 ?auto_931720 ) ) ( not ( = ?auto_931722 ?auto_931724 ) ) ( not ( = ?auto_931722 ?auto_931726 ) ) ( not ( = ?auto_931722 ?auto_931725 ) ) ( not ( = ?auto_931722 ?auto_931727 ) ) ( not ( = ?auto_931722 ?auto_931728 ) ) ( not ( = ?auto_931722 ?auto_931729 ) ) ( not ( = ?auto_931722 ?auto_931730 ) ) ( not ( = ?auto_931723 ?auto_931720 ) ) ( not ( = ?auto_931723 ?auto_931724 ) ) ( not ( = ?auto_931723 ?auto_931726 ) ) ( not ( = ?auto_931723 ?auto_931725 ) ) ( not ( = ?auto_931723 ?auto_931727 ) ) ( not ( = ?auto_931723 ?auto_931728 ) ) ( not ( = ?auto_931723 ?auto_931729 ) ) ( not ( = ?auto_931723 ?auto_931730 ) ) ( not ( = ?auto_931720 ?auto_931724 ) ) ( not ( = ?auto_931720 ?auto_931726 ) ) ( not ( = ?auto_931720 ?auto_931725 ) ) ( not ( = ?auto_931720 ?auto_931727 ) ) ( not ( = ?auto_931720 ?auto_931728 ) ) ( not ( = ?auto_931720 ?auto_931729 ) ) ( not ( = ?auto_931720 ?auto_931730 ) ) ( not ( = ?auto_931724 ?auto_931726 ) ) ( not ( = ?auto_931724 ?auto_931725 ) ) ( not ( = ?auto_931724 ?auto_931727 ) ) ( not ( = ?auto_931724 ?auto_931728 ) ) ( not ( = ?auto_931724 ?auto_931729 ) ) ( not ( = ?auto_931724 ?auto_931730 ) ) ( not ( = ?auto_931726 ?auto_931725 ) ) ( not ( = ?auto_931726 ?auto_931727 ) ) ( not ( = ?auto_931726 ?auto_931728 ) ) ( not ( = ?auto_931726 ?auto_931729 ) ) ( not ( = ?auto_931726 ?auto_931730 ) ) ( not ( = ?auto_931725 ?auto_931727 ) ) ( not ( = ?auto_931725 ?auto_931728 ) ) ( not ( = ?auto_931725 ?auto_931729 ) ) ( not ( = ?auto_931725 ?auto_931730 ) ) ( not ( = ?auto_931727 ?auto_931728 ) ) ( not ( = ?auto_931727 ?auto_931729 ) ) ( not ( = ?auto_931727 ?auto_931730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931728 ?auto_931729 ?auto_931730 )
      ( MAKE-10CRATE-VERIFY ?auto_931721 ?auto_931722 ?auto_931723 ?auto_931720 ?auto_931724 ?auto_931726 ?auto_931725 ?auto_931727 ?auto_931728 ?auto_931729 ?auto_931730 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931846 - SURFACE
      ?auto_931847 - SURFACE
      ?auto_931848 - SURFACE
      ?auto_931845 - SURFACE
      ?auto_931849 - SURFACE
      ?auto_931851 - SURFACE
      ?auto_931850 - SURFACE
      ?auto_931852 - SURFACE
      ?auto_931853 - SURFACE
      ?auto_931854 - SURFACE
      ?auto_931855 - SURFACE
    )
    :vars
    (
      ?auto_931860 - HOIST
      ?auto_931858 - PLACE
      ?auto_931856 - TRUCK
      ?auto_931859 - PLACE
      ?auto_931857 - HOIST
      ?auto_931861 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_931860 ?auto_931858 ) ( SURFACE-AT ?auto_931854 ?auto_931858 ) ( CLEAR ?auto_931854 ) ( IS-CRATE ?auto_931855 ) ( not ( = ?auto_931854 ?auto_931855 ) ) ( AVAILABLE ?auto_931860 ) ( ON ?auto_931854 ?auto_931853 ) ( not ( = ?auto_931853 ?auto_931854 ) ) ( not ( = ?auto_931853 ?auto_931855 ) ) ( TRUCK-AT ?auto_931856 ?auto_931859 ) ( not ( = ?auto_931859 ?auto_931858 ) ) ( HOIST-AT ?auto_931857 ?auto_931859 ) ( not ( = ?auto_931860 ?auto_931857 ) ) ( AVAILABLE ?auto_931857 ) ( SURFACE-AT ?auto_931855 ?auto_931859 ) ( ON ?auto_931855 ?auto_931861 ) ( CLEAR ?auto_931855 ) ( not ( = ?auto_931854 ?auto_931861 ) ) ( not ( = ?auto_931855 ?auto_931861 ) ) ( not ( = ?auto_931853 ?auto_931861 ) ) ( ON ?auto_931847 ?auto_931846 ) ( ON ?auto_931848 ?auto_931847 ) ( ON ?auto_931845 ?auto_931848 ) ( ON ?auto_931849 ?auto_931845 ) ( ON ?auto_931851 ?auto_931849 ) ( ON ?auto_931850 ?auto_931851 ) ( ON ?auto_931852 ?auto_931850 ) ( ON ?auto_931853 ?auto_931852 ) ( not ( = ?auto_931846 ?auto_931847 ) ) ( not ( = ?auto_931846 ?auto_931848 ) ) ( not ( = ?auto_931846 ?auto_931845 ) ) ( not ( = ?auto_931846 ?auto_931849 ) ) ( not ( = ?auto_931846 ?auto_931851 ) ) ( not ( = ?auto_931846 ?auto_931850 ) ) ( not ( = ?auto_931846 ?auto_931852 ) ) ( not ( = ?auto_931846 ?auto_931853 ) ) ( not ( = ?auto_931846 ?auto_931854 ) ) ( not ( = ?auto_931846 ?auto_931855 ) ) ( not ( = ?auto_931846 ?auto_931861 ) ) ( not ( = ?auto_931847 ?auto_931848 ) ) ( not ( = ?auto_931847 ?auto_931845 ) ) ( not ( = ?auto_931847 ?auto_931849 ) ) ( not ( = ?auto_931847 ?auto_931851 ) ) ( not ( = ?auto_931847 ?auto_931850 ) ) ( not ( = ?auto_931847 ?auto_931852 ) ) ( not ( = ?auto_931847 ?auto_931853 ) ) ( not ( = ?auto_931847 ?auto_931854 ) ) ( not ( = ?auto_931847 ?auto_931855 ) ) ( not ( = ?auto_931847 ?auto_931861 ) ) ( not ( = ?auto_931848 ?auto_931845 ) ) ( not ( = ?auto_931848 ?auto_931849 ) ) ( not ( = ?auto_931848 ?auto_931851 ) ) ( not ( = ?auto_931848 ?auto_931850 ) ) ( not ( = ?auto_931848 ?auto_931852 ) ) ( not ( = ?auto_931848 ?auto_931853 ) ) ( not ( = ?auto_931848 ?auto_931854 ) ) ( not ( = ?auto_931848 ?auto_931855 ) ) ( not ( = ?auto_931848 ?auto_931861 ) ) ( not ( = ?auto_931845 ?auto_931849 ) ) ( not ( = ?auto_931845 ?auto_931851 ) ) ( not ( = ?auto_931845 ?auto_931850 ) ) ( not ( = ?auto_931845 ?auto_931852 ) ) ( not ( = ?auto_931845 ?auto_931853 ) ) ( not ( = ?auto_931845 ?auto_931854 ) ) ( not ( = ?auto_931845 ?auto_931855 ) ) ( not ( = ?auto_931845 ?auto_931861 ) ) ( not ( = ?auto_931849 ?auto_931851 ) ) ( not ( = ?auto_931849 ?auto_931850 ) ) ( not ( = ?auto_931849 ?auto_931852 ) ) ( not ( = ?auto_931849 ?auto_931853 ) ) ( not ( = ?auto_931849 ?auto_931854 ) ) ( not ( = ?auto_931849 ?auto_931855 ) ) ( not ( = ?auto_931849 ?auto_931861 ) ) ( not ( = ?auto_931851 ?auto_931850 ) ) ( not ( = ?auto_931851 ?auto_931852 ) ) ( not ( = ?auto_931851 ?auto_931853 ) ) ( not ( = ?auto_931851 ?auto_931854 ) ) ( not ( = ?auto_931851 ?auto_931855 ) ) ( not ( = ?auto_931851 ?auto_931861 ) ) ( not ( = ?auto_931850 ?auto_931852 ) ) ( not ( = ?auto_931850 ?auto_931853 ) ) ( not ( = ?auto_931850 ?auto_931854 ) ) ( not ( = ?auto_931850 ?auto_931855 ) ) ( not ( = ?auto_931850 ?auto_931861 ) ) ( not ( = ?auto_931852 ?auto_931853 ) ) ( not ( = ?auto_931852 ?auto_931854 ) ) ( not ( = ?auto_931852 ?auto_931855 ) ) ( not ( = ?auto_931852 ?auto_931861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931853 ?auto_931854 ?auto_931855 )
      ( MAKE-10CRATE-VERIFY ?auto_931846 ?auto_931847 ?auto_931848 ?auto_931845 ?auto_931849 ?auto_931851 ?auto_931850 ?auto_931852 ?auto_931853 ?auto_931854 ?auto_931855 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_931972 - SURFACE
      ?auto_931973 - SURFACE
      ?auto_931974 - SURFACE
      ?auto_931971 - SURFACE
      ?auto_931975 - SURFACE
      ?auto_931977 - SURFACE
      ?auto_931976 - SURFACE
      ?auto_931978 - SURFACE
      ?auto_931979 - SURFACE
      ?auto_931980 - SURFACE
      ?auto_931981 - SURFACE
    )
    :vars
    (
      ?auto_931984 - HOIST
      ?auto_931983 - PLACE
      ?auto_931987 - PLACE
      ?auto_931986 - HOIST
      ?auto_931982 - SURFACE
      ?auto_931985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_931984 ?auto_931983 ) ( SURFACE-AT ?auto_931980 ?auto_931983 ) ( CLEAR ?auto_931980 ) ( IS-CRATE ?auto_931981 ) ( not ( = ?auto_931980 ?auto_931981 ) ) ( AVAILABLE ?auto_931984 ) ( ON ?auto_931980 ?auto_931979 ) ( not ( = ?auto_931979 ?auto_931980 ) ) ( not ( = ?auto_931979 ?auto_931981 ) ) ( not ( = ?auto_931987 ?auto_931983 ) ) ( HOIST-AT ?auto_931986 ?auto_931987 ) ( not ( = ?auto_931984 ?auto_931986 ) ) ( AVAILABLE ?auto_931986 ) ( SURFACE-AT ?auto_931981 ?auto_931987 ) ( ON ?auto_931981 ?auto_931982 ) ( CLEAR ?auto_931981 ) ( not ( = ?auto_931980 ?auto_931982 ) ) ( not ( = ?auto_931981 ?auto_931982 ) ) ( not ( = ?auto_931979 ?auto_931982 ) ) ( TRUCK-AT ?auto_931985 ?auto_931983 ) ( ON ?auto_931973 ?auto_931972 ) ( ON ?auto_931974 ?auto_931973 ) ( ON ?auto_931971 ?auto_931974 ) ( ON ?auto_931975 ?auto_931971 ) ( ON ?auto_931977 ?auto_931975 ) ( ON ?auto_931976 ?auto_931977 ) ( ON ?auto_931978 ?auto_931976 ) ( ON ?auto_931979 ?auto_931978 ) ( not ( = ?auto_931972 ?auto_931973 ) ) ( not ( = ?auto_931972 ?auto_931974 ) ) ( not ( = ?auto_931972 ?auto_931971 ) ) ( not ( = ?auto_931972 ?auto_931975 ) ) ( not ( = ?auto_931972 ?auto_931977 ) ) ( not ( = ?auto_931972 ?auto_931976 ) ) ( not ( = ?auto_931972 ?auto_931978 ) ) ( not ( = ?auto_931972 ?auto_931979 ) ) ( not ( = ?auto_931972 ?auto_931980 ) ) ( not ( = ?auto_931972 ?auto_931981 ) ) ( not ( = ?auto_931972 ?auto_931982 ) ) ( not ( = ?auto_931973 ?auto_931974 ) ) ( not ( = ?auto_931973 ?auto_931971 ) ) ( not ( = ?auto_931973 ?auto_931975 ) ) ( not ( = ?auto_931973 ?auto_931977 ) ) ( not ( = ?auto_931973 ?auto_931976 ) ) ( not ( = ?auto_931973 ?auto_931978 ) ) ( not ( = ?auto_931973 ?auto_931979 ) ) ( not ( = ?auto_931973 ?auto_931980 ) ) ( not ( = ?auto_931973 ?auto_931981 ) ) ( not ( = ?auto_931973 ?auto_931982 ) ) ( not ( = ?auto_931974 ?auto_931971 ) ) ( not ( = ?auto_931974 ?auto_931975 ) ) ( not ( = ?auto_931974 ?auto_931977 ) ) ( not ( = ?auto_931974 ?auto_931976 ) ) ( not ( = ?auto_931974 ?auto_931978 ) ) ( not ( = ?auto_931974 ?auto_931979 ) ) ( not ( = ?auto_931974 ?auto_931980 ) ) ( not ( = ?auto_931974 ?auto_931981 ) ) ( not ( = ?auto_931974 ?auto_931982 ) ) ( not ( = ?auto_931971 ?auto_931975 ) ) ( not ( = ?auto_931971 ?auto_931977 ) ) ( not ( = ?auto_931971 ?auto_931976 ) ) ( not ( = ?auto_931971 ?auto_931978 ) ) ( not ( = ?auto_931971 ?auto_931979 ) ) ( not ( = ?auto_931971 ?auto_931980 ) ) ( not ( = ?auto_931971 ?auto_931981 ) ) ( not ( = ?auto_931971 ?auto_931982 ) ) ( not ( = ?auto_931975 ?auto_931977 ) ) ( not ( = ?auto_931975 ?auto_931976 ) ) ( not ( = ?auto_931975 ?auto_931978 ) ) ( not ( = ?auto_931975 ?auto_931979 ) ) ( not ( = ?auto_931975 ?auto_931980 ) ) ( not ( = ?auto_931975 ?auto_931981 ) ) ( not ( = ?auto_931975 ?auto_931982 ) ) ( not ( = ?auto_931977 ?auto_931976 ) ) ( not ( = ?auto_931977 ?auto_931978 ) ) ( not ( = ?auto_931977 ?auto_931979 ) ) ( not ( = ?auto_931977 ?auto_931980 ) ) ( not ( = ?auto_931977 ?auto_931981 ) ) ( not ( = ?auto_931977 ?auto_931982 ) ) ( not ( = ?auto_931976 ?auto_931978 ) ) ( not ( = ?auto_931976 ?auto_931979 ) ) ( not ( = ?auto_931976 ?auto_931980 ) ) ( not ( = ?auto_931976 ?auto_931981 ) ) ( not ( = ?auto_931976 ?auto_931982 ) ) ( not ( = ?auto_931978 ?auto_931979 ) ) ( not ( = ?auto_931978 ?auto_931980 ) ) ( not ( = ?auto_931978 ?auto_931981 ) ) ( not ( = ?auto_931978 ?auto_931982 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_931979 ?auto_931980 ?auto_931981 )
      ( MAKE-10CRATE-VERIFY ?auto_931972 ?auto_931973 ?auto_931974 ?auto_931971 ?auto_931975 ?auto_931977 ?auto_931976 ?auto_931978 ?auto_931979 ?auto_931980 ?auto_931981 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_932098 - SURFACE
      ?auto_932099 - SURFACE
      ?auto_932100 - SURFACE
      ?auto_932097 - SURFACE
      ?auto_932101 - SURFACE
      ?auto_932103 - SURFACE
      ?auto_932102 - SURFACE
      ?auto_932104 - SURFACE
      ?auto_932105 - SURFACE
      ?auto_932106 - SURFACE
      ?auto_932107 - SURFACE
    )
    :vars
    (
      ?auto_932109 - HOIST
      ?auto_932113 - PLACE
      ?auto_932112 - PLACE
      ?auto_932108 - HOIST
      ?auto_932111 - SURFACE
      ?auto_932110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_932109 ?auto_932113 ) ( IS-CRATE ?auto_932107 ) ( not ( = ?auto_932106 ?auto_932107 ) ) ( not ( = ?auto_932105 ?auto_932106 ) ) ( not ( = ?auto_932105 ?auto_932107 ) ) ( not ( = ?auto_932112 ?auto_932113 ) ) ( HOIST-AT ?auto_932108 ?auto_932112 ) ( not ( = ?auto_932109 ?auto_932108 ) ) ( AVAILABLE ?auto_932108 ) ( SURFACE-AT ?auto_932107 ?auto_932112 ) ( ON ?auto_932107 ?auto_932111 ) ( CLEAR ?auto_932107 ) ( not ( = ?auto_932106 ?auto_932111 ) ) ( not ( = ?auto_932107 ?auto_932111 ) ) ( not ( = ?auto_932105 ?auto_932111 ) ) ( TRUCK-AT ?auto_932110 ?auto_932113 ) ( SURFACE-AT ?auto_932105 ?auto_932113 ) ( CLEAR ?auto_932105 ) ( LIFTING ?auto_932109 ?auto_932106 ) ( IS-CRATE ?auto_932106 ) ( ON ?auto_932099 ?auto_932098 ) ( ON ?auto_932100 ?auto_932099 ) ( ON ?auto_932097 ?auto_932100 ) ( ON ?auto_932101 ?auto_932097 ) ( ON ?auto_932103 ?auto_932101 ) ( ON ?auto_932102 ?auto_932103 ) ( ON ?auto_932104 ?auto_932102 ) ( ON ?auto_932105 ?auto_932104 ) ( not ( = ?auto_932098 ?auto_932099 ) ) ( not ( = ?auto_932098 ?auto_932100 ) ) ( not ( = ?auto_932098 ?auto_932097 ) ) ( not ( = ?auto_932098 ?auto_932101 ) ) ( not ( = ?auto_932098 ?auto_932103 ) ) ( not ( = ?auto_932098 ?auto_932102 ) ) ( not ( = ?auto_932098 ?auto_932104 ) ) ( not ( = ?auto_932098 ?auto_932105 ) ) ( not ( = ?auto_932098 ?auto_932106 ) ) ( not ( = ?auto_932098 ?auto_932107 ) ) ( not ( = ?auto_932098 ?auto_932111 ) ) ( not ( = ?auto_932099 ?auto_932100 ) ) ( not ( = ?auto_932099 ?auto_932097 ) ) ( not ( = ?auto_932099 ?auto_932101 ) ) ( not ( = ?auto_932099 ?auto_932103 ) ) ( not ( = ?auto_932099 ?auto_932102 ) ) ( not ( = ?auto_932099 ?auto_932104 ) ) ( not ( = ?auto_932099 ?auto_932105 ) ) ( not ( = ?auto_932099 ?auto_932106 ) ) ( not ( = ?auto_932099 ?auto_932107 ) ) ( not ( = ?auto_932099 ?auto_932111 ) ) ( not ( = ?auto_932100 ?auto_932097 ) ) ( not ( = ?auto_932100 ?auto_932101 ) ) ( not ( = ?auto_932100 ?auto_932103 ) ) ( not ( = ?auto_932100 ?auto_932102 ) ) ( not ( = ?auto_932100 ?auto_932104 ) ) ( not ( = ?auto_932100 ?auto_932105 ) ) ( not ( = ?auto_932100 ?auto_932106 ) ) ( not ( = ?auto_932100 ?auto_932107 ) ) ( not ( = ?auto_932100 ?auto_932111 ) ) ( not ( = ?auto_932097 ?auto_932101 ) ) ( not ( = ?auto_932097 ?auto_932103 ) ) ( not ( = ?auto_932097 ?auto_932102 ) ) ( not ( = ?auto_932097 ?auto_932104 ) ) ( not ( = ?auto_932097 ?auto_932105 ) ) ( not ( = ?auto_932097 ?auto_932106 ) ) ( not ( = ?auto_932097 ?auto_932107 ) ) ( not ( = ?auto_932097 ?auto_932111 ) ) ( not ( = ?auto_932101 ?auto_932103 ) ) ( not ( = ?auto_932101 ?auto_932102 ) ) ( not ( = ?auto_932101 ?auto_932104 ) ) ( not ( = ?auto_932101 ?auto_932105 ) ) ( not ( = ?auto_932101 ?auto_932106 ) ) ( not ( = ?auto_932101 ?auto_932107 ) ) ( not ( = ?auto_932101 ?auto_932111 ) ) ( not ( = ?auto_932103 ?auto_932102 ) ) ( not ( = ?auto_932103 ?auto_932104 ) ) ( not ( = ?auto_932103 ?auto_932105 ) ) ( not ( = ?auto_932103 ?auto_932106 ) ) ( not ( = ?auto_932103 ?auto_932107 ) ) ( not ( = ?auto_932103 ?auto_932111 ) ) ( not ( = ?auto_932102 ?auto_932104 ) ) ( not ( = ?auto_932102 ?auto_932105 ) ) ( not ( = ?auto_932102 ?auto_932106 ) ) ( not ( = ?auto_932102 ?auto_932107 ) ) ( not ( = ?auto_932102 ?auto_932111 ) ) ( not ( = ?auto_932104 ?auto_932105 ) ) ( not ( = ?auto_932104 ?auto_932106 ) ) ( not ( = ?auto_932104 ?auto_932107 ) ) ( not ( = ?auto_932104 ?auto_932111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_932105 ?auto_932106 ?auto_932107 )
      ( MAKE-10CRATE-VERIFY ?auto_932098 ?auto_932099 ?auto_932100 ?auto_932097 ?auto_932101 ?auto_932103 ?auto_932102 ?auto_932104 ?auto_932105 ?auto_932106 ?auto_932107 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_932224 - SURFACE
      ?auto_932225 - SURFACE
      ?auto_932226 - SURFACE
      ?auto_932223 - SURFACE
      ?auto_932227 - SURFACE
      ?auto_932229 - SURFACE
      ?auto_932228 - SURFACE
      ?auto_932230 - SURFACE
      ?auto_932231 - SURFACE
      ?auto_932232 - SURFACE
      ?auto_932233 - SURFACE
    )
    :vars
    (
      ?auto_932235 - HOIST
      ?auto_932236 - PLACE
      ?auto_932239 - PLACE
      ?auto_932238 - HOIST
      ?auto_932237 - SURFACE
      ?auto_932234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_932235 ?auto_932236 ) ( IS-CRATE ?auto_932233 ) ( not ( = ?auto_932232 ?auto_932233 ) ) ( not ( = ?auto_932231 ?auto_932232 ) ) ( not ( = ?auto_932231 ?auto_932233 ) ) ( not ( = ?auto_932239 ?auto_932236 ) ) ( HOIST-AT ?auto_932238 ?auto_932239 ) ( not ( = ?auto_932235 ?auto_932238 ) ) ( AVAILABLE ?auto_932238 ) ( SURFACE-AT ?auto_932233 ?auto_932239 ) ( ON ?auto_932233 ?auto_932237 ) ( CLEAR ?auto_932233 ) ( not ( = ?auto_932232 ?auto_932237 ) ) ( not ( = ?auto_932233 ?auto_932237 ) ) ( not ( = ?auto_932231 ?auto_932237 ) ) ( TRUCK-AT ?auto_932234 ?auto_932236 ) ( SURFACE-AT ?auto_932231 ?auto_932236 ) ( CLEAR ?auto_932231 ) ( IS-CRATE ?auto_932232 ) ( AVAILABLE ?auto_932235 ) ( IN ?auto_932232 ?auto_932234 ) ( ON ?auto_932225 ?auto_932224 ) ( ON ?auto_932226 ?auto_932225 ) ( ON ?auto_932223 ?auto_932226 ) ( ON ?auto_932227 ?auto_932223 ) ( ON ?auto_932229 ?auto_932227 ) ( ON ?auto_932228 ?auto_932229 ) ( ON ?auto_932230 ?auto_932228 ) ( ON ?auto_932231 ?auto_932230 ) ( not ( = ?auto_932224 ?auto_932225 ) ) ( not ( = ?auto_932224 ?auto_932226 ) ) ( not ( = ?auto_932224 ?auto_932223 ) ) ( not ( = ?auto_932224 ?auto_932227 ) ) ( not ( = ?auto_932224 ?auto_932229 ) ) ( not ( = ?auto_932224 ?auto_932228 ) ) ( not ( = ?auto_932224 ?auto_932230 ) ) ( not ( = ?auto_932224 ?auto_932231 ) ) ( not ( = ?auto_932224 ?auto_932232 ) ) ( not ( = ?auto_932224 ?auto_932233 ) ) ( not ( = ?auto_932224 ?auto_932237 ) ) ( not ( = ?auto_932225 ?auto_932226 ) ) ( not ( = ?auto_932225 ?auto_932223 ) ) ( not ( = ?auto_932225 ?auto_932227 ) ) ( not ( = ?auto_932225 ?auto_932229 ) ) ( not ( = ?auto_932225 ?auto_932228 ) ) ( not ( = ?auto_932225 ?auto_932230 ) ) ( not ( = ?auto_932225 ?auto_932231 ) ) ( not ( = ?auto_932225 ?auto_932232 ) ) ( not ( = ?auto_932225 ?auto_932233 ) ) ( not ( = ?auto_932225 ?auto_932237 ) ) ( not ( = ?auto_932226 ?auto_932223 ) ) ( not ( = ?auto_932226 ?auto_932227 ) ) ( not ( = ?auto_932226 ?auto_932229 ) ) ( not ( = ?auto_932226 ?auto_932228 ) ) ( not ( = ?auto_932226 ?auto_932230 ) ) ( not ( = ?auto_932226 ?auto_932231 ) ) ( not ( = ?auto_932226 ?auto_932232 ) ) ( not ( = ?auto_932226 ?auto_932233 ) ) ( not ( = ?auto_932226 ?auto_932237 ) ) ( not ( = ?auto_932223 ?auto_932227 ) ) ( not ( = ?auto_932223 ?auto_932229 ) ) ( not ( = ?auto_932223 ?auto_932228 ) ) ( not ( = ?auto_932223 ?auto_932230 ) ) ( not ( = ?auto_932223 ?auto_932231 ) ) ( not ( = ?auto_932223 ?auto_932232 ) ) ( not ( = ?auto_932223 ?auto_932233 ) ) ( not ( = ?auto_932223 ?auto_932237 ) ) ( not ( = ?auto_932227 ?auto_932229 ) ) ( not ( = ?auto_932227 ?auto_932228 ) ) ( not ( = ?auto_932227 ?auto_932230 ) ) ( not ( = ?auto_932227 ?auto_932231 ) ) ( not ( = ?auto_932227 ?auto_932232 ) ) ( not ( = ?auto_932227 ?auto_932233 ) ) ( not ( = ?auto_932227 ?auto_932237 ) ) ( not ( = ?auto_932229 ?auto_932228 ) ) ( not ( = ?auto_932229 ?auto_932230 ) ) ( not ( = ?auto_932229 ?auto_932231 ) ) ( not ( = ?auto_932229 ?auto_932232 ) ) ( not ( = ?auto_932229 ?auto_932233 ) ) ( not ( = ?auto_932229 ?auto_932237 ) ) ( not ( = ?auto_932228 ?auto_932230 ) ) ( not ( = ?auto_932228 ?auto_932231 ) ) ( not ( = ?auto_932228 ?auto_932232 ) ) ( not ( = ?auto_932228 ?auto_932233 ) ) ( not ( = ?auto_932228 ?auto_932237 ) ) ( not ( = ?auto_932230 ?auto_932231 ) ) ( not ( = ?auto_932230 ?auto_932232 ) ) ( not ( = ?auto_932230 ?auto_932233 ) ) ( not ( = ?auto_932230 ?auto_932237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_932231 ?auto_932232 ?auto_932233 )
      ( MAKE-10CRATE-VERIFY ?auto_932224 ?auto_932225 ?auto_932226 ?auto_932223 ?auto_932227 ?auto_932229 ?auto_932228 ?auto_932230 ?auto_932231 ?auto_932232 ?auto_932233 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939469 - SURFACE
      ?auto_939470 - SURFACE
      ?auto_939471 - SURFACE
      ?auto_939468 - SURFACE
      ?auto_939472 - SURFACE
      ?auto_939474 - SURFACE
      ?auto_939473 - SURFACE
      ?auto_939475 - SURFACE
      ?auto_939476 - SURFACE
      ?auto_939477 - SURFACE
      ?auto_939478 - SURFACE
      ?auto_939479 - SURFACE
    )
    :vars
    (
      ?auto_939481 - HOIST
      ?auto_939480 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939481 ?auto_939480 ) ( SURFACE-AT ?auto_939478 ?auto_939480 ) ( CLEAR ?auto_939478 ) ( LIFTING ?auto_939481 ?auto_939479 ) ( IS-CRATE ?auto_939479 ) ( not ( = ?auto_939478 ?auto_939479 ) ) ( ON ?auto_939470 ?auto_939469 ) ( ON ?auto_939471 ?auto_939470 ) ( ON ?auto_939468 ?auto_939471 ) ( ON ?auto_939472 ?auto_939468 ) ( ON ?auto_939474 ?auto_939472 ) ( ON ?auto_939473 ?auto_939474 ) ( ON ?auto_939475 ?auto_939473 ) ( ON ?auto_939476 ?auto_939475 ) ( ON ?auto_939477 ?auto_939476 ) ( ON ?auto_939478 ?auto_939477 ) ( not ( = ?auto_939469 ?auto_939470 ) ) ( not ( = ?auto_939469 ?auto_939471 ) ) ( not ( = ?auto_939469 ?auto_939468 ) ) ( not ( = ?auto_939469 ?auto_939472 ) ) ( not ( = ?auto_939469 ?auto_939474 ) ) ( not ( = ?auto_939469 ?auto_939473 ) ) ( not ( = ?auto_939469 ?auto_939475 ) ) ( not ( = ?auto_939469 ?auto_939476 ) ) ( not ( = ?auto_939469 ?auto_939477 ) ) ( not ( = ?auto_939469 ?auto_939478 ) ) ( not ( = ?auto_939469 ?auto_939479 ) ) ( not ( = ?auto_939470 ?auto_939471 ) ) ( not ( = ?auto_939470 ?auto_939468 ) ) ( not ( = ?auto_939470 ?auto_939472 ) ) ( not ( = ?auto_939470 ?auto_939474 ) ) ( not ( = ?auto_939470 ?auto_939473 ) ) ( not ( = ?auto_939470 ?auto_939475 ) ) ( not ( = ?auto_939470 ?auto_939476 ) ) ( not ( = ?auto_939470 ?auto_939477 ) ) ( not ( = ?auto_939470 ?auto_939478 ) ) ( not ( = ?auto_939470 ?auto_939479 ) ) ( not ( = ?auto_939471 ?auto_939468 ) ) ( not ( = ?auto_939471 ?auto_939472 ) ) ( not ( = ?auto_939471 ?auto_939474 ) ) ( not ( = ?auto_939471 ?auto_939473 ) ) ( not ( = ?auto_939471 ?auto_939475 ) ) ( not ( = ?auto_939471 ?auto_939476 ) ) ( not ( = ?auto_939471 ?auto_939477 ) ) ( not ( = ?auto_939471 ?auto_939478 ) ) ( not ( = ?auto_939471 ?auto_939479 ) ) ( not ( = ?auto_939468 ?auto_939472 ) ) ( not ( = ?auto_939468 ?auto_939474 ) ) ( not ( = ?auto_939468 ?auto_939473 ) ) ( not ( = ?auto_939468 ?auto_939475 ) ) ( not ( = ?auto_939468 ?auto_939476 ) ) ( not ( = ?auto_939468 ?auto_939477 ) ) ( not ( = ?auto_939468 ?auto_939478 ) ) ( not ( = ?auto_939468 ?auto_939479 ) ) ( not ( = ?auto_939472 ?auto_939474 ) ) ( not ( = ?auto_939472 ?auto_939473 ) ) ( not ( = ?auto_939472 ?auto_939475 ) ) ( not ( = ?auto_939472 ?auto_939476 ) ) ( not ( = ?auto_939472 ?auto_939477 ) ) ( not ( = ?auto_939472 ?auto_939478 ) ) ( not ( = ?auto_939472 ?auto_939479 ) ) ( not ( = ?auto_939474 ?auto_939473 ) ) ( not ( = ?auto_939474 ?auto_939475 ) ) ( not ( = ?auto_939474 ?auto_939476 ) ) ( not ( = ?auto_939474 ?auto_939477 ) ) ( not ( = ?auto_939474 ?auto_939478 ) ) ( not ( = ?auto_939474 ?auto_939479 ) ) ( not ( = ?auto_939473 ?auto_939475 ) ) ( not ( = ?auto_939473 ?auto_939476 ) ) ( not ( = ?auto_939473 ?auto_939477 ) ) ( not ( = ?auto_939473 ?auto_939478 ) ) ( not ( = ?auto_939473 ?auto_939479 ) ) ( not ( = ?auto_939475 ?auto_939476 ) ) ( not ( = ?auto_939475 ?auto_939477 ) ) ( not ( = ?auto_939475 ?auto_939478 ) ) ( not ( = ?auto_939475 ?auto_939479 ) ) ( not ( = ?auto_939476 ?auto_939477 ) ) ( not ( = ?auto_939476 ?auto_939478 ) ) ( not ( = ?auto_939476 ?auto_939479 ) ) ( not ( = ?auto_939477 ?auto_939478 ) ) ( not ( = ?auto_939477 ?auto_939479 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_939478 ?auto_939479 )
      ( MAKE-11CRATE-VERIFY ?auto_939469 ?auto_939470 ?auto_939471 ?auto_939468 ?auto_939472 ?auto_939474 ?auto_939473 ?auto_939475 ?auto_939476 ?auto_939477 ?auto_939478 ?auto_939479 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939578 - SURFACE
      ?auto_939579 - SURFACE
      ?auto_939580 - SURFACE
      ?auto_939577 - SURFACE
      ?auto_939581 - SURFACE
      ?auto_939583 - SURFACE
      ?auto_939582 - SURFACE
      ?auto_939584 - SURFACE
      ?auto_939585 - SURFACE
      ?auto_939586 - SURFACE
      ?auto_939587 - SURFACE
      ?auto_939588 - SURFACE
    )
    :vars
    (
      ?auto_939591 - HOIST
      ?auto_939589 - PLACE
      ?auto_939590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_939591 ?auto_939589 ) ( SURFACE-AT ?auto_939587 ?auto_939589 ) ( CLEAR ?auto_939587 ) ( IS-CRATE ?auto_939588 ) ( not ( = ?auto_939587 ?auto_939588 ) ) ( TRUCK-AT ?auto_939590 ?auto_939589 ) ( AVAILABLE ?auto_939591 ) ( IN ?auto_939588 ?auto_939590 ) ( ON ?auto_939587 ?auto_939586 ) ( not ( = ?auto_939586 ?auto_939587 ) ) ( not ( = ?auto_939586 ?auto_939588 ) ) ( ON ?auto_939579 ?auto_939578 ) ( ON ?auto_939580 ?auto_939579 ) ( ON ?auto_939577 ?auto_939580 ) ( ON ?auto_939581 ?auto_939577 ) ( ON ?auto_939583 ?auto_939581 ) ( ON ?auto_939582 ?auto_939583 ) ( ON ?auto_939584 ?auto_939582 ) ( ON ?auto_939585 ?auto_939584 ) ( ON ?auto_939586 ?auto_939585 ) ( not ( = ?auto_939578 ?auto_939579 ) ) ( not ( = ?auto_939578 ?auto_939580 ) ) ( not ( = ?auto_939578 ?auto_939577 ) ) ( not ( = ?auto_939578 ?auto_939581 ) ) ( not ( = ?auto_939578 ?auto_939583 ) ) ( not ( = ?auto_939578 ?auto_939582 ) ) ( not ( = ?auto_939578 ?auto_939584 ) ) ( not ( = ?auto_939578 ?auto_939585 ) ) ( not ( = ?auto_939578 ?auto_939586 ) ) ( not ( = ?auto_939578 ?auto_939587 ) ) ( not ( = ?auto_939578 ?auto_939588 ) ) ( not ( = ?auto_939579 ?auto_939580 ) ) ( not ( = ?auto_939579 ?auto_939577 ) ) ( not ( = ?auto_939579 ?auto_939581 ) ) ( not ( = ?auto_939579 ?auto_939583 ) ) ( not ( = ?auto_939579 ?auto_939582 ) ) ( not ( = ?auto_939579 ?auto_939584 ) ) ( not ( = ?auto_939579 ?auto_939585 ) ) ( not ( = ?auto_939579 ?auto_939586 ) ) ( not ( = ?auto_939579 ?auto_939587 ) ) ( not ( = ?auto_939579 ?auto_939588 ) ) ( not ( = ?auto_939580 ?auto_939577 ) ) ( not ( = ?auto_939580 ?auto_939581 ) ) ( not ( = ?auto_939580 ?auto_939583 ) ) ( not ( = ?auto_939580 ?auto_939582 ) ) ( not ( = ?auto_939580 ?auto_939584 ) ) ( not ( = ?auto_939580 ?auto_939585 ) ) ( not ( = ?auto_939580 ?auto_939586 ) ) ( not ( = ?auto_939580 ?auto_939587 ) ) ( not ( = ?auto_939580 ?auto_939588 ) ) ( not ( = ?auto_939577 ?auto_939581 ) ) ( not ( = ?auto_939577 ?auto_939583 ) ) ( not ( = ?auto_939577 ?auto_939582 ) ) ( not ( = ?auto_939577 ?auto_939584 ) ) ( not ( = ?auto_939577 ?auto_939585 ) ) ( not ( = ?auto_939577 ?auto_939586 ) ) ( not ( = ?auto_939577 ?auto_939587 ) ) ( not ( = ?auto_939577 ?auto_939588 ) ) ( not ( = ?auto_939581 ?auto_939583 ) ) ( not ( = ?auto_939581 ?auto_939582 ) ) ( not ( = ?auto_939581 ?auto_939584 ) ) ( not ( = ?auto_939581 ?auto_939585 ) ) ( not ( = ?auto_939581 ?auto_939586 ) ) ( not ( = ?auto_939581 ?auto_939587 ) ) ( not ( = ?auto_939581 ?auto_939588 ) ) ( not ( = ?auto_939583 ?auto_939582 ) ) ( not ( = ?auto_939583 ?auto_939584 ) ) ( not ( = ?auto_939583 ?auto_939585 ) ) ( not ( = ?auto_939583 ?auto_939586 ) ) ( not ( = ?auto_939583 ?auto_939587 ) ) ( not ( = ?auto_939583 ?auto_939588 ) ) ( not ( = ?auto_939582 ?auto_939584 ) ) ( not ( = ?auto_939582 ?auto_939585 ) ) ( not ( = ?auto_939582 ?auto_939586 ) ) ( not ( = ?auto_939582 ?auto_939587 ) ) ( not ( = ?auto_939582 ?auto_939588 ) ) ( not ( = ?auto_939584 ?auto_939585 ) ) ( not ( = ?auto_939584 ?auto_939586 ) ) ( not ( = ?auto_939584 ?auto_939587 ) ) ( not ( = ?auto_939584 ?auto_939588 ) ) ( not ( = ?auto_939585 ?auto_939586 ) ) ( not ( = ?auto_939585 ?auto_939587 ) ) ( not ( = ?auto_939585 ?auto_939588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939586 ?auto_939587 ?auto_939588 )
      ( MAKE-11CRATE-VERIFY ?auto_939578 ?auto_939579 ?auto_939580 ?auto_939577 ?auto_939581 ?auto_939583 ?auto_939582 ?auto_939584 ?auto_939585 ?auto_939586 ?auto_939587 ?auto_939588 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939699 - SURFACE
      ?auto_939700 - SURFACE
      ?auto_939701 - SURFACE
      ?auto_939698 - SURFACE
      ?auto_939702 - SURFACE
      ?auto_939704 - SURFACE
      ?auto_939703 - SURFACE
      ?auto_939705 - SURFACE
      ?auto_939706 - SURFACE
      ?auto_939707 - SURFACE
      ?auto_939708 - SURFACE
      ?auto_939709 - SURFACE
    )
    :vars
    (
      ?auto_939713 - HOIST
      ?auto_939710 - PLACE
      ?auto_939712 - TRUCK
      ?auto_939711 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939713 ?auto_939710 ) ( SURFACE-AT ?auto_939708 ?auto_939710 ) ( CLEAR ?auto_939708 ) ( IS-CRATE ?auto_939709 ) ( not ( = ?auto_939708 ?auto_939709 ) ) ( AVAILABLE ?auto_939713 ) ( IN ?auto_939709 ?auto_939712 ) ( ON ?auto_939708 ?auto_939707 ) ( not ( = ?auto_939707 ?auto_939708 ) ) ( not ( = ?auto_939707 ?auto_939709 ) ) ( TRUCK-AT ?auto_939712 ?auto_939711 ) ( not ( = ?auto_939711 ?auto_939710 ) ) ( ON ?auto_939700 ?auto_939699 ) ( ON ?auto_939701 ?auto_939700 ) ( ON ?auto_939698 ?auto_939701 ) ( ON ?auto_939702 ?auto_939698 ) ( ON ?auto_939704 ?auto_939702 ) ( ON ?auto_939703 ?auto_939704 ) ( ON ?auto_939705 ?auto_939703 ) ( ON ?auto_939706 ?auto_939705 ) ( ON ?auto_939707 ?auto_939706 ) ( not ( = ?auto_939699 ?auto_939700 ) ) ( not ( = ?auto_939699 ?auto_939701 ) ) ( not ( = ?auto_939699 ?auto_939698 ) ) ( not ( = ?auto_939699 ?auto_939702 ) ) ( not ( = ?auto_939699 ?auto_939704 ) ) ( not ( = ?auto_939699 ?auto_939703 ) ) ( not ( = ?auto_939699 ?auto_939705 ) ) ( not ( = ?auto_939699 ?auto_939706 ) ) ( not ( = ?auto_939699 ?auto_939707 ) ) ( not ( = ?auto_939699 ?auto_939708 ) ) ( not ( = ?auto_939699 ?auto_939709 ) ) ( not ( = ?auto_939700 ?auto_939701 ) ) ( not ( = ?auto_939700 ?auto_939698 ) ) ( not ( = ?auto_939700 ?auto_939702 ) ) ( not ( = ?auto_939700 ?auto_939704 ) ) ( not ( = ?auto_939700 ?auto_939703 ) ) ( not ( = ?auto_939700 ?auto_939705 ) ) ( not ( = ?auto_939700 ?auto_939706 ) ) ( not ( = ?auto_939700 ?auto_939707 ) ) ( not ( = ?auto_939700 ?auto_939708 ) ) ( not ( = ?auto_939700 ?auto_939709 ) ) ( not ( = ?auto_939701 ?auto_939698 ) ) ( not ( = ?auto_939701 ?auto_939702 ) ) ( not ( = ?auto_939701 ?auto_939704 ) ) ( not ( = ?auto_939701 ?auto_939703 ) ) ( not ( = ?auto_939701 ?auto_939705 ) ) ( not ( = ?auto_939701 ?auto_939706 ) ) ( not ( = ?auto_939701 ?auto_939707 ) ) ( not ( = ?auto_939701 ?auto_939708 ) ) ( not ( = ?auto_939701 ?auto_939709 ) ) ( not ( = ?auto_939698 ?auto_939702 ) ) ( not ( = ?auto_939698 ?auto_939704 ) ) ( not ( = ?auto_939698 ?auto_939703 ) ) ( not ( = ?auto_939698 ?auto_939705 ) ) ( not ( = ?auto_939698 ?auto_939706 ) ) ( not ( = ?auto_939698 ?auto_939707 ) ) ( not ( = ?auto_939698 ?auto_939708 ) ) ( not ( = ?auto_939698 ?auto_939709 ) ) ( not ( = ?auto_939702 ?auto_939704 ) ) ( not ( = ?auto_939702 ?auto_939703 ) ) ( not ( = ?auto_939702 ?auto_939705 ) ) ( not ( = ?auto_939702 ?auto_939706 ) ) ( not ( = ?auto_939702 ?auto_939707 ) ) ( not ( = ?auto_939702 ?auto_939708 ) ) ( not ( = ?auto_939702 ?auto_939709 ) ) ( not ( = ?auto_939704 ?auto_939703 ) ) ( not ( = ?auto_939704 ?auto_939705 ) ) ( not ( = ?auto_939704 ?auto_939706 ) ) ( not ( = ?auto_939704 ?auto_939707 ) ) ( not ( = ?auto_939704 ?auto_939708 ) ) ( not ( = ?auto_939704 ?auto_939709 ) ) ( not ( = ?auto_939703 ?auto_939705 ) ) ( not ( = ?auto_939703 ?auto_939706 ) ) ( not ( = ?auto_939703 ?auto_939707 ) ) ( not ( = ?auto_939703 ?auto_939708 ) ) ( not ( = ?auto_939703 ?auto_939709 ) ) ( not ( = ?auto_939705 ?auto_939706 ) ) ( not ( = ?auto_939705 ?auto_939707 ) ) ( not ( = ?auto_939705 ?auto_939708 ) ) ( not ( = ?auto_939705 ?auto_939709 ) ) ( not ( = ?auto_939706 ?auto_939707 ) ) ( not ( = ?auto_939706 ?auto_939708 ) ) ( not ( = ?auto_939706 ?auto_939709 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939707 ?auto_939708 ?auto_939709 )
      ( MAKE-11CRATE-VERIFY ?auto_939699 ?auto_939700 ?auto_939701 ?auto_939698 ?auto_939702 ?auto_939704 ?auto_939703 ?auto_939705 ?auto_939706 ?auto_939707 ?auto_939708 ?auto_939709 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939831 - SURFACE
      ?auto_939832 - SURFACE
      ?auto_939833 - SURFACE
      ?auto_939830 - SURFACE
      ?auto_939834 - SURFACE
      ?auto_939836 - SURFACE
      ?auto_939835 - SURFACE
      ?auto_939837 - SURFACE
      ?auto_939838 - SURFACE
      ?auto_939839 - SURFACE
      ?auto_939840 - SURFACE
      ?auto_939841 - SURFACE
    )
    :vars
    (
      ?auto_939844 - HOIST
      ?auto_939846 - PLACE
      ?auto_939845 - TRUCK
      ?auto_939842 - PLACE
      ?auto_939843 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_939844 ?auto_939846 ) ( SURFACE-AT ?auto_939840 ?auto_939846 ) ( CLEAR ?auto_939840 ) ( IS-CRATE ?auto_939841 ) ( not ( = ?auto_939840 ?auto_939841 ) ) ( AVAILABLE ?auto_939844 ) ( ON ?auto_939840 ?auto_939839 ) ( not ( = ?auto_939839 ?auto_939840 ) ) ( not ( = ?auto_939839 ?auto_939841 ) ) ( TRUCK-AT ?auto_939845 ?auto_939842 ) ( not ( = ?auto_939842 ?auto_939846 ) ) ( HOIST-AT ?auto_939843 ?auto_939842 ) ( LIFTING ?auto_939843 ?auto_939841 ) ( not ( = ?auto_939844 ?auto_939843 ) ) ( ON ?auto_939832 ?auto_939831 ) ( ON ?auto_939833 ?auto_939832 ) ( ON ?auto_939830 ?auto_939833 ) ( ON ?auto_939834 ?auto_939830 ) ( ON ?auto_939836 ?auto_939834 ) ( ON ?auto_939835 ?auto_939836 ) ( ON ?auto_939837 ?auto_939835 ) ( ON ?auto_939838 ?auto_939837 ) ( ON ?auto_939839 ?auto_939838 ) ( not ( = ?auto_939831 ?auto_939832 ) ) ( not ( = ?auto_939831 ?auto_939833 ) ) ( not ( = ?auto_939831 ?auto_939830 ) ) ( not ( = ?auto_939831 ?auto_939834 ) ) ( not ( = ?auto_939831 ?auto_939836 ) ) ( not ( = ?auto_939831 ?auto_939835 ) ) ( not ( = ?auto_939831 ?auto_939837 ) ) ( not ( = ?auto_939831 ?auto_939838 ) ) ( not ( = ?auto_939831 ?auto_939839 ) ) ( not ( = ?auto_939831 ?auto_939840 ) ) ( not ( = ?auto_939831 ?auto_939841 ) ) ( not ( = ?auto_939832 ?auto_939833 ) ) ( not ( = ?auto_939832 ?auto_939830 ) ) ( not ( = ?auto_939832 ?auto_939834 ) ) ( not ( = ?auto_939832 ?auto_939836 ) ) ( not ( = ?auto_939832 ?auto_939835 ) ) ( not ( = ?auto_939832 ?auto_939837 ) ) ( not ( = ?auto_939832 ?auto_939838 ) ) ( not ( = ?auto_939832 ?auto_939839 ) ) ( not ( = ?auto_939832 ?auto_939840 ) ) ( not ( = ?auto_939832 ?auto_939841 ) ) ( not ( = ?auto_939833 ?auto_939830 ) ) ( not ( = ?auto_939833 ?auto_939834 ) ) ( not ( = ?auto_939833 ?auto_939836 ) ) ( not ( = ?auto_939833 ?auto_939835 ) ) ( not ( = ?auto_939833 ?auto_939837 ) ) ( not ( = ?auto_939833 ?auto_939838 ) ) ( not ( = ?auto_939833 ?auto_939839 ) ) ( not ( = ?auto_939833 ?auto_939840 ) ) ( not ( = ?auto_939833 ?auto_939841 ) ) ( not ( = ?auto_939830 ?auto_939834 ) ) ( not ( = ?auto_939830 ?auto_939836 ) ) ( not ( = ?auto_939830 ?auto_939835 ) ) ( not ( = ?auto_939830 ?auto_939837 ) ) ( not ( = ?auto_939830 ?auto_939838 ) ) ( not ( = ?auto_939830 ?auto_939839 ) ) ( not ( = ?auto_939830 ?auto_939840 ) ) ( not ( = ?auto_939830 ?auto_939841 ) ) ( not ( = ?auto_939834 ?auto_939836 ) ) ( not ( = ?auto_939834 ?auto_939835 ) ) ( not ( = ?auto_939834 ?auto_939837 ) ) ( not ( = ?auto_939834 ?auto_939838 ) ) ( not ( = ?auto_939834 ?auto_939839 ) ) ( not ( = ?auto_939834 ?auto_939840 ) ) ( not ( = ?auto_939834 ?auto_939841 ) ) ( not ( = ?auto_939836 ?auto_939835 ) ) ( not ( = ?auto_939836 ?auto_939837 ) ) ( not ( = ?auto_939836 ?auto_939838 ) ) ( not ( = ?auto_939836 ?auto_939839 ) ) ( not ( = ?auto_939836 ?auto_939840 ) ) ( not ( = ?auto_939836 ?auto_939841 ) ) ( not ( = ?auto_939835 ?auto_939837 ) ) ( not ( = ?auto_939835 ?auto_939838 ) ) ( not ( = ?auto_939835 ?auto_939839 ) ) ( not ( = ?auto_939835 ?auto_939840 ) ) ( not ( = ?auto_939835 ?auto_939841 ) ) ( not ( = ?auto_939837 ?auto_939838 ) ) ( not ( = ?auto_939837 ?auto_939839 ) ) ( not ( = ?auto_939837 ?auto_939840 ) ) ( not ( = ?auto_939837 ?auto_939841 ) ) ( not ( = ?auto_939838 ?auto_939839 ) ) ( not ( = ?auto_939838 ?auto_939840 ) ) ( not ( = ?auto_939838 ?auto_939841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939839 ?auto_939840 ?auto_939841 )
      ( MAKE-11CRATE-VERIFY ?auto_939831 ?auto_939832 ?auto_939833 ?auto_939830 ?auto_939834 ?auto_939836 ?auto_939835 ?auto_939837 ?auto_939838 ?auto_939839 ?auto_939840 ?auto_939841 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_939974 - SURFACE
      ?auto_939975 - SURFACE
      ?auto_939976 - SURFACE
      ?auto_939973 - SURFACE
      ?auto_939977 - SURFACE
      ?auto_939979 - SURFACE
      ?auto_939978 - SURFACE
      ?auto_939980 - SURFACE
      ?auto_939981 - SURFACE
      ?auto_939982 - SURFACE
      ?auto_939983 - SURFACE
      ?auto_939984 - SURFACE
    )
    :vars
    (
      ?auto_939989 - HOIST
      ?auto_939987 - PLACE
      ?auto_939990 - TRUCK
      ?auto_939985 - PLACE
      ?auto_939986 - HOIST
      ?auto_939988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939989 ?auto_939987 ) ( SURFACE-AT ?auto_939983 ?auto_939987 ) ( CLEAR ?auto_939983 ) ( IS-CRATE ?auto_939984 ) ( not ( = ?auto_939983 ?auto_939984 ) ) ( AVAILABLE ?auto_939989 ) ( ON ?auto_939983 ?auto_939982 ) ( not ( = ?auto_939982 ?auto_939983 ) ) ( not ( = ?auto_939982 ?auto_939984 ) ) ( TRUCK-AT ?auto_939990 ?auto_939985 ) ( not ( = ?auto_939985 ?auto_939987 ) ) ( HOIST-AT ?auto_939986 ?auto_939985 ) ( not ( = ?auto_939989 ?auto_939986 ) ) ( AVAILABLE ?auto_939986 ) ( SURFACE-AT ?auto_939984 ?auto_939985 ) ( ON ?auto_939984 ?auto_939988 ) ( CLEAR ?auto_939984 ) ( not ( = ?auto_939983 ?auto_939988 ) ) ( not ( = ?auto_939984 ?auto_939988 ) ) ( not ( = ?auto_939982 ?auto_939988 ) ) ( ON ?auto_939975 ?auto_939974 ) ( ON ?auto_939976 ?auto_939975 ) ( ON ?auto_939973 ?auto_939976 ) ( ON ?auto_939977 ?auto_939973 ) ( ON ?auto_939979 ?auto_939977 ) ( ON ?auto_939978 ?auto_939979 ) ( ON ?auto_939980 ?auto_939978 ) ( ON ?auto_939981 ?auto_939980 ) ( ON ?auto_939982 ?auto_939981 ) ( not ( = ?auto_939974 ?auto_939975 ) ) ( not ( = ?auto_939974 ?auto_939976 ) ) ( not ( = ?auto_939974 ?auto_939973 ) ) ( not ( = ?auto_939974 ?auto_939977 ) ) ( not ( = ?auto_939974 ?auto_939979 ) ) ( not ( = ?auto_939974 ?auto_939978 ) ) ( not ( = ?auto_939974 ?auto_939980 ) ) ( not ( = ?auto_939974 ?auto_939981 ) ) ( not ( = ?auto_939974 ?auto_939982 ) ) ( not ( = ?auto_939974 ?auto_939983 ) ) ( not ( = ?auto_939974 ?auto_939984 ) ) ( not ( = ?auto_939974 ?auto_939988 ) ) ( not ( = ?auto_939975 ?auto_939976 ) ) ( not ( = ?auto_939975 ?auto_939973 ) ) ( not ( = ?auto_939975 ?auto_939977 ) ) ( not ( = ?auto_939975 ?auto_939979 ) ) ( not ( = ?auto_939975 ?auto_939978 ) ) ( not ( = ?auto_939975 ?auto_939980 ) ) ( not ( = ?auto_939975 ?auto_939981 ) ) ( not ( = ?auto_939975 ?auto_939982 ) ) ( not ( = ?auto_939975 ?auto_939983 ) ) ( not ( = ?auto_939975 ?auto_939984 ) ) ( not ( = ?auto_939975 ?auto_939988 ) ) ( not ( = ?auto_939976 ?auto_939973 ) ) ( not ( = ?auto_939976 ?auto_939977 ) ) ( not ( = ?auto_939976 ?auto_939979 ) ) ( not ( = ?auto_939976 ?auto_939978 ) ) ( not ( = ?auto_939976 ?auto_939980 ) ) ( not ( = ?auto_939976 ?auto_939981 ) ) ( not ( = ?auto_939976 ?auto_939982 ) ) ( not ( = ?auto_939976 ?auto_939983 ) ) ( not ( = ?auto_939976 ?auto_939984 ) ) ( not ( = ?auto_939976 ?auto_939988 ) ) ( not ( = ?auto_939973 ?auto_939977 ) ) ( not ( = ?auto_939973 ?auto_939979 ) ) ( not ( = ?auto_939973 ?auto_939978 ) ) ( not ( = ?auto_939973 ?auto_939980 ) ) ( not ( = ?auto_939973 ?auto_939981 ) ) ( not ( = ?auto_939973 ?auto_939982 ) ) ( not ( = ?auto_939973 ?auto_939983 ) ) ( not ( = ?auto_939973 ?auto_939984 ) ) ( not ( = ?auto_939973 ?auto_939988 ) ) ( not ( = ?auto_939977 ?auto_939979 ) ) ( not ( = ?auto_939977 ?auto_939978 ) ) ( not ( = ?auto_939977 ?auto_939980 ) ) ( not ( = ?auto_939977 ?auto_939981 ) ) ( not ( = ?auto_939977 ?auto_939982 ) ) ( not ( = ?auto_939977 ?auto_939983 ) ) ( not ( = ?auto_939977 ?auto_939984 ) ) ( not ( = ?auto_939977 ?auto_939988 ) ) ( not ( = ?auto_939979 ?auto_939978 ) ) ( not ( = ?auto_939979 ?auto_939980 ) ) ( not ( = ?auto_939979 ?auto_939981 ) ) ( not ( = ?auto_939979 ?auto_939982 ) ) ( not ( = ?auto_939979 ?auto_939983 ) ) ( not ( = ?auto_939979 ?auto_939984 ) ) ( not ( = ?auto_939979 ?auto_939988 ) ) ( not ( = ?auto_939978 ?auto_939980 ) ) ( not ( = ?auto_939978 ?auto_939981 ) ) ( not ( = ?auto_939978 ?auto_939982 ) ) ( not ( = ?auto_939978 ?auto_939983 ) ) ( not ( = ?auto_939978 ?auto_939984 ) ) ( not ( = ?auto_939978 ?auto_939988 ) ) ( not ( = ?auto_939980 ?auto_939981 ) ) ( not ( = ?auto_939980 ?auto_939982 ) ) ( not ( = ?auto_939980 ?auto_939983 ) ) ( not ( = ?auto_939980 ?auto_939984 ) ) ( not ( = ?auto_939980 ?auto_939988 ) ) ( not ( = ?auto_939981 ?auto_939982 ) ) ( not ( = ?auto_939981 ?auto_939983 ) ) ( not ( = ?auto_939981 ?auto_939984 ) ) ( not ( = ?auto_939981 ?auto_939988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_939982 ?auto_939983 ?auto_939984 )
      ( MAKE-11CRATE-VERIFY ?auto_939974 ?auto_939975 ?auto_939976 ?auto_939973 ?auto_939977 ?auto_939979 ?auto_939978 ?auto_939980 ?auto_939981 ?auto_939982 ?auto_939983 ?auto_939984 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_940118 - SURFACE
      ?auto_940119 - SURFACE
      ?auto_940120 - SURFACE
      ?auto_940117 - SURFACE
      ?auto_940121 - SURFACE
      ?auto_940123 - SURFACE
      ?auto_940122 - SURFACE
      ?auto_940124 - SURFACE
      ?auto_940125 - SURFACE
      ?auto_940126 - SURFACE
      ?auto_940127 - SURFACE
      ?auto_940128 - SURFACE
    )
    :vars
    (
      ?auto_940129 - HOIST
      ?auto_940130 - PLACE
      ?auto_940132 - PLACE
      ?auto_940131 - HOIST
      ?auto_940134 - SURFACE
      ?auto_940133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_940129 ?auto_940130 ) ( SURFACE-AT ?auto_940127 ?auto_940130 ) ( CLEAR ?auto_940127 ) ( IS-CRATE ?auto_940128 ) ( not ( = ?auto_940127 ?auto_940128 ) ) ( AVAILABLE ?auto_940129 ) ( ON ?auto_940127 ?auto_940126 ) ( not ( = ?auto_940126 ?auto_940127 ) ) ( not ( = ?auto_940126 ?auto_940128 ) ) ( not ( = ?auto_940132 ?auto_940130 ) ) ( HOIST-AT ?auto_940131 ?auto_940132 ) ( not ( = ?auto_940129 ?auto_940131 ) ) ( AVAILABLE ?auto_940131 ) ( SURFACE-AT ?auto_940128 ?auto_940132 ) ( ON ?auto_940128 ?auto_940134 ) ( CLEAR ?auto_940128 ) ( not ( = ?auto_940127 ?auto_940134 ) ) ( not ( = ?auto_940128 ?auto_940134 ) ) ( not ( = ?auto_940126 ?auto_940134 ) ) ( TRUCK-AT ?auto_940133 ?auto_940130 ) ( ON ?auto_940119 ?auto_940118 ) ( ON ?auto_940120 ?auto_940119 ) ( ON ?auto_940117 ?auto_940120 ) ( ON ?auto_940121 ?auto_940117 ) ( ON ?auto_940123 ?auto_940121 ) ( ON ?auto_940122 ?auto_940123 ) ( ON ?auto_940124 ?auto_940122 ) ( ON ?auto_940125 ?auto_940124 ) ( ON ?auto_940126 ?auto_940125 ) ( not ( = ?auto_940118 ?auto_940119 ) ) ( not ( = ?auto_940118 ?auto_940120 ) ) ( not ( = ?auto_940118 ?auto_940117 ) ) ( not ( = ?auto_940118 ?auto_940121 ) ) ( not ( = ?auto_940118 ?auto_940123 ) ) ( not ( = ?auto_940118 ?auto_940122 ) ) ( not ( = ?auto_940118 ?auto_940124 ) ) ( not ( = ?auto_940118 ?auto_940125 ) ) ( not ( = ?auto_940118 ?auto_940126 ) ) ( not ( = ?auto_940118 ?auto_940127 ) ) ( not ( = ?auto_940118 ?auto_940128 ) ) ( not ( = ?auto_940118 ?auto_940134 ) ) ( not ( = ?auto_940119 ?auto_940120 ) ) ( not ( = ?auto_940119 ?auto_940117 ) ) ( not ( = ?auto_940119 ?auto_940121 ) ) ( not ( = ?auto_940119 ?auto_940123 ) ) ( not ( = ?auto_940119 ?auto_940122 ) ) ( not ( = ?auto_940119 ?auto_940124 ) ) ( not ( = ?auto_940119 ?auto_940125 ) ) ( not ( = ?auto_940119 ?auto_940126 ) ) ( not ( = ?auto_940119 ?auto_940127 ) ) ( not ( = ?auto_940119 ?auto_940128 ) ) ( not ( = ?auto_940119 ?auto_940134 ) ) ( not ( = ?auto_940120 ?auto_940117 ) ) ( not ( = ?auto_940120 ?auto_940121 ) ) ( not ( = ?auto_940120 ?auto_940123 ) ) ( not ( = ?auto_940120 ?auto_940122 ) ) ( not ( = ?auto_940120 ?auto_940124 ) ) ( not ( = ?auto_940120 ?auto_940125 ) ) ( not ( = ?auto_940120 ?auto_940126 ) ) ( not ( = ?auto_940120 ?auto_940127 ) ) ( not ( = ?auto_940120 ?auto_940128 ) ) ( not ( = ?auto_940120 ?auto_940134 ) ) ( not ( = ?auto_940117 ?auto_940121 ) ) ( not ( = ?auto_940117 ?auto_940123 ) ) ( not ( = ?auto_940117 ?auto_940122 ) ) ( not ( = ?auto_940117 ?auto_940124 ) ) ( not ( = ?auto_940117 ?auto_940125 ) ) ( not ( = ?auto_940117 ?auto_940126 ) ) ( not ( = ?auto_940117 ?auto_940127 ) ) ( not ( = ?auto_940117 ?auto_940128 ) ) ( not ( = ?auto_940117 ?auto_940134 ) ) ( not ( = ?auto_940121 ?auto_940123 ) ) ( not ( = ?auto_940121 ?auto_940122 ) ) ( not ( = ?auto_940121 ?auto_940124 ) ) ( not ( = ?auto_940121 ?auto_940125 ) ) ( not ( = ?auto_940121 ?auto_940126 ) ) ( not ( = ?auto_940121 ?auto_940127 ) ) ( not ( = ?auto_940121 ?auto_940128 ) ) ( not ( = ?auto_940121 ?auto_940134 ) ) ( not ( = ?auto_940123 ?auto_940122 ) ) ( not ( = ?auto_940123 ?auto_940124 ) ) ( not ( = ?auto_940123 ?auto_940125 ) ) ( not ( = ?auto_940123 ?auto_940126 ) ) ( not ( = ?auto_940123 ?auto_940127 ) ) ( not ( = ?auto_940123 ?auto_940128 ) ) ( not ( = ?auto_940123 ?auto_940134 ) ) ( not ( = ?auto_940122 ?auto_940124 ) ) ( not ( = ?auto_940122 ?auto_940125 ) ) ( not ( = ?auto_940122 ?auto_940126 ) ) ( not ( = ?auto_940122 ?auto_940127 ) ) ( not ( = ?auto_940122 ?auto_940128 ) ) ( not ( = ?auto_940122 ?auto_940134 ) ) ( not ( = ?auto_940124 ?auto_940125 ) ) ( not ( = ?auto_940124 ?auto_940126 ) ) ( not ( = ?auto_940124 ?auto_940127 ) ) ( not ( = ?auto_940124 ?auto_940128 ) ) ( not ( = ?auto_940124 ?auto_940134 ) ) ( not ( = ?auto_940125 ?auto_940126 ) ) ( not ( = ?auto_940125 ?auto_940127 ) ) ( not ( = ?auto_940125 ?auto_940128 ) ) ( not ( = ?auto_940125 ?auto_940134 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_940126 ?auto_940127 ?auto_940128 )
      ( MAKE-11CRATE-VERIFY ?auto_940118 ?auto_940119 ?auto_940120 ?auto_940117 ?auto_940121 ?auto_940123 ?auto_940122 ?auto_940124 ?auto_940125 ?auto_940126 ?auto_940127 ?auto_940128 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_940262 - SURFACE
      ?auto_940263 - SURFACE
      ?auto_940264 - SURFACE
      ?auto_940261 - SURFACE
      ?auto_940265 - SURFACE
      ?auto_940267 - SURFACE
      ?auto_940266 - SURFACE
      ?auto_940268 - SURFACE
      ?auto_940269 - SURFACE
      ?auto_940270 - SURFACE
      ?auto_940271 - SURFACE
      ?auto_940272 - SURFACE
    )
    :vars
    (
      ?auto_940277 - HOIST
      ?auto_940276 - PLACE
      ?auto_940274 - PLACE
      ?auto_940275 - HOIST
      ?auto_940273 - SURFACE
      ?auto_940278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_940277 ?auto_940276 ) ( IS-CRATE ?auto_940272 ) ( not ( = ?auto_940271 ?auto_940272 ) ) ( not ( = ?auto_940270 ?auto_940271 ) ) ( not ( = ?auto_940270 ?auto_940272 ) ) ( not ( = ?auto_940274 ?auto_940276 ) ) ( HOIST-AT ?auto_940275 ?auto_940274 ) ( not ( = ?auto_940277 ?auto_940275 ) ) ( AVAILABLE ?auto_940275 ) ( SURFACE-AT ?auto_940272 ?auto_940274 ) ( ON ?auto_940272 ?auto_940273 ) ( CLEAR ?auto_940272 ) ( not ( = ?auto_940271 ?auto_940273 ) ) ( not ( = ?auto_940272 ?auto_940273 ) ) ( not ( = ?auto_940270 ?auto_940273 ) ) ( TRUCK-AT ?auto_940278 ?auto_940276 ) ( SURFACE-AT ?auto_940270 ?auto_940276 ) ( CLEAR ?auto_940270 ) ( LIFTING ?auto_940277 ?auto_940271 ) ( IS-CRATE ?auto_940271 ) ( ON ?auto_940263 ?auto_940262 ) ( ON ?auto_940264 ?auto_940263 ) ( ON ?auto_940261 ?auto_940264 ) ( ON ?auto_940265 ?auto_940261 ) ( ON ?auto_940267 ?auto_940265 ) ( ON ?auto_940266 ?auto_940267 ) ( ON ?auto_940268 ?auto_940266 ) ( ON ?auto_940269 ?auto_940268 ) ( ON ?auto_940270 ?auto_940269 ) ( not ( = ?auto_940262 ?auto_940263 ) ) ( not ( = ?auto_940262 ?auto_940264 ) ) ( not ( = ?auto_940262 ?auto_940261 ) ) ( not ( = ?auto_940262 ?auto_940265 ) ) ( not ( = ?auto_940262 ?auto_940267 ) ) ( not ( = ?auto_940262 ?auto_940266 ) ) ( not ( = ?auto_940262 ?auto_940268 ) ) ( not ( = ?auto_940262 ?auto_940269 ) ) ( not ( = ?auto_940262 ?auto_940270 ) ) ( not ( = ?auto_940262 ?auto_940271 ) ) ( not ( = ?auto_940262 ?auto_940272 ) ) ( not ( = ?auto_940262 ?auto_940273 ) ) ( not ( = ?auto_940263 ?auto_940264 ) ) ( not ( = ?auto_940263 ?auto_940261 ) ) ( not ( = ?auto_940263 ?auto_940265 ) ) ( not ( = ?auto_940263 ?auto_940267 ) ) ( not ( = ?auto_940263 ?auto_940266 ) ) ( not ( = ?auto_940263 ?auto_940268 ) ) ( not ( = ?auto_940263 ?auto_940269 ) ) ( not ( = ?auto_940263 ?auto_940270 ) ) ( not ( = ?auto_940263 ?auto_940271 ) ) ( not ( = ?auto_940263 ?auto_940272 ) ) ( not ( = ?auto_940263 ?auto_940273 ) ) ( not ( = ?auto_940264 ?auto_940261 ) ) ( not ( = ?auto_940264 ?auto_940265 ) ) ( not ( = ?auto_940264 ?auto_940267 ) ) ( not ( = ?auto_940264 ?auto_940266 ) ) ( not ( = ?auto_940264 ?auto_940268 ) ) ( not ( = ?auto_940264 ?auto_940269 ) ) ( not ( = ?auto_940264 ?auto_940270 ) ) ( not ( = ?auto_940264 ?auto_940271 ) ) ( not ( = ?auto_940264 ?auto_940272 ) ) ( not ( = ?auto_940264 ?auto_940273 ) ) ( not ( = ?auto_940261 ?auto_940265 ) ) ( not ( = ?auto_940261 ?auto_940267 ) ) ( not ( = ?auto_940261 ?auto_940266 ) ) ( not ( = ?auto_940261 ?auto_940268 ) ) ( not ( = ?auto_940261 ?auto_940269 ) ) ( not ( = ?auto_940261 ?auto_940270 ) ) ( not ( = ?auto_940261 ?auto_940271 ) ) ( not ( = ?auto_940261 ?auto_940272 ) ) ( not ( = ?auto_940261 ?auto_940273 ) ) ( not ( = ?auto_940265 ?auto_940267 ) ) ( not ( = ?auto_940265 ?auto_940266 ) ) ( not ( = ?auto_940265 ?auto_940268 ) ) ( not ( = ?auto_940265 ?auto_940269 ) ) ( not ( = ?auto_940265 ?auto_940270 ) ) ( not ( = ?auto_940265 ?auto_940271 ) ) ( not ( = ?auto_940265 ?auto_940272 ) ) ( not ( = ?auto_940265 ?auto_940273 ) ) ( not ( = ?auto_940267 ?auto_940266 ) ) ( not ( = ?auto_940267 ?auto_940268 ) ) ( not ( = ?auto_940267 ?auto_940269 ) ) ( not ( = ?auto_940267 ?auto_940270 ) ) ( not ( = ?auto_940267 ?auto_940271 ) ) ( not ( = ?auto_940267 ?auto_940272 ) ) ( not ( = ?auto_940267 ?auto_940273 ) ) ( not ( = ?auto_940266 ?auto_940268 ) ) ( not ( = ?auto_940266 ?auto_940269 ) ) ( not ( = ?auto_940266 ?auto_940270 ) ) ( not ( = ?auto_940266 ?auto_940271 ) ) ( not ( = ?auto_940266 ?auto_940272 ) ) ( not ( = ?auto_940266 ?auto_940273 ) ) ( not ( = ?auto_940268 ?auto_940269 ) ) ( not ( = ?auto_940268 ?auto_940270 ) ) ( not ( = ?auto_940268 ?auto_940271 ) ) ( not ( = ?auto_940268 ?auto_940272 ) ) ( not ( = ?auto_940268 ?auto_940273 ) ) ( not ( = ?auto_940269 ?auto_940270 ) ) ( not ( = ?auto_940269 ?auto_940271 ) ) ( not ( = ?auto_940269 ?auto_940272 ) ) ( not ( = ?auto_940269 ?auto_940273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_940270 ?auto_940271 ?auto_940272 )
      ( MAKE-11CRATE-VERIFY ?auto_940262 ?auto_940263 ?auto_940264 ?auto_940261 ?auto_940265 ?auto_940267 ?auto_940266 ?auto_940268 ?auto_940269 ?auto_940270 ?auto_940271 ?auto_940272 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_940406 - SURFACE
      ?auto_940407 - SURFACE
      ?auto_940408 - SURFACE
      ?auto_940405 - SURFACE
      ?auto_940409 - SURFACE
      ?auto_940411 - SURFACE
      ?auto_940410 - SURFACE
      ?auto_940412 - SURFACE
      ?auto_940413 - SURFACE
      ?auto_940414 - SURFACE
      ?auto_940415 - SURFACE
      ?auto_940416 - SURFACE
    )
    :vars
    (
      ?auto_940417 - HOIST
      ?auto_940418 - PLACE
      ?auto_940420 - PLACE
      ?auto_940419 - HOIST
      ?auto_940422 - SURFACE
      ?auto_940421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_940417 ?auto_940418 ) ( IS-CRATE ?auto_940416 ) ( not ( = ?auto_940415 ?auto_940416 ) ) ( not ( = ?auto_940414 ?auto_940415 ) ) ( not ( = ?auto_940414 ?auto_940416 ) ) ( not ( = ?auto_940420 ?auto_940418 ) ) ( HOIST-AT ?auto_940419 ?auto_940420 ) ( not ( = ?auto_940417 ?auto_940419 ) ) ( AVAILABLE ?auto_940419 ) ( SURFACE-AT ?auto_940416 ?auto_940420 ) ( ON ?auto_940416 ?auto_940422 ) ( CLEAR ?auto_940416 ) ( not ( = ?auto_940415 ?auto_940422 ) ) ( not ( = ?auto_940416 ?auto_940422 ) ) ( not ( = ?auto_940414 ?auto_940422 ) ) ( TRUCK-AT ?auto_940421 ?auto_940418 ) ( SURFACE-AT ?auto_940414 ?auto_940418 ) ( CLEAR ?auto_940414 ) ( IS-CRATE ?auto_940415 ) ( AVAILABLE ?auto_940417 ) ( IN ?auto_940415 ?auto_940421 ) ( ON ?auto_940407 ?auto_940406 ) ( ON ?auto_940408 ?auto_940407 ) ( ON ?auto_940405 ?auto_940408 ) ( ON ?auto_940409 ?auto_940405 ) ( ON ?auto_940411 ?auto_940409 ) ( ON ?auto_940410 ?auto_940411 ) ( ON ?auto_940412 ?auto_940410 ) ( ON ?auto_940413 ?auto_940412 ) ( ON ?auto_940414 ?auto_940413 ) ( not ( = ?auto_940406 ?auto_940407 ) ) ( not ( = ?auto_940406 ?auto_940408 ) ) ( not ( = ?auto_940406 ?auto_940405 ) ) ( not ( = ?auto_940406 ?auto_940409 ) ) ( not ( = ?auto_940406 ?auto_940411 ) ) ( not ( = ?auto_940406 ?auto_940410 ) ) ( not ( = ?auto_940406 ?auto_940412 ) ) ( not ( = ?auto_940406 ?auto_940413 ) ) ( not ( = ?auto_940406 ?auto_940414 ) ) ( not ( = ?auto_940406 ?auto_940415 ) ) ( not ( = ?auto_940406 ?auto_940416 ) ) ( not ( = ?auto_940406 ?auto_940422 ) ) ( not ( = ?auto_940407 ?auto_940408 ) ) ( not ( = ?auto_940407 ?auto_940405 ) ) ( not ( = ?auto_940407 ?auto_940409 ) ) ( not ( = ?auto_940407 ?auto_940411 ) ) ( not ( = ?auto_940407 ?auto_940410 ) ) ( not ( = ?auto_940407 ?auto_940412 ) ) ( not ( = ?auto_940407 ?auto_940413 ) ) ( not ( = ?auto_940407 ?auto_940414 ) ) ( not ( = ?auto_940407 ?auto_940415 ) ) ( not ( = ?auto_940407 ?auto_940416 ) ) ( not ( = ?auto_940407 ?auto_940422 ) ) ( not ( = ?auto_940408 ?auto_940405 ) ) ( not ( = ?auto_940408 ?auto_940409 ) ) ( not ( = ?auto_940408 ?auto_940411 ) ) ( not ( = ?auto_940408 ?auto_940410 ) ) ( not ( = ?auto_940408 ?auto_940412 ) ) ( not ( = ?auto_940408 ?auto_940413 ) ) ( not ( = ?auto_940408 ?auto_940414 ) ) ( not ( = ?auto_940408 ?auto_940415 ) ) ( not ( = ?auto_940408 ?auto_940416 ) ) ( not ( = ?auto_940408 ?auto_940422 ) ) ( not ( = ?auto_940405 ?auto_940409 ) ) ( not ( = ?auto_940405 ?auto_940411 ) ) ( not ( = ?auto_940405 ?auto_940410 ) ) ( not ( = ?auto_940405 ?auto_940412 ) ) ( not ( = ?auto_940405 ?auto_940413 ) ) ( not ( = ?auto_940405 ?auto_940414 ) ) ( not ( = ?auto_940405 ?auto_940415 ) ) ( not ( = ?auto_940405 ?auto_940416 ) ) ( not ( = ?auto_940405 ?auto_940422 ) ) ( not ( = ?auto_940409 ?auto_940411 ) ) ( not ( = ?auto_940409 ?auto_940410 ) ) ( not ( = ?auto_940409 ?auto_940412 ) ) ( not ( = ?auto_940409 ?auto_940413 ) ) ( not ( = ?auto_940409 ?auto_940414 ) ) ( not ( = ?auto_940409 ?auto_940415 ) ) ( not ( = ?auto_940409 ?auto_940416 ) ) ( not ( = ?auto_940409 ?auto_940422 ) ) ( not ( = ?auto_940411 ?auto_940410 ) ) ( not ( = ?auto_940411 ?auto_940412 ) ) ( not ( = ?auto_940411 ?auto_940413 ) ) ( not ( = ?auto_940411 ?auto_940414 ) ) ( not ( = ?auto_940411 ?auto_940415 ) ) ( not ( = ?auto_940411 ?auto_940416 ) ) ( not ( = ?auto_940411 ?auto_940422 ) ) ( not ( = ?auto_940410 ?auto_940412 ) ) ( not ( = ?auto_940410 ?auto_940413 ) ) ( not ( = ?auto_940410 ?auto_940414 ) ) ( not ( = ?auto_940410 ?auto_940415 ) ) ( not ( = ?auto_940410 ?auto_940416 ) ) ( not ( = ?auto_940410 ?auto_940422 ) ) ( not ( = ?auto_940412 ?auto_940413 ) ) ( not ( = ?auto_940412 ?auto_940414 ) ) ( not ( = ?auto_940412 ?auto_940415 ) ) ( not ( = ?auto_940412 ?auto_940416 ) ) ( not ( = ?auto_940412 ?auto_940422 ) ) ( not ( = ?auto_940413 ?auto_940414 ) ) ( not ( = ?auto_940413 ?auto_940415 ) ) ( not ( = ?auto_940413 ?auto_940416 ) ) ( not ( = ?auto_940413 ?auto_940422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_940414 ?auto_940415 ?auto_940416 )
      ( MAKE-11CRATE-VERIFY ?auto_940406 ?auto_940407 ?auto_940408 ?auto_940405 ?auto_940409 ?auto_940411 ?auto_940410 ?auto_940412 ?auto_940413 ?auto_940414 ?auto_940415 ?auto_940416 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949674 - SURFACE
      ?auto_949675 - SURFACE
      ?auto_949676 - SURFACE
      ?auto_949673 - SURFACE
      ?auto_949677 - SURFACE
      ?auto_949679 - SURFACE
      ?auto_949678 - SURFACE
      ?auto_949680 - SURFACE
      ?auto_949681 - SURFACE
      ?auto_949682 - SURFACE
      ?auto_949683 - SURFACE
      ?auto_949684 - SURFACE
      ?auto_949685 - SURFACE
    )
    :vars
    (
      ?auto_949686 - HOIST
      ?auto_949687 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_949686 ?auto_949687 ) ( SURFACE-AT ?auto_949684 ?auto_949687 ) ( CLEAR ?auto_949684 ) ( LIFTING ?auto_949686 ?auto_949685 ) ( IS-CRATE ?auto_949685 ) ( not ( = ?auto_949684 ?auto_949685 ) ) ( ON ?auto_949675 ?auto_949674 ) ( ON ?auto_949676 ?auto_949675 ) ( ON ?auto_949673 ?auto_949676 ) ( ON ?auto_949677 ?auto_949673 ) ( ON ?auto_949679 ?auto_949677 ) ( ON ?auto_949678 ?auto_949679 ) ( ON ?auto_949680 ?auto_949678 ) ( ON ?auto_949681 ?auto_949680 ) ( ON ?auto_949682 ?auto_949681 ) ( ON ?auto_949683 ?auto_949682 ) ( ON ?auto_949684 ?auto_949683 ) ( not ( = ?auto_949674 ?auto_949675 ) ) ( not ( = ?auto_949674 ?auto_949676 ) ) ( not ( = ?auto_949674 ?auto_949673 ) ) ( not ( = ?auto_949674 ?auto_949677 ) ) ( not ( = ?auto_949674 ?auto_949679 ) ) ( not ( = ?auto_949674 ?auto_949678 ) ) ( not ( = ?auto_949674 ?auto_949680 ) ) ( not ( = ?auto_949674 ?auto_949681 ) ) ( not ( = ?auto_949674 ?auto_949682 ) ) ( not ( = ?auto_949674 ?auto_949683 ) ) ( not ( = ?auto_949674 ?auto_949684 ) ) ( not ( = ?auto_949674 ?auto_949685 ) ) ( not ( = ?auto_949675 ?auto_949676 ) ) ( not ( = ?auto_949675 ?auto_949673 ) ) ( not ( = ?auto_949675 ?auto_949677 ) ) ( not ( = ?auto_949675 ?auto_949679 ) ) ( not ( = ?auto_949675 ?auto_949678 ) ) ( not ( = ?auto_949675 ?auto_949680 ) ) ( not ( = ?auto_949675 ?auto_949681 ) ) ( not ( = ?auto_949675 ?auto_949682 ) ) ( not ( = ?auto_949675 ?auto_949683 ) ) ( not ( = ?auto_949675 ?auto_949684 ) ) ( not ( = ?auto_949675 ?auto_949685 ) ) ( not ( = ?auto_949676 ?auto_949673 ) ) ( not ( = ?auto_949676 ?auto_949677 ) ) ( not ( = ?auto_949676 ?auto_949679 ) ) ( not ( = ?auto_949676 ?auto_949678 ) ) ( not ( = ?auto_949676 ?auto_949680 ) ) ( not ( = ?auto_949676 ?auto_949681 ) ) ( not ( = ?auto_949676 ?auto_949682 ) ) ( not ( = ?auto_949676 ?auto_949683 ) ) ( not ( = ?auto_949676 ?auto_949684 ) ) ( not ( = ?auto_949676 ?auto_949685 ) ) ( not ( = ?auto_949673 ?auto_949677 ) ) ( not ( = ?auto_949673 ?auto_949679 ) ) ( not ( = ?auto_949673 ?auto_949678 ) ) ( not ( = ?auto_949673 ?auto_949680 ) ) ( not ( = ?auto_949673 ?auto_949681 ) ) ( not ( = ?auto_949673 ?auto_949682 ) ) ( not ( = ?auto_949673 ?auto_949683 ) ) ( not ( = ?auto_949673 ?auto_949684 ) ) ( not ( = ?auto_949673 ?auto_949685 ) ) ( not ( = ?auto_949677 ?auto_949679 ) ) ( not ( = ?auto_949677 ?auto_949678 ) ) ( not ( = ?auto_949677 ?auto_949680 ) ) ( not ( = ?auto_949677 ?auto_949681 ) ) ( not ( = ?auto_949677 ?auto_949682 ) ) ( not ( = ?auto_949677 ?auto_949683 ) ) ( not ( = ?auto_949677 ?auto_949684 ) ) ( not ( = ?auto_949677 ?auto_949685 ) ) ( not ( = ?auto_949679 ?auto_949678 ) ) ( not ( = ?auto_949679 ?auto_949680 ) ) ( not ( = ?auto_949679 ?auto_949681 ) ) ( not ( = ?auto_949679 ?auto_949682 ) ) ( not ( = ?auto_949679 ?auto_949683 ) ) ( not ( = ?auto_949679 ?auto_949684 ) ) ( not ( = ?auto_949679 ?auto_949685 ) ) ( not ( = ?auto_949678 ?auto_949680 ) ) ( not ( = ?auto_949678 ?auto_949681 ) ) ( not ( = ?auto_949678 ?auto_949682 ) ) ( not ( = ?auto_949678 ?auto_949683 ) ) ( not ( = ?auto_949678 ?auto_949684 ) ) ( not ( = ?auto_949678 ?auto_949685 ) ) ( not ( = ?auto_949680 ?auto_949681 ) ) ( not ( = ?auto_949680 ?auto_949682 ) ) ( not ( = ?auto_949680 ?auto_949683 ) ) ( not ( = ?auto_949680 ?auto_949684 ) ) ( not ( = ?auto_949680 ?auto_949685 ) ) ( not ( = ?auto_949681 ?auto_949682 ) ) ( not ( = ?auto_949681 ?auto_949683 ) ) ( not ( = ?auto_949681 ?auto_949684 ) ) ( not ( = ?auto_949681 ?auto_949685 ) ) ( not ( = ?auto_949682 ?auto_949683 ) ) ( not ( = ?auto_949682 ?auto_949684 ) ) ( not ( = ?auto_949682 ?auto_949685 ) ) ( not ( = ?auto_949683 ?auto_949684 ) ) ( not ( = ?auto_949683 ?auto_949685 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_949684 ?auto_949685 )
      ( MAKE-12CRATE-VERIFY ?auto_949674 ?auto_949675 ?auto_949676 ?auto_949673 ?auto_949677 ?auto_949679 ?auto_949678 ?auto_949680 ?auto_949681 ?auto_949682 ?auto_949683 ?auto_949684 ?auto_949685 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949799 - SURFACE
      ?auto_949800 - SURFACE
      ?auto_949801 - SURFACE
      ?auto_949798 - SURFACE
      ?auto_949802 - SURFACE
      ?auto_949804 - SURFACE
      ?auto_949803 - SURFACE
      ?auto_949805 - SURFACE
      ?auto_949806 - SURFACE
      ?auto_949807 - SURFACE
      ?auto_949808 - SURFACE
      ?auto_949809 - SURFACE
      ?auto_949810 - SURFACE
    )
    :vars
    (
      ?auto_949811 - HOIST
      ?auto_949813 - PLACE
      ?auto_949812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_949811 ?auto_949813 ) ( SURFACE-AT ?auto_949809 ?auto_949813 ) ( CLEAR ?auto_949809 ) ( IS-CRATE ?auto_949810 ) ( not ( = ?auto_949809 ?auto_949810 ) ) ( TRUCK-AT ?auto_949812 ?auto_949813 ) ( AVAILABLE ?auto_949811 ) ( IN ?auto_949810 ?auto_949812 ) ( ON ?auto_949809 ?auto_949808 ) ( not ( = ?auto_949808 ?auto_949809 ) ) ( not ( = ?auto_949808 ?auto_949810 ) ) ( ON ?auto_949800 ?auto_949799 ) ( ON ?auto_949801 ?auto_949800 ) ( ON ?auto_949798 ?auto_949801 ) ( ON ?auto_949802 ?auto_949798 ) ( ON ?auto_949804 ?auto_949802 ) ( ON ?auto_949803 ?auto_949804 ) ( ON ?auto_949805 ?auto_949803 ) ( ON ?auto_949806 ?auto_949805 ) ( ON ?auto_949807 ?auto_949806 ) ( ON ?auto_949808 ?auto_949807 ) ( not ( = ?auto_949799 ?auto_949800 ) ) ( not ( = ?auto_949799 ?auto_949801 ) ) ( not ( = ?auto_949799 ?auto_949798 ) ) ( not ( = ?auto_949799 ?auto_949802 ) ) ( not ( = ?auto_949799 ?auto_949804 ) ) ( not ( = ?auto_949799 ?auto_949803 ) ) ( not ( = ?auto_949799 ?auto_949805 ) ) ( not ( = ?auto_949799 ?auto_949806 ) ) ( not ( = ?auto_949799 ?auto_949807 ) ) ( not ( = ?auto_949799 ?auto_949808 ) ) ( not ( = ?auto_949799 ?auto_949809 ) ) ( not ( = ?auto_949799 ?auto_949810 ) ) ( not ( = ?auto_949800 ?auto_949801 ) ) ( not ( = ?auto_949800 ?auto_949798 ) ) ( not ( = ?auto_949800 ?auto_949802 ) ) ( not ( = ?auto_949800 ?auto_949804 ) ) ( not ( = ?auto_949800 ?auto_949803 ) ) ( not ( = ?auto_949800 ?auto_949805 ) ) ( not ( = ?auto_949800 ?auto_949806 ) ) ( not ( = ?auto_949800 ?auto_949807 ) ) ( not ( = ?auto_949800 ?auto_949808 ) ) ( not ( = ?auto_949800 ?auto_949809 ) ) ( not ( = ?auto_949800 ?auto_949810 ) ) ( not ( = ?auto_949801 ?auto_949798 ) ) ( not ( = ?auto_949801 ?auto_949802 ) ) ( not ( = ?auto_949801 ?auto_949804 ) ) ( not ( = ?auto_949801 ?auto_949803 ) ) ( not ( = ?auto_949801 ?auto_949805 ) ) ( not ( = ?auto_949801 ?auto_949806 ) ) ( not ( = ?auto_949801 ?auto_949807 ) ) ( not ( = ?auto_949801 ?auto_949808 ) ) ( not ( = ?auto_949801 ?auto_949809 ) ) ( not ( = ?auto_949801 ?auto_949810 ) ) ( not ( = ?auto_949798 ?auto_949802 ) ) ( not ( = ?auto_949798 ?auto_949804 ) ) ( not ( = ?auto_949798 ?auto_949803 ) ) ( not ( = ?auto_949798 ?auto_949805 ) ) ( not ( = ?auto_949798 ?auto_949806 ) ) ( not ( = ?auto_949798 ?auto_949807 ) ) ( not ( = ?auto_949798 ?auto_949808 ) ) ( not ( = ?auto_949798 ?auto_949809 ) ) ( not ( = ?auto_949798 ?auto_949810 ) ) ( not ( = ?auto_949802 ?auto_949804 ) ) ( not ( = ?auto_949802 ?auto_949803 ) ) ( not ( = ?auto_949802 ?auto_949805 ) ) ( not ( = ?auto_949802 ?auto_949806 ) ) ( not ( = ?auto_949802 ?auto_949807 ) ) ( not ( = ?auto_949802 ?auto_949808 ) ) ( not ( = ?auto_949802 ?auto_949809 ) ) ( not ( = ?auto_949802 ?auto_949810 ) ) ( not ( = ?auto_949804 ?auto_949803 ) ) ( not ( = ?auto_949804 ?auto_949805 ) ) ( not ( = ?auto_949804 ?auto_949806 ) ) ( not ( = ?auto_949804 ?auto_949807 ) ) ( not ( = ?auto_949804 ?auto_949808 ) ) ( not ( = ?auto_949804 ?auto_949809 ) ) ( not ( = ?auto_949804 ?auto_949810 ) ) ( not ( = ?auto_949803 ?auto_949805 ) ) ( not ( = ?auto_949803 ?auto_949806 ) ) ( not ( = ?auto_949803 ?auto_949807 ) ) ( not ( = ?auto_949803 ?auto_949808 ) ) ( not ( = ?auto_949803 ?auto_949809 ) ) ( not ( = ?auto_949803 ?auto_949810 ) ) ( not ( = ?auto_949805 ?auto_949806 ) ) ( not ( = ?auto_949805 ?auto_949807 ) ) ( not ( = ?auto_949805 ?auto_949808 ) ) ( not ( = ?auto_949805 ?auto_949809 ) ) ( not ( = ?auto_949805 ?auto_949810 ) ) ( not ( = ?auto_949806 ?auto_949807 ) ) ( not ( = ?auto_949806 ?auto_949808 ) ) ( not ( = ?auto_949806 ?auto_949809 ) ) ( not ( = ?auto_949806 ?auto_949810 ) ) ( not ( = ?auto_949807 ?auto_949808 ) ) ( not ( = ?auto_949807 ?auto_949809 ) ) ( not ( = ?auto_949807 ?auto_949810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949808 ?auto_949809 ?auto_949810 )
      ( MAKE-12CRATE-VERIFY ?auto_949799 ?auto_949800 ?auto_949801 ?auto_949798 ?auto_949802 ?auto_949804 ?auto_949803 ?auto_949805 ?auto_949806 ?auto_949807 ?auto_949808 ?auto_949809 ?auto_949810 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_949937 - SURFACE
      ?auto_949938 - SURFACE
      ?auto_949939 - SURFACE
      ?auto_949936 - SURFACE
      ?auto_949940 - SURFACE
      ?auto_949942 - SURFACE
      ?auto_949941 - SURFACE
      ?auto_949943 - SURFACE
      ?auto_949944 - SURFACE
      ?auto_949945 - SURFACE
      ?auto_949946 - SURFACE
      ?auto_949947 - SURFACE
      ?auto_949948 - SURFACE
    )
    :vars
    (
      ?auto_949951 - HOIST
      ?auto_949952 - PLACE
      ?auto_949950 - TRUCK
      ?auto_949949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_949951 ?auto_949952 ) ( SURFACE-AT ?auto_949947 ?auto_949952 ) ( CLEAR ?auto_949947 ) ( IS-CRATE ?auto_949948 ) ( not ( = ?auto_949947 ?auto_949948 ) ) ( AVAILABLE ?auto_949951 ) ( IN ?auto_949948 ?auto_949950 ) ( ON ?auto_949947 ?auto_949946 ) ( not ( = ?auto_949946 ?auto_949947 ) ) ( not ( = ?auto_949946 ?auto_949948 ) ) ( TRUCK-AT ?auto_949950 ?auto_949949 ) ( not ( = ?auto_949949 ?auto_949952 ) ) ( ON ?auto_949938 ?auto_949937 ) ( ON ?auto_949939 ?auto_949938 ) ( ON ?auto_949936 ?auto_949939 ) ( ON ?auto_949940 ?auto_949936 ) ( ON ?auto_949942 ?auto_949940 ) ( ON ?auto_949941 ?auto_949942 ) ( ON ?auto_949943 ?auto_949941 ) ( ON ?auto_949944 ?auto_949943 ) ( ON ?auto_949945 ?auto_949944 ) ( ON ?auto_949946 ?auto_949945 ) ( not ( = ?auto_949937 ?auto_949938 ) ) ( not ( = ?auto_949937 ?auto_949939 ) ) ( not ( = ?auto_949937 ?auto_949936 ) ) ( not ( = ?auto_949937 ?auto_949940 ) ) ( not ( = ?auto_949937 ?auto_949942 ) ) ( not ( = ?auto_949937 ?auto_949941 ) ) ( not ( = ?auto_949937 ?auto_949943 ) ) ( not ( = ?auto_949937 ?auto_949944 ) ) ( not ( = ?auto_949937 ?auto_949945 ) ) ( not ( = ?auto_949937 ?auto_949946 ) ) ( not ( = ?auto_949937 ?auto_949947 ) ) ( not ( = ?auto_949937 ?auto_949948 ) ) ( not ( = ?auto_949938 ?auto_949939 ) ) ( not ( = ?auto_949938 ?auto_949936 ) ) ( not ( = ?auto_949938 ?auto_949940 ) ) ( not ( = ?auto_949938 ?auto_949942 ) ) ( not ( = ?auto_949938 ?auto_949941 ) ) ( not ( = ?auto_949938 ?auto_949943 ) ) ( not ( = ?auto_949938 ?auto_949944 ) ) ( not ( = ?auto_949938 ?auto_949945 ) ) ( not ( = ?auto_949938 ?auto_949946 ) ) ( not ( = ?auto_949938 ?auto_949947 ) ) ( not ( = ?auto_949938 ?auto_949948 ) ) ( not ( = ?auto_949939 ?auto_949936 ) ) ( not ( = ?auto_949939 ?auto_949940 ) ) ( not ( = ?auto_949939 ?auto_949942 ) ) ( not ( = ?auto_949939 ?auto_949941 ) ) ( not ( = ?auto_949939 ?auto_949943 ) ) ( not ( = ?auto_949939 ?auto_949944 ) ) ( not ( = ?auto_949939 ?auto_949945 ) ) ( not ( = ?auto_949939 ?auto_949946 ) ) ( not ( = ?auto_949939 ?auto_949947 ) ) ( not ( = ?auto_949939 ?auto_949948 ) ) ( not ( = ?auto_949936 ?auto_949940 ) ) ( not ( = ?auto_949936 ?auto_949942 ) ) ( not ( = ?auto_949936 ?auto_949941 ) ) ( not ( = ?auto_949936 ?auto_949943 ) ) ( not ( = ?auto_949936 ?auto_949944 ) ) ( not ( = ?auto_949936 ?auto_949945 ) ) ( not ( = ?auto_949936 ?auto_949946 ) ) ( not ( = ?auto_949936 ?auto_949947 ) ) ( not ( = ?auto_949936 ?auto_949948 ) ) ( not ( = ?auto_949940 ?auto_949942 ) ) ( not ( = ?auto_949940 ?auto_949941 ) ) ( not ( = ?auto_949940 ?auto_949943 ) ) ( not ( = ?auto_949940 ?auto_949944 ) ) ( not ( = ?auto_949940 ?auto_949945 ) ) ( not ( = ?auto_949940 ?auto_949946 ) ) ( not ( = ?auto_949940 ?auto_949947 ) ) ( not ( = ?auto_949940 ?auto_949948 ) ) ( not ( = ?auto_949942 ?auto_949941 ) ) ( not ( = ?auto_949942 ?auto_949943 ) ) ( not ( = ?auto_949942 ?auto_949944 ) ) ( not ( = ?auto_949942 ?auto_949945 ) ) ( not ( = ?auto_949942 ?auto_949946 ) ) ( not ( = ?auto_949942 ?auto_949947 ) ) ( not ( = ?auto_949942 ?auto_949948 ) ) ( not ( = ?auto_949941 ?auto_949943 ) ) ( not ( = ?auto_949941 ?auto_949944 ) ) ( not ( = ?auto_949941 ?auto_949945 ) ) ( not ( = ?auto_949941 ?auto_949946 ) ) ( not ( = ?auto_949941 ?auto_949947 ) ) ( not ( = ?auto_949941 ?auto_949948 ) ) ( not ( = ?auto_949943 ?auto_949944 ) ) ( not ( = ?auto_949943 ?auto_949945 ) ) ( not ( = ?auto_949943 ?auto_949946 ) ) ( not ( = ?auto_949943 ?auto_949947 ) ) ( not ( = ?auto_949943 ?auto_949948 ) ) ( not ( = ?auto_949944 ?auto_949945 ) ) ( not ( = ?auto_949944 ?auto_949946 ) ) ( not ( = ?auto_949944 ?auto_949947 ) ) ( not ( = ?auto_949944 ?auto_949948 ) ) ( not ( = ?auto_949945 ?auto_949946 ) ) ( not ( = ?auto_949945 ?auto_949947 ) ) ( not ( = ?auto_949945 ?auto_949948 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_949946 ?auto_949947 ?auto_949948 )
      ( MAKE-12CRATE-VERIFY ?auto_949937 ?auto_949938 ?auto_949939 ?auto_949936 ?auto_949940 ?auto_949942 ?auto_949941 ?auto_949943 ?auto_949944 ?auto_949945 ?auto_949946 ?auto_949947 ?auto_949948 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_950087 - SURFACE
      ?auto_950088 - SURFACE
      ?auto_950089 - SURFACE
      ?auto_950086 - SURFACE
      ?auto_950090 - SURFACE
      ?auto_950092 - SURFACE
      ?auto_950091 - SURFACE
      ?auto_950093 - SURFACE
      ?auto_950094 - SURFACE
      ?auto_950095 - SURFACE
      ?auto_950096 - SURFACE
      ?auto_950097 - SURFACE
      ?auto_950098 - SURFACE
    )
    :vars
    (
      ?auto_950101 - HOIST
      ?auto_950102 - PLACE
      ?auto_950103 - TRUCK
      ?auto_950099 - PLACE
      ?auto_950100 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_950101 ?auto_950102 ) ( SURFACE-AT ?auto_950097 ?auto_950102 ) ( CLEAR ?auto_950097 ) ( IS-CRATE ?auto_950098 ) ( not ( = ?auto_950097 ?auto_950098 ) ) ( AVAILABLE ?auto_950101 ) ( ON ?auto_950097 ?auto_950096 ) ( not ( = ?auto_950096 ?auto_950097 ) ) ( not ( = ?auto_950096 ?auto_950098 ) ) ( TRUCK-AT ?auto_950103 ?auto_950099 ) ( not ( = ?auto_950099 ?auto_950102 ) ) ( HOIST-AT ?auto_950100 ?auto_950099 ) ( LIFTING ?auto_950100 ?auto_950098 ) ( not ( = ?auto_950101 ?auto_950100 ) ) ( ON ?auto_950088 ?auto_950087 ) ( ON ?auto_950089 ?auto_950088 ) ( ON ?auto_950086 ?auto_950089 ) ( ON ?auto_950090 ?auto_950086 ) ( ON ?auto_950092 ?auto_950090 ) ( ON ?auto_950091 ?auto_950092 ) ( ON ?auto_950093 ?auto_950091 ) ( ON ?auto_950094 ?auto_950093 ) ( ON ?auto_950095 ?auto_950094 ) ( ON ?auto_950096 ?auto_950095 ) ( not ( = ?auto_950087 ?auto_950088 ) ) ( not ( = ?auto_950087 ?auto_950089 ) ) ( not ( = ?auto_950087 ?auto_950086 ) ) ( not ( = ?auto_950087 ?auto_950090 ) ) ( not ( = ?auto_950087 ?auto_950092 ) ) ( not ( = ?auto_950087 ?auto_950091 ) ) ( not ( = ?auto_950087 ?auto_950093 ) ) ( not ( = ?auto_950087 ?auto_950094 ) ) ( not ( = ?auto_950087 ?auto_950095 ) ) ( not ( = ?auto_950087 ?auto_950096 ) ) ( not ( = ?auto_950087 ?auto_950097 ) ) ( not ( = ?auto_950087 ?auto_950098 ) ) ( not ( = ?auto_950088 ?auto_950089 ) ) ( not ( = ?auto_950088 ?auto_950086 ) ) ( not ( = ?auto_950088 ?auto_950090 ) ) ( not ( = ?auto_950088 ?auto_950092 ) ) ( not ( = ?auto_950088 ?auto_950091 ) ) ( not ( = ?auto_950088 ?auto_950093 ) ) ( not ( = ?auto_950088 ?auto_950094 ) ) ( not ( = ?auto_950088 ?auto_950095 ) ) ( not ( = ?auto_950088 ?auto_950096 ) ) ( not ( = ?auto_950088 ?auto_950097 ) ) ( not ( = ?auto_950088 ?auto_950098 ) ) ( not ( = ?auto_950089 ?auto_950086 ) ) ( not ( = ?auto_950089 ?auto_950090 ) ) ( not ( = ?auto_950089 ?auto_950092 ) ) ( not ( = ?auto_950089 ?auto_950091 ) ) ( not ( = ?auto_950089 ?auto_950093 ) ) ( not ( = ?auto_950089 ?auto_950094 ) ) ( not ( = ?auto_950089 ?auto_950095 ) ) ( not ( = ?auto_950089 ?auto_950096 ) ) ( not ( = ?auto_950089 ?auto_950097 ) ) ( not ( = ?auto_950089 ?auto_950098 ) ) ( not ( = ?auto_950086 ?auto_950090 ) ) ( not ( = ?auto_950086 ?auto_950092 ) ) ( not ( = ?auto_950086 ?auto_950091 ) ) ( not ( = ?auto_950086 ?auto_950093 ) ) ( not ( = ?auto_950086 ?auto_950094 ) ) ( not ( = ?auto_950086 ?auto_950095 ) ) ( not ( = ?auto_950086 ?auto_950096 ) ) ( not ( = ?auto_950086 ?auto_950097 ) ) ( not ( = ?auto_950086 ?auto_950098 ) ) ( not ( = ?auto_950090 ?auto_950092 ) ) ( not ( = ?auto_950090 ?auto_950091 ) ) ( not ( = ?auto_950090 ?auto_950093 ) ) ( not ( = ?auto_950090 ?auto_950094 ) ) ( not ( = ?auto_950090 ?auto_950095 ) ) ( not ( = ?auto_950090 ?auto_950096 ) ) ( not ( = ?auto_950090 ?auto_950097 ) ) ( not ( = ?auto_950090 ?auto_950098 ) ) ( not ( = ?auto_950092 ?auto_950091 ) ) ( not ( = ?auto_950092 ?auto_950093 ) ) ( not ( = ?auto_950092 ?auto_950094 ) ) ( not ( = ?auto_950092 ?auto_950095 ) ) ( not ( = ?auto_950092 ?auto_950096 ) ) ( not ( = ?auto_950092 ?auto_950097 ) ) ( not ( = ?auto_950092 ?auto_950098 ) ) ( not ( = ?auto_950091 ?auto_950093 ) ) ( not ( = ?auto_950091 ?auto_950094 ) ) ( not ( = ?auto_950091 ?auto_950095 ) ) ( not ( = ?auto_950091 ?auto_950096 ) ) ( not ( = ?auto_950091 ?auto_950097 ) ) ( not ( = ?auto_950091 ?auto_950098 ) ) ( not ( = ?auto_950093 ?auto_950094 ) ) ( not ( = ?auto_950093 ?auto_950095 ) ) ( not ( = ?auto_950093 ?auto_950096 ) ) ( not ( = ?auto_950093 ?auto_950097 ) ) ( not ( = ?auto_950093 ?auto_950098 ) ) ( not ( = ?auto_950094 ?auto_950095 ) ) ( not ( = ?auto_950094 ?auto_950096 ) ) ( not ( = ?auto_950094 ?auto_950097 ) ) ( not ( = ?auto_950094 ?auto_950098 ) ) ( not ( = ?auto_950095 ?auto_950096 ) ) ( not ( = ?auto_950095 ?auto_950097 ) ) ( not ( = ?auto_950095 ?auto_950098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_950096 ?auto_950097 ?auto_950098 )
      ( MAKE-12CRATE-VERIFY ?auto_950087 ?auto_950088 ?auto_950089 ?auto_950086 ?auto_950090 ?auto_950092 ?auto_950091 ?auto_950093 ?auto_950094 ?auto_950095 ?auto_950096 ?auto_950097 ?auto_950098 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_950249 - SURFACE
      ?auto_950250 - SURFACE
      ?auto_950251 - SURFACE
      ?auto_950248 - SURFACE
      ?auto_950252 - SURFACE
      ?auto_950254 - SURFACE
      ?auto_950253 - SURFACE
      ?auto_950255 - SURFACE
      ?auto_950256 - SURFACE
      ?auto_950257 - SURFACE
      ?auto_950258 - SURFACE
      ?auto_950259 - SURFACE
      ?auto_950260 - SURFACE
    )
    :vars
    (
      ?auto_950265 - HOIST
      ?auto_950263 - PLACE
      ?auto_950261 - TRUCK
      ?auto_950262 - PLACE
      ?auto_950264 - HOIST
      ?auto_950266 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_950265 ?auto_950263 ) ( SURFACE-AT ?auto_950259 ?auto_950263 ) ( CLEAR ?auto_950259 ) ( IS-CRATE ?auto_950260 ) ( not ( = ?auto_950259 ?auto_950260 ) ) ( AVAILABLE ?auto_950265 ) ( ON ?auto_950259 ?auto_950258 ) ( not ( = ?auto_950258 ?auto_950259 ) ) ( not ( = ?auto_950258 ?auto_950260 ) ) ( TRUCK-AT ?auto_950261 ?auto_950262 ) ( not ( = ?auto_950262 ?auto_950263 ) ) ( HOIST-AT ?auto_950264 ?auto_950262 ) ( not ( = ?auto_950265 ?auto_950264 ) ) ( AVAILABLE ?auto_950264 ) ( SURFACE-AT ?auto_950260 ?auto_950262 ) ( ON ?auto_950260 ?auto_950266 ) ( CLEAR ?auto_950260 ) ( not ( = ?auto_950259 ?auto_950266 ) ) ( not ( = ?auto_950260 ?auto_950266 ) ) ( not ( = ?auto_950258 ?auto_950266 ) ) ( ON ?auto_950250 ?auto_950249 ) ( ON ?auto_950251 ?auto_950250 ) ( ON ?auto_950248 ?auto_950251 ) ( ON ?auto_950252 ?auto_950248 ) ( ON ?auto_950254 ?auto_950252 ) ( ON ?auto_950253 ?auto_950254 ) ( ON ?auto_950255 ?auto_950253 ) ( ON ?auto_950256 ?auto_950255 ) ( ON ?auto_950257 ?auto_950256 ) ( ON ?auto_950258 ?auto_950257 ) ( not ( = ?auto_950249 ?auto_950250 ) ) ( not ( = ?auto_950249 ?auto_950251 ) ) ( not ( = ?auto_950249 ?auto_950248 ) ) ( not ( = ?auto_950249 ?auto_950252 ) ) ( not ( = ?auto_950249 ?auto_950254 ) ) ( not ( = ?auto_950249 ?auto_950253 ) ) ( not ( = ?auto_950249 ?auto_950255 ) ) ( not ( = ?auto_950249 ?auto_950256 ) ) ( not ( = ?auto_950249 ?auto_950257 ) ) ( not ( = ?auto_950249 ?auto_950258 ) ) ( not ( = ?auto_950249 ?auto_950259 ) ) ( not ( = ?auto_950249 ?auto_950260 ) ) ( not ( = ?auto_950249 ?auto_950266 ) ) ( not ( = ?auto_950250 ?auto_950251 ) ) ( not ( = ?auto_950250 ?auto_950248 ) ) ( not ( = ?auto_950250 ?auto_950252 ) ) ( not ( = ?auto_950250 ?auto_950254 ) ) ( not ( = ?auto_950250 ?auto_950253 ) ) ( not ( = ?auto_950250 ?auto_950255 ) ) ( not ( = ?auto_950250 ?auto_950256 ) ) ( not ( = ?auto_950250 ?auto_950257 ) ) ( not ( = ?auto_950250 ?auto_950258 ) ) ( not ( = ?auto_950250 ?auto_950259 ) ) ( not ( = ?auto_950250 ?auto_950260 ) ) ( not ( = ?auto_950250 ?auto_950266 ) ) ( not ( = ?auto_950251 ?auto_950248 ) ) ( not ( = ?auto_950251 ?auto_950252 ) ) ( not ( = ?auto_950251 ?auto_950254 ) ) ( not ( = ?auto_950251 ?auto_950253 ) ) ( not ( = ?auto_950251 ?auto_950255 ) ) ( not ( = ?auto_950251 ?auto_950256 ) ) ( not ( = ?auto_950251 ?auto_950257 ) ) ( not ( = ?auto_950251 ?auto_950258 ) ) ( not ( = ?auto_950251 ?auto_950259 ) ) ( not ( = ?auto_950251 ?auto_950260 ) ) ( not ( = ?auto_950251 ?auto_950266 ) ) ( not ( = ?auto_950248 ?auto_950252 ) ) ( not ( = ?auto_950248 ?auto_950254 ) ) ( not ( = ?auto_950248 ?auto_950253 ) ) ( not ( = ?auto_950248 ?auto_950255 ) ) ( not ( = ?auto_950248 ?auto_950256 ) ) ( not ( = ?auto_950248 ?auto_950257 ) ) ( not ( = ?auto_950248 ?auto_950258 ) ) ( not ( = ?auto_950248 ?auto_950259 ) ) ( not ( = ?auto_950248 ?auto_950260 ) ) ( not ( = ?auto_950248 ?auto_950266 ) ) ( not ( = ?auto_950252 ?auto_950254 ) ) ( not ( = ?auto_950252 ?auto_950253 ) ) ( not ( = ?auto_950252 ?auto_950255 ) ) ( not ( = ?auto_950252 ?auto_950256 ) ) ( not ( = ?auto_950252 ?auto_950257 ) ) ( not ( = ?auto_950252 ?auto_950258 ) ) ( not ( = ?auto_950252 ?auto_950259 ) ) ( not ( = ?auto_950252 ?auto_950260 ) ) ( not ( = ?auto_950252 ?auto_950266 ) ) ( not ( = ?auto_950254 ?auto_950253 ) ) ( not ( = ?auto_950254 ?auto_950255 ) ) ( not ( = ?auto_950254 ?auto_950256 ) ) ( not ( = ?auto_950254 ?auto_950257 ) ) ( not ( = ?auto_950254 ?auto_950258 ) ) ( not ( = ?auto_950254 ?auto_950259 ) ) ( not ( = ?auto_950254 ?auto_950260 ) ) ( not ( = ?auto_950254 ?auto_950266 ) ) ( not ( = ?auto_950253 ?auto_950255 ) ) ( not ( = ?auto_950253 ?auto_950256 ) ) ( not ( = ?auto_950253 ?auto_950257 ) ) ( not ( = ?auto_950253 ?auto_950258 ) ) ( not ( = ?auto_950253 ?auto_950259 ) ) ( not ( = ?auto_950253 ?auto_950260 ) ) ( not ( = ?auto_950253 ?auto_950266 ) ) ( not ( = ?auto_950255 ?auto_950256 ) ) ( not ( = ?auto_950255 ?auto_950257 ) ) ( not ( = ?auto_950255 ?auto_950258 ) ) ( not ( = ?auto_950255 ?auto_950259 ) ) ( not ( = ?auto_950255 ?auto_950260 ) ) ( not ( = ?auto_950255 ?auto_950266 ) ) ( not ( = ?auto_950256 ?auto_950257 ) ) ( not ( = ?auto_950256 ?auto_950258 ) ) ( not ( = ?auto_950256 ?auto_950259 ) ) ( not ( = ?auto_950256 ?auto_950260 ) ) ( not ( = ?auto_950256 ?auto_950266 ) ) ( not ( = ?auto_950257 ?auto_950258 ) ) ( not ( = ?auto_950257 ?auto_950259 ) ) ( not ( = ?auto_950257 ?auto_950260 ) ) ( not ( = ?auto_950257 ?auto_950266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_950258 ?auto_950259 ?auto_950260 )
      ( MAKE-12CRATE-VERIFY ?auto_950249 ?auto_950250 ?auto_950251 ?auto_950248 ?auto_950252 ?auto_950254 ?auto_950253 ?auto_950255 ?auto_950256 ?auto_950257 ?auto_950258 ?auto_950259 ?auto_950260 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_950412 - SURFACE
      ?auto_950413 - SURFACE
      ?auto_950414 - SURFACE
      ?auto_950411 - SURFACE
      ?auto_950415 - SURFACE
      ?auto_950417 - SURFACE
      ?auto_950416 - SURFACE
      ?auto_950418 - SURFACE
      ?auto_950419 - SURFACE
      ?auto_950420 - SURFACE
      ?auto_950421 - SURFACE
      ?auto_950422 - SURFACE
      ?auto_950423 - SURFACE
    )
    :vars
    (
      ?auto_950428 - HOIST
      ?auto_950427 - PLACE
      ?auto_950426 - PLACE
      ?auto_950429 - HOIST
      ?auto_950425 - SURFACE
      ?auto_950424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_950428 ?auto_950427 ) ( SURFACE-AT ?auto_950422 ?auto_950427 ) ( CLEAR ?auto_950422 ) ( IS-CRATE ?auto_950423 ) ( not ( = ?auto_950422 ?auto_950423 ) ) ( AVAILABLE ?auto_950428 ) ( ON ?auto_950422 ?auto_950421 ) ( not ( = ?auto_950421 ?auto_950422 ) ) ( not ( = ?auto_950421 ?auto_950423 ) ) ( not ( = ?auto_950426 ?auto_950427 ) ) ( HOIST-AT ?auto_950429 ?auto_950426 ) ( not ( = ?auto_950428 ?auto_950429 ) ) ( AVAILABLE ?auto_950429 ) ( SURFACE-AT ?auto_950423 ?auto_950426 ) ( ON ?auto_950423 ?auto_950425 ) ( CLEAR ?auto_950423 ) ( not ( = ?auto_950422 ?auto_950425 ) ) ( not ( = ?auto_950423 ?auto_950425 ) ) ( not ( = ?auto_950421 ?auto_950425 ) ) ( TRUCK-AT ?auto_950424 ?auto_950427 ) ( ON ?auto_950413 ?auto_950412 ) ( ON ?auto_950414 ?auto_950413 ) ( ON ?auto_950411 ?auto_950414 ) ( ON ?auto_950415 ?auto_950411 ) ( ON ?auto_950417 ?auto_950415 ) ( ON ?auto_950416 ?auto_950417 ) ( ON ?auto_950418 ?auto_950416 ) ( ON ?auto_950419 ?auto_950418 ) ( ON ?auto_950420 ?auto_950419 ) ( ON ?auto_950421 ?auto_950420 ) ( not ( = ?auto_950412 ?auto_950413 ) ) ( not ( = ?auto_950412 ?auto_950414 ) ) ( not ( = ?auto_950412 ?auto_950411 ) ) ( not ( = ?auto_950412 ?auto_950415 ) ) ( not ( = ?auto_950412 ?auto_950417 ) ) ( not ( = ?auto_950412 ?auto_950416 ) ) ( not ( = ?auto_950412 ?auto_950418 ) ) ( not ( = ?auto_950412 ?auto_950419 ) ) ( not ( = ?auto_950412 ?auto_950420 ) ) ( not ( = ?auto_950412 ?auto_950421 ) ) ( not ( = ?auto_950412 ?auto_950422 ) ) ( not ( = ?auto_950412 ?auto_950423 ) ) ( not ( = ?auto_950412 ?auto_950425 ) ) ( not ( = ?auto_950413 ?auto_950414 ) ) ( not ( = ?auto_950413 ?auto_950411 ) ) ( not ( = ?auto_950413 ?auto_950415 ) ) ( not ( = ?auto_950413 ?auto_950417 ) ) ( not ( = ?auto_950413 ?auto_950416 ) ) ( not ( = ?auto_950413 ?auto_950418 ) ) ( not ( = ?auto_950413 ?auto_950419 ) ) ( not ( = ?auto_950413 ?auto_950420 ) ) ( not ( = ?auto_950413 ?auto_950421 ) ) ( not ( = ?auto_950413 ?auto_950422 ) ) ( not ( = ?auto_950413 ?auto_950423 ) ) ( not ( = ?auto_950413 ?auto_950425 ) ) ( not ( = ?auto_950414 ?auto_950411 ) ) ( not ( = ?auto_950414 ?auto_950415 ) ) ( not ( = ?auto_950414 ?auto_950417 ) ) ( not ( = ?auto_950414 ?auto_950416 ) ) ( not ( = ?auto_950414 ?auto_950418 ) ) ( not ( = ?auto_950414 ?auto_950419 ) ) ( not ( = ?auto_950414 ?auto_950420 ) ) ( not ( = ?auto_950414 ?auto_950421 ) ) ( not ( = ?auto_950414 ?auto_950422 ) ) ( not ( = ?auto_950414 ?auto_950423 ) ) ( not ( = ?auto_950414 ?auto_950425 ) ) ( not ( = ?auto_950411 ?auto_950415 ) ) ( not ( = ?auto_950411 ?auto_950417 ) ) ( not ( = ?auto_950411 ?auto_950416 ) ) ( not ( = ?auto_950411 ?auto_950418 ) ) ( not ( = ?auto_950411 ?auto_950419 ) ) ( not ( = ?auto_950411 ?auto_950420 ) ) ( not ( = ?auto_950411 ?auto_950421 ) ) ( not ( = ?auto_950411 ?auto_950422 ) ) ( not ( = ?auto_950411 ?auto_950423 ) ) ( not ( = ?auto_950411 ?auto_950425 ) ) ( not ( = ?auto_950415 ?auto_950417 ) ) ( not ( = ?auto_950415 ?auto_950416 ) ) ( not ( = ?auto_950415 ?auto_950418 ) ) ( not ( = ?auto_950415 ?auto_950419 ) ) ( not ( = ?auto_950415 ?auto_950420 ) ) ( not ( = ?auto_950415 ?auto_950421 ) ) ( not ( = ?auto_950415 ?auto_950422 ) ) ( not ( = ?auto_950415 ?auto_950423 ) ) ( not ( = ?auto_950415 ?auto_950425 ) ) ( not ( = ?auto_950417 ?auto_950416 ) ) ( not ( = ?auto_950417 ?auto_950418 ) ) ( not ( = ?auto_950417 ?auto_950419 ) ) ( not ( = ?auto_950417 ?auto_950420 ) ) ( not ( = ?auto_950417 ?auto_950421 ) ) ( not ( = ?auto_950417 ?auto_950422 ) ) ( not ( = ?auto_950417 ?auto_950423 ) ) ( not ( = ?auto_950417 ?auto_950425 ) ) ( not ( = ?auto_950416 ?auto_950418 ) ) ( not ( = ?auto_950416 ?auto_950419 ) ) ( not ( = ?auto_950416 ?auto_950420 ) ) ( not ( = ?auto_950416 ?auto_950421 ) ) ( not ( = ?auto_950416 ?auto_950422 ) ) ( not ( = ?auto_950416 ?auto_950423 ) ) ( not ( = ?auto_950416 ?auto_950425 ) ) ( not ( = ?auto_950418 ?auto_950419 ) ) ( not ( = ?auto_950418 ?auto_950420 ) ) ( not ( = ?auto_950418 ?auto_950421 ) ) ( not ( = ?auto_950418 ?auto_950422 ) ) ( not ( = ?auto_950418 ?auto_950423 ) ) ( not ( = ?auto_950418 ?auto_950425 ) ) ( not ( = ?auto_950419 ?auto_950420 ) ) ( not ( = ?auto_950419 ?auto_950421 ) ) ( not ( = ?auto_950419 ?auto_950422 ) ) ( not ( = ?auto_950419 ?auto_950423 ) ) ( not ( = ?auto_950419 ?auto_950425 ) ) ( not ( = ?auto_950420 ?auto_950421 ) ) ( not ( = ?auto_950420 ?auto_950422 ) ) ( not ( = ?auto_950420 ?auto_950423 ) ) ( not ( = ?auto_950420 ?auto_950425 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_950421 ?auto_950422 ?auto_950423 )
      ( MAKE-12CRATE-VERIFY ?auto_950412 ?auto_950413 ?auto_950414 ?auto_950411 ?auto_950415 ?auto_950417 ?auto_950416 ?auto_950418 ?auto_950419 ?auto_950420 ?auto_950421 ?auto_950422 ?auto_950423 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_950575 - SURFACE
      ?auto_950576 - SURFACE
      ?auto_950577 - SURFACE
      ?auto_950574 - SURFACE
      ?auto_950578 - SURFACE
      ?auto_950580 - SURFACE
      ?auto_950579 - SURFACE
      ?auto_950581 - SURFACE
      ?auto_950582 - SURFACE
      ?auto_950583 - SURFACE
      ?auto_950584 - SURFACE
      ?auto_950585 - SURFACE
      ?auto_950586 - SURFACE
    )
    :vars
    (
      ?auto_950592 - HOIST
      ?auto_950591 - PLACE
      ?auto_950588 - PLACE
      ?auto_950589 - HOIST
      ?auto_950587 - SURFACE
      ?auto_950590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_950592 ?auto_950591 ) ( IS-CRATE ?auto_950586 ) ( not ( = ?auto_950585 ?auto_950586 ) ) ( not ( = ?auto_950584 ?auto_950585 ) ) ( not ( = ?auto_950584 ?auto_950586 ) ) ( not ( = ?auto_950588 ?auto_950591 ) ) ( HOIST-AT ?auto_950589 ?auto_950588 ) ( not ( = ?auto_950592 ?auto_950589 ) ) ( AVAILABLE ?auto_950589 ) ( SURFACE-AT ?auto_950586 ?auto_950588 ) ( ON ?auto_950586 ?auto_950587 ) ( CLEAR ?auto_950586 ) ( not ( = ?auto_950585 ?auto_950587 ) ) ( not ( = ?auto_950586 ?auto_950587 ) ) ( not ( = ?auto_950584 ?auto_950587 ) ) ( TRUCK-AT ?auto_950590 ?auto_950591 ) ( SURFACE-AT ?auto_950584 ?auto_950591 ) ( CLEAR ?auto_950584 ) ( LIFTING ?auto_950592 ?auto_950585 ) ( IS-CRATE ?auto_950585 ) ( ON ?auto_950576 ?auto_950575 ) ( ON ?auto_950577 ?auto_950576 ) ( ON ?auto_950574 ?auto_950577 ) ( ON ?auto_950578 ?auto_950574 ) ( ON ?auto_950580 ?auto_950578 ) ( ON ?auto_950579 ?auto_950580 ) ( ON ?auto_950581 ?auto_950579 ) ( ON ?auto_950582 ?auto_950581 ) ( ON ?auto_950583 ?auto_950582 ) ( ON ?auto_950584 ?auto_950583 ) ( not ( = ?auto_950575 ?auto_950576 ) ) ( not ( = ?auto_950575 ?auto_950577 ) ) ( not ( = ?auto_950575 ?auto_950574 ) ) ( not ( = ?auto_950575 ?auto_950578 ) ) ( not ( = ?auto_950575 ?auto_950580 ) ) ( not ( = ?auto_950575 ?auto_950579 ) ) ( not ( = ?auto_950575 ?auto_950581 ) ) ( not ( = ?auto_950575 ?auto_950582 ) ) ( not ( = ?auto_950575 ?auto_950583 ) ) ( not ( = ?auto_950575 ?auto_950584 ) ) ( not ( = ?auto_950575 ?auto_950585 ) ) ( not ( = ?auto_950575 ?auto_950586 ) ) ( not ( = ?auto_950575 ?auto_950587 ) ) ( not ( = ?auto_950576 ?auto_950577 ) ) ( not ( = ?auto_950576 ?auto_950574 ) ) ( not ( = ?auto_950576 ?auto_950578 ) ) ( not ( = ?auto_950576 ?auto_950580 ) ) ( not ( = ?auto_950576 ?auto_950579 ) ) ( not ( = ?auto_950576 ?auto_950581 ) ) ( not ( = ?auto_950576 ?auto_950582 ) ) ( not ( = ?auto_950576 ?auto_950583 ) ) ( not ( = ?auto_950576 ?auto_950584 ) ) ( not ( = ?auto_950576 ?auto_950585 ) ) ( not ( = ?auto_950576 ?auto_950586 ) ) ( not ( = ?auto_950576 ?auto_950587 ) ) ( not ( = ?auto_950577 ?auto_950574 ) ) ( not ( = ?auto_950577 ?auto_950578 ) ) ( not ( = ?auto_950577 ?auto_950580 ) ) ( not ( = ?auto_950577 ?auto_950579 ) ) ( not ( = ?auto_950577 ?auto_950581 ) ) ( not ( = ?auto_950577 ?auto_950582 ) ) ( not ( = ?auto_950577 ?auto_950583 ) ) ( not ( = ?auto_950577 ?auto_950584 ) ) ( not ( = ?auto_950577 ?auto_950585 ) ) ( not ( = ?auto_950577 ?auto_950586 ) ) ( not ( = ?auto_950577 ?auto_950587 ) ) ( not ( = ?auto_950574 ?auto_950578 ) ) ( not ( = ?auto_950574 ?auto_950580 ) ) ( not ( = ?auto_950574 ?auto_950579 ) ) ( not ( = ?auto_950574 ?auto_950581 ) ) ( not ( = ?auto_950574 ?auto_950582 ) ) ( not ( = ?auto_950574 ?auto_950583 ) ) ( not ( = ?auto_950574 ?auto_950584 ) ) ( not ( = ?auto_950574 ?auto_950585 ) ) ( not ( = ?auto_950574 ?auto_950586 ) ) ( not ( = ?auto_950574 ?auto_950587 ) ) ( not ( = ?auto_950578 ?auto_950580 ) ) ( not ( = ?auto_950578 ?auto_950579 ) ) ( not ( = ?auto_950578 ?auto_950581 ) ) ( not ( = ?auto_950578 ?auto_950582 ) ) ( not ( = ?auto_950578 ?auto_950583 ) ) ( not ( = ?auto_950578 ?auto_950584 ) ) ( not ( = ?auto_950578 ?auto_950585 ) ) ( not ( = ?auto_950578 ?auto_950586 ) ) ( not ( = ?auto_950578 ?auto_950587 ) ) ( not ( = ?auto_950580 ?auto_950579 ) ) ( not ( = ?auto_950580 ?auto_950581 ) ) ( not ( = ?auto_950580 ?auto_950582 ) ) ( not ( = ?auto_950580 ?auto_950583 ) ) ( not ( = ?auto_950580 ?auto_950584 ) ) ( not ( = ?auto_950580 ?auto_950585 ) ) ( not ( = ?auto_950580 ?auto_950586 ) ) ( not ( = ?auto_950580 ?auto_950587 ) ) ( not ( = ?auto_950579 ?auto_950581 ) ) ( not ( = ?auto_950579 ?auto_950582 ) ) ( not ( = ?auto_950579 ?auto_950583 ) ) ( not ( = ?auto_950579 ?auto_950584 ) ) ( not ( = ?auto_950579 ?auto_950585 ) ) ( not ( = ?auto_950579 ?auto_950586 ) ) ( not ( = ?auto_950579 ?auto_950587 ) ) ( not ( = ?auto_950581 ?auto_950582 ) ) ( not ( = ?auto_950581 ?auto_950583 ) ) ( not ( = ?auto_950581 ?auto_950584 ) ) ( not ( = ?auto_950581 ?auto_950585 ) ) ( not ( = ?auto_950581 ?auto_950586 ) ) ( not ( = ?auto_950581 ?auto_950587 ) ) ( not ( = ?auto_950582 ?auto_950583 ) ) ( not ( = ?auto_950582 ?auto_950584 ) ) ( not ( = ?auto_950582 ?auto_950585 ) ) ( not ( = ?auto_950582 ?auto_950586 ) ) ( not ( = ?auto_950582 ?auto_950587 ) ) ( not ( = ?auto_950583 ?auto_950584 ) ) ( not ( = ?auto_950583 ?auto_950585 ) ) ( not ( = ?auto_950583 ?auto_950586 ) ) ( not ( = ?auto_950583 ?auto_950587 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_950584 ?auto_950585 ?auto_950586 )
      ( MAKE-12CRATE-VERIFY ?auto_950575 ?auto_950576 ?auto_950577 ?auto_950574 ?auto_950578 ?auto_950580 ?auto_950579 ?auto_950581 ?auto_950582 ?auto_950583 ?auto_950584 ?auto_950585 ?auto_950586 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_950738 - SURFACE
      ?auto_950739 - SURFACE
      ?auto_950740 - SURFACE
      ?auto_950737 - SURFACE
      ?auto_950741 - SURFACE
      ?auto_950743 - SURFACE
      ?auto_950742 - SURFACE
      ?auto_950744 - SURFACE
      ?auto_950745 - SURFACE
      ?auto_950746 - SURFACE
      ?auto_950747 - SURFACE
      ?auto_950748 - SURFACE
      ?auto_950749 - SURFACE
    )
    :vars
    (
      ?auto_950754 - HOIST
      ?auto_950751 - PLACE
      ?auto_950752 - PLACE
      ?auto_950755 - HOIST
      ?auto_950750 - SURFACE
      ?auto_950753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_950754 ?auto_950751 ) ( IS-CRATE ?auto_950749 ) ( not ( = ?auto_950748 ?auto_950749 ) ) ( not ( = ?auto_950747 ?auto_950748 ) ) ( not ( = ?auto_950747 ?auto_950749 ) ) ( not ( = ?auto_950752 ?auto_950751 ) ) ( HOIST-AT ?auto_950755 ?auto_950752 ) ( not ( = ?auto_950754 ?auto_950755 ) ) ( AVAILABLE ?auto_950755 ) ( SURFACE-AT ?auto_950749 ?auto_950752 ) ( ON ?auto_950749 ?auto_950750 ) ( CLEAR ?auto_950749 ) ( not ( = ?auto_950748 ?auto_950750 ) ) ( not ( = ?auto_950749 ?auto_950750 ) ) ( not ( = ?auto_950747 ?auto_950750 ) ) ( TRUCK-AT ?auto_950753 ?auto_950751 ) ( SURFACE-AT ?auto_950747 ?auto_950751 ) ( CLEAR ?auto_950747 ) ( IS-CRATE ?auto_950748 ) ( AVAILABLE ?auto_950754 ) ( IN ?auto_950748 ?auto_950753 ) ( ON ?auto_950739 ?auto_950738 ) ( ON ?auto_950740 ?auto_950739 ) ( ON ?auto_950737 ?auto_950740 ) ( ON ?auto_950741 ?auto_950737 ) ( ON ?auto_950743 ?auto_950741 ) ( ON ?auto_950742 ?auto_950743 ) ( ON ?auto_950744 ?auto_950742 ) ( ON ?auto_950745 ?auto_950744 ) ( ON ?auto_950746 ?auto_950745 ) ( ON ?auto_950747 ?auto_950746 ) ( not ( = ?auto_950738 ?auto_950739 ) ) ( not ( = ?auto_950738 ?auto_950740 ) ) ( not ( = ?auto_950738 ?auto_950737 ) ) ( not ( = ?auto_950738 ?auto_950741 ) ) ( not ( = ?auto_950738 ?auto_950743 ) ) ( not ( = ?auto_950738 ?auto_950742 ) ) ( not ( = ?auto_950738 ?auto_950744 ) ) ( not ( = ?auto_950738 ?auto_950745 ) ) ( not ( = ?auto_950738 ?auto_950746 ) ) ( not ( = ?auto_950738 ?auto_950747 ) ) ( not ( = ?auto_950738 ?auto_950748 ) ) ( not ( = ?auto_950738 ?auto_950749 ) ) ( not ( = ?auto_950738 ?auto_950750 ) ) ( not ( = ?auto_950739 ?auto_950740 ) ) ( not ( = ?auto_950739 ?auto_950737 ) ) ( not ( = ?auto_950739 ?auto_950741 ) ) ( not ( = ?auto_950739 ?auto_950743 ) ) ( not ( = ?auto_950739 ?auto_950742 ) ) ( not ( = ?auto_950739 ?auto_950744 ) ) ( not ( = ?auto_950739 ?auto_950745 ) ) ( not ( = ?auto_950739 ?auto_950746 ) ) ( not ( = ?auto_950739 ?auto_950747 ) ) ( not ( = ?auto_950739 ?auto_950748 ) ) ( not ( = ?auto_950739 ?auto_950749 ) ) ( not ( = ?auto_950739 ?auto_950750 ) ) ( not ( = ?auto_950740 ?auto_950737 ) ) ( not ( = ?auto_950740 ?auto_950741 ) ) ( not ( = ?auto_950740 ?auto_950743 ) ) ( not ( = ?auto_950740 ?auto_950742 ) ) ( not ( = ?auto_950740 ?auto_950744 ) ) ( not ( = ?auto_950740 ?auto_950745 ) ) ( not ( = ?auto_950740 ?auto_950746 ) ) ( not ( = ?auto_950740 ?auto_950747 ) ) ( not ( = ?auto_950740 ?auto_950748 ) ) ( not ( = ?auto_950740 ?auto_950749 ) ) ( not ( = ?auto_950740 ?auto_950750 ) ) ( not ( = ?auto_950737 ?auto_950741 ) ) ( not ( = ?auto_950737 ?auto_950743 ) ) ( not ( = ?auto_950737 ?auto_950742 ) ) ( not ( = ?auto_950737 ?auto_950744 ) ) ( not ( = ?auto_950737 ?auto_950745 ) ) ( not ( = ?auto_950737 ?auto_950746 ) ) ( not ( = ?auto_950737 ?auto_950747 ) ) ( not ( = ?auto_950737 ?auto_950748 ) ) ( not ( = ?auto_950737 ?auto_950749 ) ) ( not ( = ?auto_950737 ?auto_950750 ) ) ( not ( = ?auto_950741 ?auto_950743 ) ) ( not ( = ?auto_950741 ?auto_950742 ) ) ( not ( = ?auto_950741 ?auto_950744 ) ) ( not ( = ?auto_950741 ?auto_950745 ) ) ( not ( = ?auto_950741 ?auto_950746 ) ) ( not ( = ?auto_950741 ?auto_950747 ) ) ( not ( = ?auto_950741 ?auto_950748 ) ) ( not ( = ?auto_950741 ?auto_950749 ) ) ( not ( = ?auto_950741 ?auto_950750 ) ) ( not ( = ?auto_950743 ?auto_950742 ) ) ( not ( = ?auto_950743 ?auto_950744 ) ) ( not ( = ?auto_950743 ?auto_950745 ) ) ( not ( = ?auto_950743 ?auto_950746 ) ) ( not ( = ?auto_950743 ?auto_950747 ) ) ( not ( = ?auto_950743 ?auto_950748 ) ) ( not ( = ?auto_950743 ?auto_950749 ) ) ( not ( = ?auto_950743 ?auto_950750 ) ) ( not ( = ?auto_950742 ?auto_950744 ) ) ( not ( = ?auto_950742 ?auto_950745 ) ) ( not ( = ?auto_950742 ?auto_950746 ) ) ( not ( = ?auto_950742 ?auto_950747 ) ) ( not ( = ?auto_950742 ?auto_950748 ) ) ( not ( = ?auto_950742 ?auto_950749 ) ) ( not ( = ?auto_950742 ?auto_950750 ) ) ( not ( = ?auto_950744 ?auto_950745 ) ) ( not ( = ?auto_950744 ?auto_950746 ) ) ( not ( = ?auto_950744 ?auto_950747 ) ) ( not ( = ?auto_950744 ?auto_950748 ) ) ( not ( = ?auto_950744 ?auto_950749 ) ) ( not ( = ?auto_950744 ?auto_950750 ) ) ( not ( = ?auto_950745 ?auto_950746 ) ) ( not ( = ?auto_950745 ?auto_950747 ) ) ( not ( = ?auto_950745 ?auto_950748 ) ) ( not ( = ?auto_950745 ?auto_950749 ) ) ( not ( = ?auto_950745 ?auto_950750 ) ) ( not ( = ?auto_950746 ?auto_950747 ) ) ( not ( = ?auto_950746 ?auto_950748 ) ) ( not ( = ?auto_950746 ?auto_950749 ) ) ( not ( = ?auto_950746 ?auto_950750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_950747 ?auto_950748 ?auto_950749 )
      ( MAKE-12CRATE-VERIFY ?auto_950738 ?auto_950739 ?auto_950740 ?auto_950737 ?auto_950741 ?auto_950743 ?auto_950742 ?auto_950744 ?auto_950745 ?auto_950746 ?auto_950747 ?auto_950748 ?auto_950749 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962313 - SURFACE
      ?auto_962314 - SURFACE
      ?auto_962315 - SURFACE
      ?auto_962312 - SURFACE
      ?auto_962316 - SURFACE
      ?auto_962318 - SURFACE
      ?auto_962317 - SURFACE
      ?auto_962319 - SURFACE
      ?auto_962320 - SURFACE
      ?auto_962321 - SURFACE
      ?auto_962322 - SURFACE
      ?auto_962323 - SURFACE
      ?auto_962324 - SURFACE
      ?auto_962325 - SURFACE
    )
    :vars
    (
      ?auto_962326 - HOIST
      ?auto_962327 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_962326 ?auto_962327 ) ( SURFACE-AT ?auto_962324 ?auto_962327 ) ( CLEAR ?auto_962324 ) ( LIFTING ?auto_962326 ?auto_962325 ) ( IS-CRATE ?auto_962325 ) ( not ( = ?auto_962324 ?auto_962325 ) ) ( ON ?auto_962314 ?auto_962313 ) ( ON ?auto_962315 ?auto_962314 ) ( ON ?auto_962312 ?auto_962315 ) ( ON ?auto_962316 ?auto_962312 ) ( ON ?auto_962318 ?auto_962316 ) ( ON ?auto_962317 ?auto_962318 ) ( ON ?auto_962319 ?auto_962317 ) ( ON ?auto_962320 ?auto_962319 ) ( ON ?auto_962321 ?auto_962320 ) ( ON ?auto_962322 ?auto_962321 ) ( ON ?auto_962323 ?auto_962322 ) ( ON ?auto_962324 ?auto_962323 ) ( not ( = ?auto_962313 ?auto_962314 ) ) ( not ( = ?auto_962313 ?auto_962315 ) ) ( not ( = ?auto_962313 ?auto_962312 ) ) ( not ( = ?auto_962313 ?auto_962316 ) ) ( not ( = ?auto_962313 ?auto_962318 ) ) ( not ( = ?auto_962313 ?auto_962317 ) ) ( not ( = ?auto_962313 ?auto_962319 ) ) ( not ( = ?auto_962313 ?auto_962320 ) ) ( not ( = ?auto_962313 ?auto_962321 ) ) ( not ( = ?auto_962313 ?auto_962322 ) ) ( not ( = ?auto_962313 ?auto_962323 ) ) ( not ( = ?auto_962313 ?auto_962324 ) ) ( not ( = ?auto_962313 ?auto_962325 ) ) ( not ( = ?auto_962314 ?auto_962315 ) ) ( not ( = ?auto_962314 ?auto_962312 ) ) ( not ( = ?auto_962314 ?auto_962316 ) ) ( not ( = ?auto_962314 ?auto_962318 ) ) ( not ( = ?auto_962314 ?auto_962317 ) ) ( not ( = ?auto_962314 ?auto_962319 ) ) ( not ( = ?auto_962314 ?auto_962320 ) ) ( not ( = ?auto_962314 ?auto_962321 ) ) ( not ( = ?auto_962314 ?auto_962322 ) ) ( not ( = ?auto_962314 ?auto_962323 ) ) ( not ( = ?auto_962314 ?auto_962324 ) ) ( not ( = ?auto_962314 ?auto_962325 ) ) ( not ( = ?auto_962315 ?auto_962312 ) ) ( not ( = ?auto_962315 ?auto_962316 ) ) ( not ( = ?auto_962315 ?auto_962318 ) ) ( not ( = ?auto_962315 ?auto_962317 ) ) ( not ( = ?auto_962315 ?auto_962319 ) ) ( not ( = ?auto_962315 ?auto_962320 ) ) ( not ( = ?auto_962315 ?auto_962321 ) ) ( not ( = ?auto_962315 ?auto_962322 ) ) ( not ( = ?auto_962315 ?auto_962323 ) ) ( not ( = ?auto_962315 ?auto_962324 ) ) ( not ( = ?auto_962315 ?auto_962325 ) ) ( not ( = ?auto_962312 ?auto_962316 ) ) ( not ( = ?auto_962312 ?auto_962318 ) ) ( not ( = ?auto_962312 ?auto_962317 ) ) ( not ( = ?auto_962312 ?auto_962319 ) ) ( not ( = ?auto_962312 ?auto_962320 ) ) ( not ( = ?auto_962312 ?auto_962321 ) ) ( not ( = ?auto_962312 ?auto_962322 ) ) ( not ( = ?auto_962312 ?auto_962323 ) ) ( not ( = ?auto_962312 ?auto_962324 ) ) ( not ( = ?auto_962312 ?auto_962325 ) ) ( not ( = ?auto_962316 ?auto_962318 ) ) ( not ( = ?auto_962316 ?auto_962317 ) ) ( not ( = ?auto_962316 ?auto_962319 ) ) ( not ( = ?auto_962316 ?auto_962320 ) ) ( not ( = ?auto_962316 ?auto_962321 ) ) ( not ( = ?auto_962316 ?auto_962322 ) ) ( not ( = ?auto_962316 ?auto_962323 ) ) ( not ( = ?auto_962316 ?auto_962324 ) ) ( not ( = ?auto_962316 ?auto_962325 ) ) ( not ( = ?auto_962318 ?auto_962317 ) ) ( not ( = ?auto_962318 ?auto_962319 ) ) ( not ( = ?auto_962318 ?auto_962320 ) ) ( not ( = ?auto_962318 ?auto_962321 ) ) ( not ( = ?auto_962318 ?auto_962322 ) ) ( not ( = ?auto_962318 ?auto_962323 ) ) ( not ( = ?auto_962318 ?auto_962324 ) ) ( not ( = ?auto_962318 ?auto_962325 ) ) ( not ( = ?auto_962317 ?auto_962319 ) ) ( not ( = ?auto_962317 ?auto_962320 ) ) ( not ( = ?auto_962317 ?auto_962321 ) ) ( not ( = ?auto_962317 ?auto_962322 ) ) ( not ( = ?auto_962317 ?auto_962323 ) ) ( not ( = ?auto_962317 ?auto_962324 ) ) ( not ( = ?auto_962317 ?auto_962325 ) ) ( not ( = ?auto_962319 ?auto_962320 ) ) ( not ( = ?auto_962319 ?auto_962321 ) ) ( not ( = ?auto_962319 ?auto_962322 ) ) ( not ( = ?auto_962319 ?auto_962323 ) ) ( not ( = ?auto_962319 ?auto_962324 ) ) ( not ( = ?auto_962319 ?auto_962325 ) ) ( not ( = ?auto_962320 ?auto_962321 ) ) ( not ( = ?auto_962320 ?auto_962322 ) ) ( not ( = ?auto_962320 ?auto_962323 ) ) ( not ( = ?auto_962320 ?auto_962324 ) ) ( not ( = ?auto_962320 ?auto_962325 ) ) ( not ( = ?auto_962321 ?auto_962322 ) ) ( not ( = ?auto_962321 ?auto_962323 ) ) ( not ( = ?auto_962321 ?auto_962324 ) ) ( not ( = ?auto_962321 ?auto_962325 ) ) ( not ( = ?auto_962322 ?auto_962323 ) ) ( not ( = ?auto_962322 ?auto_962324 ) ) ( not ( = ?auto_962322 ?auto_962325 ) ) ( not ( = ?auto_962323 ?auto_962324 ) ) ( not ( = ?auto_962323 ?auto_962325 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_962324 ?auto_962325 )
      ( MAKE-13CRATE-VERIFY ?auto_962313 ?auto_962314 ?auto_962315 ?auto_962312 ?auto_962316 ?auto_962318 ?auto_962317 ?auto_962319 ?auto_962320 ?auto_962321 ?auto_962322 ?auto_962323 ?auto_962324 ?auto_962325 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962455 - SURFACE
      ?auto_962456 - SURFACE
      ?auto_962457 - SURFACE
      ?auto_962454 - SURFACE
      ?auto_962458 - SURFACE
      ?auto_962460 - SURFACE
      ?auto_962459 - SURFACE
      ?auto_962461 - SURFACE
      ?auto_962462 - SURFACE
      ?auto_962463 - SURFACE
      ?auto_962464 - SURFACE
      ?auto_962465 - SURFACE
      ?auto_962466 - SURFACE
      ?auto_962467 - SURFACE
    )
    :vars
    (
      ?auto_962468 - HOIST
      ?auto_962470 - PLACE
      ?auto_962469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_962468 ?auto_962470 ) ( SURFACE-AT ?auto_962466 ?auto_962470 ) ( CLEAR ?auto_962466 ) ( IS-CRATE ?auto_962467 ) ( not ( = ?auto_962466 ?auto_962467 ) ) ( TRUCK-AT ?auto_962469 ?auto_962470 ) ( AVAILABLE ?auto_962468 ) ( IN ?auto_962467 ?auto_962469 ) ( ON ?auto_962466 ?auto_962465 ) ( not ( = ?auto_962465 ?auto_962466 ) ) ( not ( = ?auto_962465 ?auto_962467 ) ) ( ON ?auto_962456 ?auto_962455 ) ( ON ?auto_962457 ?auto_962456 ) ( ON ?auto_962454 ?auto_962457 ) ( ON ?auto_962458 ?auto_962454 ) ( ON ?auto_962460 ?auto_962458 ) ( ON ?auto_962459 ?auto_962460 ) ( ON ?auto_962461 ?auto_962459 ) ( ON ?auto_962462 ?auto_962461 ) ( ON ?auto_962463 ?auto_962462 ) ( ON ?auto_962464 ?auto_962463 ) ( ON ?auto_962465 ?auto_962464 ) ( not ( = ?auto_962455 ?auto_962456 ) ) ( not ( = ?auto_962455 ?auto_962457 ) ) ( not ( = ?auto_962455 ?auto_962454 ) ) ( not ( = ?auto_962455 ?auto_962458 ) ) ( not ( = ?auto_962455 ?auto_962460 ) ) ( not ( = ?auto_962455 ?auto_962459 ) ) ( not ( = ?auto_962455 ?auto_962461 ) ) ( not ( = ?auto_962455 ?auto_962462 ) ) ( not ( = ?auto_962455 ?auto_962463 ) ) ( not ( = ?auto_962455 ?auto_962464 ) ) ( not ( = ?auto_962455 ?auto_962465 ) ) ( not ( = ?auto_962455 ?auto_962466 ) ) ( not ( = ?auto_962455 ?auto_962467 ) ) ( not ( = ?auto_962456 ?auto_962457 ) ) ( not ( = ?auto_962456 ?auto_962454 ) ) ( not ( = ?auto_962456 ?auto_962458 ) ) ( not ( = ?auto_962456 ?auto_962460 ) ) ( not ( = ?auto_962456 ?auto_962459 ) ) ( not ( = ?auto_962456 ?auto_962461 ) ) ( not ( = ?auto_962456 ?auto_962462 ) ) ( not ( = ?auto_962456 ?auto_962463 ) ) ( not ( = ?auto_962456 ?auto_962464 ) ) ( not ( = ?auto_962456 ?auto_962465 ) ) ( not ( = ?auto_962456 ?auto_962466 ) ) ( not ( = ?auto_962456 ?auto_962467 ) ) ( not ( = ?auto_962457 ?auto_962454 ) ) ( not ( = ?auto_962457 ?auto_962458 ) ) ( not ( = ?auto_962457 ?auto_962460 ) ) ( not ( = ?auto_962457 ?auto_962459 ) ) ( not ( = ?auto_962457 ?auto_962461 ) ) ( not ( = ?auto_962457 ?auto_962462 ) ) ( not ( = ?auto_962457 ?auto_962463 ) ) ( not ( = ?auto_962457 ?auto_962464 ) ) ( not ( = ?auto_962457 ?auto_962465 ) ) ( not ( = ?auto_962457 ?auto_962466 ) ) ( not ( = ?auto_962457 ?auto_962467 ) ) ( not ( = ?auto_962454 ?auto_962458 ) ) ( not ( = ?auto_962454 ?auto_962460 ) ) ( not ( = ?auto_962454 ?auto_962459 ) ) ( not ( = ?auto_962454 ?auto_962461 ) ) ( not ( = ?auto_962454 ?auto_962462 ) ) ( not ( = ?auto_962454 ?auto_962463 ) ) ( not ( = ?auto_962454 ?auto_962464 ) ) ( not ( = ?auto_962454 ?auto_962465 ) ) ( not ( = ?auto_962454 ?auto_962466 ) ) ( not ( = ?auto_962454 ?auto_962467 ) ) ( not ( = ?auto_962458 ?auto_962460 ) ) ( not ( = ?auto_962458 ?auto_962459 ) ) ( not ( = ?auto_962458 ?auto_962461 ) ) ( not ( = ?auto_962458 ?auto_962462 ) ) ( not ( = ?auto_962458 ?auto_962463 ) ) ( not ( = ?auto_962458 ?auto_962464 ) ) ( not ( = ?auto_962458 ?auto_962465 ) ) ( not ( = ?auto_962458 ?auto_962466 ) ) ( not ( = ?auto_962458 ?auto_962467 ) ) ( not ( = ?auto_962460 ?auto_962459 ) ) ( not ( = ?auto_962460 ?auto_962461 ) ) ( not ( = ?auto_962460 ?auto_962462 ) ) ( not ( = ?auto_962460 ?auto_962463 ) ) ( not ( = ?auto_962460 ?auto_962464 ) ) ( not ( = ?auto_962460 ?auto_962465 ) ) ( not ( = ?auto_962460 ?auto_962466 ) ) ( not ( = ?auto_962460 ?auto_962467 ) ) ( not ( = ?auto_962459 ?auto_962461 ) ) ( not ( = ?auto_962459 ?auto_962462 ) ) ( not ( = ?auto_962459 ?auto_962463 ) ) ( not ( = ?auto_962459 ?auto_962464 ) ) ( not ( = ?auto_962459 ?auto_962465 ) ) ( not ( = ?auto_962459 ?auto_962466 ) ) ( not ( = ?auto_962459 ?auto_962467 ) ) ( not ( = ?auto_962461 ?auto_962462 ) ) ( not ( = ?auto_962461 ?auto_962463 ) ) ( not ( = ?auto_962461 ?auto_962464 ) ) ( not ( = ?auto_962461 ?auto_962465 ) ) ( not ( = ?auto_962461 ?auto_962466 ) ) ( not ( = ?auto_962461 ?auto_962467 ) ) ( not ( = ?auto_962462 ?auto_962463 ) ) ( not ( = ?auto_962462 ?auto_962464 ) ) ( not ( = ?auto_962462 ?auto_962465 ) ) ( not ( = ?auto_962462 ?auto_962466 ) ) ( not ( = ?auto_962462 ?auto_962467 ) ) ( not ( = ?auto_962463 ?auto_962464 ) ) ( not ( = ?auto_962463 ?auto_962465 ) ) ( not ( = ?auto_962463 ?auto_962466 ) ) ( not ( = ?auto_962463 ?auto_962467 ) ) ( not ( = ?auto_962464 ?auto_962465 ) ) ( not ( = ?auto_962464 ?auto_962466 ) ) ( not ( = ?auto_962464 ?auto_962467 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962465 ?auto_962466 ?auto_962467 )
      ( MAKE-13CRATE-VERIFY ?auto_962455 ?auto_962456 ?auto_962457 ?auto_962454 ?auto_962458 ?auto_962460 ?auto_962459 ?auto_962461 ?auto_962462 ?auto_962463 ?auto_962464 ?auto_962465 ?auto_962466 ?auto_962467 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962611 - SURFACE
      ?auto_962612 - SURFACE
      ?auto_962613 - SURFACE
      ?auto_962610 - SURFACE
      ?auto_962614 - SURFACE
      ?auto_962616 - SURFACE
      ?auto_962615 - SURFACE
      ?auto_962617 - SURFACE
      ?auto_962618 - SURFACE
      ?auto_962619 - SURFACE
      ?auto_962620 - SURFACE
      ?auto_962621 - SURFACE
      ?auto_962622 - SURFACE
      ?auto_962623 - SURFACE
    )
    :vars
    (
      ?auto_962625 - HOIST
      ?auto_962626 - PLACE
      ?auto_962627 - TRUCK
      ?auto_962624 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_962625 ?auto_962626 ) ( SURFACE-AT ?auto_962622 ?auto_962626 ) ( CLEAR ?auto_962622 ) ( IS-CRATE ?auto_962623 ) ( not ( = ?auto_962622 ?auto_962623 ) ) ( AVAILABLE ?auto_962625 ) ( IN ?auto_962623 ?auto_962627 ) ( ON ?auto_962622 ?auto_962621 ) ( not ( = ?auto_962621 ?auto_962622 ) ) ( not ( = ?auto_962621 ?auto_962623 ) ) ( TRUCK-AT ?auto_962627 ?auto_962624 ) ( not ( = ?auto_962624 ?auto_962626 ) ) ( ON ?auto_962612 ?auto_962611 ) ( ON ?auto_962613 ?auto_962612 ) ( ON ?auto_962610 ?auto_962613 ) ( ON ?auto_962614 ?auto_962610 ) ( ON ?auto_962616 ?auto_962614 ) ( ON ?auto_962615 ?auto_962616 ) ( ON ?auto_962617 ?auto_962615 ) ( ON ?auto_962618 ?auto_962617 ) ( ON ?auto_962619 ?auto_962618 ) ( ON ?auto_962620 ?auto_962619 ) ( ON ?auto_962621 ?auto_962620 ) ( not ( = ?auto_962611 ?auto_962612 ) ) ( not ( = ?auto_962611 ?auto_962613 ) ) ( not ( = ?auto_962611 ?auto_962610 ) ) ( not ( = ?auto_962611 ?auto_962614 ) ) ( not ( = ?auto_962611 ?auto_962616 ) ) ( not ( = ?auto_962611 ?auto_962615 ) ) ( not ( = ?auto_962611 ?auto_962617 ) ) ( not ( = ?auto_962611 ?auto_962618 ) ) ( not ( = ?auto_962611 ?auto_962619 ) ) ( not ( = ?auto_962611 ?auto_962620 ) ) ( not ( = ?auto_962611 ?auto_962621 ) ) ( not ( = ?auto_962611 ?auto_962622 ) ) ( not ( = ?auto_962611 ?auto_962623 ) ) ( not ( = ?auto_962612 ?auto_962613 ) ) ( not ( = ?auto_962612 ?auto_962610 ) ) ( not ( = ?auto_962612 ?auto_962614 ) ) ( not ( = ?auto_962612 ?auto_962616 ) ) ( not ( = ?auto_962612 ?auto_962615 ) ) ( not ( = ?auto_962612 ?auto_962617 ) ) ( not ( = ?auto_962612 ?auto_962618 ) ) ( not ( = ?auto_962612 ?auto_962619 ) ) ( not ( = ?auto_962612 ?auto_962620 ) ) ( not ( = ?auto_962612 ?auto_962621 ) ) ( not ( = ?auto_962612 ?auto_962622 ) ) ( not ( = ?auto_962612 ?auto_962623 ) ) ( not ( = ?auto_962613 ?auto_962610 ) ) ( not ( = ?auto_962613 ?auto_962614 ) ) ( not ( = ?auto_962613 ?auto_962616 ) ) ( not ( = ?auto_962613 ?auto_962615 ) ) ( not ( = ?auto_962613 ?auto_962617 ) ) ( not ( = ?auto_962613 ?auto_962618 ) ) ( not ( = ?auto_962613 ?auto_962619 ) ) ( not ( = ?auto_962613 ?auto_962620 ) ) ( not ( = ?auto_962613 ?auto_962621 ) ) ( not ( = ?auto_962613 ?auto_962622 ) ) ( not ( = ?auto_962613 ?auto_962623 ) ) ( not ( = ?auto_962610 ?auto_962614 ) ) ( not ( = ?auto_962610 ?auto_962616 ) ) ( not ( = ?auto_962610 ?auto_962615 ) ) ( not ( = ?auto_962610 ?auto_962617 ) ) ( not ( = ?auto_962610 ?auto_962618 ) ) ( not ( = ?auto_962610 ?auto_962619 ) ) ( not ( = ?auto_962610 ?auto_962620 ) ) ( not ( = ?auto_962610 ?auto_962621 ) ) ( not ( = ?auto_962610 ?auto_962622 ) ) ( not ( = ?auto_962610 ?auto_962623 ) ) ( not ( = ?auto_962614 ?auto_962616 ) ) ( not ( = ?auto_962614 ?auto_962615 ) ) ( not ( = ?auto_962614 ?auto_962617 ) ) ( not ( = ?auto_962614 ?auto_962618 ) ) ( not ( = ?auto_962614 ?auto_962619 ) ) ( not ( = ?auto_962614 ?auto_962620 ) ) ( not ( = ?auto_962614 ?auto_962621 ) ) ( not ( = ?auto_962614 ?auto_962622 ) ) ( not ( = ?auto_962614 ?auto_962623 ) ) ( not ( = ?auto_962616 ?auto_962615 ) ) ( not ( = ?auto_962616 ?auto_962617 ) ) ( not ( = ?auto_962616 ?auto_962618 ) ) ( not ( = ?auto_962616 ?auto_962619 ) ) ( not ( = ?auto_962616 ?auto_962620 ) ) ( not ( = ?auto_962616 ?auto_962621 ) ) ( not ( = ?auto_962616 ?auto_962622 ) ) ( not ( = ?auto_962616 ?auto_962623 ) ) ( not ( = ?auto_962615 ?auto_962617 ) ) ( not ( = ?auto_962615 ?auto_962618 ) ) ( not ( = ?auto_962615 ?auto_962619 ) ) ( not ( = ?auto_962615 ?auto_962620 ) ) ( not ( = ?auto_962615 ?auto_962621 ) ) ( not ( = ?auto_962615 ?auto_962622 ) ) ( not ( = ?auto_962615 ?auto_962623 ) ) ( not ( = ?auto_962617 ?auto_962618 ) ) ( not ( = ?auto_962617 ?auto_962619 ) ) ( not ( = ?auto_962617 ?auto_962620 ) ) ( not ( = ?auto_962617 ?auto_962621 ) ) ( not ( = ?auto_962617 ?auto_962622 ) ) ( not ( = ?auto_962617 ?auto_962623 ) ) ( not ( = ?auto_962618 ?auto_962619 ) ) ( not ( = ?auto_962618 ?auto_962620 ) ) ( not ( = ?auto_962618 ?auto_962621 ) ) ( not ( = ?auto_962618 ?auto_962622 ) ) ( not ( = ?auto_962618 ?auto_962623 ) ) ( not ( = ?auto_962619 ?auto_962620 ) ) ( not ( = ?auto_962619 ?auto_962621 ) ) ( not ( = ?auto_962619 ?auto_962622 ) ) ( not ( = ?auto_962619 ?auto_962623 ) ) ( not ( = ?auto_962620 ?auto_962621 ) ) ( not ( = ?auto_962620 ?auto_962622 ) ) ( not ( = ?auto_962620 ?auto_962623 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962621 ?auto_962622 ?auto_962623 )
      ( MAKE-13CRATE-VERIFY ?auto_962611 ?auto_962612 ?auto_962613 ?auto_962610 ?auto_962614 ?auto_962616 ?auto_962615 ?auto_962617 ?auto_962618 ?auto_962619 ?auto_962620 ?auto_962621 ?auto_962622 ?auto_962623 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962780 - SURFACE
      ?auto_962781 - SURFACE
      ?auto_962782 - SURFACE
      ?auto_962779 - SURFACE
      ?auto_962783 - SURFACE
      ?auto_962785 - SURFACE
      ?auto_962784 - SURFACE
      ?auto_962786 - SURFACE
      ?auto_962787 - SURFACE
      ?auto_962788 - SURFACE
      ?auto_962789 - SURFACE
      ?auto_962790 - SURFACE
      ?auto_962791 - SURFACE
      ?auto_962792 - SURFACE
    )
    :vars
    (
      ?auto_962796 - HOIST
      ?auto_962795 - PLACE
      ?auto_962793 - TRUCK
      ?auto_962797 - PLACE
      ?auto_962794 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_962796 ?auto_962795 ) ( SURFACE-AT ?auto_962791 ?auto_962795 ) ( CLEAR ?auto_962791 ) ( IS-CRATE ?auto_962792 ) ( not ( = ?auto_962791 ?auto_962792 ) ) ( AVAILABLE ?auto_962796 ) ( ON ?auto_962791 ?auto_962790 ) ( not ( = ?auto_962790 ?auto_962791 ) ) ( not ( = ?auto_962790 ?auto_962792 ) ) ( TRUCK-AT ?auto_962793 ?auto_962797 ) ( not ( = ?auto_962797 ?auto_962795 ) ) ( HOIST-AT ?auto_962794 ?auto_962797 ) ( LIFTING ?auto_962794 ?auto_962792 ) ( not ( = ?auto_962796 ?auto_962794 ) ) ( ON ?auto_962781 ?auto_962780 ) ( ON ?auto_962782 ?auto_962781 ) ( ON ?auto_962779 ?auto_962782 ) ( ON ?auto_962783 ?auto_962779 ) ( ON ?auto_962785 ?auto_962783 ) ( ON ?auto_962784 ?auto_962785 ) ( ON ?auto_962786 ?auto_962784 ) ( ON ?auto_962787 ?auto_962786 ) ( ON ?auto_962788 ?auto_962787 ) ( ON ?auto_962789 ?auto_962788 ) ( ON ?auto_962790 ?auto_962789 ) ( not ( = ?auto_962780 ?auto_962781 ) ) ( not ( = ?auto_962780 ?auto_962782 ) ) ( not ( = ?auto_962780 ?auto_962779 ) ) ( not ( = ?auto_962780 ?auto_962783 ) ) ( not ( = ?auto_962780 ?auto_962785 ) ) ( not ( = ?auto_962780 ?auto_962784 ) ) ( not ( = ?auto_962780 ?auto_962786 ) ) ( not ( = ?auto_962780 ?auto_962787 ) ) ( not ( = ?auto_962780 ?auto_962788 ) ) ( not ( = ?auto_962780 ?auto_962789 ) ) ( not ( = ?auto_962780 ?auto_962790 ) ) ( not ( = ?auto_962780 ?auto_962791 ) ) ( not ( = ?auto_962780 ?auto_962792 ) ) ( not ( = ?auto_962781 ?auto_962782 ) ) ( not ( = ?auto_962781 ?auto_962779 ) ) ( not ( = ?auto_962781 ?auto_962783 ) ) ( not ( = ?auto_962781 ?auto_962785 ) ) ( not ( = ?auto_962781 ?auto_962784 ) ) ( not ( = ?auto_962781 ?auto_962786 ) ) ( not ( = ?auto_962781 ?auto_962787 ) ) ( not ( = ?auto_962781 ?auto_962788 ) ) ( not ( = ?auto_962781 ?auto_962789 ) ) ( not ( = ?auto_962781 ?auto_962790 ) ) ( not ( = ?auto_962781 ?auto_962791 ) ) ( not ( = ?auto_962781 ?auto_962792 ) ) ( not ( = ?auto_962782 ?auto_962779 ) ) ( not ( = ?auto_962782 ?auto_962783 ) ) ( not ( = ?auto_962782 ?auto_962785 ) ) ( not ( = ?auto_962782 ?auto_962784 ) ) ( not ( = ?auto_962782 ?auto_962786 ) ) ( not ( = ?auto_962782 ?auto_962787 ) ) ( not ( = ?auto_962782 ?auto_962788 ) ) ( not ( = ?auto_962782 ?auto_962789 ) ) ( not ( = ?auto_962782 ?auto_962790 ) ) ( not ( = ?auto_962782 ?auto_962791 ) ) ( not ( = ?auto_962782 ?auto_962792 ) ) ( not ( = ?auto_962779 ?auto_962783 ) ) ( not ( = ?auto_962779 ?auto_962785 ) ) ( not ( = ?auto_962779 ?auto_962784 ) ) ( not ( = ?auto_962779 ?auto_962786 ) ) ( not ( = ?auto_962779 ?auto_962787 ) ) ( not ( = ?auto_962779 ?auto_962788 ) ) ( not ( = ?auto_962779 ?auto_962789 ) ) ( not ( = ?auto_962779 ?auto_962790 ) ) ( not ( = ?auto_962779 ?auto_962791 ) ) ( not ( = ?auto_962779 ?auto_962792 ) ) ( not ( = ?auto_962783 ?auto_962785 ) ) ( not ( = ?auto_962783 ?auto_962784 ) ) ( not ( = ?auto_962783 ?auto_962786 ) ) ( not ( = ?auto_962783 ?auto_962787 ) ) ( not ( = ?auto_962783 ?auto_962788 ) ) ( not ( = ?auto_962783 ?auto_962789 ) ) ( not ( = ?auto_962783 ?auto_962790 ) ) ( not ( = ?auto_962783 ?auto_962791 ) ) ( not ( = ?auto_962783 ?auto_962792 ) ) ( not ( = ?auto_962785 ?auto_962784 ) ) ( not ( = ?auto_962785 ?auto_962786 ) ) ( not ( = ?auto_962785 ?auto_962787 ) ) ( not ( = ?auto_962785 ?auto_962788 ) ) ( not ( = ?auto_962785 ?auto_962789 ) ) ( not ( = ?auto_962785 ?auto_962790 ) ) ( not ( = ?auto_962785 ?auto_962791 ) ) ( not ( = ?auto_962785 ?auto_962792 ) ) ( not ( = ?auto_962784 ?auto_962786 ) ) ( not ( = ?auto_962784 ?auto_962787 ) ) ( not ( = ?auto_962784 ?auto_962788 ) ) ( not ( = ?auto_962784 ?auto_962789 ) ) ( not ( = ?auto_962784 ?auto_962790 ) ) ( not ( = ?auto_962784 ?auto_962791 ) ) ( not ( = ?auto_962784 ?auto_962792 ) ) ( not ( = ?auto_962786 ?auto_962787 ) ) ( not ( = ?auto_962786 ?auto_962788 ) ) ( not ( = ?auto_962786 ?auto_962789 ) ) ( not ( = ?auto_962786 ?auto_962790 ) ) ( not ( = ?auto_962786 ?auto_962791 ) ) ( not ( = ?auto_962786 ?auto_962792 ) ) ( not ( = ?auto_962787 ?auto_962788 ) ) ( not ( = ?auto_962787 ?auto_962789 ) ) ( not ( = ?auto_962787 ?auto_962790 ) ) ( not ( = ?auto_962787 ?auto_962791 ) ) ( not ( = ?auto_962787 ?auto_962792 ) ) ( not ( = ?auto_962788 ?auto_962789 ) ) ( not ( = ?auto_962788 ?auto_962790 ) ) ( not ( = ?auto_962788 ?auto_962791 ) ) ( not ( = ?auto_962788 ?auto_962792 ) ) ( not ( = ?auto_962789 ?auto_962790 ) ) ( not ( = ?auto_962789 ?auto_962791 ) ) ( not ( = ?auto_962789 ?auto_962792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962790 ?auto_962791 ?auto_962792 )
      ( MAKE-13CRATE-VERIFY ?auto_962780 ?auto_962781 ?auto_962782 ?auto_962779 ?auto_962783 ?auto_962785 ?auto_962784 ?auto_962786 ?auto_962787 ?auto_962788 ?auto_962789 ?auto_962790 ?auto_962791 ?auto_962792 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_962962 - SURFACE
      ?auto_962963 - SURFACE
      ?auto_962964 - SURFACE
      ?auto_962961 - SURFACE
      ?auto_962965 - SURFACE
      ?auto_962967 - SURFACE
      ?auto_962966 - SURFACE
      ?auto_962968 - SURFACE
      ?auto_962969 - SURFACE
      ?auto_962970 - SURFACE
      ?auto_962971 - SURFACE
      ?auto_962972 - SURFACE
      ?auto_962973 - SURFACE
      ?auto_962974 - SURFACE
    )
    :vars
    (
      ?auto_962978 - HOIST
      ?auto_962976 - PLACE
      ?auto_962980 - TRUCK
      ?auto_962979 - PLACE
      ?auto_962977 - HOIST
      ?auto_962975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_962978 ?auto_962976 ) ( SURFACE-AT ?auto_962973 ?auto_962976 ) ( CLEAR ?auto_962973 ) ( IS-CRATE ?auto_962974 ) ( not ( = ?auto_962973 ?auto_962974 ) ) ( AVAILABLE ?auto_962978 ) ( ON ?auto_962973 ?auto_962972 ) ( not ( = ?auto_962972 ?auto_962973 ) ) ( not ( = ?auto_962972 ?auto_962974 ) ) ( TRUCK-AT ?auto_962980 ?auto_962979 ) ( not ( = ?auto_962979 ?auto_962976 ) ) ( HOIST-AT ?auto_962977 ?auto_962979 ) ( not ( = ?auto_962978 ?auto_962977 ) ) ( AVAILABLE ?auto_962977 ) ( SURFACE-AT ?auto_962974 ?auto_962979 ) ( ON ?auto_962974 ?auto_962975 ) ( CLEAR ?auto_962974 ) ( not ( = ?auto_962973 ?auto_962975 ) ) ( not ( = ?auto_962974 ?auto_962975 ) ) ( not ( = ?auto_962972 ?auto_962975 ) ) ( ON ?auto_962963 ?auto_962962 ) ( ON ?auto_962964 ?auto_962963 ) ( ON ?auto_962961 ?auto_962964 ) ( ON ?auto_962965 ?auto_962961 ) ( ON ?auto_962967 ?auto_962965 ) ( ON ?auto_962966 ?auto_962967 ) ( ON ?auto_962968 ?auto_962966 ) ( ON ?auto_962969 ?auto_962968 ) ( ON ?auto_962970 ?auto_962969 ) ( ON ?auto_962971 ?auto_962970 ) ( ON ?auto_962972 ?auto_962971 ) ( not ( = ?auto_962962 ?auto_962963 ) ) ( not ( = ?auto_962962 ?auto_962964 ) ) ( not ( = ?auto_962962 ?auto_962961 ) ) ( not ( = ?auto_962962 ?auto_962965 ) ) ( not ( = ?auto_962962 ?auto_962967 ) ) ( not ( = ?auto_962962 ?auto_962966 ) ) ( not ( = ?auto_962962 ?auto_962968 ) ) ( not ( = ?auto_962962 ?auto_962969 ) ) ( not ( = ?auto_962962 ?auto_962970 ) ) ( not ( = ?auto_962962 ?auto_962971 ) ) ( not ( = ?auto_962962 ?auto_962972 ) ) ( not ( = ?auto_962962 ?auto_962973 ) ) ( not ( = ?auto_962962 ?auto_962974 ) ) ( not ( = ?auto_962962 ?auto_962975 ) ) ( not ( = ?auto_962963 ?auto_962964 ) ) ( not ( = ?auto_962963 ?auto_962961 ) ) ( not ( = ?auto_962963 ?auto_962965 ) ) ( not ( = ?auto_962963 ?auto_962967 ) ) ( not ( = ?auto_962963 ?auto_962966 ) ) ( not ( = ?auto_962963 ?auto_962968 ) ) ( not ( = ?auto_962963 ?auto_962969 ) ) ( not ( = ?auto_962963 ?auto_962970 ) ) ( not ( = ?auto_962963 ?auto_962971 ) ) ( not ( = ?auto_962963 ?auto_962972 ) ) ( not ( = ?auto_962963 ?auto_962973 ) ) ( not ( = ?auto_962963 ?auto_962974 ) ) ( not ( = ?auto_962963 ?auto_962975 ) ) ( not ( = ?auto_962964 ?auto_962961 ) ) ( not ( = ?auto_962964 ?auto_962965 ) ) ( not ( = ?auto_962964 ?auto_962967 ) ) ( not ( = ?auto_962964 ?auto_962966 ) ) ( not ( = ?auto_962964 ?auto_962968 ) ) ( not ( = ?auto_962964 ?auto_962969 ) ) ( not ( = ?auto_962964 ?auto_962970 ) ) ( not ( = ?auto_962964 ?auto_962971 ) ) ( not ( = ?auto_962964 ?auto_962972 ) ) ( not ( = ?auto_962964 ?auto_962973 ) ) ( not ( = ?auto_962964 ?auto_962974 ) ) ( not ( = ?auto_962964 ?auto_962975 ) ) ( not ( = ?auto_962961 ?auto_962965 ) ) ( not ( = ?auto_962961 ?auto_962967 ) ) ( not ( = ?auto_962961 ?auto_962966 ) ) ( not ( = ?auto_962961 ?auto_962968 ) ) ( not ( = ?auto_962961 ?auto_962969 ) ) ( not ( = ?auto_962961 ?auto_962970 ) ) ( not ( = ?auto_962961 ?auto_962971 ) ) ( not ( = ?auto_962961 ?auto_962972 ) ) ( not ( = ?auto_962961 ?auto_962973 ) ) ( not ( = ?auto_962961 ?auto_962974 ) ) ( not ( = ?auto_962961 ?auto_962975 ) ) ( not ( = ?auto_962965 ?auto_962967 ) ) ( not ( = ?auto_962965 ?auto_962966 ) ) ( not ( = ?auto_962965 ?auto_962968 ) ) ( not ( = ?auto_962965 ?auto_962969 ) ) ( not ( = ?auto_962965 ?auto_962970 ) ) ( not ( = ?auto_962965 ?auto_962971 ) ) ( not ( = ?auto_962965 ?auto_962972 ) ) ( not ( = ?auto_962965 ?auto_962973 ) ) ( not ( = ?auto_962965 ?auto_962974 ) ) ( not ( = ?auto_962965 ?auto_962975 ) ) ( not ( = ?auto_962967 ?auto_962966 ) ) ( not ( = ?auto_962967 ?auto_962968 ) ) ( not ( = ?auto_962967 ?auto_962969 ) ) ( not ( = ?auto_962967 ?auto_962970 ) ) ( not ( = ?auto_962967 ?auto_962971 ) ) ( not ( = ?auto_962967 ?auto_962972 ) ) ( not ( = ?auto_962967 ?auto_962973 ) ) ( not ( = ?auto_962967 ?auto_962974 ) ) ( not ( = ?auto_962967 ?auto_962975 ) ) ( not ( = ?auto_962966 ?auto_962968 ) ) ( not ( = ?auto_962966 ?auto_962969 ) ) ( not ( = ?auto_962966 ?auto_962970 ) ) ( not ( = ?auto_962966 ?auto_962971 ) ) ( not ( = ?auto_962966 ?auto_962972 ) ) ( not ( = ?auto_962966 ?auto_962973 ) ) ( not ( = ?auto_962966 ?auto_962974 ) ) ( not ( = ?auto_962966 ?auto_962975 ) ) ( not ( = ?auto_962968 ?auto_962969 ) ) ( not ( = ?auto_962968 ?auto_962970 ) ) ( not ( = ?auto_962968 ?auto_962971 ) ) ( not ( = ?auto_962968 ?auto_962972 ) ) ( not ( = ?auto_962968 ?auto_962973 ) ) ( not ( = ?auto_962968 ?auto_962974 ) ) ( not ( = ?auto_962968 ?auto_962975 ) ) ( not ( = ?auto_962969 ?auto_962970 ) ) ( not ( = ?auto_962969 ?auto_962971 ) ) ( not ( = ?auto_962969 ?auto_962972 ) ) ( not ( = ?auto_962969 ?auto_962973 ) ) ( not ( = ?auto_962969 ?auto_962974 ) ) ( not ( = ?auto_962969 ?auto_962975 ) ) ( not ( = ?auto_962970 ?auto_962971 ) ) ( not ( = ?auto_962970 ?auto_962972 ) ) ( not ( = ?auto_962970 ?auto_962973 ) ) ( not ( = ?auto_962970 ?auto_962974 ) ) ( not ( = ?auto_962970 ?auto_962975 ) ) ( not ( = ?auto_962971 ?auto_962972 ) ) ( not ( = ?auto_962971 ?auto_962973 ) ) ( not ( = ?auto_962971 ?auto_962974 ) ) ( not ( = ?auto_962971 ?auto_962975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_962972 ?auto_962973 ?auto_962974 )
      ( MAKE-13CRATE-VERIFY ?auto_962962 ?auto_962963 ?auto_962964 ?auto_962961 ?auto_962965 ?auto_962967 ?auto_962966 ?auto_962968 ?auto_962969 ?auto_962970 ?auto_962971 ?auto_962972 ?auto_962973 ?auto_962974 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_963145 - SURFACE
      ?auto_963146 - SURFACE
      ?auto_963147 - SURFACE
      ?auto_963144 - SURFACE
      ?auto_963148 - SURFACE
      ?auto_963150 - SURFACE
      ?auto_963149 - SURFACE
      ?auto_963151 - SURFACE
      ?auto_963152 - SURFACE
      ?auto_963153 - SURFACE
      ?auto_963154 - SURFACE
      ?auto_963155 - SURFACE
      ?auto_963156 - SURFACE
      ?auto_963157 - SURFACE
    )
    :vars
    (
      ?auto_963159 - HOIST
      ?auto_963161 - PLACE
      ?auto_963160 - PLACE
      ?auto_963158 - HOIST
      ?auto_963163 - SURFACE
      ?auto_963162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963159 ?auto_963161 ) ( SURFACE-AT ?auto_963156 ?auto_963161 ) ( CLEAR ?auto_963156 ) ( IS-CRATE ?auto_963157 ) ( not ( = ?auto_963156 ?auto_963157 ) ) ( AVAILABLE ?auto_963159 ) ( ON ?auto_963156 ?auto_963155 ) ( not ( = ?auto_963155 ?auto_963156 ) ) ( not ( = ?auto_963155 ?auto_963157 ) ) ( not ( = ?auto_963160 ?auto_963161 ) ) ( HOIST-AT ?auto_963158 ?auto_963160 ) ( not ( = ?auto_963159 ?auto_963158 ) ) ( AVAILABLE ?auto_963158 ) ( SURFACE-AT ?auto_963157 ?auto_963160 ) ( ON ?auto_963157 ?auto_963163 ) ( CLEAR ?auto_963157 ) ( not ( = ?auto_963156 ?auto_963163 ) ) ( not ( = ?auto_963157 ?auto_963163 ) ) ( not ( = ?auto_963155 ?auto_963163 ) ) ( TRUCK-AT ?auto_963162 ?auto_963161 ) ( ON ?auto_963146 ?auto_963145 ) ( ON ?auto_963147 ?auto_963146 ) ( ON ?auto_963144 ?auto_963147 ) ( ON ?auto_963148 ?auto_963144 ) ( ON ?auto_963150 ?auto_963148 ) ( ON ?auto_963149 ?auto_963150 ) ( ON ?auto_963151 ?auto_963149 ) ( ON ?auto_963152 ?auto_963151 ) ( ON ?auto_963153 ?auto_963152 ) ( ON ?auto_963154 ?auto_963153 ) ( ON ?auto_963155 ?auto_963154 ) ( not ( = ?auto_963145 ?auto_963146 ) ) ( not ( = ?auto_963145 ?auto_963147 ) ) ( not ( = ?auto_963145 ?auto_963144 ) ) ( not ( = ?auto_963145 ?auto_963148 ) ) ( not ( = ?auto_963145 ?auto_963150 ) ) ( not ( = ?auto_963145 ?auto_963149 ) ) ( not ( = ?auto_963145 ?auto_963151 ) ) ( not ( = ?auto_963145 ?auto_963152 ) ) ( not ( = ?auto_963145 ?auto_963153 ) ) ( not ( = ?auto_963145 ?auto_963154 ) ) ( not ( = ?auto_963145 ?auto_963155 ) ) ( not ( = ?auto_963145 ?auto_963156 ) ) ( not ( = ?auto_963145 ?auto_963157 ) ) ( not ( = ?auto_963145 ?auto_963163 ) ) ( not ( = ?auto_963146 ?auto_963147 ) ) ( not ( = ?auto_963146 ?auto_963144 ) ) ( not ( = ?auto_963146 ?auto_963148 ) ) ( not ( = ?auto_963146 ?auto_963150 ) ) ( not ( = ?auto_963146 ?auto_963149 ) ) ( not ( = ?auto_963146 ?auto_963151 ) ) ( not ( = ?auto_963146 ?auto_963152 ) ) ( not ( = ?auto_963146 ?auto_963153 ) ) ( not ( = ?auto_963146 ?auto_963154 ) ) ( not ( = ?auto_963146 ?auto_963155 ) ) ( not ( = ?auto_963146 ?auto_963156 ) ) ( not ( = ?auto_963146 ?auto_963157 ) ) ( not ( = ?auto_963146 ?auto_963163 ) ) ( not ( = ?auto_963147 ?auto_963144 ) ) ( not ( = ?auto_963147 ?auto_963148 ) ) ( not ( = ?auto_963147 ?auto_963150 ) ) ( not ( = ?auto_963147 ?auto_963149 ) ) ( not ( = ?auto_963147 ?auto_963151 ) ) ( not ( = ?auto_963147 ?auto_963152 ) ) ( not ( = ?auto_963147 ?auto_963153 ) ) ( not ( = ?auto_963147 ?auto_963154 ) ) ( not ( = ?auto_963147 ?auto_963155 ) ) ( not ( = ?auto_963147 ?auto_963156 ) ) ( not ( = ?auto_963147 ?auto_963157 ) ) ( not ( = ?auto_963147 ?auto_963163 ) ) ( not ( = ?auto_963144 ?auto_963148 ) ) ( not ( = ?auto_963144 ?auto_963150 ) ) ( not ( = ?auto_963144 ?auto_963149 ) ) ( not ( = ?auto_963144 ?auto_963151 ) ) ( not ( = ?auto_963144 ?auto_963152 ) ) ( not ( = ?auto_963144 ?auto_963153 ) ) ( not ( = ?auto_963144 ?auto_963154 ) ) ( not ( = ?auto_963144 ?auto_963155 ) ) ( not ( = ?auto_963144 ?auto_963156 ) ) ( not ( = ?auto_963144 ?auto_963157 ) ) ( not ( = ?auto_963144 ?auto_963163 ) ) ( not ( = ?auto_963148 ?auto_963150 ) ) ( not ( = ?auto_963148 ?auto_963149 ) ) ( not ( = ?auto_963148 ?auto_963151 ) ) ( not ( = ?auto_963148 ?auto_963152 ) ) ( not ( = ?auto_963148 ?auto_963153 ) ) ( not ( = ?auto_963148 ?auto_963154 ) ) ( not ( = ?auto_963148 ?auto_963155 ) ) ( not ( = ?auto_963148 ?auto_963156 ) ) ( not ( = ?auto_963148 ?auto_963157 ) ) ( not ( = ?auto_963148 ?auto_963163 ) ) ( not ( = ?auto_963150 ?auto_963149 ) ) ( not ( = ?auto_963150 ?auto_963151 ) ) ( not ( = ?auto_963150 ?auto_963152 ) ) ( not ( = ?auto_963150 ?auto_963153 ) ) ( not ( = ?auto_963150 ?auto_963154 ) ) ( not ( = ?auto_963150 ?auto_963155 ) ) ( not ( = ?auto_963150 ?auto_963156 ) ) ( not ( = ?auto_963150 ?auto_963157 ) ) ( not ( = ?auto_963150 ?auto_963163 ) ) ( not ( = ?auto_963149 ?auto_963151 ) ) ( not ( = ?auto_963149 ?auto_963152 ) ) ( not ( = ?auto_963149 ?auto_963153 ) ) ( not ( = ?auto_963149 ?auto_963154 ) ) ( not ( = ?auto_963149 ?auto_963155 ) ) ( not ( = ?auto_963149 ?auto_963156 ) ) ( not ( = ?auto_963149 ?auto_963157 ) ) ( not ( = ?auto_963149 ?auto_963163 ) ) ( not ( = ?auto_963151 ?auto_963152 ) ) ( not ( = ?auto_963151 ?auto_963153 ) ) ( not ( = ?auto_963151 ?auto_963154 ) ) ( not ( = ?auto_963151 ?auto_963155 ) ) ( not ( = ?auto_963151 ?auto_963156 ) ) ( not ( = ?auto_963151 ?auto_963157 ) ) ( not ( = ?auto_963151 ?auto_963163 ) ) ( not ( = ?auto_963152 ?auto_963153 ) ) ( not ( = ?auto_963152 ?auto_963154 ) ) ( not ( = ?auto_963152 ?auto_963155 ) ) ( not ( = ?auto_963152 ?auto_963156 ) ) ( not ( = ?auto_963152 ?auto_963157 ) ) ( not ( = ?auto_963152 ?auto_963163 ) ) ( not ( = ?auto_963153 ?auto_963154 ) ) ( not ( = ?auto_963153 ?auto_963155 ) ) ( not ( = ?auto_963153 ?auto_963156 ) ) ( not ( = ?auto_963153 ?auto_963157 ) ) ( not ( = ?auto_963153 ?auto_963163 ) ) ( not ( = ?auto_963154 ?auto_963155 ) ) ( not ( = ?auto_963154 ?auto_963156 ) ) ( not ( = ?auto_963154 ?auto_963157 ) ) ( not ( = ?auto_963154 ?auto_963163 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963155 ?auto_963156 ?auto_963157 )
      ( MAKE-13CRATE-VERIFY ?auto_963145 ?auto_963146 ?auto_963147 ?auto_963144 ?auto_963148 ?auto_963150 ?auto_963149 ?auto_963151 ?auto_963152 ?auto_963153 ?auto_963154 ?auto_963155 ?auto_963156 ?auto_963157 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_963328 - SURFACE
      ?auto_963329 - SURFACE
      ?auto_963330 - SURFACE
      ?auto_963327 - SURFACE
      ?auto_963331 - SURFACE
      ?auto_963333 - SURFACE
      ?auto_963332 - SURFACE
      ?auto_963334 - SURFACE
      ?auto_963335 - SURFACE
      ?auto_963336 - SURFACE
      ?auto_963337 - SURFACE
      ?auto_963338 - SURFACE
      ?auto_963339 - SURFACE
      ?auto_963340 - SURFACE
    )
    :vars
    (
      ?auto_963342 - HOIST
      ?auto_963346 - PLACE
      ?auto_963344 - PLACE
      ?auto_963341 - HOIST
      ?auto_963345 - SURFACE
      ?auto_963343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963342 ?auto_963346 ) ( IS-CRATE ?auto_963340 ) ( not ( = ?auto_963339 ?auto_963340 ) ) ( not ( = ?auto_963338 ?auto_963339 ) ) ( not ( = ?auto_963338 ?auto_963340 ) ) ( not ( = ?auto_963344 ?auto_963346 ) ) ( HOIST-AT ?auto_963341 ?auto_963344 ) ( not ( = ?auto_963342 ?auto_963341 ) ) ( AVAILABLE ?auto_963341 ) ( SURFACE-AT ?auto_963340 ?auto_963344 ) ( ON ?auto_963340 ?auto_963345 ) ( CLEAR ?auto_963340 ) ( not ( = ?auto_963339 ?auto_963345 ) ) ( not ( = ?auto_963340 ?auto_963345 ) ) ( not ( = ?auto_963338 ?auto_963345 ) ) ( TRUCK-AT ?auto_963343 ?auto_963346 ) ( SURFACE-AT ?auto_963338 ?auto_963346 ) ( CLEAR ?auto_963338 ) ( LIFTING ?auto_963342 ?auto_963339 ) ( IS-CRATE ?auto_963339 ) ( ON ?auto_963329 ?auto_963328 ) ( ON ?auto_963330 ?auto_963329 ) ( ON ?auto_963327 ?auto_963330 ) ( ON ?auto_963331 ?auto_963327 ) ( ON ?auto_963333 ?auto_963331 ) ( ON ?auto_963332 ?auto_963333 ) ( ON ?auto_963334 ?auto_963332 ) ( ON ?auto_963335 ?auto_963334 ) ( ON ?auto_963336 ?auto_963335 ) ( ON ?auto_963337 ?auto_963336 ) ( ON ?auto_963338 ?auto_963337 ) ( not ( = ?auto_963328 ?auto_963329 ) ) ( not ( = ?auto_963328 ?auto_963330 ) ) ( not ( = ?auto_963328 ?auto_963327 ) ) ( not ( = ?auto_963328 ?auto_963331 ) ) ( not ( = ?auto_963328 ?auto_963333 ) ) ( not ( = ?auto_963328 ?auto_963332 ) ) ( not ( = ?auto_963328 ?auto_963334 ) ) ( not ( = ?auto_963328 ?auto_963335 ) ) ( not ( = ?auto_963328 ?auto_963336 ) ) ( not ( = ?auto_963328 ?auto_963337 ) ) ( not ( = ?auto_963328 ?auto_963338 ) ) ( not ( = ?auto_963328 ?auto_963339 ) ) ( not ( = ?auto_963328 ?auto_963340 ) ) ( not ( = ?auto_963328 ?auto_963345 ) ) ( not ( = ?auto_963329 ?auto_963330 ) ) ( not ( = ?auto_963329 ?auto_963327 ) ) ( not ( = ?auto_963329 ?auto_963331 ) ) ( not ( = ?auto_963329 ?auto_963333 ) ) ( not ( = ?auto_963329 ?auto_963332 ) ) ( not ( = ?auto_963329 ?auto_963334 ) ) ( not ( = ?auto_963329 ?auto_963335 ) ) ( not ( = ?auto_963329 ?auto_963336 ) ) ( not ( = ?auto_963329 ?auto_963337 ) ) ( not ( = ?auto_963329 ?auto_963338 ) ) ( not ( = ?auto_963329 ?auto_963339 ) ) ( not ( = ?auto_963329 ?auto_963340 ) ) ( not ( = ?auto_963329 ?auto_963345 ) ) ( not ( = ?auto_963330 ?auto_963327 ) ) ( not ( = ?auto_963330 ?auto_963331 ) ) ( not ( = ?auto_963330 ?auto_963333 ) ) ( not ( = ?auto_963330 ?auto_963332 ) ) ( not ( = ?auto_963330 ?auto_963334 ) ) ( not ( = ?auto_963330 ?auto_963335 ) ) ( not ( = ?auto_963330 ?auto_963336 ) ) ( not ( = ?auto_963330 ?auto_963337 ) ) ( not ( = ?auto_963330 ?auto_963338 ) ) ( not ( = ?auto_963330 ?auto_963339 ) ) ( not ( = ?auto_963330 ?auto_963340 ) ) ( not ( = ?auto_963330 ?auto_963345 ) ) ( not ( = ?auto_963327 ?auto_963331 ) ) ( not ( = ?auto_963327 ?auto_963333 ) ) ( not ( = ?auto_963327 ?auto_963332 ) ) ( not ( = ?auto_963327 ?auto_963334 ) ) ( not ( = ?auto_963327 ?auto_963335 ) ) ( not ( = ?auto_963327 ?auto_963336 ) ) ( not ( = ?auto_963327 ?auto_963337 ) ) ( not ( = ?auto_963327 ?auto_963338 ) ) ( not ( = ?auto_963327 ?auto_963339 ) ) ( not ( = ?auto_963327 ?auto_963340 ) ) ( not ( = ?auto_963327 ?auto_963345 ) ) ( not ( = ?auto_963331 ?auto_963333 ) ) ( not ( = ?auto_963331 ?auto_963332 ) ) ( not ( = ?auto_963331 ?auto_963334 ) ) ( not ( = ?auto_963331 ?auto_963335 ) ) ( not ( = ?auto_963331 ?auto_963336 ) ) ( not ( = ?auto_963331 ?auto_963337 ) ) ( not ( = ?auto_963331 ?auto_963338 ) ) ( not ( = ?auto_963331 ?auto_963339 ) ) ( not ( = ?auto_963331 ?auto_963340 ) ) ( not ( = ?auto_963331 ?auto_963345 ) ) ( not ( = ?auto_963333 ?auto_963332 ) ) ( not ( = ?auto_963333 ?auto_963334 ) ) ( not ( = ?auto_963333 ?auto_963335 ) ) ( not ( = ?auto_963333 ?auto_963336 ) ) ( not ( = ?auto_963333 ?auto_963337 ) ) ( not ( = ?auto_963333 ?auto_963338 ) ) ( not ( = ?auto_963333 ?auto_963339 ) ) ( not ( = ?auto_963333 ?auto_963340 ) ) ( not ( = ?auto_963333 ?auto_963345 ) ) ( not ( = ?auto_963332 ?auto_963334 ) ) ( not ( = ?auto_963332 ?auto_963335 ) ) ( not ( = ?auto_963332 ?auto_963336 ) ) ( not ( = ?auto_963332 ?auto_963337 ) ) ( not ( = ?auto_963332 ?auto_963338 ) ) ( not ( = ?auto_963332 ?auto_963339 ) ) ( not ( = ?auto_963332 ?auto_963340 ) ) ( not ( = ?auto_963332 ?auto_963345 ) ) ( not ( = ?auto_963334 ?auto_963335 ) ) ( not ( = ?auto_963334 ?auto_963336 ) ) ( not ( = ?auto_963334 ?auto_963337 ) ) ( not ( = ?auto_963334 ?auto_963338 ) ) ( not ( = ?auto_963334 ?auto_963339 ) ) ( not ( = ?auto_963334 ?auto_963340 ) ) ( not ( = ?auto_963334 ?auto_963345 ) ) ( not ( = ?auto_963335 ?auto_963336 ) ) ( not ( = ?auto_963335 ?auto_963337 ) ) ( not ( = ?auto_963335 ?auto_963338 ) ) ( not ( = ?auto_963335 ?auto_963339 ) ) ( not ( = ?auto_963335 ?auto_963340 ) ) ( not ( = ?auto_963335 ?auto_963345 ) ) ( not ( = ?auto_963336 ?auto_963337 ) ) ( not ( = ?auto_963336 ?auto_963338 ) ) ( not ( = ?auto_963336 ?auto_963339 ) ) ( not ( = ?auto_963336 ?auto_963340 ) ) ( not ( = ?auto_963336 ?auto_963345 ) ) ( not ( = ?auto_963337 ?auto_963338 ) ) ( not ( = ?auto_963337 ?auto_963339 ) ) ( not ( = ?auto_963337 ?auto_963340 ) ) ( not ( = ?auto_963337 ?auto_963345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963338 ?auto_963339 ?auto_963340 )
      ( MAKE-13CRATE-VERIFY ?auto_963328 ?auto_963329 ?auto_963330 ?auto_963327 ?auto_963331 ?auto_963333 ?auto_963332 ?auto_963334 ?auto_963335 ?auto_963336 ?auto_963337 ?auto_963338 ?auto_963339 ?auto_963340 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_963511 - SURFACE
      ?auto_963512 - SURFACE
      ?auto_963513 - SURFACE
      ?auto_963510 - SURFACE
      ?auto_963514 - SURFACE
      ?auto_963516 - SURFACE
      ?auto_963515 - SURFACE
      ?auto_963517 - SURFACE
      ?auto_963518 - SURFACE
      ?auto_963519 - SURFACE
      ?auto_963520 - SURFACE
      ?auto_963521 - SURFACE
      ?auto_963522 - SURFACE
      ?auto_963523 - SURFACE
    )
    :vars
    (
      ?auto_963528 - HOIST
      ?auto_963529 - PLACE
      ?auto_963524 - PLACE
      ?auto_963525 - HOIST
      ?auto_963527 - SURFACE
      ?auto_963526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963528 ?auto_963529 ) ( IS-CRATE ?auto_963523 ) ( not ( = ?auto_963522 ?auto_963523 ) ) ( not ( = ?auto_963521 ?auto_963522 ) ) ( not ( = ?auto_963521 ?auto_963523 ) ) ( not ( = ?auto_963524 ?auto_963529 ) ) ( HOIST-AT ?auto_963525 ?auto_963524 ) ( not ( = ?auto_963528 ?auto_963525 ) ) ( AVAILABLE ?auto_963525 ) ( SURFACE-AT ?auto_963523 ?auto_963524 ) ( ON ?auto_963523 ?auto_963527 ) ( CLEAR ?auto_963523 ) ( not ( = ?auto_963522 ?auto_963527 ) ) ( not ( = ?auto_963523 ?auto_963527 ) ) ( not ( = ?auto_963521 ?auto_963527 ) ) ( TRUCK-AT ?auto_963526 ?auto_963529 ) ( SURFACE-AT ?auto_963521 ?auto_963529 ) ( CLEAR ?auto_963521 ) ( IS-CRATE ?auto_963522 ) ( AVAILABLE ?auto_963528 ) ( IN ?auto_963522 ?auto_963526 ) ( ON ?auto_963512 ?auto_963511 ) ( ON ?auto_963513 ?auto_963512 ) ( ON ?auto_963510 ?auto_963513 ) ( ON ?auto_963514 ?auto_963510 ) ( ON ?auto_963516 ?auto_963514 ) ( ON ?auto_963515 ?auto_963516 ) ( ON ?auto_963517 ?auto_963515 ) ( ON ?auto_963518 ?auto_963517 ) ( ON ?auto_963519 ?auto_963518 ) ( ON ?auto_963520 ?auto_963519 ) ( ON ?auto_963521 ?auto_963520 ) ( not ( = ?auto_963511 ?auto_963512 ) ) ( not ( = ?auto_963511 ?auto_963513 ) ) ( not ( = ?auto_963511 ?auto_963510 ) ) ( not ( = ?auto_963511 ?auto_963514 ) ) ( not ( = ?auto_963511 ?auto_963516 ) ) ( not ( = ?auto_963511 ?auto_963515 ) ) ( not ( = ?auto_963511 ?auto_963517 ) ) ( not ( = ?auto_963511 ?auto_963518 ) ) ( not ( = ?auto_963511 ?auto_963519 ) ) ( not ( = ?auto_963511 ?auto_963520 ) ) ( not ( = ?auto_963511 ?auto_963521 ) ) ( not ( = ?auto_963511 ?auto_963522 ) ) ( not ( = ?auto_963511 ?auto_963523 ) ) ( not ( = ?auto_963511 ?auto_963527 ) ) ( not ( = ?auto_963512 ?auto_963513 ) ) ( not ( = ?auto_963512 ?auto_963510 ) ) ( not ( = ?auto_963512 ?auto_963514 ) ) ( not ( = ?auto_963512 ?auto_963516 ) ) ( not ( = ?auto_963512 ?auto_963515 ) ) ( not ( = ?auto_963512 ?auto_963517 ) ) ( not ( = ?auto_963512 ?auto_963518 ) ) ( not ( = ?auto_963512 ?auto_963519 ) ) ( not ( = ?auto_963512 ?auto_963520 ) ) ( not ( = ?auto_963512 ?auto_963521 ) ) ( not ( = ?auto_963512 ?auto_963522 ) ) ( not ( = ?auto_963512 ?auto_963523 ) ) ( not ( = ?auto_963512 ?auto_963527 ) ) ( not ( = ?auto_963513 ?auto_963510 ) ) ( not ( = ?auto_963513 ?auto_963514 ) ) ( not ( = ?auto_963513 ?auto_963516 ) ) ( not ( = ?auto_963513 ?auto_963515 ) ) ( not ( = ?auto_963513 ?auto_963517 ) ) ( not ( = ?auto_963513 ?auto_963518 ) ) ( not ( = ?auto_963513 ?auto_963519 ) ) ( not ( = ?auto_963513 ?auto_963520 ) ) ( not ( = ?auto_963513 ?auto_963521 ) ) ( not ( = ?auto_963513 ?auto_963522 ) ) ( not ( = ?auto_963513 ?auto_963523 ) ) ( not ( = ?auto_963513 ?auto_963527 ) ) ( not ( = ?auto_963510 ?auto_963514 ) ) ( not ( = ?auto_963510 ?auto_963516 ) ) ( not ( = ?auto_963510 ?auto_963515 ) ) ( not ( = ?auto_963510 ?auto_963517 ) ) ( not ( = ?auto_963510 ?auto_963518 ) ) ( not ( = ?auto_963510 ?auto_963519 ) ) ( not ( = ?auto_963510 ?auto_963520 ) ) ( not ( = ?auto_963510 ?auto_963521 ) ) ( not ( = ?auto_963510 ?auto_963522 ) ) ( not ( = ?auto_963510 ?auto_963523 ) ) ( not ( = ?auto_963510 ?auto_963527 ) ) ( not ( = ?auto_963514 ?auto_963516 ) ) ( not ( = ?auto_963514 ?auto_963515 ) ) ( not ( = ?auto_963514 ?auto_963517 ) ) ( not ( = ?auto_963514 ?auto_963518 ) ) ( not ( = ?auto_963514 ?auto_963519 ) ) ( not ( = ?auto_963514 ?auto_963520 ) ) ( not ( = ?auto_963514 ?auto_963521 ) ) ( not ( = ?auto_963514 ?auto_963522 ) ) ( not ( = ?auto_963514 ?auto_963523 ) ) ( not ( = ?auto_963514 ?auto_963527 ) ) ( not ( = ?auto_963516 ?auto_963515 ) ) ( not ( = ?auto_963516 ?auto_963517 ) ) ( not ( = ?auto_963516 ?auto_963518 ) ) ( not ( = ?auto_963516 ?auto_963519 ) ) ( not ( = ?auto_963516 ?auto_963520 ) ) ( not ( = ?auto_963516 ?auto_963521 ) ) ( not ( = ?auto_963516 ?auto_963522 ) ) ( not ( = ?auto_963516 ?auto_963523 ) ) ( not ( = ?auto_963516 ?auto_963527 ) ) ( not ( = ?auto_963515 ?auto_963517 ) ) ( not ( = ?auto_963515 ?auto_963518 ) ) ( not ( = ?auto_963515 ?auto_963519 ) ) ( not ( = ?auto_963515 ?auto_963520 ) ) ( not ( = ?auto_963515 ?auto_963521 ) ) ( not ( = ?auto_963515 ?auto_963522 ) ) ( not ( = ?auto_963515 ?auto_963523 ) ) ( not ( = ?auto_963515 ?auto_963527 ) ) ( not ( = ?auto_963517 ?auto_963518 ) ) ( not ( = ?auto_963517 ?auto_963519 ) ) ( not ( = ?auto_963517 ?auto_963520 ) ) ( not ( = ?auto_963517 ?auto_963521 ) ) ( not ( = ?auto_963517 ?auto_963522 ) ) ( not ( = ?auto_963517 ?auto_963523 ) ) ( not ( = ?auto_963517 ?auto_963527 ) ) ( not ( = ?auto_963518 ?auto_963519 ) ) ( not ( = ?auto_963518 ?auto_963520 ) ) ( not ( = ?auto_963518 ?auto_963521 ) ) ( not ( = ?auto_963518 ?auto_963522 ) ) ( not ( = ?auto_963518 ?auto_963523 ) ) ( not ( = ?auto_963518 ?auto_963527 ) ) ( not ( = ?auto_963519 ?auto_963520 ) ) ( not ( = ?auto_963519 ?auto_963521 ) ) ( not ( = ?auto_963519 ?auto_963522 ) ) ( not ( = ?auto_963519 ?auto_963523 ) ) ( not ( = ?auto_963519 ?auto_963527 ) ) ( not ( = ?auto_963520 ?auto_963521 ) ) ( not ( = ?auto_963520 ?auto_963522 ) ) ( not ( = ?auto_963520 ?auto_963523 ) ) ( not ( = ?auto_963520 ?auto_963527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963521 ?auto_963522 ?auto_963523 )
      ( MAKE-13CRATE-VERIFY ?auto_963511 ?auto_963512 ?auto_963513 ?auto_963510 ?auto_963514 ?auto_963516 ?auto_963515 ?auto_963517 ?auto_963518 ?auto_963519 ?auto_963520 ?auto_963521 ?auto_963522 ?auto_963523 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_963530 - SURFACE
      ?auto_963531 - SURFACE
    )
    :vars
    (
      ?auto_963537 - HOIST
      ?auto_963538 - PLACE
      ?auto_963532 - SURFACE
      ?auto_963533 - PLACE
      ?auto_963534 - HOIST
      ?auto_963536 - SURFACE
      ?auto_963535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963537 ?auto_963538 ) ( IS-CRATE ?auto_963531 ) ( not ( = ?auto_963530 ?auto_963531 ) ) ( not ( = ?auto_963532 ?auto_963530 ) ) ( not ( = ?auto_963532 ?auto_963531 ) ) ( not ( = ?auto_963533 ?auto_963538 ) ) ( HOIST-AT ?auto_963534 ?auto_963533 ) ( not ( = ?auto_963537 ?auto_963534 ) ) ( AVAILABLE ?auto_963534 ) ( SURFACE-AT ?auto_963531 ?auto_963533 ) ( ON ?auto_963531 ?auto_963536 ) ( CLEAR ?auto_963531 ) ( not ( = ?auto_963530 ?auto_963536 ) ) ( not ( = ?auto_963531 ?auto_963536 ) ) ( not ( = ?auto_963532 ?auto_963536 ) ) ( SURFACE-AT ?auto_963532 ?auto_963538 ) ( CLEAR ?auto_963532 ) ( IS-CRATE ?auto_963530 ) ( AVAILABLE ?auto_963537 ) ( IN ?auto_963530 ?auto_963535 ) ( TRUCK-AT ?auto_963535 ?auto_963533 ) )
    :subtasks
    ( ( !DRIVE ?auto_963535 ?auto_963533 ?auto_963538 )
      ( MAKE-2CRATE ?auto_963532 ?auto_963530 ?auto_963531 )
      ( MAKE-1CRATE-VERIFY ?auto_963530 ?auto_963531 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_963539 - SURFACE
      ?auto_963540 - SURFACE
      ?auto_963541 - SURFACE
    )
    :vars
    (
      ?auto_963544 - HOIST
      ?auto_963543 - PLACE
      ?auto_963545 - PLACE
      ?auto_963542 - HOIST
      ?auto_963547 - SURFACE
      ?auto_963546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963544 ?auto_963543 ) ( IS-CRATE ?auto_963541 ) ( not ( = ?auto_963540 ?auto_963541 ) ) ( not ( = ?auto_963539 ?auto_963540 ) ) ( not ( = ?auto_963539 ?auto_963541 ) ) ( not ( = ?auto_963545 ?auto_963543 ) ) ( HOIST-AT ?auto_963542 ?auto_963545 ) ( not ( = ?auto_963544 ?auto_963542 ) ) ( AVAILABLE ?auto_963542 ) ( SURFACE-AT ?auto_963541 ?auto_963545 ) ( ON ?auto_963541 ?auto_963547 ) ( CLEAR ?auto_963541 ) ( not ( = ?auto_963540 ?auto_963547 ) ) ( not ( = ?auto_963541 ?auto_963547 ) ) ( not ( = ?auto_963539 ?auto_963547 ) ) ( SURFACE-AT ?auto_963539 ?auto_963543 ) ( CLEAR ?auto_963539 ) ( IS-CRATE ?auto_963540 ) ( AVAILABLE ?auto_963544 ) ( IN ?auto_963540 ?auto_963546 ) ( TRUCK-AT ?auto_963546 ?auto_963545 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_963540 ?auto_963541 )
      ( MAKE-2CRATE-VERIFY ?auto_963539 ?auto_963540 ?auto_963541 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_963549 - SURFACE
      ?auto_963550 - SURFACE
      ?auto_963551 - SURFACE
      ?auto_963548 - SURFACE
    )
    :vars
    (
      ?auto_963552 - HOIST
      ?auto_963554 - PLACE
      ?auto_963555 - PLACE
      ?auto_963557 - HOIST
      ?auto_963556 - SURFACE
      ?auto_963553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963552 ?auto_963554 ) ( IS-CRATE ?auto_963548 ) ( not ( = ?auto_963551 ?auto_963548 ) ) ( not ( = ?auto_963550 ?auto_963551 ) ) ( not ( = ?auto_963550 ?auto_963548 ) ) ( not ( = ?auto_963555 ?auto_963554 ) ) ( HOIST-AT ?auto_963557 ?auto_963555 ) ( not ( = ?auto_963552 ?auto_963557 ) ) ( AVAILABLE ?auto_963557 ) ( SURFACE-AT ?auto_963548 ?auto_963555 ) ( ON ?auto_963548 ?auto_963556 ) ( CLEAR ?auto_963548 ) ( not ( = ?auto_963551 ?auto_963556 ) ) ( not ( = ?auto_963548 ?auto_963556 ) ) ( not ( = ?auto_963550 ?auto_963556 ) ) ( SURFACE-AT ?auto_963550 ?auto_963554 ) ( CLEAR ?auto_963550 ) ( IS-CRATE ?auto_963551 ) ( AVAILABLE ?auto_963552 ) ( IN ?auto_963551 ?auto_963553 ) ( TRUCK-AT ?auto_963553 ?auto_963555 ) ( ON ?auto_963550 ?auto_963549 ) ( not ( = ?auto_963549 ?auto_963550 ) ) ( not ( = ?auto_963549 ?auto_963551 ) ) ( not ( = ?auto_963549 ?auto_963548 ) ) ( not ( = ?auto_963549 ?auto_963556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963550 ?auto_963551 ?auto_963548 )
      ( MAKE-3CRATE-VERIFY ?auto_963549 ?auto_963550 ?auto_963551 ?auto_963548 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_963559 - SURFACE
      ?auto_963560 - SURFACE
      ?auto_963561 - SURFACE
      ?auto_963558 - SURFACE
      ?auto_963562 - SURFACE
    )
    :vars
    (
      ?auto_963563 - HOIST
      ?auto_963565 - PLACE
      ?auto_963566 - PLACE
      ?auto_963568 - HOIST
      ?auto_963567 - SURFACE
      ?auto_963564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963563 ?auto_963565 ) ( IS-CRATE ?auto_963562 ) ( not ( = ?auto_963558 ?auto_963562 ) ) ( not ( = ?auto_963561 ?auto_963558 ) ) ( not ( = ?auto_963561 ?auto_963562 ) ) ( not ( = ?auto_963566 ?auto_963565 ) ) ( HOIST-AT ?auto_963568 ?auto_963566 ) ( not ( = ?auto_963563 ?auto_963568 ) ) ( AVAILABLE ?auto_963568 ) ( SURFACE-AT ?auto_963562 ?auto_963566 ) ( ON ?auto_963562 ?auto_963567 ) ( CLEAR ?auto_963562 ) ( not ( = ?auto_963558 ?auto_963567 ) ) ( not ( = ?auto_963562 ?auto_963567 ) ) ( not ( = ?auto_963561 ?auto_963567 ) ) ( SURFACE-AT ?auto_963561 ?auto_963565 ) ( CLEAR ?auto_963561 ) ( IS-CRATE ?auto_963558 ) ( AVAILABLE ?auto_963563 ) ( IN ?auto_963558 ?auto_963564 ) ( TRUCK-AT ?auto_963564 ?auto_963566 ) ( ON ?auto_963560 ?auto_963559 ) ( ON ?auto_963561 ?auto_963560 ) ( not ( = ?auto_963559 ?auto_963560 ) ) ( not ( = ?auto_963559 ?auto_963561 ) ) ( not ( = ?auto_963559 ?auto_963558 ) ) ( not ( = ?auto_963559 ?auto_963562 ) ) ( not ( = ?auto_963559 ?auto_963567 ) ) ( not ( = ?auto_963560 ?auto_963561 ) ) ( not ( = ?auto_963560 ?auto_963558 ) ) ( not ( = ?auto_963560 ?auto_963562 ) ) ( not ( = ?auto_963560 ?auto_963567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963561 ?auto_963558 ?auto_963562 )
      ( MAKE-4CRATE-VERIFY ?auto_963559 ?auto_963560 ?auto_963561 ?auto_963558 ?auto_963562 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_963570 - SURFACE
      ?auto_963571 - SURFACE
      ?auto_963572 - SURFACE
      ?auto_963569 - SURFACE
      ?auto_963573 - SURFACE
      ?auto_963574 - SURFACE
    )
    :vars
    (
      ?auto_963575 - HOIST
      ?auto_963577 - PLACE
      ?auto_963578 - PLACE
      ?auto_963580 - HOIST
      ?auto_963579 - SURFACE
      ?auto_963576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963575 ?auto_963577 ) ( IS-CRATE ?auto_963574 ) ( not ( = ?auto_963573 ?auto_963574 ) ) ( not ( = ?auto_963569 ?auto_963573 ) ) ( not ( = ?auto_963569 ?auto_963574 ) ) ( not ( = ?auto_963578 ?auto_963577 ) ) ( HOIST-AT ?auto_963580 ?auto_963578 ) ( not ( = ?auto_963575 ?auto_963580 ) ) ( AVAILABLE ?auto_963580 ) ( SURFACE-AT ?auto_963574 ?auto_963578 ) ( ON ?auto_963574 ?auto_963579 ) ( CLEAR ?auto_963574 ) ( not ( = ?auto_963573 ?auto_963579 ) ) ( not ( = ?auto_963574 ?auto_963579 ) ) ( not ( = ?auto_963569 ?auto_963579 ) ) ( SURFACE-AT ?auto_963569 ?auto_963577 ) ( CLEAR ?auto_963569 ) ( IS-CRATE ?auto_963573 ) ( AVAILABLE ?auto_963575 ) ( IN ?auto_963573 ?auto_963576 ) ( TRUCK-AT ?auto_963576 ?auto_963578 ) ( ON ?auto_963571 ?auto_963570 ) ( ON ?auto_963572 ?auto_963571 ) ( ON ?auto_963569 ?auto_963572 ) ( not ( = ?auto_963570 ?auto_963571 ) ) ( not ( = ?auto_963570 ?auto_963572 ) ) ( not ( = ?auto_963570 ?auto_963569 ) ) ( not ( = ?auto_963570 ?auto_963573 ) ) ( not ( = ?auto_963570 ?auto_963574 ) ) ( not ( = ?auto_963570 ?auto_963579 ) ) ( not ( = ?auto_963571 ?auto_963572 ) ) ( not ( = ?auto_963571 ?auto_963569 ) ) ( not ( = ?auto_963571 ?auto_963573 ) ) ( not ( = ?auto_963571 ?auto_963574 ) ) ( not ( = ?auto_963571 ?auto_963579 ) ) ( not ( = ?auto_963572 ?auto_963569 ) ) ( not ( = ?auto_963572 ?auto_963573 ) ) ( not ( = ?auto_963572 ?auto_963574 ) ) ( not ( = ?auto_963572 ?auto_963579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963569 ?auto_963573 ?auto_963574 )
      ( MAKE-5CRATE-VERIFY ?auto_963570 ?auto_963571 ?auto_963572 ?auto_963569 ?auto_963573 ?auto_963574 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_963582 - SURFACE
      ?auto_963583 - SURFACE
      ?auto_963584 - SURFACE
      ?auto_963581 - SURFACE
      ?auto_963585 - SURFACE
      ?auto_963587 - SURFACE
      ?auto_963586 - SURFACE
    )
    :vars
    (
      ?auto_963588 - HOIST
      ?auto_963590 - PLACE
      ?auto_963591 - PLACE
      ?auto_963593 - HOIST
      ?auto_963592 - SURFACE
      ?auto_963589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963588 ?auto_963590 ) ( IS-CRATE ?auto_963586 ) ( not ( = ?auto_963587 ?auto_963586 ) ) ( not ( = ?auto_963585 ?auto_963587 ) ) ( not ( = ?auto_963585 ?auto_963586 ) ) ( not ( = ?auto_963591 ?auto_963590 ) ) ( HOIST-AT ?auto_963593 ?auto_963591 ) ( not ( = ?auto_963588 ?auto_963593 ) ) ( AVAILABLE ?auto_963593 ) ( SURFACE-AT ?auto_963586 ?auto_963591 ) ( ON ?auto_963586 ?auto_963592 ) ( CLEAR ?auto_963586 ) ( not ( = ?auto_963587 ?auto_963592 ) ) ( not ( = ?auto_963586 ?auto_963592 ) ) ( not ( = ?auto_963585 ?auto_963592 ) ) ( SURFACE-AT ?auto_963585 ?auto_963590 ) ( CLEAR ?auto_963585 ) ( IS-CRATE ?auto_963587 ) ( AVAILABLE ?auto_963588 ) ( IN ?auto_963587 ?auto_963589 ) ( TRUCK-AT ?auto_963589 ?auto_963591 ) ( ON ?auto_963583 ?auto_963582 ) ( ON ?auto_963584 ?auto_963583 ) ( ON ?auto_963581 ?auto_963584 ) ( ON ?auto_963585 ?auto_963581 ) ( not ( = ?auto_963582 ?auto_963583 ) ) ( not ( = ?auto_963582 ?auto_963584 ) ) ( not ( = ?auto_963582 ?auto_963581 ) ) ( not ( = ?auto_963582 ?auto_963585 ) ) ( not ( = ?auto_963582 ?auto_963587 ) ) ( not ( = ?auto_963582 ?auto_963586 ) ) ( not ( = ?auto_963582 ?auto_963592 ) ) ( not ( = ?auto_963583 ?auto_963584 ) ) ( not ( = ?auto_963583 ?auto_963581 ) ) ( not ( = ?auto_963583 ?auto_963585 ) ) ( not ( = ?auto_963583 ?auto_963587 ) ) ( not ( = ?auto_963583 ?auto_963586 ) ) ( not ( = ?auto_963583 ?auto_963592 ) ) ( not ( = ?auto_963584 ?auto_963581 ) ) ( not ( = ?auto_963584 ?auto_963585 ) ) ( not ( = ?auto_963584 ?auto_963587 ) ) ( not ( = ?auto_963584 ?auto_963586 ) ) ( not ( = ?auto_963584 ?auto_963592 ) ) ( not ( = ?auto_963581 ?auto_963585 ) ) ( not ( = ?auto_963581 ?auto_963587 ) ) ( not ( = ?auto_963581 ?auto_963586 ) ) ( not ( = ?auto_963581 ?auto_963592 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963585 ?auto_963587 ?auto_963586 )
      ( MAKE-6CRATE-VERIFY ?auto_963582 ?auto_963583 ?auto_963584 ?auto_963581 ?auto_963585 ?auto_963587 ?auto_963586 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_963595 - SURFACE
      ?auto_963596 - SURFACE
      ?auto_963597 - SURFACE
      ?auto_963594 - SURFACE
      ?auto_963598 - SURFACE
      ?auto_963600 - SURFACE
      ?auto_963599 - SURFACE
      ?auto_963601 - SURFACE
    )
    :vars
    (
      ?auto_963602 - HOIST
      ?auto_963604 - PLACE
      ?auto_963605 - PLACE
      ?auto_963607 - HOIST
      ?auto_963606 - SURFACE
      ?auto_963603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963602 ?auto_963604 ) ( IS-CRATE ?auto_963601 ) ( not ( = ?auto_963599 ?auto_963601 ) ) ( not ( = ?auto_963600 ?auto_963599 ) ) ( not ( = ?auto_963600 ?auto_963601 ) ) ( not ( = ?auto_963605 ?auto_963604 ) ) ( HOIST-AT ?auto_963607 ?auto_963605 ) ( not ( = ?auto_963602 ?auto_963607 ) ) ( AVAILABLE ?auto_963607 ) ( SURFACE-AT ?auto_963601 ?auto_963605 ) ( ON ?auto_963601 ?auto_963606 ) ( CLEAR ?auto_963601 ) ( not ( = ?auto_963599 ?auto_963606 ) ) ( not ( = ?auto_963601 ?auto_963606 ) ) ( not ( = ?auto_963600 ?auto_963606 ) ) ( SURFACE-AT ?auto_963600 ?auto_963604 ) ( CLEAR ?auto_963600 ) ( IS-CRATE ?auto_963599 ) ( AVAILABLE ?auto_963602 ) ( IN ?auto_963599 ?auto_963603 ) ( TRUCK-AT ?auto_963603 ?auto_963605 ) ( ON ?auto_963596 ?auto_963595 ) ( ON ?auto_963597 ?auto_963596 ) ( ON ?auto_963594 ?auto_963597 ) ( ON ?auto_963598 ?auto_963594 ) ( ON ?auto_963600 ?auto_963598 ) ( not ( = ?auto_963595 ?auto_963596 ) ) ( not ( = ?auto_963595 ?auto_963597 ) ) ( not ( = ?auto_963595 ?auto_963594 ) ) ( not ( = ?auto_963595 ?auto_963598 ) ) ( not ( = ?auto_963595 ?auto_963600 ) ) ( not ( = ?auto_963595 ?auto_963599 ) ) ( not ( = ?auto_963595 ?auto_963601 ) ) ( not ( = ?auto_963595 ?auto_963606 ) ) ( not ( = ?auto_963596 ?auto_963597 ) ) ( not ( = ?auto_963596 ?auto_963594 ) ) ( not ( = ?auto_963596 ?auto_963598 ) ) ( not ( = ?auto_963596 ?auto_963600 ) ) ( not ( = ?auto_963596 ?auto_963599 ) ) ( not ( = ?auto_963596 ?auto_963601 ) ) ( not ( = ?auto_963596 ?auto_963606 ) ) ( not ( = ?auto_963597 ?auto_963594 ) ) ( not ( = ?auto_963597 ?auto_963598 ) ) ( not ( = ?auto_963597 ?auto_963600 ) ) ( not ( = ?auto_963597 ?auto_963599 ) ) ( not ( = ?auto_963597 ?auto_963601 ) ) ( not ( = ?auto_963597 ?auto_963606 ) ) ( not ( = ?auto_963594 ?auto_963598 ) ) ( not ( = ?auto_963594 ?auto_963600 ) ) ( not ( = ?auto_963594 ?auto_963599 ) ) ( not ( = ?auto_963594 ?auto_963601 ) ) ( not ( = ?auto_963594 ?auto_963606 ) ) ( not ( = ?auto_963598 ?auto_963600 ) ) ( not ( = ?auto_963598 ?auto_963599 ) ) ( not ( = ?auto_963598 ?auto_963601 ) ) ( not ( = ?auto_963598 ?auto_963606 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963600 ?auto_963599 ?auto_963601 )
      ( MAKE-7CRATE-VERIFY ?auto_963595 ?auto_963596 ?auto_963597 ?auto_963594 ?auto_963598 ?auto_963600 ?auto_963599 ?auto_963601 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_963609 - SURFACE
      ?auto_963610 - SURFACE
      ?auto_963611 - SURFACE
      ?auto_963608 - SURFACE
      ?auto_963612 - SURFACE
      ?auto_963614 - SURFACE
      ?auto_963613 - SURFACE
      ?auto_963615 - SURFACE
      ?auto_963616 - SURFACE
    )
    :vars
    (
      ?auto_963617 - HOIST
      ?auto_963619 - PLACE
      ?auto_963620 - PLACE
      ?auto_963622 - HOIST
      ?auto_963621 - SURFACE
      ?auto_963618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963617 ?auto_963619 ) ( IS-CRATE ?auto_963616 ) ( not ( = ?auto_963615 ?auto_963616 ) ) ( not ( = ?auto_963613 ?auto_963615 ) ) ( not ( = ?auto_963613 ?auto_963616 ) ) ( not ( = ?auto_963620 ?auto_963619 ) ) ( HOIST-AT ?auto_963622 ?auto_963620 ) ( not ( = ?auto_963617 ?auto_963622 ) ) ( AVAILABLE ?auto_963622 ) ( SURFACE-AT ?auto_963616 ?auto_963620 ) ( ON ?auto_963616 ?auto_963621 ) ( CLEAR ?auto_963616 ) ( not ( = ?auto_963615 ?auto_963621 ) ) ( not ( = ?auto_963616 ?auto_963621 ) ) ( not ( = ?auto_963613 ?auto_963621 ) ) ( SURFACE-AT ?auto_963613 ?auto_963619 ) ( CLEAR ?auto_963613 ) ( IS-CRATE ?auto_963615 ) ( AVAILABLE ?auto_963617 ) ( IN ?auto_963615 ?auto_963618 ) ( TRUCK-AT ?auto_963618 ?auto_963620 ) ( ON ?auto_963610 ?auto_963609 ) ( ON ?auto_963611 ?auto_963610 ) ( ON ?auto_963608 ?auto_963611 ) ( ON ?auto_963612 ?auto_963608 ) ( ON ?auto_963614 ?auto_963612 ) ( ON ?auto_963613 ?auto_963614 ) ( not ( = ?auto_963609 ?auto_963610 ) ) ( not ( = ?auto_963609 ?auto_963611 ) ) ( not ( = ?auto_963609 ?auto_963608 ) ) ( not ( = ?auto_963609 ?auto_963612 ) ) ( not ( = ?auto_963609 ?auto_963614 ) ) ( not ( = ?auto_963609 ?auto_963613 ) ) ( not ( = ?auto_963609 ?auto_963615 ) ) ( not ( = ?auto_963609 ?auto_963616 ) ) ( not ( = ?auto_963609 ?auto_963621 ) ) ( not ( = ?auto_963610 ?auto_963611 ) ) ( not ( = ?auto_963610 ?auto_963608 ) ) ( not ( = ?auto_963610 ?auto_963612 ) ) ( not ( = ?auto_963610 ?auto_963614 ) ) ( not ( = ?auto_963610 ?auto_963613 ) ) ( not ( = ?auto_963610 ?auto_963615 ) ) ( not ( = ?auto_963610 ?auto_963616 ) ) ( not ( = ?auto_963610 ?auto_963621 ) ) ( not ( = ?auto_963611 ?auto_963608 ) ) ( not ( = ?auto_963611 ?auto_963612 ) ) ( not ( = ?auto_963611 ?auto_963614 ) ) ( not ( = ?auto_963611 ?auto_963613 ) ) ( not ( = ?auto_963611 ?auto_963615 ) ) ( not ( = ?auto_963611 ?auto_963616 ) ) ( not ( = ?auto_963611 ?auto_963621 ) ) ( not ( = ?auto_963608 ?auto_963612 ) ) ( not ( = ?auto_963608 ?auto_963614 ) ) ( not ( = ?auto_963608 ?auto_963613 ) ) ( not ( = ?auto_963608 ?auto_963615 ) ) ( not ( = ?auto_963608 ?auto_963616 ) ) ( not ( = ?auto_963608 ?auto_963621 ) ) ( not ( = ?auto_963612 ?auto_963614 ) ) ( not ( = ?auto_963612 ?auto_963613 ) ) ( not ( = ?auto_963612 ?auto_963615 ) ) ( not ( = ?auto_963612 ?auto_963616 ) ) ( not ( = ?auto_963612 ?auto_963621 ) ) ( not ( = ?auto_963614 ?auto_963613 ) ) ( not ( = ?auto_963614 ?auto_963615 ) ) ( not ( = ?auto_963614 ?auto_963616 ) ) ( not ( = ?auto_963614 ?auto_963621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963613 ?auto_963615 ?auto_963616 )
      ( MAKE-8CRATE-VERIFY ?auto_963609 ?auto_963610 ?auto_963611 ?auto_963608 ?auto_963612 ?auto_963614 ?auto_963613 ?auto_963615 ?auto_963616 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_963624 - SURFACE
      ?auto_963625 - SURFACE
      ?auto_963626 - SURFACE
      ?auto_963623 - SURFACE
      ?auto_963627 - SURFACE
      ?auto_963629 - SURFACE
      ?auto_963628 - SURFACE
      ?auto_963630 - SURFACE
      ?auto_963631 - SURFACE
      ?auto_963632 - SURFACE
    )
    :vars
    (
      ?auto_963633 - HOIST
      ?auto_963635 - PLACE
      ?auto_963636 - PLACE
      ?auto_963638 - HOIST
      ?auto_963637 - SURFACE
      ?auto_963634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963633 ?auto_963635 ) ( IS-CRATE ?auto_963632 ) ( not ( = ?auto_963631 ?auto_963632 ) ) ( not ( = ?auto_963630 ?auto_963631 ) ) ( not ( = ?auto_963630 ?auto_963632 ) ) ( not ( = ?auto_963636 ?auto_963635 ) ) ( HOIST-AT ?auto_963638 ?auto_963636 ) ( not ( = ?auto_963633 ?auto_963638 ) ) ( AVAILABLE ?auto_963638 ) ( SURFACE-AT ?auto_963632 ?auto_963636 ) ( ON ?auto_963632 ?auto_963637 ) ( CLEAR ?auto_963632 ) ( not ( = ?auto_963631 ?auto_963637 ) ) ( not ( = ?auto_963632 ?auto_963637 ) ) ( not ( = ?auto_963630 ?auto_963637 ) ) ( SURFACE-AT ?auto_963630 ?auto_963635 ) ( CLEAR ?auto_963630 ) ( IS-CRATE ?auto_963631 ) ( AVAILABLE ?auto_963633 ) ( IN ?auto_963631 ?auto_963634 ) ( TRUCK-AT ?auto_963634 ?auto_963636 ) ( ON ?auto_963625 ?auto_963624 ) ( ON ?auto_963626 ?auto_963625 ) ( ON ?auto_963623 ?auto_963626 ) ( ON ?auto_963627 ?auto_963623 ) ( ON ?auto_963629 ?auto_963627 ) ( ON ?auto_963628 ?auto_963629 ) ( ON ?auto_963630 ?auto_963628 ) ( not ( = ?auto_963624 ?auto_963625 ) ) ( not ( = ?auto_963624 ?auto_963626 ) ) ( not ( = ?auto_963624 ?auto_963623 ) ) ( not ( = ?auto_963624 ?auto_963627 ) ) ( not ( = ?auto_963624 ?auto_963629 ) ) ( not ( = ?auto_963624 ?auto_963628 ) ) ( not ( = ?auto_963624 ?auto_963630 ) ) ( not ( = ?auto_963624 ?auto_963631 ) ) ( not ( = ?auto_963624 ?auto_963632 ) ) ( not ( = ?auto_963624 ?auto_963637 ) ) ( not ( = ?auto_963625 ?auto_963626 ) ) ( not ( = ?auto_963625 ?auto_963623 ) ) ( not ( = ?auto_963625 ?auto_963627 ) ) ( not ( = ?auto_963625 ?auto_963629 ) ) ( not ( = ?auto_963625 ?auto_963628 ) ) ( not ( = ?auto_963625 ?auto_963630 ) ) ( not ( = ?auto_963625 ?auto_963631 ) ) ( not ( = ?auto_963625 ?auto_963632 ) ) ( not ( = ?auto_963625 ?auto_963637 ) ) ( not ( = ?auto_963626 ?auto_963623 ) ) ( not ( = ?auto_963626 ?auto_963627 ) ) ( not ( = ?auto_963626 ?auto_963629 ) ) ( not ( = ?auto_963626 ?auto_963628 ) ) ( not ( = ?auto_963626 ?auto_963630 ) ) ( not ( = ?auto_963626 ?auto_963631 ) ) ( not ( = ?auto_963626 ?auto_963632 ) ) ( not ( = ?auto_963626 ?auto_963637 ) ) ( not ( = ?auto_963623 ?auto_963627 ) ) ( not ( = ?auto_963623 ?auto_963629 ) ) ( not ( = ?auto_963623 ?auto_963628 ) ) ( not ( = ?auto_963623 ?auto_963630 ) ) ( not ( = ?auto_963623 ?auto_963631 ) ) ( not ( = ?auto_963623 ?auto_963632 ) ) ( not ( = ?auto_963623 ?auto_963637 ) ) ( not ( = ?auto_963627 ?auto_963629 ) ) ( not ( = ?auto_963627 ?auto_963628 ) ) ( not ( = ?auto_963627 ?auto_963630 ) ) ( not ( = ?auto_963627 ?auto_963631 ) ) ( not ( = ?auto_963627 ?auto_963632 ) ) ( not ( = ?auto_963627 ?auto_963637 ) ) ( not ( = ?auto_963629 ?auto_963628 ) ) ( not ( = ?auto_963629 ?auto_963630 ) ) ( not ( = ?auto_963629 ?auto_963631 ) ) ( not ( = ?auto_963629 ?auto_963632 ) ) ( not ( = ?auto_963629 ?auto_963637 ) ) ( not ( = ?auto_963628 ?auto_963630 ) ) ( not ( = ?auto_963628 ?auto_963631 ) ) ( not ( = ?auto_963628 ?auto_963632 ) ) ( not ( = ?auto_963628 ?auto_963637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963630 ?auto_963631 ?auto_963632 )
      ( MAKE-9CRATE-VERIFY ?auto_963624 ?auto_963625 ?auto_963626 ?auto_963623 ?auto_963627 ?auto_963629 ?auto_963628 ?auto_963630 ?auto_963631 ?auto_963632 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_963640 - SURFACE
      ?auto_963641 - SURFACE
      ?auto_963642 - SURFACE
      ?auto_963639 - SURFACE
      ?auto_963643 - SURFACE
      ?auto_963645 - SURFACE
      ?auto_963644 - SURFACE
      ?auto_963646 - SURFACE
      ?auto_963647 - SURFACE
      ?auto_963648 - SURFACE
      ?auto_963649 - SURFACE
    )
    :vars
    (
      ?auto_963650 - HOIST
      ?auto_963652 - PLACE
      ?auto_963653 - PLACE
      ?auto_963655 - HOIST
      ?auto_963654 - SURFACE
      ?auto_963651 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963650 ?auto_963652 ) ( IS-CRATE ?auto_963649 ) ( not ( = ?auto_963648 ?auto_963649 ) ) ( not ( = ?auto_963647 ?auto_963648 ) ) ( not ( = ?auto_963647 ?auto_963649 ) ) ( not ( = ?auto_963653 ?auto_963652 ) ) ( HOIST-AT ?auto_963655 ?auto_963653 ) ( not ( = ?auto_963650 ?auto_963655 ) ) ( AVAILABLE ?auto_963655 ) ( SURFACE-AT ?auto_963649 ?auto_963653 ) ( ON ?auto_963649 ?auto_963654 ) ( CLEAR ?auto_963649 ) ( not ( = ?auto_963648 ?auto_963654 ) ) ( not ( = ?auto_963649 ?auto_963654 ) ) ( not ( = ?auto_963647 ?auto_963654 ) ) ( SURFACE-AT ?auto_963647 ?auto_963652 ) ( CLEAR ?auto_963647 ) ( IS-CRATE ?auto_963648 ) ( AVAILABLE ?auto_963650 ) ( IN ?auto_963648 ?auto_963651 ) ( TRUCK-AT ?auto_963651 ?auto_963653 ) ( ON ?auto_963641 ?auto_963640 ) ( ON ?auto_963642 ?auto_963641 ) ( ON ?auto_963639 ?auto_963642 ) ( ON ?auto_963643 ?auto_963639 ) ( ON ?auto_963645 ?auto_963643 ) ( ON ?auto_963644 ?auto_963645 ) ( ON ?auto_963646 ?auto_963644 ) ( ON ?auto_963647 ?auto_963646 ) ( not ( = ?auto_963640 ?auto_963641 ) ) ( not ( = ?auto_963640 ?auto_963642 ) ) ( not ( = ?auto_963640 ?auto_963639 ) ) ( not ( = ?auto_963640 ?auto_963643 ) ) ( not ( = ?auto_963640 ?auto_963645 ) ) ( not ( = ?auto_963640 ?auto_963644 ) ) ( not ( = ?auto_963640 ?auto_963646 ) ) ( not ( = ?auto_963640 ?auto_963647 ) ) ( not ( = ?auto_963640 ?auto_963648 ) ) ( not ( = ?auto_963640 ?auto_963649 ) ) ( not ( = ?auto_963640 ?auto_963654 ) ) ( not ( = ?auto_963641 ?auto_963642 ) ) ( not ( = ?auto_963641 ?auto_963639 ) ) ( not ( = ?auto_963641 ?auto_963643 ) ) ( not ( = ?auto_963641 ?auto_963645 ) ) ( not ( = ?auto_963641 ?auto_963644 ) ) ( not ( = ?auto_963641 ?auto_963646 ) ) ( not ( = ?auto_963641 ?auto_963647 ) ) ( not ( = ?auto_963641 ?auto_963648 ) ) ( not ( = ?auto_963641 ?auto_963649 ) ) ( not ( = ?auto_963641 ?auto_963654 ) ) ( not ( = ?auto_963642 ?auto_963639 ) ) ( not ( = ?auto_963642 ?auto_963643 ) ) ( not ( = ?auto_963642 ?auto_963645 ) ) ( not ( = ?auto_963642 ?auto_963644 ) ) ( not ( = ?auto_963642 ?auto_963646 ) ) ( not ( = ?auto_963642 ?auto_963647 ) ) ( not ( = ?auto_963642 ?auto_963648 ) ) ( not ( = ?auto_963642 ?auto_963649 ) ) ( not ( = ?auto_963642 ?auto_963654 ) ) ( not ( = ?auto_963639 ?auto_963643 ) ) ( not ( = ?auto_963639 ?auto_963645 ) ) ( not ( = ?auto_963639 ?auto_963644 ) ) ( not ( = ?auto_963639 ?auto_963646 ) ) ( not ( = ?auto_963639 ?auto_963647 ) ) ( not ( = ?auto_963639 ?auto_963648 ) ) ( not ( = ?auto_963639 ?auto_963649 ) ) ( not ( = ?auto_963639 ?auto_963654 ) ) ( not ( = ?auto_963643 ?auto_963645 ) ) ( not ( = ?auto_963643 ?auto_963644 ) ) ( not ( = ?auto_963643 ?auto_963646 ) ) ( not ( = ?auto_963643 ?auto_963647 ) ) ( not ( = ?auto_963643 ?auto_963648 ) ) ( not ( = ?auto_963643 ?auto_963649 ) ) ( not ( = ?auto_963643 ?auto_963654 ) ) ( not ( = ?auto_963645 ?auto_963644 ) ) ( not ( = ?auto_963645 ?auto_963646 ) ) ( not ( = ?auto_963645 ?auto_963647 ) ) ( not ( = ?auto_963645 ?auto_963648 ) ) ( not ( = ?auto_963645 ?auto_963649 ) ) ( not ( = ?auto_963645 ?auto_963654 ) ) ( not ( = ?auto_963644 ?auto_963646 ) ) ( not ( = ?auto_963644 ?auto_963647 ) ) ( not ( = ?auto_963644 ?auto_963648 ) ) ( not ( = ?auto_963644 ?auto_963649 ) ) ( not ( = ?auto_963644 ?auto_963654 ) ) ( not ( = ?auto_963646 ?auto_963647 ) ) ( not ( = ?auto_963646 ?auto_963648 ) ) ( not ( = ?auto_963646 ?auto_963649 ) ) ( not ( = ?auto_963646 ?auto_963654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963647 ?auto_963648 ?auto_963649 )
      ( MAKE-10CRATE-VERIFY ?auto_963640 ?auto_963641 ?auto_963642 ?auto_963639 ?auto_963643 ?auto_963645 ?auto_963644 ?auto_963646 ?auto_963647 ?auto_963648 ?auto_963649 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_963657 - SURFACE
      ?auto_963658 - SURFACE
      ?auto_963659 - SURFACE
      ?auto_963656 - SURFACE
      ?auto_963660 - SURFACE
      ?auto_963662 - SURFACE
      ?auto_963661 - SURFACE
      ?auto_963663 - SURFACE
      ?auto_963664 - SURFACE
      ?auto_963665 - SURFACE
      ?auto_963666 - SURFACE
      ?auto_963667 - SURFACE
    )
    :vars
    (
      ?auto_963668 - HOIST
      ?auto_963670 - PLACE
      ?auto_963671 - PLACE
      ?auto_963673 - HOIST
      ?auto_963672 - SURFACE
      ?auto_963669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963668 ?auto_963670 ) ( IS-CRATE ?auto_963667 ) ( not ( = ?auto_963666 ?auto_963667 ) ) ( not ( = ?auto_963665 ?auto_963666 ) ) ( not ( = ?auto_963665 ?auto_963667 ) ) ( not ( = ?auto_963671 ?auto_963670 ) ) ( HOIST-AT ?auto_963673 ?auto_963671 ) ( not ( = ?auto_963668 ?auto_963673 ) ) ( AVAILABLE ?auto_963673 ) ( SURFACE-AT ?auto_963667 ?auto_963671 ) ( ON ?auto_963667 ?auto_963672 ) ( CLEAR ?auto_963667 ) ( not ( = ?auto_963666 ?auto_963672 ) ) ( not ( = ?auto_963667 ?auto_963672 ) ) ( not ( = ?auto_963665 ?auto_963672 ) ) ( SURFACE-AT ?auto_963665 ?auto_963670 ) ( CLEAR ?auto_963665 ) ( IS-CRATE ?auto_963666 ) ( AVAILABLE ?auto_963668 ) ( IN ?auto_963666 ?auto_963669 ) ( TRUCK-AT ?auto_963669 ?auto_963671 ) ( ON ?auto_963658 ?auto_963657 ) ( ON ?auto_963659 ?auto_963658 ) ( ON ?auto_963656 ?auto_963659 ) ( ON ?auto_963660 ?auto_963656 ) ( ON ?auto_963662 ?auto_963660 ) ( ON ?auto_963661 ?auto_963662 ) ( ON ?auto_963663 ?auto_963661 ) ( ON ?auto_963664 ?auto_963663 ) ( ON ?auto_963665 ?auto_963664 ) ( not ( = ?auto_963657 ?auto_963658 ) ) ( not ( = ?auto_963657 ?auto_963659 ) ) ( not ( = ?auto_963657 ?auto_963656 ) ) ( not ( = ?auto_963657 ?auto_963660 ) ) ( not ( = ?auto_963657 ?auto_963662 ) ) ( not ( = ?auto_963657 ?auto_963661 ) ) ( not ( = ?auto_963657 ?auto_963663 ) ) ( not ( = ?auto_963657 ?auto_963664 ) ) ( not ( = ?auto_963657 ?auto_963665 ) ) ( not ( = ?auto_963657 ?auto_963666 ) ) ( not ( = ?auto_963657 ?auto_963667 ) ) ( not ( = ?auto_963657 ?auto_963672 ) ) ( not ( = ?auto_963658 ?auto_963659 ) ) ( not ( = ?auto_963658 ?auto_963656 ) ) ( not ( = ?auto_963658 ?auto_963660 ) ) ( not ( = ?auto_963658 ?auto_963662 ) ) ( not ( = ?auto_963658 ?auto_963661 ) ) ( not ( = ?auto_963658 ?auto_963663 ) ) ( not ( = ?auto_963658 ?auto_963664 ) ) ( not ( = ?auto_963658 ?auto_963665 ) ) ( not ( = ?auto_963658 ?auto_963666 ) ) ( not ( = ?auto_963658 ?auto_963667 ) ) ( not ( = ?auto_963658 ?auto_963672 ) ) ( not ( = ?auto_963659 ?auto_963656 ) ) ( not ( = ?auto_963659 ?auto_963660 ) ) ( not ( = ?auto_963659 ?auto_963662 ) ) ( not ( = ?auto_963659 ?auto_963661 ) ) ( not ( = ?auto_963659 ?auto_963663 ) ) ( not ( = ?auto_963659 ?auto_963664 ) ) ( not ( = ?auto_963659 ?auto_963665 ) ) ( not ( = ?auto_963659 ?auto_963666 ) ) ( not ( = ?auto_963659 ?auto_963667 ) ) ( not ( = ?auto_963659 ?auto_963672 ) ) ( not ( = ?auto_963656 ?auto_963660 ) ) ( not ( = ?auto_963656 ?auto_963662 ) ) ( not ( = ?auto_963656 ?auto_963661 ) ) ( not ( = ?auto_963656 ?auto_963663 ) ) ( not ( = ?auto_963656 ?auto_963664 ) ) ( not ( = ?auto_963656 ?auto_963665 ) ) ( not ( = ?auto_963656 ?auto_963666 ) ) ( not ( = ?auto_963656 ?auto_963667 ) ) ( not ( = ?auto_963656 ?auto_963672 ) ) ( not ( = ?auto_963660 ?auto_963662 ) ) ( not ( = ?auto_963660 ?auto_963661 ) ) ( not ( = ?auto_963660 ?auto_963663 ) ) ( not ( = ?auto_963660 ?auto_963664 ) ) ( not ( = ?auto_963660 ?auto_963665 ) ) ( not ( = ?auto_963660 ?auto_963666 ) ) ( not ( = ?auto_963660 ?auto_963667 ) ) ( not ( = ?auto_963660 ?auto_963672 ) ) ( not ( = ?auto_963662 ?auto_963661 ) ) ( not ( = ?auto_963662 ?auto_963663 ) ) ( not ( = ?auto_963662 ?auto_963664 ) ) ( not ( = ?auto_963662 ?auto_963665 ) ) ( not ( = ?auto_963662 ?auto_963666 ) ) ( not ( = ?auto_963662 ?auto_963667 ) ) ( not ( = ?auto_963662 ?auto_963672 ) ) ( not ( = ?auto_963661 ?auto_963663 ) ) ( not ( = ?auto_963661 ?auto_963664 ) ) ( not ( = ?auto_963661 ?auto_963665 ) ) ( not ( = ?auto_963661 ?auto_963666 ) ) ( not ( = ?auto_963661 ?auto_963667 ) ) ( not ( = ?auto_963661 ?auto_963672 ) ) ( not ( = ?auto_963663 ?auto_963664 ) ) ( not ( = ?auto_963663 ?auto_963665 ) ) ( not ( = ?auto_963663 ?auto_963666 ) ) ( not ( = ?auto_963663 ?auto_963667 ) ) ( not ( = ?auto_963663 ?auto_963672 ) ) ( not ( = ?auto_963664 ?auto_963665 ) ) ( not ( = ?auto_963664 ?auto_963666 ) ) ( not ( = ?auto_963664 ?auto_963667 ) ) ( not ( = ?auto_963664 ?auto_963672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963665 ?auto_963666 ?auto_963667 )
      ( MAKE-11CRATE-VERIFY ?auto_963657 ?auto_963658 ?auto_963659 ?auto_963656 ?auto_963660 ?auto_963662 ?auto_963661 ?auto_963663 ?auto_963664 ?auto_963665 ?auto_963666 ?auto_963667 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_963675 - SURFACE
      ?auto_963676 - SURFACE
      ?auto_963677 - SURFACE
      ?auto_963674 - SURFACE
      ?auto_963678 - SURFACE
      ?auto_963680 - SURFACE
      ?auto_963679 - SURFACE
      ?auto_963681 - SURFACE
      ?auto_963682 - SURFACE
      ?auto_963683 - SURFACE
      ?auto_963684 - SURFACE
      ?auto_963685 - SURFACE
      ?auto_963686 - SURFACE
    )
    :vars
    (
      ?auto_963687 - HOIST
      ?auto_963689 - PLACE
      ?auto_963690 - PLACE
      ?auto_963692 - HOIST
      ?auto_963691 - SURFACE
      ?auto_963688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963687 ?auto_963689 ) ( IS-CRATE ?auto_963686 ) ( not ( = ?auto_963685 ?auto_963686 ) ) ( not ( = ?auto_963684 ?auto_963685 ) ) ( not ( = ?auto_963684 ?auto_963686 ) ) ( not ( = ?auto_963690 ?auto_963689 ) ) ( HOIST-AT ?auto_963692 ?auto_963690 ) ( not ( = ?auto_963687 ?auto_963692 ) ) ( AVAILABLE ?auto_963692 ) ( SURFACE-AT ?auto_963686 ?auto_963690 ) ( ON ?auto_963686 ?auto_963691 ) ( CLEAR ?auto_963686 ) ( not ( = ?auto_963685 ?auto_963691 ) ) ( not ( = ?auto_963686 ?auto_963691 ) ) ( not ( = ?auto_963684 ?auto_963691 ) ) ( SURFACE-AT ?auto_963684 ?auto_963689 ) ( CLEAR ?auto_963684 ) ( IS-CRATE ?auto_963685 ) ( AVAILABLE ?auto_963687 ) ( IN ?auto_963685 ?auto_963688 ) ( TRUCK-AT ?auto_963688 ?auto_963690 ) ( ON ?auto_963676 ?auto_963675 ) ( ON ?auto_963677 ?auto_963676 ) ( ON ?auto_963674 ?auto_963677 ) ( ON ?auto_963678 ?auto_963674 ) ( ON ?auto_963680 ?auto_963678 ) ( ON ?auto_963679 ?auto_963680 ) ( ON ?auto_963681 ?auto_963679 ) ( ON ?auto_963682 ?auto_963681 ) ( ON ?auto_963683 ?auto_963682 ) ( ON ?auto_963684 ?auto_963683 ) ( not ( = ?auto_963675 ?auto_963676 ) ) ( not ( = ?auto_963675 ?auto_963677 ) ) ( not ( = ?auto_963675 ?auto_963674 ) ) ( not ( = ?auto_963675 ?auto_963678 ) ) ( not ( = ?auto_963675 ?auto_963680 ) ) ( not ( = ?auto_963675 ?auto_963679 ) ) ( not ( = ?auto_963675 ?auto_963681 ) ) ( not ( = ?auto_963675 ?auto_963682 ) ) ( not ( = ?auto_963675 ?auto_963683 ) ) ( not ( = ?auto_963675 ?auto_963684 ) ) ( not ( = ?auto_963675 ?auto_963685 ) ) ( not ( = ?auto_963675 ?auto_963686 ) ) ( not ( = ?auto_963675 ?auto_963691 ) ) ( not ( = ?auto_963676 ?auto_963677 ) ) ( not ( = ?auto_963676 ?auto_963674 ) ) ( not ( = ?auto_963676 ?auto_963678 ) ) ( not ( = ?auto_963676 ?auto_963680 ) ) ( not ( = ?auto_963676 ?auto_963679 ) ) ( not ( = ?auto_963676 ?auto_963681 ) ) ( not ( = ?auto_963676 ?auto_963682 ) ) ( not ( = ?auto_963676 ?auto_963683 ) ) ( not ( = ?auto_963676 ?auto_963684 ) ) ( not ( = ?auto_963676 ?auto_963685 ) ) ( not ( = ?auto_963676 ?auto_963686 ) ) ( not ( = ?auto_963676 ?auto_963691 ) ) ( not ( = ?auto_963677 ?auto_963674 ) ) ( not ( = ?auto_963677 ?auto_963678 ) ) ( not ( = ?auto_963677 ?auto_963680 ) ) ( not ( = ?auto_963677 ?auto_963679 ) ) ( not ( = ?auto_963677 ?auto_963681 ) ) ( not ( = ?auto_963677 ?auto_963682 ) ) ( not ( = ?auto_963677 ?auto_963683 ) ) ( not ( = ?auto_963677 ?auto_963684 ) ) ( not ( = ?auto_963677 ?auto_963685 ) ) ( not ( = ?auto_963677 ?auto_963686 ) ) ( not ( = ?auto_963677 ?auto_963691 ) ) ( not ( = ?auto_963674 ?auto_963678 ) ) ( not ( = ?auto_963674 ?auto_963680 ) ) ( not ( = ?auto_963674 ?auto_963679 ) ) ( not ( = ?auto_963674 ?auto_963681 ) ) ( not ( = ?auto_963674 ?auto_963682 ) ) ( not ( = ?auto_963674 ?auto_963683 ) ) ( not ( = ?auto_963674 ?auto_963684 ) ) ( not ( = ?auto_963674 ?auto_963685 ) ) ( not ( = ?auto_963674 ?auto_963686 ) ) ( not ( = ?auto_963674 ?auto_963691 ) ) ( not ( = ?auto_963678 ?auto_963680 ) ) ( not ( = ?auto_963678 ?auto_963679 ) ) ( not ( = ?auto_963678 ?auto_963681 ) ) ( not ( = ?auto_963678 ?auto_963682 ) ) ( not ( = ?auto_963678 ?auto_963683 ) ) ( not ( = ?auto_963678 ?auto_963684 ) ) ( not ( = ?auto_963678 ?auto_963685 ) ) ( not ( = ?auto_963678 ?auto_963686 ) ) ( not ( = ?auto_963678 ?auto_963691 ) ) ( not ( = ?auto_963680 ?auto_963679 ) ) ( not ( = ?auto_963680 ?auto_963681 ) ) ( not ( = ?auto_963680 ?auto_963682 ) ) ( not ( = ?auto_963680 ?auto_963683 ) ) ( not ( = ?auto_963680 ?auto_963684 ) ) ( not ( = ?auto_963680 ?auto_963685 ) ) ( not ( = ?auto_963680 ?auto_963686 ) ) ( not ( = ?auto_963680 ?auto_963691 ) ) ( not ( = ?auto_963679 ?auto_963681 ) ) ( not ( = ?auto_963679 ?auto_963682 ) ) ( not ( = ?auto_963679 ?auto_963683 ) ) ( not ( = ?auto_963679 ?auto_963684 ) ) ( not ( = ?auto_963679 ?auto_963685 ) ) ( not ( = ?auto_963679 ?auto_963686 ) ) ( not ( = ?auto_963679 ?auto_963691 ) ) ( not ( = ?auto_963681 ?auto_963682 ) ) ( not ( = ?auto_963681 ?auto_963683 ) ) ( not ( = ?auto_963681 ?auto_963684 ) ) ( not ( = ?auto_963681 ?auto_963685 ) ) ( not ( = ?auto_963681 ?auto_963686 ) ) ( not ( = ?auto_963681 ?auto_963691 ) ) ( not ( = ?auto_963682 ?auto_963683 ) ) ( not ( = ?auto_963682 ?auto_963684 ) ) ( not ( = ?auto_963682 ?auto_963685 ) ) ( not ( = ?auto_963682 ?auto_963686 ) ) ( not ( = ?auto_963682 ?auto_963691 ) ) ( not ( = ?auto_963683 ?auto_963684 ) ) ( not ( = ?auto_963683 ?auto_963685 ) ) ( not ( = ?auto_963683 ?auto_963686 ) ) ( not ( = ?auto_963683 ?auto_963691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963684 ?auto_963685 ?auto_963686 )
      ( MAKE-12CRATE-VERIFY ?auto_963675 ?auto_963676 ?auto_963677 ?auto_963674 ?auto_963678 ?auto_963680 ?auto_963679 ?auto_963681 ?auto_963682 ?auto_963683 ?auto_963684 ?auto_963685 ?auto_963686 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_963694 - SURFACE
      ?auto_963695 - SURFACE
      ?auto_963696 - SURFACE
      ?auto_963693 - SURFACE
      ?auto_963697 - SURFACE
      ?auto_963699 - SURFACE
      ?auto_963698 - SURFACE
      ?auto_963700 - SURFACE
      ?auto_963701 - SURFACE
      ?auto_963702 - SURFACE
      ?auto_963703 - SURFACE
      ?auto_963704 - SURFACE
      ?auto_963705 - SURFACE
      ?auto_963706 - SURFACE
    )
    :vars
    (
      ?auto_963707 - HOIST
      ?auto_963709 - PLACE
      ?auto_963710 - PLACE
      ?auto_963712 - HOIST
      ?auto_963711 - SURFACE
      ?auto_963708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963707 ?auto_963709 ) ( IS-CRATE ?auto_963706 ) ( not ( = ?auto_963705 ?auto_963706 ) ) ( not ( = ?auto_963704 ?auto_963705 ) ) ( not ( = ?auto_963704 ?auto_963706 ) ) ( not ( = ?auto_963710 ?auto_963709 ) ) ( HOIST-AT ?auto_963712 ?auto_963710 ) ( not ( = ?auto_963707 ?auto_963712 ) ) ( AVAILABLE ?auto_963712 ) ( SURFACE-AT ?auto_963706 ?auto_963710 ) ( ON ?auto_963706 ?auto_963711 ) ( CLEAR ?auto_963706 ) ( not ( = ?auto_963705 ?auto_963711 ) ) ( not ( = ?auto_963706 ?auto_963711 ) ) ( not ( = ?auto_963704 ?auto_963711 ) ) ( SURFACE-AT ?auto_963704 ?auto_963709 ) ( CLEAR ?auto_963704 ) ( IS-CRATE ?auto_963705 ) ( AVAILABLE ?auto_963707 ) ( IN ?auto_963705 ?auto_963708 ) ( TRUCK-AT ?auto_963708 ?auto_963710 ) ( ON ?auto_963695 ?auto_963694 ) ( ON ?auto_963696 ?auto_963695 ) ( ON ?auto_963693 ?auto_963696 ) ( ON ?auto_963697 ?auto_963693 ) ( ON ?auto_963699 ?auto_963697 ) ( ON ?auto_963698 ?auto_963699 ) ( ON ?auto_963700 ?auto_963698 ) ( ON ?auto_963701 ?auto_963700 ) ( ON ?auto_963702 ?auto_963701 ) ( ON ?auto_963703 ?auto_963702 ) ( ON ?auto_963704 ?auto_963703 ) ( not ( = ?auto_963694 ?auto_963695 ) ) ( not ( = ?auto_963694 ?auto_963696 ) ) ( not ( = ?auto_963694 ?auto_963693 ) ) ( not ( = ?auto_963694 ?auto_963697 ) ) ( not ( = ?auto_963694 ?auto_963699 ) ) ( not ( = ?auto_963694 ?auto_963698 ) ) ( not ( = ?auto_963694 ?auto_963700 ) ) ( not ( = ?auto_963694 ?auto_963701 ) ) ( not ( = ?auto_963694 ?auto_963702 ) ) ( not ( = ?auto_963694 ?auto_963703 ) ) ( not ( = ?auto_963694 ?auto_963704 ) ) ( not ( = ?auto_963694 ?auto_963705 ) ) ( not ( = ?auto_963694 ?auto_963706 ) ) ( not ( = ?auto_963694 ?auto_963711 ) ) ( not ( = ?auto_963695 ?auto_963696 ) ) ( not ( = ?auto_963695 ?auto_963693 ) ) ( not ( = ?auto_963695 ?auto_963697 ) ) ( not ( = ?auto_963695 ?auto_963699 ) ) ( not ( = ?auto_963695 ?auto_963698 ) ) ( not ( = ?auto_963695 ?auto_963700 ) ) ( not ( = ?auto_963695 ?auto_963701 ) ) ( not ( = ?auto_963695 ?auto_963702 ) ) ( not ( = ?auto_963695 ?auto_963703 ) ) ( not ( = ?auto_963695 ?auto_963704 ) ) ( not ( = ?auto_963695 ?auto_963705 ) ) ( not ( = ?auto_963695 ?auto_963706 ) ) ( not ( = ?auto_963695 ?auto_963711 ) ) ( not ( = ?auto_963696 ?auto_963693 ) ) ( not ( = ?auto_963696 ?auto_963697 ) ) ( not ( = ?auto_963696 ?auto_963699 ) ) ( not ( = ?auto_963696 ?auto_963698 ) ) ( not ( = ?auto_963696 ?auto_963700 ) ) ( not ( = ?auto_963696 ?auto_963701 ) ) ( not ( = ?auto_963696 ?auto_963702 ) ) ( not ( = ?auto_963696 ?auto_963703 ) ) ( not ( = ?auto_963696 ?auto_963704 ) ) ( not ( = ?auto_963696 ?auto_963705 ) ) ( not ( = ?auto_963696 ?auto_963706 ) ) ( not ( = ?auto_963696 ?auto_963711 ) ) ( not ( = ?auto_963693 ?auto_963697 ) ) ( not ( = ?auto_963693 ?auto_963699 ) ) ( not ( = ?auto_963693 ?auto_963698 ) ) ( not ( = ?auto_963693 ?auto_963700 ) ) ( not ( = ?auto_963693 ?auto_963701 ) ) ( not ( = ?auto_963693 ?auto_963702 ) ) ( not ( = ?auto_963693 ?auto_963703 ) ) ( not ( = ?auto_963693 ?auto_963704 ) ) ( not ( = ?auto_963693 ?auto_963705 ) ) ( not ( = ?auto_963693 ?auto_963706 ) ) ( not ( = ?auto_963693 ?auto_963711 ) ) ( not ( = ?auto_963697 ?auto_963699 ) ) ( not ( = ?auto_963697 ?auto_963698 ) ) ( not ( = ?auto_963697 ?auto_963700 ) ) ( not ( = ?auto_963697 ?auto_963701 ) ) ( not ( = ?auto_963697 ?auto_963702 ) ) ( not ( = ?auto_963697 ?auto_963703 ) ) ( not ( = ?auto_963697 ?auto_963704 ) ) ( not ( = ?auto_963697 ?auto_963705 ) ) ( not ( = ?auto_963697 ?auto_963706 ) ) ( not ( = ?auto_963697 ?auto_963711 ) ) ( not ( = ?auto_963699 ?auto_963698 ) ) ( not ( = ?auto_963699 ?auto_963700 ) ) ( not ( = ?auto_963699 ?auto_963701 ) ) ( not ( = ?auto_963699 ?auto_963702 ) ) ( not ( = ?auto_963699 ?auto_963703 ) ) ( not ( = ?auto_963699 ?auto_963704 ) ) ( not ( = ?auto_963699 ?auto_963705 ) ) ( not ( = ?auto_963699 ?auto_963706 ) ) ( not ( = ?auto_963699 ?auto_963711 ) ) ( not ( = ?auto_963698 ?auto_963700 ) ) ( not ( = ?auto_963698 ?auto_963701 ) ) ( not ( = ?auto_963698 ?auto_963702 ) ) ( not ( = ?auto_963698 ?auto_963703 ) ) ( not ( = ?auto_963698 ?auto_963704 ) ) ( not ( = ?auto_963698 ?auto_963705 ) ) ( not ( = ?auto_963698 ?auto_963706 ) ) ( not ( = ?auto_963698 ?auto_963711 ) ) ( not ( = ?auto_963700 ?auto_963701 ) ) ( not ( = ?auto_963700 ?auto_963702 ) ) ( not ( = ?auto_963700 ?auto_963703 ) ) ( not ( = ?auto_963700 ?auto_963704 ) ) ( not ( = ?auto_963700 ?auto_963705 ) ) ( not ( = ?auto_963700 ?auto_963706 ) ) ( not ( = ?auto_963700 ?auto_963711 ) ) ( not ( = ?auto_963701 ?auto_963702 ) ) ( not ( = ?auto_963701 ?auto_963703 ) ) ( not ( = ?auto_963701 ?auto_963704 ) ) ( not ( = ?auto_963701 ?auto_963705 ) ) ( not ( = ?auto_963701 ?auto_963706 ) ) ( not ( = ?auto_963701 ?auto_963711 ) ) ( not ( = ?auto_963702 ?auto_963703 ) ) ( not ( = ?auto_963702 ?auto_963704 ) ) ( not ( = ?auto_963702 ?auto_963705 ) ) ( not ( = ?auto_963702 ?auto_963706 ) ) ( not ( = ?auto_963702 ?auto_963711 ) ) ( not ( = ?auto_963703 ?auto_963704 ) ) ( not ( = ?auto_963703 ?auto_963705 ) ) ( not ( = ?auto_963703 ?auto_963706 ) ) ( not ( = ?auto_963703 ?auto_963711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963704 ?auto_963705 ?auto_963706 )
      ( MAKE-13CRATE-VERIFY ?auto_963694 ?auto_963695 ?auto_963696 ?auto_963693 ?auto_963697 ?auto_963699 ?auto_963698 ?auto_963700 ?auto_963701 ?auto_963702 ?auto_963703 ?auto_963704 ?auto_963705 ?auto_963706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_963713 - SURFACE
      ?auto_963714 - SURFACE
    )
    :vars
    (
      ?auto_963715 - HOIST
      ?auto_963717 - PLACE
      ?auto_963719 - SURFACE
      ?auto_963718 - PLACE
      ?auto_963721 - HOIST
      ?auto_963720 - SURFACE
      ?auto_963716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963715 ?auto_963717 ) ( IS-CRATE ?auto_963714 ) ( not ( = ?auto_963713 ?auto_963714 ) ) ( not ( = ?auto_963719 ?auto_963713 ) ) ( not ( = ?auto_963719 ?auto_963714 ) ) ( not ( = ?auto_963718 ?auto_963717 ) ) ( HOIST-AT ?auto_963721 ?auto_963718 ) ( not ( = ?auto_963715 ?auto_963721 ) ) ( SURFACE-AT ?auto_963714 ?auto_963718 ) ( ON ?auto_963714 ?auto_963720 ) ( CLEAR ?auto_963714 ) ( not ( = ?auto_963713 ?auto_963720 ) ) ( not ( = ?auto_963714 ?auto_963720 ) ) ( not ( = ?auto_963719 ?auto_963720 ) ) ( SURFACE-AT ?auto_963719 ?auto_963717 ) ( CLEAR ?auto_963719 ) ( IS-CRATE ?auto_963713 ) ( AVAILABLE ?auto_963715 ) ( TRUCK-AT ?auto_963716 ?auto_963718 ) ( LIFTING ?auto_963721 ?auto_963713 ) )
    :subtasks
    ( ( !LOAD ?auto_963721 ?auto_963713 ?auto_963716 ?auto_963718 )
      ( MAKE-2CRATE ?auto_963719 ?auto_963713 ?auto_963714 )
      ( MAKE-1CRATE-VERIFY ?auto_963713 ?auto_963714 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_963722 - SURFACE
      ?auto_963723 - SURFACE
      ?auto_963724 - SURFACE
    )
    :vars
    (
      ?auto_963725 - HOIST
      ?auto_963727 - PLACE
      ?auto_963730 - PLACE
      ?auto_963729 - HOIST
      ?auto_963728 - SURFACE
      ?auto_963726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963725 ?auto_963727 ) ( IS-CRATE ?auto_963724 ) ( not ( = ?auto_963723 ?auto_963724 ) ) ( not ( = ?auto_963722 ?auto_963723 ) ) ( not ( = ?auto_963722 ?auto_963724 ) ) ( not ( = ?auto_963730 ?auto_963727 ) ) ( HOIST-AT ?auto_963729 ?auto_963730 ) ( not ( = ?auto_963725 ?auto_963729 ) ) ( SURFACE-AT ?auto_963724 ?auto_963730 ) ( ON ?auto_963724 ?auto_963728 ) ( CLEAR ?auto_963724 ) ( not ( = ?auto_963723 ?auto_963728 ) ) ( not ( = ?auto_963724 ?auto_963728 ) ) ( not ( = ?auto_963722 ?auto_963728 ) ) ( SURFACE-AT ?auto_963722 ?auto_963727 ) ( CLEAR ?auto_963722 ) ( IS-CRATE ?auto_963723 ) ( AVAILABLE ?auto_963725 ) ( TRUCK-AT ?auto_963726 ?auto_963730 ) ( LIFTING ?auto_963729 ?auto_963723 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_963723 ?auto_963724 )
      ( MAKE-2CRATE-VERIFY ?auto_963722 ?auto_963723 ?auto_963724 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_963732 - SURFACE
      ?auto_963733 - SURFACE
      ?auto_963734 - SURFACE
      ?auto_963731 - SURFACE
    )
    :vars
    (
      ?auto_963736 - HOIST
      ?auto_963735 - PLACE
      ?auto_963740 - PLACE
      ?auto_963739 - HOIST
      ?auto_963737 - SURFACE
      ?auto_963738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963736 ?auto_963735 ) ( IS-CRATE ?auto_963731 ) ( not ( = ?auto_963734 ?auto_963731 ) ) ( not ( = ?auto_963733 ?auto_963734 ) ) ( not ( = ?auto_963733 ?auto_963731 ) ) ( not ( = ?auto_963740 ?auto_963735 ) ) ( HOIST-AT ?auto_963739 ?auto_963740 ) ( not ( = ?auto_963736 ?auto_963739 ) ) ( SURFACE-AT ?auto_963731 ?auto_963740 ) ( ON ?auto_963731 ?auto_963737 ) ( CLEAR ?auto_963731 ) ( not ( = ?auto_963734 ?auto_963737 ) ) ( not ( = ?auto_963731 ?auto_963737 ) ) ( not ( = ?auto_963733 ?auto_963737 ) ) ( SURFACE-AT ?auto_963733 ?auto_963735 ) ( CLEAR ?auto_963733 ) ( IS-CRATE ?auto_963734 ) ( AVAILABLE ?auto_963736 ) ( TRUCK-AT ?auto_963738 ?auto_963740 ) ( LIFTING ?auto_963739 ?auto_963734 ) ( ON ?auto_963733 ?auto_963732 ) ( not ( = ?auto_963732 ?auto_963733 ) ) ( not ( = ?auto_963732 ?auto_963734 ) ) ( not ( = ?auto_963732 ?auto_963731 ) ) ( not ( = ?auto_963732 ?auto_963737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963733 ?auto_963734 ?auto_963731 )
      ( MAKE-3CRATE-VERIFY ?auto_963732 ?auto_963733 ?auto_963734 ?auto_963731 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_963742 - SURFACE
      ?auto_963743 - SURFACE
      ?auto_963744 - SURFACE
      ?auto_963741 - SURFACE
      ?auto_963745 - SURFACE
    )
    :vars
    (
      ?auto_963747 - HOIST
      ?auto_963746 - PLACE
      ?auto_963751 - PLACE
      ?auto_963750 - HOIST
      ?auto_963748 - SURFACE
      ?auto_963749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963747 ?auto_963746 ) ( IS-CRATE ?auto_963745 ) ( not ( = ?auto_963741 ?auto_963745 ) ) ( not ( = ?auto_963744 ?auto_963741 ) ) ( not ( = ?auto_963744 ?auto_963745 ) ) ( not ( = ?auto_963751 ?auto_963746 ) ) ( HOIST-AT ?auto_963750 ?auto_963751 ) ( not ( = ?auto_963747 ?auto_963750 ) ) ( SURFACE-AT ?auto_963745 ?auto_963751 ) ( ON ?auto_963745 ?auto_963748 ) ( CLEAR ?auto_963745 ) ( not ( = ?auto_963741 ?auto_963748 ) ) ( not ( = ?auto_963745 ?auto_963748 ) ) ( not ( = ?auto_963744 ?auto_963748 ) ) ( SURFACE-AT ?auto_963744 ?auto_963746 ) ( CLEAR ?auto_963744 ) ( IS-CRATE ?auto_963741 ) ( AVAILABLE ?auto_963747 ) ( TRUCK-AT ?auto_963749 ?auto_963751 ) ( LIFTING ?auto_963750 ?auto_963741 ) ( ON ?auto_963743 ?auto_963742 ) ( ON ?auto_963744 ?auto_963743 ) ( not ( = ?auto_963742 ?auto_963743 ) ) ( not ( = ?auto_963742 ?auto_963744 ) ) ( not ( = ?auto_963742 ?auto_963741 ) ) ( not ( = ?auto_963742 ?auto_963745 ) ) ( not ( = ?auto_963742 ?auto_963748 ) ) ( not ( = ?auto_963743 ?auto_963744 ) ) ( not ( = ?auto_963743 ?auto_963741 ) ) ( not ( = ?auto_963743 ?auto_963745 ) ) ( not ( = ?auto_963743 ?auto_963748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963744 ?auto_963741 ?auto_963745 )
      ( MAKE-4CRATE-VERIFY ?auto_963742 ?auto_963743 ?auto_963744 ?auto_963741 ?auto_963745 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_963753 - SURFACE
      ?auto_963754 - SURFACE
      ?auto_963755 - SURFACE
      ?auto_963752 - SURFACE
      ?auto_963756 - SURFACE
      ?auto_963757 - SURFACE
    )
    :vars
    (
      ?auto_963759 - HOIST
      ?auto_963758 - PLACE
      ?auto_963763 - PLACE
      ?auto_963762 - HOIST
      ?auto_963760 - SURFACE
      ?auto_963761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963759 ?auto_963758 ) ( IS-CRATE ?auto_963757 ) ( not ( = ?auto_963756 ?auto_963757 ) ) ( not ( = ?auto_963752 ?auto_963756 ) ) ( not ( = ?auto_963752 ?auto_963757 ) ) ( not ( = ?auto_963763 ?auto_963758 ) ) ( HOIST-AT ?auto_963762 ?auto_963763 ) ( not ( = ?auto_963759 ?auto_963762 ) ) ( SURFACE-AT ?auto_963757 ?auto_963763 ) ( ON ?auto_963757 ?auto_963760 ) ( CLEAR ?auto_963757 ) ( not ( = ?auto_963756 ?auto_963760 ) ) ( not ( = ?auto_963757 ?auto_963760 ) ) ( not ( = ?auto_963752 ?auto_963760 ) ) ( SURFACE-AT ?auto_963752 ?auto_963758 ) ( CLEAR ?auto_963752 ) ( IS-CRATE ?auto_963756 ) ( AVAILABLE ?auto_963759 ) ( TRUCK-AT ?auto_963761 ?auto_963763 ) ( LIFTING ?auto_963762 ?auto_963756 ) ( ON ?auto_963754 ?auto_963753 ) ( ON ?auto_963755 ?auto_963754 ) ( ON ?auto_963752 ?auto_963755 ) ( not ( = ?auto_963753 ?auto_963754 ) ) ( not ( = ?auto_963753 ?auto_963755 ) ) ( not ( = ?auto_963753 ?auto_963752 ) ) ( not ( = ?auto_963753 ?auto_963756 ) ) ( not ( = ?auto_963753 ?auto_963757 ) ) ( not ( = ?auto_963753 ?auto_963760 ) ) ( not ( = ?auto_963754 ?auto_963755 ) ) ( not ( = ?auto_963754 ?auto_963752 ) ) ( not ( = ?auto_963754 ?auto_963756 ) ) ( not ( = ?auto_963754 ?auto_963757 ) ) ( not ( = ?auto_963754 ?auto_963760 ) ) ( not ( = ?auto_963755 ?auto_963752 ) ) ( not ( = ?auto_963755 ?auto_963756 ) ) ( not ( = ?auto_963755 ?auto_963757 ) ) ( not ( = ?auto_963755 ?auto_963760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963752 ?auto_963756 ?auto_963757 )
      ( MAKE-5CRATE-VERIFY ?auto_963753 ?auto_963754 ?auto_963755 ?auto_963752 ?auto_963756 ?auto_963757 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_963765 - SURFACE
      ?auto_963766 - SURFACE
      ?auto_963767 - SURFACE
      ?auto_963764 - SURFACE
      ?auto_963768 - SURFACE
      ?auto_963770 - SURFACE
      ?auto_963769 - SURFACE
    )
    :vars
    (
      ?auto_963772 - HOIST
      ?auto_963771 - PLACE
      ?auto_963776 - PLACE
      ?auto_963775 - HOIST
      ?auto_963773 - SURFACE
      ?auto_963774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963772 ?auto_963771 ) ( IS-CRATE ?auto_963769 ) ( not ( = ?auto_963770 ?auto_963769 ) ) ( not ( = ?auto_963768 ?auto_963770 ) ) ( not ( = ?auto_963768 ?auto_963769 ) ) ( not ( = ?auto_963776 ?auto_963771 ) ) ( HOIST-AT ?auto_963775 ?auto_963776 ) ( not ( = ?auto_963772 ?auto_963775 ) ) ( SURFACE-AT ?auto_963769 ?auto_963776 ) ( ON ?auto_963769 ?auto_963773 ) ( CLEAR ?auto_963769 ) ( not ( = ?auto_963770 ?auto_963773 ) ) ( not ( = ?auto_963769 ?auto_963773 ) ) ( not ( = ?auto_963768 ?auto_963773 ) ) ( SURFACE-AT ?auto_963768 ?auto_963771 ) ( CLEAR ?auto_963768 ) ( IS-CRATE ?auto_963770 ) ( AVAILABLE ?auto_963772 ) ( TRUCK-AT ?auto_963774 ?auto_963776 ) ( LIFTING ?auto_963775 ?auto_963770 ) ( ON ?auto_963766 ?auto_963765 ) ( ON ?auto_963767 ?auto_963766 ) ( ON ?auto_963764 ?auto_963767 ) ( ON ?auto_963768 ?auto_963764 ) ( not ( = ?auto_963765 ?auto_963766 ) ) ( not ( = ?auto_963765 ?auto_963767 ) ) ( not ( = ?auto_963765 ?auto_963764 ) ) ( not ( = ?auto_963765 ?auto_963768 ) ) ( not ( = ?auto_963765 ?auto_963770 ) ) ( not ( = ?auto_963765 ?auto_963769 ) ) ( not ( = ?auto_963765 ?auto_963773 ) ) ( not ( = ?auto_963766 ?auto_963767 ) ) ( not ( = ?auto_963766 ?auto_963764 ) ) ( not ( = ?auto_963766 ?auto_963768 ) ) ( not ( = ?auto_963766 ?auto_963770 ) ) ( not ( = ?auto_963766 ?auto_963769 ) ) ( not ( = ?auto_963766 ?auto_963773 ) ) ( not ( = ?auto_963767 ?auto_963764 ) ) ( not ( = ?auto_963767 ?auto_963768 ) ) ( not ( = ?auto_963767 ?auto_963770 ) ) ( not ( = ?auto_963767 ?auto_963769 ) ) ( not ( = ?auto_963767 ?auto_963773 ) ) ( not ( = ?auto_963764 ?auto_963768 ) ) ( not ( = ?auto_963764 ?auto_963770 ) ) ( not ( = ?auto_963764 ?auto_963769 ) ) ( not ( = ?auto_963764 ?auto_963773 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963768 ?auto_963770 ?auto_963769 )
      ( MAKE-6CRATE-VERIFY ?auto_963765 ?auto_963766 ?auto_963767 ?auto_963764 ?auto_963768 ?auto_963770 ?auto_963769 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_963778 - SURFACE
      ?auto_963779 - SURFACE
      ?auto_963780 - SURFACE
      ?auto_963777 - SURFACE
      ?auto_963781 - SURFACE
      ?auto_963783 - SURFACE
      ?auto_963782 - SURFACE
      ?auto_963784 - SURFACE
    )
    :vars
    (
      ?auto_963786 - HOIST
      ?auto_963785 - PLACE
      ?auto_963790 - PLACE
      ?auto_963789 - HOIST
      ?auto_963787 - SURFACE
      ?auto_963788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963786 ?auto_963785 ) ( IS-CRATE ?auto_963784 ) ( not ( = ?auto_963782 ?auto_963784 ) ) ( not ( = ?auto_963783 ?auto_963782 ) ) ( not ( = ?auto_963783 ?auto_963784 ) ) ( not ( = ?auto_963790 ?auto_963785 ) ) ( HOIST-AT ?auto_963789 ?auto_963790 ) ( not ( = ?auto_963786 ?auto_963789 ) ) ( SURFACE-AT ?auto_963784 ?auto_963790 ) ( ON ?auto_963784 ?auto_963787 ) ( CLEAR ?auto_963784 ) ( not ( = ?auto_963782 ?auto_963787 ) ) ( not ( = ?auto_963784 ?auto_963787 ) ) ( not ( = ?auto_963783 ?auto_963787 ) ) ( SURFACE-AT ?auto_963783 ?auto_963785 ) ( CLEAR ?auto_963783 ) ( IS-CRATE ?auto_963782 ) ( AVAILABLE ?auto_963786 ) ( TRUCK-AT ?auto_963788 ?auto_963790 ) ( LIFTING ?auto_963789 ?auto_963782 ) ( ON ?auto_963779 ?auto_963778 ) ( ON ?auto_963780 ?auto_963779 ) ( ON ?auto_963777 ?auto_963780 ) ( ON ?auto_963781 ?auto_963777 ) ( ON ?auto_963783 ?auto_963781 ) ( not ( = ?auto_963778 ?auto_963779 ) ) ( not ( = ?auto_963778 ?auto_963780 ) ) ( not ( = ?auto_963778 ?auto_963777 ) ) ( not ( = ?auto_963778 ?auto_963781 ) ) ( not ( = ?auto_963778 ?auto_963783 ) ) ( not ( = ?auto_963778 ?auto_963782 ) ) ( not ( = ?auto_963778 ?auto_963784 ) ) ( not ( = ?auto_963778 ?auto_963787 ) ) ( not ( = ?auto_963779 ?auto_963780 ) ) ( not ( = ?auto_963779 ?auto_963777 ) ) ( not ( = ?auto_963779 ?auto_963781 ) ) ( not ( = ?auto_963779 ?auto_963783 ) ) ( not ( = ?auto_963779 ?auto_963782 ) ) ( not ( = ?auto_963779 ?auto_963784 ) ) ( not ( = ?auto_963779 ?auto_963787 ) ) ( not ( = ?auto_963780 ?auto_963777 ) ) ( not ( = ?auto_963780 ?auto_963781 ) ) ( not ( = ?auto_963780 ?auto_963783 ) ) ( not ( = ?auto_963780 ?auto_963782 ) ) ( not ( = ?auto_963780 ?auto_963784 ) ) ( not ( = ?auto_963780 ?auto_963787 ) ) ( not ( = ?auto_963777 ?auto_963781 ) ) ( not ( = ?auto_963777 ?auto_963783 ) ) ( not ( = ?auto_963777 ?auto_963782 ) ) ( not ( = ?auto_963777 ?auto_963784 ) ) ( not ( = ?auto_963777 ?auto_963787 ) ) ( not ( = ?auto_963781 ?auto_963783 ) ) ( not ( = ?auto_963781 ?auto_963782 ) ) ( not ( = ?auto_963781 ?auto_963784 ) ) ( not ( = ?auto_963781 ?auto_963787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963783 ?auto_963782 ?auto_963784 )
      ( MAKE-7CRATE-VERIFY ?auto_963778 ?auto_963779 ?auto_963780 ?auto_963777 ?auto_963781 ?auto_963783 ?auto_963782 ?auto_963784 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_963792 - SURFACE
      ?auto_963793 - SURFACE
      ?auto_963794 - SURFACE
      ?auto_963791 - SURFACE
      ?auto_963795 - SURFACE
      ?auto_963797 - SURFACE
      ?auto_963796 - SURFACE
      ?auto_963798 - SURFACE
      ?auto_963799 - SURFACE
    )
    :vars
    (
      ?auto_963801 - HOIST
      ?auto_963800 - PLACE
      ?auto_963805 - PLACE
      ?auto_963804 - HOIST
      ?auto_963802 - SURFACE
      ?auto_963803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963801 ?auto_963800 ) ( IS-CRATE ?auto_963799 ) ( not ( = ?auto_963798 ?auto_963799 ) ) ( not ( = ?auto_963796 ?auto_963798 ) ) ( not ( = ?auto_963796 ?auto_963799 ) ) ( not ( = ?auto_963805 ?auto_963800 ) ) ( HOIST-AT ?auto_963804 ?auto_963805 ) ( not ( = ?auto_963801 ?auto_963804 ) ) ( SURFACE-AT ?auto_963799 ?auto_963805 ) ( ON ?auto_963799 ?auto_963802 ) ( CLEAR ?auto_963799 ) ( not ( = ?auto_963798 ?auto_963802 ) ) ( not ( = ?auto_963799 ?auto_963802 ) ) ( not ( = ?auto_963796 ?auto_963802 ) ) ( SURFACE-AT ?auto_963796 ?auto_963800 ) ( CLEAR ?auto_963796 ) ( IS-CRATE ?auto_963798 ) ( AVAILABLE ?auto_963801 ) ( TRUCK-AT ?auto_963803 ?auto_963805 ) ( LIFTING ?auto_963804 ?auto_963798 ) ( ON ?auto_963793 ?auto_963792 ) ( ON ?auto_963794 ?auto_963793 ) ( ON ?auto_963791 ?auto_963794 ) ( ON ?auto_963795 ?auto_963791 ) ( ON ?auto_963797 ?auto_963795 ) ( ON ?auto_963796 ?auto_963797 ) ( not ( = ?auto_963792 ?auto_963793 ) ) ( not ( = ?auto_963792 ?auto_963794 ) ) ( not ( = ?auto_963792 ?auto_963791 ) ) ( not ( = ?auto_963792 ?auto_963795 ) ) ( not ( = ?auto_963792 ?auto_963797 ) ) ( not ( = ?auto_963792 ?auto_963796 ) ) ( not ( = ?auto_963792 ?auto_963798 ) ) ( not ( = ?auto_963792 ?auto_963799 ) ) ( not ( = ?auto_963792 ?auto_963802 ) ) ( not ( = ?auto_963793 ?auto_963794 ) ) ( not ( = ?auto_963793 ?auto_963791 ) ) ( not ( = ?auto_963793 ?auto_963795 ) ) ( not ( = ?auto_963793 ?auto_963797 ) ) ( not ( = ?auto_963793 ?auto_963796 ) ) ( not ( = ?auto_963793 ?auto_963798 ) ) ( not ( = ?auto_963793 ?auto_963799 ) ) ( not ( = ?auto_963793 ?auto_963802 ) ) ( not ( = ?auto_963794 ?auto_963791 ) ) ( not ( = ?auto_963794 ?auto_963795 ) ) ( not ( = ?auto_963794 ?auto_963797 ) ) ( not ( = ?auto_963794 ?auto_963796 ) ) ( not ( = ?auto_963794 ?auto_963798 ) ) ( not ( = ?auto_963794 ?auto_963799 ) ) ( not ( = ?auto_963794 ?auto_963802 ) ) ( not ( = ?auto_963791 ?auto_963795 ) ) ( not ( = ?auto_963791 ?auto_963797 ) ) ( not ( = ?auto_963791 ?auto_963796 ) ) ( not ( = ?auto_963791 ?auto_963798 ) ) ( not ( = ?auto_963791 ?auto_963799 ) ) ( not ( = ?auto_963791 ?auto_963802 ) ) ( not ( = ?auto_963795 ?auto_963797 ) ) ( not ( = ?auto_963795 ?auto_963796 ) ) ( not ( = ?auto_963795 ?auto_963798 ) ) ( not ( = ?auto_963795 ?auto_963799 ) ) ( not ( = ?auto_963795 ?auto_963802 ) ) ( not ( = ?auto_963797 ?auto_963796 ) ) ( not ( = ?auto_963797 ?auto_963798 ) ) ( not ( = ?auto_963797 ?auto_963799 ) ) ( not ( = ?auto_963797 ?auto_963802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963796 ?auto_963798 ?auto_963799 )
      ( MAKE-8CRATE-VERIFY ?auto_963792 ?auto_963793 ?auto_963794 ?auto_963791 ?auto_963795 ?auto_963797 ?auto_963796 ?auto_963798 ?auto_963799 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_963807 - SURFACE
      ?auto_963808 - SURFACE
      ?auto_963809 - SURFACE
      ?auto_963806 - SURFACE
      ?auto_963810 - SURFACE
      ?auto_963812 - SURFACE
      ?auto_963811 - SURFACE
      ?auto_963813 - SURFACE
      ?auto_963814 - SURFACE
      ?auto_963815 - SURFACE
    )
    :vars
    (
      ?auto_963817 - HOIST
      ?auto_963816 - PLACE
      ?auto_963821 - PLACE
      ?auto_963820 - HOIST
      ?auto_963818 - SURFACE
      ?auto_963819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963817 ?auto_963816 ) ( IS-CRATE ?auto_963815 ) ( not ( = ?auto_963814 ?auto_963815 ) ) ( not ( = ?auto_963813 ?auto_963814 ) ) ( not ( = ?auto_963813 ?auto_963815 ) ) ( not ( = ?auto_963821 ?auto_963816 ) ) ( HOIST-AT ?auto_963820 ?auto_963821 ) ( not ( = ?auto_963817 ?auto_963820 ) ) ( SURFACE-AT ?auto_963815 ?auto_963821 ) ( ON ?auto_963815 ?auto_963818 ) ( CLEAR ?auto_963815 ) ( not ( = ?auto_963814 ?auto_963818 ) ) ( not ( = ?auto_963815 ?auto_963818 ) ) ( not ( = ?auto_963813 ?auto_963818 ) ) ( SURFACE-AT ?auto_963813 ?auto_963816 ) ( CLEAR ?auto_963813 ) ( IS-CRATE ?auto_963814 ) ( AVAILABLE ?auto_963817 ) ( TRUCK-AT ?auto_963819 ?auto_963821 ) ( LIFTING ?auto_963820 ?auto_963814 ) ( ON ?auto_963808 ?auto_963807 ) ( ON ?auto_963809 ?auto_963808 ) ( ON ?auto_963806 ?auto_963809 ) ( ON ?auto_963810 ?auto_963806 ) ( ON ?auto_963812 ?auto_963810 ) ( ON ?auto_963811 ?auto_963812 ) ( ON ?auto_963813 ?auto_963811 ) ( not ( = ?auto_963807 ?auto_963808 ) ) ( not ( = ?auto_963807 ?auto_963809 ) ) ( not ( = ?auto_963807 ?auto_963806 ) ) ( not ( = ?auto_963807 ?auto_963810 ) ) ( not ( = ?auto_963807 ?auto_963812 ) ) ( not ( = ?auto_963807 ?auto_963811 ) ) ( not ( = ?auto_963807 ?auto_963813 ) ) ( not ( = ?auto_963807 ?auto_963814 ) ) ( not ( = ?auto_963807 ?auto_963815 ) ) ( not ( = ?auto_963807 ?auto_963818 ) ) ( not ( = ?auto_963808 ?auto_963809 ) ) ( not ( = ?auto_963808 ?auto_963806 ) ) ( not ( = ?auto_963808 ?auto_963810 ) ) ( not ( = ?auto_963808 ?auto_963812 ) ) ( not ( = ?auto_963808 ?auto_963811 ) ) ( not ( = ?auto_963808 ?auto_963813 ) ) ( not ( = ?auto_963808 ?auto_963814 ) ) ( not ( = ?auto_963808 ?auto_963815 ) ) ( not ( = ?auto_963808 ?auto_963818 ) ) ( not ( = ?auto_963809 ?auto_963806 ) ) ( not ( = ?auto_963809 ?auto_963810 ) ) ( not ( = ?auto_963809 ?auto_963812 ) ) ( not ( = ?auto_963809 ?auto_963811 ) ) ( not ( = ?auto_963809 ?auto_963813 ) ) ( not ( = ?auto_963809 ?auto_963814 ) ) ( not ( = ?auto_963809 ?auto_963815 ) ) ( not ( = ?auto_963809 ?auto_963818 ) ) ( not ( = ?auto_963806 ?auto_963810 ) ) ( not ( = ?auto_963806 ?auto_963812 ) ) ( not ( = ?auto_963806 ?auto_963811 ) ) ( not ( = ?auto_963806 ?auto_963813 ) ) ( not ( = ?auto_963806 ?auto_963814 ) ) ( not ( = ?auto_963806 ?auto_963815 ) ) ( not ( = ?auto_963806 ?auto_963818 ) ) ( not ( = ?auto_963810 ?auto_963812 ) ) ( not ( = ?auto_963810 ?auto_963811 ) ) ( not ( = ?auto_963810 ?auto_963813 ) ) ( not ( = ?auto_963810 ?auto_963814 ) ) ( not ( = ?auto_963810 ?auto_963815 ) ) ( not ( = ?auto_963810 ?auto_963818 ) ) ( not ( = ?auto_963812 ?auto_963811 ) ) ( not ( = ?auto_963812 ?auto_963813 ) ) ( not ( = ?auto_963812 ?auto_963814 ) ) ( not ( = ?auto_963812 ?auto_963815 ) ) ( not ( = ?auto_963812 ?auto_963818 ) ) ( not ( = ?auto_963811 ?auto_963813 ) ) ( not ( = ?auto_963811 ?auto_963814 ) ) ( not ( = ?auto_963811 ?auto_963815 ) ) ( not ( = ?auto_963811 ?auto_963818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963813 ?auto_963814 ?auto_963815 )
      ( MAKE-9CRATE-VERIFY ?auto_963807 ?auto_963808 ?auto_963809 ?auto_963806 ?auto_963810 ?auto_963812 ?auto_963811 ?auto_963813 ?auto_963814 ?auto_963815 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_963823 - SURFACE
      ?auto_963824 - SURFACE
      ?auto_963825 - SURFACE
      ?auto_963822 - SURFACE
      ?auto_963826 - SURFACE
      ?auto_963828 - SURFACE
      ?auto_963827 - SURFACE
      ?auto_963829 - SURFACE
      ?auto_963830 - SURFACE
      ?auto_963831 - SURFACE
      ?auto_963832 - SURFACE
    )
    :vars
    (
      ?auto_963834 - HOIST
      ?auto_963833 - PLACE
      ?auto_963838 - PLACE
      ?auto_963837 - HOIST
      ?auto_963835 - SURFACE
      ?auto_963836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963834 ?auto_963833 ) ( IS-CRATE ?auto_963832 ) ( not ( = ?auto_963831 ?auto_963832 ) ) ( not ( = ?auto_963830 ?auto_963831 ) ) ( not ( = ?auto_963830 ?auto_963832 ) ) ( not ( = ?auto_963838 ?auto_963833 ) ) ( HOIST-AT ?auto_963837 ?auto_963838 ) ( not ( = ?auto_963834 ?auto_963837 ) ) ( SURFACE-AT ?auto_963832 ?auto_963838 ) ( ON ?auto_963832 ?auto_963835 ) ( CLEAR ?auto_963832 ) ( not ( = ?auto_963831 ?auto_963835 ) ) ( not ( = ?auto_963832 ?auto_963835 ) ) ( not ( = ?auto_963830 ?auto_963835 ) ) ( SURFACE-AT ?auto_963830 ?auto_963833 ) ( CLEAR ?auto_963830 ) ( IS-CRATE ?auto_963831 ) ( AVAILABLE ?auto_963834 ) ( TRUCK-AT ?auto_963836 ?auto_963838 ) ( LIFTING ?auto_963837 ?auto_963831 ) ( ON ?auto_963824 ?auto_963823 ) ( ON ?auto_963825 ?auto_963824 ) ( ON ?auto_963822 ?auto_963825 ) ( ON ?auto_963826 ?auto_963822 ) ( ON ?auto_963828 ?auto_963826 ) ( ON ?auto_963827 ?auto_963828 ) ( ON ?auto_963829 ?auto_963827 ) ( ON ?auto_963830 ?auto_963829 ) ( not ( = ?auto_963823 ?auto_963824 ) ) ( not ( = ?auto_963823 ?auto_963825 ) ) ( not ( = ?auto_963823 ?auto_963822 ) ) ( not ( = ?auto_963823 ?auto_963826 ) ) ( not ( = ?auto_963823 ?auto_963828 ) ) ( not ( = ?auto_963823 ?auto_963827 ) ) ( not ( = ?auto_963823 ?auto_963829 ) ) ( not ( = ?auto_963823 ?auto_963830 ) ) ( not ( = ?auto_963823 ?auto_963831 ) ) ( not ( = ?auto_963823 ?auto_963832 ) ) ( not ( = ?auto_963823 ?auto_963835 ) ) ( not ( = ?auto_963824 ?auto_963825 ) ) ( not ( = ?auto_963824 ?auto_963822 ) ) ( not ( = ?auto_963824 ?auto_963826 ) ) ( not ( = ?auto_963824 ?auto_963828 ) ) ( not ( = ?auto_963824 ?auto_963827 ) ) ( not ( = ?auto_963824 ?auto_963829 ) ) ( not ( = ?auto_963824 ?auto_963830 ) ) ( not ( = ?auto_963824 ?auto_963831 ) ) ( not ( = ?auto_963824 ?auto_963832 ) ) ( not ( = ?auto_963824 ?auto_963835 ) ) ( not ( = ?auto_963825 ?auto_963822 ) ) ( not ( = ?auto_963825 ?auto_963826 ) ) ( not ( = ?auto_963825 ?auto_963828 ) ) ( not ( = ?auto_963825 ?auto_963827 ) ) ( not ( = ?auto_963825 ?auto_963829 ) ) ( not ( = ?auto_963825 ?auto_963830 ) ) ( not ( = ?auto_963825 ?auto_963831 ) ) ( not ( = ?auto_963825 ?auto_963832 ) ) ( not ( = ?auto_963825 ?auto_963835 ) ) ( not ( = ?auto_963822 ?auto_963826 ) ) ( not ( = ?auto_963822 ?auto_963828 ) ) ( not ( = ?auto_963822 ?auto_963827 ) ) ( not ( = ?auto_963822 ?auto_963829 ) ) ( not ( = ?auto_963822 ?auto_963830 ) ) ( not ( = ?auto_963822 ?auto_963831 ) ) ( not ( = ?auto_963822 ?auto_963832 ) ) ( not ( = ?auto_963822 ?auto_963835 ) ) ( not ( = ?auto_963826 ?auto_963828 ) ) ( not ( = ?auto_963826 ?auto_963827 ) ) ( not ( = ?auto_963826 ?auto_963829 ) ) ( not ( = ?auto_963826 ?auto_963830 ) ) ( not ( = ?auto_963826 ?auto_963831 ) ) ( not ( = ?auto_963826 ?auto_963832 ) ) ( not ( = ?auto_963826 ?auto_963835 ) ) ( not ( = ?auto_963828 ?auto_963827 ) ) ( not ( = ?auto_963828 ?auto_963829 ) ) ( not ( = ?auto_963828 ?auto_963830 ) ) ( not ( = ?auto_963828 ?auto_963831 ) ) ( not ( = ?auto_963828 ?auto_963832 ) ) ( not ( = ?auto_963828 ?auto_963835 ) ) ( not ( = ?auto_963827 ?auto_963829 ) ) ( not ( = ?auto_963827 ?auto_963830 ) ) ( not ( = ?auto_963827 ?auto_963831 ) ) ( not ( = ?auto_963827 ?auto_963832 ) ) ( not ( = ?auto_963827 ?auto_963835 ) ) ( not ( = ?auto_963829 ?auto_963830 ) ) ( not ( = ?auto_963829 ?auto_963831 ) ) ( not ( = ?auto_963829 ?auto_963832 ) ) ( not ( = ?auto_963829 ?auto_963835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963830 ?auto_963831 ?auto_963832 )
      ( MAKE-10CRATE-VERIFY ?auto_963823 ?auto_963824 ?auto_963825 ?auto_963822 ?auto_963826 ?auto_963828 ?auto_963827 ?auto_963829 ?auto_963830 ?auto_963831 ?auto_963832 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_963840 - SURFACE
      ?auto_963841 - SURFACE
      ?auto_963842 - SURFACE
      ?auto_963839 - SURFACE
      ?auto_963843 - SURFACE
      ?auto_963845 - SURFACE
      ?auto_963844 - SURFACE
      ?auto_963846 - SURFACE
      ?auto_963847 - SURFACE
      ?auto_963848 - SURFACE
      ?auto_963849 - SURFACE
      ?auto_963850 - SURFACE
    )
    :vars
    (
      ?auto_963852 - HOIST
      ?auto_963851 - PLACE
      ?auto_963856 - PLACE
      ?auto_963855 - HOIST
      ?auto_963853 - SURFACE
      ?auto_963854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963852 ?auto_963851 ) ( IS-CRATE ?auto_963850 ) ( not ( = ?auto_963849 ?auto_963850 ) ) ( not ( = ?auto_963848 ?auto_963849 ) ) ( not ( = ?auto_963848 ?auto_963850 ) ) ( not ( = ?auto_963856 ?auto_963851 ) ) ( HOIST-AT ?auto_963855 ?auto_963856 ) ( not ( = ?auto_963852 ?auto_963855 ) ) ( SURFACE-AT ?auto_963850 ?auto_963856 ) ( ON ?auto_963850 ?auto_963853 ) ( CLEAR ?auto_963850 ) ( not ( = ?auto_963849 ?auto_963853 ) ) ( not ( = ?auto_963850 ?auto_963853 ) ) ( not ( = ?auto_963848 ?auto_963853 ) ) ( SURFACE-AT ?auto_963848 ?auto_963851 ) ( CLEAR ?auto_963848 ) ( IS-CRATE ?auto_963849 ) ( AVAILABLE ?auto_963852 ) ( TRUCK-AT ?auto_963854 ?auto_963856 ) ( LIFTING ?auto_963855 ?auto_963849 ) ( ON ?auto_963841 ?auto_963840 ) ( ON ?auto_963842 ?auto_963841 ) ( ON ?auto_963839 ?auto_963842 ) ( ON ?auto_963843 ?auto_963839 ) ( ON ?auto_963845 ?auto_963843 ) ( ON ?auto_963844 ?auto_963845 ) ( ON ?auto_963846 ?auto_963844 ) ( ON ?auto_963847 ?auto_963846 ) ( ON ?auto_963848 ?auto_963847 ) ( not ( = ?auto_963840 ?auto_963841 ) ) ( not ( = ?auto_963840 ?auto_963842 ) ) ( not ( = ?auto_963840 ?auto_963839 ) ) ( not ( = ?auto_963840 ?auto_963843 ) ) ( not ( = ?auto_963840 ?auto_963845 ) ) ( not ( = ?auto_963840 ?auto_963844 ) ) ( not ( = ?auto_963840 ?auto_963846 ) ) ( not ( = ?auto_963840 ?auto_963847 ) ) ( not ( = ?auto_963840 ?auto_963848 ) ) ( not ( = ?auto_963840 ?auto_963849 ) ) ( not ( = ?auto_963840 ?auto_963850 ) ) ( not ( = ?auto_963840 ?auto_963853 ) ) ( not ( = ?auto_963841 ?auto_963842 ) ) ( not ( = ?auto_963841 ?auto_963839 ) ) ( not ( = ?auto_963841 ?auto_963843 ) ) ( not ( = ?auto_963841 ?auto_963845 ) ) ( not ( = ?auto_963841 ?auto_963844 ) ) ( not ( = ?auto_963841 ?auto_963846 ) ) ( not ( = ?auto_963841 ?auto_963847 ) ) ( not ( = ?auto_963841 ?auto_963848 ) ) ( not ( = ?auto_963841 ?auto_963849 ) ) ( not ( = ?auto_963841 ?auto_963850 ) ) ( not ( = ?auto_963841 ?auto_963853 ) ) ( not ( = ?auto_963842 ?auto_963839 ) ) ( not ( = ?auto_963842 ?auto_963843 ) ) ( not ( = ?auto_963842 ?auto_963845 ) ) ( not ( = ?auto_963842 ?auto_963844 ) ) ( not ( = ?auto_963842 ?auto_963846 ) ) ( not ( = ?auto_963842 ?auto_963847 ) ) ( not ( = ?auto_963842 ?auto_963848 ) ) ( not ( = ?auto_963842 ?auto_963849 ) ) ( not ( = ?auto_963842 ?auto_963850 ) ) ( not ( = ?auto_963842 ?auto_963853 ) ) ( not ( = ?auto_963839 ?auto_963843 ) ) ( not ( = ?auto_963839 ?auto_963845 ) ) ( not ( = ?auto_963839 ?auto_963844 ) ) ( not ( = ?auto_963839 ?auto_963846 ) ) ( not ( = ?auto_963839 ?auto_963847 ) ) ( not ( = ?auto_963839 ?auto_963848 ) ) ( not ( = ?auto_963839 ?auto_963849 ) ) ( not ( = ?auto_963839 ?auto_963850 ) ) ( not ( = ?auto_963839 ?auto_963853 ) ) ( not ( = ?auto_963843 ?auto_963845 ) ) ( not ( = ?auto_963843 ?auto_963844 ) ) ( not ( = ?auto_963843 ?auto_963846 ) ) ( not ( = ?auto_963843 ?auto_963847 ) ) ( not ( = ?auto_963843 ?auto_963848 ) ) ( not ( = ?auto_963843 ?auto_963849 ) ) ( not ( = ?auto_963843 ?auto_963850 ) ) ( not ( = ?auto_963843 ?auto_963853 ) ) ( not ( = ?auto_963845 ?auto_963844 ) ) ( not ( = ?auto_963845 ?auto_963846 ) ) ( not ( = ?auto_963845 ?auto_963847 ) ) ( not ( = ?auto_963845 ?auto_963848 ) ) ( not ( = ?auto_963845 ?auto_963849 ) ) ( not ( = ?auto_963845 ?auto_963850 ) ) ( not ( = ?auto_963845 ?auto_963853 ) ) ( not ( = ?auto_963844 ?auto_963846 ) ) ( not ( = ?auto_963844 ?auto_963847 ) ) ( not ( = ?auto_963844 ?auto_963848 ) ) ( not ( = ?auto_963844 ?auto_963849 ) ) ( not ( = ?auto_963844 ?auto_963850 ) ) ( not ( = ?auto_963844 ?auto_963853 ) ) ( not ( = ?auto_963846 ?auto_963847 ) ) ( not ( = ?auto_963846 ?auto_963848 ) ) ( not ( = ?auto_963846 ?auto_963849 ) ) ( not ( = ?auto_963846 ?auto_963850 ) ) ( not ( = ?auto_963846 ?auto_963853 ) ) ( not ( = ?auto_963847 ?auto_963848 ) ) ( not ( = ?auto_963847 ?auto_963849 ) ) ( not ( = ?auto_963847 ?auto_963850 ) ) ( not ( = ?auto_963847 ?auto_963853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963848 ?auto_963849 ?auto_963850 )
      ( MAKE-11CRATE-VERIFY ?auto_963840 ?auto_963841 ?auto_963842 ?auto_963839 ?auto_963843 ?auto_963845 ?auto_963844 ?auto_963846 ?auto_963847 ?auto_963848 ?auto_963849 ?auto_963850 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_963858 - SURFACE
      ?auto_963859 - SURFACE
      ?auto_963860 - SURFACE
      ?auto_963857 - SURFACE
      ?auto_963861 - SURFACE
      ?auto_963863 - SURFACE
      ?auto_963862 - SURFACE
      ?auto_963864 - SURFACE
      ?auto_963865 - SURFACE
      ?auto_963866 - SURFACE
      ?auto_963867 - SURFACE
      ?auto_963868 - SURFACE
      ?auto_963869 - SURFACE
    )
    :vars
    (
      ?auto_963871 - HOIST
      ?auto_963870 - PLACE
      ?auto_963875 - PLACE
      ?auto_963874 - HOIST
      ?auto_963872 - SURFACE
      ?auto_963873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963871 ?auto_963870 ) ( IS-CRATE ?auto_963869 ) ( not ( = ?auto_963868 ?auto_963869 ) ) ( not ( = ?auto_963867 ?auto_963868 ) ) ( not ( = ?auto_963867 ?auto_963869 ) ) ( not ( = ?auto_963875 ?auto_963870 ) ) ( HOIST-AT ?auto_963874 ?auto_963875 ) ( not ( = ?auto_963871 ?auto_963874 ) ) ( SURFACE-AT ?auto_963869 ?auto_963875 ) ( ON ?auto_963869 ?auto_963872 ) ( CLEAR ?auto_963869 ) ( not ( = ?auto_963868 ?auto_963872 ) ) ( not ( = ?auto_963869 ?auto_963872 ) ) ( not ( = ?auto_963867 ?auto_963872 ) ) ( SURFACE-AT ?auto_963867 ?auto_963870 ) ( CLEAR ?auto_963867 ) ( IS-CRATE ?auto_963868 ) ( AVAILABLE ?auto_963871 ) ( TRUCK-AT ?auto_963873 ?auto_963875 ) ( LIFTING ?auto_963874 ?auto_963868 ) ( ON ?auto_963859 ?auto_963858 ) ( ON ?auto_963860 ?auto_963859 ) ( ON ?auto_963857 ?auto_963860 ) ( ON ?auto_963861 ?auto_963857 ) ( ON ?auto_963863 ?auto_963861 ) ( ON ?auto_963862 ?auto_963863 ) ( ON ?auto_963864 ?auto_963862 ) ( ON ?auto_963865 ?auto_963864 ) ( ON ?auto_963866 ?auto_963865 ) ( ON ?auto_963867 ?auto_963866 ) ( not ( = ?auto_963858 ?auto_963859 ) ) ( not ( = ?auto_963858 ?auto_963860 ) ) ( not ( = ?auto_963858 ?auto_963857 ) ) ( not ( = ?auto_963858 ?auto_963861 ) ) ( not ( = ?auto_963858 ?auto_963863 ) ) ( not ( = ?auto_963858 ?auto_963862 ) ) ( not ( = ?auto_963858 ?auto_963864 ) ) ( not ( = ?auto_963858 ?auto_963865 ) ) ( not ( = ?auto_963858 ?auto_963866 ) ) ( not ( = ?auto_963858 ?auto_963867 ) ) ( not ( = ?auto_963858 ?auto_963868 ) ) ( not ( = ?auto_963858 ?auto_963869 ) ) ( not ( = ?auto_963858 ?auto_963872 ) ) ( not ( = ?auto_963859 ?auto_963860 ) ) ( not ( = ?auto_963859 ?auto_963857 ) ) ( not ( = ?auto_963859 ?auto_963861 ) ) ( not ( = ?auto_963859 ?auto_963863 ) ) ( not ( = ?auto_963859 ?auto_963862 ) ) ( not ( = ?auto_963859 ?auto_963864 ) ) ( not ( = ?auto_963859 ?auto_963865 ) ) ( not ( = ?auto_963859 ?auto_963866 ) ) ( not ( = ?auto_963859 ?auto_963867 ) ) ( not ( = ?auto_963859 ?auto_963868 ) ) ( not ( = ?auto_963859 ?auto_963869 ) ) ( not ( = ?auto_963859 ?auto_963872 ) ) ( not ( = ?auto_963860 ?auto_963857 ) ) ( not ( = ?auto_963860 ?auto_963861 ) ) ( not ( = ?auto_963860 ?auto_963863 ) ) ( not ( = ?auto_963860 ?auto_963862 ) ) ( not ( = ?auto_963860 ?auto_963864 ) ) ( not ( = ?auto_963860 ?auto_963865 ) ) ( not ( = ?auto_963860 ?auto_963866 ) ) ( not ( = ?auto_963860 ?auto_963867 ) ) ( not ( = ?auto_963860 ?auto_963868 ) ) ( not ( = ?auto_963860 ?auto_963869 ) ) ( not ( = ?auto_963860 ?auto_963872 ) ) ( not ( = ?auto_963857 ?auto_963861 ) ) ( not ( = ?auto_963857 ?auto_963863 ) ) ( not ( = ?auto_963857 ?auto_963862 ) ) ( not ( = ?auto_963857 ?auto_963864 ) ) ( not ( = ?auto_963857 ?auto_963865 ) ) ( not ( = ?auto_963857 ?auto_963866 ) ) ( not ( = ?auto_963857 ?auto_963867 ) ) ( not ( = ?auto_963857 ?auto_963868 ) ) ( not ( = ?auto_963857 ?auto_963869 ) ) ( not ( = ?auto_963857 ?auto_963872 ) ) ( not ( = ?auto_963861 ?auto_963863 ) ) ( not ( = ?auto_963861 ?auto_963862 ) ) ( not ( = ?auto_963861 ?auto_963864 ) ) ( not ( = ?auto_963861 ?auto_963865 ) ) ( not ( = ?auto_963861 ?auto_963866 ) ) ( not ( = ?auto_963861 ?auto_963867 ) ) ( not ( = ?auto_963861 ?auto_963868 ) ) ( not ( = ?auto_963861 ?auto_963869 ) ) ( not ( = ?auto_963861 ?auto_963872 ) ) ( not ( = ?auto_963863 ?auto_963862 ) ) ( not ( = ?auto_963863 ?auto_963864 ) ) ( not ( = ?auto_963863 ?auto_963865 ) ) ( not ( = ?auto_963863 ?auto_963866 ) ) ( not ( = ?auto_963863 ?auto_963867 ) ) ( not ( = ?auto_963863 ?auto_963868 ) ) ( not ( = ?auto_963863 ?auto_963869 ) ) ( not ( = ?auto_963863 ?auto_963872 ) ) ( not ( = ?auto_963862 ?auto_963864 ) ) ( not ( = ?auto_963862 ?auto_963865 ) ) ( not ( = ?auto_963862 ?auto_963866 ) ) ( not ( = ?auto_963862 ?auto_963867 ) ) ( not ( = ?auto_963862 ?auto_963868 ) ) ( not ( = ?auto_963862 ?auto_963869 ) ) ( not ( = ?auto_963862 ?auto_963872 ) ) ( not ( = ?auto_963864 ?auto_963865 ) ) ( not ( = ?auto_963864 ?auto_963866 ) ) ( not ( = ?auto_963864 ?auto_963867 ) ) ( not ( = ?auto_963864 ?auto_963868 ) ) ( not ( = ?auto_963864 ?auto_963869 ) ) ( not ( = ?auto_963864 ?auto_963872 ) ) ( not ( = ?auto_963865 ?auto_963866 ) ) ( not ( = ?auto_963865 ?auto_963867 ) ) ( not ( = ?auto_963865 ?auto_963868 ) ) ( not ( = ?auto_963865 ?auto_963869 ) ) ( not ( = ?auto_963865 ?auto_963872 ) ) ( not ( = ?auto_963866 ?auto_963867 ) ) ( not ( = ?auto_963866 ?auto_963868 ) ) ( not ( = ?auto_963866 ?auto_963869 ) ) ( not ( = ?auto_963866 ?auto_963872 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963867 ?auto_963868 ?auto_963869 )
      ( MAKE-12CRATE-VERIFY ?auto_963858 ?auto_963859 ?auto_963860 ?auto_963857 ?auto_963861 ?auto_963863 ?auto_963862 ?auto_963864 ?auto_963865 ?auto_963866 ?auto_963867 ?auto_963868 ?auto_963869 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_963877 - SURFACE
      ?auto_963878 - SURFACE
      ?auto_963879 - SURFACE
      ?auto_963876 - SURFACE
      ?auto_963880 - SURFACE
      ?auto_963882 - SURFACE
      ?auto_963881 - SURFACE
      ?auto_963883 - SURFACE
      ?auto_963884 - SURFACE
      ?auto_963885 - SURFACE
      ?auto_963886 - SURFACE
      ?auto_963887 - SURFACE
      ?auto_963888 - SURFACE
      ?auto_963889 - SURFACE
    )
    :vars
    (
      ?auto_963891 - HOIST
      ?auto_963890 - PLACE
      ?auto_963895 - PLACE
      ?auto_963894 - HOIST
      ?auto_963892 - SURFACE
      ?auto_963893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_963891 ?auto_963890 ) ( IS-CRATE ?auto_963889 ) ( not ( = ?auto_963888 ?auto_963889 ) ) ( not ( = ?auto_963887 ?auto_963888 ) ) ( not ( = ?auto_963887 ?auto_963889 ) ) ( not ( = ?auto_963895 ?auto_963890 ) ) ( HOIST-AT ?auto_963894 ?auto_963895 ) ( not ( = ?auto_963891 ?auto_963894 ) ) ( SURFACE-AT ?auto_963889 ?auto_963895 ) ( ON ?auto_963889 ?auto_963892 ) ( CLEAR ?auto_963889 ) ( not ( = ?auto_963888 ?auto_963892 ) ) ( not ( = ?auto_963889 ?auto_963892 ) ) ( not ( = ?auto_963887 ?auto_963892 ) ) ( SURFACE-AT ?auto_963887 ?auto_963890 ) ( CLEAR ?auto_963887 ) ( IS-CRATE ?auto_963888 ) ( AVAILABLE ?auto_963891 ) ( TRUCK-AT ?auto_963893 ?auto_963895 ) ( LIFTING ?auto_963894 ?auto_963888 ) ( ON ?auto_963878 ?auto_963877 ) ( ON ?auto_963879 ?auto_963878 ) ( ON ?auto_963876 ?auto_963879 ) ( ON ?auto_963880 ?auto_963876 ) ( ON ?auto_963882 ?auto_963880 ) ( ON ?auto_963881 ?auto_963882 ) ( ON ?auto_963883 ?auto_963881 ) ( ON ?auto_963884 ?auto_963883 ) ( ON ?auto_963885 ?auto_963884 ) ( ON ?auto_963886 ?auto_963885 ) ( ON ?auto_963887 ?auto_963886 ) ( not ( = ?auto_963877 ?auto_963878 ) ) ( not ( = ?auto_963877 ?auto_963879 ) ) ( not ( = ?auto_963877 ?auto_963876 ) ) ( not ( = ?auto_963877 ?auto_963880 ) ) ( not ( = ?auto_963877 ?auto_963882 ) ) ( not ( = ?auto_963877 ?auto_963881 ) ) ( not ( = ?auto_963877 ?auto_963883 ) ) ( not ( = ?auto_963877 ?auto_963884 ) ) ( not ( = ?auto_963877 ?auto_963885 ) ) ( not ( = ?auto_963877 ?auto_963886 ) ) ( not ( = ?auto_963877 ?auto_963887 ) ) ( not ( = ?auto_963877 ?auto_963888 ) ) ( not ( = ?auto_963877 ?auto_963889 ) ) ( not ( = ?auto_963877 ?auto_963892 ) ) ( not ( = ?auto_963878 ?auto_963879 ) ) ( not ( = ?auto_963878 ?auto_963876 ) ) ( not ( = ?auto_963878 ?auto_963880 ) ) ( not ( = ?auto_963878 ?auto_963882 ) ) ( not ( = ?auto_963878 ?auto_963881 ) ) ( not ( = ?auto_963878 ?auto_963883 ) ) ( not ( = ?auto_963878 ?auto_963884 ) ) ( not ( = ?auto_963878 ?auto_963885 ) ) ( not ( = ?auto_963878 ?auto_963886 ) ) ( not ( = ?auto_963878 ?auto_963887 ) ) ( not ( = ?auto_963878 ?auto_963888 ) ) ( not ( = ?auto_963878 ?auto_963889 ) ) ( not ( = ?auto_963878 ?auto_963892 ) ) ( not ( = ?auto_963879 ?auto_963876 ) ) ( not ( = ?auto_963879 ?auto_963880 ) ) ( not ( = ?auto_963879 ?auto_963882 ) ) ( not ( = ?auto_963879 ?auto_963881 ) ) ( not ( = ?auto_963879 ?auto_963883 ) ) ( not ( = ?auto_963879 ?auto_963884 ) ) ( not ( = ?auto_963879 ?auto_963885 ) ) ( not ( = ?auto_963879 ?auto_963886 ) ) ( not ( = ?auto_963879 ?auto_963887 ) ) ( not ( = ?auto_963879 ?auto_963888 ) ) ( not ( = ?auto_963879 ?auto_963889 ) ) ( not ( = ?auto_963879 ?auto_963892 ) ) ( not ( = ?auto_963876 ?auto_963880 ) ) ( not ( = ?auto_963876 ?auto_963882 ) ) ( not ( = ?auto_963876 ?auto_963881 ) ) ( not ( = ?auto_963876 ?auto_963883 ) ) ( not ( = ?auto_963876 ?auto_963884 ) ) ( not ( = ?auto_963876 ?auto_963885 ) ) ( not ( = ?auto_963876 ?auto_963886 ) ) ( not ( = ?auto_963876 ?auto_963887 ) ) ( not ( = ?auto_963876 ?auto_963888 ) ) ( not ( = ?auto_963876 ?auto_963889 ) ) ( not ( = ?auto_963876 ?auto_963892 ) ) ( not ( = ?auto_963880 ?auto_963882 ) ) ( not ( = ?auto_963880 ?auto_963881 ) ) ( not ( = ?auto_963880 ?auto_963883 ) ) ( not ( = ?auto_963880 ?auto_963884 ) ) ( not ( = ?auto_963880 ?auto_963885 ) ) ( not ( = ?auto_963880 ?auto_963886 ) ) ( not ( = ?auto_963880 ?auto_963887 ) ) ( not ( = ?auto_963880 ?auto_963888 ) ) ( not ( = ?auto_963880 ?auto_963889 ) ) ( not ( = ?auto_963880 ?auto_963892 ) ) ( not ( = ?auto_963882 ?auto_963881 ) ) ( not ( = ?auto_963882 ?auto_963883 ) ) ( not ( = ?auto_963882 ?auto_963884 ) ) ( not ( = ?auto_963882 ?auto_963885 ) ) ( not ( = ?auto_963882 ?auto_963886 ) ) ( not ( = ?auto_963882 ?auto_963887 ) ) ( not ( = ?auto_963882 ?auto_963888 ) ) ( not ( = ?auto_963882 ?auto_963889 ) ) ( not ( = ?auto_963882 ?auto_963892 ) ) ( not ( = ?auto_963881 ?auto_963883 ) ) ( not ( = ?auto_963881 ?auto_963884 ) ) ( not ( = ?auto_963881 ?auto_963885 ) ) ( not ( = ?auto_963881 ?auto_963886 ) ) ( not ( = ?auto_963881 ?auto_963887 ) ) ( not ( = ?auto_963881 ?auto_963888 ) ) ( not ( = ?auto_963881 ?auto_963889 ) ) ( not ( = ?auto_963881 ?auto_963892 ) ) ( not ( = ?auto_963883 ?auto_963884 ) ) ( not ( = ?auto_963883 ?auto_963885 ) ) ( not ( = ?auto_963883 ?auto_963886 ) ) ( not ( = ?auto_963883 ?auto_963887 ) ) ( not ( = ?auto_963883 ?auto_963888 ) ) ( not ( = ?auto_963883 ?auto_963889 ) ) ( not ( = ?auto_963883 ?auto_963892 ) ) ( not ( = ?auto_963884 ?auto_963885 ) ) ( not ( = ?auto_963884 ?auto_963886 ) ) ( not ( = ?auto_963884 ?auto_963887 ) ) ( not ( = ?auto_963884 ?auto_963888 ) ) ( not ( = ?auto_963884 ?auto_963889 ) ) ( not ( = ?auto_963884 ?auto_963892 ) ) ( not ( = ?auto_963885 ?auto_963886 ) ) ( not ( = ?auto_963885 ?auto_963887 ) ) ( not ( = ?auto_963885 ?auto_963888 ) ) ( not ( = ?auto_963885 ?auto_963889 ) ) ( not ( = ?auto_963885 ?auto_963892 ) ) ( not ( = ?auto_963886 ?auto_963887 ) ) ( not ( = ?auto_963886 ?auto_963888 ) ) ( not ( = ?auto_963886 ?auto_963889 ) ) ( not ( = ?auto_963886 ?auto_963892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963887 ?auto_963888 ?auto_963889 )
      ( MAKE-13CRATE-VERIFY ?auto_963877 ?auto_963878 ?auto_963879 ?auto_963876 ?auto_963880 ?auto_963882 ?auto_963881 ?auto_963883 ?auto_963884 ?auto_963885 ?auto_963886 ?auto_963887 ?auto_963888 ?auto_963889 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_963896 - SURFACE
      ?auto_963897 - SURFACE
    )
    :vars
    (
      ?auto_963899 - HOIST
      ?auto_963898 - PLACE
      ?auto_963903 - SURFACE
      ?auto_963904 - PLACE
      ?auto_963902 - HOIST
      ?auto_963900 - SURFACE
      ?auto_963901 - TRUCK
      ?auto_963905 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_963899 ?auto_963898 ) ( IS-CRATE ?auto_963897 ) ( not ( = ?auto_963896 ?auto_963897 ) ) ( not ( = ?auto_963903 ?auto_963896 ) ) ( not ( = ?auto_963903 ?auto_963897 ) ) ( not ( = ?auto_963904 ?auto_963898 ) ) ( HOIST-AT ?auto_963902 ?auto_963904 ) ( not ( = ?auto_963899 ?auto_963902 ) ) ( SURFACE-AT ?auto_963897 ?auto_963904 ) ( ON ?auto_963897 ?auto_963900 ) ( CLEAR ?auto_963897 ) ( not ( = ?auto_963896 ?auto_963900 ) ) ( not ( = ?auto_963897 ?auto_963900 ) ) ( not ( = ?auto_963903 ?auto_963900 ) ) ( SURFACE-AT ?auto_963903 ?auto_963898 ) ( CLEAR ?auto_963903 ) ( IS-CRATE ?auto_963896 ) ( AVAILABLE ?auto_963899 ) ( TRUCK-AT ?auto_963901 ?auto_963904 ) ( AVAILABLE ?auto_963902 ) ( SURFACE-AT ?auto_963896 ?auto_963904 ) ( ON ?auto_963896 ?auto_963905 ) ( CLEAR ?auto_963896 ) ( not ( = ?auto_963896 ?auto_963905 ) ) ( not ( = ?auto_963897 ?auto_963905 ) ) ( not ( = ?auto_963903 ?auto_963905 ) ) ( not ( = ?auto_963900 ?auto_963905 ) ) )
    :subtasks
    ( ( !LIFT ?auto_963902 ?auto_963896 ?auto_963905 ?auto_963904 )
      ( MAKE-2CRATE ?auto_963903 ?auto_963896 ?auto_963897 )
      ( MAKE-1CRATE-VERIFY ?auto_963896 ?auto_963897 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_963906 - SURFACE
      ?auto_963907 - SURFACE
      ?auto_963908 - SURFACE
    )
    :vars
    (
      ?auto_963914 - HOIST
      ?auto_963912 - PLACE
      ?auto_963910 - PLACE
      ?auto_963913 - HOIST
      ?auto_963909 - SURFACE
      ?auto_963915 - TRUCK
      ?auto_963911 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_963914 ?auto_963912 ) ( IS-CRATE ?auto_963908 ) ( not ( = ?auto_963907 ?auto_963908 ) ) ( not ( = ?auto_963906 ?auto_963907 ) ) ( not ( = ?auto_963906 ?auto_963908 ) ) ( not ( = ?auto_963910 ?auto_963912 ) ) ( HOIST-AT ?auto_963913 ?auto_963910 ) ( not ( = ?auto_963914 ?auto_963913 ) ) ( SURFACE-AT ?auto_963908 ?auto_963910 ) ( ON ?auto_963908 ?auto_963909 ) ( CLEAR ?auto_963908 ) ( not ( = ?auto_963907 ?auto_963909 ) ) ( not ( = ?auto_963908 ?auto_963909 ) ) ( not ( = ?auto_963906 ?auto_963909 ) ) ( SURFACE-AT ?auto_963906 ?auto_963912 ) ( CLEAR ?auto_963906 ) ( IS-CRATE ?auto_963907 ) ( AVAILABLE ?auto_963914 ) ( TRUCK-AT ?auto_963915 ?auto_963910 ) ( AVAILABLE ?auto_963913 ) ( SURFACE-AT ?auto_963907 ?auto_963910 ) ( ON ?auto_963907 ?auto_963911 ) ( CLEAR ?auto_963907 ) ( not ( = ?auto_963907 ?auto_963911 ) ) ( not ( = ?auto_963908 ?auto_963911 ) ) ( not ( = ?auto_963906 ?auto_963911 ) ) ( not ( = ?auto_963909 ?auto_963911 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_963907 ?auto_963908 )
      ( MAKE-2CRATE-VERIFY ?auto_963906 ?auto_963907 ?auto_963908 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_963917 - SURFACE
      ?auto_963918 - SURFACE
      ?auto_963919 - SURFACE
      ?auto_963916 - SURFACE
    )
    :vars
    (
      ?auto_963923 - HOIST
      ?auto_963922 - PLACE
      ?auto_963924 - PLACE
      ?auto_963925 - HOIST
      ?auto_963920 - SURFACE
      ?auto_963926 - TRUCK
      ?auto_963921 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_963923 ?auto_963922 ) ( IS-CRATE ?auto_963916 ) ( not ( = ?auto_963919 ?auto_963916 ) ) ( not ( = ?auto_963918 ?auto_963919 ) ) ( not ( = ?auto_963918 ?auto_963916 ) ) ( not ( = ?auto_963924 ?auto_963922 ) ) ( HOIST-AT ?auto_963925 ?auto_963924 ) ( not ( = ?auto_963923 ?auto_963925 ) ) ( SURFACE-AT ?auto_963916 ?auto_963924 ) ( ON ?auto_963916 ?auto_963920 ) ( CLEAR ?auto_963916 ) ( not ( = ?auto_963919 ?auto_963920 ) ) ( not ( = ?auto_963916 ?auto_963920 ) ) ( not ( = ?auto_963918 ?auto_963920 ) ) ( SURFACE-AT ?auto_963918 ?auto_963922 ) ( CLEAR ?auto_963918 ) ( IS-CRATE ?auto_963919 ) ( AVAILABLE ?auto_963923 ) ( TRUCK-AT ?auto_963926 ?auto_963924 ) ( AVAILABLE ?auto_963925 ) ( SURFACE-AT ?auto_963919 ?auto_963924 ) ( ON ?auto_963919 ?auto_963921 ) ( CLEAR ?auto_963919 ) ( not ( = ?auto_963919 ?auto_963921 ) ) ( not ( = ?auto_963916 ?auto_963921 ) ) ( not ( = ?auto_963918 ?auto_963921 ) ) ( not ( = ?auto_963920 ?auto_963921 ) ) ( ON ?auto_963918 ?auto_963917 ) ( not ( = ?auto_963917 ?auto_963918 ) ) ( not ( = ?auto_963917 ?auto_963919 ) ) ( not ( = ?auto_963917 ?auto_963916 ) ) ( not ( = ?auto_963917 ?auto_963920 ) ) ( not ( = ?auto_963917 ?auto_963921 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963918 ?auto_963919 ?auto_963916 )
      ( MAKE-3CRATE-VERIFY ?auto_963917 ?auto_963918 ?auto_963919 ?auto_963916 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_963928 - SURFACE
      ?auto_963929 - SURFACE
      ?auto_963930 - SURFACE
      ?auto_963927 - SURFACE
      ?auto_963931 - SURFACE
    )
    :vars
    (
      ?auto_963935 - HOIST
      ?auto_963934 - PLACE
      ?auto_963936 - PLACE
      ?auto_963937 - HOIST
      ?auto_963932 - SURFACE
      ?auto_963938 - TRUCK
      ?auto_963933 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_963935 ?auto_963934 ) ( IS-CRATE ?auto_963931 ) ( not ( = ?auto_963927 ?auto_963931 ) ) ( not ( = ?auto_963930 ?auto_963927 ) ) ( not ( = ?auto_963930 ?auto_963931 ) ) ( not ( = ?auto_963936 ?auto_963934 ) ) ( HOIST-AT ?auto_963937 ?auto_963936 ) ( not ( = ?auto_963935 ?auto_963937 ) ) ( SURFACE-AT ?auto_963931 ?auto_963936 ) ( ON ?auto_963931 ?auto_963932 ) ( CLEAR ?auto_963931 ) ( not ( = ?auto_963927 ?auto_963932 ) ) ( not ( = ?auto_963931 ?auto_963932 ) ) ( not ( = ?auto_963930 ?auto_963932 ) ) ( SURFACE-AT ?auto_963930 ?auto_963934 ) ( CLEAR ?auto_963930 ) ( IS-CRATE ?auto_963927 ) ( AVAILABLE ?auto_963935 ) ( TRUCK-AT ?auto_963938 ?auto_963936 ) ( AVAILABLE ?auto_963937 ) ( SURFACE-AT ?auto_963927 ?auto_963936 ) ( ON ?auto_963927 ?auto_963933 ) ( CLEAR ?auto_963927 ) ( not ( = ?auto_963927 ?auto_963933 ) ) ( not ( = ?auto_963931 ?auto_963933 ) ) ( not ( = ?auto_963930 ?auto_963933 ) ) ( not ( = ?auto_963932 ?auto_963933 ) ) ( ON ?auto_963929 ?auto_963928 ) ( ON ?auto_963930 ?auto_963929 ) ( not ( = ?auto_963928 ?auto_963929 ) ) ( not ( = ?auto_963928 ?auto_963930 ) ) ( not ( = ?auto_963928 ?auto_963927 ) ) ( not ( = ?auto_963928 ?auto_963931 ) ) ( not ( = ?auto_963928 ?auto_963932 ) ) ( not ( = ?auto_963928 ?auto_963933 ) ) ( not ( = ?auto_963929 ?auto_963930 ) ) ( not ( = ?auto_963929 ?auto_963927 ) ) ( not ( = ?auto_963929 ?auto_963931 ) ) ( not ( = ?auto_963929 ?auto_963932 ) ) ( not ( = ?auto_963929 ?auto_963933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963930 ?auto_963927 ?auto_963931 )
      ( MAKE-4CRATE-VERIFY ?auto_963928 ?auto_963929 ?auto_963930 ?auto_963927 ?auto_963931 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_963940 - SURFACE
      ?auto_963941 - SURFACE
      ?auto_963942 - SURFACE
      ?auto_963939 - SURFACE
      ?auto_963943 - SURFACE
      ?auto_963944 - SURFACE
    )
    :vars
    (
      ?auto_963948 - HOIST
      ?auto_963947 - PLACE
      ?auto_963949 - PLACE
      ?auto_963950 - HOIST
      ?auto_963945 - SURFACE
      ?auto_963951 - TRUCK
      ?auto_963946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_963948 ?auto_963947 ) ( IS-CRATE ?auto_963944 ) ( not ( = ?auto_963943 ?auto_963944 ) ) ( not ( = ?auto_963939 ?auto_963943 ) ) ( not ( = ?auto_963939 ?auto_963944 ) ) ( not ( = ?auto_963949 ?auto_963947 ) ) ( HOIST-AT ?auto_963950 ?auto_963949 ) ( not ( = ?auto_963948 ?auto_963950 ) ) ( SURFACE-AT ?auto_963944 ?auto_963949 ) ( ON ?auto_963944 ?auto_963945 ) ( CLEAR ?auto_963944 ) ( not ( = ?auto_963943 ?auto_963945 ) ) ( not ( = ?auto_963944 ?auto_963945 ) ) ( not ( = ?auto_963939 ?auto_963945 ) ) ( SURFACE-AT ?auto_963939 ?auto_963947 ) ( CLEAR ?auto_963939 ) ( IS-CRATE ?auto_963943 ) ( AVAILABLE ?auto_963948 ) ( TRUCK-AT ?auto_963951 ?auto_963949 ) ( AVAILABLE ?auto_963950 ) ( SURFACE-AT ?auto_963943 ?auto_963949 ) ( ON ?auto_963943 ?auto_963946 ) ( CLEAR ?auto_963943 ) ( not ( = ?auto_963943 ?auto_963946 ) ) ( not ( = ?auto_963944 ?auto_963946 ) ) ( not ( = ?auto_963939 ?auto_963946 ) ) ( not ( = ?auto_963945 ?auto_963946 ) ) ( ON ?auto_963941 ?auto_963940 ) ( ON ?auto_963942 ?auto_963941 ) ( ON ?auto_963939 ?auto_963942 ) ( not ( = ?auto_963940 ?auto_963941 ) ) ( not ( = ?auto_963940 ?auto_963942 ) ) ( not ( = ?auto_963940 ?auto_963939 ) ) ( not ( = ?auto_963940 ?auto_963943 ) ) ( not ( = ?auto_963940 ?auto_963944 ) ) ( not ( = ?auto_963940 ?auto_963945 ) ) ( not ( = ?auto_963940 ?auto_963946 ) ) ( not ( = ?auto_963941 ?auto_963942 ) ) ( not ( = ?auto_963941 ?auto_963939 ) ) ( not ( = ?auto_963941 ?auto_963943 ) ) ( not ( = ?auto_963941 ?auto_963944 ) ) ( not ( = ?auto_963941 ?auto_963945 ) ) ( not ( = ?auto_963941 ?auto_963946 ) ) ( not ( = ?auto_963942 ?auto_963939 ) ) ( not ( = ?auto_963942 ?auto_963943 ) ) ( not ( = ?auto_963942 ?auto_963944 ) ) ( not ( = ?auto_963942 ?auto_963945 ) ) ( not ( = ?auto_963942 ?auto_963946 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963939 ?auto_963943 ?auto_963944 )
      ( MAKE-5CRATE-VERIFY ?auto_963940 ?auto_963941 ?auto_963942 ?auto_963939 ?auto_963943 ?auto_963944 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_963953 - SURFACE
      ?auto_963954 - SURFACE
      ?auto_963955 - SURFACE
      ?auto_963952 - SURFACE
      ?auto_963956 - SURFACE
      ?auto_963958 - SURFACE
      ?auto_963957 - SURFACE
    )
    :vars
    (
      ?auto_963962 - HOIST
      ?auto_963961 - PLACE
      ?auto_963963 - PLACE
      ?auto_963964 - HOIST
      ?auto_963959 - SURFACE
      ?auto_963965 - TRUCK
      ?auto_963960 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_963962 ?auto_963961 ) ( IS-CRATE ?auto_963957 ) ( not ( = ?auto_963958 ?auto_963957 ) ) ( not ( = ?auto_963956 ?auto_963958 ) ) ( not ( = ?auto_963956 ?auto_963957 ) ) ( not ( = ?auto_963963 ?auto_963961 ) ) ( HOIST-AT ?auto_963964 ?auto_963963 ) ( not ( = ?auto_963962 ?auto_963964 ) ) ( SURFACE-AT ?auto_963957 ?auto_963963 ) ( ON ?auto_963957 ?auto_963959 ) ( CLEAR ?auto_963957 ) ( not ( = ?auto_963958 ?auto_963959 ) ) ( not ( = ?auto_963957 ?auto_963959 ) ) ( not ( = ?auto_963956 ?auto_963959 ) ) ( SURFACE-AT ?auto_963956 ?auto_963961 ) ( CLEAR ?auto_963956 ) ( IS-CRATE ?auto_963958 ) ( AVAILABLE ?auto_963962 ) ( TRUCK-AT ?auto_963965 ?auto_963963 ) ( AVAILABLE ?auto_963964 ) ( SURFACE-AT ?auto_963958 ?auto_963963 ) ( ON ?auto_963958 ?auto_963960 ) ( CLEAR ?auto_963958 ) ( not ( = ?auto_963958 ?auto_963960 ) ) ( not ( = ?auto_963957 ?auto_963960 ) ) ( not ( = ?auto_963956 ?auto_963960 ) ) ( not ( = ?auto_963959 ?auto_963960 ) ) ( ON ?auto_963954 ?auto_963953 ) ( ON ?auto_963955 ?auto_963954 ) ( ON ?auto_963952 ?auto_963955 ) ( ON ?auto_963956 ?auto_963952 ) ( not ( = ?auto_963953 ?auto_963954 ) ) ( not ( = ?auto_963953 ?auto_963955 ) ) ( not ( = ?auto_963953 ?auto_963952 ) ) ( not ( = ?auto_963953 ?auto_963956 ) ) ( not ( = ?auto_963953 ?auto_963958 ) ) ( not ( = ?auto_963953 ?auto_963957 ) ) ( not ( = ?auto_963953 ?auto_963959 ) ) ( not ( = ?auto_963953 ?auto_963960 ) ) ( not ( = ?auto_963954 ?auto_963955 ) ) ( not ( = ?auto_963954 ?auto_963952 ) ) ( not ( = ?auto_963954 ?auto_963956 ) ) ( not ( = ?auto_963954 ?auto_963958 ) ) ( not ( = ?auto_963954 ?auto_963957 ) ) ( not ( = ?auto_963954 ?auto_963959 ) ) ( not ( = ?auto_963954 ?auto_963960 ) ) ( not ( = ?auto_963955 ?auto_963952 ) ) ( not ( = ?auto_963955 ?auto_963956 ) ) ( not ( = ?auto_963955 ?auto_963958 ) ) ( not ( = ?auto_963955 ?auto_963957 ) ) ( not ( = ?auto_963955 ?auto_963959 ) ) ( not ( = ?auto_963955 ?auto_963960 ) ) ( not ( = ?auto_963952 ?auto_963956 ) ) ( not ( = ?auto_963952 ?auto_963958 ) ) ( not ( = ?auto_963952 ?auto_963957 ) ) ( not ( = ?auto_963952 ?auto_963959 ) ) ( not ( = ?auto_963952 ?auto_963960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963956 ?auto_963958 ?auto_963957 )
      ( MAKE-6CRATE-VERIFY ?auto_963953 ?auto_963954 ?auto_963955 ?auto_963952 ?auto_963956 ?auto_963958 ?auto_963957 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_963967 - SURFACE
      ?auto_963968 - SURFACE
      ?auto_963969 - SURFACE
      ?auto_963966 - SURFACE
      ?auto_963970 - SURFACE
      ?auto_963972 - SURFACE
      ?auto_963971 - SURFACE
      ?auto_963973 - SURFACE
    )
    :vars
    (
      ?auto_963977 - HOIST
      ?auto_963976 - PLACE
      ?auto_963978 - PLACE
      ?auto_963979 - HOIST
      ?auto_963974 - SURFACE
      ?auto_963980 - TRUCK
      ?auto_963975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_963977 ?auto_963976 ) ( IS-CRATE ?auto_963973 ) ( not ( = ?auto_963971 ?auto_963973 ) ) ( not ( = ?auto_963972 ?auto_963971 ) ) ( not ( = ?auto_963972 ?auto_963973 ) ) ( not ( = ?auto_963978 ?auto_963976 ) ) ( HOIST-AT ?auto_963979 ?auto_963978 ) ( not ( = ?auto_963977 ?auto_963979 ) ) ( SURFACE-AT ?auto_963973 ?auto_963978 ) ( ON ?auto_963973 ?auto_963974 ) ( CLEAR ?auto_963973 ) ( not ( = ?auto_963971 ?auto_963974 ) ) ( not ( = ?auto_963973 ?auto_963974 ) ) ( not ( = ?auto_963972 ?auto_963974 ) ) ( SURFACE-AT ?auto_963972 ?auto_963976 ) ( CLEAR ?auto_963972 ) ( IS-CRATE ?auto_963971 ) ( AVAILABLE ?auto_963977 ) ( TRUCK-AT ?auto_963980 ?auto_963978 ) ( AVAILABLE ?auto_963979 ) ( SURFACE-AT ?auto_963971 ?auto_963978 ) ( ON ?auto_963971 ?auto_963975 ) ( CLEAR ?auto_963971 ) ( not ( = ?auto_963971 ?auto_963975 ) ) ( not ( = ?auto_963973 ?auto_963975 ) ) ( not ( = ?auto_963972 ?auto_963975 ) ) ( not ( = ?auto_963974 ?auto_963975 ) ) ( ON ?auto_963968 ?auto_963967 ) ( ON ?auto_963969 ?auto_963968 ) ( ON ?auto_963966 ?auto_963969 ) ( ON ?auto_963970 ?auto_963966 ) ( ON ?auto_963972 ?auto_963970 ) ( not ( = ?auto_963967 ?auto_963968 ) ) ( not ( = ?auto_963967 ?auto_963969 ) ) ( not ( = ?auto_963967 ?auto_963966 ) ) ( not ( = ?auto_963967 ?auto_963970 ) ) ( not ( = ?auto_963967 ?auto_963972 ) ) ( not ( = ?auto_963967 ?auto_963971 ) ) ( not ( = ?auto_963967 ?auto_963973 ) ) ( not ( = ?auto_963967 ?auto_963974 ) ) ( not ( = ?auto_963967 ?auto_963975 ) ) ( not ( = ?auto_963968 ?auto_963969 ) ) ( not ( = ?auto_963968 ?auto_963966 ) ) ( not ( = ?auto_963968 ?auto_963970 ) ) ( not ( = ?auto_963968 ?auto_963972 ) ) ( not ( = ?auto_963968 ?auto_963971 ) ) ( not ( = ?auto_963968 ?auto_963973 ) ) ( not ( = ?auto_963968 ?auto_963974 ) ) ( not ( = ?auto_963968 ?auto_963975 ) ) ( not ( = ?auto_963969 ?auto_963966 ) ) ( not ( = ?auto_963969 ?auto_963970 ) ) ( not ( = ?auto_963969 ?auto_963972 ) ) ( not ( = ?auto_963969 ?auto_963971 ) ) ( not ( = ?auto_963969 ?auto_963973 ) ) ( not ( = ?auto_963969 ?auto_963974 ) ) ( not ( = ?auto_963969 ?auto_963975 ) ) ( not ( = ?auto_963966 ?auto_963970 ) ) ( not ( = ?auto_963966 ?auto_963972 ) ) ( not ( = ?auto_963966 ?auto_963971 ) ) ( not ( = ?auto_963966 ?auto_963973 ) ) ( not ( = ?auto_963966 ?auto_963974 ) ) ( not ( = ?auto_963966 ?auto_963975 ) ) ( not ( = ?auto_963970 ?auto_963972 ) ) ( not ( = ?auto_963970 ?auto_963971 ) ) ( not ( = ?auto_963970 ?auto_963973 ) ) ( not ( = ?auto_963970 ?auto_963974 ) ) ( not ( = ?auto_963970 ?auto_963975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963972 ?auto_963971 ?auto_963973 )
      ( MAKE-7CRATE-VERIFY ?auto_963967 ?auto_963968 ?auto_963969 ?auto_963966 ?auto_963970 ?auto_963972 ?auto_963971 ?auto_963973 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_963982 - SURFACE
      ?auto_963983 - SURFACE
      ?auto_963984 - SURFACE
      ?auto_963981 - SURFACE
      ?auto_963985 - SURFACE
      ?auto_963987 - SURFACE
      ?auto_963986 - SURFACE
      ?auto_963988 - SURFACE
      ?auto_963989 - SURFACE
    )
    :vars
    (
      ?auto_963993 - HOIST
      ?auto_963992 - PLACE
      ?auto_963994 - PLACE
      ?auto_963995 - HOIST
      ?auto_963990 - SURFACE
      ?auto_963996 - TRUCK
      ?auto_963991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_963993 ?auto_963992 ) ( IS-CRATE ?auto_963989 ) ( not ( = ?auto_963988 ?auto_963989 ) ) ( not ( = ?auto_963986 ?auto_963988 ) ) ( not ( = ?auto_963986 ?auto_963989 ) ) ( not ( = ?auto_963994 ?auto_963992 ) ) ( HOIST-AT ?auto_963995 ?auto_963994 ) ( not ( = ?auto_963993 ?auto_963995 ) ) ( SURFACE-AT ?auto_963989 ?auto_963994 ) ( ON ?auto_963989 ?auto_963990 ) ( CLEAR ?auto_963989 ) ( not ( = ?auto_963988 ?auto_963990 ) ) ( not ( = ?auto_963989 ?auto_963990 ) ) ( not ( = ?auto_963986 ?auto_963990 ) ) ( SURFACE-AT ?auto_963986 ?auto_963992 ) ( CLEAR ?auto_963986 ) ( IS-CRATE ?auto_963988 ) ( AVAILABLE ?auto_963993 ) ( TRUCK-AT ?auto_963996 ?auto_963994 ) ( AVAILABLE ?auto_963995 ) ( SURFACE-AT ?auto_963988 ?auto_963994 ) ( ON ?auto_963988 ?auto_963991 ) ( CLEAR ?auto_963988 ) ( not ( = ?auto_963988 ?auto_963991 ) ) ( not ( = ?auto_963989 ?auto_963991 ) ) ( not ( = ?auto_963986 ?auto_963991 ) ) ( not ( = ?auto_963990 ?auto_963991 ) ) ( ON ?auto_963983 ?auto_963982 ) ( ON ?auto_963984 ?auto_963983 ) ( ON ?auto_963981 ?auto_963984 ) ( ON ?auto_963985 ?auto_963981 ) ( ON ?auto_963987 ?auto_963985 ) ( ON ?auto_963986 ?auto_963987 ) ( not ( = ?auto_963982 ?auto_963983 ) ) ( not ( = ?auto_963982 ?auto_963984 ) ) ( not ( = ?auto_963982 ?auto_963981 ) ) ( not ( = ?auto_963982 ?auto_963985 ) ) ( not ( = ?auto_963982 ?auto_963987 ) ) ( not ( = ?auto_963982 ?auto_963986 ) ) ( not ( = ?auto_963982 ?auto_963988 ) ) ( not ( = ?auto_963982 ?auto_963989 ) ) ( not ( = ?auto_963982 ?auto_963990 ) ) ( not ( = ?auto_963982 ?auto_963991 ) ) ( not ( = ?auto_963983 ?auto_963984 ) ) ( not ( = ?auto_963983 ?auto_963981 ) ) ( not ( = ?auto_963983 ?auto_963985 ) ) ( not ( = ?auto_963983 ?auto_963987 ) ) ( not ( = ?auto_963983 ?auto_963986 ) ) ( not ( = ?auto_963983 ?auto_963988 ) ) ( not ( = ?auto_963983 ?auto_963989 ) ) ( not ( = ?auto_963983 ?auto_963990 ) ) ( not ( = ?auto_963983 ?auto_963991 ) ) ( not ( = ?auto_963984 ?auto_963981 ) ) ( not ( = ?auto_963984 ?auto_963985 ) ) ( not ( = ?auto_963984 ?auto_963987 ) ) ( not ( = ?auto_963984 ?auto_963986 ) ) ( not ( = ?auto_963984 ?auto_963988 ) ) ( not ( = ?auto_963984 ?auto_963989 ) ) ( not ( = ?auto_963984 ?auto_963990 ) ) ( not ( = ?auto_963984 ?auto_963991 ) ) ( not ( = ?auto_963981 ?auto_963985 ) ) ( not ( = ?auto_963981 ?auto_963987 ) ) ( not ( = ?auto_963981 ?auto_963986 ) ) ( not ( = ?auto_963981 ?auto_963988 ) ) ( not ( = ?auto_963981 ?auto_963989 ) ) ( not ( = ?auto_963981 ?auto_963990 ) ) ( not ( = ?auto_963981 ?auto_963991 ) ) ( not ( = ?auto_963985 ?auto_963987 ) ) ( not ( = ?auto_963985 ?auto_963986 ) ) ( not ( = ?auto_963985 ?auto_963988 ) ) ( not ( = ?auto_963985 ?auto_963989 ) ) ( not ( = ?auto_963985 ?auto_963990 ) ) ( not ( = ?auto_963985 ?auto_963991 ) ) ( not ( = ?auto_963987 ?auto_963986 ) ) ( not ( = ?auto_963987 ?auto_963988 ) ) ( not ( = ?auto_963987 ?auto_963989 ) ) ( not ( = ?auto_963987 ?auto_963990 ) ) ( not ( = ?auto_963987 ?auto_963991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_963986 ?auto_963988 ?auto_963989 )
      ( MAKE-8CRATE-VERIFY ?auto_963982 ?auto_963983 ?auto_963984 ?auto_963981 ?auto_963985 ?auto_963987 ?auto_963986 ?auto_963988 ?auto_963989 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_963998 - SURFACE
      ?auto_963999 - SURFACE
      ?auto_964000 - SURFACE
      ?auto_963997 - SURFACE
      ?auto_964001 - SURFACE
      ?auto_964003 - SURFACE
      ?auto_964002 - SURFACE
      ?auto_964004 - SURFACE
      ?auto_964005 - SURFACE
      ?auto_964006 - SURFACE
    )
    :vars
    (
      ?auto_964010 - HOIST
      ?auto_964009 - PLACE
      ?auto_964011 - PLACE
      ?auto_964012 - HOIST
      ?auto_964007 - SURFACE
      ?auto_964013 - TRUCK
      ?auto_964008 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_964010 ?auto_964009 ) ( IS-CRATE ?auto_964006 ) ( not ( = ?auto_964005 ?auto_964006 ) ) ( not ( = ?auto_964004 ?auto_964005 ) ) ( not ( = ?auto_964004 ?auto_964006 ) ) ( not ( = ?auto_964011 ?auto_964009 ) ) ( HOIST-AT ?auto_964012 ?auto_964011 ) ( not ( = ?auto_964010 ?auto_964012 ) ) ( SURFACE-AT ?auto_964006 ?auto_964011 ) ( ON ?auto_964006 ?auto_964007 ) ( CLEAR ?auto_964006 ) ( not ( = ?auto_964005 ?auto_964007 ) ) ( not ( = ?auto_964006 ?auto_964007 ) ) ( not ( = ?auto_964004 ?auto_964007 ) ) ( SURFACE-AT ?auto_964004 ?auto_964009 ) ( CLEAR ?auto_964004 ) ( IS-CRATE ?auto_964005 ) ( AVAILABLE ?auto_964010 ) ( TRUCK-AT ?auto_964013 ?auto_964011 ) ( AVAILABLE ?auto_964012 ) ( SURFACE-AT ?auto_964005 ?auto_964011 ) ( ON ?auto_964005 ?auto_964008 ) ( CLEAR ?auto_964005 ) ( not ( = ?auto_964005 ?auto_964008 ) ) ( not ( = ?auto_964006 ?auto_964008 ) ) ( not ( = ?auto_964004 ?auto_964008 ) ) ( not ( = ?auto_964007 ?auto_964008 ) ) ( ON ?auto_963999 ?auto_963998 ) ( ON ?auto_964000 ?auto_963999 ) ( ON ?auto_963997 ?auto_964000 ) ( ON ?auto_964001 ?auto_963997 ) ( ON ?auto_964003 ?auto_964001 ) ( ON ?auto_964002 ?auto_964003 ) ( ON ?auto_964004 ?auto_964002 ) ( not ( = ?auto_963998 ?auto_963999 ) ) ( not ( = ?auto_963998 ?auto_964000 ) ) ( not ( = ?auto_963998 ?auto_963997 ) ) ( not ( = ?auto_963998 ?auto_964001 ) ) ( not ( = ?auto_963998 ?auto_964003 ) ) ( not ( = ?auto_963998 ?auto_964002 ) ) ( not ( = ?auto_963998 ?auto_964004 ) ) ( not ( = ?auto_963998 ?auto_964005 ) ) ( not ( = ?auto_963998 ?auto_964006 ) ) ( not ( = ?auto_963998 ?auto_964007 ) ) ( not ( = ?auto_963998 ?auto_964008 ) ) ( not ( = ?auto_963999 ?auto_964000 ) ) ( not ( = ?auto_963999 ?auto_963997 ) ) ( not ( = ?auto_963999 ?auto_964001 ) ) ( not ( = ?auto_963999 ?auto_964003 ) ) ( not ( = ?auto_963999 ?auto_964002 ) ) ( not ( = ?auto_963999 ?auto_964004 ) ) ( not ( = ?auto_963999 ?auto_964005 ) ) ( not ( = ?auto_963999 ?auto_964006 ) ) ( not ( = ?auto_963999 ?auto_964007 ) ) ( not ( = ?auto_963999 ?auto_964008 ) ) ( not ( = ?auto_964000 ?auto_963997 ) ) ( not ( = ?auto_964000 ?auto_964001 ) ) ( not ( = ?auto_964000 ?auto_964003 ) ) ( not ( = ?auto_964000 ?auto_964002 ) ) ( not ( = ?auto_964000 ?auto_964004 ) ) ( not ( = ?auto_964000 ?auto_964005 ) ) ( not ( = ?auto_964000 ?auto_964006 ) ) ( not ( = ?auto_964000 ?auto_964007 ) ) ( not ( = ?auto_964000 ?auto_964008 ) ) ( not ( = ?auto_963997 ?auto_964001 ) ) ( not ( = ?auto_963997 ?auto_964003 ) ) ( not ( = ?auto_963997 ?auto_964002 ) ) ( not ( = ?auto_963997 ?auto_964004 ) ) ( not ( = ?auto_963997 ?auto_964005 ) ) ( not ( = ?auto_963997 ?auto_964006 ) ) ( not ( = ?auto_963997 ?auto_964007 ) ) ( not ( = ?auto_963997 ?auto_964008 ) ) ( not ( = ?auto_964001 ?auto_964003 ) ) ( not ( = ?auto_964001 ?auto_964002 ) ) ( not ( = ?auto_964001 ?auto_964004 ) ) ( not ( = ?auto_964001 ?auto_964005 ) ) ( not ( = ?auto_964001 ?auto_964006 ) ) ( not ( = ?auto_964001 ?auto_964007 ) ) ( not ( = ?auto_964001 ?auto_964008 ) ) ( not ( = ?auto_964003 ?auto_964002 ) ) ( not ( = ?auto_964003 ?auto_964004 ) ) ( not ( = ?auto_964003 ?auto_964005 ) ) ( not ( = ?auto_964003 ?auto_964006 ) ) ( not ( = ?auto_964003 ?auto_964007 ) ) ( not ( = ?auto_964003 ?auto_964008 ) ) ( not ( = ?auto_964002 ?auto_964004 ) ) ( not ( = ?auto_964002 ?auto_964005 ) ) ( not ( = ?auto_964002 ?auto_964006 ) ) ( not ( = ?auto_964002 ?auto_964007 ) ) ( not ( = ?auto_964002 ?auto_964008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964004 ?auto_964005 ?auto_964006 )
      ( MAKE-9CRATE-VERIFY ?auto_963998 ?auto_963999 ?auto_964000 ?auto_963997 ?auto_964001 ?auto_964003 ?auto_964002 ?auto_964004 ?auto_964005 ?auto_964006 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_964015 - SURFACE
      ?auto_964016 - SURFACE
      ?auto_964017 - SURFACE
      ?auto_964014 - SURFACE
      ?auto_964018 - SURFACE
      ?auto_964020 - SURFACE
      ?auto_964019 - SURFACE
      ?auto_964021 - SURFACE
      ?auto_964022 - SURFACE
      ?auto_964023 - SURFACE
      ?auto_964024 - SURFACE
    )
    :vars
    (
      ?auto_964028 - HOIST
      ?auto_964027 - PLACE
      ?auto_964029 - PLACE
      ?auto_964030 - HOIST
      ?auto_964025 - SURFACE
      ?auto_964031 - TRUCK
      ?auto_964026 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_964028 ?auto_964027 ) ( IS-CRATE ?auto_964024 ) ( not ( = ?auto_964023 ?auto_964024 ) ) ( not ( = ?auto_964022 ?auto_964023 ) ) ( not ( = ?auto_964022 ?auto_964024 ) ) ( not ( = ?auto_964029 ?auto_964027 ) ) ( HOIST-AT ?auto_964030 ?auto_964029 ) ( not ( = ?auto_964028 ?auto_964030 ) ) ( SURFACE-AT ?auto_964024 ?auto_964029 ) ( ON ?auto_964024 ?auto_964025 ) ( CLEAR ?auto_964024 ) ( not ( = ?auto_964023 ?auto_964025 ) ) ( not ( = ?auto_964024 ?auto_964025 ) ) ( not ( = ?auto_964022 ?auto_964025 ) ) ( SURFACE-AT ?auto_964022 ?auto_964027 ) ( CLEAR ?auto_964022 ) ( IS-CRATE ?auto_964023 ) ( AVAILABLE ?auto_964028 ) ( TRUCK-AT ?auto_964031 ?auto_964029 ) ( AVAILABLE ?auto_964030 ) ( SURFACE-AT ?auto_964023 ?auto_964029 ) ( ON ?auto_964023 ?auto_964026 ) ( CLEAR ?auto_964023 ) ( not ( = ?auto_964023 ?auto_964026 ) ) ( not ( = ?auto_964024 ?auto_964026 ) ) ( not ( = ?auto_964022 ?auto_964026 ) ) ( not ( = ?auto_964025 ?auto_964026 ) ) ( ON ?auto_964016 ?auto_964015 ) ( ON ?auto_964017 ?auto_964016 ) ( ON ?auto_964014 ?auto_964017 ) ( ON ?auto_964018 ?auto_964014 ) ( ON ?auto_964020 ?auto_964018 ) ( ON ?auto_964019 ?auto_964020 ) ( ON ?auto_964021 ?auto_964019 ) ( ON ?auto_964022 ?auto_964021 ) ( not ( = ?auto_964015 ?auto_964016 ) ) ( not ( = ?auto_964015 ?auto_964017 ) ) ( not ( = ?auto_964015 ?auto_964014 ) ) ( not ( = ?auto_964015 ?auto_964018 ) ) ( not ( = ?auto_964015 ?auto_964020 ) ) ( not ( = ?auto_964015 ?auto_964019 ) ) ( not ( = ?auto_964015 ?auto_964021 ) ) ( not ( = ?auto_964015 ?auto_964022 ) ) ( not ( = ?auto_964015 ?auto_964023 ) ) ( not ( = ?auto_964015 ?auto_964024 ) ) ( not ( = ?auto_964015 ?auto_964025 ) ) ( not ( = ?auto_964015 ?auto_964026 ) ) ( not ( = ?auto_964016 ?auto_964017 ) ) ( not ( = ?auto_964016 ?auto_964014 ) ) ( not ( = ?auto_964016 ?auto_964018 ) ) ( not ( = ?auto_964016 ?auto_964020 ) ) ( not ( = ?auto_964016 ?auto_964019 ) ) ( not ( = ?auto_964016 ?auto_964021 ) ) ( not ( = ?auto_964016 ?auto_964022 ) ) ( not ( = ?auto_964016 ?auto_964023 ) ) ( not ( = ?auto_964016 ?auto_964024 ) ) ( not ( = ?auto_964016 ?auto_964025 ) ) ( not ( = ?auto_964016 ?auto_964026 ) ) ( not ( = ?auto_964017 ?auto_964014 ) ) ( not ( = ?auto_964017 ?auto_964018 ) ) ( not ( = ?auto_964017 ?auto_964020 ) ) ( not ( = ?auto_964017 ?auto_964019 ) ) ( not ( = ?auto_964017 ?auto_964021 ) ) ( not ( = ?auto_964017 ?auto_964022 ) ) ( not ( = ?auto_964017 ?auto_964023 ) ) ( not ( = ?auto_964017 ?auto_964024 ) ) ( not ( = ?auto_964017 ?auto_964025 ) ) ( not ( = ?auto_964017 ?auto_964026 ) ) ( not ( = ?auto_964014 ?auto_964018 ) ) ( not ( = ?auto_964014 ?auto_964020 ) ) ( not ( = ?auto_964014 ?auto_964019 ) ) ( not ( = ?auto_964014 ?auto_964021 ) ) ( not ( = ?auto_964014 ?auto_964022 ) ) ( not ( = ?auto_964014 ?auto_964023 ) ) ( not ( = ?auto_964014 ?auto_964024 ) ) ( not ( = ?auto_964014 ?auto_964025 ) ) ( not ( = ?auto_964014 ?auto_964026 ) ) ( not ( = ?auto_964018 ?auto_964020 ) ) ( not ( = ?auto_964018 ?auto_964019 ) ) ( not ( = ?auto_964018 ?auto_964021 ) ) ( not ( = ?auto_964018 ?auto_964022 ) ) ( not ( = ?auto_964018 ?auto_964023 ) ) ( not ( = ?auto_964018 ?auto_964024 ) ) ( not ( = ?auto_964018 ?auto_964025 ) ) ( not ( = ?auto_964018 ?auto_964026 ) ) ( not ( = ?auto_964020 ?auto_964019 ) ) ( not ( = ?auto_964020 ?auto_964021 ) ) ( not ( = ?auto_964020 ?auto_964022 ) ) ( not ( = ?auto_964020 ?auto_964023 ) ) ( not ( = ?auto_964020 ?auto_964024 ) ) ( not ( = ?auto_964020 ?auto_964025 ) ) ( not ( = ?auto_964020 ?auto_964026 ) ) ( not ( = ?auto_964019 ?auto_964021 ) ) ( not ( = ?auto_964019 ?auto_964022 ) ) ( not ( = ?auto_964019 ?auto_964023 ) ) ( not ( = ?auto_964019 ?auto_964024 ) ) ( not ( = ?auto_964019 ?auto_964025 ) ) ( not ( = ?auto_964019 ?auto_964026 ) ) ( not ( = ?auto_964021 ?auto_964022 ) ) ( not ( = ?auto_964021 ?auto_964023 ) ) ( not ( = ?auto_964021 ?auto_964024 ) ) ( not ( = ?auto_964021 ?auto_964025 ) ) ( not ( = ?auto_964021 ?auto_964026 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964022 ?auto_964023 ?auto_964024 )
      ( MAKE-10CRATE-VERIFY ?auto_964015 ?auto_964016 ?auto_964017 ?auto_964014 ?auto_964018 ?auto_964020 ?auto_964019 ?auto_964021 ?auto_964022 ?auto_964023 ?auto_964024 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_964033 - SURFACE
      ?auto_964034 - SURFACE
      ?auto_964035 - SURFACE
      ?auto_964032 - SURFACE
      ?auto_964036 - SURFACE
      ?auto_964038 - SURFACE
      ?auto_964037 - SURFACE
      ?auto_964039 - SURFACE
      ?auto_964040 - SURFACE
      ?auto_964041 - SURFACE
      ?auto_964042 - SURFACE
      ?auto_964043 - SURFACE
    )
    :vars
    (
      ?auto_964047 - HOIST
      ?auto_964046 - PLACE
      ?auto_964048 - PLACE
      ?auto_964049 - HOIST
      ?auto_964044 - SURFACE
      ?auto_964050 - TRUCK
      ?auto_964045 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_964047 ?auto_964046 ) ( IS-CRATE ?auto_964043 ) ( not ( = ?auto_964042 ?auto_964043 ) ) ( not ( = ?auto_964041 ?auto_964042 ) ) ( not ( = ?auto_964041 ?auto_964043 ) ) ( not ( = ?auto_964048 ?auto_964046 ) ) ( HOIST-AT ?auto_964049 ?auto_964048 ) ( not ( = ?auto_964047 ?auto_964049 ) ) ( SURFACE-AT ?auto_964043 ?auto_964048 ) ( ON ?auto_964043 ?auto_964044 ) ( CLEAR ?auto_964043 ) ( not ( = ?auto_964042 ?auto_964044 ) ) ( not ( = ?auto_964043 ?auto_964044 ) ) ( not ( = ?auto_964041 ?auto_964044 ) ) ( SURFACE-AT ?auto_964041 ?auto_964046 ) ( CLEAR ?auto_964041 ) ( IS-CRATE ?auto_964042 ) ( AVAILABLE ?auto_964047 ) ( TRUCK-AT ?auto_964050 ?auto_964048 ) ( AVAILABLE ?auto_964049 ) ( SURFACE-AT ?auto_964042 ?auto_964048 ) ( ON ?auto_964042 ?auto_964045 ) ( CLEAR ?auto_964042 ) ( not ( = ?auto_964042 ?auto_964045 ) ) ( not ( = ?auto_964043 ?auto_964045 ) ) ( not ( = ?auto_964041 ?auto_964045 ) ) ( not ( = ?auto_964044 ?auto_964045 ) ) ( ON ?auto_964034 ?auto_964033 ) ( ON ?auto_964035 ?auto_964034 ) ( ON ?auto_964032 ?auto_964035 ) ( ON ?auto_964036 ?auto_964032 ) ( ON ?auto_964038 ?auto_964036 ) ( ON ?auto_964037 ?auto_964038 ) ( ON ?auto_964039 ?auto_964037 ) ( ON ?auto_964040 ?auto_964039 ) ( ON ?auto_964041 ?auto_964040 ) ( not ( = ?auto_964033 ?auto_964034 ) ) ( not ( = ?auto_964033 ?auto_964035 ) ) ( not ( = ?auto_964033 ?auto_964032 ) ) ( not ( = ?auto_964033 ?auto_964036 ) ) ( not ( = ?auto_964033 ?auto_964038 ) ) ( not ( = ?auto_964033 ?auto_964037 ) ) ( not ( = ?auto_964033 ?auto_964039 ) ) ( not ( = ?auto_964033 ?auto_964040 ) ) ( not ( = ?auto_964033 ?auto_964041 ) ) ( not ( = ?auto_964033 ?auto_964042 ) ) ( not ( = ?auto_964033 ?auto_964043 ) ) ( not ( = ?auto_964033 ?auto_964044 ) ) ( not ( = ?auto_964033 ?auto_964045 ) ) ( not ( = ?auto_964034 ?auto_964035 ) ) ( not ( = ?auto_964034 ?auto_964032 ) ) ( not ( = ?auto_964034 ?auto_964036 ) ) ( not ( = ?auto_964034 ?auto_964038 ) ) ( not ( = ?auto_964034 ?auto_964037 ) ) ( not ( = ?auto_964034 ?auto_964039 ) ) ( not ( = ?auto_964034 ?auto_964040 ) ) ( not ( = ?auto_964034 ?auto_964041 ) ) ( not ( = ?auto_964034 ?auto_964042 ) ) ( not ( = ?auto_964034 ?auto_964043 ) ) ( not ( = ?auto_964034 ?auto_964044 ) ) ( not ( = ?auto_964034 ?auto_964045 ) ) ( not ( = ?auto_964035 ?auto_964032 ) ) ( not ( = ?auto_964035 ?auto_964036 ) ) ( not ( = ?auto_964035 ?auto_964038 ) ) ( not ( = ?auto_964035 ?auto_964037 ) ) ( not ( = ?auto_964035 ?auto_964039 ) ) ( not ( = ?auto_964035 ?auto_964040 ) ) ( not ( = ?auto_964035 ?auto_964041 ) ) ( not ( = ?auto_964035 ?auto_964042 ) ) ( not ( = ?auto_964035 ?auto_964043 ) ) ( not ( = ?auto_964035 ?auto_964044 ) ) ( not ( = ?auto_964035 ?auto_964045 ) ) ( not ( = ?auto_964032 ?auto_964036 ) ) ( not ( = ?auto_964032 ?auto_964038 ) ) ( not ( = ?auto_964032 ?auto_964037 ) ) ( not ( = ?auto_964032 ?auto_964039 ) ) ( not ( = ?auto_964032 ?auto_964040 ) ) ( not ( = ?auto_964032 ?auto_964041 ) ) ( not ( = ?auto_964032 ?auto_964042 ) ) ( not ( = ?auto_964032 ?auto_964043 ) ) ( not ( = ?auto_964032 ?auto_964044 ) ) ( not ( = ?auto_964032 ?auto_964045 ) ) ( not ( = ?auto_964036 ?auto_964038 ) ) ( not ( = ?auto_964036 ?auto_964037 ) ) ( not ( = ?auto_964036 ?auto_964039 ) ) ( not ( = ?auto_964036 ?auto_964040 ) ) ( not ( = ?auto_964036 ?auto_964041 ) ) ( not ( = ?auto_964036 ?auto_964042 ) ) ( not ( = ?auto_964036 ?auto_964043 ) ) ( not ( = ?auto_964036 ?auto_964044 ) ) ( not ( = ?auto_964036 ?auto_964045 ) ) ( not ( = ?auto_964038 ?auto_964037 ) ) ( not ( = ?auto_964038 ?auto_964039 ) ) ( not ( = ?auto_964038 ?auto_964040 ) ) ( not ( = ?auto_964038 ?auto_964041 ) ) ( not ( = ?auto_964038 ?auto_964042 ) ) ( not ( = ?auto_964038 ?auto_964043 ) ) ( not ( = ?auto_964038 ?auto_964044 ) ) ( not ( = ?auto_964038 ?auto_964045 ) ) ( not ( = ?auto_964037 ?auto_964039 ) ) ( not ( = ?auto_964037 ?auto_964040 ) ) ( not ( = ?auto_964037 ?auto_964041 ) ) ( not ( = ?auto_964037 ?auto_964042 ) ) ( not ( = ?auto_964037 ?auto_964043 ) ) ( not ( = ?auto_964037 ?auto_964044 ) ) ( not ( = ?auto_964037 ?auto_964045 ) ) ( not ( = ?auto_964039 ?auto_964040 ) ) ( not ( = ?auto_964039 ?auto_964041 ) ) ( not ( = ?auto_964039 ?auto_964042 ) ) ( not ( = ?auto_964039 ?auto_964043 ) ) ( not ( = ?auto_964039 ?auto_964044 ) ) ( not ( = ?auto_964039 ?auto_964045 ) ) ( not ( = ?auto_964040 ?auto_964041 ) ) ( not ( = ?auto_964040 ?auto_964042 ) ) ( not ( = ?auto_964040 ?auto_964043 ) ) ( not ( = ?auto_964040 ?auto_964044 ) ) ( not ( = ?auto_964040 ?auto_964045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964041 ?auto_964042 ?auto_964043 )
      ( MAKE-11CRATE-VERIFY ?auto_964033 ?auto_964034 ?auto_964035 ?auto_964032 ?auto_964036 ?auto_964038 ?auto_964037 ?auto_964039 ?auto_964040 ?auto_964041 ?auto_964042 ?auto_964043 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_964052 - SURFACE
      ?auto_964053 - SURFACE
      ?auto_964054 - SURFACE
      ?auto_964051 - SURFACE
      ?auto_964055 - SURFACE
      ?auto_964057 - SURFACE
      ?auto_964056 - SURFACE
      ?auto_964058 - SURFACE
      ?auto_964059 - SURFACE
      ?auto_964060 - SURFACE
      ?auto_964061 - SURFACE
      ?auto_964062 - SURFACE
      ?auto_964063 - SURFACE
    )
    :vars
    (
      ?auto_964067 - HOIST
      ?auto_964066 - PLACE
      ?auto_964068 - PLACE
      ?auto_964069 - HOIST
      ?auto_964064 - SURFACE
      ?auto_964070 - TRUCK
      ?auto_964065 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_964067 ?auto_964066 ) ( IS-CRATE ?auto_964063 ) ( not ( = ?auto_964062 ?auto_964063 ) ) ( not ( = ?auto_964061 ?auto_964062 ) ) ( not ( = ?auto_964061 ?auto_964063 ) ) ( not ( = ?auto_964068 ?auto_964066 ) ) ( HOIST-AT ?auto_964069 ?auto_964068 ) ( not ( = ?auto_964067 ?auto_964069 ) ) ( SURFACE-AT ?auto_964063 ?auto_964068 ) ( ON ?auto_964063 ?auto_964064 ) ( CLEAR ?auto_964063 ) ( not ( = ?auto_964062 ?auto_964064 ) ) ( not ( = ?auto_964063 ?auto_964064 ) ) ( not ( = ?auto_964061 ?auto_964064 ) ) ( SURFACE-AT ?auto_964061 ?auto_964066 ) ( CLEAR ?auto_964061 ) ( IS-CRATE ?auto_964062 ) ( AVAILABLE ?auto_964067 ) ( TRUCK-AT ?auto_964070 ?auto_964068 ) ( AVAILABLE ?auto_964069 ) ( SURFACE-AT ?auto_964062 ?auto_964068 ) ( ON ?auto_964062 ?auto_964065 ) ( CLEAR ?auto_964062 ) ( not ( = ?auto_964062 ?auto_964065 ) ) ( not ( = ?auto_964063 ?auto_964065 ) ) ( not ( = ?auto_964061 ?auto_964065 ) ) ( not ( = ?auto_964064 ?auto_964065 ) ) ( ON ?auto_964053 ?auto_964052 ) ( ON ?auto_964054 ?auto_964053 ) ( ON ?auto_964051 ?auto_964054 ) ( ON ?auto_964055 ?auto_964051 ) ( ON ?auto_964057 ?auto_964055 ) ( ON ?auto_964056 ?auto_964057 ) ( ON ?auto_964058 ?auto_964056 ) ( ON ?auto_964059 ?auto_964058 ) ( ON ?auto_964060 ?auto_964059 ) ( ON ?auto_964061 ?auto_964060 ) ( not ( = ?auto_964052 ?auto_964053 ) ) ( not ( = ?auto_964052 ?auto_964054 ) ) ( not ( = ?auto_964052 ?auto_964051 ) ) ( not ( = ?auto_964052 ?auto_964055 ) ) ( not ( = ?auto_964052 ?auto_964057 ) ) ( not ( = ?auto_964052 ?auto_964056 ) ) ( not ( = ?auto_964052 ?auto_964058 ) ) ( not ( = ?auto_964052 ?auto_964059 ) ) ( not ( = ?auto_964052 ?auto_964060 ) ) ( not ( = ?auto_964052 ?auto_964061 ) ) ( not ( = ?auto_964052 ?auto_964062 ) ) ( not ( = ?auto_964052 ?auto_964063 ) ) ( not ( = ?auto_964052 ?auto_964064 ) ) ( not ( = ?auto_964052 ?auto_964065 ) ) ( not ( = ?auto_964053 ?auto_964054 ) ) ( not ( = ?auto_964053 ?auto_964051 ) ) ( not ( = ?auto_964053 ?auto_964055 ) ) ( not ( = ?auto_964053 ?auto_964057 ) ) ( not ( = ?auto_964053 ?auto_964056 ) ) ( not ( = ?auto_964053 ?auto_964058 ) ) ( not ( = ?auto_964053 ?auto_964059 ) ) ( not ( = ?auto_964053 ?auto_964060 ) ) ( not ( = ?auto_964053 ?auto_964061 ) ) ( not ( = ?auto_964053 ?auto_964062 ) ) ( not ( = ?auto_964053 ?auto_964063 ) ) ( not ( = ?auto_964053 ?auto_964064 ) ) ( not ( = ?auto_964053 ?auto_964065 ) ) ( not ( = ?auto_964054 ?auto_964051 ) ) ( not ( = ?auto_964054 ?auto_964055 ) ) ( not ( = ?auto_964054 ?auto_964057 ) ) ( not ( = ?auto_964054 ?auto_964056 ) ) ( not ( = ?auto_964054 ?auto_964058 ) ) ( not ( = ?auto_964054 ?auto_964059 ) ) ( not ( = ?auto_964054 ?auto_964060 ) ) ( not ( = ?auto_964054 ?auto_964061 ) ) ( not ( = ?auto_964054 ?auto_964062 ) ) ( not ( = ?auto_964054 ?auto_964063 ) ) ( not ( = ?auto_964054 ?auto_964064 ) ) ( not ( = ?auto_964054 ?auto_964065 ) ) ( not ( = ?auto_964051 ?auto_964055 ) ) ( not ( = ?auto_964051 ?auto_964057 ) ) ( not ( = ?auto_964051 ?auto_964056 ) ) ( not ( = ?auto_964051 ?auto_964058 ) ) ( not ( = ?auto_964051 ?auto_964059 ) ) ( not ( = ?auto_964051 ?auto_964060 ) ) ( not ( = ?auto_964051 ?auto_964061 ) ) ( not ( = ?auto_964051 ?auto_964062 ) ) ( not ( = ?auto_964051 ?auto_964063 ) ) ( not ( = ?auto_964051 ?auto_964064 ) ) ( not ( = ?auto_964051 ?auto_964065 ) ) ( not ( = ?auto_964055 ?auto_964057 ) ) ( not ( = ?auto_964055 ?auto_964056 ) ) ( not ( = ?auto_964055 ?auto_964058 ) ) ( not ( = ?auto_964055 ?auto_964059 ) ) ( not ( = ?auto_964055 ?auto_964060 ) ) ( not ( = ?auto_964055 ?auto_964061 ) ) ( not ( = ?auto_964055 ?auto_964062 ) ) ( not ( = ?auto_964055 ?auto_964063 ) ) ( not ( = ?auto_964055 ?auto_964064 ) ) ( not ( = ?auto_964055 ?auto_964065 ) ) ( not ( = ?auto_964057 ?auto_964056 ) ) ( not ( = ?auto_964057 ?auto_964058 ) ) ( not ( = ?auto_964057 ?auto_964059 ) ) ( not ( = ?auto_964057 ?auto_964060 ) ) ( not ( = ?auto_964057 ?auto_964061 ) ) ( not ( = ?auto_964057 ?auto_964062 ) ) ( not ( = ?auto_964057 ?auto_964063 ) ) ( not ( = ?auto_964057 ?auto_964064 ) ) ( not ( = ?auto_964057 ?auto_964065 ) ) ( not ( = ?auto_964056 ?auto_964058 ) ) ( not ( = ?auto_964056 ?auto_964059 ) ) ( not ( = ?auto_964056 ?auto_964060 ) ) ( not ( = ?auto_964056 ?auto_964061 ) ) ( not ( = ?auto_964056 ?auto_964062 ) ) ( not ( = ?auto_964056 ?auto_964063 ) ) ( not ( = ?auto_964056 ?auto_964064 ) ) ( not ( = ?auto_964056 ?auto_964065 ) ) ( not ( = ?auto_964058 ?auto_964059 ) ) ( not ( = ?auto_964058 ?auto_964060 ) ) ( not ( = ?auto_964058 ?auto_964061 ) ) ( not ( = ?auto_964058 ?auto_964062 ) ) ( not ( = ?auto_964058 ?auto_964063 ) ) ( not ( = ?auto_964058 ?auto_964064 ) ) ( not ( = ?auto_964058 ?auto_964065 ) ) ( not ( = ?auto_964059 ?auto_964060 ) ) ( not ( = ?auto_964059 ?auto_964061 ) ) ( not ( = ?auto_964059 ?auto_964062 ) ) ( not ( = ?auto_964059 ?auto_964063 ) ) ( not ( = ?auto_964059 ?auto_964064 ) ) ( not ( = ?auto_964059 ?auto_964065 ) ) ( not ( = ?auto_964060 ?auto_964061 ) ) ( not ( = ?auto_964060 ?auto_964062 ) ) ( not ( = ?auto_964060 ?auto_964063 ) ) ( not ( = ?auto_964060 ?auto_964064 ) ) ( not ( = ?auto_964060 ?auto_964065 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964061 ?auto_964062 ?auto_964063 )
      ( MAKE-12CRATE-VERIFY ?auto_964052 ?auto_964053 ?auto_964054 ?auto_964051 ?auto_964055 ?auto_964057 ?auto_964056 ?auto_964058 ?auto_964059 ?auto_964060 ?auto_964061 ?auto_964062 ?auto_964063 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_964072 - SURFACE
      ?auto_964073 - SURFACE
      ?auto_964074 - SURFACE
      ?auto_964071 - SURFACE
      ?auto_964075 - SURFACE
      ?auto_964077 - SURFACE
      ?auto_964076 - SURFACE
      ?auto_964078 - SURFACE
      ?auto_964079 - SURFACE
      ?auto_964080 - SURFACE
      ?auto_964081 - SURFACE
      ?auto_964082 - SURFACE
      ?auto_964083 - SURFACE
      ?auto_964084 - SURFACE
    )
    :vars
    (
      ?auto_964088 - HOIST
      ?auto_964087 - PLACE
      ?auto_964089 - PLACE
      ?auto_964090 - HOIST
      ?auto_964085 - SURFACE
      ?auto_964091 - TRUCK
      ?auto_964086 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_964088 ?auto_964087 ) ( IS-CRATE ?auto_964084 ) ( not ( = ?auto_964083 ?auto_964084 ) ) ( not ( = ?auto_964082 ?auto_964083 ) ) ( not ( = ?auto_964082 ?auto_964084 ) ) ( not ( = ?auto_964089 ?auto_964087 ) ) ( HOIST-AT ?auto_964090 ?auto_964089 ) ( not ( = ?auto_964088 ?auto_964090 ) ) ( SURFACE-AT ?auto_964084 ?auto_964089 ) ( ON ?auto_964084 ?auto_964085 ) ( CLEAR ?auto_964084 ) ( not ( = ?auto_964083 ?auto_964085 ) ) ( not ( = ?auto_964084 ?auto_964085 ) ) ( not ( = ?auto_964082 ?auto_964085 ) ) ( SURFACE-AT ?auto_964082 ?auto_964087 ) ( CLEAR ?auto_964082 ) ( IS-CRATE ?auto_964083 ) ( AVAILABLE ?auto_964088 ) ( TRUCK-AT ?auto_964091 ?auto_964089 ) ( AVAILABLE ?auto_964090 ) ( SURFACE-AT ?auto_964083 ?auto_964089 ) ( ON ?auto_964083 ?auto_964086 ) ( CLEAR ?auto_964083 ) ( not ( = ?auto_964083 ?auto_964086 ) ) ( not ( = ?auto_964084 ?auto_964086 ) ) ( not ( = ?auto_964082 ?auto_964086 ) ) ( not ( = ?auto_964085 ?auto_964086 ) ) ( ON ?auto_964073 ?auto_964072 ) ( ON ?auto_964074 ?auto_964073 ) ( ON ?auto_964071 ?auto_964074 ) ( ON ?auto_964075 ?auto_964071 ) ( ON ?auto_964077 ?auto_964075 ) ( ON ?auto_964076 ?auto_964077 ) ( ON ?auto_964078 ?auto_964076 ) ( ON ?auto_964079 ?auto_964078 ) ( ON ?auto_964080 ?auto_964079 ) ( ON ?auto_964081 ?auto_964080 ) ( ON ?auto_964082 ?auto_964081 ) ( not ( = ?auto_964072 ?auto_964073 ) ) ( not ( = ?auto_964072 ?auto_964074 ) ) ( not ( = ?auto_964072 ?auto_964071 ) ) ( not ( = ?auto_964072 ?auto_964075 ) ) ( not ( = ?auto_964072 ?auto_964077 ) ) ( not ( = ?auto_964072 ?auto_964076 ) ) ( not ( = ?auto_964072 ?auto_964078 ) ) ( not ( = ?auto_964072 ?auto_964079 ) ) ( not ( = ?auto_964072 ?auto_964080 ) ) ( not ( = ?auto_964072 ?auto_964081 ) ) ( not ( = ?auto_964072 ?auto_964082 ) ) ( not ( = ?auto_964072 ?auto_964083 ) ) ( not ( = ?auto_964072 ?auto_964084 ) ) ( not ( = ?auto_964072 ?auto_964085 ) ) ( not ( = ?auto_964072 ?auto_964086 ) ) ( not ( = ?auto_964073 ?auto_964074 ) ) ( not ( = ?auto_964073 ?auto_964071 ) ) ( not ( = ?auto_964073 ?auto_964075 ) ) ( not ( = ?auto_964073 ?auto_964077 ) ) ( not ( = ?auto_964073 ?auto_964076 ) ) ( not ( = ?auto_964073 ?auto_964078 ) ) ( not ( = ?auto_964073 ?auto_964079 ) ) ( not ( = ?auto_964073 ?auto_964080 ) ) ( not ( = ?auto_964073 ?auto_964081 ) ) ( not ( = ?auto_964073 ?auto_964082 ) ) ( not ( = ?auto_964073 ?auto_964083 ) ) ( not ( = ?auto_964073 ?auto_964084 ) ) ( not ( = ?auto_964073 ?auto_964085 ) ) ( not ( = ?auto_964073 ?auto_964086 ) ) ( not ( = ?auto_964074 ?auto_964071 ) ) ( not ( = ?auto_964074 ?auto_964075 ) ) ( not ( = ?auto_964074 ?auto_964077 ) ) ( not ( = ?auto_964074 ?auto_964076 ) ) ( not ( = ?auto_964074 ?auto_964078 ) ) ( not ( = ?auto_964074 ?auto_964079 ) ) ( not ( = ?auto_964074 ?auto_964080 ) ) ( not ( = ?auto_964074 ?auto_964081 ) ) ( not ( = ?auto_964074 ?auto_964082 ) ) ( not ( = ?auto_964074 ?auto_964083 ) ) ( not ( = ?auto_964074 ?auto_964084 ) ) ( not ( = ?auto_964074 ?auto_964085 ) ) ( not ( = ?auto_964074 ?auto_964086 ) ) ( not ( = ?auto_964071 ?auto_964075 ) ) ( not ( = ?auto_964071 ?auto_964077 ) ) ( not ( = ?auto_964071 ?auto_964076 ) ) ( not ( = ?auto_964071 ?auto_964078 ) ) ( not ( = ?auto_964071 ?auto_964079 ) ) ( not ( = ?auto_964071 ?auto_964080 ) ) ( not ( = ?auto_964071 ?auto_964081 ) ) ( not ( = ?auto_964071 ?auto_964082 ) ) ( not ( = ?auto_964071 ?auto_964083 ) ) ( not ( = ?auto_964071 ?auto_964084 ) ) ( not ( = ?auto_964071 ?auto_964085 ) ) ( not ( = ?auto_964071 ?auto_964086 ) ) ( not ( = ?auto_964075 ?auto_964077 ) ) ( not ( = ?auto_964075 ?auto_964076 ) ) ( not ( = ?auto_964075 ?auto_964078 ) ) ( not ( = ?auto_964075 ?auto_964079 ) ) ( not ( = ?auto_964075 ?auto_964080 ) ) ( not ( = ?auto_964075 ?auto_964081 ) ) ( not ( = ?auto_964075 ?auto_964082 ) ) ( not ( = ?auto_964075 ?auto_964083 ) ) ( not ( = ?auto_964075 ?auto_964084 ) ) ( not ( = ?auto_964075 ?auto_964085 ) ) ( not ( = ?auto_964075 ?auto_964086 ) ) ( not ( = ?auto_964077 ?auto_964076 ) ) ( not ( = ?auto_964077 ?auto_964078 ) ) ( not ( = ?auto_964077 ?auto_964079 ) ) ( not ( = ?auto_964077 ?auto_964080 ) ) ( not ( = ?auto_964077 ?auto_964081 ) ) ( not ( = ?auto_964077 ?auto_964082 ) ) ( not ( = ?auto_964077 ?auto_964083 ) ) ( not ( = ?auto_964077 ?auto_964084 ) ) ( not ( = ?auto_964077 ?auto_964085 ) ) ( not ( = ?auto_964077 ?auto_964086 ) ) ( not ( = ?auto_964076 ?auto_964078 ) ) ( not ( = ?auto_964076 ?auto_964079 ) ) ( not ( = ?auto_964076 ?auto_964080 ) ) ( not ( = ?auto_964076 ?auto_964081 ) ) ( not ( = ?auto_964076 ?auto_964082 ) ) ( not ( = ?auto_964076 ?auto_964083 ) ) ( not ( = ?auto_964076 ?auto_964084 ) ) ( not ( = ?auto_964076 ?auto_964085 ) ) ( not ( = ?auto_964076 ?auto_964086 ) ) ( not ( = ?auto_964078 ?auto_964079 ) ) ( not ( = ?auto_964078 ?auto_964080 ) ) ( not ( = ?auto_964078 ?auto_964081 ) ) ( not ( = ?auto_964078 ?auto_964082 ) ) ( not ( = ?auto_964078 ?auto_964083 ) ) ( not ( = ?auto_964078 ?auto_964084 ) ) ( not ( = ?auto_964078 ?auto_964085 ) ) ( not ( = ?auto_964078 ?auto_964086 ) ) ( not ( = ?auto_964079 ?auto_964080 ) ) ( not ( = ?auto_964079 ?auto_964081 ) ) ( not ( = ?auto_964079 ?auto_964082 ) ) ( not ( = ?auto_964079 ?auto_964083 ) ) ( not ( = ?auto_964079 ?auto_964084 ) ) ( not ( = ?auto_964079 ?auto_964085 ) ) ( not ( = ?auto_964079 ?auto_964086 ) ) ( not ( = ?auto_964080 ?auto_964081 ) ) ( not ( = ?auto_964080 ?auto_964082 ) ) ( not ( = ?auto_964080 ?auto_964083 ) ) ( not ( = ?auto_964080 ?auto_964084 ) ) ( not ( = ?auto_964080 ?auto_964085 ) ) ( not ( = ?auto_964080 ?auto_964086 ) ) ( not ( = ?auto_964081 ?auto_964082 ) ) ( not ( = ?auto_964081 ?auto_964083 ) ) ( not ( = ?auto_964081 ?auto_964084 ) ) ( not ( = ?auto_964081 ?auto_964085 ) ) ( not ( = ?auto_964081 ?auto_964086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964082 ?auto_964083 ?auto_964084 )
      ( MAKE-13CRATE-VERIFY ?auto_964072 ?auto_964073 ?auto_964074 ?auto_964071 ?auto_964075 ?auto_964077 ?auto_964076 ?auto_964078 ?auto_964079 ?auto_964080 ?auto_964081 ?auto_964082 ?auto_964083 ?auto_964084 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_964092 - SURFACE
      ?auto_964093 - SURFACE
    )
    :vars
    (
      ?auto_964097 - HOIST
      ?auto_964096 - PLACE
      ?auto_964098 - SURFACE
      ?auto_964099 - PLACE
      ?auto_964100 - HOIST
      ?auto_964094 - SURFACE
      ?auto_964095 - SURFACE
      ?auto_964101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964097 ?auto_964096 ) ( IS-CRATE ?auto_964093 ) ( not ( = ?auto_964092 ?auto_964093 ) ) ( not ( = ?auto_964098 ?auto_964092 ) ) ( not ( = ?auto_964098 ?auto_964093 ) ) ( not ( = ?auto_964099 ?auto_964096 ) ) ( HOIST-AT ?auto_964100 ?auto_964099 ) ( not ( = ?auto_964097 ?auto_964100 ) ) ( SURFACE-AT ?auto_964093 ?auto_964099 ) ( ON ?auto_964093 ?auto_964094 ) ( CLEAR ?auto_964093 ) ( not ( = ?auto_964092 ?auto_964094 ) ) ( not ( = ?auto_964093 ?auto_964094 ) ) ( not ( = ?auto_964098 ?auto_964094 ) ) ( SURFACE-AT ?auto_964098 ?auto_964096 ) ( CLEAR ?auto_964098 ) ( IS-CRATE ?auto_964092 ) ( AVAILABLE ?auto_964097 ) ( AVAILABLE ?auto_964100 ) ( SURFACE-AT ?auto_964092 ?auto_964099 ) ( ON ?auto_964092 ?auto_964095 ) ( CLEAR ?auto_964092 ) ( not ( = ?auto_964092 ?auto_964095 ) ) ( not ( = ?auto_964093 ?auto_964095 ) ) ( not ( = ?auto_964098 ?auto_964095 ) ) ( not ( = ?auto_964094 ?auto_964095 ) ) ( TRUCK-AT ?auto_964101 ?auto_964096 ) )
    :subtasks
    ( ( !DRIVE ?auto_964101 ?auto_964096 ?auto_964099 )
      ( MAKE-2CRATE ?auto_964098 ?auto_964092 ?auto_964093 )
      ( MAKE-1CRATE-VERIFY ?auto_964092 ?auto_964093 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_964102 - SURFACE
      ?auto_964103 - SURFACE
      ?auto_964104 - SURFACE
    )
    :vars
    (
      ?auto_964110 - HOIST
      ?auto_964111 - PLACE
      ?auto_964106 - PLACE
      ?auto_964108 - HOIST
      ?auto_964109 - SURFACE
      ?auto_964105 - SURFACE
      ?auto_964107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964110 ?auto_964111 ) ( IS-CRATE ?auto_964104 ) ( not ( = ?auto_964103 ?auto_964104 ) ) ( not ( = ?auto_964102 ?auto_964103 ) ) ( not ( = ?auto_964102 ?auto_964104 ) ) ( not ( = ?auto_964106 ?auto_964111 ) ) ( HOIST-AT ?auto_964108 ?auto_964106 ) ( not ( = ?auto_964110 ?auto_964108 ) ) ( SURFACE-AT ?auto_964104 ?auto_964106 ) ( ON ?auto_964104 ?auto_964109 ) ( CLEAR ?auto_964104 ) ( not ( = ?auto_964103 ?auto_964109 ) ) ( not ( = ?auto_964104 ?auto_964109 ) ) ( not ( = ?auto_964102 ?auto_964109 ) ) ( SURFACE-AT ?auto_964102 ?auto_964111 ) ( CLEAR ?auto_964102 ) ( IS-CRATE ?auto_964103 ) ( AVAILABLE ?auto_964110 ) ( AVAILABLE ?auto_964108 ) ( SURFACE-AT ?auto_964103 ?auto_964106 ) ( ON ?auto_964103 ?auto_964105 ) ( CLEAR ?auto_964103 ) ( not ( = ?auto_964103 ?auto_964105 ) ) ( not ( = ?auto_964104 ?auto_964105 ) ) ( not ( = ?auto_964102 ?auto_964105 ) ) ( not ( = ?auto_964109 ?auto_964105 ) ) ( TRUCK-AT ?auto_964107 ?auto_964111 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_964103 ?auto_964104 )
      ( MAKE-2CRATE-VERIFY ?auto_964102 ?auto_964103 ?auto_964104 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_964113 - SURFACE
      ?auto_964114 - SURFACE
      ?auto_964115 - SURFACE
      ?auto_964112 - SURFACE
    )
    :vars
    (
      ?auto_964118 - HOIST
      ?auto_964116 - PLACE
      ?auto_964121 - PLACE
      ?auto_964117 - HOIST
      ?auto_964122 - SURFACE
      ?auto_964120 - SURFACE
      ?auto_964119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964118 ?auto_964116 ) ( IS-CRATE ?auto_964112 ) ( not ( = ?auto_964115 ?auto_964112 ) ) ( not ( = ?auto_964114 ?auto_964115 ) ) ( not ( = ?auto_964114 ?auto_964112 ) ) ( not ( = ?auto_964121 ?auto_964116 ) ) ( HOIST-AT ?auto_964117 ?auto_964121 ) ( not ( = ?auto_964118 ?auto_964117 ) ) ( SURFACE-AT ?auto_964112 ?auto_964121 ) ( ON ?auto_964112 ?auto_964122 ) ( CLEAR ?auto_964112 ) ( not ( = ?auto_964115 ?auto_964122 ) ) ( not ( = ?auto_964112 ?auto_964122 ) ) ( not ( = ?auto_964114 ?auto_964122 ) ) ( SURFACE-AT ?auto_964114 ?auto_964116 ) ( CLEAR ?auto_964114 ) ( IS-CRATE ?auto_964115 ) ( AVAILABLE ?auto_964118 ) ( AVAILABLE ?auto_964117 ) ( SURFACE-AT ?auto_964115 ?auto_964121 ) ( ON ?auto_964115 ?auto_964120 ) ( CLEAR ?auto_964115 ) ( not ( = ?auto_964115 ?auto_964120 ) ) ( not ( = ?auto_964112 ?auto_964120 ) ) ( not ( = ?auto_964114 ?auto_964120 ) ) ( not ( = ?auto_964122 ?auto_964120 ) ) ( TRUCK-AT ?auto_964119 ?auto_964116 ) ( ON ?auto_964114 ?auto_964113 ) ( not ( = ?auto_964113 ?auto_964114 ) ) ( not ( = ?auto_964113 ?auto_964115 ) ) ( not ( = ?auto_964113 ?auto_964112 ) ) ( not ( = ?auto_964113 ?auto_964122 ) ) ( not ( = ?auto_964113 ?auto_964120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964114 ?auto_964115 ?auto_964112 )
      ( MAKE-3CRATE-VERIFY ?auto_964113 ?auto_964114 ?auto_964115 ?auto_964112 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_964124 - SURFACE
      ?auto_964125 - SURFACE
      ?auto_964126 - SURFACE
      ?auto_964123 - SURFACE
      ?auto_964127 - SURFACE
    )
    :vars
    (
      ?auto_964130 - HOIST
      ?auto_964128 - PLACE
      ?auto_964133 - PLACE
      ?auto_964129 - HOIST
      ?auto_964134 - SURFACE
      ?auto_964132 - SURFACE
      ?auto_964131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964130 ?auto_964128 ) ( IS-CRATE ?auto_964127 ) ( not ( = ?auto_964123 ?auto_964127 ) ) ( not ( = ?auto_964126 ?auto_964123 ) ) ( not ( = ?auto_964126 ?auto_964127 ) ) ( not ( = ?auto_964133 ?auto_964128 ) ) ( HOIST-AT ?auto_964129 ?auto_964133 ) ( not ( = ?auto_964130 ?auto_964129 ) ) ( SURFACE-AT ?auto_964127 ?auto_964133 ) ( ON ?auto_964127 ?auto_964134 ) ( CLEAR ?auto_964127 ) ( not ( = ?auto_964123 ?auto_964134 ) ) ( not ( = ?auto_964127 ?auto_964134 ) ) ( not ( = ?auto_964126 ?auto_964134 ) ) ( SURFACE-AT ?auto_964126 ?auto_964128 ) ( CLEAR ?auto_964126 ) ( IS-CRATE ?auto_964123 ) ( AVAILABLE ?auto_964130 ) ( AVAILABLE ?auto_964129 ) ( SURFACE-AT ?auto_964123 ?auto_964133 ) ( ON ?auto_964123 ?auto_964132 ) ( CLEAR ?auto_964123 ) ( not ( = ?auto_964123 ?auto_964132 ) ) ( not ( = ?auto_964127 ?auto_964132 ) ) ( not ( = ?auto_964126 ?auto_964132 ) ) ( not ( = ?auto_964134 ?auto_964132 ) ) ( TRUCK-AT ?auto_964131 ?auto_964128 ) ( ON ?auto_964125 ?auto_964124 ) ( ON ?auto_964126 ?auto_964125 ) ( not ( = ?auto_964124 ?auto_964125 ) ) ( not ( = ?auto_964124 ?auto_964126 ) ) ( not ( = ?auto_964124 ?auto_964123 ) ) ( not ( = ?auto_964124 ?auto_964127 ) ) ( not ( = ?auto_964124 ?auto_964134 ) ) ( not ( = ?auto_964124 ?auto_964132 ) ) ( not ( = ?auto_964125 ?auto_964126 ) ) ( not ( = ?auto_964125 ?auto_964123 ) ) ( not ( = ?auto_964125 ?auto_964127 ) ) ( not ( = ?auto_964125 ?auto_964134 ) ) ( not ( = ?auto_964125 ?auto_964132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964126 ?auto_964123 ?auto_964127 )
      ( MAKE-4CRATE-VERIFY ?auto_964124 ?auto_964125 ?auto_964126 ?auto_964123 ?auto_964127 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_964136 - SURFACE
      ?auto_964137 - SURFACE
      ?auto_964138 - SURFACE
      ?auto_964135 - SURFACE
      ?auto_964139 - SURFACE
      ?auto_964140 - SURFACE
    )
    :vars
    (
      ?auto_964143 - HOIST
      ?auto_964141 - PLACE
      ?auto_964146 - PLACE
      ?auto_964142 - HOIST
      ?auto_964147 - SURFACE
      ?auto_964145 - SURFACE
      ?auto_964144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964143 ?auto_964141 ) ( IS-CRATE ?auto_964140 ) ( not ( = ?auto_964139 ?auto_964140 ) ) ( not ( = ?auto_964135 ?auto_964139 ) ) ( not ( = ?auto_964135 ?auto_964140 ) ) ( not ( = ?auto_964146 ?auto_964141 ) ) ( HOIST-AT ?auto_964142 ?auto_964146 ) ( not ( = ?auto_964143 ?auto_964142 ) ) ( SURFACE-AT ?auto_964140 ?auto_964146 ) ( ON ?auto_964140 ?auto_964147 ) ( CLEAR ?auto_964140 ) ( not ( = ?auto_964139 ?auto_964147 ) ) ( not ( = ?auto_964140 ?auto_964147 ) ) ( not ( = ?auto_964135 ?auto_964147 ) ) ( SURFACE-AT ?auto_964135 ?auto_964141 ) ( CLEAR ?auto_964135 ) ( IS-CRATE ?auto_964139 ) ( AVAILABLE ?auto_964143 ) ( AVAILABLE ?auto_964142 ) ( SURFACE-AT ?auto_964139 ?auto_964146 ) ( ON ?auto_964139 ?auto_964145 ) ( CLEAR ?auto_964139 ) ( not ( = ?auto_964139 ?auto_964145 ) ) ( not ( = ?auto_964140 ?auto_964145 ) ) ( not ( = ?auto_964135 ?auto_964145 ) ) ( not ( = ?auto_964147 ?auto_964145 ) ) ( TRUCK-AT ?auto_964144 ?auto_964141 ) ( ON ?auto_964137 ?auto_964136 ) ( ON ?auto_964138 ?auto_964137 ) ( ON ?auto_964135 ?auto_964138 ) ( not ( = ?auto_964136 ?auto_964137 ) ) ( not ( = ?auto_964136 ?auto_964138 ) ) ( not ( = ?auto_964136 ?auto_964135 ) ) ( not ( = ?auto_964136 ?auto_964139 ) ) ( not ( = ?auto_964136 ?auto_964140 ) ) ( not ( = ?auto_964136 ?auto_964147 ) ) ( not ( = ?auto_964136 ?auto_964145 ) ) ( not ( = ?auto_964137 ?auto_964138 ) ) ( not ( = ?auto_964137 ?auto_964135 ) ) ( not ( = ?auto_964137 ?auto_964139 ) ) ( not ( = ?auto_964137 ?auto_964140 ) ) ( not ( = ?auto_964137 ?auto_964147 ) ) ( not ( = ?auto_964137 ?auto_964145 ) ) ( not ( = ?auto_964138 ?auto_964135 ) ) ( not ( = ?auto_964138 ?auto_964139 ) ) ( not ( = ?auto_964138 ?auto_964140 ) ) ( not ( = ?auto_964138 ?auto_964147 ) ) ( not ( = ?auto_964138 ?auto_964145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964135 ?auto_964139 ?auto_964140 )
      ( MAKE-5CRATE-VERIFY ?auto_964136 ?auto_964137 ?auto_964138 ?auto_964135 ?auto_964139 ?auto_964140 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_964149 - SURFACE
      ?auto_964150 - SURFACE
      ?auto_964151 - SURFACE
      ?auto_964148 - SURFACE
      ?auto_964152 - SURFACE
      ?auto_964154 - SURFACE
      ?auto_964153 - SURFACE
    )
    :vars
    (
      ?auto_964157 - HOIST
      ?auto_964155 - PLACE
      ?auto_964160 - PLACE
      ?auto_964156 - HOIST
      ?auto_964161 - SURFACE
      ?auto_964159 - SURFACE
      ?auto_964158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964157 ?auto_964155 ) ( IS-CRATE ?auto_964153 ) ( not ( = ?auto_964154 ?auto_964153 ) ) ( not ( = ?auto_964152 ?auto_964154 ) ) ( not ( = ?auto_964152 ?auto_964153 ) ) ( not ( = ?auto_964160 ?auto_964155 ) ) ( HOIST-AT ?auto_964156 ?auto_964160 ) ( not ( = ?auto_964157 ?auto_964156 ) ) ( SURFACE-AT ?auto_964153 ?auto_964160 ) ( ON ?auto_964153 ?auto_964161 ) ( CLEAR ?auto_964153 ) ( not ( = ?auto_964154 ?auto_964161 ) ) ( not ( = ?auto_964153 ?auto_964161 ) ) ( not ( = ?auto_964152 ?auto_964161 ) ) ( SURFACE-AT ?auto_964152 ?auto_964155 ) ( CLEAR ?auto_964152 ) ( IS-CRATE ?auto_964154 ) ( AVAILABLE ?auto_964157 ) ( AVAILABLE ?auto_964156 ) ( SURFACE-AT ?auto_964154 ?auto_964160 ) ( ON ?auto_964154 ?auto_964159 ) ( CLEAR ?auto_964154 ) ( not ( = ?auto_964154 ?auto_964159 ) ) ( not ( = ?auto_964153 ?auto_964159 ) ) ( not ( = ?auto_964152 ?auto_964159 ) ) ( not ( = ?auto_964161 ?auto_964159 ) ) ( TRUCK-AT ?auto_964158 ?auto_964155 ) ( ON ?auto_964150 ?auto_964149 ) ( ON ?auto_964151 ?auto_964150 ) ( ON ?auto_964148 ?auto_964151 ) ( ON ?auto_964152 ?auto_964148 ) ( not ( = ?auto_964149 ?auto_964150 ) ) ( not ( = ?auto_964149 ?auto_964151 ) ) ( not ( = ?auto_964149 ?auto_964148 ) ) ( not ( = ?auto_964149 ?auto_964152 ) ) ( not ( = ?auto_964149 ?auto_964154 ) ) ( not ( = ?auto_964149 ?auto_964153 ) ) ( not ( = ?auto_964149 ?auto_964161 ) ) ( not ( = ?auto_964149 ?auto_964159 ) ) ( not ( = ?auto_964150 ?auto_964151 ) ) ( not ( = ?auto_964150 ?auto_964148 ) ) ( not ( = ?auto_964150 ?auto_964152 ) ) ( not ( = ?auto_964150 ?auto_964154 ) ) ( not ( = ?auto_964150 ?auto_964153 ) ) ( not ( = ?auto_964150 ?auto_964161 ) ) ( not ( = ?auto_964150 ?auto_964159 ) ) ( not ( = ?auto_964151 ?auto_964148 ) ) ( not ( = ?auto_964151 ?auto_964152 ) ) ( not ( = ?auto_964151 ?auto_964154 ) ) ( not ( = ?auto_964151 ?auto_964153 ) ) ( not ( = ?auto_964151 ?auto_964161 ) ) ( not ( = ?auto_964151 ?auto_964159 ) ) ( not ( = ?auto_964148 ?auto_964152 ) ) ( not ( = ?auto_964148 ?auto_964154 ) ) ( not ( = ?auto_964148 ?auto_964153 ) ) ( not ( = ?auto_964148 ?auto_964161 ) ) ( not ( = ?auto_964148 ?auto_964159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964152 ?auto_964154 ?auto_964153 )
      ( MAKE-6CRATE-VERIFY ?auto_964149 ?auto_964150 ?auto_964151 ?auto_964148 ?auto_964152 ?auto_964154 ?auto_964153 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_964163 - SURFACE
      ?auto_964164 - SURFACE
      ?auto_964165 - SURFACE
      ?auto_964162 - SURFACE
      ?auto_964166 - SURFACE
      ?auto_964168 - SURFACE
      ?auto_964167 - SURFACE
      ?auto_964169 - SURFACE
    )
    :vars
    (
      ?auto_964172 - HOIST
      ?auto_964170 - PLACE
      ?auto_964175 - PLACE
      ?auto_964171 - HOIST
      ?auto_964176 - SURFACE
      ?auto_964174 - SURFACE
      ?auto_964173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964172 ?auto_964170 ) ( IS-CRATE ?auto_964169 ) ( not ( = ?auto_964167 ?auto_964169 ) ) ( not ( = ?auto_964168 ?auto_964167 ) ) ( not ( = ?auto_964168 ?auto_964169 ) ) ( not ( = ?auto_964175 ?auto_964170 ) ) ( HOIST-AT ?auto_964171 ?auto_964175 ) ( not ( = ?auto_964172 ?auto_964171 ) ) ( SURFACE-AT ?auto_964169 ?auto_964175 ) ( ON ?auto_964169 ?auto_964176 ) ( CLEAR ?auto_964169 ) ( not ( = ?auto_964167 ?auto_964176 ) ) ( not ( = ?auto_964169 ?auto_964176 ) ) ( not ( = ?auto_964168 ?auto_964176 ) ) ( SURFACE-AT ?auto_964168 ?auto_964170 ) ( CLEAR ?auto_964168 ) ( IS-CRATE ?auto_964167 ) ( AVAILABLE ?auto_964172 ) ( AVAILABLE ?auto_964171 ) ( SURFACE-AT ?auto_964167 ?auto_964175 ) ( ON ?auto_964167 ?auto_964174 ) ( CLEAR ?auto_964167 ) ( not ( = ?auto_964167 ?auto_964174 ) ) ( not ( = ?auto_964169 ?auto_964174 ) ) ( not ( = ?auto_964168 ?auto_964174 ) ) ( not ( = ?auto_964176 ?auto_964174 ) ) ( TRUCK-AT ?auto_964173 ?auto_964170 ) ( ON ?auto_964164 ?auto_964163 ) ( ON ?auto_964165 ?auto_964164 ) ( ON ?auto_964162 ?auto_964165 ) ( ON ?auto_964166 ?auto_964162 ) ( ON ?auto_964168 ?auto_964166 ) ( not ( = ?auto_964163 ?auto_964164 ) ) ( not ( = ?auto_964163 ?auto_964165 ) ) ( not ( = ?auto_964163 ?auto_964162 ) ) ( not ( = ?auto_964163 ?auto_964166 ) ) ( not ( = ?auto_964163 ?auto_964168 ) ) ( not ( = ?auto_964163 ?auto_964167 ) ) ( not ( = ?auto_964163 ?auto_964169 ) ) ( not ( = ?auto_964163 ?auto_964176 ) ) ( not ( = ?auto_964163 ?auto_964174 ) ) ( not ( = ?auto_964164 ?auto_964165 ) ) ( not ( = ?auto_964164 ?auto_964162 ) ) ( not ( = ?auto_964164 ?auto_964166 ) ) ( not ( = ?auto_964164 ?auto_964168 ) ) ( not ( = ?auto_964164 ?auto_964167 ) ) ( not ( = ?auto_964164 ?auto_964169 ) ) ( not ( = ?auto_964164 ?auto_964176 ) ) ( not ( = ?auto_964164 ?auto_964174 ) ) ( not ( = ?auto_964165 ?auto_964162 ) ) ( not ( = ?auto_964165 ?auto_964166 ) ) ( not ( = ?auto_964165 ?auto_964168 ) ) ( not ( = ?auto_964165 ?auto_964167 ) ) ( not ( = ?auto_964165 ?auto_964169 ) ) ( not ( = ?auto_964165 ?auto_964176 ) ) ( not ( = ?auto_964165 ?auto_964174 ) ) ( not ( = ?auto_964162 ?auto_964166 ) ) ( not ( = ?auto_964162 ?auto_964168 ) ) ( not ( = ?auto_964162 ?auto_964167 ) ) ( not ( = ?auto_964162 ?auto_964169 ) ) ( not ( = ?auto_964162 ?auto_964176 ) ) ( not ( = ?auto_964162 ?auto_964174 ) ) ( not ( = ?auto_964166 ?auto_964168 ) ) ( not ( = ?auto_964166 ?auto_964167 ) ) ( not ( = ?auto_964166 ?auto_964169 ) ) ( not ( = ?auto_964166 ?auto_964176 ) ) ( not ( = ?auto_964166 ?auto_964174 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964168 ?auto_964167 ?auto_964169 )
      ( MAKE-7CRATE-VERIFY ?auto_964163 ?auto_964164 ?auto_964165 ?auto_964162 ?auto_964166 ?auto_964168 ?auto_964167 ?auto_964169 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_964178 - SURFACE
      ?auto_964179 - SURFACE
      ?auto_964180 - SURFACE
      ?auto_964177 - SURFACE
      ?auto_964181 - SURFACE
      ?auto_964183 - SURFACE
      ?auto_964182 - SURFACE
      ?auto_964184 - SURFACE
      ?auto_964185 - SURFACE
    )
    :vars
    (
      ?auto_964188 - HOIST
      ?auto_964186 - PLACE
      ?auto_964191 - PLACE
      ?auto_964187 - HOIST
      ?auto_964192 - SURFACE
      ?auto_964190 - SURFACE
      ?auto_964189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964188 ?auto_964186 ) ( IS-CRATE ?auto_964185 ) ( not ( = ?auto_964184 ?auto_964185 ) ) ( not ( = ?auto_964182 ?auto_964184 ) ) ( not ( = ?auto_964182 ?auto_964185 ) ) ( not ( = ?auto_964191 ?auto_964186 ) ) ( HOIST-AT ?auto_964187 ?auto_964191 ) ( not ( = ?auto_964188 ?auto_964187 ) ) ( SURFACE-AT ?auto_964185 ?auto_964191 ) ( ON ?auto_964185 ?auto_964192 ) ( CLEAR ?auto_964185 ) ( not ( = ?auto_964184 ?auto_964192 ) ) ( not ( = ?auto_964185 ?auto_964192 ) ) ( not ( = ?auto_964182 ?auto_964192 ) ) ( SURFACE-AT ?auto_964182 ?auto_964186 ) ( CLEAR ?auto_964182 ) ( IS-CRATE ?auto_964184 ) ( AVAILABLE ?auto_964188 ) ( AVAILABLE ?auto_964187 ) ( SURFACE-AT ?auto_964184 ?auto_964191 ) ( ON ?auto_964184 ?auto_964190 ) ( CLEAR ?auto_964184 ) ( not ( = ?auto_964184 ?auto_964190 ) ) ( not ( = ?auto_964185 ?auto_964190 ) ) ( not ( = ?auto_964182 ?auto_964190 ) ) ( not ( = ?auto_964192 ?auto_964190 ) ) ( TRUCK-AT ?auto_964189 ?auto_964186 ) ( ON ?auto_964179 ?auto_964178 ) ( ON ?auto_964180 ?auto_964179 ) ( ON ?auto_964177 ?auto_964180 ) ( ON ?auto_964181 ?auto_964177 ) ( ON ?auto_964183 ?auto_964181 ) ( ON ?auto_964182 ?auto_964183 ) ( not ( = ?auto_964178 ?auto_964179 ) ) ( not ( = ?auto_964178 ?auto_964180 ) ) ( not ( = ?auto_964178 ?auto_964177 ) ) ( not ( = ?auto_964178 ?auto_964181 ) ) ( not ( = ?auto_964178 ?auto_964183 ) ) ( not ( = ?auto_964178 ?auto_964182 ) ) ( not ( = ?auto_964178 ?auto_964184 ) ) ( not ( = ?auto_964178 ?auto_964185 ) ) ( not ( = ?auto_964178 ?auto_964192 ) ) ( not ( = ?auto_964178 ?auto_964190 ) ) ( not ( = ?auto_964179 ?auto_964180 ) ) ( not ( = ?auto_964179 ?auto_964177 ) ) ( not ( = ?auto_964179 ?auto_964181 ) ) ( not ( = ?auto_964179 ?auto_964183 ) ) ( not ( = ?auto_964179 ?auto_964182 ) ) ( not ( = ?auto_964179 ?auto_964184 ) ) ( not ( = ?auto_964179 ?auto_964185 ) ) ( not ( = ?auto_964179 ?auto_964192 ) ) ( not ( = ?auto_964179 ?auto_964190 ) ) ( not ( = ?auto_964180 ?auto_964177 ) ) ( not ( = ?auto_964180 ?auto_964181 ) ) ( not ( = ?auto_964180 ?auto_964183 ) ) ( not ( = ?auto_964180 ?auto_964182 ) ) ( not ( = ?auto_964180 ?auto_964184 ) ) ( not ( = ?auto_964180 ?auto_964185 ) ) ( not ( = ?auto_964180 ?auto_964192 ) ) ( not ( = ?auto_964180 ?auto_964190 ) ) ( not ( = ?auto_964177 ?auto_964181 ) ) ( not ( = ?auto_964177 ?auto_964183 ) ) ( not ( = ?auto_964177 ?auto_964182 ) ) ( not ( = ?auto_964177 ?auto_964184 ) ) ( not ( = ?auto_964177 ?auto_964185 ) ) ( not ( = ?auto_964177 ?auto_964192 ) ) ( not ( = ?auto_964177 ?auto_964190 ) ) ( not ( = ?auto_964181 ?auto_964183 ) ) ( not ( = ?auto_964181 ?auto_964182 ) ) ( not ( = ?auto_964181 ?auto_964184 ) ) ( not ( = ?auto_964181 ?auto_964185 ) ) ( not ( = ?auto_964181 ?auto_964192 ) ) ( not ( = ?auto_964181 ?auto_964190 ) ) ( not ( = ?auto_964183 ?auto_964182 ) ) ( not ( = ?auto_964183 ?auto_964184 ) ) ( not ( = ?auto_964183 ?auto_964185 ) ) ( not ( = ?auto_964183 ?auto_964192 ) ) ( not ( = ?auto_964183 ?auto_964190 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964182 ?auto_964184 ?auto_964185 )
      ( MAKE-8CRATE-VERIFY ?auto_964178 ?auto_964179 ?auto_964180 ?auto_964177 ?auto_964181 ?auto_964183 ?auto_964182 ?auto_964184 ?auto_964185 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_964194 - SURFACE
      ?auto_964195 - SURFACE
      ?auto_964196 - SURFACE
      ?auto_964193 - SURFACE
      ?auto_964197 - SURFACE
      ?auto_964199 - SURFACE
      ?auto_964198 - SURFACE
      ?auto_964200 - SURFACE
      ?auto_964201 - SURFACE
      ?auto_964202 - SURFACE
    )
    :vars
    (
      ?auto_964205 - HOIST
      ?auto_964203 - PLACE
      ?auto_964208 - PLACE
      ?auto_964204 - HOIST
      ?auto_964209 - SURFACE
      ?auto_964207 - SURFACE
      ?auto_964206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964205 ?auto_964203 ) ( IS-CRATE ?auto_964202 ) ( not ( = ?auto_964201 ?auto_964202 ) ) ( not ( = ?auto_964200 ?auto_964201 ) ) ( not ( = ?auto_964200 ?auto_964202 ) ) ( not ( = ?auto_964208 ?auto_964203 ) ) ( HOIST-AT ?auto_964204 ?auto_964208 ) ( not ( = ?auto_964205 ?auto_964204 ) ) ( SURFACE-AT ?auto_964202 ?auto_964208 ) ( ON ?auto_964202 ?auto_964209 ) ( CLEAR ?auto_964202 ) ( not ( = ?auto_964201 ?auto_964209 ) ) ( not ( = ?auto_964202 ?auto_964209 ) ) ( not ( = ?auto_964200 ?auto_964209 ) ) ( SURFACE-AT ?auto_964200 ?auto_964203 ) ( CLEAR ?auto_964200 ) ( IS-CRATE ?auto_964201 ) ( AVAILABLE ?auto_964205 ) ( AVAILABLE ?auto_964204 ) ( SURFACE-AT ?auto_964201 ?auto_964208 ) ( ON ?auto_964201 ?auto_964207 ) ( CLEAR ?auto_964201 ) ( not ( = ?auto_964201 ?auto_964207 ) ) ( not ( = ?auto_964202 ?auto_964207 ) ) ( not ( = ?auto_964200 ?auto_964207 ) ) ( not ( = ?auto_964209 ?auto_964207 ) ) ( TRUCK-AT ?auto_964206 ?auto_964203 ) ( ON ?auto_964195 ?auto_964194 ) ( ON ?auto_964196 ?auto_964195 ) ( ON ?auto_964193 ?auto_964196 ) ( ON ?auto_964197 ?auto_964193 ) ( ON ?auto_964199 ?auto_964197 ) ( ON ?auto_964198 ?auto_964199 ) ( ON ?auto_964200 ?auto_964198 ) ( not ( = ?auto_964194 ?auto_964195 ) ) ( not ( = ?auto_964194 ?auto_964196 ) ) ( not ( = ?auto_964194 ?auto_964193 ) ) ( not ( = ?auto_964194 ?auto_964197 ) ) ( not ( = ?auto_964194 ?auto_964199 ) ) ( not ( = ?auto_964194 ?auto_964198 ) ) ( not ( = ?auto_964194 ?auto_964200 ) ) ( not ( = ?auto_964194 ?auto_964201 ) ) ( not ( = ?auto_964194 ?auto_964202 ) ) ( not ( = ?auto_964194 ?auto_964209 ) ) ( not ( = ?auto_964194 ?auto_964207 ) ) ( not ( = ?auto_964195 ?auto_964196 ) ) ( not ( = ?auto_964195 ?auto_964193 ) ) ( not ( = ?auto_964195 ?auto_964197 ) ) ( not ( = ?auto_964195 ?auto_964199 ) ) ( not ( = ?auto_964195 ?auto_964198 ) ) ( not ( = ?auto_964195 ?auto_964200 ) ) ( not ( = ?auto_964195 ?auto_964201 ) ) ( not ( = ?auto_964195 ?auto_964202 ) ) ( not ( = ?auto_964195 ?auto_964209 ) ) ( not ( = ?auto_964195 ?auto_964207 ) ) ( not ( = ?auto_964196 ?auto_964193 ) ) ( not ( = ?auto_964196 ?auto_964197 ) ) ( not ( = ?auto_964196 ?auto_964199 ) ) ( not ( = ?auto_964196 ?auto_964198 ) ) ( not ( = ?auto_964196 ?auto_964200 ) ) ( not ( = ?auto_964196 ?auto_964201 ) ) ( not ( = ?auto_964196 ?auto_964202 ) ) ( not ( = ?auto_964196 ?auto_964209 ) ) ( not ( = ?auto_964196 ?auto_964207 ) ) ( not ( = ?auto_964193 ?auto_964197 ) ) ( not ( = ?auto_964193 ?auto_964199 ) ) ( not ( = ?auto_964193 ?auto_964198 ) ) ( not ( = ?auto_964193 ?auto_964200 ) ) ( not ( = ?auto_964193 ?auto_964201 ) ) ( not ( = ?auto_964193 ?auto_964202 ) ) ( not ( = ?auto_964193 ?auto_964209 ) ) ( not ( = ?auto_964193 ?auto_964207 ) ) ( not ( = ?auto_964197 ?auto_964199 ) ) ( not ( = ?auto_964197 ?auto_964198 ) ) ( not ( = ?auto_964197 ?auto_964200 ) ) ( not ( = ?auto_964197 ?auto_964201 ) ) ( not ( = ?auto_964197 ?auto_964202 ) ) ( not ( = ?auto_964197 ?auto_964209 ) ) ( not ( = ?auto_964197 ?auto_964207 ) ) ( not ( = ?auto_964199 ?auto_964198 ) ) ( not ( = ?auto_964199 ?auto_964200 ) ) ( not ( = ?auto_964199 ?auto_964201 ) ) ( not ( = ?auto_964199 ?auto_964202 ) ) ( not ( = ?auto_964199 ?auto_964209 ) ) ( not ( = ?auto_964199 ?auto_964207 ) ) ( not ( = ?auto_964198 ?auto_964200 ) ) ( not ( = ?auto_964198 ?auto_964201 ) ) ( not ( = ?auto_964198 ?auto_964202 ) ) ( not ( = ?auto_964198 ?auto_964209 ) ) ( not ( = ?auto_964198 ?auto_964207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964200 ?auto_964201 ?auto_964202 )
      ( MAKE-9CRATE-VERIFY ?auto_964194 ?auto_964195 ?auto_964196 ?auto_964193 ?auto_964197 ?auto_964199 ?auto_964198 ?auto_964200 ?auto_964201 ?auto_964202 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_964211 - SURFACE
      ?auto_964212 - SURFACE
      ?auto_964213 - SURFACE
      ?auto_964210 - SURFACE
      ?auto_964214 - SURFACE
      ?auto_964216 - SURFACE
      ?auto_964215 - SURFACE
      ?auto_964217 - SURFACE
      ?auto_964218 - SURFACE
      ?auto_964219 - SURFACE
      ?auto_964220 - SURFACE
    )
    :vars
    (
      ?auto_964223 - HOIST
      ?auto_964221 - PLACE
      ?auto_964226 - PLACE
      ?auto_964222 - HOIST
      ?auto_964227 - SURFACE
      ?auto_964225 - SURFACE
      ?auto_964224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964223 ?auto_964221 ) ( IS-CRATE ?auto_964220 ) ( not ( = ?auto_964219 ?auto_964220 ) ) ( not ( = ?auto_964218 ?auto_964219 ) ) ( not ( = ?auto_964218 ?auto_964220 ) ) ( not ( = ?auto_964226 ?auto_964221 ) ) ( HOIST-AT ?auto_964222 ?auto_964226 ) ( not ( = ?auto_964223 ?auto_964222 ) ) ( SURFACE-AT ?auto_964220 ?auto_964226 ) ( ON ?auto_964220 ?auto_964227 ) ( CLEAR ?auto_964220 ) ( not ( = ?auto_964219 ?auto_964227 ) ) ( not ( = ?auto_964220 ?auto_964227 ) ) ( not ( = ?auto_964218 ?auto_964227 ) ) ( SURFACE-AT ?auto_964218 ?auto_964221 ) ( CLEAR ?auto_964218 ) ( IS-CRATE ?auto_964219 ) ( AVAILABLE ?auto_964223 ) ( AVAILABLE ?auto_964222 ) ( SURFACE-AT ?auto_964219 ?auto_964226 ) ( ON ?auto_964219 ?auto_964225 ) ( CLEAR ?auto_964219 ) ( not ( = ?auto_964219 ?auto_964225 ) ) ( not ( = ?auto_964220 ?auto_964225 ) ) ( not ( = ?auto_964218 ?auto_964225 ) ) ( not ( = ?auto_964227 ?auto_964225 ) ) ( TRUCK-AT ?auto_964224 ?auto_964221 ) ( ON ?auto_964212 ?auto_964211 ) ( ON ?auto_964213 ?auto_964212 ) ( ON ?auto_964210 ?auto_964213 ) ( ON ?auto_964214 ?auto_964210 ) ( ON ?auto_964216 ?auto_964214 ) ( ON ?auto_964215 ?auto_964216 ) ( ON ?auto_964217 ?auto_964215 ) ( ON ?auto_964218 ?auto_964217 ) ( not ( = ?auto_964211 ?auto_964212 ) ) ( not ( = ?auto_964211 ?auto_964213 ) ) ( not ( = ?auto_964211 ?auto_964210 ) ) ( not ( = ?auto_964211 ?auto_964214 ) ) ( not ( = ?auto_964211 ?auto_964216 ) ) ( not ( = ?auto_964211 ?auto_964215 ) ) ( not ( = ?auto_964211 ?auto_964217 ) ) ( not ( = ?auto_964211 ?auto_964218 ) ) ( not ( = ?auto_964211 ?auto_964219 ) ) ( not ( = ?auto_964211 ?auto_964220 ) ) ( not ( = ?auto_964211 ?auto_964227 ) ) ( not ( = ?auto_964211 ?auto_964225 ) ) ( not ( = ?auto_964212 ?auto_964213 ) ) ( not ( = ?auto_964212 ?auto_964210 ) ) ( not ( = ?auto_964212 ?auto_964214 ) ) ( not ( = ?auto_964212 ?auto_964216 ) ) ( not ( = ?auto_964212 ?auto_964215 ) ) ( not ( = ?auto_964212 ?auto_964217 ) ) ( not ( = ?auto_964212 ?auto_964218 ) ) ( not ( = ?auto_964212 ?auto_964219 ) ) ( not ( = ?auto_964212 ?auto_964220 ) ) ( not ( = ?auto_964212 ?auto_964227 ) ) ( not ( = ?auto_964212 ?auto_964225 ) ) ( not ( = ?auto_964213 ?auto_964210 ) ) ( not ( = ?auto_964213 ?auto_964214 ) ) ( not ( = ?auto_964213 ?auto_964216 ) ) ( not ( = ?auto_964213 ?auto_964215 ) ) ( not ( = ?auto_964213 ?auto_964217 ) ) ( not ( = ?auto_964213 ?auto_964218 ) ) ( not ( = ?auto_964213 ?auto_964219 ) ) ( not ( = ?auto_964213 ?auto_964220 ) ) ( not ( = ?auto_964213 ?auto_964227 ) ) ( not ( = ?auto_964213 ?auto_964225 ) ) ( not ( = ?auto_964210 ?auto_964214 ) ) ( not ( = ?auto_964210 ?auto_964216 ) ) ( not ( = ?auto_964210 ?auto_964215 ) ) ( not ( = ?auto_964210 ?auto_964217 ) ) ( not ( = ?auto_964210 ?auto_964218 ) ) ( not ( = ?auto_964210 ?auto_964219 ) ) ( not ( = ?auto_964210 ?auto_964220 ) ) ( not ( = ?auto_964210 ?auto_964227 ) ) ( not ( = ?auto_964210 ?auto_964225 ) ) ( not ( = ?auto_964214 ?auto_964216 ) ) ( not ( = ?auto_964214 ?auto_964215 ) ) ( not ( = ?auto_964214 ?auto_964217 ) ) ( not ( = ?auto_964214 ?auto_964218 ) ) ( not ( = ?auto_964214 ?auto_964219 ) ) ( not ( = ?auto_964214 ?auto_964220 ) ) ( not ( = ?auto_964214 ?auto_964227 ) ) ( not ( = ?auto_964214 ?auto_964225 ) ) ( not ( = ?auto_964216 ?auto_964215 ) ) ( not ( = ?auto_964216 ?auto_964217 ) ) ( not ( = ?auto_964216 ?auto_964218 ) ) ( not ( = ?auto_964216 ?auto_964219 ) ) ( not ( = ?auto_964216 ?auto_964220 ) ) ( not ( = ?auto_964216 ?auto_964227 ) ) ( not ( = ?auto_964216 ?auto_964225 ) ) ( not ( = ?auto_964215 ?auto_964217 ) ) ( not ( = ?auto_964215 ?auto_964218 ) ) ( not ( = ?auto_964215 ?auto_964219 ) ) ( not ( = ?auto_964215 ?auto_964220 ) ) ( not ( = ?auto_964215 ?auto_964227 ) ) ( not ( = ?auto_964215 ?auto_964225 ) ) ( not ( = ?auto_964217 ?auto_964218 ) ) ( not ( = ?auto_964217 ?auto_964219 ) ) ( not ( = ?auto_964217 ?auto_964220 ) ) ( not ( = ?auto_964217 ?auto_964227 ) ) ( not ( = ?auto_964217 ?auto_964225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964218 ?auto_964219 ?auto_964220 )
      ( MAKE-10CRATE-VERIFY ?auto_964211 ?auto_964212 ?auto_964213 ?auto_964210 ?auto_964214 ?auto_964216 ?auto_964215 ?auto_964217 ?auto_964218 ?auto_964219 ?auto_964220 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_964229 - SURFACE
      ?auto_964230 - SURFACE
      ?auto_964231 - SURFACE
      ?auto_964228 - SURFACE
      ?auto_964232 - SURFACE
      ?auto_964234 - SURFACE
      ?auto_964233 - SURFACE
      ?auto_964235 - SURFACE
      ?auto_964236 - SURFACE
      ?auto_964237 - SURFACE
      ?auto_964238 - SURFACE
      ?auto_964239 - SURFACE
    )
    :vars
    (
      ?auto_964242 - HOIST
      ?auto_964240 - PLACE
      ?auto_964245 - PLACE
      ?auto_964241 - HOIST
      ?auto_964246 - SURFACE
      ?auto_964244 - SURFACE
      ?auto_964243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964242 ?auto_964240 ) ( IS-CRATE ?auto_964239 ) ( not ( = ?auto_964238 ?auto_964239 ) ) ( not ( = ?auto_964237 ?auto_964238 ) ) ( not ( = ?auto_964237 ?auto_964239 ) ) ( not ( = ?auto_964245 ?auto_964240 ) ) ( HOIST-AT ?auto_964241 ?auto_964245 ) ( not ( = ?auto_964242 ?auto_964241 ) ) ( SURFACE-AT ?auto_964239 ?auto_964245 ) ( ON ?auto_964239 ?auto_964246 ) ( CLEAR ?auto_964239 ) ( not ( = ?auto_964238 ?auto_964246 ) ) ( not ( = ?auto_964239 ?auto_964246 ) ) ( not ( = ?auto_964237 ?auto_964246 ) ) ( SURFACE-AT ?auto_964237 ?auto_964240 ) ( CLEAR ?auto_964237 ) ( IS-CRATE ?auto_964238 ) ( AVAILABLE ?auto_964242 ) ( AVAILABLE ?auto_964241 ) ( SURFACE-AT ?auto_964238 ?auto_964245 ) ( ON ?auto_964238 ?auto_964244 ) ( CLEAR ?auto_964238 ) ( not ( = ?auto_964238 ?auto_964244 ) ) ( not ( = ?auto_964239 ?auto_964244 ) ) ( not ( = ?auto_964237 ?auto_964244 ) ) ( not ( = ?auto_964246 ?auto_964244 ) ) ( TRUCK-AT ?auto_964243 ?auto_964240 ) ( ON ?auto_964230 ?auto_964229 ) ( ON ?auto_964231 ?auto_964230 ) ( ON ?auto_964228 ?auto_964231 ) ( ON ?auto_964232 ?auto_964228 ) ( ON ?auto_964234 ?auto_964232 ) ( ON ?auto_964233 ?auto_964234 ) ( ON ?auto_964235 ?auto_964233 ) ( ON ?auto_964236 ?auto_964235 ) ( ON ?auto_964237 ?auto_964236 ) ( not ( = ?auto_964229 ?auto_964230 ) ) ( not ( = ?auto_964229 ?auto_964231 ) ) ( not ( = ?auto_964229 ?auto_964228 ) ) ( not ( = ?auto_964229 ?auto_964232 ) ) ( not ( = ?auto_964229 ?auto_964234 ) ) ( not ( = ?auto_964229 ?auto_964233 ) ) ( not ( = ?auto_964229 ?auto_964235 ) ) ( not ( = ?auto_964229 ?auto_964236 ) ) ( not ( = ?auto_964229 ?auto_964237 ) ) ( not ( = ?auto_964229 ?auto_964238 ) ) ( not ( = ?auto_964229 ?auto_964239 ) ) ( not ( = ?auto_964229 ?auto_964246 ) ) ( not ( = ?auto_964229 ?auto_964244 ) ) ( not ( = ?auto_964230 ?auto_964231 ) ) ( not ( = ?auto_964230 ?auto_964228 ) ) ( not ( = ?auto_964230 ?auto_964232 ) ) ( not ( = ?auto_964230 ?auto_964234 ) ) ( not ( = ?auto_964230 ?auto_964233 ) ) ( not ( = ?auto_964230 ?auto_964235 ) ) ( not ( = ?auto_964230 ?auto_964236 ) ) ( not ( = ?auto_964230 ?auto_964237 ) ) ( not ( = ?auto_964230 ?auto_964238 ) ) ( not ( = ?auto_964230 ?auto_964239 ) ) ( not ( = ?auto_964230 ?auto_964246 ) ) ( not ( = ?auto_964230 ?auto_964244 ) ) ( not ( = ?auto_964231 ?auto_964228 ) ) ( not ( = ?auto_964231 ?auto_964232 ) ) ( not ( = ?auto_964231 ?auto_964234 ) ) ( not ( = ?auto_964231 ?auto_964233 ) ) ( not ( = ?auto_964231 ?auto_964235 ) ) ( not ( = ?auto_964231 ?auto_964236 ) ) ( not ( = ?auto_964231 ?auto_964237 ) ) ( not ( = ?auto_964231 ?auto_964238 ) ) ( not ( = ?auto_964231 ?auto_964239 ) ) ( not ( = ?auto_964231 ?auto_964246 ) ) ( not ( = ?auto_964231 ?auto_964244 ) ) ( not ( = ?auto_964228 ?auto_964232 ) ) ( not ( = ?auto_964228 ?auto_964234 ) ) ( not ( = ?auto_964228 ?auto_964233 ) ) ( not ( = ?auto_964228 ?auto_964235 ) ) ( not ( = ?auto_964228 ?auto_964236 ) ) ( not ( = ?auto_964228 ?auto_964237 ) ) ( not ( = ?auto_964228 ?auto_964238 ) ) ( not ( = ?auto_964228 ?auto_964239 ) ) ( not ( = ?auto_964228 ?auto_964246 ) ) ( not ( = ?auto_964228 ?auto_964244 ) ) ( not ( = ?auto_964232 ?auto_964234 ) ) ( not ( = ?auto_964232 ?auto_964233 ) ) ( not ( = ?auto_964232 ?auto_964235 ) ) ( not ( = ?auto_964232 ?auto_964236 ) ) ( not ( = ?auto_964232 ?auto_964237 ) ) ( not ( = ?auto_964232 ?auto_964238 ) ) ( not ( = ?auto_964232 ?auto_964239 ) ) ( not ( = ?auto_964232 ?auto_964246 ) ) ( not ( = ?auto_964232 ?auto_964244 ) ) ( not ( = ?auto_964234 ?auto_964233 ) ) ( not ( = ?auto_964234 ?auto_964235 ) ) ( not ( = ?auto_964234 ?auto_964236 ) ) ( not ( = ?auto_964234 ?auto_964237 ) ) ( not ( = ?auto_964234 ?auto_964238 ) ) ( not ( = ?auto_964234 ?auto_964239 ) ) ( not ( = ?auto_964234 ?auto_964246 ) ) ( not ( = ?auto_964234 ?auto_964244 ) ) ( not ( = ?auto_964233 ?auto_964235 ) ) ( not ( = ?auto_964233 ?auto_964236 ) ) ( not ( = ?auto_964233 ?auto_964237 ) ) ( not ( = ?auto_964233 ?auto_964238 ) ) ( not ( = ?auto_964233 ?auto_964239 ) ) ( not ( = ?auto_964233 ?auto_964246 ) ) ( not ( = ?auto_964233 ?auto_964244 ) ) ( not ( = ?auto_964235 ?auto_964236 ) ) ( not ( = ?auto_964235 ?auto_964237 ) ) ( not ( = ?auto_964235 ?auto_964238 ) ) ( not ( = ?auto_964235 ?auto_964239 ) ) ( not ( = ?auto_964235 ?auto_964246 ) ) ( not ( = ?auto_964235 ?auto_964244 ) ) ( not ( = ?auto_964236 ?auto_964237 ) ) ( not ( = ?auto_964236 ?auto_964238 ) ) ( not ( = ?auto_964236 ?auto_964239 ) ) ( not ( = ?auto_964236 ?auto_964246 ) ) ( not ( = ?auto_964236 ?auto_964244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964237 ?auto_964238 ?auto_964239 )
      ( MAKE-11CRATE-VERIFY ?auto_964229 ?auto_964230 ?auto_964231 ?auto_964228 ?auto_964232 ?auto_964234 ?auto_964233 ?auto_964235 ?auto_964236 ?auto_964237 ?auto_964238 ?auto_964239 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_964248 - SURFACE
      ?auto_964249 - SURFACE
      ?auto_964250 - SURFACE
      ?auto_964247 - SURFACE
      ?auto_964251 - SURFACE
      ?auto_964253 - SURFACE
      ?auto_964252 - SURFACE
      ?auto_964254 - SURFACE
      ?auto_964255 - SURFACE
      ?auto_964256 - SURFACE
      ?auto_964257 - SURFACE
      ?auto_964258 - SURFACE
      ?auto_964259 - SURFACE
    )
    :vars
    (
      ?auto_964262 - HOIST
      ?auto_964260 - PLACE
      ?auto_964265 - PLACE
      ?auto_964261 - HOIST
      ?auto_964266 - SURFACE
      ?auto_964264 - SURFACE
      ?auto_964263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964262 ?auto_964260 ) ( IS-CRATE ?auto_964259 ) ( not ( = ?auto_964258 ?auto_964259 ) ) ( not ( = ?auto_964257 ?auto_964258 ) ) ( not ( = ?auto_964257 ?auto_964259 ) ) ( not ( = ?auto_964265 ?auto_964260 ) ) ( HOIST-AT ?auto_964261 ?auto_964265 ) ( not ( = ?auto_964262 ?auto_964261 ) ) ( SURFACE-AT ?auto_964259 ?auto_964265 ) ( ON ?auto_964259 ?auto_964266 ) ( CLEAR ?auto_964259 ) ( not ( = ?auto_964258 ?auto_964266 ) ) ( not ( = ?auto_964259 ?auto_964266 ) ) ( not ( = ?auto_964257 ?auto_964266 ) ) ( SURFACE-AT ?auto_964257 ?auto_964260 ) ( CLEAR ?auto_964257 ) ( IS-CRATE ?auto_964258 ) ( AVAILABLE ?auto_964262 ) ( AVAILABLE ?auto_964261 ) ( SURFACE-AT ?auto_964258 ?auto_964265 ) ( ON ?auto_964258 ?auto_964264 ) ( CLEAR ?auto_964258 ) ( not ( = ?auto_964258 ?auto_964264 ) ) ( not ( = ?auto_964259 ?auto_964264 ) ) ( not ( = ?auto_964257 ?auto_964264 ) ) ( not ( = ?auto_964266 ?auto_964264 ) ) ( TRUCK-AT ?auto_964263 ?auto_964260 ) ( ON ?auto_964249 ?auto_964248 ) ( ON ?auto_964250 ?auto_964249 ) ( ON ?auto_964247 ?auto_964250 ) ( ON ?auto_964251 ?auto_964247 ) ( ON ?auto_964253 ?auto_964251 ) ( ON ?auto_964252 ?auto_964253 ) ( ON ?auto_964254 ?auto_964252 ) ( ON ?auto_964255 ?auto_964254 ) ( ON ?auto_964256 ?auto_964255 ) ( ON ?auto_964257 ?auto_964256 ) ( not ( = ?auto_964248 ?auto_964249 ) ) ( not ( = ?auto_964248 ?auto_964250 ) ) ( not ( = ?auto_964248 ?auto_964247 ) ) ( not ( = ?auto_964248 ?auto_964251 ) ) ( not ( = ?auto_964248 ?auto_964253 ) ) ( not ( = ?auto_964248 ?auto_964252 ) ) ( not ( = ?auto_964248 ?auto_964254 ) ) ( not ( = ?auto_964248 ?auto_964255 ) ) ( not ( = ?auto_964248 ?auto_964256 ) ) ( not ( = ?auto_964248 ?auto_964257 ) ) ( not ( = ?auto_964248 ?auto_964258 ) ) ( not ( = ?auto_964248 ?auto_964259 ) ) ( not ( = ?auto_964248 ?auto_964266 ) ) ( not ( = ?auto_964248 ?auto_964264 ) ) ( not ( = ?auto_964249 ?auto_964250 ) ) ( not ( = ?auto_964249 ?auto_964247 ) ) ( not ( = ?auto_964249 ?auto_964251 ) ) ( not ( = ?auto_964249 ?auto_964253 ) ) ( not ( = ?auto_964249 ?auto_964252 ) ) ( not ( = ?auto_964249 ?auto_964254 ) ) ( not ( = ?auto_964249 ?auto_964255 ) ) ( not ( = ?auto_964249 ?auto_964256 ) ) ( not ( = ?auto_964249 ?auto_964257 ) ) ( not ( = ?auto_964249 ?auto_964258 ) ) ( not ( = ?auto_964249 ?auto_964259 ) ) ( not ( = ?auto_964249 ?auto_964266 ) ) ( not ( = ?auto_964249 ?auto_964264 ) ) ( not ( = ?auto_964250 ?auto_964247 ) ) ( not ( = ?auto_964250 ?auto_964251 ) ) ( not ( = ?auto_964250 ?auto_964253 ) ) ( not ( = ?auto_964250 ?auto_964252 ) ) ( not ( = ?auto_964250 ?auto_964254 ) ) ( not ( = ?auto_964250 ?auto_964255 ) ) ( not ( = ?auto_964250 ?auto_964256 ) ) ( not ( = ?auto_964250 ?auto_964257 ) ) ( not ( = ?auto_964250 ?auto_964258 ) ) ( not ( = ?auto_964250 ?auto_964259 ) ) ( not ( = ?auto_964250 ?auto_964266 ) ) ( not ( = ?auto_964250 ?auto_964264 ) ) ( not ( = ?auto_964247 ?auto_964251 ) ) ( not ( = ?auto_964247 ?auto_964253 ) ) ( not ( = ?auto_964247 ?auto_964252 ) ) ( not ( = ?auto_964247 ?auto_964254 ) ) ( not ( = ?auto_964247 ?auto_964255 ) ) ( not ( = ?auto_964247 ?auto_964256 ) ) ( not ( = ?auto_964247 ?auto_964257 ) ) ( not ( = ?auto_964247 ?auto_964258 ) ) ( not ( = ?auto_964247 ?auto_964259 ) ) ( not ( = ?auto_964247 ?auto_964266 ) ) ( not ( = ?auto_964247 ?auto_964264 ) ) ( not ( = ?auto_964251 ?auto_964253 ) ) ( not ( = ?auto_964251 ?auto_964252 ) ) ( not ( = ?auto_964251 ?auto_964254 ) ) ( not ( = ?auto_964251 ?auto_964255 ) ) ( not ( = ?auto_964251 ?auto_964256 ) ) ( not ( = ?auto_964251 ?auto_964257 ) ) ( not ( = ?auto_964251 ?auto_964258 ) ) ( not ( = ?auto_964251 ?auto_964259 ) ) ( not ( = ?auto_964251 ?auto_964266 ) ) ( not ( = ?auto_964251 ?auto_964264 ) ) ( not ( = ?auto_964253 ?auto_964252 ) ) ( not ( = ?auto_964253 ?auto_964254 ) ) ( not ( = ?auto_964253 ?auto_964255 ) ) ( not ( = ?auto_964253 ?auto_964256 ) ) ( not ( = ?auto_964253 ?auto_964257 ) ) ( not ( = ?auto_964253 ?auto_964258 ) ) ( not ( = ?auto_964253 ?auto_964259 ) ) ( not ( = ?auto_964253 ?auto_964266 ) ) ( not ( = ?auto_964253 ?auto_964264 ) ) ( not ( = ?auto_964252 ?auto_964254 ) ) ( not ( = ?auto_964252 ?auto_964255 ) ) ( not ( = ?auto_964252 ?auto_964256 ) ) ( not ( = ?auto_964252 ?auto_964257 ) ) ( not ( = ?auto_964252 ?auto_964258 ) ) ( not ( = ?auto_964252 ?auto_964259 ) ) ( not ( = ?auto_964252 ?auto_964266 ) ) ( not ( = ?auto_964252 ?auto_964264 ) ) ( not ( = ?auto_964254 ?auto_964255 ) ) ( not ( = ?auto_964254 ?auto_964256 ) ) ( not ( = ?auto_964254 ?auto_964257 ) ) ( not ( = ?auto_964254 ?auto_964258 ) ) ( not ( = ?auto_964254 ?auto_964259 ) ) ( not ( = ?auto_964254 ?auto_964266 ) ) ( not ( = ?auto_964254 ?auto_964264 ) ) ( not ( = ?auto_964255 ?auto_964256 ) ) ( not ( = ?auto_964255 ?auto_964257 ) ) ( not ( = ?auto_964255 ?auto_964258 ) ) ( not ( = ?auto_964255 ?auto_964259 ) ) ( not ( = ?auto_964255 ?auto_964266 ) ) ( not ( = ?auto_964255 ?auto_964264 ) ) ( not ( = ?auto_964256 ?auto_964257 ) ) ( not ( = ?auto_964256 ?auto_964258 ) ) ( not ( = ?auto_964256 ?auto_964259 ) ) ( not ( = ?auto_964256 ?auto_964266 ) ) ( not ( = ?auto_964256 ?auto_964264 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964257 ?auto_964258 ?auto_964259 )
      ( MAKE-12CRATE-VERIFY ?auto_964248 ?auto_964249 ?auto_964250 ?auto_964247 ?auto_964251 ?auto_964253 ?auto_964252 ?auto_964254 ?auto_964255 ?auto_964256 ?auto_964257 ?auto_964258 ?auto_964259 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_964268 - SURFACE
      ?auto_964269 - SURFACE
      ?auto_964270 - SURFACE
      ?auto_964267 - SURFACE
      ?auto_964271 - SURFACE
      ?auto_964273 - SURFACE
      ?auto_964272 - SURFACE
      ?auto_964274 - SURFACE
      ?auto_964275 - SURFACE
      ?auto_964276 - SURFACE
      ?auto_964277 - SURFACE
      ?auto_964278 - SURFACE
      ?auto_964279 - SURFACE
      ?auto_964280 - SURFACE
    )
    :vars
    (
      ?auto_964283 - HOIST
      ?auto_964281 - PLACE
      ?auto_964286 - PLACE
      ?auto_964282 - HOIST
      ?auto_964287 - SURFACE
      ?auto_964285 - SURFACE
      ?auto_964284 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964283 ?auto_964281 ) ( IS-CRATE ?auto_964280 ) ( not ( = ?auto_964279 ?auto_964280 ) ) ( not ( = ?auto_964278 ?auto_964279 ) ) ( not ( = ?auto_964278 ?auto_964280 ) ) ( not ( = ?auto_964286 ?auto_964281 ) ) ( HOIST-AT ?auto_964282 ?auto_964286 ) ( not ( = ?auto_964283 ?auto_964282 ) ) ( SURFACE-AT ?auto_964280 ?auto_964286 ) ( ON ?auto_964280 ?auto_964287 ) ( CLEAR ?auto_964280 ) ( not ( = ?auto_964279 ?auto_964287 ) ) ( not ( = ?auto_964280 ?auto_964287 ) ) ( not ( = ?auto_964278 ?auto_964287 ) ) ( SURFACE-AT ?auto_964278 ?auto_964281 ) ( CLEAR ?auto_964278 ) ( IS-CRATE ?auto_964279 ) ( AVAILABLE ?auto_964283 ) ( AVAILABLE ?auto_964282 ) ( SURFACE-AT ?auto_964279 ?auto_964286 ) ( ON ?auto_964279 ?auto_964285 ) ( CLEAR ?auto_964279 ) ( not ( = ?auto_964279 ?auto_964285 ) ) ( not ( = ?auto_964280 ?auto_964285 ) ) ( not ( = ?auto_964278 ?auto_964285 ) ) ( not ( = ?auto_964287 ?auto_964285 ) ) ( TRUCK-AT ?auto_964284 ?auto_964281 ) ( ON ?auto_964269 ?auto_964268 ) ( ON ?auto_964270 ?auto_964269 ) ( ON ?auto_964267 ?auto_964270 ) ( ON ?auto_964271 ?auto_964267 ) ( ON ?auto_964273 ?auto_964271 ) ( ON ?auto_964272 ?auto_964273 ) ( ON ?auto_964274 ?auto_964272 ) ( ON ?auto_964275 ?auto_964274 ) ( ON ?auto_964276 ?auto_964275 ) ( ON ?auto_964277 ?auto_964276 ) ( ON ?auto_964278 ?auto_964277 ) ( not ( = ?auto_964268 ?auto_964269 ) ) ( not ( = ?auto_964268 ?auto_964270 ) ) ( not ( = ?auto_964268 ?auto_964267 ) ) ( not ( = ?auto_964268 ?auto_964271 ) ) ( not ( = ?auto_964268 ?auto_964273 ) ) ( not ( = ?auto_964268 ?auto_964272 ) ) ( not ( = ?auto_964268 ?auto_964274 ) ) ( not ( = ?auto_964268 ?auto_964275 ) ) ( not ( = ?auto_964268 ?auto_964276 ) ) ( not ( = ?auto_964268 ?auto_964277 ) ) ( not ( = ?auto_964268 ?auto_964278 ) ) ( not ( = ?auto_964268 ?auto_964279 ) ) ( not ( = ?auto_964268 ?auto_964280 ) ) ( not ( = ?auto_964268 ?auto_964287 ) ) ( not ( = ?auto_964268 ?auto_964285 ) ) ( not ( = ?auto_964269 ?auto_964270 ) ) ( not ( = ?auto_964269 ?auto_964267 ) ) ( not ( = ?auto_964269 ?auto_964271 ) ) ( not ( = ?auto_964269 ?auto_964273 ) ) ( not ( = ?auto_964269 ?auto_964272 ) ) ( not ( = ?auto_964269 ?auto_964274 ) ) ( not ( = ?auto_964269 ?auto_964275 ) ) ( not ( = ?auto_964269 ?auto_964276 ) ) ( not ( = ?auto_964269 ?auto_964277 ) ) ( not ( = ?auto_964269 ?auto_964278 ) ) ( not ( = ?auto_964269 ?auto_964279 ) ) ( not ( = ?auto_964269 ?auto_964280 ) ) ( not ( = ?auto_964269 ?auto_964287 ) ) ( not ( = ?auto_964269 ?auto_964285 ) ) ( not ( = ?auto_964270 ?auto_964267 ) ) ( not ( = ?auto_964270 ?auto_964271 ) ) ( not ( = ?auto_964270 ?auto_964273 ) ) ( not ( = ?auto_964270 ?auto_964272 ) ) ( not ( = ?auto_964270 ?auto_964274 ) ) ( not ( = ?auto_964270 ?auto_964275 ) ) ( not ( = ?auto_964270 ?auto_964276 ) ) ( not ( = ?auto_964270 ?auto_964277 ) ) ( not ( = ?auto_964270 ?auto_964278 ) ) ( not ( = ?auto_964270 ?auto_964279 ) ) ( not ( = ?auto_964270 ?auto_964280 ) ) ( not ( = ?auto_964270 ?auto_964287 ) ) ( not ( = ?auto_964270 ?auto_964285 ) ) ( not ( = ?auto_964267 ?auto_964271 ) ) ( not ( = ?auto_964267 ?auto_964273 ) ) ( not ( = ?auto_964267 ?auto_964272 ) ) ( not ( = ?auto_964267 ?auto_964274 ) ) ( not ( = ?auto_964267 ?auto_964275 ) ) ( not ( = ?auto_964267 ?auto_964276 ) ) ( not ( = ?auto_964267 ?auto_964277 ) ) ( not ( = ?auto_964267 ?auto_964278 ) ) ( not ( = ?auto_964267 ?auto_964279 ) ) ( not ( = ?auto_964267 ?auto_964280 ) ) ( not ( = ?auto_964267 ?auto_964287 ) ) ( not ( = ?auto_964267 ?auto_964285 ) ) ( not ( = ?auto_964271 ?auto_964273 ) ) ( not ( = ?auto_964271 ?auto_964272 ) ) ( not ( = ?auto_964271 ?auto_964274 ) ) ( not ( = ?auto_964271 ?auto_964275 ) ) ( not ( = ?auto_964271 ?auto_964276 ) ) ( not ( = ?auto_964271 ?auto_964277 ) ) ( not ( = ?auto_964271 ?auto_964278 ) ) ( not ( = ?auto_964271 ?auto_964279 ) ) ( not ( = ?auto_964271 ?auto_964280 ) ) ( not ( = ?auto_964271 ?auto_964287 ) ) ( not ( = ?auto_964271 ?auto_964285 ) ) ( not ( = ?auto_964273 ?auto_964272 ) ) ( not ( = ?auto_964273 ?auto_964274 ) ) ( not ( = ?auto_964273 ?auto_964275 ) ) ( not ( = ?auto_964273 ?auto_964276 ) ) ( not ( = ?auto_964273 ?auto_964277 ) ) ( not ( = ?auto_964273 ?auto_964278 ) ) ( not ( = ?auto_964273 ?auto_964279 ) ) ( not ( = ?auto_964273 ?auto_964280 ) ) ( not ( = ?auto_964273 ?auto_964287 ) ) ( not ( = ?auto_964273 ?auto_964285 ) ) ( not ( = ?auto_964272 ?auto_964274 ) ) ( not ( = ?auto_964272 ?auto_964275 ) ) ( not ( = ?auto_964272 ?auto_964276 ) ) ( not ( = ?auto_964272 ?auto_964277 ) ) ( not ( = ?auto_964272 ?auto_964278 ) ) ( not ( = ?auto_964272 ?auto_964279 ) ) ( not ( = ?auto_964272 ?auto_964280 ) ) ( not ( = ?auto_964272 ?auto_964287 ) ) ( not ( = ?auto_964272 ?auto_964285 ) ) ( not ( = ?auto_964274 ?auto_964275 ) ) ( not ( = ?auto_964274 ?auto_964276 ) ) ( not ( = ?auto_964274 ?auto_964277 ) ) ( not ( = ?auto_964274 ?auto_964278 ) ) ( not ( = ?auto_964274 ?auto_964279 ) ) ( not ( = ?auto_964274 ?auto_964280 ) ) ( not ( = ?auto_964274 ?auto_964287 ) ) ( not ( = ?auto_964274 ?auto_964285 ) ) ( not ( = ?auto_964275 ?auto_964276 ) ) ( not ( = ?auto_964275 ?auto_964277 ) ) ( not ( = ?auto_964275 ?auto_964278 ) ) ( not ( = ?auto_964275 ?auto_964279 ) ) ( not ( = ?auto_964275 ?auto_964280 ) ) ( not ( = ?auto_964275 ?auto_964287 ) ) ( not ( = ?auto_964275 ?auto_964285 ) ) ( not ( = ?auto_964276 ?auto_964277 ) ) ( not ( = ?auto_964276 ?auto_964278 ) ) ( not ( = ?auto_964276 ?auto_964279 ) ) ( not ( = ?auto_964276 ?auto_964280 ) ) ( not ( = ?auto_964276 ?auto_964287 ) ) ( not ( = ?auto_964276 ?auto_964285 ) ) ( not ( = ?auto_964277 ?auto_964278 ) ) ( not ( = ?auto_964277 ?auto_964279 ) ) ( not ( = ?auto_964277 ?auto_964280 ) ) ( not ( = ?auto_964277 ?auto_964287 ) ) ( not ( = ?auto_964277 ?auto_964285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964278 ?auto_964279 ?auto_964280 )
      ( MAKE-13CRATE-VERIFY ?auto_964268 ?auto_964269 ?auto_964270 ?auto_964267 ?auto_964271 ?auto_964273 ?auto_964272 ?auto_964274 ?auto_964275 ?auto_964276 ?auto_964277 ?auto_964278 ?auto_964279 ?auto_964280 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_964288 - SURFACE
      ?auto_964289 - SURFACE
    )
    :vars
    (
      ?auto_964293 - HOIST
      ?auto_964290 - PLACE
      ?auto_964291 - SURFACE
      ?auto_964296 - PLACE
      ?auto_964292 - HOIST
      ?auto_964297 - SURFACE
      ?auto_964295 - SURFACE
      ?auto_964294 - TRUCK
      ?auto_964298 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_964293 ?auto_964290 ) ( IS-CRATE ?auto_964289 ) ( not ( = ?auto_964288 ?auto_964289 ) ) ( not ( = ?auto_964291 ?auto_964288 ) ) ( not ( = ?auto_964291 ?auto_964289 ) ) ( not ( = ?auto_964296 ?auto_964290 ) ) ( HOIST-AT ?auto_964292 ?auto_964296 ) ( not ( = ?auto_964293 ?auto_964292 ) ) ( SURFACE-AT ?auto_964289 ?auto_964296 ) ( ON ?auto_964289 ?auto_964297 ) ( CLEAR ?auto_964289 ) ( not ( = ?auto_964288 ?auto_964297 ) ) ( not ( = ?auto_964289 ?auto_964297 ) ) ( not ( = ?auto_964291 ?auto_964297 ) ) ( IS-CRATE ?auto_964288 ) ( AVAILABLE ?auto_964292 ) ( SURFACE-AT ?auto_964288 ?auto_964296 ) ( ON ?auto_964288 ?auto_964295 ) ( CLEAR ?auto_964288 ) ( not ( = ?auto_964288 ?auto_964295 ) ) ( not ( = ?auto_964289 ?auto_964295 ) ) ( not ( = ?auto_964291 ?auto_964295 ) ) ( not ( = ?auto_964297 ?auto_964295 ) ) ( TRUCK-AT ?auto_964294 ?auto_964290 ) ( SURFACE-AT ?auto_964298 ?auto_964290 ) ( CLEAR ?auto_964298 ) ( LIFTING ?auto_964293 ?auto_964291 ) ( IS-CRATE ?auto_964291 ) ( not ( = ?auto_964298 ?auto_964291 ) ) ( not ( = ?auto_964288 ?auto_964298 ) ) ( not ( = ?auto_964289 ?auto_964298 ) ) ( not ( = ?auto_964297 ?auto_964298 ) ) ( not ( = ?auto_964295 ?auto_964298 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_964298 ?auto_964291 )
      ( MAKE-2CRATE ?auto_964291 ?auto_964288 ?auto_964289 )
      ( MAKE-1CRATE-VERIFY ?auto_964288 ?auto_964289 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_964299 - SURFACE
      ?auto_964300 - SURFACE
      ?auto_964301 - SURFACE
    )
    :vars
    (
      ?auto_964307 - HOIST
      ?auto_964303 - PLACE
      ?auto_964302 - PLACE
      ?auto_964308 - HOIST
      ?auto_964309 - SURFACE
      ?auto_964306 - SURFACE
      ?auto_964305 - TRUCK
      ?auto_964304 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_964307 ?auto_964303 ) ( IS-CRATE ?auto_964301 ) ( not ( = ?auto_964300 ?auto_964301 ) ) ( not ( = ?auto_964299 ?auto_964300 ) ) ( not ( = ?auto_964299 ?auto_964301 ) ) ( not ( = ?auto_964302 ?auto_964303 ) ) ( HOIST-AT ?auto_964308 ?auto_964302 ) ( not ( = ?auto_964307 ?auto_964308 ) ) ( SURFACE-AT ?auto_964301 ?auto_964302 ) ( ON ?auto_964301 ?auto_964309 ) ( CLEAR ?auto_964301 ) ( not ( = ?auto_964300 ?auto_964309 ) ) ( not ( = ?auto_964301 ?auto_964309 ) ) ( not ( = ?auto_964299 ?auto_964309 ) ) ( IS-CRATE ?auto_964300 ) ( AVAILABLE ?auto_964308 ) ( SURFACE-AT ?auto_964300 ?auto_964302 ) ( ON ?auto_964300 ?auto_964306 ) ( CLEAR ?auto_964300 ) ( not ( = ?auto_964300 ?auto_964306 ) ) ( not ( = ?auto_964301 ?auto_964306 ) ) ( not ( = ?auto_964299 ?auto_964306 ) ) ( not ( = ?auto_964309 ?auto_964306 ) ) ( TRUCK-AT ?auto_964305 ?auto_964303 ) ( SURFACE-AT ?auto_964304 ?auto_964303 ) ( CLEAR ?auto_964304 ) ( LIFTING ?auto_964307 ?auto_964299 ) ( IS-CRATE ?auto_964299 ) ( not ( = ?auto_964304 ?auto_964299 ) ) ( not ( = ?auto_964300 ?auto_964304 ) ) ( not ( = ?auto_964301 ?auto_964304 ) ) ( not ( = ?auto_964309 ?auto_964304 ) ) ( not ( = ?auto_964306 ?auto_964304 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_964300 ?auto_964301 )
      ( MAKE-2CRATE-VERIFY ?auto_964299 ?auto_964300 ?auto_964301 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_964311 - SURFACE
      ?auto_964312 - SURFACE
      ?auto_964313 - SURFACE
      ?auto_964310 - SURFACE
    )
    :vars
    (
      ?auto_964314 - HOIST
      ?auto_964320 - PLACE
      ?auto_964319 - PLACE
      ?auto_964318 - HOIST
      ?auto_964317 - SURFACE
      ?auto_964316 - SURFACE
      ?auto_964315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964314 ?auto_964320 ) ( IS-CRATE ?auto_964310 ) ( not ( = ?auto_964313 ?auto_964310 ) ) ( not ( = ?auto_964312 ?auto_964313 ) ) ( not ( = ?auto_964312 ?auto_964310 ) ) ( not ( = ?auto_964319 ?auto_964320 ) ) ( HOIST-AT ?auto_964318 ?auto_964319 ) ( not ( = ?auto_964314 ?auto_964318 ) ) ( SURFACE-AT ?auto_964310 ?auto_964319 ) ( ON ?auto_964310 ?auto_964317 ) ( CLEAR ?auto_964310 ) ( not ( = ?auto_964313 ?auto_964317 ) ) ( not ( = ?auto_964310 ?auto_964317 ) ) ( not ( = ?auto_964312 ?auto_964317 ) ) ( IS-CRATE ?auto_964313 ) ( AVAILABLE ?auto_964318 ) ( SURFACE-AT ?auto_964313 ?auto_964319 ) ( ON ?auto_964313 ?auto_964316 ) ( CLEAR ?auto_964313 ) ( not ( = ?auto_964313 ?auto_964316 ) ) ( not ( = ?auto_964310 ?auto_964316 ) ) ( not ( = ?auto_964312 ?auto_964316 ) ) ( not ( = ?auto_964317 ?auto_964316 ) ) ( TRUCK-AT ?auto_964315 ?auto_964320 ) ( SURFACE-AT ?auto_964311 ?auto_964320 ) ( CLEAR ?auto_964311 ) ( LIFTING ?auto_964314 ?auto_964312 ) ( IS-CRATE ?auto_964312 ) ( not ( = ?auto_964311 ?auto_964312 ) ) ( not ( = ?auto_964313 ?auto_964311 ) ) ( not ( = ?auto_964310 ?auto_964311 ) ) ( not ( = ?auto_964317 ?auto_964311 ) ) ( not ( = ?auto_964316 ?auto_964311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964312 ?auto_964313 ?auto_964310 )
      ( MAKE-3CRATE-VERIFY ?auto_964311 ?auto_964312 ?auto_964313 ?auto_964310 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_964322 - SURFACE
      ?auto_964323 - SURFACE
      ?auto_964324 - SURFACE
      ?auto_964321 - SURFACE
      ?auto_964325 - SURFACE
    )
    :vars
    (
      ?auto_964326 - HOIST
      ?auto_964332 - PLACE
      ?auto_964331 - PLACE
      ?auto_964330 - HOIST
      ?auto_964329 - SURFACE
      ?auto_964328 - SURFACE
      ?auto_964327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964326 ?auto_964332 ) ( IS-CRATE ?auto_964325 ) ( not ( = ?auto_964321 ?auto_964325 ) ) ( not ( = ?auto_964324 ?auto_964321 ) ) ( not ( = ?auto_964324 ?auto_964325 ) ) ( not ( = ?auto_964331 ?auto_964332 ) ) ( HOIST-AT ?auto_964330 ?auto_964331 ) ( not ( = ?auto_964326 ?auto_964330 ) ) ( SURFACE-AT ?auto_964325 ?auto_964331 ) ( ON ?auto_964325 ?auto_964329 ) ( CLEAR ?auto_964325 ) ( not ( = ?auto_964321 ?auto_964329 ) ) ( not ( = ?auto_964325 ?auto_964329 ) ) ( not ( = ?auto_964324 ?auto_964329 ) ) ( IS-CRATE ?auto_964321 ) ( AVAILABLE ?auto_964330 ) ( SURFACE-AT ?auto_964321 ?auto_964331 ) ( ON ?auto_964321 ?auto_964328 ) ( CLEAR ?auto_964321 ) ( not ( = ?auto_964321 ?auto_964328 ) ) ( not ( = ?auto_964325 ?auto_964328 ) ) ( not ( = ?auto_964324 ?auto_964328 ) ) ( not ( = ?auto_964329 ?auto_964328 ) ) ( TRUCK-AT ?auto_964327 ?auto_964332 ) ( SURFACE-AT ?auto_964323 ?auto_964332 ) ( CLEAR ?auto_964323 ) ( LIFTING ?auto_964326 ?auto_964324 ) ( IS-CRATE ?auto_964324 ) ( not ( = ?auto_964323 ?auto_964324 ) ) ( not ( = ?auto_964321 ?auto_964323 ) ) ( not ( = ?auto_964325 ?auto_964323 ) ) ( not ( = ?auto_964329 ?auto_964323 ) ) ( not ( = ?auto_964328 ?auto_964323 ) ) ( ON ?auto_964323 ?auto_964322 ) ( not ( = ?auto_964322 ?auto_964323 ) ) ( not ( = ?auto_964322 ?auto_964324 ) ) ( not ( = ?auto_964322 ?auto_964321 ) ) ( not ( = ?auto_964322 ?auto_964325 ) ) ( not ( = ?auto_964322 ?auto_964329 ) ) ( not ( = ?auto_964322 ?auto_964328 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964324 ?auto_964321 ?auto_964325 )
      ( MAKE-4CRATE-VERIFY ?auto_964322 ?auto_964323 ?auto_964324 ?auto_964321 ?auto_964325 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_964334 - SURFACE
      ?auto_964335 - SURFACE
      ?auto_964336 - SURFACE
      ?auto_964333 - SURFACE
      ?auto_964337 - SURFACE
      ?auto_964338 - SURFACE
    )
    :vars
    (
      ?auto_964339 - HOIST
      ?auto_964345 - PLACE
      ?auto_964344 - PLACE
      ?auto_964343 - HOIST
      ?auto_964342 - SURFACE
      ?auto_964341 - SURFACE
      ?auto_964340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964339 ?auto_964345 ) ( IS-CRATE ?auto_964338 ) ( not ( = ?auto_964337 ?auto_964338 ) ) ( not ( = ?auto_964333 ?auto_964337 ) ) ( not ( = ?auto_964333 ?auto_964338 ) ) ( not ( = ?auto_964344 ?auto_964345 ) ) ( HOIST-AT ?auto_964343 ?auto_964344 ) ( not ( = ?auto_964339 ?auto_964343 ) ) ( SURFACE-AT ?auto_964338 ?auto_964344 ) ( ON ?auto_964338 ?auto_964342 ) ( CLEAR ?auto_964338 ) ( not ( = ?auto_964337 ?auto_964342 ) ) ( not ( = ?auto_964338 ?auto_964342 ) ) ( not ( = ?auto_964333 ?auto_964342 ) ) ( IS-CRATE ?auto_964337 ) ( AVAILABLE ?auto_964343 ) ( SURFACE-AT ?auto_964337 ?auto_964344 ) ( ON ?auto_964337 ?auto_964341 ) ( CLEAR ?auto_964337 ) ( not ( = ?auto_964337 ?auto_964341 ) ) ( not ( = ?auto_964338 ?auto_964341 ) ) ( not ( = ?auto_964333 ?auto_964341 ) ) ( not ( = ?auto_964342 ?auto_964341 ) ) ( TRUCK-AT ?auto_964340 ?auto_964345 ) ( SURFACE-AT ?auto_964336 ?auto_964345 ) ( CLEAR ?auto_964336 ) ( LIFTING ?auto_964339 ?auto_964333 ) ( IS-CRATE ?auto_964333 ) ( not ( = ?auto_964336 ?auto_964333 ) ) ( not ( = ?auto_964337 ?auto_964336 ) ) ( not ( = ?auto_964338 ?auto_964336 ) ) ( not ( = ?auto_964342 ?auto_964336 ) ) ( not ( = ?auto_964341 ?auto_964336 ) ) ( ON ?auto_964335 ?auto_964334 ) ( ON ?auto_964336 ?auto_964335 ) ( not ( = ?auto_964334 ?auto_964335 ) ) ( not ( = ?auto_964334 ?auto_964336 ) ) ( not ( = ?auto_964334 ?auto_964333 ) ) ( not ( = ?auto_964334 ?auto_964337 ) ) ( not ( = ?auto_964334 ?auto_964338 ) ) ( not ( = ?auto_964334 ?auto_964342 ) ) ( not ( = ?auto_964334 ?auto_964341 ) ) ( not ( = ?auto_964335 ?auto_964336 ) ) ( not ( = ?auto_964335 ?auto_964333 ) ) ( not ( = ?auto_964335 ?auto_964337 ) ) ( not ( = ?auto_964335 ?auto_964338 ) ) ( not ( = ?auto_964335 ?auto_964342 ) ) ( not ( = ?auto_964335 ?auto_964341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964333 ?auto_964337 ?auto_964338 )
      ( MAKE-5CRATE-VERIFY ?auto_964334 ?auto_964335 ?auto_964336 ?auto_964333 ?auto_964337 ?auto_964338 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_964347 - SURFACE
      ?auto_964348 - SURFACE
      ?auto_964349 - SURFACE
      ?auto_964346 - SURFACE
      ?auto_964350 - SURFACE
      ?auto_964352 - SURFACE
      ?auto_964351 - SURFACE
    )
    :vars
    (
      ?auto_964353 - HOIST
      ?auto_964359 - PLACE
      ?auto_964358 - PLACE
      ?auto_964357 - HOIST
      ?auto_964356 - SURFACE
      ?auto_964355 - SURFACE
      ?auto_964354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964353 ?auto_964359 ) ( IS-CRATE ?auto_964351 ) ( not ( = ?auto_964352 ?auto_964351 ) ) ( not ( = ?auto_964350 ?auto_964352 ) ) ( not ( = ?auto_964350 ?auto_964351 ) ) ( not ( = ?auto_964358 ?auto_964359 ) ) ( HOIST-AT ?auto_964357 ?auto_964358 ) ( not ( = ?auto_964353 ?auto_964357 ) ) ( SURFACE-AT ?auto_964351 ?auto_964358 ) ( ON ?auto_964351 ?auto_964356 ) ( CLEAR ?auto_964351 ) ( not ( = ?auto_964352 ?auto_964356 ) ) ( not ( = ?auto_964351 ?auto_964356 ) ) ( not ( = ?auto_964350 ?auto_964356 ) ) ( IS-CRATE ?auto_964352 ) ( AVAILABLE ?auto_964357 ) ( SURFACE-AT ?auto_964352 ?auto_964358 ) ( ON ?auto_964352 ?auto_964355 ) ( CLEAR ?auto_964352 ) ( not ( = ?auto_964352 ?auto_964355 ) ) ( not ( = ?auto_964351 ?auto_964355 ) ) ( not ( = ?auto_964350 ?auto_964355 ) ) ( not ( = ?auto_964356 ?auto_964355 ) ) ( TRUCK-AT ?auto_964354 ?auto_964359 ) ( SURFACE-AT ?auto_964346 ?auto_964359 ) ( CLEAR ?auto_964346 ) ( LIFTING ?auto_964353 ?auto_964350 ) ( IS-CRATE ?auto_964350 ) ( not ( = ?auto_964346 ?auto_964350 ) ) ( not ( = ?auto_964352 ?auto_964346 ) ) ( not ( = ?auto_964351 ?auto_964346 ) ) ( not ( = ?auto_964356 ?auto_964346 ) ) ( not ( = ?auto_964355 ?auto_964346 ) ) ( ON ?auto_964348 ?auto_964347 ) ( ON ?auto_964349 ?auto_964348 ) ( ON ?auto_964346 ?auto_964349 ) ( not ( = ?auto_964347 ?auto_964348 ) ) ( not ( = ?auto_964347 ?auto_964349 ) ) ( not ( = ?auto_964347 ?auto_964346 ) ) ( not ( = ?auto_964347 ?auto_964350 ) ) ( not ( = ?auto_964347 ?auto_964352 ) ) ( not ( = ?auto_964347 ?auto_964351 ) ) ( not ( = ?auto_964347 ?auto_964356 ) ) ( not ( = ?auto_964347 ?auto_964355 ) ) ( not ( = ?auto_964348 ?auto_964349 ) ) ( not ( = ?auto_964348 ?auto_964346 ) ) ( not ( = ?auto_964348 ?auto_964350 ) ) ( not ( = ?auto_964348 ?auto_964352 ) ) ( not ( = ?auto_964348 ?auto_964351 ) ) ( not ( = ?auto_964348 ?auto_964356 ) ) ( not ( = ?auto_964348 ?auto_964355 ) ) ( not ( = ?auto_964349 ?auto_964346 ) ) ( not ( = ?auto_964349 ?auto_964350 ) ) ( not ( = ?auto_964349 ?auto_964352 ) ) ( not ( = ?auto_964349 ?auto_964351 ) ) ( not ( = ?auto_964349 ?auto_964356 ) ) ( not ( = ?auto_964349 ?auto_964355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964350 ?auto_964352 ?auto_964351 )
      ( MAKE-6CRATE-VERIFY ?auto_964347 ?auto_964348 ?auto_964349 ?auto_964346 ?auto_964350 ?auto_964352 ?auto_964351 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_964361 - SURFACE
      ?auto_964362 - SURFACE
      ?auto_964363 - SURFACE
      ?auto_964360 - SURFACE
      ?auto_964364 - SURFACE
      ?auto_964366 - SURFACE
      ?auto_964365 - SURFACE
      ?auto_964367 - SURFACE
    )
    :vars
    (
      ?auto_964368 - HOIST
      ?auto_964374 - PLACE
      ?auto_964373 - PLACE
      ?auto_964372 - HOIST
      ?auto_964371 - SURFACE
      ?auto_964370 - SURFACE
      ?auto_964369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964368 ?auto_964374 ) ( IS-CRATE ?auto_964367 ) ( not ( = ?auto_964365 ?auto_964367 ) ) ( not ( = ?auto_964366 ?auto_964365 ) ) ( not ( = ?auto_964366 ?auto_964367 ) ) ( not ( = ?auto_964373 ?auto_964374 ) ) ( HOIST-AT ?auto_964372 ?auto_964373 ) ( not ( = ?auto_964368 ?auto_964372 ) ) ( SURFACE-AT ?auto_964367 ?auto_964373 ) ( ON ?auto_964367 ?auto_964371 ) ( CLEAR ?auto_964367 ) ( not ( = ?auto_964365 ?auto_964371 ) ) ( not ( = ?auto_964367 ?auto_964371 ) ) ( not ( = ?auto_964366 ?auto_964371 ) ) ( IS-CRATE ?auto_964365 ) ( AVAILABLE ?auto_964372 ) ( SURFACE-AT ?auto_964365 ?auto_964373 ) ( ON ?auto_964365 ?auto_964370 ) ( CLEAR ?auto_964365 ) ( not ( = ?auto_964365 ?auto_964370 ) ) ( not ( = ?auto_964367 ?auto_964370 ) ) ( not ( = ?auto_964366 ?auto_964370 ) ) ( not ( = ?auto_964371 ?auto_964370 ) ) ( TRUCK-AT ?auto_964369 ?auto_964374 ) ( SURFACE-AT ?auto_964364 ?auto_964374 ) ( CLEAR ?auto_964364 ) ( LIFTING ?auto_964368 ?auto_964366 ) ( IS-CRATE ?auto_964366 ) ( not ( = ?auto_964364 ?auto_964366 ) ) ( not ( = ?auto_964365 ?auto_964364 ) ) ( not ( = ?auto_964367 ?auto_964364 ) ) ( not ( = ?auto_964371 ?auto_964364 ) ) ( not ( = ?auto_964370 ?auto_964364 ) ) ( ON ?auto_964362 ?auto_964361 ) ( ON ?auto_964363 ?auto_964362 ) ( ON ?auto_964360 ?auto_964363 ) ( ON ?auto_964364 ?auto_964360 ) ( not ( = ?auto_964361 ?auto_964362 ) ) ( not ( = ?auto_964361 ?auto_964363 ) ) ( not ( = ?auto_964361 ?auto_964360 ) ) ( not ( = ?auto_964361 ?auto_964364 ) ) ( not ( = ?auto_964361 ?auto_964366 ) ) ( not ( = ?auto_964361 ?auto_964365 ) ) ( not ( = ?auto_964361 ?auto_964367 ) ) ( not ( = ?auto_964361 ?auto_964371 ) ) ( not ( = ?auto_964361 ?auto_964370 ) ) ( not ( = ?auto_964362 ?auto_964363 ) ) ( not ( = ?auto_964362 ?auto_964360 ) ) ( not ( = ?auto_964362 ?auto_964364 ) ) ( not ( = ?auto_964362 ?auto_964366 ) ) ( not ( = ?auto_964362 ?auto_964365 ) ) ( not ( = ?auto_964362 ?auto_964367 ) ) ( not ( = ?auto_964362 ?auto_964371 ) ) ( not ( = ?auto_964362 ?auto_964370 ) ) ( not ( = ?auto_964363 ?auto_964360 ) ) ( not ( = ?auto_964363 ?auto_964364 ) ) ( not ( = ?auto_964363 ?auto_964366 ) ) ( not ( = ?auto_964363 ?auto_964365 ) ) ( not ( = ?auto_964363 ?auto_964367 ) ) ( not ( = ?auto_964363 ?auto_964371 ) ) ( not ( = ?auto_964363 ?auto_964370 ) ) ( not ( = ?auto_964360 ?auto_964364 ) ) ( not ( = ?auto_964360 ?auto_964366 ) ) ( not ( = ?auto_964360 ?auto_964365 ) ) ( not ( = ?auto_964360 ?auto_964367 ) ) ( not ( = ?auto_964360 ?auto_964371 ) ) ( not ( = ?auto_964360 ?auto_964370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964366 ?auto_964365 ?auto_964367 )
      ( MAKE-7CRATE-VERIFY ?auto_964361 ?auto_964362 ?auto_964363 ?auto_964360 ?auto_964364 ?auto_964366 ?auto_964365 ?auto_964367 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_964376 - SURFACE
      ?auto_964377 - SURFACE
      ?auto_964378 - SURFACE
      ?auto_964375 - SURFACE
      ?auto_964379 - SURFACE
      ?auto_964381 - SURFACE
      ?auto_964380 - SURFACE
      ?auto_964382 - SURFACE
      ?auto_964383 - SURFACE
    )
    :vars
    (
      ?auto_964384 - HOIST
      ?auto_964390 - PLACE
      ?auto_964389 - PLACE
      ?auto_964388 - HOIST
      ?auto_964387 - SURFACE
      ?auto_964386 - SURFACE
      ?auto_964385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964384 ?auto_964390 ) ( IS-CRATE ?auto_964383 ) ( not ( = ?auto_964382 ?auto_964383 ) ) ( not ( = ?auto_964380 ?auto_964382 ) ) ( not ( = ?auto_964380 ?auto_964383 ) ) ( not ( = ?auto_964389 ?auto_964390 ) ) ( HOIST-AT ?auto_964388 ?auto_964389 ) ( not ( = ?auto_964384 ?auto_964388 ) ) ( SURFACE-AT ?auto_964383 ?auto_964389 ) ( ON ?auto_964383 ?auto_964387 ) ( CLEAR ?auto_964383 ) ( not ( = ?auto_964382 ?auto_964387 ) ) ( not ( = ?auto_964383 ?auto_964387 ) ) ( not ( = ?auto_964380 ?auto_964387 ) ) ( IS-CRATE ?auto_964382 ) ( AVAILABLE ?auto_964388 ) ( SURFACE-AT ?auto_964382 ?auto_964389 ) ( ON ?auto_964382 ?auto_964386 ) ( CLEAR ?auto_964382 ) ( not ( = ?auto_964382 ?auto_964386 ) ) ( not ( = ?auto_964383 ?auto_964386 ) ) ( not ( = ?auto_964380 ?auto_964386 ) ) ( not ( = ?auto_964387 ?auto_964386 ) ) ( TRUCK-AT ?auto_964385 ?auto_964390 ) ( SURFACE-AT ?auto_964381 ?auto_964390 ) ( CLEAR ?auto_964381 ) ( LIFTING ?auto_964384 ?auto_964380 ) ( IS-CRATE ?auto_964380 ) ( not ( = ?auto_964381 ?auto_964380 ) ) ( not ( = ?auto_964382 ?auto_964381 ) ) ( not ( = ?auto_964383 ?auto_964381 ) ) ( not ( = ?auto_964387 ?auto_964381 ) ) ( not ( = ?auto_964386 ?auto_964381 ) ) ( ON ?auto_964377 ?auto_964376 ) ( ON ?auto_964378 ?auto_964377 ) ( ON ?auto_964375 ?auto_964378 ) ( ON ?auto_964379 ?auto_964375 ) ( ON ?auto_964381 ?auto_964379 ) ( not ( = ?auto_964376 ?auto_964377 ) ) ( not ( = ?auto_964376 ?auto_964378 ) ) ( not ( = ?auto_964376 ?auto_964375 ) ) ( not ( = ?auto_964376 ?auto_964379 ) ) ( not ( = ?auto_964376 ?auto_964381 ) ) ( not ( = ?auto_964376 ?auto_964380 ) ) ( not ( = ?auto_964376 ?auto_964382 ) ) ( not ( = ?auto_964376 ?auto_964383 ) ) ( not ( = ?auto_964376 ?auto_964387 ) ) ( not ( = ?auto_964376 ?auto_964386 ) ) ( not ( = ?auto_964377 ?auto_964378 ) ) ( not ( = ?auto_964377 ?auto_964375 ) ) ( not ( = ?auto_964377 ?auto_964379 ) ) ( not ( = ?auto_964377 ?auto_964381 ) ) ( not ( = ?auto_964377 ?auto_964380 ) ) ( not ( = ?auto_964377 ?auto_964382 ) ) ( not ( = ?auto_964377 ?auto_964383 ) ) ( not ( = ?auto_964377 ?auto_964387 ) ) ( not ( = ?auto_964377 ?auto_964386 ) ) ( not ( = ?auto_964378 ?auto_964375 ) ) ( not ( = ?auto_964378 ?auto_964379 ) ) ( not ( = ?auto_964378 ?auto_964381 ) ) ( not ( = ?auto_964378 ?auto_964380 ) ) ( not ( = ?auto_964378 ?auto_964382 ) ) ( not ( = ?auto_964378 ?auto_964383 ) ) ( not ( = ?auto_964378 ?auto_964387 ) ) ( not ( = ?auto_964378 ?auto_964386 ) ) ( not ( = ?auto_964375 ?auto_964379 ) ) ( not ( = ?auto_964375 ?auto_964381 ) ) ( not ( = ?auto_964375 ?auto_964380 ) ) ( not ( = ?auto_964375 ?auto_964382 ) ) ( not ( = ?auto_964375 ?auto_964383 ) ) ( not ( = ?auto_964375 ?auto_964387 ) ) ( not ( = ?auto_964375 ?auto_964386 ) ) ( not ( = ?auto_964379 ?auto_964381 ) ) ( not ( = ?auto_964379 ?auto_964380 ) ) ( not ( = ?auto_964379 ?auto_964382 ) ) ( not ( = ?auto_964379 ?auto_964383 ) ) ( not ( = ?auto_964379 ?auto_964387 ) ) ( not ( = ?auto_964379 ?auto_964386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964380 ?auto_964382 ?auto_964383 )
      ( MAKE-8CRATE-VERIFY ?auto_964376 ?auto_964377 ?auto_964378 ?auto_964375 ?auto_964379 ?auto_964381 ?auto_964380 ?auto_964382 ?auto_964383 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_964392 - SURFACE
      ?auto_964393 - SURFACE
      ?auto_964394 - SURFACE
      ?auto_964391 - SURFACE
      ?auto_964395 - SURFACE
      ?auto_964397 - SURFACE
      ?auto_964396 - SURFACE
      ?auto_964398 - SURFACE
      ?auto_964399 - SURFACE
      ?auto_964400 - SURFACE
    )
    :vars
    (
      ?auto_964401 - HOIST
      ?auto_964407 - PLACE
      ?auto_964406 - PLACE
      ?auto_964405 - HOIST
      ?auto_964404 - SURFACE
      ?auto_964403 - SURFACE
      ?auto_964402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964401 ?auto_964407 ) ( IS-CRATE ?auto_964400 ) ( not ( = ?auto_964399 ?auto_964400 ) ) ( not ( = ?auto_964398 ?auto_964399 ) ) ( not ( = ?auto_964398 ?auto_964400 ) ) ( not ( = ?auto_964406 ?auto_964407 ) ) ( HOIST-AT ?auto_964405 ?auto_964406 ) ( not ( = ?auto_964401 ?auto_964405 ) ) ( SURFACE-AT ?auto_964400 ?auto_964406 ) ( ON ?auto_964400 ?auto_964404 ) ( CLEAR ?auto_964400 ) ( not ( = ?auto_964399 ?auto_964404 ) ) ( not ( = ?auto_964400 ?auto_964404 ) ) ( not ( = ?auto_964398 ?auto_964404 ) ) ( IS-CRATE ?auto_964399 ) ( AVAILABLE ?auto_964405 ) ( SURFACE-AT ?auto_964399 ?auto_964406 ) ( ON ?auto_964399 ?auto_964403 ) ( CLEAR ?auto_964399 ) ( not ( = ?auto_964399 ?auto_964403 ) ) ( not ( = ?auto_964400 ?auto_964403 ) ) ( not ( = ?auto_964398 ?auto_964403 ) ) ( not ( = ?auto_964404 ?auto_964403 ) ) ( TRUCK-AT ?auto_964402 ?auto_964407 ) ( SURFACE-AT ?auto_964396 ?auto_964407 ) ( CLEAR ?auto_964396 ) ( LIFTING ?auto_964401 ?auto_964398 ) ( IS-CRATE ?auto_964398 ) ( not ( = ?auto_964396 ?auto_964398 ) ) ( not ( = ?auto_964399 ?auto_964396 ) ) ( not ( = ?auto_964400 ?auto_964396 ) ) ( not ( = ?auto_964404 ?auto_964396 ) ) ( not ( = ?auto_964403 ?auto_964396 ) ) ( ON ?auto_964393 ?auto_964392 ) ( ON ?auto_964394 ?auto_964393 ) ( ON ?auto_964391 ?auto_964394 ) ( ON ?auto_964395 ?auto_964391 ) ( ON ?auto_964397 ?auto_964395 ) ( ON ?auto_964396 ?auto_964397 ) ( not ( = ?auto_964392 ?auto_964393 ) ) ( not ( = ?auto_964392 ?auto_964394 ) ) ( not ( = ?auto_964392 ?auto_964391 ) ) ( not ( = ?auto_964392 ?auto_964395 ) ) ( not ( = ?auto_964392 ?auto_964397 ) ) ( not ( = ?auto_964392 ?auto_964396 ) ) ( not ( = ?auto_964392 ?auto_964398 ) ) ( not ( = ?auto_964392 ?auto_964399 ) ) ( not ( = ?auto_964392 ?auto_964400 ) ) ( not ( = ?auto_964392 ?auto_964404 ) ) ( not ( = ?auto_964392 ?auto_964403 ) ) ( not ( = ?auto_964393 ?auto_964394 ) ) ( not ( = ?auto_964393 ?auto_964391 ) ) ( not ( = ?auto_964393 ?auto_964395 ) ) ( not ( = ?auto_964393 ?auto_964397 ) ) ( not ( = ?auto_964393 ?auto_964396 ) ) ( not ( = ?auto_964393 ?auto_964398 ) ) ( not ( = ?auto_964393 ?auto_964399 ) ) ( not ( = ?auto_964393 ?auto_964400 ) ) ( not ( = ?auto_964393 ?auto_964404 ) ) ( not ( = ?auto_964393 ?auto_964403 ) ) ( not ( = ?auto_964394 ?auto_964391 ) ) ( not ( = ?auto_964394 ?auto_964395 ) ) ( not ( = ?auto_964394 ?auto_964397 ) ) ( not ( = ?auto_964394 ?auto_964396 ) ) ( not ( = ?auto_964394 ?auto_964398 ) ) ( not ( = ?auto_964394 ?auto_964399 ) ) ( not ( = ?auto_964394 ?auto_964400 ) ) ( not ( = ?auto_964394 ?auto_964404 ) ) ( not ( = ?auto_964394 ?auto_964403 ) ) ( not ( = ?auto_964391 ?auto_964395 ) ) ( not ( = ?auto_964391 ?auto_964397 ) ) ( not ( = ?auto_964391 ?auto_964396 ) ) ( not ( = ?auto_964391 ?auto_964398 ) ) ( not ( = ?auto_964391 ?auto_964399 ) ) ( not ( = ?auto_964391 ?auto_964400 ) ) ( not ( = ?auto_964391 ?auto_964404 ) ) ( not ( = ?auto_964391 ?auto_964403 ) ) ( not ( = ?auto_964395 ?auto_964397 ) ) ( not ( = ?auto_964395 ?auto_964396 ) ) ( not ( = ?auto_964395 ?auto_964398 ) ) ( not ( = ?auto_964395 ?auto_964399 ) ) ( not ( = ?auto_964395 ?auto_964400 ) ) ( not ( = ?auto_964395 ?auto_964404 ) ) ( not ( = ?auto_964395 ?auto_964403 ) ) ( not ( = ?auto_964397 ?auto_964396 ) ) ( not ( = ?auto_964397 ?auto_964398 ) ) ( not ( = ?auto_964397 ?auto_964399 ) ) ( not ( = ?auto_964397 ?auto_964400 ) ) ( not ( = ?auto_964397 ?auto_964404 ) ) ( not ( = ?auto_964397 ?auto_964403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964398 ?auto_964399 ?auto_964400 )
      ( MAKE-9CRATE-VERIFY ?auto_964392 ?auto_964393 ?auto_964394 ?auto_964391 ?auto_964395 ?auto_964397 ?auto_964396 ?auto_964398 ?auto_964399 ?auto_964400 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_964409 - SURFACE
      ?auto_964410 - SURFACE
      ?auto_964411 - SURFACE
      ?auto_964408 - SURFACE
      ?auto_964412 - SURFACE
      ?auto_964414 - SURFACE
      ?auto_964413 - SURFACE
      ?auto_964415 - SURFACE
      ?auto_964416 - SURFACE
      ?auto_964417 - SURFACE
      ?auto_964418 - SURFACE
    )
    :vars
    (
      ?auto_964419 - HOIST
      ?auto_964425 - PLACE
      ?auto_964424 - PLACE
      ?auto_964423 - HOIST
      ?auto_964422 - SURFACE
      ?auto_964421 - SURFACE
      ?auto_964420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964419 ?auto_964425 ) ( IS-CRATE ?auto_964418 ) ( not ( = ?auto_964417 ?auto_964418 ) ) ( not ( = ?auto_964416 ?auto_964417 ) ) ( not ( = ?auto_964416 ?auto_964418 ) ) ( not ( = ?auto_964424 ?auto_964425 ) ) ( HOIST-AT ?auto_964423 ?auto_964424 ) ( not ( = ?auto_964419 ?auto_964423 ) ) ( SURFACE-AT ?auto_964418 ?auto_964424 ) ( ON ?auto_964418 ?auto_964422 ) ( CLEAR ?auto_964418 ) ( not ( = ?auto_964417 ?auto_964422 ) ) ( not ( = ?auto_964418 ?auto_964422 ) ) ( not ( = ?auto_964416 ?auto_964422 ) ) ( IS-CRATE ?auto_964417 ) ( AVAILABLE ?auto_964423 ) ( SURFACE-AT ?auto_964417 ?auto_964424 ) ( ON ?auto_964417 ?auto_964421 ) ( CLEAR ?auto_964417 ) ( not ( = ?auto_964417 ?auto_964421 ) ) ( not ( = ?auto_964418 ?auto_964421 ) ) ( not ( = ?auto_964416 ?auto_964421 ) ) ( not ( = ?auto_964422 ?auto_964421 ) ) ( TRUCK-AT ?auto_964420 ?auto_964425 ) ( SURFACE-AT ?auto_964415 ?auto_964425 ) ( CLEAR ?auto_964415 ) ( LIFTING ?auto_964419 ?auto_964416 ) ( IS-CRATE ?auto_964416 ) ( not ( = ?auto_964415 ?auto_964416 ) ) ( not ( = ?auto_964417 ?auto_964415 ) ) ( not ( = ?auto_964418 ?auto_964415 ) ) ( not ( = ?auto_964422 ?auto_964415 ) ) ( not ( = ?auto_964421 ?auto_964415 ) ) ( ON ?auto_964410 ?auto_964409 ) ( ON ?auto_964411 ?auto_964410 ) ( ON ?auto_964408 ?auto_964411 ) ( ON ?auto_964412 ?auto_964408 ) ( ON ?auto_964414 ?auto_964412 ) ( ON ?auto_964413 ?auto_964414 ) ( ON ?auto_964415 ?auto_964413 ) ( not ( = ?auto_964409 ?auto_964410 ) ) ( not ( = ?auto_964409 ?auto_964411 ) ) ( not ( = ?auto_964409 ?auto_964408 ) ) ( not ( = ?auto_964409 ?auto_964412 ) ) ( not ( = ?auto_964409 ?auto_964414 ) ) ( not ( = ?auto_964409 ?auto_964413 ) ) ( not ( = ?auto_964409 ?auto_964415 ) ) ( not ( = ?auto_964409 ?auto_964416 ) ) ( not ( = ?auto_964409 ?auto_964417 ) ) ( not ( = ?auto_964409 ?auto_964418 ) ) ( not ( = ?auto_964409 ?auto_964422 ) ) ( not ( = ?auto_964409 ?auto_964421 ) ) ( not ( = ?auto_964410 ?auto_964411 ) ) ( not ( = ?auto_964410 ?auto_964408 ) ) ( not ( = ?auto_964410 ?auto_964412 ) ) ( not ( = ?auto_964410 ?auto_964414 ) ) ( not ( = ?auto_964410 ?auto_964413 ) ) ( not ( = ?auto_964410 ?auto_964415 ) ) ( not ( = ?auto_964410 ?auto_964416 ) ) ( not ( = ?auto_964410 ?auto_964417 ) ) ( not ( = ?auto_964410 ?auto_964418 ) ) ( not ( = ?auto_964410 ?auto_964422 ) ) ( not ( = ?auto_964410 ?auto_964421 ) ) ( not ( = ?auto_964411 ?auto_964408 ) ) ( not ( = ?auto_964411 ?auto_964412 ) ) ( not ( = ?auto_964411 ?auto_964414 ) ) ( not ( = ?auto_964411 ?auto_964413 ) ) ( not ( = ?auto_964411 ?auto_964415 ) ) ( not ( = ?auto_964411 ?auto_964416 ) ) ( not ( = ?auto_964411 ?auto_964417 ) ) ( not ( = ?auto_964411 ?auto_964418 ) ) ( not ( = ?auto_964411 ?auto_964422 ) ) ( not ( = ?auto_964411 ?auto_964421 ) ) ( not ( = ?auto_964408 ?auto_964412 ) ) ( not ( = ?auto_964408 ?auto_964414 ) ) ( not ( = ?auto_964408 ?auto_964413 ) ) ( not ( = ?auto_964408 ?auto_964415 ) ) ( not ( = ?auto_964408 ?auto_964416 ) ) ( not ( = ?auto_964408 ?auto_964417 ) ) ( not ( = ?auto_964408 ?auto_964418 ) ) ( not ( = ?auto_964408 ?auto_964422 ) ) ( not ( = ?auto_964408 ?auto_964421 ) ) ( not ( = ?auto_964412 ?auto_964414 ) ) ( not ( = ?auto_964412 ?auto_964413 ) ) ( not ( = ?auto_964412 ?auto_964415 ) ) ( not ( = ?auto_964412 ?auto_964416 ) ) ( not ( = ?auto_964412 ?auto_964417 ) ) ( not ( = ?auto_964412 ?auto_964418 ) ) ( not ( = ?auto_964412 ?auto_964422 ) ) ( not ( = ?auto_964412 ?auto_964421 ) ) ( not ( = ?auto_964414 ?auto_964413 ) ) ( not ( = ?auto_964414 ?auto_964415 ) ) ( not ( = ?auto_964414 ?auto_964416 ) ) ( not ( = ?auto_964414 ?auto_964417 ) ) ( not ( = ?auto_964414 ?auto_964418 ) ) ( not ( = ?auto_964414 ?auto_964422 ) ) ( not ( = ?auto_964414 ?auto_964421 ) ) ( not ( = ?auto_964413 ?auto_964415 ) ) ( not ( = ?auto_964413 ?auto_964416 ) ) ( not ( = ?auto_964413 ?auto_964417 ) ) ( not ( = ?auto_964413 ?auto_964418 ) ) ( not ( = ?auto_964413 ?auto_964422 ) ) ( not ( = ?auto_964413 ?auto_964421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964416 ?auto_964417 ?auto_964418 )
      ( MAKE-10CRATE-VERIFY ?auto_964409 ?auto_964410 ?auto_964411 ?auto_964408 ?auto_964412 ?auto_964414 ?auto_964413 ?auto_964415 ?auto_964416 ?auto_964417 ?auto_964418 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_964427 - SURFACE
      ?auto_964428 - SURFACE
      ?auto_964429 - SURFACE
      ?auto_964426 - SURFACE
      ?auto_964430 - SURFACE
      ?auto_964432 - SURFACE
      ?auto_964431 - SURFACE
      ?auto_964433 - SURFACE
      ?auto_964434 - SURFACE
      ?auto_964435 - SURFACE
      ?auto_964436 - SURFACE
      ?auto_964437 - SURFACE
    )
    :vars
    (
      ?auto_964438 - HOIST
      ?auto_964444 - PLACE
      ?auto_964443 - PLACE
      ?auto_964442 - HOIST
      ?auto_964441 - SURFACE
      ?auto_964440 - SURFACE
      ?auto_964439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964438 ?auto_964444 ) ( IS-CRATE ?auto_964437 ) ( not ( = ?auto_964436 ?auto_964437 ) ) ( not ( = ?auto_964435 ?auto_964436 ) ) ( not ( = ?auto_964435 ?auto_964437 ) ) ( not ( = ?auto_964443 ?auto_964444 ) ) ( HOIST-AT ?auto_964442 ?auto_964443 ) ( not ( = ?auto_964438 ?auto_964442 ) ) ( SURFACE-AT ?auto_964437 ?auto_964443 ) ( ON ?auto_964437 ?auto_964441 ) ( CLEAR ?auto_964437 ) ( not ( = ?auto_964436 ?auto_964441 ) ) ( not ( = ?auto_964437 ?auto_964441 ) ) ( not ( = ?auto_964435 ?auto_964441 ) ) ( IS-CRATE ?auto_964436 ) ( AVAILABLE ?auto_964442 ) ( SURFACE-AT ?auto_964436 ?auto_964443 ) ( ON ?auto_964436 ?auto_964440 ) ( CLEAR ?auto_964436 ) ( not ( = ?auto_964436 ?auto_964440 ) ) ( not ( = ?auto_964437 ?auto_964440 ) ) ( not ( = ?auto_964435 ?auto_964440 ) ) ( not ( = ?auto_964441 ?auto_964440 ) ) ( TRUCK-AT ?auto_964439 ?auto_964444 ) ( SURFACE-AT ?auto_964434 ?auto_964444 ) ( CLEAR ?auto_964434 ) ( LIFTING ?auto_964438 ?auto_964435 ) ( IS-CRATE ?auto_964435 ) ( not ( = ?auto_964434 ?auto_964435 ) ) ( not ( = ?auto_964436 ?auto_964434 ) ) ( not ( = ?auto_964437 ?auto_964434 ) ) ( not ( = ?auto_964441 ?auto_964434 ) ) ( not ( = ?auto_964440 ?auto_964434 ) ) ( ON ?auto_964428 ?auto_964427 ) ( ON ?auto_964429 ?auto_964428 ) ( ON ?auto_964426 ?auto_964429 ) ( ON ?auto_964430 ?auto_964426 ) ( ON ?auto_964432 ?auto_964430 ) ( ON ?auto_964431 ?auto_964432 ) ( ON ?auto_964433 ?auto_964431 ) ( ON ?auto_964434 ?auto_964433 ) ( not ( = ?auto_964427 ?auto_964428 ) ) ( not ( = ?auto_964427 ?auto_964429 ) ) ( not ( = ?auto_964427 ?auto_964426 ) ) ( not ( = ?auto_964427 ?auto_964430 ) ) ( not ( = ?auto_964427 ?auto_964432 ) ) ( not ( = ?auto_964427 ?auto_964431 ) ) ( not ( = ?auto_964427 ?auto_964433 ) ) ( not ( = ?auto_964427 ?auto_964434 ) ) ( not ( = ?auto_964427 ?auto_964435 ) ) ( not ( = ?auto_964427 ?auto_964436 ) ) ( not ( = ?auto_964427 ?auto_964437 ) ) ( not ( = ?auto_964427 ?auto_964441 ) ) ( not ( = ?auto_964427 ?auto_964440 ) ) ( not ( = ?auto_964428 ?auto_964429 ) ) ( not ( = ?auto_964428 ?auto_964426 ) ) ( not ( = ?auto_964428 ?auto_964430 ) ) ( not ( = ?auto_964428 ?auto_964432 ) ) ( not ( = ?auto_964428 ?auto_964431 ) ) ( not ( = ?auto_964428 ?auto_964433 ) ) ( not ( = ?auto_964428 ?auto_964434 ) ) ( not ( = ?auto_964428 ?auto_964435 ) ) ( not ( = ?auto_964428 ?auto_964436 ) ) ( not ( = ?auto_964428 ?auto_964437 ) ) ( not ( = ?auto_964428 ?auto_964441 ) ) ( not ( = ?auto_964428 ?auto_964440 ) ) ( not ( = ?auto_964429 ?auto_964426 ) ) ( not ( = ?auto_964429 ?auto_964430 ) ) ( not ( = ?auto_964429 ?auto_964432 ) ) ( not ( = ?auto_964429 ?auto_964431 ) ) ( not ( = ?auto_964429 ?auto_964433 ) ) ( not ( = ?auto_964429 ?auto_964434 ) ) ( not ( = ?auto_964429 ?auto_964435 ) ) ( not ( = ?auto_964429 ?auto_964436 ) ) ( not ( = ?auto_964429 ?auto_964437 ) ) ( not ( = ?auto_964429 ?auto_964441 ) ) ( not ( = ?auto_964429 ?auto_964440 ) ) ( not ( = ?auto_964426 ?auto_964430 ) ) ( not ( = ?auto_964426 ?auto_964432 ) ) ( not ( = ?auto_964426 ?auto_964431 ) ) ( not ( = ?auto_964426 ?auto_964433 ) ) ( not ( = ?auto_964426 ?auto_964434 ) ) ( not ( = ?auto_964426 ?auto_964435 ) ) ( not ( = ?auto_964426 ?auto_964436 ) ) ( not ( = ?auto_964426 ?auto_964437 ) ) ( not ( = ?auto_964426 ?auto_964441 ) ) ( not ( = ?auto_964426 ?auto_964440 ) ) ( not ( = ?auto_964430 ?auto_964432 ) ) ( not ( = ?auto_964430 ?auto_964431 ) ) ( not ( = ?auto_964430 ?auto_964433 ) ) ( not ( = ?auto_964430 ?auto_964434 ) ) ( not ( = ?auto_964430 ?auto_964435 ) ) ( not ( = ?auto_964430 ?auto_964436 ) ) ( not ( = ?auto_964430 ?auto_964437 ) ) ( not ( = ?auto_964430 ?auto_964441 ) ) ( not ( = ?auto_964430 ?auto_964440 ) ) ( not ( = ?auto_964432 ?auto_964431 ) ) ( not ( = ?auto_964432 ?auto_964433 ) ) ( not ( = ?auto_964432 ?auto_964434 ) ) ( not ( = ?auto_964432 ?auto_964435 ) ) ( not ( = ?auto_964432 ?auto_964436 ) ) ( not ( = ?auto_964432 ?auto_964437 ) ) ( not ( = ?auto_964432 ?auto_964441 ) ) ( not ( = ?auto_964432 ?auto_964440 ) ) ( not ( = ?auto_964431 ?auto_964433 ) ) ( not ( = ?auto_964431 ?auto_964434 ) ) ( not ( = ?auto_964431 ?auto_964435 ) ) ( not ( = ?auto_964431 ?auto_964436 ) ) ( not ( = ?auto_964431 ?auto_964437 ) ) ( not ( = ?auto_964431 ?auto_964441 ) ) ( not ( = ?auto_964431 ?auto_964440 ) ) ( not ( = ?auto_964433 ?auto_964434 ) ) ( not ( = ?auto_964433 ?auto_964435 ) ) ( not ( = ?auto_964433 ?auto_964436 ) ) ( not ( = ?auto_964433 ?auto_964437 ) ) ( not ( = ?auto_964433 ?auto_964441 ) ) ( not ( = ?auto_964433 ?auto_964440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964435 ?auto_964436 ?auto_964437 )
      ( MAKE-11CRATE-VERIFY ?auto_964427 ?auto_964428 ?auto_964429 ?auto_964426 ?auto_964430 ?auto_964432 ?auto_964431 ?auto_964433 ?auto_964434 ?auto_964435 ?auto_964436 ?auto_964437 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_964446 - SURFACE
      ?auto_964447 - SURFACE
      ?auto_964448 - SURFACE
      ?auto_964445 - SURFACE
      ?auto_964449 - SURFACE
      ?auto_964451 - SURFACE
      ?auto_964450 - SURFACE
      ?auto_964452 - SURFACE
      ?auto_964453 - SURFACE
      ?auto_964454 - SURFACE
      ?auto_964455 - SURFACE
      ?auto_964456 - SURFACE
      ?auto_964457 - SURFACE
    )
    :vars
    (
      ?auto_964458 - HOIST
      ?auto_964464 - PLACE
      ?auto_964463 - PLACE
      ?auto_964462 - HOIST
      ?auto_964461 - SURFACE
      ?auto_964460 - SURFACE
      ?auto_964459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964458 ?auto_964464 ) ( IS-CRATE ?auto_964457 ) ( not ( = ?auto_964456 ?auto_964457 ) ) ( not ( = ?auto_964455 ?auto_964456 ) ) ( not ( = ?auto_964455 ?auto_964457 ) ) ( not ( = ?auto_964463 ?auto_964464 ) ) ( HOIST-AT ?auto_964462 ?auto_964463 ) ( not ( = ?auto_964458 ?auto_964462 ) ) ( SURFACE-AT ?auto_964457 ?auto_964463 ) ( ON ?auto_964457 ?auto_964461 ) ( CLEAR ?auto_964457 ) ( not ( = ?auto_964456 ?auto_964461 ) ) ( not ( = ?auto_964457 ?auto_964461 ) ) ( not ( = ?auto_964455 ?auto_964461 ) ) ( IS-CRATE ?auto_964456 ) ( AVAILABLE ?auto_964462 ) ( SURFACE-AT ?auto_964456 ?auto_964463 ) ( ON ?auto_964456 ?auto_964460 ) ( CLEAR ?auto_964456 ) ( not ( = ?auto_964456 ?auto_964460 ) ) ( not ( = ?auto_964457 ?auto_964460 ) ) ( not ( = ?auto_964455 ?auto_964460 ) ) ( not ( = ?auto_964461 ?auto_964460 ) ) ( TRUCK-AT ?auto_964459 ?auto_964464 ) ( SURFACE-AT ?auto_964454 ?auto_964464 ) ( CLEAR ?auto_964454 ) ( LIFTING ?auto_964458 ?auto_964455 ) ( IS-CRATE ?auto_964455 ) ( not ( = ?auto_964454 ?auto_964455 ) ) ( not ( = ?auto_964456 ?auto_964454 ) ) ( not ( = ?auto_964457 ?auto_964454 ) ) ( not ( = ?auto_964461 ?auto_964454 ) ) ( not ( = ?auto_964460 ?auto_964454 ) ) ( ON ?auto_964447 ?auto_964446 ) ( ON ?auto_964448 ?auto_964447 ) ( ON ?auto_964445 ?auto_964448 ) ( ON ?auto_964449 ?auto_964445 ) ( ON ?auto_964451 ?auto_964449 ) ( ON ?auto_964450 ?auto_964451 ) ( ON ?auto_964452 ?auto_964450 ) ( ON ?auto_964453 ?auto_964452 ) ( ON ?auto_964454 ?auto_964453 ) ( not ( = ?auto_964446 ?auto_964447 ) ) ( not ( = ?auto_964446 ?auto_964448 ) ) ( not ( = ?auto_964446 ?auto_964445 ) ) ( not ( = ?auto_964446 ?auto_964449 ) ) ( not ( = ?auto_964446 ?auto_964451 ) ) ( not ( = ?auto_964446 ?auto_964450 ) ) ( not ( = ?auto_964446 ?auto_964452 ) ) ( not ( = ?auto_964446 ?auto_964453 ) ) ( not ( = ?auto_964446 ?auto_964454 ) ) ( not ( = ?auto_964446 ?auto_964455 ) ) ( not ( = ?auto_964446 ?auto_964456 ) ) ( not ( = ?auto_964446 ?auto_964457 ) ) ( not ( = ?auto_964446 ?auto_964461 ) ) ( not ( = ?auto_964446 ?auto_964460 ) ) ( not ( = ?auto_964447 ?auto_964448 ) ) ( not ( = ?auto_964447 ?auto_964445 ) ) ( not ( = ?auto_964447 ?auto_964449 ) ) ( not ( = ?auto_964447 ?auto_964451 ) ) ( not ( = ?auto_964447 ?auto_964450 ) ) ( not ( = ?auto_964447 ?auto_964452 ) ) ( not ( = ?auto_964447 ?auto_964453 ) ) ( not ( = ?auto_964447 ?auto_964454 ) ) ( not ( = ?auto_964447 ?auto_964455 ) ) ( not ( = ?auto_964447 ?auto_964456 ) ) ( not ( = ?auto_964447 ?auto_964457 ) ) ( not ( = ?auto_964447 ?auto_964461 ) ) ( not ( = ?auto_964447 ?auto_964460 ) ) ( not ( = ?auto_964448 ?auto_964445 ) ) ( not ( = ?auto_964448 ?auto_964449 ) ) ( not ( = ?auto_964448 ?auto_964451 ) ) ( not ( = ?auto_964448 ?auto_964450 ) ) ( not ( = ?auto_964448 ?auto_964452 ) ) ( not ( = ?auto_964448 ?auto_964453 ) ) ( not ( = ?auto_964448 ?auto_964454 ) ) ( not ( = ?auto_964448 ?auto_964455 ) ) ( not ( = ?auto_964448 ?auto_964456 ) ) ( not ( = ?auto_964448 ?auto_964457 ) ) ( not ( = ?auto_964448 ?auto_964461 ) ) ( not ( = ?auto_964448 ?auto_964460 ) ) ( not ( = ?auto_964445 ?auto_964449 ) ) ( not ( = ?auto_964445 ?auto_964451 ) ) ( not ( = ?auto_964445 ?auto_964450 ) ) ( not ( = ?auto_964445 ?auto_964452 ) ) ( not ( = ?auto_964445 ?auto_964453 ) ) ( not ( = ?auto_964445 ?auto_964454 ) ) ( not ( = ?auto_964445 ?auto_964455 ) ) ( not ( = ?auto_964445 ?auto_964456 ) ) ( not ( = ?auto_964445 ?auto_964457 ) ) ( not ( = ?auto_964445 ?auto_964461 ) ) ( not ( = ?auto_964445 ?auto_964460 ) ) ( not ( = ?auto_964449 ?auto_964451 ) ) ( not ( = ?auto_964449 ?auto_964450 ) ) ( not ( = ?auto_964449 ?auto_964452 ) ) ( not ( = ?auto_964449 ?auto_964453 ) ) ( not ( = ?auto_964449 ?auto_964454 ) ) ( not ( = ?auto_964449 ?auto_964455 ) ) ( not ( = ?auto_964449 ?auto_964456 ) ) ( not ( = ?auto_964449 ?auto_964457 ) ) ( not ( = ?auto_964449 ?auto_964461 ) ) ( not ( = ?auto_964449 ?auto_964460 ) ) ( not ( = ?auto_964451 ?auto_964450 ) ) ( not ( = ?auto_964451 ?auto_964452 ) ) ( not ( = ?auto_964451 ?auto_964453 ) ) ( not ( = ?auto_964451 ?auto_964454 ) ) ( not ( = ?auto_964451 ?auto_964455 ) ) ( not ( = ?auto_964451 ?auto_964456 ) ) ( not ( = ?auto_964451 ?auto_964457 ) ) ( not ( = ?auto_964451 ?auto_964461 ) ) ( not ( = ?auto_964451 ?auto_964460 ) ) ( not ( = ?auto_964450 ?auto_964452 ) ) ( not ( = ?auto_964450 ?auto_964453 ) ) ( not ( = ?auto_964450 ?auto_964454 ) ) ( not ( = ?auto_964450 ?auto_964455 ) ) ( not ( = ?auto_964450 ?auto_964456 ) ) ( not ( = ?auto_964450 ?auto_964457 ) ) ( not ( = ?auto_964450 ?auto_964461 ) ) ( not ( = ?auto_964450 ?auto_964460 ) ) ( not ( = ?auto_964452 ?auto_964453 ) ) ( not ( = ?auto_964452 ?auto_964454 ) ) ( not ( = ?auto_964452 ?auto_964455 ) ) ( not ( = ?auto_964452 ?auto_964456 ) ) ( not ( = ?auto_964452 ?auto_964457 ) ) ( not ( = ?auto_964452 ?auto_964461 ) ) ( not ( = ?auto_964452 ?auto_964460 ) ) ( not ( = ?auto_964453 ?auto_964454 ) ) ( not ( = ?auto_964453 ?auto_964455 ) ) ( not ( = ?auto_964453 ?auto_964456 ) ) ( not ( = ?auto_964453 ?auto_964457 ) ) ( not ( = ?auto_964453 ?auto_964461 ) ) ( not ( = ?auto_964453 ?auto_964460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964455 ?auto_964456 ?auto_964457 )
      ( MAKE-12CRATE-VERIFY ?auto_964446 ?auto_964447 ?auto_964448 ?auto_964445 ?auto_964449 ?auto_964451 ?auto_964450 ?auto_964452 ?auto_964453 ?auto_964454 ?auto_964455 ?auto_964456 ?auto_964457 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_964466 - SURFACE
      ?auto_964467 - SURFACE
      ?auto_964468 - SURFACE
      ?auto_964465 - SURFACE
      ?auto_964469 - SURFACE
      ?auto_964471 - SURFACE
      ?auto_964470 - SURFACE
      ?auto_964472 - SURFACE
      ?auto_964473 - SURFACE
      ?auto_964474 - SURFACE
      ?auto_964475 - SURFACE
      ?auto_964476 - SURFACE
      ?auto_964477 - SURFACE
      ?auto_964478 - SURFACE
    )
    :vars
    (
      ?auto_964479 - HOIST
      ?auto_964485 - PLACE
      ?auto_964484 - PLACE
      ?auto_964483 - HOIST
      ?auto_964482 - SURFACE
      ?auto_964481 - SURFACE
      ?auto_964480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_964479 ?auto_964485 ) ( IS-CRATE ?auto_964478 ) ( not ( = ?auto_964477 ?auto_964478 ) ) ( not ( = ?auto_964476 ?auto_964477 ) ) ( not ( = ?auto_964476 ?auto_964478 ) ) ( not ( = ?auto_964484 ?auto_964485 ) ) ( HOIST-AT ?auto_964483 ?auto_964484 ) ( not ( = ?auto_964479 ?auto_964483 ) ) ( SURFACE-AT ?auto_964478 ?auto_964484 ) ( ON ?auto_964478 ?auto_964482 ) ( CLEAR ?auto_964478 ) ( not ( = ?auto_964477 ?auto_964482 ) ) ( not ( = ?auto_964478 ?auto_964482 ) ) ( not ( = ?auto_964476 ?auto_964482 ) ) ( IS-CRATE ?auto_964477 ) ( AVAILABLE ?auto_964483 ) ( SURFACE-AT ?auto_964477 ?auto_964484 ) ( ON ?auto_964477 ?auto_964481 ) ( CLEAR ?auto_964477 ) ( not ( = ?auto_964477 ?auto_964481 ) ) ( not ( = ?auto_964478 ?auto_964481 ) ) ( not ( = ?auto_964476 ?auto_964481 ) ) ( not ( = ?auto_964482 ?auto_964481 ) ) ( TRUCK-AT ?auto_964480 ?auto_964485 ) ( SURFACE-AT ?auto_964475 ?auto_964485 ) ( CLEAR ?auto_964475 ) ( LIFTING ?auto_964479 ?auto_964476 ) ( IS-CRATE ?auto_964476 ) ( not ( = ?auto_964475 ?auto_964476 ) ) ( not ( = ?auto_964477 ?auto_964475 ) ) ( not ( = ?auto_964478 ?auto_964475 ) ) ( not ( = ?auto_964482 ?auto_964475 ) ) ( not ( = ?auto_964481 ?auto_964475 ) ) ( ON ?auto_964467 ?auto_964466 ) ( ON ?auto_964468 ?auto_964467 ) ( ON ?auto_964465 ?auto_964468 ) ( ON ?auto_964469 ?auto_964465 ) ( ON ?auto_964471 ?auto_964469 ) ( ON ?auto_964470 ?auto_964471 ) ( ON ?auto_964472 ?auto_964470 ) ( ON ?auto_964473 ?auto_964472 ) ( ON ?auto_964474 ?auto_964473 ) ( ON ?auto_964475 ?auto_964474 ) ( not ( = ?auto_964466 ?auto_964467 ) ) ( not ( = ?auto_964466 ?auto_964468 ) ) ( not ( = ?auto_964466 ?auto_964465 ) ) ( not ( = ?auto_964466 ?auto_964469 ) ) ( not ( = ?auto_964466 ?auto_964471 ) ) ( not ( = ?auto_964466 ?auto_964470 ) ) ( not ( = ?auto_964466 ?auto_964472 ) ) ( not ( = ?auto_964466 ?auto_964473 ) ) ( not ( = ?auto_964466 ?auto_964474 ) ) ( not ( = ?auto_964466 ?auto_964475 ) ) ( not ( = ?auto_964466 ?auto_964476 ) ) ( not ( = ?auto_964466 ?auto_964477 ) ) ( not ( = ?auto_964466 ?auto_964478 ) ) ( not ( = ?auto_964466 ?auto_964482 ) ) ( not ( = ?auto_964466 ?auto_964481 ) ) ( not ( = ?auto_964467 ?auto_964468 ) ) ( not ( = ?auto_964467 ?auto_964465 ) ) ( not ( = ?auto_964467 ?auto_964469 ) ) ( not ( = ?auto_964467 ?auto_964471 ) ) ( not ( = ?auto_964467 ?auto_964470 ) ) ( not ( = ?auto_964467 ?auto_964472 ) ) ( not ( = ?auto_964467 ?auto_964473 ) ) ( not ( = ?auto_964467 ?auto_964474 ) ) ( not ( = ?auto_964467 ?auto_964475 ) ) ( not ( = ?auto_964467 ?auto_964476 ) ) ( not ( = ?auto_964467 ?auto_964477 ) ) ( not ( = ?auto_964467 ?auto_964478 ) ) ( not ( = ?auto_964467 ?auto_964482 ) ) ( not ( = ?auto_964467 ?auto_964481 ) ) ( not ( = ?auto_964468 ?auto_964465 ) ) ( not ( = ?auto_964468 ?auto_964469 ) ) ( not ( = ?auto_964468 ?auto_964471 ) ) ( not ( = ?auto_964468 ?auto_964470 ) ) ( not ( = ?auto_964468 ?auto_964472 ) ) ( not ( = ?auto_964468 ?auto_964473 ) ) ( not ( = ?auto_964468 ?auto_964474 ) ) ( not ( = ?auto_964468 ?auto_964475 ) ) ( not ( = ?auto_964468 ?auto_964476 ) ) ( not ( = ?auto_964468 ?auto_964477 ) ) ( not ( = ?auto_964468 ?auto_964478 ) ) ( not ( = ?auto_964468 ?auto_964482 ) ) ( not ( = ?auto_964468 ?auto_964481 ) ) ( not ( = ?auto_964465 ?auto_964469 ) ) ( not ( = ?auto_964465 ?auto_964471 ) ) ( not ( = ?auto_964465 ?auto_964470 ) ) ( not ( = ?auto_964465 ?auto_964472 ) ) ( not ( = ?auto_964465 ?auto_964473 ) ) ( not ( = ?auto_964465 ?auto_964474 ) ) ( not ( = ?auto_964465 ?auto_964475 ) ) ( not ( = ?auto_964465 ?auto_964476 ) ) ( not ( = ?auto_964465 ?auto_964477 ) ) ( not ( = ?auto_964465 ?auto_964478 ) ) ( not ( = ?auto_964465 ?auto_964482 ) ) ( not ( = ?auto_964465 ?auto_964481 ) ) ( not ( = ?auto_964469 ?auto_964471 ) ) ( not ( = ?auto_964469 ?auto_964470 ) ) ( not ( = ?auto_964469 ?auto_964472 ) ) ( not ( = ?auto_964469 ?auto_964473 ) ) ( not ( = ?auto_964469 ?auto_964474 ) ) ( not ( = ?auto_964469 ?auto_964475 ) ) ( not ( = ?auto_964469 ?auto_964476 ) ) ( not ( = ?auto_964469 ?auto_964477 ) ) ( not ( = ?auto_964469 ?auto_964478 ) ) ( not ( = ?auto_964469 ?auto_964482 ) ) ( not ( = ?auto_964469 ?auto_964481 ) ) ( not ( = ?auto_964471 ?auto_964470 ) ) ( not ( = ?auto_964471 ?auto_964472 ) ) ( not ( = ?auto_964471 ?auto_964473 ) ) ( not ( = ?auto_964471 ?auto_964474 ) ) ( not ( = ?auto_964471 ?auto_964475 ) ) ( not ( = ?auto_964471 ?auto_964476 ) ) ( not ( = ?auto_964471 ?auto_964477 ) ) ( not ( = ?auto_964471 ?auto_964478 ) ) ( not ( = ?auto_964471 ?auto_964482 ) ) ( not ( = ?auto_964471 ?auto_964481 ) ) ( not ( = ?auto_964470 ?auto_964472 ) ) ( not ( = ?auto_964470 ?auto_964473 ) ) ( not ( = ?auto_964470 ?auto_964474 ) ) ( not ( = ?auto_964470 ?auto_964475 ) ) ( not ( = ?auto_964470 ?auto_964476 ) ) ( not ( = ?auto_964470 ?auto_964477 ) ) ( not ( = ?auto_964470 ?auto_964478 ) ) ( not ( = ?auto_964470 ?auto_964482 ) ) ( not ( = ?auto_964470 ?auto_964481 ) ) ( not ( = ?auto_964472 ?auto_964473 ) ) ( not ( = ?auto_964472 ?auto_964474 ) ) ( not ( = ?auto_964472 ?auto_964475 ) ) ( not ( = ?auto_964472 ?auto_964476 ) ) ( not ( = ?auto_964472 ?auto_964477 ) ) ( not ( = ?auto_964472 ?auto_964478 ) ) ( not ( = ?auto_964472 ?auto_964482 ) ) ( not ( = ?auto_964472 ?auto_964481 ) ) ( not ( = ?auto_964473 ?auto_964474 ) ) ( not ( = ?auto_964473 ?auto_964475 ) ) ( not ( = ?auto_964473 ?auto_964476 ) ) ( not ( = ?auto_964473 ?auto_964477 ) ) ( not ( = ?auto_964473 ?auto_964478 ) ) ( not ( = ?auto_964473 ?auto_964482 ) ) ( not ( = ?auto_964473 ?auto_964481 ) ) ( not ( = ?auto_964474 ?auto_964475 ) ) ( not ( = ?auto_964474 ?auto_964476 ) ) ( not ( = ?auto_964474 ?auto_964477 ) ) ( not ( = ?auto_964474 ?auto_964478 ) ) ( not ( = ?auto_964474 ?auto_964482 ) ) ( not ( = ?auto_964474 ?auto_964481 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_964476 ?auto_964477 ?auto_964478 )
      ( MAKE-13CRATE-VERIFY ?auto_964466 ?auto_964467 ?auto_964468 ?auto_964465 ?auto_964469 ?auto_964471 ?auto_964470 ?auto_964472 ?auto_964473 ?auto_964474 ?auto_964475 ?auto_964476 ?auto_964477 ?auto_964478 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_970721 - SURFACE
      ?auto_970722 - SURFACE
    )
    :vars
    (
      ?auto_970724 - HOIST
      ?auto_970726 - PLACE
      ?auto_970729 - SURFACE
      ?auto_970730 - PLACE
      ?auto_970728 - HOIST
      ?auto_970727 - SURFACE
      ?auto_970723 - TRUCK
      ?auto_970725 - SURFACE
      ?auto_970731 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_970724 ?auto_970726 ) ( IS-CRATE ?auto_970722 ) ( not ( = ?auto_970721 ?auto_970722 ) ) ( not ( = ?auto_970729 ?auto_970721 ) ) ( not ( = ?auto_970729 ?auto_970722 ) ) ( not ( = ?auto_970730 ?auto_970726 ) ) ( HOIST-AT ?auto_970728 ?auto_970730 ) ( not ( = ?auto_970724 ?auto_970728 ) ) ( SURFACE-AT ?auto_970722 ?auto_970730 ) ( ON ?auto_970722 ?auto_970727 ) ( CLEAR ?auto_970722 ) ( not ( = ?auto_970721 ?auto_970727 ) ) ( not ( = ?auto_970722 ?auto_970727 ) ) ( not ( = ?auto_970729 ?auto_970727 ) ) ( SURFACE-AT ?auto_970729 ?auto_970726 ) ( CLEAR ?auto_970729 ) ( IS-CRATE ?auto_970721 ) ( AVAILABLE ?auto_970724 ) ( TRUCK-AT ?auto_970723 ?auto_970730 ) ( SURFACE-AT ?auto_970721 ?auto_970730 ) ( ON ?auto_970721 ?auto_970725 ) ( CLEAR ?auto_970721 ) ( not ( = ?auto_970721 ?auto_970725 ) ) ( not ( = ?auto_970722 ?auto_970725 ) ) ( not ( = ?auto_970729 ?auto_970725 ) ) ( not ( = ?auto_970727 ?auto_970725 ) ) ( LIFTING ?auto_970728 ?auto_970731 ) ( IS-CRATE ?auto_970731 ) ( not ( = ?auto_970721 ?auto_970731 ) ) ( not ( = ?auto_970722 ?auto_970731 ) ) ( not ( = ?auto_970729 ?auto_970731 ) ) ( not ( = ?auto_970727 ?auto_970731 ) ) ( not ( = ?auto_970725 ?auto_970731 ) ) )
    :subtasks
    ( ( !LOAD ?auto_970728 ?auto_970731 ?auto_970723 ?auto_970730 )
      ( MAKE-2CRATE ?auto_970729 ?auto_970721 ?auto_970722 )
      ( MAKE-1CRATE-VERIFY ?auto_970721 ?auto_970722 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_970732 - SURFACE
      ?auto_970733 - SURFACE
      ?auto_970734 - SURFACE
    )
    :vars
    (
      ?auto_970736 - HOIST
      ?auto_970740 - PLACE
      ?auto_970742 - PLACE
      ?auto_970741 - HOIST
      ?auto_970739 - SURFACE
      ?auto_970738 - TRUCK
      ?auto_970737 - SURFACE
      ?auto_970735 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_970736 ?auto_970740 ) ( IS-CRATE ?auto_970734 ) ( not ( = ?auto_970733 ?auto_970734 ) ) ( not ( = ?auto_970732 ?auto_970733 ) ) ( not ( = ?auto_970732 ?auto_970734 ) ) ( not ( = ?auto_970742 ?auto_970740 ) ) ( HOIST-AT ?auto_970741 ?auto_970742 ) ( not ( = ?auto_970736 ?auto_970741 ) ) ( SURFACE-AT ?auto_970734 ?auto_970742 ) ( ON ?auto_970734 ?auto_970739 ) ( CLEAR ?auto_970734 ) ( not ( = ?auto_970733 ?auto_970739 ) ) ( not ( = ?auto_970734 ?auto_970739 ) ) ( not ( = ?auto_970732 ?auto_970739 ) ) ( SURFACE-AT ?auto_970732 ?auto_970740 ) ( CLEAR ?auto_970732 ) ( IS-CRATE ?auto_970733 ) ( AVAILABLE ?auto_970736 ) ( TRUCK-AT ?auto_970738 ?auto_970742 ) ( SURFACE-AT ?auto_970733 ?auto_970742 ) ( ON ?auto_970733 ?auto_970737 ) ( CLEAR ?auto_970733 ) ( not ( = ?auto_970733 ?auto_970737 ) ) ( not ( = ?auto_970734 ?auto_970737 ) ) ( not ( = ?auto_970732 ?auto_970737 ) ) ( not ( = ?auto_970739 ?auto_970737 ) ) ( LIFTING ?auto_970741 ?auto_970735 ) ( IS-CRATE ?auto_970735 ) ( not ( = ?auto_970733 ?auto_970735 ) ) ( not ( = ?auto_970734 ?auto_970735 ) ) ( not ( = ?auto_970732 ?auto_970735 ) ) ( not ( = ?auto_970739 ?auto_970735 ) ) ( not ( = ?auto_970737 ?auto_970735 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_970733 ?auto_970734 )
      ( MAKE-2CRATE-VERIFY ?auto_970732 ?auto_970733 ?auto_970734 ) )
  )

)

