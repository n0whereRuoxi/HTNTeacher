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

  ( :method MAKE-16CRATE-VERIFY
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
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24520 - SURFACE
      ?auto_24521 - SURFACE
    )
    :vars
    (
      ?auto_24522 - HOIST
      ?auto_24523 - PLACE
      ?auto_24525 - PLACE
      ?auto_24526 - HOIST
      ?auto_24527 - SURFACE
      ?auto_24524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24522 ?auto_24523 ) ( SURFACE-AT ?auto_24520 ?auto_24523 ) ( CLEAR ?auto_24520 ) ( IS-CRATE ?auto_24521 ) ( AVAILABLE ?auto_24522 ) ( not ( = ?auto_24525 ?auto_24523 ) ) ( HOIST-AT ?auto_24526 ?auto_24525 ) ( AVAILABLE ?auto_24526 ) ( SURFACE-AT ?auto_24521 ?auto_24525 ) ( ON ?auto_24521 ?auto_24527 ) ( CLEAR ?auto_24521 ) ( TRUCK-AT ?auto_24524 ?auto_24523 ) ( not ( = ?auto_24520 ?auto_24521 ) ) ( not ( = ?auto_24520 ?auto_24527 ) ) ( not ( = ?auto_24521 ?auto_24527 ) ) ( not ( = ?auto_24522 ?auto_24526 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24524 ?auto_24523 ?auto_24525 )
      ( !LIFT ?auto_24526 ?auto_24521 ?auto_24527 ?auto_24525 )
      ( !LOAD ?auto_24526 ?auto_24521 ?auto_24524 ?auto_24525 )
      ( !DRIVE ?auto_24524 ?auto_24525 ?auto_24523 )
      ( !UNLOAD ?auto_24522 ?auto_24521 ?auto_24524 ?auto_24523 )
      ( !DROP ?auto_24522 ?auto_24521 ?auto_24520 ?auto_24523 )
      ( MAKE-1CRATE-VERIFY ?auto_24520 ?auto_24521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24541 - SURFACE
      ?auto_24542 - SURFACE
      ?auto_24543 - SURFACE
    )
    :vars
    (
      ?auto_24548 - HOIST
      ?auto_24545 - PLACE
      ?auto_24544 - PLACE
      ?auto_24547 - HOIST
      ?auto_24546 - SURFACE
      ?auto_24551 - PLACE
      ?auto_24552 - HOIST
      ?auto_24550 - SURFACE
      ?auto_24549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24548 ?auto_24545 ) ( IS-CRATE ?auto_24543 ) ( not ( = ?auto_24544 ?auto_24545 ) ) ( HOIST-AT ?auto_24547 ?auto_24544 ) ( AVAILABLE ?auto_24547 ) ( SURFACE-AT ?auto_24543 ?auto_24544 ) ( ON ?auto_24543 ?auto_24546 ) ( CLEAR ?auto_24543 ) ( not ( = ?auto_24542 ?auto_24543 ) ) ( not ( = ?auto_24542 ?auto_24546 ) ) ( not ( = ?auto_24543 ?auto_24546 ) ) ( not ( = ?auto_24548 ?auto_24547 ) ) ( SURFACE-AT ?auto_24541 ?auto_24545 ) ( CLEAR ?auto_24541 ) ( IS-CRATE ?auto_24542 ) ( AVAILABLE ?auto_24548 ) ( not ( = ?auto_24551 ?auto_24545 ) ) ( HOIST-AT ?auto_24552 ?auto_24551 ) ( AVAILABLE ?auto_24552 ) ( SURFACE-AT ?auto_24542 ?auto_24551 ) ( ON ?auto_24542 ?auto_24550 ) ( CLEAR ?auto_24542 ) ( TRUCK-AT ?auto_24549 ?auto_24545 ) ( not ( = ?auto_24541 ?auto_24542 ) ) ( not ( = ?auto_24541 ?auto_24550 ) ) ( not ( = ?auto_24542 ?auto_24550 ) ) ( not ( = ?auto_24548 ?auto_24552 ) ) ( not ( = ?auto_24541 ?auto_24543 ) ) ( not ( = ?auto_24541 ?auto_24546 ) ) ( not ( = ?auto_24543 ?auto_24550 ) ) ( not ( = ?auto_24544 ?auto_24551 ) ) ( not ( = ?auto_24547 ?auto_24552 ) ) ( not ( = ?auto_24546 ?auto_24550 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24541 ?auto_24542 )
      ( MAKE-1CRATE ?auto_24542 ?auto_24543 )
      ( MAKE-2CRATE-VERIFY ?auto_24541 ?auto_24542 ?auto_24543 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24567 - SURFACE
      ?auto_24568 - SURFACE
      ?auto_24569 - SURFACE
      ?auto_24570 - SURFACE
    )
    :vars
    (
      ?auto_24575 - HOIST
      ?auto_24573 - PLACE
      ?auto_24572 - PLACE
      ?auto_24571 - HOIST
      ?auto_24576 - SURFACE
      ?auto_24579 - PLACE
      ?auto_24581 - HOIST
      ?auto_24582 - SURFACE
      ?auto_24580 - PLACE
      ?auto_24578 - HOIST
      ?auto_24577 - SURFACE
      ?auto_24574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24575 ?auto_24573 ) ( IS-CRATE ?auto_24570 ) ( not ( = ?auto_24572 ?auto_24573 ) ) ( HOIST-AT ?auto_24571 ?auto_24572 ) ( AVAILABLE ?auto_24571 ) ( SURFACE-AT ?auto_24570 ?auto_24572 ) ( ON ?auto_24570 ?auto_24576 ) ( CLEAR ?auto_24570 ) ( not ( = ?auto_24569 ?auto_24570 ) ) ( not ( = ?auto_24569 ?auto_24576 ) ) ( not ( = ?auto_24570 ?auto_24576 ) ) ( not ( = ?auto_24575 ?auto_24571 ) ) ( IS-CRATE ?auto_24569 ) ( not ( = ?auto_24579 ?auto_24573 ) ) ( HOIST-AT ?auto_24581 ?auto_24579 ) ( AVAILABLE ?auto_24581 ) ( SURFACE-AT ?auto_24569 ?auto_24579 ) ( ON ?auto_24569 ?auto_24582 ) ( CLEAR ?auto_24569 ) ( not ( = ?auto_24568 ?auto_24569 ) ) ( not ( = ?auto_24568 ?auto_24582 ) ) ( not ( = ?auto_24569 ?auto_24582 ) ) ( not ( = ?auto_24575 ?auto_24581 ) ) ( SURFACE-AT ?auto_24567 ?auto_24573 ) ( CLEAR ?auto_24567 ) ( IS-CRATE ?auto_24568 ) ( AVAILABLE ?auto_24575 ) ( not ( = ?auto_24580 ?auto_24573 ) ) ( HOIST-AT ?auto_24578 ?auto_24580 ) ( AVAILABLE ?auto_24578 ) ( SURFACE-AT ?auto_24568 ?auto_24580 ) ( ON ?auto_24568 ?auto_24577 ) ( CLEAR ?auto_24568 ) ( TRUCK-AT ?auto_24574 ?auto_24573 ) ( not ( = ?auto_24567 ?auto_24568 ) ) ( not ( = ?auto_24567 ?auto_24577 ) ) ( not ( = ?auto_24568 ?auto_24577 ) ) ( not ( = ?auto_24575 ?auto_24578 ) ) ( not ( = ?auto_24567 ?auto_24569 ) ) ( not ( = ?auto_24567 ?auto_24582 ) ) ( not ( = ?auto_24569 ?auto_24577 ) ) ( not ( = ?auto_24579 ?auto_24580 ) ) ( not ( = ?auto_24581 ?auto_24578 ) ) ( not ( = ?auto_24582 ?auto_24577 ) ) ( not ( = ?auto_24567 ?auto_24570 ) ) ( not ( = ?auto_24567 ?auto_24576 ) ) ( not ( = ?auto_24568 ?auto_24570 ) ) ( not ( = ?auto_24568 ?auto_24576 ) ) ( not ( = ?auto_24570 ?auto_24582 ) ) ( not ( = ?auto_24570 ?auto_24577 ) ) ( not ( = ?auto_24572 ?auto_24579 ) ) ( not ( = ?auto_24572 ?auto_24580 ) ) ( not ( = ?auto_24571 ?auto_24581 ) ) ( not ( = ?auto_24571 ?auto_24578 ) ) ( not ( = ?auto_24576 ?auto_24582 ) ) ( not ( = ?auto_24576 ?auto_24577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24567 ?auto_24568 ?auto_24569 )
      ( MAKE-1CRATE ?auto_24569 ?auto_24570 )
      ( MAKE-3CRATE-VERIFY ?auto_24567 ?auto_24568 ?auto_24569 ?auto_24570 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24598 - SURFACE
      ?auto_24599 - SURFACE
      ?auto_24600 - SURFACE
      ?auto_24601 - SURFACE
      ?auto_24602 - SURFACE
    )
    :vars
    (
      ?auto_24608 - HOIST
      ?auto_24603 - PLACE
      ?auto_24604 - PLACE
      ?auto_24607 - HOIST
      ?auto_24606 - SURFACE
      ?auto_24616 - PLACE
      ?auto_24611 - HOIST
      ?auto_24615 - SURFACE
      ?auto_24610 - PLACE
      ?auto_24612 - HOIST
      ?auto_24614 - SURFACE
      ?auto_24617 - PLACE
      ?auto_24613 - HOIST
      ?auto_24609 - SURFACE
      ?auto_24605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24608 ?auto_24603 ) ( IS-CRATE ?auto_24602 ) ( not ( = ?auto_24604 ?auto_24603 ) ) ( HOIST-AT ?auto_24607 ?auto_24604 ) ( AVAILABLE ?auto_24607 ) ( SURFACE-AT ?auto_24602 ?auto_24604 ) ( ON ?auto_24602 ?auto_24606 ) ( CLEAR ?auto_24602 ) ( not ( = ?auto_24601 ?auto_24602 ) ) ( not ( = ?auto_24601 ?auto_24606 ) ) ( not ( = ?auto_24602 ?auto_24606 ) ) ( not ( = ?auto_24608 ?auto_24607 ) ) ( IS-CRATE ?auto_24601 ) ( not ( = ?auto_24616 ?auto_24603 ) ) ( HOIST-AT ?auto_24611 ?auto_24616 ) ( AVAILABLE ?auto_24611 ) ( SURFACE-AT ?auto_24601 ?auto_24616 ) ( ON ?auto_24601 ?auto_24615 ) ( CLEAR ?auto_24601 ) ( not ( = ?auto_24600 ?auto_24601 ) ) ( not ( = ?auto_24600 ?auto_24615 ) ) ( not ( = ?auto_24601 ?auto_24615 ) ) ( not ( = ?auto_24608 ?auto_24611 ) ) ( IS-CRATE ?auto_24600 ) ( not ( = ?auto_24610 ?auto_24603 ) ) ( HOIST-AT ?auto_24612 ?auto_24610 ) ( AVAILABLE ?auto_24612 ) ( SURFACE-AT ?auto_24600 ?auto_24610 ) ( ON ?auto_24600 ?auto_24614 ) ( CLEAR ?auto_24600 ) ( not ( = ?auto_24599 ?auto_24600 ) ) ( not ( = ?auto_24599 ?auto_24614 ) ) ( not ( = ?auto_24600 ?auto_24614 ) ) ( not ( = ?auto_24608 ?auto_24612 ) ) ( SURFACE-AT ?auto_24598 ?auto_24603 ) ( CLEAR ?auto_24598 ) ( IS-CRATE ?auto_24599 ) ( AVAILABLE ?auto_24608 ) ( not ( = ?auto_24617 ?auto_24603 ) ) ( HOIST-AT ?auto_24613 ?auto_24617 ) ( AVAILABLE ?auto_24613 ) ( SURFACE-AT ?auto_24599 ?auto_24617 ) ( ON ?auto_24599 ?auto_24609 ) ( CLEAR ?auto_24599 ) ( TRUCK-AT ?auto_24605 ?auto_24603 ) ( not ( = ?auto_24598 ?auto_24599 ) ) ( not ( = ?auto_24598 ?auto_24609 ) ) ( not ( = ?auto_24599 ?auto_24609 ) ) ( not ( = ?auto_24608 ?auto_24613 ) ) ( not ( = ?auto_24598 ?auto_24600 ) ) ( not ( = ?auto_24598 ?auto_24614 ) ) ( not ( = ?auto_24600 ?auto_24609 ) ) ( not ( = ?auto_24610 ?auto_24617 ) ) ( not ( = ?auto_24612 ?auto_24613 ) ) ( not ( = ?auto_24614 ?auto_24609 ) ) ( not ( = ?auto_24598 ?auto_24601 ) ) ( not ( = ?auto_24598 ?auto_24615 ) ) ( not ( = ?auto_24599 ?auto_24601 ) ) ( not ( = ?auto_24599 ?auto_24615 ) ) ( not ( = ?auto_24601 ?auto_24614 ) ) ( not ( = ?auto_24601 ?auto_24609 ) ) ( not ( = ?auto_24616 ?auto_24610 ) ) ( not ( = ?auto_24616 ?auto_24617 ) ) ( not ( = ?auto_24611 ?auto_24612 ) ) ( not ( = ?auto_24611 ?auto_24613 ) ) ( not ( = ?auto_24615 ?auto_24614 ) ) ( not ( = ?auto_24615 ?auto_24609 ) ) ( not ( = ?auto_24598 ?auto_24602 ) ) ( not ( = ?auto_24598 ?auto_24606 ) ) ( not ( = ?auto_24599 ?auto_24602 ) ) ( not ( = ?auto_24599 ?auto_24606 ) ) ( not ( = ?auto_24600 ?auto_24602 ) ) ( not ( = ?auto_24600 ?auto_24606 ) ) ( not ( = ?auto_24602 ?auto_24615 ) ) ( not ( = ?auto_24602 ?auto_24614 ) ) ( not ( = ?auto_24602 ?auto_24609 ) ) ( not ( = ?auto_24604 ?auto_24616 ) ) ( not ( = ?auto_24604 ?auto_24610 ) ) ( not ( = ?auto_24604 ?auto_24617 ) ) ( not ( = ?auto_24607 ?auto_24611 ) ) ( not ( = ?auto_24607 ?auto_24612 ) ) ( not ( = ?auto_24607 ?auto_24613 ) ) ( not ( = ?auto_24606 ?auto_24615 ) ) ( not ( = ?auto_24606 ?auto_24614 ) ) ( not ( = ?auto_24606 ?auto_24609 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_24598 ?auto_24599 ?auto_24600 ?auto_24601 )
      ( MAKE-1CRATE ?auto_24601 ?auto_24602 )
      ( MAKE-4CRATE-VERIFY ?auto_24598 ?auto_24599 ?auto_24600 ?auto_24601 ?auto_24602 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_24634 - SURFACE
      ?auto_24635 - SURFACE
      ?auto_24636 - SURFACE
      ?auto_24637 - SURFACE
      ?auto_24638 - SURFACE
      ?auto_24639 - SURFACE
    )
    :vars
    (
      ?auto_24643 - HOIST
      ?auto_24645 - PLACE
      ?auto_24640 - PLACE
      ?auto_24642 - HOIST
      ?auto_24644 - SURFACE
      ?auto_24649 - PLACE
      ?auto_24651 - HOIST
      ?auto_24650 - SURFACE
      ?auto_24654 - PLACE
      ?auto_24655 - HOIST
      ?auto_24646 - SURFACE
      ?auto_24647 - PLACE
      ?auto_24648 - HOIST
      ?auto_24653 - SURFACE
      ?auto_24652 - SURFACE
      ?auto_24641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24643 ?auto_24645 ) ( IS-CRATE ?auto_24639 ) ( not ( = ?auto_24640 ?auto_24645 ) ) ( HOIST-AT ?auto_24642 ?auto_24640 ) ( SURFACE-AT ?auto_24639 ?auto_24640 ) ( ON ?auto_24639 ?auto_24644 ) ( CLEAR ?auto_24639 ) ( not ( = ?auto_24638 ?auto_24639 ) ) ( not ( = ?auto_24638 ?auto_24644 ) ) ( not ( = ?auto_24639 ?auto_24644 ) ) ( not ( = ?auto_24643 ?auto_24642 ) ) ( IS-CRATE ?auto_24638 ) ( not ( = ?auto_24649 ?auto_24645 ) ) ( HOIST-AT ?auto_24651 ?auto_24649 ) ( AVAILABLE ?auto_24651 ) ( SURFACE-AT ?auto_24638 ?auto_24649 ) ( ON ?auto_24638 ?auto_24650 ) ( CLEAR ?auto_24638 ) ( not ( = ?auto_24637 ?auto_24638 ) ) ( not ( = ?auto_24637 ?auto_24650 ) ) ( not ( = ?auto_24638 ?auto_24650 ) ) ( not ( = ?auto_24643 ?auto_24651 ) ) ( IS-CRATE ?auto_24637 ) ( not ( = ?auto_24654 ?auto_24645 ) ) ( HOIST-AT ?auto_24655 ?auto_24654 ) ( AVAILABLE ?auto_24655 ) ( SURFACE-AT ?auto_24637 ?auto_24654 ) ( ON ?auto_24637 ?auto_24646 ) ( CLEAR ?auto_24637 ) ( not ( = ?auto_24636 ?auto_24637 ) ) ( not ( = ?auto_24636 ?auto_24646 ) ) ( not ( = ?auto_24637 ?auto_24646 ) ) ( not ( = ?auto_24643 ?auto_24655 ) ) ( IS-CRATE ?auto_24636 ) ( not ( = ?auto_24647 ?auto_24645 ) ) ( HOIST-AT ?auto_24648 ?auto_24647 ) ( AVAILABLE ?auto_24648 ) ( SURFACE-AT ?auto_24636 ?auto_24647 ) ( ON ?auto_24636 ?auto_24653 ) ( CLEAR ?auto_24636 ) ( not ( = ?auto_24635 ?auto_24636 ) ) ( not ( = ?auto_24635 ?auto_24653 ) ) ( not ( = ?auto_24636 ?auto_24653 ) ) ( not ( = ?auto_24643 ?auto_24648 ) ) ( SURFACE-AT ?auto_24634 ?auto_24645 ) ( CLEAR ?auto_24634 ) ( IS-CRATE ?auto_24635 ) ( AVAILABLE ?auto_24643 ) ( AVAILABLE ?auto_24642 ) ( SURFACE-AT ?auto_24635 ?auto_24640 ) ( ON ?auto_24635 ?auto_24652 ) ( CLEAR ?auto_24635 ) ( TRUCK-AT ?auto_24641 ?auto_24645 ) ( not ( = ?auto_24634 ?auto_24635 ) ) ( not ( = ?auto_24634 ?auto_24652 ) ) ( not ( = ?auto_24635 ?auto_24652 ) ) ( not ( = ?auto_24634 ?auto_24636 ) ) ( not ( = ?auto_24634 ?auto_24653 ) ) ( not ( = ?auto_24636 ?auto_24652 ) ) ( not ( = ?auto_24647 ?auto_24640 ) ) ( not ( = ?auto_24648 ?auto_24642 ) ) ( not ( = ?auto_24653 ?auto_24652 ) ) ( not ( = ?auto_24634 ?auto_24637 ) ) ( not ( = ?auto_24634 ?auto_24646 ) ) ( not ( = ?auto_24635 ?auto_24637 ) ) ( not ( = ?auto_24635 ?auto_24646 ) ) ( not ( = ?auto_24637 ?auto_24653 ) ) ( not ( = ?auto_24637 ?auto_24652 ) ) ( not ( = ?auto_24654 ?auto_24647 ) ) ( not ( = ?auto_24654 ?auto_24640 ) ) ( not ( = ?auto_24655 ?auto_24648 ) ) ( not ( = ?auto_24655 ?auto_24642 ) ) ( not ( = ?auto_24646 ?auto_24653 ) ) ( not ( = ?auto_24646 ?auto_24652 ) ) ( not ( = ?auto_24634 ?auto_24638 ) ) ( not ( = ?auto_24634 ?auto_24650 ) ) ( not ( = ?auto_24635 ?auto_24638 ) ) ( not ( = ?auto_24635 ?auto_24650 ) ) ( not ( = ?auto_24636 ?auto_24638 ) ) ( not ( = ?auto_24636 ?auto_24650 ) ) ( not ( = ?auto_24638 ?auto_24646 ) ) ( not ( = ?auto_24638 ?auto_24653 ) ) ( not ( = ?auto_24638 ?auto_24652 ) ) ( not ( = ?auto_24649 ?auto_24654 ) ) ( not ( = ?auto_24649 ?auto_24647 ) ) ( not ( = ?auto_24649 ?auto_24640 ) ) ( not ( = ?auto_24651 ?auto_24655 ) ) ( not ( = ?auto_24651 ?auto_24648 ) ) ( not ( = ?auto_24651 ?auto_24642 ) ) ( not ( = ?auto_24650 ?auto_24646 ) ) ( not ( = ?auto_24650 ?auto_24653 ) ) ( not ( = ?auto_24650 ?auto_24652 ) ) ( not ( = ?auto_24634 ?auto_24639 ) ) ( not ( = ?auto_24634 ?auto_24644 ) ) ( not ( = ?auto_24635 ?auto_24639 ) ) ( not ( = ?auto_24635 ?auto_24644 ) ) ( not ( = ?auto_24636 ?auto_24639 ) ) ( not ( = ?auto_24636 ?auto_24644 ) ) ( not ( = ?auto_24637 ?auto_24639 ) ) ( not ( = ?auto_24637 ?auto_24644 ) ) ( not ( = ?auto_24639 ?auto_24650 ) ) ( not ( = ?auto_24639 ?auto_24646 ) ) ( not ( = ?auto_24639 ?auto_24653 ) ) ( not ( = ?auto_24639 ?auto_24652 ) ) ( not ( = ?auto_24644 ?auto_24650 ) ) ( not ( = ?auto_24644 ?auto_24646 ) ) ( not ( = ?auto_24644 ?auto_24653 ) ) ( not ( = ?auto_24644 ?auto_24652 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_24634 ?auto_24635 ?auto_24636 ?auto_24637 ?auto_24638 )
      ( MAKE-1CRATE ?auto_24638 ?auto_24639 )
      ( MAKE-5CRATE-VERIFY ?auto_24634 ?auto_24635 ?auto_24636 ?auto_24637 ?auto_24638 ?auto_24639 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_24673 - SURFACE
      ?auto_24674 - SURFACE
      ?auto_24675 - SURFACE
      ?auto_24676 - SURFACE
      ?auto_24677 - SURFACE
      ?auto_24678 - SURFACE
      ?auto_24679 - SURFACE
    )
    :vars
    (
      ?auto_24680 - HOIST
      ?auto_24681 - PLACE
      ?auto_24685 - PLACE
      ?auto_24684 - HOIST
      ?auto_24683 - SURFACE
      ?auto_24693 - PLACE
      ?auto_24692 - HOIST
      ?auto_24687 - SURFACE
      ?auto_24686 - SURFACE
      ?auto_24690 - PLACE
      ?auto_24694 - HOIST
      ?auto_24688 - SURFACE
      ?auto_24691 - PLACE
      ?auto_24695 - HOIST
      ?auto_24696 - SURFACE
      ?auto_24689 - SURFACE
      ?auto_24682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24680 ?auto_24681 ) ( IS-CRATE ?auto_24679 ) ( not ( = ?auto_24685 ?auto_24681 ) ) ( HOIST-AT ?auto_24684 ?auto_24685 ) ( SURFACE-AT ?auto_24679 ?auto_24685 ) ( ON ?auto_24679 ?auto_24683 ) ( CLEAR ?auto_24679 ) ( not ( = ?auto_24678 ?auto_24679 ) ) ( not ( = ?auto_24678 ?auto_24683 ) ) ( not ( = ?auto_24679 ?auto_24683 ) ) ( not ( = ?auto_24680 ?auto_24684 ) ) ( IS-CRATE ?auto_24678 ) ( not ( = ?auto_24693 ?auto_24681 ) ) ( HOIST-AT ?auto_24692 ?auto_24693 ) ( SURFACE-AT ?auto_24678 ?auto_24693 ) ( ON ?auto_24678 ?auto_24687 ) ( CLEAR ?auto_24678 ) ( not ( = ?auto_24677 ?auto_24678 ) ) ( not ( = ?auto_24677 ?auto_24687 ) ) ( not ( = ?auto_24678 ?auto_24687 ) ) ( not ( = ?auto_24680 ?auto_24692 ) ) ( IS-CRATE ?auto_24677 ) ( AVAILABLE ?auto_24684 ) ( SURFACE-AT ?auto_24677 ?auto_24685 ) ( ON ?auto_24677 ?auto_24686 ) ( CLEAR ?auto_24677 ) ( not ( = ?auto_24676 ?auto_24677 ) ) ( not ( = ?auto_24676 ?auto_24686 ) ) ( not ( = ?auto_24677 ?auto_24686 ) ) ( IS-CRATE ?auto_24676 ) ( not ( = ?auto_24690 ?auto_24681 ) ) ( HOIST-AT ?auto_24694 ?auto_24690 ) ( AVAILABLE ?auto_24694 ) ( SURFACE-AT ?auto_24676 ?auto_24690 ) ( ON ?auto_24676 ?auto_24688 ) ( CLEAR ?auto_24676 ) ( not ( = ?auto_24675 ?auto_24676 ) ) ( not ( = ?auto_24675 ?auto_24688 ) ) ( not ( = ?auto_24676 ?auto_24688 ) ) ( not ( = ?auto_24680 ?auto_24694 ) ) ( IS-CRATE ?auto_24675 ) ( not ( = ?auto_24691 ?auto_24681 ) ) ( HOIST-AT ?auto_24695 ?auto_24691 ) ( AVAILABLE ?auto_24695 ) ( SURFACE-AT ?auto_24675 ?auto_24691 ) ( ON ?auto_24675 ?auto_24696 ) ( CLEAR ?auto_24675 ) ( not ( = ?auto_24674 ?auto_24675 ) ) ( not ( = ?auto_24674 ?auto_24696 ) ) ( not ( = ?auto_24675 ?auto_24696 ) ) ( not ( = ?auto_24680 ?auto_24695 ) ) ( SURFACE-AT ?auto_24673 ?auto_24681 ) ( CLEAR ?auto_24673 ) ( IS-CRATE ?auto_24674 ) ( AVAILABLE ?auto_24680 ) ( AVAILABLE ?auto_24692 ) ( SURFACE-AT ?auto_24674 ?auto_24693 ) ( ON ?auto_24674 ?auto_24689 ) ( CLEAR ?auto_24674 ) ( TRUCK-AT ?auto_24682 ?auto_24681 ) ( not ( = ?auto_24673 ?auto_24674 ) ) ( not ( = ?auto_24673 ?auto_24689 ) ) ( not ( = ?auto_24674 ?auto_24689 ) ) ( not ( = ?auto_24673 ?auto_24675 ) ) ( not ( = ?auto_24673 ?auto_24696 ) ) ( not ( = ?auto_24675 ?auto_24689 ) ) ( not ( = ?auto_24691 ?auto_24693 ) ) ( not ( = ?auto_24695 ?auto_24692 ) ) ( not ( = ?auto_24696 ?auto_24689 ) ) ( not ( = ?auto_24673 ?auto_24676 ) ) ( not ( = ?auto_24673 ?auto_24688 ) ) ( not ( = ?auto_24674 ?auto_24676 ) ) ( not ( = ?auto_24674 ?auto_24688 ) ) ( not ( = ?auto_24676 ?auto_24696 ) ) ( not ( = ?auto_24676 ?auto_24689 ) ) ( not ( = ?auto_24690 ?auto_24691 ) ) ( not ( = ?auto_24690 ?auto_24693 ) ) ( not ( = ?auto_24694 ?auto_24695 ) ) ( not ( = ?auto_24694 ?auto_24692 ) ) ( not ( = ?auto_24688 ?auto_24696 ) ) ( not ( = ?auto_24688 ?auto_24689 ) ) ( not ( = ?auto_24673 ?auto_24677 ) ) ( not ( = ?auto_24673 ?auto_24686 ) ) ( not ( = ?auto_24674 ?auto_24677 ) ) ( not ( = ?auto_24674 ?auto_24686 ) ) ( not ( = ?auto_24675 ?auto_24677 ) ) ( not ( = ?auto_24675 ?auto_24686 ) ) ( not ( = ?auto_24677 ?auto_24688 ) ) ( not ( = ?auto_24677 ?auto_24696 ) ) ( not ( = ?auto_24677 ?auto_24689 ) ) ( not ( = ?auto_24685 ?auto_24690 ) ) ( not ( = ?auto_24685 ?auto_24691 ) ) ( not ( = ?auto_24685 ?auto_24693 ) ) ( not ( = ?auto_24684 ?auto_24694 ) ) ( not ( = ?auto_24684 ?auto_24695 ) ) ( not ( = ?auto_24684 ?auto_24692 ) ) ( not ( = ?auto_24686 ?auto_24688 ) ) ( not ( = ?auto_24686 ?auto_24696 ) ) ( not ( = ?auto_24686 ?auto_24689 ) ) ( not ( = ?auto_24673 ?auto_24678 ) ) ( not ( = ?auto_24673 ?auto_24687 ) ) ( not ( = ?auto_24674 ?auto_24678 ) ) ( not ( = ?auto_24674 ?auto_24687 ) ) ( not ( = ?auto_24675 ?auto_24678 ) ) ( not ( = ?auto_24675 ?auto_24687 ) ) ( not ( = ?auto_24676 ?auto_24678 ) ) ( not ( = ?auto_24676 ?auto_24687 ) ) ( not ( = ?auto_24678 ?auto_24686 ) ) ( not ( = ?auto_24678 ?auto_24688 ) ) ( not ( = ?auto_24678 ?auto_24696 ) ) ( not ( = ?auto_24678 ?auto_24689 ) ) ( not ( = ?auto_24687 ?auto_24686 ) ) ( not ( = ?auto_24687 ?auto_24688 ) ) ( not ( = ?auto_24687 ?auto_24696 ) ) ( not ( = ?auto_24687 ?auto_24689 ) ) ( not ( = ?auto_24673 ?auto_24679 ) ) ( not ( = ?auto_24673 ?auto_24683 ) ) ( not ( = ?auto_24674 ?auto_24679 ) ) ( not ( = ?auto_24674 ?auto_24683 ) ) ( not ( = ?auto_24675 ?auto_24679 ) ) ( not ( = ?auto_24675 ?auto_24683 ) ) ( not ( = ?auto_24676 ?auto_24679 ) ) ( not ( = ?auto_24676 ?auto_24683 ) ) ( not ( = ?auto_24677 ?auto_24679 ) ) ( not ( = ?auto_24677 ?auto_24683 ) ) ( not ( = ?auto_24679 ?auto_24687 ) ) ( not ( = ?auto_24679 ?auto_24686 ) ) ( not ( = ?auto_24679 ?auto_24688 ) ) ( not ( = ?auto_24679 ?auto_24696 ) ) ( not ( = ?auto_24679 ?auto_24689 ) ) ( not ( = ?auto_24683 ?auto_24687 ) ) ( not ( = ?auto_24683 ?auto_24686 ) ) ( not ( = ?auto_24683 ?auto_24688 ) ) ( not ( = ?auto_24683 ?auto_24696 ) ) ( not ( = ?auto_24683 ?auto_24689 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_24673 ?auto_24674 ?auto_24675 ?auto_24676 ?auto_24677 ?auto_24678 )
      ( MAKE-1CRATE ?auto_24678 ?auto_24679 )
      ( MAKE-6CRATE-VERIFY ?auto_24673 ?auto_24674 ?auto_24675 ?auto_24676 ?auto_24677 ?auto_24678 ?auto_24679 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_24715 - SURFACE
      ?auto_24716 - SURFACE
      ?auto_24717 - SURFACE
      ?auto_24718 - SURFACE
      ?auto_24719 - SURFACE
      ?auto_24720 - SURFACE
      ?auto_24721 - SURFACE
      ?auto_24722 - SURFACE
    )
    :vars
    (
      ?auto_24725 - HOIST
      ?auto_24724 - PLACE
      ?auto_24727 - PLACE
      ?auto_24723 - HOIST
      ?auto_24726 - SURFACE
      ?auto_24737 - PLACE
      ?auto_24739 - HOIST
      ?auto_24732 - SURFACE
      ?auto_24734 - PLACE
      ?auto_24729 - HOIST
      ?auto_24733 - SURFACE
      ?auto_24730 - SURFACE
      ?auto_24735 - SURFACE
      ?auto_24738 - PLACE
      ?auto_24731 - HOIST
      ?auto_24736 - SURFACE
      ?auto_24740 - SURFACE
      ?auto_24728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24725 ?auto_24724 ) ( IS-CRATE ?auto_24722 ) ( not ( = ?auto_24727 ?auto_24724 ) ) ( HOIST-AT ?auto_24723 ?auto_24727 ) ( SURFACE-AT ?auto_24722 ?auto_24727 ) ( ON ?auto_24722 ?auto_24726 ) ( CLEAR ?auto_24722 ) ( not ( = ?auto_24721 ?auto_24722 ) ) ( not ( = ?auto_24721 ?auto_24726 ) ) ( not ( = ?auto_24722 ?auto_24726 ) ) ( not ( = ?auto_24725 ?auto_24723 ) ) ( IS-CRATE ?auto_24721 ) ( not ( = ?auto_24737 ?auto_24724 ) ) ( HOIST-AT ?auto_24739 ?auto_24737 ) ( SURFACE-AT ?auto_24721 ?auto_24737 ) ( ON ?auto_24721 ?auto_24732 ) ( CLEAR ?auto_24721 ) ( not ( = ?auto_24720 ?auto_24721 ) ) ( not ( = ?auto_24720 ?auto_24732 ) ) ( not ( = ?auto_24721 ?auto_24732 ) ) ( not ( = ?auto_24725 ?auto_24739 ) ) ( IS-CRATE ?auto_24720 ) ( not ( = ?auto_24734 ?auto_24724 ) ) ( HOIST-AT ?auto_24729 ?auto_24734 ) ( SURFACE-AT ?auto_24720 ?auto_24734 ) ( ON ?auto_24720 ?auto_24733 ) ( CLEAR ?auto_24720 ) ( not ( = ?auto_24719 ?auto_24720 ) ) ( not ( = ?auto_24719 ?auto_24733 ) ) ( not ( = ?auto_24720 ?auto_24733 ) ) ( not ( = ?auto_24725 ?auto_24729 ) ) ( IS-CRATE ?auto_24719 ) ( AVAILABLE ?auto_24739 ) ( SURFACE-AT ?auto_24719 ?auto_24737 ) ( ON ?auto_24719 ?auto_24730 ) ( CLEAR ?auto_24719 ) ( not ( = ?auto_24718 ?auto_24719 ) ) ( not ( = ?auto_24718 ?auto_24730 ) ) ( not ( = ?auto_24719 ?auto_24730 ) ) ( IS-CRATE ?auto_24718 ) ( AVAILABLE ?auto_24723 ) ( SURFACE-AT ?auto_24718 ?auto_24727 ) ( ON ?auto_24718 ?auto_24735 ) ( CLEAR ?auto_24718 ) ( not ( = ?auto_24717 ?auto_24718 ) ) ( not ( = ?auto_24717 ?auto_24735 ) ) ( not ( = ?auto_24718 ?auto_24735 ) ) ( IS-CRATE ?auto_24717 ) ( not ( = ?auto_24738 ?auto_24724 ) ) ( HOIST-AT ?auto_24731 ?auto_24738 ) ( AVAILABLE ?auto_24731 ) ( SURFACE-AT ?auto_24717 ?auto_24738 ) ( ON ?auto_24717 ?auto_24736 ) ( CLEAR ?auto_24717 ) ( not ( = ?auto_24716 ?auto_24717 ) ) ( not ( = ?auto_24716 ?auto_24736 ) ) ( not ( = ?auto_24717 ?auto_24736 ) ) ( not ( = ?auto_24725 ?auto_24731 ) ) ( SURFACE-AT ?auto_24715 ?auto_24724 ) ( CLEAR ?auto_24715 ) ( IS-CRATE ?auto_24716 ) ( AVAILABLE ?auto_24725 ) ( AVAILABLE ?auto_24729 ) ( SURFACE-AT ?auto_24716 ?auto_24734 ) ( ON ?auto_24716 ?auto_24740 ) ( CLEAR ?auto_24716 ) ( TRUCK-AT ?auto_24728 ?auto_24724 ) ( not ( = ?auto_24715 ?auto_24716 ) ) ( not ( = ?auto_24715 ?auto_24740 ) ) ( not ( = ?auto_24716 ?auto_24740 ) ) ( not ( = ?auto_24715 ?auto_24717 ) ) ( not ( = ?auto_24715 ?auto_24736 ) ) ( not ( = ?auto_24717 ?auto_24740 ) ) ( not ( = ?auto_24738 ?auto_24734 ) ) ( not ( = ?auto_24731 ?auto_24729 ) ) ( not ( = ?auto_24736 ?auto_24740 ) ) ( not ( = ?auto_24715 ?auto_24718 ) ) ( not ( = ?auto_24715 ?auto_24735 ) ) ( not ( = ?auto_24716 ?auto_24718 ) ) ( not ( = ?auto_24716 ?auto_24735 ) ) ( not ( = ?auto_24718 ?auto_24736 ) ) ( not ( = ?auto_24718 ?auto_24740 ) ) ( not ( = ?auto_24727 ?auto_24738 ) ) ( not ( = ?auto_24727 ?auto_24734 ) ) ( not ( = ?auto_24723 ?auto_24731 ) ) ( not ( = ?auto_24723 ?auto_24729 ) ) ( not ( = ?auto_24735 ?auto_24736 ) ) ( not ( = ?auto_24735 ?auto_24740 ) ) ( not ( = ?auto_24715 ?auto_24719 ) ) ( not ( = ?auto_24715 ?auto_24730 ) ) ( not ( = ?auto_24716 ?auto_24719 ) ) ( not ( = ?auto_24716 ?auto_24730 ) ) ( not ( = ?auto_24717 ?auto_24719 ) ) ( not ( = ?auto_24717 ?auto_24730 ) ) ( not ( = ?auto_24719 ?auto_24735 ) ) ( not ( = ?auto_24719 ?auto_24736 ) ) ( not ( = ?auto_24719 ?auto_24740 ) ) ( not ( = ?auto_24737 ?auto_24727 ) ) ( not ( = ?auto_24737 ?auto_24738 ) ) ( not ( = ?auto_24737 ?auto_24734 ) ) ( not ( = ?auto_24739 ?auto_24723 ) ) ( not ( = ?auto_24739 ?auto_24731 ) ) ( not ( = ?auto_24739 ?auto_24729 ) ) ( not ( = ?auto_24730 ?auto_24735 ) ) ( not ( = ?auto_24730 ?auto_24736 ) ) ( not ( = ?auto_24730 ?auto_24740 ) ) ( not ( = ?auto_24715 ?auto_24720 ) ) ( not ( = ?auto_24715 ?auto_24733 ) ) ( not ( = ?auto_24716 ?auto_24720 ) ) ( not ( = ?auto_24716 ?auto_24733 ) ) ( not ( = ?auto_24717 ?auto_24720 ) ) ( not ( = ?auto_24717 ?auto_24733 ) ) ( not ( = ?auto_24718 ?auto_24720 ) ) ( not ( = ?auto_24718 ?auto_24733 ) ) ( not ( = ?auto_24720 ?auto_24730 ) ) ( not ( = ?auto_24720 ?auto_24735 ) ) ( not ( = ?auto_24720 ?auto_24736 ) ) ( not ( = ?auto_24720 ?auto_24740 ) ) ( not ( = ?auto_24733 ?auto_24730 ) ) ( not ( = ?auto_24733 ?auto_24735 ) ) ( not ( = ?auto_24733 ?auto_24736 ) ) ( not ( = ?auto_24733 ?auto_24740 ) ) ( not ( = ?auto_24715 ?auto_24721 ) ) ( not ( = ?auto_24715 ?auto_24732 ) ) ( not ( = ?auto_24716 ?auto_24721 ) ) ( not ( = ?auto_24716 ?auto_24732 ) ) ( not ( = ?auto_24717 ?auto_24721 ) ) ( not ( = ?auto_24717 ?auto_24732 ) ) ( not ( = ?auto_24718 ?auto_24721 ) ) ( not ( = ?auto_24718 ?auto_24732 ) ) ( not ( = ?auto_24719 ?auto_24721 ) ) ( not ( = ?auto_24719 ?auto_24732 ) ) ( not ( = ?auto_24721 ?auto_24733 ) ) ( not ( = ?auto_24721 ?auto_24730 ) ) ( not ( = ?auto_24721 ?auto_24735 ) ) ( not ( = ?auto_24721 ?auto_24736 ) ) ( not ( = ?auto_24721 ?auto_24740 ) ) ( not ( = ?auto_24732 ?auto_24733 ) ) ( not ( = ?auto_24732 ?auto_24730 ) ) ( not ( = ?auto_24732 ?auto_24735 ) ) ( not ( = ?auto_24732 ?auto_24736 ) ) ( not ( = ?auto_24732 ?auto_24740 ) ) ( not ( = ?auto_24715 ?auto_24722 ) ) ( not ( = ?auto_24715 ?auto_24726 ) ) ( not ( = ?auto_24716 ?auto_24722 ) ) ( not ( = ?auto_24716 ?auto_24726 ) ) ( not ( = ?auto_24717 ?auto_24722 ) ) ( not ( = ?auto_24717 ?auto_24726 ) ) ( not ( = ?auto_24718 ?auto_24722 ) ) ( not ( = ?auto_24718 ?auto_24726 ) ) ( not ( = ?auto_24719 ?auto_24722 ) ) ( not ( = ?auto_24719 ?auto_24726 ) ) ( not ( = ?auto_24720 ?auto_24722 ) ) ( not ( = ?auto_24720 ?auto_24726 ) ) ( not ( = ?auto_24722 ?auto_24732 ) ) ( not ( = ?auto_24722 ?auto_24733 ) ) ( not ( = ?auto_24722 ?auto_24730 ) ) ( not ( = ?auto_24722 ?auto_24735 ) ) ( not ( = ?auto_24722 ?auto_24736 ) ) ( not ( = ?auto_24722 ?auto_24740 ) ) ( not ( = ?auto_24726 ?auto_24732 ) ) ( not ( = ?auto_24726 ?auto_24733 ) ) ( not ( = ?auto_24726 ?auto_24730 ) ) ( not ( = ?auto_24726 ?auto_24735 ) ) ( not ( = ?auto_24726 ?auto_24736 ) ) ( not ( = ?auto_24726 ?auto_24740 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_24715 ?auto_24716 ?auto_24717 ?auto_24718 ?auto_24719 ?auto_24720 ?auto_24721 )
      ( MAKE-1CRATE ?auto_24721 ?auto_24722 )
      ( MAKE-7CRATE-VERIFY ?auto_24715 ?auto_24716 ?auto_24717 ?auto_24718 ?auto_24719 ?auto_24720 ?auto_24721 ?auto_24722 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_24760 - SURFACE
      ?auto_24761 - SURFACE
      ?auto_24762 - SURFACE
      ?auto_24763 - SURFACE
      ?auto_24764 - SURFACE
      ?auto_24765 - SURFACE
      ?auto_24766 - SURFACE
      ?auto_24767 - SURFACE
      ?auto_24768 - SURFACE
    )
    :vars
    (
      ?auto_24770 - HOIST
      ?auto_24769 - PLACE
      ?auto_24772 - PLACE
      ?auto_24773 - HOIST
      ?auto_24774 - SURFACE
      ?auto_24788 - PLACE
      ?auto_24777 - HOIST
      ?auto_24780 - SURFACE
      ?auto_24786 - PLACE
      ?auto_24778 - HOIST
      ?auto_24787 - SURFACE
      ?auto_24782 - PLACE
      ?auto_24775 - HOIST
      ?auto_24776 - SURFACE
      ?auto_24789 - SURFACE
      ?auto_24779 - SURFACE
      ?auto_24785 - PLACE
      ?auto_24784 - HOIST
      ?auto_24783 - SURFACE
      ?auto_24781 - SURFACE
      ?auto_24771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24770 ?auto_24769 ) ( IS-CRATE ?auto_24768 ) ( not ( = ?auto_24772 ?auto_24769 ) ) ( HOIST-AT ?auto_24773 ?auto_24772 ) ( AVAILABLE ?auto_24773 ) ( SURFACE-AT ?auto_24768 ?auto_24772 ) ( ON ?auto_24768 ?auto_24774 ) ( CLEAR ?auto_24768 ) ( not ( = ?auto_24767 ?auto_24768 ) ) ( not ( = ?auto_24767 ?auto_24774 ) ) ( not ( = ?auto_24768 ?auto_24774 ) ) ( not ( = ?auto_24770 ?auto_24773 ) ) ( IS-CRATE ?auto_24767 ) ( not ( = ?auto_24788 ?auto_24769 ) ) ( HOIST-AT ?auto_24777 ?auto_24788 ) ( SURFACE-AT ?auto_24767 ?auto_24788 ) ( ON ?auto_24767 ?auto_24780 ) ( CLEAR ?auto_24767 ) ( not ( = ?auto_24766 ?auto_24767 ) ) ( not ( = ?auto_24766 ?auto_24780 ) ) ( not ( = ?auto_24767 ?auto_24780 ) ) ( not ( = ?auto_24770 ?auto_24777 ) ) ( IS-CRATE ?auto_24766 ) ( not ( = ?auto_24786 ?auto_24769 ) ) ( HOIST-AT ?auto_24778 ?auto_24786 ) ( SURFACE-AT ?auto_24766 ?auto_24786 ) ( ON ?auto_24766 ?auto_24787 ) ( CLEAR ?auto_24766 ) ( not ( = ?auto_24765 ?auto_24766 ) ) ( not ( = ?auto_24765 ?auto_24787 ) ) ( not ( = ?auto_24766 ?auto_24787 ) ) ( not ( = ?auto_24770 ?auto_24778 ) ) ( IS-CRATE ?auto_24765 ) ( not ( = ?auto_24782 ?auto_24769 ) ) ( HOIST-AT ?auto_24775 ?auto_24782 ) ( SURFACE-AT ?auto_24765 ?auto_24782 ) ( ON ?auto_24765 ?auto_24776 ) ( CLEAR ?auto_24765 ) ( not ( = ?auto_24764 ?auto_24765 ) ) ( not ( = ?auto_24764 ?auto_24776 ) ) ( not ( = ?auto_24765 ?auto_24776 ) ) ( not ( = ?auto_24770 ?auto_24775 ) ) ( IS-CRATE ?auto_24764 ) ( AVAILABLE ?auto_24778 ) ( SURFACE-AT ?auto_24764 ?auto_24786 ) ( ON ?auto_24764 ?auto_24789 ) ( CLEAR ?auto_24764 ) ( not ( = ?auto_24763 ?auto_24764 ) ) ( not ( = ?auto_24763 ?auto_24789 ) ) ( not ( = ?auto_24764 ?auto_24789 ) ) ( IS-CRATE ?auto_24763 ) ( AVAILABLE ?auto_24777 ) ( SURFACE-AT ?auto_24763 ?auto_24788 ) ( ON ?auto_24763 ?auto_24779 ) ( CLEAR ?auto_24763 ) ( not ( = ?auto_24762 ?auto_24763 ) ) ( not ( = ?auto_24762 ?auto_24779 ) ) ( not ( = ?auto_24763 ?auto_24779 ) ) ( IS-CRATE ?auto_24762 ) ( not ( = ?auto_24785 ?auto_24769 ) ) ( HOIST-AT ?auto_24784 ?auto_24785 ) ( AVAILABLE ?auto_24784 ) ( SURFACE-AT ?auto_24762 ?auto_24785 ) ( ON ?auto_24762 ?auto_24783 ) ( CLEAR ?auto_24762 ) ( not ( = ?auto_24761 ?auto_24762 ) ) ( not ( = ?auto_24761 ?auto_24783 ) ) ( not ( = ?auto_24762 ?auto_24783 ) ) ( not ( = ?auto_24770 ?auto_24784 ) ) ( SURFACE-AT ?auto_24760 ?auto_24769 ) ( CLEAR ?auto_24760 ) ( IS-CRATE ?auto_24761 ) ( AVAILABLE ?auto_24770 ) ( AVAILABLE ?auto_24775 ) ( SURFACE-AT ?auto_24761 ?auto_24782 ) ( ON ?auto_24761 ?auto_24781 ) ( CLEAR ?auto_24761 ) ( TRUCK-AT ?auto_24771 ?auto_24769 ) ( not ( = ?auto_24760 ?auto_24761 ) ) ( not ( = ?auto_24760 ?auto_24781 ) ) ( not ( = ?auto_24761 ?auto_24781 ) ) ( not ( = ?auto_24760 ?auto_24762 ) ) ( not ( = ?auto_24760 ?auto_24783 ) ) ( not ( = ?auto_24762 ?auto_24781 ) ) ( not ( = ?auto_24785 ?auto_24782 ) ) ( not ( = ?auto_24784 ?auto_24775 ) ) ( not ( = ?auto_24783 ?auto_24781 ) ) ( not ( = ?auto_24760 ?auto_24763 ) ) ( not ( = ?auto_24760 ?auto_24779 ) ) ( not ( = ?auto_24761 ?auto_24763 ) ) ( not ( = ?auto_24761 ?auto_24779 ) ) ( not ( = ?auto_24763 ?auto_24783 ) ) ( not ( = ?auto_24763 ?auto_24781 ) ) ( not ( = ?auto_24788 ?auto_24785 ) ) ( not ( = ?auto_24788 ?auto_24782 ) ) ( not ( = ?auto_24777 ?auto_24784 ) ) ( not ( = ?auto_24777 ?auto_24775 ) ) ( not ( = ?auto_24779 ?auto_24783 ) ) ( not ( = ?auto_24779 ?auto_24781 ) ) ( not ( = ?auto_24760 ?auto_24764 ) ) ( not ( = ?auto_24760 ?auto_24789 ) ) ( not ( = ?auto_24761 ?auto_24764 ) ) ( not ( = ?auto_24761 ?auto_24789 ) ) ( not ( = ?auto_24762 ?auto_24764 ) ) ( not ( = ?auto_24762 ?auto_24789 ) ) ( not ( = ?auto_24764 ?auto_24779 ) ) ( not ( = ?auto_24764 ?auto_24783 ) ) ( not ( = ?auto_24764 ?auto_24781 ) ) ( not ( = ?auto_24786 ?auto_24788 ) ) ( not ( = ?auto_24786 ?auto_24785 ) ) ( not ( = ?auto_24786 ?auto_24782 ) ) ( not ( = ?auto_24778 ?auto_24777 ) ) ( not ( = ?auto_24778 ?auto_24784 ) ) ( not ( = ?auto_24778 ?auto_24775 ) ) ( not ( = ?auto_24789 ?auto_24779 ) ) ( not ( = ?auto_24789 ?auto_24783 ) ) ( not ( = ?auto_24789 ?auto_24781 ) ) ( not ( = ?auto_24760 ?auto_24765 ) ) ( not ( = ?auto_24760 ?auto_24776 ) ) ( not ( = ?auto_24761 ?auto_24765 ) ) ( not ( = ?auto_24761 ?auto_24776 ) ) ( not ( = ?auto_24762 ?auto_24765 ) ) ( not ( = ?auto_24762 ?auto_24776 ) ) ( not ( = ?auto_24763 ?auto_24765 ) ) ( not ( = ?auto_24763 ?auto_24776 ) ) ( not ( = ?auto_24765 ?auto_24789 ) ) ( not ( = ?auto_24765 ?auto_24779 ) ) ( not ( = ?auto_24765 ?auto_24783 ) ) ( not ( = ?auto_24765 ?auto_24781 ) ) ( not ( = ?auto_24776 ?auto_24789 ) ) ( not ( = ?auto_24776 ?auto_24779 ) ) ( not ( = ?auto_24776 ?auto_24783 ) ) ( not ( = ?auto_24776 ?auto_24781 ) ) ( not ( = ?auto_24760 ?auto_24766 ) ) ( not ( = ?auto_24760 ?auto_24787 ) ) ( not ( = ?auto_24761 ?auto_24766 ) ) ( not ( = ?auto_24761 ?auto_24787 ) ) ( not ( = ?auto_24762 ?auto_24766 ) ) ( not ( = ?auto_24762 ?auto_24787 ) ) ( not ( = ?auto_24763 ?auto_24766 ) ) ( not ( = ?auto_24763 ?auto_24787 ) ) ( not ( = ?auto_24764 ?auto_24766 ) ) ( not ( = ?auto_24764 ?auto_24787 ) ) ( not ( = ?auto_24766 ?auto_24776 ) ) ( not ( = ?auto_24766 ?auto_24789 ) ) ( not ( = ?auto_24766 ?auto_24779 ) ) ( not ( = ?auto_24766 ?auto_24783 ) ) ( not ( = ?auto_24766 ?auto_24781 ) ) ( not ( = ?auto_24787 ?auto_24776 ) ) ( not ( = ?auto_24787 ?auto_24789 ) ) ( not ( = ?auto_24787 ?auto_24779 ) ) ( not ( = ?auto_24787 ?auto_24783 ) ) ( not ( = ?auto_24787 ?auto_24781 ) ) ( not ( = ?auto_24760 ?auto_24767 ) ) ( not ( = ?auto_24760 ?auto_24780 ) ) ( not ( = ?auto_24761 ?auto_24767 ) ) ( not ( = ?auto_24761 ?auto_24780 ) ) ( not ( = ?auto_24762 ?auto_24767 ) ) ( not ( = ?auto_24762 ?auto_24780 ) ) ( not ( = ?auto_24763 ?auto_24767 ) ) ( not ( = ?auto_24763 ?auto_24780 ) ) ( not ( = ?auto_24764 ?auto_24767 ) ) ( not ( = ?auto_24764 ?auto_24780 ) ) ( not ( = ?auto_24765 ?auto_24767 ) ) ( not ( = ?auto_24765 ?auto_24780 ) ) ( not ( = ?auto_24767 ?auto_24787 ) ) ( not ( = ?auto_24767 ?auto_24776 ) ) ( not ( = ?auto_24767 ?auto_24789 ) ) ( not ( = ?auto_24767 ?auto_24779 ) ) ( not ( = ?auto_24767 ?auto_24783 ) ) ( not ( = ?auto_24767 ?auto_24781 ) ) ( not ( = ?auto_24780 ?auto_24787 ) ) ( not ( = ?auto_24780 ?auto_24776 ) ) ( not ( = ?auto_24780 ?auto_24789 ) ) ( not ( = ?auto_24780 ?auto_24779 ) ) ( not ( = ?auto_24780 ?auto_24783 ) ) ( not ( = ?auto_24780 ?auto_24781 ) ) ( not ( = ?auto_24760 ?auto_24768 ) ) ( not ( = ?auto_24760 ?auto_24774 ) ) ( not ( = ?auto_24761 ?auto_24768 ) ) ( not ( = ?auto_24761 ?auto_24774 ) ) ( not ( = ?auto_24762 ?auto_24768 ) ) ( not ( = ?auto_24762 ?auto_24774 ) ) ( not ( = ?auto_24763 ?auto_24768 ) ) ( not ( = ?auto_24763 ?auto_24774 ) ) ( not ( = ?auto_24764 ?auto_24768 ) ) ( not ( = ?auto_24764 ?auto_24774 ) ) ( not ( = ?auto_24765 ?auto_24768 ) ) ( not ( = ?auto_24765 ?auto_24774 ) ) ( not ( = ?auto_24766 ?auto_24768 ) ) ( not ( = ?auto_24766 ?auto_24774 ) ) ( not ( = ?auto_24768 ?auto_24780 ) ) ( not ( = ?auto_24768 ?auto_24787 ) ) ( not ( = ?auto_24768 ?auto_24776 ) ) ( not ( = ?auto_24768 ?auto_24789 ) ) ( not ( = ?auto_24768 ?auto_24779 ) ) ( not ( = ?auto_24768 ?auto_24783 ) ) ( not ( = ?auto_24768 ?auto_24781 ) ) ( not ( = ?auto_24772 ?auto_24788 ) ) ( not ( = ?auto_24772 ?auto_24786 ) ) ( not ( = ?auto_24772 ?auto_24782 ) ) ( not ( = ?auto_24772 ?auto_24785 ) ) ( not ( = ?auto_24773 ?auto_24777 ) ) ( not ( = ?auto_24773 ?auto_24778 ) ) ( not ( = ?auto_24773 ?auto_24775 ) ) ( not ( = ?auto_24773 ?auto_24784 ) ) ( not ( = ?auto_24774 ?auto_24780 ) ) ( not ( = ?auto_24774 ?auto_24787 ) ) ( not ( = ?auto_24774 ?auto_24776 ) ) ( not ( = ?auto_24774 ?auto_24789 ) ) ( not ( = ?auto_24774 ?auto_24779 ) ) ( not ( = ?auto_24774 ?auto_24783 ) ) ( not ( = ?auto_24774 ?auto_24781 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_24760 ?auto_24761 ?auto_24762 ?auto_24763 ?auto_24764 ?auto_24765 ?auto_24766 ?auto_24767 )
      ( MAKE-1CRATE ?auto_24767 ?auto_24768 )
      ( MAKE-8CRATE-VERIFY ?auto_24760 ?auto_24761 ?auto_24762 ?auto_24763 ?auto_24764 ?auto_24765 ?auto_24766 ?auto_24767 ?auto_24768 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_24810 - SURFACE
      ?auto_24811 - SURFACE
      ?auto_24812 - SURFACE
      ?auto_24813 - SURFACE
      ?auto_24814 - SURFACE
      ?auto_24815 - SURFACE
      ?auto_24816 - SURFACE
      ?auto_24817 - SURFACE
      ?auto_24818 - SURFACE
      ?auto_24819 - SURFACE
    )
    :vars
    (
      ?auto_24824 - HOIST
      ?auto_24825 - PLACE
      ?auto_24821 - PLACE
      ?auto_24822 - HOIST
      ?auto_24820 - SURFACE
      ?auto_24839 - PLACE
      ?auto_24831 - HOIST
      ?auto_24837 - SURFACE
      ?auto_24830 - PLACE
      ?auto_24827 - HOIST
      ?auto_24835 - SURFACE
      ?auto_24836 - PLACE
      ?auto_24838 - HOIST
      ?auto_24828 - SURFACE
      ?auto_24826 - PLACE
      ?auto_24832 - HOIST
      ?auto_24829 - SURFACE
      ?auto_24842 - SURFACE
      ?auto_24834 - SURFACE
      ?auto_24843 - PLACE
      ?auto_24840 - HOIST
      ?auto_24833 - SURFACE
      ?auto_24841 - SURFACE
      ?auto_24823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24824 ?auto_24825 ) ( IS-CRATE ?auto_24819 ) ( not ( = ?auto_24821 ?auto_24825 ) ) ( HOIST-AT ?auto_24822 ?auto_24821 ) ( AVAILABLE ?auto_24822 ) ( SURFACE-AT ?auto_24819 ?auto_24821 ) ( ON ?auto_24819 ?auto_24820 ) ( CLEAR ?auto_24819 ) ( not ( = ?auto_24818 ?auto_24819 ) ) ( not ( = ?auto_24818 ?auto_24820 ) ) ( not ( = ?auto_24819 ?auto_24820 ) ) ( not ( = ?auto_24824 ?auto_24822 ) ) ( IS-CRATE ?auto_24818 ) ( not ( = ?auto_24839 ?auto_24825 ) ) ( HOIST-AT ?auto_24831 ?auto_24839 ) ( AVAILABLE ?auto_24831 ) ( SURFACE-AT ?auto_24818 ?auto_24839 ) ( ON ?auto_24818 ?auto_24837 ) ( CLEAR ?auto_24818 ) ( not ( = ?auto_24817 ?auto_24818 ) ) ( not ( = ?auto_24817 ?auto_24837 ) ) ( not ( = ?auto_24818 ?auto_24837 ) ) ( not ( = ?auto_24824 ?auto_24831 ) ) ( IS-CRATE ?auto_24817 ) ( not ( = ?auto_24830 ?auto_24825 ) ) ( HOIST-AT ?auto_24827 ?auto_24830 ) ( SURFACE-AT ?auto_24817 ?auto_24830 ) ( ON ?auto_24817 ?auto_24835 ) ( CLEAR ?auto_24817 ) ( not ( = ?auto_24816 ?auto_24817 ) ) ( not ( = ?auto_24816 ?auto_24835 ) ) ( not ( = ?auto_24817 ?auto_24835 ) ) ( not ( = ?auto_24824 ?auto_24827 ) ) ( IS-CRATE ?auto_24816 ) ( not ( = ?auto_24836 ?auto_24825 ) ) ( HOIST-AT ?auto_24838 ?auto_24836 ) ( SURFACE-AT ?auto_24816 ?auto_24836 ) ( ON ?auto_24816 ?auto_24828 ) ( CLEAR ?auto_24816 ) ( not ( = ?auto_24815 ?auto_24816 ) ) ( not ( = ?auto_24815 ?auto_24828 ) ) ( not ( = ?auto_24816 ?auto_24828 ) ) ( not ( = ?auto_24824 ?auto_24838 ) ) ( IS-CRATE ?auto_24815 ) ( not ( = ?auto_24826 ?auto_24825 ) ) ( HOIST-AT ?auto_24832 ?auto_24826 ) ( SURFACE-AT ?auto_24815 ?auto_24826 ) ( ON ?auto_24815 ?auto_24829 ) ( CLEAR ?auto_24815 ) ( not ( = ?auto_24814 ?auto_24815 ) ) ( not ( = ?auto_24814 ?auto_24829 ) ) ( not ( = ?auto_24815 ?auto_24829 ) ) ( not ( = ?auto_24824 ?auto_24832 ) ) ( IS-CRATE ?auto_24814 ) ( AVAILABLE ?auto_24838 ) ( SURFACE-AT ?auto_24814 ?auto_24836 ) ( ON ?auto_24814 ?auto_24842 ) ( CLEAR ?auto_24814 ) ( not ( = ?auto_24813 ?auto_24814 ) ) ( not ( = ?auto_24813 ?auto_24842 ) ) ( not ( = ?auto_24814 ?auto_24842 ) ) ( IS-CRATE ?auto_24813 ) ( AVAILABLE ?auto_24827 ) ( SURFACE-AT ?auto_24813 ?auto_24830 ) ( ON ?auto_24813 ?auto_24834 ) ( CLEAR ?auto_24813 ) ( not ( = ?auto_24812 ?auto_24813 ) ) ( not ( = ?auto_24812 ?auto_24834 ) ) ( not ( = ?auto_24813 ?auto_24834 ) ) ( IS-CRATE ?auto_24812 ) ( not ( = ?auto_24843 ?auto_24825 ) ) ( HOIST-AT ?auto_24840 ?auto_24843 ) ( AVAILABLE ?auto_24840 ) ( SURFACE-AT ?auto_24812 ?auto_24843 ) ( ON ?auto_24812 ?auto_24833 ) ( CLEAR ?auto_24812 ) ( not ( = ?auto_24811 ?auto_24812 ) ) ( not ( = ?auto_24811 ?auto_24833 ) ) ( not ( = ?auto_24812 ?auto_24833 ) ) ( not ( = ?auto_24824 ?auto_24840 ) ) ( SURFACE-AT ?auto_24810 ?auto_24825 ) ( CLEAR ?auto_24810 ) ( IS-CRATE ?auto_24811 ) ( AVAILABLE ?auto_24824 ) ( AVAILABLE ?auto_24832 ) ( SURFACE-AT ?auto_24811 ?auto_24826 ) ( ON ?auto_24811 ?auto_24841 ) ( CLEAR ?auto_24811 ) ( TRUCK-AT ?auto_24823 ?auto_24825 ) ( not ( = ?auto_24810 ?auto_24811 ) ) ( not ( = ?auto_24810 ?auto_24841 ) ) ( not ( = ?auto_24811 ?auto_24841 ) ) ( not ( = ?auto_24810 ?auto_24812 ) ) ( not ( = ?auto_24810 ?auto_24833 ) ) ( not ( = ?auto_24812 ?auto_24841 ) ) ( not ( = ?auto_24843 ?auto_24826 ) ) ( not ( = ?auto_24840 ?auto_24832 ) ) ( not ( = ?auto_24833 ?auto_24841 ) ) ( not ( = ?auto_24810 ?auto_24813 ) ) ( not ( = ?auto_24810 ?auto_24834 ) ) ( not ( = ?auto_24811 ?auto_24813 ) ) ( not ( = ?auto_24811 ?auto_24834 ) ) ( not ( = ?auto_24813 ?auto_24833 ) ) ( not ( = ?auto_24813 ?auto_24841 ) ) ( not ( = ?auto_24830 ?auto_24843 ) ) ( not ( = ?auto_24830 ?auto_24826 ) ) ( not ( = ?auto_24827 ?auto_24840 ) ) ( not ( = ?auto_24827 ?auto_24832 ) ) ( not ( = ?auto_24834 ?auto_24833 ) ) ( not ( = ?auto_24834 ?auto_24841 ) ) ( not ( = ?auto_24810 ?auto_24814 ) ) ( not ( = ?auto_24810 ?auto_24842 ) ) ( not ( = ?auto_24811 ?auto_24814 ) ) ( not ( = ?auto_24811 ?auto_24842 ) ) ( not ( = ?auto_24812 ?auto_24814 ) ) ( not ( = ?auto_24812 ?auto_24842 ) ) ( not ( = ?auto_24814 ?auto_24834 ) ) ( not ( = ?auto_24814 ?auto_24833 ) ) ( not ( = ?auto_24814 ?auto_24841 ) ) ( not ( = ?auto_24836 ?auto_24830 ) ) ( not ( = ?auto_24836 ?auto_24843 ) ) ( not ( = ?auto_24836 ?auto_24826 ) ) ( not ( = ?auto_24838 ?auto_24827 ) ) ( not ( = ?auto_24838 ?auto_24840 ) ) ( not ( = ?auto_24838 ?auto_24832 ) ) ( not ( = ?auto_24842 ?auto_24834 ) ) ( not ( = ?auto_24842 ?auto_24833 ) ) ( not ( = ?auto_24842 ?auto_24841 ) ) ( not ( = ?auto_24810 ?auto_24815 ) ) ( not ( = ?auto_24810 ?auto_24829 ) ) ( not ( = ?auto_24811 ?auto_24815 ) ) ( not ( = ?auto_24811 ?auto_24829 ) ) ( not ( = ?auto_24812 ?auto_24815 ) ) ( not ( = ?auto_24812 ?auto_24829 ) ) ( not ( = ?auto_24813 ?auto_24815 ) ) ( not ( = ?auto_24813 ?auto_24829 ) ) ( not ( = ?auto_24815 ?auto_24842 ) ) ( not ( = ?auto_24815 ?auto_24834 ) ) ( not ( = ?auto_24815 ?auto_24833 ) ) ( not ( = ?auto_24815 ?auto_24841 ) ) ( not ( = ?auto_24829 ?auto_24842 ) ) ( not ( = ?auto_24829 ?auto_24834 ) ) ( not ( = ?auto_24829 ?auto_24833 ) ) ( not ( = ?auto_24829 ?auto_24841 ) ) ( not ( = ?auto_24810 ?auto_24816 ) ) ( not ( = ?auto_24810 ?auto_24828 ) ) ( not ( = ?auto_24811 ?auto_24816 ) ) ( not ( = ?auto_24811 ?auto_24828 ) ) ( not ( = ?auto_24812 ?auto_24816 ) ) ( not ( = ?auto_24812 ?auto_24828 ) ) ( not ( = ?auto_24813 ?auto_24816 ) ) ( not ( = ?auto_24813 ?auto_24828 ) ) ( not ( = ?auto_24814 ?auto_24816 ) ) ( not ( = ?auto_24814 ?auto_24828 ) ) ( not ( = ?auto_24816 ?auto_24829 ) ) ( not ( = ?auto_24816 ?auto_24842 ) ) ( not ( = ?auto_24816 ?auto_24834 ) ) ( not ( = ?auto_24816 ?auto_24833 ) ) ( not ( = ?auto_24816 ?auto_24841 ) ) ( not ( = ?auto_24828 ?auto_24829 ) ) ( not ( = ?auto_24828 ?auto_24842 ) ) ( not ( = ?auto_24828 ?auto_24834 ) ) ( not ( = ?auto_24828 ?auto_24833 ) ) ( not ( = ?auto_24828 ?auto_24841 ) ) ( not ( = ?auto_24810 ?auto_24817 ) ) ( not ( = ?auto_24810 ?auto_24835 ) ) ( not ( = ?auto_24811 ?auto_24817 ) ) ( not ( = ?auto_24811 ?auto_24835 ) ) ( not ( = ?auto_24812 ?auto_24817 ) ) ( not ( = ?auto_24812 ?auto_24835 ) ) ( not ( = ?auto_24813 ?auto_24817 ) ) ( not ( = ?auto_24813 ?auto_24835 ) ) ( not ( = ?auto_24814 ?auto_24817 ) ) ( not ( = ?auto_24814 ?auto_24835 ) ) ( not ( = ?auto_24815 ?auto_24817 ) ) ( not ( = ?auto_24815 ?auto_24835 ) ) ( not ( = ?auto_24817 ?auto_24828 ) ) ( not ( = ?auto_24817 ?auto_24829 ) ) ( not ( = ?auto_24817 ?auto_24842 ) ) ( not ( = ?auto_24817 ?auto_24834 ) ) ( not ( = ?auto_24817 ?auto_24833 ) ) ( not ( = ?auto_24817 ?auto_24841 ) ) ( not ( = ?auto_24835 ?auto_24828 ) ) ( not ( = ?auto_24835 ?auto_24829 ) ) ( not ( = ?auto_24835 ?auto_24842 ) ) ( not ( = ?auto_24835 ?auto_24834 ) ) ( not ( = ?auto_24835 ?auto_24833 ) ) ( not ( = ?auto_24835 ?auto_24841 ) ) ( not ( = ?auto_24810 ?auto_24818 ) ) ( not ( = ?auto_24810 ?auto_24837 ) ) ( not ( = ?auto_24811 ?auto_24818 ) ) ( not ( = ?auto_24811 ?auto_24837 ) ) ( not ( = ?auto_24812 ?auto_24818 ) ) ( not ( = ?auto_24812 ?auto_24837 ) ) ( not ( = ?auto_24813 ?auto_24818 ) ) ( not ( = ?auto_24813 ?auto_24837 ) ) ( not ( = ?auto_24814 ?auto_24818 ) ) ( not ( = ?auto_24814 ?auto_24837 ) ) ( not ( = ?auto_24815 ?auto_24818 ) ) ( not ( = ?auto_24815 ?auto_24837 ) ) ( not ( = ?auto_24816 ?auto_24818 ) ) ( not ( = ?auto_24816 ?auto_24837 ) ) ( not ( = ?auto_24818 ?auto_24835 ) ) ( not ( = ?auto_24818 ?auto_24828 ) ) ( not ( = ?auto_24818 ?auto_24829 ) ) ( not ( = ?auto_24818 ?auto_24842 ) ) ( not ( = ?auto_24818 ?auto_24834 ) ) ( not ( = ?auto_24818 ?auto_24833 ) ) ( not ( = ?auto_24818 ?auto_24841 ) ) ( not ( = ?auto_24839 ?auto_24830 ) ) ( not ( = ?auto_24839 ?auto_24836 ) ) ( not ( = ?auto_24839 ?auto_24826 ) ) ( not ( = ?auto_24839 ?auto_24843 ) ) ( not ( = ?auto_24831 ?auto_24827 ) ) ( not ( = ?auto_24831 ?auto_24838 ) ) ( not ( = ?auto_24831 ?auto_24832 ) ) ( not ( = ?auto_24831 ?auto_24840 ) ) ( not ( = ?auto_24837 ?auto_24835 ) ) ( not ( = ?auto_24837 ?auto_24828 ) ) ( not ( = ?auto_24837 ?auto_24829 ) ) ( not ( = ?auto_24837 ?auto_24842 ) ) ( not ( = ?auto_24837 ?auto_24834 ) ) ( not ( = ?auto_24837 ?auto_24833 ) ) ( not ( = ?auto_24837 ?auto_24841 ) ) ( not ( = ?auto_24810 ?auto_24819 ) ) ( not ( = ?auto_24810 ?auto_24820 ) ) ( not ( = ?auto_24811 ?auto_24819 ) ) ( not ( = ?auto_24811 ?auto_24820 ) ) ( not ( = ?auto_24812 ?auto_24819 ) ) ( not ( = ?auto_24812 ?auto_24820 ) ) ( not ( = ?auto_24813 ?auto_24819 ) ) ( not ( = ?auto_24813 ?auto_24820 ) ) ( not ( = ?auto_24814 ?auto_24819 ) ) ( not ( = ?auto_24814 ?auto_24820 ) ) ( not ( = ?auto_24815 ?auto_24819 ) ) ( not ( = ?auto_24815 ?auto_24820 ) ) ( not ( = ?auto_24816 ?auto_24819 ) ) ( not ( = ?auto_24816 ?auto_24820 ) ) ( not ( = ?auto_24817 ?auto_24819 ) ) ( not ( = ?auto_24817 ?auto_24820 ) ) ( not ( = ?auto_24819 ?auto_24837 ) ) ( not ( = ?auto_24819 ?auto_24835 ) ) ( not ( = ?auto_24819 ?auto_24828 ) ) ( not ( = ?auto_24819 ?auto_24829 ) ) ( not ( = ?auto_24819 ?auto_24842 ) ) ( not ( = ?auto_24819 ?auto_24834 ) ) ( not ( = ?auto_24819 ?auto_24833 ) ) ( not ( = ?auto_24819 ?auto_24841 ) ) ( not ( = ?auto_24821 ?auto_24839 ) ) ( not ( = ?auto_24821 ?auto_24830 ) ) ( not ( = ?auto_24821 ?auto_24836 ) ) ( not ( = ?auto_24821 ?auto_24826 ) ) ( not ( = ?auto_24821 ?auto_24843 ) ) ( not ( = ?auto_24822 ?auto_24831 ) ) ( not ( = ?auto_24822 ?auto_24827 ) ) ( not ( = ?auto_24822 ?auto_24838 ) ) ( not ( = ?auto_24822 ?auto_24832 ) ) ( not ( = ?auto_24822 ?auto_24840 ) ) ( not ( = ?auto_24820 ?auto_24837 ) ) ( not ( = ?auto_24820 ?auto_24835 ) ) ( not ( = ?auto_24820 ?auto_24828 ) ) ( not ( = ?auto_24820 ?auto_24829 ) ) ( not ( = ?auto_24820 ?auto_24842 ) ) ( not ( = ?auto_24820 ?auto_24834 ) ) ( not ( = ?auto_24820 ?auto_24833 ) ) ( not ( = ?auto_24820 ?auto_24841 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_24810 ?auto_24811 ?auto_24812 ?auto_24813 ?auto_24814 ?auto_24815 ?auto_24816 ?auto_24817 ?auto_24818 )
      ( MAKE-1CRATE ?auto_24818 ?auto_24819 )
      ( MAKE-9CRATE-VERIFY ?auto_24810 ?auto_24811 ?auto_24812 ?auto_24813 ?auto_24814 ?auto_24815 ?auto_24816 ?auto_24817 ?auto_24818 ?auto_24819 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_24865 - SURFACE
      ?auto_24866 - SURFACE
      ?auto_24867 - SURFACE
      ?auto_24868 - SURFACE
      ?auto_24869 - SURFACE
      ?auto_24870 - SURFACE
      ?auto_24871 - SURFACE
      ?auto_24872 - SURFACE
      ?auto_24873 - SURFACE
      ?auto_24874 - SURFACE
      ?auto_24875 - SURFACE
    )
    :vars
    (
      ?auto_24877 - HOIST
      ?auto_24879 - PLACE
      ?auto_24878 - PLACE
      ?auto_24881 - HOIST
      ?auto_24876 - SURFACE
      ?auto_24895 - PLACE
      ?auto_24882 - HOIST
      ?auto_24887 - SURFACE
      ?auto_24892 - PLACE
      ?auto_24898 - HOIST
      ?auto_24894 - SURFACE
      ?auto_24900 - PLACE
      ?auto_24897 - HOIST
      ?auto_24891 - SURFACE
      ?auto_24883 - PLACE
      ?auto_24886 - HOIST
      ?auto_24884 - SURFACE
      ?auto_24896 - PLACE
      ?auto_24889 - HOIST
      ?auto_24885 - SURFACE
      ?auto_24890 - SURFACE
      ?auto_24888 - SURFACE
      ?auto_24899 - SURFACE
      ?auto_24893 - SURFACE
      ?auto_24880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24877 ?auto_24879 ) ( IS-CRATE ?auto_24875 ) ( not ( = ?auto_24878 ?auto_24879 ) ) ( HOIST-AT ?auto_24881 ?auto_24878 ) ( SURFACE-AT ?auto_24875 ?auto_24878 ) ( ON ?auto_24875 ?auto_24876 ) ( CLEAR ?auto_24875 ) ( not ( = ?auto_24874 ?auto_24875 ) ) ( not ( = ?auto_24874 ?auto_24876 ) ) ( not ( = ?auto_24875 ?auto_24876 ) ) ( not ( = ?auto_24877 ?auto_24881 ) ) ( IS-CRATE ?auto_24874 ) ( not ( = ?auto_24895 ?auto_24879 ) ) ( HOIST-AT ?auto_24882 ?auto_24895 ) ( AVAILABLE ?auto_24882 ) ( SURFACE-AT ?auto_24874 ?auto_24895 ) ( ON ?auto_24874 ?auto_24887 ) ( CLEAR ?auto_24874 ) ( not ( = ?auto_24873 ?auto_24874 ) ) ( not ( = ?auto_24873 ?auto_24887 ) ) ( not ( = ?auto_24874 ?auto_24887 ) ) ( not ( = ?auto_24877 ?auto_24882 ) ) ( IS-CRATE ?auto_24873 ) ( not ( = ?auto_24892 ?auto_24879 ) ) ( HOIST-AT ?auto_24898 ?auto_24892 ) ( AVAILABLE ?auto_24898 ) ( SURFACE-AT ?auto_24873 ?auto_24892 ) ( ON ?auto_24873 ?auto_24894 ) ( CLEAR ?auto_24873 ) ( not ( = ?auto_24872 ?auto_24873 ) ) ( not ( = ?auto_24872 ?auto_24894 ) ) ( not ( = ?auto_24873 ?auto_24894 ) ) ( not ( = ?auto_24877 ?auto_24898 ) ) ( IS-CRATE ?auto_24872 ) ( not ( = ?auto_24900 ?auto_24879 ) ) ( HOIST-AT ?auto_24897 ?auto_24900 ) ( SURFACE-AT ?auto_24872 ?auto_24900 ) ( ON ?auto_24872 ?auto_24891 ) ( CLEAR ?auto_24872 ) ( not ( = ?auto_24871 ?auto_24872 ) ) ( not ( = ?auto_24871 ?auto_24891 ) ) ( not ( = ?auto_24872 ?auto_24891 ) ) ( not ( = ?auto_24877 ?auto_24897 ) ) ( IS-CRATE ?auto_24871 ) ( not ( = ?auto_24883 ?auto_24879 ) ) ( HOIST-AT ?auto_24886 ?auto_24883 ) ( SURFACE-AT ?auto_24871 ?auto_24883 ) ( ON ?auto_24871 ?auto_24884 ) ( CLEAR ?auto_24871 ) ( not ( = ?auto_24870 ?auto_24871 ) ) ( not ( = ?auto_24870 ?auto_24884 ) ) ( not ( = ?auto_24871 ?auto_24884 ) ) ( not ( = ?auto_24877 ?auto_24886 ) ) ( IS-CRATE ?auto_24870 ) ( not ( = ?auto_24896 ?auto_24879 ) ) ( HOIST-AT ?auto_24889 ?auto_24896 ) ( SURFACE-AT ?auto_24870 ?auto_24896 ) ( ON ?auto_24870 ?auto_24885 ) ( CLEAR ?auto_24870 ) ( not ( = ?auto_24869 ?auto_24870 ) ) ( not ( = ?auto_24869 ?auto_24885 ) ) ( not ( = ?auto_24870 ?auto_24885 ) ) ( not ( = ?auto_24877 ?auto_24889 ) ) ( IS-CRATE ?auto_24869 ) ( AVAILABLE ?auto_24886 ) ( SURFACE-AT ?auto_24869 ?auto_24883 ) ( ON ?auto_24869 ?auto_24890 ) ( CLEAR ?auto_24869 ) ( not ( = ?auto_24868 ?auto_24869 ) ) ( not ( = ?auto_24868 ?auto_24890 ) ) ( not ( = ?auto_24869 ?auto_24890 ) ) ( IS-CRATE ?auto_24868 ) ( AVAILABLE ?auto_24897 ) ( SURFACE-AT ?auto_24868 ?auto_24900 ) ( ON ?auto_24868 ?auto_24888 ) ( CLEAR ?auto_24868 ) ( not ( = ?auto_24867 ?auto_24868 ) ) ( not ( = ?auto_24867 ?auto_24888 ) ) ( not ( = ?auto_24868 ?auto_24888 ) ) ( IS-CRATE ?auto_24867 ) ( AVAILABLE ?auto_24881 ) ( SURFACE-AT ?auto_24867 ?auto_24878 ) ( ON ?auto_24867 ?auto_24899 ) ( CLEAR ?auto_24867 ) ( not ( = ?auto_24866 ?auto_24867 ) ) ( not ( = ?auto_24866 ?auto_24899 ) ) ( not ( = ?auto_24867 ?auto_24899 ) ) ( SURFACE-AT ?auto_24865 ?auto_24879 ) ( CLEAR ?auto_24865 ) ( IS-CRATE ?auto_24866 ) ( AVAILABLE ?auto_24877 ) ( AVAILABLE ?auto_24889 ) ( SURFACE-AT ?auto_24866 ?auto_24896 ) ( ON ?auto_24866 ?auto_24893 ) ( CLEAR ?auto_24866 ) ( TRUCK-AT ?auto_24880 ?auto_24879 ) ( not ( = ?auto_24865 ?auto_24866 ) ) ( not ( = ?auto_24865 ?auto_24893 ) ) ( not ( = ?auto_24866 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24867 ) ) ( not ( = ?auto_24865 ?auto_24899 ) ) ( not ( = ?auto_24867 ?auto_24893 ) ) ( not ( = ?auto_24878 ?auto_24896 ) ) ( not ( = ?auto_24881 ?auto_24889 ) ) ( not ( = ?auto_24899 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24868 ) ) ( not ( = ?auto_24865 ?auto_24888 ) ) ( not ( = ?auto_24866 ?auto_24868 ) ) ( not ( = ?auto_24866 ?auto_24888 ) ) ( not ( = ?auto_24868 ?auto_24899 ) ) ( not ( = ?auto_24868 ?auto_24893 ) ) ( not ( = ?auto_24900 ?auto_24878 ) ) ( not ( = ?auto_24900 ?auto_24896 ) ) ( not ( = ?auto_24897 ?auto_24881 ) ) ( not ( = ?auto_24897 ?auto_24889 ) ) ( not ( = ?auto_24888 ?auto_24899 ) ) ( not ( = ?auto_24888 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24869 ) ) ( not ( = ?auto_24865 ?auto_24890 ) ) ( not ( = ?auto_24866 ?auto_24869 ) ) ( not ( = ?auto_24866 ?auto_24890 ) ) ( not ( = ?auto_24867 ?auto_24869 ) ) ( not ( = ?auto_24867 ?auto_24890 ) ) ( not ( = ?auto_24869 ?auto_24888 ) ) ( not ( = ?auto_24869 ?auto_24899 ) ) ( not ( = ?auto_24869 ?auto_24893 ) ) ( not ( = ?auto_24883 ?auto_24900 ) ) ( not ( = ?auto_24883 ?auto_24878 ) ) ( not ( = ?auto_24883 ?auto_24896 ) ) ( not ( = ?auto_24886 ?auto_24897 ) ) ( not ( = ?auto_24886 ?auto_24881 ) ) ( not ( = ?auto_24886 ?auto_24889 ) ) ( not ( = ?auto_24890 ?auto_24888 ) ) ( not ( = ?auto_24890 ?auto_24899 ) ) ( not ( = ?auto_24890 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24870 ) ) ( not ( = ?auto_24865 ?auto_24885 ) ) ( not ( = ?auto_24866 ?auto_24870 ) ) ( not ( = ?auto_24866 ?auto_24885 ) ) ( not ( = ?auto_24867 ?auto_24870 ) ) ( not ( = ?auto_24867 ?auto_24885 ) ) ( not ( = ?auto_24868 ?auto_24870 ) ) ( not ( = ?auto_24868 ?auto_24885 ) ) ( not ( = ?auto_24870 ?auto_24890 ) ) ( not ( = ?auto_24870 ?auto_24888 ) ) ( not ( = ?auto_24870 ?auto_24899 ) ) ( not ( = ?auto_24870 ?auto_24893 ) ) ( not ( = ?auto_24885 ?auto_24890 ) ) ( not ( = ?auto_24885 ?auto_24888 ) ) ( not ( = ?auto_24885 ?auto_24899 ) ) ( not ( = ?auto_24885 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24871 ) ) ( not ( = ?auto_24865 ?auto_24884 ) ) ( not ( = ?auto_24866 ?auto_24871 ) ) ( not ( = ?auto_24866 ?auto_24884 ) ) ( not ( = ?auto_24867 ?auto_24871 ) ) ( not ( = ?auto_24867 ?auto_24884 ) ) ( not ( = ?auto_24868 ?auto_24871 ) ) ( not ( = ?auto_24868 ?auto_24884 ) ) ( not ( = ?auto_24869 ?auto_24871 ) ) ( not ( = ?auto_24869 ?auto_24884 ) ) ( not ( = ?auto_24871 ?auto_24885 ) ) ( not ( = ?auto_24871 ?auto_24890 ) ) ( not ( = ?auto_24871 ?auto_24888 ) ) ( not ( = ?auto_24871 ?auto_24899 ) ) ( not ( = ?auto_24871 ?auto_24893 ) ) ( not ( = ?auto_24884 ?auto_24885 ) ) ( not ( = ?auto_24884 ?auto_24890 ) ) ( not ( = ?auto_24884 ?auto_24888 ) ) ( not ( = ?auto_24884 ?auto_24899 ) ) ( not ( = ?auto_24884 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24872 ) ) ( not ( = ?auto_24865 ?auto_24891 ) ) ( not ( = ?auto_24866 ?auto_24872 ) ) ( not ( = ?auto_24866 ?auto_24891 ) ) ( not ( = ?auto_24867 ?auto_24872 ) ) ( not ( = ?auto_24867 ?auto_24891 ) ) ( not ( = ?auto_24868 ?auto_24872 ) ) ( not ( = ?auto_24868 ?auto_24891 ) ) ( not ( = ?auto_24869 ?auto_24872 ) ) ( not ( = ?auto_24869 ?auto_24891 ) ) ( not ( = ?auto_24870 ?auto_24872 ) ) ( not ( = ?auto_24870 ?auto_24891 ) ) ( not ( = ?auto_24872 ?auto_24884 ) ) ( not ( = ?auto_24872 ?auto_24885 ) ) ( not ( = ?auto_24872 ?auto_24890 ) ) ( not ( = ?auto_24872 ?auto_24888 ) ) ( not ( = ?auto_24872 ?auto_24899 ) ) ( not ( = ?auto_24872 ?auto_24893 ) ) ( not ( = ?auto_24891 ?auto_24884 ) ) ( not ( = ?auto_24891 ?auto_24885 ) ) ( not ( = ?auto_24891 ?auto_24890 ) ) ( not ( = ?auto_24891 ?auto_24888 ) ) ( not ( = ?auto_24891 ?auto_24899 ) ) ( not ( = ?auto_24891 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24873 ) ) ( not ( = ?auto_24865 ?auto_24894 ) ) ( not ( = ?auto_24866 ?auto_24873 ) ) ( not ( = ?auto_24866 ?auto_24894 ) ) ( not ( = ?auto_24867 ?auto_24873 ) ) ( not ( = ?auto_24867 ?auto_24894 ) ) ( not ( = ?auto_24868 ?auto_24873 ) ) ( not ( = ?auto_24868 ?auto_24894 ) ) ( not ( = ?auto_24869 ?auto_24873 ) ) ( not ( = ?auto_24869 ?auto_24894 ) ) ( not ( = ?auto_24870 ?auto_24873 ) ) ( not ( = ?auto_24870 ?auto_24894 ) ) ( not ( = ?auto_24871 ?auto_24873 ) ) ( not ( = ?auto_24871 ?auto_24894 ) ) ( not ( = ?auto_24873 ?auto_24891 ) ) ( not ( = ?auto_24873 ?auto_24884 ) ) ( not ( = ?auto_24873 ?auto_24885 ) ) ( not ( = ?auto_24873 ?auto_24890 ) ) ( not ( = ?auto_24873 ?auto_24888 ) ) ( not ( = ?auto_24873 ?auto_24899 ) ) ( not ( = ?auto_24873 ?auto_24893 ) ) ( not ( = ?auto_24892 ?auto_24900 ) ) ( not ( = ?auto_24892 ?auto_24883 ) ) ( not ( = ?auto_24892 ?auto_24896 ) ) ( not ( = ?auto_24892 ?auto_24878 ) ) ( not ( = ?auto_24898 ?auto_24897 ) ) ( not ( = ?auto_24898 ?auto_24886 ) ) ( not ( = ?auto_24898 ?auto_24889 ) ) ( not ( = ?auto_24898 ?auto_24881 ) ) ( not ( = ?auto_24894 ?auto_24891 ) ) ( not ( = ?auto_24894 ?auto_24884 ) ) ( not ( = ?auto_24894 ?auto_24885 ) ) ( not ( = ?auto_24894 ?auto_24890 ) ) ( not ( = ?auto_24894 ?auto_24888 ) ) ( not ( = ?auto_24894 ?auto_24899 ) ) ( not ( = ?auto_24894 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24874 ) ) ( not ( = ?auto_24865 ?auto_24887 ) ) ( not ( = ?auto_24866 ?auto_24874 ) ) ( not ( = ?auto_24866 ?auto_24887 ) ) ( not ( = ?auto_24867 ?auto_24874 ) ) ( not ( = ?auto_24867 ?auto_24887 ) ) ( not ( = ?auto_24868 ?auto_24874 ) ) ( not ( = ?auto_24868 ?auto_24887 ) ) ( not ( = ?auto_24869 ?auto_24874 ) ) ( not ( = ?auto_24869 ?auto_24887 ) ) ( not ( = ?auto_24870 ?auto_24874 ) ) ( not ( = ?auto_24870 ?auto_24887 ) ) ( not ( = ?auto_24871 ?auto_24874 ) ) ( not ( = ?auto_24871 ?auto_24887 ) ) ( not ( = ?auto_24872 ?auto_24874 ) ) ( not ( = ?auto_24872 ?auto_24887 ) ) ( not ( = ?auto_24874 ?auto_24894 ) ) ( not ( = ?auto_24874 ?auto_24891 ) ) ( not ( = ?auto_24874 ?auto_24884 ) ) ( not ( = ?auto_24874 ?auto_24885 ) ) ( not ( = ?auto_24874 ?auto_24890 ) ) ( not ( = ?auto_24874 ?auto_24888 ) ) ( not ( = ?auto_24874 ?auto_24899 ) ) ( not ( = ?auto_24874 ?auto_24893 ) ) ( not ( = ?auto_24895 ?auto_24892 ) ) ( not ( = ?auto_24895 ?auto_24900 ) ) ( not ( = ?auto_24895 ?auto_24883 ) ) ( not ( = ?auto_24895 ?auto_24896 ) ) ( not ( = ?auto_24895 ?auto_24878 ) ) ( not ( = ?auto_24882 ?auto_24898 ) ) ( not ( = ?auto_24882 ?auto_24897 ) ) ( not ( = ?auto_24882 ?auto_24886 ) ) ( not ( = ?auto_24882 ?auto_24889 ) ) ( not ( = ?auto_24882 ?auto_24881 ) ) ( not ( = ?auto_24887 ?auto_24894 ) ) ( not ( = ?auto_24887 ?auto_24891 ) ) ( not ( = ?auto_24887 ?auto_24884 ) ) ( not ( = ?auto_24887 ?auto_24885 ) ) ( not ( = ?auto_24887 ?auto_24890 ) ) ( not ( = ?auto_24887 ?auto_24888 ) ) ( not ( = ?auto_24887 ?auto_24899 ) ) ( not ( = ?auto_24887 ?auto_24893 ) ) ( not ( = ?auto_24865 ?auto_24875 ) ) ( not ( = ?auto_24865 ?auto_24876 ) ) ( not ( = ?auto_24866 ?auto_24875 ) ) ( not ( = ?auto_24866 ?auto_24876 ) ) ( not ( = ?auto_24867 ?auto_24875 ) ) ( not ( = ?auto_24867 ?auto_24876 ) ) ( not ( = ?auto_24868 ?auto_24875 ) ) ( not ( = ?auto_24868 ?auto_24876 ) ) ( not ( = ?auto_24869 ?auto_24875 ) ) ( not ( = ?auto_24869 ?auto_24876 ) ) ( not ( = ?auto_24870 ?auto_24875 ) ) ( not ( = ?auto_24870 ?auto_24876 ) ) ( not ( = ?auto_24871 ?auto_24875 ) ) ( not ( = ?auto_24871 ?auto_24876 ) ) ( not ( = ?auto_24872 ?auto_24875 ) ) ( not ( = ?auto_24872 ?auto_24876 ) ) ( not ( = ?auto_24873 ?auto_24875 ) ) ( not ( = ?auto_24873 ?auto_24876 ) ) ( not ( = ?auto_24875 ?auto_24887 ) ) ( not ( = ?auto_24875 ?auto_24894 ) ) ( not ( = ?auto_24875 ?auto_24891 ) ) ( not ( = ?auto_24875 ?auto_24884 ) ) ( not ( = ?auto_24875 ?auto_24885 ) ) ( not ( = ?auto_24875 ?auto_24890 ) ) ( not ( = ?auto_24875 ?auto_24888 ) ) ( not ( = ?auto_24875 ?auto_24899 ) ) ( not ( = ?auto_24875 ?auto_24893 ) ) ( not ( = ?auto_24876 ?auto_24887 ) ) ( not ( = ?auto_24876 ?auto_24894 ) ) ( not ( = ?auto_24876 ?auto_24891 ) ) ( not ( = ?auto_24876 ?auto_24884 ) ) ( not ( = ?auto_24876 ?auto_24885 ) ) ( not ( = ?auto_24876 ?auto_24890 ) ) ( not ( = ?auto_24876 ?auto_24888 ) ) ( not ( = ?auto_24876 ?auto_24899 ) ) ( not ( = ?auto_24876 ?auto_24893 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_24865 ?auto_24866 ?auto_24867 ?auto_24868 ?auto_24869 ?auto_24870 ?auto_24871 ?auto_24872 ?auto_24873 ?auto_24874 )
      ( MAKE-1CRATE ?auto_24874 ?auto_24875 )
      ( MAKE-10CRATE-VERIFY ?auto_24865 ?auto_24866 ?auto_24867 ?auto_24868 ?auto_24869 ?auto_24870 ?auto_24871 ?auto_24872 ?auto_24873 ?auto_24874 ?auto_24875 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_24923 - SURFACE
      ?auto_24924 - SURFACE
      ?auto_24925 - SURFACE
      ?auto_24926 - SURFACE
      ?auto_24927 - SURFACE
      ?auto_24928 - SURFACE
      ?auto_24929 - SURFACE
      ?auto_24930 - SURFACE
      ?auto_24931 - SURFACE
      ?auto_24932 - SURFACE
      ?auto_24933 - SURFACE
      ?auto_24934 - SURFACE
    )
    :vars
    (
      ?auto_24935 - HOIST
      ?auto_24936 - PLACE
      ?auto_24940 - PLACE
      ?auto_24939 - HOIST
      ?auto_24937 - SURFACE
      ?auto_24955 - PLACE
      ?auto_24960 - HOIST
      ?auto_24950 - SURFACE
      ?auto_24956 - PLACE
      ?auto_24953 - HOIST
      ?auto_24945 - SURFACE
      ?auto_24947 - PLACE
      ?auto_24949 - HOIST
      ?auto_24943 - SURFACE
      ?auto_24946 - SURFACE
      ?auto_24958 - PLACE
      ?auto_24942 - HOIST
      ?auto_24959 - SURFACE
      ?auto_24951 - PLACE
      ?auto_24954 - HOIST
      ?auto_24941 - SURFACE
      ?auto_24944 - SURFACE
      ?auto_24957 - SURFACE
      ?auto_24948 - SURFACE
      ?auto_24952 - SURFACE
      ?auto_24938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24935 ?auto_24936 ) ( IS-CRATE ?auto_24934 ) ( not ( = ?auto_24940 ?auto_24936 ) ) ( HOIST-AT ?auto_24939 ?auto_24940 ) ( SURFACE-AT ?auto_24934 ?auto_24940 ) ( ON ?auto_24934 ?auto_24937 ) ( CLEAR ?auto_24934 ) ( not ( = ?auto_24933 ?auto_24934 ) ) ( not ( = ?auto_24933 ?auto_24937 ) ) ( not ( = ?auto_24934 ?auto_24937 ) ) ( not ( = ?auto_24935 ?auto_24939 ) ) ( IS-CRATE ?auto_24933 ) ( not ( = ?auto_24955 ?auto_24936 ) ) ( HOIST-AT ?auto_24960 ?auto_24955 ) ( SURFACE-AT ?auto_24933 ?auto_24955 ) ( ON ?auto_24933 ?auto_24950 ) ( CLEAR ?auto_24933 ) ( not ( = ?auto_24932 ?auto_24933 ) ) ( not ( = ?auto_24932 ?auto_24950 ) ) ( not ( = ?auto_24933 ?auto_24950 ) ) ( not ( = ?auto_24935 ?auto_24960 ) ) ( IS-CRATE ?auto_24932 ) ( not ( = ?auto_24956 ?auto_24936 ) ) ( HOIST-AT ?auto_24953 ?auto_24956 ) ( AVAILABLE ?auto_24953 ) ( SURFACE-AT ?auto_24932 ?auto_24956 ) ( ON ?auto_24932 ?auto_24945 ) ( CLEAR ?auto_24932 ) ( not ( = ?auto_24931 ?auto_24932 ) ) ( not ( = ?auto_24931 ?auto_24945 ) ) ( not ( = ?auto_24932 ?auto_24945 ) ) ( not ( = ?auto_24935 ?auto_24953 ) ) ( IS-CRATE ?auto_24931 ) ( not ( = ?auto_24947 ?auto_24936 ) ) ( HOIST-AT ?auto_24949 ?auto_24947 ) ( AVAILABLE ?auto_24949 ) ( SURFACE-AT ?auto_24931 ?auto_24947 ) ( ON ?auto_24931 ?auto_24943 ) ( CLEAR ?auto_24931 ) ( not ( = ?auto_24930 ?auto_24931 ) ) ( not ( = ?auto_24930 ?auto_24943 ) ) ( not ( = ?auto_24931 ?auto_24943 ) ) ( not ( = ?auto_24935 ?auto_24949 ) ) ( IS-CRATE ?auto_24930 ) ( SURFACE-AT ?auto_24930 ?auto_24940 ) ( ON ?auto_24930 ?auto_24946 ) ( CLEAR ?auto_24930 ) ( not ( = ?auto_24929 ?auto_24930 ) ) ( not ( = ?auto_24929 ?auto_24946 ) ) ( not ( = ?auto_24930 ?auto_24946 ) ) ( IS-CRATE ?auto_24929 ) ( not ( = ?auto_24958 ?auto_24936 ) ) ( HOIST-AT ?auto_24942 ?auto_24958 ) ( SURFACE-AT ?auto_24929 ?auto_24958 ) ( ON ?auto_24929 ?auto_24959 ) ( CLEAR ?auto_24929 ) ( not ( = ?auto_24928 ?auto_24929 ) ) ( not ( = ?auto_24928 ?auto_24959 ) ) ( not ( = ?auto_24929 ?auto_24959 ) ) ( not ( = ?auto_24935 ?auto_24942 ) ) ( IS-CRATE ?auto_24928 ) ( not ( = ?auto_24951 ?auto_24936 ) ) ( HOIST-AT ?auto_24954 ?auto_24951 ) ( SURFACE-AT ?auto_24928 ?auto_24951 ) ( ON ?auto_24928 ?auto_24941 ) ( CLEAR ?auto_24928 ) ( not ( = ?auto_24927 ?auto_24928 ) ) ( not ( = ?auto_24927 ?auto_24941 ) ) ( not ( = ?auto_24928 ?auto_24941 ) ) ( not ( = ?auto_24935 ?auto_24954 ) ) ( IS-CRATE ?auto_24927 ) ( AVAILABLE ?auto_24942 ) ( SURFACE-AT ?auto_24927 ?auto_24958 ) ( ON ?auto_24927 ?auto_24944 ) ( CLEAR ?auto_24927 ) ( not ( = ?auto_24926 ?auto_24927 ) ) ( not ( = ?auto_24926 ?auto_24944 ) ) ( not ( = ?auto_24927 ?auto_24944 ) ) ( IS-CRATE ?auto_24926 ) ( AVAILABLE ?auto_24939 ) ( SURFACE-AT ?auto_24926 ?auto_24940 ) ( ON ?auto_24926 ?auto_24957 ) ( CLEAR ?auto_24926 ) ( not ( = ?auto_24925 ?auto_24926 ) ) ( not ( = ?auto_24925 ?auto_24957 ) ) ( not ( = ?auto_24926 ?auto_24957 ) ) ( IS-CRATE ?auto_24925 ) ( AVAILABLE ?auto_24960 ) ( SURFACE-AT ?auto_24925 ?auto_24955 ) ( ON ?auto_24925 ?auto_24948 ) ( CLEAR ?auto_24925 ) ( not ( = ?auto_24924 ?auto_24925 ) ) ( not ( = ?auto_24924 ?auto_24948 ) ) ( not ( = ?auto_24925 ?auto_24948 ) ) ( SURFACE-AT ?auto_24923 ?auto_24936 ) ( CLEAR ?auto_24923 ) ( IS-CRATE ?auto_24924 ) ( AVAILABLE ?auto_24935 ) ( AVAILABLE ?auto_24954 ) ( SURFACE-AT ?auto_24924 ?auto_24951 ) ( ON ?auto_24924 ?auto_24952 ) ( CLEAR ?auto_24924 ) ( TRUCK-AT ?auto_24938 ?auto_24936 ) ( not ( = ?auto_24923 ?auto_24924 ) ) ( not ( = ?auto_24923 ?auto_24952 ) ) ( not ( = ?auto_24924 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24925 ) ) ( not ( = ?auto_24923 ?auto_24948 ) ) ( not ( = ?auto_24925 ?auto_24952 ) ) ( not ( = ?auto_24955 ?auto_24951 ) ) ( not ( = ?auto_24960 ?auto_24954 ) ) ( not ( = ?auto_24948 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24926 ) ) ( not ( = ?auto_24923 ?auto_24957 ) ) ( not ( = ?auto_24924 ?auto_24926 ) ) ( not ( = ?auto_24924 ?auto_24957 ) ) ( not ( = ?auto_24926 ?auto_24948 ) ) ( not ( = ?auto_24926 ?auto_24952 ) ) ( not ( = ?auto_24940 ?auto_24955 ) ) ( not ( = ?auto_24940 ?auto_24951 ) ) ( not ( = ?auto_24939 ?auto_24960 ) ) ( not ( = ?auto_24939 ?auto_24954 ) ) ( not ( = ?auto_24957 ?auto_24948 ) ) ( not ( = ?auto_24957 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24927 ) ) ( not ( = ?auto_24923 ?auto_24944 ) ) ( not ( = ?auto_24924 ?auto_24927 ) ) ( not ( = ?auto_24924 ?auto_24944 ) ) ( not ( = ?auto_24925 ?auto_24927 ) ) ( not ( = ?auto_24925 ?auto_24944 ) ) ( not ( = ?auto_24927 ?auto_24957 ) ) ( not ( = ?auto_24927 ?auto_24948 ) ) ( not ( = ?auto_24927 ?auto_24952 ) ) ( not ( = ?auto_24958 ?auto_24940 ) ) ( not ( = ?auto_24958 ?auto_24955 ) ) ( not ( = ?auto_24958 ?auto_24951 ) ) ( not ( = ?auto_24942 ?auto_24939 ) ) ( not ( = ?auto_24942 ?auto_24960 ) ) ( not ( = ?auto_24942 ?auto_24954 ) ) ( not ( = ?auto_24944 ?auto_24957 ) ) ( not ( = ?auto_24944 ?auto_24948 ) ) ( not ( = ?auto_24944 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24928 ) ) ( not ( = ?auto_24923 ?auto_24941 ) ) ( not ( = ?auto_24924 ?auto_24928 ) ) ( not ( = ?auto_24924 ?auto_24941 ) ) ( not ( = ?auto_24925 ?auto_24928 ) ) ( not ( = ?auto_24925 ?auto_24941 ) ) ( not ( = ?auto_24926 ?auto_24928 ) ) ( not ( = ?auto_24926 ?auto_24941 ) ) ( not ( = ?auto_24928 ?auto_24944 ) ) ( not ( = ?auto_24928 ?auto_24957 ) ) ( not ( = ?auto_24928 ?auto_24948 ) ) ( not ( = ?auto_24928 ?auto_24952 ) ) ( not ( = ?auto_24941 ?auto_24944 ) ) ( not ( = ?auto_24941 ?auto_24957 ) ) ( not ( = ?auto_24941 ?auto_24948 ) ) ( not ( = ?auto_24941 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24929 ) ) ( not ( = ?auto_24923 ?auto_24959 ) ) ( not ( = ?auto_24924 ?auto_24929 ) ) ( not ( = ?auto_24924 ?auto_24959 ) ) ( not ( = ?auto_24925 ?auto_24929 ) ) ( not ( = ?auto_24925 ?auto_24959 ) ) ( not ( = ?auto_24926 ?auto_24929 ) ) ( not ( = ?auto_24926 ?auto_24959 ) ) ( not ( = ?auto_24927 ?auto_24929 ) ) ( not ( = ?auto_24927 ?auto_24959 ) ) ( not ( = ?auto_24929 ?auto_24941 ) ) ( not ( = ?auto_24929 ?auto_24944 ) ) ( not ( = ?auto_24929 ?auto_24957 ) ) ( not ( = ?auto_24929 ?auto_24948 ) ) ( not ( = ?auto_24929 ?auto_24952 ) ) ( not ( = ?auto_24959 ?auto_24941 ) ) ( not ( = ?auto_24959 ?auto_24944 ) ) ( not ( = ?auto_24959 ?auto_24957 ) ) ( not ( = ?auto_24959 ?auto_24948 ) ) ( not ( = ?auto_24959 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24930 ) ) ( not ( = ?auto_24923 ?auto_24946 ) ) ( not ( = ?auto_24924 ?auto_24930 ) ) ( not ( = ?auto_24924 ?auto_24946 ) ) ( not ( = ?auto_24925 ?auto_24930 ) ) ( not ( = ?auto_24925 ?auto_24946 ) ) ( not ( = ?auto_24926 ?auto_24930 ) ) ( not ( = ?auto_24926 ?auto_24946 ) ) ( not ( = ?auto_24927 ?auto_24930 ) ) ( not ( = ?auto_24927 ?auto_24946 ) ) ( not ( = ?auto_24928 ?auto_24930 ) ) ( not ( = ?auto_24928 ?auto_24946 ) ) ( not ( = ?auto_24930 ?auto_24959 ) ) ( not ( = ?auto_24930 ?auto_24941 ) ) ( not ( = ?auto_24930 ?auto_24944 ) ) ( not ( = ?auto_24930 ?auto_24957 ) ) ( not ( = ?auto_24930 ?auto_24948 ) ) ( not ( = ?auto_24930 ?auto_24952 ) ) ( not ( = ?auto_24946 ?auto_24959 ) ) ( not ( = ?auto_24946 ?auto_24941 ) ) ( not ( = ?auto_24946 ?auto_24944 ) ) ( not ( = ?auto_24946 ?auto_24957 ) ) ( not ( = ?auto_24946 ?auto_24948 ) ) ( not ( = ?auto_24946 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24931 ) ) ( not ( = ?auto_24923 ?auto_24943 ) ) ( not ( = ?auto_24924 ?auto_24931 ) ) ( not ( = ?auto_24924 ?auto_24943 ) ) ( not ( = ?auto_24925 ?auto_24931 ) ) ( not ( = ?auto_24925 ?auto_24943 ) ) ( not ( = ?auto_24926 ?auto_24931 ) ) ( not ( = ?auto_24926 ?auto_24943 ) ) ( not ( = ?auto_24927 ?auto_24931 ) ) ( not ( = ?auto_24927 ?auto_24943 ) ) ( not ( = ?auto_24928 ?auto_24931 ) ) ( not ( = ?auto_24928 ?auto_24943 ) ) ( not ( = ?auto_24929 ?auto_24931 ) ) ( not ( = ?auto_24929 ?auto_24943 ) ) ( not ( = ?auto_24931 ?auto_24946 ) ) ( not ( = ?auto_24931 ?auto_24959 ) ) ( not ( = ?auto_24931 ?auto_24941 ) ) ( not ( = ?auto_24931 ?auto_24944 ) ) ( not ( = ?auto_24931 ?auto_24957 ) ) ( not ( = ?auto_24931 ?auto_24948 ) ) ( not ( = ?auto_24931 ?auto_24952 ) ) ( not ( = ?auto_24947 ?auto_24940 ) ) ( not ( = ?auto_24947 ?auto_24958 ) ) ( not ( = ?auto_24947 ?auto_24951 ) ) ( not ( = ?auto_24947 ?auto_24955 ) ) ( not ( = ?auto_24949 ?auto_24939 ) ) ( not ( = ?auto_24949 ?auto_24942 ) ) ( not ( = ?auto_24949 ?auto_24954 ) ) ( not ( = ?auto_24949 ?auto_24960 ) ) ( not ( = ?auto_24943 ?auto_24946 ) ) ( not ( = ?auto_24943 ?auto_24959 ) ) ( not ( = ?auto_24943 ?auto_24941 ) ) ( not ( = ?auto_24943 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24957 ) ) ( not ( = ?auto_24943 ?auto_24948 ) ) ( not ( = ?auto_24943 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24932 ) ) ( not ( = ?auto_24923 ?auto_24945 ) ) ( not ( = ?auto_24924 ?auto_24932 ) ) ( not ( = ?auto_24924 ?auto_24945 ) ) ( not ( = ?auto_24925 ?auto_24932 ) ) ( not ( = ?auto_24925 ?auto_24945 ) ) ( not ( = ?auto_24926 ?auto_24932 ) ) ( not ( = ?auto_24926 ?auto_24945 ) ) ( not ( = ?auto_24927 ?auto_24932 ) ) ( not ( = ?auto_24927 ?auto_24945 ) ) ( not ( = ?auto_24928 ?auto_24932 ) ) ( not ( = ?auto_24928 ?auto_24945 ) ) ( not ( = ?auto_24929 ?auto_24932 ) ) ( not ( = ?auto_24929 ?auto_24945 ) ) ( not ( = ?auto_24930 ?auto_24932 ) ) ( not ( = ?auto_24930 ?auto_24945 ) ) ( not ( = ?auto_24932 ?auto_24943 ) ) ( not ( = ?auto_24932 ?auto_24946 ) ) ( not ( = ?auto_24932 ?auto_24959 ) ) ( not ( = ?auto_24932 ?auto_24941 ) ) ( not ( = ?auto_24932 ?auto_24944 ) ) ( not ( = ?auto_24932 ?auto_24957 ) ) ( not ( = ?auto_24932 ?auto_24948 ) ) ( not ( = ?auto_24932 ?auto_24952 ) ) ( not ( = ?auto_24956 ?auto_24947 ) ) ( not ( = ?auto_24956 ?auto_24940 ) ) ( not ( = ?auto_24956 ?auto_24958 ) ) ( not ( = ?auto_24956 ?auto_24951 ) ) ( not ( = ?auto_24956 ?auto_24955 ) ) ( not ( = ?auto_24953 ?auto_24949 ) ) ( not ( = ?auto_24953 ?auto_24939 ) ) ( not ( = ?auto_24953 ?auto_24942 ) ) ( not ( = ?auto_24953 ?auto_24954 ) ) ( not ( = ?auto_24953 ?auto_24960 ) ) ( not ( = ?auto_24945 ?auto_24943 ) ) ( not ( = ?auto_24945 ?auto_24946 ) ) ( not ( = ?auto_24945 ?auto_24959 ) ) ( not ( = ?auto_24945 ?auto_24941 ) ) ( not ( = ?auto_24945 ?auto_24944 ) ) ( not ( = ?auto_24945 ?auto_24957 ) ) ( not ( = ?auto_24945 ?auto_24948 ) ) ( not ( = ?auto_24945 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24933 ) ) ( not ( = ?auto_24923 ?auto_24950 ) ) ( not ( = ?auto_24924 ?auto_24933 ) ) ( not ( = ?auto_24924 ?auto_24950 ) ) ( not ( = ?auto_24925 ?auto_24933 ) ) ( not ( = ?auto_24925 ?auto_24950 ) ) ( not ( = ?auto_24926 ?auto_24933 ) ) ( not ( = ?auto_24926 ?auto_24950 ) ) ( not ( = ?auto_24927 ?auto_24933 ) ) ( not ( = ?auto_24927 ?auto_24950 ) ) ( not ( = ?auto_24928 ?auto_24933 ) ) ( not ( = ?auto_24928 ?auto_24950 ) ) ( not ( = ?auto_24929 ?auto_24933 ) ) ( not ( = ?auto_24929 ?auto_24950 ) ) ( not ( = ?auto_24930 ?auto_24933 ) ) ( not ( = ?auto_24930 ?auto_24950 ) ) ( not ( = ?auto_24931 ?auto_24933 ) ) ( not ( = ?auto_24931 ?auto_24950 ) ) ( not ( = ?auto_24933 ?auto_24945 ) ) ( not ( = ?auto_24933 ?auto_24943 ) ) ( not ( = ?auto_24933 ?auto_24946 ) ) ( not ( = ?auto_24933 ?auto_24959 ) ) ( not ( = ?auto_24933 ?auto_24941 ) ) ( not ( = ?auto_24933 ?auto_24944 ) ) ( not ( = ?auto_24933 ?auto_24957 ) ) ( not ( = ?auto_24933 ?auto_24948 ) ) ( not ( = ?auto_24933 ?auto_24952 ) ) ( not ( = ?auto_24950 ?auto_24945 ) ) ( not ( = ?auto_24950 ?auto_24943 ) ) ( not ( = ?auto_24950 ?auto_24946 ) ) ( not ( = ?auto_24950 ?auto_24959 ) ) ( not ( = ?auto_24950 ?auto_24941 ) ) ( not ( = ?auto_24950 ?auto_24944 ) ) ( not ( = ?auto_24950 ?auto_24957 ) ) ( not ( = ?auto_24950 ?auto_24948 ) ) ( not ( = ?auto_24950 ?auto_24952 ) ) ( not ( = ?auto_24923 ?auto_24934 ) ) ( not ( = ?auto_24923 ?auto_24937 ) ) ( not ( = ?auto_24924 ?auto_24934 ) ) ( not ( = ?auto_24924 ?auto_24937 ) ) ( not ( = ?auto_24925 ?auto_24934 ) ) ( not ( = ?auto_24925 ?auto_24937 ) ) ( not ( = ?auto_24926 ?auto_24934 ) ) ( not ( = ?auto_24926 ?auto_24937 ) ) ( not ( = ?auto_24927 ?auto_24934 ) ) ( not ( = ?auto_24927 ?auto_24937 ) ) ( not ( = ?auto_24928 ?auto_24934 ) ) ( not ( = ?auto_24928 ?auto_24937 ) ) ( not ( = ?auto_24929 ?auto_24934 ) ) ( not ( = ?auto_24929 ?auto_24937 ) ) ( not ( = ?auto_24930 ?auto_24934 ) ) ( not ( = ?auto_24930 ?auto_24937 ) ) ( not ( = ?auto_24931 ?auto_24934 ) ) ( not ( = ?auto_24931 ?auto_24937 ) ) ( not ( = ?auto_24932 ?auto_24934 ) ) ( not ( = ?auto_24932 ?auto_24937 ) ) ( not ( = ?auto_24934 ?auto_24950 ) ) ( not ( = ?auto_24934 ?auto_24945 ) ) ( not ( = ?auto_24934 ?auto_24943 ) ) ( not ( = ?auto_24934 ?auto_24946 ) ) ( not ( = ?auto_24934 ?auto_24959 ) ) ( not ( = ?auto_24934 ?auto_24941 ) ) ( not ( = ?auto_24934 ?auto_24944 ) ) ( not ( = ?auto_24934 ?auto_24957 ) ) ( not ( = ?auto_24934 ?auto_24948 ) ) ( not ( = ?auto_24934 ?auto_24952 ) ) ( not ( = ?auto_24937 ?auto_24950 ) ) ( not ( = ?auto_24937 ?auto_24945 ) ) ( not ( = ?auto_24937 ?auto_24943 ) ) ( not ( = ?auto_24937 ?auto_24946 ) ) ( not ( = ?auto_24937 ?auto_24959 ) ) ( not ( = ?auto_24937 ?auto_24941 ) ) ( not ( = ?auto_24937 ?auto_24944 ) ) ( not ( = ?auto_24937 ?auto_24957 ) ) ( not ( = ?auto_24937 ?auto_24948 ) ) ( not ( = ?auto_24937 ?auto_24952 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_24923 ?auto_24924 ?auto_24925 ?auto_24926 ?auto_24927 ?auto_24928 ?auto_24929 ?auto_24930 ?auto_24931 ?auto_24932 ?auto_24933 )
      ( MAKE-1CRATE ?auto_24933 ?auto_24934 )
      ( MAKE-11CRATE-VERIFY ?auto_24923 ?auto_24924 ?auto_24925 ?auto_24926 ?auto_24927 ?auto_24928 ?auto_24929 ?auto_24930 ?auto_24931 ?auto_24932 ?auto_24933 ?auto_24934 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_24984 - SURFACE
      ?auto_24985 - SURFACE
      ?auto_24986 - SURFACE
      ?auto_24987 - SURFACE
      ?auto_24988 - SURFACE
      ?auto_24989 - SURFACE
      ?auto_24990 - SURFACE
      ?auto_24991 - SURFACE
      ?auto_24992 - SURFACE
      ?auto_24993 - SURFACE
      ?auto_24994 - SURFACE
      ?auto_24995 - SURFACE
      ?auto_24996 - SURFACE
    )
    :vars
    (
      ?auto_25001 - HOIST
      ?auto_24998 - PLACE
      ?auto_24997 - PLACE
      ?auto_25002 - HOIST
      ?auto_24999 - SURFACE
      ?auto_25018 - PLACE
      ?auto_25014 - HOIST
      ?auto_25016 - SURFACE
      ?auto_25023 - PLACE
      ?auto_25007 - HOIST
      ?auto_25008 - SURFACE
      ?auto_25021 - PLACE
      ?auto_25004 - HOIST
      ?auto_25020 - SURFACE
      ?auto_25011 - PLACE
      ?auto_25006 - HOIST
      ?auto_25015 - SURFACE
      ?auto_25005 - SURFACE
      ?auto_25019 - PLACE
      ?auto_25025 - HOIST
      ?auto_25010 - SURFACE
      ?auto_25009 - PLACE
      ?auto_25013 - HOIST
      ?auto_25022 - SURFACE
      ?auto_25017 - SURFACE
      ?auto_25012 - SURFACE
      ?auto_25003 - SURFACE
      ?auto_25024 - SURFACE
      ?auto_25000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25001 ?auto_24998 ) ( IS-CRATE ?auto_24996 ) ( not ( = ?auto_24997 ?auto_24998 ) ) ( HOIST-AT ?auto_25002 ?auto_24997 ) ( AVAILABLE ?auto_25002 ) ( SURFACE-AT ?auto_24996 ?auto_24997 ) ( ON ?auto_24996 ?auto_24999 ) ( CLEAR ?auto_24996 ) ( not ( = ?auto_24995 ?auto_24996 ) ) ( not ( = ?auto_24995 ?auto_24999 ) ) ( not ( = ?auto_24996 ?auto_24999 ) ) ( not ( = ?auto_25001 ?auto_25002 ) ) ( IS-CRATE ?auto_24995 ) ( not ( = ?auto_25018 ?auto_24998 ) ) ( HOIST-AT ?auto_25014 ?auto_25018 ) ( SURFACE-AT ?auto_24995 ?auto_25018 ) ( ON ?auto_24995 ?auto_25016 ) ( CLEAR ?auto_24995 ) ( not ( = ?auto_24994 ?auto_24995 ) ) ( not ( = ?auto_24994 ?auto_25016 ) ) ( not ( = ?auto_24995 ?auto_25016 ) ) ( not ( = ?auto_25001 ?auto_25014 ) ) ( IS-CRATE ?auto_24994 ) ( not ( = ?auto_25023 ?auto_24998 ) ) ( HOIST-AT ?auto_25007 ?auto_25023 ) ( SURFACE-AT ?auto_24994 ?auto_25023 ) ( ON ?auto_24994 ?auto_25008 ) ( CLEAR ?auto_24994 ) ( not ( = ?auto_24993 ?auto_24994 ) ) ( not ( = ?auto_24993 ?auto_25008 ) ) ( not ( = ?auto_24994 ?auto_25008 ) ) ( not ( = ?auto_25001 ?auto_25007 ) ) ( IS-CRATE ?auto_24993 ) ( not ( = ?auto_25021 ?auto_24998 ) ) ( HOIST-AT ?auto_25004 ?auto_25021 ) ( AVAILABLE ?auto_25004 ) ( SURFACE-AT ?auto_24993 ?auto_25021 ) ( ON ?auto_24993 ?auto_25020 ) ( CLEAR ?auto_24993 ) ( not ( = ?auto_24992 ?auto_24993 ) ) ( not ( = ?auto_24992 ?auto_25020 ) ) ( not ( = ?auto_24993 ?auto_25020 ) ) ( not ( = ?auto_25001 ?auto_25004 ) ) ( IS-CRATE ?auto_24992 ) ( not ( = ?auto_25011 ?auto_24998 ) ) ( HOIST-AT ?auto_25006 ?auto_25011 ) ( AVAILABLE ?auto_25006 ) ( SURFACE-AT ?auto_24992 ?auto_25011 ) ( ON ?auto_24992 ?auto_25015 ) ( CLEAR ?auto_24992 ) ( not ( = ?auto_24991 ?auto_24992 ) ) ( not ( = ?auto_24991 ?auto_25015 ) ) ( not ( = ?auto_24992 ?auto_25015 ) ) ( not ( = ?auto_25001 ?auto_25006 ) ) ( IS-CRATE ?auto_24991 ) ( SURFACE-AT ?auto_24991 ?auto_25018 ) ( ON ?auto_24991 ?auto_25005 ) ( CLEAR ?auto_24991 ) ( not ( = ?auto_24990 ?auto_24991 ) ) ( not ( = ?auto_24990 ?auto_25005 ) ) ( not ( = ?auto_24991 ?auto_25005 ) ) ( IS-CRATE ?auto_24990 ) ( not ( = ?auto_25019 ?auto_24998 ) ) ( HOIST-AT ?auto_25025 ?auto_25019 ) ( SURFACE-AT ?auto_24990 ?auto_25019 ) ( ON ?auto_24990 ?auto_25010 ) ( CLEAR ?auto_24990 ) ( not ( = ?auto_24989 ?auto_24990 ) ) ( not ( = ?auto_24989 ?auto_25010 ) ) ( not ( = ?auto_24990 ?auto_25010 ) ) ( not ( = ?auto_25001 ?auto_25025 ) ) ( IS-CRATE ?auto_24989 ) ( not ( = ?auto_25009 ?auto_24998 ) ) ( HOIST-AT ?auto_25013 ?auto_25009 ) ( SURFACE-AT ?auto_24989 ?auto_25009 ) ( ON ?auto_24989 ?auto_25022 ) ( CLEAR ?auto_24989 ) ( not ( = ?auto_24988 ?auto_24989 ) ) ( not ( = ?auto_24988 ?auto_25022 ) ) ( not ( = ?auto_24989 ?auto_25022 ) ) ( not ( = ?auto_25001 ?auto_25013 ) ) ( IS-CRATE ?auto_24988 ) ( AVAILABLE ?auto_25025 ) ( SURFACE-AT ?auto_24988 ?auto_25019 ) ( ON ?auto_24988 ?auto_25017 ) ( CLEAR ?auto_24988 ) ( not ( = ?auto_24987 ?auto_24988 ) ) ( not ( = ?auto_24987 ?auto_25017 ) ) ( not ( = ?auto_24988 ?auto_25017 ) ) ( IS-CRATE ?auto_24987 ) ( AVAILABLE ?auto_25014 ) ( SURFACE-AT ?auto_24987 ?auto_25018 ) ( ON ?auto_24987 ?auto_25012 ) ( CLEAR ?auto_24987 ) ( not ( = ?auto_24986 ?auto_24987 ) ) ( not ( = ?auto_24986 ?auto_25012 ) ) ( not ( = ?auto_24987 ?auto_25012 ) ) ( IS-CRATE ?auto_24986 ) ( AVAILABLE ?auto_25007 ) ( SURFACE-AT ?auto_24986 ?auto_25023 ) ( ON ?auto_24986 ?auto_25003 ) ( CLEAR ?auto_24986 ) ( not ( = ?auto_24985 ?auto_24986 ) ) ( not ( = ?auto_24985 ?auto_25003 ) ) ( not ( = ?auto_24986 ?auto_25003 ) ) ( SURFACE-AT ?auto_24984 ?auto_24998 ) ( CLEAR ?auto_24984 ) ( IS-CRATE ?auto_24985 ) ( AVAILABLE ?auto_25001 ) ( AVAILABLE ?auto_25013 ) ( SURFACE-AT ?auto_24985 ?auto_25009 ) ( ON ?auto_24985 ?auto_25024 ) ( CLEAR ?auto_24985 ) ( TRUCK-AT ?auto_25000 ?auto_24998 ) ( not ( = ?auto_24984 ?auto_24985 ) ) ( not ( = ?auto_24984 ?auto_25024 ) ) ( not ( = ?auto_24985 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24986 ) ) ( not ( = ?auto_24984 ?auto_25003 ) ) ( not ( = ?auto_24986 ?auto_25024 ) ) ( not ( = ?auto_25023 ?auto_25009 ) ) ( not ( = ?auto_25007 ?auto_25013 ) ) ( not ( = ?auto_25003 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24987 ) ) ( not ( = ?auto_24984 ?auto_25012 ) ) ( not ( = ?auto_24985 ?auto_24987 ) ) ( not ( = ?auto_24985 ?auto_25012 ) ) ( not ( = ?auto_24987 ?auto_25003 ) ) ( not ( = ?auto_24987 ?auto_25024 ) ) ( not ( = ?auto_25018 ?auto_25023 ) ) ( not ( = ?auto_25018 ?auto_25009 ) ) ( not ( = ?auto_25014 ?auto_25007 ) ) ( not ( = ?auto_25014 ?auto_25013 ) ) ( not ( = ?auto_25012 ?auto_25003 ) ) ( not ( = ?auto_25012 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24988 ) ) ( not ( = ?auto_24984 ?auto_25017 ) ) ( not ( = ?auto_24985 ?auto_24988 ) ) ( not ( = ?auto_24985 ?auto_25017 ) ) ( not ( = ?auto_24986 ?auto_24988 ) ) ( not ( = ?auto_24986 ?auto_25017 ) ) ( not ( = ?auto_24988 ?auto_25012 ) ) ( not ( = ?auto_24988 ?auto_25003 ) ) ( not ( = ?auto_24988 ?auto_25024 ) ) ( not ( = ?auto_25019 ?auto_25018 ) ) ( not ( = ?auto_25019 ?auto_25023 ) ) ( not ( = ?auto_25019 ?auto_25009 ) ) ( not ( = ?auto_25025 ?auto_25014 ) ) ( not ( = ?auto_25025 ?auto_25007 ) ) ( not ( = ?auto_25025 ?auto_25013 ) ) ( not ( = ?auto_25017 ?auto_25012 ) ) ( not ( = ?auto_25017 ?auto_25003 ) ) ( not ( = ?auto_25017 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24989 ) ) ( not ( = ?auto_24984 ?auto_25022 ) ) ( not ( = ?auto_24985 ?auto_24989 ) ) ( not ( = ?auto_24985 ?auto_25022 ) ) ( not ( = ?auto_24986 ?auto_24989 ) ) ( not ( = ?auto_24986 ?auto_25022 ) ) ( not ( = ?auto_24987 ?auto_24989 ) ) ( not ( = ?auto_24987 ?auto_25022 ) ) ( not ( = ?auto_24989 ?auto_25017 ) ) ( not ( = ?auto_24989 ?auto_25012 ) ) ( not ( = ?auto_24989 ?auto_25003 ) ) ( not ( = ?auto_24989 ?auto_25024 ) ) ( not ( = ?auto_25022 ?auto_25017 ) ) ( not ( = ?auto_25022 ?auto_25012 ) ) ( not ( = ?auto_25022 ?auto_25003 ) ) ( not ( = ?auto_25022 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24990 ) ) ( not ( = ?auto_24984 ?auto_25010 ) ) ( not ( = ?auto_24985 ?auto_24990 ) ) ( not ( = ?auto_24985 ?auto_25010 ) ) ( not ( = ?auto_24986 ?auto_24990 ) ) ( not ( = ?auto_24986 ?auto_25010 ) ) ( not ( = ?auto_24987 ?auto_24990 ) ) ( not ( = ?auto_24987 ?auto_25010 ) ) ( not ( = ?auto_24988 ?auto_24990 ) ) ( not ( = ?auto_24988 ?auto_25010 ) ) ( not ( = ?auto_24990 ?auto_25022 ) ) ( not ( = ?auto_24990 ?auto_25017 ) ) ( not ( = ?auto_24990 ?auto_25012 ) ) ( not ( = ?auto_24990 ?auto_25003 ) ) ( not ( = ?auto_24990 ?auto_25024 ) ) ( not ( = ?auto_25010 ?auto_25022 ) ) ( not ( = ?auto_25010 ?auto_25017 ) ) ( not ( = ?auto_25010 ?auto_25012 ) ) ( not ( = ?auto_25010 ?auto_25003 ) ) ( not ( = ?auto_25010 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24991 ) ) ( not ( = ?auto_24984 ?auto_25005 ) ) ( not ( = ?auto_24985 ?auto_24991 ) ) ( not ( = ?auto_24985 ?auto_25005 ) ) ( not ( = ?auto_24986 ?auto_24991 ) ) ( not ( = ?auto_24986 ?auto_25005 ) ) ( not ( = ?auto_24987 ?auto_24991 ) ) ( not ( = ?auto_24987 ?auto_25005 ) ) ( not ( = ?auto_24988 ?auto_24991 ) ) ( not ( = ?auto_24988 ?auto_25005 ) ) ( not ( = ?auto_24989 ?auto_24991 ) ) ( not ( = ?auto_24989 ?auto_25005 ) ) ( not ( = ?auto_24991 ?auto_25010 ) ) ( not ( = ?auto_24991 ?auto_25022 ) ) ( not ( = ?auto_24991 ?auto_25017 ) ) ( not ( = ?auto_24991 ?auto_25012 ) ) ( not ( = ?auto_24991 ?auto_25003 ) ) ( not ( = ?auto_24991 ?auto_25024 ) ) ( not ( = ?auto_25005 ?auto_25010 ) ) ( not ( = ?auto_25005 ?auto_25022 ) ) ( not ( = ?auto_25005 ?auto_25017 ) ) ( not ( = ?auto_25005 ?auto_25012 ) ) ( not ( = ?auto_25005 ?auto_25003 ) ) ( not ( = ?auto_25005 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24992 ) ) ( not ( = ?auto_24984 ?auto_25015 ) ) ( not ( = ?auto_24985 ?auto_24992 ) ) ( not ( = ?auto_24985 ?auto_25015 ) ) ( not ( = ?auto_24986 ?auto_24992 ) ) ( not ( = ?auto_24986 ?auto_25015 ) ) ( not ( = ?auto_24987 ?auto_24992 ) ) ( not ( = ?auto_24987 ?auto_25015 ) ) ( not ( = ?auto_24988 ?auto_24992 ) ) ( not ( = ?auto_24988 ?auto_25015 ) ) ( not ( = ?auto_24989 ?auto_24992 ) ) ( not ( = ?auto_24989 ?auto_25015 ) ) ( not ( = ?auto_24990 ?auto_24992 ) ) ( not ( = ?auto_24990 ?auto_25015 ) ) ( not ( = ?auto_24992 ?auto_25005 ) ) ( not ( = ?auto_24992 ?auto_25010 ) ) ( not ( = ?auto_24992 ?auto_25022 ) ) ( not ( = ?auto_24992 ?auto_25017 ) ) ( not ( = ?auto_24992 ?auto_25012 ) ) ( not ( = ?auto_24992 ?auto_25003 ) ) ( not ( = ?auto_24992 ?auto_25024 ) ) ( not ( = ?auto_25011 ?auto_25018 ) ) ( not ( = ?auto_25011 ?auto_25019 ) ) ( not ( = ?auto_25011 ?auto_25009 ) ) ( not ( = ?auto_25011 ?auto_25023 ) ) ( not ( = ?auto_25006 ?auto_25014 ) ) ( not ( = ?auto_25006 ?auto_25025 ) ) ( not ( = ?auto_25006 ?auto_25013 ) ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25015 ?auto_25005 ) ) ( not ( = ?auto_25015 ?auto_25010 ) ) ( not ( = ?auto_25015 ?auto_25022 ) ) ( not ( = ?auto_25015 ?auto_25017 ) ) ( not ( = ?auto_25015 ?auto_25012 ) ) ( not ( = ?auto_25015 ?auto_25003 ) ) ( not ( = ?auto_25015 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24993 ) ) ( not ( = ?auto_24984 ?auto_25020 ) ) ( not ( = ?auto_24985 ?auto_24993 ) ) ( not ( = ?auto_24985 ?auto_25020 ) ) ( not ( = ?auto_24986 ?auto_24993 ) ) ( not ( = ?auto_24986 ?auto_25020 ) ) ( not ( = ?auto_24987 ?auto_24993 ) ) ( not ( = ?auto_24987 ?auto_25020 ) ) ( not ( = ?auto_24988 ?auto_24993 ) ) ( not ( = ?auto_24988 ?auto_25020 ) ) ( not ( = ?auto_24989 ?auto_24993 ) ) ( not ( = ?auto_24989 ?auto_25020 ) ) ( not ( = ?auto_24990 ?auto_24993 ) ) ( not ( = ?auto_24990 ?auto_25020 ) ) ( not ( = ?auto_24991 ?auto_24993 ) ) ( not ( = ?auto_24991 ?auto_25020 ) ) ( not ( = ?auto_24993 ?auto_25015 ) ) ( not ( = ?auto_24993 ?auto_25005 ) ) ( not ( = ?auto_24993 ?auto_25010 ) ) ( not ( = ?auto_24993 ?auto_25022 ) ) ( not ( = ?auto_24993 ?auto_25017 ) ) ( not ( = ?auto_24993 ?auto_25012 ) ) ( not ( = ?auto_24993 ?auto_25003 ) ) ( not ( = ?auto_24993 ?auto_25024 ) ) ( not ( = ?auto_25021 ?auto_25011 ) ) ( not ( = ?auto_25021 ?auto_25018 ) ) ( not ( = ?auto_25021 ?auto_25019 ) ) ( not ( = ?auto_25021 ?auto_25009 ) ) ( not ( = ?auto_25021 ?auto_25023 ) ) ( not ( = ?auto_25004 ?auto_25006 ) ) ( not ( = ?auto_25004 ?auto_25014 ) ) ( not ( = ?auto_25004 ?auto_25025 ) ) ( not ( = ?auto_25004 ?auto_25013 ) ) ( not ( = ?auto_25004 ?auto_25007 ) ) ( not ( = ?auto_25020 ?auto_25015 ) ) ( not ( = ?auto_25020 ?auto_25005 ) ) ( not ( = ?auto_25020 ?auto_25010 ) ) ( not ( = ?auto_25020 ?auto_25022 ) ) ( not ( = ?auto_25020 ?auto_25017 ) ) ( not ( = ?auto_25020 ?auto_25012 ) ) ( not ( = ?auto_25020 ?auto_25003 ) ) ( not ( = ?auto_25020 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24994 ) ) ( not ( = ?auto_24984 ?auto_25008 ) ) ( not ( = ?auto_24985 ?auto_24994 ) ) ( not ( = ?auto_24985 ?auto_25008 ) ) ( not ( = ?auto_24986 ?auto_24994 ) ) ( not ( = ?auto_24986 ?auto_25008 ) ) ( not ( = ?auto_24987 ?auto_24994 ) ) ( not ( = ?auto_24987 ?auto_25008 ) ) ( not ( = ?auto_24988 ?auto_24994 ) ) ( not ( = ?auto_24988 ?auto_25008 ) ) ( not ( = ?auto_24989 ?auto_24994 ) ) ( not ( = ?auto_24989 ?auto_25008 ) ) ( not ( = ?auto_24990 ?auto_24994 ) ) ( not ( = ?auto_24990 ?auto_25008 ) ) ( not ( = ?auto_24991 ?auto_24994 ) ) ( not ( = ?auto_24991 ?auto_25008 ) ) ( not ( = ?auto_24992 ?auto_24994 ) ) ( not ( = ?auto_24992 ?auto_25008 ) ) ( not ( = ?auto_24994 ?auto_25020 ) ) ( not ( = ?auto_24994 ?auto_25015 ) ) ( not ( = ?auto_24994 ?auto_25005 ) ) ( not ( = ?auto_24994 ?auto_25010 ) ) ( not ( = ?auto_24994 ?auto_25022 ) ) ( not ( = ?auto_24994 ?auto_25017 ) ) ( not ( = ?auto_24994 ?auto_25012 ) ) ( not ( = ?auto_24994 ?auto_25003 ) ) ( not ( = ?auto_24994 ?auto_25024 ) ) ( not ( = ?auto_25008 ?auto_25020 ) ) ( not ( = ?auto_25008 ?auto_25015 ) ) ( not ( = ?auto_25008 ?auto_25005 ) ) ( not ( = ?auto_25008 ?auto_25010 ) ) ( not ( = ?auto_25008 ?auto_25022 ) ) ( not ( = ?auto_25008 ?auto_25017 ) ) ( not ( = ?auto_25008 ?auto_25012 ) ) ( not ( = ?auto_25008 ?auto_25003 ) ) ( not ( = ?auto_25008 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24995 ) ) ( not ( = ?auto_24984 ?auto_25016 ) ) ( not ( = ?auto_24985 ?auto_24995 ) ) ( not ( = ?auto_24985 ?auto_25016 ) ) ( not ( = ?auto_24986 ?auto_24995 ) ) ( not ( = ?auto_24986 ?auto_25016 ) ) ( not ( = ?auto_24987 ?auto_24995 ) ) ( not ( = ?auto_24987 ?auto_25016 ) ) ( not ( = ?auto_24988 ?auto_24995 ) ) ( not ( = ?auto_24988 ?auto_25016 ) ) ( not ( = ?auto_24989 ?auto_24995 ) ) ( not ( = ?auto_24989 ?auto_25016 ) ) ( not ( = ?auto_24990 ?auto_24995 ) ) ( not ( = ?auto_24990 ?auto_25016 ) ) ( not ( = ?auto_24991 ?auto_24995 ) ) ( not ( = ?auto_24991 ?auto_25016 ) ) ( not ( = ?auto_24992 ?auto_24995 ) ) ( not ( = ?auto_24992 ?auto_25016 ) ) ( not ( = ?auto_24993 ?auto_24995 ) ) ( not ( = ?auto_24993 ?auto_25016 ) ) ( not ( = ?auto_24995 ?auto_25008 ) ) ( not ( = ?auto_24995 ?auto_25020 ) ) ( not ( = ?auto_24995 ?auto_25015 ) ) ( not ( = ?auto_24995 ?auto_25005 ) ) ( not ( = ?auto_24995 ?auto_25010 ) ) ( not ( = ?auto_24995 ?auto_25022 ) ) ( not ( = ?auto_24995 ?auto_25017 ) ) ( not ( = ?auto_24995 ?auto_25012 ) ) ( not ( = ?auto_24995 ?auto_25003 ) ) ( not ( = ?auto_24995 ?auto_25024 ) ) ( not ( = ?auto_25016 ?auto_25008 ) ) ( not ( = ?auto_25016 ?auto_25020 ) ) ( not ( = ?auto_25016 ?auto_25015 ) ) ( not ( = ?auto_25016 ?auto_25005 ) ) ( not ( = ?auto_25016 ?auto_25010 ) ) ( not ( = ?auto_25016 ?auto_25022 ) ) ( not ( = ?auto_25016 ?auto_25017 ) ) ( not ( = ?auto_25016 ?auto_25012 ) ) ( not ( = ?auto_25016 ?auto_25003 ) ) ( not ( = ?auto_25016 ?auto_25024 ) ) ( not ( = ?auto_24984 ?auto_24996 ) ) ( not ( = ?auto_24984 ?auto_24999 ) ) ( not ( = ?auto_24985 ?auto_24996 ) ) ( not ( = ?auto_24985 ?auto_24999 ) ) ( not ( = ?auto_24986 ?auto_24996 ) ) ( not ( = ?auto_24986 ?auto_24999 ) ) ( not ( = ?auto_24987 ?auto_24996 ) ) ( not ( = ?auto_24987 ?auto_24999 ) ) ( not ( = ?auto_24988 ?auto_24996 ) ) ( not ( = ?auto_24988 ?auto_24999 ) ) ( not ( = ?auto_24989 ?auto_24996 ) ) ( not ( = ?auto_24989 ?auto_24999 ) ) ( not ( = ?auto_24990 ?auto_24996 ) ) ( not ( = ?auto_24990 ?auto_24999 ) ) ( not ( = ?auto_24991 ?auto_24996 ) ) ( not ( = ?auto_24991 ?auto_24999 ) ) ( not ( = ?auto_24992 ?auto_24996 ) ) ( not ( = ?auto_24992 ?auto_24999 ) ) ( not ( = ?auto_24993 ?auto_24996 ) ) ( not ( = ?auto_24993 ?auto_24999 ) ) ( not ( = ?auto_24994 ?auto_24996 ) ) ( not ( = ?auto_24994 ?auto_24999 ) ) ( not ( = ?auto_24996 ?auto_25016 ) ) ( not ( = ?auto_24996 ?auto_25008 ) ) ( not ( = ?auto_24996 ?auto_25020 ) ) ( not ( = ?auto_24996 ?auto_25015 ) ) ( not ( = ?auto_24996 ?auto_25005 ) ) ( not ( = ?auto_24996 ?auto_25010 ) ) ( not ( = ?auto_24996 ?auto_25022 ) ) ( not ( = ?auto_24996 ?auto_25017 ) ) ( not ( = ?auto_24996 ?auto_25012 ) ) ( not ( = ?auto_24996 ?auto_25003 ) ) ( not ( = ?auto_24996 ?auto_25024 ) ) ( not ( = ?auto_24997 ?auto_25018 ) ) ( not ( = ?auto_24997 ?auto_25023 ) ) ( not ( = ?auto_24997 ?auto_25021 ) ) ( not ( = ?auto_24997 ?auto_25011 ) ) ( not ( = ?auto_24997 ?auto_25019 ) ) ( not ( = ?auto_24997 ?auto_25009 ) ) ( not ( = ?auto_25002 ?auto_25014 ) ) ( not ( = ?auto_25002 ?auto_25007 ) ) ( not ( = ?auto_25002 ?auto_25004 ) ) ( not ( = ?auto_25002 ?auto_25006 ) ) ( not ( = ?auto_25002 ?auto_25025 ) ) ( not ( = ?auto_25002 ?auto_25013 ) ) ( not ( = ?auto_24999 ?auto_25016 ) ) ( not ( = ?auto_24999 ?auto_25008 ) ) ( not ( = ?auto_24999 ?auto_25020 ) ) ( not ( = ?auto_24999 ?auto_25015 ) ) ( not ( = ?auto_24999 ?auto_25005 ) ) ( not ( = ?auto_24999 ?auto_25010 ) ) ( not ( = ?auto_24999 ?auto_25022 ) ) ( not ( = ?auto_24999 ?auto_25017 ) ) ( not ( = ?auto_24999 ?auto_25012 ) ) ( not ( = ?auto_24999 ?auto_25003 ) ) ( not ( = ?auto_24999 ?auto_25024 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_24984 ?auto_24985 ?auto_24986 ?auto_24987 ?auto_24988 ?auto_24989 ?auto_24990 ?auto_24991 ?auto_24992 ?auto_24993 ?auto_24994 ?auto_24995 )
      ( MAKE-1CRATE ?auto_24995 ?auto_24996 )
      ( MAKE-12CRATE-VERIFY ?auto_24984 ?auto_24985 ?auto_24986 ?auto_24987 ?auto_24988 ?auto_24989 ?auto_24990 ?auto_24991 ?auto_24992 ?auto_24993 ?auto_24994 ?auto_24995 ?auto_24996 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_25050 - SURFACE
      ?auto_25051 - SURFACE
      ?auto_25052 - SURFACE
      ?auto_25053 - SURFACE
      ?auto_25054 - SURFACE
      ?auto_25055 - SURFACE
      ?auto_25056 - SURFACE
      ?auto_25057 - SURFACE
      ?auto_25058 - SURFACE
      ?auto_25059 - SURFACE
      ?auto_25060 - SURFACE
      ?auto_25061 - SURFACE
      ?auto_25062 - SURFACE
      ?auto_25063 - SURFACE
    )
    :vars
    (
      ?auto_25067 - HOIST
      ?auto_25064 - PLACE
      ?auto_25066 - PLACE
      ?auto_25069 - HOIST
      ?auto_25068 - SURFACE
      ?auto_25095 - PLACE
      ?auto_25083 - HOIST
      ?auto_25079 - SURFACE
      ?auto_25084 - PLACE
      ?auto_25092 - HOIST
      ?auto_25085 - SURFACE
      ?auto_25086 - PLACE
      ?auto_25075 - HOIST
      ?auto_25077 - SURFACE
      ?auto_25070 - PLACE
      ?auto_25074 - HOIST
      ?auto_25073 - SURFACE
      ?auto_25087 - PLACE
      ?auto_25081 - HOIST
      ?auto_25089 - SURFACE
      ?auto_25078 - SURFACE
      ?auto_25090 - PLACE
      ?auto_25088 - HOIST
      ?auto_25093 - SURFACE
      ?auto_25076 - PLACE
      ?auto_25082 - HOIST
      ?auto_25072 - SURFACE
      ?auto_25071 - SURFACE
      ?auto_25080 - SURFACE
      ?auto_25094 - SURFACE
      ?auto_25091 - SURFACE
      ?auto_25065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25067 ?auto_25064 ) ( IS-CRATE ?auto_25063 ) ( not ( = ?auto_25066 ?auto_25064 ) ) ( HOIST-AT ?auto_25069 ?auto_25066 ) ( AVAILABLE ?auto_25069 ) ( SURFACE-AT ?auto_25063 ?auto_25066 ) ( ON ?auto_25063 ?auto_25068 ) ( CLEAR ?auto_25063 ) ( not ( = ?auto_25062 ?auto_25063 ) ) ( not ( = ?auto_25062 ?auto_25068 ) ) ( not ( = ?auto_25063 ?auto_25068 ) ) ( not ( = ?auto_25067 ?auto_25069 ) ) ( IS-CRATE ?auto_25062 ) ( not ( = ?auto_25095 ?auto_25064 ) ) ( HOIST-AT ?auto_25083 ?auto_25095 ) ( AVAILABLE ?auto_25083 ) ( SURFACE-AT ?auto_25062 ?auto_25095 ) ( ON ?auto_25062 ?auto_25079 ) ( CLEAR ?auto_25062 ) ( not ( = ?auto_25061 ?auto_25062 ) ) ( not ( = ?auto_25061 ?auto_25079 ) ) ( not ( = ?auto_25062 ?auto_25079 ) ) ( not ( = ?auto_25067 ?auto_25083 ) ) ( IS-CRATE ?auto_25061 ) ( not ( = ?auto_25084 ?auto_25064 ) ) ( HOIST-AT ?auto_25092 ?auto_25084 ) ( SURFACE-AT ?auto_25061 ?auto_25084 ) ( ON ?auto_25061 ?auto_25085 ) ( CLEAR ?auto_25061 ) ( not ( = ?auto_25060 ?auto_25061 ) ) ( not ( = ?auto_25060 ?auto_25085 ) ) ( not ( = ?auto_25061 ?auto_25085 ) ) ( not ( = ?auto_25067 ?auto_25092 ) ) ( IS-CRATE ?auto_25060 ) ( not ( = ?auto_25086 ?auto_25064 ) ) ( HOIST-AT ?auto_25075 ?auto_25086 ) ( SURFACE-AT ?auto_25060 ?auto_25086 ) ( ON ?auto_25060 ?auto_25077 ) ( CLEAR ?auto_25060 ) ( not ( = ?auto_25059 ?auto_25060 ) ) ( not ( = ?auto_25059 ?auto_25077 ) ) ( not ( = ?auto_25060 ?auto_25077 ) ) ( not ( = ?auto_25067 ?auto_25075 ) ) ( IS-CRATE ?auto_25059 ) ( not ( = ?auto_25070 ?auto_25064 ) ) ( HOIST-AT ?auto_25074 ?auto_25070 ) ( AVAILABLE ?auto_25074 ) ( SURFACE-AT ?auto_25059 ?auto_25070 ) ( ON ?auto_25059 ?auto_25073 ) ( CLEAR ?auto_25059 ) ( not ( = ?auto_25058 ?auto_25059 ) ) ( not ( = ?auto_25058 ?auto_25073 ) ) ( not ( = ?auto_25059 ?auto_25073 ) ) ( not ( = ?auto_25067 ?auto_25074 ) ) ( IS-CRATE ?auto_25058 ) ( not ( = ?auto_25087 ?auto_25064 ) ) ( HOIST-AT ?auto_25081 ?auto_25087 ) ( AVAILABLE ?auto_25081 ) ( SURFACE-AT ?auto_25058 ?auto_25087 ) ( ON ?auto_25058 ?auto_25089 ) ( CLEAR ?auto_25058 ) ( not ( = ?auto_25057 ?auto_25058 ) ) ( not ( = ?auto_25057 ?auto_25089 ) ) ( not ( = ?auto_25058 ?auto_25089 ) ) ( not ( = ?auto_25067 ?auto_25081 ) ) ( IS-CRATE ?auto_25057 ) ( SURFACE-AT ?auto_25057 ?auto_25084 ) ( ON ?auto_25057 ?auto_25078 ) ( CLEAR ?auto_25057 ) ( not ( = ?auto_25056 ?auto_25057 ) ) ( not ( = ?auto_25056 ?auto_25078 ) ) ( not ( = ?auto_25057 ?auto_25078 ) ) ( IS-CRATE ?auto_25056 ) ( not ( = ?auto_25090 ?auto_25064 ) ) ( HOIST-AT ?auto_25088 ?auto_25090 ) ( SURFACE-AT ?auto_25056 ?auto_25090 ) ( ON ?auto_25056 ?auto_25093 ) ( CLEAR ?auto_25056 ) ( not ( = ?auto_25055 ?auto_25056 ) ) ( not ( = ?auto_25055 ?auto_25093 ) ) ( not ( = ?auto_25056 ?auto_25093 ) ) ( not ( = ?auto_25067 ?auto_25088 ) ) ( IS-CRATE ?auto_25055 ) ( not ( = ?auto_25076 ?auto_25064 ) ) ( HOIST-AT ?auto_25082 ?auto_25076 ) ( SURFACE-AT ?auto_25055 ?auto_25076 ) ( ON ?auto_25055 ?auto_25072 ) ( CLEAR ?auto_25055 ) ( not ( = ?auto_25054 ?auto_25055 ) ) ( not ( = ?auto_25054 ?auto_25072 ) ) ( not ( = ?auto_25055 ?auto_25072 ) ) ( not ( = ?auto_25067 ?auto_25082 ) ) ( IS-CRATE ?auto_25054 ) ( AVAILABLE ?auto_25088 ) ( SURFACE-AT ?auto_25054 ?auto_25090 ) ( ON ?auto_25054 ?auto_25071 ) ( CLEAR ?auto_25054 ) ( not ( = ?auto_25053 ?auto_25054 ) ) ( not ( = ?auto_25053 ?auto_25071 ) ) ( not ( = ?auto_25054 ?auto_25071 ) ) ( IS-CRATE ?auto_25053 ) ( AVAILABLE ?auto_25092 ) ( SURFACE-AT ?auto_25053 ?auto_25084 ) ( ON ?auto_25053 ?auto_25080 ) ( CLEAR ?auto_25053 ) ( not ( = ?auto_25052 ?auto_25053 ) ) ( not ( = ?auto_25052 ?auto_25080 ) ) ( not ( = ?auto_25053 ?auto_25080 ) ) ( IS-CRATE ?auto_25052 ) ( AVAILABLE ?auto_25075 ) ( SURFACE-AT ?auto_25052 ?auto_25086 ) ( ON ?auto_25052 ?auto_25094 ) ( CLEAR ?auto_25052 ) ( not ( = ?auto_25051 ?auto_25052 ) ) ( not ( = ?auto_25051 ?auto_25094 ) ) ( not ( = ?auto_25052 ?auto_25094 ) ) ( SURFACE-AT ?auto_25050 ?auto_25064 ) ( CLEAR ?auto_25050 ) ( IS-CRATE ?auto_25051 ) ( AVAILABLE ?auto_25067 ) ( AVAILABLE ?auto_25082 ) ( SURFACE-AT ?auto_25051 ?auto_25076 ) ( ON ?auto_25051 ?auto_25091 ) ( CLEAR ?auto_25051 ) ( TRUCK-AT ?auto_25065 ?auto_25064 ) ( not ( = ?auto_25050 ?auto_25051 ) ) ( not ( = ?auto_25050 ?auto_25091 ) ) ( not ( = ?auto_25051 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25052 ) ) ( not ( = ?auto_25050 ?auto_25094 ) ) ( not ( = ?auto_25052 ?auto_25091 ) ) ( not ( = ?auto_25086 ?auto_25076 ) ) ( not ( = ?auto_25075 ?auto_25082 ) ) ( not ( = ?auto_25094 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25053 ) ) ( not ( = ?auto_25050 ?auto_25080 ) ) ( not ( = ?auto_25051 ?auto_25053 ) ) ( not ( = ?auto_25051 ?auto_25080 ) ) ( not ( = ?auto_25053 ?auto_25094 ) ) ( not ( = ?auto_25053 ?auto_25091 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( not ( = ?auto_25084 ?auto_25076 ) ) ( not ( = ?auto_25092 ?auto_25075 ) ) ( not ( = ?auto_25092 ?auto_25082 ) ) ( not ( = ?auto_25080 ?auto_25094 ) ) ( not ( = ?auto_25080 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25054 ) ) ( not ( = ?auto_25050 ?auto_25071 ) ) ( not ( = ?auto_25051 ?auto_25054 ) ) ( not ( = ?auto_25051 ?auto_25071 ) ) ( not ( = ?auto_25052 ?auto_25054 ) ) ( not ( = ?auto_25052 ?auto_25071 ) ) ( not ( = ?auto_25054 ?auto_25080 ) ) ( not ( = ?auto_25054 ?auto_25094 ) ) ( not ( = ?auto_25054 ?auto_25091 ) ) ( not ( = ?auto_25090 ?auto_25084 ) ) ( not ( = ?auto_25090 ?auto_25086 ) ) ( not ( = ?auto_25090 ?auto_25076 ) ) ( not ( = ?auto_25088 ?auto_25092 ) ) ( not ( = ?auto_25088 ?auto_25075 ) ) ( not ( = ?auto_25088 ?auto_25082 ) ) ( not ( = ?auto_25071 ?auto_25080 ) ) ( not ( = ?auto_25071 ?auto_25094 ) ) ( not ( = ?auto_25071 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25055 ) ) ( not ( = ?auto_25050 ?auto_25072 ) ) ( not ( = ?auto_25051 ?auto_25055 ) ) ( not ( = ?auto_25051 ?auto_25072 ) ) ( not ( = ?auto_25052 ?auto_25055 ) ) ( not ( = ?auto_25052 ?auto_25072 ) ) ( not ( = ?auto_25053 ?auto_25055 ) ) ( not ( = ?auto_25053 ?auto_25072 ) ) ( not ( = ?auto_25055 ?auto_25071 ) ) ( not ( = ?auto_25055 ?auto_25080 ) ) ( not ( = ?auto_25055 ?auto_25094 ) ) ( not ( = ?auto_25055 ?auto_25091 ) ) ( not ( = ?auto_25072 ?auto_25071 ) ) ( not ( = ?auto_25072 ?auto_25080 ) ) ( not ( = ?auto_25072 ?auto_25094 ) ) ( not ( = ?auto_25072 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25056 ) ) ( not ( = ?auto_25050 ?auto_25093 ) ) ( not ( = ?auto_25051 ?auto_25056 ) ) ( not ( = ?auto_25051 ?auto_25093 ) ) ( not ( = ?auto_25052 ?auto_25056 ) ) ( not ( = ?auto_25052 ?auto_25093 ) ) ( not ( = ?auto_25053 ?auto_25056 ) ) ( not ( = ?auto_25053 ?auto_25093 ) ) ( not ( = ?auto_25054 ?auto_25056 ) ) ( not ( = ?auto_25054 ?auto_25093 ) ) ( not ( = ?auto_25056 ?auto_25072 ) ) ( not ( = ?auto_25056 ?auto_25071 ) ) ( not ( = ?auto_25056 ?auto_25080 ) ) ( not ( = ?auto_25056 ?auto_25094 ) ) ( not ( = ?auto_25056 ?auto_25091 ) ) ( not ( = ?auto_25093 ?auto_25072 ) ) ( not ( = ?auto_25093 ?auto_25071 ) ) ( not ( = ?auto_25093 ?auto_25080 ) ) ( not ( = ?auto_25093 ?auto_25094 ) ) ( not ( = ?auto_25093 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25057 ) ) ( not ( = ?auto_25050 ?auto_25078 ) ) ( not ( = ?auto_25051 ?auto_25057 ) ) ( not ( = ?auto_25051 ?auto_25078 ) ) ( not ( = ?auto_25052 ?auto_25057 ) ) ( not ( = ?auto_25052 ?auto_25078 ) ) ( not ( = ?auto_25053 ?auto_25057 ) ) ( not ( = ?auto_25053 ?auto_25078 ) ) ( not ( = ?auto_25054 ?auto_25057 ) ) ( not ( = ?auto_25054 ?auto_25078 ) ) ( not ( = ?auto_25055 ?auto_25057 ) ) ( not ( = ?auto_25055 ?auto_25078 ) ) ( not ( = ?auto_25057 ?auto_25093 ) ) ( not ( = ?auto_25057 ?auto_25072 ) ) ( not ( = ?auto_25057 ?auto_25071 ) ) ( not ( = ?auto_25057 ?auto_25080 ) ) ( not ( = ?auto_25057 ?auto_25094 ) ) ( not ( = ?auto_25057 ?auto_25091 ) ) ( not ( = ?auto_25078 ?auto_25093 ) ) ( not ( = ?auto_25078 ?auto_25072 ) ) ( not ( = ?auto_25078 ?auto_25071 ) ) ( not ( = ?auto_25078 ?auto_25080 ) ) ( not ( = ?auto_25078 ?auto_25094 ) ) ( not ( = ?auto_25078 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25058 ) ) ( not ( = ?auto_25050 ?auto_25089 ) ) ( not ( = ?auto_25051 ?auto_25058 ) ) ( not ( = ?auto_25051 ?auto_25089 ) ) ( not ( = ?auto_25052 ?auto_25058 ) ) ( not ( = ?auto_25052 ?auto_25089 ) ) ( not ( = ?auto_25053 ?auto_25058 ) ) ( not ( = ?auto_25053 ?auto_25089 ) ) ( not ( = ?auto_25054 ?auto_25058 ) ) ( not ( = ?auto_25054 ?auto_25089 ) ) ( not ( = ?auto_25055 ?auto_25058 ) ) ( not ( = ?auto_25055 ?auto_25089 ) ) ( not ( = ?auto_25056 ?auto_25058 ) ) ( not ( = ?auto_25056 ?auto_25089 ) ) ( not ( = ?auto_25058 ?auto_25078 ) ) ( not ( = ?auto_25058 ?auto_25093 ) ) ( not ( = ?auto_25058 ?auto_25072 ) ) ( not ( = ?auto_25058 ?auto_25071 ) ) ( not ( = ?auto_25058 ?auto_25080 ) ) ( not ( = ?auto_25058 ?auto_25094 ) ) ( not ( = ?auto_25058 ?auto_25091 ) ) ( not ( = ?auto_25087 ?auto_25084 ) ) ( not ( = ?auto_25087 ?auto_25090 ) ) ( not ( = ?auto_25087 ?auto_25076 ) ) ( not ( = ?auto_25087 ?auto_25086 ) ) ( not ( = ?auto_25081 ?auto_25092 ) ) ( not ( = ?auto_25081 ?auto_25088 ) ) ( not ( = ?auto_25081 ?auto_25082 ) ) ( not ( = ?auto_25081 ?auto_25075 ) ) ( not ( = ?auto_25089 ?auto_25078 ) ) ( not ( = ?auto_25089 ?auto_25093 ) ) ( not ( = ?auto_25089 ?auto_25072 ) ) ( not ( = ?auto_25089 ?auto_25071 ) ) ( not ( = ?auto_25089 ?auto_25080 ) ) ( not ( = ?auto_25089 ?auto_25094 ) ) ( not ( = ?auto_25089 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25059 ) ) ( not ( = ?auto_25050 ?auto_25073 ) ) ( not ( = ?auto_25051 ?auto_25059 ) ) ( not ( = ?auto_25051 ?auto_25073 ) ) ( not ( = ?auto_25052 ?auto_25059 ) ) ( not ( = ?auto_25052 ?auto_25073 ) ) ( not ( = ?auto_25053 ?auto_25059 ) ) ( not ( = ?auto_25053 ?auto_25073 ) ) ( not ( = ?auto_25054 ?auto_25059 ) ) ( not ( = ?auto_25054 ?auto_25073 ) ) ( not ( = ?auto_25055 ?auto_25059 ) ) ( not ( = ?auto_25055 ?auto_25073 ) ) ( not ( = ?auto_25056 ?auto_25059 ) ) ( not ( = ?auto_25056 ?auto_25073 ) ) ( not ( = ?auto_25057 ?auto_25059 ) ) ( not ( = ?auto_25057 ?auto_25073 ) ) ( not ( = ?auto_25059 ?auto_25089 ) ) ( not ( = ?auto_25059 ?auto_25078 ) ) ( not ( = ?auto_25059 ?auto_25093 ) ) ( not ( = ?auto_25059 ?auto_25072 ) ) ( not ( = ?auto_25059 ?auto_25071 ) ) ( not ( = ?auto_25059 ?auto_25080 ) ) ( not ( = ?auto_25059 ?auto_25094 ) ) ( not ( = ?auto_25059 ?auto_25091 ) ) ( not ( = ?auto_25070 ?auto_25087 ) ) ( not ( = ?auto_25070 ?auto_25084 ) ) ( not ( = ?auto_25070 ?auto_25090 ) ) ( not ( = ?auto_25070 ?auto_25076 ) ) ( not ( = ?auto_25070 ?auto_25086 ) ) ( not ( = ?auto_25074 ?auto_25081 ) ) ( not ( = ?auto_25074 ?auto_25092 ) ) ( not ( = ?auto_25074 ?auto_25088 ) ) ( not ( = ?auto_25074 ?auto_25082 ) ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25073 ?auto_25089 ) ) ( not ( = ?auto_25073 ?auto_25078 ) ) ( not ( = ?auto_25073 ?auto_25093 ) ) ( not ( = ?auto_25073 ?auto_25072 ) ) ( not ( = ?auto_25073 ?auto_25071 ) ) ( not ( = ?auto_25073 ?auto_25080 ) ) ( not ( = ?auto_25073 ?auto_25094 ) ) ( not ( = ?auto_25073 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25060 ) ) ( not ( = ?auto_25050 ?auto_25077 ) ) ( not ( = ?auto_25051 ?auto_25060 ) ) ( not ( = ?auto_25051 ?auto_25077 ) ) ( not ( = ?auto_25052 ?auto_25060 ) ) ( not ( = ?auto_25052 ?auto_25077 ) ) ( not ( = ?auto_25053 ?auto_25060 ) ) ( not ( = ?auto_25053 ?auto_25077 ) ) ( not ( = ?auto_25054 ?auto_25060 ) ) ( not ( = ?auto_25054 ?auto_25077 ) ) ( not ( = ?auto_25055 ?auto_25060 ) ) ( not ( = ?auto_25055 ?auto_25077 ) ) ( not ( = ?auto_25056 ?auto_25060 ) ) ( not ( = ?auto_25056 ?auto_25077 ) ) ( not ( = ?auto_25057 ?auto_25060 ) ) ( not ( = ?auto_25057 ?auto_25077 ) ) ( not ( = ?auto_25058 ?auto_25060 ) ) ( not ( = ?auto_25058 ?auto_25077 ) ) ( not ( = ?auto_25060 ?auto_25073 ) ) ( not ( = ?auto_25060 ?auto_25089 ) ) ( not ( = ?auto_25060 ?auto_25078 ) ) ( not ( = ?auto_25060 ?auto_25093 ) ) ( not ( = ?auto_25060 ?auto_25072 ) ) ( not ( = ?auto_25060 ?auto_25071 ) ) ( not ( = ?auto_25060 ?auto_25080 ) ) ( not ( = ?auto_25060 ?auto_25094 ) ) ( not ( = ?auto_25060 ?auto_25091 ) ) ( not ( = ?auto_25077 ?auto_25073 ) ) ( not ( = ?auto_25077 ?auto_25089 ) ) ( not ( = ?auto_25077 ?auto_25078 ) ) ( not ( = ?auto_25077 ?auto_25093 ) ) ( not ( = ?auto_25077 ?auto_25072 ) ) ( not ( = ?auto_25077 ?auto_25071 ) ) ( not ( = ?auto_25077 ?auto_25080 ) ) ( not ( = ?auto_25077 ?auto_25094 ) ) ( not ( = ?auto_25077 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25061 ) ) ( not ( = ?auto_25050 ?auto_25085 ) ) ( not ( = ?auto_25051 ?auto_25061 ) ) ( not ( = ?auto_25051 ?auto_25085 ) ) ( not ( = ?auto_25052 ?auto_25061 ) ) ( not ( = ?auto_25052 ?auto_25085 ) ) ( not ( = ?auto_25053 ?auto_25061 ) ) ( not ( = ?auto_25053 ?auto_25085 ) ) ( not ( = ?auto_25054 ?auto_25061 ) ) ( not ( = ?auto_25054 ?auto_25085 ) ) ( not ( = ?auto_25055 ?auto_25061 ) ) ( not ( = ?auto_25055 ?auto_25085 ) ) ( not ( = ?auto_25056 ?auto_25061 ) ) ( not ( = ?auto_25056 ?auto_25085 ) ) ( not ( = ?auto_25057 ?auto_25061 ) ) ( not ( = ?auto_25057 ?auto_25085 ) ) ( not ( = ?auto_25058 ?auto_25061 ) ) ( not ( = ?auto_25058 ?auto_25085 ) ) ( not ( = ?auto_25059 ?auto_25061 ) ) ( not ( = ?auto_25059 ?auto_25085 ) ) ( not ( = ?auto_25061 ?auto_25077 ) ) ( not ( = ?auto_25061 ?auto_25073 ) ) ( not ( = ?auto_25061 ?auto_25089 ) ) ( not ( = ?auto_25061 ?auto_25078 ) ) ( not ( = ?auto_25061 ?auto_25093 ) ) ( not ( = ?auto_25061 ?auto_25072 ) ) ( not ( = ?auto_25061 ?auto_25071 ) ) ( not ( = ?auto_25061 ?auto_25080 ) ) ( not ( = ?auto_25061 ?auto_25094 ) ) ( not ( = ?auto_25061 ?auto_25091 ) ) ( not ( = ?auto_25085 ?auto_25077 ) ) ( not ( = ?auto_25085 ?auto_25073 ) ) ( not ( = ?auto_25085 ?auto_25089 ) ) ( not ( = ?auto_25085 ?auto_25078 ) ) ( not ( = ?auto_25085 ?auto_25093 ) ) ( not ( = ?auto_25085 ?auto_25072 ) ) ( not ( = ?auto_25085 ?auto_25071 ) ) ( not ( = ?auto_25085 ?auto_25080 ) ) ( not ( = ?auto_25085 ?auto_25094 ) ) ( not ( = ?auto_25085 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25062 ) ) ( not ( = ?auto_25050 ?auto_25079 ) ) ( not ( = ?auto_25051 ?auto_25062 ) ) ( not ( = ?auto_25051 ?auto_25079 ) ) ( not ( = ?auto_25052 ?auto_25062 ) ) ( not ( = ?auto_25052 ?auto_25079 ) ) ( not ( = ?auto_25053 ?auto_25062 ) ) ( not ( = ?auto_25053 ?auto_25079 ) ) ( not ( = ?auto_25054 ?auto_25062 ) ) ( not ( = ?auto_25054 ?auto_25079 ) ) ( not ( = ?auto_25055 ?auto_25062 ) ) ( not ( = ?auto_25055 ?auto_25079 ) ) ( not ( = ?auto_25056 ?auto_25062 ) ) ( not ( = ?auto_25056 ?auto_25079 ) ) ( not ( = ?auto_25057 ?auto_25062 ) ) ( not ( = ?auto_25057 ?auto_25079 ) ) ( not ( = ?auto_25058 ?auto_25062 ) ) ( not ( = ?auto_25058 ?auto_25079 ) ) ( not ( = ?auto_25059 ?auto_25062 ) ) ( not ( = ?auto_25059 ?auto_25079 ) ) ( not ( = ?auto_25060 ?auto_25062 ) ) ( not ( = ?auto_25060 ?auto_25079 ) ) ( not ( = ?auto_25062 ?auto_25085 ) ) ( not ( = ?auto_25062 ?auto_25077 ) ) ( not ( = ?auto_25062 ?auto_25073 ) ) ( not ( = ?auto_25062 ?auto_25089 ) ) ( not ( = ?auto_25062 ?auto_25078 ) ) ( not ( = ?auto_25062 ?auto_25093 ) ) ( not ( = ?auto_25062 ?auto_25072 ) ) ( not ( = ?auto_25062 ?auto_25071 ) ) ( not ( = ?auto_25062 ?auto_25080 ) ) ( not ( = ?auto_25062 ?auto_25094 ) ) ( not ( = ?auto_25062 ?auto_25091 ) ) ( not ( = ?auto_25095 ?auto_25084 ) ) ( not ( = ?auto_25095 ?auto_25086 ) ) ( not ( = ?auto_25095 ?auto_25070 ) ) ( not ( = ?auto_25095 ?auto_25087 ) ) ( not ( = ?auto_25095 ?auto_25090 ) ) ( not ( = ?auto_25095 ?auto_25076 ) ) ( not ( = ?auto_25083 ?auto_25092 ) ) ( not ( = ?auto_25083 ?auto_25075 ) ) ( not ( = ?auto_25083 ?auto_25074 ) ) ( not ( = ?auto_25083 ?auto_25081 ) ) ( not ( = ?auto_25083 ?auto_25088 ) ) ( not ( = ?auto_25083 ?auto_25082 ) ) ( not ( = ?auto_25079 ?auto_25085 ) ) ( not ( = ?auto_25079 ?auto_25077 ) ) ( not ( = ?auto_25079 ?auto_25073 ) ) ( not ( = ?auto_25079 ?auto_25089 ) ) ( not ( = ?auto_25079 ?auto_25078 ) ) ( not ( = ?auto_25079 ?auto_25093 ) ) ( not ( = ?auto_25079 ?auto_25072 ) ) ( not ( = ?auto_25079 ?auto_25071 ) ) ( not ( = ?auto_25079 ?auto_25080 ) ) ( not ( = ?auto_25079 ?auto_25094 ) ) ( not ( = ?auto_25079 ?auto_25091 ) ) ( not ( = ?auto_25050 ?auto_25063 ) ) ( not ( = ?auto_25050 ?auto_25068 ) ) ( not ( = ?auto_25051 ?auto_25063 ) ) ( not ( = ?auto_25051 ?auto_25068 ) ) ( not ( = ?auto_25052 ?auto_25063 ) ) ( not ( = ?auto_25052 ?auto_25068 ) ) ( not ( = ?auto_25053 ?auto_25063 ) ) ( not ( = ?auto_25053 ?auto_25068 ) ) ( not ( = ?auto_25054 ?auto_25063 ) ) ( not ( = ?auto_25054 ?auto_25068 ) ) ( not ( = ?auto_25055 ?auto_25063 ) ) ( not ( = ?auto_25055 ?auto_25068 ) ) ( not ( = ?auto_25056 ?auto_25063 ) ) ( not ( = ?auto_25056 ?auto_25068 ) ) ( not ( = ?auto_25057 ?auto_25063 ) ) ( not ( = ?auto_25057 ?auto_25068 ) ) ( not ( = ?auto_25058 ?auto_25063 ) ) ( not ( = ?auto_25058 ?auto_25068 ) ) ( not ( = ?auto_25059 ?auto_25063 ) ) ( not ( = ?auto_25059 ?auto_25068 ) ) ( not ( = ?auto_25060 ?auto_25063 ) ) ( not ( = ?auto_25060 ?auto_25068 ) ) ( not ( = ?auto_25061 ?auto_25063 ) ) ( not ( = ?auto_25061 ?auto_25068 ) ) ( not ( = ?auto_25063 ?auto_25079 ) ) ( not ( = ?auto_25063 ?auto_25085 ) ) ( not ( = ?auto_25063 ?auto_25077 ) ) ( not ( = ?auto_25063 ?auto_25073 ) ) ( not ( = ?auto_25063 ?auto_25089 ) ) ( not ( = ?auto_25063 ?auto_25078 ) ) ( not ( = ?auto_25063 ?auto_25093 ) ) ( not ( = ?auto_25063 ?auto_25072 ) ) ( not ( = ?auto_25063 ?auto_25071 ) ) ( not ( = ?auto_25063 ?auto_25080 ) ) ( not ( = ?auto_25063 ?auto_25094 ) ) ( not ( = ?auto_25063 ?auto_25091 ) ) ( not ( = ?auto_25066 ?auto_25095 ) ) ( not ( = ?auto_25066 ?auto_25084 ) ) ( not ( = ?auto_25066 ?auto_25086 ) ) ( not ( = ?auto_25066 ?auto_25070 ) ) ( not ( = ?auto_25066 ?auto_25087 ) ) ( not ( = ?auto_25066 ?auto_25090 ) ) ( not ( = ?auto_25066 ?auto_25076 ) ) ( not ( = ?auto_25069 ?auto_25083 ) ) ( not ( = ?auto_25069 ?auto_25092 ) ) ( not ( = ?auto_25069 ?auto_25075 ) ) ( not ( = ?auto_25069 ?auto_25074 ) ) ( not ( = ?auto_25069 ?auto_25081 ) ) ( not ( = ?auto_25069 ?auto_25088 ) ) ( not ( = ?auto_25069 ?auto_25082 ) ) ( not ( = ?auto_25068 ?auto_25079 ) ) ( not ( = ?auto_25068 ?auto_25085 ) ) ( not ( = ?auto_25068 ?auto_25077 ) ) ( not ( = ?auto_25068 ?auto_25073 ) ) ( not ( = ?auto_25068 ?auto_25089 ) ) ( not ( = ?auto_25068 ?auto_25078 ) ) ( not ( = ?auto_25068 ?auto_25093 ) ) ( not ( = ?auto_25068 ?auto_25072 ) ) ( not ( = ?auto_25068 ?auto_25071 ) ) ( not ( = ?auto_25068 ?auto_25080 ) ) ( not ( = ?auto_25068 ?auto_25094 ) ) ( not ( = ?auto_25068 ?auto_25091 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_25050 ?auto_25051 ?auto_25052 ?auto_25053 ?auto_25054 ?auto_25055 ?auto_25056 ?auto_25057 ?auto_25058 ?auto_25059 ?auto_25060 ?auto_25061 ?auto_25062 )
      ( MAKE-1CRATE ?auto_25062 ?auto_25063 )
      ( MAKE-13CRATE-VERIFY ?auto_25050 ?auto_25051 ?auto_25052 ?auto_25053 ?auto_25054 ?auto_25055 ?auto_25056 ?auto_25057 ?auto_25058 ?auto_25059 ?auto_25060 ?auto_25061 ?auto_25062 ?auto_25063 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_25121 - SURFACE
      ?auto_25122 - SURFACE
      ?auto_25123 - SURFACE
      ?auto_25124 - SURFACE
      ?auto_25125 - SURFACE
      ?auto_25126 - SURFACE
      ?auto_25127 - SURFACE
      ?auto_25128 - SURFACE
      ?auto_25129 - SURFACE
      ?auto_25130 - SURFACE
      ?auto_25131 - SURFACE
      ?auto_25132 - SURFACE
      ?auto_25133 - SURFACE
      ?auto_25134 - SURFACE
      ?auto_25135 - SURFACE
    )
    :vars
    (
      ?auto_25140 - HOIST
      ?auto_25141 - PLACE
      ?auto_25137 - PLACE
      ?auto_25139 - HOIST
      ?auto_25136 - SURFACE
      ?auto_25167 - PLACE
      ?auto_25144 - HOIST
      ?auto_25146 - SURFACE
      ?auto_25148 - PLACE
      ?auto_25165 - HOIST
      ?auto_25166 - SURFACE
      ?auto_25154 - PLACE
      ?auto_25150 - HOIST
      ?auto_25152 - SURFACE
      ?auto_25151 - PLACE
      ?auto_25142 - HOIST
      ?auto_25143 - SURFACE
      ?auto_25159 - SURFACE
      ?auto_25155 - PLACE
      ?auto_25163 - HOIST
      ?auto_25156 - SURFACE
      ?auto_25147 - SURFACE
      ?auto_25161 - PLACE
      ?auto_25168 - HOIST
      ?auto_25162 - SURFACE
      ?auto_25158 - PLACE
      ?auto_25157 - HOIST
      ?auto_25145 - SURFACE
      ?auto_25153 - SURFACE
      ?auto_25149 - SURFACE
      ?auto_25164 - SURFACE
      ?auto_25160 - SURFACE
      ?auto_25138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25140 ?auto_25141 ) ( IS-CRATE ?auto_25135 ) ( not ( = ?auto_25137 ?auto_25141 ) ) ( HOIST-AT ?auto_25139 ?auto_25137 ) ( SURFACE-AT ?auto_25135 ?auto_25137 ) ( ON ?auto_25135 ?auto_25136 ) ( CLEAR ?auto_25135 ) ( not ( = ?auto_25134 ?auto_25135 ) ) ( not ( = ?auto_25134 ?auto_25136 ) ) ( not ( = ?auto_25135 ?auto_25136 ) ) ( not ( = ?auto_25140 ?auto_25139 ) ) ( IS-CRATE ?auto_25134 ) ( not ( = ?auto_25167 ?auto_25141 ) ) ( HOIST-AT ?auto_25144 ?auto_25167 ) ( AVAILABLE ?auto_25144 ) ( SURFACE-AT ?auto_25134 ?auto_25167 ) ( ON ?auto_25134 ?auto_25146 ) ( CLEAR ?auto_25134 ) ( not ( = ?auto_25133 ?auto_25134 ) ) ( not ( = ?auto_25133 ?auto_25146 ) ) ( not ( = ?auto_25134 ?auto_25146 ) ) ( not ( = ?auto_25140 ?auto_25144 ) ) ( IS-CRATE ?auto_25133 ) ( not ( = ?auto_25148 ?auto_25141 ) ) ( HOIST-AT ?auto_25165 ?auto_25148 ) ( AVAILABLE ?auto_25165 ) ( SURFACE-AT ?auto_25133 ?auto_25148 ) ( ON ?auto_25133 ?auto_25166 ) ( CLEAR ?auto_25133 ) ( not ( = ?auto_25132 ?auto_25133 ) ) ( not ( = ?auto_25132 ?auto_25166 ) ) ( not ( = ?auto_25133 ?auto_25166 ) ) ( not ( = ?auto_25140 ?auto_25165 ) ) ( IS-CRATE ?auto_25132 ) ( not ( = ?auto_25154 ?auto_25141 ) ) ( HOIST-AT ?auto_25150 ?auto_25154 ) ( SURFACE-AT ?auto_25132 ?auto_25154 ) ( ON ?auto_25132 ?auto_25152 ) ( CLEAR ?auto_25132 ) ( not ( = ?auto_25131 ?auto_25132 ) ) ( not ( = ?auto_25131 ?auto_25152 ) ) ( not ( = ?auto_25132 ?auto_25152 ) ) ( not ( = ?auto_25140 ?auto_25150 ) ) ( IS-CRATE ?auto_25131 ) ( not ( = ?auto_25151 ?auto_25141 ) ) ( HOIST-AT ?auto_25142 ?auto_25151 ) ( SURFACE-AT ?auto_25131 ?auto_25151 ) ( ON ?auto_25131 ?auto_25143 ) ( CLEAR ?auto_25131 ) ( not ( = ?auto_25130 ?auto_25131 ) ) ( not ( = ?auto_25130 ?auto_25143 ) ) ( not ( = ?auto_25131 ?auto_25143 ) ) ( not ( = ?auto_25140 ?auto_25142 ) ) ( IS-CRATE ?auto_25130 ) ( AVAILABLE ?auto_25139 ) ( SURFACE-AT ?auto_25130 ?auto_25137 ) ( ON ?auto_25130 ?auto_25159 ) ( CLEAR ?auto_25130 ) ( not ( = ?auto_25129 ?auto_25130 ) ) ( not ( = ?auto_25129 ?auto_25159 ) ) ( not ( = ?auto_25130 ?auto_25159 ) ) ( IS-CRATE ?auto_25129 ) ( not ( = ?auto_25155 ?auto_25141 ) ) ( HOIST-AT ?auto_25163 ?auto_25155 ) ( AVAILABLE ?auto_25163 ) ( SURFACE-AT ?auto_25129 ?auto_25155 ) ( ON ?auto_25129 ?auto_25156 ) ( CLEAR ?auto_25129 ) ( not ( = ?auto_25128 ?auto_25129 ) ) ( not ( = ?auto_25128 ?auto_25156 ) ) ( not ( = ?auto_25129 ?auto_25156 ) ) ( not ( = ?auto_25140 ?auto_25163 ) ) ( IS-CRATE ?auto_25128 ) ( SURFACE-AT ?auto_25128 ?auto_25154 ) ( ON ?auto_25128 ?auto_25147 ) ( CLEAR ?auto_25128 ) ( not ( = ?auto_25127 ?auto_25128 ) ) ( not ( = ?auto_25127 ?auto_25147 ) ) ( not ( = ?auto_25128 ?auto_25147 ) ) ( IS-CRATE ?auto_25127 ) ( not ( = ?auto_25161 ?auto_25141 ) ) ( HOIST-AT ?auto_25168 ?auto_25161 ) ( SURFACE-AT ?auto_25127 ?auto_25161 ) ( ON ?auto_25127 ?auto_25162 ) ( CLEAR ?auto_25127 ) ( not ( = ?auto_25126 ?auto_25127 ) ) ( not ( = ?auto_25126 ?auto_25162 ) ) ( not ( = ?auto_25127 ?auto_25162 ) ) ( not ( = ?auto_25140 ?auto_25168 ) ) ( IS-CRATE ?auto_25126 ) ( not ( = ?auto_25158 ?auto_25141 ) ) ( HOIST-AT ?auto_25157 ?auto_25158 ) ( SURFACE-AT ?auto_25126 ?auto_25158 ) ( ON ?auto_25126 ?auto_25145 ) ( CLEAR ?auto_25126 ) ( not ( = ?auto_25125 ?auto_25126 ) ) ( not ( = ?auto_25125 ?auto_25145 ) ) ( not ( = ?auto_25126 ?auto_25145 ) ) ( not ( = ?auto_25140 ?auto_25157 ) ) ( IS-CRATE ?auto_25125 ) ( AVAILABLE ?auto_25168 ) ( SURFACE-AT ?auto_25125 ?auto_25161 ) ( ON ?auto_25125 ?auto_25153 ) ( CLEAR ?auto_25125 ) ( not ( = ?auto_25124 ?auto_25125 ) ) ( not ( = ?auto_25124 ?auto_25153 ) ) ( not ( = ?auto_25125 ?auto_25153 ) ) ( IS-CRATE ?auto_25124 ) ( AVAILABLE ?auto_25150 ) ( SURFACE-AT ?auto_25124 ?auto_25154 ) ( ON ?auto_25124 ?auto_25149 ) ( CLEAR ?auto_25124 ) ( not ( = ?auto_25123 ?auto_25124 ) ) ( not ( = ?auto_25123 ?auto_25149 ) ) ( not ( = ?auto_25124 ?auto_25149 ) ) ( IS-CRATE ?auto_25123 ) ( AVAILABLE ?auto_25142 ) ( SURFACE-AT ?auto_25123 ?auto_25151 ) ( ON ?auto_25123 ?auto_25164 ) ( CLEAR ?auto_25123 ) ( not ( = ?auto_25122 ?auto_25123 ) ) ( not ( = ?auto_25122 ?auto_25164 ) ) ( not ( = ?auto_25123 ?auto_25164 ) ) ( SURFACE-AT ?auto_25121 ?auto_25141 ) ( CLEAR ?auto_25121 ) ( IS-CRATE ?auto_25122 ) ( AVAILABLE ?auto_25140 ) ( AVAILABLE ?auto_25157 ) ( SURFACE-AT ?auto_25122 ?auto_25158 ) ( ON ?auto_25122 ?auto_25160 ) ( CLEAR ?auto_25122 ) ( TRUCK-AT ?auto_25138 ?auto_25141 ) ( not ( = ?auto_25121 ?auto_25122 ) ) ( not ( = ?auto_25121 ?auto_25160 ) ) ( not ( = ?auto_25122 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25123 ) ) ( not ( = ?auto_25121 ?auto_25164 ) ) ( not ( = ?auto_25123 ?auto_25160 ) ) ( not ( = ?auto_25151 ?auto_25158 ) ) ( not ( = ?auto_25142 ?auto_25157 ) ) ( not ( = ?auto_25164 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25124 ) ) ( not ( = ?auto_25121 ?auto_25149 ) ) ( not ( = ?auto_25122 ?auto_25124 ) ) ( not ( = ?auto_25122 ?auto_25149 ) ) ( not ( = ?auto_25124 ?auto_25164 ) ) ( not ( = ?auto_25124 ?auto_25160 ) ) ( not ( = ?auto_25154 ?auto_25151 ) ) ( not ( = ?auto_25154 ?auto_25158 ) ) ( not ( = ?auto_25150 ?auto_25142 ) ) ( not ( = ?auto_25150 ?auto_25157 ) ) ( not ( = ?auto_25149 ?auto_25164 ) ) ( not ( = ?auto_25149 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25125 ) ) ( not ( = ?auto_25121 ?auto_25153 ) ) ( not ( = ?auto_25122 ?auto_25125 ) ) ( not ( = ?auto_25122 ?auto_25153 ) ) ( not ( = ?auto_25123 ?auto_25125 ) ) ( not ( = ?auto_25123 ?auto_25153 ) ) ( not ( = ?auto_25125 ?auto_25149 ) ) ( not ( = ?auto_25125 ?auto_25164 ) ) ( not ( = ?auto_25125 ?auto_25160 ) ) ( not ( = ?auto_25161 ?auto_25154 ) ) ( not ( = ?auto_25161 ?auto_25151 ) ) ( not ( = ?auto_25161 ?auto_25158 ) ) ( not ( = ?auto_25168 ?auto_25150 ) ) ( not ( = ?auto_25168 ?auto_25142 ) ) ( not ( = ?auto_25168 ?auto_25157 ) ) ( not ( = ?auto_25153 ?auto_25149 ) ) ( not ( = ?auto_25153 ?auto_25164 ) ) ( not ( = ?auto_25153 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25126 ) ) ( not ( = ?auto_25121 ?auto_25145 ) ) ( not ( = ?auto_25122 ?auto_25126 ) ) ( not ( = ?auto_25122 ?auto_25145 ) ) ( not ( = ?auto_25123 ?auto_25126 ) ) ( not ( = ?auto_25123 ?auto_25145 ) ) ( not ( = ?auto_25124 ?auto_25126 ) ) ( not ( = ?auto_25124 ?auto_25145 ) ) ( not ( = ?auto_25126 ?auto_25153 ) ) ( not ( = ?auto_25126 ?auto_25149 ) ) ( not ( = ?auto_25126 ?auto_25164 ) ) ( not ( = ?auto_25126 ?auto_25160 ) ) ( not ( = ?auto_25145 ?auto_25153 ) ) ( not ( = ?auto_25145 ?auto_25149 ) ) ( not ( = ?auto_25145 ?auto_25164 ) ) ( not ( = ?auto_25145 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25127 ) ) ( not ( = ?auto_25121 ?auto_25162 ) ) ( not ( = ?auto_25122 ?auto_25127 ) ) ( not ( = ?auto_25122 ?auto_25162 ) ) ( not ( = ?auto_25123 ?auto_25127 ) ) ( not ( = ?auto_25123 ?auto_25162 ) ) ( not ( = ?auto_25124 ?auto_25127 ) ) ( not ( = ?auto_25124 ?auto_25162 ) ) ( not ( = ?auto_25125 ?auto_25127 ) ) ( not ( = ?auto_25125 ?auto_25162 ) ) ( not ( = ?auto_25127 ?auto_25145 ) ) ( not ( = ?auto_25127 ?auto_25153 ) ) ( not ( = ?auto_25127 ?auto_25149 ) ) ( not ( = ?auto_25127 ?auto_25164 ) ) ( not ( = ?auto_25127 ?auto_25160 ) ) ( not ( = ?auto_25162 ?auto_25145 ) ) ( not ( = ?auto_25162 ?auto_25153 ) ) ( not ( = ?auto_25162 ?auto_25149 ) ) ( not ( = ?auto_25162 ?auto_25164 ) ) ( not ( = ?auto_25162 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25128 ) ) ( not ( = ?auto_25121 ?auto_25147 ) ) ( not ( = ?auto_25122 ?auto_25128 ) ) ( not ( = ?auto_25122 ?auto_25147 ) ) ( not ( = ?auto_25123 ?auto_25128 ) ) ( not ( = ?auto_25123 ?auto_25147 ) ) ( not ( = ?auto_25124 ?auto_25128 ) ) ( not ( = ?auto_25124 ?auto_25147 ) ) ( not ( = ?auto_25125 ?auto_25128 ) ) ( not ( = ?auto_25125 ?auto_25147 ) ) ( not ( = ?auto_25126 ?auto_25128 ) ) ( not ( = ?auto_25126 ?auto_25147 ) ) ( not ( = ?auto_25128 ?auto_25162 ) ) ( not ( = ?auto_25128 ?auto_25145 ) ) ( not ( = ?auto_25128 ?auto_25153 ) ) ( not ( = ?auto_25128 ?auto_25149 ) ) ( not ( = ?auto_25128 ?auto_25164 ) ) ( not ( = ?auto_25128 ?auto_25160 ) ) ( not ( = ?auto_25147 ?auto_25162 ) ) ( not ( = ?auto_25147 ?auto_25145 ) ) ( not ( = ?auto_25147 ?auto_25153 ) ) ( not ( = ?auto_25147 ?auto_25149 ) ) ( not ( = ?auto_25147 ?auto_25164 ) ) ( not ( = ?auto_25147 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25129 ) ) ( not ( = ?auto_25121 ?auto_25156 ) ) ( not ( = ?auto_25122 ?auto_25129 ) ) ( not ( = ?auto_25122 ?auto_25156 ) ) ( not ( = ?auto_25123 ?auto_25129 ) ) ( not ( = ?auto_25123 ?auto_25156 ) ) ( not ( = ?auto_25124 ?auto_25129 ) ) ( not ( = ?auto_25124 ?auto_25156 ) ) ( not ( = ?auto_25125 ?auto_25129 ) ) ( not ( = ?auto_25125 ?auto_25156 ) ) ( not ( = ?auto_25126 ?auto_25129 ) ) ( not ( = ?auto_25126 ?auto_25156 ) ) ( not ( = ?auto_25127 ?auto_25129 ) ) ( not ( = ?auto_25127 ?auto_25156 ) ) ( not ( = ?auto_25129 ?auto_25147 ) ) ( not ( = ?auto_25129 ?auto_25162 ) ) ( not ( = ?auto_25129 ?auto_25145 ) ) ( not ( = ?auto_25129 ?auto_25153 ) ) ( not ( = ?auto_25129 ?auto_25149 ) ) ( not ( = ?auto_25129 ?auto_25164 ) ) ( not ( = ?auto_25129 ?auto_25160 ) ) ( not ( = ?auto_25155 ?auto_25154 ) ) ( not ( = ?auto_25155 ?auto_25161 ) ) ( not ( = ?auto_25155 ?auto_25158 ) ) ( not ( = ?auto_25155 ?auto_25151 ) ) ( not ( = ?auto_25163 ?auto_25150 ) ) ( not ( = ?auto_25163 ?auto_25168 ) ) ( not ( = ?auto_25163 ?auto_25157 ) ) ( not ( = ?auto_25163 ?auto_25142 ) ) ( not ( = ?auto_25156 ?auto_25147 ) ) ( not ( = ?auto_25156 ?auto_25162 ) ) ( not ( = ?auto_25156 ?auto_25145 ) ) ( not ( = ?auto_25156 ?auto_25153 ) ) ( not ( = ?auto_25156 ?auto_25149 ) ) ( not ( = ?auto_25156 ?auto_25164 ) ) ( not ( = ?auto_25156 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25130 ) ) ( not ( = ?auto_25121 ?auto_25159 ) ) ( not ( = ?auto_25122 ?auto_25130 ) ) ( not ( = ?auto_25122 ?auto_25159 ) ) ( not ( = ?auto_25123 ?auto_25130 ) ) ( not ( = ?auto_25123 ?auto_25159 ) ) ( not ( = ?auto_25124 ?auto_25130 ) ) ( not ( = ?auto_25124 ?auto_25159 ) ) ( not ( = ?auto_25125 ?auto_25130 ) ) ( not ( = ?auto_25125 ?auto_25159 ) ) ( not ( = ?auto_25126 ?auto_25130 ) ) ( not ( = ?auto_25126 ?auto_25159 ) ) ( not ( = ?auto_25127 ?auto_25130 ) ) ( not ( = ?auto_25127 ?auto_25159 ) ) ( not ( = ?auto_25128 ?auto_25130 ) ) ( not ( = ?auto_25128 ?auto_25159 ) ) ( not ( = ?auto_25130 ?auto_25156 ) ) ( not ( = ?auto_25130 ?auto_25147 ) ) ( not ( = ?auto_25130 ?auto_25162 ) ) ( not ( = ?auto_25130 ?auto_25145 ) ) ( not ( = ?auto_25130 ?auto_25153 ) ) ( not ( = ?auto_25130 ?auto_25149 ) ) ( not ( = ?auto_25130 ?auto_25164 ) ) ( not ( = ?auto_25130 ?auto_25160 ) ) ( not ( = ?auto_25137 ?auto_25155 ) ) ( not ( = ?auto_25137 ?auto_25154 ) ) ( not ( = ?auto_25137 ?auto_25161 ) ) ( not ( = ?auto_25137 ?auto_25158 ) ) ( not ( = ?auto_25137 ?auto_25151 ) ) ( not ( = ?auto_25139 ?auto_25163 ) ) ( not ( = ?auto_25139 ?auto_25150 ) ) ( not ( = ?auto_25139 ?auto_25168 ) ) ( not ( = ?auto_25139 ?auto_25157 ) ) ( not ( = ?auto_25139 ?auto_25142 ) ) ( not ( = ?auto_25159 ?auto_25156 ) ) ( not ( = ?auto_25159 ?auto_25147 ) ) ( not ( = ?auto_25159 ?auto_25162 ) ) ( not ( = ?auto_25159 ?auto_25145 ) ) ( not ( = ?auto_25159 ?auto_25153 ) ) ( not ( = ?auto_25159 ?auto_25149 ) ) ( not ( = ?auto_25159 ?auto_25164 ) ) ( not ( = ?auto_25159 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25131 ) ) ( not ( = ?auto_25121 ?auto_25143 ) ) ( not ( = ?auto_25122 ?auto_25131 ) ) ( not ( = ?auto_25122 ?auto_25143 ) ) ( not ( = ?auto_25123 ?auto_25131 ) ) ( not ( = ?auto_25123 ?auto_25143 ) ) ( not ( = ?auto_25124 ?auto_25131 ) ) ( not ( = ?auto_25124 ?auto_25143 ) ) ( not ( = ?auto_25125 ?auto_25131 ) ) ( not ( = ?auto_25125 ?auto_25143 ) ) ( not ( = ?auto_25126 ?auto_25131 ) ) ( not ( = ?auto_25126 ?auto_25143 ) ) ( not ( = ?auto_25127 ?auto_25131 ) ) ( not ( = ?auto_25127 ?auto_25143 ) ) ( not ( = ?auto_25128 ?auto_25131 ) ) ( not ( = ?auto_25128 ?auto_25143 ) ) ( not ( = ?auto_25129 ?auto_25131 ) ) ( not ( = ?auto_25129 ?auto_25143 ) ) ( not ( = ?auto_25131 ?auto_25159 ) ) ( not ( = ?auto_25131 ?auto_25156 ) ) ( not ( = ?auto_25131 ?auto_25147 ) ) ( not ( = ?auto_25131 ?auto_25162 ) ) ( not ( = ?auto_25131 ?auto_25145 ) ) ( not ( = ?auto_25131 ?auto_25153 ) ) ( not ( = ?auto_25131 ?auto_25149 ) ) ( not ( = ?auto_25131 ?auto_25164 ) ) ( not ( = ?auto_25131 ?auto_25160 ) ) ( not ( = ?auto_25143 ?auto_25159 ) ) ( not ( = ?auto_25143 ?auto_25156 ) ) ( not ( = ?auto_25143 ?auto_25147 ) ) ( not ( = ?auto_25143 ?auto_25162 ) ) ( not ( = ?auto_25143 ?auto_25145 ) ) ( not ( = ?auto_25143 ?auto_25153 ) ) ( not ( = ?auto_25143 ?auto_25149 ) ) ( not ( = ?auto_25143 ?auto_25164 ) ) ( not ( = ?auto_25143 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25132 ) ) ( not ( = ?auto_25121 ?auto_25152 ) ) ( not ( = ?auto_25122 ?auto_25132 ) ) ( not ( = ?auto_25122 ?auto_25152 ) ) ( not ( = ?auto_25123 ?auto_25132 ) ) ( not ( = ?auto_25123 ?auto_25152 ) ) ( not ( = ?auto_25124 ?auto_25132 ) ) ( not ( = ?auto_25124 ?auto_25152 ) ) ( not ( = ?auto_25125 ?auto_25132 ) ) ( not ( = ?auto_25125 ?auto_25152 ) ) ( not ( = ?auto_25126 ?auto_25132 ) ) ( not ( = ?auto_25126 ?auto_25152 ) ) ( not ( = ?auto_25127 ?auto_25132 ) ) ( not ( = ?auto_25127 ?auto_25152 ) ) ( not ( = ?auto_25128 ?auto_25132 ) ) ( not ( = ?auto_25128 ?auto_25152 ) ) ( not ( = ?auto_25129 ?auto_25132 ) ) ( not ( = ?auto_25129 ?auto_25152 ) ) ( not ( = ?auto_25130 ?auto_25132 ) ) ( not ( = ?auto_25130 ?auto_25152 ) ) ( not ( = ?auto_25132 ?auto_25143 ) ) ( not ( = ?auto_25132 ?auto_25159 ) ) ( not ( = ?auto_25132 ?auto_25156 ) ) ( not ( = ?auto_25132 ?auto_25147 ) ) ( not ( = ?auto_25132 ?auto_25162 ) ) ( not ( = ?auto_25132 ?auto_25145 ) ) ( not ( = ?auto_25132 ?auto_25153 ) ) ( not ( = ?auto_25132 ?auto_25149 ) ) ( not ( = ?auto_25132 ?auto_25164 ) ) ( not ( = ?auto_25132 ?auto_25160 ) ) ( not ( = ?auto_25152 ?auto_25143 ) ) ( not ( = ?auto_25152 ?auto_25159 ) ) ( not ( = ?auto_25152 ?auto_25156 ) ) ( not ( = ?auto_25152 ?auto_25147 ) ) ( not ( = ?auto_25152 ?auto_25162 ) ) ( not ( = ?auto_25152 ?auto_25145 ) ) ( not ( = ?auto_25152 ?auto_25153 ) ) ( not ( = ?auto_25152 ?auto_25149 ) ) ( not ( = ?auto_25152 ?auto_25164 ) ) ( not ( = ?auto_25152 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25133 ) ) ( not ( = ?auto_25121 ?auto_25166 ) ) ( not ( = ?auto_25122 ?auto_25133 ) ) ( not ( = ?auto_25122 ?auto_25166 ) ) ( not ( = ?auto_25123 ?auto_25133 ) ) ( not ( = ?auto_25123 ?auto_25166 ) ) ( not ( = ?auto_25124 ?auto_25133 ) ) ( not ( = ?auto_25124 ?auto_25166 ) ) ( not ( = ?auto_25125 ?auto_25133 ) ) ( not ( = ?auto_25125 ?auto_25166 ) ) ( not ( = ?auto_25126 ?auto_25133 ) ) ( not ( = ?auto_25126 ?auto_25166 ) ) ( not ( = ?auto_25127 ?auto_25133 ) ) ( not ( = ?auto_25127 ?auto_25166 ) ) ( not ( = ?auto_25128 ?auto_25133 ) ) ( not ( = ?auto_25128 ?auto_25166 ) ) ( not ( = ?auto_25129 ?auto_25133 ) ) ( not ( = ?auto_25129 ?auto_25166 ) ) ( not ( = ?auto_25130 ?auto_25133 ) ) ( not ( = ?auto_25130 ?auto_25166 ) ) ( not ( = ?auto_25131 ?auto_25133 ) ) ( not ( = ?auto_25131 ?auto_25166 ) ) ( not ( = ?auto_25133 ?auto_25152 ) ) ( not ( = ?auto_25133 ?auto_25143 ) ) ( not ( = ?auto_25133 ?auto_25159 ) ) ( not ( = ?auto_25133 ?auto_25156 ) ) ( not ( = ?auto_25133 ?auto_25147 ) ) ( not ( = ?auto_25133 ?auto_25162 ) ) ( not ( = ?auto_25133 ?auto_25145 ) ) ( not ( = ?auto_25133 ?auto_25153 ) ) ( not ( = ?auto_25133 ?auto_25149 ) ) ( not ( = ?auto_25133 ?auto_25164 ) ) ( not ( = ?auto_25133 ?auto_25160 ) ) ( not ( = ?auto_25148 ?auto_25154 ) ) ( not ( = ?auto_25148 ?auto_25151 ) ) ( not ( = ?auto_25148 ?auto_25137 ) ) ( not ( = ?auto_25148 ?auto_25155 ) ) ( not ( = ?auto_25148 ?auto_25161 ) ) ( not ( = ?auto_25148 ?auto_25158 ) ) ( not ( = ?auto_25165 ?auto_25150 ) ) ( not ( = ?auto_25165 ?auto_25142 ) ) ( not ( = ?auto_25165 ?auto_25139 ) ) ( not ( = ?auto_25165 ?auto_25163 ) ) ( not ( = ?auto_25165 ?auto_25168 ) ) ( not ( = ?auto_25165 ?auto_25157 ) ) ( not ( = ?auto_25166 ?auto_25152 ) ) ( not ( = ?auto_25166 ?auto_25143 ) ) ( not ( = ?auto_25166 ?auto_25159 ) ) ( not ( = ?auto_25166 ?auto_25156 ) ) ( not ( = ?auto_25166 ?auto_25147 ) ) ( not ( = ?auto_25166 ?auto_25162 ) ) ( not ( = ?auto_25166 ?auto_25145 ) ) ( not ( = ?auto_25166 ?auto_25153 ) ) ( not ( = ?auto_25166 ?auto_25149 ) ) ( not ( = ?auto_25166 ?auto_25164 ) ) ( not ( = ?auto_25166 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25134 ) ) ( not ( = ?auto_25121 ?auto_25146 ) ) ( not ( = ?auto_25122 ?auto_25134 ) ) ( not ( = ?auto_25122 ?auto_25146 ) ) ( not ( = ?auto_25123 ?auto_25134 ) ) ( not ( = ?auto_25123 ?auto_25146 ) ) ( not ( = ?auto_25124 ?auto_25134 ) ) ( not ( = ?auto_25124 ?auto_25146 ) ) ( not ( = ?auto_25125 ?auto_25134 ) ) ( not ( = ?auto_25125 ?auto_25146 ) ) ( not ( = ?auto_25126 ?auto_25134 ) ) ( not ( = ?auto_25126 ?auto_25146 ) ) ( not ( = ?auto_25127 ?auto_25134 ) ) ( not ( = ?auto_25127 ?auto_25146 ) ) ( not ( = ?auto_25128 ?auto_25134 ) ) ( not ( = ?auto_25128 ?auto_25146 ) ) ( not ( = ?auto_25129 ?auto_25134 ) ) ( not ( = ?auto_25129 ?auto_25146 ) ) ( not ( = ?auto_25130 ?auto_25134 ) ) ( not ( = ?auto_25130 ?auto_25146 ) ) ( not ( = ?auto_25131 ?auto_25134 ) ) ( not ( = ?auto_25131 ?auto_25146 ) ) ( not ( = ?auto_25132 ?auto_25134 ) ) ( not ( = ?auto_25132 ?auto_25146 ) ) ( not ( = ?auto_25134 ?auto_25166 ) ) ( not ( = ?auto_25134 ?auto_25152 ) ) ( not ( = ?auto_25134 ?auto_25143 ) ) ( not ( = ?auto_25134 ?auto_25159 ) ) ( not ( = ?auto_25134 ?auto_25156 ) ) ( not ( = ?auto_25134 ?auto_25147 ) ) ( not ( = ?auto_25134 ?auto_25162 ) ) ( not ( = ?auto_25134 ?auto_25145 ) ) ( not ( = ?auto_25134 ?auto_25153 ) ) ( not ( = ?auto_25134 ?auto_25149 ) ) ( not ( = ?auto_25134 ?auto_25164 ) ) ( not ( = ?auto_25134 ?auto_25160 ) ) ( not ( = ?auto_25167 ?auto_25148 ) ) ( not ( = ?auto_25167 ?auto_25154 ) ) ( not ( = ?auto_25167 ?auto_25151 ) ) ( not ( = ?auto_25167 ?auto_25137 ) ) ( not ( = ?auto_25167 ?auto_25155 ) ) ( not ( = ?auto_25167 ?auto_25161 ) ) ( not ( = ?auto_25167 ?auto_25158 ) ) ( not ( = ?auto_25144 ?auto_25165 ) ) ( not ( = ?auto_25144 ?auto_25150 ) ) ( not ( = ?auto_25144 ?auto_25142 ) ) ( not ( = ?auto_25144 ?auto_25139 ) ) ( not ( = ?auto_25144 ?auto_25163 ) ) ( not ( = ?auto_25144 ?auto_25168 ) ) ( not ( = ?auto_25144 ?auto_25157 ) ) ( not ( = ?auto_25146 ?auto_25166 ) ) ( not ( = ?auto_25146 ?auto_25152 ) ) ( not ( = ?auto_25146 ?auto_25143 ) ) ( not ( = ?auto_25146 ?auto_25159 ) ) ( not ( = ?auto_25146 ?auto_25156 ) ) ( not ( = ?auto_25146 ?auto_25147 ) ) ( not ( = ?auto_25146 ?auto_25162 ) ) ( not ( = ?auto_25146 ?auto_25145 ) ) ( not ( = ?auto_25146 ?auto_25153 ) ) ( not ( = ?auto_25146 ?auto_25149 ) ) ( not ( = ?auto_25146 ?auto_25164 ) ) ( not ( = ?auto_25146 ?auto_25160 ) ) ( not ( = ?auto_25121 ?auto_25135 ) ) ( not ( = ?auto_25121 ?auto_25136 ) ) ( not ( = ?auto_25122 ?auto_25135 ) ) ( not ( = ?auto_25122 ?auto_25136 ) ) ( not ( = ?auto_25123 ?auto_25135 ) ) ( not ( = ?auto_25123 ?auto_25136 ) ) ( not ( = ?auto_25124 ?auto_25135 ) ) ( not ( = ?auto_25124 ?auto_25136 ) ) ( not ( = ?auto_25125 ?auto_25135 ) ) ( not ( = ?auto_25125 ?auto_25136 ) ) ( not ( = ?auto_25126 ?auto_25135 ) ) ( not ( = ?auto_25126 ?auto_25136 ) ) ( not ( = ?auto_25127 ?auto_25135 ) ) ( not ( = ?auto_25127 ?auto_25136 ) ) ( not ( = ?auto_25128 ?auto_25135 ) ) ( not ( = ?auto_25128 ?auto_25136 ) ) ( not ( = ?auto_25129 ?auto_25135 ) ) ( not ( = ?auto_25129 ?auto_25136 ) ) ( not ( = ?auto_25130 ?auto_25135 ) ) ( not ( = ?auto_25130 ?auto_25136 ) ) ( not ( = ?auto_25131 ?auto_25135 ) ) ( not ( = ?auto_25131 ?auto_25136 ) ) ( not ( = ?auto_25132 ?auto_25135 ) ) ( not ( = ?auto_25132 ?auto_25136 ) ) ( not ( = ?auto_25133 ?auto_25135 ) ) ( not ( = ?auto_25133 ?auto_25136 ) ) ( not ( = ?auto_25135 ?auto_25146 ) ) ( not ( = ?auto_25135 ?auto_25166 ) ) ( not ( = ?auto_25135 ?auto_25152 ) ) ( not ( = ?auto_25135 ?auto_25143 ) ) ( not ( = ?auto_25135 ?auto_25159 ) ) ( not ( = ?auto_25135 ?auto_25156 ) ) ( not ( = ?auto_25135 ?auto_25147 ) ) ( not ( = ?auto_25135 ?auto_25162 ) ) ( not ( = ?auto_25135 ?auto_25145 ) ) ( not ( = ?auto_25135 ?auto_25153 ) ) ( not ( = ?auto_25135 ?auto_25149 ) ) ( not ( = ?auto_25135 ?auto_25164 ) ) ( not ( = ?auto_25135 ?auto_25160 ) ) ( not ( = ?auto_25136 ?auto_25146 ) ) ( not ( = ?auto_25136 ?auto_25166 ) ) ( not ( = ?auto_25136 ?auto_25152 ) ) ( not ( = ?auto_25136 ?auto_25143 ) ) ( not ( = ?auto_25136 ?auto_25159 ) ) ( not ( = ?auto_25136 ?auto_25156 ) ) ( not ( = ?auto_25136 ?auto_25147 ) ) ( not ( = ?auto_25136 ?auto_25162 ) ) ( not ( = ?auto_25136 ?auto_25145 ) ) ( not ( = ?auto_25136 ?auto_25153 ) ) ( not ( = ?auto_25136 ?auto_25149 ) ) ( not ( = ?auto_25136 ?auto_25164 ) ) ( not ( = ?auto_25136 ?auto_25160 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_25121 ?auto_25122 ?auto_25123 ?auto_25124 ?auto_25125 ?auto_25126 ?auto_25127 ?auto_25128 ?auto_25129 ?auto_25130 ?auto_25131 ?auto_25132 ?auto_25133 ?auto_25134 )
      ( MAKE-1CRATE ?auto_25134 ?auto_25135 )
      ( MAKE-14CRATE-VERIFY ?auto_25121 ?auto_25122 ?auto_25123 ?auto_25124 ?auto_25125 ?auto_25126 ?auto_25127 ?auto_25128 ?auto_25129 ?auto_25130 ?auto_25131 ?auto_25132 ?auto_25133 ?auto_25134 ?auto_25135 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_25195 - SURFACE
      ?auto_25196 - SURFACE
      ?auto_25197 - SURFACE
      ?auto_25198 - SURFACE
      ?auto_25199 - SURFACE
      ?auto_25200 - SURFACE
      ?auto_25201 - SURFACE
      ?auto_25202 - SURFACE
      ?auto_25203 - SURFACE
      ?auto_25204 - SURFACE
      ?auto_25205 - SURFACE
      ?auto_25206 - SURFACE
      ?auto_25207 - SURFACE
      ?auto_25208 - SURFACE
      ?auto_25209 - SURFACE
      ?auto_25210 - SURFACE
    )
    :vars
    (
      ?auto_25215 - HOIST
      ?auto_25214 - PLACE
      ?auto_25211 - PLACE
      ?auto_25216 - HOIST
      ?auto_25212 - SURFACE
      ?auto_25226 - PLACE
      ?auto_25227 - HOIST
      ?auto_25243 - SURFACE
      ?auto_25223 - PLACE
      ?auto_25232 - HOIST
      ?auto_25238 - SURFACE
      ?auto_25234 - PLACE
      ?auto_25222 - HOIST
      ?auto_25239 - SURFACE
      ?auto_25236 - PLACE
      ?auto_25235 - HOIST
      ?auto_25225 - SURFACE
      ?auto_25233 - PLACE
      ?auto_25244 - HOIST
      ?auto_25228 - SURFACE
      ?auto_25240 - SURFACE
      ?auto_25217 - SURFACE
      ?auto_25221 - SURFACE
      ?auto_25231 - PLACE
      ?auto_25242 - HOIST
      ?auto_25229 - SURFACE
      ?auto_25224 - PLACE
      ?auto_25237 - HOIST
      ?auto_25220 - SURFACE
      ?auto_25219 - SURFACE
      ?auto_25230 - SURFACE
      ?auto_25241 - SURFACE
      ?auto_25218 - SURFACE
      ?auto_25213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25215 ?auto_25214 ) ( IS-CRATE ?auto_25210 ) ( not ( = ?auto_25211 ?auto_25214 ) ) ( HOIST-AT ?auto_25216 ?auto_25211 ) ( SURFACE-AT ?auto_25210 ?auto_25211 ) ( ON ?auto_25210 ?auto_25212 ) ( CLEAR ?auto_25210 ) ( not ( = ?auto_25209 ?auto_25210 ) ) ( not ( = ?auto_25209 ?auto_25212 ) ) ( not ( = ?auto_25210 ?auto_25212 ) ) ( not ( = ?auto_25215 ?auto_25216 ) ) ( IS-CRATE ?auto_25209 ) ( not ( = ?auto_25226 ?auto_25214 ) ) ( HOIST-AT ?auto_25227 ?auto_25226 ) ( SURFACE-AT ?auto_25209 ?auto_25226 ) ( ON ?auto_25209 ?auto_25243 ) ( CLEAR ?auto_25209 ) ( not ( = ?auto_25208 ?auto_25209 ) ) ( not ( = ?auto_25208 ?auto_25243 ) ) ( not ( = ?auto_25209 ?auto_25243 ) ) ( not ( = ?auto_25215 ?auto_25227 ) ) ( IS-CRATE ?auto_25208 ) ( not ( = ?auto_25223 ?auto_25214 ) ) ( HOIST-AT ?auto_25232 ?auto_25223 ) ( AVAILABLE ?auto_25232 ) ( SURFACE-AT ?auto_25208 ?auto_25223 ) ( ON ?auto_25208 ?auto_25238 ) ( CLEAR ?auto_25208 ) ( not ( = ?auto_25207 ?auto_25208 ) ) ( not ( = ?auto_25207 ?auto_25238 ) ) ( not ( = ?auto_25208 ?auto_25238 ) ) ( not ( = ?auto_25215 ?auto_25232 ) ) ( IS-CRATE ?auto_25207 ) ( not ( = ?auto_25234 ?auto_25214 ) ) ( HOIST-AT ?auto_25222 ?auto_25234 ) ( AVAILABLE ?auto_25222 ) ( SURFACE-AT ?auto_25207 ?auto_25234 ) ( ON ?auto_25207 ?auto_25239 ) ( CLEAR ?auto_25207 ) ( not ( = ?auto_25206 ?auto_25207 ) ) ( not ( = ?auto_25206 ?auto_25239 ) ) ( not ( = ?auto_25207 ?auto_25239 ) ) ( not ( = ?auto_25215 ?auto_25222 ) ) ( IS-CRATE ?auto_25206 ) ( not ( = ?auto_25236 ?auto_25214 ) ) ( HOIST-AT ?auto_25235 ?auto_25236 ) ( SURFACE-AT ?auto_25206 ?auto_25236 ) ( ON ?auto_25206 ?auto_25225 ) ( CLEAR ?auto_25206 ) ( not ( = ?auto_25205 ?auto_25206 ) ) ( not ( = ?auto_25205 ?auto_25225 ) ) ( not ( = ?auto_25206 ?auto_25225 ) ) ( not ( = ?auto_25215 ?auto_25235 ) ) ( IS-CRATE ?auto_25205 ) ( not ( = ?auto_25233 ?auto_25214 ) ) ( HOIST-AT ?auto_25244 ?auto_25233 ) ( SURFACE-AT ?auto_25205 ?auto_25233 ) ( ON ?auto_25205 ?auto_25228 ) ( CLEAR ?auto_25205 ) ( not ( = ?auto_25204 ?auto_25205 ) ) ( not ( = ?auto_25204 ?auto_25228 ) ) ( not ( = ?auto_25205 ?auto_25228 ) ) ( not ( = ?auto_25215 ?auto_25244 ) ) ( IS-CRATE ?auto_25204 ) ( AVAILABLE ?auto_25227 ) ( SURFACE-AT ?auto_25204 ?auto_25226 ) ( ON ?auto_25204 ?auto_25240 ) ( CLEAR ?auto_25204 ) ( not ( = ?auto_25203 ?auto_25204 ) ) ( not ( = ?auto_25203 ?auto_25240 ) ) ( not ( = ?auto_25204 ?auto_25240 ) ) ( IS-CRATE ?auto_25203 ) ( AVAILABLE ?auto_25216 ) ( SURFACE-AT ?auto_25203 ?auto_25211 ) ( ON ?auto_25203 ?auto_25217 ) ( CLEAR ?auto_25203 ) ( not ( = ?auto_25202 ?auto_25203 ) ) ( not ( = ?auto_25202 ?auto_25217 ) ) ( not ( = ?auto_25203 ?auto_25217 ) ) ( IS-CRATE ?auto_25202 ) ( SURFACE-AT ?auto_25202 ?auto_25236 ) ( ON ?auto_25202 ?auto_25221 ) ( CLEAR ?auto_25202 ) ( not ( = ?auto_25201 ?auto_25202 ) ) ( not ( = ?auto_25201 ?auto_25221 ) ) ( not ( = ?auto_25202 ?auto_25221 ) ) ( IS-CRATE ?auto_25201 ) ( not ( = ?auto_25231 ?auto_25214 ) ) ( HOIST-AT ?auto_25242 ?auto_25231 ) ( SURFACE-AT ?auto_25201 ?auto_25231 ) ( ON ?auto_25201 ?auto_25229 ) ( CLEAR ?auto_25201 ) ( not ( = ?auto_25200 ?auto_25201 ) ) ( not ( = ?auto_25200 ?auto_25229 ) ) ( not ( = ?auto_25201 ?auto_25229 ) ) ( not ( = ?auto_25215 ?auto_25242 ) ) ( IS-CRATE ?auto_25200 ) ( not ( = ?auto_25224 ?auto_25214 ) ) ( HOIST-AT ?auto_25237 ?auto_25224 ) ( SURFACE-AT ?auto_25200 ?auto_25224 ) ( ON ?auto_25200 ?auto_25220 ) ( CLEAR ?auto_25200 ) ( not ( = ?auto_25199 ?auto_25200 ) ) ( not ( = ?auto_25199 ?auto_25220 ) ) ( not ( = ?auto_25200 ?auto_25220 ) ) ( not ( = ?auto_25215 ?auto_25237 ) ) ( IS-CRATE ?auto_25199 ) ( AVAILABLE ?auto_25242 ) ( SURFACE-AT ?auto_25199 ?auto_25231 ) ( ON ?auto_25199 ?auto_25219 ) ( CLEAR ?auto_25199 ) ( not ( = ?auto_25198 ?auto_25199 ) ) ( not ( = ?auto_25198 ?auto_25219 ) ) ( not ( = ?auto_25199 ?auto_25219 ) ) ( IS-CRATE ?auto_25198 ) ( AVAILABLE ?auto_25235 ) ( SURFACE-AT ?auto_25198 ?auto_25236 ) ( ON ?auto_25198 ?auto_25230 ) ( CLEAR ?auto_25198 ) ( not ( = ?auto_25197 ?auto_25198 ) ) ( not ( = ?auto_25197 ?auto_25230 ) ) ( not ( = ?auto_25198 ?auto_25230 ) ) ( IS-CRATE ?auto_25197 ) ( AVAILABLE ?auto_25244 ) ( SURFACE-AT ?auto_25197 ?auto_25233 ) ( ON ?auto_25197 ?auto_25241 ) ( CLEAR ?auto_25197 ) ( not ( = ?auto_25196 ?auto_25197 ) ) ( not ( = ?auto_25196 ?auto_25241 ) ) ( not ( = ?auto_25197 ?auto_25241 ) ) ( SURFACE-AT ?auto_25195 ?auto_25214 ) ( CLEAR ?auto_25195 ) ( IS-CRATE ?auto_25196 ) ( AVAILABLE ?auto_25215 ) ( AVAILABLE ?auto_25237 ) ( SURFACE-AT ?auto_25196 ?auto_25224 ) ( ON ?auto_25196 ?auto_25218 ) ( CLEAR ?auto_25196 ) ( TRUCK-AT ?auto_25213 ?auto_25214 ) ( not ( = ?auto_25195 ?auto_25196 ) ) ( not ( = ?auto_25195 ?auto_25218 ) ) ( not ( = ?auto_25196 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25197 ) ) ( not ( = ?auto_25195 ?auto_25241 ) ) ( not ( = ?auto_25197 ?auto_25218 ) ) ( not ( = ?auto_25233 ?auto_25224 ) ) ( not ( = ?auto_25244 ?auto_25237 ) ) ( not ( = ?auto_25241 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25198 ) ) ( not ( = ?auto_25195 ?auto_25230 ) ) ( not ( = ?auto_25196 ?auto_25198 ) ) ( not ( = ?auto_25196 ?auto_25230 ) ) ( not ( = ?auto_25198 ?auto_25241 ) ) ( not ( = ?auto_25198 ?auto_25218 ) ) ( not ( = ?auto_25236 ?auto_25233 ) ) ( not ( = ?auto_25236 ?auto_25224 ) ) ( not ( = ?auto_25235 ?auto_25244 ) ) ( not ( = ?auto_25235 ?auto_25237 ) ) ( not ( = ?auto_25230 ?auto_25241 ) ) ( not ( = ?auto_25230 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25199 ) ) ( not ( = ?auto_25195 ?auto_25219 ) ) ( not ( = ?auto_25196 ?auto_25199 ) ) ( not ( = ?auto_25196 ?auto_25219 ) ) ( not ( = ?auto_25197 ?auto_25199 ) ) ( not ( = ?auto_25197 ?auto_25219 ) ) ( not ( = ?auto_25199 ?auto_25230 ) ) ( not ( = ?auto_25199 ?auto_25241 ) ) ( not ( = ?auto_25199 ?auto_25218 ) ) ( not ( = ?auto_25231 ?auto_25236 ) ) ( not ( = ?auto_25231 ?auto_25233 ) ) ( not ( = ?auto_25231 ?auto_25224 ) ) ( not ( = ?auto_25242 ?auto_25235 ) ) ( not ( = ?auto_25242 ?auto_25244 ) ) ( not ( = ?auto_25242 ?auto_25237 ) ) ( not ( = ?auto_25219 ?auto_25230 ) ) ( not ( = ?auto_25219 ?auto_25241 ) ) ( not ( = ?auto_25219 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25200 ) ) ( not ( = ?auto_25195 ?auto_25220 ) ) ( not ( = ?auto_25196 ?auto_25200 ) ) ( not ( = ?auto_25196 ?auto_25220 ) ) ( not ( = ?auto_25197 ?auto_25200 ) ) ( not ( = ?auto_25197 ?auto_25220 ) ) ( not ( = ?auto_25198 ?auto_25200 ) ) ( not ( = ?auto_25198 ?auto_25220 ) ) ( not ( = ?auto_25200 ?auto_25219 ) ) ( not ( = ?auto_25200 ?auto_25230 ) ) ( not ( = ?auto_25200 ?auto_25241 ) ) ( not ( = ?auto_25200 ?auto_25218 ) ) ( not ( = ?auto_25220 ?auto_25219 ) ) ( not ( = ?auto_25220 ?auto_25230 ) ) ( not ( = ?auto_25220 ?auto_25241 ) ) ( not ( = ?auto_25220 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25201 ) ) ( not ( = ?auto_25195 ?auto_25229 ) ) ( not ( = ?auto_25196 ?auto_25201 ) ) ( not ( = ?auto_25196 ?auto_25229 ) ) ( not ( = ?auto_25197 ?auto_25201 ) ) ( not ( = ?auto_25197 ?auto_25229 ) ) ( not ( = ?auto_25198 ?auto_25201 ) ) ( not ( = ?auto_25198 ?auto_25229 ) ) ( not ( = ?auto_25199 ?auto_25201 ) ) ( not ( = ?auto_25199 ?auto_25229 ) ) ( not ( = ?auto_25201 ?auto_25220 ) ) ( not ( = ?auto_25201 ?auto_25219 ) ) ( not ( = ?auto_25201 ?auto_25230 ) ) ( not ( = ?auto_25201 ?auto_25241 ) ) ( not ( = ?auto_25201 ?auto_25218 ) ) ( not ( = ?auto_25229 ?auto_25220 ) ) ( not ( = ?auto_25229 ?auto_25219 ) ) ( not ( = ?auto_25229 ?auto_25230 ) ) ( not ( = ?auto_25229 ?auto_25241 ) ) ( not ( = ?auto_25229 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25202 ) ) ( not ( = ?auto_25195 ?auto_25221 ) ) ( not ( = ?auto_25196 ?auto_25202 ) ) ( not ( = ?auto_25196 ?auto_25221 ) ) ( not ( = ?auto_25197 ?auto_25202 ) ) ( not ( = ?auto_25197 ?auto_25221 ) ) ( not ( = ?auto_25198 ?auto_25202 ) ) ( not ( = ?auto_25198 ?auto_25221 ) ) ( not ( = ?auto_25199 ?auto_25202 ) ) ( not ( = ?auto_25199 ?auto_25221 ) ) ( not ( = ?auto_25200 ?auto_25202 ) ) ( not ( = ?auto_25200 ?auto_25221 ) ) ( not ( = ?auto_25202 ?auto_25229 ) ) ( not ( = ?auto_25202 ?auto_25220 ) ) ( not ( = ?auto_25202 ?auto_25219 ) ) ( not ( = ?auto_25202 ?auto_25230 ) ) ( not ( = ?auto_25202 ?auto_25241 ) ) ( not ( = ?auto_25202 ?auto_25218 ) ) ( not ( = ?auto_25221 ?auto_25229 ) ) ( not ( = ?auto_25221 ?auto_25220 ) ) ( not ( = ?auto_25221 ?auto_25219 ) ) ( not ( = ?auto_25221 ?auto_25230 ) ) ( not ( = ?auto_25221 ?auto_25241 ) ) ( not ( = ?auto_25221 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25203 ) ) ( not ( = ?auto_25195 ?auto_25217 ) ) ( not ( = ?auto_25196 ?auto_25203 ) ) ( not ( = ?auto_25196 ?auto_25217 ) ) ( not ( = ?auto_25197 ?auto_25203 ) ) ( not ( = ?auto_25197 ?auto_25217 ) ) ( not ( = ?auto_25198 ?auto_25203 ) ) ( not ( = ?auto_25198 ?auto_25217 ) ) ( not ( = ?auto_25199 ?auto_25203 ) ) ( not ( = ?auto_25199 ?auto_25217 ) ) ( not ( = ?auto_25200 ?auto_25203 ) ) ( not ( = ?auto_25200 ?auto_25217 ) ) ( not ( = ?auto_25201 ?auto_25203 ) ) ( not ( = ?auto_25201 ?auto_25217 ) ) ( not ( = ?auto_25203 ?auto_25221 ) ) ( not ( = ?auto_25203 ?auto_25229 ) ) ( not ( = ?auto_25203 ?auto_25220 ) ) ( not ( = ?auto_25203 ?auto_25219 ) ) ( not ( = ?auto_25203 ?auto_25230 ) ) ( not ( = ?auto_25203 ?auto_25241 ) ) ( not ( = ?auto_25203 ?auto_25218 ) ) ( not ( = ?auto_25211 ?auto_25236 ) ) ( not ( = ?auto_25211 ?auto_25231 ) ) ( not ( = ?auto_25211 ?auto_25224 ) ) ( not ( = ?auto_25211 ?auto_25233 ) ) ( not ( = ?auto_25216 ?auto_25235 ) ) ( not ( = ?auto_25216 ?auto_25242 ) ) ( not ( = ?auto_25216 ?auto_25237 ) ) ( not ( = ?auto_25216 ?auto_25244 ) ) ( not ( = ?auto_25217 ?auto_25221 ) ) ( not ( = ?auto_25217 ?auto_25229 ) ) ( not ( = ?auto_25217 ?auto_25220 ) ) ( not ( = ?auto_25217 ?auto_25219 ) ) ( not ( = ?auto_25217 ?auto_25230 ) ) ( not ( = ?auto_25217 ?auto_25241 ) ) ( not ( = ?auto_25217 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25204 ) ) ( not ( = ?auto_25195 ?auto_25240 ) ) ( not ( = ?auto_25196 ?auto_25204 ) ) ( not ( = ?auto_25196 ?auto_25240 ) ) ( not ( = ?auto_25197 ?auto_25204 ) ) ( not ( = ?auto_25197 ?auto_25240 ) ) ( not ( = ?auto_25198 ?auto_25204 ) ) ( not ( = ?auto_25198 ?auto_25240 ) ) ( not ( = ?auto_25199 ?auto_25204 ) ) ( not ( = ?auto_25199 ?auto_25240 ) ) ( not ( = ?auto_25200 ?auto_25204 ) ) ( not ( = ?auto_25200 ?auto_25240 ) ) ( not ( = ?auto_25201 ?auto_25204 ) ) ( not ( = ?auto_25201 ?auto_25240 ) ) ( not ( = ?auto_25202 ?auto_25204 ) ) ( not ( = ?auto_25202 ?auto_25240 ) ) ( not ( = ?auto_25204 ?auto_25217 ) ) ( not ( = ?auto_25204 ?auto_25221 ) ) ( not ( = ?auto_25204 ?auto_25229 ) ) ( not ( = ?auto_25204 ?auto_25220 ) ) ( not ( = ?auto_25204 ?auto_25219 ) ) ( not ( = ?auto_25204 ?auto_25230 ) ) ( not ( = ?auto_25204 ?auto_25241 ) ) ( not ( = ?auto_25204 ?auto_25218 ) ) ( not ( = ?auto_25226 ?auto_25211 ) ) ( not ( = ?auto_25226 ?auto_25236 ) ) ( not ( = ?auto_25226 ?auto_25231 ) ) ( not ( = ?auto_25226 ?auto_25224 ) ) ( not ( = ?auto_25226 ?auto_25233 ) ) ( not ( = ?auto_25227 ?auto_25216 ) ) ( not ( = ?auto_25227 ?auto_25235 ) ) ( not ( = ?auto_25227 ?auto_25242 ) ) ( not ( = ?auto_25227 ?auto_25237 ) ) ( not ( = ?auto_25227 ?auto_25244 ) ) ( not ( = ?auto_25240 ?auto_25217 ) ) ( not ( = ?auto_25240 ?auto_25221 ) ) ( not ( = ?auto_25240 ?auto_25229 ) ) ( not ( = ?auto_25240 ?auto_25220 ) ) ( not ( = ?auto_25240 ?auto_25219 ) ) ( not ( = ?auto_25240 ?auto_25230 ) ) ( not ( = ?auto_25240 ?auto_25241 ) ) ( not ( = ?auto_25240 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25205 ) ) ( not ( = ?auto_25195 ?auto_25228 ) ) ( not ( = ?auto_25196 ?auto_25205 ) ) ( not ( = ?auto_25196 ?auto_25228 ) ) ( not ( = ?auto_25197 ?auto_25205 ) ) ( not ( = ?auto_25197 ?auto_25228 ) ) ( not ( = ?auto_25198 ?auto_25205 ) ) ( not ( = ?auto_25198 ?auto_25228 ) ) ( not ( = ?auto_25199 ?auto_25205 ) ) ( not ( = ?auto_25199 ?auto_25228 ) ) ( not ( = ?auto_25200 ?auto_25205 ) ) ( not ( = ?auto_25200 ?auto_25228 ) ) ( not ( = ?auto_25201 ?auto_25205 ) ) ( not ( = ?auto_25201 ?auto_25228 ) ) ( not ( = ?auto_25202 ?auto_25205 ) ) ( not ( = ?auto_25202 ?auto_25228 ) ) ( not ( = ?auto_25203 ?auto_25205 ) ) ( not ( = ?auto_25203 ?auto_25228 ) ) ( not ( = ?auto_25205 ?auto_25240 ) ) ( not ( = ?auto_25205 ?auto_25217 ) ) ( not ( = ?auto_25205 ?auto_25221 ) ) ( not ( = ?auto_25205 ?auto_25229 ) ) ( not ( = ?auto_25205 ?auto_25220 ) ) ( not ( = ?auto_25205 ?auto_25219 ) ) ( not ( = ?auto_25205 ?auto_25230 ) ) ( not ( = ?auto_25205 ?auto_25241 ) ) ( not ( = ?auto_25205 ?auto_25218 ) ) ( not ( = ?auto_25228 ?auto_25240 ) ) ( not ( = ?auto_25228 ?auto_25217 ) ) ( not ( = ?auto_25228 ?auto_25221 ) ) ( not ( = ?auto_25228 ?auto_25229 ) ) ( not ( = ?auto_25228 ?auto_25220 ) ) ( not ( = ?auto_25228 ?auto_25219 ) ) ( not ( = ?auto_25228 ?auto_25230 ) ) ( not ( = ?auto_25228 ?auto_25241 ) ) ( not ( = ?auto_25228 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25206 ) ) ( not ( = ?auto_25195 ?auto_25225 ) ) ( not ( = ?auto_25196 ?auto_25206 ) ) ( not ( = ?auto_25196 ?auto_25225 ) ) ( not ( = ?auto_25197 ?auto_25206 ) ) ( not ( = ?auto_25197 ?auto_25225 ) ) ( not ( = ?auto_25198 ?auto_25206 ) ) ( not ( = ?auto_25198 ?auto_25225 ) ) ( not ( = ?auto_25199 ?auto_25206 ) ) ( not ( = ?auto_25199 ?auto_25225 ) ) ( not ( = ?auto_25200 ?auto_25206 ) ) ( not ( = ?auto_25200 ?auto_25225 ) ) ( not ( = ?auto_25201 ?auto_25206 ) ) ( not ( = ?auto_25201 ?auto_25225 ) ) ( not ( = ?auto_25202 ?auto_25206 ) ) ( not ( = ?auto_25202 ?auto_25225 ) ) ( not ( = ?auto_25203 ?auto_25206 ) ) ( not ( = ?auto_25203 ?auto_25225 ) ) ( not ( = ?auto_25204 ?auto_25206 ) ) ( not ( = ?auto_25204 ?auto_25225 ) ) ( not ( = ?auto_25206 ?auto_25228 ) ) ( not ( = ?auto_25206 ?auto_25240 ) ) ( not ( = ?auto_25206 ?auto_25217 ) ) ( not ( = ?auto_25206 ?auto_25221 ) ) ( not ( = ?auto_25206 ?auto_25229 ) ) ( not ( = ?auto_25206 ?auto_25220 ) ) ( not ( = ?auto_25206 ?auto_25219 ) ) ( not ( = ?auto_25206 ?auto_25230 ) ) ( not ( = ?auto_25206 ?auto_25241 ) ) ( not ( = ?auto_25206 ?auto_25218 ) ) ( not ( = ?auto_25225 ?auto_25228 ) ) ( not ( = ?auto_25225 ?auto_25240 ) ) ( not ( = ?auto_25225 ?auto_25217 ) ) ( not ( = ?auto_25225 ?auto_25221 ) ) ( not ( = ?auto_25225 ?auto_25229 ) ) ( not ( = ?auto_25225 ?auto_25220 ) ) ( not ( = ?auto_25225 ?auto_25219 ) ) ( not ( = ?auto_25225 ?auto_25230 ) ) ( not ( = ?auto_25225 ?auto_25241 ) ) ( not ( = ?auto_25225 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25207 ) ) ( not ( = ?auto_25195 ?auto_25239 ) ) ( not ( = ?auto_25196 ?auto_25207 ) ) ( not ( = ?auto_25196 ?auto_25239 ) ) ( not ( = ?auto_25197 ?auto_25207 ) ) ( not ( = ?auto_25197 ?auto_25239 ) ) ( not ( = ?auto_25198 ?auto_25207 ) ) ( not ( = ?auto_25198 ?auto_25239 ) ) ( not ( = ?auto_25199 ?auto_25207 ) ) ( not ( = ?auto_25199 ?auto_25239 ) ) ( not ( = ?auto_25200 ?auto_25207 ) ) ( not ( = ?auto_25200 ?auto_25239 ) ) ( not ( = ?auto_25201 ?auto_25207 ) ) ( not ( = ?auto_25201 ?auto_25239 ) ) ( not ( = ?auto_25202 ?auto_25207 ) ) ( not ( = ?auto_25202 ?auto_25239 ) ) ( not ( = ?auto_25203 ?auto_25207 ) ) ( not ( = ?auto_25203 ?auto_25239 ) ) ( not ( = ?auto_25204 ?auto_25207 ) ) ( not ( = ?auto_25204 ?auto_25239 ) ) ( not ( = ?auto_25205 ?auto_25207 ) ) ( not ( = ?auto_25205 ?auto_25239 ) ) ( not ( = ?auto_25207 ?auto_25225 ) ) ( not ( = ?auto_25207 ?auto_25228 ) ) ( not ( = ?auto_25207 ?auto_25240 ) ) ( not ( = ?auto_25207 ?auto_25217 ) ) ( not ( = ?auto_25207 ?auto_25221 ) ) ( not ( = ?auto_25207 ?auto_25229 ) ) ( not ( = ?auto_25207 ?auto_25220 ) ) ( not ( = ?auto_25207 ?auto_25219 ) ) ( not ( = ?auto_25207 ?auto_25230 ) ) ( not ( = ?auto_25207 ?auto_25241 ) ) ( not ( = ?auto_25207 ?auto_25218 ) ) ( not ( = ?auto_25234 ?auto_25236 ) ) ( not ( = ?auto_25234 ?auto_25233 ) ) ( not ( = ?auto_25234 ?auto_25226 ) ) ( not ( = ?auto_25234 ?auto_25211 ) ) ( not ( = ?auto_25234 ?auto_25231 ) ) ( not ( = ?auto_25234 ?auto_25224 ) ) ( not ( = ?auto_25222 ?auto_25235 ) ) ( not ( = ?auto_25222 ?auto_25244 ) ) ( not ( = ?auto_25222 ?auto_25227 ) ) ( not ( = ?auto_25222 ?auto_25216 ) ) ( not ( = ?auto_25222 ?auto_25242 ) ) ( not ( = ?auto_25222 ?auto_25237 ) ) ( not ( = ?auto_25239 ?auto_25225 ) ) ( not ( = ?auto_25239 ?auto_25228 ) ) ( not ( = ?auto_25239 ?auto_25240 ) ) ( not ( = ?auto_25239 ?auto_25217 ) ) ( not ( = ?auto_25239 ?auto_25221 ) ) ( not ( = ?auto_25239 ?auto_25229 ) ) ( not ( = ?auto_25239 ?auto_25220 ) ) ( not ( = ?auto_25239 ?auto_25219 ) ) ( not ( = ?auto_25239 ?auto_25230 ) ) ( not ( = ?auto_25239 ?auto_25241 ) ) ( not ( = ?auto_25239 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25208 ) ) ( not ( = ?auto_25195 ?auto_25238 ) ) ( not ( = ?auto_25196 ?auto_25208 ) ) ( not ( = ?auto_25196 ?auto_25238 ) ) ( not ( = ?auto_25197 ?auto_25208 ) ) ( not ( = ?auto_25197 ?auto_25238 ) ) ( not ( = ?auto_25198 ?auto_25208 ) ) ( not ( = ?auto_25198 ?auto_25238 ) ) ( not ( = ?auto_25199 ?auto_25208 ) ) ( not ( = ?auto_25199 ?auto_25238 ) ) ( not ( = ?auto_25200 ?auto_25208 ) ) ( not ( = ?auto_25200 ?auto_25238 ) ) ( not ( = ?auto_25201 ?auto_25208 ) ) ( not ( = ?auto_25201 ?auto_25238 ) ) ( not ( = ?auto_25202 ?auto_25208 ) ) ( not ( = ?auto_25202 ?auto_25238 ) ) ( not ( = ?auto_25203 ?auto_25208 ) ) ( not ( = ?auto_25203 ?auto_25238 ) ) ( not ( = ?auto_25204 ?auto_25208 ) ) ( not ( = ?auto_25204 ?auto_25238 ) ) ( not ( = ?auto_25205 ?auto_25208 ) ) ( not ( = ?auto_25205 ?auto_25238 ) ) ( not ( = ?auto_25206 ?auto_25208 ) ) ( not ( = ?auto_25206 ?auto_25238 ) ) ( not ( = ?auto_25208 ?auto_25239 ) ) ( not ( = ?auto_25208 ?auto_25225 ) ) ( not ( = ?auto_25208 ?auto_25228 ) ) ( not ( = ?auto_25208 ?auto_25240 ) ) ( not ( = ?auto_25208 ?auto_25217 ) ) ( not ( = ?auto_25208 ?auto_25221 ) ) ( not ( = ?auto_25208 ?auto_25229 ) ) ( not ( = ?auto_25208 ?auto_25220 ) ) ( not ( = ?auto_25208 ?auto_25219 ) ) ( not ( = ?auto_25208 ?auto_25230 ) ) ( not ( = ?auto_25208 ?auto_25241 ) ) ( not ( = ?auto_25208 ?auto_25218 ) ) ( not ( = ?auto_25223 ?auto_25234 ) ) ( not ( = ?auto_25223 ?auto_25236 ) ) ( not ( = ?auto_25223 ?auto_25233 ) ) ( not ( = ?auto_25223 ?auto_25226 ) ) ( not ( = ?auto_25223 ?auto_25211 ) ) ( not ( = ?auto_25223 ?auto_25231 ) ) ( not ( = ?auto_25223 ?auto_25224 ) ) ( not ( = ?auto_25232 ?auto_25222 ) ) ( not ( = ?auto_25232 ?auto_25235 ) ) ( not ( = ?auto_25232 ?auto_25244 ) ) ( not ( = ?auto_25232 ?auto_25227 ) ) ( not ( = ?auto_25232 ?auto_25216 ) ) ( not ( = ?auto_25232 ?auto_25242 ) ) ( not ( = ?auto_25232 ?auto_25237 ) ) ( not ( = ?auto_25238 ?auto_25239 ) ) ( not ( = ?auto_25238 ?auto_25225 ) ) ( not ( = ?auto_25238 ?auto_25228 ) ) ( not ( = ?auto_25238 ?auto_25240 ) ) ( not ( = ?auto_25238 ?auto_25217 ) ) ( not ( = ?auto_25238 ?auto_25221 ) ) ( not ( = ?auto_25238 ?auto_25229 ) ) ( not ( = ?auto_25238 ?auto_25220 ) ) ( not ( = ?auto_25238 ?auto_25219 ) ) ( not ( = ?auto_25238 ?auto_25230 ) ) ( not ( = ?auto_25238 ?auto_25241 ) ) ( not ( = ?auto_25238 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25209 ) ) ( not ( = ?auto_25195 ?auto_25243 ) ) ( not ( = ?auto_25196 ?auto_25209 ) ) ( not ( = ?auto_25196 ?auto_25243 ) ) ( not ( = ?auto_25197 ?auto_25209 ) ) ( not ( = ?auto_25197 ?auto_25243 ) ) ( not ( = ?auto_25198 ?auto_25209 ) ) ( not ( = ?auto_25198 ?auto_25243 ) ) ( not ( = ?auto_25199 ?auto_25209 ) ) ( not ( = ?auto_25199 ?auto_25243 ) ) ( not ( = ?auto_25200 ?auto_25209 ) ) ( not ( = ?auto_25200 ?auto_25243 ) ) ( not ( = ?auto_25201 ?auto_25209 ) ) ( not ( = ?auto_25201 ?auto_25243 ) ) ( not ( = ?auto_25202 ?auto_25209 ) ) ( not ( = ?auto_25202 ?auto_25243 ) ) ( not ( = ?auto_25203 ?auto_25209 ) ) ( not ( = ?auto_25203 ?auto_25243 ) ) ( not ( = ?auto_25204 ?auto_25209 ) ) ( not ( = ?auto_25204 ?auto_25243 ) ) ( not ( = ?auto_25205 ?auto_25209 ) ) ( not ( = ?auto_25205 ?auto_25243 ) ) ( not ( = ?auto_25206 ?auto_25209 ) ) ( not ( = ?auto_25206 ?auto_25243 ) ) ( not ( = ?auto_25207 ?auto_25209 ) ) ( not ( = ?auto_25207 ?auto_25243 ) ) ( not ( = ?auto_25209 ?auto_25238 ) ) ( not ( = ?auto_25209 ?auto_25239 ) ) ( not ( = ?auto_25209 ?auto_25225 ) ) ( not ( = ?auto_25209 ?auto_25228 ) ) ( not ( = ?auto_25209 ?auto_25240 ) ) ( not ( = ?auto_25209 ?auto_25217 ) ) ( not ( = ?auto_25209 ?auto_25221 ) ) ( not ( = ?auto_25209 ?auto_25229 ) ) ( not ( = ?auto_25209 ?auto_25220 ) ) ( not ( = ?auto_25209 ?auto_25219 ) ) ( not ( = ?auto_25209 ?auto_25230 ) ) ( not ( = ?auto_25209 ?auto_25241 ) ) ( not ( = ?auto_25209 ?auto_25218 ) ) ( not ( = ?auto_25243 ?auto_25238 ) ) ( not ( = ?auto_25243 ?auto_25239 ) ) ( not ( = ?auto_25243 ?auto_25225 ) ) ( not ( = ?auto_25243 ?auto_25228 ) ) ( not ( = ?auto_25243 ?auto_25240 ) ) ( not ( = ?auto_25243 ?auto_25217 ) ) ( not ( = ?auto_25243 ?auto_25221 ) ) ( not ( = ?auto_25243 ?auto_25229 ) ) ( not ( = ?auto_25243 ?auto_25220 ) ) ( not ( = ?auto_25243 ?auto_25219 ) ) ( not ( = ?auto_25243 ?auto_25230 ) ) ( not ( = ?auto_25243 ?auto_25241 ) ) ( not ( = ?auto_25243 ?auto_25218 ) ) ( not ( = ?auto_25195 ?auto_25210 ) ) ( not ( = ?auto_25195 ?auto_25212 ) ) ( not ( = ?auto_25196 ?auto_25210 ) ) ( not ( = ?auto_25196 ?auto_25212 ) ) ( not ( = ?auto_25197 ?auto_25210 ) ) ( not ( = ?auto_25197 ?auto_25212 ) ) ( not ( = ?auto_25198 ?auto_25210 ) ) ( not ( = ?auto_25198 ?auto_25212 ) ) ( not ( = ?auto_25199 ?auto_25210 ) ) ( not ( = ?auto_25199 ?auto_25212 ) ) ( not ( = ?auto_25200 ?auto_25210 ) ) ( not ( = ?auto_25200 ?auto_25212 ) ) ( not ( = ?auto_25201 ?auto_25210 ) ) ( not ( = ?auto_25201 ?auto_25212 ) ) ( not ( = ?auto_25202 ?auto_25210 ) ) ( not ( = ?auto_25202 ?auto_25212 ) ) ( not ( = ?auto_25203 ?auto_25210 ) ) ( not ( = ?auto_25203 ?auto_25212 ) ) ( not ( = ?auto_25204 ?auto_25210 ) ) ( not ( = ?auto_25204 ?auto_25212 ) ) ( not ( = ?auto_25205 ?auto_25210 ) ) ( not ( = ?auto_25205 ?auto_25212 ) ) ( not ( = ?auto_25206 ?auto_25210 ) ) ( not ( = ?auto_25206 ?auto_25212 ) ) ( not ( = ?auto_25207 ?auto_25210 ) ) ( not ( = ?auto_25207 ?auto_25212 ) ) ( not ( = ?auto_25208 ?auto_25210 ) ) ( not ( = ?auto_25208 ?auto_25212 ) ) ( not ( = ?auto_25210 ?auto_25243 ) ) ( not ( = ?auto_25210 ?auto_25238 ) ) ( not ( = ?auto_25210 ?auto_25239 ) ) ( not ( = ?auto_25210 ?auto_25225 ) ) ( not ( = ?auto_25210 ?auto_25228 ) ) ( not ( = ?auto_25210 ?auto_25240 ) ) ( not ( = ?auto_25210 ?auto_25217 ) ) ( not ( = ?auto_25210 ?auto_25221 ) ) ( not ( = ?auto_25210 ?auto_25229 ) ) ( not ( = ?auto_25210 ?auto_25220 ) ) ( not ( = ?auto_25210 ?auto_25219 ) ) ( not ( = ?auto_25210 ?auto_25230 ) ) ( not ( = ?auto_25210 ?auto_25241 ) ) ( not ( = ?auto_25210 ?auto_25218 ) ) ( not ( = ?auto_25212 ?auto_25243 ) ) ( not ( = ?auto_25212 ?auto_25238 ) ) ( not ( = ?auto_25212 ?auto_25239 ) ) ( not ( = ?auto_25212 ?auto_25225 ) ) ( not ( = ?auto_25212 ?auto_25228 ) ) ( not ( = ?auto_25212 ?auto_25240 ) ) ( not ( = ?auto_25212 ?auto_25217 ) ) ( not ( = ?auto_25212 ?auto_25221 ) ) ( not ( = ?auto_25212 ?auto_25229 ) ) ( not ( = ?auto_25212 ?auto_25220 ) ) ( not ( = ?auto_25212 ?auto_25219 ) ) ( not ( = ?auto_25212 ?auto_25230 ) ) ( not ( = ?auto_25212 ?auto_25241 ) ) ( not ( = ?auto_25212 ?auto_25218 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_25195 ?auto_25196 ?auto_25197 ?auto_25198 ?auto_25199 ?auto_25200 ?auto_25201 ?auto_25202 ?auto_25203 ?auto_25204 ?auto_25205 ?auto_25206 ?auto_25207 ?auto_25208 ?auto_25209 )
      ( MAKE-1CRATE ?auto_25209 ?auto_25210 )
      ( MAKE-15CRATE-VERIFY ?auto_25195 ?auto_25196 ?auto_25197 ?auto_25198 ?auto_25199 ?auto_25200 ?auto_25201 ?auto_25202 ?auto_25203 ?auto_25204 ?auto_25205 ?auto_25206 ?auto_25207 ?auto_25208 ?auto_25209 ?auto_25210 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_25272 - SURFACE
      ?auto_25273 - SURFACE
      ?auto_25274 - SURFACE
      ?auto_25275 - SURFACE
      ?auto_25276 - SURFACE
      ?auto_25277 - SURFACE
      ?auto_25278 - SURFACE
      ?auto_25279 - SURFACE
      ?auto_25280 - SURFACE
      ?auto_25281 - SURFACE
      ?auto_25282 - SURFACE
      ?auto_25283 - SURFACE
      ?auto_25284 - SURFACE
      ?auto_25285 - SURFACE
      ?auto_25286 - SURFACE
      ?auto_25287 - SURFACE
      ?auto_25288 - SURFACE
    )
    :vars
    (
      ?auto_25293 - HOIST
      ?auto_25291 - PLACE
      ?auto_25292 - PLACE
      ?auto_25294 - HOIST
      ?auto_25289 - SURFACE
      ?auto_25295 - PLACE
      ?auto_25314 - HOIST
      ?auto_25300 - SURFACE
      ?auto_25308 - PLACE
      ?auto_25303 - HOIST
      ?auto_25310 - SURFACE
      ?auto_25297 - PLACE
      ?auto_25323 - HOIST
      ?auto_25309 - SURFACE
      ?auto_25312 - PLACE
      ?auto_25311 - HOIST
      ?auto_25322 - SURFACE
      ?auto_25298 - SURFACE
      ?auto_25296 - PLACE
      ?auto_25302 - HOIST
      ?auto_25319 - SURFACE
      ?auto_25318 - SURFACE
      ?auto_25315 - SURFACE
      ?auto_25306 - SURFACE
      ?auto_25305 - PLACE
      ?auto_25321 - HOIST
      ?auto_25307 - SURFACE
      ?auto_25304 - PLACE
      ?auto_25301 - HOIST
      ?auto_25320 - SURFACE
      ?auto_25316 - SURFACE
      ?auto_25317 - SURFACE
      ?auto_25313 - SURFACE
      ?auto_25299 - SURFACE
      ?auto_25290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25293 ?auto_25291 ) ( IS-CRATE ?auto_25288 ) ( not ( = ?auto_25292 ?auto_25291 ) ) ( HOIST-AT ?auto_25294 ?auto_25292 ) ( SURFACE-AT ?auto_25288 ?auto_25292 ) ( ON ?auto_25288 ?auto_25289 ) ( CLEAR ?auto_25288 ) ( not ( = ?auto_25287 ?auto_25288 ) ) ( not ( = ?auto_25287 ?auto_25289 ) ) ( not ( = ?auto_25288 ?auto_25289 ) ) ( not ( = ?auto_25293 ?auto_25294 ) ) ( IS-CRATE ?auto_25287 ) ( not ( = ?auto_25295 ?auto_25291 ) ) ( HOIST-AT ?auto_25314 ?auto_25295 ) ( SURFACE-AT ?auto_25287 ?auto_25295 ) ( ON ?auto_25287 ?auto_25300 ) ( CLEAR ?auto_25287 ) ( not ( = ?auto_25286 ?auto_25287 ) ) ( not ( = ?auto_25286 ?auto_25300 ) ) ( not ( = ?auto_25287 ?auto_25300 ) ) ( not ( = ?auto_25293 ?auto_25314 ) ) ( IS-CRATE ?auto_25286 ) ( not ( = ?auto_25308 ?auto_25291 ) ) ( HOIST-AT ?auto_25303 ?auto_25308 ) ( SURFACE-AT ?auto_25286 ?auto_25308 ) ( ON ?auto_25286 ?auto_25310 ) ( CLEAR ?auto_25286 ) ( not ( = ?auto_25285 ?auto_25286 ) ) ( not ( = ?auto_25285 ?auto_25310 ) ) ( not ( = ?auto_25286 ?auto_25310 ) ) ( not ( = ?auto_25293 ?auto_25303 ) ) ( IS-CRATE ?auto_25285 ) ( not ( = ?auto_25297 ?auto_25291 ) ) ( HOIST-AT ?auto_25323 ?auto_25297 ) ( AVAILABLE ?auto_25323 ) ( SURFACE-AT ?auto_25285 ?auto_25297 ) ( ON ?auto_25285 ?auto_25309 ) ( CLEAR ?auto_25285 ) ( not ( = ?auto_25284 ?auto_25285 ) ) ( not ( = ?auto_25284 ?auto_25309 ) ) ( not ( = ?auto_25285 ?auto_25309 ) ) ( not ( = ?auto_25293 ?auto_25323 ) ) ( IS-CRATE ?auto_25284 ) ( not ( = ?auto_25312 ?auto_25291 ) ) ( HOIST-AT ?auto_25311 ?auto_25312 ) ( AVAILABLE ?auto_25311 ) ( SURFACE-AT ?auto_25284 ?auto_25312 ) ( ON ?auto_25284 ?auto_25322 ) ( CLEAR ?auto_25284 ) ( not ( = ?auto_25283 ?auto_25284 ) ) ( not ( = ?auto_25283 ?auto_25322 ) ) ( not ( = ?auto_25284 ?auto_25322 ) ) ( not ( = ?auto_25293 ?auto_25311 ) ) ( IS-CRATE ?auto_25283 ) ( SURFACE-AT ?auto_25283 ?auto_25292 ) ( ON ?auto_25283 ?auto_25298 ) ( CLEAR ?auto_25283 ) ( not ( = ?auto_25282 ?auto_25283 ) ) ( not ( = ?auto_25282 ?auto_25298 ) ) ( not ( = ?auto_25283 ?auto_25298 ) ) ( IS-CRATE ?auto_25282 ) ( not ( = ?auto_25296 ?auto_25291 ) ) ( HOIST-AT ?auto_25302 ?auto_25296 ) ( SURFACE-AT ?auto_25282 ?auto_25296 ) ( ON ?auto_25282 ?auto_25319 ) ( CLEAR ?auto_25282 ) ( not ( = ?auto_25281 ?auto_25282 ) ) ( not ( = ?auto_25281 ?auto_25319 ) ) ( not ( = ?auto_25282 ?auto_25319 ) ) ( not ( = ?auto_25293 ?auto_25302 ) ) ( IS-CRATE ?auto_25281 ) ( AVAILABLE ?auto_25303 ) ( SURFACE-AT ?auto_25281 ?auto_25308 ) ( ON ?auto_25281 ?auto_25318 ) ( CLEAR ?auto_25281 ) ( not ( = ?auto_25280 ?auto_25281 ) ) ( not ( = ?auto_25280 ?auto_25318 ) ) ( not ( = ?auto_25281 ?auto_25318 ) ) ( IS-CRATE ?auto_25280 ) ( AVAILABLE ?auto_25314 ) ( SURFACE-AT ?auto_25280 ?auto_25295 ) ( ON ?auto_25280 ?auto_25315 ) ( CLEAR ?auto_25280 ) ( not ( = ?auto_25279 ?auto_25280 ) ) ( not ( = ?auto_25279 ?auto_25315 ) ) ( not ( = ?auto_25280 ?auto_25315 ) ) ( IS-CRATE ?auto_25279 ) ( SURFACE-AT ?auto_25279 ?auto_25292 ) ( ON ?auto_25279 ?auto_25306 ) ( CLEAR ?auto_25279 ) ( not ( = ?auto_25278 ?auto_25279 ) ) ( not ( = ?auto_25278 ?auto_25306 ) ) ( not ( = ?auto_25279 ?auto_25306 ) ) ( IS-CRATE ?auto_25278 ) ( not ( = ?auto_25305 ?auto_25291 ) ) ( HOIST-AT ?auto_25321 ?auto_25305 ) ( SURFACE-AT ?auto_25278 ?auto_25305 ) ( ON ?auto_25278 ?auto_25307 ) ( CLEAR ?auto_25278 ) ( not ( = ?auto_25277 ?auto_25278 ) ) ( not ( = ?auto_25277 ?auto_25307 ) ) ( not ( = ?auto_25278 ?auto_25307 ) ) ( not ( = ?auto_25293 ?auto_25321 ) ) ( IS-CRATE ?auto_25277 ) ( not ( = ?auto_25304 ?auto_25291 ) ) ( HOIST-AT ?auto_25301 ?auto_25304 ) ( SURFACE-AT ?auto_25277 ?auto_25304 ) ( ON ?auto_25277 ?auto_25320 ) ( CLEAR ?auto_25277 ) ( not ( = ?auto_25276 ?auto_25277 ) ) ( not ( = ?auto_25276 ?auto_25320 ) ) ( not ( = ?auto_25277 ?auto_25320 ) ) ( not ( = ?auto_25293 ?auto_25301 ) ) ( IS-CRATE ?auto_25276 ) ( AVAILABLE ?auto_25321 ) ( SURFACE-AT ?auto_25276 ?auto_25305 ) ( ON ?auto_25276 ?auto_25316 ) ( CLEAR ?auto_25276 ) ( not ( = ?auto_25275 ?auto_25276 ) ) ( not ( = ?auto_25275 ?auto_25316 ) ) ( not ( = ?auto_25276 ?auto_25316 ) ) ( IS-CRATE ?auto_25275 ) ( AVAILABLE ?auto_25294 ) ( SURFACE-AT ?auto_25275 ?auto_25292 ) ( ON ?auto_25275 ?auto_25317 ) ( CLEAR ?auto_25275 ) ( not ( = ?auto_25274 ?auto_25275 ) ) ( not ( = ?auto_25274 ?auto_25317 ) ) ( not ( = ?auto_25275 ?auto_25317 ) ) ( IS-CRATE ?auto_25274 ) ( AVAILABLE ?auto_25302 ) ( SURFACE-AT ?auto_25274 ?auto_25296 ) ( ON ?auto_25274 ?auto_25313 ) ( CLEAR ?auto_25274 ) ( not ( = ?auto_25273 ?auto_25274 ) ) ( not ( = ?auto_25273 ?auto_25313 ) ) ( not ( = ?auto_25274 ?auto_25313 ) ) ( SURFACE-AT ?auto_25272 ?auto_25291 ) ( CLEAR ?auto_25272 ) ( IS-CRATE ?auto_25273 ) ( AVAILABLE ?auto_25293 ) ( AVAILABLE ?auto_25301 ) ( SURFACE-AT ?auto_25273 ?auto_25304 ) ( ON ?auto_25273 ?auto_25299 ) ( CLEAR ?auto_25273 ) ( TRUCK-AT ?auto_25290 ?auto_25291 ) ( not ( = ?auto_25272 ?auto_25273 ) ) ( not ( = ?auto_25272 ?auto_25299 ) ) ( not ( = ?auto_25273 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25274 ) ) ( not ( = ?auto_25272 ?auto_25313 ) ) ( not ( = ?auto_25274 ?auto_25299 ) ) ( not ( = ?auto_25296 ?auto_25304 ) ) ( not ( = ?auto_25302 ?auto_25301 ) ) ( not ( = ?auto_25313 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25275 ) ) ( not ( = ?auto_25272 ?auto_25317 ) ) ( not ( = ?auto_25273 ?auto_25275 ) ) ( not ( = ?auto_25273 ?auto_25317 ) ) ( not ( = ?auto_25275 ?auto_25313 ) ) ( not ( = ?auto_25275 ?auto_25299 ) ) ( not ( = ?auto_25292 ?auto_25296 ) ) ( not ( = ?auto_25292 ?auto_25304 ) ) ( not ( = ?auto_25294 ?auto_25302 ) ) ( not ( = ?auto_25294 ?auto_25301 ) ) ( not ( = ?auto_25317 ?auto_25313 ) ) ( not ( = ?auto_25317 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25276 ) ) ( not ( = ?auto_25272 ?auto_25316 ) ) ( not ( = ?auto_25273 ?auto_25276 ) ) ( not ( = ?auto_25273 ?auto_25316 ) ) ( not ( = ?auto_25274 ?auto_25276 ) ) ( not ( = ?auto_25274 ?auto_25316 ) ) ( not ( = ?auto_25276 ?auto_25317 ) ) ( not ( = ?auto_25276 ?auto_25313 ) ) ( not ( = ?auto_25276 ?auto_25299 ) ) ( not ( = ?auto_25305 ?auto_25292 ) ) ( not ( = ?auto_25305 ?auto_25296 ) ) ( not ( = ?auto_25305 ?auto_25304 ) ) ( not ( = ?auto_25321 ?auto_25294 ) ) ( not ( = ?auto_25321 ?auto_25302 ) ) ( not ( = ?auto_25321 ?auto_25301 ) ) ( not ( = ?auto_25316 ?auto_25317 ) ) ( not ( = ?auto_25316 ?auto_25313 ) ) ( not ( = ?auto_25316 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25277 ) ) ( not ( = ?auto_25272 ?auto_25320 ) ) ( not ( = ?auto_25273 ?auto_25277 ) ) ( not ( = ?auto_25273 ?auto_25320 ) ) ( not ( = ?auto_25274 ?auto_25277 ) ) ( not ( = ?auto_25274 ?auto_25320 ) ) ( not ( = ?auto_25275 ?auto_25277 ) ) ( not ( = ?auto_25275 ?auto_25320 ) ) ( not ( = ?auto_25277 ?auto_25316 ) ) ( not ( = ?auto_25277 ?auto_25317 ) ) ( not ( = ?auto_25277 ?auto_25313 ) ) ( not ( = ?auto_25277 ?auto_25299 ) ) ( not ( = ?auto_25320 ?auto_25316 ) ) ( not ( = ?auto_25320 ?auto_25317 ) ) ( not ( = ?auto_25320 ?auto_25313 ) ) ( not ( = ?auto_25320 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25278 ) ) ( not ( = ?auto_25272 ?auto_25307 ) ) ( not ( = ?auto_25273 ?auto_25278 ) ) ( not ( = ?auto_25273 ?auto_25307 ) ) ( not ( = ?auto_25274 ?auto_25278 ) ) ( not ( = ?auto_25274 ?auto_25307 ) ) ( not ( = ?auto_25275 ?auto_25278 ) ) ( not ( = ?auto_25275 ?auto_25307 ) ) ( not ( = ?auto_25276 ?auto_25278 ) ) ( not ( = ?auto_25276 ?auto_25307 ) ) ( not ( = ?auto_25278 ?auto_25320 ) ) ( not ( = ?auto_25278 ?auto_25316 ) ) ( not ( = ?auto_25278 ?auto_25317 ) ) ( not ( = ?auto_25278 ?auto_25313 ) ) ( not ( = ?auto_25278 ?auto_25299 ) ) ( not ( = ?auto_25307 ?auto_25320 ) ) ( not ( = ?auto_25307 ?auto_25316 ) ) ( not ( = ?auto_25307 ?auto_25317 ) ) ( not ( = ?auto_25307 ?auto_25313 ) ) ( not ( = ?auto_25307 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25279 ) ) ( not ( = ?auto_25272 ?auto_25306 ) ) ( not ( = ?auto_25273 ?auto_25279 ) ) ( not ( = ?auto_25273 ?auto_25306 ) ) ( not ( = ?auto_25274 ?auto_25279 ) ) ( not ( = ?auto_25274 ?auto_25306 ) ) ( not ( = ?auto_25275 ?auto_25279 ) ) ( not ( = ?auto_25275 ?auto_25306 ) ) ( not ( = ?auto_25276 ?auto_25279 ) ) ( not ( = ?auto_25276 ?auto_25306 ) ) ( not ( = ?auto_25277 ?auto_25279 ) ) ( not ( = ?auto_25277 ?auto_25306 ) ) ( not ( = ?auto_25279 ?auto_25307 ) ) ( not ( = ?auto_25279 ?auto_25320 ) ) ( not ( = ?auto_25279 ?auto_25316 ) ) ( not ( = ?auto_25279 ?auto_25317 ) ) ( not ( = ?auto_25279 ?auto_25313 ) ) ( not ( = ?auto_25279 ?auto_25299 ) ) ( not ( = ?auto_25306 ?auto_25307 ) ) ( not ( = ?auto_25306 ?auto_25320 ) ) ( not ( = ?auto_25306 ?auto_25316 ) ) ( not ( = ?auto_25306 ?auto_25317 ) ) ( not ( = ?auto_25306 ?auto_25313 ) ) ( not ( = ?auto_25306 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25280 ) ) ( not ( = ?auto_25272 ?auto_25315 ) ) ( not ( = ?auto_25273 ?auto_25280 ) ) ( not ( = ?auto_25273 ?auto_25315 ) ) ( not ( = ?auto_25274 ?auto_25280 ) ) ( not ( = ?auto_25274 ?auto_25315 ) ) ( not ( = ?auto_25275 ?auto_25280 ) ) ( not ( = ?auto_25275 ?auto_25315 ) ) ( not ( = ?auto_25276 ?auto_25280 ) ) ( not ( = ?auto_25276 ?auto_25315 ) ) ( not ( = ?auto_25277 ?auto_25280 ) ) ( not ( = ?auto_25277 ?auto_25315 ) ) ( not ( = ?auto_25278 ?auto_25280 ) ) ( not ( = ?auto_25278 ?auto_25315 ) ) ( not ( = ?auto_25280 ?auto_25306 ) ) ( not ( = ?auto_25280 ?auto_25307 ) ) ( not ( = ?auto_25280 ?auto_25320 ) ) ( not ( = ?auto_25280 ?auto_25316 ) ) ( not ( = ?auto_25280 ?auto_25317 ) ) ( not ( = ?auto_25280 ?auto_25313 ) ) ( not ( = ?auto_25280 ?auto_25299 ) ) ( not ( = ?auto_25295 ?auto_25292 ) ) ( not ( = ?auto_25295 ?auto_25305 ) ) ( not ( = ?auto_25295 ?auto_25304 ) ) ( not ( = ?auto_25295 ?auto_25296 ) ) ( not ( = ?auto_25314 ?auto_25294 ) ) ( not ( = ?auto_25314 ?auto_25321 ) ) ( not ( = ?auto_25314 ?auto_25301 ) ) ( not ( = ?auto_25314 ?auto_25302 ) ) ( not ( = ?auto_25315 ?auto_25306 ) ) ( not ( = ?auto_25315 ?auto_25307 ) ) ( not ( = ?auto_25315 ?auto_25320 ) ) ( not ( = ?auto_25315 ?auto_25316 ) ) ( not ( = ?auto_25315 ?auto_25317 ) ) ( not ( = ?auto_25315 ?auto_25313 ) ) ( not ( = ?auto_25315 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25281 ) ) ( not ( = ?auto_25272 ?auto_25318 ) ) ( not ( = ?auto_25273 ?auto_25281 ) ) ( not ( = ?auto_25273 ?auto_25318 ) ) ( not ( = ?auto_25274 ?auto_25281 ) ) ( not ( = ?auto_25274 ?auto_25318 ) ) ( not ( = ?auto_25275 ?auto_25281 ) ) ( not ( = ?auto_25275 ?auto_25318 ) ) ( not ( = ?auto_25276 ?auto_25281 ) ) ( not ( = ?auto_25276 ?auto_25318 ) ) ( not ( = ?auto_25277 ?auto_25281 ) ) ( not ( = ?auto_25277 ?auto_25318 ) ) ( not ( = ?auto_25278 ?auto_25281 ) ) ( not ( = ?auto_25278 ?auto_25318 ) ) ( not ( = ?auto_25279 ?auto_25281 ) ) ( not ( = ?auto_25279 ?auto_25318 ) ) ( not ( = ?auto_25281 ?auto_25315 ) ) ( not ( = ?auto_25281 ?auto_25306 ) ) ( not ( = ?auto_25281 ?auto_25307 ) ) ( not ( = ?auto_25281 ?auto_25320 ) ) ( not ( = ?auto_25281 ?auto_25316 ) ) ( not ( = ?auto_25281 ?auto_25317 ) ) ( not ( = ?auto_25281 ?auto_25313 ) ) ( not ( = ?auto_25281 ?auto_25299 ) ) ( not ( = ?auto_25308 ?auto_25295 ) ) ( not ( = ?auto_25308 ?auto_25292 ) ) ( not ( = ?auto_25308 ?auto_25305 ) ) ( not ( = ?auto_25308 ?auto_25304 ) ) ( not ( = ?auto_25308 ?auto_25296 ) ) ( not ( = ?auto_25303 ?auto_25314 ) ) ( not ( = ?auto_25303 ?auto_25294 ) ) ( not ( = ?auto_25303 ?auto_25321 ) ) ( not ( = ?auto_25303 ?auto_25301 ) ) ( not ( = ?auto_25303 ?auto_25302 ) ) ( not ( = ?auto_25318 ?auto_25315 ) ) ( not ( = ?auto_25318 ?auto_25306 ) ) ( not ( = ?auto_25318 ?auto_25307 ) ) ( not ( = ?auto_25318 ?auto_25320 ) ) ( not ( = ?auto_25318 ?auto_25316 ) ) ( not ( = ?auto_25318 ?auto_25317 ) ) ( not ( = ?auto_25318 ?auto_25313 ) ) ( not ( = ?auto_25318 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25282 ) ) ( not ( = ?auto_25272 ?auto_25319 ) ) ( not ( = ?auto_25273 ?auto_25282 ) ) ( not ( = ?auto_25273 ?auto_25319 ) ) ( not ( = ?auto_25274 ?auto_25282 ) ) ( not ( = ?auto_25274 ?auto_25319 ) ) ( not ( = ?auto_25275 ?auto_25282 ) ) ( not ( = ?auto_25275 ?auto_25319 ) ) ( not ( = ?auto_25276 ?auto_25282 ) ) ( not ( = ?auto_25276 ?auto_25319 ) ) ( not ( = ?auto_25277 ?auto_25282 ) ) ( not ( = ?auto_25277 ?auto_25319 ) ) ( not ( = ?auto_25278 ?auto_25282 ) ) ( not ( = ?auto_25278 ?auto_25319 ) ) ( not ( = ?auto_25279 ?auto_25282 ) ) ( not ( = ?auto_25279 ?auto_25319 ) ) ( not ( = ?auto_25280 ?auto_25282 ) ) ( not ( = ?auto_25280 ?auto_25319 ) ) ( not ( = ?auto_25282 ?auto_25318 ) ) ( not ( = ?auto_25282 ?auto_25315 ) ) ( not ( = ?auto_25282 ?auto_25306 ) ) ( not ( = ?auto_25282 ?auto_25307 ) ) ( not ( = ?auto_25282 ?auto_25320 ) ) ( not ( = ?auto_25282 ?auto_25316 ) ) ( not ( = ?auto_25282 ?auto_25317 ) ) ( not ( = ?auto_25282 ?auto_25313 ) ) ( not ( = ?auto_25282 ?auto_25299 ) ) ( not ( = ?auto_25319 ?auto_25318 ) ) ( not ( = ?auto_25319 ?auto_25315 ) ) ( not ( = ?auto_25319 ?auto_25306 ) ) ( not ( = ?auto_25319 ?auto_25307 ) ) ( not ( = ?auto_25319 ?auto_25320 ) ) ( not ( = ?auto_25319 ?auto_25316 ) ) ( not ( = ?auto_25319 ?auto_25317 ) ) ( not ( = ?auto_25319 ?auto_25313 ) ) ( not ( = ?auto_25319 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25283 ) ) ( not ( = ?auto_25272 ?auto_25298 ) ) ( not ( = ?auto_25273 ?auto_25283 ) ) ( not ( = ?auto_25273 ?auto_25298 ) ) ( not ( = ?auto_25274 ?auto_25283 ) ) ( not ( = ?auto_25274 ?auto_25298 ) ) ( not ( = ?auto_25275 ?auto_25283 ) ) ( not ( = ?auto_25275 ?auto_25298 ) ) ( not ( = ?auto_25276 ?auto_25283 ) ) ( not ( = ?auto_25276 ?auto_25298 ) ) ( not ( = ?auto_25277 ?auto_25283 ) ) ( not ( = ?auto_25277 ?auto_25298 ) ) ( not ( = ?auto_25278 ?auto_25283 ) ) ( not ( = ?auto_25278 ?auto_25298 ) ) ( not ( = ?auto_25279 ?auto_25283 ) ) ( not ( = ?auto_25279 ?auto_25298 ) ) ( not ( = ?auto_25280 ?auto_25283 ) ) ( not ( = ?auto_25280 ?auto_25298 ) ) ( not ( = ?auto_25281 ?auto_25283 ) ) ( not ( = ?auto_25281 ?auto_25298 ) ) ( not ( = ?auto_25283 ?auto_25319 ) ) ( not ( = ?auto_25283 ?auto_25318 ) ) ( not ( = ?auto_25283 ?auto_25315 ) ) ( not ( = ?auto_25283 ?auto_25306 ) ) ( not ( = ?auto_25283 ?auto_25307 ) ) ( not ( = ?auto_25283 ?auto_25320 ) ) ( not ( = ?auto_25283 ?auto_25316 ) ) ( not ( = ?auto_25283 ?auto_25317 ) ) ( not ( = ?auto_25283 ?auto_25313 ) ) ( not ( = ?auto_25283 ?auto_25299 ) ) ( not ( = ?auto_25298 ?auto_25319 ) ) ( not ( = ?auto_25298 ?auto_25318 ) ) ( not ( = ?auto_25298 ?auto_25315 ) ) ( not ( = ?auto_25298 ?auto_25306 ) ) ( not ( = ?auto_25298 ?auto_25307 ) ) ( not ( = ?auto_25298 ?auto_25320 ) ) ( not ( = ?auto_25298 ?auto_25316 ) ) ( not ( = ?auto_25298 ?auto_25317 ) ) ( not ( = ?auto_25298 ?auto_25313 ) ) ( not ( = ?auto_25298 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25284 ) ) ( not ( = ?auto_25272 ?auto_25322 ) ) ( not ( = ?auto_25273 ?auto_25284 ) ) ( not ( = ?auto_25273 ?auto_25322 ) ) ( not ( = ?auto_25274 ?auto_25284 ) ) ( not ( = ?auto_25274 ?auto_25322 ) ) ( not ( = ?auto_25275 ?auto_25284 ) ) ( not ( = ?auto_25275 ?auto_25322 ) ) ( not ( = ?auto_25276 ?auto_25284 ) ) ( not ( = ?auto_25276 ?auto_25322 ) ) ( not ( = ?auto_25277 ?auto_25284 ) ) ( not ( = ?auto_25277 ?auto_25322 ) ) ( not ( = ?auto_25278 ?auto_25284 ) ) ( not ( = ?auto_25278 ?auto_25322 ) ) ( not ( = ?auto_25279 ?auto_25284 ) ) ( not ( = ?auto_25279 ?auto_25322 ) ) ( not ( = ?auto_25280 ?auto_25284 ) ) ( not ( = ?auto_25280 ?auto_25322 ) ) ( not ( = ?auto_25281 ?auto_25284 ) ) ( not ( = ?auto_25281 ?auto_25322 ) ) ( not ( = ?auto_25282 ?auto_25284 ) ) ( not ( = ?auto_25282 ?auto_25322 ) ) ( not ( = ?auto_25284 ?auto_25298 ) ) ( not ( = ?auto_25284 ?auto_25319 ) ) ( not ( = ?auto_25284 ?auto_25318 ) ) ( not ( = ?auto_25284 ?auto_25315 ) ) ( not ( = ?auto_25284 ?auto_25306 ) ) ( not ( = ?auto_25284 ?auto_25307 ) ) ( not ( = ?auto_25284 ?auto_25320 ) ) ( not ( = ?auto_25284 ?auto_25316 ) ) ( not ( = ?auto_25284 ?auto_25317 ) ) ( not ( = ?auto_25284 ?auto_25313 ) ) ( not ( = ?auto_25284 ?auto_25299 ) ) ( not ( = ?auto_25312 ?auto_25292 ) ) ( not ( = ?auto_25312 ?auto_25296 ) ) ( not ( = ?auto_25312 ?auto_25308 ) ) ( not ( = ?auto_25312 ?auto_25295 ) ) ( not ( = ?auto_25312 ?auto_25305 ) ) ( not ( = ?auto_25312 ?auto_25304 ) ) ( not ( = ?auto_25311 ?auto_25294 ) ) ( not ( = ?auto_25311 ?auto_25302 ) ) ( not ( = ?auto_25311 ?auto_25303 ) ) ( not ( = ?auto_25311 ?auto_25314 ) ) ( not ( = ?auto_25311 ?auto_25321 ) ) ( not ( = ?auto_25311 ?auto_25301 ) ) ( not ( = ?auto_25322 ?auto_25298 ) ) ( not ( = ?auto_25322 ?auto_25319 ) ) ( not ( = ?auto_25322 ?auto_25318 ) ) ( not ( = ?auto_25322 ?auto_25315 ) ) ( not ( = ?auto_25322 ?auto_25306 ) ) ( not ( = ?auto_25322 ?auto_25307 ) ) ( not ( = ?auto_25322 ?auto_25320 ) ) ( not ( = ?auto_25322 ?auto_25316 ) ) ( not ( = ?auto_25322 ?auto_25317 ) ) ( not ( = ?auto_25322 ?auto_25313 ) ) ( not ( = ?auto_25322 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25285 ) ) ( not ( = ?auto_25272 ?auto_25309 ) ) ( not ( = ?auto_25273 ?auto_25285 ) ) ( not ( = ?auto_25273 ?auto_25309 ) ) ( not ( = ?auto_25274 ?auto_25285 ) ) ( not ( = ?auto_25274 ?auto_25309 ) ) ( not ( = ?auto_25275 ?auto_25285 ) ) ( not ( = ?auto_25275 ?auto_25309 ) ) ( not ( = ?auto_25276 ?auto_25285 ) ) ( not ( = ?auto_25276 ?auto_25309 ) ) ( not ( = ?auto_25277 ?auto_25285 ) ) ( not ( = ?auto_25277 ?auto_25309 ) ) ( not ( = ?auto_25278 ?auto_25285 ) ) ( not ( = ?auto_25278 ?auto_25309 ) ) ( not ( = ?auto_25279 ?auto_25285 ) ) ( not ( = ?auto_25279 ?auto_25309 ) ) ( not ( = ?auto_25280 ?auto_25285 ) ) ( not ( = ?auto_25280 ?auto_25309 ) ) ( not ( = ?auto_25281 ?auto_25285 ) ) ( not ( = ?auto_25281 ?auto_25309 ) ) ( not ( = ?auto_25282 ?auto_25285 ) ) ( not ( = ?auto_25282 ?auto_25309 ) ) ( not ( = ?auto_25283 ?auto_25285 ) ) ( not ( = ?auto_25283 ?auto_25309 ) ) ( not ( = ?auto_25285 ?auto_25322 ) ) ( not ( = ?auto_25285 ?auto_25298 ) ) ( not ( = ?auto_25285 ?auto_25319 ) ) ( not ( = ?auto_25285 ?auto_25318 ) ) ( not ( = ?auto_25285 ?auto_25315 ) ) ( not ( = ?auto_25285 ?auto_25306 ) ) ( not ( = ?auto_25285 ?auto_25307 ) ) ( not ( = ?auto_25285 ?auto_25320 ) ) ( not ( = ?auto_25285 ?auto_25316 ) ) ( not ( = ?auto_25285 ?auto_25317 ) ) ( not ( = ?auto_25285 ?auto_25313 ) ) ( not ( = ?auto_25285 ?auto_25299 ) ) ( not ( = ?auto_25297 ?auto_25312 ) ) ( not ( = ?auto_25297 ?auto_25292 ) ) ( not ( = ?auto_25297 ?auto_25296 ) ) ( not ( = ?auto_25297 ?auto_25308 ) ) ( not ( = ?auto_25297 ?auto_25295 ) ) ( not ( = ?auto_25297 ?auto_25305 ) ) ( not ( = ?auto_25297 ?auto_25304 ) ) ( not ( = ?auto_25323 ?auto_25311 ) ) ( not ( = ?auto_25323 ?auto_25294 ) ) ( not ( = ?auto_25323 ?auto_25302 ) ) ( not ( = ?auto_25323 ?auto_25303 ) ) ( not ( = ?auto_25323 ?auto_25314 ) ) ( not ( = ?auto_25323 ?auto_25321 ) ) ( not ( = ?auto_25323 ?auto_25301 ) ) ( not ( = ?auto_25309 ?auto_25322 ) ) ( not ( = ?auto_25309 ?auto_25298 ) ) ( not ( = ?auto_25309 ?auto_25319 ) ) ( not ( = ?auto_25309 ?auto_25318 ) ) ( not ( = ?auto_25309 ?auto_25315 ) ) ( not ( = ?auto_25309 ?auto_25306 ) ) ( not ( = ?auto_25309 ?auto_25307 ) ) ( not ( = ?auto_25309 ?auto_25320 ) ) ( not ( = ?auto_25309 ?auto_25316 ) ) ( not ( = ?auto_25309 ?auto_25317 ) ) ( not ( = ?auto_25309 ?auto_25313 ) ) ( not ( = ?auto_25309 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25286 ) ) ( not ( = ?auto_25272 ?auto_25310 ) ) ( not ( = ?auto_25273 ?auto_25286 ) ) ( not ( = ?auto_25273 ?auto_25310 ) ) ( not ( = ?auto_25274 ?auto_25286 ) ) ( not ( = ?auto_25274 ?auto_25310 ) ) ( not ( = ?auto_25275 ?auto_25286 ) ) ( not ( = ?auto_25275 ?auto_25310 ) ) ( not ( = ?auto_25276 ?auto_25286 ) ) ( not ( = ?auto_25276 ?auto_25310 ) ) ( not ( = ?auto_25277 ?auto_25286 ) ) ( not ( = ?auto_25277 ?auto_25310 ) ) ( not ( = ?auto_25278 ?auto_25286 ) ) ( not ( = ?auto_25278 ?auto_25310 ) ) ( not ( = ?auto_25279 ?auto_25286 ) ) ( not ( = ?auto_25279 ?auto_25310 ) ) ( not ( = ?auto_25280 ?auto_25286 ) ) ( not ( = ?auto_25280 ?auto_25310 ) ) ( not ( = ?auto_25281 ?auto_25286 ) ) ( not ( = ?auto_25281 ?auto_25310 ) ) ( not ( = ?auto_25282 ?auto_25286 ) ) ( not ( = ?auto_25282 ?auto_25310 ) ) ( not ( = ?auto_25283 ?auto_25286 ) ) ( not ( = ?auto_25283 ?auto_25310 ) ) ( not ( = ?auto_25284 ?auto_25286 ) ) ( not ( = ?auto_25284 ?auto_25310 ) ) ( not ( = ?auto_25286 ?auto_25309 ) ) ( not ( = ?auto_25286 ?auto_25322 ) ) ( not ( = ?auto_25286 ?auto_25298 ) ) ( not ( = ?auto_25286 ?auto_25319 ) ) ( not ( = ?auto_25286 ?auto_25318 ) ) ( not ( = ?auto_25286 ?auto_25315 ) ) ( not ( = ?auto_25286 ?auto_25306 ) ) ( not ( = ?auto_25286 ?auto_25307 ) ) ( not ( = ?auto_25286 ?auto_25320 ) ) ( not ( = ?auto_25286 ?auto_25316 ) ) ( not ( = ?auto_25286 ?auto_25317 ) ) ( not ( = ?auto_25286 ?auto_25313 ) ) ( not ( = ?auto_25286 ?auto_25299 ) ) ( not ( = ?auto_25310 ?auto_25309 ) ) ( not ( = ?auto_25310 ?auto_25322 ) ) ( not ( = ?auto_25310 ?auto_25298 ) ) ( not ( = ?auto_25310 ?auto_25319 ) ) ( not ( = ?auto_25310 ?auto_25318 ) ) ( not ( = ?auto_25310 ?auto_25315 ) ) ( not ( = ?auto_25310 ?auto_25306 ) ) ( not ( = ?auto_25310 ?auto_25307 ) ) ( not ( = ?auto_25310 ?auto_25320 ) ) ( not ( = ?auto_25310 ?auto_25316 ) ) ( not ( = ?auto_25310 ?auto_25317 ) ) ( not ( = ?auto_25310 ?auto_25313 ) ) ( not ( = ?auto_25310 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25287 ) ) ( not ( = ?auto_25272 ?auto_25300 ) ) ( not ( = ?auto_25273 ?auto_25287 ) ) ( not ( = ?auto_25273 ?auto_25300 ) ) ( not ( = ?auto_25274 ?auto_25287 ) ) ( not ( = ?auto_25274 ?auto_25300 ) ) ( not ( = ?auto_25275 ?auto_25287 ) ) ( not ( = ?auto_25275 ?auto_25300 ) ) ( not ( = ?auto_25276 ?auto_25287 ) ) ( not ( = ?auto_25276 ?auto_25300 ) ) ( not ( = ?auto_25277 ?auto_25287 ) ) ( not ( = ?auto_25277 ?auto_25300 ) ) ( not ( = ?auto_25278 ?auto_25287 ) ) ( not ( = ?auto_25278 ?auto_25300 ) ) ( not ( = ?auto_25279 ?auto_25287 ) ) ( not ( = ?auto_25279 ?auto_25300 ) ) ( not ( = ?auto_25280 ?auto_25287 ) ) ( not ( = ?auto_25280 ?auto_25300 ) ) ( not ( = ?auto_25281 ?auto_25287 ) ) ( not ( = ?auto_25281 ?auto_25300 ) ) ( not ( = ?auto_25282 ?auto_25287 ) ) ( not ( = ?auto_25282 ?auto_25300 ) ) ( not ( = ?auto_25283 ?auto_25287 ) ) ( not ( = ?auto_25283 ?auto_25300 ) ) ( not ( = ?auto_25284 ?auto_25287 ) ) ( not ( = ?auto_25284 ?auto_25300 ) ) ( not ( = ?auto_25285 ?auto_25287 ) ) ( not ( = ?auto_25285 ?auto_25300 ) ) ( not ( = ?auto_25287 ?auto_25310 ) ) ( not ( = ?auto_25287 ?auto_25309 ) ) ( not ( = ?auto_25287 ?auto_25322 ) ) ( not ( = ?auto_25287 ?auto_25298 ) ) ( not ( = ?auto_25287 ?auto_25319 ) ) ( not ( = ?auto_25287 ?auto_25318 ) ) ( not ( = ?auto_25287 ?auto_25315 ) ) ( not ( = ?auto_25287 ?auto_25306 ) ) ( not ( = ?auto_25287 ?auto_25307 ) ) ( not ( = ?auto_25287 ?auto_25320 ) ) ( not ( = ?auto_25287 ?auto_25316 ) ) ( not ( = ?auto_25287 ?auto_25317 ) ) ( not ( = ?auto_25287 ?auto_25313 ) ) ( not ( = ?auto_25287 ?auto_25299 ) ) ( not ( = ?auto_25300 ?auto_25310 ) ) ( not ( = ?auto_25300 ?auto_25309 ) ) ( not ( = ?auto_25300 ?auto_25322 ) ) ( not ( = ?auto_25300 ?auto_25298 ) ) ( not ( = ?auto_25300 ?auto_25319 ) ) ( not ( = ?auto_25300 ?auto_25318 ) ) ( not ( = ?auto_25300 ?auto_25315 ) ) ( not ( = ?auto_25300 ?auto_25306 ) ) ( not ( = ?auto_25300 ?auto_25307 ) ) ( not ( = ?auto_25300 ?auto_25320 ) ) ( not ( = ?auto_25300 ?auto_25316 ) ) ( not ( = ?auto_25300 ?auto_25317 ) ) ( not ( = ?auto_25300 ?auto_25313 ) ) ( not ( = ?auto_25300 ?auto_25299 ) ) ( not ( = ?auto_25272 ?auto_25288 ) ) ( not ( = ?auto_25272 ?auto_25289 ) ) ( not ( = ?auto_25273 ?auto_25288 ) ) ( not ( = ?auto_25273 ?auto_25289 ) ) ( not ( = ?auto_25274 ?auto_25288 ) ) ( not ( = ?auto_25274 ?auto_25289 ) ) ( not ( = ?auto_25275 ?auto_25288 ) ) ( not ( = ?auto_25275 ?auto_25289 ) ) ( not ( = ?auto_25276 ?auto_25288 ) ) ( not ( = ?auto_25276 ?auto_25289 ) ) ( not ( = ?auto_25277 ?auto_25288 ) ) ( not ( = ?auto_25277 ?auto_25289 ) ) ( not ( = ?auto_25278 ?auto_25288 ) ) ( not ( = ?auto_25278 ?auto_25289 ) ) ( not ( = ?auto_25279 ?auto_25288 ) ) ( not ( = ?auto_25279 ?auto_25289 ) ) ( not ( = ?auto_25280 ?auto_25288 ) ) ( not ( = ?auto_25280 ?auto_25289 ) ) ( not ( = ?auto_25281 ?auto_25288 ) ) ( not ( = ?auto_25281 ?auto_25289 ) ) ( not ( = ?auto_25282 ?auto_25288 ) ) ( not ( = ?auto_25282 ?auto_25289 ) ) ( not ( = ?auto_25283 ?auto_25288 ) ) ( not ( = ?auto_25283 ?auto_25289 ) ) ( not ( = ?auto_25284 ?auto_25288 ) ) ( not ( = ?auto_25284 ?auto_25289 ) ) ( not ( = ?auto_25285 ?auto_25288 ) ) ( not ( = ?auto_25285 ?auto_25289 ) ) ( not ( = ?auto_25286 ?auto_25288 ) ) ( not ( = ?auto_25286 ?auto_25289 ) ) ( not ( = ?auto_25288 ?auto_25300 ) ) ( not ( = ?auto_25288 ?auto_25310 ) ) ( not ( = ?auto_25288 ?auto_25309 ) ) ( not ( = ?auto_25288 ?auto_25322 ) ) ( not ( = ?auto_25288 ?auto_25298 ) ) ( not ( = ?auto_25288 ?auto_25319 ) ) ( not ( = ?auto_25288 ?auto_25318 ) ) ( not ( = ?auto_25288 ?auto_25315 ) ) ( not ( = ?auto_25288 ?auto_25306 ) ) ( not ( = ?auto_25288 ?auto_25307 ) ) ( not ( = ?auto_25288 ?auto_25320 ) ) ( not ( = ?auto_25288 ?auto_25316 ) ) ( not ( = ?auto_25288 ?auto_25317 ) ) ( not ( = ?auto_25288 ?auto_25313 ) ) ( not ( = ?auto_25288 ?auto_25299 ) ) ( not ( = ?auto_25289 ?auto_25300 ) ) ( not ( = ?auto_25289 ?auto_25310 ) ) ( not ( = ?auto_25289 ?auto_25309 ) ) ( not ( = ?auto_25289 ?auto_25322 ) ) ( not ( = ?auto_25289 ?auto_25298 ) ) ( not ( = ?auto_25289 ?auto_25319 ) ) ( not ( = ?auto_25289 ?auto_25318 ) ) ( not ( = ?auto_25289 ?auto_25315 ) ) ( not ( = ?auto_25289 ?auto_25306 ) ) ( not ( = ?auto_25289 ?auto_25307 ) ) ( not ( = ?auto_25289 ?auto_25320 ) ) ( not ( = ?auto_25289 ?auto_25316 ) ) ( not ( = ?auto_25289 ?auto_25317 ) ) ( not ( = ?auto_25289 ?auto_25313 ) ) ( not ( = ?auto_25289 ?auto_25299 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_25272 ?auto_25273 ?auto_25274 ?auto_25275 ?auto_25276 ?auto_25277 ?auto_25278 ?auto_25279 ?auto_25280 ?auto_25281 ?auto_25282 ?auto_25283 ?auto_25284 ?auto_25285 ?auto_25286 ?auto_25287 )
      ( MAKE-1CRATE ?auto_25287 ?auto_25288 )
      ( MAKE-16CRATE-VERIFY ?auto_25272 ?auto_25273 ?auto_25274 ?auto_25275 ?auto_25276 ?auto_25277 ?auto_25278 ?auto_25279 ?auto_25280 ?auto_25281 ?auto_25282 ?auto_25283 ?auto_25284 ?auto_25285 ?auto_25286 ?auto_25287 ?auto_25288 ) )
  )

)

