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
      ?auto_43579 - SURFACE
      ?auto_43580 - SURFACE
    )
    :vars
    (
      ?auto_43581 - HOIST
      ?auto_43582 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43581 ?auto_43582 ) ( SURFACE-AT ?auto_43580 ?auto_43582 ) ( CLEAR ?auto_43580 ) ( LIFTING ?auto_43581 ?auto_43579 ) ( IS-CRATE ?auto_43579 ) ( not ( = ?auto_43579 ?auto_43580 ) ) )
    :subtasks
    ( ( !DROP ?auto_43581 ?auto_43579 ?auto_43580 ?auto_43582 )
      ( MAKE-ON-VERIFY ?auto_43579 ?auto_43580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43583 - SURFACE
      ?auto_43584 - SURFACE
    )
    :vars
    (
      ?auto_43586 - HOIST
      ?auto_43585 - PLACE
      ?auto_43587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43586 ?auto_43585 ) ( SURFACE-AT ?auto_43584 ?auto_43585 ) ( CLEAR ?auto_43584 ) ( IS-CRATE ?auto_43583 ) ( not ( = ?auto_43583 ?auto_43584 ) ) ( TRUCK-AT ?auto_43587 ?auto_43585 ) ( AVAILABLE ?auto_43586 ) ( IN ?auto_43583 ?auto_43587 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43586 ?auto_43583 ?auto_43587 ?auto_43585 )
      ( MAKE-ON ?auto_43583 ?auto_43584 )
      ( MAKE-ON-VERIFY ?auto_43583 ?auto_43584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43588 - SURFACE
      ?auto_43589 - SURFACE
    )
    :vars
    (
      ?auto_43590 - HOIST
      ?auto_43592 - PLACE
      ?auto_43591 - TRUCK
      ?auto_43593 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43590 ?auto_43592 ) ( SURFACE-AT ?auto_43589 ?auto_43592 ) ( CLEAR ?auto_43589 ) ( IS-CRATE ?auto_43588 ) ( not ( = ?auto_43588 ?auto_43589 ) ) ( AVAILABLE ?auto_43590 ) ( IN ?auto_43588 ?auto_43591 ) ( TRUCK-AT ?auto_43591 ?auto_43593 ) ( not ( = ?auto_43593 ?auto_43592 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43591 ?auto_43593 ?auto_43592 )
      ( MAKE-ON ?auto_43588 ?auto_43589 )
      ( MAKE-ON-VERIFY ?auto_43588 ?auto_43589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43594 - SURFACE
      ?auto_43595 - SURFACE
    )
    :vars
    (
      ?auto_43597 - HOIST
      ?auto_43599 - PLACE
      ?auto_43598 - TRUCK
      ?auto_43596 - PLACE
      ?auto_43600 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_43597 ?auto_43599 ) ( SURFACE-AT ?auto_43595 ?auto_43599 ) ( CLEAR ?auto_43595 ) ( IS-CRATE ?auto_43594 ) ( not ( = ?auto_43594 ?auto_43595 ) ) ( AVAILABLE ?auto_43597 ) ( TRUCK-AT ?auto_43598 ?auto_43596 ) ( not ( = ?auto_43596 ?auto_43599 ) ) ( HOIST-AT ?auto_43600 ?auto_43596 ) ( LIFTING ?auto_43600 ?auto_43594 ) ( not ( = ?auto_43597 ?auto_43600 ) ) )
    :subtasks
    ( ( !LOAD ?auto_43600 ?auto_43594 ?auto_43598 ?auto_43596 )
      ( MAKE-ON ?auto_43594 ?auto_43595 )
      ( MAKE-ON-VERIFY ?auto_43594 ?auto_43595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43601 - SURFACE
      ?auto_43602 - SURFACE
    )
    :vars
    (
      ?auto_43603 - HOIST
      ?auto_43607 - PLACE
      ?auto_43605 - TRUCK
      ?auto_43604 - PLACE
      ?auto_43606 - HOIST
      ?auto_43608 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43603 ?auto_43607 ) ( SURFACE-AT ?auto_43602 ?auto_43607 ) ( CLEAR ?auto_43602 ) ( IS-CRATE ?auto_43601 ) ( not ( = ?auto_43601 ?auto_43602 ) ) ( AVAILABLE ?auto_43603 ) ( TRUCK-AT ?auto_43605 ?auto_43604 ) ( not ( = ?auto_43604 ?auto_43607 ) ) ( HOIST-AT ?auto_43606 ?auto_43604 ) ( not ( = ?auto_43603 ?auto_43606 ) ) ( AVAILABLE ?auto_43606 ) ( SURFACE-AT ?auto_43601 ?auto_43604 ) ( ON ?auto_43601 ?auto_43608 ) ( CLEAR ?auto_43601 ) ( not ( = ?auto_43601 ?auto_43608 ) ) ( not ( = ?auto_43602 ?auto_43608 ) ) )
    :subtasks
    ( ( !LIFT ?auto_43606 ?auto_43601 ?auto_43608 ?auto_43604 )
      ( MAKE-ON ?auto_43601 ?auto_43602 )
      ( MAKE-ON-VERIFY ?auto_43601 ?auto_43602 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43609 - SURFACE
      ?auto_43610 - SURFACE
    )
    :vars
    (
      ?auto_43612 - HOIST
      ?auto_43614 - PLACE
      ?auto_43613 - PLACE
      ?auto_43611 - HOIST
      ?auto_43615 - SURFACE
      ?auto_43616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_43612 ?auto_43614 ) ( SURFACE-AT ?auto_43610 ?auto_43614 ) ( CLEAR ?auto_43610 ) ( IS-CRATE ?auto_43609 ) ( not ( = ?auto_43609 ?auto_43610 ) ) ( AVAILABLE ?auto_43612 ) ( not ( = ?auto_43613 ?auto_43614 ) ) ( HOIST-AT ?auto_43611 ?auto_43613 ) ( not ( = ?auto_43612 ?auto_43611 ) ) ( AVAILABLE ?auto_43611 ) ( SURFACE-AT ?auto_43609 ?auto_43613 ) ( ON ?auto_43609 ?auto_43615 ) ( CLEAR ?auto_43609 ) ( not ( = ?auto_43609 ?auto_43615 ) ) ( not ( = ?auto_43610 ?auto_43615 ) ) ( TRUCK-AT ?auto_43616 ?auto_43614 ) )
    :subtasks
    ( ( !DRIVE ?auto_43616 ?auto_43614 ?auto_43613 )
      ( MAKE-ON ?auto_43609 ?auto_43610 )
      ( MAKE-ON-VERIFY ?auto_43609 ?auto_43610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43657 - SURFACE
      ?auto_43658 - SURFACE
    )
    :vars
    (
      ?auto_43662 - HOIST
      ?auto_43661 - PLACE
      ?auto_43663 - PLACE
      ?auto_43659 - HOIST
      ?auto_43664 - SURFACE
      ?auto_43660 - TRUCK
      ?auto_43665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43662 ?auto_43661 ) ( IS-CRATE ?auto_43657 ) ( not ( = ?auto_43657 ?auto_43658 ) ) ( not ( = ?auto_43663 ?auto_43661 ) ) ( HOIST-AT ?auto_43659 ?auto_43663 ) ( not ( = ?auto_43662 ?auto_43659 ) ) ( AVAILABLE ?auto_43659 ) ( SURFACE-AT ?auto_43657 ?auto_43663 ) ( ON ?auto_43657 ?auto_43664 ) ( CLEAR ?auto_43657 ) ( not ( = ?auto_43657 ?auto_43664 ) ) ( not ( = ?auto_43658 ?auto_43664 ) ) ( TRUCK-AT ?auto_43660 ?auto_43661 ) ( SURFACE-AT ?auto_43665 ?auto_43661 ) ( CLEAR ?auto_43665 ) ( LIFTING ?auto_43662 ?auto_43658 ) ( IS-CRATE ?auto_43658 ) ( not ( = ?auto_43657 ?auto_43665 ) ) ( not ( = ?auto_43658 ?auto_43665 ) ) ( not ( = ?auto_43664 ?auto_43665 ) ) )
    :subtasks
    ( ( !DROP ?auto_43662 ?auto_43658 ?auto_43665 ?auto_43661 )
      ( MAKE-ON ?auto_43657 ?auto_43658 )
      ( MAKE-ON-VERIFY ?auto_43657 ?auto_43658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43666 - SURFACE
      ?auto_43667 - SURFACE
    )
    :vars
    (
      ?auto_43670 - HOIST
      ?auto_43671 - PLACE
      ?auto_43672 - PLACE
      ?auto_43673 - HOIST
      ?auto_43674 - SURFACE
      ?auto_43669 - TRUCK
      ?auto_43668 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43670 ?auto_43671 ) ( IS-CRATE ?auto_43666 ) ( not ( = ?auto_43666 ?auto_43667 ) ) ( not ( = ?auto_43672 ?auto_43671 ) ) ( HOIST-AT ?auto_43673 ?auto_43672 ) ( not ( = ?auto_43670 ?auto_43673 ) ) ( AVAILABLE ?auto_43673 ) ( SURFACE-AT ?auto_43666 ?auto_43672 ) ( ON ?auto_43666 ?auto_43674 ) ( CLEAR ?auto_43666 ) ( not ( = ?auto_43666 ?auto_43674 ) ) ( not ( = ?auto_43667 ?auto_43674 ) ) ( TRUCK-AT ?auto_43669 ?auto_43671 ) ( SURFACE-AT ?auto_43668 ?auto_43671 ) ( CLEAR ?auto_43668 ) ( IS-CRATE ?auto_43667 ) ( not ( = ?auto_43666 ?auto_43668 ) ) ( not ( = ?auto_43667 ?auto_43668 ) ) ( not ( = ?auto_43674 ?auto_43668 ) ) ( AVAILABLE ?auto_43670 ) ( IN ?auto_43667 ?auto_43669 ) )
    :subtasks
    ( ( !UNLOAD ?auto_43670 ?auto_43667 ?auto_43669 ?auto_43671 )
      ( MAKE-ON ?auto_43666 ?auto_43667 )
      ( MAKE-ON-VERIFY ?auto_43666 ?auto_43667 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_43681 - SURFACE
      ?auto_43682 - SURFACE
    )
    :vars
    (
      ?auto_43685 - HOIST
      ?auto_43683 - PLACE
      ?auto_43684 - PLACE
      ?auto_43686 - HOIST
      ?auto_43688 - SURFACE
      ?auto_43687 - TRUCK
      ?auto_43689 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_43685 ?auto_43683 ) ( SURFACE-AT ?auto_43682 ?auto_43683 ) ( CLEAR ?auto_43682 ) ( IS-CRATE ?auto_43681 ) ( not ( = ?auto_43681 ?auto_43682 ) ) ( AVAILABLE ?auto_43685 ) ( not ( = ?auto_43684 ?auto_43683 ) ) ( HOIST-AT ?auto_43686 ?auto_43684 ) ( not ( = ?auto_43685 ?auto_43686 ) ) ( AVAILABLE ?auto_43686 ) ( SURFACE-AT ?auto_43681 ?auto_43684 ) ( ON ?auto_43681 ?auto_43688 ) ( CLEAR ?auto_43681 ) ( not ( = ?auto_43681 ?auto_43688 ) ) ( not ( = ?auto_43682 ?auto_43688 ) ) ( TRUCK-AT ?auto_43687 ?auto_43689 ) ( not ( = ?auto_43689 ?auto_43683 ) ) ( not ( = ?auto_43684 ?auto_43689 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_43687 ?auto_43689 ?auto_43683 )
      ( MAKE-ON ?auto_43681 ?auto_43682 )
      ( MAKE-ON-VERIFY ?auto_43681 ?auto_43682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44314 - SURFACE
      ?auto_44315 - SURFACE
    )
    :vars
    (
      ?auto_44321 - HOIST
      ?auto_44316 - PLACE
      ?auto_44320 - TRUCK
      ?auto_44318 - PLACE
      ?auto_44319 - HOIST
      ?auto_44317 - SURFACE
      ?auto_44322 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44321 ?auto_44316 ) ( SURFACE-AT ?auto_44315 ?auto_44316 ) ( CLEAR ?auto_44315 ) ( IS-CRATE ?auto_44314 ) ( not ( = ?auto_44314 ?auto_44315 ) ) ( AVAILABLE ?auto_44321 ) ( TRUCK-AT ?auto_44320 ?auto_44318 ) ( not ( = ?auto_44318 ?auto_44316 ) ) ( HOIST-AT ?auto_44319 ?auto_44318 ) ( not ( = ?auto_44321 ?auto_44319 ) ) ( SURFACE-AT ?auto_44314 ?auto_44318 ) ( ON ?auto_44314 ?auto_44317 ) ( CLEAR ?auto_44314 ) ( not ( = ?auto_44314 ?auto_44317 ) ) ( not ( = ?auto_44315 ?auto_44317 ) ) ( LIFTING ?auto_44319 ?auto_44322 ) ( IS-CRATE ?auto_44322 ) ( not ( = ?auto_44314 ?auto_44322 ) ) ( not ( = ?auto_44315 ?auto_44322 ) ) ( not ( = ?auto_44317 ?auto_44322 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44319 ?auto_44322 ?auto_44320 ?auto_44318 )
      ( MAKE-ON ?auto_44314 ?auto_44315 )
      ( MAKE-ON-VERIFY ?auto_44314 ?auto_44315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_44485 - SURFACE
      ?auto_44486 - SURFACE
    )
    :vars
    (
      ?auto_44489 - HOIST
      ?auto_44492 - PLACE
      ?auto_44487 - PLACE
      ?auto_44491 - HOIST
      ?auto_44490 - SURFACE
      ?auto_44488 - TRUCK
      ?auto_44493 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_44489 ?auto_44492 ) ( SURFACE-AT ?auto_44486 ?auto_44492 ) ( CLEAR ?auto_44486 ) ( IS-CRATE ?auto_44485 ) ( not ( = ?auto_44485 ?auto_44486 ) ) ( not ( = ?auto_44487 ?auto_44492 ) ) ( HOIST-AT ?auto_44491 ?auto_44487 ) ( not ( = ?auto_44489 ?auto_44491 ) ) ( AVAILABLE ?auto_44491 ) ( SURFACE-AT ?auto_44485 ?auto_44487 ) ( ON ?auto_44485 ?auto_44490 ) ( CLEAR ?auto_44485 ) ( not ( = ?auto_44485 ?auto_44490 ) ) ( not ( = ?auto_44486 ?auto_44490 ) ) ( TRUCK-AT ?auto_44488 ?auto_44492 ) ( LIFTING ?auto_44489 ?auto_44493 ) ( IS-CRATE ?auto_44493 ) ( not ( = ?auto_44485 ?auto_44493 ) ) ( not ( = ?auto_44486 ?auto_44493 ) ) ( not ( = ?auto_44490 ?auto_44493 ) ) )
    :subtasks
    ( ( !LOAD ?auto_44489 ?auto_44493 ?auto_44488 ?auto_44492 )
      ( MAKE-ON ?auto_44485 ?auto_44486 )
      ( MAKE-ON-VERIFY ?auto_44485 ?auto_44486 ) )
  )

)

