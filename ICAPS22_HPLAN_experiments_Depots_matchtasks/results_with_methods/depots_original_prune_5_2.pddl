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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18563 - SURFACE
      ?auto_18564 - SURFACE
    )
    :vars
    (
      ?auto_18565 - HOIST
      ?auto_18566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18565 ?auto_18566 ) ( SURFACE-AT ?auto_18563 ?auto_18566 ) ( CLEAR ?auto_18563 ) ( LIFTING ?auto_18565 ?auto_18564 ) ( IS-CRATE ?auto_18564 ) ( not ( = ?auto_18563 ?auto_18564 ) ) )
    :subtasks
    ( ( !DROP ?auto_18565 ?auto_18564 ?auto_18563 ?auto_18566 )
      ( MAKE-1CRATE-VERIFY ?auto_18563 ?auto_18564 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18567 - SURFACE
      ?auto_18568 - SURFACE
    )
    :vars
    (
      ?auto_18570 - HOIST
      ?auto_18569 - PLACE
      ?auto_18571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18570 ?auto_18569 ) ( SURFACE-AT ?auto_18567 ?auto_18569 ) ( CLEAR ?auto_18567 ) ( IS-CRATE ?auto_18568 ) ( not ( = ?auto_18567 ?auto_18568 ) ) ( TRUCK-AT ?auto_18571 ?auto_18569 ) ( AVAILABLE ?auto_18570 ) ( IN ?auto_18568 ?auto_18571 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18570 ?auto_18568 ?auto_18571 ?auto_18569 )
      ( MAKE-1CRATE ?auto_18567 ?auto_18568 )
      ( MAKE-1CRATE-VERIFY ?auto_18567 ?auto_18568 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18572 - SURFACE
      ?auto_18573 - SURFACE
    )
    :vars
    (
      ?auto_18576 - HOIST
      ?auto_18574 - PLACE
      ?auto_18575 - TRUCK
      ?auto_18577 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18576 ?auto_18574 ) ( SURFACE-AT ?auto_18572 ?auto_18574 ) ( CLEAR ?auto_18572 ) ( IS-CRATE ?auto_18573 ) ( not ( = ?auto_18572 ?auto_18573 ) ) ( AVAILABLE ?auto_18576 ) ( IN ?auto_18573 ?auto_18575 ) ( TRUCK-AT ?auto_18575 ?auto_18577 ) ( not ( = ?auto_18577 ?auto_18574 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18575 ?auto_18577 ?auto_18574 )
      ( MAKE-1CRATE ?auto_18572 ?auto_18573 )
      ( MAKE-1CRATE-VERIFY ?auto_18572 ?auto_18573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18578 - SURFACE
      ?auto_18579 - SURFACE
    )
    :vars
    (
      ?auto_18583 - HOIST
      ?auto_18580 - PLACE
      ?auto_18582 - TRUCK
      ?auto_18581 - PLACE
      ?auto_18584 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18583 ?auto_18580 ) ( SURFACE-AT ?auto_18578 ?auto_18580 ) ( CLEAR ?auto_18578 ) ( IS-CRATE ?auto_18579 ) ( not ( = ?auto_18578 ?auto_18579 ) ) ( AVAILABLE ?auto_18583 ) ( TRUCK-AT ?auto_18582 ?auto_18581 ) ( not ( = ?auto_18581 ?auto_18580 ) ) ( HOIST-AT ?auto_18584 ?auto_18581 ) ( LIFTING ?auto_18584 ?auto_18579 ) ( not ( = ?auto_18583 ?auto_18584 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18584 ?auto_18579 ?auto_18582 ?auto_18581 )
      ( MAKE-1CRATE ?auto_18578 ?auto_18579 )
      ( MAKE-1CRATE-VERIFY ?auto_18578 ?auto_18579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18585 - SURFACE
      ?auto_18586 - SURFACE
    )
    :vars
    (
      ?auto_18587 - HOIST
      ?auto_18589 - PLACE
      ?auto_18588 - TRUCK
      ?auto_18591 - PLACE
      ?auto_18590 - HOIST
      ?auto_18592 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18587 ?auto_18589 ) ( SURFACE-AT ?auto_18585 ?auto_18589 ) ( CLEAR ?auto_18585 ) ( IS-CRATE ?auto_18586 ) ( not ( = ?auto_18585 ?auto_18586 ) ) ( AVAILABLE ?auto_18587 ) ( TRUCK-AT ?auto_18588 ?auto_18591 ) ( not ( = ?auto_18591 ?auto_18589 ) ) ( HOIST-AT ?auto_18590 ?auto_18591 ) ( not ( = ?auto_18587 ?auto_18590 ) ) ( AVAILABLE ?auto_18590 ) ( SURFACE-AT ?auto_18586 ?auto_18591 ) ( ON ?auto_18586 ?auto_18592 ) ( CLEAR ?auto_18586 ) ( not ( = ?auto_18585 ?auto_18592 ) ) ( not ( = ?auto_18586 ?auto_18592 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18590 ?auto_18586 ?auto_18592 ?auto_18591 )
      ( MAKE-1CRATE ?auto_18585 ?auto_18586 )
      ( MAKE-1CRATE-VERIFY ?auto_18585 ?auto_18586 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18593 - SURFACE
      ?auto_18594 - SURFACE
    )
    :vars
    (
      ?auto_18600 - HOIST
      ?auto_18597 - PLACE
      ?auto_18599 - PLACE
      ?auto_18595 - HOIST
      ?auto_18598 - SURFACE
      ?auto_18596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18600 ?auto_18597 ) ( SURFACE-AT ?auto_18593 ?auto_18597 ) ( CLEAR ?auto_18593 ) ( IS-CRATE ?auto_18594 ) ( not ( = ?auto_18593 ?auto_18594 ) ) ( AVAILABLE ?auto_18600 ) ( not ( = ?auto_18599 ?auto_18597 ) ) ( HOIST-AT ?auto_18595 ?auto_18599 ) ( not ( = ?auto_18600 ?auto_18595 ) ) ( AVAILABLE ?auto_18595 ) ( SURFACE-AT ?auto_18594 ?auto_18599 ) ( ON ?auto_18594 ?auto_18598 ) ( CLEAR ?auto_18594 ) ( not ( = ?auto_18593 ?auto_18598 ) ) ( not ( = ?auto_18594 ?auto_18598 ) ) ( TRUCK-AT ?auto_18596 ?auto_18597 ) )
    :subtasks
    ( ( !DRIVE ?auto_18596 ?auto_18597 ?auto_18599 )
      ( MAKE-1CRATE ?auto_18593 ?auto_18594 )
      ( MAKE-1CRATE-VERIFY ?auto_18593 ?auto_18594 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18610 - SURFACE
      ?auto_18611 - SURFACE
      ?auto_18612 - SURFACE
    )
    :vars
    (
      ?auto_18614 - HOIST
      ?auto_18613 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18614 ?auto_18613 ) ( SURFACE-AT ?auto_18611 ?auto_18613 ) ( CLEAR ?auto_18611 ) ( LIFTING ?auto_18614 ?auto_18612 ) ( IS-CRATE ?auto_18612 ) ( not ( = ?auto_18611 ?auto_18612 ) ) ( ON ?auto_18611 ?auto_18610 ) ( not ( = ?auto_18610 ?auto_18611 ) ) ( not ( = ?auto_18610 ?auto_18612 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18611 ?auto_18612 )
      ( MAKE-2CRATE-VERIFY ?auto_18610 ?auto_18611 ?auto_18612 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18620 - SURFACE
      ?auto_18621 - SURFACE
      ?auto_18622 - SURFACE
    )
    :vars
    (
      ?auto_18624 - HOIST
      ?auto_18623 - PLACE
      ?auto_18625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18624 ?auto_18623 ) ( SURFACE-AT ?auto_18621 ?auto_18623 ) ( CLEAR ?auto_18621 ) ( IS-CRATE ?auto_18622 ) ( not ( = ?auto_18621 ?auto_18622 ) ) ( TRUCK-AT ?auto_18625 ?auto_18623 ) ( AVAILABLE ?auto_18624 ) ( IN ?auto_18622 ?auto_18625 ) ( ON ?auto_18621 ?auto_18620 ) ( not ( = ?auto_18620 ?auto_18621 ) ) ( not ( = ?auto_18620 ?auto_18622 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18621 ?auto_18622 )
      ( MAKE-2CRATE-VERIFY ?auto_18620 ?auto_18621 ?auto_18622 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18626 - SURFACE
      ?auto_18627 - SURFACE
    )
    :vars
    (
      ?auto_18629 - HOIST
      ?auto_18631 - PLACE
      ?auto_18628 - TRUCK
      ?auto_18630 - SURFACE
      ?auto_18632 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18629 ?auto_18631 ) ( SURFACE-AT ?auto_18626 ?auto_18631 ) ( CLEAR ?auto_18626 ) ( IS-CRATE ?auto_18627 ) ( not ( = ?auto_18626 ?auto_18627 ) ) ( AVAILABLE ?auto_18629 ) ( IN ?auto_18627 ?auto_18628 ) ( ON ?auto_18626 ?auto_18630 ) ( not ( = ?auto_18630 ?auto_18626 ) ) ( not ( = ?auto_18630 ?auto_18627 ) ) ( TRUCK-AT ?auto_18628 ?auto_18632 ) ( not ( = ?auto_18632 ?auto_18631 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18628 ?auto_18632 ?auto_18631 )
      ( MAKE-2CRATE ?auto_18630 ?auto_18626 ?auto_18627 )
      ( MAKE-1CRATE-VERIFY ?auto_18626 ?auto_18627 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18633 - SURFACE
      ?auto_18634 - SURFACE
      ?auto_18635 - SURFACE
    )
    :vars
    (
      ?auto_18636 - HOIST
      ?auto_18638 - PLACE
      ?auto_18637 - TRUCK
      ?auto_18639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18636 ?auto_18638 ) ( SURFACE-AT ?auto_18634 ?auto_18638 ) ( CLEAR ?auto_18634 ) ( IS-CRATE ?auto_18635 ) ( not ( = ?auto_18634 ?auto_18635 ) ) ( AVAILABLE ?auto_18636 ) ( IN ?auto_18635 ?auto_18637 ) ( ON ?auto_18634 ?auto_18633 ) ( not ( = ?auto_18633 ?auto_18634 ) ) ( not ( = ?auto_18633 ?auto_18635 ) ) ( TRUCK-AT ?auto_18637 ?auto_18639 ) ( not ( = ?auto_18639 ?auto_18638 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18634 ?auto_18635 )
      ( MAKE-2CRATE-VERIFY ?auto_18633 ?auto_18634 ?auto_18635 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18640 - SURFACE
      ?auto_18641 - SURFACE
    )
    :vars
    (
      ?auto_18644 - HOIST
      ?auto_18645 - PLACE
      ?auto_18642 - SURFACE
      ?auto_18643 - TRUCK
      ?auto_18646 - PLACE
      ?auto_18647 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18644 ?auto_18645 ) ( SURFACE-AT ?auto_18640 ?auto_18645 ) ( CLEAR ?auto_18640 ) ( IS-CRATE ?auto_18641 ) ( not ( = ?auto_18640 ?auto_18641 ) ) ( AVAILABLE ?auto_18644 ) ( ON ?auto_18640 ?auto_18642 ) ( not ( = ?auto_18642 ?auto_18640 ) ) ( not ( = ?auto_18642 ?auto_18641 ) ) ( TRUCK-AT ?auto_18643 ?auto_18646 ) ( not ( = ?auto_18646 ?auto_18645 ) ) ( HOIST-AT ?auto_18647 ?auto_18646 ) ( LIFTING ?auto_18647 ?auto_18641 ) ( not ( = ?auto_18644 ?auto_18647 ) ) )
    :subtasks
    ( ( !LOAD ?auto_18647 ?auto_18641 ?auto_18643 ?auto_18646 )
      ( MAKE-2CRATE ?auto_18642 ?auto_18640 ?auto_18641 )
      ( MAKE-1CRATE-VERIFY ?auto_18640 ?auto_18641 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18648 - SURFACE
      ?auto_18649 - SURFACE
      ?auto_18650 - SURFACE
    )
    :vars
    (
      ?auto_18655 - HOIST
      ?auto_18653 - PLACE
      ?auto_18652 - TRUCK
      ?auto_18651 - PLACE
      ?auto_18654 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18655 ?auto_18653 ) ( SURFACE-AT ?auto_18649 ?auto_18653 ) ( CLEAR ?auto_18649 ) ( IS-CRATE ?auto_18650 ) ( not ( = ?auto_18649 ?auto_18650 ) ) ( AVAILABLE ?auto_18655 ) ( ON ?auto_18649 ?auto_18648 ) ( not ( = ?auto_18648 ?auto_18649 ) ) ( not ( = ?auto_18648 ?auto_18650 ) ) ( TRUCK-AT ?auto_18652 ?auto_18651 ) ( not ( = ?auto_18651 ?auto_18653 ) ) ( HOIST-AT ?auto_18654 ?auto_18651 ) ( LIFTING ?auto_18654 ?auto_18650 ) ( not ( = ?auto_18655 ?auto_18654 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18649 ?auto_18650 )
      ( MAKE-2CRATE-VERIFY ?auto_18648 ?auto_18649 ?auto_18650 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18656 - SURFACE
      ?auto_18657 - SURFACE
    )
    :vars
    (
      ?auto_18661 - HOIST
      ?auto_18658 - PLACE
      ?auto_18659 - SURFACE
      ?auto_18663 - TRUCK
      ?auto_18662 - PLACE
      ?auto_18660 - HOIST
      ?auto_18664 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18661 ?auto_18658 ) ( SURFACE-AT ?auto_18656 ?auto_18658 ) ( CLEAR ?auto_18656 ) ( IS-CRATE ?auto_18657 ) ( not ( = ?auto_18656 ?auto_18657 ) ) ( AVAILABLE ?auto_18661 ) ( ON ?auto_18656 ?auto_18659 ) ( not ( = ?auto_18659 ?auto_18656 ) ) ( not ( = ?auto_18659 ?auto_18657 ) ) ( TRUCK-AT ?auto_18663 ?auto_18662 ) ( not ( = ?auto_18662 ?auto_18658 ) ) ( HOIST-AT ?auto_18660 ?auto_18662 ) ( not ( = ?auto_18661 ?auto_18660 ) ) ( AVAILABLE ?auto_18660 ) ( SURFACE-AT ?auto_18657 ?auto_18662 ) ( ON ?auto_18657 ?auto_18664 ) ( CLEAR ?auto_18657 ) ( not ( = ?auto_18656 ?auto_18664 ) ) ( not ( = ?auto_18657 ?auto_18664 ) ) ( not ( = ?auto_18659 ?auto_18664 ) ) )
    :subtasks
    ( ( !LIFT ?auto_18660 ?auto_18657 ?auto_18664 ?auto_18662 )
      ( MAKE-2CRATE ?auto_18659 ?auto_18656 ?auto_18657 )
      ( MAKE-1CRATE-VERIFY ?auto_18656 ?auto_18657 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18665 - SURFACE
      ?auto_18666 - SURFACE
      ?auto_18667 - SURFACE
    )
    :vars
    (
      ?auto_18671 - HOIST
      ?auto_18670 - PLACE
      ?auto_18668 - TRUCK
      ?auto_18672 - PLACE
      ?auto_18669 - HOIST
      ?auto_18673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18671 ?auto_18670 ) ( SURFACE-AT ?auto_18666 ?auto_18670 ) ( CLEAR ?auto_18666 ) ( IS-CRATE ?auto_18667 ) ( not ( = ?auto_18666 ?auto_18667 ) ) ( AVAILABLE ?auto_18671 ) ( ON ?auto_18666 ?auto_18665 ) ( not ( = ?auto_18665 ?auto_18666 ) ) ( not ( = ?auto_18665 ?auto_18667 ) ) ( TRUCK-AT ?auto_18668 ?auto_18672 ) ( not ( = ?auto_18672 ?auto_18670 ) ) ( HOIST-AT ?auto_18669 ?auto_18672 ) ( not ( = ?auto_18671 ?auto_18669 ) ) ( AVAILABLE ?auto_18669 ) ( SURFACE-AT ?auto_18667 ?auto_18672 ) ( ON ?auto_18667 ?auto_18673 ) ( CLEAR ?auto_18667 ) ( not ( = ?auto_18666 ?auto_18673 ) ) ( not ( = ?auto_18667 ?auto_18673 ) ) ( not ( = ?auto_18665 ?auto_18673 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18666 ?auto_18667 )
      ( MAKE-2CRATE-VERIFY ?auto_18665 ?auto_18666 ?auto_18667 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18674 - SURFACE
      ?auto_18675 - SURFACE
    )
    :vars
    (
      ?auto_18682 - HOIST
      ?auto_18679 - PLACE
      ?auto_18678 - SURFACE
      ?auto_18676 - PLACE
      ?auto_18681 - HOIST
      ?auto_18680 - SURFACE
      ?auto_18677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18682 ?auto_18679 ) ( SURFACE-AT ?auto_18674 ?auto_18679 ) ( CLEAR ?auto_18674 ) ( IS-CRATE ?auto_18675 ) ( not ( = ?auto_18674 ?auto_18675 ) ) ( AVAILABLE ?auto_18682 ) ( ON ?auto_18674 ?auto_18678 ) ( not ( = ?auto_18678 ?auto_18674 ) ) ( not ( = ?auto_18678 ?auto_18675 ) ) ( not ( = ?auto_18676 ?auto_18679 ) ) ( HOIST-AT ?auto_18681 ?auto_18676 ) ( not ( = ?auto_18682 ?auto_18681 ) ) ( AVAILABLE ?auto_18681 ) ( SURFACE-AT ?auto_18675 ?auto_18676 ) ( ON ?auto_18675 ?auto_18680 ) ( CLEAR ?auto_18675 ) ( not ( = ?auto_18674 ?auto_18680 ) ) ( not ( = ?auto_18675 ?auto_18680 ) ) ( not ( = ?auto_18678 ?auto_18680 ) ) ( TRUCK-AT ?auto_18677 ?auto_18679 ) )
    :subtasks
    ( ( !DRIVE ?auto_18677 ?auto_18679 ?auto_18676 )
      ( MAKE-2CRATE ?auto_18678 ?auto_18674 ?auto_18675 )
      ( MAKE-1CRATE-VERIFY ?auto_18674 ?auto_18675 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18683 - SURFACE
      ?auto_18684 - SURFACE
      ?auto_18685 - SURFACE
    )
    :vars
    (
      ?auto_18687 - HOIST
      ?auto_18688 - PLACE
      ?auto_18690 - PLACE
      ?auto_18691 - HOIST
      ?auto_18686 - SURFACE
      ?auto_18689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18687 ?auto_18688 ) ( SURFACE-AT ?auto_18684 ?auto_18688 ) ( CLEAR ?auto_18684 ) ( IS-CRATE ?auto_18685 ) ( not ( = ?auto_18684 ?auto_18685 ) ) ( AVAILABLE ?auto_18687 ) ( ON ?auto_18684 ?auto_18683 ) ( not ( = ?auto_18683 ?auto_18684 ) ) ( not ( = ?auto_18683 ?auto_18685 ) ) ( not ( = ?auto_18690 ?auto_18688 ) ) ( HOIST-AT ?auto_18691 ?auto_18690 ) ( not ( = ?auto_18687 ?auto_18691 ) ) ( AVAILABLE ?auto_18691 ) ( SURFACE-AT ?auto_18685 ?auto_18690 ) ( ON ?auto_18685 ?auto_18686 ) ( CLEAR ?auto_18685 ) ( not ( = ?auto_18684 ?auto_18686 ) ) ( not ( = ?auto_18685 ?auto_18686 ) ) ( not ( = ?auto_18683 ?auto_18686 ) ) ( TRUCK-AT ?auto_18689 ?auto_18688 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18684 ?auto_18685 )
      ( MAKE-2CRATE-VERIFY ?auto_18683 ?auto_18684 ?auto_18685 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18692 - SURFACE
      ?auto_18693 - SURFACE
    )
    :vars
    (
      ?auto_18700 - HOIST
      ?auto_18697 - PLACE
      ?auto_18698 - SURFACE
      ?auto_18695 - PLACE
      ?auto_18696 - HOIST
      ?auto_18694 - SURFACE
      ?auto_18699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18700 ?auto_18697 ) ( IS-CRATE ?auto_18693 ) ( not ( = ?auto_18692 ?auto_18693 ) ) ( not ( = ?auto_18698 ?auto_18692 ) ) ( not ( = ?auto_18698 ?auto_18693 ) ) ( not ( = ?auto_18695 ?auto_18697 ) ) ( HOIST-AT ?auto_18696 ?auto_18695 ) ( not ( = ?auto_18700 ?auto_18696 ) ) ( AVAILABLE ?auto_18696 ) ( SURFACE-AT ?auto_18693 ?auto_18695 ) ( ON ?auto_18693 ?auto_18694 ) ( CLEAR ?auto_18693 ) ( not ( = ?auto_18692 ?auto_18694 ) ) ( not ( = ?auto_18693 ?auto_18694 ) ) ( not ( = ?auto_18698 ?auto_18694 ) ) ( TRUCK-AT ?auto_18699 ?auto_18697 ) ( SURFACE-AT ?auto_18698 ?auto_18697 ) ( CLEAR ?auto_18698 ) ( LIFTING ?auto_18700 ?auto_18692 ) ( IS-CRATE ?auto_18692 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18698 ?auto_18692 )
      ( MAKE-2CRATE ?auto_18698 ?auto_18692 ?auto_18693 )
      ( MAKE-1CRATE-VERIFY ?auto_18692 ?auto_18693 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18701 - SURFACE
      ?auto_18702 - SURFACE
      ?auto_18703 - SURFACE
    )
    :vars
    (
      ?auto_18705 - HOIST
      ?auto_18706 - PLACE
      ?auto_18708 - PLACE
      ?auto_18704 - HOIST
      ?auto_18709 - SURFACE
      ?auto_18707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18705 ?auto_18706 ) ( IS-CRATE ?auto_18703 ) ( not ( = ?auto_18702 ?auto_18703 ) ) ( not ( = ?auto_18701 ?auto_18702 ) ) ( not ( = ?auto_18701 ?auto_18703 ) ) ( not ( = ?auto_18708 ?auto_18706 ) ) ( HOIST-AT ?auto_18704 ?auto_18708 ) ( not ( = ?auto_18705 ?auto_18704 ) ) ( AVAILABLE ?auto_18704 ) ( SURFACE-AT ?auto_18703 ?auto_18708 ) ( ON ?auto_18703 ?auto_18709 ) ( CLEAR ?auto_18703 ) ( not ( = ?auto_18702 ?auto_18709 ) ) ( not ( = ?auto_18703 ?auto_18709 ) ) ( not ( = ?auto_18701 ?auto_18709 ) ) ( TRUCK-AT ?auto_18707 ?auto_18706 ) ( SURFACE-AT ?auto_18701 ?auto_18706 ) ( CLEAR ?auto_18701 ) ( LIFTING ?auto_18705 ?auto_18702 ) ( IS-CRATE ?auto_18702 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18702 ?auto_18703 )
      ( MAKE-2CRATE-VERIFY ?auto_18701 ?auto_18702 ?auto_18703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18710 - SURFACE
      ?auto_18711 - SURFACE
    )
    :vars
    (
      ?auto_18718 - HOIST
      ?auto_18712 - PLACE
      ?auto_18714 - SURFACE
      ?auto_18713 - PLACE
      ?auto_18715 - HOIST
      ?auto_18717 - SURFACE
      ?auto_18716 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18718 ?auto_18712 ) ( IS-CRATE ?auto_18711 ) ( not ( = ?auto_18710 ?auto_18711 ) ) ( not ( = ?auto_18714 ?auto_18710 ) ) ( not ( = ?auto_18714 ?auto_18711 ) ) ( not ( = ?auto_18713 ?auto_18712 ) ) ( HOIST-AT ?auto_18715 ?auto_18713 ) ( not ( = ?auto_18718 ?auto_18715 ) ) ( AVAILABLE ?auto_18715 ) ( SURFACE-AT ?auto_18711 ?auto_18713 ) ( ON ?auto_18711 ?auto_18717 ) ( CLEAR ?auto_18711 ) ( not ( = ?auto_18710 ?auto_18717 ) ) ( not ( = ?auto_18711 ?auto_18717 ) ) ( not ( = ?auto_18714 ?auto_18717 ) ) ( TRUCK-AT ?auto_18716 ?auto_18712 ) ( SURFACE-AT ?auto_18714 ?auto_18712 ) ( CLEAR ?auto_18714 ) ( IS-CRATE ?auto_18710 ) ( AVAILABLE ?auto_18718 ) ( IN ?auto_18710 ?auto_18716 ) )
    :subtasks
    ( ( !UNLOAD ?auto_18718 ?auto_18710 ?auto_18716 ?auto_18712 )
      ( MAKE-2CRATE ?auto_18714 ?auto_18710 ?auto_18711 )
      ( MAKE-1CRATE-VERIFY ?auto_18710 ?auto_18711 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_18719 - SURFACE
      ?auto_18720 - SURFACE
      ?auto_18721 - SURFACE
    )
    :vars
    (
      ?auto_18727 - HOIST
      ?auto_18725 - PLACE
      ?auto_18726 - PLACE
      ?auto_18723 - HOIST
      ?auto_18722 - SURFACE
      ?auto_18724 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18727 ?auto_18725 ) ( IS-CRATE ?auto_18721 ) ( not ( = ?auto_18720 ?auto_18721 ) ) ( not ( = ?auto_18719 ?auto_18720 ) ) ( not ( = ?auto_18719 ?auto_18721 ) ) ( not ( = ?auto_18726 ?auto_18725 ) ) ( HOIST-AT ?auto_18723 ?auto_18726 ) ( not ( = ?auto_18727 ?auto_18723 ) ) ( AVAILABLE ?auto_18723 ) ( SURFACE-AT ?auto_18721 ?auto_18726 ) ( ON ?auto_18721 ?auto_18722 ) ( CLEAR ?auto_18721 ) ( not ( = ?auto_18720 ?auto_18722 ) ) ( not ( = ?auto_18721 ?auto_18722 ) ) ( not ( = ?auto_18719 ?auto_18722 ) ) ( TRUCK-AT ?auto_18724 ?auto_18725 ) ( SURFACE-AT ?auto_18719 ?auto_18725 ) ( CLEAR ?auto_18719 ) ( IS-CRATE ?auto_18720 ) ( AVAILABLE ?auto_18727 ) ( IN ?auto_18720 ?auto_18724 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18720 ?auto_18721 )
      ( MAKE-2CRATE-VERIFY ?auto_18719 ?auto_18720 ?auto_18721 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18764 - SURFACE
      ?auto_18765 - SURFACE
    )
    :vars
    (
      ?auto_18766 - HOIST
      ?auto_18769 - PLACE
      ?auto_18771 - SURFACE
      ?auto_18768 - PLACE
      ?auto_18772 - HOIST
      ?auto_18770 - SURFACE
      ?auto_18767 - TRUCK
      ?auto_18773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18766 ?auto_18769 ) ( SURFACE-AT ?auto_18764 ?auto_18769 ) ( CLEAR ?auto_18764 ) ( IS-CRATE ?auto_18765 ) ( not ( = ?auto_18764 ?auto_18765 ) ) ( AVAILABLE ?auto_18766 ) ( ON ?auto_18764 ?auto_18771 ) ( not ( = ?auto_18771 ?auto_18764 ) ) ( not ( = ?auto_18771 ?auto_18765 ) ) ( not ( = ?auto_18768 ?auto_18769 ) ) ( HOIST-AT ?auto_18772 ?auto_18768 ) ( not ( = ?auto_18766 ?auto_18772 ) ) ( AVAILABLE ?auto_18772 ) ( SURFACE-AT ?auto_18765 ?auto_18768 ) ( ON ?auto_18765 ?auto_18770 ) ( CLEAR ?auto_18765 ) ( not ( = ?auto_18764 ?auto_18770 ) ) ( not ( = ?auto_18765 ?auto_18770 ) ) ( not ( = ?auto_18771 ?auto_18770 ) ) ( TRUCK-AT ?auto_18767 ?auto_18773 ) ( not ( = ?auto_18773 ?auto_18769 ) ) ( not ( = ?auto_18768 ?auto_18773 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18767 ?auto_18773 ?auto_18769 )
      ( MAKE-1CRATE ?auto_18764 ?auto_18765 )
      ( MAKE-1CRATE-VERIFY ?auto_18764 ?auto_18765 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18804 - SURFACE
      ?auto_18805 - SURFACE
      ?auto_18806 - SURFACE
      ?auto_18803 - SURFACE
    )
    :vars
    (
      ?auto_18808 - HOIST
      ?auto_18807 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18808 ?auto_18807 ) ( SURFACE-AT ?auto_18806 ?auto_18807 ) ( CLEAR ?auto_18806 ) ( LIFTING ?auto_18808 ?auto_18803 ) ( IS-CRATE ?auto_18803 ) ( not ( = ?auto_18806 ?auto_18803 ) ) ( ON ?auto_18805 ?auto_18804 ) ( ON ?auto_18806 ?auto_18805 ) ( not ( = ?auto_18804 ?auto_18805 ) ) ( not ( = ?auto_18804 ?auto_18806 ) ) ( not ( = ?auto_18804 ?auto_18803 ) ) ( not ( = ?auto_18805 ?auto_18806 ) ) ( not ( = ?auto_18805 ?auto_18803 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_18806 ?auto_18803 )
      ( MAKE-3CRATE-VERIFY ?auto_18804 ?auto_18805 ?auto_18806 ?auto_18803 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18821 - SURFACE
      ?auto_18822 - SURFACE
      ?auto_18823 - SURFACE
      ?auto_18820 - SURFACE
    )
    :vars
    (
      ?auto_18824 - HOIST
      ?auto_18825 - PLACE
      ?auto_18826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18824 ?auto_18825 ) ( SURFACE-AT ?auto_18823 ?auto_18825 ) ( CLEAR ?auto_18823 ) ( IS-CRATE ?auto_18820 ) ( not ( = ?auto_18823 ?auto_18820 ) ) ( TRUCK-AT ?auto_18826 ?auto_18825 ) ( AVAILABLE ?auto_18824 ) ( IN ?auto_18820 ?auto_18826 ) ( ON ?auto_18823 ?auto_18822 ) ( not ( = ?auto_18822 ?auto_18823 ) ) ( not ( = ?auto_18822 ?auto_18820 ) ) ( ON ?auto_18822 ?auto_18821 ) ( not ( = ?auto_18821 ?auto_18822 ) ) ( not ( = ?auto_18821 ?auto_18823 ) ) ( not ( = ?auto_18821 ?auto_18820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18822 ?auto_18823 ?auto_18820 )
      ( MAKE-3CRATE-VERIFY ?auto_18821 ?auto_18822 ?auto_18823 ?auto_18820 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18842 - SURFACE
      ?auto_18843 - SURFACE
      ?auto_18844 - SURFACE
      ?auto_18841 - SURFACE
    )
    :vars
    (
      ?auto_18845 - HOIST
      ?auto_18846 - PLACE
      ?auto_18847 - TRUCK
      ?auto_18848 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18845 ?auto_18846 ) ( SURFACE-AT ?auto_18844 ?auto_18846 ) ( CLEAR ?auto_18844 ) ( IS-CRATE ?auto_18841 ) ( not ( = ?auto_18844 ?auto_18841 ) ) ( AVAILABLE ?auto_18845 ) ( IN ?auto_18841 ?auto_18847 ) ( ON ?auto_18844 ?auto_18843 ) ( not ( = ?auto_18843 ?auto_18844 ) ) ( not ( = ?auto_18843 ?auto_18841 ) ) ( TRUCK-AT ?auto_18847 ?auto_18848 ) ( not ( = ?auto_18848 ?auto_18846 ) ) ( ON ?auto_18843 ?auto_18842 ) ( not ( = ?auto_18842 ?auto_18843 ) ) ( not ( = ?auto_18842 ?auto_18844 ) ) ( not ( = ?auto_18842 ?auto_18841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18843 ?auto_18844 ?auto_18841 )
      ( MAKE-3CRATE-VERIFY ?auto_18842 ?auto_18843 ?auto_18844 ?auto_18841 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18866 - SURFACE
      ?auto_18867 - SURFACE
      ?auto_18868 - SURFACE
      ?auto_18865 - SURFACE
    )
    :vars
    (
      ?auto_18870 - HOIST
      ?auto_18873 - PLACE
      ?auto_18871 - TRUCK
      ?auto_18869 - PLACE
      ?auto_18872 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_18870 ?auto_18873 ) ( SURFACE-AT ?auto_18868 ?auto_18873 ) ( CLEAR ?auto_18868 ) ( IS-CRATE ?auto_18865 ) ( not ( = ?auto_18868 ?auto_18865 ) ) ( AVAILABLE ?auto_18870 ) ( ON ?auto_18868 ?auto_18867 ) ( not ( = ?auto_18867 ?auto_18868 ) ) ( not ( = ?auto_18867 ?auto_18865 ) ) ( TRUCK-AT ?auto_18871 ?auto_18869 ) ( not ( = ?auto_18869 ?auto_18873 ) ) ( HOIST-AT ?auto_18872 ?auto_18869 ) ( LIFTING ?auto_18872 ?auto_18865 ) ( not ( = ?auto_18870 ?auto_18872 ) ) ( ON ?auto_18867 ?auto_18866 ) ( not ( = ?auto_18866 ?auto_18867 ) ) ( not ( = ?auto_18866 ?auto_18868 ) ) ( not ( = ?auto_18866 ?auto_18865 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18867 ?auto_18868 ?auto_18865 )
      ( MAKE-3CRATE-VERIFY ?auto_18866 ?auto_18867 ?auto_18868 ?auto_18865 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18893 - SURFACE
      ?auto_18894 - SURFACE
      ?auto_18895 - SURFACE
      ?auto_18892 - SURFACE
    )
    :vars
    (
      ?auto_18897 - HOIST
      ?auto_18901 - PLACE
      ?auto_18896 - TRUCK
      ?auto_18898 - PLACE
      ?auto_18899 - HOIST
      ?auto_18900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_18897 ?auto_18901 ) ( SURFACE-AT ?auto_18895 ?auto_18901 ) ( CLEAR ?auto_18895 ) ( IS-CRATE ?auto_18892 ) ( not ( = ?auto_18895 ?auto_18892 ) ) ( AVAILABLE ?auto_18897 ) ( ON ?auto_18895 ?auto_18894 ) ( not ( = ?auto_18894 ?auto_18895 ) ) ( not ( = ?auto_18894 ?auto_18892 ) ) ( TRUCK-AT ?auto_18896 ?auto_18898 ) ( not ( = ?auto_18898 ?auto_18901 ) ) ( HOIST-AT ?auto_18899 ?auto_18898 ) ( not ( = ?auto_18897 ?auto_18899 ) ) ( AVAILABLE ?auto_18899 ) ( SURFACE-AT ?auto_18892 ?auto_18898 ) ( ON ?auto_18892 ?auto_18900 ) ( CLEAR ?auto_18892 ) ( not ( = ?auto_18895 ?auto_18900 ) ) ( not ( = ?auto_18892 ?auto_18900 ) ) ( not ( = ?auto_18894 ?auto_18900 ) ) ( ON ?auto_18894 ?auto_18893 ) ( not ( = ?auto_18893 ?auto_18894 ) ) ( not ( = ?auto_18893 ?auto_18895 ) ) ( not ( = ?auto_18893 ?auto_18892 ) ) ( not ( = ?auto_18893 ?auto_18900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18894 ?auto_18895 ?auto_18892 )
      ( MAKE-3CRATE-VERIFY ?auto_18893 ?auto_18894 ?auto_18895 ?auto_18892 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18921 - SURFACE
      ?auto_18922 - SURFACE
      ?auto_18923 - SURFACE
      ?auto_18920 - SURFACE
    )
    :vars
    (
      ?auto_18929 - HOIST
      ?auto_18925 - PLACE
      ?auto_18924 - PLACE
      ?auto_18927 - HOIST
      ?auto_18926 - SURFACE
      ?auto_18928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18929 ?auto_18925 ) ( SURFACE-AT ?auto_18923 ?auto_18925 ) ( CLEAR ?auto_18923 ) ( IS-CRATE ?auto_18920 ) ( not ( = ?auto_18923 ?auto_18920 ) ) ( AVAILABLE ?auto_18929 ) ( ON ?auto_18923 ?auto_18922 ) ( not ( = ?auto_18922 ?auto_18923 ) ) ( not ( = ?auto_18922 ?auto_18920 ) ) ( not ( = ?auto_18924 ?auto_18925 ) ) ( HOIST-AT ?auto_18927 ?auto_18924 ) ( not ( = ?auto_18929 ?auto_18927 ) ) ( AVAILABLE ?auto_18927 ) ( SURFACE-AT ?auto_18920 ?auto_18924 ) ( ON ?auto_18920 ?auto_18926 ) ( CLEAR ?auto_18920 ) ( not ( = ?auto_18923 ?auto_18926 ) ) ( not ( = ?auto_18920 ?auto_18926 ) ) ( not ( = ?auto_18922 ?auto_18926 ) ) ( TRUCK-AT ?auto_18928 ?auto_18925 ) ( ON ?auto_18922 ?auto_18921 ) ( not ( = ?auto_18921 ?auto_18922 ) ) ( not ( = ?auto_18921 ?auto_18923 ) ) ( not ( = ?auto_18921 ?auto_18920 ) ) ( not ( = ?auto_18921 ?auto_18926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18922 ?auto_18923 ?auto_18920 )
      ( MAKE-3CRATE-VERIFY ?auto_18921 ?auto_18922 ?auto_18923 ?auto_18920 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18949 - SURFACE
      ?auto_18950 - SURFACE
      ?auto_18951 - SURFACE
      ?auto_18948 - SURFACE
    )
    :vars
    (
      ?auto_18956 - HOIST
      ?auto_18953 - PLACE
      ?auto_18955 - PLACE
      ?auto_18952 - HOIST
      ?auto_18954 - SURFACE
      ?auto_18957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18956 ?auto_18953 ) ( IS-CRATE ?auto_18948 ) ( not ( = ?auto_18951 ?auto_18948 ) ) ( not ( = ?auto_18950 ?auto_18951 ) ) ( not ( = ?auto_18950 ?auto_18948 ) ) ( not ( = ?auto_18955 ?auto_18953 ) ) ( HOIST-AT ?auto_18952 ?auto_18955 ) ( not ( = ?auto_18956 ?auto_18952 ) ) ( AVAILABLE ?auto_18952 ) ( SURFACE-AT ?auto_18948 ?auto_18955 ) ( ON ?auto_18948 ?auto_18954 ) ( CLEAR ?auto_18948 ) ( not ( = ?auto_18951 ?auto_18954 ) ) ( not ( = ?auto_18948 ?auto_18954 ) ) ( not ( = ?auto_18950 ?auto_18954 ) ) ( TRUCK-AT ?auto_18957 ?auto_18953 ) ( SURFACE-AT ?auto_18950 ?auto_18953 ) ( CLEAR ?auto_18950 ) ( LIFTING ?auto_18956 ?auto_18951 ) ( IS-CRATE ?auto_18951 ) ( ON ?auto_18950 ?auto_18949 ) ( not ( = ?auto_18949 ?auto_18950 ) ) ( not ( = ?auto_18949 ?auto_18951 ) ) ( not ( = ?auto_18949 ?auto_18948 ) ) ( not ( = ?auto_18949 ?auto_18954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18950 ?auto_18951 ?auto_18948 )
      ( MAKE-3CRATE-VERIFY ?auto_18949 ?auto_18950 ?auto_18951 ?auto_18948 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_18977 - SURFACE
      ?auto_18978 - SURFACE
      ?auto_18979 - SURFACE
      ?auto_18976 - SURFACE
    )
    :vars
    (
      ?auto_18984 - HOIST
      ?auto_18983 - PLACE
      ?auto_18982 - PLACE
      ?auto_18981 - HOIST
      ?auto_18980 - SURFACE
      ?auto_18985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18984 ?auto_18983 ) ( IS-CRATE ?auto_18976 ) ( not ( = ?auto_18979 ?auto_18976 ) ) ( not ( = ?auto_18978 ?auto_18979 ) ) ( not ( = ?auto_18978 ?auto_18976 ) ) ( not ( = ?auto_18982 ?auto_18983 ) ) ( HOIST-AT ?auto_18981 ?auto_18982 ) ( not ( = ?auto_18984 ?auto_18981 ) ) ( AVAILABLE ?auto_18981 ) ( SURFACE-AT ?auto_18976 ?auto_18982 ) ( ON ?auto_18976 ?auto_18980 ) ( CLEAR ?auto_18976 ) ( not ( = ?auto_18979 ?auto_18980 ) ) ( not ( = ?auto_18976 ?auto_18980 ) ) ( not ( = ?auto_18978 ?auto_18980 ) ) ( TRUCK-AT ?auto_18985 ?auto_18983 ) ( SURFACE-AT ?auto_18978 ?auto_18983 ) ( CLEAR ?auto_18978 ) ( IS-CRATE ?auto_18979 ) ( AVAILABLE ?auto_18984 ) ( IN ?auto_18979 ?auto_18985 ) ( ON ?auto_18978 ?auto_18977 ) ( not ( = ?auto_18977 ?auto_18978 ) ) ( not ( = ?auto_18977 ?auto_18979 ) ) ( not ( = ?auto_18977 ?auto_18976 ) ) ( not ( = ?auto_18977 ?auto_18980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_18978 ?auto_18979 ?auto_18976 )
      ( MAKE-3CRATE-VERIFY ?auto_18977 ?auto_18978 ?auto_18979 ?auto_18976 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19268 - SURFACE
      ?auto_19269 - SURFACE
      ?auto_19270 - SURFACE
      ?auto_19267 - SURFACE
      ?auto_19271 - SURFACE
    )
    :vars
    (
      ?auto_19273 - HOIST
      ?auto_19272 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19273 ?auto_19272 ) ( SURFACE-AT ?auto_19267 ?auto_19272 ) ( CLEAR ?auto_19267 ) ( LIFTING ?auto_19273 ?auto_19271 ) ( IS-CRATE ?auto_19271 ) ( not ( = ?auto_19267 ?auto_19271 ) ) ( ON ?auto_19269 ?auto_19268 ) ( ON ?auto_19270 ?auto_19269 ) ( ON ?auto_19267 ?auto_19270 ) ( not ( = ?auto_19268 ?auto_19269 ) ) ( not ( = ?auto_19268 ?auto_19270 ) ) ( not ( = ?auto_19268 ?auto_19267 ) ) ( not ( = ?auto_19268 ?auto_19271 ) ) ( not ( = ?auto_19269 ?auto_19270 ) ) ( not ( = ?auto_19269 ?auto_19267 ) ) ( not ( = ?auto_19269 ?auto_19271 ) ) ( not ( = ?auto_19270 ?auto_19267 ) ) ( not ( = ?auto_19270 ?auto_19271 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19267 ?auto_19271 )
      ( MAKE-4CRATE-VERIFY ?auto_19268 ?auto_19269 ?auto_19270 ?auto_19267 ?auto_19271 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19293 - SURFACE
      ?auto_19294 - SURFACE
      ?auto_19295 - SURFACE
      ?auto_19292 - SURFACE
      ?auto_19296 - SURFACE
    )
    :vars
    (
      ?auto_19298 - HOIST
      ?auto_19299 - PLACE
      ?auto_19297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19298 ?auto_19299 ) ( SURFACE-AT ?auto_19292 ?auto_19299 ) ( CLEAR ?auto_19292 ) ( IS-CRATE ?auto_19296 ) ( not ( = ?auto_19292 ?auto_19296 ) ) ( TRUCK-AT ?auto_19297 ?auto_19299 ) ( AVAILABLE ?auto_19298 ) ( IN ?auto_19296 ?auto_19297 ) ( ON ?auto_19292 ?auto_19295 ) ( not ( = ?auto_19295 ?auto_19292 ) ) ( not ( = ?auto_19295 ?auto_19296 ) ) ( ON ?auto_19294 ?auto_19293 ) ( ON ?auto_19295 ?auto_19294 ) ( not ( = ?auto_19293 ?auto_19294 ) ) ( not ( = ?auto_19293 ?auto_19295 ) ) ( not ( = ?auto_19293 ?auto_19292 ) ) ( not ( = ?auto_19293 ?auto_19296 ) ) ( not ( = ?auto_19294 ?auto_19295 ) ) ( not ( = ?auto_19294 ?auto_19292 ) ) ( not ( = ?auto_19294 ?auto_19296 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19295 ?auto_19292 ?auto_19296 )
      ( MAKE-4CRATE-VERIFY ?auto_19293 ?auto_19294 ?auto_19295 ?auto_19292 ?auto_19296 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19323 - SURFACE
      ?auto_19324 - SURFACE
      ?auto_19325 - SURFACE
      ?auto_19322 - SURFACE
      ?auto_19326 - SURFACE
    )
    :vars
    (
      ?auto_19330 - HOIST
      ?auto_19329 - PLACE
      ?auto_19327 - TRUCK
      ?auto_19328 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19330 ?auto_19329 ) ( SURFACE-AT ?auto_19322 ?auto_19329 ) ( CLEAR ?auto_19322 ) ( IS-CRATE ?auto_19326 ) ( not ( = ?auto_19322 ?auto_19326 ) ) ( AVAILABLE ?auto_19330 ) ( IN ?auto_19326 ?auto_19327 ) ( ON ?auto_19322 ?auto_19325 ) ( not ( = ?auto_19325 ?auto_19322 ) ) ( not ( = ?auto_19325 ?auto_19326 ) ) ( TRUCK-AT ?auto_19327 ?auto_19328 ) ( not ( = ?auto_19328 ?auto_19329 ) ) ( ON ?auto_19324 ?auto_19323 ) ( ON ?auto_19325 ?auto_19324 ) ( not ( = ?auto_19323 ?auto_19324 ) ) ( not ( = ?auto_19323 ?auto_19325 ) ) ( not ( = ?auto_19323 ?auto_19322 ) ) ( not ( = ?auto_19323 ?auto_19326 ) ) ( not ( = ?auto_19324 ?auto_19325 ) ) ( not ( = ?auto_19324 ?auto_19322 ) ) ( not ( = ?auto_19324 ?auto_19326 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19325 ?auto_19322 ?auto_19326 )
      ( MAKE-4CRATE-VERIFY ?auto_19323 ?auto_19324 ?auto_19325 ?auto_19322 ?auto_19326 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19357 - SURFACE
      ?auto_19358 - SURFACE
      ?auto_19359 - SURFACE
      ?auto_19356 - SURFACE
      ?auto_19360 - SURFACE
    )
    :vars
    (
      ?auto_19364 - HOIST
      ?auto_19362 - PLACE
      ?auto_19365 - TRUCK
      ?auto_19361 - PLACE
      ?auto_19363 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_19364 ?auto_19362 ) ( SURFACE-AT ?auto_19356 ?auto_19362 ) ( CLEAR ?auto_19356 ) ( IS-CRATE ?auto_19360 ) ( not ( = ?auto_19356 ?auto_19360 ) ) ( AVAILABLE ?auto_19364 ) ( ON ?auto_19356 ?auto_19359 ) ( not ( = ?auto_19359 ?auto_19356 ) ) ( not ( = ?auto_19359 ?auto_19360 ) ) ( TRUCK-AT ?auto_19365 ?auto_19361 ) ( not ( = ?auto_19361 ?auto_19362 ) ) ( HOIST-AT ?auto_19363 ?auto_19361 ) ( LIFTING ?auto_19363 ?auto_19360 ) ( not ( = ?auto_19364 ?auto_19363 ) ) ( ON ?auto_19358 ?auto_19357 ) ( ON ?auto_19359 ?auto_19358 ) ( not ( = ?auto_19357 ?auto_19358 ) ) ( not ( = ?auto_19357 ?auto_19359 ) ) ( not ( = ?auto_19357 ?auto_19356 ) ) ( not ( = ?auto_19357 ?auto_19360 ) ) ( not ( = ?auto_19358 ?auto_19359 ) ) ( not ( = ?auto_19358 ?auto_19356 ) ) ( not ( = ?auto_19358 ?auto_19360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19359 ?auto_19356 ?auto_19360 )
      ( MAKE-4CRATE-VERIFY ?auto_19357 ?auto_19358 ?auto_19359 ?auto_19356 ?auto_19360 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19395 - SURFACE
      ?auto_19396 - SURFACE
      ?auto_19397 - SURFACE
      ?auto_19394 - SURFACE
      ?auto_19398 - SURFACE
    )
    :vars
    (
      ?auto_19399 - HOIST
      ?auto_19400 - PLACE
      ?auto_19402 - TRUCK
      ?auto_19403 - PLACE
      ?auto_19401 - HOIST
      ?auto_19404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_19399 ?auto_19400 ) ( SURFACE-AT ?auto_19394 ?auto_19400 ) ( CLEAR ?auto_19394 ) ( IS-CRATE ?auto_19398 ) ( not ( = ?auto_19394 ?auto_19398 ) ) ( AVAILABLE ?auto_19399 ) ( ON ?auto_19394 ?auto_19397 ) ( not ( = ?auto_19397 ?auto_19394 ) ) ( not ( = ?auto_19397 ?auto_19398 ) ) ( TRUCK-AT ?auto_19402 ?auto_19403 ) ( not ( = ?auto_19403 ?auto_19400 ) ) ( HOIST-AT ?auto_19401 ?auto_19403 ) ( not ( = ?auto_19399 ?auto_19401 ) ) ( AVAILABLE ?auto_19401 ) ( SURFACE-AT ?auto_19398 ?auto_19403 ) ( ON ?auto_19398 ?auto_19404 ) ( CLEAR ?auto_19398 ) ( not ( = ?auto_19394 ?auto_19404 ) ) ( not ( = ?auto_19398 ?auto_19404 ) ) ( not ( = ?auto_19397 ?auto_19404 ) ) ( ON ?auto_19396 ?auto_19395 ) ( ON ?auto_19397 ?auto_19396 ) ( not ( = ?auto_19395 ?auto_19396 ) ) ( not ( = ?auto_19395 ?auto_19397 ) ) ( not ( = ?auto_19395 ?auto_19394 ) ) ( not ( = ?auto_19395 ?auto_19398 ) ) ( not ( = ?auto_19395 ?auto_19404 ) ) ( not ( = ?auto_19396 ?auto_19397 ) ) ( not ( = ?auto_19396 ?auto_19394 ) ) ( not ( = ?auto_19396 ?auto_19398 ) ) ( not ( = ?auto_19396 ?auto_19404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19397 ?auto_19394 ?auto_19398 )
      ( MAKE-4CRATE-VERIFY ?auto_19395 ?auto_19396 ?auto_19397 ?auto_19394 ?auto_19398 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19434 - SURFACE
      ?auto_19435 - SURFACE
      ?auto_19436 - SURFACE
      ?auto_19433 - SURFACE
      ?auto_19437 - SURFACE
    )
    :vars
    (
      ?auto_19441 - HOIST
      ?auto_19438 - PLACE
      ?auto_19440 - PLACE
      ?auto_19442 - HOIST
      ?auto_19443 - SURFACE
      ?auto_19439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19441 ?auto_19438 ) ( SURFACE-AT ?auto_19433 ?auto_19438 ) ( CLEAR ?auto_19433 ) ( IS-CRATE ?auto_19437 ) ( not ( = ?auto_19433 ?auto_19437 ) ) ( AVAILABLE ?auto_19441 ) ( ON ?auto_19433 ?auto_19436 ) ( not ( = ?auto_19436 ?auto_19433 ) ) ( not ( = ?auto_19436 ?auto_19437 ) ) ( not ( = ?auto_19440 ?auto_19438 ) ) ( HOIST-AT ?auto_19442 ?auto_19440 ) ( not ( = ?auto_19441 ?auto_19442 ) ) ( AVAILABLE ?auto_19442 ) ( SURFACE-AT ?auto_19437 ?auto_19440 ) ( ON ?auto_19437 ?auto_19443 ) ( CLEAR ?auto_19437 ) ( not ( = ?auto_19433 ?auto_19443 ) ) ( not ( = ?auto_19437 ?auto_19443 ) ) ( not ( = ?auto_19436 ?auto_19443 ) ) ( TRUCK-AT ?auto_19439 ?auto_19438 ) ( ON ?auto_19435 ?auto_19434 ) ( ON ?auto_19436 ?auto_19435 ) ( not ( = ?auto_19434 ?auto_19435 ) ) ( not ( = ?auto_19434 ?auto_19436 ) ) ( not ( = ?auto_19434 ?auto_19433 ) ) ( not ( = ?auto_19434 ?auto_19437 ) ) ( not ( = ?auto_19434 ?auto_19443 ) ) ( not ( = ?auto_19435 ?auto_19436 ) ) ( not ( = ?auto_19435 ?auto_19433 ) ) ( not ( = ?auto_19435 ?auto_19437 ) ) ( not ( = ?auto_19435 ?auto_19443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19436 ?auto_19433 ?auto_19437 )
      ( MAKE-4CRATE-VERIFY ?auto_19434 ?auto_19435 ?auto_19436 ?auto_19433 ?auto_19437 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19473 - SURFACE
      ?auto_19474 - SURFACE
      ?auto_19475 - SURFACE
      ?auto_19472 - SURFACE
      ?auto_19476 - SURFACE
    )
    :vars
    (
      ?auto_19482 - HOIST
      ?auto_19481 - PLACE
      ?auto_19480 - PLACE
      ?auto_19477 - HOIST
      ?auto_19479 - SURFACE
      ?auto_19478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19482 ?auto_19481 ) ( IS-CRATE ?auto_19476 ) ( not ( = ?auto_19472 ?auto_19476 ) ) ( not ( = ?auto_19475 ?auto_19472 ) ) ( not ( = ?auto_19475 ?auto_19476 ) ) ( not ( = ?auto_19480 ?auto_19481 ) ) ( HOIST-AT ?auto_19477 ?auto_19480 ) ( not ( = ?auto_19482 ?auto_19477 ) ) ( AVAILABLE ?auto_19477 ) ( SURFACE-AT ?auto_19476 ?auto_19480 ) ( ON ?auto_19476 ?auto_19479 ) ( CLEAR ?auto_19476 ) ( not ( = ?auto_19472 ?auto_19479 ) ) ( not ( = ?auto_19476 ?auto_19479 ) ) ( not ( = ?auto_19475 ?auto_19479 ) ) ( TRUCK-AT ?auto_19478 ?auto_19481 ) ( SURFACE-AT ?auto_19475 ?auto_19481 ) ( CLEAR ?auto_19475 ) ( LIFTING ?auto_19482 ?auto_19472 ) ( IS-CRATE ?auto_19472 ) ( ON ?auto_19474 ?auto_19473 ) ( ON ?auto_19475 ?auto_19474 ) ( not ( = ?auto_19473 ?auto_19474 ) ) ( not ( = ?auto_19473 ?auto_19475 ) ) ( not ( = ?auto_19473 ?auto_19472 ) ) ( not ( = ?auto_19473 ?auto_19476 ) ) ( not ( = ?auto_19473 ?auto_19479 ) ) ( not ( = ?auto_19474 ?auto_19475 ) ) ( not ( = ?auto_19474 ?auto_19472 ) ) ( not ( = ?auto_19474 ?auto_19476 ) ) ( not ( = ?auto_19474 ?auto_19479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19475 ?auto_19472 ?auto_19476 )
      ( MAKE-4CRATE-VERIFY ?auto_19473 ?auto_19474 ?auto_19475 ?auto_19472 ?auto_19476 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19512 - SURFACE
      ?auto_19513 - SURFACE
      ?auto_19514 - SURFACE
      ?auto_19511 - SURFACE
      ?auto_19515 - SURFACE
    )
    :vars
    (
      ?auto_19518 - HOIST
      ?auto_19520 - PLACE
      ?auto_19517 - PLACE
      ?auto_19519 - HOIST
      ?auto_19516 - SURFACE
      ?auto_19521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19518 ?auto_19520 ) ( IS-CRATE ?auto_19515 ) ( not ( = ?auto_19511 ?auto_19515 ) ) ( not ( = ?auto_19514 ?auto_19511 ) ) ( not ( = ?auto_19514 ?auto_19515 ) ) ( not ( = ?auto_19517 ?auto_19520 ) ) ( HOIST-AT ?auto_19519 ?auto_19517 ) ( not ( = ?auto_19518 ?auto_19519 ) ) ( AVAILABLE ?auto_19519 ) ( SURFACE-AT ?auto_19515 ?auto_19517 ) ( ON ?auto_19515 ?auto_19516 ) ( CLEAR ?auto_19515 ) ( not ( = ?auto_19511 ?auto_19516 ) ) ( not ( = ?auto_19515 ?auto_19516 ) ) ( not ( = ?auto_19514 ?auto_19516 ) ) ( TRUCK-AT ?auto_19521 ?auto_19520 ) ( SURFACE-AT ?auto_19514 ?auto_19520 ) ( CLEAR ?auto_19514 ) ( IS-CRATE ?auto_19511 ) ( AVAILABLE ?auto_19518 ) ( IN ?auto_19511 ?auto_19521 ) ( ON ?auto_19513 ?auto_19512 ) ( ON ?auto_19514 ?auto_19513 ) ( not ( = ?auto_19512 ?auto_19513 ) ) ( not ( = ?auto_19512 ?auto_19514 ) ) ( not ( = ?auto_19512 ?auto_19511 ) ) ( not ( = ?auto_19512 ?auto_19515 ) ) ( not ( = ?auto_19512 ?auto_19516 ) ) ( not ( = ?auto_19513 ?auto_19514 ) ) ( not ( = ?auto_19513 ?auto_19511 ) ) ( not ( = ?auto_19513 ?auto_19515 ) ) ( not ( = ?auto_19513 ?auto_19516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19514 ?auto_19511 ?auto_19515 )
      ( MAKE-4CRATE-VERIFY ?auto_19512 ?auto_19513 ?auto_19514 ?auto_19511 ?auto_19515 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20172 - SURFACE
      ?auto_20173 - SURFACE
      ?auto_20174 - SURFACE
      ?auto_20171 - SURFACE
      ?auto_20175 - SURFACE
      ?auto_20176 - SURFACE
    )
    :vars
    (
      ?auto_20178 - HOIST
      ?auto_20177 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20178 ?auto_20177 ) ( SURFACE-AT ?auto_20175 ?auto_20177 ) ( CLEAR ?auto_20175 ) ( LIFTING ?auto_20178 ?auto_20176 ) ( IS-CRATE ?auto_20176 ) ( not ( = ?auto_20175 ?auto_20176 ) ) ( ON ?auto_20173 ?auto_20172 ) ( ON ?auto_20174 ?auto_20173 ) ( ON ?auto_20171 ?auto_20174 ) ( ON ?auto_20175 ?auto_20171 ) ( not ( = ?auto_20172 ?auto_20173 ) ) ( not ( = ?auto_20172 ?auto_20174 ) ) ( not ( = ?auto_20172 ?auto_20171 ) ) ( not ( = ?auto_20172 ?auto_20175 ) ) ( not ( = ?auto_20172 ?auto_20176 ) ) ( not ( = ?auto_20173 ?auto_20174 ) ) ( not ( = ?auto_20173 ?auto_20171 ) ) ( not ( = ?auto_20173 ?auto_20175 ) ) ( not ( = ?auto_20173 ?auto_20176 ) ) ( not ( = ?auto_20174 ?auto_20171 ) ) ( not ( = ?auto_20174 ?auto_20175 ) ) ( not ( = ?auto_20174 ?auto_20176 ) ) ( not ( = ?auto_20171 ?auto_20175 ) ) ( not ( = ?auto_20171 ?auto_20176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_20175 ?auto_20176 )
      ( MAKE-5CRATE-VERIFY ?auto_20172 ?auto_20173 ?auto_20174 ?auto_20171 ?auto_20175 ?auto_20176 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20206 - SURFACE
      ?auto_20207 - SURFACE
      ?auto_20208 - SURFACE
      ?auto_20205 - SURFACE
      ?auto_20209 - SURFACE
      ?auto_20210 - SURFACE
    )
    :vars
    (
      ?auto_20212 - HOIST
      ?auto_20213 - PLACE
      ?auto_20211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20212 ?auto_20213 ) ( SURFACE-AT ?auto_20209 ?auto_20213 ) ( CLEAR ?auto_20209 ) ( IS-CRATE ?auto_20210 ) ( not ( = ?auto_20209 ?auto_20210 ) ) ( TRUCK-AT ?auto_20211 ?auto_20213 ) ( AVAILABLE ?auto_20212 ) ( IN ?auto_20210 ?auto_20211 ) ( ON ?auto_20209 ?auto_20205 ) ( not ( = ?auto_20205 ?auto_20209 ) ) ( not ( = ?auto_20205 ?auto_20210 ) ) ( ON ?auto_20207 ?auto_20206 ) ( ON ?auto_20208 ?auto_20207 ) ( ON ?auto_20205 ?auto_20208 ) ( not ( = ?auto_20206 ?auto_20207 ) ) ( not ( = ?auto_20206 ?auto_20208 ) ) ( not ( = ?auto_20206 ?auto_20205 ) ) ( not ( = ?auto_20206 ?auto_20209 ) ) ( not ( = ?auto_20206 ?auto_20210 ) ) ( not ( = ?auto_20207 ?auto_20208 ) ) ( not ( = ?auto_20207 ?auto_20205 ) ) ( not ( = ?auto_20207 ?auto_20209 ) ) ( not ( = ?auto_20207 ?auto_20210 ) ) ( not ( = ?auto_20208 ?auto_20205 ) ) ( not ( = ?auto_20208 ?auto_20209 ) ) ( not ( = ?auto_20208 ?auto_20210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20205 ?auto_20209 ?auto_20210 )
      ( MAKE-5CRATE-VERIFY ?auto_20206 ?auto_20207 ?auto_20208 ?auto_20205 ?auto_20209 ?auto_20210 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20246 - SURFACE
      ?auto_20247 - SURFACE
      ?auto_20248 - SURFACE
      ?auto_20245 - SURFACE
      ?auto_20249 - SURFACE
      ?auto_20250 - SURFACE
    )
    :vars
    (
      ?auto_20251 - HOIST
      ?auto_20253 - PLACE
      ?auto_20252 - TRUCK
      ?auto_20254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20251 ?auto_20253 ) ( SURFACE-AT ?auto_20249 ?auto_20253 ) ( CLEAR ?auto_20249 ) ( IS-CRATE ?auto_20250 ) ( not ( = ?auto_20249 ?auto_20250 ) ) ( AVAILABLE ?auto_20251 ) ( IN ?auto_20250 ?auto_20252 ) ( ON ?auto_20249 ?auto_20245 ) ( not ( = ?auto_20245 ?auto_20249 ) ) ( not ( = ?auto_20245 ?auto_20250 ) ) ( TRUCK-AT ?auto_20252 ?auto_20254 ) ( not ( = ?auto_20254 ?auto_20253 ) ) ( ON ?auto_20247 ?auto_20246 ) ( ON ?auto_20248 ?auto_20247 ) ( ON ?auto_20245 ?auto_20248 ) ( not ( = ?auto_20246 ?auto_20247 ) ) ( not ( = ?auto_20246 ?auto_20248 ) ) ( not ( = ?auto_20246 ?auto_20245 ) ) ( not ( = ?auto_20246 ?auto_20249 ) ) ( not ( = ?auto_20246 ?auto_20250 ) ) ( not ( = ?auto_20247 ?auto_20248 ) ) ( not ( = ?auto_20247 ?auto_20245 ) ) ( not ( = ?auto_20247 ?auto_20249 ) ) ( not ( = ?auto_20247 ?auto_20250 ) ) ( not ( = ?auto_20248 ?auto_20245 ) ) ( not ( = ?auto_20248 ?auto_20249 ) ) ( not ( = ?auto_20248 ?auto_20250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20245 ?auto_20249 ?auto_20250 )
      ( MAKE-5CRATE-VERIFY ?auto_20246 ?auto_20247 ?auto_20248 ?auto_20245 ?auto_20249 ?auto_20250 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20291 - SURFACE
      ?auto_20292 - SURFACE
      ?auto_20293 - SURFACE
      ?auto_20290 - SURFACE
      ?auto_20294 - SURFACE
      ?auto_20295 - SURFACE
    )
    :vars
    (
      ?auto_20300 - HOIST
      ?auto_20296 - PLACE
      ?auto_20298 - TRUCK
      ?auto_20297 - PLACE
      ?auto_20299 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_20300 ?auto_20296 ) ( SURFACE-AT ?auto_20294 ?auto_20296 ) ( CLEAR ?auto_20294 ) ( IS-CRATE ?auto_20295 ) ( not ( = ?auto_20294 ?auto_20295 ) ) ( AVAILABLE ?auto_20300 ) ( ON ?auto_20294 ?auto_20290 ) ( not ( = ?auto_20290 ?auto_20294 ) ) ( not ( = ?auto_20290 ?auto_20295 ) ) ( TRUCK-AT ?auto_20298 ?auto_20297 ) ( not ( = ?auto_20297 ?auto_20296 ) ) ( HOIST-AT ?auto_20299 ?auto_20297 ) ( LIFTING ?auto_20299 ?auto_20295 ) ( not ( = ?auto_20300 ?auto_20299 ) ) ( ON ?auto_20292 ?auto_20291 ) ( ON ?auto_20293 ?auto_20292 ) ( ON ?auto_20290 ?auto_20293 ) ( not ( = ?auto_20291 ?auto_20292 ) ) ( not ( = ?auto_20291 ?auto_20293 ) ) ( not ( = ?auto_20291 ?auto_20290 ) ) ( not ( = ?auto_20291 ?auto_20294 ) ) ( not ( = ?auto_20291 ?auto_20295 ) ) ( not ( = ?auto_20292 ?auto_20293 ) ) ( not ( = ?auto_20292 ?auto_20290 ) ) ( not ( = ?auto_20292 ?auto_20294 ) ) ( not ( = ?auto_20292 ?auto_20295 ) ) ( not ( = ?auto_20293 ?auto_20290 ) ) ( not ( = ?auto_20293 ?auto_20294 ) ) ( not ( = ?auto_20293 ?auto_20295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20290 ?auto_20294 ?auto_20295 )
      ( MAKE-5CRATE-VERIFY ?auto_20291 ?auto_20292 ?auto_20293 ?auto_20290 ?auto_20294 ?auto_20295 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20341 - SURFACE
      ?auto_20342 - SURFACE
      ?auto_20343 - SURFACE
      ?auto_20340 - SURFACE
      ?auto_20344 - SURFACE
      ?auto_20345 - SURFACE
    )
    :vars
    (
      ?auto_20349 - HOIST
      ?auto_20351 - PLACE
      ?auto_20350 - TRUCK
      ?auto_20348 - PLACE
      ?auto_20346 - HOIST
      ?auto_20347 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_20349 ?auto_20351 ) ( SURFACE-AT ?auto_20344 ?auto_20351 ) ( CLEAR ?auto_20344 ) ( IS-CRATE ?auto_20345 ) ( not ( = ?auto_20344 ?auto_20345 ) ) ( AVAILABLE ?auto_20349 ) ( ON ?auto_20344 ?auto_20340 ) ( not ( = ?auto_20340 ?auto_20344 ) ) ( not ( = ?auto_20340 ?auto_20345 ) ) ( TRUCK-AT ?auto_20350 ?auto_20348 ) ( not ( = ?auto_20348 ?auto_20351 ) ) ( HOIST-AT ?auto_20346 ?auto_20348 ) ( not ( = ?auto_20349 ?auto_20346 ) ) ( AVAILABLE ?auto_20346 ) ( SURFACE-AT ?auto_20345 ?auto_20348 ) ( ON ?auto_20345 ?auto_20347 ) ( CLEAR ?auto_20345 ) ( not ( = ?auto_20344 ?auto_20347 ) ) ( not ( = ?auto_20345 ?auto_20347 ) ) ( not ( = ?auto_20340 ?auto_20347 ) ) ( ON ?auto_20342 ?auto_20341 ) ( ON ?auto_20343 ?auto_20342 ) ( ON ?auto_20340 ?auto_20343 ) ( not ( = ?auto_20341 ?auto_20342 ) ) ( not ( = ?auto_20341 ?auto_20343 ) ) ( not ( = ?auto_20341 ?auto_20340 ) ) ( not ( = ?auto_20341 ?auto_20344 ) ) ( not ( = ?auto_20341 ?auto_20345 ) ) ( not ( = ?auto_20341 ?auto_20347 ) ) ( not ( = ?auto_20342 ?auto_20343 ) ) ( not ( = ?auto_20342 ?auto_20340 ) ) ( not ( = ?auto_20342 ?auto_20344 ) ) ( not ( = ?auto_20342 ?auto_20345 ) ) ( not ( = ?auto_20342 ?auto_20347 ) ) ( not ( = ?auto_20343 ?auto_20340 ) ) ( not ( = ?auto_20343 ?auto_20344 ) ) ( not ( = ?auto_20343 ?auto_20345 ) ) ( not ( = ?auto_20343 ?auto_20347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20340 ?auto_20344 ?auto_20345 )
      ( MAKE-5CRATE-VERIFY ?auto_20341 ?auto_20342 ?auto_20343 ?auto_20340 ?auto_20344 ?auto_20345 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20392 - SURFACE
      ?auto_20393 - SURFACE
      ?auto_20394 - SURFACE
      ?auto_20391 - SURFACE
      ?auto_20395 - SURFACE
      ?auto_20396 - SURFACE
    )
    :vars
    (
      ?auto_20402 - HOIST
      ?auto_20397 - PLACE
      ?auto_20399 - PLACE
      ?auto_20398 - HOIST
      ?auto_20401 - SURFACE
      ?auto_20400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20402 ?auto_20397 ) ( SURFACE-AT ?auto_20395 ?auto_20397 ) ( CLEAR ?auto_20395 ) ( IS-CRATE ?auto_20396 ) ( not ( = ?auto_20395 ?auto_20396 ) ) ( AVAILABLE ?auto_20402 ) ( ON ?auto_20395 ?auto_20391 ) ( not ( = ?auto_20391 ?auto_20395 ) ) ( not ( = ?auto_20391 ?auto_20396 ) ) ( not ( = ?auto_20399 ?auto_20397 ) ) ( HOIST-AT ?auto_20398 ?auto_20399 ) ( not ( = ?auto_20402 ?auto_20398 ) ) ( AVAILABLE ?auto_20398 ) ( SURFACE-AT ?auto_20396 ?auto_20399 ) ( ON ?auto_20396 ?auto_20401 ) ( CLEAR ?auto_20396 ) ( not ( = ?auto_20395 ?auto_20401 ) ) ( not ( = ?auto_20396 ?auto_20401 ) ) ( not ( = ?auto_20391 ?auto_20401 ) ) ( TRUCK-AT ?auto_20400 ?auto_20397 ) ( ON ?auto_20393 ?auto_20392 ) ( ON ?auto_20394 ?auto_20393 ) ( ON ?auto_20391 ?auto_20394 ) ( not ( = ?auto_20392 ?auto_20393 ) ) ( not ( = ?auto_20392 ?auto_20394 ) ) ( not ( = ?auto_20392 ?auto_20391 ) ) ( not ( = ?auto_20392 ?auto_20395 ) ) ( not ( = ?auto_20392 ?auto_20396 ) ) ( not ( = ?auto_20392 ?auto_20401 ) ) ( not ( = ?auto_20393 ?auto_20394 ) ) ( not ( = ?auto_20393 ?auto_20391 ) ) ( not ( = ?auto_20393 ?auto_20395 ) ) ( not ( = ?auto_20393 ?auto_20396 ) ) ( not ( = ?auto_20393 ?auto_20401 ) ) ( not ( = ?auto_20394 ?auto_20391 ) ) ( not ( = ?auto_20394 ?auto_20395 ) ) ( not ( = ?auto_20394 ?auto_20396 ) ) ( not ( = ?auto_20394 ?auto_20401 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20391 ?auto_20395 ?auto_20396 )
      ( MAKE-5CRATE-VERIFY ?auto_20392 ?auto_20393 ?auto_20394 ?auto_20391 ?auto_20395 ?auto_20396 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20443 - SURFACE
      ?auto_20444 - SURFACE
      ?auto_20445 - SURFACE
      ?auto_20442 - SURFACE
      ?auto_20446 - SURFACE
      ?auto_20447 - SURFACE
    )
    :vars
    (
      ?auto_20449 - HOIST
      ?auto_20453 - PLACE
      ?auto_20450 - PLACE
      ?auto_20448 - HOIST
      ?auto_20451 - SURFACE
      ?auto_20452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20449 ?auto_20453 ) ( IS-CRATE ?auto_20447 ) ( not ( = ?auto_20446 ?auto_20447 ) ) ( not ( = ?auto_20442 ?auto_20446 ) ) ( not ( = ?auto_20442 ?auto_20447 ) ) ( not ( = ?auto_20450 ?auto_20453 ) ) ( HOIST-AT ?auto_20448 ?auto_20450 ) ( not ( = ?auto_20449 ?auto_20448 ) ) ( AVAILABLE ?auto_20448 ) ( SURFACE-AT ?auto_20447 ?auto_20450 ) ( ON ?auto_20447 ?auto_20451 ) ( CLEAR ?auto_20447 ) ( not ( = ?auto_20446 ?auto_20451 ) ) ( not ( = ?auto_20447 ?auto_20451 ) ) ( not ( = ?auto_20442 ?auto_20451 ) ) ( TRUCK-AT ?auto_20452 ?auto_20453 ) ( SURFACE-AT ?auto_20442 ?auto_20453 ) ( CLEAR ?auto_20442 ) ( LIFTING ?auto_20449 ?auto_20446 ) ( IS-CRATE ?auto_20446 ) ( ON ?auto_20444 ?auto_20443 ) ( ON ?auto_20445 ?auto_20444 ) ( ON ?auto_20442 ?auto_20445 ) ( not ( = ?auto_20443 ?auto_20444 ) ) ( not ( = ?auto_20443 ?auto_20445 ) ) ( not ( = ?auto_20443 ?auto_20442 ) ) ( not ( = ?auto_20443 ?auto_20446 ) ) ( not ( = ?auto_20443 ?auto_20447 ) ) ( not ( = ?auto_20443 ?auto_20451 ) ) ( not ( = ?auto_20444 ?auto_20445 ) ) ( not ( = ?auto_20444 ?auto_20442 ) ) ( not ( = ?auto_20444 ?auto_20446 ) ) ( not ( = ?auto_20444 ?auto_20447 ) ) ( not ( = ?auto_20444 ?auto_20451 ) ) ( not ( = ?auto_20445 ?auto_20442 ) ) ( not ( = ?auto_20445 ?auto_20446 ) ) ( not ( = ?auto_20445 ?auto_20447 ) ) ( not ( = ?auto_20445 ?auto_20451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20442 ?auto_20446 ?auto_20447 )
      ( MAKE-5CRATE-VERIFY ?auto_20443 ?auto_20444 ?auto_20445 ?auto_20442 ?auto_20446 ?auto_20447 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20494 - SURFACE
      ?auto_20495 - SURFACE
      ?auto_20496 - SURFACE
      ?auto_20493 - SURFACE
      ?auto_20497 - SURFACE
      ?auto_20498 - SURFACE
    )
    :vars
    (
      ?auto_20500 - HOIST
      ?auto_20504 - PLACE
      ?auto_20502 - PLACE
      ?auto_20499 - HOIST
      ?auto_20501 - SURFACE
      ?auto_20503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20500 ?auto_20504 ) ( IS-CRATE ?auto_20498 ) ( not ( = ?auto_20497 ?auto_20498 ) ) ( not ( = ?auto_20493 ?auto_20497 ) ) ( not ( = ?auto_20493 ?auto_20498 ) ) ( not ( = ?auto_20502 ?auto_20504 ) ) ( HOIST-AT ?auto_20499 ?auto_20502 ) ( not ( = ?auto_20500 ?auto_20499 ) ) ( AVAILABLE ?auto_20499 ) ( SURFACE-AT ?auto_20498 ?auto_20502 ) ( ON ?auto_20498 ?auto_20501 ) ( CLEAR ?auto_20498 ) ( not ( = ?auto_20497 ?auto_20501 ) ) ( not ( = ?auto_20498 ?auto_20501 ) ) ( not ( = ?auto_20493 ?auto_20501 ) ) ( TRUCK-AT ?auto_20503 ?auto_20504 ) ( SURFACE-AT ?auto_20493 ?auto_20504 ) ( CLEAR ?auto_20493 ) ( IS-CRATE ?auto_20497 ) ( AVAILABLE ?auto_20500 ) ( IN ?auto_20497 ?auto_20503 ) ( ON ?auto_20495 ?auto_20494 ) ( ON ?auto_20496 ?auto_20495 ) ( ON ?auto_20493 ?auto_20496 ) ( not ( = ?auto_20494 ?auto_20495 ) ) ( not ( = ?auto_20494 ?auto_20496 ) ) ( not ( = ?auto_20494 ?auto_20493 ) ) ( not ( = ?auto_20494 ?auto_20497 ) ) ( not ( = ?auto_20494 ?auto_20498 ) ) ( not ( = ?auto_20494 ?auto_20501 ) ) ( not ( = ?auto_20495 ?auto_20496 ) ) ( not ( = ?auto_20495 ?auto_20493 ) ) ( not ( = ?auto_20495 ?auto_20497 ) ) ( not ( = ?auto_20495 ?auto_20498 ) ) ( not ( = ?auto_20495 ?auto_20501 ) ) ( not ( = ?auto_20496 ?auto_20493 ) ) ( not ( = ?auto_20496 ?auto_20497 ) ) ( not ( = ?auto_20496 ?auto_20498 ) ) ( not ( = ?auto_20496 ?auto_20501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_20493 ?auto_20497 ?auto_20498 )
      ( MAKE-5CRATE-VERIFY ?auto_20494 ?auto_20495 ?auto_20496 ?auto_20493 ?auto_20497 ?auto_20498 ) )
  )

)

