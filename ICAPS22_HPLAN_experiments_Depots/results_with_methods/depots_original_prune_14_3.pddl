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
      ?auto_56701 - SURFACE
      ?auto_56702 - SURFACE
    )
    :vars
    (
      ?auto_56703 - HOIST
      ?auto_56704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56703 ?auto_56704 ) ( SURFACE-AT ?auto_56702 ?auto_56704 ) ( CLEAR ?auto_56702 ) ( LIFTING ?auto_56703 ?auto_56701 ) ( IS-CRATE ?auto_56701 ) ( not ( = ?auto_56701 ?auto_56702 ) ) )
    :subtasks
    ( ( !DROP ?auto_56703 ?auto_56701 ?auto_56702 ?auto_56704 )
      ( MAKE-ON-VERIFY ?auto_56701 ?auto_56702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56705 - SURFACE
      ?auto_56706 - SURFACE
    )
    :vars
    (
      ?auto_56707 - HOIST
      ?auto_56708 - PLACE
      ?auto_56709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56707 ?auto_56708 ) ( SURFACE-AT ?auto_56706 ?auto_56708 ) ( CLEAR ?auto_56706 ) ( IS-CRATE ?auto_56705 ) ( not ( = ?auto_56705 ?auto_56706 ) ) ( TRUCK-AT ?auto_56709 ?auto_56708 ) ( AVAILABLE ?auto_56707 ) ( IN ?auto_56705 ?auto_56709 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56707 ?auto_56705 ?auto_56709 ?auto_56708 )
      ( MAKE-ON ?auto_56705 ?auto_56706 )
      ( MAKE-ON-VERIFY ?auto_56705 ?auto_56706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56710 - SURFACE
      ?auto_56711 - SURFACE
    )
    :vars
    (
      ?auto_56713 - HOIST
      ?auto_56712 - PLACE
      ?auto_56714 - TRUCK
      ?auto_56715 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56713 ?auto_56712 ) ( SURFACE-AT ?auto_56711 ?auto_56712 ) ( CLEAR ?auto_56711 ) ( IS-CRATE ?auto_56710 ) ( not ( = ?auto_56710 ?auto_56711 ) ) ( AVAILABLE ?auto_56713 ) ( IN ?auto_56710 ?auto_56714 ) ( TRUCK-AT ?auto_56714 ?auto_56715 ) ( not ( = ?auto_56715 ?auto_56712 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56714 ?auto_56715 ?auto_56712 )
      ( MAKE-ON ?auto_56710 ?auto_56711 )
      ( MAKE-ON-VERIFY ?auto_56710 ?auto_56711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56716 - SURFACE
      ?auto_56717 - SURFACE
    )
    :vars
    (
      ?auto_56719 - HOIST
      ?auto_56721 - PLACE
      ?auto_56720 - TRUCK
      ?auto_56718 - PLACE
      ?auto_56722 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_56719 ?auto_56721 ) ( SURFACE-AT ?auto_56717 ?auto_56721 ) ( CLEAR ?auto_56717 ) ( IS-CRATE ?auto_56716 ) ( not ( = ?auto_56716 ?auto_56717 ) ) ( AVAILABLE ?auto_56719 ) ( TRUCK-AT ?auto_56720 ?auto_56718 ) ( not ( = ?auto_56718 ?auto_56721 ) ) ( HOIST-AT ?auto_56722 ?auto_56718 ) ( LIFTING ?auto_56722 ?auto_56716 ) ( not ( = ?auto_56719 ?auto_56722 ) ) )
    :subtasks
    ( ( !LOAD ?auto_56722 ?auto_56716 ?auto_56720 ?auto_56718 )
      ( MAKE-ON ?auto_56716 ?auto_56717 )
      ( MAKE-ON-VERIFY ?auto_56716 ?auto_56717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56723 - SURFACE
      ?auto_56724 - SURFACE
    )
    :vars
    (
      ?auto_56726 - HOIST
      ?auto_56729 - PLACE
      ?auto_56728 - TRUCK
      ?auto_56725 - PLACE
      ?auto_56727 - HOIST
      ?auto_56730 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56726 ?auto_56729 ) ( SURFACE-AT ?auto_56724 ?auto_56729 ) ( CLEAR ?auto_56724 ) ( IS-CRATE ?auto_56723 ) ( not ( = ?auto_56723 ?auto_56724 ) ) ( AVAILABLE ?auto_56726 ) ( TRUCK-AT ?auto_56728 ?auto_56725 ) ( not ( = ?auto_56725 ?auto_56729 ) ) ( HOIST-AT ?auto_56727 ?auto_56725 ) ( not ( = ?auto_56726 ?auto_56727 ) ) ( AVAILABLE ?auto_56727 ) ( SURFACE-AT ?auto_56723 ?auto_56725 ) ( ON ?auto_56723 ?auto_56730 ) ( CLEAR ?auto_56723 ) ( not ( = ?auto_56723 ?auto_56730 ) ) ( not ( = ?auto_56724 ?auto_56730 ) ) )
    :subtasks
    ( ( !LIFT ?auto_56727 ?auto_56723 ?auto_56730 ?auto_56725 )
      ( MAKE-ON ?auto_56723 ?auto_56724 )
      ( MAKE-ON-VERIFY ?auto_56723 ?auto_56724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56731 - SURFACE
      ?auto_56732 - SURFACE
    )
    :vars
    (
      ?auto_56738 - HOIST
      ?auto_56734 - PLACE
      ?auto_56736 - PLACE
      ?auto_56735 - HOIST
      ?auto_56737 - SURFACE
      ?auto_56733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_56738 ?auto_56734 ) ( SURFACE-AT ?auto_56732 ?auto_56734 ) ( CLEAR ?auto_56732 ) ( IS-CRATE ?auto_56731 ) ( not ( = ?auto_56731 ?auto_56732 ) ) ( AVAILABLE ?auto_56738 ) ( not ( = ?auto_56736 ?auto_56734 ) ) ( HOIST-AT ?auto_56735 ?auto_56736 ) ( not ( = ?auto_56738 ?auto_56735 ) ) ( AVAILABLE ?auto_56735 ) ( SURFACE-AT ?auto_56731 ?auto_56736 ) ( ON ?auto_56731 ?auto_56737 ) ( CLEAR ?auto_56731 ) ( not ( = ?auto_56731 ?auto_56737 ) ) ( not ( = ?auto_56732 ?auto_56737 ) ) ( TRUCK-AT ?auto_56733 ?auto_56734 ) )
    :subtasks
    ( ( !DRIVE ?auto_56733 ?auto_56734 ?auto_56736 )
      ( MAKE-ON ?auto_56731 ?auto_56732 )
      ( MAKE-ON-VERIFY ?auto_56731 ?auto_56732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56779 - SURFACE
      ?auto_56780 - SURFACE
    )
    :vars
    (
      ?auto_56782 - HOIST
      ?auto_56781 - PLACE
      ?auto_56786 - PLACE
      ?auto_56784 - HOIST
      ?auto_56783 - SURFACE
      ?auto_56785 - TRUCK
      ?auto_56787 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56782 ?auto_56781 ) ( IS-CRATE ?auto_56779 ) ( not ( = ?auto_56779 ?auto_56780 ) ) ( not ( = ?auto_56786 ?auto_56781 ) ) ( HOIST-AT ?auto_56784 ?auto_56786 ) ( not ( = ?auto_56782 ?auto_56784 ) ) ( AVAILABLE ?auto_56784 ) ( SURFACE-AT ?auto_56779 ?auto_56786 ) ( ON ?auto_56779 ?auto_56783 ) ( CLEAR ?auto_56779 ) ( not ( = ?auto_56779 ?auto_56783 ) ) ( not ( = ?auto_56780 ?auto_56783 ) ) ( TRUCK-AT ?auto_56785 ?auto_56781 ) ( SURFACE-AT ?auto_56787 ?auto_56781 ) ( CLEAR ?auto_56787 ) ( LIFTING ?auto_56782 ?auto_56780 ) ( IS-CRATE ?auto_56780 ) ( not ( = ?auto_56779 ?auto_56787 ) ) ( not ( = ?auto_56780 ?auto_56787 ) ) ( not ( = ?auto_56783 ?auto_56787 ) ) )
    :subtasks
    ( ( !DROP ?auto_56782 ?auto_56780 ?auto_56787 ?auto_56781 )
      ( MAKE-ON ?auto_56779 ?auto_56780 )
      ( MAKE-ON-VERIFY ?auto_56779 ?auto_56780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56788 - SURFACE
      ?auto_56789 - SURFACE
    )
    :vars
    (
      ?auto_56793 - HOIST
      ?auto_56790 - PLACE
      ?auto_56795 - PLACE
      ?auto_56794 - HOIST
      ?auto_56792 - SURFACE
      ?auto_56791 - TRUCK
      ?auto_56796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56793 ?auto_56790 ) ( IS-CRATE ?auto_56788 ) ( not ( = ?auto_56788 ?auto_56789 ) ) ( not ( = ?auto_56795 ?auto_56790 ) ) ( HOIST-AT ?auto_56794 ?auto_56795 ) ( not ( = ?auto_56793 ?auto_56794 ) ) ( AVAILABLE ?auto_56794 ) ( SURFACE-AT ?auto_56788 ?auto_56795 ) ( ON ?auto_56788 ?auto_56792 ) ( CLEAR ?auto_56788 ) ( not ( = ?auto_56788 ?auto_56792 ) ) ( not ( = ?auto_56789 ?auto_56792 ) ) ( TRUCK-AT ?auto_56791 ?auto_56790 ) ( SURFACE-AT ?auto_56796 ?auto_56790 ) ( CLEAR ?auto_56796 ) ( IS-CRATE ?auto_56789 ) ( not ( = ?auto_56788 ?auto_56796 ) ) ( not ( = ?auto_56789 ?auto_56796 ) ) ( not ( = ?auto_56792 ?auto_56796 ) ) ( AVAILABLE ?auto_56793 ) ( IN ?auto_56789 ?auto_56791 ) )
    :subtasks
    ( ( !UNLOAD ?auto_56793 ?auto_56789 ?auto_56791 ?auto_56790 )
      ( MAKE-ON ?auto_56788 ?auto_56789 )
      ( MAKE-ON-VERIFY ?auto_56788 ?auto_56789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56803 - SURFACE
      ?auto_56804 - SURFACE
    )
    :vars
    (
      ?auto_56810 - HOIST
      ?auto_56809 - PLACE
      ?auto_56808 - PLACE
      ?auto_56807 - HOIST
      ?auto_56805 - SURFACE
      ?auto_56806 - TRUCK
      ?auto_56811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_56810 ?auto_56809 ) ( SURFACE-AT ?auto_56804 ?auto_56809 ) ( CLEAR ?auto_56804 ) ( IS-CRATE ?auto_56803 ) ( not ( = ?auto_56803 ?auto_56804 ) ) ( AVAILABLE ?auto_56810 ) ( not ( = ?auto_56808 ?auto_56809 ) ) ( HOIST-AT ?auto_56807 ?auto_56808 ) ( not ( = ?auto_56810 ?auto_56807 ) ) ( AVAILABLE ?auto_56807 ) ( SURFACE-AT ?auto_56803 ?auto_56808 ) ( ON ?auto_56803 ?auto_56805 ) ( CLEAR ?auto_56803 ) ( not ( = ?auto_56803 ?auto_56805 ) ) ( not ( = ?auto_56804 ?auto_56805 ) ) ( TRUCK-AT ?auto_56806 ?auto_56811 ) ( not ( = ?auto_56811 ?auto_56809 ) ) ( not ( = ?auto_56808 ?auto_56811 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_56806 ?auto_56811 ?auto_56809 )
      ( MAKE-ON ?auto_56803 ?auto_56804 )
      ( MAKE-ON-VERIFY ?auto_56803 ?auto_56804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57085 - SURFACE
      ?auto_57086 - SURFACE
    )
    :vars
    (
      ?auto_57089 - HOIST
      ?auto_57091 - PLACE
      ?auto_57088 - TRUCK
      ?auto_57090 - PLACE
      ?auto_57087 - HOIST
      ?auto_57092 - SURFACE
      ?auto_57093 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57089 ?auto_57091 ) ( SURFACE-AT ?auto_57086 ?auto_57091 ) ( CLEAR ?auto_57086 ) ( IS-CRATE ?auto_57085 ) ( not ( = ?auto_57085 ?auto_57086 ) ) ( AVAILABLE ?auto_57089 ) ( TRUCK-AT ?auto_57088 ?auto_57090 ) ( not ( = ?auto_57090 ?auto_57091 ) ) ( HOIST-AT ?auto_57087 ?auto_57090 ) ( not ( = ?auto_57089 ?auto_57087 ) ) ( SURFACE-AT ?auto_57085 ?auto_57090 ) ( ON ?auto_57085 ?auto_57092 ) ( CLEAR ?auto_57085 ) ( not ( = ?auto_57085 ?auto_57092 ) ) ( not ( = ?auto_57086 ?auto_57092 ) ) ( LIFTING ?auto_57087 ?auto_57093 ) ( IS-CRATE ?auto_57093 ) ( not ( = ?auto_57085 ?auto_57093 ) ) ( not ( = ?auto_57086 ?auto_57093 ) ) ( not ( = ?auto_57092 ?auto_57093 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57087 ?auto_57093 ?auto_57088 ?auto_57090 )
      ( MAKE-ON ?auto_57085 ?auto_57086 )
      ( MAKE-ON-VERIFY ?auto_57085 ?auto_57086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57220 - SURFACE
      ?auto_57221 - SURFACE
    )
    :vars
    (
      ?auto_57225 - HOIST
      ?auto_57227 - PLACE
      ?auto_57224 - PLACE
      ?auto_57226 - HOIST
      ?auto_57223 - SURFACE
      ?auto_57222 - TRUCK
      ?auto_57228 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57225 ?auto_57227 ) ( SURFACE-AT ?auto_57221 ?auto_57227 ) ( CLEAR ?auto_57221 ) ( IS-CRATE ?auto_57220 ) ( not ( = ?auto_57220 ?auto_57221 ) ) ( not ( = ?auto_57224 ?auto_57227 ) ) ( HOIST-AT ?auto_57226 ?auto_57224 ) ( not ( = ?auto_57225 ?auto_57226 ) ) ( AVAILABLE ?auto_57226 ) ( SURFACE-AT ?auto_57220 ?auto_57224 ) ( ON ?auto_57220 ?auto_57223 ) ( CLEAR ?auto_57220 ) ( not ( = ?auto_57220 ?auto_57223 ) ) ( not ( = ?auto_57221 ?auto_57223 ) ) ( TRUCK-AT ?auto_57222 ?auto_57227 ) ( LIFTING ?auto_57225 ?auto_57228 ) ( IS-CRATE ?auto_57228 ) ( not ( = ?auto_57220 ?auto_57228 ) ) ( not ( = ?auto_57221 ?auto_57228 ) ) ( not ( = ?auto_57223 ?auto_57228 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57225 ?auto_57228 ?auto_57222 ?auto_57227 )
      ( MAKE-ON ?auto_57220 ?auto_57221 )
      ( MAKE-ON-VERIFY ?auto_57220 ?auto_57221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57443 - SURFACE
      ?auto_57444 - SURFACE
    )
    :vars
    (
      ?auto_57448 - HOIST
      ?auto_57446 - PLACE
      ?auto_57449 - PLACE
      ?auto_57447 - HOIST
      ?auto_57451 - SURFACE
      ?auto_57445 - SURFACE
      ?auto_57450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57448 ?auto_57446 ) ( IS-CRATE ?auto_57443 ) ( not ( = ?auto_57443 ?auto_57444 ) ) ( not ( = ?auto_57449 ?auto_57446 ) ) ( HOIST-AT ?auto_57447 ?auto_57449 ) ( not ( = ?auto_57448 ?auto_57447 ) ) ( AVAILABLE ?auto_57447 ) ( SURFACE-AT ?auto_57443 ?auto_57449 ) ( ON ?auto_57443 ?auto_57451 ) ( CLEAR ?auto_57443 ) ( not ( = ?auto_57443 ?auto_57451 ) ) ( not ( = ?auto_57444 ?auto_57451 ) ) ( SURFACE-AT ?auto_57445 ?auto_57446 ) ( CLEAR ?auto_57445 ) ( IS-CRATE ?auto_57444 ) ( not ( = ?auto_57443 ?auto_57445 ) ) ( not ( = ?auto_57444 ?auto_57445 ) ) ( not ( = ?auto_57451 ?auto_57445 ) ) ( AVAILABLE ?auto_57448 ) ( IN ?auto_57444 ?auto_57450 ) ( TRUCK-AT ?auto_57450 ?auto_57449 ) )
    :subtasks
    ( ( !DRIVE ?auto_57450 ?auto_57449 ?auto_57446 )
      ( MAKE-ON ?auto_57443 ?auto_57444 )
      ( MAKE-ON-VERIFY ?auto_57443 ?auto_57444 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57452 - SURFACE
      ?auto_57453 - SURFACE
    )
    :vars
    (
      ?auto_57460 - HOIST
      ?auto_57454 - PLACE
      ?auto_57457 - PLACE
      ?auto_57459 - HOIST
      ?auto_57458 - SURFACE
      ?auto_57456 - SURFACE
      ?auto_57455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57460 ?auto_57454 ) ( IS-CRATE ?auto_57452 ) ( not ( = ?auto_57452 ?auto_57453 ) ) ( not ( = ?auto_57457 ?auto_57454 ) ) ( HOIST-AT ?auto_57459 ?auto_57457 ) ( not ( = ?auto_57460 ?auto_57459 ) ) ( SURFACE-AT ?auto_57452 ?auto_57457 ) ( ON ?auto_57452 ?auto_57458 ) ( CLEAR ?auto_57452 ) ( not ( = ?auto_57452 ?auto_57458 ) ) ( not ( = ?auto_57453 ?auto_57458 ) ) ( SURFACE-AT ?auto_57456 ?auto_57454 ) ( CLEAR ?auto_57456 ) ( IS-CRATE ?auto_57453 ) ( not ( = ?auto_57452 ?auto_57456 ) ) ( not ( = ?auto_57453 ?auto_57456 ) ) ( not ( = ?auto_57458 ?auto_57456 ) ) ( AVAILABLE ?auto_57460 ) ( TRUCK-AT ?auto_57455 ?auto_57457 ) ( LIFTING ?auto_57459 ?auto_57453 ) )
    :subtasks
    ( ( !LOAD ?auto_57459 ?auto_57453 ?auto_57455 ?auto_57457 )
      ( MAKE-ON ?auto_57452 ?auto_57453 )
      ( MAKE-ON-VERIFY ?auto_57452 ?auto_57453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57461 - SURFACE
      ?auto_57462 - SURFACE
    )
    :vars
    (
      ?auto_57464 - HOIST
      ?auto_57463 - PLACE
      ?auto_57469 - PLACE
      ?auto_57466 - HOIST
      ?auto_57468 - SURFACE
      ?auto_57465 - SURFACE
      ?auto_57467 - TRUCK
      ?auto_57470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57464 ?auto_57463 ) ( IS-CRATE ?auto_57461 ) ( not ( = ?auto_57461 ?auto_57462 ) ) ( not ( = ?auto_57469 ?auto_57463 ) ) ( HOIST-AT ?auto_57466 ?auto_57469 ) ( not ( = ?auto_57464 ?auto_57466 ) ) ( SURFACE-AT ?auto_57461 ?auto_57469 ) ( ON ?auto_57461 ?auto_57468 ) ( CLEAR ?auto_57461 ) ( not ( = ?auto_57461 ?auto_57468 ) ) ( not ( = ?auto_57462 ?auto_57468 ) ) ( SURFACE-AT ?auto_57465 ?auto_57463 ) ( CLEAR ?auto_57465 ) ( IS-CRATE ?auto_57462 ) ( not ( = ?auto_57461 ?auto_57465 ) ) ( not ( = ?auto_57462 ?auto_57465 ) ) ( not ( = ?auto_57468 ?auto_57465 ) ) ( AVAILABLE ?auto_57464 ) ( TRUCK-AT ?auto_57467 ?auto_57469 ) ( AVAILABLE ?auto_57466 ) ( SURFACE-AT ?auto_57462 ?auto_57469 ) ( ON ?auto_57462 ?auto_57470 ) ( CLEAR ?auto_57462 ) ( not ( = ?auto_57461 ?auto_57470 ) ) ( not ( = ?auto_57462 ?auto_57470 ) ) ( not ( = ?auto_57468 ?auto_57470 ) ) ( not ( = ?auto_57465 ?auto_57470 ) ) )
    :subtasks
    ( ( !LIFT ?auto_57466 ?auto_57462 ?auto_57470 ?auto_57469 )
      ( MAKE-ON ?auto_57461 ?auto_57462 )
      ( MAKE-ON-VERIFY ?auto_57461 ?auto_57462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57471 - SURFACE
      ?auto_57472 - SURFACE
    )
    :vars
    (
      ?auto_57480 - HOIST
      ?auto_57479 - PLACE
      ?auto_57475 - PLACE
      ?auto_57474 - HOIST
      ?auto_57478 - SURFACE
      ?auto_57476 - SURFACE
      ?auto_57477 - SURFACE
      ?auto_57473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_57480 ?auto_57479 ) ( IS-CRATE ?auto_57471 ) ( not ( = ?auto_57471 ?auto_57472 ) ) ( not ( = ?auto_57475 ?auto_57479 ) ) ( HOIST-AT ?auto_57474 ?auto_57475 ) ( not ( = ?auto_57480 ?auto_57474 ) ) ( SURFACE-AT ?auto_57471 ?auto_57475 ) ( ON ?auto_57471 ?auto_57478 ) ( CLEAR ?auto_57471 ) ( not ( = ?auto_57471 ?auto_57478 ) ) ( not ( = ?auto_57472 ?auto_57478 ) ) ( SURFACE-AT ?auto_57476 ?auto_57479 ) ( CLEAR ?auto_57476 ) ( IS-CRATE ?auto_57472 ) ( not ( = ?auto_57471 ?auto_57476 ) ) ( not ( = ?auto_57472 ?auto_57476 ) ) ( not ( = ?auto_57478 ?auto_57476 ) ) ( AVAILABLE ?auto_57480 ) ( AVAILABLE ?auto_57474 ) ( SURFACE-AT ?auto_57472 ?auto_57475 ) ( ON ?auto_57472 ?auto_57477 ) ( CLEAR ?auto_57472 ) ( not ( = ?auto_57471 ?auto_57477 ) ) ( not ( = ?auto_57472 ?auto_57477 ) ) ( not ( = ?auto_57478 ?auto_57477 ) ) ( not ( = ?auto_57476 ?auto_57477 ) ) ( TRUCK-AT ?auto_57473 ?auto_57479 ) )
    :subtasks
    ( ( !DRIVE ?auto_57473 ?auto_57479 ?auto_57475 )
      ( MAKE-ON ?auto_57471 ?auto_57472 )
      ( MAKE-ON-VERIFY ?auto_57471 ?auto_57472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57481 - SURFACE
      ?auto_57482 - SURFACE
    )
    :vars
    (
      ?auto_57488 - HOIST
      ?auto_57485 - PLACE
      ?auto_57487 - PLACE
      ?auto_57484 - HOIST
      ?auto_57490 - SURFACE
      ?auto_57483 - SURFACE
      ?auto_57486 - SURFACE
      ?auto_57489 - TRUCK
      ?auto_57491 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57488 ?auto_57485 ) ( IS-CRATE ?auto_57481 ) ( not ( = ?auto_57481 ?auto_57482 ) ) ( not ( = ?auto_57487 ?auto_57485 ) ) ( HOIST-AT ?auto_57484 ?auto_57487 ) ( not ( = ?auto_57488 ?auto_57484 ) ) ( SURFACE-AT ?auto_57481 ?auto_57487 ) ( ON ?auto_57481 ?auto_57490 ) ( CLEAR ?auto_57481 ) ( not ( = ?auto_57481 ?auto_57490 ) ) ( not ( = ?auto_57482 ?auto_57490 ) ) ( IS-CRATE ?auto_57482 ) ( not ( = ?auto_57481 ?auto_57483 ) ) ( not ( = ?auto_57482 ?auto_57483 ) ) ( not ( = ?auto_57490 ?auto_57483 ) ) ( AVAILABLE ?auto_57484 ) ( SURFACE-AT ?auto_57482 ?auto_57487 ) ( ON ?auto_57482 ?auto_57486 ) ( CLEAR ?auto_57482 ) ( not ( = ?auto_57481 ?auto_57486 ) ) ( not ( = ?auto_57482 ?auto_57486 ) ) ( not ( = ?auto_57490 ?auto_57486 ) ) ( not ( = ?auto_57483 ?auto_57486 ) ) ( TRUCK-AT ?auto_57489 ?auto_57485 ) ( SURFACE-AT ?auto_57491 ?auto_57485 ) ( CLEAR ?auto_57491 ) ( LIFTING ?auto_57488 ?auto_57483 ) ( IS-CRATE ?auto_57483 ) ( not ( = ?auto_57481 ?auto_57491 ) ) ( not ( = ?auto_57482 ?auto_57491 ) ) ( not ( = ?auto_57490 ?auto_57491 ) ) ( not ( = ?auto_57483 ?auto_57491 ) ) ( not ( = ?auto_57486 ?auto_57491 ) ) )
    :subtasks
    ( ( !DROP ?auto_57488 ?auto_57483 ?auto_57491 ?auto_57485 )
      ( MAKE-ON ?auto_57481 ?auto_57482 )
      ( MAKE-ON-VERIFY ?auto_57481 ?auto_57482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_57556 - SURFACE
      ?auto_57557 - SURFACE
    )
    :vars
    (
      ?auto_57565 - HOIST
      ?auto_57561 - PLACE
      ?auto_57564 - PLACE
      ?auto_57560 - HOIST
      ?auto_57559 - SURFACE
      ?auto_57562 - SURFACE
      ?auto_57563 - TRUCK
      ?auto_57558 - SURFACE
      ?auto_57566 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_57565 ?auto_57561 ) ( IS-CRATE ?auto_57556 ) ( not ( = ?auto_57556 ?auto_57557 ) ) ( not ( = ?auto_57564 ?auto_57561 ) ) ( HOIST-AT ?auto_57560 ?auto_57564 ) ( not ( = ?auto_57565 ?auto_57560 ) ) ( SURFACE-AT ?auto_57556 ?auto_57564 ) ( ON ?auto_57556 ?auto_57559 ) ( CLEAR ?auto_57556 ) ( not ( = ?auto_57556 ?auto_57559 ) ) ( not ( = ?auto_57557 ?auto_57559 ) ) ( SURFACE-AT ?auto_57562 ?auto_57561 ) ( CLEAR ?auto_57562 ) ( IS-CRATE ?auto_57557 ) ( not ( = ?auto_57556 ?auto_57562 ) ) ( not ( = ?auto_57557 ?auto_57562 ) ) ( not ( = ?auto_57559 ?auto_57562 ) ) ( AVAILABLE ?auto_57565 ) ( TRUCK-AT ?auto_57563 ?auto_57564 ) ( SURFACE-AT ?auto_57557 ?auto_57564 ) ( ON ?auto_57557 ?auto_57558 ) ( CLEAR ?auto_57557 ) ( not ( = ?auto_57556 ?auto_57558 ) ) ( not ( = ?auto_57557 ?auto_57558 ) ) ( not ( = ?auto_57559 ?auto_57558 ) ) ( not ( = ?auto_57562 ?auto_57558 ) ) ( LIFTING ?auto_57560 ?auto_57566 ) ( IS-CRATE ?auto_57566 ) ( not ( = ?auto_57556 ?auto_57566 ) ) ( not ( = ?auto_57557 ?auto_57566 ) ) ( not ( = ?auto_57559 ?auto_57566 ) ) ( not ( = ?auto_57562 ?auto_57566 ) ) ( not ( = ?auto_57558 ?auto_57566 ) ) )
    :subtasks
    ( ( !LOAD ?auto_57560 ?auto_57566 ?auto_57563 ?auto_57564 )
      ( MAKE-ON ?auto_57556 ?auto_57557 )
      ( MAKE-ON-VERIFY ?auto_57556 ?auto_57557 ) )
  )

)

